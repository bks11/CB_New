unit MainLoanInfo;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, DBCtrls, DataModule, ComCtrls, Mask;
type
  TMainLoanInfo = class(TObject)
  public
    const
      SQL_GET_LOAN_LIST = 'SELECT "ID_LOAN", "AGREEMENT_NUM" FROM "TLOAN"';
      SQL_ALL_LOAN_INFO = 'SELECT * FROM "TLOAN"';

    function GetLoanList(): TStringList;
    Procedure MainLoanInfoLoadData; {Загрузка данных по кредиту}
    Procedure MainLoanInfoPogashLoans; {Погасить кредит}
    Procedure MainLoanInfoMultiLoadDebtor; {Загрузка данных по разным поручителям}
    Procedure MainLoanInfoLoanerUpdate; {Обновить лоанера}
    Function MainLoanInfoGetColDebtors() :Integer; {Узнать количество должников п о кредиту}
    Procedure MainLoanInfoLoanerAdd; {Добавить лоанера}
    Procedure MainLoanInfoLoanerDel; {Удалить лоанера}
end;

implementation

Uses
 Main;

{ TMainLoanInfo }

Function TMainLoanInfo.MainLoanInfoGetColDebtors() :Integer;
Begin
 Result:=0;
 DMData.ADQueryLoanInfoColDebtor.Active:=False;
 DMData.ADQueryLoanInfoColDebtor.ParamByName('ID_Loans').Value:=DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
 DMData.ADQueryLoanInfoColDebtor.Active:=True;
 If DMData.ADQueryLoanInfoColDebtor.FieldByName('col').AsInteger>0 then Result:=DMData.ADQueryLoanInfoColDebtor.FieldByName('col').AsInteger;
 DMData.ADQueryLoanInfoColDebtor.Active:=False;
End;

Procedure TMainLoanInfo.MainLoanInfoLoanerDel();
Begin
 DMData.ADQueryLoansInfoDelLoaner.ParamByName('ID_LOANER').Value:=DMData.qrLoanerInfoByLoans.FieldByName('ID_LOANER').AsInteger;
 DMData.ADQueryLoansInfoDelLoaner.ParamByName('ID_LOAN').Value:=DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
 if (MainLoanInfoGetColDebtors<2) and (MainForm.CheckBoxLoanInfoIsDebtor.Checked=False) then
 Begin
  ShowMessage('По кредиту должен остаться должник');
 End else
 Begin
  DMData.ADQueryLoansInfoDelLoaner.ExecSQL;
  DMData.qrLoanerInfoByLoans.Active:=False;
  DMData.qrLoanerInfoByLoans.ParamByName('ID_LOANS').Value := DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
  DMData.qrLoanerInfoByLoans.Active:=True;
  DMData.qrLoanerInfoByLoans.First;
  while NOT DMData.qrLoanerInfoByLoans.Eof do begin
   MainLoanInfoMultiLoadDebtor;
   Break;
   DMData.qrLoanerInfoByLoans.Next;
  end;//while EOF
 End;
End;

Procedure TMainLoanInfo.MainLoanInfoLoanerAdd();
Var
 Up:Boolean;
