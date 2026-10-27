# docs--quantum-physics: translations (de)

# text
seg-5ad814c7ef9e = Hinweise

# text
seg-ad856ad710eb = Status

# text
# c1: docs/QUANTUM.md
seg-f2f359447cd9 = Quelle: <c1/>

# text
seg-5df810623ef1 = Physik von Quanten-Inertialsensoren (Kaltatom-Interferometer)

# text
# c1: QUANTUM-MODELS.md
# c2: PROVENANCE.md
# c3: src/inertial/quantum_imu.rs
seg-b2915c3652a1 = Der größte Teil von Kshana speist seine Quantensensoren mit <b>veröffentlichten Allan-/Rauschkoeffizienten</b> — Datenblatt-Nachschlagewerten (siehe <a1><c1/></a1> und <a2><c2/></a2>). Dieses Dokument behandelt die eine Stelle, an der die Engine die Sensorleistung stattdessen <b>aus ersten Prinzipien</b> berechnet: das Modell des Kaltatom-Interferometer-Beschleunigungsmessers (CAI) in <a3><c3/></a3>.

# text
seg-9ae4b2dc84ba = Es ist bewusst eine <em>minimale, ehrliche</em> Physikebene — die Untergrenze des Quantenprojektionsrauschens und der Skalenfaktor des Interferometers — kein vollständiger Instrumentensimulator. Die folgenden Abschnitte legen genau dar, was modelliert wird und was nicht.

# text
seg-64509c048541 = Was modelliert wird

# text
seg-9fa6211c962e = Ein Mach–Zehnder-Atominterferometer mit drei Pulsen (π/2–π–π/2) (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), die Standardgeometrie des Kaltatom-Beschleunigungsmessers:

# text
seg-3c513ef2fd3b = Größe

# text
seg-c0a13eeb346d = Formel

# text
seg-f838cd800e16 = Effektiver Wellenvektor

# text
# c1: k_eff ≈ 1.611×10⁷ rad/m
seg-79e00267b79f = Zwei-Photonen-Raman; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

# text
seg-5c0a84157352 = Interferometerphase

# text
# c1: a
# c2: k_eff
# c3: T
# c4: T²
# c5: T
seg-31f4f718d896 = Gleichförmige spezifische Kraft <c1/> entlang <c2/>, Pulsabstand <c3/>. Die Skalierung mit <c4/> ist der dominante Empfindlichkeitshebel (Schwerelosigkeit ermöglicht langes <c5/>).

# text
seg-f5b8b6c35dce = Quantenprojektionsrauschen

# text
# c1: C
# c2: N
seg-8902ae6f313c = Pro Schuss, Streifenkontrast <c1/>, Atomzahl <c2/> — die Schrotrauschgrenze einer Zwei-Port-Besetzungsauslesung.

# text
seg-b95d4d1e45f0 = Beschleunigungsempfindlichkeit pro Schuss

# text
seg-c97f2fd35d48 = Auf die Beschleunigung bezogenes Phasenrauschen.

# text
seg-cda09ac79409 = Schrotrauschbegrenzte ASD (Amplitudenspektraldichte)

# text
# c1: T_c
seg-4d84800a3adb = Abtastung in jeder Zykluszeit <c1/>; Einheiten (m/s²)/√Hz.

# text
seg-707ee648d1d5 = PSD (Leistungsspektraldichte) der Geschwindigkeits-Zufallsirrfahrt

# text
# c1: AccelModel
seg-be0ac61054db = <b>Der Koeffizient, den das klassische <c1/> verwendet</b> — nun <em>abgeleitet</em>, nicht vorgegeben.

# text
seg-939e12a62637 = Kontrastabfall

# text
seg-05b0e7130b78 = Dekohärenz während der Interrogation.

# text
seg-e64f748b35ab = Vibrations-Übertragungsfunktion

# text
# c1: T²
seg-1754ac375452 = Beschleunigungs-zu-Phasen-Antwort der idealen Dreipuls-Geometrie (Cheinet et al. { "2008" }); DC-Grenzwert (Frequenz null) <c1/>.

# text
seg-a710cfe4f533 = Vibrationsbegrenzte Phase

