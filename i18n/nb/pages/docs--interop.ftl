# docs--interop: translations (nb)

seg-f917e7fcac09 = Hva det er

seg-cae10fb9bff8 = Scenario

seg-f2ce7fc60cdf = Format

seg-8c718f7f9f5d = SigMF

seg-507b8c235614 = CZML

seg-bf09433a7342 = GeoJSON

seg-9c92e0bc42aa = KML

seg-b03d56f501c3 = Type

seg-357c2320b43a = ja

seg-c8c964a11462 = Kilde: <c1/>

seg-881ec6f8fbe0 = En kjøring skriver et resultatdokument, et diagram og en rapport. <c1/> skriver i tillegg scenarioets geometri, eller det syntetiserte signalet, i formater som andre verktøy allerede leser: en globusvisning, et skrivebordskart, et geografisk informasjonssystem (GIS), en pakke for oppdragsanalyse eller et verktøy for programvaredefinert radio (SDR). Ingenting her leser en klokke eller nettverket, og ingen eksport har et tidsstempel for opprettelse, så det samme scenarioet gir byte-identiske filer ved hver kjøring.

seg-736f2dc67a3c = Filene skrives ved siden av scenarioet, med navn som resultatdokumentet: <c1/>, <c2/>, <c3/>, én <c4/> per bevegelig objekt (eller <c5/> når det bare er ett), og paret <c6/> / <c7/>. Med <c8/> får de navnet på studien i stedet, slik de andre utdataene gjør.

seg-21d3fba059d5 = Et format som er navngitt eksplisitt og ikke gjelder for scenarioet, er en feil som skriver ut årsaken; under <c1/> skrives årsaken ut og formatet hoppes over. Inngangspunktene i biblioteket er <c2/>, <c3/> og <c4/>; de tar scenarioteksten og returnerer bytes, uten å røre noen fil, så de kjører også i WebAssembly-bygget. Model Context Protocol-serveren (MCP) tilbyr de samme tre som verktøyene <c5/>, <c6/> og <c7/> (se <c8/>).

seg-77200201db88 = Kode: <c1/> (<c2/> bygger én geometrisk beskrivelse av scenarioet, <c3/>, <c4/>, <c5/> og <c6/> skriver den), <c7/> og <c8/> for signalet. Tester: <c9/>.

seg-f13ab6bb2e47 = Formater

seg-fc52229b569c = Spesifikasjon som følges

seg-3f237c8956eb = Cesium Language: en JSON-tabell (JavaScript Object Notation) med tidsmerkede pakker, lest av CesiumJS

seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, en standard fra Open Geospatial Consortium (OGC), lest av Google Earth og de fleste GIS-verktøy; tidsmerkede spor bruker Google-utvidelsen <c1/>

seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (skjemanavnerom <c1/>; utvidelsesnavnerom <c2/>)

seg-4cfac7667dbc = geografisk JSON, Request for Comments (RFC) { "7946" } fra Internet Engineering Task Force (IETF)

seg-de0feb450ae1 = STK <c1/>

seg-96173e7b4238 = efemeridefilen til Ansys Systems Tool Kit (STK), i tid-posisjon-hastighet-formen <c1/>

seg-a2284e8c0034 = Signal Metadata Format: en JSON-metadatafil og en rå fil med komplekse IQ-sampler (in-phase og quadrature)

seg-b38ee3ebd012 = Hva hver fil inneholder

seg-7d873bc11593 = Alle geospatiale formater skrives fra den samme scenen, så de kan ikke være uenige om hvor noe er. En scene har opptil fire typer objekter:

seg-1fc686f6a7ea = <b>Bevegelige objekter</b>: satellitter, og en brukerplattform når den beveger seg, samplet på scenarioets eget tidsrutenett med propagatorene som kjøringen for typen bruker.

seg-3db28cb6adc5 = <b>Faste steder</b>: en mottaker, en bakkestasjon, en jammer eller opprinnelsen til et lokalt navigasjonsreferansesystem.

