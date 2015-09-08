unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DB, SqlExpr, FMTBcd, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf,
  uADPhysIntf, uADStanDef, uADStanPool, uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf,
  uADStanAsync, uADDAptManager, Grids, DBGrids, uADCompDataSet, uADCompClient;

type
  TfmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses uUtilites, uData;



{$R *.dfm}

Procedure CreateFoldersCB;
var
 Path:String;
 PathServer:String;
 F:TStringList;
 I: Integer;
 Version:String;
begin
  {if NOT dmData.conCB.Connected then begin
    try
      dmData.conCB.Params.Clear;
      dmData.conCB.Params.Add('Server=10.3.0.231');
      dmData.conCB.Params.Add('User_Name=mysqladm');
      dmData.conCB.Params.Add('Database=CB');
      dmData.conCB.Params.Add('DriverID=MySQL');
      dmData.conCB.Params.Add('Password=Simf0000');
      dmdata.conCB.Connected :=  true;
    except on E: Exception do
      MessageDlg(E.Message,mtError,[mbOK],0);
    end;// TRY  EXCEPT
  end;//if  not connected }

  {dmData.qrGetPath.Active :=  False;
  dmData.qrGetPath.Params.ParamByName('PATHID').Value := 1;
  try
    dmData.qrGetPath.Active := True;
    Path:=dmData.qrGetPath.FieldByName('Path').AsString;
    dmData.qrGetPath.Active := False;
  except on E: Exception do
    MessageDlg(E.Message,mtError,[mbOK],0);
  end;      }

  Path:='';
  {Path:='\\10.3.0.130\BD\';}
  dmData.ADQueryLoadPath.Active:=False;
  dmData.ADQueryLoadPath.ParamByName('USER_LOGIN').Value := GetUserFromWindows;
  dmData.ADQueryLoadPath.Active:=True;
  dmData.ADQueryLoadPath.First;
  while NOT dmData.ADQueryLoadPath.Eof do
  begin
   If dmData.ADQueryLoadPath.FieldByName('NOTE').AsString='Путь к инишнику и экзекеру' then
   Begin
    PathServer:=dmData.ADQueryLoadPath.FieldByName('REPORT_PATH').AsString;
   End;
   If dmData.ADQueryLoadPath.FieldByName('NOTE').AsString='Корневой каталог' then
   Begin
    Path:=dmData.ADQueryLoadPath.FieldByName('REPORT_PATH').AsString;
   End;
   if NOT DirectoryExists(dmData.ADQueryLoadPath.FieldByName('REPORT_PATH').AsString)and (dmData.ADQueryLoadPath.FieldByName('NOTE').AsString<>'Путь к инишнику и экзекеру') then
   Begin
    CreateDir(dmData.ADQueryLoadPath.FieldByName('REPORT_PATH').AsString);
    if dmData.ADQueryLoadPath.FieldByName('NOTE').AsString='Корневой каталог' then
    Begin
     CopyFile(pchar(PathServer+'\CB.ini'),pchar(Path+'\CB.ini'),False);
     CopyFile(pchar(PathServer+'\mail.exe'),pchar(Path+'\CB.exe'),False);
    End;
   End;
   dmData.ADQueryLoadPath.Next;
  end;

  if Path<>'' then
  Begin
   F:=TStringList.Create;
   F.LoadFromFile(Path+'\CB.ini');{Вскрыть локальный инишник}
   for I := 0 to F.Count - 1 do
   begin
    if I=0 then
    begin
     Version:=F[I];
     dmData.ADQueryLoadVersion.Active:=True;
     If Version <> dmData.ADQueryLoadVersion.FieldByName('VERSION_INFO').AsString then
     Begin
      CopyFile(pchar(PathServer+'\CB.ini'),pchar(Path+'\CB.ini'),False);
      CopyFile(pchar(PathServer+'\mail.exe'),pchar(Path+'\CB.exe'),False);
     End; //if
     dmData.ADQueryLoadVersion.Active:=False;
    end;//if
   end;//for
   F.Free;
  End;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  fmMain.Caption:=GetUserFromWindows;
  CreateFoldersCB;
end;

end.
