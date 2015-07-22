program ARMCB;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uRep311 in 'uRep311.pas',
  Data in 'Data.pas' {dmData: TDataModule},
  uCBReport in 'uCBReport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmData, dmData);
  Application.Run;
end.
