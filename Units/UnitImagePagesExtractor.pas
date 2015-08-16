{ *
  * Copyright (C) 2014-2015 ozok <ozok26@gmail.com>
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

unit UnitImagePagesExtractor;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, System.Types, UnitDownloader;

type
  TIPEStatus = (iesDownloading, iesDone, iesError);

type
  TImagePagesExtractor = class(TObject)
  private
    FPageDownloader: TDownloader;
    FStatus: TIPEStatus;
    FURL: string;
    FErrorMsg: string;
    FPercentage: integer;
    FOutputFilePath: string;
    FFileSize: int64;
    FStatusText: string;
    FGroup: Boolean;
    FTempFile: string;
    FGroupLinks: TStringList;

    function RemoveHTMLTags(const Str: string): string;
    function RemoveWith(const Str: string):string;
    procedure WriteJSONData(const JSONStr: string);
    procedure WriteJSONData2(const JSONStr: string);
    function IsLinkAlreadyAdded(const Link: string):Boolean;
    function GetGroupLink(const Str: string):string;
    procedure ParsePage;
  public
    property ExtractorStatus: TIPEStatus read FStatus;
    property ErrorMessage: string read FErrorMsg;
    property Percentage: integer read FPercentage;
    property FileSize: int64 read FFileSize;
    property StatusText: string read FStatusText;

    constructor Create(const Url: string; const TempFile: string; const OutputFilePath: string);
    destructor Destroy(); override;

    procedure Start();
    procedure Stop();
  end;

implementation

{ TImagePagesExtractor }

constructor TImagePagesExtractor.Create(const Url: string; const TempFile: string; const OutputFilePath: string);
begin
  inherited Create;
  FPageDownloader := TDownloader.Create;
  // decide if link belongs to a group
  FGroup := ContainsText(Url, '/groups/');

  FOutputFilePath := OutputFilePath;
  FTempFile := TempFile;
  FStatus := iesDownloading;
  FURL := RemoveWith(Url);
  FErrorMsg := '';
  FPercentage := 0;
  FGroupLinks := TStringList.Create;
end;

destructor TImagePagesExtractor.Destroy;
begin
  inherited Destroy;
  FPageDownloader.Free;
  FGroupLinks.Free;
end;

function TImagePagesExtractor.GetGroupLink(const Str: string): string;
const
//  EndStr = '" title="';
  EndStr = 'in/pool';
var
  LLine: string;
  LPos: Integer;
begin
  LLine := Trim(Str);
  Result := LLine;
  LPos := Pos(EndStr, Str);
  if LPos > 0 then
  begin
    Result := copy(LLine, 1, LPos-1);
  end;
end;

function TImagePagesExtractor.IsLinkAlreadyAdded(const Link: string): Boolean;
var
  LStremReader: TStreamReader;
begin
  Result :=  False;
  LStremReader := TStreamReader.Create(FOutputFilePath, True);
  try
    while not LStremReader.EndOfStream do
    begin
      if Link = LStremReader.ReadLine then
      begin
        Result := True;
        Break;
      end;
    end;
  finally
    LStremReader.Close;
    FreeAndNil(LStremReader);
  end;
end;


procedure TImagePagesExtractor.ParsePage;
const
  PhotoContainerStr = '<span class="photo_container pc_ju">';
  PhotoContainerStrNew = 'modelExport: ';
  GroupContainerStr = '<div id="photo-display-container">';
  GroupLinkStartStr = 'href="/photos/';
  YLIST = 'Y.listData = ';
var
  LTmpStr: TStreamReader;
  LStreamWriter: TStreamWriter;
  LLine: string;
  LJSONStr: string;
  LJSONStr2: string;
  I: Integer;
//  LTmpList: TStringList;
//  LLine2: string;
//  LGroupLinkLine: string;
begin
  FFileSize := FileSize;
  FPercentage := 100;
  LJSONStr := '';

  FStatus := iesDownloading;
  try
    if FileExists(FTempFile) then
    begin
      LTmpStr := TStreamReader.Create(FTempFile, True);
      LStreamWriter := TStreamWriter.Create(FOutputFilePath, False);
      try
        // normal stream
        while not LTmpStr.EndOfStream do
        begin
          LLine := Trim(LTmpStr.ReadLine);
          if FGroup then
          begin
            if ContainsText(LLine, GroupLinkStartStr) then
            begin
              FGroupLinks.Clear;
              FGroupLinks.LineBreak := GroupLinkStartStr;
              FGroupLinks.Text := LLine;
              for I := 0 to FGroupLinks.Count-1 do
              begin
                if ContainsText(FGroupLinks[i], '" title="') and (not ContainsText(FGroupLinks[i], 'owner')) then
                begin
                  LStreamWriter.WriteLine('https://www.flickr.com/photos/' + RemoveHTMLTags(GetGroupLink(FGroupLinks[i])));
                end;
              end;
            end;
          end
          else
          begin
            if (Copy(LLine, 1, Length(PhotoContainerStr)) = PhotoContainerStr) then
            begin
              LStreamWriter.WriteLine('https://www.flickr.com' + RemoveHTMLTags(LTmpStr.ReadLine));
            end
            else if Copy(LLine, 1, Length(YLIST)) = YLIST then
            begin
              LJSONStr := ReplaceStr(LLine, YLIST, '');
            end
            else if (Copy(LLine, 1, Length(PhotoContainerStrNew)) = PhotoContainerStrNew) then
            begin
              LJSONStr2 := ReplaceStr(LLine, PhotoContainerStrNew, '');
            end;
          end;
        end;
      finally
        LStreamWriter.Flush;
        LStreamWriter.Close;
        LTmpStr.Close;
        FreeAndNil(LTmpStr);
        FreeAndNil(LStreamWriter);
      end;
    end;

    // try to extract data from json
    if Length(LJSONStr) > 0 then
    begin
      WriteJSONData(LJSONStr);
    end;
    if LJSONStr2.Length > 0 then
    begin
      WriteJSONData2(LJSONStr2);
    end;
  finally
    FStatus := iesDone;
  end;
end;

function TImagePagesExtractor.RemoveHTMLTags(const Str: string): string;
const
  HREF = 'href="';
  TITLE = 'title="';
var
  LHrefPos, LTitlePos: integer;
begin
  Result := Str;
  LHrefPos := Pos(HREF, Str);
  LTitlePos := Pos(TITLE, Str);
  if LTitlePos > LHrefPos then
  begin
    Result := Trim(RemoveWith(Copy(Str, LHrefPos+Length(HREF), LTitlePos-LHrefPos-2-Length(HREF))));
  end;
end;

function TImagePagesExtractor.RemoveWith(const Str: string): string;
const
  LWITHSTR = 'with';
var
  LWithPos: integer;
begin
  Result := Str;
  LWithPos := pos(LWITHSTR, Str);
  if LWithPos > 0 then
  begin
    Result := Trim(Copy(Str, 1, LWithPos-1));
  end;
end;

procedure TImagePagesExtractor.Start();
begin
  FStatus := iesDownloading;
  try
    FPageDownloader.URL := FURL;
    FPageDownloader.OutputFileName := FTempFile;
    // wait until downloading is done
    FPageDownloader.Start;
    while FPageDownloader.Status = ds2Downloading do
    begin
      Sleep(50);
    end;
    FFileSize := FPageDownloader.FileSize;
    ParsePage;
  finally
    FStatus := iesDone;
  end;
end;

procedure TImagePagesExtractor.Stop;
begin
  if FStatus = iesDownloading then
  begin
    FPageDownloader.Stop;
  end;
end;

procedure TImagePagesExtractor.WriteJSONData(const JSONStr: string);
var
  LTmpLst: TStringList;
  LStreamWriter: TStreamWriter;
  I: Integer;
  LLink: string;
begin

  LTmpLst := TStringList.Create;
  try
    LTmpLst.StrictDelimiter := True;
    LTmpLst.Delimiter := '"';
    LTmpLst.DelimitedText := JSONStr;

    for I := 0 to LTmpLst.Count-1 do
    begin
      if 'photo_url' = LTmpLst[i] then
      begin
        LLink := 'https://www.flickr.com' + StringReplace(LTmpLst[i+2], '\', '', [rfReplaceAll]);
        if not IsLinkAlreadyAdded(LLink) then
        begin
          LStreamWriter := TStreamWriter.Create(FOutputFilePath, True);
          try
            LStreamWriter.WriteLine(LLink);
          finally
            LStreamWriter.Flush;
            LStreamWriter.Close;
            FreeAndNil(LStreamWriter);
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(LTmpLst);
  end;

end;

procedure TImagePagesExtractor.WriteJSONData2(const JSONStr: string);
const
  START_STR = 'photo-stats-models';
  END_STR = 'album-privacy-models';
  SETS_STR = 'sets';
var
  LTmpLst: TStringList;
  LStreamWriter: TStreamWriter;
  I: Integer;
  LLink: string;
  LStartIndex: integer;
  LEndIndex: integer;
  LURL: string;
  LPos: integer;
begin

  LTmpLst := TStringList.Create;
  try
    LTmpLst.StrictDelimiter := True;
    LTmpLst.Delimiter := '"';
    LTmpLst.DelimitedText := JSONStr;

    LStartIndex := -1;
    LEndIndex := -1;
    for I := 0 to LTmpLst.Count-1 do
    begin
      if LTmpLst[i].Trim = START_STR then
      begin
        LStartIndex := i;
        Break;
      end;
    end;
    for I := 0 to LTmpLst.Count-1 do
    begin
      if LTmpLst[i].Trim = END_STR then
      begin
        LEndIndex := i;
        Break;
      end;
    end;
    LPos := Pos(SETS_STR, FURL);
    if LPos > 0 then
    begin
      LURL := FURL.Substring(0, LPos-1);
      if LStartIndex < LEndIndex then
      begin
        for I := LStartIndex to LEndIndex do
        begin
          if 'id' = LTmpLst[i] then
          begin
            LLink := LURL + StringReplace(LTmpLst[i+2], '\', '', [rfReplaceAll]);
            if not IsLinkAlreadyAdded(LLink) then
            begin
              LStreamWriter := TStreamWriter.Create(FOutputFilePath, True);
              try
                LStreamWriter.WriteLine(LLink);
              finally
                LStreamWriter.Flush;
                LStreamWriter.Close;
                FreeAndNil(LStreamWriter);
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(LTmpLst);
  end;
end;

end.
