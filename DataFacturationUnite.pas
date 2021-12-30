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

    TypePaiement:integer;
  end;
  TDataFacturation = class(TDataModule)
    FDQueryCodeProduit: TFDQuery;
    FDConnection1: TFDConnection;
    FDQueryFactureRecords: TFDQuery;
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
    FDQueryListeFactures: TFDQuery;
    FDTableFacturesAnnulees: TFDTable;
    procedure FDQueryListeFacturesAfterScroll(DataSet: TDataSet);



  private
    { Déclarations privées }

  public
    { Déclarations publiques }
    function NouvelleFacture():string;
    function RechercheFacture(Var Annee:string;var num:integer):string;
    procedure EnregistrerFacture();
    procedure ValiderInforFacture(typeops:integer);
   procedure ValiderMontant(som,rest:real);
   function TrouverFournsNum(NomFourn:string):integer;
   function TrouverStockNum(NomStocke:string):integer;
   procedure SupprimerFacture();
   function NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;quantite:real;DateProd,Dateconsm:TDateTime):boolean;
   function SupprimerEntree():boolean;
   function ListeFactureEstVide(var Annee:string;var NomDestination:string;var num:integer):boolean;
   function EntreesFactureEstvide():boolean;
   function calculerSomFacture():real;
   procedure dataRefrech();
   var facture:Facture;
       som:longint;
  end;

var
  DataFacturation: TDataFacturation;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitFacturation,  DataStocksUnite, DataParametrageUnite;

{$R *.dfm}

//------------------------------------------------------------------------------
function TDataFacturation.NouvelleFacture():string;
var myYear, myMonth, myDay : Word;
begin
    DecodeDate(Date, myYear, myMonth, myDay);
    facture.annee:=IntToStr(myYear);

    FDQueryNumFacture.Params.ParamValues['x']:=facture.annee;
    FDQueryNumFacture.Active:=false;
    FDQueryNumFacture.Active:=true;
    facture.num:=FDQueryNumFacture.RecordCount+1;

    FDQueryFactureRecords.Params.ParamValues['x']:=facture.annee;
    FDQueryFactureRecords.Params.ParamValues['y']:=facture.num;
    FDQueryFactureRecords.Active:=false;
    FDQueryFactureRecords.Active:=true;


     FDQueryFacture.insert;
     FDQueryFacture.FieldValues['annee']:=facture.Annee;
     FDQueryFacture.FieldValues['num']:=facture.num;
     FDQueryFacture.Post;


    result:=facture.annee+'/'+inttostr(facture.num);
end;
//------------------------------------------------------------------------------
function TDataFacturation.RechercheFacture(var Annee: string;var num: integer): string;
begin
    FDQueryFactureRecords.Params.ParamValues['x']:=Annee;
    FDQueryFactureRecords.Params.ParamValues['y']:=num;
    FDQueryFactureRecords.Active:=false;
    FDQueryFactureRecords.Active:=true;

    FDQueryFacture.Params.ParamValues['x']:=Annee;
    FDQueryFacture.Params.ParamValues['y']:=num;
    FDQueryFacture.Active:=false;
    FDQueryFacture.Active:=true;

    facture.annee:=Annee;
    facture.num:=num;

    result:=Annee+'/'+inttostr(num);
end;
//------------------------------------------------------------------------------
procedure TDataFacturation.ValiderInforFacture(typeops:integer);
begin
   FDQueryFacture.Edit;
      if typeops=0 then   // source=fournisseur
        begin
          FDQueryFacture.FieldValues['NumSource']:=TrouverFournsNum(FDQueryFacture.FieldValues['NomSource']);
          FDQueryFacture.FieldValues['source']:=0;
        end
        else              // source=stocke
        begin
          FDQueryFacture.FieldValues['NumSource']:=TrouverStockNum(FDQueryFacture.FieldValues['NomSource']);
          FDQueryFacture.FieldValues['source']:=1;
        end;
        FDQueryFacture.FieldValues['NumDestination']:=TrouverStockNum(FDQueryFacture.FieldValues['NomDestination']);
        FDQueryFacture.FieldValues['DateEntree']:=date;
        FDQueryFacture.FieldValues['TypeEntree']:=2;   // 1 :inventaire; 2:facture
    FDQueryFacture.Post;
end;
//------------------------------------------------------------------------------
procedure TDataFacturation.EnregistrerFacture();
begin
   FDQueryFacture.edit;
   FDQueryFacture.FieldValues['total']:=facture.total;
   FDQueryFacture.FieldValues['reste']:=facture.reste;
   FDQueryFacture.FieldValues['TypePaiement']:=facture.TypePaiement;
   FDQueryFacture.post;

   FDQueryFactureRecords.First;
   while not FDQueryFactureRecords.Eof do
     begin
        if FDQueryFactureRecords.FieldValues['Valide']<>true then
             begin
                FDQueryFactureRecords.Edit;
                FDQueryFactureRecords.FieldValues['Valide']:=true;
                FDQueryFactureRecords.FieldValues['NumStock']:=FDQueryFacture.FieldValues['NumDestination'];
                FDQueryFactureRecords.Post;
             end;
        FDQueryFactureRecords.Next;
     end;

end;
//------------------------------------------------------------------------------
procedure TDataFacturation.SupprimerFacture();
begin
    FDQueryFactureRecords.Active:=false;
    FDQueryFactureRecords.Active:=true;
    FDQueryFactureRecords.First;
    while not FDQueryFactureRecords.Eof do
              FDQueryFactureRecords.Delete;
