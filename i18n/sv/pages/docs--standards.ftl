# docs--standards: translations (sv)

seg-4a2ce9f33ab2 = skriva

seg-9120d3e96e5e = läsa

seg-5ad814c7ef9e = Anteckningar

seg-aab745a65e76 = Modul

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = Ram

seg-32b620b3574e = Användning

seg-8ba331635865 = Standarder och interoperabilitet

seg-96a449a63d11 = Källa: <c1/>

seg-3ed65a16e7d0 = Kshana talar de standardiserade utbytesformaten hos GNSS-gemenskapen (global navigation satellite system), flygdynamik- och tidsgemenskaperna så att den kan fungera tillsammans med RTKLIB (ett bibliotek med öppen källkod för kinematisk positionering i realtid), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit och verktygen hos IGS:s (International GNSS Service) analyscentra i stället för på en privat ö. Den här sidan kopplar de <b>utbytesformat</b> som motorn tolkar eller skriver ut till den modul som implementerar vart och ett och till den auktoritativa specifikationen.

seg-d1aa512ad4ee = Den är avgränsad till format — saker med en läs-/skrivriktning. De signal- och algoritmstandarder som motorn <em>implementerar</em> snarare än tolkar (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (tidigare Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), referensen från ARAIM (advanced receiver autonomous integrity monitoring) WG-C (WG: Working Group), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)) belagda rad för rad i <a1><c1/></a1> i stället.

seg-656920618fb7 = Format som motorn talar

seg-4fe4920a3fa1 = Standard

seg-d08f1943c53b = Riktning

seg-968a1d48364c = Specifikation / auktoritet

seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

seg-68d762928f76 = läsning <b>och</b> skrivning

seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, i formen KVN (keyword-value notation)

seg-be700901c03e = Tabellerad tillståndsvektorefemerid som GMAT, Orekit och STK (Systems Tool Kit) tar in. <c1/> läser tillbaka den; <b>validerad genom att återskapa det ordagranna Blue Book-exemplet CCSDS 502.0-B-3 Figure G-11</b> (<a1><c2/></a1>). Det valfria { "6" }×{ "6" } <b>kovariansblocket</b> för position/hastighet (<c3/>, den 21 element stora KVN-serialiseringen av nedre triangeln med en valfri <c4/>) både skrivs (<c5/>) och läses (<c6/>), symmetriskt vid rundtur (tester i <a2><c7/></a2>).

seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

seg-8e9f975d443b = CCSDS 502.0-B-2, i formen KVN

seg-fb5218415d68 = Publikation i standardspåret av SGP4/TLE (SGP4: Simplified General Perturbations { "4" }; TLE: tvåradig elementuppsättning) medelelement (medelrörelse, e, i, Ω, ω, M, BSTAR (dragtermen i banpropagatorn)). Nåbar från CLI (CLI: kommandoradsgränssnitt) på ett scenario <c1/> via <c2/> eller <c3/> (en OMM per TLE-definierad satellit, med dess verkliga NORAD-id (North American Aerospace Defense Command), COSPAR-beteckning (Committee on Space Research) och epok; <a1><c4/></a1>). Formen XML (Extensible Markup Language) och en läsare är uppföljningar.

seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, i formen KVN

seg-cd96db42ab43 = Avstånds-, doppler- och vinkelspårningsposter som en DSN/ESTRACK-överflygning (ESTRACK: European Space Tracking network) levererar till ett OD-system (banbestämning). <b>Validerad genom att återskapa det ordagranna Blue Book-exemplet CCSDS 503.0-B-2 Figure E-9</b> (<a1><c1/></a1>).

seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

seg-ed9c8bdddd6d = Ramningen av 6-oktetters TM/TC-primärhuvud (TM: telemetri; TC: telekommando) som markssystem utbyter. <b>Kodaren återger de publicerade testvektorerna på bytenivå från det oberoende biblioteket <c1/></b> (tester i <a1><c2/></a1>).

seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, formatet för precisa banor) / SP3-d</b> (precis efemerid)

seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

seg-8d1089fbd59d = Jordfast (ECEF) position + klocktidsserie. Rundtur validerad till < { "0.5" } m på en verklig ögonblicksbild av <c1/> (<a1><c2/></a1>).

seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (sänd navigering)

seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (interface control document), BeiDou ICD, GLONASS (Rysslands globala satellitnavigeringssystem) ICD)

seg-1b7710db3abf = Multi-GNSS-NAV-inläsning (GPS LNAV (legacy navigation message), Galileo F/NAV, QZSS (Japans Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO: medelhög jordbana; IGSO: inklinerad geosynkron bana), GLONASS-tillståndsvektor); användbar som en förstklassig källa för <c1/>.

seg-44991b52d1ff = <b>TLE / 3LE</b> (två-/trerads elementuppsättningar)

seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

seg-8d4dd42edc89 = Propagerade av den validerade SGP4/SDP4-kärnan (SDP4: Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm mot de { "666" } officiella AIAA-vektorerna).

