program P_pelanggan;

uses
  Forms,
  tarif in 'tarif.pas' {F_Tarif},
  EntryTarif in 'EntryTarif.pas' {F_EntryTarif};

{$R P_tarif.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Tarif, F_Tarif);
  Application.CreateForm(TF_EntryTarif, F_EntryTarif);
  Application.Run;
end.
