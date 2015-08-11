object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 341
  ClientWidth = 491
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
    Width = 491
    Height = 201
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    HostName = 'localhost'
    Port = 5433
    Database = 'CREDIT_DB'
    Protocol = 'postgresql-9'
    LibraryLocation = 'C:\Windows\SysWOW64\libpq.dll'
    Left = 224
    Top = 144
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Postg' +
      'reSQL35W;'
    Provider = 'MSDASQL.1'
    Left = 24
    Top = 24
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    TableName = 'TUSERS'
    Left = 104
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT "ID_USER", "FIRSTNAME", "MIDDLENAME", "LASTNAME", "USERRI' +
        'GHTS", '
      '       "NOTE"'
      '  FROM "TUSERS";')
    Left = 104
    Top = 56
    object ADOQuery1ID_USER: TLargeintField
      FieldName = 'ID_USER'
    end
    object ADOQuery1FIRSTNAME: TWideStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object ADOQuery1MIDDLENAME: TWideStringField
      FieldName = 'MIDDLENAME'
      Size = 50
    end
    object ADOQuery1LASTNAME: TWideStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object ADOQuery1USERRIGHTS: TWideStringField
      FieldName = 'USERRIGHTS'
      Size = 4
    end
    object ADOQuery1NOTE: TWideStringField
      FieldName = 'NOTE'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = ADTable1
    Left = 344
    Top = 248
  end
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=CREDIT_DB'
      'User_Name=postgres'
      'Password=postgres'
      'Port=5433'
      'Server=CRSIMFIT08'
      'DriverID=PG')
    Connected = True
    Left = 200
    Top = 248
  end
  object ADTable1: TADTable
    Active = True
    Connection = ADConnection1
    UpdateOptions.UpdateTableName = '"TUSERS"'
    TableName = '"TUSERS"'
    Left = 280
    Top = 248
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 392
    Top = 248
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 424
    Top = 248
  end
end
