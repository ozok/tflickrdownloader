object NewProjectForm: TNewProjectForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'New Project'
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
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  DesignSize = (
    514
    156)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 8
    Top = 65
    Width = 82
    Height = 13
    Caption = 'Download folder:'
  end
  object Label3: TsLabel
    Left = 35
    Top = 92
    Width = 55
    Height = 13
    Caption = 'Start page:'
  end
  object Label4: TsLabel
    Left = 195
    Top = 93
    Width = 22
    Height = 13
    Caption = 'End:'
  end
  object Label5: TsLabel
    Left = 31
    Top = 120
    Width = 59
    Height = 13
    Caption = 'Image type:'
  end
  object ProjectNameEdit: TLabeledEdit
    Left = 96
    Top = 35
    Width = 410
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'Project name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 1
  end
  object CancelBtn: TsBitBtn
    Left = 300
    Top = 123
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
    Top = 123
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Save'
    TabOrder = 7
    OnClick = SaveBtnClick
    SkinData.SkinSection = 'BUTTON'
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
    ItemIndex = 0
    ParentFont = False
    TabOrder = 6
    Text = 'All'
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
  object PageLinkEdit: TLabeledEdit
    Left = 96
    Top = 8
    Width = 410
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Page link:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 0
  end
  object GetPageCountBtn: TsButton
    Left = 321
    Top = 89
    Width = 185
    Height = 21
    Caption = 'Get photostream page count'
    TabOrder = 5
    OnClick = GetPageCountBtnClick
    SkinData.SkinSection = 'BUTTON'
  end
  object sPanel1: TsPanel
    Left = 177
    Top = 42
    Width = 185
    Height = 41
    Caption = 'Getting page count, please wait...'
    TabOrder = 9
    Visible = False
    SkinData.SkinSection = 'PANEL'
  end
  object EndPageEdit: TJvSpinEdit
    Left = 223
    Top = 89
    Width = 75
    Height = 21
    CheckOptions = [coCheckOnExit, coCropBeyondLimit]
    CheckMinValue = True
    Alignment = taCenter
    ButtonKind = bkClassic
    Value = 1.000000000000000000
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
  object SaveDialog1: TSaveDialog
    DefaultExt = '.fpd'
    Filter = 'Project Files|*.fpd'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Project File'
    Left = 248
    Top = 80
  end
end
