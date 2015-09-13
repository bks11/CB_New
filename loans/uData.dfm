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
