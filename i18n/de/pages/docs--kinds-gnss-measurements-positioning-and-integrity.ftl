# docs--kinds-gnss-measurements-positioning-and-integrity: translations (de)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Typ

# text
seg-5f25c5b71f0c = Weltraumwetter-Umgebungsmodell: solare (F10.7/F10.7a) und geomagnetische (Kp, mit der definitorischen Tabelle Kp↔ap) Aktivitätsindizes, die von ihnen getriebene exosphärische Temperatur nach Jacchia-1971 (validiert gegen veröffentlichte Werte für Sonnenminimum, -mittel und -maximum) und die thermosphärische Neutraldichte nach Jacchia-1971 bei der tagesgemittelten exosphärischen Temperatur gegenüber dem aktivitätsfreien statischen Profil in einer Reihe von Höhen — die Abhängigkeit der Dichte vom Sonnenzyklus, die die statische Atmosphäre auslässt. MODELLED: Die Dichte stimmt mit beschleunigungsmesserbasierten Dichten (TOLEOS CHAMP und GRACE) innerhalb eines Faktors { "2" } im Sonnenmaximum überein, ist aber im Sonnenminimum { "2008" } etwa 1.7x zu dicht.

# text
# c1: published
seg-06197409c717 = Veröffentlichte ARAIM-Zertifizierungs-Referenzvektoren: Die horizontalen und vertikalen ARAIM-Schutzniveaus der Engine laufen gegen die EIGENEN durchgerechneten numerischen Beispiele der WG-C-ARAIM-Technical-Subgroup, mit der Toleranz (TOL_PL = { "5e-2" } m), die diese Dokumente selbst nennen. Zwei Vektoren sind als Fixtures eingecheckt, jeder mit seiner Abruf-URL, seinem Abrufdatum, dem SHA-256 der Quelldatei und der Seite: dem Anhang D des Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) — in sich konsistent und der Abnahmevektor — und dem Milestone { "3" } Report ({ "2016" }) Annex A Abschnitt A.IX, der Aussage, die die Forschungsbibliografien zitieren. Jede veröffentlichte Eingabe (die Geometriematrix mit 10 Satelliten und 2 Konstellationen, die Varianzdiagonalen C_int und C_acc, b_nom, P_sat, P_const und der konstante Satz für LPV-200) und jede veröffentlichte Ausgabe (VPL, HPL, EMT, sigma_v_acc, K_fa_3 und sigma_3, sigma_ss_3 und b_3 der beiden Konstellationsfehlermodi) wird neben der eigenen Zahl der Engine und ihrer absoluten Differenz gemeldet. Die Schutzniveaugleichung wird hier NICHT neu gelöst: Die Modusliste der Referenz wird den bestehenden raim::araim_protection_level / araim_integrity_risk der Engine übergeben, sodass die geprüfte Bisektion und Gauß-Schwanz-Algebra die eigenen der Engine sind; nur die Geometrie, die Teillösungen, die Detektionsschwellen und die veröffentlichte Budgetaufteilung werden dafür gebaut. EXTERNALLY CHECKED gegen den Vektor von { "2019" }: VPL { "18.2926" } m gegenüber veröffentlichten { "18.3" } m, HPL { "13.4063" } m gegenüber { "13.45" } m, EMT { "7.2997" } m gegenüber { "7.2998" } m, sigma_v_acc { "1.3694" } m gegenüber { "1.3694" } m und alle sechs veröffentlichten Zwischenwerte auf eine halbe Einheit in ihrer letzten gedruckten Dezimalstelle. Der Vektor von { "2016" } trägt zwei interne Mängel, die der Bericht nennt, statt sie zu verbergen — einen Vorzeichenfehler in Zeile { "3" } von G und ein K_fa_3, das bei { "57" } Fehlermodi ausgewertet wurde, während das Dokument N_fault_max = { "1" } ({ "12" } Modi) nennt — sodass seine Geometrie-Zwischenwerte exakt reproduziert werden, während seine Schutzniveaus als gemessene Abweichungen gemeldet und aus der Abnahmezahl ausgeschlossen werden; die Toleranz wird nie geweitet, um sie aufzunehmen. Jedes ausgegebene numerische Feld trägt eine Einheit und eine Herkunftsklasse, und eine abgeschriebene Zahl ist mit <c1/> bezeichnet, sodass sie nie mit einer berechneten verwechselt werden kann. UMFANG: Nur N_fault_max = { "1" } (Fehlermodi einzelner Satelliten und einzelner Konstellationen) ist implementiert, und ein Fall, dessen Prioris gleichzeitige Fehlerteilmengen mit mehreren Ereignissen erfordern, wird REFUSED, statt stillschweigend gekürzt zu werden; Fehlererkennung, Ausschluss, die Chi-Quadrat-Konsistenzprüfung und der Umverteilungsschritt gegen Doppelzählung des Referenzalgorithmus liegen außerhalb des Umfangs. Dies reproduziert das durchgerechnete Beispiel eines veröffentlichten Referenzalgorithmus — es ist keine Zertifizierung, kein Lufttüchtigkeitsartefakt und keine Zulassung.

