unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DB, SqlExpr, FMTBcd, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf,
  uADPhysIntf, uADStanDef, uADStanPool, uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf,
  uADStanAsync, uADDAptManager, Grids, DBGrids, uADCompDataSet, uADCompClient, Mask, StdCtrls;

type
  TfmMain = class(TForm)
    lbIPServer: TLabel;
    btnSave: TButton;
    edIP: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUser_Name: String;
    FPort: string;
    FDriverId: String;
    FDataBase: String;
    FPassword: String;
    FServer: String;
    FVersion: String;
    FVersionFromDB: String;
    FApplicationPath: String;
    FReleasePath: String;
    procedure CreateLoanFolders;
    procedure SetDataBase(const Value: String);
    procedure SetDriverId(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetPort(const Value: string);
    procedure SetServer(const Value: String);
    procedure SetUser_Name(const Value: String);
    procedure SetVersion(const Value: String);
    procedure SetVersionFromDB(const Value: String);
    procedure SetApplicationPath(const Value: String);
    procedure SetReleasePath(const Value: String);
    function GetVersionNumFromDB():Boolean;
    function CopyNewVersion(): Boolean;
    { Private declarations }
  public
    { Public declarations }
    IS_APP_RUN : Boolean;
    property DataBase: String read FDataBase write SetDataBase;
    property User_Name : String read FUser_Name write SetUser_Name;
    property Password : String read FPassword write SetPassword;
    property Server : String read FServer write SetServer;
    property DriverId : String read FDriverId write SetDriverId;
    property Port: string read FPort write SetPort;
    property Version : String read FVersion write SetVersion;
    property VersionFromDB : String read FVersionFromDB write SetVersionFromDB;
    property ApplicationPath : String read FApplicationPath write SetApplicationPath;
    property ReleasePath : String read FReleasePath write SetReleasePath;


  end;

var
  fmMain: TfmMain;

implementation

uses uUtilites, uData, INIFiles;



{$R *.dfm}

procedure TfmMain.btnSaveClick(Sender: TObject);
begin
  dmData.conLoan.Connected := False;
  dmData.conLoan.Params.Clear;
  dmData.conLoan.Params.Add('DriverID=PG');
  dmData.conLoan.Params.Add('Database=CREDIT_DB');
  dmData.conLoan.Params.Add('Server='+edIP.Text);
  dmData.conLoan.Params.Add('Password=postgres');
  dmData.conLoan.Params.Add('User_Name=postgres');
  dmData.conLoan.Params.Add('Port=5432');
  try
    dmData.conLoan.Connected := True;
  except on E: Exception do
    ShowMessage('Во время подключенеие к БД  произошла ошибка: '+E.Message);
  end;//try
  if dmData.conLoan.Connected then begin
     CopyNewVersion();
     WinExec(PChar(ApplicationPath+'\loans.exe'), SW_SHOWNORMAL);
     Self.Close;
  end  else
  begin
    ShowMessage('ОШИБКА ПОДКЛЮЧЕНИЯ К СЕРВЕРУ');
  end;
end;

function TfmMain.CopyNewVersion: Boolean;
begin
  Result := False;
  if GetVersionNumFromDB() then begin
     if DirectoryExists(ApplicationPath) then begin
        if (Trim(Version)<>Trim(VersionFromDB)) then
           CopyFile(pchar(ReleasePath+'\cred.ini'),pchar(ApplicationPath+'\cred.ini'),False);
           Result := CopyFile(pchar(ReleasePath+'\loans.exe'),pchar(ApplicationPath+'\loans.exe'),False);
     end
     else begin
        CreateDir(ApplicationPath);
        CopyFile(pchar(ReleasePath+'\cred.ini'),pchar(ApplicationPath+'\cred.ini'),False);
        Result:= CopyFile(pchar(ReleasePath+'\loans.exe'),pchar(ApplicationPath+'\loans.exe'),False);
      end; //if-else Directory Exist
  end;// if GetVersion successfuly

end;

Procedure TfmMain.CreateLoanFolders();
var
 Path:String;
 PathServer:String;
 F:TStringList;
 I: Integer;
 Version:String;
begin


  {dmData.qrGetPath.Active :=  False;
  dmData.qrGetPath.Params.ParamByName('PATHID').Value := 1;
  try
    dmData.qrGetPath.Active := True;
    Path:=dmData.qrGetPath.FieldByName('Path').AsString;
    dmData.qrGetPath.Active := False;
  except on E: Exception do
    MessageDlg(E.Message,mtError,[mbOK],0);
  end;      }

  //Path:='';
  {Path:='\\10.3.0.130\BD\';}
  //dmData.ADQueryLoadPath.Active:=False;
 // dmData.ADQueryLoadPath.ParamByName('USER_LOGIN').Value := GetUserFromWindows;
  //dmData.ADQueryLoadPath.Active:=True;
  //dmData.ADQueryLoadPath.First;
  //while NOT dmData.ADQueryLoadPath.Eof do
  //begin
   //If dmData.ADQueryLoadPath.FieldByName('NOTE').AsString='Путь к инишнику и экзекеру' then
   //Begin
    //PathServer:=dmData.ADQueryLoadPath.FieldByName('REPORT_PATH').AsString;
   //End;
   //If dmData.ADQueryLoadPath.FieldByName('NOTE').AsString='Корневой каталог' then
   //Begin
    //Path:=dmData.ADQueryLoadPath.FieldByName('REPORT_PATH').AsString;
   //End;
   //if NOT DirectoryExists(dmData.ADQueryLoadPath.FieldByName('REPORT_PATH').AsString)and (dmData.ADQueryLoadPath.FieldByName('NOTE').AsString<>'Путь к инишнику и экзекеру') then
   //Begin
    //CreateDir(dmData.ADQueryLoadPath.FieldByName('REPORT_PATH').AsString);
    //if dmData.ADQueryLoadPath.FieldByName('NOTE').AsString='Корневой каталог' then
    //Begin
     //CopyFile(pchar(PathServer+'\CB.ini'),pchar(Path+'\CB.ini'),False);
     //CopyFile(pchar(PathServer+'\mail.exe'),pchar(Path+'\CB.exe'),False);
    //End;
   //End;
   //dmData.ADQueryLoadPath.Next;
  //end;

  //if Path<>'' then
  //Begin
   //F:=TStringList.Create;
   ///F.LoadFromFile(Path+'\CB.ini');{Вскрыть локальный инишник}
   //for I := 0 to F.Count - 1 do
   //begin
    //if I=0 then
    //begin
     //Version:=F[I];
     //dmData.ADQueryLoadVersion.Active:=True;
     //If Version <> dmData.ADQueryLoadVersion.FieldByName('VERSION_INFO').AsString then
     //Begin
      //CopyFile(pchar(PathServer+'\CB.ini'),pchar(Path+'\CB.ini'),False);
      //CopyFile(pchar(PathServer+'\mail.exe'),pchar(Path+'\CB.exe'),False);
     //End; //if
     //dmData.ADQueryLoadVersion.Active:=False;
    //end;//if
   //end;//for
   //F.Free;
  //End;
end;


procedure TfmMain.FormCreate(Sender: TObject);
var
  fINI : TIniFile;
  sIniName : String;
begin
  sIniName := ExtractFilePath(ParamStr(0))+'\cred.ini';
  btnSave.Enabled := False;
  //ShowMessage(sIniName);
  fINI := TIniFile.Create(sIniName);
  if FileExists(sIniName) then begin
     try
        DataBase := fINI.ReadString('CONNECT_PARAMS','DataBase','');
        User_Name := fINI.ReadString('CONNECT_PARAMS','User_Name','');
        Password := fINI.ReadString('CONNECT_PARAMS','Password','');
        Server := fINI.ReadString('CONNECT_PARAMS','Server','');
        DriverId := fINI.ReadString('CONNECT_PARAMS','DriverID','');
        Port := fINI.ReadString('CONNECT_PARAMS','Port','');
        Version := fINI.ReadString('INFO','Version','');
     finally
        fINI.Free;
     end;//finally
     edIP.Text := Server;
     dmData.conLoan.Connected := False;
     dmData.conLoan.Params.Clear;
     dmData.conLoan.Params.Add('DriverID='+DriverId);
     dmData.conLoan.Params.Add('Database='+DataBase);
     dmData.conLoan.Params.Add('Server='+ Server);
     dmData.conLoan.Params.Add('Password='+Password);
     dmData.conLoan.Params.Add('User_Name='+User_Name);
     dmData.conLoan.Params.Add('Port='+Port);
     try
       dmData.conLoan.Connected := True;
     except on E: Exception do
       ShowMessage('Во время подключенеие к БД  произошла ошибка: '+E.Message);
     end;//try
  end;//if
  if dmData.conLoan.Connected then begin
     if CopyNewVersion() then
     begin
       WinExec(PChar(ApplicationPath+'\loans.exe'), SW_SHOWNORMAL);
       IS_APP_RUN := True;
     end else begin
       WinExec(PChar(ApplicationPath+'\loans.exe'), SW_SHOWNORMAL);
       IS_APP_RUN := True;
     end;
  end  else begin
    btnSave.Enabled := True;
  end;



  //fmMain.Caption:=GetUserFromWindows;
  //CreateFoldersCB;
end;



procedure TfmMain.FormShow(Sender: TObject);
begin
   if IS_APP_RUN then Self.close;
   
end;

function TfmMain.GetVersionNumFromDB(): Boolean;
begin
  if dmData.conLoan.Connected then begin
     dmData.qrGetVersion.Active := False;
     try
        dmData.qrGetVersion.Active := True;
     except on E: Exception do
        ShowMessage(E.Message);
     end;
     if NOT dmData.qrGetVersion.EOF then begin
        VersionFromDB := dmData.qrGetVersion.FieldByName('APP_VERSION').AsString;
        ApplicationPath := dmData.qrGetVersion.FieldByName('APP_PATH').AsString;
        ReleasePath := dmData.qrGetVersion.FieldByName('APP_RELEASE_PATH').AsString;
        Result := True;
     end else Result := False;
  end  else Result := False;
end;

procedure TfmMain.SetApplicationPath(const Value: String);
begin
  FApplicationPath := Value;
end;

procedure TfmMain.SetDataBase(const Value: String);
begin
  FDataBase := Value;
end;

procedure TfmMain.SetDriverId(const Value: String);
begin
  FDriverId := Value;
end;

procedure TfmMain.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TfmMain.SetPort(const Value: string);
begin
  FPort := Value;
end;

procedure TfmMain.SetReleasePath(const Value: String);
begin
  FReleasePath := Value;
end;

procedure TfmMain.SetServer(const Value: String);
begin
  FServer := Value;
end;

procedure TfmMain.SetUser_Name(const Value: String);
begin
  FUser_Name := Value;
end;

procedure TfmMain.SetVersion(const Value: String);
begin
  FVersion := Value;
end;

procedure TfmMain.SetVersionFromDB(const Value: String);
begin
  FVersionFromDB := Value;
end;

end.
