unit EntryTagihan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TF_EntryTagihan = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    bln: TEdit;
    valid: TPanel;
    BitBtn1: TBitBtn;
    save: TBitBtn;
    BitBtn3: TBitBtn;
    tvalid: TLabel;
    patokan: TLabel;
    thn: TEdit;
    id: TComboBox;
    jm: TEdit;
    st: TEdit;
    Image4: TImage;
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
  F_EntryTagihan: TF_EntryTagihan;

implementation

uses tagihan, ADODB;

{$R *.dfm}           

procedure TF_EntryTagihan.BitBtn1Click(Sender: TObject);
begin
WITH F_Tagihan.Q_penggunaan DO
  begin
  Close;
  SQL.Clear;
  SQL.Add('SELECT * FROM Tagihan');
  open;
  if (id.Text = '') or (bln.Text = '') or (thn.Text = '') or (jm.Text = '') or (st.Text = '') then
    begin
      MessageDlg('Data masih ada yang kosong gan!', mtInformation, [mbOK], 0);  
      tvalid.Caption:='Validasi Cek Dibutuhkan!';
      valid.Color:=clYellow;
      save.Enabled:=false;
    end
  else if F_Tagihan.Q_penggunaan.Locate('IDPelanggan', id.Text, []) and (patokan.Caption = 'ADD DATA PROCESS') then
    begin
      MessageDlg('Sepertinya ID data ' + id.Text + ' telah ada, gunakan edit apabila ingin mengubah isi data tersebut!', mtInformation, [mbOK], 0);
    end
  //else if not maw.Text in ['0','1','2','3','4','5','6','7','8','9'] then
  //  begin
  //    MessageDlg('Not int', mtInformation, [mbYes], 0)
  //  end
  else
    begin
      tvalid.Caption:='Data Tervalidasi!';
      valid.Color:=clLime;
      save.Enabled:=true;
    end
  end;
end;

procedure TF_EntryTagihan.BitBtn3Click(Sender: TObject);
begin
  F_EntryTagihan.Close;
  tvalid.Caption:='Validasi Cek Dibutuhkan!';
  valid.Color:=clYellow;
  save.Enabled:=false;
end;

procedure TF_EntryTagihan.saveClick(Sender: TObject);
begin
  try
  if (patokan.Caption = 'ADD DATA PROCESS') then
  begin
    //if MessageDlg('Pastikan data meter awal dan meter akhir adalah nomer, atau tidak program akan berakhir!', mtConfirmation, [mbOK, mbCancel], 0) = id_OK then
    begin
      WITH F_Tagihan.Q_penggunaan DO
      begin
        SQL.Clear;
        SQL.Text := 'INSERT INTO Tagihan values("' +
                    id.Text + '","' +
                    bln.Text + '","' +
                    thn.Text + '","' +
                    jm.Text + '","' +
                    st.Text + '")';
        ExecSQL;
        F_EntryTagihan.Close;
        tvalid.Caption:='Validasi Cek Dibutuhkan!';
        valid.Color:=clYellow;
        save.Enabled:=false;
        MessageDlg('Data berhasil tersimpan dengan ID : ' + id.Text + ' ketik refresh untuk memperbarui data!', mtInformation, [mbOK], 0);
      end;
    end;
    //else
    //maw.Text:='';
    //mak.Text:='';
  end
  else
     //if MessageDlg('Pastikan data meter awal dan meter akhir adalah nomer, atau tidak program akan berakhir!', mtConfirmation, [mbOK, mbCancel], 0) = id_OK then
    begin
      WITH F_Tagihan.Q_penggunaan DO
      begin
        SQL.Clear;
        SQL.Text := 'Update Tagihan set Bulan="' +
                    bln.Text + '",Tahun="' +
                    thn.Text + '",Jumlahmeter="' +
                    jm.Text + '",Status="' +
                    st.Text + '" WHERE IDPelanggan="' + id.Text + '"';
        ExecSQL;
        F_EntryTagihan.Close;
        tvalid.Caption:='Validasi Cek Dibutuhkan!';
        valid.Color:=clYellow;
        save.Enabled:=false;
        MessageDlg('Data berhasil tersimpan dengan ID : ' + id.Text + ' ketik refresh untuk memperbarui data!', mtInformation, [mbOK], 0);
      end;
    end;
    //else
    //maw.Text:='';
    //mak.Text:='';
  Except
    MessageDlg('Terdapat kesalahan tidak diduga', mtWarning, [mbOK], 0)
  end;
end;

procedure TF_EntryTagihan.FormCreate(Sender: TObject);
begin
  WITH F_Tagihan.Q_penggunaan DO
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Pelanggan');
    open;
    begin
      id.Items.Clear;
      F_Tagihan.Q_penggunaan.First;
      WHILE NOT eof DO
      begin
        id.Items.Add(F_Tagihan.Q_penggunaan.FieldByName('IDPelanggan').AsString);
        F_Tagihan.Q_penggunaan.Next;
        //MessageDlg(F_Tarif.Q_penggunaan.FieldByName('IDPelanggan').AsString, mtInformation, [mbOK], 0)
      end;
    end;
  end;
end;

end.
