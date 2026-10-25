# docs--kinds-mission-analysis-links-and-space-operations: translations (de)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Typ

# text
seg-953188c11165 = Einwegstreckenbilanz nach der CCSDS-{ "401" }- bzw. DSN-810-005-Streckengleichung: Freiraumdämpfung, C/N₀, Eb/N₀, Marge und Schließung für eine Sende-EIRP, ein Empfangs-G/T, eine Entfernung, eine Datenrate und ein Band (s|x|ka) gegen ein gefordertes Eb/N₀. Eine deterministische technische Berechnung aus den gelieferten Eingaben (kein kalibriertes Datenblatt eines Terminals).

# attr:alt
seg-bd375631bc7e = Das Diagramm, das die Engine für scenarios/link-budget.toml schreibt, Art link-budget

# text
seg-039f77066d97 = Allen-Eggers-Korridor für den ballistischen Wiedereintritt: Spitzenverzögerung (unabhängig vom ballistischen Koeffizienten, V_e^{ "2" } sin|γ|/(2eH)), Geschwindigkeit und Höhe bei der Spitzenverzögerung (peak-g) sowie die Geschwindigkeit bei maximaler Erwärmung, für eine Eintrittsgeschwindigkeit, einen Bahnneigungswinkel und einen ballistischen Koeffizienten durch eine exponentielle Atmosphäre, dazu eine ebene Punktmassenintegration desselben ballistischen Eintritts mit Gravitation, Erdkrümmung und der US-Standardatmosphäre { "1976" } (Spitzenverzögerung, Geschwindigkeit, Höhe und Zeit an der Spitze). MODELLED ist der ballistische Eintritt (ohne Auftrieb); die Erwärmungsausgabe ist die Geschwindigkeit bei maximaler Erwärmung, kein Wärmestrom (kein aerothermisches Modell und kein TPS-Modell).

# attr:alt
seg-b0109481e8ff = Das Diagramm, das die Engine für scenarios/reentry.toml schreibt, Typ reentry

# text
seg-de2448d74c2b = Framing nach CCSDS 133.0-B Space Packet Protocol: einen synthetischen TM/TC-Paketstrom kodieren (Primärheader mit 6 Oktetten + Datenfeld) und die Dekodierung des Headers je Paket, die Gesamtzahl der Oktette und einen exakten Rundlauf aus Kodierung und Dekodierung ausgeben. Deterministisches Framing mit exaktem Bitlayout — die Interoperabilitätsschicht für Paketformate der Agenturen; KEINE Konformitätszertifizierung (keine Logik für Sekundärheader, CRC oder Segmentierung über die Flags hinaus).

# attr:alt
seg-af1cf9aa9938 = Das Diagramm, das die Engine für scenarios/space-packet.toml schreibt, Typ space-packet

# text
seg-cb9447893c7f = Ein Satellit über einer Station: Schrägentfernung, Elevation und Es/N0 jedes Überflugs entlang des Überflugs, der bei jedem Schritt gewählte DVB-S2-MODCOD (Schwellen nach ETSI EN { "302" } 307-1 Tabelle { "13" } plus eine Implementierungsmarge) und das Datenvolumen, das ACM gegenüber der Basislinie mit konstanter Kodierung bewegt, die an der Maske schließt. MODELLED.

# attr:alt
seg-046f69293874 = Das Diagramm, das die Engine für scenarios/acm-link.toml schreibt, Art acm-link

# text
seg-7eff466eb018 = Lageregelung von Raumfahrzeugen: ein Schwenk zur inertialen Ausrichtung eines starren Körpers mit drei oder mehr ausgewuchteten Reaktionsrädern unter MRP-Rückführung (L = -K sigma - P omega), Radmomente mit minimaler Norm, begrenzt auf die Grenze jedes Motors, RK4 mit Halteglied nullter Ordnung; optional geschlossen auf einem multiplikativen EKF aus einem simulierten Gyro (Winkel- und Raten-Random-Walk) und Sternsensor. Es meldet Einschwingzeit, End- und Spitzenzeigefehler, Spitzenraddrehzahl und -moment, den Sättigungsanteil, die Drehimpulsdrift und, mit dem Schätzer, dessen Lagefehler und NEES. Die Schleife des wahren Zustands ist gegen Basilisk { "2.9.1" } VALIDATED; der Schätzer ist MODELLED.

