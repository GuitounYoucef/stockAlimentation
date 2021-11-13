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
    FDQueryClientByName: TFDQuery;
    FDQueryType: TFDQuery;
    FDQueryProducteur: TFDQuery;
    FDTableUsers: TFDTable;
    FDTableActivation: TFDTable;
    FDTableType: TFDTable;
    FDTableSortieExpire: TFDTable;
    function Login(user,password:string):boolean;
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
end.
