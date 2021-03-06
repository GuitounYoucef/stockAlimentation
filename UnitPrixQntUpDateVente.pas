unit UnitPrixQntUpDateVente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TFormPrixQntUpDateVente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    EditQuantite: TEdit;
    Label3: TLabel;
    EditPrix: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure EditPrixChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormPrixQntUpDateVente: TFormPrixQntUpDateVente;

implementation

{$R *.dfm}

uses UnitVenteComptoir, DataVenteUnit, DataParametrageUnite,
  DataStocksUnite;
//------------------------------------------------------------------------------
procedure TFormPrixQntUpDateVente.BitBtn1Click(Sender: TObject);
var som,q,r,x:real;
    p:Produits;
    code,id:string;
begin
    if DataModuleVente.GetPrixAchatList()<=strtofloat(EditPrix.Text) then
    begin
      if DataModuleVente.GetQuantiteList()<>strtofloat(EditQuantite.Text) then
      begin
          q:=strtofloat(EditQuantite.Text);
          r:=q-DataModuleVente.GetQuantiteList();
          code:=DataModuleVente.GetCodeProduitList();
          id:=DataModuleVente.GetIdProduitList();
          p := DataModuleVente.TrouverPrduit(DataModuleVente.operation.NumStock,
                                             DataModuleVente.operation.typevente, '',code,r);
            if p.quantite >=r  then
            begin
              DataModuleVente.PutQuantiteList(q);
              DataStocks.ModifierQuantiteStock(DataModuleVente.operation.NumStock,code,id,r);
            end
            else
            MessageDlg('السلعة المطلوبة غير متوفرة في المخزن' + ' : ' +
              DataParametrage.FDTableParametrage['stockid'], mtInformation,
              [mbOK], 0)
      end;
      if DataModuleVente.GetPrixVenteList()<>strtofloat(Editprix.Text) then
           DataModuleVente.PutPrixVenteList(strtoint(EditPrix.Text));
      FormVenteComptoir.dxGaugeControl1DigitalScale1.Value :=FloatTostrF(DataModuleVente.CalculerSomme(), ffFixed, 12, 2);
      FormVenteComptoir.UpdateGrid();
      close;
    end
    else MessageDlg('سعر البيع أقل من سعر الشراء', mtInformation,[mbOK],90);
end;
//------------------------------------------------------------------------------
procedure TFormPrixQntUpDateVente.EditPrixChange(Sender: TObject);
begin
    if DataModuleVente.GetPrixAchatList()>strtofloat(EditPrix.Text) then
       EditPrix.Color:=RGB(255,69,0)
    else
    if DataModuleVente.GetPrixAchatList()=strtofloat(EditPrix.Text) then
       EditPrix.Color:=rgb(50,205,50)
    else
       EditPrix.Color:=clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormPrixQntUpDateVente.FormHide(Sender: TObject);
begin
    EditQuantite.Clear;
end;

end.
