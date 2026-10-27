# docs--kind-hybrid-optical-rf: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
# c1: docs/kinds/by-kind/hybrid-optical-rf.md
seg-0482fec5b0f6 = Allikas: <c1/>

# text
# c1: hybrid-optical-rf
seg-830c574e871b = <c1/> (stsenaariumi liik)

# text
seg-72ad48275ebe = Mootori v{ $version } stsenaariumi liik, perekond <a1>Optiline PNT</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-e6839b50b560 = MODELLED heterogeenne optilise + RF PNT-i ühine kvaliteedinäitaja (P5): koondab { "1550" } nm kahesuunalise optilise lingibilansi (footonipiiratud kahesuunalise vahemõõtmise CRLB σ_τ/√N ja difraktsioonijalajälg λ/D·vahemaa), ristmodaalse lahendite eraldatuse RAIM kaitsetaseme (positsioon JA ajastus), mis ühendab lõdva RF ja tiheda optilise lahendi erinevate kovariatsioonidega, N jaama optilise selge taeva kättesaadavuse (sõltumatu ühend { "1" }−Π({ "1" }−a_i) ja ruumiliselt korreleeritud variant), optilise↔RF oleku/kovariatsiooni üleandmise TÕESTATUD bitipidevuse (hüppeta) keskmisega ja NEES χ² kooskõlaväravaga ning ühise P(kättesaadav JA täppisklassi JA terviklikkus tagatud) skoori korrelatsioonide käsitlusega. VALIDATED suletud kuju: vahemõõtmise CRLB, difraktsioonijalajälg, χ² kaitsetaseme kvantiil, ühendi kombinatoorika, üleandmise keskmise pidevus + NEES värav ja ühine sõltumatu korrutis. MODELLED: optilise kao jaotused, RF/optilise σ suurused, pilvekliima sisendid, korrelatsioonid ja P_HMI eelarve. Mitte sertifitseeritud kättesaadavuse/terviklikkuse toode.

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-30904e2367fc = Ühe <c1/> jooksu kokkuvõte: hybrid-optical-rf | optiline jalajälg { "700" } m, { "1489" } footonit -> vahemõõtmise σ { "0.194" } mm, ajastuse σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (kaitstud) | kättesaadavus { "99.5" }% ({ "5" } jaama) | üleandmine hüppeta OK NEES { "3.34" }∈[0.48,{ "11.14" }] väravas | ühine FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | valideeritud CRLB/χ²-PL/ühend/üleandmine, modelleeritud σ/kliima

# text
# c1: wavelength_nm
# c2: tx_power_w
# c3: tx_aperture_m
# c4: rx_aperture_m
# c5: range_km
# c6: pulse_rms_ps
# c7: integration_s
# c8: atmospheric_loss_db
# c9: pointing_loss_db
# c10: optics_efficiency
# c11: detector_efficiency
# c12: two_way
# c13: rf_pos_sigma_m
# c14: rf_vertical_sigma_m
# c15: rf_clock_sigma_s
# c16: p_fa
# c17: p_md
# c18: alert_limit_h_m
# c19: alert_limit_v_m
# c20: alert_limit_t_s
# c21: grade_pos_m
# c22: grade_time_s
# c23: n_optical_sites
# c24: site_correlation
# c25: fom_correlation
# c26: handoff_inflation
# c27: p_hmi
# c28: fault_ramp_rate_pos_m_s
# c29: fault_ramp_rate_clock_s_s
# c30: process_noise_pos_psd_m2_s
# c31: process_noise_clock_psd_s2_s
# c32: coast_coverage_k
# c33: rf_band
# c34: rf_eirp_dbw
# c35: rf_g_over_t_db
# c36: rf_other_losses_db
# c37: rf_data_rate_bps
# c38: rf_required_eb_n0_db
# c39: rf_chip_rate_hz
# c40: rf_correlator_spacing_chips
# c41: rf_dll_bandwidth_hz
# c42: rf_tracking_threshold_dbhz
# c43: rf_degraded_margin_db
seg-73e5cf56c92c = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-27338c8b2e5f = Näide <c1/> määrab muu hulgas:

