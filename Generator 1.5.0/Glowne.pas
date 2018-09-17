unit Glowne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Gauges, ComCtrls, ShellAPI;

type tabwys = record
     kolor : integer;
     wysokosc : integer;
     end;

type
  TAGlowne = class(TForm)
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    Otwrz1: TMenuItem;
    N1: TMenuItem;
    Zamknij1: TMenuItem;
    OpenFizyczna: TOpenDialog;
    StatusBar1: TStatusBar;
    Analiza: TMenuItem;
    Wywietlcyfrowy1: TMenuItem;
    Widok1: TMenuItem;
    Mapafizyczna1: TMenuItem;
    Mapacyfrowa1: TMenuItem;
    Pomoc1: TMenuItem;
    Oprogramie1: TMenuItem;
    Skalawysokoci1: TMenuItem;
    N3: TMenuItem;
    Przeliczwysokosco1: TMenuItem;
    Zakresskali1: TMenuItem;
    Widok3D1: TMenuItem;
    Otwrzplikmapycyfrowej1: TMenuItem;
    Zapiszmapcyfrow1: TMenuItem;
    SaveCyfr: TSaveDialog;
    OpenCyfr: TOpenDialog;
    Image1: TImage;
    N2: TMenuItem;
    Wczytajplikzeskalfizyczn1: TMenuItem;
    N4: TMenuItem;
    OpenSkala: TOpenDialog;
    Skalowanie: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Modyfikacja1: TMenuItem;
    Zaznaczobszarmodyfikacji1: TMenuItem;
    Modyfikujobszar20x201: TMenuItem;
    Modyfikujobszar40x401: TMenuItem;
    AutoRun: TTimer;
    procedure Zamknij1Click(Sender: TObject);
    procedure Otwrz1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Mapafizyczna1Click(Sender: TObject);
    procedure Skalawysokoci1Click(Sender: TObject);
    procedure Oblicz_skale;
    procedure Wyp_tab_kol;
    function z_tab_wys(ktory : integer):integer;
    procedure do_tab_wys(ktory: integer; wys:integer);
    procedure Przeliczwysokosco1Click(Sender: TObject);
    procedure Zakresskali1Click(Sender: TObject);
    function Wysokosc(x,y : integer):integer;
    procedure Zmien_wysokosc(x,y,wys : integer);
    procedure Wywietlcyfrowy1Click(Sender: TObject);
    procedure Mapacyfrowa1Click(Sender: TObject);
    procedure Widok3D1Click(Sender: TObject);
    procedure Zapiszmapcyfrow1Click(Sender: TObject);
    procedure Otwrzplikmapycyfrowej1Click(Sender: TObject);
    procedure Oprogramie1Click(Sender: TObject);
    procedure Wczytajplikzeskalfizyczn1Click(Sender: TObject);
    procedure SkalowanieClick(Sender: TObject);
    procedure Przypisz_skale(wart : real);
    function modyfikacja:integer;
    procedure Zaznaczobszarmodyfikacji1Click(Sender: TObject);
    procedure Modyfikujobszar20x201Click(Sender: TObject);
    procedure Modyfikujobszar40x401Click(Sender: TObject);
    procedure AutoRunTimer(Sender: TObject);
  private
  public
  const
   wersja = '1.5.0';
  end;

var
  AGlowne: TAGlowne;
  tabcyf : array of array of integer;
  wmapy, hmapy : integer;
  czyFiz, czyCyfr : boolean;
  tab_kol : array[1..17] of tabwys;
  maxnie, minnie : integer;
  maxzie, minzie : integer;
  maxzol, minzol : integer;
  maxcze, mincze : integer;
  skala : real;
  plik : string;
  modyf : integer;
  okienko3d: THandle;
  
implementation

uses MapaFizfrm, Postepfrm, MapaCfrm, SkalaWfrm, Zakresfrm,
  Oprogziefrm, SkalaFizycznafrm, Linijkafrm, Modyfikfrm;

{$R *.dfm}

procedure TAGlowne.Zmien_wysokosc(x,y,wys : integer);
Begin
 tabcyf[x,y]:=wys;
