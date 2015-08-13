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
end;

implementation

Uses
 Main;

{ TMainLoanInfo }

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

Procedure TMainLoanInfo.MainLoanInfoLoadData;
{Загрузка данных}
Begin
  {Загрузка данных по кредиту}
  MainForm.LoansInfoDateLoans.Caption:='Дата выдачи '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('ISSUE_DATE').AsString;
  MainForm.LoansInfoSumValLoans.Caption:='Сумма '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('LOAN_SUMM').AsString;
  MainForm.LoansInfoValLoans.Caption:='Валюта '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('LOAN_CURRENCY').AsString;
  MainForm.LoansInfoDateEndLoans.Caption:='Дата окончания '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('END_DATE').AsString;
  MainForm.LoansInfoDebtLoans.Caption:='Сумма задолженности '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('TOTAL_CREDIT_SUMM').AsString;
  MainForm.LoansInfoDebtNacValLoans.Caption:='Сумма задолженности (Н) '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('TOTAL_CREDIT_SUMM_EQ').AsString;
  MainForm.LoansInfoDEBTOUTOFDATE.Caption:='Сумма просрочки '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('DEBT_OUT_OF_DATE').AsString;
  MainForm.LoansInfoDEBTOUTOFDATEEQ.Caption:='Сумма просрочки (Н) '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('DEBT_OUT_OF_DATE_EQ').AsString;
  MainForm.LoansInfoPERCENTOUTOFDATE.Caption:='Сумма просрочки % '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('PERCENT_OUT_OF_DATE').AsString;
  MainForm.LoansInfoPERCENTOUTOFDATEEQ.Caption:='Сумма просрочки % (Н) '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('PERCENT_OUT_OF_DATE_EQ').AsString;
  MainForm.LoansInfoCOMMISSIONAMOUNT.Caption:='Сумма комиссии (Н) '+MainForm.MainLoansList.DataSource.DataSet.FieldByName('COMMISSION_AMOUNT').AsString;
  {Загрузка данных по Должнику}

  MainForm.LoansInfoFIOLoaner.Caption:='';
  MainForm.LoansInfoINNLoader.Caption:='';
  MainForm.LoansInfoPasNumoader.Caption:='';
  MainForm.LoansInfoPasDat.Caption:='';
  MainForm.LoansInfoAdres1Loader.Caption:='';
  MainForm.LoansInfoAdres2Loader.Caption:='';
  MainForm.LoansInfoFoneLoader.Caption:='';

  DMData.qrLoanerInfoByLoans.Active:=False;
  DMData.qrLoanerInfoByLoans.Params.ParamValues['ID_LOANS']:=MainForm.MainLoansList.DataSource.DataSet.FieldByName('ID_LOAN').AsString;
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
   DMData.qrLoanerInfoByLoans.Next;
  end;//while EOF
End;

end.
