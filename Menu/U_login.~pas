unit U_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, jpeg;

const
  InputBoxMessage = WM_USER + 200;

type
  TF_Login = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Timer1: TTimer;
    times: TLabel;
    Label3: TLabel;
    user: TEdit;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure InputBoxSetPasswordChar(var Msg: TMessage); 
    message InputBoxMessage;
  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;

implementation

uses menu, pelanggan, DB, U_Daftar;

{$R *.dfm}

//--------------[ CUSTOM FUNCTION ]----------------//

    // SWITCHER
procedure adminSession();
begin
        F_Login.Hide;
        F_menu.Show;
        F_menu.p_user.Caption := 'Status : Administrator';
        F_menu.bt_penggunaan.Enabled := false;
        F_menu.bt_pembayaran.Enabled := true;
        F_menu.bt_pelanggan.Enabled := true;
        F_menu.bt_tarif.Enabled := true;
        F_menu.bt_tagihan.Enabled := true;
        F_menu.Dpenggunaan.Enabled := false;
        F_menu.Dpembayaran.Enabled := true;
        F_menu.Dpelanggan.Enabled := true;
        F_menu.Dtarif.Enabled := true;
        F_menu.Dtagihan.Enabled := true;

        F_menu.PrPelanggan.Enabled := true;
        F_menu.PrPembayaran.Enabled := true;
        F_menu.PrPenggunaan.Enabled := true;
        F_menu.PrTagihan.Enabled := true;
        F_menu.PrTarif.Enabled := true;

        F_menu.akun.Enabled := true;

        F_menu.username.Caption := F_login.user.Text
end;


procedure petugasSession();
begin
        F_Login.Hide;
        F_menu.Show;
        F_menu.p_user.Caption := 'Status : Petugas';
        F_menu.bt_pelanggan.Enabled := false;
        F_menu.bt_tarif.Enabled := false;
        F_menu.bt_penggunaan.Enabled := true;
        F_menu.bt_pembayaran.Enabled := true;
        F_menu.bt_tagihan.Enabled := true;
        F_menu.Dpelanggan.Enabled := false;
        F_menu.Dtarif.Enabled := false;
        F_menu.Dpenggunaan.Enabled := true;
        F_menu.Dpembayaran.Enabled := true;
        F_menu.Dtagihan.Enabled := true;

        F_menu.PrPelanggan.Enabled := true;
        F_menu.PrPembayaran.Enabled := true;
        F_menu.PrPenggunaan.Enabled := true;
        F_menu.PrTagihan.Enabled := true;
        F_menu.PrTarif.Enabled := true;

        F_menu.akun.Enabled := false;

        F_menu.username.Caption := F_login.user.Text
end;

procedure penggunaSession();
begin
        F_Login.Hide;
        F_menu.Show;
        F_menu.p_user.Caption := 'Status : Pengguna';
        F_menu.bt_pelanggan.Enabled := false;
        F_menu.bt_tarif.Enabled := false;
        F_menu.bt_penggunaan.Enabled := false;
        F_menu.bt_pembayaran.Enabled := false;
        F_menu.bt_tagihan.Enabled := false;
        F_menu.Dpelanggan.Enabled := false;
        F_menu.Dtarif.Enabled := false;
        F_menu.Dpenggunaan.Enabled := false;
        F_menu.Dpembayaran.Enabled := false;
        F_menu.Dtagihan.Enabled := false;

        F_menu.PrPelanggan.Enabled := false;
        F_menu.PrPembayaran.Enabled := false;
        F_menu.PrPenggunaan.Enabled := false;
        F_menu.PrTagihan.Enabled := false;
        F_menu.PrTarif.Enabled := false;

        F_menu.akun.Enabled := false;

        F_menu.username.Caption := F_login.user.Text
end;

    // String Pass
procedure TF_Login.InputBoxSetPasswordChar(var Msg: TMessage);
var
  hInputForm, hEdit: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;

   // CHECKER
procedure userCheck();
var
  strPass: String;
  strUser: String;
  strType: String;
begin
  WITH F_menu.Q_Menu DO
  begin
  Close;
  SQL.Clear;
  SQL.Add('SELECT * FROM Akun');
  open;
  if (F_login.user.Text = '') then
    begin
      MessageDlg('Data masih ada yang kosong gan!', mtInformation, [mbOK], 0);
    end
  else if (F_menu.Q_Menu.Locate('Username', F_login.user.Text, [])) then
    begin
      // Cek data sukses, lanjut pengecekan password
      begin
      strUser := Dialogs.InputBox('Security Check', 'Dimohon Untuk Memasukan Password', '');
      Close;
      SQL.Clear;
      F_menu.Q_Menu.SQL.Text := 'SELECT * From Akun WHERE Username="' + F_login.user.Text + '"';
      F_menu.Q_Menu.Open;
      strPass := F_menu.Q_Menu.FieldByName('Password1').AsString;
      strType := F_menu.Q_Menu.FieldByName('Authority').AsString;
      if (strPass = strUser) then
        begin
          if (strType = 'Administrator') then
            begin
              adminSession()
            end
          else if (strType = 'Petugas') then
            begin
              petugasSession()
            end
          else
            begin
              penggunaSession()
            end;
        F_Login.user.Text := '';
        end
      else
        begin
          MessageDlg('Password salah!', mtWarning, [mbOK], 0);
        end;
      //showMessage(strPass);
      end
    end
  else
    begin
      MessageDlg('Mohon maaf akun dengan user ' + F_login.user.Text + ' tidak terdaftar!', mtWarning, [mbOK], 0);
    end
  end;
end;

//-------------------------------------------------//


procedure TF_Login.BitBtn1Click(Sender: TObject);
begin
  PostMessage(Handle, InputBoxMessage, 0, 0);
  userCheck();
end;


procedure TF_Login.Timer1Timer(Sender: TObject);
var
  tdy: TDateTime;
begin
  //WHILE TRUE DO
  //begin
    tdy := Now;
    times.Caption := TimeToStr(tdy) + ' ' + DateToStr(tdy)
  //end;
end;

procedure TF_Login.BitBtn3Click(Sender: TObject);
begin
  //Application.CreateForm(TF_Daftar, F_Daftar);
  F_Login.Hide;
  F_Daftar.Show;
  F_Login.user.Text := '';
end;

procedure TF_Login.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
