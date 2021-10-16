unit UnitNotifications;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, frxClass, frxDBSet;

type
  TFormNotifications = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Image1: TImage;
    Image2: TImage;
    Panel3: TPanel;
    Button7: TButton;
    ImageList3: TImageList;
    Button1: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxReport2: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
  var   f:integer;
    { Déclarations publiques }
  end;

var
  FormNotifications: TFormNotifications;


implementation
uses unit36;

{$R *.dfm}

procedure TFormNotifications.Button1Click(Sender: TObject);
var myYear, myMonth, myDay : Word;
    num:integer;
    quantite:real;
begin
if DataModule1.FD18QueryExpire.RecordCount>0 then
begin
DecodeDate(Date, myYear, myMonth, myDay);
DataModule1.FD18QueryExpireRecordCount.Params.ParamValues['a']:=inttostr(myYear);
DataModule1.FD18QueryExpireRecordCount.Close;
DataModule1.FD18QueryExpireRecordCount.Open();
num:=DataModule1.FD18QueryExpireRecordCount.RecordCount+1;
quantite:=DataModule1.FD18QueryExpire.FieldValues['quantite'];
DataModule1.FD18QueryExpire.Edit;
DataModule1.FD18QueryExpire.FieldValues['quantite']:=0;
DataModule1.FD18QueryExpire.Post;
DataModule1.FDTableSortieExpire.Insert;
DataModule1.FDTableSortieExpire.FieldValues['Annee']:=inttostr(myYear);
DataModule1.FDTableSortieExpire.FieldValues['Num']:=num;
DataModule1.FDTableSortieExpire.FieldValues['Quantite']:=quantite;
DataModule1.FDTableSortieExpire.FieldValues['id']:=DataModule1.FD18QueryExpire.FieldValues['id'];
DataModule1.FDTableSortieExpire.FieldValues['code']:=DataModule1.FD18QueryExpire.FieldValues['id'];
DataModule1.FDTableSortieExpire.FieldValues['date']:=Date;
DataModule1.FDTableSortieExpire.FieldValues['Type']:=DataModule1.FD18QueryExpire.FieldValues['Type'];
DataModule1.FDTableSortieExpire.FieldValues['Producteur']:=DataModule1.FD18QueryExpire.FieldValues['Producteur'];
DataModule1.FDTableSortieExpire.FieldValues['PrixAchat']:=DataModule1.FD18QueryExpire.FieldValues['PrixAchat'];
DataModule1.FDTableSortieExpire.FieldValues['PrixVente']:=DataModule1.FD18QueryExpire.FieldValues['PrixVente'];
DataModule1.FDTableSortieExpire.FieldValues['Balance']:=DataModule1.FD18QueryExpire.FieldValues['Balance'];
DataModule1.FDTableSortieExpire.FieldValues['DateProd']:=DataModule1.FD18QueryExpire.FieldValues['DateProd'];
DataModule1.FDTableSortieExpire.FieldValues['DateConsm']:=DataModule1.FD18QueryExpire.FieldValues['DateConsm'];
DataModule1.FDTableSortieExpire.FieldValues['Numstock']:=DataModule1.FDTableParametrage.FieldValues['stocknum'];
DataModule1.FDTableSortieExpire.FieldValues['NumUser']:=DataModule1.FDQuery115.FieldValues['Numuser'];
DataModule1.FDTableSortieExpire.Post;
DataModule1.FD18QueryExpire.Close;
DataModule1.FD18QueryExpire.Open();
showmessage('    تم إخراج السلعة بنجاح    ');
end;
end;

procedure TFormNotifications.Button7Click(Sender: TObject);
begin
if f=1 then
frxReport2.ShowReport(true)
else
frxReport1.ShowReport(true)
end;

procedure TFormNotifications.FormShow(Sender: TObject);
var  Date1,date2: TDateTime;
begin

if f=1 then
begin
panel1.Caption:='      سلع في طور الإتلاف';
Button1.Enabled:=false;
image1.Visible:=true;
image2.Visible:=false;
DataModule1.FD18QueryAlert.Close;
DataModule1.FD18QueryAlert.Open();
DataSource1.DataSet:=DataModule1.FD18QueryAlert;
end
else
begin
panel1.Caption:='      سلع متلفة      ';
Button1.Enabled:=true;
image2.Visible:=true;
image1.Visible:=false;
DataModule1.FD18QueryExpire.Close;
DataModule1.FD18QueryExpire.Open();
DataSource1.DataSet:=DataModule1.FD18QueryExpire;
end
end;

end.
