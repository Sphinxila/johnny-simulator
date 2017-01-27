unit guido_main_del;
// Graphical UCode Interpreter with Didactic Options 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    lb_AB: TLabel;
    lb_DB: TLabel;
    lb_RAM_AD: TLabel;
    lb_RAM_D: TLabel;
    pb_RAM_FDB: TButton;
    pb_RAM_TDB: TButton;
    ed_AB: TEdit;
    ed_DB: TEdit;
    pb_US_TAB: TButton;
    pb_US_TDB: TButton;
    lb_ALU_AC: TLabel;
    pb_ALU_RST: TButton;
    pb_ALU_PLS: TButton;
    pb_ALU_MIN: TButton;
    pb_ALU_TDB: TButton;
    lb_COM_OP: TLabel;
    lb_COM_AD: TLabel;
    lb_PC_CT: TLabel;
    pb_COM_TAB: TButton;
    pb_PC_TAB: TButton;
    pb_MPC_FCO: TButton;
    pb_COM_FDB: TButton;
    lb_MPC_OP: TLabel;
    lb_MPC_MC: TLabel;
    pb_PC_INC: TButton;
    pb_PC_INZ: TButton;
    pb_MPC_INC: TButton;
    pb_MPC_RST: TButton;
    procedure pb_US_TABClick(Sender: TObject);
    procedure pb_US_TDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);




    procedure visualize;
    procedure pb_ALU_RSTClick(Sender: TObject);
    procedure pb_ALU_PLSClick(Sender: TObject);
    procedure pb_ALU_MINClick(Sender: TObject);
    procedure pb_ALU_TDBClick(Sender: TObject);
    procedure pb_RAM_FDBClick(Sender: TObject);
    procedure pb_RAM_TDBClick(Sender: TObject);
    procedure pb_COM_FDBClick(Sender: TObject);
    procedure pb_COM_TABClick(Sender: TObject);
    procedure pb_PC_TABClick(Sender: TObject);
    procedure pb_MPC_FCOClick(Sender: TObject);
    procedure pb_PC_INCClick(Sender: TObject);
    procedure pb_PC_INZClick(Sender: TObject);
    procedure pb_MPC_INCClick(Sender: TObject);
    procedure pb_MPC_RSTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  // =============================================================
  // Variablen

  AB : byte;       // Zustand d. Adressbusses

  DB_H : byte;     // Zustand d. Datenbusses
  DB_L : byte;

  RAM_AD : byte;
  RAM_D : byte;


  COM_OP : byte;
  COM_AD : byte;

  PC_CT : byte;

  MPC_OP : byte;
  MPC_MC : byte;

  ALU_AC_H : byte;
  ALU_AC_L : byte;


  // Modellierung des RAM
  RAM_H : array [0..255] of byte;
  RAM_L : array [0..255] of byte;




  // =============================================================
  // Befehle

  procedure RAM_FDB;
  procedure RAM_TDB;

  procedure COM_FDB;
  procedure COM_TAB;

  procedure MPC_FCO;
  procedure MPC_RST;

  procedure PC_FCO;
  procedure PC_TAB;

  procedure ALU_RST;
  procedure ALU_PLS;
  procedure ALU_MIN;
  procedure ALU_TDB;

  //



