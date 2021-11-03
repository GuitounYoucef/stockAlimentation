unit DataFacturationUnite;

interface

uses
  System.SysUtils, System.Variants, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
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
    FDQueryFacture: TFDQuery;
    FDQueryStocksNamesDestination: TFDQuery;
    FDTableStockid: TFDTable;
    FDQueryFindStockNum: TFDQuery;
    FDQueryFacturePayee: TFDQuery;
    FDTableFacturesAnnulees: TFDTable;
    procedure FDQueryFacturePayeeAfterScroll(DataSet: TDataSet);



  private
    { Déclarations privées }

  public
    { Déclarations publiques }
    function NouvelleFacture(Var Annee:string;var num:integer):string;
    function RechercheFacture(Var Annee:string;var num:integer):string;
    procedure EnregistrerFacture();
    procedure ValiderInforFavture(    Num:integer;
                                      Annee:string;
                                      NomSource:string;
                                      NomDestination:string;
                                      typeops:integer);
   procedure ValiderMontant(som,rest:real);
   function TrouverFournsNum(NomFourn:string):integer;
   function TrouverStockNum(NomStocke:string):integer;
   procedure SupprimerFacture();
   procedure NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;quantite:real;DateProd,Dateconsm:TDateTime);
   procedure SupprimerEntree();
   function FacturePayeeEstVide(Var Annee,NomDestination:string;var num:integer):boolean;


   var facture:Facture;


  end;

var
  DataFacturation: TDataFacturation;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitFacturation, Unit36;

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
procedure TDataFacturation.SupprimerEntree;
begin
    if FDQueryFactureEntrante.RecordCount>0 then
         FDQueryFactureEntrante.Delete;
end;

function TDataFacturation.FacturePayeeEstVide(Var Annee,NomDestination:string;var num:integer): boolean;
begin
    if FDQueryFacturePayee.RecordCount=0 then
    begin
       result:=true;
    end
    else begin
            Annee:=FDQueryFacturePayee.FieldValues['Annee'];
            num:=FDQueryFacturePayee.FieldValues['num'];
            NomDestination:= FDQueryFacturePayee.FieldValues['NomDestination'];
            result:=false;
         end;
end;

procedure TDataFacturation.FDQueryFacturePayeeAfterScroll(DataSet: TDataSet);
Var Annee:string;
    num:integer;
begin
  Annee:=FDQueryFacturePayee.FieldValues['annee'];
  Num:=FDQueryFacturePayee.FieldValues['num'];
  RechercheFacture(Annee,Num);
end;



procedure TDataFacturation.NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;
  quantite: real; DateProd, Dateconsm: TDateTime);
begin
      FDQueryFactureEntrante.Insert;
      FDQueryFactureEntrante.FieldValues['id']:=FDQueryFindProduitByCode.FieldValues['id'];
      FDQueryFactureEntrante.FieldValues['Annee']:=formFacturation.Annee;
      FDQueryFactureEntrante.FieldValues['num']:=formFacturation.Num;
      FDQueryFactureEntrante.FieldValues['type']:=FDQueryFindProduitByCode.FieldValues['type'];
      FDQueryFactureEntrante.FieldValues['producteur']:=FDQueryFindProduitByCode.FieldValues['id'];

      FDQueryFactureEntrante.FieldValues['QuantiteLot']:=FDQueryFindProduitByCode.FieldValues['QuantiteLot'];
      FDQueryFactureEntrante.FieldValues['PrixAchat']:=FDQueryFindProduitByCode.FieldValues['PrixAchat'];
      FDQueryFactureEntrante.FieldValues['PrixVente']:=FDQueryFindProduitByCode.FieldValues['PrixVente'];
      FDQueryFactureEntrante.FieldValues['PrixVenteGros']:=FDQueryFindProduitByCode.FieldValues['PrixVenteGros'];
      FDQueryFactureEntrante.FieldValues['code']:=FDQueryFindProduitByCode.FieldValues['code'];
      FDQueryFactureEntrante.FieldValues['balance']:=false;

      FDQueryFactureEntrante.FieldValues['Quantite']:=quantite;
      FDQueryFactureEntrante.FieldValues['DateProd']:=DateProd;
      FDQueryFactureEntrante.FieldValues['DateConsm']:=Dateconsm;
      FDQueryFactureEntrante.FieldValues['DateEntree']:=date;

      FDQueryFactureEntrante.FieldValues['NumUser']:=DataModule1.FDQuery115.FieldValues['NumUser'];

      FDQueryFactureEntrante.Next;
      FDQueryFactureEntrante.First;
      formFacturation.som:=0;
      while not FDQueryFactureEntrante.Eof do
      begin
         formFacturation.som:=formFacturation.som+FDQueryFactureEntrante.FieldValues['PrixAchat']*FDQueryFactureEntrante.FieldValues['Quantite'];
         FDQueryFactureEntrante.Next;
         formFacturation.dxGaugeControl1DigitalScale1.Value:=inttostr(formFacturation.som);
      end;
      if (FDQueryFindProduitByCode.FieldValues['Lien']<>null) then
             begin
               formFacturation.Image2.Picture.LoadFromFile(FDQueryFindProduitByCode.FieldValues['Lien']);
               formFacturation.Image2.Hide;
               formFacturation.Image2.Show;
             end
             else
               begin
                formFacturation.Image2.Picture:=nil;
                formFacturation.Image2.Hide;
                formFacturation.Image2.Show
               end;
