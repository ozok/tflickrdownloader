program GroupImagesExtractor;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitDownloader in 'Units\UnitDownloader.pas',
  System.Classes,
  StrUtils;

var
  FGroupID: string;
  FTempFolder: string;
  FDownloader: TDownloader;
  FImageLinks: TStringList;

function RemoveHTMLTags(const Str: string): string;
begin
  Result := Str;
  Result := ReplaceStr(Result, '">', '');
  Result := ReplaceStr(Result, '<img src="', '');
  Result := ReplaceStr(Result, '<a href="', '');
  // Result := ReplaceStr(Result, 'https//', '');
  // Result := ReplaceStr(Result, 'https://', '');
  Result := Trim(Result)
end;

function LineToLink(const Line: string): string;
const
  URL_START = 'https://www.flickr.com/photos/'; // +owner/photo_id
  StartStr = '<photo id="';
  OwnerStr = '" owner="';
  Secret = '" secret="';
var
  LTmpStr: string;
  LPos1, LPos2, LPos3: integer;
  LOwner, LPhotoID: string;
begin
  LTmpStr := Trim(Line);
  Result := LTmpStr;
  LPos1 := Pos(StartStr, LTmpStr);
  LPos2 := Pos(OwnerStr, LTmpStr);
  LPos3 := Pos(Secret, LTmpStr);
  if (LPos2 > LPos1) and (LPos3 > LPos2) then
  begin
    LPhotoID := Copy(LTmpStr, Length(StartStr) + 1, LPos2 - Length(StartStr) - 1);
    LOwner := Copy(LTmpStr, LPos2 + Length(OwnerStr), LPos3 - LPos2 - Length(OwnerStr));
    Result := URL_START + LOwner + '/' + LPhotoID;
  end;
  Result := RemoveHTMLTags(Result);
end;

procedure Run;
const
  LineStartStr = '<photo id="';
var
  LMS: TStringList;
  LLine: string;
  I, j: Integer;
begin
  LMS := TStringList.Create;
  FImageLinks := TStringList.Create;
  try
    for I := 1 to MaxInt - 1 do
    begin
      LMS.Clear;
      FDownloader.URL := 'https://api.flickr.com/services/rest/?method=flickr.groups.pools.getPhotos&api_key=06b9aac058f87d628bde8c49495c0971&group_id=' + FGroupID + '&page=' + FloatToStr(i);;
      if FileExists(FTempFolder + '\group.txt') then
      begin
        DeleteFile(FTempFolder + '\group.txt');
      end;
      FDownloader.OutputFileName := FTempFolder + '\group.txt';
      FDownloader.Start;
      // wait until downloading is done
      while FDownloader.Status = ds2Downloading do
      begin
        Sleep(50);
      end;
      LMS.LoadFromFile(FTempFolder + '\group.txt');
      if LMS.Count = 4 then
      begin
        Break;
      end
      else
      begin
        for j := 0 to LMS.Count - 1 do
        begin
          LLine := Trim(LMS[j]);
          if LineStartStr = Copy(LLine, 1, Length(LineStartStr)) then
          begin
            FImageLinks.Add(LineToLink(LLine));
          end;
        end;
      end;
      Writeln('Found ' + FloatToStr(FImageLinks.Count) + ' photos so far.');
    end;
  finally
    FImageLinks.SaveToFile(FTempFolder + '\groupimagelinks.txt', TEncoding.UTF8);
    LMS.Free;
    FImageLinks.Free;
  end;
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    if ParamCount = 2 then
    begin
      FGroupID := ParamStr(1);
      FTempFolder := ParamStr(2);
      if not DirectoryExists(FTempFolder) then
      begin
        ForceDirectories(FTempFolder);
      end;
      if DirectoryExists(FTempFolder) then
      begin
        FDownloader := TDownloader.Create;
        try
          Run;
        finally
          FDownloader.Free;
        end;
      end
      else
      begin
        Writeln('Unable to create temp folder.');
      end;
    end
    else
    begin
      Writeln('Wrong number of params: ' + FloatToStr(ParamCount));
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
