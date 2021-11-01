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
    FDQueryProdDejaUtilise: TFDQuery;
    function TrouverProduit(codeProd,id:string):boolean;
    procedure FDQueryFindProduitByCodeAfterEdit(DataSet: TDataSet);
    procedure NouveauProduit();
    function TableProduitEstVite():boolean;
    procedure chargerImage(lien:string);
    function ProdDejaUtilise():boolean;
    procedure FDQueryFindProduitByCodeAfterPost(DataSet: TDataSet);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }


  end;

var
  DataProduits: TDataProduits;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitProduits, DataFacturationUnite;

{$R *.dfm}
procedure TDataProduits.chargerImage(lien: string);
begin
    FDTableProduits.Edit;
    FDTableProduits.FieldValues['lien']:=lien;
    FDTableProduits.Post;
end;

procedure TDataProduits.FDQueryFindProduitByCodeAfterEdit(DataSet: TDataSet);
begin
  FDQueryFindProduitByCode.Post;
end;

procedure TDataProduits.FDQueryFindProduitByCodeAfterPost(DataSet: TDataSet);
begin
  FDTableProduits.Close;
  FDTableProduits.Open();
end;

procedure TDataProduits.NouveauProduit;
begin
FDQueryFindProduitByCode.Insert;
end;

function TDataProduits.ProdDejaUtilise: boolean;
begin
    FDQueryProdDejaUtilise.Params.ParamValues['x']:=FDTableProduits.FieldValues['id'];
    FDQueryProdDejaUtilise.Params.ParamValues['y']:=FDTableProduits.FieldValues['code'];
    FDQueryProdDejaUtilise.Close;
    FDQueryProdDejaUtilise.Open;
    if FDQueryProdDejaUtilise.RecordCount=0 then
     result:=false
    else result:=true;
end;

function TDataProduits.TableProduitEstVite: boolean;
begin
    if FDTableProduits.RecordCount=0 then
    result:=true
    else result:=false;
end;

function TDataProduits.TrouverProduit(codeProd,id:string):boolean;
begin
    FDQueryFindProduitByCode.Params.ParamValues['c']:=codeProd;
    FDQueryFindProduitByCode.Params.ParamValues['i']:=id;
    FDQueryFindProduitByCode.Active:=false;
    FDQueryFindProduitByCode.Active:=true;
    if FDQueryFindProduitByCode.RecordCount=0 then
    begin
        FDQueryFindProduitByCode.Insert;
        if pos('*',id)=0 then
           FDQueryFindProduitByCode.FieldValues['id']:=id;
        if pos('*',codeProd)=0 then
           FDQueryFindProduitByCode.FieldValues['Code']:=codeProd;
        FDQueryFindProduitByCode.FieldValues['QuantiteLot']:=1;
        result:=false;
    end
    else result:=true;

end;

end.
