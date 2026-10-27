# docs--quantum-models: translations (de)

# text
seg-638b8d451550 = Sensor

# text
seg-c35a20fa2529 = Reifegrad

# text
# c1: docs/QUANTUM-MODELS.md
seg-2f51722ab9d4 = Quelle: <c1/>

# text
seg-39ab7752d86d = Quantensensor-Modelle: was Kshana modelliert und was nicht

# text
seg-daf0e0c0b16f = Kshana ist ein <b>PNT-Resilienz-Simulator (PNT: Positionierung, Navigation und Zeitgebung) mit Leistungsmodellen für Quantensensoren</b>. Es ist <em>kein</em> Quantenphysik-Simulator aus ersten Prinzipien. Diese Seite sagt genau, was das bedeutet, damit die Rahmung als „Quanten“ nicht für mehr gehalten werden kann, als sie ist.

# text
seg-6e504d97c41e = Was modelliert WIRD

# text
seg-7884c9a7d883 = Jeder Quantensensor (und jeder klassische) ist ein <b>Fehlermodell</b>, das von veröffentlichten Parametern des Rauschbudgets angetrieben wird:

# text
# c1: ClockClass
# c2: VALIDATION.md
# c3: VERIFICATION-MATRIX.md
seg-cad22f39d579 = <b>Uhren</b> — spektrale Leistungsdichten (PSD) für weißes Frequenzrauschen und Random-Walk-Frequenzrauschen, eine Flicker-(1/f-)Allan-Untergrenze und lineare Drift, aus Datenblättern und Papern bezogen: die CSAC (chipskalige Atomuhr) Microchip SA.45s; die optische Strontium-Gitteruhr von Origlia et al. (arXiv:{ "1503.08457" }), ein raumfahrtorientiertes Ziel; und die sechs Standardwerte <c1/> (CSAC; USO, ultrastabiler Oszillator; DSAC, Deep Space Atomic Clock; TCXO, temperaturkompensierter Quarzoszillator; OCXO, ofengesteuerter Quarzoszillator; RAFS, Rubidium-Atomfrequenznormal), jeder mit einer Quelle belegt. Die daraus entstehende Allan-Abweichung ist gegen die Standardsteigungen der Rauschtypen validiert (siehe <a1><c2/></a1>). Eine optische Uhrenkurve ist real: Die gemessene Allan-Abweichung der ⁸⁸Sr-Tweezer-Uhr von Norcia et al. (<em>Science</em> { "2019" }) wird durch die Rauschanpassung reproduziert, eine Zeile VALIDATED in <a2><c3/></a2>; die auf der optischen Klasse aufbauenden Holdover-Kennzahlen bleiben MODELLED.

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: src/inertial/
seg-13c3340e773b = <b>Inertialsensoren</b> — in den Paketen <c1/> und Hybrid-Paketen ein einachsiges (1-DOF, ein Freiheitsgrad) Fehlerbudget für Beschleunigungsmesser/Kreisel: Geschwindigkeits-Zufallsirrfahrt, Winkel-Zufallsirrfahrt, Beschleunigungs-Zufallsirrfahrt und eine Allan-Bias-Instabilitätsgrenze. Die Arten <c2/> und <c3/> führen stattdessen die dreiachsige Strapdown-Mechanisierung in <c4/> aus (Quaternionen-Lage, Navigationsgleichungen in Nord-Ost-Unten, ein deterministisches IMU-Fehlermodell).

# text
# c1: quantum-trade
# c2: quantum-time-transfer
# c3: quantum-anomaly-detect
# c4: quantum-gnss-free-nav
# c5: hybrid-ukf
# c6: quantum-time-transfer
# c7: quantum-anomaly-detect
# c8: quantum-gnss-free-nav
seg-f361d586b348 = Die Quanten-Szenarioarten — <c1/>, <c2/>, <c3/>, <c4/> und <c5/> — sind aus diesen Fehlermodellen aufgebaut und MODELLED; <c6/>, <c7/> und <c8/> melden zusätzlich einen Repräsentativitätsnachweis mit den Lücken bis zum Flug.

# text
seg-05bbaddd4df6 = Die Engine ist <b>neutral</b>: „Quanten“ und „klassisch“ sind derselbe Codepfad mit unterschiedlichen Koeffizienten. Der Kontrast in den Gütemaßen ergibt sich ausschließlich aus den Eingangs-Rauschparametern, die jeweils auf eine zitierte Quelle zurückgehen.

# text
seg-a1a067588520 = Was NICHT modelliert wird

# text
seg-49a656243210 = Bei den Uhr- und Zeitübertragungssensoren wird nichts von der zugrunde liegenden Quantenphysik simuliert — nur der Netto-Allan-Beitrag, der als Koeffizient vorgegeben wird. Für den <b>Kaltatom-Beschleunigungsmesser</b> gibt es nun eine Ebene aus ersten Prinzipien (siehe unten); die übrigen Systematiken liegen weiterhin auf Koeffizientenebene oder sind nicht modelliert:

