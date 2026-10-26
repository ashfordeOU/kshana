# docs--kind-pvt: translations (nb)

seg-debc2f07db78 = true

seg-8e845ce908ee = Scenariotype i motoren v{ $version }, familie <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>

seg-f4cf8b629797 = Temaside: <a1>INTEGRITY.md</a1>

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry og check: en Monte Carlo med seed (N = { "20,000" } epoker per geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) av motorens egen iterative minste kvadraters posisjonsbestemmelse (pvt::solve_spp, enhetsvekter, løst fra den sanne posisjonen) på Tester: <a1>uere_dop_monte_carlo.rs</a1>.

seg-aab2f85048b7 = Kilde: <c1/>

seg-56f864d32367 = <c1/> (scenariotype)

seg-b7b67e03f125 = Enkeltpunktsposisjonering fra virkelige observasjoner: løs en mottakers posisjon fra en RINEX { "3" }-observasjonsfil og en fil med kringkastet navigasjon (kodepseudoavstander, kringkastet efemeride, Klobuchar-ionosfære, Saastamoinen/Niell-troposfære), eventuelt validert mot en oppmålt koordinat.

seg-79d2a463393d = En kjøring av <c1/> oppsummeres slik: pvt 55bdd18628e1 | { "11" } sat nav | 2/3 epochs solved | mean { "9.0" } sats, PDOP { "1.8" } | 3D error RMS { "5.74" } m (max { "7.12" } m)

seg-fd22bc5c2b67 = Obligatoriske felt: <c1/>, <c2/>

seg-4b39ee73d65d = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>

seg-4f02bdcbc7c7 = Eksempelet <c1/> angir blant annet:

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = Diagrammet motoren skriver for scenarios/pvt-abmf.toml, type pvt

seg-e6f678eeb384 = <b>MODELLED</b> Hatch-filter uten divergens (ionosfærefri kode båret av ionosfærefri bærebølge, vindu N epoker, omstart ved tap av lås, geometrifritt hopp eller gap) i sammenstillingen for presis enkeltpunktsposisjonering

seg-5a42823318a8 = <b>VALIDATED</b> Satellittposisjon i ECEF fra Kepler-elementer i kringkastet efemeride etter IS-GPS-200 / Galileo-OS / BeiDou-OS, fra en tolket RINEX-3-navigasjonspost. Uavhengig referanse (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos() kompilert fra C-kilden (T. Takasu, BSD-2-Clause), en uavhengig implementasjon av IS-GPS-200/SIS-ICD, matet med de identiske RINEX-3-navigasjonspostene; satellittens ECEF-posisjon stemte til ~{ "62" } nm. (Interpolasjon av presis SP3-efemeride er validert separat, se «SP3 precise-ephemeris interpolation»)

seg-51cac2f918e0 = Temaside: <a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>Forrige</s1>passes

seg-d1dc82bbfb73 = <s1>Neste</s1>quantum-anomaly-detect
