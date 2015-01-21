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

unit UnitFlickrGroupPhotoLinksDownloader;

interface

uses Classes, Windows, SysUtils, JvCreateProcess, StrUtils;

type
  TGroupImagePageLinksDownloader = class(TObject)
  private
    // process
    FProcess: TJvCreateProcess;
    FImageLinks: TStringList;
    FTempFolder: string;
    FGroupID: string;

    // process events
    procedure ProcessRead(Sender: TObject; const S: string; const StartsOnNewLine: Boolean);
    procedure ProcessTerminate(Sender: TObject; ExitCode: Cardinal);

    // field variable read funcs
    function GetProcessID: integer;
  public
    property ProcessID: integer read GetProcessID;
    property ImageLinks: TStringList read FImageLinks;

    constructor Create(const GroupID: string; const TempFolder: string; const ProcesName: string);
    destructor Destroy(); override;

    procedure Start();
    procedure Stop();
    procedure ResetValues();
    function GetConsoleOutput(): TStrings;
  end;

implementation

uses UnitMain;
{ TGroupImagePageLinksDownloader }

constructor TGroupImagePageLinksDownloader.Create(const GroupID: string; const TempFolder: string; const ProcesName: string);
begin
  inherited Create;

  FProcess := TJvCreateProcess.Create(nil);
  with FProcess do
  begin
    OnRead := ProcessRead;
    OnTerminate := ProcessTerminate;
    ConsoleOptions := [coRedirect];
    CreationFlags := [cfUnicode];
    Priority := ppIdle;

    with StartupInfo do
    begin
      DefaultPosition := False;
      DefaultSize := False;
      DefaultWindowState := False;
      ShowWindow := swHide;
    end;

    WaitForTerminate := true;
  end;

  FImageLinks := TStringList.Create;
  FTempFolder := TempFolder;
  FGroupID := GroupID;
  FProcess.ApplicationName := ProcesName;
end;

destructor TGroupImagePageLinksDownloader.Destroy;
begin
  inherited Destroy;
  FProcess.Free;
  FImageLinks.Free;
end;

function TGroupImagePageLinksDownloader.GetConsoleOutput: TStrings;
begin
  Result := FProcess.ConsoleOutput;
end;

function TGroupImagePageLinksDownloader.GetProcessID: integer;
begin
  Result := FProcess.ProcessInfo.hProcess;
end;

procedure TGroupImagePageLinksDownloader.ProcessRead(Sender: TObject; const S: string; const StartsOnNewLine: Boolean);
begin
  // MainForm.FlickrGroupExtractList.Items.Add(Trim(S));
end;

procedure TGroupImagePageLinksDownloader.ProcessTerminate(Sender: TObject; ExitCode: Cardinal);
begin
  if ExitCode = 0 then
  begin
    FImageLinks.LoadFromFile(FTempFolder + '\groupimagelinks.txt');
  end;
end;

procedure TGroupImagePageLinksDownloader.ResetValues;
begin
  // reset all lists, indexes etc
  FProcess.ConsoleOutput.Clear;
end;

procedure TGroupImagePageLinksDownloader.Start;
begin
  FProcess.CommandLine := '" " "' + FGroupID + '" "' + FTempFolder + '"';
  FProcess.Run;
end;

procedure TGroupImagePageLinksDownloader.Stop;
begin
  if FProcess.ProcessInfo.hProcess > 0 then
  begin
    TerminateProcess(FProcess.ProcessInfo.hProcess, 0);
  end;
end;

end.
