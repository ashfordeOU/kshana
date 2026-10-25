# docs--kind-space-weather: translations (sv)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenariotyp i motor v{ $version }, familj <a1>GNSS-mätningar, positionering och integritet</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-f6b7ca020692 = Familjesida: <a1>GNSS-mätningar, positionering och integritet</a1>

seg-f2c2860db799 = En körning av <c1/> sammanfattas som: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; densitet x1.49 vid { "300" } km (MODELLED)

seg-6bb05c41eba2 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-c367f1aacd0b = Exemplet <c1/> anger bland annat:

seg-02dc0d42fb21 = sfu

seg-1dd966268e12 = { "2" } nT

seg-d245f215f331 = Resultatetikett (motorns egen): MODELLED — sol- och geomagnetiska index, exosfärtemperatur enligt Jacchia-71 och statisk densitet enligt Jacchia-71 vid dygnsmedeltemperaturen

seg-c1c6f2f73fb5 = Diagrammet som motorn skriver för scenarios/space-weather.toml, typ space-weather

seg-15587da59e8e = <b>MODELLED</b> Sol- och geomagnetiska index (definitionsmässig Kp↔ap-tabell), exosfärtemperaturen enligt Jacchia-1971 och den termosfäriska densiteten enligt Jacchia { "1971" } (SAO Special Report { "332" }: statiska diffusionsprofiler som återger dess Tabell { "7" }, med dygns-, geomagne

seg-f8eef6eabfb2 = <b>MODELLED</b> Sol- och geomagnetiska index (definitionsmässig Kp↔ap-tabell), exosfärtemperaturen enligt Jacchia-1971 och den termosfäriska densiteten enligt Jacchia { "1971" } (SAO Special Report { "33" }. Oberoende referens (ExternalDataset): Definitionsmässig Kp↔ap-tabell + sluten form för exosfärtemperaturen enligt Jacchia-1971 (överensstämmer inom <{ "1" } K mot de publicerade ankarvärdena, tests/space_weather_reference.rs); densiteten karakteriseras mot pymsis NRLMSISE-00 (en oberoende NRL-modell): solcykelns svängning på { "800" } km är 10.4x mot 13.6x för NRLMSISE-00. Revision { "0.30" }: den kalibrerade aktivitetsfaktorn av första ordningen ersattes av Jacchia { "1971" } (densitet i standardscenariot vid { "40" }

seg-72979b637644 = MODELLED — sol- och geomagnetiska index, exosfärtemperatur enligt Jacchia-71 och statisk densitet enligt Jacchia-71 vid dygnsmedeltemperaturen (resultat <c1/>)

seg-0306ee022298 = MODELLED: densiteten stämmer med densiteter härledda ur accelerometrar (TOLEOS CHAMP och GRACE) inom en faktor { "2" } vid solmaximum men är ungefär 1.7x för tät under solminimet { "2008" }. (typkatalog (<c1/>))

seg-b86a312077b5 = ÄRLIG AVGRÄNSNING: MODELLED. Omvandlingen Kp<->ap är den definitionsmässiga IAGA-tabellen och exosfärtemperaturen är validerad mot publicerade storleksordningar för solminimum, medelvärde och solmaximum, men densitetskorrektionen är en KALIBRERAD KOPPLING AV FÖRSTA ORDNINGEN via skalhöjd — den fångar rätt tecken, monotoni och storleksordning, INTE den absoluta noggrannheten hos en datavaliderad atmosfär (NRLMSISE-00). Kör: kshana scenarios/space-weath (kommentar i scenariofilen, rad { "10" } till { "15" })

seg-10cf16c12a2a = Rymdvädermiljö och aktivitetsdriven termosfärisk densitet är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan sätts samman av modellerade delar, så förmågan förblir modellerad. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-3dd29f8fba14 = <s1>Föregående</s1>space-packet

seg-ff9d9a41692b = <s1>Nästa</s1>spectrum
