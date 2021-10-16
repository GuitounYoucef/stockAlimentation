unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Data.DB, Data.Win.ADODB, Vcl.CategoryButtons, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ButtonGroup, VCLTee.TeePenDlg, VCLTee.TeCanvas,
  VCLTee.TeeEdiGrad, Vcl.OleCtrls, SHDocVw, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, System.ImageList,
  Vcl.ImgList, Vcl.ActnMenus, Vcl.MPlayer ,ActiveX ,ComObj, frxClass,
   frxExportPDF;

type
  TForm7 = class(TForm)
    GridPanel1: TGridPanel;
    Image9: TImage;
    Image10: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ImageList3: TImageList;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    Image4: TImage;
    GridPanel3: TGridPanel;
    Label5: TLabel;
    Image21: TImage;
    Panel3: TPanel;
    Image22: TImage;
    GridPanel4: TGridPanel;
    Label6: TLabel;
    Image23: TImage;
    Panel4: TPanel;
    Image24: TImage;
    GridPanel5: TGridPanel;
    Label7: TLabel;
    Image25: TImage;
    Panel5: TPanel;
    Image5: TImage;
    GridPanel6: TGridPanel;
    Label8: TLabel;
    Image8: TImage;
    Panel6: TPanel;
    Image12: TImage;
    GridPanel7: TGridPanel;
    Label9: TLabel;
    Image13: TImage;
    ImageList4: TImageList;
    ImageListicon: TImageList;
    MainMenu1: TMainMenu;
    N8: TMenuItem;
    N16: TMenuItem;
    N13: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N6: TMenuItem;
    N10: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N22: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N12: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    N5: TMenuItem;
    N14: TMenuItem;
    N4: TMenuItem;
    Image2: TImage;
    GridPanel2: TGridPanel;
    Label2: TLabel;
    Image14: TImage;
    Panel8: TPanel;
    Image16: TImage;
    GridPanel8: TGridPanel;
    Label10: TLabel;
    Image17: TImage;
    Panel9: TPanel;
    Image3: TImage;
    GridPanel9: TGridPanel;
    Label11: TLabel;
    Image6: TImage;
    Panel10: TPanel;
    Image15: TImage;
    GridPanel10: TGridPanel;
    Label12: TLabel;
    Panel11: TPanel;
    Image19: TImage;
    GridPanel11: TGridPanel;
    Label13: TLabel;
    Image20: TImage;
    Image18: TImage;
    Panel7: TPanel;
    Image1: TImage;
    GridPanel12: TGridPanel;
    Label14: TLabel;
    Image26: TImage;
    Panel12: TPanel;
    Image7: TImage;
    GridPanel13: TGridPanel;
    Label15: TLabel;
    Image11: TImage;
    Panel13: TPanel;
    Image27: TImage;
    GridPanel14: TGridPanel;
    Label16: TLabel;
    Image28: TImage;
    N19: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N3: TMenuItem;
    N7: TMenuItem;
    ADOQuery2: TADOQuery;
    ADOTableAlert: TADOTable;
    ADOQuerystocke: TADOQuery;
    Label17: TLabel;
    N15: TMenuItem;
    N38: TMenuItem;
    Timer1: TTimer;
    ADOTable1: TADOTable;
    procedure N18Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N35Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image16MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image16MouseEnter(Sender: TObject);
    procedure Image16MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image16MouseLeave(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image17MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image17MouseEnter(Sender: TObject);
    procedure Image17MouseLeave(Sender: TObject);
    procedure Image17MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image17Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure Image6MouseLeave(Sender: TObject);
    procedure Image6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image19MouseEnter(Sender: TObject);
    procedure Image19MouseLeave(Sender: TObject);
    procedure Image19MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image19MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image19Click(Sender: TObject);
    procedure Image18MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image18MouseEnter(Sender: TObject);
    procedure Image18MouseLeave(Sender: TObject);
    procedure Image18MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image18Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Image20MouseEnter(Sender: TObject);
    procedure Image20MouseLeave(Sender: TObject);
    procedure GridPanel2MouseEnter(Sender: TObject);
    procedure GridPanel2MouseLeave(Sender: TObject);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure Image21MouseEnter(Sender: TObject);
    procedure Image21MouseLeave(Sender: TObject);
    procedure Image21MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image21MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image23MouseEnter(Sender: TObject);
    procedure Image25MouseEnter(Sender: TObject);
    procedure Image8MouseEnter(Sender: TObject);
    procedure Image23MouseLeave(Sender: TObject);
    procedure Image25MouseLeave(Sender: TObject);
    procedure Image23MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image25MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image23MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image25MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image8MouseLeave(Sender: TObject);
    procedure Image8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image13MouseEnter(Sender: TObject);
    procedure Image13MouseLeave(Sender: TObject);
    procedure Image13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image14MouseEnter(Sender: TObject);
    procedure Image14MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image14MouseLeave(Sender: TObject);
    procedure Image14MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image26MouseEnter(Sender: TObject);
    procedure Image26MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image26MouseLeave(Sender: TObject);
    procedure Image26MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image11MouseEnter(Sender: TObject);
    procedure Image11MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image11MouseLeave(Sender: TObject);
    procedure Image11MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image28MouseEnter(Sender: TObject);
    procedure Image28MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image28MouseLeave(Sender: TObject);
    procedure Image28MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image20MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image20MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form7: TForm7;
  searchResult : TSearchRec;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit3, Unit4, Unit5, Unit6, Unit8, Unit9, Unit10, Unit11,
  Unit12, Unit15, Unit17, Unit18, Unit23, Unit24, Unit25, Unit30, Unit34,unit36;



function GetMotherBoardSerial:String;
var
  objWMIService : OLEVariant;
  colItems      : OLEVariant;
  colItem       : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
function GetWMIObject(const objectName: String): IDispatch;
  var
    chEaten: Integer;
    BindCtx: IBindCtx;
    Moniker: IMoniker;
  begin
    OleCheck(CreateBindCtx(0, bindCtx));
    OleCheck(MkParseDisplayName(BindCtx, StringToOleStr(objectName), chEaten, Moniker));
    OleCheck(Moniker.BindToObject(BindCtx, nil, IDispatch, Result));
  end;

begin
  Result:='';
  objWMIService := GetWMIObject('winmgmts:\\localhost\root\cimv2');
  colItems      := objWMIService.ExecQuery('SELECT SerialNumber FROM Win32_BaseBoard','WQL',0);
  oEnum         := IUnknown(colItems._NewEnum) as IEnumVariant;
  if oEnum.Next(1, colItem, iValue) = 0 then
  Result:=VarToStr(colItem.SerialNumber);
end;
procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form15.close;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
Screen.MenuFont.Name :='Times New Roman';
Screen.MenuFont.Size:=14;
end;

procedure TForm7.FormKeyPress(Sender: TObject; var Key: Char);
begin
MessageDlg(Key + ' has been pressed', mtInformation, [mbOK], 0)
end;

procedure TForm7.FormShow(Sender: TObject);
begin
//label3.Caption:=GetMotherBoardSerial;
if ADOTable1.RecordCount=0 then
begin
ADOTable1.Insert;
ADOTable1.FieldValues['cle']:=GetMotherBoardSerial;
ADOTable1.Next;
end
else
if ADOTable1.RecordCount=1 then
begin
if (ADOTable1.FieldValues['cle']<>GetMotherBoardSerial) then
close;
end
else
close;
ADOQuery2.Active:=false;
ADOQuery2.Active:=true;
if ADOQuery2.RecordCount>5000 then
close;
//MessageDlg('هذا البرنامج عبارة عن نسخة تجريبية. تسمح بإجراء 5000 عملية بيع كحد أقصى',mtInformation,[mbOK],0);
ADOTableAlert.First;
while not ADOTableAlert.Eof do
begin
  ADOQuerystocke.Parameters.ParamValues['x']:=ADOTableAlert.FieldValues['type'];
  ADOQuerystocke.Active:=false;
  ADOQuerystocke.Active:=true;
  while not ADOQuerystocke.Eof do
     begin
       if ADOQuerystocke.FieldValues['dateconsm']-date<ADOTableAlert.FieldValues['dure'] then
       begin
          if ADOQuerystocke.FieldValues['dateconsm']-date<=0 then
          begin
             ADOQuerystocke.Edit;
             ADOQuerystocke.FieldValues['alert']:=false;
             ADOQuerystocke.FieldValues['expire']:=true;
             ADOQuerystocke.Post;
          end
          else
          begin
             ADOQuerystocke.Edit;
             ADOQuerystocke.FieldValues['alert']:=true;
             ADOQuerystocke.FieldValues['expire']:=false;
             ADOQuerystocke.Post;
          end;
       end;
       ADOQuerystocke.Next;
     end;
ADOTableAlert.Next;
case DataModule1.FDQuery115.FieldValues['privilege'] of
1:begin
  MainMenu1.Items.Items[5].Items[2].Enabled:=false;
  MainMenu1.Items.Items[5].Items[3].Enabled:=false;
  form24.PageControl1.Pages[1].TabVisible:=false;
  form24.PageControl1.Pages[2].TabVisible:=false;
  end;
2:begin
  MainMenu1.Items.Items[5].Items[2].Enabled:=false;
  MainMenu1.Items.Items[5].Items[3].Enabled:=false;
  form24.PageControl1.Pages[1].TabVisible:=false;
  form24.PageControl1.Pages[2].TabVisible:=false;
  end;

end;


end;
with form18 do
begin
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('select stock.* from stock where alert=true');
  ADOQuery2.Active:=false;
  ADOQuery2.Active:=true;
  if ADOQuery2.RecordCount>0 then
  begin
    f:=1;
    show;
  end;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('select stock.* from stock where expire=true');
  ADOQuery2.Active:=false;
  ADOQuery2.Active:=true;
  if ADOQuery2.RecordCount>0 then
  begin
    f:=2;
    show;
  end;
end;
end;

procedure TForm7.GridPanel2MouseEnter(Sender: TObject);
begin
Image2.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image2.Picture.Bitmap);
panel1.Visible:=false;
panel1.Visible:=true;
end;