end;
//------------------------------------------------------------------------------
function TDataFacturation.ListeFactureEstVide(var Annee:string;var NomDestination:string;var num:integer): boolean;
begin
    if FDQueryListeFactures.RecordCount=0 then
    begin
       result:=true;
    end
    else begin
            Annee:=FDQueryListeFactures.FieldValues['Annee'];
            num:=FDQueryListeFactures.FieldValues['num'];
            NomDestination:= FDQueryListeFactures.FieldValues['NomDestination'];
            result:=false;
         end;
end;
//------------------------------------------------------------------------------
procedure TDataFacturation.FDQueryListeFacturesAfterScroll(DataSet: TDataSet);
Var Annee:string;
    num:integer;
begin
    Annee:=FDQueryListeFactures.FieldValues['annee'];
    Num:=FDQueryListeFactures.FieldValues['num'];
    RechercheFacture(Annee,Num);
end;
//------------------------------------------------------------------------------
function TDataFacturation.NouvelleEntree(FDQueryFindProduitByCode: TFDQuery;
  quantite: real; DateProd, Dateconsm: TDateTime):boolean;
begin
  result:=false;
  if (not FDQueryFactureRecords.Locate('id;code',VarArrayOf([FDQueryFindProduitByCode.FieldValues['id'],
                                                            FDQueryFindProduitByCode.FieldValues['code']]),[]))
   then
  begin
      FDQueryFactureRecords.Insert;
      FDQueryFactureRecords.FieldValues['id']:=FDQueryFindProduitByCode.FieldValues['id'];
      FDQueryFactureRecords.FieldValues['Annee']:=facture.Annee;
      FDQueryFactureRecords.FieldValues['num']:=facture.Num;
      FDQueryFactureRecords.FieldValues['type']:=FDQueryFindProduitByCode.FieldValues['type'];
      FDQueryFactureRecords.FieldValues['producteur']:=FDQueryFindProduitByCode.FieldValues['producteur'];

      FDQueryFactureRecords.FieldValues['QuantiteLot']:=FDQueryFindProduitByCode.FieldValues['QuantiteLot'];
      FDQueryFactureRecords.FieldValues['PrixAchat']:=FDQueryFindProduitByCode.FieldValues['PrixAchat'];
      FDQueryFactureRecords.FieldValues['PrixVente']:=FDQueryFindProduitByCode.FieldValues['PrixVente'];
      FDQueryFactureRecords.FieldValues['PrixVenteGros']:=FDQueryFindProduitByCode.FieldValues['PrixVenteGros'];
      FDQueryFactureRecords.FieldValues['code']:=FDQueryFindProduitByCode.FieldValues['code'];
      FDQueryFactureRecords.FieldValues['balance']:=false;

      FDQueryFactureRecords.FieldValues['QuantiteInitial']:=quantite;
      FDQueryFactureRecords.FieldValues['Quantite']:=quantite;
      FDQueryFactureRecords.FieldValues['DateProd']:=DateProd;
      FDQueryFactureRecords.FieldValues['DateConsm']:=Dateconsm;
      FDQueryFactureRecords.FieldValues['DateEntree']:=date;

      FDQueryFactureRecords.FieldValues['NumUser']:=DataParametrage.FDQueryLoginUser.FieldValues['NumUser'];

      FDQueryFactureRecords.Next;
      calculerSomFacture();
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
      result:=true;
  end;
end;
//------------------------------------------------------------------------------
function TDataFacturation.SupprimerEntree():boolean;
var b :boolean;
begin
    if FDQueryFactureRecords.RecordCount>0 then
     if FDQueryFactureRecords.FieldValues['Valide']=true then
        begin
          if FDQueryFactureRecords.FieldValues['QuantiteInitial']=FDQueryFactureRecords.FieldValues['Quantite'] then
          begin
               FDQueryFactureRecords.Delete;
               result:=true
          end
          else result:=false;
        end
        else
        begin
           FDQueryFactureRecords.Delete;
           result:=true;
        end;

end;
//------------------------------------------------------------------------------

function TDataFacturation.EntreesFactureEstvide(): boolean;
begin
   if FDQueryFactureRecords.RecordCount=0 then
      result:=true
   else result:=false;
end;
//------------------------------------------------------------------------------
function TDataFacturation.calculerSomFacture: real;
var som:real;
begin
    FDQueryFactureRecords.First;
    som:=0;
    while not FDQueryFactureRecords.Eof do
    begin
       som:=som+FDQueryFactureRecords.FieldValues['PrixAchat']*FDQueryFactureRecords.FieldValues['Quantite'];
       FDQueryFactureRecords.Next;
     end;
    formFacturation.dxGaugeControl1DigitalScale1.Value:=floattostr(som);
    result:=som;
end;

 //------------------------------------------------------------------------------
procedure TDataFacturation.ValiderMontant(som,rest:real);
begin
    facture.total:=som;
    facture.reste:=rest;
    if rest=0 then
      facture.TypePaiement:=1      // payee
    else facture.TypePaiement:=2;   // crédit
end;
//------------------------------------------------------------------------------
procedure TDataFacturation.dataRefrech;
begin
   FDTableListFounisseurs.close;
   FDTableListFounisseurs.open();
end;

//------------------------------------------------------------------------------
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

end.
