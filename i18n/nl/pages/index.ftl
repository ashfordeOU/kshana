# index: translations (nl)

seg-5cce5bd43a6b = AI-assistent

seg-bd4da5bc989d = Gegenereerd uit de repository

seg-8b738c82a006 = Kies hoe u installeert

seg-2469b76c5361 = Proberen in de browser

seg-4cd111ab2de6 = Opdrachtregel (Rust)

seg-379f49bff6fb = Python

seg-ada3fcf67363 = JavaScript en WebAssembly

seg-86566e989fd1 = AI-assistent (MCP-server, cargo)

seg-6816f4e1a0a0 = Versie

seg-78240346be65 = Nieuwste

seg-1e466f300d6e = v{ $version } vastzetten

seg-d8008680650d = Voor iedereen, niets te installeren.

seg-567be575c392 = De engine draait lokaal als WebAssembly; er wordt niets geüpload.

seg-3df5e87998a1 = { -brand } Studio openen

seg-baa129bfde8b = Voor ingenieurs die de opdracht kshana willen.

seg-7635e731e2ed = Kopiëren: cargo install kshana

seg-a438a9c22d93 = cargo install kshana

seg-9b7ab12bdc24 = Controleer het daarna

seg-ef5d93d86762 = crates.io: kshana

seg-0bee80bf3587 = Gebruik van de opdrachtregel

seg-7e7bd8b95987 = Voor analisten en notebooks.

seg-f0e7f4300315 = Kopiëren: pip install kshana

seg-f8b955a55c46 = pip install kshana

seg-965e1b5d2d99 = PyPI: kshana

seg-15b1e4c3e367 = Gids voor de Python-API

seg-b617f3e23c43 = Voor web- en Node.js-ontwikkelaars.

seg-e041699adc44 = Kopiëren: npm install kshana

seg-24b13e851369 = npm install kshana

seg-37497aec27f8 = npm: kshana

seg-d74b8819d872 = Gids voor npm en WebAssembly

seg-56691d997ee6 = Voor iedereen die een assistent met MCP-ondersteuning gebruikt.

seg-e28638b04b18 = Kopiëren: cargo install kshana-mcp

seg-e5b97a088d7c = cargo install kshana-mcp

seg-fa37e351f6b4 = Kopiëren

seg-34908f7d11bb = crates.io: kshana-mcp

seg-61a4eb09767f = Gids voor de MCP-server

seg-f36464ef1b66 = JetBrains Marketplace

seg-4895b1130db4 = AI-assistent + kshana-mcp

seg-4d7cd0c679fc = Afspelen

seg-2eef59dde3f2 = Opgenomen sessie

seg-686139ab9806 = De berichten die een assistent uitwisselt met kshana-mcp, vastgelegd van de server.

seg-50605fd27580 = Vorige stap

seg-32c07578eab3 = Stappen van de opgenomen sessie

seg-2cff891dc970 = Volgende stap

seg-45da99dccd40 = Een opgenomen sessie met de kshana-mcp-server (Model Context Protocol, engine v{ $version }): de assistent geeft de { "49" } hulpmiddelen weer, controleert <c1/> (geldig: gedetecteerde scenariosoort `clock`) en voert het uit: scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity { "1.000" } security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity { "1.000" } security n/a (no attack).

seg-102015d6ebd2 = <c1/>: Voer een { -brand }-scenario uit en geef de tijdreeks ervan terug als animatie.

seg-0247e08ba09d = <c1/>: Beoordeel het vertrouwen in een echt GNSS-ontvangerlogboek: lees een u-blox-UBX-, RINEX { "3" }- (eventueel met uitgezonden navigatiegegevens, wat de eigen positiebepaling van de engine, RAIM en een klokgestuurde monitor toevoegt), Android-GnssLogger- of NMEA-logboek, laat de vertrouwensmonitors draaien (daling van de draaggolf-ruisdichtheid, AGC, jamming-indicator, verlies van vergrendeling, positiesprong, RAIM, klok) tegen een kalibratiebasislijn, en geef terug wanneer en waarom de ontvanger niet meer te vertrouwen was.

seg-155a62e8bc94 = <c1/>: Beoordeel het NMEA { "0183" }-logboek van een vaartuig als batchrun (`kshana receiver-trust` met `[platform] kind = "vessel"`): het scoremodel, de monitors die draaiden en de score van 0 tot 100 van elke epoche met zijn aftrekken, de satellietgeometrie ervan (good, degraded, unknown) met een `label` (good, fair, poor) bij elke epoche, waarbij geometrie alleen aftrekt wanneer die poor is, en een klasse bij elke aftrek (geometry, environment, inconsistency), met `geometry_model` (drempels, het geldende plafond en de ondergrens, en herkomst) en `geometry_summary`.

seg-8ff4e06de726 = <c1/>: Beoordeel een begrensd fragment van de NMEA { "0183" }-stream van een vaartuig zoals `kshana receiver-trust live` dat doet, en geef de vertrouwenstoestand per epoche (calibrating, nominal, degraded, untrusted) en de score van 0 tot 100 terug, met de monitors die aftrokken (live JSON-lines-schema { "1.3" }: elke epoche bevat `position`, een `advisory`-verklaring dat de uitvoer adviserend is, en zijn satelliet-`geometry` (good, degraded met redenen zoals few-satellites of high-pdop, of unknown wanneer het fragment geen GSV of GSA heeft) met een `label` (good, fair, poor; geometrie trekt alleen af wanneer die poor is); elke aftrek bevat een `class`: geometry (de hemel, geen vaststelling dat er geen aanval was), environment of inconsistency (aanvalachtig)), de samenvatting (aantallen per toestand, geometrie en klasse, laagste en laatste score, wanneer de eerste untrusted epoche kwam) en de laatste `$PKSHT`-zin.

seg-7de08fd247e0 = <c1/>: Bind een RFC { "3161" }-tijdstempeltoken aan een bewijspakket (`kshana evidence attach-timestamp`), in het geheugen: `files` is een pakket zoals `create_evidence_pack` het teruggeeft, `token_base64` de bytes van het `.tsr`-bestand van een tijdstempelautoriteit.

seg-dc1953969ec4 = <c1/>: Bouw een GNSS-interferentiekaart uit openlijk gelicentieerde positiemeldingen van vliegtuigen (ADS-B NIC/NACp) of schepen (AIS), aangeleverd als CSV-tekst (`kshana interference-map adsb|ais`).

seg-7a7a1e7a3f0d = <c1/>: De statische koppeling met openbare kaders (`kshana compliance-report --mapping` / `--sources`) als Markdown: één tabel per kader met per rij de geparafraseerde vraag, de { -brand }-uitvoer die er bewijs voor levert en het hiaat dat de uitvoer niet dicht; of, met `sources` op true, de brondocumenten die de tabellen aanhalen, met versies en URL's.

