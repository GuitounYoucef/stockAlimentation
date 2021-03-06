unit DataVenteUnit;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  Produits= record
    num:integer;
    id:string;
    code:string;
    producteur:string;
    quantite:real;
    PrixAchat:real;
    PrixVente:real;
    somme:real;
  end;
  Operation= record
      Num,
      typevente,
      TypePaim,
      NumCredit,
      NumStock,
      numUser,
      NumClient:integer;
      Annee,
      Client:string;
  end;


  TDataModuleVente = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQueryTrouverProd: TFDQuery;
    FDMemTableListProduit: TFDMemTable;
    FDMemTableListProduitnum: TIntegerField;
    FDMemTableListProduitid: TWideStringField;
    FDMemTableListProduitproducteur: TWideStringField;
    FDMemTableListProduitquantite: TFloatField;
    FDMemTableListProduitPrixVente: TFloatField;
    FDMemTableListProduitsomme: TFloatField;
    FDQuerySoties: TFDQuery;
    FDTableSorite: TFDTable;
    FDTableSortieProduits: TFDTable;
    FDQueryNumVente: TFDQuery;
    FDTableParametrage: TFDTable;
    FDMemTableListProduitCodeProduit: TStringField;
    FDMemTableListProduitPrixAchat: TFloatField;
    FDQueryListeProdBD: TFDQuery;
    FDQueryListOprsSortie: TFDQuery;
    FDQueryListeProdBDQuantite: TSingleField;
    FDQueryListeProdBDPrixAchat: TFloatField;
    FDQueryListeProdBDPrixVente: TSingleField;
    FDQueryListeProdBDNumOpr: TFMTBCDField;
    FDQueryListeProdBDCodeProduit: TWideStringField;
    FDQueryListeProdBDid: TWideStringField;
    FDQueryListeProdBDproducteur: TWideStringField;
    FDMemTableCredit: TFDMemTable;
    FDMemTableCreditCredit: TFloatField;
    FDQueryFindClientByName: TFDQuery;
    FDQueryTrouverProdTotal: TFDQuery;
  private
    { D?clarations priv?es }
  public
   //------------------------
   function TrouverPrduit(numStock,typevente:integer;id,code:string;quantite:real):Produits;
   procedure AjouterProdList(P:Produits);
   procedure SupprimerProdList(numList:integer);
   function CalculerSomme():real;
   //------------------------
   procedure NouvelleOpr(typvente:integer);
   function Parcourir(dist:integer):longint;
   procedure ValiderOpr(Opr:Operation);
   procedure NouvelleSorite(Opr:Operation);
   procedure AfficherListProd();
   //-------------------------
   procedure ModifierTypePaiment(TP:integer);
   procedure ModifierNomClient(Client:string);
   //---------------------------------
   function GetPrixAchatList():real;
   function GetPrixVenteList():real;
   procedure PutPrixVenteList(prix:real);
   function GetQuantiteList():real;
   procedure PutQuantiteList(Quantite:real);
   function GetCodeProduitList():string;
   function GetIdProduitList():string;
   function CalculerCredit():real;

   function estDernierOperation():boolean;
   function estListeProduit():boolean;


   //
   var
   operation:Operation;
   ListModifie:boolean;
    { D?clarations publiques }
  end;
var
  DataModuleVente: TDataModuleVente;
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses  UnitDelivrenceData, DataParametrageUnite, DataStocksUnite;

{$R *.dfm}

procedure TDataModuleVente.NouvelleOpr(typvente:integer);
var myYear, myMonth, myDay : Word;
begin
    DecodeDate(Date, myYear, myMonth, myDay);
    FDQueryNumVente.Params.ParamValues['x']:=inttostr(myYear);
    FDQueryNumVente.Params.ParamValues['y']:=typvente;
    FDQueryNumVente.Active:=false;
    FDQueryNumVente.Active:=true;
    operation.Num:=FDQueryNumVente.RecordCount+1;  // Nombre d'operations de vente

    operation.Annee:=inttostr(myYear);
    operation.typevente:=typvente;
    operation.TypePaim:=1;
    operation.NumClient:=0;
    operation.NumStock:=DataModuleVente.FDTableParametrage.FieldValues['stocknum'];
    operation.numUser:=DataParametrage.FDQueryLoginUser.FieldValues['Numuser'];
    //----------

    FDQueryListOprsSortie.Params.ParamValues['a']:=inttostr(myYear);
    FDQueryListOprsSortie.Params.ParamValues['t']:=typvente;
    FDQueryListOprsSortie.Close;
    FDQueryListOprsSortie.Open();
   FDQueryListOprsSortie.Last;

    if (operation.Num=1) then  // si la premiere operation je cree un nouveau enregitrement sinon je reste dans l'ancien operation(derniere)
        ValiderOpr(operation);
end;
//----------------------------------------------------
procedure TDataModuleVente.ValiderOpr(Opr:Operation);
begin
 {  if ((FDQueryListOprsSortie.RecordCount>0) and (FDQueryListeProdBD.RecordCount>0) and(operation.TypePaim=2)) then
   begin
      FDQueryListOprsSortie.Edit;
      FDQueryListOprsSortie.FieldValues['RestePayer']:=CalculerSomme();
      FDQueryListOprsSortie.Post;
   end;    }

    NouvelleSorite(Opr);
    AfficherListProd();
