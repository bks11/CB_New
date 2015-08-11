unit Unit4;

interface

Uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBTables, Grids, DBGrids, ADODB, Mask,
  DBCtrls;

type

 TArj = Object
  Comand:String;
  public
    { Private declarations }
   Function RunArj:Boolean;{Исполняется команда}
 End;

implementation

function TArj.RunArj:Boolean;
var
	StartupInfo : TStartupInfo;
	ProcessInfo : TProcessInformation;
	dwExitCode : DWord;
begin
 FillChar(StartupInfo, SizeOf(StartupInfo), 0);
 StartupInfo.cb := SizeOf(StartupInfo);
 StartupInfo.wShowWindow := SW_HIDE;
 StartupInfo.dwFlags := STARTF_USESHOWWINDOW	;
 dwExitCode := 0;
 try
 	Result := Win32Check(CreateProcess(nil, PChar(Comand), nil, nil, True,
 	CREATE_NEW_CONSOLE, nil, nil,	StartupInfo, ProcessInfo));
 except
 	on E :Exception do
 	begin
	 Result := False;
	end;
 end;
 if Result then
 begin
	while WaitForSingleObject(ProcessInfo.hProcess, 100) = WAIT_TIMEOUT do
	 Application.ProcessMessages;
	 GetExitCodeProcess(ProcessInfo.hProcess, dwExitCode);
	 if dwExitCode <> 0 then
	 begin
		Result := False;
	 end;
	 CloseHandle(ProcessInfo.hProcess);
	 CloseHandle(ProcessInfo.hThread);
  end;
 end;
end.
 