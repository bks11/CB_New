program Loans;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  DataModule in 'DataModule.pas' {DMData: TDataModule},
  MainLoanInfo in 'MainLoanInfo.pas',
  MainPortfelInfo in 'MainPortfelInfo.pas',
  Adminka in 'Adminka.pas',
  Dosudebka in 'Dosudebka.pas',
  Login in 'Login.pas' {fmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMData, DMData);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfmLogin, fmLogin);
  Application.Run;
end.