end;
//------------------------------------------------------------------------------
procedure TDataModuleVente.NouvelleSorite(Opr:Operation);
begin
    if ((Opr.Num>FDQueryListOprsSortie.RecordCount)or (Opr.Num=1)) then
    begin
    FDQueryListOprsSortie.Insert;
    FDQueryListOprsSortie.FieldValues['Annee']:=Opr.Annee;
    FDQueryListOprsSortie.FieldValues['Num']:=Opr.Num;
    FDQueryListOprsSortie.FieldValues['typevente']:=Opr.typevente;

   FDQueryListOprsSortie.FieldValues['Date']:=Date;
    FDQueryListOprsSortie.FieldValues['TypePaim']:=Opr.TypePaim;
   FDQueryListOprsSortie.FieldValues['NomClient']:='*';
    FDQueryListOprsSortie.FieldValues['NumClient']:=DataParametrage.TrouverNumClientParNom('*');




    FDQueryListOprsSortie.FieldValues['RestePayer']:=0;
    FDQueryListOprsSortie.FieldValues['numUser']:=Opr.numUser;
    FDQueryListOprsSortie.FieldValues['NumStock']:=Opr.NumStock;
    FDQueryListOprsSortie.FieldValues['LastUpdate']:=date;

    FDQueryListOprsSortie.Post;
    end;
end;
//------------------------------------------------
procedure TDataModuleVente.AfficherListProd();
begin
    FDQueryListOprsSortie.Params.ParamValues['a']:=Operation.Annee;
    FDQueryListOprsSortie.Params.ParamValues['t']:=Operation.typevente;
    FDQueryListOprsSortie.Active:=false;
    FDQueryListOprsSortie.Active:=true;
    FDQueryListOprsSortie.Last;
    FDQueryListeProdBD.Params.ParamValues['x']:=FDQueryListOprsSortie.FieldValues['NumOpr'];
    FDQueryListeProdBD.Close;
    FDQueryListeProdBD.Open();
end;
//------------------------------------------------

function TDataModuleVente.CalculerCredit():real;
var crd:credit;
    x:real;
begin

    result:=x;
end;

//------------------------------------------------------------------------------
function TDataModuleVente.TrouverPrduit(numStock,typevente:integer;id,code:string;quantite:real):Produits;
var listP:Produits;
begin
  FDQueryTrouverProd.Params.ParamValues['z']:=code;
  FDQueryTrouverProd.Params.ParamValues['x']:=id;
  FDQueryTrouverProd.Params.ParamValues['n']:=numStock;
  FDQueryTrouverProd.Close;
  FDQueryTrouverProd.Open();
  if FDQueryTrouverProd.RecordCount>0 then
    begin
       listP.num:=1;
       listP.id:=FDQueryTrouverProd.FieldValues['id'];
       listP.producteur:=FDQueryTrouverProd.FieldValues['producteur'];
       listP.code:=FDQueryTrouverProd.FieldValues['code'];
       listP.PrixAchat:=FDQueryTrouverProd.FieldValues['PrixAchat'];
       if typevente=2 then  // Vente Gros
       begin
          listP.quantite:=FDQueryTrouverProd.FieldValues['QuantiteLot']*quantite;
          listP.PrixVente:=FDQueryTrouverProd.FieldValues['PrixVenteGros'];
       end
       else
       begin   // Vente Detail
         listP.quantite:=quantite;
         listP.PrixVente:=FDQueryTrouverProd.FieldValues['PrixVente'];
       end;
       listP.somme:=listP.quantite*listP.PrixVente;
    end
  else listP.quantite:=0;
  result :=listP;
end;

//------------------------------------------------
procedure TDataModuleVente.AjouterProdList(P:Produits);
begin
    if P.quantite>0 then
    begin
    if not FDQueryListeProdBD.Locate('id',P.id,[]) then
    begin
      FDQueryListeProdBD.Insert;
      FDQueryListeProdBD.FieldValues['id']:=p.id;
      FDQueryListeProdBD.FieldValues['codeProduit']:=p.code;
      FDQueryListeProdBD.FieldValues['producteur']:=p.producteur;
      FDQueryListeProdBD.FieldValues['quantite']:=p.quantite;
      FDQueryListeProdBD.FieldValues['PrixVente']:=p.PrixVente;
      FDQueryListeProdBD.FieldValues['PrixAchat']:=p.PrixAchat;
      FDQueryListeProdBD.FieldValues['NumOpr']:=FDQueryListOprsSortie.FieldValues['NumOpr'];
      DataStocks.ModifierQuantiteStock(Operation.NumStock,p.code,p.id,p.quantite);
      FDQueryListeProdBD.Post;
    end
    else
    begin
      FDQueryListeProdBD.Edit;
      FDQueryListeProdBD.FieldValues['quantite']:=FDQueryListeProdBD.FieldValues['quantite']+p.quantite;
      DataStocks.ModifierQuantiteStock(Operation.NumStock,p.code,p.id,p.quantite);
      FDQueryListeProdBD.Post;
    end;
    end
