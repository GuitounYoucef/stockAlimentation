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
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
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
uses unit36;

{$R *.dfm}



procedure TFormParametrage.cxButton1Click(Sender: TObject);
begin
if length(cxTextEdit1.Text)>0 then
begin
  DataModule1.FDTableStockid25.Insert;
  DataModule1.FDTableStockid25.FieldValues['id']:=cxTextEdit1.Text;
  cxDBComboBoxStockid.Properties.Items.Add(cxTextEdit1.Text);
  DataModule1.FDTableStockid25.Next;
  cxTextEdit1.Clear;
end;
end;

procedure TFormParametrage.cxButton2Click(Sender: TObject);
begin
DataModule1.FDTableImprimante.Edit;
DataModule1.FDTableParametrage.Edit;
DataModule1.FDTableImprimante.Post;
DataModule1.FDTableParametrage.Post;
close;
end;

procedure TFormParametrage.cxDBComboBoxstockidPropertiesChange(Sender: TObject);
begin
DataModule1.FDQuerystockid25.Params.ParamValues['x']:=cxDBComboBoxstockid.Text;
DataModule1.FDQuerystockid25.Close;
DataModule1.FDQuerystockid25.Open();
if DataModule1.FDQuerystockid25.RecordCount>0 then
begin
  DataModule1.FDTableParametrage.Edit;
  DataModule1.FDTableParametrage.FieldValues['stocknum']:= DataModule1.FDQuerystockid25.FieldValues['Numstock'];
  DataModule1.FDTableParametrage.Post;
end;
end;

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
DataModule1.FDTableStockid25.First;
while not DataModule1.FDTableStockid25.Eof do
begin
  cxDBComboBoxStockid.Properties.Items.Add(DataModule1.FDTableStockid25.FieldValues['id']);
  DataModule1.FDTableStockid25.Next;
end;
end;

end.
