# docs--kind-pvt: translations (da)

seg-debc2f07db78 = true

seg-8e845ce908ee = Scenarietype i motoren v{ $version }, familie <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>

seg-f4cf8b629797 = Emneside: <a1>INTEGRITY.md</a1>

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry og check: en seedet Monte Carlo (N = { "20,000" } epoker pr. geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) af motorens egen iterede mindste kvadraters positionsbestemmelse (pvt::solve_spp, enhedsvægte, løst ud fra den sande position) på Tests: <a1>uere_dop_monte_carlo.rs</a1>.

seg-aab2f85048b7 = Kilde: <c1/>

seg-56f864d32367 = <c1/> (scenarietype)

seg-b7b67e03f125 = Positionsbestemmelse med ét punkt ud fra reelle observationer: bestem en modtagers position ud fra en RINEX { "3" }-observationsfil og en fil med broadcast-navigation (kodepseudoafstande, broadcast-efemeride, Klobuchar-ionosfære, Saastamoinen/Niell-troposfære), eventuelt valideret mod en opmålt koordinat.

seg-79d2a463393d = Én kørsel af <c1/> opsummeres som: pvt 55bdd18628e1 | { "11" } sat. nav | 2/3 epoker løst | gennemsnit { "9.0" } sat., PDOP { "1.8" } | 3D-fejl RMS { "5.74" } m (maks. { "7.12" } m)

seg-fd22bc5c2b67 = Påkrævede felter: <c1/>, <c2/>

seg-4b39ee73d65d = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-4f02bdcbc7c7 = Eksemplet <c1/> angiver blandt andet:

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = Diagrammet, som motoren skriver for scenarios/pvt-abmf.toml, type pvt

seg-e6f678eeb384 = <b>MODELLED</b> Divergensfrit Hatch-filter (ionosfærefri kode båret af den ionosfærefri bærebølge, vindue på N epoker, genstart ved tab af lås, geometrifrit spring eller hul) i den præcise samling til positionsbestemmelse med ét punkt

seg-5a42823318a8 = <b>VALIDATED</b> Satellitposition i ECEF ud fra Kepler-elementer i broadcast-efemeriden for IS-GPS-200 / Galileo-OS / BeiDou-OS fra en indlæst RINEX-3-navigationspost. Uafhængig reference (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos() kompileret fra C-kildekode (T. Takasu, BSD-2-Clause) — en uafhængig implementering af IS-GPS-200/SIS-ICD, fodret med de samme RINEX-3-navigationsposter; satellitpositionen i ECEF stemte til ~{ "62" } nm. (Interpolation af den præcise SP3-efemeride valideres separat — se 'SP3 precise-ephemeris interpolation')

seg-51cac2f918e0 = Emneside: <a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>Forrige</s1>passes

seg-d1dc82bbfb73 = <s1>Næste</s1>quantum-anomaly-detect
