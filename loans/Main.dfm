object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 725
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBListBox1: TDBListBox
    Left = 8
    Top = 8
    Width = 249
    Height = 625
    DataField = 'AGREEMENT_NUM'
    DataSource = DMData.dsAny
    ItemHeight = 13
    Items.Strings = (
      'gg'
      'ggg')
    TabOrder = 0
  end
end