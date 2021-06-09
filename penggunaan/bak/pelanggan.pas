unit pelanggan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Buttons;

type
  TF_Pengunaan = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure valueSChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Pengunaan: TF_Pengunaan;

implementation

uses EntryPelanggan;

{$R *.dfm}

procedure TF_Pengunaan.FormCreate(Sender: TObject);
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

procedure TF_Pengunaan.BitBtn1Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  Application.CreateForm(TF_EntryPelanggan, F_EntryPelanggan);
  F_EntryPelanggan.Show;
  F_EntryPelanggan.patokan.Caption := 'ADD DATA PROCESS';
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

procedure TF_Pengunaan.BitBtn4Click(Sender: TObject);
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

procedure TF_Pengunaan.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Yakin ingin keluar aplikasi?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end;
end;

procedure TF_Pengunaan.BitBtn2Click(Sender: TObject);
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
      F_EntryPelanggan.id.Text := SubItems.Strings[0];
      F_EntryPelanggan.bln.Text := SubItems.Strings[1];
      F_EntryPelanggan.thn.Text := SubItems.Strings[2];
      F_EntryPelanggan.maw.Text := SubItems.Strings[3];
      F_EntryPelanggan.mak.Text := SubItems.Strings[4];
    end;
    F_EntryPelanggan.Show;
    F_EntryPelanggan.patokan.Caption := 'EDIT DATA PROCESS';
    F_EntryPelanggan.id.Enabled := false;
    F_EntryPelanggan.bln.SetFocus;
  end;
end;

procedure TF_Pengunaan.BitBtn3Click(Sender: TObject);
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

procedure TF_Pengunaan.valueSChange(Sender: TObject);
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
    SQL.Add('SELECT * FROM Penggunaan WHERE IDPelanggan LIKE "%' + value + '%" OR nama LIKE "%' + value + '%"');
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
		    data.SubItems.Add(FieldValues['Bualan']);
        data.SubItems.Add(FieldValues['Tahun']);
        data.SubItems.Add(FieldValues['Meterawal']);
        data.SubItems.Add(FieldValues['Meterakhir']);
        next;
      end;
    end;
  end;
end;

procedure TF_Pengunaan.BitBtn7Click(Sender: TObject);
begin
  MessageDlg('ek\ncek', mtInformation, [mbOK], 0)
end;

end.
