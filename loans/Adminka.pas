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
  Procedure LoadLoansList; {Загрузка данных по кредитам для прикрепления юзеров}
  Procedure RefreshLoansList; {Загрузка данных по кредитам для прикрепления юзеров}
  Procedure ADDBaseLoansList; {Синхронизация прав с базой}
  Procedure LoadCurses; {Загрузить курсы с базы за дату}
  Procedure AddCurses; {Загрузить курсы в базы за дату}
  Procedure EditCurses; {Загрузить курсы в базы за дату}
end;


implementation

Uses
 Main;

Procedure TMainAdminka.EditCurses;
Begin
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_CODE']:='840';
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_DATE']:=MainForm.MonthCalendarAdmCurses.Date;
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_RATE']:=StrToCurr(MainForm.EditAdmCursUsd.Text);
 DMData.qrAdminQursEdit.ExecSQL;
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_CODE']:='978';
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_DATE']:=MainForm.MonthCalendarAdmCurses.Date;
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_RATE']:=StrToCurr(MainForm.EditAdmCursEur.Text);
 DMData.qrAdminQursEdit.ExecSQL;
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_CODE']:='980';
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_DATE']:=MainForm.MonthCalendarAdmCurses.Date;
 DMData.qrAdminQursEdit.Params.ParamValues['CURR_RATE']:=StrToCurr(MainForm.EditAdmCursUah.Text);
 DMData.qrAdminQursEdit.ExecSQL;
End;

Procedure TMainAdminka.AddCurses;
Begin
 DMData.qrAdminCursAdd.Params.ParamValues['CURR_DATE']:=MainForm.MonthCalendarAdmCurses.Date;
 If MainForm.EditAdmCursUsd.Text='' then MainForm.EditAdmCursUsd.Text:='0';
 If MainForm.EditAdmCursEur.Text='' then MainForm.EditAdmCursEur.Text:='0';
 If MainForm.EditAdmCursUah.Text='' then MainForm.EditAdmCursUah.Text:='0';
 if StrToCurr(MainForm.EditAdmCursUsd.Text)>0 then
 Begin
  DMData.qrAdminCursAdd.Params.ParamValues['CURR_CODE']:=840;
  DMData.qrAdminCursAdd.Params.ParamValues['CURR_RATE']:=StrToCurr(MainForm.EditAdmCursUsd.Text);
  DMData.qrAdminCursAdd.ExecSQL;
 End;
 if StrToCurr(MainForm.EditAdmCursEur.Text)>0 then
 Begin
  DMData.qrAdminCursAdd.Params.ParamValues['CURR_CODE']:=978;
  DMData.qrAdminCursAdd.Params.ParamValues['CURR_RATE']:=StrToCurr(MainForm.EditAdmCursEur.Text);
  DMData.qrAdminCursAdd.ExecSQL;
 End;
 if StrToCurr(MainForm.EditAdmCursUah.Text)>0 then
 Begin
  DMData.qrAdminCursAdd.Params.ParamValues['CURR_CODE']:=980;
  DMData.qrAdminCursAdd.Params.ParamValues['CURR_RATE']:=StrToCurr(MainForm.EditAdmCursUah.Text);
  DMData.qrAdminCursAdd.ExecSQL;
 End;
End;

Procedure TMainAdminka.LoadCurses;
Begin
 DMData.qrAdminsCursesLoad.Active:=False;
 DMData.qrAdminsCursesLoad.Params.ParamValues['CURR_DATE']:=MainForm.MonthCalendarAdmCurses.Date;
 DMData.qrAdminsCursesLoad.Active:=True;
 MainForm.EditAdmCursUsd.Text:='';
 MainForm.EditAdmCursEur.Text:='';
 MainForm.EditAdmCursUah.Text:='';
 MainForm.ButtonAdmCursAdd.Enabled:=False;
 MainForm.ButtonAdmCursSave.Enabled:=False;
 DMData.qrAdminsCursesLoad.First;
 while NOT DMData.qrAdminsCursesLoad.Eof do
 begin
  {USD} {840}
  {EUR} {978}
  {UAH} {980}
  If DMData.qrAdminsCursesLoad.FieldByName('CURR_CODE').AsInteger=840 then
  Begin
   MainForm.EditAdmCursUsd.Text:=FloatToStr(DMData.qrAdminsCursesLoad.FieldByName('CURR_RATE').AsFloat);
  End;
  If DMData.qrAdminsCursesLoad.FieldByName('CURR_CODE').AsInteger=978 then
  Begin
   MainForm.EditAdmCursEur.Text:=FloatToStr(DMData.qrAdminsCursesLoad.FieldByName('CURR_RATE').AsFloat);
  End;
  If DMData.qrAdminsCursesLoad.FieldByName('CURR_CODE').AsInteger=980 then
  Begin
   MainForm.EditAdmCursUah.Text:=FloatToStr(DMData.qrAdminsCursesLoad.FieldByName('CURR_RATE').AsFloat);
  End;
  MainForm.ButtonAdmCursSave.Enabled:=True;
  DMData.qrAdminsCursesLoad.Next;
 end;
 if MainForm.ButtonAdmCursSave.Enabled=True then MainForm.ButtonAdmCursAdd.Enabled:=False;
 if MainForm.ButtonAdmCursSave.Enabled=False then MainForm.ButtonAdmCursAdd.Enabled:=True;
 DMData.qrAdminsCursesLoad.Active := False;
