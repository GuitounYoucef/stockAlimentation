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
end
