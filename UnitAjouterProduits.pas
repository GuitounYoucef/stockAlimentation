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
    ComboBoxType: TComboBox;
    ComboBoxProducteur: TComboBox;
    EditProduit: TEdit;
    EditCode: TEdit;
    EditPrixVenteGros: TEdit;
    EditPrixAchat: TEdit;
    EditQuantiteLot: TEdit;
    EditPrixVente: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Label11: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label12: TLabel;
    DateTimePicker1: TDateTimePicker;
    EditQunt: TEdit;
    Label1: TLabel;
    Button1: TButton;
    CheckBox1: TCheckBox;
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
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxTypeChange(Sender: TObject);
    procedure ComboBoxProducteurChange(Sender: TObject);
    procedure EditProduitChange(Sender: TObject);
    procedure NouveauProduit();
    procedure effacer();
    procedure EditPrixVenteChange(Sender: TObject);
    procedure EditPrixVenteGrosChange(Sender: TObject);
    procedure AjouterStocke();
    function verifierChamp():boolean;
    procedure TrouverProduitForm(codeProd,id:string);

    procedure EditPrixAchatChange(Sender: TObject);
    procedure EditCodeChange(Sender: TObject);
    procedure EditQuantiteLotChange(Sender: TObject);
    procedure ajouterfacture(typeops,source,destination:integer);
    procedure EditQuntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditProduitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditPrixAchatKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditPrixAchatKeyPress(Sender: TObject; var Key: Char);
    procedure EditPrixVenteGrosKeyPress(Sender: TObject; var Key: Char);
    procedure EditPrixVenteKeyPress(Sender: TObject; var Key: Char);
    procedure EditQuantiteLotKeyPress(Sender: TObject; var Key: Char);

  private
    { Déclarations privées }
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

uses UnitEtatStock, UnitProduits, UnitFacturation, Unit25,unit36,
  DataProduitsUnite, DataStocksUnite, DataFacturationUnite;

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
procedure TFormAjouterProduits.EditCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_SPACE then
    begin
    if ((length(ComboBoxType.Text)>0) and (length(ComboBoxProducteur.Text)>0) and (length(EditProduit.Text)>0)) then
    EditCode.Text:=genererCodeBar();
    end
end;

//______________________________________________________________________________

procedure TFormAjouterProduits.effacer();
begin
    editcode.clear;
    ComboBoxType.Text:='';
    ComboBoxProducteur.Clear;
    editproduit.Clear;
    EditQunt.Text:='0';
    editPrixAchat.Text:='0';
    editPrixVente.Text:='0';
    editPrixVenteGros.Text:='0';
    EditQuantiteLot.Text:='1';
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.Button1Click(Sender: TObject);
begin

    case f of
      5:if (verifierChamp())then
          AjouterStocke()
        else MessageDlg('* عليك ملأ الحقول الإجبارية', mtInformation, [mbOK], 0);

      6: if (verifierChamp())then
          NouveauProduit()
         else MessageDlg('* عليك ملأ الحقول الإجبارية', mtInformation, [mbOK], 0);
      8:ajouterfacture(formFacturation.typeops,formFacturation.source,formFacturation.destination);
    end;
    effacer();

end;
//______________________________________________________________________________
procedure TFormAjouterProduits.ComboBoxProducteurChange(Sender: TObject);
begin
    FormEtatStock.prod:=ComboBoxProducteur.Text;
    if (length(ComboBoxType.Text)>0) and (length(ComboBoxProducteur.Text)>0) then
    begin
        editproduit.Text:= ComboBoxType.Text+' '+ComboBoxProducteur.Text+' ';
        editproduit.SetFocus;
    end;
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.ComboBoxTypeChange(Sender: TObject);
begin
    DataFacturation.FDQueryProducteur.Params.ParamValues['x']:=ComboBoxType.Text;
    DataFacturation.FDQueryProducteur.Active:=false;
    DataFacturation.FDQueryProducteur.Active:=true;
    DataFacturation.FDQueryProducteur.First;
    ComboBoxProducteur.Clear;
    while not DataFacturation.FDQueryProducteur.Eof do
      begin
        ComboBoxProducteur.Items.Add(DataFacturation.FDQueryProducteur.FieldValues['Producteur']);
        DataFacturation.FDQueryProducteur.Next;
      end;
    FormEtatStock.tp:=ComboBoxType.Text;
end;


//______________________________________________________________________________
procedure TFormAjouterProduits.EditCodeChange(Sender: TObject);
begin
    if length(EditCode.Text)>0 then
    cbar:=true
    else cbar:=false;
end;


//______________________________________________________________________________
procedure TFormAjouterProduits.EditPrixAchatChange(Sender: TObject);
begin
    if (length((Sender as TEdit).Text)=0) then
    (Sender as TEdit).Text:='0';

    if strtofloat(EditPrixAchat.Text)>0 then
     Pachat:=true;
