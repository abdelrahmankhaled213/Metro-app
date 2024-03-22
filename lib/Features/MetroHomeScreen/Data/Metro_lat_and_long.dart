 class Stations{
  String stationname;
  double lat;
  double long;
  String whichline;
  Stations(
       this.stationname,
     this.lat,
     this.long,
     this.whichline
 );
static var stationlista=
<Stations>[
Stations( "Helwan", 29.848962500000003, 31.3342226, "line1"),
Stations("Ain-Helwan",29.862609100000004,31.324875399999996,"line1"),
Stations("Helwan University",29.869451400000003,31.320066899999997,"line1"),
Stations("Wadi Hof",29.879082399999998,31.3135831,"line1"),
Stations("Hadayek Helwan",29.897136000000003,31.303966199999998,"line1"),
Stations("El-Maasara",29.906078400000002,31.299515799999998,"line1"),
Stations("Tora El-Asmant",29.9259651,31.2875444,"line1"),
Stations("Kozzika",29.936259,31.281820600000003,"line1"),
Stations("Tora El-Balad",29.9467633,31.272979999999997,"line1"),
Stations("Thakanat El-Maadi",29.953300900000002,31.262956,"line1"),
Stations("Maadi",29.9603028,31.2576431,"line1"),
Stations("Hadayek El-Maadi",29.9702409,31.250512599999997,"line1"),
Stations("Dar El-Salam",29.982066,31.242175300000003,"line1"),
Stations("El-Zahraa",29.995481700000003,31.2311768,"line1"),
Stations("Mar Girgis",30.0069733999999996,31.2298586000000004,"line1"),
Stations("El-malek_EL-saleh",30.177109,31.2310717,"line1"),
Stations("Al-Sayeda Zeinab",30.029287,31.2354308,"line1"),
Stations("Saad Zaghloul",30.0370333,31.238362000000002,"line1"),
Stations("Sadat",30.0441361,31.2344239,"line1"),
Stations("Gamal AbdAl",30.880441,31.2023067,"line1"),
Stations("Urabi",30.056688499999996,31.2420542,"line1"),
Stations("Al-Shohadaa",30.061071400000003,31.2460506,"line1"),
Stations("Ghamra",30.069028999999997,31.2646168,"line1"),
Stations("El-Demerdash",30.0773159,31.277801,"line1"),
Stations("Manshiet El-Sadr",30.081985200000002,31.287534500000003,"line1"),

Stations("Kobri El-Qobba",30.087197000000003,31.2941041,"line1"),

Stations("Hammamat El-Qobba",30.0912364,31.298911200000003,"line1"),

Stations("Saray El-Qobba",30.097645999999997,31.3045631,"line1"),

Stations("Hadayeq El-Zaitoun",30.1058896,31.3104833,"line1"),

Stations("Helmeyet El-Zaitoun",30.113254800000004,31.313964700000003,"line1"),

Stations("El-Matareyya",30.1213363,31.313722299999995,"line1"),

Stations("Ain-Shams",30.131025700000002,31.319091299999997,"line1"),

Stations("Ezbet El-Nakhl",30.139318000000003,31.324422199999997,"line1"),

Stations("El-Marg",30.152101499999997,31.335730199999997,"line1"),

   Stations("New El-Marg",30.163648700000003,31.3383642,"line1"),
Stations("El-Mounib",29.981094400000003,31.2123247,"line2"),
Stations("Sakiat Mekky",29.995493799999995,31.208655999999998,"line2"),
Stations("Omm El-Masryeen",30.005653899999995,31.208120199999996,"line2"),
Stations("Giza",30.01089,31.205750000000002,"line2"),
Stations("Faisal",30.017042500000002,31.203973400000002,"line2"),
Stations("Cairo University",30.0272027,31.2085261999999998,"line2"),
Stations("El-Bohoth",30.035780600000002,31.200167099999994,"line2"),
Stations("Dokki",30.038439500000003,31.212227900000002,"line2"),
Stations("Gezira(Opera)",30.0419477,31.224979400000002,"line2"),
Stations("Mohamed Naguib",30.045321599999998,31.244162299999996,"line2"),
Stations("Ataba",30.052346000000004,31.246803,"line2"),
Stations("Masarra",30.0708952,31.2451011,"line2"),
Stations("Road El-Farag",30.0805881,31.2454069,"line2"),
Stations("Sant Teresa",30.087956900000002,31.2454927,"line2"),
Stations("Khalafawy",30.097228899999998,31.2454981,"line2"),
Stations("Mezallat",30.1041743,31.245641400000004,"line2"),
Stations("Kolleyyet El-Zeraa",30.1136919,31.2486699,"line2"),
Stations("Shubra El-Kheima",30.1224317,31.244537899999997,"line2"),
Stations("Airport",30.1119203,31.4006524,"line3"),
  Stations("Adly Mansour",30.147051, 31.421439,"line3"),
  Stations("El Haykestep ",30.143768,31.404706,"line3"),
Stations("Omar ibn El-Khattab",30.140379699999997,31.3943446,"line3"),
  Stations("Qobaa",30.134790,31.383856,"line3"),
// Stations("El Arab",30.9150146000000003,29.5455698999999997,"line3"),
  Stations("Hesham Barakat",30.131078,31.372880,"line3"),
  Stations("El-Nozha",30.128231,31.360045,"line3"),
  Stations("Nadi El Shams",30.122310, 31.343970,"line3"),
Stations("Alf Maskan",30.119013,31.340187,"line3"),
Stations("Heliopolis",30.112315,31.343850699999997,"line3"),
  Stations("Haroun",30.101834899999997,31.333484900000002,"line3"),
Stations("Al-Ahram",30.091715999999995,31.3263157,"line3"),
Stations("Koleyet El-Banat",30.0834374,31.328841799999996,"line3"),
Stations("Stadium",25.277844599999998,55.3614233,"line3"),
Stations("Abbassia",30.071984999999998,31.283375,"line3"),
Stations("Fair Zone",30.029240,31.235400,"line3"),
Stations("Abdou Pasha",30.064781,31.274749999999997,"line3"),
Stations("Elgeish",30.061752000000002,31.266882,"line3"),
Stations("Bab El-Shaaria",30.054144,31.255876999999998,"line3"),
  Stations("Ataba", 30.053560, 31.238800, "line3"),
Stations("Nasser",30.0535,31.238733,"line3"),
Stations("Maspero",30.055607899999995,31.2320888,"line3"),
Stations("Zamalek",30.0609422,31.219708999999998,"line3"),
Stations("Kit-Kat",30.0665411,31.213076399999995,"line3"),
Stations("Sudan St",30.0446064,31.1939586,"line3"),
Stations("El moneera",30.081053599999997,31.2025336000000002,"line3"),
Stations("EL bohy",30.08213,31.2105333,"line3"),
Stations("Imababa",30.0763918,31.2078128999999997,"line3"),
Stations("El tawfiqia",30.0650819000000003,31.2027477,"line3"),
Stations("Wadi EL Niel",30.587313,31.2009005,"line3"),
Stations("shehab",30.0535081,31.1952959,"line3")
];
static var line1=<Stations>[
  Stations( "Helwan", 29.848962500000003, 31.3342226, "line1"),
  Stations("Ain-Helwan",29.862609100000004,31.324875399999996,"line1"),
  Stations("Helwan University",29.869451400000003,31.320066899999997,"line1"),
  Stations("Wadi Hof",29.879082399999998,31.3135831,"line1"),
  Stations("Hadayek Helwan",29.897136000000003,31.303966199999998,"line1"),
  Stations("El-Maasara",29.906078400000002,31.299515799999998,"line1"),
  Stations("Tora El-Asmant",29.9259651,31.2875444,"line1"),
  Stations("Kozzika",29.936259,31.281820600000003,"line1"),
  Stations("Tora El-Balad",29.9467633,31.272979999999997,"line1"),
  Stations("Thakanat El-Maadi",29.953300900000002,31.262956,"line1"),
  Stations("Maadi",29.9603028,31.2576431,"line1"),
  Stations("Hadayek El-Maadi",29.9702409,31.250512599999997,"line1"),
  Stations("Dar El-Salam",29.982066,31.242175300000003,"line1"),
  Stations("El-Zahraa",29.995481700000003,31.2311768,"line1"),
  Stations("Mar Girgis",30.0069733999999996,31.2298586000000004,"line1"),
  Stations("El-malek_EL-saleh",30.177109,31.2310717,"line1"),
  Stations("Al-Sayeda Zeinab",30.029287,31.2354308,"line1"),
  Stations("Saad Zaghloul",30.0370333,31.238362000000002,"line1"),
  Stations("Sadat",30.0441361,31.2344239,"line1"),
  Stations("Gamal AbdAl",30.880441,31.2023067,"line1"),

  Stations("Urabi",30.056688499999996,31.2420542,"line1"),

  Stations("Al-Shohadaa",30.061071400000003,31.2460506,"line1"),

  Stations("Ghamra",30.069028999999997,31.2646168,"line1"),

  Stations("El-Demerdash",30.0773159,31.277801,"line1"),

  Stations("Manshiet El-Sadr",30.081985200000002,31.287534500000003,"line1"),

  Stations("Kobri El-Qobba",30.087197000000003,31.2941041,"line1"),

  Stations("Hammamat El-Qobba",30.0912364,31.298911200000003,"line1"),

  Stations("Saray El-Qobba",30.097645999999997,31.3045631,"line1"),

  Stations("Hadayeq El-Zaitoun",30.1058896,31.3104833,"line1"),

  Stations("Helmeyet El-Zaitoun",30.113254800000004,31.313964700000003,"line1"),

  Stations("El-Matareyya",30.1213363,31.313722299999995,"line1"),

  Stations("Ain-Shams",30.131025700000002,31.319091299999997,"line1"),

  Stations("Ezbet El-Nakhl",30.139318000000003,31.324422199999997,"line1"),

  Stations("El-Marg",30.152101499999997,31.335730199999997,"line1"),

];
static var line2=<Stations>[Stations("El-Mounib",29.981094400000003,31.2123247,"line2"),
  Stations("Sakiat Mekky",29.995493799999995,31.208655999999998,"line2"),
  Stations("Omm El-Masryeen",30.005653899999995,31.208120199999996,"line2"),
  Stations("Giza",30.01089,31.205750000000002,"line2"),
  Stations("Faisal",30.017042500000002,31.203973400000002,"line2"),
  Stations("Cairo University",30.0272027,31.2085261999999998,"line2"),
  Stations("El-Bohoth",30.035780600000002,31.200167099999994,"line2"),
  Stations("Dokki",30.038439500000003,31.212227900000002,"line2"),
  Stations("Gezira(Opera)",30.0419477,31.224979400000002,"line2"),
  Stations("Mohamed Naguib",30.045321599999998,31.244162299999996,"line2"),
  Stations("Ataba",30.052346000000004,31.246803,"line2"),
  Stations("Masarra",30.0708952,31.2451011,"line2"),
  Stations("Road El-Farag",30.0805881,31.2454069,"line2"),
  Stations("Sant Teresa",30.087956900000002,31.2454927,"line2"),
  Stations("Khalafawy",30.097228899999998,31.2454981,"line2"),
  Stations("Mezallat",30.1041743,31.245641400000004,"line2"),
  Stations("Kolleyyet El-Zeraa",30.1136919,31.2486699,"line2"),
  Stations("Shubra El-Kheima",30.1224317,31.244537899999997,"line2"),
];
static var line3=<Stations>[
  Stations("Airport",30.1119203,31.4006524,"line3"),
  Stations("Omar ibn El-Khattab",30.140379699999997,31.3943446,"line3"),
  Stations("El Arab",30.9150146000000003,29.5455698999999997,"line3"),
  Stations("Alf Maskan",30.119013,31.340187,"line3"),
  Stations("Heliopolis",30.112315,31.343850699999997,"line3"),
  Stations("Al-Ahram",30.091715999999995,31.3263157,"line3"),
  Stations("Haroun",30.101834899999997,31.333484900000002,"line3"),
  Stations("Koleyet El-Banat",30.0834374,31.328841799999996,"line3"),
  Stations("Stadium",25.277844599999998,55.3614233,"line3"),
  Stations("Abbassia",30.071984999999998,31.283375,"line3"),
  Stations("Fair Zone",30.073256999999998,31.30098,"line3"),
  Stations("Abdou Pasha",30.064781,31.274749999999997,"line3"),
  Stations("Elgeish",30.061752000000002,31.266882,"line3"),
  Stations("Bab El-Shaaria",30.054144,31.255876999999998,"line3"),
  Stations("Nasser",30.0535,31.238733,"line3"),
  Stations("Maspero",30.055607899999995,31.2320888,"line3"),
  Stations("Zamalek",30.0609422,31.219708999999998,"line3"),
  Stations("Kit-Kat",30.0665411,31.213076399999995,"line3"),
  Stations("Sudan St",30.0446064,31.1939586,"line3"),
  Stations("El moneera",30.081053599999997,31.2025336000000002,"line3"),
  Stations("EL bohy",30.08213,31.2105333,"line3"),
  Stations("Imababa",30.0763918,31.2078128999999997,"line3"),
  Stations("El tawfiqia",30.0650819000000003,31.2027477,"line3"),
  Stations("Wadi EL Niel",30.587313,31.2009005,"line3"),
  Stations("shehab",30.0535081,31.1952959,"line3")
];
}

