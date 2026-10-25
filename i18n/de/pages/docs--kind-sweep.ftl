# docs--kind-sweep: translations (de)

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-a8d92406e428 = Optische Strontium-Gitteruhr, weltraumtaugliches Ziel sigma_y

# text
seg-5278ccdaf16f = <b>MODELLED</b> Geschlossene Formel für das Wachstum des Auslauffehlers + Holdover bis zum Schwellenwert; Quantenuhr-Klassen. Unabhängige Referenz (ReferenceImpl): Mehrschritt-Kovarianzrekursion von clock_state (Gegenprüfung innerhalb derselben Codebasis); der zugrunde liegende Kern für Auslaufvarianz und Holdover-Inversion ist extern gegen scipy validiert (siehe „Clock-holdover coast-variance & threshold inversion“). Die Holdover-Werte je Klasse mit Rotrauschboden bleiben MODELLED

# text
seg-e12f672ae71d = GNSS-gesperrter Uhren-Holdover ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber extern nicht maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
seg-ee7dd15019d0 = Themenseite: <a1>CAMPAIGNS.md</a1>

# text
seg-8b701f465117 = logarithmisch

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Ein Lauf nimmt einen Kontaktplan (eine Liste von aos_s/los_s-Fenstern, die jeweils von der Apertur Navigation oder Kommunikation anfordern — dasselbe Fenstervokabular, das <c1/> ausgibt, umgewandelt von <c2/>), eine Apert

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> Der Sweep der Art <c1/> (ein bis drei gepunktete Schlüssel einer beliebigen Art, auf den Achsenwerten des generischen Sweeps, optional ein Ensemble an jedem Knoten) und der Abschnitt monte_carlo. Unabhängige Referenz (InternalConsistency): Die geschlossene Form des Phasen-Random-Walks bei weißem Frequenzrauschen, Varianz q_wf tau (NIST Technical Note { "1337" }), für die Statistikmaschinerie, und Byte-Gleichheit mit den eigenständigen Läufen für das Seeding. Sie prüft die Ensemble-Arithmetik am eigenen Uhrenmodell der Engine, nicht an einem externen Datensatz

# text
seg-d1c11e493795 = Parameter-Sweeps und Monte-Carlo-Ensembles mit Seed über jede Szenarioart sind MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Die Verfügbarkeits-Sweeps der Art <c1/>: je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und kombiniert der Anteil der Paare (Nutzer, Epoche) mit mindestens einem und mindestens vier Signalen und der längste Ausfall, für einen Nutzer auf einer Kugel

# text
# c1: docs/kinds/by-kind/sweep.md
seg-de72ae48731d = Quelle: <c1/>

# text
seg-e7ab7b55c969 = 1-D-Trade-Study-Sweep über einen Uhrenpaket-Parameter.

# text
# c1: scenarios/sweep-clock-stability.toml
seg-0412c0dbfb75 = Ein Lauf von <c1/> fasst sich zusammen als: Sweep holdover_s über classical_q_wf ({ "1.00e-24" }..1.00e-18, { "25" } Punkte, logarithmische Skala) | Quanten 6600.000->{ "6600.000" } | klassisch 2610.000->{ "250.000" }

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
seg-d2a441254bcd = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scale
seg-2b8d8159bdaf = Optionale Felder: <c1/>

# text
# c1: scenarios/sweep-clock-stability.toml
seg-73c2e732b0c1 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-f8a627a78bdb = Microchip-SA.45s-CSAC-Datenblatt sigma_y(1s)={ "3e-10" }; q_wf ist s

# text
seg-1750fbfc4a99 = <s1>Zurück</s1>sweep-nd

# text
seg-de5468ac32fc = <s1>Weiter</s1>telecom-timing

# text
# c1: sweep
seg-81c2da4650c9 = <c1/> (Szenarioart)

# attr:alt
seg-c784b8f22f12 = Das Diagramm, das die Engine für scenarios/sweep-clock-stability.toml schreibt, Art sweep

# text
# c1: campaign
seg-cb00aca0268d = <b>MODELLED</b> Die Abschnitte sweep (ein bis drei gepunktete Schlüssel einer beliebigen Szenarioart, auf den Achsenwerten des generischen Sweeps, optional ein Ensemble an jedem Knoten) und monte_carlo der Szenarioart <c1/>: Realisierung k läuft bei base_seed + k; jede Metrik gibt Mittelwert, Standardab Tests: <a1>campaign_composition_reference.rs</a1>.
