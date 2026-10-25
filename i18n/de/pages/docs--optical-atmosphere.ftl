# docs--optical-atmosphere: translations (de)

# text
seg-6cb7a787ac67 = Referenzen

# text
seg-1c6199627b90 = Daten

# text
seg-ad856ad710eb = Status

# text
seg-53a7343c076e = Aussage

# text
# c1: docs/OPTICAL-ATMOSPHERE.md
seg-508588352e96 = Quelle: <c1/>

# text
seg-333a1114746a = Optisches PNT durch die Atmosphäre

# text
# c1: optical-atmosphere
seg-47118f54f060 = Der Szenariotyp <c1/> beantwortet, wie oft eine optische Verbindung zum Boden funktioniert, warum sie ausfällt, welche Marge oder Technik helfen würde und was eine Uhr tut, während sie ausgefallen ist.

# text
seg-06db0ea8f428 = Kshana ist nur die Analyseseite. Es führt kein Experiment mit einer optischen Bodenstation durch und nennt keinen Messpartner. Der Typ ist <b>MODELLED</b>: Seine Numerik wird gegen ein unabhängiges Programm geprüft, aber es wurde keine gemessene Verfügbarkeitsaufzeichnung verglichen, und jede Wetter-, Techniken- und Uhreneingabe ist eine Annahme. Es ist eine beratende Analyse, kein zertifiziertes Verfügbarkeits-, Integritäts- oder Navigationsprodukt.

# text
seg-83c16fd89005 = Beide mitgelieferten Szenarien tragen ILLUSTRATIVE Wolkenklimata. Sie sind Eingaben, keine Messungen und nicht die Werte irgendeines Datensatzes.

# attr:alt
seg-e9dbbd9cfa32 = Eine mit Seed erzeugte Realisierung der Verbindungsmarge des Standorts „northern“ über { "336" } h, aus einem echten Lauf der Engine v{ $version } auf scenarios/optical-atmosphere-network.toml (Seed { "37" }, Schritt von { "600" } s). Die Marge fällt während Wolkenepisoden unter null; in dieser Ziehung ist die Verbindung { "40.5" } % der Zeit aktiv, mit { "27" } Ausfällen und einem längsten Ausfall von { "30.7" } h. Die Eingaben sind illustrativ, die Reihe ist eine Ziehung aus dem Modell und nicht das Klima, und sie weicht von der statistischen Verfügbarkeit ({ "37.8" } %) um den Stichprobenfehler der Ziehung ab. Nur beratende Analyse: kein zertifiziertes Verfügbarkeits-, Integritäts- oder Navigationsprodukt und keine Vorhersage für einen realen Standort, sofern seine Klimaeingaben nicht aus einem genannten Datensatz stammen.

# text
seg-13a52dfbd8d1 = Was berechnet wird

# text
# c1: atmospheric_loss_db
# c2: optical_linkbudget
seg-46fbaf0c6a12 = <b>Verlust bei klarer Luft</b> bei der Wellenlänge und Elevation: Aerosolextinktion aus dem Sichtweitengesetz von Kim, McArthur und Korevaar, exponentiell in der Höhe, plus Rayleigh-Streuung und eine genannte Gasabsorptions-Eingabe. Dies ersetzt das einzelne pauschale <c1/> von <c2/>, wenn eine Atmosphäre angegeben wird. Ohne eine ist das Linkbudget bitidentisch mit { "0.36" } (vorregistrierter Zielwert A5).

# text
# c1: Cn²
seg-929c80326b41 = <b>Turbulenz.</b> Ein Hufnagel-Valley-<c1/>-Profil (standardmäßig HV 5/7), entlang des Schrägpfads integriert, liefert die Rytov-Varianz für ebene oder sphärische Wellen, Uplink oder Downlink. Daraus ergeben sich der Szintillationsindex nach Andrews und Phillips, die Gamma-Gamma-Parameter, der Aperturmittelungsfaktor bei schwacher Turbulenz (Churnside) sowie die Gamma-Gamma-Schwundwahrscheinlichkeit und die Schwundmarge. Die Aperturmittelung wird durch Momentenanpassung angewandt: Der Szintillationsindex wird mit dem Mittelungsfaktor skaliert, und beide Log-Varianzen werden so neu skaliert, dass sie ihn exakt ergeben.

# text
# c1: τ = 3L/(2 ρ_w r_e)
seg-3fb7be7ef95d = <b>Wolken.</b> Das Wolkenklima eines Standorts hat die Form nach ITU-R P.840: eine Wolkenwahrscheinlichkeit und, bei Wolken, eine lognormalverteilte Flüssigwassersäule. P.840 liefert die Wolkenmenge. Die Dämpfung ist die geometrisch-optische optische Tiefe <c1/>, weil das eigene Dämpfungsgesetz von P.840 ein Mikrowellengesetz ist und bei { "0.85" } bis { "1.55" } µm nicht gilt, wo die Tröpfchen weit größer sind als die Wellenlänge.

