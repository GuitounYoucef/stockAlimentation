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
uses  DataParametrageUnite, Unit36, DataStocksUnite;

{$R *.dfm}
//------------------------------------------------------------------------------
procedure TFormNotifications.Button1Click(Sender: TObject);
var myYear, myMonth, myDay : Word;
    num:integer;
    quantite:real;
begin
    if DataStocks.FDQueryExpire.RecordCount>0 then
    begin
      DecodeDate(Date, myYear, myMonth, myDay);
      DataStocks.FDQueryExpireRecordCount.Params.ParamValues['a']:=inttostr(myYear);
      DataStocks.FDQueryExpireRecordCount.Close;
      DataStocks.FDQueryExpireRecordCount.Open();
      num:=DataStocks.FDQueryExpireRecordCount.RecordCount+1;
      quantite:=DataStocks.FDQueryExpire.FieldValues['quantite'];
      DataStocks.FDQueryExpire.Edit;
      DataStocks.FDQueryExpire.FieldValues['quantite']:=0;
      DataStocks.FDQueryExpire.Post;
      DataParametrage.FDTableSortieExpire.Insert;
      DataParametrage.FDTableSortieExpire.FieldValues['Annee']:=inttostr(myYear);
      DataParametrage.FDTableSortieExpire.FieldValues['Num']:=num;
      DataParametrage.FDTableSortieExpire.FieldValues['Quantite']:=quantite;
      DataParametrage.FDTableSortieExpire.FieldValues['id']:=DataStocks.FDQueryExpire.FieldValues['id'];
      DataParametrage.FDTableSortieExpire.FieldValues['code']:=DataStocks.FDQueryExpire.FieldValues['id'];
      DataParametrage.FDTableSortieExpire.FieldValues['date']:=Date;
      DataParametrage.FDTableSortieExpire.FieldValues['Type']:=DataStocks.FDQueryExpire.FieldValues['Type'];
      DataParametrage.FDTableSortieExpire.FieldValues['Producteur']:=DataStocks.FDQueryExpire.FieldValues['Producteur'];
      DataParametrage.FDTableSortieExpire.FieldValues['PrixAchat']:=DataStocks.FDQueryExpire.FieldValues['PrixAchat'];
      DataParametrage.FDTableSortieExpire.FieldValues['PrixVente']:=DataStocks.FDQueryExpire.FieldValues['PrixVente'];
      DataParametrage.FDTableSortieExpire.FieldValues['Balance']:=DataStocks.FDQueryExpire.FieldValues['Balance'];
      DataParametrage.FDTableSortieExpire.FieldValues['DateProd']:=DataStocks.FDQueryExpire.FieldValues['DateProd'];
      DataParametrage.FDTableSortieExpire.FieldValues['DateConsm']:=DataStocks.FDQueryExpire.FieldValues['DateConsm'];
      DataParametrage.FDTableSortieExpire.FieldValues['Numstock']:=DataParametrage.FDTableParametrage.FieldValues['stocknum'];
      DataParametrage.FDTableSortieExpire.FieldValues['NumUser']:=DataParametrage.FDQueryLoginUser.FieldValues['Numuser'];
      DataParametrage.FDTableSortieExpire.Post;
      DataStocks.FDQueryExpire.Close;
      DataStocks.FDQueryExpire.Open();
      showmessage('    تم إخراج السلعة بنجاح    ');
    end;
end;
//------------------------------------------------------------------------------
procedure TFormNotifications.Button7Click(Sender: TObject);
begin
    if f=1 then
    frxReport2.ShowReport(true)
    else
    frxReport1.ShowReport(true)
end;
//------------------------------------------------------------------------------
procedure TFormNotifications.FormShow(Sender: TObject);
var  Date1,date2: TDateTime;
begin
    if f=1 then
    begin
      panel1.Caption:='      سلع في طور الإتلاف';
      Button1.Enabled:=false;
      image1.Visible:=true;
      image2.Visible:=false;
      DataStocks.FDQueryAlert.Close;
      DataStocks.FDQueryAlert.Open();
      DataSource1.DataSet:=DataStocks.FDQueryAlert;
    end
    else
    begin
      panel1.Caption:='      سلع متلفة      ';
      Button1.Enabled:=true;
      image2.Visible:=true;
      image1.Visible:=false;
      DataStocks.FDQueryExpire.Close;
      DataStocks.FDQueryExpire.Open();
      DataSource1.DataSet:=DataStocks.FDQueryExpire;
    end
end;

end.
