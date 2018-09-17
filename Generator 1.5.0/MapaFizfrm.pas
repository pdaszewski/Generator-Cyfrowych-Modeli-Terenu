unit MapaFizfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls;

type
  TMapaFiz = class(TForm)
    Image1: TImage;
    StatusBar1: TStatusBar;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapaFiz: TMapaFiz;
implementation

uses Glowne;

{$R *.dfm}

procedure TMapaFiz.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
 Var 
 RGB : Integer;
 pom, R,G,B: Integer;
 kolor : string;
begin
kolor:='Nieznany';
 StatusBar1.Panels[0].Text:='('+IntToSTr(x)+';'+IntToStr(y)+')';
 RGB:=Mapafiz.Image1.Canvas.Pixels[x,y];
 R := GetRValue(RGB);
 G := GetGValue(RGB);
 B := GetBValue(RGB);
 StatusBar1.Panels[1].Text:=IntToSTr(R)+'-'+IntToSTr(G)+'-'+IntToSTr(B);
 //---------------------------------------------
 if (B>R) and (B>G) then kolor:='Depresje';
 //---------------------------------------------
 if (G>R) and (G>B) then kolor:='Doliny';
 //---------------------------------------------
 if (R>B) and (R>G) then kolor:='Góry';
 //---------------------------------------------
 pom:=R-G;
 if pom<0 then pom:=-pom;
 if (R>B) and (pom<20) then kolor:='Wy¿yny';
 //---------------------------------------------
 StatusBar1.Panels[2].Text:=kolor;
end;

procedure TMapaFiz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AGlowne.Mapafizyczna1.Checked:=False;
end;

end.
