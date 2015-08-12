object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'PGTest'
  ClientHeight = 367
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 575
    Height = 217
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=CREDIT_DB'
      'User_Name=postgres'
      'Password=postgres'
      'CharacterSet=WIN1251'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 216
    Top = 120
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 256
    Top = 120
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 288
    Top = 120
  end
  object ADTable1: TADTable
    Active = True
    Connection = ADConnection1
    UpdateOptions.UpdateTableName = '"TUSERS"'
    TableName = '"TUSERS"'
    Left = 328
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ADTable1
    Left = 152
    Top = 232
  end
  object ADConnection2: TADConnection
    Params.Strings = (
      'Database=vsdesk'
      'User_Name=mysqladm'
      'Password=Simf0000'
      'Server=10.3.0.231'
      'MonitorBy=Custom'
      'DriverID=MySQL')
    Left = 40
    Top = 224
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    Left = 72
    Top = 224
  end
  object ADQuery1: TADQuery
    Connection = ADConnection2
    Left = 112
    Top = 224
  end
end
