object Loteria: TLoteria
  Left = 365
  Top = 158
  Width = 979
  Height = 563
  Caption = 'Loteria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btBaixar: TButton
    Left = 880
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Baixar'
    TabOrder = 0
    OnClick = btBaixarClick
  end
  object btDescompactar: TButton
    Left = 792
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Descompactar'
    TabOrder = 1
    OnClick = btDescompactarClick
  end
  object brGerar: TButton
    Left = 704
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Gerar html'
    TabOrder = 2
    OnClick = brGerarClick
  end
  object mmLog: TRichEdit
    Left = 8
    Top = 40
    Width = 945
    Height = 473
    HideScrollBars = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
