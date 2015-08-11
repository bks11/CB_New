unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBTables, Grids, DBGrids, ADODB, Mask,
  DBCtrls;

Type

 Object311P = Object
  LastShemaA:String;
  LastShemaB:String;
  Path : record
   InCB:String;{Входящий пакет ЦБ}
   OutCB:String;{Входящий пакет ЦБ}
   TempPaket:String;{Каталог для пакетов из ЦБ}
   TempUnarh:String;{Каталог для архивов из пакетов ЦБ}
   TempFile:String;{Каталог для фаилов из архивов}
   Polzovatel:String;{Каталог куда попадают пользовательские фаилы}
   Arh:String;{Каталог где хранятся фаилы архива}
   InArh1,InArh2:String; {Каталог для фаилов которые будут архивироваться}
   InPtkPsd:String; {Каталог куда попадают архивы на пакетировании}
   InPodp:String;{Путь фаилов на подпись}
   InPodpOut:String;{Путь фаилов на подпись}
   InPodp3:String;{Путь фаилов на подпись}
   InPodpOut3:String;{Путь фаилов на подпись}
   InCript:String;{Путь фаилов на крипто}
   InCriptOut:String;{Путь фаилов на крипто}
   InUnCript:String;{Путь фаилов на разкрипто}
   InUnCriptOut:String;{Путь фаилов на разкрипто}
  End;
  Procedure Out311P; {просмотреть папки на отправку и отправить}
  Procedure PathInit; {просмотреть папки на отправку и отправить}
  Procedure LastShema; {Узнать последние номера архивов}
  Function LoadPost(S:String):String;{Выгрузить номер конверта}
  Procedure UpdatePost(S:String; I:Integer);{Изменить номер конверта}
  Procedure InCvitCB; {Принять квитовки ЦБ}
 End;
 Object3251P = Object
  LastShemaA:String;
  LastShemaB:String;
  Path : record
   OutCB:String;{Входящий пакет ЦБ}
   In211:String; {Папка для новых запросов в налоговую в тбсвк}
   Arh211:String; {Папка для архива запросов в налоговую в тбсвк}
   Work211:String; {Папка рабочая для запросов в налоговую в тбсвк}
   TBSvr211:String; {Папка рабочая для запросов в налоговую в тбсвк}
   TempFile:String;{Каталог для фаилов из архивов}
   Polzovatel:String;{Каталог куда попадают пользовательские фаилы}
   Arh:String;{Каталог где хранятся фаилы архива}
   InArh1,InArh2:String; {Каталог для фаилов которые будут архивироваться}
   InPtkPsd:String; {Каталог куда попадают архивы на пакетировании}
   InPodp:String;{Путь фаилов на подпись}
   InPodpOut:String;{Путь фаилов на подпись}
   InPodp3:String;{Путь фаилов на подпись}
   InPodpOut3:String;{Путь фаилов на подпись}
   InCript:String;{Путь фаилов на крипто}
   InCriptOut:String;{Путь фаилов на крипто}
   BildFile:String;{Путь куда попадают созданные фаилы пользователем}
   UnCa3:String;
  End;
  Procedure Out3251P; {просмотреть папки на отправку и отправить}
  Procedure PathInit; {просмотреть папки на отправку и отправить}
  Procedure LastShema; {Узнать последние номера архивов}
  Function LoadPost(S:String):String;{Выгрузить номер конверта}
  Procedure UpdatePost(S:String; I:Integer);{Изменить номер конверта}
  Procedure Update211;{Изменить номер конверта}
  Procedure InCvitCB; {Принять квитовки ЦБ}
  Procedure Perebroska; {Перекинуть созданные пользователем фаилы}
 End;
 TFile311P = Object
  Path:String;
  Name:String;
  FulName:String;
  Operator:String;
  FIO:String;
  Acc:String;
  Shema:Integer;
  DateFil:TDateTime;
  public
   { Private declarations }
  Function ProvNalBase:Boolean;{Проверить есть ли данный фаил в БД}
  Function GetShema:Integer;{Проверить Какая схема}
  Procedure GetName;{Узнать Имя}
  Procedure ZapolnenieParam;{Заполнить его параметры}
  Procedure ZapolnenieBD;{Внести информацию в БД по новому фаилу}
  Procedure PerepisatVWorkDir;{Переписать фаил в рабочею дирикторию}
  Procedure PerepisatVArhDir;{Переписать фаил в архив дирикторию}
  Procedure PerepisatPodpDir;{Перенести фаил на подпись}
  Procedure PerepisatInArh1Dir;{Перенести фаил на подпись}
  Procedure PerepisatInArh2Dir;{Перенести фаил на подпись}
  Procedure LoadFromBase;{Заполнить данными из базы}
 End;
 TFile3251P = Object
  Path:String;
  Name:String;
  FulName:String;
  Operator:String;
  FIO:String;
  Acc:String;
  Shema:Integer;
  DateFil:TDateTime;
  public
   { Private declarations }
  Function ProvNalBase:Boolean;{Проверить есть ли данный фаил в БД}
  Procedure GetName;{Узнать Имя}
  Procedure ZapolnenieParam;{Заполнить его параметры}
  Procedure ZapolnenieBD;{Внести информацию в БД по новому фаилу}
  Procedure PerepisatVWorkDir;{Переписать фаил в рабочею дирикторию}
  Procedure PerepisatVArhDir;{Переписать фаил в архив дирикторию}
  Procedure PerepisatPodpDir;{Перенести фаил на подпись}
  Procedure PerepisatInArh2Dir;{Перенести фаил на подпись}
  Procedure LoadFromBase;{Заполнить данными из базы}
 End;

Function DayOfSymvol:String;

implementation

uses
 Unit3,Unit1;

Var
 CompileString:String;

Procedure Object3251P.Perebroska;
Var
 ColFiles:Integer;
 SerchFile:TSearchRec;
 SerchFileIn:TSearchRec;
 FindRes:Integer;
 FindResIn:Integer;
