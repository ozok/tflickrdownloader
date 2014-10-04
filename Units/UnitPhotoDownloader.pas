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

unit UnitPhotoDownloader;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, UnitDownloader, UnitCommonTypes,
  Dialogs, UnitImageTypeExtractor;

type
  TPDStatus = (pdsDownloading, pdsDone);

type
  TPhotoDownloader = class(TObject)
  private
    FPageDownloader: TDownloader;
    FStatus: TPDStatus;
    FURL: string;
    FErrorMsg: TErrorMessages;
    FPercentage: integer;
    FOutputFileName: string;
    FTotalSize: int64;
    FPosition: int64;
    FDontDoubleDownload: Boolean;
    FImgSize: int64;
    FPageLink: string;
    FOutputFolder: string;
    FPageIndex: integer;
    FImageType: string;

    function URLToFileName: string;

    function IsFileEmpty(const FilePath: string): Boolean;
    function IsTimedOut(const FilePath: string): Boolean;
    function GetFileSize(const FilePath: string): int64;
    procedure ParsePage;
  public
    property DownloaderStatus: TPDStatus read FStatus;
    property ErrorMessage: TErrorMessages read FErrorMsg;
    property Percentage: integer read FPercentage;
    property ImageFilePath: string read FOutputFileName;
    property TotalSize: int64 read FTotalSize;
    property Position: int64 read FPosition;
    property DontDoubleDownload: Boolean read FDontDoubleDownload write FDontDoubleDownload;
    property ImgSize: int64 read FImgSize;
    property PageLink: string write FPageLink;
    property PageIndex: integer read FPageIndex write FPageIndex;
    property ImageType: string read FImageType;

    constructor Create(const Url: string; const OutputFolder: string);
    destructor Destroy(); override;

    procedure Start();
    procedure Stop();

    procedure SetOutputName(const Name: string);
  end;

implementation

{ TPhotoDownloader }

constructor TPhotoDownloader.Create(const Url: string; const OutputFolder: string);
var
  LOutputFile: string;
begin
  inherited Create;
  FPageDownloader := TDownloader.Create;
  FStatus := pdsDownloading;
  FURL := Url;
  FErrorMsg := emNotStarted;
  FPercentage := 0;
  LOutputFile := OutputFolder + '\' + URLToFileName;
  if Length(LOutputFile) > MAX_PATH then
  begin
    LOutputFile := Copy(LOutputFile, 1, MAX_PATH - 1);
    LOutputFile := ChangeFileExt(LOutputFile, '.jpg');
  end;
  FOutputFileName := LOutputFile;
  FOutputFolder := OutputFolder;
end;

destructor TPhotoDownloader.Destroy;
begin
  inherited Destroy;
  FPageDownloader.Free;
end;

function TPhotoDownloader.GetFileSize(const FilePath: string): int64;
var
  FS: TFileStream;
begin
  Result := 0;
  FS := TFileStream.Create(FilePath, fmOpenRead or fmShareDenyWrite);
  try
    Result := FS.Size;
  finally
    FS.Free;
  end;
end;

function TPhotoDownloader.IsFileEmpty(const FilePath: string): Boolean;
var
  FS: TFileStream;
begin
  Result := False;

  FS := TFileStream.Create(FilePath, fmOpenRead or fmShareDenyWrite);
  try
    Result := 0 = FS.Size;
  finally
    FS.Free;
  end;

end;

function TPhotoDownloader.IsTimedOut(const FilePath: string): Boolean;
var
  LStreamReader: TStreamReader;
begin
  Result := False;
  if GetFileSize(FilePath) <> 183 then
    Exit;

  LStreamReader := TStreamReader.Create(FilePath, True);
  try
    if LStreamReader.BaseStream.Size > 0 then
    begin
      if not LStreamReader.EndOfStream then
      begin
        if '<html>' = LStreamReader.ReadLine then
        begin
          if not LStreamReader.EndOfStream then
          begin
            if LStreamReader.ReadLine = '<head><title>504 Gateway Time-out</title></head>' then
            begin
              Result := True;
            end;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(LStreamReader);
  end;
