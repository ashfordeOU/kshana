# docs--mcp: translations (nb)

seg-261c059bec54 = Veiledende, ikke typegodkjent navigasjonsutstyr: operatøren er fortsatt ansvarlig for navigasjonen. Serveren kjører på din datamaskin; ingenting sendes til Ashforde OÜ.

seg-13641146503d = Cursor (ett klikk)

seg-3bd13fe295f4 = VS Code (ett klikk)

seg-fea7b394cdde = npx

seg-76fcc8024f2f = uvx / pipx

seg-deb5187472d1 = Homebrew

seg-491167f2310c = Scoop

seg-5c425ea185ee = Ferdigbygd binærfil

seg-d107bc8e1950 = MCP-register

seg-842b77a21c5f = Kanal

seg-d6476863f862 = Funksjon

seg-fdbb9db68f1d = ingen

seg-1759a8cce7d6 = Typer

seg-564133d6a0c4 = Konstellasjoner rundt et hvilket som helst legeme

seg-b88a2a9497c2 = Verktøy

seg-a683980168f7 = Docker

seg-f3a2279d6df7 = Kommando eller knapp

seg-20c5ae650eb7 = Krever

seg-af4d3ce85e11 = Festet form

seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

seg-b02bdf7c7661 = Node, eller Docker

seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

seg-abf8b5fe685a = Node { "18" }+

seg-06299cefbf9e = Python { "3.9" }+ med uv eller pipx

seg-26795c302f8a = brew

seg-ded975fa67fa = formel for v{ $version }

seg-667d6dde705b = <c1/> deretter <c2/>

seg-f6e9fc5f46fe = Scoop (Windows)

seg-bc4762d20004 = manifest for v{ $version }

seg-f7c0a2fbb0b5 = winget

seg-9e599ab3c0a3 = winget (Windows)

seg-091d1404bb8a = cargo

seg-145ddf98e77f = Rust { "1.88" }+

seg-b308519d4c8d = <a1>utgivelsessiden</a1>: <c1/> (Linux x86-64), <c2/>, kontrollert med <c3/> og <c4/>

seg-c39cac69f700 = v{ $version }

seg-e8f5e2b6580b = <c1/> (finnes av klienter som støtter registeret)

seg-b1a6e807f06f = en klient som støtter registeret

seg-d5a3818ac3b6 = Fjernbruk (streamable HTTP)

seg-5f1397b1ea30 = din egen vert

seg-e7acd0ff4c84 = Kilde: <c1/>

seg-81a87d14efda = Kshana: merket, et kompasshårkors som markerer det nøyaktige øyeblikket, ved siden av ordmerket kshana

seg-3d5232472e42 = kshana-mcp: spør KI-assistenten din, så svarer motoren

seg-ef90bf1e0b51 = <c1/> er en MCP-server (<a1>Model Context Protocol</a1>) for <b>Kshana</b>, den åpne simulatoren for robusthet i PNT (posisjonering, navigasjon og tidssynkronisering). Den lar en KI-assistent (kunstig intelligens) kjøre den virkelige motoren og lese tilbake JSON-svaret (JavaScript Object Notation), i stedet for å gjette på matematikken. Den snakker over stdio (standard inn og ut) med enhver MCP-klient, inkludert Cursor og JetBrains AI Assistant / Junie.

seg-1fddef4e9a49 = Matematikken som Kshana er validert for, er nettopp der en språkmodell gjetter dårlig: banepropagering med SGP4 (Simplified General Perturbations { "4" }), referansesystemer fra IAU (International Astronomical Union), Allan-deviasjoner, tilgjengelighet for GNSS (Global Navigation Satellite System) og DOP (dilution of precision), beskyttelsesnivåer for ARAIM (advanced receiver autonomous integrity monitoring), fusjon av GNSS og INS (inertial navigation system), og kvantesensormodeller. Still et spørsmål; assistenten kjører et ekte scenario og får kvalitetsmål med opphav og merkelappen VALIDATED eller MODELLED.

seg-d51681f30e8f = Én åpen motor i sentrum, med MCP-serveren som én av flatene ved siden av kommandolinjen, Rust-biblioteket, Python, WebAssembly og Kshana Studio, Docker-bildet og JetBrains-programtillegget; hver flate kjører den samme motoren, og Kshana Pro avhenger av den uten å gafle den