# text
# c1: null
seg-18311430b2a3 = <b>Verfügbarkeit</b> eines Standorts: Die Verbindung ist aktiv, solange der Wolken- und der Turbulenzschwund zusammen innerhalb der Marge bleiben, die nach dem Verlust bei klarer Luft übrig ist. Wolken und Turbulenz werden als unabhängig betrachtet. Der Bericht gibt die Verfügbarkeit, die Verfügbarkeit bei klarem Himmel, die <b>Obergrenze</b>, die keine Marge anheben kann (eine optische Verbindung kann dichte Wolken nicht durchdringen), und die zusätzliche Marge an, die für jede Zielverfügbarkeit nötig ist, oder <c1/>, wenn das Ziel über der Obergrenze liegt.

# text
seg-885e06050a9a = <b>Ausfälle.</b> Die Dauern sind lognormalverteilt mit genanntem Mittelwert und genannter Streuung. Der Bericht gibt die Ausfälle pro Jahr, die Dauer beim Median, beim 90. und beim 99. Perzentil sowie die Wahrscheinlichkeit und den Anteil der Ausfallzeit jenseits von { "1" }, { "6" }, { "24" } und { "72" } Stunden an.

# text
# c1: N
# c2: 1 − Π(1−a_i)
# c3: exp(−d/d₀)
# c4: d₀ → 0
seg-4b9b6fefad6b = <b>Standortdiversität.</b> Die besten <c1/> Standorte, kombiniert bei unabhängigem Wetter (<c2/>) und bei entfernungskorreliertem Wetter: Paarkorrelation <c3/>, kombiniert in einer Ein-Faktor-Gauß-Copula. Bei <c4/> ist es die unabhängige Vereinigung, und bei voller Korrelation der beste einzelne Standort.

# text
# c1: [[technique]]
seg-b85681b9fd93 = <b>Techniken.</b> Jedes <c1/> ist ein Was-wäre-wenn: eine neue Wellenlänge (das Budget bei klarem Himmel, der Verlust bei klarer Luft und die Aperturmittelung werden neu berechnet), eine neue Empfangsapertur, eine genannte anteilige Szintillationsminderung (adaptive Optik) und zusätzliche Marge. Das Ergebnis ist der Verfügbarkeitsgewinn gegenüber der Basislinie am selben Standort. Kshana modelliert keine Regelschleife adaptiver Optik, die Gewinne sind daher Eingaben.

# text
# c1: [clock]
# c2: A + U·E[min(D, T_h)]/E[D]
# c3: holdover.rs
seg-a59d07280524 = <b>Zeitgebung und Entfernungsmessung durch einen Ausfall.</b> Jede Ausfalldauer wird durch die geschlossene Coast-Varianz des Uhren-Holdover-Modells abgebildet, für die in <c1/> aufgeführten Uhren. Der Bericht gibt den Zeitgebungs- und Entfernungsfehler bei genannten Ausfalldauern, den Holdover bis zum Zeitgebungsschwellenwert, den Anteil der Ausfälle innerhalb davon und die Zeitgebungsverfügbarkeit <c2/> an. Die Potenzgesetz-Untergrenzen der Klasse sind die vom Holdover-Modul synthetisierten, sodass ein enger Schwellenwert von dieser angenommenen Untergrenze bestimmt wird, wie <c3/> angibt.

# text
seg-59774a9e8685 = Verbindungsmarge über die Zeit ({ "0.38" })

# text
# c1: [timeseries]
# c2: duration_h
# c3: step_s
# c4: seed
# c5: p_cloud
seg-fcfdd2e9e0ad = Eine Tabelle <c1/> (<c2/> bis { "8760" }, <c3/>, <c4/>) fügt jedem Standort eine <b>mit Seed erzeugte Realisierung</b> des obigen Modells hinzu: Die Sichtlinie wechselt zwischen klaren Phasen (exponentiell, Mittelwert so gesetzt, dass der Zeitanteil in Wolken dem genannten <c5/> entspricht) und Wolkenausfällen (lognormal, mit dem genannten Mittelwert und der genannten Streuung); jeder Ausfall zieht eine Flüssigwassersäule aus dem genannten Klima und behält sie bei; jeder Schritt zieht eine Gamma-Gamma-Szintillationsprobe (von Schritt zu Schritt unabhängig, eine genannte Vereinfachung), und das Terminal ist mit der genannten Ausrichtungsverfügbarkeit auf das Ziel ausgerichtet. Die Marge des Schritts ist das Schwundbudget abzüglich der Wolken- und Szintillationsschwunde, und die Verbindung ist aktiv, wenn die Marge nicht negativ ist und das Terminal auf das Ziel ausgerichtet ist, die Bedingung, die das Verfügbarkeitsintegral verwendet.

