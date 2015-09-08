unit MainPortfelInfo;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, DBCtrls, DataModule, ComCtrls, Mask;

type
  TMainPortfelInfo = class(TObject)
  public

    Procedure MainLoanPortfelLoadData; {Загрузка данных по кредиту}
end;


implementation

Uses
 Main;

Procedure TMainPortfelInfo.MainLoanPortfelLoadData;
{Загрузка данных}
Var
 SummRUR:Real; {643}
 SummUSD:Real; {840}
 SummEUR:Real; {978}
 SummUAH:Real; {980}
 SummZRUR:Real; {643}
 SummZUSD:Real; {840}
 SummZEUR:Real; {978}
 SummZUAH:Real; {980}
 SummTRUR:Real; {643}
 SummTUSD:Real; {840}
 SummTEUR:Real; {978}
 SummTUAH:Real; {980}
 SummPRUR:Real; {643}
 SummPUSD:Real; {840}
 SummPEUR:Real; {978}
 SummPUAH:Real; {980}

 EqvLoan : Real;
 EqvZad  : Real;
 EqvProsroch : Real;
 EqvPercent : Real;

Begin
  SummRUR:=0; {643}
  SummUSD:=0; {840}
  SummEUR:=0; {978}
  SummUAH:=0; {980}
  SummZRUR:=0; {643}
  SummZUSD:=0; {840}
  SummZEUR:=0; {978}
  SummZUAH:=0; {980}
  SummTRUR:=0; {643}
  SummTUSD:=0; {840}
  SummTEUR:=0; {978}
  SummTUAH:=0; {980}
  SummPRUR:=0; {643}
  SummPUSD:=0; {840}
  SummPEUR:=0; {978}
  SummPUAH:=0; {980}

  DMData.qrLoanInfo.First;
  while NOT DMData.qrLoanInfo.Eof do begin
   if DMData.qrLoanInfo.FieldByName('LOAN_CURRENCY').AsInteger=643  then
   Begin
    SummRUR  := SummRUR  + DMData.qrLoanInfo.FieldByName('LOAN_SUMM').AsFloat;
    SummZRUR := SummZRUR + DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsFloat;
    SummTRUR := SummTRUR + DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsFloat;
    SummPRUR := SummPRUR + DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsFloat;
   End;
   if DMData.qrLoanInfo.FieldByName('LOAN_CURRENCY').AsInteger=840  then
   Begin
    SummUSD  := SummUSD  + DMData.qrLoanInfo.FieldByName('LOAN_SUMM').AsFloat;
    SummZUSD := SummZUSD + DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsFloat;
    SummTUSD := SummTUSD + DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsFloat;
    SummPUSD := SummPUSD + DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsFloat;
   End;
   if DMData.qrLoanInfo.FieldByName('LOAN_CURRENCY').AsInteger=978  then
   Begin
    SummEUR  := SummEUR  + DMData.qrLoanInfo.FieldByName('LOAN_SUMM').AsFloat;
    SummZEUR := SummZEUR + DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsFloat;
    SummTEUR := SummTEUR + DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsFloat;
    SummPEUR := SummPEUR + DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsFloat;
   End;
   if DMData.qrLoanInfo.FieldByName('LOAN_CURRENCY').AsInteger=980  then
   Begin
    SummUAH  := SummUAH  + DMData.qrLoanInfo.FieldByName('LOAN_SUMM').AsFloat;
    SummZUAH := SummZUAH + DMData.qrLoanInfo.FieldByName('TOTAL_CREDIT_SUMM').AsFloat;
    SummTUAH := SummTUAH + DMData.qrLoanInfo.FieldByName('DEBT_OUT_OF_DATE').AsFloat;
    SummPUAH := SummPUAH + DMData.qrLoanInfo.FieldByName('PERCENT_OUT_OF_DATE').AsFloat;
   End;
   MainForm.MainLoansList.DataSource.DataSet.Next;
  end;//while

  DMData.qrLoanInfo.First;

  //Расчет эквивалента

  EqvLoan := SummRUR + SummUSD*MainForm.USDRate + SummEUR*MainForm.EURRate + SummUAH*MainForm.UAHRate;
  EqvZad  := SummZRUR + SummZUSD*MainForm.USDRate + SummZEUR*MainForm.EURRate + SummZUAH*MainForm.UAHRate;
  EqvProsroch := SummTRUR + SummTUSD*MainForm.USDRate + SummTEUR*MainForm.EURRate + SummTUAH*MainForm.UAHRate;
  EqvPercent :=  SummPRUR + SummPUSD*MainForm.USDRate + SummPEUR*MainForm.EURRate + SummPUAH*MainForm.UAHRate;


  MainForm.MainInfoPortfelSumRUR.Caption:='В RUR - ' + FloatToStrF(SummRUR,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumUSD.Caption:='В USD - ' + FloatToStrF(SummUSD,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumEUR.Caption:='В EUR - ' + FloatToStrF(SummEUR,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumUAH.Caption:='В UAH - ' + FloatToStrF(SummUAH,ffGeneral,12,2);
  MainForm.MainInfoSumLoansEcv.Caption := 'ЭКВ. - '+ FloatToStrF(EqvLoan,ffGeneral,12,2);


  MainForm.MainInfoPortfelSumZRUR.Caption:='В RUR - ' + FloatToStrF(SummZRUR,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumZUSD.Caption:='В USD - ' + FloatToStrF(SummZUSD,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumZEUR.Caption:='В EUR - ' + FloatToStrF(SummZEUR,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumZUAH.Caption:='В UAH - ' + FloatToStrF(SummZUAH,ffGeneral,12,2);
  MainForm.MainInfoSumZadEcv.Caption := 'ЭКВ. - '+ FloatToStrF(EqvZad,ffGeneral,12,2);

  MainForm.MainInfoPortfelSumTRUR.Caption:='В RUR - ' + FloatToStrF(SummTRUR,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumTUSD.Caption:='В USD - ' + FloatToStrF(SummTUSD,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumTEUR.Caption:='В EUR - ' + FloatToStrF(SummTEUR,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumTUAH.Caption:='В UAH - ' + FloatToStrF(SummTUAH,ffGeneral,12,2);
  MainForm.MainInfoSumprosEcv.Caption := 'ЭКВ. - '+ FloatToStrF(EqvProsroch,ffGeneral,12,2);

  MainForm.MainInfoPortfelSumPRUR.Caption:='В RUR - ' + FloatToStrF(SummPRUR,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumPUSD.Caption:='В USD - ' + FloatToStrF(SummPUSD,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumPEUR.Caption:='В EUR - ' + FloatToStrF(SummPEUR,ffGeneral,12,2);
  MainForm.MainInfoPortfelSumPUAH.Caption:='В UAH - ' + FloatToStrF(SummPUAH,ffGeneral,12,2);
  MainForm.MainInfoSumProcEcv.Caption := 'ЭКВ. - '+ FloatToStrF(EqvPercent,ffGeneral,12,2);


End;


end.
