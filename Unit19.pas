unit Unit19;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus;

type
  TForm19 = class(TForm)
    GridPanel4: TGridPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    SearchBox1: TSearchBox;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    ToggleSwitch1: TToggleSwitch;
    ToggleSwitch2: TToggleSwitch;
    GridPanel2: TGridPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid5: TDBGrid;
    Edittotal: TEdit;
    Edit1: TEdit;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

end.
