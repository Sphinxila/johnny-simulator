unit guido_main;

{$mode objfpc}{$H+}

{
// =========================================================================
Johnny: by Peter Dauscher, Gymnasium am Kaiserdom, Speyer
Version 1.01  (27.04.2014)
Codename: GUIDO


The Program can be compiled by Lazarus/Freepascal for Windows
Version 1.0.4 (2012-11-30)
FPC: 2.6.0

The Program is licensed under the GNU GPLv3.

// =========================================================================

WARNING:
========
Originally this code has not been designed to be published in an Open Source
Project. It probably contains a lot of passages that are hard to understand and
the code does certainly not fulfill the requirements of thorough
software engineering.
Some identifiers and comments are expressed German. Sorry for this ;-).

Due to the GNU GPL, you are allowed to modify the code, e.g. in order to
enhance functionality or to eliminate bugs. However, I would be thankful
if you would let me know, if you have found bugs or have suggestions
to make the program better.

peter.dauscher@gmail.com

// =========================================================================

}



interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Menus, ExtCtrls, Grids, Buttons,

  guido_ramline, guido_splash, guido_options,Spin;

type

  { Tfrm_gmain }

  Tfrm_gmain = class(TForm)
    bb_LoadRAM: TBitBtn;
    bb_LOAD_MPM: TBitBtn;
    bb_Makro: TBitBtn;
    bb_SAVE_MPM: TBitBtn;
    bb_Options: TBitBtn;
    Image2: TImage;
    lb_Bonsai_Mode: TLabel;
    mi_insert: TMenuItem;
    mi_delete: TMenuItem;
    pb_ACC_FDB: TButton;
    pb_stopp: TButton;
    pb_saveram_bon: TBitBtn;
    pb_New: TBitBtn;
    pb_macro_pause: TBitBtn;
    pb_macro_run: TBitBtn;
    pb_macro_reset: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    ed_Name: TEdit;
    gb_macrocode: TGroupBox;
    gb_microcode: TGroupBox;
    lb_Address: TLabel;
    lb_Address1: TLabel;
    od_openram: TOpenDialog;
    od_openmpm: TOpenDialog;
    im_stop: TImage;
    lb_MPC_Name: TLabel;
    Panel1: TPanel;
    pb_ACC_INC: TButton;
    pb_ACC_DEC: TButton;
    pb_macro_step: TBitBtn;
    pb_microstep: TBitBtn;
    pb_saveram: TBitBtn;
    pn_hide_ctrl: TPanel;
    pb_PC_FIN: TButton;
    ed_DB: TEdit;
    ed_AB: TEdit;
    lb_ACC_AC: TLabel;
    lb_MPC_MC: TLabel;
    lb_MPC_OP: TLabel;
    lb_PC_CT: TLabel;
    lb_INS_AD: TLabel;
    lb_INS_OP: TLabel;
    lb_DB: TLabel;
    lb_AB: TLabel;
    lb_RAM_D: TLabel;
    lb_RAM_AD: TLabel;
    pb_ACC_TDB: TButton;
    pb_ACC_MIN: TButton;
    pb_ACC_PLS: TButton;
    pb_ACC_RST: TButton;
    pb_PC_INZ: TButton;
    pb_PC_INC: TButton;
    pb_MPC_RST: TButton;
    pb_MPC_FIN: TButton;
    pb_INS_TAB: TButton;
    pb_PC_TAB: TButton;
    pb_INS_FDB: TButton;
    pb_RAM_TDB: TButton;
    pb_RAM_FDB: TButton;
    pb_US_TDB: TButton;
    pb_US_TAB: TButton;
    pmInsertDelete: TPopupMenu;
    pn_splash: TPanel;
    sb_speed: TScrollBar;
    sd_savempm: TSaveDialog;
    sd_saveram: TSaveDialog;
    sd_saverambonsai: TSaveDialog;
    sd_saverambonsaibon: TSaveDialog;
    se_address: TSpinEdit;
    sg_MPM: TStringGrid;
    Shape1: TShape;
    sh_ACC_INC: TShape;
    sh_ACC_DEC: TShape;
    sh_stopp: TShape;
    sh_stopp_panel: TShape;
    sh_iszero: TShape;
    sh_ACC_TDB: TShape;
    sh_INS_FDB: TShape;
    sh_ACC_PM: TShape;
    sh_INS_TAB: TShape;
    sh_makro: TShape;
    sh_MPC_RST: TShape;
    sh_ACC_RST: TShape;
    sh_PC_INZ: TShape;
    sh_PC_TAB: TShape;
    sh_MPC_FCO: TShape;
    sh_PC_FCO: TShape;
    sh_RAM_FDB: TShape;
    sh_PC_INC: TShape;
    sh_RAM_TDB: TShape;
    sg_RAM: TStringGrid;
    sg_DRAM: TStringGrid;
    tm_splash: TTimer;
    tm_run: TTimer;
    tm_makro: TTimer;
    tm_blink: TTimer;
    procedure bb_LOAD_MPMClick(Sender: TObject);
    procedure bb_LoadRAMClick(Sender: TObject);
    procedure bb_MakroClick(Sender: TObject);
    procedure bb_OptionsClick(Sender: TObject);
    procedure bb_SAVE_MPMClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ed_ABKeyPress(Sender: TObject; var Key: char);
    procedure ed_DBKeyPress(Sender: TObject; var Key: char);
    procedure Image2Click(Sender: TObject);
    procedure lb_Bonsai_ModeClick(Sender: TObject);
    procedure mi_insertClick(Sender: TObject);
    procedure mi_deleteClick(Sender: TObject);
    procedure pb_macro_pauseClick(Sender: TObject);
    procedure pb_macro_resetClick(Sender: TObject);
    procedure pb_macro_runClick(Sender: TObject);
    procedure pb_macro_stepClick(Sender: TObject);
    procedure pb_microstepClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure pb_NewClick(Sender: TObject);
    procedure pb_saveramClick(Sender: TObject);
    procedure pbResetClick(Sender: TObject);
    procedure pb_LOAD_RAMClick(Sender: TObject);
    procedure pb_LOAD_MPCClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mi_FileClick(Sender: TObject);
    procedure pb_saveram_bonClick(Sender: TObject);
    procedure pb_stoppClick(Sender: TObject);
    procedure pn_splashClick(Sender: TObject);
    procedure sb_speedChange(Sender: TObject);
    procedure sg_DRAMDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure sg_MPMDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure sg_RAMDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure sg_RAMMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure sg_RAMMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tm_makroTimer(Sender: TObject);
    procedure tm_runTimer(Sender: TObject);
    procedure tm_splashTimer(Sender: TObject);
    procedure UserClick(Sender: TObject);

    procedure pb_US_TABClick(Sender: TObject);
    procedure pb_US_TDBClick(Sender: TObject);
    procedure sg_MPMDrawCell1(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure sg_RAMClick(Sender: TObject);
    procedure sg_RAMDblClick(Sender: TObject);
    procedure sg_RAMDrawCell1(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);



    procedure sg_RAMMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_RAMSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StatusBar1DblClick(Sender: TObject);
    procedure tm_blinkTimer(Sender: TObject);
    procedure visualize;

    procedure ShowRAM;
    procedure ShowMPM;
    procedure BlinkShape(the_shape:TShape);
    procedure ChangeMode(Sender: TObject);
    


    
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frm_gmain: Tfrm_gmain;

  // =============================================================
  // Variablen

  AB : integer;       // Zustand d. Adressbusses

  DB_H : integer;     // Zustand d. Datenbusses
  DB_L : integer;

  RAM_AD : integer;
  RAM_D : integer;


  INS_OP : integer;
  INS_AD : integer;

  PC_CT : integer;

  MPC_OP : integer;
  MPC_MC : integer;

  ALU_AC_H : integer;
  ALU_AC_L : integer;

  tm_stop : boolean;
  blink : boolean;
  ramzeiger : integer;
  dramzeiger : integer;

  manuell : boolean;

  bonsai_mode : boolean;

  
  clicked_ramline : integer;

  // Modellierung des RAM
  RAM_H : array [0..999] of integer;
  RAM_L : array [0..999] of integer;
  
  // Modellierung des Microbefehlsspeichers
  MPM : array[0..199] of integer;
  
  // Namen von Makrobefehlen
  
  MC_Names : array[0..19] of string;

  macro_enabled : boolean;
  macro_index   : integer;

  splashover : boolean;

  largest_used_opcode : integer;
  

  // =============================================================
  // Befehle

  procedure RAM_FDB;
  procedure RAM_TDB;

  procedure COM_FDB;
  procedure COM_TAB;

  procedure MPC_FCO;
  procedure MPC_RST;
  procedure MPC_INC;

  procedure PC_FCO;
  procedure PC_TAB;
  procedure PC_INC;
  procedure PC_INZ;


  procedure ALU_RST;
  procedure ALU_PLS;
  procedure ALU_MIN;
  procedure ALU_TDB;

  // =============================================================
  // Dateioperationen
  
  procedure LOAD_MPC(filename : string);




  
  
implementation

{ Tfrm_gmain }


  procedure RAM_RESET;
  var i: integer;
  begin
  for i:=0 to 999 do
    begin
      RAM_H[i]:=0;
      RAM_L[i]:=0;
    end;
  end;

  procedure MPM_RESET;
  var i : integer;
  begin
     for i:=0 to 199 do
       begin
       MPM[i]:=0;
       end;
  end;


  procedure RAM_FDB;
  begin
  RAM_H[AB]:=DB_H;
  RAM_L[AB]:=DB_L;
  if (mpc_op>0) or manuell then
     begin
     dramzeiger:=AB;
     end;
  end;

  procedure RAM_TDB;
  begin
  DB_H:=RAM_H[AB];
  DB_L:=RAM_L[AB];
  if (mpc_op>0) or manuell then
     begin
     dramzeiger:=AB;
     end;
  end;

  procedure COM_FDB;
  begin
  INS_OP:=DB_H;
  INS_AD:=DB_L;
  end;
  

  procedure COM_TAB;
  begin
  AB:=INS_AD;
  end;

  procedure MPC_FCO;
  begin
  MPC_OP:=INS_OP;
  MPC_MC:=0;
  end;

  procedure MPC_RST;
  begin
  MPC_OP:=0;
  MPC_MC:=0;
  end;

  procedure MPC_INC;
  begin
  inc(MPC_MC);
  end;


  procedure PC_FCO;
  begin
  PC_CT:=INS_AD;
  end;


  procedure PC_INC;
  begin
  inc(PC_CT);
  end;

  procedure PC_INZ;
  begin
  if ((ALU_AC_H=0) and (ALU_AC_L=0)) then inc(PC_CT);
  end;


  procedure PC_TAB;
  begin
  AB:=PC_CT;
  ramzeiger:=PC_CT+1;
  end;

  procedure ALU_RST;
  begin
  ALU_AC_H:=0;
  ALU_AC_L:=0;
  end;

  procedure ALU_PLS;
  var haccu : integer;
      hdb : integer;
      herg : integer;
  begin
  haccu:=ALU_AC_L+ALU_AC_H*1000;
  hdb:=DB_L+DB_H*1000;
  herg:=haccu + hdb;
  if herg>19999 then herg:=19999;
  if herg<0 then herg:=0;
  ALU_AC_H:=herg div 1000;
  ALU_AC_L:=herg mod 1000;
  end;

  procedure ALU_MIN;
  var haccu : integer;
      hdb : integer;
      herg : integer;
  begin
  haccu:=ALU_AC_L+ALU_AC_H*1000;
  hdb:=DB_L+DB_H*1000;
  herg:=haccu - hdb;
  if herg>19999 then herg:=19999;
  if herg<0 then herg:=0;
  ALU_AC_H:=herg div 1000;
  ALU_AC_L:=herg mod 1000;
  end;

  procedure ALU_TDB;
  begin
  DB_H:=ALU_AC_H;
  DB_L:=ALU_AC_L;
  end;

  procedure ALU_FDB;
  begin
  ALU_AC_H:=DB_H;
  ALU_AC_L:=DB_L;
  end;

  procedure ALU_INC;
  var haccu : integer;
      herg : integer;
  begin
  haccu:=ALU_AC_L+ALU_AC_H*1000;
  herg:=haccu + 1;
  if herg>19999 then herg:=19999;
  if herg<0 then herg:=0;
  ALU_AC_H:=herg div 1000;
  ALU_AC_L:=herg mod 1000;
  end;

  procedure ALU_DEC;
  var haccu : integer;
      herg : integer;
  begin
  haccu:=ALU_AC_L+ALU_AC_H*1000;
  herg:=haccu - 1;
  if herg>19999 then
     herg:=19999;
  if herg<0 then herg:=0;
  ALU_AC_H:=herg div 1000;
  ALU_AC_L:=herg mod 1000;
  end;

  procedure stopp;
  begin
  frm_gmain.tm_run.Enabled:=false;
  showmessage('Johnny has reached the end of the program.');
  end;


// =============================================================================
// Zuordnungen der Microbefehlsnummern


  procedure execute_MC_Number(number : integer);
  begin
   case number of
   0 :;
   1 : begin RAM_FDB; end;
   2 : begin RAM_TDB; end;
   3 : begin COM_FDB; end;
   4 : begin COM_TAB; end;
   5 : begin MPC_FCO; end;
   6 : begin MPC_INC; end;
   7 : begin MPC_RST; end;
   8 : begin PC_TAB; end;
   9 : begin PC_INC; end;
   10: begin PC_INZ; end;
   11: begin PC_FCO; end;
   12: begin ALU_RST; end;
   13: begin ALU_PLS; end;
   14: begin ALU_MIN; end;
   15: begin ALU_TDB; end;
   16: begin ALU_INC; end;
   17: begin ALU_DEC; end;
   18: begin ALU_FDB; end;
   19: begin stopp; end;
  end;
end;



  procedure execute_MC_Number_delayed(number : integer);
  begin
   case number of
   0 :;
   1 : begin frm_gmain.BlinkShape(frm_gmain.sh_RAM_FDB); RAM_FDB; end;
   2 : begin frm_gmain.BlinkShape(frm_gmain.sh_RAM_TDB); RAM_TDB; end;
   3 : begin frm_gmain.BlinkShape(frm_gmain.sh_INS_FDB); COM_FDB; end;
   4 : begin frm_gmain.BlinkShape(frm_gmain.sh_INS_TAB); COM_TAB; end;
   5 : begin frm_gmain.BlinkShape(frm_gmain.sh_MPC_FCO); MPC_FCO; end;
   6 : begin MPC_INC; end;
   7 : begin frm_gmain.BlinkShape(frm_gmain.sh_MPC_RST); MPC_RST; end;
   8 : begin frm_gmain.BlinkShape(frm_gmain.sh_PC_TAB); PC_TAB; end;
   9 : begin frm_gmain.BlinkShape(frm_gmain.sh_PC_INC); PC_INC; end;
   10: begin frm_gmain.BlinkShape(frm_gmain.sh_PC_INZ); PC_INZ; end;
   11: begin frm_gmain.BlinkShape(frm_gmain.sh_PC_FCO); PC_FCO; end;
   12: begin frm_gmain.BlinkShape(frm_gmain.sh_ACC_RST); ALU_RST; end;
   13: begin
       frm_gmain.BlinkShape(frm_gmain.sh_ACC_PM);
       ALU_PLS;
       end;
   14: begin frm_gmain.BlinkShape(frm_gmain.sh_ACC_PM); ALU_MIN; end;
   15: begin frm_gmain.BlinkShape(frm_gmain.sh_ACC_TDB); ALU_TDB; end;
   16: begin frm_gmain.BlinkShape(frm_gmain.sh_ACC_INC); ALU_INC; end;
   17: begin frm_gmain.BlinkShape(frm_gmain.sh_ACC_DEC); ALU_DEC; end;
   18: begin frm_gmain.BlinkShape(frm_gmain.sh_ACC_PM); ALU_FDB; end;
   19: begin  if frm_gmain.pn_hide_ctrl.Visible
              then frm_gmain.BlinkShape(frm_gmain.sh_stopp_panel)
              else frm_gmain.BlinkShape(frm_gmain.sh_stopp);
              stopp;
       end;

  end;

end;

  function MC_Number_To_Name(number : integer): string;
  begin
     case number of
        0 : result:='  ---  ';
        1 : result:='db->ram';
        2 : result:='ram->db';
        3 : result:='db->ins';
        4 : result:='ins->ab';
        5 : result:='ins->mc';
        6 : result:='inc_mc';
        7 : result:='mc:=0';
        8 : result:='pc->ab';
        9 : result:='pc++';
        10: result:='=0:pc++';
        11: result:='ins->pc';
        12: result:='acc:=0';
        13: result:='plus';
        14: result:='minus';
        15: result:='acc->db';
        16: result:='acc++';
        17: result:='acc--';
        18: result:='db->acc';
        19: result:='stopp';
      end;
  end;

// =============================================================================
// Dateioperationen

procedure LOAD_MPC(filename : string);
  var thefile : TextFile;
      i       : integer;
  begin
   assignFile(thefile,filename);
   reset(thefile);
   for i:=0 to 199 do
      begin
      readln(thefile,mpm[i]);
      if (i mod 10=0) and (mpm[i]<>0) then
        begin
        largest_used_opcode:=i;
        end;
      end;
   frm_gmain.se_address.value:=largest_used_opcode+10;
   close(thefile);
  end;

procedure LOAD_MC_Names(filename : string);
  var thefile : TextFile;
      i       : integer;
  begin
//  frm_ramline.cb_makro.Items.Clear;
   for i:=0 to 15 do
        begin
        mc_names[i]:='';
//        frm_ramline.cb_makro.Items.Add(format('%d:',[i])+mc_names[i]);
        end;
   assignFile(thefile,filename);
   reset(thefile);
   i:=0;
   while not eof(thefile) do
      begin
      readln(thefile,mc_names[i]);
//      frm_ramline.cb_makro.Items[i]:=format('%d:',[i])+mc_names[i];
      inc(i);
      end;
     close(thefile);
  end;


procedure SAVE_MPC(filename : string);
  var thefile : TextFile;
      i       : integer;
  begin
   assignFile(thefile,filename);
   rewrite(thefile);
   for i:=0 to 199 do
      begin
      writeln(thefile,mpm[i]);
      end;
   close(thefile);
  end;

procedure SAVE_MC_Names(filename : string);
  var thefile : TextFile;
      i       : integer;
  begin
   assignFile(thefile,filename);
   rewrite(thefile);
   for i:=0 to 19 do
      begin
      writeln(thefile,mc_names[i]);
      end;
     close(thefile);
  end;





procedure LOAD_RAM(filename : string);
  var thefile : TextFile;
      i       : integer;
      s       : string;
      number  : integer;
      mne     : string;
begin
assignFile(thefile,filename);
   reset(thefile);
   for i:=0 to 999 do
      begin
      readln(thefile,s);
      number:=StrToInt(s);
      ram_h[i]:=number div 1000;
      ram_l[i]:=number mod 1000;
      end;
   close(thefile);
end;






procedure SAVE_RAM(filename : string);
  var thefile : TextFile;
      i       : integer;
  begin
   assignFile(thefile,filename);
   rewrite(thefile);
   for i:=0 to 999 do
      begin
      writeln(thefile,format('%3.3d',[ram_h[i]*1000+ram_l[i]]));
      end;
   close(thefile);
  end;



{
// Obsolete Version
// Hat .BON-Files eingebunden, allerdings gehören .BON-Files zur
// Harvard-Architektur des einfachen Bonsai-Simulators

procedure LOAD_RAM_BONSAI(filename : string);
  var thefile : TextFile;
      i       : integer;
      s       : string;
      number  : integer;
      mne     : string;
      adrteil : string;
      fehler  : integer;
begin
assignFile(thefile,filename);
reset(thefile);
i:=0;
while not eof(thefile) do
      begin
      readln(thefile,s);
      if s[1]<>';'
      then begin
           if s[1]='#'
           then begin
                s:=copy(s,2,length(s)-1);
                val(s,ram_l[i],fehler);
                if (fehler<>0) then ram_l[i]:=0;
                end
           else begin
                mne:=copy(s,1,3);
                adrteil:=copy(s,4,length(s)-3);
                if mne='INC' then ram_h[i]:=1;
                if mne='DEC' then ram_h[i]:=2;
                if mne='JMP' then ram_h[i]:=3;
                if mne='TST' then ram_h[i]:=4;
                if mne='HLT' then ram_h[i]:=5;
                val(adrteil,ram_l[i],fehler);
                if (fehler<>0) then ram_l[i]:=0;
                end;
           end;
      inc(i);
      end;
   close(thefile);
end;

}

procedure LOAD_RAM_BONSAI(filename : string);
  var thefile : TextFile;
      i       : integer;
      s       : string;
      number  : integer;
      mne     : string;
      opcode  : string;
      adrteil : string;
      hilfe   : integer;
      fehler  : integer;
begin
assignFile(thefile,filename);
reset(thefile);
i:=0;
while not eof(thefile) do
      begin
      readln(thefile,s);
      if s[1]<>';'
      then begin
           opcode:=copy(s,1,1);
           adrteil:=copy(s,2,4);

           if opcode<>' '
           then begin
                try
                ram_h[i]:=StrToInt(opcode);
                except
                ram_h[i]:=0;
                end;
                end;

           try
           hilfe:=StrToInt(adrteil);
           except
           hilfe:=0;
           end;

           if hilfe>999
              then hilfe:=hilfe mod 1000;
           ram_l[i]:=hilfe;
           end;
      inc(i);
      end;
   close(thefile);
end;



function Highest_NZ_RAMCell:integer;
var i : integer;
begin
i:=999;
while ((ram_h[i]=0) and (ram_l[i]=0) and (i<>0))
   do dec(i);
result:=i+1;
end;

function valid_bonsai_program:string;
var maxcell : integer;
    i       : integer;
    ergebnis: string;
begin
ergebnis:='valid';
maxcell:=Highest_NZ_RAMCell;
if maxcell>64
then ergebnis:='Program ist too long to fit Bonsai architecture (i.e. >64 Bytes)'
else begin
     for i:=0 to maxcell
     do begin
        if (ram_h[i]>5) or (ram_l[i]>255) or ((ram_h[i]>0) and (ram_l[i]>63))
        then ergebnis:='Too large numbers (i.e.>255) or addresses out of range (i.e.>63)';
        end;
     end;
result:=ergebnis;
end;

{
// Obsolete Version
// Hat .BON-Files eingebunden, allerdings gehören .BON-Files zur
// Harvard-Architektur des einfachen Bonsai-Simulators
procedure SAVE_RAM_BONSAI(filename : string);
  var thefile : TextFile;
      i       : integer;
      maxcell : integer;
      s       : string;
      iscommand : boolean;

  begin
   assignFile(thefile,filename);
   rewrite(thefile);

   maxcell:=Highest_NZ_RAMCell;

   for i:=0 to maxcell do
      begin
      s:='';
      iscommand :=true;

      case ram_h[i] of
      1 : s:=s+'INC';
      2 : s:=s+'DEC';
      3 : s:=s+'JMP';
      4 : s:=s+'TST';
      5 : s:=s+'HLT';
      else begin
           s:=s+'#';
           iscommand:=false;
           end;
      end;
      if iscommand
      then begin
           if ram_h[i]<>5
           then s:=s+format('%2d',[ram_l[i]]);
           // Der HLT-Befehl kennt kein Argument
           end
      else begin
           s:=s+format('%5d',[ram_l[i]]);
           end;
      writeln(thefile,s);
      end;
   close(thefile);
  end;
 }

 procedure SAVE_RAM_BONSAI(filename : string);
  var thefile : TextFile;
      i       : integer;
      maxcell : integer;
      s       : string;
      iscommand : boolean;

  begin
   assignFile(thefile,filename);
   rewrite(thefile);

   maxcell:=Highest_NZ_RAMCell;

   for i:=0 to maxcell do
      begin
      s:='';
      iscommand :=true;
      if ram_h[i]>0
         then begin
              s:=Format('%1d%4.4d',[ram_h[i],ram_l[i]]);
              end
         else begin
              s:=Format('%5d',[ram_l[i]]);
              end;

      writeln(thefile,s);
      end;
   close(thefile);
  end;







// =============================================================================
//  Hier kommen die Methoden für die Ereignisbehandlungen

{ Tfrm_gmain }


procedure Tfrm_gmain.pb_US_TABClick(Sender: TObject);
begin
try
AB:=StrToInt(ed_AB.Text);
except
AB:=0;
end;
if AB>999 then AB:=999;
if AB<0 then AB:=0;
dramzeiger:=AB;
ed_AB.Text:=format('%3.3d',[AB]);
visualize;
end;

procedure Tfrm_gmain.pb_US_TDBClick(Sender: TObject);
var help : integer;
begin
try
help:=StrToInt(ed_DB.Text);
except
help:=0;
end;
if help>19999 then help:=19999;
if help<0 then help:=0;
DB_H:=help div 1000;
DB_L:=help mod 1000;
if DB_H>19 then
   begin
   DB_H:=19;
   DB_L:=999;
   end;
if DB_H<0 then
   DB_H:=0;
ed_DB.Text:=format('%2.2d%3.3d',[DB_H,DB_L]);
visualize;
end;

procedure Tfrm_gmain.sg_MPMDrawCell1(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin

end;

procedure Tfrm_gmain.sg_MPMDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var s : string;
begin
  if (ARow=sg_MPM.Row) then begin
    sg_MPM.Canvas.Brush.Color := clYellow;
    sg_MPM.Canvas.FillRect(aRect);
    // Hier kommt der Versuch
    sg_MPM.Font.Color:= clBlack;
    s:= sg_MPM.Cells[ACol,ARow];
    sg_MPM.Canvas.TextRect(ARect,ARect.Left+3,ARect.Top,s);
    // Ende Versuch
    end;
end;

procedure Tfrm_gmain.sg_RAMClick(Sender: TObject);
begin

end;

procedure Tfrm_gmain.sg_RAMDblClick(Sender: TObject);
begin

end;

procedure Tfrm_gmain.sg_RAMDrawCell1(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin

end;

procedure Tfrm_gmain.sg_RAMDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var s : string;
begin

if ((ACol>2) and (ARow>0)) then
   begin
    sg_RAM.Canvas.Brush.Color := clSilver;
    sg_RAM.Canvas.FillRect(aRect);
    s:= sg_RAM.Cells[ACol,ARow];
    sg_RAM.Canvas.TextRect(ARect,ARect.Left+3,ARect.Top,s);

   end;

if ((ARow=sg_RAM.Row) and (ACol<=2)) then begin
    sg_RAM.Canvas.Brush.Color := clYellow;
    sg_RAM.Canvas.FillRect(aRect);

    s:= sg_RAM.Cells[ACol,ARow];
    sg_RAM.Canvas.TextRect(ARect,ARect.Left+3,ARect.Top,s);

    end;
if ((ARow=sg_RAM.Row) and (ACol>2)) then begin
    sg_RAM.Canvas.Brush.Color := $00D0D0;
    sg_RAM.Canvas.FillRect(aRect);
    s:= sg_RAM.Cells[ACol,ARow];
    sg_RAM.Canvas.TextRect(ARect,ARect.Left+3,ARect.Top,s);

    end;

end;

procedure Tfrm_gmain.sg_RAMMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
  var zwischen : integer;
begin
   zwischen:=sg_RAM.row;
   sg_RAM.Row:=990;
   sg_RAM.repaint;
   sg_ram.row:=zwischen;

end;

procedure Tfrm_gmain.sg_RAMMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var zwischen : integer;
begin
   zwischen:=sg_RAM.row;
   sg_RAM.Row:=990;
   sg_RAM.repaint;
   sg_ram.row:=zwischen;

end;





{procedure Tfrm_gmain.sg_RAMDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
  if (ARow=sg_RAM.Row) then begin //bei ungeraden Zeilen
    sg_RAM.Canvas.Brush.Color := clYellow;
    sg_RAM.Canvas.FillRect(aRect);
    end;
end;
}

procedure Tfrm_gmain.sg_RAMMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var acol, arow : integer;
    help_h, help_l : integer;

begin
if Button=mbLeft
then begin
      sg_RAM.MouseToCell(X,Y,acol,arow);
      clicked_ramline:=aRow-1;
      if clicked_ramline>=0
      then begin
           ramzeiger:=clicked_ramline+1;
           visualize;
           frm_ramline.lb_Address.caption:=format('%3.3d:',[clicked_ramline]);
           frm_ramline.ed_hi.text:=format('%2.2d',[RAM_H[clicked_ramline]]);
           frm_ramline.ed_lo.text:=format('%3.3d',[RAM_L[clicked_ramline]]);
           frm_ramline.cb_makro.ItemIndex:=RAM_H[clicked_ramline];
           frm_ramline.cb_makro.ItemIndex:=3;
           frm_ramline.befehlsnummer:=RAM_H[clicked_ramline];

           frm_ramline.ShowModal;
           if frm_ramline.resultat <> mrcancel then
             begin
             try
             help_h:=StrToInt(frm_ramline.ed_hi.Text);
             except
             help_h:=0;
             end;
             try
             help_l:=StrToInt(frm_ramline.ed_lo.Text);
             except
             help_l:=0;
             end;
             if help_h>19 then
                begin
                help_h:=19;
                help_l:=999;
                end;
             if (help_h<0) or (help_l<0) then
                begin
                help_h:=0;
                help_l:=0;
                end;
             if (help_l>999) then
                begin
                help_l:=999;
                end;
             ram_h[clicked_ramline]:=help_h;
             ram_l[clicked_ramline]:=help_l;
             end;
           end;
       ramzeiger:=clicked_ramline+1;
       visualize;
       end
else begin
     sg_RAM.MouseToCell(X,Y,acol,arow);
      clicked_ramline:=aRow-1;
      if clicked_ramline>=0
      then begin
           ramzeiger:=clicked_ramline+1;
           visualize;
           pmInsertDelete.PopUp();
           end
     end;
end;



procedure Tfrm_gmain.sg_RAMSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin

end;

procedure Tfrm_gmain.SpeedButton1Click(Sender: TObject);
begin

end;

procedure Tfrm_gmain.StatusBar1DblClick(Sender: TObject);
begin

end;

procedure Tfrm_gmain.tm_blinkTimer(Sender: TObject);
begin
  tm_stop:=true;
  tm_blink.Enabled:=false;
end;


procedure Tfrm_gmain.ChangeMode(Sender: TObject);
begin
if bonsai_mode
then begin
     LOAD_MPC('standard_bonsai.mpc');
     LOAD_MC_Names('standard_bonsai.nam');
     end
else begin
     LOAD_MPC('standard.mpc');
     LOAD_MC_Names('standard.nam');
     end;
ShowMPM;
end;


procedure Tfrm_gmain.FormCreate(Sender: TObject);
begin
ed_AB.text:='0';
ed_DB.text:='0';
//sg_RAM.ScrollBars:=ssNone;
sg_DRAM.ScrollBars:=ssNone;
visualize;
RAM_Reset;
tm_stop:=true;
clicked_ramline:=0;
macro_enabled:=false;
LOAD_MPC('standard.mpc');
LOAD_MC_Names('standard.nam');
ramzeiger:=0;
dramzeiger:=0;
manuell:=false;
visualize;
pn_splash.Visible:=true;
tm_splash.Enabled:=true;
bonsai_mode:=false;
end;

procedure Tfrm_gmain.pb_LOAD_MPCClick(Sender: TObject);
begin

end;

procedure Tfrm_gmain.pb_LOAD_RAMClick(Sender: TObject);
begin

end;



procedure Tfrm_gmain.pbResetClick(Sender: TObject);
begin

end;

procedure Tfrm_gmain.BlinkShape(the_shape:TShape);
begin
  tm_stop:=false;
  tm_blink.Enabled:=true;
  the_shape.visible:=true;
  repeat
    Application.ProcessMessages;
    until tm_stop;
  the_shape.visible:=false;
end;


procedure Tfrm_gmain.Button2Click(Sender: TObject);
begin
 BlinkShape(sh_INS_FDB);

end;

procedure Tfrm_gmain.CheckBox1Change(Sender: TObject);
begin
    pn_hide_ctrl.Visible:=not(checkbox1.checked);
end;

procedure Tfrm_gmain.pb_NewClick(Sender: TObject);
begin
  RAM_Reset;
  visualize;
end;

procedure Tfrm_gmain.pb_saveramClick(Sender: TObject);
begin
    tm_run.Enabled:=false;
    if bonsai_mode
    then begin
         if sd_saverambonsai.Execute
         then begin
                   SAVE_RAM(sd_saverambonsai.filename);
              end;
         end
    else begin
         if sd_saveram.Execute
         then begin
              SAVE_RAM(sd_saveram.filename);
              end
         end;
end;





procedure Tfrm_gmain.bb_LoadRAMClick(Sender: TObject);
var old_bonsai_mode : boolean;
begin
  old_bonsai_mode:=bonsai_mode;
  tm_run.Enabled:=false;
  if bonsai_mode
  then od_openram.FilterIndex:=2
  else od_openram.FilterIndex:=1;


  if od_openram.Execute then
     begin
     if ExtractFileExt(od_openram.filename)='.ram'
        then begin
             bonsai_mode:=false;
             LOAD_RAM(od_openram.filename);
             end;
     if ExtractFileExt(od_openram.filename)='.bij'
        then begin
             bonsai_mode:=true;
             LOAD_RAM(od_openram.filename);
             end;
     if ExtractFileExt(od_openram.filename)='.bma'
        then begin
             bonsai_mode:=true;
             LOAD_RAM_BONSAI(od_openram.filename);
             end;


     if old_bonsai_mode<>bonsai_mode
        then ChangeMode(Sender);



     visualize;
     end;
  visualize;
end;

procedure Tfrm_gmain.bb_MakroClick(Sender: TObject);
var i : integer;
begin
    tm_run.Enabled:=false;
  if macro_enabled
  then begin
       macro_enabled:=false;
       sh_makro.visible:=false;
       end
  else begin
       macro_enabled:=true;
       sh_makro.visible:=true;
       // Lösche den aktuellen Makrobefehl
       macro_index:=se_address.value;
       for i:=se_address.value to se_address.value+9 do
          begin
          MPM[i]:=0;
          end;
       ed_name.Text:=Upcase(ed_name.Text);
       MC_Names[macro_index div 10]:=ed_name.Text;
       visualize;
       end;
end;

procedure Tfrm_gmain.bb_OptionsClick(Sender: TObject);
var resultat : integer;
    old_bonsai_mode : boolean;
begin
old_bonsai_mode:=bonsai_mode;
if bonsai_mode=true
   then frm_options.rg_inst_set.ItemIndex:=1
   else frm_options.rg_inst_set.ItemIndex:=0;
resultat:=frm_options.ShowModal;
if resultat=mrOK then
   begin
     if frm_options.rg_inst_set.ItemIndex=1
        then
            begin
            bonsai_mode:=true

            end
        else bonsai_mode:=false;
     if bonsai_mode<>old_bonsai_mode
        then begin
             pb_NewClick(Sender);
             ChangeMode(Sender);
             end;

   end;
end;


procedure Tfrm_gmain.pb_macro_resetclick(Sender: TObject);
begin
 tm_run.Enabled:=false;
 ramzeiger:=0;
  PC_CT:=0;
 MPC_MC:=0;
 MPC_OP:=0;
 AB:=0;
 DB_H :=0;
 DB_L :=0;

 RAM_AD :=0;
 RAM_D :=0;

 INS_OP :=0;
 INS_AD :=0;


 MPC_OP :=0;
 MPC_MC :=0;

 ALU_AC_H :=0;
 ALU_AC_L :=0;

  visualize;
end;

procedure Tfrm_gmain.BitBtn2Click(Sender: TObject);
begin
  checkbox1.Checked:=not(checkbox1.checked);
  pn_hide_ctrl.Visible:=not(checkbox1.checked);
  //pb_microstep.enabled:=checkbox1.checked;
  gb_microcode.Visible:=checkbox1.checked;
  
end;

procedure Tfrm_gmain.Button1Click(Sender: TObject);
begin
  // beep;
end;

procedure Tfrm_gmain.ed_ABKeyPress(Sender: TObject; var Key: char);
begin
     if (ord(Key)=13) then pb_US_TABClick(Sender);
end;

procedure Tfrm_gmain.ed_DBKeyPress(Sender: TObject; var Key: char);
begin
   if (ord(Key)=13) then pb_US_TDBClick(Sender);
end;

procedure Tfrm_gmain.Image2Click(Sender: TObject);
begin
   pn_splash.Visible:=false;
end;



procedure Tfrm_gmain.lb_Bonsai_ModeClick(Sender: TObject);
begin

end;

procedure Tfrm_gmain.mi_insertClick(Sender: TObject);
var i : integer;
    endpunkt : integer;
begin
   i:=clicked_ramline;
   // Laufe an die nächste 0-Zelle
   while ram_h[i]+ram_l[i]<>0
   do begin
      inc(i)
      end;
   endpunkt:=i;
   // Verschiebe den durchlaufenen Bereich um 1 nach hinten
   for i:=endpunkt downto clicked_ramline+1
   do begin
      ram_h[i]:=ram_h[i-1];
      ram_l[i]:=ram_l[i-1];
      end;
   // Nulle die angeklickte Zeile
   ram_h[clicked_ramline]:=0;
   ram_l[clicked_ramline]:=0;
   visualize;
   showmessage('Please check manually whether all address references are still correct');
end;

procedure Tfrm_gmain.mi_deleteClick(Sender: TObject);
var i : integer;
begin
   i:=clicked_ramline;
   // Laufe an die nächste 0-Zelle
   while (ram_h[i+1]+ram_l[i+1]<>0) and (i<=998)
   do begin
      if i<=998
      then begin
            ram_h[i]:=ram_h[i+1];
            ram_l[i]:=ram_l[i+1];
           end;
      inc(i)
      end;
   ram_h[i]:=0;
   ram_l[i]:=0;
   visualize;
   showmessage('Please check manually whether all address references are still correct');
end;





procedure Tfrm_gmain.pb_macro_pauseClick(Sender: TObject);
begin
  tm_run.Enabled:=false;
end;


procedure Tfrm_gmain.pb_macro_runClick(Sender: TObject);
begin
  tm_run.Enabled:=true;
end;






procedure Tfrm_gmain.pb_macro_stepClick(Sender: TObject);
  var ins_number : integer;
begin
if tm_stop=true then
begin
repeat
ins_number:=MPM[10*MPC_OP+MPC_MC];
execute_MC_Number(ins_number);
if (ins_number<>5) and (ins_number<>7)
      then MPC_INC; // Beim Neusetzen des Programmzählers darf nicht
                    // gleich hochgezählt werden.
until 10*MPC_OP+MPC_MC=0;
visualize;
//sg_RAM.Row:=PC_CT+1;
ramzeiger:=PC_CT+1;
ShowRAM;
end;
end;

procedure Tfrm_gmain.pb_microstepClick(Sender: TObject);
  var ins_number : integer;
begin
  tm_run.Enabled:=false;
if tm_stop=true then
begin
ins_number:=MPM[10*MPC_OP+MPC_MC];
execute_MC_Number_delayed(ins_number);
if (ins_number<>5) and (ins_number<>7)
      then MPC_INC; // Beim Neusetzen des Programmzählers darf nicht
                    // gleich hochgezählt werden.

// Beim Legen des PC auf den Adressbus muss die markierte Stelle im RAM geändert werden.
if (ins_number=8) then
   ramzeiger:=PC_CT+1;
visualize;
end;
end;


{procedure Tfrm_gmain.Button1Click(Sender: TObject);
begin
sg_ram.row:=33;
end;}

procedure Tfrm_gmain.bb_LOAD_MPMClick(Sender: TObject);
var filename : string;
    path : string;
    torso:string;
begin
    tm_run.Enabled:=false;
  if od_openmpm.Execute then
     begin
     path:=extractFileDir(od_openmpm.FileName);
     filename:=extractFileName(od_openmpm.FileName);
     torso:=copy(filename,1,pos('.mpc',filename)-1);
     LOAD_MPC(path+'\'+torso+'.mpc');
     LOAD_MC_Names(path+'\'+torso+'.nam');
     visualize;
     end;
end;


procedure Tfrm_gmain.bb_SAVE_MPMClick(Sender: TObject);
var filename : string;
    path : string;
    torso:string;
begin
    tm_run.Enabled:=false;
    if sd_savempm.Execute then
     begin
     path:=extractFileDir(sd_savempm.FileName);
     filename:=extractFileName(sd_savempm.FileName);
     torso:=copy(filename,1,pos('.mpc',filename)-1);
     if (upcase(torso)<>'STANDARD') and  (upcase(torso)<>'STANDARD_BONSAI')
     then begin
          SAVE_MPC(path+'\'+torso+'.mpc');
          SAVE_MC_Names(path+'\'+torso+'.nam');
          end
     else begin
          Application.MessageBox('Standard micro codes are protected.', 'Message', 0);
          end;
     
     visualize;
     end;
end;


procedure Tfrm_gmain.mi_FileClick(Sender: TObject);
begin

end;

procedure Tfrm_gmain.pb_saveram_bonClick(Sender: TObject);
var validstring : string;
begin
   tm_run.Enabled:=false;
   if bonsai_mode
   then begin
        validstring:=valid_bonsai_program;
        if validstring='valid'
        then begin
             if sd_saverambonsaibon.Execute
             then SAVE_RAM_BONSAI(sd_saverambonsaibon.filename)
             end
        else ShowMessage(validstring);
        end
   else begin
        ShowMessage('Only Programs in Bonsai Mode can be exported to Bonsai files');
        end

end;

procedure Tfrm_gmain.pb_stoppClick(Sender: TObject);
begin

end;

procedure Tfrm_gmain.pn_splashClick(Sender: TObject);
begin
  pn_splash.Visible:=false;
end;

procedure Tfrm_gmain.sb_speedChange(Sender: TObject);
begin
  tm_run.Interval:=1000 div sb_speed.Position;
end;

procedure Tfrm_gmain.sg_DRAMDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var s : string;
begin
if (ARow=sg_DRAM.Row) then begin
    sg_DRAM.Canvas.Brush.Color := clSkyBlue;
    sg_DRAM.Canvas.FillRect(aRect);
    s:= sg_DRAM.Cells[ACol,ARow];
    sg_DRAM.Canvas.TextRect(ARect,ARect.Left+3,ARect.Top,s);

    end;
if (ACol>2) then begin
    sg_DRAM.Canvas.Brush.Color := clSilver;
    sg_DRAM.Canvas.FillRect(aRect);
    s:= sg_DRAM.Cells[ACol,ARow];
    sg_DRAM.Canvas.TextRect(ARect,ARect.Left+3,ARect.Top,s);
end;

end;




procedure Tfrm_gmain.tm_makroTimer(Sender: TObject);
begin
  if blink then sh_makro.Brush.Color:=clred
           else sh_makro.Brush.Color:=clyellow;
  blink:=not blink;
  
end;

procedure Tfrm_gmain.tm_runTimer(Sender: TObject);
begin
  pb_macro_stepClick(Sender);
end;

procedure Tfrm_gmain.tm_splashTimer(Sender: TObject);
begin
  pn_splash.Visible:=false;
end;


procedure Tfrm_gmain.ShowRAM;
var i : integer;
begin
for i:=0 to 999 do
  begin
  sg_RAM.Cells[0,i+1]:=format('%3.3d:',[i]) ;
  sg_RAM.Cells[1,i+1]:=format('%2.2d',[RAM_H[i]]) ;
  sg_RAM.Cells[2,i+1]:=format('%3.3d',[RAM_L[i]]) ;
  if (MC_Names[RAM_H[i]]<>'')
  then begin
       sg_RAM.CELLS[3,i+1]:=MC_Names[RAM_H[i]];
       sg_RAM.Cells[4,i+1]:=format('%3.3d',[RAM_L[i]]) ;
       end
  else begin
       sg_RAM.CELLS[3,i+1]:='';
       sg_RAM.Cells[4,i+1]:='';
       end;
  sg_RAM.row:=ramzeiger;
  end;
for i:=0 to 999 do
  begin
  sg_DRAM.Cells[0,i]:=format('%3.3d:',[i]) ;
  sg_DRAM.Cells[1,i]:=format('%2.2d',[RAM_H[i]]) ;
  sg_DRAM.Cells[2,i]:=format('%3.3d',[RAM_L[i]]) ;
  if (MC_Names[RAM_H[i]]<>'')
  then begin
       sg_DRAM.CELLS[3,i]:=MC_Names[RAM_H[i]];
       sg_DRAM.Cells[4,i]:=format('%3.3d',[RAM_L[i]]) ;
       end
  else begin
       sg_DRAM.CELLS[3,i]:='';
       sg_DRAM.Cells[4,i]:='';
       end;

  sg_DRAM.row:=dramzeiger;
  end;
sg_DRAM.Repaint;
end;


procedure Tfrm_gmain.ShowMPM;
var i : integer;
begin
//sg_MPM.ScrollBars:=ssNone;
for i:=0 to 199 do
  begin
  sg_MPM.Cells[0,i+1]:=format('%3.3d',[i]) ;
  sg_MPM.Cells[1,i+1]:=MC_Number_To_Name(MPM[i]);

  if macro_enabled
     then begin
          sg_MPM.row:=macro_index+2;
          sg_MPM.row:=macro_index+1;
          end
     else begin
          sg_MPM.row:=MPC_OP*10+MPC_MC+1;
          end;

  
  if i mod 10=0 then
    begin
    sg_MPM.Cells[0,i+1]:=sg_MPM.Cells[0,i+1]+':'+MC_Names[i div 10];
    end;
  sg_MPM.Cells[0,0+1]:='000:fetch';
  end;
end;


procedure Tfrm_gmain.visualize;
begin
lb_AB.Caption:=format('%3.3d',[AB]);
lb_RAM_AD.Caption:=lb_AB.Caption;
lb_DB.Caption:=format('%2.2d %3.3d',[DB_H, DB_L]);
lb_ACC_AC.Caption:=format('%2.2d %3.3d',[ALU_AC_H, ALU_AC_L]);
lb_RAM_D.Caption:=format('%2.2d %3.3d',[RAM_H[AB], RAM_L[AB]]);
lb_INS_OP.Caption:=format('%2.2d',[INS_OP]);
lb_INS_AD.Caption:=format('%3.3d',[INS_AD]);
lb_PC_CT.Caption:=format('%3.3d',[PC_CT]);
lb_MPC_OP.Caption:=format('%2.2d',[MPC_OP]);
lb_MPC_MC.Caption:=format('%1.1d',[MPC_MC]);
lb_MPC_Name.Caption:=MC_Number_To_Name(MPM[10*MPC_OP+MPC_MC]);
if ((ALU_AC_H=0) and (ALU_AC_L=0))
   then sh_iszero.Brush.Color:=clyellow
   else sh_iszero.Brush.Color:=clgray;
ShowRam;
ShowMPM;
if bonsai_mode
   then begin
        lb_Bonsai_Mode.Visible:=true;
        pb_SaveRAM_bon.Visible:=true;
        pb_ACC_RST.Visible:=false;
        pb_ACC_PLS.Visible:=false;
        pb_ACC_MIN.Visible:=false;
        end
   else begin
        lb_Bonsai_Mode.Visible:=false;
        pb_SaveRAM_bon.Visible:=false;
        pb_ACC_RST.Visible:=true;
        pb_ACC_PLS.Visible:=true;
        pb_ACC_MIN.Visible:=true;
        end;
end;



procedure Tfrm_gmain.UserClick(Sender: TObject);
begin
if tm_stop=true then
    begin
    manuell:=true;
    execute_MC_Number_delayed((Sender as TButton).tag);
    manuell:=false;
    visualize;
    if macro_enabled then
       begin
       MPM[macro_index]:=(Sender as TButton).tag;
       inc(macro_index);
       sg_MPM.row:=macro_index+1;
       end;
    visualize;
    end;
end;


initialization
  {$I guido_main.lrs}

end.

