unit Unit32;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm32 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditSom: TEdit;
    EditPaie: TEdit;
    EditRest: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
  var total,rest:real;
    { Déclarations publiques }
  end;

var
  Form32: TForm32;

implementation

{$R *.dfm}

procedure TForm32.FormShow(Sender: TObject);
begin
EditSom.Text:=floattostr(trunc(total));
EditRest.Text:=floattostr(trunc(rest));
EditPaie.Text:=floattostr(trunc(total)-trunc(rest));
end;

end.