# attr:alt
seg-08c624d5324d = Das Diagramm, das die Engine für scenarios/aocs-slew.toml schreibt, Art aocs

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Aperture-Duty-Cycle: die Aufteilung der Zeit zwischen Navigation und Kommunikation, die ein Kontaktplan für einen Pool lenkbarer Aperturen impliziert. Nimmt einen Kontaktplan (eine Liste von Fenstern <c1/> aos_s/los_s, die jeweils Navigation oder Kommunikation anfordern — dasselbe aos_s/los_s-Vokabular, das der Prädiktor <c2/> ausgibt), eine Aperturanzahl und eine ARBITRIERUNGSREGEL (standardmäßig Navigationspriorität, oder Kommunikationspriorität, oder nicht verdrängendes First-come-first-served) und meldet die Navigationsauslastung, die Kommunikationsauslastung, die Leerlaufauslastung und den Ausfall je Sitzung — die Kontaktzeit, die eine Sitzung angefordert hat und die keine Apertur bedient hat. Ein exakter Intervall-Sweep über die Fenstergrenzen, sodass sich berührende Fenster nie konkurrieren und keine Aperturssekunde doppelt gezählt wird; Navigations-, Kommunikations- und Leerlauf-Aperturssekunden werden unabhängig akkumuliert und schließen gegen apertures*horizon_s. Der Bericht nennt die aufgelöste Regel, ihre vollständige Definition und die Definitionen von Auslastung und Ausfall, weil eine Auslastungszahl ohne ihre Arbitrierungsregel nicht reproduzierbar ist. MODELLED Planungsarithmetik: Es wird keine Schwenk-, Umstimm- oder Wechselzeit berechnet, wenn eine Apertur Dienst oder Sitzung wechselt, und weder Datenvolumen, Pufferzustand, Energiebudget noch Linkschluss gehen in die Entscheidung ein, und die Kontaktfenster sind Eingaben — ihre Geometrie ist, was sie erzeugt hat. Kein Planungsprodukt für das Bodensegment.

# attr:alt
seg-a8b38ed8e029 = Das Diagramm, das die Engine für scenarios/aperture-duty-cycle.toml schreibt, Art aperture-duty-cycle

# text
seg-34d041d6bd9f = Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" } (senkrechter Anstieg, Nickimpuls, Schub entlang der Geschwindigkeit), wobei die Gravitations-, Luftwiderstands-, Lenk- und Gegendruckverluste integriert werden und das ideale dv minus Verluste gegen die Brennschlussgeschwindigkeit geprüft wird; max-Q, Spitzenbeschleunigung und Brennschlusszustand. MODELLED.

# attr:alt
seg-ccf2185b0b5e = Das Diagramm, das die Engine für scenarios/ascent-losses.toml schreibt, Art ascent-losses

# text
seg-62c0dda9fc56 = 3-DOF-Lage- und Zeigefehlerbudget: das Störmoment des Schwerkraftgradienten im ungünstigsten Fall ((3/2)(μ/R³)ΔI) und ein Wurzel-aus-Summe-der-Quadrate-Zeigefehlerbudget über benannte 1σ-Beiträge (Sensorrauschen, Reaktionsrad-Jitter, thermisch, Ausrichtung) mit dem dominanten Term, für eine Bahnhöhe und eine Streuung der Körperträgheit. MODELLED skalares AOCS-Budget — eine Ergänzung vor der Hardware zu Basilisk/42, keine Simulation von Regelkreis, 6 Freiheitsgraden oder flexiblen Moden.

# attr:alt
seg-ad0e72e3b688 = Das Diagramm, das die Engine für scenarios/attitude-budget.toml schreibt, Art attitude-budget

# text
seg-be4e928a5865 = Bodenkontaktplanung für mehrere Satelliten über mehreren Stationen: scheinbare Zugriffsfenster (SGP4, erdfestes Bezugssystem IAU 2006/2000A, Refraktion nach ITU-R P.834, Lichtlaufzeit), das DVB-S2-ACM-Datenvolumen jedes Überflugs (Schwellen nach ETSI EN { "302" } 307-1 Tabelle { "13" }) und ein konfliktfreier Zeitplan (ein Satellit je Antenne mit einer Wendezeit, eine Station je Satellit, prioritätsgewichtete Lieferung, begrenzt auf jeden Rückstand) durch einen Greedy-Algorithmus nach Grenznutzen, eine Basislinie nach dem Prinzip „wer zuerst kommt“ und ein exaktes Branch-and-Bound bei kleinen Mengen, mit der Optimalitätslücke des Greedy-Algorithmus. MODELLED.

