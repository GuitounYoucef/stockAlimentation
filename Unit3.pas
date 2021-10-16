unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.Win.ADODB,
  Vcl.DBCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    Image1: TImage;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
if length(edit1.Text)>0 then
begin
ADOTable1.Insert;
ADOTable1.FieldValues['Id']:=edit1.Text;
ADOTable1.FieldValues['Note']:=edit2.Text;
edit1.Clear;
edit2.Clear;
ADOTable1.Next;
end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
if ADOTable1.RecordCount>0 then
DBNavigator1.BtnClick(nbdelete);
end;

procedure TForm3.FormShow(Sender: TObject);
begin
LoadKeyboardLayout('00000401', KLF_ACTIVATE);
end;

end.