seg-21caa50ec277 = <c1/>: Vul de koppeling met openbare kaders in uit { -brand }-resultaatdocumenten (`kshana compliance-report`): voor welke rijen van zes kaders en standaarden voor veerkracht (het Amerikaanse DHS-kader Resilient PNT v2.0, IMO-richtlijnen voor schepen, EASA-richtlijnen voor de luchtvaart, NIS2 artikel { "21" }, EN { "16803" }, NIST IR 8323r1) de aangeleverde runs bewijs leveren, voor welke niet, en het hiaat dat elke rij behoudt.

seg-e9202a8c1176 = <c1/>: Maak een ondertekend bewijspakket voor een venster van het NMEA { "0183" }-logboek van een vaartuig (`kshana receiver-trust evidence`): de ruwe logbytes voor het venster, de configuratie met elke drempel, de resultaten en redenen per epoche, een zelfstandige samenvattingspagina, en een manifest met de SHA-256 van elk bestand, met de hash van het volledige logboek en een hashketen, ondertekend met Ed25519.

seg-f09af0fa8fcd = <c1/>: Maak het ondertekende round-trippakket voor het laboratorium (`kshana evidence round-trip`, docs/spec/TEST-CONDITIONS.md): koppelt via hash het scenario dat de beweging voortbracht, het document `kshana.test-conditions/1` van het laboratorium, het ontvangerlogboek en de score ervan tegen de vermelde gebeurtenissen, in een ondertekend bewijspakket waarvan `config.json` een `round_trip`-blok bevat.

seg-404efdf9e8d2 = <c1/>: Exporteer een { -brand }-scenario in één interoperabiliteitsformaat: `czml` (Cesium Language, voor CesiumJS), `kml` (Keyhole Markup Language, voor Google Earth en geografische informatiesystemen), `geojson` (RFC { "7946" }), `stk` (Systems Tool Kit-efemeride `.e`, één bestand per satelliet) of `sigmf` (opname in Signal Metadata Format van de gesynthetiseerde samples van een `spectrum`-scenario).

seg-91fc7df72b42 = <c1/>: Exporteer de gepropageerde constellatie van een `orbit`-scenario als CCSDS OEM { "2.0" }-efemeridetekst — de inertiële (TEME) toestandstijdreeks met positie EN snelheid, die vluchtdynamicahulpmiddelen (GMAT / Orekit / STK) lezen.

seg-e7086c7b5491 = <c1/>: Exporteer de gemiddelde elementen van een `orbit`-scenario als CCSDS 502.0-B-2 OMM-catalogus (Orbit Mean-Elements Message) — één OMM per satelliet.

seg-5689ddc45bb8 = <c1/>: Exporteer de gepropageerde constellatie van een `orbit`-scenario als SP3-c-tekst met precieze efemeriden (het standaardformaat voor GNSS-nabewerking).

seg-73b7eb38abe9 = <c1/>: Voer een { -brand }-scenario uit en geef de reproduceerbaarheidstabel ervan terug als CSV-tekst — de byte-stabiele tabel die de CLI schrijft als `<scenario>.table.csv` en die de artikelen aanhalen.

seg-afec41e44d7a = <c1/>: Exporteer de voertuigbeweging en gebeurtenissen van een scenario voor een GNSS-simulator in een laboratorium (`kshana bench-export`, docs/TEST-BENCH.md): een bewegings-CSV en de JSON-beschrijving ervan (aardgebonden en geodetische positie, snelheid, attitude, UTC), NMEA { "0183" }-zinnen GGA/RMC, een waypointtekst wanneer het samplerooster op de milliseconde regelmatig is, en de gebeurtenissen van het scenario als CSV en als `[[events]]`-TOML voor een `receiver-trust`-scenario.

seg-cffb261ea30e = <c1/>: Pas de sensorparameters van de scenario's `hybrid` en `fusion` aan uit een stationair IMU-logboek (`kshana imu-fit`, docs/MACHINE-INPUTS.md).

seg-c31f25888d91 = <c1/>: Genereer synthetische NMEA { "0183" } van de brug voor bemanningstraining uit een `nmea-scenario`-TOML (`kshana nmea-scenario`): een vaartuigtrack en een tijdlijn van gescripte gebeurtenissen (jamming, positie-wegtrekking, tijdspoofing, replay-vertraging, met herstel).

seg-b1ed1e518609 = <c1/>: Geef de TOML-tekst van één meegeleverd referentiescenario terug, byte voor byte het bestand dat de repository onder `scenarios/` meelevert.

seg-aafdb73abfac = <c1/>: Schrijf een GeoJSON-route in een { -brand }-scenario dat een waypointtrack vliegt, en geef de nieuwe scenario-TOML terug (voer die uit met run_scenario).

seg-21086f42f34d = <c1/>: FFT-acquisitie van een of meer PRN's over een IQ-opname in de werkmap (`kshana iq acquire`).

seg-4091e4073457 = <c1/>: Voer een lab-replaycampagne uit die in de werkmap staat (`kshana iq campaign`): opnamen (elk beschreven door een `kshana.test-conditions/1`-bestand met de bekende referentie van het lab) x front-endketens x lusontwerpen, elke cel gevolgd en gescoord tegen de vermelde omstandigheden (tijd tot verlies van vergrendeling, heracquisitietijd, C/N0-degradatie tegen de vermelde J/S naast een analytische referentie met het label MODELLED, percentage valse vergrendeling, PLL/DLL-jitter, beschikbaarheid).

seg-df54bfe48786 = <c1/>: Rapporteer de voortgang van een lab-replaycampagne uit de uitvoermap in de werkmap, uitsluitend door bestanden te lezen: voltooide en openstaande cellen, de opnamen, front-ends en ontwerpen in het plan, en de `digest` zodra elke cel klaar is.

seg-ddc737c9ba9a = <c1/>: Pas front-end- en interferentieonderdrukkings-DSP van de ontvanger toe op een IQ-opname in de werkmap en schrijf het resultaat als nieuwe ruwe opname met een `<out>.json`-sidecar (`kshana iq frontend`).

seg-0f9fef6134e1 = <c1/>: Beschrijf één IQ-opname in de werkmap zonder haar te verwerken: soort (ruw met sidecar, SigMF, SigMF-collectie), sampleformaat, samplefrequentie, middenfrequentie, totaal aantal samples, duur, gegevensbestanden en hun grootte, opnamegrenzen en aantal annotaties, als JSON (dezelfde rij die `kshana iq info` afdrukt).

seg-d416e59af6b1 = <c1/>: Pas het model voor verlies van vergrendeling van de volglus aan op labruns (`kshana iq labfit`): een `iq-labfit`-scenario-TOML noemt een of meer runs, elk een ontvangerlogboek plus de vermelde testomstandigheden; de engine laadt elk logboek, past de lus- en empirische modellen aan, bootstrapt de onzekerheid en berekent de fout op de achtergehouden set.

