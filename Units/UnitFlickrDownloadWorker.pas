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

unit UnitFlickrDownloadWorker;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, IdBaseComponent,
  IdThreadComponent, Vcl.ComCtrls,
  UnitFinalImageLinkExtractor, UnitImagePagesExtractor, UnitParseImagePage,
  UnitPhotoDownloader, UnitCommonTypes, IdThread, UnitExifWriter,
  Generics.Collections;

type
  TDownloadStatus = (dsDownloading = 0, dsDone = 1);

type
  TDownloadWorker = class(TObject)
  private
    FDownloaderStatus: TDownloadStatus;
    FDownloadThread: TIdThreadComponent;
    FStatusText: string;
    FProgressItem: TListItem;
    FCurrentProgress: integer;
    FPageProgress: integer;
    FPageCount: integer;
    FThreadProgress: integer;
    FProjectInfo: TProjectInfo;
    FDownloadingImages: Boolean;
    FPageList: TStringList;
    FCurrentLink: string;
    FThreadID: ShortInt;
    FProcessedImgCount: integer;
    FPageDownloadedImageCount: integer;
    FDontDoubleDownload: Boolean;
    FPageImageCount: integer;
    FReverseDownload: Boolean;
    FAlreadyDownloaded: integer;
    FFailedDownload: integer;
    FTotalFileSize: int64;
    FFailedList: TList<TFailedItem>;
    FTempFolder: string;
    FMsg: string;

    procedure AddProgressItem();

    procedure DownloadPhotoStreamPage(const PageIndex: integer);

    procedure ThreadRun(Sender: TIdThreadComponent);
    procedure ThreadStopped(Sender: TIdThreadComponent);
    procedure ThreadTerminate(Sender: TIdThreadComponent);
  public
    property DownloaderStatus: TDownloadStatus read FDownloaderStatus;
    property PageList: TStringList read FPageList write FPageList;
    property PageCount: integer read FPageCount;
    property PageProgress: integer read FPageProgress;
    property StatusText: string read FStatusText;
    property CurrentLink: string read FCurrentLink;
    property CurrenProgress: integer read FCurrentProgress;
    property ThreadProgress: integer read FThreadProgress;
    property ThreadID: ShortInt read FThreadID write FThreadID;
    property ProcessedImgCount: integer read FProcessedImgCount;
    property PageDownloadedImageCount: integer read FPageDownloadedImageCount;
    property DontDoubleDownload: Boolean read FDontDoubleDownload write FDontDoubleDownload;
    property PageImageCount: integer read FPageImageCount write FPageImageCount;
    property ReverseDownloadOrder: Boolean read FReverseDownload write FReverseDownload;
    property PageAlreadDownloaded: integer read FAlreadyDownloaded;
    property PageFailedDownload: Integer read FFailedDownload;
    property TotalSize: int64 read FTotalFileSize;
    property FailedItems: TList<TFailedItem> read FFailedList;
    property TempFolder: string read FTempFolder write FTempFolder;

    constructor Create(const ProjectInfo: TProjectInfo);
    destructor Destroy; override;

    procedure Start();
    procedure Stop();
  end;

implementation

{ TDownloadWorker }
uses UnitMain;

procedure TDownloadWorker.AddProgressItem();
begin
  FProgressItem := nil;
  while not Assigned(FProgressItem) do
  begin
    FProgressItem := MainForm.ProgressList.Items.Add;
    if Assigned(FProgressItem) then
    begin
      FProgressItem.Caption := FloatToStr(FProgressItem.Index + 1);
      FProgressItem.SubItems.Add(FMsg);
      FProgressItem.SubItems.Add('[' + FloatToStr(FThreadID + 1) + '] Extracting image link');
      FProgressItem.MakeVisible(False);
      FProgressItem.Selected := True;
      FProgressItem.StateIndex := 2;
      Break;
    end;
  end;
end;

constructor TDownloadWorker.Create(const ProjectInfo: TProjectInfo);
begin
  // download thread
  FDownloadThread := TIdThreadComponent.Create;
  FDownloadThread.Priority := tpIdle;
  FDownloadThread.StopMode := smTerminate;
  FDownloadThread.OnRun := ThreadRun;
  FDownloadThread.OnStopped := ThreadStopped;
  FDownloadThread.OnTerminate := ThreadTerminate;

  // default values
  FDownloaderStatus := dsDownloading;
  FProjectInfo := ProjectInfo;
  FDownloadingImages := True;
  FPageList := TStringList.Create;
  FPageCount := FPageList.Count;
  FPageProgress := 0;
  FPageImageCount := 0;
  FFailedList := TList<TFailedItem>.Create;
