{ *
  * Copyright (C) 2014 ozok <ozok26@gmail.com>
  *
  * This file is part of TPhotoDownloader.
  *
  * TPhotoDownloader is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
  * (at your option) any later version.
  *
  * TPhotoDownloader is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with TPhotoDownloader.  If not, see <http://www.gnu.org/licenses/>.
  *
  * }

unit UnitPhotoStreamPageCountExtractor;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, JvTypes, Dialogs;

type
  TPCEStatus = (pceDownloading, pceDone);

type
  TPhotoStreamPageCountExtractor = class(TObject)
  private
    FPageDownloader: TJvHttpUrlGrabber;
    FStatus: TPCEStatus;
    FURL: string;
    FErrorMsg: string;
    FPercentage: integer;
    FLastPage: integer;

    procedure PageDownloaderDoneFile(Sender: TObject; FileName: string; FileSize: Integer; Url: string);
    procedure PageDownloaderProgress(Sender: TObject; Position, TotalSize: Int64; Url: string; var Continue: Boolean);
    function RemoveWith(const Str: string): string;
    function GetLastPage(const Str: string): Integer;
  public
    property ExtractorStatus: TPCEStatus read FStatus;
    property ErrorMessage: string read FErrorMsg;
    property Percentage: integer read FPercentage;
    property LastPage: integer read FLastPage;

    constructor Create(const Url: string; const TempFile: string);
    destructor Destroy(); override;

    procedure Start();
    procedure Stop();
  end;

implementation

{ TPhotoStreamPageCountExtractor }

constructor TPhotoStreamPageCountExtractor.Create(const Url: string; const TempFile: string);
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
    FileName := TempFile;
    Agent := '';
  end;

  FStatus := pceDownloading;
  FURL := RemoveWith(Url);
  FErrorMsg := '';
  FPercentage := 0;
  FLastPage := 1;
end;

destructor TPhotoStreamPageCountExtractor.Destroy;
begin
  inherited Destroy;
  FPageDownloader.Free;
end;

function TPhotoStreamPageCountExtractor.GetLastPage(const Str: string): Integer;
var
  Pos1, Pos2: integer;
  LTmpStr: string;
  LtmpInt: integer;
begin
  Result := 1;
  LTmpStr := Str;
  Pos1 := Pos('">', LTmpStr);
  Pos2 := Pos('</a>', LTmpStr);
  if Pos2 > Pos1 then
  begin
    LTmpStr := Trim(Copy(LTmpStr, Pos1 + 2, Pos2 - Pos1 - 2));
    if TryStrToInt(LTmpStr, LtmpInt) then
    begin
      Result := LtmpInt;
    end;
  end;
end;

procedure TPhotoStreamPageCountExtractor.PageDownloaderDoneFile(Sender: TObject; FileName: string; FileSize: Integer; Url: string);
const
  PageSpanStartStr = '<span class="pages">';
  PageSpanEndStr = '<a class="rapidnofollow"';
var
  LTmpStr: TStreamReader;
  LLine: string;
  LFoundStart: Boolean;
  LFoundPageLinks: TStringList;
begin
  FPercentage := 100;
  LFoundStart := False;

  FStatus := pceDownloading;
  LFoundPageLinks := TStringList.Create;
  try
    if FileExists(FileName) then
    begin
      LTmpStr := TStreamReader.Create(FileName, True);
      try
        while not LTmpStr.EndOfStream do
        begin
          LLine := Trim(LTmpStr.ReadLine);

          if Copy(LLine, 1, Length(PageSpanStartStr)) = PageSpanStartStr then
          begin
            LFoundStart := True;
          end;

          if LFoundStart then
          begin
            if Copy(LLine, 1, Length(PageSpanEndStr)) = PageSpanEndStr then
            begin
              LFoundPageLinks.Add(LLine);
            end;
          end;
        end;
      finally
        LTmpStr.Close;
        FreeAndNil(LTmpStr);

        if LFoundPageLinks.Count > 0 then
        begin
          FLastPage := GetLastPage(LFoundPageLinks[LFoundPageLinks.Count - 1]);
        end;
      end;
    end;
  finally
    LFoundPageLinks.Free;
    FStatus := pceDone;
  end;

end;

procedure TPhotoStreamPageCountExtractor.PageDownloaderProgress(Sender: TObject; Position, TotalSize: Int64; Url: string; var Continue: Boolean);
begin
  if TotalSize > 0 then
    FPercentage := (100 * Position) div TotalSize
end;

function TPhotoStreamPageCountExtractor.RemoveWith(const Str: string): string;
const
  LWITHSTR = 'with';
var
  LWithPos: integer;
begin
  Result := Str;
  LWithPos := Pos(LWITHSTR, Str);
  if LWithPos > 0 then
  begin
    Result := Trim(Copy(Str, 1, LWithPos - 1));
  end;
end;

procedure TPhotoStreamPageCountExtractor.Start();
begin
  FPageDownloader.Url := FURL;
  FPageDownloader.Start;
end;

procedure TPhotoStreamPageCountExtractor.Stop;
begin
  if FStatus = pceDownloading then
  begin
    while not(FPageDownloader.Status <> gsStopped) do
    begin
      FPageDownloader.Stop;
      Sleep(10);
    end;
  end;
end;

end.