# attr:alt
seg-693c823c85d1 = Das Diagramm, das die Engine für scenarios/araim-reference-check.toml schreibt, Art araim-reference-check

# text
seg-2ffccc9c1eff = Pseudoentfernungssimulation im Messraum (Klobuchar-Ionosphäre, Saastamoinen/Niell-Troposphäre) + RAIM.

# attr:alt
seg-47ee40d4eb73 = Das Diagramm, das die Engine für scenarios/gnss-sim-raim.toml schreibt, Art gnss-sim

# text
seg-eb7e0c2feb2b = Snapshot-/Lösungstrennungs-/ARAIM-RAIM mit HPL/VPL und einem Stanford-Diagramm.

# text
seg-b7b67e03f125 = Einzelpunkt-Positionierung aus realen Beobachtungen: die Position eines Empfängers aus einer RINEX-{ "3" }-Beobachtungsdatei und einer Broadcast-Navigationsdatei lösen (Code-Pseudoentfernungen, Broadcast-Ephemeride, Klobuchar-Ionosphäre, Saastamoinen/Niell-Troposphäre), optional gegen eine vermessene Koordinate validiert.

# text
seg-edfcb546d9de = Echtzeit-Budget der Vorhersage von Mondbezugssystem / Erdorientierung: P4-Tabelle { "1" } (die Konsistenzprüfung des Bezugssystemfehlers — nachverarbeitet ~{ "0.27" } m ↔ ~{ "0.010" } ms und Echtzeit ~{ "15" } m ↔ ~{ "0.5" } ms, jede Bezugssystemposition ausgedrückt als ihr äquivalenter UT1-Fehler über den L19-Hebelarm Δr = D_EM·ω⊕·ΔUT1) und Tabelle { "2" } (gemessener UT1-Vorhersagefehler gegen den Horizont — die L18-Kurve, direkt aus der realen IERS-Reihe finals2000A abgelesen: die endgültige Untergrenze Bulletin A − Bulletin B und der Fehler des Persistenz-Prädiktors über mehrere Tage, jeweils durch L19 auf eine Position im Mondbezugssystem abgebildet), plus das L21-Echtzeit-Bezugssystemfehlerbudget als Wurzel aus der Quadratsumme (EOP + Ephemeride + Realisierungs-Untergrenze). VALIDATED: die geschlossene Form (der L19-Hebelarm, ω⊕ gegengeprüft gegen den CIO-Erdrotationswinkel) und VALIDATED: reale Daten (die L18-Kurve aus den realen finals2000A-Zeilen); MODELLED sind die Größenordnungen der Kovarianz der Bahnbestimmung des Mondrelais und die Untergrenze der Bezugssystemrealisierung (repräsentative Zuweisungen) sowie der Persistenz-Prädiktor (nicht der operative Bulletin-A-Algorithmus des IERS). Kein zertifiziertes Echtzeit-Bezugssystemprodukt.

# text
seg-4e31c8daf798 = Register

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/gnss-measurements-positioning-and-integrity.md
seg-c9cf40c5e609 = Quelle: <c1/>

# text
# c1: kshana scenarios/integrity-raim.toml
seg-33a602147cc2 = Themenseiten: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Einen ausführen: <c1/>. Alle Familien: <a5>KINDS.md</a5>.

# text
seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

