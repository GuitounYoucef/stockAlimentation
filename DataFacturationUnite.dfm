object DataFacturation: TDataFacturation
  OldCreateOrder = False
  Height = 801
  Width = 1367
  object FDQueryCodeProduit: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select produits.*'
      'from produits'
      'where ((Code=:c) or (id=:i))'
      '')
    Left = 224
    Top = 24
    ParamData = <
      item
        Name = 'C'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'I'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
  end
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
  object FDQueryFactureRecords: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select EntreesProduits.*'
      'from EntreesProduits'
      'where(( Annee=:x) and (Num=:y))')
    Left = 712
    Top = 318
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQueryProducteur: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Producteur.*'
      'from Producteur'
      'where Producteur.Type=:x')
    Left = 672
    Top = 24
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDTableListFounisseurs: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stock.dbo.Fournisseur'
    TableName = 'stock.dbo.Fournisseur'
    Left = 824
    Top = 24
  end
  object FDQueryStocksNamesSource: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select stockid.*'
      'from stockid'
      'where id<>:x')
    Left = 976
    Top = 22
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = '23'
      end>
  end
  object FDQueryNumFacture: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct Entrees.Num'
      'from Entrees'
      'where Annee=:x')
    Left = 1120
    Top = 22
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQuerySelectFournsseurByName: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Fournisseur.*'
      'from Fournisseur'
      'where nomprenom=:x'
      '')
    Left = 384
    Top = 118
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDTableImprimante: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Imprimantes'
    TableName = 'Imprimantes'
    Left = 552
    Top = 120
  end
  object FDTableFacture: TFDTable
    Active = True
    IndexFieldNames = 'Num;Annee'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Entrees'
    TableName = 'Entrees'
    Left = 688
    Top = 120
  end
  object FDQueryStocksNamesDestination: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select stockid.*'
      'from stockid'
      'where (id<>:x)')
    Left = 992
    Top = 118
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = '23'
      end>
  end
  object FDTableStockid: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stockid'
    TableName = 'stockid'
    Left = 824
    Top = 120
  end
  object FDQueryFindStockNum: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select stockid.*'
      'from stockid'
      'where id=:x')
    Left = 392
    Top = 206
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = '23'
      end>
  end
  object FDQueryFacture: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Entrees.*'
      'from Entrees'
      'where(( Annee=:x) and (Num=:y))')
    Left = 568
    Top = 318
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQueryListeFactures: TFDQuery
    Active = True
    AfterScroll = FDQueryListeFacturesAfterScroll
    Connection = FDConnection1
    SQL.Strings = (
      'select Entrees.*'
      'from Entrees'
      'where TypePaiement=:x')
    Left = 392
    Top = 326
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDTableFacturesAnnulees: TFDTable
    Active = True
    IndexFieldNames = 'Num;Annee'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'RetourneFacture'
    TableName = 'RetourneFacture'
    Left = 392
    Top = 416
  end
end