seg-2a56e1f52830 = Verktøy

seg-b847694d91b5 = Kjør et scenario fra en TOML-definisjon (Tom's Obvious, Minimal Language); returnerer sammendraget + hele resultat-JSON (JavaScript Object Notation: kvalitetsmål, kurver). Valgfri <c1/> returnerer diagrammet som SVG (Scalable Vector Graphics).

seg-3c00da00ec30 = Kontroll før kjøring: tolk TOML-en og finn typen, uten å kjøre.

seg-4516fd1e665c = De medfølgende referansescenarioene som JSON: hver <c1/>, dens <c2/> og én setning om hva den viser. Valgfritt filter på <c3/>. Hvert eksempel kjører som det står, så dette er den raskeste veien til en gyldig TOML for en type.

seg-61db4a94ad72 = TOML-teksten til ett medfølgende referansescenario, byte for byte filen under <c1/>.

seg-306f7a835bb9 = Kjør et scenario og returner rapporten: sammendrag, inndata, hvert tall med enhet og merkelappen VALIDATED eller MODELLED, hendelser, funksjonene som ble utøvd og en reproduserbarhetspost. <c1/> er <c2/> (standard) eller <c3/> (den utskriftsvennlige enkeltfilsiden).

seg-bdacef6d5133 = Kjør et scenario og returner tidsserien som en animasjon: <c1/> (standard), <c2/> (en selvstendig avspiller) eller <c3/> (høyst { "120" } i ett svar). Det første innholdselementet er et JSON-sammendrag av det som ble tegnet; filene følger. En type uten samplet tidsakse avvises med begrunnelse.

seg-313f7594bd81 = Hvilke interoperabilitetsformater som gjelder for et scenario (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), begrunnelsen når ett ikke gjør det, og spesifikasjonen hver skriver følger. Kjører ikke scenarioet.

seg-e63b7853bb96 = Eksporter et scenario som CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemeride <c1/> for STK (Systems Tool Kit), eller SigMF (Signal Metadata Format, for et scenario av typen <c2/> med en blokk <c3/>). Det første innholdselementet er en JSON-indeks over filene (suffiks, størrelse, koding og SHA-256-sammendraget, den 256-bits Secure Hash Algorithm); filene følger, den binære SigMF-samplefilen som base64.

seg-074e914789c5 = Skriv en GeoJSON-rute av typen <c1/> inn i et scenario som flyr et veipunktspor (<c2/>, <c3/>, <c4/>, <c5/>) og returner den nye TOML-en.

seg-ae58a8577aa7 = Eksporter konstellasjonen til et scenario av typen <c1/> som presis efemeride i SP3-c (Standard Product { "3" }, revisjon c).

seg-6a59aacf26bb = Eksporter elementene til et scenario av typen <c1/> som en katalog i CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message).

seg-5562b319968b = Eksporter tilstandsserien til et scenario av typen <c1/> som efemeride i CCSDS OEM (Orbit Ephemeris Message) { "2.0" } — TEME-serien (true equator, mean equinox) for posisjon <em>og</em> hastighet som verktøy for flydynamikk (GMAT, General Mission Analysis Tool; Orekit; STK, Systems Tool Kit) leser; komplementet som bærer hastighet, til det rene posisjonsverktøyet <c2/>.

seg-b0cf13e530b7 = Kjør et scenario og returner reproduserbarhetstabellen som CSV (kommaseparerte verdier) — den byte-stabile tabellen som CLI-en (kommandolinjegrensesnittet) skriver som <c1/>. Bare <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (analysen <c7/> på en meldingsmodell <c8/> eller <c9/>) og <c10/> med <c11/> + <c12/> satt gir en; alle andre typer returnerer en feil som nevner disse.

