# site-js.ftl (de): translations

js-app-engine-failed = Die Engine konnte nicht geladen werden ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } Registerzeile
       *[other] { $n } Registerzeilen
    }

js-site-action-copy-install = Kopieren: cargo install kshana

js-site-action-launch = { $name } starten

js-site-action-licence = Sprechen Sie mit uns über eine kommerzielle Lizenz

js-site-action-pro-eval = Eine Evaluierung von Kshana Pro anfragen

js-site-action-study = Eine Studie anfragen

js-site-action-theme = Zwischen hellem und dunklem Design wechseln

js-site-capabilities-bd-after = { $m } m nach { $s } s

js-site-capabilities-bd-combined = kombiniert

js-site-capabilities-bd-crossing = { $m } m bei { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» nach { $s } s, dominiert von { $dom }

js-site-capabilities-bd-fig-lead = Zeit seit dem Verlust von GNSS auf der logarithmischen Achse, eine IMU der Güteklasse { $grade } bei { $speed } m/s:

js-site-capabilities-bd-fig-tail = Die Linien sind die Wachstumsgesetze der Engine für kurzes Auslaufen und deren Quadratsumme-Wurzel; die Schnittpunkte stammen aus ihrem vollständigen Fehlermodell mit neun Zuständen (Schuler), das die Bias-Terme begrenzt, sodass bei langem Auslaufen jeder Schnittpunkt etwas später kommt, als die Linie ihn erreicht. Die Balken: dieselben Schnittpunkte für vier IMU-Güteklassen.

js-site-capabilities-cd-canvas-aria = Konstellation um ihren Körper, echte Bilddaten: Ziehen oder Pfeiltasten zum Drehen, Plus und Minus zum Zoomen

js-site-capabilities-cd-design-meta = { $n } Satelliten · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Jeder Satellit folgt der eigenen Bahnspur der Engine; der Radius der eingefrorenen Bahn ergibt sich aus den Elementen der Schale.

js-site-capabilities-cd-foot-mean-motion = Jeder Satellit folgt der eigenen Bahnspur der Engine, in dem Radius, den seine mittlere Bewegung ergibt.

js-site-capabilities-cd-foot-walker = Alle { $n } Satelliten sind nach den eigenen Walker-Parametern der Schalen platziert (geprüft gegen { $shown } Bahnspuren der Engine: schlechtester Wert { $deg }°); die Spuren sind die { $shown } Bahnspuren der Engine.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» Satelliten

js-site-capabilities-cd-hud-mission = Mission «{ $time }»

js-site-capabilities-cd-legend-shell = Schale { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Anteil des Laufs mit PDOP ≤ { $limit } (0 bis 100 %)

js-site-capabilities-cd-map-pdop = Mittlerer PDOP je Zelle von { $step }° ({ $lo } bis { $hi }; heller ist besser)

js-site-capabilities-cd-map-visible = Mittlere Anzahl sichtbarer Satelliten ({ $lo } bis { $hi })

js-site-capabilities-cd-metric-availability = Verfügbarkeit

js-site-capabilities-cd-metric-pdop = Mittlerer PDOP

js-site-capabilities-cd-metric-visible = Sichtbar

js-site-capabilities-cd-no-webgl = Die 3D-Ansicht benötigt WebGL; die Abdeckungskarte und die Kennzahlen stammen aus demselben Lauf.

js-site-capabilities-cd-pause = Die Bahnen anhalten

js-site-capabilities-cd-play = Die Bahnen abspielen

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: { $n } Satelliten, Slot-Tabelle des Betreibers

js-site-capabilities-cd-span = von { $dur }, in Schleife

js-site-capabilities-cd-stat-in-view = Mittlere Anzahl sichtbar

js-site-capabilities-cd-stat-mask = Maske · Lauf

js-site-capabilities-cd-stat-median = Median-PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, gesamte { $body }

js-site-capabilities-cd-stat-satellites = Satelliten

js-site-capabilities-cd-stat-worst = Schlechtester Standort

js-site-capabilities-cd-title-gnss = Vier GNSS zusammen

js-site-capabilities-cd-title-leo = Mega-Konstellation im niedrigen Erdorbit

js-site-capabilities-cd-title-lunar = Mond-Relaissatz

js-site-capabilities-cd-work-ratio = { $pct } % nach dem Breitengrad-Vorfilter · { $dop } DOP-Lösungen

js-site-capabilities-cd-work-tests = { $after } Satellit-Punkt-Tests statt der { $brute }, die ein Brute-Force-Scan benötigen würde

js-site-capabilities-cd-work-title = Sichtbarkeitsaufwand

js-site-capabilities-cg-cn0-sub = C/N0 gegenüber der Nachführschwelle

js-site-capabilities-cg-cn0-title = Träger-Rausch-Dichte

js-site-capabilities-cg-compose-availability = Verfügbarkeit

js-site-capabilities-cg-compose-fewest = Wenigste nachgeführt

js-site-capabilities-cg-compose-js = Mittleres J/S

js-site-capabilities-cg-compose-text = Ein Störsender, { $power } { $unit }, an einem Ort, eingebunden in { $n } Mitgliedsläufe der Art ‹{ $kind }›: Ein Schiff in einer Meerenge und ein Auto auf einer Küstenstraße sehen dieselbe Ursache und erhalten unterschiedliche Antworten.

js-site-capabilities-cg-log-campaign = Kampagne { $file } · { $phases } Phasen · { $runs } Mitgliedsläufe

js-site-capabilities-cg-log-phase = Phase { $name } beginnt

js-site-capabilities-cg-log-phase-carries = Phase { $name } beginnt · übernimmt { $carried }

js-site-capabilities-cg-monte-axis = Endfehler der Uhr über { $n } Seeds ({ $path })

js-site-capabilities-cg-monte-ci = Mittelwert, 95-%-Intervall

js-site-capabilities-cg-monte-mean = Mittelwert

js-site-capabilities-cg-monte-p05 = 5.

js-site-capabilities-cg-monte-p05-p95 = 5. bis 95.

js-site-capabilities-cg-monte-p50 = Median

js-site-capabilities-cg-monte-p95 = 95.

js-site-capabilities-cg-monte-std = Standardabweichung

js-site-capabilities-cg-monte-text = Dasselbe Szenario der Art ‹{ $kind }›, { $n }-mal ausgeführt ab dem Basis-Seed { $seed }, je ein Seed pro Lauf: die Streuung des Endfehlers der frei laufenden Uhr, mit ihrem 95-%-Konfidenzintervall für den Mittelwert.

js-site-capabilities-cg-not-in-phase = nicht in dieser Phase

js-site-capabilities-cg-now = Phase { $n } von { $total }: { $name } · { $from } bis { $to }

js-site-capabilities-cg-phase-title = { $name }: { $from } bis { $to } · beendet durch { $by } · Mitgliedsarten { $kinds }

js-site-capabilities-cg-pl-sub = gegenüber dem Alarmgrenzwert

js-site-capabilities-cg-pl-title = Schutzniveau

js-site-capabilities-cg-pos-sub = gegenüber seinem Budget · logarithmisch

js-site-capabilities-cg-pos-title = Inertialer Positionsfehler

js-site-capabilities-cg-range = { $lo } bis { $hi }

js-site-capabilities-cg-sweep-all-lost = Alle verloren ab

js-site-capabilities-cg-sweep-axis = Sendeleistung des Störsenders ({ $key })

js-site-capabilities-cg-sweep-first-loss = Erster Verlust

js-site-capabilities-cg-sweep-lg-availability = Verfügbarkeit

js-site-capabilities-cg-sweep-lg-js = mittleres J/S

js-site-capabilities-cg-sweep-never = nie

js-site-capabilities-cg-sweep-nodes = Knoten

js-site-capabilities-cg-sweep-none = keine

js-site-capabilities-cg-sweep-span = J/S-Spanne

js-site-capabilities-cg-sweep-text = Ein Szenario der Art ‹{ $kind }›, einmal je Knoten ausgeführt, während die Sendeleistung des Störsenders von { $from } bis { $to } { $unit } schrittweise steigt. Die Verfügbarkeit unter Störung (durchgezogen) und das mittlere J/S (gestrichelt) stammen aus den eigenen Gütemaßen jedes Mitgliedslaufs.

js-site-capabilities-cg-te-sub = gegenüber seiner Schutzgrenze

js-site-capabilities-cg-te-title = Zeitfehler der Uhr

js-site-capabilities-copy = Kopieren

js-site-capabilities-copy-aria = Den Befehl kopieren, der den Lauf reproduziert: kshana { $file }

js-site-capabilities-cz-best = Bester PDOP

js-site-capabilities-cz-failed = Der aufgezeichnete Lauf konnte hier nicht geladen werden; öffnen Sie ihn stattdessen im Studio.

js-site-capabilities-cz-fix = Abtastwerte mit Positionslösung

js-site-capabilities-cz-fix-value = { $n } von { $total } ({ $pct } %)

js-site-capabilities-cz-median = Median-PDOP

js-site-capabilities-engine = Engine v{ $version }

js-site-capabilities-engine-build = Engine v{ $version }, Build

js-site-capabilities-engine-report = Engine-Bericht

js-site-capabilities-globe-aria = { $name } auf ihren echten Bilddaten ({ $credit }). Zum Drehen ziehen oder die Pfeiltasten verwenden; Plus und Minus zoomen.

js-site-capabilities-ho-ends = Lauf endet bei { $t }

js-site-capabilities-ho-past-guard = jenseits der Schutzgrenze

js-site-capabilities-no-seed = deterministisch, ohne Seed

js-site-capabilities-open-in-studio = In { $studio } öffnen

js-site-capabilities-open-report = Den Bericht der Engine öffnen

js-site-capabilities-orrery-aria = Das Sonnensystem zur Epoche des Laufs: Ziehen oder Pfeiltasten zum Drehen, Plus und Minus zum Zoomen

js-site-capabilities-orrery-bodies = { $n } Körper · Beobachter «{ $observer }»

js-site-capabilities-orrery-epoch = Epoche «{ $epoch }» · TDB (Barycentric Dynamical Time), Julianisches Datum { $jd }

js-site-capabilities-pnt-chart-title = Relais in Sicht (Linie) · Erde über dem Horizont (schattiert) · vier für eine Positionslösung nötig

js-site-capabilities-pnt-kicker = Positionierung an diesem Körper · Art body-pnt

js-site-capabilities-pnt-lander = Ein Lander bei { $lat }°, { $lon }° auf der Oberfläche navigiert über die Relais, mit einer Zwei-Wege-Entfernungsmessung zur Erde, sobald die Erde über dem Horizont steht (Lichtlaufzeit in einer Richtung { $min } min). Verfügbarkeit: { $a } % allein über die Relais, { $b } % mit der Erdverbindung.

js-site-capabilities-pnt-orbiter = Ein umlaufender Nutzer navigiert über die Relais, mit einer Zwei-Wege-Entfernungsmessung zur Erde, sobald die Erde über dem Horizont steht (Lichtlaufzeit in einer Richtung { $min } min). Verfügbarkeit: { $a } % allein über die Relais, { $b } % mit der Erdverbindung.

js-site-capabilities-pnt-relays = { $n } Relais in { $alt } km um { $body }

js-site-capabilities-report-data = Bericht und Daten

js-site-capabilities-result-data = Ergebnisdaten

js-site-capabilities-saved = { $name } gespeichert

js-site-capabilities-scenario-file = Szenariodatei

js-site-capabilities-seed = Seed { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» hält die Schutzgrenze für { $dur }

js-site-capabilities-six-clock-guard = { $v } ns Schutzgrenze

js-site-capabilities-six-coast-budget = { $m } m Budget

js-site-capabilities-six-coast-denied = GNSS verweigert

js-site-capabilities-six-coast-fig = «{ $id }» innerhalb des Budgets für { $s } s

js-site-capabilities-six-floor = Nachführschwelle

js-site-capabilities-six-integ-fig = «{ $ok }» von { $n } Epochen verfügbar · Alarmgrenzen { $h } m horizontal, { $v } m vertikal

js-site-capabilities-six-integ-limit = vertikale Alarmgrenze

js-site-capabilities-six-integ-pl = vertikales (durchgezogen) und horizontales (gestrichelt) Schutzniveau

js-site-capabilities-six-jam-effective = wirksam, { $n } Satelliten

js-site-capabilities-six-jam-fig = Nachgeführt «{ $min }» von { $max } in Sicht · Verfügbarkeit unter Störung «{ $av }» (nominal { $nom }) · mittleres J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = nominal, kein Störsender (gestrichelt)

js-site-capabilities-six-orbit-fig = Höhe «{ $lo }–{ $hi } km» · Bodenspur über { $dur }

js-site-capabilities-six-orbit-label = { $source } · { $n } Abtastwerte

js-site-capabilities-six-orbit-sgp4 = SGP4 aus einem Zweizeilen-Elementesatz

js-site-capabilities-six-spoof-detects = { $id } erkennt

js-site-capabilities-six-spoof-fig = «{ $id }» erkennt bei { $s } s (Schranke { $ns } ns)

js-site-capabilities-ss-angle = Winkel von der Sonne

js-site-capabilities-ss-credit = Bilddaten: { $credits }. * Die Karte endet vor den Polen; die Lücke erhält die mittlere Polfarbe der Karte. Saturnringe: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } Tage

js-site-capabilities-ss-frame-origin = Ursprung des Bezugssystems

js-site-capabilities-ss-from-sun = Von der Sonne

js-site-capabilities-ss-gloss = NAIF: der Körpercode der Navigation and Ancillary Information Facility der NASA. GM: Gravitationsparameter. J2: Abplattungsterm. IAU-Pol: der Rotationspol der Internationalen Astronomischen Union, als Rektaszension (RA) und Deklination (Dec).

js-site-capabilities-ss-j2-none = keiner veröffentlicht

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } von { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Lichtlaufzeit von { $observer }

js-site-capabilities-ss-link = { $from } nach { $to }, Lichtlaufzeit in einer Richtung { $one }, Hin- und Rückweg { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Verbindung, die dieser Lauf berechnet:
       *[other] Verbindungen, die dieser Lauf berechnet:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Sein Mond, maßstabsgetreu, zur Epoche
       *[other] Seine Monde, maßstabsgetreu, zur Epoche
    }

js-site-capabilities-ss-nominal-error = nomineller Fehler { $km } km in der Entfernung

js-site-capabilities-ss-north = Gesehen vom Norden der Ekliptik.

js-site-capabilities-ss-period = Umlaufzeit

js-site-capabilities-ss-period-about = Umlaufzeit um { $parent }

js-site-capabilities-ss-pole = IAU-Pol (RA, Dec)

js-site-capabilities-ss-radius = Mittlerer Radius

js-site-capabilities-ss-retrograde = { $v } h, rückläufig

js-site-capabilities-ss-rotation = Siderische Rotation

js-site-capabilities-ss-years = { $v } Jahre

js-site-capabilities-st-bound = { $v } m Schranke

js-site-capabilities-st-fig-none = { $n } Epochen, keine mit einem Fehler oberhalb seiner Schranke. Quer: der wahre Positionsfehler; nach oben: das Schutzniveau; beide auf logarithmischen Achsen.

js-site-capabilities-st-fig-some = { $n } Epochen, { $k } mit einem Fehler oberhalb seiner Schranke. Quer: der wahre Positionsfehler; nach oben: das Schutzniveau; beide auf logarithmischen Achsen.

js-site-capabilities-st-limit = Alarmgrenze { $m } m

js-site-capabilities-st-misleading = irreführend: Fehler oberhalb der Schranke

js-site-capabilities-st-normal = Normalbetrieb

js-site-capabilities-st-unavailable = nicht verfügbar: Schranke oberhalb der Grenze

js-site-capabilities-studio-embedded = { $studio }, eingebettet: der Lauf orbit-multignss

js-site-capabilities-studio-load = { $studio } hier laden

js-site-capabilities-studio-outline = Die Gliederung wieder anzeigen

js-site-capabilities-wave-chirp = Chirp

js-site-capabilities-wave-cw = CW-Ton

js-site-capabilities-wave-noise = Rauschen

js-site-capabilities-wf-an-caption = Zeile T+{ $t } s · dB über der Schwelle, logarithmische Skala · Spitzenwert des gesamten Rasters { $peak } dB

js-site-capabilities-wf-degraded = Beeinträchtigt

js-site-capabilities-wf-degraded-low = beeinträchtigt

js-site-capabilities-wf-failed = Der aufgezeichnete Lauf konnte hier nicht geladen werden.

js-site-capabilities-wf-grid = Raster

js-site-capabilities-wf-iq = Bei T+{ $t } s zeichnet die Engine das Modell zusätzlich als { $n } IQ-Abtastwerte (In-Phase und Quadratur) um { $mhz } MHz und prüft eine Welch-Schätzung ({ $segments } Segmente zu { $nfft }) dagegen: Verhältnis der integrierten Leistung { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } aus

js-site-capabilities-wf-jammer-on = { $what } ein

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · von { $on } s bis zum Ende

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Nachführung verloren

js-site-capabilities-wf-lost-low = Nachführung verloren

js-site-capabilities-wf-max = { $peak } dB darüber · logarithmische Skala ab { $v0 } dB

js-site-capabilities-wf-no-jammer = kein Störsender

js-site-capabilities-wf-now = jetzt

js-site-capabilities-wf-pause = Das Wasserfalldiagramm anhalten

js-site-capabilities-wf-peak = Spitze { $v } dB

js-site-capabilities-wf-play = Das Wasserfalldiagramm abspielen

js-site-capabilities-wf-replay-previous = Wiedergabebeginn · vorheriger Durchlauf darunter

js-site-capabilities-wf-replay-start = Wiedergabebeginn

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = Signal +{ $v } dB

js-site-capabilities-wf-summary = Aufgezeichneter Lauf von { $file }: { $bands } Bänder, { $jammers } Störsender über { $seconds } Sekunden. Das schlechteste Band, { $worst }, fällt bei { $at } s auf { $min } dB-Hz; Nachführschwelle { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB über der Rauschschwelle

js-site-capabilities-wf-tip-in = in { $bands }

js-site-capabilities-wf-tracking = Nachführung

js-site-capabilities-wf-tracking-low = Nachführung

js-site-caphero-aria = Das Sonnensystem aus dem Sonnensystem-Lauf der Engine am { $date }: die Sonne und { $bodies } Körper, die sich entlang ihrer Engine-Bahnspuren bewegen; { $valid } der Bahnen sind gegen JPL Horizons validiert.

js-site-caphero-clock = +{ $days } Tage · { $date }

js-site-caphero-copy-command = Befehl kopieren

js-site-caphero-copy-title = Den Befehl kopieren, der es reproduziert

js-site-caphero-credits = Entfernungen logarithmisch gestaucht, Richtungen wahr; Körper vergrößert, Drehung mit Anzeigerate. Bilddaten: { $credits }; Saturnringe: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Maßstab und Bildnachweise

js-site-caphero-engine-build = Engine v{ $version }, Build

js-site-caphero-explore = Jeden Körper erkunden

js-site-caphero-file-title = Die Szenariodatei, die lief

js-site-caphero-list-item = { $name }: { $label }, { $au } au von der Sonne zur Epoche, Umlaufzeit { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au von der Sonne zur Epoche, Umlaufzeit { $period }, Lichtlaufzeit von { $observer } { $light }.

js-site-caphero-no-seed = deterministisch, ohne Seed

js-site-caphero-open-in-studio = In { $studio } öffnen

js-site-caphero-pause = Die Bahnen anhalten

js-site-caphero-period-days = { $value } Tage

js-site-caphero-period-years = { $value } Jahre

js-site-caphero-play = Die Bahnen abspielen

js-site-caphero-rate = { $days } Tage des Laufs pro Sekunde

js-site-caphero-rate-epoch = Das Bild zur Epoche des Laufs

js-site-caphero-read-distance = { $au } au von der Sonne

js-site-caphero-read-light = Lichtlaufzeit von { $observer } zur Epoche { $light }

js-site-caphero-read-orbit = Bahn { $period }

js-site-caphero-seed = Seed { $seed }

js-site-copy-aria = Kopieren: { $cmd }

js-site-developers-captured-from = aufgezeichnet { $recorded } aus

js-site-developers-engine-build = Engine v{ $version }, Build

js-site-developers-exit-stamp = Exit { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: in { $studio } öffnen

js-site-developers-no-seed = (deterministisch, ohne Seed)

js-site-developers-open-in-studio = In { $studio } öffnen

js-site-developers-pause = Die Wiedergabe anhalten

js-site-developers-play = Die Wiedergabe abspielen

js-site-developers-replaying = # die aufgezeichnete Sitzung wird wiedergegeben

js-site-developers-seed = (Seed { $seed })

js-site-developers-what-runs-write = Was jeder Lauf schreibt

js-site-editions-builds-on-it = { $label } baut darauf auf

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } Art
       *[other] { $n } Arten
    }

js-site-editions-core-title = Offener Kern

js-site-editions-core-validated = validiert

js-site-editions-core-validated-of = { $validated } von { $total }

js-site-editions-free-core = Kostenlos im offenen Kern, wie jede Art

js-site-editions-group-other = Sonstige

js-site-editions-kind-no-ledger = kein Registermodul passt dem Namen nach

js-site-editions-kind-validated = { $v } von { $tot } Registerzeilen validiert

js-site-editions-pause = Die Ringe anhalten

js-site-editions-play = Die Ringe abspielen

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Individuelle Studie

js-site-evidence-allan-aria = Vier Abweichungen des 1000-Punkte-Datensatzes NIST SP 1065 gegen die Mittelungszeit; alle { $n } veröffentlichten Werte reproduziert, schlechtester relativer Fehler { $err }

js-site-evidence-allan-lg-published = veröffentlichter Wert, SP 1065 Tabelle 31

js-site-evidence-allan-mdev = modifizierte Allan-Abweichung

js-site-evidence-allan-na = k. A.

js-site-evidence-allan-oadev = überlappende Allan-Abweichung

js-site-evidence-allan-ohdev = überlappende Hadamard-Abweichung

js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modifiziert { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = die Schwelle des Tests

js-site-evidence-allan-st-reproduced = veröffentlichte Werte reproduziert

js-site-evidence-allan-st-worst = schlechtester relativer Fehler

js-site-evidence-allan-tdev = Zeitabweichung, in Sekunden

js-site-evidence-allan-tip-at = «{ $name }» bei { $m } s

js-site-evidence-allan-tip-engine = Engine: «{ $got }» · relativer Fehler { $err }

js-site-evidence-allan-tip-table = SP 1065 Tabelle 31: «{ $want }»

js-site-evidence-cell-tip = Fähigkeit { $i } von { $n } · «{ $label }»

js-site-evidence-cowell-aria = Positionsdifferenz gegenüber Orekit über 24 Stunden: Die Kraftstufen 1 bis 5 bleiben unter { $worst }; die Luftwiderstandsstufe erreicht { $drag }, ein Charakterisierungsband

js-site-evidence-cowell-gto = geostationäre Transferbahn

js-site-evidence-cowell-leo = niedrige Erdumlaufbahn

js-site-evidence-cowell-lg-con = Stufen 1 bis 5, Zweikörperproblem bis zum Strahlungsdruck der Sonne, je zwei Umläufe

js-site-evidence-cowell-lg-drag = Stufe 6, Luftwiderstand: nur Charakterisierung (unterschiedliche Dichtemodelle)

js-site-evidence-cowell-read = { $h } h · Stufen 1 bis 5 schlechtester Wert { $con } · Luftwiderstand { $drag }

js-site-evidence-cowell-st-drag = Luftwiderstandsstufe, schlechtester Wert

js-site-evidence-cowell-st-epochs = Epochen in den Stufen 1 bis 5

js-site-evidence-cowell-tip-tier = «Stufe { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = größte Differenz «{ $err }» bei { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Keine externe unabhängige Referenz benannt.

js-site-evidence-hero-oracle = Unabhängige Referenz

js-site-evidence-hero-oracle-is = Unabhängige Referenz: { $o }

js-site-evidence-hero-owner = Eigentümer

js-site-evidence-hero-partner = Ein Partner besitzt dies; die Engine beansprucht nichts davon.

js-site-evidence-hero-pause = Den Durchlauf anhalten

js-site-evidence-hero-play = Den Durchlauf abspielen

js-site-evidence-hero-row = Zeile { $i } von { $n }

js-site-evidence-hold-accepted = akzeptiert: innerhalb eines Faktors von { $bar }

js-site-evidence-hold-aria = Gemessener quadratischer Mittelwert des Zeitfehlers der Cäsiumuhr gegenüber der Auslaufzeit, mit der Vorhersage der Engine; vorhergesagt gegenüber gemessen verletzt die Schranke von { $lo } bis { $hi }

js-site-evidence-hold-control = «Kontrolle:» Die naive Vorhersage (die Ein-Sekunden-Stabilität als weißes Frequenzrauschen gelesen) ergibt ein Verhältnis von { $ratio }, daneben um einen Faktor von etwa { $factor }, und verfehlt denselben Zielwert. Der Zielwert hat Biss.

js-site-evidence-hold-lg-meas = gemessen am zurückgehaltenen Datensatz (Punkt: Verletzung)

js-site-evidence-hold-lg-pred = vorhergesagt aus dem ersten Drittel (Ring: Verletzung)

js-site-evidence-hold-nodata = Der gemessene Datensatz war bei der Erzeugung dieser Seite nicht verfügbar.

js-site-evidence-hold-perfect = 1 = perfekt

js-site-evidence-hold-ratio-aria = Vorhergesagt gegenüber gemessen für { $n } Schwellen, alle innerhalb des akzeptierten Faktors von { $bar }

js-site-evidence-hold-read = Auslaufen { $h } h · gemessen { $m } ns · vorhergesagt { $p } ns

js-site-evidence-hold-st-fit = für die Anpassung verwendet

js-site-evidence-hold-st-samples = Ein-Sekunden-Abtastwerte

js-site-evidence-hold-st-syncs = zurückgehaltene Synchronisationspunkte

js-site-evidence-hold-tip-breach = vorhergesagte Verletzung { $p } s · gemessen { $m } s

js-site-evidence-hold-tip-error = «Zeitfehler { $thr } ns»

js-site-evidence-hold-tip-ratio = vorhergesagt gegenüber gemessen «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · vorhergesagt gegenüber gemessen «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = Chi-Quadrat-Verteilung

js-site-evidence-kernel-chi2-quantile = Chi-Quadrat-Quantil

js-site-evidence-kernel-noncentral = nichtzentrale Chi-Quadrat-Verteilung

js-site-evidence-kernel-normal-cdf = Normalverteilung

js-site-evidence-kernel-normal-quantile = Normalverteilungs-Quantil

js-site-evidence-kernel-pbias = Detektions-Bias

js-site-evidence-ladder-aria = Bahnresiduen von { $lo } bis { $hi } m auf einer logarithmischen Skala, mit dem Behörden-Zielwert von { $bar } m

js-site-evidence-ladder-bar = Behörden-Zielwert { $bar } m

js-site-evidence-ladder-cowell = Cowell gegen Orekit 12.2, schlechtester Wert

js-site-evidence-ladder-g24 = Galileo E11, 24-Stunden-Anpassung

js-site-evidence-ladder-g8 = Galileo E11, 8-Stunden-Anpassung

js-site-evidence-ladder-lg-headline = Residuum der Schlagzeile

js-site-evidence-ladder-lg-over = jenseits des Behörden-Zielwerts von { $bar } m

js-site-evidence-ladder-lg-ring = nur Kraftmodell, vor empirischen Beschleunigungen

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, 4-Stunden-Anpassung

js-site-evidence-ladder-read = Durchlauf bei { $v } · { $n } von { $total } Schlagzeilen-Residuen bei oder darunter

js-site-evidence-ladder-rt-arc = { $arc }-Bogen · Grad und Ordnung { $do } · { $n } Beobachtungen

js-site-evidence-ladder-rt-rtn = radial { $r } m · in Flugrichtung { $a } m · quer zur Bahn { $c } m

js-site-evidence-ladder-sgp4 = SGP4 gegen die AIAA-Vektoren, schlechtester Wert

js-site-evidence-ladder-swarm = Swarm-A, 3-Stunden-Anpassung

js-site-evidence-ladder-tip-cowell = «Cowell · schlechtester Wert aus { $n } Epochen» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · ein ganzer Tag» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · nur Kraftmodell» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · mit empirischen Beschleunigungen» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Mondorbiter · dynamisch» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Mondorbiter · reduziert-dynamisch» · { $rms } m, oberhalb des Zielwerts von { $bar } m und so berichtet, wie er ist

js-site-evidence-ladder-tip-sgp4 = «SGP4 · schlechtester Wert aus { $n } Vektoren» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dynamisch» · { $rms } m, fast ausschließlich in Flugrichtung (Luftwiderstand)

js-site-evidence-ladder-tip-swr = «Swarm-A · reduziert-dynamisch» · { $rms } m

js-site-evidence-raim-aria = { $pass } von { $n } SciPy-Fällen innerhalb ihres Toleranzbands, über { $kernels } Kerne

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = der größte Anteil eines Bands, den ein Fall nutzt

js-site-evidence-raim-read = Fall { $q } von { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % des Bands

js-site-evidence-raim-scale-aria = Farbskala: genutzter Anteil des Toleranzbands, logarithmisch von 10 hoch minus 11 bis zum Rand des Bands

js-site-evidence-raim-st-inside = innerhalb des Bands

js-site-evidence-raim-st-most = der größte Anteil eines Bands genutzt

js-site-evidence-raim-tick-edge = Bandrand

js-site-evidence-raim-tick-exact = exakt

js-site-evidence-raim-tip-case = «{ $kernel }» · Fall { $j } von { $n }

js-site-evidence-raim-tip-exact = «exakte Übereinstimmung» mit SciPy

js-site-evidence-raim-tip-uses = nutzt «{ $pct } %» seines Toleranzbands

js-site-evidence-sgp4-aria = { $n } von { $n } AIAA-Vektoren reproduziert; schlechtester Wert { $worst }, Median { $median }, alle innerhalb der Toleranz { $tol }

js-site-evidence-sgp4-deep = Weltraum fern der Erde (SDP4)

js-site-evidence-sgp4-lg-deep = Vektor im fernen Weltraum (SDP4)

js-site-evidence-sgp4-lg-median = Median und schlechtester Wert auf der Skala

js-site-evidence-sgp4-lg-near = erdnaher Vektor (SGP4)

js-site-evidence-sgp4-near = erdnah (SGP4)

js-site-evidence-sgp4-read = Vektor { $i } von { $n } · Satellit { $sat } · Fehler { $err }

js-site-evidence-sgp4-read-deep = Vektor { $i } von { $n } · Satellit { $sat }, ferner Weltraum · Fehler { $err }

js-site-evidence-sgp4-scale-aria = Farbskala von 0,1 Mikrometer bis zur Toleranz, logarithmisch

js-site-evidence-sgp4-st-deep = Vektoren im fernen Weltraum

js-site-evidence-sgp4-st-sats = Testsatelliten

js-site-evidence-sgp4-tip-sat = «Satellit { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = Vektor { $j } von { $n } · Positionsfehler «{ $err }»

js-site-evidence-st-median = Median

js-site-evidence-st-worst = schlechtester Wert

js-site-evidence-tolerance = Toleranz { $v }

js-site-filter-in-all = { $total } insgesamt

js-site-filter-matches =
    { $n ->
        [one] { $n } Treffer
       *[other] { $n } Treffer
    }

js-site-filter-n-of-m = { $n } von { $total }

js-site-filter-n-of-m-rows = { $n } von { $total } Zeilen

js-site-filter-rows = { $total } Zeilen

js-site-home-banner-gnss-lost = GNSS verloren · holdover

js-site-home-banner-holdover-out = Holdover · Uhr außerhalb der Schutzgrenze

js-site-home-banner-integrity-holdover = Integritätsalarm · holdover läuft weiter

js-site-home-banner-integrity-none = Integritätsalarm · kein Schutzniveau

js-site-home-banner-integrity-pl = Integritätsalarm · PL > AL

js-site-home-banner-jamming = Jamming · C/N0 nahe der Schwelle

js-site-home-banner-spoofing = Spoofing-Alarm · HF-Detektor

js-site-home-cap-holdover = Der Störsender geht auf { $dbw } dBW: { $trk } Satelliten werden nachgeführt. Die Uhr läuft frei weiter ab den { $carry } ns, die der Spoofer hinterlassen hat, und überschreitet ihre Schutzgrenze von { $guard } ns bei { $at }; das INS läuft aus.

js-site-home-cap-integrity = Die Satelliten kehren zurück, aber nur oberhalb einer Maske von { $mask }°: { $trk } werden nachgeführt. Das Schutzniveau überschreitet die Alarmgrenze von { $al } m oder kann nicht gebildet werden, daher schlägt der Monitor Alarm und die Uhr bleibt im holdover.

js-site-home-cap-jamming = Ein Breitband-Störsender in { $km } km Entfernung mit { $dbw } dBW. C/N0 fällt auf { $cn } dB-Hz, { $above } dB über der Nachführschwelle von { $floor } dB-Hz; alle { $trk } Satelliten werden weiterhin nachgeführt.

js-site-home-cap-nominal = { $trk } Satelliten nachgeführt bei einem mittleren C/N0 von { $cn } dB-Hz. Die Uhr ist auf GNSS-Zeit diszipliniert und das Schutzniveau ({ $pl } m) liegt unter der Alarmgrenze von { $al } m.

js-site-home-cap-recovery = GNSS neu synchronisiert: { $trk } Satelliten werden nachgeführt, Zeitfehler zurück auf { $te } ns, Schutzniveau { $pl } m.

js-site-home-cap-spoofing = Ein Spoofer verstellt die Empfängeruhr mit { $rate } ns/s. Der HF-Detektor (Hochfrequenz) schlägt sofort Alarm; der uhrgestützte Monitor löst nach { $det } s aus und beendet die Phase mit { $off } ns Verstellung.

js-site-home-cn-no-lock = 0 von { $max } nachgeführt · kein Lock

js-site-home-cn-tracking = { $n } von { $max } nachgeführt

js-site-home-no-pl = kein PL

js-site-home-pause = Die Mission anhalten

js-site-home-pl-alarm = Alarm · PL über AL

js-site-home-pl-no-sats = keine Satelliten, kein PL

js-site-home-pl-not-computed = in dieser Phase nicht berechnet

js-site-home-pl-too-few = zu wenige Satelliten

js-site-home-pl-under-al = unter der AL von { $thr } m

js-site-home-play = Die Mission abspielen

js-site-home-receiver-tracking = Empfänger · { $n } nachgeführt

js-site-home-replay-restarted = Wiedergabe neu gestartet · { $file }

js-site-home-te-disciplined = auf GNSS diszipliniert

js-site-home-te-free-running = holdover · frei laufend

js-site-home-te-outside-guard = holdover · außerhalb der Schutzgrenze

js-site-home-te-spoofer = Spoofer verstellt die Uhr

js-site-home-thr-floor = Schwelle

js-site-home-thr-guard = Schutzgrenze

js-site-kind-action = Aktion

js-site-mcp-arguments-excerpt = Argumente (Auszug)

js-site-mcp-axis-mission-time = Missionszeit

js-site-mcp-clock-holdover = { $clock } holdover

js-site-mcp-dir-reply = kshana-mcp → Assistent

js-site-mcp-dir-request = Assistent → kshana-mcp

js-site-mcp-figcaption = Gezeichnet aus der zurückgegebenen Reihe: der Zeitfehler jeder Uhr gegenüber der Schwelle

js-site-mcp-fom-availability = Verfügbarkeit

js-site-mcp-fom-caption = Von run_scenario zurückgegebene Gütemaße, je Uhr

js-site-mcp-fom-header = Gütemaß

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = Zeitfehler, 95. Perzentil (ns)

js-site-mcp-fom-rms = Zeitfehler, quadratischer Mittelwert (ns)

js-site-mcp-lede = Aufgezeichnet { $recorded } · v{ $version } · Standardein- und -ausgabe · Protokoll { $protocol } · nur exakte Nachrichten

js-site-mcp-legend-gnss-lost = GNSS verloren bei { $s } s

js-site-mcp-legend-threshold = Schwelle { $v } ns

js-site-mcp-pause = Anhalten

js-site-mcp-play = Abspielen

js-site-mcp-plot-aria = Zeitfehler von { $quantum } und { $classical }, von run_scenario zurückgegeben, gegenüber der Schwelle von { $threshold } ns; GNSS (globales Satellitennavigationssystem) verloren bei { $lost } s

js-site-mcp-recorded-json = Aufgezeichnetes JSON: { $label }

js-site-mcp-scenario-hash = Szenario-Hash

js-site-mcp-server-identity = Serveridentität

js-site-mcp-show-json = JSON anzeigen

js-site-mcp-step-aria = Schritt { $n } von { $total }: { $name }

js-site-mcp-step-result = Ergebnis: Gütemaße

js-site-mcp-step-status = Schritt { $n } von { $total } · { $name }

js-site-mcp-summary-excerpt = Zusammenfassungszeile und Ergebnis (Auszug)

js-site-mcp-tab-result = Ergebnis

js-site-mcp-threshold = Schwelle

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } Zeile
       *[other] { $n } Zeilen
    }

js-site-mcp-toml-more = … ({ $n } weitere Zeilen von { $file })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } Werkzeug
       *[other] { $n } Werkzeuge
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } Werkzeug mit Beschreibungen
       *[other] { $n } Werkzeuge mit Beschreibungen
    }

js-site-menu-close = Das Menü schließen

js-site-menu-open = Das Menü öffnen

js-site-missions-avail-title = Verfügbarkeit: Anteil des Laufs mit PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % in jeder Zelle

js-site-missions-chart-error-title = Positionsfehler (m, logarithmisch)

js-site-missions-chart-four = vier für eine Positionslösung nötig

js-site-missions-chart-four-short = vier für eine Lösung

js-site-missions-chart-lg-earth = Erde sichtbar

js-site-missions-chart-lg-error-earth = Fehler, Relais und Entfernung zur Erde

js-site-missions-chart-lg-error-relays = Fehler, nur Relais

js-site-missions-chart-lg-relays = Relais in Sicht

js-site-missions-chart-relays-title = Relais in Sicht · schattiert: Erde über dem Horizont

js-site-missions-chip-at-pdop = bei PDOP ≤ { $limit }

js-site-missions-chip-engine = Engine:

js-site-missions-chip-fix-earth = Lösung, mit Erde

js-site-missions-chip-median-pdop = Median-PDOP

js-site-missions-chip-relays = Relais

js-site-missions-chip-rms = RMS-Fehler

js-site-missions-chip-satellites = Satelliten

js-site-missions-chip-tracking-held = { $label } Nachführung gehalten

js-site-missions-clocks-aria = Zeitfehler nach einem Tag holdover, nach Uhrenklasse, logarithmische Skala

js-site-missions-clocks-frame = Untergrenze des Rahmens { $ns } ns

js-site-missions-clocks-note = Zeitfehler nach einem Tag, Sekunden (logarithmisch)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns nach einem Tag, σy(1 s) { $sigma }

js-site-missions-cone-aria = Positionsfehlerkegel seit dem Verlust von GNSS

js-site-missions-cone-axis-x = Zeit seit dem Verlust von GNSS (s)

js-site-missions-cone-axis-y = Positionsfehler (m)

js-site-missions-cone-budget = ±{ $m } m Budget

js-site-missions-cone-clipped = bei ±{ $m } m abgeschnitten

js-site-missions-cone-leaves = verlässt ihn bei { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Befehl kopieren

js-site-missions-copy-title = Den Befehl kopieren, der es reproduziert

js-site-missions-deterministic = deterministisch

js-site-missions-engine-build = Engine v{ $version }, Build

js-site-missions-engine-build-commit = Engine v{ $version }, Build { $commit }

js-site-missions-fp-aria = Karte des Jamming-Fußabdrucks. Die Pfeiltasten wechseln zwischen den Zellen, die Eingabetaste öffnet den jeweiligen Lauf.

js-site-missions-fp-aria-svg = Jamming-Fußabdruck um den Störsender

js-site-missions-fp-darker = dunkler = höheres mittleres J/S · Zellen von { $step } km · { $n } Engine-Läufe

js-site-missions-fp-jammer = Störsender

js-site-missions-fp-lg-held = Nachführung gehalten

js-site-missions-fp-lg-lost = jeder Satellit verloren

js-site-missions-fp-lg-some = einige Epochen verloren

js-site-missions-fp-open = Diesen Lauf in { $studio } öffnen

js-site-missions-fp-read = etwa { $km } km vom Störsender · mittleres J/S { $js } dB · Nachführverfügbarkeit { $av }

js-site-missions-fp-ship = das Schiff des Szenarios

js-site-missions-grades-aria = Freies Inertial-Auslaufen vor { $a } m und { $b } m, nach IMU-Güteklasse

js-site-missions-grades-axis = Sekunden des Auslaufens nach dem Verlust von GNSS (logarithmisch)

js-site-missions-grades-point = { $grade }: { $s } s bis { $m } m ({ $why })

js-site-missions-grades-reaches = Fehler erreicht { $m } m

js-site-missions-grades-speed = bei { $v } m/s

js-site-missions-grades-this = dieses Szenario

js-site-missions-hud-earth-link = Erdverbindung

js-site-missions-hud-link-above = Erdverbindung · über dem Horizont

js-site-missions-hud-link-occulted = Erdverbindung · verdeckt

js-site-missions-hud-orbiter = Orbiter

js-site-missions-hud-receiver = Empfänger

js-site-missions-hud-relays = Relais

js-site-missions-hud-selected-lat = gewählter Breitengrad

js-site-missions-info-in-view = Sichtbar

js-site-missions-info-in-view-value = { $mean } im Mittel · { $fewest } am wenigsten

js-site-missions-info-pdop-above = { $pdop }, über { $limit }

js-site-missions-json-title = Das Ergebnis der Engine, unverändert

js-site-missions-json-unavailable = JSON nicht verfügbar

js-site-missions-key-avail = Verfügbarkeit

js-site-missions-key-pdop-title = Mittlerer PDOP (Positions-Dilution-of-Precision)

js-site-missions-key-vis = Sichtbare Satelliten

js-site-missions-key-vis-short = Sichtbar

js-site-missions-leo-grid = des Rasters bei PDOP ≤ { $limit }

js-site-missions-leo-in-view = im Mittel sichtbar

js-site-missions-leo-shells = Satelliten in vier Schalen

js-site-missions-map-aria = { $title } über { $body }, je Zelle von 10 Grad. Die Pfeiltasten bewegen den Empfänger; seine Zelle wird darunter ausgegeben.

js-site-missions-map-colour-by = Karte einfärben nach

js-site-missions-map-fewest-in-view = am wenigsten sichtbar

js-site-missions-map-grey = grau: keine Positionslösung

js-site-missions-map-hatched = schraffiert: über der PDOP-Grenze von { $limit }

js-site-missions-map-in-view = sichtbar

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = im Mittel sichtbar

js-site-missions-map-mean-pdop = mittlerer PDOP

js-site-missions-map-pdop-limit = PDOP-Grenze { $limit }

js-site-missions-matrix-caption = Szenariodateien nach Sektor (Zeilen) und Ausfallart (Spalten). Wählen Sie eine Zahl, um den Sektor zu öffnen.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } Szenariodatei
       *[other] { $sector }, { $mode }: { $n } Szenariodateien
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } Datei:
       *[other] { $n } Dateien:
    }

js-site-missions-matrix-sector = Sektor

js-site-missions-mode-int = Störung

js-site-missions-mode-itg = Integrität

js-site-missions-mode-nav = Auslaufen

js-site-missions-mode-orb = Geometrie

js-site-missions-mode-spf = Spoofing

js-site-missions-mode-tim = Zeitgebung

js-site-missions-n-of-total = { $n } von { $total }

js-site-missions-no-fix = keine Positionslösung

js-site-missions-no-seed = deterministisch, ohne Seed

js-site-missions-open-in-studio = In { $studio } öffnen

js-site-missions-open-report = Den Bericht der Engine öffnen

js-site-missions-ow-chart-aria = Empfängerreaktion über den Lauf für { $name }: Relais in Sicht sowie Positionsfehler nur mit Relais und mit der Entfernung zur Erde

js-site-missions-ow-chip-epochs = Epochen

js-site-missions-ow-chip-mask = Maske

js-site-missions-ow-chip-orbiter = Orbiter

js-site-missions-ow-chip-range = Entfernung σ

js-site-missions-ow-chip-relays = Relais

js-site-missions-ow-chip-relays-value = { $planes } × { $per } in { $alt } km, { $inc }°

js-site-missions-ow-chip-span = Spanne

js-site-missions-ow-count-relays = { $n } Relais und ein Orbiter · { $body }

js-site-missions-ow-count-sats = { $n } Satelliten · { $body }

js-site-missions-ow-engine = Engine v{ $version } · Build { $commit }

js-site-missions-ow-lat-label = Breitengrad des Empfängers

js-site-missions-ow-map-aria = Empfängerreaktion für { $name }: eine Karte des Körpers { $body } je Zelle von 10 Grad, daneben die mittlere und die geringste Zahl sichtbarer Satelliten sowie der mittlere PDOP nach Breitengrad

js-site-missions-ow-note-imagery = Bilddaten { $body }: NASA.

js-site-missions-ow-note-rebuilt = Bahnen: die Relais und der Orbiter, aus dem Szenario genau so neu aufgebaut, wie die Engine sie aufbaut; die daraus folgende Zahl sichtbarer Satelliten entspricht der der Engine bei allen { $n } Epochen.

js-site-missions-ow-note-sats = Bahnen: die Satelliten des Laufs, hier neu propagiert und gegen alle { $n } von der Engine geschriebenen Bodenspur-Abtastwerte geprüft (schlechtester Wert { $deg }°).

js-site-missions-ow-note-scaled = Die Bahnradien sind für die Anzeige skaliert; Ebenen, Phasenlage und Umlaufzeiten sind die des Laufs.

js-site-missions-ow-note-tracks = Die Engine hat Bodenspuren für { $shown } der { $total } Satelliten geschrieben; alle { $total } werden aus ihren Schalen gezeichnet.

js-site-missions-ow-note-walker = Bahnen: die Walker-Schalen des Laufs, hier neu propagiert und gegen alle { $n } von der Engine geschriebenen Bodenspur-Abtastwerte geprüft (schlechtester Wert { $deg }°).

js-site-missions-ow-off = aus

js-site-missions-ow-on = ein

js-site-missions-ow-pause = Die Bahnen anhalten

js-site-missions-ow-play = Die Bahnen abspielen

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Missionszeit

js-site-missions-ow-valuetext = { $time }, { $n } Relais in Sicht

js-site-missions-pdop-title = Mittlerer PDOP (Positions-Dilution-of-Precision), logarithmische Skala, niedriger ist besser

js-site-missions-report = Bericht

js-site-missions-report-title = Der eigene Bericht der Engine zu diesem Lauf

js-site-missions-ro-above-horizon = über dem Horizont

js-site-missions-ro-availability = Verfügbarkeit, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Erde · Lichtlaufzeit { $s } s

js-site-missions-ro-error-relays = Positionsfehler, nur Relais

js-site-missions-ro-occulted = verdeckt

js-site-missions-ro-place-availability = Bei { $place }: Verfügbarkeit

js-site-missions-ro-place-in-view = Bei { $place }: sichtbar, Mittel · am wenigsten

js-site-missions-ro-relays = Relais in Sicht

js-site-missions-ro-satellites = Satelliten

js-site-missions-ro-with-earth = Mit der Entfernung zur Erde

js-site-missions-run-failed = Der aufgezeichnete Lauf konnte hier nicht geladen werden; öffnen Sie ihn über den Link unten in { $studio }.

js-site-missions-seed = Seed { $seed }

js-site-missions-spoof-aria = Spoofing-Versatz gegenüber der Zeit, mit der Detektionsschranke und der Detektionszeit jedes Monitors

js-site-missions-spoof-axis-x = Zeit seit Beginn des Spoofings (s)

js-site-missions-spoof-axis-y = Zeitversatz (ns)

js-site-missions-spoof-detects = { $id } erkennt bei { $s } s

js-site-missions-spoof-lg-bound = Schranke { $id }

js-site-missions-spoof-lg-offset = Spoofing-Versatz

js-site-missions-spoof-readout = t { $t } s · Versatz { $offset } ns

js-site-missions-spoof-spec = Spezifikation { $v } ns

js-site-missions-sr-aria = { $members }; gemeinsamer Störsender { $power } dBW

js-site-missions-sr-aria-member = { $label }: Nachführung gehalten { $held } %, mittleres Störer-Signal-Verhältnis { $js } dB, wenigste nachgeführte Satelliten { $min }

js-site-missions-sr-car = Auto

js-site-missions-sr-fewest = wenigste nachgeführt

js-site-missions-sr-held = Nachführung gehalten

js-site-missions-sr-mean-js = mittleres J/S

js-site-missions-sr-ship = Schiff

js-site-missions-swipe =
    { $n ->
        [one] Wischen für die { $n } Szenariodatei
       *[other] Wischen für alle { $n } Szenariodateien
    }

js-site-missions-toml-download-title = Die Szenariodatei herunterladen, die lief

js-site-missions-toml-title = Die Szenariodatei, die lief

js-site-missions-vis-title = Sichtbare Satelliten, Mittel über den Lauf

js-site-missions-vis-uniform = { $v } in jeder Zelle

js-site-palette-none = Keine Ergebnisse

js-site-palette-results = { $count } Ergebnisse

js-site-pro-band-at = Bei { $minutes } Minuten: 5. bis 95. Perzentil

js-site-pro-band-range = { $lo } bis { $hi } { $unit }

js-site-pro-band-runs-within = von { $n } Läufen innerhalb von ±{ $limit } { $unit }

js-site-pro-design-readout = { $sat } Satelliten, { $av } % Verfügbarkeit · { $planes } Ebenen in { $alt } km, { $incl }°

js-site-pro-front-design = Front-Entwurf { $id }

js-site-pro-front-design-knee = Front-Entwurf { $id } · Knie

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } weiterer Front-Entwurf an diesem Punkt)
       *[other] (+{ $n } weitere Front-Entwürfe an diesem Punkt)
    }