procedure TForm7.GridPanel2MouseLeave(Sender: TObject);
begin
Image2.Picture.Bitmap:= nil;
ImageList4.GetBitmap(4, Image2.Picture.Bitmap);
panel1.Visible:=false;
panel1.Visible:=true;
end;

procedure TForm7.Image11Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm7.Image11MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image7.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image7.Picture.Bitmap);
panel12.Visible:=false;
panel12.Visible:=true;
end;

procedure TForm7.Image11MouseEnter(Sender: TObject);
begin

Image7.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image7.Picture.Bitmap);
panel12.Visible:=false;
panel12.Visible:=true;
Label15.StyleElements := Label15.StyleElements - [seFont];
end;

procedure TForm7.Image11MouseLeave(Sender: TObject);
begin
Image7.Picture.Bitmap:= nil;
ImageList4.GetBitmap(2, Image7.Picture.Bitmap);
panel12.Visible:=false;
panel12.Visible:=true;
Label15.StyleElements := Label15.StyleElements + [seFont];
end;

procedure TForm7.Image11MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image7.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image7.Picture.Bitmap);
panel12.Visible:=false;
panel12.Visible:=true;
end;

procedure TForm7.Image13MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image12.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image12.Picture.Bitmap);
panel6.Visible:=false;
panel6.Visible:=true;
end;

