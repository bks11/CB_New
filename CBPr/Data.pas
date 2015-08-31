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
    ADQuery311ProvOutFile: TADQuery;
    ADQuery311LoadData: TADQuery;
    ADQueryLoadArhCounFromDate: TADQuery;
    ADQuery311InDbArhName: TADQuery;
    ADQueryKrutLoadPath: TADQuery;
    ADQuery311GetSign: TADQuery;
    ADQuerySendSign: TADQuery;
    ADQueryHronKrutSign311: TADQuery;
    ADQueryKrutVerba311SignUpd: TADQuery;
    ADQueryKrutVerba311SignLoad: TADQuery;
    ADQueryKrutVerba311SignComplit: TADQuery;
    ADQuery311GetCript: TADQuery;
    ADQuerySendKript: TADQuery;
    ADQueryHronKrutCript311: TADQuery;
    ADQueryKrutVerba311CriptUpd: TADQuery;
    ADQueryKrutVerba311CriptLoad: TADQuery;
    ADQueryKrutHronArh311: TADQuery;
    ADQuery311GetArh: TADQuery;
    ADQuerySendArh: TADQuery;
    ADQueryKrutVerba311ArhUpd: TADQuery;
    ADQueryKrutVerba311ArhLoad: TADQuery;
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
