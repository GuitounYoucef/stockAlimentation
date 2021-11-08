object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 901
  Width = 1531
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=srv-stock'
      'User_Name=sa'
      'Password=Gfcbavaria_1987'
      'Database=stock'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 24
  end
  object FDTableImprimante: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Imprimantes'
    TableName = 'Imprimantes'
    Left = 512
    Top = 480
  end
  object FDQuery11: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Sortie.*'
      'from Sortie'
      
        'where (( Sortie.Annee=:x) and (Sortie.Num=:y) and (Sortie.typeve' +
        'nte=:z))'
      '')
    Left = 200
    Top = 24
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Z'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQueryCredit1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select credit.*'
      'from credit'
      'where (Nomclient=:x) and (ferme=0)')
    Left = 1056
    Top = 336
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object FDQueryClient1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select clients.*'
      'from clients'
      'where catg=:x')
    Left = 504
    Top = 24
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryCodebar1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Stock.*'
      'from Stock'
      
        'where (((Stock.code=:z) or (Stock.id=:x)) and (Stock.Quantite>=:' +
        'q) and (Stock.Numstock=:n))'
      'order by DateConsm;')
    Left = 616
    Top = 24
    ParamData = <
      item
        Name = 'Z'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Q'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'N'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQueryImage1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select produits.*'
      'from produits'
      'where (produits.Code=:x)')
    Left = 728
    Top = 24
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object FDQueryNonrepete1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select Sortie.*'
      'from Sortie'
      
        'where (( Sortie.Annee=:x) and (Sortie.Num=:y) and (Sortie.typeve' +
        'nte=:z) and (Sortie.code=:c)) '
      '')
    Left = 832
    Top = 24
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Z'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'C'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object FDQueryNumVente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct Sortie.num'
      'from Sortie'
      'where (( Sortie.Annee=:x) and (Sortie.typevente=:y)) ')
    Left = 400
    Top = 24
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQueryQuantiteStock16: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select Stock.*'
      'from Stock'
      'where  (Stock.code=:z) and  (Stock.Quantite>=:x)'
      'order by DateConsm;')
    Left = 952
    Top = 24
    ParamData = <
      item
        Name = 'Z'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQuerystockid25: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select stockid.*'
      'from stockid'
      'where stockid.id = :x')
    Left = 72
    Top = 104
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDTableStockid25: TFDTable
    Active = True
    IndexFieldNames = 'id;NumStock'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stockid'
    TableName = 'stockid'
    Left = 416
    Top = 480
  end
  object FDTableParametrage: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Parametrage'
    TableName = 'Parametrage'
    Left = 616
    Top = 480
  end
  object FDQuery115: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select *'
      'from users'
      'where ((users.id=:x) and (users.motpasse=:y))')
    Left = 64
    Top = 208
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDTableUsers15: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Users'
    TableName = 'Users'
    Left = 328
    Top = 480
  end
  object FDQueryProtec15: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct sortie.annee,sortie.num'
      'from sortie')
    Left = 184
    Top = 208
  end
  object FDQueryType: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select type.type'
      'from type')
    Left = 64
    Top = 288
  end
  object FDQueryProducteur: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Producteur.*'
      'from Producteur'
      'where Producteur.Type=:x')
    Left = 152
    Top = 288
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object DataSource91: TDataSource
    DataSet = FDQueryType
    Left = 1260
    Top = 24
  end
  object DataSource92: TDataSource
    DataSet = FDQueryProducteur
    Left = 1356
    Top = 24
  end
  object FDQuery61: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Produits.*'
      'from produits'
      'order by id;')
    Left = 72
    Top = 368
  end
  object FDQuery6Entree: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select id,code'
      'from Entree'
      'where ((id=:x) and (code=:y))'
      'union'
      'select id,code'
      'from stock'
      'where ((id=:x) and (code=:y))')
    Left = 152
    Top = 368
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object DataSource61: TDataSource
    DataSet = FDQuery61
    Left = 1165
    Top = 24
  end
  object FDQueryStock8: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select  Stock.*'
      'from Stock'
      
        'where ( Stock.Id=:x) and ( Stock.PrixAchat=:y) and ( Stock.PrixV' +
        'ente=:z) and ( Stock.DateProd=:p) and ( Stock.DateConsm=:c)'
      '')
    Left = 48
    Top = 560
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Z'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'P'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'C'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object FDQueryFacture8: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Entree.*'
      'from Entree'
      'where(( Entree.Annee=:x) and (Entree.Num=:y))')
    Left = 152
    Top = 560
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQueryFournisseur8: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Fournisseur.*'
      'from Fournisseur')
    Left = 256
    Top = 560
  end
  object FDQueryNumFact8: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct Entree.Num'
      'from Entree'
      'where Entree.Annee=:x')
    Left = 376
    Top = 560
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object FDQueryStockid8: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select id'
      'from stockid'
      'where id<>:x')
    Left = 472
    Top = 560
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQuerySelectFourns8: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Fournisseur.*'
      'from Fournisseur'
      'where nomprenom=:x'
      '')
    Left = 576
    Top = 560
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryCodeProduit: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select produits.*'
      'from produits'
      'where produits.Code=:x'
      '')
    Left = 696
    Top = 560
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDTableFacture8: TFDTable
    Active = True
    IndexFieldNames = 'Num;Annee'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Facture'
    TableName = 'Facture'
    Left = 240
    Top = 480
  end
  object FDQuerystockAll5: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select stockid.id,sum(stock.quantite) as s,stock.id,stock.code,s' +
        'tock.producteur'
      'from stock'
      'inner JOIN stockid '
      'ON (stock.numstock=stockid.numstock)'
      
        'where (stock.numstock>:x) and (stock.numstock<:y) and (stock.id ' +
        'like :i)'
      'group by stockid.id,stock.id,code,producteur;'
      '')
    Left = 48
    Top = 640
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'I'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryStock5: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select  stock.*'
      'from stock')
    Left = 144
    Top = 640
  end
  object FDQueryRechercheStock: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select   sum(quantite) as s,id,code,producteur'
      'from stock'
      'where ( Id like :x)'
      'group by id,code,producteur')
    Left = 264
    Top = 640
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryProduitstock33: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select  stock.*'
      'from stock'
      'where (code=:y)'
      'order by dateentree;')
    Left = 432
    Top = 104
    ParamData = <
      item
        Name = 'Y'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDTableStock33: TFDTable
    Active = True
    IndexFieldNames = 'NUM'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Stock'
    TableName = 'Stock'
    Left = 152
    Top = 480
  end
  object FD8QuerySelectStockId: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select NumStock'
      'from stockid'
      'where id=:x')
    Left = 824
    Top = 560
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FD34QueryFacPaie: TFDQuery
    AfterScroll = FD34QueryFacPaieAfterScroll
    Connection = FDConnection1
    SQL.Strings = (
      'select facture.*'
      'from facture'
      'where TypePaiement=:x')
    Left = 56
    Top = 720
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FD34Querydetail: TFDQuery
    AfterScroll = FD34QuerydetailAfterScroll
    Connection = FDConnection1
    SQL.Strings = (
      'select entree.*'
      'from entree'
      'where ((annee=:x) and (num=:y))')
    Left = 152
    Top = 720
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FD34QueryStockRetourne: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select stock.*'
      'from stock'
      
        'where ((id=:x) and (code=:y) and (numstock=:z) and (expire=0) an' +
        'd (Alert=0) and (quantite>=:q))')
    Left = 264
    Top = 720
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Z'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Q'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FD34QuerySom: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select sum(prixachat*quantite) as s'
      'from entree'
      'where ((annee=:x) and (num=:y))')
    Left = 376
    Top = 720
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FD34TableRetourneFac: TFDTable
    Active = True
    IndexFieldNames = 'Num;Annee'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'RetourneFacture'
    TableName = 'RetourneFacture'
    Left = 48
    Top = 480
  end
  object FDTableProduits: TFDTable
    Active = True
    IndexFieldNames = 'Producteur;Type;Code;id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Produits'
    TableName = 'Produits'
    Left = 712
    Top = 480
  end
  object FD31QueryAlert: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Type.*'
      'from Type'
      'where type=:x')
    Left = 424
    Top = 208
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FD27QueryRechIDProduitstock: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select  Stock.*'
      'from Stock'
      'where stock.Id like :x')
    Left = 432
    Top = 288
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FD10QueryLikeFounisseurNom: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Fournisseur.*'
      'from Fournisseur'
      'where nomprenom like :x'
      'order by num;')
    Left = 712
    Top = 104
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FD2QueryClient: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Clients.*'
      'from Clients'
      'where client like :x'
      'order by type;')
    Left = 704
    Top = 208
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FD17TableDure: TFDTable
    Active = True
    IndexFieldNames = 'NUM'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Type'
    TableName = 'Type'
    Left = 800
    Top = 480
  end
  object FD24TableUsers: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Users'
    TableName = 'Users'
    Left = 888
    Top = 480
  end
  object FD28QueryProduitid: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select  Produits.*'
      'from Produits'
      'where Produits.Id like :x')
    Left = 696
    Top = 712
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FD30QuerySortieDate: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select SortieProduits.*,Sortie.date'
      
        'FROM SortieProduits INNER JOIN Sortie ON SortieProduits.NumOpr =' +
        ' Sortie.NumOpr'
      'where (Sortie.Date>=:x) and (Sortie.Date<=:y) '
      'order by NumOpr;')
    Left = 696
    Top = 640
    ParamData = <
      item
        Name = 'X'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Y'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object FD30Querysomsortie: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select Sortie.date,sum(PrixAchat*Quantite) as achats,sum(PrixVen' +
        'te*Quantite) as ventes'
      
        'FROM SortieProduits INNER JOIN Sortie ON SortieProduits.NumOpr =' +
        ' Sortie.NumOpr'
      'where (Sortie.Date>=:x) and (Sortie.Date<=:y)'
      'group by Sortie.date;')
    Left = 816
    Top = 640
    ParamData = <
      item
        Name = 'X'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Y'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object FD35TableRetourndeliv: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'RetourneDelivrence'
    TableName = 'RetourneDelivrence'
    Left = 992
    Top = 480
  end
  object FD35QueryStockRetourn: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select stock.*'
      'from stock'
      'where ((id=:x) and (code=:y) and (numstock=:z))')
    Left = 432
    Top = 368
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Z'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FD35QueryListeVente: TFDQuery
    Active = True
    AfterScroll = FD35QueryListeVenteAfterScroll
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct Annee,Num,typevente,client'
      'from Sortie'
      'where (Sortie.typevente=:x)'
      'order by annee,num;')
    Left = 584
    Top = 368
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FD35QueryDetailListe: TFDQuery
    Active = True
    AfterScroll = FD35QueryDetailListeAfterScroll
    Connection = FDConnection1
    SQL.Strings = (
      'select sortie.*'
      'from Sortie'
      'where ((annee=:x) and (num=:y) and (typevente=:z))')
    Left = 712
    Top = 368
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Z'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FD35Querysomlistedetail: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select sum(prixvente*quantite) as s'
      'from sortie'
      'where ((annee=:x) and (num=:y))')
    Left = 856
    Top = 368
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FD18QueryAlert: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select stock.* '
      'from stock '
      'where alert=0')
    Left = 1168
    Top = 104
  end
  object FD18QueryExpire: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select stock.* '
      'from stock '
      'where (expire=1) and (quantite>0)')
    Left = 1272
    Top = 104
  end
  object FD37TableActivation: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Activation'
    TableName = 'Activation'
    Left = 1104
    Top = 480
  end
  object FD37TableType: TFDTable
    Active = True
    IndexFieldNames = 'NUM'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Type'
    TableName = 'Type'
    Left = 1200
    Top = 480
  end
  object FD37TableSortie: TFDTable
    IndexFieldNames = 'Code;typevente;Num;Annee'
    AggregatesActive = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Sortie'
    TableName = 'Sortie'
    Left = 1296
    Top = 480
  end
  object FD37QueryTypeStock: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select stock.*'
      'from stock'
      'where type=:x')
    Left = 1176
    Top = 184
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FD30QueryorderProduit: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select id, sum(quantite) as q,sum(quantite*(prixvente-prixachat)' +
        ') as p '
      
        'FROM SortieProduits INNER JOIN Sortie ON SortieProduits.NumOpr =' +
        ' Sortie.NumOpr'
      'where (Sortie.Date>=:x) and (Sortie.Date<=:y)'
      'group by id;'
      '')
    Left = 944
    Top = 640
    ParamData = <
      item
        Name = 'X'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Y'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object FD30QueryOrderUtilisateur: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT users.id,sum(quantite*prixvente) as v,sum(quantite*(prixv' +
        'ente-prixachat)) as b'
      
        'FROM SortieProduits INNER JOIN Sortie ON SortieProduits.NumOpr =' +
        ' Sortie.NumOpr'
      'inner JOIN users '
      'ON (Sortie.numuser=users.numuser)'
      'where (Sortie.Date>=:x) and (Sortie.Date<=:y)'
      'group by  users.id;'
      ''
      ''
      ''
      '')
    Left = 1096
    Top = 640
    ParamData = <
      item
        Name = 'X'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Y'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object FD5Querysom: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select sum(quantite*prixachat) as a,sum(quantite*prixvente) as v' +
        ',sum(quantite*(prixvente-prixachat)) as b'
      'from stock'
      
        'where (stock.numstock>:x) and (stock.numstock<:y) and (stock.id ' +
        'like :i)'
      '')
    Left = 376
    Top = 640
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'I'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDTableSortieExpire: TFDTable
    IndexFieldNames = 'Num;Annee'
    AggregatesActive = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = '[Sortie-Expire]'
    TableName = '[Sortie-Expire]'
    Left = 1400
    Top = 480
  end
  object FD18QueryExpireRecordCount: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct [sortie-expire].annee,[sortie-expire].num '
      'from [sortie-expire]'
      'where annee=:a')
    Left = 1400
    Top = 104
    ParamData = <
      item
        Name = 'A'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 960
    Top = 112
  end
  object FDQRestore: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'USE [MASTER]'
      'restore database stock'
      'from disk =:path'
      'with replace, stats=5')
    Left = 1096
    Top = 728
    ParamData = <
      item
        Name = 'PATH'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDMemTable1: TFDMemTable
    Filtered = True
    FieldDefs = <>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 528
    Top = 704
    object FDMemTable1com: TStringField
      FieldName = 'com'
      Size = 255
    end
  end
end
