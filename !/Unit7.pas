unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBTables, Grids, DBGrids, ADODB, Mask,
  DBCtrls, DateUtils;

Type
 Object406P = Object {Диклорации для ТБСВК}
  TimeOutArh:Integer;
  Path : record
   OutCB:String;{Отправка фаилов в ЦБ}
   InCB:String;{Прием фаилов из ЦБ}
   Arh:String;{Каталог где хранятся фаилы архива}
   Polzovatel:String;{Каталог куда попадают пользовательские фаилы}
   InPodp:String;{Путь фаилов на подпись}
   InPodpOut:String;{Путь фаилов на подпись}
   InPodp3:String;{Путь фаилов на подпись}
   InPodpOut3:String;{Путь фаилов на подпись}
   UnCript:String;{Путь фаилов на крипто}
   UnCriptOut:String;{Путь фаилов на крипто}
   UnArh:String;{Путь для архивов}
   Temp:String;{Путь для архивов}
   UnCa3:String;{Путь для Снятия СА}
   TBSvkArh:String;{Путь для входящих архивов в тбсвк}
   TBSvkKvit:String;{Путь для исходящих на подпись квитовок тбсвк}
   TBSvkUnArh:String;{Путь для исходящих архивов и квитовок после подписи тбсвк}
   TempArhReglament:String;{каталог для хранения фаилов созданных после регламента}
  End;
  Procedure PathInit; {просмотреть папки на отправку и отправить}
  Procedure PriemCB; {принять фаилы из цб}
  Procedure OutCB; {принять фаилы из цб}
 End;


implementation

Uses
 Unit1,Unit2,Unit3, Math;

Procedure Object406P.PathInit; {просмотреть папки на отправку и отправить}
Begin
 Path.OutCB:='z:\!CBINFO\Out\';{Отправка фаилов в ЦБ}
 Path.InCB:='z:\!CBINFO\In\';{Прием фаилов из ЦБ}
 Path.Arh:='d:\Archiv\406\';{Каталог для пакетов из ЦБ}
 Path.Polzovatel:='z:\406\';{Каталог для фаилов пользователей}
 Path.InPodp:='z:\!InPodp\';{Путь фаилов на подпись}
 Path.InPodpOut:='z:\!InPodpOut\';{Путь фаилов на подпись}
 Path.InPodp3:='z:\!InPodp3\';{Путь фаилов на подпись}
 Path.InPodpOut3:='z:\!InPodp3Out\';{Путь фаилов на подпись}
 Path.UnCript:='z:\!UnCript2\';{Путь фаилов на крипто}
 Path.UnCriptOut:='z:\!UnCript2Out\';{Путь фаилов на крипто}
 Path.UnArh:='d:\Archiv\406\UnArh\';{Путь для архивов}
 Path.Temp:='d:\Archiv\406\Temp\';{Путь для архивов}
 Path.UnCa3:='z:\!UnCA3\';{Путь для Снятия СА}
 Path.TBSvkArh:='z:\RVK_10_0\RVK_10_0\iz_fts\406FZ\DT\';{Путь для входящих архивов в тбсвк}
 Path.TBSvkKvit:='z:\RVK_10_0\RVK_10_0\b_fts\406FZ\KVIT\';{Путь для входящих диклораций в тбсвк}
 Path.TBSvkUnArh:='z:\RVK_10_0\RVK_10_0\b_fts\406FZ\KESDT\'; {тут архивы сюдаже с подписи попадают квитовки}
 Path.TempArhReglament:='d:\Archiv\406\TempUnarh\';{каталог для хранения фаилов созданных после регламента}
End;

Procedure Object406P.PriemCB; {принять фаилы из цб}
Var
 ColFiles:Integer;
 SerchFile:TSearchRec;
 F:TStringList;
 Rez:Boolean;
 S:String;
 FindRes:Integer;
 I:Integer;
 myYear, myMonth, myDay : Word;
 myHour, myMin, mySec, myMilli : Word;
