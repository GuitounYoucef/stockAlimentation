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

uses Unit36;

procedure TFormLirePrix.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then
begin
DataModule1.FDQueryCodebar1.Params.ParamValues['z']:=Edit1.Text;
DataModule1.FDQueryCodebar1.Params.ParamValues['q']:=1;
DataModule1.FDQueryCodebar1.Params.ParamValues['n']:=DataModule1.FDTableParametrage['stocknum'];
DataModule1.FDQueryCodebar1.Active:=false;
DataModule1.FDQueryCodebar1.Active:=true;
if DataModule1.FDQueryCodebar1.RecordCount>0 then
begin
dxGaugeControl1DigitalScale1.Value:=DataModule1.FDQueryCodebar1.FieldValues['prixvente'];
label1.Caption:=DataModule1.FDQueryCodebar1.FieldValues['id'];
end
else MessageDlg('السلعة المطلوبة غير متوفرة في المخزن'+' : '+DataModule1.FDTableParametrage['stockid'], mtInformation, [mbOK], 0);
Edit1.Clear;
end
end;

procedure TFormLirePrix.FormShow(Sender: TObject);
begin
dxGaugeControl1DigitalScale1.Value.Empty;
label1.Caption:='';
end;

end.
