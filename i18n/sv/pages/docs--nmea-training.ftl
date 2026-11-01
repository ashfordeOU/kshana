# docs--nmea-training: translations (sv)

seg-2247a2344710 = Betydelse

seg-45425f378b61 = betydelse

seg-6940543aa3c0 = sträng

seg-f5e7215e6835 = objekt

seg-c5fb6b91dc68 = grader

seg-99427ab75a03 = fält

seg-bbcdd898d24d = heltal

seg-ba00d0453fbf = Källa: <c1/>

seg-738956d0a4b9 = NMEA-träningsströmmar: <c1/>

seg-3663955f80c7 = Sjöfartsakademier och simulatorcenter kan mata NMEA { "0183" } som genererats av Kshana in i en bryggsimulator eller en sjökortsplotter för att träna besättningar att känna igen GNSS-jamming och spoofing.

seg-4012bc6376aa = <b>Endast för träning och test.</b> De genererade strömmarna är syntetiska. De får aldrig matas in i ett fartygs levande navigationssystem. Kshana är rådgivande, inte typgodkänd navigationsutrustning. Varje ström börjar med, och upprepar var tionde sekund, en proprietär markörmening, <c1/>, som mottagare ignorerar; <c2/> tar bort den för en simulator som avvisar okända meningar. Det här skriver <b>endast NMEA-text</b>: det finns ingen RF-, IQ- eller vågformsutdata, och ingenting sänder annat än texten till den adress du anger.

seg-b66ff9ca2ff4 = Träningsström från scenariot coastal-drag-off (motor v{ $version }, frö { "22" }, { "25" } minuter med en positionsbestämning per { "10" } s av instruktörsloggen). En karta visar fartygets sanna spår och det spår som mottagaren rapporterar: de stämmer överens tills en skriptad positionsavdragning (drag-off) börjar vid { "421" } s, det rapporterade spåret vandrar sedan bort från det sanna medan mottagaren behåller en giltig positionsbestämning, och det hoppar tillbaka när händelsen slutar vid { "1140" } s. Bredvid visas avståndet mellan de två spåren över tid och den genomsnittliga bärvåg-till-brus-täthet som mottagaren rapporterar, som stiger till en enda förhöjd nivå så länge händelsen pågår. Syntetiska träningsdata genererade av Kshana. Endast för träning och test: mata aldrig den här strömmen till ett fartygs levande navigationssystem. Rådgivande, inte typgodkänd navigationsutrustning. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering. Positioner, datum och spår är påhittade.

seg-1f70c2c761ac = Figuren är ritad utifrån instruktörsloggen för <c1/>.

seg-32b620b3574e = Användning

seg-9cbd24964be4 = Alternativ

seg-aadcf289aed2 = skriv strömmen till en fil; utan nätverksutdata är standardvärdet <c1/>

seg-a3fc46437059 = skriv <c1/> och <c2/> (standard: bredvid filen)

seg-14dad363af8a = <c1/> eller <c2/>

seg-8e105cf0979b = TCP-server; körningen startar när en klient har anslutit (<c1/>). En enbart portangivelse lyssnar endast på <c2/>

seg-63ee193b90b4 = <c1/> eller <c2/>

seg-fc322c7ce2db = UDP, en mening per datagram; <c1/> tillåter en broadcast-adress. En enbart portangivelse skickar till <c2/>

seg-8ca50e2a4b8d = ta takten på strömmen; <c1/> är så fort som möjligt. Nätverksutdata går som standard i realtid, filer så fort som möjligt

seg-97b82dfe97a7 = ersätt scenariots frö

seg-86ac66fd2771 = utelämna markörmeningen

seg-f6cc05a6d39a = <b>Det finns ingen autentisering.</b> En TCP-server som får en icke-lokal adress serverar strömmen till vem som helst som kan nå den, och UDP skickar till vilken adress du än anger. En TCP-klient som inte tar emot sina data inom två sekunder kopplas bort, så en fastnad konsument kan inte hålla upp de andra.

seg-b4abb5a132ba = Samma frö ger samma byte på en plattform, och takten ändrar aldrig byten. Mellan plattformar är generatorns egen aritmetik bitidentisk (den använder det portabla matematiklagret), men satellitpositioner och blickvinklar kommer från motorfunktioner som anropar värdens matematikbibliotek, så i ett sällsynt gränsfall kan en avrundad elevation, azimut eller C/N0-siffra i GSV skilja sig mellan plattformar.

seg-97e31fc7f0d1 = Vad som skrivs

