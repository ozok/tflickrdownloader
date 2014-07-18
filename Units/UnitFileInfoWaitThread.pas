unit UnitFileInfoWaitThread;

interface

uses
  System.Classes, UnitFileInfo, Windows;

type
  TFileInfoWaitThread = class(TThread)
  private
    { Private declarations }
    FHandles: array of THandle;
    FThreads: array of TFileInfo;
    FFiles: array of TStringList;
    FFilesTotal: TStringList;
    FThreadCount: integer;
    FOutputFiles: TStringList;

    procedure Finished;
  protected
    procedure Execute; override;
  public
    constructor Create(const ThreadCount: integer; const Files: TStringList; const OutputPaths: TStringList);
    destructor Destroy; override;
  end;

implementation

{ TFileInfoWaitThread }

uses UnitMain;

constructor TFileInfoWaitThread.Create(const ThreadCount: integer; const Files: TStringList; const OutputPaths: TStringList);
var
  I: Integer;
begin
  inherited Create(False);
  SetLength(FHandles, ThreadCount);
  SetLength(FThreads, ThreadCount);
  SetLength(FFiles, ThreadCount);

  for I := Low(FFiles) to High(FFiles) do
  begin
    FFiles[i] := TStringList.Create;
  end;
  FFilesTotal := TStringList.Create;
  FFilesTotal.addstrings(Files);
  FOutputFiles := TStringList.Create;
  FOutputFiles.AddStrings(OutputPaths);
  FThreadCount := ThreadCount;
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

procedure TFileInfoWaitThread.Execute;
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
    FHandles[i] := FThreads[i].Handle;
    Sleep(100);
  end;
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
//  WaitForMultipleObjects(FThreadCount, @FHandles, True, INFINITE);
  Synchronize(Finished);
end;

procedure TFileInfoWaitThread.Finished;
begin
  MainForm.DoneSearchingFiles := True;
end;

end.
