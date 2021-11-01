unit UnitListeFactures;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, System.ImageList, Vcl.ImgList, frxClass, frxDBSet,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, cxClasses, dxGaugeCustomScale, dxGaugeDigitalScale,
  dxGaugeControl;

type
  TFormListeFactures = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    DBGrid1: TDBGrid;
    GridPanel3: TGridPanel;
    DBNavigator1: TDBNavigator;
    Button3: TButton;
    ButtonCodeBar: TButton;
    GridPanel5: TGridPanel;
    SearchBox1: TSearchBox;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    ComboBox1: TComboBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    GridPanel4: TGridPanel;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    GridPanel6: TGridPanel;
    GridPanel8: TGridPanel;
    DBNavigator2: TDBNavigator;
    Button1: TButton;
    ImageList2: TImageList;
    frxReport1: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    Button2: TButton;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale;
    Label4: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonCodeBarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
FormListeFactures: TFormListeFactures;
x:integer;
implementation
{$R *.dfm}
uses UnitVenteComptoir, UnitPaiementCredit,unit36;
//___________________________________________________________________________________



//____________________________________________________________________________________
function rechstock():boolean;
begin
  with FormListeFactures do
  begin
     DataModule1.FD34QueryStockRetourne.Params.ParamValues['x']:=DataModule1.FD34Querydetail.FieldValues['id'];
     DataModule1.FD34QueryStockRetourne.Params.ParamValues['y']:=DataModule1.FD34Querydetail.FieldValues['code'];
     DataModule1.FD34QueryStockRetourne.Params.ParamValues['z']:=DataModule1.FD34Querydetail.FieldValues['numstock'];
     DataModule1.FD34QueryStockRetourne.Params.ParamValues['q']:=DataModule1.FD34Querydetail.FieldValues['quantite'];
     DataModule1.FD34QueryStockRetourne.Active:=false;
     DataModule1.FD34QueryStockRetourne.Active:=true;
     if DataModule1.FD34QueryStockRetourne.RecordCount>0 then
     result:=true
     else result:=false;
  end;
end;
//____________________________________________________________________________________
procedure retournproduit();
begin
with FormListeFactures do
begin
DataModule1.FD34QueryStockRetourne.Edit;
x:=DataModule1.FD34QueryStockRetourne.FieldValues['quantite'];
DataModule1.FD34QueryStockRetourne.FieldValues['quantite']:=x-DataModule1.FD34Querydetail.FieldValues['quantite'];
DataModule1.FD34QueryStockRetourne.Post;
x:=DataModule1.FD34Querydetail.FieldValues['quantite'];
DataModule1.FD34TableRetourneFac.Insert;
DataModule1.FD34TableRetourneFac.FieldValues['annee']:=DataModule1.FD34Querydetail.FieldValues['annee'];
DataModule1.FD34TableRetourneFac.FieldValues['num']:=DataModule1.FD34Querydetail.FieldValues['num'];
DataModule1.FD34TableRetourneFac.FieldValues['DateRet']:=date;
DataModule1.FD34TableRetourneFac.FieldValues['id']:=DataModule1.FD34Querydetail.FieldValues['id'];
DataModule1.FD34TableRetourneFac.FieldValues['Code']:=DataModule1.FD34Querydetail.FieldValues['Code'];
DataModule1.FD34TableRetourneFac.FieldValues['Quantite']:=DataModule1.FD34Querydetail.FieldValues['Quantite'];
DataModule1.FD34TableRetourneFac.FieldValues['NumStock']:=DataModule1.FD34Querydetail.FieldValues['NumStock'];
DataModule1.FD34TableRetourneFac.Next;
DataModule1.FD34Querydetail.Edit;
DataModule1.FD34Querydetail.FieldValues['quantite']:=0;
DataModule1.FD34Querydetail.Post;
//  Retourne au stock
DataModule1.FD34QueryStockRetourne.Params.ParamValues['x']:=DataModule1.FD34Querydetail.FieldValues['id'];
DataModule1.FD34QueryStockRetourne.Params.ParamValues['y']:=DataModule1.FD34Querydetail.FieldValues['code'];
DataModule1.FD34QueryStockRetourne.Params.ParamValues['z']:=DataModule1.FD34QueryFacPaie.FieldValues['numSource'];
DataModule1.FD34QueryStockRetourne.Params.ParamValues['q']:=DataModule1.FD34Querydetail.FieldValues['quantite'];
DataModule1.FD34QueryStockRetourne.Active:=false;
DataModule1.FD34QueryStockRetourne.Active:=true;
DataModule1.FD34QueryStockRetourne.Edit;
x:=x+DataModule1.FD34QueryStockRetourne.FieldValues['quantite'];
DataModule1.FD34QueryStockRetourne.FieldValues['quantite']:=x;
DataModule1.FD34QueryStockRetourne.Post;
end;
end;