end;

procedure TFormAjouterProduits.EditPrixAchatKeyPress(Sender: TObject; var Key: Char);
begin
    if Key ='.' then
    Key :=',';
      if not (Key in [#8, '0'..'9',',']) then
      begin
        ShowMessage('Invalid key');
        // Discard the key
        Key := #0;
      end
    else if (Key = ',') and (Pos(Key, (Sender as TEdit).Text) > 0) then
      begin
        ShowMessage('Invalid Key: twice ' + Key);
        Key := #0
      end
      else
      if (Key in ['0'..'9']) then
      if (Pos(',', (Sender as TEdit).Text) < length((Sender as TEdit).Text)-1) and (Pos(',', (Sender as TEdit).Text) > 0)  then
        Key := #0;
end;

procedure TFormAjouterProduits.EditPrixAchatKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

//______________________________________________________________________________
procedure TFormAjouterProduits.EditPrixVenteChange(Sender: TObject);
begin
    if (length((Sender as TEdit).Text)=0) then
    (Sender as TEdit).Text:='0';
    if length(EditPrixAchat.Text)>0 then
    if (strtofloat(EditPrixAchat.Text)>=strtofloat(EditPrixVente.Text)) or (strtofloat(EditPrixVenteGros.Text)>strtofloat(EditPrixVente.Text)) then
    begin
    EditPrixVente.Color:=RGB(255,69,0);        //red
    Pvente:=false;
    end
    else
    begin
    EditPrixVente.Color:=rgb(50,205,50);      //green
    Pvente:=true;
    end;
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.EditPrixVenteGrosChange(Sender: TObject);
begin
    EditPrixVente.Text:=EditPrixVenteGros.Text;
    if (length((Sender as TEdit).Text)=0) then
    (Sender as TEdit).Text:='0';
    if (length(EditPrixAchat.Text)>0) and (length(EditPrixVente.Text)>0) then
    if (strtofloat(EditPrixVenteGros.Text)<=strtofloat(EditPrixAchat.Text)) then
    begin
    EditPrixVenteGros.Color:=RGB(255,69,0);      //red
    PventeG:=false;
    end
    else
    begin
    EditPrixVenteGros.Color:=rgb(50,205,50);
    PventeG:=true;
    end;
    end;
    procedure TFormAjouterProduits.EditPrixVenteGrosKeyPress(Sender: TObject; var Key: Char);
    begin
    if Key ='.' then
    Key :=',';
      if not (Key in [#8, '0'..'9',',']) then
      begin
        ShowMessage('Invalid key');
        // Discard the key
        Key := #0;
      end
    else if (Key = ',') and (Pos(Key, (Sender as TEdit).Text) > 0) then
      begin
        ShowMessage('Invalid Key: twice ' + Key);
        Key := #0
      end
      else
      if (Key in ['0'..'9']) then
      if (Pos(',', (Sender as TEdit).Text) < length((Sender as TEdit).Text)-1) and (Pos(',', (Sender as TEdit).Text) > 0)  then
        Key := #0;
end;

procedure TFormAjouterProduits.EditPrixVenteKeyPress(Sender: TObject; var Key: Char);
begin
    if Key ='.' then
    Key :=',';
      if not (Key in [#8, '0'..'9',',']) then
      begin
        ShowMessage('Invalid key');
        // Discard the key
        Key := #0;
      end
    else if (Key = ',') and (Pos(Key, (Sender as TEdit).Text) > 0) then
      begin
        ShowMessage('Invalid Key: twice ' + Key);
        Key := #0
      end
      else
      if (Key in ['0'..'9']) then
      if (Pos(',', (Sender as TEdit).Text) < length((Sender as TEdit).Text)-1) and (Pos(',', (Sender as TEdit).Text) > 0)  then
        Key := #0;
end;

//______________________________________________________________________________
procedure TFormAjouterProduits.EditProduitChange(Sender: TObject);
begin
    FormEtatStock.id:=EditProduit.Text;
    if length(EditProduit.Text)>0 then
    idP:=true
    else idP:=false;
end;
//______________________________________________________________________________
procedure TFormAjouterProduits.EditProduitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

//______________________________________________________________________________
procedure TFormAjouterProduits.EditQuantiteLotChange(Sender: TObject);
begin
    if (length((Sender as TEdit).Text)=0) then
    (Sender as TEdit).Text:='0';
    if strtofloat(EditQuantiteLot.Text)>0 then
     Qtl:=true
    else
     Qtl:=false;
    end;
    procedure TFormAjouterProduits.EditQuantiteLotKeyPress(Sender: TObject; var Key: Char);
    begin
    if Key ='.' then
    Key :=',';
      if not (Key in [#8, '0'..'9',',']) then
      begin
        ShowMessage('Invalid key');
        // Discard the key
        Key := #0;
      end
    else if (Key = ',') and (Pos(Key, (Sender as TEdit).Text) > 0) then
      begin
        ShowMessage('Invalid Key: twice ' + Key);
        Key := #0
      end
      else
      if (Key in ['0'..'9']) then
      if (Pos(',', (Sender as TEdit).Text) < length((Sender as TEdit).Text)-1) and (Pos(',', (Sender as TEdit).Text) > 0)  then
        Key := #0;
end;

procedure TFormAjouterProduits.EditQuntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_RETURN then
    Button1Click(FormAjouterProduits);

end;


//______________________________________________________________________________


procedure TFormAjouterProduits.FormShow(Sender: TObject);
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
    EditQunt.Clear;
    EditQunt.SetFocus;
    QtL:=true;
end;



//______________________________________________________________________________
//______________________________________________________________________________
//______________________________________________________________________________

procedure TFormAjouterProduits.NouveauProduit();
begin
    DataProduits.FDTableProduits.Insert;
    DataProduits.FDTableProduits.FieldValues['id']:=EditProduit.Text;
    DataProduits.FDTableProduits.FieldValues['type']:=ComboBoxType.Text;
    DataProduits.FDTableProduits.FieldValues['code']:=EditCode.Text;
    DataProduits.FDTableProduits.FieldValues['balance']:=CheckBox1.Checked;
    DataProduits.FDTableProduits.FieldValues['Producteur']:=ComboBoxProducteur.Text;
    DataProduits.FDTableProduits.FieldValues['QuantiteLot']:=strtoint(EditQuantiteLot.Text);
    DataProduits.FDTableProduits.FieldValues['PrixAchat']:=strtofloat(EditPrixAchat.Text);
    DataProduits.FDTableProduits.FieldValues['PrixVente']:=strtofloat(EditPrixVente.Text);
    DataProduits.FDTableProduits.FieldValues['PrixVenteGros']:=strtofloat(EditPrixVenteGros.Text);
    DataProduits.FDTableProduits.Next;
    DataProduits.FDTableProduits.Close;
    DataProduits.FDTableProduits.open;
    MessageDlg('تمت إضافة السلعة بنجاح', mtInformation, [mbOK], 0);
end;
//______________________________________________________________________________

procedure TFormAjouterProduits.TrouverProduitForm(codeProd,id:string);
begin
   DataProduits.TrouverProduit(codeProd,id);
end;

procedure TFormAjouterProduits.AjouterStocke();    //travail avec FormEtatStock
begin
    if (strtoint(EditQunt.Text)>0)  then
    begin
      DataStocks.FDTableStock.Insert;
      DataStocks.FDTableStock.FieldValues['id']:=EditProduit.Text;
      DataStocks.FDTableStock.FieldValues['code']:=editcode.Text;
      DataStocks.FDTableStock.FieldValues['type']:=ComboBoxType.Text;
      DataStocks.FDTableStock.FieldValues['producteur']:=ComboBoxProducteur.Text;
      DataStocks.FDTableStock.FieldValues['DateProd']:=DateTimePicker1.Date;
      DataStocks.FDTableStock.FieldValues['DateConsm']:=DateTimePicker2.Date;
      DataStocks.FDTableStock.FieldValues['Quantite']:=strtoint(EditQunt.Text);
      DataStocks.FDTableStock.FieldValues['PrixAchat']:=strtofloat(editPrixAchat.Text);
      DataStocks.FDTableStock.FieldValues['PrixVente']:=strtofloat(editPrixVente.Text);
      DataStocks.FDTableStock.FieldValues['PrixVenteGros']:=strtofloat(editPrixVenteGros.Text);
      DataStocks.FDTableStock.FieldValues['QuantiteLot']:=strtofloat(EditQuantiteLot.Text);
      DataStocks.FDTableStock.FieldValues['DateEntree']:=date;
      DataStocks.FDTableStock.FieldValues['expire']:=false;
      DataStocks.FDTableStock.FieldValues['alert']:=false;
      DataStocks.FDQuerySelectStockId.Params.ParamValues['x']:=cxLookupComboBoxStockName.Text;
      DataStocks.FDQuerySelectStockId.Active:=false;
      DataStocks.FDQuerySelectStockId.Active:=true;
      DataStocks.FDTableStock.FieldValues['NumStock']:=DataStocks.FDQuerySelectStockId.FieldValues['numstock'];
      DataStocks.FDTableStock.FieldValues['balance']:=FormEtatStock.balance;
      DataStocks.FDTableStock.Next;
    if not FormEtatStock.exist then
       NouveauProduit();
    DataStocks.FDQuerystockAllbyId.Close;
    DataStocks.FDQuerystockAllbyId.Open;
    close;
    FormEtatStock.edit2.Clear;
    end;
end;
//______________________________________________________________________________

procedure TFormAjouterProduits.ajouterfacture(typeops,source,destination:integer);   // FormFacturation
var b:boolean;
    x:integer;
begin
    b:=false;
    with formFacturation do
    begin
     if typeops=1 then         // movements entre stocks
       begin
         DataFacturation.FDQueryFindProductInStoke.Params.ParamValues['z']:=editcode.Text;   // Recherhce de produit dans le stock
         DataFacturation.FDQueryFindProductInStoke.Params.ParamValues['x']:=id;
         DataFacturation.FDQueryFindProductInStoke.Params.ParamValues['q']:=strtoint(EditQunt.Text);
         DataFacturation.FDQueryFindProductInStoke.Params.ParamValues['n']:=source;
         DataFacturation.FDQueryFindProductInStoke.Active:=false;
         DataFacturation.FDQueryFindProductInStoke.Active:=true;
         if DataFacturation.FDQueryFindProductInStoke.RecordCount>0 then   /// Produit disponible
         begin
            formFacturation.numstockage:=DataFacturation.FDQueryFindProductInStoke['Num'];
            DataFacturation.FDQueryFindProductInStoke.Edit;
            x:=DataFacturation.FDQueryFindProductInStoke['Quantite'];
            DataFacturation.FDQueryFindProductInStoke.FieldValues['Quantite']:=x-strtoint(EditQunt.Text);
            DataFacturation.FDQueryFindProductInStoke.Post;
            b:=true
         end
         else begin
                b:=false;
                showmessage('  السلعة أو الكمية المطلوبة غير متوفرة في المخزن   ');
              end;
       end
     else b:=true;

    if b then
    begin                           // nouvelle factute
      DataFacturation.FDQueryFactureEntrante.Insert;
      DataFacturation.FDQueryFactureEntrante.FieldValues['id']:=id;
      DataFacturation.FDQueryFactureEntrante.FieldValues['Annee']:=Annee;
      DataFacturation.FDQueryFactureEntrante.FieldValues['num']:=num;
      DataFacturation.FDQueryFactureEntrante.FieldValues['type']:=tp;
      DataFacturation.FDQueryFactureEntrante.FieldValues['producteur']:=prod;
      DataFacturation.FDQueryFactureEntrante.FieldValues['Quantite']:=strtoint(EditQunt.Text);
      DataFacturation.FDQueryFactureEntrante.FieldValues['QuantiteLot']:=strtoint(EditQuantiteLot.Text);
      DataFacturation.FDQueryFactureEntrante.FieldValues['PrixAchat']:=strtoint(editPrixAchat.Text);
      DataFacturation.FDQueryFactureEntrante.FieldValues['PrixVente']:=strtoint(editPrixVente.Text);
      DataFacturation.FDQueryFactureEntrante.FieldValues['PrixVenteGros']:=strtoint(editPrixVenteGros.Text);
      DataFacturation.FDQueryFactureEntrante.FieldValues['DateProd']:=DateTimePicker1.Date;
      DataFacturation.FDQueryFactureEntrante.FieldValues['DateEntree']:=date;

      DataFacturation.FDQueryFactureEntrante.FieldValues['NumStock']:=destination;
      DataFacturation.FDQueryFactureEntrante.FieldValues['NumUser']:=DataModule1.FDQuery115.FieldValues['NumUser'];
      DataFacturation.FDQueryFactureEntrante.FieldValues['DateConsm']:=DateTimePicker2.Date;
      DataFacturation.FDQueryFactureEntrante.FieldValues['code']:=editcode.Text;
      DataFacturation.FDQueryFactureEntrante.FieldValues['balance']:=false;
      DataFacturation.FDQueryFactureEntrante.Next;
      DataFacturation.FDQueryFactureEntrante.First;
      som:=0;
      while not DataFacturation.FDQueryFactureEntrante.Eof do
      begin
         som:=som+DataFacturation.FDQueryFactureEntrante.FieldValues['PrixAchat']*DataFacturation.FDQueryFactureEntrante.FieldValues['Quantite'];
         DataFacturation.FDQueryFactureEntrante.Next;
         dxGaugeControl1DigitalScale1.Value:=inttostr(som);
      end;
    end;
    FormAjouterProduits.close;
    EditCodeProduit.Clear;
    end;
end;
//______________________________________________________________________________


function TFormAjouterProduits.verifierChamp():boolean;
begin
    if (Pachat) and (Pvente) and (PventeG) and (cbar) and (idP) and (QtL) then
    begin
    case f of
    5,8:begin
    if ((length(EditQunt.Text)>0)and (length(cxLookupComboBoxStockName.Text)>0)) then
         Result:=true
       else Result:=false;
      end;

    6:Result:=true

    end;

    end
    else
    Result:=false;
end;
end.
