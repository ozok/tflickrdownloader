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

unit UnitFileInfoWaitThread;

interface

uses
  System.Classes, UnitFileInfo, Windows, IdBaseComponent, IdThreadComponent, IdThread, SysUtils;

type
  TFileInfoWaitThread = class(TObject)
  private
    { Private declarations }
    FThread: TIdThreadComponent;
    FHandles: array of THandle;
    FThreads: array of TFileInfo;
    FFiles: array of TStringList;
    FFilesTotal: TStringList;
    FThreadCount: integer;
    FOutputFiles: TStringList;
    FDone: Boolean;

    procedure Finished;
    procedure ThreadRun(Sender: TIdThreadComponent);
    procedure ThreadStopped(Sender: TIdThreadComponent);
    procedure ThreadTerminate(Sender: TIdThreadComponent);
  public
    property Done: Boolean read FDone;

    constructor Create(const ThreadCount: integer; const Files: TStringlist; const OutputPaths: TStringList);
    destructor Destroy; override;
  end;

implementation

{ TFileInfoWaitThread }

uses UnitMain;

constructor TFileInfoWaitThread.Create(const ThreadCount: integer; const Files: TStringlist; const OutputPaths: TStringList);
var
  I: Integer;
begin
  FDone := False;
  SetLength(FHandles, ThreadCount);
  SetLength(FThreads, ThreadCount);
  SetLength(FFiles, ThreadCount);

  for I := Low(FFiles) to High(FFiles) do
  begin
    FFiles[i] := TStringList.Create;
  end;
  FFilesTotal := TStringList.Create;
  FFilesTotal.AddStrings(Files);
  FOutputFiles := TStringList.Create;
  FOutputFiles.AddStrings(OutputPaths);
  FThreadCount := ThreadCount;

  FThread := TIdThreadComponent.Create;
  FThread.Priority := tpIdle;
  FThread.StopMode := smTerminate;
  FThread.OnRun := ThreadRun;
  FThread.OnStopped := ThreadStopped;
  FThread.OnTerminate := ThreadTerminate;

  FThread.Start;
end;

destructor TFileInfoWaitThread.Destroy;
var
  i: integer;
begin
  inherited;
  for I := Low(FFiles) to High(FFiles) do
  begin
    FFiles[i].Free;
  end;
  FFilesTotal.Free;
  FOutputFiles.Free;
end;

procedure TFileInfoWaitThread.Finished;
begin
  MainForm.DoneSearchingFiles := True;
end;


procedure TFileInfoWaitThread.ThreadRun(Sender: TIdThreadComponent);
var
  i: integer;
  LRunningCount: integer;
begin
  for I := 0 to FFilesTotal.Count-1 do
  begin
    FFiles[i mod FThreadCount].Add(FFilesTotal[i]);
  end;
  for I := 0 to FThreadCount-1 do
  begin
    FThreads[i] := TFileInfo.Create(FFiles[i], FOutputFiles[i]);
    FHandles[i] := FThreads[i].ThreadHandle;
  end;
  try
  LRunningCount := 0;
  while LRunningCount > 0 do
  begin
    LRunningCount := 0;
    for I := Low(FThreads) to High(FThreads) do
    begin
      if Assigned(FThreads[i]) then
      begin
        if not FThreads[i].Done then
        begin
          Inc(LRunningCount);
        end;
      end;
    end;
    Sleep(100);
  end;
  //WaitForMultipleObjects(FThreadCount, @FHandles, True, INFINITE);
  finally
  for I := 0 to FThreadCount-1 do
    begin
      FThreads[i].Free;
    end;
    FDone := True;
  end;

end;

procedure TFileInfoWaitThread.ThreadStopped(Sender: TIdThreadComponent);
begin
  FDone := True;
end;

procedure TFileInfoWaitThread.ThreadTerminate(Sender: TIdThreadComponent);
begin
  FDone := True;
end;

end.