seg-498aac915067 = <b>RINEX 3.0x</b> (observation)

seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } förväntas kunna tolkas, men har aldrig prövats på en fil av version { "4.00" })

seg-ac97f77f142c = Den andra hälften av RINEX: mottagarens egna kod-/bärvågs-/Doppler-/SNR-poster (SNR: signal-brusförhållande) (<c1/>). Detta är indata som lösaren för enkelpunktspositionering <c2/> förbrukar tillsammans med den sända navigeringsfilen (<a1><c3/></a1>, verklig IGS-station ABMF).

seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; globala TEC-kartor (total electron content))

seg-bf1bb42f04c4 = IONEX { "1" }.x (IGS-jonosfärsprodukt)

seg-af9efa0df270 = <c1/> läser IGS globala rutnät för total elektroninnehåll — det <em>uppmätta</em> alternativet till den sända Klobuchar-korrektionen — med bilinjär rumslig och tidsmässig interpolation och snedställningsfaktorn till sned fördröjning.

seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (jordorientering)

seg-197dfa18ca19 = IERS Conventions; IERS EOP (Earth orientation parameters) { "14" } C04 / <c1/>

seg-0d102d904cfe = UT1 (Universal Time { "1" }, jordrotationstid)−UTC (Coordinated Universal Time) och polrörelse från den officiella produkten, inklusive de <b>förutsagda</b> raderna, så att systemreduktionen kan köras i realtid och dess prediktionsfelstillväxt budgeteras (<a1><c1/></a1>).

seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

seg-193b33461507 = det här repot — se <a1><c1/></a1>

seg-33ef8d792a90 = Det neutrala, versionerade höljet som varje artefakt kan lindas in i: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, med ett explicit major-minor-kompatibilitetsutfall för en konsument. Inte en extern standard; dokumenterad här eftersom ett främmande verktyg måste känna igen den.

seg-a492f437efd0 = LunaNet / IOAG (Interagency Operations Advisory Group) månutbyte

seg-b19cf72da934 = skrivning (tidsmetadata läses också)

seg-d641c72a6449 = LunaNet-interoperabilitetsspecifikation / IOAG:s arkitektur för månkommunikation, över CCSDS { "502.0" }

seg-cc796afe7a72 = Månsystemet, månens tidsskala och månefemeriden som skrivs ut i LunaNet/IOAG-anpassade CCSDS-former (<c1/>, <c2/>, <c3/>), med en fältkontroll av den utskrivna OEM (<a1><c4/></a1>).

seg-5abc05382382 = <b>CZML</b> (Cesium Language)

seg-da7e20d3786b = CesiumJS CZML-paketformat

seg-8d3a73646be3 = En JSON-ström (JavaScript Object Notation) av tidsmärkta paket för CesiumJS-globen; rörliga objekt skrivs i GCRS (<c1/>). <c2/> på varje typ som placerar objekt på Jorden.

seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

seg-57468e6d97f2 = Jordfast longitud, latitud och höjd för Google Earth och GIS-verktyg (geografiskt informationssystem). <c1/>.

seg-46d977015b07 = skrivning <b>och</b> läsning (rutt)

seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

seg-425a83b44545 = Jordfast geometri för webbkartor och GIS-verktyg (<c1/>); en <c2/> läses tillbaka som indata för rak bana till de typer som flyger en (<c3/>).

seg-d9b137e11514 = <b>STK-efemerid</b> (<c1/>, <c2/>)

seg-347ee6f6c1df = Ansys STK-efemeridformat

seg-45576578d357 = Inertial (<c1/>) position och hastighet för STK och verktyg som läser dess efemeridformat. <c2/>.

seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

seg-42272f73f456 = SigMF-specifikation

seg-202b559c30a6 = Komplexa basbandsinspelningar plus JSON-metadata: typen <c1/> skriver sina syntetiserade IQ-sampel (in-phase/quadrature) (<c2/>) och läser en inspelning genom sitt block <c3/>.

seg-60e7c8505cb5 = <b>Text för LEO-navigationsmeddelande</b> (RINEX 4-liknande och CSV (kommaseparerade värden))

seg-f22442e0e8ea = Navigationslayout från RINEX { "4" }, anpassad

seg-8338e445b3a5 = Den sända efemeriden och klockan från typen <c1/> för en LEO-satellit (låg jordbana), exporterad och återinläst; en dokumenterad anpassning, inte en registrerad RINEX-meddelandetyp (MODELLED i verifieringsmatrisen).

seg-1b89ab4e93f7 = Referenssystem och tid

seg-dbbd023631b6 = Det system motorn skriver ut är explicit, inte implicit. Den CIO-baserade (CIO: Celestial Intermediate Origin) reduktionen enligt IAU (International Astronomical Union) 2006/2000A (<a1><c1/></a1>) och reduktionen för ekvinox/GMST (GMST: Greenwich mean sidereal time) TEME (true equator, mean equinox) (<a2><c2/></a2>, <a3><c3/></a3>) är validerade bit för bit mot referensvektorerna från SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) (se <a4><c4/></a4>).

