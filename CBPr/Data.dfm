object dmData: TdmData
  OldCreateOrder = False
  Height = 362
  Width = 534
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 8
    Top = 8
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 40
    Top = 8
  end
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=CB_DB'
      'User_Name=postgres'
      'Password=postgres'
      'Server=10.3.0.219'
      'DriverID=PG')
    Left = 72
    Top = 8
  end
  object ADQueryLoadDostup: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT '
      '  "USER_REPORTS"."ID_REPORT", '
      '  "USERS"."ID_USER"'
      'FROM '
      '  public."USERS", '
      '  public."USER_REPORTS"'
      'WHERE '
      '  "USER_REPORTS"."ID_USER" = "USERS"."ID_USER" and '
      ' "USERS"."USER_LOGIN"=:USER_LOGIN;')
    Left = 8
    Top = 56
    ParamData = <
      item
        Name = 'USER_LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQuery311PLoadPath: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT '
      '  "REPORT_PATH"."REPORT_PATH", '
      '  "REPORT_PATH"."NOTE"'
      'FROM '
      '  public."REPORT_PATH"'
      'Where "REPORT_PATH"."ID_REPORT"=:ID_REPORT;')
    Left = 496
    Top = 8
    ParamData = <
      item
        Name = 'ID_REPORT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
