object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 686
  Width = 821
  object DSServer1: TDSServer
    AutoStart = False
    Left = 96
    Top = 56
  end
  object DSHTTPService1: TDSHTTPService
    OnFormatResult = DSHTTPService1FormatResult
    Server = DSServer1
    Filters = <>
    Left = 96
    Top = 152
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 104
    Top = 248
  end
  object DSServerClass2: TDSServerClass
    OnGetClass = DSServerClass2GetClass
    Server = DSServer1
    Left = 208
    Top = 248
  end
end
