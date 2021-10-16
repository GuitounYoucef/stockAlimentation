object DataModuleDelivrence: TDataModuleDelivrence
  OldCreateOrder = False
  Height = 759
  Width = 1301
  object FDQueryCreditListe: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select creditListe.*'
      'from creditListe'
      'where (NumCredit=:x)')
    Left = 324
    Top = 32
    ParamData = <
      item
        Name = 'X'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryCredit: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select credit.*'
      'from credit'
      'where (NumClient=:x) and (ferme=0)')
    Left = 212
    Top = 32
    ParamData = <
      item
        Name = 'X'
        DataType = ftLargeint
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
    Top = 32
  end
  object FDQueryListe: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT SortieProduits.*'
      
        'FROM SortieProduits INNER JOIN Sortie ON SortieProduits.NumOpr =' +
        ' Sortie.NumOpr'
      
        'WHERE ((Sortie.TypePaim>:x1) and (Sortie.TypePaim<:x2)) and ((So' +
        'rtie.TypeVente>:y1) and (Sortie.TypeVente<:y2)) and (Sortie.clie' +
        'nt=:c)'
      'order by NumOpr;')
    Left = 376
    Top = 352
    ParamData = <
      item
        Name = 'X1'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'X2'
        DataType = ftInteger
        ParamType = ptInput
        Size = 3
        Value = 3
      end
      item
        Name = 'Y1'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'Y2'
        DataType = ftInteger
        ParamType = ptInput
        Size = 3
        Value = 3
      end
      item
        Name = 'C'
        DataType = ftWideString
        ParamType = ptInput
        Value = #1610#1608#1587#1601
      end>
  end
  object FDQueryDelivrence: TFDQuery
    Active = True
    AfterScroll = FDQueryDelivrenceAfterScroll
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT DISTINCT Clients.*,Sortie.TypePaim'
      'FROM Clients INNER JOIN Sortie ON Clients.Client = Sortie.Client'
      
        'WHERE ((Sortie.TypePaim>:x1) and (Sortie.TypePaim<:x2)) and ((So' +
        'rtie.TypeVente>:y1) and (Sortie.TypeVente<:y2))')
    Left = 256
    Top = 352
    ParamData = <
      item
        Name = 'X1'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'X2'
        DataType = ftInteger
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'Y1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Y2'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FD12QueryImp: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Sortie.*'
      'from Sortie'
      'where (client like :x) and (typevente=:y) and (typepaim=:z)')
    Left = 320
    Top = 152
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
      end
      item
        Name = 'Z'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDTableCreditListe: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stock.dbo.CreditListe'
    TableName = 'stock.dbo.CreditListe'
    Left = 464
    Top = 32
  end
  object FDQueryOprVente: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT Sortie.*'
      'FROM Sortie'
      'WHERE NumOpr=:x')
    Left = 496
    Top = 352
    ParamData = <
      item
        Name = 'X'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryListeParTypePaim: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT SortieProduits.*'
      
        'FROM SortieProduits INNER JOIN Sortie ON SortieProduits.NumOpr =' +
        ' Sortie.NumOpr'
      'WHERE (Sortie.TypePaim=:x) '
      'order by NumOpr;')
    Left = 376
    Top = 424
    ParamData = <
      item
        Name = 'X'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