seg-a409849c2544 = <c1/>: Laat de monitors voor interferentie en spoofdetectie draaien over een IQ-opname in de werkmap (`kshana iq monitor`): de breedbandige monitors `power` en `spectral` en, gegeven `signal` + `prns`, de monitors voor C/N0 en signaalkwaliteit per satelliet, elk tegen een basislijn die is geleerd uit de eerste `baseline_s` seconden (of uit een instellingenbestand).

seg-442716c37495 = <c1/>: Genereer een GNSS-IQ-scène met meerdere satellieten in een bestand in de werkmap (`kshana iq scene`).

seg-d965c4c42205 = <c1/>: De configuratie van de GNSS-IQ-laag, als JSON: `signals` (de signaalnamen die iq_scene, iq_acquire en iq_track accepteren), `enabled` (of de IQ-bestandshulpmiddelen aan staan), `work_dir` (de enige map die ze lezen en schrijven; elk padargument is relatief eraan), `max_samples` (de meeste complexe samples die één aanroep mag genereren of verwerken) en, wanneer uit, `reason`.

seg-0709a11ca4ed = <c1/>: Speel één IQ-opname in de werkmap af over meerdere ontwerpen van de volglus en rapporteer het stationaire resultaat van elk ontwerp (`kshana iq sweep`): de ontwerpen zijn elk ontwerp van een `kshana.loop-design/1`-bestand (`design`), of het product van de lijsten `pll_bws_hz`, `dll_bws_hz`, `spacings_chips` en `coherents` op het ingebouwde ontwerp.

seg-155a371604fb = <c1/>: Controleer een testconditiebestand van een lab (`kshana iq conditions`): een `kshana.test-conditions/1`-bestand, TOML- of JSON-tekst, met de bekende referentie van het lab voor een opname (de verwachte satellieten, de insteltijd, het vermelde schema van jamming of interferentie).

seg-e485776388d7 = <c1/>: Acquireer en volg daarna een of meer PRN's over een IQ-opname in de werkmap (`kshana iq track`): acquisitie initialiseert elk kanaal, waarna de DLL/PLL-lusbank (eventueel FLL-ondersteund) de opname één keer afspeelt.

seg-604b653903df = <c1/>: Lees de gepubliceerde Jammertest-testcatalogus en het zendplan (NPRA/jammertest-plan, MIT) als geplande referentie (`kshana jammertest import`): de slots van één testgebied worden receiver-trust-gebeurtenissen met de catalogus-id en het jaar in elk label.

seg-32761d35a4f0 = <c1/>: Score een ontvangerlogboek tegen het Jammertest-schema (`kshana jammertest score`): per geplande test de detectielatentie (eerste alarm min geplande start), of die binnen de tolerantie, te laat of niet is gedetecteerd, en de hersteltijd (een alarmvrij stuk van `recover_hold_s`), plus de valse alarmen buiten elk slot en zijn beschermperiode.

seg-c41dc865f6f0 = <c1/>: Geef de meegeleverde referentiescenario's weer als JSON: `count`, en `scenarios`, een array van `name`, `kind` en `about` (de eerste zin van de eigen kopcommentaar van het bestand).

seg-8744e56b9d92 = <c1/>: Rapporteer welke interoperabiliteitsexportformaten van toepassing zijn op een { -brand }-scenario, zonder het uit te voeren: een JSON-array met één item per formaat (`czml`, `kml`, `geojson`, `stk`, `sigmf`) met `applies`, de `reason` wanneer het niet van toepassing is, en `spec_url`, de gepubliceerde specificatie die de schrijver volgt.

seg-a16109ccf9e7 = <c1/>: Geef elke ingebouwde { -brand }-scenariosoort weer met zijn beschrijving en verplichte/optionele TOML-velden, als JSON-array.

seg-299e14da6de8 = <c1/>: Geef de standaardenpakketten weer (`kshana standards-pack list`): gescoorde scenariosets voor de testprofielen van het DHS Resilient PNT-kader, IMO MSC.1/Circ.1575 en ICAO Doc { "9849" } Appendix F, elk met de drempels die het voor de run vermeldt en de compliance-rijen waarvoor het bewijs levert.

seg-1097125b8282 = <c1/>: Controleer het LunaNet Augmented Forward Signal (AFS) tegen de gepubliceerde specificatie, vastgezet op LNIS Version { "5" } Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } januari { "2025" }) (`kshana lunanet-afs-check`, docs/LUNANET-AFS.md).

seg-9a7ca52ec440 = <c1/>: Render kshana-bench-resultaatbestanden (`kshana bench leaderboard`) als de statische leaderboardpagina, HTML-tekst in het antwoord: `results` is een lijst van JSON-teksten `kshana-bench-result/1` (hoogstens { "256" }, { "4" } MiB elk), elk eerst gecontroleerd; een bestand dat onder een andere hoofdversie van de specificatie is gescoord, wordt geweigerd omdat resultaten van verschillende hoofdversies nooit in één tabel worden gezet.

seg-4b61dd090d87 = <c1/>: Voer een { -brand }-scenario uit en geef het rapport terug: een managementsamenvatting, de invoer, elke resultaatwaarde met zijn eenheid en zijn label VALIDATED of MODELLED, de gebeurtenissen, de mogelijkheidsrijen die de run heeft doorlopen, en een reproduceerbaarheidsrecord (engineversie, SHA-256-digests van scenario en resultaat, seed, de opdracht die het reproduceert).

seg-02b4cd768b39 = <c1/>: Vat samen hoeveel van een route door gedegradeerde cellen van een of meer interferentiekaarten loopt (`kshana route-exposure`): voor elke kaart (een per bron per UTC-dag, de GeoJSON die `build_interference_map` teruggeeft) de routelengte en de aandelen van de lengte in gedegradeerde cellen, in cellen die niet gedegradeerd waren, in cellen met te weinig steekproef om te beoordelen, en in cellen die niet zijn waargenomen.

seg-00f57717440f = <c1/>: Voer een { -brand }-PNT-veerkrachtscenario uit een TOML-definitie uit en geef de kwaliteitsmaten ervan terug.

seg-de0623ad4fa4 = <c1/>: Voer één standaardenpakket uit (`kshana standards-pack run <id>`): elk scenario erin, gescoord tegen drempels die vóór de run zijn vermeld.

seg-ac7502865a0b = <c1/>: Score een kshana-bench-inzending (`kshana bench score`, bench/SPEC.md, docs/BENCH.md): een voorspellingsbestand (`kshana-bench-predictions/1`) tegen een referentiebestand (`kshana-bench-truth/1`), beide JSON-tekst, hoogstens { "4" } MiB elk, en geef het resultaatbestand (`kshana-bench-result/1`) terug met de specificatieversie, taak (a detectie op ontvangerlogboeken, b detectie op IQ, c voorspelling van holdover van tijdsynchronisatie, d optimismekloof buiten de verdeling), split, de SHA-256 van beide invoeren en de metrieken van de taak (AUC, detectiekans bij een plafond voor valse alarmen, RMSE per horizon, of de optimismekloof).

