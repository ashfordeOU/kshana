# docs--receiver-trust: translations (nb)

seg-adc34608c46b = Klasse

seg-2247a2344710 = Betydning

seg-fdbb9db68f1d = ingen

seg-f63dd3d7aad4 = Kilde

seg-98151954f217 = false

seg-c353e7bec219 = Nøkkel

seg-cc38b40eb7a5 = Monitor

seg-7670cf4ceda3 = Standard

seg-a0cc45088f5f = GSV

seg-26ab8544afba = Tillitsscore over én syntetisk overfart, fra en reell kjøring av motoren v{ $version } på examples/maritime-trust (en oppdiktet NMEA-logg fra en ferje på ruten Tallinn til Helsinki, { "3001" } epoker ved { "1" } Hz). Tre felt deler én tidsakse. Øverst: avstanden mellom posisjonen mottakeren rapporterer og fartøyets virkelige posisjon, som holder seg innenfor noen få meter til omtrent { "1576" } s, da loggens innskrevne posisjonsbortdrag trekker den bort, mens mottakeren hele tiden rapporterer en gyldig posisjonsbestemmelse. I midten: tillitsscoren fra { "0" } til { "100" }, ikke beregnet de første { "300" } s av kalibreringen, i det nominelle båndet (minst { "90" }) fram til bortdraget, deretter fallende gjennom det degraderte båndet (minst { "55" }) og ned i det upålitelige båndet. Nederst: båndet for hver epoke som et farget bånd med navnet sitt. Scoren er veiledende. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon. Loggen er oppdiktet for å vise formatet og monitorene; den er ikke en måling og sier ingenting om hvordan en mottaker ville prestert.

seg-7000c522cc93 = Mottakerens eget spoofingflagg satt mot Kshanas alarmer, fra en ekte kjøring av motor v{ $version } på en oppdiktet UBX-logg ({ "200" } epoker ved { "1" } Hz). C/N0 faller { "20" } dB ved { "80" } til { "90" } s og { "120" } til { "130" } s; mottakeren flagger { "120" } til { "130" } s og { "160" } til { "165" } s. Av { "140" } epoker sammenlignet etter kalibrering hadde { "11" } begge som flagget, { "6" } bare mottakeren, { "11" } bare Kshana og { "112" } ingen av dem. Ingen av sidene er referanse, og enighet er ikke validering. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-caadaad98cf6 = Kilde: <c1/>

seg-4f10c2397fcc = Mottakertillit: vurdering av en virkelig GNSS-mottakerlogg

seg-2596bdcdaf8e = <c1/> leser en logg fra en virkelig GNSS-mottaker (global navigation satellite system), kjører tillitsmonitorer over den epoke for epoke, og sier når og hvorfor mottakerens posisjonsbestemmelse sluttet å være pålitelig. Den kan også score loggen mot hendelser og prediksjoner du angir <b>før</b> kjøringen: om hver hendelse ble oppdaget i tide, og om et modellert fall i bærer-til-støy-tetthet (C/N0) stemmer med det mottakeren målte.

seg-63f24d5f2d5e = Observablene er mottakerens egne; monitorene og terskelverdiene deres er motorens og dine. Hvert resultat bærer den merkingen, SHA-256 for loggen og hver terskelverdi det kjørte med, slik at en kjøring kan gjentas og revideres.

seg-6f5014b93fbc = For et fartøy underveis, med en levende score og en valgfri port foran et kartsystem, se <a1><c1/></a1>.

seg-82cdabb6086f = Dette skriver <c1/>, <c2/> (én rad per epoke) og <c3/> (gjennomsnittlig C/N0 over tid med tillitstilstanden under) ved siden av scenarioet, og skriver ut en enlinjers konklusjon. Eksempelloggen er syntetisk, laget for å vise formatet; pek <c4/> mot loggen fra din egen mottaker.

seg-ec2be1ea73f5 = Figuren ovenfor er fartøysdemoen fra <a1><c1/></a1>: en oppdiktet logg, en veiledende score.

seg-0f24c5cf4b9b = Det samme scenarioet kan kjøres fra Python (<c1/>), fra WebAssembly-pakken (<c2/>, med loggen innebygd) og fra verktøyet <c3/> på Model Context Protocol-serveren (MCP).

seg-1f3cc12b6230 = Logger den leser

seg-23fd4a5bf5dd = Hva som leses

