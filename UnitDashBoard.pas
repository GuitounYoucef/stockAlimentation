unit UnitDashBoard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, cxClasses, dxRibbon, dxBar, dxCustomTileControl,
  dxTileControl, dxSkinsDefaultPainters, dxSkinsForm, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, System.ImageList, Vcl.ImgList, cxImageList, dxStatusBar,
  Data.Win.ADODB, Data.DB, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls,
   Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ButtonGroup, VCLTee.TeePenDlg, VCLTee.TeCanvas,
  VCLTee.TeeEdiGrad, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ComCtrls,ComObj,ActiveX, dxTaskbarProgress, dxNavBar,
  dxNavBarBase, dxNavBarCollns, dxNavBarStyles, Vcl.Menus, cxButtons;

type
  TFormDashBoard = class(TForm)
    dxBarManager1: TdxBarManager;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab2: TdxRibbonTab;
    dxRibbon1Tab3: TdxRibbonTab;
    dxTileControl1: TdxTileControl;
    dxTileControl1Group2: TdxTileControlGroup;
    dxTileControl1Item2: TdxTileControlItem;
    dxTileControl1Item3: TdxTileControlItem;
    dxTileControl1Item4: TdxTileControlItem;
    dxTileControl1Item8: TdxTileControlItem;
    dxTileControl1Item9: TdxTileControlItem;
    dxTileControl1Group4: TdxTileControlGroup;
    dxTileControl1Item12: TdxTileControlItem;
    dxTileControl1Item17: TdxTileControlItem;
    dxTileControl1Item17dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item17dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item17dxTileControlItemFrame3: TdxTileControlItemFrame;
    dxTileControl1Item17dxTileControlItemFrame4: TdxTileControlItemFrame;
    dxTileControl1Item17dxTileControlItemFrame5: TdxTileControlItemFrame;
    dxTileControl1Item17dxTileControlItemFrame6: TdxTileControlItemFrame;
    dxRibbonPopupMenu1: TdxRibbonPopupMenu;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxTileControl1Item1: TdxTileControlItem;
    dxTileControl1Item5: TdxTileControlItem;
    dxTileControl1Item6: TdxTileControlItem;
    dxTileControl1Group5: TdxTileControlGroup;
    dxTileControlVenteDetail: TdxTileControlItem;
    dxTileControlVenteGros: TdxTileControlItem;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarManager1Bar3: TdxBar;
    dxBarManager1Bar4: TdxBar;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarManager1Bar5: TdxBar;
    dxBarManager1Bar6: TdxBar;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxRibbon1Tab4: TdxRibbonTab;
    dxRibbon1Tab5: TdxRibbonTab;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarManager1Bar7: TdxBar;
    dxBarLargeButton20: TdxBarLargeButton;
    dxBarLargeButton21: TdxBarLargeButton;
    dxBarManager1Bar8: TdxBar;
    dxBarLargeButton22: TdxBarLargeButton;
    dxBarLargeButton23: TdxBarLargeButton;
    dxBarLargeButton24: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    dxTileControl1Item11: TdxTileControlItem;
    dxTileControl1Item11dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item11dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item11dxTileControlItemFrame3: TdxTileControlItemFrame;
    dxTileControl1Item11dxTileControlItemFrame4: TdxTileControlItemFrame;
    cxImageList2: TcxImageList;
    dxTileControl1Item2dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item2dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item5dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item5dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item6dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item6dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item12dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item12dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item1dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item1dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item7dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item7dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControlVentreGrosFrame1: TdxTileControlItemFrame;
    dxTileControlVentreGrosFrame2: TdxTileControlItemFrame;
    dxTileControl1Item3dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item3dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item4dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item4dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item8dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item8dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxTileControl1Item9dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item9dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxBarLargeButton25: TdxBarLargeButton;
    dxBarManager1Bar9: TdxBar;
    dxBarLargeButton26: TdxBarLargeButton;
    dxBarLargeButton27: TdxBarLargeButton;
    dxBarLargeButton28: TdxBarLargeButton;
    dxBarLargeButton29: TdxBarLargeButton;
    dxBarLargeButton30: TdxBarLargeButton;
    dxSkinController1: TdxSkinController;
    dxBarLargeButton31: TdxBarLargeButton;
    dxBarManager1Bar11: TdxBar;
    dxBarLargeButton32: TdxBarLargeButton;
    dxBarLargeButton33: TdxBarLargeButton;
    dxBarManager1Bar10: TdxBar;
    dxBarLargeButton34: TdxBarLargeButton;
    dxBarLargeButton35: TdxBarLargeButton;
    dxBarManager1Bar12: TdxBar;
    dxBarLargeButton36: TdxBarLargeButton;
    dxBarLargeButton37: TdxBarLargeButton;
    dxTileControl1Item13: TdxTileControlItem;
    dxTileControl1Item13dxTileControlItemFrame1: TdxTileControlItemFrame;
    dxTileControl1Item13dxTileControlItemFrame2: TdxTileControlItemFrame;
    dxBarLargeButton38: TdxBarLargeButton;
    dxBarLargeButton39: TdxBarLargeButton;
    OpenDialog1: TOpenDialog;
    dxTaskbarProgress1: TdxTaskbarProgress;
    FileSaveDialog1: TFileSaveDialog;
    dxBarButton3: TdxBarButton;
    dxBarLargeButton40: TdxBarLargeButton;
    cxButton1: TcxButton;
    dxNavBar1: TdxNavBar;
    dxNavBar1GroupProduits: TdxNavBarGroup;
    dxNavBar1GroupAchats: TdxNavBarGroup;
    dxNavBar1GroupVentes: TdxNavBarGroup;
    dxNavBar1GroupStock: TdxNavBarGroup;
    dxNavBar1GroupClientsFournissuers: TdxNavBarGroup;
    dxNavBar1GroupUtilisateurs: TdxNavBarGroup;
    dxNavBar1GroupParametres: TdxNavBarGroup;
    procedure dxTileControlVenteDetailClick(Sender: TdxTileControlItem);
    procedure dxTileControlVenteGrosClick(Sender: TdxTileControlItem);
    procedure dxTileControl1Item2Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item12Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item8Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item9Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item5Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item6Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item1Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item3Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item4Click(Sender: TdxTileControlItem);
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarLargeButton12Click(Sender: TObject);
    procedure dxBarLargeButton13Click(Sender: TObject);
    procedure dxBarLargeButton14Click(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
    procedure dxBarLargeButton15Click(Sender: TObject);
    procedure dxBarLargeButton19Click(Sender: TObject);
    procedure dxBarLargeButton18Click(Sender: TObject);
    procedure dxBarLargeButton16Click(Sender: TObject);
    procedure dxBarLargeButton17Click(Sender: TObject);
    procedure dxBarLargeButton20Click(Sender: TObject);
    procedure dxBarLargeButton21Click(Sender: TObject);
    procedure dxBarLargeButton22Click(Sender: TObject);
    procedure dxBarLargeButton24Click(Sender: TObject);
    procedure dxBarLargeButton23Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton26Click(Sender: TObject);
    procedure dxBarLargeButton27Click(Sender: TObject);
    procedure dxBarLargeButton36Click(Sender: TObject);
    procedure dxBarLargeButton37Click(Sender: TObject);
    procedure dxTileControl1Item13Click(Sender: TdxTileControlItem);
    procedure dxBarLargeButton38Click(Sender: TObject);
    procedure vente(ch:string;typvente:integer);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarLargeButton33Click(Sender: TObject);
    procedure dxBarLargeButton32Click(Sender: TObject);
    procedure dxBarLargeButton40Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormDashBoard: TFormDashBoard;
  searchResult : TSearchRec;

implementation

{$R *.dfm}

uses UnitVenteComptoir, UnitDelivrence, UnitEtatStock, UnitProduits, UnitClients, UnitFournisseurs, UnitNotifications, UnitFacturation, UnitListeFactures, UnitTypeProd,
  UnitTempsNotification, UnitGestionUtilisateurs , UnitConnexion, UnitBenefices, UnitAccueil, UnitParametrage, UnitLirePrix, UnitSauvegarde,DataVenteUnit,
  DataStocksUnite, DataParametrageUnite, UnitFrais;

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

procedure TFormDashBoard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FormAccueil.close;
end;

function Privilege(x:integer):boolean;
begin
  if DataParametrage.FDQueryLoginUser.FieldValues['privilege']<x then
     result:=true
  else
  begin
    result:=false;
    showmessage('  صلاحيات المستخدم الخاصة بك لاتسمح لك بإجراء هذه العملية  ');
  end;
end;

procedure TFormDashBoard.FormShow(Sender: TObject);
begin
if width<1600 then
begin
   dxTileControl1.OptionsView.ItemWidth:=180;
   dxTileControl1.OptionsView.ItemHeight:=163;
end;


//label3.Caption:=GetMotherBoardSerial;
if DataParametrage.FDTableActivation.RecordCount=0 then
begin
    DataParametrage.FDTableActivation.Insert;
    DataParametrage.FDTableActivation.FieldValues['cle']:=GetMotherBoardSerial;
    DataParametrage.FDTableActivation.Next;
    end
    else
    if DataParametrage.FDTableActivation.RecordCount=1 then
    begin
    if (DataParametrage.FDTableActivation.FieldValues['cle']<>GetMotherBoardSerial) then
    close;
    end
    else
    close;
    //DataModule1.FD37TableSortie.Active:=false;
    //DataModule1.FD37TableSortie.Active:=true;
    //if DataModule1.FD37TableSortie.RecordCount>5000 then
    //close;
    //MessageDlg('هذا البرنامج عبارة عن نسخة تجريبية. تسمح بإجراء 5000 عملية بيع كحد أقصى',mtInformation,[mbOK],0);
//    DataParametrage.FDTableType.First;
//    while not DataParametrage.FDTableType.Eof do
//    begin
//      DataStocks.FDQueryTypeProdStock.Params.ParamValues['x']:=DataParametrage.FDTableType.FieldValues['type'];
//      DataStocks.FDQueryTypeProdStock.Active:=false;
//      DataStocks.FDQueryTypeProdStock.Active:=true;
//      while not DataStocks.FDQueryTypeProdStock.Eof do
//         begin
//           //form12.Label1.Caption:=floattostr(DataStocks.FDQueryTypeProdStock.FieldValues['dateconsm']-date);
//           //form18.Show;
//           if DataStocks.FDQueryTypeProdStock.FieldValues['dateconsm']+DataParametrage.FDTableType.FieldValues['dure']>date then
//           begin
//             if DataStocks.FDQueryTypeProdStock.FieldValues['dateconsm']<=date then
//              begin
//                 DataStocks.FDQueryTypeProdStock.Edit;
//                 DataStocks.FDQueryTypeProdStock.FieldValues['alert']:=false;
//                 DataStocks.FDQueryTypeProdStock.FieldValues['expire']:=true;
//                 DataStocks.FDQueryTypeProdStock.Post;
//
//              end
//              else
//              begin
//                 DataStocks.FDQueryTypeProdStock.Edit;
//                 DataStocks.FDQueryTypeProdStock.FieldValues['alert']:=true;
//                 DataStocks.FDQueryTypeProdStock.FieldValues['expire']:=false;
//                 DataStocks.FDQueryTypeProdStock.Post;
//              end;
//           end;
//           DataStocks.FDQueryTypeProdStock.Next;
//         end;
//    DataParametrage.FDTableType.Next;
//    end;

    case DataParametrage.FDQueryLoginUser.FieldValues['privilege'] of
    1:begin
      FormGestionUtilisateurs.PageControl1.Pages[1].TabVisible:=false;
      FormGestionUtilisateurs.PageControl1.Pages[2].TabVisible:=false;
      end;
    2:begin
      FormGestionUtilisateurs.PageControl1.Pages[1].TabVisible:=false;
      FormGestionUtilisateurs.PageControl1.Pages[2].TabVisible:=false;
      end;
    end;
   if DataParametrage.FDTableParametrage.FieldValues['Acitivite']=2 then
   begin
    dxTileControlVenteDetail.Visible:=false;
    dxTileControlVentreGrosFrame1.Text1.Value:='عملية تسليم';
    dxTileControlVentreGrosFrame2.Text1.Value:='عملية تسليم';
   end;

end;
procedure TFormDashBoard.dxTileControlVenteGrosClick(Sender: TdxTileControlItem);
var myYear, myMonth, myDay : Word;
begin
if DataParametrage.FDTableParametrage.FieldValues['Acitivite']=1 then
   vente('   بيع بالجملة     ',2)
else vente('  عملية تسليم   ',2)
end;

procedure TFormDashBoard.vente(ch:string;typvente:integer);

begin
    with FormVenteComptoir do
    if Privilege(3) then
    begin
        FormVenteComptoir.Panel1.Caption:=ch;
        FormVenteComptoir.Caption:=ch;
        DataModuleVente.NouvelleOpr(typvente);
        FormVenteComptoir.show;
    end;
end;


procedure TFormDashBoard.cxButton1Click(Sender: TObject);
begin
if dxNavBar1.Width>0 then
begin
  dxNavBar1.Width:=0;
  cxButton1.Caption:='>>';
end
  else
  begin
   dxNavBar1.Width:=250;
   cxButton1.Caption:='<<';
  end;
end;

procedure TFormDashBoard.dxBarLargeButton11Click(Sender: TObject);
begin
if Privilege(2) then
FormTypeProd.show;
end;

procedure TFormDashBoard.dxBarLargeButton12Click(Sender: TObject);
begin
if Privilege(2) then
FormProduits.show;
end;

procedure TFormDashBoard.dxBarLargeButton13Click(Sender: TObject);
begin
if Privilege(2) then
FormTempsNotification.show;
end;

procedure TFormDashBoard.dxBarLargeButton14Click(Sender: TObject);
begin
if Privilege(2) then
FormParametrage.show;
end;

procedure TFormDashBoard.dxBarLargeButton15Click(Sender: TObject);
begin
if Privilege(2) then
FormEtatStock.show;
end;

procedure TFormDashBoard.dxBarLargeButton16Click(Sender: TObject);
begin
if Privilege(2) then
formFacturation.show;
end;

procedure TFormDashBoard.dxBarLargeButton17Click(Sender: TObject);
begin
if Privilege(2) then
FormListeFactures.show;
end;

procedure TFormDashBoard.dxBarLargeButton18Click(Sender: TObject);
begin
if Privilege(2) then
begin
FormNotifications.f:=2;
FormNotifications.Show;
end;
end;

procedure TFormDashBoard.dxBarLargeButton19Click(Sender: TObject);
begin
if Privilege(2) then
begin
FormNotifications.f:=1;
FormNotifications.show;
end;
end;

procedure TFormDashBoard.dxBarLargeButton20Click(Sender: TObject);
begin
if Privilege(2) then
FormClients.show;
end;

procedure TFormDashBoard.dxBarLargeButton21Click(Sender: TObject);
begin
if Privilege(2) then
FormFournisseurs.show;
end;

procedure TFormDashBoard.dxBarLargeButton22Click(Sender: TObject);
begin
if Privilege(1) then
begin
FormGestionUtilisateurs.show;
FormGestionUtilisateurs.PageControl1.TabIndex:=1;
end;
end;

procedure TFormDashBoard.dxBarLargeButton23Click(Sender: TObject);
begin
FormGestionUtilisateurs.show;
FormGestionUtilisateurs.PageControl1.TabIndex:=0;
end;

procedure TFormDashBoard.dxBarLargeButton24Click(Sender: TObject);
begin
if Privilege(1) then
begin
FormGestionUtilisateurs.show;
FormGestionUtilisateurs.PageControl1.TabIndex:=2;
end;
end;

procedure TFormDashBoard.dxBarLargeButton26Click(Sender: TObject);
begin
FormBenifices.show;
end;

procedure TFormDashBoard.dxBarLargeButton27Click(Sender: TObject);
begin
if Privilege(1) then
FormBenifices.Show;
end;

procedure TFormDashBoard.dxBarLargeButton32Click(Sender: TObject);
var FileName,sql:string;
    myYear, myMonth, myDay : Word;
begin
DecodeDate(Date, myYear, myMonth, myDay);
FileName:='d:\stockBackUp'+'$'+inttostr(myDay)+'$'+inttostr(myMonth)+'$'+inttostr(myYear)+'.bak';
formSauvegarde.show;
begin
    //  Note:  beware the 'with replace' in the following
    Sql := 'USE [MASTER] backup database stock to disk = ''%s''';
    Sql := Format(Sql, [FileName]);
    try

      formSauvegarde.Close;
      showmessage('      تم حفظ نسخة إحتياطية من البيانات بنجاح       ');
    finally
    end;
  end
end;

procedure TFormDashBoard.dxBarLargeButton33Click(Sender: TObject);
var FileName,sql:string;
begin
if OpenDialog1.Execute then
  FileName:= OpenDialog1.FileName ;
if FileExists(FileName) then begin
    //  Note:  beware the 'with replace' in the following
    Sql := 'USE [MASTER] restore database stock from disk = ''%s'' with replace, stats=5';
    Sql := Format(Sql, [FileName]);
    try

      //DataModule1.FDConnection1.ExecSQL(Sql);
      formSauvegarde.Close;
      showmessage('      تم إسترجاع النسخة الإحتياطية من البيانات بنجاح       ');
    finally
    end;
  end

end;

procedure TFormDashBoard.dxBarLargeButton36Click(Sender: TObject);
begin
FormDelivrence.Show;
FormDelivrence.ComboBox1.ItemIndex:=1;
//Form12.ComboBox1Change(form37);
end;

procedure TFormDashBoard.dxBarLargeButton37Click(Sender: TObject);
begin
FormListeFactures.Show;
FormListeFactures.ComboBox1.ItemIndex:=0;
end;

procedure TFormDashBoard.dxBarLargeButton38Click(Sender: TObject);
begin
FormLirePrix.Show;
end;

procedure TFormDashBoard.dxBarLargeButton40Click(Sender: TObject);
begin
FormFrais.show;
end;

procedure TFormDashBoard.dxBarLargeButton7Click(Sender: TObject);
begin
vente('   بيع بالتجزئة     ',1);
end;

procedure TFormDashBoard.dxBarLargeButton8Click(Sender: TObject);
begin
vente('   بيع بالجملة     ',2);
end;

procedure TFormDashBoard.dxBarLargeButton9Click(Sender: TObject);
begin
if Privilege(2) then
FormDelivrence.show;
end;



procedure TFormDashBoard.dxTileControl1Item12Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
FormEtatStock.show;
end;

procedure TFormDashBoard.dxTileControl1Item13Click(Sender: TdxTileControlItem);
begin
FormLirePrix.show;
end;

procedure TFormDashBoard.dxTileControl1Item1Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
FormProduits.show;
end;

procedure TFormDashBoard.dxTileControl1Item2Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
FormDelivrence.show;
end;

procedure TFormDashBoard.dxTileControl1Item3Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
formFacturation.NouvelleFactureForm();
end;

procedure TFormDashBoard.dxTileControl1Item4Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
FormListeFactures.show;
end;

procedure TFormDashBoard.dxTileControl1Item5Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
FormClients.show;
end;

procedure TFormDashBoard.dxTileControl1Item6Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
FormFournisseurs.show;
end;




procedure TFormDashBoard.dxTileControlVenteDetailClick(Sender: TdxTileControlItem);

begin
vente('   بيع بالتجزئة     ',1);
end;

procedure TFormDashBoard.dxTileControl1Item8Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
begin
FormNotifications.f:=1;
FormNotifications.show;
end;
end;

procedure TFormDashBoard.dxTileControl1Item9Click(Sender: TdxTileControlItem);
begin
if Privilege(2) then
begin
FormNotifications.f:=2;
FormNotifications.Show;
end;
end;



end.
