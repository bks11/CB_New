object fmLogin: TfmLogin
  Left = 343
  Top = 309
  BorderStyle = bsDialog
  Caption = #1042#1061#1054#1044' '#1042' '#1057#1048#1057#1058#1045#1052#1059
  ClientHeight = 195
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbUserPassword: TLabel
    Left = 24
    Top = 80
    Width = 41
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object lbUserName: TLabel
    Left = 24
    Top = 32
    Width = 101
    Height = 13
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103'.:'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 176
    Width = 443
    Height = 19
    Panels = <>
    ExplicitLeft = 224
    ExplicitTop = 168
    ExplicitWidth = 0
  end
  object edUserLogin: TEdit
    Left = 160
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edUserLogin'
  end
  object edUserPassword: TEdit
    Left = 160
    Top = 80
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = 'edUserPassword'
  end
  object Button1: TButton
    Left = 88
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 264
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
  end
end
