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
    FDQueryRechProdByIdCodeStock: TFDQuery;
    FDQueryAllStockByDate: TFDQuery;
    FDQueryAlert: TFDQuery;
    FDQueryExpire: TFDQuery;
    FDQueryExpireRecordCount: TFDQuery;
    FDQueryTypeProdStock: TFDQuery;
    FDQueryRechProdLikeId: TFDQuery;
    FDQueryStockInventaire: TFDQuery;
    FDQueryStockFacture: TFDQuery;
    FDQueryStockInventaireByProd: TFDQuery;
    FDQueryStockFactureByProd: TFDQuery;
    procedure NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;quantite:real;StockDest:integer;DateProd,Dateconsm:TDateTime);
    procedure selectStoke(StokeName:string);
    procedure selectAllStokes();
    procedure rechercheProdByName(ProdName:string);
    function rechercheProdByNameCodeSockid(ProdName,CodeProd:string;stockId:integer;Quantite:real):boolean;
    function UpDateQntProdByNameCodeSockid(ProdName,CodeProd:string;stockId:integer;Quantite:real):boolean;
    function ModifierQuantiteStock(numStock:integer;code,id:string;quantite:real):boolean;
    procedure RefrechStockQuery();


  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataStocks: TDataStocks;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitFacturation,  UnitEtatStock, DataParametrageUnite;

{$R *.dfm}

{ TDataStocks }
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
function TDataStocks.ModifierQuantiteStock(numStock: integer; code,id: string;
  quantite: real):boolean;
var q:real;
begin
  result:=false;
  q:=quantite;
  FDQueryRechProdByIdCodeStock.Params.ParamValues['x']:=id;
  FDQueryRechProdByIdCodeStock.Params.ParamValues['y']:=code;
  FDQueryRechProdByIdCodeStock.Params.ParamValues['z']:=numStock;
  FDQueryRechProdByIdCodeStock.Close;
  FDQueryRechProdByIdCodeStock.Open();
  if ((FDQueryRechProdByIdCodeStock.RecordCount>0) and (q<0)) then   // retourner
  begin
      FDQueryRechProdByIdCodeStock.Edit;
      FDQueryRechProdByIdCodeStock.FieldValues['quantite']:=FDQueryRechProdByIdCodeStock.FieldValues['quantite']-q;
      FDQueryRechProdByIdCodeStock.Post;
      result:=true;
  end
  else                                                 // retirer
  while ((not FDQueryRechProdByIdCodeStock.Eof) and (q>0)) do
  begin
    if FDQueryRechProdByIdCodeStock.FieldValues['quantite']-q<0 then
    begin

      FDQueryRechProdByIdCodeStock.Edit;
      if FDQueryRechProdByIdCodeStock.RecordCount=FDQueryRechProdByIdCodeStock.RecNo then
      if FDQueryRechProdByIdCodeStock.FieldValues['Num']<>0 then
      begin
         FDQueryRechProdByIdCodeStock.FieldValues['quantite']:=FDQueryRechProdByIdCodeStock.FieldValues['quantite']-q;
         result:=true;
      end
      else
         begin
           q:=q-FDQueryRechProdByIdCodeStock.FieldValues['quantite'];
           FDQueryRechProdByIdCodeStock.FieldValues['quantite']:=0;
         end;
      FDQueryRechProdByIdCodeStock.Post;
    end
    else
    begin
      FDQueryRechProdByIdCodeStock.Edit;
      FDQueryRechProdByIdCodeStock.FieldValues['quantite']:=FDQueryRechProdByIdCodeStock.FieldValues['quantite']-q;
      FDQueryRechProdByIdCodeStock.Post;
      q:=0;
      result:=true;
    end;
    FDQueryRechProdByIdCodeStock.Next;
  end;

end;

procedure TDataStocks.NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;
  quantite: real; StockDest: integer; DateProd, Dateconsm: TDateTime);
var myYear, myMonth, myDay : Word;