seg-2e1a655cf846 = u-blox binær

seg-cb31da7b7d88 = NAV-SAT C/N0, elevasjon og azimut per satellitt, NAV-PVT-posisjon, MON-RF automatisk forsterkningsstyring (AGC) og jamming-indikatoren <c1/>, NAV-TIMEGPS-uke, og mottakerens egne flagg: NAV-STATUS <c2/> og SEC-SIG (<c3/>, se <a1>RECEIVER-PROTOCOLS.md</a1>)

seg-cec582f4afa5 = RINEX { "3" } observasjonsfil

seg-57708a636148 = <c1/>-koder (C/N0) per satellitt og signal; med en kringkastet navigasjonsfil (<c2/>) pseudoavstandene for motorens egen posisjonsbestemmelse

seg-176c2493782e = Android GnssLogger CSV

seg-d69b9dd6ebad = <c1/>-rader: C/N0 og <c2/> per satellitt; <c3/>-rader: posisjon

seg-d390120374a9 = NMEA { "0183" }-tekst

seg-9eb885aa79af = GSV signal-til-støy per satellitt (dB-Hz, med eller uten signal-ID { "4.10" }) og dens elevasjon og azimut, GSA presisjonsfortynning og brukte satellitter, GGA og RMC tid og posisjon

seg-7864926ce37e = Septentrio binær ({ "0.38" }, bare lesing)

seg-44675c4bdf40 = PVTGeodetic-posisjon, MeasEpoch C/N0 per satellitt og signal, RFStatus antall bånd; se <a1>RECEIVER-PROTOCOLS.md</a1>

seg-a5367d75c5ee = RTKLIB-løsningsfil (<c1/>)

seg-37d28ca5ed00 = tid, posisjon (bredde/lengde eller ECEF, konvertert) og brukte satellitter per epoke; filer med grader-minutter-sekunder avvises med en melding

seg-5e10ecb93f96 = NovAtel OEM7 ASCII- eller binærlogger

seg-a630fbcf7425 = <c1/>-posisjon (bare beregnet løsning), <c2/> C/No per satellitt og signal; <c3/>-jammerflagg blir epokens <c4/> (jammingtilstand { "2" } når mottakeren flagger en jammer, { "1" } når den ikke gjør det; RXSTATUS har ikke noe spoofingflagg), satt opp mot Kshanas alarmer gjennom sammenligningen <c5/>

seg-d4735b581cbf = GNSS-SDR Monitor- og PVT-monitor-strømmer som JSON-linjer

seg-053235d67fb3 = C/N0 per kanal, posisjonsbestemmelse, brukte satellitter, HDOP, azimut og elevasjon; laget av <c1/>

seg-2e9033aa4e9d = Detaljer, kilder og begrensninger for disse tre: <a1><c1/></a1>.

seg-8987b2c46eb0 = Hver epoke leserne produserer, har også <c1/>, <c2/> byteforskyvninger inn i inndataene: det minste sammenhengende området som inneholder postene som bidro til den, slik at den nøyaktige rå delen kan hashes for et hendelsesvindu. NMEA: hver linje som leses mens epoken er gjeldende (en overmengde der en urelatert linje ligger mellom setningene). UBX: epokens rammer. RINEX { "3" }: epokepostene fra hver <c3/>-linje til den neste. Android: epokens <c4/>-rader (en <c5/>-rad bare for en epoke uten <c6/>-rader). Mangler for en direkte strøm og overalt der det ikke er veldefinert (RINEX { "2" }).

seg-cea9532b57a2 = Filen leveres med <c1/> (løst opp mot scenarioets egen mappe), eller innebygd som <c2/> eller <c3/> (de eneste valgene i en nettleser).

seg-3bc4f9c91950 = En IMU-logg som en andre sensor

seg-49b10ad5928e = <c1/> legger til en treghetslogg på den samme klokken:

seg-9e0560b09f5a = Giringshastigheten integreres fra <c1/> og fyller ut kursen der mottakerloggen ikke har noen, slik at monitoren <c2/> (som trenger <c3/> på plattformen) sammenligner gyrokurs med kurs over grunnen. En gyro driver: kursen er bare så god som integrasjonsvinduet, og <c4/> avgjør hva som regnes som uenighet. Oppsettet <c5/> er dokumentert i <c6/>. IMU-bytene er en del av scenarioets hash og av scenarioets hash i en bevispakke. Innebygd (<c7/>/<c8/>) fungerer på alle flater; en <c9/> avvises der filer ikke leses.

