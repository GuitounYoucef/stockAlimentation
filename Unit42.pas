unit Unit42;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TForm42 = class(TForm)
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form42: TForm42;


implementation
uses UnitVenteData;

{$R *.dfm}

procedure TForm42.Button1Click(Sender: TObject);
begin
DataModuleVente.SupprimerProdList(1);
end;

procedure TForm42.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var p:Produits;
begin
case key of
VK_RETURN:begin
           p:=DataModuleVente.TrouverPrduit(1,1,'',Edit1.Text,1);
           if p.quantite>0 then
           begin
             DataModuleVente.AjouterProdList(p);
             Label1.Caption:=p.id;
             Edit2.Text:=FloatTostrF(DataModuleVente.CalculerSomme(),ffFixed,12,2);
           end
           else MessageDlg('السلعة المطلوبة غير متوفرة في المخزن'+' : '{+DataModule1.FDTableParametrage['stockid']}, mtInformation, [mbOK], 0);

          end;
end;
end;

end.