seg-632a4ca26567 = Varje epok ({ "1" }, { "2" }, { "5" } eller { "10" } per sekund) innehåller: <b>RMC, GGA, GNS</b> (positionsbestämning, position, tid), <b>GSA</b> (använda satelliter och DOP, en per konstellation), <b>GSV</b> (satelliter i sikte med elevation, azimut och SNR i dB-Hz, en uppsättning per konstellation, NMEA { "4.10" }-signal-ID), <b>VTG</b> (kurs och fart över grund), <b>ZDA</b> (tid och datum), <b>HDT</b> (gyrokurs) och <b>VBW</b> (fart genom vattnet och över grund från loggen). Talker är <c1/> med flera konstellationer, annars konstellationens egen. Rader slutar med CRLF och har giltiga kontrollsummor.

seg-942803ad8c49 = HDT och VBW fungerar som oberoende sensorer (en gyrokompass och en Doppler-logg). <b>Ingen händelse påverkar dem</b>, vilket är avsiktligt: skillnaden mellan vad GNSS rapporterar och vad gyrot och loggen säger är en ledtråd för genomgången.

seg-2d9a9ea38dde = När positionsbestämningen går förlorad är GGA-kvaliteten { "0" }, RMC-status <c1/>, positionsfälten är tomma och tidsfälten fortsätter (mottagarens klocka fortsätter gå), precis som verkliga mottagare gör.

seg-c1c51ff381e7 = Fartyget

seg-ada150c912eb = <c1/> och <c2/> anger en startposition, en fart och de punkter som ska styras genom. Fartyget styrs mot nästa waypoint under en <b>gräns för girhastighet</b> (<c3/>, standard { "30" }), en gräns för hur snabbt girhastigheten byggs upp (<c4/>) och en <b>gräns för fartändring</b> (<c5/>). Fartens värde för en sträcka är waypointens <c6/>. <c7/> lägger till en ström, så att farten över grund skiljer sig från farten genom vattnet och att kursen skiljer sig från kursen över grund, samt en magnetisk missvisning. <c8/> för fartyget till vila vid den sista waypointen.

seg-4fc2cb8a1388 = Satellitgeometri

seg-b97bd86ed3a4 = Satelliterna kommer från motorns egna nominella konstellationer (GPS slottabell, Galileo och BeiDou MEO Walker-mönster, GLONASS ICD), propagerade av <c1/> (tvåkroppsrörelse plus sekulär J2, jordrotation) och sedda från fartyget med motorns WGS-84-blickvinklar. Antalet synliga satelliter, elevationerna och azimuten i GSV är rimliga för platsen och tiden på dygnet. <b>Detta är en nominell himmel, inte en efemerid för strömmens datum</b>: PRN tilldelas i slottordning och varje konstellation behåller sin publicerade slottlayout, propagerad kontinuerligt från epoken för GPS slottabell (2016-12-31) under J2, så layouten är intakt men dess orientering är inte den verkliga himlens på strömmens datum. C/N0 följer elevationen (en nominell zenitnivå, satt i <c2/>), med en fast förskjutning per satellit, långsam fading och brus. En satellit under <c3/> har ett tomt SNR-fält; en under <c4/> spåras men används inte. Upp till <c5/> (standard { "12" }, taket för NMEA GGA) användbara satelliter används, valda för geometri (den högsta satelliten i varje azimutsektor på { "30" } grader först). Färre än fyra användbara satelliter ger förlorad positionsbestämning, och den återkommer efter <c6/> med användbar signal.

seg-f2be7442bdf2 = Händelser

seg-db86ed4b40a9 = Varje <c1/> har en <c2/>, en start <c3/>, en <c4/> (från start till början av avklingningen), en rampning vid start <c5/> och en rampning vid avklingning <c6/>. Styrkan stiger linjärt över <c7/>, hålls och faller sedan över <c8/>; <c9/> är ett steg. Alla effekter skalar med den styrkan. Parametrar som inte hör till slaget avvisas.

seg-3255e99c7265 = kind

seg-9285a9d699c0 = parametrar

seg-e83c9db4f9c7 = effekt

seg-e96ef358529d = <c1/>, <c2/> (standard { "6" })

seg-cd6030834371 = varje satellits C/N0 faller med upp till <c1/> (spridning per satellit), satelliter faller bort med den lägsta först, positionsbestämningen går förlorad när färre än fyra är användbara, och återhämtar sig efter avklingningen och <c2/>

seg-e5a66c9c3627 = <c1/>, en av <c2/> (sann) eller <c3/> (till kursen <b>vid start</b>, därefter hållen), valfritt <c4/>, <c5/>