procedure TForm7.Image13MouseEnter(Sender: TObject);
begin

Image12.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image12.Picture.Bitmap);
panel6.Visible:=false;
panel6.Visible:=true;
Label9.StyleElements := Label9.StyleElements - [seFont];
end;

procedure TForm7.Image13MouseLeave(Sender: TObject);
begin
Image12.Picture.Bitmap:= nil;
ImageList4.GetBitmap(3, Image12.Picture.Bitmap);
panel6.Visible:=false;
panel6.Visible:=true;
Label9.StyleElements := Label9.StyleElements + [seFont];
end;

procedure TForm7.Image13MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image12.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image12.Picture.Bitmap);
panel6.Visible:=false;
panel6.Visible:=true;
end;

procedure TForm7.Image14MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image2.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image2.Picture.Bitmap);
panel1.Visible:=false;
panel1.Visible:=true;
end;

procedure TForm7.Image14MouseEnter(Sender: TObject);
begin

Image2.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image2.Picture.Bitmap);
panel1.Visible:=false;
panel1.Visible:=true;
Label2.StyleElements := Label2.StyleElements - [seFont];
end;

procedure TForm7.Image14MouseLeave(Sender: TObject);
begin
Image2.Picture.Bitmap:= nil;
ImageList4.GetBitmap(4, Image2.Picture.Bitmap);
panel1.Visible:=false;
panel1.Visible:=true;
Label2.StyleElements := Label2.StyleElements + [seFont];
end;

