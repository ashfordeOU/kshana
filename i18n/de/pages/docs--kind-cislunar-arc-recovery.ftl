# docs--kind-cislunar-arc-recovery: translations (de)

# text
seg-debc2f07db78 = true

# text
seg-330cbcd04718 = Anteil (dimensionslos)

# text
# c1: docs/kinds/by-kind/cislunar-arc-recovery.md
seg-8f21a5462b09 = Quelle: <c1/>

# text
# c1: cislunar-arc-recovery
seg-e4858b0a33c9 = <c1/> (Szenarioart)

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
# c1: independence
seg-f994c81583bf = MODELLED Test mit unabhängigem Schätzer für die Beobachtbarkeitsschwelle der cislunaren Bogenlänge. Diese Schwelle ist ein RANG, gelesen an der Beobachtbarkeitsmatrix, die aus den ANALYTISCHEN Entfernungs-Jacobi-Zeilen und der ANALYTISCHEN variationalen Zustandsübergangsmatrix zusammengesetzt wird, und ihre Gegenprüfung mit dem Square-Root-Information-Filter faltet dieselben Zeilen — eine Konsistenzprüfung zwischen zwei numerischen Maschinen, keine Bestätigung. Diese Art liefert den fehlenden Schiedsrichter: einen Batch-Kleinste-Quadrate-Schätzer, der den Anfangszustand des Chiefs aus simulierten Messungen tatsächlich WIEDERHERSTELLT, wobei die Messpartialableitungen als ZENTRALE FINITE DIFFERENZEN des zusammengesetzten Vorwärtsmodells genommen werden. Er ruft keine analytische Jacobi-Zeile, keine variationale STM, keine Singulärwert- oder Eigenwertzerlegung, keine Rangtoleranz und keinen Square-Root-Information-Filter auf — eine Quelltext-Wache in tests/cislunar_arc_recovery_reference.rs macht das durchsetzbar —, während die Dynamik (derselbe RK4-CR3BP-Fluss), die Anfangsbedingungen (dieselbe differenzialkorrigierte Konstellation), die skalare Observable und das Epochenraster bewusst geteilt und im ausgegebenen Block <c1/> benannt werden, weil zwei Analysen desselben physikalischen Problems sich über die Physik einig sein müssen, um vergleichbar zu sein. Zwei Kriterien, jedes über fünf Dekaden seiner eigenen Grenze durchfahren: RAUSCHFREIE WIEDERHERSTELLUNG (der Endzustandsfehler jedes Versuchs mit Seed höchstens recovery_factor mal seine A-priori-Auslenkung — das Rang-Analogon, ohne Singulärwerttoleranz darin) und MONTE-CARLO-SCHÄTZBARKEIT (der gemessene RMS-Positionsfehler über ein Rauschensemble mit Seed unterhalb einer genannten Grenze — das Schätzbarkeits-Analogon, gemessen statt vorhergesagt). Unterstützt den ebenen Vierzustand und den räumlichen Sechszustand, die Familien DRO / L2-Halo / L2-NRHO, Entfernungs- und Entfernungsraten-Observablen und eine mondzentrierte Polarparametrisierung, in der die Transformation auf den ZUSTAND angewendet und das Vorwärtsmodell dort neu differenziert wird. GEMESSEN am veröffentlichten ebenen DRO-Gitter: Der Schätzer stellt den Vierzustand ab { "0.782609" } h wieder her, gegenüber { "2.086957" } h beim Rangkriterium bei rel_tol { "1e-6" } (Verhältnis { "0.375" }) — die Rangschwelle ist als Wiederherstellbarkeitsgrenze NICHT bestätigt —, während die gemessene Schätzbarkeitsgrenze in derselben Gitterzelle landet wie die formale, { "5.739130" } h, und die gemessene Fehlerkurve das formale 1-Sigma über { "21" } Bogenlängen mit einem geometrischen Mittel des Verhältnisses von { "0.98" } reproduziert. MODELLED: der Konstellationsentwurf, das Epochenraster, die eine verfolgte Verbindung, die Größe der Auslenkung, das Messsigma und die zwei genannten Grenzen. Kein zertifiziertes Navigationsleistungsprodukt.

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-ada71f37b21b = Ein Lauf von <c1/> fasst sich so zusammen: cislunar-arc-recovery | dro family, 4-state, { "4" } s/c, range observable, cartesian parameterisation | { "6.0" } h arc, { "24" } epochs (grid { "0.260870" } h), { "32" } trials, seed { "20260920" } | finite-difference partials, no analytic Jacobian / STM / SVD / SRIF | noise-free recovery from { "0.782609" } h (factor { "1e-2" }) vs Gramian rank threshold { "2.086957" } h | Monte-Carlo estimability from { "5.739130" } h (RMS pos ≤ { "1.000" } km, σ { "1.000" } m) vs Gramian estimability { "5.739130" } h | end-of-arc RMS pos { "0.6026" } km

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-3d4a2773c32f = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-eb621f41dfbb = Das Beispiel <c1/> setzt unter anderem:

