# docs--kind-contact-schedule: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Downlink-Es/N0 entlang jedes Überflugs eines Satelliten über einer Station (EIRP, Freiraumdämpfung, atmosphärische Dämpfung nach dem Kosekansgesetz, übrige Verluste, G/T, Boltzmann-Konstante, Symbolrate), der effizienteste DVB-S2-MODCOD, der seine ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> Sichtbarkeitsüberflüge (AOS, TCA, LOS, maximale scheinbare Elevation, Dauer) eines SGP4-Elementsatzes über einer WGS-84-Station auf dem validierten Erdbahnpfad (IAU { "2006" }. Unabhängige Referenz (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) mit Hipparchus { "4.0.3" }: TLEPropagator auf denselben Elementsätzen in einem TEME, das Orekit nach der angegebenen Definition baut (sein IERS-{ "2010" }-TOD, gedreht um GAST - GMST), ElevationDetector und ElevationExtremumDetector mit und ohne ITURP834AtmosphericRefraction sowie AngularAzEl mit AngularRadioRefractionModifier für den Lichtlaufzeitfall, Durchgänge und Maximum von Hipparchus gelöst; { "60" } Fälle (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Downlink-Es/N0 entlang jedes Überflugs eines Satelliten über einer Station (EIRP, Freiraumdämpfung, atmosphärische Dämpfung nach dem Kosekansgesetz, übrige Verluste, G/T, Boltzmann-Konstante,. Unabhängige Referenz (InternalConsistency): Interne Konsistenz: Die in geschlossener Form aus Tabelle 5a K_bch und den Rahmenlängen berechnete spektrale Effizienz stimmt mit den Effizienzen überein, die Tabelle { "13" } ausgibt (eine Transkriptionsprüfung der Schwellentabelle); die Teile des Link-Budgets stimmen mit ihren geschlossenen Formen überein; die Auswahl ist monoton in Es/N0 und hält die Marge ein; ACM bewegt mindestens das Volumen mit konstanter Kodierung. Die Überflugsgeometrie stammt aus dem separat VALIDATED a

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
# c1: docs/kinds/by-kind/contact-schedule.md
seg-b79fcddea1d6 = Quelle: <c1/>

# text
# c1: contact-schedule
seg-040d160b3fdd = <c1/> (Szenarioart)

# text
seg-be4e928a5865 = Bodenkontaktplanung für mehrere Satelliten über mehreren Stationen: scheinbare Zugriffsfenster (SGP4, erdfestes Bezugssystem IAU 2006/2000A, Refraktion nach ITU-R P.834, Lichtlaufzeit), das DVB-S2-ACM-Datenvolumen jedes Überflugs (Schwellen nach ETSI EN { "302" } 307-1 Tabelle { "13" }) und ein konfliktfreier Zeitplan (ein Satellit je Antenne mit einer Wendezeit, eine Station je Satellit, prioritätsgewichtete Lieferung, begrenzt auf jeden Rückstand) durch einen Greedy-Algorithmus nach Grenznutzen, eine Basislinie nach dem Prinzip „wer zuerst kommt“ und ein exaktes Branch-and-Bound bei kleinen Mengen, mit der Optimalitätslücke des Greedy-Algorithmus. MODELLED.

# text
# c1: scenarios/contact-schedule.toml
seg-7a3fad06a9fc = Ein Lauf von <c1/> fasst sich so zusammen: contact-schedule: { "3" } satellites x { "3" } stations over { "12" } h -> { "31" } candidate contacts, { "22" } scheduled; { "797266" } of { "860000" } Mbit delivered (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-a03d83f5866a = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/contact-schedule.toml
seg-5ba0968796ac = Das Beispiel <c1/> setzt unter anderem:

# text
seg-cade59b5a371 = Ergebnisbezeichnung (die der Engine): MODELLED — Kontaktplan für mehrere Satelliten und mehrere Stationen: scheinbare Zugriffsfenster (SGP4, IAU 2006/2000A, Refraktion nach ITU-R P.834, Lichtlaufzeit), DVB-S2-ACM-Datenvolumen je Überflug aus einem Link-Budget bei klarem Himmel (Schwellen nach ETSI EN { "302" } 307-1 Tabelle { "13" }) und Konfliktauflösung (ein Satellit je Antenne mit Wen

# attr:alt
seg-e26b549579e2 = Das Diagramm, das die Engine für scenarios/contact-schedule.toml schreibt, Art contact-schedule

# text
seg-036b708ed2b9 = <b>MODELLED</b> Kandidatenkontakte aus jedem Überflug Satellit-Station mit seinem ACM-Datenvolumen; Konflikte, bei denen eine Antenne innerhalb ihrer Wendezeit zwei Satelliten bedienen würde oder ein Satellit gleichzeitig zu zwei Stationen herunterladen würde; eine prioritätsgewichtete Lieferung

# text
seg-60431931082a = <b>MODELLED</b> Kandidatenkontakte aus jedem Überflug Satellit-Station mit seinem ACM-Datenvolumen; Konflikte, bei denen eine Antenne innerhalb ihrer Wendezeit zwei Satelliten bedienen würde oder. Unabhängige Referenz (InternalConsistency): Interne Konsistenz: Das exakte Branch-and-Bound stimmt mit der Brute-Force-Aufzählung bei kleinen Zufallsmengen überein, jeder Plan wird gegen die Konfliktregeln auf Machbarkeit geprüft, und der Greedy-Algorithmus schlägt das exakte Optimum nie. WAS NICHT: Es wurde kein externer Planer und kein Betriebsplan verglichen; Kontakte werden ganz genommen (keine Aufteilung), der Rückstand ist am Fensterbeginn festgelegt, Schwenkzeit über die feste Wendezeit hinaus und an Bord

# text
# c1: label
seg-9941b9f6d4a8 = MODELLED — Kontaktplan für mehrere Satelliten und mehrere Stationen: scheinbare Zugriffsfenster (SGP4, IAU 2006/2000A, Refraktion nach ITU-R P.834, Lichtlaufzeit), DVB-S2-ACM-Datenvolumen je Überflug aus einem Link-Budget bei klarem Himmel (Schwellen nach ETSI EN { "302" } 307-1 Tabelle { "13" }) und Konfliktauflösung (ein Satellit je Antenne mit Wendezeit, eine Station je Satellit) durch einen Greedy-Algorithmus nach Grenznutzen, gegen ein exaktes Branch-and-Bound geprüft; kein Regenschwund, (Ergebnis <c1/>)

# text
seg-fe2b4799b397 = Die Bodenkontaktplanung für mehrere Satelliten und mehrere Stationen mit Konfliktauflösung ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-be14d99cb86d = <s1>Zurück</s1>constellation-design

# text
seg-3784be57d6df = <s1>Weiter</s1>earth-gnss-lunar

# text
seg-f8ef88bc82b5 = Jede Zahl unten ist ILLUSTRATIV: weder Bahnen, Stationen noch Link-Budget eines Betreibers. MODELLED: Der Planer wird gegen seinen eigenen exakten Löser geprüft, nicht gegen ein externes Werkzeug. (Kommentar der Szenariodatei, Zeilen { "11" } bis { "12" })
