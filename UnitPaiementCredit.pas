unit UnitPaiementCredit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TFormPaiementCredit = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditSom: TEdit;
    EditPaie: TEdit;
    EditRest: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure EditPaieChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PaimentFactureShow(som:longint);
  private

    { Déclarations privées }
  public
  var fenetre:integer;
    { Déclarations publiques }
  end;

var
  FormPaiementCredit: TFormPaiementCredit;

implementation

{$R *.dfm}

uses UnitFacturation, UnitListeFactures, UnitDelivrence,unit36,DataFacturationUnite,
  UnitDelivrenceData;

procedure TFormPaiementCredit.PaimentFactureShow(som:longint);
begin
fenetre:=8;
EditSom.Text:=inttostr(trunc(som));
editrest.text:=inttostr(trunc(som));
show;
end;


procedure TFormPaiementCredit.BitBtn1Click(Sender: TObject);
begin
    case fenetre of
        12: begin
            if strtofloat(editrest.Text)>=0 then
            begin
              DataModuleDelivrence.UpDateCredit(strtofloat(editsom.Text),strtofloat(editPaie.Text));
              close;
            end;
        end;


        34: begin
            if strtofloat(editrest.Text)>=0 then
            begin
              with FormListeFactures do
                begin
                DataModule1.FD34QueryFacPaie.Edit;
                DataModule1.FD34QueryFacPaie.FieldValues['total']:=strtofloat(editsom.Text);
                DataModule1.FD34QueryFacPaie.FieldValues['reste']:=strtofloat(editrest.Text);
                if strtofloat(editsom.Text)=strtofloat(editrest.Text) then
                   DataModule1.FD34QueryFacPaie.FieldValues['TypePaiement']:=3;
                DataModule1.FD34QueryFacPaie.Post;
                DataModule1.FD34QueryFacPaie.Active:=false;
                DataModule1.FD34QueryFacPaie.Active:=true;
                FormPaiementCredit.close;
                dataModule1.FD34QueryFacPaieAfterScroll(DataModule1.FD34QueryFacPaie);
                end;
            end;
        end;

        8: begin            // Paiment de la facture
            if strtofloat(editrest.Text)>=0 then
                  begin
                    DataFacturation.ValiderMontant(strtofloat(editsom.Text),strtofloat(editrest.Text));
                    DataFacturation.NouvelleFacture();
                    formFacturation.valide:=true;

                    with formFacturation do
                    begin
                    DataModule1.FDQueryFacture8.First;
                      while not DataModule1.FDQueryFacture8.Eof do
                          begin
                            DataModule1.FDQueryStock8.Insert;
                            DataModule1.FDQueryStock8.FieldValues['id']:=DataModule1.FDQueryFacture8.FieldValues['id'];
                            DataModule1.FDQueryStock8.FieldValues['type']:=DataModule1.FDQueryFacture8.FieldValues['type'];
                            DataModule1.FDQueryStock8.FieldValues['producteur']:=DataModule1.FDQueryFacture8.FieldValues['producteur'];
                            DataModule1.FDQueryStock8.FieldValues['Quantite']:=DataModule1.FDQueryFacture8.FieldValues['Quantite'];
                            DataModule1.FDQueryStock8.FieldValues['PrixAchat']:=DataModule1.FDQueryFacture8.FieldValues['PrixAchat'];
                            DataModule1.FDQueryStock8.FieldValues['PrixVente']:=DataModule1.FDQueryFacture8.FieldValues['PrixVente'];
                            DataModule1.FDQueryStock8.FieldValues['QuantiteLot']:=DataModule1.FDQueryFacture8.FieldValues['QuantiteLot'];
                            DataModule1.FDQueryStock8.FieldValues['PrixVenteGros']:=DataModule1.FDQueryFacture8.FieldValues['PrixVenteGros'];
                            DataModule1.FDQueryStock8.FieldValues['DateProd']:=DataModule1.FDQueryFacture8.FieldValues['DateProd'];
                            DataModule1.FDQueryStock8.FieldValues['DateConsm']:=DataModule1.FDQueryFacture8.FieldValues['DateConsm'];
                            DataModule1.FDQueryStock8.FieldValues['numstock']:=DataModule1.FDQueryFacture8.FieldValues['numstock'];
                            DataModule1.FDQueryStock8.FieldValues['code']:=DataModule1.FDQueryFacture8.FieldValues['code'];
                            DataModule1.FDQueryStock8.FieldValues['balance']:=DataModule1.FDQueryFacture8.FieldValues['balance'];
                            DataModule1.FDQueryStock8.FieldValues['dateentree']:=date;
                            DataModule1.FDQueryStock8.FieldValues['expire']:=false;
                            DataModule1.FDQueryStock8.FieldValues['alert']:=false;
                            DataModule1.FDQueryStock8.Next;
                          DataModule1.FDQueryFacture8.Next;
                          end;
                    close;
                    valide:=true;
                    end;
                   close;
                  end;
           end;
end;

end;

procedure TFormPaiementCredit.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFormPaiementCredit.Button1Click(Sender: TObject);
begin
editpaie.Text :=editsom.Text;
end;



procedure TFormPaiementCredit.EditPaieChange(Sender: TObject);
var x:real;
begin
x:=strtofloat(editsom.Text)-strtofloat(editpaie.Text);
if x>=0 then
editrest.Text:=floattostr(x)
else
begin
MessageDlg('المبلغ المدفوع أكبر من المبلغ المستحق', mtInformation, [mbOK], 0);
editpaie.Text:='0';
end;
end;

procedure TFormPaiementCredit.FormShow(Sender: TObject);
begin
//editpaie.text:='0';
end;

end.
