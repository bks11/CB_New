unit uData;

interface

uses
  SysUtils, Classes, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef,
  uADStanPool, uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADStanAsync,
  uADDAptManager, DB, uADCompDataSet, uADCompClient, uADPhysMySQL, uADGUIxFormsWait,
  uADPhysPG;

type
  TdmData = class(TDataModule)
    conLoan: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    ADQueryLoadVersion: TADQuery;
    ADQueryLoadPath: TADQuery;
    qrGetVersion: TADQuery;
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
