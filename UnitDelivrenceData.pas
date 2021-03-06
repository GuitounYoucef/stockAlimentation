unit UnitDelivrenceData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
Credit=record
     NumOpr,
     NumAncienVente,
     NumActuelVente:longint;
     total,payee:real;
end;

  TDataModuleDelivrence = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQueryListe: TFDQuery;
    FDQueryDelivrence: TFDQuery;
    FD12QueryImp: TFDQuery;
    FDQueryOprVente: TFDQuery;
    FDQueryListeParTypePaim: TFDQuery;
    FDQuerySortieDate: TFDQuery;
    FDQueryBenifsomsortie: TFDQuery;
    FDQueryBeniforderProduit: TFDQuery;
    FDQueryBenifOrderUtilisateur: TFDQuery;
    FDQueryFrais: TFDQuery;
    FDQuerySommeFrais: TFDQuery;
    procedure FDQueryDelivrenceAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
     { Déclarations publiques }
     procedure ChangerTypePaiement(index:integer);
     procedure ChangerTypeVente(index:integer);
     function SommeListProd():real;
     function RecupererCredit(NumClient:longint):Credit;
     procedure UpDateCredit(total,payee:real);
     procedure SetTypePaiementOprVente(NumOpr,typePaiement:integer);
     function SommeParTypePaiment(index:longint):real;
     procedure CalculerRevenu(var frais:real;Var ventes:real;var achats:real;date1,date2:string);

  end;

var
  DataModuleDelivrence: TDataModuleDelivrence;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TDataModuleDelivrence.SetTypePaiementOprVente(NumOpr,typePaiement:integer);
begin
FDQueryOprVente.Params.ParamValues['x']:=NumOpr;
FDQueryOprVente.Close;
FDQueryOprVente.Open();
while not FDQueryOprVente.Eof do
begin
  FDQueryOprVente.Edit;
  FDQueryOprVente.FieldValues['TypePaim']:=typePaiement;
  FDQueryOprVente.Next;
end;
end;
//-----------------------------------------------------------------------------
procedure TDataModuleDelivrence.UpDateCredit(total,payee:real);
var AncienCredit:credit;
begin


end;
//------------------------------------------------------------------------------
function TDataModuleDelivrence.RecupererCredit(NumClient:longint):Credit;
var crd:Credit;
begin

end;

//------------------------------------------------------------------------------
function TDataModuleDelivrence.SommeListProd():real;
var som:real;
begin
som:=0;
if FDQueryListe.RecordCount>0 then
begin
FDQueryListe.First;
while not FDQueryListe.Eof do
    begin
      som:=som+FDQueryListe.FieldValues['PrixVente']*FDQueryListe.FieldValues['Quantite'];
      FDQueryListe.Next;
    end;
end;
result:=som;
end;
//------------------------------------------------------------------------------
function TDataModuleDelivrence.SommeParTypePaiment(index:longint):real;
var som:real;
begin
som:=0;
FDQueryListeParTypePaim.Params.ParamValues['x']:=index;
FDQueryListeParTypePaim.Close;
FDQueryListeParTypePaim.Open();
if FDQueryListeParTypePaim.RecordCount>0 then
begin
FDQueryListeParTypePaim.First;
while not FDQueryListeParTypePaim.Eof do
    begin
      som:=som+FDQueryListeParTypePaim.FieldValues['PrixVente']*FDQueryListeParTypePaim.FieldValues['Quantite'];
      FDQueryListeParTypePaim.Next;
    end;
end;
result:=som;
end;
//------------------------------------------------------------------------------
procedure TDataModuleDelivrence.CalculerRevenu(var frais:real;var ventes: real;
  var achats: real;date1,date2:string);