# text
seg-6d584e86deba = Verhältnis (dimensionslos)

# text
seg-f7f4d06e661f = cislunar-observability auf der identischen

# text
seg-a6cb7ed2ff6d = Ergebnisbezeichnung (die der Engine): MODELLED Wiederherstellungstest der cislunaren Bogenlänge (Bestätigung der P6-Beobachtbarkeitsschwelle durch einen unabhängigen Schätzer). VALIDATED Kern: Der Schätzer ist der bereits vorhandene gewichtete Gauß-Newton-Batch-Korrektor des Crates (crate::batch_ls), dessen Entwurfsmatrix eine ZENTRALE FINITE DIFFERENZ des zusammengesetzten Vor

# attr:alt
seg-2fe411ae2153 = Das Diagramm, das die Engine für scenarios/cislunar-arc-recovery.toml schreibt, Art cislunar-arc-recovery

# text
seg-99dd8cc0e3ef = <b>MODELLED</b> Ein Batch-Kleinste-Quadrate-Schätzer, der den Anfangszustand des Chiefs aus simulierten Messungen zwischen Satelliten über wachsende Präfixe desselben Epochenrasters, das die Tabelle Rang gegen Bogen verwendet, WIEDERHERSTELLT, wobei die Messpartialableitungen als zentrale fini Tests: <a1>cislunar_arc_recovery_reference.rs</a1>.

# text
seg-67aab2162719 = <b>MODELLED</b> Ein Batch-Kleinste-Quadrate-Schätzer, der den Anfangszustand des Chiefs aus simulierten Messungen zwischen Satelliten über wachsende Präfixe desselben Epochenrasters WIEDERHERSTELLT. Unabhängige Referenz (ReferenceImpl): Ein separater Schätzer in dieser Codebasis auf einem anderen Algorithmus und einem disjunkten Codepfad: nichtlinearer gewichteter Gauß-Newton mit Finite-Differenzen-Partialableitungen, sein Urteil gelesen als gemessener Zustandswiederherstellungsfehler in km und mm/s. Er hat keinen Ausdruck mit dem Rang-und-Kovarianz-Weg der Gram-Matrix gemeinsam, und die Trennung wird durch eine Quelltext-Wache DURCHGESETZT, statt behauptet zu werden. GEMESSEN am veröffentlichten ebenen DRO-Gitter: die

# text
# c1: label
seg-7be582874f98 = MODELLED Wiederherstellungstest der cislunaren Bogenlänge (Bestätigung der P6-Beobachtbarkeitsschwelle durch einen unabhängigen Schätzer). VALIDATED Kern: Der Schätzer ist der bereits vorhandene gewichtete Gauß-Newton-Batch-Korrektor des Crates (crate::batch_ls), dessen Entwurfsmatrix eine ZENTRALE FINITE DIFFERENZ des zusammengesetzten Vorwärtsmodells ist - er ruft keine analytische Messungs-Jacobi-Zeile, keine variationale Zustandsübergangsmatrix, keine Singulärwert- o (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-52fe686b1fdf = MODELLED Test mit unabhängigem Schätzer für die Beobachtbarkeitsschwelle der cislunaren Bogenlänge. (Artenkatalog (<c1/>))

# text
# c1: kshana kinds --json
seg-48e6e57a0b40 = MODELLED: der Konstellationsentwurf, das Epochenraster, die eine verfolgte Verbindung, die Größe der Auslenkung, das Messsigma und die zwei genannten Grenzen. (Artenkatalog (<c1/>))

# text
seg-75f275dcb2d2 = MODELLED: der Konstellationsentwurf, das Epochenraster, die eine verfolgte Verbindung, die Größe der Auslenkung, das Messsigma und die zwei genannten Grenzen. Kein zertifiziertes Navigationsleistungsprodukt. (Kommentar der Szenariodatei, Zeilen { "33" } bis { "35" })

# text
seg-ea82d9fd6506 = Die Bestätigung der cislunaren Bogenlängenschwelle durch einen unabhängigen Schätzer ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-53d57e6dafa6 = <s1>Zurück</s1>campaign

# text
seg-fe3ecf4b55fe = <s1>Weiter</s1>cislunar-observability
