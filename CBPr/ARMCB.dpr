program ARMCB;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uRep311 in 'uRep311.pas',
  Data in 'Data.pas' {dmData: TDataModule},
  Arhivator in 'Arhivator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