begin
    FDQueryBenifsomsortie.Params.ParamValues['x']:=date1;
    FDQueryBenifsomsortie.Params.ParamValues['y']:=date2;
    FDQueryBenifsomsortie.Active:=false;
    FDQueryBenifsomsortie.Active:=true;
    if FDQueryBenifsomsortie.RecordCount>0 then
    begin
      ventes:=FDQueryBenifsomsortie.FieldValues['ventes'];
      achats:=DataModuleDelivrence.FDQueryBenifsomsortie.FieldValues['achats'];
    end;

    FDQuerySortieDate.Params.ParamValues['x']:=date1;
    FDQuerySortieDate.Params.ParamValues['y']:=date2;
    FDQuerySortieDate.Active:=false;
    FDQuerySortieDate.Active:=true;

    FDQueryBeniforderProduit.Params.ParamValues['x']:=date1;
    FDQueryBeniforderProduit.Params.ParamValues['y']:=date2;
    FDQueryBeniforderProduit.Active:=false;
    FDQueryBeniforderProduit.Active:=true;

    FDQueryBenifOrderUtilisateur.Params.ParamValues['x']:=date1;
    FDQueryBenifOrderUtilisateur.Params.ParamValues['y']:=date2;
    FDQueryBenifOrderUtilisateur.Active:=false;
    FDQueryBenifOrderUtilisateur.Active:=true;

    FDQueryFrais.Params.ParamValues['x']:=date1;
    FDQueryFrais.Params.ParamValues['y']:=date2;
    FDQueryFrais.Active:=false;
    FDQueryFrais.Active:=true;
    if FDQueryFrais.RecordCount>0 then
    begin
    FDQuerySommeFrais.Params.ParamValues['x']:=date1;
    FDQuerySommeFrais.Params.ParamValues['y']:=date2;
    FDQuerySommeFrais.Active:=false;
    FDQuerySommeFrais.Active:=true;
    frais:=FDQuerySommeFrais.FieldValues['somme']
    end
    else frais:=0;

end;
//------------------------------------------------------------------------------
procedure TDataModuleDelivrence.ChangerTypePaiement(index:integer);  //recherche avec type de paiment
begin
case index of
0: begin                   //payee
    FDQueryDelivrence.Params.ParamValues['x2']:=2;
    FDQueryDelivrence.Params.ParamValues['x1']:=0;
    FDQueryListe.Params.ParamValues['x1']:=0;
    FDQueryListe.Params.ParamValues['x2']:=2;
   end;
1: begin                   // credit
    FDQueryDelivrence.Params.ParamValues['x2']:=3;
    FDQueryDelivrence.Params.ParamValues['x1']:=1;
    FDQueryListe.Params.ParamValues['x2']:=3;
    FDQueryListe.Params.ParamValues['x1']:=1;
   end;
3: begin                   // tous
    FDQueryDelivrence.Params.ParamValues['x2']:=4;
    FDQueryDelivrence.Params.ParamValues['x1']:=0;
    FDQueryListe.Params.ParamValues['x2']:=4;
    FDQueryListe.Params.ParamValues['x1']:=0;
   end;
2: begin                   // credit payee
    FDQueryDelivrence.Params.ParamValues['x2']:=4;
    FDQueryDelivrence.Params.ParamValues['x1']:=2;
    FDQueryListe.Params.ParamValues['x2']:=4;
    FDQueryListe.Params.ParamValues['x1']:=2;
   end;
end;
FDQueryDelivrence.Close;
FDQueryDelivrence.Open;
if FDQueryDelivrence.RecordCount=0 then
   FDQueryListe.Close;
end;
//------------------------------------------------------------------------------
procedure TDataModuleDelivrence.ChangerTypeVente(index:integer);
begin
case index of
0: begin                     //vente detail
    FDQueryDelivrence.Params.ParamValues['y2']:=2;
    FDQueryDelivrence.Params.ParamValues['y1']:=0;
    FDQueryListe.Params.ParamValues['y2']:=2;
    FDQueryListe.Params.ParamValues['y1']:=0;
    end;
1: begin                     //  vente gros
    FDQueryDelivrence.Params.ParamValues['y2']:=3;
    FDQueryDelivrence.Params.ParamValues['y1']:=1;
    FDQueryListe.Params.ParamValues['y2']:=3;
    FDQueryListe.Params.ParamValues['y1']:=1;
   end;
2: begin                       // tous
    FDQueryDelivrence.Params.ParamValues['y2']:=3;
    FDQueryDelivrence.Params.ParamValues['y1']:=0;
    FDQueryListe.Params.ParamValues['y2']:=3;
    FDQueryListe.Params.ParamValues['y1']:=0;
   end;
end;
DataModuleDelivrence.FDQueryDelivrence.Close;
DataModuleDelivrence.FDQueryDelivrence.Open;
if DataModuleDelivrence.FDQueryDelivrence.RecordCount=0 then
   DataModuleDelivrence.FDQueryListe.Close;
end;
procedure TDataModuleDelivrence.DataModuleCreate(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure TDataModuleDelivrence.FDQueryDelivrenceAfterScroll(
  DataSet: TDataSet);
begin
if FDQueryDelivrence.RecordCount>0 then
begin
FDQueryListe.Params.ParamValues['c']:=FDQueryDelivrence.FieldValues['client'];
FDQueryListe.Close;
FDQueryListe.Open;
end
end;
//------------------------------------------------------------------------------
end.
