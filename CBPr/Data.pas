unit Data;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADPhysManager, uADStanParam, uADDatSManager,
  uADDAptIntf, uADStanAsync, uADDAptManager, DB, uADCompDataSet, uADCompClient, uADPhysMySQL,
  uADGUIxFormsWait;

type
  TdmData = class(TDataModule)
    ZConnection1: TZConnection;
    ADConnection1: TADConnection;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    ADTable1: TADTable;
    DataSource1: TDataSource;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
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