js-site-pro-not-rerun = nicht erneut ausgeführt

js-site-pro-rerun-free = erneut ausgeführt in der freien Engine:

js-site-pro-same-sha = gleiches SHA-256 { $sha }…

js-site-pro-same-sha-index = gleiches Ergebnis-SHA-256 wie der Index

js-site-toast-copied = Kopiert: { $text }

js-site-toast-data-failed = Die Datendatei konnte nicht geladen werden

js-site-toast-data-saved = Daten als CSV gespeichert

js-site-toast-no-data = Keine Daten für dieses Diagramm

js-site-toast-svg-saved = Diagramm als SVG gespeichert

js-site-toast-table-saved = Tabelle als CSV gespeichert

js-site-waterfall-axis-now = jetzt

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = Signale liegen unter der Rauschschwelle

js-site-waterfall-campaign-drives = Kampagne, die es steuert:

js-site-waterfall-campaign-seed = Seed { $seed } · { $phases } Phasen über { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } Megahertz: dieses Band anzeigen

js-site-waterfall-chip-title = { $band } · { $fc } MHz · Empfängerbandbreite { $bw } MHz

js-site-waterfall-engine-build = Engine v{ $version } · Build

js-site-waterfall-fallback-head = Galileo-Rückfall · { $s } s, nur CW-Ton

