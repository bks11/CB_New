object DMData: TDMData
  OldCreateOrder = False
  Height = 815
  Width = 1115
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
    Connection = conCredittDB
    SQL.Strings = (
      '')
    Left = 29
    Top = 78
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 137
    Top = 8
  end
  object dsqAny: TDataSource
    DataSet = qrAny
    Left = 93
    Top = 78
  end
  object qrLoanInfo: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'select '
      
        #9' lnr."LASTNAME" ||'#39'  '#39'||lnr."FIRSTNAME" ||'#39'  '#39'|| lnr."MIDDLENAM' +
        'E" AS FIO , '
      '         l.*,lnr."FULL_NAME"'
      'from '
      #9'"TLOANER" lnr '
      'inner join '
      #9'"TLOANINFO" li on lnr."ID_LOANER" = li."ID_LOANER"'
      'inner join '
      #9'"TLOAN" l on li."ID_LOAN" = l."ID_LOAN"'
      'inner join'
      #9'"TUSERLOANS" ul on l."ID_LOAN" = ul."ID_LOAN"'
      'inner join '
      #9'"TUSERS" u on ul."ID_USER" = u."ID_USER"'
      'where u."ID_USER"=:ID_USER and lnr."IS_GUARANTOR"=False AND '
      '("IS_PAID" = :PAID1 OR "IS_PAID" = :PAID2) '
      'order by lnr."LASTNAME";')
    Left = 39
    Top = 161
    ParamData = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'PAID1'
        DataType = ftBoolean
        ParamType = ptInput
        Value = False
      end
      item
        Name = 'PAID2'
        DataType = ftBoolean
        ParamType = ptInput
        Value = False
      end>
  end
  object dsqLoanInfo: TDataSource
    DataSet = qrLoanInfo
    Left = 103
    Top = 161
  end
  object qrLoanerInfoByLoans: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT '
      '  "TLOANER"."ID_LOANER", '
      '  "TLOANER"."FIRSTNAME", '
      '  "TLOANER"."LASTNAME", '
      '  "TLOANER"."MIDDLENAME", '
      '  "TLOANER"."INN", '
      '  "TLOANER"."PASSPORTSERIAL", '
      '  "TLOANER"."PASSPORTNUM", '
      '  "TLOANER"."PASSPORT_ISSUE_DATE", '
      '  "TLOANER"."PASSPORT_ISSUE_ORG", '
      '  "TLOANER"."ADDRESS1", '
      '  "TLOANER"."ADDRESS2", '
      '  "TLOANER"."PHONE1", '
      '  "TLOANER"."PHONE2", '
      '  "TLOANER"."NOTE", '
      '  "TLOANER"."IS_GUARANTOR",'
      '  "TLOANER"."FULL_PASSPORT"'
      'FROM '
      '  public."TLOAN", '
      '  public."TLOANER", '
      '  public."TLOANINFO"'
      'WHERE '
      
        '  "TLOAN"."ID_LOAN"=:ID_Loans AND "TLOAN"."ID_LOAN" = "TLOANINFO' +
        '"."ID_LOAN" AND'
      '  "TLOANINFO"."ID_LOANER" = "TLOANER"."ID_LOANER";'
      '')
    Left = 39
    Top = 212
    ParamData = <
      item
        Name = 'ID_LOANS'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object QRAdminUsersLVSL: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT '
      '  "TLOANINFO"."ID_LOANINFO", '
      '  "TLOANINFO"."ID_LOANER", '
      '  "TLOANINFO"."ID_LOAN"'
      'FROM '
      '  public."TLOANINFO"'
      'Where'
      
        '  "TLOANINFO"."ID_LOANER"=:ID_Loaner and  "TLOANINFO"."ID_LOAN"=' +
        ':ID_Loans;')
    Left = 504
    Top = 214
    ParamData = <
      item
        Name = 'ID_LOANER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'ID_LOANS'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object TableUsers: TADTable
    Connection = conCredittDB
    UpdateOptions.UpdateTableName = '"TUSERS"'
    TableName = '"TUSERS"'
    Left = 504
    Top = 266
  end
  object DataSourceUsers: TDataSource
    DataSet = TableUsers
    Left = 600
    Top = 266
  end
  object TableLoans: TADTable
    Connection = conCredittDB
    UpdateOptions.UpdateTableName = '"TLOAN"'
    TableName = '"TLOAN"'
    Left = 504
    Top = 317
  end
  object TableLoanser: TADTable
    Connection = conCredittDB
    UpdateOptions.UpdateTableName = '"TLOANER"'
    TableName = '"TLOANER"'
    Left = 504
    Top = 369
  end
  object DataSourceLoans: TDataSource
    DataSet = TableLoans
    Left = 600
    Top = 317
  end
  object DataSourceLoanser: TDataSource
    DataSet = ADQueryLoanser
    Left = 600
    Top = 369
  end
  object QRAdminUsersLVSLDel: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'DELETE FROM "TLOANINFO"'
      'WHERE '
      '"TLOANINFO"."ID_LOANER"=:ID_Loaner and  '
      '"TLOANINFO"."ID_LOAN"=:ID_Loans;;')
    Left = 504
    Top = 163
    ParamData = <
      item
        Name = 'ID_LOANER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_LOANS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QRAdminUsersLVSLAdd: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'INSERT INTO "TLOANINFO"('
      '             "ID_LOANER", "ID_LOAN")'
      '    VALUES (:ID_LOANER, :ID_Loans);')
    Left = 504
    Top = 112
    ParamData = <
      item
        Name = 'ID_LOANER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'ID_LOANS'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object QRDosudebkaList: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      
        'SELECT "ID_JUDJORNAL", "ID_LOAN", "ACTION_DATE", "ID_USER", "NOT' +
        'E"'
      '  FROM "TJUDJORNAL"'
      'Where'
      '"ID_LOAN"=:ID_LOAN;')
    Left = 206
    Top = 84
    ParamData = <
      item
        Name = 'ID_LOAN'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSourceDosudebkaList: TDataSource
    DataSet = QRDosudebkaList
    Left = 324
    Top = 84
  end
  object QRDosudebkaListAdd: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'INSERT INTO "TJUDJORNAL"('
      '"ID_LOAN", '
      '"ACTION_DATE", '
      '"ID_USER", '
      '"NOTE")'
      'VALUES (:ID_LOAN, :ACTION_DATE, :ID_USER, :NOTE);')
    Left = 272
    Top = 271
    ParamData = <
      item
        Name = 'ID_LOAN'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ACTION_DATE'
        DataType = ftDate
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
        Name = 'NOTE'
        DataType = ftFmtMemo
        ParamType = ptInput
        Value = Null
      end>
  end
  object QRDosudebkaListDel: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'DELETE FROM "TJUDJORNAL"'
      ' WHERE "ID_JUDJORNAL"=:ID_JUDJORNAL;')
    Left = 272
    Top = 220
    ParamData = <
      item
        Name = 'ID_JUDJORNAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QRDosudebkaListEdit: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'UPDATE "TJUDJORNAL"'
      '   SET "ACTION_DATE"=:ACTION_DATE, "ID_USER"=:ID_USER, '
      '       "NOTE"=:NOTE'
      ' WHERE "ID_JUDJORNAL"=:ID_JUDJORNAL;')
    Left = 272
    Top = 169
    ParamData = <
      item
        Name = 'ACTION_DATE'
        DataType = ftDate
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
        Name = 'NOTE'
        DataType = ftMemo
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_JUDJORNAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrLogin: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT '
      '  "ID_USER", '
      '  "FIRSTNAME", '
      '  "MIDDLENAME", '
      '  "LASTNAME", '
      '  "NOTE", '
      '  "USER_LOGIN", '
      '  "USER_PASSWORD",'
      '  "IS_ADMIN"'
      'FROM '
      '   "TUSERS"  '
      'WHERE'
      
        '  "USER_LOGIN" = :PRMUSERLOGIN and "USER_PASSWORD"=:USER_PASSWOR' +
        'D;')
    Left = 40
    Top = 264
    ParamData = <
      item
        Name = 'PRMUSERLOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = 'k.zaichenko'
      end
      item
        Name = 'USER_PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Value = '11'
      end>
  end
  object qrchengepass: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'UPDATE "TUSERS"'
      '   SET "USER_PASSWORD"=:USER_PASSWORD'
      ' WHERE "ID_USER" = :ID_USER;')
    Left = 40
    Top = 312
    ParamData = <
      item
        Name = 'USER_PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_USER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QRAdminUsersLVSLDG: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT '
      '  "TLOAN"."AGREEMENT_NUM"'
      'FROM '
      '  "TUSERLOANS", '
      '  "TLOAN"'
      'WHERE '
      '  "TUSERLOANS"."ID_LOAN" = "TLOAN"."ID_LOAN" and '
      '  "TUSERLOANS"."ID_USER"=:ID_USER;')
    Left = 504
    Top = 416
    ParamData = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object QRAdminUsersLVSLDGAdd: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'INSERT INTO "TUSERLOANS"('
      '            "ID_LOAN", "ID_USER")'
      'VALUES (:ID_LOAN, :ID_USER);')
    Left = 504
    Top = 464
    ParamData = <
      item
        Name = 'ID_LOAN'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_USER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QRAdminUsersLVSLDGDel: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'DELETE FROM "TUSERLOANS"'
      ' WHERE "ID_LOAN"=:ID_LOAN and "ID_USER"=:ID_USER;')
    Left = 504
    Top = 512
    ParamData = <
      item
        Name = 'ID_LOAN'
        ParamType = ptInput
      end
      item
        Name = 'ID_USER'
        ParamType = ptInput
      end>
  end
  object QRAdminUsersLVSLDGGetId: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT "ID_LOAN"'
      '  FROM "TLOAN"'
      '  Where "AGREEMENT_NUM"=:AGREEMENT_NUM;')
    Left = 504
    Top = 560
    ParamData = <
      item
        Name = 'AGREEMENT_NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrMainOrganaizer: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT '
      '  "TJUDJORNAL"."ACTION_DATE","TJUDJORNAL"."NOTE" '
      'FROM '
      '  "TJUDJORNAL" '
      'WHERE '
      '  "TJUDJORNAL"."ID_LOAN" = :ID_LOAN;')
    Left = 40
    Top = 360
    ParamData = <
      item
        Name = 'ID_LOAN'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object DSMainOrganaizer: TDataSource
    DataSet = qrMainOrganaizer
    Left = 126
    Top = 360
  end
  object DataSourceLoanerInfoByLoans: TDataSource
    DataSet = qrLoanerInfoByLoans
    Left = 116
    Top = 214
  end
  object qrOrganaizerFul: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT '
      
        '"TJUDJORNAL"."ID_JUDJORNAL", "TJUDJORNAL"."ACTION_DATE", "TUSERS' +
        '"."LASTNAME" ,"TJUDJORNAL"."NOTE", "TJUDJORNAL"."IS_COMPLETED" '
      'FROM '
      '"TJUDJORNAL",'
      '"TUSERLOANS",'
      '"TUSERS" '
      'WHERE '
      '"TJUDJORNAL"."ID_LOAN" = "TUSERLOANS"."ID_LOAN" and'
      '"TUSERLOANS"."ID_USER"=:ID_USER and'
      '"TUSERS"."ID_USER"="TJUDJORNAL"."ID_USER" and'
      '"TJUDJORNAL"."IS_COMPLETED"=:IS_COMPLETED'
      'Order by "TJUDJORNAL"."ACTION_DATE" desc;')
    Left = 680
    Top = 112
    ParamData = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'IS_COMPLETED'
        DataType = ftBoolean
        ParamType = ptInput
        Value = False
      end>
  end
  object DataSourceOrganaizerFul: TDataSource
    DataSet = qrOrganaizerFul
    Left = 736
    Top = 112
  end
  object qrOrganaizerComplit: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'UPDATE "TJUDJORNAL"'
      '   SET "IS_COMPLETED"=True'
      ' WHERE "ID_JUDJORNAL"=:ID_JUDJORNAL;')
    Left = 680
    Top = 160
    ParamData = <
      item
        Name = 'ID_JUDJORNAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object qrAdminsCursesLoad: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT "ID_CURRENCY", "CURR_RATE", "CURR_DATE", "CURR_CODE"'
      '  FROM "TCURRENCY"'
      'where "CURR_DATE"=:CURR_DATE;')
    Left = 504
    Top = 608
    ParamData = <
      item
        Name = 'CURR_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrAdminCursAdd: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'INSERT INTO "TCURRENCY"('
      '            "CURR_RATE", "CURR_DATE", "CURR_CODE")'
      '    VALUES (:CURR_RATE,:CURR_DATE, :CURR_CODE );')
    Left = 504
    Top = 656
    ParamData = <
      item
        Name = 'CURR_RATE'
        DataType = ftCurrency
        ParamType = ptInput
        Value = 100000c
      end
      item
        Name = 'CURR_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = 42005d
      end
      item
        Name = 'CURR_CODE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 980
      end>
  end
  object qrAdminQursEdit: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'UPDATE "TCURRENCY"'
      '   SET "CURR_RATE"=:CURR_RATE '
      ' WHERE "CURR_DATE"=:CURR_DATE and "CURR_CODE"=:CURR_CODE;')
    Left = 504
    Top = 696
    ParamData = <
      item
        Name = 'CURR_RATE'
        DataType = ftCurrency
        ParamType = ptInput
        Value = 30000c
      end
      item
        Name = 'CURR_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = 42238d
      end
      item
        Name = 'CURR_CODE'
        DataType = ftString
        ParamType = ptInput
        Value = '840'
      end>
  end
  object qrGetCurrency: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT "ID_CURRENCY", "CURR_RATE", "CURR_DATE", "CURR_CODE"'
      
        '  FROM "TCURRENCY" WHERE "CURR_CODE" = :CURR_CODE ORDER BY "CURR' +
        '_DATE"  DESC LIMIT 1;')
    Left = 38
    Top = 450
    ParamData = <
      item
        Name = 'CURR_CODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsqGetCurrency: TDataSource
    DataSet = qrGetCurrency
    Left = 130
    Top = 450
  end
  object ADQueryLoansCount: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'select Count(l."ID_LOAN") as Col'
      #9' '
      'from '
      #9'"TLOANER" lnr '
      'inner join '
      #9'"TLOANINFO" li on lnr."ID_LOANER" = li."ID_LOANER"'
      'inner join '
      #9'"TLOAN" l on li."ID_LOAN" = l."ID_LOAN"'
      'inner join'
      #9'"TUSERLOANS" ul on l."ID_LOAN" = ul."ID_LOAN"'
      'inner join '
      #9'"TUSERS" u on ul."ID_USER" = u."ID_USER"'
      'where u."ID_USER"=:ID_USER and lnr."IS_GUARANTOR"=False AND '
      '("IS_PAID" = :PAID1 OR "IS_PAID" = :PAID2);')
    Left = 8
    Top = 160
    ParamData = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PAID1'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PAID2'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryLoansInfoPogashLoans: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'UPDATE "TLOAN"'
      '   SET "IS_PAID"=:IS_PAID'
      ' WHERE "ID_LOAN"=:ID_LOAN;')
    Left = 416
    Top = 112
    ParamData = <
      item
        Name = 'IS_PAID'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_LOAN'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryLoansInfoUpdateLoaner: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'UPDATE "TLOANER"'
      
        '   SET "FIRSTNAME"=:FIRSTNAME, "LASTNAME"=:LASTNAME, "MIDDLENAME' +
        '"=:MIDDLENAME, "INN"=:INN, '
      
        '       "PASSPORTSERIAL"=:PASSPORTSERIAL, "PASSPORTNUM"=:PASSPORT' +
        'NUM, "PASSPORT_ISSUE_DATE"=:PASSPORT_ISSUE_DATE, '
      
        '       "PASSPORT_ISSUE_ORG"=:PASSPORT_ISSUE_ORG, "ADDRESS1"=:ADD' +
        'RESS1, "ADDRESS2"=:ADDRESS2, "PHONE1"=:PHONE1, '
      
        '       "PHONE2"=:PHONE2,"IS_GUARANTOR"=:IS_GUARANTOR, "FULL_NAME' +
        '"=:FULL_NAME'
      ' WHERE "ID_LOANER"=:ID_LOANER;')
    Left = 40
    Top = 408
    ParamData = <
      item
        Name = 'FIRSTNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LASTNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MIDDLENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'INN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSPORTSERIAL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSPORTNUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSPORT_ISSUE_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSPORT_ISSUE_ORG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ADDRESS1'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ADDRESS2'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PHONE1'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PHONE2'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IS_GUARANTOR'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FULL_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_LOANER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryLoanInfoColDebtor: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT '
      '  Count("TLOANER"."ID_LOANER") as Col  '
      'FROM '
      '  public."TLOAN", '
      '  public."TLOANER", '
      '  public."TLOANINFO"'
      'WHERE '
      
        '  "TLOAN"."ID_LOAN"=:ID_Loans AND "TLOAN"."ID_LOAN" = "TLOANINFO' +
        '"."ID_LOAN" AND'
      '  "TLOANINFO"."ID_LOANER" = "TLOANER"."ID_LOANER" and'
      '  "TLOANER"."IS_GUARANTOR"=False;')
    Left = 8
    Top = 208
    ParamData = <
      item
        Name = 'ID_LOANS'
        DataType = ftInteger
        ParamType = ptInput
        Value = 3
      end>
  end
  object ADQueryLoansInfoAddLoaner: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'INSERT INTO "TLOANER"('
      '"FIRSTNAME",'
      '"LASTNAME", '
      '"MIDDLENAME", '
      '"INN", '
      '"PASSPORTSERIAL", '
      '"PASSPORTNUM", '
      '"PASSPORT_ISSUE_DATE", '
      '"PASSPORT_ISSUE_ORG", '
      '"ADDRESS1", '
      '"ADDRESS2", '
      '"PHONE1", '
      '"PHONE2",'
      '"IS_GUARANTOR", '
      '"FULL_NAME")'
      
        '    VALUES (:FIRSTNAME, :LASTNAME, :MIDDLENAME, :INN, :PASSPORTS' +
        'ERIAL, :PASSPORTNUM, '
      
        '            :PASSPORT_ISSUE_DATE, :PASSPORT_ISSUE_ORG, :ADDRESS1' +
        ', :ADDRESS2, '
      '            :PHONE1, :PHONE2, :"IS_GUARANTOR", :FULL_NAME);')
    Left = 72
    Top = 408
    ParamData = <
      item
        Name = 'FIRSTNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LASTNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MIDDLENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'INN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSPORTSERIAL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSPORTNUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSPORT_ISSUE_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSPORT_ISSUE_ORG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ADDRESS1'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ADDRESS2'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PHONE1'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PHONE2'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IS_GUARANTOR'
        IsCaseSensitive = True
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FULL_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryLoansInfoMaxIdDebtors: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT Max("ID_LOANER") '
      '  FROM "TLOANER";')
    Left = 104
    Top = 408
  end
  object ADQueryLoanerInfoAdd: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'INSERT INTO "TLOANINFO"('
      '"ID_LOANER", '
      '"ID_LOAN")'
      'VALUES (:ID_LOANER, :ID_LOAN);')
    Left = 136
    Top = 408
    ParamData = <
      item
        Name = 'ID_LOANER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_LOAN'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADQueryLoansInfoDelLoaner: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'DELETE FROM "TLOANINFO"'
      ' WHERE "ID_LOANER"=:ID_LOANER and "ID_LOAN"=:ID_LOAN;'
      '')
    Left = 168
    Top = 408
    ParamData = <
      item
        Name = 'ID_LOANER'
        ParamType = ptInput
      end
      item
        Name = 'ID_LOAN'
        ParamType = ptInput
      end>
  end
  object ADQueryLoanser: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT T.* FROM "TLOANER" T order by "LASTNAME"')
    Left = 536
    Top = 368
  end
  object qrAppInfo: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT DISTINCT '
      '  * '
      'FROM '
      '  "TCONFIG" '
      'ORDER BY  '
      ' "RELEASE_DATE" '
      'ASC')
    Left = 854
    Top = 370
    object qrAppInfoID_CONFIG: TLargeintField
      FieldName = 'ID_CONFIG'
      Origin = '"ID_CONFIG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrAppInfoAPP_PATH: TWideStringField
      FieldName = 'APP_PATH'
      Origin = '"APP_PATH"'
      Size = 200
    end
    object qrAppInfoAPP_VERSION: TWideStringField
      FieldName = 'APP_VERSION'
      Origin = '"APP_VERSION"'
      Size = 10
    end
    object qrAppInfoAPP_NOTE: TWideStringField
      FieldName = 'APP_NOTE'
      Origin = '"APP_NOTE"'
      Size = 200
    end
    object qrAppInfoIS_RELEASE: TBooleanField
      FieldName = 'IS_RELEASE'
      Origin = '"IS_RELEASE"'
    end
    object qrAppInfoRELEASE_DATE: TDateField
      FieldName = 'RELEASE_DATE'
      Origin = '"RELEASE_DATE"'
    end
    object qrAppInfoAPP_RELEASE_PATH: TWideStringField
      FieldName = 'APP_RELEASE_PATH'
      Origin = '"APP_RELEASE_PATH"'
      Size = 250
    end
  end
  object qrUpdateAppInfo: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'UPDATE '
      '   "TCONFIG"'
      'SET  '
      '    "APP_PATH"=:APP_PATH, '
      '    "APP_VERSION"=:APP_VERSION, '
      '    "APP_NOTE"=:APP_NOTE, '
      '    "IS_RELEASE"=:IS_RELEASE, '
      '    "RELEASE_DATE"= :RELEASE_DATE, '
      '    "APP_RELEASE_PATH"=:APP_RELEASE_PATH'
      ' WHERE '
      '    "ID_CONFIG"= :ID_CONFIG')
    Left = 854
    Top = 422
    ParamData = <
      item
        Name = 'APP_PATH'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'APP_VERSION'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'APP_NOTE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IS_RELEASE'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RELEASE_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'APP_RELEASE_PATH'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_CONFIG'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsqAppInfo: TDataSource
    DataSet = qrAppInfo
    Left = 932
    Top = 372
  end
  object qrInsertAppInfo: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'INSERT INTO "TCONFIG"('
      
        '            "APP_PATH", "APP_VERSION", "APP_NOTE", "IS_RELEASE",' +
        ' '
      '            "RELEASE_DATE", "APP_RELEASE_PATH")'
      'VALUES ('
      '            :APP_PATH, :APP_VERSION, :APP_NOTE, :IS_RELEASE, '
      '            :RELEASE_DATE, :APP_RELEASE_PATH'
      '       )'
      'RETURNING "ID_CONFIG"')
    Left = 854
    Top = 468
    ParamData = <
      item
        Name = 'APP_PATH'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'APP_VERSION'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'APP_NOTE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IS_RELEASE'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RELEASE_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'APP_RELEASE_PATH'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qrInsertAppInfoID_CONFIG: TLargeintField
      FieldName = 'ID_CONFIG'
      Origin = '"ID_CONFIG"'
    end
  end
  object qrUpdateRelease: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'UPDATE "TCONFIG"'
      '   SET  "IS_RELEASE"=FALSE'
      ' WHERE "ID_CONFIG" <> :ID_CONFIG;')
    Left = 854
    Top = 516
    ParamData = <
      item
        Name = 'ID_CONFIG'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrDelApp: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'DELETE FROM "TCONFIG"'
      ' WHERE "ID_CONFIG" = :ID_CONFIG')
    Left = 856
    Top = 564
    ParamData = <
      item
        Name = 'ID_CONFIG'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