//____________________________________________________________________________________
procedure TFormListeFactures.Button1Click(Sender: TObject);
begin
if DataModule1.FD34Querydetail.RecordCount>0 then
if MessageDlg('هل تريد فعلا حذف هذه السلعة من المخزن',mtConfirmation,mbYesNo,0)=mrYes then
begin
   begin
     if DataModule1.FD34Querydetail.FieldValues['quantite']>0 then
        begin
          if rechstock() then
             begin
               retournproduit();
               showmessage('     لقد تمت عملية إرجاع الفاتورة بنجاح     ');
             end else showmessage('       لا يمكنك حذف هذه السلعة فقد تم بيع جزء منها     ');
        end
   end
end
else showmessage('     السلعة غير موجودة     ');
end;
//____________________________________________________________________________________
procedure TFormListeFactures.Button2Click(Sender: TObject);
begin
if DataModule1.FD34QueryFacPaie.RecordCount>0 then
   frxReport1.ShowReport(true);

end;

procedure TFormListeFactures.Button3Click(Sender: TObject);
begin
if DataModule1.FD34QueryFacPaie.RecordCount>0 then
begin
FormPaiementCredit.show;
FormPaiementCredit.fenetre:=34;
FormPaiementCredit.EditSom.Text:=DataModule1.FD34QueryFacPaie.FieldValues['total'];
FormPaiementCredit.editrest.text:=DataModule1.FD34QueryFacPaie.FieldValues['reste'];
FormPaiementCredit.EditPaie.Text:=inttostr(strtoint(FormPaiementCredit.EditSom.Text)-
strtoint(FormPaiementCredit.Editrest.Text));
end;
end;
//____________________________________________________________________________________
procedure TFormListeFactures.ButtonCodeBarClick(Sender: TObject);
var b:boolean;
begin
if DataModule1.FD34QueryFacPaie.RecordCount>0 then
begin
b:=false;
if MessageDlg('هل تريد فعلا حذف هذه السلعة من المخزن',mtConfirmation,mbYesNo,0)=mrYes then
if DataModule1.FD34Querydetail.RecordCount>0 then
begin
DataModule1.FD34Querydetail.First;
while not DataModule1.FD34Querydetail.Eof do
begin
  if rechstock() then
     b:=true
   else b:=false;
DataModule1.FD34Querydetail.Next;
end;
if b then
   begin
      DataModule1.FD34Querydetail.First;
       while not DataModule1.FD34Querydetail.Eof do
          begin
              rechstock();
              retournproduit();
              DataModule1.FD34Querydetail.Next;
           end;
      showmessage('     لقد تمت عملية إرجاع الفاتورة بنجاح     ');
   end
else showmessage('     لا يمكنك حذف الفاتورة فقد تم بيع جزء منها     ');
end;
end;
end;
//____________________________________________________________________________________
procedure TFormListeFactures.ComboBox1Change(Sender: TObject);
begin
    if ComboBox1.Text=ComboBox1.Items[0] then
    begin
      DataModule1.FD34QueryFacPaie.Params.ParamValues['x']:=1;
      Button3.Enabled:=true;
    end
    else
    begin
      DataModule1.FD34QueryFacPaie.Params.ParamValues['x']:=2;
      Button3.Enabled:=false;
    end;
    DataModule1.FD34QueryFacPaie.Close;
    DataModule1.FD34QueryFacPaie.Open;
    dataModule1.FD34QueryFacPaieAfterScroll(DataModule1.FD34QueryFacPaie);
end;
//____________________________________________________________________________________
procedure TFormListeFactures.FormShow(Sender: TObject);
begin
ComboBox1.Text:=ComboBox1.Items[0];
ComboBox1Change(FormListeFactures);
end;
end.