seg-0def04909935 = <b>Tidsløse spor</b>: veipunktene en alternativ PNT-type (posisjonering, navigasjon og tidssynkronisering) for terreng, tyngdekraft eller kombinasjon flyr. Disse typene har ingen tidsakse, så sporene har ingen tid.

seg-e14d49ae7330 = <b>Jammer-fotavtrykk</b>: for typen <c1/> to sirkler rundt jammeren: bakkeavstanden innenfor hvilken en satellitt i senit (den sterkeste) faller under sporingsterskelen, slik at alle satellitter går tapt, og avstanden innenfor hvilken en satellitt ved høydemasken (den svakeste) gjør det, slik at sporingen begynner å svikte. Begge kommer fra typens egne linkligninger (Kaplan og Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3. utg., §{ "9.4" }) med jammeren ved mottakerens horisont og frirom-tap, og testsuiten kontrollerer at det effektive forholdet mellom bærebølge og støytetthet ved hver radius er lik terskelen innenfor { "1e-6" } dB. Sirkelen tegnes på en kule med jordens middelradius.

seg-e1dd97c47993 = Den første pakken er dokumentpakken (<c1/>, <c2/>) med en klokke som spenner over tidsrutenettet. Hvert bevegelig objekt er en pakke der <c3/> har en ISO { "8601" } (International Organization for Standardization-format for dato og tid) UTC-<c4/> (Coordinated Universal Time), <c5/> <c6/>, og <c7/>-sampler <c8/>: sekunder etter epoken, meter i Geocentric Celestial Reference System (GCRS). CesiumJS tar <c9/> som International Celestial Reference Frame (ICRF), hvis akser GCRS deler. Faste steder og sentre for fotavtrykk er konstante jordfaste <c10/>-posisjoner med <c11/> <c12/>. Et fotavtrykk er en <c13/> med begge halvaksene lik radiusen; et tidsløst spor en bakkeklemt <c14/>. Hver pakkes <c15/> sier rammen en gang til i ord.

seg-be6362f4c7e7 = Ett <c1/> med en <c2/> per objektklasse. Et bevegelig objekt er en <c3/> som holder en <c4/>: én <c5/> per sampel (ISO { "8601" } UTC), deretter én <c6/> per sampel (lengdegrad, breddegrad, høyde). Steder er <c7/>-er, fotavtrykk <c8/>-er der ringen er lukket og mot klokken, tidsløse spor <c9/>-er. Koordinatene er World Geodetic System { "1984" } (WGS { "84" }) lengdegrad og breddegrad i desimalgrader og høyde i meter over WGS { "84" }-ellipsoiden, skrevet med <c10/> <c11/>. KML leser <c12/> som høyde over middelhavsnivå; forskjellen, geoideundulasjonen, ligger innenfor omtrent ±{ "110" } m og påføres ikke. Dokumentets beskrivelse sier det.

seg-37dc14626a6c = Én <c1/>. Posisjonene er <c2/> eller <c3/>, med lengdegrad først, slik RFC { "7946" } krever, i WGS { "84" }-grader, med høyde i meter over ellipsoiden. Et bevegelig objekt er en <c4/> med en <c5/>-egenskap som holder én ISO { "8601" }-tid per posisjon; et spor som krysser { "180" }°-meridianen skrives som en <c6/> kuttet der, slik RFC { "7946" } §{ "3.1.9" } ber om (krysningspunktet interpoleres, og <c7/> lister da bare de opprinnelige samplene). Steder er <c8/>-er, fotavtrykk <c9/>-er med en lukket ytre ring mot klokken (§{ "3.1.6" }), tidsløse spor <c10/>-er. Hvert objekt har en <c11/>-egenskap som navngir enheten til hvert numeriske medlem.

