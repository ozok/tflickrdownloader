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

unit UnitImagePagesExtractor;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, JvTypes, Dialogs, JvHtmlParser;

type
  TIPEStatus = (iesDownloading, iesDone, iesError);

type
  TImagePagesExtractor = class(TObject)
  private
    FPageDownloader: TJvHttpUrlGrabber;
    FHtmlParser: TJvHTMLParser;
    FStatus: TIPEStatus;
    FURL: string;
    FErrorMsg: string;
    FPercentage: integer;
    FOutputFilePath: string;
    FFileSize: int64;
    FStatusText: string;
    FGroup: Boolean;
    FGroupLinks: TStringList;

    procedure PageDownloaderDoneFile(Sender: TObject; FileName: string;
      FileSize: Integer; Url: string);
    procedure PageDownloaderProgress(Sender: TObject;
      Position, TotalSize: Int64; Url: string; var Continue: Boolean);
    procedure PageDownloaderError(Sender: TObject; ErrorMsg: string);
    procedure PageDownloaderStatusChange(Sender: TObject);
    procedure PageDownloaderRequestSent(Sender: TObject);
    procedure PageDownloaderRequestComplete(Sender: TObject);
    procedure PageDownloaderRedirect(Sender: TObject);
    procedure PageDownloaderReceivingResponse(Sender: TObject);
    procedure PageDownloaderNameResolved(Sender: TObject);
    procedure PageDownloaderConnectedToServer(Sender: TObject);
    procedure PageDownloaderConnectingToServer(Sender: TObject);
    procedure PageDownloaderConnectionClosed(Sender: TObject);
    procedure PageDownloaderClosingConnection(Sender: TObject);
    procedure PageDownloaderResponseReceived(Sender: TObject);
    procedure PageDownloaderSendingRequest(Sender: TObject);
    procedure KeyFound(Sender: TObject; Key, Results, OriginalLine: string);

    function RemoveHTMLTags(const Str: string): string;
    function RemoveWith(const Str: string):string;
    procedure WriteJSONData(const JSONStr: string);
    function IsLinkAlreadyAdded(const Link: string):Boolean;
    function GetGroupLink(const Str: string):string;
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

constructor TImagePagesExtractor.Create(const Url: string;
  const TempFile: string; const OutputFilePath: string);
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
    OnError := PageDownloaderError;
    OnNameResolved := PageDownloaderNameResolved;
    OnConnectingToServer := PageDownloaderConnectingToServer;
    OnConnectedToServer := PageDownloaderConnectedToServer;
    OnSendingRequest := PageDownloaderSendingRequest;
    OnRequestSent := PageDownloaderRequestSent;
    OnRequestComplete := PageDownloaderRequestComplete;
    OnReceivingResponse := PageDownloaderReceivingResponse;
    OnResponseReceived := PageDownloaderResponseReceived;
    OnClosingConnection := PageDownloaderClosingConnection;
    OnConnectionClosed := PageDownloaderConnectionClosed;
    OnRedirect := PageDownloaderRedirect;
    OnStatusChange := PageDownloaderStatusChange;
    OutputMode := omFile;
    FileName := TempFile;
    Agent := '';
  end;
  FHtmlParser := TJvHTMLParser.Create(nil);
  FHtmlParser.OnKeyFound := KeyFound;
//  FHtmlParser.Parser.Add('URL');
  FHtmlParser.ClearConditions;
  FHtmlParser.AddCondition('','><a data-track="photo-click" href="', '" title="" class=',-1);

  // decide if link belongs to a group
  FGroup := ContainsText(Url, '/groups/');

  FOutputFilePath := OutputFilePath;
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
  First = '<a data-track="photo-click" href="';
var
  LLine: string;
  LPos: Integer;
begin
  Result := Str;
  LLine := Trim(Str);
  LLine := StringReplace(LLine, First, '', [rfReplaceAll]);
  LPos := PosEx('"', LLine);
  if LPos > 0 then
  begin
    Result := copy(LLine, 1, LPos);
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

procedure TImagePagesExtractor.KeyFound(Sender: TObject; Key, Results, OriginalLine: string);
begin
  if Length(Results) > 0 then
  begin
  FGroupLinks.Add(Results);
  end;
end;

procedure TImagePagesExtractor.PageDownloaderClosingConnection(Sender: TObject);
begin
  FStatusText := 'Closing connection';
end;

procedure TImagePagesExtractor.PageDownloaderConnectedToServer(Sender: TObject);
begin
  FStatusText := 'Connected to server';
end;

