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
uses unit36;

{$R *.dfm}

procedure TFormClients.Button1Click(Sender: TObject);
begin
if ((length(EditNomPrenom.Text)>0) and(length(EditAdresse.Text)>0) and(length(ComboBoxType.Text)>0)) then
begin
DataModule1.FD2QueryClient.Insert;
DataModule1.FD2QueryClient.FieldValues['Client']:=EditNomPrenom.Text;
DataModule1.FD2QueryClient.FieldValues['Adresse']:=EditAdresse.Text;
DataModule1.FD2QueryClient.FieldValues['NumTel']:=EditTel.Text;
DataModule1.FD2QueryClient.FieldValues['Type']:=ComboBoxType.Text;
DataModule1.FD2QueryClient.FieldValues['catg']:=ComboBoxType.ItemIndex+1;
EditTel.Clear;
EditNomPrenom.Clear;
EditAdresse.Clear;
DataModule1.FD2QueryClient.Next;
end;
end;

procedure TFormClients.Button2Click(Sender: TObject);
begin
if (DataModule1.FD2QueryClient.RecordCount>0) and (DataModule1.FD2QueryClient.RecordCount=DataModule1.FD2QueryClient.RecNo) then
DBNavigator1.BtnClick(nbdelete);
end;

procedure TFormClients.FormShow(Sender: TObject);
begin
  LoadKeyboardLayout('00000401', KLF_ACTIVATE);
DataModule1.FD2QueryClient.Params.ParamValues['x']:='%';
DataModule1.FD2QueryClient.Active:=false;
DataModule1.FD2QueryClient.Active:=true;
end;

procedure TFormClients.SearchBox1Change(Sender: TObject);
begin
DataModule1.FD2QueryClient.Params.ParamValues['x']:='%'+SearchBox1.Text+'%';
DataModule1.FD2QueryClient.Active:=false;
DataModule1.FD2QueryClient.Active:=true;
end;

end.