end;

Function TAGlowne.modyfikacja:Integer;
Begin
 modyfikacja:=modyf;
end;

Procedure TAGlowne.Przypisz_skale(wart : real);
Begin
skala:=wart;
end;

function TAGlowne.Wysokosc(x,y : integer):integer;
Begin
 Wysokosc:=tabcyf[x,y];
end;

procedure TAGlowne.AutoRunTimer(Sender: TObject);
begin
 AutoRun.Enabled:=False;
 AGlowne.WindowState:=wsMaximized;
end;

procedure TAGlowne.do_tab_wys(ktory: integer; wys:integer);
Begin
 tab_kol[ktory].wysokosc:=wys;
end;

function TAGlowne.z_tab_wys(ktory : integer):integer;
Begin
 z_tab_wys:=tab_kol[ktory].wysokosc;
end;

procedure TAGlowne.Wyp_tab_kol;
Var
 i : integer;
Begin
tab_kol[1].kolor:=ColorToRGB(RGB(155,0,0));
tab_kol[2].kolor:=ColorToRGB(RGB(175,0,0));
tab_kol[3].kolor:=ColorToRGB(RGB(200,0,0));
tab_kol[4].kolor:=ColorToRGB(RGB(220,0,0));
tab_kol[5].kolor:=ColorToRGB(RGB(255,0,0));

tab_kol[6].kolor:=ColorToRGB(RGB(155,155,0));
tab_kol[7].kolor:=ColorToRGB(RGB(175,175,0));
tab_kol[8].kolor:=ColorToRGB(RGB(210,210,0));
tab_kol[9].kolor:=ColorToRGB(RGB(255,255,0));

tab_kol[10].kolor:=ColorToRGB(RGB(0,255,0));
tab_kol[11].kolor:=ColorToRGB(RGB(0,210,0));
tab_kol[12].kolor:=ColorToRGB(RGB(0,175,0));
tab_kol[13].kolor:=ColorToRGB(RGB(0,155,0));

tab_kol[14].kolor:=ColorToRGB(RGB(0,0,255));
tab_kol[15].kolor:=ColorToRGB(RGB(0,0,210));
tab_kol[16].kolor:=ColorToRGB(RGB(0,0,175));
tab_kol[17].kolor:=ColorToRGB(RGB(0,0,155));
//----------------------------------
for i:=1 to 17 do
 Begin
  tab_kol[i].wysokosc:=0;
 end;
//----------------------------------
tab_kol[1].wysokosc:=Maxcze;
tab_kol[2].wysokosc:=Mincze + (4*((Maxcze - Mincze) div 6));
tab_kol[3].wysokosc:=Mincze + (3*((Maxcze - Mincze) div 6));
tab_kol[4].wysokosc:=Mincze + (2*((Maxcze - Mincze) div 6));
tab_kol[5].wysokosc:=Mincze + ((Maxcze - Mincze) div 6);
tab_kol[6].wysokosc:=Maxzol;
tab_kol[7].wysokosc:=Minzol + (3*((Maxzol - Minzol) div 5));
tab_kol[8].wysokosc:=Minzol + (2*((Maxzol - Minzol) div 5));
tab_kol[9].wysokosc:=Minzol + ((Maxzol - Minzol) div 5);
tab_kol[10].wysokosc:=Maxzie;
tab_kol[11].wysokosc:=Minzie + (3*((Maxzie - Minzie) div 5));
tab_kol[12].wysokosc:=Minzie + (2*((Maxzie - Minzie) div 5));
tab_kol[13].wysokosc:=Minzie + ((Maxzie - Minzie) div 5);
tab_kol[14].wysokosc:=0;
tab_kol[15].wysokosc:=0 + (Minnie div 4);
tab_kol[16].wysokosc:=0 + (2*(Minnie div 4));
tab_kol[17].wysokosc:=Minnie;
//----------------------------------
end;

procedure TAGlowne.Oblicz_skale;
Var
 kolor, i : integer;
