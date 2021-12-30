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
  Vcl.WinXCtrls, dxGDIPlusClasses, cxDBEdit;

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
    DataSourceNomSource: TDataSource;
    DataSourceStocksNamesDestination: TDataSource;
    cxButtonSupprimerEntree: TcxButton;
    cxImageList1: TcxImageList;
    DataSourceListProduits: TDataSource;
    ToggleSwitchRechDetail: TToggleSwitch;
    DataSourceFacture: TDataSource;
    cxDBLookupComboBoxNomSource: TcxDBLookupComboBox;
    cxDBLookupComboBoxNomDestination: TcxDBLookupComboBox;
    // Affichage
    procedure ButtonImprimerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxTypeSourceChange(Sender: TObject);
    procedure cxLookupComboBoxNomSourcePropertiesChange(Sender: TObject);

    procedure cxButtonSupprimerEntreeClick(Sender: TObject);
    procedure cxLookupComboBoxCodeProdPropertiesChange(Sender: TObject);
    procedure EditCodeProduitChange(Sender: TObject);
    procedure selectRechercheObj();
    procedure intializationAffichage(aff:boolean);
    procedure cxLookupComboBoxCodeProdEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

    // Traitement
    //*************************************************
    procedure cxLookupComboBoxCodeProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditCodeProduitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ajouterProduit(codeProd,id:string);
    procedure NouvelleFactureForm();
    procedure RechercheFactureForm(a:string;n:integer);
    procedure ButtonValiderClick(Sender: TObject);
    procedure cxDBLookupComboBoxNomSourcePropertiesChange(Sender: TObject);


  private
    { Déclarations privées }
  public
  var
  valide,paiement:boolean;


  { Déclarations publiques }
  end;

var
  FormFacturation: TFormFacturation;

  rechercheObj:string;
  selectItem:integer;
  typeops:integer;

implementation

{$R *.dfm}

uses UnitPaiementCredit, UnitRechercheNomProduit, UnitAjouterProduits, DataProduitsUnite,
  DataFacturationUnite,DataParametrageUnite, UnitUpdateRecordFact;

//------------------------------------------------------------------------------
procedure TFormFacturation.ButtonImprimerClick(Sender: TObject);
begin
    if DataFacturation.FDQueryFactureRecords.RecordCount>0 then
       frxReportFacture.ShowReport(true);
end;

//------------------------------------------------------------------------------
procedure TFormFacturation.ComboBoxTypeSourceChange(Sender: TObject);
begin
cxDBLookupComboBoxNomSource.ClearSelection;
cxDBLookupComboBoxNomDestination.ClearSelection;
    typeops:=ComboBoxTypeSource.ItemIndex;  //  typeops=0 : achat ;   typeops=1:mouvement entre stockes
      if typeops=0 then    // Remplir ComboBoxFournisseur avec la liste des fournisseurs
      begin
          DataSourceNomSource.DataSet:=DataFacturation.FDTableListFounisseurs;
          cxDBLookupComboBoxNomSource.Properties.ListFieldNames:='NomPrenom';
          cxDBLookupComboBoxNomSource.Properties.KeyFieldNames:='NomPrenom';
      end
      else
      if typeops=1 then    // Remplir ComboBoxFournisseur avec la liste des stocks
      begin
          DataSourceNomSource.DataSet:=DataFacturation.FDTableStockid;
          cxDBLookupComboBoxNomSource.Properties.ListFieldNames:='id';
          cxDBLookupComboBoxNomSource.Properties.KeyFieldNames:='id';
      end;
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.cxLookupComboBoxNomSourcePropertiesChange(
  Sender: TObject);
begin
    cxDBLookupComboBoxNomDestination.ClearSelection;
    if typeops=0 then
    begin
       DataSourceStocksNamesDestination.DataSet:=DataFacturation.FDTableStockid;
    end
    else
    begin
       DataFacturation.FDQueryStocksNamesDestination.Params.ParamValues['x']:=cxDBLookupComboBoxNomSource.Text;
       DataFacturation.FDQueryStocksNamesDestination.Active:=false;
       DataFacturation.FDQueryStocksNamesDestination.Active:=true;
       DataSourceStocksNamesDestination.DataSet:=DataFacturation.FDQueryStocksNamesDestination;
    end;
end;


