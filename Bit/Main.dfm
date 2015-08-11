object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Chek BIT'
  ClientHeight = 245
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbFile: TLabel
    Left = 8
    Top = 24
    Width = 20
    Height = 13
    Caption = 'File:'
  end
  object btnPath: TSpeedButton
    Left = 279
    Top = 20
    Width = 32
    Height = 22
    Caption = '>>>'
    Flat = True
    Layout = blGlyphTop
    OnClick = btnPathClick
  end
  object lbResult: TLabel
    Left = 144
    Top = 88
    Width = 12
    Height = 13
    Caption = '...'
  end
  object btnCheck: TButton
    Left = 122
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Check BIT'
    TabOrder = 0
    OnClick = btnCheckClick
  end
  object edFilePath: TEdit
    Left = 56
    Top = 21
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object dlgOpen: TOpenDialog
    Filter = 'EXE|*.exe|DLL|*.DLL'
    Left = 256
    Top = 72
  end
end
