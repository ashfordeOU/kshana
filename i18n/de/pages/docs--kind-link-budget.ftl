# docs--kind-link-budget: translations (de)

# text
# c1: docs/kinds/by-kind/link-budget.md
seg-120fcc840b87 = Quelle: <c1/>

# text
# c1: link-budget
seg-738aa7d45efb = <c1/> (Szenarioart)

# text
seg-953188c11165 = Einwegstreckenbilanz nach der CCSDS-{ "401" }- bzw. DSN-810-005-Streckengleichung: Freiraumdämpfung, C/N₀, Eb/N₀, Marge und Schließung für eine Sende-EIRP, ein Empfangs-G/T, eine Entfernung, eine Datenrate und ein Band (s|x|ka) gegen ein gefordertes Eb/N₀. Eine deterministische technische Berechnung aus den gelieferten Eingaben (kein kalibriertes Datenblatt eines Terminals).

# text
# c1: scenarios/link-budget.toml
seg-6697c741d09c = Ein Lauf von <c1/> fasst sich so zusammen: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, Marge { "92.1" } dB (schließt)

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-2305502051b6 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/link-budget.toml
seg-588476f4ae75 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-ebb923e1a3b5 = Ergebnisbezeichnung (die der Engine): Einwegstreckenbilanz nach der CCSDS-{ "401" }- bzw. DSN-810-005-Streckengleichung (EIRP − FSPL − L_other + G/T − k); eine deterministische technische Berechnung aus den gelieferten Eingaben, KEIN kalibriertes Datenblatt eines Terminals

# attr:alt
seg-bd375631bc7e = Das Diagramm, das die Engine für scenarios/link-budget.toml schreibt, Art link-budget

# text
seg-4f92669c3946 = <b>VALIDATED</b> Freiraumdämpfung, C/N₀, Eb/N₀, Marge und Schließung nach der CCSDS-{ "401" }- bzw. DSN-810-005-Streckengleichung für EIRP/G·T/Entfernung/Rate/Band gegen ein gefordertes Eb/N₀. Tests: <a1>one_way_link_budget_reference.rs</a1>.

# text
seg-bfaeb6f1cc5a = <b>VALIDATED</b> Freiraumdämpfung, C/N₀, Eb/N₀, Marge und Schließung nach der CCSDS-{ "401" }- bzw. DSN-810-005-Streckengleichung für EIRP/G·T/Entfernung/Rate/Band gegen ein gefordertes Eb/N₀. Runn. Referenz (ExternalDataset): Veröffentlichte Design-Control-Tabelle für Deep-Space-Telekommunikation als festgelegte numerische Vektoren: DESCANSO / J. H. Yuen (Hrsg.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Tabelle 1-1 (Galileo X-Band) — kshana setzt die Einzelposten der Tabelle neu zusammen und reproduziert ihr veröffentlichtes Gesamt-L_fs von { "290.54" } dB und Pr/N0 von { "54.6" } dB-Hz; die Freiraumdämpfung wird außerdem gegen ITU-R P.525 geprüft

# text
seg-2598c2360113 = <b>MODELLED</b> Der Link-Budget-Bericht nennt jede absolute Konstante, aus der seine eigene Marge berechnet wurde -- die Trägerfrequenz, die die Freiraumdämpfung verwendet hat, die EIRP, die Zahl o. Referenz (InternalConsistency): Keine externe unabhängige Referenz: Dies ist eine Selbstbeschreibung über einer Gleichung, die bereits gegen eine veröffentlichte Design-Control-Tabelle validiert ist (siehe die Zeile zur Einwegstreckenbilanz). Sie wird festgehalten, weil ihr Fehlen ein gemessener Mangel war -- das Reproduzieren der veröffentlichten d1_rate_gain_beamwidth.csv erforderte, eine effektive Konstante aus allen dreißig Zeilen auf { "0.0034" } dB zurückzurechnen, und die Engine benennt diese Kombination jetzt und beweist per Test

# text
seg-c779823e860c = Optional: die Rauschtemperatur des Empfangssystems (K). Sie ist KEINE Eingabe der Streckengleichung -- diese braucht nur das Verhältnis G/T -- aber ihre Angabe lässt den Bericht auch den Empfangsantennengewinn angeben, den die Gütezahl impliziert (G = G/T + { "10" }*log10(T_sys)). Fehlt sie, entfällt die Aufteilung des Gewinns im Bericht, statt angenommen zu werden. tsys_k = { "300.0" } (Kommentar der Szenariodatei, Zeilen { "21" } bis { "25" })

# text
seg-d717412c4f06 = Die Selbstbeschreibung des Link-Budget-Berichts ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft – das findet Übertragungs- und Koeffizientenfehler, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-ffbc9de75306 = <s1>Zurück</s1>leo-signal

# text
seg-59d4cb995cb9 = <s1>Weiter</s1>lunar-attack-surface

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-a3697ad561db = Hz

# text
seg-cec5c06d38af = <b>MODELLED</b> Mondeigenes Störer-zu-Signal-Verhältnis, effektives C/N₀ und Verlust der Aufschaltung für einen selenographischen Oberflächennutzer unter einem Störer an der Mondoberfläche (oder erhöht) über der illustrativen Moonlight/LCNS-artigen Konstellation aus öffentlichen Quellen.
