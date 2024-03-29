object FChaveNfe: TFChaveNfe
  Left = 361
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Chave de Acesso NFe'
  ClientHeight = 223
  ClientWidth = 667
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 667
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
    object BtnQuebraChave: TBitBtn
      Left = 465
      Top = 26
      Width = 184
      Height = 25
      Caption = 'Quebrar Chave nos Campos Abaixo'
      TabOrder = 2
      OnClick = BtnQuebraChaveClick
    end
    object BtnCalcDV: TBitBtn
      Left = 380
      Top = 26
      Width = 75
      Height = 25
      Caption = 'Calcular DV'
      TabOrder = 1
      OnClick = BtnCalcDVClick
    end
    object EdtChaveNfe: TDBEdit
      Left = 8
      Top = 28
      Width = 361
      Height = 21
      DataField = 'ChaveNFe'
      DataSource = DsDados
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 667
    Height = 166
    Align = alClient
    TabOrder = 1
    object Label9: TLabel
      Left = 481
      Top = 79
      Width = 15
      Height = 13
      Caption = 'DV'
    end
    object Label8: TLabel
      Left = 306
      Top = 79
      Width = 159
      Height = 13
      Caption = 'Codigo NFe (gerado pelo sistema)'
    end
    object Label7: TLabel
      Left = 8
      Top = 79
      Width = 60
      Height = 13
      Caption = 'Numero NFe'
    end
    object Label6: TLabel
      Left = 576
      Top = 17
      Width = 47
      Height = 13
      Caption = 'Serie NFe'
    end
    object Label5: TLabel
      Left = 481
      Top = 17
      Width = 58
      Height = 13
      Caption = 'Modelo NFe'
    end
    object Label4: TLabel
      Left = 306
      Top = 17
      Width = 71
      Height = 13
      Caption = 'CNPJ Emitente'
    end
    object Label3: TLabel
      Left = 156
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
      Left = 156
      Top = 81
      Width = 72
      Height = 13
      Caption = 'Tipo Impressao'
    end
    object BtnGeraChaveNFe: TBitBtn
      Left = 8
      Top = 136
      Width = 109
      Height = 25
      Caption = 'Calcular Chave NFe'
      TabOrder = 7
      OnClick = BtnGeraChaveNFeClick
    end
    object DBCBxUfs: TDBComboBoxValues
      Left = 8
      Top = 35
      Width = 124
      Height = 21
      NullValueKey = 0
      Style = csDropDownList
      DataField = 'CodEstado'
      DataSource = DsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        '11 - RO'
        '12 - AC'
        '13 - AM'
        '14 - RR'
        '15 - PA'
        '16 - AP'
        '17 - TO'
        '21 - MA'
        '22 - PI'
        '23 - CE'
        '24 - RN'
        '25 - PB'
        '26 - PE'
        '27 - AL'
        '28 - SE'
        '29 - BA'
        '31 - MG'
        '32 - ES'
        '33 - RJ'
        '35 - SP'
        '41 - PR'
        '42 - SC'
        '43 - RS'
        '50 - MS'
        '51 - MT'
        '52 - GO'
        '53 - DF')
      Values.Strings = (
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '31'
        '32'
        '33'
        '35'
        '41'
        '42'
        '43'
        '50'
        '51'
        '52'
        '53')
      ParentFont = False
      TabOrder = 8
    end
    object EdtDV: TDBEdit
      Left = 481
      Top = 98
      Width = 121
      Height = 21
      DataField = 'DV'
      DataSource = DsDados
      MaxLength = 1
      TabOrder = 6
    end
    object EdtCodNfe: TDBEdit
      Left = 306
      Top = 98
      Width = 121
      Height = 21
      DataField = 'CodNFe'
      DataSource = DsDados
      MaxLength = 9
      TabOrder = 5
      OnExit = EdtCodNfeExit
    end
    object EdtNumDocto: TDBEdit
      Left = 8
      Top = 98
      Width = 121
      Height = 21
      DataField = 'NumeroNFe'
      DataSource = DsDados
      MaxLength = 9
      TabOrder = 4
      OnExit = EdtNumDoctoExit
    end
    object EdtSerieNfe: TDBEdit
      Left = 576
      Top = 35
      Width = 60
      Height = 21
      DataField = 'SerieNFe'
      DataSource = DsDados
      MaxLength = 3
      TabOrder = 3
      OnExit = EdtSerieNfeExit
    end
    object EdtModDocto: TDBEdit
      Left = 481
      Top = 35
      Width = 64
      Height = 21
      DataField = 'ModeloNFe'
      DataSource = DsDados
      MaxLength = 2
      TabOrder = 2
    end
    object EdtCNPJ: TDBEdit
      Left = 306
      Top = 35
      Width = 121
      Height = 21
      DataField = 'CNPJ'
      DataSource = DsDados
      MaxLength = 14
      TabOrder = 1
    end
    object EdtMesAno: TDBEdit
      Left = 156
      Top = 35
      Width = 121
      Height = 21
      DataField = 'AnoMes'
      DataSource = DsDados
      MaxLength = 4
      TabOrder = 0
    end
    object DBeTpImp: TDBEdit
      Left = 156
      Top = 99
      Width = 64
      Height = 21
      DataField = 'TPIMP'
      DataSource = DsDados
      MaxLength = 2
      TabOrder = 9
      OnExit = DBeTpImpExit
    end
  end
  object CDSDados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 177
    Data = {
      2E0100009619E0BD01000000180000000A0000000000030000002E0109436F64
      45737461646F010049000000010005574944544802000200140006416E6F4D65
      73010049000000010005574944544802000200140004434E504A010049000000
      0100055749445448020002001400094D6F64656C6F4E46650100490000000100
      0557494454480200020014000853657269654E46650100490000000100055749
      445448020002001400094E756D65726F4E466501004900000001000557494454
      4802000200140006436F644E4665010049000000010005574944544802000200
      140002445601004900000001000557494454480200020014000843686176654E
      46650100490000000100055749445448020002002C00055450494D5001004900
      000001000557494454480200020002000000}
    object CDSDadosCodEstado: TStringField
      FieldName = 'CodEstado'
    end
    object CDSDadosAnoMes: TStringField
      FieldName = 'AnoMes'
    end
    object CDSDadosCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object CDSDadosModeloNFe: TStringField
      FieldName = 'ModeloNFe'
    end
    object CDSDadosSerieNFe: TStringField
      FieldName = 'SerieNFe'
    end
    object CDSDadosNumeroNFe: TStringField
      FieldName = 'NumeroNFe'
    end
    object CDSDadosCodNFe: TStringField
      FieldName = 'CodNFe'
    end
    object CDSDadosDV: TStringField
      FieldName = 'DV'
    end
    object CDSDadosChaveNFe: TStringField
      FieldName = 'ChaveNFe'
      Size = 44
    end
    object CDSDadosTPIMP: TStringField
      FieldName = 'TPIMP'
      Size = 2
    end
  end
  object DsDados: TDataSource
    DataSet = CDSDados
    Left = 512
    Top = 177
  end
end
