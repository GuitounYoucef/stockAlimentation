﻿unit UnitUpdateRecordFact;

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
    DBEditId: TDBEdit;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    DataSourceFactureEntrante: TDataSource;
    EditQuantite: TEdit;
    EditPrixAchat: TEdit;
    EditPrixVenteDetail: TEdit;
    EditPrixVenteGros: TEdit;
    procedure DBEditQuantiteEnter(Sender: TObject);
    procedure DBEditQuantiteExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormUpdateRecordFact: TFormUpdateRecordFact;
  QntInitial:real;
  QuantiteInitial,Quantite, QuantiteNouv,PrixAchat,PrixVenteDetail,PrixVenteGros:real;



implementation

{$R *.dfm}
uses DataFacturationUnite,DataStocksUnite, UnitFacturation;
procedure TFormUpdateRecordFact.BitBtn1Click(Sender: TObject);
var b:boolean;

begin
    b:=false;
    if (strtofloat(EditPrixAchat.Text)>0) then
    begin
       DataFacturation.FDQueryFactureRecords.Edit;
       if (strtofloat(EditPrixAchat.Text)<>DataFacturation.FDQueryFactureRecords.FieldValues['PrixAchat']) then
          begin
           DataFacturation.FDQueryFactureRecords.FieldValues['PrixAchat']:=strtofloat(EditPrixAchat.Text);

          end;

        if (strtofloat(EditPrixAchat.Text)<=strtofloat(EditPrixVenteGros.Text)) then
           begin
            if (strtofloat(EditPrixVenteGros.Text)<>DataFacturation.FDQueryFactureRecords.FieldValues['PrixVenteGros']) then
             begin
              DataFacturation.FDQueryFactureRecords.FieldValues['PrixVenteGros']:=strtofloat(EditPrixVenteGros.Text);
             end;

              if (strtofloat(EditPrixVenteDetail.Text)>=strtofloat(EditPrixVenteGros.Text)) then
                 begin
                    if (strtofloat(EditPrixVenteDetail.Text)<>DataFacturation.FDQueryFactureRecords.FieldValues['PrixVente']) then
                     begin
                        DataFacturation.FDQueryFactureRecords.FieldValues['PrixVente']:=strtofloat(EditPrixVenteDetail.Text);
                     end;

                    QuantiteInitial:=DataFacturation.FDQueryFactureRecords.FieldValues['QuantiteInitial'];
                    Quantite:=DataFacturation.FDQueryFactureRecords.FieldValues['Quantite'];
                    QuantiteNouv:=strtofloat(EditQuantite.Text);
                    if (QuantiteNouv<>QuantiteInitial)then
                    if (QuantiteNouv>QuantiteInitial) or (QuantiteInitial-QuantiteNouv>=Quantite) or (Quantite=QuantiteInitial) then
                    begin
                      if (strtofloat(EditPrixVenteDetail.Text)<>DataFacturation.FDQueryFactureRecords.FieldValues['PrixVente']) then
                        DataFacturation.FDQueryFactureRecords.FieldValues['PrixVente']:=strtofloat(EditPrixVenteDetail.Text);
                      DataFacturation.FDQueryFactureRecords.FieldValues['Quantite']:=Quantite-(QuantiteInitial-QuantiteNouv);
                      DataFacturation.FDQueryFactureRecords.FieldValues['QuantiteInitial']:=QuantiteNouv;

                    end
                    else showmessage('لا يمكنك تقليص الكمية فقد تم بيع جزء منها');
                 end
                 else showmessage('سعر البيع بالتجزئة يجب أن يكون أكبر  أو يساوي سعلر البيع بالجملة');
           end
           else showmessage('سعر البيع بالجملة يجب أن يكون أكبر من سعر الشراء');
           DataFacturation.FDQueryFactureRecords.Post;
           close;
    end
    else showmessage('سعر البيع يجب أن يكون أكبر من 0');
end;

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

procedure TFormUpdateRecordFact.FormShow(Sender: TObject);
begin
    PrixAchat:=DataFacturation.FDQueryFactureRecords.FieldValues['PrixAchat'];
    PrixVenteDetail:=DataFacturation.FDQueryFactureRecords.FieldValues['PrixVente'];
    PrixVenteGros:=DataFacturation.FDQueryFactureRecords.FieldValues['PrixVenteGros'];

    EditPrixAchat.Text:=floattostr(PrixAchat);
    EditPrixVenteDetail.Text:=floattostr(PrixVenteDetail);
    EditPrixVenteGros.Text:=floattostr(PrixVenteGros);
    EditQuantite.Text:=floattostr(DataFacturation.FDQueryFactureRecords.FieldValues['QuantiteInitial']);
end;

end.
