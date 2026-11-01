# docs--kind-spectrum: translations (de)

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> Die Art <c1/>, erweitert über das L-Band hinaus: Bänder, angegeben als Preset-Signalentwurf (mit jeder Komponente gezeichnet, auf die Sendebandbreite bandbegrenzt, C/N0 und J/S auf die nachgeführte Komponente bezogen) oder als benutzerdefinierter Träger und Modulation Tests: <a1>leo_signal_reference.rs</a1>.

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Nicht bereitgestellt — Kshana modelliert Signalleistung, keine Nutzlast- oder Antennenhardware. Unabhängige Referenz (NoneKind): keine: eine Disziplin im Besitz des Partners, absichtlich ohne Modul und ohne Test

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
seg-a3697ad561db = Hz

# text
seg-5d23d7f8f872 = Familienseite: <a1>Jamming, spoofing and the spectrum</a1>

# text
seg-f85a85f0c7e4 = MHz

# text
seg-3319b18ac61f = und { "1" } weitere in der Matrix.

# text
# c1: docs/kinds/by-kind/spectrum.md
seg-ab8fe1c3cb79 = Quelle: <c1/>

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-92f1d6d2c0f2 = Ein Lauf von <c1/> fasst sich zusammen als: Szenario spectrum | { "5" } Bänder | { "3" } Jammer | Rauschboden -202.0 dBW/Hz | schlechtestes Band gps-l1ca min. C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-ed3a383d6f1e = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-fb332c77fd0e = Das Beispiel <c1/> setzt unter anderem:

# text
seg-df78607f9cdb = Ergebnisbezeichnung (die der Engine): MODELLED: eine spektrale Leistungsdichte des L-Bands, aufgebaut aus Signalspektren in geschlossener Form (VALIDATED gegen die Lehrbuch-Hauptkeulenbreiten und spektralen Trennungskoeffizienten), Jammer-Spektren und einem kT-Rauschboden, über den spektralen Trennungskoeffizienten auf J/S und effektives C/N0 reduziert. Die Jammer-Leistungen, t

# text
seg-ce0afea7b030 = <b>VALIDATED</b> Spektrale Leistungsdichten mit Einheitsfläche von GPS L1 C/A und L2C (BPSK({ "1" })), GPS L5 und Galileo E5a (BPSK({ "10" })), Sinus-BOC({ "1,1" }) und Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, mit ergänzter MBOC-Variante), ihre numerisch lokalisierten Nullstellen und

# text
seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: Aufzeichnungen im Signal Metadata Format lesen und schreiben (JSON .sigmf-meta mit den Kernfeldern global, captures und annotations; rohes .sigmf-data als cf32_le, ci16_le oder ci8, die ganzzahligen Dekodierer gemeinsam mit realdata::iqif::load_iq), alle auf

# text
seg-4e35cc861b15 = <b>VALIDATED</b> Spektrale Leistungsdichten mit Einheitsfläche von GPS L1 C/A und L2C (BPSK({ "1" })), GPS L5 und Galileo E5a (BPSK({ "10" })), Sinus-BOC({ "1,1" }) und Galileo E1 MBOC(6,1,1/11) (navsignal::M. Unabhängige Referenz (ExternalDataset): Veröffentlichte Lehrbuchwerte: die BPSK(n)-Hauptkeule von 2n x { "1.023" } MHz Nullstelle zu Nullstelle und die Anti-Jam-Koeffizienten Q = { "1" } für einen Schmalband-(CW-)Jammer und Q = { "1.5" } für einen an C/A angepassten Spreizspektrum-Jammer (Kaplan & Hegarty, Understanding GPS/GNSS, 3. Aufl., Abschnitt { "9.4" }); die BOC(m,n)-Hauptkeulen, zentriert bei plus oder minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); die

