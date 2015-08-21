object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
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
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnStart: TButton
      Left = 536
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartClick
    end
  end
  object pnlMiddle: TPanel
    Left = 0
    Top = 41
    Width = 635
    Height = 171
    Align = alClient
    TabOrder = 1
    object LbLogLine: TListBox
      Left = 1
      Top = 1
      Width = 412
      Height = 169
      Align = alLeft
      ItemHeight = 13
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 476
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '525'
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 212
    Width = 635
    Height = 88
    Align = alBottom
    TabOrder = 2
  end
end