End;

Procedure TMainAdminka.ADDBaseLoansList;
Begin
 {Узнать ИД кредита}
 DMData.QRAdminUsersLVSLDGGetId.Active:=False;
 DMData.QRAdminUsersLVSLDGGetId.Params.ParamValues['AGREEMENT_NUM']:=MainForm.CheckListBoxAdminLoans.Items[MainForm.CheckListBoxAdminLoans.ItemIndex];
 DMData.QRAdminUsersLVSLDGGetId.Active:=True;
 If MainForm.CheckListBoxAdminLoans.Checked[MainForm.CheckListBoxAdminLoans.ItemIndex]=False then
 Begin
  {Удалить}
  DMData.QRAdminUsersLVSLDGDel.Params.ParamValues['ID_USER']:=MainForm.DBGridAdminUsersFromLOans.DataSource.DataSet.FieldByName('ID_USER').AsInteger;
  DMData.QRAdminUsersLVSLDGDel.Params.ParamValues['ID_LOAN']:=DMData.QRAdminUsersLVSLDGGetId.FieldByName('ID_LOAN').AsInteger;
  DMData.QRAdminUsersLVSLDGDel.ExecSQL;
 End else
 Begin
  {Добавить}
  DMData.QRAdminUsersLVSLDGAdd.Params.ParamValues['ID_USER']:=MainForm.DBGridAdminUsersFromLOans.DataSource.DataSet.FieldByName('ID_USER').AsInteger;
  DMData.QRAdminUsersLVSLDGAdd.Params.ParamValues['ID_LOAN']:=DMData.QRAdminUsersLVSLDGGetId.FieldByName('ID_LOAN').AsInteger;
  DMData.QRAdminUsersLVSLDGAdd.ExecSQL;
 End;
 DMData.QRAdminUsersLVSLDGGetId.Active:=False;
End;

Procedure TMainAdminka.RefreshLoansList;
Var
 I:Integer;
Begin
 DMData.QRAdminUsersLVSLDG.Active := False;
 DMData.QRAdminUsersLVSLDG.Params.ParamValues['ID_USER']:=MainForm.DBGridAdminUsersFromLOans.DataSource.DataSet.FieldByName('ID_USER').AsInteger;
 DMData.QRAdminUsersLVSLDG.Active := True;
 for I := 0 to MainForm.CheckListBoxAdminLoans.Items.Count - 1 do
 Begin
  MainForm.CheckListBoxAdminLoans.Checked[I]:=False;
 End;
 DMData.QRAdminUsersLVSLDG.First;
 while NOT DMData.QRAdminUsersLVSLDG.Eof do
 begin
  for I := 0 to MainForm.CheckListBoxAdminLoans.Items.Count - 1 do
  Begin
   if DMData.QRAdminUsersLVSLDG.FieldByName('AGREEMENT_NUM').AsString=MainForm.CheckListBoxAdminLoans.Items[I] then
   Begin
    MainForm.CheckListBoxAdminLoans.Checked[I]:=True;
   End;
  End;
  DMData.QRAdminUsersLVSLDG.Next;
 end;
 DMData.QRAdminUsersLVSLDG.Active := False;
End;

Procedure TMainAdminka.LoadLoansList;
Begin
 MainForm.CheckListBoxAdminLoans.Items.Clear;
 DMData.qrAny.Active := False;
 DMData.qrAny.SQL[0]:='SELECT "TLOAN"."AGREEMENT_NUM" FROM "TLOAN";';
 DMData.qrAny.Active := True;
 DMData.qrAny.First;
 while NOT DMData.qrAny.Eof do begin
  MainForm.CheckListBoxAdminLoans.Items.Add(DMData.qrAny.FieldByName('AGREEMENT_NUM').AsString);
  DMData.qrAny.Next;
 end;
 DMData.qrAny.Active := False;
End;

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
