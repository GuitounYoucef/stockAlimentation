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
    DataSourceAllStockByDate: TDataSource;
    DBNavigator1: TDBNavigator;
    GridPanel7: TGridPanel;
    Label10: TLabel;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormStockDetail: TFormStockDetail;

implementation

{$R *.dfm}

uses UnitEtatStock,unit36,DataStocksUnite;

procedure TFormStockDetail.FormShow(Sender: TObject);
begin
    DataStocks.FDTableStock.Close;
    DataStocks.FDTableStock.Open();
end;

end.
