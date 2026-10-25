# docs--test-bench: translations (sv)

seg-245fe1f87b08 = Fil

seg-e305279d5b11 = Innehåll

seg-292871e5747d = Källa: <c1/>

seg-d18a29239225 = Att köra en mottagare mot ett exporterat scenario

seg-aa3498c7cb16 = En mottagartillverkare som äger en GNSS-simulator för laboratoriebruk kan spela upp ett Kshana-scenarios fordonsrörelse genom den, registrera vad mottagaren under test gör och poängsätta den loggen med <c1/> mot händelser som angetts före körningen. Kshana tillhandahåller rörelsen, händelsetiderna och poängsättningen. Den skriver <b>ingen signal</b>: inget som exporteras här syntetiserar, modellerar eller sänder en radiofrekvens- eller basbandsvågform, och en exporterad händelse är ett märkt tidsintervall, inte ett recept för att framställa störning. Simulatorn och dess operatör tillhandahåller signalerna, och operatören ansvarar för att köra dem endast där det är tillåtet (ledningsbundet eller skärmat, enligt simulatorns egna säkerhetsanvisningar).

seg-414c7774d133 = Den här sidan är en metod. Den publicerar inga resultat.

seg-a0ad7b35922f = { "1" }. Export

seg-798d75d3b65c = Gäller för typen <c1/> (en körprofil med attityd; avbrotten i navigeringstillståndet är händelserna), och för <c2/> och <c3/> (en stillastående mottagare under scenariots varaktighet; ett <c4/>-scenarios störsändare är en enda händelse under körningen). Andra typer anger varför de saknar fordonsbana. <c5/> är UTC-ögonblicket för rörelsens tid noll (standard 2024-01-01T00:{ "00" }:00Z); scenarierna har inget eget kalenderdatum för fordonsrörelse. Det måste vara ett verkligt UTC-ögonblick, <c6/> (ett avslutande <c7/> accepteras) med året i intervallet { "2000" } till { "2099" } och varje fält inom sitt intervall; allt annat avvisas. Utdata är byte-identiskt för samma scenario och epok.

seg-c153d8ef8735 = en rad per sampel: <c1/>, jordfast <c2/>, <c3/>, geodetisk <c4/>, <c5/>, <c6/>, <c7/>

seg-fa4c8c0d2b72 = epoken, systemen, enheterna, kolumnerna och tur-och-retur-toleranserna för den CSV-filen

seg-8c74ca211e3a = NMEA { "0183" }-meningarna <c1/> och <c2/> per sampel, med kontrollsummor

seg-2b0fd541f1dc = en <c1/>-rad följd av <c2/>-rader (skrivs bara när varje samplingsintervall är samma hela antal millisekunder; när den utelämnas anger kommandot varför på standardfelutdata)

seg-d09d2dab9a17 = samma händelser som <c1/>-block för ett <c2/>-scenario

seg-866a3c4870af = körningen som ett <a1><c1/></a1>-dokument för en <c2/>-inspelning: händelserna som angiven referens, med <c3/>, <c4/>, <c5/>, varje händelses <c6/> och effekt lämnade för laboratoriet att fylla i

seg-9ea6a94d4586 = System och konventioner

seg-8d3b7d2ef815 = <b>Position:</b> WGS { "84" }, jordfast (ECEF: <c1/> genom ekvatorn vid nollmeridianen, <c2/> genom polen); <c3/>, <c4/>, <c5/> ger samma position geodetiskt, <c6/> över ellipsoiden.

seg-93a2975d2a19 = <b>Hastighet:</b> jordfasta axlar, relativt jorden.

seg-be05c2278e98 = <c1/> medurs från sann nord i [{ "0" }, { "360" }), <c2/> nosen uppåt positivt, <c3/> höger vinge nedåt positivt; girning-stigning-rullning (3-2-1) från det lokala nord-öst-ned-systemet till kroppsaxlarna x framåt, y höger, z nedåt. En stillastående källa skriver nollor. NMEA och waypointtexten har ingen attityd.

seg-3c3ad1295628 = <b>Kursen är kroppens girning, inte färdriktningen.</b> I körprofilen <c1/> girar kroppen i fyrkantsvågor medan hastigheten följer efter, så heading och kursen över grund kan skilja sig med tiotals grader (upp till cirka { "77" } grader i det medföljande scenariot <c2/>). NMEA-kursen <c3/> är kursen över grund, hastighetsvektorns riktning, så en simulator som läser heading från rörelsefilen och en som läser kurs från NMEA-filen ser olika vinklar. Kursen över grund från CSV-filen är <c4/> av dess hastighet roterad till nord-öst-ned.

seg-224b53995157 = <b>Höjden följer scenariot.</b> För <c1/> är <c2/> typens egen tangentplanssteppning av sin referens och hålls inte konstant (cirka { "7" } m under { "180" } s av <c3/>); det är scenariots rörelse, skriven som den är.

