object DataFrais: TDataFrais
  OldCreateOrder = False
  Height = 473
  Width = 863
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=srv-stock'
      'User_Name=sa'
      'Password=Gfcbavaria_1987'
      'Database=stock'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 48
  end
  object FDTableFrais: TFDTable
    Active = True
    IndexFieldNames = 'Num'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Frais'
    TableName = 'Frais'
    Left = 184
    Top = 48
  end
end
