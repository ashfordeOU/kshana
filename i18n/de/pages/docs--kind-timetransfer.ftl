# docs--kind-timetransfer: translations (de)

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
seg-5a70fcb097dc = Optionale Felder: keine

# text
seg-a1810bbca337 = <b>MODELLED</b> Zweiweg/TWSTFT (Sagnac), GNSS-Common-View, PPP; Link-Jitter→Entfernung. Orakel (ExternalDataset): Sagnac-Betrag geprüft gegen einen maßgeblichen VERÖFFENTLICHTEN WERT — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Gl. { "1.29" }: Eine ostwärtige Umrundung am Äquator summiert { "207.4" } ns (2ωA_E/c²); kshana reproduziert { "207.386" } ns. Unabhängig bestätigt durch RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), das dieselbe 2Aω/c²-Geometrie trägt. Der zusammengesetzte BIPM-TWSTFT-Transponder/Common-View/

# text
seg-a8beb8dfc757 = Das Fehlerbudget der Zeitübertragung ist MODELLED, nicht validiert: Eine Teilaussage wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-37a77f49f048 = ps

# text
# c1: docs/kinds/by-kind/timetransfer.md
seg-2ccebbc74d9f = Quelle: <c1/>

# text
# c1: timetransfer
seg-289a9f8dc990 = <c1/> (Szenario-Kind)

# text
seg-ccb244e60d60 = Optische gegen HF-Zweiweg-Zeit-/Frequenzübertragung.

# text
# c1: scenarios/timetransfer.toml
seg-59347fda6c66 = Ein Lauf von <c1/> fasst sich zusammen als: Szenario 8f9c2e0e31a5 | optisch sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | HF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-890040dd3d96 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/timetransfer.toml
seg-7b887ea27a86 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-2485eaa6dbf4 = Zweiweg-Satelliten-Zeit- und Frequenzübertragung (TWSTFT, Ku-ba

# text
seg-fa54f1a81b57 = Optische Inter-Satelliten-Strecke, Synchronisation im Pikosekundenbereich

# text
seg-a30fe2b87ee2 = mm

# attr:alt
seg-bd76bd68eab3 = Das Diagramm, das die Engine für scenarios/timetransfer.toml schreibt, Kind timetransfer

# text
seg-3c9d28692f9f = <b>MODELLED</b> Zweiweg/TWSTFT (Sagnac), GNSS Common-View, PPP; Strecken-Jitter→Entfernung Tests: <a1>time_transfer_error_budgeting_reference.rs</a1>.

# text
seg-84fcf20588fb = <s1>Zurück</s1>time-transfer-budget

# text
seg-149ad280a1f9 = <s1>Weiter</s1>tracking-loop
