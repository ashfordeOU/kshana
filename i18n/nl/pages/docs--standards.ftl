# docs--standards: translations (nl)

seg-4a2ce9f33ab2 = schrijven

seg-9120d3e96e5e = lezen

seg-5ad814c7ef9e = Notities

seg-aab745a65e76 = Module

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = Frame

seg-32b620b3574e = Gebruik

seg-8ba331635865 = Standaarden en interoperabiliteit

seg-96a449a63d11 = Bron: <c1/>

seg-3ed65a16e7d0 = Kshana spreekt de standaard uitwisselingsformaten van de gemeenschappen van GNSS (global navigation satellite system), vluchtdynamica en tijdsynchronisatie, zodat het naast RTKLIB (een opensourcebibliotheek voor real-time kinematic positioning), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit en de analysecentrumtools van de IGS (International GNSS Service) kan staan in plaats van op een eigen eiland. Deze pagina koppelt de <b>uitwisselingsformaten</b> die de engine inleest of uitvoert aan de module die elk ervan implementeert en aan de gezaghebbende specificatie.

seg-d1aa512ad4ee = Ze is beperkt tot formaten: dingen met een leesrichting en een schrijfrichting. De signaal- en algoritmestandaarden die de engine <em>implementeert</em> in plaats van inleest (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (voorheen Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), de ARAIM-referentie (advanced receiver autonomous integrity monitoring) van WG-C (WG: Working Group), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)) worden rij voor rij onderbouwd in <a1><c1/></a1>.

seg-656920618fb7 = Formaten die de engine spreekt

seg-4fe4920a3fa1 = Standaard

seg-d08f1943c53b = Richting

seg-968a1d48364c = Specificatie / instantie

seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

seg-68d762928f76 = lezen <b>en</b> schrijven

seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, KVN-vorm (keyword-value notation)

seg-be700901c03e = Getabelleerde toestandsvector-efemeride die GMAT, Orekit en STK (Systems Tool Kit) inlezen. <c1/> leest haar terug; <b>getoetst door het letterlijke Blue Book-voorbeeld van CCSDS 502.0-B-3 Figure G-11 te reproduceren</b> (<a1><c2/></a1>). Het optionele <b>covariantieblok</b> van { "6" }×{ "6" } voor positie en snelheid (<c3/>, de KVN-serialisatie van de 21 elementen van de onderdriehoek met een optionele <c4/>) wordt zowel geschreven (<c5/>) als gelezen (<c6/>), en is rondreis-symmetrisch (tests van <a2><c7/></a2>).

seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

seg-8e9f975d443b = CCSDS 502.0-B-2, KVN-vorm

seg-fb5218415d68 = Publicatie op de standaardisatieroute van gemiddelde elementen van SGP4/TLE (SGP4: Simplified General Perturbations { "4" }; TLE: two-line element set) (gemiddelde beweging, e, i, Ω, ω, M, BSTAR (de weerstandsterm van de baanpropagator)). Bereikbaar via de CLI (CLI: command-line interface) bij een <c1/>-scenario met <c2/> of <c3/> (één OMM per met een TLE gedefinieerde satelliet, met zijn echte NORAD-id (North American Aerospace Defense Command), COSPAR-aanduiding (Committee on Space Research) en epoche; <a1><c4/></a1>). Een XML-vorm (Extensible Markup Language) en een lezer volgen later.

seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, KVN-vorm

seg-cd96db42ab43 = Volgrecords van afstand, Doppler en hoek die een pass van DSN/ESTRACK (ESTRACK: European Space Tracking network) aanlevert bij een OD-systeem (baanbepaling). <b>Getoetst door het letterlijke Blue Book-voorbeeld van CCSDS 503.0-B-2 Figure E-9 te reproduceren</b> (<a1><c1/></a1>).

seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

