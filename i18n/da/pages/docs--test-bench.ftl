# docs--test-bench: translations (da)

seg-245fe1f87b08 = Fil

seg-e305279d5b11 = Indhold

seg-292871e5747d = Kilde: <c1/>

seg-d18a29239225 = Kørsel af en modtager mod et eksporteret scenarie

seg-aa3498c7cb16 = En modtagerproducent, der ejer en GNSS-simulator til laboratoriebrug, kan afspille et Kshana-scenaries køretøjsbevægelse gennem den, optage, hvad modtageren under test gør, og score den log med <c1/> mod hændelser, der er angivet før kørslen. Kshana leverer bevægelsen, hændelsestiderne og scoringen. Den skriver <b>intet signal</b>: intet, der eksporteres her, syntetiserer, modellerer eller sender en radiofrekvens- eller basisbåndsbølgeform, og en eksporteret hændelse er et mærket tidsinterval, ikke en opskrift på at frembringe interferens. Simulatoren og dens operatør leverer signalerne, og operatøren er ansvarlig for kun at køre dem, hvor det er tilladt (ledningsført eller afskærmet, efter simulatorens egne sikkerhedsanvisninger).

seg-414c7774d133 = Denne side er en metode. Den publicerer ingen resultater.

seg-a0ad7b35922f = { "1" }. Eksport

seg-798d75d3b65c = Gælder for typen <c1/> (en køreprofil med attitude; udfaldene i navigationstilstanden er hændelserne) og for <c2/> og <c3/> (en stationær modtager i scenariets varighed; en <c4/>-scenariets jammer er én hændelse over kørslen). Andre typer angiver, hvorfor de ikke har nogen køretøjsbane. <c5/> er UTC-tidspunktet for bevægelsens tidsnul (standard 2024-01-01T00:{ "00" }:00Z); scenarierne bærer ingen egen kalenderdato for køretøjsbevægelse. Det skal være et reelt UTC-tidspunkt, <c6/> (et efterstillet <c7/> accepteres) med året i intervallet { "2000" } til { "2099" } og hvert felt inden for sit område; alt andet afvises. Outputtet er byte-identisk for det samme scenarie og den samme epoke.

seg-c153d8ef8735 = én række pr. sample: <c1/>, jordfast <c2/>, <c3/>, geodætisk <c4/>, <c5/>, <c6/>, <c7/>

seg-fa4c8c0d2b72 = epoken, systemerne, enhederne, kolonnerne og tolerancerne for rundtur i den CSV

seg-8c74ca211e3a = NMEA { "0183" }-sætningerne <c1/> og <c2/> pr. sample, med kontrolsummer

seg-2b0fd541f1dc = en <c1/>-linje og derefter <c2/>-rækker (skrives kun, når hvert sampleinterval er det samme hele antal millisekunder; når den udelades, siger kommandoen hvorfor på standardfejl)

seg-d09d2dab9a17 = de samme hændelser som <c1/>-blokke for et <c2/>-scenarie

seg-866a3c4870af = kørslen som et <a1><c1/></a1>-dokument for en <c2/>-optagelse: hændelserne som angiven reference, med <c3/>, <c4/>, <c5/>, hver hændelses <c6/> og effekt, som laboratoriet skal udfylde

seg-9ea6a94d4586 = Systemer og konventioner

seg-8d3b7d2ef815 = <b>Position:</b> WGS { "84" }, jordfast (ECEF: <c1/> gennem ækvator ved nulmeridianen, <c2/> gennem polen); <c3/>, <c4/>, <c5/> angiver den samme position geodætisk, <c6/> over ellipsoiden.

seg-93a2975d2a19 = <b>Hastighed:</b> jordfaste akser, relativt til Jorden.

seg-be05c2278e98 = <c1/> med uret fra sand nord i [{ "0" }, { "360" }), <c2/> næsen op er positiv, <c3/> højre vinge ned er positiv; yaw-pitch-roll (3-2-1) fra det lokale nord-øst-ned-system til kropsakserne x fremad, y til højre, z ned. En stationær kilde skriver nuller. NMEA og waypointteksten bærer ingen attitude.

seg-3c3ad1295628 = <b>Heading er kroppens yaw, ikke bevægelsesretningen.</b> I køreprofilen <c1/> yawer kroppen i firkantbølger, mens hastigheden følger med, så heading og kurs over grunden kan afvige med flere tiere grader (op til cirka { "77" } grader i det medfølgende scenarie <c2/>). NMEA-kursen <c3/> er kursen over grunden, hastighedsvektorens retning, så en simulator, der læser heading fra bevægelsesfilen, og en, der læser kurs fra NMEA-filen, ser forskellige vinkler. Kursen over grunden fra CSV'en er <c4/> af dens hastighed roteret til nord-øst-ned.

seg-224b53995157 = <b>Højden følger scenariet.</b> For <c1/> er <c2/> typens egen tangentplan-trinvise fremskrivning af dens reference og holdes ikke konstant (cirka { "7" } m over de { "180" } s af <c3/>); det er scenariets bevægelse, skrevet som den er.