implementation

  procedure RAM_FDB;
  begin
  RAM_H[AB]:=DB_H;
  RAM_L[AB]:=DB_L;
  end;

  procedure RAM_TDB;
  begin
  DB_H:=RAM_H[AB];
  DB_L:=RAM_L[AB];

  end;

  procedure COM_FDB;
  begin
  COM_OP:=DB_H;
  COM_AD:=DB_L;
  end;

  procedure COM_TAB;
  begin
  AB:=COM_AD;
  end;

  procedure MPC_FCO;
  begin
  MPC_OP:=COM_OP;
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
  PC_CT:=COM_AD;
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
  end;

  procedure ALU_RST;
  begin
  ALU_AC_H:=0;
  ALU_AC_L:=0;
  end;

  procedure ALU_PLS;
  var haccu : word;
      hdb : word;
      herg : word;
  begin
  haccu:=ALU_AC_L+ALU_AC_H*256;
  hdb:=DB_L+DB_H*256;
  herg:=haccu + hdb;
  if herg>15*256+255 then herg:=15*256+255;
  if herg<0 then herg:=0;
  ALU_AC_H:=herg div 256;
  ALU_AC_L:=herg mod 256;
  end;

  procedure ALU_MIN;
  var haccu : integer;
      hdb : integer;
      herg : integer;
  begin
  haccu:=ALU_AC_L+ALU_AC_H*256;
  hdb:=DB_L+DB_H*256;
  herg:=haccu - hdb;
  if herg>15*256+255 then herg:=15*256+255;
  if herg<0 then herg:=0;
  ALU_AC_H:=herg div 256;
  ALU_AC_L:=herg mod 256;
  end;

  procedure ALU_TDB;
  begin
  DB_H:=ALU_AC_H;
  DB_L:=ALU_AC_L;
  end;



{$R *.dfm}

procedure TForm1.pb_US_TABClick(Sender: TObject);
begin
AB:=StrToInt('0x'+ed_AB.Text);
visualize;
end;

procedure TForm1.pb_US_TDBClick(Sender: TObject);
var help : integer;
begin
help:=StrToInt('0x'+ed_DB.Text);
DB_H:=help div 256;
DB_L:=help mod 256;
visualize;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
ed_AB.text:='0';
ed_DB.text:='0';
visualize;
end;


procedure TForm1.visualize;
begin
lb_AB.Caption:=format('%2.2x',[AB]);
lb_RAM_AD.Caption:=lb_AB.Caption;
lb_DB.Caption:=format('%x %2.2x',[DB_H, DB_L]);
lb_ALU_AC.Caption:=format('%x %2.2x',[ALU_AC_H, ALU_AC_L]);
lb_RAM_D.Caption:=format('%x %2.2x',[RAM_H[AB], RAM_L[AB]]);
lb_COM_OP.Caption:=format('%2.2x',[COM_OP]);
lb_COM_AD.Caption:=format('%2.2x',[COM_AD]);
lb_PC_CT.Caption:=format('%2.2x',[PC_CT]);
lb_MPC_OP.Caption:=format('%2.2x',[MPC_OP]);
lb_MPC_MC.Caption:=format('%2.2x',[MPC_MC]);

end;


procedure TForm1.pb_ALU_RSTClick(Sender: TObject);
begin
ALU_RST;
visualize;
end;

procedure TForm1.pb_ALU_PLSClick(Sender: TObject);
begin
ALU_PLS;
visualize;
end;

procedure TForm1.pb_ALU_MINClick(Sender: TObject);
begin
ALU_MIN;
visualize;
end;

procedure TForm1.pb_ALU_TDBClick(Sender: TObject);
begin
ALU_TDB;
visualize;
end;

procedure TForm1.pb_RAM_FDBClick(Sender: TObject);
begin
RAM_FDB;
visualize;
end;

procedure TForm1.pb_RAM_TDBClick(Sender: TObject);
begin
RAM_TDB;
visualize;
end;

procedure TForm1.pb_COM_FDBClick(Sender: TObject);
begin
COM_FDB;
visualize;
end;

procedure TForm1.pb_COM_TABClick(Sender: TObject);
begin
COM_TAB;
visualize;
end;

procedure TForm1.pb_PC_TABClick(Sender: TObject);
begin
PC_TAB;
visualize;
end;

procedure TForm1.pb_MPC_FCOClick(Sender: TObject);
begin
MPC_FCO;
visualize;
end;

procedure TForm1.pb_PC_INCClick(Sender: TObject);
begin
PC_INC;
visualize;
end;

procedure TForm1.pb_PC_INZClick(Sender: TObject);
begin
PC_INZ;
visualize;
end;

procedure TForm1.pb_MPC_INCClick(Sender: TObject);
begin
MPC_INC;
visualize;
end;

procedure TForm1.pb_MPC_RSTClick(Sender: TObject);
begin
MPC_RST;
visualize;
end;

end.
