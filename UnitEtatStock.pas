unit UnitEtatStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, Data.Win.ADODB, Vcl.DBCtrls, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Vcl.WinXCtrls, frxClass, frxDBSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  cxClasses, dxGaugeCustomScale, dxGaugeDigitalScale, dxGaugeControl, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TFormEtatStock = class(TForm)
    DataSourceEtatStoke: TDataSource;
    ImageList1: TImageList;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    GridPanel3: TGridPanel;
    DBNavigator1: TDBNavigator;
    ButtonImprListeStoke: TButton;
    GridPanel4: TGridPanel;
    EditCodeBar: TEdit;
    GridPanel5: TGridPanel;
    GridPanel6: TGridPanel;
    Image2: TImage;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    frxReportNormal: TfrxReport;
    ButtonConsultation: TButton;
    SearchBox1: TSearchBox;
    ButtonBalance: TButton;
    ComboBoxStokesListe: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale;
    dxGaugeControl2: TdxGaugeControl;
    dxGaugeDigitalScale1: TdxGaugeDigitalScale;
    dxGaugeControl3: TdxGaugeControl;
    dxGaugeDigitalScale2: TdxGaugeDigitalScale;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableViewProdCode: TcxGridDBColumn;
    cxGrid1DBTableViewPrixVente: TcxGridDBColumn;
    cxGrid1DBTableViewPordId: TcxGridDBColumn;
    cxGrid1DBTableViewQuantite: TcxGridDBColumn;
    GridPanel8: TGridPanel;
    cxLookupComboBoxCodeProd: TcxLookupComboBox;
    DataSourceListProduits: TDataSource;
    cxGrid1DBTableViewtotal: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    frxDBDataset1: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure ButtonImprListeStokeClick(Sender: TObject);

    procedure EditCodeBarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchBox1Change(Sender: TObject);
    procedure SearchBox1Enter(Sender: TObject);
    procedure ButtonListeProdClick(Sender: TObject);
    procedure EditCodeBarEnter(Sender: TObject);
    procedure EditCodeBarClick(Sender: TObject);
    procedure ButtonConsultationClick(Sender: TObject);
    procedure ComboBoxStokesListeSelect(Sender: TObject);

    procedure ajouterProduit(codeProd,id:string);
    procedure cxLookupComboBoxCodeProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure selectRechercheObj();
    procedure UpdateGrid();
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormMouseEnter(Sender: TObject);
    procedure cxLookupComboBoxCodeProdEnter(Sender: TObject);

  private
    { Déclarations privées }
  public
  var exist,balance:boolean;
      tp,id,prod:string;
      barcode:string;

    { Déclarations publiques }
  end;

var
  FormEtatStock: TFormEtatStock;
  lien,rechercheObj:string;
  searchResult : TSearchRec;
  selectItem:integer;

implementation

{$R *.dfm}

uses  UnitRechercheStock, UnitRechercheNomProduit, UnitAjouterProduits, UnitStockDetail, DataStocksUnite,DataParametrageUnite;


//______________________________________________________________________________
procedure TFormEtatStock.ButtonImprListeStokeClick(Sender: TObject);
begin
    if DataStocks.FDQueryEtatStokeId.RecordCount>0 then
    frxReportNormal.ShowReport(true);
end;

//______________________________________________________________________________
procedure TFormEtatStock.ButtonListeProdClick(Sender: TObject);
begin

end;
//______________________________________________________________________________
procedure updateafficheurs();
begin
    if DataStocks.FDQuerySomStoke.RecordCount>0 then
     begin
      if DataStocks.FDQuerySomStoke.FieldValues['a']>0 then    // a:achats
      FormEtatStock.dxGaugeControl1DigitalScale1.value:=floattostr(DataStocks.FDQuerySomStoke.FieldValues['a'])
      else
      FormEtatStock.dxGaugeControl1DigitalScale1.Value:='0';   // v:ventes

      if DataStocks.FDQuerySomStoke.FieldValues['v']>0 then
      FormEtatStock.dxGaugeDigitalScale1.Value:=floattostr(DataStocks.FDQuerySomStoke.FieldValues['v'])
      else
      FormEtatStock.dxGaugeDigitalScale1.Value:='0';

      if DataStocks.FDQuerySomStoke.FieldValues['b']>0 then    // b:bénifices
      FormEtatStock.dxGaugeDigitalScale2.Value:=floattostr(DataStocks.FDQuerySomStoke.FieldValues['b'])
      else
      FormEtatStock.dxGaugeDigitalScale2.Value:='0';
     end
