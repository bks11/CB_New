unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBTables, Grids, DBGrids, ADODB, Mask,
  DBCtrls, DateUtils;

Type
 Object364402P = Object
  Path : record
   OutCB:String;{Отправка фаилов в ЦБ}
   InCB:String;{Прием фаилов из ЦБ}
   Arh:String;{Каталог где хранятся фаилы архива}
   Polzovatel:String;{Каталог куда попадают пользовательские фаилы}
   InArh:String; {Каталог для фаилов которые будут архивироваться}
   InPodp:String;{Путь фаилов на подпись}
   InPodpOut:String;{Путь фаилов на подпись}
   InPodp3:String;{Путь фаилов на подпись}
   InPodpOut3:String;{Путь фаилов на подпись}
   InCript:String;{Путь фаилов на крипто}
   InCriptOut:String;{Путь фаилов на крипто}
   In364:String;{Путь фаилов на таможню}
   In402:String;{Путь фаилов на налоговую}
   UnArh:String;{Путь для архивов}
   Temp:String;{Путь для архивов}
   TempArhReglament:String;{Каталог для архивав вне регламента}
  End;
  Procedure PathInit; {просмотреть папки на отправку и отправить}
  Procedure PriemCB; {принять фаилы из цб}
  Procedure OutCB; {принять фаилы из цб}
 End;

implementation

Uses
 Unit1,Unit2,Unit3, Math;

Procedure Object364402P.PathInit; {просмотреть папки на отправку и отправить}
Begin
 Path.OutCB:='z:\!CBINFO\Out\';{Отправка фаилов в ЦБ}
 Path.InCB:='z:\!CBINFO\In\';{Прием фаилов из ЦБ}
 Path.Arh:='d:\Archiv\364-402\';{Каталог для пакетов из ЦБ}
 Path.Polzovatel:='z:\364-402\';{Каталог для фаилов пользователей}
 Path.InArh:='d:\Archiv\365\InArh\';{Каталог для фаилов на архивацию}
 Path.InPodp:='z:\!InPodp\';{Путь фаилов на подпись}
 Path.InPodpOut:='z:\!InPodpOut\';{Путь фаилов на подпись}
 Path.InPodp3:='z:\!InPodp3\';{Путь фаилов на подпись}
 Path.InPodpOut3:='z:\!InPodp3Out\';{Путь фаилов на подпись}
 Path.InCript:='z:\!InCript\';{Путь фаилов на крипто}
 Path.InCriptOut:='z:\!InCriptOut\';{Путь фаилов на крипто}
 Path.In364:='z:\364-402\Новые 364\';{Путь фаилов на таможню}
 Path.In402:='z:\364-402\Новые 402\';{Путь фаилов на налоговую}
 Path.UnArh:='d:\Archiv\364-402\UnArh\';{Путь для архивов}
 Path.Temp:='d:\Archiv\364-402\Temp\';{Путь для архивов}
 Path.TempArhReglament:='d:\Archiv\364-402\CvitCB\';{Каталог для архивов вне регламента}
End;

Procedure Object364402P.OutCB; {принять фаилы из цб}
Var
 ColFiles:Integer;
 SerchFile:TSearchRec;
 S:String;
 myYear, myMonth, myDay : Word;
 myHour, myMin, mySec, myMilli : Word;
 FindRes:Integer;
