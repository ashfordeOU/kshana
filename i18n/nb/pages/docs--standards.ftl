# docs--standards: translations (nb)

seg-4a2ce9f33ab2 = skriv

seg-9120d3e96e5e = les

seg-5ad814c7ef9e = Merknader

seg-aab745a65e76 = Modul

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = Ramme

seg-32b620b3574e = Bruk

seg-8ba331635865 = Standarder og interoperabilitet

seg-96a449a63d11 = Kilde: <c1/>

seg-3ed65a16e7d0 = Kshana snakker de standard utvekslingsformatene til miljøene for GNSS (globalt navigasjonssatellittsystem), flydynamikk og tidssynkronisering, slik at det kan stå sammen med RTKLIB (et åpen kildekode-bibliotek for sanntids kinematisk posisjonering), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit og verktøyene til analysesentrene i IGS (International GNSS Service) i stedet for på en privat øy. Denne siden kobler <b>utvekslingsformatene</b> motoren leser eller skriver til modulen som implementerer hvert av dem og til den autoritative spesifikasjonen.

seg-d1aa512ad4ee = Den er avgrenset til formater — ting med en lese- og skriveretning. Signal- og algoritmestandardene motoren <em>implementerer</em> i stedet for å lese (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (tidligere Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), ARAIM-referansen (advanced receiver autonomous integrity monitoring) WG-C (WG: Working Group), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)) dokumenteres rad for rad i <a1><c1/></a1> i stedet.

seg-656920618fb7 = Formater motoren snakker

seg-4fe4920a3fa1 = Standard

seg-d08f1943c53b = Retning

seg-968a1d48364c = Spesifikasjon / myndighet

seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

seg-68d762928f76 = leser <b>og</b> skriver

seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, KVN-form (nøkkel-verdi-notasjon)

seg-be700901c03e = Tabulert tilstandsvektorefemeride som leses inn av GMAT, Orekit og STK (Systems Tool Kit). <c1/> leser den tilbake; <b>validert ved å gjenskape det ordrette eksempelet i CCSDS 502.0-B-3 Figure G-11 Blue Book</b> (<a1><c2/></a1>). Den valgfrie { "6" }×{ "6" } <b>kovariansblokken</b> for posisjon/hastighet (<c3/>, den KVN-serialiseringen med 21 elementer i nedre trekant med en valgfri <c4/>) både skrives (<c5/>) og leses (<c6/>), rundtursymmetrisk (tester i <a2><c7/></a2>).

seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

seg-8e9f975d443b = CCSDS 502.0-B-2, KVN-form

seg-fb5218415d68 = Standardsporpublikasjon av middelelementene til SGP4/TLE (SGP4: Simplified General Perturbations { "4" }; TLE: tolinjers elementsett) (middelbevegelse, e, i, Ω, ω, M, BSTAR (dragleddet i banepropagatoren)). Tilgjengelig fra CLI (kommandolinjegrensesnitt) på et <c1/>-scenario via <c2/> eller <c3/> (én OMM per TLE-definert satellitt, med sin virkelige NORAD-id (North American Aerospace Defense Command), COSPAR-betegnelse (Committee on Space Research) og epoke; <a1><c4/></a1>). XML-form (Extensible Markup Language) og en leser er oppfølgere.

seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, KVN-form

seg-cd96db42ab43 = Sporingsposter for avstand / Doppler / vinkel som en DSN/ESTRACK-passering (ESTRACK: European Space Tracking network) leverer til et OD-system (banebestemmelse). <b>Validert ved å gjenskape det ordrette eksempelet i CCSDS 503.0-B-2 Figure E-9 Blue Book</b> (<a1><c1/></a1>).

seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

seg-ed9c8bdddd6d = Rammeinndelingen med 6 oktetters primærhode for TM/TC (TM: telemetri; TC: telekommando) som bakkesystemer utveksler. <b>Koderen gjenskaper de publiserte testvektorene på bytenivå fra det uavhengige biblioteket <c1/></b> (tester i <a1><c2/></a1>).

seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, formatet for presise baner) / SP3-d</b> (presis efemeride)

seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

seg-8d1089fbd59d = Tidsserie for jordfaste (ECEF) posisjoner og klokketid. Validert ved rundtur til < { "0.5" } m på et ekte <c1/>-øyeblikksbilde (<a1><c2/></a1>).

seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (kringkastet navigasjon)

seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (interface control document), BeiDou ICD, GLONASS ICD (Russlands globale navigasjonssatellittsystem))

seg-1b7710db3abf = Multi-GNSS NAV-innlesing (GPS LNAV (legacy navigation message), Galileo F/NAV, QZSS (Japans Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO: middels jordbane; IGSO: skråstilt geosynkron bane), GLONASS-tilstandsvektor); kan brukes som en førsteklasses <c1/>-kilde.

seg-44991b52d1ff = <b>TLE / 3LE</b> (to-/trelinjers elementer)

seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

seg-8d4dd42edc89 = Propagert av den validerte SGP4/SDP4-kjernen (SDP4: Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm mot de { "666" } offisielle AIAA-vektorene).

