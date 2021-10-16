object FormLirePrix: TFormLirePrix
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1571#1587#1593#1575#1585' '#1575#1604#1587#1604#1593
  ClientHeight = 314
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 314
    Align = alClient
    Caption = 'GridPanel1'
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Edit1
        Row = 2
      end
      item
        Column = 0
        Control = dxGaugeControl1
        Row = 0
      end
      item
        Column = 0
        Control = Label1
        Row = 1
      end>
    RowCollection = <
      item
        Value = 52.326554286695610000
      end
      item
        Value = 14.163090128755370000
      end
      item
        Value = 33.510355584549010000
      end>
    TabOrder = 0
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 211
      Width = 570
      Height = 99
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 13
      ParentFont = False
      TabOrder = 0
      TextHint = 'Barcode'
      OnKeyDown = Edit1KeyDown
      ExplicitHeight = 85
    end
    object dxGaugeControl1: TdxGaugeControl
      Left = 1
      Top = 1
      Width = 576
      Height = 163
      Align = alClient
      Transparent = True
      object dxGaugeControl1DigitalScale1: TdxGaugeDigitalScale
        OptionsLayout.CenterPositionFactorY = 0.493788808584213300
        OptionsLayout.Stretch = True
        OptionsView.DigitCount = 12
        OptionsView.DisplayMode = sdmSevenSegment
        OptionsView.SegmentColorOff = 0
        OptionsView.SegmentColorOn = -16711681
        StyleName = 'DeepFire'
      end
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 167
      Width = 570
      Height = 38
      Align = alClient
      Alignment = taCenter
      BiDiMode = bdRightToLeft
      Caption = 'Label1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cairo'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 46
      ExplicitHeight = 30
    end
  end
end
