unit DataProduitsUnite;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TDataProduits = class(TDataModule)
    FDTableProduits: TFDTable;
    FDConnection1: TFDConnection;
    FDTableStocksNames: TFDTable;
    FDQueryFindProduitByCode: TFDQuery;
    procedure TrouverProduit(codeProd,id:string);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataProduits: TDataProduits;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TDataProduits.TrouverProduit(codeProd,id:string);
begin
    FDQueryFindProduitByCode.Params.ParamValues['c']:=codeProd;
    FDQueryFindProduitByCode.Params.ParamValues['i']:=id;
    FDQueryFindProduitByCode.Active:=false;
    FDQueryFindProduitByCode.Active:=true;
    if FDQueryFindProduitByCode.RecordCount=0 then
        FDQueryFindProduitByCode.Insert;
end;

end.