Begin
 for i:=0 to 17 do
  Begin
   kolor:=tab_kol[i+1].kolor;
   Skalaw.Image1.Canvas.Pen.Color:=kolor;
   Skalaw.Image1.Canvas.Brush.Color:=kolor;
   Skalaw.Image1.Canvas.Rectangle(0,(i*20),50,((i*20)+20));
  end;
end;

procedure TAGlowne.Zamknij1Click(Sender: TObject);
begin
Close;
end;

procedure TAGlowne.Otwrz1Click(Sender: TObject);
begin
If OpenFizyczna.Execute then
 Begin
  MapaFiz.Image1.Picture.LoadFromFile(OpenFizyczna.FileName);
  MapaFiz.Caption:='Mapa fizyczna: '+OpenFizyczna.FileName;
  MapaFiz.Show;
  MapaFiz.StatusBar1.Visible:=False;
  MapaFiz.StatusBar1.Visible:=true;
  MapaFiz.Left:=MapaFiz.Left+1;
  Analiza.Enabled:=True;
  czyFiz:=True;
  Zakres.Show;
  LinijkaSkali.Show;
  Wczytajplikzeskalfizyczn1.Enabled:=True;
  
  Mapafizyczna1.Checked:=True;
  Zakresskali1.Checked:=True;
  Skalowanie.Checked:=True;
 end;
end;

procedure TAGlowne.FormCreate(Sender: TObject);
Var
kolor, R, G, B : integer;
begin
Caption:='FX Systems - Ganerator Cyfrowych Modeli Terenu - wersja: '+wersja;
modyf:=0;
skala:=-1;
Wczytajplikzeskalfizyczn1.Enabled:=False;
Wywietlcyfrowy1.Enabled:=False;
Modyfikacja1.Enabled:=False;
czyFiz:=False;
czyCyfr:=False;
Analiza.Enabled:=False;
Zapiszmapcyfrow1.Enabled:=False;
plik:='brak';

R:=224;
G:=223;
B:=227;
kolor:=RGB(R,G,B);
AGlowne.Color:=kolor;
Image1.Picture.LoadFromFile(Extractfilepath(application.ExeName)+'Dane\Tlov2.jpg');
end;

procedure TAGlowne.Mapafizyczna1Click(Sender: TObject);
begin
if czyFiz=true then
 Begin
  if MapaFiz.Showing then
   Begin
    Mapafizyczna1.Checked:=False;
    MapaFiz.Hide;
   end
  else
   Begin
    Mapafizyczna1.Checked:=True;
    MapaFiz.Show;
   end;
 end
else ShowMessage('Okno mapy fizcznej niedostêpne!');
end;

procedure TAGlowne.Skalawysokoci1Click(Sender: TObject);
begin
if czyCyfr=true then
 Begin
  if skalaw.Showing then
   Begin
    Skalawysokoci1.Checked:=False;
    skalaw.Hide;
   end
  else
   Begin
    Skalawysokoci1.Checked:=True;
    skalaw.Show;
   end;
 end
else ShowMessage('Okno skali wysokoœci niedostêpne!'); 
end;

procedure TAGlowne.Przeliczwysokosco1Click(Sender: TObject);
const
  RConst = 77;
  GConst = 150;
  BConst = 29;
Var
 x, y, w, h : integer;
 pom : integer;
 pomR : real;
 pomV : variant;
 RGBl : Integer;
 R,G,B, R2: Integer;
 opis : string[3];
 wysokosc : integer;
begin
if (skala<>-1) and (Zakres.Minni.Text<>'0') and (Zakres.Maxzi.Text<>'0')
               and (Zakres.Maxzo.Text<>'0') and (Zakres.Maxcz.Text<>'0') then
