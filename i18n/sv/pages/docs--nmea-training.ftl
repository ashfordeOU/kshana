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
