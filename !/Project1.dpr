program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas',
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas',
  Unit5 in 'Unit5.pas',
  Unit6 in 'Unit6.pas',
  Unit7 in 'Unit7.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
