unit UnitAjouterProduits;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.WinXCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.DBCtrls, Vcl.Mask ;

type
  TFormAjouterProduits = class(TForm)
    ImageList1: TImageList;
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label11: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label12: TLabel;
    DateTimePicker1: TDateTimePicker;
    EditQunt: TEdit;
    Label1: TLabel;
    ButtonAjouter: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GridPanel7: TGridPanel;
    Label10: TLabel;
    Image3: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cxLookupComboBoxStockName: TcxLookupComboBox;
    DataSourceStocksNames: TDataSource;
    DBEditId: TDBEdit;
    DataSourceFindProduitByCode: TDataSource;
    DBEditCode: TDBEdit;
    DBEditQuantiteLot: TDBEdit;
    DBEditPrixAchat: TDBEdit;
    DBEditPrixVenteGros: TDBEdit;
    DBEditPrixVente: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    cxDBLookupComboBoxType: TcxDBLookupComboBox;
    cxDBLookupComboBoxProducteur: TcxDBLookupComboBox;
    DBNavigatorFindProduitByCode: TDBNavigator;
    procedure ButtonAjouterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure AjouterStocke();
    function verifierChamp():boolean;
    procedure TrouverProduitForm(codeProd,id:string);
    procedure NouveauProduitForm();
    procedure ajouterfacture();
    procedure EditQuntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditPrixVenteChange(Sender: TObject);
    procedure DBEditPrixVenteGrosChange(Sender: TObject);
    procedure DBEditPrixAchatChange(Sender: TObject);
    procedure verifierNombreReel(Sender: TObject;var Key: Char);
    procedure DBEditPrixAchatKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditPrixVenteGrosKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditPrixVenteKeyPress(Sender: TObject; var Key: Char);
  private
    { Déclarations privées }
    var ProdExiste:boolean;
  public
  var f:integer;
      tp,id,prod:string;
      Pachat,Pvente,PventeG,cbar,idP,QtL:boolean;
    { Déclarations publiques }
  end;
var
  FormAjouterProduits: TFormAjouterProduits;
implementation
{$R *.dfm}
uses UnitEtatStock, UnitProduits, UnitFacturation, Unit25,
  DataProduitsUnite, DataStocksUnite, DataFacturationUnite;
//______________________________________________________________________________
function genererCodeBar():string;
var t1,p1,id1:string;
    i:integer;
begin
    with FormAjouterProduits do
    begin
        DataProduits.FDTableProduits.Close;
        DataProduits.FDTableProduits.Open;
        t1:=inttostr(DataProduits.FDTableProduits.RecordCount+1);
        for i := length(t1)+1 to 13 do
          t1:='0'+t1;
        result:=t1;
    end;

end;
//______________________________________________________________________________
procedure TFormAjouterProduits.DBEditCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_SPACE then
       if ((length(cxDBLookupComboBoxType.Text)>0) and (length(cxDBLookupComboBoxProducteur.Text)>0) and (length(DBEditId.Text)>0)) then
          DBEditCode.Text:=genererCodeBar();

end;
//______________________________________________________________________________
procedure TFormAjouterProduits.DBEditPrixAchatChange(Sender: TObject);
begin
  if (length((Sender as TDBEdit).Text)=0) then
   (Sender as TDBEdit).Text:='0';
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.DBEditPrixAchatKeyPress(Sender: TObject;
  var Key: Char);
begin
   verifierNombreReel(Sender,Key);
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.DBEditPrixVenteChange(Sender: TObject);
begin
  if (length((Sender as TDBEdit).Text)=0) then
   (Sender as TDBEdit).Text:='0';
    if length(DBEditPrixAchat.Text)>0 then
    if (strtofloat(DBEditPrixAchat.Text)>=strtofloat(DBEditPrixVente.Text)) or (strtofloat(DBEditPrixVenteGros.Text)>strtofloat(DBEditPrixVente.Text)) then
    begin
    DBEditPrixVente.Color:=RGB(255,69,0);        //red
    Pvente:=false;
    end
    else
    begin
    DBEditPrixVente.Color:=rgb(50,205,50);      //green
    Pvente:=true;
    end;
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.DBEditPrixVenteGrosChange(Sender: TObject);
begin
  if (length((Sender as TDBEdit).Text)=0) then
   (Sender as TDBEdit).Text:='0';
    if (length(DBEditPrixAchat.Text)>0) and (length(DBEditPrixVente.Text)>0) then
    if (strtofloat(DBEditPrixVenteGros.Text)<=strtofloat(DBEditPrixAchat.Text)) then
    begin
    DBEditPrixVenteGros.Color:=RGB(255,69,0);      //red
    PventeG:=false;
    end
    else
    begin
    DBEditPrixVenteGros.Color:=rgb(50,205,50);
    PventeG:=true;
    end;
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.DBEditPrixVenteGrosKeyPress(Sender: TObject;
  var Key: Char);
