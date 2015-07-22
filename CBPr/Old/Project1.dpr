program Project1;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uRep311 in 'uRep311.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