end;
//------------------------------------------------
procedure TDataModuleVente.SupprimerProdList(numList:integer);
var i:integer;
begin
    if FDQueryListeProdBD.RecordCount>0 then
    begin
    DataStocks.ModifierQuantiteStock(operation.NumStock,
                                     FDQueryListeProdBD.FieldValues['CodeProduit'],
                                     FDQueryListeProdBD.FieldValues['id'],
                                     -FDQueryListeProdBD.FieldValues['Quantite']);
    FDQueryListeProdBD.Delete;
    end;
end;
 //------------------------------------------------
function TDataModuleVente.CalculerSomme():real;
var som:real;
begin
    som:=0;
    if FDQueryListeProdBD.RecordCount>0 then
    begin
        FDQueryListeProdBD.First;
        while not FDQueryListeProdBD.Eof do
        begin
          som:=som+FDQueryListeProdBD.FieldValues['PrixVente']*FDQueryListeProdBD.FieldValues['Quantite'];
          FDQueryListeProdBD.Next;
        end;
    end;
    result :=som;
end;
 //------------------------------------------------
function TDataModuleVente.estDernierOperation: boolean;
begin
if (FDQueryListOprsSortie.RecordCount=FDQueryListOprsSortie.RecNo) then
   result:=true
   else
   result:=false;
end;

function TDataModuleVente.estListeProduit: boolean;
begin
   if(FDQueryListeProdBD.RecordCount=0) then
     result:=true
     else
     result:=false;
end;

//------------------------------------------------



function TDataModuleVente.Parcourir(dist:integer):longint;
var p:produits;
begin
    if FDQueryListOprsSortie.RecordCount>0 then
    begin
    // charger la liste des produits
    FDQueryListeProdBD.Params.ParamValues['x']:=FDQueryListOprsSortie.FieldValues['NumOpr'];
    FDQueryListeProdBD.Close;
    FDQueryListeProdBD.Open();
    FDQueryListeProdBD.First;
    operation.Num:=FDQueryListOprsSortie.FieldValues['Num'];
    result:=FDQueryListOprsSortie.FieldValues['Num'];
    end else result:=0;
end;
//------------------------------------------------

procedure TDataModuleVente.ModifierTypePaiment(TP:integer);
begin
    if FDQueryListOprsSortie.RecordCount>0 then
    begin
   operation.TypePaim:=TP;
    FDQueryListOprsSortie.Edit;
    FDQueryListOprsSortie.FieldValues['TypePaim']:=TP;
    FDQueryListOprsSortie.Post;
    end;
end;
//------------------------------------------------------------------------------
procedure TDataModuleVente.ModifierNomClient(Client:string);
begin
 //   if FDQueryListOprsSortie.RecordCount>0 then
    begin
      FDQueryListOprsSortie.Edit;
      FDQueryListOprsSortie.FieldValues['NumClient']:=DataParametrage.TrouverNumClientParNom(Client);
      FDQueryListOprsSortie.Post;
    end;
end;
//------------------------------------------------------------------------------
function TDataModuleVente.GetPrixVenteList():real;
begin
    if FDQueryListeProdBD.RecordCount>0 then
       result:=FDQueryListeProdBD.FieldValues['PrixVente']
    else result:=-1;
end;
//------------------------------------------------------------------------------
function TDataModuleVente.GetPrixAchatList():real;
begin
    if FDQueryListeProdBD.RecordCount>0 then
       result:=FDQueryListeProdBD.FieldValues['PrixAchat']
    else result:=-1;
end;
//------------------------------------------------------------------------------
procedure TDataModuleVente.PutPrixVenteList(prix:real);
begin
    if FDQueryListeProdBD.RecordCount>0 then
    begin
        FDQueryListeProdBD.Edit;
        FDQueryListeProdBD.FieldValues['PrixVente']:=prix;
        FDQueryListeProdBD.Post;
    end;
end;
//------------------------------------------------------------------------------
function TDataModuleVente.GetQuantiteList():real;
begin
    if FDQueryListeProdBD.RecordCount>0 then
       result:=FDQueryListeProdBD.FieldValues['Quantite']
    else result:=-1;
end;
//------------------------------------------------------------------------------
procedure TDataModuleVente.PutQuantiteList(Quantite:real);
begin
    if FDQueryListeProdBD.RecordCount>0 then
    begin
      FDQueryListeProdBD.Edit;
      FDQueryListeProdBD.FieldValues['Quantite']:=Quantite;
      FDQueryListeProdBD.Post;
    end;

end;
//------------------------------------------------------------------------------
function TDataModuleVente.GetCodeProduitList():string;
begin
    if FDQueryListeProdBD.RecordCount>0 then
       result:=FDQueryListeProdBD.FieldValues['CodeProduit']
    else result:='*';
end;

function TDataModuleVente.GetIdProduitList: string;
begin
    if FDQueryListeProdBD.RecordCount>0 then
       result:=FDQueryListeProdBD.FieldValues['id']
    else result:='*';
end;

end.
