# docs--kind-gnss-ssv: translations (de)

# text
seg-37d29d8303fe = km

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/gnss-ssv.md
seg-1b94e5a24a2d = Quelle: <c1/>

# text
# c1: gnss-ssv
seg-ee3ecc6e0330 = <c1/> (Szenarioart)

# text
seg-d07af7221334 = Szenarioart der Engine v{ $version }, Familie <a1>Navigation von Raumnutzern</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-d6d7bca305dc = MODELLED GNSS-Verfügbarkeit und Linkstärke im Space Service Volume und darüber hinaus: Für einen Nutzer auf einer Kugel (die globale Schale des ICG-Booklets) oder auf einer Kepler-Trajektorie (LEO bis Mondtransfer) zählt sie je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und für alle zusammen die Signale, die über einer C/N0-Schwelle nutzbar sind - Verfügbarkeit von mindestens einem und von vier Signalen, maximale Ausfalldauer, empfangenes C/N0, Verdünnung der Genauigkeit, Hauptkeulen- gegenüber Nebenkeulenverbindungen - mit einem Sendediagramm aus dem Booklet, parametrisch oder vom Nutzer geliefert, optionalen Effekten von Limb-Strahl-Ionosphäre, Plasmasphäre und Atmosphäre und einem optionalen Empfängerentwurf für schwache Signale; außerdem ein GNSS-Extended-Kalman-Filter an Bord für HEO- und Mondtransferfahrzeuge (Bahndynamik, Sonnenstrahlungsdruck, Drittkörper, Uhr) und die Relativnavigation einer Formation aus mehreren Fahrzeugen durch einfach differenzierte Pseudoentfernungen. Gegen die Tabellen des ICG-SSV-Booklets unter einer Vorregistrierung geprüft (xval/gnss-ssv)

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-d739ae994bf0 = Ein Lauf von <c1/> fasst sich so zusammen: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

# text
# c1: shell|trajectory|navigation
seg-79d2e350ed73 = Pflichtfelder: <c1/>

# text
# c1: name
# c2: constellations
# c3: transmit
# c4: receiver
# c5: atmosphere
# c6: formation
seg-7fc75803140d = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-cebc76420d69 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-ce3b64e8c1f4 = [l1, l5]

# text
seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

# text
seg-b02a3ef32d54 = HEO, Nadir- und Zenit-Patch-Antennen mit hohem Gewinn, parametrisch s

# text
seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

# text
seg-3421a66993bd = heo

# text
seg-8974ff39f695 = parametric

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-8ac8f00f6c77 = 1/m^{ "3" }

# text
seg-15ca016a7a4f = Ergebnisbezeichnung (die der Engine): MODELLED: ein geometrischer Sweep mit Link-Budget. Das Booklet-Diagramm ist eine Hauptkeule mit konstanter Leistung, das parametrische Diagramm ein repräsentativer Ersatz und das Limb-Strahl-Medium ein einfaches genanntes Modell; nichts hiervon ist eine Messung eines Signals im Weltraum. Die Verfügbarkeits- und Ausfallzahlen folgen der Methode des

# attr:alt
seg-7dae5e291c8b = Das Diagramm, das die Engine für scenarios/gnss-ssv-heo.toml schreibt, Art gnss-ssv

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Die Verfügbarkeits-Sweeps der Art <c1/>: je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und kombiniert der Anteil der Paare (Nutzer, Epoche) mit mindestens einem und mindestens vier Signalen und der längste Ausfall, für einen Nutzer auf einer Kugel

# text
# c1: gnss-ssv
# c2: [navigation]
seg-07c94d5ad15c = <b>MODELLED</b> Der Modus <c2/> der Art <c1/>: ein Extended-Kalman-Filter mit neun Zuständen (Position, Geschwindigkeit, Empfängeruhr-Bias und -Drift, ein Skalenfaktor des Sonnenstrahlungsdrucks) auf Pseudoentfernungen, deren Verfügbarkeit, Rauschen und C/N0 aus demselben Link

# text
# c1: gnss-ssv
# c2: [formation]
seg-41bfe74c6f6f = <b>MODELLED</b> Der Modus <c2/> der Art <c1/>: Ein Chief und Deputies führen jeweils das absolute Filter aus; die Position des Deputy relativ zum Chief wird durch Subtraktion der absoluten Schätzungen und durch ein relatives Filter auf einfach differenzierten Pseud

# text
# c1: gnss-ssv
seg-de9a2a5b5f04 = <b>MODELLED</b> Die Verfügbarkeits-Sweeps der Art <c1/>: je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und kombiniert der Anteil der Paare (Nutzer, Epoche) mit mindestens. Unabhängige Referenz (ExternalDataset): Das ICG-Booklet Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), selbst eine Simulation, verglichen unter einer Vorregistrierung, die vor dem Lauf eingecheckt wurde (xval/gnss-ssv/PREREGISTRATION.md; Ergebnisse in xval/gnss-ssv/RESULTS.md, festgehalten durch tests/ssv_booklet_results.rs, Verfehlungen eingeschlossen). Lauf { "1" } auf der vorab registrierten Lesart: Die Konstanten der minimal abgestrahlten Leistung und der Mondzielwert stimmen überein (S0, S6 erreicht); das obere und untere SSV, die HF-Schwelle

