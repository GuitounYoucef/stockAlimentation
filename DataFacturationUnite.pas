unit DataFacturationUnite;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  Facture= record
    Num:integer;
    Annee:string;
    total:real;
    reste:real;
    NomSource:string;
    NomDestination:string;
    source:integer;
    NumSource:integer;
    NumDestination:integer;
    TypePaiement:integer;
  end;
  TDataFacturation = class(TDataModule)
    FDQueryCodeProduit: TFDQuery;
    FDConnection1: TFDConnection;
    FDQueryFindProductInStoke: TFDQuery;
    FDQueryFactureEntrante: TFDQuery;
    FDQueryProducteur: TFDQuery;
    FDTableListFounisseurs: TFDTable;
    FDQueryStocksNamesSource: TFDQuery;
    FDQueryNumFacture: TFDQuery;
    FDQuerySelectFournsseurByName: TFDQuery;
    FDTableImprimante: TFDTable;
    FDTableFacture: TFDTable;
    FDQueryStocksNamesDestination: TFDQuery;
    FDTableStockid: TFDTable;
    FDQueryFindStockNum: TFDQuery;


  private
    { D�clarations priv�es }

  public
    { D�clarations publiques }
    procedure NouvelleFacture();
    procedure ValiderInforFavture(    Num:integer;
                                      Annee:string;
                                      NomSource:string;
                                      NomDestination:string;
                                      typeops:integer);
   procedure ValiderMontant(som,rest:real);
   function TrouverFournsNum(NomFourn:string):integer;
   function TrouverStockNum(NomStocke:string):integer;
   procedure SupprimerFacture();

   var facture:Facture;


  end;

var
  DataFacturation: TDataFacturation;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
function TDataFacturation.TrouverFournsNum(NomFourn:string):integer;
begin
        FDQuerySelectFournsseurByName.Params.ParamValues['x']:= NomFourn;
        FDQuerySelectFournsseurByName.Close;
        FDQuerySelectFournsseurByName.Open();
        if FDQuerySelectFournsseurByName.RecordCount=1 then
          result:=FDQuerySelectFournsseurByName.FieldValues['Num'];
end;
//------------------------------------------------------------------------------
function TDataFacturation.TrouverStockNum(NomStocke:string):integer;
begin
        FDQueryFindStockNum.Params.ParamValues['x']:= NomStocke;
        FDQueryFindStockNum.Close;
        FDQueryFindStockNum.Open();
        if FDQueryFindStockNum.RecordCount=1 then
           result:=FDQueryFindStockNum.FieldValues['NumStock'];
end;
//------------------------------------------------------------------------------
procedure TDataFacturation.ValiderInforFavture( Num:integer;
                                                Annee:string;
                                                NomSource:string;
                                                NomDestination:string;
                                                typeops:integer);
begin
facture.annee:=Annee;
facture.num:=num;
facture.Nomsource:=Nomsource;
facture.NomDestination:=NomDestination;
    if typeops=0 then   // source=fournisseur
      begin
        facture.NumSource:=TrouverFournsNum(NomSource);
        facture.source:=0;
      end
      else              // source=stocke
      begin
        facture.Numsource:=TrouverStockNum(NomSource);
        facture.source:=1;
      end;
      facture.NumDestination:=TrouverStockNum(NomDestination);
end;
//------------------------------------------------------------------------------
procedure TDataFacturation.ValiderMontant(som,rest:real);
begin
    facture.total:=som;
    facture.reste:=rest;
    if som=rest then
      facture.TypePaiement:=1
    else facture.TypePaiement:=2;
end;
//------------------------------------------------------------------------------
procedure TDataFacturation.NouvelleFacture();
begin
 FDTableFacture.insert;
 FDTableFacture.FieldValues['total']:=facture.total;
 FDTableFacture.FieldValues['reste']:=facture.reste;
 FDTableFacture.FieldValues['TypePaiement']:=facture.TypePaiement;

 FDTableFacture.FieldValues['annee']:=facture.Annee;
 FDTableFacture.FieldValues['num']:=facture.num;
 FDTableFacture.FieldValues['Nomsource']:=facture.NomSource;
 FDTableFacture.FieldValues['NomDestination']:=facture.NomDestination;

 FDTableFacture.FieldValues['NumSource']:=facture.NumSource;
 FDTableFacture.FieldValues['source']:=facture.source;

 FDTableFacture.FieldValues['NumDestination']:=facture.NumDestination;
 FDTableFacture.FieldValues['dat']:=date;
 FDTableFacture.Next;

end;
//------------------------------------------------------------------------------
procedure TDataFacturation.SupprimerFacture();
begin
      FDQueryFactureEntrante.Active:=false;
      FDQueryFactureEntrante.Active:=true;
      FDQueryFactureEntrante.First;
      while not FDQueryFactureEntrante.Eof do
                FDQueryFactureEntrante.Delete;
end;


end.