# text
seg-7b9ce4689508 = Tulemuse silt (mootori oma): Heterogeenne optilise + RF PNT-i ühine kättesaadavuse / korduvtäpsuse / terviklikkuse kvaliteedinäitaja (P5). VALIDATED suletud kuju: footonipiiratud vahemõõtmise CRLB (σ_τ/√N) ja difraktsioonijalajälg (λ/D·vahemaa), χ² ristmodaalse kaitsetaseme kvantiil, N jaama sõltumatu ühendi kättesaadavus ({ "1" } − Π(

# attr:alt
seg-5cea5229815e = Diagramm, mille mootor kirjutab failile scenarios/hybrid-optical-rf.toml, liik hybrid-optical-rf

# text
# c1: variance
seg-a8923a682728 = <b>MODELLED</b> Aruanne hybrid-optical-rf väljendab lingi konfiguratsiooni, millega see tegelikult jooksis (kandelaine pikkus, saate- ja vastuvõtuapertuur, vahemaa, impulsi laius, integratsioon. Oraakel (sõltumatu etalon) (InternalConsistency): Välist sõltumatut etaloni ei ole ja see pole võimalik: see on enesekirjeldus, mitte mõõtmine. See on salvestatud, sest selle puudumine oli viga -- P5 pidi tsiteerima kandelaine pikkust ja saateapertuuri lähtekoodi vaikeväärtustest ning järeldama sisemise kooskõla kontrollist, et paljas <c1/> oli ruutmeetrites. Järeldus oli õige, mis just tegi selle oluliseks: miski poleks tabanud, kui see oleks olnud vale

# text
seg-28abb5a84eaa = <b>MODELLED</b> Aruanne hybrid-optical-rf väljendab RF lingi kättesaadavust, mis on koostatud suurustest, mida mootor juba arvutab, mitte imporditud kliimast, ja . Oraakel (sõltumatu etalon) (InternalConsistency): Välist sõltumatut etaloni ei ole ja ExternalDataset on tagasi lükatud. Kaks sisendit on Eb/N0 varu ja C/N0 läve ületus, mõlemad MODELLED EIRP, kvaliteedinäitaja ja koondkao jaotuse funktsioonid; Maa-Kuu optilise/RF hübriidteenuse jaoks ei ole mõõdetud kättesaadavuse kirjet, mille vastu koostatud arvu kontrollida. Olemasolevad kontrollid on sisemised ja neid väljendatakse nii: koostis arvutatakse uuesti r

# text
seg-888004543d37 = <b>MODELLED</b> Aruanne hybrid-optical-rf väljastab optilise ja RF vahemõõtmise suhte ÜHE konfiguratsiooniga, mille juures mõlemat haru hinnati, kantuna samas objektis: sa. Oraakel (sõltumatu etalon) (InternalConsistency): SUHTE jaoks ei ole välist sõltumatut etaloni ja ExternalDataset on tahtlikult tagasi lükatud. Aluseks olevat RF ahelat see omab -- tests/validate_p5_rf_ranging_precision.rs kontrollib linkbudget::link_budget ja navsignal::dll_code_jitter_chips sõltumatu Python/NumPy fikstuuri vastu ja kõvakodeeritud Kaplani ja Hegarty läbitöötatud väärtuse vastu ({ "2.814e-3" } chip / { "0.825" } m juures { "45" } dB-Hz) -- ja optilisel CRLB-l on oma suletud kujul rida

# text
seg-db5ff373b50f = <b>MODELLED</b> Aruanne hybrid-optical-rf väljendab, mida ristmodaalne hii-ruut monitor tegelikult suudab TUVASTADA, mitte ainult seda, et see läbib rikketa juhtumi: minimaalne tuvastatav. Oraakel (sõltumatu etalon) (InternalConsistency): Kaks sisemist sõltumatut etaloni, välist andmestikku ei ole. ({ "1" }) Suletud kujul edasi-tagasi: minimaalne tuvastatav nihe saadakse mittetsentraalse hii-ruut saba inverteerimisega mittetsentraalsuse suhtes (raim::pbias) ja see kontrollitakse, söötes saadud mittetsentraalsuse tagasi funktsiooni raim::noncentral_chi2_cdf monitori enda lävel, mis peab andma P_md. ({ "2" }) Süstimine vs analüüs: nihe kirjutatakse ühe telje RF hinnangusse

# text
# c1: label
seg-24f31f6b353f = Heterogeenne optilise + RF PNT-i ühine kättesaadavuse / korduvtäpsuse / terviklikkuse kvaliteedinäitaja (P5). VALIDATED suletud kuju: footonipiiratud vahemõõtmise CRLB (σ_τ/√N) ja difraktsioonijalajälg (λ/D·vahemaa), χ² ristmodaalse kaitsetaseme kvantiil, N jaama sõltumatu ühendi kättesaadavus ({ "1" } − Π({ "1" }−a_i)), optilise↔RF üleandmise keskmise pidevuse (bitihaaval hüppeta) invariant ja NEES χ² värav ning ühine FoM sõltumatu (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-bec90783ad8b = MODELLED heterogeenne optilise + RF PNT-i ühine kvaliteedinäitaja (P5): koondab { "1550" } nm kahesuunalise optilise lingibilansi (footonipiiratud kahesuunalise vahemõõtmise CRLB σ_τ/√N ja difraktsioonijalajälg λ/D·vahemaa), ristmodaalse lahendite eraldatuse RAIM kaitsetaseme (positsioon JA ajastus), mis ühendab lõdva RF ja tiheda optilise lahendi erinevate kovariatsioonidega, N jaama optilise selge taeva kättesaadavuse (sõltumatu (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-15abc895e477 = MODELLED: optilise kao jaotused, RF/optilise σ suurused, pilvekliima sisendid, korrelatsioonid ja P_HMI eelarve. (liikide kataloog (<c1/>))

# text
seg-9fafa5ffb521 = MODELLED. Valideeritud suletud kujud: vahemõõtmise CRLB (sigma_tau/sqrt(N)), difraktsioonijalajälg (lambda/D * vahemaa), hii-ruut kaitsetaseme kvantiil, ühendi kombinatoorika, üleandmise keskmise pidevus + NEES värav ja ühine sõltumatu korrutis. Kaojaotused, sigma suurused, pilvekliima sisendid, korrelatsioonid ja P_HMI eelarve on modelleeritud esinduslikud sisendid. Iga allolev väli on valikuline ja näidatud selle (stsenaariumifaili kommentaar, read { "10" } kuni { "14" })

# text
seg-e5f964e5d422 = --- G15 nihke / rambi rikke süstimine ristmodaalse monitori vastu --- Minimaalne tuvastatav nihe ja tuvastusvõimsuse kõver on ANALÜÜTILISED (mittetsentraalse hii-ruut inversioon), seega nad ei vaja oma sisendeid. Need kaks määravad ainult rambi kiiruse, mille kiiruse teisendus on teatatud tuvastusaeg. Mõlemad MODELLED. (stsenaariumifaili kommentaar, read { "56" } kuni { "59" })

# text
seg-70f50a62aa12 = --- G17 üleandmisjärgne libisemine: protsessimüra ja häirepiiri ületus --- Juhuslik ekslemine olemasoleval 4-olekulisel (ida, põhi, üles, kell) üleandmisfiltril. Häirepiirid on need, mis on juba ülal deklareeritud; uued on ainult protsessimüra ja katvustegur. Mõlemad PSD-d on MODELLED esinduslikud sisendid ja ületusajad skaleeruvad nendega otse. (stsenaariumifaili kommentaar, read { "63" } kuni { "67" })

# text
seg-9fb4240fb0ef = Hübriidse optilise/RF aruande enesekirjeldus on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-a97755cb13eb = Perekonna leht: <a1>Optiline PNT</a1>

# text
seg-1586d90cdf1b = <s1>Eelmine</s1>holdover-test

# text
seg-211275a00df0 = <s1>Järgmine</s1>hybrid-ukf
