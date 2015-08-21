object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1062#1041
  ClientHeight = 600
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
    ActivePage = TabSheetArhiv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheetVerba: TTabSheet
      Caption = #1042#1077#1088#1073#1072
    end
    object TabSheetKKrutilka: TTabSheet
      Caption = #1050#1088#1091#1090#1080#1083#1082#1072
      ImageIndex = 1
    end
    object TabSheet311P: TTabSheet
      Caption = '311'
      ImageIndex = 2
      object PageControl311P: TPageControl
        Left = 3
        Top = 3
        Width = 942
        Height = 550
        ActivePage = TabSheet311Arh
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
            object CheckListBox311InKa: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object Button311InKaOut: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = Button311InKaOutClick
            end
            object CheckBox311InKACheckAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBox311InKACheckAllClick
            end
            object Button1: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = Button1Click
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
            object Button2: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = Button2Click
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
          end
        end
        object TabSheet311Arh: TTabSheet
          Caption = #1040#1088#1093#1080#1074#1080#1088#1086#1074#1072#1085#1080#1077
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
            object Button3: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
            end
            object CheckBox311InArhCheckAll: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBox311InSignCheckAllClick
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
          end
        end
      end
    end
    object TabSheetArhiv: TTabSheet
      Caption = #1040#1088#1093#1080#1074#1072#1090#1086#1088
      ImageIndex = 3
      object PageControlArhiv: TPageControl
        Left = 3
        Top = 3
        Width = 942
        Height = 550
        ActivePage = TabSheetArhiv311P
        TabOrder = 0
        object TabSheetArhiv311P: TTabSheet
          Caption = '311'
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
            object Button4: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1047#1072#1087#1072#1082#1086#1074#1072#1090#1100
              TabOrder = 1
              OnClick = Button311SformProverkaClick
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
        object TabSheet2: TTabSheet
          Caption = #1053#1072' '#1087#1086#1076#1087#1080#1089#1100
          ImageIndex = 1
          object Panel6: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBox2: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object Button6: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = Button311InKaOutClick
            end
            object CheckBox2: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBox311InKACheckAllClick
            end
            object Button7: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = Button1Click
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = #1053#1072' '#1082#1088#1080#1087#1090#1086#1074#1072#1085#1080#1077
          ImageIndex = 2
          object Panel7: TPanel
            Left = 3
            Top = 3
            Width = 502
            Height = 516
            BorderStyle = bsSingle
            Caption = 'Panel2'
            TabOrder = 0
            object CheckListBox3: TCheckListBox
              Left = 8
              Top = 32
              Width = 481
              Height = 473
              ItemHeight = 13
              TabOrder = 0
            end
            object Button8: TButton
              Left = 8
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = Button2Click
            end
            object CheckBox3: TCheckBox
              Left = 170
              Top = 9
              Width = 97
              Height = 17
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = CheckBox311InSignCheckAllClick
            end
            object Button9: TButton
              Left = 89
              Top = 1
              Width = 75
              Height = 25
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 3
              OnClick = Button311InSignRefreshClick
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1040#1088#1093#1080#1074#1080#1088#1086#1074#1072#1085#1080#1077
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
end
