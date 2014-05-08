object EditProjectForm: TEditProjectForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Edit Project'
  ClientHeight = 156
  ClientWidth = 514
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  DesignSize = (
    514
    156)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 44
    Top = 12
    Width = 46
    Height = 13
    Caption = 'Page link:'
  end
  object Label2: TsLabel
    Left = 23
    Top = 38
    Width = 67
    Height = 13
    Caption = 'Project name:'
  end
  object Label3: TsLabel
    Left = 8
    Top = 65
    Width = 82
    Height = 13
    Caption = 'Download folder:'
  end
  object Label4: TsLabel
    Left = 35
    Top = 92
    Width = 55
    Height = 13
    Caption = 'Start page:'
  end
  object Label5: TsLabel
    Left = 212
    Top = 93
    Width = 22
    Height = 13
    Caption = 'End:'
  end
  object Label6: TsLabel
    Left = 31
    Top = 119
    Width = 59
    Height = 13
    Caption = 'Image type:'
  end
  object ProjectNameEdit: TsEdit
    Left = 96
    Top = 35
    Width = 410
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'FlickrProject'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
  end
  object CancelBtn: TsBitBtn
    Left = 300
    Top = 125
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    TabOrder = 8
    OnClick = CancelBtnClick
    SkinData.SkinSection = 'BUTTON'
  end
  object SaveBtn: TsBitBtn
    Left = 406
    Top = 125
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Save'
    TabOrder = 7
    OnClick = SaveBtnClick
    SkinData.SkinSection = 'BUTTON'
  end
  object PageLinkEdit: TsEdit
    Left = 96
    Top = 8
    Width = 410
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
  end
  object ImageTypeList: TsComboBox
    Left = 96
    Top = 116
    Width = 90
    Height = 21
    Alignment = taLeftJustify
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'COMBOBOX'
    VerticalAlignment = taAlignTop
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = -1
    ParentFont = False
    TabOrder = 6
    Items.Strings = (
      'All'
      'Square 75'
      'Square 150'
      'Thumbnail'
      'Small 240'
      'Small 320'
      'Medium 500'
      'Medium 640'
      'Medium 800'
      'Large '
      'Large 1600'
      'Large 2048'
      'Original')
  end
  object GetPageCountBtn: TsButton
    Left = 321
    Top = 89
    Width = 185
    Height = 21
    Caption = 'Get page count'
    TabOrder = 5
    OnClick = GetPageCountBtnClick
    SkinData.SkinSection = 'BUTTON'
  end
  object sPanel1: TsPanel
    Left = 177
    Top = 62
    Width = 185
    Height = 41
    Caption = 'Getting page count, please wait...'
    TabOrder = 9
    Visible = False
    SkinData.SkinSection = 'PANEL'
  end
  object EndPageEdit: TJvSpinEdit
    Left = 240
    Top = 89
    Width = 75
    Height = 21
    CheckOptions = [coCheckOnExit, coCropBeyondLimit]
    CheckMinValue = True
    Alignment = taCenter
    ButtonKind = bkClassic
    Value = 1.000000000000000000
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
  object StartPageEdit: TJvSpinEdit
    Left = 96
    Top = 89
    Width = 75
    Height = 21
    CheckOptions = [coCheckOnExit, coCropBeyondLimit]
    CheckMinValue = True
    Alignment = taCenter
    ButtonKind = bkClassic
    Value = 1.000000000000000000
    TabOrder = 3
  end
  object OutputDirectoryEdit: TJvDirectoryEdit
    Left = 96
    Top = 62
    Width = 410
    Height = 21
    DialogKind = dkWin32
    TabOrder = 2
    Text = ''
  end
end