seg-d7d967a60275 = mottagaren behåller en <b>giltig positionsbestämning</b> vars position vandrar bort från referensen; SOG och COG inkluderar avdragningen. Avdragningen följer smoothstep på rampningarna, så det falska spåret startar och stannar utan hastighetssteg; dess toppar är <c1/> m/s och <c2/> m/s i kvadrat för en rampning på <c3/> s över <c4/> m (båda loggade), och ett scenario som skulle överskrida <c5/> avvisas. Ett steg (<c6/>) flyttar positionen utan att röra hastigheten

seg-7da039c3262e = Tiden i RMC, GGA, GNS och ZDA förskjuts från sann UTC; positionen förblir sann

seg-ead3ce0162fb = <c1/>, <c2/> (standardvärde true), <c3/>

seg-a1bdb89334df = position, hastighet (och tid) är de som fartyget hade för <c1/> sedan, där fördröjningen följer smoothstep på sina ramper och den rapporterade farten skalas med <c2/> medan den ändras: en förenklad abstraktion i stil med meaconing, inte en utbredningsmodell

seg-6f435224f7fb = <c1/>: medan en drag-off, tidsspoofing eller replay-fördröjning är aktiv visar varje spårad satellit den enda förhöjda nivån, ett klassiskt tecken. Utelämna den för en subtil händelse där det genuina C/N0-mönstret behålls. Medan någon förfalskad händelse är aktiv följer mottagaren den förfalskade signalen, så jamming får den inte att tappa den; en positionsbestämning som förlorats på grund av tidigare jamming kommer tillbaka efter <c2/> på den förfalskade signalen (se <c3/>). En tidsändring som skulle få rapporterad tid att stanna eller gå baklänges (takt på { "1" } s per sekund eller mer) avvisas om den inte är ett steg (<c4/>).

seg-894aceb32c5c = Händelser kan överlappa; deras effekter adderas (förskjutningar, tidsändringar, fördröjningar) eller så gäller den starkaste (jamming). Tidslinjens <c1/> är den första epok då händelsen har effekt, en epok efter det skriptade <c2/> när händelsen trappas in.

seg-09e311ade9e6 = Instruktörsloggen

seg-80933b9bdf0d = Vid sidan av strömmen ger <c1/> och <c2/>:

seg-51930977a6fe = händelserna såsom de injicerats, i klartext med varje parameter, och deras UTC-start;

seg-4eab197c487b = en tidslinje: start, full effekt, återhämtning börjar, återhämtad, och mottagarens egna <c1/> och <c2/>;

seg-af2eb88f14d0 = det sanna spåret mot det rapporterade med <c1/> mellanrum: sann och rapporterad position, fart och kurs, positionsfel i meter, tidsavvikelse, använda och spårade satelliter, genomsnittligt C/N0 och vilka händelser som var aktiva;

seg-303f5fbe0351 = högsta fart och acceleration för det sanna och det rapporterade spåret;

seg-593a4a1ef296 = scenariots <c1/>.

seg-8c4aebcd0eff = Visa loggen först vid genomgången.

seg-dd1780910af7 = JSON-fält (schema <c1/>)

seg-60b5b11cdc0b = typ, enhet

seg-f4963d090155 = uttalandet som endast gäller utbildning

seg-7ad14e03d9e4 = från scenariot

seg-fac0fb50b31b = använt frö

seg-f05d18516bd8 = ISO { "8601" } UTC

seg-8752c09baa6a = körningens start

seg-f0d8bb5aafef = körningens längd

seg-0989e14f1e51 = knop

seg-b657b979a455 = högsta sanna och rapporterade fart över grund

seg-24e947df31ae = m/s i kvadrat

seg-a1ca3847c8d8 = största hastighetsändring per sekund, sann och mellan på varandra följande rapporterade positionsbestämningar

seg-e1daadeb7d48 = en per skriptad händelse

seg-3aaa0108ac1e = 1-baserad; används av <c1/> och <c2/>

seg-6bbb9db14f7b = beskrivning i klartext med parametrarna

seg-2f3eac27a997 = skriptad start

seg-4255c67f3db5 = händelsen exakt som den skrevs (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> och typens egna parametrar; frånvarande utelämnas)

seg-88db26711d77 = grader sann eller null

seg-2f30c3d8b17b = drag-off: den riktning som tillämpades (en relativ bäring löses vid starten)

seg-55d6dd667365 = m/s, m/s i kvadrat eller null

seg-021df000164f = drag-off: de toppar som släpet tillför det falska spåret

seg-d3a2c65ebcd4 = ögonblick för genomgången, i tidsordning

seg-b2b72301c1c9 = s från start, ISO { "8601" } UTC

seg-34e24e21ac7e = när (sann tid)

seg-cf29ba5ed968 = heltal eller null

seg-8dbc5e7239be = händelsens id; null för ändringar av mottagarens tillstånd

seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (händelser); <c5/>, <c6/> (mottagare)

