# docs--kind-lunar-station-coverage: translations (et)

# text
seg-9feefecdcf67 = rafs

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (liikide kataloog (<c1/>))

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-6f4246bd8f6f = <b>MODELLED</b> NovaMoon-klassi diferentsiaaletaloonijaam: ühisrežiimi tühistamine + baseline-iga kasvav jääk + DGNSS kaitsetasemed. Oraakel (sõltumatu etalon) (InternalConsistency): Diferentsiaalvea tühistamise samasus + DO-229E SBAS PL masinavärgi taaskasutus; üksikdiferents + WLS lahendus on lisaks ristkontrollitud RTKLIB lsq()/matinv() vastu (Takasu, BSD-2-Clause, kompileeritud C) — sõltumatu lahendajakood, kuid sama esimest järku LOS-erinevuse algebra, seega siiski InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Kolm liiget, mille diferentsiaalparandus omandab epohhi vahel, mil see arvutatakse, ja epohhi, mil seda kasutatakse, igaüks varem jäetud modelleerimata varuks:. Oraakel (sõltumatu etalon) (InternalConsistency): Suletud kujuga samasused ja sisemine kooskõla: ühtlase kvantori step²/12 dispersioon, täpne (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ kovariatsiooni levitamine, mis võrdse σ korral taandub kujule σ·PDOP, mõõdistusliikme { "1" }:{ "1" } ülekanne kui û_user ≈ û_ref tagajärg ja väljalülituse kvadratuuri sulgumine. PDOP ristkontroll orbit::dop vastu jagab normaalmaatriksit [−û, { "1" }], seega on see kooskõlakontroll ja on nii märgitud, mitte kui sõltumatu

# text
seg-7171b2e3f29d = Kuu diferentsiaal-PNT on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = Kuu diferentsiaal-PNT — paranduslingi jäägi eelarve on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Teemaleht: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-station-coverage.md
seg-f3231c08fa26 = Allikas: <c1/>

# text
# c1: lunar-station-coverage
seg-1a28838279fe = <c1/> (stsenaariumi liik)

# text
seg-f7ea776e70c9 = Modelleeritud Kuu etaloonijaama katvus: Kuu diferentsiaal-PNT mudeli Monte Carlo pühkimine üle lõunapooluse kasutajaruudustiku ja ühe päeva epohhide. Diferentsiaaletaloonijaam teadaoleval lõunapooluse asukohal parandab kindlaksmääratud konstellatsiooni (illustratiivne Kepleri või tabuleeritud efemeriid) kindlaksmääratud signaal-ruumis vea, mõõdistusvea, parandusviivituse ja lingi kvantimisega; punkti kaupa ja üle piirkonna esitab see parandatud ja parandamata asukohavea protsentiili (3-D, horisontaalne, vertikaalne), kättesaadavuse, katvuse kindlaksmääratud läve suhtes, DO-229E kaitsetasemed, katvusraadiuse asimuudi kohta ja paranduslingi eelarve jaamas ja halvimas punktis. Mitte väide ühegi päris süsteemi toimivuse kohta; ei ole seotud ühegi agentuuriga ega ühegi agentuuri heaks kiidetud. MODELLED.

# text
# c1: scenarios/lunar-station-coverage.toml
seg-d18c93c2e136 = Ühe <c1/> käivituse kokkuvõte: lunar-station-coverage | { "346" } punkti x { "144" } epohhi x { "200" } katset | kättesaadavus { "92.2" } % | katvus { "76.5" } % (p95 <= { "20" } m) | parandatud p95 3-D { "15.592" } m (parandamata { "1056.892" } m) | HPL maks { "480.385" } m | MODELLED; mitte väide ühegi päris süsteemi kohta

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-cb73ac0d57de = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

# text
# c1: scenarios/lunar-station-coverage.toml
seg-0c3460704315 = Näide <c1/> määrab muu hulgas:

# text
seg-2d84b341a41f = Tulemuse silt (mootori oma): MODELLED

# attr:alt
seg-922b8656fcae = Mootori joonistatud diagramm failile scenarios/lunar-station-coverage.toml, liik lunar-station-coverage

# text
# c1: lunar-station-coverage
seg-4f5941f12127 = <b>MODELLED</b> Kuu diferentsiaal-PNT mudeli Monte Carlo pühkimine üle lõunapooluse kasutajaruudustiku ja ühe päeva epohhide (liik <c1/>): diferentsiaaletaloonijaama jaoks teadaoleval lõunapooluse asukohal, punkti kaupa ja üle piirkonna, Testid: <a1>lunar_station_coverage_reference.rs</a1>.

# text
# c1: lunar-station-coverage
seg-d547d600ee2d = <b>MODELLED</b> Kuu diferentsiaal-PNT mudeli Monte Carlo pühkimine üle lõunapooluse kasutajaruudustiku ja ühe päeva epohhide (liik <c1/>): diferentsiaal. Oraakel (sõltumatu etalon) (InternalConsistency): Aritmeetika, mille arvutas uuesti sõltumatu numpy skript eksporditud juhtumitel (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; eelregistreeritud failis tests/fixtures/lunar_station/PREREGISTRATION.md, kinnitatud üksi commit-is 9caedf97 enne esimest käivitust): { "20" } juhtumil, kus iga vealiige on sees, on nähtavad hulgad ja olek identsed, toored ulatusvead ühtivad täpsusega { "1.4e-14" } m, asukohavea vektorid ja suurused täpsusega { "1.4e-9" } m vastu

# text
# c1: label
seg-626ab55f0424 = MODELLED (tulemus <c1/>)

# text
seg-6f09def22469 = AUSTUS: MODELLED. Allpool kindlaksmääratud eelduste korral annab mudel need arvud. Mitte väide ühegi päris süsteemi toimivuse kohta; ei ole seotud ühegi agentuuriga ega ühegi agentuuri heaks kiidetud; ei ole TRL-i ega pärandi väidet. Välja jäetud: maastiku ja horisondi varjestus poolusel (esimene piirang), mitmeteelevi, vastuvõtja riistvara. (stsenaariumifaili kommentaar, read { "15" } kuni { "18" })

# text
seg-db27cc015952 = Kuu etaloonijaama katvuse ja täpsuse kaart on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-6ac5bd1500a8 = <s1>Eelmine</s1>lunar-llr-datum

# text
seg-625c1973128e = <s1>Järgmine</s1>lunar-time-budget