seg-961963f408a6 = <c1/>: Hemelgeometrie onder een azimutafhankelijke skyline (een straatcanyon, een haven, een fjord, een containerterminal): vanaf een locatie, een tijdstip en constellatievoorinstellingen, tweeregelige elementensets (`tle`, met een UTC-`epoch`) of satellieten gegeven als azimut/elevatie of ECEF, welke satellieten zichtbaar zijn en welke door de skyline verborgen, GDOP/PDOP/HDOP/VDOP/TDOP uit de door gnss_lib_py gecontroleerde DOP-kern, de east-north-up-cofactor en covariantie met één ontvangerklok per systeem (of één gemeenschappelijke), en de horizontale foutellips bij één sigma en bij een vermeld betrouwbaarheidsniveau voor een vermelde UERE.

seg-76679b4d7efd = <c1/>: Render een GNSS-vertrouwensstream of een `receiver-trust`-resultaat als beveiligingstelemetrietekst (`kshana trust-telemetry`, docs/TRUST-TELEMETRY.md), met dezelfde encoders als de opdrachtregel: `prometheus` (de exposition van de eindtoestand), `cef` of `leef` (één RFC { "5424" }-syslogregel per bandwijziging, of per epoche met `syslog_all`; geen tijdstempel, omdat er geen klok wordt gelezen) of `otlp` (de OTLP/HTTP-JSON-metricspayload).

seg-e20044725e3a = <c1/>: Controle vooraf van een { -brand }-scenario-TOML: verifieer dat het als TOML parset en detecteer de scenariosoort ervan, zonder het uit te voeren.

seg-2598d06895ec = <c1/>: Verifieer een ondertekend bewijspakket (`kshana evidence verify`): de SHA-256 van elk bestand tegen het manifest, de hashketen, de Ed25519-handtekening, en met `public_key` (de sleutel van de ondertekenaar, van de ondertekenaar via een andere route) dat de ondertekenaar de verwachte is, en met `full_log` dat het logboek dat u hebt het logboek is dat het pakket vastlegt en dat het fragment eruit komt.

seg-62b5564e8d90 = De opgenomen sessie wordt hier stap voor stap afgespeeld.

seg-2359edf78388 = <b>Dezelfde run in de Studio:</b> Engine v{ $version } · <c1/> · seed { "42" }

seg-f79048f88b5c = Kshana Studio starten

seg-6d83359b2c68 = Consolestatus

seg-b02b3eeec184 = scenariosoorten

seg-4051fcd29291 = Eén engine voor de hele storingsketen.

seg-fcceae001aec = Echte run

seg-5a742c1e1563 = Vastgelegde run van <c1/> (seed { "7" }, engine v{ $version }): { "5" } GNSS-banden, { "3" } jammers gedurende { "60" } s, trackingvloer { "25" } dB-Hz. Jammers: chirp-privacyapparaat op { "1,575.42" } MHz van { "10" } s tot { "40" } s; CW-toon op L1 op { "1,575.42" } MHz van { "30" } s tot het einde; smalbandige ruis op L2 op { "1,227.60" } MHz van { "45" } s tot het einde.

seg-45d6be782732 = GPS L1 C/A verliest de lock op { "10" } s en blijft verloren, laagste waarde { "3.2" } dB-Hz. Galileo E1 verliest de lock op { "10" } s en herstelt op { "40" } s, laagste waarde { "4.4" } dB-Hz. GPS L2C houdt de lock gedurende de hele run, laagste waarde { "36.9" } dB-Hz. GPS L5 houdt de lock gedurende de hele run, laagste waarde { "44.1" } dB-Hz. Galileo E5a houdt de lock gedurende de hele run, laagste waarde { "46.7" } dB-Hz.

seg-ba40ce1e86f4 = De campagne die hij aanstuurt, <c1/> (seed { "20260928" }): L-bandjamming vanuit het spectrum, klok-holdover en een terugval op alleen Galileo. Holdover gedurende { "600" } s met de klok vrijlopend, grootste tijdfout { "5.06" } ns tegenover een bewaking van { "50" } ns; daarna een terugval op alleen Galileo met een beschermingsniveau van { "6.1" } tot { "17.7" } m, onder de alarmlimiet van { "50" } m.

seg-59357db6305b = Ontvangeruitlezing voor de getoonde rij

seg-bc907a2168d9 = Tracking

seg-496b64cd28ae = De waterfall pauzeren

seg-9b72c27df6b3 = vloer

seg-711d291bfa6b = Interferentie

seg-d34ffe4fa777 = Spoofing

seg-501d3a72ea43 = Integriteit

seg-9a86ef058d27 = Openen in Kshana Studio

seg-34a0cf94d83d = De exports van de run openen in Kshana Studio: reproduceerbaar HTML-rapport, JSON, CSV

seg-92ab4fe6f441 = De getekende gegevens downloaden als kommagescheiden waarden

seg-3a93f60a7714 = <s1><a1>Rapport</a1></s1>

seg-c851aa23ea42 = kommagescheiden waarden

seg-366c59b03b4f = CSV

seg-512b89d5fa64 = Deze grafiek downloaden als schaalbare vectorafbeelding

seg-337b0e0254a1 = schaalbare vectorafbeelding

seg-cb273d6705c6 = SVG

seg-16ae98bcbc09 = Beschermingsniveaus tegenover de alarmlimiet

seg-b93510b54de9 = Engine v{ $version } · <c1/> · seed { "20260925" }

seg-1f26707d3e84 = Positiefout sinds het verlies van GNSS

seg-5fe3425693c9 = Engine v{ $version } · <c1/> · seed { "7" }

seg-5165e977af9e = Voorspelde tijdfout sinds de laatste positiebepaling

seg-f8451afc02f2 = Engine v{ $version } · <c1/> · deterministisch, geen seed

seg-70e2bacd66aa = Engine v{ $version } · <c1/> · deterministisch, geen seed

seg-b3d3ed0ec310 = Engine v{ $version } · <c1/> · deterministisch, geen seed

seg-4248eb5c3aef = Holdover

seg-a51c36133548 = Tijdsynchronisatiemaskers

seg-29e58493fdd4 = Berekend uit een model

seg-f42465f7d066 = ns

seg-ff90679d1de9 = Spoofingdetectie

seg-257c477dc510 = WebAssembly

seg-2192262e26c1 = gehaald

seg-785218a0ea66 = Wat Kshana niet is

seg-b366150de755 = Een studie aanvragen

seg-12f050093898 = Waarom iedereen het nodig heeft

seg-d997b6a5a416 = Waarom Pro, nog meer

seg-4ff013b472ff = Welk ontwerp moeten we vliegen?

seg-f4eb65b9b27a = Lunaire navigatieconstellatie: minste satellieten tegenover beschikbaarheid, hele Maan: { "608" } ontwerpen uitgevoerd, een Pareto-front van { "12" } ontwerpen