seg-ea28a2bd431c = Én fil per bevegelig objekt, siden en STK-efemeride beskriver ett kjøretøy. Hodet gir <c1/> (lik antallet datarader), <c2/> (UTC, <c3/>), <c4/> med <c5/>, <c6/>, <c7/> og <c8/>; radene under <c9/> er sekunder etter epoken, posisjon i meter og hastighet i meter per sekund, i GCRS. En scene med bare faste steder eller tidsløse spor skriver ingen <c10/>-fil: et fast punkt er en STK Facility, ikke en efemeride. En id som ikke er en vanlig del av et filnavn (et konstellasjonsskall og en satellitt, <c11/>) skrives med hvert annet tegn som <c12/>, nummerert hvis to id-er da faller sammen.

seg-52a78be5db9f = Typen <c1/> og typen <c2/> (gjennom trinnet <c3/>) eksporterer hver satellitt i lav jordbane (LEO) og brukeren fra typens egne propagatorer og tidsrutenett. Typen arbeider i ECI0, det jordsentrerte treghetssystemet som er innrettet etter det jordfaste systemet ved epoken; hvert sampel dreies over i det jordfaste systemet på sitt eget tidspunkt med typens jordrotasjon og derfra inn i GCRS gjennom TEME-systemet (true equator, mean equinox) som propagatoren Simplified General Perturbations { "4" } (SGP4) gir utdata i, i det øyeblikket, med UT1 (Universal Time, jordrotasjonsvinkelen) satt lik UTC og polbevegelse sett bort fra, som for de andre eksportene. De andre LEO-typene sier hvorfor et format ikke gjelder (tabellen nedenfor).

seg-b134baf33fba = En <c1/> eksporterer hvert medlemsscenario som har geometri som sitt eget filsett, med medlemmets etikett satt inn før formatsuffikset: hver fasekjøring (<c2/>, eller <c3/> når fasen har flere kjøringer), sweepens basisscenario (<c4/>), Monte Carlo-scenarioet (<c5/>) og hvert sammensatt medlem (dets etikett, med de delte verdiene det binder skrevet inn). <c6/> skriver <c7/> og <c8/>. Et medlem som er likt et tidligere skrives én gang, og verdier en campaign bruker under kjøring (overleveringer, sweep-verdier, seeds) er ikke i det eksporterte medlemmet. Et format gjelder for en campaign når det gjelder for et medlem; ellers står årsaken i note { "4" } i tabellen nedenfor. Se <a1>CAMPAIGNS.md</a1>.

seg-6579b6941d10 = Øyeblikksbildet <c2/> fra typen <c1/>, det modellerte L-båndet tegnet som komplekse sampler i ett tidspunkt, som et <c3/> / <c4/>-par, i datatypen <c5/> navngir (<c6/> eller <c7/>). Det er den samme opptaken som kjøringen skriver og leser tilbake for sin egen konsistenskontroll: de eksporterte metadataene er lik blokken <c8/> i resultatdokumentet, og datafilen har lengden <c9/>. Skriveren er <c10/>, modulen typen <c11/> allerede brukte; ingenting dupliseres.

seg-6e7c5f0e34f3 = Referansesystemer og tid

seg-01d1bedb0595 = Motoren propagerer i TEME (true equator, mean equinox of date), sitt eget system. Bevegelige objekter dreies til GCRS med reduksjonen <c1/> (IAU { "2006" }-presesjon og IAU 2000B-nutasjon, der IAU er International Astronomical Union), som gjengir Vallados publiserte TEME-til-GCRF-eksempel (Geocentric Celestial Reference Frame) innenfor { "0.11" } m, for CZML og STK, og til det jordfaste systemet med <c2/> for KML og GeoJSON. Den jordfaste rotasjonen er Greenwich-middelsideralvinkelen med UT1 satt lik UTC og polbevegelse ikke påført, den samme reduksjonen som SP3-eksporten (Standard Product { "3" }) bruker. Ved en GPS-banes radius flytter den utelatte UT1−UTC på opptil { "0.9" } s lengdegraden til en satellitt med opptil omtrent { "1.7" } km; bakkesteder påvirkes ikke, siden de oppgis i breddegrad og lengdegrad.

