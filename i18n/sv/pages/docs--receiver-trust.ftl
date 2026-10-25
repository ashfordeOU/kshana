# docs--receiver-trust: translations (sv)

seg-adc34608c46b = Klass

seg-2247a2344710 = Betydelse

seg-fdbb9db68f1d = ingen

seg-f63dd3d7aad4 = Källa

seg-98151954f217 = false

seg-c353e7bec219 = Nyckel

seg-cc38b40eb7a5 = Monitor

seg-7670cf4ceda3 = Standardvärde

seg-a0cc45088f5f = GSV

seg-26ab8544afba = Förtroendepoäng över en syntetisk överfart, från en verklig körning av motor v{ $version } på examples/maritime-trust (en påhittad NMEA-logg för en färja på rutten Tallinn till Helsingfors, { "3001" } epoker vid { "1" } Hz). Tre fält delar en tidsaxel. Överst: avståndet mellan den position mottagaren rapporterar och fartygets verkliga position, som håller sig inom några meter till ungefär { "1576" } s, då loggens skriptade bortdragning av positionen drar den bort, medan mottagaren fortsätter att rapportera en giltig positionsbestämning. I mitten: förtroendepoängen från { "0" } till { "100" }, inte beräknad under de första { "300" } s av kalibreringen, i det nominella bandet (minst { "90" }) fram till bortdragningen, och sedan fallande genom det degraderade bandet (minst { "55" }) ner i det opålitliga bandet. Längst ned: varje epoks band som ett färgat band med sitt namn. Poängen är rådgivande. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering. Loggen är påhittad för att visa formatet och övervakarna; den är ingen mätning och säger ingenting om hur någon mottagare skulle prestera.

seg-7000c522cc93 = Mottagarens egen spoofingflagga mot Kshanas larm, från en verklig körning av motor v{ $version } på en påhittad UBX-logg ({ "200" } epoker vid { "1" } Hz). C/N0 faller { "20" } dB vid { "80" } till { "90" } s och { "120" } till { "130" } s; mottagaren flaggar { "120" } till { "130" } s och { "160" } till { "165" } s. Av { "140" } epoker som jämfördes efter kalibrering flaggade båda i { "11" }, bara mottagaren i { "6" }, bara Kshana i { "11" } och ingen av dem i { "112" }. Ingen av sidorna är referens och samstämmighet är inte validering. Rådgivande: analysutdata från ett forsknings- och teknikverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst.

seg-caadaad98cf6 = Källa: <c1/>

seg-4f10c2397fcc = Mottagarförtroende: bedöma en verklig logg från en GNSS-mottagare

seg-2596bdcdaf8e = <c1/> läser en logg från en verklig mottagare för globala satellitnavigeringssystem (GNSS), kör förtroendeövervakare över den epok för epok och säger när och varför mottagarens positionsbestämning slutade vara tillförlitlig. Den kan också poängsätta loggen mot händelser och prediktioner som du anger <b>före</b> körningen: om varje händelse upptäcktes i tid och om ett modellerat fall i bärvåg-till-brusdensitet (C/N0) stämmer överens med det som mottagaren mätte.

seg-63f24d5f2d5e = Observationerna är mottagarens egna; övervakarna och deras trösklar är motorns och dina. Varje resultat bär den etiketten, loggens SHA-256 och varje tröskel som det kördes med, så en körning kan upprepas och granskas.

seg-6f5014b93fbc = För ett fartyg under gång, med en levande poäng och en valfri grind framför ett sjökortssystem, se <a1><c1/></a1>.

seg-82cdabb6086f = Detta skriver <c1/>, <c2/> (en rad per epok) och <c3/> (medel-C/N0 över tid med förtroendetillståndet under) bredvid scenariot och skriver ut en utlåtanderad. Exempelloggen är syntetisk, gjord för att visa formatet; peka <c4/> på din egen mottagares logg.

seg-ec2be1ea73f5 = Figuren ovan är fartygsdemon i <a1><c1/></a1>: en påhittad logg, en rådgivande poäng.

seg-0f24c5cf4b9b = Samma scenario kan köras från Python (<c1/>), från WebAssembly-paketet (<c2/>, med loggen inbäddad) och från verktyget <c3/> i Model Context Protocol-servern (MCP).

seg-1f3cc12b6230 = Loggar den läser

