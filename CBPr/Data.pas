unit Data;

interface

uses
  SysUtils, Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADPhysManager, uADStanParam, uADDatSManager,
  uADDAptIntf, uADStanAsync, uADDAptManager, DB, uADCompDataSet, uADCompClient, uADPhysMySQL,
  uADGUIxFormsWait, uADPhysPG;

type
  TdmData = class(TDataModule)
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADConnection1: TADConnection;
    ADQueryLoadDostup: TADQuery;
    ADQuery311PLoadPath: TADQuery;
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
