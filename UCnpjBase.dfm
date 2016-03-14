object FCnpjBase: TFCnpjBase
  Left = 407
  Top = 324
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CNPJ Base'
  ClientHeight = 169
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 62
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 27
      Height = 13
      Caption = 'CNPJ'
    end
    object DBEdit1: TDBEdit
      Left = 10
      Top = 29
      Width = 121
      Height = 21
      DataField = 'CNPJ'
      DataSource = DSCNPJ
      TabOrder = 0
      OnKeyPress = SomenteNumeros
    end
    object BitBtn1: TBitBtn
      Left = 146
      Top = 25
      Width = 173
      Height = 25
      Caption = 'Quebrar CNPJ nos Campos Abaixo'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 62
    Width = 442
    Height = 107
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 10
      Top = 11
      Width = 54
      Height = 13
      Caption = 'CNPJ Base'
    end
    object Label3: TLabel
      Left = 152
      Top = 11
      Width = 50
      Height = 13
      Caption = 'CNPJ Filial'
    end
    object Label4: TLabel
      Left = 300
      Top = 11
      Width = 45
      Height = 13
      Caption = 'CNPJ DV'
    end
    object DBEdit2: TDBEdit
      Left = 10
      Top = 27
      Width = 121
      Height = 21
      DataField = 'CNPJ_Base'
      DataSource = DSCNPJ
      TabOrder = 0
      OnKeyPress = SomenteNumeros
    end
    object DBEdit3: TDBEdit
      Left = 152
      Top = 27
      Width = 121
      Height = 21
      DataField = 'CNPJ_Filial'
      DataSource = DSCNPJ
      TabOrder = 1
      OnKeyPress = SomenteNumeros
    end
    object DBEdit4: TDBEdit
      Left = 300
      Top = 27
      Width = 121
      Height = 21
      DataField = 'CNPJ_DV'
      DataSource = DSCNPJ
      TabOrder = 2
      OnKeyPress = SomenteNumeros
    end
    object BtnGeraChaveNFe: TBitBtn
      Left = 8
      Top = 70
      Width = 84
      Height = 25
      Caption = 'Calcular CNPJ'
      TabOrder = 3
      OnClick = BtnGeraChaveNFeClick
    end
  end
  object CDSCNPJ: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 120
    Data = {
      8D0000009619E0BD0100000018000000040000000000030000008D0004434E50
      4A0100490000000100055749445448020002000E0009434E504A5F4261736501
      004900000001000557494454480200020008000B434E504A5F46696C69616C01
      0049000000010005574944544802000200040007434E504A5F44560100490000
      0001000557494454480200020002000000}
    object CDSCNPJCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CDSCNPJCNPJ_Base: TStringField
      FieldName = 'CNPJ_Base'
      Size = 8
    end
    object CDSCNPJCNPJ_Filial: TStringField
      FieldName = 'CNPJ_Filial'
      Size = 4
    end
    object CDSCNPJCNPJ_DV: TStringField
      FieldName = 'CNPJ_DV'
      Size = 2
    end
  end
  object DSCNPJ: TDataSource
    DataSet = CDSCNPJ
    Left = 512
    Top = 184
  end
end
