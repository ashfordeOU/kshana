# docs--optical-atmosphere: translations (da)

seg-6cb7a787ac67 = Referencer

seg-1c6199627b90 = Data

seg-ad856ad710eb = Status

seg-53a7343c076e = Påstand

seg-508588352e96 = Kilde: <c1/>

seg-333a1114746a = Optisk PNT gennem atmosfæren

seg-47118f54f060 = Scenarietypen <c1/> besvarer, hvor ofte et optisk link til jorden virker, hvorfor det svigter, hvilken margin eller teknik der ville hjælpe, og hvad et ur gør, mens det er nede.

seg-06db0ea8f428 = Kshana er kun analysesiden. Den kører ikke et forsøg med en optisk jordstation og nævner ingen målepartner. Typen er <b>MODELLED</b>: dens numerik er kontrolleret mod et uafhængigt program, men ingen målt tilgængelighedsoptegnelse er sammenlignet, og hvert vejr-, teknik- og urinput er en antagelse. Det er en vejledende analyse, ikke et certificeret tilgængeligheds-, integritets- eller navigationsprodukt.

seg-83c16fd89005 = Begge medfølgende scenarier bærer ILLUSTRATIVE skyklimaer. De er input, ikke målinger og ikke noget datasæts værdier.

seg-e9dbbd9cfa32 = Én seedet realisering af linkmarginen for stedet 'northern' over { "336" } t, fra en rigtig kørsel af motor v{ $version } på scenarios/optical-atmosphere-network.toml (seed { "37" }, et trin på { "600" } s). Marginen falder under nul under skyepisoder; i dette træk er linket oppe { "40.5" } % af tiden, med { "27" } udfald og et længste udfald på { "30.7" } t. Inputtene er illustrative, serien er ét træk fra modellen og ikke klimaet, og den afviger fra den statistiske tilgængelighed ({ "37.8" } %) med trækkets stikprøvefejl. Kun vejledende analyse: ikke et certificeret tilgængeligheds-, integritets- eller navigationsprodukt og ikke en forudsigelse for noget rigtigt sted, medmindre dets klimainput kommer fra et angivet datasæt.

seg-13a52dfbd8d1 = Hvad der beregnes

seg-46fbaf0c6a12 = <b>Tab i klar luft</b> ved bølgelængden og elevationen: aerosolekstinktion fra Kim-, McArthur- og Korevaar-synlighedsloven, eksponentiel i højden, plus Rayleigh-spredning og et angivet input for gasabsorption. Dette erstatter det enkelte samlede <c1/> i <c2/>, når en atmosfære er angivet. Uden en er linkbudgettet bitidentisk med { "0.36" } (præregistreret tærskel A5).

seg-929c80326b41 = <b>Turbulens.</b> En Hufnagel–Valley-profil <c1/> (som standard HV 5/7) integreret langs den skrå vej giver Rytov-variansen for plan eller sfærisk bølge, uplink eller downlink. Heraf kommer Andrews–Phillips-scintillationsindekset, gamma-gamma-parametrene, aperturmiddelværdifaktoren ved svag turbulens (Churnside) og gamma-gamma-fadingsandsynligheden og fadingmarginen. Aperturmiddelværdi anvendes ved momentmatchning: scintillationsindekset skaleres med middelværdifaktoren, og begge logvarianser skaleres om, så de giver det præcist.

seg-3fb7be7ef95d = <b>Skyer.</b> Et steds skyklima har ITU-R P.840-formen: en sandsynlighed for sky og, givet sky, en lognormal vandsøjle af flydende vand. P.840 leverer mængden af sky. Dæmpningen er den geometrisk-optiske optiske dybde <c1/>, fordi P.840's egen dæmpningslov er en mikrobølgelov og ikke gælder ved { "0.85" } til { "1.55" } µm, hvor dråberne er langt større end bølgelængden.

seg-18311430b2a3 = <b>Tilgængelighed</b> for et sted: linket er oppe, så længe sky- og turbulensfadingen tilsammen holder sig inden for den margin, der er tilbage efter tabet i klar luft. Sky og turbulens regnes som uafhængige. Rapporten angiver tilgængeligheden, tilgængeligheden ved klar himmel, det <b>loft</b>, ingen margin kan løfte (et optisk link kan ikke passere tyk sky), og den ekstra margin, der kræves for hvert tilgængelighedsmål, eller <c1/>, hvis målet ligger over loftet.

seg-885e06050a9a = <b>Udfald.</b> Varigheder er lognormale med en angivet middelværdi og spredning. Rapporten angiver udfald pr. år, varigheden ved medianen, 90. og 99. percentil samt sandsynligheden og andelen af udfaldstiden ud over { "1" }, { "6" }, { "24" } og { "72" } timer.

seg-4b9b6fefad6b = <b>Stedsdiversitet.</b> De bedste <c1/> steder kombineret med uafhængigt vejr (<c2/>) og med afstandskorreleret vejr: parkorrelation <c3/>, kombineret i en énfaktors gaussisk copula. Ved <c4/> er det den uafhængige forening, og ved fuld korrelation det bedste enkelte sted.

seg-b85681b9fd93 = <b>Teknikker.</b> Hver <c1/> er et hvad-nu-hvis: en ny bølgelængde (budgettet ved klar himmel, tabet i klar luft og aperturmiddelværdien beregnes igen), en ny modtageapertur, en angivet brøkdel af scintillationsreduktion (adaptiv optik) og ekstra margin. Resultatet er tilgængelighedsgevinsten over baselinen på samme sted. Kshana modellerer ikke en adaptiv-optik-sløjfe, så gevinsterne er input.

