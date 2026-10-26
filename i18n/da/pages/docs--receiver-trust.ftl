# docs--receiver-trust: translations (da)

seg-adc34608c46b = Klasse

seg-2247a2344710 = Betydning

seg-fdbb9db68f1d = ingen

seg-f63dd3d7aad4 = Kilde

seg-98151954f217 = false

seg-c353e7bec219 = Nøgle

seg-cc38b40eb7a5 = Monitor

seg-7670cf4ceda3 = Standard

seg-a0cc45088f5f = GSV

seg-26ab8544afba = Tillidsscore over én syntetisk passage, fra en virkelig kørsel af motoren v{ $version } på examples/maritime-trust (en opdigtet NMEA-log fra en færge på en rute fra Tallinn til Helsinki, { "3001" } epoker ved { "1" } Hz). Tre baner deler én tidsakse. Øverst: afstanden mellem den position, modtageren rapporterer, og fartøjets virkelige position, som holder sig inden for nogle få meter indtil omkring { "1576" } s, hvor logens indskrevne bortledning af positionen trækker den væk, mens modtageren bliver ved med at rapportere en gyldig positionsbestemmelse. I midten: tillidsscoren fra { "0" } til { "100" }, ikke beregnet i de første { "300" } s af kalibreringen, i båndet nominal (mindst { "90" }) indtil bortledningen, derefter faldende gennem båndet degraded (mindst { "55" }) ned i båndet untrusted. Nederst: hver epokes bånd som et farvet bånd med sit navn. Scoren er vejledende. Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation. Loggen er opdigtet for at vise formatet og monitorerne; den er ikke en måling og siger intet om, hvordan nogen modtager ville yde.

seg-7000c522cc93 = Modtagerens eget spoofing-flag stillet over for Kshanas alarmer, fra en egentlig kørsel af motor v{ $version } på en opdigtet UBX-log ({ "200" } epoker ved { "1" } Hz). C/N0 falder { "20" } dB ved { "80" } til { "90" } s og { "120" } til { "130" } s; modtageren flager { "120" } til { "130" } s og { "160" } til { "165" } s. Af { "140" } epoker sammenlignet efter kalibrering havde { "11" } begge flaget, { "6" } kun modtageren, { "11" } kun Kshana og { "112" } ingen af dem. Ingen af siderne er en reference, og enighed er ikke validering. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsikkerhedstjeneste.

seg-caadaad98cf6 = Kilde: <c1/>

seg-4f10c2397fcc = Modtagertillid: vurdering af en virkelig GNSS-modtagerlog

seg-2596bdcdaf8e = <c1/> læser en log fra en virkelig global navigation satellite system-modtager (GNSS), kører tillidsmonitorer over den epoke for epoke og siger, hvornår og hvorfor modtagerens positionsbestemmelse holdt op med at være pålidelig. Den kan også score loggen mod hændelser og forudsigelser, du angiver <b>før</b> kørslen: om hver hændelse blev opdaget i tide, og om et modelleret fald i forholdet mellem bærebølge og støjtæthed (C/N0) stemmer med det, modtageren målte.

seg-63f24d5f2d5e = Observablerne er modtagerens egne; monitorerne og deres tærskler er motorens og dine. Hvert resultat bærer det mærke, loggens SHA-256 og hver tærskel, det kørte med, så en kørsel kan gentages og revideres.

seg-6f5014b93fbc = For et fartøj under sejlads, med en levende score og en valgfri gate foran et kortsystem, se <a1><c1/></a1>.

seg-82cdabb6086f = Dette skriver <c1/>, <c2/> (én række pr. epoke) og <c3/> (middel-C/N0 over tid med tillidstilstanden nedenunder) ved siden af scenariet og udskriver en afgørelse på én linje. Eksempellogen er syntetisk, lavet for at vise formatet; peg <c4/> på din egen modtagers log.

seg-ec2be1ea73f5 = Figuren ovenfor er fartøjsdemoen fra <a1><c1/></a1>: en opdigtet log, en vejledende score.

seg-0f24c5cf4b9b = Det samme scenarie kan køres fra Python (<c1/>), fra WebAssembly-pakken (<c2/>, med loggen indlejret) og fra værktøjet <c3/> i Model Context Protocol-serveren (MCP).

seg-1f3cc12b6230 = Logs, den læser

