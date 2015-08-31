unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, ExtCtrls, StrUtils, ComCtrls, Grids, DBGrids;

const
UnixDateDelta = 25569; { 1970-01-01T00:00:00,0 }
SecPerMin = 60;
SecPerHour = SecPerMin * 60;
SecPerDay = SecPerHour * 24;
MinDayFraction = 1 / (24 * 60);
sSQL = 'insert into TLOG_INFO (REC_DATETIME, ACTION_LABEL, HOST_NAME, LOG_ACTION, ASTATE, ADEVICE, ANUM, PINGINFO, PINGSTATUS, PACKET_LOSS,  RTA)'+
         'VALUES ({0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10})';

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
    dlgOpen: TOpenDialog;
    btnOpen: TButton;
    lbLogFileName: TLabel;
    pbRecordsInsert: TProgressBar;
    lbRecCount: TLabel;
    sbInfo: TStatusBar;
    dtFrom: TDateTimePicker;
    dtTO: TDateTimePicker;
    lbFrom: TLabel;
    lbTo: TLabel;
    btnReport: TButton;
    grdReport: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOpenClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    FLogFilePath: String;
    FLogFileName: String;
    FTotalRecCount: integer;
    procedure SetLogFilePath(const Value: String);
    function ReadLogFile(sFileName: String): integer;
    function GetDataFromLine(sLine: String): string;
    function UnixTimeToDateTime(AUnixTime: DWord; ABias: Integer): TDateTime;
    function CheckForReload(): boolean;
    procedure SetLogFileName(const Value: String);
    procedure SetTotalRecCount(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    SL : TStringList;
    property LogFilePath: String read FLogFilePath write SetLogFilePath;
    property LogFileName : String read FLogFileName write SetLogFileName;
    property TotalRecCount: integer read FTotalRecCount write SetTotalRecCount;
    function CalcUpDown(hostName: String;
                           startTime : TDateTime;
                           endTime: TDateTime;
                           logAction : String;
                           out deltaUP :TDateTime;
                           out deltaDOWN : TDateTime): integer;
  end;

var
  Form1: TForm1;

implementation

uses Data;

{$R *.dfm}

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then begin
     lbLogFileName.Caption := '';
     LogFileName :=  ExtractFileName(dlgOpen.FileName);
     LogFilePath := ExtractFilePath(dlgOpen.FileName);
     lbLogFileName.Caption := dlgOpen.FileName;
  end;//if
end;

procedure TForm1.btnReportClick(Sender: TObject);
var
   dateFrom  : TDateTime;
   dateTo    : TDateTime;
   sHostName : String;
   ciscoFlap : integer;
   atmFlap   : integer;
   ciscoUP   : TDateTime;
   ciscoDOWN : TDateTime;
   atmUP     : TDateTime;
   atmDOWN   : TDateTime;
begin
  dateFrom := dtFrom.Date;
  dateTo   := dtTO.Date;
  if NOT  dmData.conNagios.Connected  then  begin
    try
      dmData.conNagios.Connected := True;
      sbInfo.Panels[0].Text := 'CONNECTED';
    except on E: Exception   do
      begin
         ShowMessage(E.Message);
         sbInfo.Panels[0].Text := 'NOT CONNECTED';
         Exit;
      end;
    end;
  end;//if
  try
     dmData.qrShowReport.Active := False;
     dmData.qrClearReport.ExecSQL;
     dmData.qrHostName.Open();
     dmData.qrHostName.First;
  except on E: Exception do
     ShowMessage(E.Message);
  end;
  while  NOT dmData.qrHostName.Eof  do  begin
    sHostName := dmData.qrHostName.FieldByName('HOST_NAME').AsString;
    ciscoFlap := CalcUpDown(sHostName,dateFrom,dateTo,'CHECK_BNKMT',ciscoUP,ciscoDOWN);
    atmFlap :=  CalcUpDown(sHostName,dateFrom,dateTo,'PING_ATM',atmUP,atmDOWN);
    dmData.qrInsertStatistic.Params.ParamByName('HOST_NAME').AsString := sHostName;
    dmData.qrInsertStatistic.Params.ParamByName('CISCO_UP').AsDateTime := ciscoUP;
    dmData.qrInsertStatistic.Params.ParamByName('CISCO_DOWN').AsDateTime := ciscoDOWN;
    dmData.qrInsertStatistic.Params.ParamByName('ATM_UP').AsDateTime := atmUP;
    dmData.qrInsertStatistic.Params.ParamByName('ATM_DOWN').AsDateTime := atmDOWN;
    dmData.qrInsertStatistic.Params.ParamByName('CISCO_COUNT').AsInteger := ciscoFlap;
    dmData.qrInsertStatistic.Params.ParamByName('ATM_COUNT').AsInteger := atmFlap;
    lbRecCount.Caption := sHostName;
    Application.ProcessMessages;
    try
       dmData.qrInsertStatistic.ExecSQL;
    except on E: Exception do
       ShowMessage(E.Message);
    end;
    dmData.qrHostName.Next;
  end;//while
  try
    dmData.qrShowReport.Open();
  except on E: Exception do
    ShowMessage(E.Message);       
  end;
end;

procedure TForm1.btnStartClick(Sender: TObject);
var
  i : integer;
  t : Word;
begin
  if CheckForReload() then begin
     t := MessageBox(Handle,PChar('Данные уже были загружены. Удалить существующие и загрузить снова?'),PChar('Внимание!!!'), MB_YESNO+MB_ICONQUESTION);
     case t  of
       IDYES:begin
            dmData.qrDeleteRecByFilename.ParamByName('FILE_NAME').Value := LogFileName;
            try
               dmData.qrDeleteRecByFilename.ExecSQL;
            except on E: Exception do
               ShowMessage(E.Message);
            end;//try-except
       end;//IDYES
       IDNO: Exit;
     end;//CASE
  end;//IF

  ReadLogFile(LogFileName);
  pbRecordsInsert.Min := 0;
  pbRecordsInsert.Max := TotalRecCount;
  for i := 0 to SL.Count - 1 do begin
    GetDataFromLine(SL[i]);
    pbRecordsInsert.Position := i;
    lbRecCount.Caption := IntToStr(i);
    Application.ProcessMessages;
  end;//for

end;

function TForm1.CalcUpDown(hostName: String;
                           startTime : TDateTime;
                           endTime: TDateTime;
                           logAction : String;
                           out deltaUP :TDateTime;
                           out deltaDOWN : TDateTime): integer;
var
   firstState : String;
   firstTime  : TDateTime;
   nextState  : String;
   nextTime   : TDateTime;
   i : integer;
   state : String;
   s1: String;
   s2: String;

begin
  dmData.qrUpDown.Active := False;
  dmData.qrUpDown.ParamByName('LOG_ACTION').Value := logAction;
  dmData.qrUpDown.ParamByName('HOST_NAME').Value := hostName;
  dmData.qrUpDown.ParamByName('START_TIME').Value := startTime;
  dmData.qrUpDown.ParamByName('END_TIME').Value := endTime;
  try
    dmData.qrUpDown.Open;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
  i := 0;
  deltaUP := 0;
  deltaDOWN := 0;
  dmData.qrUpDown.First;
  state  := dmData.qrUpDown.FieldByName('ASTATE').AsString;

  if (state = 'UP') OR (state = 'OK')  then
     firstState := 'UP'
  else
     firstState := 'DOWN';
  firstTime := dmData.qrUpDown.FieldByName('REC_DATETIME').AsDateTime;
  dmData.qrUpDown.Next;

  while NOT dmData.qrUpDown.Eof do begin
    state  := dmData.qrUpDown.FieldByName('ASTATE').AsString;
    if (state = 'UP') OR (state = 'OK')  then nextState := 'UP' else nextState := 'DOWN';
    nextTime :=  dmData.qrUpDown.FieldByName('REC_DATETIME').AsDateTime;
    if firstState = nextState then begin
       if firstState = 'UP'  then
          deltaUP := deltaUP + (nextTime-firstTime)
       else
          deltaDOWN := deltaDOWN + (nextTime-firstTime);
    end else begin
       Inc(i);
       if firstState = 'UP'  then
          deltaUP := deltaUP + (nextTime-firstTime)
       else
          deltaDOWN := deltaDOWN + (nextTime-firstTime);

       firstState := nextState;
    end;
    dmData.qrUpDown.Next;
  end;//while
  Result := i;
end;

function TForm1.CheckForReload: boolean;
begin
  dmData.qrCheckExistingRec.Active := False;
  dmData.qrCheckExistingRec.ParamByName('FILE_NAME').Value := LogFileName;
  try
    dmData.qrCheckExistingRec.Active := True;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
  if dmData.qrCheckExistingRec.RecordCount > 0 then Result := True else Result := False;
  dmData.qrCheckExistingRec.Active := False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dmData.conNagios.Connected :=False;
     SL.Clear;
     SL.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   ini : TIniFile;
   sIniFileName: String;
begin
   try
      dmData.conNagios.Connected := True;
      sbInfo.Panels[0].Text := 'CONNECTED';
   except on E: Exception   do
      begin
         ShowMessage(E.Message);
         sbInfo.Panels[0].Text := 'NOT CONNECTED';
      end;
   end;
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
   d       : DWORD;
   actionDate : TDateTime;

begin
   sDate := '';
   sLabel := '';
   sHostName := '';
   sState := '';
   sDevice := '';
   sNum := '0';
   sPingInfo := '';
   sPingStatus := '';
   sPacketLoss := '0';
   sRTA := '0';
   sAction := '';

     //GET  DATE
  i:= Pos('[',sLine);
  j:= Pos(']',sLine);
  sDate := Trim(Copy(sLine,i+1,j-i-1));
  d := StrToInt64(sDate);
  actionDate := UnixTimeToDateTime(d,-60);

  sDate := FormatDateTime('dd.mm.yyyy hh:nn:sss',actionDate);

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

     j:= PosEx(';',sLine,i+1);
     sState := Copy(sLine,i+1,j-i-1);

     i := PosEx(';',sLine,j+1);
     sDevice := Copy(sLine,j+1,i-j-1);

     j := PosEx(';',sLine,i+1);
     sNum := Copy(sLine,i+1,j-i-1);

     sPingInfo := Copy(sLine,j+1,Length(sLine));

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
  end;//'CURRENT SERVICE STATE'

  if (sLabel = 'HOST ALERT') then  begin
     j:= PosEx(';',sLine,i);
     sHostName :=  Copy(sLine,i+1,j-i-1);

     i:= PosEx(';',sLine,j+1);
     sState := Copy(sLine,j+1,i-j-1);

     j:= PosEx(';',sLine,i+1);
     sDevice := Copy(sLine,i+1,j-i-1);

     i := PosEx(';',sLine,j+1);
     sNum := Copy(sLine,j+1,i-j-1);

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

  end;//HOST ALERT

  if (sLabel = 'SERVICE ALERT') then  begin
     j:= PosEx(';',sLine,i);
     sHostName :=  Copy(sLine,i+1,j-i-1);

     i:= PosEx(';',sLine,j+1);
     sAction := Copy(sLine,j+1,i-j-1);

     j:= PosEx(';',sLine,i+1);
     sState := Copy(sLine,i+1,j-i-1);

     i := PosEx(';',sLine,j+1);
     sDevice := Copy(sLine,j+1,i-j-1);

     j := PosEx(';',sLine,i+1);
     sNum := Copy(sLine,i+1,j-i-1);

     sPingInfo := Copy(sLine,j+1,Length(sLine));

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

  end;

  if SysUtils.DecimalSeparator<>'.' then
     sRTA:=StringReplace(sRTA,'.',',',[rfReplaceAll, rfIgnoreCase]);
  if SysUtils.DecimalSeparator<>',' then
     sRTA:=StringReplace(sRTA,',','.',[rfReplaceAll, rfIgnoreCase]);




  if (sLabel = 'SERVICE ALERT') OR (sLabel = 'HOST ALERT') OR (sLabel = 'CURRENT HOST STATE') OR (sLabel = 'CURRENT SERVICE STATE') then
  begin
    dmData.qrInsertLog.ParamByName('REC_DATETIME').Value := actionDate;
    dmData.qrInsertLog.ParamByName('ACTION_LABEL').Value := sLabel;
    dmData.qrInsertLog.ParamByName('HOST_NAME').Value := sHostName;
    dmData.qrInsertLog.ParamByName('LOG_ACTION').Value := sAction;
    dmData.qrInsertLog.ParamByName('ASTATE').Value := sState;
    dmData.qrInsertLog.ParamByName('ADEVICE').Value := sDevice;
    dmData.qrInsertLog.ParamByName('ANUM').Value := StrToInt(sNum);
    dmData.qrInsertLog.ParamByName('PINGINFO').Value := sPingInfo;
    dmData.qrInsertLog.ParamByName('PINGSTATUS').Value := sPingStatus;
    dmData.qrInsertLog.ParamByName('PACKET_LOSS').Value := StrToInt(sPacketLoss);
    dmData.qrInsertLog.ParamByName('RTA').Value := StrToFloat(sRTA);   //StrToFloatDef()
    dmData.qrInsertLog.ParamByName('FILE_NAME').Value := LogFileName;
    try
      dmData.qrInsertLog.ExecSQL();
    except on E: Exception do
      ShowMessage(E.Message);
    end;
  end;




  Result := sDate+'!'+sHostName+'!'+sAction +'!'+sState+'!'+sDevice+'!'+sNum+'!'+sPingInfo+'!'+sPacketLoss+'!'+sRTA;


  //result := sDate+'!'+sLabel+'!'+sHostName+'!'+sState+'!'+sDevice+'!'+sNum+'!'+sPingInfo;
end;

function TForm1.ReadLogFile(sFileName: String): integer;
var
   tFile : TextFile;
   sFullFileName  :  String;
   s : String;
begin
   SL.Clear;
   TotalRecCount := 0;
   //LbLogLine.Items.Clear;
   sFullFileName := LogFilePath+sFileName;
   try
     AssignFile(tFile,sFullFileName);
     Reset(tFile);
     while not EOF(tFile) do begin
       s :='';
       Readln(tFile,s);
       SL.Add(s);
     end;//while
     TotalRecCount := SL.Count;
   finally
     CloseFile(tFile);
   end;


   //ShowMessage(GetDataFromLine(SL[StrToInt(Edit1.Text)]));
end;

procedure TForm1.SetLogFileName(const Value: String);
begin
  FLogFileName := Value;
end;

procedure TForm1.SetLogFilePath(const Value: String);
begin
  FLogFilePath := Value;
end;

procedure TForm1.SetTotalRecCount(const Value: integer);
begin
  FTotalRecCount := Value;
end;

function TForm1.UnixTimeToDateTime(AUnixTime: DWord; ABias: Integer): TDateTime;
begin
     Result := UnixDateDelta + (AUnixTime div SecPerDay) +
            ((AUnixTime mod SecPerDay) / SecPerDay) - ABias * MinDayFraction ;
end;

end.

