object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1062#1041
  ClientHeight = 767
  ClientWidth = 972
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlMain: TPageControl
    Left = 8
    Top = 8
    Width = 956
    Height = 584
    ActivePage = TabSheet311P
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheetVerba: TTabSheet
      Caption = #1042#1077#1088#1073#1072
      object PageControlVerba: TPageControl
        Left = 3
        Top = 3
        Width = 942
        Height = 550
        ActivePage = TabSheetVerbaSignArh
        TabOrder = 0
        object TabSheetVerba311: TTabSheet
          Caption = '311 '#1055#1086#1076#1087#1080#1089#1100
          object Panel9: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            TabOrder = 0
            object CheckListBoxVerba311Sign: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object ButtonVerba311Sign: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
              TabOrder = 1
              OnClick = ButtonVerba311SignClick
            end
            object ButtonVerba311SignRefr: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 2
              OnClick = ButtonVerba311SignRefrClick
            end
            object CheckBoxVerba311SignChAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 3
            end
          end
          object Memo2: TMemo
            Left = 511
            Top = 3
            Width = 420
            Height = 516
            ReadOnly = True
            TabOrder = 1
          end
        end
        object TabSheet2: TTabSheet
          Caption = '311 '#1050#1088#1080#1087#1090#1086#1074#1072#1085#1080#1077
          ImageIndex = 1
          object Panel10: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBoxVerba311Cript: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object ButtonVerba311Cript: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = ButtonVerba311CriptClick
            end
            object CheckBoxVerba311CriptChAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBoxVerba311CriptChAllClick
            end
            object ButtonVerba311CrptRefr: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = ButtonVerba311CrptRefrClick
            end
          end
        end
        object TabSheetVerbaSignArh: TTabSheet
          Caption = #1055#1086#1076#1087#1080#1089#1100' '#1072#1088#1093#1080#1074#1086#1074
          ImageIndex = 2
          object Panel11: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBoxVerbaMailSign: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object ButtonVerbaMailSign: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = ButtonVerbaMailSignClick
            end
            object CheckBoxVerbaMailSignChAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBoxVerbaMailSignChAllClick
            end
            object ButtonVerba311SignRefresh: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = ButtonVerba311SignRefreshClick
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = #1051#1080#1096#1085#1077#1077
          ImageIndex = 3
          object Panel12: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBox6: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object Button14: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
            end
            object CheckBox6: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBox311InSignCheckAllClick
            end
            object Button15: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = Button311InArhRefreshClick
            end
          end
        end
      end
    end
    object TabSheetKKrutilka: TTabSheet
      Caption = #1050#1088#1091#1090#1080#1083#1082#1072
      ImageIndex = 1
      object PageControlKrutilka: TPageControl
        Left = 3
        Top = 3
        Width = 942
        Height = 550
        ActivePage = TabSheet9
        TabOrder = 0
        object TabSheetKrutil311: TTabSheet
          Caption = '311'
          object ProgressBarKrut311: TProgressBar
            Left = 3
            Top = 502
            Width = 238
            Height = 17
            TabOrder = 0
          end
          object CheckListBoxKrut311Action: TCheckListBox
            Left = 3
            Top = 32
            Width = 238
            Height = 465
            ItemHeight = 13
            TabOrder = 1
          end
          object ButtonKrut311Pusk: TButton
            Left = 3
            Top = 3
            Width = 75
            Height = 25
            Caption = #1055#1091#1089#1082
            TabOrder = 2
            OnClick = ButtonKrut311PuskClick
          end
          object CheckBoxKrut311Auto: TCheckBox
            Left = 193
            Top = 9
            Width = 48
            Height = 17
            Caption = #1040#1074#1090#1086
            TabOrder = 3
          end
        end
        object TabSheetkruthron: TTabSheet
          Caption = #1061#1088#1072#1085#1080#1083#1080#1097#1077
          ImageIndex = 1
          object ButtonkrutHronPusk: TButton
            Left = 3
            Top = 3
            Width = 75
            Height = 25
            Caption = #1055#1091#1089#1082
            TabOrder = 0
            OnClick = ButtonkrutHronPuskClick
          end
          object CheckListBoxKrutHron: TCheckListBox
            Left = 3
            Top = 34
            Width = 238
            Height = 465
            ItemHeight = 13
            TabOrder = 1
          end
          object ProgressBarKrutHron: TProgressBar
            Left = 3
            Top = 502
            Width = 238
            Height = 17
            TabOrder = 2
          end
          object CheckBoxKrutXronauto: TCheckBox
            Left = 193
            Top = 9
            Width = 48
            Height = 17
            Caption = #1040#1074#1090#1086
            TabOrder = 3
          end
        end
        object TabSheetKrutVerba: TTabSheet
          Caption = #1042#1077#1088#1073#1072
          ImageIndex = 2
          object ButtonKrutVerbaStart: TButton
            Left = 3
            Top = 3
            Width = 75
            Height = 25
            Caption = #1055#1091#1089#1082
            TabOrder = 0
            OnClick = ButtonKrutVerbaStartClick
          end
          object CheckListBoxKrutVerba: TCheckListBox
            Left = 3
            Top = 34
            Width = 238
            Height = 465
            ItemHeight = 13
            TabOrder = 1
          end
          object ProgressBarKrutVerba: TProgressBar
            Left = 3
            Top = 502
            Width = 238
            Height = 17
            TabOrder = 2
          end
          object CheckBoxKrutVerbaAuto: TCheckBox
            Left = 193
            Top = 9
            Width = 48
            Height = 17
            Caption = #1040#1074#1090#1086
            TabOrder = 3
          end
        end
        object TabSheet9: TTabSheet
          Caption = #1040#1088#1093#1080#1074#1080#1088#1086#1074#1072#1085#1080#1077
          ImageIndex = 3
          object ButtonKrutArhivStart: TButton
            Left = 3
            Top = 3
            Width = 75
            Height = 25
            Caption = #1055#1091#1089#1082
            TabOrder = 0
            OnClick = ButtonKrutArhivStartClick
          end
          object CheckListBoxKrutArhiv: TCheckListBox
            Left = 3
            Top = 34
            Width = 238
            Height = 465
            ItemHeight = 13
            TabOrder = 1
          end
          object ProgressBarKrutArhiv: TProgressBar
            Left = 3
            Top = 502
            Width = 238
            Height = 17
            TabOrder = 2
          end
          object CheckBoxKrutArhAuto: TCheckBox
            Left = 193
            Top = 9
            Width = 48
            Height = 17
            Caption = #1040#1074#1090#1086
            TabOrder = 3
          end
        end
      end
    end
    object TabSheet311P: TTabSheet
      Caption = '311'
      ImageIndex = 2
      object PageControl311P: TPageControl
        Left = 3
        Top = 3
        Width = 942
        Height = 550
        ActivePage = TabSheetInCa
        TabOrder = 0
        object TabSheetSform: TTabSheet
          Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1099#1077
          object Panel1: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            TabOrder = 0
            object CheckListBox311Sform: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
              OnClick = CheckListBox311SformClick
            end
            object Button311SformProverka: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
              TabOrder = 1
              OnClick = Button311SformProverkaClick
            end
            object Button311Refresh: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 2
              OnClick = Button311RefreshClick
            end
            object CheckBox311SformirovAllCheck: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 3
              OnClick = CheckBox311SformirovAllCheckClick
            end
            object CheckBox311SformAuto: TCheckBox
              Left = 445
              Top = 9
              Width = 97
              Height = 17
              Caption = #1040#1074#1090#1086
              TabOrder = 4
            end
          end
          object Memo311SformEdit: TMemo
            Left = 511
            Top = 3
            Width = 420
            Height = 516
            ReadOnly = True
            TabOrder = 1
          end
        end
        object TabSheetInCa: TTabSheet
          Caption = #1053#1072' '#1087#1086#1076#1087#1080#1089#1100
          ImageIndex = 1
          object Panel2: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object Button311InKaOut: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 0
              OnClick = Button311InKaOutClick
            end
            object CheckBox311InKACheckAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 1
              OnClick = CheckBox311InKACheckAllClick
            end
            object Button311InPodbRefresh: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 2
              OnClick = Button311InPodbRefreshClick
            end
            object CheckListBox311InKa: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 3
            end
            object CheckBox311InPodpAuto: TCheckBox
              Left = 441
              Top = 9
              Width = 48
              Height = 17
              Caption = #1040#1074#1090#1086
              TabOrder = 4
            end
          end
        end
        object TabSheetInSign: TTabSheet
          Caption = #1053#1072' '#1082#1088#1080#1087#1090#1086#1074#1072#1085#1080#1077
          ImageIndex = 2
          object Panel3: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBox311InSign: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object Button311InCriptSend: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = Button311InCriptSendClick
            end
            object CheckBox311InSignCheckAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBox311InSignCheckAllClick
            end
            object Button311InSignRefresh: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = Button311InSignRefreshClick
            end
            object CheckBox311InKriptAuto: TCheckBox
              Left = 441
              Top = 9
              Width = 48
              Height = 17
              Caption = #1040#1074#1090#1086
              TabOrder = 4
            end
          end
        end
        object TabSheet311Arh: TTabSheet
          Caption = #1040#1088#1093#1080#1074#1080#1088#1086#1074#1072#1090#1100
          ImageIndex = 3
          object Panel4: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBox311InArh: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object Button311InArhOut: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = Button311InArhOutClick
            end
            object CheckBox311InArhCheckAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBox311InArhCheckAllClick
            end
            object Button311InArhRefresh: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = Button311InArhRefreshClick
            end
            object CheckBox311ArhAuto: TCheckBox
              Left = 441
              Top = 9
              Width = 48
              Height = 17
              Caption = #1040#1074#1090#1086
              TabOrder = 4
            end
          end
        end
      end
    end
    object TabSheetArhiv: TTabSheet
      Caption = #1040#1088#1093#1080#1074#1072#1090#1086#1088
      ImageIndex = 3
      object TabSheetArhivator: TPageControl
        Left = 3
        Top = 3
        Width = 942
        Height = 550
        ActivePage = TabSheet4
        TabOrder = 0
        object TabSheetArhiv311PA: TTabSheet
          Caption = '311A'
          object Panel5: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            TabOrder = 0
            object CheckListBoxArhiv311: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
              OnClick = CheckListBox311SformClick
            end
            object ButtonArh311ABild: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1047#1072#1087#1072#1082#1086#1074#1072#1090#1100
              TabOrder = 1
              OnClick = ButtonArh311ABildClick
            end
            object ButtonArhiv311Refresh: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 2
              OnClick = ButtonArhiv311RefreshClick
            end
            object CheckBoxArhiv311CheckAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 3
              OnClick = CheckBoxArhiv311CheckAllClick
            end
          end
          object Memo1: TMemo
            Left = 511
            Top = 3
            Width = 420
            Height = 516
            ReadOnly = True
            TabOrder = 1
          end
        end
        object TabSheetArhiv311PB: TTabSheet
          Caption = '311B'
          ImageIndex = 1
          object Panel6: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBoxArhiv311B: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object ButtonArh311BBild: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = ButtonArh311BBildClick
            end
            object CheckBoxArhiv311CheckAllB: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBoxArhiv311CheckAllBClick
            end
            object ButtonArhiv311RefreshB: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = ButtonArhiv311RefreshBClick
            end
          end
        end
        object TabSheetArhMail: TTabSheet
          Caption = #1055#1072#1082#1077#1090#1099
          ImageIndex = 2
          object Panel7: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBoxArhivMail: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object ButtonArhMailBild: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = ButtonArhMailBildClick
            end
            object CheckBoxArhMailCheckAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBoxArhMailCheckAllClick
            end
            object ButtonArhMailRefresh: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = ButtonArhMailRefreshClick
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1051#1080#1096#1085#1077#1077
          ImageIndex = 3
          object Panel8: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBox4: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object Button10: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
            end
            object CheckBox4: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBox311InSignCheckAllClick
            end
            object Button11: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = Button311InArhRefreshClick
            end
          end
        end
      end
    end
  end
  object ListBoxActivLog: TListBox
    Left = 8
    Top = 598
    Width = 956
    Height = 161
    ItemHeight = 13
    TabOrder = 1
  end
  object TrayIcon1: TTrayIcon
    Visible = True
    Left = 944
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 920
  end
end
