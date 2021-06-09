object F_Menu: TF_Menu
  Left = 659
  Top = 125
  Width = 607
  Height = 356
  Caption = 'Aplikasi Toko Buku'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Login1: TMenuItem
        Caption = 'Login'
      end
      object Logout1: TMenuItem
        Caption = 'Logout'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Aplikasi1: TMenuItem
      Caption = 'Aplikasi'
      object Buku1: TMenuItem
        Caption = 'Data Buku'
        OnClick = Buku1Click
      end
      object Distributor1: TMenuItem
        Caption = 'Data Distributor'
        OnClick = Distributor1Click
      end
      object Data1: TMenuItem
        Caption = 'Data Kasir'
        OnClick = Data1Click
      end
      object DataPemasok1: TMenuItem
        Caption = 'Data Pemasok'
        OnClick = DataPemasok1Click
      end
      object DataPenjualan1: TMenuItem
        Caption = 'Data Penjualan'
        OnClick = DataPenjualan1Click
      end
    end
  end
end
