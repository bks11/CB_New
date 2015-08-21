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
   InSign:String;{На шифрование}
   InArh:String;{На Архивирование}
   OutArh:String;{Архивировать}
  End;
  Procedure LoadPath; {Загрузить пути к папкам}
  {Для сформированных}
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

Uses
 uMain;

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
    MoveFile(PChar(Path.InArh+'\'+fmMain.CheckListBox311InArh.Items[fmMain.CheckListBox311InArh.ItemIndex]),PChar(Path.InArh+'\'+fmMain.CheckListBox311InArh.Items[fmMain.CheckListBox311InArh.ItemIndex]));
    fmMain.CheckListBox311InArh.ItemIndex:=fmMain.CheckListBox311InArh.ItemIndex+1;
   End;
  End;
  RefreshCheckListInSign;
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
    MoveFile(PChar(Path.InSign+'\'+fmMain.CheckListBox311InSign.Items[fmMain.CheckListBox311InSign.ItemIndex]),PChar(Path.InArh+'\'+fmMain.CheckListBox311InSign.Items[fmMain.CheckListBox311InSign.ItemIndex]));
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

Procedure Object311P.RefreshCheckListInArh;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 fmMain.CheckListBox311InArh.Items.Clear;
 FindRes:=Findfirst(Path.InArh+'\SBC*.xml',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   fmMain.CheckListBox311InArh.Items.Add(SerchFile.Name);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
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
    MoveFile(PChar(Path.InKa+'\'+fmMain.CheckListBox311InKa.Items[fmMain.CheckListBox311InKa.ItemIndex]),PChar(Path.InSign+'\'+fmMain.CheckListBox311InKa.Items[fmMain.CheckListBox311InKa.ItemIndex]));
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
    if IfError = False then
    Begin
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
  dmData.ADQuery311PLoadPath.Active:=False;
  dmData.ADQuery311PLoadPath.ParamByName('ID_REPORT').Value :=2;
  dmData.ADQuery311PLoadPath.Active:=True;
  dmData.ADQuery311PLoadPath.First;
  while NOT dmData.ADQuery311PLoadPath.Eof do
  begin
   If dmData.ADQuery311PLoadPath.FieldByName('NOTE').AsString='Сформированные' then Path.Sformirovanie:=dmData.ADQuery311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.ADQuery311PLoadPath.FieldByName('NOTE').AsString='На ключевание' then Path.InKa:=dmData.ADQuery311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.ADQuery311PLoadPath.FieldByName('NOTE').AsString='На шифрование' then Path.InSign:=dmData.ADQuery311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.ADQuery311PLoadPath.FieldByName('NOTE').AsString='На архивирование' then Path.InArh:=dmData.ADQuery311PLoadPath.FieldByName('REPORT_PATH').AsString;
   If dmData.ADQuery311PLoadPath.FieldByName('NOTE').AsString='Архивировать' then Path.OutArh:=dmData.ADQuery311PLoadPath.FieldByName('REPORT_PATH').AsString;
   dmData.ADQuery311PLoadPath.Next;
   {Архивировать}
  end;
 End;
 dmData.ADQuery311PLoadPath.Active:=False;

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
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 fmMain.CheckListBox311InSign.Items.Clear;
 FindRes:=Findfirst(Path.InSign+'\SBC*.xml',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   fmMain.CheckListBox311InSign.Items.Add(SerchFile.Name);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
End;

Procedure Object311P.RefreshCheckListInKa;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 fmMain.CheckListBox311InKa.Items.Clear;
 FindRes:=Findfirst(Path.InKa+'\SBC*.xml',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   fmMain.CheckListBox311InKa.Items.Add(SerchFile.Name);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
End;

Procedure Object311P.LoadSozdanFile;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
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

end.
