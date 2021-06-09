unit pembayaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Buttons, jpeg, ExtCtrls;

type
  TF_Pembayaran = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    L_pelanggan: TListView;
    ADO_Pelanggan: TADOConnection;
    Q_penggunaan: TADOQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox3: TGroupBox;
    BitBtn5: TBitBtn;
    GroupBox4: TGroupBox;
    BitBtn6: TBitBtn;
    valueS: TEdit;
    Label1: TLabel;
    BitBtn7: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure valueSChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Pembayaran: TF_Pembayaran;

implementation

uses EntryPembayaran, menu;

{$R *.dfm}

procedure TF_Pembayaran.FormCreate(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  no:=0;
  WITH Q_penggunaan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Pembayaran');
    open;
    // TAMPIL VIEW
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := L_pelanggan.Items.Add;
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

procedure TF_Pembayaran.BitBtn1Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  Application.CreateForm(TF_EntryPembayaran, F_EntryPembayaran);
  F_EntryPembayaran.Show;
  F_EntryPembayaran.patokan.Caption := 'ADD DATA PROCESS';
  no:=0;
  WITH Q_penggunaan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Pembayaran');
    open;
    // TAMPIL VIEW
    L_pelanggan.Clear;
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := L_pelanggan.Items.Add;
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

procedure TF_Pembayaran.BitBtn4Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  no:=0;
  WITH Q_penggunaan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Pembayaran');
    open;
    // TAMPIL VIEW
    L_pelanggan.Clear;
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := L_pelanggan.Items.Add;
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

procedure TF_Pembayaran.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Yakin ingin keluar aplikasi?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end
end;

procedure TF_Pembayaran.BitBtn2Click(Sender: TObject);
begin
  if L_pelanggan.SelCount = 0 then
    begin
      MessageDlg('Klik data yang akan diedit yaa!', mtInformation, [mbOK], 0)
    end
  else
  begin
    WITH L_pelanggan.Selected DO
    begin
      Index;
      F_EntryPembayaran.id.Text := SubItems.Strings[0];
      F_EntryPembayaran.bln.Text := SubItems.Strings[1];
      F_EntryPembayaran.thn.Text := SubItems.Strings[2];
      F_EntryPembayaran.maw.Text := SubItems.Strings[3];
      F_EntryPembayaran.mak.Text := SubItems.Strings[4];
    end;
    F_EntryPembayaran.Show;
    F_EntryPembayaran.patokan.Caption := 'EDIT DATA PROCESS';
    F_EntryPembayaran.id.Enabled := false;
    F_EntryPembayaran.bln.SetFocus;
  end;
end;

procedure TF_Pembayaran.BitBtn3Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  if L_pelanggan.SelCount = 0 then
    begin
      MessageDlg('Klik data yang akan hapus!', mtInformation, [mbOK], 0)
    end
  else
  begin
    WITH Q_penggunaan DO
    begin
      Close;
      SQL.Text := 'DELETE FROM Pembayaran WHERE IDbayar="' + L_pelanggan.Selected.SubItems.Strings[0] + '"';
      if MessageDlg('Anda yakin untuk menghapus data dengan ID : ' + L_pelanggan.Selected.SubItems.Strings[0], mtConfirmation, [mbYes, mbNo], 0) = id_YES then
        begin
          ExecSQL;
          	  no:=0;
	  WITH Q_penggunaan do
	  begin
		// KONEKSI
		Close;
		SQL.Clear;
		SQL.Add('SELECT * FROM Pembayaran');
		open;
		// TAMPIL VIEW
    L_pelanggan.Clear;
		IF NOT IsEmpty then
		begin
		  WHILE NOT eof DO
		  begin
		  inc(no);
		  dat := L_pelanggan.Items.Add;
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
        end
    end;
  end;
end;

procedure TF_Pembayaran.valueSChange(Sender: TObject);
var
  value: String;
  no: Integer;
  data:TListItem;
begin
  value:= valueS.Text;
  no:= 0;
  with Q_penggunaan do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM Pembayaran WHERE IDbayar LIKE "%' + value + '%" OR IDPelanggan LIKE "%' + value + '%" OR Tanggal LIKE "%' + value + '%" OR Bulanbayar LIKE "%' + value + '%" OR Biayaadmin LIKE "%' + value + '%"');
    open;

    // Menampilkan data kedalam ListView
    L_pelanggan.Clear;
    if Not isEmpty then
    begin
      while not eof do
      begin
        inc(no);
        data:= L_pelanggan.Items.Add;
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

procedure TF_Pembayaran.BitBtn7Click(Sender: TObject);
begin
  ShowMessage('Created By Hanif Ahmad Syauqi.')
end;

procedure TF_Pembayaran.BitBtn5Click(Sender: TObject);
begin
  F_Pembayaran.Close;
  F_menu.Show;
end;

end.