seg-ab242cd0259c = Himmelgeometri under et azimutavhengig horisontprofil: fra et sted, et tidspunkt og konstellasjonsforhåndsinnstillinger, tolinjers elementsett (<c1/>, propagert med SGP4 til UTC-tidspunktet <c2/>) eller satellitter som azimut/elevasjon eller ECEF, satellittene som er synlige og de som er skjult av horisontprofilen, GDOP/PDOP/HDOP/VDOP/TDOP fra DOP-kjernen som er kontrollert mot gnss_lib_py, øst-nord-opp-kofaktoren og kovariansen (én klokke per system eller én felles) og den horisontale feilellipsen; med <c3/> i stedet for <c4/>, en REPRESENTATIVE forhåndsinnstilling med opphav og med utskjæringen for hver grad. MODELLED; bærer den veiledende merknaden; ingen Monte Carlo over MCP. Se <a1><c5/></a1>.

seg-d6ed4e8d56e5 = Vurder en ekte GNSS-mottakerlogg (global navigation satellite system) for tillit. TOML-en oppgir loggens <c1/> (<c2/>, <c3/>, <c4/>, <c5/> eller <c6/>) og gir bytene inline som <c7/> eller <c8/>; verktøyet kjører tillitsovervåkerne (fall i bærer-til-støy-tetthet, tap av lås, AGC (automatisk forsterkningsregulering), jamming-indikator, posisjonssprang og, med RINEX pluss kringkastet navigasjon, RAIM (receiver autonomous integrity monitoring) og en klokkestøttet overvåker) og returnerer når og hvorfor posisjonsbestemmelsen sluttet å være pålitelig. Valgfrie seksjoner <c9/> og <c10/> skårer oppgitte hendelser og predikerte C/N0-fall mot oppgitte toleranser. En tabell <c11/> velger de maritime overvåkerne og legger til en tillitsscore på 0-100 per epoke med overvåkerne som trakk fra (veiledende; MODELLED). Loggen sendes inline som <c12/> eller <c13/> (høyst { "4" } MiB). Diagram og CSV per epoke på forespørsel. Se <a1><c14/></a1>.

seg-d1a967a443ea = Skår et avgrenset utdrag av NMEA { "0183" } (høyst { "2" } MiB og { "20,000" } epoker; det må inneholde kalibreringsvinduet) slik <c1/> skårer det: tillitstilstand per epoke og score 0-100 med overvåkerne som trakk fra, et sammendrag og siste <c2/>. Den avgrensede formen av live-kommandoen: ingen socket åpnes og ingenting skrives til en port; porten (gate), <c3/> og telemetrieksportørene (Prometheus, OTLP, syslog) finnes bare på kommandolinjen. Kun veiledende; MODELLED. Se <a1><c4/></a1>.

seg-89e894d4b416 = Et fartøys logg i NMEA { "0183" } (høyst { "4" } MiB) som en batchkjøring, med økt-TOML-en som oppgir fartøyets grenser: skåremodellen og hver epokes score 0-100 med fradragene (svaret beholder antall per tilstand og de første { "200" } forringede eller upålitelige epokene). Kun veiledende; MODELLED.

seg-27698c80b7f1 = Les den publiserte Jammertest-testkatalogen og sendeplanen (NPRA/jammertest-plan, MIT) som planlagt referanse (<c1/>): ett testområdes tidsluker blir mottakertillit-hendelser med katalog-id og år i hver etikett. Planlagte tidsluker, ikke registrerte sendetider; ingen kontaktfelt i planen leses. MODELLED. Se <a1><c2/></a1>.

seg-23daf6121ca0 = Skår en mottakerlogg mot den planen (<c1/>): per test deteksjonsforsinkelse, uteblitte alarmer og tid til gjenoppretting, og falske alarmer utenfor alle tidsluker. Tekstlogger som <c2/>, binære (<c3/>, <c4/>) som <c5/>. En signert pakke trenger en nøkkel: kommandolinjen. Kun veiledende; MODELLED.

seg-0ca5b319e850 = En signert bevispakke for et vindu av et fartøys logg (<c1/>): råloggbytene for vinduet, konfigurasjon, resultater og begrunnelser per epoke, en sammendragsside og et manifest med hver SHA-256 og en hashkjede, signert med Ed25519. Signeringsfrøet returneres eller logges aldri; uten et brukes en engangsnøkkel, så pakken beviser integritet, ikke identitet. En teknisk oppføring, ikke en juridisk vurdering. Se <a1><c2/></a1>.

