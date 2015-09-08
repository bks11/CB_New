program ExlsExport;

uses
  Forms,
  Main in 'Main.pas' {fmMain},
  Excel_TLB in 'Excel_TLB.pas',
  Data in 'Data.pas' {dmData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '«¿√–”« ¿ ƒ¿ÕÕ€’';
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.

