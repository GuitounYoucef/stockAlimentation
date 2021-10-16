unit Unit23;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart, VCLTee.TeeDBCrossTab, Data.DB, Data.Win.ADODB;

type
  TForm23 = class(TForm)
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    GridPanel2: TGridPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    ImageList1: TImageList;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditTotal: TEdit;
    EditMoyenJour: TEdit;
    Edit3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    EditBestDay: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    GridPanel3: TGridPanel;
    Chart1: TChart;
    Series1: TBarSeries;
    ADOQueryDate: TADOQuery;
    DBCrossTabSource1: TDBCrossTabSource;
    ADOQueryBestDay: TADOQuery;
    ADOQueryBestDayDat: TDateTimeField;
    ADOQueryBestDayRevenu: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form23: TForm23;

implementation

{$R *.dfm}

procedure TForm23.Button1Click(Sender: TObject);
var som:real;
begin
ADOQueryDate.Parameters.ParamValues['x']:=datetostr(DateTimePicker1.Date);
ADOQueryDate.Parameters.ParamValues['y']:=datetostr(DateTimePicker2.Date);
ADOQueryDate.Active:=false;
ADOQueryDate.Active:=true;
som:=0;
ADOQueryDate.First;
while not ADOQueryDate.Eof do
begin
  som:=som+(ADOQueryDate.FieldValues['Quantite']*(ADOQueryDate.FieldValues['PrixVente']-ADOQueryDate.FieldValues['PrixAchat']));
  ADOQueryDate.Next;
end;
EditTotal.Text:=floattostr(som)+' دج ';
EditMoyenJour.Text:=floattostr(som/(DateTimePicker2.Date-DateTimePicker1.Date))+' دج ';
//ADOQueryBestDay.Parameters.ParamValues['x']:=datetostr(DateTimePicker1.Date);
//ADOQueryBestDay.Parameters.ParamValues['y']:=datetostr(DateTimePicker2.Date);
ADOQueryBestDay.Active:=false;
ADOQueryBestDay.Active:=true;
if ADOQueryBestDay.RecordCount>0 then
EditBestDay.Text:=datetostr(ADOQueryBestDay.FieldValues['dat']);


end;

procedure TForm23.FormShow(Sender: TObject);
begin
PageControl1.TabWidth:=(PageControl1.Width div 5)-5;
end;

end.
