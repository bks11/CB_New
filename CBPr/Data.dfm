object dmData: TdmData
  OldCreateOrder = False
  Height = 671
  Width = 761
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
    Connected = True
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
  object ADQuery311ProvOutFile: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "ID_REP311"'
      'FROM "REP311"'
      'Where "FILENAME"=:FILENAME;')
    Left = 496
    Top = 56
    ParamData = <
      item
        Name = 'FILENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQuery311LoadData: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'INSERT INTO "REP311"('
      
        '"FILENAME","CLIENT_NAME", "ACC_NUM", "ID_USER", "DATE_SEND", "IS' +
        '_SIGN", "IS_CRYPT", "CB_GET", "PENS_ANSWER", "NAL_ANSWER", "SOC_' +
        'ANSWER", "ID_USER_SIGN", "ID_USER_CRYPT", "SCHEME", "ARCH_NAME")'
      
        'VALUES (:FILENAME,:CLIENT_NAME,:ACC_NUM,:ID_USER, current_timest' +
        'amp, False, False, False, False, False, False, 0, 0, :SCHEME, '#39' ' +
        #39');')
    Left = 496
    Top = 104
    ParamData = <
      item
        Name = 'FILENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CLIENT_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ACC_NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_USER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SCHEME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryLoadArhCounFromDate: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'Select Count(ARCH_NAME) AS Col'
      'FROM (SELECT DISTINCT "ARCH_NAME"'
      'FROM "REP311"'
      'where'
      '"DATE_SEND" = current_date and'
      '"ARCH_NAME" Like :Shema'
      'Union'
      'SELECT DISTINCT "ARCH_NAME"'
      'FROM "REP3251"'
      'where'
      '"DATE_SEND" = current_date and'
      '"ARCH_NAME" Like :Shema) As ARCH_NAME')
    Left = 496
    Top = 152
    ParamData = <
      item
        Name = 'SHEMA'
        DataType = ftString
        ParamType = ptInput
        Value = 'A%'
      end>
  end
  object ADQuery311InDbArhName: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      'SET "ARCH_NAME"=:ARCH_NAME '
      'WHERE "FILENAME"=:FILENAME;')
    Left = 496
    Top = 200
    ParamData = <
      item
        Name = 'ARCH_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FILENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryKrutLoadPath: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      
        'SELECT "ID_AUTOMAT_PATH", "ID_REPORT", "PATH_FROM", "PATH_TO", "' +
        'TASK_NAME"'
      '  FROM "AUTOMAT_PATH"'
      '  where "ID_REPORT"=:ID_REPORT;')
    Left = 392
    Top = 8
    ParamData = <
      item
        Name = 'ID_REPORT'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
  end
  object ADQuery311GetSign: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where "ID_USER_SIGN"=0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date);')
    Left = 496
    Top = 256
  end
  object ADQuerySendSign: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "ID_USER_SIGN"=:ID_USER_SIGN, '
      '       "SIGN_TIME"=current_timestamp '
      ' WHERE "FILENAME"=:FILENAME;')
    Left = 496
    Top = 304
    ParamData = <
      item
        Name = 'ID_USER_SIGN'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FILENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryHronKrutSign311: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where "ID_USER_SIGN"<>0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date) and'
      '"IS_SIGN"=False;')
    Left = 568
    Top = 8
  end
  object ADQueryKrutVerba311SignUpd: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "ID_USER_RS"=:ID_USER_RS'
      'From'
      '(Select * From "REP311"'
      'WHERE '
      '"ID_USER_SIGN"<>0 and'
      '"IS_SIGN"=False '
      'limit 50) As TempT')
    Left = 392
    Top = 56
    ParamData = <
      item
        Name = 'ID_USER_RS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryKrutVerba311SignLoad: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where '
      '"ID_USER_SIGN"<>0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date) and'
      '"IS_SIGN"=False and'
      '"ID_USER_RS" = :ID_USER_RS;')
    Left = 392
    Top = 104
    ParamData = <
      item
        Name = 'ID_USER_RS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryKrutVerba311SignComplit: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "IS_SIGN"=True'
      ' WHERE '
      ' "FILENAME"=:FILENAME;')
    Left = 392
    Top = 152
    ParamData = <
      item
        Name = 'FILENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQuery311GetCript: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where "ID_USER_CRYPT"=0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date);')
    Left = 496
    Top = 352
  end
  object ADQuerySendKript: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "ID_USER_CRYPT"=:ID_USER_CRYPT, '
      '       "CRYPT_TIME"=current_timestamp '
      ' WHERE "FILENAME"=:FILENAME;')
    Left = 496
    Top = 400
    ParamData = <
      item
        Name = 'ID_USER_CRYPT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FILENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryHronKrutCript311: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where "ID_USER_CRYPT"<>0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date) and'
      '"IS_CRYPT"=False;')
    Left = 568
    Top = 56
  end
  object ADQueryKrutVerba311CriptUpd: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "ID_USER_RC"=:ID_USER_RC'
      'From'
      '(Select * From "REP311"'
      'WHERE '
      '"ID_USER_CRYPT"<>0 and'
      '"IS_CRYPT"=False '
      'limit 50) As TempT')
    Left = 392
    Top = 200
    ParamData = <
      item
        Name = 'ID_USER_RC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryKrutVerba311CriptLoad: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where '
      '"ID_USER_CRYPT"<>0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date) and'
      '"IS_CRYPT"=False and'
      '"ID_USER_RC" = :ID_USER_RC;')
    Left = 392
    Top = 248
    ParamData = <
      item
        Name = 'ID_USER_RC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryKrutHronArh311: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where "ID_USER_ARCH_CMD">0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date) and'
      '"ARCH_NAME"='#39' '#39' and'
      '"SCHEME"=:SCHEME;')
    Left = 568
    Top = 104
    ParamData = <
      item
        Name = 'SCHEME'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object ADQuery311GetArh: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where "ID_USER_ARCH_CMD"=0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date);')
    Left = 496
    Top = 448
  end
  object ADQuerySendArh: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "ID_USER_ARCH_CMD"=:ID_USER_CRYPT, '
      '       "DATE_ARCH"=current_timestamp '
      ' WHERE "FILENAME"=:FILENAME;')
    Left = 496
    Top = 496
    ParamData = <
      item
        Name = 'ID_USER_CRYPT'
        ParamType = ptInput
      end
      item
        Name = 'FILENAME'
        ParamType = ptInput
      end>
  end
  object ADQueryKrutVerba311ArhUpd: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "ID_USER_RA"=:ID_USER_RA'
      'From'
      '(Select * From "REP311"'
      'WHERE '
      '"ID_USER_ARCH_CMD"<>0 and'
      '"ARCH_NAME"='#39' '#39' and'
      '"SCHEME" = :SCHEME'
      'limit 500) As TempT')
    Left = 392
    Top = 296
    ParamData = <
      item
        Name = 'ID_USER_RA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SCHEME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryKrutVerba311ArhLoad: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "FILENAME"'
      'FROM "REP311"'
      'Where '
      '"ID_USER_ARCH_CMD"<>0 and'
      
        'date_part('#39'year'#39',"DATE_SEND") = date_part('#39'year'#39',current_date) a' +
        'nd'
      
        'date_part('#39'month'#39',"DATE_SEND") = date_part('#39'month'#39',current_date)' +
        ' and'
      'date_part('#39'day'#39',"DATE_SEND") = date_part('#39'day'#39',current_date) and'
      '"ARCH_NAME"='#39' '#39' and'
      '"SCHEME"=:SCHEME and'
      '"ID_USER_RA" = :ID_USER_RA;')
    Left = 392
    Top = 344
    ParamData = <
      item
        Name = 'SCHEME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_USER_RA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
