# docs--standards: translations (da)

seg-4a2ce9f33ab2 = skriv

seg-9120d3e96e5e = læs

seg-5ad814c7ef9e = Noter

seg-aab745a65e76 = Modul

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = Ramme

seg-32b620b3574e = Brug

seg-96a449a63d11 = Kilde: <c1/>

seg-3ed65a16e7d0 = Kshana taler de standardiserede udvekslingsformater i miljøerne omkring GNSS (global navigation satellite system), flyvedynamik og tidssynkronisering, så den kan stå side om side med RTKLIB (et open source-bibliotek til kinematisk positionering i realtid), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit og værktøjerne hos IGS' (International GNSS Service) analysecentre i stedet for på en privat ø. Denne side knytter de <b>udvekslingsformater</b>, motoren parser eller udsender, til det modul, der implementerer hvert af dem, og til den autoritative specifikation.

seg-d1aa512ad4ee = Den er afgrænset til formater: ting med en læse-/skriveretning. De signal- og algoritmestandarder, motoren <em>implementerer</em> frem for at parse (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (tidligere Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), ARAIM (advanced receiver autonomous integrity monitoring) WG-C (WG: Working Group)-referencen, CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)) dokumenteres i stedet række for række i <a1><c1/></a1>.

seg-656920618fb7 = Formater, motoren taler

seg-4fe4920a3fa1 = Standard

seg-d08f1943c53b = Retning

seg-968a1d48364c = Specifikation / autoritet

seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

seg-68d762928f76 = læs <b>og</b> skriv

seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, KVN-form (keyword-value notation)

seg-be700901c03e = Tabuleret tilstandsvektor-efemeride, som indlæses af GMAT, Orekit og STK (Systems Tool Kit). <c1/> læser den tilbage; <b>valideret ved at gendanne ordret CCSDS 502.0-B-3 Figure G-11 Blue Book-eksemplet</b> (<a1><c2/></a1>). Den valgfri <b>kovariansblok</b> på { "6" }×{ "6" } for position/hastighed (<c3/>, den 21-elements nedre-trekant-KVN-serialisering med en valgfri <c4/>) både skrives (<c5/>) og læses (<c6/>), rundturs-symmetrisk (tests i <a2><c7/></a2>).

seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

seg-8e9f975d443b = CCSDS 502.0-B-2, KVN-form

seg-fb5218415d68 = Standardspor-publikation af middelelementer for SGP4/TLE (SGP4: Simplified General Perturbations { "4" }; TLE: to-linjers elementsæt) (middelbevægelse, e, i, Ω, ω, M, BSTAR (modstandsleddet i banepropagatoren)). Kan nås fra CLI (CLI: kommandolinjegrænseflade) på et scenarie <c1/> via <c2/> eller <c3/> (én OMM pr. TLE-defineret satellit, med dens virkelige NORAD-id (North American Aerospace Defense Command), COSPAR-betegnelse (Committee on Space Research) og epoke; <a1><c4/></a1>). XML-form (Extensible Markup Language) og en læser er opfølgere.

seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, KVN-form

seg-cd96db42ab43 = Afstands-/Doppler-/vinkelsporingsposter, som en DSN/ESTRACK-passage (ESTRACK: European Space Tracking network) leverer til et OD-system (banebestemmelse). <b>Valideret ved at gendanne ordret CCSDS 503.0-B-2 Figure E-9 Blue Book-eksemplet</b> (<a1><c1/></a1>).

seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

seg-ed9c8bdddd6d = Rammeopbygningen af den 6-oktets primære TM/TC-header (TM: telemetri; TC: telekommando), som jordsystemer udveksler. <b>Indkoderen gengiver det uafhængige biblioteks <c1/> publicerede testvektorer på byteniveau</b> (tests i <a1><c2/></a1>).

seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, formatet for præcise baner) / SP3-d</b> (præcis efemeride)

seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

seg-8d1089fbd59d = Jordfast (ECEF) position + urtidsserie. Rundtur valideret til < { "0.5" } m på et virkeligt snapshot af <c1/> (<a1><c2/></a1>).

seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (broadcast-navigation)

seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (interface control document), BeiDou ICD, GLONASS ICD (Ruslands Global Navigation Satellite System))

seg-1b7710db3abf = Indlæsning af NAV for flere GNSS (GPS LNAV (legacy navigation message), Galileo F/NAV, QZSS (Japans Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO: mellemhøj jordbane; IGSO: skråtstillet geosynkron bane), GLONASS-tilstandsvektor); kan bruges som en førsteklasses <c1/>-kilde.

seg-44991b52d1ff = <b>TLE / 3LE</b> (to-/trelinjers elementer)

seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

seg-8d4dd42edc89 = Propageret af den validerede SGP4/SDP4-kerne (SDP4: Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm mod de { "666" } officielle AIAA-vektorer).

seg-498aac915067 = <b>RINEX 3.0x</b> (observation)

seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } forventes at kunne parses, aldrig afprøvet på en { "4.00" }-fil)