# text
seg-6698e12e148b = Einzelpunkt-Positionierung aus realen Beobachtungen: die Position eines Empfängers aus einer RINEX-{ "3" }-Beobachtungsdatei und einer Broadcast-Navigationsdatei lösen (Code-Pseudoentfernungen, Broadcast-Ephemeride, Klobuchar-Ionosphäre, Saastamo

# text
seg-da89c260b1a3 = Veröffentlichte ARAIM-Zertifizierungs-Referenzvektoren: die horizontalen und vertikalen ARAIM-Schutzniveaus der Engine, ausgeführt gegen die EIGENEN numerischen Rechenbeispiele der WG-C ARAIM Technical Subgroup, bei der Tole

# text
seg-7a750a89c9c4 = Weltraumwetter-Umgebungsmodell: solare (F10.7/F10.7a) und geomagnetische (Kp, mit der definitorischen Kp↔ap-Tabelle) Aktivitätsindizes, die von ihnen getriebene exosphärische Temperatur nach Jacchia-1971 (validiert gegen veröffentlich

# text
seg-d79d4d58275b = Echtzeit-Budget der Vorhersage von Mondbezugssystem / Erdorientierung: P4-Tabelle { "1" } (die Konsistenzprüfung des Bezugssystemfehlers — nachverarbeitet ~{ "0.27" } m ↔ ~{ "0.010" } ms und Echtzeit ~{ "15" } m ↔ ~{ "0.5" } ms, jede Bezugssystemposition ausgedr

# text
# c1: mask_deg
# c2: sigma_uere_m
# c3: p_fa
# c4: p_md
# c5: al_h_m
# c6: al_v_m
# c7: time
# c8: user|user_site
# c9: constellation
# c10: sigma_ura_m
# c11: b_nom_m
# c12: constellations
# c13: seed
# c14: araim_dual
# c15: p_hmi
# c16: skyline
seg-dc783268156c = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Optional: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-7b110aacdb27 = <b>Register:</b> MODELLED { "6" } · VALIDATED { "4" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>integrity</a1>.

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: iono
# c6: tropo
# c7: mask_deg
# c8: noise_sigma_m
# c9: multipath_m
# c10: sat_clock_rms_m
# c11: uere_m
# c12: p_fa
# c13: p_md
# c14: alert_limit_h_m
# c15: alert_limit_v_m
# c16: skyline
seg-d444fb35cae9 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>. Optional: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-b651ec58bcba = <b>Register:</b> VALIDATED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>gnss-sim</a1>.

# text
# c1: obs_rinex
# c2: nav_rinex
# c3: truth_ecef
# c4: apriori_ecef
# c5: mask_deg
# c6: dual_frequency
seg-b9a21187317d = Erforderliche Felder: <c1/>, <c2/>. Optional: <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-143dc4fd1d44 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>pvt</a1>.

# text
# c1: vector
seg-9ca1f6783e8e = Erforderliche Felder: keine. Optional: <c1/>.

# text
seg-415f1fa78518 = <b>Register:</b> VALIDATED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>araim-reference-check</a1>.

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6c4655b35c65 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-1e5052c0bce7 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>space-weather</a1>.

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
seg-64c512530ee6 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-1c244958d3c4 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>realtime-frame-eop</a1>.

# text
seg-d4adf4283480 = <s1>Zurück</s1>Konstellationen, Abdeckung und Geometrie

# text
seg-2cdfd7f8bfb3 = <s1>Weiter</s1>GPS-verweigerte alternative PNT

# attr:alt
seg-2721ed7727bb = Das Diagramm, das die Engine für scenarios/realtime-frame-eop.toml schreibt, Szenarioart realtime-frame-eop

# text
seg-569fac649b5d = GNSS-Messungen, Positionierung und Integrität (Szenarioarten-Familie)

# text
seg-63c3a7483268 = { "6" } Szenarioarten der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# attr:alt
seg-9c60c8803b6b = Kontaktbogen der Diagramme, die die Engine für die Szenarioarten der Familie GNSS-Messungen, Positionierung und Integrität schreibt

# attr:alt
seg-c1c6f2f73fb5 = Das Diagramm, das die Engine für scenarios/space-weather.toml schreibt, Art space-weather

# attr:alt
seg-ce7f6130ddee = Das Diagramm, das die Engine für scenarios/integrity-raim.toml schreibt, Art integrity

# attr:alt
seg-d76d59644d84 = Das Diagramm, das die Engine für scenarios/pvt-abmf.toml schreibt, Art pvt
