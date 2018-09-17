unit SkalaWfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TSkalaw = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Skalaw: TSkalaw;
  pozycja : integer;

implementation

uses Glowne, MapaCfrm;

{$R *.dfm}

procedure TSkalaw.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
Var
 poz : integer;
 kolor : integer;
begin
 poz:=y div 20;
 pozycja:=poz+1;
 AGlowne.Oblicz_skale;
 kolor:=image1.Canvas.Pixels[5,poz*20];
 Skalaw.Image1.Canvas.Pen.Color:=clblack;
 Skalaw.Image1.Canvas.Brush.Color:=kolor;
 Skalaw.Image1.Canvas.Rectangle(0,(poz*20),50,((poz*20)+20));
 Label2.Caption:=IntToSTr(AGlowne.z_tab_wys(poz+1))+' m';
   if pozycja=1 then Label4.Caption:='Wysokie góry';
   if (pozycja=2) or (pozycja=3) or (pozycja=4) or (pozycja=5) then Label4.Caption:='Góry';
   if (pozycja=6) or (pozycja=7) or (pozycja=8) or (pozycja=9) then Label4.Caption:='Wy¿yny';
   if (pozycja=10) or (pozycja=11) or (pozycja=12) or (pozycja=13) then Label4.Caption:='Niziny';
   if pozycja=14 then Label4.Caption:='Poziom zerowy';
   if (pozycja=15) or (pozycja=16) or (pozycja=17) then Label4.Caption:='Depresje';
end;

procedure TSkalaw.FormCreate(Sender: TObject);
begin
pozycja:=0;
end;

procedure TSkalaw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AGlowne.Skalawysokoci1.Checked:=False;
end;

end.
