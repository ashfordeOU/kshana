# docs--kind-hybrid-optical-rf: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-debc2f07db78 = true

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
# c1: docs/kinds/by-kind/hybrid-optical-rf.md
seg-0482fec5b0f6 = Quelle: <c1/>

# text
seg-e6839b50b560 = MODELLED heterogene optische + HF-PNT-Gesamtgütezahl (P5): setzt zusammen das optische Zweiwege-Link-Budget bei { "1550" } nm (photonenbegrenzte Zweiwege-Entfernungsmessung mit CRLB σ_τ/√N und Beugungs-Footprint λ/D·Entfernung), ein modalitätsübergreifendes RAIM-Schutzniveau nach Lösungstrennung (Position UND Zeit), das die lockere HF- und die straffe optische Lösung mit unterschiedlichen Kovarianzen fusioniert, die optische Klarhimmel-Verfügbarkeit von N Stationen (unabhängige Vereinigung { "1" }−Π({ "1" }−a_i) und eine räumlich korrelierte Variante), eine optisch↔HF-Zustands-/Kovarianzübergabe mit einem BEWIESEN bitkontinuierlichen (sprungfreien) Mittelwert und einem NEES-χ²-Konsistenztor sowie einen gemeinsamen Score P(verfügbar UND präzisionstauglich UND integritätsgesichert) mit Behandlung von Korrelationen. VALIDATED geschlossene Form: die Entfernungs-CRLB, der Beugungs-Footprint, das χ²-Schutzniveau-Quantil, die Vereinigungskombinatorik, die Mittelwertstetigkeit der Übergabe + das NEES-Tor und das gemeinsame unabhängige Produkt. MODELLED: die optischen Verlustzuweisungen, die σ-Größen von HF und Optik, die Eingaben der Wolkenklimatologie, die Korrelationen und das P_HMI-Budget. Kein zertifiziertes Verfügbarkeits-/Integritätsprodukt.

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-30904e2367fc = Ein Lauf von <c1/> fasst sich so zusammen: hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology

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
seg-73e5cf56c92c = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-27338c8b2e5f = Das Beispiel <c1/> setzt unter anderem:

# text
seg-7b9ce4689508 = Ergebnisbezeichnung (der Engine): Heterogene optische + HF-PNT-Gesamtgütezahl für Verfügbarkeit / Präzision / Integrität (P5). VALIDATED geschlossene Form: die photonenbegrenzte Entfernungs-CRLB (σ_τ/√N) und der Beugungs-Footprint (λ/D·Entfernung), das χ²-Quantil des modalitätsübergreifenden Schutzniveaus, die Verfügbarkeit der unabhängigen Vereinigung von N Stationen ({ "1" } − Π(

# text
# c1: variance
seg-a8923a682728 = <b>MODELLED</b> Der Bericht von hybrid-optical-rf nennt die Link-Konfiguration, mit der er tatsächlich lief (Trägerwellenlänge, Sende- und Empfangsapertur, Entfernung, Pulsbreite, Integratio. Orakel (InternalConsistency): Keine externe unabhängige Referenz, und keine ist möglich: Dies ist Selbstbeschreibung, keine Messung. Sie wird festgehalten, weil ihr Fehlen ein Mangel war -- P5 musste die Trägerwellenlänge und die Sendeapertur aus Quell-Standardwerten angeben und aus einer Prüfung der internen Konsistenz schließen, dass ein nacktes <c1/> in Quadratmetern war. Der Schluss war richtig, und genau deshalb war es wichtig: nichts hätte aufgefangen, dass er falsch gewesen wäre

# text
seg-28abb5a84eaa = <b>MODELLED</b> Der Bericht von hybrid-optical-rf nennt eine HF-Link-Verfügbarkeit, zusammengesetzt aus Größen, die die Engine ohnehin berechnet, statt aus einer importierten Klimatologie, und . Orakel (InternalConsistency): Keine externe unabhängige Referenz, und ExternalDataset wird abgelehnt. Die beiden Eingaben sind eine Eb/N0-Marge und eine C/N0-Schwellenüberschreitung, beide Funktionen einer MODELLED EIRP, Gütezahl und pauschalen Verlustzuweisung; es gibt keinen gemessenen Verfügbarkeitsverlauf für einen optisch/HF-hybriden Erde-Mond-Dienst, gegen den sich die zusammengesetzte Zahl prüfen ließe. Die vorhandenen Prüfungen sind intern und werden als solche benannt: Die Zusammensetzung wird aus dem r

# text
seg-888004543d37 = <b>MODELLED</b> Der Bericht von hybrid-optical-rf gibt das Verhältnis der optischen zur HF-Entfernungsmessung aus, wobei die EINE Konfiguration, bei der beide Zweige ausgewertet wurden, im selben Objekt mitgeführt wird: die sa. Orakel (InternalConsistency): Keine externe unabhängige Referenz für das VERHÄLTNIS, und ExternalDataset wird bewusst abgelehnt. Die zugrunde liegende HF-Kette hat sehr wohl eine -- tests/validate_p5_rf_ranging_precision.rs prüft linkbudget::link_budget und navsignal::dll_code_jitter_chips gegen eine unabhängige Python/NumPy-Fixture und gegen den fest codierten Rechenwert von Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m bei { "45" } dB-Hz) -- und die optische CRLB hat ihre eigene Zeile mit geschlossener Form

# text
seg-db5ff373b50f = <b>MODELLED</b> Der Bericht von hybrid-optical-rf nennt, was der modalitätsübergreifende Chi-Quadrat-Monitor tatsächlich ERKENNEN kann, nicht nur, dass er einen fehlerfreien Fall besteht: der minimal erkennbare. Orakel (InternalConsistency): Zwei interne Referenzen, kein externer Datensatz. ({ "1" }) Rundlauf in geschlossener Form: Die minimal erkennbare Verzerrung entsteht durch Invertieren des Randes der nichtzentralen Chi-Quadrat-Verteilung am Nichtzentralitätsparameter (raim::pbias) und wird verifiziert, indem der resultierende Nichtzentralitätsparameter an der eigenen Schwelle des Monitors durch raim::noncentral_chi2_cdf zurückgeführt wird, was P_md ergeben muss. ({ "2" }) Injektion gegen Analyse: Eine Verzerrung wird in die HF-Schätzung einer Achse geschrieben

# text
# c1: label
seg-24f31f6b353f = Heterogene optische + HF-PNT-Gesamtgütezahl für Verfügbarkeit / Präzision / Integrität (P5). VALIDATED geschlossene Form: die photonenbegrenzte Entfernungs-CRLB (σ_τ/√N) und der Beugungs-Footprint (λ/D·Entfernung), das χ²-Quantil des modalitätsübergreifenden Schutzniveaus, die Verfügbarkeit der unabhängigen Vereinigung von N Stationen ({ "1" } − Π({ "1" }−a_i)), die Invariante der Mittelwertstetigkeit der optisch↔HF-Übergabe (bitgenau sprungfrei) und das NEES-χ²-Tor sowie die unabhängige Gesamtgütezahl (Ergebnis <c1/>)

# text
seg-9fafa5ffb521 = MODELLED. Validierte geschlossene Formen: Entfernungs-CRLB (sigma_tau/sqrt(N)), Beugungs-Footprint (lambda/D * range), Chi-Quadrat-Quantil des Schutzniveaus, Vereinigungskombinatorik, Mittelwertstetigkeit der Übergabe + NEES-Tor und das gemeinsame unabhängige Produkt. Die Verlustzuweisungen, Sigma-Größen, Eingaben der Wolkenklimatologie, Korrelationen und das P_HMI-Budget sind modellierte repräsentative Eingaben. Jedes Feld unten ist optional und wird mit seinem (Kommentar in der Szenariodatei, Zeilen { "10" } bis { "14" })

# text
seg-e5f964e5d422 = --- G15 Verzerrungs-/Rampenfehler-Injektion gegen den modalitätsübergreifenden Monitor --- Die minimal erkennbare Verzerrung und die Erkennungsleistungskurve sind ANALYTISCH (Inversion der nichtzentralen Chi-Quadrat-Verteilung), brauchen also keine eigenen Eingaben. Diese beiden legen nur die Rampenrate fest, deren Umrechnung die gemeldete Zeit bis zur Erkennung ist. Beide MODELLED. (Kommentar in der Szenariodatei, Zeilen { "56" } bis { "59" })

# text
seg-70f50a62aa12 = --- G17 Auslaufen nach der Übergabe: Prozessrauschen und Überschreiten des Alarmgrenzwerts --- Random Walk auf dem bestehenden 4-Zustands-Übergabefilter (Ost, Nord, Oben, Uhr). Die Alarmgrenzwerte sind die oben bereits deklarierten; nur das Prozessrauschen und der Abdeckungsfaktor sind neu. Beide Leistungsdichten sind MODELLED repräsentative Eingaben, und die Zeitpunkte der Überschreitung skalieren direkt mit ihnen. (Kommentar in der Szenariodatei, Zeilen { "63" } bis { "67" })

# text
seg-9fb4240fb0ef = Die Selbstbeschreibung des Hybrid-Optisch/HF-Berichts ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-a97755cb13eb = Familienseite: <a1>Optical PNT</a1>

# text
seg-1586d90cdf1b = <s1>Zurück</s1>holdover-test

# text
seg-211275a00df0 = <s1>Weiter</s1>hybrid-ukf

# text
# c1: kshana kinds --json
seg-15abc895e477 = MODELLED: die optischen Verlustzuweisungen, die σ-Größen von HF und Optik, die Eingaben der Wolkenklimatologie, die Korrelationen und das P_HMI-Budget. (Szenarioarten-Katalog (<c1/>))

# attr:alt
seg-5cea5229815e = Das Diagramm, das die Engine für scenarios/hybrid-optical-rf.toml schreibt, Szenarioart hybrid-optical-rf

# text
seg-72ad48275ebe = Szenarioart der Engine v{ $version }, Familie <a1>Optical PNT</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# text
# c1: hybrid-optical-rf
seg-830c574e871b = <c1/> (Szenarioart)

# text
# c1: kshana kinds --json
seg-bec90783ad8b = MODELLED heterogene optische + HF-PNT-Gesamtgütezahl (P5): setzt zusammen das optische Zweiwege-Link-Budget bei { "1550" } nm (photonenbegrenzte Zweiwege-Entfernungsmessung mit CRLB σ_τ/√N und Beugungs-Footprint λ/D·Entfernung), ein modalitätsübergreifendes RAIM-Schutzniveau nach Lösungstrennung (Position UND Zeit), das die lockere HF- und die straffe optische Lösung mit unterschiedlichen Kovarianzen fusioniert, die optische Klarhimmel-Verfügbarkeit von N Stationen (unabhängige Ver (Szenarioarten-Katalog (<c1/>))
