object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 742
  ClientWidth = 1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 225
    Top = 0
    Height = 610
    ExplicitLeft = 274
    ExplicitTop = 120
    ExplicitHeight = 100
  end
  object MainPageControl: TPageControl
    Left = 228
    Top = 0
    Width = 853
    Height = 610
    ActivePage = AllInfo
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 356
    ExplicitWidth = 725
    object AllInfo: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1087#1086#1088#1090#1092#1077#1083#1102
      ExplicitWidth = 838
      object lbKredSumHeader: TLabel
        Left = 16
        Top = 5
        Width = 86
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1082#1088#1077#1076#1080#1090#1086#1074' '
      end
      object lbDebtSumHeader: TLabel
        Left = 223
        Top = 5
        Width = 113
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      end
      object lbOutDateSumHeader: TLabel
        Left = 430
        Top = 5
        Width = 87
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1089#1088#1086#1095#1082#1080
      end
      object lbPercentSumHeader: TLabel
        Left = 637
        Top = 5
        Width = 101
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1089#1088#1086#1095#1082#1080' %'
      end
      object pnlKredSum: TPanel
        Left = 16
        Top = 24
        Width = 205
        Height = 145
        BorderStyle = bsSingle
        TabOrder = 0
        object MainInfoPortfelSumRUR: TLabel
          Left = 8
          Top = 8
          Width = 115
          Height = 13
          Caption = 'MainInfoPortfelSumRUR'
        end
        object MainInfoPortfelSumUSD: TLabel
          Left = 8
          Top = 34
          Width = 114
          Height = 13
          Caption = 'MainInfoPortfelSumUSD'
        end
        object MainInfoPortfelSumEUR: TLabel
          Left = 8
          Top = 60
          Width = 114
          Height = 13
          Caption = 'MainInfoPortfelSumEUR'
        end
        object MainInfoPortfelSumUAH: TLabel
          Left = 8
          Top = 86
          Width = 115
          Height = 13
          Caption = 'MainInfoPortfelSumUAH'
        end
        object MainInfoSumLoansEcv: TLabel
          Left = 8
          Top = 112
          Width = 107
          Height = 13
          Caption = 'MainInfoSumLoansEcv'
        end
      end
      object pnlDebtSum: TPanel
        Left = 221
        Top = 24
        Width = 205
        Height = 145
        BorderStyle = bsSingle
        TabOrder = 1
        object MainInfoPortfelSumZRUR: TLabel
          Left = 8
          Top = 8
          Width = 121
          Height = 13
          Caption = 'MainInfoPortfelSumZRUR'
        end
        object MainInfoPortfelSumZUSD: TLabel
          Left = 8
          Top = 35
          Width = 120
          Height = 13
          Caption = 'MainInfoPortfelSumZUSD'
        end
        object MainInfoPortfelSumZEUR: TLabel
          Left = 8
          Top = 62
          Width = 120
          Height = 13
          Caption = 'MainInfoPortfelSumZEUR'
        end
        object MainInfoPortfelSumZUAH: TLabel
          Left = 8
          Top = 89
          Width = 121
          Height = 13
          Caption = 'MainInfoPortfelSumZUAH'
        end
        object MainInfoSumZadEcv: TLabel
          Left = 8
          Top = 112
          Width = 97
          Height = 13
          Caption = 'MainInfoSumZadEcv'
        end
      end
      object pnlOutDateSum: TPanel
        Left = 426
        Top = 24
        Width = 205
        Height = 145
        BorderStyle = bsSingle
        TabOrder = 2
        object MainInfoPortfelSumTRUR: TLabel
          Left = 8
          Top = 10
          Width = 121
          Height = 13
          Caption = 'MainInfoPortfelSumZRUR'
        end
        object MainInfoPortfelSumTUSD: TLabel
          Left = 8
          Top = 37
          Width = 120
          Height = 13
          Caption = 'MainInfoPortfelSumZUSD'
        end
        object MainInfoPortfelSumTEUR: TLabel
          Left = 8
          Top = 64
          Width = 120
          Height = 13
          Caption = 'MainInfoPortfelSumZEUR'
        end
        object MainInfoPortfelSumTUAH: TLabel
          Left = 8
          Top = 91
          Width = 121
          Height = 13
          Caption = 'MainInfoPortfelSumZUAH'
        end
        object MainInfoSumprosEcv: TLabel
          Left = 8
          Top = 112
          Width = 100
          Height = 13
          Caption = 'MainInfoSumprosEcv'
        end
      end
      object pnlPercentSum: TPanel
        Left = 631
        Top = 24
        Width = 205
        Height = 145
        BorderStyle = bsSingle
        TabOrder = 3
        object MainInfoPortfelSumPRUR: TLabel
          Left = 8
          Top = 7
          Width = 121
          Height = 13
          Caption = 'MainInfoPortfelSumZRUR'
        end
        object MainInfoPortfelSumPUSD: TLabel
          Left = 8
          Top = 34
          Width = 120
          Height = 13
          Caption = 'MainInfoPortfelSumZUSD'
        end
        object MainInfoPortfelSumPEUR: TLabel
          Left = 8
          Top = 61
          Width = 120
          Height = 13
          Caption = 'MainInfoPortfelSumZEUR'
        end
        object MainInfoPortfelSumPUAH: TLabel
          Left = 8
          Top = 88
          Width = 121
          Height = 13
          Caption = 'MainInfoPortfelSumZUAH'
        end
        object MainInfoSumProcEcv: TLabel
          Left = 8
          Top = 112
          Width = 100
          Height = 13
          Caption = 'MainInfoSumProcEcv'
        end
      end
    end
    object LoansInfo: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091
      ImageIndex = 1
      ExplicitWidth = 838
      object lbDebtInfoHeader: TLabel
        Left = 16
        Top = 3
        Width = 132
        Height = 13
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1076#1086#1083#1078#1085#1080#1082#1091
      end
      object lbLoanInfoHeader: TLabel
        Left = 424
        Top = 3
        Width = 124
        Height = 13
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091
      end
      object pnlKredInfo: TPanel
        Left = 16
        Top = 22
        Width = 402
        Height = 294
        BorderStyle = bsSingle
        TabOrder = 0
        object LoansInfoFIOLoaner: TLabel
          Left = 8
          Top = 5
          Width = 114
          Height = 16
          Caption = 'LoansInfoFIOLoaner'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoAdres2Loader: TLabel
          Left = 8
          Top = 130
          Width = 134
          Height = 16
          Caption = 'LoansInfoAdres2Loader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoFoneLoader: TLabel
          Left = 8
          Top = 155
          Width = 122
          Height = 16
          Caption = 'LoansInfoFoneLoader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoAdres1Loader: TLabel
          Left = 8
          Top = 105
          Width = 134
          Height = 16
          Caption = 'LoansInfoAdres1Loader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoPasDat: TLabel
          Left = 8
          Top = 80
          Width = 94
          Height = 16
          Caption = 'LoansInfoPasDat'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoPasNumoader: TLabel
          Left = 8
          Top = 55
          Width = 134
          Height = 16
          Caption = 'LoansInfoPasNumoader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoINNLoader: TLabel
          Left = 8
          Top = 30
          Width = 114
          Height = 16
          Caption = 'LoansInfoINNLoader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoPoruchitel: TLabel
          Left = 8
          Top = 180
          Width = 95
          Height = 13
          Caption = 'LoansInfoPoruchitel'
        end
        object DBGrid1: TDBGrid
          Left = 8
          Top = 203
          Width = 385
          Height = 87
          DataSource = DMData.DataSourceLoanerInfoByLoans
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LOANER'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'FIRSTNAME'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LASTNAME'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MIDDLENAME'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INN'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PASSPORTSERIAL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PASSPORTNUM'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PASSPORT_ISSUE_DATE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PASSPORT_ISSUE_ORG'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ADDRESS1'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ADDRESS2'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PHONE1'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PHONE2'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOTE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IS_GUARANTOR'
              Visible = False
            end>
        end
      end
      object pnlLoanInfo: TPanel
        Left = 424
        Top = 19
        Width = 375
        Height = 297
        BorderStyle = bsSingle
        TabOrder = 1
        object LoansInfoValLoans: TLabel
          Left = 8
          Top = 57
          Width = 106
          Height = 16
          Caption = 'LoansInfoValLoans'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoDateLoans: TLabel
          Left = 8
          Top = 8
          Width = 114
          Height = 16
          Caption = 'LoansInfoDateLoans'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoSumValLoans: TLabel
          Left = 8
          Top = 32
          Width = 132
          Height = 16
          Caption = 'LoansInfoSumValLoans'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoDateEndLoans: TLabel
          Left = 8
          Top = 82
          Width = 135
          Height = 16
          Caption = 'LoansInfoDateEndLoans'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoDebtLoans: TLabel
          Left = 8
          Top = 107
          Width = 114
          Height = 16
          Caption = 'LoansInfoDebtLoans'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoDebtNacValLoans: TLabel
          Left = 8
          Top = 134
          Width = 153
          Height = 16
          Caption = 'LoansInfoDebtNacValLoans'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoDEBTOUTOFDATE: TLabel
          Left = 8
          Top = 156
          Width = 157
          Height = 16
          Caption = 'LoansInfoDEBTOUTOFDATE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoDEBTOUTOFDATEEQ: TLabel
          Left = 8
          Top = 181
          Width = 173
          Height = 16
          Caption = 'LoansInfoDEBTOUTOFDATEEQ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoPERCENTOUTOFDATE: TLabel
          Left = 8
          Top = 206
          Width = 180
          Height = 16
          Caption = 'LoansInfoPERCENTOUTOFDATE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoPERCENTOUTOFDATEEQ: TLabel
          Left = 8
          Top = 231
          Width = 196
          Height = 16
          Caption = 'LoansInfoPERCENTOUTOFDATEEQ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LoansInfoCOMMISSIONAMOUNT: TLabel
          Left = 8
          Top = 256
          Width = 184
          Height = 16
          Caption = 'LoansInfoCOMMISSIONAMOUNT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object Dosudebka: TTabSheet
      Caption = #1044#1086#1089#1091#1076#1077#1073#1085#1099#1077' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
      ImageIndex = 2
      ExplicitWidth = 838
      object lbBeforeJudPeriodHeader: TLabel
        Left = 8
        Top = 0
        Width = 154
        Height = 13
        Caption = #1056#1072#1073#1086#1090#1072' '#1085#1072' '#1076#1086#1089#1091#1076#1077#1073#1085#1086#1081' '#1089#1090#1072#1076#1080#1080
      end
      object lbAddNewActionHeader: TLabel
        Left = 0
        Top = 363
        Width = 845
        Height = 13
        Align = alTop
        Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1076#1077#1081#1089#1090#1074#1080#1103
        ExplicitWidth = 151
      end
      object pnlBefoJudPeriod: TPanel
        Left = 0
        Top = 0
        Width = 845
        Height = 363
        Align = alTop
        BorderStyle = bsSingle
        TabOrder = 0
        ExplicitWidth = 838
        object DBGridDosudebkaList: TDBGrid
          Left = 1
          Top = 1
          Width = 839
          Height = 357
          Align = alClient
          DataSource = DMData.DataSourceDosudebkaList
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGridDosudebkaListCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_JUDJORNAL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_LOAN'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ACTION_DATE'
              Title.Caption = #1044#1040#1058#1040' '#1057#1054#1041#1067#1058#1048#1071
              Title.Color = clSkyBlue
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_USER'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOTE'
              Title.Caption = #1054#1055#1048#1057#1040#1053#1048#1045' '#1057#1054#1041#1067#1058#1048#1071
              Title.Color = clSkyBlue
              Width = 640
              Visible = True
            end>
        end
      end
      object pnlAddNewJudAction: TPanel
        Left = 0
        Top = 376
        Width = 845
        Height = 206
        Align = alClient
        BorderStyle = bsSingle
        TabOrder = 1
        ExplicitWidth = 838
        object lbFullDescriptHeader: TLabel
          Left = 16
          Top = 16
          Width = 157
          Height = 13
          Caption = #1055#1086#1076#1088#1086#1073#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
        end
        object lbEventDateActHeader: TLabel
          Left = 432
          Top = 16
          Width = 72
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1086#1073#1099#1090#1080#1103
        end
        object MemoDosudebka: TMemo
          Left = 16
          Top = 32
          Width = 401
          Height = 185
          Lines.Strings = (
            '')
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object MonthCalendarDosudebnoe: TMonthCalendar
          Left = 432
          Top = 35
          Width = 191
          Height = 182
          Date = 42229.578261608800000000
          TabOrder = 1
        end
        object ButtonDosudebkaAdd: TButton
          Left = 648
          Top = 32
          Width = 121
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 2
          OnClick = ButtonDosudebkaAddClick
        end
        object ButtonDosudebkaEdit: TButton
          Left = 648
          Top = 64
          Width = 121
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          Enabled = False
          TabOrder = 3
          OnClick = ButtonDosudebkaEditClick
        end
        object ButtonDosudebkaDel: TButton
          Left = 648
          Top = 95
          Width = 121
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Enabled = False
          TabOrder = 4
          OnClick = ButtonDosudebkaDelClick
        end
      end
    end
    object Admins: TTabSheet
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 3
      ExplicitWidth = 838
      object EditBDSvazi: TPageControl
        Left = 3
        Top = 3
        Width = 796
        Height = 326
        ActivePage = TabSheetAdminkaKurses
        TabOrder = 0
        object UsersVsLoans: TTabSheet
          Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082'-'#1050#1088#1077#1076#1080#1090
          object lbEmplAdmHeader: TLabel
            Left = 3
            Top = 0
            Width = 62
            Height = 13
            Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
          end
          object lbLoanAdmHeader: TLabel
            Left = 391
            Top = 3
            Width = 46
            Height = 13
            Caption = #1050#1088#1077#1076#1080#1090#1099
          end
          object CheckListBoxAdminLoans: TCheckListBox
            Left = 391
            Top = 19
            Width = 394
            Height = 276
            OnClickCheck = CheckListBoxAdminLoansClickCheck
            ItemHeight = 13
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5')
            TabOrder = 0
          end
          object DBGridAdminUsersFromLOans: TDBGrid
            Left = 3
            Top = 19
            Width = 342
            Height = 278
            DataSource = DMData.DataSourceUsers
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGridAdminUsersFromLOansCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_USER'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'LASTNAME'
                Title.Caption = #1060#1040#1052#1048#1051#1048#1071
                Title.Color = clMoneyGreen
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FIRSTNAME'
                Title.Caption = #1048#1052#1071
                Title.Color = clMoneyGreen
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MIDDLENAME'
                Title.Caption = #1054#1058#1063#1045#1057#1058#1042#1054
                Title.Color = clMoneyGreen
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'USER_LOGIN'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'USER_PASSWORD'
                Visible = False
              end>
          end
        end
        object LoansVsLoaner: TTabSheet
          Caption = #1050#1088#1077#1076#1080#1090'-'#1044#1086#1083#1078#1085#1080#1082' '
          ImageIndex = 1
          object lbLoanListHeader: TLabel
            Left = 8
            Top = 0
            Width = 46
            Height = 13
            Caption = #1050#1088#1077#1076#1080#1090#1099
          end
          object lbDebtHeader: TLabel
            Left = 416
            Top = 0
            Width = 52
            Height = 13
            Caption = #1044#1086#1083#1078#1085#1080#1082#1080
          end
          object DBGridLoansLVSL: TDBGrid
            Left = 3
            Top = 19
            Width = 353
            Height = 276
            DataSource = DMData.DataSourceLoans
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGridLoansLVSLCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_LOAN'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'AGREEMENT_NUM'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ISSUE_DATE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'LOAN_SUMM'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'LOAN_CURRENCY'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'END_DATE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TOTAL_CREDIT_SUMM'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TOTAL_CREDIT_SUMM_EQ'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DEBT_OUT_OF_DATE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DEBT_OUT_OF_DATE_EQ'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PERCENT_OUT_OF_DATE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PERCENT_OUT_OF_DATE_EQ'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COMMISSION_AMOUNT'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'FIRST_CREDITOR'
                Visible = False
              end>
          end
          object DBGridLoanserLVsL: TDBGrid
            Left = 416
            Top = 19
            Width = 369
            Height = 276
            DataSource = DMData.DataSourceLoanser
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGridLoanserLVsLCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_LOANER'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'FIRSTNAME'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LASTNAME'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MIDDLENAME'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INN'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PASSPORTSERIAL'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PASSPORTNUM'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PASSPORT_ISSUE_DATE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PASSPORT_ISSUE_ORG'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ADDRESS1'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ADDRESS2'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PHONE1'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PHONE2'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NOTE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IS_GUARANTOR'
                Visible = False
              end>
          end
          object ButtonAddLVsL: TButton
            Left = 360
            Top = 104
            Width = 52
            Height = 57
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = ButtonAddLVsLClick
          end
        end
        object TabSheetAdminkaKurses: TTabSheet
          Caption = #1050#1091#1088#1089#1099
          ImageIndex = 2
          object Label1: TLabel
            Left = 130
            Top = 191
            Width = 20
            Height = 13
            Caption = 'USD'
          end
          object Label2: TLabel
            Left = 130
            Top = 218
            Width = 20
            Height = 13
            Caption = 'EUR'
          end
          object Label3: TLabel
            Left = 130
            Top = 245
            Width = 21
            Height = 13
            Caption = 'UAH'
          end
          object MonthCalendarAdmCurses: TMonthCalendar
            Left = 3
            Top = 3
            Width = 191
            Height = 182
            Date = 42229.578261701390000000
            TabOrder = 0
            OnClick = MonthCalendarAdmCursesClick
          end
          object EditAdmCursUsd: TEdit
            Left = 3
            Top = 191
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object EditAdmCursEur: TEdit
            Left = 3
            Top = 218
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object EditAdmCursUah: TEdit
            Left = 3
            Top = 243
            Width = 121
            Height = 21
            TabOrder = 3
          end
          object ButtonAdmCursAdd: TButton
            Left = 3
            Top = 270
            Width = 75
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            Enabled = False
            TabOrder = 4
            OnClick = ButtonAdmCursAddClick
          end
          object ButtonAdmCursSave: TButton
            Left = 84
            Top = 270
            Width = 75
            Height = 25
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            Enabled = False
            TabOrder = 5
            OnClick = ButtonAdmCursSaveClick
          end
        end
      end
      object EditBDTable: TPageControl
        Left = 3
        Top = 335
        Width = 796
        Height = 275
        ActivePage = Loaner
        TabOrder = 1
        object Users: TTabSheet
          Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
          object DBGridUsers: TDBGrid
            Left = 8
            Top = 3
            Width = 774
            Height = 241
            DataSource = DMData.DataSourceUsers
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_USER'
                Title.Caption = 'ID'
                Title.Color = clMoneyGreen
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FIRSTNAME'
                Title.Caption = #1048#1052#1071
                Title.Color = clMoneyGreen
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MIDDLENAME'
                Title.Caption = #1054#1058#1063#1045#1057#1058#1042#1054
                Title.Color = clMoneyGreen
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LASTNAME'
                Title.Caption = #1060#1040#1052#1048#1051#1048#1071
                Title.Color = clMoneyGreen
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTE'
                Title.Color = clMoneyGreen
                Width = 230
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'USER_LOGIN'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'USER_PASSWORD'
                Title.Color = clMoneyGreen
                Visible = False
              end>
          end
        end
        object Loans: TTabSheet
          Caption = #1050#1088#1077#1076#1080#1090#1099
          ImageIndex = 1
          object DBGridLoans: TDBGrid
            Left = 8
            Top = 8
            Width = 769
            Height = 236
            DataSource = DMData.DataSourceLoans
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_LOAN'
                Title.Caption = #1064#1042
                Title.Color = clMoneyGreen
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AGREEMENT_NUM'
                Title.Caption = #1053#1054#1052#1045#1056' '#1044#1054#1043#1054#1042#1054#1056#1040
                Title.Color = clMoneyGreen
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ISSUE_DATE'
                Title.Caption = #1044#1040#1058#1040' '#1042#1067#1044#1040#1063#1048
                Title.Color = clMoneyGreen
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOAN_SUMM'
                Title.Caption = #1057#1059#1052#1052#1040
                Title.Color = clMoneyGreen
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOAN_CURRENCY'
                Title.Caption = #1042#1040#1051#1070#1058#1040' '#1050#1056#1045#1044#1048#1058#1040
                Title.Color = clMoneyGreen
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'END_DATE'
                Title.Caption = #1044#1040#1058#1040' '#1054#1050#1054#1053#1063#1040#1053#1048#1071
                Title.Color = clMoneyGreen
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_CREDIT_SUMM'
                Title.Caption = #1054#1041#1065'. '#1057#1059#1052#1052#1040' '#1044#1054#1051#1043#1040
                Title.Color = clMoneyGreen
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_CREDIT_SUMM_EQ'
                Title.Caption = #1054#1041#1065'. '#1057#1059#1052#1052#1040' '#1044#1054#1051#1043#1040' '#1045#1050#1042'.'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DEBT_OUT_OF_DATE'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DEBT_OUT_OF_DATE_EQ'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PERCENT_OUT_OF_DATE'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PERCENT_OUT_OF_DATE_EQ'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COMMISSION_AMOUNT'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'FIRST_CREDITOR'
                Title.Color = clMoneyGreen
                Visible = False
              end>
          end
        end
        object Loaner: TTabSheet
          Caption = #1044#1086#1083#1078#1085#1080#1082#1080
          ImageIndex = 2
          object DBGridLoanser: TDBGrid
            Left = 8
            Top = 8
            Width = 769
            Height = 236
            DataSource = DMData.DataSourceLoanser
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_LOANER'
                Title.Caption = 'ID'
                Title.Color = clMoneyGreen
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FIRSTNAME'
                Title.Caption = #1048#1052#1071
                Title.Color = clMoneyGreen
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LASTNAME'
                Title.Caption = #1060#1040#1052#1048#1051#1048#1071
                Title.Color = clMoneyGreen
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MIDDLENAME'
                Title.Color = clMoneyGreen
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INN'
                Title.Color = clMoneyGreen
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PASSPORTSERIAL'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PASSPORTNUM'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PASSPORT_ISSUE_DATE'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PASSPORT_ISSUE_ORG'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ADDRESS1'
                Title.Caption = #1040#1044#1056#1045#1057
                Title.Color = clMoneyGreen
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ADDRESS2'
                Title.Color = clMoneyGreen
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PHONE1'
                Title.Caption = #1058#1045#1051#1045#1060#1054#1053
                Title.Color = clMoneyGreen
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PHONE2'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NOTE'
                Title.Color = clMoneyGreen
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IS_GUARANTOR'
                Title.Color = clMoneyGreen
                Visible = True
              end>
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1054#1088#1075#1072#1085#1072#1081#1079#1077#1088
      ImageIndex = 4
      ExplicitWidth = 838
      object DBGridOrganaizerFul: TDBGrid
        Left = 3
        Top = 191
        Width = 830
        Height = 420
        DataSource = DMData.DataSourceOrganaizerFul
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_JUDJORNAL'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ACTION_DATE'
            Title.Caption = #1044#1072#1090#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LASTNAME'
            Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTE'
            Width = 600
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IS_COMPLETED'
            Visible = False
          end>
      end
      object MonthCalendar1: TMonthCalendar
        Left = 644
        Top = 3
        Width = 191
        Height = 182
        Date = 42229.578261770830000000
        TabOrder = 1
      end
      object ButtonOrganaizerComplit: TButton
        Left = 3
        Top = 160
        Width = 75
        Height = 25
        Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
        TabOrder = 2
        OnClick = ButtonOrganaizerComplitClick
      end
      object CheckBoxOrganaizerCompl: TCheckBox
        Left = 484
        Top = 168
        Width = 97
        Height = 17
        Caption = #1048#1089#1087#1086#1083#1085#1077#1085#1085#1099#1077
        TabOrder = 3
        OnClick = CheckBoxOrganaizerComplClick
      end
    end
  end
  object sbInfo: TStatusBar
    Left = 0
    Top = 723
    Width = 1081
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 150
      end>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 610
    Width = 1081
    Height = 113
    Align = alBottom
    Caption = 'pnlBottom'
    TabOrder = 2
    object lbLogin: TLabel
      Left = 743
      Top = 35
      Width = 97
      Height = 13
      Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
    end
    object lbPassword: TLabel
      Left = 743
      Top = 67
      Width = 41
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100':'
    end
    object DBGridOrganaizer: TDBGrid
      Left = 8
      Top = 6
      Width = 729
      Height = 107
      DataSource = DMData.DSMainOrganaizer
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ACTION_DATE'
          Title.Caption = #1044#1040#1058#1040' '#1057#1054#1041#1067#1058#1048#1071
          Title.Color = clSkyBlue
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTE'
          Title.Caption = #1054#1055#1048#1057#1040#1053#1048#1045' '#1057#1054#1041#1067#1058#1048#1071
          Title.Color = clSkyBlue
          Width = 590
          Visible = True
        end>
    end
    object edLogin: TEdit
      Left = 851
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'k'
    end
    object edPassword: TEdit
      Left = 851
      Top = 67
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      Text = '1'
    end
    object btnLogin: TButton
      Left = 986
      Top = 62
      Width = 75
      Height = 25
      Caption = #1042#1093#1086#1076
      TabOrder = 3
      OnClick = btnLoginClick
    end
    object btnChengePas: TButton
      Left = 986
      Top = 30
      Width = 75
      Height = 25
      Caption = #1057#1084#1077#1085#1080#1090#1100
      TabOrder = 4
      OnClick = btnChengePasClick
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 610
    Align = alLeft
    TabOrder = 3
    object MainLoansList: TDBGrid
      Left = 1
      Top = 33
      Width = 223
      Height = 576
      Align = alClient
      DataSource = DMData.dsqLoanInfo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = mnuFieldsSwitch
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = MainLoansListCellClick
      OnDrawColumnCell = MainLoansListDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'fio'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LOAN'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AGREEMENT_NUM'
          Title.Caption = #1050#1088#1077#1076#1080#1090
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ISSUE_DATE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LOAN_SUMM'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LOAN_CURRENCY'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'END_DATE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TOTAL_CREDIT_SUMM'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TOTAL_CREDIT_SUMM_EQ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEBT_OUT_OF_DATE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEBT_OUT_OF_DATE_EQ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PERCENT_OUT_OF_DATE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PERCENT_OUT_OF_DATE_EQ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COMMISSION_AMOUNT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FIRST_CREDITOR'
          Visible = False
        end>
    end
    object pnlShowPayd: TPanel
      Left = 1
      Top = 1
      Width = 223
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object chbPaid: TCheckBox
        Left = 7
        Top = 4
        Width = 97
        Height = 17
        Caption = #1057' '#1087#1086#1075#1072#1096#1077#1085#1085#1099#1084#1080'.'
        TabOrder = 0
        OnClick = chbPaidClick
      end
    end
  end
  object mnuFieldsSwitch: TPopupMenu
    Left = 278
    Top = 248
    object N1: TMenuItem
      Caption = #1060#1048#1054
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
      OnClick = N2Click
    end
  end
end
