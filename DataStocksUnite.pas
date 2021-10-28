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
    FDQueryEtatStokeId: TFDQuery;
    FDConnection1: TFDConnection;
    FDQuerySomStoke: TFDQuery;
    FDTableStockid: TFDTable;
    procedure NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;quantite:real;StockDest:integer;DateProd,Dateconsm:TDateTime);
    procedure selectStoke(StokeName:string);
    procedure selectAllStokes();
    procedure rechercheProd(ProdName:string);
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
     selectAllStokes();
end;

procedure TDataStocks.rechercheProd(ProdName: string);
begin
    DataStocks.FDQueryEtatStokeId.Params.ParamValues['i']:='%'+ProdName+'%';
    DataStocks.FDQueryEtatStokeId.Active:=false;
    DataStocks.FDQueryEtatStokeId.Active:=true;

    DataStocks.FDQuerySomStoke.Params.ParamValues['i']:='%'+ProdName+'%';
    DataStocks.FDQuerySomStoke.Close;
    DataStocks.FDQuerySomStoke.Open();
end;

procedure TDataStocks.selectAllStokes;
begin
    DataStocks.FDQueryEtatStokeId.Params.ParamValues['x']:=0;
    DataStocks.FDQueryEtatStokeId.Params.ParamValues['y']:=100;
    FDQueryEtatStokeId.Params.ParamValues['i']:='%%';
    FDQueryEtatStokeId.Close;
    FDQueryEtatStokeId.Open();

    DataStocks.FDQuerySomStoke.Params.ParamValues['x']:=0;
    DataStocks.FDQuerySomStoke.Params.ParamValues['y']:=100;
    FDQuerySomStoke.Params.ParamValues['i']:='%%';
    FDQuerySomStoke.Close;
    FDQuerySomStoke.Open();
end;

procedure TDataStocks.selectStoke(StokeName:string);
begin
    FDQuerySelectStockId.Params.ParamValues['x']:=StokeName;
    FDQuerySelectStockId.Close;
    FDQuerySelectStockId.Open();
    if FDQuerySelectStockId.RecordCount=1 then
    begin
      FDQueryEtatStokeId.Params.ParamValues['x']:=FDQuerySelectStockId.FieldValues['numstock']-1;
      FDQueryEtatStokeId.Params.ParamValues['y']:=FDQuerySelectStockId.FieldValues['numstock']+1;
      FDQuerySomStoke.Params.ParamValues['x']:=FDQuerySelectStockId.FieldValues['numstock']-1;
      FDQuerySomStoke.Params.ParamValues['y']:=FDQuerySelectStockId.FieldValues['numstock']+1;
    end;
    FDQueryEtatStokeId.Params.ParamValues['i']:='%%';
    FDQueryEtatStokeId.Active:=false;
    FDQueryEtatStokeId.Active:=true;
    FDQuerySomStoke.Params.ParamValues['i']:='%%';
    FDQuerySomStoke.Close;
    FDQuerySomStoke.Open();
end;

end.