seg-f78a354f96ee = <b>Pladsholdere i NMEA <c1/>.</b> Positionskvalitet ({ "1" }), anvendte satellitter ({ "12" }) og HDOP ({ "1.0" }) skrives kun for at gøre sætningen velformet. De siger intet om scenariets geometri eller nogen modtagertilstand.

seg-f5cd510aac0c = <c1/> efter epoken, UTC, skudsekunder er ikke modelleret.

seg-d2a2f655760d = <b>NMEA-højder er ellipsoidale.</b> Højden i <c1/> rummer den ellipsoidale højde, og geoideseparationen skrives som { "0.0" }. En simulator, der behandler højden som højde over middelhavsniveau, vil placere køretøjet forkert med den lokale geoideundulation.

seg-ee3a9a3ec84d = <b>Tolerancer for rundtur</b> (testet ved at læse hver fil tilbage): CSV-position { "0.1" } mm, breddegrad og længdegrad { "1e-9" } grad, hastighed { "0.1" } mm/s, vinkler { "1e-6" } grad; NMEA vandret position { "5" } mm, højde { "1" } mm, fart { "0.001" } knob, kurs { "0.001" } grad.

seg-a554992d2694 = Indlæsning af filerne i en simulator

seg-757382614413 = Laboratoriesimulatorer er forskellige, og dette repositorium gengiver ingen simulators manual. Kontrollér, hvilke af formaterne ovenfor din læser, og dens angivne krav:

seg-cc49ceccea20 = Mange bevægelsesimportører forventer en fast opdateringsrate, ofte { "10" } Hz. Scenariet <c1/> stepper med { "0.1" } s; for et stationært scenarie sættes <c2/> til den rate, din simulator ønsker.

seg-e98bf4bf6c6e = Nogle importører springer sampler over, der falder mellem hele sekunder, eller ignorerer tidskolonnen og bruger rækkefølgen. Start bevægelsen på et helt sekund, og hold gitteret regelmæssigt.

seg-3c470262eb15 = En CSV-importør, der lader dig knytte kolonner, kan læse <c1/> direkte: vælg de jordfaste eller geodætiske kolonner, og sæt deres enheder ud fra <c2/>. At afkorte decimalerne giver falsk acceleration, så behold den skrevne præcision.

seg-41a2bfe45b37 = Filen er kun bevægelse. Konfigurér konstellationen, interferensen og modtagerens front end i simulatoren, og tids dem efter hændelserne i <c1/>.

seg-024ab011a2e3 = Kshana skriver ingen leverandørspecifik scripting-grænseflade.

seg-6d67d4e2cdf0 = Kontrolleret med én open source-simulators læsere

seg-e4ce0597a644 = Bevægelsesindlæsningerne i gps-sdr-sim (MIT, commit 28ca29a6) fik eksporterne af otte medfølgende scenarier. Hver læser returnerede den eksporterede bane (<c1/>, præregistreret i <c2/>):

seg-3caed3fc2e47 = gps-sdr-sim-indstilling

seg-ad9e78555851 = Giv den

seg-4f9be75880d3 = Største forskel fra CSV'en

seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

seg-e03dd1d45ced = <c1/> som skrevet

seg-8d28fbcc4c4a = { "1.2" } mm

seg-fd39660fcb73 = <c1/> (tid, breddegrad, længdegrad, højde)

seg-c4e171cbf0de = { "0.15" } mm

seg-390b0c0fb695 = <c1/> (tid, x, y, z)

seg-ff26559a85e8 = nøjagtigt

seg-f4c13a327904 = Giv ikke <c1/> den fulde bevægelses-CSV. Dens læser rummer { "100" } tegn pr. linje, og en CSV-række er cirka { "160" } tegn, så hver række læses som to sampler. Overskriftslinjen læses som endnu en sample uden tal i.

seg-43cc6f9c50b2 = gps-sdr-sim rummer højst { "3000" } sampler, { "300" } s ved dens faste { "10" } Hz, og ignorerer tidskolonnen. Eksporterne for <c1/> stepper med præcis { "0.1" } s. Længere scenarier, såsom <c2/> på 20 minutter, læses kun til deres første { "300" } s.

seg-500243b6e402 = Dette kontrollerer, at filerne læses, som de er skrevet. Det kontrollerer ikke scenariets fysik eller noget, simulatoren sender.

seg-a4c4514276e9 = { "2" }. Angiv, hvad du vil score, før kørslen

seg-3a3e2be36c65 = Hændelsesfilen angiver de intervaller, scenariet definerer. Kopiér <c1/> ind i et <c2/>-scenarie, tilføj en eventuel forudsigelse, du vil have kontrolleret, og fastlæg monitorernes tærskler og tolerancer <b>før</b> modtageren kører. Justér dem ikke, efter du har set loggen; scenariet, tærsklerne og logens SHA-256 indgår alle i resultatets hash.

seg-d07b9ad8cfa9 = De eksporterede hændelser bærer scenariets egen type: et <c1/>-scenaries jammer er <c2/>; et udfald i navigationstilstanden er <c3/>, fordi scenariet angiver, at GNSS var utilgængeligt, ikke hvordan. Ret <c4/> til, så den svarer til det, du konfigurerer simulatoren til at gøre.

