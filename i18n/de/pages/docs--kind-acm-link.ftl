# docs--kind-acm-link: translations (de)

# text
# c1: docs/kinds/by-kind/acm-link.md
seg-a686bcdc6cc9 = Quelle: <c1/>

# text
# c1: acm-link
seg-a53e57719a74 = <c1/> (Szenarioart)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-cb9447893c7f = Ein Satellit über einer Station: Schrägentfernung, Elevation und Es/N0 jedes Überflugs entlang des Überflugs, der bei jedem Schritt gewählte DVB-S2-MODCOD (Schwellen nach ETSI EN { "302" } 307-1 Tabelle { "13" } plus eine Implementierungsmarge) und das Datenvolumen, das ACM gegenüber der Basislinie mit konstanter Kodierung bewegt, die an der Maske schließt. MODELLED.

# text
# c1: scenarios/acm-link.toml
seg-1ab30ff9616a = Ein Lauf von <c1/> fasst sich so zusammen: acm-link: { "3" } pass(es); ACM { "92866" } Mbit vs CCM 8PSK 3/4 { "58495" } Mbit -> gain x1.59 (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-54e2159e532d = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/acm-link.toml
seg-c7d1b4b1f247 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-b77b8420b4f5 = Mbit

# text
seg-37d29d8303fe = km

# text
seg-eeaa777e4301 = 8PSK 3/4

# text
seg-d62795b9fdc0 = Ergebnisbezeichnung (die der Engine): MODELLED — adaptive Kodierung und Modulation nach DVB-S2 über die Überflüge eines Satelliten an einer Station: Es/N0 bei klarem Himmel entlang jedes scheinbaren Überflugs, der effizienteste MODCOD, der seine Schwelle nach ETSI EN { "302" } 307-1 Tabelle { "13" } plus eine Marge erfüllt, gegenüber dem MODCOD mit konstanter Kodierung, der an der Maske schließt; kein Regen

# attr:alt
seg-046f69293874 = Das Diagramm, das die Engine für scenarios/acm-link.toml schreibt, Art acm-link

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Downlink-Es/N0 entlang jedes Überflugs eines Satelliten über einer Station (EIRP, Freiraumdämpfung, atmosphärische Dämpfung nach dem Kosekansgesetz, übrige Verluste, G/T, Boltzmann-Konstante, Symbolrate), der effizienteste DVB-S2-MODCOD, der seine ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> Sichtbarkeitsüberflüge (AOS, TCA, LOS, maximale scheinbare Elevation, Dauer) eines SGP4-Elementsatzes über einer WGS-84-Station auf dem validierten Erdbahnpfad (IAU { "2006" }. Unabhängige Referenz (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) mit Hipparchus { "4.0.3" }: TLEPropagator auf denselben Elementsätzen in einem TEME, das Orekit nach der angegebenen Definition baut (sein IERS-{ "2010" }-TOD, gedreht um GAST - GMST), ElevationDetector und ElevationExtremumDetector mit und ohne ITURP834AtmosphericRefraction sowie AngularAzEl mit AngularRadioRefractionModifier für den Lichtlaufzeitfall, Durchgänge und Maximum von Hipparchus gelöst; { "60" } Fälle (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Downlink-Es/N0 entlang jedes Überflugs eines Satelliten über einer Station (EIRP, Freiraumdämpfung, atmosphärische Dämpfung nach dem Kosekansgesetz, übrige Verluste, G/T, Boltzmann-Konstante,. Unabhängige Referenz (InternalConsistency): Interne Konsistenz: Die in geschlossener Form aus Tabelle 5a K_bch und den Rahmenlängen berechnete spektrale Effizienz stimmt mit den Effizienzen überein, die Tabelle { "13" } ausgibt (eine Transkriptionsprüfung der Schwellentabelle); die Teile des Link-Budgets stimmen mit ihren geschlossenen Formen überein; die Auswahl ist monoton in Es/N0 und hält die Marge ein; ACM bewegt mindestens das Volumen mit konstanter Kodierung. Die Überflugsgeometrie stammt aus dem separat VALIDATED a

# text
# c1: label
seg-02e9f2e87410 = MODELLED — adaptive Kodierung und Modulation nach DVB-S2 über die Überflüge eines Satelliten an einer Station: Es/N0 bei klarem Himmel entlang jedes scheinbaren Überflugs, der effizienteste MODCOD, der seine Schwelle nach ETSI EN { "302" } 307-1 Tabelle { "13" } plus eine Marge erfüllt, gegenüber dem MODCOD mit konstanter Kodierung, der an der Maske schließt; kein Regenschwund und kein Zeigeverlust entlang des Überflugs (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (Artenkatalog (<c1/>))

# text
seg-7f8667e8d8fe = Adaptive Kodierung und Modulation nach DVB-S2 entlang eines LEO-Downlink-Überflugs ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-72fd0321e4af = Themenseite: <a1>CONTACT-SCHEDULING.md</a1>

# text
seg-1f67ae89028b = <s1>Weiter</s1>aocs

# text
seg-a2cdc7dff1e3 = Jede Zahl unten ist ILLUSTRATIV: weder Bahn, Station noch Link-Budget eines Betreibers. MODELLED. (Kommentar der Szenariodatei, Zeile { "8" })