seg-a59d07280524 = <b>Tidssynkronisering og afstandsmåling gennem et udfald.</b> Hver udfaldsvarighed afbildes gennem den lukkede formel for udløbsvariansen i urets holdover-model for de ure, der er opført i <c1/>. Rapporten angiver fejlen i tidssynkronisering og afstandsmåling ved angivne udfaldsvarigheder, holdover til tidssynkroniseringstærsklen, andelen af udfald inden for den og tilgængeligheden af tidssynkronisering <c2/>. Klassens potenslovsgulve er holdover-modulets syntetiserede, så en stram tærskel styres af det antagne gulv, som <c3/> angiver.

seg-59774a9e8685 = Linkmargin over for tid ({ "0.38" })

seg-fcfdd2e9e0ad = En <c1/>-tabel (<c2/> op til { "8760" }, <c3/>, <c4/>) tilføjer til hvert sted én <b>seedet realisering</b> af modellen ovenfor: sigtelinjen veksler mellem klare perioder (eksponentielle, middelværdi sat, så andelen af tiden i sky er den angivne <c5/>) og skyudfald (lognormale, den angivne middelværdi og spredning); hvert udfald trækker én vandsøjle af flydende vand fra det angivne klima og holder den; hvert trin trækker én gamma-gamma-scintillationsprøve (uafhængig fra trin til trin, en angivet forenkling), og terminalen er på mål med den angivne pegetilgængelighed. Trinnets margin er fadingbudgettet minus sky- og scintillationsfadingen, og linket er oppe, når marginen ikke er negativ, og terminalen er på mål, den betingelse tilgængelighedsintegralet bruger.

seg-ad2c4ff087a8 = Det er et træk, ikke klimaet: dets tilgængelighed afviger fra den statistiske med trækkets stikprøvefejl, og den første episode trækkes hel. Resultatet bærer <c1/>, <c2/>, <c3/> og <c4/> pr. trin og en <c5/>-blok (tilgængelighed, skyandel, antal udfald, længste udfald). <b>MODELLED</b>; kontrollerne (<c6/>, tærskler fastsat i <c7/> før den første kørsel) er determinisme og konsistens med de angivne tal, ikke en ekstern uafhængig reference. Uden tabellen skrives intet, og resultatet er { "0.37" }-dokumentet.

seg-4a9b065bdb28 = Scenariefelter

seg-4ba70196355d = Alle felter på øverste niveau er valgfrie. En bar <c1/> kører tre illustrative steder. Se de to medfølgende filer for hver nøgle: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-b7619573e112 = Verifikationsstatus

seg-6598ced4218b = Rytov-varians, scintillationsindeks, gamma-gamma-fadingsandsynlighed, aperturmiddelværdifaktor, sky og optisk dybde i klar luft beregnes, som de angivne formler siger

seg-2442f7529fbb = MODELLED række; numerikken er kontrolleret mod et uafhængigt mpmath-program

seg-19854ea8437a = tærsklerne A1 til A3, alle nået (<c1/>)

seg-b91d83aea0e8 = Linkbudget og eksisterende tilgængelighed er uændrede uden en atmosfære

seg-2192262e26c1 = nået

seg-a71527a271df = tærskel A5, bitidentisk over { "1,000" } parametersæt

seg-0db8cf4c2ee0 = Diversitetsgrænser og monotoni; holdover-kobling bitnøjagtig

seg-2a5c5967540c = nået (identiteter)

seg-4b0e5e3ac558 = tærsklerne A4, A6

seg-f842c688e29a = Tilgængelighed for et rigtigt sted, rigtig scintillation, rigtig skystatistik

seg-9a0ead7b1670 = der gøres ikke krav på det

seg-9cc220190772 = ingen ekstern uafhængig reference blev sammenlignet

seg-7c5050135e2b = Den uafhængige reference kontrollerer implementeringen af de angivne formler, ikke atmosfæren, så ingen række er VALIDATED. ITU-R-valideringsværdier bruges ikke og holdes uden for repositoriet.

seg-73dcf0f31fe9 = Intet vejrdatasæt er medleveret. Skyklimainput til et rigtigt sted ville komme fra et offentligt datasæt (Copernicus ERA5, NASA MODIS eller ISCCP); hvert datasæts licens skal læses og registreres før brug, og rådata hentes ved testtidspunktet med en fastlåst SHA-256. Den ene klimatologi, der allerede findes i repositoriet, er Cavazzani et al.-tabellen for klare nætter, som bruges af <c1/>.

seg-44d197f3209c = Andrews og Phillips, <em>Laser Beam Propagation through Random Media</em>, 2. udg. (Rytov-varians, scintillationsindeks, gamma-gamma-parametre).

seg-9e9a33d44013 = Kim, McArthur og Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (synlighedslov).

seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (aperturmiddelværdifaktor).

seg-309c70f2f4f8 = ITU-R P.840 (statistik for skyers flydende vand), P.1814 og P.1817 (metoder til optik i fri luft).

seg-83b30e1ca261 = <s1>Forrige</s1>Bevispakker

seg-1474b58fb35a = <s1>Næste</s1>Slottidssynkronisering