end;

destructor TDownloadWorker.Destroy;
begin
  inherited Destroy;
  FDownloadThread.Free;
  FreeAndNil(FPageList);
  FreeAndNil(FFailedList);
end;

procedure TDownloadWorker.DownloadPhotoStreamPage(const PageIndex: integer);
var
  LIPE: TImagePagesExtractor;
  PIP: TImagePageParser;
  LFILE: TFinalLinkExtractor;
  LPD: TPhotoDownloader;
  LImagePageLinksFile: TStreamReader;
  LImagePageStr: string;
  LImageDownloadProgress: integer;
  // LProgressSoFar: integer;
  LPageIndex: string;
  LImagesDownloaded: integer;
  LEW: TExifWriter;
  LFailedItem: TFailedItem;
  LEWState: TExifWriterResult;
begin

  LPageIndex := IntToStr(PageIndex);

  FCurrentProgress := 0;
  FCurrentProgress := 0;
  LImagesDownloaded := 0;
  FPageCount := FPageList.Count;

  if Length(FProjectInfo.PageLink) > 0 then
  begin

    // delete text files from previous pages
    if FileExists(FProjectInfo.OutputFolder + '\' + FProjectInfo.Name + LPageIndex + '_imagepages.txt') then
    begin
      DeleteFile(FProjectInfo.OutputFolder + '\' + FProjectInfo.Name + LPageIndex + '_imagepages.txt')
    end;
    if FileExists(FProjectInfo.OutputFolder + '\' + FProjectInfo.Name + LPageIndex + '_pages.txt') then
    begin
      DeleteFile(FProjectInfo.OutputFolder + '\' + FProjectInfo.Name + LPageIndex + '_pages.txt')
    end;
    if FileExists(FProjectInfo.OutputFolder + '\' + FProjectInfo.Name + LPageIndex + '_photopage.txt') then
    begin
      DeleteFile(FProjectInfo.OutputFolder + '\' + FProjectInfo.Name + LPageIndex + '_photopage.txt')
    end;
    if FileExists(FProjectInfo.OutputFolder + '\' + FProjectInfo.Name + LPageIndex + '_photostreampage.txt') then
    begin
      DeleteFile(FProjectInfo.OutputFolder + '\' + FProjectInfo.Name + LPageIndex + '_photostreampage.txt')
    end;

    // reset image progress
    LImageDownloadProgress := 0;

    FStatusText := 'Downloading the main page [Page: ' + LPageIndex + ']';
    if ContainsText(FProjectInfo.PageLink, '/groups/') then
    begin
      FCurrentLink := FProjectInfo.PageLink;
    end
    else
    begin
      FCurrentLink := FProjectInfo.PageLink + '/page' + LPageIndex;
    end;
    LIPE := TImagePagesExtractor.Create(FCurrentLink, FTempFolder + '\' + FProjectInfo.Name + LPageIndex + '_photostreampage.txt', FTempFolder + '\' + FProjectInfo.Name + LPageIndex + '_pages.txt');
    try

      if FDownloadingImages then
      begin
        LIPE.Start;

        while LIPE.ExtractorStatus = iesDownloading do
        begin
          if not FDownloadingImages then
          begin
            LIPE.Stop;
            Break;
          end;
          FCurrentProgress := LIPE.Percentage;
          FStatusText := LIPE.StatusText;
          Sleep(10);
        end;
        if LIPE.ExtractorStatus = iesError then
        begin
          FStatusText := LIPE.ErrorMessage;
        end
        else if LIPE.ExtractorStatus = iesDone then
        begin
          FStatusText := 'Downloaded the main page [Page: ' + LPageIndex + ']';
        end
        else
        begin
          FStatusText := 'Unknown status'
        end;
        // update total file size
        Inc(FTotalFileSize, LIPE.FileSize div 1024);

        if FDownloadingImages then
        begin
          PIP := TImagePageParser.Create(FTempFolder + '\' + FProjectInfo.Name + LPageIndex + '_pages.txt', FProjectInfo.ImageTypeOption,
            FTempFolder + '\' + FProjectInfo.Name + LPageIndex + '_imagepages.txt');
          try
            PIP.ConvertLinks;
            if FileExists(PIP.ImagePageLinkFilePath) then
            begin
              FStatusText := 'Parsing image links';

              // open imagepages.txt and read links from it
              LImagePageLinksFile := TStreamReader.Create(FTempFolder + '\' + FProjectInfo.Name + LPageIndex + '_imagepages.txt', True);
              try
                while not LImagePageLinksFile.EndOfStream do
                begin
                  if not FDownloadingImages then
                  begin
                    Break;
                  end;

                  Inc(LImageDownloadProgress);

                  // read line as a link
                  LImagePageStr := Trim(LImagePageLinksFile.ReadLine);
                  FCurrentLink := LImagePageStr;

                  if FDownloadingImages then
                  begin
                    // extract image link
                    LFILE := TFinalLinkExtractor.Create(LImagePageStr, FTempFolder + '\' + FProjectInfo.Name + LPageIndex + '_photopage.txt');
                    try

                      FStatusText := 'Downloading images [Page: ' + FloatToStr(PageIndex) + ']';
                      FMsg := LImagePageStr;
                      FDownloadThread.Synchronize(AddProgressItem);
                      // AddProgressItem(LImagePageStr);
                      FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Extracting image link ';
                      FThreadProgress := (100 * LImagesDownloaded) div PIP.ImageCount;
                      FPageImageCount := PIP.ImageCount;
                      LFILE.Start('', '');
                      while LFILE.ExtractorStatus = esDownloading do
                      begin
                        if not FDownloadingImages then
                        begin
                          LFILE.Stop;
                          Break;
                        end;
                        FCurrentProgress := LFILE.Percentage;
                        Sleep(10);
                      end;

                      // update total file size
                      Inc(FTotalFileSize, LFILE.FileSize div 1024);

                      MainForm.SetLedState(True, FThreadID);
                      if Length(LFILE.PhotoLink) > 0 then
                      begin
                        FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Downloading the image';
                        FProgressItem.StateIndex := 3;
                        FCurrentLink := LFILE.PhotoLink;
                        LPD := TPhotoDownloader.Create(LFILE.PhotoLink, FProjectInfo.OutputFolder + '\' + FProjectInfo.Name);
                        try
                          FProgressItem.SubItems[0] := LFILE.PhotoLink;
                          FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Downloading the image';
                          LPD.DontDoubleDownload := FDontDoubleDownload;
                          LPD.PageLink := LImagePageStr;
                          LPD.PageIndex := PageIndex;
                          LPD.SetOutputName(LFILE.Title);
                          LPD.Start();
                          while LPD.DownloaderStatus = pdsDownloading do
                          begin
                            if not FDownloadingImages then
                            begin
                              LPD.Stop;
                              Break;
                            end;
                            FCurrentProgress := LPD.Percentage;
                            Sleep(10);
                          end;

                        finally
                          inc(LImagesDownloaded);
                          inc(FProcessedImgCount);

                          // update total file size
                          Inc(FTotalFileSize, LPD.ImgSize div 1024);

                          // update progress item's info
                          case LPD.ErrorMessage of
                            emOK:
                              begin
                                // todo: do something for other formats
                                LEWState := exOK;
                                if LPD.ImageType = '.jpg' then
                                begin
                                  FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Getting the exif data';
                                  LEW := TExifWriter.Create(LPD.ImageFilePath, LImagePageStr, ExtractFileDir(LPD.ImageFilePath));
                                  try
                                    LEW.Start;
                                    while LEW.ExtractorStatus = ewDownloading do
                                    begin
                                      if not FDownloadingImages then
                                      begin
                                        LEW.Stop;
                                        Break;
                                      end;
                                      FCurrentProgress := LEW.Percentage;
                                      Sleep(10);
                                    end;
                                  finally
                                    LEWState := LEW.ErrorMessage;
                                    // update total file size
                                    Inc(FTotalFileSize, LEW.FileSize div 1024);
                                    LEW.Free;
                                  end;
                                end;

                                FProgressItem.StateIndex := 0;
                                FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Downloaded';
                                if LEWState <> exOK then
                                begin
                                  FProgressItem.SubItems[1] := FProgressItem.SubItems[1] + ' [Exif write error]';
                                end;
                                Inc(FPageDownloadedImageCount);
                              end;
                            emAlreadyDownloaded:
                              begin
                                FProgressItem.StateIndex := 0;
                                FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Already downloaded';
                                inc(FAlreadyDownloaded);
                              end;
                            emEmptyFile:
                              begin
                                FProgressItem.StateIndex := 1;
                                FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Empty file';
                                Inc(FFailedDownload);

                                LFailedItem.Link := FCurrentLink;
                                LFailedItem.ErrorMessage := emEmptyFile;
                                FFailedList.Add(LFailedItem);
                              end;
                            emNotDownloaded:
                              begin
                                FProgressItem.StateIndex := 1;
                                FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Not downloaded';
                                Inc(FFailedDownload);

                                LFailedItem.Link := FCurrentLink;
                                LFailedItem.ErrorMessage := emNotDownloaded;
                                FFailedList.Add(LFailedItem);
                              end;
                            emConnectionTimedOut:
                              begin
                                FProgressItem.StateIndex := 1;
                                FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Connection timed-out';
                                Inc(FFailedDownload);

                                LFailedItem.Link := FCurrentLink;
                                LFailedItem.ErrorMessage := emConnectionTimedOut;
                                FFailedList.Add(LFailedItem);
                              end;
                          end;
                          LPD.Stop;
                          FreeAndNil(LPD);
                        end;

                      end
                      else
                      begin
                        FProgressItem.SubItems[1] := '[' + FloatToStr(FThreadID + 1) + '] Failed to extract link';
                        FProgressItem.StateIndex := 1;

                        Inc(FFailedDownload);
                        LFailedItem.Link := LFILE.PhotoLink;
                        LFailedItem.ErrorMessage := emUnableToExtractLink;
                        FFailedList.Add(LFailedItem);
                      end;
                    finally
                      LFILE.Stop;
                      FreeAndNil(LFILE);
                      MainForm.SetLedState(False, FThreadID);
                    end;

                  end;

                end;
              finally
                LImagePageLinksFile.Close;
                FreeAndNil(LImagePageLinksFile);
              end;

            end;
          finally
            FreeAndNil(PIP);
          end;
        end
        else
        begin
          FStatusText := 'Downloading finished';
        end;
      end
      else
      begin
        FStatusText := 'Downloading finished';
      end;

    finally
      LIPE.Stop;
      FreeAndNil(LIPE);
    end;

  end
  else
  begin
    FStatusText := 'Project page link is too short. Please re-create this project.';
  end;
  inc(FPageProgress);
end;

procedure TDownloadWorker.Start;
begin
  FDownloaderStatus := dsDownloading;
  FDownloadThread.Start;
end;

procedure TDownloadWorker.Stop;
begin
  if not FDownloadThread.Stopped then
  begin
    FDownloadingImages := False;
    FDownloadThread.Terminate;
  end;
end;

procedure TDownloadWorker.ThreadRun(Sender: TIdThreadComponent);
var
  I: Integer;
begin
  FTotalFileSize := 0;
  FPageProgress := 0;
  FPageImageCount := 0;
  FProcessedImgCount := 0;
  FAlreadyDownloaded := 0;
  FPageDownloadedImageCount := 0;
  FFailedDownload := 0;
  FThreadProgress := 0;
  FFailedList.Clear;
  try
    if FReverseDownload then
    begin
      for I := FPageList.Count - 1 downto 0 do
      begin
        if FDownloadingImages then
        begin
          DownloadPhotoStreamPage(StrToInt(FPageList[i]));
        end;
      end;
    end
    else
    begin
      for I := 0 to FPageList.Count - 1 do
      begin
        if FDownloadingImages then
        begin
          DownloadPhotoStreamPage(StrToInt(FPageList[i]));
        end;
      end;
    end;
  finally
    FCurrentProgress := 100;
    FThreadProgress := 100;
    if FProcessedImgCount > 0 then
    begin
      FStatusText := 'Finished downloading'
    end
    else
    begin
      FStatusText := 'No images to download';
    end;

    FDownloadThread.Terminate;
  end;
end;

procedure TDownloadWorker.ThreadStopped(Sender: TIdThreadComponent);
begin
  FDownloaderStatus := dsDone;
end;

procedure TDownloadWorker.ThreadTerminate(Sender: TIdThreadComponent);
begin
  FDownloaderStatus := dsDone;
end;

end.