# text
# c1: Φ = k_eff·a·T²
# c2: σ_Φ = 1/(C·√N)
# c3: |H(ω)| = (4/ω²)sin²(ωT/2)
# c4: σ_Φ² = k_eff²·S_a·T³/3
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: a_max = π/(k_eff·T²)
# c8: QUANTUM.md
seg-844e65d52572 = die <b>Mach–Zehnder-Phase</b> des Atominterferometers (<c1/>), das <b>Quantenprojektions-/Schrotrauschen</b> (<c2/>), der Abfall des Interferometer-<b>Kontrasts</b>, die <b>Zykluszeit</b> und die <b>Vibrationskopplungs-Übertragungsfunktion</b> (<c3/>, Varianz bei weißer PSD <c4/>) <em>werden nun aus ersten Prinzipien modelliert</em> für den CAI-Beschleunigungsmesser (Kaltatom-Interferometer) (<c5/>); daraus wird die PSD der weißen Beschleunigung <c6/> abgeleitet, die das klassische Modell verwendet, zusammen mit dem <b>Dynamikbereich der Interferenzstreifen-Mehrdeutigkeit</b> (<c7/>) — siehe <a1><c8/></a1>;

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: 2·v⊥·Ω
# c4: ac_stark_phase
# c5: src/inertial/quantum_imu.rs
seg-71a782041b89 = die <b>Coriolis</b>-Systematik (<c1/> / <c2/>, die <c3/>-Kreuzkopplung) und die <b>AC-Stark-/Lichtverschiebungs</b>-Systematik (AC: Wechselstrom) (<c4/>, die sich bei symmetrischer Zwei-Photonen-Verstimmung aufhebt) <em>werden nun in <c5/> modelliert und per Unit-Test geprüft</em>;

# text
# c1: src/inertial/cai_error_terms.rs
seg-00c510117abc = drei weitere CAI-Fehlerterme <em>werden nun modelliert</em> als Bibliotheksfunktionen in <c1/> ({ "0.36" }; MODELLED; noch nicht aus einer Szenarioart erreichbar):

# text
# c1: σ_Φ² = (π/2)²·S_φ⁰/τ_R
# c2: t_d = 2L/c
seg-fcaf6ff00974 = <b>Raman-Laserphasenrauschen</b>: die Gewichtung mit der Empfindlichkeitsfunktion nach Cheinet et al. ({ "2008" }), Gl. { "8" }, mit der geschlossenen Form für weißes Phasenrauschen <c1/> (Gl. { "18" } bei einem Zyklus) und einem numerischen Weg für beliebige Phasenrauschspektren, dazu das Laserfrequenzrauschen, das die Verzögerung der Rückreflexion <c2/> nicht aufhebt (Le Gouët et al. { "2007" }, Gl. { "9" } bis { "11" });

# text
# c1: δg = σ_v²/R
# c2: R
seg-6e2236c81db8 = <b>Wellenfrontkrümmung</b> (nur reine Defokussierung): die Abweichung <c1/> einer thermischen Wolke in einem Strahl mit Krümmungsradius <c2/> und ihre Verringerung, wenn nur Atome innerhalb eines Detektionsradius gezählt werden (nach Louchet-Chauvet et al. { "2011" } und Schkolnik et al. { "2015" }); Aberrationen höherer Ordnung werden nicht modelliert;

# text
# c1: erfc(π/(√2·s))
seg-92295ad17228 = <b>Auflösung der Interferenzstreifen-Mehrdeutigkeit</b>: die Wahrscheinlichkeit eines falschen Streifenindex, <c1/>, für eine Stützung durch einen klassischen Beschleunigungsmesser (Lautier et al. { "2014" }) und für zwei Interrogationszeiten (nach Bonnin et al. { "2018" }), mit der Umkehrung, die das größte klassische Rauschen für eine vorgegebene Fehlerwahrscheinlichkeit liefert.

# text
# c1: τ_R
seg-f383678fb806 = Jede geschlossene Form wird gegen einen unabhängigen numerischen Weg (Quadratur im Frequenzbereich oder eine Monte-Carlo-Rechnung über Atome oder Schüsse) und ihre Grenzfälle geprüft. Die einzige reproduzierte veröffentlichte Zahl ist der Pegel des weißen Phasenrauschens von Cheinet et al.: −{ "111" } dB·rad²/Hz bei <c1/> = { "20" } µs ergibt etwa { "1" } mrad pro Schuss ({ "0.99" } mrad; die Veröffentlichung leitet diesen Pegel mit ihrer Gl. { "17" } her, Flicker- plus weißes Rauschen). Nichts davon ist eine Messung eines Instruments;

