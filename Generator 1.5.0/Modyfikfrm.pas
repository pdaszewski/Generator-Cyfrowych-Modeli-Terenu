unit Modyfikfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TModyfik = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    stwartL: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel4: TPanel;
    RadioButton4: TRadioButton;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure wsp(x,y: Integer);
    procedure wys(mni, mzi, mzo, mcz: Integer);
    procedure FormShow(Sender: TObject);
    procedure odswiez;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ustaw_zakres(ile : integer);
    procedure RadioButton1Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modyfik: TModyfik;
  xt, yt : integer;
  maxnie, maxzie, maxzol, maxcze : integer;
  tab : array[1..40,1..40] of integer;
  zx, zy, xm, ym: integer;
  czy_wczytany : boolean;
  stala, przycisk : string;
  zakresx : integer;
  wielkoscx : integer;

implementation

uses Glowne;

{$R *.dfm}

Procedure TModyfik.Ustaw_zakres(ile: integer);
Begin
 zakresx:=ile;
 wielkoscx:=200 div zakresx;
end;

procedure TModyfik.wys(mni, mzi, mzo, mcz: Integer);
Begin
 maxnie:=mni;
 maxzie:=mzi;
 maxzol:=mzo;
 maxcze:=mcz;
end;


procedure TModyfik.wsp(x,y: Integer);
Var
 xtp, ytp : integer;
Begin
 xt:=x; yt:=y;
 for ytp:=1 to zakresx do
  Begin
   for xtp:=1 to zakresx do
    Begin
     tab[xtp,ytp]:=AGlowne.Wysokosc(xt+xtp-1,yt+ytp-1);
    end;
  end;
  czy_wczytany:=True;
end;

procedure TModyfik.odswiez;
Var
 wys, xp, yp, x, y : integer;
 pomR : Real;
 pomV : Variant;
 R, G, B : integer;
 kolor: TColor;
Begin
 for y:=0 to zakresx do
  Begin
   for x:=0 to zakresx do
    Begin
     R:=0; G:=0; B:=0;
     wys:=tab[x+1,y+1];
     if wys<=0 then
      Begin
       pomR:=((255/minnie)*wys);
       pomR:=255-(pomR*(155/255));
       pomV:=pomR;
       B:=pomV;
      end;
     if (wys>0) and (wys<=maxzie) then
      Begin
       pomR:=(255/(maxzie-minzie))*wys;
       pomV:=pomR;
       G:=pomV;
      end;
     if (wys>=minzol) and (wys<maxzol) then
      Begin
       pomR:=(255/(minzol+(maxzol-minzol)))*wys;
       pomV:=pomR;
       G:=pomV;
       R:=pomV;
      end;
     if (wys>=mincze) and (wys<maxcze) then
      Begin
       pomR:=((255/(mincze+(maxcze-mincze)))*wys);
       pomR:=255-(pomR*(155/255));
       pomV:=pomR;
       R:=pomV;
      end;
     kolor:=RGB(R,G,B);
     Image1.Canvas.Brush.Color:=kolor;
     xp:=x*wielkoscx; yp:=y*wielkoscx;
     Image1.Canvas.Rectangle(xp,yp,xp+wielkoscx,yp+wielkoscx);
    end;
  end;

end;

procedure TModyfik.FormShow(Sender: TObject);
begin
 Odswiez;
end;

procedure TModyfik.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
Var
 tx, ty: integer;
 kolor : TColor;
 RGBl, R, G, B : integer;
begin
 odswiez;
 tx:=(x div wielkoscx)+1;
 ty:=(y div wielkoscx)+1;
 Label2.Caption:=IntToStr(tab[tx,ty]);
 xm:=tx; ym:=ty;
 RGBl:=Image1.Canvas.Pixels[((tx-1)*wielkoscx)+2,((ty-1)*wielkoscx)+2];
     R := GetRValue(RGBl);
     G := GetGValue(RGBl);
     B := GetBValue(RGBl);
 R:=255-R;
 G:=255-G;
 B:=255-B;
 kolor:=RGB(R,G,B);
 Image1.Canvas.Brush.Color:=kolor;
 Image1.Canvas.Rectangle((tx-1)*wielkoscx,(ty-1)*wielkoscx,((tx-1)*wielkoscx)+wielkoscx,((ty-1)*wielkoscx)+wielkoscx);
 if przycisk='lewy' then tab[xm,ym]:=StrToInt(stala);
 Label5.Caption:='('+IntToStr(xm)+';'+IntToStr(ym)+')';
 Label2.Caption:=IntToStr(tab[xm,ym]);
