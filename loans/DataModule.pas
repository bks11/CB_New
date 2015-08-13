unit DataModule;

interface

uses
  SysUtils, Classes, uADStanIntf, uADStanOption, uADStanDef, uADPhysIntf,
  uADGUIxIntf, uADDatSManager, uADStanError, uADStanParam, uADDAptIntf, DB,
  uADCompDataSet, uADCompClient, uADGUIxFormsWait, uADPhysManager, uADPhysIB,
  uADPhysPG, uADStanPool, uADStanAsync, uADDAptManager;

type
  TDMData = class(TDataModule)
    conCredittDB: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    qrAny: TADQuery;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    qrAnyID_LOAN: TLargeintField;
    qrAnyAGREEMENT_NUM: TStringField;
    dsqAny: TDataSource;
    qrLoanInfo: TADQuery;
    dsqLoanInfo: TDataSource;
    qrLoanInfoID_LOAN: TLargeintField;
    qrLoanInfoAGREEMENT_NUM: TStringField;
    qrLoanInfoISSUE_DATE: TDateField;
    qrLoanInfoLOAN_SUMM: TCurrencyField;
    qrLoanInfoLOAN_CURRENCY: TStringField;
    qrLoanInfoEND_DATE: TDateField;
    qrLoanInfoTOTAL_CREDIT_SUMM: TCurrencyField;
    qrLoanInfoTOTAL_CREDIT_SUMM_EQ: TCurrencyField;
    qrLoanInfoDEBT_OUT_OF_DATE: TCurrencyField;
    qrLoanInfoDEBT_OUT_OF_DATE_EQ: TCurrencyField;
    qrLoanInfoPERCENT_OUT_OF_DATE: TCurrencyField;
    qrLoanInfoPERCENT_OUT_OF_DATE_EQ: TCurrencyField;
    qrLoanInfoCOMMISSION_AMOUNT: TCurrencyField;
    qrLoanInfoFIRST_CREDITOR: TStringField;
    qrLoanerInfoByLoans: TADQuery;
    QRAdminUsersLVSL: TADQuery;
    TableUsers: TADTable;
    DataSourceUsers: TDataSource;
    TableLoans: TADTable;
    TableLoanser: TADTable;
    DataSourceLoans: TDataSource;
    DataSourceLoanser: TDataSource;
    QRAdminUsersLVSLDel: TADQuery;
    QRAdminUsersLVSLAdd: TADQuery;
    QRDosudebkaList: TADQuery;
    DataSourceDosudebkaList: TDataSource;
    QRDosudebkaListAdd: TADQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    //Procedure MainRefreshLoansList();{Обновить из базы кредитный лист}
    //function GetLoanList():TStringList;
  end;

var
  DMData: TDMData;

implementation

Uses
 Main;





//Procedure TDMData.MainRefreshLoansList;
{Обновить из базы кредитный лист}
//Var
// I:Integer;
//Begin
// qrAny.Active:=false;
// qrAny.SQL.Clear;
// qrAny.SQL.Add('Select "ID_LOAN", "AGREEMENT_NUM" from "TLOAN"');
// qrAny.Active:=True;
// MainForm.LoansList.Items.Clear;
// if qrAny.Eof=False then
// Begin
//  for I := 0 to 30000 do
//  Begin
//   MainForm.LoansList.Items.Add(qrAny.FieldByName('AGREEMENT_NUM').AsString);
//   qrAny.Next;
//   if qrAny.Eof then Break;
//  End;
// End;
// qrAny.Active:=false;
//End;

{$R *.dfm}

end.