procedure TForm7.Image14MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image2.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image2.Picture.Bitmap);
panel1.Visible:=false;
panel1.Visible:=true;
end;

procedure TForm7.Image16Click(Sender: TObject);
begin

{form1.Panel1.Caption:='  بيع بالتجزئة  ';
form1.Image1.Visible:=true;
form1.Image3.Visible:=false;
form1.typevente:=1;
form1.show;
form1.annee:=form1.ComboBoxAnnee.Text;
form1.num:=form1.ADOQuery2.RecordCount+1;
form1.ADOQuery1.Parameters.ParamValues['x']:=form1.annee;
form1.ADOQuery1.Parameters.ParamValues['y']:=form1.num;
form1.ADOQuery1.Parameters.ParamValues['z']:=1;
form1.ADOQuery1.Active:=false;
form1.ADOQuery1.Active:=true;      }
end;

procedure TForm7.Image16MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var s,c:string;
begin

end;

procedure TForm7.Image16MouseEnter(Sender: TObject);
var s,c:string;
begin

end;

procedure TForm7.Image16MouseLeave(Sender: TObject);
var s,c:string;
begin

end;



procedure TForm7.Image16MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var s,c:string;
begin


end;

procedure TForm7.Image17Click(Sender: TObject);
begin
{form1.Panel1.Caption:='  بيع بالجملة  ';
form1.Image1.Visible:=false;
form1.Image3.Visible:=true;
form1.typevente:=2;
form1.ADOQuery2.Parameters.ParamValues['y']:=2;
form1.show;
form1.annee:=form1.ComboBoxAnnee.Text;
form1.num:=form1.ADOQuery2.RecordCount+1;
form1.ADOQuery1.Parameters.ParamValues['x']:=form1.annee;
form1.ADOQuery1.Parameters.ParamValues['y']:=form1.num;
form1.ADOQuery1.Parameters.ParamValues['z']:=2;
form1.ADOQuery1.Active:=false;
form1.ADOQuery1.Active:=true;    }
end;

procedure TForm7.Image17MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var c:string;
begin
Image16.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image16.Picture.Bitmap);
panel8.Visible:=false;
panel8.Visible:=true;

end;



procedure TForm7.Image17MouseEnter(Sender: TObject);
var c:string;
begin
timer1.Enabled:=false;
Image16.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image16.Picture.Bitmap);
panel8.Visible:=false;
panel8.Visible:=true;
Label10.StyleElements := Label10.StyleElements - [seFont];
end;

procedure TForm7.Image17MouseLeave(Sender: TObject);
var c:string;
begin
Image16.Picture.Bitmap:= nil;
ImageList4.GetBitmap(2, Image16.Picture.Bitmap);
panel8.Visible:=false;
panel8.Visible:=true;
Label10.StyleElements := Label10.StyleElements + [seFont];
end;

procedure TForm7.Image17MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var c:string;
begin
Image16.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image16.Picture.Bitmap);
panel8.Visible:=false;
panel8.Visible:=true;
end;

procedure TForm7.Image18Click(Sender: TObject);
begin
form8.show;
end;

procedure TForm7.Image18MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image15.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image15.Picture.Bitmap);
panel10.Visible:=false;
panel10.Visible:=true;
end;

procedure TForm7.Image18MouseEnter(Sender: TObject);
begin
Image15.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image15.Picture.Bitmap);
panel10.Visible:=false;
panel10.Visible:=true;
Label12.StyleElements := Label12.StyleElements - [seFont];
end;

procedure TForm7.Image18MouseLeave(Sender: TObject);
begin
Image15.Picture.Bitmap:= nil;
ImageList4.GetBitmap(2, Image15.Picture.Bitmap);
panel10.Visible:=false;
panel10.Visible:=true;
Label12.StyleElements := Label12.StyleElements + [seFont];
end;

procedure TForm7.Image18MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image15.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image15.Picture.Bitmap);
panel10.Visible:=false;
panel10.Visible:=true;
end;

procedure TForm7.Image19Click(Sender: TObject);
begin
form11.Show;
end;

procedure TForm7.Image19MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image19.Picture.Bitmap:= nil;
ImageList3.GetBitmap(8, Image19.Picture.Bitmap);
end;

