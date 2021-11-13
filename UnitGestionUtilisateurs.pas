unit UnitGestionUtilisateurs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;

type
  TFormGestionUtilisateurs = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    EditCourant: TEdit;
    EditNouveau: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditCinfNouveau: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Label5: TLabel;
    EditId: TEdit;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label6: TLabel;
    EditMotpass: TEdit;
    ComboBoxTypeCompte: TComboBox;
    DBGrid2: TDBGrid;
    ButtonAct: TButton;
    ButtonDes: TButton;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonActClick(Sender: TObject);
    procedure ButtonDesClick(Sender: TObject);
    procedure ADOTable1AfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormGestionUtilisateurs: TFormGestionUtilisateurs;

implementation

{$R *.dfm}

uses UnitConnexion,unit36, DataParametrageUnite;
//------------------------------------------------------------------------------
procedure TFormGestionUtilisateurs.ADOTable1AfterScroll(DataSet: TDataSet);
begin
    if DataParametrage.FDTableUsers.FieldValues['active']=true then
    begin
    ButtonAct.Enabled:=false;
    ButtonDes.Enabled:=true;
    end
    else
    begin
    ButtonAct.Enabled:=true;
    ButtonDes.Enabled:=false;
    end
end;
//------------------------------------------------------------------------------
procedure TFormGestionUtilisateurs.Button1Click(Sender: TObject);
begin
    if (DataParametrage.FDQueryLoginUser.FieldValues['motpasse']=EditCourant.Text) and (EditNouveau.Text=EditCinfNouveau.Text)  then
    begin
      DataParametrage.FDQueryLoginUser.Edit;
      DataParametrage.FDQueryLoginUser.FieldValues['motpasse']:=EditNouveau.Text;
      DataParametrage.FDQueryLoginUser.Post;
      MessageDlg('تم تغيير كلمة المرور بنجاح',mtInformation,[mbOK],0);
      close;
    end
    else
       if (DataParametrage.FDQueryLoginUser.FieldValues['motpasse']<>EditCourant.Text) then
         MessageDlg('خطأ في كلمة المرور الحالية',mtInformation,[mbOK],0)
         else if (EditNouveau.Text<>EditCinfNouveau.Text) then
              MessageDlg('خطأ في تأكيد كلمة المرور',mtInformation,[mbOK],0);
end;
//------------------------------------------------------------------------------
procedure TFormGestionUtilisateurs.Button2Click(Sender: TObject);
begin
    if (length(EditId.Text)>0) and (length(EditMotpass.Text)>0) and (length(ComboBoxTypeCompte.Text)>0) then
    begin
      DataParametrage.FDTableUsers.Insert;
      DataParametrage.FDTableUsers.FieldValues['id']:=EditId.Text;
      DataParametrage.FDTableUsers.FieldValues['motpasse']:=EditMotpass.Text;
      if ComboBoxTypeCompte.Text='مدير' then
       DataParametrage.FDTableUsers.FieldValues['privilege']:=0
      else
      if ComboBoxTypeCompte.Text='مسير' then
       DataParametrage.FDTableUsers.FieldValues['privilege']:=1
      else
      if ComboBoxTypeCompte.Text='بائع' then
       DataParametrage.FDTableUsers.FieldValues['privilege']:=2;
       DataParametrage.FDTableUsers.FieldValues['type']:=ComboBoxTypeCompte.Text;
       DataParametrage.FDTableUsers.FieldValues['Active']:=true;
       DataParametrage.FDTableUsers.Next;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormGestionUtilisateurs.ButtonActClick(Sender: TObject);
begin
    if DataParametrage.FDTableUsers.FieldValues['active']=false then
    begin
    DataParametrage.FDTableUsers.Edit;
    DataParametrage.FDTableUsers.FieldValues['active']:=true;
    DataParametrage.FDTableUsers.Post;
    ADOTable1AfterScroll(DataParametrage.FDTableUsers);
    end;
end;
//------------------------------------------------------------------------------
procedure TFormGestionUtilisateurs.ButtonDesClick(Sender: TObject);
begin
    if DataParametrage.FDTableUsers.RecNo>1 then
    begin
    DataParametrage.FDTableUsers.Edit;
    DataParametrage.FDTableUsers.FieldValues['active']:=false;
    DataParametrage.FDTableUsers.Post;
    ADOTable1AfterScroll(DataParametrage.FDTableUsers);
    end;
end;
//------------------------------------------------------------------------------
procedure TFormGestionUtilisateurs.FormShow(Sender: TObject);
begin
    PageControl1.TabWidth:=(PageControl1.Width div 3)-2;
    EditCourant.Clear;
    EditNouveau.Clear;
    EditCinfNouveau.Clear;
end;

end.
