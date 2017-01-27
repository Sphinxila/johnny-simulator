unit guido_ramline;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls;

type

  { Tfrm_ramline }

  Tfrm_ramline = class(TForm)
    bb_Delete: TBitBtn;
    bb_Write: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    cb_makro: TComboBox;
    ed_hi: TEdit;
    ed_lo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lb_Address: TLabel;
    sb_no_0: TSpeedButton;
    sb_no_2: TSpeedButton;
    sb_no_3: TSpeedButton;
    sb_no_4: TSpeedButton;
    sb_no_5: TSpeedButton;
    sb_no_6: TSpeedButton;
    sb_no_7: TSpeedButton;
    sb_no_8: TSpeedButton;
    sb_no_9: TSpeedButton;
    Shape1: TShape;
    sb_no_1: TSpeedButton;
    sb_Backsp: TSpeedButton;
    Timer1: TTimer;


    procedure bb_WriteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cb_makroChange(Sender: TObject);
    procedure ed_hiEnter(Sender: TObject);
    procedure ed_loChange(Sender: TObject);
    procedure ed_loDblClick(Sender: TObject);
    procedure ed_loEnter(Sender: TObject);
    procedure ed_loKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure pb_DeleteClick(Sender: TObject);
    procedure pb_writeClick(Sender: TObject);
    procedure sb_no_1Click(Sender: TObject);
    procedure sb_BackspClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { private declarations }
  public
    resultat : integer;
    befehlsnummer : integer;
  end;

var
  frm_ramline: Tfrm_ramline;

implementation
uses guido_main;

{ Tfrm_ramline }



procedure Tfrm_ramline.cb_makroChange(Sender: TObject);
begin
  ed_hi.text:=format('%2.2d',[cb_makro.ItemIndex]);
  //  lb_Mnemonic.caption:='( '+mc_names[cb_makro.ItemIndex]+' )';
end;

procedure Tfrm_ramline.ed_hiEnter(Sender: TObject);
begin
end;

procedure Tfrm_ramline.ed_loChange(Sender: TObject);
begin

end;

procedure Tfrm_ramline.ed_loDblClick(Sender: TObject);
begin
  ed_lo.Text:='';
end;

procedure Tfrm_ramline.ed_loEnter(Sender: TObject);
begin
ed_lo.SelStart:=1;
ed_lo.SetFocus;
end;

procedure Tfrm_ramline.bb_WriteClick(Sender: TObject);
begin

end;

procedure Tfrm_ramline.BitBtn1Click(Sender: TObject);
begin
  resultat:=mrCancel;
end;

procedure Tfrm_ramline.ed_loKeyPress(Sender: TObject; var Key: char);
begin
  if (ord(Key)=13) then pb_writeClick(Sender);
end;

procedure Tfrm_ramline.FormCreate(Sender: TObject);
var i : integer;
begin
  frm_ramline.cb_makro.Items.Clear;
  for i:=0 to 19 do
     frm_ramline.cb_makro.Items.Add(format('%2.2d:',[i])+mc_names[i]);
  resultat:=mrCancel;
end;

procedure Tfrm_ramline.FormShow(Sender: TObject);
var i: integer;
begin
  frm_ramline.cb_makro.Items.Clear;
  for i:=0 to 19 do
     frm_ramline.cb_makro.Items.Add(format('%2.2d:',[i])+mc_names[i]);
  frm_ramline.cb_makro.text:=cb_makro.Items[befehlsnummer];
end;

procedure Tfrm_ramline.Label1Click(Sender: TObject);
begin

end;

procedure Tfrm_ramline.pb_DeleteClick(Sender: TObject);
begin
   ed_hi.text:='00';
   ed_lo.text:='000';
   resultat:=mrOK;
end;

procedure Tfrm_ramline.pb_writeClick(Sender: TObject);
begin
  resultat:=mrOK;
  frm_ramline.Close;
end;

procedure Tfrm_ramline.sb_no_1Click(Sender: TObject);
var key : string;
begin
  key:=IntToStr((Sender As TSpeedbutton).Tag);
  if ed_lo.Focused then ed_lo.Text:=ed_lo.Text+key;
  if ed_hi.Focused then ed_hi.Text:=ed_hi.Text+key;
end;

procedure Tfrm_ramline.sb_BackspClick(Sender: TObject);
begin
  if ed_lo.Focused then ed_lo.Text:=copy(ed_lo.Text,1,length(ed_lo.Text)-1);
  if ed_hi.Focused then ed_hi.Text:=copy(ed_hi.Text,1,length(ed_hi.Text)-1);
end;

procedure Tfrm_ramline.Timer1Timer(Sender: TObject);
begin
  ed_lo.SelStart:=length(ed_lo.Text);
  ed_hi.SelStart:=length(ed_hi.Text);

end;



initialization
  {$I guido_ramline.lrs}

end.

