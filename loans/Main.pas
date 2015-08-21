unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DataModule, ComCtrls, Mask, MainLoanInfo, Grids, DBGrids,
  ExtCtrls, MainPortfelInfo, CheckLst, Adminka, Dosudebka, IniFiles, Organaizer, Menus;

type
  TUsersLogin = record
   Name:String;
   ID:Integer;
  end;
  TMainForm = class(TForm)
    MainPageControl: TPageControl;
    AllInfo: TTabSheet;
    LoansInfo: TTabSheet;
    MainLoansList: TDBGrid;
    pnlKredSum: TPanel;
    MainInfoPortfelSumRUR: TLabel;
    MainInfoPortfelSumUSD: TLabel;
    MainInfoPortfelSumEUR: TLabel;
    MainInfoPortfelSumUAH: TLabel;
    lbKredSumHeader: TLabel;
    pnlDebtSum: TPanel;
    lbDebtSumHeader: TLabel;
    MainInfoPortfelSumZRUR: TLabel;
    MainInfoPortfelSumZUSD: TLabel;
    MainInfoPortfelSumZEUR: TLabel;
    MainInfoPortfelSumZUAH: TLabel;
    pnlOutDateSum: TPanel;
    MainInfoPortfelSumTRUR: TLabel;
    MainInfoPortfelSumTUSD: TLabel;
    MainInfoPortfelSumTEUR: TLabel;
    MainInfoPortfelSumTUAH: TLabel;
    pnlPercentSum: TPanel;
    MainInfoPortfelSumPRUR: TLabel;
    MainInfoPortfelSumPUSD: TLabel;
    MainInfoPortfelSumPEUR: TLabel;
    MainInfoPortfelSumPUAH: TLabel;
    lbOutDateSumHeader: TLabel;
    lbPercentSumHeader: TLabel;
    Dosudebka: TTabSheet;
    pnlBefoJudPeriod: TPanel;
    lbBeforeJudPeriodHeader: TLabel;
    lbAddNewActionHeader: TLabel;
    pnlAddNewJudAction: TPanel;
    MemoDosudebka: TMemo;
    lbFullDescriptHeader: TLabel;
    MonthCalendarDosudebnoe: TMonthCalendar;
    lbEventDateActHeader: TLabel;
    ButtonDosudebkaAdd: TButton;
    ButtonDosudebkaEdit: TButton;
    ButtonDosudebkaDel: TButton;
    pnlKredInfo: TPanel;
    LoansInfoFIOLoaner: TLabel;
    LoansInfoAdres2Loader: TLabel;
    LoansInfoFoneLoader: TLabel;
    LoansInfoAdres1Loader: TLabel;
    LoansInfoPasDat: TLabel;
    LoansInfoPasNumoader: TLabel;
    LoansInfoINNLoader: TLabel;
    lbDebtInfoHeader: TLabel;
    pnlLoanInfo: TPanel;
    LoansInfoValLoans: TLabel;
    LoansInfoDateLoans: TLabel;
    LoansInfoSumValLoans: TLabel;
    LoansInfoDateEndLoans: TLabel;
    LoansInfoDebtLoans: TLabel;
    LoansInfoDebtNacValLoans: TLabel;
    LoansInfoDEBTOUTOFDATE: TLabel;
    LoansInfoDEBTOUTOFDATEEQ: TLabel;
    LoansInfoPERCENTOUTOFDATE: TLabel;
    LoansInfoPERCENTOUTOFDATEEQ: TLabel;
    LoansInfoCOMMISSIONAMOUNT: TLabel;
    lbLoanInfoHeader: TLabel;
    Admins: TTabSheet;
    EditBDSvazi: TPageControl;
    UsersVsLoans: TTabSheet;
    CheckListBoxAdminLoans: TCheckListBox;
    lbEmplAdmHeader: TLabel;
    lbLoanAdmHeader: TLabel;
    DBGridAdminUsersFromLOans: TDBGrid;
    LoansVsLoaner: TTabSheet;
    DBGridLoansLVSL: TDBGrid;
    DBGridLoanserLVsL: TDBGrid;
    lbLoanListHeader: TLabel;
    lbDebtHeader: TLabel;
    EditBDTable: TPageControl;
    Users: TTabSheet;
    Loans: TTabSheet;
    Loaner: TTabSheet;
    DBGridUsers: TDBGrid;
    DBGridLoans: TDBGrid;
    DBGridLoanser: TDBGrid;
    ButtonAddLVsL: TButton;
    DBGridDosudebkaList: TDBGrid;
    edLogin: TEdit;
    edPassword: TEdit;
    lbLogin: TLabel;
    lbPassword: TLabel;
    btnLogin: TButton;
    sbInfo: TStatusBar;
    btnChengePas: TButton;
    DBGridOrganaizer: TDBGrid;
    pnlBottom: TPanel;
    DBGrid1: TDBGrid;
    LoansInfoPoruchitel: TLabel;
    TabSheet1: TTabSheet;
    DBGridOrganaizerFul: TDBGrid;
    MonthCalendar1: TMonthCalendar;
    ButtonOrganaizerComplit: TButton;
    CheckBoxOrganaizerCompl: TCheckBox;
    TabSheetAdminkaKurses: TTabSheet;
    MonthCalendarAdmCurses: TMonthCalendar;
    EditAdmCursUsd: TEdit;
    EditAdmCursEur: TEdit;
    EditAdmCursUah: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonAdmCursAdd: TButton;
    ButtonAdmCursSave: TButton;
    MainInfoSumLoansEcv: TLabel;
    MainInfoSumZadEcv: TLabel;
    MainInfoSumprosEcv: TLabel;
    MainInfoSumProcEcv: TLabel;
    mnuFieldsSwitch: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MainLoansListCellClick(Column: TColumn);
    procedure DBGridLoansLVSLCellClick(Column: TColumn);
    procedure DBGridLoanserLVsLCellClick(Column: TColumn);
    procedure ButtonAddLVsLClick(Sender: TObject);
    procedure ButtonDosudebkaAddClick(Sender: TObject);
    procedure DBGridDosudebkaListCellClick(Column: TColumn);
    procedure ButtonDosudebkaDelClick(Sender: TObject);
    procedure ButtonDosudebkaEditClick(Sender: TObject);
    procedure GetConnectionInfo();
    procedure btnLoginClick(Sender: TObject);
    procedure btnChengePasClick(Sender: TObject);
    procedure DBGridAdminUsersFromLOansCellClick(Column: TColumn);
    procedure CheckListBoxAdminLoansClickCheck(Sender: TObject);
    procedure MainLoansListDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CheckBoxOrganaizerComplClick(Sender: TObject);
    procedure ButtonOrganaizerComplitClick(Sender: TObject);
    procedure MonthCalendarAdmCursesClick(Sender: TObject);
    procedure ButtonAdmCursAddClick(Sender: TObject);
    procedure ButtonAdmCursSaveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    FUser_Name: String;
    FDriverId: String;
    FDataBase: String;
    FPassword: String;
    FServer: String;
    FPort: string;
    FIsLoginSuccessful: Boolean;
    procedure SetDataBase(const Value: String);
    procedure SetDriverId(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetServer(const Value: String);
    procedure SetUser_Name(const Value: String);
    procedure SetPort(const Value: string);
    procedure SetIsLoginSuccessful(const Value: Boolean);
    { Private declarations }
    property DataBase: String read FDataBase write SetDataBase;
    property User_Name : String read FUser_Name write SetUser_Name;
    property Password : String read FPassword write SetPassword;
    property Server : String read FServer write SetServer;
    property DriverId : String read FDriverId write SetDriverId;
    property Port: string read FPort write SetPort;
    property IsLoginSuccessful : Boolean read FIsLoginSuccessful write SetIsLoginSuccessful;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  mainLoanInfo : TMainLoanInfo;
  MainBagInfo : TMainPortfelInfo;
  Adminka:TMainAdminka;
  Dosudebnoe:TDosudebnoe;
  LoginUsers:TUsersLogin;
  Organaizer:TOrganaizer;

implementation




{$R *.dfm}

procedure RefreshOrganaizer;
Begin
 DMData.qrMainOrganaizer.Active:=False;
 DMData.qrMainOrganaizer.Params.ParamValues['ID_LOAN']:=DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
 DMData.qrMainOrganaizer.Active:=True;
End;
procedure TMainForm.MainLoansListCellClick(Column: TColumn);
begin
 MainLoanInfo.MainLoanInfoLoadData;
 Dosudebnoe.RefreshList;
 RefreshOrganaizer;
end;

procedure TMainForm.MainLoansListDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if Assigned(Column) then
   begin
        MainLoansList.Canvas.FillRect(Rect);
        MainLoansList.Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Column.Field.AsString);
   end;
