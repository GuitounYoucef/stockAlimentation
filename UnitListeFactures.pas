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
    ImageList2: TImageList;
    frxReportFacture: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale;
    Label4: TLabel;
    cxButtonCosulter: TcxButton;
    cxImageList1: TcxImageList;
    cxButtonImprimer: TcxButton;
    cxButtonPaiment: TcxButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonPaimentClick(Sender: TObject);
    procedure cxButtonCosulterClick(Sender: TObject);
    procedure cxButtonImprimerClick(Sender: TObject);
    procedure cxButtonPaimentClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
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
  UnitFacturation, DataStocksUnite,DataParametrageUnite;
//____________________________________________________________________________________
procedure TFormListeFactures.ButtonPaimentClick(Sender: TObject);
begin

end;


//____________________________________________________________________________________
procedure TFormListeFactures.ComboBox1Change(Sender: TObject);
begin
    if ComboBox1.Text=ComboBox1.Items[0] then
    begin
      DataFacturation.FDQueryListeFactures.Params.ParamValues['x']:=2;
      cxButtonPaiment.Enabled:=true;
    end
    else
    begin
      DataFacturation.FDQueryListeFactures.Params.ParamValues['x']:=1;
      cxButtonPaiment.Enabled:=false;
    end;
    DataFacturation.FDQueryListeFactures.Close;
    DataFacturation.FDQueryListeFactures.Open;
    if DataFacturation.FDQueryListeFactures.RecordCount>0 then
    begin
      DataFacturation.FDQueryFactureRecords.Params.ParamValues['x']:=DataFacturation.FDQueryListeFactures.FieldValues['annee'];
      DataFacturation.FDQueryFactureRecords.Params.ParamValues['y']:=DataFacturation.FDQueryListeFactures.FieldValues['num'];
      DataFacturation.FDQueryFactureRecords.Close;
      DataFacturation.FDQueryFactureRecords.Open;
    end
    else
    begin
      DataFacturation.FDQueryFactureRecords.Params.ParamValues['x']:=0;
      DataFacturation.FDQueryFactureRecords.Params.ParamValues['y']:=0;
      DataFacturation.FDQueryFactureRecords.Close;
      DataFacturation.FDQueryFactureRecords.Open;
    end
end;


procedure TFormListeFactures.cxButtonImprimerClick(Sender: TObject);
begin
    if DataFacturation.FDQueryListeFactures.RecordCount>0 then
       frxReportFacture.ShowReport(true);
end;

procedure TFormListeFactures.cxButtonPaimentClick(Sender: TObject);
begin
    if DataFacturation.FDQueryListeFactures.RecordCount>0 then
    begin
      FormPaiementCredit.show;
      FormPaiementCredit.fenetre:=34;
      FormPaiementCredit.EditSom.Text:=DataFacturation.FDQueryListeFactures.FieldValues['total'];
      FormPaiementCredit.editrest.text:=DataFacturation.FDQueryListeFactures.FieldValues['reste'];
      FormPaiementCredit.EditPaie.Text:=inttostr(strtoint(FormPaiementCredit.EditSom.Text)-
      strtoint(FormPaiementCredit.Editrest.Text));
    end;
end;

procedure TFormListeFactures.DBGrid1CellClick(Column: TColumn);
begin
dxGaugeControl1DigitalScale1.Value:=floattostr(DataFacturation.calculerSomFacture());
end;

procedure TFormListeFactures.cxButtonCosulterClick(Sender: TObject);
Var Annee,NomDest:string;
    num:integer;
begin
    if not DataFacturation.ListeFactureEstVide(Annee,NomDest,Num) then
       FormFacturation.RechercheFactureForm(Annee,Num);
end;

//____________________________________________________________________________________
procedure TFormListeFactures.FormShow(Sender: TObject);
begin
    ComboBox1.Text:=ComboBox1.Items[0];
    ComboBox1Change(FormListeFactures);
end;
end.
