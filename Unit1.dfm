object Loteria: TLoteria
  Left = 365
  Top = 158
  Width = 1057
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
  object btGerar: TButton
    Left = 264
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Gerar html'
    TabOrder = 2
    OnClick = btGerarClick
  end
  object mmLog: TRichEdit
    Left = 8
    Top = 40
    Width = 505
    Height = 673
    HideScrollBars = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  object cbLocal: TCheckBox
    Left = 16
    Top = 8
    Width = 97
    Height = 17
    Caption = 'home'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = cbLocalClick
  end
  object mmx: TRichEdit
    Left = 528
    Top = 40
    Width = 505
    Height = 673
    HideScrollBars = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 5
    WordWrap = False
  end
end
