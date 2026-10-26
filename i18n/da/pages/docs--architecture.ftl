# docs--architecture: translations (da)

seg-32d08730b9c0 = tillidsstrømmen som Prometheus-metrikker, syslog-hændelser (CEF eller LEEF) og valgfri OpenTelemetry (funktionen <c1/>, slået fra som standard)

seg-53311b8c3b93 = syntetisk bro-NMEA { "0183" } med scriptede hændelser for jamming, drag-off, tidsspoofing og replay samt en instruktørlog, til besætningstræning (kun tekst)

seg-f7cc3cfbdfc6 = aggregerede kort over forringet navigation ud fra åbent licenserede fly- og skibsrapporter, og en rutes eksponering for dem; kun lokale filer

seg-83fe3c87e2d5 = en verifikator i modtagersiden for Galileo OSNMA: læser I/NAV-sider (rene sider, vektor-CSV, en UBX-strøm), kontrollerer den signerede nøgle, TESLA-kæden og MAC'erne og rapporterer pr. satellit, om navigationsdataene er autentificeret; <c1/> er den ene vej, som kommandolinjen, Python og WebAssembly deler; kun autentificeringsstatus, ikke en integritetstjeneste

seg-bf8cd5a45deb = OSNMA

seg-843a83b82283 = kortlægger Kshana-output til offentlige robusthedsrammeværker og udfylder kortlægningen ud fra resultatdokumenter; <c1/> og <c2/> tager tekster, ikke stier

seg-e16c483479ce = et scenaries køretøjsbevægelse og hændelser som en bevægelses-CSV, NMEA, waypoint-tekst og hændelsesfiler til en GNSS-simulator i laboratoriet; der skrives intet signal

seg-044c58c98397 = Integrationer til både (Signal K-pluginet, OpenCPN i gate-tilstand og referencebygget) kalder kommandolinjeværktøjet; se <a1>MARINE-INTEGRATIONS</a1>.

seg-cb8d8ff847eb = { "2" }. Motorens pipeline (pr. kørsel)

seg-53e9e596ca44 = Hver kørsel stepper en enkelt sensormodel gennem tidsgitteret, styrer den, så længe GNSS er nominelt, og lader den løbe frit (holdover / dead-reckoning) under udfaldet.

seg-257407f3c375 = Et scenarie kører denne pipeline to gange, én gang for kvantesensoren og én gang for den klassiske sensor, med <b>uafhængige seeds</b> (<c1/>), så de to støjrealiseringer er ukorrelerede.

seg-4659e89ba5f5 = { "3" }. Fejlmodelgrænsefladen (udvidelsespunktet)

seg-7b70e8b1b98a = Enhver sensor implementerer den samme idé: et tilstandsfuldt objekt, hvis <c1/> fremfører dets interne stokastiske fejl, og hvis akkumulerede tilstand aflæses i hvert tick. Ure udstiller akkumuleret fase; accelerometre udstiller dobbeltintegreret position; forbindelser udstiller jitter pr. måling.

seg-79ab76c6dbc0 = <c1/> følger med ind i resultatet, så hvert tal i outputtet kan spores til den publicerede kilde, som er angivet i <c2/>.

seg-514c49659947 = Ved siden af den analytiske <c1/> kører urpakken et Kalman-filter med to tilstande (fase, frekvens) (<c2/>), hvis processtøj svarer til sandhedsmodellen. Under frit løb gennem et udfald vokser dets fasefejlvarians til præcis <c3/>, den analytiske holdover-relation, og dets online 1-σ-grænse bruges til at udfylde kvalitetsmålet <b>Integritet</b> (andelen af udfaldets sampler, hvor fejlen holder sig inden for k-σ-grænsen).

seg-7404589deb40 = { "4" }. Dispatch (CLI og bindinger)

seg-6138513a43f7 = <c1/> er det eneste indgangspunkt: den kigger på det øverste <c2/>, deserialiserer det tilsvarende scenarie, kører pakken og returnerer <c3/> (<c4/> er kun med for de typer, der udgiver en reproducerbarhedstabel). CLI'en skriver dem til filer, plus rapporten (<c5/>, <c6/>) og eventuelt output fra <c7/> / <c8/>; Python- og WebAssembly-bindingerne returnerer dem til værten. Én dispatch, ingen afdrift.

seg-524f749be364 = Dispatch sker på en typet enum <c1/>, som matches udtømmende (se næste underafsnit), så tilføjelse af en pakke er en ændring, der kontrolleres af compileren. Et manglende <c2/> falder tilbage på pakken <c3/>, så eksisterende scenarier med én type deserialiseres uændret (<c4/> ignorerer feltet <c5/> på hver scenariestruktur). En ukendt <c6/> afvises med <c7/>, som nævner den nærmeste indbyggede type, når navnet ligner en tastefejl.

seg-eedaeae2a7e7 = Typet dispatch og det strukturerede API