seg-c8ce2e4a6687 = Hoe zeker zijn we, en wat bepaalt het resultaat?

seg-049c503c23db = Klok-holdover met een onzeker ruisniveau: het 5e tot 95e percentiel van { "2,000" } runs tegenover de limiet van { "20" } ns

seg-3dd37275b448 = Haalt de missie haar eisen, en kunnen we dat overdragen?

seg-7fbde256debf = niet gehaald

seg-f6ccb7a322b3 = openstaande punten

seg-6d3d0f8c9b7c = Een Pro-evaluatie aanvragen

seg-813d6d41b891 = Kopieer de opdracht die het reproduceert

seg-a0ef302e2458 = Opdracht kopiëren

seg-6df96ca25c68 = Waarom en voor wie

seg-e8ab991fe284 = Kshana-missieconsole

seg-dc0fbd6f3e76 = Ontvanger · { "8" } volgend

seg-212f0234925f = Jammer · { "1.0" } km verderop

seg-e8b014e4fa7b = Spoofer · { "0.1" } ns/s tijdverschuiving

seg-b8890ff22c4a = Afspelen

seg-fdac3e95b3d9 = Missie <b>T+{ "00" }:{ "00" }:{ "00" }</b>

seg-5e5365b80dfb = Scenario <b>campaign-jam-spoof-holdover-integrity</b>

seg-d0b9f1d1b637 = Nominaal

seg-12d3b7275c99 = <s1>Engine v{ $version } · seed { "20260928" }</s1><s2>Echte run</s2>

seg-2c7bf2e50347 = GNU Affero General Public License, versie { "3" }

seg-162d704ff027 = <s1>v{ $version }</s1>Opensource · <s2>AGPL-3.0</s2> · door Ashforde®

seg-69d3fae797e4 = Oefen de minuut waarop <em>GNSS uitvalt.</em>

seg-015e3cff4eda = Kshana is een opensource-simulator voor de veerkracht van PNT (positiebepaling, navigatie en tijdsynchronisatie). Speel jamming, spoofing en klok-holdover opnieuw af wanneer GNSS-signalen (Global Navigation Satellite System) uitvallen, in een Rust-engine die direct in uw browser draait, en zie precies welke resultaten zijn gecontroleerd aan de hand van onafhankelijke referenties.

seg-8b095f7254ed = Installatieopdracht kopiëren: cargo install kshana

seg-f0e9de10d9ef = cargo install kshana<s1>Kopiëren</s1>

seg-ec3957c0f5f1 = Druk op <c1/> om pagina's, scenario's en documentatie te doorzoeken

seg-a92f77bd42cb = <s1>Kshana Pro</s1><c1/><s2>Dezelfde engine, versterkt: { "608" } ontwerpen, één Pareto-front</s2>

seg-b807a8887172 = Telemetrie afgespeeld uit de geketende campagnerun

seg-d367c9a1c6fc = Klokfout<s1>tegenover { "50" } ns bewaking · lineair</s1>

seg-6746a919dc04 = T+{ "0" }

seg-7d5a96436755 = nu

seg-2434e53fa54e = Draaggolf-ruisdichtheid<s1>C/N0 · ondergrens { "25" } dB-Hz</s1>

seg-bf842cdbb9d3 = Beschermingsniveau tegenover alarmgrens<s1>PL · AL { "50" } m, verticaal</s1>

seg-146c6926eae1 = Gebeurtenissenlogboek van de geketende campagnerun

seg-7dfaa4627c3e = Gebeurtenissenlogboek · campaign-jam-spoof-holdover-integrity

seg-47d596393831 = Echte gebeurtenissen

seg-5630c799cec1 = Waar elk spoor vandaan komt

seg-f70fa3b93b11 = Het eigen rapport van de engine over deze run

seg-d32a11c090e1 = Het resultaat van de engine, ongewijzigd

seg-c459bc5805bb = Het scenariobestand dat is uitgevoerd

seg-f18f76c10709 = <s1><a1>Rapport</a1><a2>JSON</a2><a3>TOML</a3></s1>

seg-f2d2f2263e63 = De console, de drie kaarten en het logboek spelen één geketende run af van { "6" } fasen en { "18" } deelruns op zijn raster van { "10" } s (T+{ "01" }:{ "16" }:{ "10" } missietijd). De banen zijn de { "102" } satellieten van GPS, Galileo, BeiDou en GLONASS uit de constellatierun, elk teruggewonnen als cirkelvormige tweelichamenbaan uit het grondspoor van de engine (slechtste residu { "0.0034" }°), met voor de weergave samengedrukte stralen. Verbindingen worden getekend naar satellieten boven het masker van { "10" }° van de constellatierun ({ "25" }° in de fase van het integriteitsalarm, het heroverwervingsmasker van de campagne), gedimd door de jamming en doorgesneden in holdover. Aarde: NASA Blue Marble en Black Marble. Kshana Studio speelt de geketende run af in uw browser; het eigen rapport van de engine en de opdracht reproduceren elke run.

seg-a6603a1011ce = Bewijs in één oogopslag

seg-92c73c398785 = meegeleverde scenariobestanden

seg-4fe9e7c5932f = mogelijkheden in de verificatiematrix

seg-d2c0888d98f6 = getoetst aan onafhankelijke externe referenties

seg-3a3535770138 = <s1>artikelen op arXiv gebouwd op de open engine</s1><s2>Lees het onderzoek <c1/></s2>

seg-c44c0fbefc2c = <s1>WASM</s1><s2>draait in de browser als WebAssembly, zonder installatie</s2>

seg-471b95f0c08f = <a1>Wat elk doet en wat is gecontroleerd</a1> · <a2>Elk installatiekanaal</a2>

seg-a9bca0fa5b04 = L-bandconsole · de soort spectrum

seg-abbe9f20dd01 = Kijk hoe een jammer de band overneemt.

seg-7b1868001271 = De GNSS-L-band als één PSD (power spectral density): frequentie horizontaal, tijd verticaal, kleur voor vermogen boven de ruisvloer. De signalen liggen onder die vloer, dus wat oplicht zijn de jammers: een chirp, een CW-toon (continuous-wave) en smalbandruis. Beweeg, tik of gebruik de pijltoetsen voor de <b>C/N0</b> (draaggolf-ruisdichtheid) en <b>J/S</b> (jammer-signaalverhouding) van elke band.

seg-06d71fc57b8d = <b>kshana</b> spectrum <s1>· <s2>l-band-waterfall-jamming.toml</s2></s1>

seg-2da07c5d32d7 = L-bandwaterval, frequentie horizontaal en tijd verticaal. Met de pijltoetsen beweegt u een cursor over frequentie en tijd; Escape verlaat hem.

seg-46f65efc3be9 = De waterval wordt met JavaScript getekend uit de vastgelegde run. Het rapport van de engine hieronder toont dezelfde run.