end;

procedure TPhotoDownloader.ParsePage;
var
  LFileExt: string;
  LImageTypeEx: TImageType;
begin
  FPercentage := 100;
  if FileExists(FOutputFileName) then
  begin
    FImageType := ExtractFileExt(FOutputFileName);

    if IsFileEmpty(FOutputFileName) or (FImgSize = 0) then
    begin
      FErrorMsg := emEmptyFile;
    end
    else if IsTimedOut(FOutputFileName) then
    begin
      FErrorMsg := emConnectionTimedOut;
    end
    else
    begin
      FErrorMsg := emOK;
    end;
    // try to get image's real type
    LImageTypeEx := TImageType.Create(FOutputFileName);
    try
      LFileExt := LImageTypeEx.ImageType;
      if Length(LFileExt) > 0 then
      begin
        FImageType := LFileExt;
        ChangeFileExt(FOutputFileName, LFileExt);
      end;
    finally
      LImageTypeEx.Free;
    end;
  end
  else
  begin
    FErrorMsg := emNotDownloaded;
  end;
  FStatus := pdsDone;
end;

procedure TPhotoDownloader.SetOutputName(const Name: string);
begin
  if Length(Name) > 0 then
  begin
    FOutputFileName := FOutputFolder + '\' + Name + '_' + URLToFileName;
  end
  else
  begin
    FOutputFileName := FOutputFolder + '\' + URLToFileName;
  end;
end;

procedure TPhotoDownloader.Start();
begin
  FPageDownloader.Url := FURL;
  // ignore if downloaded successfully
  if FDontDoubleDownload then
  begin
    // download if file doesn't exist
    if not FileExists(FOutputFileName) then
    begin
      FStatus := pdsDownloading;
      try
        FPageDownloader.URL := FURL;
        FPageDownloader.OutputFileName := FOutputFileName;
        // wait until downloading is done
        FPageDownloader.Start;
        while FPageDownloader.Status = ds2Downloading do
        begin
          Sleep(50);
        end;
        FImgSize := FPageDownloader.FileSize;
        ParsePage;
      finally
        FStatus := pdsDone;
      end;
    end
    else
    begin
      // download again if timed out or empty
      if IsTimedOut(FOutputFileName) or IsFileEmpty(FOutputFileName) then
      begin
        FStatus := pdsDownloading;
        try
          FPageDownloader.URL := FURL;
          FPageDownloader.OutputFileName := FOutputFileName;
          FPageDownloader.Start;
          // wait until downloading is done
          while FPageDownloader.Status = ds2Downloading do
          begin
            Sleep(50);
          end;
          FImgSize := FPageDownloader.FileSize;
          ParsePage;
        finally
          FStatus := pdsDone;
        end;
      end
      else
      begin
        // file already downlaoded
        FErrorMsg := emAlreadyDownloaded;
        FStatus := pdsDone;
      end;
    end;
  end
  else
  begin
    // download anyways
    FStatus := pdsDownloading;
    try
      FPageDownloader.URL := FURL;
      FPageDownloader.OutputFileName := FOutputFileName;
      FPageDownloader.Start;
      // wait until downloading is done
      while FPageDownloader.Status = ds2Downloading do
      begin
        Sleep(50);
      end;
      FImgSize := FPageDownloader.FileSize;
      ParsePage;
    finally
      FStatus := pdsDone;
    end;
  end;
end;

procedure TPhotoDownloader.Stop;
begin
  if FStatus = pdsDownloading then
  begin
    FPageDownloader.Stop;
  end;
end;

function TPhotoDownloader.URLToFileName: string;
var
  LURL: string;
begin
  Result := FURL;
  LURL := FURL;
  LURL := StringReplace(LURL, '/', '\', [rfReplaceAll]);
  Result := ChangeFileExt(ExtractFileName(LURL), '.jpg');
  if Length(Result) > MAX_PATH then
  begin
    Result := ExtractFileDir(Result) + ChangeFileExt(Copy(Result, 1, MAX_PATH - 1), '.jpg');
  end;
end;

end.
