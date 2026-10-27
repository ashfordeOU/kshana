# docs--kind-pvt: translations (nl)

seg-debc2f07db78 = true

seg-8e845ce908ee = Scenariokind van de engine v{ $version }, familie <a1>GNSS-metingen, positiebepaling en integriteit</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-f6b7ca020692 = Familiepagina: <a1>GNSS-metingen, positiebepaling en integriteit</a1>

seg-f4cf8b629797 = Onderwerppagina: <a1>INTEGRITY.md</a1>

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry en check: een Monte Carlo met seed (N = { "20,000" } epochs per geometrie, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) van de eigen iteratieve kleinstekwadratenpositiebepaling van de engine (pvt::solve_spp, eenheidsgewichten, opgelost vanuit de ware positie) op Tests: <a1>uere_dop_monte_carlo.rs</a1>.

seg-aab2f85048b7 = Bron: <c1/>

seg-56f864d32367 = <c1/> (scenariosoort)

seg-b7b67e03f125 = Enkelpunts-positiebepaling met echte waarnemingen: bepaal de positie van een ontvanger uit een RINEX { "3" }-waarnemingsbestand en een broadcast-navigatiebestand (codepseudoafstanden, broadcast-efemeride, Klobuchar-ionosfeer, Saastamoinen/Niell-troposfeer), eventueel getoetst aan een opgemeten coördinaat.

seg-79d2a463393d = Eén run van <c1/> vat samen als: pvt 55bdd18628e1 | { "11" } sat nav | 2/3 epochs opgelost | gemiddeld { "9.0" } sats, PDOP { "1.8" } | 3D-fout RMS { "5.74" } m (max { "7.12" } m)

seg-fd22bc5c2b67 = Verplichte velden: <c1/>, <c2/>

seg-4b39ee73d65d = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>

seg-4f02bdcbc7c7 = Het voorbeeld <c1/> stelt onder meer in:

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = De grafiek die de engine schrijft voor scenarios/pvt-abmf.toml, soort pvt

seg-e6f678eeb384 = <b>MODELLED</b> Divergentievrij Hatch-filter (ionosfeervrije code gedragen door de ionosfeervrije draaggolf, venster van N epochs, herstart bij verlies van lock, geometrievrije sprong of onderbreking) in de precieze enkelpunts-positiebepaling

seg-5a42823318a8 = <b>VALIDATED</b> IS-GPS-200 / Galileo-OS / BeiDou-OS broadcast-efemeride Kepler → ECEF-satellietpositie uit een geparsed RINEX-3-navigatierecord. Onafhankelijke referentie (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos(), gecompileerd uit C-broncode (T. Takasu, BSD-2-Clause) — een onafhankelijke IS-GPS-200/SIS-ICD-implementatie, gevoed met dezelfde RINEX-3-navigatierecords; de ECEF-satellietpositie kwam overeen tot ~{ "62" } nm. (Interpolatie van de precieze SP3-efemeride wordt apart getoetst — zie 'SP3 precise-ephemeris interpolation')

seg-51cac2f918e0 = Themapagina: <a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>Vorige</s1>passes

seg-d1dc82bbfb73 = <s1>Volgende</s1>quantum-anomaly-detect
