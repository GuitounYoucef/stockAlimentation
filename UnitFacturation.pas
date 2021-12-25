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
  dxGaugeDigitalScale, dxGaugeControl, Vcl.Menus, cxImageList, cxButtons,
  Vcl.WinXCtrls, dxGDIPlusClasses;

type
  TFormFacturation = class(TForm)
    DataSourceFactureEntrante: TDataSource;
    ImageList1: TImageList;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    DBGrid1: TDBGrid;
    GridPanel4: TGridPanel;
    EditCodeProduit: TEdit;
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
    frxDBDatasetImp: TfrxDBDataset;
    frxDBDatasetRecords: TfrxDBDataset;
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
    ToggleSwitchRechDetail: TToggleSwitch;
    procedure ButtonImprimerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditCodeProduitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonProduitsClick(Sender: TObject);
    procedure ComboBoxTypeSourceChange(Sender: TObject);
    procedure cxLookupComboBoxCodeProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupComboBoxNomSourcePropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxstockidFocusChanged(Sender: TObject);
    procedure cxButtonSupprimerEntreeClick(Sender: TObject);
    procedure cxLookupComboBoxCodeProdPropertiesChange(Sender: TObject);
    procedure EditCodeProduitChange(Sender: TObject);
    procedure selectRechercheObj();
    procedure intializationAffichage(aff:boolean);
    procedure cxLookupComboBoxCodeProdEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);


    //*************************************************
    procedure ajouterProduit(codeProd,id:string);
    procedure NouvelleFactureForm();
    procedure RechercheFactureForm(a:string;n:integer);
    procedure ButtonValiderClick(Sender: TObject);


  private
    { Déclarations privées }
  public
  var
  valide,update,paiement:boolean;
  Annee:string;
  som:longint;
  num,typeops:integer;
  { Déclarations publiques }
  end;

var
  FormFacturation: TFormFacturation;

  rechercheObj:string;
  selectItem:integer;

implementation

{$R *.dfm}

uses UnitPaiementCredit, UnitRechercheNomProduit, UnitAjouterProduits, DataProduitsUnite,
  DataFacturationUnite,DataParametrageUnite, UnitUpdateRecordFact;

  //------------------------------------------------------------------------------
procedure TFormFacturation.ButtonValiderClick(Sender: TObject);
begin
DataFacturation.ValiderInforFavture( cxLookupComboBoxNomSource.text,
                                     cxLookupComboBoxstockid.text,
                                     typeops);
FormPaiementCredit.PaimentFactureShow(DataFacturation.calculerSomFacture());
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.ButtonImprimerClick(Sender: TObject);
begin
    if DataFacturation.FDQueryFactureRecords.RecordCount>0 then
      frxReportFacture.ShowReport(true);
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.ButtonProduitsClick(Sender: TObject);
begin

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
  DataFacturation.facture.NumDestination:=DataFacturation.TrouverStockNum(cxLookupComboBoxstockid.Text);
  DataFacturation.facture.NomDestination:=cxLookupComboBoxstockid.Text;
end;




procedure TFormFacturation.DBGrid1DblClick(Sender: TObject);
begin
FormUpdateRecordFact.show;
end;

//------------------------------------------------------------------------------
procedure TFormFacturation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if (DataFacturation.FDQueryFactureRecords.RecordCount>0) then
begin
    if (valide=false) then
    begin
    if MessageDlg('بيانات الفاتورة لم يتم تأكيدها . هل تريد فعلا إلغاء عملية حجز البيانات ؟', mtConfirmation, [mbNo,mbYes], 0) = mrYes then
      DataFacturation.SupprimerFacture()
    else
       Action := caNone;
    end
    else
    if not paiement then
    begin
     FormPaiementCredit.PaimentFactureShow(DataFacturation.calculerSomFacture());
     Action := caNone;
    end;
end;
end;
//------------------------------------------------------------------------------



procedure TFormFacturation.FormShow(Sender: TObject);
begin
DataFacturation.dataRefrech();
end;

procedure TFormFacturation.intializationAffichage(aff: boolean);
begin
    dxGaugeControl1DigitalScale1.Value:='0';
    paiement:=false;
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

    EditNum.Text:=DataFacturation.NouvelleFacture();
    intializationAffichage(true);
end;

procedure TFormFacturation.RechercheFactureForm(a:string;n:integer);
begin

    EditNum.Text:=DataFacturation.RechercheFacture(a,n);
    intializationAffichage(false);
end;

//------------------------------------------------------------------------------
procedure TFormFacturation.selectRechercheObj;
begin
    if rechercheObj='cxLookupComboBox' then
       cxLookupComboBoxCodeProd.SetFocus
    else
       EditCodeProduit.SetFocus;
    LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
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
    if not DataFacturation.EntreesFactureEstvide() then
        if not DataFacturation.SupprimerEntree() then
           showmessage('لا يمكنك حذف هذه السلعة فقد تم بيع جزء منها')
        else update:=true;
end;

procedure TFormFacturation.cxLookupComboBoxCodeProdEnter(Sender: TObject);
begin
LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;

procedure TFormFacturation.cxLookupComboBoxCodeProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=VK_RETURN)then
     selectItem:=selectItem+1;
  if (selectItem=2) then
     begin
       ajouterProduit('******',cxLookupComboBoxCodeProd.SelText);
       cxLookupComboBoxCodeProd.ClearSelection;
       selectItem:=0;
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
        if ToggleSwitchRechDetail.State = tssOn then
        begin
        FormAjouterProduits.AfficherForm(8);
        FormAjouterProduits.TrouverProduitForm(codeProd,id);
        FormAjouterProduits.cxLookupComboBoxStockName.Text:=DataFacturation.facture.NomDestination;
        end
        else
        begin
          FormAjouterProduits.TrouverProduitForm(codeProd,id);
          FormAjouterProduits.EditQunt.Text:='1';
          FormAjouterProduits.ajouterfacture();
        end;
      end
      else
      begin
        if (length(cxLookupComboBoxNomSource.Text)=0) and (length(DataFacturation.facture.NomDestination)>0) then
          MessageDlg('عليك إختيار إسم المصدر قبل ملأ الفاتورة', mtInformation, [mbOK], 0)
        else if (length(cxLookupComboBoxstockid.Text)=0) then
          MessageDlg('عليك إختيار إسم المخزن قبل ملأ الفاتورة', mtInformation, [mbOK], 0);
          EditCodeProduit.Clear;
      end;
end;

initialization;

selectItem:=0;

end.
