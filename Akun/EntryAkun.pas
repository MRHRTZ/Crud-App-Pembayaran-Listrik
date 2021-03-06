unit EntryAkun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TF_EntryAkun = class(TForm)
    Panel1: TPanel;
    id: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    nama: TEdit;
    alamat: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    valid: TPanel;
    BitBtn1: TBitBtn;
    save: TBitBtn;
    BitBtn3: TBitBtn;
    tvalid: TLabel;
    patokan: TLabel;
    Image1: TImage;
    IDP: TComboBox;
    kode: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_EntryAkun: TF_EntryAkun;

implementation

uses pelanggan, ADODB, EntryPelanggan, Akun;

{$R *.dfm}

procedure TF_EntryAkun.BitBtn1Click(Sender: TObject);
begin
  WITH F_Pelanggan.Q_pelanggan DO
  begin
  Close;
  SQL.Clear;
  SQL.Add('SELECT * FROM Akun');
  open;
  if (id.Text = '') or (IDP.Text = '') or (nama.Text = '') or (alamat.Text = '') or (kode.Text = '') then
    begin
      MessageDlg('Data masih ada yang kosong gan!', mtInformation, [mbOK], 0);  
      tvalid.Caption:='Validasi Cek Dibutuhkan!';
      valid.Color:=clYellow;
      save.Enabled:=false;
    end
  else if (F_Pelanggan.Q_pelanggan.Locate('IDAkun', id.Text, [])) and (patokan.Caption = 'ADD DATA PROCESS') then
    begin
      MessageDlg('Sepertinya ID data ' + id.Text + ' telah ada, gunakan edit apabila ingin mengubah isi data tersebut!', mtInformation, [mbOK], 0);
    end
  else
    begin
      tvalid.Caption:='Data Tervalidasi!';
      valid.Color:=clLime;
      save.Enabled:=true;
    end
  end;
end;

procedure TF_EntryAkun.BitBtn3Click(Sender: TObject);
begin
  F_EntryAkun.Close;
  tvalid.Caption:='Validasi Cek Dibutuhkan!';
  valid.Color:=clYellow;
  save.Enabled:=false;
end;

procedure TF_EntryAkun.saveClick(Sender: TObject);
begin
  try
  if (patokan.Caption = 'ADD DATA PROCESS') then
    begin
      WITH F_Akun.Q_pelanggan DO
      begin                      
        SQL.Clear;
        SQL.Text := 'INSERT INTO Akun values("' +
                    id.Text + '","' +
                    IDP.Text + '","' +
                    nama.Text + '","' +
                    alamat.Text + '","' +
                    kode.Text + '")';
        ExecSQL;
        F_EntryAkun.Close;
        tvalid.Caption:='Validasi Cek Dibutuhkan!';
        valid.Color:=clYellow;
        save.Enabled:=false;
        MessageDlg('Data berhasil ditambahkan dengan ID : ' + id.Text + ' ketik refresh untuk memperbarui data!', mtInformation, [mbOK], 0);
      end;
    end
  else
  begin
    WITH F_Akun.Q_pelanggan DO
      begin
        SQL.Clear;
        SQL.Text := 'Update Akun set IDPelanggan="' +
                    IDP.Text + '",Username="' +
                    nama.Text + '",Password1="' +
                    alamat.Text + '",Authority="' +
                    kode.Text + '" WHERE IDAkun="' + id.Text + '"';

        ExecSQL;
        F_EntryAkun.Close;
        tvalid.Caption:='Validasi Cek Dibutuhkan!';
        valid.Color:=clYellow;
        save.Enabled:=false;
        MessageDlg('Data berhasil diedit dengan ID : ' + id.Text + ' ketik refresh untuk memperbarui data!', mtInformation, [mbOK], 0);
      end;
    end;
  Except
    MessageDlg('Terdapat kesalahan tidak diduga', mtWarning, [mbOK], 0)
  end;
end;

procedure TF_EntryAkun.FormCreate(Sender: TObject);
begin
  WITH F_Akun.Q_pelanggan DO
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Pelanggan');
    open;
    begin
      IDP.Items.Clear;
      F_Akun.Q_pelanggan.First;
      WHILE NOT eof DO
      begin
        IDP.Items.Add(F_Akun.Q_pelanggan.FieldByName('IDPelanggan').AsString);
        F_Akun.Q_pelanggan.Next;
        //MessageDlg(F_Pengunaan.Q_penggunaan.FieldByName('IDPelanggan').AsString, mtInformation, [mbOK], 0)
      end;
    end;
  end;
end;

end.