BEGIN
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
 Postep.Show;
 w:=MapaFiz.Image1.Width;
 h:=MapaFiz.Image1.Height;
 wmapy:=w;
 hmapy:=h;
 Postep.Gauge1.MaxValue:=(w-1)*(h-1);
 Postep.Gauge1.Progress:=1;
 SetLength(tabcyf,w+1,h+1);
 for y:=0 to h-1 do
  Begin
   for x:=0 to w-1 do
    Begin
     RGBl:=Mapafiz.Image1.Canvas.Pixels[x,y];
     R := GetRValue(RGBl);
     G := GetGValue(RGBl);
     B := GetBValue(RGBl);
      //---------------------------------------------
      if (B>R) and (B>G) then opis:='nie';
      if (G>R) and (G>B) then opis:='zie';
      if (R>B) and (R>G) then opis:='cze';
        pom:=R-G;
        if pom<0 then pom:=-pom;
      if (R>B) and (pom<20) then opis:='zol';
     //---------------------------------------------
     R2:=((R*RConst + G*GConst + B*BConst) shr 8);

     Postep.Gauge1.Progress:=Postep.Gauge1.Progress+1;

     wysokosc:=0;
     //----------------------------------------------
     if opis='nie' then
      Begin
       pomR:=(minnie-maxnie)/255;
       pomR:=pomR*(255-R2);
       pomV:=pomR;
       pom:=pomV;
       wysokosc:=pom;
      end;
     //----------------------------------------------
     if opis='zie' then
      Begin
       pomR:=(maxzie-minzie)/255;
       pomR:=pomR*R2;
       pomV:=pomR;
       pom:=pomV;
       wysokosc:=pom;
      end;
     //----------------------------------------------
     if opis='zol' then
      Begin
       pomR:=(maxzol-minzol)/255;
       pomR:=minzol+(pomR*R2);
       pomV:=pomR;
       pom:=pomV;
       wysokosc:=pom;
      end;
     //----------------------------------------------
     if opis='cze' then
      Begin
       pomR:=(maxcze-mincze)/255;
       pomR:=mincze+(pomR*(255-R2));
       pomV:=pomR;
       pom:=pomV;
       wysokosc:=pom;
      end;
     //----------------------------------------------
     tabcyf[x+1,y+1]:=wysokosc;
    end;
  end;
Wywietlcyfrowy1.Enabled:=True;
Postep.Hide;
//-------------------------------------
Wywietlcyfrowy1Click(Self);
Zapiszmapcyfrow1.Enabled:=True;
Wyp_tab_kol;
Skalaw.Show;
Oblicz_skale;
Modyfikacja1.Enabled:=True;
END
else
 Begin
  //=====================================================
  if skala=-1 then
   Begin
    LinijkaSkali.Show;
    ShowMessage('B³¹d! By przeanalizowaæ wysokoœci nale¿y wyskalowaæ mapê!');
   end;
  //=====================================================
  if (Zakres.Minni.Text='0') or (Zakres.Maxzi.Text='0') or (Zakres.Maxzo.Text='0') or (Zakres.Maxcz.Text='0') then
   Begin
    Zakres.Show;
    ShowMessage('B³¹d! By przeanalizowaæ wysokoœci nale¿y okreœliæ ich zakresy!'); 
   end;
  //=====================================================
 end;
end;

procedure TAGlowne.Zakresskali1Click(Sender: TObject);
begin
if czyFiz=true then
 Begin
    if Zakres.Showing then
     Begin
      Zakresskali1.Checked:=False;
      Zakres.Hide;
     end
    else
     Begin
      Zakresskali1.Checked:=True;
      Zakres.Show;
     end;
 end
 else ShowMessage('Okno zakresu skali niedostêpne! Wczytaj mapê fizyczn¹!');
end;

procedure TAGlowne.Wywietlcyfrowy1Click(Sender: TObject);
Var
 x, y, w, h, wys : integer;
 kolor : TColor;
 pomR : Real;
 pomV : Variant;
 R, G, B : integer;
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
 //------------------------------------
 Postep.Show;
 w:=wmapy;
 h:=hmapy;
 MapaCyfr.Image1.Width:=w;
 MapaCyfr.Image1.Height:=h;
 MapaCyfr.Image1.Canvas.Refresh;
 Postep.Gauge1.MaxValue:=(w-1)*(h-1);
 Postep.Gauge1.Progress:=1;
 for y:=0 to h-1 do
  Begin
   for x:=0 to w-1 do
    Begin
     wys:=wysokosc(x+1,y+1);
     R:=0;
     G:=0;
     B:=0;
     if wys<0 then
      Begin
       pomR:=((255/minnie)*wys);
       pomR:=255-(pomR*(155/255));
       pomV:=pomR;
       B:=pomV;
      end;
     if (wys>=minzie) and (wys<maxzie) then
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
     MapaCyfr.Image1.Canvas.Pixels[x,y]:=kolor;
     Postep.Gauge1.Progress:=Postep.Gauge1.Progress+1;
    end;
  end;

