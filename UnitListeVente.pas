unit UnitListeVente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB;

type
  TFormListeVente = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    DBGrid1: TDBGrid;
    GridPanel3: TGridPanel;
    DBNavigator1: TDBNavigator;
    Button3: TButton;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    GridPanel4: TGridPanel;
    DBGrid2: TDBGrid;
    GridPanel5: TGridPanel;
    DBNavigator2: TDBNavigator;
    Button1: TButton;
    ImageList2: TImageList;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Edittotal: TEdit;
    procedure Button1Click(Sender: TObject);
    function retourneprodstock():boolean;
    procedure Button3Click(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;


var
  FormListeVente: TFormListeVente;

implementation
uses UnitVenteComptoir,unit36;
{$R *.dfm}

function TFormListeVente.retourneprodstock():boolean;
begin

//if DataModule1.FD35QueryDetailListe.RecordCount>0 then
//begin
//   DataModule1.FD35QueryStockRetourn.Params.ParamValues['x']:=DataModule1.FD35QueryDetailListe.FieldValues['id'];
//   DataModule1.FD35QueryStockRetourn.Params.ParamValues['y']:=DataModule1.FD35QueryDetailListe.FieldValues['code'];
//   DataModule1.FD35QueryStockRetourn.Params.ParamValues['z']:=DataModule1.FD35QueryDetailListe.FieldValues['numstock'];
//   DataModule1.FD35QueryStockRetourn.Active:=false;
//   DataModule1.FD35QueryStockRetourn.Active:=true;
//   if (DataModule1.FD35QueryStockRetourn.RecordCount>0) and (DataModule1.FD35QueryStockRetourn.FieldValues['Quantite']>0) then
//    begin
//      DataModule1.FD35QueryStockRetourn.Edit;
//      DataModule1.FD35QueryStockRetourn.FieldValues['Quantite']:=DataModule1.FD35QueryStockRetourn.FieldValues['Quantite']+DataModule1.FD35QueryDetailListe.FieldValues['Quantite'];
//      DataModule1.FD35QueryStockRetourn.Post;
//      DataModule1.FD35TableRetourndeliv.Insert;
//      DataModule1.FD35TableRetourndeliv.FieldValues['annee']:=DataModule1.FD35QueryDetailListe.FieldValues['annee'];
//      DataModule1.FD35TableRetourndeliv.FieldValues['num']:=DataModule1.FD35QueryDetailListe.FieldValues['num'];
//      DataModule1.FD35TableRetourndeliv.FieldValues['typevente']:=DataModule1.FD35QueryDetailListe.FieldValues['typevente'];
//      DataModule1.FD35TableRetourndeliv.FieldValues['Date']:=DataModule1.FD35QueryDetailListe.FieldValues['Date'];
//      DataModule1.FD35TableRetourndeliv.FieldValues['Client']:=DataModule1.FD35QueryDetailListe.FieldValues['Client'];
//      DataModule1.FD35TableRetourndeliv.FieldValues['id']:=DataModule1.FD35QueryDetailListe.FieldValues['id'];
//      DataModule1.FD35TableRetourndeliv.FieldValues['Code']:=DataModule1.FD35QueryDetailListe.FieldValues['Code'];
//      DataModule1.FD35TableRetourndeliv.FieldValues['Quantite']:=DataModule1.FD35QueryDetailListe.FieldValues['Quantite'];
//      DataModule1.FD35TableRetourndeliv.FieldValues['NumStock']:=DataModule1.FD35QueryDetailListe.FieldValues['NumStock'];
//      DataModule1.FD35TableRetourndeliv.Next;
//      DataModule1.FD35QueryDetailListe.Edit;
//      DataModule1.FD35QueryDetailListe.FieldValues['Quantite']:=0;
//     DataModule1.FD35QueryDetailListe.Post;
//
//      result:=true;
//    end else result:=false;
//end
//else result:=false;
end;

procedure TFormListeVente.Button1Click(Sender: TObject);
begin
if MessageDlg('هل تريد فعلا حذف إرجاع السلعة',mtConfirmation,mbYesNo,0)=mrYes then
begin
if retourneprodstock() then
 showmessage('       تمت عملية الإرجاع بنجاح        ');
end;
end;

procedure TFormListeVente.Button3Click(Sender: TObject);
var b:boolean;
begin
//b:=false;
//if DataModule1.FD35QueryDetailListe.RecordCount>0 then
//begin
//if MessageDlg('هل تريد فعلا حذف  عملية البيع',mtConfirmation,mbYesNo,0)=mrYes then
//begin
//DataModule1.FD35QueryDetailListe.First;
//while not DataModule1.FD35QueryDetailListe.Eof do
//begin
//   b:=retourneprodstock();
//   DataModule1.FD35QueryDetailListe.Next;
//end;
//end;
//if b then
// showmessage('         تم إلغاء عملية البيع           ');
//end;
end;

end.