seg-faa87b3ba315 = { "3" }. Kør modtageren

seg-0a3b63cf5615 = Start modtageren og dens logger, start simulatorscenariet med bevægelsesfilen, og lad kørslen dække kalibreringsintervallet, hver hændelse og en margin efter den sidste. Behold modtagerens egen log (UBX, RINEX { "3" }-observationer, en Android-logger-CSV eller NMEA med sætninger om satellitstatus). En log uden signalstyrke for hver satellit kan stadig scores på modtagerens egen position, men monitorerne for bærebølge-til-støj har brug for den.

seg-fbbc12dfeb3f = { "4" }. Afstem urene

seg-5828311af3d4 = <c1/> tæller hændelsestider fra den første epoke i modtagerens log; bevægelsesfilen tæller fra sin første sample. Hvis loggen starter <c2/> sekunder før bevægelsens første sample, så læg <c3/> til hver <c4/> og <c5/>. Notér forskydningen og hvordan du målte den, og angiv den i scenariets <c6/> eller en kommentar, da en forkert forskydning flytter hver score. Hændelsestiderne alene kan ikke fortælle dig forskydningen; brug simulatorens markør for scenariets start eller modtagerens egne tidsstempler.

seg-22f7b68c445b = { "5" }. Score

seg-e024186a2874 = skriver <c1/>, <c2/> og <c3/>. For hver hændelse angiver resultatet falske alarmer før starten, den første alarm og dens monitorer, forsinkelsen og udfaldet (<c4/>, <c5/>, <c6/>, <c7/>), plus et forudsagt og et observeret fald i bærebølge-til-støj, hvor du har angivet en forudsigelse. En uenighed rapporteres, den tunes aldrig væk. Se <a1>RECEIVER-TRUST.md</a1>.

seg-5fa1e4890f91 = For at se, hvilke rækker i offentlige rammeværker sessionen leverer belæg for:

seg-abc6aaf44c95 = Se <a1>compliance/README.md</a1>. Den rapport beskriver evidensen i de kørsler, du giver den; den udtaler sig ikke om modtageren eller noget rammeværk.

seg-69fa39640c2d = { "6" }. Forbind hele kredsløbet i én signeret pakke

seg-f24e2dd64c47 = Efter scoringen binder <c1/> de fire optegnelser sammen: det scenarie, du eksporterede, laboratoriets <a1>testbetingelser</a1>, modtagerloggen og scoren. Udfyld <c2/> (logens sti og SHA-256, modtageren under test, hver hændelses type og angivne effekt), og derefter:

seg-78bed55de550 = <c1/> bærer en <c2/>-blok (<c3/>) med <c4/>, <c5/>, <c6/> og scoren (hændelser detekteret af evaluerbare, første alarm), dækket af manifestets hashes og signaturen. Kommandoen afviser en pakke, hvis betingelser og scoringshændelser er uenige, eller hvis angivne loghash ikke er logens. Som enhver bevispakke er den en teknisk optegnelse, ikke en juridisk vurdering.

seg-5fe6548911da = Gennemgået eksempel: gps-sdr-sim skriver en fil

seg-eeccc823e109 = Dette eksempel bruger kun open source-simulatoren gps-sdr-sim til at <b>skrive en basisbåndsfil</b> ud fra den eksporterede bevægelse. Kshana sender ikke, og intet på denne side automatiserer afspilning af den fil gennem en radio. Hvis dit laboratorium afspiller en sådan fil ind i en modtager, er det din operatørs ansvar, og det må kun ske, hvor det er tilladt (via kabel eller afskærmet, efter simulatorens og radioens egne sikkerhedsanvisninger), og Kshana hverken dokumenterer eller omslutter det.

seg-db81fdadfd19 = Hvad laboratoriet end derefter gør med <c1/>, sker uden for Kshana. Modtagerens egen log, uanset hvordan den er skaffet, er det, trin { "5" } scorer, og trin { "6" } forbinder. Filerne og de kontroller, Kshana foretager af sine egne eksporter, er kun testet på syntetiske data (<c2/>); der gøres ikke krav på nogen laboratoriekørsel her.

seg-dffcbdb8e6c3 = Hvad denne metode ikke gør

seg-d0b62c238953 = Den frembringer ikke et signal, og den siger ikke, hvilken interferens en simulator bør generere. Hændelserne siger hvornår, ikke hvad.

seg-3aa11bed60c8 = En enkelt session er et enkelt datapunkt. Resultatet beskriver den log under den konfiguration og siger intet om andre modtagere, firmware, antenner eller reel interferens.

seg-b156403456e4 = Højder, rater og tidsafstemning er operatørens at kontrollere mod simulatoren; eksporten angiver sine egne konventioner og tolerancer og ikke mere.

seg-337ff53bc890 = <s1>Forrige</s1>kshana-bench

seg-87be81f5e600 = <s1>Næste</s1>Compliance-kortlægning
