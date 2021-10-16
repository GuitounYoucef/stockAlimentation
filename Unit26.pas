unit Unit26;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.WinXCtrls, Vcl.DBCtrls;

type
  TForm26 = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    GridPanel4: TGridPanel;
    GridPanel5: TGridPanel;
    GridPanel6: TGridPanel;
    GridPanel7: TGridPanel;
    Image3: TImage;
    Image2: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    Edit2: TEdit;
    Button8: TButton;
    Button1: TButton;
    ComboBoxType: TComboBox;
    ComboBoxProducteur: TComboBox;
    ComboBoxProduit: TComboBox;
    EditPrixAchat: TEdit;
    EditPrixVente: TEdit;
    EditPrixVenteGros: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    EditQunt: TEdit;
    Label12: TLabel;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    GridPanel3: TGridPanel;
    ComboBoxAnnee: TComboBox;
    EditNum: TEdit;
    EditDate: TEdit;
    ComboBoxFournisseur: TComboBox;
    GridPanel8: TGridPanel;
    Button2: TButton;
    Label13: TLabel;
    Edittotal: TEdit;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form26: TForm26;

implementation

{$R *.dfm}

end.
