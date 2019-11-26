object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Servidor DataSnap Simulando o sistema legado'
  ClientHeight = 762
  ClientWidth = 1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 756
    Align = alLeft
    BevelInner = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 512
    ExplicitTop = 520
    ExplicitHeight = 41
    object Button1: TButton
      Left = 8
      Top = 6
      Width = 169
      Height = 25
      Caption = 'ATIVAR SERVIDOR'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 878
    Height = 756
    Align = alClient
    Color = 16384
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -21
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 504
    ExplicitTop = 440
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