seg-23fd4a5bf5dd = Hvad der læses

seg-2e1a655cf846 = u-blox binær

seg-cb31da7b7d88 = NAV-SAT C/N0, elevation og azimut pr. satellit, NAV-PVT position, MON-RF automatisk forstærkningsregulering (AGC) og jamming-indikatoren <c1/>, NAV-TIMEGPS uge og modtagerens egne flag: NAV-STATUS <c2/> og SEC-SIG (<c3/>, se <a1>RECEIVER-PROTOCOLS.md</a1>)

seg-cec582f4afa5 = RINEX { "3" } observationsfil

seg-57708a636148 = <c1/>-koder (C/N0) pr. satellit og signal; med en broadcast-navigationsfil (<c2/>) pseudoafstandene til motorens egen positionsbestemmelse

seg-176c2493782e = Android GnssLogger CSV

seg-d69b9dd6ebad = <c1/>-rækker: C/N0 og <c2/> pr. satellit; <c3/>-rækker: position

seg-d390120374a9 = NMEA { "0183" }-tekst

seg-9eb885aa79af = GSV signal-til-støj pr. satellit (dB-Hz, med eller uden signal-ID'et { "4.10" }) og dens elevation og azimut, GSA dilution of precision og anvendte satellitter, GGA og RMC tid og position

seg-7864926ce37e = Septentrio binær ({ "0.38" }, kun læsning)

seg-44675c4bdf40 = PVTGeodetic position, MeasEpoch C/N0 pr. satellit og signal, RFStatus antal bånd; se <a1>RECEIVER-PROTOCOLS.md</a1>

seg-a5367d75c5ee = RTKLIB-løsningsfil (<c1/>)

seg-37d28ca5ed00 = tid, position (bredde/længde eller ECEF, omregnet) og anvendte satellitter pr. epoke; filer med grader-minutter-sekunder afvises med en meddelelse

seg-5e10ecb93f96 = NovAtel OEM7 ASCII- eller binære logs

seg-a630fbcf7425 = <c1/> position (kun beregnet løsning), <c2/> C/No pr. satellit og signal; <c3/>-flag for jammere bliver epokens <c4/> (jammingtilstand { "2" }, når modtageren flager en jammer, { "1" }, når den ikke gør; der findes intet spoofingflag i RXSTATUS), stillet over for Kshanas alarmer af sammenligningen <c5/>

seg-d4735b581cbf = GNSS-SDR Monitor- og PVT-monitor-strømme som JSON-linjer

seg-053235d67fb3 = C/N0 pr. kanal, positionsbestemmelse, anvendte satellitter, HDOP, azimut og elevation; lavet af <c1/>

seg-2e9033aa4e9d = Detaljer, kilder og begrænsninger for disse tre: <a1><c1/></a1>.

seg-8987b2c46eb0 = Hver epoke, læserne producerer, bærer også <c1/>, <c2/>-byteoffsets i inputtet: det mindste sammenhængende interval, der rummer de poster, der bidrog til den, så den præcise rå udsnit kan hashes for et hændelsesvindue. NMEA: hver linje, der læses, mens epoken er aktuel (en overmængde, hvor en urelateret linje står mellem dens sætninger). UBX: epokens rammer. RINEX { "3" }: epokeposterne fra hver <c3/>-linje til den næste. Android: epokens <c4/>-rækker (en <c5/>-række kun for en epoke uden <c6/>-rækker). Fraværende for en levende strøm og overalt, hvor det ikke er veldefineret (RINEX { "2" }).

seg-cea9532b57a2 = Filen angives med <c1/> (opløst mod scenariets egen mappe) eller indlejret som <c2/> eller <c3/> (de eneste valg i en browser).

seg-3bc4f9c91950 = En IMU-log som anden sensor

seg-49b10ad5928e = <c1/> tilføjer en inertiallog på det samme ur:

seg-9e0560b09f5a = Gyrodrejningshastigheden integreres fra <c1/> og udfylder kursen, hvor modtagerloggen ingen har, så monitoren <c2/> (som kræver <c3/> på platformen) sammenligner gyrokurs med kurs over grunden. En gyro driver: kursen er kun så god som integrationsvinduet, og <c4/> afgør, hvad der tæller som uenighed. Layoutet <c5/> er dokumenteret i <c6/>. IMU-bytes indgår i scenariehashen og i en bevispakkes scenariehash. Indlejret (<c7/>/<c8/>) virker på alle overflader; en <c9/> afvises, hvor filer ikke læses.

seg-fd3e6ef1cd93 = Platform: statisk eller fartøj

seg-b67c0d57dc1d = Monitorerne ovenfor antager en fast antenne. Et scenarie angiver platformen før kørslen i en <c1/>-tabel på øverste niveau; uden en er platformen <c2/>, og intet ændres.

seg-3d6bc18bd83e = Hvorfor den værdi

seg-32f339f63acf = Over driftshastigheden for handelsskibe og de fleste passagerfartøjer, så et virkeligt fartøj aldrig når den; langt under den hastighed, et position-drag-off indebærer. Et langsommere fartøj bør angive en lavere grænse: jo lavere grænse, jo tidligere fanges en drag.

seg-9506e8601857 = Et stort skib ændrer hastighed med langt under { "0.1" } m/s²; et lille hurtigt fartøj når nogle få tiendedele ved et hårdt gasskift.

seg-b0b6baaee456 = Et stort skib drejer med langt under { "1" } deg/s og et lille fartøj i et hårdt sving med nogle få.

seg-53d0fffb3c09 = En egenskab ved installationen; et gæt ville være en skjult tærskel.

seg-ac48403443f9 = Hvis <c1/> er erklæret og mangler i loggen, er det en fejl, så en manglende sensor ikke kan passere som en ren kontrol.

seg-8266739dc26b = Fartøjsnøglerne afvises under <c1/>. For et fartøj kører monitoren <c2/> ikke, fordi den måler afstanden fra kalibreringsmiddelværdien, hvilket er forkert på en antenne i bevægelse; resultatets <c3/> registrerer platformen og de grænser, der blev brugt.

seg-7551792a0cb4 = De syntetiske NMEA-strømme fra <a1><c1/></a1>, lavet til besætningstræning, accepteres af NMEA-læseren og kan køres gennem denne type som enhver NMEA-log.

seg-18d7538bc56d = Monitorer

seg-e5c1cb89f0b3 = Hver monitor har brug for sine data; en monitor, hvis data ikke findes i loggen, kører ikke og opføres ikke i <c1/>. De første <c2/> sekunder (standard { "60" }) fastlægger baseline og udløser aldrig alarm.

seg-3be9ee05f087 = Alarmerer, når

seg-98ead58c671d = Kræver

seg-f6e6df453260 = middel-C/N0 over de satellitter, der er fælles med baseline, falder med <c1/> eller mere (standard { "6" } dB)

seg-d9bf6efc6835 = sporede satellitter falder <c1/> eller mere under medianen for baseline (standard { "4" })

seg-60c7a99f9819 = AGC-aflæsningen afviger fra sin baseline med mere end <c1/> standardafvigelser (standard { "5" })

seg-7c1c65e64418 = UBX MON-RF eller Android <c1/>

seg-a5a5252417cb = u-blox <c1/> overstiger <c2/> (standard { "80" } af { "255" })

seg-8bca191bf4c4 = UBX MON-RF

seg-0ac4898d81cf = modtagerens egen positionsbestemmelse ligger mere end <c1/> fra dens kalibreringsmiddelværdi (standard { "50" } m)

seg-6a3fec1214b9 = en rapporteret position

seg-4c05faf783eb = paritets-RAIM (receiver autonomous integrity monitoring) på motorens egen enkeltpunktspositionsbestemmelse afviser målingssættet

seg-037ab193613c = RINEX-log med <c1/>

seg-8890a4ebf231 = motorens enkeltpunktspositionsbestemmelse mislykkes med fem eller flere satellitter

seg-0a5a708ac75b = modtagerens ur afviger fra sin forudsagte linje med mere end den mindste påviselige forskydning for dets kalibreringsstøj

seg-31b64b635261 = Kalibreret profil (tilvalg).

seg-a73f2c2dfc9a = <c1/> erstatter de tre interferenstærskler med værdier, der er kalibreret på det offentlige JammerTest { "2024" }-datasæt (én u-blox ZED-F9P pr. scenarie; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. Kalibreringen blev præregistreret (<c5/>), og profilen er MODELLED, tilpasset én offentlig kampagne: dens tærskel <c6/> <b>nåede ikke</b> den præregistrerede tærskel for falske alarmer i det tilbageholdte datasæt ({ "0.0231" } mod { "0.02" }); tærsklerne for AGC og jamming-indikator og unionstærsklen (falske alarmer { "0.033" }, detektion { "0.81" }) blev nået (<c7/>). Den gælder for den modtagertype ved den hændelse, mod planlagte angrebsslots, og blev kalibreret på datasættets CSV-logs (dets UBX-logs giver flere falske alarmer i to mapper). Et resultat, der er kørt med profilen, gentager de tærskler, det anvendte, og bærer en <c8/>, der siger alt dette. Uden profilen gælder standardværdierne ovenfor, og alt output er uændret.

seg-1fa8c4bd1a18 = For en <c1/>-platform kører monitorerne for platforme i bevægelse også (tærskler i en <c2/>-tabel på øverste niveau, hver standardværdi dokumenteret i <c3/>); hver har brug for sine data og opføres i <c4/> kun, når den har afgjort noget:

seg-4b2840d9d0af = positionsændring er uenig med den rapporterede fart og kurs, eller indebærer en fart, acceleration eller drejehastighed over fartøjets grænser

seg-656c19cb5b52 = positioner; fart og kurs (RMC eller VTG) til dead reckoning-delen

seg-cedefd52998d = gyrokurs og kurs over grunden afviger med mere end <c1/> (fart over <c2/>)

seg-c66704cbdd02 = HDT-, THS- eller VHW-kurs, <c1/>

seg-1bbbf0033234 = fart gennem vandet og fart over grunden afviger med mere end <c1/>

seg-c9101740b235 = VHW eller VBW og fart over grunden

seg-42ac59072099 = GGA-højden afviger fra <c1/> med mere end <c2/>

seg-811ec460249c = GGA-højde, <c1/>

seg-854ea9c26df4 = spredningen af C/N0 på tværs af satellitter falder til <c1/> af dens kalibreringsmedian

seg-837fc4cb832c = C/N0 for de fælles satellitter steg i gennemsnit med <c1/>, og <c2/> af dem steg

seg-faae07674361 = tiderne for på hinanden følgende epoker springer uregelmæssigt, løber baglæns eller forlader værtens ur

seg-f799a53897ed = NMEA-tid; værtens ur for den sidste del

seg-ee4913c9f2ed = modtageren rapporterer en fejl i OSNMA-autentificering (en rapporteret status læses; intet verificeres; for at verificere OSNMA ud fra selve I/NAV-siderne se <a1>docs/OSNMA.md</a1>)

seg-3fad5fcde4dc = <c1/>-statussætning

seg-ce072f2ebb6c = En epoke er <b>ikke betroet</b>, når RAIM, urmonitoren, en mislykket løsning eller et positionsspring alarmerer, eller faldet i C/N0 når det dobbelte af sin tærskel; <b>degraderet</b> ved enhver anden alarm; og ellers <b>nominel</b>.

seg-4124ff6013a0 = Motorstien (<c1/>, <c2/>, <c3/>) er den samme beregning som den uafhængige reference for spoofing i JammerTest { "2024" } i <c4/>: <c5/> kontrollerer, at den første alarm på alle otte offentliggjorte starttidspunkter falder på samme epoke og er af samme art.

seg-83be3c22a577 = Tillidsscore (fartøjsplatform)

seg-812991f245cd = For et fartøj får hver epoke efter kalibrering også en score fra { "0" } til { "100" } og de grunde, til at den ikke er { "100" }. Afbildningen er deterministisk og fastlagt, før nogen log scores: ingen læring, intet tilpasset til hændelser. Hver monitor reducerer sin evidens til et forhold <c1/> (en alarm ved { "1" } eller mere); et forhold koster scoren

seg-ada5a0a52315 = så en monitor koster intet, mens den er under <c1/> af sin tærskel (standard { "0.5" }), halvdelen af sin vægt ved sin tærskel og hele vægten ved <c2/> gange tærsklen (standard { "1.5" }); scoren er ikke-voksende i hver statistik. En kilde, der ikke rapporterer ved en epoke, beholder sin sidste statistik i <c3/> (standard { "10" } s: to cyklusser af en C/N0-sætning, der sendes hvert { "5" } s), både som alarm og som fradrag.

seg-6c06de24ebfe = Afrundingen er halv op (<c1/>), båndet er det for den afrundede score, og begrænsningen kommer før afrundingen. Kun monitorer, hvis point er over nul, opføres i fradragene, med deres forhold og uafrundede point, største point først; fradrag med lige mange point opføres i rækkefølgen af monitornavnene <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. En monitor, hvis test er bestået eller ikke bestået (en mislykket løsning, en mislykket autentificering), får forholdet { "1.5" }, den fulde vægt. De opførte point er dem før begrænsningen ved { "0" }.

seg-e36961d46c41 = Vægt (point)

seg-673f6adcd681 = Hvorfor

seg-399be3301faf = en mislykket autentificering er en erklæring, ikke en statistik

seg-69cfc61477d6 = en forfalsket position skal modsige fysikken eller modtagerens egne kontroller, og tiden kan ikke løbe baglæns; én overtrædelse med fuld styrke ({ "1.5" } gange sin tærskel: { "60" } point, score { "40" }) er ikke betroet, og ved sin tærskel ({ "30" } point, score { "70" }) degraderet

seg-7fa1e6e67411 = én uafhængig sensor, der er uenig, er degraderet; to med fuld styrke er ikke betroet

seg-4c4825d2957a = signalmiljøet eller en kontrol med svag informationsværdi

seg-b5a364a03714 = miljøet er fjendtligt; det alene viser ikke, at positionsbestemmelsen er forkert

seg-4e3749965405 = op til { "15" }, <c1/>

seg-1e595dbcf96f = ikke en vægt på denne rampe: intet, medmindre himlen er dårlig, derefter op til <c1/> ({ "15" }); geometri alene når degraderet, aldrig ikke betroet, og udløser ingen alarm (se "Geometri" nedenfor)

seg-9902ca062070 = Båndgrænserne følger af vægtene: den letteste monitor, der alarmerer, koster { "12.5" } point ved sin tærskel, så enhver alarm forlader det nominelle bånd; ingen enkelt monitor under { "60" } point kan nå det ikke betroede bånd alene (flere sammen kan). Resultatet registrerer scoremodellen (<c1/>), og hver epoke bærer <c2/>: hvilke monitorer der trak fra, deres forhold og deres point. For et fartøj er epokens tilstand scorens bånd.

seg-6f620668ee85 = Geometri: naturlig forringelse adskilt fra angrebslignende inkonsistens

seg-93257d87e0d4 = En modtager ved siden af en kajkran, i en sluse eller under et højt skrog mister satellitter, og dens positionsbestemmelse bliver dårligere af en grund, der ikke er et angreb. Fra { "0.36" }, efter designnoten om geometri (<c1/>, afsnit { "4" }), bærer hver epoke sin <b>satellitgeometri</b>, et fartøjs score har en <b>geometrimonitor</b>, og hvert fradrag bærer en <b>klasse</b>: <c2/> (himlen), <c3/> (signalmiljøet) eller <c4/> (angrebslignende evidens).

seg-17d13c39b5aa = <b>Hvor geometrien kommer fra.</b> Elevationen og azimutten for hver sporet satellit (NMEA GSV, UBX NAV-SAT), hvoraf dilution of precision (DOP) udledes med motorens ene DOP-kerne (<c1/>, VALIDATED mod gnss_lib_py): <c2/>. Hvis det ikke er muligt, den DOP og de anvendte satellitter, modtageren selv angiver (NMEA GSA): <c3/>. Himmelpositioner og GSA tæller for scorens <c4/> (standard { "10" } s), fordi mange busser sender GSV hvert få sekunder; et GSV-sæt, der er ufuldstændigt i en epoke (slutningen af et uddrag, en tabt sætning), bruges ikke. En log med ingen af delene, såsom NMEA med kun GGA og RMC, eller Android- og RINEX-logs i dag, får status <b><c5/></b> med noten "geometry unknown": motoren gætter ikke på en geometri, den ikke har fået, og geometrimonitoren kører ikke.

seg-a267da42ac3d = nok satellitter og DOP inden for tærsklerne

seg-dabcd392914a = en eller flere grunde: <c1/>, <c2/>, <c3/> og (kun til information, ikke i scoren) <c4/>, når hver sporet satellit ligger i den ene halvdel af horisonten

seg-c255a66d3813 = loggen giver ingen satellitgeometri for denne epoke

seg-0a50145c2bfa = Status er beskrivende, og mærket (nedenfor) er det, der tæller for scoren: <c1/> omfatter det informative tilfælde <c2/>, som kan optræde med god eller rimelig DOP, og kun et <c3/>-mærke scores.

seg-93e49a562493 = <b>Mærket</b> (altid rapporteret, aldrig scoret). Hver epokes <c1/> er <c2/> (HDOP højst <c3/> { "2" }, PDOP højst <c4/> { "3" } og mindst <c5/> { "6" } satellitter), <c6/> (HDOP over <c7/> { "4" }, PDOP over <c8/> { "6" } eller færre end <c9/> { "5" } satellitter), <c10/> imellem de to, eller <c11/>. Epokens note åbner altid med mærket og tallene, for eksempel "geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)", og tilføjer ", signal loss", når det gælder.

seg-13838e036fae = <b>Geometrimonitoren</b> (fartøjsscore). Den trækker <b>intet fra, medmindre geometrien er dårlig</b>: dens forhold er <c1/>, og så længe det højst er { "1" } (god eller rimelig geometri, herunder en åben himmel med kun GPS og { "8" } satellitter), koster den intet, så en sådan log scorer præcis som i { "0.35" }. Over { "1" } stiger fradraget lineært til <c2/> ({ "15" }) ved <c3/> ({ "1.5" } gange tærsklerne: HDOP { "6" }, PDOP { "9" }, { "3" } satellitter): { "7.5" } point ved forholdet { "1.25" } (HDOP { "5" }, eller { "4" } satellitter), { "15" } fra { "1.5" } og opefter (score { "85" }, degraderet). Alene kan den aldrig tage scoren under <c4/> (standard: scorens <c5/>, { "55" }), så geometri alene når højst det degraderede bånd og aldrig det ikke betroede: den gældende begrænsning er <c6/>, så en <c7/>-tabel, der hæver <c8/> (for eksempel en fra { "0.35" } med <c9/> { "90" }), sænker begrænsningen til <c10/> i stedet for at blive afvist, og en <c11/> sat under <c12/> afvises. Monitoren udløser ingen alarm; den opføres sidst i <c13/>, når den har afgjort noget ved en epoke (et fartøj, hvis log giver geometrien), og tælles ikke med i identiteten med { "0.35" }; den er ikke en post i <c14/> (at sætte en afvises), og begrænsningen og gulvet, der gælder, registreres i <c15/> og <c16/>. En dårlig epokes note siger hvorfor, for eksempel "geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency".

seg-2082f4ccb250 = <b>Klasser.</b> Hvert fradrag (<c1/>):

seg-4197bc517f73 = <c1/> (dårlig geometri); <c2/>, når hver satellit, der blev mistet i forhold til kalibreringens baseline, lå under <c3/> ved sin sidste rapport

seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, ellers <c6/>; <c7/> under signaltab (nedenfor)

seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; og <c11/>, når geometrien er dårlig, og den angivne HDOP er uenig med den angivne himmel (nedenfor)

seg-1b5e88a4aae4 = <b>Værn mod en forfalsket dårlig himmel.</b> En spoofer kunne sende en tynd GSV eller rapportere en høj HDOP for at købe tolerance. Motoren mærker og tilgiver ikke: ingen anden kontrol udvides af en dårlig geometri, og den HDOP, modtageren angiver (GSA inden for holdet, ellers GGA), sammenlignes med den HDOP, der udledes af den himmel, den angiver. Når de afviger med mere end <c1/> ({ "1.0" } eller { "25" } % af den udledte HDOP, alt efter hvad der er størst), bærer epoken <c2/>, og når geometrien er dårlig, klassificeres dens fradrag som <c3/>. Ved god eller rimelig geometri rapporteres uenigheden og scores ikke: intet trækkes fra, medmindre geometrien er dårlig. Det er et bevidst valg ({ "0.36" }): "nul, medmindre dårlig" gælder for hver epoke, så god og rimelig geometri scorer præcis som i { "0.35" }, og en forfalsket HDOP er aldrig tavs. Flaget (<c4/>) står på hver epoke i resultatet og hver levende linje, noten siger "…beyond the tolerance: reported, not scored (the geometry is not poor)" eller "…: the geometry deduction is classed an inconsistency", <c5/> tæller epokerne, og siden med sammenfatning af evidens viser antallet, også nul. De { "25" } % er et <b>REPRESENTATIVE</b> ingeniørmæssigt valg, ikke et målt eller standardiseret tal: en modtager, der løser for ét ur pr. konstellation eller med en delmængde af de satellitter, den sporer (en elevationsmaske, en afskæring i C/N0, en RAIM-udelukkelse), angiver en HDOP, der afviger fra enkeltur-HDOP for hver sporet satellit med et beløb, der vokser med HDOP, så en fast tolerance alene ville læse naturlig dårlig geometri som en inkonsistens. En større forskel læses stadig som en. Et fradrag klassificeret som <c6/> er en udtalelse om himlen, ikke en konstatering af, at intet angreb fandt sted.

seg-0e729ad96db9 = <b>Signaltab er ikke himlen.</b> Når satellitter, som modtageren opfører som i sigte (over <c1/>), ikke spores, udleder motoren også DOP for hver satellit i sigte. Hvis den DOP i sigte ligger inden for tærsklerne, og enten intet spores, eller de usporede satellitter er spredt rundt om horisonten (ikke samlet i den ene halvdel), var himlen der, og signalet var ikke: epoken bærer <c2/>, noten "satellites in view but not tracked: signal environment, not geometry", og geometrifradraget klassificeres som <c3/>. Usporede satellitter samlet i den ene halvdel af horisonten læses stadig som en blokeret himmel (en mur, en klippe, en kaj). En tosidet hindring (en kløft eller en smal fjord) læses som signaltab, indtil en horisontprofil er konfigureret. Modtagerens sentinelværdier for ingen positionsbestemmelse er ikke DOP: en angivet HDOP eller PDOP på { "99" } eller mere, GGA-kvalitet { "0" } og GSA-tilstand { "1" } giver ingen angivet DOP.

seg-0f218d21843b = <c1/>-nøgle

seg-e5ec84abd61b = valgt (designnote { "4.2" }): ved <c1/> { "1.5" } m er HDOP { "4" } en 2drms på { "12" } m, kinematikkontrollens <c2/>. IEC 61108-1 nævnes almindeligvis som angivende sine krav til nøjagtighed for HDOP ≤ { "4" } (eller PDOP ≤ { "6" }): erindret fra sekundær litteratur om GNSS-modtagere, ingen bestemt sekundær kilde konsulteret og standarden ikke læst; skal kontrolleres mod standardens tekst

seg-d99dc0fd090a = tærsklen for PDOP-tilgængelighed i <c1/>; GPS SPS Performance Standard, 5. udg. ({ "2020" }), PDOP ≤ { "6" }, som citeret i <c2/>; skal kontrolleres mod standardens tekst

seg-2fffa47378ec = én mere, end en positionsbestemmelse har brug for, så et enkelt tab ikke afslutter positionsbestemmelsen; det færreste med én redundant måling til RAIM

seg-7dc0baed2bc4 = et angivet input til 2drms-koblingen for <c1/>; sæt modtagerens eget tal

seg-7b5778d93d40 = { "1.0" } HDOP

seg-093cff5d1150 = valgt (designnote { "4.2" }): tolerancens absolutte del; en uenighed ud over tolerancen er ikke geometri

seg-be5c3aefd942 = REPRESENTATIVE ingeniørmæssigt valg: den relative del, for modtagere med ure pr. konstellation eller delmængdeløsninger

seg-e71c6876114b = designnote { "4.3" }: satellitter, der mistes under den, mistes til himlen; en horisontprofil ({ "0.36" } punkt { "1" }) vil udvide dette

seg-bebe291ca1c0 = geometrisk, kun til information: hver satellit i den ene halvdel af horisonten

seg-06519582227b = designnote { "4.2" }: geometri alene flytter scoren fra nominel til degraderet og aldrig til ikke betroet; trækkes kun fra, når geometrien er dårlig (grundlæggerens beslutning B1, { "0.36" })

seg-be21b5a31382 = scorens eget <c1/>: rampen når <c2/> ved { "1.5" } gange tærsklerne for dårlig

seg-e922a5342a3c = scorens <c1/> ({ "55" })

seg-09fe8c435ece = geometri alene når aldrig det ikke betroede bånd; den gældende begrænsning er <c1/>; et gulv under <c2/> afvises

seg-a07e6ce67371 = REPRESENTATIVE, kun mærket: halvdelen af <c1/> (forholdet for begyndelsen i scoren fra { "0.35" })

seg-06db7e7af59c = REPRESENTATIVE, kun mærket: halvdelen af <c1/>

seg-7e7f17d36ea4 = REPRESENTATIVE, kun mærket: én mere end <c1/>, så et enkelt tab stadig efterlader en redundant måling

seg-ef7a4c24e870 = <b>Hvad der ændrede sig i outputtet, og hvad der ikke gjorde.</b> Ingen score ændres, medmindre geometrien er dårlig; mærket rapporteres altid. Tilføjede nøgler: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> afrundet til { "0.001" }, <c9/> (null, indtil en horisontprofil er konfigureret), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satellitter opført over <c16/>), <c17/>, <c18/>), <c19/> på hvert fradrag og til sidst <c20/> (tærskler, hold, begrænsning og gulv i kraft, proveniens, klasseregler) og <c21/> (epoker efter status, efter mærke og efter fradragsklasse og de epoker, hvor den angivne HDOP er uenig); <c22/> er som i { "0.35" }. To tests binder dette til bytes i baseline "{ "0.36" } portable", når disse nøgler er fjernet (hashene fra { "0.35.0" }, rebaseret, da motoren gik over til portabel matematik, og bevaret i testene som registrering af, hvad { "0.35.0" } udgav: <c23/>). <c24/> binder hvert output fra begge eksempelsessioner (resultat-JSON, CSV, SVG, afgørelse, genafspillede levende linjer, <c25/>, Prometheus, CEF, LEEF). <c26/> binder batchresultatet, sammenfatningen, de levende linjer og <c27/> for hvert indlagt NMEA-korpus for fartøjer (demoen og de maritime referencefixtures, hver også som åben himmel med kun GPS og { "8" } satellitter, og træningsscenarierne for besætning, der genereres ud fra deres seeds); i de to træningsscenarier, hvor jamming gør geometrien dårlig, er hver epoke, der ikke er dårlig, identisk, og hver dårlig adskiller sig alene ved geometrifradraget. En log, hvis geometri er dårlig, mister op til { "15" } point, den ikke mistede i { "0.35" }; det er den tilsigtede ændring. På demoen læses drag-off som <c28/>; <c29/> redigerer loggen til at maskere den vestlige himmel (rimelig: mærket, ikke scoret), til at maskere den og to østlige satellitter (dårlig: geometrifradrag, tab af lås <c30/>, fordi høje satellitter også gik tabt), til kun at miste satellitter under { "15" }° (tab af lås <c31/>) og til at angive en HDOP, himlen ikke forklarer (fradraget for dårlig geometri bliver <c32/>). Tærsklerne er MODELLED: valgt, ikke tilpasset nogen log; intet her påstår, hvor ofte naturlig forringelse og angreb kan skelnes på virkelige data.

