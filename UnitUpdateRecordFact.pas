unit UnitUpdateRecordFact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB;

type
  TFormUpdateRecordFact = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    DBEditQuantite: TDBEdit;
    DBEditPrixAchat: TDBEdit;
    DBEditPrixVente: TDBEdit;
    DBEditPrixVenteGros: TDBEdit;
    DataSourceFactureEntrante: TDataSource;
    procedure DBEditQuantiteEnter(Sender: TObject);
    procedure DBEditQuantiteExit(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormUpdateRecordFact: TFormUpdateRecordFact;
  QntInitial:real;



implementation

{$R *.dfm}
uses DataFacturationUnite,DataStocksUnite;
procedure TFormUpdateRecordFact.DBEditQuantiteEnter(Sender: TObject);

begin
  QntInitial:=DataFacturation.FDQueryFactureRecords.FieldValues['Quantite'];
end;

procedure TFormUpdateRecordFact.DBEditQuantiteExit(Sender: TObject);
var qntstock:real;
begin
//qntstock:=QntInitial-DataFacturation.FDQueryFactureEntrante.FieldValues['Quantite'];
//if not DataStocks.UpDateQntProdByNameCodeSockid(DataFacturation.FDQueryFactureEntrante.FieldValues['id']
//                                                ,DataFacturation.FDQueryFactureEntrante.FieldValues['Code']
//                                                ,DataFacturation.FDQueryFacture.FieldValues['NumDestination']
//                                                ,DataFacturation.FDQueryFactureEntrante.FieldValues['Quantite']) then
//   begin
//       DataFacturation.FDQueryFactureEntrante.Edit;
//       DataFacturation.FDQueryFactureEntrante.FieldValues['Quantite']:=QntInitial;
//       DataFacturation.FDQueryFactureEntrante.Post;
//   end;
end;

end.
