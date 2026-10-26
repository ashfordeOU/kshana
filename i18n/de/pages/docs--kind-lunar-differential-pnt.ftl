# docs--kind-lunar-differential-pnt: translations (de)

# text
seg-9feefecdcf67 = rafs

# text
seg-f42465f7d066 = ns

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
# c1: docs/kinds/by-kind/lunar-differential-pnt.md
seg-d0c9bec248b4 = Quelle: <c1/>

# text
# c1: lunar-differential-pnt
seg-d226df2bb634 = <c1/> (Szenarioart)

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-4b7355b174a3 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-differential-pnt | { "8" } Satelliten (illustrativ, LCNS-Klasse, nicht verbunden) | Basislinie { "50" } km | Nutzerfehler { "24.46" } m → { "0.0077" } m ({ "3186" }× Reduktion) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-1115464be513 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-549a6103e711 = bit

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-3f32e0fea066 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Differentielle Referenzstation der Klasse NovaMoon: Aufhebung des Gleichtakts + mit der Basislinie wachsender Restfehler + DGNSS-Schutzniveaus. Orakel (InternalConsistency): Identität der differentiellen Fehleraufhebung + Wiederverwendung der PL-Maschinerie von SBAS nach DO-229E; die Einfachdifferenz + WLS-Lösung wird zusätzlich gegen lsq()/matinv() von RTKLIB gegengeprüft (Takasu, BSD-2-Clause, kompiliertes C) — unabhängiger Löser-Code, aber dieselbe Algebra der Sichtliniendifferenz erster Ordnung, daher weiterhin InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Die drei Terme, die eine differentielle Korrektur zwischen der Epoche, in der sie berechnet wird, und der Epoche, in der sie verwendet wird, aufnimmt, jeder zuvor als nicht modellierter Spielraum belassen:. Orakel (InternalConsistency): Identitäten in geschlossener Form und Selbstkonsistenz: die Varianz step²/12 des gleichförmigen Quantisierers, die exakte Kovarianzfortpflanzung (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹, die für gleiche σ auf σ·PDOP zusammenfällt, die { "1" }:{ "1" }-Übertragung des Vermessungsterms als Folge von û_user ≈ û_ref und der Abschluss der Quadratur beim Abschalten. Die PDOP-Gegenprüfung gegen orbit::dop teilt sich die Normalmatrix [−û, { "1" }], ist also eine Konsistenzprüfung und wird als solche bezeichnet, statt als

# text
seg-9d54d8c07ca3 = EHRLICHKEIT: MODELLED. Die Aufhebung des Gleichtakts ist eine EXAKTE algebraische Identität; der Rest der räumlichen Dekorrelation ist ein geometrisches Modell ERSTER ORDNUNG (die Projektion der Sichtliniendifferenz eines eingespeisten Bahnfehlers), kein angepasstes Dekorrelationsmodell aus echter Mondverfolgung. Das Schutzniveau des Nutzers WIEDERVERWENDET die SBAS-Schutzniveau-Maschinerie nach DO-229E (crate::sbas) mit dem Sigma des differentiellen Restfehlers als Fehler je Satellit (Kommentar in der Szenariodatei, Zeilen { "23" } bis { "28" })

# text
# c1: correction_link
seg-4156a7515574 = ── DIE KORREKTURSTRECKE ────────────────────────────────────────────────────────────── Die obige Identität setzt eine PERFEKTE Korrektur voraus: berechnet von einer Station, die genau weiß, wo sie steht, sofort geliefert, mit unendlicher Auflösung. Nichts davon trifft zu, und die drei Eingaben unten modellieren, was jedes davon kostet. Sie speisen NUR den Block <c1/> des Ergebnisdokuments -- mit allen dreien auf den hier geschriebenen Werten (Kommentar in der Szenariodatei, Zeilen { "57" } bis { "62" })

# text
seg-e7f016777e09 = VERMESSUNGSFEHLER. Die Station bildet ihre Korrektur gegen die Koordinate, die sie GLAUBT. Ein Fehler dort liegt auf jeder Korrektur, die sie aussendet, und erreicht den Nutzer als -delta . u_ref -- das keinerlei Nutzergeometrie enthält, sodass es im Gegensatz zum Bahnterm weder bei Nullbasislinie verschwindet noch mit der Basislinie wächst und sich etwa eins zu eins in die Position des Nutzers überträgt. Standardwert { "0.30" } m ist die eigene Mondreferenz des Crates (Kommentar in der Szenariodatei, Zeilen { "64" } bis { "70" })

# text
seg-e0648d9b52b4 = KORREKTURALTERUNG. Eine bei t berechnete und bei t+tau angewandte Korrektur ist auf zweierlei Weise veraltet. Bahn: Der Satellit hat sich BEWEGT, sodass der eingefrorene Bahnfehlervektor nun auf eine gedrehte Sichtlinie projiziert; die Drehung stammt vom eigenen Propagator dieses Crates, sodass nirgends eine Bahnfehlerrate angenommen wird. Uhr: Die Satellitenuhr ist um c*sigma_y(tau)*tau für das Potenzgesetz der vollen RAFS in crate::clock_specs gedriftet, kalibriert die (Kommentar in der Szenariodatei, Zeilen { "73" } bis { "79" })

# text
seg-7171b2e3f29d = Das lunare differentielle PNT ist MODELLED, nicht validiert: Es wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = Das lunare differentielle PNT — Restfehlerbudget der Korrekturstrecke ist MODELLED, nicht validiert: Es wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Themenseite: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-2b8455001710 = <s1>Zurück</s1>lunar-beacon

# text
seg-dca7482d9d75 = <s1>Weiter</s1>lunar-frame-campaign

# attr:alt
seg-8e67df89448a = Das Diagramm, das die Engine für scenarios/lunar-differential-pnt.toml schreibt, Szenarioart lunar-differential-pnt

# text
# c1: kshana kinds --json
seg-f1e7283d2e15 = MODELLED — exakte Aufhebungsidentität + Dekorrelationsmodell erster Ordnung; nicht mit realen Daten validiert; kein TRL/Flugerbe/keine Billigung durch eine Agentur. (Szenarioarten-Katalog (<c1/>))

# text
seg-8ac5ac006ae7 = Modelliertes lunares DIFFERENTIELLES PNT (ein lunares Analogon zu DGNSS/SBAS): Eine Referenzstation der Klasse NovaMoon an einem BEKANNTEN selenographischen Ort berechnet differentielle Korrekturen je Satellit aus einer ILLUSTRATIVEN Konstellation der Klasse Moonlight/LCNS aus öffentlichen Quellen (NovaMoon nur als Systemklasse genannt, ohne Verbindung zur ESA), und ein um baseline_km versetzter Nutzer wendet sie an, sodass sich die gleichtaktigen Bahn- + Uhrenfehler aufheben. Der Uhrenterm hebt sich EXAKT auf (eine algebraische Identität); der Bahnterm hinterlässt nur die Projektion der Sichtliniendifferenz, die für Basislinie → { "0" } gegen { "0" } geht (die Untergrenze der räumlichen Dekorrelation) und etwa linear mit der Basislinie wächst. Es werden der 3D-Positionsfehler des Nutzers MIT gegenüber OHNE Korrekturen, der Reduktionsfaktor, die Kurve Fehler gegen Basislinie und ein Schutzniveau des Nutzers ausgegeben, das die SBAS-Maschinerie nach DO-229E (crate::sbas) MIT dem differentiellen Restfehler σ WIEDERVERWENDET. MODELLED — exakte Aufhebungsidentität + Dekorrelationsmodell erster Ordnung; nicht mit realen Daten validiert; kein TRL/Flugerbe/keine Billigung durch eine Agentur. Deterministisch, wenn mit Seed erzeugt.
