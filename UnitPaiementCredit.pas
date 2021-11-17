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
    procedure PaimentFactureShow(som:real);
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
  UnitDelivrenceData, DataStocksUnite;
//------------------------------------------------------------------------------
procedure TFormPaiementCredit.PaimentFactureShow(som:real);
begin
    fenetre:=8;
    EditSom.Text:=inttostr(trunc(som));
    editrest.text:=inttostr(trunc(som));
    show;
end;
//------------------------------------------------------------------------------
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
                  DataFacturation.FDQueryFacturePayee.Edit;
                  DataFacturation.FDQueryFacturePayee.FieldValues['total']:=strtofloat(editsom.Text);
                  DataFacturation.FDQueryFacturePayee.FieldValues['reste']:=strtofloat(editrest.Text);
                  if strtofloat(editsom.Text)=strtofloat(editrest.Text) then
                     DataFacturation.FDQueryFacturePayee.FieldValues['TypePaiement']:=3;
                  DataFacturation.FDQueryFacturePayee.Post;
                  DataFacturation.FDQueryFacturePayee.Active:=false;
                  DataFacturation.FDQueryFacturePayee.Active:=true;
                  FormPaiementCredit.close;
                  DataFacturation.FDQueryFacturePayeeAfterScroll(DataFacturation.FDQueryFacturePayee);
                  end;
              end;
          end;

        8: begin            // Paiment de la facture
            if strtofloat(editrest.Text)>=0 then
                  begin
                    DataFacturation.ValiderMontant(strtofloat(editsom.Text),strtofloat(editrest.Text));
                    DataFacturation.EnregistrerFacture();
                    formFacturation.valide:=true;

                    with formFacturation do
                    begin
                        //DataStocks.EntreeFacture(DataFacturation.FDQueryFactureRecords,destination);
                        close;
                        valide:=true;
                    end;
                   close;
                  end;
           end;
end;
end;
//------------------------------------------------------------------------------
procedure TFormPaiementCredit.BitBtn2Click(Sender: TObject);
begin
    close;
end;
//------------------------------------------------------------------------------
procedure TFormPaiementCredit.Button1Click(Sender: TObject);
begin
    editpaie.Text :=editsom.Text;
end;
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
procedure TFormPaiementCredit.FormShow(Sender: TObject);
begin
//editpaie.text:='0';
end;

end.
