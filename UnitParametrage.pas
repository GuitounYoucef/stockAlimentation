unit UnitParametrage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxContainer,
  cxEdit, dxLayoutcxEditAdapters, dxLayoutControlAdapters, Vcl.Menus, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.StdCtrls, cxButtons, cxTextEdit, dxLayoutContainer, cxClasses,
  dxLayoutControl, cxPC, dxBarBuiltInMenu, dxTabbedMDI, Data.DB, Vcl.Grids,
  Vcl.DBGrids,Printers, dxSkinsForm;

type
  TFormParametrage = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    cxDBTextEdit5: TcxDBTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    cxTextEdit1: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    cxDBComboBoxNormale: TcxDBComboBox;
    dxLayoutItem10: TdxLayoutItem;
    cxDBComboBoxCodeBar: TcxDBComboBox;
    dxLayoutItem11: TdxLayoutItem;
    cxDBComboBoxTicket: TcxDBComboBox;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    DataSourceImprimante: TDataSource;
    DataSource2: TDataSource;
    DataSourceParametrage: TDataSource;
    DBGrid1: TDBGrid;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup;
    cxDBComboBoxstockid: TcxDBComboBox;
    dxLayoutItem15: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem13: TdxLayoutItem;
    cxDBComboBox1: TcxDBComboBox;
    dxLayoutItem9: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    cxDBComboBox2: TcxDBComboBox;
    dxLayoutItem18: TdxLayoutItem;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxDBComboBoxstockidPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormParametrage: TFormParametrage;

implementation
uses unit36, DataParametrageUnite, DataStocksUnite;

{$R *.dfm}


//------------------------------------------------------------------------------
procedure TFormParametrage.cxButton1Click(Sender: TObject);
begin
    if length(cxTextEdit1.Text)>0 then
    begin
      DataStocks.FDTableStockid.Insert;
      DataStocks.FDTableStockid.FieldValues['id']:=cxTextEdit1.Text;
      cxDBComboBoxStockid.Properties.Items.Add(cxTextEdit1.Text);
      DataStocks.FDTableStockid.Next;
      cxTextEdit1.Clear;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormParametrage.cxButton2Click(Sender: TObject);
begin
    DataParametrage.FDTableImprimante.Edit;
    DataParametrage.FDTableParametrage.Edit;
    DataParametrage.FDTableImprimante.Post;
    DataParametrage.FDTableParametrage.Post;
    close;
end;
//------------------------------------------------------------------------------
procedure TFormParametrage.cxDBComboBoxstockidPropertiesChange(Sender: TObject);
begin
    DataParametrage.FDQuerystockByid.Params.ParamValues['x']:=cxDBComboBoxstockid.Text;
    DataParametrage.FDQuerystockByid.Close;
    DataParametrage.FDQuerystockByid.Open();
    if DataParametrage.FDQuerystockByid.RecordCount>0 then
    begin
      DataParametrage.FDTableParametrage.Edit;
      DataParametrage.FDTableParametrage.FieldValues['stocknum']:= DataParametrage.FDQuerystockByid.FieldValues['Numstock'];
      DataParametrage.FDTableParametrage.Post;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormParametrage.FormCreate(Sender: TObject);
var i:integer;
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
    cxDBComboBoxNormale.Properties.Items.Clear;
    for i :=0 to Printer.Printers.Count-1  do
    begin
      cxDBComboBoxNormale.Properties.Items.Add(printer.printers[i]);
      cxDBComboBoxCodeBar.Properties.Items.Add(printer.printers[i]);
      cxDBComboBoxTicket.Properties.Items.Add(printer.printers[i]);
    end;
    cxDBComboBoxStockid.Properties.Items.Clear;
    DataStocks.FDTableStockid.First;
    while not DataStocks.FDTableStockid.Eof do
    begin
      cxDBComboBoxStockid.Properties.Items.Add(DataStocks.FDTableStockid.FieldValues['id']);
      DataStocks.FDTableStockid.Next;
    end;
end;

end.
