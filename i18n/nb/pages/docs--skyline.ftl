# docs--skyline: translations (nb)

seg-f917e7fcac09 = Hva det er

seg-6c6e7248496f = Himmelgeometri

seg-379f49bff6fb = Python

seg-2bd2101ce454 = Flate

seg-ad856ad710eb = Status

seg-cbf0f9bcd2d8 = Uavhengig referanse

seg-6e0cb6acc073 = VALIDATED

seg-c14b8fe46517 = Asimutavhengig horisontmaske: synlig mengde, asimut og elevasjon, og DOP under masken

seg-bbb1828b3db1 = Gatekløft-, sektor- og terrengreduksjoner til en tabell

seg-2c53381d48ae = Horisontal feilellipse og kofaktor per system fra geometrikovariansen

seg-de6c33774c9c = CLI

seg-d1e9715513b4 = Eksempel

seg-587beeccaa11 = Forhåndsinnstilling

seg-98f4f946a7ac = WASM

seg-b03d56f501c3 = Type

seg-4dbf41c0ec3b = Funksjon

seg-2b0d77219437 = Forhåndsinnstillinger

seg-7338b6210228 = Rad

seg-6317db731879 = Beskrivelse

seg-be2f66de7d07 = Kilde: <c1/>

seg-3cb660ef6b03 = Horisontmasker og himmelgeometri

seg-724f72bdfa36 = Til og med { "0.36" } var hver synlighetstest mot jorden i motoren én enkelt elevasjonsgrense, <c1/>: en satellitt telte når den var ved eller over ett tall, uansett retning. En gate, en kai, en fjord eller en kran blokkerer en del av himmelen og lar resten være åpen. En <b>skyline</b> er en elevasjonsgrense som avhenger av asimut; <b>himmelgeometrifunksjonene</b> gjør et sted, et tidspunkt, konstellasjoner og en skyline om til den synlige mengden, presisjonsfortynningen (DOP), geometrikovariansen, den horisontale feilellipsen, en Monte Carlo-sky og et skyplot. Utformingen er <c2/> (punkt { "1" } og { "2" }).

seg-4c1bc0b37f54 = Evidens: beslutningen om maskert synlighet (geodetiske synsvinkler, tabellmasken, den synlige mengden og dens DOP) er <b>VALIDATED</b> mot Orekit { "12.2" } og gnss_lib_py { "1.0.4" } i en forhåndsregistrert sammenligning, og det samme gjelder feilellipsen og kofaktoren per system (numpy, forhåndsregistrert); reduksjonene for kanjon, sektor og terreng, forhåndsinnstillingene og resten av himmelgeometrifunksjonene er <b>MODELLED</b> (<a1>Evidens</a1>). En skyline fjerner satellitter med fri sikt og ingenting mer. Forhåndsinnstillingene er REPRESENTATIVE geometrier, ikke oppmålinger.

seg-6fa3291b70e3 = Skylinen

seg-08585dd55bb5 = En skyline er det punktvise maksimum av fire beskrivelser. Asimut er grader med klokken fra sann nord i stedets lokale øst-nord-opp-system; elevasjoner er i <c1/>.

seg-9d0e2b0a469f = TOML

seg-3dbc7ff9f5ab = Tabell

seg-a67486e7d10e = Elevasjoner lineært interpolert i asimut, brutt rundt ved { "360" }°. Asimuter strengt økende i <c1/>; høyst { "3600" } rader.

seg-bc12ba94381f = Bygate

seg-23066e2eb509 = To rette parallelle vegger (nedenfor).

seg-821762272e2f = Sektorer

seg-7387a718a7c3 = Skarpkantede intervaller, med klokken fra <c1/> (inkludert) til <c2/> (ekskludert), som kan gå rundt nord; høyst { "360" }.

seg-2768e3772b56 = Terreng

seg-5a5c08a77b86 = Punkter redusert til en tabell: elevasjon <c1/>, med krumningsfallet for <c2/> (en valgt, oppgitt konstant). <c3/> er over antennen.

seg-fb86c0db0c90 = <c1/> starter fra en navngitt geometri; kanjonfeltene overstyrer deretter preset-ens kanjon felt for felt, og <c2/>, <c3/> og <c4/> legges til den.

seg-0d76504a1d74 = Mottakerens <c1/> beholder sin betydning: den er en flat skyline. Den effektive grensen ved asimut <c2/> er <c3/>, og en satellitt er synlig når elevasjonen er <b>ved eller over</b> den: den samme <c4/> som den flate masken alltid brukte. En satellitt over <c5/> men under skylinen er <b>maskert av skylinen</b>.