procedure TForm7.Image19MouseEnter(Sender: TObject);
begin
Image19.Picture.Bitmap:= nil;
ImageList3.GetBitmap(7, Image19.Picture.Bitmap);
end;

procedure TForm7.Image19MouseLeave(Sender: TObject);
begin
Image19.Picture.Bitmap:= nil;
ImageList3.GetBitmap(6, Image19.Picture.Bitmap);
end;

procedure TForm7.Image19MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image19.Picture.Bitmap:= nil;
ImageList3.GetBitmap(7, Image19.Picture.Bitmap);
end;

procedure TForm7.Image20MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image19.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image19.Picture.Bitmap);
panel11.Visible:=false;
panel11.Visible:=true;
end;

procedure TForm7.Image20MouseEnter(Sender: TObject);
begin
Image19.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image19.Picture.Bitmap);
panel11.Visible:=false;
panel11.Visible:=true;
Label13.StyleElements := Label13.StyleElements - [seFont];
end;

procedure TForm7.Image20MouseLeave(Sender: TObject);
begin
Image19.Picture.Bitmap:= nil;
ImageList4.GetBitmap(3, Image19.Picture.Bitmap);
panel11.Visible:=false;
panel11.Visible:=true;
Label13.StyleElements := Label13.StyleElements + [seFont];
end;

procedure TForm7.Image20MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image19.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image19.Picture.Bitmap);
panel11.Visible:=false;
panel11.Visible:=true;
end;

procedure TForm7.Image21MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image4.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image4.Picture.Bitmap);
panel2.Visible:=false;
panel2.Visible:=true;
end;

procedure TForm7.Image21MouseEnter(Sender: TObject);
begin
Image4.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image4.Picture.Bitmap);
panel2.Visible:=false;
panel2.Visible:=true;
Label5.StyleElements := Label5.StyleElements - [seFont];
end;

procedure TForm7.Image21MouseLeave(Sender: TObject);
begin
Image4.Picture.Bitmap:= nil;
ImageList4.GetBitmap(3, Image4.Picture.Bitmap);
panel2.Visible:=false;
panel2.Visible:=true;
Label5.StyleElements := Label5.StyleElements + [seFont];
end;

procedure TForm7.Image21MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image4.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image4.Picture.Bitmap);
panel2.Visible:=false;
panel2.Visible:=true;
end;

procedure TForm7.Image23MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image22.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image22.Picture.Bitmap);
panel3.Visible:=false;
panel3.Visible:=true;
end;

procedure TForm7.Image23MouseEnter(Sender: TObject);
begin
Image22.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image22.Picture.Bitmap);
panel3.Visible:=false;
panel3.Visible:=true;
Label6.StyleElements := Label6.StyleElements - [seFont];
end;

procedure TForm7.Image23MouseLeave(Sender: TObject);
begin
Image22.Picture.Bitmap:= nil;
ImageList4.GetBitmap(1, Image22.Picture.Bitmap);
panel3.Visible:=false;
panel3.Visible:=true;
Label6.StyleElements := Label6.StyleElements + [seFont];
end;

procedure TForm7.Image23MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image22.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image22.Picture.Bitmap);
panel3.Visible:=false;
panel3.Visible:=true;
end;

procedure TForm7.Image25MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image24.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image24.Picture.Bitmap);
panel4.Visible:=false;
panel4.Visible:=true;
end;

procedure TForm7.Image25MouseEnter(Sender: TObject);
begin
Image24.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image24.Picture.Bitmap);
panel4.Visible:=false;
panel4.Visible:=true;
Label7.StyleElements := Label7.StyleElements - [seFont];
end;

procedure TForm7.Image25MouseLeave(Sender: TObject);
begin
Image24.Picture.Bitmap:= nil;
ImageList4.GetBitmap(2, Image24.Picture.Bitmap);
panel4.Visible:=false;
panel4.Visible:=true;
Label7.StyleElements := Label7.StyleElements + [seFont];
end;

procedure TForm7.Image25MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image24.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image24.Picture.Bitmap);
panel4.Visible:=false;
panel4.Visible:=true;
end;

procedure TForm7.Image26MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image1.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image1.Picture.Bitmap);
panel7.Visible:=false;
panel7.Visible:=true;
end;

procedure TForm7.Image26MouseEnter(Sender: TObject);
begin
Image1.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image1.Picture.Bitmap);
panel7.Visible:=false;
panel7.Visible:=true;
Label14.StyleElements := Label14.StyleElements - [seFont];
end;