seg-ca47f566eaee = Dispatch sker på en typet enum <c1/>, ikke på et råt strengmatch: <c2/> afgør feltet <c3/> til en variant, og dispatcheren matcher på den udtømmende, så tilføjelse af en pakke er en ændring, der kontrolleres af compileren, ikke en tastefejl i en streng. To typede flader ligger ved siden af den strengreturnerende <c4/> (bevaret til CLI'en og eksisterende bindinger):

seg-167c47049329 = <b><c1/></b> — den typede indgang med en struktureret fejltaksonomi (<c2/>, <c3/>, <c4/>, <c5/>). Hver fejl bærer en stabil <c6/>, så en kalder kan forgrene sig på fejlkategorien i stedet for at parse meddelelsen. Bindingerne udstiller den som <c7/>.

seg-1943051b3b20 = <b><c1/></b> (og <c2/>, udstillet i bindingerne som <c3/>) — programmatisk introspektion: hver types navn, beskrivelse og påkrævede/valgfrie felter, til autofuldførelse i brugerflader og notebooks.

seg-630243592256 = Udvidelse af Kshana med en ekstern pakke

seg-d1adedd2c08b = En tredjepartspakke implementerer to små, semver-stabile traits fra <c1/>:

seg-d01471b13324 = <c1/> har også en standardmetode <c2/>, som ikke gør noget, medmindre en pakke vælger at bruge registrets dispatch-søm i <c3/>. Den indbyggede pakke <c4/> er koblet ind gennem <c5/> som gennemarbejdet eksempel; pakker uden for træet følger den samme kontrakt uden at forke kernen (efter samme mønster som udvidelsespunktet <c6/> i §{ "3" }, som det private robusthedsoverlay bruger).

seg-5b0449d96bc3 = Kshana har derfor <b>to stabile udvidelsessømme</b> — tilføj en <em>sensor</em> ved at implementere <c1/> (§{ "3" }), eller tilføj en hel <em>scenarietype</em> ved at implementere <c2/> + <c3/> — begge semver-stabile, og ingen kræver en fork af kernen:

seg-3928a007756b = { "5" }. Den hybride slutsten

seg-7f38e825519a = Den hybride pakke kører en <em>suite</em> (ét ur + én inertisensor) og kræver, at <b>både</b> tidssynkronisering og position holder sig inden for specifikationen; <c1/> er tiden, indtil en af dem brydes. Eventuelt resynkroniserer et optisk inter-satellitlink <b>uret</b> under udfaldet — kun tidsstøtte; positionen resynkroniseres ikke, fordi tidsoverførsel giver tid, ikke position. Det er det, der isolerer inertisensoren som den begrænsende faktor.

seg-17a8683f0982 = { "6" }. GNSS-tilgængelighed udledt af geometri

seg-afdb141ac367 = <c1/> er et deterministisk geometrilag uden afhængigheder. En <c2/> er enten den analytiske Kepler-<c3/> (to-legeme, eventuelt sekulær J2) eller en fuld <c4/>-propagator bygget ud fra et komplet two-line element-sæt; en Walker-delta-generator producerer syntetiske konstellationer, og sigtelinjesynlighed = jordens okkultation + elevationsmaske. Antallet af synlige satellitter afbildes til en GNSS-tilstand (≥{ "4" } = nominel, { "1" }–{ "3" } = forringet, { "0" } = nægtet), og <c5/> omsætter det til den tilgængelighedstidslinje, der driver den almindelige ur-holdover-kørsel. Tilgængelighed er altså <em>udledt af geometri</em> frem for håndskrevet, mens kørslen, estimatoren og scoringen er uændrede.

seg-da82c97ac5c8 = En konstellation, der leveres som fulde TLE'er, propageres med SGP4/SDP4-modellen i <c1/> (valideret mod AIAA (American Institute of Aeronautics and Astronautics) 2006-6753-vektorerne); elementer med kun linje 2 følger den analytiske to-legeme-vej. De to kan blandes i én konstellationsblok.

seg-a47031620b54 = { "7" }. Bindinger

seg-57fb29fdd9d9 = Kernen kompilerer uændret til native, til en Python-udvidelse og til WebAssembly. Python-modulerne (<c1/>, PyO3 abi3) og WebAssembly-modulerne (<c2/>, wasm-bindgen) er valgfrie afhængigheder bag feature-flag (<c3/> / <c4/>): standardbygget og testsuiten kompilerer dem aldrig, mens afhængighedsrevisionens gate (<c5/>) inspicerer deres afhængighedstræer, fordi disse crates leveres inde i wheel-filen og npm-pakken. Begge kalder <c6/>, så alle flader returnerer identiske resultater. WebAssembly-modulet bærer browser-legepladsen i <c7/> og eksporterer tretten funktioner: <c8/>, <c9/> (én motorkørsel, der returnerer resultat, diagram, oversigt og tabel samlet), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, kodeken <c16/> / <c17/> til delbare URL'er (URL: webadresse) og de tre eksportører <c18/> / <c19/> / <c20/>, som bærer legepladsens eksportmenu. To yderligere indgange når det samme <c21/>: <b>MCP-serveren (Model Context Protocol)</b> (<c22/>, en <c23/>-crate uden for workspace, der udstiller femten værktøjer — <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; de to eksempelværktøjer læser de medfølgende scenarier gennem bibliotekets funktion <c39/>, som er slået fra som standard, og som kun denne server slår til) og <b>JetBrains IDE-pluginet (integrated development environment)</b> (<c40/>, et Kotlin-projekt, der kalder CLI'en <c41/> i stedet for at linke biblioteket).

