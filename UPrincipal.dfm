object FPrincipal: TFPrincipal
  Left = 287
  Top = 205
  Width = 870
  Height = 640
  Caption = 'Utilidades'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 392
    Top = 104
    object menu1: TMenuItem
      Caption = 'Nfe'
      object ChavedeAcesso1: TMenuItem
        Caption = 'Chave de Acesso'
        OnClick = ChavedeAcesso1Click
      end
    end
    object CNPJ1: TMenuItem
      Caption = 'CNPJ'
      object CNPJBase1: TMenuItem
        Caption = 'CNPJ Base'
        OnClick = CNPJBase1Click
      end
    end
    object Diversos1: TMenuItem
      Caption = 'Diversos'
      object CalculodeMD51: TMenuItem
        Caption = 'Calculo de MD5'
        OnClick = CalculodeMD51Click
      end
    end
  end
end