js-site-waterfall-fallback-text = { $band } wieder bei { $v } dB-Hz. Integritätsüberwachung allein über Galileo: Schutzniveau { $min }–{ $max } m, unter der Alarmgrenze von { $limit } m.

js-site-waterfall-floor = { $thr } dB-Hz Nachführschwelle

js-site-waterfall-holdover-head = Holdover · { $s } s, Chirp an

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, unter der Schwelle. Die Uhr läuft frei: schlechtester Wert { $worst } ns gegenüber einer Schutzgrenze von { $guard } ns.

js-site-waterfall-jammer-off = { $what } aus

js-site-waterfall-jammer-on = { $what } ein

js-site-waterfall-live = { $freq } Megahertz, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = kein modelliertes Band

js-site-waterfall-load-failed = Der aufgezeichnete Lauf konnte nicht geladen werden. Der Bericht der Engine unten zeigt denselben Lauf.

js-site-waterfall-no-jammer-band = Kein Störsender in diesem Band

js-site-waterfall-no-jammer-in-band = kein Störsender im Band

js-site-waterfall-no-seed = deterministisch, ohne Seed

js-site-waterfall-onset-head = Beginn · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Alle { $n } Bänder werden nachgeführt, bis der Spektrumlauf bei { $s } s erstmals { $band } verliert.