seg-ed9c8bdddd6d = De framing van de primaire header van 6 octetten voor TM/TC (TM: telemetrie; TC: telecommando) die grondsystemen uitwisselen. <b>De encoder reproduceert de gepubliceerde testvectoren op byteniveau van de onafhankelijke bibliotheek <c1/></b> (tests van <a1><c2/></a1>).

seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, het formaat voor precieze banen) / SP3-d</b> (precieze efemeride)

seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

seg-8d1089fbd59d = Tijdreeks van positie en klokstand in het aardvaste stelsel (ECEF). Rondreis getoetst tot < { "0.5" } m op een echte momentopname van <c1/> (<a1><c2/></a1>).

seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (uitgezonden navigatie)

seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (interface control document), BeiDou ICD, GLONASS (het Russische Global Navigation Satellite System) ICD)

seg-1b7710db3abf = Inlezen van multi-GNSS-NAV (GPS LNAV (legacy navigation message), Galileo F/NAV, QZSS (het Japanse Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO: medium Earth orbit; IGSO: inclined geosynchronous orbit), GLONASS-toestandsvector); bruikbaar als volwaardige <c1/>-bron.

seg-44991b52d1ff = <b>TLE / 3LE</b> (twee-/drieregelige elementen)

seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

seg-8d4dd42edc89 = Gepropageerd door de getoetste SGP4/SDP4-kern (SDP4: Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm ten opzichte van de { "666" } officiële AIAA-vectoren).

seg-498aac915067 = <b>RINEX 3.0x</b> (waarnemingen)

seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } wordt naar verwachting ingelezen, maar is nooit uitgeprobeerd op een { "4.00" }-bestand)

seg-ac97f77f142c = De andere helft van RINEX: de eigen code-, draaggolf-, Doppler- en SNR-records (SNR: signal-to-noise ratio) van de ontvanger (<c1/>). Dit is de invoer die de single-point-positioning-solver <c2/> samen met het uitgezonden navigatiebestand verwerkt (<a1><c3/></a1>, echt IGS-station ABMF).

seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; globale TEC-kaarten (total electron content))

seg-bf1bb42f04c4 = IONEX { "1" }.x (IGS-ionosfeerproduct)

seg-af9efa0df270 = <c1/> leest de globale rasters van de totale elektronendichtheid van de IGS, het <em>gemeten</em> alternatief voor de uitgezonden Klobuchar-correctie, met bilineaire ruimtelijke en temporele interpolatie en de schuinheidsafbeelding naar schuine vertraging.

seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (aardoriëntatie)

seg-197dfa18ca19 = IERS Conventions; IERS EOP (Earth orientation parameters) { "14" } C04 / <c1/>

seg-0d102d904cfe = UT1 (Universal Time { "1" }, aardrotatietijd)−UTC (Coordinated Universal Time) en poolbeweging uit het officiële product, inclusief de <b>voorspelde</b> rijen, zodat de reductie van het referentiestelsel in real time kan draaien en de groei van haar voorspelfout kan worden begroot (<a1><c1/></a1>).

seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

seg-193b33461507 = deze repository, zie <a1><c1/></a1>

seg-33ef8d792a90 = De neutrale, geversioneerde envelop waarin elk artefact kan worden verpakt: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, met een expliciet major-minor-compatibiliteitsoordeel voor een afnemer. Geen externe standaard; hier gedocumenteerd omdat een vreemd hulpmiddel haar moet herkennen.

seg-a492f437efd0 = LunaNet / IOAG (Interagency Operations Advisory Group) uitwisseling voor de maan

seg-b19cf72da934 = schrijven (tijdmetadata ook lezen)

seg-d641c72a6449 = LunaNet-interoperabiliteitsspecificatie / IOAG-architectuur voor maancommunicatie, bovenop CCSDS { "502.0" }

seg-cc796afe7a72 = Het maanreferentiestelsel, de maantijdschaal en de maanefemeride, uitgegeven in CCSDS-vormen in lijn met LunaNet/IOAG (<c1/>, <c2/>, <c3/>), met een veldcontrole op de uitgegeven OEM (<a1><c4/></a1>).

