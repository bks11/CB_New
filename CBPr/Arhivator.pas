unit Arhivator;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, DockTabSet, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons,
  WideStrings, FMTBcd, DB, SqlExpr, Data;

Type

 ObjectArhivator = Object
  Comand:String;
  Path : record
   In311A:String;
   Out311A:String;
   In311B:String;
   Out311B:String;
   InMail:String;
   OutMail:String;
  End;
  Procedure LoadPath; {Загрузить пути к папкам}
  Function RunArj:Boolean;{Исполняемая команда}
  {311}
  Procedure RefreshCheckList311; {Рефрешим лист На подпись}
  Procedure RefreshCheckList311B; {Рефрешим лист На подпись}
  Procedure CheckAll311; {чекнуть все фаилы на подпись}
  Procedure CheckAll311B; {чекнуть все фаилы на подпись}
  Procedure BildArhiv311; {Архивировать}
  Procedure BildArhiv311B; {Архивировать}
  {Mail}
  Procedure RefreshCheckListMail; {Рефрешим лист на пакеты}
  Procedure CheckAllMail; {чекнуть все фаилы на подпись}
  Procedure BildCab;

 End;

implementation

Uses
 uMain;     {}

Function InttoSymvol(Day:Integer):String;
Begin
 If Day<10 then Result:=IntToStr(Day);
 If Day=10 then Result:='a';
 If Day=11 then Result:='b';
 If Day=12 then Result:='c';
 If Day=13 then Result:='d';
 If Day=14 then Result:='i';
 If Day=15 then Result:='f';
 If Day=16 then Result:='g';
 If Day=17 then Result:='h';
 If Day=18 then Result:='i';
 If Day=19 then Result:='j';
 If Day=20 then Result:='k';
 If Day=21 then Result:='l';
 If Day=22 then Result:='m';
 If Day=23 then Result:='n';
 If Day=24 then Result:='o';
 If Day=25 then Result:='p';
 If Day=26 then Result:='q';
 If Day=27 then Result:='r';
 If Day=28 then Result:='s';
 If Day=29 then Result:='t';
 If Day=30 then Result:='u';
 If Day=31 then Result:='v';
 If Day=32 then Result:='w';
 If Day=33 then Result:='x';
 If Day=34 then Result:='y';
 If Day=35 then Result:='z';
End;

Function DayOfSymvol:String;
Var
 Year,Month,Day:Word;
Begin
 DecodeDate(Date(), Year, Month, Day);
 Result:=InttoSymvol(Day);
End;

Procedure ObjectArhivator.BildCab;
Var
 I:Integer;
 Count:Integer;
 StrCount:String;
