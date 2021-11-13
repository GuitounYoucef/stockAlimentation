object DataParametrage: TDataParametrage
  OldCreateOrder = False
  Height = 583
  Width = 1029
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
  object FDTableImprimante: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Imprimantes'
    TableName = 'Imprimantes'
    Left = 208
    Top = 40
  end
  object FDQueryClientByCatg: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select clients.*'
      'from clients'
      'where catg=:x')
    Left = 384
    Top = 40
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDTableParametrage: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Parametrage'
    TableName = 'Parametrage'
    Left = 528
    Top = 32
  end
  object FDQuerystockByid: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select stockid.*'
      'from stockid'
      'where stockid.id = :x')
    Left = 680
    Top = 40
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryFounisseurByName: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Fournisseur.*'
      'from Fournisseur'
      'where nomprenom like :x'
      'order by num;')
    Left = 688
    Top = 112
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryLoginUser: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select *'
      'from users'
      'where ((users.id=:x) and (users.motpasse=:y))')
    Left = 208
    Top = 216
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
  object FDQueryClientByName: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Clients.*'
      'from Clients'
      'where client like :x'
      'order by type;')
    Left = 848
    Top = 112
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDQueryType: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select type.type'
      'from type')
    Left = 384
    Top = 304
  end
  object FDQueryProducteur: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Producteur.*'
      'from Producteur'
      'where Producteur.Type=:x')
    Left = 480
    Top = 304
    ParamData = <
      item
        Name = 'X'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object FDTableUsers: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Users'
    TableName = 'Users'
    Left = 304
    Top = 216
  end
  object FDTableActivation: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Activation'
    TableName = 'Activation'
    Left = 197
    Top = 392
  end
  object FDTableType: TFDTable
    Active = True
    IndexFieldNames = 'NUM'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Type'
    TableName = 'Type'
    Left = 581
    Top = 304
  end
  object FDTableSortieExpire: TFDTable
    Active = True
    IndexFieldNames = 'Num;Annee'
    AggregatesActive = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = '[Sortie-Expire]'
    TableName = '[Sortie-Expire]'
    Left = 685
    Top = 304
  end
end
