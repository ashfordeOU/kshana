# docs--python-api: translations (nb)

seg-5ad814c7ef9e = Merknader

seg-2bd2101ce454 = Flate

seg-fffbeccd4266 = Symbol

seg-a129b9e613d0 = Type

seg-ce0b6a889a87 = Kilde: <c1/>

seg-aea4d3625c20 = Kshana leveres med et førsteklasses Python-grensesnitt (API – application programming interface), bygget med <a1>PyO3</a1> og <a2>maturin</a2>. <c1/>-hjulene bygges mot det stabile binærgrensesnittet (ABI) til Python, slik at ett hjul per plattform fungerer på tvers av CPython ≥ { "3.9" }; hjulene dekker Linux, macOS og Windows, hver på x86-64 og 64-biters ARM (se <a3>WHEEL_TAGS.md</a3>). En medfølgende typestubb (<c2/> + <c3/>) gir editorer og <c4/>/<c5/> full typeinformasjon.

seg-8b0ad6639bd5 = Hurtigstart

seg-28e092a5a781 = Kjør disse utdragene fra roten av en utsjekket kopi av depotet: de leser scenariofiler under <c1/>. NumPy-linjen trenger <c2/>.

seg-8c83544270b5 = Signatur

seg-fa90b5cd182b = Returnerer

