unit UnitProduits;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  frxClass, frxDBSet, frxBarcode, Vcl.ExtDlgs;

type
  TFormProduits = class(TForm)
    ImageList1: TImageList;
    ImageList3: TImageList;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    GridPanel3: TGridPanel;
    Button7: TButton;
    Button5: TButton;
    GridPanel6: TGridPanel;
    Image2: TImage;
    GridPanel7: TGridPanel;
    Label2: TLabel;
    Image3: TImage;
    DBNavigator1: TDBNavigator;
    frxReportNormal: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Button4: TButton;
    DBGrid2: TDBGrid;
    OpenPictureDialog1: TOpenPictureDialog;
    frxReportCodeBar: TfrxReport;
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);


  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;
var
  FormProduits: TFormProduits;
  i:integer;
  lien:string;
  searchResult : TSearchRec;

implementation

{$R *.dfm}

uses  UnitAjouterProduits,unit36;

procedure TFormProduits.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
if DataModule1.FDQuery61.RecordCount>0 then
if DataModule1.FDQuery61.FieldValues['Lien']<>null then
if FindFirst(DataModule1.FDQuery61.FieldValues['Lien'],faAnyFile,searchResult)=0 then
Image2.Picture.LoadFromFile(DataModule1.FDQuery61.FieldValues['Lien'])

end;

procedure TFormProduits.Button1Click(Sender: TObject);
begin
//if form31.Height=598 then
begin
FormAjouterProduits.Panel1.Enabled:=true;
FormAjouterProduits.cxLookupComboBoxStockName.Enabled:=true;
FormAjouterProduits.Height:=468;
FormAjouterProduits.GridPanel1.RowCollection.Items[2].Value:=0;
end;
FormAjouterProduits.show;
FormAjouterProduits.effacer();
FormAjouterProduits.f:=6;
end;

procedure TFormProduits.Button3Click(Sender: TObject);
begin
if DataModule1.FDQuery61.RecordCount>0 then
frxReportCodeBar.ShowReport(true);
end;

procedure TFormProduits.Button4Click(Sender: TObject);
begin
if DataModule1.FDQuery61.RecordCount>0 then
  if  OpenPictureDialog1.Execute(Self.Handle) then
  begin
    Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    DataModule1.FDQuery61.Edit;
    DataModule1.FDQuery61.FieldValues['lien']:=OpenPictureDialog1.FileName;
    DataModule1.FDQuery61.Post;

  end;
end;

procedure TFormProduits.Button5Click(Sender: TObject);
begin
if DataModule1.FDQuery61.RecordCount>0 then
frxReportNormal.ShowReport(true);
end;

procedure TFormProduits.Button7Click(Sender: TObject);
begin
if DataModule1.FDQuery61.RecordCount>0 then
begin
DataModule1.FDQuery6Entree.Params.ParamValues['x']:=DataModule1.FDQuery61.FieldValues['id'];
DataModule1.FDQuery6Entree.Params.ParamValues['y']:=DataModule1.FDQuery61.FieldValues['code'];
DataModule1.FDQuery6Entree.Close;
DataModule1.FDQuery6Entree.Open;
if DataModule1.FDQuery6Entree.RecordCount=0 then
DBNavigator1.BtnClick(nbdelete)
else
MessageDlg('حذف السلعة غير مسموح بسبب إستعمالها في تخزين سابق', mtInformation, [mbOK], 0);
end;
end;

initialization;
i:=0;
end.
