object DataStocks: TDataStocks
  OldCreateOrder = False
  Height = 732
  Width = 1209
  object FDTableStock: TFDTable
    Active = True
    IndexFieldNames = 'NUM'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stock.dbo.EntreesProduits'
    TableName = 'stock.dbo.EntreesProduits'
    Left = 176
    Top = 40
  end
  object FDQuerySelectStockId: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select NumStock'
      'from stockid'
      'where id=:x')
    Left = 576
    Top = 40
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryEtatStokeId: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select sum(quantite) as s,id,code,producteur,  PrixVente'
      'from EntreesProduits'
      'where (numstock>:x) and (numstock<:y) and (id like :i)'
      'group by id,code,producteur,PrixVente'
      ''
      ''
      '')
    Left = 752
    Top = 40
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
        Value = 100
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
    Left = 56
    Top = 40
  end
  object FDQuerySomStoke: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'select sum(quantite*prixachat) as a,sum(quantite*prixvente) as v' +
        ',sum(quantite*(prixvente-prixachat)) as b'
      'from EntreesProduits'
      'where (numstock>:x) and (numstock<:y) and (id like :i)'
      '')
    Left = 896
    Top = 40
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
  object FDTableStockid: TFDTable
    Active = True
    IndexFieldNames = 'id;NumStock'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stockid'
    TableName = 'stockid'
    Left = 1032
    Top = 40
  end
  object FDQueryRechProdByIdCodeStock: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select EntreesProduits.*'
      'from EntreesProduits'
      'where ((id=:x) and (code=:y) and (numstock=:z))')
    Left = 576
    Top = 244
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
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
  object FDQueryAllStockByDate: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.UpdateTableName = 'stock.dbo.Stock'
    SQL.Strings = (
      'select  EntreesProduits.*'
      'from EntreesProduits'
      'where (code=:y)'
      'order by dateentree;')
    Left = 752
    Top = 248
    ParamData = <
      item
        Name = 'Y'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryAlert: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select stock.* '
      'from stock '
      'where alert=0')
    Left = 576
    Top = 360
  end
  object FDQueryExpire: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select stock.* '
      'from stock '
      'where (expire=1) and (quantite>0)')
    Left = 737
    Top = 360
  end
  object FDQueryExpireRecordCount: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct [sortie-expire].annee,[sortie-expire].num '
      'from [sortie-expire]'
      'where annee=:a')
    Left = 897
    Top = 360
    ParamData = <
      item
        Name = 'A'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryTypeProdStock: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select EntreesProduits.*'
      'from EntreesProduits'
      'where type=:x')
    Left = 584
    Top = 480
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryRechProdLikeId: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select  EntreesProduits.*'
      'from EntreesProduits'
      'where Id like :x')
    Left = 928
    Top = 248
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryStockInventaire: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.UpdateTableName = 'stock.dbo.Stock'
    SQL.Strings = (
      'select  EntreesProduits.*'
      'from EntreesProduits'
      'where (Num=0)'
      'order by dateentree;')
    Left = 288
    Top = 40
  end
  object FDQueryStockFacture: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.UpdateTableName = 'stock.dbo.Stock'
    SQL.Strings = (
      'select  EntreesProduits.*'
      'from EntreesProduits'
      'where (Num>0)'
      'order by dateentree;')
    Left = 448
    Top = 40
  end
  object FDQueryStockInventaireByProd: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.UpdateTableName = 'stock.dbo.Stock'
    SQL.Strings = (
      'select  EntreesProduits.*'
      'from EntreesProduits'
      'where (Num=0) and (id=:i) and (code=:c)'
      'order by dateentree;')
    Left = 288
    Top = 128
    ParamData = <
      item
        Name = 'I'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'C'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryStockFactureByProd: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.UpdateTableName = 'stock.dbo.Stock'
    SQL.Strings = (
      'select  EntreesProduits.*'
      'from EntreesProduits'
      'where (Num>0) and (id=:i) and (code=:c)'
      'order by dateentree;')
    Left = 456
    Top = 128
    ParamData = <
      item
        Name = 'I'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'C'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
  end
end
