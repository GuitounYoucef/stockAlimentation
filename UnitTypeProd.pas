unit UnitTypeProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB,
  Vcl.DBCtrls, System.ImageList, Vcl.ImgList;

type
  TFormTypeProd = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Button3: TButton;
    Button5: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    ImageList1: TImageList;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormTypeProd: TFormTypeProd;

implementation

{$R *.dfm}
uses DataParametrageUnite;
//------------------------------------------------------------------------------
procedure TFormTypeProd.Button1Click(Sender: TObject);
begin
    if (length(Edit2.Text)>0) and (DataParametrage.FDQueryType.RecordCount>0) then
    begin
      DataParametrage.FDQueryProducteur.Insert;
      DataParametrage.FDQueryProducteur.FieldValues['Type']:=DataParametrage.FDQueryType.FieldValues['type'];
      DataParametrage.FDQueryProducteur.FieldValues['producteur']:=Edit2.Text;
      DataParametrage.FDQueryProducteur.Next;
      Edit2.Clear;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormTypeProd.Button2Click(Sender: TObject);
begin
    if DataParametrage.FDQueryProducteur.RecordCount>0 then
       DBNavigator2.BtnClick(nbdelete);
end;
//------------------------------------------------------------------------------
procedure TFormTypeProd.Button3Click(Sender: TObject);
begin
    if length(Edit1.Text)>0 then
    begin
        DataParametrage.FDQueryType.Insert;
        DataParametrage.FDQueryType.FieldValues['Type']:=Edit1.Text;
        DataParametrage.FDQueryType.Post;

        Edit1.Clear;
        if (DataParametrage.FDQueryType.RecordCount>0) then
            DataParametrage.FDQueryProducteur.Params.ParamValues['x']:=DataParametrage.FDQueryType.FieldValues['Type']
        else
        DataParametrage.FDQueryProducteur.Params.ParamValues['x']:='';
        DataParametrage.FDQueryProducteur.Active:=false;
        DataParametrage.FDQueryProducteur.Active:=true;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormTypeProd.Button5Click(Sender: TObject);
begin
    if DataParametrage.FDQueryType.RecordCount>0 then
    begin
    DBNavigator1.BtnClick(nbdelete);
    end;
end;
//------------------------------------------------------------------------------
procedure TFormTypeProd.DBGrid2CellClick(Column: TColumn);
begin
    if (DataParametrage.FDQueryType.RecordCount>0) then
        DataParametrage.FDQueryProducteur.Params.ParamValues['x']:=DataParametrage.FDQueryType.FieldValues['Type']
    else
    DataParametrage.FDQueryProducteur.Params.ParamValues['x']:='';
    DataParametrage.FDQueryProducteur.Active:=false;
    DataParametrage.FDQueryProducteur.Active:=true;
end;
//------------------------------------------------------------------------------
procedure TFormTypeProd.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_RETURN then
    begin
      Button3Click(Edit1);
    end;
end;
//------------------------------------------------------------------------------
procedure TFormTypeProd.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_RETURN then
    begin
      Button1Click(Edit2);
    end;
end;
//------------------------------------------------------------------------------
procedure TFormTypeProd.FormShow(Sender: TObject);
begin
    LoadKeyboardLayout('00000401', KLF_ACTIVATE);
    if (DataParametrage.FDQueryType.RecordCount>0) then
       DataParametrage.FDQueryProducteur.Params.ParamValues['x']:=DataParametrage.FDQueryType.FieldValues['Type']
    else
    DataParametrage.FDQueryProducteur.Params.ParamValues['x']:='';
    DataParametrage.FDQueryProducteur.Active:=false;
    DataParametrage.FDQueryProducteur.Active:=true;
end;

end.