seg-8ddaf82ba00b = Angivelse af hændelser og forudsigelser

seg-c52c285aa308 = For hver hændelse giver resultatet de falske alarmer mellem kalibrering og start, den første alarm og dens monitorer, ventetiden, udfaldet (<c1/>, <c2/>, <c3/> eller <c4/>) og det observerede median-fald i C/N0 mod forudsigelsen (<c5/>, <c6/>, <c7/> eller <c8/>). Uenighed rapporteres, aldrig tunet væk: tolerancerne står i scenariet, og scenariet står i resultatets hash.

seg-3715df3fd8f7 = Hvad dette ikke påstår

seg-21a4b903e179 = Tillidsmonitorerne er MODELLED: deres tærskler er input, og deres detektionsevne på virkelig interferens er det, som scoringen af hændelser måler, ikke noget, denne type påstår. På JammerTest { "2024" }-sessionerne med spoofing fanger monitorerne i motorstien nogle starttidspunkter inden for { "10" } s og er sene på andre; se rækken "Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM" i <a1><c1/></a1> for tallene. En forudsigelse, der er enig med én log, er ét datapunkt, ikke en validering.

seg-0c413c1a491c = <s1>Forrige</s1>Krydsreference for robusthed

seg-63fc2b340fd1 = <s1>Næste</s1>Maritim tillid
