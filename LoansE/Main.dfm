object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1048#1052#1055#1054#1056#1058' '#1044#1040#1053#1053#1067#1061
  ClientHeight = 254
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnOpenDialog: TSpeedButton
    Left = 581
    Top = 17
    Width = 23
    Height = 22
    Caption = '...'
    Flat = True
    OnClick = btnOpenDialogClick
  end
  object lbServer: TLabel
    Left = 575
    Top = 88
    Width = 41
    Height = 13
    Caption = #1057#1077#1088#1074#1077#1088':'
  end
  object btnLoad: TButton
    Left = 581
    Top = 188
    Width = 75
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 0
    OnClick = btnLoadClick
  end
  object edPath: TEdit
    Left = 14
    Top = 18
    Width = 553
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 1
  end
  object memLog: TMemo
    Left = 18
    Top = 48
    Width = 549
    Height = 165
    TabOrder = 2
  end
  object edServer: TEdit
    Left = 575
    Top = 106
    Width = 85
    Height = 21
    TabOrder = 3
    Text = '10.3.0.219'
  end
  object btnConnect: TButton
    Left = 581
    Top = 160
    Width = 75
    Height = 25
    Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077
    TabOrder = 4
    OnClick = btnConnectClick
  end
  object sbInfo: TStatusBar
    Left = 0
    Top = 235
    Width = 668
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object dlgOpen: TOpenDialog
    Filter = 'Excel|*.xls|Excel New|*.xlsx'
    Title = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
    Left = 386
    Top = 12
  end
end
