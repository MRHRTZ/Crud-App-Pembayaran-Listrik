unit penggunaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Buttons, jpeg, ExtCtrls;

type
  TF_Penggunaan = class(TForm)
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
  F_Penggunaan: TF_Penggunaan;

implementation

uses EntryPenggunaan, menu;

{$R *.dfm}

procedure TF_Penggunaan.FormCreate(Sender: TObject);
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
    SQL.Add('SELECT * FROM Penggunaan');
    open;
    // TAMPIL VIEW
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := L_pelanggan.Items.Add;
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

procedure TF_Penggunaan.BitBtn1Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  Application.CreateForm(TF_EntryPenggunaan, F_EntryPenggunaan);
  F_EntryPenggunaan.Show;
  F_EntryPenggunaan.patokan.Caption := 'ADD DATA PROCESS';
  no:=0;
  WITH Q_penggunaan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Penggunaan');
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

procedure TF_Penggunaan.BitBtn4Click(Sender: TObject);
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
    SQL.Add('SELECT * FROM Penggunaan');
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

procedure TF_Penggunaan.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Yakin ingin keluar aplikasi?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end;
end;

procedure TF_Penggunaan.BitBtn2Click(Sender: TObject);
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
      F_EntryPenggunaan.id.Text := SubItems.Strings[0];
      F_EntryPenggunaan.bln.Text := SubItems.Strings[1];
      F_EntryPenggunaan.thn.Text := SubItems.Strings[2];
      F_EntryPenggunaan.maw.Text := SubItems.Strings[3];
      F_EntryPenggunaan.mak.Text := SubItems.Strings[4];
    end;
    F_EntryPenggunaan.Show;
    F_EntryPenggunaan.patokan.Caption := 'EDIT DATA PROCESS';
    F_EntryPenggunaan.id.Enabled := false;
    F_EntryPenggunaan.bln.SetFocus;
  end;
end;

procedure TF_Penggunaan.BitBtn3Click(Sender: TObject);
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
      SQL.Text := 'DELETE FROM Penggunaan WHERE IDPelanggan="' + L_pelanggan.Selected.SubItems.Strings[0] + '"';
      if MessageDlg('Anda yakin untuk menghapus data dengan ID : ' + L_pelanggan.Selected.SubItems.Strings[0], mtConfirmation, [mbYes, mbNo], 0) = id_YES then
        begin
          ExecSQL;
          	  no:=0;
	  WITH Q_penggunaan do
	  begin
		// KONEKSI
		Close;
		SQL.Clear;
		SQL.Add('SELECT * FROM Penggunaan');
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
		  dat.SubItems.Add(FieldValues['IDPelanggan']);
		  dat.SubItems.Add(FieldValues['Bulan']);
      dat.SubItems.Add(FieldValues['Tahun']);
      dat.SubItems.Add(FieldValues['Meterawal']);
      dat.SubItems.Add(FieldValues['Meterakhir']);
		  next;
		  end;
		end;
	  end;
        end
    end;
  end;
end;

procedure TF_Penggunaan.valueSChange(Sender: TObject);
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
    SQL.Add('SELECT * FROM Penggunaan WHERE IDPelanggan LIKE "%' + value + '%" OR Bulan LIKE "%' + value + '%" OR Tahun LIKE "%' + value + '%" OR Meterawal LIKE "%' + value + '%" OR Meterakhir LIKE "%' + value + '%"');
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

procedure TF_Penggunaan.BitBtn7Click(Sender: TObject);
var
  txt: String;
begin
  txt := 'Created By Hanif Ahmad Syauqi';
  MessageDlg(txt, mtInformation, [mbOK], 0)
end;

procedure TF_Penggunaan.BitBtn5Click(Sender: TObject);
begin
  F_Penggunaan.Hide;
  F_menu.Show;
end;

end.