end;
//______________________________________________________________________________
procedure TFormEtatStock.ButtonConsultationClick(Sender: TObject);
begin
    FormStockDetail.DataSourceAllStockInventaire.DataSet:=DataStocks.FDQueryStockInventaire;
    FormStockDetail.DataSourceAllStockFacture.DataSet:=DataStocks.FDQueryStockFacture;
    FormStockDetail.show;
end;
//______________________________________________________________________________
procedure TFormEtatStock.ComboBoxStokesListeSelect(Sender: TObject);
begin
  SearchBox1.Clear;
   if ComboBoxStokesListe.ItemIndex=ComboBoxStokesListe.Items.Count-1 then
      DataStocks.selectAllStokes()
  else
      DataStocks.selectStoke(ComboBoxStokesListe.Text);
  updateafficheurs();
  UpdateGrid();
end;
procedure TFormEtatStock.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
FormStockDetail.rechByProd(DataStocks.FDQueryEtatStokeId.FieldValues['id'],
                           DataStocks.FDQueryEtatStokeId.FieldValues['code']);

end;

procedure TFormEtatStock.cxLookupComboBoxCodeProdEnter(Sender: TObject);
begin
LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;

procedure TFormEtatStock.cxLookupComboBoxCodeProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=VK_RETURN then
      selectItem:=selectItem+1;
  if (selectItem=2) then
     begin
       ajouterProduit('******',cxLookupComboBoxCodeProd.Text);
       cxLookupComboBoxCodeProd.ClearSelection;
       rechercheObj:='cxLookupComboBox';
       selectItem:=0;
     end;
end;


procedure TFormEtatStock.EditCodeBarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_RETURN then
     begin
       ajouterProduit(EditCodeBar.Text,'******');
       EditCodeBar.Clear;
       rechercheObj:='EditCodeProduit';
     end;
end;
//______________________________________________________________________________

procedure TFormEtatStock.selectRechercheObj;
begin
    if rechercheObj='cxLookupComboBox' then
       cxLookupComboBoxCodeProd.SetFocus
    else
       EditCodeBar.SetFocus;
end;



//______________________________________________________________________________


procedure TFormEtatStock.EditCodeBarClick(Sender: TObject);
begin
    LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;
//______________________________________________________________________________
procedure TFormEtatStock.EditCodeBarEnter(Sender: TObject);
begin
    LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;
//______________________________________________________________________________


procedure TFormEtatStock.ajouterProduit(codeProd, id: string);
begin
    FormAjouterProduits.TrouverProduitForm(codeProd,id);
    FormAjouterProduits.AfficherForm(5);
    UpdateGrid();

end;
//______________________________________________________________________________
procedure TFormEtatStock.FormMouseEnter(Sender: TObject);
begin
FormShow(FormEtatStock)
end;

procedure TFormEtatStock.FormShow(Sender: TObject);
var i:integer;
begin
    DataStocks.selectAllStokes();
    EditCodeBar.SetFocus;
    frxReportNormal.PrintOptions.Printer:=DataParametrage.FDTableImprimante.FieldValues['Normale'];
    DataStocks.FDTableStockid.First;
    ComboBoxStokesListe.Clear;
    while not DataStocks.FDTableStockid.Eof do
        begin
          ComboBoxStokesListe.Items.Add(DataStocks.FDTableStockid.FieldValues['id']);
          DataStocks.FDTableStockid.Next;
        end;
    ComboBoxStokesListe.Items.Add('الكل');
    updateafficheurs();
    UpdateGrid();

end;
//______________________________________________________________________________
procedure TFormEtatStock.SearchBox1Change(Sender: TObject);
begin
    if length(SearchBox1.Text)>0 then
      begin
        DataStocks.rechercheProdByName(SearchBox1.Text);
        updateafficheurs();
        UpdateGrid();
      end
end;
//______________________________________________________________________________
procedure TFormEtatStock.SearchBox1Enter(Sender: TObject);
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
end;


procedure TFormEtatStock.UpdateGrid();
var i:integer;
    begin
      for I := 0 to cxGrid1DBTableView1.DataController.RecordCount-1 do
      begin
          cxGrid1DBTableView1.DataController.Values[i,4]:='    '+floattostr(cxGrid1DBTableView1.DataController.Values[i,3]*
          cxGrid1DBTableView1.DataController.Values[i,2]);
      end;
end;
end.