# text
# c1: margin_db
# c2: cloud_db
# c3: scint_db
# c4: up
# c5: realised
# c6: tests/optical_atmosphere_timeseries.rs
# c7: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-ad2c4ff087a8 = Es ist eine Ziehung, nicht das Klima: Ihre Verfügbarkeit weicht von der statistischen um den Stichprobenfehler der Ziehung ab, und die erste Episode wird vollständig gezogen. Das Ergebnis enthält <c1/>, <c2/>, <c3/> und <c4/> je Schritt sowie einen Block <c5/> (Verfügbarkeit, Wolkenanteil, Anzahl der Ausfälle, längster Ausfall). <b>MODELLED</b>; die Prüfungen (<c6/>, Zielwerte vor dem ersten Lauf in <c7/> festgelegt) betreffen Determinismus und Konsistenz mit den genannten Größen, keine externe unabhängige Referenz. Ohne die Tabelle wird nichts geschrieben, und das Ergebnis ist das Dokument von { "0.37" }.

# text
seg-4a9b065bdb28 = Szenariofelder

# text
# c1: kind = "optical-atmosphere"
# c2: wavelength_nm
# c3: elevation_deg
# c4: availability_targets_pct
# c5: [link]
# c6: [atmosphere]
# c7: [network]
# c8: [clock]
# c9: [[site]]
# c10: [[technique]]
seg-4ba70196355d = Alle Felder der obersten Ebene sind optional. Ein bloßes <c1/> führt drei illustrative Standorte aus. Alle Schlüssel finden Sie in den beiden mitgelieferten Dateien: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-b7619573e112 = Verifikationsstatus

# text
seg-6598ced4218b = Rytov-Varianz, Szintillationsindex, Gamma-Gamma-Schwundwahrscheinlichkeit, Aperturmittelungsfaktor, optische Tiefe von Wolken und klarer Luft werden so berechnet, wie die genannten Formeln es angeben

# text
seg-2442f7529fbb = MODELLED-Zeile; Numerik gegen ein unabhängiges mpmath-Programm geprüft

# text
# c1: xval/optical-atmosphere/RESULTS.md
seg-19854ea8437a = Zielwerte A1 bis A3, alle erreicht (<c1/>)

# text
seg-b91d83aea0e8 = Linkbudget und bestehende Verfügbarkeit ohne Atmosphäre unverändert

# text
seg-2192262e26c1 = erreicht

# text
seg-a71527a271df = Zielwert A5, bitidentisch über { "1,000" } Parametersätze

# text
seg-0db8cf4c2ee0 = Diversitätsgrenzen und Monotonie; Holdover-Kopplung bitgenau

# text
seg-2a5c5967540c = erreicht (Identitäten)

# text
seg-4b0e5e3ac558 = Zielwerte A4, A6

# text
seg-f842c688e29a = Verfügbarkeit eines realen Standorts, reale Szintillation, reale Wolkenstatistik

# text
seg-9a0ead7b1670 = nicht beansprucht

# text
seg-9cc220190772 = es wurde keine externe unabhängige Referenz verglichen

# text
seg-7c5050135e2b = Die unabhängige Referenz prüft die Implementierung der genannten Formeln, nicht die Atmosphäre, daher ist keine Zeile VALIDATED. ITU-R-Validierungswerte werden nicht verwendet und aus dem Repository herausgehalten.

# text
# c1: optical_availability
seg-73dcf0f31fe9 = Es wird kein Wetterdatensatz mitgeliefert. Wolkenklima-Eingaben für einen realen Standort würden aus einem öffentlichen Datensatz stammen (Copernicus ERA5, NASA MODIS oder ISCCP); die Lizenz jedes Datensatzes muss vor der Nutzung gelesen und festgehalten werden, und Rohdaten werden zur Testzeit mit einem festgelegten SHA-256 abgerufen. Die eine Klimatologie, die bereits im Repository liegt, ist die Tabelle klarer Nächte von Cavazzani et al., die <c1/> verwendet.

# text
seg-44d197f3209c = Andrews und Phillips, <em>Laser Beam Propagation through Random Media</em>, 2. Aufl. (Rytov-Varianz, Szintillationsindex, Gamma-Gamma-Parameter).

# text
seg-9e9a33d44013 = Kim, McArthur und Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (Sichtweitengesetz).

# text
seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (Aperturmittelungsfaktor).

# text
seg-309c70f2f4f8 = ITU-R P.840 (Statistik des Flüssigwassers in Wolken), P.1814 und P.1817 (Verfahren für optische Freiraumverbindungen).

# text
seg-83b30e1ca261 = <s1>Zurück</s1>Nachweispakete

# text
seg-1474b58fb35a = <s1>Weiter</s1>Slot-Zeitgebung