seg-5abc05382382 = <b>CZML</b> (Cesium Language)

seg-da7e20d3786b = CZML-pakketformaat van CesiumJS

seg-8d3a73646be3 = Een JSON-stroom (JavaScript Object Notation) van pakketten met tijdlabel voor de CesiumJS-globe; bewegende objecten geschreven in GCRS (<c1/>). <c2/> bij elk soort dat objecten op de aarde plaatst.

seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

seg-57468e6d97f2 = Aardvaste lengte, breedte en hoogte voor Google Earth en GIS-hulpmiddelen (geographic information system). <c1/>.

seg-46d977015b07 = schrijven <b>en</b> lezen (route)

seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

seg-425a83b44545 = Aardvaste geometrie voor webkaarten en GIS-hulpmiddelen (<c1/>); een <c2/> wordt teruggelezen als de rechte-spoorinvoer van de soorten die er een vliegen (<c3/>).

seg-d9b137e11514 = <b>STK-efemeride</b> (<c1/>, <c2/>)

seg-347ee6f6c1df = Ansys STK-efemeridebestandsformaat

seg-45576578d357 = Inertiale (<c1/>) positie en snelheid voor STK en hulpmiddelen die zijn efemerideformaat lezen. <c2/>.

seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

seg-42272f73f456 = SigMF-specificatie

seg-202b559c30a6 = Complexe basisbandopnamen plus JSON-metadata: het soort <c1/> schrijft zijn gesynthetiseerde in-phase/quadrature-samples (IQ) (<c2/>) en leest een opname via zijn blok <c3/>.

seg-60e7c8505cb5 = <b>Tekst van het LEO-navigatiebericht</b> (in RINEX-4-stijl en CSV (comma-separated values))

seg-f22442e0e8ea = RINEX { "4" }-navigatielay-out, aangepast

seg-8338e445b3a5 = De uitgezonden efemeride en klok van het soort <c1/> voor een satelliet in een lage baan om de aarde (LEO), geëxporteerd en opnieuw ingelezen; een gedocumenteerde aanpassing, geen geregistreerd RINEX-berichttype (MODELLED in de verificatiematrix).

seg-1b89ab4e93f7 = Referentiestelsels en tijd

seg-dbbd023631b6 = Het stelsel dat de engine uitgeeft is expliciet, niet impliciet. De op CIO gebaseerde reductie (CIO: Celestial Intermediate Origin) volgens IAU (International Astronomical Union) 2006/2000A (<a1><c1/></a1>) en de equinox/GMST-reductie (GMST: Greenwich mean sidereal time) naar TEME (true equator, mean equinox) (<a2><c2/></a2>, <a3><c3/></a3>) zijn bit voor bit getoetst aan de referentievectoren van SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) (zie <a4><c4/></a4>).

seg-819d28bd9361 = Realisatie

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = SGP4 native

seg-7631c594fd1a = Ware evenaar, gemiddelde equinox: het uitvoerstelsel van SGP4/SDP4.

seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

seg-745285e29202 = IAU { "2006" }-precessie + IAU 2000A/2000B-nutatie

seg-3747add299d5 = <c1/> (equinoxketen).

seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

seg-a28e26cd2481 = ERA (Earth rotation angle) + IERS-poolbeweging (CIO) of GMST + poolbeweging (equinox)

seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (equinox).

seg-74a4801fd685 = WGS-84 (WGS: World Geodetic System) geodetisch

seg-b58a44eaaa39 = exact + iteratief invers

seg-4d9472dd73d3 = Tijdschaal

seg-cbe7a7ce7317 = <b>TT</b> (Terrestrial Time)

seg-25191c1a4135 = Evaluatie van het argument voor precessie, nutatie en CIO (<c1/>).

seg-8c478d6b4786 = Aardrotatiehoek / GMST (<c1/>).

seg-f7033ca0c13f = <b>Tweedelige JD</b> (Julian date)

