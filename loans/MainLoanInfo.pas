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
    Procedure MainLoanInfoMultiLoadDebtor; {Загрузка данных по разным поручителям}
end;

implementation

Uses
 Main;

{ TMainLoanInfo }

Procedure TMainLoanInfo.MainLoanInfoMultiLoadDebtor();
Begin
 MainForm.LoansInfoFIOLoaner.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('FIRSTNAME').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('LASTNAME').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('MIDDLENAME').AsString;
 MainForm.LoansInfoINNLoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('INN').AsString;
 MainForm.LoansInfoPasNumoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTSERIAL').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTNUM').AsString;
 MainForm.LoansInfoPasDat.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_DATE').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_ORG').AsString;
 MainForm.LoansInfoAdres1Loader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS1').AsString;
 MainForm.LoansInfoAdres2Loader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS2').AsString;
 MainForm.LoansInfoFoneLoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PHONE1').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PHONE2').AsString;
 if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=True then MainForm.LoansInfoPoruchitel.Caption:='Поручитель';
 if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=False then MainForm.LoansInfoPoruchitel.Caption:='Должник';
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

Begin
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
  MainForm.LoansInfoDebtNacValLoans.Caption:='Сумма задолженности (Н) ' +  FloatToStrF(DebtEq,ffGeneral,8,2); // DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM_EQ').AsString;
  MainForm.LoansInfoDEBTOUTOFDATE.Caption:='Сумма просрочки ' + DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsString;
  MainForm.LoansInfoDEBTOUTOFDATEEQ.Caption:='Сумма просрочки (Н) ' + FloatToStrF(OutDateEq,ffGeneral,8,2);//DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE_EQ').AsString;
  MainForm.LoansInfoPERCENTOUTOFDATE.Caption:='Сумма просрочки % ' + DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsString;
  MainForm.LoansInfoPERCENTOUTOFDATEEQ.Caption:='Сумма просрочки % (Н) ' + FloatToStrF(PercentEq,ffGeneral,8,2);//DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE_EQ').AsString;
  MainForm.LoansInfoCOMMISSIONAMOUNT.Caption:='Сумма комиссии (Н) ' + DMData.qrLoanInfo.FieldByName('COMMISSION_AMOUNT').AsString;
  {Загрузка данных по Должнику}

  MainForm.LoansInfoFIOLoaner.Caption:='';
  MainForm.LoansInfoINNLoader.Caption:='';
  MainForm.LoansInfoPasNumoader.Caption:='';
  MainForm.LoansInfoPasDat.Caption:='';
  MainForm.LoansInfoAdres1Loader.Caption:='';
  MainForm.LoansInfoAdres2Loader.Caption:='';
  MainForm.LoansInfoFoneLoader.Caption:='';

  DMData.qrLoanerInfoByLoans.Active:=False;
  DMData.qrLoanerInfoByLoans.ParamByName('ID_LOANS').Value := DMData.qrLoanInfo.FieldByName('ID_LOAN').AsInteger;
  DMData.qrLoanerInfoByLoans.Active:=True;
  DMData.qrLoanerInfoByLoans.First;

  while NOT DMData.qrLoanerInfoByLoans.Eof do begin
   MainForm.LoansInfoFIOLoaner.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('FIRSTNAME').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('LASTNAME').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('MIDDLENAME').AsString;
   MainForm.LoansInfoINNLoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('INN').AsString;
   MainForm.LoansInfoPasNumoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTSERIAL').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PASSPORTNUM').AsString;
   MainForm.LoansInfoPasDat.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_DATE').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PASSPORT_ISSUE_ORG').AsString;
   MainForm.LoansInfoAdres1Loader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS1').AsString;
   MainForm.LoansInfoAdres2Loader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('ADDRESS2').AsString;
   MainForm.LoansInfoFoneLoader.Caption:=DMData.qrLoanerInfoByLoans.FieldByName('PHONE1').AsString+' '+DMData.qrLoanerInfoByLoans.FieldByName('PHONE2').AsString;
   if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=True then MainForm.LoansInfoPoruchitel.Caption:='Поручитель';
 if DMData.qrLoanerInfoByLoans.FieldByName('IS_GUARANTOR').AsBoolean=False then MainForm.LoansInfoPoruchitel.Caption:='Должник';
   Break;
   DMData.qrLoanerInfoByLoans.Next;
  end;//while EOF
End;

end.
