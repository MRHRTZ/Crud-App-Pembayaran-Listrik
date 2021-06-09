unit EntryPelanggan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TF_EntryPelanggan = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bln: TEdit;
    Label3: TLabel;
    thn: TEdit;
    maw: TEdit;
    Label4: TLabel;
    mak: TEdit;
    Label5: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    save: TBitBtn;
    BitBtn3: TBitBtn;
    valid: TLabel;
    patokan: TLabel;
    id: TComboBox;
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
  F_EntryPelanggan: TF_EntryPelanggan;

implementation

uses pelanggan, ADODB;

{$R *.dfm}

procedure TF_EntryPelanggan.BitBtn1Click(Sender: TObject);
begin
  WITH F_Pengunaan.Q_penggunaan DO
  begin
  Close;
  SQL.Clear;
  SQL.Add('SELECT * FROM Penggunaan');
  open;
  if (id.Text = '') or (bln.Text = '') or (thn.Text = '') or (maw.Text = '') or (mak.Text = '') then
    begin
      MessageDlg('Data masih ada yang kosong gan!', mtInformation, [mbOK], 0);  
      valid.Caption:='Validasi Cek Dibutuhkan!';
      valid.Color:=clYellow;
      save.Enabled:=false;
    end
  else if F_Pengunaan.Q_penggunaan.Locate('IDPelanggan', id.Text, []) and (patokan.Caption = 'ADD DATA PROCESS') then
    begin
      MessageDlg('Sepertinya ID data ' + id.Text + ' telah ada, gunakan edit apabila ingin mengubah isi data tersebut!', mtInformation, [mbOK], 0);
    end
  //else if not maw.Text in ['0','1','2','3','4','5','6','7','8','9'] then
  //  begin
  //    MessageDlg('Not int', mtInformation, [mbYes], 0)
  //  end
  else
    begin
      valid.Caption:='Data Tervalidasi!';
      valid.Color:=clLime;
      save.Enabled:=true;
    end
  end;
end;

procedure TF_EntryPelanggan.BitBtn3Click(Sender: TObject);
begin
  F_EntryPelanggan.Close;
  valid.Caption:='Validasi Cek Dibutuhkan!';
  valid.Color:=clYellow;
  save.Enabled:=false;
end;

procedure TF_EntryPelanggan.saveClick(Sender: TObject);
begin
  try
  if (patokan.Caption = 'ADD DATA PROCESS') then
  begin
    //if MessageDlg('Pastikan data meter awal dan meter akhir adalah nomer, atau tidak program akan berakhir!', mtConfirmation, [mbOK, mbCancel], 0) = id_OK then
    //begin
      WITH F_Pengunaan.Q_penggunaan DO
      begin
        SQL.Clear;
        SQL.Text := 'INSERT INTO Penggunaan values("' +
                    id.Text + '","' +
                    bln.Text + '","' +
                    thn.Text + '","' +
                    maw.Text + '","' +
                    mak.Text + '")';
        ExecSQL;
        F_EntryPelanggan.Close;
        valid.Caption:='Validasi Cek Dibutuhkan!';
        valid.Color:=clYellow;
        save.Enabled:=false;
        MessageDlg('Data berhasil tersimpan dengan ID : ' + id.Text + ' ketik refresh untuk memperbarui data!', mtInformation, [mbOK], 0);
      end;
    //end;
    //else
    //maw.Text:='';
    //mak.Text:='';
  end
  else
    // if MessageDlg('Pastikan data meter awal dan meter akhir adalah nomer, atau tidak program akan berakhir!', mtConfirmation, [mbOK, mbCancel], 0) = id_OK then
    //begin
      WITH F_Pengunaan.Q_penggunaan DO
      begin
        SQL.Clear;
        SQL.Text := 'Update Penggunaan set Bulan="' +
                    bln.Text + '",Tahun="' +
                    thn.Text + '",Meterawal="' +
                    maw.Text + '",Meterakhir="' +
                    mak.Text + '" WHERE IDPelanggan="' + id.Text + '"';
        ExecSQL;
        F_EntryPelanggan.Close;
        valid.Caption:='Validasi Cek Dibutuhkan!';
        valid.Color:=clYellow;
        save.Enabled:=false;
        MessageDlg('Data berhasil tersimpan dengan ID : ' + id.Text + ' ketik refresh untuk memperbarui data!', mtInformation, [mbOK], 0);
      end;
    //end
   // else
   // maw.Text:='';
   // mak.Text:='';
  Except
    MessageDlg('Terdapat kesalahan! pastikan meter awal dan meter akhir berbentuk angka', mtWarning, [mbOK], 0)
  end;
end;

procedure TF_EntryPelanggan.FormCreate(Sender: TObject);
begin
  WITH F_Pengunaan.Q_penggunaan DO
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Pelanggan');
    open;
    begin
      id.Items.Clear;
      F_Pengunaan.Q_penggunaan.First;
      WHILE NOT eof DO
      begin
        id.Items.Add(F_Pengunaan.Q_penggunaan.FieldByName('IDPelanggan').AsString);
        F_Pengunaan.Q_penggunaan.Next;
        //MessageDlg(F_Pengunaan.Q_penggunaan.FieldByName('IDPelanggan').AsString, mtInformation, [mbOK], 0)
      end;
    end;
  end;
end;

end.
