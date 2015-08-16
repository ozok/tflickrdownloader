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

unit UnitFileInfo;

interface

uses
  System.Classes, ImgSize, Windows, SysUtils, IdBaseComponent, IdThreadComponent, IdThread;

type
  TFileInfo = class(TObject)
  private
    { Private declarations }
    FFiles: TStringList;
    FDone: Boolean;
    FOutput: TStringList;
    FThread: TIdThreadComponent;
    FOutputFile: string;

    function FileSizeEx(const FilePath: string): Int64;

    procedure ThreadRun(Sender: TIdThreadComponent);
    procedure ThreadStopped(Sender: TIdThreadComponent);
    procedure ThreadTerminate(Sender: TIdThreadComponent);
    function GetHandle: THandle;
  public
    property Done: Boolean read FDone;
    property ThreadHandle: THandle read GetHandle;
    constructor Create(const Files: TStringList; const OutputFilePath: string);
    destructor Destroy; override;

    procedure Start;
    procedure Stop;
  end;

implementation

{ TFileInfo }

constructor TFileInfo.Create(const Files: TStringList; const OutputFilePath: string);
begin
  FDone := False;
  FFiles := TStringList.Create;
  FFiles.AddStrings(Files);
  FOutput := TStringList.Create;
  FOutputFile := OutputFilePath;

  FThread := TIdThreadComponent.Create;
  FThread.Priority := tpIdle;
  FThread.StopMode := smTerminate;
  FThread.OnRun := ThreadRun;
  FThread.OnStopped := ThreadStopped;
  FThread.OnTerminate := ThreadTerminate;
  Start;
end;

destructor TFileInfo.Destroy;
begin
  inherited;
  FFiles.Free;
  FOutput.Free;
  FThread.Free;
end;

function TFileInfo.FileSizeEx(const FilePath: string): Int64;
var
  LInfo: TWin32FileAttributeData;
begin
  Result := -1;
  if GetFileAttributesEx(PWideChar(FilePath), GetFileExInfoStandard, @LInfo) then
  begin
    Result := Int64(LInfo.nFileSizeLow) or Int64(LInfo.nFileSizeHigh shl 32);
  end;
end;

function TFileInfo.GetHandle: THandle;
begin
  Result := FThread.Handle;
end;

procedure TFileInfo.Start;
begin
  FDone := False;
  FThread.Start;
end;

procedure TFileInfo.Stop;
begin
  if not FThread.Terminated then
  begin
    FThread.Terminate;
  end;
end;

procedure TFileInfo.ThreadRun(Sender: TIdThreadComponent);
var
  ListItem: string;
  LWidth, LHeight: Word;
  LFileExt: string;
  i: integer;
begin
  FDone := False;
  try
    for i := 0 to FFiles.Count-1 do
    begin
      LFileExt := LowerCase(ExtractFileExt(FFiles[i]));
      ListItem := ExtractFileName(FFiles[i]);
      ListItem := ListItem + '|' + UpperCase(Copy(LFileExt, 2, MaxInt));
      if (LFileExt = '.jpg') or (LFileExt = '.jpeg') then
      begin
        ImgSize.GetJPGSize(FFiles[i], LWidth, LHeight);
      end
      else if LFileExt = '.png' then
      begin
        ImgSize.GetPNGSize(FFiles[i], LWidth, LHeight);
      end
      else if LFileExt = '.gif' then
      begin
        ImgSize.GetGIFSize(FFiles[i], LWidth, LHeight);
      end
      else if LFileExt = '.bmp' then
      begin
        ImgSize.GetBMPSize(FFiles[i], LWidth, LHeight);
      end;
      ListItem := ListItem + '|' + FloatToStr(LWidth) + 'x' + FloatToStr(LHeight);
      ListItem := ListItem + '|' + FloatToStr(FileSizeEx(FFiles[i]) div 1024) + ' KB';
      FOutput.Add(ListItem);
    end;
    FOutput.SaveToFile(FOutputFile, TEncoding.UTF8);
  finally
    FThread.Terminate;
    FDone := True;
  end;
end;

procedure TFileInfo.ThreadStopped(Sender: TIdThreadComponent);
begin
  FDone := True;
end;

procedure TFileInfo.ThreadTerminate(Sender: TIdThreadComponent);
begin
  FDone := True;
end;

end.