# text
seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: Aufzeichnungen im Signal Metadata Format lesen und schreiben (JSON .sigmf-meta mit den Kernfeldern global, captures und annotations; rohes .sigmf-data als cf32_le, ci1. Unabhängige Referenz (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) mit demselben periodischen Hann-Fenster, derselben Überlappung, Dichteskalierung, ohne Detrend und zweiseitigem Mittelwert: jeder Bin innerhalb von { "1e-12" } relativ (beobachtet { "6.0e-14" }) über { "27" } Fälle, mit Segmentzahlen aus dem eigenen Spektrogramm von scipy. sigmf-python { "1.13.0" } (LGPL-3.0, als Werkzeug ausgeführt) schreibt fünf Aufzeichnungen von Drittanbietern (cf32_le, ci16_le, ci8, zwei Captures mit Annotationen, eine ungleich null fir

# text
# c1: not_modelled[0]
seg-0cbbe567f1c8 = Linienstruktur des Spreizcodes (zum Beispiel die { "1" }-kHz-Linien von C/A): Töne werden gegen die glatte Hüllkurve bewertet (Ergebnis <c1/>)

# text
# c1: not_modelled[1]
seg-2efdae3f5764 = automatische Verstärkungsregelung, Quantisierung, Pulse Blanking und Notch-Filterung (Ergebnis <c1/>)

# text
# c1: not_modelled[2]
seg-f3e58705c9a2 = das Empfangsantennendiagramm in Richtung des Jammers über eine einzelne Gewinnzahl hinaus (Ergebnis <c1/>)

# text
# c1: not_modelled[3]
seg-c0d379cb1ab3 = systeminterne Mehrfachzugriffsstörung zwischen Satelliten eines Bandes (Ergebnis <c1/>)

# text
# c1: not_modelled[4]
seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 und Galileo E6 (Ergebnis <c1/>)

# text
# c1: not_modelled[5]
seg-249d8a46f95a = Aussendungen eines entworfenen Signals außerhalb seiner Sendebandbreite: sein Spektrum wird dort abgeschnitten, sodass keine Außerbandaussendung ein benachbartes Band erreicht (Ergebnis <c1/>)

# text
# c1: not_modelled[6]
seg-cc83c047f02a = die Wirkung eines Chirps auf die Schleife bei Sweep-Raten in der Größenordnung der Schleifenbandbreite: sein C/N0 verwendet das zeilengemittelte Spektrum (Ergebnis <c1/>)

# text
# c1: label
seg-7155706bc289 = MODELLED: eine spektrale Leistungsdichte des L-Bands, aufgebaut aus Signalspektren in geschlossener Form (VALIDATED gegen die Lehrbuch-Hauptkeulenbreiten und spektralen Trennungskoeffizienten), Jammer-Spektren und einem kT-Rauschboden, über den spektralen Trennungskoeffizienten auf J/S und effektives C/N0 reduziert. Die Jammer-Leistungen, die Zeitleiste und die Front-End-Bandbreiten sind Szenario-Eingaben, keine Messungen. (Ergebnis <c1/>)

# text
seg-95879767c438 = Themenseite: <a1>LEO-SIGNAL.md</a1>

# text
seg-ce69d8d2d9d1 = <s1>Zurück</s1>space-weather

# text
seg-ac2c9c25fbb6 = <s1>Weiter</s1>spoof-detect

# text
# c1: spectrum
seg-10a4479141b5 = <c1/> (Szenarioart)

# text
# c1: spectrum
# c2: jamming
seg-287de49e90a8 = <b>MODELLED</b> Die Szenarioart <c1/>: ein Frequenz-mal-Zeit-Gitter der spektralen Leistungsdichte des L-Bands (thermischer Boden k T_sys mit T_sys = T_ant + { "290" } K (F - { "1" }), die Signale an den. Unabhängige Referenz (InternalConsistency): Rückführung auf die Anti-Jam-Gleichung und das Streckenbudget der bestehenden Szenarioarten <c2/> (derselbe Code, mit denselben Eingaben aufgerufen) und die geschlossene Form des k T0 F-Rauschbodens. Die darunterliegenden Signalspektren sind die validierte Zeile oben; die Jammer-Leistungen, die Zeitleiste und die Front-End-Bandbreiten sind Szenario-Eingaben, die Spektren sind kontinuierlich (keine Spreizcode-Linien), und keine automatische Verstärkungsregelung, kein Blanking und kein Antennendiagramm wirkt auf den j

# text
seg-304496607bd7 = Szenarioart der Engine v{ $version }, Familie <a1>Jamming, spoofing and the spectrum</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Szenarioart nennen.

# text
# c1: spectrum
seg-7e315c5675d0 = <b>MODELLED</b> Die Szenarioart <c1/>: ein Frequenz-mal-Zeit-Gitter der spektralen Leistungsdichte des L-Bands (thermischer Boden k T_sys mit T_sys = T_ant + { "290" } K (F - { "1" }), die Signale mit ihren in der Schnittstellenspezifikation festgelegten minimalen Empfangsleistungen und Dauerstrich-, Schmalb

# attr:alt
seg-ea1678eb9e84 = Das Diagramm, das die Engine für scenarios/l-band-waterfall-jamming.toml schreibt, Art spectrum

# text
seg-fef00c827c6a = L-Band-Spektrummodell und Wasserfall: das gesamte GNSS-L-Band als eine einzige spektrale Leistungsdichte (PSD), Frequenz quer, Zeit abwärts, über eine geskriptete Jammer-Zeitleiste. SIGNALE: GPS L1 C/A und L2C (BPSK({ "1" })), Galileo-E1-Open-Service (MBOC(6,1,1/11) oder BOC({ "1,1" })), GPS L5 und Galileo E5a (BPSK({ "10" })), jeweils auf seinem Träger mit der in der Schnittstellenspezifikation festgelegten minimalen Empfangsleistung (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), sofern nicht überschrieben; GLONASS, BeiDou und Galileo E6 werden nicht modelliert. JAMMER: Dauerstrich-Ton, flaches Schmalbandrauschen, linearer Sägezahn-Chirp und Breitbandrauschen, angepasst an die eigene Modulation eines Bandes, jeweils mit einer Mitte, einer Bandbreite, einer Empfangsleistung (direkt oder EIRP und Entfernung über den Freiraumpfadverlust des Jamming-Szenarioart) und Ein-/Ausschaltzeiten. Jeder Jammer wird gegen jedes Band über seinen spektralen Trennungskoeffizienten kappa über die Empfängerbandbreite bewertet, und (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; für einen Jammer entspricht dies der Anti-Jam-Gleichung des Jamming-Szenarioart mit Q = 1/(R_c kappa), und der Bericht trägt diese Gegenprüfung (und daneben den repräsentativen Q-Wert des Jamming-Szenarioart). Der Rauschboden ist k T_sys mit T_sys = T_ant + { "290" } K (F - { "1" }). Der Wasserfall mittelt jede Zelle über ihren Bin und ihre Zeile (Chirps exakt, ganze Sweeps plus den partiellen; Jammer, die mitten in einer Zeile schalten, nach ihrem Tastverhältnis), sodass die C/N0-Zeitleiste und das Bild aus denselben Zahlen stammen; result.json enthält das in der Leistung blockgemittelte Gitter, pro Band C/N0 und J/S je Zeile sowie pro Jammer und Band SSC, Q, J/S, Inband-J/S und stationäres C/N0. Optional [iq]: das Modell als komplexes IQ zu einem Zeitpunkt gezeichnet, in eine SigMF-Aufzeichnung (cf32_le oder ci16_le) geschrieben und daraus zurückgelesen und mit einer Welch-Schätzung verglichen. Optional [recording] (native Builds): die Welch-PSD einer realen SigMF-Aufzeichnung neben dem Modell. VALIDATED: die Signal-PSDs gegen die Lehrbuch-Hauptkeulenbreiten (BPSK(n) 2n x { "1.023" } MHz Nullstelle zu Nullstelle; BOC({ "1,1" })-Keulen zentriert bei +/-1.023 MHz) und die spektralen Trennungskoeffizienten gegen ihre geschlossenen Formen nach Parseval und Q = { "1" } (CW) und { "1.5" } (angepasst) nach Kaplan & Hegarty. MODELLED: Jammer-Leistungen, Zeitleiste, Front-End-Bandbreiten, die Behandlung als kontinuierliches Spektrum (keine Codelinien) und das Fehlen von AGC, Blanking und Antennendiagramm.

seg-a349aa76b0ed = PARTNER
