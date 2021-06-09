unit tagihan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Buttons, jpeg, ExtCtrls;

type
  TF_Tagihan = class(TForm)
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
  F_Tagihan: TF_Tagihan;

implementation

uses EntryTagihan, menu;

{$R *.dfm}

procedure TF_Tagihan.FormCreate(Sender: TObject);
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
    SQL.Add('SELECT * FROM Tagihan');
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
      dat.SubItems.Add(FieldValues['Jumlahmeter']);
      dat.SubItems.Add(FieldValues['Status']);
      next;
      end;
    end;
  end;
end;

procedure TF_Tagihan.BitBtn1Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  Application.CreateForm(TF_EntryTagihan, F_EntryTagihan);
  F_EntryTagihan.Show;
  F_EntryTagihan.patokan.Caption := 'ADD DATA PROCESS';
  no:=0;
  WITH Q_penggunaan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Tagihan');
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
      dat.SubItems.Add(FieldValues['Jumlahmeter']);
      dat.SubItems.Add(FieldValues['Status']);
      next;
      end;
    end;
  end;
end;

procedure TF_Tagihan.BitBtn4Click(Sender: TObject);
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
    SQL.Add('SELECT * FROM Tagihan');
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
      dat.SubItems.Add(FieldValues['Jumlahmeter']);
      dat.SubItems.Add(FieldValues['Status']);
      next;
      end;
    end;
  end;
end;

procedure TF_Tagihan.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Yakin ingin keluar aplikasi?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end;
end;

procedure TF_Tagihan.BitBtn2Click(Sender: TObject);
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
      F_EntryTagihan.id.Text := SubItems.Strings[0];
      F_EntryTagihan.bln.Text := SubItems.Strings[1];
      F_EntryTagihan.thn.Text := SubItems.Strings[2];
    end;
    F_EntryTagihan.Show;
    F_EntryTagihan.patokan.Caption := 'EDIT DATA PROCESS';
    F_EntryTagihan.id.Enabled := false;
    F_EntryTagihan.bln.SetFocus;
  end;
end;

procedure TF_Tagihan.BitBtn3Click(Sender: TObject);
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
      SQL.Text := 'DELETE FROM Tagihan WHERE IDPelanggan="' + L_pelanggan.Selected.SubItems.Strings[0] + '"';
      if MessageDlg('Anda yakin untuk menghapus data dengan ID : ' + L_pelanggan.Selected.SubItems.Strings[0], mtConfirmation, [mbYes, mbNo], 0) = id_YES then
        begin
          ExecSQL;
          	  no:=0;
	  WITH Q_penggunaan do
	  begin
		// KONEKSI
		Close;
		SQL.Clear;
		SQL.Add('SELECT * FROM Tagihan');
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
      dat.SubItems.Add(FieldValues['Jumlahmeter']);
      dat.SubItems.Add(FieldValues['Status']);
		  next;
		  end;
		end;
	  end;
        end
    end;
  end;
end;

procedure TF_Tagihan.valueSChange(Sender: TObject);
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
    SQL.Add('SELECT * FROM Tagihan WHERE IDPelanggan LIKE "%' + value + '%" OR Bulan LIKE "%' + value + '%" OR Tahun LIKE "%' + value + '%" OR Jumlahmeter LIKE "%' + value + '%" OR Status LIKE "%' + value + '%"');
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
        data.SubItems.Add(FieldValues['Jumlahmeter']);
        data.SubItems.Add(FieldValues['Status']);
        next;
      end;
    end;
  end;
end;

procedure TF_Tagihan.BitBtn7Click(Sender: TObject);
var
  txt: String;
begin
  txt := 'Created By Hanif Ahmad Syauqi';
  MessageDlg(txt, mtInformation, [mbOK], 0)
end;

procedure TF_Tagihan.BitBtn5Click(Sender: TObject);
begin
  F_Tagihan.Hide;
  F_menu.Show;
end;

end.
