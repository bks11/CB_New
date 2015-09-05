object dmData: TdmData
  OldCreateOrder = False
  Height = 389
  Width = 577
  object conLoan: TADConnection
    Params.Strings = (
      'Database=CREDIT_DB'
      'User_Name=postgres'
      'Password=postgres'
      'Server=10.3.0.219'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 20
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 132
    Top = 20
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 238
    Top = 20
  end
  object qrInsertLoan: TADQuery
    Connection = conLoan
    SQL.Strings = (
      'INSERT INTO "TLOAN"('
      '            "AGREEMENT_NUM", '
      '            "ISSUE_DATE", '
      '            "LOAN_SUMM", '
      '            "LOAN_CURRENCY", '
      '            "END_DATE", '
      '            "TOTAL_CREDIT_SUMM", '
      '            "TOTAL_CREDIT_SUMM_EQ", '
      '            "DEBT_OUT_OF_DATE", '
      '            "DEBT_OUT_OF_DATE_EQ", '
      '            "PERCENT_OUT_OF_DATE", '
      '            "PERCENT_OUT_OF_DATE_EQ", '
      '            "COMMISSION_AMOUNT", '
      '            "FIRST_CREDITOR")'
      'VALUES     ( :AGREEMENT_NUM, '
      '             :ISSUE_DATE, '
      '             :LOAN_SUMM, '
      '             :LOAN_CURRENCY, '
      '             :END_DATE, '
      '             :TOTAL_CREDIT_SUMM, '
      '             :TOTAL_CREDIT_SUMM_EQ, :DEBT_OUT_OF_DATE, '
      
        '             :DEBT_OUT_OF_DATE_EQ, :PERCENT_OUT_OF_DATE, :PERCEN' +
        'T_OUT_OF_DATE_EQ, '
      '             :COMMISSION_AMOUNT, :FIRST_CREDITOR)'
      'RETURNING "ID_LOAN";')
    Left = 84
    Top = 168
    ParamData = <
      item
        Name = 'AGREEMENT_NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ISSUE_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOAN_SUMM'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOAN_CURRENCY'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TOTAL_CREDIT_SUMM'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TOTAL_CREDIT_SUMM_EQ'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DEBT_OUT_OF_DATE'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DEBT_OUT_OF_DATE_EQ'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PERCENT_OUT_OF_DATE'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PERCENT_OUT_OF_DATE_EQ'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COMMISSION_AMOUNT'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FIRST_CREDITOR'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qrInsertLoanID_LOAN: TLargeintField
      FieldName = 'ID_LOAN'
      Origin = '"ID_LOAN"'
    end
  end
  object qrInsertLoaner: TADQuery
    Connection = conLoan
    SQL.Strings = (
      'INSERT INTO "TLOANER"('
      '            "FIRSTNAME", '
      '            "LASTNAME", '
      '            "MIDDLENAME", '
      '            "INN", '
      '            "PASSPORT_ISSUE_DATE", '
      '            "PASSPORT_ISSUE_ORG", '
      '            "ADDRESS1", '
      '            "FULL_NAME",  '
      '            "FULL_PASSPORT")'
      '    VALUES ('
      '            :FIRSTNAME, '
      '            :LASTNAME, '
      '            :MIDDLENAME, '
      '            :INN, '
      '            :PASSPORT_ISSUE_DATE, '
      '            :PASSPORT_ISSUE_ORG, '
      '            :ADDRESS1, '
      '            :FULL_NAME,  '
      '            :FULL_PASSPORT'
      '            )'
      '            RETURNING "ID_LOANER"'
      '            ;')
    Left = 84
    Top = 226
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
        Name = 'FULL_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FULL_PASSPORT'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qrInsertLoanerID_LOANER: TLargeintField
      FieldName = 'ID_LOANER'
      Origin = '"ID_LOANER"'
    end
  end
  object qrInsertLoanInfo: TADQuery
    Connection = conLoan
    SQL.Strings = (
      'INSERT INTO "TLOANINFO"('
      '            "ID_LOANER", '
      '            "ID_LOAN")'
      '    VALUES (:ID_LOANER, '
      '            :ID_LOAN);')
    Left = 82
    Top = 284
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
end