# text
seg-f0b778c4922a = <b>MODELLED</b> Eine Chapman-Ionosphäre, eine Plasmasphäre vom Gallagher-Typ und eine neutrale Atmosphäre (Brechungsbiegung, Sauerstoffabsorption, Defokussierung), integriert entlang des geraden. Unabhängige Referenz (InternalConsistency): Geschlossene Formen und veröffentlichte Größenordnungen in den Tests (Spitze und Biegung einer Chapman-Schicht an der Oberflächen-Limb, einige TECU Plasmasphäre auf einem Strahl von GPS zu GEO); der Empfängerentwurf verwendet die Akquisitions- und Tracking-Schleifenmodelle und deren Tests wieder. Es werden keine gemessenen Daten zur Limb-Sondierung oder zum Empfang schwacher Signale damit verglichen

# text
# c1: gnss-ssv
# c2: [navigation]
seg-77cef183420e = <b>MODELLED</b> Der Modus <c2/> der Art <c1/>: ein Extended-Kalman-Filter mit neun Zuständen (Position, Geschwindigkeit, Empfängeruhr-Bias und -Drift, ein Skalenfaktor des Sonnenstrahlungs. Unabhängige Referenz (InternalConsistency): Simulierte Wahrheit gegen die eigene Schätzung des Filters (der mittlere normierte quadrierte Schätzfehler eines konsistenten Filters liegt für die Position bei etwa { "3" }) und Determinismus bei festem Seed. Es werden keine Flugdaten oder aufgezeichneten GNSS-Daten hoher Umlaufbahnen verglichen; Sonne und Mond sind kreisförmige Ersatzmodelle mit geringer Genauigkeit

# text
# c1: gnss-ssv
# c2: [formation]
seg-429e154cd691 = <b>MODELLED</b> Der Modus <c2/> der Art <c1/>: Ein Chief und Deputies führen jeweils das absolute Filter aus; die Position des Deputy relativ zum Chief wird durch Subtrak. Unabhängige Referenz (InternalConsistency): Dieselbe simulierte Wahrheit wie beim absoluten Filter: der Fehler des relativen Filters gegen den wahren Relativzustand und die Prüfung, dass es mindestens so gut abschneidet wie die Subtraktion zweier unabhängiger absoluter Lösungen. Es werden keine Flugdaten einer Formation verglichen

# text
# c1: label
seg-1dd1beb01075 = MODELLED: ein geometrischer Sweep mit Link-Budget. Das Booklet-Muster ist eine Hauptkeule mit konstanter Leistung, das parametrische Muster ein repräsentativer Ersatz und das Medium der Limb-Strahlen ein einfaches, angegebenes Modell; nichts davon ist eine Messung eines Signals im Weltraum. Die Verfügbarkeits- und Ausfallwerte folgen dem Verfahren des ICG-Space-Service-Volume-Booklets (UN ST/SPACE/75) und werden anhand von dessen Tabellen in xval/gnss-ssv/ geprüft. (Ergebnis <c1/>)

# text
seg-3add0e744c54 = MODELLED: Das Muster ist repräsentativ, nicht gemessen; das Medium ist ein angegebenes einfaches Modell (docs/SSV.md). (Kommentar in der Szenariodatei, Zeile { "14" })

# text
seg-6b4655dd5270 = Die GNSS-Signalverfügbarkeit im Space Service Volume und darüber hinaus, verglichen mit dem ICG-SSV-Booklet, ist MODELLED, nicht validiert: Eine Teilaussage wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-132be2813c10 = Das GNSS-Navigationsfilter an Bord für Raumfahrzeuge auf hohen Bahnen und im Mondtransfer ist MODELLED, nicht validiert: Es wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-f9405de9adb8 = Die Relativnavigation eines Formationsflugs mehrerer Raumfahrzeuge auf einer stark elliptischen Bahn aus GNSS ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-4881f925ea7f = Familienseite: <a1>Space-user navigation</a1>

# text
seg-4b72df59b3f9 = Themenseite: <a1>SSV.md</a1>

# text
seg-c9ac9a99bcbb = <s1>Zurück</s1>gnss-sim

# text
seg-9df48482a140 = <s1>Weiter</s1>gravity-map

# text
# c1: gnss-ssv
seg-a9e1798308df = Limb-Strahl-Effekte von Ionosphäre, Plasmasphäre und Atmosphäre auf streifende GNSS-Signale sowie der Entwurf des Empfängers für schwache Signale in der Szenarioart <c1/> ist MODELLED, nicht validiert: Er wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
# c1: kshana kinds --json
seg-e9c2dedbc971 = MODELLED GNSS-Verfügbarkeit und Linkstärke im Space Service Volume und darüber hinaus: Für einen Nutzer auf einer Kugel (der globalen Schale des ICG-Booklets) oder auf einer Kepler-Bahn (LEO bis Mondtransfer) zählt es je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und für alle zusammen die Signale, die oberhalb einer C/N0-Schwelle nutzbar sind - Verfügbarkeit von mindestens einem und von vier Signalen, maximale Ausfalldauer, empfangenes C/N0, (Szenarioarten-Katalog (<c1/>))
