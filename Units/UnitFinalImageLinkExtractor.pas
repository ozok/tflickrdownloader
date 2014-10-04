{ *
  * Copyright (C) 2014 ozok <ozok26@gmail.com>
  *
  * This file is part of TFlickrDownloader.
  *
  * TFlickrDownloader is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
  * (at your option) any later version.
  *
  * TFlickrDownloader is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with TFlickrDownloader.  If not, see <http://www.gnu.org/licenses/>.
  *
  * }

unit UnitFinalImageLinkExtractor;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, UnitDownloader;

type
  TEStatus = (esDownloading, esDone);

type
  TFinalLinkExtractor = class(TObject)
  private
    FPageDownloader: TDownloader;
    FStatus: TEStatus;
    FURL: string;
    FOutputFileName: string;
    FErrorMsg: string;
    FPercentage: integer;
    FPhotoLink: string;
    FFileSize: int64;
    FTitle: string;

    function RemoveHTMLTags(const Str: string): string;
    function CleanTheTitle(const Title: string):string;
    function RemoveInvalidChars(const Title: string):string;
    procedure ParsePage;
  public
    property ExtractorStatus: TEStatus read FStatus;
    property ErrorMessage: string read FErrorMsg;
    property PhotoLink: string read FPhotoLink;
    property Percentage: integer read FPercentage;
    property FileSize: int64 read FFileSize;
    property Title: string read FTitle;

    constructor Create(const Url: string; const OutputFileName: string);
    destructor Destroy(); override;

    procedure Start(const TempFileName: string);
    procedure Stop();
  end;

implementation

{ TFinalLinkExtractor }

function TFinalLinkExtractor.CleanTheTitle(const Title: string): string;
begin
  Result := StringReplace(ReplaceStr(ReplaceStr(Title, '<title>All sizes | ', ''), ' | Flickr - Photo Sharing!</title>', ''), '&amp;', '&', [rfReplaceAll]);
end;

constructor TFinalLinkExtractor.Create(const Url: string; const OutputFileName: string);
begin
  inherited Create;
  FPageDownloader := TDownloader.Create;
  FStatus := esDownloading;
  FURL := Url;
  FOutputFileName := OutputFileName;
  FErrorMsg := '';
  FPercentage := 0;
  FTitle := '';
end;

destructor TFinalLinkExtractor.Destroy;
begin
  inherited Destroy;
  FPageDownloader.Free;
end;

procedure TFinalLinkExtractor.ParsePage;
  const
  SpaceballSTR = '<div class="spaceball"';
  DownloadBtnSTR = '<dt>Download</dt>';
  TITLESTR = '<title>';
var
  LTmpStr: TStreamReader;
  LLine: string;
begin
  FFileSize := FileSize;
  FPercentage := 100;

  FStatus := esDownloading;
  try
    if FileExists(FPageDownloader.OutputFileName) then
    begin
      LTmpStr := TStreamReader.Create(FPageDownloader.OutputFileName);
      try
        while not LTmpStr.EndOfStream do
        begin
          LLine := Trim(LTmpStr.ReadLine);

          if Copy(LLine, 1, Length(SpaceballSTR)) = SpaceballSTR then
          begin
            FPhotoLink := RemoveHTMLTags(LTmpStr.ReadLine);
            Break;
          end
          else if Copy(LLine, 1, Length(DownloadBtnSTR)) = DownloadBtnSTR  then
          begin
            LTmpStr.ReadLine;
            FPhotoLink := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(TITLESTR)) = TITLESTR  then
          begin
            FTitle := RemoveInvalidChars(CleanTheTitle(LLine));
          end;
        end;
      finally
        LTmpStr.Close;
        LTmpStr.Free;
      end;
    end;
  finally
    FPhotoLink := Trim(FPhotoLink);
    FStatus := esDone;
  end;
end;

function TFinalLinkExtractor.RemoveHTMLTags(const Str: string): string;
begin
  Result := Str;
  Result := ReplaceStr(Result, '">', '');
  Result := ReplaceStr(Result, '<img src="', '');
  Result := ReplaceStr(Result, '<a href="', '');
//  Result := ReplaceStr(Result , 'https//', '');
//  Result := ReplaceStr(Result , 'https://', '');
  Result := Trim(Result)
end;

function TFinalLinkExtractor.RemoveInvalidChars(const Title: string): string;
const
  InvalidCharacters: set of char = ['\', '/', ':', '*', '?', '"', '<', '>', '|'];
var
  Tmp: string;
  I: Integer;
begin
  Result := Title;
  Tmp := '';
  for I := 1 to Length(Title) do
  begin
    if not CharInSet(Title[i], InvalidCharacters) then
    begin
      Tmp := Tmp + Title[i];
    end;
  end;
  Result := Tmp;
end;

procedure TFinalLinkExtractor.Start(const TempFileName: string);
begin
  FStatus := esDownloading;
  try
    FPageDownloader.URL := FURL;
    if FileExists(TempFileName) then
    begin
      DeleteFile(TempFileName);
    end;
    FPageDownloader.OutputFileName := TempFileName;
    FPageDownloader.Start;  
    // wait until downloading is done
    while FPageDownloader.Status = ds2Downloading do
    begin
      Sleep(50);
    end;
    FFileSize := FPageDownloader.FileSize;
    ParsePage;
  finally
    FStatus := esDone;
  end;
end;

procedure TFinalLinkExtractor.Stop;
begin
  if FStatus = esDownloading then
  begin
    FPageDownloader.Stop;
  end;
end;

end.
