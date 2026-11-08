# docs--kind-realtime-frame-eop: translations (et)

# text
seg-8e845ce908ee = Mootori v{ $version } stsenaariumi liik, perekond <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-f6b7ca020692 = Perekonna leht: <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-a2889fb2b42a = Teemaleht: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/realtime-frame-eop.md
seg-1ad013ffb9d1 = Allikas: <c1/>

# text
# c1: realtime-frame-eop
seg-54620502f0dd = <c1/> (stsenaariumi liik)

# text
seg-edfcb546d9de = Reaalajas Kuu tugisüsteemi / Maa orientatsiooni ennustuse eelarve: P4 tabel { "1" } (tugisüsteemi vea kooskõlakontroll — järeltöödeldud ~{ "0.27" } m ↔ ~{ "0.010" } ms ja reaalajas ~{ "15" } m ↔ ~{ "0.5" } ms, iga tugisüsteemi asukoht väljendatud samaväärse UT1 veana L19 õlapikkuse Δr = D_EM·ω⊕·ΔUT1 kaudu) ja tabel { "2" } (mõõdetud UT1 ennustusviga vs horisont — L18 kõver loetud otse tegelikust IERS-i finals2000A reast: Bulletin A − Bulletin B lõplik põhjatase ja mitmepäevase püsivusennustaja viga, kumbki teisendatud Kuu tugisüsteemi asukohaks L19 abil), pluss L21 ruutude summa juurena reaalajas tugisüsteemi vea eelarve (EOP + efemeriid + realisatsiooni põhjatase). VALIDATED kinnine kuju (L19 õlapikkus, ω⊕ ristkontrollitud CIO Maa pöörlemisnurga vastu) ja VALIDATED reaalsed andmed (L18 kõver otse tegelikelt finals2000A ridadelt); MODELLED on tsislunaarse releesatelliidi OD kovariatsioonide suurused ja tugisüsteemi realisatsiooni põhjatase (esindusliku jaotusega eraldised) ning püsivusennustaja (mitte IERS-i operatiivne Bulletin A algoritm). Mitte sertifitseeritud reaalajas tugisüsteemi toode.

# text
# c1: scenarios/realtime-frame-eop.toml
seg-488039e4240f = Ühe <c1/> käivituse kokkuvõte: realtime-frame-eop | tabel { "1" }: järeltöötlus { "0.27" } m ({ "0.0096" } ms UT1) ↔ reaalajas { "14.4" } m ({ "0.514" } ms UT1) | tabel { "2" }: lõplik põhjatase { "0.0171" } ms → 3 päeva { "1.6644" } ms | eelarve kokku { "20.1" } m ({ "67.0" } ns) | L19 õlapikkus + L18 reaalsed andmed (valideeritud), OD kov (modelleeritud)

# text
# c1: epoch
# c2: horizons_days
# c3: ephemeris_pos_sigma_m
# c4: ephemeris_vel_sigma_mps
# c5: latency_s
# c6: frame_realization_floor_m
# c7: delta_ut1_ms
# c8: delta_xp_mas
# c9: delta_yp_mas
# c10: eop_finals2000a
# c11: eop_finals2000a_later
# c12: frame_realization_tie_noise_m
# c13: operational_window_days
# c14: operational_min_cycle_fraction
# c15: operational_anchor_residual
seg-66264ec78a4c = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/realtime-frame-eop.toml
seg-45a4ed476311 = Näide <c1/> määrab muu hulgas:

# text
seg-c39a26aa1f1e = kaasasolev testandmestik finals2000A_20260930

# text
seg-9ef8a2b4c144 = Tulemuse silt (mootori oma): Reaalajas Kuu tugisüsteemi / Maa orientatsiooni ennustuse eelarve. VALIDATED kinnine kuju: L19 õlapikkus ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ ristkontrollitud CIO Maa pöörlemisnurga vastu. VALIDATED reaalsed andmed: L18 UT1 ja poolusliikumise ennustusvea kõverad loetud otse tegelikust IERS-i finals200

# attr:alt
seg-2721ed7727bb = Diagramm, mille mootor kirjutab failile scenarios/realtime-frame-eop.toml, liik realtime-frame-eop

# text
seg-72a1fc2f5c90 = <b>VALIDATED</b> Üks tabel annab UT1 ennustusvea, poolusliikumise poolusevea ja nende kvadratuurse kombinatsiooni Kuul IDENTSE epohhikomplekti kohta horisondi kaupa, väljastades epohhid, mil kumbagi komponenti mõõdeti. Testid: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

