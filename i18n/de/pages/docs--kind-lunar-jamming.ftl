# docs--kind-lunar-jamming: translations (de)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Nicht bereitgestellt — Kshana modelliert Signalleistung, keine Nutzlast- oder Antennenhardware. Unabhängige Referenz (NoneKind): keine: eine Disziplin im Besitz des Partners, absichtlich ohne Modul und ohne Test

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
seg-f85a85f0c7e4 = MHz

# text
seg-7154243aabbe = broadband

# text
seg-cec5c06d38af = <b>MODELLED</b> Mondeigenes Störer-zu-Signal-Verhältnis, effektives C/N₀ und Verlust der Aufschaltung für einen selenographischen Oberflächennutzer unter einem Störer an der Mondoberfläche (oder erhöht) über der illustrativen Moonlight/LCNS-artigen Konstellation aus öffentlichen Quellen.

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> Der Bericht von <c1/> stützt seine Verweigerungskontur nicht mehr auf einen einzigen Skalar.

# text
# c1: docs/kinds/by-kind/lunar-jamming.md
seg-bcb02ffed4d0 = Quelle: <c1/>

# text
# c1: lunar-jamming
seg-612388918e36 = <c1/> (Szenario-Kind)

# text
# c1: jamming
seg-a91a9ad5d8d1 = Mondeigenes HF-Jamming: Störer-zu-Signal-Verhältnis je Satellit, effektives C/N₀ und Verlust der Aufschaltung für einen selenographischen Oberflächennutzer unter einem Störer an der Mondoberfläche (oder erhöht), über der illustrativen Konstellation im Mondorbit der Klasse Moonlight/LCNS aus öffentlichen Quellen. Setzt die vorhandene offene Jamming-Physik zusammen (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) mit der vorhandenen lunaren Himmelsgeometrie (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); weder Geometrie noch Radiometrie werden neu abgeleitet. Anders als beim Erd-Kind <c1/> ist der Signalzweig NICHT eine feste Empfangsleistung: Die isotrope Empfangsleistung jedes Satelliten ist sein eigenes Link-Budget EIRP − FSPL(Schrägentfernung), sodass das J/S von Satellit zu Satellit mit lunarer Entfernung und Elevation variiert. Gibt EINE ZEILE JE SICHTBAREM (Epoche, Satellit) LINK aus — Azimut, Elevation, Schrägentfernung, beide Empfangsleistungen, deren Differenz das J/S ist, das J/S, das nominelle und das effektive C/N₀ und den Aufschaltstatus — sowie aggregierte Gütezahlen neben (nie anstelle von) dieser Tabelle und dieselbe Tabelle als CSV-Artefakt. Jedes ausgegebene numerische Feld trägt eine Einheit und eine Herkunftsklasse. VALIDATED Teilergebnisse tragen die Referenz ihres Quellmoduls (die Anti-Jam-Gleichung und das J/S-Link von Kaplan & Hegarty §{ "9.4" }, extern referenziert in tests/gnss_denied_jamming_resilience_reference.rs; die lunare Geometrie von lunar_service). Die Zusammensetzung selbst wird gegen einen unabhängigen Pfad mit zwei Link-Budgets (linkbudget::received_signal_power_dbw, ein anderer Ausdruck für die Freiraumdämpfung) bis auf { "1e-9" } dB gegengeprüft. MODELLED: die illustrative Konstellation, die repräsentative EIRP / Störerleistung / Antennengewinne / Rauschtemperatur und das Fehlen von Geländeabschattung, Mehrwegeausbreitung, AGC-Dynamik und adaptiver Nullung. Kein zertifiziertes Produkt zur Dienstverweigerung. Ist ein Störer konfiguriert, enthält der Bericht außerdem eine VERWEIGERUNGSKONTUR MIT EINEM UNSICHERHEITSBAND statt einer von einem einzigen Skalar abgelesenen Kontur: die vollständige gemessene Verteilung des C/N₀ des Nutzsignals über die Tabelle je Satellit (n, min, p05, p25, Median, p75, p95, max, Mittelwert, Stichproben-Standardabweichung und die eigene Asymmetrie der Stichprobe) und die Kontur, ausgewertet an jeder dieser Ordnungsstatistiken unter BEIDEN Verweigerungskriterien, die die Engine kennt — dem bisherigen Leistungsverhältnis (J/S = { "30" } dB, wie in attack-surface und tracking-loop) und dem Verlust der Aufschaltung (effektives C/N₀ fällt auf tracking_threshold_dbhz, das Kriterium, das die eigene Statusspalte dieses Berichts verwendet) — auf beiden Achsen der Verweigerungsebene (erforderliche Störer-EIRP beim Abstand des Szenarios, Verweigerungsabstand bei der EIRP des Szenarios). Die Bandgrenzen SIND contour(p05) und contour(p95), dieselbe Abbildung in geschlossener Form, angewandt auf die eigenen Quantile der Stichprobe: kein an die Stichprobe angepasstes Sigma und nicht Median ± k·Standardabweichung, wobei die Standardabweichung der Kontinuität halber ausgegeben und von nichts verwendet wird. Ein Quantil, das bereits an oder unter der Tracking-Schwelle liegt, hat kein endliches verweigerndes J/S, und seine Spalten zum Verlust der Aufschaltung sind null mit einem gezählten Grund, nie ein auf einen Wert begrenzter Radius.

