# docs--kind-lunar-integrity: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-Mehrfachhypothesen-Lösungstrennung nach dem ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels und add_v42_protecti. Unabhängige Referenz (ExternalDataset): Drei unabhängige Werkzeuge, vorab registriert (0123cee1), bevor irgendeine Fixture oder Ausgabe der Referenz existierte, Toleranzen damals festgelegt. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (Commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als getrenntes Programm unter GNU Octave { "8.4" } mit einem treiberseitigen unique()-Kompatibilitäts-Shim ausgeführt (offengelegt, keine Algorithmusänderung), beim TOL_PL des ADD von { "0.05" } m: Das Rust reproduziert die ADD-Referenzimplementierung auf

# text
# c1: docs/kinds/by-kind/lunar-integrity.md
seg-8ed008b206de = Quelle: <c1/>

# text
# c1: lunar-integrity
seg-26f0cf6d63c0 = <c1/> (Szenario-Kind)

# text
seg-4b6daea39f5c = ARAIM-Schutzniveau-Überflug am lunaren Südpol gegen einen repräsentativen Satz von LunaNet-Relais. sigma_ure_m legt die Genauigkeit der Signal-in-Space-Entfernungsmessung offen (Schutzniveaus skalieren linear damit, sodass ein Durchfahren die Frage beantwortet, welche Entfernungsmessgenauigkeit ein Alarmgrenzwert verlangt). Standardmäßig der historische Südpolfall der Klasse LNIS.

# text
# c1: scenarios/lunanet-araim.toml
seg-a6eb6de27cb5 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-integrity | south pole | 0/24 epochs available ({ "0.0" }%) | AL { "50" } m | σ_URE { "30" } m | HPL { "263" }–{ "452" } m

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-79da500e2726 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/lunanet-araim.toml
seg-21d10aa98c33 = Das Beispiel <c1/> setzt unter anderem:

# attr:alt
seg-610fa190a393 = Das Diagramm, das die Engine für scenarios/lunanet-araim.toml schreibt, Kind lunar-integrity

# text
seg-1903c67a762d = <b>VALIDATED</b> Der Schritt von der Geometrie zur Kovarianz beim lunaren Schutzniveau — (GᵀG)⁻¹ über die Gesamtgeometrie aller sichtbaren Satelliten und jede Teilgeometrie mit einem einzelnen Fehler, projiziert auf die lokale Vertikale a. Orakel (ExternalDataset): Zwei etablierte Implementierungen von Drittanbietern, zusammengesetzt, beide offline ausgeführt, wobei die Fixture von Anfang bis Ende neu erzeugt und als byteidentisch verifiziert wurde. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), Commit 71db0ff, src/rtkcmn.c, aus dem C-Quelltext mit -ULAPACK kompiliert: lsq() → matinv() → ludcmp()/lubksb() invertiert die Normalmatrix durch Crout-LU mit Teilpivotisierung, ein Algorithmus, der nichts mit dem handgeschriebenen Gauß-Jordan-invert4() von kshana zu tun hat

# text
seg-3c54da43686e = <s1>Zurück</s1>lunar-infrastructure

# text
seg-f6b399c3fd4a = <s1>Weiter</s1>lunar-interop-export
