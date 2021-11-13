unit UnitFournisseurs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Data.Win.ADODB, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList, Vcl.WinXCtrls;

type
  TFormFournisseurs = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    Panel6: TPanel;
    Label4: TLabel;
    SearchBox1: TSearchBox;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    EditNomPrenom: TEdit;
    EditAdresse: TEdit;
    Button1: TButton;
    EditTel: TEdit;
    Button2: TButton;
    Editwilaya: TEdit;
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
  FormFournisseurs: TFormFournisseurs;

implementation
uses  DataParametrageUnite;

{$R *.dfm}
//------------------------------------------------------------------------------
procedure TFormFournisseurs.Button1Click(Sender: TObject);
begin
    if ((length(EditNomPrenom.Text)>0) and(length(EditAdresse.Text)>0) and(length(Editwilaya.Text)>0)) then
    begin
      DataParametrage.FDQueryFounisseurByName.Insert;
      DataParametrage.FDQueryFounisseurByName.FieldValues['NomPrenom']:=EditNomPrenom.Text;
      DataParametrage.FDQueryFounisseurByName.FieldValues['Adresse']:=EditAdresse.Text;
      DataParametrage.FDQueryFounisseurByName.FieldValues['NumTel']:=EditTel.Text;
      DataParametrage.FDQueryFounisseurByName.FieldValues['wilaya']:=Editwilaya.Text;
      EditTel.Clear;
      EditNomPrenom.Clear;
      EditAdresse.Clear;
      Editwilaya.Clear;
      DataParametrage.FDQueryFounisseurByName.Next;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormFournisseurs.Button2Click(Sender: TObject);
begin
    if (DataParametrage.FDQueryFounisseurByName.RecordCount>0) and (DataParametrage.FDQueryFounisseurByName.RecordCount=DataParametrage.FDQueryFounisseurByName.RecNo) then
    DBNavigator1.BtnClick(nbdelete);
end;
//------------------------------------------------------------------------------
procedure TFormFournisseurs.FormShow(Sender: TObject);
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
    DataParametrage.FDQueryFounisseurByName.Params.ParamValues['x']:='%';
    DataParametrage.FDQueryFounisseurByName.Active:=false;
    DataParametrage.FDQueryFounisseurByName.Active:=true;
end;
//------------------------------------------------------------------------------
procedure TFormFournisseurs.SearchBox1Change(Sender: TObject);
begin
    DataParametrage.FDQueryFounisseurByName.Params.ParamValues['x']:='%'+SearchBox1.Text+'%';
    DataParametrage.FDQueryFounisseurByName.Active:=false;
    DataParametrage.FDQueryFounisseurByName.Active:=true;
end;

end.
