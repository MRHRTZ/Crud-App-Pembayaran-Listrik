unit tarif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Buttons, jpeg, ExtCtrls;

type
  TF_Tarif = class(TForm)
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
  F_Tarif: TF_Tarif;

implementation

uses EntryPelanggan, EntryTarif, menu;

{$R *.dfm}

procedure TF_Tarif.FormCreate(Sender: TObject);
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
    SQL.Add('SELECT * FROM Tarif');
    open;
    // TAMPIL VIEW
    IF NOT IsEmpty then
    begin
      WHILE NOT eof DO
      begin
      inc(no);
      dat := L_pelanggan.Items.Add;
      dat.Caption := IntToStr(no);
      dat.SubItems.Add(FieldValues['Kodetarif']);
      dat.SubItems.Add(FieldValues['Daya']);
      dat.SubItems.Add(FieldValues['Tarifperkwh']);
      next;
      end;
    end;
  end;
end;

procedure TF_Tarif.BitBtn1Click(Sender: TObject);
var
  dat:TListItem;
  no:Integer;
begin
  Application.CreateForm(TF_EntryTarif, F_EntryTarif);
  F_EntryTarif.Show;
  F_EntryTarif.patokan.Caption := 'ADD DATA PROCESS';
  no:=0;
  WITH Q_penggunaan do
  begin
    // KONEKSI
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Tarif');
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
      dat.SubItems.Add(FieldValues['Kodetarif']);
      dat.SubItems.Add(FieldValues['Daya']);
      dat.SubItems.Add(FieldValues['Tarifperkwh']);
      next;
      end;
    end;
  end;
end;

procedure TF_Tarif.BitBtn4Click(Sender: TObject);
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
    SQL.Add('SELECT * FROM Tarif');
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
      dat.SubItems.Add(FieldValues['Kodetarif']);
      dat.SubItems.Add(FieldValues['Daya']);
      dat.SubItems.Add(FieldValues['Tarifperkwh']);
      next;
      end;
    end;
  end;
end;

procedure TF_Tarif.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Yakin ingin keluar aplikasi?', mtConfirmation, [mbYes, mbNo], 0) = id_YES then
  begin
    Application.Terminate;
  end;
end;

procedure TF_Tarif.BitBtn2Click(Sender: TObject);
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
      F_EntryTarif.id.Text := SubItems.Strings[0];
      F_EntryTarif.bln.Text := SubItems.Strings[1];
      F_EntryTarif.thn.Text := SubItems.Strings[2];
    end;
    F_EntryTarif.Show;
    F_EntryTarif.patokan.Caption := 'EDIT DATA PROCESS';
    F_EntryTarif.id.Enabled := false;
    F_EntryTarif.bln.SetFocus;
  end;
end;

procedure TF_Tarif.BitBtn3Click(Sender: TObject);
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
      SQL.Text := 'DELETE FROM Tarif WHERE Kodetarif="' + L_pelanggan.Selected.SubItems.Strings[0] + '"';
      if MessageDlg('Anda yakin untuk menghapus data dengan ID : ' + L_pelanggan.Selected.SubItems.Strings[0], mtConfirmation, [mbYes, mbNo], 0) = id_YES then
        begin
          ExecSQL;
          	  no:=0;
	  WITH Q_penggunaan do
	  begin
		// KONEKSI
		Close;
		SQL.Clear;
		SQL.Add('SELECT * FROM Tarif');
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
		  dat.SubItems.Add(FieldValues['Kodetarif']);
      dat.SubItems.Add(FieldValues['Daya']);
      dat.SubItems.Add(FieldValues['Tarifperkwh']);
		  next;
		  end;
		end;
	  end;
        end
    end;
  end;
end;

procedure TF_Tarif.valueSChange(Sender: TObject);
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
    SQL.Add('SELECT * FROM Tarif WHERE Kodetarif LIKE "%' + value + '%" OR Daya LIKE "%' + value + '%" OR Tarifperkwh LIKE "%' + value + '%"');
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
        data.SubItems.Add(FieldValues['Kodetarif']);
        data.SubItems.Add(FieldValues['Daya']);
        data.SubItems.Add(FieldValues['Tarifperkwh']);
        next;
      end;
    end;
  end;
end;

procedure TF_Tarif.BitBtn7Click(Sender: TObject);
var
  txt: String;
begin
  txt := 'Created By Hanif Ahmad Syauqi';
  MessageDlg(txt, mtInformation, [mbOK], 0)
end;

procedure TF_Tarif.BitBtn5Click(Sender: TObject);
begin
  F_Tarif.Hide;
  F_menu.Show;
end;

end.