seg-4eaa7b3e6946 = Typen <c1/> er unntaket: dens utdata fra motoren har allerede GCRS- og jordfaste posisjoner (med scenarioets UT1−UTC og polbevegelse, eller en ekte serie fra International Earth Rotation and Reference Systems Service (IERS)), og de skrives uendret.

seg-2299da743a4c = All tid er UTC. Skuddsekunder er ikke modellert: en forskyvning over et skuddsekund telles som om hver dag hadde { "86 400" } s, slik motorens tidsrutenett teller.

seg-4f7a0b8b4358 = Epoken for <c1/> er den typens kjøring bruker, og hver fil navngir den: <c3/> for typen <c2/>; når den mangler, den tidligste epoken satellittenes egne data har (en TLE-epoke (two-line element set), referansetiden til en kringkastet efemeride, starten på en SP3-fil), og 2000-01-01T00:{ "00" }:00Z bare når ingen satellitt har en (keplerske elementer). SP3- og OEM-eksportene (Orbit Ephemeris Message) beholder 2000-01-01T00:{ "00" }:00Z for et scenario uten <c4/>, så for et slikt scenario avviker datoene deres fra disse filenes. Uten scenarioets <c5/> dreies hver satellitt som har sin egen epoke inn i GCRS og de jordfaste systemene i sitt eget øyeblikk (epoken pluss <c6/>), siden det er datoen TEME-posisjonen hører til; der satellittenes epoker er ulike, følger de delte tidsmerkene motorens forutsetning om at hver satellitt starter ved <c7/>, og filen sier hvor mange timer de avviker. SGP4-elementepoken til Walker-konstellasjonene i typene <c8/> og <c9/> (2018-06-12T00:{ "00" }:00Z), som kjøringene deres også bruker for jordrotasjonen; <c11/> for typen <c10/>; <c13/> eller TLE-epoken for typen <c12/>. Typen <c14/> har ingen kalenderepoke; eksporten datosetter <c15/> som for et banescenario uten en.

seg-ee8eeb47f41b = Satellittene beholder de posisjonsbaserte identifikatorene <c1/>, <c2/>, ... som SP3- og OEM-eksportene gir dem, fordi propagatorene ikke bærer TLE-navnelinjene.

seg-0491624c5f12 = Importer

seg-798f3ae1b77d = GeoJSON-rute.

seg-2a04d7d4bafc = <c1/> (bibliotek: <c2/>) leser den første <c3/> i et GeoJSON-dokument (en bar geometri, en <c4/> eller en <c5/>) og skriver den inn i sporinndataene til <c6/>, <c7/>, <c8/> og <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) før kjøringen. Disse typene flyr <c15/>, så en rute godtas når den er nøyaktig det: de to endepunktene (scenarioets antall <c16/> beholdes), eller tre eller flere posisjoner med jevn avstand på en rett linje i breddegrad og lengdegrad, innenfor { "1e-7" } grad (omtrent { "1" } cm). Enhver annen rute avvises, og feilen navngir posisjonen lengst fra linjen. En rute for en type uten sporinndata avvises med den begrunnelsen. Lengdegrad og breddegrad områdekontrolleres, noe som fanger en fil med breddegrad først.

seg-be9fddebd47a = <b>SigMF-opptak.</b> Blokken <c2/> i typen <c1/> leser et <c3/> / <c4/>-par gjennom <c5/> og plotter Welch-estimatet ved siden av modellen (se <a1>SPECTRUM.md</a1>). Å lese filer er en funksjon i det native bygget; WebAssembly-bygget tar bytes gjennom <c6/>.

seg-f1ca9cee1065 = Hvordan eksportene kontrolleres

seg-afe73c19e369 = <c1/> tolker hver eksport med en validator skrevet ut fra formatets spesifikasjon, ikke med skriverens egen kode:

seg-bdc892a450c0 = CZML: en JSON-tabell der den første pakken er dokumentpakken med en <c1/>; unike pakkeidentifikatorer; hver posisjon oppgir <c2/> <c3/> eller <c4/>; samplede posisjoner er <c5/> med en ISO { "8601" }-epoke og økende tider.

