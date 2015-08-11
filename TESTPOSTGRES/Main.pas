unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractConnection, ZConnection, Grids, DBGrids, DB, ADODB, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADPhysManager, uADStanParam,
  uADDatSManager, uADDAptIntf, uADStanAsync, uADDAptManager, uADCompDataSet, uADCompClient,
  uADGUIxFormsWait, uADPhysPG;

type
  TForm1 = class(TForm)
    ZConnection1: TZConnection;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1ID_USER: TLargeintField;
    ADOQuery1FIRSTNAME: TWideStringField;
    ADOQuery1MIDDLENAME: TWideStringField;
    ADOQuery1LASTNAME: TWideStringField;
    ADOQuery1USERRIGHTS: TWideStringField;
    ADOQuery1NOTE: TWideStringField;
    DBGrid1: TDBGrid;
    ADConnection1: TADConnection;
    ADTable1: TADTable;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
