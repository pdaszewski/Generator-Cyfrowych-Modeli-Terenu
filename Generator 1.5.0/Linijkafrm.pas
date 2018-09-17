unit Linijkafrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TLinijkaSkali = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    Image2: TImage;
    Label1: TLabel;
    Image3: TImage;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    Label9: TLabel;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LinijkaSkali: TLinijkaSkali;
  poz, piksle, metry : integer;
implementation

uses Glowne;

{$R *.dfm}

procedure TLinijkaSkali.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft then
 Begin
  ReleaseCapture;
  SendMessage(Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
 end;

end;

procedure TLinijkaSkali.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if (y>60) and (x>11) and (x<459) then
 Begin
  Image2.Left:=x;
  Label3.Left:=x-6;
  poz:=Image2.Left-10;
  Label3.Caption:=IntToStr(poz);
 end;

end;

procedure TLinijkaSkali.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button = mbRight then
 Begin
  Label4.Caption:=IntToStr(poz);
 end;
end;

procedure TLinijkaSkali.SpeedButton1Click(Sender: TObject);
Var
 obliczenie : real;
begin
piksle:=StrToInt(Label4.Caption);
metry:=StrToInt(Edit1.Text);
if metry<0 then
 Begin
  metry:=-1;
  Edit1.Text:=IntToStr(metry);
 end;
if (metry>0) and (piksle>0) then
 Begin
  obliczenie:= metry/piksle;
  AGlowne.Przypisz_skale(obliczenie);
  Close;
  AGlowne.Skalowanie.Checked:=False;
 end
else ShowMessage('B³¹d! Trzeba okreœliæ skalê mapy!');  
end;

procedure TLinijkaSkali.SpeedButton2Click(Sender: TObject);
begin
Close;
AGlowne.Skalowanie.Checked:=False;
end;

end.