seg-819d28bd9361 = Realisering

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = SGP4 nativt

seg-7631c594fd1a = True equator, mean equinox — utdatasystemet för SGP4/SDP4.

seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

seg-745285e29202 = Precession enligt IAU { "2006" } + nutation enligt IAU 2000A/2000B

seg-3747add299d5 = <c1/> (ekvinoxkedjan).

seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

seg-a28e26cd2481 = ERA (Earth rotation angle) + IERS polrörelse (CIO) eller GMST + polrörelse (ekvinox)

seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (ekvinox).

seg-74a4801fd685 = WGS-84 (WGS: World Geodetic System) geodetisk

seg-b58a44eaaa39 = exakt + iterativ invers

seg-4d9472dd73d3 = Tidsskala

seg-cbe7a7ce7317 = <b>TT</b> (Terrestrial Time)

seg-25191c1a4135 = Utvärdering av argument för precession/nutation/CIO (<c1/>).

seg-8c478d6b4786 = Jordrotationsvinkel / GMST (<c1/>).

seg-f7033ca0c13f = <b>Tvådelat JD</b> (Julianskt datum)

seg-64a5adeacd5b = <c1/> för epokupplösning under µs.

seg-210f40885a8e = Utdatafält → standardmappning (CCSDS { "502.0" })

seg-e9dbc25a3ee9 = Vad de två banmeddelandeskrivarna lägger i varje CCSDS ODM-fält (Orbit Data Messages, { "502.0" }), avläst från en körning av <c1/> med <c2/> och <c3/>:

seg-d2b91c300b82 = Kshana-utdata

seg-119884b009cc = CCSDS ODM-fält

seg-8b0593f67c7f = Värde / enhet

seg-d33eb162d179 = OEM-segmentmetadata

seg-4b338284e56a = <c1/> / <c2/> / <c3/> — det system som propagatorerna integrerar i och tidsskalan för epokrastret, inte omdöpt

seg-e0a44af9aaf8 = OEM-tillståndsepok

seg-b0623bab9fcc = första kolumnen på varje datarad

seg-410bd5a9ba14 = ISO-8601 (ISO: International Organization for Standardization) kalendertid, GPS-tidsskala

seg-a7c95802e01a = OEM-position, hastighet

seg-0539cafabf60 = datakolumner <c1/>

seg-8add7e800e0e = km, km/s

seg-8b386548c03c = OMM-metadata

seg-e2c63414d7c2 = OMM-epok

seg-5109e5948d2a = ISO-8601 i formen dag på året (TLE-epoken)

seg-b74289a29c24 = OMM-medelelement

seg-f3492fa95178 = rev/dag, –, deg, 1/jordradier

seg-fc82185abe10 = JSON-resultatet (JavaScript Object Notation) från typen <c1/> bär samma tillstånd i SI-enheter (International System of Units) per sampel: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), plus <c8/>, <c9/>, <c10/>.

seg-014d1392018e = Ärligt omfång

seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF och LEO-navigationsmeddelandetexten är <b>läs och skriv</b>; OMM, CZML, KML och STK-efemerid är <b>skrivare</b> (en OMM-läsare och XML-serialiseringen är uppföljningar); GeoJSON skrivs och läses tillbaka som en rutt; RINEX NAV, RINEX OBS, IONEX, IERS EOP-produkterna och TLE är <b>läsare</b>; LunaNet/IOAG-månexporten är en skrivare vars tidsmetadata gör rundtur. <a1><c1/></a1> anger vilken export som gäller för varje medföljande scenario.

seg-68b4f5116419 = Fältmappningen mellan CCSDS och IGS ovan är dokumentation, inte ett påstående att någon standard uppfylls; formell bedömning mot dessa standarder (och registrering i den öppna katalogen hos ESA (European Space Agency) ESSR (European Space Software Repository) / NASA (National Aeronautics and Space Administration)) spåras separat och väntar på granskning.

seg-e461587ad2cf = Den oberoende numeriska korskontrollen med SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — ett planetgeometriverktyg i ren Rust) av systemreduktionen levereras i den fristående, från arbetsytan uteslutna craten <c1/>: <c2/> mot ANISE:s rotation GCRF (Geocentric Celestial Reference Frame) → ITRF93 (International Terrestrial Reference Frame { "1993" }) över åtta epoker { "2020" }–{ "2023" } stämmer till ≤ { "0.86" } m på marken och ≤ { "3.6" } m vid GNSS-bana (se <a1><c3/></a1>). Den behöver SPICE-kernlar, så den är inte en standardgrind för kontinuerlig integrering (CI).

seg-f6d67027d669 = <s1>Föregående</s1>Förmågekarta

seg-01b6270b6c6a = <s1>Nästa</s1>Radtäckning
