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
    Left = 264
    Top = 40
  end
  object FDQuerySelectStockId: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select NumStock'
      'from stockid'
      'where id=:x')
    Left = 384
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
    Left = 560
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
    Left = 704
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
    Left = 840
    Top = 40
  end
  object FDQueryRechProdByIdCodeStock: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select EntreesProduits.*'
      'from EntreesProduits'
      
        'where ((id=:x) and (code=:y) and (numstock=:z)  and (quantite>=:' +
        'q))')
    Left = 392
    Top = 132
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
      end
      item
        Name = 'Q'
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
    Left = 568
    Top = 136
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
    Left = 392
    Top = 248
  end
  object FDQueryExpire: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select stock.* '
      'from stock '
      'where (expire=1) and (quantite>0)')
    Left = 553
    Top = 248
  end
  object FDQueryExpireRecordCount: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct [sortie-expire].annee,[sortie-expire].num '
      'from [sortie-expire]'
      'where annee=:a')
    Left = 713
    Top = 248
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
    Left = 400
    Top = 368
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
    Left = 744
    Top = 136
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
  end
end