Begin
 {ADQueryLoansInfoAddLoaner}
 DMData.ADQueryLoansInfoAddLoaner.Active:=False;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('FIRSTNAME').Value:=MainForm.EditLoanInfoNam.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('LASTNAME').Value:=MainForm.EditLoanInfoFam.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('MIDDLENAME').Value:=MainForm.EditLoanInfoOtch.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('INN').Value:=MainForm.EditLoanInfoInn.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('PASSPORTSERIAL').Value:=MainForm.EditLoanInfoPSe.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('PASSPORTNUM').Value:=MainForm.EditLoanInfoPNo.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('PASSPORT_ISSUE_DATE').Value:=StrToDate(MainForm.EditLoanInfoDat.Text);
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('PASSPORT_ISSUE_ORG').Value:=MainForm.EditLoanInfoKem.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('ADDRESS1').Value:=MainForm.EditLoanInfoAd1.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('ADDRESS2').Value:=MainForm.EditLoanInfoAd2.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('PHONE1').Value:=MainForm.EditLoanInfoTe1.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('PHONE2').Value:=MainForm.EditLoanInfoTe2.Text;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('IS_GUARANTOR').Value:=MainForm.CheckBoxLoanInfoIsDebtor.Checked;
 DMData.ADQueryLoansInfoAddLoaner.ParamByName('FULL_NAME').Value:=MainForm.EditLoanInfoFam.Text+' '+MainForm.EditLoanInfoNam.Text+' '+MainForm.EditLoanInfoOtch.Text;

 if (Length(MainForm.EditLoanInfoPSe.Text)>4)or(Length(MainForm.EditLoanInfoPNo.Text)>6)  then
 Begin
  ShowMessage('Не верно указаны паспортные данные');
  Up:=True;
 End;
 if (MainForm.EditLoanInfoNam.Text<>'')and(MainForm.EditLoanInfoFam.Text<>'')and(MainForm.EditLoanInfoOtch.Text<>'') then
 Begin

 End else
 Begin
  ShowMessage('Не заполнено ФИО');
  Up:=True;
 End;
 if MainForm.CheckBoxLoanInfoIsDebtor.Checked then
 Begin
  if MainLoanInfoGetColDebtors<2 then
  Begin
   Up:=True;
   ShowMessage('По кредиту должен остаться должник');
  End;
 End;
 If Up=False then
 Begin
  DMData.ADQueryLoansInfoAddLoaner.ExecSQL;
  DMData.ADQueryLoansInfoMaxIdDebtors.Active:=False;
  DMData.ADQueryLoansInfoMaxIdDebtors.Active:=True;
  DMData.ADQueryLoanerInfoAdd.ParamByName('ID_LOANER').Value:=DMData.ADQueryLoansInfoMaxIdDebtors.FieldByName('max').AsInteger;
  DMData.ADQueryLoanerInfoAdd.ParamByName('ID_LOAN').Value:=DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
  DMData.ADQueryLoanerInfoAdd.ExecSQL;
  DMData.ADQueryLoansInfoMaxIdDebtors.Active:=False;

  DMData.qrLoanerInfoByLoans.Active:=False;
  DMData.qrLoanerInfoByLoans.ParamByName('ID_LOANS').Value := DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
  DMData.qrLoanerInfoByLoans.Active:=True;
  DMData.qrLoanerInfoByLoans.First;
  while NOT DMData.qrLoanerInfoByLoans.Eof do begin
   MainLoanInfoMultiLoadDebtor;
   Break;
   DMData.qrLoanerInfoByLoans.Next;
  end;//while EOF
 End;
End;

Procedure TMainLoanInfo.MainLoanInfoLoanerUpdate();
Var
 Up:Boolean;
Begin
 Up:=False;
 DMData.ADQueryLoansInfoUpdateLoaner.Active:=False;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('FIRSTNAME').Value:=MainForm.EditLoanInfoNam.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('LASTNAME').Value:=MainForm.EditLoanInfoFam.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('MIDDLENAME').Value:=MainForm.EditLoanInfoOtch.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('INN').Value:=MainForm.EditLoanInfoInn.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('PASSPORTSERIAL').Value:=MainForm.EditLoanInfoPSe.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('PASSPORTNUM').Value:=MainForm.EditLoanInfoPNo.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('PASSPORT_ISSUE_DATE').Value:=StrToDate(MainForm.EditLoanInfoDat.Text);
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('PASSPORT_ISSUE_ORG').Value:=MainForm.EditLoanInfoKem.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('ADDRESS1').Value:=MainForm.EditLoanInfoAd1.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('ADDRESS2').Value:=MainForm.EditLoanInfoAd2.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('PHONE1').Value:=MainForm.EditLoanInfoTe1.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('PHONE2').Value:=MainForm.EditLoanInfoTe2.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('IS_GUARANTOR').Value:=MainForm.CheckBoxLoanInfoIsDebtor.Checked;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('FULL_NAME').Value:=MainForm.EditLoanInfoFam.Text+' '+MainForm.EditLoanInfoNam.Text+' '+MainForm.EditLoanInfoOtch.Text;
 DMData.ADQueryLoansInfoUpdateLoaner.ParamByName('ID_LOANER').Value:=DMData.qrLoanerInfoByLoans.FieldByName('ID_LOANER').AsInteger;
 if (Length(MainForm.EditLoanInfoPSe.Text)>4)or(Length(MainForm.EditLoanInfoPNo.Text)>6)  then
 Begin
  ShowMessage('Не верно указаны паспортные данные');
  Up:=True;
 End;
 if (MainForm.EditLoanInfoNam.Text<>'')and(MainForm.EditLoanInfoFam.Text<>'')and(MainForm.EditLoanInfoOtch.Text<>'') then
 Begin

 End else
 Begin
  ShowMessage('Не заполнено ФИО');
  Up:=True;
 End;
 if MainForm.CheckBoxLoanInfoIsDebtor.Checked then
 Begin
  if MainLoanInfoGetColDebtors<2 then
  Begin
   Up:=True;
   ShowMessage('По кредиту должен остаться должник');
  End;
 End;
 If Up=False then DMData.ADQueryLoansInfoUpdateLoaner.ExecSQL;
