unit U_Daftar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  TF_Daftar = class(TForm)
    Img: TImage;
    Label1: TLabel;
    user: TEdit;
    pass: TEdit;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    times: TLabel;
    Timer1: TTimer;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    nometer: TEdit;
    imgF: TImage;
    imgT: TImage;
    checker: TStaticText;
    pid: TEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure nometerChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Daftar: TF_Daftar;

implementation

uses U_login, menu, pelanggan, DB;

{$R *.dfm}

procedure TF_Daftar.Timer1Timer(Sender: TObject);
var
  tdy: TDateTime;
begin
    tdy := Now;
    times.Caption := TimeToStr(tdy) + ' ' + DateToStr(tdy)
end;

procedure TF_Daftar.BitBtn1Click(Sender: TObject);
begin
  F_Daftar.Hide;
  F_Login.Show;
  user.Text := '';
  pass.Text := '';
end;

procedure TF_Daftar.BitBtn2Click(Sender: TObject);
begin
 WITH F_menu.Q_Menu DO
  begin
  Close;
  SQL.Clear;
  SQL.Add('SELECT * FROM Akun');
  open;
  if (user.Text = '') or (pass.Text = '') then
    begin
      MessageDlg('Data masih ada yang kosong gan!', mtInformation, [mbOK], 0);
    end
  else if (F_menu.Q_Menu.Locate('Username', user.Text, [])) then
    begin
      MessageDlg('Username ' + user.Text + ' telah digunakan!', mtInformation, [mbOK], 0);
    end
  else
    begin
    if (checker.Caption = 'true') then
      begin
        WITH F_menu.Q_Menu DO
          begin
          //ShowMessage(jumlah);
          Close;
          SQL.Clear;
          SQL.Text := 'INSERT INTO Akun values("' +
                      pid.Text + '","' +
                      user.Text + '","' +
                      pass.Text + '","' +
                      'Pengguna")';
          ExecSQL;
          MessageDlg('Data berhasil ditambahkan dengan username ' + user.Text + '!', mtInformation, [mbOK], 0);
          user.Text := '';
          pass.Text := '';
          F_Daftar.Hide;
          F_Login.Show;
          nometer.Text := '';
        end;
      end
    else
      begin
        MessageDlg('No meter tidak ada! Mohon hubungi admin. [ 085559038021 ] ', mtWarning, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TF_Daftar.BitBtn4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TF_Daftar.nometerChange(Sender: TObject);
var
  value: String;
  find: String;
  namaP: String;
  pidSTR: String;
begin
  value:= nometer.Text;
  F_menu.Q_Menu.SQL.Clear;
  F_menu.Q_Menu.SQL.Add('SELECT * FROM Pelanggan WHERE Nometer="' + value + '"');
  F_menu.Q_Menu.Open;
  namaP := F_menu.Q_Menu.FieldByName('Nama').AsString;
  find := F_menu.Q_Menu.FieldByName('nometer').AsString;
  pidSTR := F_menu.Q_Menu.FieldByName('IDPelanggan').AsString;
  if ( find = '' ) then
    begin
      pid.Hide;
      imgF.Show;
      imgT.Hide;
      checker.Caption := 'false';
    end
  else
    begin
      imgT.Show;
      imgF.Hide;
      pid.Show;
      pid.Enabled := false;
      pid.Text := pidSTR;
      user.Text := namaP;
      checker.Caption := 'true';
    end;
  //ShowMessage(find);
  F_menu.Q_Menu.Close;
end;

procedure TF_Daftar.FormCreate(Sender: TObject);
begin
 pid.Hide;
 nometer.Text := '';
 checker.Visible := false;
 imgT.Hide;
 imgF.Hide;
end;

end.
