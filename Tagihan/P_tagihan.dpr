program P_pelanggan;

uses
  Forms,
  tagihan in 'tagihan.pas' {F_Tagihan},
  EntryTagihan in 'EntryTagihan.pas' {F_EntryTagihan};

{$R P_tagihan.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Tagihan, F_Tagihan);
  Application.CreateForm(TF_EntryTagihan, F_EntryTagihan);
  Application.Run;
end.
