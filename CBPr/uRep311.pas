unit uRep311;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, DockTabSet, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons,
  WideStrings, FMTBcd, DB, SqlExpr, Data;

Type

 Object311P = Object
  Path : record
   Sformirovanie:String;{Сформированные}
   InKa:String;{На ключевание}
  End;
  Client311 : record
   Name:String;
   FIO:String;
   Shema:Byte;
   Operators:String;
   Acc:String;
   Path:String;
   FilName:String;
  End;

  Procedure LoadPath; {Загрузить пути к папкам}
  {Для сформированных}
  Procedure GetName311(FilName:String);{Получить имя фаила}
  Procedure GetParam311; {пропарсить фаил выбрать данные}
  Procedure RefreshCheckListSform; {Рефрешим лист сформированных}
  Procedure LoadSozdanFile; {Загрузить фаил для просмотра из чекбокса}
  Procedure Proverka; {Проверить сформ фаил на наличие ошибок и передать на подпись}
  Procedure CheckAll; {чекнуть все фаилы на проверку}
  {На подпись}
  Procedure RefreshCheckListInKa; {Рефрешим лист На подпись}
  Procedure CheckAllInKa; {чекнуть все фаилы на подпись}
  Procedure OtpravkaKa; {Отправить фаилы на крипто}
  {На крипто}
  Procedure RefreshCheckListInSign; {Рефрешим лист На крипто}
  Procedure CheckAllInSign; {чекнуть все фаилы на крипто}
  Procedure OtpravkaSign; {Отправить фаилы на Архивацию}
  {На архивирование}
  Procedure RefreshCheckListInArh; {Рефрешим лист На крипто}
  Procedure CheckAllInArh; {чекнуть все фаилы на крипто}
  Procedure OtpravkaArh; {Отправить фаилы на Архивацию}
 End;

implementation

{Select Count(ARCH_NAME) AS Col
FROM (SELECT DISTINCT "ARCH_NAME"
FROM "REP311"
where
"DATE_SEND" = current_date and
"ARCH_NAME" Like :Shema
Union
SELECT DISTINCT "ARCH_NAME"
FROM "REP3251"
where
"DATE_SEND" = current_date and
"ARCH_NAME" Like :Shema) As ARCH_NAME}


Uses
 uMain;

Procedure Object311P.GetParam311;
Var
 F:TStringList;
 I:Integer;
 J:Integer;
 S:String;
