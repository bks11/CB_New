program AppLauncher;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uUtilites in 'uUtilites.pas',
  uData in 'uData.pas' {dmData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
