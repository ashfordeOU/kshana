# docs--maritime-trust: translations (nb)

seg-2247a2344710 = Betydning

seg-6940543aa3c0 = streng

seg-abec93a4a488 = streng eller null

seg-f5e7215e6835 = objekt

seg-b993ef559bd0 = Fra kode

seg-c353e7bec219 = Nøkkel

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> eller <c4/>

seg-2896f449bffb = Kilde: <c1/>

seg-342f34403ac5 = Maritim tillit: kan broen stole på denne posisjonsbestemmelsen?

seg-49b609a9655c = <c1/> kan, for et <b>fartøy i bevegelse</b>, score et løpende tillitstall fra 0 til 100 for hver posisjonsbestemmelse, ut fra det enhver mottaker allerede legger på bussen (NMEA { "0183" } først), og si hvilke kontroller som reduserte det. Det er et programvarelag som sitter ved siden av en mottaker. Det er ikke en mottaker, det erstatter ikke en, og det gjør ikke en posisjonsbestemmelse mer nøyaktig.

seg-3c66739c9250 = <b>Veiledende programvare.</b> Kshana er ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }) og er ikke vurdert mot noen ytelsesstandard. Scoren og gaten er hjelpemidler for navigatørens skjønn. Operatøren er fortsatt ansvarlig for fartøyets sikre navigasjon og for enhver beslutning om å stole på, eller slutte å stole på, en posisjonsbestemmelse.

seg-a9899ca66661 = Denne siden sier hva kontrollene ser på, hva hver av dem kan og ikke kan fange opp, hvordan den kjøres løpende og hva gaten gjør. Scoreavbildningen og hver standardverdi står i <a1><c1/></a1>.

seg-05e79b6c5a58 = Hva den leser

seg-e784fdbe26e6 = Et fartøy deklareres i sesjonsfilen, med sine grenser oppgitt før kjøringen:

seg-e8e9ee2965cf = Setning

