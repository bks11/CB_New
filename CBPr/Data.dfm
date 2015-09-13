object dmData: TdmData
  OldCreateOrder = False
  Height = 699
  Width = 768
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
    LoginPrompt = False
    Left = 72
    Top = 8
  end
  object qrLoadDostup: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT '
      '  ur."ID_REPORT", '
      '  u."ID_USER"'
      'FROM '
      '  public."USERS" u'
      'INNER JOIN  '
      '  public."USER_REPORTS" ur on  ur."ID_USER" = u."ID_USER"    '
      'WHERE '
      '  u."USER_LOGIN"= :USER_LOGIN;')
    Left = 170
    Top = 142
    ParamData = <
      item
        Name = 'USER_LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qr311PLoadPath: TADQuery
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
  object qr311ProvOutFile: TADQuery
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
  object qr311LoadData: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'INSERT INTO "REP311"('
      
        '"FILENAME","CLIENT_NAME", "ACC_NUM", "ID_USER", "DATE_SEND", "IS' +
        '_SIGN", "IS_CRYPT", "CB_GET", "PENS_ANSWER", "NAL_ANSWER", "SOC_' +
        'ANSWER", "ID_USER_SIGN", "ID_USER_CRYPT", "SCHEME", "ID_ARCHIVE"' +
        ', "ID_USER_ARCH_CMD")'
      
        'VALUES (:FILENAME,:CLIENT_NAME,:ACC_NUM,:ID_USER, current_timest' +
        'amp, False, False, False, False, False, False, 0, 0, :SCHEME, 0,' +
        ' 0);')
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
  object qrLoadArhCounFromDate: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT Count (DISTINCT "ARCHIVE_INFO"."ARC_NAME") AS Col'
      'FROM "REP311", "ARCHIVE_INFO"'
      'where'
      
        'date_part('#39'year'#39',"REP311"."DATE_SEND") = date_part('#39'year'#39',curren' +
        't_date) and'
      
        'date_part('#39'month'#39',"REP311"."DATE_SEND") = date_part('#39'month'#39',curr' +
        'ent_date) and'
      
        'date_part('#39'day'#39',"REP311"."DATE_SEND") = date_part('#39'day'#39',current_' +
        'date) and'
      '"REP311"."ID_ARCHIVE"="ARCHIVE_INFO"."ID_ARCHIVE" and'
      '"ARCHIVE_INFO"."ARC_NAME" Like :Shema'
      '')
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
  object qr311InDbArhName: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      'SET "ID_ARCHIVE"=:ID_ARCHIVE '
      'WHERE "FILENAME"=:FILENAME;')
    Left = 496
    Top = 200
    ParamData = <
      item
        Name = 'ID_ARCHIVE'
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
  object qrKrutLoadPath: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      
        'SELECT "ID_AUTOMAT_PATH", "ID_REPORT", "PATH_FROM", "PATH_TO", "' +
        'TASK_NAME"'
      '  FROM "AUTOMAT_PATH"'
      '  where "ID_REPORT"=:ID_REPORT;')
    Left = 320
    Top = 8
    ParamData = <
      item
        Name = 'ID_REPORT'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
  end
  object qr311GetSign: TADQuery
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
  object qrSendSign: TADQuery
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
  object qrHronKrutSign311: TADQuery
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
    Left = 632
    Top = 8
  end
  object qrKrutVerba311SignUpd: TADQuery
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
    Left = 320
    Top = 56
    ParamData = <
      item
        Name = 'ID_USER_RS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrKrutVerba311SignLoad: TADQuery
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
    Left = 320
    Top = 104
    ParamData = <
      item
        Name = 'ID_USER_RS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrKrutVerba311SignComplit: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "IS_SIGN"=True'
      ' WHERE '
      ' "FILENAME"=:FILENAME;')
    Left = 320
    Top = 152
    ParamData = <
      item
        Name = 'FILENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qr311GetCript: TADQuery
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
  object qrSendKript: TADQuery
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
  object qrHronKrutCript311: TADQuery
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
    Left = 632
    Top = 56
  end
  object qrKrutVerba311CriptUpd: TADQuery
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
    Left = 320
    Top = 200
    ParamData = <
      item
        Name = 'ID_USER_RC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrKrutVerba311CriptLoad: TADQuery
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
    Left = 320
    Top = 248
    ParamData = <
      item
        Name = 'ID_USER_RC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrKrutHronArh311: TADQuery
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
      '"ID_ARCHIVE"=0 and'
      '"SCHEME"=:SCHEME;')
    Left = 632
    Top = 104
    ParamData = <
      item
        Name = 'SCHEME'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object qr311GetArh: TADQuery
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
  object qrSendArh: TADQuery
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
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'FILENAME'
        DataType = ftString
        ParamType = ptInput
        Value = '013510110_910220150515_249000031500088041_200'
      end>
  end
  object qrKrutVerba311ArhUpd: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "REP311"'
      '   SET "ID_USER_RA"=:ID_USER_RA'
      'From'
      '(Select * From "REP311"'
      'WHERE '
      '"ID_USER_ARCH_CMD"<>0 and'
      '"ID_ARCHIVE"=0 and'
      '"SCHEME" = :SCHEME'
      'limit 500) As TempT')
    Left = 320
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
  object qrKrutVerba311ArhLoad: TADQuery
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
      '"ID_ARCHIVE"=0 and'
      '"SCHEME"=:SCHEME and'
      '"ID_USER_RA" = :ID_USER_RA;')
    Left = 320
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
  object qrLoadArhFromDate: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'INSERT INTO "ARCHIVE_INFO"('
      '"ARC_NAME", "ARC_RS", "PACKET_NAME", "PACKET_CREATE")'
      'VALUES (:ARC_NAME, 0, '#39' '#39', 0);'
      '')
    Left = 496
    Top = 544
    ParamData = <
      item
        Name = 'ARC_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object qrLoadArhId: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'Select "ID_ARCHIVE" '
      'From "ARCHIVE_INFO" '
      'Where "ARC_NAME"=:ARC_NAME')
    Left = 496
    Top = 592
    ParamData = <
      item
        Name = 'ARC_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrVerbaMailSignUpd: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "ARCHIVE_INFO"'
      '   SET "ARC_RS"=:ARC_RS'
      ' WHERE "ARC_RS"=0;')
    Left = 320
    Top = 392
    ParamData = <
      item
        Name = 'ARC_RS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrKrutHromMailSign: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT  "ARC_NAME"'
      '  FROM "ARCHIVE_INFO"'
      '  Where "ARC_RS">0 and'
      '  "PACKET_NAME"='#39' '#39';')
    Left = 632
    Top = 152
  end
  object qrArhMailUp: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "ARCHIVE_INFO"'
      '   SET "PACKET_CREATE"=:PACKET_CREATE'
      ' WHERE "PACKET_CREATE"=0;')
    Left = 320
    Top = 440
    ParamData = <
      item
        Name = 'PACKET_CREATE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrKrutHromMailCreate: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT  "ARC_NAME"'
      '  FROM "ARCHIVE_INFO"'
      '  Where "PACKET_CREATE">0 and'
      '  "PACKET_NAME"='#39' '#39';')
    Left = 632
    Top = 200
  end
  object qrArhMailGetCount: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT Count (DISTINCT "ARCHIVE_INFO"."PACKET_NAME") AS Col'
      'FROM "REP311", "ARCHIVE_INFO"'
      'where'
      
        'date_part('#39'year'#39',"REP311"."DATE_SEND") = date_part('#39'year'#39',curren' +
        't_date) and'
      
        'date_part('#39'month'#39',"REP311"."DATE_SEND") = date_part('#39'month'#39',curr' +
        'ent_date) and'
      
        'date_part('#39'day'#39',"REP311"."DATE_SEND") = date_part('#39'day'#39',current_' +
        'date) and'
      '"REP311"."ID_ARCHIVE"="ARCHIVE_INFO"."ID_ARCHIVE" and'
      '"ARCHIVE_INFO"."PACKET_NAME" Like :Packet')
    Left = 170
    Top = 34
    ParamData = <
      item
        Name = 'PACKET'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrArhMailSetPak: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'UPDATE "ARCHIVE_INFO"'
      '   SET "PACKET_NAME"=:PACKET_NAME'
      ' WHERE "ARC_NAME"=:ARC_NAME and'
      ' "PACKET_NAME"='#39' '#39';')
    Left = 170
    Top = 87
    ParamData = <
      item
        Name = 'PACKET_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ARC_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
