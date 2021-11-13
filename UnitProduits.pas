unit UnitProduits;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  frxClass, frxDBSet, frxBarcode, Vcl.ExtDlgs;

type
  TFormProduits = class(TForm)
    ImageList1: TImageList;
    ImageList3: TImageList;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    GridPanel3: TGridPanel;
    ButtonSuuprimerProd: TButton;
    ButtonImprInventaire: TButton;
    GridPanel6: TGridPanel;
    Image2: TImage;
    GridPanel7: TGridPanel;
    Label2: TLabel;
    Image3: TImage;
    DBNavigator1: TDBNavigator;
    frxReportNormal: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ButtonPhotoProd: TButton;
    DBGrid2: TDBGrid;
    OpenPictureDialog1: TOpenPictureDialog;
    frxReportCodeBar: TfrxReport;
    DataSourceTableProduits: TDataSource;

    procedure ButtonNouveauProdClick(Sender: TObject);
    procedure ButtonSuuprimerProdClick(Sender: TObject);
    procedure ButtonPhotoProdClick(Sender: TObject);
    procedure ButtonImprInventaireClick(Sender: TObject);
    procedure ButtonImprCodeBarClick(Sender: TObject);


  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;
var
  FormProduits: TFormProduits;
  i:integer;
  lien:string;
  searchResult : TSearchRec;

implementation

{$R *.dfm}

uses  UnitAjouterProduits,DataProduitsUnite;


//------------------------------------------------------------------------------
procedure TFormProduits.ButtonNouveauProdClick(Sender: TObject);
begin
    FormAjouterProduits.NouveauProduitForm();
    FormAjouterProduits.AfficherForm(6);
end;
//------------------------------------------------------------------------------
procedure TFormProduits.ButtonImprCodeBarClick(Sender: TObject);
begin
    if not DataProduits.TableProduitEstVite() then
      frxReportCodeBar.ShowReport(true);
end;
//------------------------------------------------------------------------------
procedure TFormProduits.ButtonPhotoProdClick(Sender: TObject);
begin
    if not DataProduits.TableProduitEstVite() then
      if  OpenPictureDialog1.Execute(Self.Handle) then
      begin
        Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
        DataProduits.chargerImage(OpenPictureDialog1.FileName);

      end;
end;
//------------------------------------------------------------------------------
procedure TFormProduits.ButtonImprInventaireClick(Sender: TObject);
begin
    if not DataProduits.TableProduitEstVite() then
        frxReportNormal.ShowReport(true);
end;
//------------------------------------------------------------------------------
procedure TFormProduits.ButtonSuuprimerProdClick(Sender: TObject);
begin
    if not DataProduits.TableProduitEstVite() then
    begin
      if not DataProduits.ProdDejaUtilise() then
      DBNavigator1.BtnClick(nbdelete)
    else
      MessageDlg('حذف السلعة غير مسموح بسبب إستعمالها في تخزين سابق', mtInformation, [mbOK], 0);
    end;
end;

initialization;
i:=0;
end.