procedure TImagePagesExtractor.PageDownloaderConnectingToServer(
  Sender: TObject);
begin
   FStatusText := 'Connecting to server';
end;

procedure TImagePagesExtractor.PageDownloaderConnectionClosed(Sender: TObject);
begin
  FStatusText := 'Connection closed';
end;

procedure TImagePagesExtractor.PageDownloaderDoneFile(Sender: TObject; FileName: string; FileSize: Integer; Url: string);
const
  PhotoContainerStr = '<span class="photo_container pc_ju">';
  GroupContainerStr = '<div id="pool-photos" class="ju  photo-display-container clearfix"';
  GroupLinkStr = '<div class="pool-photo photo-display-item"';
  YLIST = 'Y.listData = ';
var
  LTmpStr: TStreamReader;
  LStreamWriter: TStreamWriter;
  LLine: string;
  LJSONStr: string;
//  LTmpList: TStringList;
//  LLine2: string;
//  LGroupLinkLine: string;
begin
  FFileSize := FileSize;
  FPercentage := 100;
  LJSONStr := '';

  FStatus := iesDownloading;
  try
    if FileExists(FileName) then
    begin
      if FGroup then
      begin
        FHtmlParser.FileName := FileName;
        FHtmlParser.AnalyseFile;
        FGroupLinks.SaveToFile(FOutputFilePath, TEncoding.UTF8);
      end
      else
      begin
        LTmpStr := TStreamReader.Create(FileName, True);
        LStreamWriter := TStreamWriter.Create(FOutputFilePath, False);
        try
          // normal stream
          while not LTmpStr.EndOfStream do
          begin
            LLine := Trim(LTmpStr.ReadLine);
            if Copy(LLine, 1, Length(PhotoContainerStr)) = PhotoContainerStr then
            begin
              LStreamWriter.WriteLine('www.flickr.com' + RemoveHTMLTags(LTmpStr.ReadLine));
            end
            else if Copy(LLine, 1, Length(YLIST)) = YLIST then
            begin
              LJSONStr := ReplaceStr(LLine, YLIST, '');
            end
          end;
        finally
          LStreamWriter.Flush;
          LStreamWriter.Close;
          LTmpStr.Close;
          FreeAndNil(LTmpStr);
          FreeAndNil(LStreamWriter);
        end;
      end;

    end;

    // try to extract data from json
    if Length(LJSONStr) > 0 then
    begin
      WriteJSONData(LJSONStr);
    end;
  finally
    FStatus := iesDone;
  end;

end;

procedure TImagePagesExtractor.PageDownloaderError(Sender: TObject;
  ErrorMsg: string);
begin
  Self.Stop;
  FErrorMsg := ErrorMsg;
end;

procedure TImagePagesExtractor.PageDownloaderNameResolved(Sender: TObject);
begin
  FStatusText := 'Name resolved';
end;

procedure TImagePagesExtractor.PageDownloaderProgress(Sender: TObject;
  Position, TotalSize: Int64; Url: string; var Continue: Boolean);
begin
  if TotalSize > 0 then
    FPercentage := (100 * Position) div TotalSize
end;

procedure TImagePagesExtractor.PageDownloaderReceivingResponse(Sender: TObject);
begin
   FStatusText := 'Receiving response';
end;

procedure TImagePagesExtractor.PageDownloaderRedirect(Sender: TObject);
begin
   FStatusText := 'Downloader redirect';
end;

procedure TImagePagesExtractor.PageDownloaderRequestComplete(Sender: TObject);
begin
    FStatusText := 'Request complete';
end;

procedure TImagePagesExtractor.PageDownloaderRequestSent(Sender: TObject);
begin
   FStatusText := 'Request sent';
end;

procedure TImagePagesExtractor.PageDownloaderResponseReceived(Sender: TObject);
begin
    FStatusText := 'Response received';
end;

procedure TImagePagesExtractor.PageDownloaderSendingRequest(Sender: TObject);
begin
    FStatusText := 'Sending request';
end;

procedure TImagePagesExtractor.PageDownloaderStatusChange(Sender: TObject);
begin
    FStatusText := 'Status changed';
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
  FPageDownloader.Url := FURL;
  FPageDownloader.Start;
end;

procedure TImagePagesExtractor.Stop;
begin
  if FStatus = iesDownloading then
  begin
    while not (FPageDownloader.Status <> gsStopped) do
    begin
      FPageDownloader.Stop;
      Sleep(10);
    end;
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
        LLink := 'www.flickr.com' + StringReplace(LTmpLst[i+2], '\', '', [rfReplaceAll]);
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

end.