seg-cd7c4057601b = förklaring

seg-90e65cbe1a59 = en rad per <c1/>

seg-a57e27a3c470 = s, ISO { "8601" } UTC

seg-24376fe24496 = sann position

seg-f23b251a0e33 = knop, grader sann

seg-242c1f2ccbd3 = sann fart och kurs över grund samt gyrokurs

seg-696dd61f8bbb = boolesk

seg-ea264ef0395c = mottagaren rapporterade en positionsbestämning

seg-b073b87a813e = grader, knop, grader sann eller null

seg-b56345697092 = vad mottagaren rapporterade; null medan positionsbestämningen är förlorad

seg-c4a33c03d9da = m eller null

seg-463f6fc42ae5 = horisontellt avstånd från sann till rapporterad position

seg-b68dfce8d81d = rapporterad UTC minus sann UTC

seg-ec28faa1efcc = heltal

seg-2bf397f77392 = satelliter som använts i positionsbestämningen, och spårade

seg-96b87348e90e = dB-Hz eller null

seg-40f30b4a88cf = genomsnittligt C/N0 för de spårade satelliterna

seg-3671c8aa3c1a = id för händelser med effekt i detta ögonblick

seg-8401fa92aae1 = Att lägga till ett fält ändrar inte schemataggen. Att byta namn på eller ta bort ett fält, eller ändra ett fälts betydelse eller enhet, höjer numret (<c1/>).

seg-656ee92a3130 = Scenariobiblioteket

seg-82a888587138 = <c1/>, vart och ett några minuters överfart med en instruktörsanteckning i sin TOML:

seg-665b9b46b49b = fil

seg-11ed1f85d4be = vad det visar

seg-50ffa85a1128 = C/N0 faller samtidigt, satelliter försvinner, positionsbestämningen förloras och kommer tillbaka

seg-10bc30b9c57b = en giltig positionsbestämning som ser frisk ut dras { "1.4" } km mot land; enhetligt förhöjt C/N0

seg-f141692988e4 = positionen är korrekt, UTC driver { "45" } s före under en långsam hamninfart

seg-ce06a5ebdd42 = jamming, sedan förfalskat övertagande med drag-off och tidsförskjutning, sedan en replay-fördröjning

seg-3fbcfd1dd26a = en blockerad himmel, inte störning: väggarna i en fjord (den REPRESENTATIVE förinställningen <c1/> för horisontprofil) döljer satelliterna i öster och väster, sedan öppnas rännan igen (händelse <c2/>, med en <c3/>-tabell)

seg-5462f6b21fae = Positioner, datum och spår är påhittade; biblioteket innehåller inga verkliga fartyg, operatörer eller inspelningar. Det gör inget uttalande om hur någon mottagare eller något system skulle klara sig mot störning.

seg-9831ab537b36 = Modelleringsval

seg-76a0e0eb57b3 = Generatorn är ett utbildningsverktyg utan oberoende referens, och dess siffror är modelleringsval, inte mätningar av någon mottagare. De är valda för att likna en vanlig mottagarlogg: C/N0-lutningen på { "14" } dB från zenit till horisont under zenitnivån (standard { "47" } dB-Hz) och förskjutningen per satellit på +/-1.5 dB, långsam fädning på { "0.8" } dB över { "97" } s och { "0.5" } dB över { "31" } s, { "0.3" } dB jitter; trösklarna för spårning ({ "20" } dB-Hz) och användning ({ "28" } dB-Hz); positionsbruset ({ "1.5" } m vid HDOP { "1" }, korrelerat över { "30" } s, vertikalt dubbelt så stort); { "0.05" } graders gyrobrus och { "0.03" } kn avdriftsbrus; styrtidskonstanten på { "20" } s och ankomstradierna för waypoints i fartygsmodellen; samt valet av satelliter efter azimutsektor. Standardvärdena finns i <c1/> och <c2/> och kan alla ändras i scenariot.

seg-84913be532a0 = Att läsa in dem igen

seg-fbf4002d25cd = <c1/> kan läsa in de här filerna (<c2/>). Testerna kontrollerar varje mening i varje bibliotekscenario mot dess egna regler för fältantal och kontrollsumma, och kör filerna genom den läsaren, som tolkar GGA, RMC och GSV och låter de övriga typerna passera utan att hoppa över någon. Testerna fäster ett golden-utdrag per scenario (<c3/>); generera om med <c4/> efter en avsiktlig ändring.

seg-b94fbc3b1dd3 = <s1>Föregående</s1>Maritimt förtroende

seg-ecdf748cb63d = <s1>Nästa</s1>Störningskarta och ruttexponering

seg-24ad8471ff2a = JSON-fält (schema kshana-nmea-training/1)
