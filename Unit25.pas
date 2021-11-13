unit Unit25;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, frxClass,Printers, Data.DB,
  Vcl.DBCtrls, Data.Win.ADODB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  dxGDIPlusClasses;

type
  TForm25 = class(TForm)
    Panel1: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    ImageList1: TImageList;
    frxReport1: TfrxReport;
    DBComboBoxNormal: TDBComboBox;
    DataSource1: TDataSource;
    DBComboBoxCodeBar: TDBComboBox;
    DBComboBoxTicket: TDBComboBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    Label8: TLabel;
    Button2: TButton;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Image1: TImage;
    Button1: TButton;
    Label7: TLabel;
    Image2: TImage;
    DBComboBoxStockid: TDBComboBox;
    Label9: TLabel;
    Panel3: TPanel;
    Label10: TLabel;
    Label14: TLabel;
    Image3: TImage;
    DBComboBoxLangue: TDBComboBox;
    DataSource3: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBComboBoxNormalChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form25: TForm25;

implementation

uses unit36, DataParametrageUnite;
{$R *.dfm}

procedure TForm25.Button1Click(Sender: TObject);
begin

DataParametrage.FDTableImprimante.Edit;
DataParametrage.FDTableParametrage.Edit;
DataParametrage.FDTableImprimante.Post;
DataParametrage.FDTableParametrage.Post;
close;
end;


procedure TForm25.Button2Click(Sender: TObject);
begin
//if length(edit1.Text)>0 then
//begin
//  DataModule1.FDTableStockid25.Insert;
//  DataModule1.FDTableStockid25.FieldValues['id']:=edit1.Text;
//  DataModule1.FDTableStockid25.Next;
//  edit1.Clear;
//end;
end;

procedure TForm25.DBComboBoxNormalChange(Sender: TObject);
begin
frxReport1.PrintOptions.Printer:=DBComboBoxNormal.Text;
end;

procedure TForm25.FormCreate(Sender: TObject);
var i:integer;
begin
LoadKeyboardLayout('00000401', KLF_ACTIVATE);
DBComboBoxNormal.Items.Clear;
for i :=0 to Printer.Printers.Count-1  do
begin
DBComboBoxNormal.Items.Add(printer.printers[i]);
DBComboBoxCodeBar.Items.Add(printer.printers[i]);
DBComboBoxTicket.Items.Add(printer.printers[i]);
end;

//DBComboBoxStockid.Items.Clear;
//DataModule1.FDTableStockid25.First;
//while not DataModule1.FDTableStockid25.Eof do
//begin
//  DBComboBoxStockid.Items.Add(DataModule1.FDTableStockid25.FieldValues['id']);
//  DataModule1.FDTableStockid25.Next;
//end;

end;

procedure TForm25.FormShow(Sender: TObject);
var i:integer;
begin

end;

end.