Begin
 ColFiles:=0;
 FindRes:=Findfirst(Block3251P.Path.BildFile+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   FindResIn:=Findfirst(Block3251P.Path.BildFile+SerchFile.Name+'\'+'*.*',faAnyFile,SerchFileIn);
   While FindResIn=0 do
   Begin
    If (SerchFileIn.Name<>'.') and (SerchFileIn.Name<>'..') then
    Begin
     If (Pos('SFC',SerchFileIn.Name)>0) and (Pos('3510110',SerchFileIn.Name)>0) then
     Begin
      ColFiles:=ColFiles+1;
      MoveFile(PChar(Block3251P.Path.BildFile+SerchFile.Name+'\'+SerchFileIn.Name),PChar(Block3251P.Path.Polzovatel+'НовыеСхема2\'+SerchFileIn.Name));
     End;
    End;
    FindResIn:=FindNext(SerchFileIn);
   End;
   FindClose(SerchFileIn);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 If ColFiles>0 then
 Begin
  Form1.ListBox1.Items.Add('Перекинуто на обработку - '+IntToStr(ColFiles));
  Form1.ListBox3.Items.Add('Перекинуто на обработку - '+IntToStr(ColFiles));
  LoadLog('Adm','Перекинуто на обработку - '+IntToStr(ColFiles));
 End;
End;

Function TFile311P.ProvNalBase:Boolean;
Begin
 Result:=True;
 Form3.Query1.Params[0].AsString:=Name;
 Form3.Query1.Active:=True;
 If Form3.Query1.FieldByName('Col').AsInteger =0 then Result:=False;
 Form3.Query1.Active:=False;
End;
Function TFile3251P.ProvNalBase:Boolean;
Begin
 Result:=True;
 Form3.Query8.Params[0].AsString:=Name;
 Form3.Query8.Active:=True;
 If Form3.Query8.FieldByName('Col').AsInteger =0 then Result:=False;
 Form3.Query8.Active:=False;
End;
Procedure TFile311P.LoadFromBase;
Begin
 Form3.Query7.Params[0].AsString:=Name;
 Form3.Query7.Active:=True;
 Operator:=Form3.Query7.FieldByName('Operator').AsString;
 FIO:=Form3.Query7.FieldByName('FIO').AsString;
 Acc:=Form3.Query7.FieldByName('Acc').AsString;
 DateFil:=Form3.Query7.FieldByName('DateFile').AsDateTime;
 Form3.Query7.Active:=False;
End;
Procedure TFile3251P.LoadFromBase;
Begin
 Form3.Query9.Params[0].AsString:=Name;
 Form3.Query9.Active:=True;
 Operator:=Form3.Query9.FieldByName('Operator').AsString;
 FIO:=Form3.Query9.FieldByName('FIO').AsString;
 Acc:=Form3.Query9.FieldByName('Acc').AsString;
 DateFil:=Form3.Query9.FieldByName('DateFile').AsDateTime;
 Form3.Query9.Active:=False;
End;
Function TFile311P.GetShema:Integer;{Проверить Какая схема}
Begin
 Result:=0;
 Form3.Query3.Params[0].AsString:=Name;
 Form3.Query3.Active:=True;
 Result:=Form3.Query3.FieldByName('Shema').AsInteger;
 Form3.Query3.Active:=False;
End;

Procedure TFile311P.GetName;{Узнать Имя}
Var
 S:String;
Begin
 {Узнать название-имя фаила}
 S:=Path;
 {SBP013510110_910220150220_249000031500031193_200.XML}
 If Pos('.xml',S)>0 then Delete(S,Pos('.xml',S),4);
 If Pos('.XML',S)>0 then Delete(S,Pos('.XML',S),4);
 S:=Copy(S,Length(S)-44,45);
 Name:=S;
End;
Procedure TFile3251P.GetName;{Узнать Имя}
Var
 S:String;
Begin
 {Узнать название-имя фаила}
 S:=Path;
 {SBP013510110_910220150220_249000031500031193_200.XML}
 If Pos('.xml',S)>0 then Delete(S,Pos('.xml',S),4);
 If Pos('.XML',S)>0 then Delete(S,Pos('.XML',S),4);
 S:=Copy(S,Length(S)-44,45);
 Name:=S;
End;

Procedure TFile311P.ZapolnenieParam;
Var
 F:TStringList;
 I:Integer;
 J:Integer;
 S:String;
Begin
  {ФамОтпр="Диденко"}
  {НаимОрг="ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ &quot;БЫТРАДИОТЕХНИКА&quot;"}
  {НомСч="40702810501330000020"}
  {Фамилия="Мухамедов"
   Имя="Махмуд"
   Отчество="Исаевич"}
  FIO:='';
  f:=TStringList.Create();
  f.LoadFromFile(Path);
  GetName;
  {Узнать схему фаила}
  If Pos('НовыеСхема1',Path) >0 then Shema:=1;
  If Pos('НовыеСхема2',Path) >0 then Shema:=2;
  For I:=0 To f.Count-1 do
  Begin
   S:=f[I];
   If Pos('Имя=',S) >0 then
   Begin
    Delete(S,1,5);
    Delete(S,Pos('"',S),1);
    FIO:=FIO+' '+S;
   End;
   If Pos('Отчество=',S) >0 then
   Begin
    Delete(S,1,10);
    Delete(S,Pos('"',S),1);
    FIO:=FIO+' '+S;
   End;
   If Pos('ФамОтпр=',S) >0 then
   Begin
    Delete(S,1,9);
    Delete(S,Pos('"',S),1);
    Operator:=S;
   End;
   If Pos('НаимОрг=',S) >0 then
   Begin
    Delete(S,1,9);
    Delete(S,Pos('"',S),1);
    {&quot;}
    For J:=1 to 10 do
    Begin
     If Pos('&quot;',S) >0 then Delete(S,Pos('&quot;',S),6);
     If Pos('\',S) >0 then Delete(S,Pos('\',S),1);
    End;
    If Length(S)>40 then Delete(S,40,Length(S)-40);
    FIO:=S;
   End;
   If Pos('Фамилия=',S) >0 then
   Begin
    Delete(S,1,9);
    Delete(S,Pos('"',S),1);
    FIO:=FIO+S;
   End;
   If Pos('НомСч=',S) >0 then
   Begin
    Delete(S,1,7);
    Delete(S,Pos('"',S),1);
    Acc:=S;
   End;
  End;
  f.Free;
  If Fio='' then FIO:=Name;
  If Operator='' then Operator:='Неизвестно'
End;

Procedure TFile3251P.ZapolnenieParam;
Var
 F:TStringList;
 I:Integer;
 S:String;
Begin
  {ФамОтпр="Диденко"}
  {НаимОрг="ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ &quot;БЫТРАДИОТЕХНИКА&quot;"}
  {НомСч="40702810501330000020"}
  {Фамилия="Мухамедов"
   Имя="Махмуд"
   Отчество="Исаевич"}
  FIO:='';
  f:=TStringList.Create();
  f.LoadFromFile(Path);
  GetName;
  {Узнать схему фаила}
  If Pos('НовыеСхема1',Path) >0 then Shema:=1;
  If Pos('НовыеСхема2',Path) >0 then Shema:=2;
  For I:=0 To f.Count-1 do
  Begin
   S:=f[I];
   If Pos('Имя=',S) >0 then
   Begin
    Delete(S,1,26);
    Delete(S,Pos('"',S),1);
    FIO:=FIO+' '+S;
   End;
   If Pos('Отчество=',S) >0 then
   Begin
    Delete(S,1,31);
    Delete(S,Pos('"',S),1);
    FIO:=FIO+' '+S;
   End;
   If Pos('ФамОтпр=',S) >0 then
   Begin
    Delete(S,1,15);
    Delete(S,Pos('"',S),1);
    Operator:=S;
   End;
   If Pos('НаимОрг=',S) >0 then
   Begin
    Delete(S,1,27);
    Delete(S,Pos('"',S),1);
    {&quot;}
    Delete(S,Pos('&quot;',S),6);
    Delete(S,Pos('&quot;',S),6);
    FIO:=S;
   End;
   If Pos('Фамилия=',S) >0 then
   Begin
    Delete(S,1,30);
    Delete(S,Pos('"',S),1);
    FIO:=FIO+S;
   End;
   If Pos('НомСч=',S) >0 then
   Begin
    Delete(S,1,24);
    Delete(S,Pos('"',S),1);
    Acc:=S;
   End;
  End;
  f.Free;
End;

Procedure TFile311P.ZapolnenieBD;
Var
 Compil:String;
Begin
 If ProvNalBase=False then
 Begin
  Form3.Query2.Params[0].Value:=Name;
  Form3.Query2.Params[1].Value:=FIO;
  Form3.Query2.Params[2].Value:=Now;
  Form3.Query2.Params[3].Value:=Operator;
  Form3.Query2.Params[4].Value:=Acc;
  Form3.Query2.Params[5].Value:=Shema;
  If Shema=1 then Form3.Query2.Params[6].Value:=Block311P.LastShemaA;
  If Shema=2 then Form3.Query2.Params[6].Value:=Block311P.LastShemaB;
  Form3.Query2.ExecSQL;
 End;
End;

Procedure TFile3251P.ZapolnenieBD;
Var
 Compil:String;
Begin
 If ProvNalBase=False then
 Begin
  Form3.Query10.Params[0].Value:=Name;
  Form3.Query10.Params[1].Value:=FIO;
  Form3.Query10.Params[2].Value:=Now;
  Form3.Query10.Params[3].Value:=Operator;
  Form3.Query10.Params[4].Value:=Acc;
  Form3.Query10.Params[5].Value:=Shema;
  Form3.Query10.Params[6].Value:=Block3251P.LastShemaB;
  Form3.Query10.ExecSQL;
 End;
End;

Procedure TFile311P.PerepisatVWorkDir;{Переписать фаил в рабочею дирикторию}
Var
 PathPolz:String;
Begin
 PathPolz:=Block311P.Path.Polzovatel;
 PathPolz:=PathPolz+DateToStr(Date);
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+Operator;
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+'Отправленные';
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+FIO+' '+Acc+'.txt';
 CopyFile(PChar(Path),PChar(PathPolz),False);
End;
Procedure TFile3251P.PerepisatVWorkDir;{Переписать фаил в рабочею дирикторию}
Var
 PathPolz:String;
Begin
 PathPolz:=Block3251P.Path.Polzovatel;
 PathPolz:=PathPolz+DateToStr(Date);
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+Operator;
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+'Отправленные';
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+FIO+' '+Acc+'.txt';
 CopyFile(PChar(Path),PChar(PathPolz),False);
End;

Procedure TFile311P.PerepisatVArhDir;{Переписать фаил в архивную дирикторию}
Var
 PathPolz:String;
Begin
 PathPolz:=Block311P.Path.Arh;
 PathPolz:=PathPolz+DateToStr(Date);
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+Operator;
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+'Отправленные';
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+FulName;
 CopyFile(PChar(Path),PChar(PathPolz),False);
End;
Procedure TFile3251P.PerepisatVArhDir;{Переписать фаил в архивную дирикторию}
Var
 PathPolz:String;
Begin
 PathPolz:=Block3251P.Path.Arh;
 PathPolz:=PathPolz+DateToStr(Date);
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+Operator;
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+'Отправленные';
 if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
 PathPolz:=PathPolz+'\'+FulName;
 CopyFile(PChar(Path),PChar(PathPolz),False);
End;

Procedure TFile311P.PerepisatPodpDir;{Перенести фаил на подпись}
Var
 PathPolz:String;
Begin
 PathPolz:=Block311P.Path.InPodp;
 MoveFile(PChar(Path),PChar(PathPolz+FulName));
End;
Procedure TFile3251P.PerepisatPodpDir;{Перенести фаил на подпись}
Var
 PathPolz:String;
Begin
 PathPolz:=Block3251P.Path.InPodp;
 MoveFile(PChar(Path),PChar(PathPolz+FulName));
End;

Procedure TFile311P.PerepisatInArh1Dir;{Перенести фаил на подпись}
Var
 PathPolz:String;
Begin
 PathPolz:=Block311P.Path.InArh1;
 MoveFile(PChar(Path),PChar(PathPolz+FulName));
End;

Procedure TFile311P.PerepisatInArh2Dir;{Перенести фаил на подпись}
Var
 PathPolz:String;
Begin
 PathPolz:=Block311P.Path.InArh2;
 MoveFile(PChar(Path),PChar(PathPolz+FulName));
End;

Procedure TFile3251P.PerepisatInArh2Dir;{Перенести фаил на подпись}
Var
 PathPolz:String;
Begin
 PathPolz:=Block3251P.Path.InArh2;
 MoveFile(PChar(Path),PChar(PathPolz+FulName));
End;

Procedure Object311P.PathInit; {просмотреть папки на отправку и отправить}
Begin
 Path.InCB:='z:\!CBINFO\In\';{Входящий пакет ЦБ}
 Path.OutCB:='z:\!CBINFO\Out\';{Входящий пакет ЦБ}
 Path.TempPaket:='d:\Archiv\311\InPaket\';{Каталог для пакетов из ЦБ}
 Path.TempUnarh:='d:\Archiv\311\UnArh\';{Каталог для архивов из пакетов ЦБ}
 Path.TempFile:='d:\Archiv\311\Temp\';{Каталог для фаилов из архивов}
 Path.Polzovatel:='z:\311\';{Каталог куда попадают пользовательские фаилы}
 Path.Arh:='d:\Archiv\311\';{Каталог где хранятся фаилы архива}
 Path.InArh1:='d:\Archiv\311\InArh1\';
 Path.InArh2:='d:\Archiv\311\InArh2\'; {Каталог для фаилов которые будут архивироваться}
 Path.InPtkPsd:='z:\PTK PSD\Post\Post\In_set\'; {Каталог куда попадают архивы на пакетировании}
 Path.InPodp:='z:\!InPodp\';{Путь фаилов на подпись}
 Path.InPodpOut:='z:\!InPodpOut\';{Путь фаилов на подпись}
 Path.InPodp3:='z:\!InPodp3\';{Путь фаилов на подпись}
 Path.InPodpOut3:='z:\!InPodp3Out\';{Путь фаилов на подпись}
 Path.InCript:='z:\!InCript\';{Путь фаилов на крипто}
 Path.InCriptOut:='z:\!InCriptOut\';{Путь фаилов на крипто}
 Path.InUnCript:='z:\!UnCript3\';{Путь фаилов на крипто}
 Path.InUnCriptOut:='z:\!UnCript3Out\';{Путь фаилов на крипто}
End;

Procedure Object3251P.PathInit; {просмотреть папки на отправку и отправить}
Begin
 Path.OutCB:='z:\!CBINFO\Out\';{Входящий пакет ЦБ}
 Path.TempFile:='d:\Archiv\311\Temp\';{Каталог для фаилов из архивов}
 Path.Polzovatel:='z:\3251\';{Каталог куда попадают пользовательские фаилы}
 Path.Arh:='d:\Archiv\3251\';{Каталог где хранятся фаилы архива}
 Path.InArh2:='d:\Archiv\3251\InArh2\'; {Каталог для фаилов которые будут архивироваться}
 Path.InArh1:='d:\Archiv\3251\InArh1\'; {Каталог для фаилов которые будут архивироваться}
 Path.InPtkPsd:='z:\PTK PSD\Post\Post\In_set\'; {Каталог куда попадают архивы на пакетировании}
 Path.InPodp:='z:\!InPodp\';{Путь фаилов на подпись}
 Path.InPodpOut:='z:\!InPodpOut\';{Путь фаилов на подпись}
 Path.InPodp3:='z:\!InPodp3\';{Путь фаилов на подпись}
 Path.InPodpOut3:='z:\!InPodp3Out\';{Путь фаилов на подпись}
 Path.InCript:='z:\!InCript\';{Путь фаилов на крипто}
 Path.InCriptOut:='z:\!InCriptOut\';{Путь фаилов на крипто}
 Path.In211:='z:\211\Новые\';{путь к запросам 211}
 Path.Work211:='z:\211\';{путь к запросам 211}
 Path.Arh211:='d:\Archiv\211\';{путь к запросам 211}
 Path.TBSvr211:='y:\RVK_10_0\iz_fns\Z211\';{путь к запросам 211}
 Path.UnCa3:='z:\!UnCA3\';
 Path.BildFile:='p:\3251\OUT\';{Сюда попадают созданные пользователем фаилы}
End;

procedure Object311P.LastShema;
Var
 ASt,BSt:String;
 ForI,A,B:Integer;
 Year, Month, Day: Word;
Begin
 Form3.Query4.Params[0].AsString:='A%';
 Form3.Query4.Params[1].AsString:='A%';
 Form3.Query4.Active:=True;
 A:=Form3.Query4.FieldByName('Col').AsInteger;     
 Form3.Query4.Active:=False;
 Form3.Query4.Params[0].AsString:='B%';
 Form3.Query4.Params[1].AsString:='B%';
 Form3.Query4.Active:=True;
 B:=Form3.Query4.Fields[0].AsInteger;
 Form3.Query4.Active:=False;
 DecodeDate(Date(), Year, Month, Day);
 ASt:=IntToStr(A+1);
 BSt:=IntToStr(B+1);
 For ForI:=1 To 3 do
 Begin
  If Length(ASt)<4 then ASt:='0'+ASt;
  If Length(BSt)<4 then BSt:='0'+BSt;
 End;
 LastShemaA:='AN10110'+IntToStr(Year)[3]+IntToStr(Year)[4];
 If Month<10 then LastShemaA:=LastShemaA+'0';
 LastShemaA:=LastShemaA+IntToStr(Month);
 If Day<10 then LastShemaA:=LastShemaA+'0';
 LastShemaA:=LastShemaA+IntToStr(Day)+ASt;
 LastShemaB:='BN10110'+IntToStr(Year)[3]+IntToStr(Year)[4];
 If Month<10 then LastShemaB:=LastShemaB+'0';
 LastShemaB:=LastShemaB+IntToStr(Month);
 If Day<10 then LastShemaB:=LastShemaB+'0';
 LastShemaB:=LastShemaB+IntToStr(Day)+BSt;
End;
procedure Object3251P.LastShema;
Var
 ASt,BSt:String;
 ForI,A,B:Integer;
 Year, Month, Day: Word;
Begin
 Form3.Query13.Active:=True;
 A:=Form3.Query13.FieldByName('Last').AsInteger;
 Form3.Query13.Active:=False;
 Form3.Query4.Params[0].AsString:='B%';
 Form3.Query4.Params[1].AsString:='B%';
 Form3.Query4.Active:=True;
 B:=Form3.Query4.Fields[0].AsInteger;
 Form3.Query4.Active:=False;
 DecodeDate(Date(), Year, Month, Day);
 ASt:=IntToStr(A+1);
 BSt:=IntToStr(B+1);
 For ForI:=1 To 3 do
 Begin
  If Length(BSt)<4 then BSt:='0'+BSt;
 End;
 If A<10 then ASt:='0'+ASt;
 LastShemaA:='Z10110'+IntToStr(Year)[3]+IntToStr(Year)[4];
 If Month<10 then LastShemaA:=LastShemaA+'0';
 LastShemaA:=LastShemaA+IntToStr(Month);
 If Day<10 then LastShemaA:=LastShemaA+'0';
 LastShemaA:=LastShemaA+IntToStr(Day)+ASt;
 LastShemaB:='BN10110'+IntToStr(Year)[3]+IntToStr(Year)[4];
 If Month<10 then LastShemaB:=LastShemaB+'0';
 LastShemaB:=LastShemaB+IntToStr(Month);
 If Day<10 then LastShemaB:=LastShemaB+'0';
 LastShemaB:=LastShemaB+IntToStr(Day)+BSt;
End;

Function DayOfSymvol:String;
Var
 Year,Month,Day:Word;
Begin
 DecodeDate(Date(), Year, Month, Day);
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
End;

Function Object311P.LoadPost(S:String):String;
Var
 I,J:Integer;
 Ast:String;
Begin
 Form3.Query5.Params[0].AsString:=S;
 Form3.Query5.Active:=True;
 I:=Form3.Query5.FieldByName('Kount').AsInteger;
 If I=100 then I:=1;
 Ast:=IntToStr(I);
 For J:=1 To 3 do
 Begin
  If Length(ASt)<2 then ASt:='0'+ASt;
 End;
 Result:=ASt;
 Form3.Query5.Active:=False;
End;

Function Object3251P.LoadPost(S:String):String;
Var
 I,J:Integer;
 Ast:String;
Begin
 Form3.Query5.Params[0].AsString:=S;
 Form3.Query5.Active:=True;
 I:=Form3.Query5.FieldByName('Kount').AsInteger;
 If I=100 then I:=1;
 Ast:=IntToStr(I);
 For J:=1 To 3 do
 Begin
  If Length(ASt)<2 then ASt:='0'+ASt;
 End;
 Result:=ASt;
 Form3.Query5.Active:=False;
End;

Procedure Object311P.UpdatePost(S:String; I:Integer);
Begin
 Form3.Query6.Params[0].AsInteger:=I+1;
 Form3.Query6.Params[1].AsString:=S;
 Form3.Query6.ExecSQL;
End;
Procedure Object3251P.UpdatePost(S:String; I:Integer);
Begin
 Form3.Query6.Params[0].AsInteger:=I+1;
 Form3.Query6.Params[1].AsString:=S;
 Form3.Query6.ExecSQL;
End;
Procedure Object3251P.Update211;
Var
 I:Integer;
Begin
 Form3.Query13.Active:=True;
 I:=Form3.Query13.FieldByName('Last').AsInteger;
 Form3.Query13.Active:=False;
 Form3.Query14.Params[0].AsInteger:=I+1;
 Form3.Query14.ExecSQL;
End;

procedure Object311P.Out311P;
{Просмотреть папку входящие}
Var
 SHA,SHB:Boolean;
 I:Integer;
 Error:Word;
 SerchFile:TSearchRec;
 SerchFileBBO:TSearchRec;
 FindRes:Integer;
 FindResBBO:Integer;
 ColFile:Integer;
 Pathh,SPath:String;
 Fil:TFile311P;
begin
 {Узнаем номер последнего архива на сегодня}
 LastShema;
 Pathh:=Block311P.Path.Polzovatel+'*.*';
 FindRes:=Findfirst(Pathh,faAnyFile,SerchFile);
 {Читаем все каталоги с ! знаком}
 While FindRes=0 do
 Begin
  If SerchFile.Name[1]='!' then
  Begin
   ColFile:=0;
   For I:=1 to 2 Do
   Begin
    SPath:=Block311P.Path.Polzovatel+SerchFile.Name+'\НовыеСхема'+IntToStr(I)+'\';
    Pathh:=Block311P.Path.Polzovatel+SerchFile.Name+'\НовыеСхема'+IntToStr(I)+'\*.*';
    {Заходим в каталоги с ! знаком}
    FindResBBO:=Findfirst(Pathh,faAnyFile,SerchFileBBO);
    While FindResBBO=0 do
    Begin
     If (SerchFileBBO.Name<>'.') and (SerchFileBBO.Name<>'..') then
     Begin
      If SerchFileBBO.Name[1]='S' then
      Begin
       Fil.Path:=SPath+SerchFileBBO.Name;
       Fil.FulName:=SerchFileBBO.Name;
       Fil.ZapolnenieParam; {Вытащить инфу с фаила}
       If Fil.ProvNalBase = False then {Проверить есть ли уже такой фаил}
       Begin
        ColFile:=ColFile+1;
        Fil.ZapolnenieBD; {Внести инфу в БД}
        Fil.PerepisatVWorkDir;{Сделать копию в рабочею папку}
        Fil.PerepisatVArhDir;{Сделать копию в архив}
        Fil.PerepisatPodpDir;{Сделать отправить фаил на подпись}
       End else
       Begin
        LoadLog('311','Продублировался фаил - '+SerchFileBBO.Name);
        LoadLog('Adm','Продублировался фаил - '+SerchFileBBO.Name);
       End;
      End;
     End;
     FindResBBO:=FindNext(SerchFileBBO);
    End;
    FindClose(SerchFileBBO);
   End;
   If ColFile>0 then
   Begin
    Form1.ListBox3.Items.Add('Поступило '+IntToStr(ColFile)+SerchFile.Name);
    LoadLog('311','Поступило '+IntToStr(ColFile)+SerchFile.Name);
    LoadLog('Adm','Поступило '+IntToStr(ColFile)+SerchFile.Name);
    Form1.ListBox1.Items.Add('Поступило '+IntToStr(ColFile)+SerchFile.Name);
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Подписываем Филы}
 Verba.Folder:=Block311P.Path.InPodp;
 Verba.FolderOut:=Block311P.Path.InPodpOut;
 Error:=Verba.SignFolder(1);
 {Перекидываем подписанные фаилы на крипто}
 FindRes:=Findfirst(Block311P.Path.InPodpOut+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   MoveFile(PChar(Block311P.Path.InPodpOut+SerchFile.Name),PChar(Block311P.Path.InCript+SerchFile.Name));
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Криптуем Филы}
 Verba.Folder:=Block311P.Path.InCript;
 Verba.FolderOut:=Block311P.Path.InCriptOut;
 Error:=Verba.CriptFolder(2);
 {Перекидываем подписанные фаилы на архивацию}
 Pathh:=Block311P.Path.InCriptOut+'*.*';
 FindRes:=Findfirst(Pathh,faAnyFile,SerchFile);
 SHA:=False;
 SHB:=False;
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   Fil.Path:=Block311P.Path.InCriptOut+SerchFile.Name;
   Fil.FulName:=SerchFile.Name;
   Fil.GetName;
   If Fil.GetShema=1 then
   Begin
    SHA:=True;
    Fil.PerepisatInArh1Dir;
   End;
   If Fil.GetShema=2 then
   Begin
    SHB:=True;
    Fil.PerepisatInArh2Dir;
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Делаем архив}
 If SHA=True then
 Begin
  ARJ.Comand:='ARJ32.EXE m -e '+Path.InArh1+Block311P.LastShemaA+'.ARJ '+Path.InArh1+'*.*';
  ARJ.RunArj;
  {Подписываем архив 3 дискетой}
  MoveFile(PChar(Path.InArh1+Block311P.LastShemaA+'.ARJ'),PChar(Block311P.Path.InPodp3+Block311P.LastShemaA+'.ARJ'));
  Verba.Folder:=Block311P.Path.InPodp3;
  Verba.FolderOut:=Block311P.Path.InPodpOut3;
  Error:=Verba.SignFolder(3);
  Form1.ListBox1.Items.Add('Сделан архив '+Block311P.LastShemaA);
  Form1.ListBox3.Items.Add('Сделан архив '+Block311P.LastShemaA);
  LoadLog('Adm','Сделан архив '+Block311P.LastShemaA);
  ARJ.Comand:='makecab '+Block311P.Path.InPodpOut3+Block311P.LastShemaA+'.ARJ '+Path.OutCB+'2z'+DayOfSymvol+LoadPost('2z')+'110.010';
  ARJ.RunArj;
  Form1.ListBox1.Items.Add('Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  Form1.ListBox3.Items.Add('Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  LoadLog('Adm','Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  UpdatePost('2z',StrToInt(LoadPost('2z')));
  DeleteFile(Block311P.Path.InPodpOut3+Block311P.LastShemaA+'.ARJ');
 End;
 If SHB=True then
 Begin
  ARJ.Comand:='ARJ32.EXE m -e '+Path.InArh2+Block311P.LastShemaB+'.ARJ '+Path.InArh2+'*.*';
  ARJ.RunArj;
  {Подписываем архив 3 дискетой}
  MoveFile(PChar(Path.InArh2+Block311P.LastShemaB+'.ARJ'),PChar(Block311P.Path.InPodp3+Block311P.LastShemaB+'.ARJ'));
  Verba.Folder:=Block311P.Path.InPodp3;
  Verba.FolderOut:=Block311P.Path.InPodpOut3;
  Error:=Verba.SignFolder(3);
  Form1.ListBox1.Items.Add('Сделан архив '+Block311P.LastShemaB);
  Form1.ListBox3.Items.Add('Сделан архив '+Block311P.LastShemaB);
  LoadLog('Adm','Сделан архив '+Block311P.LastShemaB);
  ARJ.Comand:='makecab '+Block311P.Path.InPodpOut3+Block311P.LastShemaB+'.ARJ '+Path.OutCB+'2z'+DayOfSymvol+LoadPost('2z')+'110.010';
  ARJ.RunArj;
  Form1.ListBox1.Items.Add('Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  Form1.ListBox3.Items.Add('Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  LoadLog('Adm','Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  UpdatePost('2z',StrToInt(LoadPost('2z')));
  DeleteFile(Block311P.Path.InPodpOut3+Block311P.LastShemaB+'.ARJ');
 End;
end;

procedure Object3251P.Out3251P;
{Просмотреть папку входящие}
Var
 SHA,SHB:Boolean;
 I:Integer;
 Error:Word;
 SerchFile:TSearchRec;
 SerchFileBBO:TSearchRec;
 FindRes:Integer;
 FindResBBO:Integer;
 ColZapr:Integer;
 ColFile:Integer;
 Pathh,SPath:String;
 Fil:TFile3251P;
begin
 {Узнаем номер последнего архива на сегодня}
 LastShema;
 Pathh:=Block3251P.Path.Polzovatel+'*.*';
 FindRes:=Findfirst(Pathh,faAnyFile,SerchFile);
 ColZapr:=0;
 {Читаем все каталоги с ! знаком}
 While FindRes=0 do
 Begin
  If SerchFile.Name='НовыеСхема2' then
  Begin
   ColFile:=0;
   For I:=1 to 1 Do
   Begin
    SPath:=Block3251P.Path.Polzovatel+SerchFile.Name+'\';
    Pathh:=Block3251P.Path.Polzovatel+SerchFile.Name+'\*.*';
    {Заходим в каталоги с ! знаком}
    FindResBBO:=Findfirst(Pathh,faAnyFile,SerchFileBBO);
    While FindResBBO=0 do
    Begin
     If (SerchFileBBO.Name<>'.') and (SerchFileBBO.Name<>'..') then
     Begin
      If Pos('_000.',SerchFileBBO.Name)>0 then
      Begin
       LoadLog('Adm','Поступил не верно созданный фаил');
      End;
      If (SerchFileBBO.Name[1]='S') and (Pos('_000.',SerchFileBBO.Name)=0) then
      Begin
       Fil.Path:=SPath+SerchFileBBO.Name;
       Fil.FulName:=SerchFileBBO.Name;
       Fil.ZapolnenieParam; {Вытащить инфу с фаила}
       If Fil.ProvNalBase = False then {Проверить есть ли уже такой фаил}
       Begin
        ColFile:=ColFile+1;
        Fil.ZapolnenieBD; {Внести инфу в БД}
        Fil.PerepisatVWorkDir;{Сделать копию в рабочею папку}
        Fil.PerepisatVArhDir;{Сделать копию в архив}
        Fil.PerepisatPodpDir;{Сделать отправить фаил на подпись}
       End;
      End Else
      Begin
       LoadLog('3251','Продублировался фаил - '+SerchFileBBO.Name);
       LoadLog('Adm','Продублировался фаил - '+SerchFileBBO.Name);
      end;
     End;
     FindResBBO:=FindNext(SerchFileBBO);
    End;
    FindClose(SerchFileBBO);
   End;
   If ColFile>0 then
   Begin
    Form1.ListBox3.Items.Add('Поступило '+IntToStr(ColFile)+SerchFile.Name);
    Form1.ListBox1.Items.Add('Поступило '+IntToStr(ColFile)+SerchFile.Name);
    LoadLog('3251','Поступило '+IntToStr(ColFile)+SerchFile.Name);
    LoadLog('Adm','Поступило '+IntToStr(ColFile)+SerchFile.Name);
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Выбрать запросы 211 из птк псд}
 FindRes:=Findfirst(Block3251P.Path.In211+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   ColZapr:=ColZapr+1;
   if DirectoryExists(Block3251P.Path.Arh211+DateToStr(Date))=false then CreateDir(Block3251P.Path.Arh211+DateToStr(Date));
   if DirectoryExists(Block3251P.Path.Work211+DateToStr(Date))=false then CreateDir(Block3251P.Path.Work211+DateToStr(Date));
   CopyFile(PChar(Block3251P.Path.In211+SerchFile.Name),PChar(Block3251P.Path.Arh211+DateToStr(Date)+'\'+SerchFile.Name),False);
   CopyFile(PChar(Block3251P.Path.In211+SerchFile.Name),PChar(Block3251P.Path.Work211+DateToStr(Date)+'\'+SerchFile.Name),False);
   MoveFile(PChar(Block3251P.Path.In211+SerchFile.Name),PChar(Block3251P.Path.InPodp+SerchFile.Name));
  End;
  FindRes:=FindNext(SerchFile);
 End;
 If ColZapr>0 then
 Begin
  Form1.ListBox1.Items.Add('Поступило запросов в налоговую из ТБСВК - '+IntToStr(ColZapr));
  Form1.ListBox3.Items.Add('Поступило запросов в налоговую из ТБСВК - '+IntToStr(ColZapr));
  LoadLog('Adm','Поступило запросов в налоговую из ТБСВК - '+IntToStr(ColZapr));
  LoadLog('211','Поступило запросов в налоговую из ТБСВК - '+IntToStr(ColZapr));
 End;
 FindClose(SerchFile);
 {Подписываем Филы}
 Verba.Folder:=Block3251P.Path.InPodp;
 Verba.FolderOut:=Block3251P.Path.InPodpOut;
 Error:=Verba.SignFolder(1);
 {Перекидываем подписанные фаилы на крипто}
 FindRes:=Findfirst(Block3251P.Path.InPodpOut+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   MoveFile(PChar(Block3251P.Path.InPodpOut+SerchFile.Name),PChar(Block3251P.Path.InCript+SerchFile.Name));
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Криптуем Филы}
 Verba.Folder:=Block3251P.Path.InCript;
 Verba.FolderOut:=Block3251P.Path.InCriptOut;
 Error:=Verba.CriptFolder(2);
 {Перекидываем подписанные фаилы на архивацию}
 Pathh:=Block3251P.Path.InCriptOut+'*.*';
 FindRes:=Findfirst(Pathh,faAnyFile,SerchFile);
 SHA:=False;
 SHB:=False;
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If Pos('SFC',SerchFile.Name)>0 then
   Begin
    Fil.Path:=Block3251P.Path.InCriptOut+SerchFile.Name;
    Fil.FulName:=SerchFile.Name;
    Fil.GetName;
    SHB:=True;
    Fil.PerepisatInArh2Dir;
   End;
   If Pos('ZAV',SerchFile.Name)>0 then
   Begin
    SHA:=True;
    MoveFile(PChar(Block3251P.Path.InCriptOut+SerchFile.Name),PChar(Block3251P.Path.InArh1+SerchFile.Name));
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Делаем архив}
 If SHB=True then
 Begin
  ARJ.Comand:='ARJ32.EXE m -e '+Path.InArh2+Block3251P.LastShemaB+'.ARJ '+Path.InArh2+'*.*';
  ARJ.RunArj;
  {Подписываем архив 3 дискетой}
  MoveFile(PChar(Path.InArh2+Block3251P.LastShemaB+'.ARJ'),PChar(Block3251P.Path.InPodp3+Block3251P.LastShemaB+'.ARJ'));
  Verba.Folder:=Block3251P.Path.InPodp3;
  Verba.FolderOut:=Block3251P.Path.InPodpOut3;
  Error:=Verba.SignFolder(3);
  Form1.ListBox1.Items.Add('Сделан архив '+Block311P.LastShemaB);
  Form1.ListBox3.Items.Add('Сделан архив '+Block311P.LastShemaB);
  LoadLog('Adm','Сделан архив '+Block311P.LastShemaB);
  ARJ.Comand:='makecab '+Block3251P.Path.InPodpOut3+Block3251P.LastShemaB+'.ARJ '+Path.OutCB+'2z'+DayOfSymvol+LoadPost('2z')+'110.010';
  ARJ.RunArj;
  Form1.ListBox1.Items.Add('Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  Form1.ListBox3.Items.Add('Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  LoadLog('Adm','Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  UpdatePost('2z',StrToInt(LoadPost('2z')));
  DeleteFile(Block3251P.Path.InPodpOut3+Block3251P.LastShemaB+'.ARJ');
 End;
 If SHA=True then
 Begin
  ARJ.Comand:='ARJ32.EXE m -e '+Path.InArh1+Block3251P.LastShemaA+'.ARJ '+Path.InArh1+'*.*';
  ARJ.RunArj;
  {Подписываем архив 3 дискетой}
  MoveFile(PChar(Path.InArh1+Block3251P.LastShemaA+'.ARJ'),PChar(Block3251P.Path.InPodp3+Block3251P.LastShemaA+'.ARJ'));
  Verba.Folder:=Block3251P.Path.InPodp3;
  Verba.FolderOut:=Block3251P.Path.InPodpOut3;
  Error:=Verba.SignFolder(3);
  Form1.ListBox1.Items.Add('Сделан архив '+Block3251P.LastShemaA);
  Form1.ListBox3.Items.Add('Сделан архив '+Block3251P.LastShemaA);
  LoadLog('Adm','Сделан архив '+Block3251P.LastShemaA);
  ARJ.Comand:='makecab '+Block3251P.Path.InPodpOut3+Block3251P.LastShemaA+'.ARJ '+Path.OutCB+'2z'+DayOfSymvol+LoadPost('2z')+'110.010';
  ARJ.RunArj;
  Form1.ListBox1.Items.Add('Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  Form1.ListBox3.Items.Add('Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  LoadLog('Adm','Сделан пакет '+'2z'+DayOfSymvol+LoadPost('2z')+'110.010');
  UpdatePost('2z',StrToInt(LoadPost('2z')));
  Update211;
  DeleteFile(Block3251P.Path.InPodpOut3+Block3251P.LastShemaA+'.ARJ');
 End;
end;

Procedure Object311P.InCvitCB; {Принять квитовки ЦБ}
Var
 ColNal:Integer;
 ColSoc:Integer;
 ColPen:Integer;
 SerchFile:TSearchRec;
 FindRes:Integer;
 F:TStringList;
 S:String;
 PathPolz:String;
 PathRab:String;
 I:Integer;
 Error:Boolean;
 Fil:TFile311P;
Begin
 {Просмотреть наличие 2Z}
 FindRes:=Findfirst(Block311P.Path.InCB+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If Pos('2z',SerchFile.Name)>0 then
   Begin
    MoveFile(PChar(Block311P.Path.InCB+SerchFile.Name),PChar(Block311P.Path.InUnCript+SerchFile.Name));
    Form1.ListBox1.Items.Add('Пришел пакет '+SerchFile.Name);
    Form1.ListBox3.Items.Add('Пришел пакет '+SerchFile.Name);
    LoadLog('Adm','Пришел пакет '+SerchFile.Name);
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 {Снять кодировку}
 Verba.Folder:=Block311P.Path.InUnCript;
 Verba.FolderOut:=Block311P.Path.InUnCriptOut;
 Verba.UncriptFolder(3);
 {Распаковать фаилы из архивов}
 FindRes:=Findfirst(Block311P.Path.InUnCriptOut+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   ARJ.Comand:='expand -r '+Block311P.Path.InUnCriptOut+SerchFile.Name+' '+Block311P.Path.TempPaket;
   ARJ.RunArj;
   DeleteFile(Block311P.Path.InUnCriptOut+SerchFile.Name);
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 FindRes:=Findfirst(Block311P.Path.TempPaket+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If (Pos('.xml',SerchFile.Name)>0)or(Pos('.XML',SerchFile.Name)>0) then
   Begin
    MoveFile(PChar(Block311P.Path.TempPaket+SerchFile.Name),PChar(Block311P.Path.TempFile+SerchFile.Name));
   End;
   If (Pos('.arj',SerchFile.Name)>0)or(Pos('.ARJ',SerchFile.Name)>0) then
   Begin
    ARJ.Comand:='ARJ32.EXE x '+Block311P.Path.TempPaket+SerchFile.Name+' '+Block311P.Path.TempFile;
    ARJ.RunArj;
    DeleteFile(Block311P.Path.TempPaket+SerchFile.Name);
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 ColNal:=0;
 ColSoc:=0;
 ColPen:=0;
 FindClose(SerchFile);
 {Разобрать фаилы по составу}
 {UVAN101101502190001.xml - Квитовка на пакет}
 {UVBN101101503120001.xml}
 {UVZ1011015031201.xml}
 {Юрики}
 {SBF013510110_910220150216_249000031500026182_200.XML - Квитовка налоговой}
 {SBP013510110_910220150216_249000031500026356_200.XML - Квитовка пенсионного}
 {SBR013510110_910220150216_249000031500026347_200.xml - Квитовка соцстраха}
 {Физики}
 {SFF013510110_910220150212_249000031500024617_700.XML - Квитовка налоговой}
 FindRes:=Findfirst(Block311P.Path.TempFile+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If (Pos('SBF',SerchFile.Name)>0)or(Pos('SBE',SerchFile.Name)>0) then
   Begin
    Fil.Path:=SerchFile.Name;
    Fil.GetName;
    Fil.LoadFromBase;
    PathPolz:=Block311P.Path.Polzovatel;
    PathRab:=Block311P.Path.Arh;
    PathPolz:=PathPolz+DateToStr(Fil.DateFil);
    PathRab:=PathRab+DateToStr(Fil.DateFil);
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+Fil.Operator;
    PathRab:=PathRab+'\'+Fil.Operator;
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+'Налоговая';
    If Pos('SBE',SerchFile.Name)>0 then PathPolz:=PathPolz+'\'+'Ошибки';
    PathRab:=PathRab+'\'+'Налоговая\';
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+Fil.FIO+' '+Fil.Acc+'.txt';
    CopyFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathRab+SerchFile.Name),False);
    MoveFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathPolz));
    if FileExists(PathPolz) and FileExists(Block311P.Path.TempFile+SerchFile.Name) then DeleteFile(Block311P.Path.TempFile+SerchFile.Name);
    ColNal:=ColNal+1;
   End;
   If (Pos('SBR',SerchFile.Name)>0) then
   Begin
    Fil.Path:=SerchFile.Name;
    Fil.GetName;
    Fil.LoadFromBase;
    PathPolz:=Block311P.Path.Polzovatel;
    PathRab:=Block311P.Path.Arh;
    PathPolz:=PathPolz+DateToStr(Fil.DateFil);
    PathRab:=PathRab+DateToStr(Fil.DateFil);
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+Fil.Operator;
    PathRab:=PathRab+'\'+Fil.Operator;
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+'Соцстрах';
    PathRab:=PathRab+'\'+'Соцстрах\';
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+Fil.FIO+' '+Fil.Acc+'.txt';
    CopyFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathRab+SerchFile.Name),False);
    MoveFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathPolz));
    if FileExists(PathPolz) and FileExists(Block311P.Path.TempFile+SerchFile.Name) then DeleteFile(Block311P.Path.TempFile+SerchFile.Name);
    ColSoc:=ColSoc+1;
   End;
   If (Pos('SBP',SerchFile.Name)>0) then
   Begin
    Fil.Path:=SerchFile.Name;
    Fil.GetName;
    Fil.LoadFromBase;
    PathPolz:=Block311P.Path.Polzovatel;
    PathRab:=Block311P.Path.Arh;
    PathPolz:=PathPolz+DateToStr(Fil.DateFil);
    PathRab:=PathRab+DateToStr(Fil.DateFil);
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+Fil.Operator;
    PathRab:=PathRab+'\'+Fil.Operator;
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+'Пенсионный';
    PathRab:=PathRab+'\'+'Пенсионный\';
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+Fil.FIO+' '+Fil.Acc+'.txt';
    CopyFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathRab+SerchFile.Name),False);
    MoveFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathPolz));
    if FileExists(PathPolz) and FileExists(Block311P.Path.TempFile+SerchFile.Name) then DeleteFile(Block311P.Path.TempFile+SerchFile.Name);
    ColPen:=ColPen+1;
   End;
   If (Pos('UV',SerchFile.Name)>0) then
   Begin
    Error:=False;
    f:=TStringList.Create();
    f.LoadFromFile(Block311P.Path.TempFile+SerchFile.Name);
    For I:=0 To f.Count-1 do
    Begin
     S:=f[I];
     {<REZ_ARH>принят</REZ_ARH>}
     {<REZ_ARH>не принят: }
     If Pos('<REZ_ARH>не принят:',S)>0 then
     Begin
      {сдесь будет кусок отвечающий за ошибки}
      PathPolz:=Block311P.Path.Arh;
      PathPolz:=PathPolz+DateToStr(Date);
      if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
      PathPolz:=PathPolz+'\'+'Квитанции ЦБ Ошибки';
      if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
      PathPolz:=PathPolz+'\'+SerchFile.Name;
      MoveFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathPolz));
      Error:=True;
      Form1.ListBox1.Items.Add('Не принята квитанция ЦБ');
      Form1.ListBox3.Items.Add('Не принята квитанция ЦБ');
      LoadLog('Adm','Не принята квитанция ЦБ');
     End;
    End;
    f.Free;
    If Error=False then
    Begin
     PathPolz:=Block311P.Path.Arh;
     PathPolz:=PathPolz+DateToStr(Date);
     if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
     PathPolz:=PathPolz+'\'+'Квитанции ЦБ';
     if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
     PathPolz:=PathPolz+'\'+SerchFile.Name;
     MoveFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathPolz));
     Form1.ListBox1.Items.Add('Принята квитанция ЦБ');
     Form1.ListBox3.Items.Add('Принята квитанция ЦБ');
     LoadLog('Adm','Принята квитанция ЦБ');
    End;
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 If ColNal>0 then
 Begin
  Form1.ListBox1.Items.Add('Принято квитанций налоговой - '+IntToStr(ColNal));
  Form1.ListBox3.Items.Add('Принято квитанций налоговой - '+IntToStr(ColNal));
  LoadLog('311','Принято квитанций налоговой - '+IntToStr(ColNal));
  LoadLog('Adm','Принято квитанций налоговой - '+IntToStr(ColNal));
 End;
 If ColSoc>0 then
 Begin
  Form1.ListBox1.Items.Add('Принято квитанций соцстраха - '+IntToStr(ColSoc));
  Form1.ListBox3.Items.Add('Принято квитанций соцстраха - '+IntToStr(ColSoc));
  LoadLog('311','Принято квитанций соцстраха - '+IntToStr(ColSoc));
  LoadLog('Adm','Принято квитанций соцстраха - '+IntToStr(ColSoc));
 End;
 If ColPen>0 then
 Begin
  Form1.ListBox1.Items.Add('Принято квитанций пенсионного - '+IntToStr(ColPen));
  Form1.ListBox3.Items.Add('Принято квитанций пенсионного - '+IntToStr(ColPen));
  LoadLog('311','Принято квитанций пенсионного - '+IntToStr(ColPen));
  LoadLog('Adm','Принято квитанций пенсионного - '+IntToStr(ColPen));
 End;
End;

Procedure Object3251P.InCvitCB; {Принять квитовки ЦБ}
Var
 ColTBSVK:Integer;
 ColNal:Integer;
 ColSoc:Integer;
 ColPen:Integer;
 SerchFile:TSearchRec;
 FindRes:Integer;
 F:TStringList;
 S:String;
 PathPolz:String;
 PathRab:String;
 I:Integer;
 Error:Boolean;
 Fil:TFile3251P;
Begin
 ColNal:=0;
 ColSoc:=0;
 ColPen:=0;
 ColTBSVK:=0;
 FindClose(SerchFile);
 {Разобрать фаилы по составу}
 {UVAN101101502190001.xml - Квитовка на пакет}
 {Юрики}
 {SBF013510110_910220150216_249000031500026182_200.XML - Квитовка налоговой}
 {SBP013510110_910220150216_249000031500026356_200.XML - Квитовка пенсионного}
 {SBR013510110_910220150216_249000031500026347_200.xml - Квитовка соцстраха}
 {Физики}
 {SFF013510110_910220150212_249000031500024617_700.XML - Квитовка налоговой}
 FindRes:=Findfirst(Block311P.Path.TempFile+'*.*',faAnyFile,SerchFile);
 While FindRes=0 do
 Begin
  If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
  Begin
   If (Pos('ZAS',SerchFile.Name)>0) then
   Begin
    ColTBSVK:=ColTBSVK+1;
    MoveFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(Block3251P.Path.UnCa3+SerchFile.Name));

   End;
   If (Pos('SFF',SerchFile.Name)>0)or(Pos('SFE',SerchFile.Name)>0) then
   Begin
    Fil.Path:=SerchFile.Name;
    Fil.GetName;
    Fil.LoadFromBase;
    PathPolz:=Block3251P.Path.Polzovatel;
    PathRab:=Block3251P.Path.Arh;
    PathPolz:=PathPolz+DateToStr(Fil.DateFil);
    PathRab:=PathRab+DateToStr(Fil.DateFil);
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+Fil.Operator;
    PathRab:=PathRab+'\'+Fil.Operator;
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+'Налоговая';
    If Pos('SFE',SerchFile.Name)>0 then PathPolz:=PathPolz+'\'+'Ошибки';
    PathRab:=PathRab+'\'+'Налоговая\';
    if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
    if DirectoryExists(PathRab)=false then CreateDir(PathRab);
    PathPolz:=PathPolz+'\'+Fil.FIO+' '+Fil.Acc+'.txt';
    CopyFile(PChar(Block3251P.Path.TempFile+SerchFile.Name),PChar(PathRab+SerchFile.Name),False);
    MoveFile(PChar(Block3251P.Path.TempFile+SerchFile.Name),PChar(PathPolz));
    if FileExists(PathPolz) and FileExists(Block3251P.Path.TempFile+SerchFile.Name) then DeleteFile(Block3251P.Path.TempFile+SerchFile.Name);
    ColNal:=ColNal+1;
   End;
   If (Pos('UV',SerchFile.Name)>0) then
   Begin
    Error:=False;
    f:=TStringList.Create();
    f.LoadFromFile(Block311P.Path.TempFile+SerchFile.Name);
    For I:=0 To f.Count-1 do
    Begin
     S:=f[I];
     {<REZ_ARH>принят</REZ_ARH>}
     {<REZ_ARH>не принят: }
     If Pos('<REZ_ARH>не принят:',S)>0 then
     Begin
      {сдесь будет кусок отвечающий за ошибки}
      PathPolz:=Block311P.Path.Arh;
      PathPolz:=PathPolz+DateToStr(Date);
      if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
      PathPolz:=PathPolz+'\'+'Квитанции ЦБ Ошибки';
      if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
      PathPolz:=PathPolz+'\'+SerchFile.Name;
      MoveFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathPolz));
      Error:=True;
      Form1.ListBox1.Items.Add('Не принята квитанция ЦБ');
      Form1.ListBox3.Items.Add('Не принята квитанция ЦБ');
      LoadLog('Adm','Не принята квитанция ЦБ');
     End;
    End;
    f.Free;
    If Error=False then
    Begin
     PathPolz:=Block311P.Path.Arh;
     PathPolz:=PathPolz+DateToStr(Date);
     if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
     PathPolz:=PathPolz+'\'+'Квитанции ЦБ';
     if DirectoryExists(PathPolz)=false then CreateDir(PathPolz);
     PathPolz:=PathPolz+'\'+SerchFile.Name;
     MoveFile(PChar(Block311P.Path.TempFile+SerchFile.Name),PChar(PathPolz));
     Form1.ListBox1.Items.Add('Принята квитанция ЦБ');
     Form1.ListBox3.Items.Add('Принята квитанция ЦБ');
     LoadLog('Adm','Принята квитанция ЦБ');
    End;
   End;
  End;
  FindRes:=FindNext(SerchFile);
 End;
 FindClose(SerchFile);
 If ColTBSVK>0 then
 Begin
  Verba.Folder:=Block3251P.Path.UnCa3;
  Verba.UnCaFolder(3);
  FindRes:=Findfirst(Block3251P.Path.UnCa3+'*.*',faAnyFile,SerchFile);
  While FindRes=0 do
  Begin
   If (SerchFile.Name<>'.') and (SerchFile.Name<>'..') then
   Begin
    if DirectoryExists(Block3251P.Path.TBSvr211+DateToStr(Date))=false then CreateDir(Block3251P.Path.TBSvr211+DateToStr(Date));
    MoveFile(PChar(Block3251P.Path.UnCa3+SerchFile.Name),PChar(Block3251P.Path.TBSvr211+DateToStr(Date)+'\'+SerchFile.Name));
   End;
   FindRes:=FindNext(SerchFile);
  End;
  FindClose(SerchFile);
  Form1.ListBox1.Items.Add('Принято квитанций налоговой ТБСВК - '+IntToStr(ColTBSVK));
  Form1.ListBox3.Items.Add('Принято квитанций налоговой ТБСВК - '+IntToStr(ColTBSVK));
  LoadLog('211','Принято квитанций налоговой ТБСВК - '+IntToStr(ColTBSVK));
  LoadLog('Adm','Принято квитанций налоговой ТБСВК - '+IntToStr(ColTBSVK));
 End;
 If ColNal>0 then
 Begin
  Form1.ListBox1.Items.Add('Принято квитанций налоговой - '+IntToStr(ColNal));
  Form1.ListBox3.Items.Add('Принято квитанций налоговой - '+IntToStr(ColNal));
  LoadLog('3251','Принято квитанций налоговой - '+IntToStr(ColNal));
  LoadLog('Adm','Принято квитанций налоговой - '+IntToStr(ColNal));
 End;
End;

end.
