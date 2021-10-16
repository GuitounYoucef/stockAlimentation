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
  dxGaugeDigitalScale, dxGaugeControl;

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
    procedure ComboBoxAnneeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonImprimerClick(Sender: TObject);
    procedure ButtonValiderClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditCodeProduitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonProduitsClick(Sender: TObject);

    procedure ComboBoxTypeSourceChange(Sender: TObject);

    procedure ajouterProduit(codeProd,id:string);
    procedure cxLookupComboBoxCodeProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupComboBoxNomSourcePropertiesChange(Sender: TObject);
    //procedure cxLookupComboBoxNomSourcePropertiesChange(Sender: TObject);


  private
    { Déclarations privées }
  public
  var
  valide:boolean;
  Annee,codebar:string;
  som:longint;
  num,source,destination,typeops,numstockage:integer;


    { Déclarations publiques }
  end;

var
  FormFacturation: TFormFacturation;
  b,exist,balance:boolean;
  tp,id,prod:string;




implementation

{$R *.dfm}

uses UnitPaiementCredit, UnitRechercheNomProduit, UnitAjouterProduits,
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
//______________________________________________________________________________
procedure TFormFacturation.cxLookupComboBoxCodeProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key=VK_RETURN then
     begin
       ajouterProduit('******',cxLookupComboBoxCodeProd.Text);
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
//------------------------------------------------------------------------------
procedure TFormFacturation.EditCodeProduitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=VK_RETURN then
     ajouterProduit(EditCodeProduit.Text,'*****');
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

procedure TFormFacturation.FormShow(Sender: TObject);
var myYear, myMonth, myDay : Word;
begin
    formFacturation.valide:=false;
    DecodeDate(Date, myYear, myMonth, myDay);
    Annee:=IntToStr(myYear);

    DataFacturation.FDQueryNumFacture.Params.ParamValues['x']:=Annee;
    DataFacturation.FDQueryNumFacture.Active:=false;
    DataFacturation.FDQueryNumFacture.Active:=true;
    num:=DataFacturation.FDQueryNumFacture.RecordCount+1;
    EditNum.Text:=Annee+'/'+inttostr(num);

    DataFacturation.FDQueryFactureEntrante.Params.ParamValues['x']:=Annee;
    DataFacturation.FDQueryFactureEntrante.Params.ParamValues['y']:=num;
    DataFacturation.FDQueryFactureEntrante.Active:=false;
    DataFacturation.FDQueryFactureEntrante.Active:=true;
    //---------------------------------------------------------------------------
    dxGaugeControl1DigitalScale1.Value.Empty;
    valide:=false;

    frxReportFacture.PrintOptions.Printer:=DataFacturation.FDTableImprimante.FieldValues['Normale'];
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//---------------------------  Procedure requettes -----------------------------
//------------------------------------------------------------------------------

procedure TFormFacturation.ajouterProduit(codeProd,id:string);
begin
  if (length(cxLookupComboBoxNomSource.Text)>0) and (length(cxLookupComboBoxstockid.Text)>0) then
      begin
      FormAjouterProduits.Height:=598;
      FormAjouterProduits.GridPanel1.RowCollection.Items[2].Value:=130;
      FormAjouterProduits.Repaint;

      DataFacturation.FDQueryCodeProduit.Params.ParamValues['c']:=codeProd;
      DataFacturation.FDQueryCodeProduit.Params.ParamValues['i']:=id;
      DataFacturation.FDQueryCodeProduit.Active:=false;
      DataFacturation.FDQueryCodeProduit.Active:=true;
      FormAjouterProduits.DateTimePicker1.Date:=date;

        if DataFacturation.FDQueryCodeProduit.RecordCount=1 then   // Produit déja saisi
        begin
         FormAjouterProduits.tp:=DataFacturation.FDQueryCodeProduit.FieldValues['type'];
         FormAjouterProduits.prod:=DataFacturation.FDQueryCodeProduit.FieldValues['producteur'];
         FormAjouterProduits.id:=DataFacturation.FDQueryCodeProduit.FieldValues['id'];
         FormAjouterProduits.editPrixAchat.Text:=floattostr(DataFacturation.FDQueryCodeProduit.FieldValues['PrixAchat']);
         FormAjouterProduits.editPrixVente.Text:=floattostr(DataFacturation.FDQueryCodeProduit.FieldValues['PrixVente']);
         FormAjouterProduits.editPrixVenteGros.Text:=floattostr(DataFacturation.FDQueryCodeProduit.FieldValues['PrixVenteGros']);
         FormAjouterProduits.EditQuantiteLot.Text:=floattostr(DataFacturation.FDQueryCodeProduit.FieldValues['QuantiteLot']);
         FormAjouterProduits.cxLookupComboBoxStockName.Text:=cxLookupComboBoxstockid.Text;
             if (DataFacturation.FDQueryCodeProduit.FieldValues['Lien']<>null) and(length(DataFacturation.FDQueryCodeProduit.FieldValues['Lien'])>0) then
             begin
               Image2.Picture.LoadFromFile(DataFacturation.FDQueryCodeProduit.FieldValues['Lien']);
               Image2.Hide;
               Image2.Show;
             end
             else
               begin
                Image2.Picture:=nil;
                Image2.Hide;
                Image2.Show
               end;
          FormAjouterProduits.show;
          FormAjouterProduits.EditProduit.Text:=FormAjouterProduits.id;
          FormAjouterProduits.ComboBoxProducteur.text:=FormAjouterProduits.prod;
          FormAjouterProduits.ComboBoxType.Text:=FormAjouterProduits.tp;
          balance:=false;
          exist:=true;
          FormAjouterProduits.Panel1.Enabled:=false;
          end
        else   // Nouveau Produit
          if length(editCodeProduit.Text)>0 then
           begin
            Image2.Picture:=nil;
            Image2.Hide;
            Image2.Show;
            exist:=false;
            FormAjouterProduits.Panel1.Enabled:=true;
            FormAjouterProduits.effacer;
            FormAjouterProduits.show;
           end;

      FormAjouterProduits.f:=8;
      FormAjouterProduits.EditCode.Text:=DataFacturation.FDQueryCodeProduit.FieldValues['Code'];
      FormAjouterProduits.cxLookupComboBoxStockName.Text:=cxLookupComboBoxstockid.Text;

      EditCodeProduit.Clear;
      end
      else
      begin
      if (length(cxLookupComboBoxNomSource.Text)=0) and (length(cxLookupComboBoxstockid.Text)>0) then
        MessageDlg('عليك إختيار إسم المصدر قبل ملأ الفاتورة', mtInformation, [mbOK], 0)
      else if (length(cxLookupComboBoxstockid.Text)=0) then
        MessageDlg('عليك إختيار إسم المخزن قبل ملأ الفاتورة', mtInformation, [mbOK], 0);
        EditCodeProduit.Clear;
      end;
end;

initialization;
b:=true;

end.
