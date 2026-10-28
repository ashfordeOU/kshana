# docs--optical-atmosphere: translations (nb)

seg-6cb7a787ac67 = Referanser

seg-1c6199627b90 = Data

seg-ad856ad710eb = Status

seg-53a7343c076e = Påstand

seg-508588352e96 = Kilde: <c1/>

seg-333a1114746a = Optisk PNT gjennom atmosfæren

seg-47118f54f060 = Scenariotypen <c1/> besvarer hvor ofte en optisk lenke til bakken virker, hvorfor den svikter, hvilken margin eller teknikk som ville hjelpe, og hva en klokke gjør mens den er nede.

seg-06db0ea8f428 = Kshana er bare analysesiden. Den kjører ikke et eksperiment med optisk bakkestasjon, og den navngir ingen målepartner. Typen er <b>MODELLED</b>: tallbehandlingen er kontrollert mot et uavhengig program, men ingen målt tilgjengelighetsrekke er sammenlignet, og hver vær-, teknikk- og klokkeinndata er en antagelse. Det er en veiledende analyse, ikke et sertifisert tilgjengelighets-, integritets- eller navigasjonsprodukt.

seg-83c16fd89005 = Begge de medfølgende scenarioene bærer ILLUSTRATIVE skyklimaer. De er inndata, ikke målinger og ikke noe datasetts verdier.

seg-e9dbbd9cfa32 = Én seedet realisering av lenkemarginen til stedet «northern» over { "336" } t, fra en ekte kjøring av motor v{ $version } på scenarios/optical-atmosphere-network.toml (seed { "37" }, et steg på { "600" } s). Marginen faller under null under skyepisoder; i dette trekket er lenken oppe { "40.5" } % av tiden, med { "27" } avbrudd og et lengste avbrudd på { "30.7" } t. Inndataene er illustrative, serien er ett trekk fra modellen og ikke klimaet, og den avviker fra den statistiske tilgjengeligheten ({ "37.8" } %) med trekkets samplingsfeil. Kun veiledende analyse: ikke et sertifisert tilgjengelighets-, integritets- eller navigasjonsprodukt, og ikke en prediksjon for noe reelt sted med mindre klimainndataene kommer fra et oppgitt datasett.

seg-13a52dfbd8d1 = Hva som beregnes

seg-46fbaf0c6a12 = <b>Tap i klar luft</b> ved bølgelengden og elevasjonen: aerosolekstinksjon fra Kim-, McArthur- og Korevaar-siktloven, eksponentiell i høyde, pluss Rayleigh-spredning og en oppgitt inndata for gassabsorpsjon. Dette erstatter det enkle samlede <c1/> i <c2/> når en atmosfære er oppgitt. Uten en er lenkebudsjettet bit-identisk med { "0.36" } (forhåndsregistrert terskel A5).

seg-929c80326b41 = <b>Turbulens.</b> En Hufnagel–Valley-<c1/>-profil (HV 5/7 som standard) integrert langs skråbanen gir Rytov-variansen for plan eller sfærisk bølge, opplink eller nedlink. Fra den kommer Andrews–Phillips-scintillasjonsindeksen, gamma-gamma-parametrene, aperturmiddelingsfaktoren for svak turbulens (Churnside) og gamma-gamma-fadingsannsynligheten og fadingmarginen. Aperturmiddeling anvendes ved momentmatching: scintillasjonsindeksen skaleres med middelingsfaktoren, og begge logvariansene skaleres om slik at den gis nøyaktig.

seg-3fb7be7ef95d = <b>Sky.</b> Et steds skyklima har ITU-R P.840-formen: en sannsynlighet for sky og, gitt sky, en lognormal væskevannskolonne. P.840 gir mengden sky. Dempingen er den geometrisk-optiske optiske dybden <c1/>, fordi P.840s egen dempingslov er en mikrobølgelov og ikke gjelder ved { "0.85" } til { "1.55" } µm, der dråpene er langt større enn bølgelengden.

seg-18311430b2a3 = <b>Tilgjengelighet</b> for et sted: lenken er oppe så lenge sky- og turbulensfadingen sammen holder seg innenfor marginen som er igjen etter tapet i klar luft. Sky og turbulens regnes som uavhengige. Rapporten gir tilgjengeligheten, tilgjengeligheten ved klar himmel, <b>taket</b> ingen margin kan løfte (en optisk lenke kommer ikke gjennom tykk sky), og den ekstra marginen som trengs for hvert tilgjengelighetsmål, eller <c1/> hvis målet ligger over taket.

seg-885e06050a9a = <b>Avbrudd.</b> Varighetene er lognormale med et oppgitt gjennomsnitt og en oppgitt spredning. Rapporten gir avbrudd per år, varigheten ved medianen, 90. og 99. persentil, og sannsynligheten og andelen av avbruddstiden utover { "1" }, { "6" }, { "24" } og { "72" } timer.

seg-4b9b6fefad6b = <b>Stedsdiversitet.</b> De beste <c1/> stedene kombinert med uavhengig vær (<c2/>) og med avstandskorrelert vær: parkorrelasjon <c3/>, kombinert i en énfaktors gaussisk kopula. Ved <c4/> er det den uavhengige unionen, og ved full korrelasjon det beste enkeltstedet.

seg-b85681b9fd93 = <b>Teknikker.</b> Hver <c1/> er et hva-hvis: en ny bølgelengde (klarhimmelbudsjettet, tapet i klar luft og aperturmiddelingen vurderes på nytt), en ny mottaksapertur, en oppgitt brøkdelsreduksjon av scintillasjonen (adaptiv optikk) og ekstra margin. Resultatet er tilgjengelighetsgevinsten over grunnlinjen på samme sted. Kshana modellerer ikke en adaptiv optikk-sløyfe, så gevinstene er inndata.

