object FrmFileDemo: TFrmFileDemo
  Left = 175
  Top = 140
  Width = 520
  Height = 375
  Caption = 'Demonstrativo do Pagamento da Produ'#231#227'o '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object BtnFind: TSpeedButton
      Left = 41
      Top = 1
      Width = 40
      Height = 29
      Hint = 'Localizar'
      Flat = True
      Glyph.Data = {
        76030000424D7603000000000000360000002800000011000000100000000100
        18000000000040030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBF000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF0000
        00000000000000000000BFBFBF00BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF
        000000000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF000000000000BFBF
        BF00BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF000000000000000000BFBFBF
        000000000000000000FFFFFF000000000000BFBFBF00BFBFBFBFBFBFBFBFBFBF
        BFBF000000000000000000000000000000000000000000FFFFFF000000000000
        000000000000BFBFBF00BFBFBF7F00007F00007F0000000000000000FFFFFF00
        0000000000BFBFBF000000FFFFFF000000000000000000000000BFBFBF00BFBF
        BF7F0000FFFFFFFFFFFFFFFFFF000000000000000000000000BFBFBF00000000
        0000000000000000000000BFBFBFBFBFBF00BFBFBF7F0000FFFFFF7F7F7F7F7F
        7F000000FFFFFF000000000000000000000000FFFFFF000000000000000000BF
        BFBFBFBFBF00BFBFBF7F0000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        00000000000000000000000000000000BFBFBFBFBFBFBFBFBF00BFBFBF7F0000
        FFFFFF7F7F7F7F7F7FFFFFFF000000FFFFFF0000007F7F7F7F7F7F000000FFFF
        FF000000BFBFBFBFBFBFBFBFBF00BFBFBF7F0000FFFFFFFFFFFFFFFFFFFFFFFF
        000000000000000000FFFFFFFFFFFF000000000000000000BFBFBFBFBFBFBFBF
        BF00BFBFBF7F0000FFFFFF7F7F7F7F7F7FFFFFFF7F7F7F7F7F7FFFFFFF7F7F7F
        7F7F7FFFFFFF7F0000BFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF7F0000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000BFBFBF
        BFBFBFBFBFBFBFBFBF00BFBFBF7F00007F00007F00007F00007F00007F00007F
        00007F00007F00007F00007F00007F0000BFBFBFBFBFBFBFBFBFBFBFBF00BFBF
        BF7F0000BFBFBF7F00007F0000BFBFBF7F00007F0000BFBFBF7F00007F0000BF
        BFBF7F0000BFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF7F00007F00007F00007F00
        007F00007F00007F00007F00007F00007F00007F00007F0000BFBFBFBFBFBFBF
        BFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnFindClick
    end
    object SpeedButton4: TSpeedButton
      Left = 1
      Top = 1
      Width = 40
      Height = 29
      Hint = 'Imprimir Demonstrativo de Produ'#231#227'o ( Modo DOS )'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton4Click
    end
    object BtnFechar: TSpeedButton
      Left = 81
      Top = 1
      Width = 40
      Height = 29
      Hint = 'Fechar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnFecharClick
    end
    object SpeedButton1: TSpeedButton
      Left = 176
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Menos Zoom'
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007700000000000007700000007068
        68686868686070000000708680000000868070000000706860FFFFF068607000
        0000708680F444F0868070000000706860FFFFF0686070000000708680F44FF0
        868070000000706860FFFFF0686070000000708680F444F08680700000007068
        60FFFFF068607000000070868000000086807000000070686868686868607000
        0000770000000000000770000000777777777777777770000000777777777777
        777770000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 200
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Mais Zoom'
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDDDDDDD0000000DD0000000000000DD0000000D0FF
        FFFFFFFFFFF0D0000000D0FFFF000000FFF0D0000000D0FFFFFFFFFFFFF0D000
        0000D0FFFF00000FFFF0D0000000D0FFFFFFFFFFFFF0D0000000D0FF4F0000FF
        4FF0D0000000D0F44FFFFFFF44F0D0000000D04444F000F44440D0000000D0F4
        4FFFFFFF44F0D0000000D0FF4F00000F4FF0D0000000D0FFFFFFFFFFFFF0D000
        0000DD0000000000000DD0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
  end
  object Memo1: TRichEdit
    Left = 0
    Top = 32
    Width = 504
    Height = 305
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Courier New'
    Font.Style = []
    HideScrollBars = False
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    PlainText = True
    ScrollBars = ssHorizontal
    TabOrder = 1
    WordWrap = False
  end
  object PrintProgress: TPanel
    Left = 128
    Top = 112
    Width = 217
    Height = 89
    BevelInner = bvRaised
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 12
      Top = 14
      Width = 59
      Height = 13
      Caption = 'Imprimindo...'
    end
    object ProgressBar1: TProgressBar
      Left = 12
      Top = 30
      Width = 193
      Height = 16
      TabOrder = 0
    end
    object BtnCancelaPrint: TBitBtn
      Left = 71
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BtnCancelaPrintClick
    end
  end
  object FindDialog1: TFindDialog
    Options = [frDown, frFindNext, frMatchCase, frDisableMatchCase]
    OnFind = FindDialog1Find
    Left = 16
    Top = 64
  end
end
