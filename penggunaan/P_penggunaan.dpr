program P_penggunaan;

uses
  Forms,
  penggunaan in 'penggunaan.pas' {F_Penggunaan},
  EntryPenggunaan in 'EntryPenggunaan.pas' {F_EntryPenggunaan};

{$R P_penggunaan.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Penggunaan, F_Penggunaan);
  Application.CreateForm(TF_EntryPenggunaan, F_EntryPenggunaan);
  Application.Run;
end.