seg-64a5adeacd5b = <c1/> voor een epochenresolutie beneden de µs.

seg-210f40885a8e = Koppeling van uitvoervelden aan de standaard (CCSDS { "502.0" })

seg-e9dbc25a3ee9 = Wat de twee schrijvers van baanberichten in elk veld van CCSDS ODM (Orbit Data Messages, { "502.0" }) zetten, gelezen uit een run van <c1/> met <c2/> en <c3/>:

seg-d2b91c300b82 = Uitvoer van Kshana

seg-119884b009cc = CCSDS ODM-veld

seg-8b0593f67c7f = Waarde / eenheid

seg-d33eb162d179 = Segmentmetadata van OEM

seg-4b338284e56a = <c1/> / <c2/> / <c3/>: het stelsel waarin de propagators integreren en de tijdschaal van het epochenraster, niet herbenoemd

seg-e0a44af9aaf8 = Toestandsepoche van OEM

seg-b0623bab9fcc = eerste kolom van elke gegevensregel

seg-410bd5a9ba14 = kalendertijd volgens ISO-8601 (ISO: International Organization for Standardization), GPS-tijdschaal

seg-a7c95802e01a = Positie en snelheid van OEM

seg-0539cafabf60 = Gegevenskolommen <c1/>

seg-8add7e800e0e = km, km/s

seg-8b386548c03c = Metadata van OMM

seg-e2c63414d7c2 = Epoche van OMM

seg-5109e5948d2a = ISO-8601-vorm met dag van het jaar (de TLE-epoche)

seg-b74289a29c24 = Gemiddelde elementen van OMM

seg-f3492fa95178 = omw/dag, –, deg, 1/aardstralen

seg-fc82185abe10 = De resultaat-JSON (JavaScript Object Notation) van het soort <c1/> bevat dezelfde toestand in SI-eenheden (International System of Units) per sample: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), plus <c8/>, <c9/>, <c10/>.

seg-014d1392018e = Eerlijke reikwijdte

seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF en de tekst van het LEO-navigatiebericht kunnen worden <b>gelezen en geschreven</b>; OMM, CZML, KML en STK-efemeride zijn <b>schrijvers</b> (een OMM-lezer en de XML-serialisatie volgen later); GeoJSON wordt geschreven en als route teruggelezen; RINEX NAV, RINEX OBS, IONEX, de IERS EOP-producten en TLE zijn <b>lezers</b>; de maanexport van LunaNet/IOAG is een schrijver waarvan de tijdmetadata een rondreis maken. <a1><c1/></a1> vermeldt welke export voor elk meegeleverd scenario geldt.

seg-68b4f5116419 = De veldkoppeling van CCSDS/IGS hierboven is documentatie, geen verklaring dat aan enige standaard is voldaan; formele beoordeling aan die standaarden (en registratie in de open catalogus van ESA (European Space Agency) ESSR (European Space Software Repository) / NASA (National Aeronautics and Space Administration)) wordt apart bijgehouden en is in afwachting van beoordeling.

seg-e461587ad2cf = De onafhankelijke numerieke kruiscontrole van SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, een zuivere Rust-toolkit voor planetaire geometrie) op de reductie van het referentiestelsel wordt geleverd in de zelfstandige crate <c1/>, die buiten de workspace valt: <c2/> tegenover de rotatie van ANISE van GCRF (Geocentric Celestial Reference Frame) naar ITRF93 (International Terrestrial Reference Frame { "1993" }) over acht epochen { "2020" }–{ "2023" } komt overeen tot ≤ { "0.86" } m op de grond en ≤ { "3.6" } m op GNSS-baanhoogte (zie <a1><c3/></a1>). Ze heeft SPICE-kernels nodig, dus is ze geen standaardpoort van continuous integration (CI).

seg-f6d67027d669 = <s1>Vorige</s1>Mogelijkhedenkaart

seg-01b6270b6c6a = <s1>Volgende</s1>Regeldekking
