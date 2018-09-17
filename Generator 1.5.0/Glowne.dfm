object AGlowne: TAGlowne
  Left = 216
  Top = 125
  Caption = 'Generator'
  ClientHeight = 553
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 644
    Top = 0
    Width = 105
    Height = 534
    Align = alRight
    AutoSize = True
    ExplicitLeft = 652
    ExplicitHeight = 544
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 534
    Width = 749
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 544
    Top = 128
    object Plik1: TMenuItem
      Caption = '&Plik'
      object Otwrzplikmapycyfrowej1: TMenuItem
        Caption = 'Otw'#243'rz plik mapy &cyfrowej'
        OnClick = Otwrzplikmapycyfrowej1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Otwrz1: TMenuItem
        Caption = 'Otw'#243'rz plik mapy &fizycznej'
        OnClick = Otwrz1Click
      end
      object Wczytajplikzeskalfizyczn1: TMenuItem
        Caption = 'Wczytaj plik ze skal'#261' fizyczn'#261
        OnClick = Wczytajplikzeskalfizyczn1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Zapiszmapcyfrow1: TMenuItem
        Caption = 'Zapisz map'#281' cyfrow'#261
        OnClick = Zapiszmapcyfrow1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Zamknij1: TMenuItem
        Caption = 'Zamknij'
        OnClick = Zamknij1Click
      end
    end
    object Analiza: TMenuItem
      Caption = '&Analiza cyfrowa'
      object Przeliczwysokosco1: TMenuItem
        Caption = 'Przelicz wysoko'#347'ci'
        OnClick = Przeliczwysokosco1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Wywietlcyfrowy1: TMenuItem
        Caption = 'Wy'#347'wietl cyfrowy'
        OnClick = Wywietlcyfrowy1Click
      end
    end
    object Modyfikacja1: TMenuItem
      Caption = 'Modyfikacja'
      object Zaznaczobszarmodyfikacji1: TMenuItem
        Caption = 'Modyfikuj obszar 10x10'
        OnClick = Zaznaczobszarmodyfikacji1Click
      end
      object Modyfikujobszar20x201: TMenuItem
        Caption = 'Modyfikuj obszar 20x20'
        OnClick = Modyfikujobszar20x201Click
      end
      object Modyfikujobszar40x401: TMenuItem
        Caption = 'Modyfikuj obszar 40x40'
        OnClick = Modyfikujobszar40x401Click
      end
    end
    object Widok1: TMenuItem
      Caption = '&Okna'
      object Mapafizyczna1: TMenuItem
        Caption = 'Mapa fizyczna'
        OnClick = Mapafizyczna1Click
      end
      object Mapacyfrowa1: TMenuItem
        Caption = 'Mapa cyfrowa'
        OnClick = Mapacyfrowa1Click
      end
      object Widok3D1: TMenuItem
        Caption = 'Wizualizacja 3D'
        OnClick = Widok3D1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Skalawysokoci1: TMenuItem
        Caption = 'Skala wysoko'#347'ci'
        OnClick = Skalawysokoci1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Zakresskali1: TMenuItem
        Caption = 'Zakres skali'
        OnClick = Zakresskali1Click
      end
      object Skalowanie: TMenuItem
        Caption = 'Skalowanie mapy'
        OnClick = SkalowanieClick
      end
    end
    object Pomoc1: TMenuItem
      Caption = 'Po&moc'
      object Oprogramie1: TMenuItem
        Caption = 'O programie...'
        OnClick = Oprogramie1Click
      end
    end
  end
  object OpenFizyczna: TOpenDialog
    DefaultExt = '*.bmp'
    Filter = 'Pliki bitowe (*.bmp)|*.bmp'
    Left = 16
    Top = 8
  end
  object SaveCyfr: TSaveDialog
    DefaultExt = '*.cgen'
    Filter = 'Pliki map cyfrowych GEN (*.cgen)|*.cgen'
    Left = 80
    Top = 128
  end
  object OpenCyfr: TOpenDialog
    DefaultExt = '*.cgen'
    Filter = 'Pliki map cyfrowych GEN (*.cgen)|*.cgen'
    Left = 40
    Top = 128
  end
  object OpenSkala: TOpenDialog
    DefaultExt = '*.bmp'
    Filter = 
      'Pliki bitowe (*.bmp)|*.bmp|Pliki skompresowane JPEG (*.jpg)|*.jp' +
      'g'
    Left = 48
    Top = 8
  end
  object AutoRun: TTimer
    OnTimer = AutoRunTimer
    Left = 264
    Top = 224
  end
end
