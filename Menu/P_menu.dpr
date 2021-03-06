program Project1;

uses
  Forms,
  menu in 'menu.pas' {F_menu},
  pelanggan in '..\pelanggan\pelanggan.pas' {F_Pelanggan},
  EntryPelanggan in '..\pelanggan\EntryPelanggan.pas' {F_EntryPelanggan},
  pembayaran in '..\pembayaran\pembayaran.pas' {F_Pembayaran},
  EntryPembayaran in '..\pembayaran\EntryPembayaran.pas' {F_EntryPembayaran},
  penggunaan in '..\penggunaan\penggunaan.pas' {F_Penggunaan},
  EntryPenggunaan in '..\penggunaan\EntryPenggunaan.pas' {F_EntryPenggunaan},
  tarif in '..\tarif\tarif.pas' {F_Tarif},
  EntryTarif in '..\tarif\EntryTarif.pas' {F_EntryTarif},
  tagihan in '..\tagihan\tagihan.pas' {F_Tagihan},
  EntryTagihan in '..\tagihan\EntryTagihan.pas' {F_EntryTagihan},
  Akun in '..\Akun\Akun.pas' {F_Akun},
  EntryAkun in '..\Akun\EntryAkun.pas' {F_EntryAkun},
  U_login in 'U_login.pas' {F_Login},
  U_Daftar in 'U_Daftar.pas' {F_Daftar};

{$R P_menu.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Login, F_Login);
  Application.CreateForm(TF_menu, F_menu);
  Application.CreateForm(TF_Pelanggan, F_Pelanggan);
  Application.CreateForm(TF_EntryPelanggan, F_EntryPelanggan);
  Application.CreateForm(TF_Pembayaran, F_Pembayaran);
  Application.CreateForm(TF_EntryPembayaran, F_EntryPembayaran);
  Application.CreateForm(TF_Penggunaan, F_Penggunaan);
  Application.CreateForm(TF_EntryPenggunaan, F_EntryPenggunaan);
  Application.CreateForm(TF_Tarif, F_Tarif);
  Application.CreateForm(TF_EntryTarif, F_EntryTarif);
  Application.CreateForm(TF_Tagihan, F_Tagihan);
  Application.CreateForm(TF_EntryTagihan, F_EntryTagihan);
  Application.CreateForm(TF_Akun, F_Akun);
  Application.CreateForm(TF_EntryAkun, F_EntryAkun);
  Application.CreateForm(TF_Daftar, F_Daftar);
  Application.Run;
end.
