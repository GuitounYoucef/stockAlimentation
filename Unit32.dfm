object Form32: TForm32
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form32'
  ClientHeight = 241
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 241
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
      Left = 285
      Top = 40
      Width = 76
      Height = 27
      BiDiMode = bdRightToLeftNoAlign
      Caption = #1575#1604#1605#1580#1605#1608#1593' :'
      ParentBiDiMode = False
    end
    object Label3: TLabel
      Left = 285
      Top = 89
      Width = 115
      Height = 27
      BiDiMode = bdRightToLeftNoAlign
      Caption = #1575#1604#1605#1576#1604#1594' '#1575#1604#1605#1583#1601#1608#1593' :'
      ParentBiDiMode = False
    end
    object Label4: TLabel
      Left = 285
      Top = 137
      Width = 110
      Height = 27
      BiDiMode = bdRightToLeftNoAlign
      Caption = #1575#1604#1605#1576#1604#1594' '#1575#1604#1605#1578#1576#1602#1610' :'
      ParentBiDiMode = False
    end
    object EditSom: TEdit
      Left = 64
      Top = 37
      Width = 215
      Height = 35
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
    end
    object EditPaie: TEdit
      Left = 64
      Top = 86
      Width = 215
      Height = 35
      NumbersOnly = True
      TabOrder = 1
      StyleElements = [seBorder]
    end
    object EditRest: TEdit
      Left = 64
      Top = 134
      Width = 215
      Height = 35
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 219
      Top = 184
      Width = 129
      Height = 41
      Caption = #1605#1608#1575#1601#1602
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 3
    end
    object BitBtn2: TBitBtn
      Left = 84
      Top = 184
      Width = 129
      Height = 41
      Caption = #1573#1604#1600#1600#1594#1600#1600#1575#1569
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 4
    end
  end
end