seg-a28abb42c103 = KML: et velformet XML-dokument (Extensible Markup Language) i OGC KML { "2.2" }-navnerommet med ett rotobjekt; skjemaets elementrekkefølge inne i en Placemark; høyst én geometri per Placemark; lukkede lineære ringer på fire eller flere posisjoner; <c1/>-tupler innenfor området; gyldige <c2/>-verdier; <c3/>-er som kan løses opp; en <c4/> med like mange <c5/> som <c6/>, og utvidelsesnavnerommet deklarert.

seg-8e0f4e4c2309 = GeoJSON: lengdegrad først og innenfor området, breddegrad innenfor området, to eller tre tall per posisjon, linjestrenger på to eller flere posisjoner, lukkede ytre ringer mot klokken, ingen segment over { "180" }°-meridianen, ingen <c1/>-medlem, en <c2/>-egenskap på hvert objekt.

seg-57bf7f9291e1 = STK: versjonslinjen <c1/>, en blokk <c2/> / <c3/> med de påkrevde nøkkelordene, <c4/>, <c5/> lik antallet datarader, sju tall per rad, økende tider.

seg-e474c11480d8 = SigMF: <c1/> og <c2/> i <c3/>, tabellene <c4/> og <c5/>, <c6/> på hver opptaksbolk, og en datafil med hele sampler.

seg-82b7b39e7cad = Utover strukturen sammenlignes en satellitt eksportert til CZML og til STK med motorens egen tilstand etter den samme rammereduksjonen, og stemmer til { "1" } mm i posisjon (filene har { "0.1" } mm): mot typen <c1/> sin egen GCRS-utdata, og mot en uavhengig TEME-til-GCRS-propagering av konstellasjonen <c2/>, der hver satellitt er datert med sin egen TLE-epoke lest fra scenarioteksten. To kontroller går utenfor motoren: CZML-posisjonene til den første satellitten i <c3/> stemmer til { "0.1" } m (målt { "2.3" } cm) med den samme TLE-en propagert av Python-pakken <c4/> og redusert til GCRS av ERFA (Essential Routines for Fundamental Astronomy, den åpne implementeringen av IAUs SOFA-bibliotek), og de jordfaste posisjonene til satellittene i <c5/> er lik de kringkastede efemeride-posisjonene i grensesnittspesifikasjonen for Global Positioning System til { "1" } mm. De jordfaste posisjonene i eksporten <c6/> sammenlignes med posisjonene jamming-kjøringen poengsetter, til { "5" } mm. GeoJSON-ruten går rundt gjennom et sporscenario, SigMF-paret leses tilbake til de samme bytene, og hver eksport er byte-deterministisk.

seg-20fbf9a3fba7 = Dette er kontroller mot de publiserte spesifikasjonene og mot motoren selv. Filene er ikke lastet inn i CesiumJS, Google Earth, Ansys STK eller et SDR-verktøy som en del av testsuiten, så hvorvidt en bestemt versjon av disse verktøyene tar imot dem er ikke testet her.

seg-7349c09206ac = Utveksling av bane, attityde og kjerner (bibliotek, { "0.36" })

seg-d5e34188aa96 = Ved siden av formatene for <c1/> la { "0.36" } til bibliotekslesere og -skrivere for standardfilene som verktøy for oppdragsanalyse utveksler. De tar og returnerer tekst eller bytes og berører ingen fil. Hver er en VALIDATED-rad i <a1>verifikasjonsmatrisen</a1>, mot den uavhengige implementeringen som er navngitt der:

seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, med <c2/> for XML-formen): OPM, OMM og OCM i nøkkelord-verdi-notasjon (KVN) og NDM/XML, etter CCSDS 502.0-B-3 (OPM og OMM versjon { "3.0" } og { "2.0" }, OCM { "3.0" }). Kontrollert begge veier mot Orekit: Orekit leser Kshanas filer, og Kshana leser Orekits. Funnene som gjenstår er festet av tester.

seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, med <c2/>): AEM og APM etter CCSDS 504.0-B-2, i KVN og NDM/XML. Kontrollert mot Orekit på samme måte, og postrotasjonene mot Orekits.

seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): skrivere og lesere for NAIF SPK-segmenter av typene { "9" } og { "13" } (med eksport av en CCSDS OEM til en SPK-kjerne) og typene { "3" } og { "21" } (Chebyshev-polynomer og utvidede differanselinjer), kontrollert mot NAIF SPICE-verktøykassens egne lesere, ned til byte-identitet. Kshana skriver segmentene fra postene den får: den tilpasser ikke Chebyshev-koeffisienter og lager ikke differanselinjer.

seg-bb97cbb1ab9f = Importøren og skriveren for CCSDS OEM, og OEM-kovariansblokken, er eldre og beskrives under importene ovenfor og i matrisen.

seg-8932eba75c68 = Bare typene i tabellen nedenfor eksporterer geometri. Typer der geometrien er sentrert om Månen, Mars eller et annet legeme eksporteres ikke: CZML, KML og GeoJSON beskriver posisjoner om Jorden, og denne utgivelsen skriver bare STK-filer med <c1/>, selv om selve STK-formatet tillater andre sentrallegemer.

seg-a0593ad77202 = <c1/>, <c2/> og <c3/> har jordreferert geometri som denne utgivelsen ikke eksporterer; tabellen gir årsaken for hver.

seg-2bb9237839f3 = Typen <c1/> flyr banen sin i et flatt lokalt tangentplan, så bare planets opprinnelse eksporteres, ikke banen.

seg-6049ab4ca3c9 = Jordfaste satellittposisjoner ser bort fra UT1−UTC og polbevegelse (se Referansesystemer og tid); KML-høyder er ellipsoidiske, ikke over middelhavsnivå.

seg-4dda05aefd2b = Fotavtrykk forutsetter frirom-propagering, en jammer ved mottakerens horisont og en kuleformet Jord for sirkelen.

seg-2dd0656c518f = Hver scenariofil

seg-e024f5c1cab1 = Hva <c1/> gjør for hver fil i <c2/> (suitemanifestet er ikke et scenario og er utelatt). «yes» betyr at formatet skrives og består validatoren; ellers peker tallet på årsaken. Generert av <c3/>; <c4/> feiler når den er utdatert.

seg-c27f67dfbb37 = no [{ "1" }]

seg-3468244e2385 = no [{ "2" }]

seg-d0cf3f74cd10 = no [{ "3" }]

seg-62c880979169 = no [{ "4" }]

seg-9229b499c702 = no [{ "5" }]

seg-d9d6561c9e5b = no [{ "6" }]

seg-7d4a6538c638 = no [{ "7" }]

seg-f170ed4d8dca = no [{ "8" }]

seg-1c5eb5dca942 = no [{ "9" }]

seg-a930bb0d2e42 = no [{ "10" }]

seg-236853169f42 = no [{ "11" }]

seg-411e4f3aeae7 = no [{ "12" }]

seg-34fabcbb82f2 = no [{ "13" }]

seg-772bd344bbce = no [{ "14" }]

seg-460fd74c7c7e = no [{ "15" }]

seg-e1d91ce54b8b = no [{ "16" }]

seg-f3e0486f02e3 = no [{ "17" }]

seg-884160b0ed12 = no [{ "18" }]

seg-8202f4a426b0 = no [{ "19" }]

seg-a4e9a36289e5 = no [{ "20" }]

seg-034364e38105 = no [{ "21" }]

seg-3e3b6ecc7b43 = Hvorfor et format ikke gjelder:

seg-d7bd20cb8710 = typene <c1/> og <c2/> planlegger nedlinjekontakter og koding; eksporter et <c3/>-scenario for den samme satellitten og stasjonen for å se geometrien

seg-f587b4df1635 = SigMF holder komplekse basebåndsampler, som bare typen <c1/> syntetiserer

seg-d102fb18ce8d = typen <c1/> simulerer attityde om massesenteret uten bane eller bakkeposisjon, så det er ingenting å plassere på Jorden

