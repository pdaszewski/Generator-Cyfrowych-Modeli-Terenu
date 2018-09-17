program Generator;

uses
  Forms,
  Glowne in 'Glowne.pas' {AGlowne},
  MapaFizfrm in 'MapaFizfrm.pas' {MapaFiz},
  Postepfrm in 'Postepfrm.pas' {Postep},
  MapaCfrm in 'MapaCfrm.pas' {MapaCyfr},
  SkalaWfrm in 'SkalaWfrm.pas' {Skalaw},
  Zakresfrm in 'Zakresfrm.pas' {Zakres},
  Oprogziefrm in 'Oprogziefrm.pas' {Oprogzie},
  SkalaFizycznafrm in 'SkalaFizycznafrm.pas' {SkalaFizyczna},
  Linijkafrm in 'Linijkafrm.pas' {LinijkaSkali},
  Modyfikfrm in 'Modyfikfrm.pas' {Modyfik};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Generator Map Cyfrowych';
  Application.CreateForm(TAGlowne, AGlowne);
  Application.CreateForm(TMapaFiz, MapaFiz);
  Application.CreateForm(TPostep, Postep);
  Application.CreateForm(TMapaCyfr, MapaCyfr);
  Application.CreateForm(TSkalaw, Skalaw);
  Application.CreateForm(TZakres, Zakres);
  Application.CreateForm(TOprogzie, Oprogzie);
  Application.CreateForm(TSkalaFizyczna, SkalaFizyczna);
  Application.CreateForm(TLinijkaSkali, LinijkaSkali);
  Application.CreateForm(TModyfik, Modyfik);
  Application.Run;
end.
