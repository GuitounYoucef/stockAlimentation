unit Unit21;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.jpeg, Data.DB, Data.Win.ADODB;

type
  TForm21 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GridPanel1: TGridPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ADOTable1: TADOTable;
    ADOQueryBalance: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure clicker(bouton:integer);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
  var fenetre:integer;
    { Déclarations publiques }
  end;

var
  Form21: TForm21;

implementation

{$R *.dfm}

uses Unit6, Unit8, Unit5, Unit1,unit36;
procedure TForm21.clicker(bouton:integer);
var k:word;
    s:TShiftState;
begin
case fenetre of

8:begin
   with form8 do
   begin
    { ADOQueryBouton.Parameters.ParamValues['x']:=inttostr(bouton);
     ADOQueryBouton.Active:=false;
     ADOQueryBouton.Active:=true;
   if form8.ADOQueryBouton.RecordCount>0 then
     begin
      // Label15.Caption:='كمية (كلغ)';
       tp:=ADOQueryBouton.FieldValues['type'];
       prod:=ADOQueryBouton.FieldValues['producteur'];
       id:=ADOQueryBouton.FieldValues['id'];
       codebar:=inttostr(bouton);
       Image2.Picture.LoadFromFile(ADOQueryBouton.FieldValues['Lien']);
       Image2.Hide;
       Image2.Show;
     end; }
  end;
end;
5:begin
   with form5 do
   begin
     DataModule1.FDQueryCodeProduit.Params.ParamValues['x']:=inttostr(bouton);
     DataModule1.FDQueryCodeProduit.Active:=false;
     DataModule1.FDQueryCodeProduit.Active:=true;
   if DataModule1.FDQueryCodeProduit.RecordCount>0 then
     begin
       //Label15.Caption:='كمية (كلغ)';
       //ComboBoxType.Text:=ADOQueryCodeBar.FieldValues['type'];
       //ComboBoxProducteur.Text:=ADOQueryCodeBar.FieldValues['producteur'];
       //ComboBoxProduit.Text:=ADOQueryCodeBar.FieldValues['id'];
       form5.Edit2.Text:=DataModule1.FDQueryCodeProduit.FieldValues['code'];
       k:=VK_RETURN;
       s:=[ssShift];
       form5.Edit2KeyDown(Form21,k,s);
       barcode:=inttostr(bouton);
       Image2.Picture.LoadFromFile(DataModule1.FDQueryCodeProduit.FieldValues['Lien']);
       Image2.Hide;
       Image2.Show;
       balance:=true;
     end;
  end;
end;
1:begin
{   with form1 do
   begin
     ADOQueryBal.Parameters.ParamValues['z']:=inttostr(bouton);
     ADOQueryBal.Active:=false;
     ADOQueryBal.Active:=true;
   if ADOQueryBal.RecordCount>0 then
     begin
     AjouterProduit(ADOQueryBal.FieldValues['Code'],ADOQueryBal.FieldValues['id'],1);
     end
     else
       begin
         form21.close;
         MessageDlg('السلعة المحددة غير موجودة في المخزن', mtInformation, [mbOK], 0);
       end;
  end;  }
end;
end;
close;
end;

procedure TForm21.FormShow(Sender: TObject);
var i,j:integer;
MyPicture :TPicture;
currentimage :Tbitmap;
clTrans : TColor;
begin
Imagelist1.Clear;
myPicture :=Tpicture.Create;
currentimage := TBitmap.Create;
 ADOQueryBalance.First;
while not ADOQueryBalance.Eof do
begin
if FileExists(ADOQueryBalance['lien']) then
begin
MyPicture.LoadFromFile(ADOQueryBalance['lien']);
currentimage.Width := ImageList1.Width;       //set width same as jpg
currentimage.Height:= ImageList1.Height;      //set height same as jpg
//currentimage.Canvas.StretchDraw(Rect(0, 0, 100, 100), myPicture.Bitmap);
currentimage.Canvas.Draw(0, 0, myPicture.Graphic);
currentimage.Canvas.StretchDraw(rect(0,0,230,135),MyPicture.Graphic);
clTrans:=currentimage.TransparentColor;
if i>0 then
i:=strtoint(ADOQueryBalance['code'])-1;
ImageList1.Insert(i,currentimage,nil);
end;
ADOQueryBalance.Next;
end;
ADOQueryBalance.First;
while not ADOQueryBalance.Eof do
begin
 for j := 1 to componentcount-1 do
  begin
    if (components[j] is tbutton) then
     if (tbutton(components[j]).ImageIndex=ADOQueryBalance.FieldValues['code']-1) and (tbutton(components[j]).Visible=false) then
        tbutton(components[j]).Visible:=true;
  end;
ADOQueryBalance.Next;
end;

end;

procedure TForm21.Button10Click(Sender: TObject);
begin
clicker(10);
end;

procedure TForm21.Button11Click(Sender: TObject);
begin
clicker(12);
end;

procedure TForm21.Button12Click(Sender: TObject);
begin
clicker(11);
end;

procedure TForm21.Button13Click(Sender: TObject);
begin
clicker(16);
end;

procedure TForm21.Button14Click(Sender: TObject);
begin
clicker(13);
end;

procedure TForm21.Button15Click(Sender: TObject);
begin
clicker(15);
end;

procedure TForm21.Button16Click(Sender: TObject);
begin
clicker(14);
end;

procedure TForm21.Button1Click(Sender: TObject);
begin
clicker(1);
end;

procedure TForm21.Button2Click(Sender: TObject);
begin
clicker(2);
end;

procedure TForm21.Button3Click(Sender: TObject);
begin
 clicker(3);
end;

procedure TForm21.Button4Click(Sender: TObject);
begin
clicker(4);
end;

procedure TForm21.Button5Click(Sender: TObject);
begin
clicker(5);
end;

procedure TForm21.Button6Click(Sender: TObject);
begin
clicker(6);
end;

procedure TForm21.Button7Click(Sender: TObject);
begin
clicker(7);
end;

procedure TForm21.Button8Click(Sender: TObject);
begin
clicker(8);
end;

procedure TForm21.Button9Click(Sender: TObject);
begin
clicker(9);
end;

end.
