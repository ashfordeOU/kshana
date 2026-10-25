# docs--kinds-optical-pnt: translations (de)

# text
seg-b03d56f501c3 = Typ

# text
seg-e6839b50b560 = MODELLED heterogene optische + HF-PNT-Gesamtgütezahl (P5): setzt zusammen das optische Zweiwege-Link-Budget bei { "1550" } nm (photonenbegrenzte Zweiwege-Entfernungsmessung mit CRLB σ_τ/√N und Beugungs-Footprint λ/D·Entfernung), ein modalitätsübergreifendes RAIM-Schutzniveau nach Lösungstrennung (Position UND Zeit), das die lockere HF- und die straffe optische Lösung mit unterschiedlichen Kovarianzen fusioniert, die optische Klarhimmel-Verfügbarkeit von N Stationen (unabhängige Vereinigung { "1" }−Π({ "1" }−a_i) und eine räumlich korrelierte Variante), eine optisch↔HF-Zustands-/Kovarianzübergabe mit einem BEWIESEN bitkontinuierlichen (sprungfreien) Mittelwert und einem NEES-χ²-Konsistenztor sowie einen gemeinsamen Score P(verfügbar UND präzisionstauglich UND integritätsgesichert) mit Behandlung von Korrelationen. VALIDATED geschlossene Form: die Entfernungs-CRLB, der Beugungs-Footprint, das χ²-Schutzniveau-Quantil, die Vereinigungskombinatorik, die Mittelwertstetigkeit der Übergabe + das NEES-Tor und das gemeinsame unabhängige Produkt. MODELLED: die optischen Verlustzuweisungen, die σ-Größen von HF und Optik, die Eingaben der Wolkenklimatologie, die Korrelationen und das P_HMI-Budget. Kein zertifiziertes Verfügbarkeits-/Integritätsprodukt.

# attr:alt
seg-5cea5229815e = Das Diagramm, das die Engine für scenarios/hybrid-optical-rf.toml schreibt, Kind hybrid-optical-rf

# text
seg-a878d9be65b7 = MODELLED optische PNT durch die Atmosphäre: Für eine optische Strecke und eine Menge von Bodenstandorten mit angegebenem Wolkenklima gibt sie den wellenlängen- und elevationsabhängigen Klarluftverlust (Kim-Sichtweitengesetz plus Rayleigh), den Hufnagel-Valley-Turbulenzzustand (Rytov-Varianz, Szintillationsindex, Gamma-Gamma-Parameter, Aperturmittelung), die wetterbedingte Verfügbarkeit gegen die Streckenreserve (optische Wolkentiefe aus einem lognormalen Flüssigwasser-Klima, geometrisch-optische Extinktion, unabhängiger Turbulenzschwund), die für Zielverfügbarkeiten nötige Streckenreserve, die Verteilung der Ausfalldauer, das Anwachsen des Zeitgebungs- und Entfernungsmessfehlers pro Ausfall über das Uhren-Holdover-Modell, die entfernungskorrelierte Standortdiversitäts-Verfügbarkeit und Was-wäre-wenn-Gewinne für Verbesserungstechniken (Wellenlänge, Empfangsapertur, Szintillationsreduktion durch adaptive Optik, zusätzliche Reserve) aus. VALIDATED als Implementierung der angegebenen Formeln gegen ein unabhängiges mpmath-Referenz: Rytov-Varianz, Szintillationsindex, Gamma-Gamma-Schwundwahrscheinlichkeit, Aperturmittelungsfaktor, optische Tiefe von Wolken und Klarluft. MODELLED: jede Wetter-, Technik- und Uhren-Eingabe sowie die Unabhängigkeits- und Copula-Annahmen; es wurde kein gemessener Verfügbarkeitsnachweis verglichen. Beratende Analyse, kein zertifiziertes Verfügbarkeits- oder Navigationsprodukt.

# attr:alt
seg-4e2b759aff17 = Das Diagramm, das die Engine für scenarios/optical-atmosphere-network.toml schreibt, Kind optical-atmosphere

# text
seg-4e31c8daf798 = Register

# text
# c1: docs/kinds/optical-pnt.md
seg-963749981a7c = Quelle: <c1/>

# text
seg-079c8b284c44 = Optische PNT (Familie von Szenariotypen)

# text
seg-6dea687b727b = { "2" } Szenariotypen der Engine v{ $version }. Hinweis (beratend): Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit menschlichen Lebens. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt Evidence der README).

# text
# c1: kshana scenarios/optical-atmosphere-network.toml
seg-d019c8511f48 = Themenseiten: <a1>OPTICAL-ATMOSPHERE</a1>. Einen davon ausführen: <c1/>. Alle Familien: <a2>KINDS.md</a2>.

# attr:alt
seg-b8f937411028 = Übersichtsblatt der Diagramme, die die Engine für die Typen der Familie Optische PNT schreibt

# text
seg-76131e6805e5 = MODELLED optische PNT durch die Atmosphäre: für eine optische Strecke und eine Menge von Bodenstandorten mit angegebenem Wolkenklima berichtet sie den wellenlängen- und elevationsabhängigen Klarluftverlust (Kim-Sichtweite

# text
seg-55725043f48e = MODELLED heterogene gemeinsame Gütezahl aus optischer und HF-PNT (P5): setzt die optische Zweiwege-Streckenbilanz bei { "1550" } nm zusammen (photonenbegrenzte Zweiwege-Entfernungsmessung CRLB σ_τ/√N und Beugungs-Footprint λ/D·Entfernung), a

# text
seg-5e658f01d9f4 = HETEROGENEOUS (Ergebniskennzeichnung)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-750466e3188c = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-9e3ce423c0b9 = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>optical-atmosphere</a1>.

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
seg-93f5d0527850 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

# text
seg-6a6f8eea5767 = <b>Register:</b> Keine Matrixzeile nennt diesen Typ; die Engine kennzeichnet ihr Ergebnis selbst. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>hybrid-optical-rf</a1>.

# text
seg-a4baaf1fbb8c = <s1>Zurück</s1>Missionsanalyse, Funkstrecken und Raumfahrtbetrieb

# text
seg-48792381ba0b = <s1>Weiter</s1>Navigation für Raumfahrzeugnutzer
