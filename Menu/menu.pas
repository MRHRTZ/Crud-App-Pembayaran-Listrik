unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Buttons, ExtCtrls, jpeg, DB, ADODB,
  RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave;

type
  TF_menu = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    akun: TMenuItem;
    Exit1: TMenuItem;
    Aplikasi1: TMenuItem;
    Dpelanggan: TMenuItem;
    Dpenggunaan: TMenuItem;
    Dpembayaran: TMenuItem;
    Dtarif: TMenuItem;
    Dtagihan: TMenuItem;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    bt_pembayaran: TButton;
    GroupBox2: TGroupBox;
    bt_penggunaan: TButton;
    bt_pelanggan: TButton;
    bt_tarif: TButton;
    bt_tagihan: TButton;
    p_user: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Laporan1: TMenuItem;
    PrPelanggan: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    RvSysMenu: TRvSystem;
    RvDataSetMenu: TRvDataSetConnection;
    ADO_Menu: TADOConnection;
    Q_Menu: TADOQuery;
    PageCCC: TPageControl;
    TabPelanggan: TTabSheet;
    TabPembayaran: TTabSheet;
    TabPenggunaan: TTabSheet;
    TabTarif: TTabSheet;
    TabTagihan: TTabSheet;
    L_MenuPelanggan: TListView;
    Spelanggan: TEdit;
    Label1: TLabel;
    Rpelanggan: TBitBtn;
    L_MenuPembayaran: TListView;
    L_MenuPenggunaan: TListView;
    L_MenuTarif: TListView;
    L_MenuTagihan: TListView;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Spembayaran: TEdit;
    Spenggunaan: TEdit;
    Starif: TEdit;
    Stagihan: TEdit;
    Rpenggunaan: TBitBtn;
    Rtagihan: TBitBtn;
    Rpembayaran: TBitBtn;
    Rtarif: TBitBtn;
    RvPelanggan: TRvProject;
    Q_menu1: TADOQuery;
    RvPembayaran: TRvProject;
    RvDataSetConnPelanggan: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    Q_menu2: TADOQuery;
    Q_menu3: TADOQuery;
    Q_menu4: TADOQuery;
    RvTagihan: TRvProject;
    RvPenggunaan: TRvProject;
    RvTarif: TRvProject;
    RvDataSetConnTagihan: TRvDataSetConnection;
    RvDataSetPenggunaaan: TRvDataSetConnection;
    RvDataSetTarif: TRvDataSetConnection;
    v: TRvSystem;
    RvSystem2: TRvSystem;
    RvSystem3: TRvSystem;
    PrPembayaran: TMenuItem;
    PrTagihan: TMenuItem;
    PrPenggunaan: TMenuItem;
    PrTarif: TMenuItem;
    Exit2: TMenuItem;
    username: TPanel;
    procedure Exit1Click(Sender: TObject);
    procedure bt_pelangganClick(Sender: TObject);
    procedure bt_pembayaranClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure bt_penggunaanClick(Sender: TObject);
    procedure DpenggunaanClick(Sender: TObject);
    procedure bt_tarifClick(Sender: TObject);
    procedure DtarifClick(Sender: TObject);
    procedure bt_tagihanClick(Sender: TObject);
    procedure PrPelangganClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DpelangganClick(Sender: TObject);
    procedure DpembayaranClick(Sender: TObject);
    procedure DtagihanClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure SpelangganChange(Sender: TObject);
    procedure SpembayaranChange(Sender: TObject);
    procedure SpenggunaanChange(Sender: TObject);
    procedure StarifChange(Sender: TObject);
    procedure StagihanChange(Sender: TObject);
    procedure RpelangganClick(Sender: TObject);
    procedure RpembayaranClick(Sender: TObject);
    procedure PageCCCChange(Sender: TObject);
    procedure RtarifClick(Sender: TObject);
    procedure RtagihanClick(Sender: TObject);
    procedure PrPembayaranClick(Sender: TObject);
    procedure PrTagihanClick(Sender: TObject);
    procedure PrPenggunaanClick(Sender: TObject);
    procedure PrTarifClick(Sender: TObject);
    procedure akunClick(Sender: TObject);
    procedure Exit2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_menu: TF_menu;

