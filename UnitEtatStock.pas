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
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid;

type
  TFormEtatStock = class(TForm)
    DataSource1: TDataSource;
    ImageList1: TImageList;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    GridPanel3: TGridPanel;
    DBNavigator1: TDBNavigator;
    Button2: TButton;
    GridPanel4: TGridPanel;
    Edit2: TEdit;
    GridPanel5: TGridPanel;
    GridPanel6: TGridPanel;
    Image2: TImage;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    frxReportNormal: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ButtonCodeBar: TButton;
    SearchBox1: TSearchBox;
    Button8: TButton;
    Button9: TButton;
    ComboBox1: TComboBox;
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
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchBox1Change(Sender: TObject);
    procedure SearchBox1Enter(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ButtonCodeBarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
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
  lien:string;
  searchResult : TSearchRec;



implementation

{$R *.dfm}

uses  UnitRechercheStock, UnitRechercheNomProduit, UnitAjouterProduits, UnitStockDetail, unit36;

procedure TFormEtatStock.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
DataModule1.FDQueryCodeProduit.Params.ParamValues['x']:=DataModule1.FDQuerystockAll5.FieldValues['code'];
DataModule1.FDQueryCodeProduit.Close;
DataModule1.FDQueryCodeProduit.Open;
if DataModule1.FDQueryCodeProduit.RecordCount>0 then
if DataModule1.FDQueryCodeProduit.FieldValues['Lien']<>null then
if FindFirst(DataModule1.FDQueryCodeProduit.FieldValues['Lien'],faAnyFile,searchResult)=0 then
Image2.Picture.LoadFromFile(DataModule1.FDQueryCodeProduit.FieldValues['Lien']);
end;

procedure TFormEtatStock.BitBtn2Click(Sender: TObject);
begin

DBNavigator1.BtnClick(nbpost);
end;

procedure TFormEtatStock.Button2Click(Sender: TObject);
begin
if DataModule1.FDQuerystockAll5.RecordCount>0 then
frxReportNormal.ShowReport(true);
end;

procedure TFormEtatStock.Button3Click(Sender: TObject);
begin
if DataSource1.DataSet=DataModule1.FDQuerystockAll5 then
begin
if DataModule1.FDQuerystockAll5.RecordCount>0 then
if DataModule1.FDQuerystockAll5.FieldValues['s']>0 then
if MessageDlg('هل تريد فعلا حذف هذه السلعة من المخزن',mtConfirmation,mbYesNo,0)=mrYes then
begin
DataModule1.FDQuerystockAll5.Edit;
DataModule1.FDQuerystockAll5.FieldValues['s']:=0;
DataModule1.FDQuerystockAll5.Post;
end
end
else
begin
if DataModule1.FDQueryStock5.RecordCount>0 then
if DataModule1.FDQueryStock5.FieldValues['Quantite']>0 then
if MessageDlg('هل تريد فعلا حذف هذه السلعة من المخزن',mtConfirmation,mbYesNo,0)=mrYes then
begin
DataModule1.FDQueryStock5.Edit;
DataModule1.FDQueryStock5.FieldValues['Quantite']:=0;
DataModule1.FDQueryStock5.Post;
end;
end;
end;



procedure TFormEtatStock.Button4Click(Sender: TObject);
begin
{if Button4.Caption='Fr' then
begin
LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
Button4.Caption:='Ar';
Edit1.Clear;
Edit1.BiDiMode:=bdlefttoRight;
end
else
begin
LoadKeyboardLayout('00000401', KLF_ACTIVATE);
Button4.Caption:='Fr';
Edit1.Clear;
Edit1.BiDiMode:=bdRighttoleft;
end;        }
end;


procedure TFormEtatStock.Button9Click(Sender: TObject);
begin
FormRechercheNomProduit.show;
FormRechercheNomProduit.f:=5;

end;

procedure updateafficheurs();
begin
if DataModule1.FD5Querysom.RecordCount>0 then
 begin
  if DataModule1.FD5Querysom.FieldValues['a']>0 then
  FormEtatStock.dxGaugeControl1DigitalScale1.value:=floattostr(DataModule1.FD5Querysom.FieldValues['a'])
  else
  FormEtatStock.dxGaugeControl1DigitalScale1.Value:='0';

  if DataModule1.FD5Querysom.FieldValues['v']>0 then
  FormEtatStock.dxGaugeDigitalScale1.Value:=floattostr(DataModule1.FD5Querysom.FieldValues['v'])
  else
  FormEtatStock.dxGaugeDigitalScale1.Value:='0';

  if DataModule1.FD5Querysom.FieldValues['b']>0 then
  FormEtatStock.dxGaugeDigitalScale2.Value:=floattostr(DataModule1.FD5Querysom.FieldValues['b'])
  else
  FormEtatStock.dxGaugeDigitalScale2.Value:='0';
 end


end;

procedure TFormEtatStock.ButtonCodeBarClick(Sender: TObject);
begin
FormStockDetail.DataSource1.DataSet:=DataModule1.FDTableStock33;
FormStockDetail.show;
end;

procedure TFormEtatStock.ComboBox1Select(Sender: TObject);
begin
SearchBox1.Clear;
DataModule1.FD8QuerySelectStockId.Params.ParamValues['x']:=ComboBox1.Text;
DataModule1.FD8QuerySelectStockId.Close;
DataModule1.FD8QuerySelectStockId.Open();
if DataModule1.FD8QuerySelectStockId.RecordCount=1 then
begin
if combobox1.Text='الكل' then
begin
DataModule1.FDQuerystockAll5.Params.ParamValues['x']:=0;
DataModule1.FDQuerystockAll5.Params.ParamValues['y']:=100;
DataModule1.FD5Querysom.Params.ParamValues['x']:=0;
DataModule1.FD5Querysom.Params.ParamValues['y']:=100;

end
else
begin
DataModule1.FDQuerystockAll5.Params.ParamValues['x']:=DataModule1.FD8QuerySelectStockId.FieldValues['numstock']-1;
DataModule1.FDQuerystockAll5.Params.ParamValues['y']:=DataModule1.FD8QuerySelectStockId.FieldValues['numstock']+1;
DataModule1.FD5Querysom.Params.ParamValues['x']:=DataModule1.FD8QuerySelectStockId.FieldValues['numstock']-1;
DataModule1.FD5Querysom.Params.ParamValues['y']:=DataModule1.FD8QuerySelectStockId.FieldValues['numstock']+1;

end;
DataModule1.FDQuerystockAll5.Params.ParamValues['i']:='%%';
DataModule1.FD5Querysom.Params.ParamValues['i']:='%%';
DataModule1.FDQuerystockAll5.Active:=false;
DataModule1.FDQuerystockAll5.Active:=true;
DataModule1.FD5Querysom.Close;
DataModule1.FD5Querysom.Open();
updateafficheurs();
end;
end;

procedure TFormEtatStock.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
if DataSource1.DataSet=DataModule1.FDQuerystockAll5 then
begin
 // DataModule1.FDQueryProduitstock33.Params.ParamValues['x']:=DataModule1.FDQuerystockAll5.FieldValues['id'];
  DataModule1.FDQueryProduitstock33.Params.ParamValues['y']:=DataModule1.FDQuerystockAll5.FieldValues['code'];
end;
{else
begin
  DataModule1.FDQueryProduitstock33.Params.ParamValues['x']:=DataModule1.FDQueryRechercheStock.FieldValues['id'];
  DataModule1.FDQueryProduitstock33.Params.ParamValues['y']:=DataModule1.FDQueryRechercheStock.FieldValues['code'];
end; }
DataModule1.FDQueryProduitstock33.Close;
DataModule1.FDQueryProduitstock33.Open;
if DataModule1.FDQueryProduitstock33.RecordCount>0 then
begin
FormStockDetail.DataSource1.DataSet:=DataModule1.FDQueryProduitstock33;
FormStockDetail.show;
end;
end;

procedure TFormEtatStock.DBGrid1DblClick(Sender: TObject);
begin

if DataSource1.DataSet=DataModule1.FDQuerystockAll5 then
begin
 // DataModule1.FDQueryProduitstock33.Params.ParamValues['x']:=DataModule1.FDQuerystockAll5.FieldValues['id'];
  DataModule1.FDQueryProduitstock33.Params.ParamValues['y']:=DataModule1.FDQuerystockAll5.FieldValues['code'];
end;
{else
begin
  DataModule1.FDQueryProduitstock33.Params.ParamValues['x']:=DataModule1.FDQueryRechercheStock.FieldValues['id'];
  DataModule1.FDQueryProduitstock33.Params.ParamValues['y']:=DataModule1.FDQueryRechercheStock.FieldValues['code'];
end; }
DataModule1.FDQueryProduitstock33.Close;
DataModule1.FDQueryProduitstock33.Open;
if DataModule1.FDQueryProduitstock33.RecordCount>0 then
begin
FormStockDetail.DataSource1.DataSet:=DataModule1.FDQueryProduitstock33;
FormStockDetail.show;
end;
end;

procedure TFormEtatStock.Edit1Enter(Sender: TObject);
begin
{
if Button4.Caption='Fr' then
LoadKeyboardLayout('00000401', KLF_ACTIVATE)
else
LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
  }
end;

procedure TFormEtatStock.Edit2Click(Sender: TObject);
begin
LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;

procedure TFormEtatStock.Edit2Enter(Sender: TObject);
begin
LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;

procedure TFormEtatStock.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then
begin
FormAjouterProduits.Height:=598;
FormAjouterProduits.GridPanel1.RowCollection.Items[2].Value:=130;
FormAjouterProduits.Repaint;
DataModule1.FDQueryCodeProduit.Params.ParamValues['x']:=Edit2.Text;
DataModule1.FDQueryCodeProduit.Active:=false;
DataModule1.FDQueryCodeProduit.Active:=true;
FormAjouterProduits.f:=5;
FormAjouterProduits.DateTimePicker1.Date:=date;
//form31.DateTimePicker2.Date:=date+365;
  if DataModule1.FDQueryCodeProduit.RecordCount=1 then   // Produit déja saisi
  begin
   FormAjouterProduits.tp:=DataModule1.FDQueryCodeProduit.FieldValues['type'];
   FormAjouterProduits.prod:=DataModule1.FDQueryCodeProduit.FieldValues['producteur'];
   FormAjouterProduits.id:=DataModule1.FDQueryCodeProduit.FieldValues['id'];
//   FormAjouterProduits.editPrixAchat.Text:=floattostr(DataModule1.FDQueryCodeProduit.FieldValues['PrixAchat']);
//   FormAjouterProduits.editPrixVenteGros.Text:=floattostr(DataModule1.FDQueryCodeProduit.FieldValues['PrixVenteGros']);
//   FormAjouterProduits.editPrixVente.Text:=floattostr(DataModule1.FDQueryCodeProduit.FieldValues['PrixVente']);
//   FormAjouterProduits.EditQuantiteLot.Text:=floattostr(DataModule1.FDQueryCodeProduit.FieldValues['QuantiteLot']);

       if (DataModule1.FDQueryCodeProduit.FieldValues['Lien']<>null) and(length(DataModule1.FDQueryCodeProduit.FieldValues['Lien'])>0) then
       begin
         Image2.Picture.LoadFromFile(DataModule1.FDQueryCodeProduit.FieldValues['Lien']);
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
//    FormAjouterProduits.EditProduit.Text:=FormAjouterProduits.id;
//    FormAjouterProduits.ComboBoxProducteur.text:=FormAjouterProduits.prod;
//    FormAjouterProduits.ComboBoxType.Text:=FormAjouterProduits.tp;
    balance:=false;
    exist:=true;
    FormAjouterProduits.Panel1.Enabled:=false;
    end
  else   // Nouveau Produit
    if length(edit2.Text)>0 then
     begin
      FormAjouterProduits.show;
      Image2.Picture:=nil;
      Image2.Hide;
      Image2.Show;
      exist:=false;
      FormAjouterProduits.Panel1.Enabled:=true;
//      FormAjouterProduits.effacer;
     end;
FormAjouterProduits.f:=5;
//FormAjouterProduits.EditCode.Text:=Edit2.Text;
Edit2.Clear;

end;
end;

procedure TFormEtatStock.FormActivate(Sender: TObject);
begin
ADOQuery1AfterScroll(datasource1.DataSet);
end;

procedure TFormEtatStock.FormShow(Sender: TObject);
var i:integer;
begin
DataModule1.FDQuerystockAll5.Params.ParamValues['x']:=0;
DataModule1.FDQuerystockAll5.Params.ParamValues['y']:=100;
DataModule1.FDQuerystockAll5.Params.ParamValues['i']:='%%';
DataModule1.FD5Querysom.Params.ParamValues['x']:=0;
DataModule1.FD5Querysom.Params.ParamValues['y']:=100;
DataModule1.FD5Querysom.Params.ParamValues['i']:='%%';
DataModule1.FDQuerystockAll5.Active:=false;
DataModule1.FDQuerystockAll5.Active:=true;




Edit2.SetFocus;
frxReportNormal.PrintOptions.Printer:=DataModule1.FDTableImprimante.FieldValues['Normale'];
DataModule1.FDTableStockid25.First;
ComboBox1.Clear;
while not DataModule1.FDTableStockid25.Eof do
begin
ComboBox1.Items.Add(DataModule1.FDTableStockid25.FieldValues['id']);
DataModule1.FDTableStockid25.Next;
end;
ComboBox1.Items.Add('الكل');
updateafficheurs();

end;

procedure TFormEtatStock.SearchBox1Change(Sender: TObject);
begin
if length(SearchBox1.Text)>0 then
begin
DataModule1.FD5Querysom.Params.ParamValues['i']:='%'+SearchBox1.Text+'%';
DataModule1.FDQuerystockAll5.Params.ParamValues['i']:='%'+SearchBox1.Text+'%';
DataModule1.FDQuerystockAll5.Active:=false;
DataModule1.FDQuerystockAll5.Active:=true;
DataModule1.FD5Querysom.Close;
DataModule1.FD5Querysom.Open();
updateafficheurs();
end
end;

procedure TFormEtatStock.SearchBox1Enter(Sender: TObject);
begin
LoadKeyboardLayout('00000401', KLF_ACTIVATE);
end;

end.
