unit Unit36;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Phys.ODBCBase, FireDAC.Comp.UI,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Stan.StorageBin;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTableImprimante: TFDTable;
    FDQuery11: TFDQuery;
    FDQueryCredit1: TFDQuery;
    FDQueryClient1: TFDQuery;
    FDQueryCodebar1: TFDQuery;
    FDQueryImage1: TFDQuery;
    FDQueryNonrepete1: TFDQuery;
    FDQueryNumVente: TFDQuery;
    FDQueryQuantiteStock16: TFDQuery;
    FDQuerystockid25: TFDQuery;
    FDTableStockid25: TFDTable;
    FDTableParametrage: TFDTable;
    FDQuery115: TFDQuery;
    FDTableUsers15: TFDTable;
    FDQueryProtec15: TFDQuery;
    FDQueryType: TFDQuery;
    FDQueryProducteur: TFDQuery;
    DataSource91: TDataSource;
    DataSource92: TDataSource;
    FDQuery61: TFDQuery;
    FDQuery6Entree: TFDQuery;
    DataSource61: TDataSource;
    FDQueryStock8: TFDQuery;
    FDQueryFacture8: TFDQuery;
    FDQueryFournisseur8: TFDQuery;
    FDQueryNumFact8: TFDQuery;
    FDQueryStockid8: TFDQuery;
    FDQuerySelectFourns8: TFDQuery;
    FDQueryCodeProduit: TFDQuery;
    FDTableFacture8: TFDTable;
    FDQuerystockAll5: TFDQuery;
    FDQueryStock5: TFDQuery;
    FDQueryRechercheStock: TFDQuery;
    FDQueryProduitstock33: TFDQuery;
    FDTableStock33: TFDTable;
    FD8QuerySelectStockId: TFDQuery;
    FD34QueryFacPaie: TFDQuery;
    FD34Querydetail: TFDQuery;
    FD34QueryStockRetourne: TFDQuery;
    FD34QuerySom: TFDQuery;
    FD34TableRetourneFac: TFDTable;
    FDTableProduits: TFDTable;
    FD31QueryAlert: TFDQuery;
    FD27QueryRechIDProduitstock: TFDQuery;
    FD10QueryLikeFounisseurNom: TFDQuery;
    FD2QueryClient: TFDQuery;
    FD17TableDure: TFDTable;
    FD24TableUsers: TFDTable;
    FD28QueryProduitid: TFDQuery;
    FD30QuerySortieDate: TFDQuery;
    FD30Querysomsortie: TFDQuery;
    FD35TableRetourndeliv: TFDTable;
    FD35QueryStockRetourn: TFDQuery;
    FD35QueryListeVente: TFDQuery;
    FD35QueryDetailListe: TFDQuery;
    FD35Querysomlistedetail: TFDQuery;
    FD18QueryAlert: TFDQuery;
    FD18QueryExpire: TFDQuery;
    FD37TableActivation: TFDTable;
    FD37TableType: TFDTable;
    FD37TableSortie: TFDTable;
    FD37QueryTypeStock: TFDQuery;
    FD30QueryorderProduit: TFDQuery;
    FD30QueryOrderUtilisateur: TFDQuery;
    FD5Querysom: TFDQuery;
    FDTableSortieExpire: TFDTable;
    FD18QueryExpireRecordCount: TFDQuery;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDQRestore: TFDQuery;
    FDMemTable1: TFDMemTable;
    FDMemTable1com: TStringField;
    procedure FD34QueryFacPaieAfterScroll(DataSet: TDataSet);
    procedure FD34QuerydetailAfterScroll(DataSet: TDataSet);
    procedure FD35QueryListeVenteAfterScroll(DataSet: TDataSet);
    procedure FD35QueryDetailListeAfterScroll(DataSet: TDataSet);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitListeFactures, UnitListeVente, UnitDelivrence, UnitEtatStock;

{$R *.dfm}

procedure TDataModule1.FD34QuerydetailAfterScroll(DataSet: TDataSet);
begin
DataModule1.FD34QuerySom.Params.ParamValues['x']:=DataModule1.FD34QueryFacPaie.FieldValues['annee'];
DataModule1.FD34QuerySom.Params.ParamValues['y']:=DataModule1.FD34QueryFacPaie.FieldValues['num'];
DataModule1.FD34QuerySom.Close;
DataModule1.FD34QuerySom.Open;
if DataModule1.FD34QuerySom.RecordCount>0 then
FormListeFactures.dxGaugeControl1DigitalScale1.Value:=inttostr(DataModule1.FD34QuerySom.FieldValues['s']);
end;

procedure TDataModule1.FD34QueryFacPaieAfterScroll(DataSet: TDataSet);
begin
if DataModule1.FD34QueryFacPaie.RecordCount>0 then
begin
DataModule1.FD34Querydetail.Params.ParamValues['x']:=DataModule1.FD34QueryFacPaie.FieldValues['annee'];
DataModule1.FD34Querydetail.Params.ParamValues['y']:=DataModule1.FD34QueryFacPaie.FieldValues['num'];
DataModule1.FD34Querydetail.Close;
DataModule1.FD34Querydetail.Open;
end
else
begin
DataModule1.FD34Querydetail.Params.ParamValues['x']:=0;
DataModule1.FD34Querydetail.Params.ParamValues['y']:=0;
DataModule1.FD34Querydetail.Close;
DataModule1.FD34Querydetail.Open;
end
end;

procedure TDataModule1.FD35QueryDetailListeAfterScroll(DataSet: TDataSet);
begin
DataModule1.FD35Querysomlistedetail.Params.ParamValues['x']:=DataModule1.FD35QueryListeVente.FieldValues['annee'];
DataModule1.FD35Querysomlistedetail.Params.ParamValues['y']:=DataModule1.FD35QueryListeVente.FieldValues['num'];
DataModule1.FD35Querysomlistedetail.Close;
DataModule1.FD35Querysomlistedetail.Open;
if DataModule1.FD35Querysomlistedetail.RecordCount>0 then
FormListeVente.Edittotal.Text:=inttostr(DataModule1.FD35Querysomlistedetail.FieldValues['s'])+' دج ';
end;

procedure TDataModule1.FD35QueryListeVenteAfterScroll(DataSet: TDataSet);
begin
if DataModule1.FD35QueryListeVente.RecordCount>0 then
begin
DataModule1.FD35QueryDetailListe.Params.ParamValues['x']:=DataModule1.FD35QueryListeVente.FieldValues['annee'];
DataModule1.FD35QueryDetailListe.Params.ParamValues['y']:=DataModule1.FD35QueryListeVente.FieldValues['num'];
DataModule1.FD35QueryDetailListe.Params.ParamValues['z']:=DataModule1.FD35QueryListeVente.FieldValues['typevente'];
DataModule1.FD35QueryDetailListe.Active:=false;
DataModule1.FD35QueryDetailListe.Active:=true;
end;
end;

end.
