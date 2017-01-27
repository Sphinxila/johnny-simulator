program johnny;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms
  { you can add units after this }, guido_main, guido_ramline,
  guido_options;

{$IFDEF WINDOWS}{$R guido.rc}{$ENDIF}

begin
  Application.Title:='Johnny 1.00';
  Application.Initialize;
  Application.CreateForm(Tfrm_gmain, frm_gmain);
  Application.CreateForm(Tfrm_ramline, frm_ramline);
  Application.CreateForm(Tfrm_options, frm_options);
  Application.Run;
end.

