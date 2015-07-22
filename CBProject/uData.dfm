object dmData: TdmData
  OldCreateOrder = False
  Height = 386
  Width = 573
  object drvMySqlLink: TADPhysMySQLDriverLink
    Left = 24
    Top = 8
  end
  object conCB: TADConnection
    Params.Strings = (
      'Server=10.3.0.231'
      'User_Name=mysqladm'
      'Database=CB'
      'DriverID=MySQL'
      'Password=Simf0000')
    LoginPrompt = False
    Left = 88
    Top = 8
  end
  object qrGetPath: TADQuery
    Connection = conCB
    SQL.Strings = (
      'select * from Path_311 where Id=:pathId')
    Left = 24
    Top = 96
    ParamData = <
      item
        Name = 'PATHID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 160
    Top = 16
  end
end
