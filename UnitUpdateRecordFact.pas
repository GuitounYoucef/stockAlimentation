unit UnitUpdateRecordFact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls;

type
  TFormUpdateRecordFact = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    EditQuantite: TEdit;
    EditPrixAchat: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    EditPrixVenteDetail: TEdit;
    Label4: TLabel;
    EditPrixVenteGros: TEdit;
    Label5: TLabel;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormUpdateRecordFact: TFormUpdateRecordFact;

implementation

{$R *.dfm}

end.