seg-ac97f77f142c = Den anden halvdel af RINEX: modtagerens egne poster for kode/bærebølge/Doppler/SNR (SNR: signal-til-støj-forhold) (<c1/>). Det er det input, som positionsløseren <c2/> til enkeltpunktspositionering forbruger sammen med broadcast-navigationsfilen (<a1><c3/></a1>, virkelig IGS-station ABMF).

seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; globale TEC-kort (total electron content))

seg-bf1bb42f04c4 = IONEX { "1" }.x (IGS' ionosfæreprodukt)

seg-af9efa0df270 = <c1/> læser IGS' globale gitre for totalt elektronindhold — det <em>målte</em> alternativ til den udsendte Klobuchar-korrektion — med bilineær rumlig og tidslig interpolation og obliquitetsafbildningen til skrå forsinkelse.

seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (jordorientering)

seg-197dfa18ca19 = IERS Conventions; IERS EOP (Earth orientation parameters) { "14" } C04 / <c1/>

seg-0d102d904cfe = UT1 (Universal Time { "1" }, jordrotationstid)−UTC (Coordinated Universal Time) og polbevægelse fra det officielle produkt, inklusive de <b>forudsagte</b> rækker, så referencesystemreduktionen kan køres i realtid og væksten i dens forudsigelsesfejl budgetteres (<a1><c1/></a1>).

seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

seg-193b33461507 = dette repositorium — se <a1><c1/></a1>

seg-33ef8d792a90 = Den neutrale, versionerede indpakning, som alle artefakter kan pakkes ind i: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, med et eksplicit major-minor-kompatibilitetsverdikt til en forbruger. Ikke en ekstern standard; dokumenteret her, fordi et fremmed værktøj skal kunne genkende den.

seg-a492f437efd0 = LunaNet / IOAG (Interagency Operations Advisory Group) månearbejdsudveksling

seg-b19cf72da934 = skriv (tidsmetadata læses også)

seg-d641c72a6449 = LunaNet-interoperabilitetsspecifikationen / IOAG's arkitektur for månekommunikation, over CCSDS { "502.0" }

seg-cc796afe7a72 = Månereferencesystemet, månetidsskalaen og månens efemeride udsendt i LunaNet/IOAG-tilpassede CCSDS-former (<c1/>, <c2/>, <c3/>), med en feltkontrol af den udsendte OEM (<a1><c4/></a1>).

seg-5abc05382382 = <b>CZML</b> (Cesium Language)

seg-da7e20d3786b = CesiumJS' CZML-pakkeformat

seg-8d3a73646be3 = En JSON-strøm (JavaScript Object Notation) af tidsmærkede pakker til CesiumJS-globussen; bevægelige objekter skrevet i GCRS (<c1/>). <c2/> på enhver type, der placerer objekter på Jorden.

seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

seg-57468e6d97f2 = Jordfast længdegrad, breddegrad og højde til Google Earth og GIS-værktøjer (geografisk informationssystem). <c1/>.

seg-46d977015b07 = skriv <b>og</b> læs (rute)

seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

seg-425a83b44545 = Jordfast geometri til webkort og GIS-værktøjer (<c1/>); en <c2/> læses tilbage som det rette sporinput til de typer, der flyver et (<c3/>).

seg-d9b137e11514 = <b>STK-efemeride</b> (<c1/>, <c2/>)

seg-347ee6f6c1df = Ansys STK's efemeridefilformat

seg-45576578d357 = Inertial (<c1/>) position og hastighed til STK og værktøjer, der læser dets efemeridformat. <c2/>.

seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

seg-42272f73f456 = SigMF-specifikationen

seg-202b559c30a6 = Komplekse basisbåndsoptagelser plus JSON-metadata: typen <c1/> skriver sine syntetiserede in-fase/kvadratur-sampler (IQ) (<c2/>) og læser en optagelse gennem sin blok <c3/>.

seg-60e7c8505cb5 = <b>Tekst til LEO-navigationsmeddelelse</b> (i RINEX-4-stil og CSV (kommaseparerede værdier))

seg-f22442e0e8ea = RINEX { "4" }-navigationslayout, tilpasset

seg-8338e445b3a5 = Typen <c1/>s broadcast-efemeride og -ur for en satellit i lav jordbane (LEO), eksporteret og genindlæst; en dokumenteret tilpasning, ikke en registreret RINEX-meddelelsestype (MODELLED i verifikationsmatrixen).

seg-1b89ab4e93f7 = Referencesystemer og tid

seg-dbbd023631b6 = Det referencesystem, motoren udsender, er eksplicit, ikke implicit. Den CIO-baserede (CIO: Celestial Intermediate Origin) IAU-reduktion (International Astronomical Union) 2006/2000A (<a1><c1/></a1>) og ækvinoks/GMST-reduktionen (GMST: Greenwich mean sidereal time) TEME (true equator, mean equinox) (<a2><c2/></a2>, <a3><c3/></a3>) er valideret bit for bit mod referencevektorerne fra SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) (se <a4><c4/></a4>).

