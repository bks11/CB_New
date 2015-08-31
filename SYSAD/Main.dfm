object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 346
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 63
    Align = alTop
    TabOrder = 0
    object lbLogFileName: TLabel
      Left = 4
      Top = 3
      Width = 12
      Height = 13
      Caption = '...'
    end
    object lbFrom: TLabel
      Left = 4
      Top = 22
      Width = 28
      Height = 13
      Caption = 'From:'
    end
    object lbTo: TLabel
      Left = 172
      Top = 22
      Width = 16
      Height = 13
      Caption = 'To:'
    end
    object btnOpen: TButton
      Left = 546
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnOpenClick
    end
    object btnStart: TButton
      Left = 546
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Load'
      TabOrder = 1
      OnClick = btnStartClick
    end
    object btnReport: TButton
      Left = 324
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Report'
      TabOrder = 2
      OnClick = btnReportClick
    end
    object dtFrom: TDateTimePicker
      Left = 4
      Top = 36
      Width = 121
      Height = 21
      Date = 42246.010183807870000000
      Time = 42246.010183807870000000
      TabOrder = 3
    end
    object dtTO: TDateTimePicker
      Left = 172
      Top = 36
      Width = 131
      Height = 21
      Date = 42246.010386018520000000
      Time = 42246.010386018520000000
      TabOrder = 4
    end
  end
  object pnlMiddle: TPanel
    Left = 0
    Top = 63
    Width = 635
    Height = 215
    Align = alClient
    TabOrder = 1
    ExplicitTop = 60
    ExplicitHeight = 246
    object grdReport: TDBGrid
      Left = 1
      Top = 1
      Width = 633
      Height = 213
      Align = alClient
      DataSource = dmData.dsqShowReport
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'HOST_NAME'
          Width = 178
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CISCO_UP'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CISCO_DOWN'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATM_UP'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATM_DOWN'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CISCO_COUNT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATM_COUNT'
          Visible = True
        end>
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 278
    Width = 635
    Height = 68
    Align = alBottom
    TabOrder = 2
    object lbRecCount: TLabel
      Left = 4
      Top = 6
      Width = 12
      Height = 13
      Caption = '...'
    end
    object pbRecordsInsert: TProgressBar
      Left = 1
      Top = 33
      Width = 633
      Height = 17
      Align = alBottom
      Smooth = True
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 3
    end
    object sbInfo: TStatusBar
      Left = 1
      Top = 50
      Width = 633
      Height = 17
      Panels = <
        item
          Width = 100
        end
        item
          Width = 50
        end
        item
          Width = 50
        end
        item
          Width = 50
        end>
      ExplicitTop = 56
    end
  end
  object dlgOpen: TOpenDialog
    Filter = 'LOG File|*.log'
    Left = 486
    Top = 10
  end
end
