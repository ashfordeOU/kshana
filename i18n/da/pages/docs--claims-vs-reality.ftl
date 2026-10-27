# docs--claims-vs-reality: translations (da)

seg-a47934361f43 = NMEA-strømme til træning af besætninger

seg-ee2e250497f9 = Eksport til testbænk

seg-2bd2101ce454 = Flade

seg-ad856ad710eb = Status

seg-98d0bc6b40ce = Kortlægning af compliance mod offentlige rammeværker

seg-80f3f0aae42c = Interferenskort

seg-28b1885c4ca7 = Kilde: <c1/>

seg-bf5c2811ce29 = Påstande mod virkelighed — register over overdrevne påstande

seg-592e007bc3cf = En uafhængig revision af en tidligere Kshana-version katalogiserede fjorten <b>overdrevne påstande</b> (<c1/>…<c2/>): steder, hvor en offentlig flade (README, playground, labels for kvalitetsmål (FoM), scenariepakker) beskrev en funktion stærkere, end koden leverede. Denne side er lukningsregisteret: hver række angiver den oprindelige overdrevne påstand, hvordan den blev løst, og belægget. To slags løsninger forekommer:

seg-39250970dbbf = <b>Påstand trukket tilbage</b> — formuleringen blev rettet, så den passer til koden (ærlig omformulering, ingen ændring af funktion). "Nul kode = nul påstand."

seg-fb7da0f79ead = <b>Erstattet</b> — den reelle funktion blev efterfølgende bygget og testet, så den stærke påstand blev <em>korrekt</em>.

seg-5292f7162e2b = En regressionsvagt (<c1/>) gennemsøger de aktuelle offentlige flader (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> og forsiderne for crates.io, PyPI (Python Package Index) og npm <c8/>, <c9/>, <c10/>) ved hver CI-kørsel (continuous integration) og fejler, hvis en af de udgåede nøgne formuleringer af overdrevne påstande dukker op igen uden forbehold — så en række ikke i det skjulte kan falde tilbage fra GREEN.

seg-dafc6f322f34 = Alle fjorten rækker er <b>GREEN</b>.

seg-5cf7bf2d1889 = OC (overdreven påstand)

seg-0e01d4053d7f = Oprindelig overdreven påstand

seg-36bf87638923 = Løsning

seg-70a952c4150b = "fælles Kalman-fusionsestimator" antydede ét filter med krydskovarians; koden kørte to uafhængige estimatorer

seg-d5682a7fdb11 = <b>Erstattet</b> — et ægte Kalman-filter for ur+position koblet med krydskovarians blev bygget

seg-1008020cd9e4 = <c1/> ({ "7" } tests, herunder et ensemble på 100 forsøg koblet mod afkoblet, der kræver, at den koblede positions-RMS (root mean square) er under { "0.6" }× den afkoblede, og at det koblede filter vinder i mindst { "90" } af de { "100" } forsøg); CAPABILITY "Sensor fusion" → fuld

seg-334fc345d501 = "urstøttet RAIM til spoof-detektering (receiver autonomous integrity monitoring)" antydede en RAIM-detektor med flere satellitter

seg-cf0795c2ee02 = <b>Påstand trukket tilbage → Erstattet</b> — omformuleret som en grænse for detekterbarhed af spoofing ud fra urstabilitet; den rigtige RAIM/ARAIM (HPL/VPL (HPL: vandret beskyttelsesniveau; VPL: lodret beskyttelsesniveau)) kom derefter

seg-f46432acbfa0 = <c1/> ({ "30" } tests — snapshot + solution-separation-ARAIM, HPL/VPL, FDE (fejldetektering og -udelukkelse), Stanford-diagrammer); <c2/>

seg-8b47f69dbb76 = "jamming-demonstrator" uden nogen jamming-kode bag sig

seg-bfff34d5a250 = <b>Erstattet</b> — en jamming-model med link-budget J/S → effektiv C/N₀ → tab af lås blev bygget

seg-5f75628b8201 = <c1/> ({ "10" } tests); README-rækken "Resilience"

seg-bae512770cd6 = "Fuld IMU-støjmodel med Allan-varians på en IMU-triade" — modellen var énakset

seg-50c0b5855cb9 = <b>Påstand trukket tilbage → Erstattet</b> — omformuleret som et 1-DOF-fejlbudget (DOF: frihedsgrad); en treaksed strapdown-INS (inertial navigationssystem) blev derefter leveret

seg-501bf7d8fff0 = <c1/> treaksed strapdown (kvaternion-attitude, NED-mekanisering (nord-øst-ned), coning/sculling); ROADMAP "Inertial"

