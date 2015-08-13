unit Adminka;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, DBCtrls, DataModule, ComCtrls, Mask;

type
  TMainAdminka = class(TObject)
  public

  Procedure LoansVsLoanserButtonName; {Загрузка данных по кредиту}
  Procedure LoansVsLoanserButtonDelete; {Загрузка данных по кредиту}
end;


implementation

Uses
 Main;

Procedure TMainAdminka.LoansVsLoanserButtonName;
Begin
 DMData.QRAdminUsersLVSL.Active:=False;
 DMData.QRAdminUsersLVSL.Params.ParamValues['ID_LOANS']:=MainForm.DBGridLoansLVSL.DataSource.DataSet.FieldByName('ID_LOAN').AsInteger;
 DMData.QRAdminUsersLVSL.Params.ParamValues['ID_LOANER']:=MainForm.DBGridLoanserLVsL.DataSource.DataSet.FieldByName('ID_LOANER').AsInteger;
 DMData.QRAdminUsersLVSL.Active:=True;

 MainForm.ButtonAddLVsL.caption:='Удалить';
 if DMData.QRAdminUsersLVSL.Eof then
 Begin
  DMData.QRAdminUsersLVSL.First;
  MainForm.ButtonAddLVsL.caption:='Добавить';
 End;
 DMData.QRAdminUsersLVSL.Active:=False;
End;

Procedure TMainAdminka.LoansVsLoanserButtonDelete;
Begin
 DMData.QRAdminUsersLVSL.Params.ParamValues['ID_LOANS']:=MainForm.DBGridLoansLVSL.DataSource.DataSet.FieldByName('ID_LOAN').AsInteger;
 DMData.QRAdminUsersLVSL.Params.ParamValues['ID_LOANER']:=MainForm.DBGridLoanserLVsL.DataSource.DataSet.FieldByName('ID_LOANER').AsInteger;

 If MainForm.ButtonAddLVsL.caption='Удалить' then
 Begin
  DMData.QRAdminUsersLVSLDel.Params.ParamValues['ID_LOANS']:=MainForm.DBGridLoansLVSL.DataSource.DataSet.FieldByName('ID_LOAN').AsInteger;
  DMData.QRAdminUsersLVSLDel.Params.ParamValues['ID_LOANER']:=MainForm.DBGridLoanserLVsL.DataSource.DataSet.FieldByName('ID_LOANER').AsInteger;
  DMData.QRAdminUsersLVSLDel.ExecSQL;
  MainForm.ButtonAddLVsL.caption:='';
 End;
 If MainForm.ButtonAddLVsL.caption='Добавить' then
 Begin
  DMData.QRAdminUsersLVSLAdd.Params.ParamValues['ID_LOANS']:=MainForm.DBGridLoansLVSL.DataSource.DataSet.FieldByName('ID_LOAN').AsInteger;
  DMData.QRAdminUsersLVSLAdd.Params.ParamValues['ID_LOANER']:=MainForm.DBGridLoanserLVsL.DataSource.DataSet.FieldByName('ID_LOANER').AsInteger;
  DMData.QRAdminUsersLVSLAdd.ExecSQL;
  MainForm.ButtonAddLVsL.caption:='';
 End;
End;

end.
