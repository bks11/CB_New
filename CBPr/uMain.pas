unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, DockTabSet, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons,
  WideStrings, FMTBcd, DB, SqlExpr, uRep311;

type
  TUser = Object
   Login:String;
   Prava:record
    Verba:Boolean;
    Krutilka:Boolean;
    P311:Boolean;
   End;
   Procedure LoadLogin; {Загрузить пути к папкам}
  End;
  TfmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    SQLConnection1: TSQLConnection;
    SQLQuery1: TSQLQuery;
    procedure FormCreate(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    User :Tuser;
  end;

var
  P311:Object311P;
  fmMain: TfmMain;

implementation

uses uCBReport;

{$R *.dfm}

Procedure TUser.LoadLogin;
Begin

End;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 P311.LoadPath;
end;

procedure TfmMain.TabSheet3Show(Sender: TObject);
var
  i : integer;
  CB311 : TCBReport;
begin
  CB311 := TCBReport.Create('D:\CB\Верба\311\На подпись\');
  //Create  new object  ---
  i := CB311.CreatePath();
  ShowMessage(IntToStr(i));
end;

end.