Begin
 ColFiles:=0;
 FindRes:=Findfirst(Block364402P.Path.In364+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   if DirectoryExists(Block364402P.Path.Arh+DateToStr(Date))=false then CreateDir(Block364402P.Path.Arh+DateToStr(Date));
   if DirectoryExists(Block364402P.Path.Polzovatel+DateToStr(Date))=false then CreateDir(Block364402P.Path.Polzovatel+DateToStr(Date));
   CopyFile(PChar(Block364402P.Path.In364+SerchFile.Name),PChar(Block364402P.Path.Arh+DateToStr(Date)+'\'+SerchFile.Name),False);
   CopyFile(PChar(Block364402P.Path.In364+SerchFile.Name),PChar(Block364402P.Path.Polzovatel+DateToStr(Date)+'\'+SerchFile.Name),False);
   MoveFile(PChar(Block364402P.Path.In364+SerchFile.Name),PChar(Block364402P.Path.InPodp+SerchFile.Name));
   ColFiles:=ColFiles+1;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 If ColFiles>0 then
 Begin
  Form1.ListBox5.Items.Add('Поступило паспортов в таможню - '+IntToStr(ColFiles));
  Form1.ListBox3.Items.Add('Поступило паспортов в таможню - '+IntToStr(ColFiles));
  LoadLog('Adm','Поступило паспортов в таможню - '+IntToStr(ColFiles));
  LoadLog('364','Поступило паспортов в таможню - '+IntToStr(ColFiles));
  Verba.Folder:=Block364402P.Path.InPodp;
  Verba.FolderOut:=Block364402P.Path.InPodpOut;
  Verba.SignFolder(1);
  {перекинуть на крипто}
  FindRes:=Findfirst(Block364402P.Path.InPodpOut+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    MoveFile(PChar(Block364402P.Path.InPodpOut+SerchFile.Name),PChar(Block364402P.Path.InCript+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
  Verba.Folder:=Block364402P.Path.InCript;
  Verba.FolderOut:=Block364402P.Path.InCriptOut;
  Verba.CriptFolder(2);
  {Перекинуть с крипто на архивацию}
  FindRes:=Findfirst(Block364402P.Path.InCriptOut+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    MoveFile(PChar(Block364402P.Path.InCriptOut+SerchFile.Name),PChar(Block364402P.Path.InArh+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
  {Сделать архивы}
  DecodeDateTime(Now,myYear,myMonth,myDay,myHour,myMin,mySec,myMilli);
  S:=IntToStr(myYear);
  If myMonth<10 then S:=S+'0';
  S:=S+IntToStr(myMonth);
  If myDay<10 then S:=S+'0';
  S:=S+IntToStr(myDay)+'_';
  S:=S+'0'+LoadPost('tz');
  ARJ.Comand:='ARJ32.EXE m -e '+Block364402P.Path.InArh+'PSEI_2490_0003_'+S+'.ARJ '+Block364402P.Path.InArh+'*.*';
  ARJ.RunArj;
  MoveFile(PChar(Block364402P.Path.InArh+'PSEI_2490_0003_'+S+'.ARJ'),PChar(Block364402P.Path.InPodp3+'PSEI_2490_0003_'+S+'.ARJ'));
  Verba.Folder:=Block364402P.Path.InPodp3;
  Verba.FolderOut:=Block364402P.Path.InPodpOut3;
  Verba.SignFolder(3);
  Form1.ListBox5.Items.Add('Сделан архив '+'PSEI_2490_0003_'+S+'.ARJ');
  Form1.ListBox3.Items.Add('Сделан архив '+'PSEI_2490_0003_'+S+'.ARJ');
  LoadLog('Adm','Сделан архив '+'PSEI_2490_0003_'+S+'.ARJ');
  MoveFile(PChar(Block364402P.Path.InPodpOut3+'PSEI_2490_0003_'+S+'.ARJ'),PChar(Block364402P.Path.TempArhReglament+'PSEI_2490_0003_'+S+'.ARJ'));
 End;
 {обработать паспорта в налоговую}
 ColFiles:=0;
 FindRes:=Findfirst(Block364402P.Path.In402+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   if DirectoryExists(Block364402P.Path.Arh+DateToStr(Date))=false then CreateDir(Block364402P.Path.Arh+DateToStr(Date));
   if DirectoryExists(Block364402P.Path.Polzovatel+DateToStr(Date))=false then CreateDir(Block364402P.Path.Polzovatel+DateToStr(Date));
   CopyFile(PChar(Block364402P.Path.In402+SerchFile.Name),PChar(Block364402P.Path.Arh+DateToStr(Date)+'\'+SerchFile.Name),False);
   CopyFile(PChar(Block364402P.Path.In402+SerchFile.Name),PChar(Block364402P.Path.Polzovatel+DateToStr(Date)+'\'+SerchFile.Name),False);
   MoveFile(PChar(Block364402P.Path.In402+SerchFile.Name),PChar(Block364402P.Path.InPodp+SerchFile.Name));
   ColFiles:=ColFiles+1;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 If ColFiles>0 then
 Begin
  Form1.ListBox5.Items.Add('Поступило паспортов в налоговую - '+IntToStr(ColFiles));
  Form1.ListBox3.Items.Add('Поступило паспортов в налоговую - '+IntToStr(ColFiles));
  LoadLog('Adm','Поступило паспортов в налоговую - '+IntToStr(ColFiles));
  LoadLog('364','Поступило паспортов в налоговую - '+IntToStr(ColFiles));
  Verba.Folder:=Block364402P.Path.InPodp;
  Verba.FolderOut:=Block364402P.Path.InPodpOut;
  Verba.SignFolder(1);
  {перекинуть на крипто}
  FindRes:=Findfirst(Block364402P.Path.InPodpOut+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    MoveFile(PChar(Block364402P.Path.InPodpOut+SerchFile.Name),PChar(Block364402P.Path.InCript+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
  Verba.Folder:=Block364402P.Path.InCript;
  Verba.FolderOut:=Block364402P.Path.InCriptOut;
  Verba.CriptFolder(2);
  {Перекинуть с крипто на архивацию}
  FindRes:=Findfirst(Block364402P.Path.InCriptOut+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    MoveFile(PChar(Block364402P.Path.InCriptOut+SerchFile.Name),PChar(Block364402P.Path.InArh+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
  {Сделать архивы}
  DecodeDateTime(Now,myYear,myMonth,myDay,myHour,myMin,mySec,myMilli);
  S:=IntToStr(myYear);
  If myMonth<10 then S:=S+'0';
  S:=S+IntToStr(myMonth);
  If myDay<10 then S:=S+'0';
  S:=S+IntToStr(myDay)+'_';
  S:=S+'0'+LoadPost('tz');
  ARJ.Comand:='ARJ32.EXE m -e '+Block364402P.Path.InArh+'PSKR_2490_0003_'+S+'.ARJ '+Block364402P.Path.InArh+'*.*';
  ARJ.RunArj;
  MoveFile(PChar(Block364402P.Path.InArh+'PSKR_2490_0003_'+S+'.ARJ'),PChar(Block364402P.Path.InPodp3+'PSKR_2490_0003_'+S+'.ARJ'));
  Verba.Folder:=Block364402P.Path.InPodp3;
  Verba.FolderOut:=Block364402P.Path.InPodpOut3;
  Verba.SignFolder(3);
  Form1.ListBox5.Items.Add('Сделан архив '+'PSKR_2490_0003_'+S+'.ARJ');
  Form1.ListBox3.Items.Add('Сделан архив '+'PSKR_2490_0003_'+S+'.ARJ');
  LoadLog('Adm','Сделан архив '+'PSKR_2490_0003_'+S+'.ARJ');
  MoveFile(PChar(Block364402P.Path.InPodpOut3+'PSKR_2490_0003_'+S+'.ARJ'),PChar(Block364402P.Path.TempArhReglament+'PSKR_2490_0003_'+S+'.ARJ'));
 End;
 If Reglament then
 Begin
  FindRes:=Findfirst(Block364402P.Path.TempArhReglament+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    ARJ.Comand:='makecab '+Block364402P.Path.TempArhReglament+SerchFile.Name+' '+Path.OutCB+'tz'+DayOfSymvol+LoadPost('tz')+'110.010';
    ARJ.RunArj;
    Form1.ListBox5.Items.Add('Сделан пакет '+'tz'+DayOfSymvol+LoadPost('tz')+'110.010');
    Form1.ListBox3.Items.Add('Сделан пакет '+'tz'+DayOfSymvol+LoadPost('tz')+'110.010');
    LoadLog('Adm','Сделан пакет '+'tz'+DayOfSymvol+LoadPost('tz')+'110.010');
    UpdatePost('tz',StrToInt(LoadPost('tz')));
    DeleteFile(Block364402P.Path.TempArhReglament+SerchFile.Name);
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
 End;
End;

Procedure Object364402P.PriemCB; {принять фаилы из цб}
Var
 ColFiles:Integer;
 SerchFile:TSearchRec;
 F:TStringList;
 Rez:Boolean;
 S:String;
 FindRes:Integer;
 I:Integer;
Begin
 {Просмотреть наличие mz и распаковать кабы}
 FindRes:=Findfirst(Block364402P.Path.InCB+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If Pos('tz',SerchFile.Name)>0 then
   Begin
    Form1.ListBox5.Items.Add('Пришел пакет '+SerchFile.Name);
    Form1.ListBox3.Items.Add('Пришел пакет '+SerchFile.Name);
    LoadLog('Adm','Пришел пакет '+SerchFile.Name);
    f:=TStringList.Create();
    f.LoadFromFile(Block364402P.Path.InCB+SerchFile.Name);
    S:=f[0];
    f.Free;
    {MSCF}
    If Pos('MSCF',S)>0 then
    Begin
     ARJ.Comand:='expand -r '+Block364402P.Path.InCB+SerchFile.Name+' '+Block364402P.Path.UnArh;
     ARJ.RunArj;
     DeleteFile(Block364402P.Path.InCB+SerchFile.Name);
    End
    Else
    Begin
     f:=TStringList.Create();
     f.LoadFromFile(Block364402P.Path.InCB+SerchFile.Name);
     Rez:=False;
     For I:=0 To f.Count-1 do
     Begin
      S:=f[I];
      {принят}
      If Pos('принят',S)>0 then Rez:=True;
     End;
     f.Free;
     Form1.ListBox5.Items.Add('Принята квитанция '+SerchFile.Name);
     Form1.ListBox3.Items.Add('Принята квитанция '+SerchFile.Name);
     LoadLog('Adm','Принята квитанция '+SerchFile.Name);
     LoadLog('364','Принята квитанция '+SerchFile.Name);
     if DirectoryExists(Block364402P.Path.Arh+DateToStr(Date))=false then CreateDir(Block364402P.Path.Arh+DateToStr(Date));
     if DirectoryExists(Block364402P.Path.Polzovatel+DateToStr(Date))=false then CreateDir(Block364402P.Path.Polzovatel+DateToStr(Date));
     CopyFile(PChar(Block364402P.Path.InCB+SerchFile.Name),PChar(Block364402P.Path.Arh+DateToStr(Date)+'\'+SerchFile.Name),False);
     MoveFile(PChar(Block364402P.Path.InCB+SerchFile.Name),PChar(Block364402P.Path.Polzovatel+DateToStr(Date)+'\'+SerchFile.Name));
    End;
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 FindRes:=Findfirst(Block364402P.Path.UnArh+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If (Pos('.arj',SerchFile.Name)>0)or(Pos('.ARJ',SerchFile.Name)>0) then
   Begin
    ARJ.Comand:='ARJ32.EXE x '+Block364402P.Path.UnArh+SerchFile.Name+' '+Block364402P.Path.Temp;
    ARJ.RunArj;
    DeleteFile(Block364402P.Path.UnArh+SerchFile.Name);
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 ColFiles:=0;
 FindClose(SerchFile);
 FindRes:=Findfirst(Block364402P.Path.Temp+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   if DirectoryExists(Block364402P.Path.Arh+DateToStr(Date))=false then CreateDir(Block364402P.Path.Arh+DateToStr(Date));
   if DirectoryExists(Block364402P.Path.Polzovatel+DateToStr(Date))=false then CreateDir(Block364402P.Path.Polzovatel+DateToStr(Date));
   CopyFile(PChar(Block364402P.Path.Temp+SerchFile.Name),PChar(Block364402P.Path.Arh+DateToStr(Date)+'\'+SerchFile.Name),False);
   MoveFile(PChar(Block364402P.Path.Temp+SerchFile.Name),PChar(Block364402P.Path.Polzovatel+DateToStr(Date)+'\'+SerchFile.Name));
   ColFiles:=ColFiles+1;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 if ColFiles>0 then
 Begin
  Form1.ListBox5.Items.Add('Принято паспартов - '+IntToStr(ColFiles));
  Form1.ListBox3.Items.Add('Принято паспартов - '+IntToStr(ColFiles));
  LoadLog('Adm','Принято паспартов - '+IntToStr(ColFiles));
  LoadLog('364','Принято паспартов - '+IntToStr(ColFiles));
 End;
End;

end.
