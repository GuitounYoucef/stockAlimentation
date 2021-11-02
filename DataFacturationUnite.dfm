object DataFacturation: TDataFacturation
  OldCreateOrder = False
  Height = 518
  Width = 1248
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
  object FDQueryFindProductInStoke: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Stock.*'
      'from Stock'
      
        'where (((Stock.code=:z) or (Stock.id=:x)) and (Stock.Quantite>=:' +
        'q) and (Stock.Numstock=:n))'
      'order by DateConsm;')
    Left = 384
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
  object FDQueryFactureEntrante: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Entree.*'
      'from Entree'
      'where(( Entree.Annee=:x) and (Entree.Num=:y))')
    Left = 536
    Top = 22
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
      'select distinct Facture.Num'
      'from Facture'
      'where Facture.Annee=:x')
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
    UpdateOptions.UpdateTableName = 'Facture'
    TableName = 'Facture'
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
    Connection = FDConnection1
    SQL.Strings = (
      'select facture.*'
      'from facture'
      'where(( Annee=:x) and (Num=:y))')
    Left = 688
    Top = 254
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
  object FDQueryFacturePayee: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select facture.*'
      'from facture'
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
end
