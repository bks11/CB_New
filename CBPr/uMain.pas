unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, DockTabSet, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons,
  WideStrings, FMTBcd, DB, SqlExpr, uRep311, Data, Grids, DBGrids, Arhivator;

type
  TUser = Object
   Login:String;
   ID:Integer;
   Dostup : record
    PO:Boolean;
    P311:Boolean;
    VerbaKa:Boolean;
    VerbaSign:Boolean;
    VerbaMail:Boolean;
    Arhiv:Boolean;
   end;
   Procedure LoadLogin; {}
  End;
  TfmMain = class(TForm)
    PageControlMain: TPageControl;
    TabSheetVerba: TTabSheet;
    TabSheetKKrutilka: TTabSheet;
    TabSheet311P: TTabSheet;
    PageControl311P: TPageControl;
    TabSheetSform: TTabSheet;
    Panel1: TPanel;
    CheckListBox311Sform: TCheckListBox;
    Button311SformProverka: TButton;
    Button311Refresh: TButton;
    Memo311SformEdit: TMemo;
    CheckBox311SformirovAllCheck: TCheckBox;
    TabSheetInCa: TTabSheet;
    Panel2: TPanel;
    CheckListBox311InKa: TCheckListBox;
    Button311InKaOut: TButton;
    CheckBox311InKACheckAll: TCheckBox;
    Button1: TButton;
    TabSheetInSign: TTabSheet;
    Panel3: TPanel;
    CheckListBox311InSign: TCheckListBox;
    Button2: TButton;
    CheckBox311InSignCheckAll: TCheckBox;
    Button311InSignRefresh: TButton;
    TabSheet311Arh: TTabSheet;
    Panel4: TPanel;
    CheckListBox311InArh: TCheckListBox;
    Button3: TButton;
    CheckBox311InArhCheckAll: TCheckBox;
    Button311InArhRefresh: TButton;
    TabSheetArhiv: TTabSheet;
    PageControlArhiv: TPageControl;
    TabSheetArhiv311P: TTabSheet;
    Panel5: TPanel;
    CheckListBoxArhiv311: TCheckListBox;
    Button4: TButton;
    ButtonArhiv311Refresh: TButton;
    CheckBoxArhiv311CheckAll: TCheckBox;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    CheckListBox2: TCheckListBox;
    Button6: TButton;
    CheckBox2: TCheckBox;
    Button7: TButton;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    CheckListBox3: TCheckListBox;
    Button8: TButton;
    CheckBox3: TCheckBox;
    Button9: TButton;
    TabSheet4: TTabSheet;
    Panel8: TPanel;
    CheckListBox4: TCheckListBox;
    Button10: TButton;
    CheckBox4: TCheckBox;
    Button11: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button311RefreshClick(Sender: TObject);
    procedure CheckListBox311SformClick(Sender: TObject);
    procedure Button311SformProverkaClick(Sender: TObject);
    procedure CheckBox311SformirovAllCheckClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox311InKACheckAllClick(Sender: TObject);
    procedure CheckBox311InSignCheckAllClick(Sender: TObject);
    procedure Button311InSignRefreshClick(Sender: TObject);
    procedure Button311InKaOutClick(Sender: TObject);
    procedure Button311InArhRefreshClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonArhiv311RefreshClick(Sender: TObject);
    procedure CheckBoxArhiv311CheckAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    User :Tuser;
  end;

var
  Arhivator:ObjectArhivator;
  P311:Object311P;
  fmMain: TfmMain;
  UsersLogin:TUser;

implementation

{$R *.dfm}

function GetUserFromWindows: string;
Var
  UserName : string;
  UserNameLen : Dword;
Begin
  UserNameLen := 255;
  SetLength(userName, UserNameLen);
  If GetUserName(PChar(UserName), UserNameLen) Then
    Result := Copy(UserName,1,UserNameLen - 1)
  Else
    Result := 'Unknown';
End;

Procedure TUser.LoadLogin;
Begin
 UsersLogin.Login:=GetUserFromWindows;

 dmData.ADQueryLoadDostup.Active:=False;
 dmData.ADQueryLoadDostup.ParamByName('USER_LOGIN').Value := UsersLogin.Login;
 dmData.ADQueryLoadDostup.Active:=True;
 dmData.ADQueryLoadDostup.First;
 while NOT dmData.ADQueryLoadDostup.Eof do
 begin
  UsersLogin.ID:=dmData.ADQueryLoadDostup.FieldByName('ID_USER').AsInteger;
  If dmData.ADQueryLoadDostup.FieldByName('ID_REPORT').AsInteger=1 then UsersLogin.Dostup.PO:=True;
  If dmData.ADQueryLoadDostup.FieldByName('ID_REPORT').AsInteger=2 then UsersLogin.Dostup.P311:=True;
  If dmData.ADQueryLoadDostup.FieldByName('ID_REPORT').AsInteger=3 then UsersLogin.Dostup.VerbaKa:=True;
  If dmData.ADQueryLoadDostup.FieldByName('ID_REPORT').AsInteger=4 then UsersLogin.Dostup.VerbaSign:=True;
  If dmData.ADQueryLoadDostup.FieldByName('ID_REPORT').AsInteger=5 then UsersLogin.Dostup.VerbaMail:=True;
  If dmData.ADQueryLoadDostup.FieldByName('ID_REPORT').AsInteger=6 then UsersLogin.Dostup.Arhiv:=True;
  dmData.ADQueryLoadDostup.Next;
 end;
 {тут возможно придется лочить тока подчиненные табы а не майн}
 if UsersLogin.Dostup.P311<>True then
 Begin
  fmMain.PageControlMain.Pages[2].TabVisible:=False;
 End else
 Begin
  P311.LoadPath;
 End;
 if UsersLogin.Dostup.Arhiv<>True then
 Begin
  fmMain.PageControlMain.Pages[3].TabVisible:=False;
 End else
 Begin
  Arhivator.LoadPath;
 End;
End;

procedure TfmMain.Button1Click(Sender: TObject);
begin
 P311.RefreshCheckListInKa;
end;

procedure TfmMain.Button2Click(Sender: TObject);
begin
 P311.OtpravkaSign;
end;

procedure TfmMain.Button311InArhRefreshClick(Sender: TObject);
begin
 P311.RefreshCheckListInArh;
end;

procedure TfmMain.Button311InKaOutClick(Sender: TObject);
begin
 P311.OtpravkaKa;
end;

procedure TfmMain.Button311InSignRefreshClick(Sender: TObject);
begin
 P311.RefreshCheckListInSign;
end;

procedure TfmMain.Button311RefreshClick(Sender: TObject);
begin
 P311.RefreshCheckListSform;
end;

procedure TfmMain.Button311SformProverkaClick(Sender: TObject);
begin
 P311.Proverka;
end;

procedure TfmMain.ButtonArhiv311RefreshClick(Sender: TObject);
begin
 Arhivator.RefreshCheckList311;
end;

procedure TfmMain.CheckBox311InKACheckAllClick(Sender: TObject);
begin
 P311.CheckAllInKa;
end;

procedure TfmMain.CheckBox311InSignCheckAllClick(Sender: TObject);
begin
 P311.CheckAllInSign;
end;

procedure TfmMain.CheckBox311SformirovAllCheckClick(Sender: TObject);
begin
 P311.CheckAll;
end;

procedure TfmMain.CheckBoxArhiv311CheckAllClick(Sender: TObject);
begin
 Arhivator.CheckAll311
end;

procedure TfmMain.CheckListBox311SformClick(Sender: TObject);
begin
 P311.LoadSozdanFile;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 UsersLogin.LoadLogin;
end;

end.