implementation
  uses
  pelanggan,
  EntryPelanggan,
  pembayaran,
  EntryPembayaran,
  U_login,
  penggunaan,
  tarif,
  tagihan,
  Akun;
{$R *.dfm}


procedure pushPelanggan();
var
  data:TListItem;
  no:Integer;
  qstring:String;
begin
  no:=0;
  With F_menu.Q_Menu do
  begin
    qstring := 'SELECT * FROM Pelanggan';
    Close;
    SQL.Clear;
    SQL.Add(qstring);
    open;
    F_menu.L_MenuPelanggan.Clear;
    if Not isEmpty then
    begin
      while not eof do
      begin
        inc(no);
        data:= F_menu.L_MenuPelanggan.Items.Add;
        data.Caption:= IntToStr(no);
        data.SubItems.Add(FieldValues['IDPelanggan']);
        data.SubItems.Add(FieldValues['Nometer']);
        data.SubItems.Add(FieldValues['Nama']);
        data.SubItems.Add(FieldValues['Alamat']);
        data.SubItems.Add(FieldValues['Kodetarif']);
        next;
      end;
    end;
  end;
end;

procedure pushPembayaran();
var
  dat:TListItem;
  no:Integer;
begin
  no:=0;
  WITH F_menu.Q_Menu do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Pembayaran');
    open;
    // TAMPIL VIEW
    F_menu.L_MenuPembayaran.Clear;
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := F_menu.L_MenuPembayaran.Items.Add;
      dat.Caption := IntToStr(no);
      dat.SubItems.Add(FieldValues['IDbayar']);
      dat.SubItems.Add(FieldValues['IDPelanggan']);
      dat.SubItems.Add(FieldValues['Tanggal']);
      dat.SubItems.Add(FieldValues['Bulanbayar']);
      dat.SubItems.Add(FieldValues['Biayaadmin']);
      next;
      end;
    end;
  end;
end;

procedure pushPenggunaan();
var
  dat:TListItem;
  no:Integer;
begin
  no:=0;
  WITH F_menu.Q_Menu do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Penggunaan');
    open;
    F_menu.L_MenuPenggunaan.Clear;
    // TAMPIL VIEW
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := F_menu.L_MenuPenggunaan.Items.Add;
      dat.Caption := IntToStr(no);
      dat.SubItems.Add(FieldValues['IDPelanggan']);
      dat.SubItems.Add(FieldValues['Bulan']);
      dat.SubItems.Add(FieldValues['Tahun']);
      dat.SubItems.Add(FieldValues['Meterawal']);
      dat.SubItems.Add(FieldValues['Meterakhir']);
      next;
      end;
    end;
  end;
end;

procedure pushTarif();
var
  dat:TListItem;
  no:Integer;
begin
  no:=0;
  WITH F_menu.Q_Menu do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Tarif');
    open;
    // TAMPIL VIEW
    F_menu.L_MenuTarif.Clear;
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := F_menu.L_MenuTarif.Items.Add;
      dat.Caption := IntToStr(no);
      dat.SubItems.Add(FieldValues['Kodetarif']);
      dat.SubItems.Add(FieldValues['Daya']);
      dat.SubItems.Add(FieldValues['Tarifperkwh']);
      next;
      end;
    end;
  end;
end;

procedure pushTagihan();
var
  dat:TListItem;
  no:Integer;
begin
  no:=0;
  WITH F_menu.Q_Menu do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Tagihan');
    open;
    // TAMPIL VIEW
    F_menu.L_MenuTagihan.Clear;
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := F_menu.L_MenuTagihan.Items.Add;
      dat.Caption := IntToStr(no);
      dat.SubItems.Add(FieldValues['IDPelanggan']);
      dat.SubItems.Add(FieldValues['Bulan']);
      dat.SubItems.Add(FieldValues['Tahun']);
      dat.SubItems.Add(FieldValues['Jumlahmeter']);
      dat.SubItems.Add(FieldValues['Status']);
      next;
      end;
    end;
  end;
end;


