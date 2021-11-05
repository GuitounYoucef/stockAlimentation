object FormPrixQntUpDateVente: TFormPrixQntUpDateVente
  Left = 0
  Top = 0
  AutoSize = True
  Caption = #1578#1581#1583#1610#1583' '#1575#1604#1603#1605#1610#1577
  ClientHeight = 223
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 159
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
      Left = 244
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
      Left = 244
      Top = 68
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
      Left = 244
      Top = 109
      Width = 93
      Height = 30
      Caption = #1587#1593#1585' '#1575#1604#1608#1581#1583#1577' :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 66
      Top = 24
      Width = 172
      Height = 38
      DataField = 'id'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBNavigator1: TDBNavigator
      Left = 69
      Top = -4
      Width = 240
      Height = 25
      TabOrder = 3
      Visible = False
    end
    object EditQuantite: TEdit
      Left = 66
      Top = 65
      Width = 172
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
    object EditPrix: TEdit
      Left = 66
      Top = 104
      Width = 172
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      StyleElements = [seBorder]
      OnChange = EditPrixChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 385
    Height = 62
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 130
      Top = 12
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
      OnClick = BitBtn1Click
    end
  end
end
