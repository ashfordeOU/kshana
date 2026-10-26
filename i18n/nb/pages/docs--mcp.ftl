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

seg-a30b46501cff = De { "87" } innebygde scenariotypene med beskrivelser + obligatoriske/valgfrie felt — slik at agenten kan konstruere et gyldig scenario.

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
