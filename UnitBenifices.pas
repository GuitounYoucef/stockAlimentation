unit UnitBenifices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.pngimage, dxGDIPlusClasses, Vcl.Grids, Vcl.DBGrids, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, cxClasses, dxGaugeCustomScale, dxGaugeDigitalScale,
  dxGaugeControl, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, cxDBData, dxLayoutContainer, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, dxSkinsForm, cxImageList, cxLabel,
  dxBarBuiltInMenu, cxPC, dxLayoutLookAndFeels;

type
  TFormBenifices = class(TForm)
    GridPanel2: TGridPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ButtonRecherche: TButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Group_Root1: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutItem1: TdxLayoutItem;
    dxGaugeControl3: TdxGaugeControl;
    dxLayoutItem2: TdxLayoutItem;
    dxGaugeControl4: TdxGaugeControl;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxGaugeControl3DigitalScale1: TdxGaugeDigitalScale;
    dxGaugeControl4DigitalScale1: TdxGaugeDigitalScale;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    dxLayoutItem5: TdxLayoutItem;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    dxLayoutItem7: TdxLayoutItem;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    Image2: TImage;
    Image3: TImage;
    DataSource2: TDataSource;
    cxGrid2DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1Column2: TcxGridDBColumn;
    cxGrid2DBTableView1Column3: TcxGridDBColumn;
    DataSource3: TDataSource;
    cxGrid3DBTableView1Column1: TcxGridDBColumn;
    cxGrid3DBTableView1Column2: TcxGridDBColumn;
    cxGrid3DBTableView1Column3: TcxGridDBColumn;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    DBGrid1: TDBGrid;
    dxLayoutItem6: TdxLayoutItem;
    DataSourceFrais: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    procedure ButtonRechercheClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxLayoutControl1Group_Root1TabChanging(Sender: TObject;
      ANewTabIndex: Integer; var Allow: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormBenifices: TFormBenifices;

implementation
uses  UnitDelivrenceData;

{$R *.dfm}

procedure TFormBenifices.ButtonRechercheClick(Sender: TObject);
var frais,ventes,achats,revenu:real;
 begin
    achats:=0;
    ventes:=0;
    revenu:=0;
    frais:=0;
    DataModuleDelivrence.CalculerRevenu(frais,ventes,achats,datetostr(DateTimePicker1.Date),datetostr(DateTimePicker2.Date));
    revenu:=ventes-achats-frais;
    dxGaugeControl4DigitalScale1.Value:=FloatTostrF(revenu,ffFixed,12,2);
    dxGaugeControl3DigitalScale1.Value:=FloatTostrF(ventes,ffFixed,12,2);
end;

procedure TFormBenifices.dxLayoutControl1Group_Root1TabChanging(Sender: TObject;
  ANewTabIndex: Integer; var Allow: Boolean);
begin
case ANewTabIndex of
0:begin
   Image2.Visible:=true;
   Image1.Visible:=false;
   Image3.Visible:=false;
   panel1.Caption:='الأربــاح   ';
  end;
1:begin
   Image2.Visible:=false;
   Image1.Visible:=true;
   Image3.Visible:=false;
   panel1.Caption:='السلــع   ';
  end;
2:begin
   Image2.Visible:=false;
   Image1.Visible:=false;
   Image3.Visible:=true;
   panel1.Caption:='مردود المستخدمين   ';
  end;
end;

end;

procedure TFormBenifices.FormShow(Sender: TObject);
begin
DateTimePicker1.Date:=date;
DateTimePicker2.Date:=date;
ButtonRechercheClick(FormBenifices);
end;

end.
