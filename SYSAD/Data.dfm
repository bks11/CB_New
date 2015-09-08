object dmData: TdmData
  OldCreateOrder = False
  Height = 539
  Width = 857
  object conNagios: TADConnection
    Params.Strings = (
      'Database=DBNagios'
      'User_Name=mysqladm'
      'Password=Simf0000'
      'Server=10.3.0.231'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 22
    Top = 14
  end
  object qrInsertLog: TADQuery
    Connection = conNagios
    SQL.Strings = (
      'insert into TLOG_INFO '
      '('
      '       REC_DATETIME,'
      '       ACTION_LABEL,'
      '       HOST_NAME,'
      '       LOG_ACTION,'
      '       ASTATE,'
      '       ADEVICE,'
      '       ANUM,'
      '       PINGINFO,'
      '       PINGSTATUS,'
      '       PACKET_LOSS,'
      '       RTA,'
      '       FILE_NAME'
      ') '
      'VALUES '
      '('
      '       :REC_DATETIME,'
      '       :ACTION_LABEL,'
      '       :HOST_NAME,'
      '       :LOG_ACTION,'
      '       :ASTATE,'
      '       :ADEVICE,'
      '       :ANUM,'
      '       :PINGINFO,'
      '       :PINGSTATUS,'
      '       :PACKET_LOSS,'
      '       :RTA,'
      '       :FILE_NAME'
      ')')
    Left = 96
    Top = 90
    ParamData = <
      item
        Name = 'REC_DATETIME'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ACTION_LABEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'HOST_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG_ACTION'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ASTATE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ADEVICE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ANUM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PINGINFO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PINGSTATUS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PACKET_LOSS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RTA'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FILE_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 137
    Top = 14
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    Left = 252
    Top = 14
  end
  object qrCheckExistingRec: TADQuery
    Connection = conNagios
    SQL.Strings = (
      'SELECT  FILE_NAME FROM TLOG_INFO WHERE FILE_NAME = :FILE_NAME')
    Left = 96
    Top = 147
    ParamData = <
      item
        Name = 'FILE_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrDeleteRecByFilename: TADQuery
    Connection = conNagios
    SQL.Strings = (
      'DELETE FROM TLOG_INFO WHERE FILE_NAME = :FILE_NAME')
    Left = 96
    Top = 205
    ParamData = <
      item
        Name = 'FILE_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrHostName: TADQuery
    Connection = conNagios
    SQL.Strings = (
      'SELECT DISTINCT HOST_NAME FROM TLOG_INFO')
    Left = 96
    Top = 262
  end
  object qrTest: TADQuery
    Connection = conNagios
    SQL.Strings = (
      
        'select *  from  TLOG_INFO WHERE LOG_ACTION = '#39'CHECK_BNKMT'#39' AND H' +
        'OST_NAME = '#39' atm01276-smf-kir19'#39)
    Left = 564
    Top = 18
  end
  object qrUpDown: TADQuery
    Connection = conNagios
    SQL.Strings = (
      'select '
      '  *  '
      'from  '
      '  TLOG_INFO '
      'WHERE '
      '  LOG_ACTION = :LOG_ACTION'
      'AND '
      '  HOST_NAME = :HOST_NAME '
      'AND '
      '  REC_DATETIME >= :START_TIME'
      'AND '
      '  REC_DATETIME <= :END_TIME')
    Left = 96
    Top = 320
    ParamData = <
      item
        Name = 'LOG_ACTION'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'HOST_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'START_TIME'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'END_TIME'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrInsertStatistic: TADQuery
    Connection = conNagios
    SQL.Strings = (
      'INSERT INTO TREPORT'
      '('
      ' HOST_NAME,'#10'  '
      ' CISCO_UP,'#10'  '
      ' CISCO_DOWN,'#10'  '
      ' ATM_UP,'#10'  '
      ' ATM_DOWN,'#10'  '
      ' CISCO_COUNT,'#10'  '
      ' ATM_COUNT'
      ')'
      'VALUES'
      '('
      ' :HOST_NAME,'#10'  '
      ' :CISCO_UP,'#10'  '
      ' :CISCO_DOWN,'#10'  '
      ' :ATM_UP,'#10'  '
      ' :ATM_DOWN,'#10'  '
      ' :CISCO_COUNT,'#10'  '
      ' :ATM_COUNT'
      ')'
      ' ')
    Left = 96
    Top = 378
    ParamData = <
      item
        Name = 'HOST_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CISCO_UP'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CISCO_DOWN'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATM_UP'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATM_DOWN'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CISCO_COUNT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATM_COUNT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrClearReport: TADQuery
    Connection = conNagios
    SQL.Strings = (
      'DELETE FROM TREPORT')
    Left = 258
    Top = 90
  end
  object qrShowReport: TADQuery
    Connection = conNagios
    SQL.Strings = (
      'SELECT  * FROM TREPORT')
    Left = 260
    Top = 147
    object qrShowReportId: TADAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qrShowReportHOST_NAME: TStringField
      FieldName = 'HOST_NAME'
      Origin = 'HOST_NAME'
      Size = 100
    end
    object qrShowReportCISCO_UP: TDateTimeField
      FieldName = 'CISCO_UP'
      Origin = 'CISCO_UP'
      DisplayFormat = 'hh:mm:ss'
    end
    object qrShowReportCISCO_DOWN: TDateTimeField
      FieldName = 'CISCO_DOWN'
      Origin = 'CISCO_DOWN'
      DisplayFormat = 'hh:mm:ss'
    end
    object qrShowReportATM_UP: TDateTimeField
      FieldName = 'ATM_UP'
      Origin = 'ATM_UP'
      DisplayFormat = 'hh:mm:ss'
    end
    object qrShowReportATM_DOWN: TDateTimeField
      FieldName = 'ATM_DOWN'
      Origin = 'ATM_DOWN'
      DisplayFormat = 'hh:mm:ss'
    end
    object qrShowReportCISCO_COUNT: TIntegerField
      FieldName = 'CISCO_COUNT'
      Origin = 'CISCO_COUNT'
    end
    object qrShowReportATM_COUNT: TIntegerField
      FieldName = 'ATM_COUNT'
      Origin = 'ATM_COUNT'
    end
  end
  object dsqShowReport: TDataSource
    DataSet = qrShowReport
    Left = 364
    Top = 147
  end
end
