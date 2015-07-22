object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1062#1041
  ClientHeight = 600
  ClientWidth = 972
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
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 956
    Height = 584
    ActivePage = TabSheet3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1042#1077#1088#1073#1072
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TabSheet2: TTabSheet
      Caption = #1050#1088#1091#1090#1080#1083#1082#1072
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TabSheet3: TTabSheet
      Caption = '311'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Panel1: TPanel
        Left = 3
        Top = 0
        Width = 454
        Height = 553
        TabOrder = 0
        object CheckListBox1: TCheckListBox
          Left = 0
          Top = 40
          Width = 449
          Height = 505
          ItemHeight = 13
          Items.Strings = (
            '1'
            '2'
            '3')
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 8
          Top = 9
          Width = 89
          Height = 25
          Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
          TabOrder = 1
        end
        object BitBtn2: TBitBtn
          Left = 103
          Top = 9
          Width = 75
          Height = 25
          Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
          TabOrder = 2
        end
        object BitBtn3: TBitBtn
          Left = 184
          Top = 9
          Width = 89
          Height = 25
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1062#1041
          TabOrder = 3
        end
        object ComboBox1: TComboBox
          Left = 279
          Top = 13
          Width = 162
          Height = 21
          ItemHeight = 13
          TabOrder = 4
        end
      end
    end
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbxmys30.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=10.3.0.231'
      'Database=CB'
      'USER_NAME=mysqladm'
      'Password=Simf0000'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False')
    VendorLib = 'LIBMYSQL.dll'
    Connected = True
    Left = 936
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select path, id from Path_311')
    SQLConnection = SQLConnection1
    Left = 904
  end
end
