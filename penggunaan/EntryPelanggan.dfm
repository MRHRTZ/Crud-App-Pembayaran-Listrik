object F_EntryPelanggan: TF_EntryPelanggan
  Left = 286
  Top = 213
  Width = 610
  Height = 245
  Caption = 'Entry'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 377
    Height = 201
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 65
      Height = 13
      Caption = 'ID Pelanggan'
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 27
      Height = 13
      Caption = 'Bulan'
    end
    object Label3: TLabel
      Left = 24
      Top = 80
      Width = 31
      Height = 13
      Caption = 'Tahun'
    end
    object Label4: TLabel
      Left = 24
      Top = 112
      Width = 49
      Height = 13
      Caption = 'Meterawal'
    end
    object Label5: TLabel
      Left = 24
      Top = 144
      Width = 50
      Height = 13
      Caption = 'Meterakhir'
    end
    object bln: TEdit
      Left = 112
      Top = 48
      Width = 249
      Height = 21
      TabOrder = 0
    end
    object thn: TEdit
      Left = 112
      Top = 80
      Width = 249
      Height = 21
      TabOrder = 1
    end
    object maw: TEdit
      Left = 112
      Top = 112
      Width = 249
      Height = 21
      TabOrder = 2
    end
    object mak: TEdit
      Left = 112
      Top = 144
      Width = 249
      Height = 21
      TabOrder = 3
    end
    object id: TComboBox
      Left = 112
      Top = 16
      Width = 249
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 392
    Top = 8
    Width = 193
    Height = 193
    TabOrder = 1
    object valid: TLabel
      Left = 24
      Top = 96
      Width = 140
      Height = 13
      Caption = 'Validasi Cek Dibutuhkan'
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object patokan: TLabel
      Left = 16
      Top = 16
      Width = 4
      Height = 16
      Caption = '-'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 48
      Width = 161
      Height = 33
      Caption = '&Cek Validasi'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object save: TBitBtn
      Left = 16
      Top = 128
      Width = 75
      Height = 49
      Caption = '&Save'
      Enabled = False
      TabOrder = 1
      OnClick = saveClick
    end
    object BitBtn3: TBitBtn
      Left = 104
      Top = 128
      Width = 75
      Height = 49
      Caption = '&Cancel'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
end