seg-e127f2f26824 = Leses

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = posisjon, kvalitet på posisjonsbestemmelsen ({ "0" } = ingen posisjonsbestemmelse), høyde over middelhavnivå, geoideseparasjon, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = status (<c1/> gyldig, <c2/> ikke), fart og kurs over grunnen, dato, modus

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = fart og kurs over grunnen, der RMC ikke har noen

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = retning (THS bare når modusen ikke er <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = fart gjennom vannet (VBW bare når statusen er <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = tid

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = signalstyrke per satellitt (dB-Hz), elevasjon og asimut (for geometrien)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = presisjonsfortynning og brukte satellitter (for geometrien, der GSV ikke gir noen himmel; og den oppgitte HDOP som vakten sammenligner)

seg-305f423d3ead = en OSNMA-status en mottaker rapporterte, oversatt til denne setningen av adapteren som leser mottakeren: <c1/> autentisert, <c2/> mislyktes, <c3/> ingen resultat

seg-7ce1d69e710e = Epoker mottakeren selv sier ikke er en satellittbasert posisjonsbestemmelse (GGA-kvalitet { "0" }, eller { "6" } til { "8" }: estimert, manuell, simulator; RMC-status <c1/>, eller modus <c2/>, <c3/>, <c4/>, <c5/>) brukes ikke i posisjonskontrollene og utgjør ikke noe belegg i noen retning: mottakeren har allerede sagt det.

seg-a0ae80781c6e = De første <c1/> sekundene danner grunnlinjen og scores aldri. Hver monitor ser bare på den nåværende og tidligere epoker, så en beslutning i en epoke endres ikke når senere data kommer, og en løpende strøm gir samme score som den samme teksten lest som en fil.

seg-068593ad0a52 = Hva hver kontroll fanger opp, og hva den ikke kan

seg-094b90f0c701 = Retninger mellom posisjonsbestemmelser (sporkursen brukt av svingrate-kontrollen, kursen to posisjoner innebærer) er retningen til korden mellom dem, som er geodetens <b>middelasimut</b> mellom posisjonsbestemmelsene, ikke fremoverasimuten ved den første; de to avviker med omtrent halve meridiankonvergensen mellom posisjonsbestemmelsene ({ "0.001" } grader for en grunnlinje på { "260" } m ved { "59.5" } graders breddegrad).

seg-ed3cdfcfbff5 = En forfalsket posisjon må stemme med et skips fysikk og med skipets andre sensorer. Hver kontroll sammenligner posisjonsbestemmelsen med én av dem. En kontroll er bare så uavhengig som den andre kilden: en retning fra et GNSS-kompass, eller en «fart gjennom vannet» utledet fra GNSS, er ikke uavhengig av mottakeren under test og tilfører ingenting.

seg-9480aabf136e = Kontroll

seg-20e4f746c7e1 = Fanger opp

seg-e7b2ebe5eabc = Kan ikke

seg-21ad9895f606 = et posisjonshopp; et spor der bevegelsen ikke forklares av rapportert fart og kurs; en utledet fart, akselerasjon eller svingrate over de oppgitte grensene for fartøyet

seg-dcbc6d4cd17f = et bortdrag der rapportert fart og kurs følger det falske sporet og holder seg innenfor grensene (mottakeren utleder dem fra sin egen løsning, så de stemmer overens); en fartsgrense som er oppgitt for høy

seg-3542f83a7988 = et spor som avviker fra fartøyets baugretning med mer enn den oppgitte krabbevinkelen

seg-75f4d659f716 = et bortdrag langs kursen (kursen endres ikke); en retning fra samme mottaker eller et GNSS-kompass; en sidedrift over toleransen (falsk alarm); farter under <c1/>

seg-09dde82be447 = et bortdrag som endrer fart over grunnen i forhold til fart gjennom vannet

seg-6ac740e5f51c = en logg som er utledet fra GNSS; en strøm over det tillatte (falsk alarm); et bortdrag som er langsommere enn det tillatte

seg-e85d5f0933b7 = en høyde som ikke ligger der havoverflaten og den oppgitte antennehøyden tilsier

seg-3806e1d46332 = en spoofer som holder høyden plausibel; toleransen er vid fordi den vertikale feilen for en frittstående mottaker er stor; geoideseparasjonen registreres, men kontrolleres ikke, fordi motoren ikke har noen geoidemodell

seg-5b70bd80640e = signaturen til én enkelt sender: C/N0 på tvers av satellittene som faller sammen, eller stiger sammen, i forhold til grunnlinjen fra kalibreringen

seg-e6874a8047b1 = en spoofer som former effekten per satellitt; alt mens selve grunnlinjen er utsatt for spoofing; en GSV-takt som er for langsom til å følge med

seg-371b17ce936a = at mottakerens tid hopper uregelmessig eller går bakover; i forhold til denne datamaskinens klokke, at mottakerens tid driver bort fra den (bare sanntidsstrømmer)

seg-026479cb7966 = en falsk tid som er konsistent og jevn; en klokke som er feil fra begynnelsen

seg-906ab911b73d = en rapportert OSNMA-autentiseringsfeil

seg-a04757b7ae57 = statusen leses, den verifiseres ikke; en spoofer som undertrykker rapporten blir ikke oppdaget

seg-c36c24a337b8 = effekttap og tap av satellitter, som i det statiske tilfellet

seg-940b39a3988a = de sier at omgivelsene er fiendtlige, ikke at posisjonsbestemmelsen er feil

seg-9d751e1f5938 = <b>Hva rene NMEA-monitorer ikke kan gjøre.</b> En spoofer som gjenskaper hele konstellasjonen med en selvkonsistent posisjon, hastighet, kurs som stemmer med retningen, plausibel effekt per satellitt og en tilsvarende klokke er usynlig for alle kontrollene ovenfor: ingenting i setningene skiller posisjonsbestemmelsen fra en ekte. Det samme gjelder en avspilling av innspilte ekte signaler. Autentisering (OSNMA, eller en mottaker med egen beskyttelse mot spoofing) og uavhengige navigasjonssensorer er det som tetter dette hullet; dette laget kan bare bruke den statusen de rapporterer. En strøm som allerede utsettes for spoofing mens grunnlinjen dannes, har ingen ren grunnlinje. At det ikke kommer noen alarm, er ikke belegg for en god posisjonsbestemmelse.

seg-e3e09e2412fb = Tillitsscore

seg-a1c05079de2f = Hver epoke etter kalibreringen får en score fra { "0" } til { "100" } og årsakene til at den ikke er { "100" }: hvilke kontroller som trakk fra, statistikken deres mot terskelen og poengene deres. Båndene (grensene oppgis i økten): <c1/> ved { "90" } eller over, <c2/> ved { "55" } eller over, <c3/> under det. Tilordningen, hver vekt og begrunnelsen for den står i <a1><c4/></a1>; den er deterministisk og fastsatt før en logg scores, uten læring og uten noe som er tilpasset hendelser.

seg-d56822e82e3d = Alle fartøyutdata har den veiledende erklæringen: nøkkelen <c1/> i resultat-JSON og i hver live-linje, en første kommentarlinje <c2/> i CSV (lesere hopper over den med kommentarvalget sitt), <c3/> og en bunntekst i SVG. Utdata fra en batchkjøring: <c4/> (med scoremodellen og fradragene for hver epoke), <c5/> (med kolonnene <c6/> og <c7/>) og <c8/>, som for et fartøy er sporet som mottakeren rapporterer, farget etter tillitsbånd, over scoren over tid.

seg-918516588036 = En syntetisk demo

seg-e6717d346ca6 = <c1/> inneholder en oppdiktet NMEA-logg fra en ferje på ruten Tallinn til Helsinki (et utdrag på 50 minutter, omtrent { "17" } kn, { "1" } Hz: GGA, RMC, VTG, en gyrokurs, en fartslogg, GSV med en plausibel himmel) der et posisjonsbortdrag trekker den <em>rapporterte</em> posisjonen bort fra fartøyets virkelige posisjon fra { "1500" } s. Mottakeren rapporterer hele tiden en <b>gyldig</b> posisjonsbestemmelse; det er tillitsscoren som faller, gjennom det degraderte båndet og ned i det upålitelige. <c2/> oppgir hver terskel, fartøyets grenser og hver scorevekt før kjøringen.

seg-b2f24e5091d0 = Loggen er <b>tekst skrevet til en fil</b> av <c1/>: den modellerer ikke noe radiosignal og sender ingenting. Den er ikke en måling, og ruten er illustrativ, ikke et sjøkart. <c2/> fester loggen og forventet utdata som regresjonsvern på de syntetiske dataene; de sier ingenting om hvordan en monitor klarer seg mot ekte interferens.

seg-26ab8544afba = Tillitsscore over én syntetisk overfart, fra en reell kjøring av motoren v{ $version } på examples/maritime-trust (en oppdiktet NMEA-logg fra en ferje på ruten Tallinn til Helsinki, { "3001" } epoker ved { "1" } Hz). Tre felt deler én tidsakse. Øverst: avstanden mellom posisjonen mottakeren rapporterer og fartøyets virkelige posisjon, som holder seg innenfor noen få meter til omtrent { "1576" } s, da loggens innskrevne posisjonsbortdrag trekker den bort, mens mottakeren hele tiden rapporterer en gyldig posisjonsbestemmelse. I midten: tillitsscoren fra { "0" } til { "100" }, ikke beregnet de første { "300" } s av kalibreringen, i det nominelle båndet (minst { "90" }) fram til bortdraget, deretter fallende gjennom det degraderte båndet (minst { "55" }) og ned i det upålitelige båndet. Nederst: båndet for hver epoke som et farget bånd med navnet sitt. Scoren er veiledende. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon. Loggen er oppdiktet for å vise formatet og monitorene; den er ikke en måling og sier ingenting om hvordan en mottaker ville prestert.

seg-ed183c325c7e = Figuren er tegnet av <c1/> fra en reell kjøring av denne demoen (<c2/>); scoren er veiledende, og loggen er oppdiktet.

seg-8badaf0d8586 = Spesifikasjon av Studio-visningen

seg-588092535a89 = For den som bygger Studio-visningen av en fartøykjøring. Ingenting i denne delen er implementert i Studio ennå; motorsiden (dataene nedenfor) er det.

seg-5c34f31acf1d = <b>Inndata.</b> Én av disse:

seg-57ca6d9000b1 = resultat-JSON fra en batchkjøring (<c1/>, eller det samme gjennom <c2/> i WebAssembly-pakken med loggen innebygd): <c3/> (båndgrenser, rampe, bevishold, hver vekt), <c4/>, <c5/> og <c6/>, hver med <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, og fra { "0.36" } <c12/> og <c13/> for hvert fradrag, med <c14/> og <c15/> på toppnivå; eller

seg-bfab64386b6c = live-JSON-linjene (skjemaet ovenfor), ett objekt per epoke, lagt til mens strømmen går. Hver linje har mottakerens rapporterte <c1/> (skjema { "1.1" }).

seg-f7c7462d315e = Demosettet er <c1/>: <c2/>, <c3/> (loggen) og <c4/> (<c5/>: hvor fartøyet virkelig var, noe ingen ekte logg har). En visning bør kjøre økten og lese referansefilen ved siden av.

seg-c015c26cf30a = Hva som skal tegnes.

seg-92f452bdbed6 = <em>Spor</em>, nord opp, én skala på begge aksene: posisjonene som mottakeren rapporterer, som en linje farget etter epokens bånd (grå kalibrerer, grønn nominell, gul degradert, rød upålitelig), med start og slutt markert og en målestokk. For demoen: det sanne sporet som en tynn nøytral linje under, slik at bortdraget vises som at de to skilles; en bryter for det sanne sporet og en avlesning av forskyvningen i meter ved markørens tidspunkt.

seg-3ba328e2188c = <em>Scoretidslinje</em>: scoren fra { "0" } til { "100" } mot tid, båndgrensene (<c1/>, <c2/> fra <c3/>) som stiplede linjer, båndet som en stripe under, og starten på en oppgitt hendelse som en markør. Tidsaksen deles med sporet.

seg-33447da1d56d = <em>Årsaker</em>: for epoken under markøren, fradragene (monitor, forhold mot terskel, poeng) som horisontale stolper, de største først, med vekten hver monitor har fra <c1/>; monitorer som kjørte og ikke kostet noe vises svakt, monitorer som ikke kjørte (ikke i <c2/>) vises som «ikke kjørt», aldri som bestått. Monitoren <c3/> har ingen oppføring i <c4/>: taket for den er <c5/>.

seg-d0379b68ea67 = <em>Monitorstriper</em>: én tynn stripe per monitor i <c1/> som viser forholdet over tid (alarm ved { "1" }), slik at leseren ser hvilken kontroll som slo ut først.

seg-83d881ce6ab0 = <em>Gate-tilstand</em>: i en live-visning, <c1/> for hver epoke (<c2/>, <c3/>, <c4/>) som en stripe under båndstripen, og den siste <c5/>. I en batchvisning er epokene som en gate ville ha holdt tilbake, de der båndet er upålitelig, med frigivelsesholdet anvendt.

seg-b96652af3a03 = <em>Geometrifelt</em> ({ "0.36" }): en stripe under båndstripen farget etter <c1/> (grønn god, gul degradert, grå skravert ukjent), i en fargefamilie som er atskilt fra feltene for inkonsistens og miljø, med forklaringen «geometri: himmelen, ikke signalet». Fradrag farget etter <c2/> (geometri, miljø, inkonsistens) i årsakspanelet og monitorstripene, og antall epoker per klasse fra <c3/> ved siden av antallet per bånd. For epoken under markøren: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> og et flagg når <c8/> er satt (geometrifradraget er da en inkonsistens). <c9/> vises som «geometri ukjent: ingen GSV eller GSA i loggen», aldri som god. Grensene i <c10/> og opprinnelsen deres fra <c11/> står ved siden av scoreinnstillingene. Den veiledende merknaden blir stående.

seg-c48906d03f90 = <em>Posisjonsbestemmelse rapportert av mottakeren</em>: demoens mottaker rapporterer en gyldig posisjonsbestemmelse hele tiden (GGA-kvalitet { "1" }, RMC-status A); si det i forklaringen, for det er poenget med visningen.

seg-869c8a92e2cf = <b>Interaksjoner.</b> Én tidsmarkør som deles av alle paneler (dra, piltaster og en avspillingsknapp som spiller av med 1x til 60x); å holde over sporet eller en stripe flytter den. Et klikk på et fradrag framhever epokene der den monitoren lå over utløsningsgrensen sin. Et båndfilter (vis bare degraderte og upålitelige epoker) og et hopp til det første fradraget og til den første upålitelige epoken. Hjelpetekst ved hvert monitornavn med enlinjebeskrivelsen fra denne siden. Øktens terskler og vekter vises skrivebeskyttet ved siden av diagrammet, slik at det som scoren brukte, er på skjermen.

seg-1f97fe8ea2f1 = <b>Ordlyd som skal beholdes.</b> Siden må si at den er veiledende programvare og ikke typegodkjent navigasjonsutstyr, at demoen er syntetisk tekst med et oppdiktet bortdrag, og at en posisjonsbestemmelse uten alarm ikke dermed er en god posisjonsbestemmelse (se grensene ovenfor). Ingen figur på siden skal kunne leses som et mål på hvor godt kontrollene fungerer mot ekte interferens.

seg-079ce44fd53e = For kallere som har økten og bytene i minnet (ingen filer, ingen klokke, ingen sockets; trygt for WebAssembly) har <c1/>:

seg-e8c3172d72b8 = <c1/>: en hel logg, scoret som en batchkjøring; samme resultat som <c2/>, som serialiseres til resultat-JSON (<c3/>, <c4/>, <c5/> med scorer og fradrag).

seg-0302b7c35fd3 = <c1/>: et begrenset utsnitt av en strøm (høyst { "2" } MiB og { "20,000" } epoker, og langt nok til å romme kalibreringsvinduet), scoret slik live-modus scorer og returnert i live-JSON-lines-skjemaet (<c2/>, den siste <c3/>, en oppsummering av antall per bånd, laveste og siste score, første upålitelige tidspunkt). Mottakerens tid sammenlignes ikke med en vertsklokke. Den langvarige live-modusen (sockets, en fil som utvides, gaten) hører til binærfilen.

seg-d971dae93784 = Begge trenger en økt med <c1/>; tabellen <c2/> er valgfri.

seg-870fece8026e = Kjør den live

seg-c132d449414f = Økten er den samme <c1/> som for en batchkjøring, med en tabell <c2/> som deklarerer <c3/>; tabellen <c4/> trengs ikke. Serieporter åpnes ikke direkte ennå: les porten med verktøyet du allerede bruker (<c5/> og <c6/>, en terminalserver, en multiplekser) og send den videre med pipe eller videresending. Direkte serieinndata kan komme senere.

seg-13a043c1ce60 = Hver fullførte epoke skriver én JSON-linje til stdout:

seg-b1f0c563c94d = <c1/> er <c2/>, <c3/>, <c4/> eller <c5/> (båndet til scoren, med grensene i øktens tabell <c6/>); <c7/> mangler under kalibreringen; <c8/> viser hvilke kontroller som trakk poeng, og hvor mange, de største først.

seg-9b21238a7dc1 = JSON-lines-skjema (versjon { "1.1" })

seg-79306ff2d878 = Ett JSON-objekt per fullførte epoke, nøklene i denne rekkefølgen:

seg-a129b9e613d0 = Type

seg-bbcdd898d24d = heltall

seg-96958263575f = antall rapporterte epoker, fra { "1" }

seg-16022703e1c0 = tall

seg-95dde7698840 = sekunder siden strømmens første epoke

seg-dee4f7b91079 = epokens tid slik strømmen oppgir den (ISO-8601 UTC med dato så snart en RMC er sett, ellers <c1/>)

seg-0361f40a8e59 = tall eller null

seg-c2418289d966 = { "0" } til { "100" }, ett desimal; null under kalibreringen eller når <c1/> sier hvorfor ingen kunne beregnes

seg-00575e5df2e1 = liste

seg-54c1f879643b = <c1/>, de med flest poeng først; <c2/> er statistikken over terskelen (alarm ved { "1" } eller mer); bare monitorer som kostet poeng, er med; <c3/> <em>(lagt til i { "1.3" })</em> er <c4/>, <c5/> eller <c6/>

seg-24d178dfb34f = liste med strenger

seg-30948e769405 = monitorer ved eller over terskelen sin

seg-fb08af60656f = <c1/>, <c2/> eller <c3/>

seg-495aa49df7e2 = hvorfor ingen score ble beregnet (for eksempel en deklarert kurssensor som mangler)

seg-3dabfd59cf4b = objekt eller null

seg-9395d2543ac0 = <em>(lagt til i { "1.1" })</em> posisjonen mottakeren rapporterte i denne epoken, <c1/> (høyden er ellipsoidisk der setningen oppgir geoideseparasjonen, ellers over middelhavnivå); null når mottakeren ikke ga noen, også for kalibreringsepoker uten posisjonsbestemmelse

seg-3af4806d7d74 = <em>(lagt til i { "1.2" })</em> hva denne programvaren er og ikke er: veiledende, ikke typegodkjent navigasjonsutstyr, operatøren er fortsatt ansvarlig

seg-79adcc5ee873 = <em>(lagt til i { "1.3" })</em> satellittgeometrien: <c1/> (<c2/>, <c3/>, <c4/> når strømmen ikke har GSV-elevasjoner og -asimuter og ingen GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satellitter i sikte, men ikke sporet mens DOP for dem i sikte er god: geometrifradraget er da <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: rapporteres alltid, scores aldri; scoren trekker bare for <c32/>) (se <a1><c33/></a1>)

seg-fc212411bf3c = Monitornavn (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> og fra { "1.3" } <c17/>. Nye navn kan komme til i senere versjoner; forbrukere bør behandle et ukjent monitornavn som en monitor. Oppsettet for <c18/> nedenfor har et formatversjonsnummer i det første feltet; dette JSON-skjemaet er versjon { "1.3" }: { "1.1" } la til <c19/>, { "1.2" } <c20/>, { "1.3" } <c21/> på slutten og <c22/> i hvert fradrag, og det endres bare ved at nøkler legges til på slutten.

seg-0019bf7fbfcd = Autentiseringsinndata

seg-39b3dfbd97cc = Monitoren <c1/> henter autentiseringsstatus per satellitt fra en autentiseringskilde gjennom <c2/> (en liste av <c3/>, status <c4/>, <c5/> eller <c6/>), ved siden av den samlede <c7/>. På NMEA-siden bæres det samme av <c8/>, for eksempel <c9/>. Enhver feil, samlet eller på én satellitt, utløser alarm i monitoren og koster hele vekten (den får forholdet { "1.5" }); suksess er ikke belegg for noe. { -brand } verifiserer ingenting her: kilden som gjør det, er ansvarlig for statusen den rapporterer.

seg-8ffc94901796 = En epoke er fullført når den neste tidsstemplede setningen kommer; setninger fra tregere eller usynkroniserte instrumenter (en gyro noen tideler av et sekund etter mottakeren) som kommer før det, hører til den. Hvis strømmen stopper opp i <c1/> (standard { "1.5" } s, sett den over det lengste gapet mellom mottakerens tidsstemplede setninger), fullføres epoken slik den står. De første <c2/> sekundene av strømmen danner grunnlinjen og scores aldri, så <b>en strøm som allerede utsettes for spoofing når den først kobles til, har ingen ren grunnlinje</b>: start laget før reisen, eller mens posisjonsbestemmelsen er kjent for å være god. Kalibreringsvinduet lukkes én gang, etter ankomst: en epoke med tid tidligere enn en tid som allerede er sett (en tilbakespoling, en avspilling av strømmens start) er aldri kalibrering uansett hva tiden sier; den scores med fullt fradrag for <c3/>, som er upålitelig. Live-motoren scorer hver epoke over kalibreringsepokene og den siste minuttet eller så av strømmen, så kostnaden per epoke vokser med <c4/> ganger epokefrekvensen; hold vinduet kort på en rask mottaker. Bufferne er begrenset (en flom av linjer uten en tidsstemplet setning fullføres for hver { "5,000" } linjer, kalibrering og historikk er begrenset til { "20,000" } epoker).

seg-2ef5aad7c750 = Mottakerens tid sammenlignes også med denne datamaskinens monotone klokke, noe som bare gir mening for en strøm som kommer i sanntid. En lagret logg som mates inn i full fart gjennom stdin, TCP eller UDP, utløser den kontrollen pr. konstruksjon: bruk <c1/>. (<c2/> uten <c3/> innebærer det allerede.) En <c4/> leses som en avspilling til den er lest til slutten, og vertsklokken kobles inn fra da av, slik at en kø av etterslep ikke leses som en klokkefeil; kontrollen krever da at kalibreringsvinduet fortsatt er åpent (ellers har den ingen grunnlinje og kjører ikke).

seg-a06e58b2cfc8 = Strømslutt og feil: stdin og en fil som leses til slutten, avsluttes normalt (avslutningskode { "0" }). En TCP-forbindelse som lukkes av motparten, er ikke en normal slutt for en strøm som skal fortsette: laget avslutter med en kode som ikke er null etter å ha scoret og skrevet alt det hadde mottatt, og kobler ikke til på nytt, så kjør det under en overvåker som starter det på nytt. UDP-datagrammer som deler en setning, settes sammen; leserne for stdin, en fil og TCP støttes av en begrenset kø som presser tilbake mot avsenderen (ingenting går tapt), mens UDP, som ikke kan presse tilbake, forkaster datagrammer motoren ikke kan ta imot og sier fra om det på stderr. <c1/> binder seg til loopback-adressen; gi <c2/> for å lytte andre steder (en advarsel skrives ut).

seg-0a0ed5e74ea4 = <c1/>: den proprietære setningen

seg-71ccf4a80c99 = Hver epoke gir også én NMEA { "0183" }-setning med gyldig sjekksum, som <c1/> skriver til en fil eller stdout, og som gaten setter inn i den videresendte strømmen:

seg-df9382f4b055 = <c1/>: formatversjonen

seg-6986879f86fb = UTC-tid for epoken, <c1/>; tom hvis strømmen ikke ga noen

seg-34418696f9d2 = tillitsscore { "0" } til { "100" }, ett desimal; tom under kalibreringen eller når ingen kunne beregnes

seg-0b249ba73868 = bånd: <c1/> kalibrerer, <c2/> nominell, <c3/> degradert, <c4/> upålitelig

seg-281aba68405a = gate: <c1/> av, <c2/> sluppet gjennom, <c3/> holdt tilbake (posisjonsbestemmelsen ble markert ugyldig i den videresendte syklusen)

seg-f306c3f54a48 = opptil to årsaker, <c1/> skilt med <c2/>; tom når ingenting ble trukket

seg-4bee29dfe578 = Adressen er <c1/> + produsentmnemonikken <c2/> + <c3/>. Utstyr som ikke kjenner en proprietær setning, ignorerer den. { -brand } ignorerer sin egen <c4/> ved inndata.

seg-d75c9da94f37 = Gate-modus

seg-30c1f4a5706c = <c1/> plasserer { -brand } mellom mottakeren og utstyret som bruker posisjonsbestemmelsen (et kartsystem, et sporstyringssystem). NMEA-strømmen går inn, kommer ut på stdout, og er:

seg-aa0692146620 = <b>sluppet gjennom uendret</b> så lenge epoken ikke er upålitelig (og under kalibreringen), med en <c1/> etter hver syklus av setninger; og

seg-bbdd68edbb17 = <b>markert ugyldig</b> mens den er upålitelig: GGA-kvalitet <c1/>; RMC-status <c2/> (og modusindikatoren <c3/> og navigasjonsstatusen <c4/> der de finnes); GNS-modus <c5/> i hver posisjon; GLL-status <c6/> og modus <c7/>; VTG-modus <c8/> der den har en. Posisjonsfeltene blir stående som de var: poenget er at utstyret ser at mottakeren selv erklærer posisjonsbestemmelsen ugyldig og utløser sin egen alarm. Hver omskrevne setning får sjekksummen beregnet på nytt.

seg-23ee46747297 = Når posisjonsbestemmelsen først er holdt tilbake, slippes den fri først etter at epokene har vært utenfor det upålitelige båndet i <c1/> (standard { "30" } s), slik at en score ved bånd-grensen ikke kan få posisjonsbestemmelsen til å flimre. JSON-linjene går bare dit <c2/> sier (som standard ingen steder, fordi strømmen har stdout).

seg-6b7b557a4909 = For at et kartplott skal kunne koble seg direkte til, kan du tilby den gatede strømmen over TCP i stedet for stdout:

seg-96ff51df9abe = <c1/> lytter på loopback-adressen; <c2/> lytter andre steder (en advarsel skrives ut, fordi alle som når adressen, kan lese strømmen). Et vilkårlig antall klienter kan koble til; hver får den samme strømmen fra det øyeblikket den kobler til, og klientene leser bare. Hver klient har sin egen begrensede kø og skriver, så en som ikke henger med, kastes ut (forbindelsen lukkes, en linje på stderr) og forsinker aldri de andre eller inndataene. <c3/> trenger <c4/>; stdout bærer da ingenting av strømmen, så <c5/> er ledig.

seg-960e0abb0466 = Hva gaten ikke gjør, og hva du bør vite før du bruker den:

seg-ee3f18efa84c = Den er <b>valgfri</b>. Ingenting markerer en posisjonsbestemmelse som ugyldig med mindre <c1/> er gitt.

seg-9cd8243cb437 = Den <b>legger til forsinkelse</b>: en syklus holdes til epoken er scoret, noe som er tiden til den neste tidsstemplede setningen (omtrent én syklus: ett sekund for en mottaker på { "1" } Hz), eller <c1/> etter den siste når strømmen stopper opp. Utstyr som trenger en setning innen noen titalls millisekunder etter mottakerens utdata, må ikke stå bak den.

seg-ec63f8f3230b = Den er <b>et enkelt punkt i kjeden</b>: hvis den stopper, stopper strømmen. Kjør den under overvåking, og bestem på forhånd hva utstyret nedstrøms gjør uten en strøm.

seg-536e41a6a5e7 = Den <b>feiler lukket ved egne feil</b>: hvis monitorene ikke kan beregne en score etter kalibreringen (en deklarert kurssensor som ikke sender noe, for få kalibreringsepoker), er epoken upålitelig, har en <c1/> og holdes tilbake; frigivelsesholdet tidsmåles på denne datamaskinens klokke, ikke på mottakerens tid, som er det en spoofer styrer (for en avspilling finnes bare mottakerens tid).

seg-5dd62cd853c6 = Den kan <b>holde tilbake en god posisjonsbestemmelse</b> (en falsk alarm) i tillegg til å slippe gjennom en spoofet (en uteblitt deteksjon). Overvåkerne sjekker en posisjonsbestemmelse mot et skips fysikk og dets andre sensorer; en forfalskning som er konsistent med alle disse, blir ikke oppdaget (se begrensningene nedenfor).

seg-a284a3ec9dfe = Den forventer en <b>ren tekststrøm i NMEA { "0183" }</b>. Binære rammer som er blandet inn i strømmen, videresendes uendret, men en <c1/> kan da havne mellom bytene i en ramme.

seg-0c919698fa92 = Den er <b>ikke typegodkjent</b>, og ingenting i den er vurdert mot IEC { "61108" } eller IEC { "61162" }. Operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-9e3ea39c38cf = <s1>Forrige</s1>Mottakertillit

seg-136da5c10b2d = <s1>Neste</s1>NMEA-treningsstrømmer

seg-990a49527516 = $PKSHT: den proprietære setningen
