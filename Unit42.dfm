object Form42: TForm42
  Left = 0
  Top = 0
  Caption = 'Form42'
  ClientHeight = 607
  ClientWidth = 1010
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 912
    Top = 416
    Width = 57
    Height = 23
    BiDiMode = bdRightToLeft
    Caption = 'Label1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 34
    Top = 35
    Width = 302
    Height = 34
    TabStop = False
    Alignment = taCenter
    Color = clInactiveBorder
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    MaxLength = 13
    ParentFont = False
    TabOrder = 0
    TextHint = 'code bar'
    StyleElements = [seBorder]
    OnKeyDown = Edit1KeyDown
  end
  object DBGrid1: TDBGrid
    Left = 34
    Top = 88
    Width = 935
    Height = 89
    BiDiMode = bdRightToLeft
    DataSource = DataSource1
    ParentBiDiMode = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'num'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'producteur'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantite'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrixVente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'somme'
        Visible = True
      end>
  end
  object Edit2: TEdit
    Left = 34
    Top = 483
    Width = 302
    Height = 34
    TabStop = False
    Alignment = taCenter
    Color = clInactiveBorder
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    MaxLength = 13
    ParentFont = False
    TabOrder = 2
    TextHint = 'code bar'
    StyleElements = [seBorder]
    OnKeyDown = Edit1KeyDown
  end
  object Button1: TButton
    Left = 400
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = DataModuleVente.FDMemTableListProduit
    Left = 48
    Top = 392
  end
end
