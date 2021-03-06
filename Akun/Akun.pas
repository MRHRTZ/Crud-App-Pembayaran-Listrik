unit Akun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Buttons, jpeg, ExtCtrls;

type
  TF_Akun = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    L_pelanggan: TListView;
    ADO_Pelanggan: TADOConnection;
    Q_pelanggan: TADOQuery;
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
  F_Akun: TF_Akun;

implementation

uses EntryPelanggan, menu, pelanggan, EntryAkun;

{$R *.dfm}

procedure TF_Akun.FormCreate(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  no:=0;
  WITH Q_pelanggan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Akun');
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
      dat.SubItems.Add(FieldValues['Username']);
      dat.SubItems.Add(FieldValues['Password1']);
      dat.SubItems.Add(FieldValues['Authority']);
      next;
      end;
    end;
  end;
end;

procedure TF_Akun.BitBtn1Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  Application.CreateForm(TF_EntryPelanggan, F_EntryPelanggan);
  F_EntryAkun.id.Enabled := true;
  F_EntryAkun.id.Text := '';
  F_EntryAkun.IDP.Text := '';
  F_EntryAkun.nama.Text := '';
  F_EntryAkun.alamat.Text := '';
  F_EntryAkun.kode.Text := '';
  F_EntryAkun.Show;
  F_EntryAkun.patokan.Caption := 'ADD DATA PROCESS';
  no:=0;
  WITH Q_pelanggan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Akun');
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
      dat.SubItems.Add(FieldValues['IDAkun']);
      dat.SubItems.Add(FieldValues['IDPelanggan']);
      dat.SubItems.Add(FieldValues['Username']);
      dat.SubItems.Add(FieldValues['Password1']);
      dat.SubItems.Add(FieldValues['Authority']);
      next;
      end;
    end;
  end;
end;

procedure TF_Akun.BitBtn4Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  no:=0;
  WITH Q_pelanggan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Akun');
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
      dat.SubItems.Add(FieldValues['Username']);
      dat.SubItems.Add(FieldValues['Password1']);
      dat.SubItems.Add(FieldValues['Authority']);
      next;
      end;
    end;
  end;
end;

procedure TF_Akun.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Yakin ingin keluar aplikasi?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end;
end;

procedure TF_Akun.BitBtn2Click(Sender: TObject);
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
      F_EntryAkun.id.Text := SubItems.Strings[0];
      F_EntryAkun.IDP.Text := SubItems.Strings[1];
      F_EntryAkun.nama.Text := SubItems.Strings[2];
      F_EntryAkun.alamat.Text := SubItems.Strings[3];
      F_EntryAkun.kode.Text := SubItems.Strings[4];
    end;
    F_EntryAkun.Show;
    F_EntryAkun.patokan.Caption := 'EDIT DATA PROCESS';
    F_EntryAkun.id.Enabled := false;
    F_EntryAkun.IDP.SetFocus;
  end;
end;

procedure TF_Akun.BitBtn3Click(Sender: TObject);
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
    WITH Q_pelanggan DO
    begin
      Close;
      SQL.Text := 'DELETE FROM Akun WHERE IDPelanggan="' + L_pelanggan.Selected.SubItems.Strings[1] + '"';
      if MessageDlg('Anda yakin untuk menghapus data dengan Username : ' + L_pelanggan.Selected.SubItems.Strings[2], mtConfirmation, [mbYes, mbNo], 0) = id_YES then
        begin
          ExecSQL;
          	  no:=0;
	  WITH Q_pelanggan do
	  begin
		// KONEKSI
		Close;
		SQL.Clear;
		SQL.Add('SELECT * FROM Akun');
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
      dat.SubItems.Add(FieldValues['Username']);
      dat.SubItems.Add(FieldValues['Password1']);
      dat.SubItems.Add(FieldValues['Authority']);
		  next;
		  end;
		end;
	  end;
        end
    end;
  end;
end;

procedure TF_Akun.valueSChange(Sender: TObject);
var
  value: String;
  no: Integer;
  data:TListItem;
begin
  value:= valueS.Text;
  no:= 0;
  with Q_pelanggan do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM Akun WHERE IDPelanggan LIKE "%' + value + '%" OR Username LIKE "%' + value + '%" OR Password LIKE "%' + value + '%" OR Authority LIKE "%' + value + '%"');
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
        data.SubItems.Add(FieldValues['Username']);
        data.SubItems.Add(FieldValues['Password1']);
        data.SubItems.Add(FieldValues['Authority']);
        next;
      end;
    end;
  end;
end;

procedure TF_Akun.BitBtn7Click(Sender: TObject);
var
  txt: String;
begin
  txt := 'Created By Hanif Ahmad Syauqi';
  MessageDlg(txt, mtInformation, [mbOK], 0)
end;

procedure TF_Akun.BitBtn5Click(Sender: TObject);
begin
  //ShowMessage('Hi');
  F_Akun.Hide;
  F_menu.Show;
end;

end.
