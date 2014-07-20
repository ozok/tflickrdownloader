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

unit UnitWarning;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, 
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sSkinProvider,
  sRadioButton, sButton;

type
  TWarningForm = class(TForm)
    StaticText1: TStaticText;
    Button1: TsButton;
    Button2: TsButton;
    OKRDBtn: TsRadioButton;
    NORDBtn: TsRadioButton;
    sSkinProvider1: TsSkinProvider;
    procedure OKRDBtnClick(Sender: TObject);
    procedure NORDBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WarningForm: TWarningForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TWarningForm.Button1Click(Sender: TObject);
begin
  // success
  ModalResult := 1;
  MainForm.FFirstTime := False;
  Self.CloseModal;
end;

procedure TWarningForm.Button2Click(Sender: TObject);
begin
  // close the program
  MainForm.FFirstTime := True;
  MainForm.Close;
end;

procedure TWarningForm.NORDBtnClick(Sender: TObject);
begin
  Button1.Enabled := OKRDBtn.Checked;
end;

procedure TWarningForm.OKRDBtnClick(Sender: TObject);
begin
  Button1.Enabled := OKRDBtn.Checked;
end;

end.