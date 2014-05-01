object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'TFlickrDownloader'
  ClientHeight = 562
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TsStatusBar
    Left = 0
    Top = 541
    Width = 684
    Height = 21
    Panels = <
      item
        Text = 'TFlickrDownloader 0.3'
        Width = 190
      end
      item
        Width = 232
      end
      item
        Width = 50
      end>
    SkinData.SkinSection = 'STATUSBAR'
    DesignSize = (
      684
      21)
    object sPanel2: TsGroupBox
      Left = 548
      Top = 2
      Width = 136
      Height = 17
      Anchors = [akRight, akBottom]
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object LED1: TsImage
        Left = 0
        Top = 0
        Width = 17
        Height = 17
        Picture.Data = {07544269746D617000000000}
        ImageIndex = 1
        Images = Icons
        SkinData.SkinSection = 'CHECKBOX'
      end
      object LED2: TsImage
        Left = 17
        Top = 0
        Width = 17
        Height = 17
        Picture.Data = {07544269746D617000000000}
        ImageIndex = 1
        Images = Icons
        SkinData.SkinSection = 'CHECKBOX'
      end
      object LED3: TsImage
        Left = 34
        Top = 0
        Width = 17
        Height = 17
        Picture.Data = {07544269746D617000000000}
        ImageIndex = 1
        Images = Icons
        SkinData.SkinSection = 'CHECKBOX'
      end
      object LED4: TsImage
        Left = 51
        Top = 0
        Width = 17
        Height = 17
        Picture.Data = {07544269746D617000000000}
        ImageIndex = 1
        Images = Icons
        SkinData.SkinSection = 'CHECKBOX'
      end
      object LED5: TsImage
        Left = 68
        Top = 0
        Width = 17
        Height = 17
        Picture.Data = {07544269746D617000000000}
        ImageIndex = 1
        Images = Icons
        SkinData.SkinSection = 'CHECKBOX'
      end
      object LED6: TsImage
        Left = 85
        Top = 0
        Width = 17
        Height = 17
        Picture.Data = {07544269746D617000000000}
        ImageIndex = 1
        Images = Icons
        SkinData.SkinSection = 'CHECKBOX'
      end
      object LED7: TsImage
        Left = 102
        Top = 0
        Width = 17
        Height = 17
        Picture.Data = {07544269746D617000000000}
        ImageIndex = 1
        Images = Icons
        SkinData.SkinSection = 'CHECKBOX'
      end
      object LED8: TsImage
        Left = 119
        Top = 0
        Width = 17
        Height = 17
        Picture.Data = {07544269746D617000000000}
        ImageIndex = 1
        Images = Icons
        SkinData.SkinSection = 'CHECKBOX'
      end
    end
  end
  object StatusPage: TsPageControl
    Left = 0
    Top = 58
    Width = 684
    Height = 483
    ActivePage = sTabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = 'Project Status'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      DesignSize = (
        676
        452)
      object Label1: TsLabel
        Left = 3
        Top = 0
        Width = 84
        Height = 13
        Caption = 'Project summary:'
      end
      object PreviewImage: TImage
        Left = 563
        Top = 19
        Width = 110
        Height = 110
        Anchors = [akTop, akRight]
        Center = True
        Proportional = True
        Stretch = True
        Transparent = True
      end
      object ProjectInfoList: TsTreeView
        Left = 3
        Top = 19
        Width = 554
        Height = 110
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Indent = 19
        ParentFont = False
        TabOrder = 0
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object DownloadedImageList: TsListView
        Left = 3
        Top = 166
        Width = 670
        Height = 283
        BoundLabel.Active = True
        BoundLabel.Caption = 'Downloaded images for this project (0):'
        BoundLabel.Indent = 10
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = 'Image File'
            Width = 400
          end
          item
            Alignment = taCenter
            Caption = 'Type'
            Width = 80
          end
          item
            Alignment = taCenter
            Caption = 'Dimensions'
            Width = 80
          end
          item
            Alignment = taRightJustify
            Caption = 'Size'
            Width = 80
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2302755
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        StateImages = DownloadProgressImages
        TabOrder = 1
        ViewStyle = vsReport
        OnClick = DownloadedImageListClick
        OnDblClick = DownloadedImageListDblClick
        OnKeyDown = DownloadedImageListKeyDown
      end
      object RefreshDownloadedImageList: TsButton
        Left = 563
        Top = 135
        Width = 110
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Refresh'
        TabOrder = 2
        OnClick = RefreshDownloadedImageListClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = 'Download Progress'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object ProgressList: TsListView
        Left = 0
        Top = 201
        Width = 676
        Height = 251
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        Align = alClient
        Columns = <
          item
            Caption = '#'
            Width = 80
          end
          item
            Caption = 'Link'
            Width = 630
          end
          item
            Alignment = taCenter
            Caption = 'Status'
            Width = 180
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2302755
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        StateImages = DownloadProgressImages
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel1: TsGroupBox
        Left = 0
        Top = 132
        Width = 676
        Height = 69
        Align = alTop
        Caption = 'Total progress'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        DesignSize = (
          676
          69)
        object GeneralAlreadyImgEdit: TsEdit
          Left = 328
          Top = 41
          Width = 100
          Height = 21
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Already downloaded:'
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
        object GeneralDownloadedImgEdit: TsEdit
          Left = 328
          Top = 14
          Width = 100
          Height = 21
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Downloaded:'
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
        object GeneralProcessedPageEdit: TsEdit
          Left = 88
          Top = 41
          Width = 100
          Height = 21
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Page progress:'
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
        object GeneralProcessedImgEdit: TsEdit
          Left = 88
          Top = 14
          Width = 100
          Height = 21
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Processed:'
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
        object GeneralSpeedEdit: TsEdit
          Left = 568
          Top = 41
          Width = 100
          Height = 21
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Speed:'
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
        object GeneralFailedImgEdit: TsEdit
          Left = 568
          Top = 14
          Width = 100
          Height = 21
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Failed:'
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
      end
      object sGroupBox1: TsGroupBox
        Left = 0
        Top = 0
        Width = 676
        Height = 132
        Align = alTop
        Caption = 'Thread progress'
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        DesignSize = (
          676
          132)
        object DownloadThreadsList: TsComboBox
          Left = 87
          Top = 14
          Width = 92
          Height = 21
          Anchors = [akLeft, akBottom]
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Thread:'
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
          TabOrder = 0
        end
        object NextThreadBtn: TsButton
          Left = 216
          Top = 14
          Width = 25
          Height = 21
          Anchors = [akLeft, akBottom]
          Caption = '>'
          TabOrder = 1
          OnClick = NextThreadBtnClick
          SkinData.SkinSection = 'BUTTON'
        end
        object PrevThreadBtn: TsButton
          Left = 185
          Top = 14
          Width = 25
          Height = 21
          Anchors = [akLeft, akBottom]
          Caption = '<'
          TabOrder = 2
          OnClick = PrevThreadBtnClick
          SkinData.SkinSection = 'BUTTON'
        end
        object ThreadAlreadyImgEdit: TsEdit
          Left = 450
          Top = 41
          Width = 75
          Height = 21
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Already downloaded:'
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
        object ThreadFailImgEdit: TsEdit
          Left = 595
          Top = 41
          Width = 75
          Height = 21
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Failed:'
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
        object ThreadLinkEdit: TsEdit
          Left = 223
          Top = 68
          Width = 447
          Height = 21
          Alignment = taCenter
          Anchors = [akLeft, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = ' '
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Current link:'
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
        object ThreadPageEdit: TsEdit
          Left = 88
          Top = 68
          Width = 60
          Height = 21
          Alignment = taCenter
          Anchors = [akLeft, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          Text = ' '
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Page progress:'
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
        object ThreadPageImgEdit: TsEdit
          Left = 223
          Top = 41
          Width = 75
          Height = 21
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Downloaded:'
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
        object ThreadSpeedEdit: TsEdit
          Left = 325
          Top = 14
          Width = 75
          Height = 21
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Speed:'
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
        object ThreadStatusEdit: TsEdit
          Left = 450
          Top = 14
          Width = 218
          Height = 21
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          Text = ' '
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Status:'
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
        object ThreadTotalProcessedImgEdit: TsEdit
          Left = 87
          Top = 41
          Width = 60
          Height = 21
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Processed:'
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
        object sGroupBox2: TsGroupBox
          Left = 2
          Top = 91
          Width = 672
          Height = 39
          Align = alBottom
          TabOrder = 11
          SkinData.SkinSection = 'GROUPBOX'
          object TotalProgressBar: TsGauge
            Left = 2
            Top = 1
            Width = 668
            Height = 12
            Align = alBottom
            CalcPercents = False
            Animated = False
            SkinData.SkinSection = 'GAUGE'
            BackColor = clBtnFace
            ForeColor = clGreen
            Progress = 0
            ShowText = False
            Suffix = '%'
            ExplicitTop = -9
          end
          object PageProgressBar: TsGauge
            Left = 2
            Top = 13
            Width = 668
            Height = 12
            Align = alBottom
            CalcPercents = False
            Animated = False
            SkinData.SkinSection = 'GAUGE'
            BackColor = clBtnFace
            ForeColor = clGray
            Progress = 0
            ShowText = False
            Suffix = '%'
            ExplicitTop = 6
          end
          object CurrentProgressBar: TsGauge
            Left = 2
            Top = 25
            Width = 668
            Height = 12
            Align = alBottom
            CalcPercents = False
            Animated = False
            SkinData.SkinSection = 'GAUGE'
            BackColor = clBtnFace
            ForeColor = clSkyBlue
            Progress = 0
            ShowText = False
            Suffix = '%'
            ExplicitTop = 21
          end
        end
      end
    end
  end
  object ThreadInfoPnl: TsPanel
    Left = 290
    Top = 445
    Width = 334
    Height = 73
    Caption = 'Please wait, stopping downloads...'
    TabOrder = 2
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object Image9: TImage
      Left = 1
      Top = 1
      Width = 72
      Height = 54
      Align = alLeft
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0B54504E474772617068696336240000424D3624000000000000360000002800
        0000300000003000000001002000000000000024000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        0001000000010000000100000001000000010000000100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        0001000000020000000300000004000000050000000600000006000000070000
        0007000000070000000700000007000000070000000700000006000000060000
        0005000000030000000300000002000000010000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000020000000300000005000000080000
        000A0000000C0000000D0000000E00000011000E2616001B451D002966250030
        762C0035803100357F310031752C00286325001A431D000D2316000000110000
        000E0000000D0000000D0000000A000000080000000500000003000000020000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000100000003000000060000000A0000000D00000010000000130000
        001500000018001E4625003782400047A5620353B888075CC3A50A62CBBC0D67
        CEC80E69D0CF0E68D0CF0C66CEC70A62CABA075BC3A40253B8860046A2610036
        7F3F001C4125000000180000001500000014000000110000000E0000000A0000
        0007000000040000000100000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        0003000000070000000A0000000F00000013000000170000001A0004091F002A
        60350047A1680558BDA10F68CECF1B78DAEC2686E3FB2E8FE9FF3497EDFF379C
        F0FF399EF1FF389EF1FF379BF0FF3497EDFF2D8FE8FF2585E2FA1A77D9EB0E67
        CECE0457BC9E00469E6600275A340003071F0000001A00000017000000140000
        00100000000B0000000700000004000000010000000000000000000000000000
        0000000000000000000000000000000000000000000000000001000000050000
        00090000000E00000012000000170000001A0000001D00214E320047A16F085D
        C4B91A74D8EA2D8CE7FD3B9FF1FF40A8F7FF40ABFAFF3FACFBFF3FACFCFF40AD
        FCFF41AEFCFF41AEFCFF40ADFCFF3FADFCFF3FACFBFF40ABFAFF40A7F7FF3A9D
        F0FF2C8BE6FC1773D7E8075CC3B600469E6B001D46310000001E0000001B0000
        0017000000130000000F0000000A000000060000000200000000000000000000
        0000000000000000000000000000000000000000000100000004000000090000
        000E00000012000000170000001B000D1E24003D8B54065AC0AD1A75D8ED3493
        EAFF43A8F7FF42ACFBFF40ACFBFF46AFFCFF52B4FCFF5FB9FCFF67BCFBFF6BBD
        FBFF6DBDFAFF6DBDFAFF6BBDFBFF67BCFBFF5EB9FCFF51B4FCFF45AFFBFF3FAC
        FBFF42ACFBFF42A7F7FF3291EAFE1973D7EA0558BEA800398551000A17240000
        001C00000018000000130000000F0000000A0000000500000001000000000000
        00000000000000000000000000000000000000000002000000060000000B0000
        00100000001400000018001F472A014CAA750F68CED32E8BE5FC44A7F5FF43AE
        FBFF41ADFBFF51B3FBFF66BBFBFF6FBBF8FF67B1F2FF58A3ECFF4B98E7FF4391
        E3FF408DE1FF408EE1FF4491E3FF4C98E7FF59A4ECFF67B1F3FF6FBBF8FF65BB
        FBFF4FB3FBFF40ACFBFF43ADFBFF43A5F5FF2C88E4FC0E65CCCF0149A56F001B
        3E290000001900000015000000110000000C0000000700000002000000000000
        00000000000000000000000000000000000000000002000000060000000B0000
        00100000001300285D280253B8891973D6E73D9BEDFF48AEFAFF40ADFBFF4FB3
        FBFF6BBDFAFF6AB4F4FF4E9BE8FF3685DBFF367FD3FF4686CDFF5A8FC9FF6897
        C7FF6F9BC6FF6E9BC6FF6797C7FF598FC9FF4585CDFF357FD3FF3785DCFF509D
        E9FF6BB6F5FF69BCFBFF4DB2FBFF40ACFBFF47AEFAFF3A98ECFF1770D5E40151
        B5830023522600000014000000110000000C0000000700000002000000000000
        0000000000000000000000000000000000000000000000000004000000080000
        000B003479240458C18F207ADBF046A4F2FF46AFFBFF44AEFCFF61BAFBFF6BB7
        F5FF4896E6FF337FD5FF4C88CBFF7BA1C6FF9FB6C4FFB2C1C3FFBAC6C3FFBDC8
        C3FFBFC9C3FFBEC9C3FFBDC8C3FFBAC6C3FFB1C1C3FF9DB5C4FF77A0C6FF4987
        CBFF337FD6FF4A98E7FF6CB8F6FF5FB9FBFF42AEFBFF46AFFBFF43A1F1FF1D77
        DAED0356BE88002F6B210000000C000000090000000500000001000000000000
        000000000000000000000000000000000000000000000000000100000003003C
        8C15035AC681217ADCEE4AA8F4FF46AFFBFF49B0FBFF69BCFAFF59A6EEFF3382
        DAFF4C88CBFF8AAAC5FFB3C2C4FFC0CAC4FFC1CBC5FFC1CBC5FFC2CCC6FFC2CC
        C6FFC2CCC6FFC2CCC6FFC2CCC6FFC2CCC6FFC1CBC5FFC1CBC5FFC0CAC4FFB2C2
        C4FF87A9C5FF4987CCFF3483DBFF5CA8EFFF68BBFAFF46AFFBFF46AFFBFF47A5
        F2FF1E78DAEA0358C37A00377E14000000040000000100000000000000000000
        00000000000000000000000000000000000000000000003E90000055D004015A
        CB621D76DAE54BA6F2FF47AFFBFF4AB0FBFF6BBBF9FF4A99E8FF337DD2FF739D
        C7FFB0C1C4FFC1CBC5FFC2CCC6FFC3CDC7FFC4CDC8FFC4CEC9FFC5CFC9FFC5CF
        CAFFC5CFCAFFC5CFCAFFC5CFCAFFC5CFC9FFC4CEC9FFC4CDC8FFC3CDC7FFC3CC
        C6FFC1CBC5FFAEBFC4FF6E9BC7FF327ED3FF4D9CE9FF69BBF9FF48AFFBFF47AF
        FBFF48A3F1FF1A73D9E10059CA5A004FC0030000000000000000000000000000
        000000000000000000000000000000000000000000000056CB000058CC3B146D
        D6D1469FEEFF4BB1FCFF48B0FBFF68B9F8FF4494E6FF3A7FCFFF8DADC6FFBEC9
        C5FFC3CDC6FFC3CDC8FFC4CEC9FFC6CFCAFFC7D0CBFFC8D1CCFFC9D2CDFFC9D2
        CDFFC9D2CDFFC9D2CDFFC9D2CDFFC9D2CDFFC8D1CCFFC7D0CBFFC6D0CAFFC5CE
        C9FFC3CDC8FFC4CDC6FFBDC8C5FF88AAC6FF377ED0FF4797E7FF67B9F9FF46AE
        FBFF4BB1FBFF429CEDFF116BD5CA0058CC330069C30000000000000000000000
        0000000000000000000000000000000000000055CB000058CC160962D1A13A91
        E7FC52B2FAFF44AEFBFF64B9FAFF4798E8FF3A80CFFF96B2C6FFC1CBC6FFC3CD
        C8FFC5CEC9FFC6D0CBFFC8D1CCFFC9D2CDFFCAD3CEFFCBD4CFFFCCD4D0FFCDD5
        D1FFCDD5D0FFCDD5D0FFCDD5D1FFCCD4D0FFCBD4CFFFCBD3CFFFC9D2CDFFC8D1
        CCFFC6D0CBFFC5CEC9FFC3CDC8FFC0CBC6FF91AFC6FF377FD0FF4B9BE9FF62B9
        FAFF42ADFBFF51B2FAFF358DE5FB0761D0970059CC120057CB00000000000000
        0000000000000000000000000000000000000058CC02015BCE5D237BDCE956AF
        F6FF44AEFBFF5AB7FBFF52A3EDFF347ED2FF8EADC6FFC2CCC6FFC4CEC8FFC6CF
        CAFFC8D1CCFFCAD2CEFFCBD4CFFFCDD5D1FFCED6D2FFCFD7D2FFD0D7D3FFD0D8
        D4FFD0D8D4FFD0D8D4FFD0D8D4FFD0D7D3FFCFD7D2FFCED6D2FFCDD5D1FFCBD4
        CFFFCAD3CEFFC8D1CCFFC6CFCAFFC4CEC8FFC2CCC6FF89AAC7FF327ED3FF56A6
        EFFF57B5FBFF44AEFBFF53ACF5FF1F77DAE4005BCD540057D001000000000000
        0000000000000000000000000000004AC5000056CB1D0E67D3B2489DEBFF4FB3
        FBFF4BB0FBFF5FB1F5FF2F7FD8FF77A0C8FFC0CBC6FFC5CEC9FFC6D0CBFFC9D2
        CDFFCBD4CFFFCDD5D1FFCED6D2FFD0D8D4FFD1D9D5FFD2D9D6FFD3DAD6FFD4DB
        D7FFD4DBD7FFD4DBD7FFD4DBD7FFD3DAD6FFD2DAD6FFD1D9D5FFD0D8D4FFCED7
        D2FFCDD5D1FFCBD4CFFFC9D2CDFFC7D0CBFFC6CEC9FFBFCAC7FF719DC9FF3081
        DAFF60B2F6FF48AFFBFF50B3FBFF4298EAFE0B65D2A90056CB180048C5000000
        0000000000000000000000000000004AC501015ACD56277EDDE959B1F6FF44AE
        FBFF5DB6FAFF3E91E5FF4F8ACCFFB4C3C7FFC6CEC9FFC7D0CBFFC9D2CDFFCCD4
        D0FFCED6D1FFD0D8D3FFD2D9D5FFD3DAD6FFD5DBD8FFD6DCD9FFD7DDDAFFD7DE
        DAFFD8DEDBFFD8DEDBFFD8DEDAFFD7DDDAFFD6DDD9FFD5DBD8FFD3DAD6FFD2D9
        D5FFD0D8D3FFCED6D1FFCCD4D0FFCAD2CDFFC7D0CBFFC6CFC9FFB1C2C7FF4A87
        CDFF4294E7FF5BB6FAFF44AEFBFF57AFF6FF237ADBE40059CC4C0047C5010000
        0000000000000000000000000000004FC80C0A63D19A4497E8FE54B5FBFF4BB0
        FCFF58ABF3FF307DD6FF91AFC8FFC5CEC8FFC6D0CBFFC9D2CDFFCCD4D0FFCED6
        D2FFD1D8D4FFD3DAD6FFD5DBD8FFD6DDDAFFD8DEDBFFD9DFDCFFDAE0DDFFDBE1
        DEFFDBE1DEFFDBE1DEFFDBE1DEFFDAE0DDFFD9DFDCFFD8DEDBFFD6DDDAFFD5DB
        D8FFD3DAD6FFD1D8D4FFCED6D2FFCCD4D0FFC9D2CDFFC7D0CBFFC5CEC9FF8BAC
        C8FF2F7ED7FF5AAEF4FF48B0FBFF55B4FBFF3E93E6FD0861D08F004EC8090000
        00000000000000000000000000000055CB2B1A71D7D259ACF2FF49B1FCFF56B4
        FBFF3F93E7FF518CCCFFBAC8C8FFC7D0CAFFC9D2CDFFCCD4CFFFCED6D2FFD1D8
        D4FFD3DAD7FFD5DCD9FFD8DEDBFFDAE0DDFFDBE1DEFFDCE2DFFFDEE4E1FFE0E6
        E3FFE1E7E4FFE1E6E4FFDFE5E2FFDEE3E0FFDCE2DFFFDBE1DEFFDAE0DDFFD8DE
        DBFFD6DCD9FFD4DAD7FFD1D8D4FFCED6D2FFCCD4D0FFC9D2CDFFC7D0CAFFB7C6
        C8FF4B89CDFF4296E8FF54B4FBFF4AB1FCFF54A9F1FF166FD6CA0054CB240000
        000000000000000000000058CC00015ACD562D82DEEF5FB6F8FF45AFFCFF58B0
        F7FF3182DBFF82A7C9FFC6CFC9FFC8D1CCFFCBD3CFFFCED6D1FFD1D8D4FFD3DA
        D7FFD6DCD9FFD8DEDBFFDBE0DDFFDCE2DFFFDFE4E1FFE1E5E3FFDBDFDDFFBFC3
        C0FFADB0ACFFBCBFBCFFD9DDDBFFE3E7E5FFE1E6E3FFDFE4E1FFDDE2E0FFDBE1
        DEFFD8DFDBFFD6DDD9FFD4DBD7FFD1D8D4FFCED6D2FFCBD4CFFFC8D1CCFFC6CF
        C9FF7BA3C9FF3184DDFF58B1F8FF45AFFBFF5DB4F7FF297EDCEB0159CD4B0059
        CC0000000000000000000053CB04065FCF814293E6FA5BB8FBFF48B0FBFF4EA5
        F1FF3981D3FFA6BBC9FFC9D1CBFFCAD2CEFFCDD4D0FFD0D7D3FFD3DAD6FFD5DC
        D9FFD8DEDBFFDBE1DEFFDDE3E0FFE0E5E2FFE2E7E4FFDADEDCFF959693FF5959
        54FF4D4D48FF565650FF8A8B87FFC6CAC6FFD4D8D5FFD8DCDAFFDBDFDCFFDBE1
        DEFFDAE0DEFFD9E0DCFFD7DEDAFFD5DCD8FFD1D9D5FFCDD6D1FFCAD3CEFFC9D1
        CBFFA0B8C9FF3581D4FF50A8F3FF46AFFBFF5CB7FBFF3C8EE4F8045ECF770051
        C90200000000000000000056CB0E0B65D1A352A1ECFE54B5FCFF4DB1FBFF4198
        EAFF4D8ACEFFBAC8C9FFCAD2CCFFCBD4CFFFCED7D2FFD2D9D5FFD5DBD8FFD8DE
        DBFFDBE0DDFFDDE3DFFFE0E5E2FFE3E7E5FFE5E9E7FFAEB0ACFF4D4C47FF494B
        48FF4E5250FF4B4E4AFF454540FF55544FFF666662FF72726EFF7E807BFF8B8D
        89FF979A96FFA2A6A1FFABB0ACFFB3B8B4FFBDC3BFFFCCD4CFFFCBD4CFFFCAD2
        CCFFB6C6C9FF4888CFFF449BECFF4BB0FBFF56B5FCFF4C9DEAFD0962D1990056
        CB0A00000000000000000058CC1B136BD4BC5DACF0FF4FB3FCFF4FB1FAFF378E
        E4FF6295CCFFC3CECAFFCAD2CDFFCCD5D1FFD0D8D3FFD3DAD6FFD7DDDAFFD9DF
        DCFFDCE2DFFFE0E5E2FFE2E7E4FFE5E9E7FFE4E8E6FF888985FF464743FF5D61
        5FFF626564FF545856FF474845FF3D3D38FF464744FF434440FF3F3F3BFF3C3B
        36FF3B3A34FF403F39FF4B4A45FF595953FF7D7F7AFFC3CAC6FFCDD5D1FFCBD3
        CEFFC1CCCAFF5C92CDFF3A91E7FF4EB1FAFF51B4FCFF58A7EFFF0F67D2B20057
        CC1500000000000000000058CC26196FD6C864B2F3FF4CB2FCFF50B1FAFF3287
        E0FF739ECBFFC7D0CBFFCBD3CEFFCED6D1FFD1D8D4FFD4DBD7FFD8DEDBFFDBE0
        DDFFDEE3E0FFE1E6E4FFE4E9E6FFE9ECEAFFD0D2D0FF676762FF444541FF7578
        76FF838684FF585C5AFF464743FF3E3D38FF494944FF50504BFF595955FF6766
        62FF767672FF868883FF979A95FFA5A8A4FFB6BBB7FFCDD4D0FFCED6D2FFCBD3
        CEFFC6D0CBFF6B9ACCFF348BE2FF4EB0FAFF4DB2FCFF5FADF2FF146CD4C10058
        CC1F00000000000000000057CC2B1C72D7CE68B5F4FF4BB1FBFF4EAFF9FF2F85
        DEFF7BA3CBFFC9D2CCFFCCD4CFFFCFD7D2FFD2DAD5FFD6DCD9FFD9DFDCFFDCE2
        DFFFDFE5E2FFE3E7E5FFE7EBE9FFD2D5D3FF7C7C78FF43433DFF3E3E39FF5556
        52FF5F615DFF4C4D48FF4E4D48FF8A8A86FFB2B3B0FFC1C4C1FFCED1CFFFD7DA
        D8FFDCE0DDFFDDE2DFFFDDE2DFFFDBE1DDFFD7DEDBFFD3DAD6FFCFD7D2FFCCD4
        CFFFC9D1CCFF739FCCFF3187E0FF4DAFF9FF4CB1FBFF63B1F3FF186ED6C80057
        CC2400000000000000000057CC2B1C72D7CE6AB6F4FF4CB1FBFF4CAEF9FF2F84
        DFFF7CA3CBFFCAD2CDFFCCD4D0FFCFD7D3FFD3DAD6FFD6DDD9FFDAE0DDFFDDE3
        DFFFE0E6E3FFE5E9E6FFD3D6D4FF7E7E7AFF484844FF4B4D4AFF3F3F3BFF363F
        43FF36454FFF3F4C59FF979B9DFFE8EAE8FFF3F5F4FFEFF2F1FFECEFEDFFE8EC
        EAFFE4E9E6FFE1E6E3FFDDE3E0FFDAE0DDFFD6DDD9FFD3DAD6FFD0D7D3FFCDD5
        D0FFC9D2CDFF749FCCFF3086E0FF4CAFF9FF4DB2FBFF66B2F3FF186FD6C70058
        CC2400000000000000000057CC261A70D6C96BB5F3FF4EB3FCFF4AAEF9FF2F86
        E0FF75A0CCFFC9D2CDFFCDD5D0FFD0D8D3FFD3DBD6FFD7DDDAFFDAE0DDFFDEE3
        E0FFE2E8E5FFD2D6D3FF81827EFF464742FF494A46FF414443FF2E4F6AFF216F
        B4FF1B74C6FF3777C2FFCCDBECFFF9FAF7FFF2F4F3FFEFF1F0FFEBEEEDFFE8EC
        EAFFE4E9E7FFE1E6E4FFDEE3E0FFDBE0DDFFD7DDDAFFD4DBD6FFD0D7D3FFCDD5
        D0FFC8D1CDFF6D9BCDFF3089E2FF49AEFAFF50B4FCFF66B0F2FF156CD5C10058
        CC1F00000000000000000058CC1C156BD4BC68B0F1FF54B6FCFF48AEFAFF318B
        E4FF6597CDFFC6D0CDFFCDD5D0FFD0D8D3FFD3DAD6FFD7DDDAFFDAE0DDFFDFE5
        E2FFD0D4D1FF82837EFF464540FF43443FFF38444DFF245B8DFF187EDCFF1990
        F8FF178AF3FF3282DEFFCEDEF2FFF9FAF7FFF2F4F3FFEFF1F0FFECEFEDFFE8EC
        EAFFE5E9E7FFE2E6E4FFDEE3E0FFD8E0DDFFD3DEDBFFCFDBD8FFCCD8D4FFCCD5
        D1FFC4CFCDFF5E92CEFF338EE6FF46AEFAFF56B6FCFF62ABEFFF1068D3B30057
        CC1600000000000000000056CB0E0D65D1A45FA8ECFE5EBAFCFF44ADFBFF3692
        EAFF4F8BCEFFBDCBCCFFCED5D0FFCFD7D3FFD3DAD6FFD7DDD9FFDBE1DDFFCFD4
        D1FF83847FFF44433DFF3D3E3CFF2D4A62FF1A67B1FF1283ECFF168DF8FF1D93
        F8FF1B8CF2FF3381DCFFCCDDF0FFF8F9F6FFF2F4F3FFEEF1F0FFEBEEECFFE8EB
        E9FFE3E9E6FFDAE7E4FFCCE5E2FFBFE3E0FFB6E1DFFFB1E0DDFFB0DDDAFFB4DA
        D6FFABCDD1FF478CD1FF3896ECFF43ADFBFF61BAFCFF58A2EAFD0A63D19A0055
        CB0A00000000000000000052CA050660CF844F99E6FB6ABEFBFF42ADFBFF3D9D
        F0FF3780D2FFAABFCBFFCED5D0FFCFD7D3FFD2DAD6FFD8DEDBFFCDD2CFFF8586
        81FF403E37FF343C40FF225280FF0F72D2FF0D84F5FF138AF8FF1A8FF7FF2196
        F9FF1E8FF2FF3381DCFFCADBEEFFF6F7F4FFF0F3F1FFEDF0EFFFEAEEEBFFE3EB
        E9FFD1E9E7FFBBE8E6FFA8E7E6FF9BE7E5FF92E6E5FF8EE4E3FF8DE2E0FF92E0
        DDFF7FCCD8FF3199DBFF3DAAF2FF41AEFBFF6DBEFBFF4994E4F9055ECF790050
        C90300000000000000000049C800015ACD583786DEF072BFF9FF45AFFCFF43A7
        F6FF287EDAFF85A8C9FFCCD4CFFFCFD6D2FFD3DBD7FFC9CFCCFF848680FF3F3E
        39FF2A4053FF165EA7FF0777E8FF0982F8FF1087F7FF178DF7FF1D93F8FF2599
        F9FF2192F2FF3382DCFFC7D9ECFFF3F5F1FFEEF1EFFFECEFEDFFE3ECEAFFCAEB
        E9FFAFEBE9FF98EAE9FF87EAE9FF7AE9EAFF72EAE9FF6EE9E9FF6EE7E7FF73E5
        E4FF53CADFFF29AFE6FF3CBFF7FF43BAFBFF71BFF8FF3181DDEC0058CD4D002B
        BC0000000000000000000050CA000055CB2D2075D7D46EB6F3FF52B5FCFF42AC
        FAFF2C8AE5FF518ACAFFBECBCBFFCFD6D2FFC7CEC9FF858681FF3E4345FF224B
        73FF0C6AC8FF0279F2FF067FF7FF0D85F6FF148AF7FF1B90F7FF2196F8FF299C
        FAFF2494F3FF3381DBFFC5D7EAFFF1F2EFFFECEFEDFFE5ECEBFFCCECEAFFACEB
        EAFF92EBEBFF81ECECFF74EDEEFF5CEDEEFF51EDEEFF4DEDEEFF4EEDEDFF51E8
        EAFF3ECFE7FF37C9F0FF37CCF8FF49CBFAFF5FBBF1FF1B74D7CC0053CB26004A
        C700000000000000000000000000004EC80D0C64D29E57A0E9FE67BDFCFF3FAC
        FBFF3B9EF2FF2879D3FF95AFC6FFC8CFCAFF8A8E8AFF384754FF185798FF0672
        E1FF007AF7FF047DF5FF0B82F6FF1188F6FF188EF7FF1F94F8FF2599F9FF2C9F
        FAFF2797F3FF3381DBFFC2D5E7FFEEF0ECFFE7ECEAFFD4EBEAFFB2EBEAFF93EC
        EBFF78ECECFF88F1F1FFC0F9F9FF8EF6F6FF50F3F4FF3CF2F3FF44F2F3FF70F1
        F3FFA9EEF7FF83E8F9FF36D6F8FF4FD7F9FF42B3EAFE0E7DD7980260CE0B0000
        00000000000000000000000000000042C3010159CD583283DDEB75BEF8FF48B0
        FCFF41AAFAFF2786E4FF4E87C8FFB2BEC1FF849096FF2060AAFF0170E7FF007A
        F7FF027BF5FF087FF5FF0F85F6FF158BF7FF1C91F8FF2297F8FF299CF9FF30A3
        FAFF2A9AF3FF3281DAFFBFD2E4FFEAEDE9FFDFEAE8FFBFEAE9FF9DEBEAFF7EEC
        ECFF60EEEEFF7CF3F4FFEEFEFEFFF3FEFEFFCAFCFCFFA4F9FAFFB8FBFBFFE7FD
        FEFFFAFFFFFF9AF2FBFF38E2F7FF49DAF5FF29AFE6EE15A9E26F2EF4F70A2CF2
        F500000000000000000000000000004CC8000055CB1F1269D3B460A8ECFF65BC
        FCFF3EABFBFF3AA0F4FF2379D6FF779DC3FFB9C6C8FF699AD1FF0D6DDAFF0073
        EEFF057DF5FF0C83F6FF1289F7FF198FF8FF1F94F8FF269AF9FF2CA0FAFF34A6
        FBFF2E9CF4FF3381D9FFBCCFE2FFE6EAE6FFD2E8E6FFAEE9E8FF8DEBEAFF6DEC
        EDFF4DEFF0FF5DF4F5FFE1FDFDFFFFFFFFFFFFFFFFFFFDFFFFFFFEFFFFFFFFFF
        FFFFF5FEFFFF83F5FAFF36EAF6FF36D4F0FF1EBBE7CE24DBEF5E2EFAF7192CF2
        F500000000000000000000000000000000000057CB03015BCE623081DDEC76BE
        F7FF4DB2FCFF3DAAFAFF2E91EBFF2E79CEFF90ABC1FFB7C5CAFF6195D0FF0E6D
        DAFF0577EDFF0F86F6FF168CF7FF1C92F8FF2398F9FF2A9DF9FF30A3FAFF38A9
        FBFF309EF4FF3281D9FFB9CDDFFFE2E7E3FFC6E6E4FFA1E9E7FF81EBEAFF5FED
        EDFF40F0F1FF53F5F6FFD8FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF0FEFEFF7AF6F9FF30ECF5FF26D3EDF622D6EDAE2BF3F55F2CF4F5292CF3
        F503000000000000000000000000000000000057CB000058CD180B63D1A5529C
        E7FD71C0FBFF41ADFBFF3CA7F9FF2688E6FF367BCAFF97AEBFFFB6C4C8FF6D9D
        D0FF1B73D7FF0B78E7FF168AF4FF2195F8FF279CF9FF2EA1FAFF34A7FAFF3BAC
        FBFF31A0F4FF3280D8FFB6CBDCFFDDE5E0FFBDE4E2FF9AE7E6FF79EAE9FF56EE
        EEFF3CF1F2FF79F7F8FFEBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF8FEFFFFA1F9FBFF36EBF4FE22DFF0E128EDF39B2BF4F5662CF3F5322CF3
        F50700000000000000000000000000000000000000000050C9000058CC3F1C71
        D6D367AEEFFF66BDFCFF3DAAFBFF39A4F7FF2384E3FF387CCAFF8EA8BFFFB7C3
        C5FF88AACDFF3C82D2FF1474DDFF1682EAFF2495F3FF2FA1F9FF38AAFBFF3DAF
        FBFF31A1F4FF3180D7FFB4C8DAFFD9E1DCFFB9E2E0FF96E5E4FF75E9E8FF55ED
        EDFF6CF4F5FFCFFCFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE8FEFEFF85F4F8FA32EFF4CF29F3F5982BF3F5692CF3F5352CF3
        F50700000000000000000000000000000000000000000053CA000054CB06025B
        CE682B7DDBE872B8F4FF5FBAFCFF3BA9FBFF37A4F7FF2386E5FF2D78CEFF769A
        C0FFB1BDBFFFABBCC7FF78A1CDFF3E84D3FF2079D9FF1C7FE1FF238BE8FF2A95
        EEFF238EEBFF2C7BD5FFB0C6D7FFD6DFD9FFB8E0DDFF96E4E2FF75E7E6FF78EF
        EFFFD0FBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFEBFEFEFC88F9F9D32EF3F5952AF3F5662CF3F5312CF3
        F5060000000000000000000000000000000000000000000000000055CA000057
        CC10045ECF803283DDEF74BAF5FF5FBAFCFF3CAAFBFF37A5F8FF278EEBFF1F77
        D6FF4E86C5FF8EA7BDFFB1BCBEFFB0BEC4FF95B0C9FF709DCCFF538ECFFF4185
        D1FF347ED2FF4987D0FFB3C6D3FFD1D8D3FFB8D8D4FF96DCD9FF75DFDDFF7DE7
        E9FFBBF4F8FFD4FAFDFFE7FDFEFFF8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF
        FFFFEDFEFEFFDCFDFDFDCFFCFDF493F9FACB33F3F58B29F3F55C2CF3F5272CF3
        F5030000000000000000000000000000000000000000000000000057CE000058
        CD00005ACC18065FD08A3384DEEF71B7F3FF67BDFCFF40ACFBFF37A7F9FF2E9A
        F3FF1E82E3FF2778D2FF4E86C5FF7D9EBFFFA0B1BDFFB1BCBEFFB4BFC0FFAFBC
        C1FFA8B9C2FFA7B9C2FFB9C3C2FFBBC3C0FFA5C0C2FF7CC1CCFF54C1D7FF37C7
        E3FF37D8EFFF49ECF6FF6AF5F8FFB0FAFBFFF5FEFFFFFFFFFFFFFDFFFFFFCBFB
        FDFF79F6F9FD54F5F7EF44F5F6CF34F4F5A52AF3F5792BF3F54D2CF3F5182CF3
        F500000000000000000000000000000000000000000000000000000000000000
        00000059CC000057CB16055ECF832B7DDBE967AEF0FF72C1FBFF4EB3FCFF39A9
        FBFF33A4F8FF2A96F1FF1E83E5FF1F78D7FF2F79CDFF4682C7FF5D8EC3FF6E96
        C0FF769ABFFF7399C0FF6A94C1FF598BC3FF4185C9FF2B8FD6FF22A5E4FF25BF
        EEFF29D5F4FF28E3F6FF2AEDF6FF4FF4F7FFC6FCFDFFFFFFFFFFE6FEFEFF6FF6
        F8FA2BF3F5ED25F3F5D326F3F5B029F3F58B2BF3F5632CF3F5372CF3F50A2CF3
        F500000000000000000000000000000000000000000000000000000000000000
        0000005CCD000058CD000056CC0F015BCE671A70D6D2519CE7FD76BDF7FF67BE
        FCFF49B1FCFF39A9FBFF33A5F9FF2D9EF6FF2693F0FF1F88E9FF1B80E2FF1A7C
        DFFF1B7ADDFF1B7ADEFF1B7CE0FF1C81E4FF208AEAFF289EF1FF2DB4F6FF2FC4
        F8FF31D1F8FF36DEF7FF39E8F7FF33E9F4FF78EEF7FFEEFDFEFEB1FBFCF137F4
        F6DD26F3F5C929F3F5AF2AF3F5902BF3F56E2CF3F5482CF3F51B2CF3F5010000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000005ACC00005ACD00005ACD070059CD400B64D1A63081DDEB5DA7
        ECFF75BEF8FF6ABEFCFF53B5FBFF41ACFBFF38A9FBFF34A7FAFF32A4F9FF31A3
        F8FF30A1F8FF30A1F8FF31A3F9FF32A5F9FF34A7FAFF38AAFBFF40B6FAFF4BC8
        FAFF53D5F9FF4ED8F6FF39D1F0FF26CFEDF63ADEF0E098F7F9D765F6F8C528F3
        F5B029F3F59F2AF3F5882BF3F56D2CF3F54D2CF3F5252CF3F5062CF3F5000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000005CCE00004DCB000057CC19005ACE601068
        D3B73081DDED559FE9FD6FB7F3FF75C0F9FF6DBFFBFF61BBFCFF56B6FCFF50B4
        FCFF4DB2FCFF4DB2FCFF50B4FCFF57B7FCFF61BBFCFF6EBFFBFF74C1F9FF64BC
        F2FF44B1EAFD29A9E5F11DB3E5CF20D0ECA828EBF39332F3F5922DF3F58D2AF3
        F5842BF3F5742BF3F5602CF3F5472CF3F5252CF3F5082CF3F500000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000005CCD00005ACD00004CC7020053
        CB1C005ACD580962D19E1B71D6D13485DEED4C98E6FA5DA7ECFF68B0F0FF6EB5
        F2FF70B7F4FF6FB7F4FF6DB4F2FF67AFF0FF5CA5EBFF4A96E5F93283DEEB1972
        D7CE0C76D69C119CDE6D22D7ED532BF2F4542BF4F55B29F3F5602AF3F55D2BF3
        F5552BF3F5472CF3F5322CF3F5192CF3F5052CF3F5002CF3F500000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000005CCF00005ACD00015B
        CE000045C5010057CC0F0058CC30005ACD5C035FCF830B65D2A3146CD5B91B71
        D7C71F73D8CD1E73D7CA1B70D6C4146BD4B60B64D19F035ECF800059CD570057
        CC2D0165CF0E2DF4F6082EF8F6142CF3F5222CF3F52A2BF3F52D2CF3F52B2CF3
        F5232CF3F5162CF3F5092CF3F5012CF3F5002CF3F50000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000005DCF00005ACD000059CD000156CC000056CB070055CB140053CA1F0053
        CA290053CA310053CA2D0052CA260052CA1D0054CB120056CB060056CD000059
        CD000468D1002DF1F50029E8F2002CF3F5032CF3F5052CF3F5072CF3F5052CF3
        F5032CF3F5002CF3F5002CF3F500000000000000000000000000000000000000
        000000000000}
      Proportional = True
      ShowHint = False
      Transparent = True
    end
    object ThreadEndProgressBar: TsProgressBar
      Left = 1
      Top = 55
      Width = 332
      Height = 17
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'GAUGE'
    end
  end
  object ImgSearchPanel: TsPanel
    Left = 416
    Top = 384
    Width = 333
    Height = 73
    Caption = 'Searching for images...'
    TabOrder = 3
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object Image10: TImage
      Left = 1
      Top = 1
      Width = 71
      Height = 54
      Align = alLeft
      Center = True
      Picture.Data = {
        0B54504E474772617068696336400000424D3640000000000000360000002800
        0000400000004000000001002000000000000040000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000010000000100000002000000020000000300000004000000050000
        0006000000070000000800000008000000080000000700000006000000040000
        0003000000020000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000100000001000000010000
        000200000003000000030000000500000006000000080000000A0000000C0000
        000E0000000F0000000F00000010000000100000000F0000000C000000090000
        0006000000040000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000001000000010000000100000001000000010000
        0001000000010000000100000001000000010000000100000001000000010000
        0001000000010000000100000001000000010000000100000001000000010000
        0001000000010000000100000001000000020000000200000003000000040000
        000500000007000000090000000B0000000E0000001100000014000000180000
        001A080807201A1916331A191731080807200000001800000016000000110000
        000B000000070000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        0001000000010000000100000001000000010000000200000002000000020000
        0002000000020000000300000003000000030000000300000003000000030000
        0003000000030000000300000003000000030000000300000003000000030000
        0003000000030000000300000003000000040000000500000007000000090000
        000C0000000E0000001200000015000000190000001D00000021000000240E0D
        0C322D2C278936352FD1383833CE3636319A272724490202021E000000170000
        00100000000A0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000010000000100000001000000010000
        0001000000020000000200000002000000030000000300000004000000040000
        0005000000050000000500000006000000060000000600000007000000070000
        0007000000070000000800000008000000080000000800000008000000070000
        0007000000070000000700000008000000090000000B0000000E000000110000
        0015000000190000001D0000002100000024000000290000002C0C0B0A392D2B
        26973D3C36F460615DFF6B6D69FF535450FE41423ED53334325D020202190000
        00110000000B0000000000000000000000000000000000000000000000000000
        0000000000000000000100000001000000010000000100000001000000020000
        0003000000030000000400000004000000050000000600000007000000070000
        000800000009000000090000000A0000000A0000000B0000000B0000000C0000
        000C0000000D0000000D0000000E0000000D0000000D0000000D0000000D0000
        000D0000000D0000000E0000000F0000001100000014000000180000001C0000
        002000000024000000270000002A0000002C0000002D0B0B0A392C2B26973C3C
        36F56B6D69FF949A97FF9DA3A0FF9A9F9CFF696C69FF484946D5383A38450000
        000D000000090000000000000000000000000000000000000000000000000000
        0000000000010000000100000001000000010000000200000003000000030000
        00040000000500000006000000070000000800000009000000090000000A0000
        000B0000000C0000000D0000000E0000000F0000000F00000010000000110000
        0011000000120000001300000013000000140000001400000014000000140000
        00140000001500000016000000170000001A0000001E00000022000000260000
        002A0000002C0000002D0000002E0000002C0C0C0A352D2C27953C3C36F46A6D
        69FF949997FF8E9391FF8C918FFFA7ADAAFFAEB4B1FF6D706DFF4B4E4CAF3335
        3419000000050000000000000000000000000000000000000000000000000000
        0000000000010000000100000001000000020000000300000004000000050000
        00060000000700000008000000090000000A0000000B0000000C0000000D0000
        000E0000000F0000001000000011000000120000001300000014000000150000
        001600000017000000170000001800000019000000190000001A0000001B0000
        001B0000001C0000001D0000002000000023000000270000002B0000002F0000
        003100000032000000310000002D0D0C0B332E2D27923C3C36F46A6D69FF9398
        96FF8E9391FF878C8AFF8C908EFF969B99FFBAC1BDFFA7AEAAFF595D5BEC4C4F
        4D43FFFFFF000000000000000000000000000000000000000000000000000000
        0001000000010000000100000002000000020000000400000005000000060000
        000700000008000000090000000A0000000B0000000D0000000E0000000E0000
        0010000000110000001200000013000000140000001500000016000000170000
        0018000000190000001A0000001B0000001C0000001D0000001E0000001F0000
        0020000000210000002300000026000000290000002D00000031000000340000
        003600000036000000310C0C0A362E2D27923C3C36F46A6C68FF939895FF8E93
        91FF878C8AFF8C918FFF929694FF9DA19FFFC0C7C3FFB1B8B4FF5C615FF64F53
        5155797F7C000000000000000000000000000000000000000000000000000000
        0001000000010000000100000002000000030000000400000005000000060000
        0007000000080000000A0000000B0000000C0000000D0000000E0000000F0000
        0010000000120000001300000014000000150000001600000017000000180000
        00190000001A0000001C0000001D0000001E0000001F00000020000000210000
        00220000002400000026000000290000002C0000003000000033000000370000
        0038000000360B0A093C2D2C26953C3B36F46A6C68FF929795FF8E9391FF878C
        8AFF8C918FFF929795FF9EA29FFFBCC3BFFFBEC5C2FF787D7BFF525654D05155
        532A656A67000000000000000000000000000000000000000000000000000000
        0001000000010000000100000002000000030000000400000005000000060000
        0007000000080000000A0000000B0000000C0000000D0000000E0000000F0000
        0010000000120000001300000014000000150000001600000017000000180000
        00190000001B0000001C0000001D0000001E0000001F00000020000000210000
        00230000002400000026000000290000002C0000002F00000033000000350000
        00350A0A093E2C2B26983C3B36F4696C68FF929795FF8D9391FF878C8AFF8C91
        8FFF939795FF9EA19FFFBCC2BFFFBEC6C2FF7A7F7CFF535654D95155534A5458
        5601525654000000000000000000000000000000000000000000000000000000
        0001000000010000000100000002000000020000000400000005000000060000
        000700000008000000090000000A0000000B0000000D0000000E0000000F0000
        0010000000110000001200000013000000140000001600000017000000180000
        00190000001A0000001B0000001C0000001D0000001E0000001F000000200000
        0021000000230000002500000027000000290000002C0000002F0000002F0B0B
        09392C2B26963C3B36F4696B68FF919694FF8D9290FF878C8AFF8C918FFF9397
        95FF9DA19FFFBCC2BEFFBEC6C2FF7A7F7DFF525654D95155534A555957015256
        5400000000000000000000000000000000000000000000000000000000000000
        0000000000010000000100000001000000020000000300000004000000050000
        00060000000700000008000000090000000A0000000B0000000D0000000E0000
        000F000000100000001100000012000000130000001400000015000000160000
        001700000018000000190000001A0000001B0000001C0000001D0000001D0000
        001E0000001F00000021000000220000002400000026000000260D0D0B302E2C
        27923C3B36F4696B68FF919694FF8D9290FF878C8AFF8D918FFF939795FF9DA1
        9FFFBBC1BEFFBEC6C2FF7A807DFF535654D95155534A55595701525654000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000010000000100000001000000020000000200000003000000040000
        0005000000060000000700000008000000090000000A0000000B0000000C0000
        000D0000000E0000000F00000010000000110000001200000013000000140000
        0014000000150000001600000017000000170000001800000018000000190000
        001A0000001A0000001B0000001B0000001C0000001B11100E262F2E298D3C3B
        36F4696B68FF919693FF8D9290FF878C8AFF8D918FFF939795FF9DA19FFFBBC1
        BEFFBEC6C2FF7B807DFF535755D95155534A5559570152565400000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000100000001000000010000000100000002000000030000
        0003000000040000000500000006000000070000000700000008000000090000
        000A0000000A0000000B0000000B0000000C0000000C0000000D0000000E0000
        000F000000100000001100000012000000120000001200000012000000130000
        0013000000130000001300000013000000121514121B312F29863C3B36F3696B
        67FF909593FF8D9290FF888C8AFF8D918FFF939795FF9DA19FFFBAC0BDFFBEC5
        C2FF7B807EFF535755D95155534A555957015256540000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000010000000100000001000000020000
        0002000000030000000300000004000000040000000500000005000000040000
        0004232424084F5251105F63611C666A6824696D6B29676B692961656425575A
        591D3E4140131415150C00000009000000090000000B0000000C0000000C0000
        000C0000000C0000000B0000000A1C1A1813312F2A7E3A3934F1666864FF8F94
        92FF8D9290FF888C8AFF8D918FFF939795FF9DA19FFFBAC0BDFFBEC5C2FF7B80
        7EFF535755D95155534A55595701525654000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000100000001000000010000
        000100000001000000020000000200000001292B2A017175740D7E83812F8085
        835C8186848B828785AC848987C4858A88D1868B8AD9868B89D8858A88D08388
        86C3818684AB7F8482897C817F5B757A782F565A580F03030304000000050000
        000600000006000000052524200C31302A77383731F060625FFF8A8F8CFF8A8F
        8DFF878B89FF8D918FFF939795FF9DA19EFFB9BFBCFFBEC5C1FF7C817EFF5357
        55D95155534A5559570152565400000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000100000001FFFFFF006E7371028186841F82878561838886AA888D8BDF9196
        94F69FA3A2FFADB0AFFFB8BCBBFFBFC3C2FFC3C7C6FFC3C6C6FFBFC3C2FFB8BB
        BAFFACAFAEFF9EA2A1FE909593F5878C8ADC828785A58186845C7B807E1C3F41
        400200000000312F290932302B7135342FEE585A57FF838785FF848987FF8287
        85FF898E8CFF929694FF9DA19FFFB9BFBCFFBEC5C1FF7C817EFF535755D95155
        534A555957015256540000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000868A
        8900888A8A00868B891C84898771858A88C9909593F7A8ACAAFFC4C7C6FFD9DB
        DBFFE4E7E6FFE9EBEBFFEAEDEDFFEBEEEDFFEBEEEDFFEBEEEEFFECEFEEFFECEE
        EEFFEAECECFFE4E7E6FFD8DADAFFC2C5C5FFA6AAA9FF8F9492F5848987C48388
        86697276731F312F2A6C33322DEC4C4D4AFF707472FF787D7BFF7C807FFF8589
        87FF8D918FFF999D9BFFB7BDBAFFBDC4C1FF7C817EFF535755D95155534A5559
        5701525654000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000888D8B00898E
        8C09878C8A51878C8ABF939896F9B3B7B5FFD5D9D8FFE7E9E9FFEAECECFFE7EB
        EAFFE5E9E7FFE3E7E5FFE1E6E4FFE0E5E3FFE0E5E3FFE1E5E3FFE3E7E5FFE6EA
        E8FFE9EDECFFECEFEEFFEEF0F0FFEEF0F0FFE8EAEAFFD4D6D6FFB0B4B3FF9196
        94F67C807ECC4B4C48EB434441FF5C5F5EFF646867FF6A6E6DFF787C7AFF868A
        87FF949795FFB1B6B4FFB9C0BCFF7B817EFF535755D95155534A555957015256
        5400000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000898E8C00898F8C00898F8C19888D
        8B868D9290EBABAFADFFD5D8D7FFE8EBEBFFE7EAE9FFE2E6E4FFDDE2E0FFD6DC
        D9FFCED4D2FFC7CECCFFC2C9C6FEBFC5C1FCBDC2BFFCBDC3BFFCBFC5C2FCC3CA
        C8FECAD1CFFFD4DAD8FFDFE4E2FFEAEDECFFEFF1F1FFEFF2F1FFEAEDEDFFD3D5
        D5FFA5A9A8FF808482FF686C6AFF5C5F5EFF5D605FFF646766FF727574FF8589
        87FFA8ADAAFFB1B8B5FF777C79FF515553D95155534A565B5801525654000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000008C908E00898E8C008B908E26898F8DAB969B
        99FAC2C5C4FFE5E8E8FFE7EAE9FFDFE4E2FFD8DDDBFFCCD2D0FFC0C7C5FEB8BB
        B6FCB3ADA1F9AF9D89F7AC9075F9AA8767F6A98260F4A98260F4AA8767F6AC90
        75F9AE9D89F7B3ADA1F9B9BCB7FCC5CBC9FED7DCDAFFE9ECEBFFF1F3F2FFF0F2
        F2FFE4E7E6FFBABDBCFF8C908EFF747876FF676B69FF676A68FF6F7271FF8E93
        90FFA0A5A2FF717674FF4F5351D94F53514A595D5B0151555300000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000008C938F008B9090008C928F2B8B918EB99DA2A0FED1D4
        D3FFE9EBEBFFE1E6E4FFD8DEDCFFCAD1CFFFBBC2BFFEB2B0A6F9AC957EF7A87B
        56F8A66D3FF6A66937EEA86937E1AA6C39D5AB6D3BCFAB6D3ACFAA6C39D4A869
        37DFA66837EDA66D3FF6A87B56F8AD967EF7B5B2A9F9C2C8C5FEDADEDDFFEEF1
        F0FFF2F4F4FFEBEDEDFFC9CBCBFF939795FF7B7F7DFF707472FF787C7AFF858A
        88FF666B68FF4D514FD94E52504A5B5F5D015155530000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000008E9290008E9391008E9391238C9290B6A0A5A4FFD6D9D9FFE8EB
        EAFFDDE3E0FFD1D8D5FFBEC5C3FFB1B2AAFAAB9178F6A67247F7A66836ECAD70
        3DCFB77E4DACC18B5C92C7946683CB9A6C7ACD9B6E76CD9B6E75CB9A6C76C794
        667DC08A5B8CB67C4CA6AC6F3CCAA66836EBA67247F7AD937AF6B6B7B0FACBD0
        CFFFE9ECEBFFF4F6F5FFEFF1F0FFCFD2D1FF959998FF7D817FFF717673FF5B5F
        5CFF4C4F4DD94E52504A5E646101525654000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000008F9593008F9593138E9391A39EA3A1FED6D9D8FFE7EBEAFFDBE1
        DEFFCCD3CFFFB6BDBAFEACA193F8A67852F7A66836EFB17443C7C18C5D9ACD9C
        6E81D0A17477D0A07473D0A07370CFA0736DCF9F726BCF9F7269CFA07369D0A0
        7369D0A1746AD0A1746CCC9C6E75C08A5B8EB07341C0A66836EDA87A54F7B1A6
        98F8C2C8C5FEE4E7E6FFF5F7F7FFF0F2F2FFCED1D0FF939896FF707572FF4F52
        50D84E52504A6264620153565400000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000091969400929795048F959278999E9CF7CFD2D1FFE8EBEAFFDAE0DDFFC9D0
        CDFFB2B8B4FDA99681F6A56D40F7AB6D3ADEBE8858A6CE9D7085D0A0737CCF9F
        7278CF9F7273CF9F726ECF9F726ACF9F7267CF9F7264CF9F7263CF9F7262CF9F
        7263CF9F7265CF9F7267CF9F726AD0A1746DCE9D7076BD865699AA6C39D9A66E
        41F7AE9B87F6BEC3C0FDE3E7E6FFF7F8F8FFEFF1F0FFC6C9C8FF8B908EFF787D
        7B906A6E6C057277750000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000009298
        95009296950091979540949997E2BFC3C2FFE8EAEAFFDCE1DFFFCAD1CEFFB1B7
        B4FDA8927CF7A46A3BF7B07342D0C7946798D0A07385CF9F727FCF9F7279CF9F
        7274CF9F726ECF9F7269CF9F7264CF9F7261CF9F725DCF9F725CCF9F725BCF9F
        725CCF9F725ECF9F7261CF9F7265CF9F726ACF9F726FD0A07373C7936587AE72
        40C9A56B3BF6AD9882F7BEC4C1FDE7EAE9FFF6F7F7FFEAECECFFB7BABAFF8A90
        8ED8888D8B34898E8C00888E8A00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000009499
        970094999711929895ACABAFADFFE3E5E5FFE0E4E3FFCED5D2FFB3B9B7FEA796
        83F7A46A3CF7B27645CECB996C96D0A07388CF9F7283CF9F727CCF9F7276CF9F
        726FCF9F7269CF9F7264CF9F725FCF9F725ACF9F7257CF9F7255CF9F7254CF9F
        7255CF9F7257CF9F725BCF9F725FCF9F7265CF9F726ACF9F7270D0A07375CA98
        6B84B07442C6A56B3CF6AD9D89F7C3C9C6FEEDEFEFFFF3F5F5FFE1E3E3FFA0A5
        A3FF888E8B9E8A8F8D0C8A8F8D00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000959B9800939A
        9800939997559AA09DF1D0D4D3FFE6E9E8FFD4DAD7FFB9C0BEFFA79F93F9A46F
        43F8AF7241D7CA996B9CD0A0738DCF9F7287CF9F7280CF9F7279CF9F7272CF9F
        726CCF9F7266CF9F725FCF9F725ACF9F7255CF9F7251CF9F724ECF9F724DCF9F
        724ECF9F7251CF9F7255CF9F725BCF9F7260CF9F7267CF9F726DCF9F7273D0A0
        7379CA986A89AE713FD0A57045F8AFA99CF9CED3D2FFF2F4F4FFF0F1F1FFC9CC
        CBFF909593EB898F8D488A908E008B908E000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000969C9A00969C
        9A0F959A98AFB1B6B4FFE6E8E8FFDBE1DEFFC4CCC8FFA9ABA6FCA47B59F8AA6C
        39E8C69264A8D0A07392CF9F728CCF9F7285CF9F727ECF9F7277CF9F7270CF9F
        726ACF9F7262CF9F725CCF9F7255CF9F7250CF9F724BCF9F7247CF9F7246CF9F
        7247CF9F724BCF9F7251CF9F7257CF9F725DCF9F7263CF9F726ACF9F7271CF9F
        7278D0A0737EC5916296A96A38E3A77F5CF8B5B8B2FCDFE3E2FFF2F4F4FFE5E8
        E8FFA7ABAAFF8B908EA28C918F0A8C918F000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000949A9A00979D9B00969C
        9A409BA09EEACFD3D2FFE5E9E8FFD0D7D4FFB2B9B6FEA3917EF7A56938F6BC84
        54BFD0A07399CF9F7292CF9F728BCF9F7284CF9F727DCF9F7276CF9F726ECF9F
        7267CF9F7260CF9F7259CF9F7252CF9F724CCF9F7246CF9F7241CF9F723FCF9F
        7241CF9F7247CF9F724DCF9F7253CF9F725ACF9F7261CF9F7268CF9F726FCF9F
        7276CF9F727ED0A07384BA8252B1A56938F4AB9986F7C4CAC8FEEEF1F0FFEFF1
        F1FFC8CBCAFF909593E28C918F348D9290000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000999F9D009BA19F02979D
        9A84A9AFADFEE3E6E5FFDDE2E0FFC3CBC8FFA5A7A2FBA27650F7AE713FE0CC9A
        6DA5CF9F7299CF9F7292CF9F728ACF9E7183CE9E707BCE9E7174CF9E716DCE9E
        7066CE9E705ECE9E7057CF9E7151CF9F724ACF9F7243CF9F723CCF9F7239CF9F
        723DCF9F7244CF9F724BCF9F7252CF9F7259CF9F7260CF9F7268CF9F726FCF9F
        7276CF9F727DCFA07384CB9A6C91AD6F3DD9A67954F7B2B4AFFBDEE2E1FFF1F3
        F3FFDFE2E2FF9EA3A1FC8C929076B3F3D0008E94920000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000009AA09E009AA09D13999F
        9DBFBEC3C1FFE9EBEBFFD4DBD8FFB5BCBAFFA19484F7A56939F6BD8656C2D0A0
        739FCF9F7199CF9F7292D1A2778DD4AA828BD8B18D8ADBB69487DCB99882DCB9
        987ADAB69370D7AF8A63D3A67D56CF9F734ACE9D7042CF9E713DCF9F723ACF9F
        723ECF9F7244CF9F724BCF9F7252CF9F7259CF9F7260CF9F7268CF9F726FCF9F
        7276CF9F727DCF9F7284D0A0738ABB8454B4A56A3AF5AA9D8DF8CACFCEFFEFF1
        F1FFEBEDEDFFB4B8B6FF8E9491B28F95920D9095930000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000009BA19F009AA09E339EA4
        A1E4D2D5D4FFE5E9E8FFCBD3CFFFA8AEABFDA08063F7AA6C3AEBC99769AFCF9F
        72A0D3A87FA0DCBA99A6E2C5ABAAE6CEB7ADE9D3BEACEAD5C2A9EBD7C5A6ECD9
        C7A1ECD9C89BECD8C793EAD5C185E5CBB471DDBA9A58D2A67C46CE9E7040CF9F
        7142CF9F7248CF9F724ECF9F7254CF9F725BCF9F7262CF9F7269CF9F7270CF9F
        7277CF9F727ECF9F7285D0A0738CC896689DA96B39E6A68669F7B9BEBCFDE8EB
        EAFFEEF1F0FFC8CBCAFF939896DB8F9592289196940000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000009DA3A1009CA2A0009BA19E57A6AB
        A9F6E0E2E2FFE0E5E3FFC2CAC7FFA1A39DFBA1724AF8B37745DACF9E71A9D0A1
        75A3DFBFA1B3E8D1BCBDE9D3BFBAEAD5C2B7EBD7C5B3ECD9C7B0EDDACAADEDDC
        CCA9EEDECEA5EFDFD0A1F0E0D29EF0E1D399EFDFD08FEAD5C27ADEBD9F5CD1A3
        774BCE9E704CCF9F7252CF9F7257CF9F725ECF9F7264CF9F726BCF9F7272CF9F
        7279CF9F727FCF9F7287CF9F728DCE9E7196B17543D2A4754DF8AEB0AAFBDCE1
        E0FFEFF1F1FFD8DBDAFF9A9F9DF19096934A9297950093979500000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000009EA4A2009CA29E009CA2A077AEB3
        B1FEE7E9E9FFDBE1DEFFBAC2BFFF9D988EF9A36B3EF7BB8353CAD0A072A8D4AA
        82AAE6CDB5C0E9D4C0C1EAD6C2BEEBD8C5BBECD9C8B8EDDBCAB5EEDDCCB2EEDE
        CFAFEFDFD0ABF0E1D2A8F0E1D4A4F1E2D5A0F1E3D59EF1E3D69BEFDFD093E6CE
        B778D5AC855BCF9E7156CF9F725CCF9F7262CF9F7268CF9F726ECF9F7274CF9F
        727BCF9F7282CF9F7288CF9F728FD0A07395BA8151C0A46C3FF7A9A499F9D1D6
        D5FFEEF1F0FFE1E3E3FFA2A6A5FA919794679298960093999700000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000009FA5A300A1A6A4039DA3A191B6BB
        B9FFEAEDECFFD7DEDAFFB3BBB8FF9C8F80F9A56939F5C18B5CC0D0A072A9DAB6
        94B5E9D3BEC7EAD6C2C5EBD8C5C2ECDAC8C0EDDBCBBDEEDDCDBBEFDFCFB8EFE0
        D1B5F0E1D3B2F1E2D4AFF1E3D5ABF1E3D6A8F1E3D6A6F1E3D6A3F1E3D5A2F0E1
        D39FEAD5C28CD9B28E6ACF9E7161CF9F7266CF9F726CCF9F7271CF9F7278CF9F
        727ECF9F7284CF9F728BCF9F7292D0A07397C08A5BB6A56A39F5A6998AF9C8CE
        CDFFECEFEEFFE6E8E8FFAAAEADFF92989582757A6F00949A9800000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000A1A7A400A1A7A4069FA5A29EBBC0
        BEFFECEEEDFFD5DBD8FFAFB6B4FF9B8A77FBA66A38F4C59062BBD0A174ABE0C0
        A3BFEAD6C3CCEBD8C5CAECDAC8C7EDDCCBC5EEDDCEC2EFDFD0C0F0E0D2BEF0E2
        D4BBF1E2D5B8F1E3D6B6F1E4D7B3F2E4D8B0F2E4D7AEF1E4D7ACF1E3D6A9F1E2
        D4A8F0E1D3A7EBD6C398D9B28E75CF9E716BCF9F7270CF9F7276CF9F727BCF9F
        7281CF9F7288CF9F728ECF9F7295D0A0739AC48F61B2A66A39F3A49380FBC2C8
        C7FFEAEDECFFE8EAEAFFAFB3B2FF9399968E959B9902959B9900000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000A2A8A500A2A8A508A0A6A4A6BFC3
        C1FFECEEEEFFD3DAD7FFACB4B1FE9A8672F6A76938F2C69264B8D1A277ADE3C7
        ADC6ECD8C6D0ECDAC8CDEDDCCBCCEEDECECAEFDFD0C7F0E1D2C6F0E2D4C3F1E3
        D6C1F1E4D7BFF2E5D8BDF2E5D9BAF2E5D9B8F2E5D9B5F2E4D8B3F1E4D7B1F1E3
        D5B0F0E1D3AEEFDFD1AEE9D3BF9ED6AD867ACF9E7175CF9F727ACF9F7280CF9F
        7285CF9F728BCF9F7291CF9F7298D0A0739DC69264B1A76A38F1A38F7AF6BFC5
        C3FEE8ECEBFFE9EBEBFFB2B6B5FF949A9896969C9904969C9A00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000A3A9A600A3A9A607A1A7A5A2BEC3
        C1FFEDEFEEFFD4DBD8FFACB4B1FF998773F9A66938F3C59162B9D2A479AEE5CB
        B3CAECDAC9D4EDDBCBD1EEDDCED0EFDFD0CEF0E1D3CDF1E2D5CBF1E3D7C9F2E4
        D8C7F2E5D9C5F2E6DAC3F3E6DAC1F2E6DABFF2E6DABDF2E5D9BBF2E4D8B9F1E3
        D6B7F0E2D4B5EFE0D1B4EEDECEB3E5CCB39ED2A47A7FCF9F717FCF9F7285CF9F
        728ACF9F7290CF9F7295CF9F729BD0A073A1C59163B6A76A38F3A28F7CF9BEC5
        C3FFE8ECEAFFE9EBEBFFB1B6B4FF959C9991989D9B03989D9B00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000A4AAA800A4AAA805A2A9A697BCC1
        BFFFEEEFEFFFD7DDDAFFAEB6B3FF988978FBA56938F5C28D5EBED2A479ADE5CC
        B4CBEDDCCBD8EEDDCDD6EFDFD0D4F0E1D3D3F1E2D5D2F1E4D7D0F2E5D9CFF3E6
        DACDF3E7DBCCF3E7DCCAF3E7DCC8F3E7DCC6F3E6DBC4F2E6DAC1F2E5D9BFF1E4
        D7BEF1E2D5BCF0E0D2BBEFDFCFBAEDDBC9B6DEBC9D98CF9F7285CF9F728ACF9F
        728FCF9F7294CF9F729ACF9F729FD0A073A5C28D5EBDA66A39F5A19382FBC1C7
        C6FFE8ECEAFFE7E9E9FFAFB4B2FF979D9A879C9F9E01999F9C00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000A5ABA900AAB0B200A3AAA782B7BC
        BAFFECEEEEFFDBE1DEFFB3BBB8FF968E82F8A3693BF7BD8656C6D1A276ACE4CA
        B1C9EEDECEDAEFDFCFD9F0E1D2D8F1E3D5D8F2E4D7D7F2E5D9D5F3E7DBD4F3E7
        DCD3F4E8DDD2F3E8DED0F4E8DECEF3E8DDCCF3E7DCCAF3E7DBC8F2E6DAC6F2E4
        D8C4F1E3D5C2F0E1D3C1EFDFD0BFEEDDCDBFE8D2BCB3D4A98192CF9E718FCF9F
        7294CF9F7299CF9F729ECF9F72A4D0A073A8BD8656C6A46A3CF7A0998DF8C7CC
        CBFFE9ECEBFFE3E6E6FFAAAFADFC989E9C719AA09D009AA09D00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000A7ADAA00A6ADAA00A5ABA962B1B7
        B4F9E8EBEAFFE0E5E3FFBBC3C0FF95948DFBA06C43F8B67B4AD5CF9F72ACE1C3
        A7C4EFDFD0DCF0E0D2DCF1E2D5DCF2E4D7DCF2E6DADBF3E7DCDAF4E8DDD9F4E9
        DFD8F4E9DFD7F4EAE0D6F4E9DFD4F4E9DFD2F4E8DED0F3E7DCCEF3E6DACCF2E5
        D8CAF1E3D6C8F0E1D3C6EFDFD0C5EEDDCDC4ECDAC8C2DEBD9DA7CF9F7295CF9F
        7299CF9F729ECF9F72A3CF9F72A8CF9F72ABB67B4AD5A26F45F8A1A19AFBCFD4
        D2FFE9EDECFFDDE0DFFFA5AAA8F59AA09D539CA29F009BA19F00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000A8B1AE00A7AEAB00A6ADAA40ACB2
        B0ECDFE2E1FFE8EBEAFFC6CDCAFF999D9AFD9B7454F7AD703DE6CB996BB0DBB8
        96BBEFDECFDBF0E2D4DFF1E4D7DFF2E5D9E0F3E7DCE0F4E8DEDFF4E9E0DEF5EA
        E1DEF5EBE1DDF5EBE2DBF5EBE1DAF5EAE0D8F4E9DFD6F4E8DDD4F3E7DBD1F2E5
        D9CFF1E3D7CDF0E2D4CBEFE0D0CAEEDDCDC9EDDBCAC8E6CDB5BBD2A47A9ECF9F
        719FCF9F72A4CF9F72A8CF9F72ABCC9A6DB0AD6F3DE69F7958F7A6ABA7FDD9DE
        DCFFEAEDECFFD2D5D4FFA0A6A4E59BA19F349DA3A00000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000A9AFAC00A8AEAC1CA9AF
        ADCDD1D4D3FFEFF1F0FFD0D7D4FFA3AAA8FF94816DF7A56837F4C28C5DBED5AA
        82B1EBD8C6D5F1E4D7E1F2E5D9E2F3E7DBE3F4E8DEE4F4EAE0E3F5EBE2E3F6EC
        E3E3F6ECE4E2F6ECE3E0F5ECE3DFF5EBE2DDF5EAE0DBF4E9DED8F3E7DCD6F2E6
        DAD4F1E4D7D2F0E2D4D0EFE0D1CEEEDDCECDEDDBCACCEAD5C1C8D7AF8AABCF9E
        71A4CF9F72A9CF9F72ACD0A073ABC28D5EBFA66937F49C8975F7B3B9B7FFE1E5
        E3FFEAEDECFFC3C7C5FF9EA4A1C19DA3A1149EA4A10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000AAB0AE00AAB0AE06A8AF
        AC9BBFC4C2FFF0F2F1FFDCE2DFFFB5BCB9FF918E86FA9F6B41F8B37847D9CF9F
        72ADE3C6ACC6F2E5D8E1F3E7DBE3F4E8DEE5F4EAE0E6F5EBE2E7F6EDE4E8F6ED
        E5E7F6EEE6E6F6EEE5E5F6EDE5E3F6ECE3E2F5EBE1DFF4E9DFDDF3E8DDDBF2E6
        DAD8F2E4D7D6F0E2D4D5EFE0D1D3EEDDCED1EDDBCAD0EBD8C5CFDDBB9BB9CF9F
        71AACF9F72ACCF9F72ACCE9E71ADB37847D9A16E43F89C9A92FAC5CBC9FFE6EA
        E8FFE5E8E7FFB2B7B5FF9EA4A18C9FA5A3039FA5A30000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000ABB2AF00ABB2AF00AAB1
        AE56B1B8B5F4E5E7E6FFE9EDEBFFC8CFCBFF999F9CFE957A60F6A76937F2C38E
        5FBCD7AE88B3EDDCCCD9F4E8DEE5F4EADFE6F5EBE2E8F6EDE4EAF7EEE6EBF7EF
        E8EBF7F0E8EBF7EFE7E9F6EEE6E8F6EDE4E5F5EBE2E3F4EAE0E0F3E8DDDEF3E6
        DADCF1E4D7DAF0E2D4D8EFDFD1D6EEDDCDD5EDDAC9D4EBD8C6D4E1C3A7C3D0A0
        74ADCF9F72ACD0A073ABC38E60BDA76937F29B8066F6A6ABA9FED8DDDBFFE9EC
        EBFFD6DAD9FFA6ACA9EE9FA6A348A1A7A400A0A7A40000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000ACB3B000ACB2
        B01CACB3B0C8CDD1CFFFF3F4F4FFD8DEDBFFAFB7B4FF8E8B83FA9E6C43F8B073
        42E0CC9B6DB0DFBFA1C0F2E5D8E1F5EBE1E7F6ECE3E9F7EEE6EBF7F0E8EDF8F1
        EAEEF8F1EBEEF8F0E9EDF7EFE7EBF6EDE5E8F5ECE2E6F5EAE0E4F3E8DDE1F2E6
        DADFF1E4D7DDF0E1D3DBEFDFD0DAEEDDCCD8EDDAC9D7ECD8C6D5E4C9AFC8D0A2
        77AECF9F72ABCC9A6DB0B07342E0A06E45F899968DFABEC4C2FFE2E7E5FFE9EB
        EBFFBFC4C2FFA2A8A5BCA1A7A514A2A8A6000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000ADB4B100AEB3
        B201ACB3B073B7BDBAFAEAECEBFFE9EDEBFFC9D0CDFF9BA19FFE917E6CF7A367
        38F7B87F4ED0D0A175AEE5CAB1C9F4E9DFE6F6EDE5EAF7EFE7ECF8F1EAEEF8F2
        ECEFF9F2ECF0F8F1EAEEF7EFE8ECF6EDE5EAF5ECE2E8F4EADFE6F3E7DCE3F2E5
        D9E1F1E3D6DFF0E1D3DDEFDED0DBEEDCCCD9EDDBC9D8EBD8C5D5E0C1A4C3D0A1
        75ADCE9E71ADB87F4ED0A36838F7988673F7A7ADABFED7DCDAFFE8EBEAFFDBDE
        DDFFABB1AFF7A2A9A664A6ABA700A3A9A7000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000AEB5
        B200AEB5B223AEB5B2CBCDD1CFFFF5F6F5FFDDE3E0FFBBC2BFFF909390FD9576
        5AF6A66836F4BC8454C8D2A57BB0E7CEB7CCF4EAE0E6F7EFE7ECF8F0E9EDF8F1
        EBEFF8F1EBEFF8F0EAEEF7EFE7ECF6EDE4EAF5EBE2E8F4E9DFE6F3E7DCE4F2E5
        D9E2F1E3D6E0F0E1D3DDEFDFCFDBEEDDCCD9ECDAC8D7E3C6ACC6D3A77DB0CF9E
        71ACBC8455C9A66836F49A7B5FF69A9E9BFDC8CECBFFE2E7E5FFE7EAE9FFBFC3
        C2FFA4ABA8BFA4ABA81AA5ABA800000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000B0B6
        B300B3B8B200AFB5B263B5BBB8F3E2E5E3FFF2F4F3FFD5DBD8FFAEB6B3FF8B8C
        87FB977252F7A66836F3BB8352CAD0A176B0E3C7ACC5F3E7DBE3F7EFE8ECF7F0
        E9EDF7F0E8EDF7EFE7ECF6EEE5EAF6ECE3E9F5EAE1E7F4E8DEE5F3E6DBE3F2E4
        D8E1F1E2D5DFF0E1D2DDEFDFD0DBECD9C6D6E0C2A5C3D3A67CAFCE9D6FADBB83
        53CAA66836F39B7656F7959690FBBBC0BEFFDDE2E0FFE9ECEBFFD2D6D5FFAAB1
        AEEEA5ABA955A7ACAA00A6ACAA00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B1B7B500B1B7B511B0B6B4A3BFC5C2FEEFF0F0FFEDF0EEFFD0D7D3FFA8AF
        ADFF8A8A84FB967253F7A56736F5B57B4AD5CA996CB4DCB896BAEBD8C5D4F4E9
        DEE5F6EDE5EAF6EEE5EAF6ECE4E9F5EBE1E7F4E9DFE6F3E8DCE4F2E6DAE2F2E4
        D8E1F1E2D5DFEEDDCDDAE7CFB9CEDAB593BAD1A276ACCA9769B3B57B4AD5A567
        36F5997657F793928CFBB3B9B7FFD9DEDCFFE7EAE9FFDEE1E1FFB3B9B7FDA6AD
        AA95A7AEAB0BA7AEAB0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B2B9B600B2B9B600B1B8B52BB1B9B6CAC9CECCFFF4F5F5FFEBEEECFFCED5
        D2FFA9B1AEFF8B8C87FC92775EF6A16739F8AD6F3DE6BE8757C4CF9F74B3DCB8
        97BBE7CFB8CCEEDCCCD9F1E3D6DFF2E5D8E1F2E4D8E1F1E2D5DFEFDFCFDBEBD7
        C5D4E5CAB2C9DCB896BAD3A67CAFCC9A6CB0BE8758C5AD6F3DE7A1683AF8967A
        61F692948FFCB3B9B7FFD6DCD9FFE5E9E8FFE3E6E6FFBCC2C0FFA9AFACBFA8AF
        AC22A8AFAC00ADB0B30000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000B2B9B600B6BCB900B2B9B647B3BAB7DCCFD3D1FFF5F6F6FFEBEE
        EDFFD0D8D4FFB2B9B6FF909592FD8C7F70F79A6E49F7A46736F6AE713FE3BB82
        51C9C79366B8D0A278B4D6AD87B5DAB592B8DBB795BADAB592B9D7AF8AB5D3A7
        7DB1CD9D70B0C69263B7BB8353CAAE713FE3A46837F69B6F4AF7908374F7969A
        98FDB9C0BDFFD7DDDAFFE5E8E7FFE5E7E7FFC2C7C5FFABB2AFD4AAB0AD3DABB2
        AE00A9B0AD000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000B4BBB800B4BBB802B3BAB755B5BCB9E0CDD3D0FFF3F4
        F4FFEEF1F0FFD7DEDAFFBFC6C3FF9EA5A3FF8B8C86FB8E7B69F7996E4AF7A168
        39F7A76938F0AE703EE4B37846D8B77D4CD0B9804FCCB9804FCCB77D4CD0B378
        46D8AE713EE4A76A38F0A1683AF7996E4BF7907D6AF78E8F89FBA3A9A7FFC5CC
        C9FFDBE0DEFFE6EAE8FFE3E6E5FFC2C7C5FFADB3B1D9ABB2AF4AADB3AE01ACB2
        AF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B5BCB900B5BCB903B4BBB850B5BCB9D7C8CD
        CBFFECEEEDFFF3F5F4FFE1E6E4FFCED5D2FFB6BEBBFF9CA2A0FF8D8F8BFC8B82
        76F9917861F7977050F89B6C45F89E693EF59F693DF99F693DF99E693EF59B6C
        45F897704FF8917861F78B8276F98E908CFC9EA5A3FFBBC2BFFFD2D9D6FFDFE4
        E2FFE8EBEAFFDDE0E0FFBEC4C1FFAEB5B2CFACB3B046ADB5B101ADB4B1000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000B5BCB900B7BEBB01B5BCB93EB4BB
        B8BDBFC5C3FBDDE1DFFFF3F4F4FFEEF0EFFFDDE3E0FFCED5D2FFBDC5C1FFAAB1
        AFFF9AA19FFE919592FD8C8E88FB8B8981FA8B877FFD8B877FFD8B8981FA8D8E
        88FB919592FD9BA2A0FEACB3B0FFC0C7C4FFD1D8D5FFDDE2E0FFE6EAE9FFE6E9
        E8FFD1D5D4FFB8BEBBFAAFB5B2B4AEB5B235AFB6B201AEB5B200000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000B5BCB900B2B9B600B5BC
        B920B4BBB88DB7BEBBE8C9CECCFFE3E6E5FFF2F3F3FFEEF1F0FFE3E7E5FFD8DE
        DBFFCFD6D2FFC6CDCAFFBEC5C2FFB8BFBCFFB4BCB9FFB5BCB9FFB8C0BDFFBFC6
        C3FFC7CECBFFD0D7D4FFD8DFDCFFE1E5E3FFE8EBEAFFE8EAEAFFD9DDDCFFC1C7
        C5FFB2B9B6E4B0B6B384B0B6B31BB0B7B400AFB6B30000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000B5BC
        B900B5BCB908B4BBB848B4BBB8AFB9BFBDEFC8CDCBFFDCDFDEFFEBEDEDFFF0F2
        F1FFEEF0EFFFE9ECEAFFE4E8E6FFE1E6E3FFDFE4E2FFDFE4E2FFE0E5E3FFE3E7
        E5FFE6EAE8FFE9ECEBFFEAECECFFE4E6E6FFD5D9D8FFC3C8C6FFB6BCBAECB1B8
        B5A8B1B8B541B1B8B606B1B8B500000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B5BCB900C1C7C400B5BCB910B4BBB84FB4BBB8A2B6BDBADEBDC4C1F9C8CE
        CCFFD5D9D7FFDEE1E0FFE4E7E6FFE6E9E8FFE8EBEAFFE8EAEAFFE5E8E7FFE1E4
        E3FFDBDEDDFFD1D6D4FFC6CBC9FFBCC2C0F8B6BCB9DBB3BAB79DB3BAB749B3BA
        B70EA9B1AD00B5BCB90000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000B6BDBA00BCC3C000B5BCB90AB4BBB82EB4BBB867B4BB
        B89CB5BCB9C6B7BDBBE0B9C0BDEFBBC2BFF4BDC3C1F7BDC3C1F6BBC2BFF4B9C0
        BDEDB6BDBADEB5BCB9C4B4BBB899B4BBB863B4BCB82BB5BCB908B6BDBA00B5BC
        B900000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000B6BDBA00B7BEBB00B5BC
        B906B4BBB817B4BBB82BB4BBB843B4BBB850B4BBB858B4BBB858B4BBB84FB4BB
        B841B4BBB829B4BBB815B5BCB906BDC4C100B6BDBA0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000}
      Proportional = True
      Transparent = True
      ExplicitLeft = 2
      ExplicitTop = 0
    end
    object ProgressBar1: TsProgressBar
      Left = 1
      Top = 55
      Width = 331
      Height = 17
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'GAUGE'
    end
  end
  object sPanel3: TsPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    SkinData.SkinSection = 'PANEL'
    object Bevel1: TBevel
      Left = 606
      Top = 0
      Width = 3
      Height = 58
      Align = alRight
      Shape = bsRightLine
      ExplicitLeft = 605
    end
    object Bevel2: TBevel
      Left = 528
      Top = 0
      Width = 3
      Height = 58
      Align = alRight
      Shape = bsRightLine
      ExplicitLeft = 481
    end
    object Bevel3: TBevel
      Left = 300
      Top = 0
      Width = 3
      Height = 58
      Align = alRight
      Shape = bsRightLine
      ExplicitLeft = 253
    end
    object CloseProjectBtn: TsBitBtn
      Left = 225
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Hint = 'Close current project'
      Align = alLeft
      Caption = 'Close Project'
      Enabled = False
      Layout = blGlyphTop
      TabOrder = 0
      OnClick = CloseProjectBtnClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 3
      Images = ToolBarImgs
    end
    object EditProjectBtn: TsBitBtn
      Left = 150
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Hint = 'Edit current project'
      Align = alLeft
      Caption = 'Edit Project'
      Enabled = False
      Layout = blGlyphTop
      TabOrder = 1
      OnClick = EditProjectBtnClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 2
      Images = ToolBarImgs
    end
    object NewProjectBtn: TsBitBtn
      Left = 75
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Hint = 'Create a new project'
      Align = alLeft
      Caption = 'New Project'
      Layout = blGlyphTop
      TabOrder = 2
      OnClick = NewProjectBtnClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 1
      Images = ToolBarImgs
    end
    object OpenProjectBtn: TsBitBtn
      Left = 0
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Hint = 'Open a project'
      Align = alLeft
      Caption = 'Open Project'
      Layout = blGlyphTop
      TabOrder = 3
      OnClick = OpenProjectBtnClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 0
      Images = ToolBarImgs
    end
    object OpenProjectFolderBtn: TsBitBtn
      Left = 453
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Hint = 'Open projects output folder'
      Align = alRight
      Caption = 'Images'
      Enabled = False
      Layout = blGlyphTop
      TabOrder = 4
      OnClick = OpenProjectFolderBtnClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 6
      Images = ToolBarImgs
    end
    object SettingsBtn: TsBitBtn
      Left = 531
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Hint = 'General program settings'
      Align = alRight
      Caption = 'Settings'
      Layout = blGlyphTop
      TabOrder = 5
      OnClick = SettingsBtnClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 7
      Images = ToolBarImgs
    end
    object StartBtn: TsBitBtn
      Left = 303
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Hint = 'Start downloading current project'
      Align = alRight
      Caption = 'Download'
      Enabled = False
      Layout = blGlyphTop
      TabOrder = 6
      OnClick = StartBtnClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 4
      Images = ToolBarImgs
    end
    object StopBtn: TsBitBtn
      Left = 378
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Hint = 'Stop downloading'
      Align = alRight
      Caption = 'Stop'
      Enabled = False
      Layout = blGlyphTop
      TabOrder = 7
      OnClick = StopBtnClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 5
      Images = ToolBarImgs
    end
    object DonateBtn: TsBitBtn
      Left = 609
      Top = 0
      Width = 75
      Height = 58
      Cursor = crHandPoint
      Align = alRight
      Caption = 'Donate'
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000200000004000000070000
        000B0000000F0000001200000015000000170000001800000019000000190000
        0019000000180000001600000014000000110000000D00000009000000050000
        0002000000010000000000000000000000000000000000000000000000000000
        0000000000000000000000000002000000050000000A0000000F000000140000
        00190000001E0000002200000025000000280000002A0000002B0000002B0000
        002B000000290000002700000024000000200000001C00000017000000120000
        000C000000070000000300000001000000000000000000000000000000000000
        00000000000000000003000000080000000F000000160000001C000000230000
        00280000002E00000033000000370000003A0000003E00000041000001420000
        00400000003C0000003900000035000000310000002B00000026000000200000
        0019000000120000000C00000005000000010000000000000000000000000000
        000000000002000000070000000F000000160000001D000000240000002B0000
        00300000003800081346021E385E073259780A406F8E0C477B9A0D497D9C0C44
        7694093965820528486A011021500000033D000000330000002E000000280000
        00210000001A000000120000000B000000040000000000000000000000000000
        0000000000030000000900000011000000180000001F000000260000012E0017
        2F47083D6E7B125C9BB11971BADA1B7DCEEE1C83DBF71C86E1FA1B86E3FA1C85
        E0F81C81D7F31B79C8E41869AEC40F4F879205294B5900060E35000000290000
        00230000001B000000140000000C000000060000000100000000000000000000
        000000000001000000060000000D000000140000001A000B1A29063D70651464
        A7B71C7ED0EC1A88E8FD1286F3FF0B83F6FF077FF7FF057DF7FF057DF6FF067E
        F7FF0981F7FF0E84F5FF1688EFFF1C86E0F61B76C1D1105590880221403A0000
        001E00000018000000110000000A000000040000000000000000000000000000
        00000000000000000001000000060000000B012953260E5798831B79C9E11B89
        EAFE0D84F6FF037CF6FF0079F6FF0079F5FF0079F5FF0078F5FF0078F5FF0078
        F5FF0079F5FF0079F5FF017AF6FF067EF6FF1387F3FF1D86DFF3196FB7AF0945
        7B4500030D100000000900000004000000010000000000000000000000000000
        0000000000000000000000000000013E7F191163AB8E1D81D6ED1488F2FF057D
        F6FF0079F5FF0079F5FF0079F5FF0079F5FF0179F5FF0C7FF5FF1182F5FF057B
        F5FF0079F5FF0079F5FF0079F5FF0079F5FF017AF5FF0981F6FF1B8AEAFB1D7A
        C8C00D579B3E0008260300000000000000000000000000000000000000000000
        0000000000000140860000448B121163AD841D83DAF11086F4FF017AF6FF0079
        F5FF0079F5FF0079F5FF0079F5FF0079F5FF087CF5FF6CB1F9FF9CCBFBFF2C8F
        F7FF0078F5FF0079F5FF0079F5FF0079F5FF0079F5FF0079F5FF057EF6FF1889
        EEFE1D7DCCBB0E5DA43300000000000000000000000000000000000000000000
        00000000000000256B040D5CA4621D80D2E61186F3FF017AF5FF0079F5FF0079
        F5FF0079F5FF0079F5FF0079F5FF0077F5FF0A7CF5FF99C9FBFFDEEEFEFF3D98
        F8FF0076F5FF0079F5FF0079F5FF0079F5FF0079F5FF0079F5FF0079F5FF057E
        F6FF1B8AECFA1C78C5A1074D9218004EA2000000000000000000000000000000
        00000155AC00054E952F1976C4CA1789EFFF027BF6FF0079F5FF0079F5FF0079
        F5FF0079F5FF0079F5FF067CF5FF248BF6FF54A4F8FFBFDDFDFFEAF4FEFF7AB8
        FAFF258BF6FF057BF5FF0079F5FF0079F5FF0079F5FF0079F5FF0079F5FF0079
        F5FF0980F6FF1E89E3F0166DB669003B7F050000000000000000000000000000
        0000003C82091163AC801C86E1F80880F6FF0079F5FF0079F5FF0079F5FF0079
        F5FF0079F5FF097EF5FF61ACF9FFBEDDFDFFE7F2FEFFF9FCFFFFFDFEFFFFEDF6
        FEFFBDDCFDFF55A5F8FF067CF5FF0079F5FF0079F5FF0079F5FF0079F5FF0079
        F5FF0179F5FF1286F3FF1F81D2C00D59A02700307C0000000000000000000019
        5200054D942C1A78C6C91487F2FF0179F6FF0079F5FF0079F5FF0079F5FF0079
        F5FF0078F5FF1B87F6FFC0DEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD5E9FDFF409AF8FF0179F5FF0079F5FF0079F5FF0079F5FF0079
        F5FF0079F5FF057EF6FF1D89E6F01970BA670023610200000000000000000004
        1C010E5DA65E1D84DAEE0A81F6FF037AF5FF027AF5FF0179F5FF0079F5FF0079
        F5FF0078F5FF1E88F6FFC5E0FCFFE9F4FEFFBDDDFCFF9ECCFBFFA2CEFBFFD8EB
        FDFFFEFFFFFFFCFDFFFF88C0FAFF097CF5FF0079F5FF0079F5FF0079F5FF0079
        F5FF0079F5FF017AF6FF1588F1FE1E7DCCA509488C1000000000000000000029
        6C08156AB490208BE7FD1E8AF7FF248CF6FF228AF6FF1986F6FF0E81F5FF057C
        F5FF0079F5FF1A86F6FF81BDFAFF53A4F8FF1A86F6FF0A7DF5FF1583F6FF89C1
        FAFFFAFCFFFFFFFFFFFFA5D0FCFF1181F6FF0078F5FF0079F5FF0079F5FF0079
        F5FF0079F5FF0079F5FF0C83F5FF1F84D9D2115FA42A0000000000000000003D
        83131B73BFB33095EFFF3595F8FF3695F7FF3695F7FF3594F7FF3092F7FF258C
        F6FF1684F6FF1181F5FF1684F6FF077CF5FF1F89F6FF489EF8FF81BCFAFFD1E7
        FDFFFEFEFFFFFEFFFFFF99C9FBFF0D7EF6FF0078F5FF0079F5FF0079F5FF0079
        F5FF037AF5FF0C7FF5FF1285F6FF1F89E2E81569B04500000000000000000147
        8D1F217BC6C7399AF3FF3796F8FF3695F7FF3695F7FF3695F7FF3695F7FF3695
        F7FF3494F7FF2B8FF6FF3192F7FF75B6FAFFC2DFFDFFE8F3FEFFFAFCFFFFFFFF
        FFFFFFFFFFFFE9F4FEFF5AA8F9FF0279F5FF0079F5FF0079F5FF027AF5FF0B7F
        F5FF1E89F6FF2E91F7FF2B90F8FF248DE9F1176EB85A0000000000000000034A
        9125247EC9CF3B9BF5FF3695F7FF3695F7FF3494F7FF3494F7FF3695F7FF3695
        F7FF3695F7FF409AF7FFA0CDFBFFF1F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFC
        FFFFDAECFEFF7BB9FAFF1282F6FF0179F5FF037AF5FF0A7EF6FF1986F6FF2A8E
        F7FF3494F7FF3695F7FF3193F8FF2790EBF41770BA6400000000000000000249
        9022257EC8CC3C9BF5FF3695F7FF3C98F7FF5DA9F8FF52A4F8FF3997F7FF3594
        F7FF3493F7FF60ABF9FFE3F0FEFFFFFFFFFFFCFEFFFFE5F1FEFFBEDDFCFF94C7
        FBFF53A5F8FF2089F6FF1885F5FF1986F6FF218AF6FF2D91F7FF499FF8FF69B0
        F9FF4DA1F8FF3695F7FF3294F8FF2991EAF41770BA6000000000000000000142
        8A19237AC4BE3C9BF2FF3695F8FF6AB1F9FFD4E9FEFFAFD5FCFF53A4F8FF65AE
        F9FF4FA2F8FF79B8FAFFF2F8FFFFFFFFFFFFEBF4FEFF82BDFAFF449CF7FF3896
        F7FF3A97F7FF64ADF9FF61ACF8FF4BA0F8FF79B9FAFF63ADF9FF86BFFAFFE0EF
        FEFF9FCCFBFF409AF7FF3194F8FF2990E7EE166DB75000000000000000000032
        7A0D1F74BCA23B99EDFE479FF9FFB5D8FCFFFBFDFFFFA4CFFBFF8DC3FAFFE3F0
        FEFF9ECCFBFF79B8FAFFEEF6FEFFFFFFFFFFF3F9FFFFABD3FCFF7DBAFAFF84BE
        FAFFA8D1FCFFD9EBFEFF86BFFAFF71B4F9FFE6F2FEFFC2DFFCFF83BEFAFFE6F2
        FEFFE4F1FEFF69B0F9FF3195F7FF278CE0DE1265AE3700000000000000000014
        4F041768B0773894E3F761ADFAFFD7EAFEFFE7F3FEFF8DC3FAFFCEE5FDFFF6FA
        FFFF84BEFAFF52A4F8FFCEE5FDFFFFFFFFFFFFFFFFFFFAFDFFFFF2F8FEFFF4F9
        FFFFFDFEFFFFFAFCFFFF87C0FBFF51A3F8FFD3E8FDFFF5FAFFFF99C9FBFFC2DF
        FDFFECF5FEFF89C0FBFF3498F5FF2486D6BD0C589E1B00000000000000000000
        00000B579F423189D4DD4BA3F7FF72B4F9FF86BFFAFF81BCFAFFDFEEFEFFD7EA
        FEFF57A7F9FF3695F7FF77B7FAFFD8EAFDFFFBFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFDFFFFE1EFFEFF73B5F9FF3B98F7FFA0CDFCFFE4F1FEFF9ACAFBFF74B6
        F9FF76B6FAFF4CA2F9FF3196EEF91E7CC8850238780700000000000000000000
        190000448C162376BDA73F9CEEFE3797F8FF3896F7FF479EF7FF71B4F9FF78B8
        FAFF3F9AF7FF3595F7FF3B98F7FF64ADF9FFA5CFFBFFE4F1FEFFF7FBFFFFCCE4
        FDFFA0CDFBFF6FB3FAFF409AF7FF3695F7FF56A6F8FF68AFF9FF499FF8FF3896
        F7FF3594F7FF3598F7FF2C90E1DC166BB4430000000000000000000000000000
        0000001D4D01105DA452368DD7E63F9DF6FF3695F7FF3594F7FF3494F7FF3695
        F7FF3695F7FF3695F7FF3595F7FF3494F7FF429BF8FFB3D7FCFFE7F2FEFF6EB3
        F9FF3896F7FF3594F7FF3595F7FF3695F7FF3595F7FF3494F7FF3594F7FF3695
        F7FF3797F8FF3599F0FB227FCB94064E94100000000000000000000000000000
        0000003A7F00014088112273BA97409AE7F93B9AF8FF3695F7FF3695F7FF3695
        F7FF3695F7FF3695F7FF3695F7FF3595F7FF3C98F7FF9FCDFBFFCFE6FDFF5FAB
        F8FF3393F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3696
        F7FF399BF6FF2C8DDCD01366AE38000000000000000000000000000000000000
        00000000000040FFFF000B549A2E2C7FC6B9429DEEFD3A99F8FF3695F7FF3695
        F7FF3695F7FF3695F7FF3695F7FF3695F7FF3796F7FF4FA2F8FF5BA8F8FF409A
        F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3A9B
        F7FF3294E3E31B73BD62002C6E05000446000000000000000000000000000000
        00000000000000266F00002D7603105CA2413285CCC8439EEFFE3B9AF8FF3695
        F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3594F7FF3494F7FF3695
        F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3796F8FF3C9BF7FF3696
        E6EA1F79C276084E960F0A539A00000000000000000000000000000000000000
        00000000000000000000003B8300000F5202125CA3403082C7B8429BE9F83F9D
        F7FF3797F8FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695F7FF3695
        F7FF3695F7FF3695F7FF3695F7FF3695F7FF3A99F8FF3D9DF4FF3593E0DC1F77
        C0700349910F1484CF0000000000000000000000000000000000000000000000
        000000000000000000000000000003488F00001E6A020E569C2C2978BE933D93
        DBE3439EF0FE3E9CF7FF3998F8FF3796F8FF3695F8FF3695F7FF3695F7FF3695
        F7FF3696F8FF3897F8FF3B99F8FF3E9DF5FF3D9AEAF32F89D4BA1A6FB7510249
        900B1364AD00001E640000000000000000000000000000000000000000000000
        000000000000000000000000000000000000003C86003BA6E6000040880F1965
        A94C2F7FC49F3D92DAD7429BE8F2429DF0FC419EF4FF3F9DF6FF3F9DF6FF409D
        F5FF409DF3FE409CEEF83D97E4E4338CD5BA2177BE6D0E5BA22300001C010859
        A700000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000003B8400145EA4000000
        000001478E151761A6422574B87D2E7FC4B03286CCD6358AD1E8358AD2EB3388
        D0E02F84CBC2287CC3931D6EB4590D58A12500266F051F73BC0008539C000000
        0000000000000000000000000000000000000000000000000000}
      Layout = blGlyphTop
      TabOrder = 8
      OnClick = DonateBtnClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object OpenDialog: TsOpenDialog
    Filter = 'Flickr Photo Downloader Project|*.fpd'
    Left = 176
    Top = 448
  end
  object TimeTimer: TJvThreadTimer
    OnTimer = TimeTimerTimer
    Left = 96
    Top = 456
  end
  object DownloadProgressImages: TsAlphaImageList
    Height = 22
    Width = 22
    Items = <
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000000467414D410000AFC837058AE900000006624B4744000000000000F9
          43BB7F000000097048597300000048000000480046C96B3E0000000976704167
          000000160000001600DCC5E958000003A44944415438CBD5955D4C9C451486DF
          F9E6FBDBFD60C502B6C88F162A6A8381C498AE52688909B196F89BD6B4378D8D
          7A65D4188DE985573531691ABDE84563941AA2B1498D6B03D42825B1513424A0
          D02E34406DD985F25B601128ECCE3733C78B4D97D8D290D4F4C233792FCECD93
          33EF3967861111EE461877850AC00480ECC385202298DA02172E2C69830B075A
          01CAF4A1B80059123E1380A5408E840F015812BEE1834C1F30D46E3BCBF9D230
          D8D2CA8195D2FF5C311101527D74FF7DF9913DD5E1FC0D59390F642ABED39052
          17C046E4898AF26D07B655B2E6FE2B98BEFA77CB1D7BCC00F8523D0FD7EA7969
          7B55F848FD0ED63D3C85B68EC10BDAA7BD998A89288734D900A6D7BDBA262C0B
          F5495E71CE9B07773E6ABD52568AA6FECBF8EAECC551E6B37A66319101BB01E7
          7765205F26D4B31CE8BA1D54292A102645B6566C0ABF5D57819DB9B9F862F00A
          8EB7F4CFB3655DCF3D4C69A691B122E4795B6AAA4BF26CCFFE41495D06762BD4
          F7F50B4636EFA9AFDD1C3EBCAB1A4FE516E0546C149FB7FE9564F36C9FCDED01
          53D9307D77159C1893DD0F063DBC5CFF509EB4E89C9254BC7A754048FD597691
          FDED6BCF3DB6F1839A5A940636E0CCC8088E47869598D0073DC7FED1D11E82A9
          1C642DE5AD82E9BA71ACB33B417B2BC268A82B2F4A32D5AE255C25A938C555E7
          96AAD01BEFBD1836F73F1C864B0E7E9D8AA1B125468B71F5B16BF393E9DDA5F4
          61E92CED31DCEF2F5D5C1E3B1F9B2B3A54B70789A5A6F2CEB6F93ECB3342B575
          1BF35F7DF27114070A91148B185C8EA1B13586A93ED5E806F9878AC935FB6100
          80A9ADA4B9E09C6CEE8A826907EFD436A06A475659434361FE5B3575D8649660
          412C623819C7D7ED315CEDD2BF04397F7DAD5EFC0B6CF8361CE57E1A8B2657CE
          C63A50E016E2DDA79FC1BECAED307C0F0931873131826F7E1EC6D0391D7589EF
          5E6F03326013D6843F1168FF2D1AC7782A068FDD83945098177398D5E368EE8C
          A3AF0D93768AEF02C7D27AF39EB64238307D07B6708F5EEA153A3A3788593189
          8498C11CC6F1534F1CBDAD7CC1BE6E3530136300012080A5453729D33C33999E
          3D53A163E5B23DD03330BD3554C9219142D7C035747FE7A4F82CDFCF82A93F14
          3130E269290EA64CF035BC4E83957523D76C919D18FE531DDDFCC82866AE117A
          4F676963D279DF08CA33F00320190092B4FA688040B7B3C2D0564616ACA6D450
          76A2F782C4F9D321A8A1D011D3A16337486CAD8A6FD29A6083F11963C13D3119
          2949FAD17B4F99361DBA75ACD6F798FDEFFEBC7F0035D5BD37BC0A95F1000000
          25744558746372656174652D6461746500323030392D31312D31355431363A30
          383A34342D30373A30307696CE470000002574455874646174653A6372656174
          6500323031302D30322D31375430373A31323A32372D30373A3030009681FA00
          00002574455874646174653A6D6F6469667900323031302D30312D3131543039
          3A31393A32352D30373A30301495306500000035744558744C6963656E736500
          687474703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E
          7365732F4C47504C2F322E312F3BC1B41800000025744558746D6F646966792D
          6461746500323030392D31312D31355431363A30383A34342D30373A30302927
          B8730000001974455874536F6674776172650041646F626520496D6167655265
          61647971C9653C0000000D74455874536F75726365004E75766F6C61AC4F35F1
          0000003474455874536F757263655F55524C00687474703A2F2F7777772E6963
          6F6E2D6B696E672E636F6D2F70726F6A656374732F6E75766F6C612F763DB452
          0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000000467414D410000AFC837058AE900000006624B4744000000000000F9
          43BB7F000000097048597300000048000000480046C96B3E0000000976704167
          000000160000001600DCC5E958000004F94944415438CBB5956D6855651CC07F
          CF73CEB9E7ECEEDEEB76B5BCABCDE5D0CDC2EC66A8CB8265A8481B0699910446
          84AE6F96426410D1B70AA20F86100696F40673D0C8965B4AAF30A95D4CCA6EBE
          AC6D775BBB9673CDB5ED9E7B9EF33C7DD8BCCDA28FFD3FFF9F1F3FFE2FCF5F18
          63F83FC20678B1BA9A502942291FAA4D26DF220CF5F0C4C44E57EB4ECB18A431
          585A6301426BAEA98461B87E7165E547AEEB96E77FFD75AF13866F5AC6D03A33
          8304C01866B4DEB2BCAAEABDC7AAAA2A1FADA85858178DB6FB423CF05F46BE52
          8DA978FCD39675EB6E78B0B939BAACBEFE0DDFF7773057011B4009B1FDB6BABA
          23DB93492FFEF4D310863CF8DC735EA7EFB7F705C14E4FEBB6F9D0A2314D4BA2
          D18F373634C4934F3D0555556C4C246C69DBEFF49F3EBD08382001AAABAB0FED
          48A5BCF8934FC29A35D0D848E5F3CFD3EC795EBDD6478AF3CC8BB0AEC6B68F6D
          AAA9892F6A6D85DB6F878A0ADC9616363EF28853BB7AF52BC06C2984D63A1402
          2627E1F265181840DE751789FDFBB9BFACCC5BE6FBED4ACA2D4558739352DD4D
          0B17C62A5B5B91E934E472B36F2627D1C620B4D625F0F0E0E0136D232385C977
          DF8563C7A058845C0EFBCE3B59B46F1F1B6CDB5B3A3DDD7193EF7F759FE7256E
          DCB50B67F56AC4C8084C4F43364BA1AB8BCF3FFC30C8F5F63E53023B42745CEC
          EBDBD671F97261EAE851387912B4868101EC952BA9D8BB97466322F7F8BE97DC
          BD9BC835D3420173FE3CFE975FF2755797EACB645AA594870084318697522950
          8AD098EDB72E5E7C644B34EA556EDA04E934140A108B31D5D383F67DE24D4D30
          3505B68DB974893F7B7BE93973465DF8E9A73D8E10078565B12B0866A7020021
          8818D3766E7474CA2493ED5B3A3ABCC4D5ABD8AB56C1F838E5CB97CFE68D8C80
          E3A0F279A632197AB259D5D7DFBFDB96F2F0BF1644CC870BD1D97FE54A4B573C
          FEC986E3C7DD85C522CE8A15303E3E9B635904B91C13A74EF1DDC080EACFE777
          38B67D146310C6945836406C66068CC108811002DF98DF956D1B3533C3584707
          6E2E87705D1002A314334343082094D208AD7F73E6B65202D6EC505C6F2C8042
          1836D65455756DB66D2F1C1AE2AA5204DDDD14E772229E879348509E4CD2585F
          EF48DB3E3E3C30F0B0059D621E4BFE634D9B96D4D6766F8E4613CE850B044AFD
          6D025852225C1769DBA830C44C4C70773A5D764B43437B00DBE7B34A603F08D6
          D52C5B76AC25918847B3590A4A21003367B1C0B258E03858A5760802A5106363
          DCB37EBD57BB72E591001EB80EACC2B0E9E6152BBA9A93C9989BC95028164B50
          0B8847A3FCEC79EA07CB0ACA1D075B088C31082909C210F279EEDEB0C1ABBEE3
          8EF670CE5C022CAEAB6BDB9A4A2D5870EA14C579500994555672D6F3823EAD1F
          1F0CC3E61F7CBFE07A1E969418AD1152A28280483ECFBD5BB77AA974FA5009EC
          795E345A2C12FAFEEC2F3A675A9E4AF1A3EBAA0B5353AD16BC1F11E2B3DCF4F4
          B61FFFF8A350168B615916C6181082D0F7712D0B37162B2B8147B3D9FDDD8542
          A0D6AEC516021B70962E251389A8F3E3E37B2C387CADDB8E109D8363633BBF1F
          1E2ED8F1388E652101515BCB77DF7CA3877A7A5E2D812D38702E9379FC8B3054
          329DC66968E05B29D5F9D1D1DD96310705D7872D44DBE0A54BDBBEBF78B1202B
          2A706B6A3873FAB43E77E2C4B384E10BA53946085C293FF8E5ECD9985EB2E475
          A3941ECAE5F6D8421C4608FE791505E040677E64E4D15E21DE8EC4E3DE5036FB
          B203AF9572FEAF63FA1706E92D34543849D90000002574455874637265617465
          2D6461746500323030392D31312D31355431363A30383A34342D30373A303076
          96CE470000002574455874646174653A63726561746500323031302D30322D32
          305432333A32363A31352D30373A3030063B5C81000000257445587464617465
          3A6D6F6469667900323031302D30312D31315430393A31393A32372D30373A30
          30830A214C00000035744558744C6963656E736500687474703A2F2F63726561
          74697665636F6D6D6F6E732E6F72672F6C6963656E7365732F4C47504C2F322E
          312F3BC1B41800000025744558746D6F646966792D6461746500323030392D31
          312D31355431363A30383A34342D30373A30302927B873000000197445587453
          6F6674776172650041646F626520496D616765526561647971C9653C0000000D
          74455874536F75726365004E75766F6C61AC4F35F10000003474455874536F75
          7263655F55524C00687474703A2F2F7777772E69636F6E2D6B696E672E636F6D
          2F70726F6A656374732F6E75766F6C612F763DB4520000000049454E44AE4260
          82}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000000467414D410000B18E7CFB519300000A3D69434350696363000078DA
          9D53675453E9163DF7DEF4424B8880944B6F5215082052428B805469A2129200
          A184181240EC88A8C088A2228215191471C0D11190B1228A8541B1F701790828
          E3E0283654DE0FDE1A7DB3E6BD376FF6AFBDF639679DEF9C7D3E004660B0449A
          85AA01644A15F288001F3C362E1E2777030A542081038040982D0B89F48F0200
          E0FBF1F0EC88001FF80204E0CD6D4000006ED80486E138FC7F5017CAE40A0024
          0C00A68BC4D94200A41000327215320500320A00ECA4749902002500005B1E1B
          170F806A01003B65924F030076D224F70200B628532A0240A3004026CA148900
          D00E005897A3148B00B0600028CA91887301B09B006092A1CC940060EF00809D
          2916640310180060A2100B530108F600C0904745F000083301288C94AF78D257
          5C21CE530000F0B2648BE5929454056E21B4C41D5C5DB978A0383743AC50D884
          0984E902B908E76565CA04D2C5009333030080467644800FCEF7E3393BB83A3B
          DB38DA3A7CB5A8FF1AFC8B888D8BFF973FAFC201010084D3F545FBB3BCAC1A00
          EE1800B6F18B96B41DA0650D80D6FD2F9AC91E00D54280E6AB5FCDC3E1FBF1F0
          548542E66667979B9B6B2B110B6D85A95FF5F99F097F015FF5B3E5FBF1F0DFD7
          83FB8A9305CA0C051E11E0830BB332B294723C5B26108A719B3F1EF1DF2EFCF3
          774C8B10278BE562A9508C474BC4B912690ACECB928A240A4996149748FF9389
          7FB3EC0F98BC6B0060D57E06F6425B50BBCA06EC972E20B0E88025EC0200E477
          DF82A9D110060031068393770F0030F99BFF1D681900A0D992141C0080171185
          0B95F29CC918010080083450053668833E188305D88023B8803B78811FCC8650
          88823858004248854C90432E2C8555500425B011B64215EC865AA8874638022D
          7002CEC205B802D7E0163C805E1880E7300A6F601C411032C244588836628098
          22D68823C24566217E48301281C42189480A224594C85264355282942355C85E
          A41EF91E398E9C452E213DC83DA40F19467E433EA018CA40D9A81E6A86DAA15C
          D41B0D42A3D0F9680ABA08CD470BD10D68255A831E429BD1B3E815F416DA8B3E
          47C730C0E8180733C46C302EC6C342B1782C199363CBB162AC02ABC11AB136AC
          13BB81F56223D87B0289C022E0041B823B2190309720242C222C279412AA0807
          08CD840EC20D421F6194F099C824EA12AD896E443E31969842CC2516112B8875
          C463C4F3C45BC401E21B1289C42199935C4881A438521A6909A994B493D4443A
          43EA21F593C6C864B236D99AEC410E250BC80A7211793BF910F934F93A7980FC
          8E42A718501C29FE94788A945240A9A01CA49CA25CA70C52C6A96A5453AA1B35
          942AA22EA696516BA96DD4ABD401EA384D9D664EF3A045D1D268AB6895B446DA
          79DA43DA2B3A9D6E4477A587D325F495F44AFA61FA457A1FFD3D438361C5E031
          12184AC606C67EC619C63DC62B269369C6F462C63315CC0DCC7AE639E663E63B
          15968AAD0A5F45A4B242A55AA559E5BACA0B55AAAAA9AAB7EA02D57CD50AD5A3
          AA575547D4A86A666A3C3581DA72B56AB5E36A77D4C6D459EA0EEAA1EA99EAA5
          EA07D52FA90F699035CC34FC34441A851AFB34CE69F4B33096318BC712B256B3
          6A59E759036C12DB9CCD67A7B14BD8DFB1BBD9A39A1A9A3334A335F334AB354F
          6AF672308E1987CFC9E094718E706E733E4CD19BE23D453C65FD94C629D7A7BC
          D59AAAE5A525D62AD66AD2BAA5F5411BD7F6D34ED7DEA4DDA2FD4887A063A513
          AE93ABB34BE7BCCEC854F654F7A9C2A9C5538F4CBDAF8BEA5AE946E82ED1DDA7
          DBA53BA6A7AF17A027D3DBAE774E6F449FA3EFA59FA6BF45FF94FEB001CB6096
          81C4608BC1698367B826EE8D67E09578073E6AA86B1868A834DC6BD86D386E64
          6E34D7A8C0A8C9E89131CD986B9C6CBCC5B8DD78D4C4C024C464A94983C97D53
          AA29D734D5749B69A7E95B3373B318B3B5662D6643E65AE67CF37CF306F38716
          4C0B4F8B45163516372D49965CCB74CB9D96D7AC502B27AB54AB6AABABD6A8B5
          B3B5C47AA775CF34E234D769D26935D3EED8306CBC6D726C1A6CFA6C39B6C1B6
          05B62DB62FEC4CECE2ED36D975DA7DB677B2CFB0AFB57FE0A0E130DBA1C0A1CD
          E137472B47A163B5E3CDE9CCE9FED3574C6F9DFE7286F50CF18C5D33EE3AB19C
          429CD63AB53B7D727671963B373A0FBB98B824BAEC70B9C36573C3B8A5DC8BAE
          44571FD715AE275CDFBB39BB29DC8EB8FDEA6EE39EEE7ED07D68A6F94CF1CCDA
          99FD1E461E028FBD1EBDB3F05989B3F6CCEAF534F41478D6783EF132F61279D5
          790D7A5B7AA7791FF27EE163EF23F739E6F396E7C65BC63BE38BF906F816FB76
          FB69F8CDF5ABF27BEC6FE49FE2DFE03F1AE014B024E04C203130287053E01DBE
          1E5FC8AFE78FCE7699BD6C764710232832A82AE849B055B03CB82D040D991DB2
          39E4E11CD339D2392DA110CA0FDD1CFA28CC3C6C51D88FE1A4F0B0F0EAF0A711
          0E114B233A2359910B230F46BE89F2892A8B7A30D762AE726E7BB46A7442747D
          F4DB18DF98F298DE58BBD865B157E274E22471ADF1E4F8E8F8BAF8B1797EF3B6
          CE1B48704A284AB83DDF7C7EDEFC4B0B7416642C38B95075A160E1D14462624C
          E2C1C48F8250418D602C899FB4236954C8136E133E177989B68886C51EE272F1
          60B2477279F2508A47CAE694E154CFD48AD411094F522579991698B63BED6D7A
          68FAFEF4898C988CA64C4A6662E671A986345DDA91A59F9597D523B39615C97A
          17B92DDABA68541E24AFCB46B2E767B72AD80A99A24B69A15CA3ECCB9995539D
          F32E373AF7689E7A9E34AF6BB1D5E2F58B07F3FDF3BF5D4258225CD2BED470E9
          AAA57DCBBC97ED5D8E2C4F5ADEBEC27845E18A8195012B0FACA2AD4A5FF55381
          7D4179C1EBD531ABDB0AF50A5716F6AF0958D350A452242FBAB3D67DEDEE7584
          759275DDEBA7AFDFBEFE73B1A8F872897D4945C9C75261E9E56F1CBEA9FC6662
          43F286EE32E7B25D1B491BA51B6F6FF2DC74A05CBD3CBFBC7F73C8E6E62DF896
          E22DAFB72EDC7AA96246C5EE6DB46DCA6DBD95C195ADDB4DB66FDCFEB12AB5EA
          56B54F75D30EDD1DEB77BCDD29DA797D97D7AEC6DD7ABB4B767FD823D973776F
          C0DEE61AB39A8A7DA47D39FB9ED646D7767ECBFDB6BE4EA7AEA4EED37EE9FEDE
          0311073AEA5DEAEB0FEA1E2C6B401B940DC387120E5DFBCEF7BBD6469BC6BD4D
          9CA692C3705879F8D9F789DFDF3E1274A4FD28F768E30FA63FEC38C63A56DC8C
          342F6E1E6D496DE96D8D6BED393EFB787B9B7BDBB11F6D7FDC7FC2F044F549CD
          9365A768A70A4F4D9CCE3F3D76467666E46CCAD9FEF685ED0FCEC59EBBD911DE
          D17D3EE8FCC50BFE17CE757A779EBEE871F1C425B74BC72F732FB75C71BED2DC
          E5D475EC27A79F8E753B77375F75B9DA7ACDF55A5BCFCC9E53D73DAF9FBDE17B
          E3C24DFECD2BB7E6DCEAB93DF7F6DD3B09777AEF8AEE0EDDCBB8F7F27ECEFDF1
          072B1F121F163F527B54F158F771CDCF963F37F53AF79EECF3EDEB7A12F9E441
          BFB0FFF93FB2FFF171A0F029F369C5A0C160FD90E3D08961FFE16BCFE63D1B78
          2E7B3E3E52F48BFA2F3B5E58BCF8E157AF5FBB466347075ECA5F4EFC56FA4AFB
          D5FED7335EB78F858D3D7E93F966FC6DF13BED7707DE73DF777E88F930389EFB
          91FCB1F293E5A7B6CF419F1F4E644E4CFC130398F3FC256333A2000000206348
          524D00007A25000080830000F9FF000080E9000075300000EA6000003A980000
          176F925FC54600000006624B4744000000000000F943BB7F0000000970485973
          00000B1200000B1201D2DD7EFC0000000976704167000000160000001600DCC5
          E9580000046D4944415438CB8D945D6C544514C77F33733F76FBB16D7729B415
          AC808A201A051E24290962881289241283466B78D047438CCFBEF0E0136AF0C1
          181342227E104D402406899410137C002920129A948F8AA6059AB6DBDDEDEEBD
          73E7CEF8D0B2B65413CED3993327BFFCE7CC39471CF87C3B6FF51D213A9830DB
          5ADF6CA0F845B57EDEB7EFD89175EB56F6707FF693B7A17B195FF7EE9C77331B
          3A633D2B5776E7FF8F1404A2EE5FBC38F4822C69CDCBCB56DDA790F9E61C2825
          E6C53D01A4CEA1EE1374E2C4B9793129056A06B079F3DA6930402D4968BA4FF0
          47C57739B4F544FD9CC904789E40CA7B140394E218DBBF9B5C439603677FA5B7
          F730DFEF79FD5360473DB3ED8DE9A75BC78B6736F0DED4DE6970182025083157
          B1B87474170B1615208D31C6F0FBB9D1FD52B0AE4ADAF9CC9A15E2CA64B56DA0
          5C13578C8B87BC4B61D94CE2BF16C2C9618E6FBA0A502FC3ACCF1BF78410B96B
          0377F6FB1E5D89B69D4FAD5D5600D1E81C0220DB5270F9D62CCFE6DAC3CCA3EB
          F93BB8C1E1D277742D5E4FE72705F63D7C0CA5249E271062568D4747A6DEA954
          6A2F2D5CDCECB52F6A21680AD0514A6A529483588E89292FE2747281AB513F36
          4A59727B155F5DFC929C6BA3A76735994C863094F57200880F776D9858F9C8C2
          569B5A100A9C23D390A5D0B18005ED056E791EE74727E8FB738473C9693A5A0A
          9CF57F2337DCC6670FFD50EF8A2008F07DC1E6CD6BA74B9109C3586B8B732990
          E29C239ED494C6C718B492E67C81ADAB5713063D7CF0FC1EDE3EBD9D96E13C7F
          F40E2184C0F324524A949264B3FEDCAE485C42129BE9040FAC0394C089946A54
          254E0C0E07C0E5DB037CDCF52DA74E9D47088152122104520A7CDF67CB967A1F
          3B529D50AC444C55521A1A24B9661FE504D65A909A3831E0C0931EFDAF0ECE0C
          84AAABBD0B9652CD52EC20490CBE67199B9C64AC04F95A23EDF910671CE88424
          8AEB8AEF8E31405F5F3F4A49366D5A8373026B53989961CF0151123356AC614D
          4A5B3EA452D6340502E14B84D6445184B3FF82EFFEFEC68D4FE379D38AEFC6D2
          74D6AE48128D2F21D328C13A5C6A28D5521AF1D14A12698D7465FA7EFEE53FC7
          DCE1971D72F6DEBDE1590BCE19A4EFF0B5A05C312446D3A29A49B4C5098D3609
          1D9C400A9FD46894F2906ADA37A6C69DD1C95776BE7FECF89CC514E9A4162A49
          5233F8CAD19C75149A7D8C89D12622D10619B6A0C21C4EF848BF11A7420C1E51
          AC912E61DFA10BF2DE57C8BD07CFECB646D39415049E40484B6A53629D10EB94
          C4A4586389E3986AB5C254B54CAD5A22298FE0A71354CB930C0C8D87F78285A7
          C4F2AEBCBF6B6947B8E3B1EEE6850F763610860A9D42AC2D9E9FE1F127D60016
          612AD8B44A71A2C4D51B452E5D1F1FB93C54F9E6E6EDEA5E63ECCD3960804091
          6D0C456BCDB0BC29A3B62FC9FBDB9E5CD1B4B4734148AEB991254B3A18BD53E4
          FA5F25776E60FCDAD0ADDAD1C92973B8B5490D8E1693A2362E9AA718A0311484
          9E607CCA92F5F08D257082E5595F6CEBEEF09FF355900E0E574F46DAFD184A06
          85445762973CD01E502C1BA6228B736E0EF81F36F006BAFA577AB10000002574
          4558746372656174652D6461746500323030392D31312D32385431373A31383A
          32382D30373A30303191B22C0000002574455874646174653A63726561746500
          323031302D30322D32325431363A31303A30362D30373A3030896BE36F000000
          2574455874646174653A6D6F6469667900323031302D30312D31315430383A34
          333A35362D30373A3030945BC6EF00000035744558744C6963656E7365006874
          74703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E7365
          732F4C47504C2F322E312F3BC1B41800000025744558746D6F646966792D6461
          746500323030392D31312D32385431343A33313A35322D30373A3030D9266C8A
          0000001674455874536F75726365004372797374616C2050726F6A656374EBE3
          E48B0000002774455874536F757263655F55524C00687474703A2F2F65766572
          616C646F2E636F6D2F6372797374616C2FA591935B0000000049454E44AE4260
          82}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000000467414D410000B18F0BFC6105000000017352474200AECE1CE90000
          00206348524D00007A26000080840000FA00000080E8000075300000EA600000
          3A98000017709CBA513C00000006624B4744000000000000F943BB7F00000009
          70485973000009840000098401AAE26379000000097670416700000016000000
          1600DCC5E958000005364944415438CBA5D45B6C53751C07F0EFFF9CD3D3D3D3
          AEF76D5DC7D65DDA0D76615C866E086C81805C22B844C4EC0535C1684C487C31
          D171475F4C8846128D41A3184362F4450CDE2080DB0CC1015318B0B16BB75ED6
          95B5EBFD9CD3F6FC7D580406F222DFE75F3EF9E5FBF0257820A59E23F00F1F80
          ADEC608322653A5B5ADDEB0B8C8293D1B06C389C0A0C0D4CF52A59F554C4FF7E
          9FD3731881E183785CC87DF400E209182D16CDA975AD15DB9EEB58815B034104
          43311A8F4944CEA9B016192165819EB3D77B1599BC303DB62FF438989D470F22
          97E3DCF5B5D681D75E59DDB4E5F99574362E11AF7F0EFD7766495D6B2D22D114
          52B124EA5656D1B5CF36B802DED05E495E712693E89EFE4FB8D4731479952FB0
          99D98137DF68B3F94209D4369611462740A180BDC884443203778D03042A866E
          07485ECE61C3D6267670C0F72AA75D7BC2646D4B26A21717C08C7F783F18C8DF
          BCB4B3D936391D83ABA60482C0C1A0E7F1F1979710CB03A3DEBBB870691C7D83
          610CFA62988C48882614AC68716B441DCEF8470F3DFA7189E768635D6DD147E5
          1536CA8B3CD9BCB911D35119314585BBC60957451146FD73084592E0B51A4493
          0A66C371E4B32AFEBEE645CB339E12BFDFD36B2DDA389E885CB8FF31C7A8BB18
          86013896143AAD8824B35019064A8EA2D26543FF600093B329A4088388AC8237
          68A1100256A7C5AE3DED70563B40D5FC6EFFC8FE8555B00C690FCF65F073F708
          E26905942110040D6C661D7CC108A06661B08860440154A785C16A404B73195A
          97DAD1566FC3EAE5C5F4C58EC6ED0070FA6AF21ECC65957CA920F298082571F9
          4610F5CB5CF8A56704959576F8EEC661B68A6812B4B87023082AE7D0B2C4866D
          2D4BF0EE77697C76250F029688863653EF1D65744D0D5F7D0FAE7059C9982F06
          BED088A4944577BF0F35D57604E7240C4614E4284041C11A74C81219B515661C
          FE3688F3C7EA9156E61181073AF7DDAC7AB00A2E9190023A1DE792F214A3C114
          B2B743604501D74329F8332A640A700CC0EA78B0AA0A87BD00FE893E8CFACB90
          4CE7000006518391E1DB5808A7941E56E05B0B440E1A9E41A145C0D73D6368A8
          75A0AB630926E7249C1B0A63229C44269D83DDAC476676045E6F3D32E92C0040
          14359022E30BE1B44CBF37B0F9B76331895A2D06722790407B43091C2566083C
          8732AB1EBB5B0DD0922C0A752C169905C8B10026BD7E48D23CAC13782871FFA3
          5BE1A83CF0AB5862DDC4159B018B01565721DA5B5CD854E7443CAB42AF61101A
          F3E1C32F7A30E28B425F60C68EE63C943C0101A0E1284E5F6129CD26887B910D
          0EBB7E2D5BEA390A80FFCDC0E5F67016A3C0E805640983282558BCC888628380
          6291C5F0CD414C8C0E6171690EE5A63412E93CB279068AA2229E905122CE9112
          A30C7759210281E0F0BD75B3951F5A565561FADDB1CA6334543B286B144893DB
          8E9DF545984CE56117186C6CEB80602A4479552DAC561B44BD1E2CC3409625CC
          8466100D4DD26B7F76CFE1EE5F56F65F3813BB380D4DFB57BE5BDED680375C3E
          2351B84B4D8086C7582846A74209B263531B4E7CFA098A5C4BA9566F271AC108
          4A046414202D2BE8EFF99130ACA6596B2C0F730B0A27CA7468FCC81A27F35E5B
          DC77A5F3F39E9B5B44B3E84C6755924F2BD31D1B3C7F2CAF6F9E1ABB71F1AD65
          ABDE81492F82651924330AFACE9D84AAE6BB94E9BE5BCAE3467ABEF7C787B5D5
          9D5DD7D9A51EFBC1478FFF3443B7BEFE810A7D693F9E24DAE2E520652D2C788B
          BCF7F839B5EBE4551544A01A8BC7A8B1B89FC806618C600A4AD714D53D45CB9E
          5E4F89CEB6FDE11BEEFFC0548D8326E2BDE50DDB5E06C7E9A72E9F3FFDF0CD3F
          493F33C85F0A7FB300000025744558746372656174652D646174650032303039
          2D31312D31355431373A30333A30352D30373A303071DDE97B00000025744558
          74646174653A63726561746500323031302D30312D32355430383A33303A3431
          2D30373A3030A9ACF9C00000002574455874646174653A6D6F64696679003230
          31302D30312D31315430393A32353A33372D30373A3030CC7EA75D0000006774
          4558744C6963656E736500687474703A2F2F6372656174697665636F6D6D6F6E
          732E6F72672F6C6963656E7365732F62792D73612F332E302F206F7220687474
          703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E736573
          2F4C47504C2F322E312F5B8F3C6300000025744558746D6F646966792D646174
          6500323030392D30382D32375432313A35313A32332D30363A3030711D946800
          00001374455874536F75726365004F787967656E2049636F6E73EC18AEE80000
          002774455874536F757263655F55524C00687474703A2F2F7777772E6F787967
          656E2D69636F6E732E6F72672FEF37AACB0000000049454E44AE426082}
      end>
    Left = 352
    Top = 344
    Bitmap = {}
  end
  object ProgressTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = ProgressTimerTimer
    Left = 32
    Top = 456
  end
  object Icons: TsAlphaImageList
    Items = <
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B4744000000000000F943BB7F000000097048597300000DD700
          000DD70142289B7800000009767041670000001000000010005CC6ADC3000002
          A74944415438CB95924B68157714C67FFFFFFC67EEDC9BC45CF3D212922E9440
          901A41A88BABF5BD105D98D042D50AB514A3A031DA2C5CE8AE14FAA0181F8B92
          105C4855CC465C444934500B0641492ADA85421E90C4A4797B2737CEDC99D3C5
          0D51A95DF8C1599C07DFF938DF51FB2E97FE9C09D22723092D16A12D4D1446BC
          0DAD1551246F7265655D93F891BD2DF1ECF4FC987C2826BD11A96BCDCF984842
          2B192FA3F35EC73B1B776EDBC5FEAFBEE4F72BD7781FF263CB111197DA96844C
          7A231FAC606C6E403E6F4D8AA9F437537FAD1A3FCC2CB12BA5B874F021D7FF39
          4228010756B4D170254510BE5E9A899938E5AF37623EF236F2C3A11BCC7B1E22
          8248C4915BABFF23592BCD2F3B7A31CA4124A2705992D6B6160C4018865CE839
          44EF681700C5052B0110C939118A4F69B29CA6AE75005497A6F82E7515609120
          9BA576CD69FA67FBD8BBE130A9CA2F789EF98388108027DE2DCEEE6E6724FD37
          CD1D0DEC5A7D0C3FF073CA0094D694D81FF3FD8E6EBA1EB5D3DEF713E5CE5A56
          38D500C47592E1F4339A3B8E53BFFE37CA4C1596B6DE10D8B6C3E8D830040EBF
          D6F630353143DBFD33A40AEAD9BEBC89655105176E37D2B4F52A25661523A3C3
          38B1588E607C620A37E672F75E37FD032FF8ABAF976F6ACE535DB48573778E32
          31FD928B771AF9FA9366E60685C1A17E1E3CE8212F91CFF8C414349C3AF1BF5E
          F70CDC94C3D7ABE4E9E89FEFED7F7BB45ED49EBA5AD9B97513A89C5D89441EB3
          B333C46C77E988C6D8B86E9C747A6E6966DEF3E8ECBE8FFA74D367999264813B
          3E3983B1346ECCC1766C6CCBC2B10D96A5C98611819F65C1F7F1FD80053FA0B4
          A890E939EF95D14A1980B2E2244A29B45668A5508B01B9DC760CC658A8BC3841
          36444488A2A8C05454560C0F0D0E558A887AFBF32211B47AA704806D2C945212
          64436A6AD63EFE17CAC6999E4EB0C77700000025744558746372656174652D64
          61746500323030392D31312D31355432333A30343A30362D30373A30301E31A7
          D20000002574455874646174653A63726561746500323031302D30312D313154
          30393A30383A33392D30373A3030408E56CD0000002574455874646174653A6D
          6F6469667900323031302D30312D31315430393A30383A33392D30373A303031
          D3EE7100000034744558744C6963656E736500687474703A2F2F637265617469
          7665636F6D6D6F6E732E6F72672F6C6963656E7365732F47504C2F322E302F6C
          6A06A800000025744558746D6F646966792D6461746500323030392D31312D31
          355432333A30343A30362D30373A30304180D1E60000001974455874536F6674
          77617265007777772E696E6B73636170652E6F72679BEE3C1A00000017744558
          74536F7572636500474E4F4D452049636F6E205468656D65C1F9266900000020
          74455874536F757263655F55524C00687474703A2F2F6172742E676E6F6D652E
          6F72672F32E491790000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          00097048597300000DD600000DD601906F799C0000001774455874536F757263
          6500474E4F4D452049636F6E205468656D65C1F926690000001A74455874536F
          667477617265005061696E742E4E45542076332E352E313147F3423700000217
          49444154384F95534B4BAA5114FD7E56A6288483C8F03DE9174833291FE844CD
          8B8AE220834411FF8123130739511CA8280E44317C5D447C57228452B7D675EF
          7BB3DBE30EDAB0CF639FBDD6DE677DE713EC767BE0F4F4F4D7C9C9095EDD6432
          6DD7FF8B6D304F369BED8740E0E57289EFDA62B180D96C5E09C446767D7DFDCE
          C98E8E8E78FECA1E1F1FB92B810662FBAEDDDEDEC262B140703A9DBCF8703F4E
          48A552482693B8BBBBFB9463B55AE172B920F87C3E3C3C3C603A9D623299603C
          1E736B1F0908D06AB5D0ED76D1E974309BCD4058262011C3E1F096FDECEC8C09
          AEAEAE98603E9FC3EFF76FCFCFCFCFB9D896802A341A0D381C0EE47239DCDFDF
          A3D96C3298BC5AAD72ACDD6E734EA150C0603078232011FBFD3E07BD5E2F1289
          0457203222A8D7EBDC3E812B950A171B0E876F04A441A9546292D56A8568348A
          482482D168845EAFC760129BE69B9B1B643219BE22139060CFCFCFBCC966B328
          168BDC493A9D46201040B95C66B5A9ED7C3ECF6FC4ED7663BD5EFF790746A3F1
          EF97FD6CB55A0D1E8F8755FFCA0C060304B55ACDAA864221F6582C866030888B
          8B8B6DECF2F212F178FC5D0E61082B88C5E29542A1C0CECE0E366BECEDED617F
          7F1F14D36834D0E9749C487BB95C0EA954CAB90707079048244B61333CD121F9
          E1E121944A250308ACD56AA1D7EB79A6984AA5DA9211C1EEEE2E84CD0FF37353
          F98536FFBA48247AB77F75EA402693BD10E6F8F8B8FC1BB07BEB451F34045600
          00000049454E44AE426082}
      end>
    Left = 296
    Top = 400
    Bitmap = {}
  end
  object SysInfo: TJvComputerInfoEx
    Left = 40
    Top = 344
  end
  object ToolBarImgs: TsAlphaImageList
    Height = 32
    Width = 32
    Items = <
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B4744000000000000F943BB7F000000097048597300000DD600
          000DD601906F799C000000097670416700000020000000200087FA9C9D000005
          D14944415458C3C5975B88A44715C77FE7BBF47DA6BBE7D29989EBECB8330959
          66448908BEB8EC8B0AFAA0118D84AC41220644D63CE54931F8E053C04B08C63C
          E89844110331A018C108EE8A4920B263B2EECCAA9BACEC2659A7E7B23BD33DDD
          FDDDAA8E0FDDD33BD79E8E112CF8E8AAFA4E9DF3ABFFA9FAAA4B5495FF67F17A
          BDFCDD99B34F4DBF77E2542E9B4151541514AC5AE9D45555B1D6B051DB6469A9
          CA9595E5B9AF7EF1DE2FFF4F00EACD20B86574440A853C22B29F49B7B3150464
          735952D9F4FD3F79E6573FBBFFEECFFEF15D03349BC1D38D56EB2B8E23341A0D
          1617177B3A6BB65A1C9D3CC6EACACA1F9E7AEEB9CA7D77DDB5F6AE00AE2CBCFA
          E2F5D9E32697C9B8954A854AA5D2D359A3D9E4DFD5653EFDA94F3A3FFAE9CFFF
          0C1C3F0C400E5B84E75EFD5B73FAD8D12CAACCCFCFF7B40DA288A9A9696E9F9E
          E2C2C2222F9D5F7CF0817B3EF768CF41AADAF379F92FF31B1B1B35B5D61EFA54
          5756F5B5C58B6A8CD12449F4F11FCF258F3DF9E4702FFF7B52B03427A3B1EF7C
          5E123060BD0FBC92F2BC9E99EA967C2ECBDAF575E67EF92C288C8D8DBB8BFFBC
          F443E00B7DA7E0EA9C9CCA172B4F7BA934091936665FE0D6B131AAD5252E5FBE
          DC170840A93CCC4BE75EA35ABDA6EE40AEF4F0E9D3B5FDECF64C2D327C246D5D
          92D0B2C6116E191CC47184898909262626FA0688E29852B9C46F9E7F5E2A57BE
          F1CD671FFAFA251B534D849538E0EA7D8FEBDBFB0218C378180358AABC8763B9
          1CAEEB72E1C205565757FB063871E204A562912808A88CFA0F1D1D1DC32496D8
          58FE7A7EED05E0E3FB02C4B1949CC8A20ACDE287F07D0F1187D9D9D9BE836F95
          81429E561092484214BB28208E83AA3370600A624349430B4079FCC380A06A39
          7BF64F7D071E191961767616116165F91A61D9124402BAA5B2E60F0448121934
          A121B23946BD75EAAFFF9E707399695921DA5C21D85C033785E317C0CBE1A40B
          38A9025EAA80972B511CBB8381D1F70150ABD568AEBF4E9457C2CEA41430460A
          3B005EFE9E643DE56BD6F009D72D1C2B7A65FCD228EE9BDFA799C993CA1528A4
          526859D1A2623542B50656B1AAD8C8D25CAB7363BDC61BEB1BD4EB01F8155A0C
          33D29A274E0C61B46D92869D0A48C2BDB9CAED8F0C1F99C1CF74D383DC3C6B50
          6DCF405C7011C0DDA15C269F66686C846DE713611031569AE4FCB9BF93F71332
          19A7AD8025BB03204978FFE0E8248E9BC2C4E156F4BE8AF430F45C383E338989
          62DEFED702E2789D35B00BC0580A222E2609FA5C66F28E5E67F33E9B4D4B2EAF
          80121BBC6FDF2DA9879FD1C803881262934428F600D7D2B379184526E3D26A19
          A2B89D36554837C9036D0013911813A19AEC1CFCCE267AE0805C5A8842258A3A
          3B4195D092076E6C29D08C5A0DFC74AACF14F421C5B639783E2416A2B80D602C
          F8590CDC5C03179B8D1A05A7D03BDE7F958AB6612E97220C1370146314D7A5D9
          054822CE37EB75B259778FD7C363485F5DE5528AB5EB118E07D6C2C8F0368046
          8D85D666CBEA50C6D93D50FBF1DE93523A001ED7AA1657DBDFAF079ED0B80BF0
          A5390D7EF1A0FFC6F878E6B6839DED52E65069761A9406406D7B07A074F77BF7
          2CA83793C7D6D6EA3F182A79FB3AD8DDEC4B996DA55850AC01D7075182A9A9A9
          62B95C8EBB00619627AEBE157E2B9D32C3BD643E4C20D9DDB1AD95CB08318AB1
          B2994EA72B1B1B1BEB5D80D38F6AF8C83DDE770AB9E8BBF9428F18D2C7EE3F40
          BCD1217873096A71BAE6BAEE473DCFBBD8051011F7CE9923BFFE4C5C3D75C764
          7CA7EF7764D68E87EEAFA272D3A9EC1354D83966AB3A5884CC0D58BF91794B55
          13634C5D54151171A7A6A6865DD71DF27DFFB60F8E2C7FCC271E46D451C495F6
          C5CC51C1699BE3588B2B2282A87448D541DA97474145DA374707145411545015
          91F895955B7F6BD4BF64ADFDC71680CCCCCCF8611866B2D9AC1B86A16BAD1555
          1580EDF56C36BBA74F44D4711C05701C471B8DC696AADDBE2D9B743A6D52A954
          180441B2B0B01077FF968B88D3114E004E9E3C49BD5EDF93DE20087A2EF74C26
          B367830C0C0C28C0993367B6926AB513F83FF028F83522D8F95D000000257445
          5874646174653A63726561746500323031302D30352D32345430373A33383A31
          312D30363A30302A5799730000002574455874646174653A6D6F646966790032
          3031302D30352D32345430373A33383A31312D30363A30305B0A21CF00000036
          744558744C6963656E736500687474703A2F2F6372656174697665636F6D6D6F
          6E732E6F72672F6C6963656E7365732F62792D73612F332E302F61ECAF510000
          001974455874536F667477617265007777772E696E6B73636170652E6F72679B
          EE3C1A0000001674455874536F75726365006563686F2D69636F6E2D7468656D
          65A94CB7530000003474455874536F757263655F55524C0068747470733A2F2F
          6665646F7261686F737465642E6F72672F6563686F2D69636F6E2D7468656D65
          2F88322E430000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B4744000000000000F943BB7F00000009704859730000004800
          0000480046C96B3E000000097670416700000020000000200087FA9C9D000005
          214944415458C3AD974B8F1BC71585BF53D56C3E869C91C61A4BB105C8911C18
          3104C38957F901590670B2D02E8037FA0101B2F2D670001B823741621BD94631
          60FF04238B208BAC9C08890519B01C48B29EA399D170868F66935D370B7693CD
          D74883E802CD2E169A7DCE3DF754DDA2784E61F656A5DD4E9BB59A6D8E46D654
          461CD534E8F7DD6196F57637376F7625B2F9DFE9FF07C675B72F6EB93A170C3B
          65CE5A0AAE06E64099643D73EEA0826D57D2E82627AEB5256C2581CF3EBFFA6B
          C93E09C11A60148FDA1472FA4581E6DA1E6B8D7DEAB54E566F74F75BCDC7B74E
          6DDEB916C7BDC47043C9FA16B40F6CE378E07DF8A656BBF1BD44008896A4F4C7
          5FFDF252A312559E927986D92D2CFC17B3FBA4E95D3F1A8E5EE8F5A39387DDD3
          3F79B17EF920641F7D6DEC3E11614F8E4DCC35C3D0C5093FC6ECC61D095B2010
          42D6AC4415B6771E8E1335C3CC300BF91D820560878AFF16B97B78F710EF1EE3
          B5C77AEBD0F9E8E7546B6F9F48079D9F8D46EFDFC1E9B119EB065527C83297EE
          EFBFD9866BFB6E31B342739B82633325701A52F10F70DAC36B17EFB689DC7DBC
          BF8DE488AB970188AB97BC38FF0A66AF0117443887C259023F88DDF04766F895
          04821563CBC94C6E481DA4039C6BE3DC2EDEEDE0DC36CEBF41A5FA1ED256FEB6
          98B8FA81A49FB6C0CE215EB6C019E04522B7B5B7F7EA5AB48A8011A60634C61A
          0864203D4174913A54E31F52AB5DC6F9F3489B0B5EF1D145EAD1556776B86176
          E78D6CF4657538FCD37D85B0EE7DE385234A908F731554F88180484029D200E3
          001F5D5C0A5E0EA98573AFD7CC0E2B66AA9BA951AF87D64A0285FC45FD8B7961
          888014401961749DA4FF1B20E5E830D2C1EF86C3E167BB2254C0FC28B1EA9126
          9C0097F68231218109993079B2D13F48079F1E093F4CAF92F4BFD0D85ECA40C1
          3CE96A05CA1B4E7915580454318B095603AB62D4C9B22F8F2410B2BF92A6152F
          A3EB647D73218922758E20900317CE9F4E92D909500358C3AC85D9FAD34BA00D
          92415D929E84A0B6820E93447B0B04C28C09C7C8A2341688758C13F9B589852D
          D05BA5249E301AFD8D10EE4EE6BC7F935EBF49301E09ED08ED6C6CC49D95CB10
          C660F908A742060175B0D3601DCC128246602F61B6CB30FD33C3F42F400F1413
          45BFA012BF83749A4EA78573BA67410FEA7237A5AF862B0948CA0928C79DF62D
          01C619CCBA188110C420BD4B3A7C17C721E82C10C01CE9E03B92E443EAF5731C
          765A60DC0EE23B9AFFDE8125CDA820E0A409A88A7B518FB12618E7B1E090AB60
          D60036C8E821FA08C3F09855316BE1DC39DAED47F8981BF5F8D4B74775C33180
          7333A09A224FC754315DC0D402D691B5813E4692AF1B8F590CB68673AFF078F7
          26717CFD9B027C2981502AC102811922C528063B0BDA227030DEA66D00040C0F
          D4089CC4F9F374BB7FA70C7E6409CA809A2B0568C6A0E3CFFAC49C46962B20C0
          E5CFC633067F3A01AD26304364C2A17CB87228DFC8CABB0AC726302132061ACF
          2D5F1DF3673BCB5BA76CD2CA08E118040AF032A8F29D684260067CBA42C69D3B
          EF19E5A3CC332910CA0A142A140073445618D46460B3E0CF4EA0FC90960D4B59
          973CA2B20F8CF1C9C534E381E31330168BBB24C69D735EEEA2871EB704A56EA8
          E233CF68DA94B4C4D153B656727D71B25E4560BE1B36A7FB407925CC49BF005C
          3EACCC819734C8DFBDB64A811A7012D1EB27FDC6E6C9534FD7FE18912409CEBB
          1ED0627C78182E2DC13FBFFAD7953F7CFCFBDFE6DD6541B665322E9B9B0FA1DE
          D7FFB97E65717EAE04F95501E2E72A010CF2CCBBF9B5944011FE398317B1F0F7
          FC7F4107CFCA8871025C00000025744558746372656174652D64617465003230
          30392D31312D31355432333A30343A33312D30373A303055199EBF0000002574
          455874646174653A63726561746500323031302D30322D32305432333A32363A
          31352D30373A3030063B5C810000002574455874646174653A6D6F6469667900
          323031302D30312D31315430393A31313A32302D30373A3030557A5F36000000
          34744558744C6963656E736500687474703A2F2F6372656174697665636F6D6D
          6F6E732E6F72672F6C6963656E7365732F47504C2F322E302F6C6A06A8000000
          25744558746D6F646966792D6461746500323030392D31312D31355432333A30
          343A33312D30373A30300AA8E88B0000001774455874536F7572636500474E4F
          4D452049636F6E205468656D65C1F926690000002074455874536F757263655F
          55524C00687474703A2F2F6172742E676E6F6D652E6F72672F32E49179000000
          0049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000000467414D410000B18F0BFC6105000000017352474200AECE1CE90000
          00206348524D00007A26000080840000FA00000080E8000075300000EA600000
          3A98000017709CBA513C00000006624B4744000000000000F943BB7F00000009
          7048597300000DD700000DD70142289B78000000097670416700000020000000
          200087FA9C9D000006854944415458C3BD967B6C53D71DC73FF7DABEF73A765E
          4EC8938440A84487E81E9A26315A89552B83168A2AADDD22551D52D15AAD13D0
          B5A2652AD380418A58BB07304AA5AD4AF2C7BA924E6AD9431A6C0A74859441BB
          462D010D9686240DB16327B11DDBF775CEFE200FC73121AC527FD2918FAFCF3D
          9FEFF9FE7EE71C2B7C4ED1FDD0433B92C9E4D6A2C6C6BF8AF1F117EE6C6B1B00
          5072C62D04EAF33CFF4CF1DAB3C6AABB136B9AC7FB5D3573FE3C6A656554ABA8
          58FFA593273B7341EB5CD7FD8B695A5312A60628D3436F475D2A720679E95114
          D3CBC57DE5945D1FA5D7B62988C763AAA67DD99BFB8269598C8E8EA2A80A8A92
          D32684CCE86789CBEE0358F1FF20BB1F276878F8499BC3C9488267C6C658128B
          31ECF38582F1F84E35578002397075BAAFAAA859FD6C716AD633555170CD28E2
          D2260AFD2E47DF7279FB6C8051CBE207893186EE5465D871E8D3F572358F6B28
          8A8AAA4EB63C4EE44073E1C2CD607EF43D8AFD49FE7C4670F478102104E17098
          6DDF75DC2FEC904EED034A774726F3436F1EFC6C688EF58AA2CCB03FFB534A41
          EAE3A728D1C3FCEB9287DD6D0642BA44A3519AEE3569BA4FC1EFF785DF2D158F
          B5E08E7A67AF9EBCB99F82CE550B40A27B17259ECB5CBBAEF1DC511F19D32491
          48B0725982679BBC04FC4AEACD53F2C97DADF635C0CEE3C0CD0564AF7C561F48
          7EF25B8A9C538CA6823C7DD86278640CD334A92B1DA6F90995A2429DC3ED99DF
          34B7D91F0126E0A8F31230570D4CB4F4D0DF30C6FE80A386D8F93B832BBD6308
          21285023FC7A9B4279A98F44E8199ADBECAB40664280B8B5809CEFD905A7280A
          AAAA628D7D8877E8301EBD8C97DE0870FA5C1F524A8419E5575B6CEA2A7D2483
          4D8CFBD703D813700B40CD439F06CFC30D27D587B8B61FADA08CF63355BC7EFC
          63006C33C18BDF1F67F9121F69FF6A867C8FA1EB3A13E07140E415301FF0A4F5
          C21EC3EED94B4120C4DFFF1DE2C5C3A79152625B26DB1F1961D55D5E1C63053D
          3C856118188601909A7081FC0E64BB304743DA64AEEE251028E2C39E4276FEE2
          2C8EE3E0BA2E9BEE8BF2E0DD1E14A39E8BD6D3687A005DD7292E2E9E7440CE29
          60C696CB074792BEFA7382053A570614B6EE3D4B3299444AC9DAAFC478FC0181
          1E28E3FDE45654AD14C330282E2EA6B4B4946CF8CD6BE01622529FBC4A816E33
          3402DB9A3F60783806C05797C6D9DE64120C0638177B12D75B83AEEB14161652
          555585C7E39985CB5F035945989B92F4C031FCF4134F296CDB77819EDE410096
          56A7D9BD2941A858A333F22809D988AEEB040201EAEAEAD0342D6FB6E7570313
          8F33910E7CA9B358C2CF8E03EFD175B10F80CA129BFD9B47A82AF7713EBC9EC1
          CC5DE8BA8EDFEFA7A1A1816030387558CD4BC0D4B59ABDDDE25D28E116D0AAF8
          E92F4F73EABD5E000AFD82FD9BA334D478B8185B49F7C8D7D1751DC33058B468
          11656565336B6B5E02725260A586B0AFFC185FA09E978FBCC5F17FF403E0F34A
          F66C8AB2A2117AE3CB78F7DA37D1751D5DD7A9ADADA5A6A6E6C681240442085C
          57CC62E5BD0B72D3108F455058C2EF5BFF48CB7131F933CF7F67847B56B80C67
          16F2A74BF7132C34D0348D8A8A0A162F5E8CE33858968594F2C65C1EEFFC0464
          E75D5114CCF118AEB186FFC647800F00D8BC2ECEC655162911E2F50BF7E3F517
          20848B699A040201063E1D408A1B3BCEEBF5E2F3F91889279240726E01D9FFFD
          14854C3246263588951E64E3EA52AC44315EF7539E589F427A02BCF6CF35D86A
          11059A8610920D1B365051513135879412DBB6E9EDEDB5F6EDD9B50B787F5E29
          982C98B1C815ACD420A9780F66A297752BBD840A6BF1787B78F59DD5B8BE4534
          D4D5515F5F8FAAAA79E17DFD7DE2E0A1837BDBDBDF3CC28D7BE0D629988CCECE
          D3D4950C608E5F474A17AF7F2111B98C33A9E5ACFDF617A9AEAEC6EFF7E3BA2E
          3D3D3DB3E0FD03FDB2B5B5E5C0A183875ECA85E71590BD5162D1082FBFF2365F
          5BAEB1F11B552C68B897CAC6B5842A1BF0783C53421DC7C1344D6CDB99011F18
          E8A7BDFDD8913DBB7FB6271F7CCE14007474749088C7D14ABEC51DF76CA1BAA6
          6EBA4827E093DBCCB66D5CD79DB1F2F6F663479E7F6EC7F69BC1F30A9072FAAE
          58501EE2C48913942FA8E05621844055D5A99CB7B6B61C986BE5378B759665C9
          743A2D33998CB42C4B5A96256DDB96B66D4BC771A4E338D2755D2984904208E9
          BAAECC6432321C0ECBAEAE2E79F9F26573CBD62D2F0005B7039E12E0BAEE0CD8
          24301B9ADD5C2164DAB46424362ADFE93C977CF891877F743BF0DCC3792970C7
          FFA37C2212C00520FD19E6F87CE37FBF2C155513A619E0000000257445587463
          72656174652D6461746500323030392D31312D31355431373A30323A33372D30
          373A3030870F948F0000002574455874646174653A6372656174650032303130
          2D30312D31315430393A33303A30362D30373A3030B27C073200000025744558
          74646174653A6D6F6469667900323031302D30312D31315430393A33303A3036
          2D30373A3030C321BF8E00000067744558744C6963656E736500687474703A2F
          2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E7365732F6279
          2D73612F332E302F206F7220687474703A2F2F6372656174697665636F6D6D6F
          6E732E6F72672F6C6963656E7365732F4C47504C2F322E312F5B8F3C63000000
          25744558746D6F646966792D6461746500323030392D30332D31395431303A35
          323A34382D30363A3030265AB84B0000001374455874536F75726365004F7879
          67656E2049636F6E73EC18AEE80000002774455874536F757263655F55524C00
          687474703A2F2F7777772E6F787967656E2D69636F6E732E6F72672FEF37AACB
          0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B4744000000000000F943BB7F00000009704859730000037600
          000376017DD582CC000000097670416700000020000000200087FA9C9D000005
          EE4944415458C3AD975D681CD719869F33FBA7DDACACB5E395DCC88A2CD224B2
          8D6C7251DF84083B21D09B5253639A5E248D9DB484D6E0520885225A8A4D62F5
          2F0D55421BB70DE94D0D251497A4A4605729861022D7AD1BA1CAB56AAF88A495
          56D5CFEECEEECEDF99AF17D2AAE3D5AC2C077FF0EE99656678DFF37EDF39DF1C
          2522DCCDF8B5525D49F86E0A3E2790B121138339E0ED08BC7958E466F0791514
          A094DA05ECFA34C45B21FA220CA4E1D1DEFEFEE8AE279F24FDC00368C09C9860
          EABDF7B8F9C10752843F56E04BDF17F1C3041CB46D7BD8B26C50A0567E0223A0
          D4CA18B8F6B5E6DD279EC0BC7A9503274F92E9ED25121027AB581A1DE5A3A121
          AA8E73692F3C7E48C48B36CEC4B26CCAA6896128940A419D58A9BA682E1D3B46
          796484FD4F3D45B2258135F309315F2302A2416B0D8904D14482FD478E70E5DC
          B9C74645CE3DAED451A351805204C80D9432300CE3FF0202D7865294AE5D63FA
          FC79EEEBEA84844FE2D103DCF7EC57292CE5704B3729CFFF9BA5A5193A8F1D23
          79E000B6EBD2D5D989862F9C8487D6096095D8300C0C43AD8931022E18013197
          0707B9478474268565CFB165F71E529DDDECFED600633313CC5BB3F47E6780E4
          CE9D6CDBBF8FA5B9595A9249DA20DE03A7D6D540B96C0E576BD50DADAFFFB76C
          9BB7F7EEA57D7E9E8E2E45FCA17B986DEBA2FF95F364EE7F90E5DC184A29DABA
          7753BC798D3F3DFB453A26A761A6C27F5D611AA64253109AFB06179452589685
          619A440C88A78564CCA43BF62F7EFFB57E1673E36476EDA1AD7B378B3746F9ED
          33FDEC8C5EA3ED5E93584648ACD0A5A3E129685E806A45210A88C76218D12886
          B7526C1850D160440523B00CB42F2452C2962C1809D03530E6210D89F50ED0DC
          815B6018F8BE4F2A1E476970ABB0548205AF9D23AFFF854C572FD5C238E5FC38
          D9CFF6F1E5B31799F4B3181910630511A81A77E440432A7CDFA7E5E187111F4A
          0BB06C6FE1B11F5F24D3BD87CACC18233F39C8D55F1EA2363F4EDBFD7D1C7CF9
          22056F0BC525F07D58847F7E6A070CA54826936C3D71021589E058E07C52A670
          F912E6E428FFF8C121B232C7CEC42CFF79E310D5B971CAD7FF8A3D59C69A8708
          C80538BB6E15546BB561DBB69BE63F088042A1C087870F93BE72052B023AABC8
          F4B6124F97486F87781A2251D09136963E2E52FC102225C8C147DF80AF44431D
          08431327B66DDBC6D6975EA2FAC20BB4E672940BC2A25922D60ED5ED1089AF14
          682D57442D40CA8102DCF836BC08E4D7D7C0668B70D581783CCEDE7DFB880F0D
          517CE411B6FBD06A82DC80EA65302F83F93748E4E15E3FCA185C7F0E4E58F077
          11A9AD4B41CDB2861DC7095DF78DE475B122C2F2F2326363635C7FFF7DB6BFF3
          0EAD1313A85A8D68348A1F8B31DBDD4DE5E8519E1F183809FC4E44E643BBA165
          59C38EEB36DD7C824D282802C0B66DF2F93CD3D3D34C4D4D51A95448A5522493
          49B2D92C3D3D3D7475757D5E44FE5C7F371A9A82006832F34672809696167A7A
          7AD8B163077D7D7D4422111CC74144D6840076F0FDD09DB071CF6F461AE60240
          2A9522954AB19968BA0AEA629A597F3B11F5B8E5932FE47E680A6898FD46A461
          E42282EFFBB78C002AD820361210240E236B960AA5145A6B7CDFC7711C5CD745
          6BBDF24504541CCF046A9B7660B3A4F5D05AE3BA2EB66D53A95428168B542A55
          508AD6B6ADEECB83A75F05463616D050781BD91E0CDFF7F13C0FCBB2C8E76799
          9B9B259168A1BDA39D881191D367CEFCE2AD5FFDE67BB2FA357C4BBEEA000E3A
          8E23D56A556AB59AD8B62D8EE388E338E2BAAEB8AE2B9EE789E779A2B516DFF7
          D7E0388E148B45C9E57272E1C245D15A8BE3D8323939295F3FF1CD370123C855
          47B4D98C362AB4C67BBEEFAFD9BFB0B0483C9E406B8F7C7E961FBDFAB33FBC31
          F4DA716972020AED05DCC6EEC610113CCFC3344D4AA5121D1DED6BE4433F7DE5
          886C70FC8A6E86E076F9AFBB60DB0E3E108BC7E4F40F07DF3AFBDAEBC7E53667
          BFF06E7807B3AF372311416B8F6CC767BC5367067FBE19F235FB8245A8B51627
          A4E08208169FEFFBE27A9E2C974CB93A3E517EFAF8F153AC36B9CDE0AE1D4E57
          A30A8C6C6AE675CEBB7D3CBFD3F81FBF8E3FBC72201569000000257445587463
          72656174652D6461746500323030392D31312D31355431373A30323A33372D30
          373A3030870F948F0000002574455874646174653A6372656174650032303130
          2D30322D32305432333A32363A31352D30373A3030063B5C8100000025744558
          74646174653A6D6F6469667900323031302D30312D31315430393A33303A3133
          2D30373A30305DB390B700000067744558744C6963656E736500687474703A2F
          2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E7365732F6279
          2D73612F332E302F206F7220687474703A2F2F6372656174697665636F6D6D6F
          6E732E6F72672F6C6963656E7365732F4C47504C2F322E312F5B8F3C63000000
          25744558746D6F646966792D6461746500323030392D30362D30335430393A35
          383A31322D30363A30308AED6EE30000001974455874536F6674776172650077
          77772E696E6B73636170652E6F72679BEE3C1A0000001374455874536F757263
          65004F787967656E2049636F6E73EC18AEE80000002774455874536F75726365
          5F55524C00687474703A2F2F7777772E6F787967656E2D69636F6E732E6F7267
          2FEF37AACB0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B4744000000000000F943BB7F000000097048597300000DD700
          000DD70142289B78000000097670416700000020000000200087FA9C9D000007
          424944415458C3B5965B8C95D515C77F7B7FFBBB9E3917E6301704860305A6A3
          5107B0E240A820E8B4890FB690B634A9B6582B0D8D89496F12E3A5565A9BA831
          E9435F8D6FF4C98634C13669A2A2568852C144B109215810C671CE65CEE5BBED
          DD8733E7EB80284E1377B25FBEBDF65EBFF55F6BAFFD89C9C9497A43DE7CF4F1
          288EF71B63145FC21042248E6D1FD06F7EEDD1DEB74B1C4571BCFFF9078FA9C0
          2E7F19FE69C5D3EA9E676FDAAFE0CA00C618550C8679FDCD235FF8D0899B37B3
          79DBED1CF9C7DFAE6A5BB487B95CDD4F49EDBAFE82A2EAD92F74DF670228B5B0
          F4F7EC17BAEF8A004288A4D199523BB67D6341871C7FF38D2F64D7E84C218448
          3E134029F9D4B77FB3FA5757BB05BEEB873B6FDBE176E23A005228FEF2F22B9D
          4E18799FB74F089128259FFA4C008EDEF2B08287AF164967DD6BB13116699ACE
          817B74C2C8B38F6F160B928E2BD4C0171D167606206CFBFF3DE6EA007AFD1B67
          529D8ECCFF1638B9500A5B6500C622F0824E6BFC88996F27A5BC60BD3531BC60
          80C3870F6752DE36DEB7FCC15D0FA12C0B630C064D9246EE7FA64F660AB4C33A
          DFDFB1DBC368B44ED12625D5312FBC7470E8EF870F5B8001CCE4E4A4B9DC9798
          DF8A7B8EFF7AF8C5BD9665FD415976DF8BEF3C43283F66DBF8562ED63EA0D9F9
          E4731573948FEF9438F6DEBBC8A4CCF6CAFD186D92288A7EFDC3BBEF7DE67208
          7939D073CF3DB75A4AEBF7AB2AA3EEF80D37F1E49E3F335858C3CBEFBC4239BF
          0A57E549D3F48AD3122E057F096F9F3A45D15BC103DFFC234B0697E1DABE4892
          E4D1A79F7EFA86F9EA5E0230B76095078A3F1E280FA9A1C121FBCC9933349B2D
          F64D3E4BD11BE1D5775E65A0B01ADB0A3EED5CBA0C145673ECBD93D8A6CCCE1B
          F7F3D1F90B4451447F7FD9F25C5F22CD7D809C0F21E7399780EB7AEE3D23CB2B
          C1D9B367E775399B9FDFF52716E556F2DAC9D7192CAEC5920E499A90A4094228
          864B631C7DFF388A45FC60E2B75852512C16F1FD6E8B1E583C98D3697AF71D77
          DCE101E24A29904F3CF1D856DFC915F2F93CF97C9E72B9FB2A1A634853CDBEC9
          6729F823FCF3BD630C97C6902804164B165DCBD1F7DF42A47DDCB3E90096EC82
          DBB6CDE2C58BD15A1304396CDB11D78F5F7F17207A2AF40004A0CA8BCBF78DAF
          5BE7753A1DB4D600C4714CBBDD264D53922465CFD70F90534B38FAFEDB5C53BE
          8E6BCAD7F1AF7F9F240D3DBEBBFE11E2282149BADDB6D96C128621524A8C318C
          8D5DDB672BF5B3F981F7F221B76FDF5E705D6F72687058341A0DD234A5D56ACD
          459F52AD56A956ABD46A75BE75FD2F70C5006F7D708277CF9C22895C76DFF418
          9D7648BD5EA7D168D06C364992846AB58A9412DBB6A9ACA8E038CE869D3B7756
          7A109902139B377E67FCC671658CA1D16850AFD71142104511ED769B300C69B7
          DBB45A2DCE9D3BCFF615F723C212B3338289C53FE2E28529AAD52A611812C771
          368D31C471CCECEC2CC6186EDDB2D5EAEF2FFDA49706D993BF5028EE1B1D1DB3
          6666663877EE1C4208D234C5188310A2D7D9B02C8B5C2E47B55AE3D6E5F7727B
          651FCAB269341A0821504A615916B66D63DB36C674AFFDF4F4348D4683F5EBD7
          4BA5EC3D800D0805C8DDBB77AF0AFCE02BBEEF73FAF469E238E6E2C58B2C5BB6
          0CAD3542083CCFC3B66D3CCF230802CAE532511465EB524A84100821D05A638C
          416B9DADF76CE33866CD9AB5853BEFBC73DBA143875E92805CB972C50313B74C
          A87ABD4E14450C0F0FE3380ECD6673AEF8BA85658C414A89E338044140A150A0
          582CD2D7D787E77928A532B57A00BEEF77F35FA920A5A456ABB169D326353434
          F4102015A0529D7E6FEDDA51CE9E3D9BC95E281490526607A4694A14454451D4
          7D13E6269029D053A1A794318656AB45B3D9CC521386214B972E258AA2890D1B
          3694D59E3D7B768C8C54FA9452CCCCCC6457A6275DEF5B1004E472398AC522AE
          EB62DB36966565003DC0300C69341A5CB8D0ED824AA9CCD6B2AC2C4DE3E3E396
          EFFB0F28CFF71E1FFBEA983C78F020B95C8E4AA5C2F4F4344AA9CC9131864EA7
          431CC7D981B66DA394BA4476AD75A650A9549AFF2C6705FCE1871F72E4C81136
          6EDCC8891327F6AA5AB5B6A256AF1104015BB76EA5542AD16C363F5558F30BAC
          5764BD14749F69D0699AEDB32C2B4BA7D626BB8E83C3C3CCCECEA20DB4DBEDA2
          D8B56B5767F9C852D7755DCE7FF411EBC6D771E0C9DFE1380EC562917C214F2E
          97EBD682E37415701CF27D7DF8410ECF73B16D07695944514873B6C92733339C
          3B7F9E4663166D0C461BB4D118DD050D029FA1C121FAF3B944492945A9B48828
          0AB3A8464747A9D56AFF8B1030BD57DC409AA4345B2DDA9DCE5CFE357AAE6376
          C2884EA74DD8092F295663BAE74077BF65491CC7112A49929694D259B2E41AFA
          FBCBAC5CB98ABD3FDD0B063CCFA356AB51AFD749D3146D3449AAE7380C3AD5A4
          5A13C511499C74A39D73A6B5C6688DC680EEDA673F1D088480998FA7B4D8B265
          CB23E572F9979665F9C618D1ABEAAB0D63CC556D3E6FA4691A4D4D4D3D2F80E5
          C01030007873EFC3827FAF17300C100155E0BC00F2800F388095A9F4E502F420
          DAFF05EDD49257E28363560000002574455874646174653A6372656174650032
          3031302D30312D31315430393A31353A30382D30373A30305C060EEA00000025
          74455874646174653A6D6F6469667900323031302D30312D31315430393A3135
          3A30382D30373A30302D5BB65600000034744558744C6963656E736500687474
          703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E736573
          2F47504C2F322E302F6C6A06A80000001974455874536F667477617265007777
          772E696E6B73636170652E6F72679BEE3C1A0000001374455874536F75726365
          00474E4F4D452D436F6C6F7273AA9944E20000003174455874536F757263655F
          55524C00687474703A2F2F636F64652E676F6F676C652E636F6D2F702F676E6F
          6D652D636F6C6F72732F501DB5EB0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B4744000000000000F943BB7F000000097048597300000DD700
          000DD70142289B78000000097670416700000020000000200087FA9C9D000007
          674944415458C3C597598C1C571586BF5355DD355DDD33DDB37A912DA2240F16
          10611285048388058A2C50A488D86393455126C831368B950D4708441640D851
          8494D8B1847800C7C2761CCB92234B8410111EB02118C10324013B0BF68CC7CB
          4CCFF44CAFD555F7F050D5D5DD3306022FB47475ABABEA9EFF3FFF39F7DC53A2
          AAFC3F7FCE077DF1B088DD8035298B8D96256BD4B02C541D00B0458A6231A946
          4FFA86432E9C18550D3F885DF94F0A1C16C904160FA1ECC80DE465C535CB3343
          2B066D3797C3CD66408446A54AA35C617A62DA8C9F9EA8CE174BA8B033657866
          54B5F63F133820B25E841F2FB96A7966D54DAB329EEB40690A2D4D237E0DF51B
          08026E1A5C0FC90F228561AAF580B77FFF566DF2BD899A1AB6DEA9FAE27F4740
          440E587CDFCD66B75F7FCB6A2F9FB531E3EF20E5592C0BC412C40291F6125550
          036A14ED1D40565ECB5CA5C9A9D7FE546D542A7BEE34ECE00A608B0988C841E1
          4861C9D0BA8F7FE63ACFBE348E5E9EC0B605CB06B1A54D4240004D0828C68086
          8A09414756604656F2C75FFFB93A7B61EA952F29EB1792B016C90E3FCC8F0CAE
          BBE1D31FF5E4DDB73197C663C008D4B2C0B2053B1E96D371DD49CE022E9E43DE
          7B931BD7AEF60A4B86D61DB0D8B910AF8BC0CF4546D3D9CCD73E76F387BDF0DD
          B7D0F959247653A49384203609B8E5C4FF2DE90E8F80CECD62CEFC95D59FFA88
          E77ADE570F886CBC62087E2AD2E30AE337DE72FD60B6360DD317BB002C1B6C47
          12EF5BF74404D54872132861A898500983EE7B32B094796F903FBC76AA682B2B
          5ABB2351C081AF0F2D1DCE64D316E1A50B5D32F58C3D44DFF1B7488F3D8A405B
          11699310016C0BF7C15D648FFE0577D3962E1BE1E54972AEC5F0F2914CD3E2E1
          2E050E8BD88150BC69ED0D7DE90B67A13ED715DFC11313485F0180E68B7B099F
          7B6CB102C6C27EE459EC2FDC0380B938CEECBA556D550245BD3EFC255771E257
          6F94534A615435B4001AB0A627971357202C9740A3CC6ECDFEEBC7134F521BB7
          E26CDF15657C08268CC11F6D8303F8C70FA2AA5D76CC5C09D756B2B92C0D5893
          84C0810D23C3F94C582A76832BA82AE5EF6EC37FF56862DCD9B005FB1B4F47B1
          361279FEF90EF063FBA9ED7932B6A1A87690982932B2B4DF7360538C0D22ACC9
          F7F73A66EE720770BCD808DA0C28EF18A3172575EB1D1189F50FA022889BE9F2
          BCF9F27EAA4F6E43031317A6360955084B7314FA87AD73C22713020ACBD34E0A
          D3F011050CA8282A820A1851683699DF3146CE18D2EB3644E1B8637357A2F9C7
          227013188C518CD13609A360C0341A38690703CB9210A832984A3998861F2554
          07E34885C8886906941FFB32FE2B2F2DAADEFEB1FD549ED886691A4CA857F4DE
          A862FC0669278D2A039D0AA0A16983B5BC6EEDB9282B2275C4A0F5FA2202DAF4
          318189CA70ECB969256AA71A0A6A4C7725B484E946DD073BD53E500C68B8C008
          16D9C7F7E0DE7ECF2202EEFAFBF1BEF31CA101B3005CC38E3058291AB5062214
          130202E7FD7A03B59C986D6B7B699B845AF43DF53C993BEE4D406B475FA0FEF2
          C1E47F66C318BD4FEC8ED7D3BD3E8C0F2A27260093ED1028276667E7577BB99C
          63AA1514C5744A6F590CFC602FDEFA3678F5C83E4ADFDA0A02852024F3C5BB01
          F046C75023141FDB9AE442021E2A562647A9346F42E564A240002F4DCDCC55C9
          641305346C2B917FF809B2A36DF0CAE17D14BFF915C26648E8874C3FBA99EA91
          FDC9F3ECA6FBC87FFBE98E42D5B68797657ABA5431702821E0C209BFDEA0D134
          E07ADD610821B7FEAEC478F9D0CF987A640B6133C404B1D4BEE1F2C39B291FDE
          97BCE7DD7A5BB2BE45821E8FBA1F52ADD6C58513098151D53084EF9D9BB858B5
          0686E285ED31F3EC2E9A67DFA7F493DD5C7A28060F218C4FBD30544CD370E9C1
          07987D7627C1F971669EFFD1223BD6C03067C72FD6809DADA6B5EB384EC3F8AA
          AB3F34D8539D8F7A016B41F723116541DAED583B55A22D465470923A12AB69F5
          15A8797DBC7DFABDA2C3158EE3FB54EBC0D677CE9DAF6ABE3F0A451879D73922
          D93BEE051DCFE2E70BD7E066D0BE01CEFC63BC0A6CEDEC94BB3AA2BB540F07CD
          E6EED3E7CE57ACC11170334953D119CFD6F19ADC8FAF1312ADB8070AAE8735B4
          84BF9F9DA8047E73CFC20E7951533A20927F060E16BCCC2DD72E5B9A91B919CC
          5C296A3A62BAAD766B71398C6487A8F058F93C9AEFE7F4F8646DAA5AFBED76B8
          BF0625559D5B4440447A8002D0EF40FFE3B0FD9A54EAF66B960CBB9E631316A7
          D17A2D01971683CE1C88CF5CE9C960F50F5233CA99C98BFEDF9ACD5F3E057B43
          98016689E6A2AAFA9D040A407F3C0680FEBBE1B3B7C2BD856C36B572B03F9516
          30B52AD41B68D044C3E8EB4B6C1B49A5B07A328897A16194F1E999A058AE04BF
          802387E0379DC0F13CA5AAF39D0452C0604CA0D01A7D303406B75D0F6BD3E9B4
          0C799ED39BE911C7B649390E08348390300898ABD575AA5A0D1ABECF1B70721F
          BC5A8629A014136891B840140A5D94032292EE50A10FE8057229E8FD1C5CF709
          B879195CED429F0399B892D6EA303F09EFFF0E4EBD0E6F36A10C5488E6392222
          9781B27680FEDB6F4311B18034D00364A3A2494F3CA7E32140331E3ED0884735
          26D000827F85F34F3711D1E6F1A5E28100000025744558746372656174652D64
          61746500323030392D31312D31355432333A30343A33322D30373A303064F184
          220000002574455874646174653A63726561746500323031302D30322D323054
          32333A32363A31382D30373A303067EC3D410000002574455874646174653A6D
          6F6469667900323031302D30312D31315430393A31313A32332D30373A303064
          9245AB00000034744558744C6963656E736500687474703A2F2F637265617469
          7665636F6D6D6F6E732E6F72672F6C6963656E7365732F47504C2F322E302F6C
          6A06A800000025744558746D6F646966792D6461746500323030392D31312D31
          355432333A30343A33322D30373A30303B40F2160000001974455874536F6674
          77617265007777772E696E6B73636170652E6F72679BEE3C1A00000017744558
          74536F7572636500474E4F4D452049636F6E205468656D65C1F9266900000020
          74455874536F757263655F55524C00687474703A2F2F6172742E676E6F6D652E
          6F72672F32E491790000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B4744000000000000F943BB7F00000009704859730000375C00
          00375C01CBC7A4B9000000097670416700000020000000200087FA9C9D000003
          CB4944415458C3E5564B885C45143DE7D6ADD7AFA7BB13274CC649740C510609
          D904125404DDB875E54AC10F08BA125C8888B80F0A2E54E2CE9D3B1782206EB2
          74638211228920269A8C928490E9A7C34CF7EBD755755DBC9E4F5C98F93D371E
          2878455571CE3DAFEEAD0BFCDFC117CF2C8293494C2000DBBC4EC242AC27378B
          802307159FBFF1D09E091021C1C95047534790404C404CB07104D4D51AE7A615
          C54AC24B677EDF3B079EFFB8768044B652A65E32D89A2306702AE370F14E181C
          9DF5228264B61B3A8004851B2EEB6A992024F777E4AB83FBDC53240600646D7F
          15303C3AEB5F1F05FBC60998126C7E46F1D12B0F6C8BF8E54FD75DBB2B043EFB
          C13538E1F44C4FAE3CF168EB40CBD3CC401820022B56137FB85A0D07237B6138
          B6B38E983220715BF41BCC42B0D3E2201986064037E9490440C06AF38164C04C
          4FD289A33EBFB438FEA26B5C26B013EE750D06E421E2B2257B1A864A4508A959
          A51C279891C940D44C565626DD9C76F211AF3161A6DEBA7D1193E8AD0AE08FD7
          C60B2BA57553425F8575AEC1802A1800C3A68BC6896A92EBA6FC3355B723C236
          CED300830AD71D4015126CB26B538C9C9CE64E22DFEC00098458B30B4108A194
          7AC1008C8221A51D86B705104048936FD6A9A69D560B83514918508D0D519A15
          101360069A193B790E0D31C0AB33D21093ADDBD5A4009296A9588801FAF5F98B
          F991D9B903C7E6A7F9DBEDB241FA0D1966B9FC74BD3870E9FB5F063CF1F6B96B
          BDB6DBAF22FB428C623B4CB32DC208D03949302C97E3F49776737FF0D567E6FD
          7D1D3F0AC1DA8D51DF8DE4049DB3176F676A943FBFBB1AF26E5B5288B1FD5FB0
          8B4828ABF1E0E71BA35255DC7219A4E3A38F21B271030C8033B1D52ABA90B8AC
          AAAEC83337BF6F4AAB6A8CE6FEFE2605AACE420C3E5357A8775A640AD79B121B
          8EEAC6A4C9443433649E581DC2A9D342555D3F53BA6E5B4012C25D55DC7B2219
          907B41A174AAAEAFEAB4AF4AD79BAA8B63ED40733033E419A94A5773ABDE5127
          ECB68529AD39D01C9211ED16A14EA8AA77D43BB72442B43CD9F20291DD93FCBB
          00A0E52942C23B5DD2CCFB2598584A260660B74DE73D6175FB6F10645E97549D
          EB9B494C664E004C2A41733268B0646246F3EA96F4C963DDC27BC6FE6AF0D538
          AE5DC2C6DE02D4EF812E1CCEE3C221166AB7BEED1F5A38BEBC52C94CCA5255B7
          0A8DC248F89EB762F1CAE58200B2078F3CFC5CCBBB9329C55D36BD5B3341C4D9
          681C2FFC71FDD72F0900ED769BC3E1B00B401B665F43C8F37CA52C4BE3F113A7
          F0D63BEFE2DCF90BC85A19EE9F3B8CF7DE7C6DCF0B9299E1F4279FE1D6CD1B18
          57233CFED8297CF8FE69FC0D04D7ADD6E60D1548000000257445587463726561
          74652D6461746500323030392D31312D31355431373A30323A33372D30373A30
          30870F948F0000002574455874646174653A63726561746500323031302D3031
          2D31315430393A33303A31362D30373A30307ED607AC00000025744558746461
          74653A6D6F6469667900323031302D30312D31315430393A33303A31362D3037
          3A30300F8BBF1000000067744558744C6963656E736500687474703A2F2F6372
          656174697665636F6D6D6F6E732E6F72672F6C6963656E7365732F62792D7361
          2F332E302F206F7220687474703A2F2F6372656174697665636F6D6D6F6E732E
          6F72672F6C6963656E7365732F4C47504C2F322E312F5B8F3C63000000257445
          58746D6F646966792D6461746500323030392D30332D31395431303A35323A34
          382D30363A3030265AB84B0000001974455874536F667477617265007777772E
          696E6B73636170652E6F72679BEE3C1A0000001374455874536F75726365004F
          787967656E2049636F6E73EC18AEE80000002774455874536F757263655F5552
          4C00687474703A2F2F7777772E6F787967656E2D69636F6E732E6F72672FEF37
          AACB0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B4744000000000000F943BB7F000000097048597300000DD700
          000DD70142289B78000000097670416700000020000000200087FA9C9D000009
          574944415458C3C5567B7053551AFF9D7BEECD4D9AA6E9BB495F34ADE55568E9
          5B0BD8165016667D42B58E8FDD55D49965161D5D9455716576195167D559F1B1
          E8CEECA8EB82288F4140AC58D15228A54540C16EDBA44D9B579BA66D9AE426B9
          3739FB8769ED5450774767BF996FEE9DEF7CF7FC7EE73BDFF79B0BFC9F8DCC0C
          3436366444C19CA63C1366E599DA9B9B8FDE595FBFFCADFE3E4BA5A5CF020E24
          6BE7CEDDF69F8D51C3AD6BD899339DCC6AED637BF7BD2F9F38D9AAECDDF7BE6C
          B5F6B133673A59C3AD6BD84F89C7CF0CE49BF259727232494F37E0BA5F5ECFCB
          B202A1A2128A120163DFACFF9404B899815979B33A3B3ADA654A29DE7AFB4DE9
          DEFBEF09BEF5F69B12A5141D1DEDF2ACBC599D3F2B81E6E6E675191946415114
          1C3A7C481392E46B0E1D3EA4511405191946A1B9B979FDFCD2D2592595D57FAB
          5ABC74A0A266292B2E2FBF65FA1E0D0D0DB4A4FCCAF2FF89407D7DFD1B2E9743
          E6791EAB57AD96448DD0B47AD56A89E779B85C0EF9EAAB6B5F55A9D47D77FFFA
          AEFB76BCBA3D7BEB9627A152A91F99BE4777BF75A720F2A7AB962C751555562E
          FFAF4AF2E8A68DD1FEFE3E160C0699A2C84C9224A628320B0683ACBFBF8F3DBA
          6963B4A6AE2EE219F5309B7D90399D4E5653B72C32799805151575CB7EB18A0D
          0D0FB1B6F6536CD9CA55ACA4B2EA85CBE17DA709CD1633F1783C2004E8E8EC50
          0C0623713A1DACBCAC9CF7783C305BCC0480C7DC6B4E51A26168E374585E5FC7
          298AAC504A43914844F5878D0F6364640439D9D978F077BFC5535BB75DF63A2E
          A503B3A2607D933AF0AFDDBB3FE229FF9B94445D26C771F0F9A40DAE91B1671F
          79E801F5FC7973A1D7EB21080278CA430A4A70BA9C000386DC2E14E6CFC18687
          7E0FA77B28EF6C5B5BFF8F2230DD1696555525E8E3DB6EBEE17AECDDBF9F294A
          A40B20B35FFCCBB3DC82F9F3E11E716360D00A590E43566468B55AA4A76640AF
          D7C366B7A1B7D7826DCFBDD0D571B275EE8FAEC074ABAC5932F0C4E39BB297D5
          D662787818073FFC10CBEB6A613018D176AA153EBF0F1CC7C59C4CBD8BA28882
          FC4204FC01ACDFF0101B1B1BBDEA8BD3A7DB00A0B8B8587BEEDC39FF0F122829
          A9295669B9B34D873FC088671876871D89BA24E4994CF8F4D85184C2A169E0DF
          25C1F33C72B272E1F3F971DFFA07C2513027CFF199E1708857A291BAF3EDEDC7
          00805E8E80C994E565044B9A8F7D96575559019EF29837771E5A5A8F410A4AA0
          3C054F79E8743A2427A7202931199AB838442211100EE008874030808C7403B2
          B28C74456D9DFE8EDB1AB9FCFC7C9C38D196E4B2DB767E2F81C1C141C53E30F0
          0F41ADBDD074F493B5AB565E4328A5E8B75A402905CFF3484B4D0703B0EBDD3D
          E8B75A919A9A82D985732005030018388E03E5291212123032E2064F2972B2B3
          F1D1C71F1B07ADFDDB804B08D14C3BDF716A37632C6C3018E070DA402905A514
          898949F007246CDCB459693ED6B27ECFFE03773FB1F9CFD2A0DD869CACDCA9BC
          602888045D3CE23471D0C66961B33B1096657D5D5D1D0F5C42072E632A6D9C16
          DE092F28A5E0380E89FA24EC3F701092145E7FEEF4A91D0050525665DBF2A76D
          47F6EFDE059B63001CC78110405009E83873164D1F7FC28221E942588EBEF0E9
          C94F23DF4BA0B8ACAA86A37842ADD6AC484B4D21A17008A24A05590E83E338A8
          453586DD6E900893A63E12482051AF8720A820082A000C8410508EC727C73E87
          73D0AAE9E9E9094DC7B92C0141C51F6F587B336A972E06E538844221A8441134
          2881E33828110577DC762B8EB79E7A7D61458583446948E0850377DDDE8880E4
          07470808C741E005C88A8C70281C9909FEBD3DC0F3D459595E86786D1C5C434E
          8C8D8D2239290594A7A03CC5D8B807050557E0F967B78A15A5A54D69E9C99F3D
          FFCC56FDB52BAE8173C8F64D1EA510542A0C0F0F438EC85C4945C50D33712E37
          052435CDB040AF4F58B4A8A404C16008D68101CC9D3D175E9F772AC9E7F76176
          E11CDCB2662DEEBAE376A4A6A462D0694530140421040404A2A886B5DF8A9285
          0B48B7D9D2989894BA58AB51BFEBF178A2C0A58588002085A5A573F41AED0581
          E7C10893E4B022BCF2D7E7F98C8C74385D3680604A74261B93100242BEDD52A3
          8E837BD88D93274E222B3B0799C62C6C7A720BC68647D79E3FDBBE17009BCA6E
          6C6C488AB0A827DF940F93C9F4F907070F6EAEBEF2CA9727C6C78B2C7D160C0D
          B9FF1825C253AFBDFC22D125E8E076BBC062B33EE9DF9E80401445F8FD011C3E
          F411E6CF9B079D4E077F20802D5B9FF69F6E6D4D05100110A1D3C1EFBD6F1D4A
          CB1721284959D75EBBF257A28A4FA9595AC3151515A1EBEBAFEB1D2EB7C533E2
          492A2830C160C804CFF3002153DDCE71142A41055154C3E319C3E627B7A2B5AD
          DDDCDED19928AAD5E4BD3DFB30E4726F1819725D04C000301E0018C754F9B9F9
          4CAF4F20850573503C7F11EF0BF8505D590D2924A1BBE76B44A351A61255A6DA
          AB97E0CB73E7E0B03B90969E86B4D45488F12AC8B282503808F7F008FEDD6DC6
          4BAFEC880E39ED8F0D582C2DBAA424DDC4B8F77146C844D797670F0350018802
          88F200B0EB9DF75CAFBCB6BDB3B7C75CBCB06891B0E38DD7826D6DA748757515
          BB77DDFDEA9EEE5EC5EE1A195D545C92969D9D05B02842C1301E7CF851B0288B
          08A29A661B0DB8F1BAD570B8EC48D427832390062C96B3003413A3A3D2F9D18E
          8D00A418B81C738E8B351D77E4C891078C864CC11FF0A3A5E5B8DADA3778674B
          CB71B53FE047A6318B5764C57DF1E245747575C368CCC23F77ED86DD6E7FB5AD
          E5F38696A34D6B7ACD7D1106C090618431C300102EEEC7482C171B4571C58A15
          DB1D4EBBAC8DD362C992C5C1DCBCECB7172FAE0969E3B4B03B6C4A63C34DB4D7
          6C7EECC5975E9E7878D3E3B058FACCD69E9EFDB15349FE80FFCBAEEE1E88A21A
          E7BFFA0A0048725A5ACAE47ACC4300C2B1D34700440900CDEC3985C69B6EBAB1
          E7E6B53792C22BE642236AE00BF8101F173FD5037BDEDBC79ED9F65C2D80504E
          5E61D5B8C775C1EBF5FA2747393337B73C2DDDB05D10052910087EE1F38EBD63
          EDED6D01A04C2B793846629288C2031026BC136AB3C54CC6C7BDE8EEED426F77
          6FD468CC82C36143416101373EEE9DFC190D03F00DF4751F8975F1949ADAADD6
          26B7D3B9201C0E87626BD1C9518BB932C3A72A900020293737A7A8FAAAAA8300
          505656D6FFC6EB7F3F70CFBABBAF1F1F1BCF355BCC38F4C1E1957E7FC006C01B
          23129914AD19D73A093EF99CE991E9390480068016801E402280F8588CC69243
          00FC00C6014C0008C4CA199D064EA6814F3E7FC80180FD07D9B933F96B39FBBD
          00000025744558746372656174652D6461746500323030392D31312D31355432
          333A30343A33312D30373A303055199EBF0000002574455874646174653A6372
          6561746500323031302D30322D32305432333A32363A31382D30373A303067EC
          3D410000002574455874646174653A6D6F6469667900323031302D30312D3131
          5430393A31313A32322D30373A3030C2E54E1F00000034744558744C6963656E
          736500687474703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C69
          63656E7365732F47504C2F322E302F6C6A06A800000025744558746D6F646966
          792D6461746500323030392D31312D31355432333A30343A33312D30373A3030
          0AA8E88B0000001774455874536F7572636500474E4F4D452049636F6E205468
          656D65C1F926690000002074455874536F757263655F55524C00687474703A2F
          2F6172742E676E6F6D652E6F72672F32E491790000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B4744000000000000F943BB7F00000009704859730000004800
          0000480046C96B3E000000097670416700000020000000200087FA9C9D000007
          714944415458C3C597696C54D719869F7367C6DBD8E37DC5D81EEFB82CA2C860
          F6C84122A5596A098A4841052591AA5451A5B8952A5591D25F5DDD564DB704B5
          20858684DD714A21D4ACB6314BCC6A6C838D77B031DE66B067B973CFE98FB107
          8F31263F9072A42BDDF79E6FCEFBCDFBBDE73BF70AA514DFE4D0BE5176C03CFD
          C196AD9B5E0C3187ED74B95DF6E749141E16DEEEF5B9DFDABB677FF5AC098498
          C3766EFEFE667B4949094288E742AE94A2B6AED67EE0C0819D40F6D4B9274AE0
          72BB9E2B39801082952B563293AADAD37E5059558942219542A1181E19422A85
          5412A9E4049633608552EA31962AB0E64CC3CC2C63646438088F8E4EC7233362
          A514BAEEA5BFFF3E00A929739ECA316B02365BCCC49DC2E118C5166503FCFFC4
          E11CC516151D889DC40A8961180C0DB9898B4B786679664D00252708A7F60A19
          400A191C8EC4E7F331D95AFC3D66F63EF335FAC0634289422AA6103CBEDC5E1F
          7D0F9DC82052F9CCD56755C0E17404E1474E67307EF4187FD5D4C7DCA4084C2A
          3CF06C78D8EF99D93C30AB02915151444646E1352CECAB6EC32B2D4458AD58AD
          5600AC13F7ADBD4E7AFA9DE4642613658BC666F37B233A3A86875DFFE5F4A1ED
          7CF6E7224A328EF3975F445455948B37BF56024AFAB7E1A7FF6B62C8E9E6FD8F
          6A3872EA36E36EEF440914CE31171F1EBACAB2F98913CAFBB72D40EBF54F686B
          F88082C238366FFF113B7EFC2EA51B36BD6C8B89FFD31F7F667AEB99255040D3
          DD878C38DCBCB3713E5E29A83AD7CE7BFFA8E5C525E9BC509CC18787AE919711
          4B4A9CD54FAC142881943A376B7FCBFA57379153B820B0664C5C22212161D62F
          F6FFEB7715E562F7EC1E7038F8E4F82DB6BD948F10106A526C7C218B358B92D9
          73EC163B2BAF22A5E0AF3F5DF5844734CD425CDA0A4E1D3B88D7EB26353D0B80
          FB3D1DD49EFC4249697C5E5EA1F45913A8BD394061563CB99989B85D2EC2C2C3
          9086242541F0765911FDA37938C775E2E26CB8C6C689B05A418040E0740C33D8
          5B4341612C6D4DA73977621080B4F478B2EC36D1787DE4D58A7261796A024A49
          BEBCD0C12FDF5C8E340C74DD8BD0048AC9560459A9B6C96000A45208054A2834
          CD424A5629ED6DC7285959C0F2557900DCEB19A4BEB6052955E5AC0A3C78F080
          D50B9762B128BC3E1DC33002350EECF2E92F334AA284404C78A0AFE3240585C9
          74760C70BEA639A0803D2799C6EB5DAFCDAA00C0DA4549B8C6C603D83DEE0A9A
          F7B8DC41D83D056B9A8584F4B5B4B79D9850A070BA0247CA2B942E265FC9166D
          33BD009C9A7E6A99541839FA4B00B49B4FA06B6353CAA4787FFB2EE6DB97A27B
          BC84848500022104AE3127A7F79632AF2801B7CB4B6F8FDF0373D2E3090B0FE1
          C6D58E51C3908901053433EF2D5E53A0327252C5D4FE3D7C2B94A8FE6C0C6530
          277D39D1F9DE891941EFDD010ED6FE9DF9F6622CA11650FE2ED0D17880A1DE73
          200D1A6FF4909018CDFC8599E415A6D1DB3DC8C5F3B7831558B4CD946F09315F
          FDCED692F0BBA39731940F7D5C3136A088BCB59AB2D21FE2743CE268C36E3C05
          57884CD208B59AC9892EA6FAD3067EF5C63E52E333014177F3413AAEFE8DE295
          6B49CFCC05A0A7B395FA33C7F17A1F91694F223C3C841BD73A1DD290094229C5
          E21DA65DF98B33B6162DCE313FEC1BE1ECE7579EF083A62CE4F95E9E2845355E
          117C4EACCB7E8324EB5C42877EC32B1B5F27A76041D07C5BCB0D8E1FF998D5A5
          45D4D7342BA7C3F5EF777F2FB789855BB544E0C164A0302B96ACFE161979C941
          0B385A2D686DF9C4D86279107991B805DEC05CF79D3E8CFB71FCE1EDC39CAB7A
          87FE8E632C5BB3FE09055CE34EB27292888808A1F17A97DF03D73E3606166ED5
          98536CC6F02A865B34D232E36919AC432A23508AD0E66FF3DDE2422222226838
          738A166F1DD6444198D5428E7D29D597AE706FA08DEE3BFFA1A0309EAED63ACE
          9FAE0A182F3B3786E65B8F989B91C0E50B7730A4A82AAF50BA282B2B0B6FB356
          4EEC3545EE824C162ECF41A9E0B3BC636F123FD8BC1D8BD9C2AE3D3BB1BF1E10
          0D21345A1ABAB87749B1225AC79E3CC08A35F348498B05A0EFDE3075679B70B9
          3CD87352021E681F2A4E378786AA5080CC55263A6A0C5A6F74D1D6D8FD8407F2
          3DDF2325D95F16D7888F23FF3C3BAD0729344D9110A1B9B2B233C2DB5AEE73A6
          FA2600E9E9F164652773BBA98739E9F15CAABFC3984BFB72602C45980DC3E2C5
          0C9D3506A0C858F594DE740AD253320270EE8A274FF2CE1A1F23635197EFB6F6
          AD5EB6B280E56BE62134C1BDEE41CED734E3F6287A7B06C9CC4EA1BBB7737DA8
          ECC1BC6FDFBEF12D5B5EB31946A8B525F4E0FDAE1A6346FE02A0B3AB3380678A
          D300A93B97D87333E9ED7EC8C5BA16BF07E6C663CF4DE5427D378929099C3E79
          DBE593969FEFFEECB2C30CB0776FA573C78E1D2E7C90B5E6290A5443D7940466
          8AEB38EB63DC97F8C1570D7D3F292DCD0F5BB2ACC0AF4CFB2027AB5B94C76378
          8E1D6DAA71BBF4FDBFDE253F021053BF8E176D333DF515B6402F0BC22D96C333
          C6157ACB8AD2C2AB5FB18579D729E55D020A9366A91FF318876FF6ADDB75F4E8
          D120E9C4B33ECF376CD8608A8D8DB5E8BA6E064C9397A6F9349FD04C0066250D
          29CD1230262F5DD77D1E8F479F4E387DFC1F3FD5B176F43910B0000000257445
          5874646174653A63726561746500323031302D30312D31315430393A31353A30
          322D30373A3030F87651A40000002574455874646174653A6D6F646966790032
          3031302D30312D31315430393A31353A30322D30373A3030892BE91800000034
          744558744C6963656E736500687474703A2F2F6372656174697665636F6D6D6F
          6E732E6F72672F6C6963656E7365732F47504C2F322E302F6C6A06A800000019
          74455874536F667477617265007777772E696E6B73636170652E6F72679BEE3C
          1A0000001374455874536F7572636500474E4F4D452D436F6C6F7273AA9944E2
          0000003174455874536F757263655F55524C00687474703A2F2F636F64652E67
          6F6F676C652E636F6D2F702F676E6F6D652D636F6C6F72732F501DB5EB000000
          0049454E44AE426082}
      end>
    Left = 288
    Top = 344
    Bitmap = {}
  end
  object MainMenu1: TMainMenu
    Images = MenuImages
    OwnerDraw = True
    Left = 40
    Top = 392
    object P1: TMenuItem
      Caption = 'Project'
      object O1: TMenuItem
        Caption = 'Open project'
        ImageIndex = 0
        ShortCut = 16463
        OnClick = OpenProjectBtnClick
      end
      object C1: TMenuItem
        Caption = 'Create a new project'
        ImageIndex = 1
        ShortCut = 16462
        OnClick = NewProjectBtnClick
      end
      object E1: TMenuItem
        Caption = 'Edit project'
        ImageIndex = 2
        ShortCut = 16453
        OnClick = EditProjectBtnClick
      end
      object O2: TMenuItem
        Caption = 'Open project folder'
        ImageIndex = 6
        ShortCut = 24655
        OnClick = OpenProjectFolderBtnClick
      end
      object C2: TMenuItem
        Caption = 'Close the project'
        ImageIndex = 3
        ShortCut = 16451
        OnClick = CloseProjectBtnClick
      end
      object E2: TMenuItem
        Caption = 'Exit'
        ShortCut = 16472
        OnClick = E2Click
      end
    end
    object D1: TMenuItem
      Caption = 'Download'
      object S1: TMenuItem
        Caption = 'Start'
        ImageIndex = 4
        ShortCut = 16452
        OnClick = StartBtnClick
      end
      object S2: TMenuItem
        Caption = 'Stop'
        Enabled = False
        ImageIndex = 5
        ShortCut = 16467
        OnClick = StopBtnClick
      end
    end
    object T1: TMenuItem
      Caption = 'Tools'
      object S3: TMenuItem
        Caption = 'Settings'
        ImageIndex = 7
        ShortCut = 16464
        OnClick = SettingsBtnClick
      end
    end
    object H1: TMenuItem
      Caption = 'Help'
      object H2: TMenuItem
        Caption = 'Help'
        ShortCut = 112
        OnClick = H2Click
      end
      object C3: TMenuItem
        Caption = 'Change log'
        OnClick = C3Click
      end
      object L1: TMenuItem
        Caption = 'Licence'
        OnClick = L1Click
      end
      object S4: TMenuItem
        Caption = 'Send email to author'
        OnClick = S4Click
      end
      object A1: TMenuItem
        Caption = 'About'
        OnClick = A1Click
      end
    end
  end
  object MenuImages: TsAlphaImageList
    Items = <
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B4744000000000000F943BB7F000000097048597300000DD600
          000DD601906F799C00000009767041670000001000000010005CC6ADC3000001
          FD4944415438CBA593CF4B545114C73FF7DDB96305A659FEA811CA4D8B2082A0
          20822008DAB5290283A04554421141EEA27D8B70519BE8075A41FF8054142528
          8A12062E5A6416A1080ECE64E3D4CCBBEFBD7B4F8B1AF139445107CEE25C381F
          BEDF73CF5122C2FF446675D17DB1B7BF6D73CB0E11C139471445586B89936453
          D946FD83F76FF7AD05281161E08A7E9C24BEFB53D3B9E0C2F96B38E770CE61AD
          A5582C3231F58E85A5E5CAD4CC87132F07EE3EAB531027FED4B1C339F5E4F33A
          B4D60C8D4F922F14A929C91796E8397D72C39D878F9EDEEC69A6D99422ADD58D
          337DFE7ACD82724E1001AD35470EEE5F51E19CE3E3EC3C43A313E4B676F2BE74
          9CDEBD83D991B78B5781150055EB11516432195E8DBD215F28E2BD4744F0DE93
          6BDFC29E9D5D94E787095480F7B23E35C4D07ABC17B4D61C3D7420A56075EA8C
          A16A5DFD2F84A1435068AD793132CEC26221A5A0B3A3957DBB77A17586D0FA7A
          C05CBE4253F29CE1079398CA57DAC312515826B6DF408470BA81D1B1063A12C7
          7439426B9D0634B76DA7B3B1916C0318D38A31DB30D92CC61800FC2A1B711C33
          32F43A0DE8EACAAD591107AE4AECAAA957AD2030526FC1564A7FB9BC82C8CF4C
          01E2EA977FBF051D28BF985F085A9ACC5F357DAF3A8240C90AC079E99B99AB5C
          96D9F471FD2E940260127E1D532DEE5D521B81E00FFDFEEC2D59AE153F0094A7
          1593B31379C40000002574455874646174653A63726561746500323031302D30
          352D32345430373A33383A30352D30363A303012B2BDFE000000257445587464
          6174653A6D6F6469667900323031302D30352D32345430373A33383A30352D30
          363A303063EF054200000036744558744C6963656E736500687474703A2F2F63
          72656174697665636F6D6D6F6E732E6F72672F6C6963656E7365732F62792D73
          612F332E302F61ECAF510000001974455874536F667477617265007777772E69
          6E6B73636170652E6F72679BEE3C1A0000001674455874536F75726365006563
          686F2D69636F6E2D7468656D65A94CB7530000003474455874536F757263655F
          55524C0068747470733A2F2F6665646F7261686F737465642E6F72672F656368
          6F2D69636F6E2D7468656D652F88322E430000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000467414D410000B18F0BFC6105000000017352474200AECE1CE90000
          00206348524D00007A26000080840000FA00000080E8000075300000EA600000
          3A98000017709CBA513C00000006624B4744000000000000F943BB7F00000009
          7048597300000B1200000B1201D2DD7EFC000000097670416700000010000000
          10005CC6ADC30000025D4944415438CB6D92BD8B545910C57F75EB76CF383DB3
          FDE1F7E8CE282CB3B0D976606062A08191B16060A2602C8291FF80FF801A2F2B
          3BB0060A1B18C88268BA1B08822D18888ECE385F4F18E7F5EB77AB0CDEEB1E05
          0B2EF772A93A9C73EA08C0F2DFF72F8870C7CD0F3B803B8E31D5D8A1DB5AB1F9
          EE8B956E6BF071BAF1399330B5A23AFB581BDD671ADB1F22D5C0DD7367CF1FED
          767A8CCBCA0D2C7FCE30FB57473BFF2FDAE8EDE268E868EC7C013F253AB32C96
          FF1101CAB23CDA697759DF58A34C2566399A5ED1C82E820F01A3F3EB0600DBAF
          F6CFA432FBADC8DFDE9AEB9E5D8B00E68EE394A92459096987606FC04BDA4BEF
          11BC0682CED20A0E64AF1714FC4C0470337048A924A512B19C2019E0F5F96109
          22270380990150A651C52219E64A73F634D9E038884CA6DC211B1C6366AE3F12
          8953612CA10230524A94D6A0B0793CCC0301D1837B5C444094A0ED5D08EB6122
          610CEF60D2A4B07972FF1D44F1B4493658201B2C2012018530F552243C8BDF4A
          101124048228CE1172EFB36FEE36DB83134C772F014EF67A91B5DDCB3E63EB7F
          6A48CF6B804A82AA12248080103116C87D96F8D303926F2140EFC4159E3C7AEA
          EDD6EE3F877A9F3FD41E580D105155627DAB4E238D2324FD8551E833D23E34FB
          7CDA6AF9D3FF9656E3E187F9DE1A0562504C426DBA505D1168025EFDC83E92C1
          EA66CB00261204084191BA51C6AB931A68EC9108668ED7ACE39E044155BF6BAC
          B252B199A4472AD3BD5E7D04881ADF6F6E6D1CEBF50E7CDBFAC3F86D6F6F11A3
          AE0E87C570025014C5D5BF96EFDF2B8AE2E7BDC48D23EC4C9E383136DFA5545E
          BB71FDA6037C051D17258926C357EF0000001D74455874436F6D6D656E740043
          7265617465642077697468205468652047494D50EF64256E0000002574455874
          6372656174652D6461746500323030392D31312D31355432333A30343A30352D
          30373A30302FD9BD4F0000002574455874646174653A63726561746500323031
          302D30322D32305432333A32363A31352D30373A3030063B5C81000000257445
          5874646174653A6D6F6469667900323031302D30312D31315430393A30383A33
          382D30373A303097A4E5C500000034744558744C6963656E736500687474703A
          2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E7365732F47
          504C2F322E302F6C6A06A800000025744558746D6F646966792D646174650032
          3030392D31312D31355432333A30343A30352D30373A30307068CB7B00000017
          74455874536F7572636500474E4F4D452049636F6E205468656D65C1F9266900
          00002074455874536F757263655F55524C00687474703A2F2F6172742E676E6F
          6D652E6F72672F32E491790000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000467414D410000B18F0BFC6105000000017352474200AECE1CE90000
          00206348524D00007A26000080840000FA00000080E8000075300000EA600000
          3A98000017709CBA513C00000006624B4744000000000000F943BB7F00000009
          70485973000006EC000006EC011E753835000000097670416700000010000000
          10005CC6ADC3000002664944415438CB8D935D48D35118C67FE7CCA4C2654EC2
          C8564B08C3A0C2F4C6BCE8462F4202833E8982C832AD2E328205496004094682
          057E145E485F76D1451869CC309428D4C82C25758AAE6DB64CF7A1D3FDB7D385
          CDE614EAB97939EFE1F93D2FE7F00AE6B516D8CE7F2877B75C797B636EB5E69C
          1C222EEE84F8D3CF514A35FFCB1C0CCCE0E9CCE7F97D2BA9AD41A69DCEF698F0
          A5528A1F2E17524AA49408219042801008218010735F8B78D9F285EB2D9203C6
          312DDDA3126464824EA75B00E8C255A7432725016B399D1F3AB8D110CBCECD2E
          4E9F15CEE674792E26122085984F971229C442F58F3DC4F6ED15E69A58D6EBC7
          B955B49AD29AD9CA468BE65834C1A2F470F2C45BDCC38FB950E16785F0507931
          C47452298D16CD038C2E004438310212F4F6A1391E71E5AE8729B7978A42375A
          52315EB903C006CC2C99200C09FAED841CF598EF0CF1B9DFC5CD5393E8371D64
          3C988DC964029805904BDE400894E64639EA29AFEBE5CD7B3BE6A3936CD996C5
          A03F8FE4E4648C46E35F4F244008012A40D056CD83A7DD3C691AA130CF435666
          0ADDBF8E603024929696868AF0C44403A6462D589A5AA96A18253F7B8643B9F1
          3CEBDDCF98BD07FD9A04BABABA58A58F07D09605787D025FC8C4DE5D43941C96
          BCB01EA77FE03B656565180C06BC5E2F974A4A5E031D4B003FC76D4CD8DF91B2
          CE4E6A7E06C3B1FBC8DC93813EB10F83C180CFE7C37CD5DC53575B7B12F0477A
          739452EA5E55A5BA76F998B20DB4AB40604E854221150804545B5B9B72BBDDAA
          F87CF12760EB727B92A3945223D64115AD392DA8DE7FEC5105670A9A810DD1C6
          F0362602E911E76869407BF8EF23F51B99C30AF41B1E2F7D0000002574455874
          6372656174652D6461746500323030392D31312D31355431373A30323A33342D
          30373A3030B6E78E120000002574455874646174653A63726561746500323031
          302D30312D31315430393A32343A33302D30373A303097464A51000000257445
          5874646174653A6D6F6469667900323031302D30312D31315430393A32343A33
          302D30373A3030E61BF2ED00000067744558744C6963656E736500687474703A
          2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E7365732F62
          792D73612F332E302F206F7220687474703A2F2F6372656174697665636F6D6D
          6F6E732E6F72672F6C6963656E7365732F4C47504C2F322E312F5B8F3C630000
          0025744558746D6F646966792D6461746500323030392D30332D31395431303A
          35323A35312D30363A30307F68FD060000001374455874536F75726365004F78
          7967656E2049636F6E73EC18AEE80000002774455874536F757263655F55524C
          00687474703A2F2F7777772E6F787967656E2D69636F6E732E6F72672FEF37AA
          CB0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B4744000000000000F943BB7F0000000970485973000001BB00
          0001BB013AECE3E200000009767041670000001000000010005CC6ADC3000002
          314944415438CB8D93CF4B545118869F73EEBDA13341D8621A2B6CD44D0481D1
          22A43FC29D5A410B5D89EEDA1715811696B56DD14E8AB08DE0BE1F6051102151
          0DC98493E0627046EF8C77E6CE39E76B617373CCA00F5ECEE29CF7F9DEF31D8E
          121194521D40967FD4189C3E1304F7CE0D0EF6A541FD585E7EF3ADD9BC715D64
          59FD06E4CAE54AC11883D21AAD144A2BB45294575678373CCCC0C404412A0580
          A9D5787BFF7EA42A950BBAD5C55883B1066B2DD6599C7358E7783535C5D19EE3
          745F1925DC59A752F9C9B14BA374F7F7776EC263BF05D05AE3791E3A49A0891B
          0D1A5FBF90CA34793F3BC9C53BF328052FAF5D46D63E92569CD57B01893C0F4F
          6B6AB51A479466C773886F505A400BA91386AE1E475AE3FD0128D50ED19A8ECE
          4EA4B797EAB6CFF9C959F24F46585F1C61607C96CDAA4F68292443DC0EC38273
          2EB9420BF2616181CDF13154CA72B8DF90EE8530EF53FD6CEAF34DAE260994DA
          9DFAFE2403434304730F315DA7D8FA7488D252073B95933C6872EB192C2509AA
          D56A41006F8F59290580738E52A944B158042097CB91CD66FB44A490BC82D21A
          B50B4B8CAD64BEEF93CD66C9643238E70882004000FCBD075BEB416A958810D5
          EB02B876C0AEFB40104014456C6C6CE007012F16179F8BC85A42047251144914
          4512C7B1349B4D31C688B5569C7312C7B1E4F37989E386DC9E99792D22B4D406
          A8D7EB0702C23094EFABAB72737ABACDDC0668341A7F99ADB5222252AE6CB9BB
          738F9EEE378B08EA7FBE336045A478D0C62FBF8E63FB3D4872C7000000257445
          58746372656174652D6461746500323030392D31312D31355431373A30323A33
          342D30373A3030B6E78E120000002574455874646174653A6372656174650032
          3031302D30322D32305432333A32363A31352D30373A3030063B5C8100000025
          74455874646174653A6D6F6469667900323031302D30312D31315430393A3234
          3A33352D30373A3030B423DD4A00000067744558744C6963656E736500687474
          703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E736573
          2F62792D73612F332E302F206F7220687474703A2F2F6372656174697665636F
          6D6D6F6E732E6F72672F6C6963656E7365732F4C47504C2F322E312F5B8F3C63
          00000025744558746D6F646966792D6461746500323030392D30362D30335430
          393A35383A31332D30363A30302C9A65570000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A0000001374455874536F
          75726365004F787967656E2049636F6E73EC18AEE80000002774455874536F75
          7263655F55524C00687474703A2F2F7777772E6F787967656E2D69636F6E732E
          6F72672FEF37AACB0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B4744000000000000F943BB7F000000097048597300000DD700
          000DD70142289B7800000009767041670000001000000010005CC6ADC3000002
          A64944415438CB95934B6855071086BF390F93EB7D44AE9B58AAADC6487A0D82
          62638546855B122D7425A2820B3122E8425014A3A262C14241DB45218B802F74
          DB166ADA425002B62A882821268B52210F215A9398E43CEEBDE7352E5A13030A
          756036C33F3FDFFC30B2E554FE6C10862754D5E23D4A44A279B6FD8D14DBB3E1
          9543F7AD5CF5A2778A9B8B2DFC71AB7BCE6CBA3CCAEEEF9B224B55AD450BEB39
          FFDDB76F5D3E72F81800E97466CE3C9DAE47552D8AEDD970DC19D22449DEABC7
          9D212DB66743693DB9E06C92703A4EA219F74C2A43CBFA35280900869874DF7B
          88E33B331A434C4C53BEB678B0EECC91A3074FB714BF1C1E1C1CBC23223BF775
          AEC6D06ACAE134A0A4ABB238BE43C79E074C8C4F90C964B87AED328F1F0D9C79
          33F9D4D1EB5F6C9B709F939B9FC3325204E118A064ABABA8492FE0C0A5B5E452
          79CE6DFB1DCF7301B0007CDF07B05F7AFF587BB6ECC5326D9E4FFE45105400F0
          4B0EDB37ED20D6848BBF752222789EFFEF29009EEBA1AAF68AFC7A6EDCB9C1C4
          D40B4CAA89C298288810B598745ED275B78BE5F9B588086118CE12B89E07607D
          FEE12E9CAA41BAEE77F0D9274D7C902FA0AA4C7A2EDDFDBFF2D59AFDD4D73463
          180622326BF01F8155B7AC9E65759B59B9B4890BBFECE3E3DAC598A6C9DF4F9F
          707CEB150A4BD6D1DBDB8B65593306C66B02553541181E1AA6AE76151D07FEC4
          346AA804263FECBFCD470B1B19181800C0B66D0CC3982528974AC4714C5F5F1F
          8D8D8D8C8C8C2022ECFAF41CA9548AB864E096A6B16D9BFEFE7E0A85024992CC
          1A049580B1F131DADADA88E3181141446644AA4A1CC7445144434303A3A3A373
          439C729C673FFFF4636DF3868DF4F4F4E0BA2EE572854A1810274AC92FE1FA3E
          BEE793A812860155B63E0190D6D65672B9F99B31A41364F1FF79E52449864C31
          F64E4DB9375F011F305BD50C8149070000002574455874646174653A63726561
          746500323031302D30312D31315430393A31323A34322D30373A30309EE04427
          0000002574455874646174653A6D6F6469667900323031302D30312D31315430
          393A31323A34322D30373A3030EFBDFC9B00000034744558744C6963656E7365
          00687474703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C696365
          6E7365732F47504C2F322E302F6C6A06A80000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A0000001374455874536F
          7572636500474E4F4D452D436F6C6F7273AA9944E20000003174455874536F75
          7263655F55524C00687474703A2F2F636F64652E676F6F676C652E636F6D2F70
          2F676E6F6D652D636F6C6F72732F501DB5EB0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B4744000000000000F943BB7F000000097048597300000DD700
          000DD70142289B7800000009767041670000001000000010005CC6ADC3000003
          334944415438CB5593CD6B545700C5CFBD77DECCCB7D354EF3313136D31A7D82
          B398CC7464141A3364E322DB423FA0107053BA11172392951126EE827F831BA1
          50ECCE8D12D141500249336394B604343126A324F1BD69DFD77DEFDEDB4534D5
          B33EFCE070CE215A6B7CAC66A96413422ED0546A5229550400CA585BC5F103AD
          F5CD5AABB5F6B19F7C00344B254A28ADD34CE6EAD0F838EFC9E7A979E4080020
          EC7410BC7A253B8F1E455A8859ADD48D5AABA50E00CD528952C69A9F8D8E96BF
          989AB21004908E03E5FB00006A594865B3D0A689CD3B777C6F7DFD0F2565ADD6
          6A290A0084D2BA95CF9747CE9FB7F6DA6DFCF5F831A2AD2D48D785EC7611BD7E
          8D3F9F3CC1DEEA2ABE9C9AE27C64E46B42691D00E8C3B1319B307675F8DC392B
          7CF60C712E8793972E61C37120C3103208B0E1BA3879F122E2C14184ABAB383A
          31C10963B30FC7C66C363D3050EF2F16270DC3A0627B1BF9E9697C7EE60CF8E8
          28D6EEDF872B040A57AE2057ADC2B22CB80B0B20A609A4D3CCDFDAF2D8747F7F
          237BEAD457DA7591F83EFE5D5C8469DBC8562AE0B68DC18909E44E9F86B7B282
          EDF9794821A092048473DA7DF18251294491992622C7811402B1E7617D6E0EBB
          CBCBC8552AC8552AD85D5EC6FADC1C62CF43220484E320D5D303294431259304
          320890441190245000B68300FD521E749D488975D7C551C640F6AB030D02C824
          01D54AB5BD4E079A52244260330C516E343054ADA2BBB484EED21286AA55941B
          0D6C86E17E04005EA703AD549B7D6F9AC7A9617C93E9EDA571B78BE2F5EB181A
          1F87BBB888B59919ECDDBB07AB50C0C0D9B3E83B71027B77EF821E3A847F3A9D
          C4DFD9B9C57E48A73722C7F9990F0F1B4A0848C701E31C7FCFCC2009024821B0
          BBB0006EDB787BFB36C2376FA00D033B4F9F862A497E215A6BFC7EF8F0E5746F
          EFB5C142C14A5C172A8ADE0F9DFC3F7AAD41331918D92CDE3E7FEE896EF7DAB7
          AE3B4FB4D6F88D734A286D1A9C97B3C78E59446BA82882566A9FC3186826030D
          C079F9D28B7D7F452B55FBCEF7D5C1997E4DA72921A40E4266795F9F99324D66
          700E688D380C11FB7E12BC7B27B4D6B3D0FAC68F42A84FDEF841B728B5015C20
          944E42EBE2FB286DADD40300377F52EA933BFF07F708A0516FED502B00000025
          74455874646174653A63726561746500323031302D30312D31315430393A3132
          3A34332D30373A303038974F930000002574455874646174653A6D6F64696679
          00323031302D30312D31315430393A31323A34332D30373A303049CAF72F0000
          0034744558744C6963656E736500687474703A2F2F6372656174697665636F6D
          6D6F6E732E6F72672F6C6963656E7365732F47504C2F322E302F6C6A06A80000
          001974455874536F667477617265007777772E696E6B73636170652E6F72679B
          EE3C1A0000001374455874536F7572636500474E4F4D452D436F6C6F7273AA99
          44E20000003174455874536F757263655F55524C00687474703A2F2F636F6465
          2E676F6F676C652E636F6D2F702F676E6F6D652D636F6C6F72732F501DB5EB00
          00000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B4744000000000000F943BB7F000000097048597300000DD700
          000DD70142289B7800000009767041670000001000000010005CC6ADC3000001
          314944415438CBA552BB4A4341103D6777EE6E8201B51144D304AD4D616BA3A5
          1F601A0BFF22901FD01F08881F612B0882B511FC008D5153A851D480A2E6DE3B
          1637D1083E729303C30EB39C33C399A1AA62149891D800040096374FDF0104FD
          1F81652D8EE2B5FDF27CFD2F01AA2A56B6CEC28DA5096BD9AD2A70D27C0B8FCF
          5F106BD2E4271C94E7280040008476B3E429E6BD14F3FED7CE3B870F5F1EE827
          734813154A33A48694AA0D4F0526738234831040A9DAF05CDFBE885331BF43C5
          09B958188758A4D2092345ADFE44E384C8652CA006BD7DFC1744C27142881783
          8CB3109BEEA4C5125E0CC4070C7D40C9BA74571DA9C2070C25EBCCDEF5E3EB6A
          616A8C6207F3A01329EA37CF71D6995D69DFDF56DA779D99ABD6F402C001C7D0
          A8DDBA3C524AA5E7CC6C9F4B032974A3F901E10B5883B4009F7E000000257445
          58746372656174652D6461746500323030392D31312D31355431373A30323A33
          342D30373A3030B6E78E120000002574455874646174653A6372656174650032
          3031302D30312D31315430393A32343A34302D30373A30309D83434800000025
          74455874646174653A6D6F6469667900323031302D30312D31315430393A3234
          3A34302D30373A3030ECDEFBF400000067744558744C6963656E736500687474
          703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E736573
          2F62792D73612F332E302F206F7220687474703A2F2F6372656174697665636F
          6D6D6F6E732E6F72672F6C6963656E7365732F4C47504C2F322E312F5B8F3C63
          00000025744558746D6F646966792D6461746500323030392D30332D31395431
          303A35323A35302D30363A3030D91FF6B20000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A0000001374455874536F
          75726365004F787967656E2049636F6E73EC18AEE80000002774455874536F75
          7263655F55524C00687474703A2F2F7777772E6F787967656E2D69636F6E732E
          6F72672FEF37AACB0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B4744000000000000F943BB7F000000097048597300000DD700
          000DD70142289B7800000009767041670000001000000010005CC6ADC3000001
          F24944415438CBB5524D4F1351143D6FDE3386C56C6C74628AFF03DB15502134
          C60D22448D7161F407184869C36432CDD84EF9177C281A03A43425B66C5B4914
          D47F40C34CA0633A219DC58CE99B79AECACAE024C6BB3A8B7BEEBDE79C4B10B3
          CA15430C716EA94086588A43364D43B22C1B2F5FBC8265D9304D23160F00505A
          2D9289C9F1A8EFF5451445A2EFF5C5C4E478545A2D1200205791CB154358960D
          A358C2C14193B73FB744EA6E9A6432F758616519A3A3C9BF4BD0351DB22CA37D
          D8C2AD9B89EBEDC316645986AEE9F13C5035159EE721359686F3B3F72B359686
          E7795035F53F78F0A7A81E2D3C144208288A025DD3A16A2ABADD2E0821F8B0F5
          915C0E304D433AB5ED70D8742799A45F8F8FC37CAE8044E206DE6E6D5E2E7ABC
          F004BD9E8B3765E3EA33E7E667A34EE744044120381F08DFF705E703110481E8
          744EC4DCFC6C24952B86B04FCFA29DED5DD26C34F8E2D2EB41B3D1E03BDBBB44
          5114F2EEFD2628A558DF58F39F3D7F1AAD6FACF994521C1D7D1950463F4971A2
          E29CA3BE5F1F4124B1FA7E7D84730E45B97D2DE461568A1315630CD999AC0F29
          E2D999ACCF1843B77B36A08CD6FFDD0300585E5C11D353199A2FE47071E1225F
          C8617A2A430110D775E138E7D8AB55F9F71FDFC2BD5A953BCE395CD7050012FB
          0F2863B590F30794B16AC8F97D42082410E9373F175E0B1805EC5C0000002574
          4558746372656174652D6461746500323030392D31312D31355432333A30343A
          30362D30373A30301E31A7D20000002574455874646174653A63726561746500
          323031302D30322D32305432333A32363A31382D30373A303067EC3D41000000
          2574455874646174653A6D6F6469667900323031302D30312D31315430393A30
          383A33392D30373A303031D3EE7100000034744558744C6963656E7365006874
          74703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E7365
          732F47504C2F322E302F6C6A06A800000025744558746D6F646966792D646174
          6500323030392D31312D31355432333A30343A30362D30373A30304180D1E600
          00001774455874536F7572636500474E4F4D452049636F6E205468656D65C1F9
          26690000002074455874536F757263655F55524C00687474703A2F2F6172742E
          676E6F6D652E6F72672F32E491790000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000467414D410000AFC837058AE900000006624B4744000000000000F9
          43BB7F000000097048597300000048000000480046C96B3E0000000976704167
          0000001000000010005CC6ADC3000002F34944415438CB95925F6C13051CC73F
          77BD2EB4EBD5B5B796D56E75DDA86E0A82219249308A48B2F8E01309F8623613
          3521ECC1181360C12D803023C617E4C1BF0FB89819FC932C3C00119D906561FF
          0854DCBA966CCDD6ED9AC27A2D65DDDDF5CE070931C4887E5F7FF97EF24BBE1F
          C1B66D1E9613978F97CC8A19DAFFC2A1C28337F161E58F2E7D50AA71D7B82DCB
          D27ACE1FF4FE2FC087BF1D2DD554D7B8EB030D28B2826559DA7B83EF78FF13A0
          6FE848C957ED7337042214F53C914003C14702D8B6A5ED3BF3B6F75F01C77F3D
          5CF2797CEE48A081C2AA46D92C3314BF4453A899903F8465DBDA1BFDAF7BFF11
          70EC97DE7BE508D7D371929914966DD1D21C43D3F33C5E1FA3CE5787611A4B00
          C2DF57387AB1E7AE222BAEC660234F282D845D117E8C7F4F2A9F201A8A223B65
          26529324E667CCFE8E01E7FD0F4E5EF92476E4E7F775BFC7EF6A0C3E463C1D27
          EC8AF0F5F057B4459EC3214A789C1EC69393241752384487B4E7CB5D1280A3F6
          15EFA1E542FE07BFEC7734D54529E80572C51C6A41E5C5D876BEB9729AF5D127
          999899642693A4ABBD8BEC9D2CEAB2EAD8BDF9B58B42EF856E5B91159AD64629
          1805CA95156CDB6621BB882448B4D6B7329E9CE0F6D2026B56A07857A36CAC90
          6715C355E577BCDCF15274D558DD04E0AFF6313A354EAD4F41F12A847D61C666
          2628E6546A5D225B376F61C7B3ED94A52CEAAD69D4D94C5844E0806999CCAAB3
          CCE7E679FEA96D38C52A64A7CC58621CF5CE125A26C3A6968D54C40A1B433BA9
          08066D1BB66219FA2EB17B7BEFA26EE85FAC0BC6482EDE644E4D233BBD8C4E8F
          313D9F2058BD969C96C5297878B5B50B8077777C4673F069803522806EEA27E6
          6ECF56DAD7B7935848309A18E5467ACA1605F1DC547AAAFB96962DFF9E19A6EF
          42E75F969EEF2495BD0650BE07306E2E2DAB83DF8D0C580E51E2C6DC1FA65392
          B6181563EF99B77E3A66D9D6C723D786A94262F0FA29AA0489CB5787003EBD2F
          D29BDF763E6398C6E746C5E8E9EF1838FBA0A16DFB1EED03F6023250044E8D9C
          CCECFF139ABB499118D0060000000025744558746372656174652D6461746500
          323030392D31312D31365432323A31383A31372D30373A30305B00FEC1000000
          2574455874646174653A63726561746500323031302D30312D31315430363A35
          333A30362D30373A3030968EA3470000002574455874646174653A6D6F646966
          7900323031302D30312D31315430363A35333A30362D30373A3030E7D31BFB00
          000062744558744C6963656E736500687474703A2F2F6372656174697665636F
          6D6D6F6E732E6F72672F6C6963656E7365732F62792F332E302F206F72206874
          74703A2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E7365
          732F62792F322E352F8B863C6500000025744558746D6F646966792D64617465
          00323030362D30332D31325432313A35343A34342D30373A303073EE0ABE0000
          001974455874536F6674776172650041646F626520496D616765526561647971
          C9653C0000001B74455874536F757263650046414D46414D46414D2053696C6B
          2049636F6E73827A64FB0000003374455874536F757263655F55524C00687474
          703A2F2F7777772E66616D66616D66616D2E636F6D2F6C61622F69636F6E732F
          73696C6B2FC2C40D0D0000000049454E44AE426082}
      end>
    Left = 352
    Top = 400
    Bitmap = {}
  end
  object sSkinManager1: TsSkinManager
    Active = False
    InternalSkins = <>
    MenuSupport.IcoLineSkin = 'ICOLINE'
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'Tahoma'
    MenuSupport.ExtraLineFont.Style = []
    SkinDirectory = 'C:\delphi\alphaskin\acnt_regdelphixe4\Skins'
    SkinName = 'Subway (internal)'
    SkinInfo = 'N/A'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    Left = 120
    Top = 352
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 184
    Top = 352
  end
  object UpdateThread: TJvThread
    Exclusive = True
    MaxCount = 0
    RunOnCreate = True
    FreeOnTerminate = True
    OnExecute = UpdateThreadExecute
    Left = 496
    Top = 296
  end
  object UpdateDownloader: TJvHttpUrlGrabber
    FileName = 'output.txt'
    OutputMode = omStream
    Agent = 'JEDI-VCL'
    Port = 0
    ProxyAddresses = 'proxyserver'
    ProxyIgnoreList = '<local>'
    OnDoneStream = UpdateDownloaderDoneStream
    Left = 576
    Top = 288
  end
  object DragDrop: TJvDragDrop
    DropTarget = Owner
    OnDrop = DragDropDrop
    Left = 576
    Top = 344
  end
end