end;

procedure TMainForm.MonthCalendarAdmCursesClick(Sender: TObject);
begin
 Adminka.LoadCurses;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  MainLoansList.Columns[0].FieldName := 'fio';
  MainLoansList.Columns[0].Title.Caption := 'ФАМИЛИЯ ИМЯ ОТЧЕСТВО';
  mnuFieldsSwitch.Items[0].Checked := True;
  mnuFieldsSwitch.Items[1].Checked := False;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  MainLoansList.Columns[0].FieldName := 'AGREEMENT_NUM';
  MainLoansList.Columns[0].Title.Caption := 'НОМЕР ДОГОВОРА';
  mnuFieldsSwitch.Items[0].Checked := False;
  mnuFieldsSwitch.Items[1].Checked := True;
end;

procedure TMainForm.SetDataBase(const Value: String);
begin
  FDataBase := Value;
end;

procedure TMainForm.SetDriverId(const Value: String);
begin
  FDriverId := Value;
end;

procedure TMainForm.SetIsLoginSuccessful(const Value: Boolean);
begin
  FIsLoginSuccessful := Value;
end;

procedure TMainForm.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TMainForm.SetPort(const Value: string);
begin
  FPort := Value;
end;

procedure TMainForm.SetServer(const Value: String);
begin
  FServer := Value;
