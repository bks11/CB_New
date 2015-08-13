unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfmLogin = class(TForm)
    lbUserPassword: TLabel;
    lbUserName: TLabel;
    StatusBar1: TStatusBar;
    edUserLogin: TEdit;
    edUserPassword: TEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;

implementation

{$R *.dfm}

end.
