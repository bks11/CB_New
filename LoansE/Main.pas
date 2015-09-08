unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj, OleServer, StrUtils, Buttons, ComCtrls;

type
  TfmMain = class(TForm)
    btnLoad: TButton;
    edPath: TEdit;
    btnOpenDialog: TSpeedButton;
    dlgOpen: TOpenDialog;
    memLog: TMemo;
    edServer: TEdit;
    lbServer: TLabel;
    btnConnect: TButton;
    sbInfo: TStatusBar;
    procedure btnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOpenDialogClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
  private
    FiCols: integer;
    FiRows: integer;
    FAppPath: String;
    procedure SetiCols(const Value: integer);
    procedure SetiRows(const Value: integer);
    procedure SetAppPath(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    ExcelData : Variant;
    property iRows : integer read FiRows write SetiRows;
    property iCols : integer read FiCols write SetiCols;
    property AppPath : String read FAppPath write SetAppPath;
    function ReadExcelFile(sFileName : String): Boolean;
    function GenerateLoanQuery(): String;
    function DelimCount(sText : String; ch :Char): integer;
    function FullNameDiv(fullName: String;
                         out lastName: String;
                         out firstName : String;
                         out middleName: String):integer;
    function IfLoanerExist(sINN: String): Boolean;
    function FillLoanInfo(): integer;
  end;

var
  fmMain: TfmMain;

implementation

uses Excel_TLB,Office_TLB, Data;

{$R *.dfm}

procedure TfmMain.btnOpenDialogClick(Sender: TObject);
begin
 if dlgOpen.Execute then begin
    edPath.Text := dlgOpen.FileName;
 end;
end;

procedure TfmMain.btnConnectClick(Sender: TObject);
begin
  dmData.conLoan.Connected := False;
  dmData.conLoan.Params.Clear;
  dmData.conLoan.Params.Add('DriverID=PG');
  dmData.conLoan.Params.Add('Database=CREDIT_DB');
  dmData.conLoan.Params.Add('Server='+ edServer.Text);
  dmData.conLoan.Params.Add('Password=postgres');
  dmData.conLoan.Params.Add('User_Name=postgres');
  dmData.conLoan.Params.Add('Port=5432');
  try
    dmData.conLoan.Connected := True;
    sbInfo.Panels[0].Text := 'ÏÎÄÊËÞ×ÅÍÎ';
  except on E: Exception do
    begin
         ShowMessage(E.Message);
         sbInfo.Panels[0].Text := 'ÍÅÒ ÑÎÅÄÈÍÅÍÈß Ñ ÁÄ';
    end;
  end;
end;

procedure TfmMain.btnLoadClick(Sender: TObject);
var
   s: String;
begin
  s := edPath.Text;
  if ((FileExists(s))AND(dmData.conLoan.Connected)) then begin
     ReadExcelFile(s);
     GenerateLoanQuery();
     FillLoanInfo();
     sbInfo.Panels[1].Text := 'ÇÀÃÐÓÇÊÀ ÇÀÂÅÐØÅÍÀ';
  end;
end;

function TfmMain.DelimCount(sText: String; ch: Char): integer;
var
   i :  integer;
begin
   Result := 0;
   for i := Length(sText) downto 1 do
       if AnsiLowerCase (sText[i]) = AnsiLowerCase (Ch) then Inc (Result);
end;

function TfmMain.FillLoanInfo: integer;
var
   sINN       : String;
   sAgreemN   : String;
   iID_LOAN   : integer;
   iID_LOANER : integer;
   sNote      : String;
   i          : integer;
begin
  i := 0;
  dmData.qrLoans.Active := False;
  try
    dmData.qrLoans.Open();
    dmData.qrLoans.First;
    while NOT dmData.qrLoans.Eof do begin
      sINN := dmData.qrLoans.FieldByName('INN').AsString;
      iID_LOAN := dmData.qrLoans.FieldByName('ID_LOAN').AsInteger;
      sAgreemN := dmData.qrLoans.FieldByName('AGREEMENT_NUM').AsString;

      dmData.qrSearchLoaner.Active := False;
      dmData.qrSearchLoaner.ParamByName('INN').Value := sINN;
      dmData.qrSearchLoaner.Open();

      iID_LOANER := dmData.qrSearchLoaner.FieldByName('ID_LOANER').AsInteger;
      sNote := dmData.qrLoans.FieldByName('INN').AsString +' ; '+
               dmData.qrSearchLoaner.FieldByName('FULL_NAME').AsString;

      if iID_LOANER > 0 then  begin
         dmData.qrInsertLoanInfo.ParamByName('ID_LOANER').Value := iID_LOANER;
         dmData.qrInsertLoanInfo.ParamByName('ID_LOAN').Value := iID_LOAN;
         dmData.qrInsertLoanInfo.ParamByName('NOTE').Value := sNote;
         dmData.qrInsertLoanInfo.ExecSQL();
         memLog.Lines.Add('ÑÂßÇÜ ÊÐÅÄÈÒÀ '+ sAgreemN + ' Ñ ÄÎËÆÍÈÊÎÌ '+ sNote);
         Inc(i);
      end;
      dmData.qrLoans.Next;
    end;//while
  except on E: Exception do
    ShowMessage(E.Message);
  end;
  Result := i;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
   ExcelData := null;
   AppPath := ParamStr(0);
end;

function TfmMain.FullNameDiv(fullName: String; out lastName, firstName,
  middleName: String): integer;
var
   i : integer;
   j : integer;
begin
  if DelimCount(fullName, Char(' ')) > 2 then begin
     lastName := fullName;
     firstName := '';
     middleName := '';
     Exit;
  end;
  if DelimCount(fullName, Char(' ')) < 2 then begin
     lastName := fullName;
     firstName := '';
     middleName := '';
     Exit;
  end;
  if DelimCount(fullName, Char(' ')) = 2 then begin
     i := Pos(' ',fullName);
     j:= PosEx(' ',fullName, i+1);
     lastName := Trim(Copy(fullName,1,i));
     firstName := Trim(Copy(fullName,i,j-i));
     middleName := Trim(Copy(fullName,j,500));
  end;
end;

function TfmMain.GenerateLoanQuery(): String;
var
   //LOAN SECTION
   AGREEMENT_NUM                      : string;         //2  (B)
   ISSUE_DATE                         : TDateTime;      //9  (I)
   LOAN_SUMM                          : real;           //10 (J)
   LOAN_CURRENCY                      : string;         //11 (K)
   END_DATE                           : TDateTime;      //12 (L)
   TOTAL_CREDIT_SUMM                  : real;           //13 (M)
   TOTAL_CREDIT_SUMM_EQ               : real;           //14 (N)
   DEBT_OUT_OF_DATE                   : real;           //15 (0)
   DEBT_OUT_OF_DATE_EQ                : real;           //16 (P)
   PERCENT_OUT_OF_DATE                : real;           //17 (Q)
   PERCENT_OUT_OF_DATE_EQ             : real;           //18 (R)
   COMMISSION_AMOUNT                  : real;           //19 (S)
   FIRST_CREDITOR                     : string;         //20 (T)

   NEW_LOAN_ID                        : integer;

   //LOANER SECTION
   FULL_NAME                          : String;
   FULL_PASSPORT                      : String;
   FIRSTNAME                          : String;
   LASTNAME                           : String;
   MIDDLENAME                         : String;
   INN                                : String;
   PASSPORTSERIAL                     : String;
   PASSPORTNUM                        : String;
   PASSPORT_ISSUE_DATE                : TDateTime;
   PASSPORT_ISSUE_ORG                 : String;
   ADDRESS1                           : String;

   NEW_LOANER_ID                      : integer;

   //BIND LOAN AND LOANER


   //log section
   numLoan : String;
   fLog : TextFile;

   iRow : integer;
   //iCol : integer;

begin
   AssignFile(fLog,ExtractFilePath(AppPath)+'\LoanInsert.log');
   Rewrite(fLog);
   for iRow := 3 to VarArrayHighBound(ExcelData,1)  do begin
     try
       AGREEMENT_NUM           := ExcelData[iRow,2];                   //2  (B)
       ISSUE_DATE              := ExcelData[iRow,9];                   //9  (I)
       LOAN_SUMM               := ExcelData[iRow,10];                  //10 (J)
       LOAN_CURRENCY           := ExcelData[iRow,11];                  //11 (K)
       END_DATE                := ExcelData[iRow,12];                  //12 (L)
       TOTAL_CREDIT_SUMM       := ExcelData[iRow,13];                  //13 (M)
       TOTAL_CREDIT_SUMM_EQ    := ExcelData[iRow,14];                  //14 (N)
       DEBT_OUT_OF_DATE        := ExcelData[iRow,15];                  //15 (0)
       DEBT_OUT_OF_DATE_EQ     := ExcelData[iRow,16];                  //16 (P)
       PERCENT_OUT_OF_DATE     := ExcelData[iRow,17];                  //17 (Q)
       PERCENT_OUT_OF_DATE_EQ  := ExcelData[iRow,18];                  //18 (R)
       COMMISSION_AMOUNT       := ExcelData[iRow,19];                  //19 (S)
       FIRST_CREDITOR          := ExcelData[iRow,20];                  //20 (T)
       //LOANER SECTION
       FULL_NAME               := ExcelData[iRow,4];
       INN                     := ExcelData[iRow,5];
       FULL_PASSPORT           := ExcelData[iRow,6];
       PASSPORT_ISSUE_ORG      := ExcelData[iRow,7];
       PASSPORT_ISSUE_DATE     := ExcelData[iRow,8];
       ADDRESS1                := ExcelData[iRow,21];

       FullNameDiv(FULL_NAME,LASTNAME,FIRSTNAME,MIDDLENAME);
       //ShowMessage(LASTNAME +' '+FIRSTNAME+' '+MIDDLENAME);

       numLoan                 := ExcelData[iRow,1];

       with dmData do begin
          qrInsertLoan.Close;
          qrInsertLoan.ParamByName('AGREEMENT_NUM').Value          := AGREEMENT_NUM;
          qrInsertLoan.ParamByName('ISSUE_DATE').Value             := ISSUE_DATE;
          qrInsertLoan.ParamByName('LOAN_SUMM').Value              := LOAN_SUMM;
          qrInsertLoan.ParamByName('LOAN_CURRENCY').Value          := LOAN_CURRENCY;
          qrInsertLoan.ParamByName('END_DATE').Value               := END_DATE;
          qrInsertLoan.ParamByName('TOTAL_CREDIT_SUMM').Value      := TOTAL_CREDIT_SUMM;
          qrInsertLoan.ParamByName('TOTAL_CREDIT_SUMM_EQ').Value   := TOTAL_CREDIT_SUMM_EQ;
          qrInsertLoan.ParamByName('DEBT_OUT_OF_DATE').Value       := DEBT_OUT_OF_DATE;
          qrInsertLoan.ParamByName('DEBT_OUT_OF_DATE_EQ').Value    := DEBT_OUT_OF_DATE_EQ;
          qrInsertLoan.ParamByName('PERCENT_OUT_OF_DATE').Value    := PERCENT_OUT_OF_DATE;
          qrInsertLoan.ParamByName('PERCENT_OUT_OF_DATE_EQ').Value := PERCENT_OUT_OF_DATE_EQ;
          qrInsertLoan.ParamByName('COMMISSION_AMOUNT').Value      := COMMISSION_AMOUNT;
          qrInsertLoan.ParamByName('FIRST_CREDITOR').Value         := FIRST_CREDITOR;
          qrInsertLoan.ParamByName('INN').Value                    := INN;
          try
             qrInsertLoan.Open;
             NEW_LOAN_ID := qrInsertLoan.FieldByName('ID_LOAN').AsInteger;
             memLog.Lines.Add('Â "TLOAN" äîáàâëåí êðåäèò ïî äîãîâîðó - '+AGREEMENT_NUM);
          except on E: Exception do
             begin
                Writeln(fLog,'INSERT LOAN - '+numLoan +' - '+FULL_NAME+' - '+INN+' - '+AGREEMENT_NUM);
             end;
          end;//try
          qrInsertLoaner.Close();
          qrInsertLoaner.ParamByName('FIRSTNAME').Value := FIRSTNAME;
          qrInsertLoaner.ParamByName('LASTNAME').Value := LASTNAME;
          qrInsertLoaner.ParamByName('MIDDLENAME').Value := MIDDLENAME;
          qrInsertLoaner.ParamByName('INN').Value := INN;
          qrInsertLoaner.ParamByName('PASSPORT_ISSUE_DATE').Value := PASSPORT_ISSUE_DATE;
          qrInsertLoaner.ParamByName('PASSPORT_ISSUE_ORG').Value := PASSPORT_ISSUE_ORG;
          qrInsertLoaner.ParamByName('ADDRESS1').Value := ADDRESS1;
          qrInsertLoaner.ParamByName('FULL_NAME').Value := FULL_NAME;
          qrInsertLoaner.ParamByName('FULL_PASSPORT').Value := FULL_PASSPORT;

          try
            if NOT IfLoanerExist(INN) then begin
               qrInsertLoaner.Open();
               NEW_LOANER_ID :=   qrInsertLoaner.FieldByName('ID_LOANER').AsInteger;
               memLog.Lines.Add('Â "TLOANER" äîáàâëåíà çàïèñü î - '+ FULL_NAME +' ; '+ INN);
            end;
          except on E: Exception do
             begin
                Writeln(fLog,'INSERT LOANER - '+numLoan +' - '+FULL_NAME+' - '+INN+' - '+AGREEMENT_NUM);
             end;
          end;//try
          {
          qrInsertLoanInfo.ParamByName('ID_LOANER').Value := NEW_LOANER_ID;
          qrInsertLoanInfo.ParamByName('ID_LOAN').Value := NEW_LOAN_ID;
          try
             qrInsertLoanInfo.ExecSQL();
          except on E: Exception do
             begin
                Writeln(fLog,'INSERT LOANINFO - '+numLoan +' - '+FULL_NAME+' - '+INN+' - '+AGREEMENT_NUM);
             end;
          end;
          }
        end;//with
     except on E:Exception do
       begin
         memLog.Lines.Add('ÎØÈÁÊÀ ÄÎÁÀÂËÅÍÈß ÈÍÔ. Î - '+numLoan +' - '+FULL_NAME+' - '+INN+' - '+AGREEMENT_NUM);
         Writeln(fLog,'TYPE CONVERT - '+numLoan +' - '+FULL_NAME+' - '+INN+' - '+AGREEMENT_NUM);
       end;
     end;//try
   end;
   CloseFile(fLog);
end;

function TfmMain.IfLoanerExist(sINN: String): Boolean;
begin
  Result := False;
  dmData.qrSearchLoaner.Active := False;
  dmData.qrSearchLoaner.ParamByName('INN').Value := sINN;
  try
     dmData.qrSearchLoaner.Open();
     if NOT dmData.qrSearchLoaner.Eof then Result := True;
  except on E: Exception do
     ShowMessage(E.Message);
  end;
end;

function TfmMain.ReadExcelFile(sFileName: String): boolean;
var
   vExcelApp    : OleVariant;
   vWorkSheet    : OleVariant;
begin
   try
      vExcelApp := CreateOleObject('Excel.Application');
      vExcelApp.WorkBooks.Open(sFileName,0,True);
      vWorkSheet := vExcelApp.ActiveWorkBook.ActiveSheet;
      iRows := vWorkSheet.UsedRange.Rows.Count;
      iCols := vWorkSheet.UsedRange.Columns.Count;

      ExcelData  := vWorkSheet.UsedRange.Value;

   finally
      vExcelApp.Quit;
   end;
   memLog.Lines.Add('Ôàéë : '+ sFileName);
   memLog.Lines.Add('Ñ÷èòàíî : '+ IntToStr(iRows));
   //ShowMessage(IntToStr(VarArrayHighBound(ExcelData,1)));
end;


procedure TfmMain.SetAppPath(const Value: String);
begin
  FAppPath := Value;
end;

procedure TfmMain.SetiCols(const Value: integer);
begin
  FiCols := Value;
end;

procedure TfmMain.SetiRows(const Value: integer);
begin
  FiRows := Value;
end;

end.

