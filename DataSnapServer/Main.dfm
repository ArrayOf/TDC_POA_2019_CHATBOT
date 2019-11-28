object fMain: TfMain
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
  object memoResponse: TMemo
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 878
    Height = 756
    Align = alClient
    Color = 16384
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      '{'
      '  "fulfillmentText": "2 unidades de $PRODUCT",'
      '  "fulfillmentMessages": ['
      '    {'
      '      "card": {'
      '        "title": "$PRODUCT",'
      '        "subtitle": "2 unidades de $PRODUCT",'
      
        '        "imageUri": "https://assistant.google.com/static/images/' +
        'molecule/Molecule-Formation-stop.png",'
      '        "buttons": ['
      '          {'
      '            "text": "Estoque",'
      '            "postback": "https://assistant.google.com/"'
      '          }'
      '        ]'
      '      }'
      '    }'
      '  ],'
      '  "source": "example.com",'
      '  "payload": {'
      '    "google": {'
      '      "expectUserResponse": true,'
      '      "richResponse": {'
      '        "items": ['
      '          {'
      '            "simpleResponse": {'
      '              "textToSpeech": "$PRODUCT"'
      '            }'
      '          },'
      '          {'
      '            "basicCard": {'
      '              "title": "2 unidades de $PRODUCT",'
      '              "image": {'
      
        '                "url": "https://assistant.google.com/static/imag' +
        'es/molecule/Molecule-Formation-stop.png",'
      '                "accessibilityText": "Google Logo"'
      '              },'
      '              "buttons": ['
      '                {'
      '                  "title": "Vem comigo",'
      '                  "openUrlAction": {'
      '                    "url": "https://www.google.com"'
      '                  }'
      '                }'
      '              ],'
      '              "imageDisplayOptions": "WHITE"'
      '            }'
      '          }'
      '        ]'
      '      }'
      '    },'
      '    "facebook": {'
      '      "attachment": {'
      '        "type": "template",'
      '        "payload": {'
      '          "template_type": "button",'
      '          "text": "2 unidades de $PRODUCT",'
      '          "buttons": ['
      '            {'
      '              "type": "web_url",'
      '              "url": "https://www.messenger.com",'
      '              "title": "2 unidades de $PRODUCT"'
      '            }'
      '          ]'
      '        }'
      '      }'
      '    }'
      '  }'
      '}')
    ParentFont = False
    TabOrder = 1
    WordWrap = False
  end
end
