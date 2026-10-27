# docs--kind-pvt: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-8e845ce908ee = Mootori v{ $version } stsenaariumi liik, perekond <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-f6b7ca020692 = Perekonna leht: <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>

# text
seg-f4cf8b629797 = Teemaleht: <a1>INTEGRITY.md</a1>

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry ja check: mootori enda iteratiivse vähimruutude määrangu (pvt::solve_spp, ühikkaalud, lahendatud tegelikust asukohast) algväärtustatud Monte Carlo (N = { "20,000" } epohhi geomeetria kohta, sigma = { "1.5" } m, ChaCha8 algväärtus { "36" } + i) Testid: <a1>uere_dop_monte_carlo.rs</a1>.

# text
# c1: docs/kinds/by-kind/pvt.md
seg-aab2f85048b7 = Allikas: <c1/>

# text
# c1: pvt
seg-56f864d32367 = <c1/> (stsenaariumi liik)

# text
seg-b7b67e03f125 = Reaalsete vaatluste ühepunktpositsioneerimine: vastuvõtja asukoha lahendamine RINEX { "3" } vaatlusfailist ja ringhäälestatud navigatsioonifailist (koodipseudovahemaad, ringhäälestatud efemeriid, Klobuchari ionosfäär, Saastamoineni/Niell'i troposfäär), soovi korral valideeritud mõõdistatud koordinaadi vastu.

# text
# c1: scenarios/pvt-abmf.toml
seg-79d2a463393d = Ühe <c1/> käivituse kokkuvõte: pvt 55bdd18628e1 | { "11" } satelliiti nav | lahendatud 2/3 epohhi | keskmiselt { "9.0" } satelliiti, PDOP { "1.8" } | 3D viga RMS { "5.74" } m (maks { "7.12" } m)

# text
# c1: obs_rinex
# c2: nav_rinex
seg-fd22bc5c2b67 = Kohustuslikud väljad: <c1/>, <c2/>

# text
# c1: truth_ecef
# c2: apriori_ecef
# c3: mask_deg
# c4: dual_frequency
seg-4b39ee73d65d = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/pvt-abmf.toml
seg-4f02bdcbc7c7 = Näide <c1/> määrab muu hulgas:

# text
seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

# text
seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

# text
seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

# attr:alt
seg-d76d59644d84 = Diagramm, mille mootor kirjutab failile scenarios/pvt-abmf.toml, liik pvt

# text
seg-e6f678eeb384 = <b>MODELLED</b> Lahknemisvaba Hatchi filter (ionosfäärivaba kood, mida kannab ionosfäärivaba kandelaine, aken N epohhi, taaskäivitus lukustuse kadumisel, geomeetriavaba hüppe või lünga korral) täpse ühepunktpositsioneerimise koostus

# text
seg-5a42823318a8 = <b>VALIDATED</b> IS-GPS-200 / Galileo-OS / BeiDou-OS ringhäälestatud efemeriidi Kepleri → ECEF satelliidi asukoht parsitud RINEX-3 navigatsioonikirjest. Oraakel (sõltumatu etalon; ExternalDataset): RTKLIB v2.4.2-p13 eph2pos(), kompileeritud C lähtekoodist (T. Takasu, BSD-2-Clause) — sõltumatu IS-GPS-200/SIS-ICD teostus, mida söödeti identsete RINEX-3 nav kirjetega; satelliidi ECEF asukoht langes kokku täpsusega ~{ "62" } nm. (SP3 täpse efemeriidi interpolatsiooni valideeritakse eraldi — vt „SP3 täpse efemeriidi interpolatsioon“)

# text
seg-51cac2f918e0 = Teemaleht: <a1>POSITIONING.md</a1>

# text
seg-8ea056f1d7e0 = <s1>Eelmine</s1>passes

# text
seg-d1dc82bbfb73 = <s1>Järgmine</s1>quantum-anomaly-detect