seg-8df4c6fb851d = Bind et tidsstempeltoken etter RFC { "3161" } (base64 av bytene i <c1/>) til en pakke, i minnet (<c2/>); pakken med tokenet må fortsatt kunne verifiseres. Tidsstempelmyndighetens signatur kontrolleres ikke: bruk <c3/>.

seg-1f7a6f7f005a = Verifiser en pakke (<c1/>): hver hash, kjeden, signaturen, og med signerens offentlige nøkkel og hele loggen, hvem som signerte den og at utsnittet kom fra den loggen. Nevner hver feil og fil. <c2/> er <c3/> (signeren er festet), <c4/> (alt stemmer, men ingen offentlig nøkkel ble oppgitt, så signeren er ikke fastslått) eller <c5/>; <c6/> feiler en pakke uten tidsstempeltoken.

seg-c43761e01f63 = Syntetisk bro-NMEA { "0183" } for mannskapstrening fra en TOML av typen <c1/> (jamming, drag-off av posisjon, tidsspoofing, replay-forsinkelse) med instruktørloggen (<c2/>); deterministisk per seed. Bare tekst: ingenting syntetiseres på RF eller IQ og ingenting sendes; aldri for et fartøys levende navigasjonssystemer. Svaret inneholder de første { "2000" } linjene.

seg-8aec8f61dab2 = Et GNSS-interferenskart fra ADS-B- eller AIS-posisjonsrapporter som CSV-tekst (høyst { "4" } MiB): én GeoJSON-fil <c1/> per UTC-dag, bare aggregert (ingen identifikatorer, celler under { "5" } distinkte fly eller fartøy holdes tilbake), med datasettlisensen innebygd. En forringet celle peker ikke ut interferens som årsak; ikke en prognose. MODELLED. Se <a1><c2/></a1>.

seg-d5959e4f1c96 = Et scenarios kjøretøybevegelse og hendelser for en GNSS-simulator i laboratoriet (<c1/>): bevegelses-CSV og JSON, NMEA, veipunkter og hendelser som tekst, ingenting skrevet til disk. Typene <c2/>, <c3/>, <c4/>. Intet signal: ingenting som eksporteres er, modellerer eller styrer et radiofrekvens- eller basebåndssignal; simulatoren og operatøren leverer signalene. Se <a1><c5/></a1>.

seg-1076916237f0 = Den signerte tur-retur-pakken fra laboratoriet (<c1/>): scenarioet, dokumentet <a1><c2/></a1> fra laboratoriet, mottakerloggen og dens skår mot de oppgitte hendelsene, koblet med hash. Avviser betingelser og skårehendelser som er uenige. Intet signal; en teknisk oppføring, ikke en sertifisering.

seg-9e1df2016cd7 = Spill av ett IQ-opptak i arbeidskatalogen på tvers av flere utforminger av sporingssløyfer (<c1/>): per utforming og PRN stabil fase- og kodejitter, låsandeler og gjennomsnittlig C/N0. Høyst { "256" } kanaler (utforming, PRN) per kall; spennet må passe innenfor sampelbudsjettet.

seg-a5af1743f993 = Kjør deteksjonsovervåkerne for interferens og spoofing over et IQ-opptak i arbeidskatalogen (<c1/>): bredbåndseffekt- og spektralovervåkere og C/N0- og signalkvalitetsovervåkere per satellitt mot en lært grunnlinje. Serienavn og -lengder og opptil { "200" } hendelser i svaret; hele rapporten på forespørsel som filer. En hendelse sier at en målt størrelse forlot grunnlinjen, ikke hvorfor. MODELLED.

seg-c9c9c909c621 = Tilpass tapet-av-lås-modellen for sporingssløyfen til laboratoriekjøringer (<c1/>) fra et scenario av typen <c2/> hvis logger er inline (<c3/> eller <c4/>; en <c5/> avvises). Leser og skriver ingen fil. MODELLED.

seg-4f231cd18d37 = Validerer en <c1/>-fil gitt som tekst og returnerer de løste betingelsene med hasjen deres. Bare innebygd.

