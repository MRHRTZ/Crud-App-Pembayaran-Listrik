unit U_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TF_Menu = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Aplikasi1: TMenuItem;
    Buku1: TMenuItem;
    Distributor1: TMenuItem;
    Data1: TMenuItem;
    DataPemasok1: TMenuItem;
    DataPenjualan1: TMenuItem;
    procedure Buku1Click(Sender: TObject);
    procedure Distributor1Click(Sender: TObject);
    procedure Data1Click(Sender: TObject);
    procedure DataPemasok1Click(Sender: TObject);
    procedure DataPenjualan1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Menu: TF_Menu;

implementation
uses U_Buku, U_Distributor, U_Kasir, U_Pemasok, U_Penjualan;

{$R *.dfm}

procedure TF_Menu.Buku1Click(Sender: TObject);
begin
  F_Buku.Show;
end;

procedure TF_Menu.Data1Click(Sender: TObject);
begin
  F_Kasir.Show;
end;

procedure TF_Menu.DataPemasok1Click(Sender: TObject);
begin
  F_Pemasok.Show;
end;

procedure TF_Menu.DataPenjualan1Click(Sender: TObject);
begin
  F_Penjualan.Show;
end;

procedure TF_Menu.Distributor1Click(Sender: TObject);
begin
  F_Distri.Show;
end;
procedure TF_Menu.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
