angular.module('components', [])
  .service '$components', ->

    _partsHash: null

    partsHash: ->
      unless @_partsHash
        @_partsHash = _(@parts)
          .reduce(((res, val, key) ->
            res[val.mpn] = val
          ), {})

      @_partsHash


    #TODO: move to db
    parts: [
      # resistors
      name: '1K +3000ppm/K'
      mpn:  'LT300014T261K0J'
      newarkPN: '26M0474'
    ,

      name: '0R82, 2W'
      mpn:  'WP2S-R82JA25'
      newarkPN: '1219198'
    ,

      name: '22R'
      mpn:  'MF25 22R'
      newarkPN: '9341560'
    ,

      name: '75R'
      mpn: 'MF25 75R'
      newarkPN: '9342257'
    ,

      name: '100R'
      mpn: 'MF25 100R'
      newarkPN: '9341099'
    ,

      name: '110R'
      mpn: 'MF25 110R'
      newarkPN: '9341161'
    ,

      name: '150R'
      mpn: 'MF25 150R'
      newarkPN: '9341315'
    ,

      name: '330R'
      mpn: 'MF25 330R'
      newarkPN: '9341730'
    ,

      name: '390R'
      mpn: 'MF25 390R'
      newarkPN: '38K5343'
    ,

      name: '820R'
      mpn: 'MF25 820R'
      newarkPN: '38K5385'
    ,

      name: '1k'
      mpn: 'MF25 1k'
      newarkPN: '9341102'
    ,

      name: '2k'
      mpn: 'MF25 2k'
      newarkPN: '9341480'
    ,

      name: '2k2'
      mpn: 'MF25 2k2'
      newarkPN: '9341536'
    ,

      name: '2k7'
      mpn: 'MF25 2k7'
      newarkPN: '9341641'
    ,

      name: '3k'
      mpn: 'MF25 3K'
      newarkPN: '38K5328'
    ,

      name: '3k3'
      mpn: 'MF25 3K3'
      newarkPN: '38K5334'
    ,

      name: '3K6'
      mpn: 'MF25 3K6'
      newarkPN: '9341803'
    ,

      name: '4K7'
      mpn: 'MF25 4K7'
      newarkPN: '9341951'
    ,

      name: '5K1'
      mpn: 'MF25 5K1'
      newarkPN: '9342010'
    ,

      name: '5K6'
      mpn: 'MF25 5K6'
      newarkPN: '38K5365'
    ,

      name: '6K2'
      mpn: 'MF25 6K2'
      newarkPN: '9342117'
    ,

      name: '6K8'
      mpn: 'MF25 6K8'
      newarkPN: '9342168'
    ,

      name: '8K2'
      mpn: 'MF25 8K2'
      newarkPN: '9342273'
    ,

      name: '10K'
      mpn: 'MF25 10K'
      newarkPN: '9341110'
    ,

      name: '11K'
      mpn: 'MF25 11K'
      newarkPN: '9341188'
    ,

      name: '12K'
      mpn: 'MF25 12K'
      newarkPN: '9341234'
    ,

      name: '18K'
      mpn: 'MF25 18K'
      newarkPN: '38K5303'
    ,

      name: '20K'
      mpn: 'MF25 20K'
      newarkPN: '9341498'
    ,

      name: '22K'
      mpn: 'MF25 22K'
      newarkPN: '9341544'
    ,

      name: '27K'
      mpn: 'MF25 27K'
      newarkPN: '9341650'
    ,

      name: '30K'
      mpn: 'MCMF0W4FF3002A50'
      newarkPN: '59K8669'
    ,

      name: '33K'
      mpn: 'MF25 33K'
      newarkPN: '38K5335'
    ,

      name: '39K'
      mpn: 'MF25 39K'
      newarkPN: '38K5345'
    ,

      name: '47K'
      mpn: 'MF25 47K'
      newarkPN: '38K5356'
    ,

      name: '51K'
      mpn: 'MF25 51K'
      newarkPN: '38K5361'
    ,

      name: '56K'
      mpn: 'MF25 56K'
      newarkPN: '38K5366'
    ,

      name: '62K'
      mpn: 'MF25 62K'
      newarkPN: '38K5371'

      name: '68K'
      mpn: 'MF25 68K'
      newarkPN: '38K5377'
    ,

      name: '75K'
      mpn: 'MF25 75K'
      newarkPN: '38K5382'
    ,

      name: '100K'
      mpn: 'MF25 100K'
      newarkPN: '58K3798'
    ,

      name: '120K'
      mpn: 'MCMF0W4FF1203A50'
      newarkPN: '58K3807'
    ,

      name: '150K'
      mpn: 'MF25 150K'
      newarkPN: '38K5294'
    ,

      name: '180K'
      mpn: 'MF25 180K'
      newarkPN: '38K5304'
    ,

      name: '220K'
      mpn: 'MCMF0W4FF2203A50'
      newarkPN: '58K3830'
    ,

      name: '270K'
      mpn: 'MF25 270K'
      newarkPN: '38K5325'
    ,

      name: '300K'
      mpn: 'MF25 300K'
      newarkPN: '38K5330'
    ,

      name: '330K'
      mpn: 'MCMF0W4FF3303A50'
      newarkPN: '58K3846'
    ,

      name: '390K'
      mpn: 'MF25 390K'
      newarkPN: '38K5346'
    ,

      name: '470K'
      mpn: 'MCMF0W4FF4703A50'
      newarkPN: '58K3861'
    ,

      name: '560K'
      mpn: 'MF25 560K'
      newarkPN: '38K5367'
    ,

      name: '680K'
      mpn: 'MCMF0W4FF6803A50'
      newarkPN: '58K3876'
    ,

      name: '750K'
      mpn: 'MF25 750K'
      newarkPN: '38K5383'
    ,

      name: '910K'
      mpn: 'MF25 910K'
      newarkPN: '38K5393'
    ,

      name: '1M'
      mpn: 'MCF 0.25W 1M'
      newarkPN: '38K0330'
    ,

      name: '10M'
      mpn: 'MRS25000C1005FCT00'
      newarkPN: '97K5461'
    ,

      #name: '1K +3500ppm/K Temp co'
      #mpn: ''


    # high precision
      name: '10K 0.1% (singles)'
      mpn: 'H810KBYA'
      newarkPN: '34R3609'
    ,

      name: '19K6 0.1% (singles)'
      mpn: 'H819K6BYA'
      newarkPN: '34R3691'
    ,

      name: '20K 0.1% (singles)'
      mpn: 'H820KBYA'
      newarkPN: '34R3713'
    ,

      name: '22K 0.1% (singles)'
      mpn: 'PR5Y-22KBI'
      newarkPN: '03P4751'
    ,

      name: '100K 0.1% (singles)'
      mpn: 'H8100KBYA'
      newarkPN: '34R3613'
    ,

      name: '200K 0.1% (singles)'
      mpn: 'H8200KBYA'
      newarkPN: '34R3715'

    # resistor networks
      name: '100K x 4 sil pack'
      mpn: '4605X-101-104LF'
      newarkPN: '32K9483'
    ,

      name: '100K x 8 sil pack'
      mpn: '4609X-101-104LF'
      newarkPN: '62J2907'
    ,


    # capacitors
      name: '100nF axial ceramic'
      mpn: 'SA105E104MARC'
      newarkPN: '97K9401'
    ,

      name: '10pF ceramic 2.5mm'
      mpn: 'C315C100J1G5TA'
      newarkPN: '32K5442'
    ,

      name: '15pF ceramic 2.5mm'
      mpn: 'MC0805N150J101A2.54MM'
      newarkPN: '46P6414'
    ,

      name: '18pF ceramic 2.5mm'
      mpn: 'MC0805N180J101A2.54MM'
      newarkPN: '46P6432'
    ,

      name: '22pF ceramic 2.5mm'
      mpn: 'MCRR25220COGJ0200'
      newarkPN: '1216407'
    ,

      name: '33pF ceramic 2.5mm'
      mpn: 'MCRR25330COGJ0200'
      newarkPN: '1216408'
    ,

      name: '47pF ceramic 2.5mm'
      mpn: 'MC0805N470J101A2.54MM'
      newarkPN: '46P6569'
    ,

      name: '100pF ceramic 2.5mm'
      mpn: 'MCRR25101COGJ0100'
      newarkPN: '1216416'
    ,

      name: '150pF ceramic 2.5mm'
      mpn: 'MC0805N151J101A2.54MM'
      newarkPN: '46P6420'
    ,

      name: '220pF ceramic 2.5mm'
      mpn: 'MC0805N221J101A2.54MM'
      newarkPN: '46P6474'
    ,

      name: '330pF ceramic 2.5mm'
      mpn: 'MCRR25331COGJ0100'
      newarkPN: '1216419'
    ,

      name: '470pF ceramic 2.5mm'
      mpn: 'MCRR25471COGJ0100'
      newarkPN: '1216420'
    ,

      name: '680pF ceramic 2.5mm'
      mpn: 'MC0805N681J101A2.54MM'
      newarkPN: '46P6621'
    ,

      name: '1nF ceramic 2.5mm'
      mpn: 'MC0805N102J101A2.54MM'
      newarkPN: '46P6384'
    ,

      name: '4p7 ceramic 5mm'
      mpn: '561R10TCCV47'
      newarkPN: '69K4725'
    ,

      name: '10pF ceramic 5mm'
      mpn: 'K100J15C0GH5TH5'
      newarkPN: '95C0948'
    ,

      name: '18pF ceramic 5mm'
      mpn: 'K180J15C0GF5TH5'
      newarkPN: '95C1002'
    ,

      name: '22pF ceramic 5mm'
      mpn: 'K220J15C0GF5TH5'
      newarkPN: '95C1006'
    ,

      name: '33pF ceramic 5mm'
      mpn: 'MCRR50330COGJ0200'
      newarkPN: '1216412'
    ,

      name: '47pF ceramic 5mm'
      mpn: 'K470J15C0GH5TH5'
      newarkPN: '95C1062'
    ,

      name: '150pF ceramic 5mm'
      mpn: 'K101J15C0GH5TH5'
      newarkPN: '95C0951'
    ,

      name: '100pF ceramic 5mm'
      mpn: 'MCRR50101COGJ0200'
      newarkPN: '1216414'
    ,

      name: '220pF ceramic 5mm'
      mpn: 'MCRR50221COGJ0200'
      newarkPN: '1216415'
    ,

      name: '330pF ceramic 5mm'
      mpn: 'SR211A331JAR'
      newarkPN: '1100509'
    ,

      name: '470pF ceramic 5mm'
      mpn: 'K471J15C0GF5TH5'
      newarkPN: '95C1064'
    ,

      name: '1nF polyester'
      mpn: 'B32529C102K'
      newarkPN: '9752897'
    ,

      name: '1n5 polyester'
      mpn: 'B32529C152K'
      newarkPN: '21C0492'
    ,

      name: '2n2 polyester'
      mpn: 'MCPBSFC-1J222KA45'
      newarkPN: '49P5385'
    ,

      name: '3n3 polyester'
      mpn: 'B32529C6332K289'
      newarkPN: '21C1233'
    ,

      name: '4n7 polyester'
      mpn: 'B32529C472K'
      newarkPN: '9752935'
    ,

      name: '6n8 polyester'
      mpn: 'B32529C682K'
      newarkPN: '9752943'
    ,

      name: '10nF polyester'
      mpn: 'ECQV1103JM'
      newarkPN: '1669192'
    ,

      name: '15nF polyester'
      mpn: 'ECQV1153JM'
      newarkPN: '1669193'
    ,

      name: '22nF polyester'
      mpn: 'ECQV1223JM'
      newarkPN: '1669194'
    ,

      name: '33nF polyester'
      mpn: 'ECQV1333JM'
      newarkPN: '1669195'
    ,

      name: '68nF polyester'
      mpn: 'ECQV1683JM'
      newarkPN: '1669197'
    ,

      name: '100nF polyester'
      mpn: 'ECQ-E2103KF'
      newarkPN: '49W0778'
    ,

      name: '150nF polyester'
      mpn: 'ECQ-E2153KF'
      newarkPN: '49W0895'
    ,

      name: '220nF polyester'
      mpn: 'B32529C224K'
      newarkPN: '9750894'
    ,

      name: '330nF polyester'
      mpn: '49W1099'
      newarkPN: 'ECQ-E2333KB'
    ,

      name: '470nF polyester'
      mpn: 'ECQ-E2473KB'
      newarkPN: '49W1198'
    ,

      name: '680nF polyester'
      mpn: 'BFC247076684'
      newarkPN: '1166042'
    ,

      name: '1uF polyester'
      mpn: '2222 370 11105'
      newarkPN: '98K6981'
    ,

      name: '1u5 polyester'
      mpn: 'B32529C155K189'
      newarkPN: '59T4277'
    ,

      name: '2u2 polyester'
      mpn: 'MKS2B042201F00KSSD'
      newarkPN: '10WX4288'
    ,

      name: '1nF polyprop'
      mpn: 'MKP2J011001B00KSSD'
      newarkPN: '46T6742'
    ,

      name: '6n8 polyprop'
      mpn: 'MKP2J016801C00KSSD'
      newarkPN: '46T6745'
    ,

      name: '10nF polyprop'
      mpn: 'MKP2J021001E00KSSD'
      newarkPN: '46T6746'
    ,

      name: '1nF 1% polystyrene'
      mpn: 'EXFS/HR 1000PF +/- 1%'
      newarkPN: '96K9639'
    ,

      name: '2.2nF 1% polystyrene'
      mpn: 'EXFS/HR 2200PF +/- 1%'
      newarkPN: '96K9642'
    ,

      name: '10nF 1% polystyrene'
      mpn: 'MKP/HR 10000PF +/- 1%'
      newarkPN: '73K0558'
    ,

      name: '1u0 elect'
      mpn: 'MCRH63V105M5X11'
      newarkPN: '70K9783'
    ,

      name: '2u2 elect'
      mpn: 'MCGPR63V225M5X11'
      newarkPN: '70K9713'
    ,

      name: '2u2 elect - low profile'
      mpn: 'ECA1HAK2R2X'
      newarkPN: '8766797'
    ,

      name: '4u7 elect'
      mpn: 'EEU-EB1J4R7S'
      newarkPN: '83T7049'
    ,

      name: '10u elect'
      mpn: 'MCGPR63V106M5X11'
      newarkPN: '38K4707'
    ,

      name: '22u elect'
      mpn: 'ECA-1JHG220'
      newarkPN: '17T5019'
    ,

      name: '47u elect'
      mpn: 'EKMG160ELL470ME11D'
      newarkPN: '23K3585'
    ,

      name: '1000uF 35V radial elect'
      mpn: 'EKMG350ELL102MK20S'
      newarkPN: '23K3631'
    ,

      name: '1000uF 50V radial elect'
      mpn: 'EKMG500ELL102MK25S'
      newarkPN: '23K3673'
    ,

      name: '1800uF 35V radial elect'
      mpn: 'EEU-FC1V182'
      newarkPN: '34M5928'
    ,

      name: '3300uF 35V radial elect'
      mpn: '35PX3300MEFC16X25'
      newarkPN: '39T8914'
    ,


    #3mm LEDs
      name: 'green 20mcd'
      mpn: 'L-934GD'
      newarkPN: '26M0074'
    ,

      name: 'red 20mcd'
      mpn: 'MC20449'
      newarkPN: '87K7075'
    ,

      name: 'yellow 20mcd'
      mpn: 'AND124Y'
      newarkPN: '15B5598'
    ,

      name: 'Bi-colour red/green'
      mpn: 'L-937EGW'
      newarkPN: '26M0085'
    ,

    #175mm LEDs
      name: 'Green'
      mpn: 'L-57GGD'
      newarkPN: '46W4629'
    ,

      name: 'Red'
      mpn: '4304H1'
      newarkPN: '93K6988'
    ,

      name: 'Yellow'
      mpn: '4305H7'
      newarkPN: '93F3520'
    ,

      name: 'Orange'
      mpn: 'L-934ND'
      newarkPN: '26M0081'
    ,

      name: 'Bi-colour'
      mpn: 'L-57EGW'
      newarkPN: '88K2494'
    ,

      name: 'Tri-colour'
      mpn: 'L-59EGC'
      newarkPN: '26M0046'
    ,

      name: 'Low profile green lens'
      mpn: 'CLB300GTP'
      newarkPN: '57P6495'
    ,

      name: 'Low profile yellow lens'
      mpn: 'CLB300YTP'
      newarkPN: '57P6497'
    ,

      name: 'Low profile red lens'
      mpn: 'CLB300RTP'
      newarkPN: '57P6496'
    ,

      name: 'Low profile clear lens'
      mpn: 'CLB300CTP'
      newarkPN: '57P6494'
    ,

      name: 'Lens clip'
      mpn: 'SPC125'
      newarkPN: '57P7008'
    ,

    #Discrete Semiconductors
      name: 'BC182L'
      mpn: 'NTE85'
      newarkPN: '06M7509'
    ,

      name: 'BC212L'
      mpn: 'BC327-25ZL1G'
      newarkPN: '37K9383'
    ,

      name: 'BC549B'
      mpn: 'BC237B'
      newarkPN: '08N7616'
    ,

      name: 'BC549C'
      mpn: 'BC549C'
      newarkPN: '04X5932'
    ,

      name: 'BC550B'
      mpn: 'NTE123AP'
      newarkPN: '06M7367'
    ,

      #name: 'BC559C'
      #50-0301 or 81-0442

      name: 'BC560C'
      mpn: 'BC560CG'
      newarkPN: '26K3448'
    ,

      name: 'TIP35C'
      mpn: 'TIP35C'
      newarkPN: '95M9105'
    ,

      name: 'TIP145'
      mpn: 'TIP145'
      newarkPN: '26M4142'
    ,

      name: 'J201'
      mpn: 'NTE458'
      newarkPN: '29C4607'
    ,

      name: 'J112'
      mpn: 'J112'
      newarkPN: '58K8918'
    ,

      name: 'BAT-42'
      mpn: 'BAT42'
      newarkPN: '89K1208'
    ,

      name: '1N4148'
      mpn: '1N4148'
      newarkPN: '58K9570'
    ,

      name: '1N4004'
      mpn: '1N4004'
      newarkPN: '10M2938'
    ,

      name: '1N5401'
      mpn: '1N5401'
      newarkPN: '58K9605'
    ,

      name: '1N5819'
      mpn: '1N5819'
      newarkPN: '90R9531'
    ,

      name: '2V7 zener'
      mpn: 'BZX55C2V7-TAP'
      newarkPN: '18M1862'
    ,

      name: '5V1 zener'
      mpn: 'BZX55C5V1-TAP'
      newarkPN: '55R1524'
    ,

      name: '5V6 zener'
      mpn: 'BZX55C5V6-TAP'
      newarkPN: '55R1525'
    ,

      name: '8V2 zener'
      mpn: 'BZX55C8V2-TR'
      newarkPN: '20H4383'
    ,

      name: '10V zener'
      mpn: 'BZX55C10-TAP'
      newarkPN: '18M1856'
    ,

      name: '12V zener'
      mpn: 'BZX55C12-TAP'
      newarkPN: '20H4171'
    ,

    #4000 series CMOS:
      name: '4001'
      mpn: 'CD4001BE'
      newarkPN: '80K5726'
    ,

      name: '4016'
      mpn: 'CD4016BE'
      newarkPN: '60K5098'
    ,

      name: '4050'
      mpn: 'HCF4050BEY'
      newarkPN: '89K0571'
    ,

      name: '4051'
      mpn: 'CD4051BE'
      newarkPN: '60K5119'
    ,

      name: '4052'
      mpn: 'HCF4052BEY'
      newarkPN: '89K0574'
    ,

      name: '4066'
      mpn: 'CD4066BE'
      newarkPN: '60K5124'
    ,

      name: '4093'
      mpn: 'CD4093BE'
      newarkPN: '60K5137'
    ,

      name: '4104'
      mpn: 'HEF4104BP'
      newarkPN: '10WX5484'
    ,

    #Opto-couplers:
      name: '6N137'
      mpn: '6N137'
      newarkPN: '52M1895'
    ,

      name: '6N139'
      mpn: '6N139'
      newarkPN: '35K3079'
    ,


    #74 series logic:
      name: '74HC04'
      mpn: 'SN74HC04N'
      newarkPN: '08F6425'
    ,

    #Power ICs:
      name: '78L05'
      mpn: 'LM78L05ACZ/NOPB'
      newarkPN: '41K6323'
    ,

      name: '78L09'
      mpn: 'TS78L09CT'
      newarkPN: '38K8953'
    ,

      name: '7812'
      mpn: 'LM340T-12/NOPB'
      newarkPN: '41K4771'
    ,

      name: '7815'
      mpn: 'L7815C-V'
      newarkPN: '89K1400'
    ,

      name: '79L05'
      mpn: 'L79L05ACZ'
      newarkPN: '89K0789'
    ,

      name: '7915'
      mpn: 'L7915CV'
      newarkPN: '72K7193'
    ,

      name: 'LM317T'
      mpn: 'LM317T'
      newarkPN: '32M2973'
    ,

      name: 'LM337T'
      mpn: 'LM337T'
      newarkPN: '58K8937'
    ,

      name: 'LM723'
      mpn: 'LM723CN'
      newarkPN: '89K0715'
    ,


    #Voltage References:
      name: 'LM329DZ'
      mpn: 'LM329DZ...'
      newarkPN: '97K3378'
    ,

      name: 'LM336Z-5'
      mpn: 'LM336Z-5.0/NOPB'
      newarkPN: '41K4741'
    ,

      name: 'LM4040DIZ-10'
      mpn: 'LM4040DIZ-10.0'
      newarkPN: '97K3490'
    ,

      name: 'LM4040CIZ-10'
      mpn: 'LM4040C10ILP'
      newarkPN: '14M2029'
    ,

      name: 'REF02'
      mpn: 'REF02CPZ'
      newarkPN: '59K9011'
    ,

    #Transistor arrays:
      name: 'SSM2220'
      mpn: 'SSM2220PZ'
      newarkPN: '19M1050'
    ,

      name: 'THAT300P'
      mpn: 'THAT300P14-U'
      newarkPN: '50M5196'
    ,

      name: 'THAT340P'
      mpn: 'THAT340P14-U'
      newarkPN: '50M5200'
    ,

      name: '4558'
      mpn: 'RC4558P'
      newarkPN: '60K6767'
    ,

      name: 'AD712'
      mpn: 'AD712JNZ'
      newarkPN: '59K4554'
    ,


      name: 'CA3140'
      mpn: 'CA3130EZ'
      newarkPN: '80K5721'
    ,

      name: 'LF412'
      mpn: 'OPA2134PA.'
      newarkPN: '97K6789'
    ,

      name : 'LM358 (replaces AN6562)'
      mpn: 'LM358AP'
      newarkPN: '67K0318'
    ,

      name: 'LM1458 or MC1458'
      mpn: 'LM1458N/NOPB'
      newarkPN: '41K3510'
    ,

      name: 'LT1013CP'
      mpn: 'LT1013CP'
      newarkPN: '60K6194'
    ,

      name: 'OP177GPZ'
      mpn: 'OP177GPZ'
      newarkPN: '59K8777'
    ,

      name: 'OP275GP'
      mpn: 'OP275GPZ'
      newarkPN: '19M1029'
    ,

      name: 'OPA2134'
      mpn: 'OPA2134PA.'
      newarkPN: '97K6789'
    ,

      name: 'OPA2277 (see also LT1013)'
      mpn: 'OPA2277P'
      newarkPN: '01M3139'
    ,

      name: 'TL072'
      mpn: 'OPA2134PA.'
      newarkPN: '97K6789'
    ,

      name: 'TL072ACP'
      mpn: 'TL072ACP'
      newarkPN: '60K6987'
    ,

      name: 'TL074'
      mpn: 'TL074CN'
      newarkPN: '60K6990'
    ,

      name: 'TL074ACN'
      mpn: 'TL074ACN'
      newarkPN: '67K1275'
    ,

    # Special (analogue switches, OTAs, VCAs, comparators):
      name: 'DG403DJ'
      mpn: 'DG403DJ-E3'
      newarkPN: '49K9536'
    ,

      name: 'LM13700'
      mpn: 'LM13700N/NOPB'
      newarkPN: '41K3507'
    ,

      name: 'LM311'
      mpn: 'LM311DT'
      newarkPN: '89K0674'
    ,

      name: 'LF398'
      mpn: 'LF398N/NOPB'
      newarkPN: '41K2551'
    ,

      name: 'LM2903'
      mpn: 'LM2903N'
      newarkPN: '38C7339'
    ,

      name: 'THAT2180LC'
      mpn: 'THAT2180CL08-U'
      newarkPN: '50M5191'
    ,

    # Spectrol Pots -used on some older 5U modules only
      name: '10K lin SP248'
      mpn: '248FGJSPXB25103MA'
      newarkPN: '98K8385'
    ,

      name: '25K lin SP248'
      mpn: '248FGJSPXB25253MA'
      newarkPN: '98K8388'
    ,

      name: '50K lin SP248'
      mpn: '248FGJSPXB25503MA'
      newarkPN: '98K8390'
    ,

      name: '100K lin SP248'
      mpn: '248FGJSPXB25104MA'
      newarkPN: '98K8386'
    ,

      name: '50K lin SP249'
      mpn: '249FGJSPXB25503KA'
      newarkPN: '98K8411'
    ,

      name: '10K log SP248'
      mpn: '248FGJSPXB25103ML'
      newarkPN: '98K8400'
    ,

      name: '50K log SP248'
      mpn: '248FGJSPXB25503MA'
      newarkPN: '98K8390'
    ,

      name: '100K log SP248'
      mpn: '248FGJSPXB25104ML'
      newarkPN: '98K8401'
    ,

      name: '10K dual lin SP'
      mpn: '14920F0GJSX13103KA'
      newarkPN: '39K1229'
    ,

      name: 'Spectrol/Vishay nuts'
      mpn: 'N602'
      newarkPN: '01M8381'
    ,

      name: '10K lin Alpha 16mm'
      mpn: 'PDB181-K420K-103B'
      newarkPN: '04B9684'
    ,

      name: '47K lin Alpha 16mm'
      mpn: '23ESA473KMF16N'
      newarkPN: '95W9495'
    ,

      name: '1M log Alpha 16mm'
      mpn: '53C21MEG'
      newarkPN: '04F9002'
    ,

    #Trimmers
      name: '1K m/t cermet'
      mpn: '3296W-1-102LF'
      newarkPN: '62J1420'
    ,

      name: '2K m/t cermet'
      mpn: '3296W-1-202LF'
      newarkPN: '62J1436'
    ,

      name: '5K m/t cermet'
      mpn: '3296W-1-502LF'
      newarkPN: '62J1471'
    ,

      name: '10K m/t cermet'
      mpn: '3296W-1-103LF'
      newarkPN: '62J1423'
    ,

      name: '20K m/t cermet'
      mpn: '3296W-1-203LF'
      newarkPN: '62J1439'
    ,

      name: '50K m/t cermet'
      mpn: '3296W-1-503LF'
      newarkPN: '62J1474'
    ,

      name: '100K m/t cermet'
      mpn: '3296W-1-104LF'
      newarkPN: '62J1426'
    ,

      name: '200K m/t cermet'
      mpn: '3296W-1-204LF'
      newarkPN: '62J1442'
    ,

      name: '1M m/t cermet'
      mpn: '3296W-1-105LF'
      newarkPN: '62J1429'
    ,

      name: '1K 6mm'
      mpn: '3386F-1-102TLF'
      newarkPN: '62J2091'
    ,

      name: '5K 6mm'
      mpn: '3386F-1-502TLF'
      newarkPN: '62J2124'
    ,

      name: '20K 6mm'
      mpn: '3386F-1-203LF'
      newarkPN: '62J2104'
    ,

      name: '50K 6mm'
      mpn: '3386F-1-503LF'
      newarkPN: '62J2125'
    ,

      name: '100K 6mm'
      mpn: '3386F-1-104LF'
      newarkPN: '62J2094'
    ,

      name: '1K horiz'
      mpn: 'CB10LV102M'
      newarkPN: '16R3918'
    ,

      name: '2K2 horiz'
      mpn: 'CB10LV222M'
      newarkPN: '16R3925'
    ,

      name: '10K horiz'
      mpn: 'CB10LV103M'
      newarkPN: '16R3920'
    ,

      name: '22K horiz'
      mpn: 'CB10LV223M'
      newarkPN: '16R3926'
    ,

      name: '47K horiz'
      mpn: 'CB10LV473M'
      newarkPN: '16R3931'
    ,

      name: '100K horiz'
      mpn: 'CB10LV104M'
      newarkPN: '16R3921'
    ,

      name: '470K horiz'
      mpn: 'CB10LV474M'
      newarkPN: '16R3932'
    ,

      name: '1M horiz'
      mpn: 'CB10MV105ME'
      newarkPN: '04M8535'
    ,


    #IC Sockets
      name: '8-pin DIL'
      mpn: '08-3518-10'
      newarkPN: '33P8911'
    ,

      name: '14-pin DIL'
      mpn: '110-13-314-41-001000'
      newarkPN: '17C2226'
    ,

      name: '16-pin DIL'
      mpn: '110-13-316-41-001000'
      newarkPN: '17C2229'
    ,

      name: '18-pin DIL'
      mpn: '110-93-318-41-001000'
      newarkPN: '17C2308'
    ,

      name: '28-pin skinny DIL'
      mpn: '110-13-328-41-001000'
      newarkPN: '17C2239'
    ,


      name: '20-way SIL'
      mpn: '2-1571994-0'
      newarkPN: '52K3454'
    ,

      name: 'TV35 7.2 degC/W'
      mpn: 'TV35'
      newarkPN: '10WX1054'
    ,

      name: 'TO-220 clip on (Filtrex)'
      mpn: 'FK 237 SA 220 O'
      newarkPN: '34M6211'
    ,

      # Interconnects
      name: '4-way terminal block'
      mpn: '1792889'
      newarkPN: '78T0422'
    ,

      name: '2-way jumpers'
      mpn: '63429-202LF'
      newarkPN: '20M2172'
    ,

      name: '8-way jumper lead'
      mpn: '22-28-4080'
      newarkPN: '56H2000'
    ,

      name: '4 way 0.156” MTA hdr'
      mpn: '640445-4'
      newarkPN: '90F4055'
    ,

      name: '4 way 0.156” MTA cover'
      mpn: '640551-4'
      newarkPN: '50H6807'
    ,

      name: '4 way 0.156” MTA hsg'
      mpn: '3-640428-4'
      newarkPN: '52K4335'
    ,

      name: '2 way 0.1” MTA hdr'
      mpn: '640456-2'
      newarkPN: '90F4250'
    ,

      name: '3-way 0.1” MTA hdr'
      mpn: '640456-3'
      newarkPN: '90F4251'
    ,

      name: '4-way 0.1” MTA hdr'
      mpn: '640456-4'
      newarkPN: '90F5641'
    ,

      name: '5-way 0.1” MTA hdr'
      mpn: '640456-5'
      newarkPN: '90F5643'
    ,

      name: '6-way 0.1” MTA hdr'
      mpn: '640456-6'
      newarkPN: '90F5645'
    ,

      name: '2-way 0.1” MTA hsg'
      mpn: '3-640440-2'
      newarkPN: '52K4337'
    ,

      name: '3-way 0.1” MTA hsg'
      mpn: '3-640440-3'
      newarkPN: '52K4338'
    ,

      name: '4-way 0.1” MTA hsg'
      mpn: '3-640440-4'
      newarkPN: '45J3195'
    ,

      name: '5-way 0.1” MTA hsg'
      mpn: '3-640440-5'
      newarkPN: '52K4339'
    ,

      name: '6-way 0.1” MTA hsg'
      mpn: '3-640440-6'
      newarkPN: '52K4340'
    ,

      name: '0.1” 2-way MLX hdr'
      mpn: '22-27-2021'
      newarkPN: '74C1122'
    ,

      name: '0.1” 3-way MLX hdr'
      mpn: '22-27-2031..'
      newarkPN: '72K5810'
    ,

      name: '0.1” 4-way MLX hdr'
      mpn: '22-27-2041..'
      newarkPN: '60K8455'
    ,

      name: '0.1” 5-way MLX hdr'
      mpn: '22-27-2051'
      newarkPN: '94C5654'
    ,

      name: '0.1” 6-way MLX hdr'
      mpn: '22-27-2061'
      newarkPN: '56H0719'
    ,

      name: '0.1” 8-way MLX hdr'
      mpn: '22-27-2081'
      newarkPN: '26M6368'
    ,

      name: '0.1” 2-way MLX hsg'
      mpn: '22-01-2025.'
      newarkPN: '09WX0291'
    ,

      name: '0.1” 3-way MLX hsg'
      mpn: '22-012035'
      newarkPN: '76K0741'
    ,

      name: '0.1” 4-way MLX hsg'
      mpn: '22-01-2045'
      newarkPN: '55H8902'
    ,

      name: '0.1” 5-way MLX hsg'
      mpn: '22-01-2055'
      newarkPN: '25M1705'
    ,

      name: '0.1” 6-way MLX hsg'
      mpn: '22-01-2065'
      newarkPN: '82K9152'
    ,

      name: '0.1” 8-way MLX hsg'
      mpn: '22-01-2085'
      newarkPN: '55H8914'
    ,

    # Sockets & Plugs
      name: '1/4” 112APC socket'
      mpn: '112APCX'
      newarkPN: '98K5399'
    ,

      name: '1/4” Chinese Neutrik plug'
      mpn: 'NYS201'
      newarkPN: '66F9797'
    ,

      name: '5-pin socket (midi)'
      mpn: 'NYS325'
      newarkPN: '97K6702'
    ,

      name: 'Ferrites'
      mpn: 'BL01RN1A1D2B'
      newarkPN: '83K0778'
    ,

      name: '4MHz Xtal'
      mpn: 'HC49S-4-20-50-60-30-ATF'
      newarkPN: '33P6968'
    ,

      name: 'Cable ties (pack of 100)'
      mpn: 'T18RSA-NAT(100 PACK)'
      newarkPN: '24M8779'
    ,

      name: '20mm PCB fuseholder'
      mpn: '05200002H'
      newarkPN: '78J9978'
    ,

    # Switches
      name: 'DIL SW (4-way)'
      mpn: 'MCNDS-04-V'
      newarkPN: '26M1103'
    ,

    # Modular 5U:
      name: 'SPDT toggle (on-on)'
      mpn: '5636A9'
      newarkPN: '13M4539'
    ,

      name: 'SPDT toggle (on-off-on)'
      mpn: '5639A9'
      newarkPN: '13M4543'
    ,

      name: 'SPDT toggle (mom-off-mom)'
      mpn: '5637A9'
      newarkPN: '13M4546'
    ,

      name: 'DPDT toggle (on-on)'
      mpn: '5646A9'
      newarkPN: '03M5568'
    ,

    # Rack projects (eg. TM3030, Filtrex, SE-330 and HVM):
      name: 'SPDT PCB mount (on-on)'
      mpn: '1MS1T2B4M7RE'
      newarkPN: '98K4967'
    ,

      name: 'SPDT PCB mount (on-off-on)'
      mpn: '1MS3T2B4M7RE'
      newarkPN: '98K4978'
    ,

      name: 'DPDT PCB mount (on-on)'
      mpn: '1MD1T2B4M7RE'
      newarkPN: '98K4951'
    ,

    # Euro modules
      name: 'DPDT PCB mount on-on'
      mpn: '1MD1T2B4M6RE'
      newarkPN: '98K4950'
    ,


    # Power
      name: 'Cable grommet'
      mpn: '241/69/79B'
      newarkPN: '08WX5745'
    ]