End;

Procedure TMainLoanInfo.MainLoanInfoPogashLoans();
Begin
 DMData.ADQueryLoansInfoPogashLoans.Active:=False;
 DMData.ADQueryLoansInfoPogashLoans.ParamByName('IS_PAID').Value:=MainForm.CheckBoxPogashLoans.Checked;
 DMData.ADQueryLoansInfoPogashLoans.ParamByName('ID_LOAN').Value:=DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
 DMData.ADQueryLoansInfoPogashLoans.ExecSQL;
 {MainForm.RefreshLoansList(MainForm.chbPaid.Checked);}
End;

Procedure TMainLoanInfo.MainLoanInfoMultiLoadDebtor();
Begin
 {MainForm.LoansInfoFIOLoaner.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('LASTNAME').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('FIRSTNAME').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('MIDDLENAME').AsString;}
 MainForm.EditLoanInfoFam.Text:=DMData.qrLoanerInfoByLoans.FieldByName('LASTNAME').AsString;
 MainForm.EditLoanInfoNam.Text:=DMData.qrLoanerInfoByLoans.FieldByName('FIRSTNAME').AsString;
 MainForm.EditLoanInfoOtch.Text:=DMData.qrLoanerInfoByLoans.FieldByName('MIDDLENAME').AsString;
 {MainForm.LoansInfoINNLoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('INN').AsString;}
 MainForm.EditLoanInfoInn.Text:=DMData.qrLoanerInfoByLoans.FieldByName('INN').AsString;
 {MainForm.LoansInfoPasNumoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTSERIAL').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTNUM').AsString;}
 MainForm.EditLoanInfoPSe.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTSERIAL').AsString;
 MainForm.EditLoanInfoPNo.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTNUM').AsString;
 if (MainForm.EditLoanInfoPSe.Text='')and(MainForm.EditLoanInfoPNo.Text='') then
 Begin
  MainForm.EditLoanInfoPSe.Text:=DMData.qrLoanerInfoByLoans.FieldByName('FULL_PASSPORT').AsString;
 End;
 {MainForm.LoansInfoPasDat.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_DATE').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_ORG').AsString;}
 MainForm.EditLoanInfoDat.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_DATE').AsString;
 MainForm.EditLoanInfoKem.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_ORG').AsString;
 {MainForm.LoansInfoAdres1Loader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS1').AsString;}
 MainForm.EditLoanInfoAd1.Text:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS1').AsString;
 {MainForm.LoansInfoAdres2Loader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS2').AsString;}
 MainForm.EditLoanInfoAd2.Text:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS2').AsString;
 {MainForm.LoansInfoFoneLoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PHONE1').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PHONE2').AsString;}
 MainForm.EditLoanInfoTe1.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PHONE1').AsString;
 MainForm.EditLoanInfoTe2.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PHONE2').AsString;
 if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=True then MainForm.CheckBoxLoanInfoIsDebtor.Checked:=True; {MainForm.LoansInfoPoruchitel.Caption:='Поручитель';}
 if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=False then MainForm.CheckBoxLoanInfoIsDebtor.Checked:=False; {MainForm.LoansInfoPoruchitel.Caption:='Должник';}

End;

function TMainLoanInfo.GetLoanList: TStringList;
var
  sl : TStringList;
begin
  sl:= TStringList.Create();
  try
    dmData.qrAny.Active := False;
    dmData.qrAny.SQL.Add(SQL_GET_LOAN_LIST);
    DMData.qrAny.Active := True;
    DMData.qrAny.First;
    while NOT DMData.qrAny.Eof do begin
      sl.Add(DMData.qrAny.FieldByName('AGREEMENT_NUM').AsString);
      DMData.qrAny.Next;
    end;//while EOF
  except on E: Exception do  begin
    ShowMessage(E.Message);
    sl.Clear;
    sl.Free;
    Result := nil;
  end;
  end;//TRY  EXCEPT
  Result := sl;
end;

Procedure TMainLoanInfo.MainLoanInfoLoadData();
{Загрузка данных}
var
   DebtEq         : Real;
   OutDateEq      : Real;
   PercentEq      : Real;
   //ComEq          : Real;

   CurrencyName : String;
   is_paid :  boolean;

Begin
  is_paid :=  DMData.qrLoanInfo.FieldByName('IS_PAID').AsBoolean;
  if is_paid then MainForm.btnPay.Caption :='Отм.погашен.' else MainForm.btnPay.Caption :='Погасить';
  MainForm.CheckBoxPogashLoans.Checked := is_paid;


  {Расчет эквивалента}
  CurrencyName := DMData.qrLoanInfo.FieldByName('LOAN_CURRENCY').AsString;

  if CurrencyName = '978' then begin
     DebtEq := DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsFloat * MainForm.EURRate;
     OutDateEq := DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsFloat * MainForm.EURRate;
     PercentEq := DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsFloat * MainForm.EURRate;
  end;

  if CurrencyName = '840' then begin
     DebtEq := DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsFloat * MainForm.USDRate;
     OutDateEq := DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsFloat * MainForm.USDRate;
     PercentEq := DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsFloat * MainForm.USDRate;
  end;

  if CurrencyName = '980' then begin
     DebtEq := DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsFloat * MainForm.UAHRate;
     OutDateEq := DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsFloat * MainForm.UAHRate;
     PercentEq := DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsFloat * MainForm.UAHRate;
  end;

  if ((CurrencyName = '810') OR (CurrencyName = '643')) then begin
     DebtEq := DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsFloat;
     OutDateEq := DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsFloat;
     PercentEq := DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsFloat;
  end;

  {Загрузка данных по кредиту}
  MainForm.LoansInfoDateLoans.Caption:='Дата выдачи ' + DMData.qrLoanInfo.FieldByName('ISSUE_DATE').AsString;
  MainForm.LoansInfoSumValLoans.Caption:='Сумма ' + DMData.qrLoanInfo.FieldByName('LOAN_SUMM').AsString;
  MainForm.LoansInfoValLoans.Caption:='Валюта ' + DMData.qrLoanInfo.FieldByName('LOAN_CURRENCY').AsString;
  MainForm.LoansInfoDateEndLoans.Caption:='Дата окончания ' + DMData.qrLoanInfo.FieldByName('END_DATE').AsString;
  MainForm.LoansInfoDebtLoans.Caption:='Сумма задолженности ' + DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsString;
  MainForm.LoansInfoDebtNacValLoans.Caption:='Сумма задолж. (Н) ' +  FloatToStrF(DebtEq,ffGeneral,8,2); // DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM_EQ').AsString;
  MainForm.LoansInfoDEBTOUTOFDATE.Caption:='Сумма просрочки ' + DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsString;
  MainForm.LoansInfoDEBTOUTOFDATEEQ.Caption:='Сумма просроч. (Н) ' + FloatToStrF(OutDateEq,ffGeneral,8,2);//DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE_EQ').AsString;
  MainForm.LoansInfoPERCENTOUTOFDATE.Caption:='Сумма просрочки % ' + DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsString;
  MainForm.LoansInfoPERCENTOUTOFDATEEQ.Caption:='Сумма просроч. % (Н) ' + FloatToStrF(PercentEq,ffGeneral,8,2);//DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE_EQ').AsString;
  MainForm.LoansInfoCOMMISSIONAMOUNT.Caption:='Сумма комиссии (Н) ' + DMData.qrLoanInfo.FieldByName('COMMISSION_AMOUNT').AsString;
  {Загрузка данных по Должнику}

  {MainForm.LoansInfoFIOLoaner.Caption:='';
  MainForm.LoansInfoINNLoader.Caption:='';
  MainForm.LoansInfoPasNumoader.Caption:='';
  MainForm.LoansInfoPasDat.Caption:='';
  MainForm.LoansInfoAdres1Loader.Caption:='';
  MainForm.LoansInfoAdres2Loader.Caption:='';
  MainForm.LoansInfoFoneLoader.Caption:='';}

  MainForm.EditLoanInfoFam.Text:='';
  MainForm.EditLoanInfoNam.Text:='';
  MainForm.EditLoanInfoOtch.Text:='';
  MainForm.EditLoanInfoInn.Text:='';
  MainForm.EditLoanInfoPSe.Text:='';
  MainForm.EditLoanInfoPNo.Text:='';
  MainForm.EditLoanInfoDat.Text:='';
  MainForm.EditLoanInfoKem.Text:='';
  MainForm.EditLoanInfoAd1.Text:='';
  MainForm.EditLoanInfoAd2.Text:='';
  MainForm.EditLoanInfoTe1.Text:='';
  MainForm.EditLoanInfoTe2.Text:='';

  DMData.qrLoanerInfoByLoans.Active:=False;
  DMData.qrLoanerInfoByLoans.ParamByName('ID_LOANS').Value := DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
  DMData.qrLoanerInfoByLoans.Active:=True;
  DMData.qrLoanerInfoByLoans.First;

  while NOT DMData.qrLoanerInfoByLoans.Eof do begin
    MainLoanInfoMultiLoadDebtor();

   {MainForm.EditLoanInfoFam.Text:=DMData.qrLoanerInfoByLoans.FieldByName('LASTNAME').AsString;
   MainForm.EditLoanInfoNam.Text:=DMData.qrLoanerInfoByLoans.FieldByName('FIRSTNAME').AsString;
   MainForm.EditLoanInfoOtch.Text:=DMData.qrLoanerInfoByLoans.FieldByName('MIDDLENAME').AsString;
   MainForm.EditLoanInfoInn.Text:=DMData.qrLoanerInfoByLoans.FieldByName('INN').AsString;
   MainForm.EditLoanInfoPSe.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTSERIAL').AsString;
   MainForm.EditLoanInfoPNo.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTNUM').AsString;
   MainForm.EditLoanInfoDat.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_DATE').AsString;
   MainForm.EditLoanInfoKem.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_ORG').AsString;
   MainForm.EditLoanInfoAd1.Text:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS1').AsString;
   MainForm.EditLoanInfoAd2.Text:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS2').AsString;
   MainForm.EditLoanInfoTe1.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PHONE1').AsString;
   MainForm.EditLoanInfoTe2.Text:=DMData.qrLoanerInfoByLoans.FieldByName('PHONE2').AsString;
   if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=True then MainForm.CheckBoxLoanInfoIsDebtor.Checked:=True;} {MainForm.LoansInfoPoruchitel.Caption:='Поручитель';}
   {if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=False then MainForm.CheckBoxLoanInfoIsDebtor.Checked:=False;} {MainForm.LoansInfoPoruchitel.Caption:='Должник';}

   {MainForm.LoansInfoFIOLoaner.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('LASTNAME').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('FIRSTNAME').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('MIDDLENAME').AsString;
   MainForm.LoansInfoINNLoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('INN').AsString;
   MainForm.LoansInfoPasNumoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTSERIAL').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTNUM').AsString;
   MainForm.LoansInfoPasDat.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_DATE').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_ORG').AsString;
   MainForm.LoansInfoAdres1Loader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS1').AsString;
   MainForm.LoansInfoAdres2Loader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS2').AsString;
   MainForm.LoansInfoFoneLoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PHONE1').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PHONE2').AsString;
   if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=True then MainForm.LoansInfoPoruchitel.Caption:='Поручитель';
   if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=False then MainForm.LoansInfoPoruchitel.Caption:='Должник';}
   Break;
   DMData.qrLoanerInfoByLoans.Next;
  end;//while EOF
End;

end.