begin
      DecodeDate(Date, myYear, myMonth, myDay);

      FDTableStock.Insert;
      FDTableStock.FieldValues['Annee']:=IntToStr(myYear);
      FDTableStock.FieldValues['Num']:=0;

      FDTableStock.FieldValues['id']:=FDQueryFindProduitByCode.FieldValues['id'];
      FDTableStock.FieldValues['type']:=FDQueryFindProduitByCode.FieldValues['type'];
      FDTableStock.FieldValues['producteur']:=FDQueryFindProduitByCode.FieldValues['producteur'];

      FDTableStock.FieldValues['QuantiteLot']:=FDQueryFindProduitByCode.FieldValues['QuantiteLot'];
      FDTableStock.FieldValues['PrixAchat']:=FDQueryFindProduitByCode.FieldValues['PrixAchat'];
      FDTableStock.FieldValues['PrixVente']:=FDQueryFindProduitByCode.FieldValues['PrixVente'];
      FDTableStock.FieldValues['PrixVenteGros']:=FDQueryFindProduitByCode.FieldValues['PrixVenteGros'];
      FDTableStock.FieldValues['code']:=FDQueryFindProduitByCode.FieldValues['code'];
      FDTableStock.FieldValues['balance']:=false;

      FDTableStock.FieldValues['Quantite']:=quantite;
      FDTableStock.FieldValues['QuantiteInitial']:=quantite;
      FDTableStock.FieldValues['NumStock']:=StockDest;
      FDTableStock.FieldValues['DateProd']:=DateProd;
      FDTableStock.FieldValues['DateConsm']:=Dateconsm;
      FDTableStock.FieldValues['DateEntree']:=date;
      FDTableStock.FieldValues['Valide']:=true;

      FDTableStock.FieldValues['NumUser']:=DataParametrage.FDQueryLoginUser.FieldValues['NumUser'];
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
//------------------------------------------------------------------------------
procedure TDataStocks.rechercheProdByName(ProdName: string);
begin
    DataStocks.FDQueryEtatStokeId.Params.ParamValues['i']:='%'+ProdName+'%';
    DataStocks.FDQueryEtatStokeId.Active:=false;
    DataStocks.FDQueryEtatStokeId.Active:=true;

    DataStocks.FDQuerySomStoke.Params.ParamValues['i']:='%'+ProdName+'%';
    DataStocks.FDQuerySomStoke.Close;
    DataStocks.FDQuerySomStoke.Open();
end;
//------------------------------------------------------------------------------
function TDataStocks.rechercheProdByNameCodeSockid(ProdName, CodeProd: string;
  stockId: integer; Quantite: real): boolean;
begin
     FDQueryRechProdByIdCodeStock.Params.ParamValues['x']:=ProdName;
     FDQueryRechProdByIdCodeStock.Params.ParamValues['y']:=CodeProd;
     FDQueryRechProdByIdCodeStock.Params.ParamValues['z']:=stockId;
     FDQueryRechProdByIdCodeStock.Params.ParamValues['q']:=Quantite;
     FDQueryRechProdByIdCodeStock.Close;
     FDQueryRechProdByIdCodeStock.Open();
     if FDQueryRechProdByIdCodeStock.RecordCount>0 then
     result:=true
     else result:=false;
end;
procedure TDataStocks.RefrechStockQuery;
begin
FDQueryStockInventaire.Close;
FDQueryStockInventaire.Open();

FDQueryStockFacture.Close;
FDQueryStockFacture.Open();

FDQueryStockInventaireByProd.Close;
FDQueryStockInventaireByProd.Open();

FDQueryStockFactureByProd.Close;
FDQueryStockFactureByProd.Open();
end;

//------------------------------------------------------------------------------
function TDataStocks.UpDateQntProdByNameCodeSockid(ProdName, CodeProd: string;
  stockId: integer; Quantite: real): boolean;
  var qnt:real;
begin
   if rechercheProdByNameCodeSockid(ProdName, CodeProd,stockId,Quantite) then
       begin
          qnt:=FDQueryRechProdByIdCodeStock.FieldValues['Quantite'];
          qnt:=qnt-Quantite;
          FDQueryRechProdByIdCodeStock.Edit;
          FDQueryRechProdByIdCodeStock.FieldValues['Quantite']:=qnt;
          FDQueryRechProdByIdCodeStock.Post;
          result:=true;
       end
   else result:=false;
end;
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
end.
