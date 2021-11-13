unit UnitLirePrix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxClasses,
  dxGaugeCustomScale, dxGaugeDigitalScale, dxGaugeControl, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFormLirePrix = class(TForm)
    GridPanel1: TGridPanel;
    Edit1: TEdit;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale;
    Label1: TLabel;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormLirePrix: TFormLirePrix;

implementation

{$R *.dfm}

uses DataStocksUnite,DataParametrageUnite;
//------------------------------------------------------------------------------
procedure TFormLirePrix.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_RETURN then
    begin
        DataStocks.FDQueryRechProdByIdCodeStock.Params.ParamValues['z']:=Edit1.Text;
        DataStocks.FDQueryRechProdByIdCodeStock.Params.ParamValues['q']:=1;
        DataStocks.FDQueryRechProdByIdCodeStock.Params.ParamValues['n']:=DataParametrage.FDTableParametrage['stocknum'];
        DataStocks.FDQueryRechProdByIdCodeStock.Active:=false;
        DataStocks.FDQueryRechProdByIdCodeStock.Active:=true;
        if DataStocks.FDQueryRechProdByIdCodeStock.RecordCount>0 then
        begin
        dxGaugeControl1DigitalScale1.Value:=DataStocks.FDQueryRechProdByIdCodeStock.FieldValues['prixvente'];
        label1.Caption:=DataStocks.FDQueryRechProdByIdCodeStock.FieldValues['id'];
        end
        else MessageDlg('السلعة المطلوبة غير متوفرة في المخزن'+' : '+DataParametrage.FDTableParametrage['stockid'], mtInformation, [mbOK], 0);
        Edit1.Clear;
    end
end;
//------------------------------------------------------------------------------
procedure TFormLirePrix.FormShow(Sender: TObject);
begin
    dxGaugeControl1DigitalScale1.Value.Empty;
    label1.Caption:='';
end;

end.
