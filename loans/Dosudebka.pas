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

end;


implementation

Uses
 Main;

Procedure TDosudebnoe.RefreshList;
Begin
 DMData.QRDosudebkaList.Active:=False;
 DMData.QRDosudebkaList.Params.ParamValues['ID_LOAN']:=MainForm.MainLoansList.DataSource.DataSet.FieldByName('ID_LOAN').AsInteger;
 DMData.QRDosudebkaList.Active:=True;
End;

Procedure TDosudebnoe.AddAction;
Begin
 DMData.QRDosudebkaListAdd.Params.ParamValues['ID_LOAN']:=MainForm.MainLoansList.DataSource.DataSet.FieldByName('ID_LOAN').AsInteger;
 DMData.QRDosudebkaListAdd.Params.ParamValues['ACTION_DATE']:=MainForm.MonthCalendarDosudebnoe.Date;
 DMData.QRDosudebkaListAdd.Params.ParamValues['ID_USER']:=1;
 DMData.QRDosudebkaListAdd.Params.ParamValues['NOTE']:=MainForm.MemoDosudebka.Text;
 DMData.QRDosudebkaListAdd.ExecSQL;
 RefreshList;
End;

end.