seg-498aac915067 = <b>RINEX 3.0x</b> (observasjon)

seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } forventes å kunne leses, aldri prøvd på en { "4.00" }-fil)

seg-ac97f77f142c = Den andre halvdelen av RINEX: mottakerens egne kode-/bærebølge-/Doppler-/SNR-poster (SNR: signal-til-støy-forhold) (<c1/>). Dette er inndataene som enkeltpunktsløseren <c2/> bruker sammen med den kringkastede navigasjonsfilen (<a1><c3/></a1>, ekte IGS-stasjon ABMF).

seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; globale TEC-kart (total elektroninnhold))

seg-bf1bb42f04c4 = IONEX { "1" }.x (IGS-ionosfæreprodukt)

seg-af9efa0df270 = <c1/> leser IGS' globale rutenett for totalt elektroninnhold — det <em>målte</em> alternativet til den kringkastede Klobuchar-korreksjonen — med bilineær interpolasjon i rom og tid og skråstillingsavbildningen til skrå forsinkelse.

seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (jordorientering)

seg-197dfa18ca19 = IERS Conventions; IERS EOP (jordorienteringsparametere) { "14" } C04 / <c1/>

seg-0d102d904cfe = UT1 (Universal Time { "1" }, jordrotasjonstid)−UTC (koordinert universaltid) og polbevegelse fra det offisielle produktet, inkludert de <b>predikerte</b> radene, slik at referansesystemreduksjonen kan kjøres i sanntid og veksten i prediksjonsfeilen budsjetteres (<a1><c1/></a1>).

seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

seg-193b33461507 = dette repositoriet — se <a1><c1/></a1>

seg-33ef8d792a90 = Den nøytrale, versjonerte konvolutten alle artefakter kan pakkes inn i: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, med en eksplisitt major-minor-kompatibilitetsavgjørelse for en forbruker. Ikke en ekstern standard; dokumentert her fordi et fremmed verktøy må kunne kjenne den igjen.

seg-a492f437efd0 = LunaNet / IOAG (Interagency Operations Advisory Group) månedatautveksling

seg-b19cf72da934 = skriver (tidsmetadata leses også)

seg-d641c72a6449 = LunaNet-interoperabilitetsspesifikasjonen / IOAGs arkitektur for månekommunikasjon, over CCSDS { "502.0" }

seg-cc796afe7a72 = Månereferansesystemet, månetidsskalaen og månefemeriden skrevet ut i LunaNet/IOAG-tilpassede CCSDS-former (<c1/>, <c2/>, <c3/>), med en feltkontroll av den utskrevne OEM-en (<a1><c4/></a1>).

seg-5abc05382382 = <b>CZML</b> (Cesium Language)

seg-da7e20d3786b = CesiumJS CZML-pakkeformat

seg-8d3a73646be3 = En JSON-strøm (JavaScript Object Notation) av tidsmerkede pakker for CesiumJS-globusen; bevegelige objekter skrevet i GCRS (<c1/>). <c2/> på enhver type som plasserer objekter på jorden.

seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

seg-57468e6d97f2 = Jordfast lengdegrad, breddegrad og høyde for Google Earth og GIS-verktøy (geografisk informasjonssystem). <c1/>.

seg-46d977015b07 = skriver <b>og</b> leser (rute)

seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

seg-425a83b44545 = Jordfast geometri for nettkart og GIS-verktøy (<c1/>); en <c2/> leses tilbake som den rette sporinndataen til typene som flyr en slik (<c3/>).

seg-d9b137e11514 = <b>STK-efemeride</b> (<c1/>, <c2/>)

seg-347ee6f6c1df = Ansys STK-efemeridefilformat

seg-45576578d357 = Inertiell (<c1/>) posisjon og hastighet for STK og verktøy som leser dets efemeridformat. <c2/>.

seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

seg-42272f73f456 = SigMF-spesifikasjonen

seg-202b559c30a6 = Komplekse basebåndopptak pluss JSON-metadata: typen <c1/> skriver sine syntetiserte IQ-sampler (in-phase/quadrature) (<c2/>) og leser et opptak gjennom <c3/>-blokken sin.

seg-60e7c8505cb5 = <b>Tekst for LEO-navigasjonsmelding</b> (RINEX-4-aktig og CSV (kommaseparerte verdier))

seg-f22442e0e8ea = RINEX { "4" }-navigasjonsoppsett, tilpasset

seg-8338e445b3a5 = Typen <c1/> sin kringkastede efemeride og klokke for en satellitt i lav jordbane (LEO), eksportert og importert på nytt; en dokumentert tilpasning, ikke en registrert RINEX-meldingstype (MODELLED i verifikasjonsmatrisen).

seg-1b89ab4e93f7 = Referansesystemer og tid

seg-dbbd023631b6 = Referansesystemet motoren skriver ut er eksplisitt, ikke implisitt. Den CIO-baserte (CIO: Celestial Intermediate Origin) IAU-reduksjonen (International Astronomical Union) 2006/2000A (<a1><c1/></a1>) og ekvinoks/GMST-reduksjonen (GMST: Greenwich mean sidereal time) TEME (true equator, mean equinox) (<a2><c2/></a2>, <a3><c3/></a3>) er validert bit for bit mot referansevektorene fra SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) (se <a4><c4/></a4>).

