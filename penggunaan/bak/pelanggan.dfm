object F_Pengunaan: TF_Pengunaan
  Left = 172
  Top = 114
  Width = 1039
  Height = 549
  Caption = 'Data Penggunaan'
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 585
    Height = 505
    Caption = 'Main Data'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 60
      Height = 16
      Caption = 'Cari Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object L_pelanggan: TListView
      Left = 24
      Top = 72
      Width = 537
      Height = 409
      Columns = <
        item
          Caption = 'No'
          Width = 30
        end
        item
          Caption = 'ID Pelanggan'
          Width = 100
        end
        item
          Caption = 'Bulan'
          Width = 100
        end
        item
          Caption = 'Tahun'
          Width = 100
        end
        item
          Caption = 'Meterawal'
          Width = 100
        end
        item
          Caption = 'Meterakhir'
          Width = 100
        end>
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object valueS: TEdit
      Left = 96
      Top = 24
      Width = 465
      Height = 21
      TabOrder = 1
      OnChange = valueSChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 600
    Top = 152
    Width = 417
    Height = 225
    Caption = 'Manipulate'
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 16
      Top = 24
      Width = 377
      Height = 41
      Caption = '&ADD'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 72
      Width = 377
      Height = 41
      Caption = '&EDIT'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 120
      Width = 377
      Height = 41
      Caption = '&DELETE'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 16
      Top = 168
      Width = 377
      Height = 41
      Caption = '&REFRESH'
      TabOrder = 3
      OnClick = BitBtn4Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 600
    Top = 384
    Width = 417
    Height = 121
    TabOrder = 2
    object BitBtn5: TBitBtn
      Left = 32
      Top = 32
      Width = 89
      Height = 65
      Caption = '&Main Menu'
      TabOrder = 0
    end
    object BitBtn6: TBitBtn
      Left = 296
      Top = 32
      Width = 89
      Height = 65
      Caption = 'Exit'
      TabOrder = 1
      OnClick = BitBtn6Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 600
    Top = 0
    Width = 417
    Height = 145
    Caption = 'Form'
    TabOrder = 3
    object BitBtn7: TBitBtn
      Left = 16
      Top = 24
      Width = 377
      Height = 105
      Caption = 'Data Penggunaan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Stencil Std'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn7Click
    end
  end
  object ADO_Pelanggan: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=F:\# Tugas Praktek\' +
      'db\pembayaran_listrik.mdb;Persist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 448
  end
  object Q_penggunaan: TADOQuery
    Connection = ADO_Pelanggan
    Parameters = <>
    Left = 72
    Top = 448
  end
end