seg-ad250a99b05f = "Hybrid PNT-integration (positionering, navigation og tidssynkronisering)" antydede et koblet GNSS/INS-filter (GNSS: globalt satellitnavigationssystem); det var et fejlbudget for dødregning

seg-85fb58d37a5d = <b>Påstand trukket tilbage → Erstattet</b> — omformuleret som dødregning med en konfigurerbar genopnåelse af lås; ægte tæt koblet GNSS/INS-fusion blev derefter leveret

seg-9e6b092d5656 = <c1/> (UKF med 17 tilstande (unscented Kalman-filter) med dødregning med kvante-CAI (CAI: koldatom-interferometer)); CAPABILITY "Sensor fusion" → fuld

seg-46a637f8e967 = "valideret ~{ "2" }%" antydede en stram, håndhævet grænse

seg-5e98d7664558 = <b>Påstand trukket tilbage</b> — <c1/> angiver den <em>håndhævede</em> grænse ({ "20" }–{ "25" }%, midlet over seeds); "~{ "2" }%" betegnede en typisk observation, ikke grænsen

seg-84f4fcdc7e50 = <c1/>, overskriften "On tolerances"

seg-85ec2fe9c7f7 = "deterministisk på tværs af platforme" uden committet belæg

seg-6e516f04db89 = <b>Påstand trukket tilbage</b> — værktøjskæden pinnet til en eksakt udgivelse; golden-hashes pr. scenarie committet med en reproducerbarhedsgate. (Bit-identisk <em>på tværs af</em> OS/arkitektur (OS: operativsystem) er stadig et åbent punkt, angivet ærligt.)

seg-9db327be56c3 = <c1/> (kanal <c2/>); <c3/> (numeriske værdier til { "1e-6" }); <c4/> (hash af hvert resultats inputfingeraftryk og form, kørt på CI-matricen for Linux, macOS og Windows); <c5/>

seg-2708139388ed = "hybrid kvante-klassisk PNT-simulator" antydede kvantefysik fra første principper

seg-717167714e83 = <b>Påstand trukket tilbage → Erstattet</b> — omformuleret som en simulator af PNT-robusthed, der bruger ydelsesmodeller for kvantesensorer; derefter kom Mach–Zehnder-CAI-fysik fra første principper

seg-c67fb22add4b = <c1/> ({ "26" } tests — Mach–Zehnder-fase, projektionsstøj <c2/>, vibrationsoverføringsfunktion, systematiske effekter fra Coriolis + AC-Stark (AC: vekselstrøm)); <c3/>

seg-5c6b7d4f2029 = Kvalitetsmålet "Integrity Performance" antydede luftfartsintegritet med HPL/VPL/RAIM

seg-ee5487da890c = <b>Påstand trukket tilbage + Erstattet (i lag)</b> — kvalitetsmålet pr. kørsel for scenariet er ærligt betegnet <em>filterets selvkonsistens</em> (<b>ikke</b> luftfartsintegritet); den rigtige ARAIM HPL/VPL vises <em>separat</em>, så de to aldrig blandes sammen

seg-31aacdf17b02 = <c1/> (<c2/>: selvkonsistens, med forbehold); <c3/> + <c4/> (ægte ARAIM)

seg-0686fa147c96 = Kvalitetsmålet Sikkerhed præsenteret som altid meningsfuldt, også uden angreb

seg-d6d9296422fc = <b>Påstand trukket tilbage</b> — kvalitetsmålet Sikkerhed (<c1/>) er rammesat inden for spoof-detektorens kontekst og er kun meningsfuldt, når et angrebsscenarie er konfigureret

seg-8f7b211b5a0c = README-rækken "Resilience"; kvalitetsmålet Sikkerhed er defineret ved det operationelt skadelige specifikationspunkt

seg-d66421174e94 = Kvalitetsmålet "Positioning Performance" antydede fuld nøjagtighed i positionsdomænet

seg-9eeb13a16350 = <b>Påstand trukket tilbage</b> — betegnet som en 1-DOF-størrelse <c1/> for de inertiale/hybride pakker, eksplicit <b>ikke</b> en 2-D CEP/2DRMS (CEP: cirkulær sandsynlig fejl) eller DOP-vægtet (DOP: præcisionsfortynding) nøjagtighed

seg-e8115df73c10 = README-tabellen over kvalitetsmål (rækken "Positioning Performance")

seg-5c73759a2454 = tal for inertialt kvalitetsmål læst som ensemblestatistik ud fra enkelte seeds

seg-3db3a41ce848 = <b>Påstand trukket tilbage</b> — en enkelt kørsel flages med <c1/>; <c2/> rapporterer middelværdi/spredning/bootstrap-konfidensinterval på { "95" }%