# text
# c1: realtime-frame-eop
seg-b1d90bf98ac3 = <b>VALIDATED</b> Käitusaja vaikeväärtus <c1/> on teegi enda manustatud koopia sõna-sõnalisest IERS-i finals2000A väljavõttest (tools/finals2000A_20260930.txt: { "174" } järjestikust päevarida, MJD 61224-61397, lõigatud 2026-09-30 failist finals2000A.all) kannab Testid: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-0298bd40d72f = <b>MODELLED</b> Vähimruutude nihke-pluss-kiiruse sobitus järelakna kohal pluss peamised perioodilised liikmed — aastane, poolaastane ja kaks peamist tsonaalset loodet UT1 jaoks; Chandleri, aastane ja poolaastane pooluse jaoks — ekstrapoleeritud viimase aknasisese Testid: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-12efcd20ca62 = <b>VALIDATED</b> Üks tabel annab UT1 ennustusvea, poolusliikumise poolusevea ja nende kvadratuurse kombinatsiooni Kuul IDENTSE epohhikomplekti kohta horisondi kaupa, väljastades. Sõltumatu etalon (sõltumatu etalon; ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3), mis loeb IERS-i finals2000A toodet oma Bulletin-B-muidu-A reegliga, ja pyerfa { "2.0.1.5" } (SOFA) täielikud taevalt-maapealseks pöörded (c2i06a, sp00, pom00, c2tcio; Maa pöörlemisnurk IERS { "2010" } valemi { "5.15" } järgi täpses aritmeetikas), käivitatud eraldi programmidena külmutatud 2026-09-30 finals2000A.all sõna-sõnalistel ridadel; eelregistreeritud (455b8fb5) muudatustega A1 ja A2, mis fikseerivad ainult

# text
# c1: realtime-frame-eop
seg-020e5919c8fd = <b>VALIDATED</b> Käitusaja vaikeväärtus <c1/> on teegi enda manustatud koopia sõna-sõnalisest IERS-i finals2000A väljavõttest (tools/finals2000A_20260930.txt: { "174" } järjestikust. Sõltumatu etalon (sõltumatu etalon; ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), mis loeb samu baite oma lugejaga, ja IERS-i Bulletin A Vol. XXXIX No. { "039" } tabel, kopeeritud number-numbri haaval; eelregistreeritud (6fdae01b) kuue täpse kriteeriumiga enne astropy käivitamist. Kõik kuus kehtivad: { "30" } lõplikku, { "54" } kiiret ja { "90" } ennustatud rida võrdsete MJD loenditega, iga ennustatud rea lipp P, vaikekäivituse loendus võrdne ning ennustused võrdsed Bullet

# text
seg-530c87bbff78 = <b>MODELLED</b> Vähimruutude nihke-pluss-kiiruse sobitus järelakna kohal pluss peamised perioodilised liikmed — aastane, poolaastane ja kaks peamist tsonaalset loodet UT1 jaoks; Cha. Sõltumatu etalon (viiteteostus; ReferenceImpl): kolm sõltumatut marsruuti, ükski neist pole avaldatud ennustustäpsuse arv. ({ "1" }) Teadaolevate koefitsientidega analüütiline signaal — ainus viis perioodilise masinavärgi rakendamiseks, kuna ükski kinnistatud rida ei ole piisavalt pikk aastase liikme lubamiseks. ({ "2" }) Õpikuline kinnise kuju vähimruutude lahend, erinev algebra kui testitav maatriksilahend, reaalsetel ridadel. ({ "3" }) Tegelikud arhiveeritud Bulletin A ennustusread, mis

# text
# c1: label
seg-a233df86be95 = Reaalajas Kuu tugisüsteemi / Maa orientatsiooni ennustuse eelarve. VALIDATED kinnine kuju: L19 õlapikkus ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ ristkontrollitud CIO Maa pöörlemisnurga vastu. VALIDATED reaalsed andmed: L18 UT1 ja poolusliikumise ennustusvea kõverad loetud otse tegelikust IERS-i finals2000A reast (Bulletin A kiire vs Bulletin B lõplik ja mitmepäevane püsivus tegelike päevaridade kohal). DERIVED: tugisüsteem (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-60e7ee7e6e3e = VALIDATED kinnine kuju (L19 õlapikkus, ω⊕ ristkontrollitud CIO Maa pöörlemisnurga vastu) ja VALIDATED reaalsed andmed (L18 kõver otse tegelikelt finals2000A ridadelt); MODELLED on tsislunaarse releesatelliidi OD kovariatsioonide suurused ja tugisüsteemi realisatsiooni põhjatase (esindusliku jaotusega eraldised) ning püsivusennustaja (mitte IERS-i operatiivne Bulletin A algoritm). (liikide kataloog (<c1/>))

# text
seg-ddf4702f78e5 = Austus: VALIDATED kinnine kuju (L19 õlapikkus, omega_earth ristkontrollitud CIO Maa pöörlemisnurga vastu) ja VALIDATED reaalsed andmed (L18 UT1 ja poolusliikumise kõverad otse tegelikelt finals2000A ridadelt). DERIVED tugisüsteemi realisatsiooni põhjatase (Helmerti järelsobituse jääk). MODELLED on tsislunaarse releesatelliidi OD kovariatsioonide suurused ({ "0.27" } m järeltöödeldult, ~{ "14.4" } m reaalajas ühetunnise latentsuse korral — ümardatud, mitte tagasi lahendatud, all (stsenaariumifaili kommentaar, read { "27" }–{ "32" })

# text
seg-bc51b666d070 = Operatiivse stiiliga Maa orientatsiooni ennustusviga, mõõdetuna ennustatud-vs-lõplik, on MODELLED, mitte valideeritud: kontrollitud sama koodibaasi eraldi teostuse vastu — kontrollitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-653fad5e0afe = <s1>Eelmine</s1>quantum-trade

# text
seg-5abe534d4ef1 = <s1>Järgmine</s1>reentry
