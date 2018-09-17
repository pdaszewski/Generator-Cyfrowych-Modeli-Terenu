unit MapaCfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Menus;

type
  TMapaCyfr = class(TForm)
    Image1: TImage;
    StatusBar1: TStatusBar;
    PaintBox1: TPaintBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapaCyfr: TMapaCyfr;
  maxnie, minnie : integer;
  maxzie, minzie : integer;
  maxzol, minzol : integer;
  maxcze, mincze : integer;
  xm, ym : integer;

implementation

uses Glowne, Zakresfrm, Modyfikfrm;

{$R *.dfm}

procedure TMapaCyfr.FormShow(Sender: TObject);
begin
//------------------------------------
 maxnie:=0;
 minnie:=StrToInt(Zakres.Minni.Text);

 maxzie:=StrToInt(Zakres.Maxzi.Text);
 minzie:=0;

 maxzol:=StrToInt(Zakres.Maxzo.Text);
 minzol:=maxzie;

 maxcze:=StrToInt(Zakres.Maxcz.Text);
 mincze:=maxzol;
 //------------------------------------
 PaintBox1.Width:=Image1.Width;
 PaintBox1.Height:=Image1.Height;
end;

procedure TMapaCyfr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AGlowne.Mapacyfrowa1.Checked:=False;
end;

procedure TMapaCyfr.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 StatusBar1.Panels[0].Text:='('+IntToSTr(x)+';'+IntToStr(y)+')';
 StatusBar1.Panels[1].Text:='Wysokoœæ: '+IntToStr(AGlowne.Wysokosc(x,y));

 if (AGlowne.Wysokosc(x,y)>=minnie) and (AGlowne.Wysokosc(x,y)<=maxnie) then
 StatusBar1.Panels[2].Text:='Depresje';
 if (AGlowne.Wysokosc(x,y)>=minzie) and (AGlowne.Wysokosc(x,y)<=maxzie) then
 StatusBar1.Panels[2].Text:='Niziny';
 if (AGlowne.Wysokosc(x,y)>=minzol) and (AGlowne.Wysokosc(x,y)<=maxzol) then
 StatusBar1.Panels[2].Text:='Wy¿yny';
 if (AGlowne.Wysokosc(x,y)>=mincze) and (AGlowne.Wysokosc(x,y)<=maxcze) then
 StatusBar1.Panels[2].Text:='Góry';

 if AGlowne.modyfikacja<>0 then
  Begin
   PaintBox1.Refresh;
   PaintBox1.Canvas.Rectangle(x,y,x-AGlowne.modyfikacja,y-AGlowne.modyfikacja);
  end;

 xm:=x-AGlowne.modyfikacja; ym:=y-AGlowne.modyfikacja;  
end;

procedure TMapaCyfr.PaintBox1Click(Sender: TObject);
begin
if AGlowne.modyfikacja<>0 then
  Begin
   Modyfik.wys(maxnie,maxzie,maxzol,maxcze);
   Modyfik.wsp(xm,ym);
   Modyfik.Show;
   Modyfik.odswiez;
  end;
end;

end.