seg-2851f2858910 = Kartleggingen mot offentlige rammeverk, fylt ut fra resultatdokumenter gitt som tekst (<c1/>): hvilke rader i seks rammeverk og standarder for robusthet (US DHS Resilient PNT framework v2.0, IMO skip, EASA luftfart, NIS2 artikkel { "21" }, EN { "16803" }, NIST IR 8323r1) kjøringene gir belegg for, hvilke de ikke gir belegg for, og gapet for hver rad. Tar <c2/> av <c3/> (høyst { "64" }, { "4" } MiB til sammen). En status sier at kjøringene gir belegg for radens funksjoner; den er ikke en konklusjon om at et rammeverk er oppfylt, og ikke en vurdering eller godkjenning av noe produkt. <c4/> returneres med hver rapport; vis den ordrett. MODELLED. Se <a1><c5/></a1>.

seg-0a5161ddea94 = De statiske kartleggingstabellene (eller, med <c1/>, kildedokumentene de siterer, med versjoner og URL-er) som Markdown, med samme erklæring først. Trenger ingen kjøringer.

seg-ffcc6c72dc1e = En tillitsstrøm (JSON-linjer) eller et <c1/>-resultat gjengitt som Prometheus-tekst, CEF- eller LEEF-syslog-linjer, en OTLP-JSON-nyttelast eller Home Assistant MQTT-oppdagelses- og tilstandslinjer, med kodererne i <c2/>. Tekst i svaret: ingenting sendes eller serveres, og ingen klokke leses. Kun veiledende.

seg-2b82a8a22298 = Akselerometer- og gyroparametere for scenarioene <c1/> og <c2/>, tilpasset fra en stasjonær IMU-logg (CSV eller EuRoC) med Allan-deviasjon, med en ferdig tabell <c3/> som kan limes inn og loggens SHA-256 (<c4/>). Tekst inn, JSON ut; MODELLED.

seg-30d5bb6b34cb = Standardpakkene (<c1/>): scorede scenariosett for testprofilene i DHS Resilient PNT framework (nivå { "1" } til { "4" }), IMO MSC.1/Circ.1575 og ICAO Doc { "9849" } tillegg F.

seg-767a05e5df9f = Én pakkekjøring mot terskler som er oppgitt før kjøringen (<c1/>): hver test <c2/>, <c3/> eller <c4/>, med målte og forventede verdier; gi rapporten til <c5/> for å se radene. MODELLED; vurderer ikke noe produkt.

seg-74110e6b530f = LunaNet Augmented Forward Signal kontrollert mot LNIS V5 AD1 bind A (LSIS-AFS V1.0, { "29" } januar { "2025" }): <c1/> (implementasjonen mot dokumentets trykte kodetabeller og gjennomgåtte eksempler), <c2/> (en symbolstrøm: synkroniseringsmønster, SB1, FID, TOI-kontinuitet) eller <c3/> (en teststrøm). LDPC og CRC-24Q for delrammene { "2" } til { "4" } verifiseres ikke; ingen signaler skrives.

seg-b6abad1f2c9d = En innsending til kshana-bench scoret mot en referansefil, begge som JSON-tekst (<c1/>, <c2/>): resultatfilen med spesifikasjonsversjon, deling, inndatahasjer og oppgavens målinger. MODELLED; beskriver en logg eller et korpus, aldri et produkt.

seg-c7a0d7981bfd = Resultatfiler fra kshana-bench gjengitt som den statiske ledertavlesiden (HTML-tekst), hver validert først.

seg-1ec7117c7825 = En tillitsstrøm (JSON-linjer) eller et <c1/>-resultat gjengitt som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP-JSON-nyttelast, med kodererne i <c2/>. Tekst i svaret: ingenting sendes eller serveres, og ingen klokke leses. Kun veiledende.

seg-0fc2e3928768 = Andelen av en ruteslengde i degraderte, ikke-degraderte, ikke-vurderte og ikke-observerte celler i ett eller flere interferenskart, eventuelt innenfor et datoområde. Uobserverte celler er ikke belegg for en fri rute.

seg-62756ba18cf5 = Oppsettet for GNSS IQ-laget: signalnavnene IQ-verktøyene godtar, om IQ-filverktøyene er på, arbeidsmappen og samplebudsjettet per kall. Kall det først.

seg-98939638409f = Beskriv én IQ-opptak (in-phase og quadrature) i arbeidsmappen uten å behandle den: format, samplingsrate, sentralfrekvens, sampler, varighet, datafiler og størrelser (<c1/>).

