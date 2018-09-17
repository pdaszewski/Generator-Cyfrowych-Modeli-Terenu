object MapaCyfr: TMapaCyfr
  Left = 250
  Top = 256
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Cyfrowa Mapa terenu'
  ClientHeight = 139
  ClientWidth = 321
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 105
    Height = 105
  end
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 105
    Height = 105
    OnClick = PaintBox1Click
    OnMouseMove = PaintBox1MouseMove
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 120
    Width = 321
    Height = 19
    Panels = <
      item
        Width = 60
      end
      item
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Width = 50
      end>
  end
end
