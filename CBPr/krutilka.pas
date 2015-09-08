unit krutilka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, DockTabSet, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons,
  WideStrings, FMTBcd, DB, SqlExpr, Data;

Type

 ObjectKrutilka = Object
  Path : record
   {311}
   P311 : Record
    Step1:Record {Подготовка отправки на подпись}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step2:Record {Добавить в архив}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step3:Record {Отправка на подпись}
     Name:String;
     PIn:String;
     POut:String;
    End;
   End;
   {Хранилище}
   Hron : Record
    Step1:Record {311 Отправка на подпись}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step2:Record {311 На Криптование}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step3:Record {311 Отправка на криптование}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step4:Record {311 На архив схема 1}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step5:Record {311 На архив схема 2}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step6:Record {311 Почта на подпись A}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step7:Record {311 Почта на подпись B}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step8:Record {Почта на формирование}
     Name:String;
     PIn:String;
     POut:String;
    End;
   End;
   {Верба}
   Verba : Record
    Step1:Record {311 Подготовка на подпись}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step2:Record {311 Отправка на подпись}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step3:Record {311 Отправить подписанные}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step4:Record {311 Подготовка на крипто}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step5:Record {311 Отправка на крипто}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step6:Record {311 Отправить криптованные}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step7:Record {311 Почта подготовка подпись}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step8:Record {311 Почта подпись}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step9:Record {Почта с подписи}
     Name:String;
     PIn:String;
     POut:String;
    End;
   End;
   {Архиватор}
   Arhivator : Record
    Step1:Record {311 Подготовка на Архив А}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step2:Record {311 Подготовка на Архив Б}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step3:Record {311 Отправка на архив А}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step4:Record {311 Отправка на архив Б}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step5:Record {311 Отправить арзив А}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step6:Record {311 Отправить арзив Б}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step7:Record {Почта подготовка пакета}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step8:Record {Почта формирование пакета}
     Name:String;
     PIn:String;
     POut:String;
    End;
    Step9:Record {Почта отправка пакета}
     Name:String;
     PIn:String;
     POut:String;
    End;
   End;
  End;
  Procedure LoadPath; {Загрузить пути к папкам}
  Procedure Pusk311; {Пуск 311}
  Procedure PuskHron; {Пуск Хранилище}
  Procedure PuskVerba; {Пуск Верба}
  Procedure PuskArhiv; {Пуск Архив}
  {311}
 End;

implementation

Uses
 uMain;     {}

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

Function ColFilesFromDir(Path:String):Integer;
Var
 SerchFile:TSearchRec;
 FindRes:Integer;
 Count:Integer;
