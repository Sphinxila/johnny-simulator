unit guido_splash; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs; 

type
  Tfrm_splash = class(TForm)
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frm_splash: Tfrm_splash;

implementation

initialization
  {$I guido_splash.lrs}

end.

