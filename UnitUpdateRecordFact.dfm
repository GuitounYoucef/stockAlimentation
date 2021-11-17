object FormUpdateRecordFact: TFormUpdateRecordFact
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsSizeToolWin
  Caption = 'FormUpdateRecordFact'
  ClientHeight = 330
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 265
    BiDiMode = bdRightToLeft
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 276
      Top = 27
      Width = 60
      Height = 30
      Caption = #1575#1604#1587#1604#1593#1577' :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 276
      Top = 70
      Width = 59
      Height = 30
      Caption = #1575#1604#1603#1605#1610#1577' :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 276
      Top = 115
      Width = 88
      Height = 30
      Caption = #1587#1593#1585' '#1575#1604#1588#1585#1575#1569' :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 276
      Top = 159
      Width = 139
      Height = 30
      Caption = #1587#1593#1585' '#1575#1604#1576#1610#1593' '#1576#1575#1604#1578#1580#1586#1574#1577' :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 276
      Top = 203
      Width = 137
      Height = 30
      Caption = #1587#1593#1585' '#1575#1604#1576#1610#1593' '#1576#1575#1604#1580#1605#1604#1577' :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 24
      Width = 250
      Height = 38
      DataField = 'id'
      DataSource = DataSourceFactureEntrante
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 77
      Top = -4
      Width = 240
      Height = 25
      DataSource = DataSourceFactureEntrante
      TabOrder = 1
      Visible = False
    end
    object DBEditQuantite: TDBEdit
      Left = 20
      Top = 68
      Width = 250
      Height = 38
      DataField = 'Quantite'
      DataSource = DataSourceFactureEntrante
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = DBEditQuantiteEnter
      OnExit = DBEditQuantiteExit
    end
    object DBEditPrixAchat: TDBEdit
      Left = 20
      Top = 112
      Width = 250
      Height = 38
      DataField = 'PrixAchat'
      DataSource = DataSourceFactureEntrante
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object DBEditPrixVente: TDBEdit
      Left = 20
      Top = 156
      Width = 250
      Height = 38
      DataField = 'PrixVente'
      DataSource = DataSourceFactureEntrante
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object DBEditPrixVenteGros: TDBEdit
      Left = 20
      Top = 200
      Width = 250
      Height = 38
      DataField = 'PrixVenteGros'
      DataSource = DataSourceFactureEntrante
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 268
    Width = 433
    Height = 62
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 162
      Top = 10
      Width = 121
      Height = 42
      Caption = #1578#1600#1600#1571#1603#1610#1600#1600#1583
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
  end
  object DataSourceFactureEntrante: TDataSource
    Left = 341
    Top = 256
  end
end
