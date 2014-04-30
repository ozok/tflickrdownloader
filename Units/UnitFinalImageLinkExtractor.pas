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

uses Classes, Windows, SysUtils, Messages, StrUtils, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, JvTypes;

type
  TEStatus = (esDownloading, esDone);

type
  TFinalLinkExtractor = class(TObject)
  private
    FPageDownloader: TJvHttpUrlGrabber;
    FStatus: TEStatus;
    FURL: string;
    FErrorMsg: string;
    FPercentage: integer;
    FPhotoLink: string;
    FFileSize: int64;
    FTitle: string;

    procedure PageDownloaderDoneFile(Sender: TObject; FileName: string;
      FileSize: Integer; Url: string);
    procedure PageDownloaderProgress(Sender: TObject;
      Position, TotalSize: Int64; Url: string; var Continue: Boolean);
    function RemoveHTMLTags(const Str: string): string;
    function CleanTheTitle(const Title: string):string;
    function RemoveInvalidChars(const Title: string):string;
  public
    property ExtractorStatus: TEStatus read FStatus;
    property ErrorMessage: string read FErrorMsg;
    property PhotoLink: string read FPhotoLink;
    property Percentage: integer read FPercentage;
    property FileSize: int64 read FFileSize;
    property Title: string read FTitle;

    constructor Create(const Url: string; const OutputFileName: string);
    destructor Destroy(); override;

    procedure Start(const User: string; const Pass: string);
    procedure Stop();
  end;

implementation

{ TFinalLinkExtractor }

function TFinalLinkExtractor.CleanTheTitle(const Title: string): string;
begin
  Result := StringReplace(ReplaceStr(ReplaceStr(Title, '<title>All sizes | ', ''), ' | Flickr - Photo Sharing!</title>', ''), '&amp;', '&', [rfReplaceAll]);
end;

constructor TFinalLinkExtractor.Create(const Url: string;
  const OutputFileName: string);
var
  Def: TJvCustomUrlGrabberDefaultProperties;
begin
  inherited Create;
  Def := TJvCustomUrlGrabberDefaultProperties.Create(nil);
  FPageDownloader := TJvHttpUrlGrabber.Create(nil, '', Def);
  with FPageDownloader do
  begin
    OnDoneFile := PageDownloaderDoneFile;
    OnProgress := PageDownloaderProgress;
    OutputMode := omFile;
    FileName := OutputFileName;
    Agent := '';
  end;

  FStatus := esDownloading;
  FURL := Url;
  FErrorMsg := '';
  FPercentage := 0;
  FTitle := '';
end;

destructor TFinalLinkExtractor.Destroy;
begin
  inherited Destroy;
  FPageDownloader.Free;
end;

procedure TFinalLinkExtractor.PageDownloaderDoneFile(Sender: TObject;
  FileName: string; FileSize: Integer; Url: string);
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
    if FileExists(FileName) then
    begin
      LTmpStr := TStreamReader.Create(FileName, True);
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
        FreeAndNil(LTmpStr);
      end;
    end;
  finally
    FStatus := esDone;
  end;

end;

procedure TFinalLinkExtractor.PageDownloaderProgress(Sender: TObject;
  Position, TotalSize: Int64; Url: string; var Continue: Boolean);
begin
  if TotalSize > 0 then
    FPercentage := (100 * Position) div TotalSize
end;

function TFinalLinkExtractor.RemoveHTMLTags(const Str: string): string;
begin
  Result := Str;
  Result := ReplaceStr(Result, '">', '');
  Result := ReplaceStr(Result, '<img src="', '');
  Result := ReplaceStr(Result, '<a href="', '');
  Result := ReplaceStr(Result , 'https//', '');
  Result := ReplaceStr(Result , 'https://', '');
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

procedure TFinalLinkExtractor.Start(const User: string; const Pass: string);
begin
  FPageDownloader.UserName := User;
  FPageDownloader.Password := Pass;
  FPageDownloader.Url := FURL;
  FPageDownloader.Start;
end;

procedure TFinalLinkExtractor.Stop;
begin
  if FStatus = esDownloading then
  begin
    while not (FPageDownloader.Status <> gsStopped) do
    begin
      FPageDownloader.Stop;
      Sleep(10);
    end;
  end;
end;

end.
