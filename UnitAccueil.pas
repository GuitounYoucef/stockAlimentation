unit UnitAccueil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  dxGDIPlusClasses, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TFormAccueil = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    Label3: TLabel;
    Image2: TImage;
    Image3: TImage;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormAccueil: TFormAccueil;

implementation

{$R *.dfm}

uses UnitConnexion, UnitDashBoard;

procedure TFormAccueil.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled:=true;
visible:=false;
Timer1.Enabled:=false;
FormConnexion.show;
FormConnexion.Visible:=true;
end;

end.
