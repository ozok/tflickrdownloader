unit UnitFileInfo;

interface

uses
  System.Classes, ImgSize, Windows, SysUtils;

type
  TFileInfo = class(TThread)
  private
    { Private declarations }
    FOutputFilePath: string;
    FFiles: TStringList;
    FDone: Boolean;

    function FileSizeEx(const FilePath: string): Int64;
  protected
    procedure Execute; override;
  public
    property Done: Boolean read FDone;
    constructor Create(const Files: TStringList; const OutputFilePath: string);
    destructor Destroy; override;
  end;

implementation

{ TFileInfo }

constructor TFileInfo.Create(const Files: TStringList; const OutputFilePath: string);
begin
  inherited Create(False);
//  FreeOnTerminate := True;
  FDone := False;
  FFiles := TStringList.Create;
  FFiles.AddStrings(Files);
  FOutputFilePath := OutputFilePath;
end;

destructor TFileInfo.Destroy;
begin
  inherited;
  FFiles.Free;
end;

procedure TFileInfo.Execute;
var
  ListItem: string;
  LWidth, LHeight: Word;
  LFileExt: string;
  i: integer;
  LOutputFile: TStringList;
begin
  FDone := False;
  LOutputFile := TStringList.Create;
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
      LOutputFile.Add(ListItem);
    end;
    LOutputFile.SaveToFile(FOutputFilePath, TEncoding.UTF8);
  finally
    LOutputFile.Free;
  end;
  FDone := True;
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

end.
