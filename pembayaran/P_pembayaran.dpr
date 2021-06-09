program P_pelanggan;

uses
  Forms,
  pembayaran in 'pembayaran.pas' {F_Pembayaran},
  EntryPembayaran in 'EntryPembayaran.pas' {F_EntryPembayaran},
  menu in '../menu.pas' {F_menu},
  pelanggan in '../pelanggan\pelanggan.pas' {F_Pelanggan},
  EntryPelanggan in '../pelanggan\EntryPelanggan.pas' {F_EntryPelanggan};

{$R P_pembayaran.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Pembayaran, F_Pembayaran);
  Application.CreateForm(TF_EntryPembayaran, F_EntryPembayaran);
  Application.CreateForm(TF_menu, F_menu);
  Application.Run;
end.
