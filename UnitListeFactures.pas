unit UnitListeFactures;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, System.ImageList, Vcl.ImgList, frxClass, frxDBSet,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, cxClasses, dxGaugeCustomScale, dxGaugeDigitalScale,
  dxGaugeControl, Vcl.Menus, cxImageList, cxButtons;

type
  TFormListeFactures = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    DBGrid1: TDBGrid;
    GridPanel3: TGridPanel;
    DBNavigator1: TDBNavigator;
    ButtonPaiment: TButton;
    ButtonAnnulerFacture: TButton;
    GridPanel5: TGridPanel;
    SearchBox1: TSearchBox;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    ComboBox1: TComboBox;
    Label1: TLabel;
    DataSourceFacturePayee: TDataSource;
    GridPanel4: TGridPanel;
    DBGrid2: TDBGrid;
    DataSourceFactureEntrante: TDataSource;
    GridPanel6: TGridPanel;
    GridPanel8: TGridPanel;
    DBNavigator2: TDBNavigator;
    ButtonAnnulerProd: TButton;
    ImageList2: TImageList;
    frxReport1: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    Button2: TButton;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale;
    Label4: TLabel;
    cxButtonCosulter: TcxButton;
    cxImageList1: TcxImageList;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonPaimentClick(Sender: TObject);
    procedure ButtonAnnulerFactureClick(Sender: TObject);
    procedure ButtonAnnulerProdClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cxButtonCosulterClick(Sender: TObject);
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
uses UnitVenteComptoir, UnitPaiementCredit,DataFacturationUnite,
  UnitFacturation, DataStocksUnite;
//____________________________________________________________________________________
function rechstock():boolean;
begin
  with FormListeFactures do
  begin
     DataStocks.FDQueryRechercheProdStock.Params.ParamValues['x']:=DataFacturation.FDQueryFactureEntrante.FieldValues['id'];
     DataStocks.FDQueryRechercheProdStock.Params.ParamValues['y']:=DataFacturation.FDQueryFactureEntrante.FieldValues['code'];
     DataStocks.FDQueryRechercheProdStock.Params.ParamValues['z']:=DataFacturation.FDQueryFacturePayee.FieldValues['NumDestination'];
     DataStocks.FDQueryRechercheProdStock.Params.ParamValues['q']:=DataFacturation.FDQueryFactureEntrante.FieldValues['quantite'];
     DataStocks.FDQueryRechercheProdStock.Active:=false;
     DataStocks.FDQueryRechercheProdStock.Active:=true;
     if DataStocks.FDQueryRechercheProdStock.RecordCount>0 then
     result:=true
     else result:=false;
  end;
end;
//____________________________________________________________________________________
procedure retournproduit();
begin
      with FormListeFactures do
      begin
      DataStocks.FDQueryRechercheProdStock.Edit;
      x:=DataStocks.FDQueryRechercheProdStock.FieldValues['quantite'];
      DataStocks.FDQueryRechercheProdStock.FieldValues['quantite']:=x-DataFacturation.FDQueryFactureEntrante.FieldValues['quantite'];
      DataStocks.FDQueryRechercheProdStock.Post;
      x:=DataFacturation.FDQueryFactureEntrante.FieldValues['quantite'];
      DataFacturation.FDTableFacturesAnnulees.Insert;
      DataFacturation.FDTableFacturesAnnulees.FieldValues['annee']:=DataFacturation.FDQueryFactureEntrante.FieldValues['annee'];
      DataFacturation.FDTableFacturesAnnulees.FieldValues['num']:=DataFacturation.FDQueryFactureEntrante.FieldValues['num'];
      DataFacturation.FDTableFacturesAnnulees.FieldValues['DateRet']:=date;
      DataFacturation.FDTableFacturesAnnulees.FieldValues['id']:=DataFacturation.FDQueryFactureEntrante.FieldValues['id'];
      DataFacturation.FDTableFacturesAnnulees.FieldValues['Code']:=DataFacturation.FDQueryFactureEntrante.FieldValues['Code'];
      DataFacturation.FDTableFacturesAnnulees.FieldValues['Quantite']:=DataFacturation.FDQueryFactureEntrante.FieldValues['Quantite'];
      DataFacturation.FDTableFacturesAnnulees.FieldValues['NumStock']:=DataFacturation.FDQueryFacturePayee.FieldValues['NumDestination'];
      DataFacturation.FDTableFacturesAnnulees.Next;
      DataFacturation.FDQueryFactureEntrante.Edit;
      DataFacturation.FDQueryFactureEntrante.FieldValues['quantite']:=0;
      DataFacturation.FDQueryFactureEntrante.Post;
      //  Retourne au stock
      DataStocks.FDQueryRechercheProdStock.Params.ParamValues['x']:=DataFacturation.FDQueryFactureEntrante.FieldValues['id'];
      DataStocks.FDQueryRechercheProdStock.Params.ParamValues['y']:=DataFacturation.FDQueryFactureEntrante.FieldValues['code'];
      DataStocks.FDQueryRechercheProdStock.Params.ParamValues['z']:=DataFacturation.FDQueryFacturePayee.FieldValues['NumDestination'];
      DataStocks.FDQueryRechercheProdStock.Params.ParamValues['q']:=DataFacturation.FDQueryFactureEntrante.FieldValues['quantite'];
      DataStocks.FDQueryRechercheProdStock.Active:=false;
      DataStocks.FDQueryRechercheProdStock.Active:=true;
      DataStocks.FDQueryRechercheProdStock.Edit;
      x:=x+DataStocks.FDQueryRechercheProdStock.FieldValues['quantite'];
      DataStocks.FDQueryRechercheProdStock.FieldValues['quantite']:=x;
      DataStocks.FDQueryRechercheProdStock.Post;
      end;
