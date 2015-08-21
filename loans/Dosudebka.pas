unit Dosudebka;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, DBCtrls, DataModule, ComCtrls, Mask;

type
  TDosudebnoe = class(TObject)
  public

  Procedure AddAction; {ƒобавить досудебное действие по кредиту}
  Procedure RefreshList; {ќбновить досудебные действи€ по кредиту}
  Procedure LoadSelectedItem; {«агрузить данные по выбранной  строке}
  Procedure DelSelectedItem; {”далить данные по выбранной  строке}
  Procedure EditSelectedItem; {–едактить данные по выбранной  строке}
end;


implementation

Uses
 Main;

Procedure TDosudebnoe.RefreshList;
Begin
 DMData.QRDosudebkaList.Active:=False;
 DMData.QRDosudebkaList.Params.ParamValues['ID_LOAN']:= DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
 DMData.QRDosudebkaList.Active:=True;
End;

Procedure TDosudebnoe.AddAction;
Begin
 DMData.QRDosudebkaListAdd.Params.ParamValues['ID_LOAN']:= DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
 DMData.QRDosudebkaListAdd.Params.ParamValues['ACTION_DATE']:=MainForm.MonthCalendarDosudebnoe.Date;
 DMData.QRDosudebkaListAdd.Params.ParamValues['ID_USER']:=1;
 DMData.QRDosudebkaListAdd.Params.ParamValues['NOTE']:=MainForm.MemoDosudebka.Text;
 DMData.QRDosudebkaListAdd.ExecSQL;
 RefreshList;
 MainForm.ButtonDosudebkaEdit.Enabled:=False;
 MainForm.ButtonDosudebkaDel.Enabled:=False;
End;

Procedure TDosudebnoe.LoadSelectedItem;
Begin
 MainForm.MonthCalendarDosudebnoe.Date:=DMData.QRDosudebkaList.FieldByName('ACTION_DATE').AsDateTime;
 MainForm.MemoDosudebka.Text:=DMData.QRDosudebkaList.FieldByName('NOTE').AsString;
 MainForm.ButtonDosudebkaEdit.Enabled:=True;
 MainForm.ButtonDosudebkaDel.Enabled:=True;
End;

Procedure TDosudebnoe.DelSelectedItem;
Begin
 DMData.QRDosudebkaListDel.Params.ParamValues['ID_JUDJORNAL']:=DMData.QRDosudebkaList.FieldByName('ID_JUDJORNAL').AsInteger;
 DMData.QRDosudebkaListDel.ExecSQL;
 RefreshList;
 MainForm.ButtonDosudebkaEdit.Enabled:=False;
 MainForm.ButtonDosudebkaDel.Enabled:=False;
End;

Procedure TDosudebnoe.EditSelectedItem;
Begin
 DMData.QRDosudebkaListEdit.Params.ParamValues['ID_JUDJORNAL']:=DMData.QRDosudebkaList.FieldByName('ID_JUDJORNAL').AsInteger;
 DMData.QRDosudebkaListEdit.Params.ParamValues['ACTION_DATE']:=MainForm.MonthCalendarDosudebnoe.Date;
 DMData.QRDosudebkaListEdit.Params.ParamValues['ID_USER']:=1;
 DMData.QRDosudebkaListEdit.Params.ParamValues['NOTE']:=MainForm.MemoDosudebka.Text;
 DMData.QRDosudebkaListEdit.ExecSQL;
 RefreshList;
 MainForm.ButtonDosudebkaEdit.Enabled:=False;
 MainForm.ButtonDosudebkaDel.Enabled:=False;
End;

end.
