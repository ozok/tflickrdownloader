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

unit UnitEditProjectForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, sCustomComboEdit, Vcl.ExtCtrls,
  UnitPhotoStreamPageCountExtractor, JvExMask, JvSpin, JvToolEdit, sPanel,
  sButton, sComboBox, sBitBtn, sEdit, sLabel;

type
  TEditProjectForm = class(TForm)

    ProjectNameEdit: TsEdit;

    CancelBtn: TsBitBtn;
    SaveBtn: TsBitBtn;
    PageLinkEdit: TsEdit;
    ImageTypeList: TsComboBox;
    GetPageCountBtn: TsButton;
    sPanel1: TsPanel;
    EndPageEdit: TJvSpinEdit;
    StartPageEdit: TJvSpinEdit;
    OutputDirectoryEdit: TJvDirectoryEdit;
    Label1: TsLabel;
    Label2: TsLabel;
    Label3: TsLabel;
    Label4: TsLabel;
    Label5: TsLabel;
    Label6: TsLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetPageCountBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditProjectForm: TEditProjectForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TEditProjectForm.CancelBtnClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TEditProjectForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Enabled := true;
  MainForm.BringToFront;
end;

procedure TEditProjectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    CancelBtnClick(Self);
end;

procedure TEditProjectForm.GetPageCountBtnClick(Sender: TObject);
var
  LPCE: TPhotoStreamPageCountExtractor;
begin
  if DirectoryExists(OutputDirectoryEdit.Text) and (Length(PageLinkEdit.Text) > 0) then
  begin
    sPanel1.Visible := true;
    sPanel1.BringToFront;
    Self.Enabled := False;
    try
      LPCE := TPhotoStreamPageCountExtractor.Create(PageLinkEdit.Text, MainForm.TempFolder + '\pagecount.txt');
      try
        LPCE.Start();
        while LPCE.ExtractorStatus = pceDownloading do
        begin
          Application.ProcessMessages;
          Sleep(10);
        end;
        EndPageEdit.Value := LPCE.LastPage;
      finally
        LPCE.Free;
      end;
    finally
      sPanel1.Visible := False;
      Self.Enabled := true;
    end;
  end
  else
  begin
    Application.MessageBox('Please enter a valid output and link first.', 'Warning', MB_ICONWARNING);
  end;
end;

procedure TEditProjectForm.SaveBtnClick(Sender: TObject);
var
  LProjectFile: TStringList;
begin
  if Length(ProjectNameEdit.Text) > 0 then
  begin

    if not DirectoryExists(OutputDirectoryEdit.Text) then
    begin
      if not ForceDirectories(OutputDirectoryEdit.Text) then
      begin
        Application.MessageBox('Please specify a valid output folder.', 'Warning', MB_ICONWARNING);
        Exit;
      end;
    end;

    if (Length(StartPageEdit.Text) > 0) and (Length(EndPageEdit.Text) > 0) then
    begin
      if EndPageEdit.Value >= StartPageEdit.Value then
      begin

        LProjectFile := TStringList.Create;
        try
          LProjectFile.Add(ProjectNameEdit.Text);
          LProjectFile.Add(StartPageEdit.Text);
          LProjectFile.Add(EndPageEdit.Text);
          LProjectFile.Add(FloatToStr(ImageTypeList.ItemIndex));
          LProjectFile.Add(OutputDirectoryEdit.Text);
          LProjectFile.Add(PageLinkEdit.Text);

          LProjectFile.SaveToFile(MainForm.ProjectFilePath, TEncoding.UTF8);
          with MainForm.ProjectInfo do
          begin
            Name := ProjectNameEdit.Text;
            StartPage := StrToInt(StartPageEdit.Text);
            EndPage := StrToInt(EndPageEdit.Text);
            ImageTypeOption := ImageTypeList.ItemIndex;
            OutputFolder := OutputDirectoryEdit.Text;
          end;

        finally
          // update main form
          if MainForm.LoadProject(MainForm.ProjectFilePath, MainForm.ProjectInfo) then
          begin
            MainForm.ProjectLoadedStatus;
          end
          else
          begin
            Application.MessageBox('Cannot load project file!', 'Error', MB_ICONERROR);
            MainForm.ProjectUnLoadedStatus;
          end;

          Self.Close;
        end;
      end;
    end
    else
    begin
      Application.MessageBox('Please enter valid start/end page values.', 'Warning', MB_ICONWARNING);
    end;
  end
  else
  begin
    Application.MessageBox('Please enter a valid project name.', 'Warning', MB_ICONWARNING)
  end;
end;

end.