begin
   verifierNombreReel(Sender,Key);
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.DBEditPrixVenteKeyPress(Sender: TObject;
  var Key: Char);
begin
   verifierNombreReel(Sender,Key);
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.verifierNombreReel(Sender: TObject;var Key: Char);
begin
    if Key ='.' then
    Key :=',';
      if not (Key in [#8, '0'..'9',',']) then
      begin
        ShowMessage('Invalid key');
        // Discard the key
        Key := #0;
      end
    else if (Key = ',') and (Pos(Key, (Sender as TDBEdit).Text) > 0) then
      begin
        ShowMessage('Invalid Key: twice ' + Key);
        Key := #0
      end
      else
      if (Key in ['0'..'9']) then
      if (Pos(',', (Sender as TDBEdit).Text) < length((Sender as TDBEdit).Text)-1) and (Pos(',', (Sender as TDBEdit).Text) > 0)  then
        Key := #0;
end;
//______________________________________________________________________________

procedure TFormAjouterProduits.EditQuntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_RETURN then
       ButtonAjouterClick(FormAjouterProduits);
end;
//______________________________________________________________________________
//______________________________________________________________________________
procedure TFormAjouterProduits.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date:=date;
    DateTimePicker2.Date:=date+3650;
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
    EditQunt.Clear;
    EditQunt.SetFocus;
    QtL:=true;
end;
//______________________________________________________________________________
//______________________________________________________________________________
//______________________________________________________________________________
//______________________________________________________________________________
procedure TFormAjouterProduits.ButtonAjouterClick(Sender: TObject);
begin
if not ProdExiste then
  DBNavigatorFindProduitByCode.BtnClick(nbPost);
    case f of
      5://if (verifierChamp())then
          AjouterStocke();
        //else MessageDlg('* عليك ملأ الحقول الإجبارية', mtInformation, [mbOK], 0);
       6: NouveauProduitForm();

      8:ajouterfacture();
    end;
end;

//______________________________________________________________________________
procedure TFormAjouterProduits.NouveauProduitForm;
begin
   DataProduits.NouveauProduit();
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.TrouverProduitForm(codeProd,id:string);
begin
   ProdExiste:=DataProduits.TrouverProduit(codeProd,id);
end;

procedure TFormAjouterProduits.AjouterStocke();    //travail avec FormEtatStock
begin
    if (strtoint(EditQunt.Text)>0)  then
    begin

      DataStocks.FDQuerySelectStockId.Params.ParamValues['x']:=cxLookupComboBoxStockName.Text;
      DataStocks.FDQuerySelectStockId.Active:=false;
      DataStocks.FDQuerySelectStockId.Active:=true;

    DataStocks.NouvelleEntree(DataProduits.FDQueryFindProduitByCode,strtoint(EditQunt.Text),DataStocks.FDQuerySelectStockId.FieldValues['numstock'],DateTimePicker1.Date,DateTimePicker2.Date);
    close;
    FormEtatStock.EditCodeBar.Clear;
    end;
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.ajouterfacture();   // FormFacturation
var b:boolean;
    x:integer;
begin
    b:=false;
    with formFacturation do
      begin
        DataFacturation.NouvelleEntree(DataProduits.FDQueryFindProduitByCode,strtoint(EditQunt.Text),DateTimePicker1.Date,DateTimePicker2.Date);
        FormAjouterProduits.close;
        EditCodeProduit.Clear;
      end;
end;
//______________________________________________________________________________
function TFormAjouterProduits.verifierChamp():boolean;
begin
  if ((length(EditQunt.Text)>0)) then
     begin
        if ((length(cxLookupComboBoxStockName.Text)>0)) then
           begin
              if (strtofloat(DBEditQuantiteLot.Text)>0) then
                 begin
                    if (strtofloat(DBEditPrixAchat.Text)>strtofloat(DBEditPrixVenteGros.Text)) then
                       begin
                          if (strtofloat(DBEditPrixVente.Text)>strtofloat(DBEditPrixVenteGros.Text)) then
                             begin
                               Result:=true;
                             end
                             else showmessage('سعر البيع بالتجزئة يجب أن يكون أكبر  أو يساوي سعلر البيع بالجملة');
                       end
                       else showmessage('سعر البيع بالجملة يجب أن يكون أكبر من سعر الشراء');
                 end
                 else showmessage('كمية الوحدة الكبرى يجب أن تكون أكبر أو تساوي 1');
           end
           else showmessage('عليك إختيار إسم المخزن');
     end
     else showmessage('الكمية الكلية يجب أن تكون أكبر من 0');
Result:=false;
end;
end.
