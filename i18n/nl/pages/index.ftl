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

seg-c5fc0ca71fae = Elke scenariosoort, elk een eigen pagina

seg-ccee5886cf25 = Elke opdracht, elk oppervlak

seg-4ef6dcd0a58b = Welk oppervlak welke mogelijkheid draagt

seg-29e58493fdd4 = Berekend uit een model

seg-8e092e49bdeb = kshana-bench: de drempels die niet zijn gehaald, vermeld

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
