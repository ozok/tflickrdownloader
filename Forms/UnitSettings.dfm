object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 180
  ClientWidth = 248
  Color = 3355443
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
  end
  object DontDoubleDownloadBtn: TsCheckBox
    Left = 8
    Top = 35
    Width = 236
    Height = 19
    Caption = 'Don'#39't download already downloaded images'
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object ReverseDownloadBtn: TsCheckBox
    Left = 8
    Top = 61
    Width = 144
    Height = 19
    Caption = 'Reverse download order'
    TabOrder = 2
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object Button1: TButton
    Left = 8
    Top = 110
    Width = 232
    Height = 25
    Caption = 'Associate project files (fpd)'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ThreadNumberEdit: TsSpinEdit
    Left = 165
    Top = 8
    Width = 75
    Height = 21
    Alignment = taCenter
    Color = 3355443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15724527
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 4
    Text = '4'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Number of parallel downloads:'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    MaxValue = 8
    MinValue = 1
    Value = 4
  end
  object DontLoadImgBtn: TsCheckBox
    Left = 8
    Top = 85
    Width = 154
    Height = 19
    Caption = 'Do not load project images'
    TabOrder = 5
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 112
    Top = 88
  end
end