Begin
 if fmMain.CheckListBoxArhivMail.Items.Count>0 then
 Begin
  fmMain.CheckListBoxArhivMail.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBoxArhivMail.Items.Count - 1 do
  Begin
   If fmMain.CheckListBoxArhivMail.Checked[I]=True then
   Begin
    dmData.qrArhMailGetCount.Active:=False;
    dmData.qrArhMailGetCount.ParamByName('Packet').Value:='2z%';
    dmData.qrArhMailGetCount.Active:=True;
    Count:=dmData.qrArhMailGetCount.FieldByName('Col').AsInteger;
    Count:=Count+1;
    if Count<=35 then
    Begin
     StrCount:='0'+InttoSymvol(Count);
    End Else
    Begin
     StrCount:=InttoSymvol(Count Div 35)+InttoSymvol(Count Mod 35)
    End;
    dmData.qrArhMailSetPak.ParamByName('ARC_NAME').Value:=fmMain.CheckListBoxArhivMail.Items[I];
    dmData.qrArhMailSetPak.ParamByName('PACKET_NAME').Value:='2z'+DayOfSymvol+StrCount+'110.010';
    dmData.qrArhMailSetPak.ExecSQL;
    Comand:='makecab '+Path.InMail+'\'+fmMain.CheckListBoxArhivMail.Items[I]+' '+Path.OutMail+'\2z'+DayOfSymvol+StrCount+'110.010';
    RunArj;
    DeleteFile(Path.InMail+'\'+fmMain.CheckListBoxArhivMail.Items[I]);
   End;
  End;
 End;
 fmMain.CheckListBoxArhivMail.ItemIndex:=0;
 RefreshCheckListMail;
End;

Procedure ObjectArhivator.CheckAllMail;
Var
 I:Integer;
Begin
 if fmMain.CheckListBoxArhivMail.Items.Count>0 then
 Begin
  fmMain.CheckListBoxArhivMail.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBoxArhivMail.Items.Count - 1 do
  Begin
   fmMain.CheckListBoxArhivMail.Checked[fmMain.CheckListBoxArhivMail.ItemIndex]:=fmMain.CheckBoxArhMailCheckAll.Checked;
   fmMain.CheckListBoxArhivMail.ItemIndex:=fmMain.CheckListBoxArhivMail.ItemIndex+1;
  End;
 End;
 fmMain.CheckListBoxArhivMail.ItemIndex:=0;
End;

Procedure ObjectArhivator.RefreshCheckListMail;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 dmData.qrArhMailUp.ParamByName('PACKET_CREATE').Value:=UsersLogin.ID;
 dmData.qrArhMailUp.ExecSQL;
 fmMain.CheckListBoxArhivMail.Items.Clear;
 FindRes:=Findfirst(Path.InMail+'\*.ARJ',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   fmMain.CheckListBoxArhivMail.Items.Add(SerchFile.Name);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
End;

function ObjectArhivator.RunArj:Boolean;
var
	StartupInfo : TStartupInfo;
	ProcessInfo : TProcessInformation;
	dwExitCode : DWord;
begin
 FillChar(StartupInfo, SizeOf(StartupInfo), 0);
 StartupInfo.cb := SizeOf(StartupInfo);
 StartupInfo.wShowWindow := SW_HIDE;
 StartupInfo.dwFlags := STARTF_USESHOWWINDOW	;
 dwExitCode := 0;
 try
 	Result := Win32Check(CreateProcess(nil, PChar(Comand), nil, nil, True,
 	CREATE_NEW_CONSOLE, nil, nil,	StartupInfo, ProcessInfo));
 except
 	on E :Exception do
 	begin
	 Result := False;
	end;
 end;
 if Result then
 begin
	while WaitForSingleObject(ProcessInfo.hProcess, 100) = WAIT_TIMEOUT do
	 Application.ProcessMessages;
	 GetExitCodeProcess(ProcessInfo.hProcess, dwExitCode);
	 if dwExitCode <> 0 then
	 begin
		Result := False;
	 end;
	 CloseHandle(ProcessInfo.hProcess);
	 CloseHandle(ProcessInfo.hThread);
 end;
end;

Function GetName311P(FilName:String):String;{Получить имя фаила}
Var
 S:String;
Begin
 Result:='';
 S:=FilName;
 {SBP013510110_910220150220_249000031500031193_200.XML}
 If Pos('.xml',S)>0 then Delete(S,Pos('.xml',S),4);
 If Pos('.XML',S)>0 then Delete(S,Pos('.XML',S),4);
 S:=Copy(S,Length(S)-44,45);
 Result:=S;
End;

Procedure ObjectArhivator.BildArhiv311;
Var
 I:Integer;
 ASt,BSt:String;
 ForI,A,B:Integer;
 Year, Month, Day: Word;
 LastShemaA:String;
 LastShemaB:String;
Begin
 dmData.qrLoadArhCounFromDate.Active:=False;
 dmData.qrLoadArhCounFromDate.ParamByName('Shema').Value :='A%';
 dmData.qrLoadArhCounFromDate.Active:=True;
 A:=dmData.qrLoadArhCounFromDate.FieldByName('col').AsInteger;
 dmData.qrLoadArhCounFromDate.Active:=False;
 DecodeDate(Date(), Year, Month, Day);
 ASt:=IntToStr(A+1);
 For ForI:=1 To 3 do
 Begin
  If Length(ASt)<4 then ASt:='0'+ASt;
 End;
 LastShemaA:='AN10110'+IntToStr(Year)[3]+IntToStr(Year)[4];
 If Month<10 then LastShemaA:=LastShemaA+'0';
 LastShemaA:=LastShemaA+IntToStr(Month);
 If Day<10 then LastShemaA:=LastShemaA+'0';
 LastShemaA:=LastShemaA+IntToStr(Day)+ASt;
 {Перед архивацией зарезервировать имя архива}
 dmData.qrLoadArhFromDate.ParamByName('ARC_NAME').Value :=LastShemaA+'.ARJ';
 dmData.qrLoadArhFromDate.ExecSQL;
 dmData.qrLoadArhId.Active:=False;
 dmData.qrLoadArhId.ParamByName('ARC_NAME').Value :=LastShemaA+'.ARJ';
 dmData.qrLoadArhId.Active:=True;
 for I:= 0 to fmMain.CheckListBoxArhiv311.Items.Count - 1 do
 Begin
  dmData.qr311InDbArhName.ParamByName('ID_ARCHIVE').Value :=dmData.qrLoadArhId.FieldByName('ID_ARCHIVE').AsInteger;
  dmData.qr311InDbArhName.ParamByName('FILENAME').Value :=GetName311P(fmMain.CheckListBoxArhiv311.Items[I]);
  dmData.qr311InDbArhName.ExecSQL;
 End;
 dmData.qrLoadArhId.Active:=False;
 {Архивируем}
 Comand:='ARJ32.EXE m -e '+Path.Out311A+'\'+LastShemaA+'.ARJ '+Path.In311A+'\*.*';
 RunArj;
 RefreshCheckList311;
End;

Procedure ObjectArhivator.BildArhiv311B;
Var
 I:Integer;
 ASt,BSt:String;
 ForI,A,B:Integer;
 Year, Month, Day: Word;
 LastShemaA:String;
 LastShemaB:String;
Begin
 dmData.qrLoadArhCounFromDate.Active:=False;
 dmData.qrLoadArhCounFromDate.ParamByName('Shema').Value :='B%';
 dmData.qrLoadArhCounFromDate.Active:=True;
 B:=dmData.qrLoadArhCounFromDate.FieldByName('Col').AsInteger;
 dmData.qrLoadArhCounFromDate.Active:=False;
 DecodeDate(Date(), Year, Month, Day);
 BSt:=IntToStr(B+1);
 For ForI:=1 To 3 do
 Begin
  If Length(BSt)<4 then BSt:='0'+BSt;
 End;
 LastShemaB:='BN10110'+IntToStr(Year)[3]+IntToStr(Year)[4];
 If Month<10 then LastShemaB:=LastShemaB+'0';
 LastShemaB:=LastShemaB+IntToStr(Month);
 If Day<10 then LastShemaB:=LastShemaB+'0';
 LastShemaB:=LastShemaB+IntToStr(Day)+BSt;
 {Перед архивацией зарезервировать имя архива}
 for I:= 0 to fmMain.CheckListBoxArhiv311B.Items.Count - 1 do
 Begin
  dmData.qr311InDbArhName.ParamByName('ARCH_NAME').Value :=LastShemaB;
  dmData.qr311InDbArhName.ParamByName('FILENAME').Value :=GetName311P(fmMain.CheckListBoxArhiv311B.Items[I]);
  dmData.qr311InDbArhName.ExecSQL;
 End;
 {Архивируем}
 Comand:='ARJ32.EXE m -e '+Path.Out311B+'\'+LastShemaB+'.ARJ '+Path.In311B+'\*.*';
 RunArj;
 RefreshCheckList311B;
End;

Procedure ObjectArhivator.CheckAll311;
Var
 I:Integer;
Begin
 if fmMain.CheckListBoxArhiv311.Items.Count>0 then
 Begin
  fmMain.CheckListBoxArhiv311.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBoxArhiv311.Items.Count - 1 do
  Begin
   fmMain.CheckListBoxArhiv311.Checked[fmMain.CheckListBoxArhiv311.ItemIndex]:=fmMain.CheckBoxArhiv311CheckAll.Checked;
   fmMain.CheckListBoxArhiv311.ItemIndex:=fmMain.CheckListBoxArhiv311.ItemIndex+1;
  End;
 End;
 fmMain.CheckListBoxArhiv311.ItemIndex:=0;
End;

Procedure ObjectArhivator.CheckAll311B;
Var
 I:Integer;
Begin
 if fmMain.CheckListBoxArhiv311B.Items.Count>0 then
 Begin
  fmMain.CheckListBoxArhiv311B.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBoxArhiv311B.Items.Count - 1 do
  Begin
   fmMain.CheckListBoxArhiv311B.Checked[fmMain.CheckListBoxArhiv311B.ItemIndex]:=fmMain.CheckBoxArhiv311CheckAllB.Checked;
   fmMain.CheckListBoxArhiv311B.ItemIndex:=fmMain.CheckListBoxArhiv311B.ItemIndex+1;
  End;
 End;
 fmMain.CheckListBoxArhiv311.ItemIndex:=0;
End;

Procedure ObjectArhivator.LoadPath;
Begin
 if UsersLogin.Dostup.Arhiv=True then
 Begin
  dmData.qr311PLoadPath.Active:=False;
  dmData.qr311PLoadPath.ParamByName('ID_REPORT').Value :=6;
  dmData.qr311PLoadPath.Active:=True;
  dmData.qr311PLoadPath.First;
  while NOT dmData.qr311PLoadPath.Eof do
  begin
   If dmData.qr311PLoadPath.FieldByName('NOTE').AsString='На архивирование A' then Path.In311A:=dmData.qr311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.qr311PLoadPath.FieldByName('NOTE').AsString='С архивирования A' then Path.Out311A:=dmData.qr311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.qr311PLoadPath.FieldByName('NOTE').AsString='На архивирование B' then Path.In311B:=dmData.qr311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.qr311PLoadPath.FieldByName('NOTE').AsString='С архивирования B' then Path.Out311B:=dmData.qr311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.qr311PLoadPath.FieldByName('NOTE').AsString='Почта входящие' then Path.InMail:=dmData.qr311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.qr311PLoadPath.FieldByName('NOTE').AsString='Почта исходящие' then Path.OutMail:=dmData.qr311PLoadPath.FieldByName('REPORT_PATH').AsString;
   dmData.qr311PLoadPath.Next;
  end;
 End;
 dmData.qr311PLoadPath.Active:=False;
End;

Procedure ObjectArhivator.RefreshCheckList311;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 fmMain.CheckListBoxArhiv311.Items.Clear;
 FindRes:=Findfirst(Path.In311A+'\SBC*.xml',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   fmMain.CheckListBoxArhiv311.Items.Add(SerchFile.Name);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
End;

Procedure ObjectArhivator.RefreshCheckList311B;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 fmMain.CheckListBoxArhiv311B.Items.Clear;
 FindRes:=Findfirst(Path.In311B+'\SBC*.xml',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   fmMain.CheckListBoxArhiv311B.Items.Add(SerchFile.Name);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
End;

end.