seg-f3ea569d443f = Slechtste band

seg-48dcdfbbe753 = –<s1>dB-Hz</s1>

seg-14b3348ff8ea = Draaggolf-ruisdichtheid van elke band tegenover de volgondergrens

seg-3e189946819a = De campagne die deze run aanstuurt · elke fase volgt de toestand van de jammer

seg-b4033994f81b = Enginerun van <c1/>

seg-33979077de8c = De opdracht kopiëren die de run reproduceert: kshana l-band-waterfall-jamming.toml

seg-17d5d311b110 = Enginerapport

seg-7a6ff36f0f04 = $ kshana l-band-waterfall-jamming.toml

seg-1fd08ac5f6f0 = Scenario, resultaatdata, de campagnerun en wat is gemodelleerd

seg-997412b840c2 = Spectrumrun

seg-c9ee69e3ce3e = Scenariobestand

seg-aaeaa4133766 = Resultaatdata

seg-e9d1763a751f = Campagne die het aanstuurt: <c1/>

seg-444a43f5d0d7 = Berekend uit een model: gesloten-vorm-spectra boven een thermische ruisvloer, per band gescoord op spectrale scheiding; jammervermogens en -tijdstippen zijn scenario-invoer. De tijdas telt seconden vóór nu; de cyaanblauwe lijn markeert waar het afspelen opnieuw begon. Kshana Studio voert hetzelfde scenario uit in uw browser en speelt de waterval af; het rapport en de opdracht reproduceren de run.

seg-9c4762bc4c66 = Missietijdlijn

seg-8b148fc948fa = Missietijdlijn · scrol of sleep om te scrubben

seg-984aa8353e29 = Elke satelliet wordt gevolgd. De klok is gesynchroniseerd op GNSS-tijd en het beschermingsniveau ligt ruim onder de alarmgrens.

seg-53dff207c2e7 = T+{ "00" }:{ "00" }:{ "00" }

seg-06909bd3c972 = Missietijd

seg-de619b311b43 = <b>kshana</b> campaign <s1>· campaign-jam-spoof-holdover-integrity · seed { "20260928" }</s1>

seg-348b3f146fd1 = Fasen en de deelruns die elke fase uitstuurt

seg-5ca22bdcb463 = Fasen · deelruns

seg-8332e436d097 = Nominaal<s1>T+{ "00" }:{ "00" }:{ "00" }</s1>

seg-297f821b911b = seed { "42" }

seg-0c4140f95fe8 = seed { "1" }

seg-dfe6a1451d36 = seed { "7" }

seg-e6df43ef3bcc = Jamming<s1>T+{ "00" }:{ "10" }:{ "00" }</s1>

seg-639fb18e57e0 = seed { "43" }

seg-599691a88cac = Spoofing<s1>T+{ "00" }:{ "20" }:{ "00" }</s1>

seg-14f57653cd5c = Holdover<s1>T+{ "00" }:{ "26" }:{ "10" }</s1>

seg-4be8c1c7aeb6 = seed { "44" }

seg-d78a727a49a3 = Integriteitsalarm<s1>T+{ "00" }:{ "56" }:{ "10" }</s1>

seg-612e8a49730d = seed { "45" }

seg-8cc810de504f = Herstel<s1>T+{ "01" }:{ "06" }:{ "10" }</s1>

seg-d106d9ae3db3 = seed { "46" }

seg-cea3b8e726c8 = { "6" } fasen · { "18" } deelruns van bestaande soorten

seg-12e134ed7cad = Satellieten · { "102" }, vier systemen

seg-ba2d1b289ed3 = Ontvanger · PL-ring tegenover de AL-ring

seg-aa38fb41591a = Jammer · { "1.0" } km van de ontvanger

seg-f65f922fa89d = Spoofer

seg-d3b2bac50e3d = Klokfout<s1>ns · bewaking { "50" }</s1>

seg-c42b07814ef6 = C/N0<s1>dB-Hz · ondergrens { "25" }</s1>

seg-747943902bc5 = PL tegenover AL<s1>meter · AL { "50" }</s1>

seg-61345694fae0 = De missie afspelen

seg-0d529358e2ad = Jamming

seg-c8df54685469 = Integriteitsalarm

seg-63a70a989509 = Herstel

seg-84a1bf0122ab = T+{ "00" }:{ "00" }:{ "00" } → T+{ "01" }:{ "16" }:{ "10" } missietijd · de geketende run, niet drie runs naast elkaar

seg-dc2eb6c3c2a4 = PL = beschermingsniveau · AL = alarmgrens · INS = traagheidsnavigatiesysteem

seg-0588364091ec = Van de eerste gejamde satelliet tot de laatste nanoseconde klok-holdover: signalen, sensoren, klokken, banen en integriteit in één simulator. Elk beeld hieronder is een echte enginerun en zegt welke.

seg-18e6988c1ccd = GNSS-jamming en interferentie

seg-1d97776ae325 = Een breedbandjammer op een mast en een ontvanger die over een raster eromheen is verplaatst: elke cel is een eigen run van de soort <c1/> van de engine. De tint is de gemiddelde J/S (jammer-signaalverhouding); rode cellen verloren elke satelliet.

seg-4fa6a9f6915d = Jammingvoetafdruk: gemiddelde jammer-signaalverhouding en tracking op een raster van ontvangerposities rond de jammer

seg-774ec89d13d7 = Engine v{ $version } · <c1/> · seed { "1" } · ontvanger per cel verplaatst

seg-7292d543b1ac = Elke cel, bij Missies

seg-08ba18ea712c = Misleiding

seg-f765712462a1 = Een spoofer neemt de ontvanger over en laat de tijd ervan met een constante snelheid afdrijven. De integriteitsmonitor van elke klok heeft zijn eigen detectiegrens: de kwantumklok signaleert de leugen vrijwel meteen, de klassieke pas wanneer de afwijking is gegroeid.

seg-1770a46a99f6 = Gespoofde tijdafwijking tegenover de detectiegrens

seg-0f425005ca69 = De tijdafwijking van een spoofer tegenover de detectiegrens van elke klok, met het moment waarop elke monitor hem signaleert

seg-a9829e27b53b = Engine v{ $version } · <c1/> · deterministisch, geen seed

seg-ab0eb55b688a = Klokken

seg-ceaa6be5f5fd = Klok-holdover over oscillatorklassen heen

seg-c25919241d9e = Vanaf het moment dat GNSS verdwijnt: de mediaan en het 95e percentiel van { "200" } Monte Carlo-runs voor een atoomklok op chipschaal (CSAC) en een optische roosterklok, en de fout na één dag van vier andere klassen: een optische masterklok, een waterstofmaser, een rubidium-atoomfrequentienormaal (RAFS) en de miniatuurversie daarvan (mini-RAFS).

seg-b2019ec6d1c7 = Tijdfoutband over { "200" } Monte Carlo-runs

