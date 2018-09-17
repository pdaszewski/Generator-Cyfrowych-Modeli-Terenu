unit Zakresfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  TZakres = class(TForm)
    Image1: TImage;
    Maxcz: TEdit;
    Maxzo: TEdit;
    Maxzi: TEdit;
    Minni: TEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Zakres: TZakres;

implementation

uses Glowne;

{$R *.dfm}

procedure TZakres.SpeedButton1Click(Sender: TObject);
begin
if (Maxcz.Text='0') or (Maxzo.Text='0') or (Maxzi.Text='0') or (Minni.Text='0')
then ShowMessage('B³¹d! Nale¿y okreœliæ zakresy wysokoœci dla wszystkich poziomów terenu!')
else
 Begin
   if StrToInt(Minni.Text)>0 then ShowMessage('B³¹d! Poni¿ej poziomu 0 wartoœæ musi byæ ujemna!')
   else
    Begin
     AGlowne.Wywietlcyfrowy1.Enabled:=False;
     Close;
    end;// jesli poziom niebiebieskiego nie jest ujemny
 end;  
end;

procedure TZakres.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AGlowne.Zakresskali1.Checked:=False;
end;

end.
