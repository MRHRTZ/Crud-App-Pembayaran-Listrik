unit EntryTarif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TF_EntryTarif = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bln: TEdit;
    valid: TPanel;
    BitBtn1: TBitBtn;
    save: TBitBtn;
    BitBtn3: TBitBtn;
    tvalid: TLabel;
    patokan: TLabel;
    thn: TEdit;
    id: TComboBox;
    Image1: TImage;
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
  F_EntryTarif: TF_EntryTarif;

implementation

uses pelanggan, ADODB, tarif;

{$R *.dfm}           

procedure TF_EntryTarif.BitBtn1Click(Sender: TObject);
begin
WITH F_Tarif.Q_penggunaan DO
  begin
  Close;
  SQL.Clear;
  SQL.Add('SELECT * FROM Tarif');
  open;
  if (id.Text = '') or (bln.Text = '') or (thn.Text = '') then
    begin
      MessageDlg('Data masih ada yang kosong gan!', mtInformation, [mbOK], 0);  
      tvalid.Caption:='Validasi Cek Dibutuhkan!';
      valid.Color:=clYellow;
      save.Enabled:=false;
    end
  else if F_Tarif.Q_penggunaan.Locate('Kodetarif', id.Text, []) and (patokan.Caption = 'ADD DATA PROCESS') then
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

procedure TF_EntryTarif.BitBtn3Click(Sender: TObject);
begin
  F_EntryTarif.Close;
  tvalid.Caption:='Validasi Cek Dibutuhkan!';
  valid.Color:=clYellow;
  save.Enabled:=false;
end;

procedure TF_EntryTarif.saveClick(Sender: TObject);
begin
  try
  if (patokan.Caption = 'ADD DATA PROCESS') then
  begin
    //if MessageDlg('Pastikan data meter awal dan meter akhir adalah nomer, atau tidak program akan berakhir!', mtConfirmation, [mbOK, mbCancel], 0) = id_OK then
    begin
      WITH F_Tarif.Q_penggunaan DO
      begin
        SQL.Clear;
        SQL.Text := 'INSERT INTO Tarif values("' +
                    id.Text + '","' +
                    bln.Text + '","' +
                    thn.Text + '")';
        ExecSQL;
        F_EntryTarif.Close;
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
      WITH F_Tarif.Q_penggunaan DO
      begin
        SQL.Clear;
        SQL.Text := 'Update Tarif set Daya="' +
                    bln.Text + '",Tarifperkwh="' +
                    thn.Text + '" WHERE Kodetarif="' + id.Text + '"';
        ExecSQL;
        F_EntryTarif.Close;
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
    MessageDlg('Terdapat kesalahan! pastikan anda memasukan dengan tipe data yang benar.', mtWarning, [mbOK], 0)
  end;
end;

procedure TF_EntryTarif.FormCreate(Sender: TObject);
begin
  WITH F_Tarif.Q_penggunaan DO
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Pelanggan');
    open;
    begin
      id.Items.Clear;
      F_Tarif.Q_penggunaan.First;
      WHILE NOT eof DO
      begin
        id.Items.Add(F_Tarif.Q_penggunaan.FieldByName('IDPelanggan').AsString);
        F_Tarif.Q_penggunaan.Next;
        //MessageDlg(F_Tarif.Q_penggunaan.FieldByName('IDPelanggan').AsString, mtInformation, [mbOK], 0)
      end;
    end;
  end;
end;

end.
