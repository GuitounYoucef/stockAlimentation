unit UnitFacturation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, Vcl.Imaging.jpeg,
  frxClass, frxDBSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxClasses, dxGaugeCustomScale,
  dxGaugeDigitalScale, dxGaugeControl, Vcl.Menus, cxImageList, cxButtons;

type
  TFormFacturation = class(TForm)
    DataSourceFactureEntrante: TDataSource;
    ImageList1: TImageList;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    DBGrid1: TDBGrid;
    GridPanel4: TGridPanel;
    EditCodeProduit: TEdit;
    ButtonBalance: TButton;
    GridPanel6: TGridPanel;
    Image2: TImage;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    GridPanel8: TGridPanel;
    ButtonValider: TButton;
    ButtonImprimer: TButton;
    frxDBDatasetFacture: TfrxDBDataset;
    ButtonProduits: TButton;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    GridPanel9: TGridPanel;
    EditNum: TEdit;
    Label5: TLabel;
    ComboBoxTypeSource: TComboBox;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    DataSource2: TDataSource;
    frxReportFacture: TfrxReport;
    GridPanel3: TGridPanel;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale;
    GridPanel5: TGridPanel;
    cxLookupComboBoxCodeProd: TcxLookupComboBox;
    cxLookupComboBoxNomSource: TcxLookupComboBox;
    DataSourceNomSource: TDataSource;
    cxLookupComboBoxstockid: TcxLookupComboBox;
    DataSourceStocksNamesDestination: TDataSource;
    cxButtonSupprimerEntree: TcxButton;
    cxImageList1: TcxImageList;
    DataSourceListProduits: TDataSource;
    procedure ButtonImprimerClick(Sender: TObject);
    procedure ButtonValiderClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditCodeProduitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonProduitsClick(Sender: TObject);
    procedure ComboBoxTypeSourceChange(Sender: TObject);
    procedure ajouterProduit(codeProd,id:string);
    procedure cxLookupComboBoxCodeProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupComboBoxNomSourcePropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxstockidFocusChanged(Sender: TObject);
    procedure cxLookupComboBoxstockidPropertiesChange(Sender: TObject);
    procedure cxButtonSupprimerEntreeClick(Sender: TObject);
    procedure cxLookupComboBoxCodeProdPropertiesChange(Sender: TObject);
    procedure EditCodeProduitChange(Sender: TObject);
    procedure selectRechercheObj();
    procedure NouvelleFactureForm();
    procedure RechercheFactureForm(a,d:string;n:integer);
    procedure intializationAffichage(aff:boolean);


  private
    { Déclarations privées }
  public
  var
  valide:boolean;
  Annee,codebar,NomDestination:string;
  som:longint;
  num,source,destination,typeops,numstoke:integer;
  { Déclarations publiques }
  end;

var
  FormFacturation: TFormFacturation;
  b,exist,balance:boolean;
  tp,id,prod,rechercheObj:string;

implementation

{$R *.dfm}

uses UnitPaiementCredit, UnitRechercheNomProduit, UnitAjouterProduits, DataProduitsUnite,
  DataFacturationUnite;

procedure TFormFacturation.ButtonValiderClick(Sender: TObject);
begin
DataFacturation.ValiderInforFavture( num,
                                     Annee,
                                     cxLookupComboBoxNomSource.text,
                                     cxLookupComboBoxstockid.text,
                                     typeops);

FormPaiementCredit.PaimentFactureShow(som);
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.ButtonImprimerClick(Sender: TObject);
begin
    if DataFacturation.FDQueryFactureEntrante.RecordCount>0 then
      frxReportFacture.ShowReport(true);
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.ButtonProduitsClick(Sender: TObject);
begin
    FormRechercheNomProduit.show;
    FormRechercheNomProduit.f:=8;
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.ComboBoxTypeSourceChange(Sender: TObject);
begin
cxLookupComboBoxNomSource.ClearSelection;
cxLookupComboBoxstockid.ClearSelection;
    typeops:=ComboBoxTypeSource.ItemIndex;  //  typeops=0 : achat ;   typeops=1:mouvement entre stockes
      if typeops=0 then    // Remplir ComboBoxFournisseur avec la liste des fournisseurs
      begin
          DataSourceNomSource.DataSet:=DataFacturation.FDTableListFounisseurs;
          cxLookupComboBoxNomSource.Properties.ListFieldNames:='NomPrenom';
          cxLookupComboBoxNomSource.Properties.KeyFieldNames:='NomPrenom';
      end
      else
      if typeops=1 then    // Remplir ComboBoxFournisseur avec la liste des stocks
      begin
          DataSourceNomSource.DataSet:=DataFacturation.FDTableStockid;
          cxLookupComboBoxNomSource.Properties.ListFieldNames:='id';
          cxLookupComboBoxNomSource.Properties.KeyFieldNames:='id';
      end;
end;

//------------------------------------------------------------------------------
procedure TFormFacturation.cxLookupComboBoxNomSourcePropertiesChange(
  Sender: TObject);
begin
cxLookupComboBoxstockid.ClearSelection;
if typeops=0 then
begin
   DataSourceStocksNamesDestination.DataSet:=DataFacturation.FDTableStockid;
