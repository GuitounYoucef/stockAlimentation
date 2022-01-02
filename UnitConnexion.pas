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
    EditPassword: TEdit;
    ComboBoxUser: TComboBox;
    ButtonConnecter: TButton;
    Button1: TButton;
    Image1: TImage;
    Label4: TLabel;
    Image2: TImage;
    procedure EditPasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonConnecterClick(Sender: TObject);
    procedure EditPasswordEnter(Sender: TObject);
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

uses UnitVenteComptoir, UnitDashBoard, UnitAccueil, DataParametrageUnite;


procedure TFormConnexion.Button1Click(Sender: TObject);
begin
close;
end;
//------------------------------------------------------------------------------
procedure TFormConnexion.ButtonConnecterClick(Sender: TObject);
begin
  if DataParametrage.Login(ComboBoxUser.Text,EditPassword.Text) then
    begin
      hide;
      FormDashBoard.Show
    end
    else
    begin
      showmessage('  خطأ في كلمة المرور  ');
      EditPassword.Clear;
    end;
 end;
//------------------------------------------------------------------------------
procedure TFormConnexion.EditPasswordEnter(Sender: TObject);
begin
    LoadKeyboardLayout('0000040c', KLF_ACTIVATE);
end;

procedure TFormConnexion.EditPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_RETURN then
     ButtonConnecterClick(EditPassword);
end;
//------------------------------------------------------------------------------
procedure TFormConnexion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormAccueil.close;
end;
//------------------------------------------------------------------------------
procedure TFormConnexion.FormShow(Sender: TObject);
begin
    DataParametrage.FDTableUsers.Open();
    DataParametrage.FDTableUsers.First;
    if DataParametrage.FDTableUsers.RecordCount>0 then
    while not DataParametrage.FDTableUsers.Eof do
    begin
       if DataParametrage.FDTableUsers.FieldValues['active']=true then
       ComboBoxUser.Items.Add(DataParametrage.FDTableUsers.FieldValues['id']);
       DataParametrage.FDTableUsers.Next;
    end
end;
//------------------------------------------------------------------------------
initialization;
b:=false;
end.
