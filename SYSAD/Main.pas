unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, ExtCtrls, StrUtils;

type
  TCurentHostState = Record
    ActionDate : String[20];
    EventName : String[50];
    HostName : String[20];
    State : String[20];
    Device: String[20];
    Num : String[20];
    PingInfo : String[150];
    PingStatus : String[20];
    PacketLoss: String[10];
    RTA : String[10];
  End;
type
  TForm1 = class(TForm)
    btnStart: TButton;
    pnlTop: TPanel;
    pnlMiddle: TPanel;
    pnlBottom: TPanel;
    LbLogLine: TListBox;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FLogFilePath: String;
    procedure SetLogFilePath(const Value: String);
    function ReadLogFile(sFileName: String): integer;
    function GetDataFromLine(sLine: String): string;
    { Private declarations }
  public
    { Public declarations }
    SL : TStringList;
    property LogFilePath: String read FLogFilePath write SetLogFilePath;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnStartClick(Sender: TObject);
var
  d :  TDateTime;
  s : String;
  i: integer;
begin
  d := 14398452;
  s := DateToStr(d);
  //ShowMessage(s);
  ReadLogFile('nagios-08-19-2015-00.log');
  {
  for i := 0 to SL.Count - 1 do begin
      LbLogLine.Items.Add(SL[i]);
  end;//for
  }
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     SL.Clear;
     SL.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   ini : TIniFile;
   sIniFileName: String;
begin
   SL := TStringList.Create();
   sIniFileName := ExtractFilePath(ParamStr(0))+'\logread.ini';
   if FileExists(sIniFileName) then begin
      try
         ini := TIniFile.Create(sIniFileName);
         LogFilePath := ini.ReadString('FILEPATH','path','');
      finally
         ini.Free;
      end; //try finally
   end;//if

end;

function TForm1.GetDataFromLine(sLine: String): String;
var
   i: integer;
   j: integer;
   sDate :  String;
   sLabel : String;
   sHostName :  String;
   sState : String;
   sDevice :  String;
   sNum : String;
   sPingInfo : String;
   sPingStatus : String;
   sPacketLoss : String;
   sRTA : String;

   sAction : String;
begin
     //GET  DATE
  i:= Pos('[',sLine);
  j:= Pos(']',sLine);
  sDate := Copy(sLine,i+1,j-i-1);

  i := Pos(':',sLine);
  sLabel := Trim(Copy(Sline,j+1,i-j-1));

  if (sLabel = 'CURRENT HOST STATE') then  begin
     j:= PosEx(';',sLine,i);
     sHostName :=  Copy(sLine,i+1,j-i-1);

     i:= PosEx(';',sLine,j+1);
     sState := Copy(sLine,j+1,i-j-1);

     j := PosEx(';',sLine,i+1);
     sDevice :=  Copy(sLine,i+1,j-i-1);

     i := PosEx(';',sLine,j+1);
     sNum := Copy(sLine,j+1,i-j-1);

     j := PosEx(';',sLine,i+1);
     sPingInfo := Copy(sLine,i+1,Length(sLine));

     i := Pos('-',sPingInfo);
     sPingStatus :=  Trim(Copy(sPingInfo,1,i-1));

     if (sPingStatus = 'PING OK') then begin
        i:= Pos('=',sPingInfo);
        j:= Pos('%',sPingInfo);
        sPacketLoss := Copy(sPingInfo,i+1,j-i-1);

        i := Pos('RTA',sPingInfo);
        j := Pos('ms',sPingInfo);
        sRTA := Trim(Copy(sPingInfo,i+5,j-i-5));

     end else begin
        sPacketLoss :='100';
        sRTA:='50000';
     end;//if - else   PING OK
  end;//if   sLabel = 'CURRENT HOST STATE'

  if (sLabel = 'CURRENT SERVICE STATE') then  begin
     j:= PosEx(';',sLine,i);
     sHostName :=  Copy(sLine,i+1,j-i-1);

     i:= PosEx(';',sLine,j+1);
     sAction := Copy(sLine,j+1,i-j-1);

  end;





  Result := sAction;


  //result := sDate+'!'+sLabel+'!'+sHostName+'!'+sState+'!'+sDevice+'!'+sNum+'!'+sPingInfo;
end;

function TForm1.ReadLogFile(sFileName: String): integer;
var
   tFile : TextFile;
   sFullFileName  :  String;
   s : String;
begin
   SL.Clear;
   LbLogLine.Items.Clear;
   sFullFileName := LogFilePath+sFileName;
   AssignFile(tFile,sFullFileName);
   Reset(tFile);
   while not EOF(tFile) do begin
     s :='';
     Readln(tFile,s);
     SL.Add(s);
   end;//while
   ShowMessage(GetDataFromLine(SL[StrToInt(Edit1.Text)]));
end;

procedure TForm1.SetLogFilePath(const Value: String);
begin
  FLogFilePath := Value;
end;

end.