seg-bf737455e6f2 = README-tabellen over kvalitetsmål; envelope-tests for scenariedækning

seg-aa362992b5da = scenariet "SGP4 (Simplified General Perturbations { "4" }) GPS (Global Positioning System)-konstellation" brugte syntetiske pladsholder-TLE'er (elementsæt på to linjer)

seg-ebae20813a52 = <b>Erstattet</b> — scenariet indlejrer nu et ægte, datostemplet Celestrak-snapshot <c1/> med strenge kontrolsummer

seg-2d49f6101571 = <c1/> (ægte <c2/>, <c3/>); <c4/>

seg-cdefa4ee436a = README-versionsstrengen drev fra <c1/>

seg-8e66b9485565 = <b>Påstand trukket tilbage</b> — en CI-gate hævder, at README-statusbadgen passer til <c1/>

seg-347fd8c1f334 = { "0.35" }: påstande holdt snævre og én rettelse

seg-946ff389cec5 = Funktionerne i version { "0.35" } blev skrevet med deres grænser angivet ved siden af påstanden, og de samme vagter (<c1/> og formuleringsvagten i <c2/>) gennemsøger siderne, der beskriver dem. Denne tabel er ikke en del af registeret med fjorten rækker ovenfor; den registrerer for de nye flader, hvad der påstås, og hvad der ikke påstås.

seg-6ac3f9b26aad = Hvad der påstås

seg-6f558815da86 = Hvad der ikke påstås

seg-d0964d2f9bbc = Tillidsscore for fartøj (<c1/>, <c2/>, gate, Signal K, OpenCPN)

seg-ee4d75006bfc = en score på 0-100 og begrundelser ud fra en modtagers egen NMEA, MODELLED

seg-59ff27c84fe4 = vejledende, ikke typegodkendt navigationsudstyr; en score for én log siger intet om andre modtagere; den gør ikke en positionsbestemmelse mere nøjagtig

seg-8869e6a5c10b = syntetisk NMEA fra broen med scriptede hændelser og en instruktørlog

seg-bc4ba77bc569 = kun tekst, ingen radiofrekvent udsendelse; aldrig til et fartøjs aktive navigationssystemer; vejledende, ikke typegodkendt navigationsudstyr

seg-9482ecbb2748 = en signeret teknisk optegnelse, der kan verificeres offline

seg-20ae6dd2b780 = ikke en juridisk vurdering; siger ikke, hvad der forårsagede en hændelse, hvem der var ansvarlig, eller at loggen viser, hvad modtageren faktisk modtog

seg-4132fc36f1d3 = aggregerede celler med forringet navigation fra rapporter med åben licens

seg-c64960abf9fb = ikke en prognose; en rutes eksponering er en andel af celler, ikke en risiko

seg-ed6d268e0291 = et scenaries køretøjsbevægelse og hændelser i filer, som en laboratoriesimulator kan læse

seg-85c8ad22ef03 = intet signal skrives; ingen ydeevne for simulator eller modtager påstås

seg-1bba9a883650 = hvilke rækker et sæt kørsler leverer belæg for, med et hul på hver række

seg-f2a836780831 = aldrig at et rammeværk er opfyldt, eller at et produkt er godkendt; en typeetiket alene er ikke belæg

seg-31c7009c9914 = <b>Rettelse registreret i version { "0.35" }.</b> En tidligere version af <c1/> og af kommentarerne i resilience-modulet beskrev syv "teknikkategorier" i DHS Resilient PNT Conformance Framework. Version { "2.0" } af dette framework definerer kernefunktioner (Prevent, Respond, Recover), niveauer { "0" } til { "4" } og otte nummererede krav og ingen liste med syv kategorier. De syv delscorenavne, som scoringsmotoren udsender, er Kshanas egne, og crosswalken siger nu det.

seg-f70787ecb194 = Sådan forbliver en række GREEN

seg-f2c599e8882a = De stærke påstande (OC-0/2/7/8 og de erstattede halvdele af OC-1/3/4/12) er GREEN, fordi funktionen er <b>leveret og testet</b> — ikke fordi formuleringen blev gjort blødere. De rækker, hvor påstanden er trukket tilbage, er GREEN, fordi den aktuelle formulering passer til koden. Vagttesten gør den anden kategori håndhævelig: hvis en udgået overdreven formulering vender tilbage på en offentlig flade, bliver CI rød. Se <c1/>.

seg-39e475441b60 = <s1>Forrige</s1>Hvorfor rækker forbliver modelleret

seg-07ef8e1e862e = <s1>Næste</s1>Proveniens