Begin
 {Просмотреть наличие sz и распаковать кабы}
 FindRes:=Findfirst(Block406P.Path.InCB+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If Pos('sz',SerchFile.Name)>0 then
   Begin
    Form1.ListBox6.Items.Add('Пришел пакет '+SerchFile.Name);
    Form1.ListBox3.Items.Add('Пришел пакет '+SerchFile.Name);
    LoadLog('Adm','Пришел пакет '+SerchFile.Name);
    ARJ.Comand:='expand -r '+Block406P.Path.InCB+SerchFile.Name+' '+Block406P.Path.UnArh;
    ARJ.RunArj;
    DeleteFile(Block406P.Path.InCB+SerchFile.Name);
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Распаковать архивы и перекинуть квитовки на обработку}
 FindRes:=Findfirst(Block406P.Path.UnArh+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If (Pos('UVKESDT',SerchFile.Name)>0) then
   Begin
    {UVKESDT_2490_0003_20150312_001.txt}
    f:=TStringList.Create();
    f.LoadFromFile(Block406P.Path.UnArh+SerchFile.Name);
    Rez:=False;
    For I:=0 To f.Count-1 do
    Begin
     S:=f[I];
     {принят}
     If Pos('принят',S)>0 then Rez:=True;
    End;
    f.Free;
    If Rez then
    Begin
     Form1.ListBox6.Items.Add('Принята квитанция на диклорацию');
     Form1.ListBox3.Items.Add('Принята квитанция на диклорацию');
     LoadLog('Adm','Принята квитанция на диклорацию');
     LoadLog('406','Принята квитанция на диклорацию');
    End;
    If Rez=False then
    Begin
     Form1.ListBox6.Items.Add('Не принята квитанция на диклорацию');
     Form1.ListBox3.Items.Add('Не принята квитанция на диклорацию');
     LoadLog('Adm','Не принята квитанция на диклорацию');
     LoadLog('406','Не принята квитанция на диклорацию');
    End;
    if DirectoryExists(Block406P.Path.Arh+DateToStr(Date))=false then CreateDir(Block406P.Path.Arh+DateToStr(Date));
    if DirectoryExists(Block406P.Path.Polzovatel+DateToStr(Date))=false then CreateDir(Block406P.Path.Polzovatel+DateToStr(Date));
    CopyFile(PChar(Block406P.Path.UnArh+SerchFile.Name),PChar(Block406P.Path.Arh+DateToStr(Date)+'\'+SerchFile.Name),False);
    MoveFile(PChar(Block406P.Path.UnArh+SerchFile.Name),PChar(Block406P.Path.Polzovatel+DateToStr(Date)+'\'+SerchFile.Name));
   End;
   If (Pos('arj',SerchFile.Name)>0)or(Pos('ARJ',SerchFile.Name)>0) then
   Begin
    ARJ.Comand:='ARJ32.EXE x '+Block406P.Path.UnArh+SerchFile.Name+' '+Block406P.Path.Temp;
    ARJ.RunArj;
    CopyFile(PChar(Block406P.Path.UnArh+SerchFile.Name),PChar(Block406P.Path.UnCa3+SerchFile.Name),False);
    DeleteFile(Block406P.Path.UnArh+SerchFile.Name);
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Обработка самих диклораций и чистка ненужных квитовок}
 ColFiles:=0;
 FindRes:=Findfirst(Block406P.Path.Temp+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   {RESDT_2490_0003_20150313_001.txt}
   {DT10309200_100315_0001924_1_2490_0003_150000000037.xml}
   If ((Pos('DT',SerchFile.Name)>0) and (Pos('.xml',SerchFile.Name)>0)) or ((Pos('DT',SerchFile.Name)>0) and (Pos('.XML',SerchFile.Name)>0)) then
   Begin
    ColFiles:=ColFiles+1;
    MoveFile(PChar(Block406P.Path.Temp+SerchFile.Name),PChar(Block406P.Path.UnCript+SerchFile.Name));
   End;
   If ((Pos('RESDT',SerchFile.Name)>0) and (Pos('.txt',SerchFile.Name)>0)) or ((Pos('RESDT',SerchFile.Name)>0) and (Pos('.TXT',SerchFile.Name)>0)) then
   Begin
    DeleteFile(Block406P.Path.Temp+SerchFile.Name);
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 If ColFiles>0 then
 Begin
  Form1.ListBox6.Items.Add('Поступило диклораций - '+IntToStr(ColFiles));
  Form1.ListBox3.Items.Add('Поступило диклораций - '+IntToStr(ColFiles));
  LoadLog('Adm','Поступило диклораций - '+IntToStr(ColFiles));
  LoadLog('406','Поступило диклораций - '+IntToStr(ColFiles));
  {Разкриптовать поступившие диклорации}
  Verba.Folder:=Block406P.Path.UnCript;
  Verba.FolderOut:=Block406P.Path.UnCriptOut;
  Verba.UncriptFolder(2);
  {Перекинуть диклорации на снятие КА}
  FindRes:=Findfirst(Block406P.Path.UnCriptOut+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    MoveFile(PChar(Block406P.Path.UnCriptOut+SerchFile.Name),PChar(Block406P.Path.UnCa3+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
  {Снять СА}
  Verba.Folder:=Block406P.Path.UnCa3;
  Verba.FolderOut:=Block406P.Path.UnCa3;
  Verba.UnCaFolder(3);
  {Перекинуть диклорации По папкам}
  DecodeDateTime(Now,myYear,myMonth,myDay,myHour,myMin,mySec,myMilli);
  S:=IntToStr(myYear);
  if DirectoryExists(Block406P.Path.TBSvkArh+S)=false then CreateDir(Block406P.Path.TBSvkArh+S);
  S:=S+'\';
  If myMonth<10 then S:=S+'0';
  S:=S+IntToStr(myMonth);
  if DirectoryExists(Block406P.Path.TBSvkArh+S)=false then CreateDir(Block406P.Path.TBSvkArh+S);
  S:=S+'\';
  If myDay<10 then S:=S+'0';
  S:=S+IntToStr(myDay);
  if DirectoryExists(Block406P.Path.TBSvkArh+S)=false then CreateDir(Block406P.Path.TBSvkArh+S);
  FindRes:=Findfirst(Block406P.Path.UnCa3+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    if DirectoryExists(Block406P.Path.Arh+DateToStr(Date))=false then CreateDir(Block406P.Path.Arh+DateToStr(Date));
    if DirectoryExists(Block406P.Path.Polzovatel+DateToStr(Date))=false then CreateDir(Block406P.Path.Polzovatel+DateToStr(Date));
    CopyFile(PChar(Block406P.Path.UnCa3+SerchFile.Name),PChar(Block406P.Path.Arh+DateToStr(Date)+'\'+SerchFile.Name),False);
    CopyFile(PChar(Block406P.Path.UnCa3+SerchFile.Name),PChar(Block406P.Path.Polzovatel+DateToStr(Date)+'\'+SerchFile.Name),False);
    MoveFile(PChar(Block406P.Path.UnCa3+SerchFile.Name),PChar(Block406P.Path.TBSvkArh+S+'\'+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
 End;
End;

Procedure Object406P.OutCB; {принять фаилы из цб}
Var
 ColFiles:Integer;
 SerchFile:TSearchRec;
 F:TStringList;
 Rez:Boolean;
 S:String;
 FindRes:Integer;
 I:Integer;
 myYear, myMonth, myDay : Word;
 myHour, myMin, mySec, myMilli : Word;
Begin
 {Просмотреть сделала ли Катя квитовки}
 ColFiles:=0;
 DecodeDateTime(Now,myYear,myMonth,myDay,myHour,myMin,mySec,myMilli);
 S:=IntToStr(myYear);
 if DirectoryExists(Block406P.Path.TBSvkUnArh+S)=false then CreateDir(Block406P.Path.TBSvkUnArh+S);
 S:=S+'\';
 If myMonth<10 then S:=S+'0';
 S:=S+IntToStr(myMonth);
 if DirectoryExists(Block406P.Path.TBSvkUnArh+S)=false then CreateDir(Block406P.Path.TBSvkUnArh+S);
 S:=S+'\';
 If myDay<10 then S:=S+'0';
 S:=S+IntToStr(myDay);
 if DirectoryExists(Block406P.Path.TBSvkUnArh+S)=false then CreateDir(Block406P.Path.TBSvkUnArh+S);
 FindRes:=Findfirst(Block406P.Path.TBSvkKvit+S+'\'+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') and (SerchFile.Name<>'E') then
  Begin
   ColFiles:=ColFiles+1;
   if DirectoryExists(Block406P.Path.Arh+DateToStr(Date))=false then CreateDir(Block406P.Path.Arh+DateToStr(Date));
   if DirectoryExists(Block406P.Path.Polzovatel+DateToStr(Date))=false then CreateDir(Block406P.Path.Polzovatel+DateToStr(Date));
   CopyFile(PChar(Block406P.Path.TBSvkKvit+S+'\'+SerchFile.Name),PChar(Block406P.Path.Arh+DateToStr(Date)+'\'+SerchFile.Name),False);
   CopyFile(PChar(Block406P.Path.TBSvkKvit+S+'\'+SerchFile.Name),PChar(Block406P.Path.InPodp+SerchFile.Name),False);
   MoveFile(PChar(Block406P.Path.TBSvkKvit+S+'\'+SerchFile.Name),PChar(Block406P.Path.Polzovatel+DateToStr(Date)+'\'+SerchFile.Name));
  End;
  FindRes:=FindNext(SerchFile);  
 End;
 FindClose(SerchFile);
 If ColFiles>0 then
 Begin
  Verba.Folder:=Block406P.Path.InPodp;
  Verba.FolderOut:=Block406P.Path.InPodpOut;
  Verba.SignFolder(1);
  FindRes:=Findfirst(Block406P.Path.InPodpOut+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    MoveFile(PChar(Block406P.Path.InPodpOut+SerchFile.Name),PChar(Block406P.Path.TBSvkUnArh+S+'\'+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
  Form1.ListBox6.Items.Add('Сделано квитовок на диклорации - '+IntToStr(ColFiles));
  Form1.ListBox3.Items.Add('Сделано квитовок на диклорации - '+IntToStr(ColFiles));
  LoadLog('Adm','Сделано квитовок на диклорации - '+IntToStr(ColFiles));
  LoadLog('406','Сделано квитовок на диклорации - '+IntToStr(ColFiles));
 End;
 ColFiles:=0;
 FindRes:=Findfirst(Block406P.Path.TBSvkUnArh+S+'\'+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If (Pos('.arj',SerchFile.Name)>0) or (Pos('.ARJ',SerchFile.Name)>0) then
   Begin
    Block406P.TimeOutArh:=Block406P.TimeOutArh+1;
    If Block406P.TimeOutArh=6 then
    Begin
     Block406P.TimeOutArh:=0;
     MoveFile(PChar(Block406P.Path.TBSvkUnArh+S+'\'+SerchFile.Name),PChar(Block406P.Path.InPodp3+SerchFile.Name));
     Form1.ListBox6.Items.Add('Сделан архив - '+SerchFile.Name);
     Form1.ListBox3.Items.Add('Сделан архив - '+SerchFile.Name);
     LoadLog('Adm','Сделан архив - '+SerchFile.Name);
     LoadLog('406','Сделан архив - '+SerchFile.Name);
     ColFiles:=ColFiles+1
    End;
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 If ColFiles>0 then
 Begin
  Verba.Folder:=Block406P.Path.InPodp3;
  Verba.FolderOut:=Block406P.Path.InPodpOut3;
  Verba.SignFolder(3);
  FindRes:=Findfirst(Block406P.Path.InPodpOut3+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    MoveFile(PChar(Block406P.Path.InPodpOut3+SerchFile.Name),PChar(Block406P.Path.TempArhReglament+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
 End;
 If Reglament then 
 Begin
  FindRes:=Findfirst(Block406P.Path.TempArhReglament+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    ARJ.Comand:='makecab '+Block406P.Path.TempArhReglament+SerchFile.Name+' '+Path.OutCB+'sz'+DayOfSymvol+LoadPost('sz')+'110.010';
    ARJ.RunArj;
    Form1.ListBox6.Items.Add('Сделан пакет '+'sz'+DayOfSymvol+LoadPost('sz')+'110.010');
    Form1.ListBox3.Items.Add('Сделан пакет '+'sz'+DayOfSymvol+LoadPost('sz')+'110.010');
    LoadLog('Adm','Сделан пакет '+'sz'+DayOfSymvol+LoadPost('sz')+'110.010');
    UpdatePost('sz',StrToInt(LoadPost('sz')));
    DeleteFile(Block406P.Path.TempArhReglament+SerchFile.Name);
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
 End;
End;

end.
