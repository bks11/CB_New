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
    qrLoadDostup: TADQuery;
    qr311PLoadPath: TADQuery;
    qr311ProvOutFile: TADQuery;
    qr311LoadData: TADQuery;
    qrLoadArhCounFromDate: TADQuery;
    qr311InDbArhName: TADQuery;
    qrKrutLoadPath: TADQuery;
    qr311GetSign: TADQuery;
    qrSendSign: TADQuery;
    qrHronKrutSign311: TADQuery;
    qrKrutVerba311SignUpd: TADQuery;
    qrKrutVerba311SignLoad: TADQuery;
    qrKrutVerba311SignComplit: TADQuery;
    qr311GetCript: TADQuery;
    qrSendKript: TADQuery;
    qrHronKrutCript311: TADQuery;
    qrKrutVerba311CriptUpd: TADQuery;
    qrKrutVerba311CriptLoad: TADQuery;
    qrKrutHronArh311: TADQuery;
    qr311GetArh: TADQuery;
    qrSendArh: TADQuery;
    qrKrutVerba311ArhUpd: TADQuery;
    qrKrutVerba311ArhLoad: TADQuery;
    qrLoadArhFromDate: TADQuery;
    qrLoadArhId: TADQuery;
    qrVerbaMailSignUpd: TADQuery;
    qrKrutHromMailSign: TADQuery;
    qrArhMailUp: TADQuery;
    qrKrutHromMailCreate: TADQuery;
    qrArhMailGetCount: TADQuery;
    qrArhMailSetPak: TADQuery;
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
