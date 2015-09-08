unit Data;

interface

uses
  SysUtils, Classes, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef,
  uADStanPool, uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADStanAsync,
  uADDAptManager, DB, uADCompDataSet, uADCompClient, uADPhysMySQL, uADGUIxFormsWait;

type
  TdmData = class(TDataModule)
    conNagios: TADConnection;
    qrInsertLog: TADQuery;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    qrCheckExistingRec: TADQuery;
    qrDeleteRecByFilename: TADQuery;
    qrHostName: TADQuery;
    qrTest: TADQuery;
    qrUpDown: TADQuery;
    qrInsertStatistic: TADQuery;
    qrClearReport: TADQuery;
    qrShowReport: TADQuery;
    dsqShowReport: TDataSource;
    qrShowReportId: TADAutoIncField;
    qrShowReportHOST_NAME: TStringField;
    qrShowReportCISCO_UP: TDateTimeField;
    qrShowReportCISCO_DOWN: TDateTimeField;
    qrShowReportATM_UP: TDateTimeField;
    qrShowReportATM_DOWN: TDateTimeField;
    qrShowReportCISCO_COUNT: TIntegerField;
    qrShowReportATM_COUNT: TIntegerField;
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

