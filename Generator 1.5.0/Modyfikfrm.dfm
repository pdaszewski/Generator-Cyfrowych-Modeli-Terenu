object Modyfik: TModyfik
  Left = 674
  Top = 113
  BorderStyle = bsDialog
  Caption = 'Modyfikacja danych cyfrowych'
  ClientHeight = 465
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 217
    Height = 289
    TabOrder = 0
    object Image1: TImage
      Left = 8
      Top = 8
      Width = 200
      Height = 200
      OnClick = Image1Click
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
      OnMouseUp = Image1MouseUp
    end
    object SpeedButton1: TSpeedButton
      Left = 152
      Top = 256
      Width = 57
      Height = 22
      Caption = 'Zmie'#324
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label3: TLabel
      Left = 96
      Top = 212
      Width = 49
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '(0;0)'
    end
    object Label7: TLabel
      Left = 8
      Top = 232
      Width = 63
      Height = 13
      Caption = 'O wysoko'#347'ci:'
    end
    object Label8: TLabel
      Left = 96
      Top = 232
      Width = 49
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
    end
    object Label9: TLabel
      Left = 8
      Top = 260
      Width = 17
      Height = 13
      Caption = 'Na:'
    end
    object Edit1: TEdit
      Left = 40
      Top = 256
      Width = 65
      Height = 21
      MaxLength = 7
      TabOrder = 0
      Text = '0'
    end
    object RadioButton4: TRadioButton
      Left = 8
      Top = 212
      Width = 89
      Height = 17
      Caption = 'Zmie'#324' punkt:'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 416
    Width = 217
    Height = 41
    TabOrder = 1
    object SpeedButton2: TSpeedButton
      Left = 114
      Top = 8
      Width = 97
      Height = 22
      Caption = 'Zapisz zmiany'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label2: TLabel
      Left = 64
      Top = 4
      Width = 49
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
    end
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 53
      Height = 13
      Caption = 'Wysoko'#347#263':'
    end
    object Label5: TLabel
      Left = 64
      Top = 20
      Width = 49
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '(0;0)'
    end
    object Label6: TLabel
      Left = 8
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Punkt:'
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 304
    Width = 217
    Height = 105
    TabOrder = 2
    object stwartL: TLabel
      Left = 152
      Top = 8
      Width = 49
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 201
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '(prawy klawisz zatwierdza warto'#347#263')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 144
      Top = 45
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Edit3: TEdit
      Left = 144
      Top = 69
      Width = 57
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 8
      Width = 153
      Height = 17
      Caption = 'Zmieniaj na sta'#322#261' warto'#347#263':'
      TabOrder = 2
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 48
      Width = 129
      Height = 17
      Caption = 'Obni'#380' o warto'#347#263':'
      TabOrder = 3
    end
    object RadioButton3: TRadioButton
      Left = 8
      Top = 72
      Width = 129
      Height = 17
      Caption = 'Podwy'#380'sz o warto'#347#263':'
      TabOrder = 4
    end
    object Panel4: TPanel
      Left = 200
      Top = 10
      Width = 10
      Height = 10
      TabOrder = 5
    end
  end
end