seg-f78a354f96ee = <b>Platshållare i NMEA <c1/>.</b> Positionsbestämningens kvalitet ({ "1" }), använda satelliter ({ "12" }) och HDOP ({ "1.0" }) skrivs bara för att göra meningen välformad. De säger ingenting om scenariots geometri eller något mottagartillstånd.

seg-f5cd510aac0c = <c1/> efter epoken, UTC, skottsekunder är inte modellerade.

seg-d2a2f655760d = <b>NMEA-höjder är ellipsoidala.</b> Höjden i <c1/> innehåller den ellipsoidala höjden och geoidseparationen skrivs som { "0.0" }. En simulator som behandlar höjden som höjd över medelhavsytan placerar fordonet fel med den lokala geoidundulationen.

seg-ee3a9a3ec84d = <b>Tur-och-retur-toleranser</b> (testade genom att läsa tillbaka varje fil): CSV-position { "0.1" } mm, latitud och longitud { "1e-9" } grad, hastighet { "0.1" } mm/s, vinklar { "1e-6" } grad; NMEA horisontell position { "5" } mm, höjd { "1" } mm, fart { "0.001" } knop, kurs { "0.001" } grad.

seg-a554992d2694 = Att läsa in filerna i en simulator

seg-757382614413 = Laboratoriesimulatorer skiljer sig åt, och det här förrådet återger ingen simulators handbok. Kontrollera vilka av formaten ovan din läser och dess angivna krav:

seg-cc49ceccea20 = Många rörelseimportörer förväntar sig en fast uppdateringstakt, vanligen { "10" } Hz. Scenariot <c1/> stegar med { "0.1" } s; för ett stillastående scenario, sätt <c2/> till den takt din simulator vill ha.

seg-e98bf4bf6c6e = Vissa importörer hoppar över sampel som faller mellan hela sekunder, eller ignorerar tidskolumnen och använder radordningen. Starta rörelsen på en hel sekund och håll rutnätet regelbundet.

seg-3c470262eb15 = En CSV-importör som låter dig mappa kolumner kan läsa <c1/> direkt: välj de jordfasta eller geodetiska kolumnerna och ange deras enheter utifrån <c2/>. Att kapa decimalerna ger falsk acceleration, så behåll den skrivna precisionen.

seg-41a2bfe45b37 = Filen innehåller endast rörelse. Konfigurera konstellationen, störningen och mottagarens frontände i simulatorn, och tidsätt dem efter händelserna i <c1/>.

seg-024ab011a2e3 = Kshana skriver inget skriptgränssnitt för någon tillverkare.

seg-6d67d4e2cdf0 = Kontrollerat med en öppen källkod-simulators läsare

seg-e4ce0597a644 = Rörelseläsarna i gps-sdr-sim (MIT, commit 28ca29a6) fick exporterna från åtta medföljande scenarier. Varje läsare returnerade den exporterade banan (<c1/>, förhandsregistrerad i <c2/>):

seg-3caed3fc2e47 = alternativ i gps-sdr-sim

seg-ad9e78555851 = Ge den

seg-4f9be75880d3 = Största skillnad mot CSV-filen

seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

seg-e03dd1d45ced = <c1/> som skriven

seg-8d28fbcc4c4a = { "1.2" } mm

seg-fd39660fcb73 = <c1/> (tid, latitud, longitud, höjd)

seg-c4e171cbf0de = { "0.15" } mm

seg-390b0c0fb695 = <c1/> (tid, x, y, z)

seg-ff26559a85e8 = exakt

seg-f4c13a327904 = Ge inte <c1/> hela rörelse-CSV-filen. Dess läsare rymmer { "100" } tecken per rad, och en CSV-rad är cirka { "160" } tecken, så varje rad läses som två sampel. Rubrikraden läses som ytterligare ett sampel utan några tal i sig.

seg-43cc6f9c50b2 = gps-sdr-sim rymmer högst { "3000" } sampel, { "300" } s vid sin fasta takt på { "10" } Hz, och ignorerar tidskolumnen. Exporterna från <c1/> stegar med exakt { "0.1" } s. Längre scenarier, till exempel det 20 minuter långa <c2/>, läses bara till sina första { "300" } s.

seg-500243b6e402 = Det här kontrollerar att filerna läses som de är skrivna. Det kontrollerar inte scenariots fysik eller något som simulatorn sänder.

seg-a4c4514276e9 = { "2" }. Ange vad du ska poängsätta före körningen

seg-3a3e2be36c65 = Händelsefilen anger de intervall som scenariot definierar. Kopiera <c1/> till ett <c2/>-scenario, lägg till de prediktioner du vill få kontrollerade och fastställ monitorernas trösklar och toleranser <b>innan</b> mottagaren körs. Justera dem inte efter att ha sett loggen; scenariot, trösklarna och loggens SHA-256 ingår alla i resultatets hash.

seg-d07b9ad8cfa9 = De exporterade händelserna bär scenariots egen typ: ett <c1/>-scenarios störsändare är <c2/>; ett avbrott i navigeringstillståndet är <c3/>, eftersom scenariot anger att GNSS inte var tillgängligt, inte hur. Ändra <c4/> så att den stämmer med vad du konfigurerar simulatorn att göra.

