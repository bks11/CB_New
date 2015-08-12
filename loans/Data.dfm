object DMData: TDMData
  OldCreateOrder = False
  Height = 276
  Width = 350
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=CREDIT_DB'
      'User_Name=postgres'
      'Password=postgres'
      'Server=10.3.0.219'
      'DriverID=PG')
    Connected = True
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 64
  end
  object QueryAny: TADQuery
    Active = True
    Connection = ADConnection1
    SQL.Strings = (
      'Select "ID_LOAN", "AGREEMENT_NUM" from "TLOAN"')
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = QueryAny
    Left = 32
    Top = 32
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 32
  end
end
