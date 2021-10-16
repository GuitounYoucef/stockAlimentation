unit UnitStockDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, dxGDIPlusClasses, Vcl.StdCtrls;

type
  TFormStockDetail = class(TForm)
    GridPanel2: TGridPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    GridPanel7: TGridPanel;
    Label10: TLabel;
    Image3: TImage;
    procedure ADOQueryStockAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormStockDetail: TFormStockDetail;

implementation

{$R *.dfm}

uses UnitEtatStock,unit36;

procedure TFormStockDetail.ADOQueryStockAfterScroll(DataSet: TDataSet);
begin
DataModule1.FDQuerystockAll5.Close;
DataModule1.FDQuerystockAll5.open;
end;

procedure TFormStockDetail.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
VK_RETURN:begin
           DataModule1.FDQueryProtec15.Post;
          end;
end;
end;

procedure TFormStockDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DataModule1.FDQuerystockAll5.Close;
DataModule1.FDQuerystockAll5.Open();
end;

procedure TFormStockDetail.FormShow(Sender: TObject);
begin
DataModule1.FDTableStock33.Close;
DataModule1.FDTableStock33.Open;
end;

end.