seg-faa87b3ba315 = { "3" }. Kör mottagaren

seg-0a3b63cf5615 = Starta mottagaren och dess loggare, starta simulatorscenariot med rörelsefilen och låt körningen täcka kalibreringsintervallet, varje händelse och en marginal efter den sista. Behåll mottagarens egen logg (UBX, RINEX { "3" }-observationer, en CSV från Android-loggare, eller NMEA med satellitstatusmeningar). En logg utan signalstyrka per satellit kan fortfarande poängsättas utifrån mottagarens egen position, men monitorerna för bärvåg-till-brus behöver den.

seg-fbbc12dfeb3f = { "4" }. Justera klockorna

seg-5828311af3d4 = <c1/> räknar händelsetider från första epoken i mottagarens logg; rörelsefilen räknar från sitt första sampel. Om loggen startar <c2/> sekunder före rörelsens första sampel, lägg till <c3/> på varje <c4/> och <c5/>. Anteckna offseten och hur du mätte den, och ange den i scenariots <c6/> eller i en kommentar, eftersom en felaktig offset förskjuter varje poäng. Enbart händelsetiderna kan inte berätta offseten; använd simulatorns markör för scenariostart eller mottagarens egna tidsstämplar.

seg-22f7b68c445b = { "5" }. Poängsätt

seg-e024186a2874 = skriver <c1/>, <c2/> och <c3/>. För varje händelse anger resultatet falsklarm före starten, det första larmet och dess monitorer, fördröjningen och utfallet (<c4/>, <c5/>, <c6/>, <c7/>), samt ett predikterat och observerat fall i bärvåg-till-brus där du angav en prediktion. En avvikelse rapporteras, aldrig bortjusterad. Se <a1>RECEIVER-TRUST.md</a1>.

seg-5fa1e4890f91 = För att se vilka rader i offentliga ramverk som sessionen ger belägg för:

seg-abc6aaf44c95 = Se <a1>compliance/README.md</a1>. Den rapporten beskriver beläggen i de körningar du ger den; den gör inget fastställande om mottagaren eller något ramverk.

seg-69fa39640c2d = { "6" }. Länka tur-och-retur-körningen i ett signerat paket

seg-f24e2dd64c47 = Efter poängsättningen knyter <c1/> ihop de fyra registreringarna: scenariot du exporterade, laboratoriets <a1>testvillkor</a1>, mottagarloggen och poängen. Fyll i <c2/> (loggens sökväg och SHA-256, mottagaren under test, varje händelses typ och angivna effekt), och sedan:

seg-78bed55de550 = <c1/> innehåller ett <c2/>-block (<c3/>) med <c4/>, <c5/>, <c6/> och poängen (detekterade händelser av utvärderingsbara, första larmet), täckt av manifestets hashar och signaturen. Kommandot avvisar ett paket vars villkor och poängsatta händelser inte stämmer överens, eller vars angivna loggash inte är loggens. Som varje bevispaket är det en teknisk registrering, inte ett juridiskt utlåtande.

seg-5fe6548911da = Genomgånget exempel: gps-sdr-sim skriver en fil

seg-eeccc823e109 = Det här exemplet använder den öppna simulatorn gps-sdr-sim bara för att <b>skriva en basbandsfil</b> utifrån den exporterade rörelsen. Kshana sänder inte, och inget på den här sidan automatiserar uppspelning av filen genom en radio. Om ditt laboratorium spelar upp en sådan fil in i en mottagare är det din operatörs ansvar, och sker bara där det är tillåtet (ledningsbundet eller skärmat, enligt simulatorns och radions egna säkerhetsanvisningar), och Kshana varken dokumenterar eller omsluter det.

seg-db81fdadfd19 = Vad laboratoriet än gör med <c1/> sker utanför Kshana. Mottagarens egen logg, hur den än har erhållits, är vad steg { "5" } poängsätter och steg { "6" } länkar. Filerna och de kontroller som Kshana gör av sina egna exporter är endast testade på syntetiska data (<c2/>); ingen laboratoriekörning görs gällande här.

seg-dffcbdb8e6c3 = Vad den här metoden inte gör

seg-d0b62c238953 = Den framställer ingen signal, och den säger inte vilken störning en simulator bör generera. Händelserna anger när, inte vad.

seg-3aa11bed60c8 = En enskild session är en enda datapunkt. Resultatet beskriver den loggen under den konfigurationen och säger ingenting om andra mottagare, firmware, antenner eller verklig störning.

seg-b156403456e4 = Höjder, takter och tidsjustering är operatörens att kontrollera mot simulatorn; exporten anger sina egna konventioner och toleranser och inget mer.

seg-337ff53bc890 = <s1>Föregående</s1>kshana-bench

seg-87be81f5e600 = <s1>Nästa</s1>Compliance-mappning
