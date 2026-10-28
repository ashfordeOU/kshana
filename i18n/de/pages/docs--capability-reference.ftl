# docs--capability-reference: translations (de)

# text
seg-f4f59f19e091 = Fähigkeitskarten

# text
seg-501d3a72ea43 = Integrität

# text
seg-20db2c79b998 = Validiert

# text
seg-29e58493fdd4 = Modelliert

# text
seg-298cc35fe9d1 = Inertial

# text
seg-b03984610dc0 = Lunar

# text
seg-f1f903f1b9ff = Resilienz

# text
seg-bd64cfb4dc52 = Bahnpropagation & Konstellationsentwurf

# text
seg-a7cfe6f135f1 = Bahn & Geometrie

# text
seg-3060564c3e21 = 666/666 AIAA-Vektoren · { "4.12" } mm

# text
seg-5b265eaf8f29 = SGP4/SDP4-Propagation aus echten Two-Line-Elementen (ein eingecheckter Celestrak-GPS-Schnappschuss) oder aus synthetischen Walker-Konstellationen, deren mittlere Elemente die Formel i:T/P/F über { "24" } h auf unter { "1" } km umsetzen. Sichtbarkeit bei mehreren Konstellationen, Dilution of Precision und GNSS-Verfügbarkeit, ein Optimierer für den Konstellationsentwurf, Dimensionierung nach Streets-of-Coverage und ein Walker-Entwurfs-Sweep, der die Pareto-optimalen Entwürfe über einem Raster aus Ebenen × Satelliten ausgibt.

# text
seg-66e33b899daf = Cowell-Propagator & Kraftmodell mit sechs Störungen

# text
seg-a5a572db3bed = Numerischer Propagator

# text
seg-52a4410a54da = konservative Stufen < { "0.08" } m / { "24" } h gegenüber Orekit { "12.2" }

# text
seg-463ed85c6e40 = Ein numerischer Propagator (Cowell) als Ergänzung zum analytischen SGP4/SDP4-Pfad, mit hierarchischem Kraftmodell: Zweikörperproblem + das volle zonale Feld J2–J6, ein optionales tesserales Geopotenzial EGM2008 bis Grad/Ordnung { "70" }, epochengesteuerte Drittkörper-Gravitation von Sonne und Mond (eine eingebaute Ephemeride, kein DE/SPK-Kernel), Strahlungsdruck der Sonne mit konischem Kern- und Halbschatten, atmosphärischer Widerstand, die postnewtonsche relativistische Schwarzschild-Korrektur und der Lense-Thirring-Term des Frame-Dragging — angetrieben wahlweise von adaptiven Integratoren mit RK4-Schrittverdopplung oder Dormand-Prince RK5({ "4" }).

# text
seg-797370a2faef = Zündungen, Lambert & Porkchop

# text
seg-57b120fb0aac = Manöver & Trajektorienentwurf

# text
seg-5081c84dfdd7 = Tsiolkovsky < { "0.01" } % · Lambert-Rundreisen auf die Zweikörper-Truth

# text
seg-da6b16ebd59b = Impulsive ΔV-Knoten mit Kovarianzfortpflanzung { "6" }×{ "6" }, Integration endlicher Zündungen, gegen die Raketengleichung von Tsiolkovsky auf unter { "0.01" } % geprüft, ein Lambert-Löser nach Izzo-2015 für einen einzelnen Umlauf und ein exakter Kepler-Propagator mit universellen Variablen sowie ein Porkchop-Sweep (Start × Ankunft) für C3 / Ankunfts-V∞, ausgegeben als JSON-Konturraster — die Schicht für Leistungssimulation oberhalb von GMAT/Orekit.

# text
seg-831552a45712 = Zeitskalen & Erdorientierungs-Bezugssysteme

# text
seg-76b323512350 = Zeitsysteme

# text
seg-60208bd726eb = bitgenau gegenüber SOFA/ERFA · Vallado durchgängig { "4" } mm

# text
seg-42373dd9ca64 = IERS-Skalen UTC / TAI / TT / UT1 mit Schaltsekunden, eine Julianisches-Datum-API, der Erdrotationswinkel nach IAU-2000, auf GMST beruhende geodätische Bezugssysteme TEME ↔ ECEF und WGS-84, vollständige Nutation IAU 2000A/2000B und Präzession IAU { "2006" } sowie die äquinoktiumsfreie, auf CIO beruhende Reduktion GCRS↔ITRS nach IAU 2006/2000A mit Polbewegung nach IERS — bitgenau gegen die SOFA/ERFA-Vektoren validiert und unabhängig gegen ANISE (reines Rust-SPICE) gegengeprüft: GCRS→ITRS gegenüber ANISE ITRF93, gleiche IERS-EOP, stimmen auf ≤ { "0.86" } m am Boden / ≤ { "3.6" } m in der GNSS-Bahn überein.

# text
seg-dd766880e73a = Vorhersage der Erdorientierung in Echtzeit

# text
seg-54169bca19e9 = { "12" } Vorlaufzeiten gegenüber archiviertem Bulletin A: UT1 { "2.93" } ms, Polbewegung { "1.76" } mas

# text
seg-81be07e41d1c = Ein Prädiktor für die Erdorientierung im Betriebsstil — Kleinste Quadrate über Versatz, Rate und die wichtigsten periodischen Terme innerhalb eines nachlaufenden Fensters — gemessen an tatsächlich archivierten Vorhersagen des Bulletin A statt an Persistenz. Die Standardeingabe im Offline-Betrieb ist ein echtes IERS-Produkt finals2000A mit Vorhersagezeilen des Bulletin A, sodass ein bloßer Lauf eine gefüllte Tabelle je Horizont ausgibt statt einer leeren. UT1 und Polbewegung werden über eine gemeinsame Zeilenmenge zusammen mit ihrer Kombination berichtet, sodass die gemeinsame Kennzahl eine einzige Statistik ist und keine quadratische Summe zweier verschiedener Stichproben.

# text
seg-0e18bc4add10 = Strapdown-INS & kartengestützte Navigation

# text
seg-26561c9a96a7 = CAI-Beschleunigungsmesser aus ersten Prinzipien · abgeleitetes VRW gegen einen unabhängigen Integrator gegengeprüft

# text
seg-d18714ee32fb = Dreiachsiges Strapdown-INS — Quaternionen-Lage, WGS-84-NED-Mechanisierung, Coning-/Sculling-Kompensation und ein vollständiges deterministisches IMU-Fehlermodell — plus ein Atominterferometer-Beschleunigungsmesser mit kalten Atomen aus ersten Prinzipien (Mach-Zehnder-Phase, Projektionsrauschen, Kontrastabfall, Schwingungskopplung) und ein Partikelfilter für gelände- und schwerereferenzierte Navigation ohne GPS.

# text
seg-0e44bdf12d16 = Inertiale und geländerelative Überbrückung eines Ausfalls

# text
seg-07cb40aa5cd1 = { "10" } m bei { "249" } s, { "50" } m bei { "595" } s, bei beiden dominiert der Beschleunigungsmesser-Bias

# text
seg-d5df17e4425b = Positionsfehler gegenüber der Überbrückungsdauer aus einem IMU-Fehlerbudget — Bias, Random Walk und Skalenfaktor, jeweils mit eigenem Wachstumsgesetz und eigenem Anteil an der Überschreitung —, sodass die Kosten eines Navigationsausfalls eine berechnete Kurve sind und keine durchgefahrene Driftrate. Schwellenüberschreitungen sind Engine-Ausgabe, bei jeder wird der dominante Beitrag genannt, über vier IMU-Güteklassen, und ein Intervall für Geländefixes wird in einem eigenen Block bewertet, sodass die Hauptüberschreitungen ungestützt bleiben.

# text
seg-6631a5d69c84 = Schwere-, Gelände- & Magnetkarten-Zuordnung

# text
seg-6af8e99df46d = Alt-PNT (ohne GPS)

# text
seg-72527f4459c7 = 60 min ohne GPS · ~{ "145" } m (< { "500" } m)

# text
seg-89bd5fb3e90b = Ein Messmodell für ein Gravimeter mit kalten Atomen, dessen Weißrauschgrenze aus der Physik des CAI-Beschleunigungsmessers abgeleitet ist, ein vollständig normiertes Schwereanomalie-Feld aus Kugelfunktionen niedrigen Grades plus synthetische Mascons und ein Partikelfilter für die Schwerekarten-Zuordnung — erweitert auf geländereferenzierte Navigation gegen ein SRTM-Höhenmodell (TERCOM/SITAN), ein geomagnetisches Hauptfeld IGRF-14 bis Grad/Ordnung { "13" } und einen kombinierten Schwere-, Magnetfeld- und Gelände-Navigator, der alle drei skalaren Kanäle fusioniert. Ein 60-Minuten-Benchmark ohne GPS — ein Ausfall von ~{ "700" } km / einer Stunde, in dem die Inertiallösung auf ~{ "70" } km driftet — wird von einem hierarchischen Grob-zu-Fein-Matcher auf ~{ "145" } m zurückgeholt: das Ziel des ESA NAVISP Quantum Wayfarer.

# text
seg-dbd63be796ff = GNSS-/INS-Sensorfusion

# text
seg-f9582184adea = Fusion

# text
seg-f2166e96405f = eng gekoppelter UKF · { "0.77" } m RMS

# text
seg-d6ad19d1d47b = Ein EKF im Fehlerzustand mit 15 Zuständen, der GNSS-Ausfälle auf einer kalibrierten Inertiallösung überbrückt; ein eng gekoppelter Pseudoentfernungsmodus, der auch mit weniger als vier Satelliten weiter korrigiert; ein gekoppeltes Filter für Uhr + Position; ein allgemeiner Unscented-Kalman-Schätzer (Sigma-Punkte); ein eng gekoppelter GNSS/INS-UKF-Navigator, der über einen Ausfall von { "120" } s auf einem kurvigen LEO-Überflug bis { "0.77" } m RMS validiert ist; und ein vollständiger eng gekoppelter GNSS/INS-UKF mit 17 Zuständen, dessen Quanten-CAI-Koppelnavigation den Ausfall auf dem abgeleiteten Geschwindigkeits-Random-Walk des Beschleunigungsmessers mit kalten Atomen überbrückt.

# text
seg-4af862bd1307 = Batch- & sequenzielle OD

# text
seg-ca67c864635c = Bahnbestimmung

# text
seg-948441304a32 = Batch- + sequenzielle OD gegenüber Orekit { "12.2" } BatchLSEstimator/KalmanEstimator

# text
seg-22e738b2ab57 = Wiedergewinnung eines Bahnzustands aus Entfernungsmessungen von Bodenstationen, bestehend aus dem Kraftmodell Zweikörper + J2 und dem RK4-Integrator, kombiniert mit einem Gauss-Newton-Batch-Differentialkorrektor (Submeter / mm·s⁻¹ aus rauschfreien Entfernungen, ~{ "2" } m bei einer Rauschgrenze von { "5" } m) und einer sequenziellen Variante mit Unscented-Filter.

# text
seg-06406b3d0b88 = Fisher-Information & Beobachtbarkeit

# text
seg-4e28248ef77b = Beobachtbarkeit & Schätztheorie

# text
seg-a5b38d0a8d64 = Eigenwerte gegenüber numpy.linalg.eigh · CRLB gegenüber σ²(XᵀX)⁻¹ über numpy.linalg.inv · GNSS-DOP aus der Informationsmatrix, alles auf { "1e-9" } · geschlossene Formen nach Kay ({ "1993" }) + Erreichen der Monte-Carlo-CRLB

# text
seg-3ee5597d6f8a = Eine allgemeine, wiederverwendbare Schicht für Fisher-Information / Cramér-Rao (src/fim.rs): die Informationsmatrix M = HᵀWH, die untere Cramér-Rao-Schranke, der Beobachtbarkeitsrang und der Nullraum des Datumsdefekts (Moore-Penrose-Pseudoinverse) sowie D/A/E/T-optimale Skalare für den Versuchsentwurf aus einem symmetrischen Jacobi-Eigenlöser. Sie liegt der DOP-Engine, der Schranke für passive Geolokalisierung und dem Ergebnis zur Beobachtbarkeit lunarer Absolutstationen zugrunde — interne Entfernungsmessung hinterlässt einen sechs Freiheitsgrade umfassenden Starrkörper-Datumsdefekt, den eine VLBI-Anbindung an die Erdbasislinie für eine dünne Konstellation wiederherstellt und für eine dichte schärft, wobei sich das absolute Datum bei drei nicht kollinearen Erdstationen schließt.

# text
seg-ed467622dbd0 = CR3BP-Propagation & LunaNet-Integrität

# text
seg-e386dced1d16 = Lunar & cislunar

# text
seg-f444bc39efbe = Reproduziert die veröffentlichte NRHO L2 { "9" }:{ "2" } (~{ "6.57" } d Periode · ~{ "3,250" } km Perilun); STM gegen finite Differenzen geprüft

# text
seg-272afbca5e48 = Ein Propagator für das eingeschränkte Dreikörperproblem Erde–Mond (CR3BP) im rotierenden Bezugssystem — eine erhaltene Jacobi-Konstante und alle fünf Lagrange-Punkte — mit einer Zustandsübergangsmatrix { "6" }×{ "6" } und einem Differentialkorrektor mit Einfachschießen, der echt periodische Halo- / nahezu geradlinige Halo-Bahnen (NRHO) erzeugt: Er reproduziert die veröffentlichte südliche NRHO L2 { "9" }:{ "2" } (die Gateway-Bahn) mit einer Periode von ~{ "6.57" } Tagen und einem Perilun von ~{ "3,250" } km. Dazu die cislunare PNT-Geometrie nach LunaNet / LNIS (Reduktion MCI↔MCMF, selenographische Koordinaten) mit einem ARAIM-Überflug am lunaren Südpol, der die Integritätslücke ehrlich offenlegt: Ein σ_URE von ~{ "30" } m treibt das Schutzniveau weit über eine Alarmgrenze von { "50" } m.

# text
seg-619f89bf160c = Realisierung des lunaren Bezugssystems

# text
seg-c6b12768a219 = gegenüber numpy/scipy Umeyama-Horn-SVD

# text
seg-29327b86ea27 = Realisiert ein lunares körperfestes Bezugssystem aus einer Beobachtungskampagne: eine gewichtete Ähnlichkeitsanpassung nach Gauss-Newton über die Geometrie Station–Reflektor, die das Datum, seine Kovarianz und die am schlechtesten bestimmte Achse ausgibt. Das gekoppelte Gauge aus Bezugssystem und Zeitskala wird ausdrücklich mitgeführt statt aufgesogen, sodass der Rangdefekt im Bericht sichtbar ist und nicht in einer Pseudoinversen vergraben.

# text
seg-b3ba1e7b197d = Servicevolumen der lunaren Navigation & ARAIM

# text
seg-353878596468 = ANISE { "0.10.2" } Bahnen · RTKLIB 2.4.2-p13

# text
seg-70b9c02c1f6a = Durchfährt eine illustrative Konstellation der Klasse Moonlight/LCNS über einem selenographischen Raster: Sichtbarkeit, Dilution of Precision, Abdeckung und ARAIM-Schutzniveaus je Epoche gegenüber einer einstellbaren Alarmgrenze. Die Entfernungsmessgenauigkeit des Signals im Raum ist ein Parameter, sodass der Sweep eine Anforderung an die Entfernungsmessung über das gesamte Volumen beantwortet statt eines Bestanden/Nicht-bestanden bei einem festen Wert.

# text
seg-a94db5b03c9c = Lunares Interoperabilitätsbudget über Anbieter hinweg

# text
seg-a2e8a8dfd666 = DE440 · INPOP21a · EPM2021 über calceph

# text
seg-646a00230694 = Misst, wie weit drei unabhängige maßgebliche lunare Ephemeriden tatsächlich voneinander abweichen, und macht daraus ein Entwurfsgesetz: das Fehlerbudget aus Bezugssystem gegenüber Ephemeride, das ein Nutzer mit gemischten Anbietern erbt, und die Konsistenztoleranz, die ein Anbieter einhalten muss, um dieses Budget innerhalb einer angegebenen Grenze zu halten.

# text
seg-0f359c118090 = Autonome Fehlerbeobachtbarkeit in einem freien Netz

# text
seg-ae99396c03bd = gegenüber unabhängiger numpy/scipy-Paritätsalgebra

# text
seg-51828c93731b = Die lineare Algebra, die eine selbstreferenzielle lunare Konstellation braucht, um ihre eigenen Fehler ohne Truth zu erkennen: der gewichtete Paritätsprojektor in der rangdefizienten Pseudoinversen-Form, die das Gauge aus Datum und Zeitskala übersteht, die Erkennbarkeit je Knoten, die kleinste erkennbare Abweichung nach Baarda sowie byzantinische Block-Spark-Zählungen zur Erkennung/Identifikation über echter DE440-Geometrie zwischen den Knoten.

# text
seg-65d239fc4894 = Lunares Bezugssystem-Datum aus echter Laserentfernungsmessung

# text
seg-c92dd319fa36 = { "337" } ILRS-Normalpunkte · Median { "5.13" } mm

# text
seg-2f7f950518be = Ersetzt die simulierte Kampagne durch echte Daten: { "337" } archivierte Normalpunkte der ILRS-Laserentfernungsmessung zum Mond über fünf Retroreflektor-Arrays, jede Beobachtung gewichtet mit ihrer eigenen, aus der Datei entnommenen aufgezeichneten Präzision. Die Reflektorkoordinaten sind ein DE440-Katalog in Hauptachsen, der unter eigenem Dateinamen geführt wird, getrennt von der Tabelle DE430 mit mittlerer Erde — füttert man die Rotation des einen mit dem anderen, verschiebt sich ein Reflektor um Hunderte von Metern, und nichts schlägt an, weil beide wohlgeformte Koordinaten sind.

# text
seg-2db69c58f694 = Lunares differenzielles PNT

# text
seg-32adcb9b1b02 = Exakte Gleichtaktidentität · modellierte Dekorrelation

# text
seg-d4ac8cbac83e = Differenzielle Korrekturen zwischen einer lunaren Referenzstation und einem Nutzer. Die Gleichtaktauslöschung ist eine exakte Identität; der Rest der räumlichen Dekorrelation ist ein geometrisches Modell erster Ordnung, das mit der Basislinie wächst, und das Restbudget der Korrekturverbindung wird daneben ausgewiesen, damit der begrenzende Term sichtbar bleibt und nicht in einer einzigen Zahl aufgeht.

# text
seg-9b83e78dcd7b = Lunare Zeitskalen & geodätisches VLBI

# text
seg-bcd769beab07 = Kreuzungstabelle je Uhrenklasse

# text
seg-80107b7841bf = Kreuzungszeiten je Uhrenklasse für eine lunare Zeitskala — wann eine Oszillatorklasse ohne Aktualisierung eine angegebene Grenze nicht mehr einhält — zusammen mit einer lunaren geodätischen VLBI-Observablen und der Fisher-Information, die sie zum Datum beiträgt.

# text
seg-99084680c321 = Echte, abgerufene Geometrie lunarer Konstellationen

# text
seg-a7be7d68e767 = { "5" } eingecheckte Fixtures, jedes aus seiner aufgezeichneten Quelle neu erzeugbar

# text
seg-d3591b4b4633 = Das Servicevolumen läuft auf veröffentlichten Konstellationsentwürfen statt auf einem illustrativen: dem Referenzsatz mit fünf Satelliten aus der Interoperabilitäts-Demonstration LANS, den Fallstudien LNCSS mit { "8" }, { "12" } und { "16" } Satelliten und den vier Raumfahrzeugen, die am 2023-01-01 tatsächlich in lunarer Umlaufbahn waren, aus JPL Horizons. Jede Datei nennt ihr eigenes Bezugssystem und ihre eigene Herkunftsklasse, ein Horizont jenseits des Endes einer tabellierten Ephemeride wird abgewiesen statt extrapoliert, und das illustrative Kepler-Ergebnis wird neben dem abgerufenen ausgegeben, mit der Differenz zwischen beiden, und wird nie durch es ersetzt.

# text
seg-807b9fc7b517 = Lunare Sperrkontur aus einer gemessenen C/N₀-Streuung

# text
seg-a908030a9fcc = Abstand { "49.2" } km nach Leistungsverhältnis gegenüber { "19.4" } km nach Lock-Verlust

# text
seg-3ee440e8b619 = Verhältnis von Störer zu Signal je Satellit über echte lunare Schrägentfernungen, wobei die Seite des Nutzsignals als Verteilung geführt und nicht auf einen Median reduziert wird, sodass die Sperrkontur das Unsicherheitsband trägt, das die Relaisgeometrie tatsächlich erzeugt. Zwei Kriterien werden nebeneinander ausgewiesen: die Schwelle für das Leistungsverhältnis und der aus der Dynamik der Tracking-Schleife berechnete Lock-Verlust. Der orbitale Einfangbereich wird über Senderhöhe und Strahlbreite durchfahren, und wo das Raster den Einfang am Rand nie erreicht, sagt der Bericht das und gibt die Lücke aus.

# text
seg-229134190045 = VLBI-Plan zur Kovarianz der Stationskoordinaten

# text
seg-547181855481 = Rang { "6" }, Defekt { "0" }; Defekt des freien Netzes { "1" }, als gemeinsame Translation benannt

# text
seg-6d147beefb43 = Summiert die Partiellen der lunaren VLBI-Verzögerung zu einer Fisher-Informationsmatrix über einen Plan aus Basislinien mal Epochen und liefert die Kovarianz der Stationskoordinaten, sodass der Schritt von der Verzögerungspräzision zum Koordinaten-Sigma geschätzt statt angenommen wird. Das freie Netz wird neben dem datumsfixierten ausgewiesen, mit seinem Rangdefekt und der benannten nicht beobachtbaren Richtung. Die Kovarianz des Oberflächenpunkts wird von der der Erdstation getrennt gehalten, weil die Nahfeld-Partielle des Beacons eine Differenz zweier Stations-Einheitsvektoren ist und sich nicht wie der Fernfeldfall verhält.

# text
seg-028833cc45bc = Radiometrische Navigation & Relais-PNT

# text
seg-6c94ae122721 = Deep-Space- & Mars-PNT

# text
seg-ef21cd4b1962 = Durch Simulation validiert (Kovarianz- / Regelkreis-Gütezahlen, keine zertifizierten Schutzniveaus); die sonnenzentrische Mars-Dynamik ist gegen JPL DE440 auf { "137" } m @ einem 1-Tages-Bogen gegengeprüft; Mars-LMO OD ≈ { "0.2" } m.

# text
seg-469988966702 = Eine offene radiometrische Navigations-Engine für Deep Space / Mars: iterative Lichtlaufzeit + Shapiro-Verzögerung, Zwei-/Ein-/Drei-Weg-Doppler und -Entfernung (Moyer, zwei Abschnitte), kohärente Transponder-Umsetzung, regenerative/PN-Entfernungsmessung und Δ-DOR; CCSDS-TDM-Ein-/Ausgabe; ein reduziert-dynamischer Square-Root-Information-Filter (empirische Beschleunigungen + Bordzeit + Mars-Luftwiderstand), der die Bahnbestimmung im niedrigen Marsorbit in einem synthetischen geschlossenen Regelkreis ausführt; Fusion von Ein-Weg und Zwei-Weg; und eine areostationäre MARCONI-Relaiskonstellation mit einem durchgängigen GSE-Leistungssimulator.

# text
seg-b4284bd2629e = Optische und HF-Übergabe mit modalitätsübergreifender Integrität

# text
seg-ae131bc1ba67 = Optisches / HF-PNT

# text
seg-1b25468c9780 = Kleinste erkennbare Abweichung { "8.20" } m horizontal, { "12.30" } m vertikal, { "24.6" } ns Zeitgebung

# text
seg-a5387333ab2d = Fehlereinspeisung verleiht dem modalitätsübergreifenden Monitor eine Erkennungsleistung statt eines fehlerfreien Durchlaufs: je Achse eine kleinste erkennbare Abweichung bei einem angegebenen Budget für Fehlalarm und Nichterkennung. Nach einer Übergabe wird das Wiederanwachsen der Kovarianz gegen die Alarmgrenzen propagiert, sodass der Bericht angibt, wie lange die Lösung mit einer einzelnen Modalität innerhalb dieser Grenzen bleibt, statt nur, dass die Übergabe durchgängig war. Die optischen und die HF-Entfernungsmessstrecken werden nur bei gleicher Akkumulationszeit und gleichem Pfad verglichen, und der Bericht weigert sich, ein Verhältnis gegen einen Wert zu bilden, der gewählt statt gemessen wurde.

# text
seg-00cb9df27979 = Autonome Integrität im Empfänger (ARAIM)

# text
seg-f86ecc2fda8e = MHSS auf einem echten GPS- + Galileo-Schnappschuss · DO-316 mit zwei Konstellationen

# text
seg-841a6f3f0277 = RAIM per Schnappschuss und per Lösungstrennung mit horizontalen und vertikalen Schutzniveaus (HPL/VPL), Fehlererkennung und -ausschluss sowie Stanford-Integritätsdiagrammen — plus ein Schutzniveau mit ausdrücklichem Integritätsrisikobudget (MHSS) mit dem konstellationsweiten Fehlermodus für zwei oder mehr Konstellationen (EU-ARAIM / DO-316).

# text
seg-695aa5c57d83 = ARAIM gegenüber veröffentlichten Referenzvektoren

# text
seg-08f9dd480ba7 = Größter Fehler { "0.044" } m gegenüber der eigenen Toleranz der Quellen von { "0.05" } m

# text
seg-68185dd65478 = Die MHSS-Schutzniveaus der Engine laufen gegen die eigenen veröffentlichten durchgerechneten Beispiele des Referenz-Luftfahrt-Algorithmus der Arbeitsgruppe C von EU und USA, jeweils transkribiert mit Abruf-URL, Datum, Seite und SHA-256 der Datei und an zwei Stellen geführt, deren Übereinstimmung ein Test prüft. Der Abnahmevektor ist der in sich konsistente Reference Airborne Algorithm Description Document v3.1, Anhang D. Der Bericht zu Meilenstein { "3" } enthält zwei interne Fehler — einen Vorzeichenfehler in der Geometrie und einen Fehlalarm-Multiplikator, der bei { "57" } Fehlermodi ausgewertet wird, obwohl der Text einen nennt —, sodass seine Schutzniveaus als gemessene Abweichungen ausgewiesen statt bewertet werden und die Fehler durch Ausführen der eigenen Zahlen des Dokuments gezeigt werden.

# text
seg-17b28b3cf1fa = Schutzniveaus SBAS / WAAS & Zweifrequenz

# text
seg-99766b79a00a = Ergänzung (SBAS)

# text
seg-4cfec990b19b = K-Faktoren nach DO-229E · L1/L5 ionosphärenfrei

# text
seg-ef3a5513bbd8 = SBAS-/WAAS-Schutzniveaus in der gewichteten Form der kleinsten Quadrate nach DO-229E (K-Faktoren für Präzisionsanflug und Streckenflug) und die ionosphärenfreie Zweifrequenz-Kombination L1/L5 (IS-GPS-705), die DO-316 zugrunde liegt, wobei die Geometrie des Schutzniveaus gegen eine Referenzimplementierung der linearen Algebra gegengeprüft wird.

# text
seg-0a5bd5230c32 = Holdover, Stabilität & Zeit- und Frequenzübertragung

# text
seg-69a0269c4732 = Uhr & Zeitgebung

# text
seg-641ae762b453 = kalibriert auf Uhren-Datenblätter · Holdover gegen die Kovarianz-Rekursion nach van Loan gegengeprüft

# text
seg-6f1c2e1f0bf4 = Holdover mit Kalman-Filter mit zwei Zuständen, Stabilität der Allan-Familie (ADEV / MDEV / TDEV / HDEV) mit Konfidenzintervallen und eine vollständige Potenzgesetz-Anpassung mit fünf Koeffizienten nach IEEE-1139 sowie die operativen Übertragungsverfahren — TWSTFT mit der geschlossenen Sagnac-Form des BIPM, GNSS Common-View, ionosphärenfreie PPP-Übertragung, eine optische Freiraumstrecke mit Turbulenz-Szintillation und eine Ensemble-Zeitskala von Uhren mit inverser Varianz. Ein Rechner für den GNSS-freien Uhren-Holdover invertiert das Wachstum des Überbrückungsfehlers nach van Loan zu einem Holdover bis zur Schwelle — wie lange eine Uhr frei läuft, bis ihr Zeitfehler das Budget übersteigt — über klassische und Quantenuhren-Klassen hinweg; modelliert, und ehrlich darin, dass bei einer sehr stabilen Uhr der Holdover bis zu einer engen Schwelle vom angenommenen Rauschboden bei langem Tau bestimmt wird und nicht von der zitierten ADEV.

# text
seg-85b181275293 = Pseudoentfernung, Ionosphäre & Troposphäre

# text
seg-835df2d05f2a = GNSS-Messungsbereich

# text
seg-ef01abb1cfe8 = Saastamoinen ZHD ≈ { "2.3" } m · Niell eins im Zenit · Klobuchar nach IS-GPS-200

# text
seg-43c0372fe6e7 = Vorwärtssynthese von Pseudoentfernung / Doppler mit Ionosphäre nach Klobuchar (Broadcast) und IONEX / TEC-Raster (gemessen) — einschließlich eines IONEX-Dateiparsers, Zeitinterpolation und der Abbildung der Schrägneigung in der dünnen Schicht — Troposphäre nach Saastamoinen + Niell und RAIM per Schnappschuss.

# text
seg-3458cb02f156 = Einzelpunktpositionierung (PVT)

# text
seg-640e4cd9f008 = GNSS-Positionierung

# text
seg-4fa43feda96a = Validiert an echten IGS-Daten (Station ABMF, 2018-05-13) auf { "5.7" } m 3D-RMS / { "1.1" } m horizontal gegenüber der vermessenen Koordinate.

# text
seg-b107ba0607b0 = Eine echte Empfängerposition, gelöst aus echten RINEX-Code-Pseudoentfernungen + Broadcast-Ephemeride durch iterierte gewichtete kleinste Quadrate — Sagnac-/Erdrotationskorrektur, Broadcast-Uhr mit TGD, die ionosphärenfreie Zweifrequenz-Kombination L1/L2 (oder Einfrequenz-Klobuchar), Troposphäre nach Saastamoinen/Niell, Elevationsgewichtung, DOP und RAIM per Schnappschuss.

# text
seg-5819c351d123 = Jamming & mehrschichtige Spoofing-Erkennung

# text
seg-9a03f3db9ef0 = χ²₁-NP-Detektor · geschlossene Form und Monte-Carlo-P_fa/P_md stimmen überein

# text
seg-788fdc9a22a1 = Ein Jamming-Modell auf Basis des Link-Budgets (J/S → effektives C/N₀ → Lock-Verlust), ein stochastischer Detektor für Zeit-Spoofing (Neyman-Pearson- / χ²₁-Energietest mit Monte-Carlo-P_fa/P_md und einer Security-Gütezahl von { "1" } − P_md) und ein mehrschichtiger Spoofing-Detektor, der einen RAIM-Konsistenz-Paritätstest, einen HF-AGC-Leistungsmonitor und einen Signalqualitätsmonitor (SQM) fusioniert. Dazu ein Fehlerbudget für die Quanten-Inertial-Koppelnavigation, das das Weißrauschen-Driften des Atominterferometers mit kalten Atomen mit Restbias (gegen einen unabhängigen Integrator gegengeprüft) und Skalenfaktorfehler zu einer Positionsdrift über den Holdover zusammensetzt — der inertiale Zwilling des Uhren-Holdover.

# text
seg-87bca15c6939 = Modulation, Anti-Jam & Code-Tracking

# text
seg-c7d3ff7ea829 = Leistung des Navigationssignals

# text
seg-1aec700caefe = BPSK-Eigen-SSC = 2/(3R_c) · C/A-DLL-Jitter im Submeterbereich bei { "45" } dB-Hz · GPS-C/A-Gold-Kreuzkorrelation -23.9 dB

# text
seg-304803ee178d = Die Schicht für die Signalleistung zwischen Link-Budget und Messungsbereich: Leistungsdichtespektren mit Einheitsfläche für BPSK-R(n) und Sinus-BOC(m,n), den spektralen Trennkoeffizienten, der das Anti-Jam-Q, das das Jamming-Modell verbraucht, direkt aus den tatsächlichen Signal- und Jammer-Spektren ableitet, die RMS-Bandbreite (Gabor), die den Informationsgehalt der Entfernungsmessung festlegt (BOC > BPSK), das thermische Rauschjitter der kohärenten Early-Late-DLL-Codeverfolgung und die kohärente Mehrwegefehlerhülle Early-minus-Late mit Unterdrückung durch den Schmalkorrelator sowie einen Entwurfs-Trade für Entfernungsmesscodes (Autokorrelations-Nebenmaxima von m-Sequenz/Gold und die dreiwertige Kreuzkorrelationsschranke von Gold, plus die Inversion von Codelänge zu eindeutiger Entfernung). Dies ist eine Analyse der Signalleistung, kein Entwurf von HF-Nutzlast- oder Antennenhardware.

# text
seg-684494a7877c = Passive HF-Geolokalisierung (TDOA/FDOA)

# text
seg-414872cdf952 = Passive HF-Geolokalisierung

# text
seg-bed5944d15dd = rauschfreies TDOA vorwärts→invers auf { "1e-6" } m · J·CRLB = I · GDOP monoton in den Empfängern · der Schätzer erreicht seine CRLB über { "4000" } Monte-Carlo-Versuche

# text
seg-be8f2a419275 = Einen Jammer oder Spoofer (oder eine Gelegenheitsquelle für Reverse-PNT) aus Hyperboloiden der Ankunftszeitdifferenz über ein Empfängernetz orten, gelöst mit kleinsten Quadraten nach Gauss-Newton; die Hinzunahme der Ankunftsfrequenzdifferenz mit bewegten Empfängern gewinnt Position und Geschwindigkeit des Senders gemeinsam zurück, mit der Cramér-Rao-Schranke für die Positionskovarianz aus der Netzgeometrie. Ein Punktquellen-Modell mit Sichtverbindung — ohne Mehrwege-/NLOS-, Empfängeruhr-Bias- oder Refraktionsterme.

# text
seg-48e98ff7065e = Formate RINEX, SP3 & CCSDS

# text
seg-7c6f4dc6bcba = Interoperabilität

# text
seg-ae8dc649ab26 = Broadcast-Ephemeride + SP3-Interpolation gegenüber RTKLIB; OEM gegenüber einem unabhängigen CCSDS-Parser

# text
seg-75aae4d201fd = Einlesen von Multi-GNSS-RINEX-3-Broadcast-Ephemeriden (GPS, Galileo, QZSS, BeiDou, GLONASS), ein Parser für RINEX-3-Beobachtungen (das Beobachtungslayout von RINEX { "4.00" } soll sich parsen lassen, doch keine { "4.00" }-Datei wurde damit gelesen; Navigationsdateien von RINEX { "4" } werden namentlich abgewiesen), ein SP3-c/d-Leser/-Schreiber für präzise Ephemeriden mit Lagrange-Interpolation und der Export CCSDS OEM { "2.0" } + OMM (mittlere Elemente) für Flugdynamik-Werkzeuge (GMAT, Orekit, STK) sowie Parsen und Ausgeben von CCSDS-TDM ({ "503" }) für radiometrisches Tracking im Deep Space.

# text
seg-1f379e235f5f = Maschinell geprüfte Verifikationsmatrix

# text
seg-a4d10bb41065 = Verifikation & Qualitätssicherung

# text
seg-72ec664ea7ae = validierte Zeilen verlangen eine unabhängige Referenz (Invariante wird in CI erzwungen)

# text
seg-cab165105f32 = Ein Querverweis von Anforderung über Modul und Test zu unabhängiger Referenz und Status, aus der Engine selbst erzeugt (Markdown/CSV), mit Ehrlichkeits-Invarianten, die per Unit-Test geprüft werden: Eine Zeile darf nur dann als validiert gekennzeichnet werden, wenn sie eine unabhängige externe Referenz trägt (NIST / AIAA / SOFA / IGS / ein veröffentlichter Wert), sodass sich eine interne Selbstkonsistenzprüfung nicht als Validierung ausgeben kann — und die Hardware-/PA-Fähigkeiten, die Kshana nicht bereitstellt, sind als Lücken in der Verantwortung von Partnern festgehalten. Das ausführbare Rückgrat für einen Verifikations-Querverweis nach ECSS-E-ST-10-02.

# text
seg-190cdf3ca8dc = Einheit und Herkunft bei jeder berichteten Größe

# text
seg-3e7fb040a7c4 = Jedes numerische Feld, das ein Szenario ausgibt, trägt eine Einheit und eine Herkunftsklasse aus einem geschlossenen Vokabular, mit einer Definition, wo es eine gibt, veröffentlicht als maschinenlesbares Schema neben der Engine. Ein Gate mit Ratsche lässt jeden eingebauten Typ laufen und scheitert an einem Feld, das keines von beidem trägt; die noch nicht vollständigen Typen werden einzeln mit dem Grund genannt, warum jeder noch offen ist, und die Liste kann nur schrumpfen. Berichte, die ihre eigenen Konstanten nennen — das Ein-Weg-Link-Budget, das optische und das HF-Budget —, lassen einen Leser die Kennzahl allein aus dem Bericht neu berechnen.

# text
seg-0e1a01c9158a = Budgets für Start, Wiedereintritt, Abdeckung & Ausrichtung

# text
seg-f5cf9e86d3c9 = Missionsanalyse

# text
seg-767b2cd5f4ba = gegen geschlossene Formen geprüft (Startazimut · Allen-Eggers · SMAD)

# text
seg-23bac81d700b = Missionsentwurfs-Budgets erster Ordnung, jedes ein ausführbares Szenario: Start- und Aufstiegsgeometrie im Zweikörperproblem (Startazimut, Mindestneigung, Gewinn aus der Erdrotation, Δv für Ebenenwechsel im Dogleg, tägliche Gelegenheiten), ein ballistischer Wiedereintrittskorridor nach Allen-Eggers (Spitzenverzögerung, Geschwindigkeiten bei Spitzen-g und bei Spitzenerwärmung), Abdeckungsgeometrie der Erdbeobachtung (Schwadbreite / Nadir-GSD / Zugriff außerhalb des Nadirs / Wiederkehr über das SMAD-Raumdreieck), ein 3-DOF-Fehlerbudget für Lage und Ausrichtung (Gravitationsgradientenmoment + RSS-Ausrichtungsbudget), Vorhersage von Bodenstationsüberflügen (AOS/TCA/LOS, maximale Elevation, Zugriff) und ein Ein-Weg-Link-Budget über die Link-Gleichung CCSDS { "401" } / DSN 810-005 (FSPL, C/N₀, Eb/N₀, Marge, Schließung). Die analytische Schicht vor der Hardware unterhalb von STK/GMAT/Basilisk — modellierte Budgets erster Ordnung, kein Ersatz für 6-DoF oder Radiometrie.

# text
seg-43f53b910042 = Gemeinsame Nutzung der Apertur durch Navigation und Kommunikation

# text
seg-989637b0c6fc = Ausfall und Konkurrenz je Sitzung, nicht eine einzige Nutzungszahl

# text
seg-5c63a4559aff = Ein Kontaktplan und eine Anzahl von Aperturen als Eingabe; Navigationsnutzung, Kommunikationsnutzung, Ausfall und Konkurrenz je Sitzung als Ausgabe. Die Arbitrierungsregel wird im Bericht benannt statt vorausgesetzt, und eine Sitzung, die nicht vollständig bedient werden kann, weist den Anteil aus, der verloren ging, statt in einem Mittelwert zu verschwinden.

# text
seg-c8eb43aeb31a = Weltraumwetter & thermosphärische Dichte

# text
seg-37b8c9397544 = Weltraumumgebung

# text
seg-25e24a6c0ba3 = Jacchia-71 gegen veröffentlichte Werte für Sonnenminimum / -mittel / -maximum validiert

# text
seg-1eff250f41c3 = Ein Umgebungsmodell für das Weltraumwetter: solare (F10.7 / auf 81 Tage zentriertes F10.7a) und geomagnetische (Kp, mit der definitorischen Tabelle Kp↔ap) Aktivitätsindizes, die von ihnen getriebene exosphärische Temperatur nach Jacchia-1971 sowie die aktivitätskorrigierte gegenüber der statischen thermosphärischen Neutralgasdichte in der Höhe — die Abhängigkeit der Dichte vom Sonnenzyklus, die eine statische Atmosphäre auslässt. Eine kalibrierte Kopplung der Skalenhöhe erster Ordnung, keine anhand von Daten validierte NRLMSISE-Atmosphäre.

# text
seg-49bac998eb07 = Evaluierung der Erkennung von HF-Beeinträchtigungen & PNT-Abwägung

# text
seg-dca720256d85 = Evaluierung & Abwägung für maschinelles Lernen

# text
seg-5f0a39efe160 = AUC-Harness gegenüber der binormalen geschlossenen Form Φ(d′/√{ "2" }) verifiziert (Gneiting & Vogel { "2018" }); Evaluierungsmetriken bitgenau gegenüber scikit-learn { "1.9.0" } validiert — synthetischer Korpus, keine Roh-IQ/TEXBAT-Daten

# text
seg-0dc3a7135442 = Eine Testumgebung zur Evaluierung der Erkennung von HF-Beeinträchtigungen: ein gelabelter, parametergestützter synthetischer Korpus (nominal / Jamming / Spoofing der Zeit / Spoofing der Position / Mehrwege), ein detektorunabhängiger ROC/AUC-Harness, der jeden Detektor mit Pd je Klasse bei einer Ziel-Pfa bewertet, und die Optimismuslücke innerhalb gegenüber außerhalb der Verteilung. Eine tiefere Studie zur Optimismuslücke erweitert dies auf ein Panel mit 13 Detektoren (Energie / AGC / SQM / Parität plus Detektoren mit logistischer Regression und einem MLP mit einer verdeckten Schicht, jeweils mit festem Seed), Skalierungsgesetze innerhalb gegenüber außerhalb der Verteilung mit einer Permutations-Null und einen Leave-one-out-Prädiktor für die Verschlechterung außerhalb der Verteilung; ein Front-End für softwaredefinierte Empfänger (Roh-IQ/ZF zu Early/Prompt/Late-Abgriffen des Korrelators zu SQM) und Adapter zum Einlesen echter Daten (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) lassen dieselben Detektoren über lokal bereitgestellte Aufzeichnungen laufen. Dazu eine Abwägung Quanten-PNT gegenüber klassischem PNT, die den Nutzen einer Kandidatenuhr für Zeitgebung und inertialen Holdover aus einer gemessenen ADEV-Kurve gegenüber einer klassischen Basislinie quantifiziert, mit einer Hüllkurve für Resilienz über die Zeit ohne GNSS. Modellierte Betriebskennlinien — nie Feld- oder IQ-Daten, kein Gut/Schlecht-Urteil.

# text
seg-8766e058334d = Kreuzungskarte der Resilienz von Quanten gegenüber klassisch

# text
seg-8f851e9cf8c2 = erzeugt die Studien zur inertialen und zur Uhren-Kreuzung hinter den Abbildungen der Ergebnisse neu; Trade-Kerne gegenüber scipy { "1.17.1" } validiert

# text
seg-a057ad4c89ce = Eine reproduzierbare Karte dazu, wo ein Quantensensor sein klassisches Gegenstück unter Parameterunsicherheit überholt: Koppelnavigation mit kalten Atomen gegenüber Navigationsklasse und optischer gegenüber chipskaliger Uhr im Holdover, über Ausfalldauer und Plattformvibration, wobei jede Kurve eine Kennzeichnung des Technologiereifegrads trägt. Reproduzierbar über cargo run --bin crossover_study. Modellierte Leistungsbudgets — die Eingaben sind veröffentlichte oder eingegrenzte Koeffizienten, keine Flugdaten.

# text
seg-6347618838dd = Bedingtes Schutzniveau der Zeitgebung

# text
seg-a846e806e577 = Integrität der Zeitgebung

# text
seg-762bc9f28716 = Komposition gegen die mehrstufige Kovarianz-Rekursion clock_state gegengeprüft; kalibriert auf JammerTest { "2024" } (Zenodo { "15911589" })

# text
seg-3622798325cd = Eine durch den Holdover begrenzte Schranke für den unentdeckten Zeitfehler unter GNSS-Spoofing: Bei einer unabhängigen Gegenprüfung wird der Fehler der gelieferten Zeit begrenzt durch eine k-Sigma-Untergrenze des Monitors, die Überbrückungsvarianz nach van Loan über die Erkennungslatenz und eine CUSUM-Zeit bis zum Alarm. Kalibriert an einem echten aufgezeichneten Spoofing (JammerTest { "2024" }) und reproduzierbar über cargo run --example tpl_jammertest. Modellierte Komposition, bedingt auf die Erkennung — es gibt keine endliche unbedingte Schranke, da eine hinreichend langsame Rampe einem einzelnen uhrengestützten Monitor entgeht.

# text
seg-734a93b6a809 = PNT-Resilienzbewertung & Entscheidungsinstabilität

# text
seg-c25b4e240fb5 = Resilienzbewertung

# text
seg-f42ae8719e02 = { "35" } von Hand abgeleitete Tests gegen eine unabhängige Referenz; byte-deterministisches Studienartefakt (fester Seed); ausgerichtet auf DHS RPCF v2.0

# text
seg-8e69193ca540 = Eine am Rahmenwerk ausgerichtete Bewertungs-Engine (Kategorien des DHS RPCF), die das simulierte Verhalten einer Architektur auf Teilwerte je Dimension abbildet und dann fragt, ob irgendein einzelner zusammengesetzter Wert oder Reifegrad (Level) eine stabile Entscheidungsgrundlage ist — über ein Dirichlet-Gewichtungssimplex, Kendall-Tau-Rangunbeständigkeit, eine Wechselrate des Spitzenreiters auf Platz 1 und den Zusammenbruch der Diversität bei Gleichtakt (Hill-N2) — mit einem Qualitätssicherungsbericht mit Integritäts-Hash. Reproduzierbar über cargo run --example resilience_report. Modellierte synthetische Architekturen, ausgerichtet auf RPCF v2.0; eine Selbstbewertung, keine Zertifizierung.

# text
seg-62ef40799af4 = Erkennungsverfehlung → Integritätsregionen

# text
seg-52e55797d77c = Auswirkung auf die Integrität

# text
seg-99025f66f277 = Integritätsregionen nach Stanford-ESA (Tossaint et al., NAVIGATION { "2007" })

# text
seg-13f23ffe5840 = Eine Brücke von der Erkennungsverfehlung zur Integrität: Eine unentdeckte Abweichung, die eine verfehlte Erkennung von Spoofing / Jamming / RAIM hinterlässt, bläht den effektiven Positionsfehler auf, der — gehalten gegen kontextspezifische Alarmgrenzen — in die Integritätsregionen nach Stanford-ESA eingeordnet wird (verfügbar / nicht verfügbar / irreführend / gefährlich). Setzt die extern verankerte Stanford-Klassifikation für RAIM zusammen; fügt keine neue Integritätsmathematik hinzu.

# text
seg-3a7572774192 = ROI je Abdeckung (Kosten)

# text
seg-797d137dc022 = Entscheidungsunterstützung

# text
seg-d77993b6ef59 = Eine ROI-Sicht auf die Kosten je Abdeckung — Kosten je Einheit gelieferter Abdeckung für eine Abwägung zwischen Konstellationen / Architekturen. Die Abdeckungskomponente setzt die validierte Abdeckungsgeometrie zusammen, und die Arithmetik ist per Unit-Test geprüft, aber die Kosten sind eine Nutzereingabe — das Verhältnis ist daher eine Planungshilfe und keine extern validierte Größe (deshalb ehrlicherweise kein Nachweis-Badge).

# text
seg-690b4cb0df55 = Kshana Interchange Format (KIF)

# text
seg-558523b5e0ac = Austausch von Artefakten

# text
seg-b882cccf5cee = versionierter Umschlag · Round-Trip und vorwärtskompatibles Lesen verifiziert

# text
seg-ff5a4ead87fe = Ein versionierter, selbstbeschreibender Umschlag, der ein Szenarioergebnis mit seinem Typ, seiner Schemaversion und den Kennzeichnungen modelliert/validiert umhüllt, sodass ein gespeichertes Artefakt selbstdokumentierend bleibt und ältere Umschläge vorwärtskompatibel lesbar bleiben.

# text
seg-5052e1720602 = Vertrauenswert des Empfängers für ein Schiff

# text
seg-70144aeea2d1 = Monitor-Arithmetik gegen pynmea2 und GeographicLib geprüft

# text
seg-9d9329128f06 = Bewertet, ob dem Navigations-Fix eines Schiffes vertraut werden kann, anhand der NMEA { "0183" }, die sein Empfänger und seine Instrumente ohnehin ausgeben: ein Wert von 0 bis 100, drei Bänder und die Gründe dahinter, je Epoche, im Batch, live oder als Gate. Monitore vergleichen den Fix mit der eigenen Bewegung des Schiffes, dem Kurssensor, dem Fahrtlog und den Signalpegeln der Satelliten. Beratende Software, keine typzugelassene Navigationsausrüstung: Der Betreiber bleibt verantwortlich. Die Arithmetik der Monitore ist gegen unabhängige Bibliotheken geprüft; die Regel und die Schwellen des Wertes sind die des Projekts selbst und bleiben modelliert.

# text
seg-a47934361f43 = NMEA-Datenströme für Besatzungstraining

# text
seg-c6492d4a7dae = { "225,227" } Sätze von pynmea2 geparst und dekodiert

# text
seg-9ca765cc09fc = Schreibt synthetische Brücken-NMEA { "0183" } für eine geskriptete Reise mit vom Ausbilder geskripteten Ereignissen für Jamming, Wegziehen der Position, Zeit-Spoofing und Replay, mit einem Ausbilderprotokoll, damit eine Besatzung auf ihren eigenen Instrumenten sehen kann, wie ein gestörter Fix aussieht. Nur Text, niemals für die Live-Navigationssysteme eines Schiffes; es wird nichts gesendet und kein Funksignal erzeugt. Die Sätze und ihre dekodierten Werte sind geprüft; die Modelle für Empfänger, Himmel und Ereignisse sind modelliert.

# text
seg-39f61b88209e = Codebedeutungen und Geometrie gegen pyModeS, pyais, shapely und GeographicLib geprüft

# text
seg-4c1667d3d453 = Erstellt aus offen lizenzierten Eingaben je Tag eine GeoJSON-Karte, wo Luftfahrzeuge (ADS-B) und Schiffe (AIS) gestörte Navigationsdaten gemeldet haben, sowie den Anteil einer Route, der durch gestörte Zellen führt. Eine gestörte Zelle ist eine Aussage über gemeldete Genauigkeitsfelder oder unplausible Positionen, kein Befund einer Störung, und eine Zelle, die niemand beobachtet hat, ist kein Beleg für eine freie Route. Vergangene Meldungen, keine Prognose.

# text
seg-e0962980e96f = Vertrauens-Telemetrie für Sicherheitsbetrieb

# text
seg-9b538e790bd7 = Prometheus, OTLP und CEF von unabhängigen Parsern zurückgelesen

# text
seg-f33e062790d9 = Exportiert den Vertrauensstrom als Prometheus-Metriken, OpenTelemetry (OTLP/HTTP) und CEF- oder LEEF-Syslog-Ereignisse über stdout, HTTP, UDP oder TCP, damit ein Security Operations Centre einen Navigationsfehler neben seinen anderen Alarmen sieht. Ein toter Collector hält die Bewertung weder auf noch bleibt er unbemerkt. Prometheus, OTLP und CEF werden von unabhängigen Parsern zurückgelesen; LEEF wird nur gegen seine eigene Spezifikation geprüft.

# text
seg-c74f3b9569b1 = Signierte Nachweispakete

# text
seg-28016686504c = RFC { "8032" }-Vektoren Byte für Byte; ein Clean-Room-Verifizierer stimmt bei { "71" } Paketen überein

# text
seg-123fa1de2e23 = Bündelt das Fenster um ein Vertrauensereignis zu einem hashverketteten, mit Ed25519 signierten Paket, das jeder offline verifizieren kann: Eine geänderte, entfernte, ausgetauschte oder hinzugefügte Datei, ein neu signiertes Paket oder ein falscher angehefteter Schlüssel wird benannt. Ein optionales Zeitstempel-Token nach RFC { "3161" } wird daran gebunden. Ein technisches Protokoll, kein Rechtsgutachten, keine Tatsachenfeststellung und keine Beglaubigung.

# text
seg-ee2e250497f9 = Export für den Prüfstand

# text
seg-ea618add831e = Umrechnungen und Kodierungen gegen PROJ, GeographicLib, pynmea2 und SciPy geprüft

# text
seg-be8af88f4f99 = Schreibt die Fahrzeugbewegung und die Ereignisse eines Szenarios als CSV-Trajektorie und als NMEA { "0183" } für einen GNSS-Simulator im Labor: Spalten für erdfeste, geodätische und lokale Geschwindigkeit, Lage und UTC. Nur Bewegung und Ereignisse: Es wird kein Signal geschrieben, und es wird keine Leistung eines Simulators oder Empfängers behauptet.

# text
seg-1ff1d8ebf1e7 = Compliance-Zuordnung zu öffentlichen Rahmenwerken

# text
seg-83af3fa21509 = Ordnet Ausgaben von Kshana den Abschnitten öffentlicher Rahmenwerke zu (IMO-Leitlinie für Schiffe, EU-NIS2 Artikel { "21" }, EN { "16803" }, das US-Rahmenwerk des DHS für resiliente PNT und EASA-Leitlinien für die Luftfahrt), allein nach Abschnittsnummer, befüllt aus den Läufen, die Sie angeben, und sagt, für welche Zeilen eine Menge von Läufen Belege liefert, mit der Lücke jeder Zeile. Es ist kein Befund, dass ein Rahmenwerk erfüllt wäre, und keine Bewertung oder Genehmigung durch irgendjemanden.

# text
seg-1b784a8701ac = GNSS-Authentifizierung

# text
seg-2b5a6095013a = alle { "18" } offiziellen Testvektorsätze: { "186,382" } Tags authentifiziert, { "0" } fehlgeschlagen

# text
seg-0419e9af208d = Ein offener Verifizierer in reinem Rust auf der Empfängerseite für die Navigationsnachrichten-Authentifizierung des Galileo Open Service: Er prüft, von welchen Satelliten ein Empfänger die Navigationsdaten aus I/NAV-Seiten oder einem u-blox-UBX-Strom authentifizieren kann, durch die Prüfungen von öffentlichem Schlüssel, Schlüsselkette und Tags aus der Spezifikation des Signals im Raum, und weist die Authentifizierung je Satellit und je Zeit aus. Er authentifiziert Daten; er beansprucht keine Leistung beim Schutz vor Spoofing.

# text
seg-d8bb6226f2e3 = Sichtbarkeit mit Horizontmaske, DOP und Fehlerellipse

# text
seg-6c6e7248496f = Himmelsgeometrie

# text
seg-94ff262653a6 = { "1173" } Blickwinkel und { "142" } sichtbare Mengen stimmen mit Orekit { "12.2" } und gnss_lib_py { "1.0.4" } auf { "1e-12" } überein; die Ellipse stimmt in { "270" } Fällen mit numpy überein

# text
seg-309521d4c9e1 = Welche Satelliten ein Standort sehen kann, wenn Gebäude, Kais, Kräne oder Gelände einen Teil des Himmels verdecken, und was das mit der Dilution of Precision (DOP) und der horizontalen Fehlerellipse macht. Ein azimutabhängiger Horizont ersetzt den einzelnen Elevationsgrenzwinkel; die sichtbare Menge, ihre DOP und die Ellipse ergeben sich je Epoche und je Konstellation. Ein Horizont entfernt Satelliten mit Sichtverbindung und sonst nichts: Er modelliert weder Reflexionen noch Beugung noch Signalstärke.

# text
seg-448e81d36ca4 = Horizont-Voreinstellungen und die Funktionen der Himmelsgeometrie

# text
seg-6483f9d89f15 = von Hand berechnete Werte und die Geometrie, die die Wolke abtastet; keine unabhängige Referenz

# text
seg-ebc2904904d3 = Die Reduktionen von Straßenschlucht, Sektor und Gelände auf eine Horizonttabelle, vier repräsentative Voreinstellungen (Stadtstraße, Hafeneinfahrt, Fjord, Containerterminal) und die Funktionen, die sie zu einem Skyplot und einer Monte-Carlo-Wolke zusammensetzen, über CLI, MCP, Python und den Browser. Die Voreinstellungen sind repräsentative Geometrien mit gewählten, angegebenen Abmessungen und keine Vermessungen, und die Reduktionen sind nur gegen von Hand berechnete Werte geprüft.

# text
seg-c2a5a6a7bcb0 = Geometriebewusste Vertrauensklassifikation

# text
seg-2f51e4da63b4 = die Klassifikationsregel und die Schwellen sind die des Projekts selbst, gegen sich selbst geprüft

# text
seg-b664ce284745 = Stellt die Satellitengeometrie neben den Vertrauenswert des Empfängers und benennt bei jedem Abzug eine Klasse: Signalverlust, schlechte Geometrie oder eine Unstimmigkeit zwischen der vom Empfänger angegebenen DOP und der aus den sichtbaren Satelliten abgeleiteten. Die Geometrie wird nur beurteilt, wenn sie bekannt ist, und die Kennzeichnung ist die Hauptaussage: Nur eine schlechte Geometrie kostet Punkte. Beratende Software, keine typzugelassene Navigationsausrüstung.

# text
seg-5026aab26cb8 = Studie zur lunaren Referenzstation

# text
seg-d6935d32272b = setzt getestete lunare Funktionen für differenzielles PNT, Uhr und Bezugssystem zusammen; gegen sich selbst und eine numpy-Referenz geprüft, keine externen Flugdaten

# text
seg-4f9696706384 = Eine reproduzierbare Studie dazu, was eine lunare Referenzstation am Südpol unter öffentlichen Annahmen leisten könnte: eine Abdeckungs- und Genauigkeitskarte über die Polarregion (Perzentile des korrigierten und unkorrigierten Positionsfehlers, Verfügbarkeit mit einem Grund für jede nicht verfügbare Epoche, Schutzniveaus und das Budget der Korrekturverbindung), ein Zeitlabor, das eine lunare Zeitreferenz auf einer Atomuhr hält, und die Geodäsie eines hinzugefügten Laser-Retroreflektors und VLBI-Beacons gegenüber dem Datum aus fünf Arrays. Jede Eingabe ist mit ihrer öffentlichen Quelle oder als illustrativ gekennzeichnet. Sie ist keine Aussage über die Leistung irgendeines realen Systems, und Kshana ist mit keiner Behörde verbunden.

# text
seg-cad8be3b66a3 = Optische Zeitgebungsstrecken durch Wolken und Turbulenz

# text
seg-e86745da72f0 = { "7" } von { "7" } vorab festgelegten numerischen Zielwerten gegen ein unabhängiges mpmath-Programm erreicht; es wurde kein gemessener Verfügbarkeitsverlauf verglichen

# text
seg-dd98aa94f8c8 = Wie oft eine optische Zeitübertragungsstrecke steht, wenn die Atmosphäre im Weg liegt. Für jeden Bodenstandort liefert die Engine die Dämpfung bei klarer Luft, den Turbulenzzustand nach Hufnagel-Valley mit Gamma-Gamma-Szintillationsschwunden und Aperturmittelung, die Verfügbarkeit gegenüber der Link-Marge aus einem angegebenen Wolkenklima, die Obergrenze, die keine Marge anheben kann, die Verteilung der Ausfalldauern und den Zeitfehler, den ein Ausfall eine Holdover-Uhr kostet. Dann zeigt sie, was zusätzliche Standorte, eine größere Apertur, eine andere Wellenlänge oder adaptive Optik bringen. Die mitgelieferten Wolkenklimata sind illustrativ, nicht gemessen; die Ausgabe ist beratend.

# text
seg-861d57389dd7 = GNSS jenseits der Konstellation: das Space Service Volume und darüber hinaus

# text
seg-8705c276af61 = Tabellen der ICG-SSV-Broschüre, vorab festgelegt; die meisten Zielwerte NOT MET (xval/gnss-ssv/RESULTS.md)

# text
seg-2dc82174942a = Für ein Raumfahrzeug auf einer Kugel (die globale Schale der Broschüre zum ICG Space Service Volume) oder auf einer Kepler-Trajektorie vom LEO bis zum Mondtransfer zählt es je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und für alle zusammen die Signale über einer C/N0-Schwelle: Verfügbarkeit von einem und von vier Signalen, längster Ausfall, empfangenes C/N0, Dilution of Precision sowie Verbindungen über die Hauptkeule gegenüber den Nebenkeulen. Die Sendediagramme sind die der Broschüre, ein parametrischer Ersatz oder eines, das Sie liefern; ein Modell für Ionosphäre, Plasmasphäre und Atmosphäre mit Randstrahl und ein Entwurf für einen Schwachsignal-Empfänger sind optional; ein Bord-GNSS-Filter für hohe und Mondtransfer-Bahnen sowie Relativnavigation in Formation sind enthalten. MODELLED: verglichen mit den Tabellen der Broschüre unter einer Vorregistrierung, die vor dem Lauf festgeschrieben wurde, stimmen die Konstanten der minimal abgestrahlten Leistung und der lunare Zielwert überein, die übrigen Zielwerte sind unter der vorab festgelegten Lesart NOT MET (fast alle durch den widersprüchlichen Strahlwinkel von GLONASS in der Broschüre), und der parametrische Nebenkeulen-Ersatz reproduziert die gemessenen Diagramme der GPS-Panels nicht.

# text
seg-61817375c8ea = Lunare Bahn und Oberfläche als Navigations- und geodätische Infrastruktur

# text
seg-d2439abaeabb = numpy/scipy-Referenzen der Numerik; drei vorab festgelegte Zielwerte NOT MET (xval/lunar-infra/RESULTS.md)

# text
seg-db45ac2940af = Fünf Studien in einem eingeschränkten Dreikörpermodell: eine Bahnbestimmung mit Erd-GNSS an Bord in einer nahezu geradlinigen Halo-Bahn gegenüber einer unabhängigen Bestimmung aus Entfernung und Entfernungsrate vom Boden; gemeinsame Festsetzung der ganzzahligen Mehrdeutigkeit der Trägerphase für Oberflächenstation und Orbiter (LAMBDA); die Fisher-Information eines lunaren Datums mit sieben Parametern mit und ohne Entfernungsmessungen zwischen Orbiter und Oberfläche; Versätze von GNSS, VLBI und Laserentfernungsmessung gegenüber der lokalen Anbindung; und die Sensitivität auf die lunaren Gezeiten- und Librationsparameter. MODELLED mit illustrativen Eingaben: Geprüft wird die Numerik gegen unabhängige numpy- und scipy-Programme, nicht die Physik. Unter den vorab festgelegten Zielwerten sind drei NOT MET: Ein eingespeister Kraftfehler wird nicht mit der angegebenen Rate erkannt (C3), die Erfolgsrate aus dem Bootstrap weicht um { "1.7e-6" } von der numpy-Referenz ab, bei einem Zielwert von { "1e-9" } (Q3), und das Hinzufügen einer Familie von Entfernungsmessungen senkt die Spur der Pseudoinversen nicht immer (G3, Spurhälfte).

# text
seg-aab745a65e76 = Modul

# text
seg-d6476863f862 = Fähigkeit

# text
seg-ad856ad710eb = Status

# text
seg-6962adaa6a1f = Beim Build aus den Szenariodateien und der Verifikationsmatrix des Repositorys erzeugt.

# text
seg-30200bb5be58 = orbit-sgp4-gps.toml in Kshana Studio ausführen

# text
seg-ecacc78711a1 = realtime-frame-eop.toml in Kshana Studio ausführen

# text
seg-fe9baedab7f0 = imu-deadreckoning.toml in Kshana Studio ausführen

# text
seg-58a3232bc4cf = ins-trn-coast.toml in Kshana Studio ausführen

# text
seg-27ffc4dfa394 = gps-denied-gravity-nav.toml in Kshana Studio ausführen

# text
seg-eb0c08082d24 = gnss-ins.toml in Kshana Studio ausführen

# text
seg-8d0f45d119a9 = lunanet-araim.toml in Kshana Studio ausführen

# text
seg-09641b89ad3a = lunar-frame-realisation.toml in Kshana Studio ausführen

# text
seg-4eea1b7d77cd = moonlight-service-volume.toml in Kshana Studio ausführen

# text
seg-3cd4cd7d7c16 = lunar-interop-export.toml in Kshana Studio ausführen

# text
seg-d767de2fa87a = lunar-llr-datum.toml in Kshana Studio ausführen

# text
seg-29266e8878ac = lunar-differential-pnt.toml in Kshana Studio ausführen

# text
seg-0955d6ded82d = lunar-time-budget.toml in Kshana Studio ausführen

# text
seg-ab41004755ea = lunar-jamming.toml in Kshana Studio ausführen

# text
seg-edbe5cf449a0 = lunar-vlbi-fim.toml in Kshana Studio ausführen

# text
seg-d706c2d59dd1 = mars-pnt-lmo.toml in Kshana Studio ausführen

# text
seg-71586c459df8 = hybrid-optical-rf.toml in Kshana Studio ausführen

# text
seg-87634a6d41b5 = integrity-raim.toml in Kshana Studio ausführen

# text
seg-a281aa02ddc7 = araim-reference-check.toml in Kshana Studio ausführen

# text
seg-9184b54b1173 = clock-holdover.toml in Kshana Studio ausführen

# text
seg-2f270136b41d = gnss-sim-raim.toml in Kshana Studio ausführen

# text
seg-f2f3ede70967 = pvt-abmf.toml in Kshana Studio ausführen

# text
seg-eac325fbeed1 = spoof-attack.toml in Kshana Studio ausführen

# text
seg-07d55d3e7bdc = oem-interop.toml in Kshana Studio ausführen

# text
seg-5b70a59accce = aperture-duty-cycle.toml in Kshana Studio ausführen

# text
seg-d3df277fd118 = space-weather.toml in Kshana Studio ausführen

# text
seg-7dc863bf8f7b = impairment-eval.toml in Kshana Studio ausführen

# text
seg-1c3083a77264 = conflict-resilience.toml in Kshana Studio ausführen

# text
seg-b3f2b2d88d8c = gnss-ssv-shell.toml in Kshana Studio ausführen

# text
seg-e42b759ccbaf = lunar-infrastructure-od-consistency.toml in Kshana Studio ausführen

# text
seg-60a43431ebe0 = Anforderung

# text
seg-cbf0f9bcd2d8 = Unabhängige Referenz

# text
seg-1603e76bcf66 = Identifikation von Potenzgesetz-Rauschen über die Autokorrelation bei Lag 1

# text
seg-d95fe5878ee3 = allan::lag1_noise_id: der Rauschidentifikator nach Riley und Greenhall ({ "2004" }) über die Autokorrelation bei Lag 1 (dezimierte Phase mit entferntem quadratischem Anteil oder gruppengemittelte Frequenz mit entfernter Geraden; wiederholte erste Differenzen, bis delta = r1/({ "1" }+r1) < { "0.25" } oder d = dmax), der den ganzzahligen und den ungerundeten Potenzgesetz-Exponenten alpha (+{ "2" } weiße PM bis -2 Random-Walk-FM) bei jedem Mittelungsfaktor liefert; er legt die Freiheitsgrade der Rauschart für die Gerätekarten der Bibliothek gemessener Uhren fest

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin und Mitwirkende, LGPL-3.0-or-later, vom Fixture-Generator als getrenntes Programm ausgeführt): eine unabhängige Implementierung des veröffentlichten Algorithmus von Riley-Greenhall, eine unter den angegebenen Konventionen eindeutig definierte Größe. Validiert den Identifikator, nicht den Rauschinhalt einer echten Uhr

# text
seg-aedf395f3597 = Authentifizierung von Navigationsdaten auf Empfängerseite bei Galileo OSNMA

# text
# c1: kshana osnma verify
seg-1e6e62438dad = osnma + <c1/>: ein offener, reiner Rust-Verifizierer auf Empfängerseite für Galileo OSNMA (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) aus I/NAV-Seiten oder einem u-blox-UBX-RXM-SFRBX-Strom: öffentliche Schlüssel im Merkle-Baum (DSM-PKR), die ECDSA-Signatur P-256/P-521 des DSM-KROOT, Verifikation der TESLA-Schlüsselkette (SHA-256 oder SHA3-256), Verifikation von MACSEQ und Tag (HMAC-SHA-256 oder CMAC-AES) für ADKD { "0" }, { "4" } und { "12" } mit Kreuzauthentifizierung, Kettenende/Widerruf/Erneuerung, Erneuerung und Widerruf öffentlicher Schlüssel und die Alarmnachricht; Status je Satellit Authenticated/Failed/Unavailable mit einem Grund für jeden Fehler oder jede Verzögerung. Beratend: keine typzugelassene Navigationsausrüstung und kein Integritätsdienst für die Navigation; es wird keine Leistung gegen Spoofing behauptet

# text
seg-a6bd60ed728f = Die offiziellen Galileo-OSNMA-Testvektoren, die das European GNSS Service Centre als Anhang zu den Receiver Guidelines veröffentlicht hat (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } von { "18" } Sätzen, { "186,382" } Tags authentifiziert, { "0" } fehlgeschlagen, am 2026-10-10 offline ausgeführt (Nachweisprotokoll in kshana-pro docs/evidence). Umfang: Die Vektoren validieren die kryptografische Verifikation (Merkle, KROOT/ECDSA, TESLA-Kette, MACK-Tags, ADKD 0/4/12) und ihre Ergebnisse auf den veröffentlichten Szenarien; sie verwenden nur HMAC-SHA-256, eine SHA-256-Kette, 128-Bit-Schlüssel, 40-Bit-Tags und die Nachschlageeinträge { "33" } und { "34" }, sodass CMAC-AES, SHA3-256-Ketten und andere Parameter nur durch veröffentlichte Known-Answer-Tests der Primitive und synthetische Tests abgedeckt sind. Die Härtung bei vertrauenswürdiger Zeit, Datenbindung, Ablauf und Header-Bestätigung wird durch die synthetischen Angriffstests geprüft, nicht durch eine externe unabhängige Referenz. Nicht geprüft: Zertifikatssperrlisten, Live-Signale oder ein Live-Empfänger (das UBX-Wortlayout wird nur an synthetischen Rahmen geprüft), SHA3-256-Merkle-Bäume, Aktualität ohne unabhängige Zeit. Kein EU-Dienst

# text
seg-27a61718eb95 = Charakterisierung der Frequenzstabilität

# text
seg-56174d771190 = Allan-/modifizierte/Hadamard-Abweichung + Identifikation von Potenzgesetz-Rauschen mit χ²-KI

# text
seg-ed01b2ab3481 = Referenzabweichungen NIST SP { "1065" } (Riley) / Stable32 auf NBS14

# text
seg-25b78672c194 = Frequenzstabilität einer echten gemessenen Uhr

# text
seg-fd378f5fe04a = Überlappende Allan- + überlappende Hadamard-Abweichung an einem echten Cäsium-Normal

# text
seg-64fd49d58394 = Überlappende ADEV/HDEV nach Stable32 an der gemessenen Phasenreihe des Cäsium-Normals 5071A (allantools)

# text
seg-f305dbc83f2b = Parität des Allan-Schätzers auf der kanonischen Stable32-Referenzreihe

# text
seg-5bfca5dcfb7c = Überlappende Allan- + modifizierte Allan- + Zeitabweichung über die ganze AF-Leiter

# text
seg-327ab6dcf16a = Stable32-Referenzabweichungen für PHASE.DAT (Riley; die Standard-Regressionsreihe)

# text
seg-96c4275f5a89 = Frequenzstabilität mit erweitertem Bereich (Theo1 / TOTDEV)

# text
seg-7f59c3631ca4 = Theo1 und Gesamtabweichung (TOTVAR): Schätzer der Stabilität bei langem Tau mit erweitertem Bereich, die ~{ "75" } % der Aufzeichnung erreichen, wo die Allan-Abweichung bei ~{ "50" } % an ihre Grenze kommt; das darauf aufbauende verzerrungsbereinigte Hybrid ThêoH (allan::theoh_curve) bleibt MODELLED

# text
seg-a38edc2526f5 = allantools { "2024.06" }, eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters: theo1 (NIST SP { "1065" } Gl. { "30" }) und totdev (NIST SP { "1065" } Gl. { "25" }) auf dem hermetischen LCG-Datensatz aus NIST SP { "1065" } §{ "12.4" }; offline über tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py neu erzeugbar

# text
seg-cc40472fbcbf = Maximaler Zeitintervallfehler (MTIE), Wander-Metrik der Telekommunikation

# text
seg-5c54ba2748f7 = MTIE(τ): der maximale Spitze-Spitze-Hub des Zeitfehlers über jedes gleitende Fenster von τ = m·tau0, die Wander-Statistik nach ITU-T G.810/G.823/G.8261, gegen die die Grenzwerte von Synchronisationsnetzen (MTIE-Masken) geschrieben sind; eine Extremwertgröße (Max/Min), verschieden von der RMS-Allan-Familie

# text
seg-300fd3f945a0 = allantools { "2024.06" }, eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters: mtie() auf der hermetischen LCG-Phasenreihe aus NIST SP { "1065" } §{ "12.4" }; MTIE ist eine reine Max/Min-Statistik, daher ist die Ausgabe des Schätzers auf dem identisch aufgebauten Phasenarray bitgenau gegenüber allantools (die eingecheckten Referenzkonstanten mit 15 signifikanten Stellen liegen innerhalb von { "1" } ULP). Offline über tests/fixtures/mtie/generate_mtie_reference.py neu erzeugbar

# text
seg-67d73f3ca14d = Modifizierte Allan- / Zeitabweichung (MDEV / TDEV)

# text
seg-9ac9d2b0bdf8 = MDEV(τ): die überlappende modifizierte Allan-Abweichung (Schätzer mit gleitendem Fenster aus zweiten Differenzen, der weißes von Flicker-Phasenrauschen trennt), und TDEV(τ) = τ/√{ "3" }·MDEV(τ), die Zeitbereichs-Wander-Statistik nach ITU-T G.811/G.812/G.823, gegen die die Synchronisationsmasken geschrieben sind

# text
seg-24a441f32375 = allantools { "2024.06" }, eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters: mdev() und tdev() auf der hermetischen LCG-Phasenreihe aus NIST SP { "1065" } §{ "12.4" } (dieselbe Reihe wie in den Zeilen Theo1/TOTDEV/MTIE), die dieselben eindeutig definierten Schätzer berechnen; abgeglichen auf <{ "1e-9" } relativ. Offline über tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py neu erzeugbar. (Das datengesteuerte phasedat_reference.rs prüft diese ebenfalls gegen Stable32 auf { "1e-3" }; dies ist die enge, stets aktive hermetische Gegenprüfung)

# text
seg-e4b6d707cbf5 = Frequenzstabilität einer optischen Uhr auf einer echten gemessenen Kurve

# text
seg-e9077554a08f = NNLS-Rückgewinnung eines Potenzgesetzes (weiße FM + Boden mit rotem Rauschen) aus einer veröffentlichten gemessenen Allan-Abweichung des optischen Uhrenübergangs von ⁸⁸Sr: σ_y(τ) und die Kernskalierung 4.7e-16/√τ bei kurzem τ werden mit einem echten gemessenen Boden bei langem τ reproduziert, statt des synthetisierten Bodens der optischen Klasse, den holdover.rs sonst annimmt

# text
seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), Abb. { "4" }, gemessene ADEV; Kurve wörtlich übernommen von Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Beschränkt auf die Reproduktion der veröffentlichten gemessenen Stabilitätskurve; die Gerätezahlen für holdover bis zur Schwelle je Uhrenklasse bleiben MODELLED

# text
seg-cc95c8615d39 = Integrität (RAIM/ARAIM/SBAS)

# text
seg-d4ad9cfa4f9b = ARAIM-Solution-Separation mit mehreren Hypothesen nach dem ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels und add_v42_protection_levels_ecef: Teilmengenbestimmung nach den Regeln P_THRES und FC_THRES, VPL, HPL, die effektive Monitorschwelle EMT und sigma_acc); χ²-Snapshot-RAIM-Fehlererkennung mit Ausschluss einzelner Satelliten (raim::snapshot_raim, raim::snapshot_raim_fde) und steigungsbasierte HPL/VPL auf der geodätischen lokalen Ebene; und die SBAS-Kombination der Schutzniveaus nach DO-229E (sbas::sbas_protection_level) auf dem L1-Dienst. NICHT abgedeckt, offen gesagt: Die Komfortfunktionen mit einheitlichem Sigma raim::araim_raim und raim::araim_dual_raim sind NICHT ADD-konform (bei gleichen Eingaben verfehlen sie Stanford MAAST um { "0.75" } m VPL / { "4.04" } m HPL und { "0.39" } m VPL / { "1.93" } m HPL, ein Befund); der L5-SBAS-Vergleich für Zweifrequenz-Mehrkonstellationen (DFMC) ist ein Befund ({ "308" } Nutzer-Epochen-Paare ohne GEO in Sicht werden von Kshana geschützt und nicht von MAAST, dessen GEO-Empfangsprüfung Kshana nicht modelliert); raim::solution_separation_raim hat keinen externen Vergleich

# text
seg-a83c68500982 = Drei unabhängige Werkzeuge, vorab festgelegt (0123cee1), bevor irgendeine Fixture oder Ausgabe einer unabhängigen Referenz existierte, Toleranzen damals festgelegt. ({ "1" }) ARAIM: Stanford MAAST für ARAIM { "2" } (Commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als getrenntes Programm unter GNU Octave { "8.4" } mit einer treiberseitigen Kompatibilitätsschicht für unique() ausgeführt (offengelegt, keine Änderung am Algorithmus), bei der ADD-Toleranz TOL_PL von { "0.05" } m: Das Rust-Programm reproduziert die ADD-Referenzimplementierung an { "270" } echten Fällen. Offengelegt: Der ADD-Pfad von Kshana wurde nach der Vorregistrierung geschrieben, nach dem ADD, wie MAAST ihn umsetzt; ein unabhängiger zurückgehaltener Datensatz des Prüfers ({ "270" } neue Nutzergeometrien und eine zweite Integritäts-Unterstützungsnachricht, MAAST gegen den eingefrorenen Code neu ausgeführt) bestand denselben Zielwert. ({ "2" }) Snapshot-RAIM: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde in einem getrennten C-Harness für Erkennung und Ausschluss; das PL nach der Steigung aus RTKLIB matinv/xyz2enu plus SciPy { "1.18.1" } chi2/ncx2, wobei beide Seiten dieselbe geschlossene Form auswerten (Brown; Parkinson und Axelrad), sodass die PL-Prüfung die Implementierung abdeckt, nicht die Formel. ({ "3" }) SBAS: Stanford MAAST (Commit 7d32b049) usr_vhpl, unverändert, auf den von MAAST selbst aufgezeichneten WAAS-Broadcasts: L1-Niveaus innerhalb von { "1e-4" } m nach der K-Neuskalierung und eine gleiche geschützte Menge. Dieselben Vergleiche ergaben die in der Fähigkeit genannten Befunde: Die ARAIM-Funktionen mit einheitlichem Sigma sind nicht ADD-konform, und die Mengengleichheit bei L5 scheitert an { "308" } Paaren ohne GEO in Sicht (die Niveaus der { "3267" } Paare, die beide Werkzeuge schützen, stimmen auf { "1e-13" } m überein). Die K-Faktoren aus DO-229E/DO-316 sind übertragene Konstanten und die echte Geometrie ist eine Eingabe; keines von beiden wird als unabhängige Referenz gezählt. Revision { "0.30" }: Die Schutzniveaus von snapshot_raim wurden von der radialen auf die geodätische lokale Ebene verlegt (bis zu { "0.31" } m HPL und { "0.14" } m VPL bei { "16" } Grad N)

# text
seg-1c37702cc5f2 = Bahnpropagation und Bahnbestimmung

# text
seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + Störungen, Batch-/sequenzielle OD

# text
seg-c84585f43297 = Verifikationsvektoren AIAA 2006-6753 für SGP4

# text
seg-50c545872e4f = Numerischer Cowell-Propagator und Kraftmodell

# text
seg-74f8c585bcfd = Numerischer Cowell-Propagator mit hierarchischem Kraftmodell (Zweikörper, zonales J2–J6, Gravitation dritter Körper durch Sonne/Mond, Kanonenkugel-SRP, exponentieller Luftwiderstand); RK4 mit Schrittverdopplung / DP5({ "4" }) / DOP853

# text
seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853: eine unabhängige Bibliothek, ein anderer Integrator und eine andere Kugelfunktionsrekursion. Die konservativen Stufen (Zweikörper → zonales J2–J6 → Gravitation dritter Körper durch Sonne/Mond → Kanonenkugel-SRP) stimmen über einen Bogen von { "24" } h auf unter einen Meter überein und validieren den Integrator + die Kraftalgebra; die Luftwiderstandsstufe und die absolute Treue der Eingabe aus Sonnen-/Mondephemeride / Dichte bleiben MODELLED (nur Charakterisierung)

# text
seg-d38c4be472ac = SRP-Schatten der abgeplatteten Erde (optional)

# text
seg-ab8247c6b4d2 = SRP-Beleuchtungsanteil mit dem Ellipsoid WGS-84 als verdeckendem Körper (scheinbarer Erdradius vom Ellipsoidrand zur Sonne, Formel der Doppelscheibenlinse; srp_shadow::oblate_conical_shadow), optional im Cowell-Kraftmodell über propagator::ForceModel::srp_shadow (Standard: der sphärische konische Schatten, unverändert)

# text
seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio mit einem verdeckenden Körper WGS-84 und einem sphärischen OneAxisEllipsoid, als getrenntes Programm mit der Sonne an derselben inertialen Position ausgeführt. Zielwerte vorab festgelegt in xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } auf beiden Seiten und eine Streuung zwischen abgeplattet und Kugel von > { "1e-2" }; alle erreicht. Die Ellipsoidachse ist auf beiden Seiten die inertiale z-Achse (keine Präzession-Nutation)

# text
seg-01066d639b39 = Box-Wing- und ECOM2-Strahlungsdruck der Sonne, mit partiellen Ableitungen (optional)

# text
seg-2a5fc9708bd0 = SRP ohne Kanonenkugel: ein Flachplattenmodell Box-Wing (Vallado Gl. 8-44; einseitige Körperpaneele, zur Sonne zeigende Flügel) mit den Tabellen für Galileo FOC, IOV und IOV am Lebensende aus den Satellitenmetadaten der GSC, in nominaler GNSS-Gierlenkung, mit analytischen partiellen Ableitungen für den Strahlungsfaktor und die spekularen und diffusen Koeffizienten jedes Paneels; und das empirische Modell ECOM2 (D2/B1) mit seinen partiellen Ableitungen. Das Box-Wing ist optional im Cowell-Propagator (propagator::ForceModel::box_wing_srp, setzt sein Feld srp_boxwing) und im Modell der präzisen Bahnbestimmung (precise_od::PreciseForceModel::box_wing_srp), wobei es den Kanonenkugel-Term mit cr als Strahlungsfaktor ersetzt; beide stehen standardmäßig auf None, sodass jeder bestehende Pfad byteidentisch bleibt. ECOM2 ist in kein Kraftmodell eingebunden

# text
seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft mit FixedPanel und PointingPanel, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), nominale Gierlenkung GenericGNSS und ECOM2(nD = { "2" }, nB = { "1" }), als getrenntes Programm mit der Sonne an festen inertialen Positionen ausgeführt; die Ableitung des Strahlungsfaktors aus Hipparchus Gradient, Ableitungen je Paneel als zentrale Differenzen von Orekit (Orekit hat keine). Zielwerte vorab festgelegt in xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), bevor irgendeine Ausgabe von Orekit existierte: { "1e-12" } relativ ({ "1e-11" } Ende zu Ende, { "1e-9" } für die Differenzen); alle erreicht (RESULTS.md). VALIDATED deckt nur die Modellauswertung ab: Die GSC-Tabellen sind übertragene Eingaben, und die Eignung eines Box-Wing für echte Galileo-Bahnen, die thermische Re-Emission, das modifizierte Gierlenkungsgesetz bei kleinem Beta und Eklipsenwenden sind nicht abgedeckt; die SRP-Vorhersage für Galileo bleibt MODELLED

# text
seg-bde1b3a94a47 = SRP-Schatten mit Randverdunkelung der Sonne (optional)

# text
seg-eaaec545dd68 = SRP-Beleuchtungsanteil als nicht verdeckter Anteil des randverdunkelten Sonnenflusses (Gesetz der Eddington-Näherung I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauß-Legendre-Quadratur) über einer kugelförmigen oder WGS-84-Erde (srp_shadow::limb_darkened_shadow, die Variante ShadowModel OblateEarthLimbDarkened)

# text
seg-76cb4b668ad5 = Keine externe: Orekit { "12.2" } hat kein Beleuchtungsverhältnis mit Randverdunkelung. Nur gegen geschlossene Formen desselben Gesetzes geprüft

# text
seg-673b17e9dcf7 = Thermosphärische Dichte nach NRLMSISE-00

# text
seg-09e997231de8 = Eine Portierung der empirischen Thermosphäre NRLMSISE-00 (gtd7 und gtd7d: Teilchendichten der Spezies, Gesamtmassendichte mit anomalem Sauerstoff, Temperaturen; die { "24" } Schalter; Modi mit täglichem Ap und 3-stündlichem ap-Array) aus der gemeinfreien C-Fassung des NRL-Fortran

# text
seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, das den NRL-Fortran GTD7D in einfacher Genauigkeit ausführt, und die C-Portierung von NRLMSISE-00 (Release { "20190709" }, gemeinfrei), als getrenntes Programm kompiliert, dazu die { "17" } veröffentlichten Testausgaben der C-Distribution. Zielwerte vorab festgelegt in xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a), bevor die Portierung existierte; alle erreicht (RESULTS.md). Validiert die Portierung, nicht die Genauigkeit des Modells gegenüber gemessener Dichte

# text
seg-12977f65b2ea = Luftwiderstands-Dichtestufe NRLMSISE-00 (optional)

# text
seg-17aec847b675 = forces::DensityModel (Exponential als Standard, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) und propagator::ForceModel::drag_density: quadratischer Luftwiderstand gegen die mitrotierende Atmosphäre mit der Dichte nach NRLMSISE-00 am geodätischen Punkt in WGS-84 (Erdrotationswinkel mit UT1 = TT, lokale Sonnenzeit UT + lon/15), konstantes Weltraumwetter je Modell; standardmäßig aus und bitidentisch

# text
seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 mit DragForce über die eigene NRLMSISE00-Implementierung von Orekit, als getrenntes Programm mit demselben Bezugssystem des Erdrotationswinkels, derselben Form WGS-84, derselben Konvention der lokalen Sonnenzeit (eine mittlere Sonne) und TT als UT ausgeführt; die Einrichtung der Konventionen wurde Referenz gegen Referenz geprüft (Orekit gegen pymsis, { "5.2e-5" } in der Dichte). Zielwerte vorab festgelegt in xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } der Luftwiderstandsverschiebung und zwei Empfindlichkeitsprüfungen > { "100" } m; alle erreicht. Nicht abgedeckt: die Genauigkeit des Modells gegenüber gemessener Dichte, zeitvariantes Weltraumwetter, ein Zweig mit GMAT

# text
seg-1ac7430e88fc = Standard-Exponential-Luftwiderstand gegen eine unabhängige Implementierung (äquatorial)

# text
seg-a9c41b03f2ca = Der Standard-Luftwiderstand des Cowell-Propagators: quadratischer Luftwiderstand gegen die mitrotierende Atmosphäre mit forces::atmospheric_density, der stückweise exponentiellen Tabelle aus Vallado Tabelle 8-4 bei der sphärischen Höhe (propagator::ForceModel::drag mit der Standardvariante Exponential von forces::DensityModel)

# text
seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole mit der Exponential-Atmosphäre (dieselbe Tabelle mit 28 Bändern), Punktmasse-Erde und PrinceDormand78, ausgeführt, nie eingebunden. Zielwerte vorab festgelegt in xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) auf der Luftwiderstandsverschiebung jeder Seite (Lauf mit Luftwiderstand minus Lauf ohne), die die beiden Werte von mu der Erde und die Integratoren auslöscht; alle erreicht (RESULTS.md). GMAT nimmt die geodätische Höhe und kshana die sphärische Höhe: Sie fallen nur am Äquator zusammen, daher deckt VALIDATED äquatoriale Bahnen ab; abseits des Äquators unterscheiden sich die Modelle absichtlich ({ "10.4" } % der Verschiebung über { "24" } h bei { "51.6" } Grad, { "400" } km). Der öffentliche Build von GMAT hat kein NRLMSISE-00 (Plugin fehlt), sodass die Stufe NRLMSISE-00 nur die Referenz von Orekit hat. Die Genauigkeit der Tabelle gegenüber gemessener Dichte ist nicht abgedeckt

# text
seg-9e15970435c3 = Sonne und Mond aus DE440 im Cowell-Kraftmodell (optional)

# text
seg-de6831cf7785 = Optionale Ephemeridenstufe für die Terme der Gravitation dritter Körper und des SRP im numerischen Cowell-ForceModel: die geozentrische Sonne und der Mond aus jedem EphemerisProvider (ein DE440-SPK-Kernel über KernelEphemeris) bei TDB = TT + (TDB - TT), wobei ein Provider, der die Epoche nicht bedienen kann, zurückgewiesen und jeder Rückfall auf die analytische Reihe gezählt wird; standardmäßig aus

# text
seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 mit ThirdBodyAttraction und SolarRadiationPressure auf dem eigenen DE440-Leser von Orekit (orekit-data lnxp1990.440), als getrenntes Programm ausgeführt; kshana liest einen bitgenauen, mit SPICE geprüften Ausschnitt von NAIF de440s.bsp. Zielwerte vorab festgelegt in xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Der Bahn-Zielwert ({ "0.5" } m) und die Empfindlichkeitskontrolle sind erreicht, aber der Zielwert für die Position von Sonne/Mond ({ "3" } m / { "0.2" } m) wurde mit { "6.39" } m / { "0.244" } m verfehlt. SPICE, das denselben Kernel bei seiner exakten TDB liest, verfehlt Orekit um denselben Betrag ({ "6.25" } m / { "0.240" } m), sodass die Lücke zwischen dem Pfad de440s von NAIF und dem DE440-Leser oder der Zeitskala von Orekit liegt; Ursache nicht isoliert. Festgehalten und festgelegt, daher bleibt die Zeile MODELLED

# text
seg-057c21daf4f2 = Atmosphärische Gezeit S1 (optional)

# text
seg-f600a39f297e = Die tägliche Luftdruckgezeit S1 als Störung des Geopotenzials: Biancale und Bode ({ "2006" }) Modell N1, Grad { "2" } bis { "6" }, über die Lastformel Gl. { "6.21" } aus IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), optional in den Cowell- und Präzisions-Kraftmodellen (air_tide_s1, standardmäßig aus)

# text
seg-7dd9fccac779 = Keine externe für die Wirkung auf das Geopotenzial. Die { "24" } Koeffizienten sind aus GFZ STR06/01 Tabelle { "1" } Modell N1 übertragen und Zeile für Zeile gegen den Bericht erneut geprüft worden (SHA-256 890865ae); die Grade { "0" }, { "1" }, { "7" } und { "8" } werden nicht verwendet. Ray und Ponte ({ "2003" }) drucken keine Kugelfunktionstabelle, sodass keine zweite Quelle verglichen wurde

# text
seg-b150b1bdb599 = Koeffizienten der atmosphärischen Gezeit S2 in der IERS-Konvention

# text
seg-87e9238b8c53 = Luftdruck-Harmonische S2 nach Ray ({ "2001" }) (n <= { "4" }, prograd und retrograd), umgerechnet in die voll normierte Form mit Sinus-Vorlauf nach IERS { "2010" } Gl. 6.20-6.21 (Amplitude geteilt durch N_nm, epsilon = { "90" } Grad - psi) und als Term S2 von tides::atmospheric_tide angewandt

# text
seg-4745148b6c60 = Biancale und Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), Tabelle { "5" }, Modell A2: Ray ({ "2001" }) veröffentlicht in voll normierten Harmonischen mit Sinus-Vorlauf-Phasen, eine unabhängige Darstellung desselben Modells. Vorab festgelegt in xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) zusammen mit der Korrektur, die es validiert. Deckt nur die Koeffizientenumrechnung ab; die Wirkung der Luftgezeit auf das Geopotenzial hat keine externe unabhängige Referenz

# text
seg-444f0a65b6fd = Tesserales Geopotenzial im Cowell-Propagator

# text
seg-ad475816bc78 = Optionales tesserales EGM2008-Feld (bis Grad/Ordnung { "70" }) als zentrale Gravitation des numerischen Cowell-ForceModel, ausgewertet in einem erdfesten Bezugssystem, das um den Erdrotationswinkel der IAU { "2000" } gedreht wird (oder über die CIO-Kette GCRS nach ITRS); standardmäßig aus, sodass sich keine bestehende Ausgabe ändert

# text
seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 mit HolmesFeatherstoneAttractionModel über dieselben Koeffizienten (tools/egm2008_to70.gfc) in einem Körperbezugssystem, das mit derselben Erdrotationswinkel-Formel gedreht wird, als separates Programm ausgeführt. Zielwerte vorab festgelegt (f0e0e65, vor jedem Vergleich in 2da899a geändert): |dr| <= { "0.5" } m und |dv| <= { "5e-4" } m/s, und beide Negativkontrollen verfehlen um > { "100" } m; alle erreicht, die Zielwerte wurden danach auf { "0.1" } m und { "1e-4" } m/s verschärft. Nicht validiert: Genauigkeit der Erdorientierung (beide Seiten verwenden UT1 = TT ohne Präzession-Nutation im Era-Bezugssystem), die Option des Cio-Bezugssystems (nur interne Prüfung), Grade über { "70" }

# text
seg-e8f5ff8c9149 = Sphärisch-harmonische Gravitation hohen Grades (EGM2008 bis { "2190" })

# text
seg-d3b2f32dcecb = Unterlauf- und polsichere Auswertung eines vollständig normierten Feldes bis Grad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, modifizierte Vorwärtsspalte nach Holmes-Featherstone { "2002" } mit einem Gradienten ohne 1/cos phi), ein streamender ICGEM-.gfc-Lader (from_gfc_file / from_gfc_reader; das vollständige EGM2008 wird zur Laufzeit geladen, nicht mitgeliefert) und der Holmes-Featherstone-Auswerter, der für das optionale Cowell-Geopotential wählbar ist

# text
seg-8651532685f3 = Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel und pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, als separate Programme ausgeführt; Zielwerte vorab festgelegt in xval/high-degree-gravity/PREREGISTRATION.md (276c869f) und xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit stimmt überall überein, wo es definiert ist, aber pyshtools verfehlt seinen vorab festgelegten Zielwert an den beiden polnahen Punkten (bis zu { "7.3e-10" } m/s^{ "2" }; eine 50-stellige mpmath-Prüfung ordnet den Fehler pyshtools zu), es gibt keinen Referenzwert genau auf der Polachse, und die vorab festgelegte Sensitivitätskontrolle für Grad 70 der { "24" }-h-Bahn wurde verfehlt ({ "0.726" } m gegen > { "1" } m). Jede Verfehlung ist festgehalten und nicht weggetunt, daher bleibt die Zeile MODELLED

# text
seg-e81b7418c382 = DOP853-Integrator

# text
seg-e6e3638aa68e = Explizites Runge-Kutta-Verfahren Hairer DOP853 { "8" }({ "5,3" }) mit dem kombinierten Fehlerschätzer 5. und 3. Ordnung, dem SciPy/Hairer-Schrittweitenregler, automatischer Anfangsschrittweite, einer fail-closed-Schrittwächter-Prüfung und dichter Ausgabe 7. Ordnung; wählbar als Integrator-Variante Dop853 des Propagators / propagator::propagate_dop853

# text
seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) und seine Routinen für Einzelschritt, Fehlernorm, dichte Ausgabe und Anfangsschrittweite, eine unabhängige Implementierung; exakte Zweikörperzustände aus mpmath { "1.3.0" } mit { "40" } Stellen. Zielwerte vorab festgelegt in xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) vor dem ersten Vergleich; alle erreicht (xval/dop853-scipy/RESULTS.md). Der erste Schritt von SciPy wird in den vollständigen Läufen beiden Lösern vorgegeben; die Routine für die Anfangsschrittweite wird getrennt verglichen. Nicht abgedeckt: RKF7({ "8" }), Steifigkeitserkennung, Ereignislokalisierung

# text
seg-9ad7c1f4da77 = Robuster Löser der Kepler-Gleichung

# text
seg-4b9d812fd13e = Elliptischer Kepler-Löser für alle { "0" } <= e < { "1" } und alle mittleren Anomalien: kubischer Startwert und Korrektur fünfter Ordnung nach Markley ({ "1995" }), ein auslöschungsfreies Residuum (1-e)E + e(E - sin E) - M und abgesicherte Newton-Nachpolierung (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-6fedaf34608d = mpmath { "1.3.0" } (BSD-3-Clause), 50-stellige Nullstellen aus den exakten binären Eingaben. Zielwerte vorab festgelegt in xval/kepler-mpmath/PREREGISTRATION.md (df22174), bezogen auf |E| mit dem Konditionierungsargument e -> { "1" }, M -> { "0" }; alle erreicht (xval/kepler-mpmath/RESULTS.md). Die älteren Löser (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) sind numerisch unverändert, weil festgeschriebene Ausgaben von ihnen abhängen, und werden von dieser Zeile nicht abgedeckt

# text
seg-1960804ef2f4 = Bahnbestimmung im Batch-Verfahren aus Entfernungsraten und Az/El mit Stationsmaskierung

# text
seg-4c185244bc66 = Rekonstruktion eines Epochenzustands aus gemischter Entfernungs-, Entfernungsraten- und Azimut/Elevations-Verfolgung oberhalb einer Elevationsmaske durch Gauss-Newton auf H = (dh/dx(t)) Phi(t, t0): analytische Messpartiale und eine variationelle Zustandsübergangsmatrix mit analytischen Zweikörper- + J2-Partialen (RK4-integriert, keine geschlossene STM)

# text
seg-6c6a42c25433 = Orekit { "12.2" } (Apache-2.0) BatchLSEstimator mit benutzerdefinierten momentanen geometrischen RangeRate- und AzEl-Messungen (gegen Orekits TopocentricFrame gegengeprüft), als separates Programm auf identischen, maskierten, gesetzten Beobachtungen ausgeführt. Zielwerte vorab festgelegt in xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Jeder Zielwert erreicht außer B4, der rauschfreien Zustandsübereinstimmung von { "1" } cm, verfehlt in { "2" } von { "4" } Szenarien ({ "1.46" }, { "1.74" } cm): Orekits eigene rauschfreie Schätzung liegt so weit von seiner simulierten Wahrheit entfernt (Ursache auf Orekit-Seite nicht isoliert). Festgehalten und festgeschrieben, daher bleibt die Zeile MODELLED. Nicht modelliert: Lichtlaufzeit, Aberration, Refraktion, Erdrotation, ein sequenzielles Filter für diese Messtypen

# text
seg-bc3d1ee7c639 = Beobachtungsgewichtung nach SP3-Genauigkeitscode

# text
seg-63b1fab84f85 = SP3-Genauigkeitscodes (Header-++-Exponenten in { "2" }^n mm, die %f-Basis, Standardabweichungen je Datensatz Basis^n mm) auf Positionssigmas je Beobachtung für die Maschine zur präzisen Bahnbestimmung abbilden (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ebecb8906506 = Keine externe: Die Gewichte sind eine Modellierungsentscheidung (das SP3-Format definiert den Code nur als Genauigkeitsangabe des Erzeugers; er wird hier als Ein-Sigma je Achse gelesen). Die vorhandenen aufgezeichneten Agenturläufe sind unverändert

# text
seg-e35df6881c80 = Planetare Gravitationsfelder aus PDS-SHADR-Tabellen

# text
seg-f78b73ae8742 = PDS-SHADR-Tabellen sphärischer Harmonischer lesen (from_shadr, auf SphericalHarmonicField in src/gravity_pds.rs: Einheitenumrechnung, C00 = { "1" } vorgegeben, Vollständigkeits- und Normierungsprüfungen) und die körperfeste Gravitation von Mars GMM-3 (Grad/Ordnung { "120" }) und des Mondfeldes GL0660B von GRAIL (Grad/Ordnung { "660" }) auswerten

# text
seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause), das dieselben PDS-Dateien liest und die Punktgravitation auswertet, als separates Programm ausgeführt, sowie die veröffentlichten Header und Labels der PDS-Produkte. Zielwerte vorab festgelegt in xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); alle erreicht (RESULTS.md). Daten: NASA PDS Geosciences Node, gemeinfrei; Ausschnitte bis Grad 20 mit NOTICE mitgeliefert, vollständige Dateien werden zur Testzeit geladen

# text
seg-ae3e8833a5ef = Ein veröffentlichtes Gravitationsfeld an einen Körper anhängen

# text
seg-ffb2b20e5f32 = with_gravity_field (auf Body, in src/gravity_pds.rs): hängt jedes geladene sphärisch-harmonische Feld (zum Beispiel GMM-3 oder GL0660B) an einen Body an, sodass der Propagator es körperfest auswertet; optional, Standardkörper unverändert

# text
seg-bcb731f7a9b5 = Nur interne Konsistenz. Jedes veröffentlichte Feld ist im körperfesten Bezugssystem seines Erzeugers definiert (GMM-3 im Mars-Bezugssystem von Konopliv et al. { "2006" }, GL0660B im Hauptachsen-Mondbezugssystem DE421), während das Feld im IAU-Bezugssystem ausgewertet wird; der Versatz ist nicht modelliert

# text
seg-659bfeba459c = Bahnbestimmung im Batch- und sequenziellen Verfahren

# text
seg-dbc98f498941 = Rekonstruktion eines Epochenzustands [r,v] aus Bodenstations-Entfernungen über einen Gauss–Newton-Batch-Differenzialkorrektor und ein sequenzielles Filter, über ein Zweikörper+J2-Kraftmodell

# text
seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — eine unabhängige Schätzbibliothek eines Dritten mit abgestimmtem Kraftmodell; rekonstruierter Epochenzustand + RMS der Residuen nach der Anpassung stimmen auf <{ "1e-3" } m rauschfrei und <{ "3" } m bei einem Rauschboden von { "5" } m überein

# text
seg-acdac055acb9 = Radiometrischer Lichtlaufzeit-Löser für den Weltraum

# text
seg-62a478e40850 = Retardierte (Abwärtsstrecke) einseitige Lichtlaufzeitlösung τ = |r_rx − r_target(t−τ)|/c für die radiometrische Navigation im Weltraum (Erde→Mars/Sonne/Mond)

# text
seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) Lichtlaufzeit mit konvergierter newtonscher Aberration (Aberration::CN; entspricht SPICE spkapo) über JPL DE440 — eine unabhängige SPICE-Implementierung in Rust; der Fixpunkt-Löser für die retardierte Lösung von kshana stimmte auf unter eine Nanosekunde überein. Die weiteren Zahlen zu Doppler / Shapiro / reduziert-dynamischer Bahnbestimmung bleiben MODELLED

# text
seg-c69ef9342160 = Satellitenposition aus der Broadcast-Ephemeride (Multi-GNSS-RINEX)

# text
seg-62702fc6f242 = Keplersche Broadcast-Ephemeride nach IS-GPS-200 / Galileo-OS / BeiDou-OS → ECEF-Satellitenposition aus einem geparsten RINEX-3-Navigationsdatensatz

# text
seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos(), aus C-Quelltext kompiliert (T. Takasu, BSD-2-Clause) — eine unabhängige Implementierung von IS-GPS-200/SIS-ICD, mit denselben RINEX-3-Navigationsdatensätzen gespeist; ECEF-Satellitenposition auf ~{ "62" } nm übereinstimmend. (Die Interpolation präziser SP3-Ephemeriden ist separat validiert — siehe „SP3-Interpolation präziser Ephemeriden“)

# text
seg-c807a782b20e = SP3-Interpolation präziser Ephemeriden

# text
seg-238de70daab9 = Lagrange-Interpolation nach IGS-Standard von Satellitenpositionen aus präzisen SP3-Ephemeriden mit der Erdrotationskorrektur je Stützstelle (jede Stützstelle um ω⊕·(t_node−t) in das erdfeste Bezugssystem des Abfragezeitpunkts drehen, bevor das Polynom angepasst wird)

# text
seg-e9249ae44a11 = RTKLIB peph2pos(), aus C-Quelltext kompiliert (preceph.c; T. Takasu, BSD-2-Clause) — die De-facto-IGS-Referenz, eine unabhängige Implementierung; der Interpolator von kshana (der jetzt dieselbe Erdrotationskorrektur der Stützstellen enthält) stimmte auf einem echten SP3-Produkt auf ~{ "15" } nm überein, gegenüber ~{ "5.5" } cm vor der Korrektur

# text
seg-9762cf428435 = Navigationsnachrichten-Encoder jenseits von GPS LNAV (GPS CNAV, Galileo I/NAV und F/NAV)

# text
seg-9b703b9607d8 = GPS-CNAV-Nachrichtentypen 10/11/30, Galileo-I/NAV-Worttypen 1-5 in nominellen geraden/ungeraden Seiten und Galileo-F/NAV-Seitentypen 1-4: ICD-Feldpackung und Quantisierung, CRC-24Q, Faltungscodierung der Rate 1/2 mit K={ "7" } (G2 invertiert bei Galileo), Blockverschachtelung und Synchronisationsmuster, mit passenden Test-Decodern

# text
seg-7939b210e83c = Interner Rundlauf und bekannte ICD-Antworten; kein Decoder eines Dritten wurde ausgeführt (das RTKLIB/GNSS-SDR-Harness, das KSHANA_NAVMSG_ORACLE_JSON liest, ist datengebunden). MODELLED

# text
seg-5ce7cd3d6011 = Leser für globale IONEX-Ionosphärenkarten und Interpolation auf einem echten CODE-GIM

# text
seg-502656556ddf = IONEX-{ "1.0" }-Leser (Header, I5-Werte fester Spalten, TEC- und RMS-Karten, absolute Epochen, fehlende Werte) mit bilinearer räumlicher Interpolation, der Zeitinterpolation des Formats mit nächster / aufeinanderfolgender / rotierter Karte (Gl. 1-3) und Slant-TEC der dünnen Schale

# text
seg-1575dc4cfb4a = Die gedruckten Werte des CODE-GIM (exakt an jedem Knoten; die Karte wird zur Testzeit geladen, nicht mitgeliefert, da ihre Lizenz unbestätigt ist) und eine unabhängige Neuimplementierung der IONEX-{ "1.0" }-Interpolationsformeln mit der Python-Standardbibliothek, mit dem Fixture festgeschrieben (Zielwerte vorab festgelegt e4d8b1f, { "1e-9" } TECU). Prüfung durch Dritte (B6, vorab festgelegt, erster Lauf): RTKLIB v2.4.2-p13 iontec (BSD-2-Clause, als separates Werkzeug ausgeführt) stimmt an { "6885" } Abfragepunkten mit IonexFile::vtec_at auf { "3.6e-13" } TECU in beiden Interpolationsmodi überein, gegen einen Zielwert von { "1e-5" } TECU. Datengebunden: CODE-GIM wird zur Testzeit geladen, SHA-fixiert; RTKLIB liest die vollständige Datei, weil sein getindex den Breitenausschnitt zurückweist. tests/fixtures/ionex_code_gim/fetch.sh lädt sie und prüft den SHA-256, der Test schlägt bei allen anderen Bytes fehl, und run_rtklib.sh ist der dokumentierte Reproduktionsweg (Netzwerkzugang erforderlich). Auf VALIDATED hochgestuft durch Entscheidung des Eigentümers auf Grundlage datengebundener Nachweise (2026-10-13)

# text
seg-974d8c1f7876 = Hatch-Trägerglättung des Codes auf echten RINEX-Beobachtungen

# text
seg-f26b5da0f52e = Divergenzfreies Hatch-Filter (ionosphärenfreier Code, getragen von der ionosphärenfreien Trägerphase, Fenster N Epochen, Neustart bei Lock-Verlust, Sprung der geometriefreien Kombination oder Lücke) in der Anordnung der präzisen Einzelpunktpositionierung

# text
seg-fac84cb9b256 = BEFUND gegen die veröffentlichte ITRF2020-Koordinate von WTZR: Die vorab festgelegten Zielwerte (geglätteter Median und p95 höchstens { "0.6" } x roh; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) wurden verfehlt, Verhältnisse { "0.718" } und { "0.923" }; der verbleibende Fehler im Meterbereich ist biasartig (C1C-Codebias, Antenne, Gezeiten, langperiodische Mehrwegeausbreitung), nicht das weiße Rauschen, das die Glättung entfernt. MODELLED: Die Statistik des Filters wird intern geprüft

# text
seg-2eec513ae8c8 = RTK-Doppeldifferenzen mit ganzzahliger Festsetzung per LAMBDA auf echten RINEX-Beobachtungen

# text
seg-6571676bf918 = Relative Positionierung auf kurzer Basislinie aus echtem Zweifrequenz-GPS-Code und -Trägerphase: Doppeldifferenzen gegen den höchsten Satelliten mit ihrer vollständigen Kovarianz, ein Float-Kalman-Filter über die Basislinie und Einzeldifferenz-Mehrdeutigkeiten mit Re-Initialisierung bei Sprüngen, ganzzahlige Kleinste-Quadrate-Schätzung mit LAMBDA mit Ratio-Test und die auf die festgesetzten ganzen Zahlen konditionierte Basislinie

# text
seg-e50c5d4b65c7 = Veröffentlichte ITRF2020-Koordinaten von WTZR und WTZZ (IGN ITRF2020_GNSS.SSC, Lösung { "3" }, mit den RINEX-Antennenhöhen), die die Referenzbasislinie ergeben; Zielwerte vorab festgelegt in tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md, bevor der Code geschrieben wurde. Nur kurze Basislinie: keine ionosphärischen oder troposphärischen Doppeldifferenzen modelliert

# text
seg-f9aa0c529393 = PPP-Zeitlösung der Empfängeruhr gegen die finale IGS-Stationsuhr

# text
seg-83ad9e893db9 = Die vom statischen Float-PPP-Filter auf echtem Zweifrequenz-GPS-Code und -Phase mit finalen IGS-Bahnen und -Uhren geschätzte Empfängeruhr: ein Zeitvergleich vom Empfänger zur IGS-Zeit, die ionosphärenfreie PPP-Zeitlösung.

# text
seg-91a882dd71e8 = Die finale kombinierte IGS-Uhr für die Station WTZR (AR-Datensätze von IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, eine Kombination der Netzlösungen mehrerer Analysezentren; IGS-Produkte, freie Nutzung mit Namensnennung); Zielwerte vorab festgelegt in xval/ppp-time/PREREGISTRATION.md vor jedem Vergleich; alle im ersten Lauf eingehalten. WAS NICHT GEPRÜFT IST: eine Station und ein zweistündiges konvergiertes Fenster; IGS-Zeit, nicht UTC(k); der konstante Versatz enthält Empfänger-Codebiase und ist begrenzt, nicht kalibriert; keine Rückführbarkeit auf Circular T.

# text
seg-a9b2a93401a3 = Float-Präzisionspunktpositionierung auf echten RINEX-Beobachtungen

# text
seg-cc991ccec112 = Statisches erweitertes Float-PPP-Kalman-Filter auf echtem Zweifrequenz-GPS-Code und -Trägerphase mit finalen IGS-Bahnen und -Uhren: ionosphärenfreie Kombination, Satelliten- und Empfängerantennen-Offsets (Empfängervariationen), feste Erdgezeiten, Phase-Wind-up, Shapiro-Verzögerung, geschätzte Zenit-Feuchteverzögerung, Float-Mehrdeutigkeiten je Bogen mit Sprungerkennung per geometriefreier Kombination / Melbourne-Wübbena

# text
seg-36e7c9286af7 = Veröffentlichte ITRF2020-Koordinate von WTZR (IGN ITRF2020_GNSS.SSC, Lösung { "3" }, mit ihrer Geschwindigkeit fortgeschrieben) — Zielwerte vorab festgelegt in tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md, bevor das Filter geschrieben wurde; Entwicklung nur auf der kolokierten Station WTZZ. Nicht modelliert: Ozeanauflast, PCV der Satelliten, Auflösung der ganzzahligen Mehrdeutigkeit

# text
seg-c8d87abed330 = Lesen von RINEX-{ "4" }-Navigationsdateien

# text
# c1: > EPH
seg-28913a01af00 = RINEX-4.00-4.02-Navigationsdateien: <c1/>-Datensätze von GPS LNAV, Galileo I/NAV und F/NAV, BeiDou D1/D2 und QZSS LNAV, in den Broadcast-Ephemeriden-Typ dekodiert; CNAV-, CNV1-3-, FDMA-, SBAS-, STO-, EOP- und ION-Datensätze bis zum nächsten Datensatz-Header übersprungen; ein Datensatz, dessen Header einen anderen Satelliten nennt, oder ein abgeschnittener Datensatz wird zurückgewiesen

# text
seg-687b3b159691 = Die zusammengeführte RINEX-{ "3" }-Broadcast-Datei des IGS desselben Tages (veröffentlichte Daten, von einem anderen Dateigenerator aus denselben Broadcast-Nachrichten geschrieben); Zielwerte vorab festgelegt in tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) vor dem ersten Lauf

# text
seg-278ca396127a = Lesen von RINEX-{ "4" }-Beobachtungsdateien

# text
seg-e0883aa933eb = RINEX-4.0x-Beobachtungs-Header (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; Labels in den Spalten 61-80 ab Version { "4" } erkannt) und Epochendatensätze

# text
seg-971fb1203a6d = Formatprüfung an einer echten veröffentlichten RINEX-{ "4.00" }-Datei (zurückgelesene Werte entsprechen den gedruckten Literalen der Datei) und einem aus der Spezifikation abgeleiteten Header; es wurde kein unabhängiger Leser ausgeführt, daher MODELLED

# text
seg-33e5c74720ff = BeiDou-GEO-Satellitenposition aus Broadcast

# text
seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } Position eines geostationären Satelliten aus einer Broadcast-Ephemeride (inertialähnliches Bezugssystem, dann Rz(Ω̇e·tk)·Rx(−{ "5" }°)), optional über das Feld include_beidou_geo von NavParseOptions, sodass der Standard-Leser GEOs weiterhin überspringt

# text
seg-06d500099814 = Vorab festgelegt (7aa264b, 110fef9) gegen eine präzise IGS-MGEX-Bahn mit den GEOs; aus der Sitzung, die es gebaut hat, war kein solches Produkt erreichbar, daher steht der Vergleich aus und die Zeile ist MODELLED (nur gegen die veröffentlichten nominellen GEO-Positionen geprüft)

# text
seg-559814996a4c = Interpolation präziser SP3-Uhren

# text
seg-8e7a0dbd1755 = Satellitenuhrversatz zwischen den tabellierten SP3-Uhrknoten durch lineare Interpolation über die beiden einschließenden gültigen Knoten (das RTKLIB-Schema pephclk; Schlechtuhr-Sentinel übersprungen), und dieselben Knoten, als Datensätze äquivalent zu RINEX-Uhren in die Kette der Präzisionsprodukte eingespeist

# text
seg-1f4f0f841802 = Finale IGS-Satellitenuhr-Kombination mit { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24): veröffentlichte Uhrschätzungen zu den Abfragezeitpunkten, nicht aus dem SP3 interpoliert; Zielwerte vorab festgelegt in tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md vor dem ersten Lauf (RMS { "0.15" } ns, p95 { "0.30" } ns, Knotenmedian { "1e-12" } s, Diskriminierung 2x)

# text
seg-71f48628ebb2 = Trägerphasen-eng gekoppeltes GNSS/INS mit Float-Mehrdeutigkeiten

# text
seg-5a156aa81275 = Fehlerzustands-EKF über { "15" } INS-Zustände, eine Empfängeruhr mit zwei Zuständen und eine Float-Trägermehrdeutigkeit je verfolgtem Satelliten; Pseudostrecke, Trägerphase und optional Entfernungsrate aus einer SGP4-Walker-Konstellation (Lichtlaufzeit und Sagnac), Klobuchar- und Saastamoinen/Niell-Korrekturen, in der Schleife an der eigenen Position des Filters angewendet; Sprungerkennung per zeitdifferenzierter Trägerphase mit einer je Satellit durch die Geschwindigkeitsunsicherheit verbreiterten Schwelle; Re-Initialisierung der Mehrdeutigkeit bei Sprüngen und Wiedererfassung

# text
seg-00576e8c1032 = Interne Konsistenz: Die Messungen werden aus den Modellen synthetisiert, die das Filter verwendet (χ² NEES/NIS über Seeds, eine rauschfreie Konvergenz, Sprunginjektion). MODELLED; es werden keine echten Empfängerdaten und kein Filter eines Dritten verglichen

# text
seg-7d644516b1ec = GNSS/INS-Pakete für Schifffahrt, Bahn und Luftfahrt mit einer Option zur engen Kopplung

# text
seg-cbb03a8baf73 = Drei gnss-ins-Szenarien auf der Trajektorienbibliothek (ein Schiff, das mit { "8" } m/s schlingert, mit einem Ausfall von fünf Minuten; ein Zug durch einen Einschnitt mit zwei Satelliten und einen Tunnel; ein Flugzeug, dessen Ausfall eine Kurve mit 25 Grad Querneigung umfasst) und die optionale [tight]-Tabelle des Pakets: Pseudostrecken aus einer SGP4-Walker-Konstellation, vom Navigator mit geschlossener Schleife fusioniert, jeder Satellit über der Maske im Nominalfall und die höchsten wenigen im degradierten Fall

# text
seg-273c14256d4c = Intern: die Gütemaße jedes Pakets gegen seine eigene Wahrheit und ein Vergleich lose/eng auf identischen Eingaben. MODELLED; der Vergleich mit NaveGo aus dem Audit wurde nicht ausgeführt

# text
seg-f4dab73c4eda = Gekoppeltes Pseudostrecken-PNT-Filter mit Bias-Zustand und 3D-Erweiterung im Fusionspaket

# text
seg-742b60089361 = Ein gestapeltes Kalman-Filter über Position, Geschwindigkeit, Uhrphase und Frequenz, gespeist mit Pseudostrecken, die Position und Uhr koppeln (Updates in Joseph-Form, die die Kreuzkovarianz mitführen); eine 1-DOF-Variante, erweitert um einen konstanten Beschleunigungsmesser-Bias-Zustand, die das Fusionspaket unter [coupled] ausführt; und die 3D-Version mit 8 Zuständen und Sichtlinienzeilen

# text
seg-9558d7aad3af = Interne Konsistenz: Wahrheit aus den eigenen Modellen der Filter simuliert (χ² NEES über Monte-Carlo-Seeds, das entkoppelte Paket auf identischen Sensoren). MODELLED

# text
seg-4a64aa1fe3ca = Lose gekoppeltes GNSS/INS-EKF mit Hebelarm auf dem KF-GINS-Datensatz

# text
seg-30f503856ac5 = Der Fehlerzustands-EKF mit 15 Zuständen und geschlossener Schleife, angetrieben durch IMU-Inkremente, mit GNSS-Antennenpositionen, die über das Hebelarmmodell H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }] fusioniert werden, konfiguriert aus einer KF-GINS-YAML-Datei (Anfangszustand und Sigmas, ARW/VRW, Gauss-Markov-Biase)

# text
seg-b01d28a09abe = Die veröffentlichte Referenztrajektorie des Datensatzes und das KF-GINS-C++-Programm (GPL-3.0, Commit 8291a93e, als separates Werkzeug ausgeführt); Zielwerte vorab festgelegt in xval/kfgins/PREREGISTRATION.md, und KF-GINS wurde vor dieser Registrierung nicht auf diesen Daten ausgeführt (in den Ergebnissen geprüft). Alle sechs Zielwerte im ersten Lauf eingehalten. DATENGEBUNDEN: Der KF-GINS-Demodatensatz (echte Leador-A15-IMU und RTK-GNSS mit einer Referenztrajektorie) trägt keine Lizenz und wird daher nicht mitgeliefert; xval/kfgins/fetch.sh lädt ihn zur Testzeit mit festgelegtem SHA-256 jeder Datei, und der Test schlägt bei einer Abweichung fehl; der Reproduktionsweg, der Netzwerkzugang benötigt, steht in xval/kfgins/PREREGISTRATION.md. Auf VALIDATED hochgestuft durch Entscheidung des Eigentümers auf Grundlage datengebundener Nachweise (2026-10-13)

# text
seg-e6b6c605564c = Von den Bewegungsdatei-Lesern eines Simulators (gps-sdr-sim) gelesener Testbench-Export

# text
seg-a07429aa1998 = Die Bench-Export-Bewegungsdateien, die den eigenen Lesern eines Open-Source-GNSS-Simulators übergeben werden, kommen als exportierte Trajektorie zurück: die NMEA-GGA-Datei (-g), der Ausschnitt aus Zeit/Breite/Länge/Höhe der Bewegungs-CSV (-x) und ihr Ausschnitt aus Zeit/x/y/z (-u), an { "6" } gnss-ins-Szenarien (einschließlich der Pakete für Schifffahrt, Bahn und Luftfahrt, bis zur Obergrenze des Simulators von 3000 Abtastwerten gelesen) und { "2" } stationären. Nur Bewegung; es wird kein Signal geschrieben oder erzeugt.

# text
seg-07b5f46a900f = WAS EXTERN GEPRÜFT WIRD, eng gefasst: gps-sdr-sim (MIT, Commit 28ca29a6) readNmeaGGA, readUserMotion und readUserMotionLLH mit seinem eigenen WGS-{ "84" }-llh2xyz, über xval/testbench-gpssdrsim/driver.c aufgerufen (keine Signalfunktion aufgerufen), gegen die erdfesten Spalten der Bewegungs-CSV Zeile für Zeile, mit Zielwerten, die vor jedem Lauf in xval/testbench-gpssdrsim/PREREGISTRATION.md vorab festgelegt wurden: jeder Abtastwert in allen { "8" } Szenarien gelesen; NMEA schlechtester Wert { "1.21" } mm (Zielwert { "1" } cm); LLH-Ausschnitt schlechtester Wert { "0.145" } mm (Zielwert { "1" } mm); erdfester Ausschnitt mit vier Spalten exakt (Zielwert { "1" } um, Änderung { "1" }); gnss-ins-Zeilen auf dem { "10" }-Hz-Raster des Simulators auf { "2.3e-13" } s. BEFUND (Lauf { "1" }, festgeschrieben): Die vollbreite CSV ohne Header ist mit -u nicht lesbar, weil der 100-Zeichen-Zeilenpuffer des Lesers jede 161 Zeichen lange Zeile in zwei Abtastwerte teilt; docs/TEST-BENCH.md gibt den Ausschnitt mit vier Spalten an. WAS NICHT GEPRÜFT IST: die Physik der Wahrheitstrajektorie des Szenarios; die Signalausgabe von gps-sdr-sim; der Leser irgendeines anderen Simulators; irgendein Empfänger.

# text
seg-2db2b9dc3b45 = GNSS/INS-Trajektorienbibliothek und CSV-Wahrheitsimport

# text
seg-e1fe83c75a6c = Wählbare Bewegungsprofile für das gnss-ins-Paket (geradeaus, Figur-8, städtisches Stop-and-go, Flugzeugsteigflug und koordinierte Kurve, Vermessungsdrohne), definiert durch Euler-Raten- und Längsbeschleunigungs-Kommandos, geschlossen auf den Wahrheitszustand mit der kinematischen IMU (Zentripetal-, Gravitations- und Coriolis-Terme), und importierte CSV-Wahrheit, in die IMU umgesetzt, die sie reproduziert; die historische Fahrt unverändert, wenn kein Profil angegeben ist

# text
seg-30ea002a06a0 = Intern: Identitäten der Starrkörperkinematik, der CSV-Rundlauf und die eigene Kovarianz des Filters. MODELLED (es wird kein echtes Fahrtenprotokoll verglichen)

# text
seg-8685fd899e3c = Strapdown-INS-Mechanisierung

# text
seg-ba942e322f8a = Strapdown-Inertialmechanisierung mit Quaternionen-Lage, WGS-84-NED (Coning/Sculling-kompensiert), die einen Navigationszustand aus (Δθ, Δv)-Inkrementen fortschreibt

# text
seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3), unter Octave ausgeführt — eine unabhängige veröffentlichte INS-Toolbox, angetrieben vom identischen (Δθ,Δv)-Inkrementstrom. Die Lage stimmt bitgenau überein (gleiche Konventionen für NED / Quaternion mit Skalar zuerst / Erdrate / Transportrate); Geschwindigkeit/Position stimmen bis auf zwei dokumentierte Unterschiede überein — den Nord-Gravitationsterm der Lotabweichung, den NaveGo einschließt und kshana absichtlich auslässt (Lotschwere; mit der geschlossenen Form nach Groves auf jede Stelle übereinstimmend, mit einer Plausibilitätsuntergrenzen-Assertion) und Integratorunterschiede der Ordnung O(dt²) — keine Mechanisierungsfehler

# text
seg-d1a5c8e7ca74 = Synthese von Gravitationsfeld-Funktionalen (gravitationsgestützte / GNSS-freie Navigationskarte)

# text
seg-8336eb12eb7b = Sphärisch-harmonische Gravitationsstärke + Störung (mGal) aus jedem ICGEM-.gfc-Modell; GRS80-Normalschwere

# text
seg-b5a7fc986751 = GRS80 (Moritz { "1980" }, IAG) Somigliana-Normalschwere + veröffentlichte γ_e/γ_p; echtes ICGEM-EGM2008-Feld

# text
seg-86f9186bb884 = Erde-Mond-CR3BP-{ "9" }:{ "2" }-NRHO gegen die von CAPSTONE geflogene Bahn

# text
seg-d4127cf241f3 = Die kreisförmig eingeschränkte südliche nahezu geradlinige Halo-Bahn (NRHO) mit L2 und { "9" }:{ "2" }, die cr3bp::differential_correct_halo korrigiert (die Bahnfamilie von Gateway und CAPSTONE), verglichen für ihre mittlere Geometrie (Periode, Perilunradius, Apolunradius) mit der Bahn, die CAPSTONE tatsächlich geflogen ist. Eine Messung dafür, wie gut das CR3BP-Mitglied die reale Bahn beschreibt; eine CR3BP-Bahn ist keine Bahn eines Ephemeridenmodells und wird nicht Epoche für Epoche verglichen

# text
seg-e0cc33dfb10b = Gemessen gegen die rekonstruierte CAPSTONE-Ephemeride von JPL Horizons (NAIF -1176, CAPSTONE_merged, mondzentriertes ICRF, 2023-03-01..31 mit { "10" } min), byteweise festgeschrieben (tests/fixtures/capstone_horizons/, NOTICE.md), vorab festgelegt { "4e868170" } vor dem Abruf, als Messung mit Zielwerten für die mittlere Geometrie. Keine Validierung: Das CR3BP lässt die Sonne, die Exzentrizität des Mondes und die von CAPSTONE durchgeführte Bahnhaltung aus, daher beschreiben die Zielwerte, wie repräsentativ die Modellbahn ist, nicht eine Genauigkeit. Ergebnisse: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-c866a5bd4318 = CR3BP-Rotationszustände, auf der Erde-Mond-Linie nach DE440 in mondzentriertes ICRF abgebildet

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf bildet einen dimensionslosen rotierenden Erde-Mond-CR3BP-Zustand auf eine mondzentrierte ICRF-Position und -Geschwindigkeit auf der momentanen Erde-Mond-Linie ab (Längeneinheit der Erde-Mond-Abstand, Zeiteinheit die inverse Bahnrate, die volle Winkelgeschwindigkeit des Bezugssystems einschließlich seiner Rate außerhalb der Ebene aus der Beschleunigung des Mondes), mit der Umkehrung from_moon_centred_icrf, und cr3bp::to_moon_centred_icrf_de440 liest den geozentrischen Mondzustand aus einem DE440-SPK. Es bildet Zustände ab; es macht eine CR3BP-Bahn nicht zu einer Bahn eines Ephemeridenmodells

# text
seg-d91ce10ea439 = NAIF SPICE Toolkit (CSPICE N0067 über spiceypy { "8.3.0" }) sxform eines dynamischen Zwei-Vektor-Bezugssystems (primär +X entlang der Position des Mondes bezüglich der Erde, sekundär +Y entlang seiner Geschwindigkeit, de440s), angewendet auf den dimensionsbehafteten rotierenden Zustand, der aus dem eigenen Mondzustand von SPICE gebildet wird, durch ein separates Programm, das keinen Kshana-Code aufruft (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Vorab festgelegt 2313eb1b, vor jedem Lauf in d5ef79b3 geändert, um die Winkelgeschwindigkeit des Bezugssystems außerhalb der Ebene einzuschließen (ohne sie wäre die Geschwindigkeit um bis zu { "8e-2" } m/s abweichend). Nur eine Bibliotheksprüfung der Transformation. Ergebnisse: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

# text
seg-d543e3e84f36 = Sonnensystem-Art auf einem JPL-Kernel (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = Die Art <c1/> mit planetary_kernel_path: Jeder gemeldete Körper, dessen eigenen NAIF-Code der SPK enthält, bezieht seine heliozentrische J2000-Position und -Geschwindigkeit über den eigenen Leser der Engine aus dem Kernel (Label KERNEL), eine Verbindung, deren beide Enden im Kernel liegen, wird darauf berechnet, Baryzentren werden nie für einen Planeten eingesetzt, und jeder andere Körper bleibt analytisch mit seinem eigenen Label; der Bericht erhält einen Kernel-Block (Pfad, SHA-256, die daraus entnommenen Körper und Verbindungen) nur, wenn die Option gesetzt ist. Mit de440s.bsp sind das Merkur, Venus, die Erde und der Mond

# text
seg-05cc6642285b = NAIF SPICE Toolkit (CSPICE N0067 über spiceypy { "8.3.0" }) spkezr, heliozentrische Zustände auf der vollständigen de440s.bsp, ein separates Programm, das keinen Kshana-Code aufruft (tests/fixtures/solar_system_kernel/, NOTICE.md); die Engine liest bitgenaue Ausschnitte von de440s. Vorab festgelegt f8e946ea. Eine Bibliotheksprüfung der Verdrahtung: DE440 selbst und die analytischen Körper werden hier nicht validiert. Ergebnisse: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

# text
seg-7f3d53b4e8d1 = Porkchop-Diagramm auf der DE440-Ephemeride

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel: der Durchlauf über Starttermin x Ankunftstermin von Abflug-C3 (km²/s²) und Ankunfts-V-Unendlich (km/s) mit dem prograden Lambert-Löser für eine Umdrehung und der Kollinearitätssperre von { "0.5" } Grad, auf den heliozentrischen J2000-Zuständen zweier beliebiger NAIF-Körper, die vom eigenen Leser der Crate aus einem JPL-DE440-SPK gelesen werden. Eine Umdrehung, prograd, keine Randbedingungen für Trägerrakete oder Ankunft: ein Durchlauf, kein Missionsentwurf

# text
seg-bd19ca214f29 = NAIF SPICE Toolkit (CSPICE N0067 über spiceypy { "8.3.0" }) heliozentrische Zustände auf de440s.bsp und pykep { "3.0.1" } lambert_problem (ESA, der C++-Kern kep3, MPL-2.0), ein unabhängiger Lambert-Löser, als separates Programm ausgeführt, das keinen Kshana-Code aufruft (tests/fixtures/porkchop_de440/, NOTICE.md); die Engine liest einen bitgenauen Ausschnitt von de440s. Vorab festgelegt 2d857fb1. Eine Bibliotheksprüfung des Durchlaufs. Ergebnisse: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

# text
seg-b1401bed5da8 = Optimierer für impulsive Transfers auf der DE440-Ephemeride

# text
seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: die Abflug- und Ankunftstermine eines ballistischen Zwei-Impuls-Transfers mit einer Umdrehung, die den Abflug-C3 oder das Ankunfts-V-Unendlich innerhalb von Typ I oder Typ II minimieren, als kontinuierliches Optimum (ein 2-Tage-Raster über beide Fenster, dann 2D-Nelder-Mead), auf heliozentrischen Zuständen aus dem DE440-SPK. Ein Terminoptimierer für eine Teilstrecke, kein Missionsentwurf: keine Optionen für Trägerrakete, Parkbahn, Deep-Space-Manöver oder mehrere Umdrehungen

# text
seg-6c695aef043b = Ein unabhängiger Optimierer: NAIF SPICE Toolkit (CSPICE N0067 über spiceypy { "8.3.0" }) heliozentrische Zustände auf demselben de440s-Ausschnitt, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) und SciPy { "1.18.1" } Nelder-Mead, ohne Aufruf von Kshana-Code. Das NASA-Handbuch Erde-Mars (MIDAS, Ephemeride nicht angegeben, 2-Tage-Terminraster) ist eine zweitrangige veröffentlichte Referenz und bestimmt den Status nicht

# text
seg-93f3cdbb7297 = Lambert-Transferlöser für mehrere Umdrehungen

# text
seg-995a6a995b78 = Jede Lösung des Lambert-Problems mit bis zu drei vollständigen Umdrehungen (maneuver::lambert_multirev: die Lösung mit einer Umdrehung, dann der linke und der rechte Zweig jeder Umdrehungszahl, Izzo { "2015" }), mit den Randgeschwindigkeiten v1 und v2, für prograde und retrograde Transfers, in kanonischen und heliozentrischen SI-Einheiten, einschließlich Transfers innerhalb von { "1" } % der minimalen Flugzeit einer Umdrehungszahl und Geometrien nahe 180 Grad. Nur ein Zweikörper-Löser (keine Störungen)

# text
seg-77c43836cafe = pykep { "3.0.1" } lambert_problem (ESA, der C++-Kern kep3, MPL-2.0), eine unabhängige Bibliothek, von scripts/gen_lambert_multirev_ref.py als separates Programm ausgeführt; nur ihre numerische Ausgabe ist festgeschrieben. Vorab festgelegt a75de851 (Fallmenge, Zielwerte, Ergebnisregel) vor jedem Vergleich; die Referenz wurde unabhängig neu erzeugt und ist byte-identisch. Ergebnisse: docs/design/evidence/lambert-multirev/RESULTS.md

# text
seg-ff9c6140fe1c = Lambert-Zweikörper-Transferlöser

# text
seg-d8c39ced64b2 = Lambert-Löser nach Izzo-2015 für eine Umdrehung (r1, r2, Flugzeit → Randgeschwindigkeiten) über LEO→GEO→heliozentrische Transfers, prograd und retrograd

# text
seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — ein unabhängiger Lambert-Löser eines Dritten. Das Lambert-Problem mit einer Umdrehung (M={ "0" }) hat eine eindeutige Lösung, daher ist die Übereinstimmung von Bibliothek gegen Bibliothek eine echte externe Prüfung; auf <{ "1e-4" } m/s übereinstimmend (beobachtet ~{ "1e-11" }), dieselbe Art von Validierung, die DOP gegen gnss_lib_py erhält

# text
seg-347cece5df63 = Bezugssysteme und Zeitskalen

# text
seg-5a4bc2c15eaa = IAU-2006/2000A-Präzession-Nutation, CIO GCRS↔ITRS, Zeitskalen mit Schaltsekunden

# text
seg-51d28ab9d256 = Referenzvektoren von IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-c3d4b9bef817 = Zweiteilige Julianische Daten und Schaltsekunden auf dem Zeitpfad der Erdbahn

# text
seg-5e859e3aa613 = Ein UTC-Kalenderdatum samt Uhrzeit zu einem zweiteiligen Julianischen UTC-Datum nach der SOFA-dtf2d-Konvention für Tage, die mit einer Schaltsekunde enden ({ "86 401" } s lang, { "23" }:{ "59" }:{ "60" }.x gültig), UTC zu TAI und zurück, und UT1 aus UTC über TAI, auf zweiteiligen Daten ab 1972-01-01: der Zeitpfad, den SGP4 (Sgp4::propagate_at, gemessen ab einer zweiteiligen Epoche) und die erdfeste Rotation nach IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop mit dem zweiteiligen Erdrotationswinkel) nehmen

# text
seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; die SOFA-Algorithmen, wie sie vom ERFA-Projekt freigegeben werden), eine unabhängige Bibliothek: erfa.dtf2d("UTC"), erfa.utctai und erfa.taiutc auf den festgeschriebenen Zeitpunkten, die Abweichung teilweise auf den zweiteiligen Daten gebildet, Zielwert { "1e-6" } s vor dem Lauf festgelegt (vorab festgelegt e947e69d). Schlechteste Abweichung { "9.6e-12" } s (dtf2d) und { "1.9e-11" } s (utctai, taiutc). Wird jeder UTC-Tag als { "86 400" } s genommen oder der Schalttagsanteil nicht skaliert, wird der Test rot. UT1 über TAI (iauUtcut1) wird durch den ERFA-Zweig der Zeile zum Pfad der Erdbahn geprüft. Geltungsbereich: UTC ab 1972-01-01; das frühere UTC mit driftender Rate ist nicht modelliert

# text
seg-f1c7bc235a6b = Zweiteilige Julianische Daten bis zur Erdrotation auf dem Bahnpfad

# text
seg-cee11d4bad08 = Erdrotation aus einem zweiteiligen Julianischen UT1-Datum auf dem Bahnpfad, sodass die erdfeste Position die Mikrosekunde behält, die ein einzelnes f64-Datum verliert (etwa { "3e-9" } rad nahe { "2020" }): jd2::gmst82 (IAU-{ "1982" }-GMST, die TEME-Konvention, auf den zwei Teilen), cio::gcrs_to_itrs_matrix_jd2 (die CIO-Matrix GCRS nach ITRS mit dem Erdrotationswinkel aus den zwei Teilen) und, darauf aufgebaut und intern geprüft, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 und own_jd2_utc, die optionale two_part_jd des Ephemeriden-Szenarios (die ECEF-Position, Bodenspur und Stationssicht; standardmäßig aus, unverändert) und verlustfreie From-Konvertierungen zwischen jd2::Jd2 und timescales::TwoPartJd. Präzession-Nutation und die Epoche des Cowell-Kraftmodells bleiben einfaches f64, wo eine Rundung von { "40" } us unter { "1e-15" } rad oder weit unter dem Fehler der analytischen Sonnen-/Mondephemeride liegt

# text
seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; die SOFA-Algorithmen, wie sie vom ERFA-Projekt freigegeben werden), eine unabhängige Bibliothek: gmst82 und c2t06a auf den festgeschriebenen zweiteiligen Daten, Polbewegung { "0.1" } und { "0.3" } Bogensekunden. Vorab festgelegt b10475ee (Daten, Zielwerte), bevor die Funktionen geschrieben und bevor die unabhängige Referenz ausgeführt wurde. Die internen Tests (die Szenario-Option, der TEME/ITRF-Rundlauf, die Typkonvertierungen) sind unterstützende Selbstkonsistenz

# text
seg-096df3971f5f = Bezugssystem-Matrizen gegen ERFA-Vektoren: IAU-{ "2006" }-Bias-Präzession, TEME nach GCRS und die CIO-Kette mit Offsets des Himmelspols

# text
seg-731a5ed967b3 = Drei Bezugssystem-Matrizen, die Element für Element oder nach Drehwinkel mit ERFA zu beliebigen Epochen verglichen werden: precession::precession_matrix (IAU-{ "2006" }-Bias-Präzession durch Fukushima-Williams-Winkel), nutation::teme_to_gcrs_matrix (die Rotation TEME nach GCRS P^T N^T Rz(-EE) mit IAU-{ "2006" }-Präzession, IAU-2000B-Nutation und der Äquinoktiengleichung mit ihren zwei führenden komplementären Termen) und cio::gcrs_to_cirs_matrix_with_offsets (die Rotation GCRS nach CIRS mit den IERS-Offsets des Himmelspols dX, dY, die vor der Rotation zu den Modell-CIP-X, -Y addiert werden, die Konvention des SOFA-Kochbuchs; neu). Die Modellentscheidungen selbst (2000B-Nutation auf dem TEME-Pfad, die komplementäre Reihe mit zwei Termen) sind nicht validiert, nur ihre Implementierung

# text
seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; die SOFA-Algorithmen, wie sie vom ERFA-Projekt freigegeben werden), eine unabhängige Bibliothek: pmat06; numat(obl06, nut00b) mit der Äquinoktiengleichung aus eect00 (die vollständige komplementäre Reihe), zusammengesetzt als P^T N^T Rz(-EE); xys06a, dann c2ixys(X + dX, Y + dY, s). Vorab festgelegt 979c1e39 (Epochen, Offsets und Zielwerte), bevor die unabhängige Referenz ausgeführt wurde. Das TEME-Residuum von { "1.1e-10" } rad ist die vorhergesagte Wirkung davon, zwei komplementäre Terme beizubehalten (etwa { "3" } mm auf einer GNSS-Bahn)

# text
seg-4e2fe2e3dabb = UTC vor 1972 (Ära mit driftender Rate) auf dem Zeitpfad zweiteiliger Julianischer Daten

# text
seg-1d086e669f09 = UTC von 1960-01-01 bis 1971-12-31, als UTC mit einer Ratenabweichung gegenüber TAI lief und in Sekundenbruchteilen gestuft wurde, auf dem Pfad zweiteiliger Julianischer Daten: TAI - UTC aus der Drifttabelle jeder Periode (timescales::tai_minus_utc_on_date), das UTC-Kalenderdatum zu einem zweiteiligen Julianischen UTC-Datum mit der Tageslänge { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC zu TAI mit dem von UTC auf SI-Sekunden skalierten Tagesanteil (jd2::utc_to_tai) und TAI zurück zu UTC (jd2::tai_to_utc), nach SOFA dtf2d, utctai und taiutc. Vor { "1960" } wird TAI - UTC als { "0" } genommen (der Wert von SOFA; UTC undefiniert) und liegt außerhalb der Aussage. Das einfache f64 timescales::tai_minus_utc begrenzt vor { "1972" } weiterhin auf { "10" } s und wird nicht abgedeckt

# text
seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; die SOFA-Algorithmen, wie sie vom ERFA-Projekt freigegeben werden), eine unabhängige Bibliothek: erfa.dtf2d("UTC"), erfa.utctai und erfa.taiutc auf den festgeschriebenen Zeitpunkten, die Abweichung teilweise gebildet. Vorab festgelegt 23c40661 (Zeitpunkte, Toleranz und die Prüfsumme ab { "1972" }), bevor die Engine geändert und bevor die unabhängige Referenz ausgeführt wurde. Die Drifttabelle ist aus derselben SOFA-iauDat-Tabelle übertragen, die die unabhängige Referenz verwendet, sodass der Vergleich die Umrechnungsarithmetik (Tageslänge, Skalierung UTC nach SI, Iteration) abdeckt, nicht die historische Tabelle selbst

# text
seg-efacec095051 = GLONASS-Broadcast-Satellitenuhr und Broadcast-Bahnfortschreibung

# text
seg-821b9c01b56e = Der GLONASS-Broadcast-Satellitenuhrversatz -tau_n + gamma_n (t - t_b) zu einer auf der Satellitenuhr gelesenen Zeit (glonass::GlonassEphemeris::sv_clock_bias_s, der um den Uhrversatz korrigierte Offset durch zwei Fixpunktiterationen) und die erdfeste PZ-90-Position des Broadcast-Zustandsvektors, per RK4 durch die GLONASS-ICD-Bewegungsgleichungen innerhalb von +/-15 min um die Referenzepoche fortgeschrieben (GlonassEphemeris::position_ecef), aus echten RINEX-{ "3" }-GLONASS-Navigationsdatensätzen. Es wird keine Transformation PZ-90.11 nach ITRF angewendet (sie stimmen seit { "2014" } auf Zentimeterebene überein; RTKLIB wendet auch keine an). Nicht in eine Szenarioausgabe eingebunden: Bibliotheksfunktion

# text
seg-4478a2518341 = RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, Commit 71db0ffa) geph2clk und geph2pos, aus C-Quelltext in einem separaten Harness (xval/rtklib-glonass) kompiliert, das dieselbe RINEX-Datei mit dem eigenen Leser von RTKLIB liest, sodass das Parsen, das Vorzeichen von -tau_n, die Einheiten und die Iteration ebenso verglichen werden wie die Uhr und die Bahn. Vorab festgelegt e099c42a, bevor die Funktion existierte und bevor das Harness gebaut wurde. Beide Seiten werten dieselbe geschlossene Uhrenformel aus, daher deckt der Uhrenvergleich die Implementierung ab, nicht die Formel. Die Bahnintegratoren unterscheiden sich (RTKLIB schreitet in { "60" }-s-Schritten, dann den Rest, Kshana in gleichen Schritten von höchstens { "60" } s) und ebenso die Konstanten (RTKLIB mu { "3.9860044e14" }, Kshana das PZ-90.11 { "3.986004418e14" }); der schlechteste Fall von { "1.1" } mm ist dieser Unterschied, wie vor dem Lauf vorhergesagt. Geltungsbereich: die Broadcast-Ephemeride innerhalb ihres Gültigkeitsintervalls, nicht die wahre Bahn oder Uhr (kein Vergleich mit Präzisionsprodukten)

# text
seg-d3b72a6fbb18 = Ein Erdbahn-Pfad: SGP4-Elementsätze zu GCRS und ITRS auf der Kette nach IAU 2006/2000A mit Erdorientierungsparametern

# text
seg-e4eca7205b5e = Der Fortschreibungs- und Bezugssystempfad, den jede geroutete Erdbahn-Art teilt: ein mittlerer SGP4-Elementsatz mit einer zweiteiligen UTC-Epoche (sgp4::MeanElementSet, aus Elementen des Konstellationsentwurfs durch MeanElementSet::from_earth_fixed gelesen), durch SGP4/SDP4 nach TEME fortgeschrieben (sgp4::SgpOrbit), und die Rotationen TEME -> ITRS und GCRS -> ITRS der Kette nach IAU 2006/2000A mit UT1 - UTC und Polbewegung (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, die Formen ohne Parameter teme_to_itrs_matrix und gcrs_to_itrs_matrix). TEME ist der wahre Äquator des Datums mit dem mittleren Äquinoktium, vom GCRS aus erreicht über die IAU-{ "2006" }-Bias-Präzession, die IAU-2000B-Nutation und die Äquinoktiengleichung

# text
seg-44f28276f859 = Zweig { "1" }: python-sgp4 { "2.24" } (MIT-Lizenz; D. Vallados C++-Referenz-SGP4, der Code, der die Verifikationsvektoren AIAA 2006-6753 erzeugt hat), WGS-72, verbesserter Modus. Zweig { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, die SOFA-Routinen): c2t06a mit TT aus utctai/taitt und UT1 aus utcut1, und für TEME c2t06a . pnm06a^T . rz(-ee06a). Zielwerte vor dem Lauf festgelegt (vorab festgelegt 72ea9eb0). Offengelegt: Der erste Lauf scheiterte in Zweig { "2" } bei 2016-12-31T23:{ "59" }:{ "59.5" } um eine Sekunde Rotation (UT1 wurde an einem Tag mit Schaltsekunde aus dem quasi-Julianischen UTC-Datum genommen); die Engine wurde korrigiert (jd2::utc_to_ut1) und der zweite Lauf stimmt mit den unveränderten Zielwerten überein. Entfällt die Polbewegung ({ "46" } Fehlschläge) oder werden WGS-84-Konstanten statt WGS-72 verwendet ({ "4432" } Fehlschläge), wird der Test rot. Dieser Entwurf mit drei Zweigen ersetzte einen durchgehenden Orekit-Vergleich, der am SDP4 von Orekit bei e = { "0" } und an dessen IERS-{ "1996" }-TEME scheiterte (der Befund bleibt in tests/leo_polar_coverage_full_claim_orekit_oracle.rs festgeschrieben)

# text
seg-f650a11458b8 = Entwurfsabwägung beim Entfernungsmesscode

# text
seg-071e552a7179 = Grenzen für Nebenmaxima und Kreuzkorrelation von m-Folgen/Gold-Folgen, Länge↔Mehrdeutigkeit

# text
seg-65b7902a2d8f = Veröffentlichte Gold-Kreuzkorrelation von GPS C/A (−{ "23.9" } dB); Gold-Schranke von { "1967" }

# text
seg-5ec4c0730280 = GNSS-Geometrie / Dilution of Precision (DOP)

# text
seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP aus der Sichtliniengeometrie über Q=(HᵀH)⁻¹ mit lokaler ENU-Aufteilung

# text
seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — unabhängige Bibliothek, auf { "1e-6" } relativ übereinstimmend

# text
seg-1a5623c81b48 = Positionsfehler aus der Geometrie: RMS-Fehler = sigma_UERE x DOP für die Kleinste-Quadrate-Lösung der Engine

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry und check: eine gesetzte Monte-Carlo-Simulation (N = { "20,000" } Epochen je Geometrie, sigma = { "1.5" } m, ChaCha8-Seed { "36" } + i) der eigenen iterierten Kleinste-Quadrate-Lösung der Engine (pvt::solve_spp, Einheitsgewichte, von der wahren Position aus gelöst) auf den { "8" } Geometrien aus tests/fixtures/dop/dop_reference.csv, die die Fehlervarianzen in Ost, Nord, Höhe und Uhr, den H/V/P-RMS, die Ost-Nord-Korrelation, die mittleren Fehler und den Anteil innerhalb der { "95" }-%-Horizontalellipse mit sigma^{ "2" } Q vergleicht, wobei Q der Kovarianzfaktor des Kerns orbit::dop ist (orbit::dop_cofactor, dieselbe Arithmetik) auf derselben Geometrie

# text
seg-90f18c774d57 = Interne Konsistenz gegen eine geschlossene Form: Unter dem linearen Gauß-Modell ist die Kleinste-Quadrate-Kovarianz sigma^{ "2" } (H^T H)^-1 (Kaplan und Hegarty (Hrsg.), Understanding GPS: Principles and Applications, 2. Aufl., Artech House, { "2006" }, Kap. { "7" }). Methode und Toleranzen der Entwurfsnotiz zur Geometrie { "0.36" }, Abschnitt { "5.2" }, vor dem ersten Lauf in einem Vorregistrierungs-Commit festgelegt: jede Varianz innerhalb von { "5" } % ({ "5" } Standardfehler einer Stichprobenvarianz bei N = { "20,000" }), jeder RMS innerhalb von { "2.5" } %, die Ost-Nord-Korrelation innerhalb von { "0.035" } (5/sqrt(N)), jeder Mittelwert innerhalb von { "5" } Standardfehlern, der Anteil der { "95" }-%-Ellipse innerhalb von { "0.95" } +/- { "0.0077" } ({ "5" } binomiale Standardfehler); Negativkontrollen (PDOP verdoppelt; Fehler, die gegen das ungewichtete Q mit 1/sin(Elevation) wachsen) müssen scheitern. WIE SIE SICH ZUSAMMENSETZT: Q ist der Kovarianzfaktor des Kerns orbit::dop, VALIDATED gegen gnss_lib_py { "1.0.4" } auf genau diesen { "8" } Geometrien in tests/dop_reference.rs (Zeile „GNSS-Geometrie / Dilution of Precision“); diese Zeile ergänzt den Schritt von diesen Faktoren zu Metern durch den Löser der Engine und übernimmt nicht den Status jener Zeile. WARUM MODELLED: Es ist kein externer Datensatz beteiligt; die Übereinstimmung zeigt, dass Schätzer und Rauschen unter dem Lehrbuchmodell sigma x DOP verwirklichen, nicht dass der Fehler irgendeines Empfängers UERE x DOP entspricht, und sigma_UERE ist eine Eingabe

# text
seg-9acfde1b57f7 = Geometriebewusste Vertrauensklassifikation: Satellitengeometrie neben dem Vertrauenswert des Empfängers und eine Klasse für jeden Abzug

# text
seg-6138c41e13ff = receiver_trust::geometry: Satellitengeometrie je Epoche (gut, degradiert mit den Gründen few-satellites/high-pdop/high-hdop/sky-blocked, oder unbekannt, wenn das Log kein GSV, NAV-SAT oder GSA liefert), abgeleitet aus den gemeldeten Elevationen und Azimuten über orbit::dop oder aus GSA übernommen, mit einem Label, das stets gemeldet und nie bewertet wird (good, fair, poor, unknown) und mit HDOP, PDOP, VDOP, Satellitenzahl und Signalverlust in Worten; ein Geometrie-Monitor des Schiffswerts, der nichts abzieht, sofern die Geometrie nicht schlecht ist (Verhältnis max(hdop/4, pdop/6, 5/n_used) über { "1" }), dann bis zu einer Obergrenze von { "15" } Punkten bei { "1.5" } ansteigt, die die Geometrie allein nicht unter das degradierte Band drücken kann (Obergrenze, Ende der Rampe und Untergrenze in [geometry]; kein Alarm); eine Klasse für jeden Abzug (geometry, environment, inconsistency), wobei Lock-Verlust bei Satelliten unter { "15" } Grad als geometry klassifiziert wird, Satelliten in Sicht, aber nicht verfolgt, als environment, und ein Abzug wegen schlechter Geometrie, dessen angegebener HDOP jenseits von max({ "1.0" }, { "25" } % des abgeleiteten HDOP) vom angegebenen Himmel liegt, als inconsistency

# text
seg-6987737c5fe4 = Interne Konsistenz: Die Klassifikation wird gegen die Regeln geprüft, die sie nennt, und gegen von Hand abgeleitete Verhältnisse an synthetischen Änderungen des festgeschriebenen Demo-Logs, und die Pins ohne Änderung halten die Ausgaben von { "0.35.0" } fest: Kein Wert ändert sich, sofern die Geometrie nicht schlecht ist; das Label wird stets gemeldet. WARUM MODELLED: Die Schwellen sind gewählt, nicht angepasst (Herkunft in der geometry_model jedes Laufs; die Zahlen aus IEC 61108-1 und GPS SPS wie zitiert, am Text der Normen zu prüfen), und es gibt keinen externen gelabelten Datensatz natürlicher Geometrieverschlechterung gegenüber Angriffen, gegen den die Klassifikation validiert werden könnte. Das abgeleitete DOP verwendet den Kern orbit::dop wieder, VALIDATED gegen gnss_lib_py, dessen Status diese Zeile nicht übernimmt. Eine Geometrieklasse ist eine Aussage über den Himmel, kein Befund, dass kein Angriff stattgefunden hat

# text
seg-540420863a5a = Broadcast-Ionosphärenmodell (Klobuchar, IS-GPS-200)

# text
seg-fd157c537502 = Ionosphärische Gruppenlaufzeit des Klobuchar-Modells auf Schrägstrecke für einfrequentes L1 aus den acht Broadcast-Koeffizienten α/β

# text
seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — unabhängige, aus dem Quelltext kompilierte Referenzimplementierung; auf < { "1e-4" } m übereinstimmend

# text
seg-0af6b1a073ce = Statistischer Kern der RAIM/ARAIM-Integrität (χ²- / nichtzentrale χ²- / Normalverteilungen)

# text
seg-224a6c4200cd = Der verteilungstheoretische Kern, auf dem jeder Schutzpegel beruht: die Fehlererkennungsschwelle des Schnappschusses χ²₁₋ₚfₐ(dof), die Nichtzentralität der Fehlentdeckung pbias=√λ und die Multiplikatoren K_fa/K_md/K_V der Lösungstrennung

# text
seg-49f7d0c26e0a = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — unabhängige Bibliothek (Cephes/Boost), ein anderer Algorithmus als die Reihe der unvollständigen Gammafunktion von Kshana; auf ≤{ "1e-6" } rel. übereinstimmend. Nur der Kern. Die *Zuteilung* des ARAIM-MHSS-P_HMI-Budgets ist nicht mehr ohne veröffentlichte numerische unabhängige Referenz — das eigene durchgerechnete Beispiel der ARAIM Technical Subgroup der WG-C stützt nun die separate Zeile „ARAIM-MHSS-Schutzpegel gegen veröffentlichte Referenzvektoren“, auf der eigenen TOL_PL = { "5e-2" } m der Referenz übereinstimmend — daher ist der Geltungsbereich dieser Zeile der statistische Kern, und jene Zeile trägt die Zuteilung (siehe docs/ARAIM_REFERENCE.md)

# text
seg-03578217425f = SBAS-Schutzpegel (DO-229E gewichtetes LS-HPL/VPL)

# text
seg-df640d6c7a5d = Schutzpegel nach DO-229E Anhang J mit gewichteten kleinsten Quadraten: D=(GᵀWG)⁻¹ aus Elevation/Azimut je Satellit und Fehlerbudget, große Halbachse der horizontalen Fehlerellipse und vertikales σ, skaliert mit den veröffentlichten K-Faktoren

# text
seg-39aed7b4bffd = RTKLIB-SBAS-PL-Fork — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, „DO-229D Appendix J“), ausgeführt von rnx2rtkp -ws auf echten EGNOS-GEO-PRN120-Nachrichten + echtem BUTE/Budapest-RINEX; unabhängige Implementierung eines Dritten, HPL auf < { "2e-3" } m übereinstimmend. gLAB { "v6.0.0" } (core/filter.c) bestätigte identische Konvention. Beide unabhängigen Referenzen runden K_V→{ "5.33" } gegenüber dem exakten Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } von Kshana (~{ "0.06" }%), daher wird die Vertikale als K-Faktor-freies d_U geprüft

# text
seg-8f32eb9c8167 = Bewertungsmetriken für ML-Detektoren (ROC/AUC/Konfusion/Pfa-Pmd)

# text
seg-b0d8e1b45bf9 = AUC (Mann-Whitney, Bindungen ½), Konfusionsmatrix an der Schwelle, P_d/P_md/P_fa/Precision/Accuracy/F1

# text
seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — unabhängige Bibliothek, exakte Übereinstimmung

# text
seg-e7af87ce5e72 = Bewertung der Anomalieerkennung an echter Raumfahrzeug-Telemetrie

# text
seg-9659b33fca5b = ROC-AUC + Bootstrap-Konfidenzintervall, das echte gelabelte Anomalien trennt; transparenter Detektor (reproduziert die Labels)

# text
seg-b4ed67ce7e7e = scikit-learn roc_auc_score auf dem OPSSAT-AD-Testsplit (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — echte OPS-SAT-Telemetrie

# text
seg-5c3f1057c6cc = Numerische Kerne der Quantum-Abwägung (NNLS / χ²-Bänder / van-Loan-Q)

# text
seg-f82113ccb30b = NNLS-Anpassung der gemessenen ADEV, χ²-Konsistenzbänder für NEES/NIS und die diskrete Prozessrauschen-Kovarianz der Uhr nach van Loan (Holdover-Auslauf) — das Rechenrückgrat der Abwägungs-Engine

# text
seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exakt, χ² <{ "5e-4" } bei Betriebs-dof. Nur Kerne — Leistungszahlen der Geräte bleiben modelliert (nächste Zeile)

# text
seg-6f3099e7562c = Geomagnetisches Referenzfeld (IGRF-14-Synthese)

# text
seg-e9534723cb34 = Sphärisch-harmonische Synthese des IGRF-14-Hauptfeldes — Komponenten X/Y/Z/F, Deklination und Inklination — als Speisung der Alt-PNT-Schicht für magnetische Anomalien

# text
seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — die reine Python-IGRF-Referenzimplementierung der IAGA-VMOD, die die offiziellen IGRF14.shc-Koeffizienten mitliefert (14. Generation der IAGA, Zenodo 10.5281/zenodo.14012302); eine unabhängige Codebasis eines Dritten, die das eindeutig definierte IGRF-14-Feld berechnet, über ein globales Raster übereinstimmend

# text
seg-cb3fea409de7 = Detektionsstatistik — Gauß-AUC & minimal detektierbarer Fehler

# text
seg-ca677becb465 = Analytische binormale ROC-AUC = Φ(μ/(σ√{ "2" })) und der minimal detektierbare Fehler σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), auf dem die Quantenfehler- und Anomaliedetektoren beruhen

# text
seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), beide BSD-3-Clause — unabhängige Bibliotheken, die dieselben eindeutig definierten Größen aus Gauß-Rand / AUC berechnen, auf die A&S-erf-Untergrenze (~{ "7e-8" }) übereinstimmend. Der darauf aufbauende Vorteil Quanten gegen klassisch bleibt MODELLED

# text
seg-1ed12110fb74 = Kern der Rangordnungsstatistik (Kendall-τ / Dirichlet / Perzentil)

# text
seg-0fb003404a5b = Rangkorrelations- und Resampling-Kerne unter der Studie zur Entscheidungsinstabilität der Resilienz: Kendall τ-b, Dirichlet-Mittel, Wettkampf-Rangfolge und Perzentil-Konfidenzintervalle

# text
seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — unabhängige Implementierungen (Merge-Sort-τ) der eindeutig definierten Rangstatistiken, auf { "1e-12" } übereinstimmend. Die auf diesen Kernen aufbauende Studie zur Entscheidungsinstabilität bleibt MODELLED

# text
seg-fdd2ba203d5b = MCDA-Kern zur Ableitung von Prioritäten (AHP-Eigenvektor / Konsistenzverhältnis)

# text
seg-d01c155fbddf = Prioritätsgewichte des Analytic Hierarchy Process = normierter Haupteigenvektor (Perron) einer reziproken paarweisen Vergleichsmatrix durch Potenziteration, mit dem Konsistenzindex / Konsistenzverhältnis nach Saaty und der Akzeptanzschwelle CR<{ "0.10" }

# text
seg-d1947f2f2b3b = Kanonische Tabelle des Zufallsindex nach Saaty ({ "1980" }) (RI({ "5" })={ "1.12" }) exakt reproduziert + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) als unabhängiger Eigenlöser, der denselben eindeutig definierten Perron-Eigenvektor/Eigenwert berechnet, auf <{ "1e-9" } übereinstimmend. Die auf diesem Kern aufbauende Entscheidungsschicht aus Pareto / Sensitivität / MAUT bleibt MODELLED (die Aggregatoren WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE sind separat extern validiert — siehe die Zeilen unten)

# text
seg-73e933220afb = MCDA-Kerne zur gewichteten Aggregation (WSM / WPM)

# text
seg-c436cdc991a2 = Weighted Sum Model (min–max-normierte additive Aggregation + Rangfolge) und Weighted Product Model (summennormierte, für Kosten reziproke multiplikative Aggregation) — die beiden Bewerter für Wertaggregation in Abwägungsstudien

# text
seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — eine unabhängige, weit verbreitete Python-MCDA-Bibliothek eines Dritten, die dieselben eindeutig definierten gewichteten Aggregate berechnet; auf <{ "1e-9" } übereinstimmend. Offline regenerierbar über tests/fixtures/mcda_wsm/ und tests/fixtures/mcda_wpm/. Garbage in, garbage out bei den Eingaben; die Sensitivitäts-/Robustheitsschicht bleibt MODELLED

# text
seg-f00bdb66a052 = MCDA-Rangfolge nach Abstand zum Ideal (TOPSIS)

# text
seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — Min–Max-Normierung, gewichtete positive/negative Idealösungen, relative Nähe Cᵢ = d⁻/(d⁺+d⁻) und Rangfolge

# text
seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — eine unabhängige MCDA-Bibliothek eines Dritten, die dieselben eindeutig definierten Nähekoeffizienten berechnet; auf <{ "1e-9" } übereinstimmend. Offline regenerierbar über tests/fixtures/mcda_topsis/generate_topsis_reference.py

# text
seg-ef33d848c985 = MCDA-Kompromissrangfolge (VIKOR)

# text
seg-cf879fb770f2 = VlseKriterijumska Optimizacija — Gruppennutzen Sᵢ, individuelles Bedauern Rᵢ und der Kompromissindex Qᵢ bei Strategiegewicht v={ "0.5" }, mit der Rangfolge, in der kleiner besser ist

# text
seg-69fbe488dec5 = Fisher-Information & Cramér–Rao-Beobachtbarkeit

# text
seg-043d4c7a2d6a = Fisher-Information M=HᵀWH, Cramér–Rao-Untergrenze, Beobachtbarkeitsrang / Nullraum des Datumsdefekts (Moore–Penrose-Pseudoinverse) sowie D/A/E/T-optimale Skalare der Versuchsplanung aus einem symmetrischen Jacobi-Eigenwertlöser

# text
seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-gestützt) — eine unabhängige Drittautorität, die dieselben eindeutig definierten Eigenwerte, die σ²(XᵀX)⁻¹-Cramér–Rao-Kovarianz und die GNSS-Dilution-of-Precision-Faktoren mit einem anderen Algorithmus (LAPACK-Divide-and-Conquer + LU) berechnet als Kshanas zyklischer Jacobi-Durchlauf und die spektrale Pseudoinverse; abgeglichen auf { "1e-9" }. Dieselbe Klasse externer Bibliotheken validiert bereits die DOP-Engine (gegen gnss_lib_py) und die χ²/erf-Kerne (gegen SciPy). Zusätzlich gegengeprüft mit den geschlossenen CRLB-Formeln nach Kay ({ "1993" }) und der Erreichung der CRLB in Monte-Carlo-Läufen (intern)

# text
seg-e4ec41d0f5e1 = Absolute Beobachtbarkeit der Mondstationen (Datumsdefekt)

# text
seg-b3e4160042d2 = Fisher-Information-Beobachtbarkeit der gemeinsamen Mondlösung: Ohne Erdbasislinien liegt das Datum des absoluten Bezugssystems im Nullraum von HᵀWH (Stationsposition nicht beobachtbar); ≥{ "3" } Basislinien stellen den vollen Rang wieder her und begrenzen den Cramér–Rao-Fehler der Station, den der Schätzer erreicht

# text
seg-238597f6aa01 = Analytische Struktur des Datumsdefekts — die nicht beobachtbare Mode des absoluten Bezugssystems liegt im Nullraum der Fisher-Information (geschlossene Form), die Rangschwelle entspricht der veröffentlichten Begründung für den Entwurf mit 3 Stationen, und der Schätzer erreicht die resultierende CRLB in Monte-Carlo-Läufen. Die Mondgeometrie selbst ist ein repräsentatives Netz (keine geflogene Ephemeride), daher bleibt die Zeile MODELLED; die zugrunde liegende FIM/CRLB-Engine wird gesondert gegen die geschlossenen Formen nach Kay ({ "1993" }) geprüft. { "0.30" } Runde { "2" } (vorab registriert fab02df9), blockiert (bleibt MODELLED): NumPy/SciPy berechnen den Rang und den Defekt bei der angegebenen Schwelle von { "1e-9" }, den Anteil der Stationsachsen am Nullraum (innerhalb von { "8.4e-10" }) und die Stations-CRLB (innerhalb von { "1.2e-10" }) neu, an { "17" } festgeschriebenen, von Kshana erzeugten Konfigurationen (P2). Nicht hochgestuft: Für die Aussage, dass der Schätzer die Schranke erreicht (Monte-Carlo-Effizienz etwa { "0.98" }), gibt es keine unabhängige Referenz, und die Eingrenzung, die sie auf MODELLED belassen würde, wartet auf eine Entscheidung des Verantwortlichen

# text
seg-ae4b71d54dfa = 7-Parameter-Helmert-Datumsanpassung + ICRF-Orientierungsanbindung aus einem Netz von Punkten

# text
seg-9e434924b34c = Unabhängiger geschlossener, gewichteter Umeyama-(Horn-)Ähnlichkeitstransformations-Löser (numpy/scipy, SVD-basiert; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — ein anderer Algorithmus als Kshanas iterative Gauß–Newton-Anpassung, der auf byte-identischen Punktnetzen dasselbe eindeutig definierte gewichtete Kleinste-Quadrate-Optimum erreicht

# text
seg-4bcec6e2dd9f = Navigationsdienstvolumen am Mond

# text
seg-dba98ad5df1c = DOP / Abdeckung / Verfügbarkeit der Moonlight-Klasse am Mond + verallgemeinerte ARAIM-Schutzniveaus am Mond über ein Dienstvolumen

# text
seg-7e981d90a806 = Unabhängige Drittautorität ANISE { "0.10.2" } astro::Orbit Kepler-Propagator (Nyx Space, MPL-2.0) — ein äquinoktialer Zweikörper-Codepfad, verschieden von Kshanas Newton-Raphson-Kepler; die MCI-Position je Satellit stimmt auf <{ "1e-3" } m überein, und Anzahl und Menge der abgeleiteten sichtbaren Satelliten stimmen an jedem Gitterpunkt exakt überein. Der DOP-Kern ist gegen gnss_lib_py validiert; die Integrität verwendet veröffentlichte LunaNet/LCNS-Parameter

# text
seg-2ed7181c97dd = Erzeugung der LunaNet-AFS-Spreizcodes (LSIS V1.0)

# text
seg-13ff6c381275 = Die Augmented-Forward-Signal-Codes von LSIS V1.0 ({ "29" }. Januar { "2025" }): der AFS-Q-Primärcode mit 10230 Chips, erzeugt aus der IS-GPS-800-L1C-Pilotkonstruktion mit den IS-GPS-800J-Indizes (dieselben { "210" } Zuweisungen, die LSIS Anhang D druckt), die AFS-I-Gold-Codes mit 2046 Chips, erzeugt aus g1 = x^{ "11" } + x^{ "2" } + { "1" } und g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, wobei die G2-Verzögerung jeder PRN aus der Annex-{ "3" }-Datei des Standards gewonnen wird, die vier Sekundärcodes, die Tertiärcodes mit 1500 Chips, die vorläufige Knotenzuweisung nach Tabelle { "11" } und der gestufte Pilotcode. LSIS-Inhalte werden zur Laufzeit aus einem SHA-256-geprüften lokalen Cache gelesen, der aus dem von der NASA bereitgestellten PDF befüllt wird, und nie weiterverbreitet

# text
seg-dc1dd144b107 = Referenz: die Werte, die LSIS V1.0 zur Validierung druckt (Tabellen C-1 bis C-5, D-1 bis D-6, E-1 bis E-6), und seine elektronischen Codedateien aus Annex { "3" }, unter einem vor dem Vergleich festgelegten Kriterium von null Abweichungen. Das Kriterium wird durch eine gedruckte Zelle verfehlt, die mit der Annex-{ "3" }-Datei des Standards selbst intern inkonsistent ist, daher bleibt die Zeile MODELLED; ein Erratum-Hinweis ist entworfen. Dieselben Chips entsprechen auch denen von LANS-AFS-SIM (Zeile 'LunaNet-AFS-Basisbanderzeugung gegen einen unabhängigen Generator, bei gegebenem Kanalzustand')

# text
seg-ea20909686ea = LunaNet-AFS-Basisbanderzeugung gegen einen unabhängigen Generator, bei gegebenem Kanalzustand (LSIS V1.0)

# text
seg-c0f021c38842 = Der Erzeugungskern des AFS-Basisbands (LSIS-130: komplexe Hüllkurve I + jQ, I = der AFS-I-Gold-Code mal der Rahmen mit { "500" } Symbolen/s bei { "1.023" } Mchip/s, Q = der gestufte AFS-Q-Pilot bei { "5.115" } Mchip/s, Trägerrotation, Chip- und Symbolausrichtung) reproduziert die Abtastwerte eines unabhängigen Generators, wenn er mit dessen eigenem aufgezeichneten Kanalzustand angesteuert wird (Codephasen und -raten, Trägerphase und -frequenz, Amplitude je Kanal). Nicht abgedeckt: das Knotenmodell, das diesen Zustand aus Doppler, Verzögerung und Träger-zu-Rauschleistungsdichte ableitet, die aus der Träger-zu-Rauschleistungsdichte berechnete 50/50-Leistungsaufteilung (die Amplituden werden aus dem Simulator übernommen) sowie die SigMF-Metadaten und das Schreiben der 8-Bit-Abtastwerte

# text
seg-dd1142957a05 = Bibliothek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, Commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-Band-Build, als eigenständiges Programm ausgeführt); Kshanas Abtastwerte werden allein vom aufgezeichneten Kanalzustand des Simulators angesteuert, und ein Build mit reiner Ablaufprotokollierung wird als byte-identisch zum nicht gepatchten geprüft. Vor dem Lauf festgelegte Zielwerte: null Chip- und Symbolabweichungen, |rho| >= { "0.999" } über den Lauf und >= { "0.99" } je Block von { "2" } ms, Phase innerhalb von { "0.05" } rad. Gleiche I- und Q-Amplituden sind eine Eingabe des Vergleichs, daher wird die Leistungsaufteilung dadurch nicht getestet. LANS-AFS-SIM liest seine Tertiärcodes aus der LSIS-Annex-{ "3" }-Datei, daher ist dieser Teil nicht unabhängig von der Codezeile. LANS-AFS-SIM und PocketSDR-AFS haben denselben Autor und zählen als eine unabhängige Implementierung. Datenabhängig: Der LANS-AFS-SIM-Vergleich benötigt den lokalen LSIS-V1.0-Cache (xval/lunar-afs/fetch_lsis.sh, SHA-256-geprüft) und wird ohne ihn mit einem Hinweis übersprungen

# text
seg-5d79da539912 = LunaNet-AFS-Rahmenkanalcodierung, FID { "0" } (LSIS V1.0)

# text
seg-6ed2b4c792e6 = Der { "12" } s lange FID-{ "0" }-Rahmen von LSIS V1.0 mit 6000 Symbolen: 68-Symbol-Synchronisationsmuster, BCH-({ "51" }, { "8" })-Unterrahmen { "1" } (Generator oktal 763), CRC-24 (({ "1" } + X)·P(X)) auf den Unterrahmen 2-4, LDPC-Codierung mit Rate 1/2 mit den gedruckten A, B^-1, C, D (LSIS Annex { "1" }, zur Laufzeit aus dem SHA-256-geprüften lokalen Cache gelesen) und der Punktierung des Standards, Blockverschachtelung { "60" } x { "98" }; ein erschöpfender Dekodierer für Unterrahmen 1, der ein TOI außerhalb von { "0" }..99 meldet, und ein normalisierter Min-Sum-LDPC-Dekodierer, der allein aus H = [[A, B, { "0" }], [C, D, I]] geschrieben wurde

# text
seg-46879e2e8ab5 = Bibliothek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, Commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), dessen eigene BCH-, CRC-, LDPC- und Verschachtelungsfunktionen bei gleichem Inhalt Rahmen erzeugen, die symbolgleich mit denen von Kshana sind (null Abweichungen, Zielwert vor dem Lauf festgelegt). Bestätigt durch Referenzwerte: das BCH-Beispiel aus Abbildung { "8" } von LSIS V1.0 und der CRC-24/LTE-A-Prüfwert (Greg Cooks Katalog parametrisierter CRC-Algorithmen), beide bitgenau; sowie durch PocketSDR-AFS, das in drei Läufen jeden Unterrahmen der synchronisierten Rahmen mit bestandenem CRC und übereinstimmenden Bits von Unterrahmen 2 dekodiert. Der Paritätsprüftest ist nahezu eine interne Identität (er bestätigt, dass das gedruckte B^-1 das gedruckte B invertiert) und zählt nicht als unabhängige Referenz. Datenabhängig: Der LANS-AFS-SIM-Vergleich benötigt den lokalen LSIS-V1.0-Cache (xval/lunar-afs/fetch_lsis.sh, SHA-256-geprüft) und wird ohne ihn mit einem Hinweis übersprungen

# text
seg-56c7aeac59c1 = Dekodierbarkeit von LunaNet AFS im geschlossenen Regelkreis durch einen unabhängigen Empfänger (LSIS V1.0)

# text
seg-da2d29d437b0 = Eine Kshana-AFS-Aufzeichnung, die von einem unabhängigen Software-Empfänger erfasst, verfolgt und dekodiert und mit den eigenen Wahrheits-Labels der Aufzeichnung verglichen wird. Dies belegt nur die Übereinstimmung mit dem Standard und die Konsistenz der Labels; es ist keine Aussage über Kanalphysik, Ausbreitung, Empfangsleistung oder Link-Budgets, deren Werte in der Aufzeichnung gewählte Eingaben sind

# text
seg-8211583afc64 = Bibliothek: PocketSDR-AFS (T. Ebinuma nach T. Takasus PocketSDR { "0.13" }, BSD-2-Clause, Commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-Band-Build, Kopie mit reiner Protokollstufe), unter vor jedem Lauf festgelegten Kriterien. Der dritte vorab registrierte Vergleich erfüllt seine Dekodierungs- und Verfolgungs-Zielwerte C1 und C2 vollständig, nicht aber seine Schutzbedingung G0 wie geschrieben (zwei Läufe des unveränderten Empfängers unterscheiden sich in denselben vier Erfassungsdatensätzen), und der zweite verfehlte sie um { "5" } Verletzungen, daher bleibt die Zeile MODELLED. LANS-AFS-SIM und PocketSDR-AFS haben denselben Autor und zählen als eine unabhängige Implementierung; die Prüfungen der gedruckten Vektoren in der Zeile zur Rahmencodierung sichern gegen eine gemeinsame Fehllesung ab

# text
seg-780369fb9a54 = Übereinstimmung von GPS L1 C/A zwischen Generatoren

# text
seg-ee47b60515f1 = GPS-L1-C/A-Spreizcodes (sdr::CaCode) und LNAV-Unterrahmen 1-3 (gps_lnav: IS-GPS-200-Feldquantisierung mit dem Pi der Spezifikation, Zweierkomplement-Packung, TLM- und HOW-Wörter, Parität nach Tabelle 20-XIV mit D29*/D30*-Inversion, die paritätslösenden Bits der Wörter { "2" } und { "10" }), bitweise verglichen mit gps-sdr-sim auf dessen mitgelieferter brdc0010.22n ({ "32" } Satelliten)

# text
seg-39b0d6a58d29 = gps-sdr-sim (MIT, Commit 28ca29a6, als eigenständiges Programm über ein festgeschriebenes Harness ausgeführt), vorab registriert f88f2969 mit einem bitgenauen Zielwert auf (A) C/A-Chips, (B) jedes berechnete LNAV-Feld, (C) jedes Paritätsbit. BEFUND: (A) { "0" } von { "32 736" } Chips unterscheiden sich, (C) die Parität von { "0" } von { "1 920" } Wörtern unterscheidet sich, (B) { "230" } von { "1 152" } berechneten Feldern unterscheiden sich um eine Einheit: Das eph2sbf von gps-sdr-sim schneidet mit C-Casts zur Null hin ab, wo die gesendete Ganzzahl Rundung erfordert (jeder abweichende Wert liegt innerhalb von { "0.01" } einer Einheit der gerundeten Ganzzahl von Kshana). Bleibt MODELLED: Der registrierte Zielwert war die Konjunktion

# text
seg-325900ed59ea = Signalgeometrie der GNSS-IQ-Szene gegen einen unabhängigen Basisbandgenerator

# text
seg-ee5625b30ff2 = Die Wahrheitswerte je Satellit des IQ-Szenengenerators für eine GPS-L1-C/A-Szene mit Broadcast-Ephemeride (iq::scene: eine SatGeometry mit Broadcast-Ephemeride, erzeugt in TruthRecord-Wahrheitsdatensätze): welche Satelliten über dem Horizont stehen, die Pseudostrecke, die Codephase am ersten Abtastwert, der Träger-Doppler und die Blickwinkel, für einen ortsfesten Empfänger, verglichen mit dem Kanalzustand, aus dem gps-sdr-sim den ersten Block seiner eigenen I/Q-Ausgabe aufbaut, für dieselbe Ephemeride, denselben Empfänger und dieselbe Startzeit (Ionosphäre auf beiden Seiten aus)

# text
seg-59c06411d647 = gps-sdr-sim (T. Ebinuma, MIT, Commit 28ca29a6), ein unabhängiger GPS-L1-C/A-Basisbandgenerator, mit eigenem Makefile gebaut und als eigenständiges Programm auf seiner mitgelieferten brdc0010.22n am Beispielort seines Verwendungstexts ausgeführt (scripts/gen_iq_gpssdrsim_ref.sh); ein festgeschriebenes Harness, das gegen denselben Build gelinkt ist, gibt den Kanalzustand (computeRange, computeCodePhase) hinter dem ersten Block des Programms aus. Zielwerte vor dem Lauf des Generators festgelegt (vorab registriert 7777da53). Geltungsbereich: GPS-L1-C/A-Geometrie für einen ortsfesten Empfänger ohne Ionosphäre, Troposphäre oder Empfängeruhr; die Kanalmodelle, das Rauschen und der Navigationsdateninhalt der Szene sind nicht Teil dieser Zeile

# text
seg-bf429c8f00fb = GNSS-IQ-Erfassung an unabhängig erzeugten I/Q-Abtastwerten

# text
seg-9a0c52bfb06e = iq::acq::acquire (parallele FFT-Codephasensuche mit der Quadratgesetz-Marcum-Q-Schwelle) mit der GpsL1Ca-Replik, auf { "20" } ms der eigenen 8-Bit-I/Q-Ausgabe von gps-sdr-sim, dekodiert vom Abtastwert-Dekodierer iq::io (ci8, { "2.6" } MHz, { "11" } Satelliten, ohne Rauschen): jede PRN { "1" } bis { "32" } in zwei Fenstern von { "10" } ms durchsucht, das Ergebnis verglichen mit der Codephase und dem Doppler, die gps-sdr-sim aufmoduliert hat

# text
seg-fb96290003e1 = I/Q-Abtastwerte von gps-sdr-sim (MIT, Commit 28ca29a6) und dessen eigener Kanalzustand, vorab registriert 7777da53: (B1) jede simulierte PRN erfasst, (B2) keine andere PRN erfasst, (B3) Codephase innerhalb von { "0.5" } Chip, (B4) Doppler innerhalb von { "125" } Hz. BEFUND: B1, B3 und B4 gelten in beiden Fenstern (schlechtester Wert { "0.195" } Chip, { "72" } Hz), aber B2 schlägt fehl: Alle { "21" } PRNs, die gps-sdr-sim nicht simuliert hat, überschreiten ebenfalls die Schwelle (Statistik { "151" } bis { "206" } gegen { "79.5" }; simulierte PRNs { "1 300" } und mehr). Die Schwelle ist für Gauß-Rauschen der gemessenen Abtastleistung festgelegt; gps-sdr-sim fügt kein Rauschen hinzu, daher enthalten die Zellen einer nicht vorhandenen PRN die Kreuzkorrelation der anderen Satelliten. Bleibt MODELLED: Der registrierte Zielwert war die Konjunktion

# text
seg-f40dc3dac990 = In Laborwiedergabe-Kampagnen bewertete IQ-Monitore: Erkennung, Fehlerkennungen, Fehlalarme und geschlossene Fehlalarmkennzahlen

# text
seg-93fb3109728c = iq::campaign::detect und der Kampagnenläufer: Eine optionale Tabelle [monitors] lässt die IQ-Monitore in jeder Zelle im einzigen Durchlauf des Läufers laufen. Die Leistungs- und Spektralmonitore sehen die Abtastwerte nach jeder Front-End-Kette; die C/N0-, SQM- und Lock-Monitore sehen die Schleifenaktualisierungen jedes verfolgten Kanals. Jeder Alarm wird gegen die angegebenen Ereignisse bewertet: erkannt oder verpasst je (Ereignis, Alarmart, Kanal), Zeit bis zur Erkennung und Fehlalarme außerhalb der Ereignisse bezogen auf deren Expositionszeit. Die geschlossene Fehlalarmkennzahl jedes Tests wird angegeben: Leistung je Block (exakter Gamma-Schwanz), spektraler Überschuss je Block (Näherung), Kurtosis (einseitig Gauß), Pulse (binomiale Obergrenze), SQM je gemittelter Aktualisierung (2Q(k) = Q(1/2, k^2/2), neu) und die ARL0 des C/N0-CUSUM (Siegmund). Ohne die Tabelle bleiben Zellen, Schlüssel und Digests unverändert. Es wird keine Störungswellenform synthetisiert

# text
seg-4c4fff313585 = Die eigenen geschlossenen Formen der Monitore an Kshanas eigenen GPS-L1-C/A-Szenen (Rauschen und legitime Signale; Dämpfungsereignisse der eigenen Signale der Satelliten), gegen vorab in docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4) registrierte Zielwerte. BEFUND: M1, M2 und M4 erreicht. M3 bei der Erkennung erreicht ({ "18" } von { "18" } Dämpfungen, P_md { "0" }) und NOT MET bei seiner Zeitklausel: Die mediane Zeit bis zur Erkennung beträgt { "1.001" } s gegenüber { "2" } x ARL1-Abtastwerten = { "0.433" } s. Der CUSUM sieht eine Schätzung je { "1" }-s-Fenster, daher liegt die Schranke in Abtastwerten unter einem Abtastwert. Nur interne Konsistenz: Weder ein realer Empfänger noch aufgezeichnete Störungen werden geprüft

# text
seg-5b7eb7ddb474 = Erkennungs-ROC der IQ-Monitore aus einer bewerteten Laborwiedergabe-Kampagne

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) und iq::campaign::report::rocs: Jede Zelle einer Kampagne mit Monitoren hält je Alarmart und Kanal das Maximum der eigenen Teststatistik des Monitors über jedes angegebene Ereignisfenster (positiv) und über aneinandergereihte roc_window_s-Fenster außerhalb der Ereignisse (negativ). Die Statistiken sind die Abweichung der Blockleistung, der PSD-Überschuss, die Kurtosis z, das SQM |z| der gemittelten Metrik und der C/N0-CUSUM. Der Bericht fasst sie nach Art zu einer empirischen ROC auf Fensterebene mit ihrer AUC und dem Arbeitspunkt an der konfigurierten Schwelle zusammen, geschrieben als roc.json (kshana.campaign-roc/1) und als Abschnitt Detection ROC von report.html. Eine Kampagne ohne Monitore schreibt keines von beiden

# text
seg-e882dd678998 = Synthetische Kampagnen aus Kshanas eigenen GPS-L1-C/A-Szenen (Dämpfungen der eigenen Signale der Satelliten), gegen vorab in docs/design/DETECTION-ROC.md (b47e358d) registrierte Zielwerte. BEFUND: R2 erreicht (Zufallsniveau, wenn nichts zu erkennen ist). R1 NOT MET: cn0_drop-AUC { "0.7855" } gegen { "0.95" }, weil jedes negative Fenster nach einem Ereignis den Abfall des CUSUM von der Erkennung erbt (alle { "18" } negativen Fenster nach dem Ereignis erreichen { "81" } oder mehr; alle { "18" } vor dem Ereignis bleiben bei { "0" }). Nur interne Konsistenz: Weder ein realer Empfänger noch aufgezeichnete Störungen werden geprüft

# text
seg-3a3cfa322f01 = Kalibrierung der C/N0- und Lock-Modelle des offenen Empfängers auf IQ-Kampagnenergebnisse, mit angegebenem Vorhersagefehler

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) und <c1/> auf <c2/>, Python <c3/> und das MCP-Werkzeug labfit (Kampagnenordner nur innerhalb seines Arbeitsverzeichnisses): liest einen Ausgabeordner von <c4/> anhand seines DIGEST und gruppiert die bewerteten Zellen zu Anpassungseinheiten (Signal x Schleifenentwurf x Front-End-Kette x Störsendertyp, nie zusammengefasst). Je Einheit passt es das gemessene C/N0 an das angegebene J/S mit der Form der spektralen Trennung an. Q_eff ist aus C/N0-Daten ohne unabhängige Messung der Störer- und Signalleistungen nicht identifizierbar, daher wird Q angegeben, nie angepasst (die Typtabelle, das q des Ereignisses oder bei unbekanntem Typ der schädlichste angegebene Wert, cw Q = { "1" }). Der angepasste Parameter ist der identifizierbare Offset delta_eff = delta - { "10" } log10 Q, wobei die Korrelationsschranke die Entartung meldet. C/N0-Klassen mit weniger als { "90" } % Lock sind zensiert und aufgelistet. Das Schwellen-J/S wird direkt und über die geschlossene Form angegeben; das Verfolgungsschleifenmodell und das empirische Lock-Modell sind über das C/N0-Modell gekoppelt, mit Abfall- und Wiederverriegelungs-Verweilzeiten. Ein mit Seed versehener Cluster-Bootstrap über Aufzeichnungen ({ "1000" } Replikate) liefert Perzentilintervalle; { "90" }-%-Vorhersageintervalle stammen aus Residuenziehungen; Leave-one-recording-out-Zurückhaltungen werden in Interpolation und Extrapolation aufgeteilt; eine vorab registrierte Tabelle [validation] wird gehasht und jeder Zielwert mit PASS/FAIL beurteilt. Bericht kshana.labfit-iq/1 als JSON, CSV und erzeugtes Markdown, mit einem Einheitenblock. Nur synthetisch (keine Aufzeichnung Dritter, keine Störsenderwellenform). Der Labfit-Pfad des Empfängerprotokolls bleibt unverändert

# text
seg-f9abecb1eea6 = Synthetische Parameterrückgewinnung an Kshanas eigenen GPS-L1-C/A-Szenen mit einem bekannten, aus der Formel von Abschnitt { "3.1" } aufgeprägten C/N0-Profil, verfolgt und bewertet mit kshana iq campaign, gegen vorab in docs/design/LABFIT-FROM-IQ.md (Abschnitt { "5.1" }, geändert am 2026-10-12 in b7117bf, Abschnitt { "13" }) registrierte Zielwerte. Der C/N0-Schätzer der Kampagnen (M2M4) wurde in 5b13e3c2 festgelegt, vor der ersten Auswertung eines Zielwerts gepusht (zusammen mit dem Anpassungscode eingecheckt, nicht allein), nach einem offengelegten diagnostischen Verfolgungslauf. BEFUND an der Kampagne mit 18 Ereignissen: (c) PASS; (a') NOT MET, delta_eff-Fehler -1.097 dB gegen { "0.5" } dB (weiterhin -0.89 dB in den Klassen ab { "38" } dB-Hz); (b') NOT MET, { "0" } von { "50" } Kampagnen decken die Wahrheit ab (Fehler -1.189 +/- { "0.093" } dB, Intervall etwa { "0.3" } dB); (d) NOT MET, geschlossene Form { "2.20" } dB unter dem direkten J/S beim Verlust, etwa die angepasste Abfall-Verweilzeit mal die Rampenrate ({ "2.09" } dB); die ursprünglichen Q-Klauseln von (a) und (b) sind NOT MET, weil Q nicht identifizierbar ist. NACHFOLGE (Zielwerte vorab registriert in 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): An einer Kampagne mit gestuftem J/S wird delta_eff innerhalb von +{ "0.185" } dB zurückgewonnen (S1 MET: Der Rampenfehler ist Schätzerverzögerung); (d) wie geschrieben wird darauf vom Verfolgungsschleifenmodell erfüllt ({ "0.45" } dB), nicht aber vom empirischen ({ "6.42" } dB), daher ist S2 NOT MET; an einer neuen Rampenkampagne liegt (d) mit der angepassten Abfall-Verweilzeit plus der Rampenrate jedes Ereignisses für beide Modelle innerhalb von { "1" } dB (R1 MET), und (a') und (d) wie geschrieben werden erneut verfehlt (-1.25 dB; { "2.32" } und { "9.47" } dB). Geprüft wird die Methode, kein Empfänger: Sie kann aus synthetischen Daten nicht VALIDATED werden

# text
seg-9537d301c95e = GPS-LNAV-Kodierung, dekodiert von einer unabhängigen Empfängerbibliothek

# text
seg-909415621881 = Kshanas LNAV-Unterrahmen 1-3 (gps_lnav::encode_subframes) für die { "32" } Ephemeriden aus brdc0010.22n, an decode_word und decode_frame von RTKLIB übergeben: Parität jedes Wortes, Unterrahmendekodierung mit konsistentem Datenstand (Issue of Data) und jeder dekodierte Parameter gegen Kshanas Ganzzahl und gegen den Eingabewert

# text
seg-9b21219e9572 = RTKLIB v2.4.2-p13 (BSD-2-Clause, Commit 71db0ffa) decode_word/decode_frame als eigenständiges Programm, vorab registriert ca5f0142: R1 Parität und Dekodierung, R2 dekodierter Wert gleich Kshanas Ganzzahl mal dem IS-GPS-200-Skalierungsfaktor innerhalb von { "2" }^-52 relativ, R3 innerhalb eines halben Quants der Eingabe. BEFUND: R1 { "960" } von { "960" } Wörtern und { "96" } von { "96" } Unterrahmen; R3 jeder Parameter, jede Woche und jede Referenzzeit exakt; R2 schlägt bei { "41" } Werten (af1, delta-n, IDOT) um { "1" } bis { "4" } Einheiten der letzten Stelle fehl, weil P2_43 in RTKLIB die Dezimalzahl { "1.136868377216160E-13" } ist, { "2.6e-16" } relativ zu { "2" }^-43; die Division durch die Konstante von RTKLIB liefert in jedem Fall Kshanas Ganzzahl zurück. Bleibt MODELLED: Der registrierte R2-Zielwert war für die eigene Konstante der unabhängigen Referenz zu eng

# text
seg-f66855e35c53 = GPS-LNAV-Navigationsnachrichtenkodierung

# text
seg-8caf8366e2f8 = IS-GPS-200-LNAV-Unterrahmen 1-3 (gps_lnav::encode_subframes: Quantisierung jedes Uhren- und Bahnparameters auf den nächsten Wert bei den Skalierungsfaktoren und dem Pi-Wert der Spezifikation, Zweierkomplement-Packung, TLM- und HOW-Wörter, Parität nach Tabelle 20-XIV mit D29*/D30*-Inversion, die paritätslösenden Bits der Wörter { "2" } und { "10" }), die Nachricht, die ein GPS-L1-C/A-Signalgenerator sendet

# text
seg-2b71b166b9d5 = RTKLIB v2.4.2-p13 (BSD-2-Clause, Commit 71db0ffa) readrnx beim Parsen der täglichen IGS-Broadcast-Datei BRDC00IGS_R_20250610000_01D_MN.rnx und decode_word/decode_frame beim Dekodieren von Kshanas Wörtern, als eigenständiges Programm ausgeführt; vorab registriert d4d9eb9d, bevor die Datei abgerufen wurde, Zielwert exakte Ganzzahl. Mutation: Abschneiden statt Runden ergibt { "235" } Fehlschläge. Frühere Vergleiche desselben Kodierers sind als Befunde festgehalten: gegen gps-sdr-sim, das abschneidet ({ "230" } Felder), und gegen die skalierten Werte von RTKLIB, deren dezimale Konstante { "2" }^-43 einen Ein-ulp-Zielwert verfehlte ({ "41" } Werte). Nachprüfung durch den Integrator (bleibt MODELLED): Der Vergleich stimmt überein, und eine Mutation der Paritätsmenge färbt ihn ebenfalls rot, aber die Vorabregistrierung d4d9eb9d erreichte den öffentlichen Branch um { "20" }:{ "02" }:{ "29" } UTC, zwei Sekunden nach dem Ergebnis-Commit 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC), der bereits die Ausgabe von RTKLIB für die Datei enthält, daher lässt sich die Reihenfolge 'registriert, bevor die Datei abgerufen wurde' nicht zeigen; eine neue Registrierung, die gepusht wird, bevor eine ungesehene Broadcast-Datei abgerufen wird, würde dies klären

# text
seg-c5c944357643 = Erfassung und C/N0-Schätzung an realem Mond-IQ

# text
seg-f5dcb5e06bf4 = Parallele Codephasensuche (acquisition::pcps_acquire: portable FFT, kohärente Faltung, nichtkohärente Akkumulation, Chi-Quadrat-Schwelle für eine suchweite Fehlalarmwahrscheinlichkeit), Verfeinerung, Open-Loop-Prompt-Korrelation mit Code-Doppler und der M2M4-C/N0-Schätzer, ausgeführt auf den 4-Bit-IQ-Batches von LuGRE L1, gelesen über realdata::ion_sdr

# text
seg-c53c795135d6 = GNSS-SDR { "0.0.19" } (GPL-3.0, eigenständiges Programm, festgelegte Konfiguration) auf den neun L1-Batches ohne Oberflächenaufnahme und dem RAW-C/N0 des Flugempfängers (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), vorab registriert 768cb62b. BEFUND: Kshanas Leser dekodiert alle { "288" } verglichenen Abschnitte identisch zu einem unabhängigen Konverter; GNSS-SDR erklärt { "266" } von { "288" } Suchen für positiv, und Kshana stimmt in allen { "266" } Entscheidungen überein, aber nur { "250" } liegen auf der Zelle von GNSS-SDR (A2 schlägt fehl); der C/N0-Zweig ist gegenstandslos, da keine RAW-Epoche des Flugs innerhalb von { "30" } s eines Batches liegt (nächste { "141" } s). Die meisten Positiven sind Artefakte: Die reinen Zweierkomplement-Pegel tragen einen Mittelwert von -0.5 auf I und Q, eine Linie bei Frequenz null { "32" } dB über dem Rauschen in einer { "1" }-kHz-Klasse, die beide Empfänger erfassen. Zwei Batches (OP5, OP12) wurden irrtümlich ausgeschlossen: Eine Lesart ihrer Metadaten ohne Ziffern wurde für einen Widerspruch zu ihren Headern gehalten; die wahre Ursache war, dass der Leser einen Abtastwert, der breiter als ein Wort ist, nicht lesen konnte (inzwischen behoben). Bleibt MODELLED

# text
seg-709626569a5c = Erfassung an realem Mond-IQ gegen den aus der Bahn vorhergesagten Doppler (Entscheidung über die Abtastleistung)

# text
seg-784ebd80c425 = acquisition::pcps_acquire mit seiner Entscheidung über die Abtastleistung auf den neun L1-Batches von LuGRE ohne Oberflächenaufnahme mit Mid-Rise-Pegeln; Doppler-Differenzen zwischen erfassten Satelliten verglichen mit Differenzen, die aus ESA-Endbahnen und der von Firefly rekonstruierten Trajektorie von Blue Ghost vorhergesagt wurden

# text
seg-38b8127db267 = Vorhergesagter Doppler aus ESA/ESOC-Endbahnen und der rekonstruierten NAIF-CLPS-Trajektorie (xval/lugre-predicted-doppler/predict.py, unabhängig von Kshana), vorab registriert 0d1839d2. BEFUND: Alle { "288" } Suchen überschreiten die Schwelle durch Rauschen (Statistiken der Abtastleistung etwa { "430" } bis { "520" } gegen { "346.3" }), daher gilt P1 trivial, und P3 gilt ({ "274" } von { "288" } als sichtbar vorhergesagt), während P2 bei { "4033" } von { "4036" } Paaren fehlschlägt. Das bandbegrenzte Front-End hebt das Rauschen jeder Zelle etwa um das { "1.46" }-fache an (festgehalten: Rauschboden { "292" } gegen das weiße Rauschen { "200" } bei OP2 PRN { "1" }), was die Statistik der Abtastleistung nicht sieht. Bleibt MODELLED

# text
seg-89875d67b253 = Erfassung an realem Mond-IQ, bewertet am aus der Bahn vorhergesagten Doppler

# text
seg-956bcfeaf319 = acquisition::pcps_acquire mit der Cell-Averaging-Entscheidung (Spitze über der mittleren Zelle des Gitters, robust gegen bandbegrenztes Rauschen) auf den neun L1-Batches von LuGRE ohne Oberflächenaufnahme mit Mid-Rise-Pegeln; Doppler-Differenzen zwischen erfassten Satelliten verglichen mit Differenzen, die aus ESA-Endbahnen und der von Firefly rekonstruierten Trajektorie von Blue Ghost vorhergesagt wurden

# text
seg-f80a751bc49b = Vorhergesagter Doppler aus ESA/ESOC-Endbahnen und der rekonstruierten NAIF-CLPS-Trajektorie (xval/lugre-predicted-doppler/predict.py, unabhängig von Kshana), vorab registriert a81a9a4e. BEFUND: P1 und P3 gelten ({ "4" } Batches, { "12" } von { "12" } Erfassungen als sichtbar vorhergesagt), aber P2 schlägt bei { "8" } von { "8" } Paaren fehl. Die zwei stärksten Paare entsprechen der Vorhersage im Betrag bei umgekehrtem Vorzeichen (OP2 PRN 18/24: +{ "7670.0" } Hz gemessen, -7693.9 vorhergesagt; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), daher ist die registrierte Reihenfolge mit I im niederen Nibble das Konjugierte der Batches; die sechs Detektionen knapp über der Schwelle passen zu keinem der Vorzeichen. Die Doppler-Streuung der Verfeinerung ({ "30" } bis { "50" } Hz zwischen zwei Läufen) wurde von der Registrierung ebenfalls unterschätzt. Bleibt MODELLED

# text
seg-8fa779dd1788 = Erfassung an zurückgehaltenem realem Mond-IQ gegen den aus der Bahn vorhergesagten Doppler

# text
seg-484868771231 = acquisition::pcps_acquire (Cell-Averaging-Entscheidung, Fehlalarmwahrscheinlichkeit { "1e-7" }) mit refine_doppler_coherent auf den LuGRE-L1-Batches, die auf der Mondoberfläche aufgezeichnet wurden (I im hohen Nibble, Mid-Rise-Pegel); Doppler-Differenzen zwischen erfassten Satelliten gegenüber Differenzen, die aus ESA-Endbahnen und dem Landeplatz-Kernel von Firefly vorhergesagt wurden

# text
seg-8bfd18bb6478 = Vorhergesagter Doppler aus ESA/ESOC-Endbahnen und dem NAIF-CLPS-Landeplatz-Kernel von Firefly (xval/lugre-predicted-doppler/predict_surface.py, unabhängig von Kshana), vorab registriert 2108e6ff an Batches, die zuvor nie geöffnet wurden. BEFUND: Die Nicht-Leerheitsbedingung schlägt fehl; kein Batch enthält zwei Erfassungen. OP40 ausgeschlossen (die Metadaten nennen eine fehlende Datei); OP38, OP73, OP77_0, OP77_1 erfassen nichts und zeigen bei { "1e-7" } keinen Fehlalarm (höchste Statistiken { "325" } bis { "356" } gegen { "385.9" }); OP74 und OP76 erfassen PRN { "31" } und OP78_0 und OP78_1 PRN { "12" }, jeweils allein, alle als sichtbar vorhergesagt. Bleibt MODELLED. Offengelegte Abweichungen: Der registrierte Doppler-Zielwert von { "10" } Hz beruht auf einer synthetischen Monte-Carlo-Rechnung der kohärenten Verfeinerung, nicht auf der Streuung der bereits gesehenen Batches, wie der Integrator es verlangt hatte; OP40 wurde vor dem Lauf ausgeschlossen, weil seine Metadaten eine Abtastdatei nennen, die der Datensatz nicht mitliefert

# text
seg-758af035b3ce = Gemeinsame Kommunikations- und Navigationsgeometrie am Mond

# text
seg-11f861bdc6bf = Topozentrische Blickwinkel je Satellit (Azimut im Uhrzeigersinn von Norden, Elevation) und Schrägentfernung an einem benannten selenographischen Standort, gegeben der Satellit im mondfesten Bezugssystem des Standorts (die validierte Aussage). Die Entfernungsmessgenauigkeit des Signals im Raum ist als Szenarioparameter freigegeben, sodass der Dienstvolumen-Durchlauf eine Entfernungsmess-ANFORDERUNG liefert statt eines Bestanden/Nicht-bestanden bei einem festen Sigma; dieser Parameter ist eine Entwurfseingabe außerhalb der validierten Aussage

# text
seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, als Werkzeug aus xval/anise-service-geometry ausgeführt, Binärdatei lunar-look-angles-xval, die keinen Kshana-Code aufruft): die eigene Routine von ANISE für Azimut, Elevation und Entfernung (azimuth_elevation_range_sez) aus Standorten, die mit seinem Konstruktor für Breite, Länge und Höhe auf dem Mond pck00011 (Kugel { "1737.4" } km) aufgebaut wurden, wobei die Satelliten über moon_pa_de440_200625.bpc in MOON_PA_DE440 gedreht werden. { "768" } Abtastwerte über { "8" } Standorte (die { "4" } benannten Standorte und { "4" } weitere, über und unter dem Horizont), { "12" } Epochen und { "8" } Satelliten stimmen innerhalb von { "1e-6" } Grad in Azimut und Elevation sowie { "1" } mm in Entfernung und Standortposition überein (vor dem Vergleich festgelegt); gemessen { "2.2e-12" } Grad, { "2.1e-13" } Grad und { "5.6e-9" } m. Aussage: Standortplatzierung und Blickwinkel, gegeben der Satellit im körperfesten Bezugssystem des Standorts. Kshanas eigene Realisierung des mondfesten Bezugssystems mit mittlerer Rotation und der Parameter der Entfernungsmessgenauigkeit liegen außerhalb davon; die Unit-Tests der geschlossenen Geometrie bleiben als stützende Prüfungen bestehen

# text
seg-10af60b488b9 = Differenzielle Referenzstation der NovaMoon-Klasse: Aufhebung des Gleichtakts + mit der Basislinie wachsendes Residuum + DGNSS-Schutzniveaus

# text
seg-96b2627b388a = Identität der differenziellen Fehleraufhebung + Wiederverwendung der DO-229E-SBAS-PL-Maschinerie; die Einzeldifferenz mit WLS-Lösung wird zusätzlich gegen lsq()/matinv() von RTKLIB (Takasu, BSD-2-Clause, kompiliertes C) gegengeprüft — unabhängiger Lösercode, aber dieselbe LOS-Differenz-Algebra erster Ordnung, daher weiterhin InternalConsistency

# text
seg-c04a3591074c = Interoperabilitätsexport für den Mond

# text
seg-91f4a066b3c0 = An LunaNet/IOAG ausgerichteter Export von Mond-Bezugssystem + Zeit + Ephemeride (CCSDS OEM + KIF) mit Round-Trip-Übereinstimmung

# text
# c1: oem
seg-f5f8ed69bea7 = Kshanas Mond-OEM-Export, erneut geparst von der unabhängigen Drittbibliothek <c1/> (R. J. Anderson): Bezugssystem-/Zeit-Token und Zustand je Epoche stimmen auf Schreibgenauigkeit überein ({ "1" } mm / { "1e-9" } km/s), und ein Export ohne TIME_SYSTEM wird abgelehnt — ein struktureller Austausch-Round-Trip; die physikalische Semantik von Mond-Bezugssystem und Zeit wird von deren eigenen Zeilen validiert, daher bleibt dies MODELLED. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): Ein zweiter unabhängiger Leser, der CCSDS-OEM-Parser von Orekit { "12.2" } (Apache-2.0, strenge Standardeinstellungen), lehnt beide Mond-Dateien ab, weil er die Zeitsysteme LTC und TCL nicht implementiert (er dekodiert das EME2000/UTC-OEM der Crate und dekodiert die Mond-Dateien, sobald TIME_SYSTEM durch TDB ersetzt wird); oem { "0.4.5" } dekodiert sie nur dadurch innerhalb der geschriebenen Genauigkeit, dass es vom nicht unterstützten Zeitsystem ausweicht. Der Austausch dieser Mond-Dateien mit gängigen CCSDS-Lesern ist nicht belegt

# text
seg-8ab65cbefb75 = An Rahmenwerken ausgerichtete Bewertung der PNT-Resilienz

# text
seg-c48198f31d63 = Teilbewertungen je Dimension über Kshanas eigene sieben Resilienzkategorien (nicht DHS-Begriffe), die RDRR-Funktionen von RethinkPNT und die Yang-Kriterien, jeweils mit ihrem Treiber als modelliert gekennzeichnet; vorläufige RPCF-Stufe mit einer Schranke für begrenzte Degradation. Aus der Simulation abgeleitete Selbsteinschätzung, nie eine Zertifizierung.

# text
seg-f905aeb203bb = Von Hand hergeleitete Formeln je Metrik: inverse Simpson-Diversität, gewichteter Mittelwert als Gesamtwert, begrenzte/unbegrenzte Zeitachsendauern, Stufenleiter nach dem schwächsten Glied

# text
seg-d7bdb6fe186e = Studie zur Entscheidungsinstabilität der Resilienzbewertung

# text
seg-5fcf18a68bb1 = Quantifiziert, wie ein einzelner Gesamtwert / eine RPCF-Stufe Architekturen unter einem vertretbaren Gewichtungs-Simplex und einem Bedrohungsensemble umordnet (Top-1-Wechselrate, Kendall-Tau-Streuung, Stufenwechselrate, Rangbereiche); Analysen von deklariert gegenüber gemessen und von Diversitätskollaps.

# text
seg-b6bf76a752a0 = Identitäten geschlossener Rangstatistik (Tau in [-1,{ "1" }] mit handberechneten Werten; deterministisches Dirichlet mit Seed) und konstruierte stabile/instabile Zeugen

# text
seg-1bf03544a010 = Repräsentativität der Demonstration & Lücken bis zum Flug

# text
seg-db24d16d38c9 = Ehrlichkeitsregister je Ergebnis, das eine Demonstrationsausgabe qualifiziert: ihre externen Anker, modellierten Annahmen, Lücken bis zum Flug und das repräsentative TRL-Band, mit durchgesetzten Invarianten (Validiert verlangt einen externen Anker; Modelliert verlangt eine Lücke und kann nicht über TRL { "4" } hinaus beanspruchen).

# text
seg-81d3adb239c5 = Geschlossene Invarianten, die auf die compliance-Disziplin 'Repräsentativität begründet + Lücken bis zum Flug identifiziert' abbilden; an die Grenze zwischen Verifikationsstatus und Art der unabhängigen Referenz gebunden

# text
seg-52ab936eb5f5 = Nachweise zum Quanten-gegen-klassisch-Abwägen (gemeinsame Form)

# text
seg-a6679ed5bed7 = Ein reproduzierbares TradeEvidence-Objekt (fester Rahmen: Szenario+Seed+Engine; gemeinsame Quanten-gegen-klassisch-Werte je Gütekennzahl mit vorzeichenrichtigem Vorteil, optional { "95" }-%-KI, Label validiert/modelliert), das einen Repräsentativitätsnachweis trägt, sodass jede Quanten-PNT-Vertikale die Abwägung auf dieselbe ehrliche Weise meldet.

# text
seg-70da3e15ea8b = Geschlossene Identitäten für Vorteil/Gewinner + getreue Hülle um das bestehende quantum_trade::TradeResult; Ehrlichkeit an das Repräsentativitätsregister und die Verifikationslabels gebunden

# text
seg-20fee61b3107 = Bibliothek von Fehlermodellen für Quantengeräte

# text
seg-e42eabe9bc2a = Gerätekarten (optisch/gefangenes Ion/Quecksilberion + klassische Uhren, wiederverwendet aus holdover/clock_state; Kaltatom-Interferometer; klassische + Verschränkungs-/Einzelphotonen-Zeitübertragungsstrecken), jeweils mit einem Repräsentativitätsnachweis; die Verschränkungsstrecke fügt ein schrotrauschbegrenztes Zeitgenauigkeitsmodell hinzu (~Jitter/sqrt(R*tau), Dunkelzählstrafe, systematische Untergrenze).

# text
seg-632600203e1f = Wiederverwendete Uhren-/CAI-Koeffizienten (holdover/clock_state, veröffentlichte Werte) + geschlossene Identitäten für Schrotrauschen/Verlust der Verschränkungsstrecke

# text
seg-86d71fd89f26 = Vertrauenswürdige Quantenzeitgebung (Zeitübertragung + sichere Verbreitung + Anomalie)

# text
seg-d2a3d37825ef = Durchgängige Zeitübertragungskette Quanten gegen klassisch (Uhren-Auslauf + Streckengenauigkeit quadratisch addiert), ein wiederverwendetes Zeitgebungs-Schutzniveau, eine Sicherheitskennzahl gegen Verzögerungs-/Wiedereinspielungsangriffe (1-P_md) sowie eine Erkennungswahrscheinlichkeit von Uhrenanomalien + CUSUM-Latenz, ausgegeben als ehrliches TradeEvidence mit einem Repräsentativitätsnachweis.

# text
seg-ac95d112a17a = Geschlossenes quadratisches Budget über wiederverwendete validierte Kerne (ADEV gegen Stable32/NIST; TPL-Schranke; Erkennung analytic_pd/pmd); Ehrlichkeit an das Repräsentativitätsregister gebunden

# text
seg-eaf341ff4522 = GNSS-freie Quantennavigation

# text
seg-908a44a9f7c7 = Quanten- (Kaltatom-Interferometer) gegenüber klassischer Koppelnavigation mit Navigationsklasse-INS während eines GNSS-Ausfalls: Wachstum des Positionsfehlers, Holdover bis zu einer Positionsschwelle und die Abwägung Quanten gegen klassisch als ehrliches TradeEvidence; ehrlicher Hinweis zur Beobachtbarkeit (Bias ohne Fix nicht beobachtbar, daher wächst der Fehler).

# text
seg-508f2c8884e2 = Wiederverwendete Inertialbudgets, gegengeprüft gegen eine unabhängige Octave-Doppelintegration derselben Koppelnavigations-ODE (andere Laufzeit, gemeinsames Modell → ReferenceImpl) plus das veröffentlichte Kurzzeitrauschen von Freier-2016 als einseitiger Anker; der Verbund Quanten gegen klassisch bleibt MODELLED

# text
seg-914132833f5a = Fehler-/Anomalieerkennung für Quanten-PNT-Systeme

# text
seg-f20392820b9d = Beschrifteter Katalog von Quantenfehlern (Uhr Frequenzsprung/Drift/Lock-Verlust; Sensor Bias-Sprung/Aussetzer), eine Erkennungsstatistik als ROC-AUC mit Bootstrap-KI und ein minimal erkennbarer Fehler bei fester Fehlalarmrate; ein quantenuhrgestützter Monitor erkennt kleinere Fehler als ein klassischer, ausgegeben als ehrliches TradeEvidence.

# text
seg-a689ab2ebb84 = Geschlossene Gauß-AUC = Phi(mu/(sigma*sqrt2)), gegengeprüft gegen das extern validierte eval_stats::bootstrap_auc_ci (gegen scikit-learn) + analytische Erkennungsschwellen

# text
seg-0633e05d393f = Drehmomentfreie Lagedynamik des starren Körpers

# text
seg-23f43007bcbf = Eulersche Kreiselgleichungen (I ω̇ = τ − ω × Iω, Hauptachsen- und allgemeiner Trägheitstensor), gekoppelt an die Quaternionen-Lagekinematik (q̇ = ½ q ⊗ ω) und propagiert mit einem RK4-Integrator fester Schrittweite, der das Quaternion in jedem Schritt neu normiert

# text
seg-2d21a01ea132 = Basilisk { "2.9.1" } Propagation des starren Körpers am Raumfahrzeug-Hub (AVSLab, ISC; MRP-Lage über seine eigenen gekoppelten Hub-Gleichungen, svIntegratorRKF78 bei relativer Toleranz { "1e-12" }), eine unabhängige Implementierung der drehmomentfreien Gleichungen des starren Körpers: Kshanas RK4-Quaternion (dt { "0.01" } s) und die Körperraten stimmen innerhalb von { "1e-9" } über { "1e4" } s an zwei allgemeinen nichtdiagonalen Trägheiten überein (schlechtester Wert { "3.3e-11" } und { "3.4e-12" } rad/s); Toleranz vor dem Vergleich festgelegt. Validierte Aussage: drehmomentfreie Bewegung; der Term des äußeren Drehmoments wird nicht verglichen. Die Erhaltungssatz- und Symmetrischer-Kreisel-Prüfungen bleiben als stützende Selbstkonsistenz bestehen. Keine Umgebung mit flexiblem Körper / Regelkreis / äußerem Drehmoment

# text
seg-93b8ba1ba0e5 = Relativbewegungsdynamik nach Clohessy–Wiltshire / Hill

# text
seg-17f27a95d009 = Relativbewegung eines Verfolgers um ein Ziel auf einer kreisförmigen Referenzbahn im LVLH-System: die linearisierten Clohessy–Wiltshire-Gleichungen (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }), gelöst durch die geschlossene { "6" }×{ "6" }-Zustandsübergangsmatrix Φ(n,t) (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) mit der Bedingung für eine beschränkte Relativbahn ẏ₀=−2n·x₀ und einer geschlossenen Korrektur zweiter Ordnung (cw_dynamics::second_order_correction, die CW-Antwort auf die quadratischen Terme der exakten Gleichungen für einen kreisförmigen Chief; Karlgaard und Lutze { "2003" }, Newman, Lovell und Pratt { "2015" }), zusammengesetzt als cw_dynamics::propagate_second_order. Die validierte Ausgabe ist propagate_second_order; das lineare Φ allein wird gegen die nichtlineare Wahrheit charakterisiert, nicht validiert

# text
seg-29adc2d68a7b = Orekit { "12.2" } (Apache-2.0) NumericalPropagator, Zweikörper, LOFType.QSW, als eigenständiges Programm ausgeführt (Fixture seit Runde { "1" } unverändert). Vorab registrierter Zielwert { "1e-3" } m an jedem Abtastwert jedes Falls; die Korrektur der Engine zweiter Ordnung wurde unverändert dagegen erneut ausgeführt (Nachtrag 8c8e768d, geschrieben bevor der Propagator existierte, mit Offenlegung, dass die Lücken erster Ordnung bekannt waren). propagate_second_order stimmt innerhalb von { "1.15e-7" } m (C1), { "9.8e-8" }, { "5.4e-8" } und { "2.2e-8" } m überein; das Halbieren des Terms zweiter Ordnung schlägt bei { "1.85e-3" } bis { "3.14e-3" } m fehl. Das lineare Φ allein weicht über ein Drittel einer Bahn bei { "100" } m um { "1.2" } bis { "6.3" } mm von der nichtlinearen Wahrheit ab (der ausgelassene Term zweiter Ordnung; sein strenger Test bleibt ignoriert), daher wird es charakterisiert, nicht validiert. Beibehaltene interne Prüfungen: Φ gegen eine RK4-Integration der Hill-Gleichungen, Φ(t)Φ(−t)=I, die Identitäten der beschränkten Bahn und der Drift −12π·x₀ sowie die Skalierung des Residuums dritter Ordnung des Terms zweiter Ordnung. Geltungsbereich: kreisförmiger Chief, Abstände nahe { "100" } m, bis zu einem Drittel einer Bahn; keine Exzentrizität (Tschauner–Hempel), keine J2- oder differenziellen Widerstandsterme; Annahme kleiner Abstände

# text
seg-d31be81dfd8f = Passive TDOA/FDOA-Geolokalisierung von Emittern

# text
seg-aa870cee16f6 = Einen Emitter (Jammer/Spoofer oder eine Gelegenheitsquelle für Reverse-PNT) aus der Ankunftszeitdifferenz über ein Empfängernetz orten — der Schnitt der Hyperboloide τᵢ=(Rᵢ−R₀)/c wird durch die Gauß–Newton-Methode der kleinsten Quadrate gelöst — und, mit der Frequenzdifferenz der Ankunft (Entfernungsratendifferenzen) bei bewegten Empfängern, gemeinsam Position und Geschwindigkeit zurückgewinnen; mit der Cramér–Rao-Untergrenze der Positionskovarianz aus der Messgeometrie

# text
seg-17b45796fd43 = Selbstkonsistenz von Schätzer und Geometrie: Vorwärts→Rückwärts-Round-Trips, die Fisher/CRLB-Identität J·CRLB=I, GDOP-Monotonie und der Schätzer, der seine eigene Cramér–Rao-Schranke unter Monte-Carlo-Rauschen erreicht — Prüfungen der internen Konsistenz, KEIN externer Datensatz, daher bleibt die Zeile InternalConsistency. MODELLED passive Geolokalisierung — Punktquellenmodell mit Sichtlinie; keine Mehrweg-/NLOS-, Empfängeruhrenfehler- oder atmosphärischen Refraktionsterme. { "0.30" } Runde { "2" }, gegen Ho und Chan { "1993" } und Ho und Xu { "2004" } (vorab registriert f89018b8, { "1" } % jedes gedruckten Werts), ein Befund (bleibt MODELLED): Die oberflächenbeschränkte TDOA-Schranke reproduziert die geometrischen Faktoren bei { "40" } N (-0.11 %, -0.02 %) und die maximale TDOA; die gemeinsame TDOA+FDOA-Schranke reproduziert Abb. { "6" } (+{ "0.06" } %, -0.17 %) und, an der Quelle, die der eigene Code der Autoren für Abb. { "7" } nennt (Nachtrag nach Kenntnis dieses Ergebnisses geschrieben, offengelegt), Abb. { "7" } (+{ "0.11" } %, -0.02 %); sie entspricht dem veröffentlichten Schrankencode der Autoren (BSD-artig, unter GNU Octave ausgeführt) auf { "3e-12" }; der kovarianzgewichtete Maximum-Likelihood-Löser erreicht die gedruckte Schranke (+{ "0.3" } bis +{ "0.4" } %). Die Ottawa-Faktoren, die das Paper aus einer Monte-Carlo-Rechnung druckt ({ "251" }, { "7.1" }), weichen um +{ "1.3" } % und +{ "4.4" } % ab, außerhalb des Zielwerts von { "1" } %

# text
seg-36b74b49f82f = Maximale Verzögerung beim ballistischen 3-DoF-Eintritt gegen den veröffentlichten Stardust-Nominalwert

# text
# c1: entry-heating
seg-a05ca2fde6fc = Ein 3-DoF-Punktmasse-Eintritt über einer rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" }, mit RK4 aus einem inertialen Eintrittszustand integriert, mit Angabe der maximalen Verzögerung und ihrer Höhe; der planetenrelative Eintrittszustand aus dem inertialen. Ausführbar als Szenarioart <c1/>.

# text
seg-5ab7065c0803 = Der Stardust-Nominalwert von Desai, Mitcheltree und Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maximale Verzögerung { "33.4" } g bei { "12.6" } km/s planetenrelativ mit der Startmasse von { "45.8" } kg, eine 6-DoF-POST-Trajektorie mit der vollständigen aerodynamischen Datenbank; Eintrittsschnittstelle nach Desai, Lyons, Tooley und Kangas (NTRS { "20090004445" }): Radius { "6503.14" } km, inertial { "12.9" } km/s bei -8.2 Grad. Zielwerte vorab in xval/entry-stardust/PREREGISTRATION.md registriert, vor jedem Lauf mit diesen Eingaben; beide wurden im ersten Lauf erreicht. WAS NICHT GEPRÜFT IST: ein veröffentlichter Fall und eine Größe (maximale Verzögerung, die in der ballistischen Näherung nicht vom ballistischen Koeffizienten abhängt); Eintrittsbreite und Kurs sind angenommen; Erwärmung, Wärmelast und der Landepunkt werden nicht dagegen geprüft; Punktmasse mit konstantem C_D, nicht 6-DoF.

# text
seg-5bd3882531b6 = Konvektive Staupunkt-Eintrittserwärmung (Sutton-Graves) bei einem 3-DoF-Eintritt

# text
seg-4f97036ed72f = Konvektiver Wärmestrom am Staupunkt q = k sqrt(rho/R_n) V^{ "3" } mit den Sutton-Graves-Konstanten für Erdluft und die Marsatmosphäre (NASA TR R-376, { "1971" }), sein Maximum und die integrierte Wärmelast entlang eines 3-DoF-Eintritts, ballistisch oder mit Auftrieb bei konstanter Querneigung, auf der Erde oder auf dem Mars.

# text
seg-5a203ecfeaee = Interne Konsistenz: die Beziehung und die Konstanten wie in NASA TR R-376 gedruckt, eine Halbschritt-Konvergenzprüfung und die erwartete Rangfolge der Maxima von Erwärmung und Verzögerung. WAS NICHT GEPRÜFT IST: Es wurde kein veröffentlichter Erwärmungswert verglichen (die Stardust-Veröffentlichungen geben eine Auslegungsgrenze und eine Schätzung aus konvektiver plus Strahlungserwärmung von etwa { "1200" } W/cm2 an, die eine rein konvektive Beziehung nicht treffen kann); keine Strahlungserwärmung, keine Wandtemperatur- oder Katalytizitätskorrektur und keine Reaktion des thermischen Schutzes.

# text
# c1: eo-radiometry
seg-38902593e841 = Signal-Rausch-Budget eines Nadir-Bildgebers (Lambertsche Szenenstrahldichte, Kameragleichung, Schrot-, Dunkel-, Ausles- und Quantisierungsrauschen), die System-MTF bei Nyquist als Produkt aus Beugung bei unverdeckter Apertur, Detektorapertur, linearer Verschmierung und Gauß-Jitter, die aus dieser MTF integrierte Kantenantwort und relative Kantenantwort, Q = lambda F / p, und die GIQE-Version { "4" }-NIIRS ohne MTF-Kompensation. Ausführbar als Szenarioart <c1/>.

# text
seg-bb3a01edc95d = Geschlossene Formen: die Beugungs-MTF bei halber Grenzfrequenz, die Ein-Pixel-Rampenkante einer reinen Detektorapertur (RER { "1" }), die Normalverteilungs-Kante einer Gauß-Unschärfe (RER = erf(0.5/(sigma sqrt { "2" }))), Skalierung des Schrotrauschens und die GIQE-{ "4" }-Koeffizienten wie veröffentlicht (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). WAS NICHT GEPRÜFT IST: Es wurde kein externer Bildgeber, keine gemessene MTF und kein bewertetes Bild verglichen; die GIQE ist eine empirische Regression mit eigenem Fehler; kein Streulicht, keine atmosphärische MTF, keine MTF-Kompensation und kein Aliasing.

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" } (Dichte und Druck), mit einem Nickstoß, durch den Düsengegendruck verminderter Schubkraft, Stufenbrennschlüssen exakt an Schrittgrenzen und den neben dem Zustand integrierten Gravitations-, Widerstands-, Steuer- und Gegendruckverlusten. Ausführbar als Szenarioart <c1/>.

# text
seg-174ed29adbbe = Interne Konsistenz: die exakte Identität Brennschlussgeschwindigkeit = Summe Isp g0 ln(m0/mf) minus die vier integrierten Verluste (Residuum unter { "1e-6" } m/s), die Tsiolkowski-Gleichung bei einem vertikalen Vakuumbrand mit der Gravitation als einzigem Verlust sowie die US76-Drücke auf Meereshöhe und an der Tropopause. WAS NICHT GEPRÜFT IST: Die Verluste keines veröffentlichten Fahrzeugs wurden verglichen; keine Erdrotation, kein Gleitflug, keine Drosselung und keine Lenkung über den Nickstoß hinaus; konstantes C_D; kein Trajektorienoptimierer.

# text
seg-55e8345def8b = TWSTFT-Zweiwegegleichung, Unsicherheitsbudget und Streckenstabilität mit Flicker und täglicher Nichtreziprozität

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = Die TWSTFT-Zweiwegegleichung, gelöst nach T_A - T_B mit Sende- und Empfangsverzögerungen der Stationen, der ionosphärischen Auf-/Abwärts-Asymmetrie im Ku-Band, dem Laufzeitunterschied der Transponder und den Sagnac-Termen, gegen ihr exaktes Vorwärtsmodell; ein quadratisches Unsicherheitsbudget mit der Strecken-TDEV als Typ-A-Term; eine Zweiwegeserie mit weißem und Flicker-Phasenrauschen (Kasdin-Walter), einer täglichen Nichtreziprozität und einem konstanten Reziprozitätsresiduum; sowie die Rate, das Residuum-RMS, TDEV und ADEV gelieferter Stationsuhrenserien aus Circular T, MJD-CSV oder IGS-RINEX. Ausführbar als Szenarioart <c1/>.

# text
seg-244f7396ac25 = Interne Konsistenz: Das Vorwärtsmodell und die gelöste Gleichung stimmen auf { "1e-15" } s überein, der Sagnac-Term entspricht der unabhängigen BIPM-2A-Schleifenform omega/c^{ "2" } des Moduls, der ionosphärische Term ist { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, und die Rauschprozesse zeigen ihre erwarteten TDEV-Formen. WAS NICHT GEPRÜFT IST: Es wurde keine reale TWSTFT-Messung und kein Kalibrierbericht verglichen; die angegebenen Verzögerungen und Unsicherheiten sind Eingaben, nicht gemessen; die Stabilitäten gelieferter Serien werden gemeldet, nicht validiert.

# text
seg-2f9be02c92bc = Numerik optischer Schrägstrecken-Atmosphäre: Rytov-Varianz, Szintillation, Gamma-Gamma-Schwundwahrscheinlichkeit, Aperturmittelung, optische Tiefe von Wolken und klarer Luft

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Hufnagel-Valley-Cn2, entlang einer Schrägstrecke integriert, für die Rytov-Varianz bei ebener und sphärischer Welle (Aufwärts- und Abwärtsstrecke), den Szintillationsindex nach Andrews-Phillips und die Gamma-Gamma-Parameter, die Gamma-Gamma-Schwundwahrscheinlichkeit und die Schwundreserve, den Aperturmittelungsfaktor bei schwacher Turbulenz, die optische Tiefe von Wolken einer Flüssigwassersäule und die optische Tiefe klarer Luft nach Kim-Sichtweite plus Rayleigh, wodurch der gebündelte atmosphärische Verlust des optischen Link-Budgets ersetzt wird, wenn eine Atmosphäre angegeben ist. Ausführbar innerhalb der Szenarioart <c1/>.

# text
seg-7ca512adff99 = Die Numerik wird mit einem unabhängigen Programm verglichen (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } mit { "30" } Stellen, Tanh-Sinh-Quadratur über der ursprünglichen Höhenvariablen und Bessel-K-Gamma-Gamma-Dichten), das keinen Code mit Kshana teilt, unter Zielwerten, die festgelegt wurden, bevor irgendeine Implementierung existierte (xval/optical-atmosphere/PREREGISTRATION.md). WARUM MODELLED: Diese unabhängige Referenz wertet dieselben veröffentlichten Formeln aus, prüft also die Implementierung der angegebenen Formeln und nicht die Atmosphäre; weder ein ITU-R-Validierungsbeispiel noch eine gemessene Szintillations- oder Schrägstrecken-Extinktionsaufzeichnung wird verwendet (die ITU-Werte sind eine offene Lizenzentscheidung und werden aus dem Repository herausgehalten). Das Niveau des Cn2-Profils, die Sichtweite, die Skalenhöhen von Aerosol und Molekülen, die Weglänge der Aperturmittelung und das Moment-Matching zur Anwendung der Aperturmittelung auf die Gamma-Gamma-Parameter sind angegebene Eingaben oder Konventionen. Eine Quellzeile im Modul hält fest, dass ein vielfach kopierter Überblick den zweiten Szintillationsexponenten als 7/6 druckt, wo Andrews und Phillips 5/6 angeben; die Form 5/6 ist implementiert

# text
seg-a2faab92e760 = Wettergetriebene Verfügbarkeit optischer Bodenstandorte und abstandskorrelierte Standortdiversität

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Verfügbarkeit einer optischen Strecke gegen eine angegebene Streckenreserve aus einem lognormalen Klima der Wolkenflüssigwassermenge (Menge nach ITU-R P.840, Extinktion der geometrischen Optik) und dem unabhängigen Gamma-Gamma-Turbulenzschwund, die für Zielverfügbarkeiten nötige Streckenreserve und die Obergrenze, die keine Reserve anhebt, lognormale Ausfalldauern, Was-wäre-wenn-Fälle für Verbesserungstechniken und eine Ein-Faktor-Gauß-Copula-Netzverfügbarkeit, deren Paarkorrelation exp(-Abstand/Dekorrelationslänge) ist. Ausführbar als Szenarioart <c1/>.

# text
seg-20eab6e9b925 = Interne Konsistenz: geschlossene Grenzfälle und Monotonie des Diversitätsmodells, die geschlossene Form der Wolkenobergrenze und die lognormalen Ausfallidentitäten. KEINE externe unabhängige Referenz wird beansprucht, und keine wurde verglichen: Es wird keine gemessene Verfügbarkeit einer optischen Bodenstation und keine Aufzeichnung wolkenfreier Sichtlinien verwendet. WARUM MODELLED: Das Wolkenklima (Wolkenwahrscheinlichkeit, Median und Streuung der Flüssigwassersäule, Ausfalldauern), die Unabhängigkeit von Wolke und Turbulenz, die Form der Gauß-Copula, die Dekorrelationslänge und jeder Technikgewinn sind Annahmen; die mitgelieferten Szenarien geben ILLUSTRATIVE Klimata an, keinen Datensatz. Eine Hochstufung dieser Zeile erfordert eine zitierte gemessene Verfügbarkeitsaufzeichnung und einen vor dem Vergleich registrierten Zielwert

# text
seg-043ece801e72 = Kontinuität von Zeitgebung und Entfernungsmessung bei optischen Ausfällen

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = Die Verteilung der Ausfalldauer eines optischen Standorts, gekoppelt an die geschlossene Auslaufvarianz des Uhren-Holdover-Modells: Zeitgebungs- und Entfernungsmessfehler bei angegebenen Ausfallquantilen, der Holdover bis zu einer Zeitgebungsschwelle, der Anteil der Ausfälle und der Ausfallzeit innerhalb davon und die Zeitgebungsverfügbarkeit A + U E[min(D, T_h)]/E[D], für die klassischen und die Quanten-Uhrenklassen. Ausführbar innerhalb der Szenarioart <c1/>.

# text
seg-ab2a33c1b1a4 = Interne Konsistenz mit dem Holdover-Modul, bitgenau; KEINE externe unabhängige Referenz wird beansprucht. Die Klassen-PSDs sind die synthetisierten Langzeit-tau-Untergrenzen, die das Holdover-Modul bereits trägt, sodass die Werte dessen angegebenen Vorbehalt erben, dass der Holdover bis zu einer engen Schwelle von der angenommenen Rotrausch-Untergrenze bestimmt wird und nicht von der zitierten Allan-Abweichung. Die Ausfalldauern sind ein lognormales Modell mit angegebenen Parametern, keine gemessene Aufzeichnung von Wolkenverweildauern

# text
seg-b119df65d2a7 = Optische Streckenreserve über die Zeit: eine Realisierung des Wetters eines Standorts mit Seed

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Eine optionale Tabelle <c1/> (Dauer, Schritt, Seed) lässt die Art <c2/> je Standort zusätzlich eine Realisierung des angegebenen Standortmodells mit Seed über die Zeit schreiben: Wolkenepisoden (klare Phasen exponentiell, Wolkenausfälle lognormal mit dem angegebenen Mittelwert und der angegebenen Streuung, der Zeitanteil in Wolken auf die angegebene Wolkenwahrscheinlichkeit gesetzt), eine lognormale Flüssigwassersäule je Wolkenepisode, eine Gamma-Gamma-Szintillationsprobe je Schritt und daraus die Streckenreserve, die Wolken- und Szintillationsschwunde und die Streckenverfügbarkeits-Markierung, mit der realisierten Verfügbarkeit, dem Wolkenanteil, der Zahl der Ausfälle und dem längsten Ausfall. Ohne die Tabelle ist das Ergebnis das Dokument { "0.37" }. Ziehungen laufen über die portablen Verteilungs- und Mathematikroutinen, sodass native und wasm32 dieselben Bytes liefern.

# text
seg-d25e5d2449bd = Nur interne Konsistenz; KEINE externe unabhängige Referenz wird beansprucht, und für eine Wetterrealisierung gibt es keine. Die Prüfungen vergleichen eine Ziehung mit der statistischen Ausgabe desselben Modells, sodass ein Bestehen aussagt, dass der Generator die angegebenen Verteilungen abtastet (die Verfügbarkeit und der Wolkenanteil der Ziehung liegen innerhalb vorab registrierter Toleranzen der angegebenen Werte), nicht, dass sich ein realer Standort so verhält. Die Serie ist eine Realisierung, nicht das Klima: Ihre Verfügbarkeit weicht um den Stichprobenfehler der Ziehung von der angegebenen ab, und Szintillationsproben bei verschiedenen Schritten sind unabhängig, eine angegebene Vereinfachung eines Prozesses, der in Millisekunden dekorreliert. Die Wettereingaben bleiben Annahmen des Szenarios.

# text
seg-24cb37529637 = P2: numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) und inv auf { "201" } eingecheckten SPD-Eingaben (tests/fixtures/gls_whitening_numpy_oracle) prüfen den selbst geschriebenen Faktor, das gewichtete Residuum und den Whitening-Operator; das Mahalanobis-Quadrat wird gegen solve(Omega, r) geprüft, das keine Cholesky-Zerlegung verwendet, sodass die Identität z^T z = r^T Omega^-1 r auf einem getrennten Weg bestätigt wird. Alles innerhalb von { "1e-12" } relativ (schlechtester Wert { "7.9e-16" }), Toleranz vor dem Vergleich festgelegt. Die größte Konditionszahl beträgt { "19.3" }, schlecht konditionierte Matrizen sind daher nicht abgedeckt. GLS/Aitken-{ "1935" }-Whitening ist Cited.

# text
seg-1a3bb032960f = Konsistenzstatistik für Gleichtakt (trennungsblinder Fehler der gemeinsamen Referenz)

# text
seg-1b03f522b8fc = Score-Statistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 für eine Gleichtaktverschiebung, die die Lösungstrennung (Kontraste orthogonal zu { "1" }) nicht sehen kann; eine Gleichtaktverschiebung bläht sie auf, während die paarweisen Trennungen flach bleiben

# text
seg-d79071a5d9ec = Unabhängige numpy-Reproduktion der Statistik + Eigenschaftstest, dass eine Gleichtakt-Injektion sie aufbläht (InternalConsistency). Modelliertes Szenario. { "0.30" } Runde { "2" } (vorab registriert f9aa360d), blockiert (bleibt MODELLED): numpy { "2.3.5" } LAPACK gesv reproduziert den Statistikwert auf { "261" } eingecheckten Fällen (innerhalb von { "3.5e-15" } bei guter Konditionierung, { "1.2e-9" } bei Kondition bis { "6.1e7" }); das chi-Quadrat({ "1" })-Nullgesetz ist ein zitierter Satz und die flachen paarweisen Trennungen eine Identität ohne Engine-Ausgabe zum Vergleich, sodass die Eingrenzung auf eine Entscheidung des Eigentümers wartet

# text
seg-91fc18cde833 = Grenze für nicht erkennbaren Gleichtakt außerhalb von Omega (Residuum)

# text
seg-0cc2c0f033c8 = Obergrenze für nicht erkennbaren Gleichtakt: die größte Fehlergröße entlang einer Richtung d, die SOWOHL der Trennung (alpha_ss = T_ss / gewichtete Kontrastnorm von d) ALS AUCH der Gleichtaktstatistik (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|) entgeht, angegeben als min(alpha_ss, alpha_cm). Bei positiv definitem Omega schließen sich die beiden blinden Richtungen (d proportional zu { "1" } und { "1" }^T Omega^-1 d = { "0" }) gegenseitig aus, sodass die Obergrenze für jedes von null verschiedene d ENDLICH ist; unendlich ist sie nur bei einer Nullrichtung oder einem nicht positiv definiten Omega. Eine Richtung außerhalb der modellierten gemeinsamen Achse ist nur für die Gleichtaktstatistik blind und wird durch die Trennung begrenzt

# text
seg-b67c71daa7de = P2: numpy { "2.3.5" } linalg.solve (LAPACK gesv, LU ohne Cholesky) berechnet alpha_ss (die Schwelle über der gewichteten Kontrastnorm von d nach Entfernen seines GLS-Gleichtaktkoeffizienten), alpha_cm und deren Minimum auf { "256" } eingecheckten (Omega, d, T_ss, T_cm)-Eingaben (tests/fixtures/gls_outside_omega_bound_numpy_oracle) neu, darunter reine Gleichtaktrichtungen, Richtungen außerhalb der modellierten gemeinsamen Achse sowie die Fälle der Nullrichtung und des nicht positiv definiten Omega, die +inf ergeben müssen; vorab registriert (d070699a; Änderung 8a44267b, vor jedem Vergleich, Neufassung der Matrixform); Toleranzen vor dem Vergleich festgelegt. Der Text der Fähigkeit wurde per Entscheidung des Eigentümers (2026-10-02) korrigiert: Er hatte behauptet, die Grenze sei für eine Richtung außerhalb der gemeinsamen Achse unendlich, was dem Code und diesem Vergleich widersprach. Dass der idealisierte Einzelkontrast-Detektor die nicht erkennbare Größe eines realen Teilmengen-Detektors nach unten begrenzt, bleibt modelliert

# text
seg-a7a33523bb1c = Identifizierbarkeit des Mond-Datums - Zerlegung, lineare Algebra

# text
seg-bd59cc76557a = Marginale des Blocks { "{" }Mondzentrum-X, Maßstab{ "}" } der Fisher-Matrix des 7-Parameter-Helmert-Datums über das Schur-Komplement: die skalare Degenerationsmetrik lambda_min(S), die CRLB des Ursprungs X und die Korrelation zwischen Ursprung und Maßstab

# text
seg-0f7e4fb31c44 = Unabhängige SciPy/NumPy-Referenz (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): das Schur-Komplement, seine Eigenwerte und die 2x2-Inverse, berechnet von einer unabhängigen Bibliothek. Beschränkt auf die LINEARE ALGEBRA der Zerlegung; die Beträge von Korrelation und CRLB des Mondes aus realer Geometrie bleiben MODELLED.

# text
seg-3359eee713a5 = Klassifikation des Nullraums des Mond-Datums (LLR-Rang-Additivität + Libration, Hebung des Defekts)

# text
seg-6d722c176052 = Klassifikation des Datumsproblems bei interner Entfernungsmessung: Eine einzelne Entfernungsbeobachtung trägt den Rang { "1" } bei (6-dimensionaler Nullraum); das Paar aus Ursprung X und Maßstab ist nahezu null, und die physikalische DE440-Libration hebt den Defekt auf null, während das Paar nahezu degeneriert bleibt

# text
seg-ae6dc4e6ea8b = Von der Engine reproduzierte geometrische Struktur plus die geschlossene 2x2-Schur-Identität; in der STRUKTUR konsistent mit Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), deren berichtete Beträge hier NICHT reproduziert werden. Die Klassifikation ist strukturell; die Beträge von Korrelation und CRLB unter realer Geometrie sind MODELLED (Reflektorkoordinaten und Orientierung festgehalten). { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): gegenüber Sosnica et al. { "2025" } liegt die Ursprung-Maßstab-Korrelation der Entfernungs-Fisher-Matrix (-0.993 / -0.988) innerhalb von { "0.05" } des veröffentlichten Werts -0.97, aber auf der eigenen Fünf-Reflektoren-Geometrie der Veröffentlichung beträgt die 7-Parameter-Helmert-Korrelation bei gleicher Gewichtung -0.78 (der veröffentlichte Wert beruht auf Fehlern je Reflektor, die die Veröffentlichung nicht angibt), und die CRLB des Ursprungs ({ "0.6" } bis { "1.2" } mm bei { "3" } mm Entfernungsrauschen) liegt { "96" } bis { "98" } % unter den { "3.07" } cm der Veröffentlichung bei einer Toleranz von { "20" } %. Beträge nicht reproduziert

# text
seg-3fd19007ea67 = Multitechnik-Datumsinformation des Mondes (LLR + Mond-VLBI + Orbiter-Entfernung)

# text
seg-23d0dd7d0666 = Datum-Jacobi-Zeilen für die LLR-Entfernung zu Erdreflektoren, die differenzielle Laufzeit der Zwei-Stationen-Mond-VLBI und die Entfernung zwischen Orbiter und Bake über das 7-Parameter-Datum, zusammengeführt zu einer einheitlich vorkonditionierten Fisher-Matrix; zeigt, dass nicht radiale (Orbiter- / tiefendiverse) Verfolgung die Degeneration zwischen Ursprung X und Maßstab aufhebt, während transversale VLBI nur indirekt hilft

# text
seg-b2f5715c4577 = Kreuzprüfungen der Ableitungen jeder Technik, analytisch gegen finite Differenzen (intern); die RICHTUNG der Verbesserung ist eine geometrische Tatsache. Bakenorte, Zeitpläne und Rauschen sind MODELLED/repräsentativ (siehe tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-f9796a4c9a85 = DE440-Anbieter der Orientierung der Hauptträgheitsachsen des Mondes

# text
seg-ebe4519a40e4 = Rotation MOON_PA_DE440 nach J2000 zu beliebigen Epochen innerhalb von 2014-01-01 bis 2030-12-31 TDB durch geodätische Interpolation R0·Exp(f·Log(R0ᵀR1)) zwischen den Stützstellen einer eingecheckten täglichen Reihe mit { "6" } 209 Zeilen (die try_-Funktionen geben außerhalb davon OrientationSpanError zurück, die nicht fehlbaren lösen Panic aus; es wird nie begrenzt); zur Kompilierzeit eingebettet, sodass kein Dateisystemzugriff zur Laufzeit nötig ist und der WASM-Build sie mitführt

# text
seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 bis spiceypy { "8.2.0" }, als Werkzeug ausgeführt): pxform von MOON_PA_DE440 nach J2000, das die binäre PCK moon_pa_de440_200625.bpc von JPL direkt mit dem eigenen Frame-Kernel moon_de440_250416.tf von NAIF auswertet, bei { "2 000" } zufälligen Epochen zwischen den Stützstellen im eingebetteten Fenster. Der Rotationswinkel zwischen den Matrizen von Kshana und SPICE liegt innerhalb von { "1.7e-5" } rad ({ "30" } m beim mittleren Radius von { "1737.4" } km, vor dem Vergleich festgelegt); gemessen schlechtester Wert { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad und schlechtester Wert { "1.75e-6" } rad bei { "6 000" } weiteren, vom Prüfer gezogenen Epochen. Die täglichen Stützstellen wurden selbst aus demselben Kernel extrahiert (scripts/gen_de440_moon_pa.py, Fixture-SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), sodass dieser Vergleich die Interpolation zwischen ihnen prüft, was die Behauptung ist. Durch diesen Vergleich gefunden und behoben: Die frühere elementweise lineare Interpolation mit Gram-Schmidt behielt die Achse, aber nicht den Winkel der Rotation von { "13.2" } deg/Tag bei und wich nahe den Viertelpunkten um bis zu { "2.0e-4" } rad ({ "340" } m) ab; der frühere Wert von etwa { "14" } m stammte von einer Schutzprüfung, die nur Intervallmitten abtastet. Die Reihe deckt 2014-01-01 bis 2030-12-31 ab und liefert außerhalb davon Fehler (Runde { "2" }); ihre Stützstellen von 2024-2025 lassen sich aus demselben Kernel bis { "4.3e-13" } neu erzeugen. Der obige SPICE-Vergleich zwischen den Stützstellen deckt nur 2024-2025 ab, was das validierte Fenster ist; die erweiterten Stützstellen stammen aus demselben Kernel und Skript, wurden aber zwischen den Stützstellen nicht verglichen. Ein Geometrie-Substrat für die Identifizierbarkeitsanalyse, kein Orientierungsprodukt im Submeterbereich

# text
seg-ab96cfc8d48c = Geometrie-Substrat des Mond-LLR-Datums (Reflektoren in Hauptträgheitsachsen, Bodenstationen, analytische Entfernungsableitungen)

# text
seg-40e91288f81a = Die fünf erdzugewandten Retroreflektor-Arrays in Metern im PA-Körperkoordinatensystem und die LLR-Bodenstationen in geodätischen Koordinaten; Platzierung der Reflektoren vom Körper- ins Inertialsystem über die DE440-PA-Orientierung; analytische Ableitungen der Entfernung Erde-Reflektor nach dem 4-Parameter-Datum; und die reine LLR-Fisher-Matrix, die die Degeneration zwischen Mondzentrum-X und Maßstab zeigt, die die 7-Parameter-Analyse motiviert

# text
seg-89ce1f95d9f6 = Die Berechnung wird intern geprüft: jede analytische Ableitung gegen eine finite Differenz und der Fall des Null-Datums gegen die nominelle Entfernung. Der KATALOG wird extern und unabhängig geprüft - die DE440-Hauptachsenkoordinaten (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) werden mit Tabelle { "6" } des Memorandums zu den DE430-Oberflächenkoordinaten (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, maschinell aus einem per SHA-256 verifizierten PDF extrahiert durch tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) kreuzgeprüft und stimmen auf { "1.12" } m überein, während die Mean-Earth-Realisierung derselben fünf Arrays um { "672" } bis { "871" } m abweicht. Die DEGENERATIONSSTRUKTUR wird gegen ein veröffentlichtes Ergebnis geprüft: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, das für das Hauptachsensystem des Mondes einen Korrelationskoeffizienten von r = -0.97 zwischen Mondzentrum-X und Maßstab angibt und berichtet, dass LLR wegen dieser Korrelation den tatsächlichen Massenmittelpunkt des Mondes nicht mit einer Genauigkeit besser als { "12" } cm erreicht. Dieses Modul gewinnt dieselbe Struktur (|corr(t_x, scale)| zwischen { "0.9" } und { "0.9999" }, Datumsdefekt <= { "1" }) aus einem reinen LLR-Fisher-Entwurf zurück. Die Bestätigung erfolgt über Ephemeriden hinweg, nicht als Rundlauf: Die Veröffentlichung kombiniert INPOP21a, DE430 und EPM2021, während dieses Modul von der DE440-Libration angetrieben wird. Was NICHT reproduziert wird, ist der Betrag - die Korrelation beträgt hier etwa -0.988 gegenüber ihren -0.97, und die 4-Parameter-CRLB liegt im Submillimeterbereich gegenüber ihrem erreichten Boden von { "12" } cm, weil Orientierung und Reflektorkoordinaten hier festgehalten und dort mitgeschätzt werden. Nur Geometrie und Degenerationsstruktur; keine Genauigkeitsaussage über ein geschätztes Datum. { "0.30" } externer Vergleich: Die Teile dieses Moduls zur gemessenen Entfernung (reflectors(), stations_itrf(), die DE440-PA-Platzierung und die baryzentrische Lichtlaufzeit llr_bcrs_one_way_m) sind in ihrer eigenen Zeile, LLR-Modell der gemessenen Entfernung, gegen { "192" } ILRS-Normalpunkte validiert (RMS { "2.81" } m gegenüber { "10" } m). Diese Zeile bleibt MODELLED, weil der Vergleich mit Messungen den Rest ihrer Behauptung nicht prüft. Der geodätische Stationskatalog stations() rundet APOLLO auf { "0.001" } deg; mit einer geozentrischen Lichtlaufzeit ergibt er auf denselben Punkten { "22.7" } m (Test reflector_ranges_against_ilrs_normal_points; { "96" } m mit der früheren elementweisen Orientierungsinterpolation). Die analytischen Entfernungsableitungen und die reine LLR-Fisher-Matrix werden über llr_range_m und reflector_inertial mit der analytischen Mondreihe (ephem::moon_position, etwa { "0.3" } deg vom GCRS) und ohne Lichtlaufzeit berechnet

# text
seg-a78ba110b64c = LLR-Modell der gemessenen Entfernung (Reflektorkatalog, ITRF2020-Stationen, DE440-Platzierung der Hauptträgheitsachsen, baryzentrische Lichtlaufzeit nach IERS { "2010" })

# text
seg-c9827c1a427b = Die einfache Entfernung von der Erdstation zum Reflektor eines Normalpunkts der Laser-Entfernungsmessung zum Mond: die fünf erdzugewandten Retroreflektor-Arrays in Metern im DE440-Hauptachsen-Körperkoordinatensystem (PA) (lunar_llr_geometry::reflectors); die Stationen aus stations_itrf(), nämlich Grasse { "7845" } und Matera { "7941" } aus ITRF2020 zur Epoche { "2015.0" } mit ihren Geschwindigkeiten, durch die IERS-{ "2010" }-Transformation mit Polbewegung aus Bulletin A ins Geocentric Celestial Reference System (GCRS) gebracht (lunar_vlbi::station_inertial_position_itrs), und APOLLO { "7045" } an seiner vom Betreiber veröffentlichten genäherten geozentrischen Position (ohne Geschwindigkeit); die Platzierung der Reflektoren vom Körper- ins Inertialsystem über die DE440-PA-Orientierung (lunar_orientation::try_de440_moon_pa_body_to_inertial, die außerhalb von 2014-2030 einen Fehler liefert); und die baryzentrische Lichtlaufzeit nach IERS Conventions { "2010" } Abschnitt { "11.2" } (lunar_llr_geometry::llr_bcrs_one_way_m: die Körper-zu-BCRS-Transformation von Station und Reflektor nach Gl. { "11.19" } und die Shapiro-Verzögerung durch Sonne, Erde und Mond nach Gl. { "11.17" }). EINGABEN, nicht Teil der Behauptung: die baryzentrischen Zustände und Potenziale von Erde, Mond und Sonne (DE440 über SPICE), IERS UT1-UTC und Polbewegung sowie die gemessene Umlaufzeit, von TT nach TDB umgerechnet. SEITE DES PRÜFSTANDS, nicht Teil der Behauptung: die Mendes-Pavlis-Zenitverzögerung mit FCULa-Abbildung, im Test, mit der Elevation aus dem geodätischen Katalog stations(). Nicht modelliert: Gezeiten, Stationsexzentrizitäten, thermische Terme der Reflektoren

# text
seg-536c75eebae3 = Gemessen: { "192" } ILRS-CRD-v2-Normalpunkte zum Mond (EUROLAS Data Center, DGFI-TUM, 2024-04 bis 2024-06; Grasse { "151" }, APOLLO { "32" }, Matera { "9" }; wörtlich mit SHA256SUMS eingecheckt). Die vorhergesagte einfache Entfernung wird mit c mal der halben gemessenen Umlaufzeit in TDB verglichen. Vor dem Vergleich festgelegter Zielwert: RMS höchstens { "10" } m über alle { "192" } Punkte UND über die { "160" } Punkte der beiden ITRF2020-Stationen allein. Der Zielwert stammt aus der dritten Vorregistrierungsänderung 3e0f5cdf, eingecheckt vor der Engine-Änderung und dem Lauf; der Wert von { "10" } m ist seit Runde { "1" } unverändert. Gemessen: { "2.81" } m (Mittelwert { "2.67" } m) über alle Punkte; { "2.96" } m auf den ITRF2020-Stationen; APOLLO { "1.94" } m; Ausschnitt { "2015" } ({ "349" } Punkte, sekundär) { "3.82" } m. Mutation: Das Nullsetzen der Shapiro-Anteile der Sonne ergibt { "10.19" } m, was nicht besteht. Verlauf, offengelegt: { "96" } m mit elementweiser Orientierungsinterpolation; { "22.7" } m nach geodätischer Interpolation mit dem geodätischen Katalog; { "10.94" } m mit ITRF2020-Stationen und Polbewegung, aber geozentrischer Lichtlaufzeit (ein gemeinsamer Versatz von +{ "10.9" } m). Das baryzentrische Modell wurde geschrieben, nachdem dieser Versatz gesehen wurde. Es ist das veröffentlichte Modell nach IERS { "2010" } Abschnitt { "11.2" } ohne freien Parameter. Die dritte Änderung ersetzte eine selbst auferlegte Bedingung, nur ITRF2020/SLRF2020 zu verwenden, nach dem Ergebnis BLOCKED. Der RMS allein für ITRF2020 besteht ohne APOLLO, das keine ITRF2020- oder SLRF2020-Lösung hat und dessen Position die vom Betreiber angegebene Näherung ist. Ein gemeinsamer Versatz von +{ "2.7" } m bleibt, liegt unter dem Zielwert und ist nicht abgestimmt. Der Zielwert ist gemessen am Ergebnis locker: Ein fehlender Sonnenterm von { "7.6" } m ergibt immer noch { "10.19" } m. Terme unter dem Zielwert werden nicht einzeln aufgelöst: Mit auf null gesetzter Polbewegung beträgt der RMS { "6.15" } m (ITRF2020-Stationen { "5.98" } m), und mit entfernter Transformation nach Gl. { "11.19" } beträgt er { "2.96" } m; beide würden weiterhin bestehen. Stationsgeschwindigkeiten und die Shapiro-Terme von Erde und Mond sind noch kleiner. Der Vergleich validiert die zusammengesetzte einfache Entfernung bei { "10" } m RMS und den Shapiro-Term der Sonne, nicht jede aufgeführte Komponente

# text
seg-9b1dfa736cb6 = Gekoppelte Eichung von Mondsystem und Zeitskala: der gemeinsame Nullraum aus räumlichem Datum, Uhrversatz und Uhrrate

# text
seg-a000ef6ab2e0 = assemble_coupled_info baut die gekoppelte 9-Parameter-Fisher-Matrix über [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha] auf; classify_null_space liefert eine basisinvariante Zerlegung ihres Nullraums in rein räumliche, rein zeitliche und echt gekoppelte Dimensionen sowie die Kopplungsnorm des Projektors vom Räumlichen zum Zeitlichen; coupled_marginal_eigs liefert die Schur-Komplement-Marginale { "{" }Maßstab, Versatz{ "}" }. Auf den eingecheckten Netzen meldet die Engine ein Datum mit vollem Rang (Defekt { "0" }) für den gut gestellten Fall und einen exakten Defekt in einer einzelnen Ratenrichtung für den Einzelepochenfall (verstrichene Zeit null, die Rate ist also konstruktionsbedingt nicht beobachtbar) und berechnet in beiden die Marginale { "{" }s, d_tau{ "}" }.

# text
seg-35eebbc8a2e9 = WAS EXTERN GEPRÜFT WIRD, eng gefasst: kshana berechnet die Eigenzerlegung mit seinem eigenen handgeschriebenen Jacobi-Löser (fim::sym_eig) und die Marginale mit seiner eigenen Pseudoinversen; das Orakel berechnet beides mit numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) über scripts/gen_coupled_gauge_ref.py neu. Übereinstimmung auf rel<{ "1e-3" } ist daher eine Prüfung der ARITHMETIK DIESER CRATE gegen eine Standardimplementierung mit unabhängiger Bibliothek, was die validierte Behauptung ist und deren Gesamtheit. WAS NICHT: Der Aufbau und die Klassifikation des Nullraums sind die eigenen Regeln dieses Moduls, und das Orakel reproduziert sie aus derselben Spezifikation statt aus einer unabhängigen Quelle - das bestätigt die Implementierung, nicht die Regel. Die Geometrie von Baken und Orbitern ist modelliert und repräsentativ. Die Beobachtungszeilen tragen zwar die reale DE440-PA-Orientierung des Mondes (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), doch das ist eine EINGABE, die beide Seiten erhalten, kein Beleg für die Antwort, und wird hier als Herkunftsangabe festgehalten statt als Rechtfertigung für den Status - dieselbe Unterscheidung, die main bereits in der Zeile zur Gleichtakt-Integrität trifft. Jede Gleitkommazahl einer Zeile wird vor dem Schreiben von network.json auf { "6" } Nachkommastellen gerundet, sodass beide Seiten identische IEEE-754-Doubles lesen und der einzige verbleibende Unterschied der Löser ist.

# text
seg-63a8571f8eb0 = Degeneration zwischen Entfernung und Uhrversatz bei einfacher Mondentfernungsmessung und das Entwurfsgesetz der geometrischen Vielfalt

# text
seg-cdd70f56051a = Die Degeneration zwischen radialer Entfernung und Empfänger-Uhrversatz je Knoten ist exakt bei { "1" } m zu { "3.336" } ns (eins durch c). Die Schur-Komplement-Marginale { "{" }Maßstab, Versatz{ "}" } (coupled_marginal_fisher) zeigt, dass in einem geometrisch vielfältigen Netz die Zweiwege-Entfernungsmessung die Marginale um etwa denselben Faktor hebt wie eine gleiche Anzahl zusätzlicher Einwege-Daten, während im idealisierten Einzelknoten-Regime die Hebung durch Zweiwege um Größenordnungen größer ist. Das daraus folgende Entwurfsgesetz: Geometrische Vielfalt, nicht die Zweiwege-Entfernungsmessung als solche, trennt bei der Einwege-Entfernungsmessung den Maßstab des Mondsystems vom Zeitskalenversatz; eine Zweiwege- oder externe Zeitanbindung ist nur im Regime geringer Vielfalt oder eines einzelnen Nutzers erforderlich.

# text
seg-25dd0e9134c8 = Schur-Komplement-Marginale der Fisher-Matrix der gekoppelten Informationsmatrix, in geschlossener linearer Algebra, geprüft an den beiden Grenzregimen, die sie vorhersagt. Die Äquivalenz von { "1" } m zu { "3.336" } ns ist die Definition des Meters über c und kein empirisches Ergebnis. Die Beobachtungsnetze sind repräsentative modellierte Geometrie, sodass das Entwurfsgesetz eine Aussage über die ihm vorgelegte Geometrie ist und keine Behauptung über ein im Einsatz befindliches Mondnetz enthält.

# text
seg-16ec8283f9b4 = Relativistische Kopplung von Uhrrate und Bezugssystem für die Mond-Zeitskala

# text
seg-d9a426dc8620 = rate_frame_jacobian(_with) liefert die Empfindlichkeit der Rate der Mond-Zeitskala gegenüber der Realisierung des Bezugssystems, aus dem äquatorialen effektiven Potenzial, abgeschnitten bei Grad { "2" } (GM, Äquatorradius, J2, Rotation; LunarSurfacePotential): d_alpha/d_scale = L_m, etwa +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, etwa -1.11e-14 (zeitabhängig); d_alpha/d_r_radial = g_eff/c^{ "2" }, etwa +{ "1.806e-17" } pro Meter. Für eine radiale Datumsverschiebung von { "1" } m ist das eine Störung der Rate von etwa { "1.8e-17" } (eine arithmetische Folge des radialen Eintrags), weit unter dem Ratenversatz von etwa { "1.7e-11" } einer Mond-Zeitskala gegenüber TT

# text
seg-6fc3d01ea825 = Vorab registriert (5590ab21): L_m gegen Ashby und Patla { "2024" } (AJ { "167" }:{ "149" }) Gl. ({ "10" }), { "3.13881" }({ "15" })e-11, aus GM, a_m, omega_m der Veröffentlichung und dem J2 der beiden Felder vom Grad 350, die die Veröffentlichung zitiert (Bertone et al. { "2021" }, AIUB-GRL350A/B), innerhalb von { "1e-4" }; der radiale Eintrag gegen die Äquatorschwere derselben Felder aus pyshtools { "4.14.1" } (BSD-3) innerhalb von { "1e-4" } (gemessen { "8.3e-5" } und { "6.7e-5" }, ein knapper Abstand); der Geschwindigkeitseintrag gegen die Mondgeschwindigkeit aus JPL Horizons DE441 innerhalb von { "4.5e-3" }. Eine geschlossene Form vom Grad 2 eines veröffentlichten Werts vom Grad 350 (Restgrad 3-350; Referenz, nicht P1). Offengelegt: Das Ergebnis des Eintrags 1 war vor der Vorregistrierung bekannt, und der mitgelieferte Standardradius { "1738.14" } km ist die Oberflächendefinition der Veröffentlichung, übernommen nach Runde { "1" }. Die Gezeitenbeiträge und das Vergleichsband bleiben modellierte Zahlen der Bezugsfläche

# text
seg-a666792106d9 = Basisinvariante Klassifikation des gekoppelten Nullraums von Bezugssystem und Zeitskala

# text
seg-5ee36574d1b4 = classify_null_space zerlegt den Datum-Nullraum in einen rein räumlichen Teil (Dimension d minus Rang U_T), einen rein zeitlichen Teil (d minus Rang U_S) und einen echt gekoppelten Teil (Rang U_S plus Rang U_T minus d), dazu die Kopplungsnorm p_st_norm des Projektors vom Räumlichen zum Zeitlichen, die Frobenius-Norm des nichtdiagonalen Blocks des Nullraum-Projektors. Jede dieser Größen ist eine Funktion des PROJEKTORS und nicht einer gewählten Basis, sodass sie unter jeder orthonormalen Wahl der Nullvektoren invariant sind - was die Klassifikation überhaupt erst berichtbar macht.

# text
seg-0608e1dc5183 = SciPy/NumPy (BSD-3-Clause; scipy.linalg.null_space und numpy.linalg.svd, LAPACK gesdd) klassifizieren dieselben eingecheckten Matrizen durch Teilraumschnitt, dim null([F; E_T]) und dim null([F; E_S]), und den SVD-Nullraum-Projektor, was sich von den Jacobi-Eigenvektoren und Gram-Rang-Formeln von Kshana unterscheidet; vorab registriert (d429993c): ganze Zahlen exakt, p_st_norm auf { "1e-9" } (P2, eine unabhängige numerische Bibliothek), mit vorab festgelegter Rangschwelle und einer zugesicherten spektralen Lücke von mindestens { "1e6" }. Die Behauptung der Zeile ist die Klassifikation einer angegebenen Matrix, daher deckt P2 sie vollständig ab. Die konstruierten Fälle umfassen direkte Summen, gekoppelte und gemischte Nullräume sowie zufällige Basiswechsel; die Dimensionen der realen Netze aus der Zeile zur gekoppelten Eichung werden hier nicht neu gezählt. Der crate-interne Invarianztest (eine gedrehte Nullbasis liefert identische Ergebnisse) bleibt erhalten

# text
seg-2c074d6260ba = Repräsentatives Menü aus Multitechnik-Messungen und die additive Kombinationsregel der Fisher-Matrix

# text
seg-beefac5c1b13 = MeasurementBlock hält eine mögliche Messkampagne als 7x7-Beitrag zur Fisher-Informationsmatrix plus skalare relative Kosten; block_from_rows baut einen aus rohen Datum-Jacobi-Zeilen auf, sodass jeder Block über lunar_identifiability::assemble_multi_info identisch vorkonditioniert wird; combine summiert die Information einer gewählten Teilmenge, was die richtige Regel ist, weil Fisher-Information über unabhängige Messungen additiv ist; representative_lunar_menu liefert ein deterministisches Menü aus vier Blöcken (LLR, eine transversale VLBI-Randbake, ein erdzugewandter Orbiter und ein erdabgewandter Orbiter). Der budgetbeschränkte Entwurfsoptimierer, der dieses Menü verbraucht, ist nicht Teil dieser Crate.

# text
seg-d83a9942ee72 = Die Additivität der Fisher-Information über unabhängige Messungen ist eine Eigenschaft in geschlossener Form, hier geprüft gegen eine unabhängig geschriebene elementweise Summe und gegen die daraus folgende Reihenfolgeinvarianz und Monotonie. HINWEIS ZUR EVIDENZ: Der Kombinierer hatte zuvor überhaupt keinen Test, und der eine Test im Modul summierte die beiden Informationsmatrizen inline, statt ihn aufzurufen, sodass ein defekter Kombinierer das Modul grün gelassen hätte; der Test läuft jetzt über combine und schlägt fehl, wenn dieses mutiert wird. Alle Bakenorte, die Orbitergeometrie, die Präzisionen je Technik und die relativen Kosten sind repräsentative Wahlen statt Missionswerte (siehe tests/fixtures/llr_geometry/NOTICE.md), sodass jede Degenerationsmetrik und jeder CRLB-Wert, der über dieses Menü erreicht wird, den modellierten Status von lunar_identifiability::decompose erbt.

# text
seg-341eedfc47da = Anbieterübergreifende Konsistenz von Bezugssystem und Dynamik des Mondes (reale Inter-Ephemeriden)

# text
seg-f8d94c0771cc = Zerlegung nur der Rotation (6 Parameter, Translation+Rotation) der Abweichung des geozentrischen Mondes zwischen DE440/INPOP21a/EPM2021 in eine reduzierbare gemeinsame ICRF-Systemanbindung und einen nicht reduzierbaren Überschuss der Orientierung der Mondbahn (die vollständige 7-Parameter-Helmert-Anpassung ist eine eigene öffentliche Funktion, die von dieser externen Prüfung NICHT abgedeckt wird: ihre Evidenz ist ein interner Unit-Test der analytischen Rückgewinnung plus tests/lunar_helmert_fit_cross_check.rs, der sie mit der validierten exakten Gauss-Newton-Anpassung in lunar_frame_realise abgleicht und die Konvention des entgegengesetzten Rotationsvorzeichens zwischen beiden festlegt)

# text
seg-2d3347bcb15e = Anbieterübergreifende Konsistenztoleranz für einen Nutzer mit gemischten Anbietern

# text
seg-9decf2cb6b0c = consistency_tolerance: invertiert ein Positionsbudget des Nutzers zu einer Anforderung an die Helmert-Übereinstimmung zwischen Anbietern je Parameter (Ursprung/Maßstab/Rotation) bei einem Referenz-Hebelarm, optional aufgebläht durch die CRLB der Realisierung eines einzelnen Anbieters nach P1

# text
seg-b8dc68eb4bda = Dreiecksgrenze im ungünstigsten Fall für die Wirkung der Helmert-Punkt-Jacobi-Matrix (geschlossene Form)

# text
seg-5450d921dfc9 = Fehlerbudget für die Interoperabilität mehrerer Mondanbieter und Entwurfsgesetz Bezugssystem gegen Ephemeride

# text
seg-e1e30f5c17a6 = interop_budget: Aufteilung in reduzierbar (gemeinsame Systemanbindung) und nicht reduzierbar (Dynamik) unter den Konventionen PerProvider / CommonFrameTie / CommonEphemeris, mit der Metrik des Entwurfsgesetzes für den nicht reduzierbaren Anteil (~{ "0.69" } bei realen DE440/INPOP/EPM: Ein gemeinsames Systemkennzeichen allein lässt den dominanten Boden bestehen)

# text
seg-46304ae1efa4 = RMS-Aggregation der validierten Aufteilungen je Paar unter jeder Konvention (geschlossene Form)

# text
seg-a01f394a36d3 = Lineare-Algebra-Pipeline zur Fehlerbeobachtbarkeit in einem autonomen freien Netz (Paritätsprojektor, Erkennbarkeit, Nichtzentralität der MDB, byzantinischer Block-Spark)

# text
seg-b3389bb90e8d = Auf dem realen DE440-Mondnetz je Knoten (jede Zeile eine differenzielle einfache Entfernung zwischen Knoten, aufgebaut über pernode_range_row mit einer realen DE440-Sichtlinie im Mond-PA-System) berechnet die Engine den gewichteten Paritätsprojektor P⊥ = I − G(GᵀWG)⁺GᵀW (die rangdefiziente Pseudoinversenform, die die 8-dimensionale Eichung aus Datum⊕Zeitskala übersteht), das T1-Erkennbarkeitsresiduum ‖P⊥·b‖ (Fehler im Bildbereich werden ausgelöscht, generische Fehler sind erkennbar), die quadratische Form der Baarda-MDB-Nichtzentralität cᵀWP⊥c (die richtige gewichtete Form mit einfachem P⊥, NICHT die Form mit doppeltem P⊥ cᵀP⊥WP⊥c) mit MDB = √(λ₀/cᵀWP⊥c) sowie die Zählungen von Erkennung und Identifikation des byzantinischen Block-Sparks der gestapelten effektiven Peer-Signaturen P⊥·B_T (Spaltenrang, nicht bloß ungleich null)

# text
seg-8cb248423fd0 = Unabhängige lineare-Algebra-Reproduktion mit numpy/scipy auf realen DE440-Sichtlinienzeilen im Mond-PA-System (P⊥ aus der SVD des gewichteten Entwurfs W^{ "{" }1/2{ "}" }G; die MDB-Nichtzentralität aus der klassischen quadrierten Norm des Paritätsteilraums nach Baarda ({ "1968" }); der Blockrang aus der Zählung der Singulärwerte einer numpy-SVD) — ein wirklich anderer numerischer Weg als die zyklische Jacobi-Eigenzerlegung von GᵀWG in der Crate. Geltungsbereich (gemäß tests/fixtures/faultobs/NOTICE.md): Dies validiert die LINEARE-ALGEBRA-PIPELINE nur auf diesen Zeilen. Die Knotengeometrie ist modelliert. Es ist KEINE operative Integritätsgarantie, keine Zertifizierung eines Schutzniveaus und keine Aussage zur RAIM/ARAIM-Verfügbarkeit, und KEINE Missionsgarantie zur byzantinischen Fehlertoleranz — die ANZAHL tolerierter Fehler für dieses Netz ist modelliert, während die detect>f / identify>2f-Block-Spark-GRENZE Cited ist (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blockweiser Spark von Donoho–Elad { "2003" }) und im Code als bewiesene Instanziierung vorliegt

# text
seg-ebb827739614 = Byzantinische Block-Spark-Grenze für Erkennung/Identifikation im autonomen Mondnetz je Knoten (T3)

# text
seg-4fb935e6193d = byzantine_bound instanziiert die Kodierungs-/Sparse-Beobachtbarkeitsgrenze der sicheren Zustandsschätzung auf der Geometrie des Netzes je Knoten: Ein byzantinischer Peer speist eine beliebige Linearkombination der Messungen ein, an denen er beteiligt ist, und das Netz ERKENNT jede Koalition von ≤ f = block_spark − { "1" } Peers und IDENTIFIZIERT eindeutig jede Koalition von ≤ ⌊(block_spark − { "1" })/2⌋, wobei block_spark die kleinste Peer-Koalition ist, deren gestapelte effektive Signaturen P⊥·B_T spaltenrangdefizient sind. Die Erkennbarkeit eines Peers ist der VOLLE SPALTENRANG von P⊥·B_j (ein von null verschiedener, aber rangdefizienter Block ist ein von null verschiedener Angriff, der in range(G) landet und kein Residuum hinterlässt), nicht bloß P⊥·B_j ≠ { "0" }

# text
seg-3b8b54db475d = Geometrische Instanziierung der Grenze des blockweisen Spark / der sicheren Zustandsschätzung (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blockweiser Spark von Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — NICHT die Konsensschwelle 3f+{ "1" } von Lamport–Shostak–Pease ('Byzantinisch' bezeichnet nur das MODELL beliebiger/kolludierender Fehler). Die konkrete Anzahl tolerierter Fehler ist eine modellierte Eigenschaft der repräsentativen Netzgeometrie, auf Selbstkonsistenz geprüft durch von Hand konstruierte analytische Fälle und die Zählformeln

# text
seg-4f57f586cf82 = Boden der zeitlichen Eichung im autonomen Holdover für die selbstreferenzielle Mondkonstellation (T4)

# text
seg-eb690e8f5c9b = holdover_floor stellt fest, dass in einem Ensemble autonomer Knoten, die nur durch Messungen zwischen den Knoten verbunden sind, die gemeinsame Uhrrate (δα_j += { "1" } ∀j) ein freier Parameter der Ensemblezeit ist, der in N(GᵀWG) liegt: Keine noch so große Zahl zusätzlicher Entfernungsmessungen zwischen den Knoten kann sie beobachten (rate_in_gauge = true, temporal_gauge_dim = { "2" } mit dem gemeinsamen Versatz). Das ist der echte Holdover-Boden — das zeitliche Gegenstück zur Lageeichung des starren Bezugssystems. Das Hinzufügen einer externen absoluten Ratenanbindung (einer direkten Verbindung zu einer Referenz außerhalb des Netzes) treibt die gemeinsame Rate aus dem Nullraum (rate_in_gauge = false, temporal_gauge_dim = { "1" }) und beweist, dass der Boden eine echte Eichung ist und kein Artefakt des Oszillatormodells

# text
seg-097f126797bb = Argument des freien Parameters der Ensemblezeit (Percival { "1978" }; Lewandowski & Thomas { "1991" }), instanziiert auf dem repräsentativen realen DE440-Netz je Knoten: ein Nulltest des relativen Residuums des analytischen Generators der gemeinsamen Rate gegen GᵀWG, wobei der Kontrast mit aufgelöster Entartung die echte Eichung von einem Artefakt des Oszillatormodells unterscheidet. Repräsentative modellierte Geometrie, kein zertifiziertes Zeitgebungsbudget

# text
seg-25ffd6e1979c = Gemeinsame/differenzielle Aufteilung der Anbieter, Vereinheitlichung der Rangdefizienz um eins und Steigung der Schutzlücke (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Drei Facetten der einen Zerlegung ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) mit der 8-dimensionalen Eichung aus Datum⊕Zeitskala als N(G) und den state_dim − { "8" } = { "32" } beobachtbaren Richtungen als range(G): (T5) provider_mismatch_split stuft einen gemeinsamen Bias mehrerer Anbieter (∈ range(G)) als NICHT ERKENNBAR ein — er braucht eine externe Anbindung — und einen differenziellen Bias (∉ range(G)) als selbstüberwacht / ERKENNBAR; (§{ "0" }) die Vereinheitlichung besteht darin, dass DERSELBE blinde Teilraum range(G) die nicht erkennbare Fehlerklasse bestimmt, sodass die Datumseichung N(G) und der fehlerblinde Teilraum range(G) eine Geometrie sind, nicht zwei; (g7) slope liefert die Brown-Schutzlückensteigung ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ für einen Fehler b ∈ range(G) (Schätzer bei Parität null verfälscht) und endlich für einen erkennbaren Fehler

# text
seg-e0fd3860fce9 = Algebra des Paritätsprojektors / der Pseudoinversen in geschlossener Form auf dem repräsentativen realen DE440-Netz je Knoten: Die gemeinsame/differenzielle Aufteilung, die Vereinheitlichung N(G) ⊕ range(G) und die Schutzlückensteigung nach Brown ({ "1992" }) folgen alle aus der Auslöschung des Bildbereichs P⊥·G = { "0" }. Repräsentative modellierte Geometrie, kein zertifiziertes Schutzniveau

# text
seg-101b0551d987 = MTIE und TDEV für die Telekom-Zeitgebung auf einer Zeitfehlerreihe im Holdover

# text
# c1: telecom-timing
seg-b4762fd3cb9d = Der maximale Zeitintervallfehler und die Zeitabweichung, die das Szenario <c1/> auf einer Holdover-Aufzeichnung in Telekom-Größenordnung berichtet: eine MTIE mit gleitendem Fenster über eine monotone Warteschlange mit O(n) (telecom_timing::mtie_sliding, nötig, damit ein Tag mit Ein-Sekunden-Proben schnell bleibt) und die TDEV der Engine (allan::time_deviation), ausgewertet auf dem Raster, das die Art berichtet, und aus einem vollständigen Lauf zurückgelesen, der die Reihe einliest

# text
seg-59cb2711355c = allantools { "2024.06" } — eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters — mtie() und tdev() auf tests/fixtures/telecom_timing/holdover_te_series.csv, wobei die Reihe auf beiden Seiten aus demselben Text mit 17 signifikanten Stellen eingelesen wird; die Referenz hält die SHA-256 der Reihe fest und ist offline über tests/fixtures/telecom_timing/generate_telecom_timing_reference.py neu erzeugbar. Validiert die SCHÄTZER auf dieser Aufzeichnung, nicht das synthetische Holdover, das sie erzeugt hat

# text
seg-632add2dbd3c = ITU-T-Masken zur Telekom-Synchronisation mit PASS/FAIL und Marge

# text
# c1: telecom-timing
seg-47687529aee7 = Übertragene Grenzwerte von ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC gelockt und ePRTC-A Holdover (einschließlich der Zeitfehlerhüllkurve aus Tabelle { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC Klassen A-D und G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Referenzpunkt C, jeweils offenes oder geschlossenes Intervall, wie die Tabelle es angibt, wobei jeder Eintrag 'for further study' weggelassen ist; je Prüfung ein Urteil und eine Marge am bindenden Punkt sowie die Zeit bis zur Überschreitung jedes Budgets. Ausführbar als Szenarioart <c1/>

# text
seg-46b139a58bb0 = Übertragung der genannten Empfehlungen (frei von itu.int herunterladbar), jeder Grenzwert mit Tabelle oder Abschnitt, aufgelistet mit jedem unbestätigten oder nicht implementierten Punkt in docs/TELECOM-TIMING.md; die Identitäten der Stetigkeit an den Knickpunkten, die die Tabellen implizieren, werden in den Tests geprüft. Eine Übertragung von Normen mit internen Konsistenzprüfungen, kein Konformitätstest und keine externe Validierung. { "0.30" } Runde { "2" } (vorab registriert 970003ee), blockiert (bleibt MODELLED): Die zehn Maskenwerte und dreizehn ePRTC-A-Holdover-Werte, die die Empfehlungen als durchgerechnete Zahlen abdrucken (G.8272 Abb. 1-2, G.8272.1 Amd.1 Abschn. { "8.2.1" } und Abb. V.1-V.3, G.8271.1 Amd.3 Abb. 7-2 bis 7-4), werden innerhalb einer halben gedruckten Einheit reproduziert, die meisten davon Tabellenkonstanten oder Knickpunkte; G.8271.1 Abb. 7-2 beschriftet { "200" } ns bei { "1.3" } s, gegenüber der eigenen Tabelle 7-1 ({ "197.5" } ns). Die Grenzwerte der Klassen A-D von G.8273.2 haben keinen gedruckten durchgerechneten Wert, und die Beschriftungen der Knickpunkte für ePRTC gelockt aus G.8272.1 (auf durchgezogenen Konstruktionslinien) wurden durch die vorab registrierte Auswahlregel ausgeschlossen, sodass diese Übertragungen bleiben

# text
seg-165ed2bc771a = ITU-T-Masken zur Wander-Erzeugung bei der Frequenzsynchronisation (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Sieben Wander-Erzeugungsmasken für MTIE und TDEV bei konstanter Temperatur für die Art <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) Typen I, II und III, G.8262 (10/2024) EEC Optionen { "1" } und { "2" } und G.8262.1 (11/2025) eEEC (gelockter Modus), einschließlich der Potenzgesetz-Abschnitte, die die Tabellen schreiben (<c2/> und dergleichen), jeweils offenes oder geschlossenes Intervall wie gedruckt, gemessen durch das { "10" }-Hz-Filter, das die Abschnitte angeben (als vor dem Abtasten angewandt genommen); das Referenzszenario scenarios/telecom-synce-eec.toml stellt einen freilaufenden OCXO gegen die drei EEC-Masken. Nicht implementiert: die Zugaben bei veränderlicher Temperatur, Holdover, Transienten, Jitter und die Frequenzgenauigkeit nach G.811

# text
seg-ca16d9c98dc5 = Übertragung der genannten Empfehlungen (am 2026-10-13 von itu.int heruntergeladen), jede Zeile gegen den Text neu gelesen, wobei die Stetigkeit an den Knickpunkten, die die gedruckten Koeffizienten implizieren, in den Tests begrenzt wird (zum Beispiel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns gegenüber dem Plateau von { "100" } ns in G.812 Tabelle { "4" }). Eine Übertragung von Normen mit internen Konsistenzprüfungen, kein Konformitätstest und keine externe Validierung. G.812 (06/2004) ist als durch eine vorab veröffentlichte Ausgabe 08/2026 ersetzt aufgeführt, und G.811 hat ein Amd. { "1" } (04/2016); keines von beiden konnte gelesen werden, daher ist keines geprüft. Das Szenario mit freilaufendem OCXO überschätzt den Beitrag des Oszillators bei Beobachtungsintervallen, die lang gegenüber der Zeitkonstante einer Regelschleife sind; es sagt nichts über irgendeine Geräteuhr aus

# text
seg-5fc2ad88faf0 = Uhrprotokoll-Formate (RINEX-Uhr, TimeLab ASCII, TAPR TICC), eingelesen zu einer normalisierten Phasenreihe

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: eine Parser-Schicht, die eine RINEX-Uhrdatei (AS/AR-Datensätze einer benannten Uhr, Versionen { "2" } und { "3.00" } bis { "3.04" }), ein Phasen- oder Frequenzprotokoll im ASCII-Format von TimeLab oder ein Zeitstempel- oder Intervallprotokoll von TAPR TICC in ein einheitliches Phasenraster überführt, mit angegebenem, aus einem Header entnommenem oder als Median der Abstände bestimmtem tau0, wobei jede Lücke, jeder Wert neben dem Raster und jedes Duplikat gezählt wird, und mit einer Lückenregel aus Ablehnen, längster Lauf oder linear; als Option in die Reihe der Telekom-Zeitgebung (<c1/>, mit einem zusätzlichen Block <c2/>) und die Uhrart (<c3/>, mit einem zusätzlichen Block <c4/> mit ADEV, TDEV und MTIE, der SHA-256 der Tabelle und der SHA-256 der Phase; runs = { "1" }) eingebunden. Ohne die Tabelle sind beide Arten byteidentisch

# text
seg-1d3df655c14c = Vorab registriert in tests/fixtures/clock_log/PREREGISTRATION.md (allein eingecheckt, 159334f2, bevor die Fixture existierte); festgehalten in RESULTS.md. Drei mit Seed erzeugte synthetische Protokolle, eines je Format (bei TICC eine Lücke von drei Epochen, bei RINEX eine zweite Uhr, die zu ignorieren ist), zurückgelesen von einem unabhängigen Leser, den derselbe Autor nach docs/CLOCK-LOG-FORMATS.md geschrieben hat: Raster-, Lücken- und Auffüllzahlen gleich, und die größte Phasendifferenz { "0" } s (Zielwert { "1e-13" } s). allantools { "2024.6" } oadev, tdev und mtie auf dieser Phase stimmen bei jedem Mittelungsfaktor, den es auswertet, auf relativ { "2.5e-14" } überein (Zielwert { "1e-10" }); es wertet die MTIE nicht über die gesamte Aufzeichnung aus, die die Engine berichtet, sodass dieser eine Punkt je Protokoll keinen Referenzwert hat und der Zielwert in der formulierten Fassung dort nicht erreicht ist. MODELLED: synthetische Protokolle, und das Leser-Orakel teilt sich den Autor; echte TimeLab-, TICC- und RINEX-Uhrdateien von Instrumenten wurden nicht verglichen

# text
seg-acdb0337bce7 = Uhrprotokoll-Formate linuxptp (ptp4l, phc2sys, ts2phc) und chrony (tracking, statistics), eingelesen zu einer normalisierten Phasenreihe

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input mit den Formaten ptp4l, phc2sys, ts2phc, chrony-tracking und chrony-statistics: Der protokollierte Versatz einer linuxptp-Servozeile (ns, der eigene eingeklammerte Zeitstempel der Zeile, Messwerte vor der ersten Meldung s2 des Servos ausgelassen und gezählt) oder eines chrony-Protokolls tracking oder statistics (s, nach Spaltenposition, UTC-Datum und -Uhrzeit) wird über dieselben Lückenregeln wie bei den anderen Formaten zu einem einheitlichen Phasenraster; ein Quellenwähler (<c1/>) benennt eine von mehreren Schnittstellen, Uhren oder Adressen; die Protokolle speisen die Reihe der Telekom-Zeitgebung, die Uhrart und die Art des Holdover-Tests

# text
seg-fb9393044576 = Für Kshana geschriebene Fixtures nach den öffentlichen Zeilenlayouts der Daemons mit erfundenen Werten (NOTICE.md im Fixture-Ordner); es wurde kein Protokoll einer realen Installation gelesen, und kein Orakel vergleicht das Parsen mit einem anderen Leser, sodass ein Layout, das sich zwischen Daemon-Versionen unterscheidet, immer noch abgelehnt oder falsch gelesen werden kann. Die von der Phasenreihe gespeisten Schätzer sind die, die in den obigen Zeilen gegen allantools validiert sind

# text
seg-97aebb84576e = Holdover-Test, bewertet aus einer vom Betreiber gelieferten Zeitfehleraufzeichnung

# text
# c1: holdover-test
seg-ab533cf99c56 = Die Art <c1/>: Eine Zeitfehleraufzeichnung (ein Uhrprotokoll von linuxptp, chrony, TICC, TimeLab oder RINEX, oder Paare time_s,time_error_ns) wird an den beiden Zeitpunkten, die der Betreiber für die Entfernung und die Wiederherstellung von GNSS angibt, in einen Basislinien-, einen Holdover- und einen Erholungsschritt zerlegt; die Basislinie wird an den ITU-T-Masken für eine gelockte Uhr gemessen, das Holdover an denen für Holdover oder eine autonome Uhr, an der ePRTC-A-Holdover-Hüllkurve und an den Zeitfehlerbudgets; das Holdover berichtet den Frequenzversatz nach kleinsten Quadraten, den das System gehalten hat, und die Erholung, ob und wann |TE| in ein angegebenes Band kam und für eine angegebene Verweildauer darin blieb, mit dem Spitzenwert und dem größten Sprung. Jeder Grenzwert ist der, den die Art telecom-timing überträgt; die beiden Zeitpunkte sind die Angabe des Betreibers und werden nicht verifiziert

# text
seg-a54380cf95ea = Handrechnung auf Aufzeichnungen, die aus Formeln aufgebaut sind, deren Steigung, Sprung, Extremum und Erholungszeit vor dem Lauf bekannt sind (die Tests geben sie an), und die Masken, die Hüllkurve und die Budgets der obigen Zeilen zur Telekom-Zeitgebung. Es wurde keine Labormessung eines realen Holdovers bewertet und kein externes Orakel verglichen, sodass die Art keine Aussage über irgendeine Uhr oder ein System macht; ein Zeitgebungslabor als Partner ist nötig, bevor irgendeine Zahl je Uhrklasse hochgestuft werden könnte

# text
seg-94cbac97a1aa = Verfügbarkeit von GNSS-Signalen im Space Service Volume und darüber hinaus, verglichen mit dem ICG-SSV-Heft

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Die Verfügbarkeitsdurchläufe der Art <c1/>: je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und kombiniert, der Anteil der Paare (Nutzer, Epoche) mit mindestens einem und mit mindestens vier Signalen und der längste Ausfall, für einen Nutzer auf einer Kugel (die globale Schale des Hefts mit 2,562 Punkten, { "14" } Tage bei { "1" } Minute) oder auf einer Trajektorie (GEO, HEO, Mondtransfer), aus den Kepler-Bahnen von Anhang C des Hefts, einer konstanten minimalen Strahlungsleistung innerhalb des Referenzwinkels außerhalb der Boresight, einer Abschattung durch die Erde als Kugel plus { "50" } km und einer C/N0-Schwelle; Nutzerantennen aus Tabelle B10 des Hefts

# text
seg-d71c9d361342 = Das Heft zum ICG Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), selbst eine Simulation, verglichen unter einer Vorregistrierung, die vor dem Lauf eingecheckt wurde (xval/gnss-ssv/PREREGISTRATION.md; Ergebnisse in xval/gnss-ssv/RESULTS.md, festgehalten durch tests/ssv_booklet_results.rs, Verfehlungen eingeschlossen). Lauf { "1" } mit der vorab registrierten Lesart: Die Konstanten der minimalen Strahlungsleistung und der Mondzielwert stimmen überein (S0, S6 erreicht); die Zielwerte für oberes und unteres SSV, RF-Schwelle, GEO und HEO sind NOT MET, fast alle durch GLONASS, für das das Heft { "20" } und { "28" } Grad in den Tabellen B2 und B6 und { "26" } und { "34" } Grad in Tabelle { "4.2" } angibt. Eine Diagnosevariante mit den Winkeln aus Tabelle { "4.2" } stimmt in jeder Zelle des oberen SSV, des unteren SSV und der sechs GEO-Missionen überein (sie ersetzt Lauf { "1" } nicht; Zellen für RF, HEO und Mond verfehlen weiterhin). Die gemessenen Antennendiagramme der GPS-L1-Panels werden vom parametrischen Ersatz nicht reproduziert (RMS { "6" } bis { "9" } dB gegenüber einem Zielwert von { "3" } dB). Die Übereinstimmung zeigt, dass die angegebene Methode des Hefts reproduziert wird, nicht dass sich GNSS-Signale so verhalten

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Effekte von Ionosphäre, Plasmasphäre und Atmosphäre auf streifende GNSS-Signale entlang von Randstrahlen sowie der Entwurf des Empfängers für schwache Signale in der Art <c1/>

# text
seg-1a1786ba90b6 = Eine Chapman-Ionosphäre, eine Plasmasphäre vom Gallagher-Typ und eine neutrale Atmosphäre (Brechungsbiegung, Sauerstoffabsorption, Defokussierung), integriert entlang des geraden Strahls zwischen Sender und Nutzer: schräger Gesamtelektronengehalt, sein plasmasphärischer Anteil, Zusatzverzögerung, Tangentenhöhe und der Verlust auf streifenden Strecken; und ein Empfängerentwurf für schwache Signale (kohärente und nichtkohärente Integration, Datenbitgrenze, Stützung, Dopplersuche), der die C/N0-Schwelle aus den Modellen von Erfassung und Tracking-Schleife festlegt

# text
seg-4ca1217472ab = Geschlossene Formen und veröffentlichte Größenordnungen in den Tests (der Scheitel einer Chapman-Schicht und die Biegung am Oberflächenrand, einige TECU Plasmasphäre auf einem Strahl von GPS zu GEO); der Empfängerentwurf verwendet die Modelle von Erfassung und Tracking-Schleife und deren Tests wieder. Es werden keine gemessenen Daten von Randsondierung oder Empfang schwacher Signale damit verglichen

# text
seg-6b8f9f3ca2a3 = GNSS-Navigationsfilter an Bord für Raumfahrzeuge in hohen Umlaufbahnen und im Mondtransfer

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = Der Modus <c2/> der Art <c1/>: ein Extended-Kalman-Filter mit neun Zuständen (Position, Geschwindigkeit, Empfängeruhr-Bias und -Drift, ein Maßstab des Strahlungsdrucks der Sonne) auf Pseudoentfernungen, deren Verfügbarkeit, Rauschen und C/N0 aus derselben Streckengeometrie wie die Durchläufe stammen; die Wahrheit wird mit J2, Dritt-Körper-Wirkung von Sonne und Mond und Strahlungsdruck mit Schatten integriert, das Filter modelliert J2 und die dritten Körper und schätzt den Strahlungsdruck; berichtet Positions- und Geschwindigkeitsfehler innerhalb und oberhalb der GNSS-Bahnen, die längste Messlücke und das mittlere NEES

# text
seg-469602656ab4 = Simulierte Wahrheit gegen die eigene Schätzung des Filters (der mittlere normalisierte quadrierte Schätzfehler eines konsistenten Filters beträgt für die Position etwa { "3" }) und Determinismus bei festem Seed. Es werden keine Flugdaten oder aufgezeichneten GNSS-Daten aus hohen Umlaufbahnen verglichen; Sonne und Mond sind kreisförmige Ersatzmodelle geringer Genauigkeit

# text
seg-5fc242476828 = Relative Navigation eines Formationsverbunds mehrerer Raumfahrzeuge in einer stark elliptischen Umlaufbahn aus GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = Der Modus <c2/> der Art <c1/>: Ein Chief und Deputies führen je das absolute Filter aus; die Position des Deputy relativ zum Chief wird durch Subtraktion der absoluten Schätzungen und durch ein relatives Filter auf einfach differenzierten Pseudoentfernungen der Signale geschätzt, die beide Fahrzeuge verfolgen, wobei die relative Dynamik die Differenz zweier nichtlinearer Trajektorien ist

# text
seg-69c078b57fc8 = Dieselbe simulierte Wahrheit wie beim absoluten Filter: der Fehler des relativen Filters gegen den wahren relativen Zustand und die Prüfung, dass es mindestens so gut abschneidet wie die Subtraktion zweier unabhängiger absoluter Lösungen. Es werden keine Flugdaten einer Formation verglichen

# text
seg-7038f6902820 = Fehlerterme des Kaltatom-Interferometers: Phasenrauschen des Raman-Lasers, Bias durch Wellenfrontkrümmung und Auflösung der Streifenmehrdeutigkeit

# text
seg-4d9690207607 = inertial::cai_error_terms (Bibliotheksfunktionen, noch nicht aus einer Szenarioart erreichbar): die Gewichtsfunktion der Raman-Phase eines Drei-Puls-Interferometers mit Rechteckpulsen (Cheinet et al. { "2008" }, Gl. { "8" }) mit der geschlossenen Form für weißes Phasenrauschen (pi/2)^{ "2" } S_phi0/tau_R und einem numerischen Weg für jedes Spektrum; das Laser-Frequenzrauschen, das die Verzögerung der Retroreflexion nicht aufhebt (Le Gouet et al. { "2007" }, Gl. { "9" } bis { "11" }); der reine Defokus-Wellenfront-Bias sigma_v^2/R einer thermischen Wolke und seine Verringerung durch einen Detektionsradius; die Wahrscheinlichkeit eines falschen Streifenindex erfc(pi/(sqrt({ "2" }) s)) für eine Stützung durch einen klassischen Beschleunigungsmesser und für zwei Abfragezeiten, und ihre Inverse

# text
seg-a7b220763674 = Jede geschlossene Form gegen einen unabhängigen numerischen Weg in den Tests (Frequenzbereichs-Quadratur der exakten Übertragungsfunktion und des Verzögerungsfilters, eine Monte-Carlo-Rechnung über Atome für den Wellenfront-Bias, eine Monte-Carlo-Rechnung über Schüsse für den Streifenindex) und ihre Grenzfälle. Ein veröffentlichter durchgerechneter Wert: Cheinet et al. { "2008" } (arXiv:physics/0510197, Abschn. IV) geben an, dass bei tau_R = { "20" } us ein weißes Raman-Phasenrauschen unter -111 dB rad^2/Hz für { "1" } mrad je Schuss nötig ist; der weiße Term allein ergibt { "0.99" } mrad (die Veröffentlichung leitet den Pegel mit ihrer Gl. { "17" } her, Flicker plus weiß). Interne Konsistenz und ein durchgerechneter Wert, keine externe Validierung; Aberrationen höherer Ordnung und das Rauschen eines bestimmten Lasers sind nicht modelliert

# text
seg-c380ec16a4f8 = Exakte äquivalente Freiheitsgrade nach Greenhall und Riley für die Allan-Varianz, die modifizierte Allan-Varianz und die Hadamard-Varianz

# text
seg-dee2a54c5019 = allan::edf_greenhall (mit den Wrappern edf_greenhall_adev, _mdev und _hdev): der vollständige Algorithmus von Greenhall und Riley, Proc. 35th PTTI ({ "2003" }), Abschnitt { "3" } (Gln. { "7" } bis { "13" } und die Koeffizienten für großes J aus den Tabellen { "1" } bis { "3" }), für Differenzordnungen { "1" } bis { "3" }, Rauschexponenten +{ "2" } bis -4, wo immer alpha + 2d > { "1" } gilt, überlappend und nicht überlappend, modifizierte und unmodifizierte Schätzer; NaN, wo er nicht anwendbar ist, einschließlich des unmodifizierten Falls weißes PM mit ceil(M/S) <= d, dessen geschlossene Form nicht implementiert ist. assurance::uncertainty::edf teilt sich jetzt den Code und behält seine Ausgaben bitgenau bei

# text
seg-695ec24f9676 = allantools { "2024.6" } ci.edf_greenhall, eine Drittanbieter-Implementierung des veröffentlichten Algorithmus, ausgeführt von scripts/gen_greenhall_edf_ref.py über das Raster, das in xval/greenhall-edf/PREREGISTRATION.md vorab registriert wurde (allein eingecheckt, 0db0bb7a, vor jedem Vergleich): An allen { "4 876" } Punkten, an denen es ein endliches edf liefert, stimmt kshana innerhalb von relativ { "6.0e-13" } überein (Zielwert { "1e-9" }); an seinen { "46" } Punkten mit NotImplementedError liefert kshana NaN; jedes Fallkennzeichen kommt vor; die Wrapper sind dem Kern bitgenau gleich; uncertainty::edf ist über { "274 280" } Werte bitidentisch (vor dem Refactoring als SHA-256 festgehalten). An { "32" } Punkten (alpha -4, d { "3" }, unmodifiziert, Fall { "2.2" }) scheitert allantools in seiner Nachschlagetabelle { "2" }, sodass sie keinen Referenzwert haben und nicht gezählt werden. Stable32 wurde nicht ausgeführt. { "0.36" } Revision (docs/revisions/STUDIO15-greenhall-edf-portable.md): Bei portabler Mathematik bezieht der Kern seinen Logarithmus aus einer einmal gerundeten Double-Double-Auswertung (allan::greenhall_ln), und der unveränderte Zielwert { "1" } hält wieder an allen { "4 876" } Punkten, schlechtester relativer Wert { "6.0e-13" }; die Schutzprüfung von uncertainty::edf ist auf den portablen Abzug { "0.36" } umgestellt ({ "3 746" } der { "274 280" } Werte haben sich verschoben, höchstens relativ { "1.6e-12" }, gegenüber der Basis mit Host-Mathematik)

# text
seg-363705e03bac = Holdover-Voreinstellungen für Oszillatoren aus öffentlichen Datenblättern

# text
seg-9750d9e0ec7a = Vier Voreinstellungen — OCXO (Microchip OX-208), Rubidium (Microchip 8040C), Cäsium (Microchip 5071A Hochleistungsröhre) und CSAC (Microchip SA.45s) — jede mit den Maxima der Allan-Abweichung, der Alterung und der Temperaturgrenze ihres Datenblatts; eine Anpassung des Frequenzrauschens aus weiß + Flicker + Random Walk nach nichtnegativen kleinsten Quadraten, skaliert so, dass sie jeden Datenblattpunkt umhüllt, ein Flicker-Boden nie unter dem Wert für das längste τ, lineare Alterung und ein sinusförmiger Temperaturterm, synthetisiert als Holdover mit Seed nach einem GNSS-Verlust

# text
seg-95aaa171864b = Die vier benannten Microchip-Datenblätter (Dokumentnummern und URLs in jeder Voreinstellung und in docs/TELECOM-TIMING.md) für die Eingangswerte; die geschlossene Alterungsrampe und die Hüllkurveneigenschaft der Anpassung als interne Prüfungen. Wie aus den Werten ein Rauschmodell wird — die Anpassung, die Bodenregel, der 30-Tage-Monat, die lineare Temperaturlesart — ist eine Modellierungsentscheidung; keine Voreinstellung ist eine Messung einer Einheit. { "0.30" } Runde { "2" }, einseitige Zielwerte gegen gemessene Einheiten (vorab registriert a01c491c), ein Befund (bleibt MODELLED): Die IGS-Station THU2 Symmetricom 8040C in den finalen ESA-MGEX-Uhren hat eine Allan-Abweichung von { "0.35" } bis { "0.87" } der Rubidium-Voreinstellung, aber einen Holdover-Fehler von { "1.07" } bis { "1.60" } davon; die Aufzeichnung der 5071A liegt bis { "1000" } s außerhalb der Cäsium-Voreinstellung (weißes Phasenrauschen der Messung, 30x bei { "1" } s) und im Holdover ({ "1.15" } bis { "8.74" }); die schlechteste SA.45s von { "2011" } aus der Produktion liegt bei { "1" } s beim 1.26-Fachen der CSAC-Voreinstellung; die OX-208 hat keine gemessene Aufzeichnung (blockiert)

# text
seg-69f93d5ec864 = Holdover-Vorhersage aus einer gemessenen Uhraufzeichnung, geprüft an zurückgehaltenen Daten

# text
# c1: slot-timing
seg-8bdc5a24c66d = Der Pfad der gemessenen Aufzeichnung der Art <c1/>: die überlappende Allan-Abweichung einer Phasenaufzeichnung, angepasst durch nichtnegative kleinste Quadrate mit edf-Gewichtung in der Basis aus weißer Phase und Frequenzmodulation nach IEEE Std { "1139" } (slot_timing::fit_weighted), dann invertiert für die Auslaufzeit, zu der der Zeitfehler eine Schwelle erreicht (slot_timing::slot_budget). Der Boden des roten Rauschens wird aus der Aufzeichnung gemessen statt angenommen

# text
seg-c888226296fe = Eine reale freilaufende Atomuhr: { "556 990" } Ein-Sekunden-Phasenproben eines Cäsiumnormals 5071A, gemessen gegen einen Wasserstoffmaser (A. Wallin, mit allantools verteilt; festgelegter Commit und SHA-256 in scripts/fetch_cs5071a.sh), dieselbe Aufzeichnung, die tests/cs5071a_reference.rs für die Schätzer verwendet. Die zurückgehaltenen zwei Drittel sind eine externe Messung, die die Vorhersage nie gesehen hat. Datenabhängig: Der Workflow realdata-clock holt die Aufzeichnung und führt den Test mit KSHANA_REQUIRE_REALDATA={ "1" } aus. Validiert den Pfad aus Anpassen und Invertieren an einem von weißem FM dominierten Atomnormal über Auslaufzeiten bis etwa { "50 000" } s; nicht die Quellen aus Datenblatt oder Klasse, nicht die deterministischen Terme. KEIN Quarzoszillator: Bei einer gemessenen OCXO-Aufzeichnung (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h gegen einen Wasserstoffmaser) ist die Vorhersage mit zurückgehaltenen Daten konservativ, bei { "0.59" } bis { "0.70" } der gemessenen Überschreitung, und liegt überwiegend außerhalb des Zielwerts, weil sich der Rauschboden dieses Oszillators während der Aufzeichnung halbiert hat; in der Stichprobe liegt sie bei { "0.98" } bis { "1.17" }. Der Fall des Quarzes bleibt MODELLED. Auch KEINE Atomuhren im Orbit: Bei { "10" } GPS-Block-IIF-Satellitenuhren (tests/slot_timing_igs_holdout.rs, finale IGS-Uhren mit { "30" } s, { "14" } Tage, Protokoll vor dem Download geschrieben) liegen { "8" } innerhalb des Zielwerts, und { "2" } (G25, G30) sind um bis zu etwa 2x optimistisch, sodass der Fall im Orbit unter dem Protokoll MODELLED bleibt

# text
seg-d7e03158b972 = Sekunden, bis eine freilaufende Uhr den Schutzabstand eines zeitindizierten Slots verlässt, und die Fix-Kadenz, die sie darin hält

# text
# c1: slot-timing
seg-0b4d8815f756 = Die Art <c1/>: der vorhergesagte Fehler E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t², invertiert für die Überschreitung, die verbleibende Zeit, das Resynchronisationsintervall abzüglich der Fix-Latenz und Fixes pro Tag, wobei jeder Term einzeln ausgewiesen und der dominante benannt wird; Uhren aus den sechs Standardwerten von ClockClass (TCXO, OCXO und RAFS hinzugefügt, je mit Verweis auf ein Datenblatt), den Voreinstellungen der Telekom-Zeitgebung, einem Inline-Datenblatt oder einer gemessenen Aufzeichnung; eine Überschreitung jenseits der längsten Mittelungszeit der Quelle wird als extrapoliert gekennzeichnet

# text
seg-cc0464060e58 = Geschlossene Formen für jeden Term allein und die unabhängige Nullstellensuche holdover::holdover_seconds; die Datenblattwerte sind die benannten Dokumente (docs/SLOT-TIMING.md). Ein Klassenstandard beruht auf einem angenommenen Boden des roten Rauschens und eine Datenblattquelle ist eine Hüllkurve von Maxima, sodass keines von beiden eine Messung einer Einheit ist

# text
seg-65a8361b4a22 = Auswertung des Jammertests: ein Empfängerprotokoll, bewertet je geplantem Test (Erkennungslatenz, verpasste Alarme, Fehlalarme, Erholungszeit) anhand des veröffentlichten Testplans

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): der NPRA-Testkatalog und Sendeplan (MIT, mit festgeschriebenem SHA-256 abgerufen, nie eingebunden) wird als geplante Wahrheit gelesen, die Katalog-IDs bleiben erhalten; ein receiver-trust-Lauf wird je Test bewertet (erster Alarm minus geplanter Beginn, erkannt/verspätet/verpasst gegen eine Toleranz, Zeit bis zum ersten alarmfreien Abschnitt, Alarme außerhalb jedes Zeitfensters und seines Schutzintervalls), mit einem signierten Nachweispaket, das die Bewertungstabelle enthält. Der Plan besteht aus geplanten Zeitfenstern, nicht aus aufgezeichneten Sendezeiten

# text
seg-49b912adb7a9 = Die Anzahl der Zeitfenster des Plans je Testgebiet ({ "76" }, { "77" } und { "45" } Zeitfenster, von denen { "61" }, { "63" } und { "32" } senden) wurde unabhängig mit einem Skript über dasselbe JSON gezählt; die attack_log-Fenster des Datensatzes von { "2024" } dienen als Ereigniswahrheit, gemäß xval/jammertest-score/PREREGISTRATION.md (allein committet, c2e6d3b, bevor die Auswertung lief). Erster und einziger Lauf (xval/jammertest-score/RESULTS.md): Die registrierte Mindestdatenregel wurde mit FAILED verfehlt ({ "4" } auswertbare Jamming-Fenster aus { "4" } von { "12" } UBX-Ordnern gegenüber einem Minimum von { "10" } Fenstern aus { "2" } Ordnern: { "5" } Ordner wurden durch die Basislinienregel ausgeschlossen, { "3" } UBX-Protokolle enthalten nur die GPS-Wochenzeit), daher sind die Zielwerte B1 bis B4 nicht bewertbar; nichts wurde gelockert oder erneut ausgeführt. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, allein committet, nur Datenbehandlung: Protokolle mit reiner GPS-Zeit werden anhand des Datums eingeordnet, die { "12" } Ordner nur mit CSV, eine Sitzung mit bewegter Plattform für fahrende Rover; gleiche Zielwerte und gleiche Mindestdatenregel): { "14" } von { "24" } Ordnern behalten, aber nur { "7" } auswertbare Jamming-Fenster, die Mindestdatenregel erneut verfehlt, kein Zielwert bewertbar (RESULTS-v2.md). Geplante Wahrheit: Ein geplantes Zeitfenster ist keine Sendeaufzeichnung, ein verpasster Test kann ein Test sein, der nie lief, eine Latenz wird ab dem geplanten Beginn gemessen, und sauber bedeutet außerhalb der geplanten Zeitfenster. Die Erkennung durch Monitore im Messbereich sagt nichts über einen Spoofer mit geringer Leistung aus. Ein Empfängertyp (u-blox ZED-F9P). Der NMEA-Datensatz von SimulaMet aus { "2025" } wird nicht verwendet (keine angegebene Lizenz, abonnementpflichtig)

# text
seg-0d227bbcb5f1 = Prüfstandsexport (kshana bench-export): erdfeste, geodätische und lokale Geschwindigkeitsspalten, Lagespalten und NMEA-{ "0183" }-Ausgabe

# text
seg-c6a6e08afadd = Die erdfeste Position, die geodätische Position, die erdfeste Geschwindigkeit, die Spalten für Kurs/Nick/Roll und UTC der Bewegungs-CSV sowie die NMEA-Sätze GGA/RMC, geschrieben aus synthetischen Szenarien (gnss-ins einschließlich automotive-urban-canyon, jamming, gnss-sim). Nur Bewegung und Ereignisse; es wird kein Signal geschrieben, und es wird keine Leistung eines Simulators oder Empfängers behauptet.

# text
seg-f953ad11fe08 = WAS EXTERN GEPRÜFT WIRD, eng gefasst: gegen pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } und scipy { "1.18.1" }, ausgeführt von scripts/gen_testbench_ref.py an { "4" } synthetischen Szenarien, mit vor dem ersten Vergleich festgelegten Toleranzen (jeweils der ungünstigste Rundungsfall des Schreibers): Die erdfesten Spalten entsprechen in jeder Zeile der WGS-{ "84" }-Umrechnung der geodätischen Spalten (schlechtester Wert { "1.3e-4" } m, Zielwert { "3e-4" }) und umgekehrt ({ "1.3e-9" } Grad, Zielwert { "2e-9" }; Höhe { "1.3e-4" } m, Zielwert { "3e-4" }); die mit der topozentrischen Operation von PROJ nach Nord-Ost-Unten gedrehte erdfeste Geschwindigkeit entspricht der wahren NED-Geschwindigkeit der Engine ({ "7.5e-5" } m/s, Zielwert { "2e-4" }); Kurs, Nick- und Rollwinkel entsprechen dem Gier-Nick-Roll-Winkel, den scipy aus dem wahren Quaternion der Engine berechnet ({ "5.0e-7" } Grad, Zielwert { "1e-6" }); jeder NMEA-Satz wird von pynmea2 mit gültiger Prüfsumme geparst, und seine dekodierte Position ({ "1.2e-3" } m, Zielwert { "5e-3" }), Höhe, Geschwindigkeit, Kurs über Grund ({ "5.0e-4" } Grad, Zielwert { "1e-3" }) und Zeit entsprechen den Bewegungswerten; die UTC-Spalte entspricht einer unabhängigen Datums- und Zeitrechnung. Der SHA-256 der genau geprüften CSV- und NMEA-Bytes ist festgeschrieben. WAS NICHT: die Wahrheitstrajektorie des Szenarios selbst (das Fahrprofil und seine Integration); die Konventionen (der Kurs ist der Gierwinkel des Körpers, nicht der Kurs über Grund, und weicht auf automotive-urban-canyon um bis zu etwa { "77" } Grad davon ab; GGA-Qualität, Satellitenanzahl und HDOP sind Platzhalter); ob ein Laborsimulator die Dateien wie vorgesehen liest; jede Leistung eines Simulators oder Empfängers. Die unabhängigen Referenzen prüfen Umrechnungen und Kodierungen, nicht die Physik des Szenarios. Die Behandlung des lokalen Bezugssystems wird nur über die Geschwindigkeitsdrehung sowie Geschwindigkeit und Kurs über Grund der NMEA-Sätze geprüft (die CSV hat keine lokale Positionsspalte).

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): eine Zuordnung von Kshana-Ausgaben zu Abschnitten öffentlicher Regelwerke allein nach Nummer, befüllt aus den angegebenen Läufen; ein Ergebnis zählt nur dann für eine Fähigkeit, wenn es den Nachweis trägt, den die Zuordnung nennt, eine leere Menge belegt nichts, und die Formulierung lautet „liefert Belege für"; der Bericht ist weder eine Feststellung, dass ein Regelwerk erfüllt ist, noch eine Bewertung oder Zulassung durch irgendjemanden.

# text
seg-8659260fd38e = Referenzen geprüft gegen einen per Skript extrahierten Überschriftenindex der zitierten öffentlichen Dokumente, gelesen am 2026-10-10 (tests/compliance_references.rs). WAS GEPRÜFT WIRD: { "49" } zitierte Verweise auf Abschnitte, Absätze oder Überschriften existieren im zitierten Dokument, und { "7" } zitierte URLs ließen sich am vermerkten Datum auflösen ({ "2" } über einen zweiten Weg); negative Kontrollen schlagen fehl. WAS NICHT: dass eine Paraphrase, Zuordnung oder Lücke korrekt ist; die Abschnitte von EN { "16803" } (kostenpflichtig, nur Katalogtext); spätere Revisionen; der Index ist keine unabhängige Implementierung.

# text
seg-98c360d82d56 = Marine-Integrationen: Signal-K-Plugin, OpenCPN-Gate-Stream und Bewertungsfeld, Referenzaufbau

# text
seg-7af9ce566646 = Der Vertrauenswert, das Band, die Gründe, der Gate-Zustand und die vom Empfänger gemeldete Position, veröffentlicht unter navigation.gnss.kshana in einem Signal-K-Server mit einer Warn-, Alarm- und Normalmeldung (integrations/signalk); der gefilterte NMEA-Stream, bei dem der Fix bei eingebrochenem Vertrauen als ungültig markiert wird und je Zyklus ein PKSHT-Satz folgt, über TCP vom Gate selbst oder von einem kleinen Relay an OpenCPN geliefert, und ein natives OpenCPN-Bewertungsfeld, das den PKSHT-Satz liest (integrations/opencpn); sowie systemd-Units und ein Container, die das Gate betreiben (deploy/reference-build). Wo diese eine Ausgabe zeigen, tragen sie den Hinweis: Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
seg-00a0f52f7458 = WAS GEPRÜFT WIRD, eng gefasst: dass diese Integrationen mit der realen Software funktionieren, für die sie geschrieben sind. DER NACHWEIS liegt in integrations/signalk/evidence/README.md (mit den zugehörigen JSON-Dateien) und integrations/opencpn/evidence/README.md (mit den Screenshots und Protokollen) und ist jeweils mit dem Skript committet, das ihn reproduziert. ({ "1" }) Signal K: das Plugin, geladen in das festgelegte npm-Paket signalk-server { "2.33.0" }, in einem privaten, nur über Loopback erreichbaren Netzwerk-Namensraum, gespeist mit synthetischen Daten. Die eigenen REST- und WebSocket-Schnittstellen des Servers zeigten die veröffentlichten Pfade, die Metadaten der Bewertung und eine Meldung, die von abwesend über warn, alarm, normal (nach der Haltezeit) wieder auf warn wechselte, als die Daten ausblieben. Mit dem echten, vom Plugin ausgeführten kshana auf den NMEA-Daten, die der Server selbst empfing, ging die Meldung von warn auf alarm, und die gemeldete Position wurde veröffentlicht; die eigene navigation.position des Servers wurde von seinem NMEA-Provider geschrieben, nie vom Plugin. Erneut ausgeführt gegen das Live-JSON-Schema { "1.2" }. ({ "2" }) OpenCPN: das Plugin, gebaut gegen den Header der OpenCPN-Plugin-API und wxWidgets { "3.2.4" }, geladen in das Ubuntu-{ "24.04" }-Paket von OpenCPN { "5.8.4" } unter einem virtuellen Display; OpenCPN lud es, führte seine Initialisierung aus und übergab ihm die PKSHT-Sätze des gefilterten Streams, und das Feld wurde im nicht vertrauenswürdigen Band rot. In einem sauberen Lauf hörte die eigene Schiffsposition von OpenCPN auf, sich zu aktualisieren, und seine Fix-Anzeige fiel ab, als das Gate den Fix als ungültig markierte. Ein zweiter Lauf, direkt vom TCP-Listener des Gates gespeist, zeigte die Zustellung an das Plugin, aber kein sauberes Vorher-Nachher. ({ "3" }) Die Relay-Tests spielen einen aufgezeichneten Ausschnitt des gefilterten Streams über einen echten TCP-Socket ab und prüfen, was ein Verbraucher empfängt (die Bytes unverändert, gültige Prüfsummen bei jedem Satz einschließlich der umgeschriebenen, GGA und RMC stimmen überein, ein PKSHT je Zyklus mit dem Gate-Feld, wo der Fix ungültig ist), und das Ende-zu-Ende-Skript prüft, dass ein Verbraucher des Listeners des Gates genau die Bytes empfängt, die dasselbe Gate auf die Standardausgabe schreibt. ({ "4" }) Die PKSHT-Parser (JavaScript und C++) laufen über aus der kshana-Ausgabe aufgezeichnete Sätze und weisen eine falsche Prüfsumme, eine falsche Version oder eine Bewertung außerhalb von { "0" } bis { "100" } zurück. ({ "5" }) Die systemd-Units werden mit systemd-analyze verify (systemd { "255" }, Binärdateien durch Stubs ersetzt) und mit Prüfungen auf eine Shell in ExecStart, die Neustartrichtlinie und die Sandbox-Schlüssel geprüft; die Argumentbehandlung des Container-Entrypoints wird mit einer Stub-Binärdatei geprüft. WAS NICHT: Für keinen der Werte, die diese Integrationen anzeigen, gibt es eine externe unabhängige Referenz. Die Vertrauenswerte selbst sind die Zeilen oberhalb, und ein Lauf einer Integration zeigt nur, dass die Verkabelung sie weiterreicht; deshalb ist diese Zeile MODELLED und nicht VALIDATED (docs/VALIDATION.md). Es wurden kein reales Schiff, kein realer Empfänger, kein langer Lauf, keine andere Version eines der beiden Hosts, kein anderes Betriebssystem und keine andere Desktop-Umgebung verwendet; alle Daten sind synthetischer Text, und nichts davon ist eine Messung. Die akustische und visuelle Behandlung der Meldung durch einen echten Signal-K-Client, die Symbolleistenschaltfläche von OpenCPN, die Einstellungen und der veraltete Zustand sowie die Paketierung für den OpenCPN-Plugin-Manager wurden nicht erprobt. Die systemd-Sandbox-Schlüssel wurden nur auf Syntax geprüft, nicht unter einem laufenden systemd ausgeführt, und für den Bau des Container-Images und seine Gesundheitsprüfung liegt hier kein committeter Nachweis vor. Es wird keine Erkennungs- oder Fehlalarmzahl behauptet. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
seg-475397d05dd0 = <s1>receiver_trust (live: das Gate, sein TCP-Listener, PKSHT); außerhalb des Crates: integrations/signalk (JavaScript), integrations/opencpn (JavaScript-Relay, natives C++-Plugin), deploy/reference-build (systemd-Units, Container)</s1>

# text
seg-89ab9ef155eb = BOC({ "1,1" })-Tracking: DLL-Skalierung und Auflösung der Bump-Jump-Mehrdeutigkeit (optional)

# text
seg-ef24be9b5917 = Das Feld boc von iq::track::LoopConfig (optional, standardmäßig None): die drei DLL-Diskriminatoren, neu skaliert, sodass sie den Codefehler in Chips mit Steigung eins am Hauptmaximum des Sinus-BOC({ "1,1" }) anzeigen, und ein Bump-Jump-Monitor auf sehr frühen und sehr späten Korrelatoren im Abstand einer halben Subträgerperiode ({ "0.5" } Chip), der den Code-NCO zum Hauptmaximum springen lässt, wenn ein Auf-/Abwärtszähler N erreicht ({ "8" } standardmäßig). Ohne die Option bleibt jede Ausgabe unverändert.

# text
seg-416ce4dfc6f5 = Interne Konsistenz gegenüber eingespeister Wahrheit und geschlossenen Formeln, unter Zielwerten, die bei 6b68f6cc vorab registriert wurden (docs/design/evidence/boc-bump-jump/). Ein BeiDou-B1C-Datensignal (PRN { "19" }, { "5" } MS/s), erzeugt von iq::scene: Bei ausgeschalteter Option bleibt ein Start auf einem Nebenmaximum falsch eingerastet bei den vorhergesagten ±({ "0.5" } + d/4) Chip (gemessen ±{ "0.549" }); bei eingeschalteter Option ein Sprung zum Hauptmaximum bei { "0.08" } s und ein RMS im späten Fenster von { "0.0008" } Chip bei { "45" } dB-Hz und { "0.0048" } Chip bei { "35" } dB-Hz; kein Sprung vom Hauptmaximum bei { "35" }, { "40" } und { "45" } dB-Hz über { "4" } s; die skalierte EMLP-Steigung { "0.94" } bis { "0.99" } am abgetasteten Signal (unskaliert { "3.6" } bis { "3.8" }). Der Bump-Jump-Detektor allein, auf Korrelator-Tripeln mit der exakten BOC({ "1,1" })-Rauschkovarianz, machte in { "100 000" } Aktualisierungen bei { "25" } bis { "45" } dB-Hz keinen falschen Sprung und erkannte { "1000" } von { "1000" } Starts auf einem Nebenmaximum bei { "35" } dB-Hz. NOT MET (Befund F1): Das vorab registrierte Unit-Test-Raster für die Skalierung enthält Versätze außerhalb des linearen Bereichs der Diskriminatoren, wo die skalierten Messwerte den Versatz um bis zu { "48" } % verfehlen. WAS NICHT GEPRÜFT WIRD: IQ-Felddaten, bandbegrenzte Frontends, zusammengesetzte MBOC-/QMBOC-Replikate und jeder externe Empfänger.

# text
seg-2c32955cbfb3 = IQ-Kanal für ionosphärische Szintillation (Cornell-Modell) gegen gemessene GPS-L1-Szintillation mit { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, das Cornell-Szintillationsmodell (Rice-Intensität, Butterworth-Spektrum zweiter Ordnung, Phase arg z), betrieben mit dem S4 und der Intensitäts-Dekorrelationszeit eines gemessenen Fensters und verglichen anhand dessen, was es über diese beiden Eingaben hinaus erzeugt; realdata::scint50 liest das Messprotokoll, entfernt den Trend und führt den Vergleich aus.

# text
seg-bdc9fe963c5c = Messdaten unter Zielwerten, die bei b6ccb499 vorab registriert wurden (xval/scint-malindi/): Zenodo-Eintrag { "16941224" } (INGV, Malindi, { "18" }. März { "2023" }, GPS PRN { "26" }, Intensität und Trägerphase mit { "50" } Hz, CC BY { "4.0" }, SHA-256 geprüft). { "22" } qualifizierte Fenster von { "60" } s (N1 erfüllt). MET: die Intensitätsverteilung (Kolmogorov-Smirnov D { "0.0415" }, Zielwert { "0.05" }) und die an S4 gebundene Phasenszintillation (Median gemessen/Modell sigma-phi { "0.779" }, Zielwert 2/3 bis 3/2). NOT MET (Befund F1): Der Anteil tiefer Fades des Modells beträgt das { "2.38" }-Fache des gemessenen (Zielwert { "0.5" } bis { "2" }) und sein mittlerer Fade ist { "3.51" }-mal so lang (Zielwert 2/3 bis 3/2). Befund F2: Die registrierte Verarbeitung liest die umbrochene Phase des Modells, was eine Selbstprüfung aufdeckte; B3, nachträglich mit entfalteter Phase wiederholt, ergibt { "0.804" }. WAS NICHT GEPRÜFT WIRD: andere Nächte, Stationen, Breitengrade oder Signale; Empfängerrauschen im Modell. Die Zeile bleibt MODELLED.

# text
seg-160507ac3702 = Cell-averaging-CFAR-Option in der IQ-Akquisition

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar und ca_cfar_cells (optional): Eine Zelle eines Akquisitionsrasters wird mit dem Mittelwert von Referenzzellen ihrer Doppler-Zeile verglichen (Schutz- und Schrittlags, die um die Periode herum umbrechen), mit einem Faktor alpha, der aus der geschlossenen Formel der CA-CFAR-Fehlalarmwahrscheinlichkeit für M nichtkohärente Blöcke festgelegt wird (ca_cfar_pfa, ca_cfar_alpha). Der Detektor auf Basis der Stichprobenleistung bleibt der Standard, und jede bestehende Ausgabe bleibt unverändert.

# text
seg-ba35daac2aed = Geschlossene Formel, unter Zielwerten, die bei 3724aefa vorab registriert wurden (docs/design/evidence/acq-cfar/). Die CA-CFAR-Fehlalarmwahrscheinlichkeit für Gamma(M)-Zellen gegenüber einer Monte-Carlo-Simulation des exakten Modells: { "18" } von { "18" } Fällen innerhalb von { "3" } Binomial-Sigma. Auf jeder Zelle von iq::acq-Suchen (GPS L1 C/A, { "2.5" } MS/s, je { "210 000" } Zellen) bei einem Entwurfswert von { "1" } %: { "0.977" } % und { "0.969" } % bei Gauß-Rauschen sowie { "1.006" } % und { "0.999" } % bei 2-Bit-quantisiertem Rauschen (M = { "1" } und { "4" }; Zielwert plus/minus { "20" } %); Entscheidungen unverändert, wenn die Eingabe skaliert wird. NOT MET (Befund F1): Bei einem rauschfreien 2-Bit-Signal sind die Detektion und ihre Zelle richtig, aber { "1.28" } % der Zellen außerhalb des Maximums in der Zeile des Maximums (Zielwert { "1" } %) überschreiten die Schwelle, an den deterministischen Korrelationsnebenmaxima des Codes. WAS NICHT GEPRÜFT WIRD: andere CFAR-Varianten, zweidimensionale Fenster, bandbegrenzte Frontends, Felddaten.

# text
seg-5bd3bf0c22a7 = Spektrummodell: GLONASS-, BeiDou- und Galileo-E6-Bänder (optional)

# text
seg-9c16189c63ac = spectrum::default_band löst allein über den Namen (MORE_BAND_NAMES) auf: GLONASS L1OF und L2OF auf jedem FDMA-Kanal K = -7 bis { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a und B3I (BPSK({ "10" })) sowie Galileo E6 (BPSK({ "5" })), mit den Trägern und minimalen Empfangsleistungen aus ihren Schnittstellenkontrolldokumenten; die Standard-Bandmenge und jede bestehende Ausgabe bleiben unverändert.

# text
seg-6d674bc4b40a = Veröffentlichte Schnittstellenkontrolldokumente und geschlossene Formeln, unter Zielwerten, die bei 5806f28b vorab registriert wurden (docs/design/evidence/spectrum-bands/): GLONASS-ICD Edition { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } und B3I { "1.0" }, Galileo-OS-SIS-ICD Issue { "2.1" }. MET: jeder Träger, jede Chiprate und jede Empfangsleistung wie transkribiert ({ "28" } GLONASS-Kanäle), die ersten BPSK-Nullstellen bei der Chiprate, das B1C-Komposit gleich MBOC(6,1,1/11), wie die Leistungstabelle seines ICD es angibt, die Identität des C/N0-Pfads und byteidentische Spektrum-Szenarien. NOT MET: der Zielwert für die Einheitsfläche, der in der vorliegenden Fassung nicht erreichbar war (Befund F1; die Flächen entsprechen dem geschlossenen Anteil im Band), und die Übereinstimmung je Bin der B1I- und B1C-Wellenformen der IQ-Schicht mit der Modellhüllkurve ({ "1.26" } und { "1.56" } dB gegenüber { "0.5" } dB, Befund F2; GLONASS { "0.07" } dB), weil Gold- und Weil-Codes ungleichmäßige Linienspektren haben; bandgemittelt stimmen die Hauptkeulen innerhalb von { "0.25" } dB überein. WAS NICHT GEPRÜFT WIRD: aufgezeichnete IQ-Daten, andere Signale, Störungen innerhalb eines Systems.

# text
seg-63b7da996265 = Primäre BeiDou-B1I-Entfernungsmesscodes gegen einen unabhängigen Generator

# text
seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits und b1i: die Gold-Codes nach BDS-SIS-ICD-B1I-3.0, auf { "2046" } Chips gekürzt, PRN { "1" } bis { "63" }, wie die IQ-Schicht sie erzeugt, akquiriert und verfolgt.

# text
seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" } (Tag { "v0.0.19" }, Commit 1ddd4562), eine unabhängige Open-Source-Implementierung desselben ICD: Ihr beidou_b1i_code_gen_int, eigenständig kompiliert, erzeugte alle { "63" } Codes. Nur ihre Programmausgabe ist committet: tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt, ein Präfix von 64 Chips und der SHA-256 jedes Codes mit 2046 Chips. Diese Ausgabe sind die BeiDou-B1I-PRN-Codes, die das öffentliche BDS-SIS-ICD-B1I-3.0 definiert; im Repository befindet sich weder Quellcode noch Binärdatei von GNSS-SDR. Zielwert, vorab registriert bei 911106d1 (xval/beidou-b1i-gnss-sdr/): alle { "2046" } Chips aller { "63" } PRNs identisch, keine Invertierung, Verschiebung oder Umbenennung. Ergebnis: { "63" } von { "63" } identisch; die Fixture wurde aus einem frischen Checkout von { "v0.0.19" } neu erzeugt (SHA-256 der Quelldatei wie vermerkt) und ist byteidentisch. WAS NICHT GEPRÜFT WIRD: der sekundäre NH20-Code, die GEO-PRN-Liste, der Träger und die Chiprate.

# text
seg-b4787b04338e = GPS-L1C-Entfernungsmess- und Überlagerungscodes gegen die gedruckten Prüfspalten von IS-GPS-800J

# text
seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits und l1c_o_bits: die Weil-Entfernungsmesscodes L1CP und L1CD (berechnete Legendre-Folge, Weil-Index, vor Chip p eingefügte Erweiterungsfolge) und die S1-Überlagerungscodes L1CO, PRN { "1" } bis { "63" }.

# text
seg-3f4bbdd3666b = IS-GPS-800J (01-AUG-2022, Verteilungsvermerk A), die Prüfspalten, die es neben den Generatorparametern druckt: Tabelle 3.2-2 die ersten und letzten { "24" } Chips jedes L1CP- und L1CD-Codes, Tabelle 3.2-3 die ersten und letzten { "11" } Bits jedes L1CO-Codes, Tabelle 6.2-1 die Legendre-Folge der Länge 10223; mit scripts/extract_is_gps_800_tables.py aus dem PDF transkribiert (SHA-256 c4aad710...). Zielwerte, vorab registriert bei fe372e26 (docs/design/evidence/l1c-codes/): { "252" } von { "252" } Spalten, { "63" } von { "63" } Überlagerungen und { "10 223" } von { "10 223" } Legendre-Bits identisch; die Extraktion mit --check besteht; eine negative Kontrolle schlägt bei umbenannten, invertierten und verschobenen Codes fehl. WAS NICHT GEPRÜFT WIRD: die Generatorparameter selbst (sie stammen aus denselben Tabellen), die Chips zwischen den gedruckten Spalten, das TMBOC-Subträgermuster und die L1CO-S2-Codes.

# text
seg-5cba09089e09 = Primäre LunaNet-AFS-I- und AFS-Q-Codes gegen die gedruckten Prüfspalten von LSIS-AFS V1.0

# text
seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits und afs_q_primary_bits (Signalnamen lunanet-afs-i und lunanet-afs-q in kshana iq): der AFS-I-Gold-Code ({ "2047" } auf { "2046" } kurzgezykelt, G2 je PRN verzögert) und der primäre AFS-Q-Weil-Code (berechnete Legendre-Folge, Weil-Index, vor Chip p eingefügte Erweiterungsfolge), PRN { "1" } bis { "210" }.

# text
seg-330ed84e8e78 = Gegen die gedruckten Tabellen von LSIS-AFS V1.0 (in der Spezifikation mit TBC markiert): LunaNet Interoperability Specification V5, Applicable Document { "1" } Volume A: LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0, { "29" }. Januar { "2025" } (NASA; PDF-SHA-256 { "986e0795" }...), die Prüfspalten, die es neben den Generatorparametern druckt: Tabellen C-1 bis C-5 und D-2 bis D-6 die ersten und letzten { "24" } Chips jedes AFS-I- und AFS-Q-Codes, Tabelle D-1 die Legendre-Folge der Länge 10223; extrahiert mit scripts/extract_lunanet_afs_tables.py (xval/lunanet-afs/oracle/). Zielwerte, vorab registriert bei b3ba5d5 (xval/lunanet-afs/PREREGISTRATION.md), bevor der Generator existierte: B1 { "420" } von { "420" }, B2 identisch, B3 { "420" } von { "420" }. Das Dokument kennzeichnet seine Codetabellen mit { "{" }LSIS-TBC{ "}" } und sagt, sie seien nur für Test und Integration bestimmt, sodass dies die Konstruktion gegen die Tabellen dieser Ausgabe validiert, nicht gegen die einer späteren. Eine vorab registrierte Aussage über den gedruckten G2-Anfangszustand (B1b) wurde mit der falschen Richtung formuliert und ist NOT MET ({ "0" } von { "210" }), festgeschrieben; die korrigierte Beziehung ({ "2047" } minus die Verzögerung) gilt für { "210" } von { "210" } und ist als nachträglich vermerkt. WAS NICHT GEPRÜFT WIRD: die Generatorparameter selbst (dieselben Tabellen), die Chips zwischen den gedruckten Spalten, der Tertiärcode, die Nachrichtenschicht und die LDPC-Kodierung.

# text
seg-7b1ae0c7ca28 = LunaNet-AFS-Tertiärcodes und Nachrichtenschicht (SB1-BCH, CRC-24Q, Interleaver) gegen LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: Synchronisationsmuster, SB1-BCH({ "51,8" })-Kodierer und Dekodierer mit 256 Hypothesen, CRC-24Q, der Blockinterleaver { "60" } x { "98" }, ein Symbolstrom-Prüfer (kshana lunanet-afs-check) und ein Teststrom-Generator mit Platzhalter-Subframes. Die LDPC-Kodierung mit Rate 1/2 der Subframes { "2" } bis { "4" } ist nicht implementiert (ihre Matrizen stehen in einem separaten Anhang).

# text
seg-b6f39f180fdd = LSIS-AFS V1.0 (wie oben): die Legendre-Folge der Länge 1499 (Tabelle E-1, identisch) und die ersten und letzten { "24" } Chips des Tertiärcodes (Tabellen E-2 bis E-6: { "419" } von { "420" } Spalten identisch; das Dokument druckt für PRN { "147" } und PRN { "151" } dieselben letzten { "24" } Chips, A14850, und der Generator reproduziert die von PRN { "151" }, sodass der Eintrag für PRN { "147" } höchstwahrscheinlich ein Druckfehler ist; der Zielwert von { "420" } von { "420" } ist NOT MET, und die Abweichung ist festgeschrieben); das Beispiel aus Abbildung { "8" } für den SB1-Code (ein Beispiel: 0x045 wird zu 0x229F61DBB84A0 kodiert); CRC-24Q gegen den Katalog-Prüfwert 0xCDE703 für ASCII { "123456789" }; die eigene Rahmenarithmetik des Dokuments. Zielwerte, vorab registriert bei b3ba5d5. Eine verzeichnete Abweichung und ein Beispiel für die Nachrichtenschicht, daher bleibt die Zeile MODELLED. WAS NICHT GEPRÜFT WIRD: LDPC und die CRC-Wörter in den Subframes { "2" } bis { "4" }, der Nachrichteninhalt und jeder aufgezeichnete Strom

# text
seg-0d7b17524c04 = Standardpakete: Szenarien, bewertet gegen Zielwerte, die vor dem Lauf festgelegt wurden

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): die Testprofile des DHS-Rahmenwerks Resilient PNT für die Stufen { "1" } bis { "4" }, die Genauigkeitsstufen und die Integritätsbewertung nach IMO MSC.1/Circ.1575 sowie die Pakete Überwachen, Bewerten und Abmildern nach ICAO Doc { "9849" } Anhang F: Jeder Test führt eine mitgelieferte Szenarioart aus und vergleicht Ergebnisfelder mit den im Paket angegebenen Zielwerten, und Tests, die ein Empfängerprotokoll benötigen, werden als NEEDS INPUT aufgeführt und nicht bewertet.

# text
seg-8a8f2c85e0c3 = Nachweispaket der Labor-Rundreise (Szenario, Testbedingungen, Empfängerprotokoll, Bewertung)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) und der Empfängerprotokoll-Export kshana.test-conditions/1 von kshana bench-export: ein signiertes Paket, das den Szenario-Hash, den Hash der angegebenen Bedingungen, den Hash des Protokolls und die Bewertung gegen die angegebenen Ereignisse festhält und Bedingungen zurückweist, die den Bewertungsereignissen widersprechen, oder ein Protokoll, dessen Hash nicht der angegebene ist. Es wird kein Signal geschrieben, abgespielt oder eingeplant.

# text
seg-a9189e4fe413 = IQ-Tracking-Engine gegen GNSS-SDR { "0.0.19" } an unabhängigen Aufzeichnungen

# text
seg-364de05e5b1b = Die vollständige Tracking-Engine der IQ-Schicht (iq::track über kshana iq track: Akquisitionsübergabe, Korrelatoren, NCOs, Costas-PLL zweiter Ordnung mit { "15" } Hz, trägergestützte DLL erster Ordnung mit { "2" } Hz und EML-Hüllkurve, Lock-Indikator und C/N0-Schätzer) auf GPS L1 C/A bei { "30" } bis { "45" } dB-Hz.

# text
seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, das Paket von Ubuntu { "24.04" }, als eigenständiges Programm ausgeführt; nur abgeleitete Zahlen committet) verfolgt dieselben numpy-Aufzeichnungen (unabhängig von der Engine), beide gemessen gegen die analytische Wahrheit. Zielwerte, vorab registriert bei 48edd4a5, geändert vor jeder Testaufzeichnung bei 1e4288c4 (ein FLL mit { "10" } Hz nur während des Einziehens in beiden Empfängern, nachdem die registrierte Kalibrierung an einer falschen Übergabe von GNSS-SDR gescheitert war, Befund F3). MET bei { "30" }, { "35" }, { "40" } und { "45" } dB-Hz: Trägerjitter innerhalb von { "4.3" } %, Codejitter innerhalb von { "4.6" } % sowie Doppler-Mittelwert und -Streuung innerhalb derer von GNSS-SDR. NOT MET: Der NWPR-C/N0 der Engine liegt { "2.3" } bis { "7.1" } dB unter dem SNV von GNSS-SDR (Befund F4, die bekannte NWPR-Grenze; ihr M2M4 liegt innerhalb von { "0.06" } dB der Wahrheit); die Phasen-Lock-Indikatoren unterscheiden sich per Definition (F5); bei { "30" } dB-Hz rutschte GNSS-SDR zweimal und die Engine nicht (F6). Die eigene Übergabe von GNSS-SDR rastete in { "3" } von { "30" } Kalibrierläufen auf eine falsche Frequenz ein. WAS NICHT GEPRÜFT WIRD: andere Signale, Datenbit-Abstreifung, Wiedererfassung, Feldaufzeichnungen. Die Zeile bleibt MODELLED.

# text
seg-259d201c2ff8 = CRPA-Antennengewinne in der Art jamming gegen eine unabhängige numpy-Neuberechnung

# text
seg-192144c57783 = Der optionale Abschnitt [crpa] der Art jamming: ein Strahl je Kanal zu jedem Satelliten (Nullsteuerung mit dem Jammer als Nullstelle, oder MVDR auf sigma^{ "2" } I + P_j a_j a_j^H), der das Rauschen jeder Verbindung mit ||w||^{ "2" } und den Jammer mit |w^H a_j|^{ "2" } skaliert, bevor die bestehende Anti-Jam-C/N0-Gleichung angewendet wird.

# text
seg-232d040b575d = Eine unabhängige numpy-Neuberechnung (xval/crpa-jamming/oracle.py, kein gemeinsamer Code: numpy-Steuervektoren, numpy.linalg.solve und inv) jeder Verbindung der Geometrie von jamming-demo mit einem quadratischen Array aus 4 Elementen, unter beiden Gewichtungen. Zielwerte, vorab registriert bei 08d83b4d. MET: A1 (alle { "150" } Szenarioergebnisse byteidentisch ohne den Abschnitt, nach einer Korrektur: Der erste Bau fügte die crpa-Einheiten zur Einheitentabelle jedes jamming-Laufs hinzu), A2 (ein Element entspricht keinem Array bis auf { "1e-12" } dB), A3 beim Rauschgewinn des Arrays und beim effektiven C/N0 ({ "912" } Verbindungsgewichtungen innerhalb von { "1e-9" } dB, schlechtester Wert { "2.1e-14" } dB) sowie bei der Jammer-Nullstelle der Nullsteuerung (unter -200 dB auf beiden Seiten), A4 (MVDR innerhalb von { "0.1" } dB der Nullsteuerung bei einem JNR von { "80" } dB). NOT MET: A3 beim MVDR-Jammergewinn, { "194" } von { "456" } Verbindungen über { "1e-9" } dB bei { "0.36" } portabler Mathematik ({ "202" } bei Host-Mathematik; docs/revisions/STUDIO15-batch4-rebaseline.md) (schlechtester Wert { "1.7e-6" } dB) bei Residuen von -100 bis -188 dB, wo die float64-Auslöschung beide Implementierungen begrenzt (die inv und solve von numpy weichen bei { "169" } Verbindungen voneinander ab, schlechtester Wert { "7.9e-7" } dB); das effektive C/N0, das daraus gespeist wird, ist nicht betroffen. WAS NICHT GEPRÜFT WIRD: gegenseitige Kopplung, Elementabweichung, Breitbandverarbeitung, mehrere Jammer, jede Antennenhardware. Eine Neuberechnung derselben Gleichungen, keine externe unabhängige Referenz; die Zeile bleibt MODELLED.

# text
seg-a2f34cff9338 = Geländeabschattung des Jammers in der Szenarioart jamming gegen eine unabhängige numpy-Neuberechnung auf einer realen SRTM-Kachel

# text
seg-334c569d9cae = Der optionale Abschnitt [terrain] der Szenarioart jamming: das Großkreis-Geländeprofil zwischen Jammer und Empfänger auf einer SRTM-.hgt-Kachel mit einer Erdkrümmung nach k-Faktor, die dominante Messerschneide (größtes Fresnel-Kirchhoff-nu) und der Einzel-Messerschneidenverlust nach ITU-R P.526-15 Abschnitt { "4.1" }, abgezogen von der Empfangsleistung des Jammers.

# text
seg-615ea67dd756 = Eine unabhängige numpy-Neuberechnung (xval/jamming-terrain/oracle.py, kein gemeinsamer Code: eigenes Lesen der .hgt, bilineare Interpolation, WGS-{ "84" }-Hin- und Rücktransformation, Profil, Krümmung, nu und J(nu)) von zehn Jammer-Positionen um einen Empfänger im Badwater Basin auf der committeten realen SRTM-Kachel tests/fixtures/terrain/N36W117_sub6.hgt. Zielwerte und Positionen, vorab registriert bei 92cd2bfd. Alle MET: Additivität (alle { "150" } Szenarioergebnisse ohne den Abschnitt byteidentisch); Profilpunkte und Hindernis jeder Position gleich sowie nu und Verlust innerhalb von { "1.6e-10" } (Zielwert { "1e-9" }); der Verlust steigt nie, wenn der Jammer von { "2" } auf { "4902" } m steigt; der Verlust senkt jedes J/S genau um sich selbst und um nichts anderes; J(nu) innerhalb von { "1e-12" } dB desjenigen der unabhängigen Referenz. Befunde: Positionen jenseits der Black und Funeral Mountains verlieren { "44" } bis { "48" } dB; zwei Positionen auf dem Talboden verlieren { "8" } und { "15" } dB allein durch die Erdkrümmung bei Antennenhöhen von { "2" } m, dem Streifenfall des Einzel-Messerschneidenmodells. WAS NICHT GEPRÜFT WIRD: jede gemessene Ausbreitung, Mehrfachkanten-Beugung, Bodenreflexion, Bebauung und Bewuchs, der eigene Fehler des Höhenmodells. Eine Neuberechnung desselben Modells, keine externe unabhängige Referenz; die Zeile bleibt MODELLED.

# text
seg-825c121c7512 = Akquisitionshysterese und Frontend-Quantisierer in der Szenarioart jamming gegen unabhängige Neuberechnungen

# text
seg-f7207263d881 = Die optionalen Abschnitte [acquisition] (ein Satellit wird bei oder über einer Akquisitionsschwelle nach einer Wiedererfassungsverzögerung erfasst und gehalten, solange er bei oder über der Tracking-Schwelle liegt) und [front_end] (die AGC-Anzeige { "10" } log10({ "1" } + J/N) und der Quantisierungsverlust des ADC bei gaußschem Eingang, von jeder Verbindung abgezogen, gekennzeichnet als nicht gültig für nicht-gaußsche Jammer) der Szenarioart jamming.

# text
seg-6abc60ee9ec4 = Eine unabhängige Python-Neuberechnung jedes Akquisitionsflags (xval/jamming-acq-agc/hysteresis.py) aus dem effektiven C/N0 der Engine je Epoche, eine unabhängige numpy-Monte-Carlo-Simulation des Quantisierungsverlusts (xval/jamming-acq-agc/quantiser_mc.py, eigene Suche nach der optimalen Schrittweite, { "2" }^{ "22" } Stichproben) und die AGC-Schleife der IQ-Schicht. Zielwerte, vorab registriert bei 70c72fcc, mit einem ergänzenden Lauf-Satz bei { "37793290" }. MET: Additivität (alle { "150" } Szenarioergebnisse ohne die Abschnitte byteidentisch); jedes Flag gleich in den ergänzenden Läufen ({ "1824" } Verbindungen, davon { "732" } mit Hysterese); monoton in der Schwelle; der Quantisierungsverlust innerhalb von { "0.0007" } dB der Monte-Carlo-Simulation bei { "1" } bis { "4" } Bit (Zielwert { "0.02" } dB); die AGC-Anzeige innerhalb von { "0.012" } dB der AGC-Schleife (Zielwert { "0.05" } dB). NOT MET: Die registrierten Hysterese-Läufe (jamming-demo bei { "10" } bis { "30" } dBW) waren nicht aussagekräftig, da jede Verbindung verloren ging, und ihre H2 und H4 sind nur trivial erfüllt. Befund: Bei einem CW-Jammer verliert ein 1-Bit-ADC etwa { "5" } dB mehr als der gaußsche Wert, den die Engine anwendet, und kennzeichnet dies als nicht gültig. WAS NICHT GEPRÜFT WIRD: die Akquisitionssuche selbst, AGC-Dynamik über die Zeit, jede Empfängerhardware. Neuberechnungen desselben Modells, keine externe unabhängige Referenz; die Zeile bleibt MODELLED.

# text
seg-9c46f1c76486 = Begrenztes FLL-Einziehen unterhalb der FLL-zu-PLL-Übergabeuntergrenze des Standardentwurfs (optional)

# text
seg-efa1d1a9e904 = Das optionale carrier.fll_pull_in_max_s von iq::track (das Feld fll_pull_in_max_s von iq::track::LoopConfig): Bei fll_assist = pull-in übergibt die FLL nach einer festen Einziehzeit unabhängig vom PLI an die PLL, mit einer passenden Rückkehr-Verweildauer, bis der PLI erstmals fll_off_pli erreicht.

# text
seg-76cce58eaddd = Interne Konsistenz gegenüber eingespeister Wahrheit: eine synthetische datenfreie GPS-L1-C/A-Quelle (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, zehn Rauschstartwerte), deren Trägerphase bekannt ist, unter Zielwerten, die bei 58789af0 vorab registriert wurden (docs/design/evidence/fll-handover-floor/). MET: die Kontrolle (der unbegrenzte Standard übergibt bei { "33" } dB-Hz in { "9" } von { "10" } Startwerten nie); Additivität (Standard-Hash und bestehende Tracking-Tests unverändert); Einziehen einer Übergabe mit { "100" } Hz Versatz bei { "45" } dB-Hz. NOT MET: Mit einer Begrenzung von { "1.0" } s Übergabe und Halten in jedem Lauf ({ "16" } von { "20" } bei { "33" } dB-Hz, { "8" } von { "20" } bei { "31" } dB-Hz; die übrigen wechseln zwischen erzwungenen Übergaben und der Rückkehr der FLL) und Phasenjitter innerhalb von { "25" } % der PLL allein ({ "10.8" } gegenüber { "6.1" } Grad bei { "33" } dB-Hz). WAS NICHT GEPRÜFT WIRD: Datenbits, andere Signale und Abtastraten, Feldaufzeichnungen. Der Standard bleibt unverändert; die Zeile bleibt MODELLED.

# text
seg-ac0f97e945a7 = Leser für RTKLIB-.pos-Lösungen für receiver-trust

# text
seg-0b8bc2c89de4 = Liest eine RTKLIB-Lösungsdatei (Kalender- oder GPS-Woche/TOW-Zeit, Breite/Länge oder ECEF-Position, verwendete Satelliten) in die receiver-trust-Zeitleiste (receiver_trust::machines::rtklib).

# text
seg-3de364392f92 = Keine externe Referenz: Es wurde keine von RTKLIB erzeugte Datei gelesen, und das Spaltenlayout stammt aus dem RTKLIB-Handbuch. Nur an selbst geschriebenen Dateien geprüft; die ECEF-Umrechnung verwendet frames::ecef_to_geodetic wieder, das eigene Zeilen hat

# text
seg-849393517c04 = NovAtel-OEM7-ASCII- und Binärprotokolle (BESTPOS, RANGE, RXSTATUS) für receiver-trust

# text
seg-7e0021922025 = Liest BESTPOS (Position), RANGE (C/No je Signal) und RXSTATUS (das Jammer-Flag des Empfängers, als Selbstauskunft der Epoche) aus ASCII- und Binärprotokollen des OEM7, CRC-geprüft, nur lesend (receiver_trust::machines::novatel).

# text
seg-1f7c6d1009a8 = Keine externe Referenz als bestandener Zielwert. Die Feldlayouts und die CRC folgen der öffentlichen OEM7-Dokumentation (docs.novatel.com); die CRC-Routine wurde einmal gegen die CRC geprüft, die die Dokumentation für ihr eigenes BESTPOSA-Beispiel angibt (zitiert, nicht wörtlich übernommen). Die Fixtures sind selbst geschrieben; es wurde kein Protokoll eines realen Empfängers gelesen

# text
seg-a45c53a9deb3 = Leser für Träger-zu-Rausch-Werte aus RTCM-{ "3" }-MSM4 und -MSM7 für receiver-trust

# text
seg-0a0c9976236f = Liest das C/N0 jeder Signalzelle von RTCM-{ "3" }-MSM4- und -MSM7-Nachrichten (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) aus einem Frame-Strom, CRC-24Q-geprüft (receiver_trust::machines::rtcm3). Layouts aus den unter BSD lizenzierten pyrtcm-Tabellen, nicht aus dem Text des RTCM-Standards.

# text
seg-2af6fc1abe98 = ReferenceImpl in einer einmaligen Prüfung, kein Test der Suite: Der Dekodierer von pyrtcm { "1.2.0" } liest dieselben selbst geschriebenen Frames mit demselben C/N0 und derselben Epochenzeit. Er teilt die Quelle seiner Tabellen mit diesem Leser, prüft also die Bitverarbeitung, nicht das Layout. Es wurde keine Aufzeichnung eines realen Empfängers oder einer Basisstation gelesen

# text
seg-cd554a7c1649 = GNSS-SDR-Monitor-Adapter für receiver-trust

# text
seg-22b587ac642d = Liest GNSS-SDR-Monitor-Nachrichten (Gnss_Synchro) und PVT-Monitor-Nachrichten, mit den proto-Feldnamen als JSON-Zeilen weitergereicht, in C/N0 je Kanal, Fix, verwendete Satelliten, HDOP und Himmel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-d22aed9d9a16 = Keine externe Referenz: Die Feldnamen stammen aus der GNSS-SDR-Dokumentation; weder der Leser noch relay.py wurden gegen ein laufendes GNSS-SDR oder eine reale Aufzeichnung ausgeführt

# text
seg-217e5953c128 = Einlesen von IMU-Protokollen, Kreisel-Kurseingang und Allan-Anpassung hybrider Sensorparameter

# text
seg-9dadc819daef = Liest eine IMU-CSV (dokumentierte Spalten oder das EuRoC-Layout); integriert die Gierrate zu dem Kurs, den der Monitor heading-course liest ([log.imu]); und passt die Rauschparameter von Beschleunigungsmesser und Kreisel der hybriden und Fusionsszenarien aus einem Ruheprotokoll per überlappender Allan-Abweichung an (imu-fit).

# text
seg-9099f3467e9e = Keine externe Referenz: Die Anpassung wird an synthetischen Weißrauschen-Protokollen mit bekannten Koeffizienten geprüft, der Kurs an Protokollen mit konstanter Gierrate. Es wurde kein reales IMU-Protokoll angepasst, und q_aa wird nicht angepasst

# text
seg-15a852a2dcb0 = Home-Assistant-MQTT-Discovery und Zustandsexporter für Vertrauenstelemetrie

# text
seg-6d6b07b26966 = Ein JSON-Zustandsdokument und MQTT-Discovery-Nachrichten für Home Assistant zum Vertrauensstrom, auf jeder Oberfläche als Text ausgegeben und von der CLI über MQTT { "3.1.1" } QoS { "0" } veröffentlicht (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-79a8f3864af3 = Keine externe Referenz: Die Pakete wurden von einem für den Test geschriebenen Loopback-Listener gelesen, nicht von einem echten Broker, und Home Assistant wurde nicht ausgeführt

# text
seg-68caf86157c2 = ROS-{ "2" }-Paket für receiver-trust und gnss_lib_py-Brücke

# text
seg-e7d7d99fe538 = Eine ROS-freie Brücke, die Fix- und Satellitennachrichten als NMEA schreibt und über die Python-Anbindung bewertet (integrations/ros2/kshana_trust), und eine Brücke von gnss_lib_py NavData zu receiver-trust über das Format rtklib-pos (integrations/gnss_lib_py).

# text
seg-05ded40b17d2 = Keine externe Referenz: Der ROS-Knoten wurde nicht in einem laufenden ROS-{ "2" }-Graphen ausgeführt, und die Feldnamen von ublox_ubx_msgs wurden nicht gegen einen laufenden Treiber geprüft. gnss_lib_py (MIT) wurde für den Brückentest ausgeführt

# text
seg-6eee4b0e40b9 = <s1>Zurück</s1>Verifikationsmatrix

# text
seg-c3e7639ccf1a = <s1>Weiter</s1>Warum Zeilen modelliert bleiben

# text
seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — eine unabhängige MCDA-Bibliothek eines Drittanbieters, die dieselbe eindeutig definierte bereichsnormierte S/R/Q-Aggregation berechnet; übereinstimmend bis <{ "1e-9" }. Offline neu erzeugbar mit tests/fixtures/mcda_vikor/generate_vikor_reference.py

# text
seg-790176ba8196 = MCDA-Outranking-Nettofluss-Rangfolge (PROMETHEE II)

# text
seg-b25cedf6da6e = Preference Ranking Organization METHod — paarweiser Präferenzindex mit den sechs standardmäßigen verallgemeinerten Kriterienformen, positiven/negativen Outranking-Flüssen und der vollständigen Nettofluss-Rangfolge (übliches Kriterium validiert)

# text
seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — eine unabhängige MCDA-Bibliothek eines Drittanbieters, die denselben eindeutig definierten Netto-Outranking-Fluss berechnet; übereinstimmend bis <{ "1e-9" }. Offline neu erzeugbar mit tests/fixtures/mcda_promethee/generate_promethee_reference.py. Die Präferenzformen mit Schwellen (q/p/σ) lassen sich auf dieselbe Algebra verallgemeinerter Kriterien zurückführen und bleiben eigenschaftsgeprüft

# text
seg-72248291c388 = MCDA-Outranking-Auswahlkern (ELECTRE I)

# text
seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — Konkordanz-/Diskordanzmatrizen, die Dominanzrelation aus Konkordanz und Nicht-Veto sowie der Outranking-Auswahlkern (Konvention: ausschließlich Nutzenkriterien, summennormierte Gewichte, eine einzige globale Skala)

# text
seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — eine unabhängige Multikriterien-Entscheidungsbibliothek eines Drittanbieters, die dieselbe eindeutig definierte Konkordanz/Diskordanz/Dominanz/Kern berechnet; elementweise übereinstimmend bis <{ "1e-9" }. Offline neu erzeugbar mit tests/fixtures/mcda_electre/generate_electre_reference.py. Die Schwellenwahl ĉ/d̂ sind Eingaben der Analysten (die Sensitivität bleibt MODELLED)

# text
seg-95942c6a2689 = MCDA-Aggregationskerne (WASPAS / MOORA)

# text
seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (linear normierte konvexe Mischung λ·WSM+({ "1" }−λ)·WPM bei λ={ "0.5" }) und das MOORA-Verhältnissystem (vektornormierte gewichtete Nutzensumme minus gewichtete Kostensumme) — die stabilitätsgehärtete Wertmischung und der vorzeichenbehaftete Verhältnissystem-Bewerter

# text
seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA-Verhältnissystem, Vektornormierung) — eine unabhängige, weit verbreitete Python-MCDA-Bibliothek eines Drittanbieters, die dieselben eindeutig definierten Aggregate berechnet; übereinstimmend bis <{ "1e-9" }. Offline neu erzeugbar mit tests/fixtures/mcda_waspas/ und tests/fixtures/mcda_moora/. Garbage in, garbage out bei den Eingaben; die Sensitivitäts-/Robustheitsschicht bleibt MODELLED

# text
seg-7de67fedc1da = MCDA-Proportionalrangfolge (COPRAS)

# text
seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — spaltensummennormierte Nutzenbedeutung S⁺ plus der Term der inversen Kostenbedeutung, die relative Bedeutung Q und der Nutzengrad U = Q/max Q (beste Alternative = { "1" })

# text
seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — eine unabhängige MCDA-Bibliothek eines Drittanbieters, die dieselbe eindeutig definierte relative Bedeutung/den Nutzen von COPRAS berechnet. pyDecision wird bewusst verwendet: COPRAS in pymcdm { "1.4.0" } kollabiert algebraisch zum trivialen S⁺+S⁻ und ist keine getreue Referenz, während pyDecision das kanonische Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)) umsetzt. Übereinstimmend bis <{ "1e-9" }; offline neu erzeugbar mit tests/fixtures/mcda_copras/generate_copras_reference.py

# text
seg-bdb2917a2520 = CUSUM-Änderungserkennung: Latenz und ARL

# text
seg-302f5db625df = Ungünstigste Erkennungslatenz des tabellarischen CUSUM-Detektors (⌊h/(z−k)⌋+{ "1" }) und mittlere Lauflänge außerhalb der Kontrolle, verwendet von den Monitoren für Zeitgebungs-Schutzniveau und Spoofing

# text
seg-691a506ce13f = Veröffentlichte ARL des tabellarischen CUSUM: Siegmund-({ "1985" })-Näherung durch Brownsche Bewegung (Hawkins & Olwell { "1998" }, Gl. { "3.7" }), quervergleichend verankert an den ARL-Tabellen aus Montgomery, Introduction to Statistical Quality Control (Wiley) für k=½, h∈{ "{" }{ "4,5" }{ "}" }; die deterministische Latenz stimmt exakt mit einer Erstpassage-Referenz überein. Die zusammengesetzte TPL-Schranke bleibt MODELLED

# text
seg-d923a77bd31a = Uhr-Holdover: Auslaufvarianz und Schwellenumkehrung

# text
seg-4fafaf5f919d = Wachstum der Phasenfehlervarianz im Auslauf q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 und seine monotone Umkehrung zu einer Holdover-Schwelle für den Zeitgebungsfehler

# text
seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm berechnet das diskrete Van-Loan-({ "1978" })-Prozessrauschen Q₀₀ = ∫₀ᵗ ΦQcΦᵀds über Padé-Skalierung und Quadrierung auf der augmentierten { "6" }×{ "6" }-Matrix — ein unabhängiger Weg, der die polynomialen Koeffizienten von kshana nie sieht; dazu optimize.brentq, das dieselbe monotone Kurve umkehrt, im Vergleich zur Bisektion von kshana. Die Kennwerte der Rotrauschgrenze je Klasse (ClockClass) bleiben MODELLED

# text
seg-eb3cd9e92d8d = Inverser Simpson-Diversitätskern

# text
seg-244d57819f2b = Effektive architektonische Diversität = inverser Simpson-Index / Hill-Zahl der Ordnung 2, 1/Σpᵢ², über die Quellenqualitäten je Unabhängigkeitsgruppe (der Diversitätsterm im Resilienzwert)

# text
seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — eine unabhängige Bibliothek eines Drittanbieters, die den eindeutig definierten inversen Simpson-Index berechnet; byteweise reproduziert. Das darauf aufbauende Bewertungsgerüst DHS-RPCF (Gewichte/Stufen) bleibt MODELLED

# text
seg-c14b8fe46517 = Azimutabhängige Horizontmaske: sichtbare Menge, Azimut und Elevation sowie DOP unter der Maske

# text
seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: das geodätische (WGS-84) Azimut und die Elevation eines Satelliten von einem Bodenstandort aus, eine Azimut-/Elevations-Maskentabelle, linear im Azimut interpoliert mit Umbruch bei { "360" } Grad, die sichtbare Menge el >= max(mask_deg, mask(az)) sowie die DOP mit gemeinsamer Uhr und die ENU-und-Uhr-Kofaktormatrix dieser Menge (der Kern hinter orbit::dop). So entscheidet der Abschnitt [skyline] über die Sichtbarkeit in den Arten gnss-sim, jamming, leo-pvt, leo-pass und nmea-scenario und, mit dem Bodenstandort user_site, in orbit und integrity

# text
seg-578d7acd3288 = Orekit { "12.2" } (Apache-2.0): ein TopocentricFrame auf einem WGS-84-OneAxisEllipsoid für die Blickwinkel und eine ElevationMask je Tabelle, ausgeführt von xval/orekit-skyline/OrekitSkyline.java auf eingecheckten erdfesten Zuständen (die Propagation wird nicht verglichen), mit gnss_lib_py { "1.0.4" } (Wheel-Metadaten MIT) get_dop für die DOP und die ENU-und-Uhr-DOP-Matrix der Mengen, die Orekit als sichtbar findet. Vorab registriert (xval/orekit-skyline/PREREGISTRATION.md, Commit e4b9d912), bevor eine der beiden Referenzen auf den Vergleichseingaben ausgeführt wurde; die lineare Interpolation mit Umbruch von Orekit wurde vorher an einer synthetischen Sonde bestätigt. Geltungsbereich: Tabellenmasken, geodätische Blickwinkel, die maskierte sichtbare Menge und ihre DOP mit gemeinsamer Uhr sowie der Kofaktor. HIER NICHT geprüft: die Reduktionen für Straßenschlucht, Sektor und Gelände sowie die Voreinstellungen (ihre 360-Punkt-Tabellen gehen als Eingaben ein; Zeilen 'Street-canyon, sector and terrain reductions to a table' und 'Skyline presets'), die Uhrzustände je System und die Fehlerellipse (Zeile 'Horizontal error ellipse and per-system cofactor from the geometry covariance'), die GMST-Rotation des Bodenstandorts user_site in orbit/integrity und ihre Datierung jedes Propagators auf einen Zeitpunkt (Orekit erhält erdfeste Zustände) sowie jede reale Abschattung (nur Sichtlinie)

# text
seg-bbb1828b3db1 = Reduktionen von Straßenschlucht, Sektor und Gelände auf eine Tabelle

# text
seg-2864aec7be88 = skyline: die Straßenschlucht in geschlossener Form (Schnitt atan((h - a) / d) mit d = (w/2) / abs(sin(az - s)), offene Enden bei endlicher Länge), scharfkantige Sektoren im Uhrzeigersinn mit Umbruch und Geländepunkte, auf eine Tabelle reduziert mit dem Krümmungsabfall d^2/({ "2" } * 4/3 R); die Skyline ist ihr punktweises Maximum mit einer beliebigen Tabelle

# text
seg-50f1df206b30 = Intern: Die geschlossenen Formen werden gegen von Hand berechnete Werte geprüft (Elevationen der Wandoberkanten einer angegebenen Straße, die Bedingung für offene Enden, der Krümmungsabfall eines angegebenen Punkts). Keine externe Referenz: Die Entwurfsnotiz ordnet diese Reduktionen als MODELLED ein, und die ElevationMask von Orekit nimmt eine Tabelle, sodass der Vergleich der Zeile 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' ihre 360-Punkt-Tabellen als Eingaben liest und nicht prüft

# text
seg-3f3d657854ce = Skyline-Voreinstellungen (Stadtstraße, Hafeneinfahrt, Fjord, Containerterminal)

# text
seg-b915c06fa3f1 = skyline::PRESETS: vier REPRESENTATIVE Geometrien mit den angegebenen Abmessungen der Entwurfsnotiz und je einer Herkunftszeile: city-street (eine Schlucht, Straße { "0" } Grad, { "20" } m zwischen { "30" } m hohen Wänden, Antenne { "1.5" } m), harbour-approach (Sektoren: offen zur Seeseite über { "180" } Grad, Kaigebäude { "8" } Grad über { "90" } Grad, der Wellenbrecher { "3" } Grad), fjord (Gelände: Wände { "600" } m über der Antenne in je { "1.5" } km Abstand beiderseits einer Nord-Süd-Rinne, Krümmungsabfall angewendet), container-terminal (Sektoren: Stapel { "12" } Grad über der landseitigen Hälfte, Kranausleger { "35" } Grad und { "25" } Grad über zwei schmalen Sektoren); feldweise überschreibbar

# text
seg-44ae9b6289d9 = Keine: gewählte und angegebene Abmessungen, keine Vermessung einer Straße, eines Hafens, eines Fjords oder eines Terminals (das Seitenverhältnis der Straße liegt im Band 0.5-2 von Oke ({ "1988" }); der Fjord liegt in der Größenordnung der westnorwegischen Fjorde; die Stapel verwenden die High-Cube-Höhe nach ISO { "668" }). Der Test prüft die Voreinstellungen gegen ihre eigenen angegebenen Abmessungen, eine Transkriptionsprüfung, die die Validierungsregel nicht zählt

# text
seg-2c53381d48ae = Horizontale Fehlerellipse und Kofaktor je System aus der Geometriekovarianz

# text
seg-15fea5c05cbd = geometry::sky_geometry: der ENU-und-Uhr-Kofaktor (H^T H)^-1 mit einer gemeinsamen Empfängeruhr oder einer je System (der Kern orbit::cofactor_from_los) und die horizontale Fehlerellipse aus seinem Ost-Nord-Block (Halbachsen k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), das Azimut der Hauptachse von Nord aus)

# text
seg-1982bafa3466 = numpy { "2.5.4" } (BSD-3-Clause), xval/numpy-ellipse/ellipse.py: numpy.linalg.inv von G^T G und numpy.linalg.eigh seines horizontalen Blocks auf den eingecheckten Eingaben, eine unabhängige numerische Bibliothek, die Inverse und Eigenzerlegung mit eigenen Algorithmen ausführt (Standard P2). Vorab registriert in xval/numpy-ellipse/PREREGISTRATION.md (Commit 0bbeeaee) vor dem Lauf; die Ausgabeformatierung des Treibers wurde nach der Vorregistrierung einmal korrigiert (ein numpy-Skalar, geschrieben als np.float64(...)), ohne Änderung am Protokoll oder an den Toleranzen. Die validierte Aussage ist die lineare Algebra auf diesen Eingaben; das gaußsche Fehlermodell und der UERE sind angegebene Eingaben, keine gemessene Genauigkeit und keine Integritätsschranke

# text
seg-6012113b4836 = Himmelsgeometrie-Funktionen: Sichtbarkeit, DOP, Kovarianz, Fehlerellipse, Monte-Carlo-Wolke

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> und <c2/>, Python- und WASM-Funktionen gleichen Namens, MCP <c3/>): aus einem Standort, einer Zeit und Konstellationsvoreinstellungen (oder Satelliten als Azimut/Elevation oder ECEF) die sichtbaren und unter einer Skyline maskierten Satelliten, GDOP/PDOP/HDOP/VDOP/TDOP, den Kofaktor mit Einheitsvarianz (H^T H)^-1 und die Kovarianz in Ost-Nord-Oben mit einer Empfängeruhr je System oder einer gemeinsamen, die horizontale Fehlerellipse (Halbachsen k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), Orientierung { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) von Nord aus) sowie n gesäte Kleinste-Quadrate-Fehler bei unabhängigen gaußschen Entfernungsfehlern mit ihrer empirischen Kovarianz, dem RMS und der { "95" }-%-Einschließung. Der Kofaktor ist orbit::cofactor_from_los, der eine Kern hinter orbit::dop und orbit::dop_cov (dop ist die Reduktion von dop_cov): keine zweite DOP-Implementierung

# text
seg-aa0da1028636 = Die DOP-Faktoren mit einer Uhr beruhen auf dem gegen gnss_lib_py { "1.0.4" } validierten Kern (Zeile 'GNSS geometry / dilution of precision (DOP)'); die eigenen Prüfungen dieser Zeile sind intern: sky_geometry reproduziert orbit::dop und dop_cov auf derselben Geometrie, die Ellipse reproduziert eine analytische 2x2-Eigenzerlegung, ECEF- und Azimut/Elevations-Eingaben stimmen überein, und RMS und { "95" }-%-Einschließung der gesäten Wolke stimmen mit der Geometrie überein. Die ENU-Kovarianz mit einer Uhr je System und die Ellipse sind in der Zeile 'Horizontal error ellipse and per-system cofactor from the geometry covariance' VALIDATED (numpy, P2); MODELLED bleibt hier die Komposition: die Propagation der Voreinstellung zu einem repräsentativen Himmel, die Monte-Carlo-Wolke (gegen die Geometrie geprüft, die sie abtastet, eine Selbstkonsistenzprüfung) und die Oberflächen. Die Konstellationsvoreinstellungen liefern einen repräsentativen, keinen datierten Himmel; das gaußsche Fehlermodell und der UERE sind angegebene Eingaben, keine gemessene Genauigkeit und keine Integritätsschranke

# text
seg-7f66be0f15c8 = GNSS-verweigerter Uhr-Holdover

# text
seg-4d8f87668a0f = Wachstum des Auslauffehlers in geschlossener Form + Holdover bis zur Schwelle; Quantenuhr-Klassen

# text
seg-2d260626e3d2 = Mehrschrittige Rekursion der clock_state-Kovarianz (Gegenprüfung innerhalb derselben Codebasis); der zugrunde liegende Kern für Auslaufvarianz und Holdover-Umkehrung ist extern gegen scipy validiert (siehe 'Clock-holdover coast-variance & threshold inversion'). Die Holdover-Kennwerte je Klasse mit Rotrauschgrenze bleiben MODELLED

# text
seg-29b482d88916 = Gemessene Uhren-Gerätekarten (Vorhersage am zurückgehaltenen Datensatz)

# text
seg-8c68c5b25004 = clock_library: eine Gerätekarte (weiße Phase, weiße, Flicker- und Random-Walk-FM plus eine lineare Frequenzdrift), angepasst an ein Drittel einer benannten gemessenen Uhrenaufzeichnung nach einem protokollierten Aufbereitungsdurchlauf (Lücken, Phasenausreißer, Phasensprünge, Bursts entfernt; Frequenzsprünge protokolliert), gewichtet nach den über Lag-1 identifizierten Freiheitsgraden der Rauschtypen, und ihre vorhergesagte Allan-Abweichung, bewertet an den zurückgehaltenen zwei Dritteln; Leser für RINEX- und IGS-Uhrendateien, BIPM-Dateien je Laboratorium und Circular T Abschnitt { "1" }; Umwandlung einer Karte in das Rauschmodell der Slot-Zeitgebung, das erweiterte Kalman-Uhrenmodell und die Rauschpegel des Spoofing-Monitors

# text
seg-af2d78e2986c = Gemessene Aufzeichnungen, zurückgehalten: IGS-Final-Kombinationsuhren im { "30" }-s-Takt der { "11" } GPS-Block-IIF-Satelliten vom 2026-03-01 bis { "14" } (ein Fenster, das kein Test geöffnet hatte; IGS, offen mit Namensnennung) und der u-blox-ZED-F9P-Empfänger aus JammerTest { "2024" } in seinen nicht bewerteten stationären Sitzungen (GPL-3.0-or-later). Externer D9-Vergleich (vorab registriert 2ec76864, vorhergesagte / gemessene Allan-Abweichung jeder Karte innerhalb von [1/1.5, { "1.5" }] bei ihren angepassten Mittelungszeiten), ein Befund (bleibt MODELLED): { "10" } von { "11" } GPS-IIF-Karten liegen innerhalb des Zielwerts; G27 ist auf der Zwei-Stunden-Skala optimistisch ({ "0.662" } bei { "7680" } s, ungünstigster Faktor { "1.510" }), der periodische Fehler im Stundenbereich, den eine Potenzgesetz-Karte nicht abbildet. Die TCXO-Karte des Empfängers ist blockiert: Außerhalb der protokollierten Übertragungen lassen die übrigen Sitzungen des Datensatzes { "167" } Epochen gegenüber den erforderlichen { "3600" }. Berichtet, nicht blind (Aufzeichnungen, die frühere Zeilen geöffnet haben): Die Cäsiumkarte des 5071A liegt innerhalb des Zielwerts (ungünstigster Wert { "1.070" } bis { "4096" } s), die OCXO-Karte ist konservativ und liegt außerhalb ({ "2.348" } bei { "128" } s; ihr Rauschpegel ändert sich im Verlauf der Aufzeichnung), und die an den drei kürzesten veröffentlichten Punkten angepasste Strontiumkarte von Norcia liegt an den zwei bewerteten Punkten innerhalb ({ "1.291" }, { "1.405" }). Galileo-Passive-Hydrogen-Maser (keine ohne Anmeldung erreichbare Quelle finaler Galileo-Uhren) und die Deep Space Atomic Clock (ein offener Wert aus dem Weltraum) sind blockiert. D9 Runde { "2" }, der TCXO des ZED-F9P-Empfängers als Modellklasse an { "14" } Tagen von { "12" } statischen Stationen in Wrocław (Zenodo { "6488497" }, CC BY { "4.0" }; vorab registriert fb475550), ein Befund: Mit der registrierten Pipeline waren { "11" } von { "12" } Stationen nicht auswertbar (RAIM verwarf die meisten ionosphärenfreien Epochen) und BX14 scheiterte; ein offengelegter Wiederholungslauf mit korrigierter Pipeline (vorab registriert c9cc0d49) besteht { "1" } von { "11" } blinden Stationen (BX12, { "1.412" }; BX07 { "1.532" } und BX13 { "1.542" } knapp außerhalb), weil Einzelpunkt-Empfängeruhren aus lückenhaften { "30" }-s-Dateien keine saubere Oszillatoraufzeichnung sind

# text
seg-5097a0e6460d = Gemessene GPS-Block-IIF-Uhrenkarten mit Termen je Umlauf (Vorhersage am zurückgehaltenen Datensatz)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: eine Gerätekarte, die die ein- bis vierfach pro Umlauf auftretenden Phasenterme trägt (Periode T/k, T = { "43 082.05" } s), gemeinsam mit dem quadratischen Anteil nach der Methode der kleinsten Quadrate an einem Drittel einer gemessenen Satellitenuhr-Aufzeichnung angepasst, mit dem Allan-Beitrag jedes Terms in geschlossener Form { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } in der vorhergesagten Allan-Abweichung

# text
seg-83981cd13a17 = Gemessene Aufzeichnungen, zurückgehalten: IGS-Final-Kombinationsuhren im { "30" }-s-Takt der { "11" } GPS-Block-IIF-Satelliten vom 2026-04-01 bis { "14" } (ein Fenster, das kein Test geöffnet hatte; IGS, offen mit Namensnennung). Externer D9-Vergleich (vorab registriert fb475550, vorhergesagte / gemessene Allan-Abweichung innerhalb von [1/1.5, { "1.5" }] bei jeder angepassten Mittelungszeit auf jedem Satelliten), ein Befund (bleibt MODELLED): { "9" } von { "11" } Karten liegen innerhalb des Zielwerts; G03 ({ "1.947" }) und G25 ({ "1.581" }) sind zwischen { "60" } s und { "2000" } s optimistisch, weil ihre zurückgehaltenen Aufzeichnungen verrauschter sind als ihre Anpassungsdrittel (der zurückgehaltene Teil von G25 enthält { "16" } Lücken und { "29" } Phasenausreißer), eine Änderung der Uhr statt eines fehlenden periodischen Terms. Das Weglassen der periodischen Terme aus der Vorhersage lässt alle { "11" } Karten scheitern ({ "1.77" } bis { "4.96" }), sodass die Terme die Vorhersage tragen

# text
seg-0d72fcc0fbea = Zustandsschätzung der Bordatomuhr

# text
seg-6db5391f8ebe = Kalman-Uhr nach Van Loan mit 3 Zuständen (Phase/Frequenz/Drift), Joseph-stabilisiert

# text
seg-f41b4c81df2a = filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), mit F über scipy.linalg.expm und Q über die Blockmatrix nach Van Loan ({ "1978" }) — eine unabhängige Referenzimplementierung, die die vollständige Filtertrajektorie von kshana reproduziert. Konsistenz zwischen Implementierungen: Die Uhrenphysik und die Allan-Kalibrierung sind nicht extern validiert, daher bleibt dies MODELLED. Externer Vergleich { "0.30" }, ein Befund (bleibt MODELLED): an IGS-Final-Uhren im { "30" }-s-Takt von { "11" } GPS-Block-IIF-Satelliten (2025-08-17 bis { "30" }), mit an die ADEV der ersten Hälfte angepasstem Q und an der zurückgehaltenen zweiten Hälfte bewertetem Filter ist der Filter einen Schritt voraus konsistent ({ "0.906" } bis { "0.971" } der Epochen innerhalb seines { "95" }-%-Bandes, Zielwert { "90" } %), aber bei einer Stunde auf { "9" } von { "11" } Uhren überzuversichtlich ({ "0.486" } bis { "0.829" }), und seine Innovationssummen fallen bei { "5" } außerhalb von [{ "2.4" }, { "3.6" }]. Das angepasste weiße Phasenrauschen ist auf jedem Satelliten null, und der Fehler im Stundenbereich (periodische Terme, Flicker-FM) ist im 3-Zustands-Modell nicht enthalten. { "0.30" } Runde { "2" }, ein erweiterter Filter (Flicker-FM und Zustände für ein- und zweimal pro Umlauf) an frischen zurückgehaltenen IGS-Uhren von 2025-09-01 bis { "14" } (vorab registriert 4b1a841e), ein Befund (bleibt MODELLED): Die Konsistenzkriterien für einen Schritt und für eine Stunde gelten auf allen { "11" } Satelliten ({ "0.948" } bis { "0.988" } und { "0.907" } bis { "0.996" }), aber das Innovationssummen-Kriterium scheitert bei G24 ({ "0.964" }) und G30 ({ "1.929" }) gegenüber [{ "2.4" }, { "3.6" }]. D9 Runde { "3" }, der erweiterte Filter aus Runde 2, Abstimmung und Kriterien unverändert nach dem eingefrorenen Aufbereitungsdetektor von clock_library, an frischen IGS-Uhren von 2026-04-01 bis { "14" } (vorab registriert fb475550), ein Befund (bleibt MODELLED): (a) Ein Schritt { "0.941" } bis { "0.968" } und (c) Dreifach-NIS-Mittelwert { "2.641" } bis { "3.549" } gelten auf allen { "11" } Satelliten; (b) eine Stunde scheitert bei G09 ({ "0.894" }) und G26 ({ "0.876" }) gegenüber { "0.90" }

# text
seg-3f0a9d7c2971 = Fehlerbudgetierung der Zeitübertragung

# text
seg-216f46b43860 = Zweiweg/TWSTFT (Sagnac), GNSS-Common-View, PPP; Link-Jitter→Entfernung

# text
seg-e7b6aac2ec58 = Sagnac-Betrag geprüft gegen einen maßgeblichen VERÖFFENTLICHTEN WERT — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Gl. { "1.29" }: Eine ostwärtige Umrundung am Äquator summiert { "207.4" } ns auf (2ωA_E/c²); kshana reproduziert { "207.386" } ns. Unabhängig bestätigt durch RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), das dieselbe 2Aω/c²-Geometrie trägt. Das zusammengesetzte BIPM-Budget für TWSTFT-Transponder/Common-View/PPP hat keine externe Referenz, daher bleibt die Fähigkeit modelliert

# text
seg-157fadeb5d67 = Modulation von Navigationssignalen und Code-Tracking-Analyse

# text
seg-ab633d191396 = BPSK-R/BOC-PSD, Spektraltrennung κ, Gabor-Bandbreite, DLL-Jitter, Mehrwegeausbreitung

# text
seg-94f0c4fc2930 = GPS-C/A-Gold-Kreuz-/Autokorrelation stimmt EXAKT (ganzzahlig ±65/−1/63) mit einer unabhängigen Codeerzeugung nach IS-GPS-200 überein; PSD-Form von BPSK-R({ "1" })/BOC({ "1,1" }) gegenüber einem unabhängigen scipy-Periodogramm. Die geschlossenen Formen für Modulation/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) bleiben analytisch, daher bleibt die Zeile MODELLED — aber die Teilaussage zur Codekorrelation ist extern abgeglichen. { "0.30" } Runde { "2" }, gegen die gedruckten Werte von Betz { "2001" } und Hein et al. { "2006" } (vorab registriert 9f4f2ce8, eine halbe gedruckte Einheit), ein Befund (bleibt MODELLED): Alle { "45" } Spektralzellen von Tabelle { "1" }, die Korrelationswerte bei { "1" } GHz, die MBOC-Störungswerte und { "2" } von { "3" } Offsets in Abb. { "17" } stimmen überein; die ersten Nebenkeulen bei { "24" } MHz, der Offset von BOC({ "8,4" }) in Abb. { "17" } und jeder ungünstigste Mehrwege-Bias in Abb. 18-21 ({ "11" } bis { "15" } % zu niedrig) stimmen nicht überein. Kshana und eine unabhängige NumPy-Auswertung der vorab registrierten Lesart stimmen überein, die Lücke liegt also in dieser Lesart oder in einem nicht angegebenen Detail der Veröffentlichung; Ursache ungeklärt

# text
seg-589e0053e3e8 = Erzeugung des GPS-L1-C/A-Spreizcodes

# text
seg-782d4da75b59 = G1/G2-LFSR-C/A-Code-Generator, der die in IS-GPS-200 veröffentlichten oktalen Verifikationsvektoren der ersten 10 Chips für PRN { "1" }–{ "9" } reproduziert (dazu Länge von 1023 Chips, Balance von 512 Einsen, dreiwertige periodische Autokorrelation)

# text
seg-473f24d4e06a = IS-GPS-200 Tabelle 3-Ia 'Code Phase Assignments' — die maßgeblichen, gemeinfreien, veröffentlichten OKTALEN Verifikationsvektoren der ersten 10 Chips der US-Regierung (GPS Directorate, navcen.uscg.gov); der eigene G1/G2-LFSR von kshana erzeugt jeden Vektor für PRN { "1" }–{ "9" } exakt neu. Die nachgelagerten geschlossenen Formen für Modulation/SSC/DLL bleiben modelliert (eigene Zeile)

# text
seg-e6c08e1e6ae3 = Leistungsfähigkeit von Quanten-Inertialsensoren

# text
seg-d28e1f6a430f = Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN)

# text
seg-57fd0a6e5d72 = Veröffentlichte numerische Vektoren der CAI-Primärarbeiten (Übertragungsfunktion nach Cheinet { "2008" }; Empfindlichkeit nach Peters/Freier): k_eff·T² stimmt exakt überein, das Schrotrausch-ASD ist eine einseitige Untergrenze innerhalb von ~{ "2" }× jedes veröffentlichten Instruments (reale Geräte tragen technisches Rauschen oberhalb der Quantengrenze). Eine Eingrenzung, keine Gleichheit. { "0.30" } Runde { "2" } (vorab registriert fcb9ac64), ein Befund (bleibt MODELLED): Das reine QPN-Rotationsrauschen gegenüber den gemessenen Punkten in Abb. { "14" } von Gauguet et al. { "2009" } ergibt Verhältnisse von { "0.695" } bis { "0.788" } an den drei berücksichtigten Punkten ({ "0.751" } am Arbeitspunkt) und verfehlt den vorab registrierten { "30" }-%-Zielwert um { "0.5" } Punkte; die QPN-Grenze liegt { "21" } bis { "31" } % unter dem gemessenen Rauschen, wie bei einem Modell ohne Laser- und Detektionsrauschen zu erwarten. Die Gradiometer-Komposition stimmt mit der QPN-Modelllinie von Janvier et al. { "2022" } überein (Verhältnis { "1.013" } bis { "1.017" }, Referenz). Der gemessene Test kann einen sqrt({ "2" })-Kompositionsfehler nicht unterscheiden; nur die Janvier-Linie mit ungleichem Kontrast kann das

# text
seg-4b79d03cecf5 = Streifenmehrdeutigkeit / Dynamikbereich von Quanten-Inertialsensoren

# text
seg-deb2850546d5 = Streifenmehrdeutigkeits-Dynamikbereich des Mach-Zehnder-Interferometers: Die 2π-periodische Streifenauslesung legt eine maximale eindeutige spezifische Kraft a_max=π/(k_eff·T²) fest, und der eindeutige Bereich in Auflösungszellen a_max/σ_a=π/σ_Φ ist unabhängig vom optischen Skalenfaktor — der Empfindlichkeitsgewinn mit T² kostet eindeutigen Bereich in exaktem Gleichschritt (die Abfragezeit tauscht Auflösung gegen Bereich, wobei die Zellenzahl durch das Phasenrauschen der Auslesung festgelegt bleibt)

# text
seg-7603ff7a7693 = Selbstkonsistenz des Interferometer-Streifenmodells: die Halbstreifenkante, die 2π-periodische Aliasing-Struktur und die Kürzung des Skalenfaktors im Verhältnis von Bereich zu Auflösung sind algebraische Identitäten in geschlossener Form, geprüft gegen die eigenen Mach-Zehnder-Phasen- und Empfindlichkeitsfunktionen der Engine — Prüfungen der internen Konsistenz, KEIN externer Datensatz, daher bleibt die Zeile InternalConsistency. MODELLED idealer Dreipuls-Streifenmehrdeutigkeit; keine Schranken für Wellenfrontaberration oder Kontrastverlust auf den eindeutigen Bereich

# text
seg-d04bf321d4a1 = Resilienz der Quanten-Inertial-Koppelnavigation

# text
seg-c4989abb5d40 = Zusammengesetztes Positionsbudget aus Bias + Skalenfaktor + VRW + Stabilitätsabfall über den Holdover

# text
seg-bfe4085115c1 = Unabhängige numpy-Monte-Carlo-SDE-Integration von doppelt integriertem weißem Beschleunigungsrauschen (validiert die analytische VRW-Varianz durch einen wirklich unabhängigen Algorithmus) + ein Anker auf dem veröffentlichten Wert von Groves { "2013" } für die Bias-/Skalenfaktor-Terme; die CAI-Gerätewerte quantifizieren Partner-Hardware und bleiben MODELLED

# text
seg-bc6e733c39b3 = GNSS/INS-Sensorfusion

# text
seg-16514286bb51 = 15-Zustands-Fehlerzustands-EKF, lose gekoppelt (validiert an einer realen IMU/GNSS-Fahrt gegen NaveGo); ein eng gekoppelter Pseudorange/Doppler-UKF und ein gekoppeltes Uhr+Position-Filter (nur Konsistenz, außerhalb der validierten Aussage)

# text
seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, als Werkzeug unter GNU Octave ausgeführt, nie gelinkt): sein lose gekoppeltes ins_gnss auf seiner eigenen realen Ekinox-IMU/GNSS-Landfahrzeugfahrt, beide Lösungen bewertet gegen die Ekinox-Referenztrajektorie. Beide Filter lesen dieselbe { "20" }-Hz-float32-Eingabe, und die Konfiguration von Kshana wird mechanisch aus den veröffentlichten Parametern des Datensatzes abgebildet. Der horizontale und vertikale Positions-RMS von Kshana und sein Positionsinnovations-RMS liegen innerhalb von 1.2x von NaveGo (gemessen { "0.912" }, { "0.940" } und { "0.861" }), und seine mittlere normierte Innovation beträgt höchstens { "1.5" } (gemessen { "0.395" }: etwa 2.5x unterkonfident, gegeben die angegebenen GNSS-Sigmas des Datensatzes); Toleranzen vor dem Vergleich festgelegt. Geltungsbereich: GNSS ist während der gesamten Fahrt mit { "5" } Hz vorhanden, daher wird kein Ausfall und kein Auslauf getestet, und die Prüfung erfasst grobe Filterfehler statt Feinabstimmung (hebelarmkorrigierte Rohlösungen kämen nahe an den vertikalen Zielwert); die Hebelarmtransformation wird im Test-Harness berechnet. Der eng gekoppelte UKF und das gekoppelte Uhr+Position-Filter behalten ihre filterpy-{ "1.4.5" }-Konsistenzprüfungen (lineare Posterioren bis { "2.4e-12" }) und bleiben außerhalb der validierten Aussage

# text
seg-5692c7b936b6 = GNSS-verweigerte Jamming-Resilienz

# text
seg-f4ff77caa47b = Geometrie-J/S-Link-Budget, Anti-Jam-C/N₀, Lock-Verlust je Satellit

# text
seg-daf317735edb = Die Link-Budget-Gleichung für das Anti-Jam-C/N₀ wurde gegen eine unabhängige numpy-Neuherleitung gegengeprüft (teilt dieselbe geschlossene Form → InternalConsistency) plus eine Charakterisierung der C/N₀-Verschlechterung aus dem realen JammerTest 2024. { "0.30" } Runde { "2" }, blockiert (bleibt MODELLED): Der gemessene C/N0-Abfall im JammerTest { "2024" } gegenüber einer Link-Budget-Vorhersage (vorab registriert 6a66994b, innerhalb von { "3" } dB) wurde nicht ausgeführt, weil die Position und Ausrichtung der F8.1-Antenne bei Bleik und der L1-Anteil der Rampenleistung im Multiband-{ "1.6.4" } im Testkatalog und im offiziellen Protokoll nicht dokumentiert sind

# text
seg-ff90679d1de9 = Spoofing-Erkennung

# text
seg-b843f63e77e6 = Uhrgestütztes χ², RAIM, AGC, SQM, fusioniert zu einer Sicherheits-FoM je Epoche

# text
seg-baeb1c3db11f = TEXBAT-Szenarioparameter (Humphreys { "2012" }) — Charakterisierung, keine festgelegten Vektoren. Externer Vergleich { "0.30" }, ein Befund (bleibt MODELLED): Im JammerTest { "2024" } (Bleik; GPL-3.0-Daten) lösten die Monitore auf Beobachtungsebene (uhrgestütztes Chi-Quadrat, RAIM, Lösungsfehler) bei keinem der { "8" } auswertbaren veröffentlichten Spoofing-Beginne innerhalb von { "10" } s einen Alarm aus (wo das Fenster vor dem Beginn sauber war, kam der erste Alarm { "10.2" } bis { "39" } s nach dem veröffentlichten Slot-Beginn), und drei Fenster vor dem Beginn trugen Fehlalarme des Uhrenmonitors ({ "81" }, { "64" } und { "173" } Epochen). Die erste beobachtbare Wirkung war ein Verlust des Zweifrequenz-GPS-Trackings, keine RAIM-Inkonsistenz. Die veröffentlichten Beginne sind auf die Minute aufgelöste Slot-Anfänge des Zeitplans; dass sie der HF-Aufzeichnung vorausgehen, ist eine Interpretation, keine Messung. { "0.30" } Runde { "2" }, gegen das offizielle JammerTest-{ "2024" }-Protokoll der Veranstalter (Sekundenauflösung; vorab registriert 6a66994b mit einem Hadamard-kalibrierten Drei-Zustands-Uhrenmonitor ohne Latching), ein Befund (bleibt MODELLED): Der Monitor alarmiert bei { "4" } von { "10" } protokollierten Beginnen innerhalb von { "10" } s; bei den anderen sechs ist er { "18" } bis { "211" } s zu spät oder löst Uhren-Fehlalarme vor dem Beginn aus ({ "1" } bei { "2.1.4" }, { "85" } bei { "2.3.15" }). D9 Runde { "3" } (eine Empfängerkarte aus den anderen Sitzungen der JammerTest-Einheit, vorab registriert 2ec76864) blockiert: { "167" } Trainingsepochen gegenüber { "3600" }. D9 Runden { "4" } und 4b (Rauschpegel aus einer Modellklassenkarte des u-blox ZED-F9P, Wrocław { "2021" }, vorab registriert fb475550; 4b ein offengelegter Wiederholungslauf mit korrigierter Extraktion, c9cc0d49), ein Befund (bleibt MODELLED): null Fehlalarme vor dem Beginn bei allen { "10" } protokollierten Beginnen und { "6" } von { "10" } innerhalb von { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } und { "2.6.1" } bleiben zu spät (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), unverändert durch den Uhrenrauschpegel

# text
seg-b10d07921f5e = Zeitgebungs-Schutzniveau unter Spoofing

# text
seg-2a829711b997 = Schranke in geschlossener Form für den ungünstigsten unentdeckten Zeitfehler = Monitor-Untergrenze + Oszillator-Auslauf-σ über die CUSUM-Erkennungslatenz, angegeben als Band der Rotrauschgrenze

# text
seg-682251b2e3c7 = Setzt validierte Primitive zusammen (Allan/Holdover nach Van Loan, Sicherheitsuntergrenze); kalibriert am JammerTest-{ "2024" }-Szenario { "2.1.1" } (~{ "1.01" } ms realer Zug der gelieferten Zeit gegenüber ≤{ "51" } ns beansprucht). Brücke über validierte Teile — selbst keine externe Validierung. Externer Vergleich { "0.30" }, ein Befund (bleibt MODELLED): In den Spoofing-Szenarien des JammerTest { "2024" } übersteigt der gemessene unentdeckte Fehler der gelieferten Zeit das nominale TPL bei { "3" } von { "8" } erkannten Beginnen: { "184.3" } gegenüber { "34.6" } ns ({ "2.1.4" }), { "295.7" } gegenüber { "159.3" } ns ({ "2.3.5" }) und { "143.0" } gegenüber { "69.0" } ns ({ "2.3.11" }); drei der fünf innerhalb sind trivial (ein eingerasteter Fehlalarm vor dem Beginn). Wahrscheinliche Ursache: Der Auslaufterm aus einer { "60" }-s-Kalibrierung mit Drift-Rauschen null deckt das Frequenzwandern des Empfänger-TCXO über { "15" } bis { "39" } s nicht ab. Der gemessene Fehler ist die eigene Einzelpunkt-Uhrenschätzung von Kshana gegenüber einer Geraden, die an ihre eigenen Schätzungen vor dem Beginn angepasst wurde, sodass selbst Übereinstimmung nicht vollständig unabhängig gewesen wäre. { "0.30" } Runde { "2" }, gegen die Beginne im offiziellen JammerTest-{ "2024" }-Protokoll und den gemessenen Zeitfehler des Empfängers (vorab registriert 6a66994b), ein Befund (bleibt MODELLED): Bei { "4" } von { "10" } protokollierten Beginnen übersteigt der unentdeckte Fehler das TPL mit Driftzustand ({ "634.7" } gegenüber { "458.5" } ns bei { "2.1.1" }, { "232.6" } gegenüber { "16.2" } ns bei { "2.3.5" }, { "41.3" } gegenüber { "6.0" } ns bei { "2.3.10" }, { "218.6" } gegenüber { "47.4" } ns bei { "2.6.3" })

# text
seg-0ec37553bbc4 = Zislunare Missionsanalyse

# text
seg-a47465f682ba = CR3BP-STM + Einzelschuss-Differentialkorrektor; südliche NRHO um L2

# text
seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; südliche Halo-Familie um Erde–Mond-L2, Methodik nach Howell/Davis) — extern veröffentlichte Periode T, Jacobi-Konstante C und Anfangsbedingungen bei senkrechter Kreuzung; der Einzelschuss-STM-Korrektor von kshana, mit der Katalog-IC initialisiert und gestört, konvergiert zurück auf die Katalogmitglieder

# text
seg-f1d49eac89f8 = Alternatives / ergänzendes PNT

# text
seg-023dda973f66 = Schwerefeld-Kartenabgleich, geländereferenziert (TERCOM/SITAN), magnetische Anomalie

# text
seg-da869d48e505 = IGRF-14-Koeffizienten; CRLB des Matched Filters aus ersten Prinzipien. Das Feld des Schwerefeld-Benchmarks mit realem Feld ist extern geprüft (Zeile 'Gravity-anomaly synthesis from a spherical-harmonic model'), sein Navigationsergebnis hat jedoch keine externe Referenz

# text
seg-db7767ab661d = Synthese von Schwereanomalien aus einem Kugelfunktionsmodell

# text
seg-2db367c4a473 = Schwereanomalie in sphärischer Näherung (Barthelmes STR09/02 Gl. { "126" }, ICGEM gravity_anomaly_sa) aus voll normierten Koeffizienten gegen ein Niveauellipsoid in geschlossener Form (WGS84/GRS80), mit dem Term nullten Grades, gerastert für den Schwerekarten-Abgleicher

# text
seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), eine unabhängige Implementierung: EGM2008 bei Grad { "70" } abgeschnitten, gravity_anomaly_sa, WGS84, gezeitenfrei, Term nullten Grades, h = { "0" }. Die Ausgabe des Dienstes trägt keine ausdrückliche Lizenz, daher werden die Raster zur Testzeit mit einem fixierten SHA-256 abgerufen (tools/fetch_icgem_grid.sh) und nur zehn Werte mit Namensnennung zitiert

# text
seg-31f51d4998cb = SRTM-Höhenmodell-Leser auf realem Gelände

# text
seg-08ea4ae0b671 = Selbstgeschriebener SRTM-.hgt-Parser (16 Bit Big-Endian, Nordzeile zuerst, void-bewusst) + bilinearer Abtaster, der eine reale gemeinfreie DEM-Kachel liest und einen dokumentierten Vermessungs-Benchmark auflöst

# text
seg-791e7285c291 = Reproduzierbarkeit und Softwaresicherung

# text
seg-7177355a482c = Deterministische, szenario-gehashte Gates für SBOM + plattformübergreifende Golden-Werte

# text
seg-6cf9d570cc51 = Übereinstimmung der SBOM mit dem offiziellen CycloneDX-{ "1.5" }-JSON-Schema (+ gültige SPDX-Bezeichner) — ein extern veröffentlichter Standard, null Validierungsfehler über den gesamten Abhängigkeitsgraphen; der Teil zu FoM-Determinismus / Byte-Reproduzierbarkeit bleibt eine fixierte Selbstkonsistenzprüfung, daher bleibt die Zeile MODELLED

# text
seg-89b2114542bb = Evaluierung der KI/ML-Erkennung von HF-Störungen ({ "13494" })

# text
# c1: impairment-eval
seg-241f2eeaef12 = Gelabeltes synthetisches Störungskorpus + detektorunabhängiges ROC/AUC/Konfusions/Pfa-Pmd-Harness; Leckageschutz, stratifizierte Aufteilung, Bericht zur Optimismuslücke bei Verteilungsverschiebung (innerhalb vs. außerhalb des Regimes). Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/impairment-eval.toml)

# text
seg-72a3c97ef04b = AUC-Schranken in geschlossener Form (Mann–Whitney) + ein Detektor mit perfekter Referenz; das Korpus ist SYNTHETISCH (parametergestützt, nicht Feld/IQ)

# text
seg-c38ebee794b3 = Studie zur Optimismuslücke der KI/ML-Erkennung von HF-Störungen & Lückenprädiktor nur aus ID

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Kontrollierte synthetische Studie der AUC-Optimismuslücke von In-Distribution zu Out-of-Distribution über Detektoren veröffentlichter Methoden und gelernte Detektoren (logistische Regression / MLP mit einer verdeckten Schicht): Skalierungsgesetz-Trends je Klasse (Spearman ρ + Steigung über { "1" }−Schweregrad) und ein Ridge-Prädiktor nur aus ID, der die Lücke allein aus In-Distribution-Diagnosen schätzt, bewertet mit Leave-one-detector-out und Leave-one-class-out. Reproduzierbar über <c1/>

# text
seg-c46973920f5b = Von Hand abgeleitete Statistiken gegenüber Formeln in geschlossener Form (binormale AUC Φ(d'/√{ "2" }), DeLong-Varianz, Spearman mit Rangbindungen, exakte OLS-Wiedergewinnung) + Leave-one-out-CV gegenüber der Basislinie „den Mittelwert vorhersagen“. Das Korpus ist SYNTHETISCH (parametergestützt, nie Feld/IQ), und die Optimismuslücke ist eine Schweregradverschiebung von synthetisch zu synthetisch, KEIN Ergebnis von Simulation zu Feld

# text
seg-fd6424213d1f = Abwägung Quanten- gegenüber klassischem PNT & GNSS-verweigerte Resilienz ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Einlesen gemessener ADEV (NNLS), Abwägungstabelle (Zeitgebungs-/Inertial-Holdover + Nutzen), Hüllkurve Resilienz über Zeit; der Hinweis zur Untergrenze wird am Artefakt mitgeführt. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/quantum-trade.toml)

# text
seg-37d11937c966 = Der Kern der Anpassung gemessene ADEV→PSD (NNLS) stimmt mit scipy.optimize.nnls überein (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — ein unabhängiger externer Kern; aber die ZAHLEN der Abwägung quantifizieren (und validieren nie) eine Uhr/CAI des Partners, daher bleibt die Abwägung selbst MODELLED, ohne Validierungs-Nimbus

# text
seg-1fa865bfddd1 = Weltraumwetter-Umgebung & aktivitätsgetriebene thermosphärische Dichte

# text
# c1: space-weather
seg-47308f611c7e = Solare/geomagnetische Indizes (definitorische Kp↔ap-Tabelle), die exosphärische Temperatur nach Jacchia-1971 und die thermosphärische Dichte nach Jacchia { "1971" } (SAO Special Report { "332" }: statische Diffusionsprofile, die dessen Tabelle { "7" } reproduzieren, mit den tageszeitlichen, geomagnetischen, halbjährlichen, jahreszeitlich-breitenabhängigen und Helium-Variationen) gegenüber der statischen Atmosphäre USSA76. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/space-weather.toml)

# text
seg-1cad4329e226 = Definitorische Kp↔ap-Tabelle + geschlossene Form der exosphärischen Temperatur nach Jacchia-1971 (übereinstimmend bis <{ "1" } K gegenüber den veröffentlichten Ankern, tests/space_weather_reference.rs); die Dichte wird gegen pymsis NRLMSISE-00 (ein unabhängiges NRL-Modell) charakterisiert: Der Schwankungsfaktor des Sonnenzyklus bei { "800" } km beträgt 10.4x gegenüber 13.6x bei NRLMSISE-00. Revision { "0.30" }: Der kalibrierte Aktivitätsfaktor erster Ordnung wurde durch Jacchia { "1971" } ersetzt (Dichte des Standardszenarios bei { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k entfernt, mean_exospheric_temperature_k hinzugefügt). { "0.30" } Runde { "2" }, gemessene TOLEOS-Beschleunigungsmesserdichten von CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; vorab registriert 20eed695), ein Befund (bleibt MODELLED): Bahnmittelwerte bei { "400" } bis { "500" } km liegen im Sonnenmaximum außerhalb von Stürmen innerhalb eines Faktors { "2" } (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), aber Jacchia { "1971" } ist im Sonnenminimum { "2008" } um etwa 1.7x zu dicht (GRACE-A 412/544 innerhalb eines Faktors { "2" }), daher ist die Dichte nicht validiert

# text
seg-29bedb28c34f = CCSDS-OEM-Interoperabilität (Ephemeriden-Import aus GMAT/Orekit/STK)

# text
# c1: oem-interop
seg-edb58ffbbb5b = CCSDS-{ "502.0" }-OEM-Importer (parse_oem), tolerant gegenüber COMMENT-Zeilen / zusätzlichen Metadaten-Schlüsselwörtern / Kovarianzblöcken und die exakte Umkehrung des Writers; Round-Trip + Einlesen externer Dateien mit einer Geschwindigkeitskonsistenzprüfung. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/oem-interop.toml)

# text
# c1: oem
seg-bc507f96c4df = Unabhängiger CCSDS-502-Parser eines Drittanbieters <c1/> { "0.4.5" } (MIT, https://pypi.org/project/oem/) — eine getrennte Codebasis, die das von kshana ausgegebene EME2000/UTC-OEM byte-identisch dekodiert ({ "24" } Zustände in { "2" } Fixtures, Pos/Vel Δ = { "0" }) und deren strenger Leser die Metadaten-Token bestätigt; der Parser von kshana stimmt ebenso mit ihr an einem mitgelieferten externen OEM überein. Zwei ehrliche Interop-Befunde (die oem-Bibliothek lehnt die Mehrsegment-Konvention je Satellit von kshana und seine Kovarianzzeilen mit mehreren Einträgen ab) sind im Test dokumentiert — damit wird der Austausch einzelner Objekte validiert, nicht die vollständige Übereinstimmung jeder kshana-Variante mit CCSDS-502

# text
seg-c76b8c395ef0 = Startfenster & Aufstiegsgeometrie (Missionsanalyse)

# text
# c1: launch-window
seg-6066c634faba = Zweikörper-Startazimut(e) (sin Az = cos i / cos lat), minimal erreichbare Inklination, Kreisbahngeschwindigkeit, Ostbonus durch die Erdrotation, Δv des Dogleg-Ebenenwechsels und tägliche Gelegenheiten und, bei gegebener Epoche und IERS-finals2000A-Zeilen, die Standortgeschwindigkeit um den wahren Pol (launch::site_rotation_speed_at). Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/launch-window.toml)

# text
seg-2515ab37f99b = Startgeometrie der sphärischen Trigonometrie in geschlossener Form gegenüber veröffentlichten Ankern aus durchgerechneten Beispielen (Vallado, Fundamentals of Astrodynamics 4. Aufl., Algorithmus { "37" } Startazimut + Kap. 6 Ebenenwechsel; tests/launch_window_ascent_geometry_reference.rs). Diese verwenden dieselbe geschlossene Form, die kshana implementiert (eine Prüfung auf Gleichheit mit veröffentlichten Werten / Transkription, InternalConsistency); MODELLED Zweikörper, kein Geschwindigkeitsdreieck der rotierenden Erde / kein Aufstiegs- / Widerstandsverlustmodell. Externer Vergleich { "0.30" } gegen Orekit { "12.2" } (Apache-2.0), ein Befund (bleibt MODELLED): Die Geometrie stimmt bis auf Rundung überein (Inklination aus dem Brennschlussazimut zurückgelesen über { "158" } Fälle, ungünstigster Wert { "2.6e-15" } rad; minimale Inklination, Kreisbahngeschwindigkeit und Dogleg-Delta-v bis { "3e-16" }), aber die Standortgeschwindigkeit durch die Erdrotation verfehlt den vorab registrierten relativen Wert { "1e-6" } bei { "62.9" } Grad Breite ({ "1.12e-6" }). Die Lücke wächst wie tan(lat), im Einklang mit einem Polbewegungs-Polversatz von etwa { "5.8e-7" } rad im Erdsystem von Orekit, den das sphärische ω·R·cos(lat) auslässt. Die Aussage wurde vor dem Lauf nicht eingeengt, daher kann die Zeile auf Grundlage dieses Vergleichs nicht aufsteigen. { "0.30" } Runde { "2" } (vorab registriert 71bebf63): Mit einer Epoche und IERS-Zeilen stimmt die Standortgeschwindigkeit um den wahren Pol (Szenariofeld site_rotation_speed_true_pole_m_s) mit Orekit innerhalb von { "1e-6" } an { "24" } Standorten über vier Längengrade überein (ungünstigster Wert { "4.9e-8" }), aber die nominale Geschwindigkeit ohne Epoche, die das Szenario standardmäßig als Erdrotationsbonus ausgibt, verfehlt weiterhin um { "1.12e-6" }, daher bleibt die Zeile MODELLED, bis über die Standardausgabe entschieden ist

# text
seg-ff2cd766bb52 = Ballistischer Wiedereintrittskorridor (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Spitzenverzögerung (unabhängig vom ballistischen Koeffizienten), Geschwindigkeit + Höhe bei Spitzen-g und Geschwindigkeit der Spitzenerwärmung für einen ballistischen Eintritt in eine exponentielle Atmosphäre. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/reentry.toml)

# text
seg-121f02d79ae0 = Analytischer Allen–Eggers-Eintritt in geschlossener Form, zusätzlich gegengeprüft mit einer numerischen Integration (DOP853) von scipy { "1.18" } solve_ivp derselben reinen Widerstands-Eintritts-ODE (tests/ballistic_re_entry_corridor_reference.rs, { "36" } Fälle, ungünstigstes a_max rel { "2.9e-9" }) — eine Prüfung numerisches Integral gegen eigene analytische Form, daher weiterhin InternalConsistency, KEINE externe Validierung. MODELLED ballistisch (ohne Auftrieb), keine Aerothermik/TPS — die Erwärmungsausgabe ist eine Geschwindigkeit, keine Wärmestromdichte. Externer Vergleich { "0.30" }, ein Befund (bleibt MODELLED): Gegenüber der Rekonstruktion des Eintritts der Stardust-SRC (Desai und Qualls, NASA NTRS { "20080008567" }) beträgt die Allen–Eggers-Spitzenverzögerung für den gedruckten inertialen Eintrittszustand ({ "12.9" } km/s, -8.2 Grad, H { "7200" } m) { "61.8" } g gegenüber den { "32.89" } g der bestgeschätzten Trajektorie, +{ "88" } % gegenüber einer Toleranz von { "15" } %: Die Lösung mit konstantem Bahnwinkel ohne Gravitation verdoppelt ungefähr die Spitze eines flachen Eintritts mit Geschwindigkeit oberhalb der Fluchtgeschwindigkeit. Stardust trug keinen Beschleunigungsmesser, daher ist die Rekonstruktion eine Trajektorienschätzung. { "0.30" } Runde { "2" }, blockiert (bleibt MODELLED): Eine integrierte ebene Punktmassenlösung (reentry::simulate_planar_entry, US76, Gravitation mit inversem Quadrat, Krümmung) stimmt mit den bestgeschätzten Trajektorien von Stardust und Genesis innerhalb von { "15" } % überein (+{ "11.3" } %, +{ "5.6" } %), aber diese Maxima sind Simulationsausgaben von Agenturen, keine Messungen, daher ist dies nur eine Gegenprüfung. Der Vergleich mit dem Beschleunigungsmesser (vorab registriert a94a283d) ist blockiert, bis eine lesbare Kopie der REMM-Analyse von Hayabusa2 (doi 10.57350/jesa.16) vorliegt

# text
seg-8c10b50407d3 = Fußabdruck der EO-Nutzlast & Abdeckungsgeometrie

# text
# c1: eo-coverage
seg-45c1e799c87c = SMAD-Raumdreiecksgeometrie: Erdwinkelradius, Streifenbreite, GSD im Nadir, maximaler Off-Nadir-Zugriff und Kreisbahnperiode, dazu die J2-Knotenperiode erster Ordnung (eo_payload::j2_nodal_period) und der Bodenspuranstand am Äquator R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) mit einem Flag für lückenlose Abdeckung, für eine Bahnhöhe, Inklination und Sensor-FOV/IFOV. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/eo-coverage.toml); die Standardinklination ist die sonnensynchrone aus eo_payload::sun_synchronous_inclination, ein Komfortstandard, der nicht Teil der validierten Aussage ist

# text
seg-42411e7c37c9 = Orekit { "12.2" } (Apache-2.0) und GeographicLib { "2.1" } (MIT), beide als getrennte Programme ausgeführt, vorab registriert (766823f3) vor der Änderung der Engine und vor jedem Referenzlauf: Kugelgrößen innerhalb von { "1e-9" } relativ (ungünstigster Wert: Winkelradius { "5.4e-16" }, Streifen { "7.0e-13" }, Zugriff { "1.9e-14" }), Periode { "1e-12" } ({ "1.6e-16" }), GSD im Nadir { "1e-7" } ({ "2.9e-10" }), die J2-Knotenperiode und der Knotenabstand innerhalb von { "0.1" } % einer numerischen J2-Propagation in Orekit mit Knotendetektor ({ "1.2e-5" } und { "6.7e-5" }), das Flag der Lückenlosigkeit exakt (168/168) und gegenüber dem WGS-84-Ellipsoid der Horizont innerhalb von { "0.3" } Grad ({ "0.186" } Grad) und die maximale Bodenreichweite innerhalb von { "0.5" } % ({ "3.2e-3" }). Das Entfernen des Knotenregressionsterms lässt { "35" } von { "42" } Knotenpunkten scheitern. MODELLED Geltungsbereich: Fußabdruck auf kugelförmiger Erde; keine Radiometrie, MTF, Atmosphäre, Jitter oder Glint; die sonnensynchrone Standardinklination wird nicht verglichen. Die frühere Gegenprüfung mit Skyfield/SGP4 wird als Regression beibehalten. Revision { "0.30" }: Der Abstand trägt nun die J2-Knotenregression (Standardszenario { "2756.37" } -> { "2752.17" } km)

# text
seg-940692c550f3 = CCSDS-Space-Packet-({ "133.0" })-TM/TC-Framing

# text
# c1: space-packet
seg-bf06c7ffa875 = CCSDS-133.0-B-Space-Packet-Primärkopf kodieren/dekodieren (Version/Typ/Sek.-Kopf/APID/Sequenz-Flags/Zähler/Datenlänge) + ein Framing-Szenario. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/space-packet.toml)

# text
seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — eine unabhängige Implementierung von CCSDS 133.0-B-2 eines Drittanbieters; encode_packet/decode_packet von kshana stimmten byte-exakt überein (der 6-Oktett-Primärkopf für { "33" } Fälle + das vollständige kodierte Paket für { "12" })

# text
seg-5510c82f671a = CCSDS-Space-Packet: Sekundärkopf, Paketfehlerkontrolle und Segmentierung

# text
seg-7503bf761df9 = Erweiterungen des CCSDS-133.0-B-2-Space-Packets neben dem Primärkopf: ein Sekundärkopf mit einem CCSDS-301.0-B-Zeitcode (CUC oder CDS, explizites oder implizites P-Feld) und Zusatzdaten, das Paketfehlerkontrollfeld CRC-16, Segmentierung einer großen Nutzdateneinheit und ihr Wiederzusammensetzen, Stromdekodierung mit Sequenzlücken- und Reihenfolgeprüfungen sowie PUS-TM-Pakete. Die Ausgabe des Primärkopfes ist byte-identisch zu vorher

# text
seg-4123d600477a = Vorab registriert (003ef3eb) vor jedem Vergleich; vier unabhängige Implementierungen, keine unter GPL, nichts mitgeliefert: ccsdspy { "2.0.1" } (BSD-3-Clause) dekodiert { "34" } von Kshana geschriebene Pakete in { "5" } Strömen (Primärkopf, P-Feld, grobe und feine Zeit, CDS-Felder, Zusatzdaten, Nutzdaten, PEC), und beide segmentierten Einheiten zu 1000 Oktetten werden aus seinen Nutzdaten mit { "0" } Abweichungen wieder aufgebaut, und es markiert die Ströme mit ausgelassenem und vertauschtem Paket, die Kshana ablehnt; die CRC von { "8" } Nachrichten und { "57" } PEC-Feldern entspricht CPython binascii.crc_hqx und spacepackets-rs { "0.18.0" } (Prüfwert 0x29B1); { "66" } CUC- und CDS-Zeitcodefälle entsprechen dem Schreiben und Lesen von spacepackets-rs { "0.18.0" } Oktett für Oktett ({ "3" } CDS-Fälle auch spacepackets-py { "0.32.0" }); { "4" } PusTm-Pakete von spacepackets-py { "0.32.0" } sind byte-identisch zu denen von Kshana. Nicht abgedeckt: Zeitcodes mit Agenturepoche ({ "7" } Fälle beruhen auf Unit-Tests), TC-Transferrahmen und jede Sicherungsschicht unterhalb des Pakets

# text
seg-af843a3a830a = <s1>space_packet (TimeCode, SecondaryHeader, Paketfehlerkontrolle, Segmentierung und Wiederzusammensetzen, Stromdekodierung)</s1>

# text
seg-7c61da52b8f8 = SPICE-SPK-Export (Typen { "9" } und { "13" })

# text
seg-582ce23522f6 = Writer und Reader für NAIF-SPICE-SPK-Kernel der Typen { "9" } (Lagrange, ungleiche Zeitschritte) und { "13" } (Hermite, ungleiche Zeitschritte), mit DAF-Layout, Segmentdeskriptoren und Epochenverzeichnissen, sowie der Export eines CCSDS-OEM in einen SPK-Kernel (UTC- oder TDB-Epochen auf Ephemeridenzeit)

# text
seg-194c37ac787f = CSPICE N0067 über spiceypy { "8.3.0" }, Schaltsekunden-Kernel naif0012.tls, vorab registriert (5059fd2a), bevor SPICE einen Kshana-Kernel las: Das Inventar der vier Kshana-Kernel durch SPICE ist exakt; spkpvn und spkgeo bei { "5 516" } Epochen und { "690" } Kettenauswertungen entsprechen der eigenen Auswertung von Kshana Bit für Bit und bleiben an jedem Knoten innerhalb des Zielwerts (ungünstigster Wert { "0.022" } davon); Kshana liest von SPICE geschriebene Kernel bitidentisch; bei gleichen Eingaben sind die Kernel von Kshana byte-identisch zu denen von SPICE ({ "0" } abweichende Bytes in vier Dateien); OEM-Epochen werden innerhalb von { "6.0e-8" } s von str2et in Ephemeridenzeit umgerechnet (Zielwert { "1e-6" } s), und SPICE wertet den OEM-Export innerhalb des Zielwerts aus (ungünstigster Wert { "0.060" }). Synthetische Kepler-Bögen: nichts über physikalische Genauigkeit. Andere SPK-Typen werden nicht geschrieben

# text
seg-d699104fc2af = SPICE-SPK-Typen { "3" } und { "21" } (Tschebyscheff, erweiterte Differenzzeilen)

# text
seg-7d3e8b5b40af = Writer und Reader für NAIF-SPICE-SPK-Segmente vom Typ { "3" } (Tschebyscheff-Polynome für Position und Geschwindigkeit über feste Intervalle, Grad { "0" } bis { "27" }) und Typ { "21" } (erweiterte modifizierte Differenzfelder, die Differenzzeilen der JPL-Integratoren, MAXDIM { "15" } bis { "25" }), aus gegebenen Datensätzen, in Dateien, die auch Segmente der Typen { "9" } und { "13" } enthalten; Datensatzauswahl und Auswertung in der Reihenfolge der SPICE-Reader. Kshana passt keine Tschebyscheff-Koeffizienten an und erzeugt keine Differenzzeilen

# text
seg-40323a2adce1 = CSPICE N0067 über spiceypy { "8.3.0" } (spkw03, spkw13 und, aus derselben Bibliothek über ihr f2c-Symbol, spkw21; spkpvn, spkgeo), vorab registriert (e1cf80d8), bevor der Code existierte, die synthetischen Datensätze gezogen aus dem SHA-1 dieses Commits: Für drei Dateien (Typ { "3" } Grade { "0" }, { "12" } und { "27" } mit { "3" } bis { "150" } Datensätzen; Typ { "21" } MAXDIM { "15" }, { "20" } und { "25" } mit { "1" } bis { "250" } Zeilen, null bis zwei Verzeichniseinträgen und einer Zentrumskette; Typ { "3" }, { "21" } und { "13" } in einer Datei mit Kommentaren) ist das Inventar der Kshana-Kernel durch SPICE exakt, die Kernel von Kshana sind byte-identisch zu denen, die SPICE aus denselben Datensätzen schreibt, und spkpvn und spkgeo entsprechen dem Reader von Kshana Bit für Bit auf den Dateien von Kshana und auf denen von SPICE (je { "48 876" } Komponenten in beide Richtungen, Zielwert { "1e-12" } relativ). Synthetische Datensätze: nichts über physikalische Genauigkeit; echte, von JPL erzeugte Kernel vom Typ { "21" } gehören nicht zur Fallmenge

# text
seg-39517faae95c = CCSDS Attitude Data Messages (AEM, APM)

# text
seg-f88f6ea002c8 = Writer und Reader für die CCSDS-504.0-B-2-Attitude-Data-Messages in KVN und NDM/XML: AEM Version { "2.0" } (und { "1.0" } in KVN, mit ATTITUDE_DIR, QUATERNION_TYPE und numerischen Rotationsfolgen) mit Quaternionen-, Eulerwinkel- und Spin-Lagetypen und ihren Varianten für Ableitung, Winkelgeschwindigkeit und Nutation, mehrere Segmente; APM Version { "2.0" } mit Blöcken für Quaternion, Euler, Winkelgeschwindigkeit, Spin, Trägheit und Manöver; das A-nach-B-Quaternion eines Datensatzes (504.0-B-2 Anhang F)

# text
seg-8853058de1f3 = Orekit { "13.1.8" } (Apache-2.0) Parser und Writer, als getrenntes Programm ausgeführt (xval/adm-orekit), vorab registriert (7a6a05fe) vor jedem Vergleich: Orekit parst jede von Kshana geschriebene Nachricht ({ "14" } AEM KVN, { "11" } AEM XML, { "4" } APM KVN, { "4" } APM XML), und jeder Wert liegt innerhalb seines Zielwerts (Quaternionen { "1e-14" }, Winkel { "1e-9" } Grad; ungünstigster Wert { "0.054" } eines Zielwerts); Kshana parst die { "31" } Nachrichten, die Orekit aus denselben Eingaben schreibt, innerhalb jedes Zielwerts; die Rotation jedes von { "135" } Quaternionen-, Euler- und Spin-Datensätzen entspricht AemSegment.getAngularCoordinates innerhalb von { "1e-12" } (ungünstigster Wert { "0.0071" } des Zielwerts). Alle { "15" } XML-Nachrichten von Kshana validieren gegen das NDM/XML-{ "4.0.0" }-Schema (datengesteuert, mit fixiertem SHA-256 abgerufen). Befund: Der APM-Writer von Orekit lehnt ein Manöver ohne MAN_DELTA_MASS ab (im Standard optional), daher sind APM-Manöver nur in der Schreibrichtung von Kshana abgedeckt. Außerhalb der Fallmenge: AEM-{ "1.0" }-*/RATE-Typen und XML, wiederholte APM-Blöcke

# text
seg-5f26f879037e = CCSDS Orbit Data Messages (OPM, OMM, OCM)

# text
seg-eaddfd311fea = Writer und Reader für die CCSDS-502.0-B-3-Orbit-Data-Messages in KVN und NDM/XML: OPM { "3.0" } und { "2.0" } (Zustandsvektor, oskulierende Kepler-Elemente, Raumfahrzeugparameter, Kovarianz, Manöver, benutzerdefinierte Parameter), OMM { "3.0" } und { "2.0" } (mittlere Elemente über mittlere Bewegung oder große Halbachse, TLE-bezogene Parameter mit BSTAR oder BTERM und AGOM, Kovarianz) und OCM { "3.0" } mit Trajektorie (CARTP, CARTPV, CARTPVA; absolute oder relative Epochen), Blöcken für physikalische Eigenschaften, Kovarianz (CARTP, CARTPV in LTM-Reihenfolge), Manöver und benutzerdefinierte Blöcke; ein OMM mit voller Genauigkeit aus einem SGP4-Elementsatz neben dem unveränderten OmmFile::to_omm_kvn

# text
seg-d4c7896b5963 = Orekit { "13.1.8" } (Apache-2.0) OPM-, OMM- und OCM-Parser und -Writer, als getrenntes Programm ausgeführt (xval/odm-orekit), vorab registriert (cc6841da) vor jedem Vergleich: { "27" } der { "30" } von Kshana geschriebenen Nachrichten ({ "6" } OPM-, { "5" } OMM- und { "5" } OCM-Fälle in KVN sowie XML für Version { "3.0" }) werden in Orekit geparst, wobei jeder Wert innerhalb von { "1e-14" } relativ und jede Epoche innerhalb von { "1e-9" } s liegt ({ "904" } Werte, ungünstigster Wert { "0.021" } eines Zielwerts), und Kshana liest alle { "25" } Nachrichten, die Orekit zurückschreibt, innerhalb derselben Zielwerte ({ "858" } Werte, ungünstigster Wert { "0.020" }); alle { "14" } XML-Nachrichten von Kshana validieren gegen das NDM/XML-{ "4.0.0" }-Schema (datengesteuert). Befunde, fixiert, die die Aussage einengen: Orekit verlangt ELEMENT_SET_NO (in 502.0-B-3 optional), lehnt COMMENT in benutzerdefinierten XML-Parametern ab (das Schema erlaubt es), schreibt BTERM nicht ohne BSTAR (daher sind BTERM und AGOM nur in der Schreibrichtung von Kshana abgedeckt) und addiert relative OCM-Epochen als SI-Sekunden, sodass sie unter TDB von der Kalenderlesart in TDB um etwa { "1.9e-10" } s/s abweichen (UTC, TAI und TT stimmen überein). Die ältere Ausgabe OmmFile::to_omm_kvn, die OMM-Metadaten in META_START/META_STOP einschließt, wird von Orekit abgelehnt (vermerkt). Außerhalb des Umfangs: OCM-PERT- und OD-Blöcke, nicht-kartesische Elementsätze, andere Kovarianzreihenfolgen

# text
seg-1e5ea1d9918d = 3-DOF-Lage- und Zeigefehlerbudget (AOCS)

# text
# c1: attitude-budget
seg-21f2f8efcf19 = Ungünstigstes Störmoment des Gravitationsgradienten ((3/2)(μ/R³)ΔI) als Spitze über die Lage (die validierte Aussage), plus ein RSS-Zeigefehlerbudget über benannte 1σ-Beiträge mit dem dominanten Term (eine quadratische Summe vom Aufrufer gelieferter Zahlen, außerhalb der validierten Aussage). Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/attitude-budget.toml)

# text
seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), eine unabhängige C++-Implementierung des Gravitationsgradientenmoments mit vollem Tensor: Die Spitze (3/2)(μ/R³)ΔI von Kshana ist gleich dem Moment von Basilisk bei der Lage von { "45" } Grad innerhalb von { "1e-12" } relativ (ungünstigster Wert { "2.1e-15" }) über { "5" } Höhen und { "8" } Trägheitstensoren und begrenzt das Moment von Basilisk über { "2000" } zufällige Lagen je Fall; Toleranz vor dem Vergleich festgelegt. Validierte Aussage: die Spitze des Gravitationsgradientenmoments. Das RSS-Zeigebudget ist eine quadratische Summe vom Aufrufer gelieferter Zahlen ohne externe Wahrheit und bleibt außerhalb davon; die von Hand codierte Maximierung des vollen Tensors mit Hipparchus bleibt als stützende Selbstkonsistenz erhalten. Keine Simulation von Regelkreis/6-DoF/flexiblen Moden

# text
seg-1461aa14a7ff = Überflugvorhersage für Bodenstationen (Bodensegment)

# text
# c1: passes
seg-e1cf1ec4f005 = Sichtbarkeitsüberflüge im Zeitbereich (AOS/TCA/LOS, maximale Elevation, Dauer) eines Engine-Propagators über einer Station oberhalb einer Elevationsmaske, mit interpolierten Auf- und Untergangsdurchgängen und Gesamtzugriff: passes::predict_passes, der geometrische Planer (keine Refraktion oder Lichtlaufzeit). Die Szenarioart <c1/> führt den scheinbaren Prädiktor der Zeile 'Apparent ground-station pass prediction with refraction and light time' aus

# text
seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — eine unabhängige Flugdynamikbibliothek: ElevationDetector (Brent-Nullstellensuche) + EventsLogger über einer ITRF-Ephemeride, Station als TopocentricFrame nach WGS-84. AOS/LOS/maximale Elevation/Überflugzahl/Gesamtzugriff stimmen bei identischer Bahn + Station + Maske + Fenster überein (eingecheckte Fixture; Treiber xval/orekit-passes)

# text
seg-1dd8b2655b18 = Scheinbare Überflugvorhersage für Bodenstationen mit Refraktion und Lichtlaufzeit

# text
# c1: passes
seg-46f93d3c24d2 = Sichtbarkeitsüberflüge (AOS, TCA, LOS, maximale scheinbare Elevation, Dauer) eines SGP4-Elementsatzes über einer WGS-84-Station auf dem validierten Erdbahnpfad (IAU 2006/2000A, optionale Erdorientierungsparameter), mit troposphärischer Refraktion nach ITU-R P.834-9 (Gleichungen { "9" } bis { "14" }, die gedruckten Koeffizienten der Empfehlung) und der Lichtlaufzeit des Downlinks, jeweils schaltbar; Durchgänge per Bisektion auf { "1e-7" } s gelöst und die Kulmination per Goldenem-Schnitt-Suche. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/passes.toml), beide Korrekturen standardmäßig an

# text
seg-19d166cb653f = Orekit { "13.1.8" } (CS GROUP, Apache-2.0) mit Hipparchus { "4.0.3" }: TLEPropagator auf denselben Elementsätzen in einem TEME, das Orekit nach der angegebenen Definition aufbaut (seine IERS-{ "2010" }-TOD, gedreht um GAST - GMST), ElevationDetector und ElevationExtremumDetector mit und ohne ITURP834AtmosphericRefraction sowie AngularAzEl mit AngularRadioRefractionModifier für den Fall der Lichtlaufzeit, Durchgänge und Maximum von Hipparchus gelöst; { "60" } Fälle (vier Bahnen, fünf Stationen auf Meereshöhe, Masken { "0" }, { "5" } und { "10" } Grad, { "24" } Stunden). Zielwerte vor dem Lauf festgelegt (vorab registriert e947e69d, Teil { "3" } von 72ea9eb0). Wird die Lichtlaufzeit ignoriert ({ "9777" } Fehlschläge) oder die P.834-Konstante { "1.728" } auf { "1.828" } geändert ({ "7883" } Fehlschläge), wird der Test rot. Geltungsbereich: Stationen auf Meereshöhe; der Koeffizient h*theta0^{ "2" } nach P.834 ist in Orekit { "0.011380" }, wo die Empfehlung { "0.01380" } druckt (fixiert), daher werden Höhen über Meereshöhe nicht verglichen. Runde { "1" }, gegen das Standard-TEME von Orekit mit IERS { "1996" }, hielt jeden Überflug-Zielwert, verfehlte aber den Richtungs-Zielwert um die TEME-Konventionslücke von { "72" } mas (fixiert)

# text
seg-7b4a8e25c3c9 = Adaptive Codierung und Modulation nach DVB-S2 entlang eines LEO-Downlink-Überflugs

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 des Downlinks entlang jedes Überflugs eines Satelliten über einer Station (EIRP, Freiraumdämpfung, atmosphärische Dämpfung nach Kosekansgesetz, sonstige Verluste, G/T, Boltzmann-Konstante, Symbolrate), das effizienteste DVB-S2-MODCOD, das seine quasi-fehlerfreie Schwelle aus ETSI EN { "302" } 307-1 V1.4.1 Tabelle { "13" } plus eine Implementierungsmarge bei jedem Schritt überschreitet, das ACM-Datenvolumen des Überflugs und die Basislinie mit konstanter Codierung, die an der Maske und der längsten Entfernung schließt. Ausführbar als Szenarioart <c1/>. Illustrative Eingaben; MODELLED.

# text
seg-a7f26e3a6030 = Interne Konsistenz: Die in geschlossener Form aus K_bch von Tabelle 5a und den Rahmenlängen berechnete spektrale Effizienz stimmt mit den Effizienzen überein, die Tabelle { "13" } druckt (eine Transkriptionsprüfung der Schwellentabelle); die Teile des Link-Budgets stimmen mit ihren geschlossenen Formen überein; die Auswahl ist monoton in Es/N0 und beachtet die Marge; ACM bewegt mindestens das Volumen der konstanten Codierung. Die Überflugsgeometrie stammt vom separat VALIDATED scheinbaren Überflugprädiktor. WAS NICHT: Es wurde kein externes Werkzeug und keine gemessene Strecke verglichen; die Schwellen sind die idealen AWGN-Werte des Standards, nicht die eines Modems; Regendämpfung, Zeigeverlust entlang des Überflugs und Piloten sind nicht modelliert.

# text
seg-19603a7e0fe8 = Kontaktplanung für mehrere Satelliten und mehrere Stationen mit Konfliktauflösung

# text
# c1: contact-schedule
seg-40edeae6e48b = Kandidatenkontakte aus jedem Satellit-Station-Überflug mit seinem ACM-Datenvolumen; Konflikte, wenn eine Antenne innerhalb ihrer Umschaltzeit zwei Satelliten bedienen würde oder ein Satellit gleichzeitig zu zwei Stationen herunterladen würde; ein prioritätsgewichtetes Zustellungsziel, begrenzt auf den Rückstau jedes Satelliten; ein Greedy-Plan mit trägem Grenzwert, eine Basislinie nach Eingangsreihenfolge und ein exaktes Branch-and-Bound auf bis zu { "26" } Kandidaten, wobei die Optimalitätslücke des Greedy-Plans angegeben wird. Ausführbar als Szenarioart <c1/>. Illustrative Eingaben; MODELLED.

# text
seg-bc520db98f9a = Interne Konsistenz: Das exakte Branch-and-Bound stimmt auf kleinen Zufallsmengen mit der Brute-Force-Aufzählung überein, jeder Plan wird gegen die Konfliktregeln auf Zulässigkeit geprüft, und der Greedy-Plan schlägt nie das exakte Optimum. WAS NICHT: Es wurde kein externer Planer und kein Betriebsplan verglichen; Kontakte werden ganz genommen (keine Aufteilung), der Rückstau ist am Fensterbeginn fixiert, Schwenkzeit über die feste Umschaltzeit hinaus und der Bordspeicher sind nicht modelliert.

# text
seg-ddf2bc2f13a9 = Einweg-Link-Budget (Kommunikation / Streckenauslegung)

# text
# c1: link-budget
seg-83331f513dba = Freiraumdämpfung, C/N₀, Eb/N₀, Marge und Schließung über die Streckengleichung nach CCSDS { "401" } / DSN 810-005 für EIRP/G·T/Entfernung/Rate/Band gegenüber einem geforderten Eb/N₀. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/link-budget.toml)

# text
seg-195bf7e31f24 = Veröffentlichte Design-Control-Tabelle der Raumfahrt-Telekommunikation als fixierte numerische Vektoren: DESCANSO / J. H. Yuen (Hrsg.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Tabelle 1-1 (Galileo X-Band) — kshana setzt die Zeilenposten der Tabelle neu zusammen und reproduziert ihr veröffentlichtes Gesamt-L_fs { "290.54" } dB und Pr/N0 { "54.6" } dB-Hz; die Freiraumdämpfung wird auch gegen ITU-R P.525 geprüft

# text
seg-3742d2aea62a = Sparsame Rahmung von Kosten je Abdeckung / ROI

# text
seg-4228311689f8 = Kosten je Prozent Abdeckung + Abdeckung je Euro als ROI über die Konstellationsdimensionierungs-Engine; die Kosten je Satellit sind eine vom Aufrufer bezogene Spanne niedrig/nominal/hoch (keine erfundenen Preise)

# text
seg-d542ac64c31c = Kostenarithmetik in geschlossener Form gegenüber von Hand abgeleiteten Werten; eine wirtschaftliche RAHMUNG einer modellierten Abdeckungszahl, kein Angebot und kein validiertes Kostenmodell

# text
seg-8ba6ee9acc8a = Integritätsauswirkung unentdeckter Fehlererkennung (kontextabhängiges HPL/VPL gegenüber Alarmgrenze)

# text
seg-f5985399d0d5 = Bildet einen unentdeckten Spoofing-/Jamming-Bias auf einen effektiven Fehler ab → Stanford-Region (verfügbar/nicht verfügbar/MI/HMI) gegenüber kontextspezifischem HAL/VAL (offener Himmel vs. urban)

# text
seg-124d0ffe959e = Setzt die extern validierte RAIM-Stanford-Klassifikation zusammen (raim::classify_stanford); die Abbildung unentdeckte Erkennung→AL selbst ist modelliert, keine zertifizierte Integritätszuteilung

# text
seg-37d43b5b918a = Parameterblatt zitierter Fehlermodelle für CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Eingegrenzte (beste/nominale/konservative) Leistungsfähigkeit von Kaltatom-Interferometern — Bias-Instabilität, Geschwindigkeits-/Winkel-Random-Walk, Skalenfaktorstabilität, abfragebegrenzte Abtastrate, Dynamikbereich der Streifenmehrdeutigkeit — jeweils auf Zitate rückführbar; speist QuantumNavBudget, ohne Hardware zu modellieren

# text
seg-4b66096727b8 = Interne Konsistenz: Die zitierte VRW-Spanne wurde gegen die Physik von CaiAccelerometer::accel_asd gegengeprüft + rohen Dynamikbereich, berechnet aus der Streifenmehrdeutigkeitsgrenze; die Zahlen sind MODELLED Spannen aus einer Literaturübersicht (needs_source_confirmation), kein Gerät validiert, kein Validierungs-Nimbus

# text
seg-c93f2d3a3167 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Epochenklassifikator des Stanford-Integritätsdiagramms

# text
seg-712d5c35a6a6 = TIB-Epochenklassifikation im Stanford-Integritätsdiagramm (nominal / nicht verfügbar / MI / HMI)

# text
seg-93b913e60063 = Unabhängige numpy-Neuimplementierung der Vier-Regionen-Regel (scripts/gen_tib_scorer_reference.py) auf derselben Stichprobenmenge; Methode zitiert aus dem Stanford–ESA-Integritätsdiagramm (Tossaint et al., ION GNSS { "2007" }) und RTCA DO-229 WAAS MOPS. KEINE ExternalDataset-Genauigkeitsreferenz — der Benchmark ist ehrlichkeitsimmun.

# text
seg-573aa0193cb3 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Bewerter der Integritätsabdeckung

# text
seg-4d86f3c2d8f5 = TIB-Bewertung der Integritätsabdeckung (HMI/MI/Verfügbarkeitsraten + Urteil zur Überschrankenabdeckung)

# text
seg-645eb084ae8e = Unabhängige numpy-Neuzählung der Regionen in tests/fixtures/tib/reference.json; nur Gegenprüfung der Bewerter-Mechanik, keine Genauigkeitsaussage.

# text
seg-372dd0fdb025 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Fehlerkatalog (parametrische Generatoren)

# text
seg-2604e7cf27d2 = TIB-Fehlermenü (Domänendivergenz, Uhren-Slam, Holdover-Auslauf, statische/inkrementelle/symmetrische/asymmetrische Verzögerung, Replay innerhalb der Frische, pfadselektiv, k-aus-N-Quorum)

# text
seg-b907aecaccd0 = Repräsentative parametrische Fehlergeneratoren (modelliert); die nicht erkennbare Menge (symmetrische Verzögerung, Replay innerhalb der Frische) ist zitiert nach Mizrahi RFC { "7384" } und Narula & Humphreys (IEEE JSTSP { "2018" }). Keine externe Referenz — ein Fehlerkatalog macht keine gemessene Aussage.

# text
seg-90c0eb1e7c14 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Urteil zur Absorption nicht erkennbarer Fehler

# text
seg-f713acf042ff = TIB-Urteil zur Absorption nicht erkennbarer Fehler (symmetrisch/Replay müssen vom PL absorbiert und nie als erkannt gemeldet werden)

# text
seg-6840c2467c63 = Eigenschaftsprüfung, dass das Verdict-Enum strukturell einen nicht erkennbaren Fehler nicht als erkannt melden kann (Mizrahi RFC { "7384" }); absorbiert ⟺ PL ≥ Offset. Keine Genauigkeitsreferenz.

# text
seg-3652a591eefc = Raumfahrzeugbus-Engineering (AOCS/Thermal/Strukturen/Antrieb/Energie)

# text
seg-50a9c1c7dff0 = Nicht bereitgestellt — Kshana ist ein Simulator der Navigationsleistung, kein Busbauer

# text
seg-a349aa76b0ed = PARTNER

# text
seg-b28dd62dca1c = Auslegung von Navigations-HF-Nutzlast und Antennenhardware

# text
seg-76c983a23e7b = Nicht bereitgestellt — Kshana modelliert die Signalleistung, nicht Nutzlast-/Antennenhardware

# text
seg-7bba3b35214c = Auslegung und Reifung von Quanten-Nutzlasthardware

# text
seg-15fcc200b859 = Nicht bereitgestellt — nur Leistungsmodelle; Kaltatom-/Uhrenhardware ist Sache eines Partners

# text
seg-d69dd4c5167b = Produktsicherung für Flughardware (Strahlung/EEE/MAIT)

# text
seg-b1540f78ffd4 = Nicht bereitgestellt — Kshana äußert sich nur zur Software-PA; die Flug-PA ist Sache eines Partners

# text
seg-1f200f8efc71 = Mondkoordinatenzeit

# text
seg-2e6961dbffe9 = Relativistische Erde-Mond-Uhrenrate (LTC/TCL) + TT/TAI/UTC-Verkettung + Ensemble

# text
seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; Grundlage der IAU/IAG-LunaNet-LTC): Eigenpotential der Mondoberfläche L_m = { "3.13881e-11" } und säkularer Gesamtwert { "56.02" } µs/Tag stimmen als veröffentlichte Zahlenwerte überein; die geozentrische Mondgeschwindigkeit wurde gegen JPL DE440 (de440s.bsp über SPICE) gegengeprüft

# text
seg-8adbbd2cdb74 = Selbstbeschreibung des hybriden optischen/HF-Berichts

# text
seg-2a5e48b558e1 = Der hybrid-optical-rf-Bericht gibt die Streckenkonfiguration an, mit der er tatsächlich lief (Trägerwellenlänge, Sende- und Empfangsapertur, Entfernung, Pulsbreite, Integrationszeit, Wirkungsgrade und Verluste, aufgelöste Standardwerte), und trägt einen Einheitenblock, der Einheit und Herkunftsklasse jeder Größe angibt, die eine Veröffentlichung wahrscheinlich zitiert, einschließlich der Spuren der Übergabekovarianz in Quadratmetern

# text
# c1: variance
seg-23f0c10237f4 = Keine externe Referenz, und keine ist möglich: Dies ist Selbstbeschreibung, keine Messung. Sie wird festgehalten, weil ihr Fehlen ein Mangel war -- P5 musste die Trägerwellenlänge und die Sendeapertur aus Quell-Standardwerten zitieren und aus einer internen Konsistenzprüfung ableiten, dass ein bloßes <c1/> in Quadratmetern war. Die Ableitung war richtig, und gerade deshalb kam es darauf an: Nichts hätte erfasst, dass sie falsch gewesen wäre

# text
seg-0691f3dee8cb = Verfügbarkeit der hybriden optischen/HF-Strecke auf der HF-Seite

# text
seg-72ccb655caf0 = Der hybrid-optical-rf-Bericht gibt eine HF-Streckenverfügbarkeit an, zusammengesetzt aus Größen, die die Engine bereits berechnet, statt aus einer importierten Klimatologie, und gibt die Zusammensetzung als benannte Regel an: A_rf = I_closure * I_track, wobei I_closure das Schließungsurteil des Einweg-Link-Budgets nach CCSDS-401 / DSN-810-005 ist (linkbudget::link_budget, Eb/N0-Marge >= { "0" }) bei der eigenen Entfernung des Szenarios und I_track das Urteil der Nachführschleife (jamming::lock_status) auf dem C/N0, den DASSELBE Budget lieferte. Jeder Faktor führt die Herkunftsklasse seiner Eingabe bis zur Ausgabe mit, und die Faktoren, die bewusst NICHT im Produkt enthalten sind -- geometrische Sichtbarkeit, Störungsverweigerung und eine HF-Ausfallklimatologie -- werden mit Begründung benannt, statt stillschweigend auf { "1" } gesetzt zu werden. Die aufgelöste HF-Teilstrecke wird als eigener Block rf_link_configuration ausgegeben, und die kontinuierlichen Zahlen neben dem Indikator (Streckenmarge, C/N0-Marge, die geschlossenen Reichweiten für Schließung und Nachführung in geschlossener Form und die Reichweitenauslastung) sind die Reichweitenumkehrungen desselben Budgets. Der Bericht gibt am Block und im Einheiten-Eintrag, auf dem ein Leser landet, vollständig an, dass diese Zahl DURCH MARGE/GEOMETRIE BEGRENZT und DETERMINISTISCH ist, während die optische Verfügbarkeit DURCH WETTER/KLIMATOLOGIE BEGRENZT und probabilistisch ist, sodass beide nie als vergleichbares Paar von Prozentwerten zitiert werden können

# text
seg-319705ea0166 = Keine externe Referenz, und ExternalDataset wird abgelehnt. Die beiden Eingaben sind eine Eb/N0-Marge und ein C/N0-Schwellenübergang, beide Funktionen einer MODELLED EIRP, Gütezahl und pauschalen Verlustzuteilung; für einen hybriden optischen/HF-Dienst Erde–Mond gibt es keine gemessene Verfügbarkeitsaufzeichnung, gegen die die zusammengesetzte Zahl geprüft werden könnte. Die vorhandenen Prüfungen sind intern und werden als solche angegeben: Die Zusammensetzung wird aus den eigenen veröffentlichten Margen des Berichts neu berechnet statt aus dem Inneren des Emitters, und die Schließungsreichweite wird geprüft, indem die Streckengleichung AN ihr erneut ausgeführt wird und verlangt wird, dass die Marge verschwindet -- ein Umkehr-Round-Trip, keine unabhängige Implementierung. Die ehrliche Grenze der Zahl ist im Bericht selbst festgehalten: Sie ist ein deterministischer 0/1-Indikator, keine Wahrscheinlichkeit, weil nichts in dieser Engine eine Verteilung von HF-Streckenausfällen in diesem Band und dieser Geometrie misst. Diese fehlende Eingabe wird in rf_availability.factors_not_included benannt statt erfunden, und sie zu liefern ist das, was eine probabilistische HF-Verfügbarkeit bräuchte

# text
seg-22c5df9b6c7c = Gleichwertiger Vergleich der Entfernungsmessung optisch gegenüber HF

# text
seg-70eb396f40af = Der hybrid-optical-rf-Bericht gibt das Verhältnis der Entfernungsmessung optisch gegenüber HF aus, wobei die EINE Konfiguration, bei der beide Teilstrecken ausgewertet wurden, im selben Objekt mitgeführt wird: derselbe Einwegpfad, dieselbe Entfernung und dieselbe Akkumulationszeit. Die optische Teilstrecke ist die photonenbegrenzte ToA-CRLB der Engine auf der Einweg-Photonenzahl; die HF-Teilstrecke ist der thermische Code-Tracking-Jitter des DLL (Early-Late) der Engine bei dem C/N0, den das eigene Link-Budget der Engine für dieselbe Einwegentfernung liefert. Die Schleifenrauschbandbreite wird abgeleitet, nicht gewählt: B_L = 1/({ "2" }*integration_s) legt die HF-Teilstrecke genau auf die optische Akkumulationszeit, und wenn ein Aufrufer sie so überschreibt, dass die beiden Mittelungszeiten auseinanderfallen, wird das Verhältnis REFUSED -- null, mit der Abweichung und beiden benannten Zeiten -- statt bei zwei Arbeitspunkten zitiert zu werden. Es wird kein Verhältnis gegen das GEWÄHLTE parametrische rf_position_sigma_m des Szenarios gebildet, und die Ablehnung nennt den Grund: Diese Eingabe trägt überhaupt keine Konfiguration. Die veröffentlichte optische Zweiweg-Kennzahl und der exakte Faktor, der sie mit der Einweg-Vergleichsteilstrecke verbindet, werden neben dem Verhältnis ausgegeben, sodass der Bericht nicht so gelesen werden kann, als trüge er zwei widersprüchliche optische Sigmas

# text
seg-acbb3ac98ee3 = Keine externe Referenz für das VERHÄLTNIS, und ExternalDataset wird bewusst abgelehnt. Die zugrunde liegende HF-Kette hat eine -- tests/validate_p5_rf_ranging_precision.rs prüft linkbudget::link_budget und navsignal::dll_code_jitter_chips gegen eine unabhängige Python/NumPy-Fixture und gegen den fest codierten Rechenwert von Kaplan & Hegarty ({ "2.814e-3" } Chip / { "0.825" } m bei { "45" } dB-Hz) -- und die optische CRLB hat ihre eigene Zeile in geschlossener Form. Einen der beiden Anker für diese Zeile zu beanspruchen, wäre geliehene Validierung, die zu verhindern die Invarianten der Matrix da sind: Die Größe hier ist ein VERHÄLTNIS bei einer Konfiguration mit MODELLED EIRP, Gütezahl, Sendeleistung und Apertur, und es gibt keinen gemessenen Vergleich der Entfernungsmessung optisch gegenüber HF an einem gemeinsamen Arbeitspunkt, gegen den es geprüft werden könnte. Intern geprüft wird das, was das Verhältnis tatsächlich falsch machen kann: dass die beiden Teilstrecken an einem Arbeitspunkt liegen. Das wird gemessen, indem die gemeinsame Akkumulationszeit skaliert wird und verlangt wird, dass sich beide Teilstrecken nach demselben Quadratwurzelgesetz bewegen und das Verhältnis unverändert bleibt, und es wird durch die glatte Ablehnung des Verhältnisses erzwungen, wenn die Mittelungszeiten auseinanderfallen. Beide Teilstrecken sind Grenzen durch thermisches/Schrotrauschen, und beide schließen Mediumverzögerung, Uhrenfehler und Mehrdeutigkeit aus, der Ausschluss ist also auf beiden Seiten identisch; der Bericht sagt das, statt es der Ableitung zu überlassen

# text
seg-3f26f598e013 = Selbstbeschreibung des Link-Budget-Berichts

# text
seg-b88bf41d6d4c = Der Link-Budget-Bericht gibt jede absolute Konstante an, aus der seine eigene Marge berechnet wurde -- die Trägerfrequenz, die die Freiraumdämpfung verwendete, die EIRP, die Gütezahl, den pauschalen Verlust und den Boltzmann-Term -- plus das erforderliche G/T, bei dem die Marge null ist, die Streckenkonstante (EIRP - Verluste - erforderliches Eb/N0), die die einzige Kombination ist, die eine veröffentlichte Raten-/Gewinntabelle je festlegen kann, und, wenn ein Aufrufer eine Systemrauschtemperatur angibt, den Empfangsantennengewinn, den diese Gütezahl impliziert

# text
seg-52f98f50522f = Keine externe Referenz: Dies ist Selbstbeschreibung über eine Gleichung, die bereits gegen eine veröffentlichte Design-Control-Tabelle validiert ist (siehe Zeile Einweg-Link-Budget). Sie wird festgehalten, weil ihr Fehlen ein gemessener Mangel war -- die Reproduktion der veröffentlichten d1_rate_gain_beamwidth.csv erforderte, aus allen dreißig Zeilen eine effektive Konstante auf { "0.0034" } dB zurückzurechnen, und die Engine benennt diese Kombination nun und beweist per Test, dass keine veröffentlichte Tabelle ihre drei Komponenten je hätte trennen können

# text
seg-a7b192e27cb5 = Übergangstabelle der Mondzeit je Uhrenklasse

# text
seg-cab605dc6ea2 = Ein Lauf des Mondzeitbudgets gibt je Uhrenklasse eine Übergangszeile Uhr-gegen-Bezugssystem gegenüber einem einzigen gemeinsamen Bezugssystemterm aus, sodass die Uhr die einzige Variable des Vergleichs ist; jede Zeile trägt den Übergang auf zwei Wegen erreicht -- per Bisektion aus der allgemeinen Potenzgesetz-Zeitfehlerkurve und algebraisch aus dem dominanten Rauschtyp der Zeile umgekehrt -- mit der relativen Differenz zwischen beiden

# text
seg-ccec15f0b125 = Zwei verschiedene Berechnungen derselben Größe innerhalb der Codebasis, nicht eine, die neu formuliert wurde: Die Bisektion auf der IEEE-1139-Potenzgesetzkurve weiß nichts über den Rauschtyp, während die geschlossene Form den dominanten Typ algebraisch umkehrt, sodass ein falsch klassifizierter Rauschtyp oder eine schlechte Einklammerung als nicht winzige relative Differenz erscheint. Die vier Werte reproduzieren auch die veröffentlichte Tabelle der Veröffentlichung bis auf die Hälfte der letzten gedruckten Stelle -- aber diese Tabelle wurde selbst aus derselben geschlossenen Form rekonstruiert, sodass dies eine Reproduzierbarkeitsprüfung und keine externe Referenz ist und der Bezugssystemterm, gegen den gemessen wird, eine modellierte Zuteilung ist

# text
seg-ff32b78acb8c = Gemeinsamer UT1- und Polbewegungsfehler über eine gemeinsame Zeilenmenge

# text
seg-561e588153af = Eine Tabelle gibt den UT1-Vorhersagefehler, den Polfehler der Polbewegung und ihre quadratische Kombination am Mond über eine IDENTISCHE Epochenmenge je Horizont an und gibt die Epochen aus, bei denen jede Komponente gemessen wurde. Gesondert benennt das Szenario, welche EOP-Eingabe gilt, und zerlegt deren Zeilenzählung und gibt stets die Tabelle der Horizonte vorhergesagt gegenüber final aus, mit einer ausdrücklichen Angabe, warum sie leer ist, wenn sie es ist

# text
seg-093191c1ddce = astropy { "8.0.1" } utils.iers (BSD-3), das das IERS-Produkt finals2000A mit seiner eigenen Regel Bulletin-B-sonst-A liest, und pyerfa { "2.0.1.5" } (SOFA) mit vollständigen Rotationen von himmelsfest zu erdfest (c2i06a, sp00, pom00, c2tcio; der Erdrotationswinkel nach IERS { "2010" } Gl. { "5.15" } in exakter Arithmetik), als getrennte Programme auf wörtlichen Zeilen der eingefrorenen finals2000A.all vom 2026-09-30 ausgeführt; vorab registriert (455b8fb5) mit den Änderungen A1 und A2, die nur die numerische Genauigkeit der Referenz festlegen (beide mit den Läufen offengelegt, auf die sie folgten): Jede Epochenliste von Tabelle { "3" } gleich, UT1- und Polstatistiken innerhalb von { "6e-16" }, die Kombination innerhalb von { "1.9e-7" }, 12/12 Fälle vorhergesagt gegenüber final. Die Prüfung der Kombination kann Polterm-Fehler unterhalb von etwa { "1e-4" } relativ nicht auflösen, weil UT1 sie dominiert; die Polgenauigkeit stützt sich auf die Prüfung der Polstatistik bis { "1e-9" }. Die Regeln für Epochenmenge und Rückfall sind der Generator, der die Definitionen von Kshana spiegelt, und die Status leerer Tabellen sind Entwurfsverhalten ohne externe Wahrheit. Größenordnungen: realisierte Vorhersagefehler aus Tabelle 3a des IERS Annual Report { "2019" }, Kshana/IERS { "1.001" } bis { "1.100" } bei { "1" } bis { "90" } Tagen (Zielwert [{ "0.8" }, { "1.25" }], gemessen). Zeilenzählung: astropy (Zeile mit Offline-Eingabe). Runde { "1" } (als Regression beibehalten): Gegenüber der in { "178" } Ausgaben von Bulletin A gedruckten Genauigkeitsformel stimmt der Pol innerhalb von 1.5x überein und UT1 nicht, was die IERS-Formel gegen ihren realisierten Fehler prüft

# text
seg-3692f1fc89e6 = Die Offline-Standardeingabe der Erdorientierung ist ein reales IERS-Produkt

# text
# c1: realtime-frame-eop
seg-f9a9d385fd26 = Der Laufzeitstandard von <c1/> ist die eigene eingebettete Kopie der Bibliothek eines wörtlichen Auszugs aus IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } aufeinanderfolgende Tageszeilen, MJD 61224-61397, aus der finals2000A.all vom 2026-09-30 geschnitten), der alle drei vom Format definierten Zeilenjahrgänge trägt, klassifiziert nach den IERS-Flags I/P (eop::row_vintage): { "30" } finale Bulletin-B-Zeilen, { "54" } gemessene Rapid-Zeilen (Flag I ohne Bulletin-B-Block) und { "90" } Vorhersagen aus Bulletin A (Flag P). Ein bloßer Lauf ohne Dateiargument und ohne Netzwerk gibt eine gefüllte Tabelle je Horizont aus, die Zählung Zeilen = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) und predicted_rows.n = { "90" } über MJD 61308-61397; der Stand bei Ausgabe für die Vergleiche vorhergesagt gegenüber final ist die letzte gemessene Zeile. Der frühere Auszug mit 32 Zeilen (tools/finals2000A_2026.txt, jede Zeile mit Flag I) und der Auszug mit fünf rein finalen Zeilen werden weiterhin mitgeliefert und ausgeführt: Darauf ist predicted_rows.n gleich { "0" }, eine Eigenschaft der Eingabedatei und kein Parserergebnis

# text
seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), das dieselben Bytes mit seinem eigenen Leser liest, und die Tabelle IERS Bulletin A Vol. XXXIX Nr. { "039" }, Zahl für Zahl kopiert; vorab registriert (6fdae01b) mit sechs exakten Kriterien, bevor astropy ausgeführt wurde. Alle sechs gelten: { "30" } finale, { "54" } Rapid- und { "90" } vorhergesagte Zeilen mit gleichen MJD-Listen, jede vorhergesagte Zeile mit Flag P, die Zählung des Standardlaufs gleich, und die Vorhersagen gleich Bulletin A innerhalb der letzten gedruckten Stelle. Offengelegt: Der Schnitt wurde vor dem Commit mit einem einfachen Spaltenausschnitt der Flags und des Bulletin-B-Blocks gewählt, der 30/54/90 zeigte; der Auszug ist ein wörtlicher Ausschnitt, den dieses Repository aus einem IERS-Produkt geschnitten hat (SHA-256 in der NOTICE der Fixture). Die validierte Aussage ist die Jahrgangsklassifikation und die Zählung der mitgelieferten Standardeingabe und ihrer vorhergesagten Zeilen; beliebige Benutzereingaben werden nach derselben Flag-Regel klassifiziert, sind aber nicht Teil des Vergleichs. { "0.30" } Runde { "1" } (abgelöst): Der frühere Standard nannte { "12" } Zeilen mit Flag I Vorhersagen aus Bulletin A; die Engine klassifiziert nun nach Flag. REVISIONEN: Die Zellen des Standardlaufs, die sich bewegt haben, sind alt-zu-neu in docs/revisions/M035-default-eop-recut-cell-changes.md aufgeführt (predicted_rows { "12" } -> { "90" }, die Polgrenze { "0.06776" } -> { "0.05550" } mas, der Erdorientierungsterm { "14.01601" } -> { "14.01583" } m, die Summe { "20.09759" } -> { "20.09746" } m und { "67.03834" } -> { "67.03790" } ns, die Zeilen von Tabelle { "2" } aus tests/golden/realtime-frame-eop.csv und die Übereinstimmungszahlen des operativen Prädiktors); frühere in docs/revisions/G12-default-eop-cell-changes.md

# text
seg-18c72a7565d6 = Erfassungs-Fußabdruck gegenüber Höhe und Strahlbreite

# text
seg-9c30a0ab5233 = Zweiachsiger Durchlauf des musterbewerteten, höhenbegrenzten Oberflächen-Erfassungs-Fußabdrucks über Senderhöhe und Schüsseldurchmesser, ausgegeben eine Zeile je Arbeitspunkt mit der Halbwertsstrahlbreite, die jeder Durchmesser impliziert, und die Erfassung am Horizont als SCHWELLE angegeben -- je Zeile das J/S am Horizont, seine Marge und die Sendeleistung, die es schließen würde; je Raster die gefundenen Durchgänge oder eine ausdrückliche Angabe, dass der Horizont nirgends im Raster erreicht wird, mit dem Fehlbetrag

# text
seg-fc0a64b9a280 = Reproduzierbarkeit des Mondzeit-Fehlerbudgets

# text
seg-5d5970506b9c = Das Szenario lunar-time-budget veröffentlicht seine feldwertigen Ausgaben als Tabelle in Langform (Rasterindex, Mittelungszeit, Term) neben dem Bericht, sodass die sieben x(tau)-Kurven je Term und die Wurzel aus der Quadratsumme der Gesamtheit Engine-Ausgabe sind und nichts, was ein Leser aus dem Methodenabschnitt neu aufbaut

# text
seg-62df6258bc62 = Nur Selbstkonsistenz: Die veröffentlichte Gesamtsumme wird gegen die Wurzel aus der Quadratsumme der Terme in derselben Datei geprüft, und die ausgegebene Kurve reproduziert die veröffentlichte p3_time_budget_curve.csv über alle { "57" } Punkte. Beide Prüfungen teilen die eigenen Termdefinitionen dieser Engine, daher ist keine davon unabhängig. Der Uhrenterm beruht auf veröffentlichten Uhrenspezifikationen, aber die GRÖSSENORDNUNGEN der Untergrenzen für Strecke, Bezugssystem, Relativistik und Ephemeride sind dokumentierte Budgetzuteilungen ohne externe Referenz

# text
seg-675887733454 = Zeitlabor der Mondstation: Holdover des miniRAFS gegenüber LTC

# text
seg-7dfedc40da6a = Der optionale Block [time_lab] des Szenarios lunar-time-budget modelliert eine Mondreferenz-Stationsuhr (standardmäßig die Klasse miniRAFS oder eine beliebige benannte Klasse oder eine an angegebene Stabilitätspunkte angepasste Gerätekarte), die auf die Koordinierte Mondzeit gesteuert und dann frei laufen gelassen oder alle N Sekunden neu gesteuert wird: die Zeitfehlerkurve x(t) als Wurzel aus der Quadratsumme des Potenzgesetz-Terms der Uhr, eines konstanten Steuerresiduums (ILLUSTRATIVE), eines konstanten Realisierungsresiduums der LTC und eines optional zuschaltbaren Terms für die Rate der Stationshöhe; die Zeit nach einer Steuerung auf { "1" }, { "10" } und { "100" } ns (oder angegebene Schwellen) per Bisektion neben der Umkehrung in geschlossener Form für den dominanten Rauschtyp und der dominante Term bei jedem angegebenen Horizont, jeweils mit Einheiten

# text
seg-3801e9b32309 = Nur interne Konsistenz: Die per Bisektion bestimmte Zeit bis zur Schwelle wird gegen die Umkehrung in geschlossener Form des dominanten Rauschtyps der Uhr geprüft und der frei laufende Uhrenterm gegen den eigenen Uhrenterm des Budgets. Die Uhrenklassen beruhen auf veröffentlichten Eintagesspezifikationen (ihre eigenen Zeilen); die LTC-Rate wird hier nicht neu hergeleitet und behält ihre eigene Zeile VALIDATED (Mondkoordinatenzeit); das Steuerresiduum ist ILLUSTRATIVE, das Realisierungsresiduum ist eine Budgetzuteilung, und es ist kein thermisches Modell enthalten. Das im Material der ICG WG-B Lunar PNT vom Juni { "2024" } beschriebene Ziel auf Nanosekundenniveau wird als Quellenaussage zitiert, nicht als Aussage übernommen; nichts hier ist eine Aussage über eine reale Stationsuhr

# text
seg-af3ff120b707 = Geodätische VLBI zum Mond

# text
seg-cfd7d0126028 = Nahfeld-VLBI-Verzögerung für eine Erdbasislinie, die ein Mondbaken beobachtet + partielle Ableitungen

# text
seg-d1943f9932af = Delta_dor für ebene Wellen (innerhalb derselben Codebasis) im Fernfeldgrenzfall; partielle Ableitungen durch finite Differenzen. Externer Vergleich { "0.30" }, ein Befund (bleibt MODELLED): Gegenüber ANISE { "0.10" } mit konvergierten Lichtlaufzeiten durch DE440 ({ "75" } Verzögerungen am 2024-01-01 über drei DSN-Basislinien, erzeugt von xval/anise-lunar-od ohne Kshana-Code) liegt keine Verzögerung innerhalb der Toleranz von { "1" } ps. Die größte Lücke beträgt { "24" } µs und stammt vom analytischen Mondzentrum (etwa { "200" } km von DE440), der einzelnen momentanen Geometrie ohne Lichtlaufzeit-Iteration ({ "3.6" } µs) und der ausgelassenen Polbewegung; partielle Ableitungen der Bake weichen um bis zu { "2.9e-3" } relativ gegenüber { "1e-6" } ab. Die Aussage in der Moduldokumentation, dass die Näherungen des Bezugssystems unterhalb der Modellgüte liegen, gilt auf diesem Niveau nicht. { "0.30" } Runde { "2" }: Der Kernelpfad (lunar_vlbi::KernelGeometry) wird gegen die Lichtlaufzeiten von NAIF SPICE in seiner eigenen Zeile validiert, Geodätische VLBI zum Mond, Kernelpfad; der ANISE-Vergleich dieses Pfades (75/75 innerhalb von { "1" } ps, ungünstigster Wert { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) ist nur eine Gegenprüfung der Kernel-Auswertung, weil die Lichtlaufzeitlösung in diesem Harness die des Projekts selbst ist. Diese Zeile (der analytische Standardpfad) bleibt mit dem obigen Befund MODELLED

# text
seg-d12d4565b01d = Geodätische VLBI zum Mond, Kernelpfad

# text
# c1: lunar-vlbi
seg-11e1c942e41c = Nahfeld-VLBI-Verzögerung für eine Erdbasislinie, die eine Mondbake beobachtet, mit partiellen Ableitungen für Bake und Station, auf dem Kernelpfad (lunar_vlbi::KernelGeometry): Erde und Mond aus DE440, Hauptachsen des Mondes aus DE440, Erdorientierung ITRF93 mit UT1 und Polbewegung, jede Lichtlaufzeit im baryzentrischen System konvergiert, partielle Ableitungen mit dem Lichtlaufzeitfaktor 1/(c - u.V). Ausführbar als Szenario <c1/> mit gesetzten planetary_kernel_path, earth_orientation_kernel_path und moon_orientation_kernel_path; die validierten Ausgaben sind die Serie geometric_delay_s des Kernelpfads und epoch_partials. Auf dem Kernelpfad addiert delay_s den analytischen differenzierten Shapiro-Term, der nicht verglichen wird, und delay_rate sowie near_field_correction_us werden nicht verglichen

# text
seg-c7f6842b6019 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) konvergierte newtonsche Lichtlaufzeiten (spkcpt/spkcpo, CN) von einer in MOON_PA_DE440 fixierten Bake zu den DSN-Stationen DSS-14, DSS-43 und DSS-63 aus dem NAIF-Stationskernel earthstns_itrf93_260814.bsp, mit de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec und naif0012; partielle Ableitungen sind zentrale Fünfpunkt-Differenzen der SPICE-Lichtlaufzeiten, nicht die Formel 1/(c - u.V) von Kshana. Vorab registriert (a689c797, Epochen { "2024" }) mit Zielwerten von { "1" } ps für jede Verzögerung und { "1e-6" } relativ für jede partielle Ableitung. Dieser erste Lauf scheiterte (17/75 Verzögerungen innerhalb von { "1" } ps, ungünstigster Wert { "1.03e-11" } s): SPICE führt ET als ein einziges double, dessen Abstand bei { "2024" } die Aussendeepoche um bis zu { "6e-8" } s rundet, etwa { "6" } ps Lichtlaufzeit, und das Residuum stimmt mit dieser Rundung bei einer Korrelation von { "0.99999" } überein (fixiert; der Prüfer hat es unabhängig reproduziert). Die Änderung 66e365d4, nach diesem Ergebnis und vor dem Entstehen ihrer Fixture geschrieben, verlegte dieselbe Referenz und dieselben Zielwerte auf { "25" } stündliche Epochen nahe J2000, wo der ET-Abstand höchstens { "1.5e-11" } s beträgt: 75/75 Verzögerungen innerhalb von { "1" } ps (ungünstigster Wert { "6.2e-14" } s), 75/75 partielle Ableitungen der Bake (ungünstigster Wert { "7.4e-9" }), 150/150 partielle Ableitungen der Stationen (ungünstigster Wert { "3.8e-11" }). Außerhalb der Aussage: der analytische Standardpfad (Reihe für den Mond und mittleres Mondsystem, { "24" } µs von ANISE durch DE440, die Zeile Geodätische VLBI zum Mond), der differenzierte Shapiro-Term, den das Szenario analytisch addiert, Medien und die Skalierung von baryzentrisch auf geozentrisch

# text
seg-1f10810131be = NAIF-Kernel-Leser: DAF-Container, SPK-Typ { "2" } und binärer PCK-Typ { "2" }

# text
seg-7da4847e7a28 = Der eigene reine Rust-Leser der Engine für binäre NAIF-Kernel (naif_kernel): der DAF-Container (beide Byte-Reihenfolgen, verkettete Zusammenfassungsdatensätze), SPK-Typ-2-Tschebyscheff-Positionssegmente, über ihre Zentren bis zu einem niedrigsten gemeinsamen Vorfahren verkettet, und binäre PCK-Typ-2-Euler-Winkel-Segmente, die in eine Rotation von J2000 zum Körper umgewandelt werden, wobei Epochen als zweiteilige ET genommen werden, damit ein Versatz unterhalb einer Mikrosekunde seine Genauigkeit behält. Er ist es, durch den KernelEphemeris (ephem_provider) und die Kernelpfade von lunar_vlbi, lunar_llr und lunar_vlbi_fim DE440 lesen. Die Aussage ist, dass er JPL-Kernel korrekt liest; es ist keine Aussage, dass DE440 oder die analytischen Sonnen- und Mondreihen der Engine genau sind

# text
seg-09773b73d785 = Zwei unabhängige Kernel-Leser auf denselben NAIF-Dateien: NAIF SPICE Toolkit N0067 (CSPICE über spiceypy { "8.2.0" }, MIT; spkezr und pxform) und ANISE { "0.10.6" } (Nyx Space, MPL-2.0; Almanac.translate und Almanac.rotate), beide als getrennte Programme auf de440s.bsp und moon_pa_de440_200625.bpc ausgeführt. Vorab registriert (abcd9133), bevor eine Fixture oder ein Referenzwert existierte: Der Raster-Seed sind die ersten { "16" } Hexadezimalstellen des Hashs dieses Commits, sodass weder die { "200" } Epochen noch die Körperpaare mit Blick auf das Ergebnis gewählt werden konnten; jede Epoche trägt zudem den Mond und die Sonne relativ zur Erde. Zielwerte vorab festgelegt aus der Tschebyscheff-Auswertung in doppelter Genauigkeit (höchstens { "15" } Koeffizienten, n^{ "2" } u = { "2.5e-14" } je Auswertung, zwei Auswertungen und bis zu zwei Sprüngen je Seite): Position { "1e-13" } R + { "1e-5" } m, Geschwindigkeit { "1e-13" } V + { "1e-10" } m/s, R und V der größere Betrag relativ zum niedrigsten gemeinsamen Vorfahren; Rotationselement { "1e-13" } W + { "1e-15" }, W die Koeffizientensumme des überdeckenden Datensatzes; ANISE addiert { "2" } ns relative Bewegung für seine Nanosekunden-Epochen. Ergebnis: jeder der { "600" } Zustände und { "200" } Rotationen innerhalb seines Zielwerts gegenüber beiden Referenzen, auf den zugeschnittenen und auf den vollständigen Kerneln; ungünstigster Wert { "6.0e-3" } des Zielwerts (Position), { "5.9e-3" } (Geschwindigkeit), { "3.7e-3" } (Rotation). Mutation: Die Auswertung jedes Datensatzes bei -s lässt { "3597" } Vergleiche scheitern. Offengelegt: Eine frühere Prüfung mit 25 Epochen gegen SPICE ({ "4.6e-5" } m, tests/naif_kernel_reader_check.rs) wurde vor dieser Zeile gesehen und ist nicht ihr Beleg; der erste Lauf des Fixture-Generators brach an einem leeren Rasterintervall ab, bevor er einen Wert erzeugte, und wurde korrigiert. Beide Seiten lesen DE440, daher validiert die Übereinstimmung den Leser, nicht die Ephemeride

# text
seg-e08e98908f3a = Erde-GNSS in Mondentfernung

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Erde-GNSS-Empfang in Mondentfernung: die Schwachsignal-Schicht, die P7 Tabelle { "1" } nennt und für die die Engine kein Modell hatte. Je Satellit und je Epoche berechnet sie den Außeraxenwinkel gegenüber dem Nadir des Senders, ob die Erde den geraden Pfad verdeckt, die Schrägentfernung und ihre Freiraumdämpfung, den Sendegewinn bei diesem Winkel, die Empfangsleistung und die Trägerleistungsdichte zu Rauschen; anschließend aggregiert sie nur die Strecken, die eine Tracking-Schwelle überschreiten, und durchläuft einen vollen Umlauf der Konstellation, sodass die Antwort eine VERTEILUNG statt einer Momentaufnahme ist. Drei Tatsachen bestimmen das Ergebnis, und der Bericht nennt jede: Die Erde erscheint vom Konstellationsradius aus unter { "13.90" } Grad, sodass die Strahl-SPITZE für jeden zum Mond gerichteten Strahl geometrisch nicht verfügbar ist; übrig bleiben der Rand der Hauptkeule und die Nebenkeulen, das Regime, in dem LuGRE { "2025" } am Mond arbeitete; und die Pfaddämpfung auf L1 beträgt etwa { "208" } dB, rund { "25" } dB mehr als ein terrestrischer Nutzer zahlt. MEASURED an der mitgelieferten GPS-artigen Geometrie mit 24 Satelliten über { "64" } Epochen einer Umlaufperiode: SIGNAL-Verfügbarkeit { "0.375" } mit einer besten Strecke von { "30.93" } dB-Hz und FIX-Verfügbarkeit { "0.000" } - höchstens zwei gleichzeitig verfolgbare Strecken, nie die vier, die eine Position braucht. Die Trennung dieser beiden Verfügbarkeiten ist der Punkt, und der Bericht lässt nicht zu, dass sie verwechselt werden: Erde-GNSS in Mondentfernung ist eine Schicht der TIMING-Güteklasse, nicht der Positionsgüteklasse, und ein Layered-Resilience-Prior muss die Fix-Verfügbarkeit nehmen. Die Konditionierung wird aus demselben Grund ausgegeben - jeder sichtbare Satellit liegt vom Mond aus gesehen innerhalb eines Kegels von wenigen Grad Breite, sodass die Sichtlinien konstruktionsbedingt nahezu parallel sind. Ausführbar als Art <c1/> Neu gefasst nach D7: Die Aussage in Mondentfernung ist die RELATIVE Trägerleistungsdichte zu Rauschen zwischen Satelliten in einer Epoche, aus gemessenen zweidimensionalen Sendemustern (NAVCEN Block IIR/IIR-M), plus geometrische Sichtbarkeit; ein absolutes C/N0 wird nicht beansprucht (Parker et al. berichten einen gemeinsamen Verlust von { "7" } bis { "12" } dB).

# text
seg-29df5b40a3f9 = Mondbahnbestimmung: Erde-GNSS gegenüber bodengestützter Radiometrie

# text
seg-647902ebcee3 = Bahnbestimmung in einer fast geradlinigen Halo-Bahn (oder einer elliptischen eingefrorenen Bahn) aus zwei unabhängigen Datentypen: an Bord empfangene Erde-GNSS-Pseudoentfernungen (die Streckenregel der Zeile Erde-GNSS in Mondentfernung, plus Mondverdeckung) und bodengestützte Zweiweg-Entfernung und Entfernungsrate von drei Stationen des Deep Space Network. Jede ist eine Einschritt-Batch-Kleinste-Quadrate-Lösung um die Referenzbahn mit ihrer formalen Kovarianz; eine gesäte Monte-Carlo-Studie der Differenz der beiden Schätzungen prüft, ob die beiden Kovarianzen sie erklären (q = d' (P_G + P_R)^-1 d, Chi-Quadrat mit sechs Freiheitsgraden, wenn die Modelle übereinstimmen) und was eine unmodellierte Beschleunigung mit der Statistik macht.

# text
seg-226dedaba243 = Ein unabhängiges scipy/numpy-Programm integriert dieselben Variationsgleichungen (Zielwert O1). Nichts wird mit einer Messung einer Mondbahn verglichen. Die Referenz prüft die Numerik angegebener Formeln, nicht die Physik, daher bleibt die Zeile MODELLED. Eingeschränktes Dreikörpermodell: keine Sonne, keine Mondharmonischen, die Erdrotationsachse entlang der Bahnnormalen, ILLUSTRATIVE Empfänger- und Stationseingaben.

# text
seg-652bdc29deea = Auflösung der Trägerphasen-Mehrdeutigkeit am Mond: Oberfläche und Orbiter

# text
seg-02496f9e9af2 = Zwischen Empfängern einfach differenzierte Erde-GNSS-Trägerphase und Code an einer Mondoberflächenstation und einem Orbiter, wobei die Uhrendifferenz je Epoche herausprofiliert wird, eine Mehrdeutigkeit je kontinuierlichem Überflug und der längste Überflug als Eichung. Die Float-Mehrdeutigkeitskovarianz ist ein Schur-Komplement; LAMBDA löst die ganzen Zahlen auf, die Bootstrap-Rate wird neben einer gesäten Monte-Carlo-Erfolgsrate der ganzzahligen Kleinste-Quadrate-Lösung und den Positions-Sigmas für Float und Fixed angegeben. Berichtet wie gefunden: Bei den registrierten { "12" } dBi ist das Problem der Doppeldifferenz nicht bildbar (Änderung { "1" } verlegte den Standard auf { "25" } dBi, nachdem nur Verfügbarkeitszahlen gesehen wurden), und bei { "25" } dBi wird ganzzahliges Fixieren NICHT erreicht - außer Reichweite (höchstens wenige Prozent), obwohl sich die Float-Lösung mit dem Bogen verbessert.

# text
seg-8d8296752eb8 = Eine unabhängige numpy-Lösung derselben Normalgleichungen aus den exportierten Zeilen (Q3) und eine Brute-Force-Aufzählung der ganzen Zahlen (Q4). Es wird mit keiner GNSS- oder Mond-Trägerphasenmessung verglichen. MODELLED.

# text
seg-11dd1bb8e4e1 = Mitschätzung des Mondbezugssystems: Oberflächenstationen und Orbiter

# text
seg-a38c8d95e6c9 = Fisher-Information des Datums des Mondbezugssystems mit sieben Parametern aus Erdstations-Laserentfernungsmessung zu den fünf Reflektoren allein und mit zusätzlichen Orbiter-zu-Oberflächenstation-Entfernungen: die Informationsmatrix, der Rang, Cramér-Rao-Sigmas, die Degenerationsmetrik des Identifizierbarkeitsmoduls des Mondes und gesäte zufällige Stationsmengen. Die Bahn wird in den Mondachsen als bekannt gehalten (ihr Fehler wird vom Entfernungssigma des Orbiters getragen).

# text
seg-47d2afc53b3d = Eine unabhängige numpy-Finite-Differenzen-Rechnung des Vorwärtsmodells (F2). Es wird nichts mit realen Lösungen des Mondbezugssystems verglichen. Der Faktor ist bedingt durch die angenommene bekannte Bahn und das Entfernungssigma von { "1" } m. MODELLED.

# text
seg-862977c4bb01 = Präzision der Bezugssystem-Verknüpfung im Weltraum: ko-lokalisierte GNSS, VLBI und Laserentfernungsmessung

# text
seg-a9ae8e99f00d = Cramér-Rao-Präzision der Translations-, Maßstabs- und Rotationsversätze zwischen den Techniken für GNSS-, VLBI- und Laserentfernungs-Bezugssysteme, wenn ein Raumfahrzeug alle drei trägt, wobei die Raumfahrzeugposition in jeder Epoche eliminiert wird und neun Störparameter der lokalen Verknüpfung einen Prior tragen, über die Genauigkeit der lokalen Verknüpfung durchlaufen. Kovarianzen über den Quadratwurzelweg (Normalgleichungen verlieren die Stellen, wenn die Techniken nahezu perfekt sind).

# text
seg-b37ac7294112 = Ein unabhängiges numpy-System in gestapelter Form, bei dem die Positionsunbekannten durch explizite Schur-Komplemente eliminiert werden (T3). Es wird mit keinen Daten von GRASP, Genesis oder anderen Missionen verglichen. MODELLED.

# text
seg-ae627996875e = Sensitivität gegenüber Love-Zahlen und Libration des Mondes

# text
seg-28780d07c4a7 = Fisher-Information von h2, k2, l2 und den physikalischen Librationsamplituden aus Laserentfernungsmessung (radiale und horizontale Gezeitenverschiebung, Reflektorrotation), Orbiter-Tracking (die k2-Beschleunigung vom Grad 2, entlang der Sichtlinie integriert, Trend entfernt), einem Oberflächengravimeter (gravimetrischer Faktor { "1" } + h2 - { "1.5" } k2) und einer Oberflächenuhr (relative Rate ({ "1" } + k2 - h2) W2/c2, an die Mondzeitkonstanten gebunden). Nominalwerte von h2 und l2 sind Linearisierungspunkte; die Studie sagt, was wogegen empfindlich ist, nicht, was die Zahlen sind.

# text
seg-180d74388339 = Ein unabhängiger numpy-Aufbau mit finiten Differenzen (G2) und eine Auswertung in geschlossener Form (G4). Die k2-Sensitivität der Orbiter-Familie ist eine Zahl am oberen Ende (der Bahnzustand absorbiert hier nur eine Konstante und einen Trend). Es wird mit keiner Messung von Mondgezeiten oder Libration verglichen; k2 wird nach Lemoine et al. { "2014" } als Nominalwert zitiert. MODELLED.

# text
seg-da712b740519 = DOP-Verbesserung durch Oberflächenbaken auf dem Mond

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Durch Baken verbesserte Präzisionsverdünnung für einen Nutzer auf der Mondoberfläche: Die Sichtlinienzeilen der sichtbaren Satelliten und die Entfernungsmesszeilen der sichtbaren Oberflächenbaken werden zu einer Entwurfsmatrix verkettet und über den gemeinsamen DOP-Kern ausgewertet, und die resultierende DOP wird über einen Nutzeräquivalenz-Entfernungsfehler je Bake, zusammengesetzt als Wurzel aus der Quadratsumme von Uhrensynchronisations-, Mehrwege- und Vermessungstermen, auf eine realisierte 1-Sigma-Genauigkeit IN METERN abgebildet. Die Sichtbarkeit der Baken ist der geometrische Horizont des luftlosen Mondes bei zwei Höhen, der keine refraktive Erweiterung hat und daher exakt statt näherungsweise ist. Ausführbar als Szenarioart <c1/>, die Satelliten allein, Satelliten plus Baken und eine größere Konstellation als konkurrierenden Weg zur selben Geometrie angibt. MEASURED an der mitgelieferten Golden-Geometrie (Nutzer bei -80 Grad, drei vermessene Baken, illustratives LCNS mit sechs Satelliten bei t={ "0" }, Maske { "5" } Grad): { "5" } sichtbare Satelliten ergeben PDOP { "9.6941" } und ein 3-D-1-Sigma von { "11.222" } m; das Hinzufügen der Baken, die den Horizont tatsächlich überschreiten, ergibt PDOP { "4.1160" } und { "4.765" } m, ein Faktor von { "2.355" }; der Dienst mit 24 Satelliten ergibt stattdessen PDOP { "2.4226" } und { "2.804" } m, ein Faktor von { "4.002" }. Der Bericht gibt die Anzahl der SICHTBAREN Baken statt der konfigurierten aus, und bei dieser Geometrie überschreitet nur EINE der drei Baken den Horizont: Die beiden flankierenden Standorte liegen etwa { "333" } km vom Nutzer entfernt gegenüber einem Horizont von { "86" } km für eine Antenne von { "2" } m, sodass ein Leser nie annehmen muss, alle drei hätten beigetragen

# text
seg-179fb996fc72 = Die DOP-Arithmetik ist der Kern crate::orbit::dop, separat extern gegen gnss_lib_py validiert in tests/dop_reference.rs; diese Zeile leiht sich den Status jener Zeile nicht erneut. Der Horizont der Bakensichtbarkeit ist die geschlossene Form L01, und sigma = DOP x sigma_URE ist die Standardbeziehung der GNSS (Kaplan und Hegarty, Understanding GPS/GNSS, Abschnitt { "7" }). Innerhalb dieser Zeile wird die Verbesserung selbst gegen einen unabhängigen DOP-Pfad im Repository geprüft und auf eine eingecheckte Golden-Datei fixiert. WARUM MODELLED: Der Konstellationsentwurf, die Bakenplatzierung, die Antennenhöhen und alle drei Größenordnungen des Fehlerbudgets sind illustrative Eingaben statt einer im Einsatz befindlichen Vermessung oder einer gemessenen Strecke, sodass die angegebenen Meter eine Eigenschaft eines gewählten Szenarios und nicht eines eingesetzten Dienstes sind. HINWEIS ZUR HERKUNFT: Diese Fähigkeit wurde im README beworben und von zwei Validierungstests geübt, trug aber KEINE Matrixzeile und keine Szenarioart, sodass sie von einem Lauf aus gar nicht erreichbar war. Sie wurde in Prosa beansprucht, fehlte im Register und war in der Engine zugleich unerreichbar. Die Zeile und die Art wurden gemeinsam hinzugefügt. { "0.30" } Runde { "2" } (vorab registriert db0eb9ec), blockiert (bleibt MODELLED): ANISE-{ "0.10.6" }-Sichtbarkeit und eine numpy-DOP auf der Geometrie der Zeile stimmen überein (sichtbare Mengen exakt, einschließlich { "72" } Fälle nahe dem Horizont und { "48" } nahe der Maske; DOP innerhalb von { "7.2e-13" }), aber die angegebenen Meter sind DOP mal ein illustrativer Wurzel-aus-Quadratsumme-Entfernungsfehler von { "1.158" } m ohne Referenz; die Eingrenzung, die sie ausschließen würde, wartet auf eine Entscheidung des Verantwortlichen

# text
seg-b0b618abf402 = Integritätsblindheit bei Gleichtakt

# text
seg-e732ac99a9ae = Exakte Aufspaltung eines Messfehlers im Paritätsunterraum in den Teil, den RAIM nicht sehen kann, und den Teil, den es sehen kann. Für das linearisierte Momentaufnahmemodell y = G·x + e zerfällt jeder Fehler dy eindeutig in eine BLINDE Komponente in range(G) — als Zustandsfehler S·dy absorbiert und vom Residuenprojektor Pperp = I − G·S ausgelöscht, daher für JEDEN Residuentest unsichtbar, nicht nur für eine bestimmte Schwelle — und eine ERKENNBARE Komponente im Paritätsraum. Das Modul liefert den Projektor, die Aufspaltung und den blinden Anteil, sodass ein Aufrufer beziffern kann, wie viel eines bestimmten Fehlers ein Momentaufnahme-Monitor strukturell nicht melden kann. Angewandt auf die reale Untergrenze zwischen Ephemeriden: Die Abweichung DE440 gegenüber INPOP21a und DE440 gegenüber EPM2021 auf Meterebene in der geozentrischen Mondposition wird fast vollständig als Nutzerpositionsfehler absorbiert (Median des blinden Anteils { "1.000000" }; Median des blinden Positionsfehlers { "2.3955" } m und { "2.0050" } m) gegenüber einem Paritätsresiduum auf dem Niveau von { "1e-15" } m

# text
seg-077303e9dd72 = P2: numpy linalg.lstsq (LAPACK gelsd SVD, BSD-3) berechnet die Aufspaltung nach kleinsten Quadraten auf eingecheckten Eingaben MIT einem realen Paritätsanteil neu (dy = E·Δs + w, w ~ N({ "0" }, { "1" } m), Seed { "20261001" }) auf der Geometrie mit 8 Satelliten und einer Teilmenge mit 6 Satelliten, { "1464" } Fälle über beide realen Ephemeridenpaare, vorab registriert (f672a314): blind_dx, residual, blind_norm und detectable_norm innerhalb von { "1e-12" } relativ zu |dy| und blind_fraction innerhalb von { "1e-12" } absolut (ungünstigster Wert blind_dx { "1.06e-14" }, residual { "4.4e-15" }, blind_fraction { "3.1e-15" }). numpy baut G selbst aus den eingecheckten Positionen auf, während die Engine Normalgleichungen mit Gauß-Jordan verwendet; eine schiefe Linksinverse lässt den Test bei { "5.5e-2" } |dy| rot werden. Änderung { "1" } (86c53301, nach einem ersten Lauf, offengelegt) lockerte nur eine Eingabevoraussetzung für den Paritätsanteil (jeder Fall mindestens { "1e-3" } und { "95" } % jeder Geometrie mindestens { "0.05" }), nicht den Übereinstimmungs-Zielwert. Validierte Aussage, wie P2 sie zulässt: die lineare Algebra der Aufspaltung auf diesen Eingaben; die Größenordnungen der Untergrenze zwischen Ephemeriden und die illustrative Mondgeometrie ({ "8" } LCNS-artige Knoten bei { "5000" } km) sind Eingaben, nicht validiert, und die Blindheit ist eine bekannte Eigenschaft jedes Momentaufnahme-RAIM. Der numpy-Vergleich der Runde 1 (tests/lunar_common_mode_integrity_reference.rs) prüfte nur die Identität S·G = I, weil seine Eingaben in range(G) lagen; er wird als Regression beibehalten. Herkunft der Ephemeriden: tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)

# text
seg-845e9f5eec81 = Schutzniveau bei Gleichtakt und gesamte Integritätshüllkurve

# text
seg-2246ffa73869 = cmpl_horizontal begrenzt den k-Sigma-Horizontalpositionsfehler, den die blinde Gleichtaktklasse beiträgt, indem blind_position_covariance = S*Cov*S^T gebildet und in ENU projiziert wird; integrity_envelope gibt hpl_total = hpl_araim + cmpl an. Die Unterscheidung, die das Paar machen soll: Der RESIDUENTEST von RAIM/ARAIM ist nachweislich blind für Fehler in range(G), das SCHUTZNIVEAU von ARAIM aber nicht - sein fehlerfreier Term begrenzt sie bereits bis zu einer URA des Anbieters plus nominalem Bias. Das CMPL ist daher nur der anbieterübergreifende ÜBERSCHUSS, den die URA/ISM eines einzelnen Anbieters je Anbieter nicht überbegrenzt, und die Summe ist eine konservative Schranke nach der Dreiecksungleichung statt einer RSS, nur gültig, wo dieser Überschuss nicht bereits in der URA enthalten ist.

# text
seg-ffc59a7ed497 = Analytische Projektoralgebra, gegen sich selbst geprüft: Eine auf range(G) beschränkte Kovarianz muss ein positives CMPL ergeben, eine auf den Paritätsraum beschränkte etwa null, und die Hüllkurve muss zwei im Messraum orthogonale Beiträge summieren. Die Gleichtakt-Kovarianz, die Konstellationsgeometrie und k sind repräsentative modellierte Eingaben, KEIN zertifiziertes Budget, und es wird nicht behauptet, dass die Dreiecksschranke scharf ist. HINWEIS ZUR HERKUNFT: cmpl_horizontal, blind_position_covariance und integrity_envelope sind öffentlich und ausgeliefert, und ihre Unit-Tests wurden von der Zeile zur Gleichtaktblindheit bereits zitiert, aber die AUSSAGE ZUR HÜLLKURVE selbst trug keine Zeile - so wurde der eine Vorbehalt, der sie ehrlich hält, dass die Summe eine Dreiecksschranke und keine RSS ist, nirgends im Register angegeben. Die Zeile registriert die Aussage und den Vorbehalt gemeinsam.

# text
seg-5ed34a5b402e = Gemeinsame Multitechnik-Bahnbestimmung + Uhr am Mond

# text
seg-5ace1caff5a9 = Batch-Fusion von VLBI + mondlokaler Entfernung + Inter-Satelliten-Entfernung zur Wiedergewinnung von Positionen und Uhren der Stationen und der Konstellation

# text
seg-82824963aef7 = P2: numpy { "2.4.6" } (numpy.linalg.lstsq mit LAPACK gelsd, numpy.linalg.inv; BSD-3) berechnet jeden Gauß-Newton-Schritt, die konvergierte gewichtete Kleinste-Quadrate-Lösung, die formalen Sigmas und den Stationsfehler auf den eingecheckten Jacobi-Matrizen und Beobachtungen von sechs simulierten Netzen neu, vorab registriert (5094bc31) bei max({ "1e-8" }, { "100" } kappa eps) relativ. Der erste Lauf scheiterte am Netz ohne VLBI ({ "6.1e-7" } gegenüber { "1e-8" }, eine Normalgleichungs-Inverse bei Kondition { "1.4e5" }); die nach diesem Ergebnis geschriebene Korrektur der Engine (batch_ls::gauss_newton_qr, ein Householder-QR-Schritt, den estimate und formal_covariance verwenden) wurde beim unveränderten Zielwert erneut ausgeführt: Schritte { "1.1e-14" } bis { "2.4e-11" }, Sigmas höchstens { "1.3e-11" }. Die validierte Aussage ist die lineare Algebra der Fusionslösung auf diesen Eingaben, nicht die physikalischen Größenordnungen des simulierten Netzes oder seiner Beobachtungsmodelle: Die Zeile zur geodätischen Mond-VLBI-Verzögerung bleibt MODELLED (ihr analytischer Pfad weicht von ANISE um bis zu { "24" } µs ab), und die Bezugssysteme haben ihre eigenen Zeilen. Die Wiedergewinnung einer eingespeisten simulierten Wahrheit und die NEES-Konsistenz bleiben interne Prüfungen; die frühere Gegenprüfung mit Orekit { "12.2" } / Hipparchus Levenberg-Marquardt (tests/lunar_joint_multi_technique_od_reference.rs) übt batch_ls::gauss_newton, das estimate nicht mehr aufruft, und wird als Prüfung dieses Primitivs beibehalten. Revision { "0.30" }: Die Stationsfehler des Standards lunar-joint-od-clock { "3.541344" } -> { "3.541350" } m mit VLBI und { "2183.119" } -> { "2183.558" } m ohne (QR-Lösung). Revision { "0.36" } (STUDIO-15, portable Mathematik; docs/revisions/STUDIO15-portable-math-rebaseline.md): { "3.541350" } -> { "3.536885" } m mit VLBI und { "2183.558" } -> { "2184.021" } m ohne, und die Lösung ohne VLBI bricht nach { "5" } Iterationen ab, nicht nach { "2" } (ein durch Rundungsfehler begrenzter Abbruch beim schlecht konditionierten Netz); der vorab registrierte Vergleich wurde mit neu exportierten Eingaben beim unveränderten Zielwert erneut ausgeführt (numpy { "2.4.6" }, alle sechs Netze bestehen)

# text
seg-1b96577665fc = Radiometrie, MTF, relative Kantenantwort und GIQE { "4" } NIIRS eines elektrooptischen Bildgebers

# text
seg-07ca77a67207 = Verluste beim Raketenaufstieg durch Gravitation, Widerstand, Lenkung und Gegendruck

# text
seg-58cbf576c959 = Leser für TRK-2-18-Orbit-Data-Files und gerampetes Mars-2-Wege-Dopplermodell

# text
seg-d1055650a77f = Ein Leser für DSN-Orbit-Data-Files (TRK-2-18): die 36-Byte-Satzgruppen (Dateikennsatz, Kennung, Bahndaten, Rampen je Station, Uhrenversätze, Zusammenfassung, Dateiende) und in jedem Bahndatensatz die Zeitmarke seit { "1950" }, Downlink- und Uplink-Verzögerungen, Observable, Stationen, Datentyp, Bänder, Gültigkeit, Kanal, Raumfahrzeug, die 46-Bit-Referenzfrequenz und die Kompressionszeit; Start- und Endzeiten der Rampen, Raten und Startfrequenzen. Darauf aufbauend ein gerampetes 2-Wege-X-Band-Dopplermodell (integrierte Uplink-Rampen, Rundlauf-Lichtlaufzeit mit Shapiro und Troposphäre, DSN-Stationen über die CIO-Kette IAU 2006/2000A und IERS-EOP, Stationszeit) und eine Batch-Bahnbestimmung für Mars-Orbiter (GMM-3-Feld, Drittkörper, SRP, Widerstand).

# text
seg-6d533149f6f0 = Das PDS3-Label, das der Datenaufbereitungsprozess der DSN-Navigation mit der Datei erzeugt hat (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), geprüft gegen Zielwerte, die in xval/mro-odf/PREREGISTRATION.md vorab registriert wurden, bevor der Leser existierte. MODELLED, weil ein registrierter Zielwert (die Zeilen der Dateiende-Tabelle, { "121" } in der Datei gegenüber { "120" } im Label) verfehlt wurde; das Label ist dort in sich widersprüchlich. Stufe { "2" } (xval/mro-od/PREREGISTRATION.md, Änderungen A1 und A2 vor dem bewerteten Ergebnis): Der aus der Rekonstruktion des MRO-Navigationsteams (mro_psp5, NAIF) vorhergesagte Doppler stimmt mit dem beobachteten gerampeten 2-Wege-Doppler auf { "12.5" } mHz auf Überflügen überein, die nicht in der Entwicklung verwendet wurden, Zielwert erreicht; die registrierte Bahnbestimmung scheiterte auf dem bewerteten Bogen (Normalmatrix nicht positiv definit) und lieferte keine Bahn, daher wurden die Bahn-Zielwerte nicht erreicht. Lauf { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, ein gedämpfter Schätzer, derselbe Bogen und dieselben Zielwerte, eine Bewertungsänderung R2-A1 offengelegt in docs/revisions) konvergierte: Die geschätzte Bahn liegt innerhalb von { "0.36" } km RMS ({ "0.53" } km Maximum) der Rekonstruktion, Zielwerte erreicht, aber der Post-Fit-Doppler-RMS beträgt { "48.6" } mHz gegenüber dem Zielwert von { "30" } mHz, nicht erreicht, daher bleibt die Zeile MODELLED. WAS NICHT: Keine geschätzte Bahn hat jeden registrierten Zielwert erreicht; Ionosphäre, Sonnenplasma und der größte Teil des Antennenversatzes (ein radialer Versatz von { "1.5" } m wird auf dem Entwicklungsüberflug angepasst) sind nicht modelliert.

# text
seg-c7d292f14693 = Geschlossene MRP-Rückführungs-Lageregelung mit Reaktionsrädern

# text
# c1: aocs
seg-f33781b74cc2 = Trägheitsorientierte Lageregelung eines starren Körpers mit drei oder mehr ausgewogenen Reaktionsrädern: das MRP-Rückführungsgesetz L_r = -K sigma_BR - P omega_BR (Schaub und Junkins), normminimale Radmotormomente G_s u = -L_r, auf die Grenze jedes Rades begrenzt, die gekoppelte Dynamik von Körper und Rädern mit der Körperträgheit, die die Spinträgheit der Räder trägt, Quaternionenkinematik, RK4 mit einem Halteglied nullter Ordnung. Ausführbar als Szenarioart <c1/> (Schleife mit wahrem Zustand).

# text
seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; der Lauf mit bsk-Rädern als getrenntes Werkzeug, nie gelinkt oder mitgeliefert): Raumfahrzeugkörper, reactionWheelStateEffector (BalancedWheels, Momentengrenze an), simpleNav, inertial3D, attTrackingError, mrpFeedback (ohne Integralterm) und rwMotorTorque bei dt = { "0.1" } s mit seinem RK4, gegenüber der eigenen Implementierung von Kshana in drei Fällen (drei orthogonale Räder; eine Vierrad-Pyramide; ein sättigender Vierrad-Fall), Zielwerte vorab registriert in xval/aocs-basilisk/PREREGISTRATION.md vor dem Code und dem Lauf. Alle Zielwerte hielten im ersten Lauf. WAS NICHT: Sensorrauschen in der Schleife, Integralrückführung, Tracking-Führung, Radreibung, Jitter, Drehzahlgrenzen und Leistung, die Verstärkungen eines realen Raumfahrzeugs; der Vergleich prüft die Implementierung des Gesetzes und der Dynamik gegen eine unabhängige, keinen Flugregler.

# text
seg-455dc946c965 = Multiplikative EKF-Lageschätzung aus einem Gyro und einem Sternsensor

# text
# c1: aocs
seg-553d043438b4 = Das multiplikative EKF nach Lefferts-Markley-Shuster: Lagefehler im Körpersystem und Gyro-Bias-Zustände, Propagation mit der Gyrorate abzüglich der Bias-Schätzung und dem diskreten Prozessrauschen nach Farrenkopf (Winkel- und Raten-Random-Walk), Sternsensor-Updates mit dem Residuum { "2" } vec(q^-1 q_st) in Joseph-Form und dem multiplikativen Reset; ein diskreter Gyro- und Sternsensor-Simulator nach Farrenkopf. Die Art <c1/> kann den Regelkreis auf seiner Schätzung schließen.

# text
seg-846cb1eeb35c = Interne Konsistenz: der normierte quadrierte Schätzfehler des Filters gegenüber einer Wahrheit, die aus denselben Sensormodellen über Monte-Carlo-Seeds simuliert wurde, und die Konvergenz der Lage- und Bias-Schätzungen. WAS NICHT: Es wurde kein externer Schätzer und keine Flugdaten verglichen (Basilisk { "2.9.1" } hat kein MEKF-Modul); die Sensormodelle sind die aus dem Lehrbuch, ohne Fehlausrichtung, Skalenfaktor oder Gesichtsfeldeffekte des Sternsensors.

# text
seg-059732bda693 = Lagebestimmung nach Wahba/TRIAD/QUEST

# text
seg-3ee6e56d790f = Optimale dreiachsige Lage aus gewichteten Vektorbeobachtungen (Stern-/Sonnen-/Magnetometerrichtungen): das deterministische Zweivektor-TRIAD, die q-Methode von Davenport (der exakte Minimierer des Wahba-Verlusts — das optimale Quaternion ist der Eigenvektor zum größten Eigenwert der { "4" }×{ "4" }-Davenport-Matrix K, gelöst mit einem symmetrischen Jacobi-Eigenlöser) und QUEST (Newton-/Sekanten-Nullstelle der charakteristischen Gleichung von K, mit Σ Gewichte als Startwert, danach Quaternion-Rückgewinnung über den Gibbs-Vektor)

# text
seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }) — die SVD-Lösung nach Kabsch/Markley für das Wahba-Problem, ein wirklich unabhängiger Algorithmus (SVD der Lageprofilmatrix) und eine eigene Codebasis gegenüber dem Davenport-K-Eigenlöser / dem Wurzelverfahren der charakteristischen Gleichung nach QUEST in kshana, die DIESELBE eindeutig definierte Wahba-optimale Lage berechnet. Auf rauschfreien gewichteten Vektorbeobachtungsmengen reproduzieren TRIAD, die q-Methode und QUEST die optimale Rotation von scipy bis <{ "1e-9" } rad (verglichen über den vorzeichenunabhängigen Lagefehlerwinkel). Die statistische Aussage 'optimal schlägt TRIAD' aus verrauschtem Monte-Carlo bleibt MODELLED (keine externe Referenz); nur Beobachtungen als punktförmige Richtungs-Einheitsvektoren — keine Modellierung von Sensorgesichtsfeld/Bias/zeitlicher Korrelation, und QUEST ist bei { "180" }° singulär (die q-Methode deckt diesen Fall ab)

# text
seg-cd342cc48afc = Erkennungsstatistik der Square-Law-Akquisition bei GNSS

# text
seg-6d97452de33e = Square-Law-Akquisitionsdetektor (nichtkohärent) über eine Suche Codephase × Doppler: Fehlalarmwahrscheinlichkeit (zentrales χ² mit 2M Freiheitsgraden), die Schwelle, die ein Ziel-P_fa erreicht (χ²-Verteilungsfunktion per Bisektion umgekehrt), und Detektionswahrscheinlichkeit (nichtzentrales χ² mit Nichtzentralität 2M·ρ für das SNR ρ je Zelle nach der Korrelation), mit der verallgemeinerten Marcum-Q-Funktion Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

# text
seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — ein unabhängiger Algorithmus (Kettenbruch für nichtzentrales/zentrales χ²) gegenüber der Reihe der unvollständigen Gammafunktion in kshana (raim::chi2_cdf / noncentral_chi2_cdf), der denselben eindeutig definierten KERN der Detektionsstatistik berechnet: die verallgemeinerte Marcum-Q-Funktion Q_M(a,b)=ncx2.sf(b²,2M,a²), die Detektionswahrscheinlichkeit P_d, die Fehlalarmwahrscheinlichkeit P_fa und die Umkehrung P_fa→Schwelle, übereinstimmend bis ~{ "1e-6" } — dieselbe Unabhängigkeitsbasis wie in der validierten Zeile 'RAIM/ARAIM integrity statistical kernel'. Nur der KERN: das CFAR-Zellmitteln je Zelle und der Straddling-Verlust der Code-/Doppler-Bins bleiben MODELLED

# text
seg-77f425a38aa2 = Auflösung ganzzahliger Trägerphasen-Mehrdeutigkeiten bei GNSS (LAMBDA)

# text
seg-410ce8b6cebf = Fixieren der Mehrdeutigkeiten durch ganzzahlige Kleinste-Quadrate-Lösung nach der LAMBDA-Art: eine volumenerhaltende ganzzahlige (Z-)Dekorrelationstransformation (ganzzahlige Gauß-Größenreduktion des Faktors L D Lᵀ) + eine exakte ganzzahlige Kleinste-Quadrate-Suche mit Tiefensuche und Branch-and-Bound nach Schnorr–Euchner, mit dem Ratio-Test auf den zwei besten Kandidaten (die validierte Aussage); dazu die Bootstrap-Erfolgsrate in geschlossener Form P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), nur intern geprüft und außerhalb der validierten Aussage

# text
seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (seine Quelldatei lambda.c, T. Takasu, BSD-2-Clause), eine unabhängige LAMBDA-Reduktion und MLAMBDA-Suche, aus C kompiliert und als Werkzeug ausgeführt, auf { "300" } zufälligen Kovarianzen (n { "2" } bis { "10" }): Die ganzzahlige Kleinste-Quadrate-Lösung hat einen eindeutigen Minimierer, daher müssen die fixierten ganzen Zahlen identisch sein ({ "0" } Abweichungen), und die beiden besten quadrierten Normen, die in den Ratio-Test eingehen, stimmen auf { "1e-9" } relativ überein (gemessen { "5.6e-13" }); Toleranz vor dem Vergleich festgelegt. Validierte Aussage: die ILS-Lösung und ihre beiden besten Normen. RTKLIB berechnet die Bootstrap-Erfolgsrate nicht, die weiterhin intern gegen eine Monte-Carlo-Simulation des Rundungsprozesses geprüft wird; die Invarianten der Z-Transformation und die Brute-Force-Aufzählung bleiben als stützende Prüfungen bestehen. Nur ganzzahlige Gauß-Dekorrelation (die Umordnungspermutationen der vollständigen LAMBDA-Reduktion beschleunigen die Suche, ändern aber weder die exakte ILS-Antwort noch die Bootstrap-Rate)

# text
seg-4ad1ec05610f = B-Ebenen-Zielführung und Gravity Assist mit gepatchten Kegelschnitten

# text
seg-d249aea7c3ea = Geometrie des hyperbolischen Vorbeiflugs (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, Ablenkwinkel δ={ "2" }·asin(1/e), Stoßparameter |B|=|a|·√(e²−{ "1" })), das Zielpunkt-Bezugssystem Ŝ/T̂/R̂ der B-Ebene und die Zerlegung B·T̂/B·R̂ sowie ein Gravity Assist mit gepatchten Kegelschnitten (Betrag von v∞ erhalten, Richtung um δ abgelenkt, heliozentrisches Δv={ "2" }·v∞·sin(δ/2) ohne Treibstoffkosten) mit dem Tisserand-Parameter T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

# text
seg-1ec7b0d8a32c = GMAT R2026a (Apache-2.0, als getrenntes Programm ausgeführt) auf { "192" } hyperbolischen Erdzuständen: B.T, B.R und |B| innerhalb von { "1e-6" } km (ungünstigster Wert { "1.35e-8" } km), der Ablenkwinkel und beide Asymptoten innerhalb von { "1e-9" } rad (ungünstigster Wert { "9.3e-15" } rad); die Geschwindigkeitsänderung des Assists aus GMAT-C3 und Asymptoten innerhalb von { "1e-9" } v_inf (ungünstigster Wert { "5.6e-14" }); heliozentrische SMA, ECC und INC auf { "350" } sonnenzentrierten Zuständen vor und nach dem Assist innerhalb von { "1e-9" } relativ und { "1e-12" } rad (ungünstigster Wert { "2.2e-14" } und { "4.1e-14" } rad); der Tisserand-Parameter gegen sbpy { "0.6.0" } (BSD-3) auf GMAT-Elementen innerhalb von { "1e-9" } (ungünstigster Wert { "1.3e-15" }) und gegen { "3" } - C3/v_c^{ "2" } ({ "8.9e-16" }); und die geschlossene Form von Tisserand gegen Kasuga und Jewitt ({ "2019" }) Tabelle { "8.1" } für { "12" } Objekte innerhalb der Schranke der gedruckten Rundung (ungünstigster Wert { "0.39" } davon; ein veröffentlichter Rechenwert nach P1). Vorab registriert (436293bf; heliozentrische Reparatur 6fd9f5e6); die Änderung 374c806b, geschrieben nach der Erzeugung der Referenzdateien und vor jedem Kshana-Wert, weitete den Eingabefilter für die Inklination von { "1e-2" } auf { "1e-3" } rad und behielt damit mehr und schlechter konditionierte Zustände. MODELLED Geltungsbereich: Zweikörper-Vorbeiflug mit gepatchten Kegelschnitten auf einer kreisförmigen Planetenbahn, kein Übergang der Einflusssphäre, keine Störungen bei der Begegnung und keine Ephemeride

# text
seg-8e82da17a463 = CRPA-Anti-Jam-Array-Strahlformung

# text
seg-1744f527b4d1 = Nullung einer Antenne mit kontrolliertem Empfangsmuster: komplexe Array-Steuervektoren a(û)=exp(j·k·pₙ·û), deterministische Nullsteuerung (Einheitsgewinn zum SV, exakte Nullen zu bis zu N−{ "1" } Störern über das normminimale w=Aᴴ(AAᴴ)⁻¹b) und adaptive MVDR-Gewichte w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv), die tiefe Nullen selbstständig auf starke Störer lenken (mit einem komplett selbst geschriebenen Kern der komplexen linearen Algebra)

# text
seg-8016dae66350 = numpy.linalg / scipy.linalg (LAPACK-zgesv-Komplexlösung) — eine von dem komplett selbst geschriebenen komplexen Kern in kshana unabhängige Codebasis der linearen Algebra, die DIESELBEN eindeutig definierten Gewichte berechnet: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) und normminimale Nullsteuerung w=Aᴴ(AAᴴ)⁻¹b, dazu die resultierenden Array-Antwortgewinne, übereinstimmend bis ~{ "1e-9" } — dieselbe Klasse von Referenz wie bei den validierten Zeilen zu DOP (gnss_lib_py) und Fisher-Information (numpy). MODELLED schmalbandiges Fernfeld-Array aus identischen isotropen Elementen — keine Verkopplung, keine Fehlanpassung je Element, keine endliche Bandbreite (STAP) und kein Schätzfehler des Steuervektors

# text
seg-f2c973f14d52 = Potenzgesetz-Uhrenrauschen nach IEEE-1139 + Flicker-FM-Untergrenze

# text
seg-4a0159558671 = Die Umrechnung PSD↔Allan-Varianz nach IEEE-1139 mit fünf Koeffizienten S_y(f)=Σh_α f^α → σ_y²(τ) (weißes/Flicker-PM, weißes/Flicker-/Random-Walk-FM), die Flicker-FM-Untergrenze σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) als erstklassiger anpassbarer Term und eine nichtnegative Anpassung der FM-Familie in der Basis { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" }, die die Untergrenze wiedergewinnt, die die Driftbasis { "{" }1/τ,τ,τ³{ "}" } nicht darstellen kann

# text
seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; Koeffizienten nach Kasdin & Walter { "1992" } / Vernotte { "2015" }) — eine unabhängige Codebasis eines Drittanbieters mit eigener Zitatlinie, die DIESELBE eindeutig definierte Umrechnung PSD→Allan nach IEEE-1139 σ_y(τ) für jeden der fünf Potenzgesetz-Rauschtypen berechnet. powerlaw::allan_deviation von kshana stimmt mit den geschlossenen Formen von allantools überein (weißes/Flicker-FM, RW-FM und weißes PM auf <{ "5e-9" } relativ; Flicker-PM auf ~{ "1e-5" } — das echte Unabhängigkeitssignal, da kshana die tabellierte Konstante { "1.038" } aus NIST-SP-1065 verwendet gegenüber dem vollen 3γ−ln2 von allantools), und die Flicker-FM-Untergrenze √({ "2" } ln2·h_{ "{" }-1{ "}" }) stimmt über die ganze Leiter mit allantools überein — dieselbe Latte, die die validierten Zeilen MDEV/TDEV/Theo1/MTIE nehmen. MODELLED stationäres Potenzgesetzmodell — kein deterministischer Drift-Term (τ²); gerätespezifische Koeffizienten / gemessene Untergrenzen bleiben modelliert

# text
seg-cc1ac065e684 = Austausch des Kovarianzblocks im CCSDS-OEM

# text
seg-ec4d44e7cf78 = Serialisieren und Parsen des CCSDS-{ "502.0" }-OEM-Blocks COVARIANCE_START…COVARIANCE_STOP — die { "6" }×{ "6" }-Kovarianz von Position/Geschwindigkeit, geschrieben als ihr unteres Dreieck mit 21 Elementen (kanonische Reihenfolge CX_X … CZ_DOT_Z_DOT) mit dem optionalen COV_REF_FRAME, als Ergänzung zum vorhandenen Writer/Parser für OEM-Zustandsvektoren, sodass Kovarianzen aus Bahnbestimmung und Filtern im Standardformat einen Round-Trip bestehen

# text
seg-891b86506bf6 = oem { "0.4.5" } (MIT, https://pypi.org/project/oem/) — derselbe unabhängige CCSDS-502-Parser, dem auch die validierte Zeile 'CCSDS OEM interoperability' vertraut, eine völlig getrennte Codebasis (eigener KVN-Tokenizer, eigene Zustandsmaschine für den Kovarianzabschnitt und eigener Aufbau der numpy-Matrix). kshana gibt ein vollständiges OEM-Segment mit seinem unbeschrifteten COVARIANCE-Block aus nackten Zahlen im unteren Dreieck aus; oem parst es und rekonstruiert die symmetrische { "6" }×{ "6" }-Matrix, die mit der Eingabekovarianz von kshana Element für Element bis auf die f64-Rundung übereinstimmt — ein echter Bibliothek-gegen-Bibliothek-Austausch-Round-Trip (verglichen mit der Rekonstruktion von oem, nicht mit einem erneuten Parsen durch kshana), der die bisherige Lücke der Zeile 'kein Fixture eines Drittanbieters' schließt

# text
seg-ae061c7f082c = Fehlerwachstum und Schwellendurchgänge bei INS/TRN-Auslauf

# text
# c1: ins-trn-coast
seg-7bacdc8aa0d8 = Budget Positionsfehler gegenüber Auslaufdauer, aufgebaut aus IMU-Koeffizienten, wobei jede Fehlerquelle (Beschleunigungsmesser-Bias, Gyro-Bias, Geschwindigkeits-Random-Walk, Winkel-Random-Walk, Skalenfaktor im Reiseflug und unter anhaltender spezifischer Kraft) durch ein INS-Fehlermodell mit neun Zuständen im lokalen Horizontsystem mit Schuler-Rückführung propagiert wird (inertial::coast::ErrorDynamics nach Groves 2. Aufl. Kap. { "14" }: Lage-, Geschwindigkeits- und Positionsfehler, der vertikale Kanal mit seinem Gravitationsgradienten, WGS-84-Radien und Normalschwere, eine ebene Plattform mit Kurs Nord bei der konfigurierten Geschwindigkeit, latitude_deg und height_m; systematische Terme durch eine erweiterte Matrixexponentialfunktion, Random Walks nach Van Loan), die Monome der flachen Erde nur als leading_order_m beibehalten; Beiträge kombiniert nach einer angegebenen Regel (rss / linear-sum / deterministic-sum-with-stochastic-rss); die Auslaufdauern, die vom Aufrufer gelieferte Positionsschwellen erreichen (standardmäßig { "10" } m und { "50" } m), durch einen Vorwärtsdurchlauf bis zum ersten Durchgang bestimmt (first_crossing_s, da die durch Schuler begrenzten Kurven nicht monoton sind), mit der dominanten Quelle an jedem Durchgang; und ein TRN-begrenzter Modus, der das größte Geländefix-Intervall angibt, das jede Schwelle hält. Ausführbar als Szenarioart <c1/>

# text
seg-622af0bd27de = NaveGo v1.4 (Commit 24d9488, LGPL-3.0), als getrenntes Programm unter GNU Octave { "8.4.0" } ausgeführt: frei-inertiale Auslaufläufe mit demselben IMU-Fehlerprofil, mit einer korrigierten numerischen Totzone in seinem Quaternion-Update (qua_update.m: die Absicherung bei einer Rate unter { "1e-8" } rad/s ersetzt durch wnorm == { "0" }, auf eine Laufzeitkopie angewendet und einmal als übereinstimmend bestätigt; mit der Absicherung fror eine langsam driftende Plattformlage ein und unterbrach die Schuler-Rückführung). Vorab registriert (4262b969) mit dem korrigierten Generator, bevor er lief; die Engine (440b3877) wurde eingecheckt, bevor eine korrigierte Ausgabe geöffnet wurde; derselbe { "5" }-%-Zielwert, dieselben { "48" } Punkte, Terme, Seeds und Statistik wie in Runde { "1" }. Ergebnis: 48/48 innerhalb von { "5" } % (ungünstigster Wert +{ "3.70" } % Geschwindigkeits-Random-Walk bei { "1200" } s, +{ "3.33" } % Winkel-Random-Walk bei { "1800" } s); bei { "3600" } s ergeben NaveGo/Kshana 2375.4/2376.2 m für den Beschleunigungsmesser-Bias und { "130" } 885/131 { "675" } m für den Gyro-Bias. Das Nullsetzen der Schuler-Transportraten-Rückführung lässt den Test scheitern (+{ "695" } % bei { "3600" } s). Offengelegt: Die Einkanal-Vorhersagen nach Schuler und die NaveGo-Werte aus Runde 1 waren bekannt; das Modell hat keinen angepassten Parameter. Geltungsbereich: die Fehlerkurven je Term bei taktischer Klasse, { "45" } Grad N, eben und nordweisend, bis { "3600" } s; die Durchgänge, die Kombinationsregel und der TRN-Modus sind deterministische Funktionen dieser Kurven. Die Koeffizienten der IMU-Klasse (Bandwerte aus Groves { "2013" } Tabelle { "4.1" }) und das Fix-Residuum des TRN bleiben MODELLED Eingaben. Runde { "1" } (abgelöst): Die Monome der flachen Erde, nun leading_order_m, überschätzen jenseits von { "600" } s (2.2x bis 8x bei einer Stunde). Revision { "0.30" }: Jede Ausgabe von ins-trn-coast verschiebt sich (die Spitze des TRN im mitgelieferten Szenario { "52.932679" } -> { "44.711834" } m)

# text
seg-a971ff07592a = Einsatzanteil der Apertur für Navigation gegenüber Kommunikation

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Ein Lauf nimmt einen Kontaktplan (eine Liste von aos_s/los_s-Fenstern, die jeweils die Apertur für Navigation oder Kommunikation anfragen — dasselbe Fenstervokabular, das <c1/> ausgibt, umgewandelt durch <c2/>), eine Aperturzahl und eine ausdrückliche Arbitrierungsrichtlinie und liefert den Navigationsanteil, den Kommunikationsanteil, den Leerlaufanteil und den Ausfall je Sitzung. Die Richtlinie ist eine Eingabe mit dokumentiertem Standard (<c3/>; auch <c4/> und nicht verdrängendes <c5/>), und der Bericht trägt die aufgelöste Richtlinie, ihre vollständige Definition und die Definitionen von Anteil und Ausfall, weil eine Anteilszahl, die ohne ihre Arbitrierungsregel zitiert wird, nicht reproduzierbar ist. Der Zeitplan ist ein exakter Intervalldurchlauf über die Fenstergrenzen, sodass ein Fenster, das genau dort endet, wo das nächste beginnt, nie konkurriert, und Aperturzeit für Navigation, Kommunikation und Leerlauf in diesem einen Durchlauf unabhängig akkumuliert werden. Ausführbar als Szenarioart <c6/>

# text
# c1: passes::predict_passes
seg-656fd7d44a9e = Interne Konsistenz, aus drei Größen, die im selben Durchlauf durch verschiedene Ausdrücke berechnet und dann zum Schließen gezwungen werden. Aperturzeit für Navigation, Aperturzeit für Kommunikation und Aperturzeit im Leerlauf werden getrennt akkumuliert — der Leerlauf aus (Aperturen − |bedient|) je Elementarintervall, nie als Rest — und ihre Summe wird gegen Aperturen × horizon_s geprüft, was eine falsch eingeklammerte Grenze, ein doppelt gezähltes oder ein ausgelassenes Intervall sofort bricht; die bedienten Zeiten je Sitzung müssen separat zu den beiden Dienstsummen zurückaddieren. Die strukturellen Eigenschaften des Planers werden gemessen statt angenommen: Die bediente Zeit wird als nicht fallend in der Aperturzahl über { "200" } pseudozufällige Pläne für alle drei Richtlinien geprüft (nicht offensichtlich bei der nicht verdrängenden Richtlinie, bei der eine zusätzliche Apertur an jeder späteren Grenze ändert, wer was hält), und die Grenzarithmetik ist am Paar aus Berührung/Eine-Sekunde-Überlappung festgenagelt, wo sich ein Off-by-one sonst verstecken würde. Die Brücke zum Überflugprädiktor wird gegen die Ausgabe von <c1/> geprüft: Mit einer Apertur und ohne konkurrierenden Dienst ist die Aperturzeit für Navigation gleich der eigenen aufsummierten Überflugdauer des Prädiktors. Es wird keine externe Referenz beansprucht, und es gibt keine: Die Fähigkeit ersetzt Handarithmetik, statt gegen sie geprüft zu werden, der mitgelieferte Kontaktplan ist illustrativ und nicht geflogen, und kein operativer Planer veröffentlicht ein Paar aus Plan und Antwort mit angegebener Arbitrierungsregel — ein unter nicht angegebener Richtlinie berechneter Anteil ist mit einem unter angegebener Richtlinie berechneten nicht vergleichbar, und die Abhängigkeit von der Richtlinie wird gemessen (Navigationsanteile von 100/150 gegenüber 50/150 bei identischem Plan). Schwenk- und Umschaltzeit, Datenvolumen, Pufferzustand, Energie und Streckenschließung sind im Berichtslabel ausgeschlossen, statt stillschweigend modelliert zu werden

# text
seg-43cd7aa7ab53 = HF-Jamming der Mondoberflächen-Navigation (J/S je Satellit)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Mondeigenes Verhältnis von Störer zu Signal, effektives C/N₀ und Lock-Verlust für einen selenographischen Oberflächennutzer unter einem Störer auf der Mondoberfläche (oder erhöht) über der illustrativen Konstellation der Klasse Moonlight/LCNS aus öffentlichen Quellen. Setzt die offene Jamming-Kette (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) mit der offenen Mond-Himmelsgeometrie (lunar_service::LunarConstellation + topozentrisch, lunar::selenographic_to_mcmf) zusammen; weder Geometrie noch Radiometrie werden neu hergeleitet. Anders als bei der Erd-Art <c1/> ist die Signalstrecke keine feste Empfangsleistung: Die isotrope Empfangsleistung jedes Satelliten ist seine eigene Link-Budget-EIRP − FSPL(Schrägentfernung), sodass J/S von Satellit zu Satellit mit Mondentfernung und Elevation variiert. Gibt EINE ZEILE JE SICHTBARER (Epoche, Satellit) STRECKE als JSON und als *.table.csv-Artefakt aus, mit beiden Empfangsleistungen, deren Differenz das J/S ist, daneben gedruckt; aggregierte Gütezahlen stehen neben dieser Tabelle, nie an ihrer Stelle. Ausführbar als Szenarioart <c2/>

# text
seg-2a4393ae7c52 = Kompositions-Gegenprüfung gegen einen unabhängigen Codepfad im Repository: Jedes J/S je Strecke wird als Differenz zweier Link-Budgets neu hergeleitet, die mit linkbudget::received_signal_power_dbw berechnet werden, dessen Freiraumdämpfung der einzelne Ausdruck { "20" }·log10(4πRf/c) ist statt der Dreiterm-Summe, die jamming::free_space_path_loss_db verwendet — beide stimmen auf jeder Zeile auf < { "1e-9" } dB überein (gemessener ungünstigster Fall { "7.11e-14" } dB, d. h. Gleitkomma-Rundung). Die zugrunde liegende Störungskette, die sie zusammensetzt, ist separat extern verankert in tests/gnss_denied_jamming_resilience_reference.rs (unabhängige numpy/scipy-Neuherleitung von J/S und effektivem C/N₀, festgelegt auf Kaplan & Hegarty §{ "9.4" }, plus das gemessene C/N₀ des JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); die Mondgeometrie, die sie zusammensetzt, ist die Geometrie von lunar_service/lunar mit eigenen Referenzen. Hier geprüfte Identitäten in geschlossener Form: Ein halbierter Störerabstand addiert genau { "20" }·log10({ "2" }) dB zu jeder Zeile; J/S ist exakt invariant gegenüber dem Boresight-Gewinn der Nutzerantenne, während sich C/N₀ um genau diesen Gewinn bewegt; eine Elevationsmaske ändert keine überlebende Zeile bitgenau. Die Zeile selbst bleibt ReferenceImpl/modelliert: Es gibt keine gemessene Mond-Jamming-Kampagne, gegen die validiert werden könnte, und die Konstellation ist eine illustrative Geometrie der Klasse Moonlight/LCNS aus öffentlichen Quellen, keine geflogene Ephemeride

# text
seg-4c116e25c5c5 = Mond-Verweigerungskontur mit einem Unsicherheitsband aus der gemessenen C/N₀-Streuung

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = Der Bericht <c1/> stützt seine Verweigerungskontur nicht mehr auf einen einzelnen Skalar. Er gibt die gesamte gemessene Verteilung des C/N₀ des Nutzsignals über die Tabelle je Satellit aus — n, min, p05, p25, Median, p75, p95, max, Mittelwert, Stichprobenstandardabweichung und die eigene Asymmetrie der Stichprobe (p95 − Median) − (Median − p05) — neben den Zeilen je Strecke, die unverändert sind. Die Kontur wird dann an jeder dieser Ordnungsstatistiken unter BEIDEN Verweigerungskriterien angegeben, die die Engine kennt, nie das eine anstelle des anderen: das bisherige Kriterium des Leistungsverhältnisses (J/S = { "30" } dB, dieselbe Schwelle, die attack_surface und tracking_loop verwenden, und das Kriterium hinter der Spalte <c2/> der veröffentlichten Tabelle zum Mond-Link-Jamming), und das Kriterium des Lock-Verlusts (das effektive C/N₀ fällt auf tracking_threshold_dbhz), mit dem die eigene Spalte links[].status dieses Berichts bewertet wird. Jeder Konturpunkt wird auf beiden Achsen der Verweigerungsebene angegeben — die erforderliche Störer-EIRP beim Abstand des Szenarios und der Verweigerungsabstand bei der EIRP des Szenarios — sodass das Band ein Intervall auf denselben Achsen ist, auf denen ein Konturdiagramm gezeichnet wird. Die Bandgrenzen SIND contour(p05) und contour(p95): dieselbe Abbildung in geschlossener Form, angewandt auf die eigenen Quantile der Stichprobe, nicht ein an die Stichprobe angepasstes Sigma und nicht Median ± k·Standardabweichung, und der Bericht sagt dies in einer Zeichenkette band_definition neben den Zahlen. Die Standardabweichung wird der Kontinuität halber ausgegeben und von nichts verwendet. Ein Quantil, dessen C/N₀ bereits auf oder unter der Tracking-Schwelle liegt, hat kein endliches verweigerndes J/S; diese Spalten werden als null mit gezähltem Grund ausgegeben statt als Unendlich oder als begrenzter Radius

# text
seg-2d3944107ba0 = Erkennungsstärke des modalitätsübergreifenden Integritätsmonitors

# text
seg-38bc7c0bfe57 = Der hybrid-optical-rf-Bericht gibt an, was der modalitätsübergreifende Chi-Quadrat-Monitor tatsächlich ERKENNEN kann, und nicht nur, dass er einen fehlerfreien Fall besteht: den minimal erkennbaren Bias je überwachter Achse (Ost, Nord, Oben, Uhr) bei den angegebenen Fehlalarm- und Nichterkennungswahrscheinlichkeiten des Szenarios, die Erkennungsstärkekurve beiderseits davon, das rauschfreie Bias-Vielfache, bei dem die realisierte Statistik die Schwelle erstmals überschreitet, und die Zeit bis zur Erkennung für eine Bias-Rampe mit angegebener Rate. Fehler werden außerdem durch den realen Monitor eingespeist, und die Statistik, die er zurückgibt, wird neben der analytischen Vorhersage angegeben

# text
seg-b6b8dec4dcff = Zwei interne Referenzen, kein externer Datensatz. ({ "1" }) Round-Trip in geschlossener Form: Der minimal erkennbare Bias entsteht durch Umkehrung des Randes des nichtzentralen Chi-Quadrats über die Nichtzentralität (raim::pbias) und wird geprüft, indem die resultierende Nichtzentralität bei der eigenen Schwelle des Monitors durch raim::noncentral_chi2_cdf zurückgegeben wird, was P_md liefern muss. ({ "2" }) Einspeisung gegenüber Analyse: Ein Bias wird in die HF-Schätzung einer Achse geschrieben und cross_raim::run_cross_raim erneut ausgeführt, sodass die Statistik, die mit der analytischen Nichtzentralität verglichen wird, die ist, die der Monitor berechnet hat, keine Neuherleitung. Eine gesäte Monte-Carlo-Simulation der Statistik selbst wird in den Tests als dritte Prüfung mitgeführt; sie ist bewusst NICHT im Bericht, weil eine abgetastete Schätzung langsamer und nicht bitgenau reproduzierbar wäre. ExternalDataset wird abgelehnt: Die Größe ist die Erkennungsstärke DIESES Monitors bei der Sigma-Zuteilung DIESES Szenarios, und die Sigma-Größenordnungen, mit denen der MDB skaliert wird, sind modellierte repräsentative Eingaben, keine Messungen. ReferenceImpl wurde ebenfalls erwogen und abgelehnt — die Monte-Carlo-Simulation tastet dieselbe Statistik ab, die die Analyse beschreibt, sie fängt also Transkriptions- und Koeffizientenfehler, ist aber keine unabhängige Implementierung des Monitors. { "0.30" } Runde { "2" } (vorab registriert 0135a9e4), blockiert (bleibt MODELLED): SciPy { "1.18.1" } chi2/ncx2/brentq reproduzieren die Schwelle des Berichts (innerhalb von { "5.4e-12" }), den MDB je Achse, die Leistungskurve, das Durchgangsvielfache und die Zeit bis zur Erkennung der Rampe (innerhalb von { "5.3e-10" }) bei fünf Konfigurationen; die Statistiken der eingespeisten Fehler haben keine unabhängige Referenz, und die Sigma-Größenordnungen sind modellierte Eingaben, daher wartet die Eingrenzung auf eine Entscheidung des Verantwortlichen

# text
seg-38cabd4921c1 = Erneutes Anwachsen der Kovarianz nach der Übergabe gegenüber der Alarmgrenze

# text
seg-9287268bbada = Der hybrid-optical-rf-Bericht legt das Prozessrauschmodell des Filters offen und gibt an, wie lange die Lösung nach der Übergabe innerhalb der Alarmgrenze bleibt: Für beide Übergaberichtungen trägt er die Kovarianz je Achse, die die Übergabe hinterlassen hat, propagiert sie unter einem angegebenen Random-Walk-Prozessrauschen vorwärts und gibt die Zeit an, zu der das abdeckungsskalierte 1σ die horizontalen, vertikalen und zeitlichen Alarmgrenzen erreicht, welche Grenze zuerst bindet, die Zeitkonstante der Varianzverdopplung und ein abgetastetes Auslaufprofil, das den Durchgang einklammert. Prozessrausch-PSDs, der Abdeckungsfaktor und die Alarmgrenzen sind alle Eingaben mit dokumentierten Standardwerten

# text
seg-c85b822227f3 = Keine externe Referenz. Der Durchgang ist eine Lösung in geschlossener Form des Varianzwachstums des Random Walk, und die Tests berechnen ihn unabhängig aus den Werten neu, die der Bericht selbst veröffentlicht, nicht aus dem Inneren des Emitters. Die Startkovarianz ist bitgenau auf die Spur festgelegt, die der vorhandene Übergabeblock bereits angab, sodass der Auslauf keine Kovarianz propagieren kann, die sonst niemand gesehen hat. Die Prozessrausch-PSDs sind MODELLED repräsentative Eingaben, und die Durchgangszeiten skalieren direkt mit ihnen, was der Skalierungstest als gemessene Eigenschaft und nicht als Behauptung festhält. ExternalDataset wird bewusst abgelehnt: Die Auslaufzeit ist eine direkte Funktion zweier modellierter PSDs und von Alarmgrenzen, die selbst repräsentativ sind, und es gibt keinen gemessenen optischen/HF-Übergabeauslauf am Mond, gegen den verglichen werden könnte. Eine externe Referenz bräuchte hier eine veröffentlichte Kurve des Kovarianzwachstums nach der Übergabe oder der Holdover-Genauigkeit für einen vergleichbaren Empfänger mit angegebenem Prozessrauschmodell, geprüft auf eine Toleranz

# text
seg-a3b8272862aa = Antennenmuster außerhalb der Boresight im Export der Mondgeometrie

# text
seg-27d246503a48 = Der Geometrieexport je Satellit trägt je (Epoche, Satellit) den Außerachsenwinkel AM SATELLITEN und den Sendegewinn zum Standort aus dem realen gleichmäßig ausgeleuchteten Kreisaperturmuster (Airy) und gibt die Zahl der Satelliten im Strahl unter diesem Muster NEBEN der Zahl im Strahl unter der symmetrischen Näherung von Gewinn zu Strahlbreite an (θ_3dB[deg] = √(31000/G_lin)), wobei die Differenz als ausdrückliche Korrektur in Strecken, in Satelliten je Epoche und als ungünstigste einzelne Epoche ausgegeben wird. Beide impliziten Apertureffizienzen der Näherung werden ausgegeben ({ "0.641" } gegenüber der Regel { "70" }·λ/D Grad, mit der sie zitiert wird, { "0.920" } gegenüber einer gleichmäßigen Kreisapertur), sodass die Effizienz, die sie stillschweigend annimmt, angegeben statt abgeleitet wird. Standardmäßig aus: Der Block erscheint nur, wenn ein Exportstandort und eine Apertur beide angegeben sind

# text
seg-f7f79e2dd6c5 = Gemischt, und getrennt statt zusammengeworfen. Das MUSTER darunter ist extern validiert und behält seine eigene Zeile (eine scipy.special.j1-Fixture auf < { "0.05" } dB in tests/validate_p1_orbital_footprint.rs, plus hier die veröffentlichte Airy-Halbwertsabszisse x = { "1.61634" }, per Bisektion gefunden statt angenommen). Die GEOMETRIE wird gegen die Dreieckstrigonometrie in geschlossener Form geprüft, die als anderer Ausdruck als das geprüfte Skalarprodukt geschrieben ist. Die EINSCHLIESSUNG des realen Strahls durch den Näherungskegel ist abgeleitete Algebra (28.019/√η gegenüber { "29.479" } Grad je λ/D), sodass die Korrektur für η ≤ { "0.9035" } nur nicht positiv sein kann. Aber die ZÄHLUNGEN im Strahl selbst haben keine externe Referenz: Keine veröffentlichte Tabelle gibt an, wie viele Satelliten einer Schale der Klasse Moonlight/LCNS einen Standort am Südpol innerhalb des Halbwertsstrahls einer gegebenen Schüssel halten, und die Konstellation ist eine illustrative Näherung aus öffentlichen Quellen, keine geflogene Ephemeride. Die gemessene Abweichung im dokumentierten Arbeitspunkt — { "0" } Strecken im Strahl unter dem realen Muster gegenüber { "28" } unter der Näherung, −{ "2.33" } Satelliten je Epoche, ungünstigste Epoche { "3" }, bei { "76" } ausgewerteten Strecken — ist daher ein MODELLED Befund über die Näherung, als Regressionsliteral festgelegt (die nächstgelegene Zeile liegt { "0.069" }° von jedem Strahlrand, vier Größenordnungen über jeder Abweichung in der letzten Stelle), keine extern validierte Abdeckungszahl. Die Zeile aufgrund des eigenen externen Ankers des Musters ExternalDataset zu nennen, wäre geliehene Validierung, der Zug, den die Invarianten der Matrix verhindern sollen. { "0.30" } Runde { "2" } (vorab registriert d9755d28), blockiert (bleibt MODELLED): SPICE-Geometrie und SciPy-Bessel-Funktionen reproduzieren den Außerachsenwinkel (ungünstigster Wert { "3.0e-5" } Grad), den Airy-Gewinn und die Strahl-Flags auf { "6 336" } Zeilen mit Zuständen geflogener Orbiter und dem dokumentierten Arbeitspunkt; aber auf geflogener Geometrie teilen sich die Flags nach Satellitenidentität auf (die nächste Strecke liegt { "1.66" } Grad vom Strahlrand), die Sichtbarkeit bei { "5" } Grad wird als Flag geprüft, nicht als numerische Elevation, das Flag der symmetrischen Näherung wendet die Faustregel 31000/G auf einen validierten Winkel an, ohne die Regel zu validieren, und die impliziten Effizienzen haben keine Referenz; die Eingrenzung wartet auf eine Entscheidung des Verantwortlichen

# text
seg-6fbfa234ef3e = Lock-Verlust der Nachführschleife und Spoofing-Pull-in unter Störung

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Lock-Verlust, berechnet aus der Schleifendynamik statt aus einem Leistungsverhältnis: thermischer 1σ-Jitter von Träger (Costas) und Code (nichtkohärent Early/Late) gegenüber C/N₀ mit dem Quadrierungsverlust, gegenüber den angegebenen Regeln 3σ_PLL + θ_e ≤ { "45" }° und 3σ_DLL + Rampenverzug ≤ d/2 Chips; C/N₀-Schwellen für Abfall und erneutes Einrasten mit der benannten bindenden Schleife und der aus der weiteren Pull-in-Bandbreite ABGELEITETEN Hysterese statt einer behaupteten; die erklärte Zeit bis zum Lock-Verlust aus einem Lock-Detektor mit zwei Schwellen und Bestätigungsverweilzeiten, getrennt von der physikalischen Phasenfluchtzeit angegeben (mittlere Zeit nach Viterbi zwischen Zyklusschlupfen, in log₁₀ s, weil sie hunderte Dekaden überspannt); die größte Code-Anstiegsrate und Träger-Dopplerrate, denen die Schleifen des Opfers folgen können; und den VERWEIGERUNGSRADIUS, den die Schleifendynamik impliziert, neben dem vorhandenen Radius des Leistungsverhältnisses angegeben, mit ihrer vorzeichenbehafteten Differenz als eigenem benannten Feld. Ausführbar als Szenarioart <c1/>

# text
seg-c3794c8d85c5 = Der eigene sdr-Korrelator der Engine (sdr::correlate / synth_if / CaCode), schrittweise auf gesätem synthetischem IF bei einem kalibrierten C/N₀ ausgeführt — ein getrennter Codepfad, der dieselben Zahlen durch numerische Korrelation von abgetastetem IQ erreicht statt durch einen algebraischen Jitterausdruck, also ein anderer Weg und keine Neuformulierung — plus tabellierte Standardwerte der modifizierten Bessel-Funktion I₀ für den Zyklusschlupf-Term. Schleifentheorie nach Kaplan & Hegarty Kap. { "8" } und Viterbi/Gardner für die Schlupfzeit. Die Zeile bleibt ReferenceImpl/MODELLED: Die Gegenprüfung liegt in derselben Codebasis, und die Prüfung von bessel_i0 validiert eine Spezialfunktion statt des Tracking-Modells, sodass ein Aufstieg der Zeile auf dieser Grundlage eine selbstgefällige Kennzeichnung wäre. ExternalDataset bräuchte einen aufgezeichneten Roh-IF-Datensatz mit Referenz-C/N₀ und einem annotierten Lock-Verlust-Zeitpunkt (Klasse TEXBAT/OAKBAT); keiner wird in diesem Baum geliefert, und selbst mit dem IQ veröffentlichen diese Datensätze keine Schleifenzustands-Wahrheit je Epoche, sodass eine erklärte Lock-Verlust-Zeit nur gegen den Lock-Detektor eines anderen Empfängers validiert werden könnte, was eine modellierte Wahl und keine Referenz ist. Die Schleifenbandbreiten, Integrationszeit, Korrelatorabstand, Pull-in-Verhältnis, Verweilzeiten, Störerleistung und Antennengewinne sind repräsentative Bandzahlen, kein Datenblatt. { "0.30" } Runde { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, als Programm ausgeführt) auf unabhängig erzeugtem IF (vorab registriert 6ef7698c, Änderungen an der Messmethode offengelegt), ein Befund (bleibt MODELLED): Der Jitter der geschlossenen PLL und DLL stimmt innerhalb von { "8" } % bei { "35" } bis { "45" } dB-Hz überein, die dynamische Belastung mit { "10" } Hz/s innerhalb von { "1" } % und der Rampenverzug des Codes erster Ordnung innerhalb von { "2" } %; bei { "30" } dB-Hz ist der PLL-Jitter { "21" } % höher und der DLL-Jitter { "32" } % niedriger, die gemessenen Schwellen der 15-Grad-Regel liegen { "1.5" } dB über der Engine, und die Schleife zweiter Ordnung schlupft { "0.5" } bis { "2" } Dekaden häufiger als die Schlupfzeit-Schranke erster Ordnung. Revision { "0.30" }: Die Costas-Schlupfzeit verwendet nun das Schleifen-SNR rho/4 (Halbzyklus-Schlupfe); der Standardwert jitter_table log10_mean_time_to_cycle_slip_s fällt bei der Schwelle von { "25.47" } dB-Hz von { "11.58" } auf { "2.10" }

# text
seg-69155fb79ebd = Kovarianz der Stationskoordinaten bei Mond-VLBI aus einem Tracking-Zeitplan

# text
# c1: lunar-vlbi-fim
seg-141285301f58 = Verzögerungs-Partielle, über einen Zeitplan aus Basislinien × Epochen zu einer Fisher-Informationsmatrix akkumuliert, invertiert zur Kovarianz der Stationskoordinaten und zum Stationssigma je Koordinate, statt einer angenommenen isotropen Gleichverteilungsverknüpfung aus einer skalaren Verzögerungspräzision. Der Zustand trägt erdfeste (ITRS) Stationskoordinaten, daher ist die Jacobi-Matrix die inertiale Partielle, gedreht mit der GCRS→ITRS-Matrix jeder Epoche, und die Erdrotation macht diese Koordinaten beobachtbar — der Bericht MISST den erdfesten Sichtliniendurchlauf und die Deklination der Bake, statt sie anzunehmen. Rang, Datumsdefekt, Konditionszahl, das Informationsspektrum und der Nullraum des freien Netzes werden bei jedem Lauf ausgegeben, und bei Rangdefizit wird das Kopf-Sigma als NULL mit einem Status veröffentlicht, statt aus einer fast singulären Inversen gelesen zu werden. Der Gleichverteilungswert c·σ_τ·√(g/N) für DENSELBEN Zeitplan wird neben dem berechneten mit ihrem Verhältnis gedruckt, zusammen mit der isotropen Spurschranke √(p/trace(M)), die AM-HM zu einer harten Untergrenze macht. Ausführbar als Szenarioart <c1/>

# text
seg-b259d4d18f42 = Ein unabhängiger Weg im Repository. Jede Jacobi-Zeile wird durch zentrale finite Differenz von lunar_vlbi::vlbi_delay_s neu hergeleitet, ausgewertet aus den eigenen erdfesten und mondkörperfesten Koordinaten des Zustands, durch die Bezugssystemkette vorwärts gedreht — ein Pfad, der keine Ableitung berechnet und keinen Ausdruck mit den analytischen Partiellen teilt — und die Informationsmatrizen, die die beiden Wege aufbauen, stimmen auf < { "1e-6" } der größten Diagonale überein. Der Kern der linearen Algebra, den dies zusammensetzt (information_matrix, crlb, sym_eig), ist separat extern gegen numpy.linalg.eigh / numpy.linalg.inv in tests/fim_observability_reference.rs verankert, und die Verzögerungsobservable trägt die eigene Delta-DOR-Fernfeld-Referenz von lunar_vlbi; die Zeile leiht sich keinen der beiden Status. Hier geprüfte Identitäten in geschlossener Form, als solche gekennzeichnet: σ²- und 1/N-Skalierung und √(p/trace(M)) als AM-HM-Untergrenze, die das berechnete Sigma nicht unterbieten kann und die nur bei isotroper Geometrie mit dem Gleichverteilungswert zusammenfällt — weshalb das gemessene Verhältnis genau die Anisotropie ist, die die Annahme verworfen hat. { "0.30" } externer Vergleich (Bibliothek: NAIF SPICE CSPICE N0067 über spiceypy { "8.2.0" }, MIT; DE440, ITRF93 earth_latest_high_prec, MOON_PA), vorab registriert ({ "50863551" }) zusammen mit einem Sensitivitätslauf des Modellfehlers auf Seiten der Engine: Jede Jacobi-Zeile wird durch zentrale Differenzen konvergierter newtonscher Lichtlaufzeit-Differenzen aus der SPICE-Geometrie neu aufgebaut (die Lichtlaufzeitgleichung ist ein kurzes Skript über SPICE-Positionen; SPICE trägt die Geometrie), mit dem Zeitplan neu aufgebaut aus SPICE-Elevationen. Zeitplan, Rang, Defekt, Informationsspektrum, Konditionszahl, Stationssigmas, Kopfwert, Spurschranke, Gleichverteilungsverhältnisse, Nullraum des freien Netzes, Sichtliniendurchlauf und Deklination der Bake stimmen innerhalb der vorab registrierten { "1" } % / { "0.1" } Grad überein, was über dem bekannten analytischen Mondfehler der Engine liegt ({ "3.2e-3" } bei Sigmas, vor dem Lauf gemessen). NumPy { "2.3.5" } wiederholt die lineare Algebra auf der eingecheckten Jacobi-Matrix der Engine auf { "2e-13" } (P2). Validiert als Cramér-Rao-Schranke für den angegebenen reduzierten Parametersatz auf den angegebenen illustrativen Eingaben: Die Mondzentrum-Ephemeride, Uhren, Troposphäre und Erdorientierungsparameter werden in beiden Teilen fest gehalten, daher ist es keine Genauigkeit einer realen Kampagne

# text
seg-0f4d023fe2d4 = Koordinatenkovarianz eines Mondoberflächenpunkts aus einem VLBI-Verzögerungszeitplan, getrennt von der der Erdstationen gehalten

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Eine dritte Datumswahl, <c1/>, die jede Erdstation festhält und allein die mondkörperfesten Koordinaten der BAKE schätzt — die Konfiguration, für die eine Unsicherheit eines Mondoberflächenpunkts tatsächlich angegeben wird, da die Koordinaten der Erdstationen eine Eingabe des Verzögerungsmodells sind und keine Unbekannte davon. Sie existiert, weil die Kovarianz auf Stationsebene und die Kovarianz des Oberflächenpunkts VERSCHIEDENE GRÖSSEN sind, getrennt durch den Hebelarm ρ/B, und zuvor nichts verhinderte, dass die eine gegen die andere zitiert wurde. Der ausgegebene Block <c2/> trägt ρ, die längste Basislinie, den Hebelarm, die Oberflächenpunktform der Gleichverteilungsverknüpfung c·σ_τ·(ρ/B)·√(g/N), das berechnete Bakensigma je Koordinate und ihr Verhältnis — das Verhältnis null statt irreführend, wann immer die Bake nicht geschätzt wird oder die Matrix rangdefizient ist. B wird als die LÄNGSTE vorhandene Basislinie genommen, die günstigste, sodass das Verhältnis nur unterschätzen kann. Ausführbar als <c3/> mit <c4/>, was mit einer Meldung abgelehnt wird, die die fehlende Eingabe nennt, wenn die Bake nicht geschätzt wird

# text
seg-18096ae23d96 = Identitäten in geschlossener Form, ohne dass eine externe Referenz beansprucht wird oder verfügbar ist. Der Hebelarm wird gegen ρ/B und die beiden Gleichverteilungsformen gegeneinander auf { "1e-15" } geprüft — algebraische Identitäten, die also einen Verdrahtungsfehler fangen und sonst nichts und als solche gekennzeichnet sind. Das inhaltliche Ergebnis wird MEASURED statt behauptet: Eine Verzögerung aus einer festen Basislinie schränkt die RICHTUNG der Bake ein, sodass die Sichtlinienkomponente die Informationsmatrix nur über den Nahfeld-Entfernungsterm erreicht, und der Test liest die resultierende Anisotropie aus dem ausgegebenen Spektrum ab, statt sie abzuleiten. AM-HM macht √(p/trace(M)) zu einer harten Untergrenze, sodass eine isotrope Gleichverteilungsverknüpfung immer nur UNTERSCHÄTZEN kann und das Verhältnis berechnet zu Gleichverteilung genau die Anisotropie ist, die sie verworfen hat. MEASURED am Paar Goldstone-artig/Canberra-artig, dessen Sehne { "10726.748" } km beträgt: Über { "112" } abgetastete Tage lassen { "36" } bei einer Maske von { "10" }° überhaupt keine gegenseitig sichtbare Epoche zu, das Höchste an gegenseitig Sichtbarem sind { "17" } eines Zeitplans mit 49 Stichproben, und an den { "73" } brauchbaren Tagen reicht das Dreikomponentenverhältnis von { "113.9" }× bis zu vier Größenordnungen mehr, Median { "1513" }×, während die Beschränkung auf die beiden transversalen Richtungen, die die Sichtlinie nicht aushungert, { "3.94" }× bis { "25.8" }× ergibt, Median { "7.8" }×. WAS DIESE ZEILE NICHT BEANSPRUCHT: irgendeine dieser Zahlen als Eigenschaft einer realen Kampagne. Sie stellt fest, dass die Größe des Oberflächenpunkts nun BERECHNET statt angenommen wird und dass sie nicht stillschweigend mit der auf Stationsebene vertauscht werden kann. Bleibt ReferenceImpl/MODELLED: Es existiert keine veröffentlichte Kovarianz eines Oberflächenpunkts bei Mond-VLBI, gegen die validiert werden könnte, die Stationen und der Bakenstandort sind illustrativ und nicht vermessen, und die Ephemeride, Uhren, Troposphäre und Erdorientierungsparameter werden FEST gehalten, daher ist dies eine Cramér-Rao-Schranke für einen reduzierten Parametersatz und für sich genommen optimistisch. Dieselbe Größe auf dem Kernelpfad (Bake auf dem DE440-Mond) wird in ihrer eigenen Zeile validiert, "…, kernel path"; auf diesem analytischen Pfad liegt das kleinste Bakensigma { "3.9" } % unter der SPICE-Referenz jener Zeile, weshalb diese Zeile MODELLED bleibt

# text
seg-8958521eedf7 = Koordinatenkovarianz eines Mondoberflächenpunkts aus einem VLBI-Verzögerungszeitplan, Kernelpfad

# text
# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = Die Bakenkovarianz mit allen festgehaltenen Stationen des Szenarios lunar-vlbi-fim (jede Erdstation festgehalten, allein die mondkörperfesten Koordinaten der Bake geschätzt) mit der Bake auf dem JPL-DE440-Mond, gelesen vom eigenen Kernel-Leser der Engine (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Nur das Mondzentrum unterscheidet sich vom analytischen Pfad; die Körperrotation nach IAU { "2015" }, Stationen, Erdrotation und lineare Algebra sind gleich. Die validierten Ausgaben sind die Beobachtungsmenge, das { "3" } x { "3" }-Informationsspektrum, Rang und Konditionszahl, die drei körperfesten Bakensigmas und ihr RMS, der Hebelarm und das Verhältnis berechnet zu Gleichverteilung, auf dem Standardzeitplan. Ausführbar als Szenario <c1/> mit datum = "all-stations-fixed", estimate_beacon = true und gesetztem planetary_kernel_path

# text
seg-63250578ec6b = Bindender Bibliotheksteil: NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) auf de440s, earth_latest_high_prec (ITRF93 mit UT1 und Polbewegung) und den Mondsystemen aus DE440, die Bake fest in MOON_ME; jede Jacobi-Zeile ist eine zentrale Differenz über { "3" } km der konvergierten newtonschen Lichtlaufzeit-Differenz (der eigene Lichtlaufzeitcode der Referenz M069, importiert), nie eine Partielle von Kshana; Sichtbarkeit neu aufgebaut aus WGS-84-Elevationen; NumPy { "2.3.5" } / SciPy { "1.18.1" } (BSD-3-Clause, LAPACK) eigh und inv. P2-Teil: NumPy auf der eingecheckten Jacobi-Matrix der Engine. Vorab registriert (4a51256), bevor die Fixture oder die Referenz existierte, mit Zielwerten von { "1" } % bei Eigenwerten, Kondition, Sigmas, RMS und Verhältnis, { "1e-4" } beim Hebelarm, exakter Beobachtungsmenge und Rang; P2 { "1e-9" }. Offengelegt: Der reine Engine-Vergleich von analytischem und Kernel-Mond ({ "3.9" } % beim y-Sigma) wurde vor der Vorregistrierung ausgeführt, um den Kernelpfad zu wählen, und ist dort angegeben. Ergebnis: Beide Teile stimmen überein, ungünstigster Wert { "1.7e-3" } (Baken-y-Sigma { "0.081211" } m gegenüber { "0.081351" } m). Mutation: Das Transponieren der Körperrotation der Bakenpartiellen lässt beide Teile scheitern. Beide Seiten lesen DE440, daher validiert die Übereinstimmung die Geometrie und lineare Algebra auf DE440, nicht DE440 selbst. Außerhalb der Aussage: die Genauigkeit des Oberflächenpunkts einer realen Kampagne (Uhren, Troposphäre und Erdorientierung fest gehalten; illustrative Stationen und Bakenstandort) und der analytische Standardpfad (Zeile oben, die MODELLED bleibt: Auf dem analytischen Mond liegt das y-Sigma { "3.9" } % unter dieser Referenz)

# text
seg-0315968c8214 = Differentielles PNT am Mond — Residuenbudget der Korrekturstrecke

# text
seg-c6785166a44c = Die drei Terme, die eine differentielle Korrektur zwischen der Epoche, zu der sie berechnet wird, und der Epoche, zu der sie verwendet wird, aufnimmt, jeweils zuvor als unmodellierte Reserve belassen: Vermessungsfehler der Referenzstation (über Satelliten korreliert, unabhängig von der Basislinie, ~{ "1" }:{ "1" } Positionsübertragung und nachweislich nicht von DOP verstärkt), Alterung der Korrektur (der eingefrorene Bahnfehlervektor, neu projiziert auf die Sichtlinie, auf die der eigene Propagator der Engine den Satelliten eine Latenz später setzt, plus c·σ_y(τ)·τ Uhrendrift aus dem kalibrierten Potenzgesetz) und gleichmäßige Streckenquantisierung über einen exakten Vollausschlag ±(orbit_err + clock_err) mit der Varianz step²/12. Angegeben sowohl im Entfernungs- als auch im Positionsbereich, neben — nie anstelle von — dem vorhandenen Residuum und Schutzniveau, mit einer Latenzkurve neben der Einzelzahl

# text
seg-29b8e6c12471 = Identitäten in geschlossener Form und Selbstkonsistenz: die Varianz step²/12 des gleichmäßigen Quantisierers, die exakte Kovarianzfortpflanzung (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹, die bei gleichem σ zu σ·PDOP zusammenfällt, die { "1" }:{ "1" }-Übertragung des Vermessungsterms als Folge von û_user ≈ û_ref und das Abschalten des quadratischen Schlusses. Die PDOP-Gegenprüfung gegen orbit::dop teilt die Normalmatrix [−û, { "1" }], daher ist sie eine Konsistenzprüfung und wird als solche gekennzeichnet statt als unabhängige Referenz. Es ist kein ExternalDataset verfügbar oder beansprucht: Keine Mondoberflächenstation hat eine veröffentlichte vermessene Genauigkeit, keine Korrekturstrecke für differentielle Korrekturen am Mond hat eine veröffentlichte Latenz oder ein Nachrichtenformat, und das Ergebnis der Quantisierung ist eine geschlossene Form und keine Messung. RTKLIB — bereits die Referenz mit externem Code für den Einzeldifferenz- und gewichteten Kleinste-Quadrate-Kern — könnte mit einer absichtlich falsch vermessenen Basis gefahren werden, um die { "1" }:{ "1" }-Vermessungsübertragung zu bestätigen, aber das wäre unabhängiger Code über dieselbe Algebra der Sichtlinie erster Ordnung. DIE GRÖSSENORDNUNGEN SIND MODELLED: Der Vermessungsstandard ist die eigene Zuteilung der Mondbezugssystem-Realisierung dieses Crates statt einer gemessenen Station, die Latenz und die Bitzahl sind ILLUSTRATIVE Eingaben, und das Anwachsen des Fehler-VEKTORS der Broadcast-Ephemeride selbst ist überhaupt nicht modelliert — angegeben in der ausgegebenen Zeichenkette des Alterungsgesetzes, weil es der Term ist, der in einer realen Strecke am ehesten dominiert

# text
seg-c42646ae4707 = Abdeckungs- und Genauigkeitskarte der Mond-Referenzstation

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Monte-Carlo-Durchlauf des Modells für differentielles PNT am Mond über ein Nutzergitter am Südpol und einen Tag von Epochen (die Art <c1/>): für eine differentielle Referenzstation an einem bekannten Standort am Südpol je Punkt und über die Region das Perzentil des korrigierten und des unkorrigierten Positionsfehlers (3-D, horizontal, vertikal), Verfügbarkeit mit einem Grund für jede nicht verfügbare Epoche (user_lt4, station_missing_sat), Abdeckung gegenüber einer vor dem Lauf angegebenen Schwelle, Schutzniveaus nach DO-229E, den Abdeckungsradius je Azimutsektor und das Budget der Korrekturstrecke an der Station und am ungünstigsten Punkt. Keine Aussage über die Leistung eines realen Systems; nicht mit einer Behörde verbunden oder von ihr unterstützt

# text
seg-2308d94fa25e = Arithmetik, neu berechnet durch ein unabhängiges numpy-Skript auf exportierten Fällen (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; vorab registriert in tests/fixtures/lunar_station/PREREGISTRATION.md, allein eingecheckt in 9caedf97 vor dem ersten Lauf): bei { "20" } Fällen mit jedem eingeschalteten Fehlerterm sind die sichtbaren Mengen und der Status identisch, die rohen Entfernungsfehler stimmen auf { "1.4e-14" } m überein, die Positionsfehlervektoren und -beträge auf { "1.4e-9" } m gegenüber einem Zielwert von { "1e-6" } m, und das p95 jedes Punkts ist bitgenau gleich numpy.percentile; die Stationskorrekturen VERFEHLTEN ihren Zielwert von { "1e-9" } m (ungünstigster Wert { "3.73e-9" } m, { "15" } von { "20" } Fällen), und mit ihnen die korrigierten Entfernungsfehler: in 60-stelliger Arithmetik geprüft, liegen beide Seiten innerhalb der Rundung doppelter Genauigkeit des exakten Werts, wobei der Vermessungsterm die Differenz zweier Entfernungen von { "1e7" } m ist, deren Einheit der letzten Stelle { "1.86e-9" } m beträgt; vermerkt, nicht abgestimmt. Die Art reduziert sich bei einem Punkt, einer Epoche und einem Versuch exakt auf die Art lunar-differential-pnt. Das Fehlermodell, das Dekorrelationsmodell und jede Schwelle sind das Eigene dieses Projekts oder ILLUSTRATIVE; nichts hier ist eine Aussage über ein reales System

# text
seg-7ecf4b0038b0 = Mond-Geländehorizontmasken aus einem angegebenen Profil oder einem polaren DEM

# text
seg-7102948907bc = Azimutabhängige Horizontmasken je Standort für die Art lunar-station-coverage (die Referenzstation und jeden Nutzerpunkt) und das Gitter moonlight-service-volume und seinen Exportstandort je Satellit (jede Exportzeile erhält clears_terrain), im Tabellenformat der Skyline { "0.36" } (skyline::Skyline, linear im Azimut mit Umbruch bei { "360" } Grad; ein angegebenes Profil und ein DEM-Horizont an einem Standort verbinden sich als ihr punktweises Maximum): ein angegebener [terrain] station_horizon oder user_horizon mit seiner Quelle gekennzeichnet und/oder ein Horizont, per Strahlverfolgung über ein DEM in südpolarer stereographischer Projektion berechnet (das gerasterte polare Layout LRO LOLA, gelesen aus einem Deskriptor, der seine Größe und sein SHA-256 festlegt, oder eine Kachel realdata::lola_dem in Breite/Länge mit [terrain] dem_tile_path, mit ihrem SHA-256 zurückgegeben) entlang von Großkreisen der Mondkugel mit exakter Krümmung, von einer angegebenen Masthöhe, bei einem angegebenen Azimutschritt und einer angegebenen Reichweite. Ein Satellit zählt an einem Standort, wenn er die flache mask_deg und den Horizont bei seinem Azimut überschreitet (lunar_service::topocentric); eine Epoche, die der Horizont mit weniger als vier Satelliten an einem Punkt lässt, wo die flache Maske vier ergibt, wird als der Nichtverfügbarkeitsgrund terrain_masked gezählt. Das mitgelieferte DEM ist ein Ausschnitt des gemeinfreien Produkts LOLA LDEM_75S_240M, { "5" } x { "5" } blockmittelwert-umgetastet auf { "1200" } m (data/lunar-dem/NOTICE.md). Fehlt es, behält jeder Standort die flache Maske, und jedes Dokument ist byte-identisch

# text
seg-dd838d199a0d = Flächen in geschlossener Form (InternalConsistency): die Absenkung der bloßen Kugel, ein Krater in einem Plateau auf der Kugel mit einem Beobachter auf und neben seinem Zentrum und ein analytischer Kegel gegenüber seiner eigenen Rasterung. Auf dem realen Ausschnitt stimmt ein unabhängiger numpy-Strahlwurf (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; vorab registriert in tests/fixtures/lunar_terrain/PREREGISTRATION.md, allein eingecheckt in edbb9b02 vor der Existenz des Skripts) an fünf Standorten überein: Standorthöhen auf { "1.0e-11" } m und alle { "1800" } Horizontelevationen auf { "5.5e-10" } Grad gegenüber Zielwerten von { "1e-6" }, abgeschnittene Strahlen exakt gezählt; dies prüft die Arithmetik, nicht das Gelände. Es wurde keine veröffentlichte Zahl zu polarem Horizont oder Beleuchtung reproduziert: Der mitgelieferte Ausschnitt mit { "1200" } m glättet das Relief unterhalb von einem Kilometer, das veröffentlichte Beleuchtungsstudien auflösen, daher sind die DEM-Horizonte eine MODELLED Sichtlinie über einem neu abgetasteten realen DEM, kein validierter Horizont. Der Stationsstandort und die Konstellation bleiben ILLUSTRATIVE; nichts hier ist eine Aussage über ein reales System

# text
seg-d37bb01e270b = Mehrwege- und Empfängerhardware-Terme der Mondreferenzstation

# text
seg-1103199f019b = Der optionale Abschnitt [receiver] von lunar-station-coverage (LRS-02): elevationsabhängiges Mehrwege-Sigma sigma(el) = a + b exp(-el / el0) beim Nutzer und an der Station (die funktionale Form der RTCA DO-229 für Luftfahrzeuge, mit a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } deg als Standardwerten; auf dem Mond ist jeder Wert ILLUSTRATIVE), weiß beim Nutzer und ein Gauß-Markov-Prozess erster Ordnung über die Epochen an der Station (rho = exp(-dt / tau)); thermisches Code-Rauschen des Early-minus-Late-DLL sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); kanalweise Inter-Kanal-Biase, konstant über einen Versuch, beim Nutzer und an der Station. Die Stationsterme gehen in deren Korrekturen ein, die Nutzerterme in die Roh- und die korrigierten Messungen, jeweils auf einem eigenen Zufallsstrom mit festem Startwert. Fehlt der Abschnitt, bleibt jedes Dokument unverändert

# text
seg-4fbc7d86b491 = Geschlossene Formen und Statistiken der eigenen Ziehungen des Modells (InternalConsistency): die DLL-Formel gegen eine Handrechnung, die DO-229-Form, die Nullbasislinien-Differenz zweier Empfänger, die Lag-1-Korrelation des Gauß-Markov-Prozesses. Es gibt keine Mehrwege- oder Empfängermessung auf dem Mond, mit der sich vergleichen ließe; die Werte sind ILLUSTRATIVE, und nichts hier ist eine Aussage über einen realen Empfänger

# text
seg-03796cb741b6 = Wachstum des Ephemeridenfehlers der Mondreferenzstation über die Korrekturlatenz

# text
seg-13b0ae9a874a = Die optionale Eingabe orbit_err_growth_m_per_s von lunar-station-coverage (LRS-03): Eine Korrektur, die latency_s nach ihrer Berechnung angewendet wird, verfehlt das Wachstum g latency_s des ausgesendeten Bahnfehlers, wobei g eine isotrope 3-D-RMS-Rate ist, die je Satellit und Versuch auf einem eigenen Zufallsstrom mit festem Startwert gezogen wird (Bereich 1-sigma-Rate tau / sqrt({ "3" })), zusätzlich zur Neuprojektion des eingefrorenen Fehlers auf die Sichtlinie. Fehlt sie, bleibt jedes Dokument unverändert. Ein K5-Nachtrag zum Vergleich mit den veröffentlichten Aussagen, allein vorregistriert, führt K5 bei { "0.001" }, { "0.01" } und { "0.1" } m/s aus (ILLUSTRATIVE)

# text
seg-332ceb320b65 = Das geschlossene Sigma des Wachstumsterms und die Prüfung der Fortpflanzung erster Ordnung (InternalConsistency). Der K5-Nachtrag (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, allein vorregistriert in 59d88248): K5 scheitert bei jeder Rate, korrigiertes p95 3-D { "369.8" } m, { "2315" } m und { "22797" } m gegen einen Zielwert von { "1.5" } m ({ "292.96" } m ohne Wachstum aufgezeichnet), wie vor dem Lauf festgehalten. Keine öffentliche Quelle nennt eine Wachstumsrate auf dem Mond: ILLUSTRATIVE

# text
seg-90307f07e0ef = Lösungsmodi der Mondreferenzstation: Höhenbeschränkung, drei Satelliten, Fenster für statische Nutzer

# text
seg-366c7ad03fb2 = Der optionale Abschnitt [solution] von lunar-station-coverage (LRS-06): eine Höhen-Pseudomessungszeile up . dx = e_h mit angegebenem 1-sigma, gewichtet gegen die Entfernungszeilen, ein Minimum von drei Satelliten, das nur mit ihr zulässig ist, und eine gewichtete Kleinste-Quadrate-Lösung über die letzten window_epochs Epochen mit einer gemeinsamen statischen Position und einer Uhr je Epoche (die Antwort eines Filters für eine statische Position ohne Prozessrauschen über dieselben Daten; die Fehler der Epochen werden als unabhängig behandelt). Fehlt er, bleiben die Momentaufnahme-Lösung und jedes Dokument unverändert. Ein Nachtrag zum Vergleich mit den veröffentlichten Aussagen mit dem Lösungsstil der Quellen, allein vorregistriert

# text
seg-bfe05379b7aa = Die Momentaufnahme-Reduktion und die geschlossenen Fälle des Lösers (InternalConsistency). Der Nachtrag (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, allein vorregistriert in 001ca100) mit einer Höhenbeschränkung von { "1" } m, drei Satelliten und einem Fenster von 6 Epochen (ILLUSTRATIVE Einstellungen; die Quellen nennen einen Filter, eine Höhenbeschränkung und drei Satelliten, aber nicht deren Einstellungen): K1 bis K5 scheitern und K6 besteht, { "1" } von { "6" } wie im aufgezeichneten Lauf; der korrigierte p95-3-D-Fehler bei R300 sinkt von { "280.6" } m auf { "2.11" } m (horizontal { "0.90" } m, nicht bewertet), und die Abdeckung bleibt { "0" }. Die Unabhängigkeitsannahme des Fensters begünstigt es. Keine Aussage über ein reales System

# text
seg-611ba369ed00 = Genauigkeit und Abdeckung der Mondreferenzstation gegen veröffentlichte Aussagen

# text
seg-4fe4f1cffa2b = Die Art lunar-station-coverage, ausgeführt unter den öffentlichen Annahmen des veröffentlichten Materials zu einer differentiellen Mondreferenzstation (vier Navigationssatelliten auf { "24" }-h-Bahnen, eingefrorene elliptische Bahnen, { "10" } m { "95" } % SISE, { "0.30" } m Code-Rauschen, { "1" } s und { "600" } s Korrekturlatenz, eine Stationsvermessung im Subdezimeterbereich, der veröffentlichte Beispielstandort der Station, die südpolaren Kreise von { "300" } km und { "600" } km) und bewertet gegen die numerischen Aussagen der Quellen unter sechs einseitigen Zielwerten, die vor dem Lauf vorregistriert wurden: Abdeckung des gesamten Südpols bei p95 unter einem Meter (K1, K2), korrigiertes p95 unter einem Meter und im Dezimeterbereich (K3, K4), unter einem Meter gehalten bei { "600" } s Latenz (K5) und Genauigkeit gehalten von { "10" } km bis { "500" } km Basislinie (K6)

# text
seg-eb6d3be85fec = Referenz: die numerischen Aussagen von fünf öffentlichen Quellen, registriert mit URL, Abrufdatum, SHA-256 und Lizenz in tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; Folien des IOAG Cislunar PNT Workshop { "2025" } und { "2026" }; UNOOSA ICG WG-B Lunar PNT, Juni { "2024" }), mit Seitenverweisen abgeschrieben in tests/fixtures/lunar_station_published/CLAIMS.md. Zielwerte, Fälle und Eingaben wurden in tests/fixtures/lunar_station_published/PREREGISTRATION.md vorregistriert (Revision { "2" }, 05bf9a19, vor dem Lauf allein committet). { "0.36" } erster Lauf, ein Befund (bleibt MODELLED): { "1" } von { "6" } Zielwerten wird bestanden. Die Abdeckung beträgt { "0.00" } auf beiden Kreisen gegen >= { "0.95" }, und der korrigierte p95-3-D-Fehler beträgt { "280.6" } m ({ "300" } km) und { "293.0" } m bei { "600" } s Latenz, gegen <= { "1.5" } m. Der Dezimeter-Zielwert (K4) konnte bei dem Code-Rauschen von { "0.30" } m der Quellen nicht bestanden werden, was einen Widerspruch zwischen den Quellen widerspiegelt und kein Modellergebnis ist. K6 besteht (Verhältnis { "1.39" } gegen <= { "1.5" }), aber als Verhältnis zweier von der Geometrie dominierter Größen ist es in keiner Richtung ein Beleg über die Dekorrelation. Ursache: Die Bahnelemente der Satelliten sind nicht öffentlich, und auf den ILLUSTRATIVE Elementen im Repository teilen ein Nutzer und die Station nur in { "8.2" } % ({ "300" } km) und { "6.3" } % ({ "600" } km) der Epochen vier Satelliten über { "5" } deg, bei nahezu singulärer Geometrie (unkorrigiertes p95 { "3.8" } km gegen < { "10" } m der Quellen). Die Simulationen der Quellen verwendeten einen Filter, eine Höhenbeschränkung und drei Satelliten in gemeinsamer Sicht, was die Art mit Momentaufnahme nicht modelliert. Der Vergleich bestätigt deshalb das veröffentlichte 'unter einem Meter über den gesamten Südpol' nicht und widerlegt es auch nicht. Er zeigt, dass das Ergebnis dieses Modells von Bahnen abhängt, die nicht veröffentlicht sind. Keine Aussage über ein reales System; nicht mit einer Behörde verbunden und von keiner unterstützt

# text
seg-478225d0a8e1 = Kern des lunaren ARAIM-Schutzniveaus

# text
seg-863690a44f21 = Der Schritt von der Geometrie zur Kovarianz beim lunaren Schutzniveau — (GᵀG)⁻¹ über die Geometrie mit allen sichtbaren Satelliten und jede Einzelfehler-Teilgeometrie, projiziert auf die lokale Vertikale und die Spur des horizontalen Blocks — und sein statistischer Kern: der Bonferroni-Detektormultiplikator, der gaußsche obere Rand jeder Fehlerhypothese und die Wurzelsuche, die ein Integritätsrisikobudget auf ein Schutzniveau abbildet, über ein lunares Dienstvolumen aus 7 Punkten

# text
seg-0ec1699f5754 = ARAIM-MHSS-Schutzniveaus gegen veröffentlichte Referenzvektoren

# text
# c1: araim-reference-check
seg-fbaaf3ad7648 = Die Schutzniveau-Gleichung der Mehrfachhypothesen-Lösungstrennung selbst: gewichtete Kleinste-Quadrate-Lösung mit allen sichtbaren Satelliten und je Fehlermodus auf einer Ost/Nord/Auf-Geometrie mit einem Uhrzustand je Konstellation, die Sigmas der Teillösungen, die Sigmas der Lösungstrennung und die einseitigen Projektionen des nominellen Bias, die Bonferroni-K_fa-Schwellen, die Risikozuteilung für nicht überwachte Fehler und die VPL/HPL, die die Integritätsrisiko-Gleichung lösen. Ausführbar als die Szenarioart <c1/>

# text
seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } Juni { "2019" }), durchgerechnetes numerisches Beispiel in Anhang D — veröffentlichte EINGABEN (Geometriematrix mit 10 Satelliten und 2 Konstellationen, Diagonalen C_int/C_acc, b_nom, P_sat, P_const, LPV-200-Konstanten) und veröffentlichte AUSGABEN (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } und sechs Zwischenwerte zu Konstellationsfehlern), abgerufen 2026-09-20, Quell-SHA-256 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Abgeglichen mit der EIGENEN angegebenen Toleranz der Referenz TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT und σ_v_acc bis zu ihrer gedruckten Genauigkeit. Der Milestone-{ "3" }-Bericht ({ "2016" }) derselben Untergruppe, Annex A §A.IX, nennt dasselbe Beispiel, ist aber in sich widersprüchlich — ein Vorzeichenfehler in Zeile { "3" } von G (+{ "0.7477" }, wo das Dokument von { "2019" } −{ "0.7477" } druckt; mit dem Pluszeichen ergibt das eigene σ_v_acc des Dokuments { "0.8690" } m gegen seine veröffentlichten { "1.47" } m), und ein K_fa_3, ausgewertet bei { "57" } Fehlermodi, während das Dokument N_fault_max = { "1" } angibt, also { "12" }, sodass sein EMT der 57-Modi-Schwelle folgt und sein VPL/HPL nicht. Keine Implementierung, die ihm folgt, kann alle seine Ausgaben zugleich reproduzieren. Seine Geometrie-Zwischenwerte werden exakt reproduziert, und seine Schutzniveaus sind als gemessene Abweichungen festgehalten (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), vom Annahmewert ausgeschlossen; die Toleranz wurde nicht erweitert, um sie aufzunehmen. GELTUNGSBEREICH: nur N_fault_max = { "1" } — Teilmengen mit mehreren Ereignissen werden abgelehnt statt abgeschnitten, und Ausschluss, der Chi-Quadrat-Konsistenztest und der Schritt der Neuzuteilung bei Doppelzählung bleiben MODELLED

# text
seg-7bfcb5c6a985 = ARAIM mit gleichzeitigen Fehlerhypothesen für mehrere Satelliten

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: die Regel zur Bestimmung der Teilmengen nach ADD v4.2 (P_THRES, FC_THRES, überwachte Teilmengen mit den wenigsten Entfernten zuerst), von Paaren auf gleichzeitige Kombinationen von bis zu max_order Satelliten- und Konstellationsereignissen verallgemeinert, mit dem exakten Prior P_no fault prod q_e; add_v42_protection_levels_to_order führt darauf den Schutzniveau-Pfad nach ADD v4.2 aus (Ordnung { "2" } ist exakt der bestehende Pfad). raim::araim_subset_raim (optional zuschaltbar): fortgeschrittenes RAIM über diese Hypothesenmenge, jede überwachte Teilmenge ein Modus (p_fault, T, b, sigma) in der Summe des Integritätsrisikos, nicht beobachtbare Teilmengen in das nicht überwachte Risiko verschoben, das Budget mit der ADD-Zuteilung des nicht überwachten Risikos skaliert, und die Teilmenge mit der größten normierten Trennung gemeldet, wenn ein Fehler erkannt wird. Priors, die tiefere Teilmengen als max_order benötigen, werden abgelehnt, nie abgeschnitten

# text
seg-6c6076ea1eee = Interne Konsistenz (InternalConsistency): die Reduktion der Ordnung 2 auf den mit MAAST geprüften Pfad ADD v4.2, unabhängige Neuherleitung der Priors und ein konstruierter Fehler an zwei Satelliten. Über Paare hinaus wurde kein MAAST- oder RTKLIB-Lauf durchgeführt, daher sind die tieferen Hypothesenmengen und die Schutzniveaus des Teilmengen-RAIM nicht extern geprüft. araim_subset_raim teilt die Vereinfachungen von araim_dual_raim (ein Sigma für Integrität und Genauigkeit, eine Uhr, der einfache Normalrand): Es ist nicht ADD-konform

# text
seg-48ca01332f8f = RAIM neben den Gütemaßen des Uhren-Holdovers

# text
seg-890f1006a75d = Der optionale Abschnitt [integrity] der Art clock (clock_integrity::run): aus einem angegebenen Standort und Konstellationsvorgaben (geometry::sky_geometry), in jeder Integritätsepoche, solange die GNSS-Zeitleiste nicht verwehrt ist, Momentaufnahme-RAIM (raim::snapshot_raim: Paritäts-Chi-Quadrat-Test, Schutzniveaus nach Steigung) auf den Satelliten über der Maske mit gaußschen Residuen mit festem Startwert und dem angegebenen Sigma sowie einem optional angegebenen Bias; ein getrennter Block integrity_fom mit Urteilen je Epoche, Schutzniveaus und Verfügbarkeit. Verwehrte Epochen werden als nicht verfügbar gemeldet, nie extrapoliert; die Holdover-Gütemaße bleiben unverändert, und ohne den Abschnitt ist die Ausgabe byteidentisch

# text
seg-c2860bf4b562 = Interne Konsistenz (InternalConsistency): Die Schutzniveaus sind die von snapshot_raim, das in einer eigenen Zeile gegen RTKLIB validiert ist, auf derselben Geometrie neu berechnet; Verhalten ohne und mit eingespeistem Fehler. Der Himmel ist eine repräsentative Vorgabegeometrie (kein datierter Almanach), die Residuen sind synthetisch, und Sigma, die Alarmgrenzen und die Wahrscheinlichkeiten sind angegebene Eingaben; nichts hier ist eine Aussage über die Verfügbarkeit eines realen Empfängers

# text
seg-9cbb4ee7588a = Räumliche, verrauschte Beobachtbarkeit der Bogenlänge über mehrere Familien cislunarer Bahnen

# text
seg-5ebd771deef8 = Die Schwelle der Beobachtbarkeit der cislunaren Bogenlänge im RÄUMLICHEN CR3BP mit sechs Zuständen statt im ebenen mit vier Zuständen, über die Familien DRO, L2-Halo und L2-Near-Rectilinear-Halo, wobei das Messrauschen in die Gramsche Matrix eingeht, und ZWEI Kriterien berichtet werden, weil es kein einzelnes ehrliches gibt: das veröffentlichte Rangkriterium, das nachweislich unabhängig von einem homoskedastischen Messsigma ist (die Gewichtung multipliziert die Beobachtbarkeitsmatrix mit einem Skalar und lässt das relative Singulärwertspektrum und damit Rang, Defekt und Kondition unverändert), und ein Schätzbarkeitskriterium — der erste Bogen, bei dem die formale 1σ-Positionsunsicherheit des Anfangszustands des Chiefs unter eine angegebene Grenze fällt —, das sich als einziges mit dem Rauschen verschiebt. Jede Schwelle trägt die Klammer des Epochenrasters, in der sie liegt; ein nicht erreichtes Kriterium ist null mit einer Begründung. Der ebene Modus bleibt die Voreinstellung, und Familien außerhalb der Ebene werden dort abgelehnt, statt in einen Zustand zusammengedrückt zu werden, der sie nicht darstellen kann

# text
seg-046231819882 = Ein unabhängiger Zeilenstufenrang durch Gauß-Elimination mit partieller Pivotierung bestätigt jedes Rangurteil mit sechs Zuständen — ein anderer Algorithmus, der keinen Code mit dem geprüften Eigenwert-/SVD-Weg teilt. Die { "6" }×{ "6" }-Zustandsübergangsmatrix des CR3BP, die hier zusammengesetzt wird, trägt ihre eigene ReferenceImpl-Referenz gegen die variationelle Integration mit SciPy, und die Anfangsbedingungen für Halo/NRHO stammen aus einem Korrektor, der die veröffentlichte südliche L2-Gateway-Bahn { "9" }:{ "2" } reproduziert. Der bestehende Zweig mit dem Square-Root-Information-Filter wird ausdrücklich NICHT als Bestätigung gezählt: Er verwendet dieselben Jacobi-Matrizen und reduziert sich auf dieselbe Normalmatrix, ist also eine Konsistenzprüfung zwischen zwei numerischen Maschinen, und das ausgegebene Erweiterungslabel sagt das. NICHT extern verankert, und ExternalDataset wird deshalb abgelehnt statt aus der Zeile der Zustandsübergangsmatrix übernommen: Die Schwellen-Bogenlängen selbst hängen vom MODELLED Konstellationsentwurf, vom Epochenraster und — messbar, um bis zu { "40" }× — von der Singulärwerttoleranz ab. Die veröffentlichten ebenen { "2.09" } h werden bei rel_tol = { "1e-6" } exakt reproduziert und sind selbst toleranzabhängig ({ "10.25" } h bei { "1e-4" }, { "0.42" } h bei { "1e-8" }), was eine Eigenschaft des Kriteriums und nicht der Bahn ist. Kein öffentlicher Datensatz veröffentlicht eine Schwelle der Beobachtbarkeit der Bogenlänge für eine gewählte cislunare Konstellation. MEASURED ERGEBNIS: Die räumliche Schwelle mit sechs Zuständen beträgt { "22.17" } h für die L2-NRHO und { "40.42" } h für den L2-Halo und EXISTIERT NICHT für die ebene DRO-Familie, an der die veröffentlichte Aussage abgeleitet wurde — Rang { "4" } von { "6" } mit Datumsdefekt { "2" } und zwei exakt verschwindenden Eigenwerten, ein struktureller Defekt, den keine Bogenlänge behebt

# text
seg-e250321394bc = Fehler einer Erdorientierungsvorhersage im Betriebsstil, gemessen als vorhergesagt gegen endgültig

# text
seg-0e443d241460 = Eine Kleinste-Quadrate-Anpassung von Bias plus Rate über ein nachlaufendes Fenster plus die wichtigsten periodischen Terme — jährlich, halbjährlich und die beiden wichtigsten zonalen Gezeiten für UT1; Chandler, jährlich und halbjährlich für den Pol —, extrapoliert mit dem letzten Residuum im Fenster, das fortgeschrieben wird: die Klasse, die das IERS Bulletin A verwendet, anstelle des Persistenz-Prädiktors, auf dem der veröffentlichte Horizont beruhte. Bewertet auf die einzige ehrliche Weise: eine Vorhersage für T+h, gebildet aus schnellen Bulletin-A-Zeilen bei oder vor T, gemessen gegen das SPÄTER veröffentlichte endgültige Bulletin B bei T+h, mit der Persistenz daneben, bewertet über dieselbe Epochenmenge gegen dieselben endgültigen Werte. Eine Zielepoche ohne veröffentlichten endgültigen Wert wird verworfen, statt gegen die schnelle Spalte neu bewertet zu werden; ein periodischer Term, den das Fenster nicht festlegen kann, wird als abgelehnt gemeldet, mit den Zyklen, die es tatsächlich überspannt; ein unvollständiges Fenster wird abgelehnt, statt stillschweigend verkürzt zu werden

# text
seg-822a1ce99154 = Drei unabhängige Wege, keiner davon eine veröffentlichte Angabe zur Vorhersagegenauigkeit. ({ "1" }) Ein analytisches Signal mit bekannten Koeffizienten — der einzige Weg, die periodische Maschinerie auszuführen, da keine eingecheckte Reihe lang genug ist, um einen jährlichen Term zuzulassen. ({ "2" }) Die Lehrbuch-Lösung der kleinsten Quadrate in geschlossener Form, eine andere Algebra als die geprüfte Matrixlösung, auf echten Zeilen. ({ "3" }) Die echten archivierten Bulletin-A-Vorhersagezeilen, die das echte Produkt von { "2026" } veröffentlicht, je Vorlaufzeit als ÜBEREINSTIMMUNGS-Statistik verglichen und ausdrücklich nicht als Fehler: { "0.256" } ms bei { "1" } Tag, { "0.695" } ms bei { "2" } Tagen, { "1.252" } ms bei { "3" } Tagen, bis auf { "3.885" } ms bei { "9" } Tagen abdriftend. Das ist also die KLASSE des Bulletin A, nahe bei kurzer Vorlaufzeit, nicht das Bulletin A. Die Residuen vorhergesagt gegen endgültig sind echte gemessene Größen über echte IERS-Zeilen, aber ihre Größenordnung wird nur gegen die RICHTUNG des Vergleichs geprüft, nie gegen eine vom IERS veröffentlichte Genauigkeitszahl — ein echtes Produkt zu lesen ist Herkunft, keine Referenz. MEASURED: Am Tag { "1" } ergibt der operative Prädiktor { "3.78" } m Fehler im Mondsystem gegen { "11.39" } m bei der Persistenz ({ "3.01" }×), am Tag { "2" } { "10.23" } m gegen { "21.72" } m ({ "2.12" }×), am Tag { "3" } { "20.33" } m gegen { "30.57" } m ({ "1.50" }×) — und er ist jenseits von drei Tagen SCHLECHTER ({ "0.87" }× bei { "5" } Tagen, { "0.43" }× bei { "10" }), was der Bericht ausgibt, statt nur die Horizonte zu zeigen, die ihm schmeicheln. NICHT reproduziert: der autoregressive Residualfilter und die tabellierte Reduktion der zonalen Gezeiten, das operative 365-Tage-Fenster ist mit den eingecheckten Daten unerreichbar, und es existiert KEIN archivierter früherer Stand der Reihe in diesem Repository — daher meldet die Tabelle der archivierten Stände keine Zeilen, statt eine synthetisierte zu bewerten. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): bewertet gegen dieselben endgültigen Werte über { "178" } archivierte Bulletin-A-Ausgaben mit dem 15-Tage-Standardfenster des Crates beträgt der UT1-MAE des Prädiktors das 2.4- bis 12.6-fache des Bulletin A bei { "1" } bis { "10" } Tagen (Zielwert 1.5x) und { "5.32" } ms bei { "10" } Tagen, außerhalb des Bereichs von { "0.36" } bis { "3.13" } ms des 2nd EOP PCC; der Pol beträgt das 1.5- bis 1.85-fache des Bulletin A (nur bei { "6" } und { "7" } Tagen innerhalb von 1.5x); { "19" } von { "21" } vorregistrierten Bedingungen scheitern. Korrektur zu Weg ({ "3" }): Die Zeilen des Produkts von { "2026" }, mit denen verglichen wurde, tragen das IERS-Flag I (gemessen), nicht P, daher sind diese Übereinstimmungswerte gegen gemessene schnelle Werte und nicht gegen Bulletin-A-Vorhersagen. { "0.30" } Runde { "2" }, ein Prädiktor aus Kleinsten Quadraten plus Autoregression mit analytisch entfernten zonalen Gezeiten, gegen { "178" } archivierte Bulletin-A-Ausgaben beim Zielwert der Runde 1 (vorregistriert c93605b4), ein Befund (bleibt MODELLED): { "12" } von { "21" } Bedingungen gelten; der UT1-MAE beträgt das { "1.73" }- bis 2.11-fache des Bulletin A bei { "2" } bis { "10" } Tagen (Zielwert 1.5x), während der Pol bei jeder Vorlaufzeit innerhalb von 1.27x liegt. { "0.30" } Revision: Mit der nun nach IERS-Flag klassifizierten Offline-Eingabe sind die Übereinstimmungswerte von Weg ({ "3" }) gegen echte Bulletin-A-Vorhersagen (0.256/0.695/1.252/3.885 ms bei 1/2/3/9 Tagen gegen schnelle Zeilen -> 0.133/0.421/0.839/2.786 ms)

# text
seg-f4efd94dd746 = Mond-Bezugsdatum aus einer Beobachtungskampagne

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = Das Helmert-Datum mit sieben Parametern, fortgepflanzt aus einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE, statt aus einer eingespeisten Transformation zurückgewonnen. Erdstationen beobachten einen belegten Katalog von Baken auf der Mondoberfläche nach einem ausdrücklichen Zeitplan; die Mond-VLBI-Verzögerungspartialen werden in einer Fisher-Informationsmatrix der Bakenkoordinaten akkumuliert und durch den Helmert-Entwurf A = [I₃ | [p]ₓ | p] in H = AᵀM_bA geschoben, sodass die berichtete Datumsgenauigkeit eine Funktion des Beobachtungsprogramms ist — exakt linear im Verzögerungs-Sigma und monoton im Bogen über die Libration, die der Bericht MISST. Der Datumsdefekt ist der Gegenstand und keine Fußnote: Rang, Defekt, Konditionszahl, Spektrum, nicht beobachtbare Richtungen in der Sieben-Parameter-Basis, die schwächste Richtung selbst bei vollem Rang und der Anteil jedes Parameters daran werden bei jedem Lauf ausgegeben, und jeder Parameter, den die Kampagne nicht festlegt, wird als NULL mit einem Status veröffentlicht. Die Korrelation der Bakenfehler wird MEASURED, nicht angenommen — exakt null bei festgehaltenen Stationen und mit ihren Kosten ausgegeben, wenn diese geschätzt werden. Ausführbar als die Szenarioart <c1/>

# text
seg-8eedf0240350 = Identitäten in geschlossener Form und ein unabhängiger Weg im Repository, ohne Anspruch auf eine externe Referenz. Der Helmert-Entwurf — die einzige neue Ableitung im Modul — wird durch zentrale finite Differenz von lunar_frame_realise::apply_helmert neu hergeleitet, einen Pfad, der keinen Ausdruck mit der analytischen Form teilt. Die Akkumulation, die er zusammensetzt, ist die von lunar-vlbi-fim, deren Jacobi-Matrix dort gegen lunar_vlbi::vlbi_delay_s finit differenziert wird und deren Kern der linearen Algebra separat in tests/fim_observability_reference.rs extern gegen numpy verankert ist — diese Zeile übernimmt keinen der beiden Status. Die physikalische Referenz ist strukturell statt numerisch: Eine Bakenverzögerungspartiale ist die Nahfeld-DIFFERENZ zweier nahezu paralleler Einheitsvektoren, sodass die am schlechtesten bestimmte Translationsrichtung die körperfeste Richtung zur Erde sein MUSS, und der Test prüft die berechnete Antwort gegen die separat gemessene Richtung. MEASURED: Das aus der Kampagne abgeleitete Translations-Sigma von { "6.3975" } m gegen den Wiedergewinnungsfehler von { "0.3125" } m des Szenarios mit eingespeister Transformation ({ "20.5" }× enger), während Rotation und Maßstab in die ANDERE Richtung laufen, mit { "2.32" }× und { "13.5" }× weiter — der Pfad mit eingespeister Transformation nimmt ein isotropes Sigma an und verteilt seinen Fehler daher gleichmäßig auf sieben Parameter, was die Verzögerungsobservable nicht tut. Rang 7/7, aber Kondition { "3.8e5" }, mit einer Richtung, die zu { "99.57" } % reine Translation zur Erde hin und vierzigmal schlechter als jede andere ist. WAS DIESE ZEILE NICHT BEANSPRUCHT: dass die Zahl der Kampagne in absoluten Werten stimmt. Sie belegt, dass die Zahl nun aus einem Zeitplan, einer Geometrie und einem Fehlermodell ABGELEITET wird und nicht aus einer eingepflanzten Antwort. Bleibt ReferenceImpl/MODELLED: Es existiert kein veröffentlichtes Paar aus Mond-VLBI-Kampagne und Datumskovarianz, das Stationsnetz und das Verzögerungs-Sigma sind ILLUSTRATIVE Eingaben (der Bakenkatalog ist belegt, die Kampagne nicht), Beobachtungen werden als unabhängig behandelt, während Troposphäre und Uhr einer echten Sitzung zwischen benachbarten Scans korreliert sind, und Ephemeride, Uhren, Troposphäre und Erdorientierungsparameter werden FEST gehalten. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): Mit jeder Bakenzeile der Jacobi-Matrix, die aus Lichtlaufzeiten von NAIF SPICE (DE440, ITRF93, MOON_ME; vorregistriert { "50863551" }) neu aufgebaut wurde, stimmen der Zeitplan, der Helmert-Rang, die Datums-Sigmas (innerhalb von { "4.7e-3" }), die Kondition, die schwächste Richtung ({ "0.07" } deg), der Librationsdurchlauf und die Ordnung der Bögen in sechs Szenarien innerhalb der vorregistrierten { "1" } % / { "0.2" } / { "0.05" } deg überein. NumPy auf der eingecheckten Jacobi-Matrix der Engine stimmt auf { "3e-14" } überein, wo die Stationen fest sind. Bei geschätzten Stationen weicht es um { "6.8e-6" } ab gegen vorregistrierte { "1e-9" }, deren Prämisse zur Konditionszahl falsch war (Helmert-Kondition { "2.1e8" }; unabhängige NumPy-Wege weichen um { "3e-6" } voneinander ab; ein Beitrag des Pseudoinversen-Rückfalls { "1e-9" } der Engine ist nicht ausgeschlossen), sodass die Zeile auf Grundlage dieser Vorregistrierung nicht aufgewertet wird. { "0.36" } Neuregistrierung bei einem konditionsskalierten Zielwert (vorregistriert b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) aus der Konditionierung der gemeinsamen Information und ihrer Helmert-Reduktion), ein Befund (bleibt MODELLED, NOT MET): Schritt { "0" } schließt den Rückfall auf die Pseudoinverse für die Lücke von { "6.8e-6" } AUS (keine Matrix vor der Helmert-Matrix weicht in den sechs ursprünglichen Szenarien auf den Rückfall aus, knappster Abstand ein Faktor { "2.6" }), der SPICE-Zweig hält weiterhin in allen sechs, und NumPy stimmt in sechs von acht Szenarien innerhalb des Zielwerts überein (default, die beiden Bögen, das 3x-Verzögerungs-Sigma, der kollineare Defekt und der frische Lauf mit festen Stationen am 2026-12-01; schlimmstenfalls { "0.13" } seines Zielwerts). Es scheitert bei stations_estimated (Datums-Sigmas bis { "6.8e-6" }, Kondition { "9.1e-6" }, Norm bei verworfener Unabhängigkeit { "3.5e-6" }, gegen t = { "5.9e-7" }), und am frischen Datum hat die Bake am Südpol keine Beobachtung, sodass die Bakeninformation rangdefizient ist (Rückfall auf die Pseudoinverse vor der Helmert-Matrix in beiden frischen Szenarien) und die unveränderte NumPy-Referenz stations_estimated_fresh nicht auswerten kann (singuläre Matrix). Ergebnisse: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-ca481f2d8f9e = Bestätigung der Schwelle der cislunaren Bogenlänge durch einen unabhängigen Schätzer

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Ein Batch-Kleinste-Quadrate-Schätzer, der den Anfangszustand des Chiefs aus simulierten Messungen zwischen Satelliten über wachsende Präfixe desselben Epochenrasters, das die Tabelle Rang gegen Bogen verwendet, ZURÜCKGEWINNT, wobei die Messpartialen als zentrale finite Differenzen des zusammengesetzten Vorwärtsmodells genommen werden. Er verwendet nichts von der Maschinerie, mit der die Schwelle gemessen wurde — keine analytische Jacobi-Zeile, keine variationelle Zustandsübergangsmatrix, keine Singulärwert- oder Eigenwertzerlegung, keine Rangtoleranz, keinen Square-Root-Information-Filter — und teilt nur die Dynamik, die Anfangsbedingungen, die skalare Observable und das Epochenraster, jeweils im ausgegebenen Dokument benannt. Zwei Kriterien, beide durchlaufen: rauschfreie Wiedergewinnung (das Gegenstück zum Rang) und Monte-Carlo-Schätzbarkeit (das Gegenstück zur Schätzbarkeit, gemessen gegen eine bekannte Wahrheit statt aus einer Kovarianz vorhergesagt). Ausführbar als die Szenarioart <c1/>

# text
seg-60e30948cee7 = Ein separater Schätzer in dieser Codebasis mit einem anderen Algorithmus und einem disjunkten Codepfad: nichtlineares gewichtetes Gauß-Newton mit finit differenzierten Partialen, sein Urteil als gemessener Zustandswiederherstellungsfehler in km und mm/s gelesen. Er hat keinen Ausdruck mit dem Weg über Rang und Kovarianz der Gramschen Matrix gemeinsam, und die Trennung wird durch eine Quelltextwache DURCHGESETZT und nicht behauptet. MEASURED auf dem veröffentlichten ebenen DRO-Raster: Das SCHÄTZBARKEITSKRITERIUM ist CORROBORATED — die gemessene Monte-Carlo-Grenze beträgt { "5.739130" } h gegen die formalen { "5.739130" } h (Verhältnis { "1.0000" }), und der gemessene RMS reproduziert das formale 1σ über { "21" } Bogenlängen mit einem geometrischen Mittel des Verhältnisses von { "0.9804" }. Das RANGKRITERIUM ist als Grenze der Wiedergewinnbarkeit NICHT bestätigt: Der Schätzer gewinnt ab { "0.782609" } h zurück gegen die { "2.086957" } h der Gramschen Matrix, Verhältnis { "0.375" }, und bei { "1.826087" } h — dem letzten Präfix, das die Rangbestimmung mit { "3" } von { "4" } bewertet — gewinnt er auf { "1.96e-5" } der a-priori-Verschiebung zurück. Die Wiedergewinnungsgrenze bleibt über drei Dekaden ihrer eigenen Schranke unbewegt, während die Rangschwelle über vier Dekaden von rel_tol von 'nie' bis { "0.782609" } h reicht, und die beiden fallen bei rel_tol = { "1e-8" } exakt zusammen. Diese Spanne wurde zunächst mit einem Reichweitenwert von { "0.260870" } h festgehalten; diese Zahl war ein ARTEFAKT, erzeugt durch eine Rangbestimmung, die { "4" } Richtungen aus { "2" } Messzeilen unterhalb des f64-Rauschbodens zählte, und sie wird hier korrigiert, statt stehen gelassen zu werden. Die Rangbestimmung ist nun durch die Ungleichung von Sylvester begrenzt, wobei der Grund ausgegeben wird, und die korrigierte Spanne sättigt genau bei dem Bogen, bei dem der unabhängige Schätzer zurückgewinnt, was die Kreuzvalidierung dieser Zeile stärkt statt sie zu schwächen: Die veröffentlichten { "1e-6" } sind eine konservative KONVENTION für Singulärwerte, keine Aussage über die Wiedergewinnbarkeit. Dasselbe Muster räumlich: NRHO { "9.290323" } h gegen { "21.677419" } h, Halo { "22.978723" } h gegen { "39.829787" } h, wobei die Schätzbarkeit in beiden exakt übereinstimmt. Die ebene DRO mit sechs Zuständen gewinnt bei keinem Bogen zurück und reproduziert so unabhängig den strukturellen Datumsdefekt dieser Familie aus einem Schätzer, dem nichts davon gesagt wurde. NICHT extern verankert — die Dynamik und die Anfangsbedingungen werden mit der geprüften Analyse geteilt, und kein öffentlicher Datensatz veröffentlicht eine solche Schwelle — daher wird ExternalDataset abgelehnt

# text
seg-f839285852d9 = Mond-Dienstvolumen aus realer, abgerufener Konstellationsgeometrie

# text
# c1: ephemeris_path
seg-c3059fcced49 = Akzeptiert eine tabellierte mondzentrische Zustandsephemeride (die Auswertung eines SPK/BSP-Kernels) oder eine veröffentlichte Konstellationsdefinition hinter <c1/>, führt denselben Durchlauf über Abdeckung / DOP / Schutzniveau darauf aus und gibt die daraus folgende σ_URE-Entfernungsanforderung NEBEN den unveränderten illustrativen keplerschen und gestörten Ergebnissen aus, wobei die Differenz als eigene benannte Größe erscheint. Jede Zahl trägt eine Herkunftsklasse, die aus dem Kernel abgeleitet, aus veröffentlichten Elementen abgeleitet und modelliert unterscheidet, sodass beides in einem nachgelagerten Zitat nie verwechselt werden kann

# text
seg-cbe9bd6bf989 = Die GEOMETRIE ist extern und mit Hash versehen: drei Fixtures, deren Zahlen nur aus Dokumenten stammen, die mit URL, Abrufdatum und SHA-256 abgerufen wurden, regenerierbar durch eingecheckte Generatoren, die den Hash der Quelle prüfen und ABBRECHEN, statt eine Zahl auszugeben — die Referenzkonstellation der LANS-Interoperabilitätsdemonstration (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), die LNCSS-Fallstudien (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) und eine echte Ephemeride geflogener Raumfahrzeuge für LRO, Danuri, Chandrayaan-2 und CAPSTONE, ausgewertet aus den eigenen rekonstruierten Kernels des JPL über Horizons. Es existiert öffentlich KEIN Kernel einer Mondnavigationskonstellation — Moonlight/LCNS, LCRNS und LNSS fliegen nicht, und NAIF veröffentlicht nichts für sie — und keiner wurde erfunden. Die ABGELEITETE σ_URE-Anforderung hat KEINE externe Referenz (niemand veröffentlicht die Entfernungsgenauigkeit, die ein lunares HPL von { "50" } m über diesem Dienstvolumen verlangt), daher wird sie gegen ihre eigene algebraische Identität geprüft und unabhängig davon, indem der gesamte Durchlauf bei der berechneten Anforderung wiederholt und bestätigt wird, dass die Verfügbarkeit dort umschlägt. MEASURED: Der veröffentlichte Entwurf mit 8 Satelliten benötigt σ_URE { "2.9044" } m bei { "100" } % Abdeckung gegen { "0.3591" } m bei { "37.85" } % der illustrativen Konstellation — eine Revision einer veröffentlichten Zahl um das { "8.09" }-fache nach Programmregel R4. Die qualitative Schlussfolgerung bleibt bestehen (LNIS-Klasse { "30" } m schließt ein südpolares HPL von { "50" } m immer noch nicht), aber die Lücke wurde achtfach überschätzt. Die LANS-Demo mit 5 Satelliten liefert NULL Schutzniveau-Stichproben — fünf Satelliten können nicht die sechs sichtbaren liefern, die eine Einzelfehler-Hypothesenmenge braucht — und das Anforderungsfeld ist ABWESEND statt erfunden; ebenso bei den vier realen Raumfahrzeugen bei { "0" } % Abdeckung. InternalConsistency ist die ehrliche Art: Die EINGABEDATEN sind extern und mit Hash versehen, aber die Größe, um die es in dieser Zeile geht, wird nur gegen sich selbst validiert. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): gegen die LNCSS-Fallstudienstatistiken von navi.613 auf { "346" } Rasterpunkten liegen { "4" } von { "12" } Verfügbarkeitsstatistiken außerhalb der vorregistrierten { "2" } Prozentpunkte (Fall A: -4.0, +{ "22.5" } und -3.6 pp; Fall B: -12.1 pp). Wahrscheinliche Ursachen: im falschen Bezugssystem gelesene Elemente, ein Zweikörper-Kepler über { "15" } Tage gegen das nicht angegebene Kraftmodell der Veröffentlichung und ein Raster, das sich aus dem Text nicht reproduzieren lässt. Die PDOP-Hälfte war nicht auswertbar (LANS druckt keine numerische Statistik); der Vergleichstest ist eingecheckt und ignoriert. { "0.30" } Runde { "2" }, ein Befund (bleibt MODELLED): gegen eine Referenz aus Orekit { "12.2" } / Hipparchus { "3.1" }, die den gesamten Bericht berechnet (Orekit-Propagation, DOPComputer für Sichtbarkeit und DOP, mit Hipparchus zusammengesetzte MHSS-Schutzniveaus, die Anforderung je Stichprobe gelöst; vorregistriert d3ce97b2) auf allen fünf abgerufenen Geometrien und zwei Rastern stimmen { "155" } von { "160" } Werten innerhalb der vorregistrierten Zielwerte ({ "2" } pp, { "5" } %, { "1" } %) überein, einschließlich der sigma_URE-Anforderung für LNCSS A und C ({ "3.879072208" } m auf beiden Seiten für Fall A) und der abwesenden Anforderung für LANS und die Orbiter. LNCSS B auf dem dichten Raster scheitert an seinen Statistiken der schlechtesten Stichprobe (sigma_required { "0.000923" } gegen { "0.001511" } m, hpl_max { "1.63e6" } gegen { "0.99e6" } m), wo nahezu singuläre Geometrien (PDOP etwa { "1e6" }) die Übereinstimmung der Position im Meterbereich verstärken; seine p95-Anforderung stimmt überein ({ "1.6343" } gegen { "1.6357" } m). Die Anforderung der schlechtesten Stichprobe ist auf entarteter Geometrie schlecht gestellt. Gegen navi.613: { "4" } von { "12" } liegen weiterhin außerhalb von { "2" } pp (festgeschrieben)

# text
seg-36a6cfaf5afa = Einheit und Herkunft für jede berichtete Größe angegeben

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Ein maschinenlesbares Schema, das für jedes numerische Feld jedes Szenarioberichts Einheit, Herkunftsklasse und Definition angibt, plus ein einziges globales Tor, das jede registrierte Szenarioart ausführt und scheitert, wenn einem ausgegebenen numerischen Feld eines von beiden fehlt. Das Herkunftsvokabular ist geschlossen, und jede Klasse trägt eine Evidenzstufe, wobei zwei Klassen bewusst auf <c1/> und <c2/> abgebildet werden, statt ihnen eine Stufe zuzuweisen, die die Klasse nicht bestimmt

# text
# c1: m
# c2: _m
# c3: sweep-nd
# c4: mixed - see note
# c5: key_units
# c6: metric_units
# c7: unit
# c8: cislunar-observability
# c9: units
seg-a8c4a6fd4989 = Das ausgegebene Dokument selbst: Jedes numerische Blatt muss sich zu einem Eintrag im eigenen units-Block dieses Dokuments auflösen lassen. Es gibt kein externes Einheitenregister, gegen das sich eine ANGEGEBENE Einheit prüfen ließe, daher ist eine angegebene Einheit eine geprüfte Behauptung und keine verifizierte — das Tor verifiziert VOLLSTÄNDIGKEIT und WOHLGEFORMTHEIT, nicht Wahrheit, und eine Validierung wäre falsch, weil nichts Externes bestätigt, dass <c1/> die richtige Einheit für ein Feld namens <c2/> ist. Eine unabhängige Gegenprüfung der Namenssuffixe wurde über die { "1,434" } zu DIESEM ZEITPUNKT beschriebenen Felder ausgeführt: Von den { "691" } mit einem Suffix, das eine Einheit trägt, weichen { "40" } von der angegebenen Einheit ab und alle { "40" } sind erklärt (Suffixe pro Sekunde, Minima, Apertur-Sekunden, Newtonmeter gegen ein nanometerartig aussehendes Suffix), sodass keine falsche Einheit zutage trat. Diese Gegenprüfung wurde seither nicht erneut ausgeführt, und die Abdeckung ist darüber hinaus gewachsen — die Zahl bleibt bei dem, was tatsächlich gemessen wurde, statt auf die aktuelle Gesamtzahl umgeschrieben zu werden. Zum Zeitpunkt dieser Änderung ({ "0.27.0" }) stieg die Abdeckung von { "7" } von { "56" } Arten auf { "60" } von { "61" } und von { "389" } von { "1354" } Feldern auf { "1,742" } von { "1,744" } (docs/field-units-schema.json, das von einer Veraltungsprüfung aktuell gehalten wird). KEINE Art bleibt unabgedeckt (Obergrenze { "0" }, FUT-28, { "0.36" }): Die letzte war <c3/>, deren zwei Spalten vom Aufrufer vergeben werden, sodass ihre Einheiten Daten sind; sie werden jetzt als <c4/> beschrieben, und die Einheit jeder Position wird aus der eigenen Einheitentabelle des DURCHLAUFENEN Pakets in <c5/> und <c6/> gelesen (oder aus der angegebenen <c7/> der Achse genommen, die mit der des Pakets übereinstimmen muss, wenn beide existieren; null, wenn keine von beiden existiert, angegeben statt geraten). <c8/> war die davor und fiel von der Liste, als ihr veröffentlichtes Dokument einen units-Block bekam: Der Additivitäts-Pin, der <c9/> als verbotenen Schlüssel benannt hatte, BEWEIST jetzt stattdessen, dass die Ergänzung additiv ist — wird der Block wieder entfernt, ergibt das Dokument weiterhin die beiden Konstanten, die eingefroren wurden, bevor er existierte, sodass ein veröffentlichter Wert, der sich unter der Ergänzung bewegt hat, weiterhin scheitert. Die Arbeit brachte außerdem zwölf Einheiten- oder Dokumentationsdefekte im bestehenden Code zutage, die gemeldet und nach R1 nicht behoben wurden

# text
seg-cf779c468eed = Mond-Bezugsdatum aus einer REALEN Beobachtungskampagne

# text
# c1: lunar-llr-datum
seg-96151f13a92b = Die Kovarianz des Helmert-Datums mit sieben Parametern, bei der die beiden simulierten Eingaben durch gemessene ersetzt sind: Der Zeitplan sind die Sendezeitpunkte am Boden von { "337" } archivierten Normalpunkten der ILRS-Mondlaserentfernungsmessung (2015-04-08 bis 2015-06-27, Grasse MeO { "7845" } und Matera MLRO { "7941" }, alle fünf Retroreflektor-Anordnungen), und jedes Beobachtungsgewicht ist die eigene archivierte Präzision bin_rms/√n_raw dieses Punktes — Median { "5.13" } mm der einfachen Entfernung, aus der Datei gelesen. Stationskoordinaten IERS ITRF2020, Reflektorkoordinaten JPL DE430 Tabelle { "7" }. Ausführbar als die Szenarioart <c1/>. Die validierte Aussage ({ "0.36" }) ist eng gefasst: Auf dem analytischen Standardpfad stimmt die Berechnung der Datumskovarianz mit einer unabhängigen Referenz aus SPICE-Lichtlaufzeit und NumPy auf frischen gemessenen Normalpunkten überein; sie ist keine LLR-Genauigkeit und kein Beleg dafür, dass der analytische Mond genau ist

# text
seg-50c60fc25ded = Identitäten in geschlossener Form, ein unabhängiger Weg im Repository und seit { "0.36" } eine unabhängige Bibliotheksreferenz aus SPICE und NumPy auf frischen gemessenen Daten (unten); es existiert kein veröffentlichtes Paar aus Mond-LLR und Datumskovarianz zum Abgleich, daher wird keine Genauigkeit beansprucht. Die einzige neue Ableitung — die Entfernungspartiale nach der körperfesten Position des Reflektors — wird durch zentrale finite Differenz der Zweiweg-Lichtlaufzeit neu hergeleitet, die sie differenziert, ein Pfad, der keinen Ausdruck mit der analytischen Form teilt. Die physikalische Referenz ist strukturell: Die Partiale einer Entfernung IST das Doppelte der Sichtlinie, sodass die körperfeste Koordinate entlang der mittleren Richtung zur Erde weit besser bestimmt sein muss als die beiden Koordinaten in der Himmelsebene, die nur die Libration erreicht — gemessen mit { "50.7" }× bis { "71.7" }× über die fünf Anordnungen gegen einen Librationsdurchlauf, den der Bericht unabhängig misst, wobei die isotrope Kleinwinkel-Vorhersage und die transversale Anisotropie, die die Lücke erklärt, beide ausgegeben werden. WAS SICH GEÄNDERT HAT: Der Zeitplan, die Anzahl der Beobachtungen und jedes Beobachtungsgewicht sind nun gemessen; { "337" } von { "349" } archivierten Punkten werden verwendet, und die { "12" }, die es nicht werden, werden übersprungen und gezählt, weil ITRF2020 keine Position für Apache Point enthält. MEASURED: Translations-Sigma des Datums { "1.851746e-2" } m gegen { "6.3975" } m der SIMULIERTEN Kampagne ({ "345" }×), Rotation { "36" }×, Maßstab { "24" }× — ein Verhältnis zwischen einem Laserentfernungsnetz und einem VLBI-Verzögerungsnetz, also ein Befund und keine Validierung. Reflektorinformation Rang 15/15 mit einer Kopplung zwischen den Anordnungen von exakt { "0" }; Helmert-Rang 7/7, Kondition { "2.4e4" }. WAS DIESE ZEILE NICHT BEANSPRUCHT: dass die Zahl in absoluten Werten stimmt. Eine echte LLR-Lösung schätzt die Mondbahn, die physikalischen Librationen, die Erdorientierung, die Stationskoordinaten sowie Gezeiten- und relativistische Parameter mit und berichtet Dezimeter (die eigenen 0.12-0.27 m der Tabelle { "7" } von DE430), wo diese Schranke weit kleiner ist; dies ist eine Cramér-Rao-Schranke für eine angegebene reduzierte Parametermenge, keine Genauigkeit. Außerhalb der validierten Aussage (modelliert, nicht validiert): Die Mondzentrums-Ephemeride und die Körperorientierung der IAU { "2015" } sind modelliert, und Troposphäre, Gezeiten, Stationsexzentrizität, Polbewegung, UT1-UTC, relativistische Verzögerung und Stationsuhren fehlen. Ihre gemeinsame Größe ist VERÖFFENTLICHT statt begründet — beobachtet-minus-berechnet einfache Entfernung { "156,494" } m RMS über die { "337" } Punkte — und ihre Wirkung auf die Kovarianz ist BEGRENZT statt begründet: Die Neulösung des gesamten Datums mit jeder um { "0.1" }° gekippten Partiale (das Doppelte der gemessenen Ephemeridenkippung der schlechtesten Epoche, Vorzeichen alternierend) verschiebt das Ergebnis um { "0.288" } %. EXTERNE PRÜFUNG ({ "0.30" } Runde { "2" }, vorregistriert 6b27964a), ein Befund (bleibt MODELLED): SPICE-Zweiweg-Lichtlaufzeit (DE440, ITRF93, DE440-Mondorientierung) mit finit differenzierten Partialen und eine numpy-Inverse, auf denselben { "337" } gemessenen Normalpunkten und Gewichten, stimmen bei Buchführung, beiden Rängen, Nullkopplung, dem Residuen-RMS ({ "2.1e-5" }) und { "15" } von { "16" } Kovarianzzahlen überein. Das z-Translations-Sigma liegt { "1.03" } % zu hoch gegen den vorregistrierten Zielwert von { "1" } %. Mit dem Mondzentrum aus DE440 fällt es auf { "0.049" } % (c51f8b2, gesehene Daten), und auf frischen Normalpunkten von { "2019" } hält das Datum mit Kernel-Mond jeden Zielwert (Zeile "…, kernel Moon centre"), wo auch der analytische Mond innerhalb der Zielwerte bleibt (schlechtester Wert { "3.8e-3" }, nur zur Information), sodass dieser Vergleich die Mondmodelle nicht trennt. LAUF DES ANALYTISCHEN PFADS AUF FRISCHEN DATEN ({ "0.36" }, vorregistriert 31f5283, bevor ein Punkt abgerufen wurde): die unveränderte SPICE- und NumPy-Referenz auf { "151" } verwendeten EDC-CRD-v2-Normalpunkten von 2025-04..06 (ein Jahr, das kein Test verwendet hatte; Dateien erneut abgerufen und Referenz unabhängig neu ausgeführt, siehe NOTICE des Fixtures) bei denselben Zielwerten: Buchführung, Ränge, Zahlen je Anordnung und Nullkopplung gleich; Sigmas und Normen schlechtester Wert { "1.11e-3" } (Zielwert { "1" } %), Kondition { "8.95e-4" } ({ "2" } %), Verhältnisse quer/längs schlechtester Wert { "1.79e-3" } ({ "2" } %); SPICE-O-C { "10.79" } m. VALIDATED auf dieser Evidenz als Bibliotheksprüfung der Kovarianzberechnung allein; der analytische Residuen-RMS auf diesem Ausschnitt beträgt { "222" } km, sodass die Zielwerte Mondmodelle nicht unterscheiden (wie bei der Kernel-Zeile). Ergebnisse: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md

# text
seg-c815cb90dcde = Geodäsie der Mondreferenzstation: hinzugefügter Retroreflektor und VLBI-Bake gegen das Datum aus fünf Anordnungen

# text
seg-103cf21173ac = Optionale Eingaben extra_reflectors und extra_beacons im Szenario lunar-llr-datum fügen einen Block station_geodesy hinzu: die Helmert-Information der fünf Anordnungen aus dem archivierten Ausschnitt der Mondlaserentfernungsmessung plus die Information, die ein hinzugefügter Retroreflektor (mit Entfernungsmessung zu den archivierten Normalpunkt-Epochen, in denen die messende Station über ihrem Horizont steht, jeweils mit dem archivierten Gewicht dieses Normalpunkts) und eine hinzugefügte VLBI-Bake (beobachtet vom Netz und Zeitplan der lunar-frame-campaign bei festgehaltenen Erdstationen, über die Verzögerungspartialen von lunar-vlbi-fim) an angegebenen Orten auf das Datum mit sieben Parametern legen, neu gelöst, mit dem 1-sigma jedes Helmert-Parameters davor und danach, ihrem Verhältnis, den Normen davor und danach und den extremen Eigenwerten der Fisher-Differenz. Fehlen sie oder sind sie leer, bleibt der Bericht unverändert

# text
seg-479a7e6bbedb = Nur interne Konsistenz: Jeder hinzugefügte Ort ist ein eigener Punkt, und eine Laserentfernung oder eine VLBI-Verzögerung bei festgehaltener Station berührt einen Punkt, sodass seine Information A_p^T M_p A_p positiv semidefinit ist und sich addiert; der Test prüft die Fisher-Differenz und jede Varianz dagegen. Das Ergebnis der fünf Anordnungen ist die bestehende Zeile mit realen Daten und bleibt unverändert. Der hinzugefügte Reflektor verwendet die Epochen wieder, die für die fünf bestehenden Anordnungen geplant sind, ein ILLUSTRATIVE Zeitplan, und Netz, Zeitplan und Verzögerungs-Sigma der hinzugefügten Bake sind die ILLUSTRATIVE Eingaben von lunar-frame-campaign; der Ort ist eine ILLUSTRATIVE südpolare Position. Ein südpolarer Ort sieht die Erde tief am Horizont oder gar nicht, was die bestehenden Tests zum Blickwinkel ausdrücken; keiner der beiden Orte wird fortlaufend entfernungsgemessen. Die Zahlen sind Cramér-Rao-Schranken für eine reduzierte Parametermenge, kein gelöstes Datum und keine Aussage über eine reale Station

# text
seg-d9f033ebf109 = Mond-Bezugsdatum aus einer REALEN Beobachtungskampagne, Mondzentrum aus dem Kernel

# text
# c1: lunar-llr-datum
seg-6f272a06c9f3 = Die Kovarianz des Helmert-Datums mit sieben Parametern von lunar-llr-datum aus archivierten ILRS-Normalpunkten und ihren gemessenen Gewichten, auf dem Kernel-Pfad: Das geozentrische Mondzentrum wird von dem eigenen Kernel-Leser der Engine aus JPL DE440 gelesen (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Nur das Mondzentrum unterscheidet sich von der analytischen Zeile; die Orientierung der IAU { "2015" }, die fehlende Polbewegung und UT1, die Kataloge, Auswahlregeln, Gewichte und die lineare Algebra sind dieselben. Die validierte Aussage ist nur, dass die Datumskovarianz dieses Pfads mit einer unabhängigen Referenz aus SPICE und NumPy auf frischen, ungesehenen Normalpunkten übereinstimmt. Der Vergleich unterscheidet Mondmodelle nicht und prüft das Mondzentrum nicht: Auf demselben Ausschnitt besteht auch der analytische Mond jeden Zielwert, die vorregistrierte Mutation (der Kernel-Mond eine Stunde zu spät gelesen) wurde nicht erkannt, und ein um etwa { "4,650" } km falsches Mondzentrum besteht ebenfalls (siehe den Text der Referenz). Es ist kein Beleg dafür, dass der Kernel-Mond das Datum verbessert. Ausführbar als das Szenario <c1/> mit planetary_kernel_path (und normal_points_dir für einen anderen Ausschnitt)

# text
seg-ec47513b1828 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) Zweiweg-Lichtlaufzeiten auf DE440, ITRF93-Erdorientierung und die DE440-Mondorientierung (MOON_ME) mit finit differenzierten Partialen von { "100" } m, und numpy { "2.3.5" } (BSD-3-Clause, LAPACK) Informationsmatrix und Inverse: der unveränderte Generator des Vergleichs der analytischen Zeile (6b27964a), ausgeführt auf einem frischen Ausschnitt (EDC-CRD-Normalpunkte, 2019-04..06), vorregistriert in 830d945a, bevor irgendetwas davon abgerufen wurde, bei den Zielwerten der analytischen Zeile ({ "1" } % Sigmas und Normen, { "2" } % Kondition und Verhältnisse, exakte Buchführung, Ränge und Kopplung) und ihrer Selbstprüfung der Referenz (SPICE-O-C { "10.86" } m < { "100" } m). Jede Größe hält, schlechtester Wert { "7.6e-5" }. Mutationen: Die geplante Mondverzögerung um eine Stunde wird NICHT erkannt (die Kovarianz hängt von der Streuung der Sichtlinien ab, nicht von ihrer Zeitgebung); eine strukturelle Mutation, die danach gewählt und als solche offengelegt wurde und die die Partiale der Abwärtsstrecke weglässt, lässt jedes Sigma scheitern. Befund: Auf diesem Ausschnitt besteht auch der analytische Mond (schlechtester Wert { "3.8e-3" }), sodass der Zielwert Mondmodelle nicht unterscheidet und dies die Kovarianz auf frischen Daten validiert, keine Verbesserung durch den Kernel-Mond. Integratorprüfung bei der Zusammenführung (nicht vorregistriert): Der Kernel-Mond relativ zum Erde-Mond-Schwerpunkt statt zur Erde gelesen (Residuen-RMS { "4,649" } km) und die Kernel-Epoche ohne TT minus UTC ({ "69" } s; Residuum { "2.6" } km) bestehen beide weiterhin jeden Zielwert, während das Weglassen von sqrt(n_raw) aus den gemessenen Gewichten alle { "16" } mit Bändern versehenen Größen scheitern lässt; der Vergleich ist empfindlich gegenüber den Gewichten, den Partialen und der linearen Algebra, nicht gegenüber dem Mondzentrum. Beide Seiten lesen DE440: Dies validiert die Berechnung auf DE440, nicht DE440. Außerhalb der Aussage: eine LLR-Genauigkeit (eine Cramér-Rao-Schranke für eine reduzierte Parametermenge)

# text
seg-bd3af378b613 = Eingebaute analytische Mondephemeride — ihre ANGEGEBENE GENAUIGKEITSSCHRANKE gegen reale Daten geprüft

# text
seg-a51c4e234a4f = ephem::moon_position, die geozentrische Mondreihe geringer Präzision, auf die die Crate zurückfällt, wenn kein DE/SPK-Kernel vorhanden ist, gemessen gegen reale Mondlaserentfernungsmessung und gegen eine veröffentlichte Planetenephemeride über denselben Zeitraum. Diese Zeile validiert die Schranke, die das Modul über sich selbst angibt, KEINE Genauigkeit: Es wird bestätigt, dass die Reihe nicht schlechter ist, als sie angibt, nicht, dass sie gut ist

# text
seg-81dff68ddd9c = ZWEI unabhängige externe Datensätze, die nichts teilen. ({ "1" }) { "337" } archivierte Normalpunkte der ILRS-Mondlaserentfernungsmessung (EUROLAS Data Center, DGFI-TUM, 2015-04-08 bis 2015-06-27, fünf Retroreflektor-Anordnungen, eingecheckt mit SHA-256 je Datei und einem Skript zum erneuten Herunterladen und Verifizieren): beobachtet-minus-berechnet einfache Entfernung { "156,494" } m RMS, mit Stationskoordinaten aus IERS ITRF2020 und Reflektorkoordinaten aus JPL DE430 Tabelle { "7" }, sodass das Residuum von der Reihe des Mondzentrums dominiert wird. ({ "2" }) Geometrische geozentrische Mondzustände von JPL Horizons über denselben Zeitraum: { "112,567" } m RMS radial, { "195,655" } m RMS Vektor, schlechteste Epoche { "360,324" } m = { "0.0536" }°. Ein Entfernungsresiduum reagiert auf den RADIALEN Anteil eines Ephemeridenfehlers, sodass ({ "1" }) und ({ "2" }) dieselbe Größe auf zwei Wegen sind und auf { "1.39" }× übereinstimmen — was das Szenario lunar-llr-datum berechtigt, sein Residuum der Ephemeride zuzuschreiben. Die eigene Moduldokumentation der Engine beansprucht ~{ "0.3" }° / ~einige·10² km; beide Messungen liegen darin, die Winkelaussage mit einem Abstand von { "5.6" }×. GELTUNGSBEREICH, so angegeben, dass kein Leser ihn missverstehen kann: Dies validiert die angegebene SCHRANKE, keine Genauigkeitszahl. Die Reihe bleibt ungeeignet für jede Anwendung, die besser als ~{ "1e5" } m braucht, und diese Einschränkung ist ebenso Inhalt der Zeile wie die Übereinstimmung. Offline regenerierbar durch die eingecheckten Skripte zum Abrufen und Verifizieren

# text
seg-44f582b17fa9 = Integrität des Tores — ein Grün, das bedeutet, was es sagt

# text
# c1: cargo test --all
seg-43fbcfbe990c = Drei strukturelle Wachen über den Verifikationsprozess selbst, die jeweils eine Klasse von Defekten schließen, die als zeitweiliges oder falsches Rot das kanonische Tor erreicht hat. ({ "1" }) Jeder konstruierte temporäre Pfad in den Rust-Quellen muss eine Komponente tragen, die je Aufruf eindeutig ist; eine Prozess-ID wird abgelehnt, weil cargo die Bibliothekstests als parallele Threads EINES Prozesses ausführt und die pid von allen geteilt wird. ({ "2" }) Jeder Byte-für-Byte- oder Hash-Pin muss neben sich oder in seinem Modulkopf angeben, was er abdeckt und was er bewusst ausschließt — damit eine übergreifende Änderung auf einen Blick erkennen kann, welche Pins im Geltungsbereich liegen und welche stillschweigend zu repositoryweiten Änderungsdetektoren geworden sind. ({ "3" }) Ein Grün ist nur aus der VOLLSTÄNDIGEN Suite behauptbar: scripts/gate.sh führt <c1/> aus, erfasst den wahren Exit-Code ohne eine Pipe dazwischen und schreibt eine Quittung, die den Commit, die Anzahl der Integrationsbinärdateien, die Anzahl der Tests und die Dauer nennt; die Prüfung vor dem Push lehnt einen Push ab, dessen Commit keine gültige Quittung nennt, auf einem sauberen Baum. Die Wiederholbarkeit wird getrennt durch scripts/check-repeatability.sh stichprobenartig geprüft, das die Bibliothekssuite N-mal ausführt und scheitert, wenn sich die Menge der bestandenen Tests unterscheidet.

# text
seg-17a5f9da54a4 = Geschlossene Form: Jede Wache wird über einen festen bekannt schlechten Schnipsel ausgeführt, der auslösen muss, und einen festen bekannt guten Schnipsel, der still bleiben muss, beides wörtliche Konstanten, die der Detektor nicht beeinflussen kann. Die beiden bekannt schlechten Schnipsel sind die Defekte F22 und F25 in ihrer ursprünglichen Gestalt. Dies ist eine INTERNE Referenz, und die Zeile ist entsprechend MODELLED: Sie beweist, dass die Wachen den Defekt von seiner Behebung unterscheiden, nicht, dass die Klassen, die sie beschreiben, erschöpfend sind. Ihre angegebenen blinden Flecken — geteilter Zustand, der kein Pfad ist, ein Pin in einer kurzen benannten Konstante, ein seltener Wettlauf, den drei Läufe nicht erfassen, und eine Quittung, die jeder fälschen kann, der die Datei schreiben kann — sind in der Moduldokumentation von tests/source_guards.rs und im Kopf jedes Skripts ausgeschrieben, statt dass man sie erst entdecken muss.

# text
seg-178192c9c87a = Zusammengesetztes Zeitgebungs-PL — skalare MHSS-Spezialisierung (H=1_N)

# text
seg-431aaf94ec31 = Skalares Zeit-TPL der Lösungstrennung über heterogene Quellen; PL getrieben vom Rauschen der Teilmenge des schlechtesten Ausschlusses + UTC(k)-Bias

# text
seg-9a5ea79248c8 = P2: numpy { "2.3.5" } linalg.lstsq und scipy { "1.18.1" } (norm.isf, norm.sf, brentq) berechnen mit ihren eigenen Algorithmen die gewichteten Kleinste-Quadrate-Schätzer der Teilmengen, die allgemeine Trennungskovarianz sqrt(Δ Σ Δᵀ), die Biase und daraus das Schutzniveau auf { "300" } eingecheckten Eingaben neu (tests/fixtures/tpl_scalar_numpy_oracle); das PL stimmt innerhalb von { "1e-9" } relativ überein (schlechtester Wert { "1.2e-10" }), und die treibende Ausschlussteilmenge ist identisch, die Toleranz vor dem Vergleich festgelegt. Die Multiplikatoren, Priors und Bias-Überschranken sind Eingaben, und die Struktur der PL-Gleichung (Modusliste, Aufteilung ir/2, Bias-Projektion) ist eine angegebene Eingabe, wie bei der Zeile zum Kern des lunaren ARAIM-Schutzniveaus; die validierte Aussage ist die lineare Algebra und das PL auf diesen Eingaben, nicht die physikalischen Größen eines Zeitgebungsszenarios. ARAIM-Linie Blanch { "2015" } / Joerger { "2014" }

# text
seg-b7cd952ff133 = Zusammengesetztes Zeitgebungs-PL — mit P0 gestartete Holdover-Überbrückung

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); unterhalbstetiges PL({ "0" }+)≥PL({ "0" }−); K(IR/2) laufendes Maximum; Phasenexponenten τ/τ³/τ⁵

# text
seg-1438193381be = Eigenschaftstests (Monotonie, kein Abfall bei der Übergabe) + Exponenten-Lint gegen holdover::coast_phase_variance

# text
seg-3ab4509b62a2 = Zusammengesetztes Zeitgebungs-PL — Abdeckung der Holdover-Hüllkurve, Mehrjahresbereich (tau>=90d)

# text
seg-d9520f6c1769 = Die Hüllkurve des laufenden Maximums überschränkt (ohne Durchstoß) eine reale metrologische Reihe bei jeder getesteten Verzögerung tau>=90d auf einem disjunkten Segment; kurzes tau (<=30d) ist eine offengelegte Grenze von Modelled

# text
seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] 5-Tage-Reihe MJD 56074-60429 ({ "872" } Punkte, webtai-API); disjunkte Anpassung/Test, mehrjährige Abdeckung ohne Durchstoß

# text
seg-096b6cdfe2dc = Zusammengesetztes Zeitgebungs-PL — LIL-Hüllkurve f.s. (Unmöglichkeit + Konsistenz)

# text
seg-1671add2210d = Kein endliches Worst-Case-Holdover (das Brownsche Supremum divergiert); IR-zugeteiltes HPL konsistent mit der Hartman-Wintner-Hüllkurve für IR→{ "0" }

# text
seg-c9ed8bbede70 = Identität der Hüllkurve f.s. √(2Dt·lnln t) in geschlossener Form + Prüfung der HPL-Dominanz; Baweja arXiv:{ "2606.24210" } Naht der Unmöglichkeit

# text
seg-5a27c9f0a67d = Integritäts-Überschranke für den heterogenen Rückführbarkeits-Bias von UTC(k)

# text
seg-fd09ab2adbf6 = Überschranke des Bias je Quelle b = (U/k_cov)·Phi^-1(1-tail/2) + Alterung, die eine veröffentlichte erweiterte Unsicherheit vom Typ B auf einen zugeteilten Integritätsrand aufbläht; Brücke zu tpl_scalar als bias_s

# text
seg-1fd53acf9a3f = Unabhängige Reproduktion der geschlossenen Form der Überschranke mit numpy + stdlib-statistics (InternalConsistency). Die BIPM-Reihe Circular-T [UTC-UTC(USNO)] ist nur eine ZITIERTE Eingabe — sie ist DIESELBE Reihe, die bereits für die Zeile zur Holdover-Abdeckung R4 validiert ist, und wird hier NICHT erneut validiert; die Reproduktion ihrer Werte beweist nichts über R2. Der tiefe Integritätsrand ist modelliert. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): auf den BIPM-Dateien UTC-UTC(k) je Laboratorium ({ "102" } Laboratorien, { "105 024" } Zeilen mit veröffentlichten Unsicherheiten) wird die Überschranke b = { "2.576" } u beim Rand { "1e-2" } von { "50.8" } % der Zeilen überschritten (Clopper-Pearson { "95" } %: { "50.4" } bis { "51.1" } %) und bei { "101" } von { "102" } Laboratorien um mehr als { "1" } %. Die veröffentlichte u ist die Unsicherheit der Bestimmung von UTC-UTC(k) durch das BIPM, keine Schranke für den Offset, der regelmäßig ein Vielfaches von u erreicht; die Überschranke in der angegebenen Form begrenzt den realen Rückführbarkeits-Bias von UTC(k) nicht. { "0.30" } Runde { "2" }, eine Überschranke der realisierten UTC-UTC(k)-Offsets, trainiert auf 2015-2022 und getestet auf BIPM-Circular-T-Daten von 2023-2026 (vorregistriert ca0921a4, gepoolte Überschreitung höchstens { "1e-2" }), ein Befund (bleibt MODELLED): Die gepoolte Überschreitung beträgt { "0.0333" } ({ "694" } von { "20 826" } Zeilen über { "82" } Laboratorien; { "0.0127" } ohne die { "430" } Zeilen, die per Regel keine Schranke haben). D9 Runde { "3" }, eine gepoolte hierarchische Alterungsschranke (utck_bound), vorregistriert fb475550 und prospektiv bewertet auf Circular-T-Ausgaben ab { "465" }: noch nicht ausgeführt (Ausgabe { "465" } wurde am 2026-10-12 mit etwa { "285" } Testwerten veröffentlicht; die vorregistrierte Regel von 1000 Werten braucht Ausgaben bis etwa { "468" }, und der Lauf braucht die archivierten Dateien je Laboratorium vom 2026-09-30, da das BIPM seither { "87" } der { "113" } umgeschrieben hat)

# text
seg-d75b900ad25f = Korrelierte Kreuzkovarianz des Rückführbarkeits-Bias (für Gleichtakt unsichere Zuteilung)

# text
seg-0641f6d38c23 = N×N-Bias-Kreuzkovarianz mit Nebendiagonalen rho·b_i·b_j für Quellen, die einen UTC(k)-Realisierer teilen; BEWIESEN correlated_fused_bias >= independent_fused_bias (die naive unabhängige Zuteilung unterschätzt den fusionierten Bias -> optimistisch -> unsicher)

# text
seg-72359f29aab1 = Unabhängige numpy-Reproduktion der Kreuzkovarianz und der Ungleichung zwischen korreliertem und unabhängigem fusioniertem Bias (InternalConsistency). Repräsentative Quellenmenge; Szenario Modelled.

# text
seg-0359a9194c60 = GLS-Gleichtakt-Weißung (Aitken) + Mahalanobis-Identität

# text
seg-67b11ff6d055 = Handgeschriebene Cholesky-Zerlegung Omega=LL^T und Weißung durch Vorwärtssubstitution z=L^-1 r (Cov(z)=I, wenn Cov(r)=Omega); Mahalanobis-Quadrat z^T z = r^T Omega^-1 r

# text
seg-2797643153dc = Zeitgebungs-Schutzniveau für einen Empfänger im Orbit unter GNSS-Spoofing

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, erreichbar als Spoofing-Abschnitt der Art <c1/>: Geschwindigkeit und Periode auf einer Kreisbahn, die längste Zeit, in der ein Bodenspoofer den Satelliten je Überflug erreichen kann, die uhrgestützte Monitoruntergrenze und die CUSUM-Erkennungslatenz, das bedingte Schutzniveau (Untergrenze plus Auslaufen über die Latenz), den Zug, den ein Spoofer mit einer angegebenen maximalen Rampenrate ansammelt, bevor der Satellit seinen Footprint verlässt oder eine unabhängige Prüfung läuft, und ob jede Bodenkontakt- oder Crosslink-Prüfung von einem Bodenspoofer unabhängig ist

# text
seg-3d441db3a373 = Reduktion auf das bestehende Zeitgebungs-Schutzniveau und die geschlossenen Formen für Kreisbahn und kugelförmige Erde bei der Sichtbarkeit. Bedingt auf Erkennung, ein terrestrischer Spoofer mit einer angegebenen Rampenrate, ein Überflug direkt darüber auf einer nicht rotierenden Erde; nicht an einem gespooften Empfänger im Orbit validiert

# text
seg-158a99d40b0d = Leistungsdichtespektren von L-Band-Signalen in geschlossener Form und spektrale Trennungskoeffizienten

# text
seg-17060c71fa54 = Leistungsdichtespektren mit Einheitsfläche von GPS L1 C/A und L2C (BPSK({ "1" })), GPS L5 und Galileo E5a (BPSK({ "10" })), Sinus-BOC({ "1,1" }) und Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, mit einer ergänzten MBOC-Variante), ihre numerisch lokalisierten Nullstellen und Maxima (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz) und der spektrale Trennungskoeffizient eines Signals gegen ein beliebiges Spektrum bei einem beliebigen Versatz (navsignal::spectral_separation_coeff_offset) oder gegen einen Ton, flaches Rauschen, einen Chirp oder angepasstes Rauschen (spectrum::Jammer::ssc), mit dem Anti-Jam-Koeffizienten Q = 1/(R_c kappa)

# text
seg-d8fadba57203 = Veröffentlichte Lehrbuchwerte: die BPSK(n)-Hauptkeule von 2n x { "1.023" } MHz von Nullstelle zu Nullstelle und die Anti-Jam-Koeffizienten Q = { "1" } für einen Schmalband-Jammer (CW) und Q = { "1.5" } für einen Spreizspektrum-Jammer, der an C/A angepasst ist (Kaplan & Hegarty, Understanding GPS/GNSS, 3. Aufl., Abschnitt { "9.4" }); die BOC(m,n)-Hauptkeulen, zentriert bei plus oder minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); die spektralen Trennungskoeffizienten -61.8, -64.8 und -67.8 dB/Hz für C/A mit C/A, BOC({ "1,1" }) mit BOC({ "1,1" }) und C/A mit BOC({ "1,1" }) (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, Mai/Juni { "2006" }), hier aus ihren geschlossenen Formen der Autokorrelation nach Parseval reproduziert. Das Maximum von BOC({ "1,1" }) liegt nicht bei { "1.023" } MHz: Die Keule reicht von der Trägernullstelle bis { "2.046" } MHz und hat ihre Spitze bei { "0.759" } MHz, und der Test legt beides fest. Die MBOC-Mischung ist die Definition des ICD, nur auf Einheitsfläche und Linearität geprüft

# text
seg-f134975d4ffa = L-Band-Spektrum-Wasserfall mit J/S je Band und effektivem C/N0 unter einem skriptgesteuerten Jammer-Zeitverlauf

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = Die Art <c1/>: ein Raster aus Frequenz mal Zeit der Leistungsdichte im L-Band (thermischer Boden k T_sys mit T_sys = T_ant + { "290" } K (F - { "1" }), die Signale mit ihren in der Schnittstellenspezifikation angegebenen minimalen Empfangsleistungen sowie Continuous-Wave-, Schmalband-, Chirp- und Matched-Noise-Jammer mit Ein-/Ausschaltzeiten), jede Zelle über ihren Bin und ihre Zeile gemittelt (Chirps exakt über ganze und teilweise Durchläufe, Jammer nach Tastverhältnis), je Zeile effektives C/N0 je Band = [1/(C/N0) + sum (J/S) kappa]^-1, J/S je Band, J/S im Band und ein SVG-Wasserfall mit C/N0-Balken. Der Bericht trägt eine Gegenprüfung gegen die Kette der Art <c2/> mit denselben Streckeneingaben

# text
# c1: jamming
# c2: jamming
seg-deead3dc3c43 = Reduktion auf die Anti-Jam-Gleichung und das Streckenbudget der bestehenden Art <c1/> (derselbe Code, mit denselben Eingaben aufgerufen) und die geschlossene Form des Rauschbodens k T0 F. Die zugrunde liegenden Signalspektren sind die validierte Zeile oben; die Jammer-Leistungen, der Zeitverlauf und die Bandbreiten des Frontends sind Szenarioeingaben, die Spektren sind kontinuierlich (keine Spreizcode-Linien), und keine automatische Verstärkungsregelung, Ausblendung oder Antennencharakteristik wirkt auf den Jammer. Im Repository liegt kein gemessenes gejammtes Spektrum, gegen das sich das Gesamtmodell prüfen ließe. Die Q-Tabelle der Art <c2/> (CW und Schmalband { "1" }, Breitband und Sweep { "2" } seit { "0.36" }: die Lehrbuchwerte, auf die geschlossenen Formen von navsignal festgelegt) stimmt mit dem CW-Wert dieses Modells überein und weicht von dem ab, was es für an C/A angepasstes Rauschen ({ "1.5" }) und für flaches Rauschen von Nullstelle zu Nullstelle ohne Normierung im Band ({ "2.2" }) ableitet; der Bericht gibt beides aus

# text
seg-1461dcaed6be = SigMF-Aufzeichnung als Eingabe und Ausgabe sowie Welch-Spektralschätzungen komplexer IQ-Daten

# text
# c1: spectrum
seg-2195d95299b2 = sigmf: Aufzeichnungen im Signal Metadata Format lesen und schreiben (JSON .sigmf-meta mit den Kernfeldern global, captures und annotations; rohes .sigmf-data als cf32_le, ci16_le oder ci8, wobei die Ganzzahl-Decoder mit realdata::iqif::load_iq geteilt werden), alles auf Zeichenketten und Bytepuffern. spectrum::welch_psd: Periodogramme mit Hann-Fenster, überlappend, gemittelt, dichteskaliert, auf einer Radix-2-Transformation innerhalb der Crate (spectrum::fft_in_place). Diese beiden sind die validierte Aussage. spectrum::synthesise_iq zieht das Modell als IQ, und der Abschnitt [iq] der Art <c1/> führt Modell zu IQ zu SigMF zu Welch aus und vergleicht mit dem Modell; sein Abschnitt [recording] schätzt eine reale Aufzeichnung (native Builds); die Synthese und diese Modellvergleiche liegen außerhalb der validierten Aussage

# text
seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) mit demselben periodischen Hann-Fenster, Überlappung, Dichteskalierung, ohne Detrend und zweiseitigem Mittelwert: jeder Bin innerhalb von { "1e-12" } relativ (beobachtet { "6.0e-14" }) über { "27" } Fälle, wobei die Segmentzahlen aus dem eigenen Spektrogramm von scipy stammen. sigmf-python { "1.13.0" } (LGPL-3.0, als Werkzeug ausgeführt) schreibt fünf Aufzeichnungen Dritter (cf32_le, ci16_le, ci8, zwei Captures mit Annotationen, ein erstes sample_start ungleich null), die die Crate bitidentisch mit identischen Kernfeldern dekodiert, und liest die Aufzeichnungen der Crate bitidentisch zurück; das Metadatenschema von SigMF { "v1.2.6" } meldet null Fehler auf den Metadaten der Crate. Toleranzen vor dem ersten Vergleich festgelegt. Außerhalb der Aussage: spectrum::synthesise_iq und die Vergleiche von [iq] und [recording] mit dem Modell (eine Synthese hat keine einzige richtige Antwort; ein periodischer Chirp zeigt Linien, Fresnel-Welligkeit und Randausläufer, die das glatte Modell auslässt, Gesamtleistung innerhalb von { "2" } %), die Konvention der Skalierung von Ganzzahl zu Gleitkomma (die Crate teilt durch { "32767" } und { "127" }, die automatische Skalierung von sigmf-python durch { "2" }^{ "15" } und { "2" }^{ "7" }, was die Spezifikation offenlässt; der Vergleich verwendet rohe Codes), mehrkanalige Aufzeichnungen und die Datentypen, die der Leser ablehnt

# text
seg-bf2d02d76762 = Planetenpositionen im gesamten Sonnensystem aus den keplerschen Elementen von JPL nach Standish

# text
# c1: solar-system
seg-c9d3549045eb = Heliozentrische Positionen von Merkur, Venus, dem Erde-Mond-Schwerpunkt, der Erde, Mars, Jupiter und Saturn aus Standish Tabelle { "1" } ({ "1800" } n. Chr. bis { "2050" } n. Chr.) und aller acht Planeten aus den Tabellen 2a/2b ({ "3000" } v. Chr. bis { "3000" } n. Chr., mit den Termen b, c, s, f der mittleren Anomalie), dem Algorithmus der JPL-Seite Schritt für Schritt folgend und mit der Schiefe der Seite ins ICRF (International Celestial Reference Frame) gedreht; die Erde wird durch die Mondreihe von Montenbruck & Gill und das Massenverhältnis vom Schwerpunkt getrennt. Zusammengesetzt als ephem_provider::AnalyticSolarSystem, sodass jeder Körper relativ zu jedem anderen verfügbar ist, und ausführbar als die Art <c1/>

# text
seg-24e058d4d094 = Geometrische heliozentrische Vektoren von JPL Horizons DE441 (ekliptikal und ICRF), abgerufen nach den Vorregistrierungs-Commits { "80451866" }, 8d38a28b und 558cc807. Zielwert: je Planet und Komponente RMS höchstens das 1.0x der angenäherten Fehler der Tabelle { "8.10.1" } des Explanatory Supplement 3. Aufl. (die Zeile EMB für die Erde); die Trennung Erde-EMB wird direkt gegen DE441 { "399" } minus { "3" } geprüft, höchstens { "0.3" } deg und { "8.1" } km bei jeder Epoche 1950-2050 (der Längenzielwert von { "8.1" } km stammt aus der Genauigkeit der Mondreihe, die in der eigenen Ephemeridendokumentation von Kshana unter Verweis auf Montenbruck und Gill angegeben ist, und wurde nicht gegen das Buch geprüft; die gemessenen { "6.09" } km liegen nahe daran). Die RMS-Statistik wurde in Kenntnis dessen gewählt, dass ein früherer Vergleich mit 27 Epochen an seinem Maximum das 1.87x des Nennwerts erreichte; Fehler einzelner Epochen erreichen das 3.83x (3.87x im ICRF-Fall). Das Supplement definiert seine Zahlen nicht als RMS. Fall B dreht beide Seiten mit der im Test getippten Schiefe der IAU { "1976" }, sodass die Drehung nicht gegen sich selbst geprüft wird. Die Standardtabellenauswahl von AnalyticSolarSystem wird nicht ausgeübt (die Tests erzwingen Tabelle { "1" }). Uranus und Neptun aus Tabelle { "1" } sind eine eigene Zeile MODELLED

# text
seg-4ea08a296b37 = Positionen von Sonne, Mond, Merkur und Venus aus dem Kernel DE440 zu UTC-Epochen (KernelEphemeris)

# text
seg-8d47467c36e4 = Geometrische Positionen von Sonne, Merkur, Venus, Erde und Mond relativ zueinander (J2000/ICRF-Achsen, Meter) aus einem JPL-DE440-Kernel über ephem_provider::KernelEphemeris zu UTC-Epochen: Körpernamen auf NAIF-Codes abgebildet, UTC durch die Schaltsekundentabelle und TT mit der Zweiterm-Reihe TDB-TT zu TDB geführt, der Kernel vom eigenen Leser der Engine gelesen. Ein Körper, den der Kernel nur als Systemschwerpunkt enthält (Mars bis Neptun, Pluto in de440s), wird abgelehnt, nie ersetzt. Die kernelfreie Zeile nach Standish bleibt der Pfad für Browser und Rückfall

# text
seg-f0e09f78814a = Skyfield { "1.54" } (MIT), mit eigener Schaltsekundentabelle, eigenem TDB-TT und eigenem Leser derselben NAIF-Datei de440s.bsp (jplephem), als separates Programm zu UTC-Epochen ausgeführt. Vorregistriert (0bfafe6d), bevor das Fixture existierte, das Raster aus dem Hash dieses Commits initialisiert, mit einem Zielwert von { "5e-5" } s mal der relativen Geschwindigkeit (die angegebene Genauigkeit der Zweiterm-Reihe TDB-TT der Engine) plus { "1e-13" } der baryzentrischen Entfernung plus { "1e-5" } m, je Komponente. Ergebnis: alle { "600" } innerhalb, schlechtester Wert { "0.66" } des Zielwerts ({ "2.96" } m bei einem schnellen Paar, der eigene Fehler der Reihe TDB-TT). Mutation: TT statt TDB verwendet scheitert beim { "33" }-fachen des Zielwerts. Beide Seiten lesen DE440: Dies validiert den Provider und seine Zeitkette, nicht DE440. Außerhalb der Aussage: die Planeten jenseits der Venus als Körper (de440s enthält nur ihre Schwerpunkte), die Planetenmonde und Präzision unterhalb der Zweiterm-Reihe TDB-TT (einige Meter bei den schnellsten Paaren)

# text
seg-b59153f28d69 = Lichtlaufzeit zwischen Körpern des Sonnensystems

# text
# c1: solar-system
# c2: body-pnt
seg-48ebe0983725 = Die newtonsche einfache Lichtlaufzeit von jedem Körper zu jedem anderen, zu einer Epoche empfangen, gelöst durch den radiometrischen Fixpunkt-Lichtlaufzeitlöser (radiometric::light_time_solution, Sender an seiner retardierten Position) über solar_system::link_on auf einem beliebigen EphemerisProvider; die Art solar-system führt ihn auf dem analytischen Sonnensystem im heliozentrischen Bezugssystem aus (solar_system::link). Die Zweiweg-Entfernung aus radiometric::two_way_range und die Shapiro-Verzögerung der Sonne aus radiometric::shapiro_delay werden getrennt berichtet und nicht extern verglichen. Ausgegeben für jeden Körper gegen einen Beobachter und für jede zusätzliche Strecke durch die Art <c1/> sowie für den Downlink vom Körper zur Erde durch die Art <c2/>

# text
seg-0685ab1ef2d3 = Einfache newtonsche Lichtlaufzeit LT der Abwärtsstrecke von JPL Horizons DE441 (VEC_CORR=LT, Beobachter das Erdzentrum), vorregistriert (480037d3, Änderung 54d5c86f, die nur den Stützstellenabstand der Interpolation änderte, nachdem der erste Abruf die Vorbedingung von { "10" } m Interpolationsgenauigkeit verfehlt hatte, bevor irgendeine Lichtlaufzeit verglichen wurde) mit einem Zielwert von { "1e-6" } s je Lichtlaufzeit, wobei dem Löser baryzentrische Positionen von DE441 zugeführt wurden, damit die Iteration des retardierten Senders sichtbar ist (ein Löser mit erster Iterierter verfehlt um bis zu { "0.1" } s). Auf den analytischen Positionen nach Standish ist die Lichtlaufzeit nur so gut wie diese Positionen (siehe die Zeile zu den Planetenpositionen); die ausgelieferte Strecke behandelt die Sonne als Inertialzentrum, was innerhalb dieses Positionsfehlers bleibt, aber nicht gesondert validiert ist. two_way_range und shapiro_delay werden nicht extern verglichen

# text
seg-6e0b9687e8ee = Uranus und Neptun aus Standish Tabelle { "1" }, Pluto und Planetengeschwindigkeiten

# text
seg-df3bf502dfe9 = Positionen von Uranus und Neptun aus Standish Tabelle { "1" } (die Voreinstellung innerhalb von { "1800" } n. Chr. bis { "2050" } n. Chr.), Pluto aus der Zeile der Tabelle { "1" } von { "1992" }, die die aktuelle JPL-Seite nicht mehr aufführt, und die heliozentrische Geschwindigkeit jedes Planeten: die Zweikörper-Ableitung mit der durch die Elemente implizierten mittleren Bewegung plus der Drehung der Ellipse durch die Raten von Perihel, Neigung und Knoten

# text
seg-f49245efe44f = Gemessen gegen JPL Horizons DE441 (dieselben eingecheckten Fixtures), aber nicht validiert: Die angegebenen Zahlen der Tabelle { "1" } für Uranus und Neptun werden gegen heliozentrische Positionen von DE441 um bis zu { "2.0" } und { "5.2" } Mal überschritten (Neptun hält sie gegen baryzentrische Positionen ein, was nahelegt, dass die Anpassung nicht heliozentrisch war), die Seite gibt keinen Fehler für Pluto an, und für die Geschwindigkeiten existiert keine veröffentlichte Schranke. Die Tabellen 2a/2b halten ihre eigenen Zahlen für Uranus und Neptun ein und sind von der validierten Zeile abgedeckt

# text
seg-a50be56f605a = Positionen des Mondes und von sieben großen Monden (Phobos, Deimos, die galileischen Monde, Titan)

# text
seg-2cfbe5a1eece = Der geozentrische Mond aus der Reihe von Montenbruck & Gill (deren Term von -1.3972 deg pro Jahrhundert ihn bereits auf das Äquinoktium J2000 bezieht) sowie planetozentrische Positionen und Geschwindigkeiten von Phobos, Deimos, Io, Europa, Ganymed und Kallisto aus den mittleren Elementen der JPL Solar System Dynamics in der Laplace-Ebene jedes Mondes, wobei die Rate der mittleren Länge aus der synchronen Rotationsrate der IAU genommen wird (die Tabelle druckt die Periode mit zu wenigen Stellen, um die Phase zu halten), und von Titan aus dem Rotationsmodell der IAU (der Mond auf der negativen körperfesten x-Achse im mittleren Abstand), weil die gedruckte Zeile der Laplace-Ebene von Titan Horizons nicht einmal bei ihrer eigenen Epoche reproduziert

# text
seg-6c81bd570fe5 = Gemessen gegen die Satellitenephemeriden von JPL Horizons (DE441, MAR099, JUP365, SAT441), eingecheckt in tests/fixtures/solar_system/horizons_satellites_icrf.csv mit Abfrage und Abrufdatum; für mittlere Elemente oder für die Platzierung nach dem Rotationsmodell existiert keine veröffentlichte Genauigkeit, sodass die festgelegten Zielwerte Regressionen auffangen und nicht validieren. Mittlere Elemente lassen die resonanten und solaren Störungen aus, und die säkulare Beschleunigung von Phobos ist nicht modelliert

# text
seg-8b8c8e28ece9 = Physikalische Konstanten jedes Körpers des Sonnensystems und der Bericht über das gesamte System

# text
# c1: solar-system
seg-d225a30de35c = Body erhält Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan (Gravitationsparameter, Referenzradius, J2, wo veröffentlicht, mit dem Radius, auf den es sich bezieht, IAU-Pol und Nullmeridian), eine Namenssuche und einen Datensatz BodyFacts (NAIF-Code, Klasse, Mutterkörper, Äquatorial- und mittlerer Radius); die Art <c1/> berichtet sie für alle achtzehn Körper mit den Positionen, Lichtlaufzeiten und einer Bahnspur über einen Umlauf, wobei jeder Körper als VALIDATED oder MODELLED gekennzeichnet ist

# text
seg-6adc29de51fd = Abschrift veröffentlichter Konstanten, jeweils dort zitiert, wo sie definiert werden: Gravitationsparameter aus den Körperdatensätzen von JPL Horizons und der Tabelle der physikalischen Satellitenparameter von JPL, Radien aus den Tabellen der physikalischen Parameter von JPL (IAU WGCCRE { "2015" }), Pole und Nullmeridiane aus der IAU Working Group on Cartographic Coordinates and Rotational Elements (Mittelwerte, ohne die T-Raten und periodischen Terme), J2 aus Smith et al. { "2012" }, Iess et al. { "2018" } und { "2019" } sowie Jacobson { "2009" } und { "2014" }. Auf interne Konsistenz geprüft (die Rotationsperiode des Jupiter gegen die Rate des Systems III, jedes J2 gegen seinen Referenzradius), nicht gegen eine externe Referenz. { "0.30" } Runde { "2" }: Die GM-Werte wurden aus gm_de440 und die Elemente von Phobos und Deimos aus pck00011 übernommen, sodass nun { "0" } von { "84" } Konstanten der vierzehn hinzugefügten Körper von NAIF abweichen (zuvor { "12" }), was eine Abschriftsprüfung ist und nicht gezählt wird. { "0.36" }: Die körperfeste Orientierung der IAU und das GM der vierzehn hinzugefügten Körper sind in eine eigene Zeile VALIDATED ausgelagert ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); diese Zeile behält, was übrig ist. J2 und der mittlere Radius sind zitiert, nicht validiert; die Positionen im Bericht beruhen auf ihren eigenen Zeilen; und der Bericht prime_meridian_deg für Erde, Mond und Mars bleibt bei konventionellen Konstanten (bis zu { "6.6e-3" }, { "2.8e-2" } und { "9.6e-4" } rad von IAU_<BODY>). { "0.30" } Revisionen: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Äquatorialradius von Phobos { "13.1" } -> { "13.0" } km; prime_meridian_deg enthält jetzt die quadratischen und periodischen Terme

# text
seg-fa8a4b082cd5 = IAU-Körperorientierung und Gravitationsparameter der vierzehn hinzugefügten Körper des Sonnensystems

# text
seg-fc8d277aa2fd = Body::iau_rotation_et, die Rotation von J2000 in das körperfeste IAU-System von Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan mit jeder Jahrhundertrate, jedem quadratischen Term und jedem periodischen Term, den der Körper in pck00011 trägt, und das Feld des Gravitationsparameters mu derselben vierzehn Körper. Sonne, Erde, Mond und Mars tragen konventionelle Konstanten, die anderen Zeilen gehören, und sind nicht abgedeckt

# text
seg-29bad4bd8e09 = NAIF SPICE Toolkit (CSPICE N0067 über spiceypy) pxform('J2000', 'IAU_<BODY>') auf pck00011.tpc, eine unabhängige Implementierung desselben IAU-Rotationsmodells, und NAIF gm_de440.tpc für GM, wobei die Fixtures von einem separaten Programm erzeugt wurden, das keinen Kshana-Code aufruft (tests/fixtures/body_orientation_spice_oracle/, NOTICE.md). Vorregistriert 154bc54 (mit dem ursprünglichen Zielwert von { "1e-9" } rad aus c2434204), bevor das Fixture für frische Epochen existierte; das frische Fixture wurde unabhängig neu erzeugt und ist byteidentisch. GM ist eine Abschrift von DE440, gegen die veröffentlichte Datei geprüft, keine unabhängige Bestimmung von GM. Ergebnisse: docs/design/evidence/mr08-body-orientation/RESULTS.md

# text
seg-87ab655f8270 = Positionsbestimmung um jeden Körper des Sonnensystems mit einer lokalen Konstellation und einer Deep-Space-Verbindung von der Erde

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = Die Art <c1/>: Ein Orbiter oder ein Lander auf der Oberfläche um einen mit Namen gewählten Körper navigiert mit einfachen Pseudoentfernungen von einer Walker-Navigationskonstellation um den Körper (Zweikörperbahnen mit der säkularen J2-Drift des Körpers, eine unbekannte Nutzeruhr) und einer optionalen uhrfreien Zweiweg-Entfernung von der Erde, wobei Richtung und Entfernung der Erde bei jeder Epoche aus der analytischen Ephemeride stammen; durch die Kugel des Körpers blockierte Sichtlinien und eine Elevationsmaske an der Oberfläche; je Epoche GDOP und PDOP allein der Konstellation (orbit::dop), die formale Positionsunsicherheit mit und ohne die Erdzeile und Gauß-Newton-Lösungen mit festem Startwert (batch_ls::gauss_newton) in beiden Varianten, mit Lichtlaufzeit und Umlaufzeit vom Körper zur Erde

# text
seg-3538c49df107 = Geschlossene Formen und Selbstkonsistenz: das dritte keplersche Gesetz für die Relaisperiode, der über den Lauf gehaltene Bahnradius und Oberflächenradius, die Tatsache, dass das Hinzufügen einer Messung die formale Unsicherheit nie erhöht, und die Übereinstimmung der mit festem Startwert erzeugten Fehler mit der Kovarianz. Die Relaisbahnen ignorieren dritte Körper (die Anziehung des Jupiter auf Relais um Europa ist nicht modelliert), das Rauschen ist gaußsch bei angegebenen Pegeln und das Messmodell ist augenblicklich, daher ist dies nicht gegen die Navigationsdaten irgendeiner Mission validiert

# text
seg-281b680a9897 = Geometrie von Walker-Konstellationen und die veröffentlichten nominellen Slots von GPS, Galileo und GLONASS

# text
# c1: constellation-design
seg-cba54289b732 = Die Generatoren der Art <c1/>: Walker-Delta- und Walker-Star-Muster in der T/P/F-Konvention (Knotenabstand 360/P oder 180/P, Abstand in der Ebene { "360" }·P/T, Phasenversatz zwischen den Ebenen { "360" }·F/T) sowie die Voreinstellungen für die GPS-Basislinie und die erweiterbaren 24 Slots, Galileo und GLONASS, aufgebaut aus ihren veröffentlichten nominellen Elementen und in einem erdfesten System mit dem Greenwich-Stundenwinkel platziert, den ihre Dokumente angeben

# text
seg-bdf83007af50 = Veröffentlichte Dokumente der Agenturen: Galileo Open Service Service Definition Document Ausgabe { "1.1" } (European GNSS Service Centre) Tabellen { "1" } und { "23" }, die Referenzkonstellation am 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document Ausgabe { "5.1" } ({ "2008" }) Abschnitt { "5.2" }, die Slot-Formel für Knotenlänge und Breitenargument; GPS Standard Positioning Service Performance Standard 5. Ausgabe (April { "2020" }) Tabellen 3.2-1, 3.2-2 und 3.2-3, einschließlich der Spalte zum Äquatordurchgang der Bodenspur, die eine unabhängige Aussage der erdfesten Geometrie ist, die die Voreinstellung reproduzieren muss. Validiert die Generatoren und die Abschrift; die Phase der mittleren Umlaufbahn von BeiDou und die Knoten der geneigten geosynchronen Bahnen sind nicht veröffentlicht und nicht abgedeckt

# text
seg-0f1d49ab5d51 = Globale Verdünnung der Genauigkeit der GPS-Basislinien-Konstellation

# text
# c1: constellation-design
seg-83775b77f5ca = Die Abdeckungs-Engine der Art <c1/> auf der Voreinstellung mit 24 Slots der GPS-Basislinie unter den Bedingungen von Anhang B des GPS Standard Positioning Service Performance Standard (SPS PS) (ein siderischer Tag, { "287" } Fünf-Minuten-Schritte, ein globales Raster von { "4" } x { "4" } deg, gewichtet mit dem Kosinus der Breite, alle sichtbar, Maske von { "5" } deg, eine Empfängeruhr): die globale HDOP-Verteilung, der PDOP-Median und die Verfügbarkeit von PDOP höchstens 6, global und am schlechtesten Standort

# text
seg-6fb3c2028c4a = GPS SPS PS 5. Ausgabe (April { "2020" }) Anhang B Abschnitte B.3.2.2 und B.3.2.3, die veröffentlichte globale mittlere HDOP-Verteilung der vollständig besetzten 24-Slot-Basislinienkonstellation (Median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, Mittelwert { "0.96" }), Tabelle 3.8-1 (PDOP-Verfügbarkeit) und Tabelle B.3-1 (Ensemble-PDOP einer degradierten Konstellation, nur als obere Schranke verwendet), plus eine von Hand abgeleitete geschlossene Form für eine Epoche. Die VDOP- und PDOP-Verteilungen der vollständigen Konstellation sind nur als Abbildung veröffentlicht, daher wird PDOP einseitig festgelegt; der schlechteste Raum-Zeit-Punkt (HDOP { "2.40" } und VDOP { "5.22" } hier, { "2.49" } und { "5.43" } veröffentlicht) hängt vom Raster ab und wird berichtet, nicht festgelegt

# text
seg-7d4d7200cbca = Abdeckungs- und DOP-Karten für beliebige Mehrkonstellations-Entwürfe im großen Maßstab, um jeden Zentralkörper

# text
# c1: constellation-design
seg-b78b79e9fae4 = Die Art <c1/> über die beiden festgelegten Fälle hinaus: explizite Entwürfe und Entwürfe mit mehreren Schalen, mehrere Konstellationen je Lauf mit einer Empfängeruhr je Konstellation, Erde, Mond und Mars aus den Körperkonstanten, die BeiDou-Voreinstellung (Phase der mittleren Umlaufbahn und Durchgang der geneigten geosynchronen Bahn bei { "118" } deg O modelliert), sichtbare Satelliten je Zelle, GDOP, PDOP, HDOP, VDOP und Verfügbarkeit, heruntergetastete Bodenspuren und ein Sichtbarkeitsvorfilter nach Breite des Subsatellitenpunkts, der einen Entwurf mit { "5" } 000 Satelliten auf einem Raster von { "10" } deg in einem Bruchteil einer Sekunde ausführt

# text
seg-2c0f28426ab9 = Interne Konsistenz: der Brute-Force-Elevationsscan, die handberechneten Reduktionen und orbit::dop sowie die geschlossene Geometrie von Walker und geosynchroner Bahn. Zweikörperbahnen mit optionalem säkularem J2, ein kugelförmiger Körper mit der lokalen Vertikalen entlang des Radius, nur geometrische Sichtbarkeit (keine Signalleistung, kein Satellitenzustand, kein Gelände und keine Störung durch dritte Körper), und die relative Phase zwischen den Systemen stammt aus verschiedenen Referenzepochen, daher ist es keine Momentaufnahme irgendeines Datums. { "0.30" } Überprüfung, ein Befund (bleibt MODELLED): Die Voreinstellungen halten die veröffentlichten einseitigen Untergrenzen der DOP-Verfügbarkeit (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) ein, bei { "100" } %, aber mit dem in einer Arbeitskopie verdoppelten PDOP der Engine halten sie sie weiterhin ein (schlechtester Punkt { "99.36" } %), sodass die Untergrenzen nicht einmal einen Fehler von { "100" } % in der Größe erkennen können, die diese Zeile berechnet; sie nach dem Lauf zu verschärfen wäre eine nachträgliche Toleranz. Eine Aufwertung braucht einen zweiseitigen Vergleich von DOP-Werten auf identischer Geometrie mit einer vorab gesetzten Toleranz. { "0.30" } Runde { "2" } (tests/coverage_dop_full_oracle.rs, vorregistriert add671d6), ein Befund (bleibt MODELLED): Orekit { "12.2" }-Positionen, -Elevation, -Azimut und -Bodenspuren mit gnss_lib_py { "1.0.4" } GDOP/PDOP/HDOP/VDOP (gemeinsame Uhr) und eine numpy-Inverse (eine Uhr je Konstellation) stimmen bei jedem Zielwert für Galileo, GPS, BeiDou, Galileo+GPS (je eine Uhr) und einen Entwurf der Erde mit 1584 Satelliten überein (DOP innerhalb von { "2e-14" } relativ, identische Lösung, Verfügbarkeit und Sichtbarkeitszahlen). Bei den Entwürfen für Mond und Mars stimmen Elemente, Positionen, Sichtbarkeit und Spuren überein, aber DOP überschreitet den vorab gesetzten relativen Zielwert von { "1e-9" } in Zellen, deren größtes PDOP { "1434" } oder mehr beträgt (bis zu { "8e-6" }), und { "4" } Zellen unterscheiden sich um eine Lösungsepoche bei numerisch singulärer Geometrie (Pivot { "1e-10" } der Engine gegen den Rang von numpy), daher ist die Zeile nicht validiert. { "0.30" } Revisionen: Die Referenzuhr für TDOP/GDOP ist nun die Konstellation mit der niedrigsten Nummer in Sicht (constellation-multi-gnss-coverage globales GDOP-Maximum { "2.2236" } -> { "2.1205" }, Mittelwert { "1.122" } -> { "1.131" }), und die Anzahlen sichtbarer Satelliten je Konstellation werden als Ganzzahlen summiert

# text
seg-278c77438493 = Eine verkettete Mission über Szenarioarten auf einer gemeinsamen Zeitleiste

# text
# c1: campaign
seg-3dcfb26f6234 = Die Phasen der Art <c1/>: Jede Phase führt über run_toml ein oder mehrere Szenarien bestehender Arten aus, liest deren Ausgaben durch Voreinstellungen je Art oder explizite Ergebnispfade in benannte Kanäle (Uhrzeitfehler und Wache, mittleres effektives Träger-zu-Rauschleistungsdichte-Verhältnis und Tracking-Untergrenze, vertikales Schutzniveau und Alarmgrenze, Positionsfehler, verfolgende Satelliten, Alarmflags), platziert sie am Phasenanfang und hält sie auf einem gemeinsamen Raster, mit Phasengrenzen und Ereignissen; der Zustand wird durch carry (ein Kanal setzt sich vom Endwert der vorigen Phase fort), handoff (eine Zahl einer vorigen Phase wird in das nächste Szenario geschrieben) und end_at (eine Phase endet zu einem Zeitpunkt, den ein Lauf berechnet hat, etwa der Erkennungszeit eines Spoofing-Monitors) weitergegeben; ein Kampagnen-Hash und ein Digest über jedes Mitgliedsergebnis

# text
seg-fd018ef7bc3b = Kompositionsidentitäten gegen die eigenständigen Läufe derselben Arten: Eine Kampagne mit einer Phase reproduziert die eigenständige Ausgabe Bit für Bit, der übernommene Versatz entspricht dem letzten Abtastwert des vorigen Laufs, und die durch end_at beendete Phase hat genau die Erkennungszeit des Laufs als Länge. Der additive Übertrag über eine Phasengrenze und das Halteglied nullter Ordnung sind Modellierungsentscheidungen, und jede Phase ist so gut wie die Art, die sie ausgeführt hat; keine verkettete Mission wurde gegen eine gemessene geprüft

# text
seg-ad6105af464c = Parameterdurchläufe und Monte-Carlo-Ensembles mit festem Startwert über jede Szenarioart

# text
# c1: campaign
seg-95921611839e = Die Abschnitte sweep (ein bis drei Punktschlüssel einer beliebigen Art, auf den Achsenwerten des generischen Durchlaufs, wahlweise mit einem Ensemble an jedem Knoten) und monte_carlo der Art <c1/>: Realisierung k läuft bei base_seed + k; jede Metrik berichtet Mittelwert, Standardabweichung, Perzentile 5/50/95 nach dem Nearest-Rank-Verfahren und ein Perzentil-Bootstrap-Konfidenzintervall von { "95" }% für den Mittelwert mit festem Startwert (inertial::metric_stat); Metrikeinheiten aus dem eigenen units-Block der durchlaufenen Art gelesen

# text
seg-03d15c27b3b9 = Die geschlossene Form des Zufallsmarsches der Phase bei weißem Frequenzrauschen, Varianz q_wf tau (NIST Technical Note { "1337" }), für die statistische Maschinerie und Byte-Gleichheit mit den eigenständigen Läufen für die Initialisierung. Es prüft die Ensemble-Arithmetik am eigenen Uhrenmodell der Engine, nicht an einem externen Datensatz

# text
seg-24327a0ed82e = Mehrere Szenarien unter gemeinsamen Bedingungen, mit einer kombinierten Zusammenfassung

# text
# c1: campaign
seg-5833fb3b06e3 = Der Abschnitt compose der Art <c1/>: benannte gemeinsame Werte (zum Beispiel Leistung und Position eines Jammers), die in jedes Mitglied an den Schlüsseln geschrieben werden, an die sie gebunden sind, jedes Mitglied wird ausgeführt, und je Metrik der kleinste, der größte und der mittlere Wert über die Mitglieder, mit dem benannten Mitglied; die Metrikeinheiten müssen über die Mitglieder übereinstimmen

# text
seg-67ffd6684b1c = Kompositionsidentität gegen den eigenständigen Lauf. Die Arithmetik der gemeinsamen Bedingungen ist Buchführung; die Physik ist die der Mitgliedsarten, jede mit ihrer eigenen Zeile

# text
seg-0bc866720bde = Beschränkte Optimierung einer Metrik über Kampagnenparameter

# text
# c1: campaign
seg-f9bdb89c2b4f = Der Abschnitt optimize der Art <c1/> (CAP-32): ein bis drei Punktschlüssel von Szenarien, auf [lo, hi] beschränkt, auf linearer oder logarithmischer Skala, eine Metrik, die über einen Ergebnispfad gelesen wird, Ziel minimize, maximize oder target; Verfahren grid (die Achsenwerte des Durchlaufs) oder ein deterministisches Nelder-Mead-Simplex in normierten Koordinaten mit Boxprojektion und den Standardkoeffizienten; eine fehlende oder nicht endliche Metrik wird als schlechteste bewertet und bleibt in der Spur; bei runs > { "1" } ist die Metrik der Mittelwert über gemeinsame Startwerte; jede Auswertung ist ein realer Lauf der benannten Art, in trace aufgeführt und im Reproduzierbarkeits-Digest mitgezählt

# text
seg-e3a2f80b04dc = Nur intern: die exakte geschlossene Form -20 log10(range) der Streckengleichung, ein unabhängiges Brute-Force-Raster über dieselbe Art und die Rosenbrock-Funktion. Der 1-D-Zielwert von Runde { "1" } ist NOT MET (die vorregistrierte Box schloss die Lösung bei { "3" } dB aus; der Optimierer stoppte an der Schranke), festgehalten in docs/design/evidence/cap32-optimize/RESULTS.md und nicht neu bewertet. Das Optimum ist lokal zur Box und zum Start; keine Aussage über ein globales Optimum

# text
seg-b9b1637d326c = Bandbegrenzte geschlossene Formen für jedes Entfernungsmesssignal: Leistung im Band und Early-Late-Code-Tracking-Jitter gegen veröffentlichte Werte, mit gegengeprüfter Gabor-Bandbreite und gegengeprüfter spektraler Trennung bei Versatz

# text
# c1: leo-signal
seg-6cfdc433b120 = navsignal: das Sinusintegral (sine_integral), der BPSK-R-Anteil der Leistung innerhalb eines zweiseitigen Bandes in geschlossener Form (bpsk_power_in_band_closed_form), die bandbegrenzte BPSK-Gabor-Bandbreite in geschlossener Form (bpsk_gabor_bandwidth_closed_form_hz), der bandbegrenzte kohärente und nichtkohärente Jitter der Early-Late-Delay-Lock-Loop für jedes Spektrum mit Einheitsfläche nach Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) und seine Gabor-Schranke bei verschwindendem Abstand (dll_jitter_small_spacing_limit_s), der spektrale Trennungskoeffizient von BPSK bei Versatz in geschlossener Form (bpsk_offset_ssc_closed_form), das Spektrum von Galileo E5 AltBOC({ "15,10" }) (altboc_15_10_psd) und ein Parser für Modulationsbezeichnungen (parse_modulation); von der Art <c1/> für jedes Signaldesign verwendet

# text
seg-15d8c44be46f = Extern festgelegt: { "90.3" } Prozent Hauptkeulenleistung, der kohärente Early-Late-Jitter am angegebenen Arbeitspunkt, die Tabellenwerte des Sinusintegrals und der spektrale Selbsttrennungskoeffizient 2/({ "3" } R_c) von BPSK bei Versatz null. Nur interne Gegenprüfungen, keine externe Validierung: die geschlossene Form der bandbegrenzten BPSK-Gabor-Bandbreite und ihre Asymptote sowie der spektrale Trennungskoeffizient von BPSK bei Versatz ungleich null, beide hier abgeleitet und gegen Quadratur geprüft. Veröffentlichte geschlossene Formen: das Sinc-Quadrat-Spektrum von BPSK-R und seine { "90" } Prozent Hauptkeulenleistung (Kaplan & Hegarty, Understanding GPS/GNSS, 3. Aufl.); der kohärente Early-Late-Code-Tracking-Jitter sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, Abschnitt { "8" }) und die bandbegrenzte Verallgemeinerung mit ihrer Gabor-Bandbreitengrenze (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); die Sinusintegral-Tabellen von Abramowitz & Stegun (Tabelle { "5.1" }); der spektrale Trennungskoeffizient als Fourier-Transformierte der quadrierten Autokorrelation (Betz { "2001" }). Das AltBOC-Spektrum wird nur auf Einheitsfläche und Keulenlage geprüft (der Ausdruck aus dem Galileo Open Service Signal-in-Space Interface Control Document integriert zu { "8" } und wird dadurch geteilt).

# text
seg-def449efa852 = Maximaler Doppler eines Navigationssatelliten in niedriger Erdumlaufbahn, der die Akquisitionssuche bemisst

# text
# c1: leo-signal
seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: der größte Satelliten-Doppler bei einem Überflug direkt darüber bei der Elevationsmaske für eine Kreisbahn, v R_E cos(el) / (R_E + h) mal f / c, aus Träger und Bahnhöhe jeder Voreinstellung; die Art <c1/> fügt Oszillator- und Nutzerterme hinzu und macht daraus Doppler-Bins

# text
seg-c26e0c7c6821 = Veröffentlichte Zahlen: Xona Pulsar X1 maximaler Doppler { "32" } bis { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, https://arxiv.org/abs/2509.19551); Iridium-Doppler bis zu +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Die Erdrotation bleibt unberücksichtigt, was die Zahl um bis zu etwa { "2.3" } kHz verschiebt; beide veröffentlichten Zahlen werden auch ohne sie erreicht.

# text
seg-652e28dfa10f = Signaldesigns für Positionierung, Navigation und Zeitgebung in niedriger Erdumlaufbahn: Code-Tracking, Akquisition, GNSS-Kompatibilität und ein Bandvergleich für jedes System

# text
# c1: leo-signal
seg-c0ba5c7e708e = Die Art <c1/>: parametrisierte Signaldesigns (Band, Sendebandbreite, ITU-Zuweisung; Akquisitions-, Daten- und Pilotkomponenten mit BPSK(n)-, BOC(m,n)-, MBOC- oder flachen Spektren, Leistungsanteilen, FDMA-Unterträgern, Codelängen und Datenraten) aus einkompilierten öffentlichen Voreinstellungsdateien (Xona Pulsar, Iridium STL, Starlink-Gelegenheitssignal, CentiSpace, ein generisches C-Band-Design und generische Designs für UHF/L/S/C/Breit-C, jeweils mit ihrer Quell-URL und unveröffentlichten Werten, die als REPRESENTATIVE gekennzeichnet sind) oder inline geschrieben; je Signal die bandbegrenzte Leistungsdichte, Leistungsanteile im Band, Gabor-Bandbreite, Code-Jitter gegen C/N0 und Abstand sowie die Entfernungsmessgenauigkeit, der Akquisitions-Suchraum, die Detektionswahrscheinlichkeit mit Quadratgesetz und die mittlere serielle und codeparallele Akquisitionszeit, der spektrale Trennungskoeffizient in und aus GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b und AltBOC mit der C/N0-Degradation sowie die Toleranz gegen CW-, Breitband- und angepasstes J/S aus der SSC-Kette der Art spectrum; ein Bandvergleich von ionosphärischer Verzögerung, Freiraumverlust, Entfernungsmessgenauigkeit bei gleichem C/N0 und gleicher EIRP und Jammer-Toleranz; und qualitative Formprüfungen eines Designs gegen eine beschriebene Messung

# text
seg-040b3f5cc70e = Die validierten geschlossenen Formen der beiden Zeilen oben, die Identität der Fehlalarmwahrscheinlichkeit beim Quadratgesetz P_d(snr = { "0" }) = P_fa und die mittlere Akquisitionszeit nach Holmes sowie die Reduktion auf die eigene SSC-Kette der Art spectrum (derselbe Code Jammer::ssc). Die Designs selbst sind Eingaben: Voreinstellungen, die als REPRESENTATIVE oder WORKSHOP gekennzeichnet sind, sind keine veröffentlichten Spezifikationen, die Spektren von Enhanced-Feher-QPSK, Code Shift Keying und OFDM sind angenähert, und die Formprüfungen vergleichen Formen, keine kalibrierten Pegel.

# text
seg-c2b9c8e4a364 = Mehrband-Spektrum-Wasserfall (UHF, L, S, C) mit entworfenen Signalen und Jammern je Band

# text
# c1: spectrum
seg-609df4e0a085 = Die Art <c1/>, über das L-Band hinaus erweitert: Bänder, angegeben als voreingestelltes Signaldesign (mit jeder Komponente gezeichnet, auf die Sendebandbreite bandbegrenzt, C/N0 und J/S auf die verfolgte Komponente bezogen) oder als benutzerdefinierter Träger und Modulation; zusätzliche Wasserfall-Felder über einen beliebigen Frequenzbereich auf derselben Zeitleiste und Farbskala; ein Breitband-Jammer (Barrage) neben CW, Schmalband, Chirp und angepasstem Rauschen; J/S je Band und effektives C/N0 aus der unveränderten Kette der spektralen Trennungskoeffizienten

# text
seg-a3b398f66ad3 = Reduktion auf die bestehende Spektrumkette und die Anti-Jam-Gleichung der Art jamming (ein Band mit einer Komponente ergibt dieselben Zahlen wie vor der Erweiterung) und die Signalspektren der validierten Zeilen. Die Jammer-Leistungen, der Zeitverlauf, die Bandbreiten des Frontends und die entworfenen Signale sind Eingaben, und ein entworfenes Signal wird an seinem Sendeband abgeschnitten (keine Emission außerhalb des Bandes).

# text
seg-f92d6cbc58d4 = Koeffizienten der spezifischen Regendämpfung für jedes Band, das eine LEO-PNT-Strecke verwendet

# text
# c1: leo-pass
seg-96b6a118d374 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 Gleichungen ({ "1" }) bis ({ "5" }): k_H, alpha_H, k_V, alpha_V aus den Kurvenanpassungen der Tabellen { "1" } bis { "4" }, die pfad- und polarisationsabhängigen (k, alpha) und die spezifische Dämpfung k R^alpha; vom Regenterm der Art <c1/> verwendet

# text
seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) Tabelle { "5" }, die von der Empfehlung selbst tabellierten k_H, alpha_H, k_V, alpha_V, eingecheckt in tests/fixtures/leo_link/p838_3_table5.csv mit der PDF-URL und dem Abrufdatum. Die Tabelle ist auf ihre gedruckten Stellen gerundet, sodass der Zielwert diese Rundung ist

# text
seg-f4a311f936de = Langzeit-Regendämpfung auf dem Schrägpfad einer Erde-Weltraum-Strecke

# text
# c1: leo-pass
seg-2b2dba8bf5a7 = ITU-R P.618-14 Abschnitt { "2.2.1.1" } Schritte { "2" } bis { "10" } (Schräg- und Horizontalpfad unterhalb der Regenhöhe, Faktoren für Horizontalreduktion und Vertikalanpassung, A0.01 und seine Skalierung auf { "0.001" } % bis { "5" } % eines mittleren Jahres), mit der Regenhöhe (P.839) und R0.01 (P.837) als Eingaben, weil die Engine keine der beiden digitalen Karten enthält; je Band und Epoche von der Art <c1/> angewendet

# text
seg-325d1bb9c26d = Validierungsbeispiele der ITU-R Study Group { "3" } in der Datei CG-3M3J-13-ValEx-Rev8.3.0 für P.618-14, wie auf den Validierungsseiten von ITU-Rpy tabelliert, mit der P.839-4-Regenhöhe jedes Standorts aus denselben Beispielen; eingecheckt in tests/fixtures/leo_link/p618_14_rain_attenuation.csv mit den URLs und dem Abrufdatum. Validiert das Verfahren bei gegebenem h_R und R0.01, nicht die Karten

# text
seg-6b51ec84bdce = Troposphärische Amplitudenszintillation auf einer Erde-Weltraum-Strecke

# text
# c1: leo-pass
seg-869894dec004 = ITU-R P.618-14 Abschnitt { "2.4.1" } Schritte { "3" } bis { "9" } (Referenz-Sigma aus N_wet, effektive Pfadlänge, Antennenmittelungsfaktor, Schwundtiefe für { "0.01" } % bis { "50" } % der Zeit), mit N_wet als Eingabe oder aus Temperatur, Feuchte und Druck durch die Ausdrücke von ITU-R P.453-14 berechnet; unterhalb von { "4" } GHz kennzeichnet die Art <c1/> den Wert als Extrapolation

# text
seg-7fc4a1e7960a = Validierungsbeispiele der ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) für die Szintillation nach P.618-14, mit dem N_wet nach P.453-14 jedes Standorts aus denselben Beispielen; eingecheckt in tests/fixtures/leo_link/p618_14_scintillation.csv mit den URLs und dem Abrufdatum. Der Ausdruck für die feuchte Refraktivität aus Temperatur und Feuchte ist von dieser Zeile nicht abgedeckt

# text
seg-e0d40cf4ea79 = Gebäudeeindringverlust für einen Nutzer von LEO-PNT in Innenräumen

# text
# c1: leo-pass
seg-4f06274e38ec = ITU-R P.2109-2 Anhang { "1" } Gleichungen ({ "1" }) bis ({ "10" }) mit Tabelle { "1" }: der Verlust, der mit der Wahrscheinlichkeit P nicht überschritten wird, für herkömmliche und thermisch effiziente Gebäude bei der Elevation des Pfades an der Fassade, { "80" } MHz bis { "100" } GHz; je Band und Epoche von der Art <c1/> auf einen Nutzer in Innenräumen angewendet (der UHF-Fall in Innenräumen)

# text
seg-99c648f9c6eb = Die Werte der Arbeitsmappe der ITU-R Study Group { "3" } zur Validierung von Clutter und BEL, wie im Validierungsskript der MATLAB-Referenzimplementierung abgeschrieben (github.com/eeveetza/p2109), eingecheckt in tests/fixtures/leo_link/p2109_bel.csv mit der URL und dem Abrufdatum. Die Arbeitsmappe druckt drei Dezimalstellen

# text
seg-8c5e291c8ff8 = Ionosphärische Verzögerung erster Ordnung je Band, die ionosphärenfreie Kombination und der Freiraumverlust

# text
seg-89df726127f9 = Gruppenlaufzeit { "40.3" } STEC/f^{ "2" } je Band; die ionosphärenfreien Koeffizienten f1^2/(f1^{ "2" } - f2^{ "2" }) und -f2^2/(f1^{ "2" } - f2^{ "2" }) und die Rauschverstärkung sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) für jedes Bandpaar; der Freiraumverlust { "20" } log10({ "4" } pi R f/c) von linkbudget::free_space_loss_db in seiner Kilometer-Megahertz-Form

# text
seg-9bf00f744174 = IS-GPS-200 Abschnitt { "20.3.3.3.3.2" }, der das Gruppenlaufzeitverhältnis L1/L2 gamma = (77/60)^{ "2" } angibt, das aus der Skalierung 1/f^{ "2" } erster Ordnung folgt, und die Friis-Übertragungsformel (Proc. IRE, { "1946" }). Validiert die Skalierungsgesetze, kein Schräg-TEC

# text
seg-c584a867fcda = Maximaler Doppler, den ein ruhender Nutzer von einer LEO- oder MEO-Bahn aus sieht

# text
# c1: leo-pass
seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: eine Suche über jede Bahnposition und jeden Nutzer am Horizont des Satelliten auf einer Kreisbahn, bei sich drehender Erde, nach der größten Entfernungsänderungsrate, plus die Bahngeschwindigkeit und die größte erdfeste Satellitengeschwindigkeit; je Band als Doppler-Hüllkurve von der Art <c1/> berichtet und als Kaltstart-Suchfenster ihres energiearmen Modells verwendet

# text
seg-4abd3afebad2 = Leclere, Marathe und Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabelle { "1" } (ruhender Empfänger auf einer Kugel von { "6371" } km, die Erdrotation der einzige weitere Effekt): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz auf L1. Deckt kreisförmige Zweikörperbahnen ab

# text
seg-d9eb3e7e69c2 = Ein LEO-PNT-Überflug und sein Streckenbudget je Band gegen die sichtbaren MEO-GNSS-Satelliten

# text
# c1: leo-pass
seg-d986e44443dd = Die Art <c1/>: Satelliten aus einem entworfenen Überflug, aus Elementen, einem TLE über SGP4 oder einer Walker-Konstellation aus constellation-design; je Band und Epoche die Blickwinkel, die Entfernung, die Entfernungsänderungsrate und die Entfernungsbeschleunigung in geschlossener Form (bei jedem Lauf gegen zentrale Differenzen geprüft und berichtet), Freiraumverlust, EIRP mit isoflux-, gaußschem oder flachem Muster, eine Patch-, halbkugelförmige oder isotrope Nutzerantenne, gasförmige Dämpfung nach ITU-R P.676-10 Anhang { "2" }, Regen und Szintillation nach P.618, Gebäudeeindringverlust nach P.2109, Polarisationsfehlanpassung, Systemrauschtemperatur, C/N0, Doppler und Doppler-Rate sowie die Verzögerung erster Ordnung aus einem Klobuchar- oder Vertikal-TEC-Schräg-TEC, skaliert mit dem Chapman-Anteil unterhalb des Satelliten; ionosphärenfreie Paare mit Code-Rauschen am Überflugmaximum; Galileo- oder GPS-Träger aus den Empfangsleistungen ihrer Schnittstellendokumente durch denselben Empfänger

# text
seg-c558a6519038 = Geschlossene Formen und Selbstkonsistenz: die Identitäten von Entfernungsänderungsrate und Entfernungsbeschleunigung gegen numerische Ableitungen, der Isoflux-Gewinn, der das Entfernungswachstum aufhebt, die Lehrbuchgrenzen des Polarisationsverlusts, die qualitative Beobachtung LEO gegenüber GNSS (ein glockenförmiger Überflug von Minuten, der mehrere dB über den flachen GNSS-Trägern mit 44-51 dB-Hz gipfelt). Die EIRPs und Muster sind veröffentlichte Empfangsleistungen, in eine EIRP umgerechnet, oder repräsentative Entscheidungen, der Gasterm ist die überholte vereinfachte Methode nach P.676-10, und nichts wird mit einem gemessenen LEO-C/N0 verglichen

# text
seg-95a077a980b6 = Benannte LEO-PNT-Systemvoreinstellungen mit angegebenen Quellen und eine systemunabhängige Engine

# text
seg-4b47033cda24 = leo_link::presets: generisches Mehrband (UHF, L, S, C), generisches C-Band, Xona Pulsar X1/X5, Iridium STL, Starlink als reines Doppler-Gelegenheitssignal, CentiSpace und eine optionale Voreinstellung Celeste IOD, jeweils mit ihrer Quelle, gekennzeichnet als PUBLIC (mit URL), REPRESENTATIVE oder WORKSHOP, wobei die Workshop-Voreinstellung in der optionalen Voreinstellungsdatei Celeste IOD liegt, die nur einkompiliert wird, wenn diese Datei existiert; jedes Band und jede Bahn in einem Szenario überschreibbar, und ein Szenario muss keine Voreinstellung nennen

# text
seg-399dc53ceafb = Abschrift der zitierten öffentlichen Zahlen und eine Konsistenzprüfung: Eine EIRP, die aus einer veröffentlichten minimalen Empfangsleistung gesetzt wird, sagt das veröffentlichte Maximum innerhalb von { "0.5" } dB mit einem flachen Muster voraus. Das ist eine Prüfung der Entfernungsstreuung, keine Validierung der Antenne irgendeines Satelliten; repräsentative Voreinstellungen erheben keinen Anspruch auf ein reales System

# text
seg-a39f34973373 = Energiearme Positionierung: Zeit bis zur ersten Lösung und Energie je Lösung gegen Tastverhältnis

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy und der Abschnitt [iot] der Art <c1/>: kohärente Integration, durch die Doppler-Rate begrenzt, nichtkohärente Summen mit Quadratgesetz bis zu einer Detektionsschwelle, eine Doppler-Bin-Suche über die Hüllkurve der Bahn für ruhende Nutzer (kalt) oder ein gestütztes Fenster (heiß), parallele oder serielle Codesuche, Zeit der Navigationsnachricht bei einem Kaltstart, Energie je Lösung und Batterielebensdauer über Lösungsintervalle, für jedes LEO-Band und das GNSS-Signal

# text
seg-a5fa1ef1be9b = Interne Konsistenz eines angegebenen Designmodells: Jede Leistung, Schwelle und Suchentscheidung ist eine Eingabe, und das Modell ignoriert Bitflanken-Mehrdeutigkeit, verpasste Detektion und erneute Akquisition. Nicht mit einem gemessenen Empfänger verglichen

# text
seg-7e94f8b38cff = Global gemittelte Gewichte des Signal-in-Space-Entfernungsfehlers für jede Bahnhöhe

# text
seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: das radiale Gewicht w_R und das quadrierte transversale Gewicht w_AC^{ "2" } als Mittel von cos^{ "2" } und halbem sin^{ "2" } des Nadirwinkels der Sichtlinie über Nutzer, die gleichmäßig auf der sichtbaren Erdkappe oberhalb einer Elevationsmaske verteilt sind, für jeden Bahnradius, durch Simpson-Integration; von jeder SISRE-Zahl von leo-navmsg verwendet (bei { "510" } km w_R { "0.46" } und w_AC^{ "2" } 1/2.5)

# text
seg-b9b5fe9d3b25 = Die veröffentlichte SISRE-Gewichtungsfaktor-Tabelle von Montenbruck, Steigenberger und Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } und 1/49, GLONASS { "0.98" } und 1/45, Galileo { "0.98" } und 1/61, BeiDou MEO { "0.98" } und 1/54, BeiDou IGSO/GEO { "0.99" } und 1/126. Dasselbe Mittel, bei LEO-Radien ausgewertet, ergibt die LEO-Gewichte; keine veröffentlichte LEO-Tabelle ist festgelegt, daher sind die LEO-Werte die angewendete validierte Methode, nicht gesondert validiert

# text
seg-3cbb8b6afe3c = Nutzeralgorithmus der Galileo-ICD für Broadcast-Ephemeriden als Grundlage einer LEO-Navigationsnachricht

# text
seg-88efbce1f836 = leo_navmsg::elements::kepler_point: die keplersche Auswertung nach dem Galileo OS SIS ICD (keplersche Gleichung, Korrekturen zweiter Harmonischer, erdfester Knoten), getrennt vom RINEX-Auswerter der Engine geschrieben, die die Position zusammen mit Breitenargument, Neigung und Knoten liefert, aus denen das Korrekturbezugssystem Along/Cross/Radial aufgebaut wird, und die Erweiterungsterme von Liu et al. { "2025" }

# text
seg-6a90728fcea9 = ECEF-Positionen von RTKLIB 2.4.2-p13 eph2pos (eine unabhängige Implementierung desselben ICD-Algorithmus) für reale BKG/IGS-Broadcast-Datensätze vom 2024-09-10, beide eingecheckt mit Herkunft in tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Dies validiert den keplerschen Nutzeralgorithmus; die zusätzlich aufgesetzten Korrekturen Along/Cross/Radial sind von ihren eigenen Zeilen abgedeckt und die Liu-Terme von der Zeile zu den 22 Parametern nach Liu et al. { "2025" }

# text
seg-d65102fd4a1d = CRC-24Q-Rahmenprüfung für die LEO-Navigationsnachricht

# text
seg-aed568016867 = leo_navmsg::codec::crc24q: Generatorpolynom 0x1864CFB, Anfangswert { "0" }, keine Reflexion, kein abschließendes XOR, die Prüfung, die der LEO-Rahmen von Kshana über jedes vorangehende Byte trägt

# text
seg-18c79d18e4e4 = Der Prüfwert des CRC-Katalogs für diese Parameter (CRC-Katalog reveng.sourceforge.io, CRC-24/LTE-A: Breite { "24" }, Poly 0x864CFB, Init { "0" }, Prüfwert 0xCDE703), die die CRC-24Q-Parameter von RTCM { "10403" } und des Galileo OS SIS ICD sind, und der in RTCM { "10403" } gedruckte Beispielrahmen der Nachricht vom Typ { "1005" }

# text
seg-82b9b0f7b07c = Anpassung von LEO-Broadcast-Ephemeriden und Signal-in-Space-Entfernungsfehler gegen Anpassungsintervall und Aktualisierungsperiode

# text
# c1: leo-navmsg
seg-8c7065aa22bd = Anpassung und Vergleich der Art <c1/>: eine Wahrheitsbahn, mit zonaler J2-J6- oder EGM2008-Gravitation bis zum gewählten Grad und mit Luftwiderstand integriert, und eine freie oder gesteuerte Uhr mit festem Startwert; eine Levenberg-Marquardt-Anpassung des keplerschen Satzes von Galileo auf nichtsingulären Elementen mit schwachen Priors, dann Korrekturpolynome Along-Track, Cross-Track und radial durch lineare kleinste Quadrate; das Uhrenpolynom, angepasst abzüglich des relativistischen Terms des Nutzers; SISRE (nur Bahn und mit Uhr) über Nutzungsperioden, zentriert in ihren Anpassungsfenstern, gegen Anpassungsintervall und Aktualisierungsperiode. Validierter Teil: die keplersche Anpassung mit 16 Parametern und ihr SISRE nur der Bahn gegen das Anpassungsintervall auf realen präzisen Bahnen sowie die integrierte Wahrheitsbahn mit J2-J6/EGM2008({ "20" }, { "70" })/Luftwiderstand gegen Orekit { "12.2" } innerhalb von { "4.6" } mm über { "6" } h (Zielwert { "2" } cm, dieselbe Dichteeingabe); die Korrekturpolynome, die Uhrenanpassung (freie oder gesteuerte Uhr mit festem Startwert) und der Vergleich der Aktualisierungsperioden bleiben modelliert

# text
seg-7dfbc8297444 = Reale präzise wissenschaftliche Bahnen als Wahrheit (operative reduziert-dynamische Bahnen von TU Graz IfG/ITSG, frei für jede Nutzung mit Namensnennung; SHA-256-Werte in der NOTICE des Fixtures), angepasst mit dem Parametersatz mit 16 Parametern über Bögen von { "20" } und { "30" } min, gegen die Statistiken, die Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) für dieselben Satelliten und Tage veröffentlichen: RMS Along, Cross und Radial jeweils innerhalb von 1.5x (gemessen { "0.804" } bis { "1.087" }), SISRE innerhalb von 1.5x (gemessen { "0.716" } bis { "0.809" }) und SISRE-Gewichte innerhalb von { "0.005" } seiner Tabelle { "2" } (gemessen { "0.0007" }); Toleranzen vor dem Vergleich festgelegt. Die Schranke je Komponente gibt dem Test seine Zähne: Wird die Neigungsrate auf null gesetzt, bleibt jedes SISRE-Verhältnis innerhalb von 1.5x, aber die Cross-Track-Schranke scheitert. Das einheitliche SISRE-Verhältnis von { "0.72" } bis { "0.81" } stammt aus dem Artikel: Seine gedruckten SISRE-Werte verwenden die Gewichte der Tabelle { "2" } unquadriert statt seiner eigenen Gl. { "9" }, der Kshana folgt (Montenbruck et al. { "2018" }). Die integrierte Wahrheitsbahn (zonales J2-J6, EGM2008 bis Grad { "20" } und { "70" }, Luftwiderstand) stimmt mit Orekit { "12.2" } (CS GROUP, Apache-2.0) und Hipparchus { "3.1" } überein, vom selben Anfangszustand in denselben Bezugssystemen mit derselben Dichteeingabe propagiert, innerhalb von { "4.55" } mm über { "6" } h (Zielwert { "0.02" } m vor dem Lauf festgelegt, Vorregistrierung 65e4d46c). Außerhalb der Aussage: die Korrekturpolynome, die Uhrenanpassung und der Vergleich der Aktualisierungsperioden, die interne Prüfungen behalten (eine Zweikörper-Wahrheit, die der Parametersatz mit 16 Parametern auf unter { "1" } mm zurückgewinnt, und eine interne numpy-Gegenprüfung der exportierten Nachrichten auf GRACE-FO mit seiner Uhr CLK1B, die von diesem Projekt geschrieben und ausgeführt wurde und keine unabhängige Referenz ist)

# text
seg-8121e7db3db3 = Aktualisierung der LEO-Navigationsnachricht mitten im Überflug mit einer Kontinuitätsprüfung beim Wechsel

# text
# c1: leo-navmsg
seg-34c310d85c42 = Die Analyse midpass-update der Art <c1/>: der höchste Überflug über einen Nutzer innerhalb einer Suchspanne, Nachrichten nach einem globalen Zeitplan mit Nutzungsperioden, zentriert in ihren Anpassungsfenstern, und bei jedem Wechsel der 3D-Positionssprung, der Uhrensprung, der Pseudoentfernungssprung des Nutzers, der größte Sprung über jede sichtbare Sichtlinie (geschlossene Form über den Nadirkegel), der Entfernungsfehler davor und danach und PASS/FAIL gegen eine Schwelle

# text
seg-418f2cd21141 = Interne Konsistenz (die Sprungidentität und die Kegelschranke gegen Brute-Force-Abtastung). Die Schwelle ist eine Eingabe; keine veröffentlichte Kontinuitätsanforderung für LEO ist festgelegt

# text
seg-7635a8339e78 = Dokumentierte Binärkodierung der LEO-Navigationsnachricht mit einem Quantisierungsfehlerbudget

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: der eigene Rahmen von Kshana (Präambel, Version, Modell, Länge, Nutzlast, CRC-24Q) für die vier Ephemeridenmodelle, das Uhrenpolynom, SVID, Ausgabestand der Daten, Band, Gesundheitsstatus, einen Klobuchar-Satz, NeQuick-G-Koeffizienten und UTC-Parameter, jedes Feld mit angegebener Breite und Schrittweite (field_table), Quantisierung mit Ablehnung außerhalb des Bereichs und ein Budget der größten Positions- und Uhrenänderung, die eine Änderung um einen halben Schritt jedes Feldes über das Gültigkeitsfenster bewirkt

# text
seg-4261a9fac5d9 = Identitäten bei Hin- und Rückumwandlung und das Budget selbst. Das Format ist das eigene von Kshana, modelliert nach den veröffentlichten Nachrichtenkomponenten und dem Feldsatz der Galileo-ICD; es ist nicht das Bitlayout von Celeste oder eines anderen Systems (keines ist öffentlich), sodass es kein externes Layout gibt, gegen das sich validieren ließe

# text
seg-17ca41d7fd71 = Exporte von LEO-Navigationsnachrichten im Stil von RINEX 4 und als CSV

# text
seg-185e12ccef0d = leo_navmsg::text: ein Block im Stil von RINEX 4 (Kopfzeile des Datensatzes > EPH, Zeile für Satellit und Epoche mit drei Uhrentermen, Broadcast-Bahnzeilen im Format D19.12) mit dem Systembuchstaben L und den Datensatztypen KP16, KRAC, LU22 und APOL, in jedem Kopf als Erweiterung von Kshana gekennzeichnet, die nicht Teil von RINEX { "4.02" } ist, und eine CSV-Tabelle mit einem Standardspaltenschema und Voreinstellungsschemata, jeweils mit einem Importer

# text
seg-5cc5b6382437 = Hin- und Rückumwandlungen und die Kalenderarithmetik. RINEX { "4.02" } definiert keine LEO-Navigationsdatensätze (IGS RINEX { "4.02" }), daher ist das Layout eine dokumentierte Erweiterung, wobei arXiv { "2401.17767" } als Stand der Technik zitiert wird; es existiert kein externer Leser dafür, gegen den sich prüfen ließe

# text
seg-ff15935ba1b3 = LEO-Ephemeridenmodell mit 22 Parametern nach Liu et al. { "2025" } und seine Anpassung auf realen präzisen Bahnen

# text
seg-6af1b6f3bbd4 = die Variante Liu22 von leo_navmsg::elements::EphemerisModel, von kepler_point mit Liu22Extra ausgewertet: der Parametersatz mit 16 Parametern plus eine Rate der großen Halbachse a_dot und eine Rate der mittleren Bewegung n_dot, die als n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk eingeht, aus Gl. { "1" } des Artikels abgeschrieben (der Anpassungsvergleich hängt nicht von dieser Skalenkonvention ab, daher ist die Bedeutung eines übertragenen Wertes nDot hier nicht validiert), sowie einmal und dreimal pro Umlauf auftretende Radiusharmonische Crs1, Crc1, Crs3, Crc3 auf dem unkorrigierten Breitenargument. Seine Anpassung durch leo_navmsg::fit::fit_message übernimmt Start und Schätzer aus Abschnitt { "2.3" } des Artikels (jede Korrektur beginnt bei null; einfache kleinste Quadrate ohne Priors; die Obergrenze von 100 Iterationen des Artikels), hält aber nach der Parameterkonvergenzregel von Kshana an (jeder Schritt unter { "1e-3" } seines formalen Sigma) statt nach der Regel des Artikels einer RMS-Änderung unter { "0.1" } mm. Angepasst über Bögen von { "20" } und { "30" } Minuten einer tabellierten präzisen Bahn

# text
seg-90768b99ab5f = Gemessen: operative reduziert-dynamische Bahnen von TU Graz IfG/ITSG (frei für jede Nutzung mit Namensnennung; SHA-256-Werte in der NOTICE des Fixtures) von GRACE-A, GRACE-C, Sentinel-2A und Sentinel-6A sind die Wahrheit, angepasst über Bögen von { "20" } und { "30" } min und verglichen mit den Zeilen mit 22 Parametern (a_dot, n_dot, Crs3, Crc3, Crs1, Crc1) der Tabellen { "4" }, { "5" }, { "6" } und { "8" } von Liu, Su, Xie, Zhou und Qu ({ "2025" }), Remote Sensing { "17" }({ "16" }):{ "2894" }, doi 10.3390/rs17162894 (CC BY { "4.0" }; Zahlen zitiert, nicht eingebunden). Zielwerte vor dem ersten Vergleich festgelegt: RMS Along, Cross und Radial jeweils innerhalb von 1.5x zweiseitig und SISRE innerhalb von 1.5x, für jeden Satelliten und beide Bogenlängen. Der erneute Lauf in Runde 2 wurde vor der Änderung der Engine und vor dem Abruf der zurückgehaltenen Bahnen vorregistriert (aa559785): die Anpassung nach Gl. { "1" } und Abschnitt { "2.3" } des Artikels, plus zwei neue zurückgehaltene Tage je Satellit gegen dieselben gedruckten Werte. Gemessen: jedes Verhältnis der Artikeltage { "0.755" } bis { "1.138" } und jedes Verhältnis der zurückgehaltenen Tage { "0.683" } bis { "1.186" }. Offengelegt: Die Along-Track-Verhältnisse des ersten Laufs bei { "20" } min von { "1.71" } (Sentinel-2A) und { "1.86" } (Sentinel-6A) waren vor dem erneuten Lauf bekannt. Die niedrigsten SISRE-Verhältnisse der zurückgehaltenen Tage liegen nahe der unteren Schranke von { "0.667" }, weil die gedruckten SISRE-Werte des Artikels die Gewichte der Tabelle { "2" } unquadriert verwenden (siehe die Zeile zur Anpassung mit 16 Parametern). Die Vorregistrierung gab die Abbruchregel des Artikels falsch an (der Artikel bricht bei einer RMS-Änderung unter { "0.1" } mm ab); die vorregistrierte Parameterkonvergenzregel wurde beibehalten. Mutation: Die Wiederherstellung von auf null zentrierten Priors ergibt für Sentinel-6A bei { "20" } min Along-Track { "1.08" } gegen { "0.70" } cm ({ "1.54" }), was scheitert. Prüfersonde: Die Konvention vor 0.30 (ein Faktor 1/2 auf n_dot) lässt jede Zahl unverändert, daher beschränkt der Vergleich den Funktionsraum des Modells mit 22 Parametern und die Qualität seiner Anpassung, nicht die Konvention für n_dot. Außerhalb der Aussage: das ATOMIC-ECEF-Polynom und die synthetische Modellvergleichstabelle mit fünf Höhen, die eine eigene Zeile MODELLED haben

# text
seg-e79047fc95af = ATOMIC-ECEF-Polynom ohne Uhr und der synthetische LEO-Modellvergleich mit fünf Höhen

# text
seg-e261843e35b1 = die Variante EcefPoly von leo_navmsg::elements::EphemerisModel: ein ECEF-Polynom je Achse ohne Uhrenterme, der relativistische Term aus -2 r.v/c^{ "2" }, bewertet gegen eine gesteuerte Uhr. Außerdem die Modellvergleichsanalyse (liu_comparison über LIU2025_TABLE), die das Modell mit 22 Parametern bei den fünf Höhen des Artikels über Bögen von 20 Minuten einer von Kshana integrierten Bahn anpasst und das Ergebnis neben dem veröffentlichten SISRE ausgibt

# text
seg-a3b92fdcc591 = ATOMIC-Modellfakten aus InsideGNSS (Polynom 6. Ordnung, etwa eine Minute Gültigkeit, { "30" } s Aktualisierung, Uhr gesteuert, { "24" } cm Uhrenfehler). Dies sind beschreibende Fakten ohne veröffentlichte Zahlen zum Vergleich. Die Tabelle mit fünf Höhen gibt das SISRE von Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } und { "0.75" } cm bei { "320" }, { "475" }, { "786" }, { "966" } und { "1336" } km über einen Bogen von 20 Minuten) neben der Anpassung von Kshana auf der eigenen integrierten Bahn aus ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } und { "0.51" } cm; Verhältnisse { "0.46" } bis { "0.77" }), nicht festgelegt, weil der Artikel reale präzise Bahnen angepasst hat und die Wahrheiten sich unterscheiden. Das Modell mit 22 Parametern und seine Anpassung selbst sind in der Zeile LEO-Ephemeridenmodell mit 22 Parametern nach Liu et al. { "2025" } und seine Anpassung auf realen präzisen Bahnen gegen reale Bahnen validiert. { "0.30" } Revision: Die Tabellenwerte verschoben sich mit der Anpassung nach der Konvention des Artikels (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-7a9fca5166d4 = Einfrequenz-Ionosphären- und UTC-Dienste einer LEO-Navigationsnachricht

# text
seg-bc73bfeca68e = leo_navmsg::services: die Klobuchar-Verzögerung der Nachricht bei jedem Träger (das L1-Modell der Engine, skaliert mit (f_L1/f)^{ "2" }), das effektive Ionisationsniveau von NeQuick-G Az = ai0 + ai1 mu + ai2 mu^{ "2" } mit den Regeln für alle Nullen und [{ "0" }, { "400" }] sfu sowie die Systemzeit zu UTC mit den drei Schaltsekundenfällen der ICD

# text
seg-84500ea94d49 = GNSSTk { "15.3.1" } (ARL:UT, LGPL-3.0, Commit 55ea3344, als separates Programm über einen Harness ausgeführt; kein GNSSTk-Code ist eingebunden): getIonoCorr von KlobucharIonoNavData bei L1, L2 und L5, getEffIonoLevel von NeQuickIonoNavData für Az mit den Regeln für alle Nullen und [{ "0" }, { "400" }] sfu und getOffset von GPSLNavTimeOffset für die UTC-Drift, innerhalb von { "1e-3" } m, { "1e-6" } sfu und { "1e-9" } s; und ERFA über pyerfa { "2.0.1.5" } (BSD-3), das UTC aus der IERS-Schaltsekundentabelle ableitet, für die drei Schaltsekundenfälle der ICD über die realen Schaltsekunden vom 2015-06-30 und 2016-12-31 einschließlich der Ablesung { "23" }:{ "59" }:{ "60" }, innerhalb von { "1e-9" } s (GNSSTk implementiert die Tageslängenregel des ICD-Falls (b) nicht, daher wurde es dort nicht verwendet, wie in der Vorregistrierung geschrieben). Eingaben sind die realen Kopfkoeffizienten des IGS-BRDC. Vorregistriert (6a66994b; Änderung 88807a7e committete eine Teilmenge des Schaltsekundenrasters mit { "21" } 602 Zeilen, bevor irgendein Wert von Kshana verglichen wurde). Die Integration der Elektronendichte von NeQuick ist nicht implementiert, und für einen LEO-Satelliten, der innerhalb der Ionosphäre fliegt, wird keine Korrektur vorgenommen

# text
seg-0af8030f4d21 = Doppler, den ein Bodenempfänger von einem LEO-Navigationssatelliten bewältigen muss

# text
# c1: leo-pvt
seg-9714103964d6 = Exakte Entfernungsänderungsrate eines Satelliten, dessen erdfeste Position und Geschwindigkeit aus einer Zweikörperbahn mit der säkularen J2-Drift und der Erdrotation stammen (leo_fusion::geom::EarthOrbit::state, die Geschwindigkeit die exakte Zeitableitung der Position), bei einem Träger in Doppler umgerechnet; der größte absolute Doppler, die größte Doppler-Rate und der größte Ruck über einer Elevationsmaske über ein Fenster (leo_fusion::doppler::doppler_envelope), je LEO-System von der Art <c1/> im Modus doppler berichtet

# text
seg-ebf6cee8ec4c = Veröffentlichte Zahlen, aus der angegebenen Bahn und dem Träger reproduziert: Iridium-Doppler bis zu plus oder minus { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) und Xona Pulsar X1 maximaler Doppler { "32" } bis { "34" } kHz (Leclère, Marathe und Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). Die Zahl für Iridium ist eine gerundete obere Schranke, daher der Zielwert von { "5" }%. Die Doppler-Rate und der Ruck werden berichtet, aber nicht validiert: Der modellierte Ruck des Überflugs direkt darüber bei Pulsar X1 beträgt etwa { "1.0" } Hz/s^{ "2" } gegen die veröffentlichten { "1.26" }

# text
seg-d2e18c8bdc14 = Positionierung aus LEO-Doppler, mit einem und mit mehreren Satelliten, mit Zuständen für Uhrendrift und Geschwindigkeit

# text
# c1: leo-pvt
seg-de6cb3c06490 = Batch-Gauß-Newton-Positionierung aus der Entfernungsänderungsrate mit analytischen Partialen (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), wahlweise mit konstanter Nutzergeschwindigkeit, einer Höhen-Pseudomessung für einen Nutzer an der Oberfläche und gedämpften Schritten; die formale Kovarianz an der Wahrheit; Projektionen Along-Track, Cross-Track und vertikal; die Genauigkeit eines einzelnen Überflugs gegen den Cross-Track-Versatz des Nutzers; der Zeitpunkt der größten Annäherung. Der Modus doppler der Art <c1/> fügt den Fehler gegen die Fensterlänge und einen Modus nur mit Doppler für Gelegenheitssignale hinzu (die Voreinstellung starlink-sop)

# text
seg-84e2eb636579 = Interne Konsistenz: rauschfreie Wiedergewinnung, die kinematische Identität rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho numerisch differenziert, Doppler null bei größter Annäherung, die Spiegellösung eines einzelnen Überflugs und Fehler mit festem Startwert gegen die formale Kovarianz. Die Starlink-Zahl von Kozhaya, Saroufim und Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: etwa { "2" } m in { "20" } s mit drei Satelliten) ist nur ein Vergleich: Der modellierte Empfänger mit einer perfekten Ephemeride und jedem Fehler in einem Doppler-Sigma von { "30" } Hz ist über dasselbe Fenster um ein Mehrfaches ungenauer, und der Empfänger und die Messrate des Artikels werden nicht reproduziert

# text
seg-7f462969d2d4 = Gemeinsame GNSS- und LEO-Pseudoentfernungs-Positionierung mit Intersystem-Biases und Fehlermodellen je Signal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Gauß-Newton-Lösungen mit gewichteten kleinsten Quadraten über jede Mischung von Systemen, eine Empfängeruhr je System (der Intersystem-Bias wird mit der Position geschätzt) oder ein bekannter Broadcast-Offset auf der Referenzzeitskala; Sigmas je Messung vom Aufrufer geliefert, standardmäßig das thermische Rauschen der Delay-Lock-Loop der Engine (navsignal::dll_code_jitter_chips) beim C/N0 der Elevation, kombiniert mit dem Signal-in-Space-Entfernungsfehler; ungewichtetes DOP (GDOP, PDOP, HDOP, VDOP, TDOP) im lokalen geodätischen System, formale Ost-Nord-Auf-Sigmas und die Bias-Sigmas; der gemeinsame Modus der Art <c1/> vergleicht Lösungen nur mit GNSS, nur mit LEO und fusionierte und durchläuft das DOP gegen die Zahl der hinzugefügten LEO-Satelliten

# text
seg-e83699418c0e = Ein von Hand abgeleitetes DOP mit vier Satelliten (ein Satellit im Zenit und drei am Horizont mit { "120" } deg Abstand, deren Normalmatrix sich von Hand invertieren lässt), die strukturelle Identität, dass ein System mit eigener Uhr und einem Satelliten keine Geometrie hinzufügt, rauschfreie Wiedergewinnung von Position, Uhr und Bias und Fehler mit festem Startwert gegen die Kovarianz. Nur interne Prüfungen; nicht mit der Ausgabe eines Empfängers verglichen. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): an einem IGS-Tag mit mehreren GNSS (ABMF 2018-05-13, GPS und Galileo C1C, Broadcast-Ephemeride, Klobuchar) stimmt der Intersystem-Bias mit RTKLIB v2.4.2-p13 rnx2rtkp überein (mittlere Differenz -0.11 ns nach der Korrektur der Broadcast-Gruppenlaufzeit in { "0.30" }, -0.35 ns davor; Zielwert { "1" } ns), aber nur { "93.6" } % von { "280" } Epochen ({ "93.2" } % vor der Korrektur) liegen innerhalb von { "3" } m der Koordinate nach ITRF2020 gegen die vorregistrierten { "95" } %. RTKLIB selbst erreicht auf denselben Daten { "88.2" } %, daher liegt der Zielwert jenseits der Einfrequenz-Positionierung mit Broadcast-Daten an dieser Station und an diesem Tag und ist keine Abweichung des Lösers; der Vergleichstest ist eingecheckt und ignoriert. { "0.30" } Runde { "2" }, strengere Eingaben beim unveränderten Zielwert von { "3" } m / { "95" } % / { "1" } ns, ein Befund (bleibt MODELLED): Mit dem ionosphärenfreien Paar Galileo E1/E5a (vorregistriert { "6927e039" }) liegen { "79.9" } % der Epochen innerhalb von { "3" } m (RTKLIB { "67.9" } %); mit präzisen CODE-MGEX-Bahnen, -Uhren, Satellitenantennen-Offsets und Codebiases (vorregistriert 7d8c3597) { "94.2" } % (RTKLIB { "94.1" } %), und der Intersystem-Bias weicht um -1.03 ns von RTKLIB ab, weil der Einzelmodus von RTKLIB Satellitenantennen-Offsets ignoriert (+{ "0.04" } ns, wenn beide sie auslassen)

# text
seg-ee9a4a0cb530 = Konvergenz der präzisen Punktbestimmung nur mit GNSS und mit LEO-Ergänzung

# text
# c1: leo-ppp
seg-a54f36c27d90 = Ein erweitertes Kalman-Filter für Float-PPP auf ionosphärenfreiem Code und ionosphärenfreier Phase: statische Koordinaten, eine weiße Empfängeruhr, ein Intersystem-Bias je zusätzlichem System, eine feuchte Zenitverzögerung als Zufallsmarsch, abgebildet durch 1/sin(Elevation), eine Float-Mehrdeutigkeit je Satellitenbogen, bei Aufgang hinzugefügt und bei Untergang fallengelassen, und der präzise Bahn- und Uhrenfehler, der Code und Phase eines Satelliten gemeinsam ist, verarbeitet als eine korrelierte Aktualisierung mit zwei Zeilen in einer Form nach Joseph; Messungen aus demselben Modell simuliert; Konvergenzzeit (Fehler unter den Schwellen bis zum Ende des Laufs), Fehlerkurven und die über den Lauf gemittelte Positions-NEES für nur GNSS und jeden LEO-Fall, ausgeführt als die Art <c1/>

# text
seg-be4593802ccf = Der NEES-Chi-Quadrat-Test ist eine interne Konsistenzprüfung (Wahrheit und Filter teilen das Modell). Der Trend wird mit Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2 verglichen: Multi-GNSS { "9.6" } min verkürzt auf { "7.0" }, { "3.2" }, { "2.1" } und { "1.3" } min mit { "60" }, { "96" }, { "192" } und { "288" } LEO-Satelliten. Das mitgelieferte Szenario ergibt { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } und { "2.3" } min mit seinen eigenen repräsentativen Schalen von { "1000" } km, { "60" } deg, Rauschen und Stationen; die Konstellationen, das Rauschen und die Konvergenzdefinition des Artikels werden nicht reproduziert, daher ist dies eine MODELLED Konsistenz des Trends (monotone Verkürzung, die größte Konstellation unter einem Drittel der Zeit nur mit GNSS), keine Validierung

# text
seg-8ef013b46d0f = Positionsgenauigkeit des 5G-Non-Terrestrial-Network aus der Signalbandbreite

# text
# c1: ntn-positioning
seg-12b1e4657370 = Die Cramér-Rao-Schranke für die Ankunftszeit aus der quadratisch gemittelten (Gabor-)Bandbreite, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), für ein flaches OFDM-Spektrum (beta = B/sqrt({ "12" })), ein bandbegrenztes BPSK-Spektrum (Zähler in geschlossener Form) oder ein beliebiges Spektrum durch Quadratur, und für die Frequenz eines komplexen Tons, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); Lösungen aus der Ankunftszeit im Downlink mit unbekannter Empfängeruhr und eine Doppler-Lösung mit einem einzelnen Satelliten über einen Überflug im S-Band n256 des 3GPP MSS, ausgeführt als die Art <c1/>

# text
seg-f63e1d78cfff = Veröffentlichte Rechenbeispiele (P1): Bachl, Lei und Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), Schranken für einen einzelnen SSB von NR NTN, aus der SSB-Zuordnung von 3GPP TS { "38.211" } durch die eigenen numerischen Funktionen von Kshana reproduziert (W_rms { "1.9616" } gegen { "1.96" } MHz, sigma_t { "38.755" } gegen { "39" } us, sigma_f 100.79/87.28 gegen 101/87 Hz, sigma_rho 0.5970/0.5831 gegen 0.60/0.58 m, jeweils innerhalb einer halben Einheit der gedruckten letzten Stelle); Betz { "2001" } Tabelle { "1" } RMS-Bandbreiten von BPSK-R (1.128/3.477 gegen 1.1/3.5 MHz, ergänzend); die Kovarianzen der Lösungen aus Ankunftszeit und Doppler stimmen mit numpy { "2.4.6" } numpy.linalg.inv auf der exportierten Geometrie überein (P2; { "5e-15" } und { "1.2e-5" } relativ, Zielwerte { "1e-5" } und { "1e-3" }). Vorregistriert (9f2875db; Teil C 0d66dccd). Die Engine-Lösung joint_pvt::formal_sigma_enu (die an der wahren Position ausgewertete Schranke, nicht die verrauschte Lösung) wurde geschrieben, nachdem der erste Lauf mit { "200" } kHz bei { "6.5e-5" } gescheitert war, und bei unveränderter Toleranz erneut ausgeführt. Die Formen für flaches Spektrum und komplexen Ton, die das Szenario ausführt (gabor_bandwidth_flat_hz, doppler_crb_sigma_hz), erreichen die Prüfung P1 über Identitäts-Unit-Tests in der Crate. Schranken auf einem Kanal ohne Mehrwege, keine erreichte Genauigkeit. { "0.30" } Revision: ntn-5g-positioning toa_median_sigma_3d_m { "2.0903959" } -> { "2.0903962" } m (NR { "5" } MHz) und { "25.938613" } -> { "25.938839" } m (NB { "200" } kHz)

# text
seg-9306f1c06081 = LEO-gestützte Zeitübertragung zu UTC gegen C/N0 und den Empfängeroszillator

# text
# c1: leo-pvt
seg-c618feb01476 = Uhrenmessungen von jedem sichtbaren LEO-Satelliten an einer bekannten Position, aus dem Pseudoentfernungs-Rauschmodell mit inverser Varianz kombiniert, gefiltert durch ein Kalman-Filter mit zwei Zuständen (Phase, Frequenz), dessen Prozessrauschen das weiße und das Random-Walk-Frequenzrauschen der Oszillatorklasse ist (slot_timing::ClockNoise, clock_state::ClockClass; die Auslaufvarianz von holdover::coast_phase_variance), eine Wahrheitsuhr mit festem Startwert aus denselben Pegeln, und der Ausdruck für Systemzeit zu UTC aus Abschnitt { "20.3.3.5.2.4" } von IS-GPS-200, mit einer Unsicherheit des Broadcast-Offsets, die als Bias je Lauf hinzugefügt wird; der Modus timing der Art <c1/> durchläuft Oszillatoren und C/N0-Offsets

# text
seg-4a878bd4a90f = Interne Konsistenz: der veröffentlichte Offset-Ausdruck von Hand ausgewertet, der normierte Fehler über { "40" } Startwerte und die durch die Offset-Unsicherheit gesetzte Untergrenze. Die Zahl des NIST für Iridium-Zeitgebungsempfänger mit einer Miniatur-Atomuhr (unter { "40" } ns von UTC(NIST) über { "40" } Tage) ist nur ein Vergleich; das mitgelieferte Iridium-Szenario ergibt { "10" } bis { "11" } ns RMS bei Nennleistung mit seinem repräsentativen Entfernungsfehler von { "5" } m. Flicker-Frequenzrauschen und ionosphärische Verzögerung werden nicht simuliert

# text
seg-cef79d82f0d4 = LEO-Abdeckung und Verdünnung der Genauigkeit für polare und arktische Nutzer gegen MEO-GNSS

# text
# c1: leo-pvt
seg-462a5e95d480 = Sichtbare Satelliten und Median von PDOP, HDOP und VDOP mit Verfügbarkeit gegen die Breite, über abgetastete Längen und Epochen, für die MEO-GNSS-Systeme allein, die LEO-Systeme allein und alle zusammen, jedes System mit eigener Maske und eigenem Uhrenmodell, ausgeführt als der Polarmodus der Art <c1/>; die Bahnen sind SGP4/SDP4-Elementsätze zur Epoche des Durchlaufs (2026-01-01T00:{ "00" }:{ "00" } UTC im Polarmodus), auf dem validierten Erdbahnpfad ins erdfeste System überführt (IAU 2006/2000A, UT1 = UTC, keine Polbewegung)

# text
seg-a16896913438 = Orekit { "13.1.8" } (Apache-2.0) mit Hipparchus { "4.0.3" }: die GCRS-Zustände der Engine von Orekit nach ITRF gedreht (IERS { "2010" }), Sichtbarkeit im WGS-84-TopocentricFrame gegen die Maske jedes Systems, org.orekit.gnss.DOPComputer für eine Uhrunbekannte und NumPy { "2.4.6" } numpy.linalg.inv (P2) für mehrere; wobei der Pfad gegen python-sgp4 und ERFA geprüft wird (Zeile 'One Earth-orbit path'). Zielwerte vor dem Lauf festgelegt (vorregistriert 72ea9eb0; T2 und T3 sind die Zielwerte der Runde 2 von { "0.30" }). Der bei J2000 eingefrorene Schritt TEME -> GCRS färbt den Test rot ({ "4739" } Fehlschläge). Nur Geometrie; keine Szintillation, kein Gelände und keine Signalleistung. Das GNSS-VDOP steigt zum Pol hin ({ "1.20" } am Äquator bis { "1.51" } bei { "89.9" } deg für GPS und Galileo im mitgelieferten Szenario), während eine nahezu polare LEO-Schale dort konvergiert. Verlauf: Runde { "2" } (3254d456) stimmte bei tabellierten Zweikörperzuständen überein; die vollständige Aussage D8 Runde 1 gegen die eigene TLE-Propagation von Orekit (e947e69d) war ein Befund, das SDP4 von Orekit bei e = { "0" } und sein TEME nach IERS { "1996" }, festgeschrieben

# text
seg-d92777401093 = Benannte LEO-PNT-Systeme als optionale Datenvoreinstellungen, jeweils mit ihrer Quelle

# text
seg-5130bfe2410c = Systemunabhängige Eingaben: Jedes System besteht aus Walker-Schalen, expliziten Elementen oder einer GNSS-Voreinstellung, einem Signal (Träger, Chiprate, Bandbreite, empfangene Leistung oder C/N0-Bereich), einem SISRE, einem Doppler-Sigma und einem Uhrenmodell; Voreinstellungen füllen nur aus, was ein Szenario offenlässt, je eine Datei mit Quellen, gekennzeichnet als PUBLIC (mit URL), WORKSHOP oder DERIVED, und die unveröffentlichten Werte sind als repräsentativ aufgeführt: Xona Pulsar X1/X5, Iridium STL, Starlink-Gelegenheitssignale, CentiSpace, ein repräsentatives C-Band-System, das ATOMIC-Ephemeridenmodell ohne Uhr und eine aus einem Workshop abgeleitete Voreinstellung in der optionalen Voreinstellungsdatei Celeste IOD, die durch Löschen dieser Datei und ihrer Szenarien zurückgehalten wird

# text
seg-c6f71b3937cd = Abschrift der zitierten öffentlichen Werte, auf Struktur geprüft (jede öffentliche Quelle hat eine URL, Walker-Muster teilen sich gleichmäßig, das C/N0 aus empfangener Leistung über kT bei { "290" } K), nicht gegen eine externe Referenz. Repräsentative Werte sind in jeder Voreinstellung benannt und illustrativ

# text
seg-dec52b5b9cd6 = Ein LEO-PNT-System von Anfang bis Ende: Signaldesign, Streckenbudget des Überflugs, Navigationsnachricht und fusionierte Positionierung, wobei die Ausgabe jeder Stufe an die nächste übergeben wird

# text
# c1: leo-pnt-chain
seg-39443b31d418 = Die Art <c1/>: Ein Design von leo-signal (öffentliche Voreinstellung oder inline) legt Mitte, Bandbreite, Chiprate und EIRP-Aufteilung eines Bandes von leo-pass fest; der Überflug liefert je Epoche das C/N0 der verfolgten Komponente und den bandbegrenzten Code-Jitter; eine C/N0-Gerade nach kleinsten Quadraten in sin(Elevation), das SISRE der Nachricht von leo-navmsg (an der Bahn des Überflugsatelliten angepasst, plus ein angegebener Term der Bahnbestimmung als Wurzel der Quadratsumme) und der Träger und die Chiprate des Designs gehen an jedes LEO-System einer gemeinsamen Lösung von leo-pvt und optional an die LEO-Fälle von leo-ppp; jede Übergabe wird mit ihrem Wert und ihrer Einheit berichtet

# text
seg-854d3c1428d0 = Selbstkonsistenz der Übergaben: Jeder weitergereichte Wert entspricht der eigenen Ausgabe der vorgelagerten Stufe, und die Mutation einer vorgelagerten Eingabe verschiebt jede nachgelagerte Zahl, die von ihr abhängt. Die Stufen behalten ihre eigenen Kennzeichnungen; die Kette fügt keine Physik und keine externe Referenz hinzu

# text
seg-55ca63edff02 = Erkennung von Spoofing durch LEO-Doppler und Konsistenz der Überflug-Geometrie

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = Der Abschnitt <c2/> der Art <c1/>: Ein Spoofer fälscht, in Entfernung und Entfernungsänderungsrate selbstkonsistent, die Signale, die an einer behaupteten Position gesehen werden, die nach einem Beginn springt und/oder von der wahren weggeschoben wird (je LEO-Band und für das MEO-GNSS-Signal); der Empfänger sagt jede Entfernungsänderungsrate aus der Broadcast-Bahn und einer unabhängigen Vorabposition und -geschwindigkeit voraus und prüft die gemessenen Entfernungsänderungsraten mit einer verallgemeinerten Chi-Quadrat-Statistik nach kleinsten Quadraten über ein Fenster von Epochen (Uhrendrift als Störgröße oder mit einem Prior), auf den GNSS-Kanälen, den LEO-Kanälen und allen Kanälen, mit thermischem Rauschen der Frequency-Lock-Loop aus C/N0 (Kaplan & Hegarty { "2006" }, Abschnitt { "5.6.2" }); Detektionswahrscheinlichkeit aus dem nichtzentralen Chi-Quadrat-Gesetz bei einer angegebenen Fehlalarmwahrscheinlichkeit, Detektion bei einer angegebenen Wahrscheinlichkeit der Fehldetektion erklärt

# text
seg-787c07c08c7f = Geschlossene Formen und Identitäten, keine externe Messung: der Gradient der Entfernungsänderungsrate gegen eine zentrale Differenz, die Statistik in Informationsform gegen die dichte Kovarianzform, eine reine Uhrendrift, die null ergibt, eine durch den Prior erklärte Verschiebung, die höchstens |dx|^2/sigma_p^{ "2" } ergibt, die Statistik quadratisch in einem Sprung. Keine Detektionszahl wird mit einem gemessenen Angriff verglichen; der Spoofer ist idealisiert (keine Signatur aus Leistung, Einfallswinkel oder Korrelationsspitze)

# text
seg-5f341f85ac07 = Erkennung von Spoofing durch Konsistenz zwischen den Bändern eines LEO-Mehrbandsignals

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Für jeden LEO-Satelliten und jedes Paar von Entfernungsmessbändern bildet der Abschnitt <c1/> die geometriefreie Pseudoentfernungskombination, entfernt das ionosphärische Modell des Empfängers und prüft ihren Schritt von Epoche zu Epoche gegen das Coderauschen der beiden Bänder und eine angegebene tolerierte nicht modellierte ionosphärische Rate (zweiseitig gaußsch, exakte Detektionswahrscheinlichkeit); ein Spoofer, der manche Bänder fälscht und andere nicht, oder jedes Band ohne die Ionosphäre, wird bei seinem Beginn gesehen; einer, der jedes Band fälscht und die Ionosphäre simuliert, nicht, was das Ergebnis angibt

# text
seg-87fd44fa1d94 = Identitäten: Der Beginnsprung eines ionosphärenfreien Spoofers entspricht der modellierten ionosphärischen Verzögerungsdifferenz des Paares, die Schwelle ist das zweiseitige Normalquantil mal die Standardabweichung des Schritts plus die Ratenschranke. Das ionosphärische Modell des Empfängers ist das der Engine, daher ist das authentische Residuum im Mittel per Konstruktion null; keine externe Referenz

# text
seg-97dbcd5f2728 = Ionosphärensondierung: Schräg-TEC aus der Zweibandverzögerung eines LEO-Überflugs

# text
# c1: leo-pass
seg-844de34fd2f3 = Für jedes Bandpaar eines Satelliten der Art <c1/> gibt der Bericht den Schräg-Gesamtelektronengehalt an, den die geometriefreie Codekombination am Überflugmaximum zurückgewinnt, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), und sein 1-sigma aus dem thermischen Coderauschen der beiden Bänder, sodass jedes LEO-PNT-Design mit mehreren Bändern als Ionosphärensonde abgewogen werden kann

# text
seg-2562ae9e6180 = Die Identität der Dispersion erster Ordnung, exakt per Konstruktion gegen die eigene Verzögerung erster Ordnung der Engine (deren Skalierung 1/f^{ "2" } in einer eigenen Zeile gegen IS-GPS-200 VALIDATED ist); die Präzision ist nur das thermische Coderauschen, ohne Mehrwege oder Interfrequenz-Biases. { "0.30" } Runde { "2" }, gemessen (vorregistriert 5e795f93), ein Befund (bleibt MODELLED): Die globale Ionosphärenkarte CODG1330.18I von CODE gegen ABMF C1C/C2W-Code mit den CODE-Biases ergibt { "33" } von { "36" } Bogenmitteln innerhalb von { "3" } TECU (schlechtester Wert +{ "6.84" } TECU auf einem Abendbogen; RMS je Epoche { "3.95" } TECU), gegen einen Zielwert von jedem Bogen; nicht validiert

# text
seg-0a63a69e181d = Kovarianz des Mond-Bezugsdatums mit geschätzten Stationen, gegen erweiterte Genauigkeit mit 50 Stellen

# text
seg-de2ee45f6527 = Die Kovarianz des Helmert-Datums mit sieben Parametern des Szenarios lunar-frame-campaign mit geschätzten Erdstationen (Station { "1" } verankert), wie lunar_frame_campaign sie in binary64 berechnet: die gemeinsame Fisher-Information aus Stationen und Baken, aus der Verzögerungs-Jacobi-Matrix akkumuliert, der Stationsblock durch ein Schur-Komplement über eine spektrale Jacobi-Inverse marginalisiert, H = AᵀSA mit dem Helmert-Entwurf gebildet und spektral invertiert. Das Problem ist per Konstruktion schlecht konditioniert (Helmert-Konditionszahl { "2.1e8" } bis { "2.3e8" }, Konditionszahl der gemeinsamen Information { "1.6e12" } bis { "3.0e13" }): Eine relative Änderung von { "1e-9" } im Schur-Term verschiebt die Datums-Sigmas um bis zu { "28" } %. Berichtet: die sieben Datums-Sigmas, die Helmert-Konditionszahl und die schwächste Richtung. AUSSAGE, EINGEENGT: Die Datums-Sigmas und die Konditionszahl der Engine liegen innerhalb der a-priori-Schranke für den schlimmsten Fall einer rückwärtsstabilen Pipeline mit doppelter Genauigkeit bei diesem Problem; dies behauptet nicht, dass sie so genau sind, wie doppelte Genauigkeit es erlaubt (ein Faktorisierungsweg ist bei denselben Eingaben etwa tausendmal genauer und der optionale Quadratwurzel-Löser etwa zehn Millionen Mal), und die schwächste Richtung ist nur dort validiert, wo ihr Zielwert unter einem rechten Winkel liegt (die Kontrolle mit festen Stationen)

# text
seg-1aab389815b3 = mpmath { "1.3.0" } (BSD-3-Clause) mit { "50" } signifikanten Stellen, bei { "80" } selbstgeprüft (Übereinstimmung { "1.1e-38" } oder besser), auf der eingecheckten Jacobi-Matrix, den Gewichten und dem Helmert-Entwurf der Engine: die eigene LU-Lösung von mpmath für das Schur-Komplement, seine Inverse für H und seine Jacobi-Eigenzerlegung (P2, eine unabhängige numerische Bibliothek). Vorregistriert 804662d5, bevor das Fixture existierte, mit Zielwerten aus einer Rückwärtsfehlerformel erster Ordnung: die Konstante (3n+{ "1" })n + m mal der Einheit der Rundung (Higham, Accuracy and Stability of Numerical Algorithms, Satz { "10.4" }, die Form von Stufe B), mal der exakten Sensitivität erster Ordnung jeder Größe gegenüber der gemeinsamen Information, dem Schur-Komplement und H. Gemessen: Datums-Sigmas innerhalb von { "4.8e-6" } am 2026-03-18 (Zielwerte { "9.6e-2" } bis { "2.2e-1" }), { "9.7e-6" } am 2024-01-01 (Zielwerte { "2.8e-2" } bis { "6.9e-2" }) und { "2.0e-14" } bei festen Stationen (Zielwerte { "1.0e-11" } bis { "2.8e-7" }); Konditionszahl innerhalb von { "4.6e-6" }, { "1.3e-5" } und { "4.1e-14" }. In den Szenarien mit geschätzten Stationen sind die Zielwerte Worst-Case-Werte und liegen vier Größenordnungen über dem gemessenen Fehler, und der Zielwert der schwächsten Richtung übersteigt dort einen rechten Winkel, sodass diese eine Prüfung nicht gezählt wird; bei der Kontrolle mit festen Stationen stimmt die schwächste Richtung auf { "6.6e-16" } rad gegen einen Zielwert von { "9.4e-11" } überein, gemessen durch die Sehne zwischen Einheitsvektoren (ein früherer Vergleich mit acos konnte Winkel unter { "1.5e-8" } rad nicht auflösen; der Zielwert ist unverändert). Diagnose: Die Wege mit Cholesky und QR von NumPy { "2.3.5" } erreichen { "9e-9" } und { "5e-9" } auf den Eingaben vom 2024-01-01, seine Wege mit Inverse und Eigenwerten { "2.9e-6" } und { "6.2e-6" }: Die Engine liegt innerhalb ihrer Schranke, ist aber etwa tausendmal ungenauer als ein Faktorisierungsweg. Validiert die lineare Algebra auf den eingecheckten Eingaben, nicht die Jacobi-Matrix (das leistet der SPICE-Zweig der Kampagnenzeile) und nicht die physikalische Genauigkeit der illustrativen Kampagne

# text
seg-71b463388e80 = Datumslöser mit Quadratwurzel-Information gegen erweiterte Genauigkeit mit 50 Stellen

# text
seg-5ec3e3c2bf19 = Ein optionaler Quadratwurzel-Informationslöser (lunar-frame-campaign solver = "srif"; Voreinstellung unverändert), der für das Datum nie eine Informationsmatrix bildet oder invertiert: Householder-QR (orthogonal-dreieckige Zerlegung) der gewichteten Verzögerungs-Jacobi-Matrix als Messaktualisierung eines Square-Root-Information-Filters, die Erdstationen marginalisiert über den nachlaufenden Dreiecksblock (dessen Gram-Produkt das Schur-Komplement ist), eine zweite QR von R_bb A für das Helmert-Datum mit sieben Parametern, Sigmas als Zeilennormen der Dreiecksinversen und das Spektrum (Konditionszahl, schwächste Richtung) aus einer einseitigen Jacobi-Singulärwertzerlegung. Innere Produkte werden mit einem fehlerfreien Produkt nach Dekker-Aufspaltung kompensiert, sodass jede Operation eine korrekt gerundete IEEE-754-Grundoperation oder Quadratwurzel ist; identische Ergebnisse auf jeder Plattform werden daraus begründet, nicht plattformübergreifend getestet

# text
seg-271cba640489 = mpmath { "1.3.0" } (BSD-3-Clause) mit { "50" } signifikanten Stellen, bei { "80" } selbstgeprüft (Übereinstimmung { "1.4e-43" } oder besser), auf der eingecheckten Jacobi-Matrix, den Gewichten und dem Helmert-Entwurf der Engine (P2, eine unabhängige numerische Bibliothek: die eigene LU-Lösung, Inverse, Cholesky-Zerlegung und Jacobi-Eigenzerlegung von mpmath). Vorregistriert b41908c9, bevor der Löser geschrieben wurde, mit Zielwerten aus einer Rückwärtsfehlerschranke erster Ordnung in Quadratwurzelform: die Konstante mn der Householder-QR plus (3n+{ "1" })n mal der Einheit der Rundung (Higham, Accuracy and Stability of Numerical Algorithms, Satz { "19.4" } und Kapitel { "8" }) mal exakte Sensitivitäten. Gemessen: Datums-Sigmas innerhalb von { "3.0e-13" } am 2026-06-09 (Zielwerte { "4.1e-7" } bis { "5.3e-7" }), { "1.9e-15" } bei festen Stationen (Zielwerte bis hinunter zu { "4.8e-12" }), { "3.8e-13" } am 2026-03-18 und { "2.3e-13" } am 2024-01-01, wo der spektrale Standardlöser um { "4.8e-6" } und { "9.7e-6" } abweicht; Konditionszahl innerhalb von { "4.9e-13" }; schwächste Richtung innerhalb von { "1.4e-13" } rad (Kontrolle { "1.7e-16" } gegen { "5.1e-10" }). GRENZE DER PRÜFUNG: Die Zielwerte belegen nur Datumsfehler unterhalb von etwa { "2e-7" } relativ; die gemessenen Zahlen von { "1e-13" } sind Beobachtungen, nicht das, was die Zielwerte belegen. Die Prüfung lehnt den spektralen Standardlöser ab (Sigmas { "9.7e-6" } gegen { "2.9e-7" } am 2024-01-01; am bindenden Datum { "1.3e-6" } gegen { "4.9e-7" }, ein Abstand von { "1.3" } bis { "2.6" }) und eine falsch genommene Dreiecksinverse (Spaltennormen: rot), aber ein umgekehrtes Householder-Vorzeichen, ein nicht kompensiertes Skalarprodukt und Sigmas aus einer spektralen Inversen des aus dem Quadratwurzelfaktor gebildeten H ({ "3.7e-9" }) bestehen alle, sodass sie nicht zeigt, dass jeder Quadratwurzelschritt nötig ist. Validiert die lineare Algebra des optionalen Lösers auf eingecheckten Eingaben, nicht die Jacobi-Matrix und nicht den Standardlöser; die Bitreproduzierbarkeit über Plattformen hinweg wird aus den verwendeten Operationen begründet und nur als Identität bei erneutem Lauf auf einer Plattform getestet

# text
seg-433b52bf0ba2 = Vertrauensmonitore für die Schifffahrt: die Arithmetik, auf der sie beruhen (NMEA-Dekodierung, geodätische Versätze, die kinematischen Statistiken und die Sensorresiduen-Statistiken)

# text
# c1: receiver_trust
# c2: maritime::en_offset_m
seg-c61c575f9c38 = Für ein Schiff dekodiert <c1/> die NMEA-{ "0183" }-Sätze, die ein Empfänger und seine Instrumente ausgeben (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), bildet den Ost-Nord-Versatz zwischen Lösungen (<c2/>) und daraus die Statistiken, auf die sich seine Monitore stützen: die implizierte Geschwindigkeit, das Koppelnavigations-Residuum, die implizierte Beschleunigung und die implizierte Drehrate über Fenster von { "30" } s, die Residuen Kurs gegen Fahrtrichtung, Logge gegen Grundgeschwindigkeit und Antennenhöhe (Mediane über { "10" } s) sowie die Streuung und den Anstieg des Signal-Rausch-Verhältnisses der Satelliten.

# text
seg-32fcf6956dac = WAS EXTERN GEPRÜFT WIRD, eng gefasst: ({ "1" }) die Dekodierung jedes Feldes, das die Monitore lesen, gegen pynmea2 { "1.19.0" } (MIT) auf { "8" } synthetischen Protokollen ({ "1,086" } Epochen), auf { "1e-9" } in der Einheit des Feldes (Breite und Länge, Höhe, Geoidabstand, HDOP, Geschwindigkeiten, Kurs, Steuerkurs, Signal-Rausch-Verhältnis; Ganzzahlen und Daten exakt; Tageszeit auf { "1e-6" } s), größte Differenzen auf dem Niveau der letzten Stelle eines double; ({ "2" }) der Ost-Nord-Versatz zwischen zwei Lösungen, als Entfernung und Peilung, gegen die WGS84-Geodäte von geographiclib { "2.1" } (MIT) auf { "223" } Lösungspaaren mit Basislinien bis zu { "2" } km, von -45 bis { "70" } Grad Breite und über den Antimeridian hinweg, auf { "0.01" } m und { "0.001" } Grad (die Peilung gegen das mittlere Azimut der Geodäte, die Richtung der Sehne); ({ "3" }) die Eingangsstatistiken der Monitore bei { "341" } bewerteten Epochen einer synthetischen Fahrt von { "400" } s mit einer Kurve und einem Positionssprung, gegen Python-Neuberechnungen, die geographiclib für Entfernung und Azimut, pynmea2 für die Dekodierung und numpy für Mediane und Standardabweichungen verwenden: implizierte Geschwindigkeit auf { "0.005" } m/s, Koppelnavigations-Residuum auf { "0.02" } m, Beschleunigung auf { "5e-4" } m/s^{ "2" }, Drehrate auf { "1e-3" } deg/s, die Residuenmediane und die Streuung und der Anstieg des Signal-Rausch-Verhältnisses auf { "1e-6" }. WAS NICHT: Die Fensterlängen, Toleranzen und Schwellen der Monitore sind eigene Regeln dieses Projekts; das Python reproduziert sie aus derselben Dokumentation, daher bestätigt die Übereinstimmung die Implementierung der Arithmetik, nicht die Regeln. Für den Satz THS gibt es keine Klasse in pynmea2, und der Satz ROT wird nicht gelesen; beides ist nicht abgedeckt. Die Tabelle von einem NMEA-Talker und einer Satellitennummer zu einer Satellitenkennung im Stil von RINEX ist eine eigene dieses Projekts (verglichen werden nur die Nummer, der Talker und der Wert). Für die Eingaben Zeitschritt, Host-Uhr und Authentifizierungsstatus gibt es keine Referenz. Alle Daten sind synthetischer Text aus receiver_trust::synth; nichts hier ist eine Messung, und es wird keine Aussage darüber gemacht, wie sich ein Monitor bei realer Störung verhält. Peilung: verglichen mit dem mittleren Azimut der Geodäte. Der vorregistrierte Vergleich mit dem Vorwärtsazimut an der Lösung { "1" } scheiterte bei { "0.001" } Grad ({ "77" } von { "223" } Paaren, schlechtester Wert { "8.3e-3" } Grad) aufgrund einer Definitionsabweichung, nicht der Arithmetik; die Änderung wurde nach dem ersten Lauf vorgenommen, und beide Ergebnisse sind festgehalten (der Vergleich mit dem Vorwärtsazimut bleibt im Test als beschreibende, nicht vorregistrierte Schranke von { "0.01" } Grad). Offengelegt: Die ersten Läufe fanden Eingaben, die zu wenig ausübten (Beschleunigung und Drehrate wurden bei jeder Epoche auf null begrenzt, und die Antimeridian-Spur überquerte ihn nie), einen Fehler im synthetischen Generator (kein Längenumbruch) und, für die Peilung, dass sich die registrierte Referenzgröße (das Vorwärtsazimut der Geodäte an der ersten Lösung) um etwa die Hälfte der Meridiankonvergenz von der Sehnenrichtung unterscheidet ({ "77" } von { "223" } Paaren außerhalb von { "0.001" } Grad, schlechtester Wert { "8.3e-3" }); die Eingaben wurden korrigiert und die Peilung bei gleicher Toleranz mit dem mittleren Azimut verglichen (Änderungen { "1" } bis { "3" } in der Vorregistrierung, nach Kenntnis der Ergebnisse vorgenommen und daher nicht blind); die Vergleiche von Kurs und Steuerkurs wurden zirkulär gemacht ({ "360" } und { "0" } Grad sind ein Kurs, Änderung { "5" }). Mutation: Eine Skalierung des Ostversatzes um { "1e-4" } lässt den Vergleich der Geodäsie scheitern.

# text
seg-1fdbb476c8ab = Vertrauenswert für die Schifffahrt: die Aggregation der Evidenz der Monitore zu einem Wert von 0-100 und seinen drei Bändern

# text
seg-0d76b33144f1 = Jeder Monitor reduziert seine Evidenz auf ein Verhältnis von Statistik zu Schwelle; der Wert ist { "100" } minus die Summe über die Monitore aus Gewicht mal einer begrenzten linearen Rampe des Verhältnisses ({ "0" } bis { "0.5" }, { "1" } bei { "1.5" }), begrenzt auf { "0" } bis { "100" } und gerundet auf { "0.1" }, mit Bändern bei { "90" } und { "55" }; jede Epoche listet die Monitore auf, die abgezogen haben, und ihre Punkte.

# text
seg-b2d3c6d6ac36 = Implementierung gegen Spezifikation, KEINE externe Referenz: Eine Neuimplementierung in Python ohne Kenntnis des Originals (scripts/maritime_score_cleanroom.py), geschrieben von einem Leser, dem nur docs/RECEIVER-TRUST.md und docs/MARITIME-TRUST.md und nicht der Rust-Quelltext vorlagen, stimmt mit score_from_ratios auf { "600" } Verhältnisvektoren überein (Wert, Band, Punkte und Reihenfolge der Abzüge, Differenz { "0" }), nachdem die Dokumentation dort vervollständigt wurde, wo der erste Leser sie stumm oder widersprüchlich fand (Reihenfolge bei Gleichstand, Rundung, das Verhältnis eines Monitors mit Bestanden oder Nichtbestanden, zwei Beispiele, deren Zahlen nicht zur Formel passten). Das zeigt, dass die Dokumentation ausreicht und der Code tut, was sie sagt. WAS NICHT GEPRÜFT WIRD, und warum die Zeile MODELLED bleibt: Die Regel selbst (die Gewichte, die Rampe, die Bandgrenzen, das Halten der Evidenz) ist eine eigene dieses Projekts, vorregistriert, aber ohne externe Quelle, und nichts hier zeigt, dass ein Wert von { "80" } oder { "40" } bei realer Störung das bedeutet, was ein Navigator sich wünschen würde; eine Zahl dieser Art wird nicht angegeben. Die Schwellen der Monitore sind ebenfalls eigene dieses Projekts (Zeile A prüft nur ihre Arithmetik).

# text
seg-f52fceaf06ca = Formprüfung der NMEA-{ "0183" }-Trainingsströme und dekodierte Werte

# text
seg-684f86418933 = Synthetische NMEA-{ "0183" }-Ströme für die Brücke zum Training der Besatzung (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW und die Marke PKSHT, erzeugt aus einer Wahrheitsspur mit modellierten Effekten von Empfänger, Himmel, Jamming und Spoofing. Nur Textausgabe; nichts wird gesendet.

# text
seg-4591ed75149c = WAS EXTERN GEPRÜFT WIRD, eng gefasst: Alle { "225,227" } Sätze von acht synthetischen Trainingsströmen (vier Bibliotheksszenarien, Startwerte { "1" } und { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW und die Marke PKSHT) werden in pynmea2 { "1.19.0" }, einem unabhängigen NMEA-Parser, mit gültiger Prüfsumme und dem erwarteten Talker und Typ geparst. Die von ihm dekodierten Werte für Position, Geschwindigkeit über Grund, Kurs über Grund, Steuerkurs, UTC-Zeit und Datum, Lösungsstatus und die GGA-Satellitenzahl entsprechen der Wahrheitsspur des Generators innerhalb von Toleranzen, die vor dem ersten Vergleich festgelegt wurden ({ "1.5e-6" } deg, { "0.06" } kn, { "0.07" } km/h, { "0.11" } deg Kurs, { "0.5" } deg Steuerkurs, { "0.02" } s), ausgeführt von scripts/gen_nmea_training_ref.py mit dem Fixture in tests/fixtures/nmea_training_ref/. Die Erwartung der GGA-Satellitenzahl wurde nach dem ersten Lauf auf die NMEA-Konvention korrigiert ({ "00" } ohne Lösung); numerische Toleranzen gegenüber dem Vorregistrierungs-Commit unverändert. WAS NICHT: dass irgendein Empfänger, Kartenplotter oder irgendein Brückensystem die Ströme akzeptiert; der Realismus der Modelle von Empfänger, Himmel, Jamming oder Spoofing (nomineller Himmel, modelliertes Rauschen, Drag- und Replay-Profile, alle MODELLED); HDOP, Höhe und der Inhalt von DOP und GSA/GSV über Syntax und Zahlen hinaus; das Instruktorprotokoll. Nichts wird gesendet, und es wird keine Anti-Jam- oder Anti-Spoof-Leistung beansprucht.

# text
seg-1be1cfcb95c8 = Störungskarte: Bedeutungen von Genauigkeitscodes, nicht verfügbare AIS-Werte, Zuordnung zu Rasterzellen, Routenlänge je Zellenzustand und Maskierung im Binnenland

# text
seg-71cff2a675e8 = Die Lesart der ADS-B-Codes für Navigationsgenauigkeit und Integrität, die die Karte verwendet (die EPU-Schranke, für die ein NACp-Code steht, die Schranke des Einschlussradius, für die ein NIC-Code steht, und die niedrigen und guten Klassen, die die Methode daraus ableitet); die nicht verfügbaren Werte für AIS-Position und -Geschwindigkeit, die der AIS-Leser verwirft; die feste Rasterzelle nach Breite und Länge, in die eine Position fällt; die Routenlänge und ihre Aufteilung nach Zellenzustand (degradiert, nicht degradiert, nicht bewertet, nicht beobachtet), die die Routenexposition berichtet; und ob eine Position um mehr als einen Puffer im Binnenland eines Landpolygons liegt. Eine als degradiert oder anomal gekennzeichnete Zelle ist eine Aussage über berichtete Genauigkeitsfelder oder unplausible Positionen, kein Befund einer Störung, und nichts hier prüft das.

# text
seg-beee15333c89 = WAS EXTERN GEPRÜFT WIRD, eng gefasst: Fünf unabhängige Implementierungen lesen dieselben synthetischen Eingaben. ({ "1" }) pyModeS { "2.21" } dekodiert synthetische DF17-Rahmen für Betriebsstatus und Luftposition; die NACp-EPU-Schranken von Kshana stimmen auf { "0.5" } m überein (größte Differenz { "0.4" } m), seine NIC-Einschlussschranken für die Codes { "5" } bis { "11" } stimmen auf { "1" } m überein, und seine niedrigen und guten Klassen ordnen alle { "12" } NACp-Codes und jeden NIC-Code, den die Referenz erzeugt ({ "0" } bis { "11" }), auf dieselbe Seite der Schwellen, die die Schranken der Referenz implizieren ({ "0" } Abweichungen). ({ "2" }) pyais { "3.3.0" } dekodiert AIVDM-Sätze vom Typ { "1" }, deren Nutzlastbits das Skript aus den rohen Feldwerten nach ITU-R M.1371 packt; Kshana lehnt genau die dekodierten nicht verfügbaren Positionen (Breite { "91" }, Länge { "181" }) und Geschwindigkeit ({ "102.3" } kn) ab und behält { "0" } bis { "102.2" } kn wie dekodiert ({ "0" } Abweichungen über { "94" } Rahmen). ({ "3" }) shapely { "2.2.0" } covers() auf Zellpolygonen stimmt mit grid::Grid::cell_of für { "1770" } Punkte über Zellgrößen von { "0.5" }, { "0.25" }, { "1" } und { "0.07" } Grad überein, einschließlich Punkten nahe der Kante, beider Pole und des Antimeridians ({ "0" } Abweichungen). ({ "4" }) Die Schnittmenge aus Route und Zelle mit shapely { "2.2.0" } und geodätischen Längen von GeographicLib { "2.1" } WGS84 stimmt mit der Routenexposition auf { "8" } synthetischen Routen überein, darunter zwei, die den Antimeridian überqueren: Gesamtlänge auf { "0.6" }% (größte Differenz { "0.49" }%, Kugel gegen Ellipsoid) und die Länge jedes Zellenzustands auf { "0.6" }% plus { "125" } m je Stück (größte { "21" }% dieser Toleranz). ({ "5" }) shapely { "2.2.0" } contains() mit dem azimutalen äquidistanten Abstand von pyproj zur Küstenlinie stimmt mit der Binnenland-Maske von { "2000" } m auf { "992" } Gittermittelpunkten um vier synthetische Inseln überein, eine davon mit einem See ({ "0" } Abweichungen; { "4" } Punkte innerhalb von { "20" } m des Puffers wurden ausgeschlossen und gezählt). Die Toleranzen wurden in tests/fixtures/interference_map_ref/PREREGISTRATION.md vor jedem Vergleich festgelegt und danach nicht geändert; zwei Defekte der synthetischen Eingaben, die der erste Lauf fand, sind dort festgehalten. WAS NICHT: Kshana dekodiert keine rohen Mode-S-Rahmen oder AIVDM-Sätze, daher validiert dies seine Lesart bereits dekodierter Werte, keinen Dekoder. Die NIC-Einschlussradien der Referenz für die Codes { "1" }, { "2" } und { "4" } weichen von DO-260B ab ({ "20" }, { "8" } und { "2" } NM), daher werden nur die Codes { "5" } bis { "11" } numerisch verglichen. Die Positionsregel ({ "0" }, { "0" }), die Höhenuntergrenze, der Filter nach Quellentyp, das Hashing der Kennungen, die Schwellen und Statistiken der Methode und die Wahl der Zellgröße sind eigene von Kshana und werden gegen nichts geprüft. Der Routenvergleich verwendet auf beiden Seiten dieselbe Pfaddefinition geradlinig in Breite und Länge, prüft also Längen und Zellzuordnung, nicht, dass dieser Pfad der richtige für ein Schiff oder Luftfahrzeug ist. Nichts hier zeigt, dass eine gekennzeichnete Zelle eine Störung ist. Die Eingaben sind synthetisch; die Fixtures der Referenz werden von scripts/gen_interference_map_ref.py geschrieben (pyModeS steht unter GPL-3.0 und wird nur in diesem Offline-Skript verwendet; CI braucht kein Python).

# text
seg-57ace69bdf1a = Wire-Formate der Vertrauens-Telemetrie: Prometheus-Textexposition und OpenTelemetry OTLP/HTTP JSON

# text
seg-654126a9d073 = GNSS-Vertrauen (Wert, Band, Gründe, Gate und auf Anforderung die Position) als Prometheus-Textexposition, bereitgestellt unter /metrics, und als OTLP/HTTP-JSON-Metriken, mit einer Obergrenze für die Kardinalität der Grundlabels.

# text
seg-9cbde962155c = WAS EXTERN GEPRÜFT WIRD, eng gefasst: Unsere Prometheus-Textexposition für einen synthetischen Strom mit 84 Zeilen (Labelwerte mit Anführungszeichen, Backslashes, Zeilenumbrüchen und Nicht-ASCII-Text, { "64" } Grundserien plus eine zusammengefasste 'other', Gate- und Positions-Gauges) wird vom Textparser von prometheus_client { "0.26.0" } akzeptiert, und die Metrikfamilien, Typen, Hilfetexte, Labelmengen und Werte, die er liest, entsprechen exakt dem Zustand des Registers (Werte durch f64-Gleichheit). Unser OTLP/HTTP-JSON für dasselbe Register wird von protobuf { "7.36.2" } json_format.Parse(ignore_unknown_fields=False) in den ExportMetricsServiceRequest von opentelemetry-proto { "1.45.1" } geparst, und jeder Metrikname, jede Beschreibung, Einheit, Art, Monotonie, zeitliche Aggregation, jedes Attribut, jeder Wert, jede Startzeit und Zeit entspricht exakt dem Zustand des Registers. Beide Parser lehnten nachweislich ein unbekanntes Feld, einen falsch typisierten Wert und eine fehlerhafte Zeile ab (scripts/gen_telemetry_formats_ref.py). Schema { "1.3" } ({ "0.36" }), vorregistriert (fb226057), bevor ein Werkzeug es las: Für einen synthetischen Strom mit 64 Zeilen nach Schema 1.3 (Geometriestatus, DOPs, Labels und Signalverlust vorhanden, null, abwesend und unbekannt; Abzugsklassen; nicht parsbare Zeilen) lesen dieselben beiden Parser die Geometrieserien (Prometheus kshana_trust_geometry*, OTLP kshana.geometry.*) und das Klassenlabel auf kshana_trust_reason_active genau so, wie das Register es impliziert ({ "24" } Familien und { "54" } Stichproben; { "12" } Metriken und { "31" } Punkte), promtool { "3.5.0" } check metrics endet mit { "0" } ohne Lint-Problem, und der OpenTelemetry Collector contrib { "0.135.0" } akzeptiert das OTLP/HTTP-JSON (Status { "200" }, nichts abgelehnt), und sein Datei-Exporter zeichnet die Anfrage unverändert auf (xval/telemetry-1.3, datengesteuert: Die Release-Tarballs werden mit festgelegtem SHA-256 abgerufen und ihre Ausgaben eingecheckt). WAS NICHT: Der HTTP-Endpunkt, die Zustellung, Timeouts und der Wiederaufbau der Verbindung werden von keiner Referenz geprüft, ebenso wenig der Prometheus-Empfänger des Collectors; das Register wird über Zugriffsfunktionen gelesen, sodass ein Fehler im Zustand des Registers selbst nicht aufgefangen würde; die Prüfung 'committed output is current' bei OTLP läuft nur mit dem Feature otlp; die Metriknamen und ihr Nutzen für eine Betriebszentrale sind nicht validiert; CEF und LEEF sind nicht abgedeckt (siehe die nächste Zeile).

# text
seg-b037c999443b = SIEM-Ereignisse der Vertrauens-Telemetrie: Common Event Format (CEF) über Syslog

# text
seg-ffd8d7062055 = Ereignisse bei Bandwechsel (oder je Epoche) als Common-Event-Format-Nutzlasten in einem RFC-{ "5424" }-Umschlag über UDP oder TCP, mit dokumentierter Feldzuordnung und CEF-Maskierung.

# text
seg-59fd23d6607e = WAS EXTERN GEPRÜFT WIRD, eng gefasst: gegen zwei unabhängige Open-Source-Parser (Referenzen: pycef { "1.11" } (PyPI, MIT); der Logstash-CEF-Codec (logstash-codec-cef { "6.2.7" } in Logstash { "8.15.3" })), an einem Korpus von CEF-Zeilen, die diese Crate geschrieben hat ({ "157" } vor der Änderung { "4" } unten, { "170" } danach, { "176" } nach der Änderung { "5" }): jeder Bandwechsel und jede Epoche eines eingecheckten synthetischen Vertrauensstroms mit 84 Zeilen, plus gegnerischer Text in Hosts, Gründen, Zeitlabels und Gate-Namen mit Gleichheitszeichen, Backslashes, Backslash-Gleichheitszeichen, senkrechten Strichen, Zeilenumbrüchen, Wagenrückläufen, Tabulatoren, Folgen von Leerzeichen, Mehrbyte- und astralen Zeichen und Schlüssel-Doppelgängern, extremen Werten und Versätzen, jedes Band mit und ohne vorheriges Band. pycef parst die Zeilen, deren Kopf keine Maskierung braucht ({ "153" } vor der Änderung { "4" }, { "166" } danach, { "172" } nach der Änderung { "5" }), und gewinnt exakt die Kopffelder, den Schweregrad, die exakte Menge der Erweiterungsschlüssel und jeden Wert zurück (Zahlen durch f64-Gleichheit), nach den Regeln der CEF-Spezifikation zum Aufheben der Maskierung, die pycef nicht anwendet und die scripts/gen_cef_ref.py anwendet. Der Logstash-Codec, der die Maskierung selbst aufhebt, parst jede Zeile ({ "157" }, dann { "170" }, dann { "176" }), erreicht denselben Zielwert und gewinnt außerdem vier Kopffelder zurück, die Maskierung brauchen (ein senkrechter Strich, ein Backslash und ein Gleichheitszeichen in der Versionszeichenkette), die das Kopfmuster von pycef nicht lesen kann, sodass die Maskierung im Kopf allein auf dem Logstash-Codec beruht. Der Vergleichszielwert wurde in den Commits { "5172e579" } (pycef) und 0a7598aa (Logstash) registriert, bevor einer der Parser ausgeführt wurde, und beide erreichten ihn beim ersten Vergleich. Fünf Änderungen werden offengelegt. Die Änderungen ({ "1" }) bis ({ "3" }) berührten keine Vergleichsregel und keinen erwarteten Wert: ({ "1" }) eine Behauptung zur Korpusgröße wurde von { "5" } auf { "4" } Bandwechsel korrigiert, eine Fehlzählung, da der Strom { "4" } hat; ({ "2" }) die Verdrahtung des Pipeline-Trenners im Logstash-Runner wurde repariert, nachdem ein erster Versuch keine Ereignisse erzeugt hatte; ({ "3" }) der Vertrauenswert und der Epochenversatz wurden von den CEF-Ganzzahlfeldern cn1 und cn2 in die Gleitkommafelder cfp1 und cfp2 verschoben, eine Änderung des Wire-Formats in diesem Release, nach der der Korpus neu erzeugt und beide Referenzen bei unverändertem Zielwert erneut ausgeführt wurden und ihn erneut erreichten. Die Änderung ({ "4" }), { "0.36" }, erweiterte den Korpus und die erwartete Schlüsselmenge, registriert in d6331429, bevor einer der Parser auf die neuen Zeilen angewendet wurde: Eingaben nach Schema { "1.3" } fügen die Satellitengeometrie in den benutzerdefinierten Feldern cs6 (Label geometry: Status, dann ';' und die Abzugsklassen), cfp3 (geometryHdop) und cfp4 (geometryPdop) hinzu; { "13" } Geometriefälle (der Korpus auf { "170" } Zeilen) und die drei neuen Schlüssel; beide erreichten den Zielwert, sonst unverändert, beim ersten Vergleich (pycef { "166" } von { "170" } Zeilen geparst, die { "4" } Kopffälle der Stufe { "2" } wie zuvor; Logstash { "170" } von { "170" }). Die Änderung ({ "5" }), { "0.36" }, fügte { "6" } Fälle mit Geometrielabel hinzu (der Korpus auf { "176" } Zeilen), registriert in 9a8e4fa9, bevor einer der Parser auf sie angewendet wurde: Bei Eingaben, die das Geometrielabel tragen, erhält cs6 ein drittes Feld (';' und das Label) und cn1 (geometryUsedSatellites) die verwendeten Satelliten; die Zuordnungstabelle des Logstash-Codecs wurde zuerst gelesen (keine flexString-Felder, daher cs6 statt flexString1); beide erreichten den Zielwert beim ersten Vergleich (pycef { "172" } von { "176" }, Logstash { "176" } von { "176" }), und jeder frühere Referenzeintrag wurde unverändert reproduziert. WAS NICHT: Keiner der beiden Parser prüft die Typen der cfp-Werte (beide behalten sie als Text), daher beruht die Verwendung der Gleitkommafelder auf dem CEF-Wörterbuch und nicht auf einer Referenz; kein SIEM eines Herstellers wurde ausgeführt; die Namen der Erweiterungsschlüssel und ihre Zuordnung sind die Wahl dieser Crate, und die Parser zeigen nur, dass sie wie geschrieben zurückgelesen werden; der RFC-{ "5424" }-Umschlag, die Zustellung, Timeouts und der Wiederaufbau der Verbindung sind nicht abgedeckt; pycef ist ein kleiner Parser, zuletzt { "2020" } veröffentlicht, und der Logstash-Codec ist die gewichtigere Referenz.

# text
seg-51640405c9b7 = SIEM-Ereignisse der Vertrauens-Telemetrie: Log Event Extended Format (LEEF) über Syslog

# text
seg-1b3245506847 = Ereignisse bei Bandwechsel (oder je Epoche) als Nutzlasten im Log Event Extended Format { "2.0" } in einem RFC-{ "5424" }-Umschlag über UDP oder TCP, mit dokumentierter Feldzuordnung.

# text
seg-563ccb0adbe5 = WAS GEPRÜFT WIRD: die eigenen Tests dieser Crate auf exakte Zeichenketten der dokumentierten LEEF-Feldzuordnung und die Felder des RFC-{ "5424" }-Umschlags; es existiert kein gepflegter Open-Source-LEEF-Parser (eine Suche im Python-Paketindex fand keinen), daher wird das Format gegen seine eigene Spezifikation geprüft, die vom selben Autor gelesen wurde, nicht gegen eine externe Referenz. WAS NICHT: ob die LEEF-Nutzlasten von dem Parser oder SIEM irgendeines Herstellers akzeptiert werden; die Maskierungsregeln über die dokumentierten hinaus; das Verhalten eines realen Syslog-Collectors.

# text
seg-96a95b89faa5 = Integrität des Nachweispakets: Signatur, Hash-Kette und Verifikationsverfahren

# text
seg-943a853d8a4a = Ein signiertes, per Hash verkettetes Nachweispaket eines GNSS-Vertrauensereignisses: SHA-256 über jede Datei und eine Kette über das Manifest, eine Ed25519-Signatur über die exakten Manifest-Bytes und ein Verifizierer, der jeden Fehler benennt (eine geänderte, entfernte, umbenannte, vertauschte oder hinzugefügte Datei, ein umgeordnetes oder bearbeitetes Manifest, ein ohne den Schlüssel neu gehashtes Manifest, ein neu signiertes Paket, ein falscher festgelegter Schlüssel und ein Zeitstempel-Token, das entfernt, ersetzt, Müll oder über ein anderes Dokument ist).

# text
# c1: kshana evidence verify --tsa-ca
seg-0699ef2074fd = WAS EXTERN GEPRÜFT WIRD, eng gefasst: ({ "1" }) Die Ed25519-Funktionen, mit denen das Paket signiert und streng verifiziert (evidence::bundle::sign_detached, evidence::verify::verify_detached), reproduzieren die öffentlichen Schlüssel und Signaturen der Testvektoren { "1" }, { "2" }, { "3" } und { "1024" } Byte aus RFC { "8032" } Abschnitt { "7.1" } Byte für Byte, akzeptieren sie und lehnen jedes gekippte Bit von Vektor { "1" } und jedes siebte Bit der anderen sowie eine nicht kanonische Signatur S+L ab; die Vektoren werden aus dem RFC-Text geparst und von zwei unabhängigen Implementierungen (cryptography/OpenSSL und PyNaCl/libsodium) in scripts/gen_ed25519_rfc8032_ref.py reproduziert. ({ "2" }) evidence::bundle::sha256_hex, der Hash hinter jedem Paket-Hash und der Kette, reproduziert die SHA-256-Beispiele aus FIPS 180-4 (abc; die Nachricht mit 448 Bit; eine Million a), die leere Nachricht und hashlib-Digests einer Leiter von { "0" } bis { "130" } Byte über die Auffüllgrenzen hinweg, exakt. ({ "3" }) Ein Verifizierer, der in Python allein aus docs/EVIDENCE-PACKS.md geschrieben wurde (scripts/evidence_verify_cleanroom.py: hashlib und cryptography; sein Autor las keinen Rust-Code), stimmt mit dem Rust-Verifizierer auf { "71" } synthetischen intakten und manipulierten Paketen exakt überein, bei Urteil, Menge der Fehler mit Dateinamen, Signatururteil und dem aus den Dateien neu berechneten Kettenkopf und dem, den das Manifest festhält. Beim ersten Lauf stimmten { "64" } von { "71" } überein; die Abweichungen waren eine Mehrdeutigkeit der Spezifikation (Prüfung eines festgelegten Schlüssels gegen ein unlesbares Manifest), eine Abweichung der Schnittstelle der Referenz und ein unvollständig gebauter Fall; der Satz der Spezifikation wurde klargestellt, die Referenz aus dem Text neu implementiert und der Fall vervollständigt, ohne dass eine Toleranz oder Erwartung geändert wurde (festgehalten in Commit d54e14c6). WAS NICHT: Der Verifizierer ohne Kenntnis des Originals ist eine unabhängige Implementierung eines anderen Autors, keine Instanz Dritter, und teilt die Entscheidungen der Spezifikation, sodass er diese Implementierung der Regeln bestätigt, nicht die Regeln; die Vektoren validieren die Primitive, nicht den Entwurf des Paketformats. In dieser Zeile wird das RFC-{ "3161" }-Token nur auf seinen Message Imprint gelesen, und die Testtokens sind synthetisch und unsigniert; die Signatur und die Kette der Behörde werden optional (<c1/>) durch die gesonderte Zeile 'RFC { "3161" } timestamp-token signature and chain verification' verifiziert. Die Manipulationsfälle sind synthetisch. Nichts hier ist ein Rechtsgutachten zu einem Paket oder eine Beglaubigung eines Pakets.

# text
seg-c15736afcbc9 = Signatur- und Kettenverifikation von RFC-{ "3161" }-Zeitstempel-Token

# text
# c1: kshana evidence verify --tsa-ca <anchors.pem>
# c2: openssl ts -verify
seg-cd64bbf39459 = evidence::tsa::verify_token und optional <c1/> für die timestamp.tsr eines Pakets: eine RFC-{ "3161" }-TimeStampResp oder ein reines TimeStampToken (CMS SignedData über eine TSTInfo), offline gegen vertrauenswürdige Anker geprüft, so wie <c2/> es prüft: der Inhaltstyp der signierten Attribute und der Message Digest über die TSTInfo; die Signatur über die signierten Attribute (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 und P-384; öffentliche RSA-Operationen auf crypto-bigint); der ESS-Signing-Certificate-Hash v1 (SHA-1) oder v2, der das Signierzertifikat benennt, gefunden unter den nicht vertrauenswürdigen Zertifikaten des Tokens und des Aufrufers; die kritische, einzige erweiterte Schlüsselverwendung timeStamping des Signierers; die Kette zu einem vertrauenswürdigen selbst ausgestellten Anker mit der Signatur, dem CA-Status und der Schlüsselverwendung jedes Zertifikats, wobei jedes Zertifikat zur genTime des Tokens gültig ist; und der Message Imprint gegen die Daten. Nicht geprüft: Sperrung (CRL, OCSP), Namens- und Richtlinienbeschränkungen, die Nonce

# text
# c1: openssl ts -verify -attime genTime
# c2: openssl cms -verify -cades -purpose timestampsign
seg-d305c442506d = OpenSSL { "3.0.13" } (<c1/> und <c2/> plus der TSTInfo-Imprint für RSA-PSS-Tokens), ausgeführt von tests/fixtures/evidence_tsa/run_openssl.sh auf den { "27" } Fällen von cases.tsv: RSA PKCS#1 v1.5 mit SHA-256 und SHA-512 sowie ESS v1 und v2, eine ECDSA-P-384-Wurzel über einem P-256-Zwischenzertifikat und P-256- und P-384-TSAs, RSA-PSS, ein Token ohne das Signierzertifikat mit und ohne dessen Bereitstellung, mit CAdES signierte Tokens, ein gekipptes Signaturbyte (drei Algorithmen), eine geänderte TSTInfo (zwei), eine gekippte Signatur des Zwischenzertifikats, ein ESS-Zwillingszertifikat, falsche Anker (vier), ein abgelaufenes TSA-Zertifikat, eine nicht kritische und eine falsche erweiterte Schlüsselverwendung und falsche Daten (drei). Vorregistriert in tests/fixtures/evidence_tsa/PREREGISTRATION.md (allein committet, 30ad70b2, bevor der Verifizierer existierte; die Urteile von OpenSSL danach erneut ausgeführt, byteidentisch). Erster Lauf: Alle { "27" } Urteile stimmen überein (B1), und jede genTime stimmt auf die Sekunde überein (B2). Geltungsbereich, eng gefasst: selbst erzeugte Testzertifikate und -tokens, hergestellt von demselben OpenSSL, das sie beurteilt; OpenSSL ist eine unabhängige Implementierung, keine Zeitstempelbehörde; das Token keiner öffentlichen Behörde ist eingebunden (freetsa.org nennt keine Lizenz). Nichts hier beglaubigt irgendeinen echten Zeitstempel

# text
seg-c04042b0270a = Störungsschwellen des Empfänger-Vertrauens, kalibriert am JammerTest-Datensatz { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: die vorab registrierte Kalibrierung der Monitore für C/N0-Abfall, AGC und Jamming-Indikator am öffentlichen JammerTest-Datensatz { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, zur Laufzeit geladen, nie mitgeliefert): pro Ordner eine Zeitreihe von { "1" } s aus mon_rf.csv und rinex.csv, die Monitore laufen einmal, jede Epoche nach der Kalibrierung wird anhand des attack_log des Ordners als ungestört oder Jamming gekennzeichnet (von CEST nach UTC verschoben, Schutzzeit von { "60" } s), jede Schwelle wird über ein festes Raster durchgefahren, es wird die kleinste Schwelle gewählt, deren gepoolte Fehlalarmwahrscheinlichkeit bei ungestörten Epochen höchstens { "0.01" } beträgt, dazu Zählungen mit zurückgehaltenem Ordner (Leave-one-folder-out) und eine Gegenprüfung mit einem UBX-Leser. Die Auswahl wird nur als optionales Profil [monitors] profile = "jammertest-2024-calibrated" ausgeliefert (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); die Standardregel und jede Ausgabe ohne das Profil bleiben unverändert

# text
seg-3ccd1b09ad09 = Die veröffentlichten Ereignisprotokolle des Datensatzes (attack_log-Fenster) als Ereigniswahrheit, unter der Vorregistrierung xval/jammertest-trust/PREREGISTRATION.md (allein eingecheckt, 0fa012b, bevor das Prüfgerüst lief). Erster und einziger Lauf (xval/jammertest-trust/RESULTS.md): { "14" } von { "24" } Ordnern auswertbar ({ "7" } mit Jamming), { "3,502" } ungestörte und { "9,560" } Jamming-Epochen. Fehlalarmwahrscheinlichkeit bei ungestörten Epochen mit zurückgehaltenem Ordner: cn0_drop_db { "0.0231" } (81/3502) gegen einen Zielwert von { "0.02" }, FAIL; agc_k_sigma { "0.0003" }, bestanden; jam_ind_threshold { "0.0094" }, bestanden; Vereinigung der drei: Fehlalarme { "0.0328" }, Erkennung { "0.807" } gegen { "0.05" } und { "0.50" }, bestanden. Nach der registrierten Regel ist die Zeile MODELLED (ein Zielwert verfehlt). Eng gefasst: ein Empfängertyp (u-blox ZED-F9P), ein Ereignis, planmäßige Ein-Minuten-Zeitfenster als Wahrheit (Erkennung ist eine untere Schranke; ungestört heißt außerhalb der protokollierten Fenster); kalibriert an den CSV-Protokollen, und der UBX-Leser liefert bei zwei Ordnern mehr Fehlalarme. Die Vertrauenswert-Bänder für die Seefahrt sind nicht kalibriert

# text
seg-4d866b62d4f7 = Mengeninklusion: Das Verhältnis von Störer zu Signal geht als einheitlicher Dezibel-Versatz ein, sodass die erfasste Menge bei höherer Sendeleistung die Menge bei niedrigerer enthält und der Anteil nur steigen kann -- eine Eigenschaft, die das Airy-Muster in Strahlbreite oder Höhe NICHT liefert, wo die erfasste Region in Ringe zerfällt und der Anteil echt nicht monoton ist. Keine veröffentlichte Tabelle gibt den erfassten Scheibenanteil eines Mond-Orbitalsenders gegenüber Höhe und Strahlbreite an, daher gibt es nichts Externes, gegen das diese Zellen geprüft werden könnten; das darunterliegende Muster ist separat gegen veröffentlichte Bessel-Werte validiert und behält seine eigene Zeile

# text
seg-76da58fe670a = Keine externe Referenz: Das Paket verknüpft Hashes und eine Bewertung des Empfängerprotokolls (MODELLED), geprüft an synthetischen Daten (die exportierten NMEA-Daten eines mitgelieferten Szenarios, behandelt als Protokoll des Empfängers). Ein Laborlauf wird nicht behauptet

# text
seg-bed2679f88e5 = Identitäten in geschlossener Form und interne Konsistenz; es wird KEINE externe Referenz beansprucht. Der Halbwinkel des Horizonts wird gegen asin(R_earth/r_orbit) geprüft und die Geometrie gegen ihn; die Freiraumdämpfung, der DOP-Kern und die SGP4-Propagation, die dies zusammensetzt, sind jeweils in ihren eigenen Zeilen extern validiert, und diese Zeile leiht sich ihren Status nicht. WARUM MODELLED, und es ist das Sendemuster: Der Gewinn beim Winkel ist eine gleichmäßig ausgeleuchtete kreisförmige Apertur, das Airy-Muster, während eine reale GPS-L1-Antenne eine zwölfelementige Wendelgruppe mit einer geformten Hauptkeule ist, deren Maximum außerhalb der Boresight liegt, um die Leistung über die Erdscheibe auszugleichen, und deren Nebenkeulen nicht dem Airy-Muster folgen. Veröffentlichte gemessene Muster existieren und sind hier nicht eingebunden, daher tragen Reihenfolgen und Größenordnungen, während die dB eines einzelnen Satelliten es nicht tun. EINE ERSTE IMPLEMENTIERUNG DIESER ZEILE WAR AUF EINE WEISE FALSCH, DIE ES WERT IST FESTGEHALTEN ZU WERDEN: Der Airy-Ausdruck gilt nur in der Vorwärtshalbkugel, sein Argument verläuft mit sin(theta), und bei theta nahe { "180" } Grad schlägt er um und liefert VOLLEN BORESIGHT-GEWINN hinter der Apertur — so waren die beiden stärksten Verbindungen im ersten Bericht Satelliten, die ihre Antennen vom Mond weg richteten, und sie waren die einzigen beiden, die die Schwelle überschritten. Hinter der Apertur wendet das Modell nun einen flachen Rückkeulenboden an, der als Schranke angegeben wird und nicht als erfundene Musterform. Bewusst abwesend, und jedes davon macht das Budget OPTIMISTISCH: kein ionosphärischer oder troposphärischer Verlust auf den den Rand streifenden Strahlen, kein Polarisations-, Ausrichtungs- oder Implementierungsverlust und eine kugelförmige Erde ohne refraktive Erweiterung. Die Mondposition ist eine EINGABE und kein Ephemeridenabruf, weil die geprüfte Größe die Verbindung und die Strahlgeometrie ist. Diese Zeile auf validiert hochzustufen erfordert ein gemessenes Sendemuster und LuGRE-Normalpunkte zum Prüfen; keines von beiden ist im Repository, und keines wird hier erfunden. { "0.30" } Runde { "2" }, ein Befund (bleibt MODELLED): Ein Verbindungspfad mit gemessenen Eingaben (reale SP3-Positionen, Sendeleistung je Block, tabellierte Sende- und Empfangsmuster, Hysterese bei Akquisition und Nachführung) wurde gegen Montenbruck et al. { "2023" } Tabelle { "3" } für GENESIS bei { "6000" } km geprüft (vorregistriert 5b414f0a): Die Mittelwerte der Zenitantennen stimmen bei { "5" } von { "6" } innerhalb von einem dB mit der Empfindlichkeit der Veröffentlichung überein; die Mittelwerte der Nadirantennen liegen um { "1.0" } bis { "2.4" } Satelliten höher als gedruckt, plausibel weil die Veröffentlichung azimutabhängige GPS-Nebenkeulenmuster verwendete, die nicht veröffentlicht sind. Die Werte für Mondentfernung dieser Zeile verwenden weiterhin den Airy-Ersatz. { "0.30" }+ D7, ein Befund (bleibt MODELLED): Die neu gefasste Größe, die C/N0-DIFFERENZ zwischen Satelliten der Blöcke IIR/IIR-M, die in einer Epoche nachgeführt werden, vorhergesagt mit den gemessenen L1-Mustern je SVN von NAVCEN (zweidimensional, Gier-Lenkungsrahmen) gegen das C/N0 des LuGRE-Flugs (vorregistriert 768cb62b: { "99" } % sichtbar, Paar-RMS <= { "3.0" } dB, Median <= { "2.0" } dB, mindestens { "50" } Datensätze und { "30" } Paare), hat zu wenig Daten: Die { "26" } qualifizierenden Transit- und Mondbahnepochen enthalten { "15" } nachgeführte IIR/IIR-M-Datensätze (meist werden IIF und III nachgeführt) und ein Paar. Alle { "15" } werden als sichtbar vorhergesagt, und das Residuum des einzelnen Paars beträgt -0.06 dB; nichts wird beansprucht

# text
seg-c69fd3fc645b = Drei unabhängige maßgebliche Ephemeriden — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — abgetastet über IMCCE calceph, kreuzgeprüft durch eine unabhängige numpy-SVD-Kleinste-Quadrate-Anpassung. WARUM DIES validiert IST, WO lunar_common_mode ES NICHT IST, auf denselben drei Ephemeriden: Hier IST die berichtete Größe eine Eigenschaft der veröffentlichten Daten — ihrer gegenseitigen Abweichung —, die Ephemeriden sind also die unabhängige Referenz, keine Eingabe. In lunar_common_mode speist dieselbe Abweichung eine als MODELLED eingestufte Konstellationsgeometrie, und die Antwort ist eine Eigenschaft dieses Modells; deshalb ist diese Zeile zu Recht Modelled/ReferenceImpl.

# text
seg-d9ea966abdd6 = Keine externe unabhängige Referenz für die Szenarioergebnisse: Jeder Paket-Test führt eine Szenarioart aus, die MODELLED ist. Die Zielwerte sind das angegebene Profil des Paketautors (das DHS-Rahmenwerk nennt keine Werte; die Genauigkeitsgrenzen der IMO sind Tabelle C-1 von MSC.1/Circ.1575, vollständig gelesen; das ICAO-Paket folgt der eigenen Präsentation der ICAO zum RFI Mitigation Plan, weil Doc { "9849" } eine kostenpflichtige Veröffentlichung ist und nicht gelesen wurde), festgeschrieben vor jedem bewerteten Lauf in PREREGISTRATION.md-Dateien im Stil von xval unter standards/. Ein Zielwert mit MET besagt, dass ein modelliertes Szenario einen angegebenen Zielwert erfüllt hat, nichts über ein Produkt

# text
seg-f7457156f960 = Interne Konsistenz gegenüber den eigenen Vorwärtsfunktionen der Engine, was diese Fähigkeit ehrlicherweise allein beanspruchen kann. Jeder Konturpunkt ist eine Umkehrung in geschlossener Form, und jede Umkehrung wird geprüft, indem ihre Antwort durch die VORWÄRTSFUNKTION zurückgegeben wird, mit der die eigenen Zeilen des Berichts bewertet wurden: die Spalte J/S durch jamming::effective_cn0_dbhz (das tracking_threshold_dbhz auf < { "1e-9" } dB-Hz liefern muss), die Spalte des Abstands durch jamming::free_space_path_loss_db und jamming::j_over_s_db (dasselbe J/S auf < { "1e-9" } dB), die Spalte EIRP durch jamming::j_over_s_db beim eigenen Abstand des Szenarios. Die Kontur wird außerdem als die GRENZE der Sperrmenge geprüft und nicht als ein Punkt in ihr — lock_status verliert die Synchronisation bei einer strikten Ungleichung, daher wird gemessen, dass das Urteil über { "1e-4" } dB J/S beiderseits der Kontur von DEGRADED auf LOST kippt, was eine um ein Epsilon verschobene Kontur nicht bestehen würde. Die stärkste Prüfung erfolgt je Verbindung statt je Quantil: Die Anwendung derselben Abbildung auf das eigene C/N₀ jeder Zeile reproduziert die Statuspalte des Berichts exakt — { "0" } Abweichungen bei { "38" } von { "38" } Zeilen am dokumentierten Arbeitspunkt (kind = lunar-jamming, jede Eingabe auf Standard außer jammer.range_m = { "25 000" } m), wo { "26" } Zeilen LOST sind und { "12" } nicht. Monotonie wird gemessen, nicht angenommen: { "20 001" } Stichproben über [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } Verletzungen eines streng fallenden Abstands und einer streng steigenden erforderlichen Leistung, sodass die Quantilreihenfolge des Bandes gezeigt statt behauptet wird. ExternalDataset wird abgelehnt und damit auch Validated: Es gibt keine gemessene Kampagne zu Mond-Jamming, gegen die ein Sperrradius verglichen werden könnte, die Konstellation ist eine illustrative Geometrie der Klasse Moonlight/LCNS aus öffentlichen Quellen und keine geflogene Ephemeride, und die Eingaben der Kontur (EIRP, Jammerleistung, Antennengewinne, Rauschtemperatur) sind repräsentative Größenordnungen. ReferenceImpl wurde ebenfalls erwogen und abgelehnt — der inverse und der Vorwärtsausdruck sind dieselbe Algebra, in zwei Richtungen gelesen, sodass der Hin-und-zurück-Test Übertragungs- und Vorzeichenfehler findet, aber keine unabhängige Implementierung ist; ihn als Gegenprüfung zu bezeichnen, wäre der Zug der geborgten Unabhängigkeit, den die Invarianten der Matrix verhindern sollen. Was das Band bringt, wird gemessen und beziffert statt behauptet: Am Arbeitspunkt beträgt die Kontur mit einem einzelnen Skalar { "27.402916" } km und legt { "25" } km für alle { "38" } Zeilen auf die gesperrte Seite, während das Band { "21.256108" } .. { "29.921360" } km den Arbeitspunkt enthält und daher die Aufteilung berichtet, die die Tabelle tatsächlich zeigt. Es wird auch gemessen, dass die beiden Kriterien voneinander abweichen — das Band nach Leistungsverhältnis ({ "38.186527" } .. { "53.691675" } km) enthält { "25" } km überhaupt nicht —, weshalb beide ausgegeben werden

# text
seg-8191906fc700 = Zwei etablierte Implementierungen Dritter zusammengesetzt, beide offline ausgeführt, mit dem Fixture, das von Anfang bis Ende neu erzeugt und als byteidentisch verifiziert wurde. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), Commit 71db0ff, src/rtkcmn.c aus dem C-Quelltext mit -ULAPACK übersetzt: lsq() → matinv() → ludcmp()/lubksb() invertiert die Normalmatrix durch Crout-LU mit partieller Pivotierung, ein Algorithmus, der nichts mit dem handgeschriebenen Gauß-Jordan-invert4() von kshana zu tun hat; numpy.linalg.inv (LAPACK getrf/getri) invertiert jede davon als dritte unabhängige Inverse erneut und stimmt mit RTKLIB auf { "1.112e-12" } relativ überein. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) liefern norm.isf, norm.sf (Cephes ndtri/ndtr) und optimize.brentq gegen die Inkomplette-Gamma-Reihe nach Numerical Recipes, die per Bisektion gebildete Inverse und die 200-Schritt-Bisektion von kshana — und das direkte sf von SciPy ist ein anderer numerischer Weg in den fernen Rand als das { "1" } − Φ von kshana, sodass die Auslöschung im tiefen Rand gemessen und nicht gespiegelt wird. Die vertikale Achse ist der radiale Einheitsvektor (die Definition der lokalen Vertikale auf einem sphärischen Mond), und die horizontale Varianz ist die Spur des horizontalen Blocks, sodass keine Ost/Nord-Azimutkonvention gemeinsam verwendet wird. DIESE ZEILE VALIDATED AUSDRÜCKLICH NICHT: σ_URE, der Fehler-Prior je Satellit und die illustrative Konstellation der Klasse Moonlight/LCNS sind MODELLED Eingaben, die der Referenz wie gegeben übergeben werden; und die FORM der MHSS-Integritätsgleichung für Einzelfehler ist aus derselben veröffentlichten Schranke abgeschrieben, die kshana implementiert — eine gemeinsame geschlossene Form ist eine gemeinsame Annahme, daher deckt diese Zeile eine falsche Auswertung dieser Gleichung ab, nicht ihre falsche Wahl. Es ist keine MHSS-ARAIM-Implementierung eines Dritten erreichbar (RTKLIB bietet keinen Einstiegspunkt für Schutzniveaus, eine solche PyPI-Distribution existiert nicht, Stanford MAAST ist MATLAB), was die ausstehende Aufwertung ist

# text
seg-aae487789add = NASA/USGS SRTM v3 (1 Bogensekunde) Kachel N36W117 — PUBLIC-DOMAIN-Höhendaten der US-Regierung aus dem offenen AWS-Spiegel elevation-tiles-prod, auf 6 Bogensekunden ausgedünnt und unter tests/fixtures/terrain/ eingecheckt (siehe NOTICE.md), dazu Ausschnitte in voller Auflösung von N36W117 und N36W119, knotenweise gegen den unabhängigen SRTMHGT-Leser von GDAL und die Vermessungs-Benchmarks Mount Whitney ({ "4421" } m) und Badwater (−{ "86" } m) geprüft. Der dokumentierte Benchmark Badwater Basin (−{ "86" } m, tiefster Punkt Nordamerikas) verankert das georeferenzierte Lesen. Die Geländeabgleich-/TERCOM-Navigationslösung, die das DEM verwendet, bleibt modelliert (eigene Zeile Alternatives/ergänzendes PNT)

seg-69c56cbdda90 = { "92" } von { "92" } Arten, { "3300" } von { "3300" } numerischen Feldern

seg-2fd8f2df3e6e = Die { "61" } Fähigkeitskarten aus <c1/>, danach alle { "401" } Zeilen der Verifikationsmatrix.

seg-65185cb68d6b = Fehlerbudget für Navigation und Zeitgebung einer Kette von Missionsphasen vom Start bis zum Wiedereintritt (<c1/>)

seg-86a132e1a243 = Die Art <c1/>: ein Dokument aus Phasen, jede eine von acht registrierten Arten, der Reihe nach ausgeführt, wobei die 6x6-Kovarianz, die Uhr und das Bezugssystem nach einer genannten Regel weitergegeben werden (<c2/>; <c3/>, weißes Beschleunigungsrauschen über eine genannte Lücke bei einem geradlinigen Modell; <c4/>, Koppelnavigation, dann die Quellgrenze, nie darunter, nie ein Zurücksetzen); Umrechnungen der Bezugssysteme GCRF, MCI und MCMF und der Zeitskalen über TT, jede mit eigener Budgetzeile, wobei der Zustand des Mondes aus einem optionalen DE440-Kernel-Ausschnitt stammt und die analytische Reihe als genannter Ersatz dient; die Marge gegenüber einer genannten Anforderung, das schwächste Glied, die Ereignisse und eine Zeitleistengrafik. Jede Zahl ist eine genannte Eingabe oder ein Modell einer solchen

seg-cf8a0dc4088e = Handrechnungen in den Tests (das geradlinige Kovarianzwachstum, die mittlere siderische Rotation, die säkulare Mondtaktrate) und, nur für den Zustand des Mondes, die eingecheckten DE440-Kernel-Ausschnitte gegen festgelegte JPL-Horizons-Werte (schlechtester Wert { "2.6" } m und { "7e-6" } m/s). Es werden keine Missionsdaten mit der Kette verglichen; ihre Phasen sind eigene Zeilen. Das Dokument ist eine genannte Kette mit ILLUSTRATIVE Eingaben, nur öffentlichen Quellen und ohne Billigung durch eine Agentur

seg-87b2b2459b45 = Start und Aufstieg in eine Parkbahn mit GNSS-Erfassung und -Abschwächung (<c1/>)

seg-725e7ce83533 = Die Phase <c1/>: eine Positions- und Geschwindigkeitskovarianz bei konstanter Geschwindigkeit mit weißem Beschleunigungsrauschen (die Güte der Koppelnavigation), eine GNSS-Lösung genannter Genauigkeit, die nach der Erfassungszeit und außerhalb genannter Abschwächungen angewandt wird, eine Uhr mit Bias und Drift, die von denselben Lösungen geführt wird, und der Zustand beim Einschwenken in die Parkbahn

seg-22e5c301626e = Der stationäre Riccati-Zustand und die Handrechnung der Vorhersage in den Tests. Nichts hier modelliert eine Trägerrakete oder einen Empfänger; jede Zahl ist eine genannte Eingabe

seg-eb66a49b0306 = Relativnavigation bis zur Andockhülle in niedriger Erdumlaufbahn über Sensorabschnitte (<c1/>)

seg-658a0448d80d = Die Phase <c1/>: der Relativzustand in den LVLH-Achsen des Ziels mit dem geschlossenen Clohessy-Wiltshire-Übergang, eine 6x6-Kalman-Kovarianz mit weißem Beschleunigungsrauschen und Positionsaktualisierungen, deren Varianz die des Sensors bei der aktuellen Entfernung ist, über Abschnitte eines genannten Sensors (ILLUSTRATIVE Formen für optische Kamera, Lidar und Funkentfernungsmessung); das Andockfenster ist die Zeit ab dem Punkt, an dem das relative Sigma innerhalb der Fanghülle bleibt, bis zum Ende der Phase. Die absolute Kovarianz des Verfolgers wird unverändert weitergegeben, und eine Zeile sagt das

seg-97f4aa0575e6 = Eine einachsige Handrechnung von Vorhersage und Aktualisierung im Test; der Clohessy-Wiltshire-Übergang ist derjenige, den cw_dynamics gegen eine unabhängige numerische Integration prüft. Die Sensoren sind ILLUSTRATIVE, und es wird kein reales Rendezvous verglichen

seg-b45a8a357faf = Translunare Injektion und cislunarer Flug: fortgeschriebener Mittelwertzustand und Kovarianz mit Tracking-Aktualisierungen (<c1/>)

seg-ab5c79789754 = Die Phase <c1/>: der Mittelwertzustand durch den Cowell-Propagator der Engine (Erde als Punktmasse und J2, Sonne und Mond als dritte Körper, der Mond aus dem DE440-Kernel des Strangs, wo dieser das Segment abdeckt, und die Sonne aus der analytischen Reihe); die Kovarianz durch eine Zustandsübergangsmatrix aus Vorwärtsdifferenzen dieser Fortschreibung (der nominale Lauf und sechs gestörte Läufe je Segment) mit weißem Beschleunigungsrauschen; die Größe und der Richtungsfehler des TLI-Manövers; <c2/>-Lösungen, deren Verfügbarkeit und PDOP aus dem Sweep des Raumdienstvolumens entlang einer oskulierenden Bahn stammen, die den Bogen vertritt; Entfernungs- und Entfernungsratenverfolgung entlang der geozentrischen Richtung, skaliert mit der Einsatzdauer des Bodennetzes, mit der Aktualisierung in Joseph-Form

seg-86dae517e339 = Der Satz von Liouville (die Determinante der Zustandsübergangsmatrix des konservativen Anteils ist eins) und eine feinere Differenz in den Tests; der Mittelwertzustand wird in der Zeile darunter mit einer öffentlichen Trajektorie verglichen, die er verfehlt. Der Manöverfehler, die Aktualisierungen und die Kovarianz werden mit nichts verglichen

seg-7a3eb4fae324 = Kovarianz an der Eintrittsschnittstelle, Korridorwahrscheinlichkeit, Spitzenverzögerung und Landeellipse (<c1/>)

seg-93f07906d7bf = Die Phase <c1/>: der Rückflug von <c2/> ohne Manöver bis zur Eintrittsschnittstelle; der Bahnneigungswinkel und sein Sigma aus der vollen Kovarianz durch einen Differenzengradienten; die Wahrscheinlichkeit, dass der Winkel innerhalb eines genannten Korridors liegt; die Spitzenverzögerung beim nominalen Winkel und an beiden Korridorrändern aus dem ebenen ballistischen Punktmasse-Wiedereintritt der Engine (Abprallen erkannt) neben der geschlossenen Allen-Eggers-Form; die Landeellipse aus einer genannten Reichweitenempfindlichkeit und der Schnittstellenkovarianz quer zur Bahnebene. Auftrieb, Lenkung und Erwärmung werden nicht modelliert

seg-8d5695aad35b = Handrechnungen in den Tests (das Sigma des Winkels ist das senkrechte Geschwindigkeitssigma geteilt durch die Geschwindigkeit; die Gauß-Masse in einem Korridor). Der ebene Wiedereintritt ist der eigene der Engine, und die Allen-Eggers-Form ist ein Vergleich in geschlossener Form; kein geflogener Wiedereintritt wird verglichen

seg-3f0951532f6e = Abdeckung des Bodennetzes und Verfolgungsdauer für eine Phase des Strangs (<c1/> von <c2/>)

seg-5204af351299 = Die Überlagerung des Bodennetzes: Stationen mit einer Mindesthöhe, die Sichtbarkeit des Fahrzeugs bei einer genannten Geometrie (der Eintrittszustand, zweikörperig mit J2 geflogen, die Position des Mondes für den Flug oder eine genannte Einsatzdauer), Stationsübergaben, die je eine genannte Zeit verlieren, und die daraus folgende Einsatzdauer, die an die Aktualisierungsrate der Bodenverfolgung der Phase weitergegeben wird; das längste Intervall ohne Station in Sicht ist eine Budgetzeile

seg-0d1d229a3ab7 = Prüfungen der Geometrie von Zenit und Antipode und die erwartete Sichtbarkeit eines fernen Ziels in den Tests. Es werden kein reales Netz, keine reale Antenne und kein realer Zeitplan modelliert

seg-4ba700726208 = Relativnavigation bis zum Andocken in einer Mondumlaufbahn (<c1/>)

seg-2e30e78e49f7 = Die Art und Phase <c1/>: eine gemeinsame Gauß-Newton-Batchschätzung zweier Fahrzeuge über den Bogen (einundzwanzig Parameter: beide Zustände und beständige Positionsbiase im Signalraum, gemeinsame und unabhängige), über ein Viertel, die Hälfte und den ganzen Bogen mit Schrittweitenhalbierung ausgebaut, aus einer absoluten Lösung je Fahrzeug (Schranke der AFS-Pilotcodeverfolgung, ILLUSTRATIVE Relaisgruppe) und einer Querverbindungsentfernung, unter dem Mondkraftmodell des Crates; der mittlere normierte quadrierte Schätzfehler, die Clohessy-Wiltshire-Prüfung auf einer Kreisbahn und die weitergegebene 6x6-Kovarianz

seg-09fa0c35d004 = Selbstkonsistenz unter einer Vorregistrierung (xval/mission-thread-lunar/PREREGISTRATION.md, Ergebnisse und die Geschichte der Schätzer in RESULTS.md): Der mittlere NEES des Relativzustands beträgt { "5.85" } bis { "5.93" } gegenüber dem Band { "5.2" } bis { "6.8" } in vier Konfigurationen, MET beim vierten Schätzerentwurf, nachdem drei Entwürfe mit sequentiellem Filter verfehlt wurden; die Wahrheit und der Schätzer teilen ein Kraftmodell, daher sagt dies nichts über Modellfehler aus. Der gemeinsam genutzte Propagator wird in einer Zeile darunter mit LRO und CAPSTONE verglichen

seg-c85d7e5e63a3 = Landestreuungsbudget an einem Standort am Mondpol (<c1/>)

seg-bd88ab3ad105 = Die Art und Phase <c1/>: ein inertiales Fehlermodell mit fünf Zuständen je Achse (Position, Geschwindigkeit, Beschleunigungsmesser-Bias, Neigung, Kreisel-Bias) über einen angetriebenen Abstieg, gestützt durch AFS-Lösungen (eigenständig oder differenziell, mit dem uhrgestützten Fall mit drei Relais), eine geländerelative Lösung (der Terrain-Nav-Abgleicher der Engine auf synthetischem Relief oder eine Cramer-Rao-Schranke auf einem LOLA-DEM mit einer Blendenproblem-Regel) und Mondzeit, mit einer Monte-Carlo-Aufsetzellipse

seg-a5ddb83a5cf1 = Die geschlossene inertiale Drift, die eigenen Ergebnisse der wiederverwendeten Arten und die Kalibrierung der 3-Sigma-Ellipse (der Anteil darin stimmt mit seiner Erwartung überein) in den Tests. Keine geflogene oder getestete Landung wird verglichen

seg-8dfc1600cf8c = Positionierungs- und Zeitgebungsverfügbarkeit an der Oberfläche nach Standort und Jahreszeit an den Mondpolen (<c1/>)

seg-f91c1da9ab55 = Die Art und Phase <c1/>: Relaisverfügbarkeit und PDOP, Erd- und Sonnensichtbarkeit und eine geführte Oberflächenuhr für jeden Standort und jede Jahreszeit, mit dem Geländehorizont von <c2/>; ein Lauf an einem einzelnen Standort ist bitgenau gleich der Verfügbarkeit und dem PDOP dieser Art

seg-e3a782dce8be = Exakte Gleichheit mit der bestehenden Art für einen Standort sowie Monotonieprüfungen in den Tests. Die Relaisgruppe ist ILLUSTRATIVE, und keine Oberflächenmessung wird verglichen

seg-0db91d70a079 = Angetriebener Aufstieg von einem Standort am Mondpol in eine Einschwenkbahn (<c1/>)

seg-b5b1125d515c = Die Art und Phase <c1/>: das inertiale Fehlermodell mit fünf Zuständen je Achse über einen angetriebenen Aufstieg mit spezifischer Kraft entlang des Pfads, gestützt durch AFS-Lösungen und Mondzeit, mit Angabe der in die Umlaufbahn getragenen Positions- und Geschwindigkeitskovarianz beim Einschwenken und der Streuung beim Triebwerksabschalten (angegeben, nicht weitergetragen)

seg-76e0d23b7483 = Die geschlossene inertiale Drift und Monotonieprüfungen in den Tests. Kein geflogener Aufstieg wird verglichen

seg-1983ce9cc6da = Die Fortschreibung mit dem Mondkraftmodell gegen öffentliche rekonstruierte Trajektorien von Mondorbitern und cislunaren Flugkörpern

seg-57f53a7d1fa2 = Der von den Mondarten gemeinsam genutzte Propagator (GRAIL GL0660B Grad und Ordnung { "150" }, Erde und Sonne als dritte Körper, Relativität, DE440-Mondorientierung), verglichen mit den öffentlichen JPL-Horizons-Trajektorien von LRO ({ "24" } h, Stichproben im Abstand von { "10" } Minuten) und CAPSTONE (ein Umlauf von { "6.5" } Tagen, Stichproben im Stundenabstand), unter Zielwerten, die vor dem Lauf in einer eingecheckten Datei festgelegt wurden

seg-321d0721970d = JPL-Horizons-Ephemeriden der Raumfahrzeuge LRO und CAPSTONE, gegen Zielwerte, die in xval/mission-thread-lunar/PREREGISTRATION.md vorab festgelegt wurden (Änderungen { "1" } bis { "6" }). LRO: MET, { "33" } m größte 3D-Differenz und { "2.4" } m RMS radial gegenüber { "500" } m und { "60" } m. CAPSTONE: NOT MET, eine Differenz der Endposition von { "136.8" } km gegenüber { "25" } km und eine Perilundifferenz von { "28.4" } km gegenüber { "10" } km, die Ursachen nicht isoliert. Die Zeile ist modelliert, weil der CAPSTONE-Zielwert verfehlt wird und der Vergleich den gemeinsam genutzten Propagator prüft, nicht einen Filter, ein Signal oder ein Budget

seg-c557d317389a = Die cislunare Mittelwertfortschreibung gegen die öffentliche Trajektorie von Artemis I (<c1/>)

seg-539d4c3e9b56 = Die Mittelwertfortschreibung der Phase <c1/> (Cowell, Erde als Punktmasse und J2, Sonne und Mond als dritte Körper, der Mond aus einem DE440-Ausschnitt), verglichen mit der öffentlichen JPL-Horizons-Trajektorie von Artemis I über einen Freiflugbogen von { "72" } h ab 2022-11-16 { "18" }:{ "00" } TDB, in Epochen im Abstand von { "12" } Stunden, unter Zielwerten, die vor dem Lauf in einer eingecheckten Datei festgelegt wurden

seg-362b1a7b9e5e = JPL-Horizons-Ziel -1023 (die tatsächlich geflogene Post-TLI-Trajektorie der NASA-Navigation), gegen Zielwerte, die in xval/mission-thread/PREREGISTRATION.md vorab festgelegt wurden (Änderung { "1" } ändert nur die angeforderte Zeitspanne). NOT MET und als verfehlt festgeschrieben: { "45.3" } km größte Positionsdifferenz gegenüber { "5" } km und { "0.249" } m/s Geschwindigkeitsdifferenz bei { "72" } h gegenüber { "0.05" } m/s. Eine nach dem Urteil geschriebene Diagnose verortet die Verfehlung in fünf impulsiven Geschwindigkeitsschritten von { "0.09" } bis { "0.22" } m/s in der Referenz (die vorab festgelegte Annahme, dass das Fenster kein Manöver enthielt, war falsch); über die übrigen { "67" } Stunden gibt das Modell den jeweils nächsten Stundenzustand mit einem Median von { "0.38" } m wieder. Prüft nur den Mittelwertzustand eines einzelnen Freiflugbogens: keine Kovarianz, keinen Filter, keine Aktualisierung und keine andere Phase

seg-150ae9c3d755 = Region einer Störquelle: eine zulässige Senderregion aus Positionsmeldungen von Flugzeugen und Schiffen

seg-b5c49044a7a1 = Eine zulässige Region dafür, wo sich eine Quelle gestörter Navigationsmeldungen befinden kann, aus ADS-B- (NIC/NACp) oder AIS-Positionsmeldungen: Funksicht bei einem 4/3-Erdradius aus der Meldehöhe und einem Höhenbereich der Senderantenne, eine begrenzte effektive Reichweite für die unbekannte Leistung, wobei betroffene Einheiten die Posterior zu ihrer Reichweite ziehen und unbetroffene Einheiten mit Funksicht dagegen drücken, gruppiert zu Sitzungen in Zeit und Raum. Die Ausgabe sind Regionen höchster Dichte bei genannten Konfidenzniveaus, ein Posterior-Schwerpunkt mit einer Momentellipse, Beginn, Ende und Dauer der Sitzung, betroffene Fläche und Anzahl unterschiedlicher Flugzeuge über dem Veröffentlichungsminimum, ein Tagesgangprofil und Stunden pro Tag. Geländefrei; eine einzelne Quelle je Sitzung; die Glaubwürdigkeit hängt vom Modell ab. Optionale Fusion mit einer TDOA-Lösung aus der Geolokalisierung.

seg-953a8b4f9f41 = Noch keine externe. Nur synthetische Vorwärts-Rückwärts-Rundläufe aus einem Generator, der das Modell des Schätzers teilt; sie prüfen also den Code und die Kalibrierung der genannten Niveaus unter diesem Modell und nichts über reale Sender. Eine externe Prüfung gegen die veröffentlichten Senderstandorte des Jammertests { "2025" } wurde vorab festgelegt (docs/emitter-region/PREREGISTRATION.md, vom Eigentümer vor jedem bewerteten Lauf freigegeben) und einmal ausgeführt (docs/emitter-region/RESULTS.md): ADS-B NICHT BEURTEILBAR ({ "2" } geplante Sitzungen, weniger als das registrierte Minimum von { "4" }) und AIS NICHT BEURTEILBAR (keine veröffentlichte Sitzung), sodass kein Zielwert getestet wurde und die Zeile MODELLED bleibt
