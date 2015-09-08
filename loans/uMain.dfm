object fmMain: TfmMain
  Left = 560
  Top = 251
  BorderStyle = bsDialog
  Caption = #1047#1072#1075#1088#1091#1079#1095#1080#1082' '#1089#1080#1089#1090#1077#1084#1099
  ClientHeight = 155
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbIPServer: TLabel
    Left = 24
    Top = 22
    Width = 98
    Height = 13
    Caption = 'IP '#1040#1044#1056#1045#1057' '#1057#1045#1056#1042#1045#1056#1040':'
  end
  object btnSave: TButton
    Left = 187
    Top = 64
    Width = 112
    Height = 25
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
    TabOrder = 0
    OnClick = btnSaveClick
  end
  object edIP: TEdit
    Left = 154
    Top = 19
    Width = 145
    Height = 21
    TabOrder = 1
  end
end
