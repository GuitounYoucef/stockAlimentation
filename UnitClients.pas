unit UnitClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.Win.ADODB,
  Vcl.DBCtrls, System.ImageList, Vcl.ImgList, Vcl.WinXCtrls;

type
  TFormClients = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    EditNomPrenom: TEdit;
    Label3: TLabel;
    EditAdresse: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    EditTel: TEdit;
    Image1: TImage;
    Button2: TButton;
    ImageList1: TImageList;
    Panel6: TPanel;
    Label4: TLabel;
    SearchBox1: TSearchBox;
    Label5: TLabel;
    ComboBoxType: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormClients: TFormClients;

implementation
uses DataParametrageUnite;

{$R *.dfm}

procedure TFormClients.Button1Click(Sender: TObject);
begin
    if ((length(EditNomPrenom.Text)>0) and(length(EditAdresse.Text)>0) and(length(ComboBoxType.Text)>0)) then
    begin
      DataParametrage.FDQueryClientByName.Insert;
      DataParametrage.FDQueryClientByName.FieldValues['Client']:=EditNomPrenom.Text;
      DataParametrage.FDQueryClientByName.FieldValues['Adresse']:=EditAdresse.Text;
      DataParametrage.FDQueryClientByName.FieldValues['NumTel']:=EditTel.Text;
      DataParametrage.FDQueryClientByName.FieldValues['Type']:=ComboBoxType.Text;
      DataParametrage.FDQueryClientByName.FieldValues['catg']:=ComboBoxType.ItemIndex+1;
      EditTel.Clear;
      EditNomPrenom.Clear;
      EditAdresse.Clear;
      DataParametrage.FDQueryClientByName.Next;
    end;
end;

procedure TFormClients.Button2Click(Sender: TObject);
begin
    if (DataParametrage.FDQueryClientByName.RecordCount>0) and (DataParametrage.FDQueryClientByName.RecordCount=DataParametrage.FDQueryClientByName.RecNo) then
        DBNavigator1.BtnClick(nbdelete);
end;

procedure TFormClients.FormShow(Sender: TObject);
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
    DataParametrage.FDQueryClientByName.Params.ParamValues['x']:='%';
    DataParametrage.FDQueryClientByName.Active:=false;
    DataParametrage.FDQueryClientByName.Active:=true;
end;

procedure TFormClients.SearchBox1Change(Sender: TObject);
begin
    DataParametrage.FDQueryClientByName.Params.ParamValues['x']:='%'+SearchBox1.Text+'%';
    DataParametrage.FDQueryClientByName.Active:=false;
    DataParametrage.FDQueryClientByName.Active:=true;
end;

end.