# attr:alt
seg-e26b549579e2 = Das Diagramm, das die Engine für scenarios/contact-schedule.toml schreibt, Art contact-schedule

# text
seg-b843e2e0a4ee = Atmosphärischer Eintritt einer Punktmasse mit 3 Freiheitsgraden über einer rotierenden kugelförmigen Erde oder einem Mars (ballistisch oder auftriebserzeugend bei konstanter Querneigung), RK4, durch US76, eine exponentielle oder die Mars-Atmosphäre, mit konvektiver Staupunktaufheizung nach Sutton-Graves (NASA TR R-376): Spitzenverzögerung, Wärmestrom und dynamischer Druck, Wärmelast, Reichweite, eine Energieprüfung im rotierenden Bezugssystem und die geschlossene Form nach Allen-Eggers daneben. Die Spitzenverzögerung wird gegen das veröffentlichte Stardust-Nominal geprüft; die Aufheizung ist MODELLED.

# attr:alt
seg-dbb618cd6357 = Das Diagramm, das die Engine für scenarios/entry-heating-stardust.toml schreibt, Art entry-heating

# text
seg-47b4aea6ed01 = Fußabdruck der Erdbeobachtungsnutzlast und Abdeckungsgeometrie (SMAD-Raumdreieck): Erdwinkelradius, Streifenbreite, Bodenauflösung im Nadir, maximaler Off-Nadir-Zugriff, Kreisbahnperiode, J2-Knotenperiode und Bodenspurabstand am Äquator mit einem Flag für lückenlose Abdeckung, für eine Bahnhöhe, Inklination (standardmäßig sonnensynchron) und Sensor-FOV/IFOV. MODELLED Geometrie der kugelförmigen Erde (keine Radiometrie/MTF/Atmosphäre/Jitter/Glint); Knotenabstand R_e·(ω − Ω̇)·T_nodal mit säkularen J2-Raten erster Ordnung.

# attr:alt
seg-c2a8332f2ee2 = Das Diagramm, das die Engine für scenarios/eo-coverage.toml schreibt, Art eo-coverage

# text
seg-816bd5a5808a = Radiometrie und Bildqualität eines Nadir-Imagers: Strahldichte einer Lambert-Szene an der Apertur, die Kameragleichung, Signal und Schrot-/Dunkel-/Auslese-/Quantisierungsrauschen und SNR; die System-MTF bei Nyquist (Beugung x Detektor x Verschmierung x Jitter), die daraus folgende relative Kantenantwort, Q = lambda F/p und die NIIRS nach GIQE Version { "4" } ohne MTF-Kompensation. MODELLED.

# attr:alt
seg-bf7b52f7a01e = Das Diagramm, das die Engine für scenarios/eo-radiometry.toml schreibt, Art eo-radiometry

# text
seg-7a4e6215a488 = Zweikörper-Start- und Aufstiegsgeometrie: Startazimut(e) (sin Az = cos i / cos lat), minimal erreichbare Inklination, Kreisbahngeschwindigkeit, der ostwärtige Bonus der Erdrotation, Dogleg-Ebenenwechsel-Δv, wenn die Zielinklination unter der Breite des Startplatzes liegt, und die Zahl der täglichen Startgelegenheiten. MODELLED Geometrie der kugelförmigen Erde (keine Korrektur durch das Geschwindigkeitsdreieck der rotierenden Erde, kein Modell der Aufstiegs-/Widerstandsverluste).

# attr:alt
seg-9696283a95ae = Das Diagramm, das die Engine für scenarios/launch-window.toml schreibt, Kind launch-window

# text
seg-dbffff25b57f = CCSDS-OEM-Interoperabilitätsbrücke: Importiert eine Orbit Ephemeris Message, die von einem externen Flugdynamik-Werkzeug erzeugt wurde (GMAT/Orekit/STK geben alle OEM aus), und gibt ihre Segmente/Objekte/Bezugssysteme/Epochenspanne sowie eine Geschwindigkeits-Konsistenzprüfung aus; ohne Eingabe führt sie eine erzeugte Referenzbahn im Rundlauf und gibt die Import↔Export-Treue aus. MODELLED strukturelle/physikalische Einlesprüfung, KEINE Bahngenauigkeits-Validierung der Quelle.