seg-f7fd13e569e3 = Bygaten

seg-290f563c1ff7 = En gate går langs asimut <c1/>, <c2/> meter mellom veggene, med antennen <c3/> meter oppe på midtlinjen. Langs asimut <c4/>, med <c5/>, når strålen en vegg etter <c6/>, så en vegg med høyde <c7/> skjærer ved

seg-8662708f4f32 = Den åpne stripen ligger langs gaten. Med <c1/> (antennen i midten) forlater en stråle gjennom en åpen ende, og veggen skjærer ingenting, når <c2/>. En vegg som ikke er høyere enn antennen skjærer ingenting. <c3/> er som standard { "1.5" } m (et biltak eller en håndholdt mottaker, et oppgitt valg); en ny kanjon trenger <c4/>.

seg-1eeff52ea5a5 = Valgte og oppgitte dimensjoner (fra utformingsnotatet), ikke oppmålinger av noe reelt sted. <c1/> skriver ut én med proveniensen og grensen for hver grad.

seg-13e8e5460280 = Geometri

seg-6d71c5cbe104 = Kanjon: gate { "0" }°, bredde { "20" } m, vegger { "30" } m og { "30" } m, antenne { "1.5" } m. { "70.7" }° på tvers av gaten, åpen langs den.

seg-ab3415ff8811 = Forhold mellom høyde og bredde { "1.5" }, innenfor båndet { "0.5" }–{ "2" } for sideforhold i bygater hos Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

seg-e331f02251f8 = Sektorer: åpen mot sjøsiden over { "090" }–{ "270" } ({ "180" }°); kaibygninger { "8" }° over { "315" }–{ "045" } ({ "90" }°); molo og fyr { "3" }° over { "045" }–{ "090" } og { "270" }–{ "315" }.

seg-6926e1bfc55d = Oppgitte valg (for eksempel { "40" } m lagerbygg omtrent { "285" } m unna).

seg-f13d4df9a42c = Terreng: vegger { "600" } m over antennen på { "1500" } m til hver side av et nord-sør-gående sund, ett punkt per grad (ved <c1/> m), med krumningsfall. { "21.8" }° på tvers, under { "1" }° langs aksen.

