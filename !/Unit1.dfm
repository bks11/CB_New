object Form1: TForm1
  Left = 604
  Top = 80
  Width = 517
  Height = 423
  Caption = #1047#1072#1081#1095#1077#1085#1082#1086' '#1050'.'#1052'. '#1052#1086#1076#1091#1083#1100' '#1088#1072#1073#1086#1090#1099' '#1089' '#1092#1072#1081#1083#1072#1084#1080' '#1062#1041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 220
    Top = 0
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 24
    Width = 505
    Height = 361
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1095#1090#1072
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 305
        Height = 177
        ActivePage = TabSheet6
        TabOrder = 0
        object TabSheet6: TTabSheet
          Caption = '311'
          ImageIndex = 1
          object ListBox1: TListBox
            Left = 0
            Top = 8
            Width = 289
            Height = 137
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object TabSheet2: TTabSheet
          Caption = '365'
          ImageIndex = 1
          object ListBox4: TListBox
            Left = 0
            Top = 0
            Width = 289
            Height = 145
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object TabSheet3: TTabSheet
          Caption = '364'
          ImageIndex = 2
          object ListBox5: TListBox
            Left = 0
            Top = 0
            Width = 297
            Height = 145
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object TabSheet4: TTabSheet
          Caption = '406'
          ImageIndex = 3
          object ListBox6: TListBox
            Left = 0
            Top = 0
            Width = 297
            Height = 145
            ItemHeight = 13
            TabOrder = 0
          end
        end
      end
      object ListBox2: TListBox
        Left = 312
        Top = 24
        Width = 177
        Height = 289
        ItemHeight = 13
        TabOrder = 1
      end
      object ListBox3: TListBox
        Left = 0
        Top = 184
        Width = 305
        Height = 129
        ItemHeight = 13
        TabOrder = 2
      end
    end
  end
  object Button1: TButton
    Left = 432
    Top = 0
    Width = 75
    Height = 25
    Caption = #1042#1082#1083#1102#1095#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Table1: TTable
    DatabaseName = 'CB'
    TableName = 'Ini'
    Left = 272
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 476
    Top = 32
  end
  object Query1: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'select * from ActUser')
    Left = 304
  end
end
