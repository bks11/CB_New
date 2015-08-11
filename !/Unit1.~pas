unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBTables, Grids, DBGrids, ADODB, Mask,
  DBCtrls, Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, ExtCtrls;

type

  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    Table1: TTable;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Timer1: TTimer;
    Button1: TButton;
    TabSheet2: TTabSheet;
    ListBox4: TListBox;
    TabSheet3: TTabSheet;
    ListBox5: TListBox;
    TabSheet4: TTabSheet;
    ListBox6: TListBox;
    Query1: TQuery;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Reglament:Boolean;
Procedure LoadLog(Gruppa, Mas:String);
Function LoadPost(S:String):String;
Procedure UpdatePost(S:String; I:Integer);

var
  ARJ:TArj;
  ReglamentOfOn:Boolean;
  Form1: TForm1;
  Block311P:Object311P;
  Block3251P:Object3251P;
  Block365P:Object365P;
  Block406P:Object406P;
  Block364402P:Object364402P;
  Verba:TVerba;
implementation

uses DateUtils;

{$R *.dfm}

Procedure LoadActUsers;
Var
 I:Integer;
Begin
 Form1.Query1.Active:=True;
 Form1.ListBox2.Clear;
 For I:=1 to 20000 do
 Begin
  If Form1.Query1.Eof then Break;
  Form1.ListBox2.Items.Add(Form1.Query1.FieldByName('User').AsString);
  Form1.Query1.Next;
 End;
 Form1.Query1.Active:=False;
End;

Procedure UpdatePost(S:String; I:Integer);
Begin
 Form3.Query6.Params[0].AsInteger:=I+1;
 Form3.Query6.Params[1].AsString:=S;
 Form3.Query6.ExecSQL;
End;

Function LoadPost(S:String):String;
Var
 I,J:Integer;
 Ast:String;
Begin
 Form3.Query5.Params[0].AsString:=S;
 Form3.Query5.Active:=True;
 I:=Form3.Query5.FieldByName('Kount').AsInteger;
 If I=100 then I:=1;
 Ast:=IntToStr(I);
 For J:=1 To 3 do
 Begin
  If Length(ASt)<2 then ASt:='0'+ASt;
 End;
 Result:=ASt;
 Form3.Query5.Active:=False;
End;

Procedure LoadLog(Gruppa, Mas:String);
Begin
 Form3.Query12.Params[0].Value:=Now;
 Form3.Query12.Params[1].Value:=Gruppa;
 Form3.Query12.Params[2].Value:=Mas;
 Form3.Query12.ExecSQL;
End;

function Reglament:Boolean;
var
 myYear, myMonth, myDay : Word;
 myHour, myMin, mySec, myMilli : Word;
Begin
 Result:=False;
 DecodeDateTime(Now,myYear,myMonth,myDay,myHour,myMin,mySec,myMilli);
 If myHour>=9 then
 Begin
  If (myHour<15)or((myMin<45)and(myHour=15)) then
  Begin
   Result:=True;
   If ReglamentOfOn=false then
   Begin
    Form1.ListBox3.Items.Add('Регламент открыт');
    LoadLog('All','Регламент открыт');
   End;
   ReglamentOfOn:=true;
  End;
 end;
End;

Procedure OutReglament;
var
 myYear, myMonth, myDay : Word;
 myHour, myMin, mySec, myMilli : Word;
Begin
 DecodeDateTime(Now,myYear,myMonth,myDay,myHour,myMin,mySec,myMilli);
 If (((myHour=16)and(myMin>0))or(myHour>16))and(ReglamentOfOn=true) then
 Begin
  Form1.ListBox3.Items.Add('Регламент завершен');
  LoadLog('All','Регламент завершен');
  Form3.Query11.ExecSQL;
  ReglamentOfOn:=False;
 end;
End;

function GetUserFromWindows: string;
Var
 UserName : string;
 UserNameLen : Dword;
Begin
 UserNameLen := 255;
 SetLength(userName, UserNameLen);
 If GetUserName(PChar(UserName), UserNameLen) Then Result := Copy(UserName,1,UserNameLen - 1)
 Else Result := 'Unknown';
End;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 {If Reglament then Block3251P.Perebroska;}
 Form1.Timer1.Enabled:=False;
 Form1.Label1.Caption:='Обработка началась';
 Form1.Button1.Font.Color:=clRed;
 LoadActUsers;
 OutReglament;
 If Reglament then Block311P.Out311P;
 If Reglament then Block3251P.Out3251P;
 If Reglament then Block364402P.OutCB;
 Block406P.PriemCB;
 Block311P.InCvitCB;
 Block3251P.InCvitCB;
 Block365P.PriemCB;
 Block365P.OutCB;
 Block406P.OutCB;
 Block364402P.PriemCB;
 Form1.Timer1.Enabled:=True;
 Form1.Button1.Font.Color:=clLime;
 Form1.Label1.Caption:='Обработка завершена';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 If Form1.Timer1.Enabled=False then
 Begin
  Form1.Timer1.Enabled:=True;
  Form1.Button1.Caption:='Включено';
 End Else
 Begin
  Form1.Timer1.Enabled:=False;
  Form1.Button1.Caption:='Отключено';
 End;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ReglamentOfOn:=False;
 Block311P.PathInit;
 Block3251P.PathInit;
 Block365P.PathInit;
 Block364402P.PathInit;
 Block406P.PathInit;
 Verba.VerbaInit;
end;

end.