seg-819d28bd9361 = Realisering

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = SGP4 native

seg-7631c594fd1a = True equator, mean equinox — SGP4/SDP4's outputsystem.

seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

seg-745285e29202 = IAU { "2006" }-præcession + IAU 2000A/2000B-nutation

seg-3747add299d5 = <c1/> (ækvinokskæde).

seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

seg-a28e26cd2481 = ERA (Earth rotation angle) + IERS-polbevægelse (CIO) eller GMST + polbevægelse (ækvinoks)

seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (ækvinoks).

seg-74a4801fd685 = WGS-84 (WGS: World Geodetic System) geodætisk

seg-b58a44eaaa39 = eksakt + iterativ invers

seg-4d9472dd73d3 = Tidsskala

seg-cbe7a7ce7317 = <b>TT</b> (Terrestrial Time)

seg-25191c1a4135 = Evaluering af argumenterne for præcession/nutation/CIO (<c1/>).

seg-8c478d6b4786 = Jordrotationsvinkel / GMST (<c1/>).

seg-f7033ca0c13f = <b>To-dels JD</b> (juliansk dato)

seg-64a5adeacd5b = <c1/> til epokeopløsning under µs.

seg-210f40885a8e = Afbildning fra outputfelt til standard (CCSDS { "502.0" })

seg-e9dbc25a3ee9 = Hvad de to orbitmeddelelsesskrivere lægger i hvert CCSDS ODM-felt (Orbit Data Messages, { "502.0" }), læst fra en kørsel af <c1/> med <c2/> og <c3/>:

seg-d2b91c300b82 = Kshana-output

seg-119884b009cc = CCSDS ODM-felt

seg-8b0593f67c7f = Værdi / enhed

seg-d33eb162d179 = OEM-segmentmetadata

seg-4b338284e56a = <c1/> / <c2/> / <c3/> — det referencesystem, propagatorerne integrerer i, og tidsskalaen for epokegitteret, ikke omdøbt

seg-e0a44af9aaf8 = OEM-tilstandsepoke

seg-b0623bab9fcc = første kolonne i hver datalinje

seg-410bd5a9ba14 = ISO-8601 (ISO: International Organization for Standardization) kalendertid, GPS-tidsskala

seg-a7c95802e01a = OEM-position, -hastighed

seg-0539cafabf60 = datakolonner <c1/>

seg-8add7e800e0e = km, km/s

seg-8b386548c03c = OMM-metadata

seg-e2c63414d7c2 = OMM-epoke

seg-5109e5948d2a = ISO-8601-form med dag i året (TLE-epoken)

seg-b74289a29c24 = OMM-middelelementer

seg-f3492fa95178 = omdr./dag, –, grader, 1/jordradier

seg-fc82185abe10 = Resultat-JSON (JavaScript Object Notation) for typen <c1/> bærer den samme tilstand i SI-enheder (International System of Units) pr. sampel: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), plus <c8/>, <c9/>, <c10/>.

seg-014d1392018e = Ærligt omfang

seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF og teksten til LEO-navigationsmeddelelsen <b>læses og skrives</b>; OMM, CZML, KML og STK-efemeride er <b>skrivere</b> (en OMM-læser og XML-serialiseringen er opfølgere); GeoJSON skrives og læses tilbage som en rute; RINEX NAV, RINEX OBS, IONEX, IERS' EOP-produkter og TLE er <b>læsere</b>; LunaNet/IOAG-måneeksporten er en skriver, hvis tidsmetadata gør rundtur. <a1><c1/></a1> angiver, hvilken eksport der gælder for hvert medfølgende scenarie.

seg-68b4f5116419 = Feltafbildningen for CCSDS/IGS ovenfor er dokumentation, ikke en erklæring om, at nogen standard er opfyldt; en formel vurdering mod disse standarder (og registrering i ESA's (European Space Agency) ESSR (European Space Software Repository) / NASA's (National Aeronautics and Space Administration) åbne katalog) følges separat og afventer gennemgang.

seg-e461587ad2cf = Den uafhængige numeriske krydskontrol af referencesystemreduktionen med SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — et rent Rust-værktøjssæt til planetgeometri) leveres i den selvstændige crate <c1/>, der er udeladt fra workspacet: <c2/> mod ANISE's rotation fra GCRF (Geocentric Celestial Reference Frame) til ITRF93 (International Terrestrial Reference Frame { "1993" }) over otte epoker { "2020" }–{ "2023" } stemmer til ≤ { "0.86" } m på jorden og ≤ { "3.6" } m ved GNSS-bane (se <a1><c3/></a1>). Den kræver SPICE-kerner, så den er ikke en standard-gate i kontinuerlig integration (CI).

seg-f6d67027d669 = <s1>Forrige</s1>Funktionskort

seg-01b6270b6c6a = <s1>Næste</s1>Linjedækning
