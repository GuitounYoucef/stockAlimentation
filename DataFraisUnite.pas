unit DataFraisUnite;

interface

uses
  System.SysUtils, System.Classes;

type
  TDatafrais = class(TDataModule)
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Datafrais: TDatafrais;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