end;



//------------------------------------------------------------------------------
function TDataFacturation.NouvelleFacture(Var Annee:string;var num:integer):string;
var myYear, myMonth, myDay : Word;

begin
    DecodeDate(Date, myYear, myMonth, myDay);
    Annee:=IntToStr(myYear);

    FDQueryNumFacture.Params.ParamValues['x']:=Annee;
    FDQueryNumFacture.Active:=false;
    FDQueryNumFacture.Active:=true;
    num:=FDQueryNumFacture.RecordCount+1;

    FDQueryFactureEntrante.Params.ParamValues['x']:=Annee;
    FDQueryFactureEntrante.Params.ParamValues['y']:=num;
    FDQueryFactureEntrante.Active:=false;
    FDQueryFactureEntrante.Active:=true;

    FDQueryFacture.Params.ParamValues['x']:=Annee;
    FDQueryFacture.Params.ParamValues['y']:=num;
    FDQueryFacture.Active:=false;
    FDQueryFacture.Active:=true;

    result:=Annee+'/'+inttostr(num);
end;

function TDataFacturation.RechercheFacture(var Annee: string;var num: integer): string;
begin
    FDQueryFactureEntrante.Params.ParamValues['x']:=Annee;
    FDQueryFactureEntrante.Params.ParamValues['y']:=num;
    FDQueryFactureEntrante.Active:=false;
    FDQueryFactureEntrante.Active:=true;

    FDQueryFacture.Params.ParamValues['x']:=Annee;
    FDQueryFacture.Params.ParamValues['y']:=num;
    FDQueryFacture.Active:=false;
    FDQueryFacture.Active:=true;

    result:=Annee+'/'+inttostr(num);
end;
 //------------------------------------------------------------------------------
procedure TDataFacturation.ValiderMontant(som,rest:real);
begin
    facture.total:=som;
    facture.reste:=rest;
    if som=rest then
      facture.TypePaiement:=1      // payee
    else facture.TypePaiement:=2;   // crédit
end;

procedure TDataFacturation.EnregistrerFacture();
begin
  if FDQueryFacture.recordcount=0 then
  begin
    FDQueryFacture.insert;
   FDQueryFacture.FieldValues['total']:=facture.total;
   FDQueryFacture.FieldValues['reste']:=facture.reste;
   FDQueryFacture.FieldValues['TypePaiement']:=facture.TypePaiement;

   FDQueryFacture.FieldValues['annee']:=facture.Annee;
   FDQueryFacture.FieldValues['num']:=facture.num;
   FDQueryFacture.FieldValues['Nomsource']:=facture.NomSource;
   FDQueryFacture.FieldValues['NomDestination']:=facture.NomDestination;

   FDQueryFacture.FieldValues['NumSource']:=facture.NumSource;
   FDQueryFacture.FieldValues['source']:=facture.source;

   FDQueryFacture.FieldValues['NumDestination']:=facture.NumDestination;
   FDQueryFacture.FieldValues['dat']:=date;
  end
  else
   begin
     FDQueryFacture.edit;
     FDQueryFacture.FieldValues['total']:=facture.total;
     FDQueryFacture.FieldValues['reste']:=facture.reste;
     FDQueryFacture.FieldValues['TypePaiement']:=facture.TypePaiement;
   end;
   FDQueryFacture.post;


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
