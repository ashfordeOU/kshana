# docs--kind-lunar-time-offset: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-4d208b6c0eb8 = Tag

# text
# c1: docs/kinds/by-kind/lunar-time-offset.md
seg-64813e3da228 = Quelle: <c1/>

# text
# c1: lunar-time-offset
seg-000bb13909f1 = <c1/> (Szenario-Kind)

# text
seg-7f3e13712f10 = Modellierte relativistische Uhrenrate Erde–Mond (Lunar Coordinate Time, LTC/TCL): die säkulare Rate LTC−TT aus der Differenz der Eigenpotenziale und dem kinetischen Term des Mondes, ausgegeben mit dem veröffentlichten Band von { "56" }–{ "59" } µs/Tag, plus der über einen Horizont akkumulierte Versatz.

# text
# c1: scenarios/lunar-time-offset.toml
seg-9efcf3e1be04 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-time-offset | secular LTC−TT rate { "57.04" } µs/day (band { "56" }–{ "59" }) | self-pot { "57.50" } kinetic -0.46 | offset @ { "1.00" } d = { "57.04" } µs

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-9367773c4889 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/lunar-time-offset.toml
seg-4731141e6aac = Das Beispiel <c1/> setzt unter anderem:

# text
seg-3843825d0733 = us

# attr:alt
seg-e9deb6ed41c1 = Das Diagramm, das die Engine für scenarios/lunar-time-offset.toml schreibt, Kind lunar-time-offset

# text
seg-982426693747 = <b>VALIDATED</b> Relativistische Uhrenrate Erde-Mond (LTC/TCL) + Verkettung TT/TAI/UTC + Ensemble. Orakel (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; Grundlage der LTC von IAU/IAG LunaNet): Eigenpotenzial der Mondoberfläche L_m = { "3.13881e-11" } und säkulare Gesamtrate { "56.02" } µs/Tag, übereinstimmend als veröffentlichte Zahlenwerte; geozentrische Geschwindigkeit des Mondes gegengeprüft mit JPL DE440 (de440s.bsp über SPICE)

# text
seg-96b65f604cc2 = Ehrlichkeit: MODELLED, nicht zertifiziert. Die Kennzahl us/Tag hängt von der Referenz ab (Geoid W0 der Erde gegenüber einem lunaren Selenoid, das Zeitmittelungsfenster, vernachlässigte Zentrifugal-/J2-Korrekturen unter us/Tag) -> ein Band, keine einzelne Zahl, ist die ehrliche Ausgabe. Nichts hier ist auf eine absolute Genauigkeit im Subnanosekundenbereich validiert oder für den operativen Zeithaltebetrieb zertifiziert. Der Bericht gibt außerdem den akkumulierten LTC-TT-Versatz über den Hori (Kommentar in der Szenariodatei, Zeilen { "11" } bis { "16" })

# text
seg-e4552368a6a7 = <s1>Zurück</s1>lunar-time-budget

# text
seg-777dc23bac6a = <s1>Weiter</s1>lunar-vlbi-fim