procedure TForm7.Image26MouseLeave(Sender: TObject);
begin
Image1.Picture.Bitmap:= nil;
ImageList4.GetBitmap(3, Image1.Picture.Bitmap);
panel7.Visible:=false;
panel7.Visible:=true;
Label14.StyleElements := Label14.StyleElements + [seFont];
end;

procedure TForm7.Image26MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image1.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image1.Picture.Bitmap);
panel7.Visible:=false;
panel7.Visible:=true;
end;

procedure TForm7.Image28MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image27.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image27.Picture.Bitmap);
panel13.Visible:=false;
panel13.Visible:=true;
end;

procedure TForm7.Image28MouseEnter(Sender: TObject);
begin
Image27.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image27.Picture.Bitmap);
panel13.Visible:=false;
panel13.Visible:=true;
Label16.StyleElements := Label16.StyleElements - [seFont];
end;

procedure TForm7.Image28MouseLeave(Sender: TObject);
begin
Image27.Picture.Bitmap:= nil;
ImageList4.GetBitmap(3, Image27.Picture.Bitmap);
panel13.Visible:=false;
panel13.Visible:=true;
Label16.StyleElements := Label16.StyleElements + [seFont];
end;

procedure TForm7.Image28MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image27.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image27.Picture.Bitmap);
panel13.Visible:=false;
panel13.Visible:=true;
end;

procedure TForm7.Image3Click(Sender: TObject);
begin
form18.f:=1;
form18.show;
end;

procedure TForm7.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image3.Picture.Bitmap:= nil;
ImageList3.GetBitmap(5, Image3.Picture.Bitmap);
end;

procedure TForm7.Image3MouseEnter(Sender: TObject);
begin
Image3.Picture.Bitmap:= nil;
ImageList3.GetBitmap(4, Image3.Picture.Bitmap);
end;

procedure TForm7.Image3MouseLeave(Sender: TObject);
begin
Image3.Picture.Bitmap:= nil;
ImageList3.GetBitmap(3, Image3.Picture.Bitmap);
end;

procedure TForm7.Image3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image3.Picture.Bitmap:= nil;
ImageList3.GetBitmap(4, Image3.Picture.Bitmap);
end;

procedure TForm7.Image6Click(Sender: TObject);
begin
form18.f:=2;
form18.show;
end;

procedure TForm7.Image6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image3.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image3.Picture.Bitmap);
panel9.Visible:=false;
panel9.Visible:=true;
end;

procedure TForm7.Image6MouseEnter(Sender: TObject);
begin
Image3.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image3.Picture.Bitmap);
panel9.Visible:=false;
panel9.Visible:=true;
Label11.StyleElements := Label11.StyleElements - [seFont];
end;

procedure TForm7.Image6MouseLeave(Sender: TObject);
begin
Image3.Picture.Bitmap:= nil;
ImageList4.GetBitmap(4, Image3.Picture.Bitmap);
panel9.Visible:=false;
panel9.Visible:=true;
Label11.StyleElements := Label11.StyleElements + [seFont];
end;

procedure TForm7.Image6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image3.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image3.Picture.Bitmap);
panel9.Visible:=false;
panel9.Visible:=true;
end;

procedure TForm7.Image7Click(Sender: TObject);
begin
form12.Show;
end;

procedure TForm7.Image8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image5.Picture.Bitmap:= nil;
ImageList4.GetBitmap(5, Image5.Picture.Bitmap);
panel5.Visible:=false;
panel5.Visible:=true;
end;

procedure TForm7.Image8MouseEnter(Sender: TObject);
begin
Image5.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image5.Picture.Bitmap);
panel5.Visible:=false;
panel5.Visible:=true;
Label8.StyleElements := Label8.StyleElements - [seFont];
end;

procedure TForm7.Image8MouseLeave(Sender: TObject);
begin
Image5.Picture.Bitmap:= nil;
ImageList4.GetBitmap(1, Image5.Picture.Bitmap);
panel5.Visible:=false;
panel5.Visible:=true;
Label8.StyleElements := Label8.StyleElements + [seFont];
end;

procedure TForm7.Image8MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image5.Picture.Bitmap:= nil;
ImageList4.GetBitmap(0, Image5.Picture.Bitmap);
panel5.Visible:=false;
panel5.Visible:=true;
end;

