object dmData: TdmData
  OldCreateOrder = False
  Height = 537
  Width = 714
  object conLoan: TADConnection
    Params.Strings = (
      'Database=CREDIT_DB'
      'User_Name=postgres'
      'Password=postgres'
      'Server=10.3.0.219'
      'DriverID=PG')
    LoginPrompt = False
    Left = 128
    Top = 8
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 310
    Top = 8
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 210
    Top = 8
  end
  object ADQueryLoadVersion: TADQuery
    Connection = conLoan
    SQL.Strings = (
      'SELECT "VERSION_INFO"'
      '  FROM "VERSION_INFO";')
    Left = 128
    Top = 56
  end
  object ADQueryLoadPath: TADQuery
    Connection = conLoan
    SQL.Strings = (
      'SELECT '
      '  "REPORT_PATH"."REPORT_PATH", "REPORT_PATH"."NOTE"'
      'FROM '
      '  public."REPORT_PATH", '
      '  public."USER_REPORTS", '
      '  public."USERS"'
      'WHERE '
      '  "USER_REPORTS"."ID_REPORT" = "REPORT_PATH"."ID_REPORT" AND'
      '  "USERS"."ID_USER" = "USER_REPORTS"."ID_USER" and'
      '  "USERS"."USER_LOGIN" = :USER_LOGIN'
      
        'Order by "REPORT_PATH"."ID_REPORT" , "REPORT_PATH"."ID_REPORT_PA' +
        'TH";')
    Left = 128
    Top = 104
    ParamData = <
      item
        Name = 'USER_LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = 'k.zaichenko'
      end>
  end
  object qrGetVersion: TADQuery
    Connection = conLoan
    SQL.Strings = (
      'SELECT DISTINCT '
      '  * '
      'FROM '
      '  "TCONFIG" '
      'WHERE '
      '  "IS_RELEASE" = TRUE '
      'ORDER BY  '
      ' "RELEASE_DATE" '
      'ASC')
    Left = 64
    Top = 216
  end
end