seg-23fd4a5bf5dd = Vad som läses

seg-2e1a655cf846 = u-blox binär

seg-cb31da7b7d88 = NAV-SAT C/N0, elevation och azimut per satellit, NAV-PVT position, MON-RF automatisk förstärkningsreglering (AGC) och jamming-indikatorn <c1/>, NAV-TIMEGPS vecka samt mottagarens egna flaggor: NAV-STATUS <c2/> och SEC-SIG (<c3/>, se <a1>RECEIVER-PROTOCOLS.md</a1>)

seg-cec582f4afa5 = RINEX { "3" }-observationsfil

seg-57708a636148 = <c1/>-koder (C/N0) per satellit och signal; med en sänd navigeringsfil (<c2/>) pseudoavstånden för motorns egen positionsbestämning

seg-176c2493782e = CSV från Android GnssLogger

seg-d69b9dd6ebad = <c1/>-rader: C/N0 och <c2/> per satellit; <c3/>-rader: position

seg-d390120374a9 = NMEA { "0183" }-text

seg-9eb885aa79af = GSV signal-brusförhållande per satellit (dB-Hz, med eller utan signal-ID { "4.10" }) och dess elevation och azimut, GSA geometrisk försämring av precisionen och använda satelliter, GGA och RMC tid och position

seg-7864926ce37e = Septentrio binär ({ "0.38" }, endast läsning)

seg-44675c4bdf40 = PVTGeodetic position, MeasEpoch C/N0 per satellit och signal, RFStatus antal band; se <a1>RECEIVER-PROTOCOLS.md</a1>

seg-a5367d75c5ee = Lösningsfil från RTKLIB (<c1/>)

seg-37d28ca5ed00 = tid, position (latitud/longitud eller ECEF, omräknad) och använda satelliter per epok; filer med grader-minuter-sekunder avvisas med ett meddelande

seg-5e10ecb93f96 = NovAtel OEM7 ASCII- eller binärloggar

seg-a630fbcf7425 = <c1/> position (bara beräknad lösning), <c2/> C/No per satellit och signal; <c3/>-flaggor för jammer blir epokens <c4/> (jamming-tillstånd { "2" } när mottagaren flaggar en jammer, { "1" } när den inte gör det; det finns ingen flagga för spoofing i RXSTATUS), ställd mot Kshanas larm genom jämförelsen <c5/>

seg-d4735b581cbf = Strömmarna GNSS-SDR Monitor och PVT-monitor som JSON-rader

seg-053235d67fb3 = C/N0 per kanal, positionsbestämning, använda satelliter, HDOP, azimut och elevation; skapad av <c1/>

seg-2e9033aa4e9d = Detaljer, källor och begränsningar för dessa tre: <a1><c1/></a1>.

seg-8987b2c46eb0 = Varje epok som läsarna producerar bär också <c1/>, <c2/> byteförskjutningar i indata: det minsta sammanhängande intervall som rymmer de poster som bidrog till den, så att exakt den råa delen kan hashas för ett händelsefönster. NMEA: varje rad som läses medan epoken är aktuell (en övermängd där en orelaterad rad ligger mellan dess meningar). UBX: epokens ramar. RINEX { "3" }: epokposterna från varje <c3/>-rad till nästa. Android: epokens <c4/>-rader (en <c5/>-rad bara för en epok utan <c6/>-rader). Saknas för en levande ström och överallt där det inte är väldefinierat (RINEX { "2" }).

seg-cea9532b57a2 = Filen läggs in med <c1/> (löses mot scenariots egen mapp), eller inbäddad som <c2/> eller <c3/> (de enda valen i en webbläsare).

seg-3bc4f9c91950 = En IMU-logg som en andra sensor

seg-49b10ad5928e = <c1/> lägger till en tröghetslogg på samma klocka:

seg-9e0560b09f5a = Girhastigheten integreras från <c1/> och fyller i kursen överallt där mottagarloggen saknar kurs, så övervakaren <c2/> (som kräver <c3/> på plattformen) jämför gyrokursen med kurs över grund. Ett gyro driver: kursen är bara så bra som integreringsfönstret och <c4/> avgör vad som räknas som avvikelse. Layouten för <c5/> beskrivs i <c6/>. IMU-bytes ingår i scenariots hash och i ett bevispakets scenariohash. Inbäddat (<c7/>/<c8/>) fungerar på varje yta; en <c9/> avvisas där filer inte läses.

