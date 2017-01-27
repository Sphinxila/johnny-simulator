unit guido_options;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type

  { Tfrm_options }

  Tfrm_options = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lb_attention1: TLabel;
    lb_attention2: TLabel;
    rg_inst_set: TRadioGroup;
    procedure lb_attention1Click(Sender: TObject);
    procedure rg_inst_setClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frm_options: Tfrm_options;

implementation

{ Tfrm_options }

procedure Tfrm_options.rg_inst_setClick(Sender: TObject);
begin

end;

procedure Tfrm_options.lb_attention1Click(Sender: TObject);
begin

end;

initialization
  {$I guido_options.lrs}

end.