js-site-waterfall-pause = Das Wasserfalldiagramm anhalten

js-site-waterfall-play = Das Wasserfalldiagramm abspielen

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = Lauf T+{ $s } s

js-site-waterfall-scale-caption = PSD über der Schwelle von { $floor } dBW/Hz · Zellen von { $bin } MHz × { $step } s

js-site-waterfall-seed = Seed { $seed }

js-site-waterfall-short-lost = verloren

js-site-waterfall-short-ok = Nachf.

js-site-waterfall-short-rec = erholt

js-site-waterfall-state-lost = Nachführung verloren

js-site-waterfall-state-lost-low = Nachführung verloren

js-site-waterfall-state-ok = Nachführung

js-site-waterfall-state-ok-low = Nachführung

js-site-waterfall-state-rec = Erholt

js-site-waterfall-state-rec-low = erholt

js-site-waterfall-summary-recovers = { $band } verliert die Nachführung bei { $lost } s und erholt sich bei { $rec } s, niedrigster Wert { $min } dB-Hz.

js-site-waterfall-summary-rows = { $n } Zeilen zu { $step } s.

js-site-waterfall-summary-stays-lost = { $band } verliert die Nachführung bei { $lost } s und bleibt verloren, niedrigster Wert { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } wird durchgehend nachgeführt, niedrigster Wert { $min } dB-Hz.

js-site-waterfall-tip-above-floor = über der Rauschschwelle

js-site-waterfall-tip-at-floor = An der thermischen Rauschschwelle

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Die Empfängerbandbreite keines modellierten Bands deckt diese Spalte ab

js-site-waterfall-wave-chirp = Chirp

js-site-waterfall-wave-cw = CW-Ton

js-site-waterfall-wave-noise = Rauschen

js-site-waterfall-who-cursor = Band unter dem Cursor

js-site-waterfall-who-selected = Gewähltes Band

js-site-waterfall-who-worst = Schlechtestes Band