Begin
  Client311.FIO:='';
  f:=TStringList.Create();
  f.LoadFromFile(Client311.Path);
  GetName311(Client311.FilName);
  For I:=0 To f.Count-1 do
  Begin
   S:=f[I];
   If Pos('Имя=',S) >0 then
   Begin
    Delete(S,1,5);
    Delete(S,Pos('"',S),1);
    Client311.FIO:=Client311.FIO+' '+S;
   End;
   If Pos('Отчество=',S) >0 then
   Begin
    Delete(S,1,10);
    Delete(S,Pos('"',S),1);
    Client311.FIO:=Client311.FIO+' '+S;
   End;
   If Pos('ФамОтпр=',S) >0 then
   Begin
    Delete(S,1,9);
    Delete(S,Pos('"',S),1);
    Client311.Operators:=S;
   End;
   If Pos('НаимОрг=',S) >0 then
   Begin
    Delete(S,1,9);
    Delete(S,Pos('"',S),1);
    {&quot;}
    while Pos('&quot;',S) >0 do
    begin
     If Pos('&quot;',S) >0 then Delete(S,Pos('&quot;',S),6);
    End;
    while Pos('\',S) >0 do
    begin
     If Pos('\',S) >0 then Delete(S,Pos('\',S),1);
    End;
    If Length(S)>100 then Delete(S,100,Length(S)-100);
    Client311.FIO:=S;
   End;
   If Pos('Фамилия=',S) >0 then
   Begin
    Delete(S,1,9);
    Delete(S,Pos('"',S),1);
    Client311.FIO:=Client311.FIO+S;
   End;
   If Pos('НомСч=',S) >0 then
   Begin
    Delete(S,1,7);
    Delete(S,Pos('"',S),1);
    Client311.Acc:=S;
   End;
  End;
  f.Free;
  If Client311.Fio='' then Client311.FIO:=Client311.Name;
  If Client311.Operators='' then Client311.Operators:='Неизвестно'
End;

Procedure Object311P.RefreshCheckListInArh;
Begin
 fmMain.CheckListBox311InArh.Items.Clear;
 dmData.qr311GetArh.Active:=False;
 dmData.qr311GetArh.Active:=True;
 dmData.qr311GetArh.First;
 while NOT dmData.qr311GetArh.Eof do
 begin
  fmMain.CheckListBox311InArh.Items.Add(dmData.qr311GetArh.FieldByName('FILENAME').AsString);
  dmData.qr311GetArh.Next;
 end;
 dmData.qr311GetArh.Active:=False;
End;

Procedure Object311P.GetName311(FilName:String);{Получить имя фаила}
Var
 S:String;
Begin
 Client311.Name:='';
 S:=FilName;
 {SBP013510110_910220150220_249000031500031193_200.XML}
 If Pos('.xml',S)>0 then Delete(S,Pos('.xml',S),4);
 If Pos('.XML',S)>0 then Delete(S,Pos('.XML',S),4);
 S:=Copy(S,Length(S)-44,45);
 Client311.Name:=S;
End;

Procedure Object311P.OtpravkaArh;
Var
 I:Integer;
Begin
 if fmMain.CheckListBox311InArh.Items.Count>0 then
 Begin
  fmMain.CheckListBox311InArh.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBox311InArh.Items.Count - 1 do
  Begin
   if fmMain.CheckListBox311InArh.Checked[fmMain.CheckListBox311InArh.ItemIndex]=True then
   Begin
    {Пошли на подпись}
    {qrSendSign} {:ID_USER_SIGN} {:FILENAME}
    dmData.qrSendArh.ParamByName('ID_USER_CRYPT').Value:=UsersLogin.ID;
    dmData.qrSendArh.ParamByName('FILENAME').Value:=fmMain.CheckListBox311InArh.Items[fmMain.CheckListBox311InArh.ItemIndex];
    dmData.qrSendArh.ExecSQL;
    fmMain.CheckListBox311InArh.ItemIndex:=fmMain.CheckListBox311InArh.ItemIndex+1;
   End;
  End;
  RefreshCheckListInArh;
 End;
End;

Procedure Object311P.OtpravkaSign;
Var
 I:Integer;
Begin
 if fmMain.CheckListBox311InSign.Items.Count>0 then
 Begin
  fmMain.CheckListBox311InSign.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBox311InSign.Items.Count - 1 do
  Begin
   if fmMain.CheckListBox311InSign.Checked[fmMain.CheckListBox311InSign.ItemIndex]=True then
   Begin
    {Пошли на подпись}
    {qrSendSign} {:ID_USER_SIGN} {:FILENAME}
    dmData.qrSendKript.ParamByName('ID_USER_CRYPT').Value:=UsersLogin.ID;
    dmData.qrSendKript.ParamByName('FILENAME').Value:=fmMain.CheckListBox311InSign.Items[fmMain.CheckListBox311InSign.ItemIndex];
    dmData.qrSendKript.ExecSQL;
    fmMain.CheckListBox311InSign.ItemIndex:=fmMain.CheckListBox311InSign.ItemIndex+1;
   End;
  End;
  RefreshCheckListInSign;
 End;
End;

Procedure Object311P.CheckAllInArh;
Var
 I:Integer;
Begin
 if fmMain.CheckListBox311InArh.Items.Count>0 then
 Begin
  fmMain.CheckListBox311InArh.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBox311InArh.Items.Count - 1 do
  Begin
   fmMain.CheckListBox311InArh.Checked[fmMain.CheckListBox311InArh.ItemIndex]:=fmMain.CheckBox311InArhCheckAll.Checked;
   fmMain.CheckListBox311InArh.ItemIndex:=fmMain.CheckListBox311InArh.ItemIndex+1;
  End;
 End;
 fmMain.CheckListBox311InArh.ItemIndex:=0;
End;

Procedure Object311P.OtpravkaKa;
Var
 I:Integer;
Begin
 if fmMain.CheckListBox311InKa.Items.Count>0 then
 Begin
  fmMain.CheckListBox311InKa.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBox311InKa.Items.Count - 1 do
  Begin
   if fmMain.CheckListBox311InKa.Checked[fmMain.CheckListBox311InKa.ItemIndex]=True then
   Begin
    {Пошли на подпись}
    {qrSendSign} {:ID_USER_SIGN} {:FILENAME}
    dmData.qrSendSign.ParamByName('ID_USER_SIGN').Value:=UsersLogin.ID;
    dmData.qrSendSign.ParamByName('FILENAME').Value:=fmMain.CheckListBox311InKa.Items[fmMain.CheckListBox311InKa.ItemIndex];
    dmData.qrSendSign.ExecSQL;
    fmMain.CheckListBox311InKa.ItemIndex:=fmMain.CheckListBox311InKa.ItemIndex+1;
   End;
  End;
  RefreshCheckListInKa;
 End;
End;

Procedure Object311P.CheckAllInKa;
Var
 I:Integer;
Begin
 if fmMain.CheckListBox311InKa.Items.Count>0 then
 Begin
  fmMain.CheckListBox311InKa.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBox311InKa.Items.Count - 1 do
  Begin
   fmMain.CheckListBox311InKa.Checked[fmMain.CheckListBox311InKa.ItemIndex]:=fmMain.CheckBox311InKACheckAll.Checked;
   fmMain.CheckListBox311InKa.ItemIndex:=fmMain.CheckListBox311InKa.ItemIndex+1;
  End;
 End;
 fmMain.CheckListBox311InKa.ItemIndex:=0;
End;

Procedure Object311P.CheckAllInSign;
Var
 I:Integer;
Begin
 if fmMain.CheckListBox311InSign.Items.Count>0 then
 Begin
  fmMain.CheckListBox311InSign.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBox311InSign.Items.Count - 1 do
  Begin
   fmMain.CheckListBox311InSign.Checked[fmMain.CheckListBox311InSign.ItemIndex]:=fmMain.CheckBox311InSignCheckAll.Checked;
   fmMain.CheckListBox311InSign.ItemIndex:=fmMain.CheckListBox311InSign.ItemIndex+1;
  End;
 End;
 fmMain.CheckListBox311InSign.ItemIndex:=0;
End;

Procedure Object311P.CheckAll;
Var
 I:Integer;
Begin
 if fmMain.CheckListBox311Sform.Items.Count>0 then
 Begin
  fmMain.CheckListBox311Sform.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBox311Sform.Items.Count - 1 do
  Begin
   fmMain.CheckListBox311Sform.Checked[fmMain.CheckListBox311Sform.ItemIndex]:=fmMain.CheckBox311SformirovAllCheck.Checked;
   fmMain.CheckListBox311Sform.ItemIndex:=fmMain.CheckListBox311Sform.ItemIndex+1;
  End;
 End;
 fmMain.CheckListBox311Sform.ItemIndex:=0;
 LoadSozdanFile;
End;

Procedure Object311P.Proverka;
Var
 IfError:Boolean;
 I:Integer;
Begin
 if fmMain.CheckListBox311Sform.Items.Count>0 then
 Begin
  fmMain.CheckListBox311Sform.ItemIndex:=0;
  for I := 0 to fmMain.CheckListBox311Sform.Items.Count - 1 do
  Begin
   if fmMain.CheckListBox311Sform.Checked[fmMain.CheckListBox311Sform.ItemIndex]=True then
   Begin
    {Тут будут различные проверки на ошибки}
    IfError:=False;
    {Проверить на наличие отправленного фаила с таким же именем}
    if IfError=False then
    Begin
     GetName311(fmMain.CheckListBox311Sform.Items[fmMain.CheckListBox311Sform.ItemIndex]);
     dmData.qr311ProvOutFile.Active:=False;
     dmData.qr311ProvOutFile.ParamByName('FILENAME').Value :=Client311.Name;
     dmData.qr311ProvOutFile.Active:=True;
     dmData.qr311ProvOutFile.First;
     while NOT dmData.qr311ProvOutFile.Eof do
     begin
      IfError:=True;
      dmData.qr311ProvOutFile.Next;
     end;
     if IfError=True then {Если ошибка то уведомить об этом}
     Begin
      fmMain.ListBoxActivLog.Items.Add('311 Уведомление '+
                          fmMain.CheckListBox311Sform.Items[fmMain.CheckListBox311Sform.ItemIndex]+
                          ' уже отправлялось');
     End;
    End;
    if IfError = False then
    Begin
     {Добавить в Базу данных инфу по уведомлению}
     client311.Path:=Path.Sformirovanie+'\'+fmMain.CheckListBox311Sform.Items[fmMain.CheckListBox311Sform.ItemIndex];
     client311.FilName:=fmMain.CheckListBox311Sform.Items[fmMain.CheckListBox311Sform.ItemIndex];
     GetParam311;
     dmData.qr311LoadData.ParamByName('FILENAME').Value := Client311.Name;
     dmData.qr311LoadData.ParamByName('ID_USER').Value:=UsersLogin.ID;
     dmData.qr311LoadData.ParamByName('CLIENT_NAME').Value:=Client311.FIO;
     dmData.qr311LoadData.ParamByName('ACC_NUM').Value:=Client311.Acc;
     {Определить схему по которой будет уходить}
     dmData.qr311LoadData.ParamByName('SCHEME').Value:='2';
     if (Client311.Name[43]='1')or(Client311.Name[43]='2')or(Client311.Name[43]='6')or(Client311.Name[43]='0') then dmData.qr311LoadData.ParamByName('SCHEME').Value:='1';
     {dmData.qr311LoadData.ParamByName('DATE_SEND').Value:=Now;}
     dmData.qr311LoadData.ExecSQL;
     {Пошли на подпись}
     MoveFile(PChar(Path.Sformirovanie+'\'+fmMain.CheckListBox311Sform.Items[fmMain.CheckListBox311Sform.ItemIndex]),PChar(Path.InKa+'\'+fmMain.CheckListBox311Sform.Items[fmMain.CheckListBox311Sform.ItemIndex]));
     fmMain.CheckListBox311Sform.ItemIndex:=fmMain.CheckListBox311Sform.ItemIndex+1;
    End;
   End;
  End;
  RefreshCheckListSform;
 End;
End;

Procedure Object311P.LoadPath;
Begin
 if UsersLogin.Dostup.P311=True then
 Begin
  dmData.qr311PLoadPath.Active:=False;
  dmData.qr311PLoadPath.ParamByName('ID_REPORT').Value :=2;
  dmData.qr311PLoadPath.Active:=True;
  dmData.qr311PLoadPath.First;
  while NOT dmData.qr311PLoadPath.Eof do
  begin
   If dmData.qr311PLoadPath.FieldByName('NOTE').AsString='Сформированные' then begin
      Path.Sformirovanie:=dmData.qr311PLoadPath.FieldByName('REPORT_PATH').AsString;
      ShowMessage(Path.Sformirovanie);
   end;
   If dmData.qr311PLoadPath.FieldByName('NOTE').AsString='На ключевание' then begin
      Path.InKa:=dmData.qr311PLoadPath.FieldByName('REPORT_PATH').AsString;
      ShowMessage(Path.InKa);
   end;

   dmData.qr311PLoadPath.Next;
   {Архивировать}
  end;
 End;
 dmData.qr311PLoadPath.Active:=False;

End;

Procedure Object311P.RefreshCheckListSform;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 fmMain.Memo311SformEdit.Lines.Clear;
 fmMain.CheckListBox311Sform.Items.Clear;
 FindRes:=Findfirst(Path.Sformirovanie+'\SBC*.xml',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   fmMain.CheckListBox311Sform.Items.Add(SerchFile.Name);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
End;

Procedure Object311P.RefreshCheckListInSign;
Begin
 fmMain.CheckListBox311InSign.Items.Clear;
 dmData.qr311GetCript.Active:=False;
 dmData.qr311GetCript.Active:=True;
 dmData.qr311GetCript.First;
 while NOT dmData.qr311GetCript.Eof do
 begin
  fmMain.CheckListBox311InSign.Items.Add(dmData.qr311GetCript.FieldByName('FILENAME').AsString);
  dmData.qr311GetCript.Next;
 end;
 dmData.qr311GetCript.Active:=False;
End;

Procedure Object311P.RefreshCheckListInKa;
Begin
 fmMain.CheckListBox311InKa.Items.Clear;
 dmData.qr311GetSign.Active:=False;
 dmData.qr311GetSign.Active:=True;
 dmData.qr311GetSign.First;
 while NOT dmData.qr311GetSign.Eof do
 begin
  fmMain.CheckListBox311InKa.Items.Add(dmData.qr311GetSign.FieldByName('FILENAME').AsString);
  dmData.qr311GetSign.Next;
 end;
 dmData.qr311GetSign.Active:=False;
End;

Procedure Object311P.LoadSozdanFile;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 if fmMain.CheckListBox311Sform.Items.Count>0 then
 Begin
  fmMain.Memo311SformEdit.Lines.Clear;
  FindRes:=Findfirst(Path.Sformirovanie+'\SBC*.xml',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    If fmMain.CheckListBox311Sform.Items[fmMain.CheckListBox311Sform.ItemIndex]=SerchFile.Name then
    Begin
     fmMain.Memo311SformEdit.Lines.LoadFromFile(Path.Sformirovanie+'\'+SerchFile.Name);
     Break;
    End;
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
 End;
End;

end.
