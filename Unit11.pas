unit Unit11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.WinXCtrls,
  System.ImageList, Vcl.ImgList;

type
  TForm11 = class(TForm)
    Panel1: TPanel;
    ADOQueryFacReste: TADOQuery;
    DataSource1: TDataSource;
    ADOQueryProdReste: TADOQuery;
    Image1: TImage;
    GridPanel4: TGridPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    GridPanel2: TGridPanel;
    DataSource2: TDataSource;
    ADOQueryFacPaie: TADOQuery;
    DataSourcereste1: TDataSource;
    ADOQueryProdPaie: TADOQuery;
    DataSource3: TDataSource;
    ADOQuerystock: TADOQuery;
    ImageList1: TImageList;
    ADOQueryFacture: TADOQuery;
    ADOTableImprimante: TADOTable;
    Edit1: TEdit;
    Panel2: TPanel;
    Label10: TLabel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Button4: TButton;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    DBNavigator1: TDBNavigator;
    Button5: TButton;
    Edittotal: TEdit;
    ADOQueryFacNoPaie: TADOQuery;
    ComboBoxEtat: TComboBox;
    Label1: TLabel;
    ADOTable1: TADOTable;
    procedure Button2Click(Sender: TObject);
    procedure ADOQueryFacResteAfterScroll(DataSet: TDataSet);
    procedure ADOQueryFacPaieAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

uses Unit20,Unit1;

procedure TForm11.ADOQueryFacResteAfterScroll(DataSet: TDataSet);
var som:real;
begin
if ADOQueryFacReste.RecordCount>0 then
begin
ADOQueryProdReste.Parameters.ParamValues['x']:=ADOQueryFacReste.FieldValues['annee'];
ADOQueryProdReste.Parameters.ParamValues['y']:=ADOQueryFacReste.FieldValues['num'];
ADOQueryProdReste.Active:=false;
ADOQueryProdReste.Active:=true;
ADOQueryFacReste.First;
   while not ADOQueryFacReste.Eof do
   begin
     som:=som+ADOQueryFacReste.FieldValues['reste'];
     ADOQueryFacReste.Next;
   end;
  Edittotal.Text:=floattostr(som)+' دج ';
end;
end;

procedure TForm11.ADOQueryFacPaieAfterScroll(DataSet: TDataSet);
begin
if ADOQueryFacPaie.RecordCount>0 then
begin
ADOQueryProdPaie.Parameters.ParamValues['x']:=ADOQueryFacPaie.FieldValues['annee'];
ADOQueryProdPaie.Parameters.ParamValues['y']:=ADOQueryFacPaie.FieldValues['num'];
ADOQueryProdPaie.Active:=false;
ADOQueryProdPaie.Active:=true;
end;
end;

procedure TForm11.Button1Click(Sender: TObject);
var i:integer;
begin
ADOQuerystock.Parameters.ParamValues['x']:=ADOQueryProdReste.FieldValues['code'];
ADOQuerystock.Parameters.ParamValues['y']:=ADOQueryProdReste.FieldValues['PrixAchat'];
ADOQuerystock.Parameters.ParamValues['z']:=ADOQueryProdReste.FieldValues['PrixVente'];
ADOQuerystock.Parameters.ParamValues['t']:=ADOQueryProdReste.FieldValues['PrixVenteGros'];
ADOQuerystock.Active:=false;
ADOQuerystock.Active:=true;
if ADOQuerystock.RecordCount>0 then
if ADOQuerystock.FieldValues['Quantite']=ADOQueryProdReste.FieldValues['Quantite'] then
begin
i:=ADOQueryProdReste.RecordCount;
DBNavigator1.BtnClick(nbdelete);
if ADOQueryProdReste.RecordCount<i then
begin
ADOQuerystock.Delete;
ADOQuerystock.Next;
end;
end
else MessageDlg('لا يمكنك حذف  مخزون هذه السلعة من الفاتورة. فقد تم بيع جزء من هذا المخزون', mtInformation, [mbOK], 0);

end;

procedure TForm11.Button2Click(Sender: TObject);
begin
if ADOQueryFacReste.RecordCount>0 then
begin
ADOQueryFacture.Parameters.ParamValues['x']:=ADOQueryFacReste.FieldValues['annee'];
ADOQueryFacture.Parameters.ParamValues['y']:=ADOQueryFacReste.FieldValues['num'];
ADOQueryFacture.Active:=false;
ADOQueryFacture.Active:=true;
form20.show;
form20.fenetre:=11;
form20.EditSom.Text:=inttostr(trunc(ADOQueryFacture.FieldValues['total']));
form20.editrest.Text:=inttostr(trunc(ADOQueryFacture.FieldValues['reste']));

end;

end;

procedure TForm11.FormShow(Sender: TObject);
begin
ComboBoxEtat.Text:=ComboBoxEtat.Items[0];
end;

end.
