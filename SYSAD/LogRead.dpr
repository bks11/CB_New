program LogRead;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Data in 'Data.pas' {dmData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