end
else
begin
   DataFacturation.FDQueryStocksNamesDestination.Params.ParamValues['x']:=cxLookupComboBoxNomSource.Text;
   DataFacturation.FDQueryStocksNamesDestination.Active:=false;
   DataFacturation.FDQueryStocksNamesDestination.Active:=true;
   DataSourceStocksNamesDestination.DataSet:=DataFacturation.FDQueryStocksNamesDestination;
end;
end;


procedure TFormFacturation.cxLookupComboBoxstockidFocusChanged(Sender: TObject);
begin
  destination:=DataFacturation.TrouverStockNum(cxLookupComboBoxstockid.Text);
  NomDestination:=cxLookupComboBoxstockid.Text;
end;


procedure TFormFacturation.cxLookupComboBoxstockidPropertiesChange(
  Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure TFormFacturation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if (valide=false) and (DataFacturation.FDQueryFactureEntrante.RecordCount>0) then
    if MessageDlg('بيانات الفاتورة لم يتم تأكيدها . هل تريد فعلا إلغاء عملية حجز البيانات ؟', mtConfirmation, [mbNo,mbYes], 0) = mrYes then
      DataFacturation.SupprimerFacture()
    else
       Action := caNone;
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.FormKeyPress(Sender: TObject; var Key: Char);
begin
MessageDlg(Key + ' has been pressed', mtInformation, [mbOK], 0)
end;


procedure TFormFacturation.intializationAffichage(aff: boolean);
begin
    dxGaugeControl1DigitalScale1.Value:='0';
    valide:=not aff;
    frxReportFacture.PrintOptions.Printer:=DataFacturation.FDTableImprimante.FieldValues['Normale'];

    ComboBoxTypeSource.ItemIndex:=-1;
    cxLookupComboBoxNomSource.ClearSelection;
    cxLookupComboBoxstockid.ClearSelection;
    cxLookupComboBoxCodeProd.ClearSelection;
    EditCodeProduit.Clear;
    ComboBoxTypeSource.Enabled:=aff;
    cxLookupComboBoxNomSource.Enabled:=aff;
    cxLookupComboBoxstockid.Enabled:=aff;
    show;
end;

procedure TFormFacturation.NouvelleFactureForm;
begin

    EditNum.Text:=DataFacturation.NouvelleFacture(Annee,Num);
    intializationAffichage(true);
end;

procedure TFormFacturation.RechercheFactureForm(a,d:string;n:integer);
begin
    Annee:=a;
    Num:=n;
    NomDestination:=d;
    destination:=DataFacturation.TrouverStockNum(d);
    EditNum.Text:=DataFacturation.RechercheFacture(Annee,Num);
    intializationAffichage(false);
end;

//------------------------------------------------------------------------------
procedure TFormFacturation.selectRechercheObj;
begin
if rechercheObj='cxLookupComboBox' then
   cxLookupComboBoxCodeProd.SetFocus
else
   EditCodeProduit.SetFocus;
end;

procedure TFormFacturation.cxLookupComboBoxCodeProdPropertiesChange(
  Sender: TObject);
begin
rechercheObj:='cxLookupComboBox';
end;

procedure TFormFacturation.EditCodeProduitChange(Sender: TObject);
begin
rechercheObj:='EditCodeProduit';
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//---------------------------  Procedure requettes -----------------------------
//------------------------------------------------------------------------------
//______________________________________________________________________________
procedure TFormFacturation.cxButtonSupprimerEntreeClick(Sender: TObject);
begin
    DataFacturation.SupprimerEntree();
end;

procedure TFormFacturation.cxLookupComboBoxCodeProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=VK_RETURN then
     begin
       ajouterProduit('******',cxLookupComboBoxCodeProd.Text);
       cxLookupComboBoxCodeProd.ClearSelection;
     end;
end;



procedure TFormFacturation.EditCodeProduitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=VK_RETURN then
   begin
     ajouterProduit(EditCodeProduit.Text,'*****');
     EditCodeProduit.Clear;
   end;
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.ajouterProduit(codeProd,id:string);
begin
  if (((length(cxLookupComboBoxNomSource.Text)>0) or (length(EditCodeProduit.Text)>0))
     and (length(cxLookupComboBoxstockid.Text)>0)) or(cxLookupComboBoxstockid.Enabled=false)
  then
      begin
        FormAjouterProduits.AfficherForm(8);
        FormAjouterProduits.TrouverProduitForm(codeProd,id);
        FormAjouterProduits.cxLookupComboBoxStockName.Text:=NomDestination;

      end
      else
      begin
        if (length(cxLookupComboBoxNomSource.Text)=0) and (length(NomDestination)>0) then
          MessageDlg('عليك إختيار إسم المصدر قبل ملأ الفاتورة', mtInformation, [mbOK], 0)
        else if (length(cxLookupComboBoxstockid.Text)=0) then
          MessageDlg('عليك إختيار إسم المخزن قبل ملأ الفاتورة', mtInformation, [mbOK], 0);
          EditCodeProduit.Clear;
      end;
end;

initialization;
b:=true;

end.