end;

procedure TMainForm.SetUser_Name(const Value: String);
begin
  FUser_Name := Value;
end;

procedure TMainForm.ButtonDosudebkaAddClick(Sender: TObject);
begin
 Dosudebnoe.AddAction;
end;

procedure TMainForm.ButtonDosudebkaDelClick(Sender: TObject);
begin
 Dosudebnoe.DelSelectedItem;
end;

procedure TMainForm.ButtonDosudebkaEditClick(Sender: TObject);
begin
 Dosudebnoe.EditSelectedItem;
end;

procedure TMainForm.ButtonOrganaizerComplitClick(Sender: TObject);
begin
 Organaizer.Complited;
end;

procedure TMainForm.CheckBoxOrganaizerComplClick(Sender: TObject);
begin
 Organaizer.ChengeComplited;
end;

procedure TMainForm.CheckListBoxAdminLoansClickCheck(Sender: TObject);
begin
 Adminka.ADDBaseLoansList;
end;

procedure RefreshLoansList;
Begin
 DMData.qrLoanInfo.Active := False;
 DMData.qrLoanInfo.Params.ParamByName('ID_USER').AsInteger := LoginUsers.ID;
 DMData.SafeExecuteDatasetVoidMethod(DMData.qrLoanInfo.Open);
 DMData.qrLoanInfo.First;

 DMData.SafeExecuteDatasetVoidMethod(DMData.TableUsers.Open);
 DMData.SafeExecuteDatasetVoidMethod(DMData.TableLoans.Open);
 DMData.SafeExecuteDatasetVoidMethod(DMData.TableLoanser.Open);
 DMData.SafeExecuteDatasetVoidMethod(DMData.qrOrganaizerFul.Open);
 MainBagInfo.MainLoanPortfelLoadData;
 Adminka.LoadLoansList;
 RefreshOrganaizer;
End;