# text
# c1: S_a
# c2: ∫₀^∞|H|²dω = (2π/3)T³
seg-f5d2223218c8 = Flache Beschleunigungs-PSD <c1/> entlang der Raman-Achse; <c2/>.

# text
seg-13109dcfc52b = Vibrationsbegrenzte Beschleunigung

# text
# c1: k_eff
seg-812990a8f058 = Pro Schuss; beachten Sie, dass sich <c1/> aufhebt — bestimmt allein durch die PSD der Plattform und die Interrogationszeit.

# text
seg-1c2764469718 = Streifenmehrdeutigkeit

# text
# c1: a_max = π/(k_eff·T²)
# c2: a_max/σ_a = π/σ_Φ
seg-e9cf2dcc0274 = <c1/>, Bereich in Zellen <c2/>

# text
# c1: a_max
# c2: 2·a_max
# c3: k_eff
# c4: T
seg-817e06834263 = Die Streifenphase wird modulo 2π gelesen, daher ist ein einzelner Messwert nur innerhalb von ±<c1/> eindeutig und erscheint außerhalb davon alle <c2/> als Alias; die Zellenzahl hängt nicht von <c3/> oder <c4/> ab.

# text
seg-14bbedf1cd0d = Achsenprojektion

# text
seg-1ac2d4904b8a = Die Kopplung erster Ordnung hat Rang 1: nur die Komponente entlang des Strahls geht in die Phase ein.

# text
seg-7200f91fa19a = Coriolis-/Rotationsphase

# text
# c1: 2·v_⊥·Ω
seg-f8b407b3b2fb = Rotationssystematik für ein bewegtes Fahrzeug (Lan et al. { "2012" }); äquivalenter Bias <c1/> = der klassische Coriolis-Term.

# text
seg-9eaff8d90a83 = AC-Stark-Phase (Lichtverschiebung) (AC: Wechselstrom)

# text
seg-62630dc178e6 = Ein-Photonen-Lichtverschiebung; eine <em>konstante</em> Verschiebung hebt sich durch die π/2–π–π/2-Symmetrie auf (Peters { "2001" }; Gauguet { "2008" }).

# text
# c1: CaiAccelerometer::q_va()
seg-bcb9cb9c6219 = Der Schluss der Kette ist der entscheidende Punkt: <c1/> liefert genau die PSD der weißen Beschleunigung, die der übrige Inertial-Stack bereits zu einem Geschwindigkeits-/Positionsfehler integriert — so lässt sich das Rauschen eines Quantensensors auf seine Atomzahl, Interrogationszeit und seinen Kontrast zurückführen statt auf eine Datenblattzeile.

# text
# c1: T = 10 ms
# c2: N = 10⁶
# c3: C = 0.5
# c4: T_c = 0.5 s
# c5: Φ(1 g) ≈ 1.58×10⁴ rad
# c6: σ_Φ = 2×10⁻³ rad
# c7: σ_a ≈ 1.24×10⁻⁶ m/s²
# c8: n_a ≈ 0.09 µg/√Hz
# c9: S_a = 10⁻¹⁰ (m/s²)²/Hz
# c10: σ_a ≈ 5.8×10⁻⁵ m/s²
# c11: a_max ≈ 1.95×10⁻³ m/s²
# c12: Φ(1 g)
seg-e2363d639ccc = Ein durchgerechnetes Beispiel (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) pro Schuss und eine Schrotrauschgrenze <c8/>. Mit einer bescheidenen Vibrations-PSD der Plattform <c9/> beträgt die <b>vibrationsbegrenzte</b> Grenze pro Schuss <c10/> (≈ { "5.9" } µg) — etwa das { "46" }-Fache der Schrotrauschgrenze, was zeigt, warum reale Geräte durch Vibration und nicht durch Projektionsrauschen begrenzt sind. Dasselbe Interferometer liest die spezifische Kraft nur innerhalb von <c11/> (≈ { "199" } µg) eindeutig, etwa { "1 571" } Auflösungszellen: <c12/> sind Tausende von Streifen, daher erscheint ein einzelner Messwert von { "1" } g als Alias.