# attr:alt
seg-5db5a7c812ca = Das Diagramm, das die Engine für scenarios/oem-interop.toml schreibt, Kind oem-interop

# text
seg-4e31c8daf798 = Register

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
# c1: docs/kinds/mission-analysis-links-and-space-operations.md
seg-69ee217ed8e0 = Quelle: <c1/>

# text
seg-f5091cbeecbf = Missionsanalyse, Funkstrecken und Raumfahrtbetrieb (Familie von Szenariotypen)

# text
seg-d0eea6d9d1ad = { "14" } Szenariotypen der Engine v{ $version }. Hinweis (beratend): Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit menschlichen Lebens. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt Evidence der README).

# text
# c1: kshana scenarios/launch-window.toml
seg-6481dabc9458 = Themenseiten: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Einen davon ausführen: <c1/>. Alle Familien: <a4>KINDS.md</a4>.

# attr:alt
seg-d6c5a581ffaf = Übersichtsblatt der Diagramme, die die Engine für die Typen der Familie Missionsanalyse, Funkstrecken und Raumfahrtbetrieb schreibt

# text
seg-8d65a4a1948d = Zweikörper-Geometrie von Start und Aufstieg: Startazimut(e) (sin Az = cos i / cos lat), kleinste erreichbare Inklination, Kreisbahngeschwindigkeit, der Ostbonus aus der Erdrotation, Δv des Dogleg-Ebenenwechsels, wenn das Ziel

# text
seg-dd47e755d262 = Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden, kugelförmigen Erde durch die US-Standardatmosphäre { "1976" } (senkrechter Anstieg, Nickimpuls, Schub entlang der Geschwindigkeit), mit Integration der Grav