seg-819d28bd9361 = Realisering

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = SGP4 nativt

seg-7631c594fd1a = Sann ekvator, middels ekvinoks — utdatasystemet til SGP4/SDP4.

seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

seg-745285e29202 = IAU { "2006" }-presesjon + IAU 2000A/2000B-nutasjon

seg-3747add299d5 = <c1/> (ekvinokskjede).

seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

seg-a28e26cd2481 = ERA (jordrotasjonsvinkel) + IERS-polbevegelse (CIO) eller GMST + polbevegelse (ekvinoks)

seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (ekvinoks).

seg-74a4801fd685 = WGS-84 (WGS: World Geodetic System) geodetisk

seg-b58a44eaaa39 = eksakt + iterativ invers

seg-4d9472dd73d3 = Tidsskala

seg-cbe7a7ce7317 = <b>TT</b> (terrestrisk tid)

seg-25191c1a4135 = Evaluering av presesjons-/nutasjons-/CIO-argument (<c1/>).

seg-8c478d6b4786 = Jordrotasjonsvinkel / GMST (<c1/>).

seg-f7033ca0c13f = <b>To-delt JD</b> (juliansk dato)

seg-64a5adeacd5b = <c1/> for epokeoppløsning under µs.

seg-210f40885a8e = Kobling mellom utdatafelt og standard (CCSDS { "502.0" })

seg-e9dbc25a3ee9 = Hva de to banemeldingsskriverne legger i hvert CCSDS ODM-felt (Orbit Data Messages, { "502.0" }), lest fra en kjøring av <c1/> med <c2/> og <c3/>:

seg-d2b91c300b82 = Kshana-utdata

seg-119884b009cc = CCSDS ODM-felt

seg-8b0593f67c7f = Verdi / enhet

seg-d33eb162d179 = Metadata for OEM-segment

seg-4b338284e56a = <c1/> / <c2/> / <c3/> — referansesystemet propagatorene integrerer i og tidsskalaen til epokenettet, ikke omdøpt

seg-e0a44af9aaf8 = OEM-tilstandsepoke

seg-b0623bab9fcc = første kolonne i hver datalinje

seg-410bd5a9ba14 = ISO-8601 (ISO: International Organization for Standardization) kalendertid, GPS-tidsskala

seg-a7c95802e01a = OEM-posisjon, -hastighet

seg-0539cafabf60 = <c1/>-datakolonner

seg-8add7e800e0e = km, km/s

seg-8b386548c03c = OMM-metadata

seg-e2c63414d7c2 = OMM-epoke

seg-5109e5948d2a = ISO-8601 dag-i-året-form (TLE-epoken)

seg-b74289a29c24 = OMM-middelelementer

seg-f3492fa95178 = omløp/døgn, –, grader, 1/jordradier

seg-fc82185abe10 = Resultat-JSON-en (JavaScript Object Notation) fra typen <c1/> bærer den samme tilstanden i SI-enheter (International System of Units) per sampel: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), pluss <c8/>, <c9/>, <c10/>.

seg-014d1392018e = Ærlig omfang

seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF og teksten for LEO-navigasjonsmeldingen både <b>leses og skrives</b>; OMM, CZML, KML og STK-efemeride er <b>skrivere</b> (en OMM-leser og XML-serialiseringen er oppfølgere); GeoJSON skrives og leses tilbake som en rute; RINEX NAV, RINEX OBS, IONEX, IERS EOP-produktene og TLE er <b>lesere</b>; månedataeksporten for LunaNet/IOAG er en skriver der tidsmetadataene gjør rundtur. <a1><c1/></a1> lister hvilken eksport som gjelder for hvert medfølgende scenario.

seg-68b4f5116419 = Feltkoblingen for CCSDS/IGS ovenfor er dokumentasjon, ikke en påstand om at noen standard er oppfylt; formell vurdering mot disse standardene (og registrering i de åpne katalogene til ESA (European Space Agency) ESSR (European Space Software Repository) / NASA (National Aeronautics and Space Administration)) følges opp separat og venter på gjennomgang.

seg-e461587ad2cf = Den uavhengige numeriske kontrollen av referansesystemreduksjonen mot SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — et rent Rust-verktøysett for planetgeometri) leveres i den frittstående crate-en <c1/>, som er utelatt fra workspace: <c2/> mot ANISEs GCRF-rotasjon (Geocentric Celestial Reference Frame) → ITRF93 (International Terrestrial Reference Frame { "1993" }) over åtte epoker { "2020" }–{ "2023" } stemmer til ≤ { "0.86" } m på bakken og ≤ { "3.6" } m i GNSS-bane (se <a1><c3/></a1>). Den trenger SPICE-kjerner, så den er ikke en standard port i kontinuerlig integrasjon (CI).

seg-f6d67027d669 = <s1>Forrige</s1>Funksjonskart

seg-01b6270b6c6a = <s1>Neste</s1>Linjedekning