seg-01961fd0b949 = Klokfout nadat GNSS verloren is: mediaan en 95e percentiel van { "200" } Monte Carlo-runs voor twee klokken, en de fout na één dag van vier oscillatorklassen

seg-ae208f50ab77 = Engine v{ $version } · <c1/> · seed { "42" }

seg-b3ec228c054d = <b>Kolom na één dag:</b> Engine v{ $version } · <c1/> · deterministisch, geen seed

seg-a747535696fa = Koppelnavigatie

seg-ae35aad6ab75 = GNSS/INS-uitloop

seg-0c56d6e5450a = Wanneer GNSS wegvalt, gaat het INS (traagheidsnavigatiesysteem) door en opent zijn foutkegel zich. Twee traagheidsmeeteenheden (IMU's), één budget.

seg-9f97f05ad6bb = Positiefoutkegel nadat GNSS verloren is voor twee traagheidsmeeteenheden, tegenover het positiebudget

seg-142a299dff50 = Hoe lang een klok binnen zijn bewakingsinterval blijft na de laatste positiebepaling: de vraag waar netwerken met tijdslots om geven.

seg-2b3d148b354d = Voorspelde tijdfout sinds de laatste positiebepaling tegenover de slotbewaking

seg-7a7de9a2d48a = RAIM en ARAIM

seg-4d5cad94655f = Beschermingsniveaus (PL) van receiver autonomous integrity monitoring (RAIM) en de geavanceerde vorm ervan (ARAIM), getoetst aan de alarmgrens: hier de integriteitsalarmfase van de geketende missie. Gearceerde balken zijn epochs waarin geen beschermingsniveau kon worden gevormd.

seg-750f6b337ce8 = Verticaal beschermingsniveau bij elke epoche van de integriteitsalarmfase, tegenover de alarmgrens

seg-cdf824111b80 = Telecom

seg-129537868d97 = MTIE (maximum time interval error) en TDEV (time deviation) van een holdover van 24 uur tegenover de grenzen van ITU-T (International Telecommunication Union, Telecommunication Standardization Sector), hier die van PRTC-A (primary reference time clock, klasse A).

seg-7a19d976cca6 = Maximum time interval error en time deviation van de holdoverrun tegenover de PRTC-A-grens

seg-ea5d9e4acbdf = Astrodynamica

seg-5a507113bfff = Banen: SGP4 en numeriek

seg-2ebc9a7b022e = SGP4-propagatie (Simplified General Perturbations { "4" }) van een echte two-line element set, getekend op echte beelden; CCSDS OEM- en SP3-efemeriden als invoer en uitvoer.

seg-c28ef17609ee = Grondspoor van de SGP4-propagatie van de engine voor een echte two-line element set, op NASA Blue Marble-beelden

seg-2bc362b38f3d = Cislunair

seg-7904e93c0bcb = Maan-PNT

seg-48ad4630a03f = Positiebepaling, navigatie en tijdsynchronisatie rond de maan: horizontale en verticale beschermingsniveaus (HPL, VPL) uit ARAIM op een maannavigatiedienst.

seg-f69a91258669 = Maanbeschermingsniveaus uit de LunaNet-ARAIM-run tegenover de alarmgrens, naast de voorkant van de maan

seg-2c2d1fdec798 = Opkomende sensoren

seg-e130f7a43848 = Afwegingsstudies voor kwantumsensoren

seg-577795028a7f = Weeg een kwantumklok af tegen een klassieke voordat iemand hardware koopt: holdover over een reeks ruisniveaus van de klassieke klok.

seg-836a325ef88c = Sweep van classical_q_wf: holdover_s

seg-979452def1d6 = Holdovertijd van een kwantumklok en een klassieke klok over een reeks ruisniveaus van de klassieke klok

seg-ebaa722c5ab6 = Engine v{ $version } · <c1/> · seed { "42" }

seg-1d2973bd0f2f = Draait overal

seg-250a09c4baa0 = Browser, terminal, notebook, IDE, assistent

seg-62ea80e12931 = Dezelfde Rust-engine wordt geleverd als WebAssembly voor Kshana Studio, een CLI (command-line interface), Python- en JavaScript-pakketten, een JetBrains Marketplace-plug-in voor uw IDE (integrated development environment) en een MCP-server (Model Context Protocol).

seg-430082bf58d4 = ghcr.io-image

seg-afd561090841 = CCSDS OEM

seg-9d682a8ff731 = CCSDS OEM: Consultative Committee for Space Data Systems Orbit Ephemeris Message. SP3: Standard Product { "3" }-baanformaat.

seg-70d4597772cb = Reikwijdte, duidelijk gesteld

seg-2ee2e20030f3 = De grenzen kennen is even belangrijk als de functies.

seg-253c54ae2238 = Geen RF-signaalgeneratorhardware<s1>Het stuurt geen radio aan en zendt niets uit; de uitvoer op signaalniveau bestaat uit basisband-IQ-samplebestanden voor software-ontvangers.</s1>

seg-4fe725162c1c = Geen hardwarematige of gecertificeerde GNSS-ontvanger<s1>De software-ontvanger (acquisitie en tracking op vastgelegde of gegenereerde IQ) is een analysehulpmiddel, geen navigatieproduct.</s1>

seg-d3606ea42b36 = Geen vluchtproduct<s1>Een instrument voor studie en afweging, waarbij elk antwoord is gelabeld als getoetst aan een onafhankelijke externe referentie of berekend uit een model.</s1>

seg-57678c2b9a1d = AI-assistenten · kshana-mcp

seg-d473cb253f20 = Vraag het uw AI-assistent. De engine antwoordt.

seg-35f55ec31aeb = Uw AI-assistent (kunstmatige intelligentie) voert de engine uit via MCP (Model Context Protocol) met <b>kshana-mcp</b> en leest JSON (JavaScript Object Notation) terug.

seg-54d5c8e07a24 = Registreer het daarna in de MCP-clientconfiguratie van uw assistent. <a1>Volledige configuratie bij Ontwikkelaars</a1>

seg-7e3b4395292e = Scrollverhaal over spoofing

seg-fb440c81faf1 = Scrollverhaal · één geketende run

seg-24b800b6ec75 = Van een heldere hemel tot een vrij lopende klok.

seg-88e748800e7f = Eén ontvanger, T+{ "01" }:{ "16" }:{ "10" } missietijd: een heldere hemel, een jammer, een spoofer die het antwoord verschuift in plaats van het te blokkeren, en dan een klok die op zichzelf is aangewezen. De { "102" } satellieten zijn de vier systemen van de constellatierun, op de echte aarde. Scrol.

seg-1a913717fbd3 = { "01" } · Nominaal

seg-488b802a8afc = Elke verbinding verantwoord.

seg-2379d9ee4cd0 = { "8" } satellieten gevolgd bij een gemiddelde C/N0 (draaggolf-ruisdichtheid) van <b>{ "43.0" } dB-Hz</b>. Het verticale beschermingsniveau blijft tussen { "9.1" } en { "21.6" } m, onder de alarmgrens van { "50" } m.

seg-8ad9711d8bae = { "02" } · Jamming

seg-c3fa50909f9d = Ruis verzwelgt de hemel.

seg-95d85165182f = Een breedbandjammer op { "1.0" } km afstand gaat aan met <b>-30 dBW</b>. C/N0 zakt naar <b>{ "30.6" } dB-Hz</b>, net boven de volgondergrens van { "25" } dB-Hz. Luid, dus de ontvanger weet het.

seg-1f1bc00b81ee = { "03" } · Spoofing

seg-458faa9a3f96 = Een leugen die op een positiebepaling lijkt.

seg-dda6f0eb3fb6 = Een spoofer duwt de klok op met <b>{ "0.1" } ns/s</b>. De RF-detector (radiofrequentie) slaat alarm bij T+{ "00" }:{ "20" }:{ "00" }; de klokgestuurde monitor heeft <b>{ "370" } s</b> nodig, en tegen die tijd is al { "36.0" } ns binnengehaald.

seg-13be4329a209 = { "04" } · Holdover

seg-fe4fb4387b34 = Dan begint de tijd af te drijven.

seg-4f2ce8d81d29 = De jammer gaat naar { "10" } dBW en elke satelliet gaat verloren. De klok loopt vrij vanaf de { "37.0" } ns die de spoofer achterliet en passeert zijn <b>bewaking van { "50" } ns bij T+{ "00" }:{ "35" }:{ "40" }</b>; de traagheidsfout bereikt { "24.3" } km.

seg-fe656aefe9bb = Klokfout · holdover

seg-548449af47a8 = bewaking { "50" } ns

seg-21e942dadf02 = Legenda van de constellatie

seg-09d18cf767a7 = Open kern, Kshana Pro, maatwerkstudie

seg-302606971c35 = Gratis voor iedereen. Pro wanneer het antwoord een beoordeling moet doorstaan.

seg-27c12083529b = Kshana Pro is een propriëtaire laag die op de open kern steunt en die nooit forkt, beschikbaar onder contract. Geen prijzen op een webpagina: elke betaalde route begint met een bericht aan <a1>contact@ashforde.org</a1>.

seg-43ceda17e71c = Open kern · gratis · AGPL-3.0

seg-0230217b1110 = Iedereen die positie of tijd aan GNSS ontleent, is kwetsbaar: jamming, spoofing en signaalverlies treffen voertuigen, netwerken, elektriciteitsnetten en ruimtevaartuigen even goed.

seg-0af87a1caff4 = Dezelfde kern onder een commerciële licentie, voor gesloten integratie.

seg-f6406933eb77 = De engine installeren

seg-6a74a165bfd0 = Kshana Pro · onder contract

seg-298532756f74 = Het Pareto-front van een ontwerpruimte, waarbij elk ontwerp op het front een scenario is dat de gratis engine opnieuw uitvoert.

seg-a699256db841 = Onzekerheid en gevoeligheid over duizenden runs.

seg-665005551d84 = Een missiedossier met één opdracht, met een verificatiematrix en een pdf-bestand (Portable Document Format).

seg-455cb5040f80 = Reproduceerbare bewijspakketten van auditkwaliteit; digitale kloktweelingen gekalibreerd op het gepubliceerde Allan-budget van uw apparaat; architectuurafwegingen gerangschikt op een kwaliteitsmaat; model-based systems engineering (MBSE) en programmatooling.

seg-3e30593288a1 = Wat Pro omvat

seg-be42106ce1bc = Maatwerkstudie · voor u gedaan

seg-254836cd23af = Maatwerkstudie: het antwoord, niet het hulpmiddel

seg-fb87be7dc462 = Een studie naar de PNT-veerkracht van uw systeem, berekend uit een model, bijvoorbeeld een audit van de optimismekloof. Geen certificering.

seg-b9d62e7772a7 = Sensor- en veerkrachtmodellen gekalibreerd op uw hardware.

seg-57320238c0f4 = Werk onder exportbeperkingen onder de passende vrijwaring en geheimhoudingsovereenkomst (NDA, non-disclosure agreement).

seg-e36049d768ce = Integratie, training en advies.

seg-3303866fbf99 = Dezelfde engine, versterkt: echte uitvoer van Kshana Pro

seg-f5513a1750f1 = <a1><s1><c1/>Ontwerpoptimalisatie</s1></a1>

seg-2bbc6243b4b1 = <b>{ "608" } ontwerpen</b>, allemaal doorgerekend: het Pareto-front en zijn knik

seg-56e344605a3d = <a1><s1><c1/>Onzekerheid en gevoeligheid</s1></a1>

seg-a0b3c138f981 = <b>{ "2,000" } runs</b>: een betrouwbaarheidsband tegenover een grens

seg-6de95aaa8ba4 = <a1><s1><c1/>Missiedossier</s1></a1>

seg-905e5eef45e5 = <b>{ "12" } eisen</b> gecontroleerd aan de hand van echte runs, pdf van 21 pagina's (Portable Document Format)

seg-7d9ee2bfbb90 = Ontdek waar uw tijdsynchronisatie het begeeft, voordat het gebeurt.

seg-f4d3b1f5b1b4 = <b>Campagne:</b> Engine v{ $version }, build <c1/> · <c2/> · seed { "20260928" }

seg-3287261002dd = <b>Banen:</b> Engine v{ $version }, build <c1/> · <c2/> · deterministisch, geen seed

seg-510663384be1 = Engine v{ $version }, build <c1/> · <c2/> · seed { "20260928" }

seg-070972f642de = Een missieketen in Artemis-klasse: het foutenbudget voor navigatie en tijdsynchronisatie van lancering tot terugkeer

seg-4970f874d334 = Het maansegment: rendez-vous, afdaling, oppervlak en opstijging

seg-8ca6e2046901 = Een geschat zendergebied uit ADS-B- of AIS-meldingen

seg-003a3b9b63ea = Gemeten klokloggen, en een holdover aangestuurd door een gefitte reeks

seg-448b11c86f48 = Datapartners: welke rijen gemeten data kan bevorderen

seg-5858e5d1f7c5 = Een bewijslabel bij elk cijfer en elke tabel die een run schrijft

seg-bd28ef5c376e = Zeventien talen naast het Engels

seg-7fae5de5ebf1 = kshana-bench: de herhaalcampagne van { "0.40" }

seg-b9961ed25282 = Nieuw in v{ $version }: een missieketen, een bewijslabel bij elk cijfer en zeventien talen

seg-653cf3198094 = { "176" } van { "401" } mogelijkheden komen overeen met onafhankelijke externe referenties; de rest is hardop als gemodelleerd gelabeld.

seg-76b213d03caa = Alle { "92" } scenariosoorten, gratis zonder functiepoort, deterministisch uit scenario, seed en engineversie.
