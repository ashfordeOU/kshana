# docs--kind-pvt: translations (sv)

seg-debc2f07db78 = true

seg-8e845ce908ee = Scenariotyp i motor v{ $version }, familj <a1>GNSS-mätningar, positionering och integritet</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-f6b7ca020692 = Familjesida: <a1>GNSS-mätningar, positionering och integritet</a1>

seg-f4cf8b629797 = Ämnessida: <a1>INTEGRITY.md</a1>

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry och check: en Monte Carlo med slumpfrö (N = { "20,000" } epoker per geometri, sigma = { "1.5" } m, ChaCha8-frö { "36" } + i) av motorns egen iterativa minsta kvadrat-positionsbestämning (pvt::solve_spp, enhetsvikter, löst från den sanna positionen) på Tester: <a1>uere_dop_monte_carlo.rs</a1>.

seg-aab2f85048b7 = Källa: <c1/>

seg-56f864d32367 = <c1/> (scenariotyp)

seg-b7b67e03f125 = Enkel punktpositionering med verkliga observationer: lös en mottagares position från en RINEX { "3" }-observationsfil och en sändningsnavigeringsfil (kodpseudoavstånd, sänd efemerid, Klobuchar-jonosfär, Saastamoinen/Niell-troposfär), valfritt validerad mot en inmätt koordinat.

seg-79d2a463393d = En körning av <c1/> sammanfattas som: pvt 55bdd18628e1 | { "11" } sat nav | 2/3 epochs solved | mean { "9.0" } sats, PDOP { "1.8" } | 3D error RMS { "5.74" } m (max { "7.12" } m)

seg-fd22bc5c2b67 = Obligatoriska fält: <c1/>, <c2/>

seg-4b39ee73d65d = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-4f02bdcbc7c7 = Exemplet <c1/> anger bland annat:

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = Diagrammet som motorn skriver för scenarios/pvt-abmf.toml, typ pvt

seg-e6f678eeb384 = <b>MODELLED</b> Divergensfritt Hatch-filter (jonosfärsfri kod buren av den jonosfärsfria bärvågen, fönster N epoker, omstart vid förlorad låsning, geometrifritt hopp eller lucka) i sammansättningen för precis enkel punktpositionering

seg-5a42823318a8 = <b>VALIDATED</b> IS-GPS-200 / Galileo-OS / BeiDou-OS Kepler-satellitposition från sänd efemerid → ECEF från en tolkad RINEX-3-navigeringspost. Oberoende referens (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos() kompilerad från C-källkod (T. Takasu, BSD-2-Clause) — en oberoende implementation av IS-GPS-200/SIS-ICD, matad med identiska RINEX-3-navposter; satellitens ECEF-position stämde till ~{ "62" } nm. (Interpolation av SP3-precisionsefemerid är validerad separat — se 'SP3 precise-ephemeris interpolation')

seg-51cac2f918e0 = Ämnessida: <a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>Föregående</s1>passes

seg-d1dc82bbfb73 = <s1>Nästa</s1>quantum-anomaly-detect
