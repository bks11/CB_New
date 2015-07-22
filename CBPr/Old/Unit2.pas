unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, DockTabSet, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons,
  WideStrings, FMTBcd, DB, SqlExpr;

Type

 Object311P = Object
  Path : record
   InS:String;
   InP:String;
   OutP:String;
   InK:String;
   OutK:String;
   InArh:String;
   OutArh:String;
   InPAr:String;
   OutPAr:String;
   InPak:String;
   OutPak:String;
   InCB:String;
   OutCB:String;
  End;
  Procedure LoadPath; {Загрузить пути к папкам}
  Procedure SozdPath; {Создать каталоги если их нет}
 End;

implementation

Uses
 Unit1;

Procedure Object311P.LoadPath;
Var
 Pathh:String;
Begin
 {Form1.SQLQuery1.SQL.Clear;
 Form1.SQLQuery1.SQL.Add('select * from Path_311 where Id=1');
 Form1.SQLQuery1.Active:=True;
 Pathh:=Form1.SQLQuery1.FieldByName('Path').AsString;
 Form1.SQLQuery1.Active:=False; }
 Path.InS:='D:\CB\311\Созданные\';
 Path.InP:='D:\CB\311\На подпись\';
 Path.OutP:='D:\CB\311\С подписи\';
 Path.InK:='D:\CB\311\На криптование\';
 Path.OutK:='D:\CB\311\С криптования\';
 Path.InArh:='D:\CB\311\На архивацию\';
 Path.OutArh:='D:\CB\311\С архивации\';
 Path.InPAr:='D:\CB\311\На подпись архива\';
 Path.OutPAr:='D:\CB\311\С подписи архива\';
 Path.InPak:='D:\CB\311\На пакетирование\';
 Path.OutPak:='D:\CB\311\С пакетирования\';
 Path.InCB:='D:\CB\311\На ЦБ\';
 Path.OutCB:='D:\CB\311\С ЦБ\';
End;

Procedure Object311P.SozdPath;
Begin
 if DirectoryExists('D:\CB')=false then CreateDir('D:\CB');
 {Создаем папки согласно правам}
 if User.Prava.Verba then
 Begin
  if DirectoryExists('D:\CB\Верба\')=false then CreateDir('D:\CB\Верба\');
  if DirectoryExists('D:\CB\Верба\311\')=false then CreateDir('D:\CB\Верба\311\');
  if DirectoryExists('D:\CB\Верба\311\На подпись\')=false then CreateDir('D:\CB\Верба\311\На подпись\');
  if DirectoryExists('D:\CB\Верба\311\С подписи\')=false then CreateDir('D:\CB\Верба\311\С подписи');
  if DirectoryExists('D:\CB\Верба\311\На криптование\')=false then CreateDir('D:\CB\Верба\311\На криптование');
  if DirectoryExists('D:\CB\Верба\311\С криптования\')=false then CreateDir('D:\CB\Верба\311\С криптования');
  if DirectoryExists('D:\CB\Верба\311\На подпись архива\')=false then CreateDir('D:\CB\Верба\311\На подпись архива');
  if DirectoryExists('D:\CB\Верба\311\С подписи архива\')=false then CreateDir('D:\CB\Верба\311\С подписи архива');
 End;
 if User.Prava.P311 then
 Begin
  if DirectoryExists('D:\CB\311\')=false then CreateDir('D:\CB\311\');
  if DirectoryExists('D:\CB\311\')=false then CreateDir('D:\CB\311\');
 End;
End;

end.
