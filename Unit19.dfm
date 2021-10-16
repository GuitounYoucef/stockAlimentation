object Form19: TForm19
  Left = 0
  Top = 0
  Caption = 'Form19'
  ClientHeight = 742
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel4: TGridPanel
    Left = 8
    Top = 25
    Width = 1362
    Height = 96
    BiDiMode = bdRightToLeft
    ColumnCollection = <
      item
        Value = 1.999999973192829000
      end
      item
        Value = 96.000000033875580000
      end
      item
        Value = 1.999999992931599000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = GroupBox2
        Row = 0
      end>
    ParentBiDiMode = False
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 28
      Top = 1
      Width = 1305
      Height = 76
      BiDiMode = bdRightToLeft
      Caption = #1576#1581#1579
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 1134
        Top = 28
        Width = 95
        Height = 27
        Alignment = taRightJustify
        Caption = #1573#1587#1605' '#1575#1604#1586#1576#1608#1606' :'
      end
      object SearchBox1: TSearchBox
        Left = 812
        Top = 25
        Width = 316
        Height = 35
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 0
      end
      object Button1: TButton
        Left = 331
        Top = 23
        Width = 150
        Height = 40
        Margins.Left = 10
        Margins.Right = 10
        Caption = #1605#1600#1593#1600#1600#1575#1610#1600#1600#1606#1600#1600#1577
        ImageIndex = 4
        ImageMargins.Left = 15
        TabOrder = 1
      end
      object Button2: TButton
        Left = 19
        Top = 23
        Width = 150
        Height = 40
        Caption = #1591#1576#1575#1593#1577' '#1575#1604#1608#1589#1604
        ImageIndex = 5
        TabOrder = 2
      end
      object Button4: TButton
        Left = 175
        Top = 23
        Width = 150
        Height = 40
        Margins.Right = 20
        Caption = #1581#1600#1600#1600#1584#1601
        ImageIndex = 1
        ImageMargins.Left = 15
        TabOrder = 3
      end
      object ToggleSwitch1: TToggleSwitch
        Left = 673
        Top = 28
        Width = 115
        Height = 30
        BiDiMode = bdRightToLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        State = tssOn
        StateCaptions.CaptionOn = #1573#1574#1578#1605#1575#1606
        StateCaptions.CaptionOff = #1576#1610#1593' '#1606#1602#1583
        SwitchHeight = 30
        SwitchWidth = 60
        TabOrder = 4
      end
      object ToggleSwitch2: TToggleSwitch
        Left = 540
        Top = 28
        Width = 112
        Height = 30
        BiDiMode = bdRightToLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        State = tssOn
        StateCaptions.CaptionOn = #1580#1605#1604#1577
        StateCaptions.CaptionOff = #1578#1580#1586#1574#1577
        SwitchHeight = 30
        SwitchWidth = 60
        TabOrder = 5
      end
    end
  end
  object GridPanel2: TGridPanel
    Left = 8
    Top = 344
    Width = 1362
    Height = 742
    BiDiMode = bdRightToLeft
    ColumnCollection = <
      item
        Value = 2.003944670925817000
      end
      item
        Value = 95.994698021120630000
      end
      item
        Value = 2.001357307953548000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = Panel1
        Row = 1
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    RowCollection = <
      item
        Value = 2.941438421794444000
      end
      item
        Value = 94.117123156411110000
      end
      item
        Value = 2.941438421794444000
      end>
    TabOrder = 1
    object Panel1: TPanel
      Left = 28
      Top = 22
      Width = 1305
      Height = 696
      Align = alClient
      Alignment = taLeftJustify
      BiDiMode = bdRightToLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 956
        Top = 24
        Width = 328
        Height = 337
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -24
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = []
        StyleElements = [seBorder]
        Columns = <
          item
            Expanded = False
            FieldName = 'Client'
            Title.Caption = #1573#1587#1605' '#1575#1604#1586#1576#1608#1606
            Width = 300
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 610
        Top = 24
        Width = 329
        Height = 337
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -24
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = []
        StyleElements = [seBorder]
        Columns = <
          item
            Expanded = False
            FieldName = 'annee'
            Title.Caption = #1575#1604#1587#1606#1577
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num'
            Title.Caption = #1575#1604#1585#1602#1605
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date'
            Title.Caption = #1575#1604#1578#1575#1585#1610#1582
            Width = 140
            Visible = True
          end>
      end
      object DBGrid5: TDBGrid
        Left = 15
        Top = 24
        Width = 579
        Height = 337
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -24
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = []
        StyleElements = [seBorder]
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = #1573#1587#1605' '#1575#1604#1587#1604#1593#1577
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Producteur'
            Title.Caption = #1575#1604#1605#1615#1589#1606#1593
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantite'
            Title.Caption = #1575#1604#1603#1605#1610#1577
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrixVente'
            Title.Caption = #1587#1593#1585' '#1575#1604#1576#1610#1593
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrixVenteGros'
            Title.Caption = #1587#1593#1585' '#1575#1604#1576#1593' '#1576#1604#1580#1605#1604#1577
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateProd'
            Title.Caption = #1578#1575#1585#1610#1582' '#1575#1604#1573#1606#1578#1575#1580
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateConsm'
            Title.Caption = #1606#1607#1575#1610#1577' '#1575#1604#1589#1604#1575#1581#1610#1577
            Width = 100
            Visible = True
          end>
      end
      object Edittotal: TEdit
        Left = 610
        Top = 370
        Width = 236
        Height = 45
        Alignment = taCenter
        BiDiMode = bdRightToLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Unispace'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '0 '#1583#1580
        StyleElements = [seBorder]
      end
      object Edit1: TEdit
        Left = 15
        Top = 370
        Width = 236
        Height = 45
        Alignment = taCenter
        BiDiMode = bdRightToLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Unispace'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '0 '#1583#1580
        StyleElements = [seBorder]
      end
    end
  end
end