end;

//____________________________________________________________________________________
procedure TFormListeFactures.ButtonAnnulerProdClick(Sender: TObject);
begin
      if DataFacturation.FDQueryFactureEntrante.RecordCount>0 then
        if MessageDlg('هل تريد فعلا حذف هذه السلعة من المخزن',mtConfirmation,mbYesNo,0)=mrYes then
        begin
           begin
             if DataFacturation.FDQueryFactureEntrante.FieldValues['quantite']>0 then
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
    if DataFacturation.FDQueryFacturePayee.RecordCount>0 then
       frxReport1.ShowReport(true);

end;

procedure TFormListeFactures.ButtonPaimentClick(Sender: TObject);
begin
    if DataFacturation.FDQueryFacturePayee.RecordCount>0 then
    begin
      FormPaiementCredit.show;
      FormPaiementCredit.fenetre:=34;
      FormPaiementCredit.EditSom.Text:=DataFacturation.FDQueryFacturePayee.FieldValues['total'];
      FormPaiementCredit.editrest.text:=DataFacturation.FDQueryFacturePayee.FieldValues['reste'];
      FormPaiementCredit.EditPaie.Text:=inttostr(strtoint(FormPaiementCredit.EditSom.Text)-
      strtoint(FormPaiementCredit.Editrest.Text));
    end;
end;
//____________________________________________________________________________________
procedure TFormListeFactures.ButtonAnnulerFactureClick(Sender: TObject);
var b:boolean;
begin
    if DataFacturation.FDQueryFacturePayee.RecordCount>0 then
        begin
            b:=false;
            if MessageDlg('هل تريد فعلا حذف هذه السلعة من المخزن',mtConfirmation,mbYesNo,0)=mrYes then
            if DataFacturation.FDQueryFactureEntrante.RecordCount>0 then
            begin
            DataFacturation.FDQueryFactureEntrante.First;
            while not DataFacturation.FDQueryFactureEntrante.Eof do
            begin
              if rechstock() then
                   b:=true
                 else b:=false;
              DataFacturation.FDQueryFactureEntrante.Next;
              end;
              if b then
                 begin
                    DataFacturation.FDQueryFactureEntrante.First;
                     while not DataFacturation.FDQueryFactureEntrante.Eof do
                        begin
                            rechstock();
                            retournproduit();
                            DataFacturation.FDQueryFactureEntrante.Next;
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
      DataFacturation.FDQueryFacturePayee.Params.ParamValues['x']:=1;
      ButtonPaiment.Enabled:=true;
    end
    else
    begin
      DataFacturation.FDQueryFacturePayee.Params.ParamValues['x']:=2;
      ButtonPaiment.Enabled:=false;
    end;
    DataFacturation.FDQueryFacturePayee.Close;
    DataFacturation.FDQueryFacturePayee.Open;
    if DataFacturation.FDQueryFacturePayee.RecordCount>0 then
    begin
      DataFacturation.FDQueryFactureEntrante.Params.ParamValues['x']:=DataFacturation.FDQueryFacturePayee.FieldValues['annee'];
      DataFacturation.FDQueryFactureEntrante.Params.ParamValues['y']:=DataFacturation.FDQueryFacturePayee.FieldValues['num'];
      DataFacturation.FDQueryFactureEntrante.Close;
      DataFacturation.FDQueryFactureEntrante.Open;
    end
    else
    begin
      DataFacturation.FDQueryFactureEntrante.Params.ParamValues['x']:=0;
      DataFacturation.FDQueryFactureEntrante.Params.ParamValues['y']:=0;
      DataFacturation.FDQueryFactureEntrante.Close;
      DataFacturation.FDQueryFactureEntrante.Open;
    end
end;


procedure TFormListeFactures.cxButtonCosulterClick(Sender: TObject);
Var Annee,NomDest:string;
    num:integer;
begin
    if not DataFacturation.FacturePayeeEstVide(Annee,NomDest,Num) then
       FormFacturation.RechercheFactureForm(Annee,NomDest,Num);
end;

//____________________________________________________________________________________
procedure TFormListeFactures.FormShow(Sender: TObject);
begin
    ComboBox1.Text:=ComboBox1.Items[0];
    ComboBox1Change(FormListeFactures);
end;
end.