seg-a59d07280524 = <b>Tidssynkronisering og avstandsmåling gjennom et avbrudd.</b> Hver avbruddsvarighet avbildes gjennom den lukkede formen for utløpsvariansen i klokkens holdover-modell, for klokkene som er oppført i <c1/>. Rapporten gir tidssynkroniserings- og avstandsfeilen ved oppgitte avbruddsvarigheter, holdover til tidsterskelen, andelen avbrudd innenfor den, og tidssynkroniseringstilgjengeligheten <c2/>. Klassegulvene for potenslov er de syntetiserte fra holdover-modulen, så en stram terskel styres av det antatte gulvet, slik <c3/> oppgir.

seg-59774a9e8685 = Lenkemargin mot tid ({ "0.38" })

seg-fcfdd2e9e0ad = En <c1/>-tabell (<c2/> opptil { "8760" }, <c3/>, <c4/>) legger til hvert sted én <b>seedet realisering</b> av modellen ovenfor: siktlinjen veksler mellom klare perioder (eksponentielle, gjennomsnitt satt slik at andelen tid i sky er den oppgitte <c5/>) og skyavbrudd (lognormale, oppgitt gjennomsnitt og spredning); hvert avbrudd trekker én væskevannskolonne fra det oppgitte klimaet og holder den; hvert steg trekker ett gamma-gamma-scintillasjonssampel (uavhengig fra steg til steg, en oppgitt forenkling) og terminalen er på mål med den oppgitte pekingstilgjengeligheten. Stegets margin er fadingbudsjettet minus sky- og scintillasjonsfadingen, og lenken er oppe når marginen ikke er negativ og terminalen er på mål, betingelsen tilgjengelighetsintegralet bruker.

seg-ad2c4ff087a8 = Det er et trekk, ikke klimaet: tilgjengeligheten avviker fra den statistiske med trekkets samplingsfeil, og den første episoden trekkes hel. Resultatet bærer <c1/>, <c2/>, <c3/> og <c4/> per steg og en <c5/>-blokk (tilgjengelighet, skyandel, antall avbrudd, lengste avbrudd). <b>MODELLED</b>; kontrollene (<c6/>, terskler fastsatt i <c7/> før første kjøring) er determinisme og konsistens med de oppgitte tallene, ikke en ekstern uavhengig referanse. Uten tabellen skrives ingenting, og resultatet er dokumentet fra { "0.37" }.

seg-4a9b065bdb28 = Scenariofelt

seg-4ba70196355d = Alle felt på øverste nivå er valgfrie. En bar <c1/> kjører tre illustrative steder. Se de to medfølgende filene for hver nøkkel: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-b7619573e112 = Verifikasjonsstatus

seg-6598ced4218b = Rytov-varians, scintillasjonsindeks, gamma-gamma-fadingsannsynlighet, aperturmiddelingsfaktor, sky og optisk dybde i klar luft beregnes slik de oppgitte formlene sier

seg-2442f7529fbb = MODELLED-rad; tallbehandlingen er kontrollert mot et uavhengig mpmath-program

seg-19854ea8437a = terskler A1 til A3, alle nådd (<c1/>)

seg-b91d83aea0e8 = Lenkebudsjett og eksisterende tilgjengelighet uendret uten atmosfære

seg-2192262e26c1 = nådd

seg-a71527a271df = terskel A5, bit-identisk over { "1,000" } parametersett

seg-0db8cf4c2ee0 = Diversitetsgrenser og monotonitet; holdover-kobling bit-eksakt

seg-2a5c5967540c = nådd (identiteter)

seg-4b0e5e3ac558 = terskler A4, A6

seg-f842c688e29a = Tilgjengelighet for et reelt sted, reell scintillasjon, reell skystatistikk

seg-9a0ead7b1670 = påstås ikke

seg-9cc220190772 = ingen ekstern uavhengig referanse ble sammenlignet

seg-7c5050135e2b = Den uavhengige referansen kontrollerer implementasjonen av de oppgitte formlene, ikke atmosfæren, så ingen rad er VALIDATED. ITU-R-valideringsverdier brukes ikke og holdes utenfor depotet.

seg-73dcf0f31fe9 = Ingen værdatasett følger med. Skyklimainndata for et reelt sted ville komme fra et offentlig datasett (Copernicus ERA5, NASA MODIS eller ISCCP); hvert datasetts lisens må leses og registreres før bruk, og rådata hentes ved testtidspunktet med en festet SHA-256. Den ene klimatologien som allerede ligger i depotet, er tabellen over klare netter fra Cavazzani et al. som brukes av <c1/>.

seg-44d197f3209c = Andrews og Phillips, <em>Laser Beam Propagation through Random Media</em>, 2. utg. (Rytov-varians, scintillasjonsindeks, gamma-gamma-parametre).

seg-9e9a33d44013 = Kim, McArthur og Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (siktlov).

seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (aperturmiddelingsfaktor).

seg-309c70f2f4f8 = ITU-R P.840 (statistikk for skyens væskevann), P.1814 og P.1817 (metoder for frirom-optikk).

seg-83b30e1ca261 = <s1>Forrige</s1>Bevispakker

seg-1474b58fb35a = <s1>Neste</s1>Tidsluker

seg-50f25bceca3c = <s1>Forrige</s1>Datapartnere og opprykk av rader