seg-6f62744a47df = typet resultat (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

seg-67cd4e7f6ad0 = resultatdokumentet som en JSON-streng (JavaScript Object Notation)

seg-8246b2be7aaf = tilgjengelige scenariotyper + metadata (parset)

seg-b5ad97d3ec18 = de samme metadataene som ÉN JSON-tabellstreng, ikke en liste (beholdt for eksisterende kallere; bruk <c1/> for den parsede listen)

seg-8ce669f8e1d0 = feilmeldinger (tom hvis gyldig)

seg-6017d21f52dd = merkelapp for feilkategori (<c1/>, <c2/>, <c3/> eller <c4/>), eller <c5/> ved suksess

seg-c62c5ab99132 = motorversjon

seg-fdaaf33250d1 = vurder en ekte mottakerlogg beskrevet av et <c1/>-scenario: resultatdokument, tillits-CSV per epoke, diagram og sammendrag; en <c2/>-tabell legger til de maritime overvåkingene og tillitsscoren 0-100 med begrunnelser (veiledende)

seg-0fb76af3d043 = et avgrenset NMEA-utdrag skåret slik live-modus skårer det: tilstand per epoke, score 0-100 og begrunnelser, et sammendrag (ingen socket, ingen gate; veiledende)

seg-6ecd9bb3a1cd = et fartøys NMEA-logg som en batchkjøring: scoremodellen og hver epokes score med fradragene (veiledende)

seg-7cd62f15bc3c = den publiserte katalogen og planen for Jammertest som hendelser med planlagt fasit (<c1/>, <c2/>); planlagte tidsluker, ikke registrerte sendetider

seg-1e2faf2894e3 = en mottakerlogg skåret mot denne planen: latens per test, bom, tid til gjenoppretting, falske alarmer (MODELLED; en signert pakke krever kommandolinjen)

seg-f94eaef45f04 = en signert bevispakke for et vindu av loggen, i minnet: <c1/>, <c2/>, <c3/> (hold den privat); en teknisk registrering, ikke en juridisk vurdering

seg-ebd10aea2f6f = verifiser en pakke: hasher, kjede, signatur, eventuelt den betrodde signereren, hele loggen og et tidsstempel; <c1/> er <c2/>, <c3/> (ingen offentlig nøkkel oppgitt: intakt, signereren ikke fastslått) eller <c4/>

seg-bf13e70f1d5c = CLI-ens <c1/>-artefakter som tekst

seg-1e5eb44bec6f = hvilke interoperabilitetsformater som gjelder for et scenario, uten å kjøre det

seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> eller <c5/> i minnet: <c6/>, hver fil <c7/> (<c8/>-tekst eller <c9/>)

seg-bef8250e8453 = en GeoJSON-rute skrevet inn i et scenario med veipunktspor (<c1/>)

seg-e25bcb6342db = kjøringens tidsserier som en animert SVG, en HTML-spiller eller opptil { "120" } SVG-bilder: <c1/>

seg-9b24b9cf0510 = de medfølgende referansescenarioene og deres TOML

seg-f62c11fe1e7d = bind et RFC { "3161" }-token (bytes eller base64) til en pakke i minnet: <c1/>; pakken må fortsatt verifiseres; autoritetens signatur kontrolleres ikke

seg-95fe54b500a7 = en ny signeringsnøkkel i minnet: <c1/> (PRIVAT), <c2/>, <c3/>, <c4/>; bare Python

seg-646e6aba13db = spill av ett opptak på nytt over sløyfeutforminger (<c1/>): per utforming og PRN stabil jitter, låsandeler og C/N0; én innhenting per PRN, hver kanal på de samme sampelene

seg-08d46de5e7cd = beskriv ett opptak, eller hvert opptak i en mappe (leser filer; <c1/> leser dem fullt ut)

seg-7d9cc8394e65 = et scenarios kjøretøybevegelse og hendelser for en GNSS-simulator i laboratorium, i minnet: <c1/>; typene <c2/>, <c3/>, <c4/>; ingen signal skrives, behold <c5/> sammen med filene

seg-e215c7242eb2 = kartleggingen mot offentlige rammeverk fylt ut fra resultattekster: <c1/> er en liste av <c2/>-dicter (tekst, høyst { "64" }); returnerer <c3/>; hver rads <c4/> sier at kjøringene gir belegg for funksjonene dens, ikke at et rammeverk er innfridd; ta med <c5/> ved enhver visning

seg-18d57e4920dd = de statiske kartleggingstabellene (eller kildedokumentene) som Markdown, med erklæringen først

seg-8284e10dce6a = standardpakkene (id, tittel, rammeverk, antall tester) og en merknad; en pakke måler modellerte scenarioer mot terskler som er fastsatt før kjøringen

seg-ce6b819604a9 = én pakkekjøring: hver test <c1/>, <c2/> eller <c3/> med målte og forventede verdier, pluss rapporten som Markdown under <c4/>; kaster <c5/> for en ukjent id

seg-0f701bc523c6 = LunaNet AFS-implementasjonen kontrollert mot de trykte tabellene og de gjennomarbeidede eksemplene i LSIS-AFS V1.0 (terskler B1 til B10; B4 rapporterer én fastsatt bom)

seg-82aecf261c46 = en AFS-symbolstrøm (tekst med { "0" } og { "1" }) kontrollert for synkroniseringsmønster, SB1-dekoding, FID, TOI-kontinuitet og avstand; LDPC og CRC-24Q for delrammene { "2" } til { "4" } verifiseres ikke

seg-f72ab45ae10b = en testsymbolstrøm med plassholder-delrammer (ikke en bølgeform)

seg-1da34527bb64 = den signerte laboratoriepakken for rundtur som kobler scenario, testbetingelser (<c1/>), mottakerlogg og score med hash; som <c2/>

seg-dd3726fec672 = en kshana-bench-resultatfil (JSON-tekst) fra en fasitfil og en prediksjonsfil; MODELLED

seg-b82a110c324c = kshana-bench-resultatfiler gjengitt som den statiske ledertavlesiden (HTML)

seg-58b8aa919eaf = Galileo OSNMA-autentisering av I/NAV-sider eller en UBX-strøm i minnet: dicten <c1/> skriver ut, med den veiledende merknaden i feltet <c2/>; bare veiledende, ikke en tjeneste for navigasjonsintegritet

seg-15e4601cd88c = satellittene et sted ser under en azimutavhengig horisontlinje: per satellitt <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, øst–nord–opp-kofaktoren og -kovariansen og de horisontale feilellipsene; <c3/> er JSON- eller TOML-tekst eller en dict (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); avgjørelsen om synlighet og ellipsen er kontrollert mot uavhengige biblioteker, resten er MODELLED, og resultatet bærer den veiledende merknaden (<c14/>, <c15/> sier om horisonten er representativ eller fra elementsett)

seg-51ac7cd68154 = <c1/> ({ "1" } til { "5000" }) minstekvadratfeil med seed på den synlige mengden i <c2/>, med deres empiriske kovarians, RMS og andelen innenfor { "95" } %-ellipsen

seg-8bba3099379a = horisontlinjenes forhåndsinnstillinger (<c1/>, <c2/>, <c3/>, <c4/>) med merkelappen REPRESENTATIVE, proveniens og kuttet for hver grad av azimut; representative geometrier, ikke oppmålinger

seg-f900de61f6e9 = en horisontlinjeseksjon (tabell, gatekløft, sektorer, terreng) redusert til den normaliserte tabellen med 360 oppføringer som motoren bruker

seg-824f3c5951fa = skyplottet for <c1/> som statisk SVG-tekst

seg-0ffb65c8f5f3 = en tillitsstrøm (<c1/>) eller <c2/>-resultat som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP-JSON-nyttelast, med kodererne i <c3/>; ingenting sendes og ingen klokke leses (syslog-linjer har ikke tidsstempel)

seg-c1ab3dbbe2f2 = et GNSS-interferenskart fra ADS-B- eller AIS-CSV-tekst: én dict per UTC-døgn med <c1/> GeoJSON (bare aggregert; en degradert celle peker ikke ut interferens som årsak)

seg-ff4bc7fdbce7 = andel av en rute gjennom degraderte celler i disse kartene, som JSON-tekst (ikke en prognose; celler uten observasjoner er ikke belegg for en klar rute)

seg-d70bccba0e03 = syntetisk NMEA fra broen til mannskapstrening pluss instruktørloggen (<c1/>, <c2/>, <c3/>); bare tekst, aldri til et fartøys levende navigasjonssystemer

seg-3fe13851ac82 = GNSS IQ-signalnavnene som <c1/>, <c2/> og <c3/> godtar (<c4/>, <c5/>, <c6/>, ...)

seg-50bf4ad4e23a = en GNSS IQ-scene med flere satellitter i minnet: <c1/> / <c2/> og <c3/> per epoke

seg-b3199839a37c = det samme, med hver GPS-satellitt i geometrien fra sin kringkastede efemeride, fra en RINEX-navigasjonsmelding (Receiver Independent Exchange Format)

seg-8f0f9efea46b = FFT-innhenting (fast Fourier transform) av hver PRN (pseudorandom noise code): Doppler, kodefase, statistikk, terskel

seg-3bf994f3f1bf = hele innhentingsflaten til én PRN (<c1/>): <c2/> korrelasjonseffekt, toppen og to finere Doppler-forbedringer (<c3/>, <c4/>)

seg-393572e31421 = innhent og spor deretter hver PRN: Doppler, kodefase, låseindikatorer, C/N0 og prompt-korrelator per epoke

seg-bc39efdb015a = mottakerens front-end-kjede (båndpass, notch, blanking, excision, AGC (automatic gain control), kvantiserer) over komplekse sampler

seg-ead1b81c712f = tilpass modellen for tap av lås i sporingssløyfen til en tillitstidslinje for mottakeren (et <c1/>-scenario)

seg-0ab8531d0465 = parse en <c1/>-fil (en sti eller TOML-tekst) til de løste utformingene, hver med sin <c2/> og <c3/>; <c4/> for en ugyldig fil

seg-9c3467d4451e = les en binær fil med sporingsepoker (<c1/>, slik <c2/> skriver den): <c3/> og én dict per epoke i <c4/>

seg-469303e33d2a = IQ-deteksjonsmonitorene over et opptak i ett strømmende gjennomløp (<c1/>): <c2/>, <c3/>, <c4/> og <c5/>; leser en fil

seg-bb5c5008f1a8 = valider en fil med labtestbetingelser (<c1/>, TOML eller JSON, en sti eller tekst) og returner den løst, med sin <c2/>

seg-d2441bf762b4 = kjør en kampanje for avspilling i lab (<c1/>) inn i <c2/> slik <c3/> gjør; ferdige celler hoppes over; returnerer antall celler, feil og <c4/> når hver celle er ferdig

seg-7b6d264d9c7f = bygg en kampanjes resultatkort, HTML-rapport og sammendrag på nytt fra cellene: antall celler og rader, radene som feiler en terskel og <c1/>

seg-e3956268cf1c = Signaturer for GNSS IQ og mottakertillit

seg-817bd0898d46 = De fullstendige signaturene, slik <c1/> oppgir dem (hvert nøkkelord etter de obligatoriske argumentene har en standardverdi; docstringene i stubben forklarer hvert enkelt). Pakk listene <c2/> / <c3/> og inndataene <c4/> / <c5/> inn med <c6/> for tabeller.

seg-2dd9323829ce = En kampanje for avspilling i lab fra Python, så rapporten (kampanjefilen og opptakene er dine; en ferdig celle hoppes over ved neste kall; <c1/> leser en fil med sporingsepoker som en <c2/>-kjøring skrev):

seg-5f48b88438df = <c1/>s <c2/> bestemmer hvor mange kodeperioder overleveringsinnhentingen integrerer koherent. Fra { "0.33.0" } er standarden <c3/>, som betyr automatisk: omtrent { "4" } ms ({ "4" } perioder for en kode på { "1" } ms som GPS L1 C/A, { "1" } for en kode på { "4" } ms eller lengre), slik at kanalen starter nær nok til at frekvenssløyfen kan trekke seg inn; <c4/> beholder søket med én periode fra { "0.32" }.

seg-012a83181bd3 = Typer

seg-0b4f4c6c6014 = <c1/> typer de lukkede vokabularene for kontrollprogrammer (mypy, pyright): <c2/> (hvert typenavn, en <c3/>), <c4/> (de fire merkelappene <c5/> returnerer), <c6/> og <c7/>-ene <c8/> (det <c9/> returnerer en liste av) og <c10/> (en oppføring i et resultats <c11/>-blokk, som utvider basen med obligatoriske nøkler <c12/>). De finnes bare for typekontrollere og kan ikke importeres ved kjøring; <c13/> holder dem like motorens lister.

seg-b5ad0d8e1456 = Medlem

seg-2698ab8436e6 = fullt resultatdokument (JSON)

seg-7eccc8361120 = frittstående diagram-SVG (Scalable Vector Graphics)

seg-38c8d20ca07a = enlinjes sammendrag for mennesker

seg-e21e82ad3fe8 = reproduserbarhetstabellen, for typene som gir en (se nedenfor)

seg-aadcc1cc4c79 = resultatet parset til en Python-dict (se merknaden om formen nedenfor)

seg-409504363c4c = den numeriske listen ved <c1/> (med punktum, <c2/>, eller en JSON Pointer, <c3/>): 1-D for tall, 2-D for numeriske lister av lik lengde

seg-b6d5d7e5271a = listen av poster ved <c1/> (en tidsserie), én tabell per felt som er et tall i hver post

seg-adb2d15f9f74 = hver liste av poster med et numerisk felt, nøklet på sti med punktum, hver som <c1/>

seg-7f053ad96880 = skriv den tabellen til <c1/>; returnerer antall bytes skrevet, eller { "0" } (og skriver ingenting) når typen ikke gir noen tabell

seg-276104139e73 = Reproduserbarhetstabellen

seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> og <c5/> publiserer alltid en tabell; <c6/> publiserer en når et eksportsted (<c7/> + <c8/>) er konfigurert. Alle andre typer returnerer <c9/>. Teksten er de samme bytene som CLI-en (kommandolinjegrensesnittet) skriver som <c10/>, slik at en gjennomgangsperson som gjenskaper en publisert tabell fra hjulet aldri må gå ned på kommandolinjen:

seg-3ad2987110ee = Resultatets form

seg-57c7066d3522 = Kvalitetsmålene og tidsseriene ligger <b>per kjøringsside</b>, ikke på toppnivå. For en klokkekjøring er dokumentet:

seg-cb19f961de2b = slik at kvalitetsmålene er <c1/>, aldri <c2/>. Andre typer gir sine egne pakker; den fullstendige referansen per felt, med enheter og en kildehenvisning, er <a1><c3/></a1>, og veiledningen for leseren er <a2><c4/></a2>.

seg-bfd984e0407b = <c1/> og <c2/> <b>kjører</b> scenarioet, slik at de avdekker parse-, konfigurasjons- <em>og</em> kjøretidsfeil. De kaster aldri unntak.

seg-0ca0a1da8356 = <c1/> / <c2/> kaster <c3/> ved et ugyldig scenario.

seg-901c2ede0cd0 = Resultater kan gjenskapes: et scenario bærer sin <c1/> og motoren registrerer en <c2/>, slik at samme inndata gir byte-identiske utdata på samme plattform (se <a1><c3/></a1>).

seg-8c0c32fcba2b = <c1/>, <c2/> og <c3/> returnerer nøyaktig <c4/> av de samme verdiene som <c5/> gir (samme dtype, bit-identisk; <c6/>). De importerer NumPy ved kall og kaster <c7/> uten det; NumPy holdes utenfor pakkens krav ved kjøring. <c8/> betyr at stien mangler, <c9/> at verdien der ikke er en numerisk tabell (eller ikke en liste av poster). Kjørbare notatbøker finnes i <a1><c10/></a1>.

seg-00a3cf088cde = Ikke i Python: langvarige prosesser

seg-3780dd4973f0 = <c1/> (en strømprosess med en gate og en valgfri <c2/>-TCP-server) og telemetrieksportørene (Prometheus, OTLP, syslog; <c3/>) og strømming med <c4/> er bare tilgjengelige på kommandolinjen: en binding returnerer når kallet returnerer og holder ikke en socket åpen. Python dekker batchformen av hver: <c5/> for en logg, <c6/> for et strømutdrag (score og tilstander; gaten brukes ikke), <c7/> for den genererte teksten.

seg-82379c29d438 = <s1>Forrige</s1>Kaldatom-interferometer

seg-4a457afc63fb = <s1>Neste</s1>npm og WebAssembly

seg-dbbce10a12d2 = RunOutput

seg-a4c68601516f = estimerte senderområder fra ADS-B- eller AIS-CSV-tekst: <c1/>, hver merket MODELLED; områder ved oppgitt konfidens med et tyngdepunkt og en usikkerhetsellipse, aldri et bart punkt; bare aggregert, og et område er ikke posisjonen til noen og heller ikke et funn om årsaken
