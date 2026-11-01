# docs--kind-lunar-joint-od-clock: translations (et)

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
# c1: docs/kinds/by-kind/lunar-joint-od-clock.md
seg-593938ee5995 = Allikas: <c1/>

# text
# c1: lunar-joint-od-clock
seg-d54a85227f43 = <c1/> (stsenaariumi liik)

# text
seg-200e58e189c2 = Modelleeritud ühine mitmetehnikaline Kuu OD + kella kobarhindaja SIMULEERITUD võrgul: Gaussi-Newtoni hetktõmmise sobitus, mis ühendab Maa baseline-i geodeetilised VLBI viivitused, Kuu-kohalikud jaama↔satelliidi ulatused ja satelliitidevahelised ulatused, et taastada koos Kuu pinnajaama 3-D asukoht, väikese konstellatsiooni asukohad ja iga vahendi kellanihe süstitud tõest. Peamine aus tulemus — VLBI teeb jaama täieliku 3-D asukoha vaadeldavaks seal, kus ainult Kuu-kohalik ulatuse mõõtmine jätab nõrgalt vaadeldava suuna — esitatakse jaamavea kontrastina VLBI-ga vs ilma. MODELLED simuleeritud suletud ahelaga taastamine (tõde jagab vaatlusmudelit), deterministlik (algväärtusega (seed)), MITTE päris andmetega valideeritud; lahendajas ei ole jõumudeli levitamist; ei ole TRL/pärandi/agentuuri heakskiitu.

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-6419390eeae4 = Ühe <c1/> käivituse kokkuvõte: lunar-joint-od-clock | { "3" } sat, { "6" } Maa jaama | jaama 3-D viga VLBI-ga { "3.54" } m vs ainult ulatus { "2184.02" } m ({ "617.5" }× teravam) | sat asukoha RMS { "2.20" } m | jaama kella viga { "2.87e-10" } s | vaatlusi 40/16 parameetrit

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-be3bcad756cc = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-ef164af52468 = Näide <c1/> määrab muu hulgas:

# text
seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

# attr:alt
seg-cfa051b87e59 = Mootori joonistatud diagramm failile scenarios/lunar-joint-od-clock.toml, liik lunar-joint-od-clock

# text
seg-4c6914c162d1 = <b>VALIDATED</b> VLBI + Kuu-kohalik ulatus + satelliitidevaheline ulatus kobarühendus jaama+konstellatsiooni asukohtade ja kellade taastamiseks. Sõltumatu etalon (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq koos LAPACK gelsd, numpy.linalg.inv; BSD-3) arvutab uuesti iga Gaussi-Newtoni sammu, koondunud kaalutud vähimruutude lahenduse, formaalsed sigmad ja jaamavea kuue simuleeritud võrgu kinnitatud Jacobi maatriksitel ja vaatlustel, eelregistreeritud (5094bc31) täpsusega max({ "1e-8" }, { "100" } kappa eps) suhteliselt. Esimene käivitus ebaõnnestus võrgul ilma VLBI-ta ({ "6.1e-7" } vs { "1e-8" }, normaalvõrrandi in

# text
seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisheri informatsioon M=HᵀWH, Cramér–Rao alumine piir, vaadeldavuse auaste / datumi defekti nullruum (Moore–Penrose pseudopöördmaatriks) ja D/A/E/T-optimaalne eksperimendi-d. Sõltumatu etalon (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-põhine) — sõltumatu kolmanda osapoole autoriteet, mis arvutab samad üheselt määratletud omaväärtused, σ²(XᵀX)⁻¹ Cramér–Rao kovariatsiooni ja GNSS-i täpsuse halvenemise tegurid teistsuguse algoritmiga (LAPACK jaga-ja-valitse + LU) kui Kshana tsükliline Jacobi pühkimine ja spektraalne pseudopöördmaatriks; ühtivad täpsusega { "1e-9" }. Sama välise teegi klass juba valideerib D

# text
seg-af12da412a10 = <b>MODELLED</b> Ühise Kuu lahenduse Fisheri informatsiooni vaadeldavus: ilma Maa baseline-ideta asub absoluutse tugisüsteemi datum HᵀWH nullruumis (jaama asukoht uno. Sõltumatu etalon (InternalConsistency): Analüütiline datumi defekti struktuur — mittevaadeldav absoluutse tugisüsteemi mood asub Fisheri informatsiooni nullruumis (suletud kujul), auastme lävi ühtib avaldatud 3-jaama kavandi põhjendusega ja hindaja saavutab saadud CRLB Monte Carlos. Kuu geomeetria ise on esinduslik võrk (mitte lennanud efemeriid), seega jääb rida MODELLED; aluseks olevat FIM/CRLB mootorit kontrollitakse vastu

# text
# c1: kshana kinds --json
seg-865ba2668582 = MODELLED simuleeritud suletud ahelaga taastamine (tõde jagab vaatlusmudelit), deterministlik (algväärtusega (seed)), MITTE päris andmetega valideeritud; lahendajas ei ole jõumudeli levitamist; ei ole TRL/pärandi/agentuuri heakskiitu. (liikide kataloog (<c1/>))

# text
seg-a0d4350a1c66 = Ausus: MODELLED simuleeritud suletud ahelaga taastamine. Süstitud tõde kujutatakse sünteetilisteks vaadeldavateks SAMA geomeetriamudeli kaudu, mida lahendaja pöörab, lisatakse algväärtusega (seed) Gaussi müra ja hindaja taastab süstitud tõe müra piires. Sõltumatu etalon on sisemine kooskõla (tõe taastamine + NEES kovariatsiooni realism), MITTE päris andmetega valideerimine. Lahendajas ei ole jõumudeli levitamist — satelliit (stsenaariumifaili kommentaar, read { "24" } kuni { "29" })

# text
seg-1465694e7e4f = Kuu absoluutse jaama vaadeldavus (datumi defekt) on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-e6962535ee72 = <s1>Eelmine</s1>lunar-jamming

# text
seg-2ef5c8112d1b = <s1>Järgmine</s1>lunar-llr-datum
