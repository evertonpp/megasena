object Loteria: TLoteria
  Left = 306
  Top = 97
  Width = 537
  Height = 759
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
    Left = 440
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Baixar'
    TabOrder = 0
    OnClick = btBaixarClick
  end
  object btDescompactar: TButton
    Left = 352
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Descompactar'
    TabOrder = 1
    OnClick = btDescompactarClick
  end
  object mmLog: TRichEdit
    Left = 8
    Top = 40
    Width = 505
    Height = 673
    HideScrollBars = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
  end
  object btnGerar: TButton
    Left = 264
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Gerar htm'
    TabOrder = 3
    OnClick = btnGerarClick
  end
end