seg-ecc0e31b0369 = scenarioinndataene har ingen horisontal posisjon (ingen breddegrad og lengdegrad, ingen jordsentrerte koordinater, ingen baneelementer utover høyst en høyde), så det er ingenting å plassere på Jorden

seg-2e0825b27359 = typene <c1/> og <c2/> beregner budsjetter uten jordposisjon

seg-1f17b963c7a6 = en STK-efemeride beskriver et kjøretøys posisjon og hastighet mot tid; denne scenen har bare faste punkter eller tidsløse spor (et fast punkt er en STK Facility, ikke en efemeride)

seg-f79d0ce7b945 = ingen av medlemsscenarioene i campaign-en har noe dette formatet beskriver; eksporter et medlem for seg for å se årsaken

seg-08b7e027318a = typen <c1/> analyserer signalutforminger (spektre, sporing, innhenting, kompatibilitet) uten satellitt- eller brukerposisjon; eksporter scenarioet <c2/> eller <c3/> som flyr utformingen

seg-31c8acef1aed = ikke eksportert i denne utgivelsen: de fusjonerte posisjoneringstypene plasserer satellittene sine i et jordfast system i forhold til en epoke de aldri navngir, så en tidsmerket eksport måtte funnet på kalenderdatoen (eksporter scenarioet <c1/> eller <c2/> i stedet)

seg-3c57b084f0d7 = typens geometri er sentrert om Månen, Mars eller et annet legeme i solsystemet; CZML, KML og GeoJSON beskriver posisjoner på eller om Jorden, og denne utgivelsen skriver bare STK-efemerider med CentralBody Earth

seg-2edebe91839c = ikke eksportert i denne utgivelsen: <c1/> plasserer satellittene sine i et legemefast system i forhold til en epoke den aldri navngir, så en tidsmerket eksport måtte funnet på kalenderdatoen

seg-951ac7c5f138 = ikke eksportert i denne utgivelsen: konstellasjonen av jordens Global Navigation Satellite System (GNSS) i <c1/> sees fra en mottaker på månens avstand, hvis bane typen ikke tilbyr som en tidsserie

seg-3cf7f7460c55 = ikke eksportert i denne utgivelsen: typen <c1/> rapporterer toppbelastninger og oppvarming, og beholder ikke noe tidsmerket sporet på jorden

seg-cfc3df59e5c8 = typen <c1/> sveiper tilgjengelighet og linkstyrke for en bruker på et skall eller en keplersk bane; den har ingen enkeltposisjon å plassere på et kart

seg-6271953188bd = scenarioet <c1/> oppgir oppskytingsstedets breddegrad, men ingen lengdegrad, så stedet kan ikke plasseres

seg-c9a63dfb34db = ikke eksportert i denne utgivelsen: referansebanen i <c1/> er en tilpasningsreferanse der jordrotasjonsvinkelen ved epoken er en inndata (<c2/>, standard { "0" }), ikke utledet fra kalenderdatoen, så de jordfaste posisjonene er ikke knyttet til en dato

seg-a03c2f0426db = dette spektrumscenarioet har ingen [iq]-blokk, så ingen sampler syntetiseres for opptak

seg-d75f8ad6903a = ikke eksportert i denne utgivelsen: <c1/> leser og skriver en Orbit Ephemeris Message fra CCSDS (Consultative Committee for Space Data Systems), som i seg selv er efemeridens utvekslingsfil

seg-fdbaf96ecf3e = typen <c1/> beregner linkstatistikk for bakkesteder uten tidsmerket geometri å plassere

seg-146a2e8ee590 = scenarioet sveiper et annet scenario over et rutenett; eksporter det sveipede scenarioet for seg

seg-b74484e3586b = typen <c1/> beregner et linkbudsjett og stabiliteter, uten tidsmerket geometri å plassere

seg-bcd613e62c69 = <s1>Forrige</s1>Animasjonseksport

seg-0525f7fbbfd2 = <s1>Neste</s1>Valideringsstatus

seg-53a778722c16 = STK .e