end;

procedure TModyfik.Image1Click(Sender: TObject);
Var
 wart : integer;
begin
if (RadioButton1.Checked) and (stala<>'-') then
 Begin
  tab[xm,ym]:=StrToInt(stala);
 end;
if RadioButton2.Checked then
 Begin
  wart:=StrToInt(Edit2.Text);
  tab[xm,ym]:=tab[xm,ym]-wart;
 end;
if RadioButton3.Checked then
 Begin
  wart:=StrToInt(Edit3.Text);
  tab[xm,ym]:=tab[xm,ym]+wart;
 end;
if RadioButton4.Checked then
 Begin
  Label3.Caption:='('+IntToStr(xm)+';'+IntToStr(ym)+')';
  Label8.Caption:=IntToStr(tab[xm,ym]);
  Edit1.Text:=IntToStr(tab[xm,ym]);
  zx:=xm; zy:=ym;
 end;
end;

procedure TModyfik.SpeedButton1Click(Sender: TObject);
begin
tab[zx,zy]:=StrToInt(Edit1.Text);
Odswiez;
end;

procedure TModyfik.SpeedButton2Click(Sender: TObject);
Var
 x,y : integer;
begin
if czy_wczytany then
Begin
 for y:=1 to zakresx do
  Begin
   for x:=1 to zakresx do
    Begin
     Aglowne.Zmien_wysokosc(xt+x-1,yt+y-1,tab[x,y]);
    end;
  end;
  AGlowne.Wywietlcyfrowy1Click(Self);
end
else ShowMessage('Musisz najpierw wskazaæ i zmodyfikowaæ obszar!');
end;

procedure TModyfik.FormCreate(Sender: TObject);
begin
stala:='-';
przycisk:='zaden';
czy_wczytany:=False;
end;

procedure TModyfik.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var
 kolor : TColor;
 wys, R, G, B : integer;
 pomR : Real;
 pomV : Variant;
begin
if RadioButton1.Checked then
 Begin
  if Button=mbRight then
   Begin
    stwartL.Caption:=IntToStr(tab[xm,ym]);
    stala:=IntToStr(tab[xm,ym]);
    R:=0; G:=0; B:=0;
     wys:=tab[xm,ym];
     if wys<=0 then
      Begin
       pomR:=((255/minnie)*wys);
       pomR:=255-(pomR*(155/255));
       pomV:=pomR;
       B:=pomV;
      end;
     if (wys>0) and (wys<=maxzie) then
      Begin
       pomR:=(255/(maxzie-minzie))*wys;
       pomV:=pomR;
       G:=pomV;
      end;
     if (wys>=minzol) and (wys<maxzol) then
      Begin
       pomR:=(255/(minzol+(maxzol-minzol)))*wys;
       pomV:=pomR;
       G:=pomV;
       R:=pomV;
      end;
     if (wys>=mincze) and (wys<maxcze) then
      Begin
       pomR:=((255/(mincze+(maxcze-mincze)))*wys);
       pomR:=255-(pomR*(155/255));
       pomV:=pomR;
       R:=pomV;
      end;
     kolor:=RGB(R,G,B);
    Panel4.Color:=kolor;
   end;
  //======================================================
  if Button=mbLeft then
   Begin
    przycisk:='lewy';
   end;
 end
end;

procedure TModyfik.RadioButton1Click(Sender: TObject);
begin
if RadioButton1.Checked then Panel4.Color:=clBtnFace;
end;

procedure TModyfik.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
przycisk:='zaden';
end;

end.