Postep.Hide;
czyCyfr:=True;
MapaCyfr.Show;
MapaCyfr.StatusBar1.Visible:=False;
MapaCyfr.StatusBar1.Visible:=True;
MapaCyfr.Left:=MapaCyfr.Left+1;   //Odswieza po wczytaniu (blad refresh)
Mapacyfrowa1.Checked:=True;
end;

procedure TAGlowne.Mapacyfrowa1Click(Sender: TObject);
begin
if czyCyfr=true then
 Begin
  if MapaCyfr.Showing then
   Begin
    Mapacyfrowa1.Checked:=False;
    MapaCyfr.Hide;
   end
  else
   Begin
    Mapacyfrowa1.Checked:=True;
    MapaCyfr.Show;
   end;
 end
else ShowMessage('Okno mapy cyfrowej niedostêpne!');
end;

procedure TAGlowne.Widok3D1Click(Sender: TObject);
Var
sciezka : string;
begin
if czyCyfr=true then
 Begin
    if plik='brak' then ShowMessage('Musisz zapisac mapê cyfrow¹, by odl¹daæ projekt w przestrzeni!')
    else
     Begin
      sciezka:=Extractfilepath(application.ExeName)+'Widok3D.exe';
      okienko3d:=ShellExecute(Handle,'open',PWideChar(sciezka),PWideChar(''''+plik+''''),nil,sw_showNormal);
     end;
 end
else ShowMessage('Okno wizualizacji przestrzennej niedostêpne!');

end;

procedure TAGlowne.Zapiszmapcyfrow1Click(Sender: TObject);
Var
 x, y, th, tw : integer;
 plikcyf : TextFile;
begin
if SaveCyfr.Execute then
 Begin
  plik:=SaveCyfr.FileName;
  tw:=wmapy;
  th:=hmapy;
  AssignFile(plikcyf,plik);
  Rewrite(plikcyf);
   //-------------------------------
   Writeln(plikcyf,th);
   Writeln(plikcyf,tw);
   Writeln(plikcyf,skala);
   Writeln(plikcyf,Minnie);
   Writeln(plikcyf,Maxnie);
   Writeln(plikcyf,Minzie);
   Writeln(plikcyf,Maxzie);
   Writeln(plikcyf,Minzol);
   Writeln(plikcyf,Maxzol);
   Writeln(plikcyf,Mincze);
   Writeln(plikcyf,Maxcze);
   //-------------------------------
   for y:=0 to th-1 do
    Begin
     for x:=0 to tw-1 do
      Begin
       Writeln(plikcyf,tabcyf[x,y]);
      end;
    end;
   //-------------------------------
  CloseFile(plikcyf);
 end;
end;

procedure TAGlowne.Otwrzplikmapycyfrowej1Click(Sender: TObject);
Var
 plikcyf : TextFile;
 x, y, wys, w, h : integer;
begin
if OpenCyfr.Execute then
 Begin
  LinijkaSkali.Hide;
  Zakres.Hide;
  MapaFiz.Hide;
  SkalaFizyczna.Hide;
  //------------------------------------
  plik:=OpenCyfr.FileName;
  AssignFile(plikcyf,plik);
  Reset(plikcyf);
   Readln(plikcyf,h);
   Readln(plikcyf,w);
   Readln(plikcyf,skala);
   Readln(plikcyf,Minnie);
   Readln(plikcyf,Maxnie);
   Readln(plikcyf,Minzie);
   Readln(plikcyf,Maxzie);
   Readln(plikcyf,Minzol);
   Readln(plikcyf,Maxzol);
   Readln(plikcyf,Mincze);
   Readln(plikcyf,Maxcze);

   Zakres.Minni.Text:=IntToStr(MinNie);
   Zakres.Maxzi.Text:=IntToStr(Maxzie);
   Zakres.Maxzo.Text:=IntToStr(MaxZol);
   Zakres.Maxcz.Text:=IntToStr(MaxCze);
   wmapy:=w;
   hmapy:=h;
   SetLength(tabcyf,w+1,h+1);
  Repeat
  for y:=0 to h-1 do
   Begin
    for x:=0 to w-1 do
     Begin
      Readln(plikcyf,wys); 
      tabcyf[x,y]:=wys;
     end;
   end;
   Until eof(plikcyf);
  //-----------------------
  CloseFile(plikcyf);
 //-------------------------------
 Wywietlcyfrowy1Click(Self);
 Zapiszmapcyfrow1.Enabled:=True;
 Wyp_tab_kol;
 Skalaw.Show;
 Oblicz_skale;
 Skalawysokoci1.Checked:=True;
 Modyfikacja1.Enabled:=True;
 end;
end;

procedure TAGlowne.Oprogramie1Click(Sender: TObject);
begin
Oprogzie.Show;
end;

procedure TAGlowne.Wczytajplikzeskalfizyczn1Click(Sender: TObject);
begin
if OpenSkala.Execute then
 Begin
  SkalaFizyczna.Image1.Picture.LoadFromFile(OpenSkala.FileName);
  SkalaFizyczna.Show;
 end;
end;

procedure TAGlowne.SkalowanieClick(Sender: TObject);
begin
if czyFiz=true then
 Begin
    if LinijkaSkali.Showing then
     Begin
      Skalowanie.Checked:=False;
      LinijkaSkali.Hide;
     end
    else
     Begin
      Skalowanie.Checked:=True;
      LinijkaSkali.Show;
     end;
 end
else ShowMessage('Okno Linijki Skali niedostêpne! Wczytaj mapê fizyczn¹!');

end;

procedure TAGlowne.Zaznaczobszarmodyfikacji1Click(Sender: TObject);
begin
if Zaznaczobszarmodyfikacji1.Checked then
 Begin
  modyf:=0;
  MapaCyfr.PaintBox1.Refresh;
  Zaznaczobszarmodyfikacji1.Checked:=False;
  Modyfik.Hide;
 end
else
 Begin
  modyf:=10;
  Zaznaczobszarmodyfikacji1.Checked:=True;
  Modyfikujobszar20x201.Checked:=False;
  Modyfikujobszar40x401.Checked:=False;
  Modyfik.Ustaw_zakres(10);
  Modyfik.Show;
  Modyfik.odswiez;
 end;
end;

procedure TAGlowne.Modyfikujobszar20x201Click(Sender: TObject);
begin
if Modyfikujobszar20x201.Checked then
 Begin
  modyf:=0;
  MapaCyfr.PaintBox1.Refresh;
  Modyfikujobszar20x201.Checked:=False;
  Modyfik.Hide;
 end
else
 Begin
  modyf:=20;
  Modyfikujobszar20x201.Checked:=True;
  Zaznaczobszarmodyfikacji1.Checked:=False;
  Modyfikujobszar40x401.Checked:=False;
  Modyfik.Ustaw_zakres(20);
  Modyfik.Show;
  Modyfik.odswiez;
 end;
end;

procedure TAGlowne.Modyfikujobszar40x401Click(Sender: TObject);
begin
if Modyfikujobszar40x401.Checked then
 Begin
  modyf:=0;
  MapaCyfr.PaintBox1.Refresh;
  Modyfikujobszar40x401.Checked:=False;
  Modyfik.Hide;
 end
else
 Begin
  modyf:=40;
  Modyfikujobszar40x401.Checked:=True;
  Zaznaczobszarmodyfikacji1.Checked:=False;
  Modyfikujobszar20x201.Checked:=False;
  Modyfik.Ustaw_zakres(40);
  Modyfik.Show;
  Modyfik.odswiez;
 end;
end;

end.
