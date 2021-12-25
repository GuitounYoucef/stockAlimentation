unit DataFraisUnit;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataFrais = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTableFrais: TFDTable;
    procedure NouneauFrais(Montant:real;Remarque:string);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataFrais: TDataFrais;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataFrais }

procedure TDataFrais.NouneauFrais(Montant: real; Remarque: string);
begin
FDTableFrais.Insert;
FDTableFrais.FieldValues['Montant']:=Montant;
FDTableFrais.FieldValues['Remarque']:=Remarque;
FDTableFrais.FieldValues['DateOp']:=date;
FDTableFrais.Post;
end;

end.