seg-c529b1a7ee53 = Generer en GNSS IQ-scene med flere satellitter i arbeidsmappen (<c1/>): oppgitte Doppler-/C/N0-profiler, eller sann broadcast-efemeridegeometri fra en RINEX-navigasjonsfil, med en valgfri forplantningskanal på signalnivå. Svarer med filene som er skrevet og antall byte i dem, og referansens første epoke per satellitt.

seg-0c6f5e26367f = FFT-akkvisisjon (fast Fourier transform) av én eller flere PRN-er (pseudo-random noise-koder) over et opptak (<c1/>), eventuelt bak frontend-trinn: per PRN, akkvirert eller ikke, Doppler, kodefase, toppstatistikk og terskel; <c2/> (én PRN) beholder hele Doppler × kodefase-korrelasjonsflaten med finforfininger av Doppler.

seg-1da73ad326de = Akkvirer, og spor deretter med DLL/PLL/FLL-banken (delay-, phase- og frequency-locked loop) (<c1/>), med løkkene fra en <c2/>-TOML-fil i arbeidsmappen (<c3/>) eller den innebygde utformingen, og valgfri reakkvisisjon (<c4/>): per kanal, epoker, endelig Doppler, endelig og gjennomsnittlig C/N0, andeler for fase- og kodelås, låst på slutten, den endelige låsetilstanden, falske låsinger og reakkvisisjoner, pluss utformingens navn og hasj. Sporingen strømmer i begrenset minne; utdata per epoke går bare til filer (<c5/>: E/P/L, diskriminatorer, løkketilstander, C/N0, låsetilstand som .csv/.jsonl/.bin; <c6/>).

seg-262bb9c592c0 = Bruk mottakerens frontend og DSP for interferensdemping (digital signal processing: båndpass, notch, blanking, utskjæring, AGC, kvantiserer) på et opptak og skriv et nytt (<c1/>).

seg-cf33e101b144 = Kjør en laboratorie-avspillingskampanje (<c1/>): opptak, hvert med en testbetingelsesfil som oppgir laboratoriets kjente referanse, × frontend-kjeder × løkkeutforminger. Hver celle scores for tid til tap av lås, reakkvisisjonstid, C/N0-degradering mot den oppgitte J/S (ved siden av en analytisk referanse merket MODELLED), frekvens av falsk lås, PLL/DLL-jitter og tilgjengelighet. Inkrementell og kan gjenopptas: hvert kall kjører de ventende cellene som får plass i samplebudsjettet (eller <c2/>).

seg-8112428c6226 = Fremdriften i en kampanjes utdatamappe: celler ferdige og ventende, og sammendraget når den er ferdig. Leser bare filer.

seg-8bd76f017ae4 = Hvert verktøy er en tynn, tro innpakning rundt en offentlig funksjon i biblioteket <c1/> — ingen ny simuleringslogikk ligger her, så en agent kjører nøyaktig den validerte motoren.

seg-b37bbaf38900 = GNSS IQ-verktøyene: filer inn, kompakt JSON ut

seg-ecf2ec0eb66d = IQ-opptak går opp i gigabyte, så verktøyene <c1/> sender aldri sampler gjennom protokollen. De følger én kontrakt:

seg-31a173dfe40d = <b>En arbeidsmappe.</b> Serveren leser og skriver IQ-filer bare inne i mappen som er navngitt av <c1/>. Hvert stiargument er relativt til den (en absolutt sti må løses opp innenfor den); inndata løses opp gjennom symlenker før kontrollen, mappen til en utdatafil må allerede finnes inne i den, og en eksisterende utdatafil erstattes bare med <c2/>. Når den ikke er satt, er IQ-filverktøyene av og sier hvordan de slås på; alle andre verktøy påvirkes ikke.

seg-4f734b84a91a = <b>Et samplebudsjett.</b> Ett kall genererer eller behandler høyst <c1/> komplekse sampler (standard { "50 000 000" }). I byte er det { "400" } MB som <c2/> ({ "8" } byte per komplekse sample), { "200" } MB som <c3/> ({ "4" } byte) og { "100" } MB som <c4/> ({ "2" } byte); en scene skrives som <c5/> med mindre <c6/> sier noe annet. Kontrollen kjører før noe arbeid, og avslaget nevner varigheten eller <c7/> som passer.