# text
seg-c209b86f41d8 = Was NICHT modelliert wird (und warum die Untergrenze optimistisch ist)

# text
# c1: scenarios/imu-deadreckoning.toml
# c2: max_unambiguous_accel
# c3: wrap_phase
# c4: accel_from_wrapped_phase
# c5: dynamic_range_cells
seg-964c5f546c2a = Die Schrotrauschgrenze oben ist eine <b>fundamentale Untergrenze</b>. Reale CAI-Instrumente liegen darüber: ein statisches Laborgravimeter (Freier et al. { "2016" }, { "96" } nm/s²/√Hz) etwa das { "60" }-Fache über der für seine Parameter berechneten Grenze, und ein im Feld eingesetztes Beschleunigungsmesser-Triplet deutlich weiter (das in <c1/> zitierte Exail-Gerät nennt { "22" } µg/√Hz). Der dominante Term — die <b>Vibrationskopplung</b> — und die beiden führenden deterministischen Systematiken — <b>Coriolis/Rotation</b> und die <b>AC-Stark-Lichtverschiebung</b> — werden modelliert (die Zeilen zu Übertragungsfunktion, Coriolis und Lichtverschiebung oben), ebenso der <b>Dynamikbereich der Streifenmehrdeutigkeit</b> (<c2/>, <c3/>, <c4/>, <c5/>). Die verbleibende Lücke ist das, was diese Ebene noch nicht enthält:

# text
seg-c56d85817bc6 = <b>Wellenfrontaberration</b> und Systematiken höherer Ordnung der Strahlausrichtung — <b>nicht modelliert</b>.

# text
# c1: a_max
seg-525c382e813b = <b>Auflösung der Streifenmehrdeutigkeit</b> — das Modell gibt den eindeutigen Bereich an und liefert die umgebrochene Phase; es entfaltet keinen Messwert außerhalb von ±<c1/> (zum Beispiel mit einem klassischen Beschleunigungsmesser oder mehreren Interrogationszeiten), und es begrenzt den Bereich für einen idealen Dreipuls-Streifen, ohne Wellenfront- oder Kontrastverlustterme.

# text
seg-7555132ef2c6 = Zuordnung zur Literatur: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (Quantentechnologie; GNSS: globales Satellitennavigationssystem); Cheinet et al., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) für Empfindlichkeit/Übertragungsfunktion des Interferometers (IEEE: Institute of Electrical and Electronics Engineers); Freier et al., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) für das Fehlerbudget des mobilen Gravimeters; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) für den Parameterbereich des Weltraum-Beschleunigungsmessers.

# text
# c1: ROADMAP.md
# c2: q_va
# c3: T³
seg-c50f3befe165 = Dies ist der Punkt <b>P2 Quantenphysik-Ebene</b> aus <c1/>: die Mach–Zehnder-Phase, das Projektionsrauschen, der Skalenfaktor, das abgeleitete <c2/>, der Kontrastabfall <b>und die Vibrationskopplungs-Übertragungsfunktion / Varianz bei weißer PSD</b> sind implementiert und per Unit-Test gegen Handrechnung geprüft (einschließlich einer numerischen Bandintegral-Gegenprüfung der Übertragungsfunktion gegen ihr analytisches <c3/>-Ergebnis).

