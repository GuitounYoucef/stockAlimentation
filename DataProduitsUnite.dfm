object DataProduits: TDataProduits
  OldCreateOrder = False
  Height = 721
  Width = 1017
  object FDTableProduits: TFDTable
    Active = True
    IndexFieldNames = 'id;Code'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Produits'
    TableName = 'Produits'
    Left = 160
    Top = 40
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
  object FDTableStocksNames: TFDTable
    Active = True
    IndexFieldNames = 'id;NumStock'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stockid'
    TableName = 'stockid'
    Left = 312
    Top = 40
  end
  object FDQueryProdDejaUtilise: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select id,code'
      'from EntreesProduits'
      'where ((id=:x) and (code=:y))')
    Left = 608
    Top = 40
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
      end>
  end
  object FDQueryFindProduitByCode: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select produits.*'
      'from produits'
      'where ((Code=:c) or (id=:i))')
    Left = 440
    Top = 40
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
  object FDQueryProduitLikeId: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select  Produits.*'
      'from Produits'
      'where Produits.Id like :x')
    Left = 312
    Top = 116
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryProduit: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select produits.*'
      'from produits'
      'where  (id like :i)')
    Left = 160
    Top = 120
    ParamData = <
      item
        Name = 'I'
        DataType = ftWideString
        ParamType = ptInput
        Value = '%%'
      end>
  end
end
