unit Data;

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
    dsAny: TDataSource;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    qrAnyID_LOAN: TLargeintField;
    qrAnyAGREEMENT_NUM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMData: TDMData;

implementation

{$R *.dfm}

end.
