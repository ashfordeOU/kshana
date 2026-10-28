# docs--kind-lunar-attack-surface: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
# c1: docs/kinds/by-kind/lunar-attack-surface.md
seg-c14d2343d802 = Quelle: <c1/>

# text
# c1: lunar-attack-surface
seg-9c0b5e933472 = <c1/> (Szenarioart)

# text
# c1: scenarios/lunar-attack-surface.toml
seg-e5edd5b9ef27 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-attack-surface | AFS -140.6 dBW, Überschuss { "14.4" } dB (Band -17.9–-12.0, { "25" }×/28× Überschuss) | Spoof@{ "1000" } m { "0.000" } W | Fußabdruck { "3" }% Kappe, Rand falsch | Spoof-Erfassung wahr (Lock { "0.00" } s) | Mastreichweite { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% von { "50" } bit/s), { "30" } s Latenz | Fußabdruck-Sweep 7x5 (Höhe 20-500 km x HPBW 1.83-29.20 deg), Erfassung 0.6-42.9% | Rand auf diesem Raster NICHT erreicht (bester -0.8 dB, { "3.8" } dB zu wenig; benötigt { "19.8" } dBW gegenüber { "16.0" } dBW)

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-781a7094b955 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

# text
# c1: scenarios/lunar-attack-surface.toml
seg-87e0c97de011 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-6ea8f1132b57 = linear

# text
seg-8b701f465117 = logarithmisch

# attr:alt
seg-de295af20c55 = Das Diagramm, das die Engine für scenarios/lunar-attack-surface.toml schreibt, Art lunar-attack-surface

# text
seg-c853e3e832c0 = <b>MODELLED</b> Zweiachsiger Sweep des diagrammgewichteten, höhenbegrenzten Erfassungsfußabdrucks auf der Oberfläche über Senderhöhe und Schüsseldurchmesser, ausgegeben als eine Zeile je Betriebspunkt. Referenz (InternalConsistency): Mengeninklusion: Das Verhältnis von Störer zu Signal geht als gleichmäßiger Dezibel-Versatz ein, daher enthält die erfasste Menge bei höherer Sendeleistung die Menge bei niedrigerer, und der Anteil kann nur steigen -- eine Eigenschaft, die das Airy-Diagramm in Strahlbreite oder Höhe NICHT liefert, wo das erfasste Gebiet in Ringe zerfällt und der Anteil tatsächlich nicht monoton ist. Keine veröffentlichte Tabelle gibt den erfassten Scheibenanteil eines lunaren Orbitalsenders an

# text
# c1: kshana kinds --json
seg-d11486381332 = MODELLED: die repräsentativen Geometrie- und Leistungsgrößen und die konkreten Zellenwerte der Erfassungskarte. (Katalog der Arten (<c1/>))

# text
seg-95be70748647 = Der Erfassungsfußabdruck über Höhe und Strahlbreite ist MODELLED, nicht validiert: Er wird gegen seine eigene geschlossene bzw. analytische Identität geprüft – das findet Übertragungs- und Koeffizientenfehler, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-1a1799e01ac4 = <s1>Zurück</s1>link-budget

# text
seg-4b0efe4b9b85 = <s1>Weiter</s1>lunar-beacon

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisches J/S-Link-Budget, Anti-Jam-C/N₀, Lock-Verlust je Satellit. Unabhängige Referenz (InternalConsistency): Anti-Jam-C/N₀-Link-Budget-Gleichung, gegen eine unabhängige numpy-Neuherleitung gegengeprüft (teilt dieselbe geschlossene Form → InternalConsistency), plus eine Charakterisierung der C/N₀-Verschlechterung mit realen JammerTest-2024-Daten. { "0.30" } Runde { "2" }, blockiert (bleibt MODELLED): der gemessene C/N0-Abfall von JammerTest { "2024" } gegen eine Link-Budget-Vorhersage (vorab registriert 6a66994b, innerhalb von { "3" } dB) wurde nicht ausgeführt, weil die Antennenposition und -ausrichtung F8.1 bei

