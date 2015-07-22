unit uCBReport;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, DockTabSet, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons,
  WideStrings, FMTBcd, DB, SqlExpr, uRep311;

type
  TCBReport = class(TObject)
  private
    Fpath: string;
    procedure Setpath(const Value: string);
  public
    property Path: string read FPath write SetPath;
    constructor Create(sPath: string);overload;virtual;
    function LoadPath(): integer;
    function CreatePath(): integer;
  private
     { Private declarations }
end;

implementation

{ CBReport }

constructor TCBReport.Create(sPath: string);
begin
  Self.Path := sPath;
end;

function TCBReport.CreatePath: integer;
begin
  if NOT DirectoryExists(Self.Path) then begin
      if  ForceDirectories(Self.Path) then result := 1 else  result := 0
    end else
    exit;
end;

function TCBReport.LoadPath: integer;
begin

end;

procedure TCBReport.SetPath(const Value: string);
begin
  FPath := Value;
end;

end.
