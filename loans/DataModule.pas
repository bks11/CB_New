unit DataModule;

interface

{SELECT 
  "TLOAN".*, lnr."LASTNAME" ||'  '||lnr."FIRSTNAME" ||'  '|| lnr."MIDDLENAME"
FROM 
  public."TUSERLOANS", 
  public."TLOAN",
  "TLOANINFO",
  "TLOANER" lnr
WHERE
  "TUSERLOANS"."ID_LOAN" = "TLOAN"."ID_LOAN" and "TUSERLOANS"."ID_USER"=1 and
  "TLOANINFO"."ID_LOAN"="TLOAN"."ID_LOAN" and "TLOANINFO"."ID_LOANER"="TLOANER"."ID_LOANER" and "TLOANER"."IS_GUARANTOR"=False;}


uses
  SysUtils, Classes, uADStanIntf, uADStanOption, uADStanDef, uADPhysIntf,
  uADGUIxIntf, uADDatSManager, uADStanError, uADStanParam, uADDAptIntf, DB,
  uADCompDataSet, uADCompClient, uADGUIxFormsWait, uADPhysManager, uADPhysIB,
  uADPhysPG, uADStanPool, uADStanAsync, uADDAptManager;

type
  TDatasetVoidMethod = procedure() of object;
  TDatasetApplyUpdateMethod = function(MaxErrors :integer): integer of object;


type
  TDMData = class(TDataModule)
    conCredittDB: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    qrAny: TADQuery;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    dsqAny: TDataSource;
    qrLoanInfo: TADQuery;
    dsqLoanInfo: TDataSource;
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
    QRDosudebkaListDel: TADQuery;
    QRDosudebkaListEdit: TADQuery;
    qrLogin: TADQuery;
    qrchengepass: TADQuery;
    QRAdminUsersLVSLDG: TADQuery;
    QRAdminUsersLVSLDGAdd: TADQuery;
    QRAdminUsersLVSLDGDel: TADQuery;
    QRAdminUsersLVSLDGGetId: TADQuery;
    qrMainOrganaizer: TADQuery;
    DSMainOrganaizer: TDataSource;
    DataSourceLoanerInfoByLoans: TDataSource;
    qrOrganaizerFul: TADQuery;
    DataSourceOrganaizerFul: TDataSource;
    qrOrganaizerComplit: TADQuery;
    qrAdminsCursesLoad: TADQuery;
    qrAdminCursAdd: TADQuery;
    qrAdminQursEdit: TADQuery;
    qrGetCurrency: TADQuery;
    dsqGetCurrency: TDataSource;
  private

    { Private declarations }
  public
    { Public declarations }
    function SafeExecuteDatasetApplyUpdateMethod(method: TDatasetApplyUpdateMethod;
      MaxErrors: integer): boolean;
    function SafeExecuteDatasetVoidMethod(method: TDatasetVoidMethod): boolean;
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


function TDMData.SafeExecuteDatasetApplyUpdateMethod(method :TDatasetApplyUpdateMethod; MaxErrors: integer): boolean;
var
  isQuerySuccessful: boolean;
  attempCount: integer;
begin
  isQuerySuccessful := false;
  attempCount := 0;

  while ((not isQuerySuccessful) AND (attempCount < 1)) do
  begin
	  try
      method(MaxErrors);
	  except
	    attempCount := attempCount + 1;
	    continue;
  	end;
	  isQuerySuccessful := true;
  end;

  if(not isQuerySuccessful) then
  begin
    //MessageDlg('Connect to server failed.', mtWarning, [mbOK], 0);
  end;

  Result := isQuerySuccessful;
end;

function TDMData.SafeExecuteDatasetVoidMethod(method :TDatasetVoidMethod): boolean;
var
  isQuerySuccessful: boolean;
  attempCount: integer;
begin
  isQuerySuccessful := false;
  attempCount := 0;

  while ((not isQuerySuccessful) AND (attempCount < 1)) do
  begin
	  try
      method();
	  except
	    attempCount := attempCount + 1;
	    continue;
  	end;
	  isQuerySuccessful := true;
  end;

  if(not isQuerySuccessful) then
  begin
    //MessageDlg('Connect to server failed.', mtWarning, [mbOK], 0);
  end;

  Result := isQuerySuccessful;
end;

{$R *.dfm}

end.