procedure TF_menu.Exit1Click(Sender: TObject);
begin
  if MessageDlg('Yakin ingin keluar aplikasi?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end
end;

procedure TF_menu.bt_pelangganClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Pelanggan.Show;
end;

procedure TF_menu.bt_pembayaranClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Pembayaran.Show;
end;

procedure TF_menu.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Anda yakin untuk logout dan keluar?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end
end;

procedure TF_menu.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Anda ingin logout dari sesi ini?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    F_menu.Hide;
    F_Login.Show;
  end;
end;

procedure TF_menu.Logout1Click(Sender: TObject);
begin
  if MessageDlg('Anda ingin logout dari sesi ini?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    F_menu.Hide;
    F_Login.Show;
  end
end;

procedure TF_menu.Login1Click(Sender: TObject);
begin
  MessageDlg('Anda telah login di sesi ini!', mtInformation, [mbOK], 1);
end;

procedure TF_menu.bt_penggunaanClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Penggunaan.Show;
end;

procedure TF_menu.DpenggunaanClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Penggunaan.Show;
end;

procedure TF_menu.bt_tarifClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Tarif.Show;
end;

procedure TF_menu.DtarifClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Tarif.Show;          
end;

procedure TF_menu.bt_tagihanClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Tagihan.Show;
end;

procedure TF_menu.PrPelangganClick(Sender: TObject);
begin
  RvPelanggan.Execute;
end;

procedure TF_menu.FormCreate(Sender: TObject);
begin
  pushPelanggan();
  pushPembayaran();
  pushPenggunaan();
  pushTarif();
  pushTagihan();
end;

procedure TF_menu.DpelangganClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Pelanggan.Show;
end;

procedure TF_menu.DpembayaranClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Pembayaran.Show;
end;

procedure TF_menu.DtagihanClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Tagihan.Show;
end;

procedure TF_menu.TabControl1Change(Sender: TObject);
begin
  //TabControl1.TabIndex := 1
end;

procedure TF_menu.SpelangganChange(Sender: TObject);
var
  value: String;
  no: Integer;
  data:TListItem;
begin
  value:= Spelanggan.Text;
  no:= 0;
  with F_menu.Q_Menu do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM Pelanggan WHERE IDPelanggan LIKE "%' + value + '%" OR Nometer LIKE "%' + value + '%" OR Nama LIKE "%' + value + '%" OR Alamat LIKE "%' + value + '%" OR Kodetarif LIKE "%' + value + '%"');
    open;

    // Menampilkan data kedalam ListView
    F_menu.L_MenuPelanggan.Clear;
    if Not isEmpty then
    begin
      while not eof do
      begin
        inc(no);
        data:= F_menu.L_MenuPelanggan.Items.Add;
        data.Caption:= IntToStr(no);
        data.SubItems.Add(FieldValues['IDPelanggan']);
		    data.SubItems.Add(FieldValues['Nometer']);
		    data.SubItems.Add(FieldValues['Nama']);
		    data.SubItems.Add(FieldValues['Alamat']);
		    data.SubItems.Add(FieldValues['Kodetarif']);
        next;
      end;
    end;
  end;
end;

procedure TF_menu.SpembayaranChange(Sender: TObject);
var
  value: String;
  no: Integer;
  data:TListItem;
begin
  value:= Spembayaran.Text;
  no:= 0;
  with F_menu.Q_Menu do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM Pembayaran WHERE IDbayar LIKE "%' + value + '%" OR IDPelanggan LIKE "%' + value + '%" OR Tanggal LIKE "%' + value + '%" OR Bulanbayar LIKE "%' + value + '%" OR Biayaadmin LIKE "%' + value + '%"');
    open;

    // Menampilkan data kedalam ListView
    F_menu.L_MenuPembayaran.Clear;
    if Not isEmpty then
    begin
      while not eof do
      begin
        inc(no);
        data:= F_menu.L_MenuPembayaran.Items.Add;
        data.Caption:= IntToStr(no);
        data.SubItems.Add(FieldValues['IDbayar']);
        data.SubItems.Add(FieldValues['IDPelanggan']);
        data.SubItems.Add(FieldValues['Tanggal']);
        data.SubItems.Add(FieldValues['Bulanbayar']);
        data.SubItems.Add(FieldValues['Biayaadmin']);
        next;
      end;
    end;
  end;
end;

procedure TF_menu.SpenggunaanChange(Sender: TObject);
var
  value: String;
  no: Integer;
  data:TListItem;
begin
  value:= Spenggunaan.Text;
  no:= 0;
  with F_menu.Q_Menu do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM Penggunaan WHERE IDPelanggan LIKE "%' + value + '%" OR Bulan LIKE "%' + value + '%" OR Tahun LIKE "%' + value + '%" OR Meterawal LIKE "%' + value + '%" OR Meterakhir LIKE "%' + value + '%"');
    open;

    // Menampilkan data kedalam ListView
    F_menu.L_MenuPenggunaan.Clear;
    if Not isEmpty then
    begin
      while not eof do
      begin
        inc(no);
        data:= F_menu.L_MenuPenggunaan.Items.Add;
        data.Caption:= IntToStr(no);
        data.SubItems.Add(FieldValues['IDPelanggan']);
		    data.SubItems.Add(FieldValues['Bulan']);
        data.SubItems.Add(FieldValues['Tahun']);
        data.SubItems.Add(FieldValues['Meterawal']);
        data.SubItems.Add(FieldValues['Meterakhir']);
        next;
      end;
    end;
  end;
end;

procedure TF_menu.StarifChange(Sender: TObject);
var
  value: String;
  no: Integer;
  data:TListItem;
begin
  value:= Starif.Text;
  no:= 0;
  with F_menu.Q_Menu do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM Tarif WHERE Kodetarif LIKE "%' + value + '%" OR Daya LIKE "%' + value + '%" OR Tarifperkwh LIKE "%' + value + '%"');
    open;

    // Menampilkan data kedalam ListView
    F_menu.L_MenuTarif.Clear;
    if Not isEmpty then
    begin
      while not eof do
      begin
        inc(no);
        data:= F_menu.L_MenuTarif.Items.Add;
        data.Caption:= IntToStr(no);
        data.SubItems.Add(FieldValues['Kodetarif']);
        data.SubItems.Add(FieldValues['Daya']);
        data.SubItems.Add(FieldValues['Tarifperkwh']);
        next;
      end;
    end;
  end;
end;

procedure TF_menu.StagihanChange(Sender: TObject);
var
  value: String;
  no: Integer;
  data:TListItem;
begin
  value:= Stagihan.Text;
  no:= 0;
  with F_menu.Q_Menu do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM Tagihan WHERE IDPelanggan LIKE "%' + value + '%" OR Bulan LIKE "%' + value + '%" OR Tahun LIKE "%' + value + '%" OR Jumlahmeter LIKE "%' + value + '%" OR Status LIKE "%' + value + '%"');
    open;

    // Menampilkan data kedalam ListView
    F_menu.L_MenuTagihan.Clear;
    if Not isEmpty then
    begin
      while not eof do
      begin
        inc(no);
        data:= F_menu.L_MenuTagihan.Items.Add;
        data.Caption:= IntToStr(no);
        data.SubItems.Add(FieldValues['IDPelanggan']);
        data.SubItems.Add(FieldValues['Bulan']);
        data.SubItems.Add(FieldValues['Tahun']);
        data.SubItems.Add(FieldValues['Jumlahmeter']);
        data.SubItems.Add(FieldValues['Status']);
        next;
      end;
    end;
  end;
end;

procedure TF_menu.RpelangganClick(Sender: TObject);
begin
  pushPelanggan();
end;

procedure TF_menu.RpembayaranClick(Sender: TObject);
begin
  pushPembayaran();
end;

procedure TF_menu.PageCCCChange(Sender: TObject);
begin
  pushPenggunaan();
end;

procedure TF_menu.RtarifClick(Sender: TObject);
begin
  pushTarif();
end;

procedure TF_menu.RtagihanClick(Sender: TObject);
begin
  pushTagihan();
end;

procedure TF_menu.PrPembayaranClick(Sender: TObject);
begin
  RvPembayaran.Execute;
end;

procedure TF_menu.PrTagihanClick(Sender: TObject);
begin
  RvTagihan.Execute;
end;

procedure TF_menu.PrPenggunaanClick(Sender: TObject);
begin
  RvPenggunaan.Execute;
end;

procedure TF_menu.PrTarifClick(Sender: TObject);
begin
  RvTarif.Execute;
end;

procedure TF_menu.akunClick(Sender: TObject);
begin
  F_menu.Hide;
  F_Akun.Show;
end;

procedure TF_menu.Exit2Click(Sender: TObject);
begin
if MessageDlg('Anda yakin untuk logout dan keluar?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end
end;

end.