//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
procedure TFormFacturation.intializationAffichage(aff: boolean);
begin
    dxGaugeControl1DigitalScale1.Value:='0';
    paiement:=false;
    valide:=not aff;
    frxReportFacture.PrintOptions.Printer:=DataFacturation.FDTableImprimante.FieldValues['Normale'];

    ComboBoxTypeSource.ItemIndex:=-1;

    typeops:=0;
    cxLookupComboBoxCodeProd.ClearSelection;
    EditCodeProduit.Clear;
    ComboBoxTypeSource.Enabled:=aff;
    ComboBoxTypeSource.ItemIndex:=0;


    show;
    if DataFacturation.FDQueryStocksNamesDestination.RecordCount=1 then
       cxDBLookupComboBoxNomDestination.SelectedItem:=0;
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
//------------------------------------------------------------------------------
procedure TFormFacturation.cxLookupComboBoxCodeProdPropertiesChange(
  Sender: TObject);
begin
    rechercheObj:='cxLookupComboBox';
    if length(cxLookupComboBoxCodeProd.Text)=0 then
    begin

    cxLookupComboBoxCodeProd.Properties.IncrementalFilteringOptions:=[];
    cxLookupComboBoxCodeProd.Properties.IncrementalFilteringOptions:=[ifoHighlightSearchText,ifoUseContainsOperator];
    end;
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.EditCodeProduitChange(Sender: TObject);
begin
    rechercheObj:='EditCodeProduit';
end;
//------------------------------------------------------------------------------
procedure TFormFacturation.cxLookupComboBoxCodeProdEnter(Sender: TObject);
begin
    LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;

//------------------------------------------------------------------------------
//---------------------------  Procedure requettes -----------------------------
//------------------------------------------------------------------------------
//______________________________________________________________________________
procedure TFormFacturation.NouvelleFactureForm;
begin
    EditNum.Text:=DataFacturation.NouvelleFacture();
    intializationAffichage(true);
end;
//______________________________________________________________________________
procedure TFormFacturation.RechercheFactureForm(a:string;n:integer);
begin
    EditNum.Text:=DataFacturation.RechercheFacture(a,n);
    intializationAffichage(false);
end;
//______________________________________________________________________________
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
//______________________________________________________________________________
procedure TFormFacturation.EditCodeProduitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_RETURN then
     begin
       ajouterProduit(EditCodeProduit.Text,'*****');
       EditCodeProduit.Clear;
     end;
end;
//______________________________________________________________________________
procedure TFormFacturation.ajouterProduit(codeProd,id:string);
begin
    if (((length(cxDBLookupComboBoxNomSource.Text)>0) or (length(EditCodeProduit.Text)>0))
       and (length(cxDBLookupComboBoxNomDestination.Text)>0)) or(cxDBLookupComboBoxNomDestination.Enabled=false)
    then
        begin
          if ToggleSwitchRechDetail.State = tssOn then
          begin
            FormAjouterProduits.AfficherForm(8);
            FormAjouterProduits.TrouverProduitForm(codeProd,id);
            FormAjouterProduits.cxLookupComboBoxStockName.Text:=cxDBLookupComboBoxNomDestination.Text;
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
          if (length(cxDBLookupComboBoxNomSource.Text)=0)  then
            MessageDlg('عليك إختيار إسم المصدر قبل ملأ الفاتورة', mtInformation, [mbOK], 0)
          else if (length(cxDBLookupComboBoxNomDestination.Text)=0) then
            MessageDlg('عليك إختيار إسم المخزن قبل ملأ الفاتورة', mtInformation, [mbOK], 0);
            EditCodeProduit.Clear;
        end;
end;
//______________________________________________________________________________

procedure TFormFacturation.ButtonValiderClick(Sender: TObject);
begin
  if (length(cxDBLookupComboBoxNomSource.Text)=0) then
    MessageDlg('عليك إختيار إسم المصدر قبل تأكيد الفاتورة', mtInformation, [mbOK], 0)
  else if (length(cxDBLookupComboBoxNomDestination.Text)=0) then
    MessageDlg('عليك إختيار إسم المخزن قبل تأكيد الفاتورة', mtInformation, [mbOK], 0)
   else
   begin
    DataFacturation.ValiderInforFacture(typeops);
    FormPaiementCredit.PaimentFactureShow(DataFacturation.calculerSomFacture());
   end;
end;
//______________________________________________________________________________
procedure TFormFacturation.cxButtonSupprimerEntreeClick(Sender: TObject);
begin
    if not DataFacturation.EntreesFactureEstvide() then
        if not DataFacturation.SupprimerEntree() then
           showmessage('لا يمكنك حذف هذه السلعة فقد تم بيع جزء منها')
end;
procedure TFormFacturation.cxDBLookupComboBoxNomSourcePropertiesChange(
  Sender: TObject);
begin

end;

//______________________________________________________________________________


initialization;
selectItem:=0;

end.
