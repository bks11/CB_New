object DMData: TDMData
  OldCreateOrder = False
  Height = 815
  Width = 1115
  object conCredittDB: TADConnection
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
    Left = 39
    Top = 110
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 137
    Top = 8
  end
  object dsqAny: TDataSource
    DataSet = qrAny
    Left = 103
    Top = 110
  end
  object qrLoanInfo: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'select '
      
        #9' lnr."LASTNAME" ||'#39'  '#39'||lnr."FIRSTNAME" ||'#39'  '#39'|| lnr."MIDDLENAM' +
        'E" AS FIO , '
      '         l.*'
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
        Value = Null
      end
      item
        Name = 'PAID2'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end>
    object qrLoanInfofio: TADWideMemoField
      DisplayLabel = #1060#1048#1054
      FieldName = 'fio'
      Origin = 'fio'
      BlobType = ftWideMemo
    end
    object qrLoanInfoID_LOAN: TLargeintField
      FieldName = 'ID_LOAN'
      Origin = '"ID_LOAN"'
    end
    object qrLoanInfoAGREEMENT_NUM: TWideStringField
      FieldName = 'AGREEMENT_NUM'
      Origin = '"AGREEMENT_NUM"'
      Size = 75
    end
    object qrLoanInfoISSUE_DATE: TDateField
      FieldName = 'ISSUE_DATE'
      Origin = '"ISSUE_DATE"'
    end
    object qrLoanInfoLOAN_SUMM: TCurrencyField
      FieldName = 'LOAN_SUMM'
      Origin = '"LOAN_SUMM"'
    end
    object qrLoanInfoLOAN_CURRENCY: TWideStringField
      FieldName = 'LOAN_CURRENCY'
      Origin = '"LOAN_CURRENCY"'
      Size = 3
    end
    object qrLoanInfoEND_DATE: TDateField
      FieldName = 'END_DATE'
      Origin = '"END_DATE"'
    end
    object qrLoanInfoTOTAL_CREDIT_SUMM: TCurrencyField
      FieldName = 'TOTAL_CREDIT_SUMM'
      Origin = '"TOTAL_CREDIT_SUMM"'
    end
    object qrLoanInfoTOTAL_CREDIT_SUMM_EQ: TCurrencyField
      FieldName = 'TOTAL_CREDIT_SUMM_EQ'
      Origin = '"TOTAL_CREDIT_SUMM_EQ"'
    end
    object qrLoanInfoDEBT_OUT_OF_DATE: TCurrencyField
      FieldName = 'DEBT_OUT_OF_DATE'
      Origin = '"DEBT_OUT_OF_DATE"'
    end
    object qrLoanInfoDEBT_OUT_OF_DATE_EQ: TCurrencyField
      FieldName = 'DEBT_OUT_OF_DATE_EQ'
      Origin = '"DEBT_OUT_OF_DATE_EQ"'
    end
    object qrLoanInfoPERCENT_OUT_OF_DATE: TCurrencyField
      FieldName = 'PERCENT_OUT_OF_DATE'
      Origin = '"PERCENT_OUT_OF_DATE"'
    end
    object qrLoanInfoPERCENT_OUT_OF_DATE_EQ: TCurrencyField
      FieldName = 'PERCENT_OUT_OF_DATE_EQ'
      Origin = '"PERCENT_OUT_OF_DATE_EQ"'
    end
    object qrLoanInfoCOMMISSION_AMOUNT: TCurrencyField
      FieldName = 'COMMISSION_AMOUNT'
      Origin = '"COMMISSION_AMOUNT"'
    end
    object qrLoanInfoFIRST_CREDITOR: TWideStringField
      FieldName = 'FIRST_CREDITOR'
      Origin = '"FIRST_CREDITOR"'
      Size = 100
    end
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
      '  "TLOANER"."IS_GUARANTOR"'
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
    DataSet = TableLoanser
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
    Left = 224
    Top = 112
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
    Left = 342
    Top = 112
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
    Left = 224
    Top = 265
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
    Left = 224
    Top = 214
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
    Left = 224
    Top = 163
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
end
