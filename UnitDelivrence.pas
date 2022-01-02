unit UnitDelivrence;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList,
  frxClass, frxDBSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxClasses,
  dxGaugeCustomScale, dxGaugeDigitalScale, dxGaugeControl;

type
  TFormDelivrence = class(TForm)
    ImageList1: TImageList;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    ImageList2: TImageList;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    DBGrid1: TDBGrid;
    GridPanel3: TGridPanel;
    DBNavigator1: TDBNavigator;
    Button3: TButton;
    GridPanel5: TGridPanel;
    SearchBox1: TSearchBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    GridPanel4: TGridPanel;
    DBGridListProd: TDBGrid;
    GridPanel6: TGridPanel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Button1: TButton;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale;
    GridPanel8: TGridPanel;
    dxGaugeControl2: TdxGaugeControl;
    dxGaugeDigitalScale1: TdxGaugeDigitalScale;
    Label2: TLabel;
    Label4: TLabel;
    procedure SearchBox1Change(Sender: TObject);
    procedure SearchBox1Enter(Sender: TObject);
    procedure SearchBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DataSource2UpdateData(Sender: TObject);
    procedure DataSource2StateChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }

  end;

var
  FormDelivrence: TFormDelivrence;
  typevente,typepaim:integer;

implementation

{$R *.dfm}

uses UnitVenteComptoir, UnitPaiementCredit, UnitDelivrenceData;


//------------------------------------------------------------------------------
procedure TFormDelivrence.Button1Click(Sender: TObject);
begin
    frxReport1.ShowReport(true);
end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.Button2Click(Sender: TObject);
begin
    if DataModuleDelivrence.FD12QueryImp.RecordCount>0 then
    frxReport1.ShowReport(true);
end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.Button3Click(Sender: TObject);
var crd:Credit;
begin
    if DataModuleDelivrence.FDQueryDelivrence.RecordCount>0 then
    if (DataModuleDelivrence.FDQueryListe.RecordCount>0) and(DataModuleDelivrence.FDQueryDelivrence.FieldValues['typepaim']=2 ) then
    begin
       crd:=DataModuleDelivrence.RecupererCredit(DataModuleDelivrence.FDQueryDelivrence.FieldValues['NumClient']);
       FormPaiementCredit.EditSom.Text:=floattostr(DataModuleDelivrence.SommeListProd());
       FormPaiementCredit.EditPaie.Text:=floattostr(crd.payee);
       FormPaiementCredit.fenetre:=12;
       FormPaiementCredit.show;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.ComboBox1Change(Sender: TObject);
begin
    DataModuleDelivrence.ChangerTypePaiement(ComboBox1.ItemIndex);
    dxGaugeDigitalScale1.Value:=FloatTostrF(DataModuleDelivrence.SommeParTypePaiment(ComboBox1.ItemIndex+1), ffFixed, 12, 2);
end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.ComboBox2Change(Sender: TObject);
begin
    DataModuleDelivrence.ChangerTypeVente(ComboBox2.ItemIndex);
    dxGaugeControl1DigitalScale1.Value:=FloatTostrF(DataModuleDelivrence.SommeListProd(), ffFixed, 12, 2);
 end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.DataSource2StateChange(Sender: TObject);
begin
    dxGaugeControl1DigitalScale1.Value:=FloatTostrF(DataModuleDelivrence.SommeListProd(), ffFixed, 12, 2);
end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.DataSource2UpdateData(Sender: TObject);
begin
    dxGaugeControl1DigitalScale1.Value:=FloatTostrF(DataModuleDelivrence.SommeListProd(), ffFixed, 12, 2);
end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.FormShow(Sender: TObject);
var x:real;
begin
    ComboBox1.ItemIndex:=3;
    ComboBox2.ItemIndex:=2;
    DataModuleDelivrence.ChangerTypeVente(2);
    DataModuleDelivrence.ChangerTypePaiement(3);
    dxGaugeControl1DigitalScale1.Value:=FloatTostrF(DataModuleDelivrence.SommeListProd(), ffFixed, 12, 2);
    x:=DataModuleDelivrence.SommeParTypePaiment(ComboBox1.ItemIndex+1);
    dxGaugeDigitalScale1.Value:=FloatTostrF(x, ffFixed, 12, 2);
    ComboBox1.ItemIndex
end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.SearchBox1Change(Sender: TObject);
var som:real;
begin

end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.SearchBox1Click(Sender: TObject);
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
end;
//------------------------------------------------------------------------------
procedure TFormDelivrence.SearchBox1Enter(Sender: TObject);
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
end;
//------------------------------------------------------------------------------
initialization;
typevente:=2;
typepaim:=2;

end.