procedure ClearLabelMainForm;
Begin
 MainForm.MainInfoPortfelSumRUR.Caption:='';
 MainForm.MainInfoPortfelSumUSD.Caption:='';
 MainForm.MainInfoPortfelSumEUR.Caption:='';
 MainForm.MainInfoPortfelSumUAH.Caption:='';
 MainForm.MainInfoPortfelSumZRUR.Caption:='';
 MainForm.MainInfoPortfelSumZUSD.Caption:='';
 MainForm.MainInfoPortfelSumZEUR.Caption:='';
 MainForm.MainInfoPortfelSumZUAH.Caption:='';
 MainForm.MainInfoPortfelSumTRUR.Caption:='';
 MainForm.MainInfoPortfelSumTUSD.Caption:='';
 MainForm.MainInfoPortfelSumTEUR.Caption:='';
 MainForm.MainInfoPortfelSumTUAH.Caption:='';
 MainForm.MainInfoPortfelSumPRUR.Caption:='';
 MainForm.MainInfoPortfelSumPUSD.Caption:='';
 MainForm.MainInfoPortfelSumPEUR.Caption:='';
 MainForm.MainInfoPortfelSumPUAH.Caption:='';
 MainForm.LoansInfoFIOLoaner.Caption:='';
 MainForm.LoansInfoINNLoader.Caption:='';
 MainForm.LoansInfoPasNumoader.Caption:='';
 MainForm.LoansInfoPasDat.Caption:='';
 MainForm.LoansInfoAdres1Loader.Caption:='';
 MainForm.LoansInfoAdres2Loader.Caption:='';
 MainForm.LoansInfoFoneLoader.Caption:='';
 MainForm.LoansInfoDateLoans.Caption:='';
 MainForm.LoansInfoSumValLoans.Caption:='';
 MainForm.LoansInfoValLoans.Caption:='';
 MainForm.LoansInfoDateEndLoans.Caption:='';
 MainForm.LoansInfoDebtLoans.Caption:='';
 MainForm.LoansInfoDebtNacValLoans.Caption:='';
 MainForm.LoansInfoDEBTOUTOFDATE.Caption:='';
 MainForm.LoansInfoDEBTOUTOFDATEEQ.Caption:='';
 MainForm.LoansInfoPERCENTOUTOFDATE.Caption:='';
 MainForm.LoansInfoPERCENTOUTOFDATEEQ.Caption:='';
 MainForm.LoansInfoCOMMISSIONAMOUNT.Caption:='';
 MainForm.LoansInfoPoruchitel.Caption:='';
End;

procedure LoginPO;
var
 sLogin : String;
 sPassword : String;
Begin
 if MainForm.IsLoginSuccessful = False then
 Begin
  if ((Trim(MainForm.edLogin.Text)='') OR (Trim(MainForm.edPassword.Text)='') ) then
   ShowMessage('Поля Логин  или Пароль  не могут быть  пустыми!')
  else begin
   sLogin := MainForm.edLogin.Text;
   sPassword := MainForm.edPassword.Text;
   DMData.qrLogin.Active := False;
   DMData.qrLogin.Params.ParamByName('PRMUSERLOGIN').AsString := sLogin;
   DMData.qrLogin.Params.ParamByName('USER_PASSWORD').AsString := sPassword;
   DMData.qrLogin.Active := True;
   if DMData.qrLogin.Eof =False then
   Begin
    LoginUsers.Name:=DMData.qrLogin.FieldByName('FIRSTNAME').AsString;
    LoginUsers.ID:=DMData.qrLogin.FieldByName('ID_USER').AsInteger;
    RefreshLoansList;
    MainLoanInfo.MainLoanInfoLoadData();
    MainForm.btnLogin.Caption:='Выход';
    MainForm.IsLoginSuccessful := True;
    MainForm.btnChengePas.Enabled:=True;
   End;
   If DMData.qrLogin.FieldByName('IS_ADMIN').AsBoolean = True then MainForm.MainPageControl.Pages[3].TabVisible:=True;
   DMData.qrLogin.Active := False;
    //DMData.SafeExecuteDatasetVoidMethod(DMData.qrLoanInfo.Open);
  end;//if - else
 End else
 {if MainForm.IsLoginSuccessful = True then}
 Begin
  LoginUsers.Name:='';
  LoginUsers.ID:=0;
  RefreshLoansList;
  MainForm.btnLogin.Caption:='Вход';
  MainForm.btnChengePas.Enabled:=False;
  MainForm.IsLoginSuccessful := False;
  ClearLabelMainForm;
  MainForm.MainPageControl.Pages[3].TabVisible:=False;
 End;
End;

procedure ChengePassword;
Begin
 if MainForm.edPassword.Text='' then ShowMessage('Поля Логин  или Пароль  не могут быть  пустыми!');
 if MainForm.edPassword.Text<>'' then
 begin
  DMData.qrchengepass.Params.ParamValues['USER_PASSWORD']:=MainForm.edPassword.Text;
  DMData.qrchengepass.Params.ParamValues['ID_USER']:=LoginUsers.ID;
  DMData.qrchengepass.ExecSQL;
  ShowMessage('Пароль успешно изменен!');
 end;

End;

procedure TMainForm.btnChengePasClick(Sender: TObject);
begin
 ChengePassword;
end;

procedure TMainForm.btnLoginClick(Sender: TObject);
begin
 LoginPO;
