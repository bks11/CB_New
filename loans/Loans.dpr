program Loans;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Data in 'Data.pas' {DMData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMData, DMData);
  Application.Run;
end.
