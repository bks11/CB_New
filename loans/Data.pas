unit Data;

interface

uses
  SysUtils, Classes, uADStanIntf, uADStanOption, uADStanDef, uADPhysIntf,
  uADGUIxIntf, uADDatSManager, uADStanError, uADStanParam, uADDAptIntf, DB,
  uADCompDataSet, uADCompClient, uADGUIxFormsWait, uADPhysManager, uADPhysIB,
  uADPhysPG;

type
  TDMData = class(TDataModule)
    ADConnection1: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    QueryAny: TADQuery;
    DataSource1: TDataSource;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
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