seg-fd3e6ef1cd93 = Plattform: stillastående eller fartyg

seg-b67c0d57dc1d = Övervakarna ovan förutsätter en fast antenn. Ett scenario anger plattformen före körningen i en <c1/>-tabell på högsta nivån; utan en är plattformen <c2/> och ingenting ändras.

seg-3d6bc18bd83e = Varför det värdet

seg-32f339f63acf = Över marschfarten för handelsfartyg och de flesta passagerarfartyg, så att ett verkligt fartyg aldrig når den; långt under den hastighet som en positionsavdragning innebär. Ett långsammare fartyg bör ange en lägre gräns: ju lägre gräns, desto tidigare fångas en avdragning.

seg-9506e8601857 = Ett stort fartyg ändrar hastighet med långt under { "0.1" } m/s²; ett litet snabbt fartyg når ett par tiondelar vid en kraftig gasändring.

seg-b0b6baaee456 = Ett stort fartyg svänger med långt under { "1" } deg/s och ett litet fartyg i en kraftig sväng med några.

seg-53d0fffb3c09 = En egenskap hos installationen; en gissning vore en dold tröskel.

seg-ac48403443f9 = Anges <c1/> och saknas i loggen är det ett fel, så en saknad sensor kan inte passera som en ren kontroll.

seg-8266739dc26b = Fartygsnycklarna avvisas under <c1/>. För ett fartyg körs inte övervakaren <c2/>, eftersom den mäter avstånd från kalibreringsmedelvärdet, vilket blir fel på en antenn i rörelse; resultatets <c3/> registrerar plattformen och gränserna som användes.

seg-7551792a0cb4 = De syntetiska NMEA-strömmarna från <a1><c1/></a1>, gjorda för besättningsträning, accepteras av NMEA-läsaren och kan köras genom den här typen som vilken NMEA-logg som helst.

seg-18d7538bc56d = Övervakare

seg-e5c1cb89f0b3 = Varje övervakare behöver sina data; en övervakare vars data inte finns i loggen körs inte och förtecknas inte i <c1/>. De första <c2/> sekunderna (standard { "60" }) sätter baslinjen och larmar aldrig.

seg-3be9ee05f087 = Larmar när

seg-98ead58c671d = Behöver

seg-f6e6df453260 = medel-C/N0 över satelliterna som är gemensamma med baslinjen sjunker med <c1/> eller mer (standard { "6" } dB)

seg-d9bf6efc6835 = följda satelliter ligger <c1/> eller fler under medianen för baslinjen (standard { "4" })

seg-60c7a99f9819 = AGC-värdet avviker från sin baslinje med mer än <c1/> standardavvikelser (standard { "5" })

seg-7c1c65e64418 = UBX MON-RF eller Android <c1/>

seg-a5a5252417cb = u-blox <c1/> överstiger <c2/> (standard { "80" } av { "255" })

seg-8bca191bf4c4 = UBX MON-RF

seg-0ac4898d81cf = mottagarens egen positionsbestämning ligger mer än <c1/> från sitt kalibreringsmedelvärde (standard { "50" } m)

seg-6a3fec1214b9 = en rapporterad position

seg-4c05faf783eb = paritets-RAIM (autonom integritetsövervakning i mottagaren) på motorns egen enpunktspositionsbestämning förkastar mätmängden

seg-037ab193613c = RINEX-logg med <c1/>

seg-8890a4ebf231 = motorns enpunktspositionsbestämning misslyckas med fem eller fler satelliter

seg-0a5a708ac75b = mottagarens klocka avviker från sin predikterade linje med mer än den minsta detekterbara förskjutningen för dess kalibreringsbrus

seg-31b64b635261 = Kalibrerad profil (måste väljas).