Begin
 Result:=0;
 Count:=0;
 FindRes:=Findfirst(Path+'\*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   Count:=Count+1;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 Result:=Count;
End;

Procedure ObjectKrutilka.PuskVerba;
Var
 I:Integer;
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin

 if fmMain.CheckListBoxKrutVerba.Items.Count>0 then
 Begin
  for I := 0 to fmMain.CheckListBoxKrutVerba.Items.Count - 1 do
  Begin
   fmMain.CheckListBoxKrutVerba.Checked[I]:=False;
  End;
  for I := 0 to fmMain.CheckListBoxKrutVerba.Items.Count - 1 do
  Begin
   {}
   fmMain.ProgressBarKrutVerba.Step:=1;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step1.Name then {Step 1}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step1.PIn);
    dmData.qrKrutVerba311SignUpd.ParamByName('ID_USER_RS').Value:=UsersLogin.ID;
    dmData.qrKrutVerba311SignUpd.ExecSQL;
    FindRes:=Findfirst(Path.Verba.step1.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      {GetName311P}
      dmData.qrKrutVerba311SignLoad.Active:=False;
      dmData.qrKrutVerba311SignLoad.ParamByName('ID_USER_RS').Value:=UsersLogin.ID;
      dmData.qrKrutVerba311SignLoad.Active:=True;
      dmData.qrKrutVerba311SignLoad.First;
      while NOT dmData.qrKrutVerba311SignLoad.Eof do
      begin
       If GetName311P(SerchFile.Name)= dmData.qrKrutVerba311SignLoad.FieldByName('FILENAME').AsString then
       Begin
        If MoveFile(PChar(Path.Verba.step1.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step1.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutVerba.StepIt;
        End;
       End;
       dmData.qrKrutVerba311SignLoad.Next;
      end;
      dmData.qrKrutVerba311SignLoad.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step2.Name then {Step 2}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step2.PIn);
    FindRes:=Findfirst(Path.Verba.step2.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Verba.step2.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step2.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutVerba.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step3.Name then {Step 3}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step3.PIn);
    FindRes:=Findfirst(Path.Verba.step3.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Verba.step3.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step3.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutVerba.StepIt;
       dmData.qrKrutVerba311SignComplit.ParamByName('FILENAME').Value:=GetName311P(SerchFile.Name);
       dmData.qrKrutVerba311SignComplit.ExecSQL;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step4.Name then {Step 4}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step4.PIn);
    dmData.qrKrutVerba311CriptUpd.ParamByName('ID_USER_RC').Value:=UsersLogin.ID;
    dmData.qrKrutVerba311CriptUpd.ExecSQL;
    FindRes:=Findfirst(Path.Verba.step4.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      {GetName311P}
      dmData.qrKrutVerba311CriptLoad.Active:=False;
      dmData.qrKrutVerba311CriptLoad.ParamByName('ID_USER_RC').Value:=UsersLogin.ID;
      dmData.qrKrutVerba311CriptLoad.Active:=True;
      dmData.qrKrutVerba311CriptLoad.First;
      while NOT dmData.qrKrutVerba311CriptLoad.Eof do
      begin
       If GetName311P(SerchFile.Name)= dmData.qrKrutVerba311CriptLoad.FieldByName('FILENAME').AsString then
       Begin
        If MoveFile(PChar(Path.Verba.step4.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step4.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutVerba.StepIt;
        End;
       End;
       dmData.qrKrutVerba311CriptLoad.Next;
      end;
      dmData.qrKrutVerba311CriptLoad.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step5.Name then {Step 5}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step5.PIn);
    FindRes:=Findfirst(Path.Verba.step5.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Verba.step5.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step5.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutVerba.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step6.Name then {Step 6}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step6.PIn);
    FindRes:=Findfirst(Path.Verba.step6.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Verba.step6.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step6.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutVerba.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step7.Name then {Step 7}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step7.PIn);
    FindRes:=Findfirst(Path.Verba.step7.PIn+'\*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Verba.step7.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step7.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutVerba.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step8.Name then {Step 8}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step8.PIn);
    FindRes:=Findfirst(Path.Verba.step8.PIn+'\*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Verba.step8.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step8.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutVerba.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
   if fmMain.CheckListBoxKrutVerba.Items[I]=Path.Verba.step9.Name then {Step 9}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutVerba.Max:=ColFilesFromDir(Path.Verba.step9.PIn);
    FindRes:=Findfirst(Path.Verba.step9.PIn+'\*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Verba.step9.PIn+'\'+SerchFile.Name),PChar(Path.Verba.step9.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutVerba.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutVerba.Checked[I]:=True;
    fmMain.ProgressBarKrutVerba.Position:=0;
   End;
  End;
 End;
End;

Procedure ObjectKrutilka.PuskHron;
Var
 I:Integer;
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin

 if fmMain.CheckListBoxKrutHron.Items.Count>0 then
 Begin
  for I := 0 to fmMain.CheckListBoxKrutHron.Items.Count - 1 do
  Begin
   fmMain.CheckListBoxKrutHron.Checked[I]:=False;
  End;
  for I := 0 to fmMain.CheckListBoxKrutHron.Items.Count - 1 do
  Begin
   {}
   fmMain.ProgressBarKrutHron.Step:=1;
   if fmMain.CheckListBoxKrutHron.Items[I]=Path.Hron.step1.Name then {Step 1}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutHron.Max:=ColFilesFromDir(Path.Hron.step1.PIn);
    FindRes:=Findfirst(Path.Hron.step1.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      {GetName311P}
      dmData.qrHronKrutSign311.Active:=False;
      dmData.qrHronKrutSign311.Active:=True;
      dmData.qrHronKrutSign311.First;
      while NOT dmData.qrHronKrutSign311.Eof do
      begin
       If GetName311P(SerchFile.Name)= dmData.qrHronKrutSign311.FieldByName('FILENAME').AsString then
       Begin
        If MoveFile(PChar(Path.Hron.step1.PIn+'\'+SerchFile.Name),PChar(Path.Hron.step1.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutHron.StepIt;
        End;
       End;
       dmData.qrHronKrutSign311.Next;
      end;
      dmData.qrHronKrutSign311.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutHron.Checked[I]:=True;
    fmMain.ProgressBarKrutHron.Position:=0;
   End;
   if fmMain.CheckListBoxKrutHron.Items[I]=Path.Hron.step2.Name then {Step2}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutHron.Max:=ColFilesFromDir(Path.Hron.step2.PIn);
    FindRes:=Findfirst(Path.Hron.step2.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Hron.step2.PIn+'\'+SerchFile.Name),PChar(Path.Hron.step2.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutHron.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutHron.Checked[I]:=True;
    fmMain.ProgressBarKrutHron.Position:=0;
   End;
   if fmMain.CheckListBoxKrutHron.Items[I]=Path.Hron.step3.Name then {Step 3}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutHron.Max:=ColFilesFromDir(Path.Hron.step3.PIn);
    FindRes:=Findfirst(Path.Hron.step3.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      {GetName311P}
      dmData.qrHronKrutCript311.Active:=False;
      dmData.qrHronKrutCript311.Active:=True;
      dmData.qrHronKrutCript311.First;
      while NOT dmData.qrHronKrutCript311.Eof do
      begin
       If GetName311P(SerchFile.Name)= dmData.qrHronKrutCript311.FieldByName('FILENAME').AsString then
       Begin
        If MoveFile(PChar(Path.Hron.step3.PIn+'\'+SerchFile.Name),PChar(Path.Hron.step3.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutHron.StepIt;
        End;
       End;
       dmData.qrHronKrutCript311.Next;
      end;
      dmData.qrHronKrutCript311.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutHron.Checked[I]:=True;
    fmMain.ProgressBarKrutHron.Position:=0;
   End;
   if fmMain.CheckListBoxKrutHron.Items[I]=Path.Hron.step4.Name then {Step 4}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutHron.Max:=ColFilesFromDir(Path.Hron.step4.PIn);
    FindRes:=Findfirst(Path.Hron.step4.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      {GetName311P}
      dmData.qrKrutHronArh311.Active:=False;
      dmData.qrKrutHronArh311.ParamByName('SCHEME').Value:='1';
      dmData.qrKrutHronArh311.Active:=True;
      dmData.qrKrutHronArh311.First;
      while NOT dmData.qrKrutHronArh311.Eof do
      begin
       If GetName311P(SerchFile.Name)= dmData.qrKrutHronArh311.FieldByName('FILENAME').AsString then
       Begin
        If MoveFile(PChar(Path.Hron.step4.PIn+'\'+SerchFile.Name),PChar(Path.Hron.step4.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutHron.StepIt;
        End;
       End;
       dmData.qrKrutHronArh311.Next;
      end;
      dmData.qrKrutHronArh311.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutHron.Checked[I]:=True;
    fmMain.ProgressBarKrutHron.Position:=0;
   End;
   if fmMain.CheckListBoxKrutHron.Items[I]=Path.Hron.step5.Name then {Step 5}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutHron.Max:=ColFilesFromDir(Path.Hron.step5.PIn);
    FindRes:=Findfirst(Path.Hron.step5.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      {GetName311P}
      dmData.qrKrutHronArh311.Active:=False;
      dmData.qrKrutHronArh311.ParamByName('SCHEME').Value:='2';
      dmData.qrKrutHronArh311.Active:=True;
      dmData.qrKrutHronArh311.First;
      while NOT dmData.qrKrutHronArh311.Eof do
      begin
       If GetName311P(SerchFile.Name)= dmData.qrKrutHronArh311.FieldByName('FILENAME').AsString then
       Begin
        If MoveFile(PChar(Path.Hron.step5.PIn+'\'+SerchFile.Name),PChar(Path.Hron.step5.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutHron.StepIt;
        End;
       End;
       dmData.qrKrutHronArh311.Next;
      end;
      dmData.qrKrutHronArh311.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutHron.Checked[I]:=True;
    fmMain.ProgressBarKrutHron.Position:=0;
   End;
   if fmMain.CheckListBoxKrutHron.Items[I]=Path.Hron.step6.Name then {Step 6}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutHron.Max:=ColFilesFromDir(Path.Hron.step6.PIn);
    FindRes:=Findfirst(Path.Hron.step6.PIn+'\*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      dmData.qrKrutHromMailSign.Active:=False;
      dmData.qrKrutHromMailSign.Active:=True;
      dmData.qrKrutHromMailSign.First;
      while NOT dmData.qrKrutHromMailSign.Eof do
      begin
       If SerchFile.Name= dmData.qrKrutHromMailSign.FieldByName('ARC_NAME').AsString then
       Begin
        If MoveFile(PChar(Path.Hron.step6.PIn+'\'+SerchFile.Name),PChar(Path.Hron.step6.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutHron.StepIt;
        End;
       End;
       dmData.qrKrutHromMailSign.Next;
      end;
      dmData.qrKrutHromMailSign.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutHron.Checked[I]:=True;
    fmMain.ProgressBarKrutHron.Position:=0;
   End;
   if fmMain.CheckListBoxKrutHron.Items[I]=Path.Hron.step7.Name then {Step 7}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutHron.Max:=ColFilesFromDir(Path.Hron.step7.PIn);
    FindRes:=Findfirst(Path.Hron.step7.PIn+'\*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      dmData.qrKrutHromMailSign.Active:=False;
      dmData.qrKrutHromMailSign.Active:=True;
      dmData.qrKrutHromMailSign.First;
      while NOT dmData.qrKrutHromMailSign.Eof do
      begin
       If SerchFile.Name= dmData.qrKrutHromMailSign.FieldByName('ARC_NAME').AsString then
       Begin
        If MoveFile(PChar(Path.Hron.step7.PIn+'\'+SerchFile.Name),PChar(Path.Hron.step7.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutHron.StepIt;
        End;
       End;
       dmData.qrKrutHromMailSign.Next;
      end;
      dmData.qrKrutHromMailSign.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutHron.Checked[I]:=True;
    fmMain.ProgressBarKrutHron.Position:=0;
   End;
   if fmMain.CheckListBoxKrutHron.Items[I]=Path.Hron.step8.Name then {Step 8}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutHron.Max:=ColFilesFromDir(Path.Hron.step8.PIn);
    FindRes:=Findfirst(Path.Hron.step8.PIn+'\*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      dmData.qrKrutHromMailCreate.Active:=False;
      dmData.qrKrutHromMailCreate.Active:=True;
      dmData.qrKrutHromMailCreate.First;
      while NOT dmData.qrKrutHromMailCreate.Eof do
      begin
       If SerchFile.Name= dmData.qrKrutHromMailCreate.FieldByName('ARC_NAME').AsString then
       Begin
        If MoveFile(PChar(Path.Hron.step8.PIn+'\'+SerchFile.Name),PChar(Path.Hron.step8.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutHron.StepIt;
        End;
       End;
       dmData.qrKrutHromMailCreate.Next;
      end;
      dmData.qrKrutHromMailCreate.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutHron.Checked[I]:=True;
    fmMain.ProgressBarKrutHron.Position:=0;
   End;
  End;
 End;
End;

Procedure ObjectKrutilka.Pusk311;
Var
 I:Integer;
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin

 if fmMain.CheckListBoxKrut311Action.Items.Count>0 then
 Begin
  for I := 0 to fmMain.CheckListBoxKrut311Action.Items.Count - 1 do
  Begin
   fmMain.CheckListBoxKrut311Action.Checked[I]:=False;
  End;
  for I := 0 to fmMain.CheckListBoxKrut311Action.Items.Count - 1 do
  Begin
   {}
   fmMain.ProgressBarKrut311.Step:=1;
   if fmMain.CheckListBoxKrut311Action.Items[I]=Path.P311.step1.Name then {Step 1}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrut311.Max:=ColFilesFromDir(Path.P311.step1.PIn);
    FindRes:=Findfirst(Path.P311.step1.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.P311.step1.PIn+'\'+SerchFile.Name),PChar(Path.P311.step1.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrut311.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrut311Action.Checked[I]:=True;
    fmMain.ProgressBarKrut311.Position:=0;
   End;
   if fmMain.CheckListBoxKrut311Action.Items[I]=Path.P311.Step2.Name then{Step2}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrut311.Max:=ColFilesFromDir(Path.P311.step2.PIn);
    FindRes:=Findfirst(Path.P311.step2.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      if DirectoryExists(Path.P311.step2.POut+'\'+DateToStr(Date))=False then CreateDir(Path.P311.step2.POut+'\'+DateToStr(Date));
      If CopyFile(PChar(Path.P311.step2.PIn+'\'+SerchFile.Name),PChar(Path.P311.step2.POut+'\'+DateToStr(Date)+'\'+SerchFile.Name),True) then
      Begin
       fmMain.ProgressBarKrut311.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrut311Action.Checked[I]:=True;
    fmMain.ProgressBarKrut311.Position:=0;
   End;
   if fmMain.CheckListBoxKrut311Action.Items[I]=Path.P311.Step3.Name then {Step3}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrut311.Max:=ColFilesFromDir(Path.P311.step3.PIn);
    FindRes:=Findfirst(Path.P311.step3.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.P311.step3.PIn+'\'+SerchFile.Name),PChar(Path.P311.step3.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrut311.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrut311Action.Checked[I]:=True;
    fmMain.ProgressBarKrut311.Position:=0;
   End;
  End;
 End;
End;

Procedure ObjectKrutilka.LoadPath;
Begin
 fmMain.CheckListBoxKrutVerba.Items.Clear;
 fmMain.CheckListBoxKrut311Action.Items.Clear;
 fmMain.CheckListBoxKrutHron.Items.Clear;
 fmMain.CheckListBoxKrutArhiv.Items.Clear;
 if (UsersLogin.Dostup.Krutilka=True) and (UsersLogin.Dostup.P311=True) then
 Begin
  Path.P311.step1.Name:='Подготовка отправки на подпись';
  Path.P311.step2.Name:='Добавить в архив';
  Path.P311.step3.Name:='Отправка на подпись';
  dmData.qrKrutLoadPath.Active:=False;
  dmData.qrKrutLoadPath.ParamByName('ID_REPORT').Value :=2;
  dmData.qrKrutLoadPath.Active:=True;
  dmData.qrKrutLoadPath.First;
  while NOT dmData.qrKrutLoadPath.Eof do
  begin
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.P311.step2.Name then Path.P311.step2.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.P311.step2.Name then Path.P311.step2.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.P311.step1.Name then Path.P311.step1.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.P311.step1.Name then Path.P311.step1.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.P311.step3.Name then Path.P311.step3.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.P311.step3.Name then Path.P311.step3.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   dmData.qrKrutLoadPath.Next;
  end;
  fmMain.CheckListBoxKrut311Action.Items.Add(Path.P311.step1.Name);
  fmMain.CheckListBoxKrut311Action.Items.Add(Path.P311.step2.Name);
  fmMain.CheckListBoxKrut311Action.Items.Add(Path.P311.step3.Name);
 End;
 if (UsersLogin.Dostup.Krutilka=True) and (UsersLogin.Dostup.Hranilishe=True) then
 Begin
  Path.Hron.step1.Name:='311 Отправка на подпись';
  Path.Hron.step2.Name:='311 На Криптование';
  Path.Hron.step3.Name:='311 Отправка на криптование';
  Path.Hron.step4.Name:='311 На архив схема 1';
  Path.Hron.step5.Name:='311 На архив схема 2';
  Path.Hron.step6.Name:='311 Почта на подпись A';
  Path.Hron.step7.Name:='311 Почта на подпись B';
  Path.Hron.step8.Name:='Почта на формирование';
  dmData.qrKrutLoadPath.Active:=False;
  dmData.qrKrutLoadPath.ParamByName('ID_REPORT').Value :=8;
  dmData.qrKrutLoadPath.Active:=True;
  dmData.qrKrutLoadPath.First;
  while NOT dmData.qrKrutLoadPath.Eof do
  begin
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step1.Name then Path.Hron.step1.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step1.Name then Path.Hron.step1.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step2.Name then Path.Hron.step2.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step2.Name then Path.Hron.step2.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step3.Name then Path.Hron.step3.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step3.Name then Path.Hron.step3.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step4.Name then Path.Hron.step4.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step4.Name then Path.Hron.step4.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step5.Name then Path.Hron.step5.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step5.Name then Path.Hron.step5.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step6.Name then Path.Hron.step6.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step6.Name then Path.Hron.step6.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step7.Name then Path.Hron.step7.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step7.Name then Path.Hron.step7.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step8.Name then Path.Hron.step8.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Hron.step8.Name then Path.Hron.step8.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   dmData.qrKrutLoadPath.Next;
  end;

  fmMain.CheckListBoxKrutHron.Items.Add(Path.Hron.step1.Name);
  fmMain.CheckListBoxKrutHron.Items.Add(Path.Hron.step2.Name);
  fmMain.CheckListBoxKrutHron.Items.Add(Path.Hron.step3.Name);
  fmMain.CheckListBoxKrutHron.Items.Add(Path.Hron.step4.Name);
  fmMain.CheckListBoxKrutHron.Items.Add(Path.Hron.step5.Name);
  fmMain.CheckListBoxKrutHron.Items.Add(Path.Hron.step6.Name);
  fmMain.CheckListBoxKrutHron.Items.Add(Path.Hron.step7.Name);
  fmMain.CheckListBoxKrutHron.Items.Add(Path.Hron.step8.Name);
 End;
 if (UsersLogin.Dostup.Krutilka=True) and (UsersLogin.Dostup.VerbaKa=True) then
 Begin
  Path.Verba.step1.Name:='311 Подготовка на подпись';
  Path.Verba.step2.Name:='311 Отправка на подпись';
  Path.Verba.step3.Name:='311 Отправить подписанные';
  Path.Verba.step4.Name:='311 Подготовка на крипто';
  dmData.qrKrutLoadPath.Active:=False;
  dmData.qrKrutLoadPath.ParamByName('ID_REPORT').Value :=3;
  dmData.qrKrutLoadPath.Active:=True;
  dmData.qrKrutLoadPath.First;
  while NOT dmData.qrKrutLoadPath.Eof do
  begin
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step1.Name then Path.Verba.step1.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step1.Name then Path.Verba.step1.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step2.Name then Path.Verba.step2.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step2.Name then Path.Verba.step2.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step3.Name then Path.Verba.step3.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step3.Name then Path.Verba.step3.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   dmData.qrKrutLoadPath.Next;
  end;
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step1.Name);
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step2.Name);
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step3.Name);
 End;
 if (UsersLogin.Dostup.Krutilka=True) and (UsersLogin.Dostup.VerbaSign=True) then
 Begin
  Path.Verba.step4.Name:='311 Подготовка на крипто';
  Path.Verba.step5.Name:='311 Отправка на крипто';
  Path.Verba.step6.Name:='311 Отправить криптованные';
  {}
  dmData.qrKrutLoadPath.Active:=False;
  dmData.qrKrutLoadPath.ParamByName('ID_REPORT').Value :=4;
  dmData.qrKrutLoadPath.Active:=True;
  dmData.qrKrutLoadPath.First;
  while NOT dmData.qrKrutLoadPath.Eof do
  begin
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step4.Name then Path.Verba.step4.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step4.Name then Path.Verba.step4.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step5.Name then Path.Verba.step5.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step5.Name then Path.Verba.step5.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step6.Name then Path.Verba.step6.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step6.Name then Path.Verba.step6.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   dmData.qrKrutLoadPath.Next;
  end;
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step4.Name);
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step5.Name);
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step6.Name);
 End;
 if (UsersLogin.Dostup.Krutilka=True) and (UsersLogin.Dostup.VerbaMail=True) then
 Begin
  Path.Verba.step7.Name:='311 Почта подготовка подпись';
  Path.Verba.step8.Name:='311 Почта подпись';
  Path.Verba.step9.Name:='Почта с подписи';
  dmData.qrKrutLoadPath.Active:=False;
  dmData.qrKrutLoadPath.ParamByName('ID_REPORT').Value :=5;
  dmData.qrKrutLoadPath.Active:=True;
  dmData.qrKrutLoadPath.First;
  while NOT dmData.qrKrutLoadPath.Eof do
  begin
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step7.Name then Path.Verba.step7.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step7.Name then Path.Verba.step7.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step8.Name then Path.Verba.step8.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step8.Name then Path.Verba.step8.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step9.Name then Path.Verba.step9.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Verba.step9.Name then Path.Verba.step9.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   dmData.qrKrutLoadPath.Next;
  end;
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step7.Name);
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step8.Name);
  fmMain.CheckListBoxKrutVerba.Items.Add(Path.Verba.step9.Name);
 End;
 if (UsersLogin.Dostup.Krutilka=True) and (UsersLogin.Dostup.Arhiv=True) then
 Begin
  Path.Arhivator.step1.Name:='311 Подготовка на Архив А';
  Path.Arhivator.step2.Name:='311 Подготовка на Архив Б';
  Path.Arhivator.step3.Name:='311 Отправка на архив А';
  Path.Arhivator.step4.Name:='311 Отправка на архив Б';
  Path.Arhivator.step5.Name:='311 Отправить арзив А';
  Path.Arhivator.step6.Name:='311 Отправить арзив Б';
  Path.Arhivator.step7.Name:='Почта подготовка пакета';
  Path.Arhivator.step8.Name:='Почта формирование пакета';
  Path.Arhivator.step9.Name:='Почта отправка пакета';
  {}
  dmData.qrKrutLoadPath.Active:=False;
  dmData.qrKrutLoadPath.ParamByName('ID_REPORT').Value :=6;
  dmData.qrKrutLoadPath.Active:=True;
  dmData.qrKrutLoadPath.First;
  while NOT dmData.qrKrutLoadPath.Eof do
  begin
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step1.Name then Path.Arhivator.step1.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step1.Name then Path.Arhivator.step1.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step2.Name then Path.Arhivator.step2.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step2.Name then Path.Arhivator.step2.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step3.Name then Path.Arhivator.step3.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step3.Name then Path.Arhivator.step3.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step4.Name then Path.Arhivator.step4.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step4.Name then Path.Arhivator.step4.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step5.Name then Path.Arhivator.step5.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step5.Name then Path.Arhivator.step5.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step6.Name then Path.Arhivator.step6.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step6.Name then Path.Arhivator.step6.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step7.Name then Path.Arhivator.step7.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step7.Name then Path.Arhivator.step7.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step8.Name then Path.Arhivator.step8.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step8.Name then Path.Arhivator.step8.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step9.Name then Path.Arhivator.step9.PIn:=dmData.qrKrutLoadPath.FieldByName('PATH_FROM').AsString;
   If dmData.qrKrutLoadPath.FieldByName('TASK_NAME').AsString=Path.Arhivator.step9.Name then Path.Arhivator.step9.POut:=dmData.qrKrutLoadPath.FieldByName('PATH_TO').AsString;

   dmData.qrKrutLoadPath.Next;
  end;
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step1.Name);
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step2.Name);
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step3.Name);
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step4.Name);
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step5.Name);
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step6.Name);
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step7.Name);
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step8.Name);
  fmMain.CheckListBoxKrutArhiv.Items.Add(Path.Arhivator.step9.Name);
 End;
 dmData.qrKrutLoadPath.Active:=False;
End;

Procedure ObjectKrutilka.PuskArhiv;
Var
 I:Integer;
 SerchFile:TSearchRec;
 FindRes:Integer;
Begin
 if fmMain.CheckListBoxKrutArhiv.Items.Count>0 then
 Begin
  for I := 0 to fmMain.CheckListBoxKrutArhiv.Items.Count - 1 do
  Begin
   fmMain.CheckListBoxKrutArhiv.Checked[I]:=False;
  End;
  for I := 0 to fmMain.CheckListBoxKrutArhiv.Items.Count - 1 do
  Begin
   {}
   fmMain.ProgressBarKrutArhiv.Step:=1;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step1.Name then {Step 1}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step1.PIn);
    dmData.qrKrutVerba311ArhUpd.ParamByName('ID_USER_RA').Value:=UsersLogin.ID;
    dmData.qrKrutVerba311ArhUpd.ParamByName('SCHEME').Value:='1';
    dmData.qrKrutVerba311ArhUpd.ExecSQL;
    FindRes:=Findfirst(Path.Arhivator.step1.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      dmData.qrKrutVerba311ArhLoad.Active:=False;
      dmData.qrKrutVerba311ArhLoad.ParamByName('ID_USER_RA').Value:=UsersLogin.ID;
      dmData.qrKrutVerba311ArhLoad.ParamByName('SCHEME').Value:='1';
      dmData.qrKrutVerba311ArhLoad.Active:=True;
      dmData.qrKrutVerba311ArhLoad.First;
      while NOT dmData.qrKrutVerba311ArhLoad.Eof do
      begin
       If GetName311P(SerchFile.Name)= dmData.qrKrutVerba311ArhLoad.FieldByName('FILENAME').AsString then
       Begin
        If MoveFile(PChar(Path.Arhivator.step1.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step1.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutArhiv.StepIt;
        End;
       End;
       dmData.qrKrutVerba311ArhLoad.Next;
      end;
      dmData.qrKrutVerba311ArhLoad.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step2.Name then {Step 2}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step2.PIn);
    dmData.qrKrutVerba311ArhUpd.ParamByName('ID_USER_RA').Value:=UsersLogin.ID;
    dmData.qrKrutVerba311ArhUpd.ParamByName('SCHEME').Value:='2';
    dmData.qrKrutVerba311ArhUpd.ExecSQL;
    FindRes:=Findfirst(Path.Arhivator.step2.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      dmData.qrKrutVerba311ArhLoad.Active:=False;
      dmData.qrKrutVerba311ArhLoad.ParamByName('ID_USER_RA').Value:=UsersLogin.ID;
      dmData.qrKrutVerba311ArhLoad.ParamByName('SCHEME').Value:='2';
      dmData.qrKrutVerba311ArhLoad.Active:=True;
      dmData.qrKrutVerba311ArhLoad.First;
      while NOT dmData.qrKrutVerba311ArhLoad.Eof do
      begin
       If GetName311P(SerchFile.Name)= dmData.qrKrutVerba311ArhLoad.FieldByName('FILENAME').AsString then
       Begin
        If MoveFile(PChar(Path.Arhivator.step2.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step2.POut+'\'+SerchFile.Name)) then
        Begin
         fmMain.ProgressBarKrutArhiv.StepIt;
        End;
       End;
       dmData.qrKrutVerba311ArhLoad.Next;
      end;
      dmData.qrKrutVerba311ArhLoad.Active:=False;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step3.Name then {Step 3}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step3.PIn);
    FindRes:=Findfirst(Path.Arhivator.step3.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Arhivator.step3.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step3.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutArhiv.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step4.Name then {Step 4}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step4.PIn);
    FindRes:=Findfirst(Path.Arhivator.step4.PIn+'\SBC*.xml',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Arhivator.step4.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step4.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutArhiv.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step5.Name then {Step 5}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step5.PIn);
    FindRes:=Findfirst(Path.Arhivator.step5.PIn+'\A*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Arhivator.step5.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step5.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutArhiv.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step6.Name then {Step 6}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step6.PIn);
    FindRes:=Findfirst(Path.Arhivator.step6.PIn+'\B*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Arhivator.step6.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step6.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutArhiv.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step7.Name then {Step 7}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step7.PIn);
    FindRes:=Findfirst(Path.Arhivator.step7.PIn+'\*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Arhivator.step7.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step7.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutArhiv.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step8.Name then {Step 8}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step8.PIn);
    FindRes:=Findfirst(Path.Arhivator.step8.PIn+'\*.ARJ',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Arhivator.step8.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step8.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutArhiv.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
   if fmMain.CheckListBoxKrutArhiv.Items[I]=Path.Arhivator.step9.Name then {Step 9}
   Begin
    {узнать количество фаилов в папке}
    fmMain.ProgressBarKrutArhiv.Max:=ColFilesFromDir(Path.Arhivator.step9.PIn);
    FindRes:=Findfirst(Path.Arhivator.step9.PIn+'\*.010',faAnyFile,SerchFile);
    While FindRes=0 do
    Begin
     If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
     Begin
      If MoveFile(PChar(Path.Arhivator.step9.PIn+'\'+SerchFile.Name),PChar(Path.Arhivator.step9.POut+'\'+SerchFile.Name)) then
      Begin
       fmMain.ProgressBarKrutArhiv.StepIt;
      End;
     End;
     FindRes:=FindNext(SerchFile);
    End;
    FindClose(SerchFile);
    fmMain.CheckListBoxKrutArhiv.Checked[I]:=True;
    fmMain.ProgressBarKrutArhiv.Position:=0;
   End;
  End;
 End;
End;

end.
