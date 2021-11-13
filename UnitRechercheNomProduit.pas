unit UnitRechercheNomProduit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.WinXCtrls, Vcl.ExtCtrls;

type
  TFormRechercheNomProduit = class(TForm)
    GridPanel4: TGridPanel;
    SearchBox1: TSearchBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure SearchBox1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Déclarations privées }
  public
var f:integer;
    { Déclarations publiques }
  end;

var
  FormRechercheNomProduit: TFormRechercheNomProduit;

implementation

{$R *.dfm}
//------------------------------------------------------------------------------
uses UnitVenteComptoir, UnitEtatStock, UnitFacturation,unit36,
  DataProduitsUnite;

procedure TFormRechercheNomProduit.Button1Click(Sender: TObject);
var k:word;
    s:TShiftState;
begin
    if (DataProduits.FDQueryProduitLikeId.RecordCount>0) then
    case f of
     5:begin
         FormEtatStock.EditCodeBar.Text:=DataProduits.FDQueryProduitLikeId.FieldValues['code'];
         k:=VK_RETURN;
         s:=[ssShift];
         FormEtatStock.EditCodeBarKeyDown(FormRechercheNomProduit,k,s);
         close;
       end;
     8:begin
         formFacturation.EditCodeProduit.Text:=DataProduits.FDQueryProduitLikeId.FieldValues['code'];
         k:=VK_RETURN;
         s:=[ssShift];
         formFacturation.EditCodeProduitKeyDown(FormRechercheNomProduit,k,s);
         close;
       end
     end
    else
    MessageDlg('عليك إدخال الكمية', mtInformation, [mbOK], 0);
end;
//------------------------------------------------------------------------------
procedure TFormRechercheNomProduit.DBGrid1DblClick(Sender: TObject);
begin
    Button1Click(FormRechercheNomProduit)
end;
//------------------------------------------------------------------------------
procedure TFormRechercheNomProduit.FormShow(Sender: TObject);
begin
    DataProduits.FDQueryProduitLikeId.Params.ParamValues['x']:='%%';
    DataProduits.FDQueryProduitLikeId.Active:=false;
    DataProduits.FDQueryProduitLikeId.Active:=true;
end;
//------------------------------------------------------------------------------
procedure TFormRechercheNomProduit.SearchBox1Change(Sender: TObject);
begin
    DataProduits.FDQueryProduitLikeId.Params.ParamValues['x']:='%'+SearchBox1.Text+'%';
    DataProduits.FDQueryProduitLikeId.Active:=false;
    DataProduits.FDQueryProduitLikeId.Active:=true;
end;
//------------------------------------------------------------------------------
procedure TFormRechercheNomProduit.SearchBox1Enter(Sender: TObject);
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
end;



end.
