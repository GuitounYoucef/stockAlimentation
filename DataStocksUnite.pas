unit DataStocksUnite;

interface

uses
  System.SysUtils,System.Variants, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TDataStocks = class(TDataModule)
    FDTableStock: TFDTable;
    FDQuerySelectStockId: TFDQuery;
    FDQuerystockAllbyId: TFDQuery;
    FDConnection1: TFDConnection;
    procedure NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;quantite:real;StockDest:integer;DateProd,Dateconsm:TDateTime);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataStocks: TDataStocks;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitFacturation, Unit36, UnitEtatStock;

{$R *.dfm}

{ TDataStocks }

procedure TDataStocks.NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;
  quantite: real; StockDest: integer; DateProd, Dateconsm: TDateTime);
begin
      FDTableStock.Insert;
      FDTableStock.FieldValues['id']:=FDQueryFindProduitByCode.FieldValues['id'];
      FDTableStock.FieldValues['type']:=FDQueryFindProduitByCode.FieldValues['type'];
      FDTableStock.FieldValues['producteur']:=FDQueryFindProduitByCode.FieldValues['id'];

      FDTableStock.FieldValues['QuantiteLot']:=FDQueryFindProduitByCode.FieldValues['QuantiteLot'];
      FDTableStock.FieldValues['PrixAchat']:=FDQueryFindProduitByCode.FieldValues['PrixAchat'];
      FDTableStock.FieldValues['PrixVente']:=FDQueryFindProduitByCode.FieldValues['PrixVente'];
      FDTableStock.FieldValues['PrixVenteGros']:=FDQueryFindProduitByCode.FieldValues['PrixVenteGros'];
      FDTableStock.FieldValues['code']:=FDQueryFindProduitByCode.FieldValues['code'];
      FDTableStock.FieldValues['balance']:=false;

      FDTableStock.FieldValues['Quantite']:=quantite;
      FDTableStock.FieldValues['NumStock']:=StockDest;
      FDTableStock.FieldValues['DateProd']:=DateProd;
      FDTableStock.FieldValues['DateConsm']:=Dateconsm;
      FDTableStock.FieldValues['DateEntree']:=date;

      FDTableStock.FieldValues['expire']:=false;
      FDTableStock.FieldValues['alert']:=false;
      //FDTableStock.FieldValues['NumUser']:=DataModule1.FDQuery115.FieldValues['NumUser'];
      FDTableStock.Next;

      if (FDQueryFindProduitByCode.FieldValues['Lien']<>null) then
             begin
               FormEtatStock.Image2.Picture.LoadFromFile(FDQueryFindProduitByCode.FieldValues['Lien']);
               FormEtatStock.Image2.Hide;
               FormEtatStock.Image2.Show;
             end
             else
               begin
                FormEtatStock.Image2.Picture:=nil;
                FormEtatStock.Image2.Hide;
                FormEtatStock.Image2.Show
               end;
end;

end.
