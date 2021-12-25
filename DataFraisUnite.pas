unit DataFraisUnite;

interface

uses
  System.SysUtils, System.Classes;

type
  TDatafrais = class(TDataModule)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Datafrais: TDatafrais;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
