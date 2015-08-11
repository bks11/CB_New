object Form3: TForm3
  Left = 1063
  Top = 233
  Width = 459
  Height = 273
  Caption = 'Form3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Query1: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Select Count(NameFile) as Col From 311P where NameFile=:Name')
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
        Value = ''
      end>
  end
  object Query2: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      
        'Insert Into 311P (NameFile,FIO,DateFile,Operator,Acc,Shema,NameA' +
        'rh) Values (:Name,:FIO,:DateFile,:Operator,:Acc,:Shema,:NamArh)')
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateFile'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Acc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Shema'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NamArh'
        ParamType = ptUnknown
      end>
  end
  object Query3: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Select Shema From 311P where NameFile=:Name')
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object Query4: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Select Count(NameArh) AS Col'
      'FROM'
      '(SELECT DISTINCT NameArh'
      'FROM 311P'
      'where'
      'Year(DateFile) = Year(Now) and'
      'Month(DateFile) = Month(Now) and'
      'Day(DateFile) = Day(Now) and'
      'NameArh Like :Shema1'
      'Union'
      'SELECT DISTINCT NameArh'
      'FROM 3251P'
      'where'
      'Year(DateFile) = Year(Now) and'
      'Month(DateFile) = Month(Now) and'
      'Day(DateFile) = Day(Now) and'
      'NameArh Like :Shema2)')
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Shema1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Shema2'
        ParamType = ptUnknown
      end>
  end
  object Query5: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Select Kount From Post Where Name=:Name')
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object Query6: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Update Post Set Kount=:Kol where Name=:Name')
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Kol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object Query7: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Select * From 311P where NameFile=:Name')
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object Query8: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Select Count(NameFile) as Col From 3251P where NameFile=:Name')
    Left = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
        Value = ''
      end>
  end
  object Query9: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Select * From 3251P where NameFile=:Name')
    Left = 32
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object Query10: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      
        'Insert Into 3251P (NameFile,FIO,DateFile,Operator,Acc,Shema,Name' +
        'Arh) Values (:Name,:FIO,:DateFile,:Operator,:Acc,:Shema,:NamArh)')
    Left = 32
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateFile'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Acc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Shema'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NamArh'
        ParamType = ptUnknown
      end>
  end
  object Query11: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Update Post Set Kount=1')
    Left = 416
  end
  object Query12: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      
        'Insert Into Log (DateLog, Grup, Masage) Values (:DateLog,:Grup,:' +
        'Masage)')
    Left = 416
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateLog'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Grup'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Masage'
        ParamType = ptUnknown
      end>
  end
  object Query13: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'select Last from 211P')
    Left = 64
  end
  object Query14: TQuery
    DatabaseName = 'CB'
    SQL.Strings = (
      'Update 211P Set Last=:Kol')
    Left = 64
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Kol'
        ParamType = ptUnknown
      end>
  end
end
