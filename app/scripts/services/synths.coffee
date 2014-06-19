angular.module('synths', [])
  .service '$synths', ->
    synths: [
      name: 'VCO v6'
      additionalParts: [
        name: '1K +3500ppm/K Temp co'
        url: 'http://www.thonk.co.uk/shop/tempco-resistor-krl-bantry-3500ppm-x2/'
        qty: 1
      ],

      parts: [
      # resistors
        mpn: 'MF25 22R'
        qty: 6
      ,
        mpn: 'MF25 100R'
        qty: 1
      ,
        mpn: 'MF25 390R'
        qty: 2
      ,
        mpn: 'MF25 820R'
        qty: 1
      ,
        mpn: 'MF25 1k'
        qty: 1
      ,
        mpn: 'MF25 2k'
        qty: 1
      ,
        mpn: 'MF25 2k2'
        qty: 2
      ,
        mpn: 'MF25 5K1'
        qty: 1
      ,
        mpn: 'MF25 5K6'
        qty: 1
      ,
        mpn: 'MF25 6K2'
        qty: 2
      ,
        mpn: 'MF25 8K2'
        qty: 2
      ,
        mpn: 'MF25 10K'
        qty: 15
      ,
        mpn: 'MF25 18K'
        qty: 1
      ,
        mpn: 'MF25 22K'
        qty: 6
      ,
        mpn: 'MF25 33K'
        qty: 3
      ,
        mpn: 'MF25 39K'
        qty: 2
      ,
        mpn: 'MF25 47K'
        qty: 2
      ,
        mpn: 'MF25 56K'
        qty: 2
      ,
        mpn: 'MF25 62K'
        qty: 2
      ,
        mpn: 'MF25 68K'
        qty: 2
      ,
        mpn: 'MF25 100K'
        qty: 9
      ,
        mpn: 'MF25 150K'
        qty: 1
      ,
        mpn: 'MF25 180K'
        qty: 1
      ,
        mpn: 'MCMF0W4FF2203A50'
        qty: 1
      ,
        mpn: 'MF25 270K'
        qty: 1
      ,
        mpn: 'MF25 390K'
        qty: 2
      ,
        mpn: 'MCMF0W4FF6803A50'
        qty: 2
      ,
        mpn: 'MF25 750K'
        qty: 1
      ,
        mpn: 'MCF 0.25W 1M'
        qty: 5
      ,

      # caps
        mpn: 'MC0805N180J101A2.54MM'
        qty: 1
      ,
        mpn: 'MCRR25101COGJ0100'
        qty: 2
      ,
        mpn: 'MC0805N221J101A2.54MM'
        qty: 1
      ,
        mpn: 'MCRR25471COGJ0100'
        qty: 3
      ,
        mpn: 'EXFS/HR 1000PF +/- 1%'
        qty: 1
      ,
        mpn: 'ECQ-E2103KF'
        qty: 5
      ,
        mpn: 'MCGPR63V225M5X11'
        qty: 2
      ,
        mpn: 'EEU-EB1J4R7S'
        qty: 1
      ,
        mpn: 'MCGPR63V106M5X11'
        qty: 1
      ,
        mpn: 'ECA-1JHG220'
        qty: 9
      ,

      # semiconductors
        mpn: '1N4148'
        qty: 2
      ,
        mpn: 'BAT42'
        qty: 1
      ,
        mpn: 'NTE123AP'
        qty: 4
      ,
        mpn: 'J112'
        qty: 1
      ,

      # integrated circuits
        mpn: 'LM1458N/NOPB'
        qty: 1
      ,
        mpn: 'LM13700N/NOPB'
        qty: 1
      ,
        mpn: 'LM2903N'
        qty: 1
      ,
        mpn: 'LM723CN'
        qty: 1
      ,
        mpn: 'LT1013CP'
        qty: 2
      ,
        mpn: 'THAT300P14-U'
        qty: 1
      ,
        mpn: 'TL074CN'
        qty: 1
      ,
        mpn: 'OPA2134PA.'
        qty: 1
      ,

      # trimmers
        mpn: '3296W-1-104LF'
        qty: 1
      ,
        mpn: '3296W-1-103LF'
        qty: 2
      ,
        mpn: 'CB10LV102M'
        qty: 1
      ,
        mpn: '3386F-1-102TLF'
        qty: 1
      ,
        mpn: '3386F-1-102TLF'
        qty: 1
      ,
        mpn: 'CB10LV223M'
        qty: 1
      ,
        mpn: 'CB10LV473M'
        qty: 2

      #pots
        mpn: '23ESA473KMF16N'
        qty: 7
      ,

      # misc
        mpn: '5636A9'
        qty: 1
      ,
        mpn: '640456-3'
        qty: 1
      ,
        mpn: '112APCX'
        qty: 9
      ,
        mpn: '22-27-2041..'
        qty: 2
      ,
        mpn: '22-01-2045'
        qty: 2
      ,
        mpn: '22-01-2055'
        qty: 2
      ,
        mpn: '22-27-2051'
        qty: 2
      ,
        mpn: '22-27-2061'
        qty: 2
      ,
        mpn: '22-01-2065'
        qty: 2
      ,
        mpn: '22-28-4080'
        qty: '56H2000'
      ,
        mpn: '640445-4'
        qty: 1
      ,
        mpn: '640456-6'
        qty: 1
      ,
        mpn: 'BL01RN1A1D2B'
        qty: 2
      ,

      # IC Sockets
        mpn: '08-3518-10'
        qty: 5
      ,
        mpn: '110-13-316-41-001000'
        qty: 1
      ,
        mpn: '110-13-314-41-001000'
        qty: 3
      ]
    ,

      name: 'VC-LFO v3'
      additionalParts: [
        name: '1K +3000ppm/K PTC'
        url: 'http://www.technobotsonline.com/linear-ptc-1k-thermistor-3000ppm-c-lt300014-5.html'
        qty: 1
      ],

      parts: [
      # resistors
        mpn: 'MF25 22R'
        qty: 1
      ,
        mpn: 'MF25 390R'
        qty: 2
      ,
        mpn: 'MF25 1k'
        qty: 7
      ,
        mpn: 'MF25 2k'
        qty: 1
      ,
        mpn: 'MF25 3K'
        qty: 1
      ,
        mpn: 'MF25 3K3'
        qty: 1
      ,
        mpn: 'MF25 4K7'
        qty: 1
      ,
        mpn: 'MF25 5K6'
        qty: 2
      ,
        mpn: 'MF25 10K'
        qty: 5
      ,
        mpn: 'MF25 18K'
        qty: 1
      ,
        mpn: 'MF25 20K'
        qty: 2
      ,
        mpn: 'MF25 22K'
        qty: 5
      ,
        mpn: 'MCMF0W4FF3002A50'
        qty: 1
      ,
        mpn: 'MF25 33K'
        qty: 3
      ,
        mpn: 'MF25 39K'
        qty: 5
      ,
        mpn: 'MF25 47K'
        qty: 1
      ,
        mpn: 'MF25 51K'
        qty: 5
      ,
        mpn: 'MF25 68K'
        qty: 2
      ,
        mpn: 'MF25 100K'
        qty: 5
      ,
        mpn: 'MF25 180K'
        qty: 1
      ,
        mpn: 'MCMF0W4FF2203A50'
        qty: 1
      ,
        mpn: 'MCMF0W4FF4703A50'
        qty: 4
      ,
        mpn: 'MCMF0W4FF6803A50'
        qty: 1
      ,
        mpn: 'MCF 0.25W 1M'
        qty: 1
      ]
    ]
