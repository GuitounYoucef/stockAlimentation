unit UnitConnexion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, FireDAC.Phys.MSAccDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, dxSkinsCore,
  dxSkinsDefaultPainters, cxClasses, cxLookAndFeels, dxSkinsForm,
  dxGDIPlusClasses, System.ImageList, Vcl.ImgList;

type
  TFormConnexion = class(TForm)
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button1: TButton;
    Image1: TImage;
    Label4: TLabel;
    Image2: TImage;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormConnexion: TFormConnexion;
  b:boolean;

implementation

{$R *.dfm}

uses UnitVenteComptoir, UnitDashBoard,unit36, UnitAccueil;


procedure TFormConnexion.Button1Click(Sender: TObject);
begin
close;
end;

procedure TFormConnexion.Button2Click(Sender: TObject);
begin
if ((length(ComboBox1.Text)>0) and (length(edit1.Text)>0)) then
begin
DataModule1.FDQuery115.Params.ParamValues['x']:=ComboBox1.Text;
DataModule1.FDQuery115.Params.ParamValues['y']:=edit1.Text;
DataModule1.FDQuery115.Active:=false;
DataModule1.FDQuery115.Active:=true;
if DataModule1.FDQuery115.RecordCount=1 then
begin
//if DataModule1.FDQueryProtec15.RecordCount<5000 then
begin
FormDashBoard.Show
end//else close;
end
else begin
      showmessage('  خطأ في كلمة المرور  ');
      edit1.Clear;
     end;
end;
end;

procedure TFormConnexion.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then
 Button2Click(Edit1);
end;

procedure TFormConnexion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FormAccueil.close;
end;





procedure TFormConnexion.FormShow(Sender: TObject);
begin
DataModule1.FDConnection1.Connected:=true;
DataModule1.FDTableUsers15.Open();
DataModule1.FDTableUsers15.First;
if DataModule1.FDTableUsers15.RecordCount>0 then
while not DataModule1.FDTableUsers15.Eof do
begin
   if DataModule1.FDTableUsers15.FieldValues['active']=true then
   ComboBox1.Items.Add(DataModule1.FDTableUsers15.FieldValues['id']);
   DataModule1.FDTableUsers15.Next;
end
end;



initialization;
b:=false;
end.