procedure TForm7.N10Click(Sender: TObject);
begin
form9.show;
end;

procedure TForm7.N11Click(Sender: TObject);
begin
form18.f:=2;
form18.Show;
end;

procedure TForm7.N12Click(Sender: TObject);
var myYear, myMonth, myDay : Word;
begin
with form1 do
begin
DecodeDate(Date, myYear, myMonth, myDay);
form1.Panel1.Caption:='  بيع بالجملة  ';
form1.Image3.Visible:=true;
form1.Image1.Visible:=false;
form1.typevente:=2;
DataModule1.FDQueryNumVente.Params.ParamValues['x']:=inttostr(myYear);
DataModule1.FDQueryNumVente.Params.ParamValues['y']:=typevente;
DataModule1.FDQueryNumVente.Active:=false;
DataModule1.FDQueryNumVente.Active:=true;
form1.annee:=inttostr(myYear);
form1.num:=DataModule1.FDQueryNumVente.RecordCount+1;
ComboBoxNomPrenom.Clear;
ComboBoxNomPrenom.Style:=csDropDownList;
form1.show;

end;
end;

procedure TForm7.N13Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm7.N14Click(Sender: TObject);
begin
form8.show;
end;

procedure TForm7.N16Click(Sender: TObject);
begin
form10.show;
end;

procedure TForm7.N18Click(Sender: TObject);
var myYear, myMonth, myDay : Word;
begin
with form1 do
begin
DecodeDate(Date, myYear, myMonth, myDay);
form1.Panel1.Caption:='  بيع بالتجزئة  ';
//form1.ImageList2.GetBitmap(0, form1.Image3.Picture.Bitmap);
//form1.Image3.Visible:=false;
//form1.Image3.Visible:=true;
form1.typevente:=1;
DataModule1.FDQueryNumVente.Params.ParamValues['x']:=inttostr(myYear);
DataModule1.FDQueryNumVente.Params.ParamValues['y']:=typevente;
DataModule1.FDQueryNumVente.Active:=false;
DataModule1.FDQueryNumVente.Active:=true;
form1.annee:=inttostr(myYear);
form1.num:=DataModule1.FDQueryNumVente.RecordCount+1;
ComboBoxNomPrenom.Clear;
ComboBoxNomPrenom.Style:=csDropDownList;
form1.show;
{form1.ADOQuery1.Parameters.ParamValues['x']:=inttostr(myYear);
form1.ADOQuery1.Parameters.ParamValues['y']:=form1.ADOQuery2.RecordCount+1;
form1.ADOQuery1.Parameters.ParamValues['z']:=1;
form1.ADOQuery1.Active:=false;
form1.ADOQuery1.Active:=true;   }
end;
end;

procedure TForm7.N19Click(Sender: TObject);
begin
form4.show;
end;

procedure TForm7.N21Click(Sender: TObject);
begin
form12.show;
end;

procedure TForm7.N24Click(Sender: TObject);
begin
form24.show;
form24.PageControl1.TabIndex:=0;
end;

procedure TForm7.N25Click(Sender: TObject);
begin
form24.show;
form24.PageControl1.TabIndex:=1;
end;

procedure TForm7.N26Click(Sender: TObject);
begin
Form23.show;
end;

procedure TForm7.N2Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm7.N35Click(Sender: TObject);
begin
form17.show;
end;

procedure TForm7.N36Click(Sender: TObject);
begin
form24.show;
form24.PageControl1.TabIndex:=2;
end;

procedure TForm7.N38Click(Sender: TObject);
begin
form30.show;
end;

procedure TForm7.N4Click(Sender: TObject);
begin
form34.show;
end;

procedure TForm7.N6Click(Sender: TObject);
begin
form6.show;
end;

procedure TForm7.N7Click(Sender: TObject);
begin
form25.show;
end;

procedure TForm7.N9Click(Sender: TObject);
begin
form18.f:=1;
form18.show;
end;

procedure TForm7.Panel1MouseLeave(Sender: TObject);
begin
panel1.Visible:=false;
panel1.Visible:=true;
end;

procedure TForm7.Timer1Timer(Sender: TObject);
begin
if Image17.Visible=false then
  Image17.Visible:=true
else   Image17.Visible:=false;
end;

end.
