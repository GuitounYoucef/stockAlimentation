unit UnitStockDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, dxGDIPlusClasses, Vcl.StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

type
  TFormStockDetail = class(TForm)
    GridPanel2: TGridPanel;
    DBGrid1: TDBGrid;
    DataSourceAllStockInventaire: TDataSource;
    GridPanel7: TGridPanel;
    Label10: TLabel;
    Image3: TImage;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DataSourceAllStockFacture: TDataSource;
    DBNavigator2: TDBNavigator;
    procedure rechByProd(id,code:string);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormStockDetail: TFormStockDetail;

implementation

{$R *.dfm}

uses UnitEtatStock,unit36,DataStocksUnite, UnitFacturation;

procedure TFormStockDetail.DBGrid2DblClick(Sender: TObject);
begin
  if DataSourceAllStockFacture.DataSet=DataStocks.FDQueryStockFacture then
     FormFacturation.RechercheFactureForm(DataStocks.FDQueryStockFacture.FieldValues['Annee'],
                                          DataStocks.FDQueryStockFacture.FieldValues['Num'])
  else if DataSourceAllStockFacture.DataSet=DataStocks.FDQueryStockFactureByProd then
           FormFacturation.RechercheFactureForm(DataStocks.FDQueryStockFactureByProd.FieldValues['Annee'],
                                                DataStocks.FDQueryStockFactureByProd.FieldValues['Num']);
  close();
end;

procedure TFormStockDetail.FormActivate(Sender: TObject);
begin
DataStocks.RefrechStockQuery();
end;

procedure TFormStockDetail.FormMouseEnter(Sender: TObject);
begin
    DataStocks.RefrechStockQuery();
end;

procedure TFormStockDetail.rechByProd(id, code: string);
begin
    DataStocks.FDQueryStockInventaireByProd.Params.ParamValues['i']:=id;
    DataStocks.FDQueryStockInventaireByProd.Params.ParamValues['c']:=code;
    DataStocks.FDQueryStockInventaireByProd.Close;
    DataStocks.FDQueryStockInventaireByProd.Open();

    DataStocks.FDQueryStockFactureByProd.Params.ParamValues['i']:=id;
    DataStocks.FDQueryStockFactureByProd.Params.ParamValues['c']:=code;
    DataStocks.FDQueryStockFactureByProd.Close;
    DataStocks.FDQueryStockFactureByProd.Open();

    FormStockDetail.DataSourceAllStockInventaire.DataSet:=DataStocks.FDQueryStockInventaireByProd;
    FormStockDetail.DataSourceAllStockFacture.DataSet:=DataStocks.FDQueryStockFactureByProd;
    show;
end;

end.
