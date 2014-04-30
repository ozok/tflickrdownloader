object WarningForm: TWarningForm
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'Warning'
  ClientHeight = 182
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    645
    182)
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 0
    Top = 0
    Width = 645
    Height = 89
    Align = alTop
    AutoSize = False
    Caption = 
      'Please note that photos you are about to download maybe copyrigh' +
      'ted material. Author of this tool cannot be held '#13#10'responsible f' +
      'or any copyright violations or other illegal activites comitted ' +
      'using this tool. '#13#10#13#10'Use this tool at your own risk!'#13#10#13#10'Show res' +
      'pect to photo authors and their privacy!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 562
    Top = 149
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Continue'
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
    ExplicitTop = 113
  end
  object Button2: TButton
    Left = 481
    Top = 149
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
    ExplicitTop = 113
  end
  object OKRDBtn: TRadioButton
    Left = 8
    Top = 104
    Width = 113
    Height = 17
    Caption = 'I understand'
    TabOrder = 3
    OnClick = OKRDBtnClick
  end
  object NORDBtn: TRadioButton
    Left = 8
    Top = 127
    Width = 113
    Height = 17
    Caption = 'I do not understand'
    Checked = True
    TabOrder = 4
    TabStop = True
    OnClick = NORDBtnClick
  end
end
