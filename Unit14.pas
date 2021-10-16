unit Unit14;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm14 = class(TForm)
    Panel1: TPanel;
    Panel7: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    ComboBoxService: TComboBox;
    ComboBoxNomPrenom: TComboBox;
    EditDate: TEdit;
    ComboBoxAnnee: TComboBox;
    Panel6: TPanel;
    Image1: TImage;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

end.
