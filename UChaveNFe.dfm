object FChaveNfe: TFChaveNfe
  Left = 361
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Chave de Acesso NFe'
  ClientHeight = 223
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 107
      Height = 13
      Caption = 'Chave de Acesso NFe'
    end
    object EdtChaveNfe: TEdit
      Left = 8
      Top = 28
      Width = 361
      Height = 21
      MaxLength = 44
      TabOrder = 0
      OnKeyPress = SomenteNumeros
    end
    object BitBtn1: TBitBtn
      Left = 465
      Top = 26
      Width = 184
      Height = 25
      Caption = 'Quebrar Chave nos Campos Abaixo'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 380
      Top = 26
      Width = 75
      Height = 25
      Caption = 'Calcular DV'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 652
    Height = 166
    Align = alClient
    TabOrder = 1
    object Label9: TLabel
      Left = 496
      Top = 79
      Width = 15
      Height = 13
      Caption = 'DV'
    end
    object Label8: TLabel
      Left = 326
      Top = 79
      Width = 159
      Height = 13
      Caption = 'Codigo NFe (gerado pelo sistema)'
    end
    object Label7: TLabel
      Left = 174
      Top = 79
      Width = 60
      Height = 13
      Caption = 'Numero NFe'
    end
    object Label6: TLabel
      Left = 8
      Top = 79
      Width = 47
      Height = 13
      Caption = 'Serie NFe'
    end
    object Label5: TLabel
      Left = 496
      Top = 17
      Width = 58
      Height = 13
      Caption = 'Modelo NFe'
    end
    object Label4: TLabel
      Left = 326
      Top = 17
      Width = 71
      Height = 13
      Caption = 'CNPJ Emitente'
    end
    object Label3: TLabel
      Left = 174
      Top = 17
      Width = 128
      Height = 13
      Caption = 'Ano e Mes Emissao AAMM'
    end
    object Label2: TLabel
      Left = 8
      Top = 17
      Width = 69
      Height = 13
      Caption = 'Codigo Estado'
    end
    object Label10: TLabel
      Left = 136
      Top = 37
      Width = 18
      Height = 16
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit8: TEdit
      Left = 496
      Top = 98
      Width = 121
      Height = 21
      MaxLength = 1
      TabOrder = 7
      OnKeyPress = SomenteNumeros
    end
    object Edit7: TEdit
      Left = 326
      Top = 98
      Width = 121
      Height = 21
      MaxLength = 9
      TabOrder = 6
      OnKeyPress = SomenteNumeros
    end
    object Edit6: TEdit
      Left = 174
      Top = 98
      Width = 121
      Height = 21
      MaxLength = 9
      TabOrder = 5
      OnKeyPress = SomenteNumeros
    end
    object Edit5: TEdit
      Left = 8
      Top = 98
      Width = 121
      Height = 21
      MaxLength = 3
      TabOrder = 4
      OnKeyPress = SomenteNumeros
    end
    object Edit4: TEdit
      Left = 496
      Top = 35
      Width = 121
      Height = 21
      MaxLength = 2
      TabOrder = 3
      OnKeyPress = SomenteNumeros
    end
    object Edit3: TEdit
      Left = 326
      Top = 35
      Width = 121
      Height = 21
      MaxLength = 14
      TabOrder = 2
      OnKeyPress = SomenteNumeros
    end
    object Edit2: TEdit
      Left = 174
      Top = 35
      Width = 121
      Height = 21
      MaxLength = 4
      TabOrder = 1
      OnKeyPress = SomenteNumeros
    end
    object Edit1: TEdit
      Left = 8
      Top = 35
      Width = 121
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnExit = Edit1Exit
      OnKeyPress = SomenteNumeros
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 136
      Width = 109
      Height = 25
      Caption = 'Calcular Chave NFe'
      TabOrder = 8
      OnClick = BitBtn3Click
    end
  end
end