# text
seg-150f8b9dfea4 = weiterhin <b>nicht</b> modelliert: Wellenfrontaberrationen höherer Ordnung, das Phasenrauschen eines bestimmten Lasersystems und Physik der Uhrenseite aus ersten Prinzipien;

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: VALIDATION.md
seg-643109601eba = das Paket <c1/> im Vergleich Quanten gegen klassisch ist einachsig; der dreiachsige Strapdown-Pfad läuft nur in <c2/> und <c3/> (siehe die Anmerkung zur IMU, Inertialmesseinheit, in der README und <a1><c4/></a1>).

# text
# c1: ROADMAP.md
seg-1ff01ab9f92d = Die Vervollständigung der Quantenphysik-Ebene (die CAI-Fehlerterme aus einer Szenarioart erreichbar machen, Wellenfrontaberrationen höherer Ordnung und Physik der Uhrenseite aus ersten Prinzipien) ist die verbleibende P2-Arbeit in <c1/>.

# text
seg-f09a31b33faa = Bodenlabor- gegenüber flugqualifizierten Werten

# text
seg-dcef4579d2a9 = Parametertabellen mischen Reifegrade; behandeln Sie sie entsprechend:

# text
seg-4f25895df32f = Quellwert

# text
seg-cef61e912cd0 = CSAC (z. B. SA.45s)

# text
seg-4a016be9bca9 = Datenblatt σ_y({ "1" } s) ≈ { "3e-10" }

# text
seg-38cc72b2405c = <b>im Einsatz befindliches</b> kommerzielles Teil (strahlungstolerante Weltraumvarianten existieren)

# text
seg-d38d20629ed6 = Strontium-Gitteruhr (optisch)

# text
seg-1f0d3ec00922 = Ziel σ_y({ "1" } s) ≈ { "1e-15" } (arXiv:{ "1503.08457" })

# text
seg-1496e0c42086 = <b>Bodenlabor</b> — Kshana kennt keine veröffentlichte Leistung einer solchen Uhr im Orbit

# text
seg-ce1d7994188b = Kaltatom-Beschleunigungsmesser

# text
seg-b07fa6b8cebc = veröffentlichte Allan-Werte aus dem Labor

# text
seg-60864f168701 = Bodenlabor / Höhenforschungsrakete

# text
seg-84a68aeb467d = Die Werte optischer Uhren in Kshana sind <em>Weltraumziele auf Bodenhardware</em>. Es existiert keine geflogene optische Uhr; die README und die Herkunft der Ergebnisse sagen das ausdrücklich.

# text
seg-a204c1b854fa = Vergleichsmaßstab: ACES/PHARAO auf der ISS (in Betrieb seit April { "2025" })

# text
seg-fb88de1257bd = Die Nutzlast <b>ACES/PHARAO</b> der ESA (Europäische Weltraumorganisation) (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — eine lasergekühlte Caesiumuhr plus ein aktiver Wasserstoff-Maser, seit April { "2025" } auf der ISS (Internationale Raumstation) in Betrieb — ist der aktuelle operationelle Maßstab für die Uhrenstabilität im Orbit (angestrebte relative Stabilität in der Größenordnung von { "1e-16" } nach einigen Tagen Integration). Das optische Uhrenmodell von Kshana stellt ein <em>ehrgeizigeres</em> Bodenlabor-Ziel dar als die geflogene Caesium-/Maser-Leistung von ACES; wenn man die optischen Zahlen von Kshana mit dem vergleicht, „was tatsächlich geflogen ist“, ist ACES/PHARAO der ehrliche Bezugspunkt, und es ist ein Mikrowellen-/Maser-System, keine optische Gitteruhr.

# text
seg-9d2e850cb986 = Die genauen Orbit-Leistungswerte von ACES sollten aus den veröffentlichten Ergebnissen der ESA zitiert werden, sobald sie vorliegen; hier geht es um die <em>Reifelücke</em>, nicht um eine bestimmte Zahl — die optischen Werte von Kshana sind Ziele, keine geflogene Leistung.

# text
# c1: VALIDATION.md
# c2: validated
# c3: not modeled
seg-4b373686adf8 = <a1><c1/></a1> — Kennzeichnungen <c2/> / <c3/> je Parameter.

# text
# c1: GLOSSARY.md
seg-3f0c1048aea9 = <a1><c1/></a1> — Definitionen der Gütemaße (FoM) und jede Abkürzung.

# text
# c1: INTEGRITY.md
seg-a360cd4997e2 = <a1><c1/></a1> — was die Gütemaße für Integrität und Sicherheit sind und was nicht.

# text
# c1: QUANTUM.md
seg-0ac025397b23 = <a1><c1/></a1> — der Kaltatom-Beschleunigungsmesser aus ersten Prinzipien.

# text
seg-41ba2c8f70fe = <s1>Zurück</s1>Konstellationsentwurf

# text
seg-136fa589fed5 = <s1>Weiter</s1>Kaltatom-Interferometer
