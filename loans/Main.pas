unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DataModule, ComCtrls, Mask, MainLoanInfo, Grids, DBGrids,
  ExtCtrls, MainPortfelInfo, CheckLst, Adminka, Dosudebka;

type
  TMainForm = class(TForm)
    MainPageControl: TPageControl;
    AllInfo: TTabSheet;
    LoansInfo: TTabSheet;
    MainLoansList: TDBGrid;
    Panel1: TPanel;
    MainInfoPortfelSumRUR: TLabel;
    MainInfoPortfelSumUSD: TLabel;
    MainInfoPortfelSumEUR: TLabel;
    MainInfoPortfelSumUAH: TLabel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    MainInfoPortfelSumZRUR: TLabel;
    MainInfoPortfelSumZUSD: TLabel;
    MainInfoPortfelSumZEUR: TLabel;
    MainInfoPortfelSumZUAH: TLabel;
    Panel3: TPanel;
    MainInfoPortfelSumTRUR: TLabel;
    MainInfoPortfelSumTUSD: TLabel;
    MainInfoPortfelSumTEUR: TLabel;
    MainInfoPortfelSumTUAH: TLabel;
    Panel4: TPanel;
    MainInfoPortfelSumPRUR: TLabel;
    MainInfoPortfelSumPUSD: TLabel;
    MainInfoPortfelSumPEUR: TLabel;
    MainInfoPortfelSumPUAH: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Dosudebka: TTabSheet;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel6: TPanel;
    MemoDosudebka: TMemo;
    Label7: TLabel;
    MonthCalendarDosudebnoe: TMonthCalendar;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel7: TPanel;
    LoansInfoFIOLoaner: TLabel;
    LoansInfoAdres2Loader: TLabel;
    LoansInfoFoneLoader: TLabel;
    LoansInfoAdres1Loader: TLabel;
    LoansInfoPasDat: TLabel;
    LoansInfoPasNumoader: TLabel;
    LoansInfoINNLoader: TLabel;
    Label9: TLabel;
    Panel8: TPanel;
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
    Label10: TLabel;
    Admins: TTabSheet;
    EditBDSvazi: TPageControl;
    UsersVsLoans: TTabSheet;
    CheckListBox2: TCheckListBox;
    Label11: TLabel;
    Label12: TLabel;
    DBGrid1: TDBGrid;
    LoansVsLoaner: TTabSheet;
    DBGridLoansLVSL: TDBGrid;
    DBGridLoanserLVsL: TDBGrid;
    Label13: TLabel;
    Label14: TLabel;
    EditBDTable: TPageControl;
    Users: TTabSheet;
    Loans: TTabSheet;
    Loaner: TTabSheet;
    DBGridUsers: TDBGrid;
    DBGridLoans: TDBGrid;
    DBGridLoanser: TDBGrid;
    ButtonAddLVsL: TButton;
    DBGridDosudebkaList: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure MainLoansListCellClick(Column: TColumn);
    procedure DBGridLoansLVSLCellClick(Column: TColumn);
    procedure DBGridLoanserLVsLCellClick(Column: TColumn);
    procedure ButtonAddLVsLClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  mainLoanInfo : TMainLoanInfo;
  MainBugInfo : TMainPortfelInfo;
  Adminka:TMainAdminka;
  Dosudebnoe:TDosudebnoe;

implementation




{$R *.dfm}

procedure TMainForm.MainLoansListCellClick(Column: TColumn);
begin
 MainLoanInfo.MainLoanInfoLoadData;
 Dosudebnoe.RefreshList;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
 Dosudebnoe.AddAction;
end;

procedure TMainForm.ButtonAddLVsLClick(Sender: TObject);
begin
 Adminka.LoansVsLoanserButtonDelete;
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
//var
  //mainLoanInfo : TMainLoanInfo;
  //sl : TStringList;
begin
  //
  try
    if NOT DMData.qrLoanInfo.Active then DMData.qrLoanInfo.Active;
  except on E: Exception do
    ShowMessage(E.Message);
  end;

  {Активация БД}
  DMData.qrLoanInfo.Active:=True;
  DMData.TableUsers.Active:=True;
  DMData.TableLoans.Active:=True;
  DMData.TableLoanser.Active:=True;

  MainBugInfo.MainLoanPortfelLoadData;

  //MainLoanInfo:= TMainLoanInfo.Create();
  //sl := TStringList.Create();
  //sl:= MainLoanInfo.GetLoanList();
  //LoansList.Items := sl;
  //DMData.MainRefreshLoansList;
end;

end.