# text
seg-cc88f37328a3 = Allen-Eggers-Korridor für ballistischen Wiedereintritt: maximale Verzögerung (unabhängig vom ballistischen Koeffizienten, V_e^{ "2" } sin/γ//(2eH)), die Geschwindigkeit und die Höhe bei maximaler Verzögerung (Peak-g) sowie die Geschwindigkeit bei maximaler Erwärmung, für eine Eintrittsgeschwindigkeit

# text
seg-8ad7c34d8c25 = Atmosphärischer 3-DoF-Eintritt eines Punktmassenmodells über einer rotierenden, kugelförmigen Erde oder einem Mars (ballistisch oder mit Auftrieb bei konstanter Querneigung), RK4, durch US76, eine exponentielle oder die Mars-Atmosphäre, mit Sutton-Graves-Stagnation

# text
seg-efe896d3f43b = Geometrie von Abdeckung und Bodenspur (Footprint) einer Erdbeobachtungsnutzlast (SMAD-Raumdreieck): Erdwinkelradius, Streifenbreite, Bodenauflösung im Nadir, maximaler Off-Nadir-Zugriff, Umlaufzeit auf Kreisbahn, J2-Knoten-Peri

# text
seg-d3d9652fd8a0 = Radiometrie und Bildqualität eines Nadir-Bildgebers: Strahldichte einer Lambert-Szene an der Apertur, die Kameragleichung, Signal sowie Schrot-/Dunkel-/Auslese-/Quantisierungsrauschen und SNR; die System-MTF bei Nyquist (Beugung

# text
seg-1940d5c75a98 = 3-DOF-Lage- und Zeigefehlerbudget: das ungünstigste Störmoment durch den Schwerkraftgradienten ((3/2)(μ/R³)ΔI) und ein Zeigefehlerbudget als Wurzel aus der Quadratsumme über benannte 1σ-Beiträge (Sensorrauschen, Reaktions

# text
seg-e00d18fbb52b = Lageregelung eines Raumfahrzeugs: ein inertiales Schwenkmanöver eines starren Körpers mit drei oder mehr ausgewuchteten Reaktionsrädern unter MRP-Rückführung (L = -K sigma - P omega), Radmomente minimaler Norm, begrenzt auf jedes

# text
seg-496fa280de7b = Einweg-Funkstreckenbilanz nach der CCSDS-{ "401" }-/DSN-810-005-Streckengleichung: Freiraumdämpfung, C/N₀, Eb/N₀, Marge und Schließung für eine Sende-EIRP, ein Empfangs-G/T, eine Entfernung, eine Datenrate und ein Band (s/x/ka) gegenüber einem

# text
seg-f0aca7ea1ffa = Ein Satellit über einer Station: Schrägentfernung, Elevation und Es/N0 jedes Überflugs entlang des Überflugs, das in jedem Schritt gewählte DVB-S2-MODCOD (ETSI EN { "302" } 307-1 Tabelle { "13" } Schwellen plus eine Implementierungsmarge)

# text
seg-44c4890ba07e = Bodenkontaktplanung für mehrere Satelliten über mehreren Stationen: scheinbare Zugriffsfenster (SGP4, erdfestes Bezugssystem IAU 2006/2000A, Refraktion nach ITU-R P.834, Lichtlaufzeit), das DVB-S2-ACM-Datenvolumen o

# text
seg-19ab136e9f9b = Aperturauslastung: die Aufteilung der Zeit zwischen Navigation und Kommunikation, die ein Kontaktplan für einen Pool steuerbarer Aperturen mit sich bringt.

# text
seg-ee0c649ca8b2 = CCSDS-133.0-B-Framing des Space Packet Protocol: einen synthetischen TM/TC-Paketstrom kodieren (6-Oktett-Primärkopf + Datenfeld) und die Kopfdekodierung je Paket, die Gesamtzahl der Oktette und eine exakte Kodier↔Dekodier-

# text
seg-e561f3a749db = CCSDS-OEM-Interoperabilitätsbrücke: eine Orbit Ephemeris Message importieren, die ein externes Flugdynamikwerkzeug erzeugt hat (GMAT/Orekit/STK geben alle OEM aus), und deren Segmente/Objekte/Bezugssysteme/Epochenspanne sowie

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-1f074d7beccc = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-8f65824c39c5 = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>launch-window</a1>.

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-2926bde689d3 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-66f6489411d0 = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>ascent-losses</a1>.

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-481ce1d98bc7 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-fff98550eb48 = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>reentry</a1>.

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-9cf8d4b6064f = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-84e1bddcbc95 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>entry-heating</a1>.

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-eab43348803e = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-9c6ce756a89a = <b>Register:</b> VALIDATED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>eo-coverage</a1>.

# text
# c1: altitude_m
# c2: focal_length_m
# c3: aperture_m
# c4: pixel_pitch_um
# c5: wavelength_um
# c6: bandwidth_um
# c7: fill_factor
# c8: smear_px
# c9: jitter_px_rms
# c10: reflectance
# c11: solar_irradiance_w_m2_um
# c12: sun_zenith_deg
# c13: atmospheric_transmittance
# c14: path_radiance_w_m2_sr_um
# c15: optics_transmittance
# c16: integration_s
# c17: quantum_efficiency
# c18: dark_current_e_s
# c19: read_noise_e
# c20: full_well_e
# c21: adc_bits
seg-cd84a7bdbe57 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-320d724ac797 = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>eo-radiometry</a1>.

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-905487bf50f1 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-14511e367361 = <b>Register:</b> VALIDATED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>attitude-budget</a1>.

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
# c6: duration_s
# c7: dt_s
# c8: sample_s
# c9: omega0_rad_s
# c10: pointing_threshold_deg
# c11: estimator
seg-540fa1932dad = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Optional: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-6d2e9b9ce87f = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>aocs</a1>.

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-3345731b5729 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-f8b896b81014 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>link-budget</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-e38e356f4b71 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-eed876ed5aab = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>acm-link</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-5fddd2460fb0 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-58d00faa1eda = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>contact-schedule</a1>.

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-5d4f6861f301 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1e06e06d4325 = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>aperture-duty-cycle</a1>.

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-9bb424e01c84 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-688071019c9e = <b>Register:</b> VALIDATED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>space-packet</a1>.

# text
# c1: oem_text
seg-03c06f9fdc85 = Pflichtfelder: keine. Optional: <c1/>.

# text
seg-568c484ce9a0 = <b>Register:</b> VALIDATED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>oem-interop</a1>.

# text
seg-41996765fcf1 = <s1>Zurück</s1>Mond und cislunarer Raum

# text
seg-1951c46fe429 = <s1>Weiter</s1>Optische PNT
