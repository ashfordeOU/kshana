# docs--kind-sweep-nd: translations (de)

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
seg-ee7dd15019d0 = Themenseite: <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-8b701f465117 = logarithmisch

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> Der Sweep der Art <c1/> (ein bis drei gepunktete Schlüssel einer beliebigen Art, auf den Achsenwerten des generischen Sweeps, optional ein Ensemble an jedem Knoten) und der Abschnitt monte_carlo. Unabhängige Referenz (InternalConsistency): Die geschlossene Form des Phasen-Random-Walks bei weißem Frequenzrauschen, Varianz q_wf tau (NIST Technical Note { "1337" }), für die Statistikmaschinerie, und Byte-Gleichheit mit den eigenständigen Läufen für das Seeding. Sie prüft die Ensemble-Arithmetik am eigenen Uhrenmodell der Engine, nicht an einem externen Datensatz

# text
seg-d1c11e493795 = Parameter-Sweeps und Monte-Carlo-Ensembles mit Seed über jede Szenarioart sind MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN). Unabhängige Referenz (ExternalDataset): Veröffentlichte numerische Vektoren aus Primärarbeiten zu CAI (Übertragungsfunktion nach Cheinet { "2008" }; Empfindlichkeit nach Peters/Freier): k_eff·T² exakt getroffen, die Schrotrausch-ASD ein einseitiger Boden innerhalb von ~{ "2" }× jedes veröffentlichten Instruments (reale Geräte tragen technisches Rauschen über dem Quantenboden). Eine Eingrenzung, keine Gleichheit. { "0.30" } Runde { "2" } (vorab registriert fcb9ac64), ein Befund (bleibt MODELLED): das reine QPN-Rotationsrauschen gegen das gemessene von Gauguet et al.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Zusammengesetztes Positionsbudget aus Bias + Skalenfaktor + VRW + Stabilitätsabfall über das Holdover. Unabhängige Referenz (ReferenceImpl): Unabhängige numpy-Monte-Carlo-SDE-Integration des doppelt integrierten weißen Beschleunigungsrauschens (validiert die analytische VRW-Varianz durch einen wirklich unabhängigen Algorithmus) + ein Anker mit veröffentlichtem Wert von Groves { "2013" } für die Bias-/Skalenfaktor-Terme; die CAI-Gerätezahlen quantifizieren Partner-Hardware und bleiben MODELLED

# text
seg-9955b1b1c018 = Die Leistung von Quanten-Inertialsensoren ist MODELLED, nicht validiert: Eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = Die Resilienz der Quanten-Inertial-Koppelnavigation ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-5a70fcb097dc = Optionale Felder: keine

# text
seg-bb07c8ee153f = <b>PARTNER</b> Nicht geliefert — nur Leistungsmodelle; Kaltatom-/Uhren-Hardware gehört einem Partner. Orakel (NoneKind): keine: eine Disziplin im Besitz eines Partners, bewusst ohne Modul und ohne Test

# text
# c1: docs/kinds/by-kind/sweep-nd.md
seg-792218eac075 = Quelle: <c1/>

# text
seg-4f19d4fb1341 = Generischer N-D-Sweep über ein beliebiges Paket über gepunktete TOML-Schlüssel / JSON-Metrikpfade.

# text
# c1: scenarios/sweep-nd-inertial.toml
# c2: inertial
seg-cd907c72698b = Ein Lauf von <c1/> fasst sich zusammen als: generischer Sweep von <c2/> über [threshold_m, accel_classical.bias] | { "15" } Knoten (Form [{ "5" }, { "3" }]) | Metriken [classical.fom.holdover_s, classical.fom.pos_rms_m]

# text
# c1: base
# c2: axes
# c3: metrics
seg-502ba2c57a5f = Erforderliche Felder: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/sweep-nd-inertial.toml
seg-c372e390bb4f = Das Beispiel <c1/> setzt unter anderem:

# text
seg-ce006a6715e9 = <s1>Zurück</s1>spoof

# text
seg-b9f8771ffd3d = <s1>Weiter</s1>sweep

# attr:alt
seg-621a18c07044 = Das Diagramm, das die Engine für scenarios/sweep-nd-inertial.toml schreibt, Szenarioart sweep-nd

# text
# c1: sweep-nd
seg-c7e5582d0b24 = <c1/> (Szenarioart)
