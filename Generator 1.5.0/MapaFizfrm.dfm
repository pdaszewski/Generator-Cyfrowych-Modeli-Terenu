object MapaFiz: TMapaFiz
  Left = 786
  Top = 177
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Mapa fizyczna'
  ClientHeight = 153
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 105
    Height = 105
    AutoSize = True
    OnMouseMove = Image1MouseMove
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 134
    Width = 254
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 60
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Width = 100
      end>
  end
end
