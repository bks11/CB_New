unit uUtilites;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

function GetUserFromWindows: string;{вытаскивает доменное имя пользователя}

implementation

function GetUserFromWindows: string;
Var
  UserName : string;
  UserNameLen : Dword;
Begin
  UserNameLen := 255;
  SetLength(userName, UserNameLen);
  If GetUserName(PChar(UserName), UserNameLen) Then
    Result := Copy(UserName,1,UserNameLen - 1)
  Else
    Result := 'Unknown';
End;

end.