seg-a73f2c2dfc9a = <c1/> ersätter de tre störningströsklarna med värden som kalibrerats på den offentliga datamängden JammerTest { "2024" } (en u-blox ZED-F9P per scenario; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. Kalibreringen förhandsregistrerades (<c5/>) och profilen är MODELLED, anpassad på en offentlig kampanj: dess tröskel <c6/> <b>missade</b> den förhandsregistrerade tröskeln för falsklarm i den undanhållna datamängden ({ "0.0231" } mot { "0.02" }); trösklarna för AGC och jamming-indikator samt unionströskeln (falsklarm { "0.033" }, detektion { "0.81" }) nåddes (<c7/>). Den gäller för den mottagartypen vid den händelsen, mot schemalagda attacktidsluckor, och kalibrerades på datamängdens CSV-loggar (dess UBX-loggar ger fler falsklarm i två mappar). Ett resultat som körts med profilen upprepar trösklarna som tillämpades och bär en <c8/> som säger allt detta. Utan profilen gäller standardvärdena ovan och alla utdata är oförändrade.

seg-1fa8c4bd1a18 = För en <c1/>-plattform körs även övervakarna för plattformar i rörelse (trösklar i en <c2/>-tabell på högsta nivån, varje standardvärde dokumenterat i <c3/>); var och en behöver sina data och förtecknas i <c4/> bara när den har fattat ett beslut:

seg-4b2840d9d0af = positionsändringen stämmer inte med rapporterad fart och kurs, eller innebär en fart, acceleration eller svängtakt över fartygets gränser

seg-656c19cb5b52 = positionsbestämningar; fart och kurs (RMC eller VTG) för dödräkningsdelen

seg-cedefd52998d = gyrokursen och kursen över grund skiljer sig med mer än <c1/> (fart över <c2/>)

seg-c66704cbdd02 = HDT-, THS- eller VHW-kurs, <c1/>

seg-1bbbf0033234 = farten genom vattnet och farten över grund skiljer sig med mer än <c1/>

seg-c9101740b235 = VHW eller VBW, och fart över grund

seg-42ac59072099 = GGA-höjden skiljer sig från <c1/> med mer än <c2/>

seg-811ec460249c = GGA-höjd, <c1/>

seg-854ea9c26df4 = spridningen av C/N0 över satelliterna sjunker till <c1/> av sin kalibreringsmedian

seg-837fc4cb832c = C/N0 för de gemensamma satelliterna steg med <c1/> i genomsnitt och <c2/> av dem steg

seg-faae07674361 = på varandra följande epoktider hoppar oregelbundet, går bakåt eller lämnar värdens klocka

seg-f799a53897ed = NMEA-tid; värdens klocka för den sista delen

seg-ee4913c9f2ed = mottagaren rapporterar ett autentiseringsfel för OSNMA (en rapporterad status läses; ingenting verifieras; för att verifiera OSNMA ur själva I/NAV-sidorna se <a1>docs/OSNMA.md</a1>)

seg-3fad5fcde4dc = <c1/>-statusmening

seg-ce072f2ebb6c = En epok är <b>ej betrodd</b> när RAIM, klockövervakaren, ett lösningsfel eller ett positionshopp larmar, eller när fallet i C/N0 når två gånger sin tröskel; <b>försämrad</b> vid varje annat larm; och <b>nominell</b> i övrigt.

seg-4124ff6013a0 = Motorvägen (<c1/>, <c2/>, <c3/>) är samma beräkning som spoofing-orakel för JammerTest { "2024" } i <c4/>: <c5/> kontrollerar att det första larmet, för alla åtta publicerade starter, infaller på samma epok och är av samma slag.

seg-83be3c22a577 = Förtroendepoäng (fartygsplattform)

seg-812991f245cd = För ett fartyg får varje epok efter kalibreringen också en poäng från { "0" } till { "100" } och skälen till att den inte är { "100" }. Avbildningen är deterministisk och fastställd innan någon logg poängsätts: ingen inlärning, ingenting anpassat till händelser. Varje övervakare reducerar sitt underlag till ett kvot <c1/> (ett larm vid { "1" } eller mer); en kvot kostar poängen

seg-ada5a0a52315 = så en övervakare kostar ingenting så länge den ligger under <c1/> av sin tröskel (standard { "0.5" }), hälften av sin vikt vid sin tröskel och hela vikten vid <c2/> gånger tröskeln (standard { "1.5" }); poängen är icke-växande i varje statistik. En källa som inte rapporterar vid en epok behåller sin senaste statistik under <c3/> (standard { "10" } s: två cykler av en C/N0-mening som skickas var { "5" }:e s), både som larm och som avdrag.

seg-6c06de24ebfe = Avrundningen är uppåt vid hälften (<c1/>), bandet är det för den avrundade poängen, och begränsningen kommer före avrundningen. Bara övervakare vars poäng ligger över noll förtecknas bland avdragen, med sin kvot och sina oavrundade poäng, störst poäng först; avdrag med lika poäng förtecknas i ordningen för övervakarnas namn <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. En övervakare vars test bara har utfallen lyckat eller misslyckat (en misslyckad lösning, ett misslyckat autentiseringsförsök) får kvoten { "1.5" }, hela vikten. De förtecknade poängen är de före begränsningen vid { "0" }.

seg-e36961d46c41 = Vikt (poäng)

seg-673f6adcd681 = Varför

seg-399be3301faf = ett autentiseringsfel är ett påstående, inte en statistik

seg-69cfc61477d6 = en förfalskad position måste motsäga fysiken eller mottagarens egna kontroller, och tiden kan inte gå bakåt; en överträdelse med full styrka ({ "1.5" } gånger sin tröskel: { "60" } poäng, poäng { "40" }) är ej betrodd, och vid sin tröskel ({ "30" } poäng, poäng { "70" }) försämrad

seg-7fa1e6e67411 = en oberoende sensor som avviker är försämrad; två med full styrka är ej betrodda

seg-4c4825d2957a = signalmiljön, eller en kontroll med svagt informationsvärde

seg-b5a364a03714 = miljön är fientlig; det ensamt visar inte att positionsbestämningen är fel

seg-4e3749965405 = upp till { "15" }, <c1/>

seg-1e595dbcf96f = ingen vikt på den här rampen: ingenting om inte himlen är dålig, därefter upp till <c1/> ({ "15" }); enbart geometri når försämrad, aldrig ej betrodd, och ger inget larm (se "Geometri" nedan)

seg-9902ca062070 = Bandgränserna följer av vikterna: den lättaste övervakaren som larmar kostar { "12.5" } poäng vid sin tröskel, så varje larm lämnar det nominella bandet; ingen enskild övervakare under { "60" } poäng kan ensam nå bandet ej betrodd (flera tillsammans kan). Resultatet registrerar poängmodellen (<c1/>) och varje epok bär <c2/>: vilka övervakare som drog av, deras kvoter och deras poäng. För ett fartyg är epokens tillstånd bandet för dess poäng.

seg-6f620668ee85 = Geometri: naturlig försämring skild från motsägelser som liknar attacker

seg-93257d87e0d4 = En mottagare vid en kajkran, i en sluss eller under ett högt skrov förlorar satelliter och dess positionsbestämning blir sämre av en orsak som inte är en attack. Från { "0.36" }, enligt designanteckningen om geometri (<c1/>, avsnitt { "4" }), bär varje epok sin <b>satellitgeometri</b>, har ett fartygs poäng en <b>geometriövervakare</b> och bär varje avdrag en <b>klass</b>: <c2/> (himlen), <c3/> (signalmiljön) eller <c4/> (underlag som liknar en attack).

seg-17d13c39b5aa = <b>Varifrån geometrin kommer.</b> Elevationen och azimuten för varje följd satellit (NMEA GSV, UBX NAV-SAT), ur vilka den geometriska försämringen av precisionen (DOP) härleds med motorns enda DOP-kärna (<c1/>, VALIDATED mot gnss_lib_py): <c2/>. Om det inte går, DOP och använda satelliter som mottagaren anger (NMEA GSA): <c3/>. Himmelspositioner och GSA räknas under poängens <c4/> (standard { "10" } s), eftersom många bussar skickar GSV med några sekunders mellanrum; en GSV-mängd som är ofullständig i en epok (slutet av ett utdrag, en förlorad mening) används inte. En logg med ingetdera, till exempel NMEA med bara GGA och RMC, eller Android- och RINEX-loggar i dag, får statusen <b><c5/></b> med anteckningen "geometri okänd": motorn gissar inte en geometri som den inte har fått, och geometriövervakaren körs inte.

seg-a267da42ac3d = tillräckligt många satelliter och DOP inom trösklarna

seg-dabcd392914a = ett eller flera skäl: <c1/>, <c2/>, <c3/>, och (upplysande, inte i poängen) <c4/> när varje följd satellit ligger i ena halvan av horisonten

seg-c255a66d3813 = loggen ger ingen satellitgeometri för den här epoken

seg-0a50145c2bfa = Statusen är beskrivande och etiketten (nedan) är det som räknas för poängen: <c1/> omfattar det upplysande fallet <c2/>, som kan förekomma med bra eller hygglig DOP, och bara en etikett <c3/> poängsätts.

seg-93e49a562493 = <b>Etiketten</b> (alltid redovisad, aldrig poängsatt). Varje epoks <c1/> är <c2/> (HDOP högst <c3/> { "2" }, PDOP högst <c4/> { "3" } och minst <c5/> { "6" } satelliter), <c6/> (HDOP över <c7/> { "4" }, PDOP över <c8/> { "6" } eller färre än <c9/> { "5" } satelliter), <c10/> däremellan, eller <c11/>. Epokens anteckning inleds alltid med etiketten och talen, till exempel "geometri hygglig: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satelliter; inte poängsatt (poängen drar bara av över HDOP { "4" }, PDOP { "6" } eller under { "5" } satelliter)", och lägger till ", signalförlust" när det gäller.

seg-13838e036fae = <b>Geometriövervakaren</b> (fartygspoäng). Den drar av <b>ingenting om inte geometrin är dålig</b>: dess kvot är <c1/>, och så länge den är högst { "1" } (bra eller hygglig geometri, inklusive en öppen himmel med enbart GPS och { "8" } satelliter) kostar den ingenting, så en sådan logg får exakt samma poäng som i { "0.35" }. Över { "1" } ökar avdraget linjärt till <c2/> ({ "15" }) vid <c3/> ({ "1.5" } gånger trösklarna: HDOP { "6" }, PDOP { "9" }, { "3" } satelliter): { "7.5" } poäng vid kvoten { "1.25" } (HDOP { "5" }, eller { "4" } satelliter), { "15" } från { "1.5" } och uppåt (poäng { "85" }, försämrad). Ensamt kan den aldrig ta poängen under <c4/> (standard: poängens <c5/>, { "55" }), så enbart geometri når bandet försämrad som mest och aldrig bandet ej betrodd: taket som gäller är <c6/>, så en <c7/>-tabell som höjer <c8/> (en { "0.35" }-tabell med <c9/> { "90" }, till exempel) sänker taket till <c10/> i stället för att avvisas, och en <c11/> som sätts under <c12/> avvisas. Övervakaren ger inget larm; den förtecknas sist i <c13/> när den fattade ett beslut vid någon epok (ett fartyg vars logg ger geometrin), och räknas inte i identiteten med { "0.35" }; den är inte en post i <c14/> (att ange en avvisas), och taket och golvet som gäller registreras i <c15/> och <c16/>. En dålig epoks anteckning säger varför, till exempel "geometri dålig: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satelliter; försämrad av geometri: HDOP { "5.200" } över { "4" } (härledd ur { "7" } loggade satelliter); inte en motsägelse".

seg-2082f4ccb250 = <b>Klasser.</b> Varje avdrag (<c1/>):

seg-4197bc517f73 = <c1/> (dålig geometri); <c2/> när varje satellit som förlorats mot kalibreringens baslinje låg under <c3/> vid sin senaste rapport

seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> i övrigt; <c7/> vid signalförlust (nedan)

seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; och <c11/> när geometrin är dålig och den angivna HDOP inte stämmer med den angivna himlen (nedan)

seg-1b5e88a4aae4 = <b>Skyddet mot en förfalskad dålig himmel.</b> En spoofer skulle kunna skicka en tunn GSV, eller rapportera en hög HDOP, för att köpa tolerans. Motorn märker och förlåter inte: ingen annan kontroll vidgas av en dålig geometri, och den HDOP som mottagaren anger (GSA inom hållningen, annars GGA) jämförs med den HDOP som härleds ur den himmel den anger. När de skiljer sig med mer än <c1/> ({ "1.0" }, eller { "25" } % av den härledda HDOP, vilket som är störst) bär epoken <c2/> och, när geometrin är dålig, klassas dess avdrag som <c3/>. Vid bra eller hygglig geometri redovisas avvikelsen men poängsätts inte: ingenting dras av om inte geometrin är dålig. Det är ett medvetet val ({ "0.36" }): "noll om inte dålig" gäller för varje epok, så bra och hygglig geometri får exakt samma poäng som i { "0.35" }, och en förfalskad HDOP är aldrig tyst. Flaggan (<c4/>) finns på varje epok i resultatet och varje levande rad, anteckningen säger "…utöver toleransen: redovisad, inte poängsatt (geometrin är inte dålig)" eller "…: geometriavdraget klassas som en motsägelse", <c5/> räknar epokerna, och sammanfattningssidan för underlaget visar antalet, även noll. De { "25" } % är ett <b>REPRESENTATIVE</b> tekniskt val, inte ett uppmätt eller standardiserat värde: en mottagare som löser för en klocka per konstellation, eller med en delmängd av de satelliter den följer (en elevationsmask, ett C/N0-snitt, en RAIM-uteslutning), anger en HDOP som skiljer sig från enklocke-HDOP för varje följd satellit med ett belopp som växer med HDOP, så en fast tolerans ensam skulle läsa naturligt dålig geometri som en motsägelse. En större skillnad läses ändå som en. Ett avdrag klassat <c6/> är ett påstående om himlen, inte ett konstaterande att ingen attack förekom.

seg-0e729ad96db9 = <b>Signalförlust är inte himlen.</b> När satelliter som mottagaren listar i sikte (över <c1/>) inte följs härleder motorn också DOP för varje satellit i sikte. Om den DOP:en i sikte ligger inom trösklarna och antingen ingenting följs eller de ofölja satelliterna är spridda runt horisonten (inte begränsade till ena halvan av den), fanns himlen där och signalen inte: epoken bär <c2/>, anteckningen "satelliter i sikte men inte följda: signalmiljö, inte geometri", och geometriavdraget klassas som <c3/>. Ofölja satelliter som är begränsade till ena halvan av horisonten läses fortfarande som en blockerad himmel (en vägg, en klippa, en kaj). En tvåsidig skymning (en kanjon eller en smal fjord) läses som signalförlust tills en horisontlinje har konfigurerats. Mottagarens signalvärden för ingen positionsbestämning är inte DOP: en angiven HDOP eller PDOP på { "99" } eller mer, GGA-kvalitet { "0" } och GSA-läge { "1" } ger ingen angiven DOP.

seg-0f218d21843b = Nyckel i <c1/>

seg-e5ec84abd61b = vald (designanteckning { "4.2" }): vid <c1/> { "1.5" } m är HDOP { "4" } en 2drms på { "12" } m, den kinematiska kontrollens <c2/>. IEC 61108-1 anges ofta ange sina noggrannhetskrav för HDOP ≤ { "4" } (eller PDOP ≤ { "6" }): återgivet ur sekundär litteratur om GNSS-mottagare, ingen specifik sekundär källa konsulterad och standarden inte läst; ska kontrolleras mot standardens text

seg-d99dc0fd090a = tröskeln för tillgänglighet av PDOP i <c1/>; GPS SPS Performance Standard, 5:e utg. ({ "2020" }), PDOP ≤ { "6" }, så som den anges i <c2/>; ska kontrolleras mot standardens text

seg-2fffa47378ec = en mer än vad en positionsbestämning behöver, så att en enskild förlust inte avslutar positionsbestämningen; det minsta antalet med en redundant mätning för RAIM

seg-7dc0baed2bc4 = en angiven indata för 2drms-länken i <c1/>; ange mottagarens eget värde

seg-7b5778d93d40 = { "1.0" } HDOP

seg-093cff5d1150 = vald (designanteckning { "4.2" }): den absoluta delen av toleransen; en avvikelse utöver toleransen är inte geometri

seg-be5c3aefd942 = REPRESENTATIVE tekniskt val: den relativa delen, för mottagare med klockor per konstellation eller delmängdslösningar

seg-e71c6876114b = designanteckning { "4.3" }: satelliter som förloras under den förloras till himlen; en horisontlinje ({ "0.36" } punkt { "1" }) kommer att utvidga detta

seg-bebe291ca1c0 = geometrisk, upplysande: varje satellit i ena halvan av horisonten

seg-06519582227b = designanteckning { "4.2" }: enbart geometri flyttar poängen från nominell till försämrad och aldrig till ej betrodd; avdrag bara när geometrin är dålig (grundarens beslut B1, { "0.36" })

seg-be21b5a31382 = poängens eget <c1/>: rampen når <c2/> vid { "1.5" } gånger trösklarna för dålig

seg-e922a5342a3c = poängens <c1/> ({ "55" })

seg-09fe8c435ece = enbart geometri når aldrig bandet ej betrodd; taket som gäller är <c1/>; ett golv under <c2/> avvisas

seg-a07e6ce67371 = REPRESENTATIVE, bara etiketten: hälften av <c1/> (startkvoten för poängen i { "0.35" })

seg-06db7e7af59c = REPRESENTATIVE, bara etiketten: hälften av <c1/>

seg-7e7f17d36ea4 = REPRESENTATIVE, bara etiketten: en mer än <c1/>, så att en enskild förlust fortfarande lämnar en redundant mätning

seg-ef7a4c24e870 = <b>Vad som ändrades i utdata, och vad som inte ändrades.</b> Ingen poäng ändras om inte geometrin är dålig; etiketten redovisas alltid. Tillagda nycklar: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> avrundad till { "0.001" }, <c9/> (null tills en horisontlinje har konfigurerats), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satelliter förtecknade över <c16/>), <c17/>, <c18/>), <c19/> på varje avdrag, och sist <c20/> (trösklar, hållning, taket och golvet som gäller, proveniens, klassregler) och <c21/> (epoker per status, per etikett och per avdragsklass, samt epokerna med en avvikelse i angiven HDOP); <c22/> är som i { "0.35" }. Två tester håller detta till byte-nivå mot baslinjen "{ "0.36" } portabel" när de nycklarna har tagits bort (hasharna för { "0.35.0" }, ombaserade när motorn gick över till portabel matematik och kvar i testerna som registret över vad { "0.35.0" } släppte: <c23/>). <c24/> håller varje utdata från båda exempelsessionerna (resultat-JSON, CSV, SVG, utlåtande, återspelade levande rader, <c25/>, Prometheus, CEF, LEEF). <c26/> håller batchresultatet, sammanfattningen, de levande raderna och <c27/> för varje incheckad NMEA-korpus för fartyg (demon och de maritima referensdatan, var och en även som öppen himmel med enbart GPS och { "8" } satelliter, samt besättningsträningsscenarierna som genereras ur sina frön); i de två träningsscenarier där jamming gör geometrin dålig är varje epok som inte är dålig identisk och varje dålig skiljer sig enbart genom geometriavdraget. En logg vars geometri är dålig förlorar upp till { "15" } poäng som den inte förlorade i { "0.35" }; det är den avsedda ändringen. I demon läses avdragningen som <c28/>; <c29/> redigerar loggen för att maska den västra himlen (hygglig: märkt, inte poängsatt), för att maska den och två östliga satelliter (dålig: geometriavdrag, förlorad låsning <c30/> eftersom höga satelliter också försvann), för att bara förlora satelliter under { "15" }° (förlorad låsning <c31/>), och för att ange en HDOP som himlen inte förklarar (avdraget för dålig geometri blir <c32/>). Trösklarna är MODELLED: valda, inte anpassade till någon logg; ingenting här hävdar hur ofta naturlig försämring och attacker kan skiljas åt på verkliga data.

