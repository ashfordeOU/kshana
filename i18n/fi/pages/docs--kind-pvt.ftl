# docs--kind-pvt: translations (fi)

seg-debc2f07db78 = true

seg-8e845ce908ee = Moottorin v{ $version } skenaariolaji, perhe <a1>GNSS-mittaukset, paikannus ja eheys</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-f6b7ca020692 = Perhesivu: <a1>GNSS-mittaukset, paikannus ja eheys</a1>

seg-f4cf8b629797 = Aihesivu: <a1>INTEGRITY.md</a1>

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry ja check: siemenlukuun perustuva Monte Carlo (N = { "20,000" } epookkia geometriaa kohti, sigma = { "1.5" } m, ChaCha8-siemenluku { "36" } + i) moottorin omasta iteroidusta pienimmän neliösumman paikannuksesta (pvt::solve_spp, yksikköpainot, ratkaistu todellisesta paikasta) Testit: <a1>uere_dop_monte_carlo.rs</a1>.

seg-aab2f85048b7 = Lähde: <c1/>

seg-56f864d32367 = <c1/> (skenaariotyyppi)

seg-b7b67e03f125 = Todellisen havainnon yksipistepaikannus: ratkaise vastaanottimen paikka RINEX { "3" } -havaintotiedostosta ja yleislähetetystä navigointitiedostosta (koodipseudoetäisyydet, yleislähetetty efemeridi, Klobuchar-ionosfääri, Saastamoinen/Niell-troposfääri), valinnaisesti validoituna mitattua koordinaattia vasten.

seg-79d2a463393d = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: pvt 55bdd18628e1 | { "11" } sat nav | 2/3 epookkia ratkaistu | keskimäärin { "9.0" } satelliittia, PDOP { "1.8" } | 3D-virheen RMS { "5.74" } m (max { "7.12" } m)

seg-fd22bc5c2b67 = Pakolliset kentät: <c1/>, <c2/>

seg-4b39ee73d65d = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>

seg-4f02bdcbc7c7 = Esimerkki <c1/> asettaa muun muassa:

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = Moottorin kirjoittama kaavio skenaariolle scenarios/pvt-abmf.toml, tyyppi pvt

seg-e6f678eeb384 = <b>MODELLED</b> Divergenssivapaa Hatch-suodatin (ionosfäärivapaa koodi, jota kantaa ionosfäärivapaa kantoaalto, ikkuna N epookkia, uudelleenkäynnistys lukituksen menetyksessä, geometriavapaassa hypyssä tai aukossa) tarkassa yksipistepaikannuskokoonpanossa

seg-5a42823318a8 = <b>VALIDATED</b> IS-GPS-200 / Galileo-OS / BeiDou-OS yleislähetetyn efemeridin Kepler → ECEF-satelliittipaikka jäsennetystä RINEX-3-navigointitietueesta. Oraakkeli (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos() käännettynä C-lähdekoodista (T. Takasu, BSD-2-Clause) — riippumaton IS-GPS-200/SIS-ICD-toteutus, jolle syötettiin identtiset RINEX-3-navigointitietueet; satelliitin ECEF-paikka täsmäsi ~{ "62" } nm:iin. (SP3-tarkan efemeridin interpolointi validoidaan erikseen — katso 'SP3 precise-ephemeris interpolation')

seg-51cac2f918e0 = Aihesivu: <a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>Edellinen</s1>passes

seg-d1dc82bbfb73 = <s1>Seuraava</s1>quantum-anomaly-detect