seg-a6620e0d6eef = Feature-gating: Python og WASM er <c1/> / <c2/>; tabellen med medfølgende scenarier er <c3/> (MCP-serverens eneste brug af den); MCP-serveren og krydskontrollerne i <c4/> er crates, der er UDELADT fra workspace; IDE-pluginet linker ingenting — det kører CLI'en.

seg-7bc5df56e4e5 = { "8" }. Determinisme og reproducerbarhed

seg-fb95c37c7bb9 = Al tilfældighed løber gennem én seedet <c1/> pr. kørsel; rækkefølgen af trin er fast, så <c2/>.

seg-e026c87beb26 = Resultatet bærer en SHA-256 (SHA: Secure Hash Algorithm) <c1/>; <c2/> kører et referencescenarie to gange og kontrollerer, at outputtet er identisk byte for byte.

seg-42a3bdcbd99f = Den samme motor kompilerer til native, til en Python-udvidelse og til <c1/> til kørsler i browseren, der giver de samme tal.

seg-12e00717c2d4 = { "9" }. Udskudt / fremtidig struktur

seg-8a8e1b93b704 = Astrodynamik-, fusions- og alt-PNT-lagene i §1a — den fulde SGP4/SDP4-propagator, den numeriske Cowell-propagator med en kraftmodel med syv perturbationer og to adaptive integratorer, manøvre- og banedesign, banebestemmelse, GNSS/INS-estimatorerne med 15, 8 og 17 tilstande, det koblede ur+positionsfilter og gravitationskortmatchning — er alle leveret, sammen med Security FoM med en aktiv spoof-demonstrator, ægte TLE-/multikonstellationsgeometri, Monte Carlo-bånd, trade-study-sweeps, den udskrivbare HTML-rapport (HyperText Markup Language) med dens maskinlæsbare tvilling og workflows til release, publish, wheels og pages.

seg-318ad50d3826 = Flere funktioner, der engang stod her som fremtidigt arbejde, er siden <b>leveret</b> og er beskrevet ovenfor eller i <a1>VALIDATION</a1>: den fulde IAU 2000A-nutation og den ækvinoksfrie CIO GCRS↔ITRS / ITRF-reduktion (International Terrestrial Reference Frame) (valideret bit for bit mod SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), EGM2008-geopotentialet (Earth Gravitational Model { "2008" }) til grad/orden { "70" }, leddet <b>Lense–Thirring</b> (frame-dragging), tidevand i fast jord, hav og atmosfære, en krydsvalidering af efemeriden på DE-niveau (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — et rent Rust-værktøjssæt til planetgeometri)), den eksterne krydsvalidering mod Orekit { "12.2" } af den numeriske Cowell-propagator ({ "0.08" } m over { "24" } h) og af batch- og sekventiel banebestemmelse samt den tæt koblede navigator med 17 tilstande, der er gjort tilgængelig som scenarietypen <c1/>.

seg-068119b15b27 = De resterende opfølgninger spores i <a1>CHANGELOG</a1> <c1/> og i køreplanen pr. funktion i <a2>CAPABILITY</a2>: en ekstern orakelværdi til EGM-evaluatoren (Earth Gravitational Model) af høj grad netop på polaksen og en pyshtools-ren sammenligning nær polen (evaluatoren til grad { "2190" } og dens indlæser <c2/> til kørselstid er leveret, MODELLED; se <c3/>), en tidsvarierende rumvejrsdriver til den valgfrie densitetsmodel NRLMSISE-00 for atmosfærisk modstand (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosfæremodel) (standardtætheden for modstand er den statiske eksponentielle model, og tætheden Jacchia-71 for typen <c4/> er karakteriseret mod NRLMSISE-00, men ikke erstattet af den), en ekstern kontrol af den valgfrie skygge med solens randformørkelse, bærebølgefase-GNSS/INS-tætkobling og et ægte EGM2008/EIGEN-gravitationskort (EIGEN: European Improved Gravity model of the Earth by New techniques) til alt-PNT-matcheren.

seg-b48f69ea54b3 = Et privat overlay-repo rummer eksportfølsom robusthedsdybde; det kobles ind gennem den samme grænseflade <c1/> (og kontrakten <c2/> i §{ "4" }) uden at ændre den offentlige motor.

seg-2f88ab8f67e8 = <s1>Forrige</s1>Hvor Kshana kører

seg-02b0e0fdcdbe = <s1>Næste</s1>Hvor Kshana står