seg-fd3e6ef1cd93 = Plattform: stasjonær eller fartøy

seg-b67c0d57dc1d = Monitorene ovenfor forutsetter en fast antenne. Et scenario angir plattformen før kjøringen i en <c1/>-tabell på toppnivå; uten en er plattformen <c2/>, og ingenting endres.

seg-3d6bc18bd83e = Hvorfor den verdien

seg-32f339f63acf = Over marsjfarten til handelsskip og de fleste passasjerfartøy, så et virkelig fartøy når den aldri; langt under farten en posisjonsdrag-av innebærer. Et tregere fartøy bør oppgi en lavere grense: jo lavere grense, jo tidligere fanges en drag.

seg-9506e8601857 = Et stort skip endrer fart med godt under { "0.1" } m/s²; et lite, raskt fartøy når noen få tideler ved en kraftig gassendring.

seg-b0b6baaee456 = Et stort skip svinger med godt under { "1" } deg/s og et lite fartøy i en krapp sving med noen få.

seg-53d0fffb3c09 = En egenskap ved installasjonen; et gjett ville være en skjult terskel.

seg-ac48403443f9 = Å oppgi <c1/> og så mangle i loggen er en feil, slik at en manglende sensor ikke kan passere som en ren kontroll.

seg-8266739dc26b = Fartøysnøklene avvises under <c1/>. For et fartøy kjører ikke monitoren <c2/>, fordi den måler avstand fra kalibreringsmiddelverdien, noe som er galt for en bevegelig antenne; resultatets <c3/> registrerer plattformen og grensene som ble brukt.

seg-7551792a0cb4 = De syntetiske NMEA-strømmene fra <a1><c1/></a1>, laget for mannskapstrening, godtas av NMEA-leseren og kan kjøres gjennom denne typen som en hvilken som helst NMEA-logg.

seg-18d7538bc56d = Monitorer

seg-e5c1cb89f0b3 = Hver monitor trenger sine data; en monitor hvis data ikke finnes i loggen, kjøres ikke og er ikke oppført i <c1/>. De første <c2/> sekundene (standard { "60" }) setter grunnlinjen og gir aldri alarm.

seg-3be9ee05f087 = Alarm når

seg-98ead58c671d = Trenger

seg-f6e6df453260 = gjennomsnittlig C/N0 over satellittene som er felles med grunnlinjen, faller med <c1/> eller mer (standard { "6" } dB)

seg-d9bf6efc6835 = sporede satellitter faller <c1/> eller mer under grunnlinjens median (standard { "4" })

seg-60c7a99f9819 = AGC-målingen avviker fra grunnlinjen med mer enn <c1/> standardavvik (standard { "5" })

seg-7c1c65e64418 = UBX MON-RF eller Android <c1/>

seg-a5a5252417cb = u-blox <c1/> overstiger <c2/> (standard { "80" } av { "255" })

seg-8bca191bf4c4 = UBX MON-RF

seg-0ac4898d81cf = mottakerens egen posisjonsbestemmelse er mer enn <c1/> fra kalibreringsmiddelverdien (standard { "50" } m)

seg-6a3fec1214b9 = en rapportert posisjon

seg-4c05faf783eb = paritetsbasert RAIM (receiver autonomous integrity monitoring) på motorens egen enkeltpunktsposisjonsbestemmelse forkaster målesettet

seg-037ab193613c = RINEX-logg med <c1/>

seg-8890a4ebf231 = motorens enkeltpunktsposisjonsbestemmelse mislykkes med fem eller flere satellitter

seg-0a5a708ac75b = mottakerklokken avviker fra sin predikerte linje med mer enn den minste påvisbare forskyvningen for kalibreringsstøyen

seg-31b64b635261 = Kalibrert profil (må velges).