end;

procedure TMainForm.ButtonAddLVsLClick(Sender: TObject);
begin
 Adminka.LoansVsLoanserButtonDelete;
end;

procedure TMainForm.ButtonAdmCursAddClick(Sender: TObject);
begin
 Adminka.AddCurses;
end;

procedure TMainForm.ButtonAdmCursSaveClick(Sender: TObject);
begin
 Adminka.EditCurses;
end;

procedure TMainForm.DBGrid1CellClick(Column: TColumn);
begin
 mainLoanInfo.MainLoanInfoMultiLoadDebtor;
end;

procedure TMainForm.DBGridAdminUsersFromLOansCellClick(Column: TColumn);
begin
 Adminka.RefreshLoansList;
end;

procedure TMainForm.DBGridDosudebkaListCellClick(Column: TColumn);
begin
 Dosudebnoe.LoadSelectedItem;
end;

procedure TMainForm.DBGridLoanserLVsLCellClick(Column: TColumn);
begin
 Adminka.LoansVsLoanserButtonName;
end;

procedure TMainForm.DBGridLoansLVSLCellClick(Column: TColumn);
begin
 Adminka.LoansVsLoanserButtonName;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //Устанавливаем  флаг   успешного логина в False Назначаем  кнопке надпись ВХОД
  IsLoginSuccessful := False;
  btnLogin.Caption := 'Вход';
  btnChengePas.Enabled:=False;
  ClearLabelMainForm;
  MainPageControl.ActivePageIndex := 0;

  GetConnectionInfo();
  DMData.conCredittDB.Connected := False;
  DMData.conCredittDB.Params.Clear;
  DMData.conCredittDB.Params.Add('DriverID='+DriverId);
  DMData.conCredittDB.Params.Add('Database='+DataBase);
  DMData.conCredittDB.Params.Add('Server='+ Server);
  DMData.conCredittDB.Params.Add('Password='+Password);
  DMData.conCredittDB.Params.Add('User_Name='+User_Name);
  DMData.conCredittDB.Params.Add('Port='+Port);
  try
    DMData.conCredittDB.Connected := True;
  except on E: Exception do
    ShowMessage('Во время подключенеие к БД  произошла ошибка: '+E.Message);
  end;
  MainPageControl.Pages[3].TabVisible:=False;
  {
  try
    if NOT DMData.qrLoanInfo.Active then DMData.qrLoanInfo.Active;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
   }
  {Активация БД}
  {
  DMData.qrLoanInfo.Active:=True;
  DMData.TableUsers.Active:=True;
  DMData.TableLoans.Active:=True;
  DMData.TableLoanser.Active:=True;

  MainBagInfo.MainLoanPortfelLoadData;
  }

  //MainLoanInfo:= TMainLoanInfo.Create();
  //sl := TStringList.Create();
  //sl:= MainLoanInfo.GetLoanList();
  //LoansList.Items := sl;
  //DMData.MainRefreshLoansList;
end;

procedure TMainForm.GetConnectionInfo;
var
  fINI :TIniFile;
  sFilePath :  String;
begin
  sFilePath := GetCurrentDir+'\cred.ini';
  fINI := TIniFile.Create(sFilePath);
  if FileExists(sFilePath) then begin
    try
      DataBase := fINI.ReadString('CONNECT_PARAMS','DataBase','');
      User_Name := fINI.ReadString('CONNECT_PARAMS','User_Name','');
      Password := fINI.ReadString('CONNECT_PARAMS','Password','');
      Server := fINI.ReadString('CONNECT_PARAMS','Server','');
      DriverId := fINI.ReadString('CONNECT_PARAMS','DriverID','');
      Port := fINI.ReadString('CONNECT_PARAMS','Port','');
    finally
      fINI.Free;
    end;
  end else begin
    try
      fINI.WriteString('CONNECT_PARAMS','DataBase','database');
      fINI.WriteString('CONNECT_PARAMS','User_Name','User_Name');
      fINI.WriteString('CONNECT_PARAMS','Password','Password');
      fINI.WriteString('CONNECT_PARAMS','Server','Server');
      fINI.WriteString('CONNECT_PARAMS','DriverID','DriverID');
      fINI.WriteString('CONNECT_PARAMS','Port','Port');
    finally
      fINI.Free;
    end;
  end;    //if - else  FileExist

end;

end.
