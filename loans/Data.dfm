object DMData: TDMData
  OldCreateOrder = False
  Height = 789
  Width = 1033
  object conCredittDB: TADConnection
    Params.Strings = (
      'Database=CREDIT_DB'
      'User_Name=postgres'
      'Password=postgres'
      'Server=10.3.0.219'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 258
    Top = 8
  end
  object qrAny: TADQuery
    Active = True
    Connection = conCredittDB
    SQL.Strings = (
      'Select "ID_LOAN", "AGREEMENT_NUM" from "TLOAN"')
    Left = 32
    Top = 80
    object qrAnyID_LOAN: TLargeintField
      FieldName = 'ID_LOAN'
      Origin = '"ID_LOAN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrAnyAGREEMENT_NUM: TStringField
      FieldName = 'AGREEMENT_NUM'
      Origin = '"AGREEMENT_NUM"'
      Size = 75
    end
  end
  object dsAny: TDataSource
    DataSet = qrAny
    Left = 73
    Top = 80
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 137
    Top = 8
  end
end
