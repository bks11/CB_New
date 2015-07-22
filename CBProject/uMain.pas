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
 F:TStringList;
 I: Integer;
 Version:String;
begin
  if NOT dmData.conCB.Connected then begin
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
  end;//if  not connected

  dmData.qrGetPath.Active :=  False;
  dmData.qrGetPath.Params.ParamByName('PATHID').Value := 1;
  try
    dmData.qrGetPath.Active := True;
    Path:=dmData.qrGetPath.FieldByName('Path').AsString;
    dmData.qrGetPath.Active := False;
  except on E: Exception do
    MessageDlg(E.Message,mtError,[mbOK],0);
  end;

  if NOT DirectoryExists('D:\CB') then
  begin
    //CreateDir('D:\CB');
    //CopyFile(pchar(Path+'CB.ini'),'D:\CB\CB.ini',False);
    //CopyFile(pchar(Path+'mail.exe'),'D:\CB\CB.exe',False);
  end else
  begin
    F:=TStringList.Create;
    //F.LoadFromFile('D:\CB\CB.ini');
    //for I := 0 to F.Count - 1 do
    //begin
      //if I=0 then begin
        //Version:=F[I];

        //fmMain.qrGetPath.SQL.Add('select Version from Path_Loader where Id=1');
        //fmMain.qrGetPath.Active:=True;
        //If Version <> fmMain.qrGetPath.FieldByName('Version').AsString then
          //Begin
            //CopyFile(pchar(Path+'CB.ini'),'D:\CB\CB.ini',False);
            //CopyFile(pchar(Path+'mail.exe'),'D:\CB\CB.exe',False);
          //End; //if
          //fmMain.qrGetPath.Active:=False;
      //end;//if
    //end;//for
  end;//if-else
  F.Free;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  fmMain.Caption:=GetUserFromWindows;
  CreateFoldersCB;
end;

end.
