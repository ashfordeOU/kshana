# docs--kind-spoof: translations (de)

# text
seg-f42465f7d066 = ns

# text
seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC Datenblatt sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Optische Strontium-Gitteruhr, weltraumtaugliches Ziel sigma_y

# text
seg-b9174c70772f = <b>MODELLED</b> Uhrengestütztes χ², RAIM, AGC, SQM, fusioniert zu einer Sicherheits-Gütezahl je Epoche. Unabhängige Referenz (ExternalDataset): TEXBAT-Szenarioparameter (Humphreys { "2012" }) – Charakterisierung, keine festgelegten Vektoren. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): bei JammerTest { "2024" } (Bleik; GPL-3.0-Daten) lösten die Monitore auf Beobachtungsebene (uhrengestütztes Chi-Quadrat, RAIM, Lösungsausfall) innerhalb von { "10" } s bei keinem der { "8" } auswertbaren veröffentlichten Spoofing-Einsätze Alarm aus (wo das Fenster vor dem Einsatz sauber war, kam der erste Alarm { "10.2" } bis { "39" } s nach dem pu

# text
seg-e4b64d7277da = Spoofing-Erkennung ist MODELLED, nicht validiert: eine Teilaussage ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-ee7dd15019d0 = Themenseite: <a1>CAMPAIGNS.md</a1>

# text
seg-debc2f07db78 = true

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Themenseite: <a1>INTEGRITY.md</a1>

# text
seg-5a70fcb097dc = Optionale Felder: keine

# text
seg-5d23d7f8f872 = Familienseite: <a1>Jamming, spoofing and the spectrum</a1>

# text
seg-03d8dc3de7ca = <b>MODELLED</b> Uhrengestütztes χ², RAIM, AGC, SQM, fusionierte Sicherheitsgütezahl pro Epoche Tests: <a1>spoof_texbat_validation.rs</a1>.

# text
# c1: docs/kinds/by-kind/spoof.md
seg-09125f609abe = Quelle: <c1/>

# text
seg-cbd77f6ffd63 = Stochastischer Zeit-Spoof-Detektor (Neyman–Pearson / χ²₁) mit Monte-Carlo-P_fa/P_md.

# text
# c1: scenarios/spoof-attack.toml
seg-2a1e4e7893ba = Ein Lauf von <c1/> fasst sich zusammen als: Szenario 2b6bd22c3b80 | Spoof LinearRamp { "{" } rate_ns_per_s: { "0.1" } { "}" } gegen { "20.000" } ns Spez. (P_fa { "0.010" }) | Quantensicherheit { "1.000" } (P_md { "0.000" }, MC { "0.000" }) erkannt 70s | klassische Sicherheit { "0.558" } (P_md { "0.442" }, MC { "0.444" }) erkannt 430s

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-b577342dfe39 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/spoof-attack.toml
seg-adb7ff15a702 = Das Beispiel <c1/> setzt unter anderem:

# text
# c1: [spoofer]
seg-8b3523b5fa2c = <b>MODELLED</b> Für jeden LEO-Satelliten und jedes Paar von Entfernungsmessbändern bildet der Abschnitt <c1/> die geometriefreie Pseudoentfernungskombination, entfernt das Ionosphärenmodell des Empfängers und testet ihren Epoche-zu-Epoche-Schritt gegen das Codenrauschen der beiden Bänder und ein st Tests: <a1>leo_resilience_verticals.rs</a1>.

# text
seg-e5bbd2fca4fb = <s1>Zurück</s1>spoof-detect

# text
seg-8d3311751876 = <s1>Weiter</s1>sweep-nd

# text
seg-304496607bd7 = Szenarioart der Engine v{ $version }, Familie <a1>Jamming, spoofing and the spectrum</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# attr:alt
seg-6f6a8c975111 = Das Diagramm, das die Engine für scenarios/spoof-attack.toml schreibt, Szenarioart spoof

# text
# c1: spoof
seg-8bf73eca4115 = <c1/> (Szenarioart)

# text
# c1: leo-pass
# c2: [spoofer]
seg-ecc2dc8489bb = <b>MODELLED</b> Der Abschnitt <c2/> der Szenarioart <c1/>: Ein Spoofer fälscht, in Entfernung und Entfernungsrate in sich konsistent, die Signale, die an einer behaupteten Position zu sehen sind, die nach einem Beginn von der wahren springt und/oder von ihr weggeschoben wird (pro LEO-Band und für das MEO Tests: <a1>leo_resilience_verticals.rs</a1>.