seg-178284ddfee0 = <b>Kompakte svar.</b> Hvert verktøy svarer med ett JSON-sammendrag: akkvisisjonstopper, C/N0, låsetilstand og hver fil som er skrevet, med sti og antall byte. Tabeller per epoke går til filene <c1/> / <c2/> du navngir.

seg-f375643798e9 = <b>Ukjente argumenter avvises</b>, ikke ignoreres, så et feilstavet valg er en feil.

seg-41040247770d = Hvert verktøy kjører samme kodesti som <c1/> på kommandolinjen, i prosessen. Laget er bare programvare: det skriver filer for programvaremottakere og styrer ingen radiomaskinvare. IQ-laget legger ikke til noen syntese av interferens eller spoofer, og ingenting sendes noen gang. (Scenariotypen <c2/> kan skrive analytiske jammer-IQ-øyeblikksbilder til en fil.)

seg-f02d2f6bac7c = Med Docker-avbildningen monterer du mappen og peker variabelen på den: <c1/>.

seg-721079aa25e7 = Alle typer kan nås

seg-116ada4f4498 = <c1/> sender videre etter scenarioets <c2/>, så alle typer som <c3/> nevner, kjører gjennom det. Det omfatter de nyere familiene, hver med medfølgende eksempler en agent kan hente:

seg-c7047f5750a9 = Et eksempel å starte fra

seg-b45752760eca = Solsystemet

seg-1ccf38ab6e24 = Kampanjer: lenkede faser, sveip, Monte Carlo (tilfeldige ensembler med seed), sammensetning

seg-67fe14962e1c = Navigasjon i lav jordbane (LEO): signalutforming

seg-c555e5b73203 = LEO-navigasjon: linkbudsjett for overflyvning

seg-67de12cac6f0 = LEO-navigasjon: navigasjonsmelding

seg-b8badd962245 = LEO-navigasjon: fusjonert posisjonering og tidssynkronisering

seg-0561cfd970d8 = <c1/> med en <c2/> nevner alle medfølgende eksempler av den typen. Animasjoner, rapporter og interoperabilitetseksporter er ikke typer: de er visninger av en kjøring, og <c3/>, <c4/> og <c5/> returnerer dem for ethvert scenario de gjelder for.

seg-62d106ca4a89 = Ikke servert: studiesuiter (<c1/>), fordi en suite navngir søsterscenariofiler på disken og scenarioverktøyene ikke leser noen fil. Kjør hvert medlem med <c2/>. (IQ-verktøyene leser og skriver filer, men bare innenfor arbeidsmappen sin.)

seg-57f592bb676b = Installer MCP-serveren

seg-77fc92e21295 = En passasje som nevner tredjeparts AI-klienter er utelatt her; den står i <a1>mcp/kshana-mcp/README.md</a1> på GitHub.

seg-9ec78559983f = <c1/>, selvdrevet: se <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

seg-b32b9d4e0f8b = Fra en utsjekk eller git (utvikling):

seg-73a73af88f08 = HTTP-modus (selvdrevet)

seg-4f248ed3e597 = <c1/> serverer de samme verktøyene over strømmende HTTP på <c2/>. Den binder seg bare til loopback; en adresse som ikke er loopback, trenger <c3/> og et bearer-token i <c4/>; IQ-filverktøyene er av; forespørselsstørrelse, tid og samtidighet er begrenset; ingen CORS-header sendes. { -brand } driver ikke noe endepunkt: du drifter det selv. Se <a1>docs/deploy/mcp-http.md</a1>.

seg-60f55b197ac2 = <c1/> legger <c2/> i din <c3/> (vanligvis <c4/>). Serveren snakker JSON-RPC (JSON remote procedure call) over stdio; logger går til stderr. Bygging fra kildekode trenger en Rust-verktøykjede ≥ { "1.88" } (den patchede <c5/> { "2" }.x SDK-en trenger det; selve biblioteket <c6/> trenger bare { "1.85" }); Docker-avbildningen trenger ingen.

seg-2f3216082425 = Registrer den hos en klient

seg-1090ae3f689c = Så å si alle MCP-klienter bruker den samme konfigurasjonsblokken <c1/> — registrer binærfilen <c2/> med absolutt sti:

