object DataModuleVente: TDataModuleVente
  OldCreateOrder = False
  Height = 876
  Width = 1497
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
  object FDQueryTrouverProd: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Stock.*'
      'from Stock'
      
        'where (((Stock.code=:z) or (Stock.id=:x)) and (Stock.Quantite>=:' +
        'q) and (Stock.Numstock=:n))'
      'order by DateConsm;')
    Left = 208
    Top = 32
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
  object FDMemTableListProduit: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'num'
        DataType = ftInteger
      end
      item
        Name = 'producteur'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'quantite'
        DataType = ftFloat
      end
      item
        Name = 'PrixVente'
        DataType = ftFloat
      end
      item
        Name = 'somme'
        DataType = ftFloat
      end
      item
        Name = 'CodeProduit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PrixAchat'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'num'
    DetailFields = 'num'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 448
    Top = 32
    Content = {
      414442530F00BC3299030000FF00010001FF02FF0304002A000000460044004D
      0065006D005400610062006C0065004C00690073007400500072006F00640075
      006900740005000A0000005400610062006C0065000600000000000700000800
      32000000090000FF0AFF0B04000400000069006400050004000000690064000C
      00010000000E000D000F00140000001000011100011200011300011400011500
      0116000400000069006400170014000000FEFF0B0400060000006E0075006D00
      0500060000006E0075006D000C00020000000E00180010000111000119000112
      00011A00FFFFFFFF1B00FFFFFFFF1300011400011500011C0001160006000000
      6E0075006D00FEFF0B040014000000700072006F006400750063007400650075
      007200050014000000700072006F0064007500630074006500750072000C0003
      0000000E000D000F001400000010000111000112000113000114000115000116
      0014000000700072006F006400750063007400650075007200170014000000FE
      FF0B0400100000007100750061006E0074006900740065000500100000007100
      750061006E0074006900740065000C00040000000E001D001000011100011200
      011300011400011500011600100000007100750061006E007400690074006500
      FEFF0B0400120000005000720069007800560065006E00740065000500120000
      005000720069007800560065006E00740065000C00050000000E001D00100001
      1100011200011300011400011500011600120000005000720069007800560065
      006E0074006500FEFF0B04000A00000073006F006D006D00650005000A000000
      73006F006D006D0065000C00060000000E001D00100001110001120001130001
      14000115000116000A00000073006F006D006D006500FEFF0B04001600000043
      006F0064006500500072006F00640075006900740005001600000043006F0064
      006500500072006F0064007500690074000C00070000000E001E000F00140000
      0010000111000112000113000114000115000116001600000043006F00640065
      00500072006F006400750069007400170014000000FEFF0B0400120000005000
      7200690078004100630068006100740005001200000050007200690078004100
      63006800610074000C00080000000E001D001000011100011200011300011400
      01150001160012000000500072006900780041006300680061007400FEFEFF1F
      FEFF20FEFF21FEFEFEFF22FEFF23240003000000FF25FEFEFE0E004D0061006E
      0061006700650072001E00550070006400610074006500730052006500670069
      00730074007200790012005400610062006C0065004C006900730074000A0054
      00610062006C00650008004E0061006D006500140053006F0075007200630065
      004E0061006D0065000A0054006100620049004400240045006E0066006F0072
      006300650043006F006E00730074007200610069006E00740073001E004D0069
      006E0069006D0075006D00430061007000610063006900740079001800430068
      00650063006B004E006F0074004E0075006C006C00140043006F006C0075006D
      006E004C006900730074000C0043006F006C0075006D006E00100053006F0075
      0072006300650049004400180064007400570069006400650053007400720069
      006E0067001000440061007400610054007900700065000800530069007A0065
      001400530065006100720063006800610062006C006500120041006C006C006F
      0077004E0075006C006C000800420061007300650014004F0041006C006C006F
      0077004E0075006C006C0012004F0049006E0055007000640061007400650010
      004F0049006E00570068006500720065001A004F0072006900670069006E0043
      006F006C004E0061006D006500140053006F007500720063006500530069007A
      0065000E006400740049006E007400330032000E004100750074006F0049006E
      00630022004100750074006F0049006E006300720065006D0065006E00740053
      0065006500640022004100750074006F0049006E006300720065006D0065006E
      007400530074006500700020004F004100660074006500720049006E00730043
      00680061006E0067006500640010006400740044006F00750062006C00650018
      006400740041006E007300690053007400720069006E0067001C0043006F006E
      00730074007200610069006E0074004C00690073007400100056006900650077
      004C006900730074000E0052006F0077004C006900730074001800520065006C
      006100740069006F006E004C006900730074001C005500700064006100740065
      0073004A006F00750072006E0061006C001200530061007600650050006F0069
      006E0074000E004300680061006E00670065007300}
    object FDMemTableListProduitid: TWideStringField
      FieldName = 'id'
    end
    object FDMemTableListProduitnum: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'num'
    end
    object FDMemTableListProduitproducteur: TWideStringField
      FieldName = 'producteur'
    end
    object FDMemTableListProduitquantite: TFloatField
      FieldName = 'quantite'
    end
    object FDMemTableListProduitPrixVente: TFloatField
      FieldName = 'PrixVente'
    end
    object FDMemTableListProduitsomme: TFloatField
      FieldName = 'somme'
    end
    object FDMemTableListProduitCodeProduit: TStringField
      FieldName = 'CodeProduit'
    end
    object FDMemTableListProduitPrixAchat: TFloatField
      FieldName = 'PrixAchat'
    end
  end
  object FDQuerySoties: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select sortie.*'
      'from sortie'
      'where ((Annee=:a) or (Num=:n))'
      '')
    Left = 208
    Top = 136
    ParamData = <
      item
        Name = 'A'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'N'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDTableSorite: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'stock.dbo.Sortie'
    TableName = 'stock.dbo.Sortie'
    Left = 216
    Top = 248
  end
  object FDTableSortieProduits: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'SortieProduits'
    TableName = 'SortieProduits'
    Left = 336
    Top = 248
  end
  object FDQueryNumVente: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select distinct Sortie.num'
      'from Sortie'
      'where (( Sortie.Annee=:x) and (Sortie.typevente=:y)) ')
    Left = 336
    Top = 360
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Y'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDTableParametrage: TFDTable
    Active = True
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Parametrage'
    TableName = 'Parametrage'
    Left = 488
    Top = 248
  end
  object FDQueryListeProdBD: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select SortieProduits.*'
      'from SortieProduits'
      'where (SortieProduits.NumOpr=:x)'
      ''
      ''
      '')
    Left = 888
    Top = 32
    ParamData = <
      item
        Name = 'X'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryListeProdBDQuantite: TSingleField
      FieldName = 'Quantite'
      Origin = 'Quantite'
      Required = True
    end
    object FDQueryListeProdBDPrixAchat: TFloatField
      FieldName = 'PrixAchat'
      Origin = 'PrixAchat'
      Required = True
    end
    object FDQueryListeProdBDPrixVente: TSingleField
      FieldName = 'PrixVente'
      Origin = 'PrixVente'
      Required = True
    end
    object FDQueryListeProdBDNumOpr: TFMTBCDField
      FieldName = 'NumOpr'
      Origin = 'NumOpr'
      Required = True
      Precision = 18
      Size = 0
    end
    object FDQueryListeProdBDCodeProduit: TWideStringField
      FieldName = 'CodeProduit'
      Origin = 'CodeProduit'
      Required = True
      Size = 80
    end
    object FDQueryListeProdBDid: TWideStringField
      FieldName = 'id'
      Origin = 'id'
      Required = True
      Size = 80
    end
    object FDQueryListeProdBDproducteur: TWideStringField
      FieldName = 'producteur'
      Origin = 'producteur'
      Size = 80
    end
  end
  object FDQueryListOprsSortie: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Sortie.*'
      'from Sortie'
      'where ((Annee=:a) and (typevente=:t))'
      'order by Num;')
    Left = 760
    Top = 32
    ParamData = <
      item
        Name = 'A'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'T'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDMemTableCredit: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Credit'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 448
    Top = 104
    Content = {
      414442530F00BC32D0000000FF00010001FF02FF03040020000000460044004D
      0065006D005400610062006C00650043007200650064006900740005000A0000
      005400610062006C006500060000000000070000080032000000090000FF0AFF
      0B04000C00000043007200650064006900740005000C00000043007200650064
      00690074000C00010000000E000D000F00011000011100011200011300011400
      0115000C000000430072006500640069007400FEFEFF16FEFF17FEFF18FEFEFE
      FF19FEFF1A1B0004000000FF1CFEFEFE0E004D0061006E006100670065007200
      1E00550070006400610074006500730052006500670069007300740072007900
      12005400610062006C0065004C006900730074000A005400610062006C006500
      08004E0061006D006500140053006F0075007200630065004E0061006D006500
      0A0054006100620049004400240045006E0066006F0072006300650043006F00
      6E00730074007200610069006E00740073001E004D0069006E0069006D007500
      6D0043006100700061006300690074007900180043006800650063006B004E00
      6F0074004E0075006C006C00140043006F006C0075006D006E004C0069007300
      74000C0043006F006C0075006D006E00100053006F0075007200630065004900
      440010006400740044006F00750062006C006500100044006100740061005400
      7900700065001400530065006100720063006800610062006C00650012004100
      6C006C006F0077004E0075006C006C000800420061007300650014004F004100
      6C006C006F0077004E0075006C006C0012004F0049006E005500700064006100
      7400650010004F0049006E00570068006500720065001A004F00720069006700
      69006E0043006F006C004E0061006D0065001C0043006F006E00730074007200
      610069006E0074004C00690073007400100056006900650077004C0069007300
      74000E0052006F0077004C006900730074001800520065006C00610074006900
      6F006E004C006900730074001C0055007000640061007400650073004A006F00
      750072006E0061006C001200530061007600650050006F0069006E0074000E00
      4300680061006E00670065007300}
    object FDMemTableCreditCredit: TFloatField
      FieldName = 'Credit'
    end
  end
  object FDQueryFindClientByName: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select Clients.*'
      'from Clients'
      'where (Client=:x)')
    Left = 336
    Top = 456
    ParamData = <
      item
        Name = 'X'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
