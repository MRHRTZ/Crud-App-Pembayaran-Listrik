program P_pelanggan;

uses
  Forms,
  pelanggan in 'pelanggan.pas' {F_Pelanggan},
  EntryPelanggan in 'EntryPelanggan.pas' {F_EntryPelanggan};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Pelanggan, F_Pelanggan);
  Application.CreateForm(TF_EntryPelanggan, F_EntryPelanggan);
  Application.Run;
end.