# text
# c1: scenarios/lunar-jamming.toml
seg-6693c3ebcb07 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-jamming | { "4" } sats, { "12" } epochs, { "38" } links from (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (mean { "35.622" }) | { "0" } LOST | availability { "0.167" } of { "0.167" } nominal

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-6e01b6354e40 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/lunar-jamming.toml
seg-c61fb6515ed9 = Das Beispiel <c1/> setzt unter anderem:

# attr:alt
seg-6fe8b3c6c584 = Das Diagramm, das die Engine für scenarios/lunar-jamming.toml schreibt, Kind lunar-jamming

# text
seg-d4ae2f589112 = <b>MODELLED</b> Mondeigenes Störer-zu-Signal-Verhältnis, effektives C/N₀ und Verlust der Aufschaltung für einen selenographischen Oberflächennutzer unter einem Störer an der Mondoberfläche (oder erhöht), über der illustr. Orakel (ReferenceImpl): Gegenprüfung der Zusammensetzung gegen einen unabhängigen Codepfad im selben Repository: Jedes J/S je Link wird als Differenz zweier Link-Budgets neu abgeleitet, die mit linkbudget::received_signal_power_dbw berechnet werden, dessen Freiraumdämpfung der einzelne Ausdruck { "20" }·log10(4πRf/c) ist statt der Dreitermsumme, die jamming::free_space_path_loss_db verwendet — beide stimmen in jeder Zeile auf < { "1e-9" } dB überein (gemessener ungünstigster Fall { "7.11e-14" } dB, d. h. Gleitkomma-Rundungsfehler)

# text
# c1: lunar-jamming
seg-dbe54e7cc800 = <b>MODELLED</b> Der Bericht von <c1/> stützt seine Verweigerungskontur nicht mehr auf einen einzigen Skalar. Er gibt die vollständige gemessene Verteilung des C/N₀ des Nutzsignals über die Tabelle je Satellit aus. Orakel (InternalConsistency): Interne Konsistenz gegen die eigenen Vorwärtsfunktionen der Engine, mehr kann diese Fähigkeit ehrlicherweise nicht beanspruchen. Jeder Konturpunkt ist eine Inversion in geschlossener Form, und jede Inversion wird geprüft, indem ihre Antwort durch die VORWÄRTSFUNKTION zurückgeführt wird, mit der die eigenen Zeilen des Berichts bewertet wurden: die J/S-Spalte durch jamming::effective_cn0_dbhz (das tracking_threshold_dbhz auf < { "1e-9" } dB-Hz zurückgeben muss), die Abstandsspalte

# text
# c1: kshana kinds --json
seg-d48926e62856 = MODELLED: die illustrative Konstellation, die repräsentative EIRP / Störerleistung / Antennengewinne / Rauschtemperatur und das Fehlen von Geländeabschattung, Mehrwegeausbreitung, AGC-Dynamik und adaptiver Nullung. (Kind-Katalog (<c1/>))

# text
seg-c455dbcb9f8c = MODELLED. Die Konstellation ist die illustrative Geometrie der Klasse Moonlight/LCNS aus öffentlichen Quellen (nicht die reale Ephemeride; keine Verbindung oder Billigung impliziert), und das Störungsmodell ist ein Link-Budget: keine Geländeabschattung des Störers (ein Effekt erster Ordnung im Gelände am Südpol), keine Mehrwegeausbreitung, keine AGC-Nah-Fern-Dynamik, keine adaptive Nullung, keine Hysterese zwischen Akquisition und Tracking. (Kommentar in der Szenariodatei, Zeilen { "26" } bis { "30" })

# text
seg-da57cc7f1aa4 = Das lunare HF-Jamming bei der Oberflächennavigation (J/S je Satellit) ist MODELLED, nicht validiert: Es wird gegen eine getrennte Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-dba1589d3c1e = Die lunare Verweigerungskontur mit einem Unsicherheitsband aus der gemessenen Streuung des C/N₀ ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-a2889fb2b42a = Themenseite: <a1>integrations.md</a1>

# text
seg-03b50b21e5a8 = <s1>Zurück</s1>lunar-interop-export

# text
seg-02568469f628 = <s1>Weiter</s1>lunar-joint-od-clock
