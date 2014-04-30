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

unit UnitDownloadLogForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  JvExComCtrls, JvListView, Vcl.ImgList, acAlphaImageList, Vcl.StdCtrls, ShellAPI,
  sLabel;

type
  TDownloadLogForm = class(TForm)
    LogList: TJvListView;
    DownloadProgressImages: TsAlphaImageList;
    ProgressInfoLabel: TsLabel;
    Label1: TsLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LogListDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DownloadLogForm: TDownloadLogForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TDownloadLogForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Enabled := True;
  MainForm.BringToFront;
end;

procedure TDownloadLogForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

procedure TDownloadLogForm.LogListDblClick(Sender: TObject);
begin
  if LogList.ItemIndex > -1 then
  begin
    ShellExecute(Handle, 'open', PChar(LogList.Items[LogList.ItemIndex].Caption), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
