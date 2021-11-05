program stokeAlimentation;
uses
  Vcl.Forms,
  UnitVenteComptoir in 'UnitVenteComptoir.pas' {FormVenteComptoir},
  UnitClients in 'UnitClients.pas' {FormClients},
  UnitEtatStock in 'UnitEtatStock.pas' {FormEtatStock},
  UnitProduits in 'UnitProduits.pas' {FormProduits},
  UnitFacturation in 'UnitFacturation.pas' {FormFacturation},
  UnitTypeProd in 'UnitTypeProd.pas' {FormTypeProd},
  UnitFournisseurs in 'UnitFournisseurs.pas' {FormFournisseurs},
  UnitDelivrence in 'UnitDelivrence.pas' {FormDelivrence},
  UnitConnexion in 'UnitConnexion.pas' {FormConnexion},
  UnitPrixQntUpDateVente in 'UnitPrixQntUpDateVente.pas' {FormPrixQntUpDateVente},
  UnitTempsNotification in 'UnitTempsNotification.pas' {FormTempsNotification},
  UnitNotifications in 'UnitNotifications.pas' {FormNotifications},
  Vcl.Themes,
  Vcl.Styles,
  UnitPaiementCredit in 'UnitPaiementCredit.pas' {FormPaiementCredit},
  UnitGestionUtilisateurs in 'UnitGestionUtilisateurs.pas' {FormGestionUtilisateurs},
  UnitRechercheStock in 'UnitRechercheStock.pas' {FormRechercheStock},
  UnitRechercheNomProduit in 'UnitRechercheNomProduit.pas' {FormRechercheNomProduit},
  UnitBenifices in 'UnitBenifices.pas' {FormBenifices},
  UnitAjouterProduits in 'UnitAjouterProduits.pas' {FormAjouterProduits},
  UnitStockDetail in 'UnitStockDetail.pas' {FormStockDetail},
  UnitListeFactures in 'UnitListeFactures.pas' {FormListeFactures},
  UnitListeVente in 'UnitListeVente.pas' {FormListeVente},
  Unit36 in 'Unit36.pas' {DataModule1: TDataModule},
  UnitDashBoard in 'UnitDashBoard.pas' {FormDashBoard},
  UnitAccueil in 'UnitAccueil.pas' {FormAccueil},
  UnitParametrage in 'UnitParametrage.pas' {FormParametrage},
  UnitLirePrix in 'UnitLirePrix.pas' {FormLirePrix},
  UnitSauvegarde in 'UnitSauvegarde.pas' {FormSauvegarde},
  DataVenteUnit in 'DataVenteUnit.pas' {DataModuleVente: TDataModule},
  UnitDelivrenceData in 'UnitDelivrenceData.pas' {DataModuleDelivrence: TDataModule},
  DataFacturationUnite in 'DataFacturationUnite.pas' {DataFacturation: TDataModule},
  DataProduitsUnite in 'DataProduitsUnite.pas' {DataProduits: TDataModule},
  DataStocksUnite in 'DataStocksUnite.pas' {DataStocks: TDataModule},
  DataParametrageUnite in 'DataParametrageUnite.pas' {DataParametrage: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormAccueil, FormAccueil);
  Application.CreateForm(TFormEtatStock, FormEtatStock);
  Application.CreateForm(TFormDashBoard, FormDashBoard);
  Application.CreateForm(TFormParametrage, FormParametrage);
  Application.CreateForm(TFormLirePrix, FormLirePrix);
  Application.CreateForm(TFormSauvegarde, FormSauvegarde);
  Application.CreateForm(TDataModuleVente, DataModuleVente);
  Application.CreateForm(TDataModuleDelivrence, DataModuleDelivrence);
  Application.CreateForm(TFormConnexion, FormConnexion);
  Application.CreateForm(TFormVenteComptoir, FormVenteComptoir);
  Application.CreateForm(TFormClients, FormClients);
  Application.CreateForm(TFormProduits, FormProduits);
  Application.CreateForm(TFormFacturation, FormFacturation);
  Application.CreateForm(TFormTypeProd, FormTypeProd);
  Application.CreateForm(TFormFournisseurs, FormFournisseurs);
  Application.CreateForm(TFormDelivrence, FormDelivrence);
  Application.CreateForm(TFormPrixQntUpDateVente, FormPrixQntUpDateVente);
  Application.CreateForm(TFormTempsNotification, FormTempsNotification);
  Application.CreateForm(TFormNotifications, FormNotifications);
  Application.CreateForm(TFormPaiementCredit, FormPaiementCredit);
  Application.CreateForm(TFormGestionUtilisateurs, FormGestionUtilisateurs);
  Application.CreateForm(TFormRechercheStock, FormRechercheStock);
  Application.CreateForm(TFormRechercheNomProduit, FormRechercheNomProduit);
  Application.CreateForm(TFormBenifices, FormBenifices);
  Application.CreateForm(TFormAjouterProduits, FormAjouterProduits);
  Application.CreateForm(TFormStockDetail, FormStockDetail);
  Application.CreateForm(TFormListeFactures, FormListeFactures);
  Application.CreateForm(TFormListeVente, FormListeVente);
  Application.CreateForm(TDataFacturation, DataFacturation);
  Application.CreateForm(TDataProduits, DataProduits);
  Application.CreateForm(TDataStocks, DataStocks);
  Application.CreateForm(TDataParametrage, DataParametrage);
  //23

  Application.Run;
end.
