# docs--kind-mars-pnt: translations (de)

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> 3-Zustands-Van-Loan-Kalman-Uhr (Phase/Frequenz/Drift), Joseph-stabilisiert. Unabhängige Referenz (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), mit F über scipy.linalg.expm und Q über die Van-Loan-{ "1978" }-Blockmatrix – eine unabhängige Referenzimplementierung, die die vollständige Filtertrajektorie von kshana reproduziert. Konsistenz über Implementierungen hinweg: Die Uhrenphysik / Allan-Kalibrierung ist nicht extern validiert, daher bleibt dies MODELLED. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): auf IGS-Final-{ "30" }-s-Uhren von { "11" } GPS Blo

# text
seg-8de95b3a9229 = Die Zustandsschätzung der Bordzeit-Uhr ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber extern nicht maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Szenarioart der Engine v{ $version }, Familie <a1>Konstellationen, Abdeckung und Geometrie</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> Die Art <c1/>: Ein Orbiter oder ein Lander auf der Oberfläche um einen namentlich gewählten Körper navigiert mit Einweg-Pseudoentfernungen von einer Walker-Navigationskonstellation um den Körper (Zweikörperbahnen mit der säkularen J2-Drift des Körpers, eine unbekannte Nutzeruhr

# text
seg-a4f1e7d2041e = Familienseite: <a1>Konstellationen, Abdeckung und Geometrie</a1>

# text
seg-670191cf797f = Themenseite: <a1>SOLAR-SYSTEM.md</a1>

# text
# c1: docs/kinds/by-kind/mars-pnt.md
seg-c68502b9d675 = Quelle: <c1/>

# text
seg-3f749aef8d89 = PNT im Deep Space am Mars: Eine simulierte MARCONI-Relais-Konstellation (areostationäre + geneigte Relais, die Einweg senden + Zweiweg an eine Deep-Space-Station weiterleiten) navigiert einen Referenznutzer (transfer | lmo | surface) durch den gemeinsamen radiometrischen Einweg-/Zweiweg-Fusionsschätzer. Sie gibt pro Epoche Geometrie/Sichtbarkeit, den erreichten RMS gegen die Wahrheit und die formale Kovarianz (1σ / 3σ Position) aus — eine ehrliche simulierte Gütezahl, KEIN zertifiziertes Schutzniveau.

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-0254f9bd0ee6 = Ein Lauf von <c1/> fasst sich zusammen als: mars-pnt 5aad87fcc94a | lmo-Nutzer, uso-Uhr | { "5" } Relais (im Mittel { "3.1" } in Sicht) | konvergierter Positions-RMS { "0.25" } m, formal 1σ { "0.31" } m (3σ { "0.93" } m — Kovarianz-Gütezahl, kein zertifiziertes PL) | Uhrfrequenz-σ { "3.71e-13" } | cov-PD true

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-8eb513e7aeea = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-5a9640a3f9b4 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-8e0fecea19fc = uso

# text
seg-a16f2332397c = lmo

# text
seg-83c3a84f6b98 = <b>VALIDATED</b> Einen Epochenzustand [r,v] aus Bodenstations-Entfernungen über einen Gauß-Newton-Batch-Differentialkorrektor und ein sequenzielles Filter wiedergewinnen, über ein Zweikörper+J2-Kraftmodell. Unabhängige Referenz (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — eine unabhängige Schätzbibliothek eines Drittanbieters auf einem abgeglichenen Kraftmodell; der wiedergewonnene Epochenzustand und der RMS der Residuen nach der Anpassung stimmen auf <{ "1e-3" } m ohne Rauschen und <{ "3" } m bei einem Rauschboden von { "5" } m überein

# text
seg-4be479b81f39 = <s1>Zurück</s1>lunar-vlbi

# text
seg-2854e6a75833 = <s1>Weiter</s1>moonlight-service-volume

# text
# c1: mars-pnt
seg-46072326d616 = <c1/> (Szenarioart)

# attr:alt
seg-c564dca90854 = Das Diagramm, das die Engine für scenarios/mars-pnt-lmo.toml schreibt, Art mars-pnt

seg-6d595f01ffcc = <s1>Weiter</s1>mission-thread
