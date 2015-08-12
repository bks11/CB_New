unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data, StdCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    DBListBox1: TDBListBox;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

Procedure ddr;
Begin
  {DMData.QueryAny.SQL.Clear;
  DMData.QueryAny.SQL.Add('Select "AGREEMENT_NUM" from "TLOAN"');}
  {DMData.QueryAny.Active:=True;}
End;

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
 DMData.QueryAny.Active:=true;
 DMData.DataSource1.Enabled:=true;
end;

end.
