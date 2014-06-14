object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 180
  ClientWidth = 248
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    248
    180)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 20
    Top = 11
    Width = 145
    Height = 13
    Caption = 'Number of parallel downloads:'
  end
  object SaveBtn: TsBitBtn
    Left = 146
    Top = 146
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Save'
    TabOrder = 0
    OnClick = SaveBtnClick
    SkinData.SkinSection = 'BUTTON'
    ExplicitTop = 119
  end
  object DontDoubleDownloadBtn: TsCheckBox
    Left = 8
    Top = 35
    Width = 230
    Height = 20
    Caption = 'Don'#39't download already downloaded images'
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object ReverseDownloadBtn: TsCheckBox
    Left = 8
    Top = 61
    Width = 138
    Height = 20
    Caption = 'Reverse download order'
    TabOrder = 2
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object ThreadNumberEdit: TJvSpinEdit
    Left = 171
    Top = 8
    Width = 75
    Height = 21
    CheckOptions = [coCheckOnExit, coCropBeyondLimit]
    Alignment = taCenter
    ButtonKind = bkClassic
    MaxValue = 8.000000000000000000
    MinValue = 1.000000000000000000
    Value = 4.000000000000000000
    TabOrder = 3
  end
  object Button1: TButton
    Left = 8
    Top = 110
    Width = 232
    Height = 25
    Caption = 'Associate project files (fpd)'
    TabOrder = 4
    OnClick = Button1Click
  end
  object DontLoadImgBtn: TCheckBox
    Left = 8
    Top = 87
    Width = 169
    Height = 17
    Caption = 'Do not load project images'
    TabOrder = 5
  end
end
