unit UnitVenteComptoir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls,
  Data.Win.ADODB, Vcl.Imaging.jpeg, Vcl.MPlayer,
  System.ImageList, Vcl.ImgList, Vcl.WinXCtrls, frxClass, frxDBSet,
  System.Actions, Vcl.ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxGaugeCustomScale, dxGaugeDigitalScale, dxGaugeControl, Vcl.Menus, cxButtons,
  dxGDIPlusClasses, cxImageList, cxContainer, cxImage, DataVenteUnit, dxBarCode,
  dxLayoutContainer, cxGridViewLayoutContainer, cxGridLayoutView,
  cxGridDBLayoutView, cxGridCustomLayoutView, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TFormVenteComptoir = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Button3: TButton;
    Button5: TButton;
    frxDBDataset1: TfrxDBDataset;
    ImageList4: TImageList;
    ActionList1: TActionList;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    GridPanel4: TGridPanel;
    GridPanel6: TGridPanel;
    GridPanel3: TGridPanel;
    Edit1: TEdit;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    DataSourceListeProdBD: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    GridPanel9: TGridPanel;
    ButtonSupprimer: TButton;
    ButtonNouvOpr: TButton;
    ButtonListeVente: TButton;
    ButtonListProds: TButton;
    ButtonImpBonRecp: TButton;
    ButtonImpTicket: TButton;
    ToggleSwitchPaiment: TToggleSwitch;
    ComboBoxNomPrenom: TComboBox;
    dxGaugeControl2: TdxGaugeControl;
    dxGaugeControl2DigitalScale1: TdxGaugeDigitalScale;
    cxImageList1: TcxImageList;
    Image2: TImage;
    frxDBDatasetCredit: TfrxDBDataset;
    ToggleSwitchPrintigAuto: TToggleSwitch;
    frxDBDatasetSortie: TfrxDBDataset;
    DBNavigator1: TDBNavigator;
    DataSourceListOprsSortie: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Num: TcxGridDBColumn;
    cxGrid1DBTableView1PrixVente: TcxGridDBColumn;
    cxGrid1DBTableView1CodeProduit: TcxGridDBColumn;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1producteur: TcxGridDBColumn;
    cxGrid1DBTableView1Quantite: TcxGridDBColumn;
    cxGrid1DBTableView1som: TcxGridDBColumn;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale;
    GridPanel5: TGridPanel;
    cxLookupComboBoxCodeProd: TcxLookupComboBox;
    DataSourceListProduits: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure ButtonSupprimerClick(Sender: TObject);
    procedure ButtonNouvOprClick(Sender: TObject);
    procedure ToggleSwitchPaimentClick(Sender: TObject);
    procedure ButtonListeVenteClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure ButtonImpBonRecpClick(Sender: TObject);
    procedure UpdateGrid();
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonListProdsClick(Sender: TObject);
    procedure ButtonImpTicketClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure ComboBoxNomPrenomChange(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure VenteProduit(codeProduit,id:string;quantite:integer);
    procedure cxLookupComboBoxCodeProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
  var
    annee: string;
    num, c, typeclient: integer;
    typevente: byte;
    bcode: string;
    quantitesoke: real;

    { Déclarations publiques }
  end;

var
  FormVenteComptoir: TFormVenteComptoir;

implementation

{$R *.dfm}

uses UnitPrixQntUpDateVente,  Unit22, UnitRechercheStock, UnitListeVente, Unit36,UnitDelivrenceData;

procedure TFormVenteComptoir.ButtonSupprimerClick(Sender: TObject);
var
  x, y: integer;
  som: real;
begin
  DataModuleVente.SupprimerProdList(1);
  dxGaugeControl1DigitalScale1.Value :=FloatTostrF(DataModuleVente.CalculerSomme(), ffFixed, 12, 2);
end;

procedure TFormVenteComptoir.ComboBoxNomPrenomChange(Sender: TObject);
begin
if length(ComboBoxNomPrenom.Text)>1 then
DataModuleVente.ModifierNomClient(ComboBoxNomPrenom.Text);
end;

procedure TFormVenteComptoir.UpdateGrid();
var i:integer;
begin
  for I := 0 to cxGrid1DBTableView1.DataController.RecordCount-1 do
  begin
      cxGrid1DBTableView1.DataController.Values[i,0]:=i+1;
      cxGrid1DBTableView1.DataController.Values[i,6]:=cxGrid1DBTableView1.DataController.Values[i,5]*
      cxGrid1DBTableView1.DataController.Values[i,4];
  end;
end;

procedure TFormVenteComptoir.ButtonNouvOprClick(Sender: TObject);
// nouvelle ops
begin
  if DataModuleVente.FDQueryListeProdBD.RecordCount > 0 then
  begin
    if ToggleSwitchPrintigAuto.State = tssOn then
      case DataModuleVente.operation.typevente of
        1:ButtonImpTicketClick(FormVenteComptoir);
        2:ButtonImpBonRecpClick(FormVenteComptoir);
      end;
    // DataModuleVente.ValiderOpr(DataModuleVente.operation);
    DataModuleVente.NouvelleOpr(DataModuleVente.operation.typevente, 2);
    ToggleSwitchPaiment.State := tssoff;
    ComboBoxNomPrenom.Text := '';
    dxGaugeControl1DigitalScale1.Value := FloatTostrF(0, ffFixed, 12, 2);
    dxGaugeControl2DigitalScale1.Value :=
      inttostr(DataModuleVente.operation.num);

  end;
end;

procedure TFormVenteComptoir.ButtonImpBonRecpClick(Sender: TObject);

begin
  if cxGrid1DBTableView1.DataController.RecordCount > 0 then
  begin
   // DataModuleVente.CalculerCredit();
    frxReport1.ShowReport(true);
  end;
end;

procedure TFormVenteComptoir.ButtonImpTicketClick(Sender: TObject);
begin
  if cxGrid1DBTableView1.DataController.RecordCount > 0 then
  begin
    //DataModuleVente.CalculerCredit();
   frxReport2.ShowReport(true);
  end;
end;

procedure TFormVenteComptoir.ButtonListeVenteClick(Sender: TObject);
// liste vente
begin
  DataModule1.FD35QueryListeVente.Params.ParamValues['x'] := typevente;
  DataModule1.FD35QueryListeVente.Active := false;
  DataModule1.FD35QueryListeVente.Active := true;
  if DataModule1.FD35QueryListeVente.RecordCount > 0 then
    DataModule1.FD35QueryListeVente.Last;
  FormListeVente.show;
  if typevente = 1 then
    FormListeVente.Panel1.Caption := 'عمليات بيع التجزئة'
  else
    FormListeVente.Panel1.Caption := 'عمليات بيع الجملة'
end;

procedure TFormVenteComptoir.ButtonListProdsClick(Sender: TObject);
// liste produit
begin
  FormRechercheStock.show;
end;

procedure TFormVenteComptoir.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  dxGaugeControl2DigitalScale1.Value := inttostr(DataModuleVente.Parcourir(0));
  dxGaugeControl1DigitalScale1.Value :=FloatTostrF(DataModuleVente.CalculerSomme(), ffFixed, 12, 2);
  UpdateGrid();
end;

procedure TFormVenteComptoir.Edit1Enter(Sender: TObject);
begin
  LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;

procedure TFormVenteComptoir.VenteProduit(codeProduit,id:string;quantite:integer);
var p: Produits;
begin
  p := DataModuleVente.TrouverPrduit(DataModuleVente.operation.NumStock,DataModuleVente.operation.typevente,id, codeProduit,quantite);
  if ((Length(DataModuleVente.operation.Client) > 1) and (DataModuleVente.operation.typevente = 2)) or
    (DataModuleVente.operation.typevente = 1) then
    begin
    if p.quantite > 0 then
    begin
      DataModuleVente.AjouterProdList(p);
      dxGaugeControl1DigitalScale1.Value :=
      FloatTostrF(DataModuleVente.CalculerSomme(), ffFixed, 12, 2);
      UpdateGrid();
    end
    else
      MessageDlg('السلعة المطلوبة غير متوفرة في المخزن' + ' : ' +
        DataModule1.FDTableParametrage['stockid'], mtInformation,
        [mbOK], 0);
  end
  else
    MessageDlg('عليك إختيار إسم الزبون قبل بداية عملية البيع بالجملة',
      mtInformation, [mbOK], 0);
   Edit1.Clear;
end;

procedure TFormVenteComptoir.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  case Key of
    VK_RETURN:VenteProduit(Edit1.Text,'*****',1);
    VK_F5:ButtonImpTicketClick(FormVenteComptoir);
    VK_F6:ButtonImpBonRecpClick(FormVenteComptoir);
    VK_F1:ButtonNouvOprClick(FormVenteComptoir);
    VK_F2:ButtonSupprimerClick(FormVenteComptoir);
    VK_F3:ButtonListProdsClick(FormVenteComptoir);
    VK_F4:ButtonListeVenteClick(FormVenteComptoir);
  end;
end;

procedure TFormVenteComptoir.cxLookupComboBoxCodeProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:VenteProduit('*****',cxLookupComboBoxCodeProd.Text,1);
  end;
end;


procedure TFormVenteComptoir.FormShow(Sender: TObject);
var
  myYear, myMonth, myDay: Word;
  i: integer;
begin
  dxGaugeControl2DigitalScale1.Value := inttostr(DataModuleVente.Parcourir(0));
  dxGaugeControl1DigitalScale1.Value :=
    FloatTostrF(DataModuleVente.CalculerSomme(), ffFixed, 12, 2);
  DataModule1.FDTableImprimante.Active := false;
  DataModule1.FDTableImprimante.Active := true;
  if Length(ComboBoxNomPrenom.Text) > 0 then
    ComboBoxNomPrenom.Enabled := false
  else
    ComboBoxNomPrenom.Enabled := true;
  // --------------- clear --------------------
  // ComboBoxProduit.Clear;
  ComboBoxNomPrenom.Clear;
  // ------------------

  DataModule1.FDQueryClient1.Params.ParamValues['x'] :=DataModuleVente.operation.typevente;
  DataModule1.FDQueryClient1.Active := false;
  DataModule1.FDQueryClient1.Active := true;
  while not DataModule1.FDQueryClient1.Eof do
  begin
    ComboBoxNomPrenom.Items.Add(DataModule1.FDQueryClient1.FieldValues
      ['Client']);
    DataModule1.FDQueryClient1.Next;
  end;

  // if Image2.Picture.Graphic = NIL then
  case DataModuleVente.operation.typevente of
    1:
      if FileExists('shoping.png') then
        Image2.Picture.LoadFromFile('shoping.png');

    2:
      if FileExists('shoping2.png') then
        Image2.Picture.LoadFromFile('shoping2.png');
  end;
  Edit1.SetFocus;
  UpdateGrid();
end;

procedure TFormVenteComptoir.ToggleSwitchPaimentClick(Sender: TObject);
begin
  if Length(ComboBoxNomPrenom.Text) = 0 then
  begin
    ToggleSwitchPaiment.State := tssoff;
    DataModuleVente.ModifierTypePaiment(1);
    ToggleSwitchPaiment.ThumbColor := clGreen;
    MessageDlg('عليك إختيار  إسم الزبون قبل بداية عملية البيع', mtInformation,
      [mbOK], 0);
  end
  else
  begin
    DataModuleVente.ModifierTypePaiment(2);
    DataModuleVente.ModifierNomClient(ComboBoxNomPrenom.Text);
  end;
end;

procedure TFormVenteComptoir.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if cxGrid1DBTableView1.DataController.RecordCount > 0 then
  begin
    FormPrixQntUpDateVente.show;
    FormPrixQntUpDateVente.EditQuantite.Text := floattostr(DataModuleVente.GetQuantiteList());
    FormPrixQntUpDateVente.EditPrix.Text :=floattostr(DataModuleVente.GetPrixAchatList());
  end;
end;


initialization ;

end.