# text
# c1: ImuKind::QuantumCai
# c2: cai
# c3: [accel_quantum.cai]
# c4: [accel_classical.cai]
# c5: inertial
# c6: [accel.cai]
# c7: hybrid-ukf
# c8: scenarios/hybrid-ukf.toml
# c9: scenarios/quantum-cai-coast.toml
# c10: wavelength_m
# c11: pulse_sep_t
# c12: T
# c13: atom_number
# c14: N
# c15: contrast
# c16: C
# c17: cycle_time_s
# c18: T_c
# c19: vibration_psd
# c20: q_va
# c21: [cai]
seg-42e8dc204be9 = Das Modell ist außerdem <b>in lauffähige Szenarien eingebunden</b>: Ein Beschleunigungsmesser wird zu <c1/> aufgelöst, wenn er eine Tabelle <c2/> trägt — <c3/> oder <c4/> in einem Szenario <c5/>, <c6/> in einem Szenario <c7/> (<c8/> liefert eines mit, und die mitgelieferte Voreinstellung <c9/> stellt einen physikalisch spezifizierten CAI einem Quarz-Beschleunigungsmesser in Navigationsgüte durch einen GNSS-Ausfall gegenüber) — mit den Feldern <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) und einer optionalen <c19/> der Plattform. Seine PSD der Geschwindigkeits-Zufallsirrfahrt <c20/> wird dann aus der Interferometerphysik <b>abgeleitet</b> — die Schrotrauschgrenze plus, wenn eine Vibrations-PSD angegeben ist, der vibrationsbegrenzte Beitrag in quadratischer Addition — statt als Datenblattkoeffizient vorgegeben zu werden. Szenarien ohne einen Block <c21/> sind klassisch und byteidentisch unverändert.

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: ac_stark_phase
# c4: 2·Ω×v
# c5: cai_drift_sweep
# c6: quantum-gnss-free-nav
# c7: QuantumNavBudget
# c8: src/inertial/cai_params.rs
seg-51da20726ade = Die Systematiken Coriolis (<c1/> / <c2/>) und AC-Stark-Lichtverschiebung (<c3/>) sind implementiert und per Unit-Test geprüft (der äquivalente Coriolis-Bias wird gegen das klassische <c4/> geprüft; die AC-Stark-Phase gegen ihre symmetrische Aufhebung). Ein Zykluszeit-Driftdurchlauf (<c5/>) berichtet die Positionsdrift der Quanten-CAI-Koppelnavigation über der Zykluszeit — der Rechenkern eines Vergleichs Quanten gegen klassisch. Die Art <c6/> verwendet denselben Beschleunigungsmesser über <c7/> wieder, und <c8/> enthält ein Parameterblatt mit Spannen (beste, nominale, konservative) und einer Quellenangabe je Wert.

# text
seg-e2acbef44395 = Was die externen Prüfungen zeigen.

# text
# c1: tests/quantum_inertial_sensor_reference.rs
# c2: k_eff
# c3: |2Ω×v|
seg-353a2b2e1434 = <c1/> prüft die Übertragungsfunktion gegen ein numerisches Zeitbereichsintegral der Empfindlichkeitsfunktion von Cheinet, <c2/> gegen veröffentlichte Linienwellenlängen und den Coriolis-Bias gegen <c3/> — exakte Übereinstimmungen der veröffentlichten Formen. Die Schrotrauschgrenze ist eine einseitige Eingrenzung: Für die veröffentlichten Parameter des Caesium-Gravimeters von Peters et al. { "2001" } und des Rubidium-Gravimeters GAIN von Freier et al. { "2016" } (arXiv:{ "1512.05660" }) liegt die modellierte Grenze bei oder unter dem erreichten Rauschen des jeweiligen Geräts und innerhalb von drei Größenordnungen davon (für GAIN beträgt die Grenze { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz gegenüber dem erreichten { "9.6" }×{ "10" }⁻⁸, ein Faktor von etwa { "63" }). Das ist damit vereinbar, dass reale Geräte durch Vibration oder technisch begrenzt sind, aber es ist eine Eingrenzung, keine Validierung eines Instrumentenrauschmodells, daher bleibt die Matrixzeile MODELLED.

# text
# c1: cai_drift_sweep
seg-82dffa95c0e8 = Die verbleibenden Folgearbeiten sind Systematiken von Wellenfront/Strahlausrichtung, die Auflösung der Streifenmehrdeutigkeit, eine numerisch exakte Reproduktion der Monte-Carlo-Rechnung von CARIOQA-PMP und der Budgets der GPS-gestörten (GPS: Global Positioning System) Flugversuche von Boeing/AOSense (die die veröffentlichten Plattform-PSDs und das SNR pro Schuss, das Signal-Rausch-Verhältnis, benötigen) sowie eine Voreinstellung für den Vergleich Quanten gegen klassisch im Browser-Playground auf Basis von <c1/>.

# text
seg-2452f58aedf0 = <s1>Zurück</s1>Quantensensor-Modelle

# text
seg-206d5a9704f0 = <s1>Weiter</s1>Python-API
