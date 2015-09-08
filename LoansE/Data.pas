unit Data;

interface

uses
  SysUtils, Classes, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef,
  uADStanPool, uADPhysManager, uADPhysPG, uADGUIxFormsWait, DB, uADCompClient, uADStanParam,
  uADDatSManager, uADDAptIntf, uADStanAsync, uADDAptManager, uADCompDataSet;

type
  TdmData = class(TDataModule)
    conLoan: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    qrInsertLoan: TADQuery;
    qrInsertLoanID_LOAN: TLargeintField;
    qrInsertLoaner: TADQuery;
    qrInsertLoanerID_LOANER: TLargeintField;
    qrInsertLoanInfo: TADQuery;
    qrSearchLoaner: TADQuery;
    qrLoans: TADQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

{$R *.dfm}

end.