seg-a73f2c2dfc9a = <c1/> erstatter de tre interferenstersklene med verdier kalibrert på det offentlige JammerTest { "2024" }-datasettet (én u-blox ZED-F9P per scenario; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. Kalibreringen ble forhåndsregistrert (<c5/>), og profilen er MODELLED, tilpasset én offentlig kampanje: terskelen <c6/> <b>bommet</b> på den forhåndsregistrerte terskelen for falske alarmer i det tilbakeholdte datasettet ({ "0.0231" } mot { "0.02" }); terskelene for AGC og jamming-indikator og unionsterskelen (falske alarmer { "0.033" }, deteksjon { "0.81" }) ble bestått (<c7/>). Den gjelder for den mottakertypen ved den hendelsen, mot planlagte angrepsvinduer, og ble kalibrert på CSV-loggene i datasettet (UBX-loggene gir flere falske alarmer i to mapper). Et resultat som er kjørt med profilen, gjentar terskelverdiene som ble brukt og har en <c8/> som sier alt dette. Uten profilen gjelder standardverdiene ovenfor, og alle utdata er uendret.

seg-1fa8c4bd1a18 = For en plattform av typen <c1/> kjører også monitorene for bevegelige plattformer (terskelverdier i en <c2/>-tabell på toppnivå, hver standardverdi dokumentert i <c3/>); hver trenger sine data og er bare oppført i <c4/> når den kom til en avgjørelse:

seg-4b2840d9d0af = posisjonsendringen er uenig med rapportert fart og kurs, eller innebærer en fart, akselerasjon eller svinghastighet over fartøyets grenser

seg-656c19cb5b52 = posisjonsbestemmelser; fart og kurs (RMC eller VTG) for dødregningsdelen

seg-cedefd52998d = gyrokurs og kurs over grunnen avviker med mer enn <c1/> (fart over <c2/>)

seg-c66704cbdd02 = HDT-, THS- eller VHW-kurs, <c1/>

seg-1bbbf0033234 = fart gjennom vannet og fart over grunnen avviker med mer enn <c1/>

seg-c9101740b235 = VHW eller VBW, og fart over grunnen

seg-42ac59072099 = GGA-høyden avviker fra <c1/> med mer enn <c2/>

seg-811ec460249c = GGA-høyde, <c1/>

seg-854ea9c26df4 = spredningen av C/N0 på tvers av satellitter faller til <c1/> av kalibreringsmedianen

seg-837fc4cb832c = C/N0 for de felles satellittene steg i gjennomsnitt med <c1/>, og <c2/> av dem steg

seg-faae07674361 = påfølgende epoketider går uregelmessig, går bakover eller forlater vertsklokken

seg-f799a53897ed = NMEA-tid; vertsklokke for den siste delen

seg-ee4913c9f2ed = mottakeren rapporterer en OSNMA-autentiseringsfeil (en rapportert status leses; ingenting verifiseres; for å verifisere OSNMA fra selve I/NAV-sidene, se <a1>docs/OSNMA.md</a1>)

seg-3fad5fcde4dc = statussetningen <c1/>

seg-ce072f2ebb6c = En epoke er <b>ikke pålitelig</b> når RAIM, klokkemonitoren, en løsningsfeil eller et posisjonshopp gir alarm, eller C/N0-fallet når to ganger terskelen; <b>degradert</b> ved enhver annen alarm; og <b>nominell</b> ellers.

seg-4124ff6013a0 = Motorveien (<c1/>, <c2/>, <c3/>) er den samme beregningen som den uavhengige referansen for spoofing i JammerTest { "2024" } i <c4/>: <c5/> kontrollerer at den første alarmen, for alle åtte publiserte starttidspunkter, faller på samme epoke og er av samme slag.

seg-83be3c22a577 = Tillitsscore (fartøysplattform)

seg-812991f245cd = For et fartøy får hver epoke etter kalibreringen også en score fra { "0" } til { "100" } og årsakene til at den ikke er { "100" }. Avbildningen er deterministisk og fastsatt før noen logg scores: ingen læring, ingenting tilpasset hendelser. Hver monitor reduserer sitt belegg til et forhold <c1/> (en alarm ved { "1" } eller mer); et forhold koster scoren

seg-ada5a0a52315 = slik at en monitor ikke koster noe så lenge den er under <c1/> av terskelen sin (standard { "0.5" }), halvparten av vekten ved terskelen, og hele vekten ved <c2/> ganger terskelen (standard { "1.5" }); scoren er ikke-økende i hver statistikk. En kilde som ikke rapporterer ved en epoke, beholder sin siste statistikk i <c3/> (standard { "10" } s: to sykluser av en C/N0-setning som sendes hvert { "5" } s), både som alarm og som fradrag.

seg-6c06de24ebfe = Avrundingen er halv opp (<c1/>), båndet er det til den avrundede scoren, og avkortingen kommer før avrundingen. Bare monitorer med poeng over null er oppført i fradragene, med forhold og uavrundede poeng, størst poeng først; fradrag med like poeng er oppført i rekkefølgen til monitornavnene <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. En monitor hvis test er bestått eller ikke bestått (en mislykket løsning, en mislykket autentisering) får forholdet { "1.5" }, full vekt. De oppførte poengene er de før avkortingen ved { "0" }.

seg-e36961d46c41 = Vekt (poeng)

seg-673f6adcd681 = Hvorfor

seg-399be3301faf = en autentiseringsfeil er en påstand, ikke en statistikk

seg-69cfc61477d6 = en forfalsket posisjon må motsi fysikken eller mottakerens egne kontroller, og tiden kan ikke gå bakover; ett brudd med full styrke ({ "1.5" } ganger terskelen: { "60" } poeng, score { "40" }) er ikke pålitelig, og ved terskelen ({ "30" } poeng, score { "70" }) degradert

seg-7fa1e6e67411 = én uavhengig sensor som er uenig, er degradert; to med full styrke er ikke pålitelige

seg-4c4825d2957a = signalmiljøet, eller en kontroll med svak informasjonsverdi

seg-b5a364a03714 = miljøet er fiendtlig; det alene viser ikke at posisjonsbestemmelsen er gal

seg-4e3749965405 = opptil { "15" }, <c1/>

seg-1e595dbcf96f = ikke en vekt på denne rampen: ingenting med mindre himmelen er dårlig, deretter opptil <c1/> ({ "15" }); geometri alene når degradert, aldri ikke pålitelig, og gir ingen alarm (se «Geometri» nedenfor)

seg-9902ca062070 = Båndgrensene følger av vektene: den letteste monitoren som gir alarm, koster { "12.5" } poeng ved terskelen, så enhver alarm forlater det nominelle båndet; ingen enkelt monitor under { "60" } poeng kan alene nå båndet for ikke pålitelig (flere sammen kan). Resultatet registrerer scoremodellen (<c1/>), og hver epoke har <c2/>: hvilke monitorer som trakk fra, forholdene deres og poengene deres. For et fartøy er epokens tilstand båndet til scoren.

seg-6f620668ee85 = Geometri: naturlig forringelse atskilt fra angrepslignende inkonsistens

seg-93257d87e0d4 = En mottaker ved siden av en kaikran, i en sluse eller under et høyt skrog mister satellitter, og posisjonsbestemmelsen blir dårligere av en grunn som ikke er et angrep. Fra { "0.36" }, etter designnotatet for geometri (<c1/>, avsnitt { "4" }), har hver epoke sin <b>satellittgeometri</b>, et fartøys score har en <b>geometrimonitor</b>, og hvert fradrag har en <b>klasse</b>: <c2/> (himmelen), <c3/> (signalmiljøet) eller <c4/> (angrepslignende belegg).

seg-17d13c39b5aa = <b>Hvor geometrien kommer fra.</b> Elevasjonen og azimuten til hver sporede satellitt (NMEA GSV, UBX NAV-SAT), som presisjonsfortynningen (DOP) utledes fra med motorens ene DOP-kjerne (<c1/>, VALIDATED mot gnss_lib_py): <c2/>. Hvis det ikke finnes, de DOP-verdiene og brukte satellittene mottakeren selv oppgir (NMEA GSA): <c3/>. Himmelposisjoner og GSA teller for scorens <c4/> (standard { "10" } s), fordi mange busser sender GSV med noen sekunders mellomrom; et GSV-sett som er ufullstendig i en epoke (slutten av et utdrag, en tapt setning), brukes ikke. En logg med ingen av delene, for eksempel NMEA med bare GGA og RMC, eller Android- og RINEX-logger i dag, får statusen <b><c5/></b> med merknaden "geometry unknown": motoren gjetter ikke en geometri den ikke har fått, og geometrimonitoren kjører ikke.

seg-a267da42ac3d = nok satellitter og DOP innenfor terskelverdiene

seg-dabcd392914a = én eller flere årsaker: <c1/>, <c2/>, <c3/>, og (kun informativt, ikke i scoren) <c4/> når hver sporede satellitt står i én halvdel av horisonten

seg-c255a66d3813 = loggen gir ingen satellittgeometri for denne epoken

seg-0a50145c2bfa = Statusen er beskrivende, og etiketten (nedenfor) er det som teller for scoren: <c1/> omfatter det informative tilfellet <c2/>, som kan forekomme med god eller middels DOP, og bare en <c3/>-etikett scores.

seg-93e49a562493 = <b>Etiketten</b> (alltid rapportert, aldri scoret). Hver epokes <c1/> er <c2/> (HDOP høyst <c3/> { "2" }, PDOP høyst <c4/> { "3" } og minst <c5/> { "6" } satellitter), <c6/> (HDOP over <c7/> { "4" }, PDOP over <c8/> { "6" } eller færre enn <c9/> { "5" } satellitter), <c10/> mellom de to, eller <c11/>. Epokens merknad åpner alltid med etiketten og tallene, for eksempel "geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)", og legger til ", signal loss" når det gjelder.

seg-13838e036fae = <b>Geometrimonitoren</b> (fartøysscore). Den trekker fra <b>ingenting med mindre geometrien er dårlig</b>: forholdet er <c1/>, og så lenge det er høyst { "1" } (god eller middels geometri, inkludert en åpen himmel med { "8" } satellitter og bare GPS) koster det ingenting, så en slik logg scorer nøyaktig som i { "0.35" }. Over { "1" } øker fradraget lineært til <c2/> ({ "15" }) ved <c3/> ({ "1.5" } ganger terskelverdiene: HDOP { "6" }, PDOP { "9" }, { "3" } satellitter): { "7.5" } poeng ved forholdet { "1.25" } (HDOP { "5" }, eller { "4" } satellitter), { "15" } fra { "1.5" } og oppover (score { "85" }, degradert). Alene kan den aldri ta scoren under <c4/> (standard: scorens <c5/>, { "55" }), så geometri alene når høyst det degraderte båndet og aldri det som ikke er pålitelig: den gjeldende grensen er <c6/>, så en <c7/>-tabell som hever <c8/> (for eksempel en fra { "0.35" } med <c9/> { "90" }) senker grensen til <c10/> i stedet for å bli avvist, og et <c11/> satt under <c12/> avvises. Monitoren gir ingen alarm; den er oppført sist i <c13/> når den kom til en avgjørelse ved en epoke (et fartøy der loggen gir geometrien), og den telles ikke i identiteten med { "0.35" }; den er ikke en <c14/>-oppføring (å sette en avvises), og grensen og gulvet som gjelder, registreres i <c15/> og <c16/>. Merknaden for en dårlig epoke sier hvorfor, for eksempel "geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency".

seg-2082f4ccb250 = <b>Klasser.</b> Hvert fradrag (<c1/>):

seg-4197bc517f73 = <c1/> (dårlig geometri); <c2/> når hver satellitt som gikk tapt mot kalibreringsgrunnlinjen, var under <c3/> ved sin siste rapport

seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> ellers; <c7/> under signaltap (nedenfor)

seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; og <c11/> når geometrien er dårlig og den oppgitte HDOP-en er uenig med den oppgitte himmelen (nedenfor)

seg-1b5e88a4aae4 = <b>Vernet mot en forfalsket dårlig himmel.</b> En spoofer kunne sende en tynn GSV, eller rapportere en høy HDOP, for å kjøpe toleranse. Motoren merker og tilgir ikke: ingen annen kontroll utvides av en dårlig geometri, og HDOP-en mottakeren oppgir (GSA innenfor holdet, ellers GGA), sammenlignes med HDOP-en utledet fra himmelen den oppgir. Når de avviker med mer enn <c1/> ({ "1.0" }, eller { "25" } % av den utledede HDOP-en, det som er størst), har epoken <c2/>, og når geometrien er dårlig, klassifiseres fradraget som <c3/>. Med god eller middels geometri rapporteres uenigheten og scores ikke: ingenting trekkes fra med mindre geometrien er dårlig. Dette er et bevisst valg ({ "0.36" }): «null med mindre dårlig» gjelder for hver epoke, så god og middels geometri scorer nøyaktig som i { "0.35" }, og en forfalsket HDOP er aldri taus. Flagget (<c4/>) står på hver epoke i resultatet og hver direktelinje, merknaden sier "…beyond the tolerance: reported, not scored (the geometry is not poor)" eller "…: the geometry deduction is classed an inconsistency", <c5/> teller epokene, og siden med beleggsoppsummeringen viser tallet, null medregnet. De { "25" } % er et <b>REPRESENTATIVE</b> ingeniørvalg, ikke et målt eller standardisert tall: en mottaker som løser for én klokke per konstellasjon, eller med en delmengde av satellittene den sporer (en elevasjonsmaske, et C/N0-kutt, en RAIM-utelukkelse), oppgir en HDOP som avviker fra enkeltklokke-HDOP-en for hver sporet satellitt med en størrelse som vokser med HDOP-en, så en fast toleranse alene ville lest naturlig dårlig geometri som en inkonsistens. En større forskjell leses fortsatt som en. Et fradrag klassifisert som <c6/> er en uttalelse om himmelen, ikke en påvisning av at intet angrep har funnet sted.

seg-0e729ad96db9 = <b>Signaltap er ikke himmelen.</b> Når satellitter mottakeren oppgir i sikte (over <c1/>) ikke spores, utleder motoren også DOP for hver satellitt i sikte. Hvis denne DOP-en for satellitter i sikte er innenfor terskelverdiene, og enten ingenting spores eller de usporede satellittene er spredt rundt horisonten (ikke begrenset til én halvdel av den), var himmelen der og signalet var det ikke: epoken har <c2/>, merknaden "satellites in view but not tracked: signal environment, not geometry", og geometrifradraget klassifiseres som <c3/>. Usporede satellitter begrenset til én halvdel av horisonten leses fortsatt som en blokkert himmel (en vegg, en klippe, en kai). En tosidig hindring (en canyon eller en smal fjord) leses som signaltap helt til en horisontlinje er konfigurert. Mottakerens sentinelverdier for ingen posisjonsbestemmelse er ikke DOP: en oppgitt HDOP eller PDOP på { "99" } eller mer, GGA-kvalitet { "0" } og GSA-modus { "1" } gir ingen oppgitt DOP.

seg-0f218d21843b = <c1/>-nøkkel

seg-e5ec84abd61b = valgt (designnotat { "4.2" }): ved <c1/> { "1.5" } m er HDOP { "4" } en 2drms på { "12" } m, <c2/> for den kinematiske kontrollen. IEC 61108-1 oppgis ofte å angi nøyaktighetskravene sine for HDOP ≤ { "4" } (eller PDOP ≤ { "6" }): gjengitt fra sekundær litteratur om GNSS-mottakere, ingen bestemt sekundærkilde konsultert og standarden ikke lest; skal kontrolleres mot standardens tekst

seg-d99dc0fd090a = terskelverdien for PDOP-tilgjengelighet i <c1/>; GPS SPS Performance Standard, 5. utg. ({ "2020" }), PDOP ≤ { "6" }, slik det er sitert i <c2/>; skal kontrolleres mot standardens tekst

seg-2fffa47378ec = én mer enn en posisjonsbestemmelse trenger, slik at ett enkelt tap ikke avslutter posisjonsbestemmelsen; det færreste med én overflødig måling for RAIM

seg-7dc0baed2bc4 = en oppgitt inndata for 2drms-koblingen i <c1/>; sett mottakerens eget tall

seg-7b5778d93d40 = { "1.0" } HDOP

seg-093cff5d1150 = valgt (designnotat { "4.2" }): den absolutte delen av toleransen; en uenighet utover toleransen er ikke geometri

seg-be5c3aefd942 = REPRESENTATIVE ingeniørvalg: den relative delen, for mottakere med klokker per konstellasjon eller delmengdeløsninger

seg-e71c6876114b = designnotat { "4.3" }: satellitter som går tapt under den, er tapt for himmelen; en horisontlinje ({ "0.36" } punkt { "1" }) vil utvide dette

seg-bebe291ca1c0 = geometrisk, informativt: hver satellitt i én halvdel av horisonten

seg-06519582227b = designnotat { "4.2" }: geometri alene flytter scoren fra nominell til degradert og aldri til ikke pålitelig; trekkes bare fra når geometrien er dårlig (grunnleggerens beslutning B1, { "0.36" })

seg-be21b5a31382 = scorens egen <c1/>: rampen når <c2/> ved { "1.5" } ganger de dårlige terskelverdiene

seg-e922a5342a3c = scorens <c1/> ({ "55" })

seg-09fe8c435ece = geometri alene når aldri båndet for ikke pålitelig; grensen som gjelder, er <c1/>; et gulv under <c2/> avvises

seg-a07e6ce67371 = REPRESENTATIVE, bare for etiketten: halvparten av <c1/> (startforholdet til scoren fra { "0.35" })

seg-06db7e7af59c = REPRESENTATIVE, bare for etiketten: halvparten av <c1/>

seg-7e7f17d36ea4 = REPRESENTATIVE, bare for etiketten: én mer enn <c1/>, slik at ett enkelt tap fortsatt etterlater en overflødig måling

seg-ef7a4c24e870 = <b>Hva som er endret i utdataene, og hva som ikke er det.</b> Ingen score endres med mindre geometrien er dårlig; etiketten rapporteres alltid. Tillagte nøkler: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> avrundet til { "0.001" }, <c9/> (null helt til en horisontlinje er konfigurert), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satellitter oppført over <c16/>), <c17/>, <c18/>), <c19/> på hvert fradrag, og til slutt <c20/> (terskelverdier, hold, grensen og gulvet som gjelder, opphav, klasseregler) og <c21/> (epoker etter status, etter etikett og etter fradragsklasse, og epokene med en uoverensstemmelse i oppgitt HDOP); <c22/> er som i { "0.35" }. To tester holder dette til bytene i grunnlinjen "{ "0.36" } portable" når disse nøklene er fjernet (hashene fra { "0.35.0" }, omgjort da motoren gikk over til portabel matematikk og beholdt i testene som en oversikt over hva { "0.35.0" } ga ut: <c23/>). <c24/> holder hvert utdata fra begge eksempeløktene (resultat-JSON, CSV, SVG, konklusjon, gjenspilte direktelinjer, <c25/>, Prometheus, CEF, LEEF). <c26/> holder batchresultatet, oppsummeringen, direktelinjene og <c27/> for hvert innsjekket NMEA-korpus for fartøy (demoen og referansetestdataene for sjøfart, hver også som åpen himmel med bare GPS og { "8" } satellitter, og mannskapstreningsscenarioene generert fra seedene sine); i de to treningsscenarioene der jamming gjør geometrien dårlig, er hver epoke som ikke er dårlig, identisk, og hver dårlig epoke avviker bare med geometrifradraget. En logg med dårlig geometri mister opptil { "15" } poeng den ikke mistet i { "0.35" }; det er den tilsiktede endringen. På demoen leses drag-av som <c28/>; <c29/> redigerer loggen for å maskere den vestlige himmelen (middels: merket, ikke scoret), for å maskere den og to østlige satellitter (dårlig: geometrifradrag, tap av lås <c30/> fordi høye satellitter også gikk tapt), for å miste bare satellitter under { "15" }° (tap av lås <c31/>), og for å oppgi en HDOP himmelen ikke forklarer (fradraget for dårlig geometri blir <c32/>). Terskelverdiene er MODELLED: valgt, ikke tilpasset noen logg; ingenting her hevder hvor ofte naturlig forringelse og angrep kan skilles fra hverandre på virkelige data.

