unit UnitFrais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, dxGDIPlusClasses;

type
  TFormFrais = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditMantant: TEdit;
    EditRemarque: TEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    ImageList1: TImageList;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Image1: TImage;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormFrais: TFormFrais;

implementation
uses DataFraisUnit;

{$R *.dfm}



procedure TFormFrais.Button1Click(Sender: TObject);
begin
if (length(EditMantant.Text)>0) and (length(EditRemarque.Text)>0) then
begin
    DataFrais.NouneauFrais(strtofloat(EditMantant.Text),EditRemarque.Text);
    EditMantant.Clear;
    EditRemarque.Clear;
end;
end;

procedure TFormFrais.Button2Click(Sender: TObject);
begin
if DataFrais.FDTableFrais.RecordCount>0 then
   DBNavigator.BtnClick(nbDelete);

end;

procedure TFormFrais.FormShow(Sender: TObject);
begin
LoadKeyboardLayout('00000401', KLF_ACTIVATE);
end;

end.