seg-4d3dedbe4491 = Av samme størrelsesorden som bredden og relieffet i de dype fjordene på Vestlandet (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

seg-51f5219cb050 = Sektorer: containerstabler { "12" }° over den landvendte halvdelen { "000" }–{ "180" }; kranbommer { "35" }° over { "245" }–{ "255" } og { "25" }° over { "285" }–{ "295" }; åpent mot vannet ellers.

seg-a568ae949c3b = Fem ISO { "668" } high-cube-containere ({ "14.5" } m) omtrent { "60" } m unna en antenne { "2" } m oppe; en bom omtrent { "50" } m over kaien ved { "70" } m og { "100" } m, av størrelsesorden for en post-Panamax-kran. En kransektor er ugjennomsiktig.

seg-65b1b45c787f = I et scenario

seg-e489759bbd65 = En valgfri seksjon <c1/>, som gjelder foran kind-ens egen grense:

seg-f98345079e70 = Hva skylinen endrer

seg-cbe2f5ae721f = Per sample

seg-7368ea5c4b79 = <c1/> (med <c2/>)

seg-fde216d940fb = Synlighetstidslinjen (GNSS-tilgjengelighet) og DOP-sammendraget.

seg-7f6b2fcda681 = <c1/> (med <c2/>)

seg-8fafdb892253 = Satellittene RAIM og ARAIM (<c1/>) bruker.

seg-c0156fd1c895 = Satellittene hvis pseudoavstander simuleres og brukes av RAIM.

seg-d7fa5e5cf33d = Satellittene mottakeren kan spore, før jammeren.

seg-86caf3ae19ad = Hver modus sin mengde i sikte over hvert systems egen maske, polarsveipet inkludert (samme skyline på hvert sted). Omhyllingen for Doppler-modus og den utformede enkeltpasseringen er grenser for hva en mottaker må håndtere og beholder hvert systems maske.

seg-20d2e86d17bc = Hvilke epoker som regnes som over masken, tiden over den, satellittene i GNSS-sammenligningen.

seg-ed5bbd6b2c46 = <c1/> (trenings-NMEA)

seg-d0eb9fd84d24 = Satellittene i GSV og i posisjonsbestemmelsen. Asimuter er sanne peilinger festet til bakken, ikke fartøyets kurs.

seg-56cc8ae30218 = <b>Bakkestedet for <c1/> og <c2/>.</b> Begge kind-ene modellerer en bruker i bane med geosentrisk elevasjon og uten jordfast asimut, så de tar en skyline bare med utformingsnotatets bakkestedsmodus: <c3/> i stedet for <c4/> (nøyaktig én av de to). Hvert sample er ett absolutt tidspunkt, <c5/>: hver satellitt propageres til det (et elementsett, en kringkastet efemeride eller en SP3-fil føres frem fra sin egen epoke, en Walker-satellitt teller <c6/> fra <c7/>) og roteres til jordfast ved det, slik at stedet ser én konsistent himmel. <c8/> er orbit-scenarioets egen; uten en (og alltid for <c9/>, som ikke har noen) er det den nyeste epoken blant satellittene som har en, eller J2000 bare for Walker-mønstre. Elevasjon og asimut er geodetiske (WGS-84). Fordelingen mellom horisontal og vertikal for ARAIM-beskyttelsesnivåene og Stanford-vertikalfeilen i integritetskind-en bruker den samme geodetiske opp-retningen (WGS-84-ellipsoidens normal, omtrent { "0.19" }° fra den geosentriske radialen ved { "45" }° bredde); øyeblikksbilde-RAIM brukte den allerede. Et <c10/> uten skyline er en vanlig bakkebruker; banestien <c11/> i bane er uendret.

seg-fae979b3b96f = <b>Bakoverkompatibilitet.</b> Uten en seksjon <c1/> er et scenario byte-identisk med det samme motoren ga før skylinekoden fantes: <c2/> kontrollerer JSON, diagram og sammendrag for hvert medfølgende scenario som kjører en av disse kind-ene, og NMEA-teksten for hvert treningsscenario, mot SHA-256-sammendrag av grunnlinjen «{ "0.36" } portable» (sammendragene fra utgivelsescommiten for { "0.35.0" }, rebasert da motoren gikk over til portabel matematikk og beholdt i testen som protokoll: <c3/>). En tom seksjon <c4/> skjærer ingenting; resultatet er da lik kjøringen uten den, bortsett fra den tillagte blokken <c5/> og de nullstilte tellingene for <c6/>.

seg-fe88e0ad01e9 = <b>Hva som avvises</b>, med begrunnelsen i meldingen: en skyline på en <c1/> i bane; <c2/> og <c3/> sammen; en ukjent preset; en kanjon uten <c4/>; en tabell som ikke er strengt økende i <c5/>; en elevasjon utenfor <c6/>; en tom sektor; en ikke-positiv terrengavstand; inndata over grensene; enhver ukjent nøkkel.

seg-d1b10a0c833f = <b>Resultatet</b> får <c1/> når seksjonen er til stede: <c2/> er <c3/>, <c4/> eller <c5/>; <c6/> er andelen av den øvre halvkulens romvinkel over <c7/> (gjennomsnittet av <c8/> over asimut: { "1" } for en nullmaske, { "0.5" } for en flat grense på { "30" }°); <c9/> er preset-ens linje eller scenarioets egen. Enheter og proveniensklasser står i blokken <c10/>.

seg-0842c1133eb5 = Medfølgende eksempler (<c1/>):

seg-5f77a52314c7 = Hva det viser (fjern seksjonen <c1/> for å sammenligne)

seg-523f8c1a7912 = GPS + Galileo nederst i <c1/>: { "17" } av { "289" } samples beholder en posisjonsbestemmelse, median PDOP { "70.5" } ({ "1.14" } under åpen himmel).

seg-6c5618dce8ab = ARAIM med to konstellasjoner ved innseiling til en havn: { "70" } satellitt-epoker skjult, tilgjengelighet uendret ({ "145" } av { "145" }).

seg-36254db521fd = Pseudoavstander og RAIM på en kai: { "44" } satellitt-epoker skjult; RAIM-tilgjengelighet { "0.59" } ({ "0.85" } under åpen himmel).

seg-6b0f8b4c700f = En jammer på { "2" } W i en havn: { "83" } satellitt-epoker skjult, sporing uendret (jammeren hadde allerede tatt dem).

seg-22ceab915271 = GPS + Galileo + et LEO-lag i en fjord: median fusjonert PDOP { "1.14" } ({ "0.93" } under åpen himmel).

seg-f940e764e244 = Kanjonen <c1/> som en flat grense på { "35" }° og som <c2/> dreid langs bilens kurs: { "8" } mot { "4" } til { "5" } GPS- og Galileo-satellitter; fusjonert middelfeil { "2.1" } m i begge; alarmen på { "1.5" } m ved { "51" } % og { "59" } % av epokene.

seg-6aa4ec7e4058 = Fem motorfunksjoner (<c1/>), de samme på alle flater:

seg-4d6a793b2794 = Inndata → utdata

seg-c99f58f1ccd2 = per satellitt <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (enhetsvarians), <c15/>; <c16/> og <c17/> ved det forespurte konfidensnivået; <c18/>, <c19/>, <c20/>

seg-a5b914aac404 = <c1/> (høyst { "5000" }, en grense for inndata) minste kvadraters feil under uavhengige gaussiske avstandsfeil på <c2/> fra en ChaCha8-strøm med seed <c3/>: <c4/>, den empiriske kovariansen, horisontal og 3D RMS ved siden av <c5/> og <c6/>, andelen innenfor { "95" } %-ellipsen

seg-f435ee3b8709 = preset-ene med merkelapp, beskrivelse, proveniens, grensen for hver grad og <c1/>

seg-1937af5fa347 = en skyline-seksjon redusert til tabellen med 360 oppføringer motoren bruker, med <c1/>, <c2/>, <c3/>

seg-f16a1f2de329 = skyplottet som statisk SVG (uten skript, uten ekstern referanse, hver inndatastreng escapet)

seg-c802cf2a2e30 = En forespørsel:

seg-c3c44c1967ba = <c1/> er motorens konstellasjonspreset-er (<c2/>s <c3/>, <c4/>, <c5/>, <c6/>, ...; LEO-preset-ene <c7/>, <c8/>, ...) eller en full <c9/>-tabell <c10/>, propagert til <c11/> (Kepler med sekulær J2, banene i fellesmodusen <c12/>). Deres relative faser kommer fra ulike referanseepoker, så himmelen er <b>en representativ geometri, ikke himmelen på den datoen på det stedet</b>. Satellitter kan i stedet (eller i tillegg) gis direkte: <c13/>, eller med <c14/> og et <c15/> eller <c16/>. Standardverdier: hvert systems egen maske ({ "5" }° for GNSS, { "10" }° for LEO; { "5" }° for satellitter gitt direkte), én mottakerklokke per system (<c17/> for én felles klokke), <c18/> { "1" } m (en representativ budsjettlinje for to frekvenser), konfidensnivå { "0.95" }. Grenser for inndata: høyst { "2000" } satellitter over horisonten (en systemtabell som ber om flere avvises før den bygges) og { "16" } mottakerklokker.

seg-6408f9b02ccb = En datert himmel fra elementsett.

seg-7724e4ecafee = <c1/> tar tekst med to-linjers elementsett (en navnelinje før hvert sett er valgfri; høyst { "4" } MiB, en grense for inndata), propagert av motorens SGP4 (WGS-72, propagatoren <c2/> bruker) til <c3/> pluss <c4/>, rotert til jordfast med UT1 satt lik UTC og uten polbevegelse, og sett fra <c5/>. <c6/> er UTC i ISO { "8601" } (<c7/>) og daterer bare elementsettene (preset-ene har ingen dato, så en <c8/> uten <c9/> avvises); <c10/> merker dem for klokken per system (standard <c11/>). Hvert resultat sier hvilken himmel det er i <c12/> og <c13/>:

seg-13a8b4ac40f9 = Himmelen

seg-c0bde35f9442 = motorens konstellasjonspreset-er: en representativ geometri

seg-d368b50280cc = elementsettene propagert til den oppgitte epoken: himmelen disse elementsettene gir ved den epoken, ikke en måling av den (nøyaktigheten er SGP4s og settenes alder)

seg-0bc07825a9b5 = ingen <c1/>: elementsettene propagert til det nyeste settets egen epoke pluss <c2/>, en representativ himmel

seg-1230388da233 = satellitter gitt direkte, som oppgitt

seg-1a30004a7f9e = En blanding forener dem med <c1/>. <c2/> er tidspunktet elementsettene ble propagert til, og <c3/> navngir hva av teksten som ikke ble brukt, med begrunnelse: misdannede eller foreldreløse elementsettlinjer (med linjenumre), sett parseren avviste, og sett SGP4 ikke kunne propagere til det tidspunktet (forfalt, eller utenfor sine grenser); høyst { "100" } oppføringer til sammen, deretter én siste oppføring som teller resten. En tom <c4/>-liste legger ikke til noen preset-er. Skyplottet oppgir grunnlaget i bunnteksten.

seg-8560c13c7ea3 = <b>Én kjerne.</b> Kofaktormatrisen er <c1/>, oppbyggingen av designmatrisen og Gauss-Jordan-inversen bak <c2/>. <c3/> eksponerer kovariansen og <c4/> er reduksjonen av den, så de VALIDATED skalarene er uendret og fortsatt festet av <c5/>. Det finnes ingen andre DOP-implementasjon.

seg-cb1be3e04419 = <b>Ellipsen.</b> Halvakser <c1/> for egenverdiene <c2/> til øst-nord-blokken, med <c3/> (<c4/> ved { "95" } %, { "1" } ved { "39.35" } %), og hovedaksens asimut <c5/> i <c6/> fra nord.

seg-96062e2cfed1 = Inngangspunkter

seg-f8dc86bd9da2 = <c1/> eller <c2/>, med <c3/> eller <c4/>; <c5/>

seg-d5b5bdf6081c = Rust

seg-8d0f99ed4837 = <c1/>, <c2/> med de samme navnene

seg-40a7552d2ba9 = MCP

seg-42f0fe3b42ab = <c1/> (<c2/>, eller <c3/>); ingen Monte Carlo over MCP (bulkdata en agent bør oppsummere, ikke bære med seg)

seg-9d04c658b37a = Hvert resultat bærer <c1/> (MODELLED), <c2/> (geometri under en oppgitt feilmodell: uavhengige, like gaussiske avstandsfeil med null forventning; ikke en prediksjon av en mottakers reelle feil, som også har biaser, flerveisutbredelse og feil uten fri sikt; ikke en integritetsgrense) og den veiledende merknaden: <em>Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon.</em>

seg-0e1285fdfe52 = Fem registerrader (<c1/>), slik utformingsnotatet avgrenser dem:

seg-1aa76286f152 = Orekit { "12.2" } (synsvinkler fra <c1/>, <c2/>) med gnss_lib_py { "1.0.4" } (<c3/> og DOP-matrisen), forhåndsregistrert i <c4/> (commit e4b9d912) før noen av dem ble kjørt: { "1173" } synsvinkler på seks steder og fire epoker, seks tabeller, { "142" } synlige mengder; verste elevasjon { "1.3e-13" }°, asimut { "2.3e-13" }°, maske { "1.1e-12" }° mot { "1e-9" }°; identiske synlige mengder, ingen i grensebåndet; DOP { "3.3e-13" } relativt og kofaktor { "6.6e-13" } av matrisens skala mot { "1e-9" }. Omfang: tabellmasker, geodetiske synsvinkler, den maskerte mengden og dens DOP og kofaktor med felles klokke.

seg-b33828edbe2f = håndberegnede verdier; sammenligningen ovenfor leser tabellene deres som inndata og kontrollerer dem ikke

seg-ca950752be62 = Skyline-preset-er

seg-83946f66ca78 = ingen: valgte, oppgitte dimensjoner (kontrollert bare mot seg selv)

seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> og <c2/> (standard P2) på de { "142" } innsjekkede synlige mengdene, felles klokke og én klokke per system, forhåndsregistrert i <c3/> (commit 0bbeeaee): { "270" } tilfeller, akser { "5.1e-13" } relativt, orientering { "5.3e-12" }°, kofaktor { "1.0e-12" } av matrisens skala, mot { "1e-9" } og { "1e-6" }°

seg-44e5f9ca28f7 = Himmelgeometrifunksjoner

seg-8e3953481bbf = sammensetningen: propagering av preset-ene til en representativ himmel, Monte Carlo-skyen (kontrollert mot geometrien den trekker fra), flatene

seg-e8eec007c6b9 = At en seksjon <c1/> mangler, kontrolleres byte for byte mot utdataene fra { "0.35.0" }, noe som viser bakoverkompatibilitet og validerer ingenting. gnss_lib_py bruker bare én enkelt elevasjonsmaske, så den er DOP-referansen her, ikke maskereferansen.

seg-d5894e54715b = Hva en skyline ikke modellerer: diffraksjon over en veggkant, refleksjoner og signaler uten fri sikt som en reell mottaker fortsatt kan spore (de forkastes, ikke degraderes), delvis gjennomsiktighet (en gitterkran er ugjennomsiktig over hele sektoren sin), terreng utenfor de oppgitte punktene, og jordens krumning inne i kanjon- og sektorformene.

seg-745d19d6b35d = <s1>Forrige</s1>Marine integrasjoner

seg-bbe8dd07d33b = <s1>Neste</s1>Tillit som sikkerhetstelemetri
