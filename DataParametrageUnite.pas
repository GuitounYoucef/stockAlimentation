unit DataParametrageUnite;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataParametrage = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTableImprimante: TFDTable;
    FDQueryClientByCatg: TFDQuery;
    FDTableParametrage: TFDTable;
    FDQuerystockByid: TFDQuery;
    FDQueryFounisseurByName: TFDQuery;
    FDQueryLoginUser: TFDQuery;
    FDQueryClientByNameLike: TFDQuery;
    FDQueryType: TFDQuery;
    FDQueryProducteur: TFDQuery;
    FDTableUsers: TFDTable;
    FDTableActivation: TFDTable;
    FDTableType: TFDTable;
    FDTableSortieExpire: TFDTable;
    FDQueryClientByNum: TFDQuery;
    FDQuery1: TFDQuery;
    FDQueryClientParNom: TFDQuery;
    function Login(user,password:string):boolean;
    procedure TrouverClientParNum(NumClient:integer);
    function TrouverNumClientParNom(NomClient:string):integer;
    procedure selectClient(name:string);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataParametrage: TDataParametrage;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataParametrage }
//------------------------------------------------------------------------------
function TDataParametrage.Login(user, password: string): boolean;
begin
result:=false;
  if ((length(user)>0) and (length(password)>0)) then
      begin
        DataParametrage.FDQueryLoginUser.Params.ParamValues['x']:=user;
        DataParametrage.FDQueryLoginUser.Params.ParamValues['y']:=password;
        DataParametrage.FDQueryLoginUser.Active:=false;
        DataParametrage.FDQueryLoginUser.Active:=true;
        if DataParametrage.FDQueryLoginUser.RecordCount=1 then
           result:=true
      end;
end;
//------------------------------------------------------------------------------
procedure TDataParametrage.selectClient(name: string);
begin
    if name='**' then
    FDQueryClientByNameLike.Params.ParamValues['x']:='%%'
    else
    FDQueryClientByNameLike.Params.ParamValues['x']:='%'+name+'%';
    FDQueryClientByNameLike.Active:=false;
    FDQueryClientByNameLike.Active:=true;
end;

function TDataParametrage.TrouverNumClientParNom(NomClient: string):integer;
begin
    FDQueryClientParNom.Params.ParamValues['x']:=NomClient;
    FDQueryClientParNom.Active:=false;
    FDQueryClientParNom.Active:=true;
    result:= FDQueryClientParNom.FieldValues['NumClient'];
end;

procedure TDataParametrage.TrouverClientParNum(NumClient: integer);
begin
   FDQueryClientByNum.Params.ParamValues['Num']:=NumClient;
   FDQueryClientByNum.Close;
   FDQueryClientByNum.Open();
end;

end.
