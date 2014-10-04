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

unit UnitDownloader;

interface

uses Classes, SysUtils, StrUtils, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerStream, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, System.Types;

type
  TDownloaderStatus = (ds2Downloading, ds2Done, ds2Error);

type
  TDownloader = class(TObject)
  private
    FPageDownloader: TIdHTTP;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    FStatus: TDownloaderStatus;
    FURL: string;
    FErrorMsg: string;
    FOutputFilePath: string;
    FFileSize: int64;

    procedure WorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
  public
    property Status: TDownloaderStatus read FStatus;
    property ErrorMessage: string read FErrorMsg;
    property FileSize: int64 read FFileSize;
    property URL: string read FURL write FURL;
    property OutputFileName: string read FOutputFilePath write FOutputFilePath;

    constructor Create;
    destructor Destroy(); override;

    procedure Start();
    procedure Stop();
  end;

implementation

{ TDownloader }

constructor TDownloader.Create;
begin
  inherited Create;
  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FPageDownloader := TIdHTTP.Create(nil);
  with FPageDownloader do
  begin
    OnWorkBegin := WorkBegin;
    OnWork := Work;
    AllowCookies := True;
    IOHandler := FSSLHandler;
    RedirectMaximum := 35;
    HandleRedirects := True;
    Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0';
  end;

  FStatus := ds2Downloading;
  FURL := Url;
  FErrorMsg := '';
end;

destructor TDownloader.Destroy;
begin
  inherited Destroy;
  FPageDownloader.Free;
  FSSLHandler.Free;
end;

procedure TDownloader.Start();
var
  LMS: TFileStream;
begin
  LMS := TFileStream.Create(FOutputFilePath, fmCreate);
  FStatus := ds2Downloading;
  try
    try
      FPageDownloader.Get(FURL, LMS);
    except
      on E: Exception do
        // report it
    end;
    if LMS.Size > 0 then
    begin
      FFileSize := LMS.Size;
    end
    else
    begin
      FStatus := ds2Error;
    end;
  finally
    LMS.Free;
    FStatus := ds2Done;
  end;
end;

procedure TDownloader.Stop;
begin
  if FStatus = ds2Downloading then
  begin
    FPageDownloader.Disconnect;
    FStatus := ds2Done;
  end;
end;

procedure TDownloader.Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin

end;

procedure TDownloader.WorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  FStatus := ds2Downloading;
end;

end.
