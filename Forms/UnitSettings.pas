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

unit UnitSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, IniFiles, Vcl.Mask, JvExMask, JvSpin, sCheckBox,
  sBitBtn, sLabel, ShellAPI, sEdit, sSpinEdit, sSkinProvider;

type
  TSettingsForm = class(TForm)

    SaveBtn: TsBitBtn;
    DontDoubleDownloadBtn: TsCheckBox;
    ReverseDownloadBtn: TsCheckBox;
    Button1: TButton;
    sSkinProvider1: TsSkinProvider;
    ThreadNumberEdit: TsSpinEdit;
    DontLoadImgBtn: TsCheckBox;
    procedure SaveBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

    procedure SaveSettings;
    procedure LoadSettings;
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TSettingsForm.Button1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(Application.ExeName), '/register', nil, SW_HIDE);
end;

procedure TSettingsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
  MainForm.Enabled := True;
  MainForm.BringToFront;
end;

procedure TSettingsForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if length(ThreadNumberEdit.Text) < 1 then
  begin
    CanClose := False;
    Application.MessageBox('Please enter a valid thread count value!', 'Warning', MB_ICONWARNING);
  end;
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
begin
  LoadSettings;
  ThreadNumberEdit.MaxValue := 16;
end;

procedure TSettingsForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

procedure TSettingsForm.FormShow(Sender: TObject);
begin
  LoadSettings;
end;

procedure TSettingsForm.LoadSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := TIniFile.Create(MainForm.AppDataFolder + '\settings.ini');
  try
    ThreadNumberEdit.Text := SettingsFile.ReadString('settings', 'threads', '1');
    DontDoubleDownloadBtn.Checked := SettingsFile.ReadBool('settings', 'double', True);
    ReverseDownloadBtn.Checked := SettingsFile.ReadBool('settings', 'reverse', False);
    DontLoadImgBtn.Checked := SettingsFile.ReadBool('settings', 'loadimg', False);
  finally
    SettingsFile.Free;
  end;
end;

procedure TSettingsForm.SaveBtnClick(Sender: TObject);
begin
  if length(ThreadNumberEdit.Text) < 1 then
  begin
    Application.MessageBox('Please enter a valid thread count value!', 'Warning', MB_ICONWARNING);
  end;
  Self.Close;
end;

procedure TSettingsForm.SaveSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := TIniFile.Create(MainForm.AppDataFolder + '\settings.ini');
  try
    SettingsFile.WriteString('settings', 'threads', ThreadNumberEdit.Text);
    SettingsFile.WriteBool('settings', 'double', DontDoubleDownloadBtn.Checked);
    SettingsFile.WriteBool('settings', 'reverse', ReverseDownloadBtn.Checked);
    SettingsFile.WriteBool('settings', 'loadimg', DontLoadImgBtn.Checked);
  finally
    SettingsFile.Free;
  end;
end;

end.
