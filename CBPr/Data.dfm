object dmData: TdmData
  OldCreateOrder = False
  Height = 362
  Width = 534
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    HostName = '10.3.0.231'
    Port = 3306
    Database = 
      'C:\Program Files (x86)\MySQL\Samples and Examples 5.6\Sample Dat' +
      'abases\World\world-schema.sql'
    User = 'mysqladm'
    Password = 'Simf0000'
    LibraryLocation = 'D:\Projects\CB\libmysql.dll'
    Left = 120
    Top = 64
  end
  object ADConnection1: TADConnection
    ConnectionName = 'CBConnection'
    Params.Strings = (
      'Server=10.3.0.231'
      'User_Name=mysqladm'
      'Password=Simf0000'
      'Database=CB'
      'DriverID=MySQL')
    Connected = True
    Left = 200
    Top = 136
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    Left = 312
    Top = 232
  end
  object ADTable1: TADTable
    Active = True
    Connection = ADConnection1
    UpdateOptions.UpdateTableName = 'CB.Path_311'
    TableName = 'CB.Path_311'
    Left = 320
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = ADTable1
    Left = 384
    Top = 152
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 448
    Top = 240
  end
end