seg-8ddaf82ba00b = Angi hendelser og prediksjoner

seg-c52c285aa308 = For hver hendelse gir resultatet de falske alarmene mellom kalibrering og start, den første alarmen og monitorene bak den, latensen, utfallet (<c1/>, <c2/>, <c3/> eller <c4/>), og det observerte mediane C/N0-fallet mot prediksjonen (<c5/>, <c6/>, <c7/> eller <c8/>). Uenighet rapporteres, aldri justert bort: toleransene står i scenarioet, og scenarioet er i resultatets hash.

seg-3715df3fd8f7 = Hva dette ikke hevder

seg-21a4b903e179 = Tillitsmonitorene er MODELLED: terskelverdiene deres er inndata, og deteksjonsytelsen deres på virkelig interferens er det hendelsesscoringen måler, ikke noe denne typen hevder. På JammerTest { "2024" }-øktene med spoofing fanger monitorene på motorveien noen starttidspunkter innen { "10" } s og er sene på andre; se raden "Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM" i <a1><c1/></a1> for tallene. En prediksjon som stemmer med én logg, er ett datapunkt, ikke en validering.

seg-0c413c1a491c = <s1>Forrige</s1>Resilience-kryssreferanse

seg-63fc2b340fd1 = <s1>Neste</s1>Maritim tillit