seg-2da393482666 = Eller, med Docker-avbildningen i stedet for en lokal binærfil (ingen <c1/> nødvendig):

seg-a4f1295bb27a = Hvor den blokken ligger, avhenger av klienten:

seg-154c7e09063d = <b>Cursor</b> — <c1/> (globalt) eller <c2/> (per prosjekt).

seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, lim inn blokken, og start deretter IDE-en (integrated development environment) helt på nytt.

seg-daf0ea451b11 = <b>Skrivebordsassistenter</b> — de fleste bruker en <c1/> med samme <c2/>-form; sjekk klientens dokumentasjon for filplasseringen.

seg-fc80286aa9bf = <b>CLI-agenter</b> — mange godtar den samme JSON-en gjennom en <c1/> / <c2/>-mekanisme.

seg-9f3ef8d76e05 = Bruk alltid en absolutt sti til binærfilen. Sett <c1/> i <c2/> for å feilsøke (diagnostikk går til stderr; stdout er reservert for JSON-RPC-protokollen).

seg-283d1eba838a = Prøv det

seg-61739e9b6515 = Når den er registrert, kan du spørre assistenten din om ting som:

seg-256276ac933d = <em>«List scenariotypene i { -brand }.»</em> → <c1/>

seg-2a8e3c76b939 = <em>«Vis meg et spectrum-eksempel i { -brand } og kjør det.»</em> → <c1/>, <c2/>, <c3/>

seg-d2e1e4148589 = <em>«Kjør scenarioet for klokke-holdover i { -brand } med en terskel på { "20" } ns og et GNSS-utfall på 2 timer; hva er holdover for kvante mot klassisk?»</em> → <c1/>

seg-f4b83873e280 = <em>«Eksporter den GPS-konstellasjonen (Global Positioning System) som SP3.»</em> → <c1/>

seg-54e01c1af45f = <em>«Gi meg tabellen realtime-frame-eop som CSV.»</em> → <c1/>

seg-478e6fa0e8d8 = <em>«Legg den Iridium-overflyvningen på en Cesium-globus.»</em> → <c1/>, <c2/>

seg-90829388d5d9 = <em>«Animer jamming-kampanjen.»</em> → <c1/>

seg-9eb1b97ad2fd = <em>«Gi meg rapporten for den kjøringen, med reproduserbarhetsposten.»</em> → <c1/>

seg-dc60d64a3bb8 = <em>«Lag en GPS L1-scene på ett sekund med PRN-ene { "3" } og { "17" }, og akkvirer og spor den deretter.»</em> → <c1/>, <c2/>, <c3/>, <c4/>

seg-942dc8abe0ec = Designnotat — hvorfor en egen crate

seg-ce6d0ecab448 = Serveren er en <b>frittstående crate som er utelatt fra workspace</b>, med sin egen <c1/>, slik at det offisielle Rust MCP-SDK-et (software development kit) <c2/> og den asynkrone kjøretiden aldri kommer inn i avhengighetsgrafen til den publiserte crate-en <c3/>: en bruker av biblioteket eller Python kompilerer ikke en server vedkommende ikke kjører. (Den ble først skilt ut fordi <c4/> er <b>edition { "2024" }</b> og trenger rustc ≥ { "1.85" }, mens hovedcrate-en den gang lovte { "1.75" }. Biblioteket oppgir nå { "1.85" }; denne serveren oppgir { "1.88" }, gulvet for den sikkerhetspatchede <c5/> { "2" }.x.) Kontinuerlig integrasjon (CI) setter port for denne crate-en på egen hånd — tester og <c6/> mot sin egen låsfil. Lisenstreet til rmcp er rent (Apache-2.0/MIT/BSD), så, i motsetning til krysskontrollcrate-en <c7/> den ellers speiler, handler splittingen ikke om lisensiering.

seg-75bf2d74642d = Lisens: AGPL-3.0-only, GNU Affero General Public License versjon { "3" } alene (eller en kommersiell lisens fra Ashforde OÜ; se <a1>LICENSING.md</a1> i depotet).

seg-490ebbefb561 = <s1>Forrige</s1>Rust-crate

seg-350b6b914734 = <s1>Neste</s1>MCP-server: alle installasjonskanaler
