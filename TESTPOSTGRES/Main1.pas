unit Main1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef,
  uADStanPool, uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADStanAsync,
  uADDAptManager, DB, uADCompDataSet, uADCompClient, uADPhysPG, uADGUIxFormsWait, Grids, DBGrids;

type
  TForm1 = class(TForm)
    ADConnection1: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    ADTable1: TADTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
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
