unit UnitRechercheStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXCtrls, Vcl.ExtCtrls, Data.Win.ADODB, System.ImageList,
  Vcl.ImgList;

type
  TFormRechercheStock = class(TForm)
    GridPanel4: TGridPanel;
    SearchBox1: TSearchBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    EditQunt: TEdit;
    procedure SearchBox1Change(Sender: TObject);
    procedure SearchBox1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
  var f:integer;
    { Déclarations publiques }
  end;

var
  FormRechercheStock: TFormRechercheStock;

implementation

{$R *.dfm}

uses UnitVenteComptoir,unit36;

procedure TFormRechercheStock.Button1Click(Sender: TObject);
var key:word;
begin
if length(EditQunt.Text)>0 then
begin
FormVenteComptoir.VenteProduit(DataModule1.FD27QueryRechIDProduitstock.FieldValues['Code'],'*****',strtoint(EditQunt.Text));
EditQunt.Clear;
close;
end
else
MessageDlg('عليك إدخال الكمية', mtInformation, [mbOK], 0);
end;

procedure TFormRechercheStock.FormShow(Sender: TObject);
begin
    DataModule1.FD27QueryRechIDProduitstock.Params.ParamValues['x']:='%%';
    DataModule1.FD27QueryRechIDProduitstock.Active:=false;
    DataModule1.FD27QueryRechIDProduitstock.Active:=true;
end;

procedure TFormRechercheStock.SearchBox1Change(Sender: TObject);
begin
DataModule1.FD27QueryRechIDProduitstock.Params.ParamValues['x']:='%'+SearchBox1.Text+'%';
DataModule1.FD27QueryRechIDProduitstock.Active:=false;
DataModule1.FD27QueryRechIDProduitstock.Active:=true;
end;

procedure TFormRechercheStock.SearchBox1Enter(Sender: TObject);
begin
LoadKeyboardLayout('00000401', KLF_ACTIVATE);
end;

end.
