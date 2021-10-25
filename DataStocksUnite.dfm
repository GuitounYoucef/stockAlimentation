object DataStocks: TDataStocks
  OldCreateOrder = False
  Height = 624
  Width = 1055
  object FDTableStock: TFDTable
    Active = True
    IndexFieldNames = 'Producteur;Type;Code;id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stock.dbo.Stock'
    TableName = 'stock.dbo.Stock'
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
  object FDQuerystockAllbyId: TFDQuery
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
    Left = 520
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
end
