object DataStocks: TDataStocks
  OldCreateOrder = False
  Height = 732
  Width = 1209
  object FDTableStock: TFDTable
    Active = True
    IndexFieldNames = 'Producteur;Type;Code;id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Stock'
    TableName = 'Stock'
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
    Active = True
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
      'from stock'
      
        'where (stock.numstock>:x) and (stock.numstock<:y) and (stock.id ' +
        'like :i)'
      '')
    Left = 704
    Top = 40
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
  object FDTableStockid: TFDTable
    Active = True
    IndexFieldNames = 'id;NumStock'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stockid'
    TableName = 'stockid'
    Left = 840
    Top = 40
  end
end