# text
seg-143f3f1cc521 = Jamming-Resilienz bei GNSS-Ausfall ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
seg-004c56ded47f = Angriffsfläche der Signalsicherheit für die Oberflächennavigation auf dem Mond (P1): fasst die offenen Signalsicherheitsanalysen zu einem über die Binärdatei erreichbaren Lauf zusammen. Berichtet ({ "1" }) die empfangene AFS-Leistung und ihren Leistungs-ÜBERSCHUSS gegenüber einer terrestrischen GPS-Referenz, dazu das Empfindlichkeitsband von 12-18 dB als echten mehrachsigen Sweep über die Streckeneingaben (Referenzpegel x EIRP x Schrägentfernung) mit dem Abgleich der linearen Faktoren 25x gerundet / 28x ungerundet. ÜBERARBEITET (Regel R4): Dieser Bericht wies ein Leistungs-DEFIZIT von { "15.6" } dB und einen Faktor von 32x/36x aus, bis die GPS-Referenz von -125 / -128.5 (das sind die dBm-Werte) auf -155 / -158.5 dBW korrigiert wurde, die Werte aus ICD-GPS-200, die das Jamming-Modul schon immer geführt hat. Das Vorzeichen kehrt sich um: Das modellierte AFS-Signal des Mondes ist { "14.4" } dB STÄRKER als terrestrisches GPS L1 C/A, nicht schwächer. Die empfangene Leistung selbst hat sich um kein Bit bewegt, und der lineare Faktor ist der alte, geteilt durch genau { "1000" }, und das ist genau der Versatz von { "30" } dB zwischen dBm und dBW; ({ "2" }) die erforderliche Sendeleistung des Angreifers zum Spoofen (J/S = { "3" } dB) und zum Verweigern (J/S = { "30" } dB) bei jedem Abstand, die Umkehrung der J/S-Strecke; ({ "3" }) der orbitale Erfassungsfußabdruck unter einem realen Antennendiagramm einer gleichförmigen Apertur (Airy [{ "2" } J1(x)/x]^{ "2" }), eine höhenbegrenzte, subhemisphärische Kappe, deren Rand NICHT erfasst wird; ({ "4" }) ein berechnetes Ergebnis des Spoof-Capture-Pull-in der Tracking-Schleife (zieht ein Spoofer mit passendem Code bei gegebenem Leistungsvorteil und Codeversatz die DLL/PLL tatsächlich mit) statt der behaupteten Schwelle von { "3" } dB; ({ "5" }) die geometrische Horizontreichweite eines erhöhten Oberflächensenders auf einem Körper ohne Atmosphäre; und ({ "6" }) das Authentifizierungsbudget von OSNMA/TESLA ({ "20" } bit/s Overhead = ~{ "40" } % einer AFS-Navigationsnachricht mit { "50" } bit/s, Latenz der Schlüsselfreigabe, { "2" }^-40 Fälschung). Ein leerer Rumpf reproduziert die P1-Basislinie; jede Eingabe hat einen Standardwert und ist überschreibbar. Teilergebnisse der Stufe VALIDATED tragen die unabhängige Referenz ihres Quellmoduls (geschlossene dB-Radiometrie; J/S-Umkehr im Rundlauf; Airy-Diagramm gegen A&S-Bessel und Kugelkappengeometrie; DLL/PLL-Pull-in gegen Kaplan & Hegarty; Identität des sphärischen Tangentenhorizonts gegen eo_payload; Feldgrößen nach OSNMA SIS-ICD). MODELLED: die repräsentativen Geometrie- und Leistungsgrößen und die konkreten Werte der Zellen der Capture-Map. Kein zertifiziertes Sicherheitsprodukt.

seg-ca1c7e92b98e = <s1>Zurück</s1>lunar-ascent
