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
    Connection = conCredittDB
    SQL.Strings = (
      '')
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
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 137
    Top = 8
  end
  object dsqAny: TDataSource
    DataSet = qrAny
    Left = 96
    Top = 80
  end
  object qrLoanInfo: TADQuery
    Active = True
    Connection = conCredittDB
    SQL.Strings = (
      'SELECT * FROM "TLOAN"')
    Left = 32
    Top = 136
    object qrLoanInfoID_LOAN: TLargeintField
      FieldName = 'ID_LOAN'
      Origin = '"ID_LOAN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrLoanInfoAGREEMENT_NUM: TStringField
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
    object qrLoanInfoLOAN_CURRENCY: TStringField
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
    object qrLoanInfoFIRST_CREDITOR: TStringField
      FieldName = 'FIRST_CREDITOR'
      Origin = '"FIRST_CREDITOR"'
      Size = 100
    end
  end
  object dsqLoanInfo: TDataSource
    DataSet = qrLoanInfo
    Left = 96
    Top = 136
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
      
        '  "TLOANINFO"."ID_LOANER" = "TLOANER"."ID_LOANER" AND "TLOANER".' +
        '"IS_GUARANTOR"=True;'
      '')
    Left = 32
    Top = 192
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
    Left = 992
    Top = 24
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
    Active = True
    Connection = conCredittDB
    UpdateOptions.UpdateTableName = '"TUSERS"'
    TableName = '"TUSERS"'
    Left = 992
    Top = 64
  end
  object DataSourceUsers: TDataSource
    DataSet = TableUsers
    Left = 960
    Top = 64
  end
  object TableLoans: TADTable
    Active = True
    Connection = conCredittDB
    UpdateOptions.UpdateTableName = '"TLOAN"'
    TableName = '"TLOAN"'
    Left = 992
    Top = 112
  end
  object TableLoanser: TADTable
    Active = True
    Connection = conCredittDB
    UpdateOptions.UpdateTableName = '"TLOANER"'
    TableName = '"TLOANER"'
    Left = 992
    Top = 152
  end
  object DataSourceLoans: TDataSource
    DataSet = TableLoans
    Left = 960
    Top = 112
  end
  object DataSourceLoanser: TDataSource
    DataSet = TableLoanser
    Left = 960
    Top = 152
  end
  object QRAdminUsersLVSLDel: TADQuery
    Connection = conCredittDB
    SQL.Strings = (
      'DELETE FROM "TLOANINFO"'
      'WHERE '
      '"TLOANINFO"."ID_LOANER"=:ID_Loaner and  '
      '"TLOANINFO"."ID_LOAN"=:ID_Loans;;')
    Left = 960
    Top = 24
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
    Left = 928
    Top = 24
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
    Left = 736
    Top = 32
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
    Left = 704
    Top = 32
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
    Left = 736
    Top = 72
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
end
