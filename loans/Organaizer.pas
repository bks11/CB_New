unit Organaizer;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, DBCtrls, DataModule, ComCtrls, Mask;
type
  TOrganaizer = class(TObject)
  public
  Procedure ChengeComplited; {Переключатель отображение комплит не комплит}
  Procedure Complited; {Комплитить задачу}
end;

implementation

Uses
 Main;

Procedure TOrganaizer.Complited;
Begin
 DMData.qrOrganaizerComplit.Params.ParamValues['ID_JUDJORNAL']:=MainForm.DBGridOrganaizerFul.DataSource.DataSet.FieldByName('ID_JUDJORNAL').AsInteger;
 DMData.qrOrganaizerComplit.ExecSQL;
 DMData.qrOrganaizerFul.Active:=False;
 DMData.qrOrganaizerFul.Params.ParamValues['ID_USER']:=LoginUsers.ID;
 DMData.qrOrganaizerFul.Params.ParamValues['IS_COMPLETED']:=MainForm.CheckBoxOrganaizerCompl.Checked;
 DMData.qrOrganaizerFul.Active:=True;
End; 

Procedure TOrganaizer.ChengeComplited;
Begin
 DMData.qrOrganaizerFul.Active:=False;
 DMData.qrOrganaizerFul.Params.ParamValues['ID_USER']:=LoginUsers.ID;
 DMData.qrOrganaizerFul.Params.ParamValues['IS_COMPLETED']:=MainForm.CheckBoxOrganaizerCompl.Checked;
 DMData.qrOrganaizerFul.Active:=True;
 if MainForm.CheckBoxOrganaizerCompl.Checked=True then MainForm.ButtonOrganaizerComplit.Enabled:=False;
 if MainForm.CheckBoxOrganaizerCompl.Checked=False then MainForm.ButtonOrganaizerComplit.Enabled:=True;
End;
end.