seg-8ddaf82ba00b = Att ange händelser och prediktioner

seg-c52c285aa308 = För varje händelse anger resultatet falsklarmen mellan kalibrering och start, det första larmet och dess övervakare, fördröjningen, utfallet (<c1/>, <c2/>, <c3/> eller <c4/>) och det observerade medianfallet i C/N0 mot prediktionen (<c5/>, <c6/>, <c7/> eller <c8/>). Avvikelser redovisas, trimmas aldrig bort: toleranserna finns i scenariot, och scenariot finns i resultatets hash.

seg-3715df3fd8f7 = Vad detta inte hävdar

seg-21a4b903e179 = Förtroendeövervakarna är MODELLED: deras trösklar är indata, och deras detektionsprestanda mot verklig störning är det som händelsepoängsättningen mäter, inte något som den här typen hävdar. På spoofing-sessionerna i JammerTest { "2024" } fångar övervakarna i motorvägen vissa starter inom { "10" } s och är sena på andra; se raden "Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM" i <a1><c1/></a1> för siffrorna. En prediktion som stämmer överens med en logg är en datapunkt, inte en validering.

seg-0c413c1a491c = <s1>Föregående</s1>Resiliens-tvärkoppling

seg-63fc2b340fd1 = <s1>Nästa</s1>Maritimt förtroende
