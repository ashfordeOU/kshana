# studio-js.ftl (de): translations

js-adv-all-domains = Alle Bereiche

js-adv-animation-frame-title = Animation dieses Laufs, von der Engine geschrieben

js-adv-animation-html-player = HTML-Player

js-adv-animation-html-player-title = Der Player als einzelne Datei, so wie die Engine ihn geschrieben hat

js-adv-animation-load-failed = Die aufgezeichnete Animation konnte nicht geladen werden ({ $reason }).

js-adv-animation-loading = Die aufgezeichnete Animation wird geladen …

js-adv-animation-none = Für dieses Szenario gibt es keine aufgezeichnete Animation.

js-adv-animation-note = Die Engine schreibt eine Animation zu jedem Lauf mit Zeitachse: ein selbstablaufendes SVG und einen HTML-Player als einzelne Datei mit eigenen Wiedergabe- und Suchleisten-Steuerelementen. Der Browser-Build enthält diesen Schreiber nicht; daher ist dies die Datei, die die native Kommandozeilen-Engine für das mitgelieferte Szenario geschrieben hat.

js-adv-animation-svg = Animiertes SVG

js-adv-animation-svg-title = Das selbstablaufende SVG, so wie die Engine es geschrieben hat

js-adv-axis-averaging-time = Mittelungszeit τ (s)

js-adv-axis-observation-interval = Beobachtungsintervall τ (s)

js-adv-axis-value = Wert

js-adv-badge-live-engine = Live-Engine

js-adv-badge-recorded = Aufgezeichnet

js-adv-badge-recorded-engine = Aufgezeichneter Lauf, Engine v{ $version }

js-adv-badge-recorded-native = Aufgezeichneter Lauf, native Engine v{ $version }

js-adv-band-carrier = Träger

js-adv-band-carrier-not-set = in diesem Szenario nicht gesetzt

js-adv-band-chip-rate = Chiprate

js-adv-band-jammer-bandwidth = Bandbreite des Jammers

js-adv-band-jammer-label = Jammer { $bandwidth } MHz

js-adv-band-jammer-power = Leistung des Jammers

js-adv-band-jammer-type = Typ des Jammers

js-adv-band-no-carrier-note = Die Engine berechnet das Verhältnis von Störer zu Signal aus dem Link-Budget. Dieses Szenario nennt keine Trägerfrequenz, daher wird kein Spektrum gezeichnet.

js-adv-band-satellites = Satelliten

js-adv-band-signal-main-lobe = Hauptkeule des Signals

js-adv-band-svg-label = Signal- und Jammer-Bänder um den Träger

js-adv-band-tracking-threshold = Tracking-Schwelle

js-adv-browser-cannot-run = Der Browser-Build kann dieses Szenario nicht ausführen.

js-adv-busy-running = Läuft

js-adv-busy-sweeping = Durchlauf

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } Wert weitergegeben
       *[other] { $n } Werte weitergegeben
    }

js-adv-chain-note = Ein System, verfolgt durch jede Stufe der Engine. Die Tabelle unten listet jede Zahl auf, die eine Stufe berechnet hat und die nächste Stufe verwendet hat.

js-adv-chain-stage = Stufe { $n }

js-adv-chain-sub = die Ausgabe jeder Stufe speist die nächste

js-adv-chain-title = Die Kette

js-adv-chart-allan-title = Allan-Abweichung

js-adv-chart-budget-label = Budget

js-adv-chart-default-title = Kshana-Diagramm

js-adv-chart-effective-cn0 = Effektives C/N0 je Satellit

js-adv-chart-ground-track = Bodenspur

js-adv-chart-holdover-budget = Holdover gegen ein Zeitbudget

js-adv-chart-mtie-title = MTIE (maximaler Zeitintervallfehler)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · Szenario { $hash } · kshana.dev

js-adv-chart-stability-title = Uhrenstabilität (überlappende Allan-Abweichung)

js-adv-chart-tdev-title = TDEV (Zeitabweichung)

js-adv-chart-undrawable = Dieses Diagramm konnte nicht gezeichnet werden.

js-adv-chip-live = Live-Engine · v{ $version }

js-adv-chip-live-title = Die Kshana-Engine läuft in diesem Browser als WebAssembly

js-adv-chip-recorded = Aufgezeichnete Läufe · v{ $version }

js-adv-chip-recorded-title = WebAssembly konnte hier nicht gestartet werden. Gezeigt werden echte aufgezeichnete Läufe der mitgelieferten Szenarien.

js-adv-chip-recorded-title-reason = WebAssembly konnte hier nicht gestartet werden ({ $reason }). Gezeigt werden echte aufgezeichnete Läufe der mitgelieferten Szenarien.

js-adv-chip-unavailable = Engine nicht verfügbar

js-adv-cmd-all-fields = Jedes numerische Feld anzeigen

js-adv-cmd-compare = Die angehefteten Läufe vergleichen

js-adv-cmd-embed-code = Einbettungscode kopieren

js-adv-cmd-exports = Die Ergebnisse herunterladen (Exporte)

js-adv-cmd-history = Laufverlauf öffnen

js-adv-cmd-parameters = Die Parameter öffnen

js-adv-cmd-pin = Diesen Lauf zum Vergleichen anheften

js-adv-cmd-report = Den Bericht herunterladen

js-adv-cmd-reset = Den Szenariotext zurücksetzen

js-adv-cmd-run = Das Szenario ausführen

js-adv-cmd-share-link = Link zum Teilen kopieren

js-adv-cmd-start = Zum Startbildschirm gehen

js-adv-cmd-theme = Zwischen hellem und dunklem Design wechseln

js-adv-cmd-tour = Den geführten Rundgang starten

js-adv-command-line-only = nur Kommandozeile

js-adv-compare-deltas-note = Die Differenzen beziehen sich auf Lauf A. Grün markiert den besseren Wert für jede Kennzahl.

js-adv-compare-no-common = Diese Läufe haben keine vergleichbaren Gütemaße gemeinsam. Heften Sie Läufe derselben Szenariofamilie an, um Zahlen und Differenzen zu sehen.

js-adv-compare-one-pinned = Ein Lauf ist angeheftet. Ändern Sie einen Parameter, führen Sie erneut aus und heften Sie diesen Lauf an, um die beiden zu vergleichen.

js-adv-compare-overlay = Überlagerung der angehefteten Läufe

js-adv-compare-overlay-diff = Überlagerung mit der Differenz B − A

js-adv-compare-overlay-note = Durchgezogene Linien sind Lauf A, gestrichelte Linien Lauf B, auf denselben Achsen.

js-adv-compare-overlay-title = { $title }: Lauf { $a } (A) gegen Lauf { $b } (B)

js-adv-compare-pin-two = Heften Sie mindestens zwei Läufe an, um sie nebeneinander zu vergleichen. Heften Sie einen Lauf an, ändern Sie einen Parameter oder wählen Sie ein anderes Szenario derselben Familie, führen Sie es aus und heften Sie erneut an.

js-adv-compare-run-heading = { $letter } · Lauf { $run }

js-adv-copy-blocked = Kopieren ist hier blockiert.

js-adv-copy-command = Kopieren: { $command }

js-adv-could-not-load = { $file } konnte nicht geladen werden.

js-adv-coverage-dots = Die Punkte sind { $shown } von { $total } Satelliten, entlang ihrer Bodenspuren bewegt; spielen Sie die Wiedergabe ab, um sie zu bewegen.

js-adv-coverage-field-label = Abzubildendes Feld

js-adv-coverage-map = Abdeckungskarte

js-adv-coverage-map-over = über { $body }

js-adv-coverage-map-select = Abbilden

js-adv-coverage-note = Jede Zelle ist ein Gitterpunkt auf { $body }, bewertet über jede Epoche des Laufs.

js-adv-coverage-title = { $field } über { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = Der Startbildschirm: alle Bereiche

js-adv-decrease-field = { $field } verringern

js-adv-domain = Bereich

js-adv-domain-line-campaigns = Verkettete Missionen, Durchläufe und Monte-Carlo-Läufe auf einer Uhr.

js-adv-domain-line-constellations = Eine Konstellation entwerfen und ihre Abdeckung und PDOP (Dilution of Precision der Position) abbilden.

js-adv-domain-line-deepspace = Navigation und Zeit am Mond, im cislunaren Raum und am Mars.

js-adv-domain-line-integrity = Positionsfixes und ob man ihnen trauen kann: RAIM (Receiver Autonomous Integrity Monitoring) und seine erweiterte Form, ARAIM.

js-adv-domain-line-interference = Jammer gegen GNSS-Empfänger: was verloren geht und wann.

js-adv-domain-line-leo = Navigationssignale, Überflüge, Nachrichten und Fixes im niedrigen Erdorbit.

js-adv-domain-line-leo-missions = Studien und Dienste auf Basis einer Schicht im niedrigen Erdorbit.

js-adv-domain-line-navigation = Inertiale, Gelände-, Schwere- und andere Navigation ohne GNSS.

js-adv-domain-line-optional = Eine optionale Gruppe von Szenarien.

js-adv-domain-line-orbits = Bahnpropagation, Ephemeriden und GNSS-Geometrie.

js-adv-domain-line-solar = Jeder Planet und Mond zu einer Epoche, mit Lichtlaufzeiten.

js-adv-domain-line-spaceops = Überflüge, Startfenster, Wiedereintritt, Link- und Lagebudgets.

js-adv-domain-line-spectrum = Wasserfalldiagramme des Funkbands: Jammer, Signale und was der Empfänger verfolgt.

js-adv-domain-line-spoofing = Falsche Signale und Meaconing sowie die Monitore, die sie erkennen.

js-adv-domain-line-studies = Quantensensoren, Trade-off-Studien und Interoperabilitätsformate.

js-adv-domain-line-timing = Uhren ohne GNSS: Holdover, Stabilität, Telekom-Masken, Zeitübertragung.

js-adv-domain-pick-hint = Wählen Sie eines aus: Es öffnet und läuft in Ihrem Browser. Danach können Sie seine Parameter ändern.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } Szenario
       *[other] { $label }: { $n } Szenarien
    }

js-adv-domain-select-label = Einen Bereich anzeigen

js-adv-download = Herunterladen

js-adv-edited-cli-only-status = Bearbeitet: Dieses Szenario läuft nur in der Kommandozeilen-Engine.

js-adv-edited-needs-engine = Bearbeitet: benötigt Engine { $need }.

js-adv-edited-needs-live-engine = Bearbeitete Szenarien benötigen die Live-Engine.

js-adv-embed-copied = Einbettungscode kopiert.

js-adv-engine-chart = Engine-Diagramm

js-adv-engine-chart-alt = Engine-Diagramm für diesen Lauf

js-adv-engine-file-http-error = die Engine-Datei lieferte HTTP { $status }

js-adv-engine-load-failed-no-recordings = die Engine konnte nicht geladen werden ({ $reason }) und es wurden keine aufgezeichneten Läufe gefunden

js-adv-engine-loading = Engine wird geladen …

js-adv-engine-loading-title = Die Live-Engine wird noch heruntergeladen. Dieses aufgezeichnete Ergebnis wird durch einen Live-Lauf ersetzt, sobald sie bereit ist.

js-adv-engine-start-failed = Die Engine konnte nicht gestartet werden: { $reason }. Stellen Sie diesen Ordner über HTTP bereit (zum Beispiel python3 -m http.server), anstatt die Datei direkt zu öffnen.

js-adv-entries-count = { $n } Einträge

js-adv-export-card-title = Export { $format }

js-adv-export-csv-desc = Dieselben Bytes, die das Kommandozeilenwerkzeug als { $file } schreibt.

js-adv-export-csv-title = Reproduzierbarkeitstabelle

js-adv-export-ephemeris-checking = Es wird geprüft, welche Ephemeridenformate dieser Lauf exportieren kann …

js-adv-export-ephemeris-waiting = Die Ephemeridenexporte erscheinen hier, sobald die Engine geladen ist.

js-adv-export-json-desc = Die vollständige Ausgabe der Engine für diesen Lauf, einschließlich Einheiten und Provenienz.

js-adv-export-json-title = Vollständiges Ergebnisdokument

js-adv-export-large-not-recorded = Dieser Export ist groß und wurde deshalb nicht aufgezeichnet. Er benötigt die Live-Engine.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) für GMAT, Orekit oder STK

js-adv-export-omm-desc = CCSDS OMM (Orbit Mean-elements Message), Katalog

js-adv-export-report-desc = Eine Offline-Datei: Zusammenfassung, Zahlen mit ihren Stufen, jedes Diagramm und der genaue Szenariotext, gestempelt mit Engine-Version und Szenario-Hash.

js-adv-export-report-title = Reproduzierbarer Bericht

js-adv-export-sp3-desc = Präzise SP3-c-Ephemeride dieser Konstellation

js-adv-export-toml-desc = Die genaue Eingabe dieses Laufs. Führen Sie ihn überall erneut aus, mit dem Kommandozeilenwerkzeug oder den Python- und npm-Paketen.

js-adv-export-toml-title = Szenariodatei

js-adv-export-too-large = { $desc }. Zu groß zum Aufzeichnen: benötigt die Live-Engine.

js-adv-field-find-match =
    { $n ->
        [one] { $n } geführtes Steuerelement und { $fields } von { $total } Feldern passen zu „{ $query }“.
       *[other] { $n } geführte Steuerelemente und { $fields } von { $total } Feldern passen zu „{ $query }“.
    }

js-adv-field-find-none = Kein Feld dieses Szenarios passt zu „{ $query }“. Durchsuchen Sie alle Szenarien mit der Bibliothekssuche.

js-adv-field-hit-in = in { $title }

js-adv-field-not-single-number = Dieses Feld ist in diesem Szenario keine einzelne Zahl: Bearbeiten Sie es in der Quelle.

js-adv-field-opened = Geöffnet bei { $field }. Ändern Sie es, und das Szenario läuft erneut.

js-adv-fields-matching = Felder, die zu „{ $query }“ passen

js-adv-fields-more = { $n } weitere: Verfeinern Sie die Wörter oder suchen Sie auf dem Startbildschirm.

js-adv-fields-top-level = oberste Ebene

js-adv-filter-check-tuning = Abstimmung prüfen

js-adv-filter-consistent = konsistent

js-adv-from-the-link = aus dem Link

js-adv-geo-sub = { $name } · { $shown } von { $total } Objekten gezeichnet · mit der nativen Engine aufgezeichnet

js-adv-geo-title = GeoJSON-Export: { $name }

js-adv-gt-note = Hervorgehoben: Satellit von der Station aus sichtbar.

js-adv-gt-note-both = Hervorgehoben: Satellit von der Station aus sichtbar. Maximale Elevation { $elevation }°. Maximaler Doppler { $doppler } Hz.

js-adv-gt-note-doppler = Hervorgehoben: Satellit von der Station aus sichtbar. Maximaler Doppler { $doppler } Hz.

js-adv-gt-note-elevation = Hervorgehoben: Satellit von der Station aus sichtbar. Maximale Elevation { $elevation }°.

js-adv-heatmap-label = Heatmap { $metric }

js-adv-hist-runs-count = { $n } Läufe.

js-adv-history-pin = Anheften

js-adv-history-restore = Wiederherstellen

js-adv-history-run-time = Lauf { $run } · { $time }

js-adv-holdover-engine-figure = Holdover der Engine beim Szenariobudget: { $duration }

js-adv-holdover-engine-figure-budget = Holdover der Engine beim Szenariobudget ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = Fehler nach dem GNSS-Verlust bei t = { $loss } s

js-adv-holdover-error-since-fix = Fehler seit dem letzten Fix

js-adv-holdover-stays-inside = bleibt über die gesamte Aufzeichnung innerhalb dieses Budgets

js-adv-holdover-until-breached = bis das Budget überschritten wird

js-adv-honesty-modelled = Physik aus ersten Prinzipien mit Tests, noch nicht gegen eine externe unabhängige Referenz geprüft. { $text }

js-adv-honesty-partner = Zahlen im Besitz eines Partners. { $text }

js-adv-honesty-validated = Gegen eine unabhängige externe Referenz geprüft. { $text }

js-adv-increase-field = { $field } erhöhen

js-adv-install-version = v{ $version } installieren

js-adv-interop-no-file = Die Engine hat für diesen Lauf keine Datei dieses Formats geschrieben.

js-adv-interop-not-applicable = Gilt nicht für dieses Szenario: { $reason }.

js-adv-interop-not-bundled = Hier nicht mitgeliefert (Größe): Der obige Befehl schreibt sie.

js-adv-interop-note = Die Engine schreibt die Geometrie und die Signalabtastwerte eines Laufs in Formaten, die andere Werkzeuge öffnen: CZML für Cesium, KML (Keyhole Markup Language) für Google Earth, GeoJSON für Karten, STK-Ephemeriden-Dateien (.e) und SigMF-Aufzeichnungen (Signal Metadata Format). Der Browser-Build enthält diese Schreiber nicht; daher sind die Dateien unten diejenigen, die die native Kommandozeilen-Engine für das mitgelieferte Szenario geschrieben hat.

js-adv-js-range-label = J/S-Bereich

js-adv-js-range-value = { $low } bis { $high } dB

js-adv-json-copied = JSON kopiert.

js-adv-kind-default = kind: clock holdover (der Standard)

js-adv-kind-label = kind: { $kind }

js-adv-kpi-check = Prüfen

js-adv-kpi-delta-since-run = { $arrow } { $change } seit Lauf { $run }

js-adv-kpi-fail = Nicht bestanden

js-adv-kpi-first-run = erster Lauf

js-adv-kpi-not-in-previous = nicht in Ihrem vorherigen Lauf

js-adv-kpi-pass = Bestanden

js-adv-lib-count-all = { $scenarios } Szenarien · { $domains } Bereiche

js-adv-lib-count-filtered = { $n } von { $total } Szenarien

js-adv-lib-no-match = Kein Szenario und kein Feld passt. Versuchen Sie ein Wort wie jamming, clock, lunar, orbit, mask oder PDOP.

js-adv-loaded-shared = Ein geteiltes Szenario wurde aus dem Link geladen.

js-adv-mask-envelope = Holdover-Zeitfehler-Hüllkurve ({ $source })

js-adv-mask-exceeded-after = überschritten nach { $duration }

js-adv-mask-limit-label = Grenzwert { $limit } ns

js-adv-mask-max-te = max |TE|

js-adv-mask-not-exceeded = nicht überschritten

js-adv-matrix-counts = { $validated } von { $total }

js-adv-matrix-line = { $counts } Fähigkeiten gegen unabhängige externe Referenzen validiert · { $modelled } modelliert · { $partner } im Besitz von Partnern

js-adv-max-close = Schließen

js-adv-max-close-label = Vollbild schließen

js-adv-max-expand = Erweitern

js-adv-max-expand-label = Dieses Feld auf Vollbild erweitern

js-adv-max-title = Dieses Feld im Vollbild zeigen (Escape schließt es)

js-adv-meta-engine = Engine

js-adv-meta-file = Datei

js-adv-meta-scenario = Szenario

js-adv-meta-seed = Seed

js-adv-meta-time = Zeit

js-adv-mission-timeline = Missionszeitleiste

js-adv-native-edited-notice = { $why } Der aufgezeichnete Lauf stammt von der mitgelieferten Datei, daher kann hier keine bearbeitete Kopie gezeigt werden: Führen Sie sie mit dem Kommandozeilenwerkzeug aus oder nutzen Sie Zurücksetzen, um die Aufzeichnung zu sehen.

js-adv-native-notice-command = { $why } Sie sehen einen Lauf, der mit der nativen Kommandozeilen-Engine v{ $version } durch Ausführen von { $command } aufgezeichnet wurde und unverändert gezeigt wird. Er läuft beim Bearbeiten nicht erneut.

js-adv-native-notice-plain = { $why } Sie sehen einen Lauf, der mit der nativen Kommandozeilen-Engine v{ $version } aufgezeichnet wurde und unverändert gezeigt wird. Er läuft beim Bearbeiten nicht erneut.

js-adv-native-notice-platform = { $why } Sie sehen einen Lauf, der mit der nativen Kommandozeilen-Engine v{ $version } ({ $platform }) aufgezeichnet wurde und unverändert gezeigt wird. Er läuft beim Bearbeiten nicht erneut.

js-adv-native-notice-platform-command = { $why } Sie sehen einen Lauf, der mit der nativen Kommandozeilen-Engine v{ $version } ({ $platform }) durch Ausführen von { $command } aufgezeichnet wurde und unverändert gezeigt wird. Er läuft beim Bearbeiten nicht erneut.

js-adv-needs-live-engine = Dies benötigt die Live-Engine.

js-adv-needs-newer-engine-status = Benötigt eine neuere Engine.

js-adv-nees-line = NEES { $mean } (95-%-Band { $low }–{ $high }, Zielwert 2.0)

js-adv-newer-engine-edited-notice = Dieses Szenario benötigt Engine { $need } oder neuer; die hier laufende Engine ist v{ $version }. Nur die Aufzeichnung der mitgelieferten Datei kann gezeigt werden: Nutzen Sie Zurücksetzen, um sie zu sehen, oder führen Sie eine bearbeitete Kopie mit Engine { $need } aus.

js-adv-newer-engine-no-recording = Dieses Szenario benötigt Engine { $need } oder neuer; die hier laufende Engine ist v{ $version }. Hier gibt es dazu keine Aufzeichnung.

js-adv-newer-engine-shown-commit = Dieses Szenario benötigt Engine { $need } oder neuer; die hier laufende Engine ist v{ $version }. Sie sehen den Lauf, der mit einem Engine-Build beim Commit { $commit } aufgezeichnet wurde und unverändert gezeigt wird; er läuft hier nicht erneut.

js-adv-newer-engine-shown-version = Dieses Szenario benötigt Engine { $need } oder neuer; die hier laufende Engine ist v{ $version }. Sie sehen den Lauf, der mit Engine v{ $recorded } aufgezeichnet wurde und unverändert gezeigt wird; er läuft hier nicht erneut.

js-adv-nis-line = NIS { $mean } (95-%-Band { $low }–{ $high }, Zielwert 1.0)

js-adv-no-guided-controls = Dieses Szenario hat keines der geführten Steuerelemente. Nutzen Sie Alle Felder oder bearbeiten Sie die Quelle.

js-adv-no-numeric-fields = Hier gibt es keine einzelnen numerischen Felder zum Abstimmen. Bearbeiten Sie die Quelle direkt.

js-adv-no-recorded-run = Für dieses Szenario gibt es keinen aufgezeichneten Lauf. Es benötigt die Live-Engine.

js-adv-no-summary = (dieses Szenario veröffentlicht keine einzeilige Zusammenfassung)

js-adv-noise-floor = Rauschteppich { $level }

js-adv-not-in-browser-status = Dieses Szenario läuft nicht im Browser.

js-adv-open-and-run = Öffnen und ausführen

js-adv-open-at-field = an diesem Feld öffnen

js-adv-opened-from-simple = Geöffnet mit den Einstellungen, die Sie in der einfachen Ansicht geändert haben.

js-adv-optional-preset = optionale Voreinstellung: scenarios/{ $file }

js-adv-orbit-canvas-label = Interaktive 3D-Ansicht der propagierten Spur

js-adv-orbit-fallback-alt = Orthographische Ansicht der propagierten Spur

js-adv-orbit-note-epoch = Ziehen zum Drehen, Scrollen oder Zusammenziehen zum Zoomen. Erde maßstabsgetreu, NASA-Blue-Marble-Bilder. Auf die Epoche des Laufs gedreht.

js-adv-orbit-note-no-epoch = Ziehen zum Drehen, Scrollen oder Zusammenziehen zum Zoomen. Erde maßstabsgetreu, NASA-Blue-Marble-Bilder. Dieser Lauf nennt keine Epoche, daher ist der Drehwinkel der Erde hier nicht aussagekräftig.

js-adv-orbit-static-note = Statische Ansicht (die 3D-Bibliothek konnte hier nicht geladen werden).

js-adv-pal-commands = Befehle

js-adv-pal-domain = Bereich: { $name }

js-adv-pal-domains = Bereiche

js-adv-pal-field = Feld: { $name }

js-adv-pal-fields = Felder

js-adv-pal-nothing = Nichts passt

js-adv-pal-opens-page = öffnet eine Seite

js-adv-pal-page = Seite: { $name }

js-adv-pal-pages = Seiten

js-adv-pal-panel = Feld: { $name }

js-adv-pal-panels = Felder

js-adv-pal-scenarios = Szenarien

js-adv-params-hint-all = Jede einzelne Zahl im Szenario. Schalten Sie sie schrittweise, tippen Sie sie ein oder nutzen Sie die Pfeiltasten; das Szenario läuft erneut.

js-adv-params-hint-guided = Ziehen Sie einen Schieberegler, und das Szenario läuft erneut. Jedes Steuerelement schreibt direkt in den Szenariotext darunter.

js-adv-pin-already = Dieser Lauf ist bereits angeheftet.

js-adv-pin-first = Lauf { $run } angeheftet. Ändern Sie einen Parameter, führen Sie erneut aus und heften Sie dann auch diesen Lauf an.

js-adv-pin-label = { $letter } · { $title } · Lauf { $run }

js-adv-pin-opening-compare = { $n } Läufe angeheftet. Vergleich wird geöffnet.

js-adv-plan-view = Draufsicht

js-adv-plan-view-epoch = bei { $epoch }

js-adv-plan-view-note = Jeder Punkt ist ein Körper zur Epoche des Laufs, und jede Kurve ist die Bahnspur, die die Engine für ihn berechnet hat. Eine gestrichelte Linie ist eine Verbindung, die das Szenario verlangt. Wählen Sie einen Planeten, um seine Monde um ihn zu sehen.

js-adv-player-name-mission = Missionswiedergabe

js-adv-player-name-orbit = Bahnwiedergabe

js-adv-player-name-replay = Wiedergabe

js-adv-player-name-waterfall = Wasserfallwiedergabe

js-adv-player-pause = { $name } anhalten

js-adv-player-play = { $name } abspielen

js-adv-player-position = Position in der { $name }

js-adv-png-download-title = Hochauflösende Bitmap für Folien und Dokumente

js-adv-png-export-failed = PNG-Export fehlgeschlagen: { $reason }

js-adv-ready-live = Bereit. Läuft lokal in Ihrem Browser.

js-adv-ready-recorded = Bereit. Es werden aufgezeichnete Läufe gezeigt.

js-adv-receiver-at-time = Empfänger bei t = { $time }

js-adv-recorded-edit-notice = WebAssembly ist auf dieser Seite blockiert, daher zeigt diese Seite echte Läufe der mitgelieferten Szenarien, aufgezeichnet mit Engine v{ $version }. Bearbeitete Szenarien, Durchläufe und neue Exporte benötigen die Live-Engine: Öffnen Sie kshana.dev oder stellen Sie diesen Ordner lokal bereit. Zurücksetzen stellt das aufgezeichnete Szenario wieder her.

js-adv-recorded-edited-warning = Sie haben das Szenario bearbeitet: Diese Aufzeichnung stammt von der mitgelieferten Datei, nicht von Ihrer Bearbeitung. Führen Sie den Befehl auf Ihrer eigenen Datei aus, um Ihren Lauf zu erhalten.

js-adv-recorded-intro = WebAssembly ist auf dieser Seite blockiert, daher zeigt diese Seite echte Läufe der mitgelieferten Szenarien, aufgezeichnet mit Engine v{ $version }. Bearbeiten, Durchläufe und neue Exporte benötigen die Live-Engine auf kshana.dev.

js-adv-recorded-run-native = aufgezeichneter Lauf, native Engine

js-adv-recorded-written-by = Geschrieben von der nativen Kommandozeilen-Engine v{ $version } ({ $platform }) mit { $command }. Unverändert gezeigt.

js-adv-replay = Wiedergabe

js-adv-report-downloaded = Bericht heruntergeladen.

js-adv-report-frame-title = Laufbericht, von der Engine geschrieben

js-adv-report-html = Bericht (HTML)

js-adv-report-html-title = Die Berichtsdatei, so wie die Engine sie geschrieben hat

js-adv-report-load-failed = Der aufgezeichnete Bericht konnte nicht geladen werden ({ $reason }).

js-adv-report-loading = Der aufgezeichnete Bericht wird geladen …

js-adv-report-none = Für dieses Szenario gibt es keinen aufgezeichneten Bericht.

js-adv-report-note = Jeder Kommandozeilenlauf schreibt einen Bericht: Zusammenfassung, Eingaben, Ergebnisse, das Diagramm, was validiert und was modelliert ist, und einen Reproduzierbarkeitsnachweis. Der Browser-Build enthält diesen Schreiber nicht; daher ist dies der Bericht, den die native Kommandozeilen-Engine für das mitgelieferte Szenario geschrieben hat. Der eigene Bericht des Studios zum Lauf auf dem Bildschirm steht unter Exporte.

js-adv-report-open-tab = In neuem Tab öffnen

js-adv-report-open-tab-title = Den Bericht für sich öffnen

js-adv-report-orbit-title = Bahn (erdzentriert inertial, orthographisch)

js-adv-report-stability-chart = Uhrenstabilität

js-adv-report-stability-title = Uhrenstabilität (Allan-Abweichung)

js-adv-restored-run = Lauf { $run } wiederhergestellt.

js-adv-result = Ergebnis

js-adv-run-cancelled = Lauf abgebrochen.

js-adv-run-cancelled-previous = Lauf abgebrochen. Das vorherige Ergebnis wird weiter gezeigt.

js-adv-run-failed = Lauf fehlgeschlagen. Siehe die Meldung in den Ergebnissen.

js-adv-scenario-copied = Szenario kopiert.

js-adv-scenarios-count = { $n } Szenarien

js-adv-share-link-copied = Link zum Teilen kopiert. Er enthält das genaue Szenario.

js-adv-share-link-in-bar = Link in die Adressleiste gesetzt.

js-adv-shared-link = geteilter Link

js-adv-shared-needs-live = Dieser Link enthält sein eigenes Szenario, das die Live-Engine benötigt. Öffnen Sie ihn auf kshana.dev.

js-adv-shared-scenario = Geteiltes Szenario

js-adv-shared-scenario-question = Ein Szenario, das aus einem Link zum Teilen geöffnet wurde. Es läuft genau so, wie es geteilt wurde.

js-adv-solar-bodies-label = Welche Körper gezeichnet werden

js-adv-spectrum-part-label = Welcher Teil des Spektrums

js-adv-spectrum-row-note = Das Spektrum entlang der Wasserfallzeile, bei der die Wiedergabe gerade steht.

js-adv-spectrum-row-title = Spektrum entlang der angezeigten Zeile

js-adv-start-field-meta = { $domain } · Feld { $field }

js-adv-start-fields-hint = Jedes öffnet das Szenario mit diesem hervorgehobenen Steuerelement, bereit zur Änderung.

js-adv-start-fields-named =
    { $n ->
        [one] Felder mit Namen wie „{ $query }“: in { $n } Szenario
       *[other] Felder mit Namen wie „{ $query }“: in { $n } Szenarien
    }

js-adv-start-more-matches = { $n } weitere Treffer: Fügen Sie ein Wort hinzu, um sie einzugrenzen.

js-adv-start-nothing = Nichts passt zu „{ $query }“. Versuchen Sie ein Wort wie jamming, clock, lunar, orbit, mask oder PDOP.

js-adv-start-scenarios-count = Szenarien ({ $count })

js-adv-status-fetching-recorded = Engine wird geladen … Das aufgezeichnete Ergebnis dieses Szenarios wird abgerufen.

js-adv-status-ran-locally = Lokal ausgeführt um { $time }, Lauf { $run }.

js-adv-status-ran-locally-secs = Lokal ausgeführt um { $time }, Lauf { $run }, { $secs } s.

js-adv-status-recorded-native = Aufgezeichneter Lauf gezeigt um { $time } (native Engine).

js-adv-status-recorded-needs-engine = Aufgezeichneter Lauf gezeigt um { $time } (benötigt Engine { $need }).

js-adv-status-recorded-shown = Aufgezeichneter Lauf gezeigt um { $time }, Lauf { $run }.

js-adv-status-recorded-shown-secs = Aufgezeichneter Lauf gezeigt um { $time }, Lauf { $run }, { $secs } s.

js-adv-status-showing-recorded = Engine wird geladen … Das aufgezeichnete Ergebnis dieses Szenarios wird gezeigt, bis die Live-Engine bereit ist.

js-adv-subtabs-label = Kacheln dieser Ansicht (Telefon)

js-adv-suggest-campaign = Eine Mission aus Jamming, Spoofing und Holdover wiedergeben

js-adv-suggest-coverage = Die Abdeckung von vier GNSS-Konstellationen (Global Navigation Satellite System) abbilden

js-adv-suggest-holdover = Haltezeit bei GNSS-Verlust

js-adv-suggest-waterfall = Einen Jammer im L-Band-Wasserfall beobachten

js-adv-svg-download-title = Vektordiagramm mit Titel und Provenienz

js-adv-sweep-cancelled = Durchlauf abgebrochen.

js-adv-sweep-done-grid = { $total } Läufe ({ $columns } × { $rows }) lokal in { $time } durchlaufen.

js-adv-sweep-done-line = { $done } von { $total } Läufen lokal in { $time } durchlaufen.

js-adv-sweep-enter-range = Geben Sie einen numerischen Bereich ein.

js-adv-sweep-enter-range-second = Geben Sie einen numerischen Bereich für den zweiten Parameter ein.

js-adv-sweep-failed = Durchlauf fehlgeschlagen: { $reason }

js-adv-sweep-interrupted = Durchlauf durch einen neuen Lauf unterbrochen.

js-adv-sweep-needs-live = Ein Durchlauf führt die Engine viele Male aus und benötigt daher die Live-Engine.

js-adv-sweep-none-line-chart = Keiner (Liniendiagramm)

js-adv-sweep-nothing = Für dieses Szenario gibt es nichts zu durchlaufen.

js-adv-sweep-progress = Durchlauf { $n } von { $total } …

js-adv-sweep-status-done = { $total } Läufe um { $time } durchlaufen.

js-adv-sweep-title-grid = { $metric } über { $first } und { $second }

js-adv-sweep-title-line = { $metric } gegen { $parameter }

js-adv-sweep-wait = Warten Sie, bis der aktuelle Lauf beendet ist, und starten Sie dann den Durchlauf.

js-adv-tab-animation = Animation

js-adv-tab-compare = Vergleichen

js-adv-tab-engine-report = Engine-Bericht

js-adv-tab-exports-report = Exporte und Bericht

js-adv-tab-ground-track = Bodenspur

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = 3D-Bahn

js-adv-tab-overview = Übersicht

js-adv-tab-signal-band = Signal und Band

js-adv-tab-stability = Stabilität

js-adv-tab-sweep = Durchlauf

js-adv-tab-time-series = Zeitreihe

js-adv-tab-timing-masks = Zeitgebungsmasken

js-adv-th-at-tau-or-time = Bei τ oder Zeit

js-adv-th-body = Körper

js-adv-th-clock = Uhr

js-adv-th-distance-sun = Abstand von der Sonne

js-adv-th-figure = Zahl

js-adv-th-file = Datei

js-adv-th-format = Format

js-adv-th-key-figure = Kennzahl

js-adv-th-light-time-from = Einweg-Lichtlaufzeit von { $observer }

js-adv-th-light-time-observer = Einweg-Lichtlaufzeit vom Beobachter

js-adv-th-limit = Grenzwert

js-adv-th-margin = Marge

js-adv-th-mask-or-budget = Maske oder Budget

js-adv-th-metric = Metrik

js-adv-th-orbital-period = Umlaufzeit

js-adv-th-provenance = Provenienz

js-adv-th-size = Größe

js-adv-th-source = Quelle

js-adv-th-tier = Stufe

js-adv-th-unit = Einheit

js-adv-th-value = Wert

js-adv-th-verdict = Urteil

js-adv-th-what-it-is = Was es ist

js-adv-the-body = der Körper

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } Szenario
       *[other] { $n } Szenarien
    }

js-adv-timeline-chart-title = Missionszeitleiste: { $title }

js-adv-timeline-latest-event = Letztes Ereignis, um { $time }: { $label }

js-adv-timeline-no-event = Zu diesem Zeitpunkt noch kein Ereignis.

js-adv-timeline-note = Ein Schieberegler steuert alle Diagramme darunter. Jede Phase führt gewöhnliche Szenarien aus; die Kampagne liest deren Ausgaben auf ein gemeinsames Zeitraster. Schattierte Bänder sind die Phasen, senkrechte Linien die Ereignisse. Die Werte oben sind die Kanäle der Kampagne zur Wiedergabezeit.

js-adv-timeline-on-one-clock = { $duration } auf einer Uhr

js-adv-timeline-phase = Phase: { $phase }

js-adv-tour-back = Zurück

js-adv-tour-done = Fertig

js-adv-tour-eyebrow = Geführter Rundgang

js-adv-tour-headline-body = Die einzeilige Zusammenfassung, die Engine-Version und der Fingerabdruck des Szenarios sowie ob jede Zahl validiert oder modelliert ist.

js-adv-tour-headline-title = Die Antwort lesen

js-adv-tour-keyboard-body = ⌘K findet jedes Szenario, jede Ansicht und jeden Befehl. [ und ] wechseln zwischen den Ansichten.

js-adv-tour-keyboard-title = Alles per Tastatur

js-adv-tour-library-body = Jedes mitgelieferte Szenario, gruppiert nach Missionsbereich: Jamming, Spektrum, Spoofing, Uhren, Navigation, Integrität, Bahnen, Konstellationsentwurf, Navigation im niedrigen Erdorbit, Kampagnen, der Mond, der Mars und das Sonnensystem. Suchen mit /.

js-adv-tour-library-title = Eine Mission wählen

js-adv-tour-next = Weiter

js-adv-tour-params-body = Geführte Schieberegler für die gängigen Stellgrößen oder jedes numerische Feld im Szenario. Jede Änderung löst einen neuen Lauf aus.

js-adv-tour-params-title = Abstimmen

js-adv-tour-pin-body = Heften Sie bis zu vier Läufe an und sehen Sie sie nebeneinander, mit Differenzen und einer Differenzkurve.

js-adv-tour-pin-title = Läufe vergleichen

js-adv-tour-run-body = Die Rust-Engine läuft in Ihrem Browser als WebAssembly. Nichts wird hochgeladen. ⌘↵ führt von überall aus.

js-adv-tour-run-title = Lokal ausführen

js-adv-tour-share-body = Laden Sie den Bericht, das Ergebnis, das Szenario und die Exporte der Engine herunter, kopieren Sie einen Link mit dem genauen Szenario oder einen iframe für eine Kursseite oder ein Wiki.

js-adv-tour-share-title = Teilen oder exportieren

js-adv-tour-skip = Überspringen

js-adv-tour-source-body = Das vollständige Szenario in TOML. Was Sie ausführen, können Sie genau so teilen und reproduzieren.

js-adv-tour-source-title = Oder alles bearbeiten

js-adv-tour-tabs-body = Ansichten erscheinen, wenn das Ergebnis sie unterstützt: Signal und Band für Jamming, der Wasserfall für Spektrum, die Missionszeitleiste für Kampagnen, Abdeckungskarten für Konstellationen, Holdover für Uhren, Masken für Telekom-Zeitgebung, 3D-Bahnen, Bodenspuren, Durchläufe sowie die eigene Animation und der eigene Bericht der Engine.

js-adv-tour-tabs-title = Jede Ansicht des Laufs

js-adv-tracking-threshold-value = Tracking-Schwelle { $value }

js-adv-transport-label = Wiedergabe: Ein Schieberegler steuert jedes Feld dieses Laufs

js-adv-transport-sub = ein Schieberegler steuert jedes Feld dieses Laufs

js-adv-unpin-run = Lauf { $run } lösen

js-adv-waterfall = Wasserfall

js-adv-waterfall-note = Die Farbe ist die Leistung über dem Rauschteppich des Empfängers. Die Navigationssignale liegen unter diesem Teppich, daher leuchten die Jammer auf. Spielen Sie die Wiedergabe ab oder ziehen Sie sie, und die Bänder rechts zeigen, was der Empfänger in diesem Moment noch verfolgt.

js-adv-waterfall-sub = spektrale Leistungsdichte: Frequenz quer, Zeit nach unten

js-adv-waterfall-title = Wasserfall, { $name }

js-adv-webassembly-unavailable = WebAssembly nicht verfügbar

js-app-all-questions = Alle Fragen

js-app-anim-frame-title = Animation dieses Laufs, von der Engine geschrieben

js-app-anim-html-player = HTML-Player

js-app-anim-html-player-title = Der Player als einzelne Datei, so wie die Engine ihn geschrieben hat

js-app-anim-load-failed = Die aufgezeichnete Animation konnte nicht geladen werden ({ $reason }).

js-app-anim-loading = Die aufgezeichnete Animation wird geladen …

js-app-anim-none = Für dieses Szenario gibt es keine aufgezeichnete Animation.

js-app-anim-note = Die Engine schreibt eine Animation zu jedem Lauf mit Zeitachse: ein selbstablaufendes SVG und einen HTML-Player als einzelne Datei mit eigenen Wiedergabe- und Suchleisten-Steuerelementen. Der Browser-Build enthält diesen Schreiber nicht; daher ist dies die Datei, die die native Kommandozeilen-Engine für das mitgelieferte Szenario geschrieben hat.

js-app-anim-svg = Animiertes SVG

js-app-anim-svg-title = Das selbstablaufende SVG, so wie die Engine es geschrieben hat

js-app-axis-averaging-time = Mittelungszeit τ (s)

js-app-axis-observation-interval = Beobachtungsintervall τ (s)

js-app-axis-value = Wert

js-app-badge-modelled = { $n } modelliert

js-app-badge-recorded = Aufgezeichnet

js-app-badge-validated = { $n } validiert

js-app-band-carrier = Träger

js-app-band-carrier-unset = in diesem Szenario nicht gesetzt

js-app-band-chip-rate = Chiprate

js-app-band-jammer-bandwidth = Bandbreite des Jammers

js-app-band-jammer-mhz = Jammer { $mhz } MHz

js-app-band-jammer-power = Leistung des Jammers

js-app-band-jammer-type = Typ des Jammers

js-app-band-main-lobe = Hauptkeule des Signals

js-app-band-no-carrier-note = Die Engine berechnet das Verhältnis von Störer zu Signal aus dem Link-Budget. Dieses Szenario nennt keine Trägerfrequenz, daher wird kein Spektrum gezeichnet.

js-app-band-satellites = Satelliten

js-app-band-svg-label = Signal- und Jammer-Bänder um den Träger

js-app-band-tracking-threshold = Tracking-Schwelle

js-app-browse-all-title = Alle { $n } Szenarien

js-app-browse-area-kicker =
    { $n ->
        [one] Bereich · { $n } Szenario
       *[other] Bereich · { $n } Szenarien
    }

js-app-browse-area-lede = Wählen Sie eines aus: Es öffnet sich sofort mit seinem Ergebnis.

js-app-browse-evidence = Die Engine-Methoden, die seine Szenarien ausführen, haben { $validated } validierte und { $modelled } modellierte Zeilen in der Verifikationsmatrix.

js-app-browse-evidence-title = Evidenz hinter diesem Bereich.

js-app-browse-kicker = Durchsuchen

js-app-browse-lede = Suchen Sie oder wählen Sie einen Bereich. Jedes Szenario öffnet sich sofort mit seinem Ergebnis.

js-app-browse-validated-examples = Validiert, zum Beispiel: { $examples }.

js-app-browser-cannot-run = Der Browser-Build kann dieses Szenario nicht ausführen.

js-app-btn-all-exports = Alle Exporte

js-app-btn-all-exports-title = Jeder Export dieses Laufs, einschließlich der eigenen Formate der Engine

js-app-btn-compare-pinned = Angeheftete Läufe vergleichen

js-app-btn-copy-embed = Einbettungscode kopieren

js-app-btn-copy-link = Link zu genau diesem Szenario kopieren

js-app-btn-figure-png = Abbildung (PNG)

js-app-btn-figure-png-title = Das Diagramm auf dem Bildschirm als hochauflösende Bitmap

js-app-btn-figure-svg = Abbildung (SVG)

js-app-btn-figure-svg-title = Das Diagramm auf dem Bildschirm, mit Titel, Engine-Version und DOI

js-app-btn-pin-compare = Diesen Lauf zum Vergleichen anheften

js-app-btn-pin-count = Diesen Lauf anheften ({ $n } angeheftet)

js-app-btn-report-html = Reproduzierbarer Bericht (HTML)

js-app-btn-report-html-title = Eine Offline-Datei: Zusammenfassung, Zahlen mit Stufen, Diagramme und das genaue Szenario

js-app-btn-result-json = Ergebnisdaten (JSON)

js-app-btn-result-json-title = Die vollständige Ausgabe der Engine für diesen Lauf

js-app-btn-run-history = Laufverlauf

js-app-btn-scenario-toml = Szenariodatei (TOML)

js-app-btn-scenario-toml-title = Die genaue Eingabe dieses Laufs

js-app-btn-table-csv = Tabelle (CSV)

js-app-btn-table-csv-title = Dieselben Bytes, die das Kommandozeilenwerkzeug als { $file } schreibt

js-app-bytes =
    { $n ->
        [one] { $n } Byte
       *[other] { $n } Byte
    }

js-app-cap-sub = { $areas } Bereiche, { $total } sofort ausführbare Szenarien. Jeder Bereich zeigt ein echtes aufgezeichnetes Ergebnis und die Mischung der Evidenz dahinter: den Anteil seiner Engine-Methoden, die gegen eine externe Referenz validiert sind.

js-app-chain-hint = die Ausgabe jeder Stufe speist die nächste

js-app-chain-note = Ein System, verfolgt durch jede Stufe der Engine. Die Tabelle unten listet jede Zahl auf, die eine Stufe berechnet hat und die nächste Stufe verwendet hat.

js-app-chain-stage = Stufe { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } Wert weitergegeben
       *[other] { $n } Werte weitergegeben
    }

js-app-chart-allan-deviation = Allan-Abweichung

js-app-chart-cn0-by-satellite = Effektives C/N0 je Satellit

js-app-chart-default-title = Kshana-Diagramm

js-app-chart-ground-track = Bodenspur

js-app-chart-holdover-title = Holdover gegen ein Zeitbudget

js-app-chart-mtie-title = MTIE (maximaler Zeitintervallfehler)

js-app-chart-not-drawn = Dieses Diagramm konnte nicht gezeichnet werden.

js-app-chart-scenario-hash = Szenario { $hash }

js-app-chart-stability-title = Uhrenstabilität (überlappende Allan-Abweichung)

js-app-chart-tdev-title = TDEV (Zeitabweichung)

js-app-chip-failed-title = WebAssembly konnte hier nicht gestartet werden. Gezeigt werden echte aufgezeichnete Läufe der mitgelieferten Szenarien.

js-app-chip-failed-title-reason = WebAssembly konnte hier nicht gestartet werden ({ $reason }). Gezeigt werden echte aufgezeichnete Läufe der mitgelieferten Szenarien.

js-app-chip-live = Live-Engine · v{ $version }

js-app-chip-live-title = Die Kshana-Engine läuft in diesem Browser als WebAssembly

js-app-chip-loading = Engine wird geladen

js-app-chip-loading-title = Die Engine wird heruntergeladen. Inzwischen werden aufgezeichnete Ergebnisse gezeigt.

js-app-chip-recorded = Aufgezeichnete Läufe · v{ $version }

js-app-chip-unavailable = Engine nicht verfügbar

js-app-cli-note = Installieren mit { $command }. Der Lauf schreibt { $file }, ein Diagramm und einen Bericht.

js-app-cli-only-title = Dieses läuft auf der Kommandozeile, nicht im Browser.

js-app-cli-save-comment = # die untenstehende Szenariodatei als { $file } speichern, dann

js-app-cmd-advanced = Jede Einstellung anzeigen (erweiterte Einstellungen)

js-app-cmd-browse = Alle Szenarien durchsuchen

js-app-cmd-compare = Die angehefteten Läufe vergleichen

js-app-cmd-embed = Einbettungscode kopieren

js-app-cmd-exports = Die Ergebnisse herunterladen (Exporte)

js-app-cmd-history = Laufverlauf öffnen

js-app-cmd-home = Zum Eröffnungsbildschirm gehen

js-app-cmd-how = Wie dies berechnet wird

js-app-cmd-pin = Diesen Lauf zum Vergleichen anheften

js-app-cmd-report = Den Bericht herunterladen

js-app-cmd-research = Code, Daten und Zitierung (für Forschende)

js-app-cmd-reset = Den Szenariotext zurücksetzen

js-app-cmd-run = Das Szenario ausführen

js-app-cmd-share = Link zum Teilen kopieren

js-app-cmd-theme = Zwischen hellem und dunklem Design wechseln

js-app-cmd-tour = Den geführten Rundgang starten

js-app-compare-deltas = Die Differenzen beziehen sich auf Lauf A. Grün markiert den besseren Wert für jede Kennzahl.

js-app-compare-none = Diese Läufe haben keine vergleichbaren Gütemaße gemeinsam. Heften Sie Läufe derselben Szenariofamilie an, um Zahlen und Differenzen zu sehen.

js-app-compare-pin-two = Heften Sie mindestens zwei Läufe an, um sie nebeneinander zu vergleichen. Heften Sie einen Lauf an, ändern Sie einen Parameter oder wählen Sie ein anderes Szenario derselben Familie, führen Sie es aus und heften Sie erneut an.

js-app-compare-run-head = { $letter } · Lauf { $id }

js-app-coverage-cell-note = Jede Zelle ist ein Gitterpunkt auf { $body }, bewertet über jede Epoche des Laufs.

js-app-coverage-dots-of = von

js-app-coverage-dots-post = Satelliten, entlang ihrer Bodenspuren bewegt; spielen Sie die Wiedergabe ab, um sie zu bewegen.

js-app-coverage-dots-pre = Die Punkte sind

js-app-coverage-field-label = Abzubildendes Feld

js-app-coverage-map = Abdeckungskarte

js-app-coverage-map-select = Abbilden

js-app-coverage-over = über

js-app-coverage-title = { $field } über { $body }

js-app-crumb-all-scenarios = Alle Szenarien

js-app-crumb-area = Bereich

js-app-crumb-search = Suche: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Herunterladen

js-app-edited-cli-only = Bearbeitet: Dieses Szenario läuft nur in der Kommandozeilen-Engine.

js-app-edited-needs-engine = Bearbeitet: benötigt Engine { $need }.

js-app-edited-needs-live = Bearbeitete Szenarien benötigen die Live-Engine.

js-app-embed-copied = Einbettungscode kopiert.

js-app-engine-chart = Engine-Diagramm

js-app-engine-chart-alt = Engine-Diagramm für diesen Lauf

js-app-engine-could-not-start = Die Engine konnte nicht gestartet werden: { $reason }. Stellen Sie diesen Ordner über HTTP bereit (zum Beispiel { $command }), anstatt die Datei direkt zu öffnen.

js-app-engine-failed = Die Engine konnte nicht geladen werden ({ $reason }).

js-app-engine-file-http = Die Engine-Datei lieferte HTTP { $status }.

js-app-engine-no-recordings = Die Engine konnte nicht geladen werden ({ $reason }) und es wurden keine aufgezeichneten Läufe gefunden.

js-app-entries-count =
    { $n ->
        [one] { $n } Eintrag
       *[other] { $n } Einträge
    }

js-app-ev-aria = { $validated } validierte und { $modelled } modellierte Zeilen der Verifikationsmatrix

js-app-ev-title = { $validated } validiert · { $modelled } modellierte Zeilen in der Verifikationsmatrix

js-app-ev-validated = validiert

js-app-export-card-title = Export { $format }

js-app-export-checking = Es wird geprüft, welche Ephemeridenformate dieser Lauf exportieren kann …

js-app-export-csv-desc = Dieselben Bytes, die das Kommandozeilenwerkzeug als { $file } schreibt.

js-app-export-csv-title = Reproduzierbarkeitstabelle

js-app-export-engine-loading = Die Ephemeridenexporte erscheinen hier, sobald die Engine geladen ist.

js-app-export-json-desc = Die vollständige Ausgabe der Engine für diesen Lauf, einschließlich Einheiten und Provenienz.

js-app-export-json-title = Vollständiges Ergebnisdokument

js-app-export-not-recorded = Dieser Export ist groß und wurde deshalb nicht aufgezeichnet. Er benötigt die Live-Engine.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) für GMAT, Orekit oder STK

js-app-export-omm-desc = CCSDS OMM (Orbit Mean-elements Message), Katalog

js-app-export-report-desc = Eine Offline-Datei: Zusammenfassung, Zahlen mit ihren Stufen, jedes Diagramm und der genaue Szenariotext, gestempelt mit Engine-Version und Szenario-Hash.

js-app-export-report-title = Reproduzierbarer Bericht

js-app-export-sp3-desc = Präzise SP3-c-Ephemeride dieser Konstellation

js-app-export-toml-desc = Die genaue Eingabe dieses Laufs. Führen Sie ihn überall erneut aus, mit dem Kommandozeilenwerkzeug oder den Python- und npm-Paketen.

js-app-export-toml-title = Szenariodatei

js-app-export-too-large = { $desc }. Zu groß zum Aufzeichnen: benötigt die Live-Engine.

js-app-fields-more = { $n } weitere

js-app-fields-none = keine

js-app-fields-none-hint = Hier gibt es keine weiteren einzelnen Zahlen zum Ändern. Bearbeiten Sie die Datei unter „Für Forschende“.

js-app-fields-top-of-file = Anfang der Datei

js-app-find-matches =
    { $n ->
        [one] { $n } geführtes Steuerelement und { $m } von { $total } Feldern passen zu „{ $query }“.
       *[other] { $n } geführte Steuerelemente und { $m } von { $total } Feldern passen zu „{ $query }“.
    }

js-app-find-none = Kein Feld dieses Szenarios passt zu „{ $query }“. Durchsuchen Sie alle Szenarien mit der Bibliothekssuche.

js-app-geo-sub = { $name } · { $features } von { $total } Objekten gezeichnet · mit der nativen Engine aufgezeichnet

js-app-geojson-title = GeoJSON-Export: { $name }

js-app-gt-highlighted = Hervorgehoben: Satellit von der Station aus sichtbar.

js-app-gt-peak-doppler = Maximaler Doppler { $value } Hz.

js-app-gt-peak-elevation = Maximale Elevation { $value }°.

js-app-health-check-tuning = Abstimmung prüfen

js-app-health-consistent = konsistent

js-app-health-nees-band = NEES { $mean } (95-%-Band { $lo }–{ $hi }, Zielwert 2.0)

js-app-health-nis-band = NIS { $mean } (95-%-Band { $lo }–{ $hi }, Zielwert 1.0)

js-app-heat-map-label = Heatmap { $metric }

js-app-hero-clock = { $elapsed } von { $total }

js-app-hero-mask = Elevationsmaske { $deg }°

js-app-hero-places =
    { $n ->
        [one] { $n } Ort
       *[other] { $n } Orte
    }

js-app-hero-positions-only = Nur Satellitenpositionen: keine Signalleistung, keine Satellitengesundheit, kein Gelände.

js-app-hero-ramp = { $lo } bis { $hi } { $field }

js-app-hero-ramp-over = { $lo } bis { $hi } { $field }, über { $duration }

js-app-hero-recorded-bare = Aufgezeichnetes Ergebnis

js-app-hero-satellites =
    { $n ->
        [one] { $n } Satellit
       *[other] { $n } Satelliten
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } Zeitschritt
       *[other] { $n } Zeitschritte
    }

js-app-hist-runs = { $n } Läufe.

js-app-history-pin = Anheften

js-app-history-restore = Wiederherstellen

js-app-history-restored = Lauf { $id } wiederhergestellt.

js-app-history-run = Lauf { $id } · { $time }

js-app-hit-in-scenario = in { $title }

js-app-hit-native-note = aufgezeichneter Lauf, native Engine

js-app-hit-setting-meta = { $area } · Einstellung { $name }

js-app-ho-budget = Budget

js-app-ho-engine-budget = Holdover der Engine beim Szenariobudget ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Holdover der Engine beim Szenariobudget: { $duration }

js-app-ho-error-after-loss = Fehler nach dem GNSS-Verlust bei t = { $t } s

js-app-ho-error-since-fix = Fehler seit dem letzten Fix

js-app-ho-stays-inside = bleibt über die gesamte Aufzeichnung innerhalb dieses Budgets

js-app-ho-until-breached = bis das Budget überschritten wird

js-app-hover-classical = klassisch

js-app-hover-quantum = quantenbasiert

js-app-how-checks = (prüft: { $requirement })

js-app-how-matrix = Die Engine-Methoden, die dieses Szenario ausführt, haben { $validated } validierte und { $modelled } modellierte Zeilen in der Verifikationsmatrix:

js-app-how-matrix-partner = Die Engine-Methoden, die dieses Szenario ausführt, haben { $validated } validierte und { $modelled } modellierte Zeilen in der Verifikationsmatrix sowie { $partner } im Besitz von Partnern:

js-app-how-mix-chip = { $validated } validiert · { $modelled } modelliert

js-app-how-more-notes =
    { $n ->
        [one] { $n } weitere Notiz aus der Szenariodatei
       *[other] { $n } weitere Notizen aus der Szenariodatei
    }

js-app-how-more-rows =
    { $n ->
        [one] { $n } weitere Zeile in der Verifikationsmatrix (Seite „Nachweise“ der Website).
       *[other] { $n } weitere Zeilen in der Verifikationsmatrix (Seite „Nachweise“ der Website).
    }

js-app-how-no-header = Diese Szenariodatei hat keine Kopfnotiz. Die Engine-Zusammenfassung unten sagt, was ausgeführt wurde.

js-app-how-no-matrix-row = Noch keine Zeile der Verifikationsmatrix nennt die Engine-Art dieses Szenarios.

js-app-how-no-sources = Die Szenariodatei nennt keine Quelle, und keine validierte Matrixzeile deckt ihre Art ab.

js-app-how-own-label = Die eigene Kennzeichnung dieses Laufs: { $label }

js-app-how-per-figure = Je Zahl, aus dem figure_tiers-Block der Engine: { $validated } validiert, { $modelled } modelliert. Die Stufe jeder Zahl steht in der Ansicht Übersicht.

js-app-install-copy = Kopieren: { $command }

js-app-install-label = v{ $version } installieren

js-app-interop-no-file = Die Engine hat für diesen Lauf keine Datei dieses Formats geschrieben.

js-app-interop-not-apply = Gilt nicht für dieses Szenario: { $reason }.

js-app-interop-not-bundled = Hier nicht mitgeliefert (Größe): Der obige Befehl schreibt sie.

js-app-interop-note = Die Engine schreibt die Geometrie und die Signalabtastwerte eines Laufs in Formaten, die andere Werkzeuge öffnen: CZML für Cesium, KML (Keyhole Markup Language) für Google Earth, GeoJSON für Karten, STK-Ephemeriden-Dateien (.e) und SigMF-Aufzeichnungen (Signal Metadata Format). Der Browser-Build enthält diese Schreiber nicht; daher sind die Dateien unten diejenigen, die die native Kommandozeilen-Engine für das mitgelieferte Szenario geschrieben hat.

js-app-job-running = Läuft

js-app-job-sweeping = Durchlauf

js-app-js-range-label = J/S-Bereich

js-app-js-range-value = { $lo } bis { $hi } dB

js-app-latest-event-at = Letztes Ereignis, um

js-app-legend-all = Engine-Fähigkeiten sind in der gesamten Verifikationsmatrix validiert; { $modelled } sind modelliert und { $partner } gehören Partnern.

js-app-legend-count = { $validated } von { $total }

js-app-load-failed = { $file } konnte nicht geladen werden.

js-app-mask-envelope = Holdover-Zeitfehler-Hüllkurve ({ $source })

js-app-mask-exceeded-after = überschritten nach { $duration }

js-app-mask-limit = Grenzwert { $value } ns

js-app-mask-not-exceeded = nicht überschritten

js-app-meta-engine = Engine

js-app-meta-file = Datei

js-app-meta-scenario = Szenario

js-app-meta-seed = Seed

js-app-meta-shared-link = geteilter Link

js-app-meta-time = Zeit

js-app-mission-timeline = Missionszeitleiste

js-app-native-edited-notice = Der aufgezeichnete Lauf stammt von der mitgelieferten Datei, daher kann hier keine bearbeitete Kopie gezeigt werden: Führen Sie sie mit dem Kommandozeilenwerkzeug aus oder nutzen Sie Zurücksetzen, um die Aufzeichnung zu sehen.

js-app-native-recorded = Sie sehen einen Lauf, der mit der nativen Kommandozeilen-Engine v{ $version } aufgezeichnet wurde und unverändert gezeigt wird. Er läuft beim Bearbeiten nicht erneut.

js-app-native-recorded-c = Sie sehen einen Lauf, der mit der nativen Kommandozeilen-Engine v{ $version } durch Ausführen von { $command } aufgezeichnet wurde und unverändert gezeigt wird. Er läuft beim Bearbeiten nicht erneut.

js-app-native-recorded-p = Sie sehen einen Lauf, der mit der nativen Kommandozeilen-Engine v{ $version } ({ $platform }) aufgezeichnet wurde und unverändert gezeigt wird. Er läuft beim Bearbeiten nicht erneut.

js-app-native-recorded-pc = Sie sehen einen Lauf, der mit der nativen Kommandozeilen-Engine v{ $version } ({ $platform }) durch Ausführen von { $command } aufgezeichnet wurde und unverändert gezeigt wird. Er läuft beim Bearbeiten nicht erneut.

js-app-needs-live-engine = Dies benötigt die Live-Engine.

js-app-needs-newer-engine = Benötigt eine neuere Engine.

js-app-needs-newer-why = Dieses Szenario benötigt Engine { $need } oder neuer; die hier laufende Engine ist v{ $version }.

js-app-no-chart-export = Diese Ansicht hat kein Diagramm zum Exportieren.

js-app-no-event-yet = Zu diesem Zeitpunkt noch kein Ereignis.

js-app-no-recorded-run = Für dieses Szenario gibt es keinen aufgezeichneten Lauf. Es benötigt die Live-Engine.

js-app-no-recording-here = Hier gibt es dazu keine Aufzeichnung.

js-app-no-summary = (dieses Szenario veröffentlicht keine einzeilige Zusammenfassung)

js-app-noise-floor = Rauschteppich { $value }

js-app-not-in-browser = Dieses Szenario läuft nicht im Browser.

js-app-notice-shared-needs-live = Dieser Link enthält sein eigenes Szenario, das die Live-Engine benötigt. Öffnen Sie ihn auf kshana.dev.

js-app-on-one-clock = auf einer Uhr

js-app-only-bundled-recording = Nur die Aufzeichnung der mitgelieferten Datei kann gezeigt werden: Nutzen Sie Zurücksetzen, um sie zu sehen, oder führen Sie eine bearbeitete Kopie mit Engine { $need } aus.

js-app-opening-result = Das Ergebnis wird geöffnet …

js-app-orbit-canvas-label = Interaktive 3D-Ansicht der propagierten Spur

js-app-orbit-epoch-set = Auf die Epoche des Laufs gedreht.

js-app-orbit-epoch-unset = Dieser Lauf nennt keine Epoche, daher ist der Drehwinkel der Erde hier nicht aussagekräftig.

js-app-orbit-img-alt = Orthographische Ansicht der propagierten Spur

js-app-orbit-note = Ziehen zum Drehen, Scrollen oder Zusammenziehen zum Zoomen. Erde maßstabsgetreu, NASA-Blue-Marble-Bilder.

js-app-orbit-static = Statische Ansicht (die 3D-Bibliothek konnte hier nicht geladen werden).

js-app-overlay-note = Durchgezogene Linien sind Lauf A, gestrichelte Linien Lauf B, auf denselben Achsen.

js-app-overlay-pinned = Überlagerung der angehefteten Läufe

js-app-overlay-title = { $title }: Lauf { $a } (A) gegen Lauf { $b } (B)

js-app-overlay-with-diff = Überlagerung mit der Differenz B − A

js-app-pal-area = Bereich: { $label }

js-app-pal-nothing = Nichts passt

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } Szenario
       *[other] { $n } Szenarien
    }

js-app-pal-sec-areas = Bereiche

js-app-pal-sec-commands = Befehle

js-app-pal-sec-scenarios = Szenarien

js-app-pal-sec-settings = Einstellungen

js-app-pal-sec-views = Ansichten

js-app-pal-setting = Einstellung: { $label }

js-app-pal-view = Ansicht: { $label }

js-app-panel-close = Schließen

js-app-panel-close-full = Vollbild schließen

js-app-panel-expand = Erweitern

js-app-panel-expand-full = Dieses Feld auf Vollbild erweitern

js-app-panel-expand-title = Dieses Feld im Vollbild zeigen (Escape schließt es)

js-app-params-hint = Ändern Sie einen Wert und führen Sie dann erneut aus. Die Antwort und das Diagramm werden an Ort und Stelle aktualisiert.

js-app-phase = Phase:

js-app-pin-already = Dieser Lauf ist bereits angeheftet.

js-app-pin-compare = { $n } Läufe angeheftet. Vergleich wird geöffnet.

js-app-pin-first = Lauf { $id } angeheftet. Ändern Sie einen Parameter, führen Sie erneut aus und heften Sie dann auch diesen Lauf an.

js-app-pin-label = { $letter } · { $title } · Lauf { $id }

js-app-plan-view = Draufsicht

js-app-plan-view-at = bei

js-app-player-pause = Die Wiedergabe anhalten

js-app-player-pause-mission = Die Missionswiedergabe anhalten

js-app-player-pause-orbit = Die Bahnwiedergabe anhalten

js-app-player-pause-waterfall = Die Wasserfallwiedergabe anhalten

js-app-player-play = Die Wiedergabe abspielen

js-app-player-play-mission = Die Missionswiedergabe abspielen

js-app-player-play-orbit = Die Bahnwiedergabe abspielen

js-app-player-play-waterfall = Die Wasserfallwiedergabe abspielen

js-app-player-position = Position in der Wiedergabe

js-app-player-position-mission = Position in der Missionswiedergabe

js-app-player-position-orbit = Position in der Bahnwiedergabe

js-app-player-position-waterfall = Position in der Wasserfallwiedergabe

js-app-png-button-title = Hochauflösende Bitmap für Folien und Dokumente

js-app-png-export-failed = PNG-Export fehlgeschlagen: { $reason }

js-app-py-note = Installieren mit { $command }.

js-app-ran-locally = Lokal ausgeführt um { $time }, Lauf { $n }.

js-app-ran-locally-took = Lokal ausgeführt um { $time }, Lauf { $n }, { $took } s.

js-app-receiver-at = Empfänger bei t =

js-app-recorded-edit-notice = WebAssembly ist auf dieser Seite blockiert, daher zeigt diese Seite echte Läufe der mitgelieferten Szenarien, aufgezeichnet mit Engine v{ $version }. Bearbeitete Szenarien, Durchläufe und neue Exporte benötigen die Live-Engine: Öffnen Sie kshana.dev oder stellen Sie diesen Ordner lokal bereit. Zurücksetzen stellt das aufgezeichnete Szenario wieder her.

js-app-recorded-intro = WebAssembly ist auf dieser Seite blockiert, daher zeigt diese Seite echte Läufe der mitgelieferten Szenarien, aufgezeichnet mit Engine v{ $version }. Bearbeiten, Durchläufe und neue Exporte benötigen die Live-Engine auf kshana.dev.

js-app-recorded-shown-native = Aufgezeichneter Lauf gezeigt um { $time } (native Engine).

js-app-recorded-shown-needs = Aufgezeichneter Lauf gezeigt um { $time } (benötigt Engine { $need }).

js-app-recorded-shown-run = Aufgezeichneter Lauf gezeigt um { $time }, Lauf { $n }.

js-app-recorded-shown-took = Aufgezeichneter Lauf gezeigt um { $time }, Lauf { $n }, { $took } s.

js-app-recorded-with-commit = Sie sehen den Lauf, der mit einem Engine-Build beim Commit { $commit } aufgezeichnet wurde und unverändert gezeigt wird; er läuft hier nicht erneut.

js-app-recorded-with-engine = Sie sehen den Lauf, der mit Engine v{ $version } aufgezeichnet wurde und unverändert gezeigt wird; er läuft hier nicht erneut.

js-app-recording-edited-warning = Sie haben das Szenario bearbeitet: Diese Aufzeichnung stammt von der mitgelieferten Datei, nicht von Ihrer Bearbeitung. Führen Sie den Befehl auf Ihrer eigenen Datei aus, um Ihren Lauf zu erhalten.

js-app-replay = Wiedergabe

js-app-report-downloaded = Bericht heruntergeladen.

js-app-report-frame-title = Laufbericht, von der Engine geschrieben

js-app-report-html = Bericht (HTML)

js-app-report-html-title = Die Berichtsdatei, so wie die Engine sie geschrieben hat

js-app-report-load-failed = Der aufgezeichnete Bericht konnte nicht geladen werden ({ $reason }).

js-app-report-loading = Der aufgezeichnete Bericht wird geladen …

js-app-report-none = Für dieses Szenario gibt es keinen aufgezeichneten Bericht.

js-app-report-note = Jeder Kommandozeilenlauf schreibt einen Bericht: Zusammenfassung, Eingaben, Ergebnisse, das Diagramm, was validiert und was modelliert ist, und einen Reproduzierbarkeitsnachweis. Der Browser-Build enthält diesen Schreiber nicht; daher ist dies der Bericht, den die native Kommandozeilen-Engine für das mitgelieferte Szenario geschrieben hat. Der eigene Bericht des Studios zum Lauf auf dem Bildschirm steht unter Exporte.

js-app-report-open-tab = In neuem Tab öffnen

js-app-report-open-tab-title = Den Bericht für sich öffnen

js-app-report-orbit-title = Bahn (erdzentriert inertial, orthographisch)

js-app-report-stability-short = Uhrenstabilität

js-app-report-stability-title = Uhrenstabilität (Allan-Abweichung)

js-app-run-again = Erneut ausführen

js-app-run-cancelled = Lauf abgebrochen.

js-app-run-cancelled-previous = Lauf abgebrochen. Das vorherige Ergebnis wird weiter gezeigt.

js-app-run-failed = Lauf fehlgeschlagen. Siehe die Meldung in den Ergebnissen.

js-app-run-when-ready = Ausführen, sobald die Engine bereit ist

js-app-run-will-run = Wird ausgeführt, sobald die Engine bereit ist

js-app-run-with-settings = Mit diesen Einstellungen ausführen

js-app-search-more-matches =
    { $n ->
        [one] { $n } weiterer Treffer: Fügen Sie ein Wort hinzu, um sie einzugrenzen.
       *[other] { $n } weitere Treffer: Fügen Sie ein Wort hinzu, um sie einzugrenzen.
    }

js-app-search-nothing = Nichts passt zu „{ $query }“. Versuchen Sie ein Wort wie jamming, clock, lunar, orbit, mask oder PDOP.

js-app-search-scenarios = Szenarien ({ $n })

js-app-search-settings =
    { $n ->
        [one] Einstellungen mit Namen wie „{ $query }“: in { $n } Szenario
       *[other] Einstellungen mit Namen wie „{ $query }“: in { $n } Szenarien
    }

js-app-search-settings-hint = Jede öffnet das Szenario mit dieser hervorgehobenen Einstellung, bereit zur Änderung.

js-app-share-copied = Link zum Teilen kopiert. Er enthält das genaue Szenario.

js-app-share-in-address-bar = Link in die Adressleiste gesetzt.

js-app-share-link-sub = Es läuft genau so, wie es geteilt wurde.

js-app-share-link-title = Ein Szenario, das aus einem Link zum Teilen geöffnet wurde

js-app-shared-scenario = Geteiltes Szenario

js-app-shown-unchanged = Unverändert gezeigt.

js-app-solar-note = Jeder Punkt ist ein Körper zur Epoche des Laufs, und jede Kurve ist die Bahnspur, die die Engine für ihn berechnet hat. Eine gestrichelte Linie ist eine Verbindung, die das Szenario verlangt. Wählen Sie einen Planeten, um seine Monde um ihn zu sehen.

js-app-solar-which-bodies = Welche Körper gezeichnet werden

js-app-source-live = Live-Ergebnis · Engine v{ $version }

js-app-source-native = Aufgezeichnetes Ergebnis, native Engine · v{ $version }

js-app-source-recorded = Aufgezeichnetes Ergebnis · v{ $version }

js-app-source-recorded-loading = Aufgezeichnetes Ergebnis · v{ $version } · Engine wird geladen

js-app-spectrum-row-note = Das Spektrum entlang der Wasserfallzeile, bei der die Wiedergabe gerade steht.

js-app-spectrum-row-title = Spektrum entlang der angezeigten Zeile

js-app-spectrum-which-part = Welcher Teil des Spektrums

js-app-status-last-run-took = Der letzte Lauf dauerte { $ms } ms in Ihrem Browser. Nichts wird hochgeladen.

js-app-status-loading-kept = Die Engine wird noch geladen. Ihre Änderungen bleiben erhalten und werden ausgeführt, sobald sie bereit ist.

js-app-status-loading-recorded = Die Engine wird noch geladen. Das Ergebnis oben ist ein aufgezeichneter Lauf.

js-app-status-not-run-yet = Ihre Änderungen wurden noch nicht ausgeführt.

js-app-status-runs-in-browser = Läuft in Ihrem Browser. Nichts wird hochgeladen.

js-app-status-wasm-blocked = WebAssembly ist hier blockiert, daher zeigt dies aufgezeichnete Läufe der mitgelieferten Szenarien.

js-app-stepper-decrease = { $key } verringern

js-app-stepper-increase = { $key } erhöhen

js-app-subtabs-label = Kacheln dieser Ansicht (Telefon)

js-app-svg-button-title = Vektordiagramm mit Titel und Provenienz

js-app-sweep-cancelled = Durchlauf abgebrochen.

js-app-sweep-done-1d = { $done } von { $total } Läufen lokal in { $duration } durchlaufen.

js-app-sweep-done-2d = { $total } Läufe ({ $a } × { $b }) lokal in { $duration } durchlaufen.

js-app-sweep-enter-range = Geben Sie einen numerischen Bereich ein.

js-app-sweep-enter-range-2 = Geben Sie einen numerischen Bereich für den zweiten Parameter ein.

js-app-sweep-failed = Durchlauf fehlgeschlagen: { $reason }

js-app-sweep-interrupted = Durchlauf durch einen neuen Lauf unterbrochen.

js-app-sweep-needs-live = Ein Durchlauf führt die Engine viele Male aus und benötigt daher die Live-Engine.

js-app-sweep-none-line = Keiner (Liniendiagramm)

js-app-sweep-nothing = Für dieses Szenario gibt es nichts zu durchlaufen.

js-app-sweep-progress = Durchlauf { $n } von { $total } …

js-app-sweep-status-done = { $total } Läufe um { $time } durchlaufen.

js-app-sweep-title-1d = { $metric } gegen { $knob }

js-app-sweep-title-2d = { $metric } über { $knob1 } und { $knob2 }

js-app-sweep-wait = Warten Sie, bis der aktuelle Lauf beendet ist, und starten Sie dann den Durchlauf.

js-app-tab-animation = Animation

js-app-tab-compare = Vergleichen

js-app-tab-exports = Exporte und Bericht

js-app-tab-ground = Bodenspur

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Zeitgebungsmasken

js-app-tab-orbit = 3D-Bahn

js-app-tab-overview = Übersicht

js-app-tab-report = Engine-Bericht

js-app-tab-signal = Signal und Band

js-app-tab-stability = Stabilität

js-app-tab-sweep = Durchlauf

js-app-tab-timeseries = Zeitreihe

js-app-th-at-tau = Bei τ oder Zeit

js-app-th-body = Körper

js-app-th-clock = Uhr

js-app-th-figure = Zahl

js-app-th-file = Datei

js-app-th-format = Format

js-app-th-key-figure = Kennzahl

js-app-th-light-time = Einweg-Lichtlaufzeit von { $observer }

js-app-th-limit = Grenzwert

js-app-th-margin = Marge

js-app-th-mask-or-budget = Maske oder Budget

js-app-th-metric = Metrik

js-app-th-metric-2 = Metrik

js-app-th-orbital-period = Umlaufzeit

js-app-th-provenance = Provenienz

js-app-th-size = Größe

js-app-th-source = Quelle

js-app-th-sun-distance = Abstand von der Sonne

js-app-th-tier = Stufe

js-app-th-unit = Einheit

js-app-th-value = Wert

js-app-th-value-2 = Wert

js-app-th-value-3 = Wert

js-app-th-verdict = Urteil

js-app-th-what-it-is = Was es ist

js-app-the-body = der Körper

js-app-the-chain = Die Kette

js-app-the-observer = der Beobachter

js-app-tile-browse-all = Alle { $n } Szenarien durchsuchen

js-app-tile-browse-sub = Suche nach Name, Frage oder Einstellung

js-app-tile-preview-label = Aufgezeichnete Vorschau von { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } Szenario
       *[other] { $n } Szenarien
    }

js-app-timeline-chart-title = Missionszeitleiste: { $title }

js-app-timeline-note = Ein Schieberegler steuert alle Diagramme darunter. Jede Phase führt gewöhnliche Szenarien aus; die Kampagne liest deren Ausgaben auf ein gemeinsames Zeitraster. Schattierte Bänder sind die Phasen, senkrechte Linien die Ereignisse. Die Werte oben sind die Kanäle der Kampagne zur Wiedergabezeit.

js-app-toast-copied = Kopiert.

js-app-toast-copy-blocked = Kopieren ist hier blockiert.

js-app-toast-copy-blocked-select = Kopieren ist hier blockiert: Markieren Sie stattdessen den Text.

js-app-toast-json-copied = JSON kopiert.

js-app-toast-loading-run = Die Engine wird noch geladen. Ihr Lauf startet, sobald sie bereit ist.

js-app-toast-no-scenario = Hier gibt es kein Szenario namens { $name }. Dies sind die nächsten Treffer.

js-app-toast-not-single-number = Diese Einstellung ist in diesem Szenario keine einzelne Zahl: Bearbeiten Sie sie in der Szenariodatei.

js-app-toast-one-pinned = Ein Lauf ist angeheftet. Ändern Sie eine Einstellung, führen Sie erneut aus und heften Sie diesen Lauf an, um die beiden zu vergleichen.

js-app-toast-opened-advanced = Geöffnet mit den Einstellungen, die Sie in der erweiterten Ansicht geändert haben.

js-app-toast-opened-at = Geöffnet bei { $label }. Ändern Sie es und führen Sie dann erneut aus.

js-app-toast-scenario-copied = Szenario kopiert.

js-app-tour-answer-body = Ein einfacher Satz, aus dem Ergebnis gelesen, und woher das Ergebnis stammt: ein Live-Lauf in Ihrem Browser oder ein mit derselben Engine aufgezeichneter Lauf.

js-app-tour-answer-title = Zuerst die Antwort

js-app-tour-back = Zurück

js-app-tour-done = Fertig

js-app-tour-eyebrow = Geführter Rundgang

js-app-tour-figures-body = Jede Karte wird aus dem Ergebnisdokument der Engine gelesen.

js-app-tour-figures-title = Die Zahlen, die sie beantworten

js-app-tour-how-body = Die Methode, die Evidenzstufe und die Quellen.

js-app-tour-how-title = Wie dies berechnet wird

js-app-tour-next = Weiter

js-app-tour-research-body = Die Kommandozeile und Python, um es selbst auszuführen, die Daten und Abbildungen und wie man es zitiert.

js-app-tour-research-title = Für Forschende

js-app-tour-search-body = ⌘K findet jedes Szenario, jeden Bereich, jede Einstellung, jede Ansicht und jeden Befehl.

js-app-tour-search-title = Suche

js-app-tour-settings-body = Die fünf Einstellungen, die für diese Frage am wichtigsten sind. Ändern Sie eine und führen Sie dann erneut aus. Die Engine läuft in Ihrem Browser; nichts wird hochgeladen.

js-app-tour-settings-title = Andere Einstellungen ausprobieren

js-app-tour-skip = Überspringen

js-app-tour-views-body = Diagramme, Karten, Wiedergaben, der eigene Bericht der Engine und Exporte. [ und ] wechseln zwischen den Ansichten.

js-app-tour-views-title = Jede Ansicht des Laufs

js-app-tracking-threshold = Tracking-Schwelle

js-app-transport-hint = ein Schieberegler steuert jedes Feld dieses Laufs

js-app-transport-label = Wiedergabe: Ein Schieberegler steuert jedes Feld dieses Laufs

js-app-unpin-run = Lauf { $id } lösen

js-app-waterfall = Wasserfall

js-app-waterfall-hint = spektrale Leistungsdichte: Frequenz quer, Zeit nach unten

js-app-waterfall-note = Die Farbe ist die Leistung über dem Rauschteppich des Empfängers. Die Navigationssignale liegen unter diesem Teppich, daher leuchten die Jammer auf. Spielen Sie die Wiedergabe ab oder ziehen Sie sie, und die Bänder rechts zeigen, was der Empfänger in diesem Moment noch verfolgt.

js-app-waterfall-title = Wasserfall, { $name }

js-app-webassembly-unavailable = WebAssembly nicht verfügbar

js-app-written-by-native = Geschrieben von der nativen Kommandozeilen-Engine v{ $version } ({ $platform }) mit

js-cat-acm-link-question = Welchen DVB-S2-Modus hält die Verbindung entlang jedes Überflugs, und wie viele Daten bewegt der Überflug? (modelliert)

js-cat-acm-link-title = Satelliten-Downlink mit adaptiver Codierung

js-cat-aocs-slew-mekf-question = Wie verhält sich der Schwenk, wenn der Regler von einem Lagefilter und einem Gyro mit Bias gespeist wird, im Vergleich zum Fall mit wahrem Zustand? (modelliert)

js-cat-aocs-slew-mekf-title = Schwenk auf einer Lageschätzung

js-cat-aocs-slew-question = Bringt das Regelgesetz einen Schwenk um einen großen Winkel mit vier Rädern zur Ruhe, und wie stark werden die Räder belastet? (die Regelschleife ist validiert; das Raumfahrzeug ist beispielhaft)

js-cat-aocs-slew-title = Schwenk mit Reaktionsrädern

js-cat-aperture-duty-cycle-question = Welchen Ausfall kostet es, wenn eine Apertur sowohl die Navigation als auch die Kommunikation bedient? (modelliert)

js-cat-aperture-duty-cycle-title = Tastverhältnis der Apertur

js-cat-araim-gps-galileo-question = Wie verfügbar ist fortgeschrittenes RAIM mit GPS und Galileo und der konstellationsweiten Fehlerhypothese?

js-cat-araim-gps-galileo-title = ARAIM mit zwei Konstellationen

js-cat-araim-reference-check-question = Treffen die Schutzniveaus der Engine die veröffentlichten durchgerechneten Beispiele der Working Group C?

js-cat-araim-reference-check-title = ARAIM-Referenzprüfung

js-cat-ascent-losses-question = Wie viel vom idealen Geschwindigkeitsgewinn einer zweistufigen Trägerrakete nehmen Schwerkraft, Luftwiderstand, Lenkung und Gegendruck? (modelliert)

js-cat-ascent-losses-title = Aufstiegsverluste beim Start

js-cat-attitude-budget-question = Wie groß sind das ungünstigste Störmoment und das Budget des Zeigefehlers?

js-cat-attitude-budget-title = Zeigebudget

js-cat-automotive-urban-canyon-question = Bleibt ein Auto durch eine Unterführung und an einem Jammer am Straßenrand innerhalb eines Budgets von einer halben Fahrspur? (modelliert)

js-cat-automotive-urban-canyon-title = Auto durch eine Straßenschlucht

js-cat-campaign-jam-spoof-holdover-integrity-question = Was geschieht mit einem Empfänger bei Jamming, Spoofing, GNSS-Verlust, einem Integritätsalarm und der Erholung, auf einer Zeitleiste? (modelliert)

js-cat-campaign-jam-spoof-holdover-integrity-title = Verkettete Mission: Jamming, Spoofing, Holdover, Alarm

js-cat-campaign-monte-carlo-clock-holdover-question = Entspricht der Zeitfehler einer freilaufenden Uhr über viele Läufe mit festem Seed seiner geschlossenen Streuung?

js-cat-campaign-monte-carlo-clock-holdover-title = Monte-Carlo-Uhren-Holdover

js-cat-campaign-optimize-link-budget-question = Wo lässt eine X-Band-Verbindung über Entfernung und Datenrate genau 3 dB Marge?

js-cat-campaign-optimize-link-budget-title = Ein Link-Budget optimieren

js-cat-campaign-shared-jammer-sea-road-question = Welche Plattform verliert unter einem Jammer ihren Fix: das Schiff in 30 km Entfernung oder das Auto in 50 km Entfernung? (modelliert)

js-cat-campaign-shared-jammer-sea-road-title = Ein Jammer, ein Schiff und ein Auto

js-cat-campaign-spectrum-holdover-integrity-question = Ein Jammer nimmt zwei L-Band-Signale, die Uhr geht in den Holdover und der Empfänger fällt allein auf Galileo zurück: Hält die Integritätsüberwachung noch? (modelliert)

js-cat-campaign-spectrum-holdover-integrity-title = Spektrumgesteuerte Mission

js-cat-campaign-sweep-jammer-power-question = Wenn ein Jammer in 1 km Entfernung von 10 nW auf 10 W hochgedreht wird, wann verliert der Empfänger seinen Fix? (modelliert)

js-cat-campaign-sweep-jammer-power-title = Durchlauf der Jammer-Leistung

js-cat-cislunar-arc-recovery-question = Gewinnt ein unabhängiger Kleinste-Quadrate-Schätzer den Zustand tatsächlich aus der Bogenlänge zurück, die der Rangtest vorhersagt? (modelliert; langsam: etwa 15 s in einem Browser)

js-cat-cislunar-arc-recovery-title = Rückgewinnung eines cislunaren Bogens

js-cat-cislunar-observability-question = Wie viel vom Zustand eines cislunaren Raumfahrzeugs macht ein Bogen zwischen Satelliten beobachtbar?

js-cat-cislunar-observability-title = Cislunare Beobachtbarkeit

js-cat-clock-ensemble-question = In welches Konfidenzband fällt der Holdover über viele Rauschziehungen?

js-cat-clock-ensemble-title = Uhren-Holdover-Ensemble

js-cat-clock-holdover-labsr-question = Wie schneidet eine optische Strontiumuhr in Laborqualität im Holdover im Vergleich zu einer chipgroßen Atomuhr ab?

js-cat-clock-holdover-labsr-title = Uhren-Holdover, optische Laboruhr

js-cat-clock-holdover-question = Wie lange kann eine Uhr die Zeit halten, nachdem GNSS ausgefallen ist?

js-cat-clock-holdover-title = Uhren-Holdover

js-cat-combined-altpnt-question = Was bringt die Fusion von drei skalaren Kartenkanälen gegenüber jedem einzelnen?

js-cat-combined-altpnt-title = Kombiniertes Alt-PNT

js-cat-conflict-resilience-question = Wie verschlechtert sich eine geschichtete PNT-Architektur unter Jamming, Spoofing, kinetischen und Cyberbedrohungen? (modelliert)

js-cat-conflict-resilience-title = Resilienz im Konflikt

js-cat-constellation-multi-gnss-coverage-question = Wie viele Satelliten sind mit den vier globalen Systemen zusammen in Sicht und wie gut ist die Geometrie, überall auf der Erde? (modelliert)

js-cat-constellation-multi-gnss-coverage-title = Vier GNSS-Konstellationen, eine Karte

js-cat-contact-schedule-question = Welche Überflüge behält ein konfliktfreier Plan bei drei Satelliten und drei Stationen über 12 Stunden, und wie viele Daten bewegt er? (modelliert)

js-cat-contact-schedule-title = Bodenkontaktplan

js-cat-domain-campaigns-label = Kampagnen

js-cat-domain-campaigns-line = Verkettete Missionen, Durchläufe und Monte-Carlo-Läufe auf einer Uhr.

js-cat-domain-constellations-label = Konstellationsentwurf

js-cat-domain-constellations-line = Eine Konstellation entwerfen und ihre Abdeckung und PDOP (Dilution of Precision der Position) abbilden.

js-cat-domain-deepspace-label = Mond, cislunar & Mars

js-cat-domain-deepspace-line = Navigation und Zeit am Mond, im cislunaren Raum und am Mars.

js-cat-domain-integrity-label = Integrität & Positionierung

js-cat-domain-integrity-line = Positionslösungen und ob man ihnen trauen kann: RAIM (autonome Integritätsüberwachung im Empfänger) und ihre fortgeschrittene Form, ARAIM.

js-cat-domain-interference-label = Jamming & Störung

js-cat-domain-interference-line = Störsender gegen Satellitennavigationsempfänger: was verloren geht und wann.

js-cat-domain-leo-label = Navigation im niedrigen Erdorbit (LEO)

js-cat-domain-leo-line = Navigationssignale, Überflüge, Nachrichten und Positionslösungen im niedrigen Erdorbit.

js-cat-domain-leo-missions-label = LEO-Missionen & Studien

js-cat-domain-leo-missions-line = Studien und Dienste auf Basis einer Schicht im niedrigen Erdorbit.

js-cat-domain-navigation-label = Inertiale & alternative Navigation

js-cat-domain-navigation-line = Inertiale, Gelände-, Schwere- und andere Navigation ohne Satelliten.

js-cat-domain-orbits-label = Umlaufbahnen & GNSS-Geometrie

js-cat-domain-orbits-line = Bahnausbreitung, Ephemeriden und die Geometrie von Navigationssatelliten.

js-cat-domain-solar-label = Sonnensystem

js-cat-domain-solar-line = Jeder Planet und Mond zu einer Epoche, mit Lichtlaufzeiten.

js-cat-domain-spaceops-label = Missionsanalyse & Raumfahrtbetrieb

js-cat-domain-spaceops-line = Überflüge, Startfenster, Wiedereintritt, Link- und Lageregelungsbudgets.

js-cat-domain-spectrum-label = Spektrum

js-cat-domain-spectrum-line = Wasserfalldiagramme des Funkbands: Störsender, Signale und was der Empfänger verfolgt.

js-cat-domain-spoofing-label = Spoofing & Signalsicherheit

js-cat-domain-spoofing-line = Falsche Signale und Meaconing sowie die Monitore, die sie erkennen.

js-cat-domain-studies-label = Quanten, Trade-off-Studien & Interoperabilität

js-cat-domain-studies-line = Quantensensoren, Trade-off-Studien und Interoperabilitätsformate.

js-cat-domain-timing-label = Uhren & Zeitgebung

js-cat-domain-timing-line = Uhren ohne Satelliten: Holdover, Stabilität, Telekom-Masken, Zeitübertragung.

js-cat-earth-gnss-lunar-question = Kann ein Empfänger in der Nähe des Mondes das GNSS der Erde hören, und reicht es je für eine Positionslösung? (modelliert)

js-cat-earth-gnss-lunar-title = Erd-GNSS am Mond

js-cat-entry-heating-stardust-question = Reproduziert das Eintrittsmodell die veröffentlichte maximale Verzögerung der Stardust-Probenrückführkapsel?

js-cat-entry-heating-stardust-title = Eintritt der Stardust-Kapsel

js-cat-eo-coverage-question = Welche Streifenbreite, Bodenauflösung und Wiederkehrzeit liefert eine EO-Umlaufbahn?

js-cat-eo-coverage-title = EO-Abdeckung

js-cat-eo-radiometry-question = Welches Signal-Rausch-Verhältnis, welche MTF bei Nyquist und welche NIIRS liefert eine Szene mit 15 % Reflexionsgrad für eine kleine Erdbeobachtungskamera? (modelliert)

js-cat-eo-radiometry-title = Radiometrie und Bildqualität des Bildgebers

js-cat-ephemeris-question = Wo ist der Satellit, und wann überfliegt er den Standort?

js-cat-ephemeris-title = Bodenspur

js-cat-europa-surface-pnt-question = Lässt sich ein Lander auf dem Jupitermond Europa aus einer kleinen Relais-Konstellation und einer Entfernungsmessung von der Erde positionieren? (modelliert)

js-cat-europa-surface-pnt-title = Lander auf Europa

js-cat-fusion-pnt-coupled-question = Wie übersteht der Navigator einen GNSS-Ausfall mit einem einzigen gestapelten Kalman-Filter über Position, Uhr und Beschleunigungsmesser-Bias? (modelliert)

js-cat-fusion-pnt-coupled-title = Gekoppelter Sensorfusions-Navigator

js-cat-fusion-pnt-question = Was bringt ein einziger gemeinsamer Schätzer über Uhr und Position?

js-cat-fusion-pnt-title = Sensorfusion

js-cat-gnss-ins-aviation-question = Wie weit driftet ein eng gekoppeltes INS der Navigations- oder der taktischen Klasse durch eine zweiminütige GNSS-Unterbrechung, die eine Kurve in Schräglage einschließt? (modelliert)

js-cat-gnss-ins-aviation-title = Flugzeugkurve durch eine GNSS-Lücke

js-cat-gnss-ins-maritime-question = Wie weit driftet ein INS der Navigations- oder der taktischen Klasse nach einem fünfminütigen GNSS-Ausfall auf einem Schiff, das Schlangenlinien fährt? (modelliert)

js-cat-gnss-ins-maritime-title = Schiff in Schlangenlinien durch einen GNSS-Ausfall

js-cat-gnss-ins-question = Wie gut überbrückt ein gestützter Inertialnavigator einen GNSS-Ausfall?

js-cat-gnss-ins-rail-question = Wie weit driftet ein eng gekoppeltes INS durch einen tiefen Einschnitt mit zwei Satelliten und danach einen Tunnel? (modelliert)

js-cat-gnss-ins-rail-title = Zug durch Einschnitt und Tunnel

js-cat-gnss-ins-title = GNSS/INS-Fusion

js-cat-gnss-sim-container-terminal-skyline-question = Wie viele Satelliten bleiben übrig, wenn Kräne zur Seeseite und Stapel zur Landseite stehen, und was geschieht mit dem RAIM-Schutz? (modelliert; repräsentative Skyline)

js-cat-gnss-sim-container-terminal-skyline-title = Portalhubwagen an einem Containerkai

js-cat-gnss-sim-raim-question = Wie prägen Ionosphäre und Troposphäre die rohen Pseudoentfernungen, und schützt RAIM weiterhin?

js-cat-gnss-sim-raim-title = GNSS-Messungen

js-cat-gnss-ssv-formation-heo-question = Wie gut kennt ein Filter die Relativposition zweier Raumfahrzeuge im Abstand von einem Kilometer, verglichen mit dem Differenzieren ihrer absoluten Positionslösungen? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-gnss-ssv-formation-heo-title = Relative Formationsnavigation, stark elliptische Umlaufbahn

js-cat-gnss-ssv-heo-question = Was hört eine stark elliptische Umlaufbahn entlang ihres Weges: Signale in Sicht, bestes C/N0, Hauptkeule gegen Nebenkeule, DOP und streifende Signale? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-gnss-ssv-heo-title = GNSS-Signale in einer stark elliptischen Umlaufbahn

js-cat-gnss-ssv-lunar-weak-question = Was kann ein für die schwächsten Signale ausgelegter Empfänger auf dem Weg zum Mond nutzen? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-gnss-ssv-lunar-weak-title = GNSS-Signale auf einem Mondtransfer, Empfänger für schwache Signale

js-cat-gnss-ssv-nav-lunar-question = Wie gut hält ein Bordfilter einen Mondtransfer, gemessen an der Schranke, die er selbst angibt? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-gnss-ssv-nav-lunar-title = GNSS-Bordfilter auf einem Mondtransfer

js-cat-gnss-ssv-shell-question = Wie oft hört ein Raumfahrzeug in geostationärer Höhe mindestens ein und mindestens vier Navigationssignale, je Konstellation und Band? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-gnss-ssv-shell-title = GNSS-Signale oberhalb der Satelliten: eine Schale bei 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = Kann Kartenabgleich auf dem realen EGM2008-Schwerefeld bis Grad 70 eine GPS-verweigerte Strecke halten? (modelliert)

js-cat-gps-denied-gravity-nav-egm2008-title = Schwerefeldnavigation auf dem realen Feld

js-cat-gps-denied-gravity-nav-question = Wie weit driftet die Position über eine volle Stunde ohne GNSS, und kann eine Schwerekarte sie eindämmen?

js-cat-gps-denied-gravity-nav-title = GNSS-freie Navigation

js-cat-gravity-map-error-mc-question = Wie oft hält der Kartenabgleich eine GPS-verweigerte Positionslösung noch innerhalb ihres Ziels, wenn die gespeicherte Schwerekarte immer verrauschter wird? (modelliert)

js-cat-gravity-map-error-mc-title = Monte-Carlo-Simulation des Schwerekartenfehlers

js-cat-gravity-map-nav-question = Kann ein Kaltatom-Gravimeter die Position ohne GNSS halten, indem es das Schwerefeld abgleicht, durch das es fliegt?

js-cat-gravity-map-nav-title = Navigation über Schwerekarte

js-cat-holdover-test-example-question = Antenne ziehen, Holdover bewerten: eine Aufzeichnung, geteilt an den beiden vom Betreiber genannten Zeitpunkten, jeder Schritt gemessen an den dafür geschriebenen ITU-T-Masken. (modelliert; die Aufzeichnung ist für das Beispiel erfunden)

js-cat-holdover-test-example-title = Holdover-Test: eine Zeitfehleraufzeichnung gegen die Masken

js-cat-holdover-test-ptp4l-question = Dieselben vier Schritte, gelesen aus einem ptp4l-Servoprotokoll: Wie weit bleibt der eigene Offset des Daemons von den Masken entfernt, solange GNSS fehlt? (modelliert; das Protokoll ist für das Beispiel erfunden)

js-cat-holdover-test-ptp4l-title = Holdover-Test: ein linuxptp-Protokoll

js-cat-hybrid-optical-rf-question = Was bringt die Kombination aus optischem und HF-PNT für Kontinuität und Integrität? (modelliert)

js-cat-hybrid-optical-rf-title = Optisch/HF-Hybrid

js-cat-hybrid-pnt-question = Was bringt eine kombinierte Uhren-Inertial-Ausstattung?

js-cat-hybrid-pnt-title = Hybrides PNT

js-cat-hybrid-ukf-question = Ist der eng gekoppelte UKF mit 17 Zuständen in sich konsistent (NEES + Innovationsweißheit)? Eine Selbstkonsistenzprüfung, keine Genauigkeitsbehauptung.

js-cat-hybrid-ukf-title = Hybrider UKF mit 17 Zuständen

js-cat-impairment-eval-question = Wie gut trennt ein Detektor Jamming / Spoofing / Mehrwegeausbreitung vom Normalzustand? (modellierte ROC/AUC)

js-cat-impairment-eval-title = Bewertung von HF-Beeinträchtigungen

js-cat-imu-deadreckoning-question = Wie weit driftet die Position beim Koppeln allein mit einer IMU?

js-cat-imu-deadreckoning-title = Inertiale Koppelnavigation

js-cat-ins-trn-coast-question = Wie weit driftet die Position während eines Navigationsausfalls, und wann überschreitet sie 10 m und 50 m? (modelliert)

js-cat-ins-trn-coast-title = INS/TRN-Überbrückung

js-cat-integrity-harbour-approach-question = Halten GPS und Galileo den ARAIM-Schutz innerhalb der Alarmgrenzen, wenn Kaigebäude und eine Mole tief stehende Satelliten verdecken? (modelliert; repräsentative Skyline)

js-cat-integrity-harbour-approach-title = ARAIM bei der Hafeneinfahrt

js-cat-integrity-raim-question = Erfüllt die Geometrie die Alarmgrenzen (HPL / VPL)?

js-cat-integrity-raim-title = RAIM-Integrität

js-cat-jamming-demo-question = Bei welchem Störer-Signal-Verhältnis verliert der Empfänger die Synchronisation?

js-cat-jamming-demo-title = Jamming

js-cat-jamming-harbour-approach-skyline-question = Wie viele Satelliten behält ein Schiff unter einem 2-W-Störsender am Ufer, und wie viele verdeckt der Kai selbst? (modelliert; repräsentative Skyline)

js-cat-jamming-harbour-approach-skyline-title = Schiff bei der Hafeneinfahrt gestört

js-cat-l-band-waterfall-jamming-question = Wie sieht das gesamte GNSS-L-Band aus, während ein Chirp-, ein Ton- und ein Rauschstörsender eingeschaltet werden, und welche Signale nimmt jeder davon weg? (modelliert)

js-cat-l-band-waterfall-jamming-title = L-Band-Wasserfall unter Jamming

js-cat-launch-window-question = Welcher Startazimut und welches Dogleg-Δv erreichen von einem Startplatz aus eine Zielinklination?

js-cat-launch-window-title = Startfenster

js-cat-leo-band-trade-question = Was gewinnt und verliert ein Navigationssignal im niedrigen Orbit in jedem Band, von Ultrahochfrequenz (UHF) bis C-Band? (repräsentative Entwürfe)

js-cat-leo-band-trade-title = Bandvergleich, UHF bis C-Band

js-cat-leo-doppler-positioning-question = Wie gut ist eine Positionslösung aus zehn Minuten Doppler bei einer Navigationskonstellation im niedrigen Orbit? (modelliert)

js-cat-leo-doppler-positioning-title = Positionierung allein aus Doppler

js-cat-leo-focus-data-services-question = Was kostet jeder zusätzliche Datendienst an Bits der Navigationsnachricht? (modelliert)

js-cat-leo-focus-data-services-title = Dienstdaten gegen Rahmenlänge

js-cat-leo-focus-fused-pnt-sisre-question = Wie gut muss der Signal-in-Space-Entfernungsfehler im niedrigen Orbit sein, bevor die Schicht im niedrigen Orbit eine fusionierte Positionslösung verbessert? (modelliert)

js-cat-leo-focus-fused-pnt-sisre-title = Fusionierte Positionslösung gegen Bahn- und Uhrenfehler

js-cat-leo-focus-indoor-uhf-question = Welches Band erreicht einen Nutzer noch in einem herkömmlichen und in einem thermisch effizienten Gebäude? (modelliert)

js-cat-leo-focus-indoor-uhf-title = Empfang in Gebäuden nach Band und Gebäude

js-cat-leo-focus-iot-eirp-question = Wie viel Satellitensendeleistung braucht ein Batterie-Tag, um durchzuhalten? (modelliert)

js-cat-leo-focus-iot-eirp-title = Tracker-Energie gegen Sendeleistung

js-cat-leo-focus-ntn-bandwidth-question = Wie sinkt der Positionierungsfehler, wenn das Referenzsignal von 180 kHz auf 20 MHz breiter wird? (modelliert)

js-cat-leo-focus-ntn-bandwidth-title = 5G-Downlink-Positionierung gegen Bandbreite

js-cat-leo-focus-ppp-altitude-question = Verkürzt eine niedrigere oder eine höhere Schicht im niedrigen Orbit die Konvergenz stärker? (modelliert; langsam, etwa eine Minute im Browser)

js-cat-leo-focus-ppp-altitude-title = Präzise Positionierung gegen Schichthöhe

js-cat-leo-focus-science-iono-sounding-question = Wie gut misst die Laufzeitdifferenz zwischen zwei Bändern den Elektronengehalt unterhalb eines Satelliten im niedrigen Orbit? (modelliert)

js-cat-leo-focus-science-iono-sounding-title = Ionosphärensondierung aus zwei Bändern

js-cat-leo-indoor-uhf-question = Warum dringt ein UHF-Träger in ein Gebäude ein, wenn L-, S- und C-Band Mühe haben? (modelliert)

js-cat-leo-indoor-uhf-title = In Gebäuden auf UHF

js-cat-leo-iot-energy-question = Wie viel Energie verbraucht ein Batterie-Tag für jede Positionslösung aus einem Signal im niedrigen Orbit? (modelliert)

js-cat-leo-iot-energy-title = Energie pro Positionslösung für einen Tracker

js-cat-leo-navmsg-encode-decode-question = Was kostet die Quantisierung jedes Feldes, und übersteht der Rahmen Kodierung, Dekodierung und ein verfälschtes Bit? (modelliert)

js-cat-leo-navmsg-encode-decode-title = Navigationsnachricht: Binärrahmen

js-cat-leo-navmsg-fit-interval-trade-question = Wie lange kann eine gesendete Nachricht gelten, bevor ihr Bahnfehler das Ziel übersteigt? (modelliert; langsam, etwa 30 s im Browser)

js-cat-leo-navmsg-fit-interval-trade-title = Navigationsnachricht: Anpassungsintervall

js-cat-leo-navmsg-midpass-update-question = Sieht der Nutzer einen Sprung, wenn ein Satellit mitten in einem Überflug auf eine neue Nachricht wechselt? (modelliert)

js-cat-leo-navmsg-midpass-update-title = Navigationsnachricht: Aktualisierung mitten im Überflug

js-cat-leo-navmsg-model-comparison-question = Welches Ephemeridenmodell bildet einen niedrigen Orbit am besten ab, und wie verhält es sich neben einer veröffentlichten Tabelle? (modelliert)

js-cat-leo-navmsg-model-comparison-title = Navigationsnachricht: vier Modelle

js-cat-leo-pass-iridium-question = Welche Signalstärke und welchen Doppler sieht ein Verkehrsflugzeug bei einem Iridium-Überflug? (modelliert)

js-cat-leo-pass-iridium-title = Iridium-Bursts von einem Flugzeug

js-cat-leo-pass-vs-gnss-cn0-question = Wie verhält sich die Signalstärke eines Überflugs im niedrigen Orbit zu den sichtbaren Galileo-Satelliten? (modelliert)

js-cat-leo-pass-vs-gnss-cn0-title = Ein Überflug gegen GNSS

js-cat-leo-pass-xona-pulsar-question = Wie sehen die Signale X1 und X5 bei einem Überflug für ein Schiff in der Biskaya aus? (modelliert)

js-cat-leo-pass-xona-pulsar-title = Xona-Pulsar-Überflug

js-cat-leo-pnt-end-to-end-question = Was reicht vom Signalentwurf bis zur endgültigen Positionslösung jede Stufe an die nächste weiter? (modelliert)

js-cat-leo-pnt-end-to-end-title = Durchgängig, generische Konstellation

js-cat-leo-pnt-mega-shell-question = Welche Abdeckung und Geometrie liefert eine Navigationskonstellation aus 5.000 Satelliten im niedrigen Erdorbit? (modelliert; ein Beispielentwurf)

js-cat-leo-pnt-mega-shell-title = Entwurf mit 5.000 Satelliten im niedrigen Orbit

js-cat-leo-ppp-convergence-question = Um wie viel schneller konvergiert die präzise Punktpositionierung (PPP), wenn eine Schicht im niedrigen Orbit hinzukommt? (modelliert; langsam, etwa 30 s im Browser)

js-cat-leo-ppp-convergence-title = Konvergenz der präzisen Positionierung

js-cat-leo-pvt-fjord-skyline-question = Wo die Fjordwände einen Himmelsstreifen entlang der Fahrrinne lassen: Wie viel bringt eine Schicht im niedrigen Orbit zu GPS und Galileo hinzu? (modelliert; repräsentative Skyline)

js-cat-leo-pvt-fjord-skyline-title = Fähre tief in einem Fjord

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Kann eine Schicht im niedrigen Orbit in anderen Bändern die Positionslösung und ihre Integrität halten, wenn GNSS gestört wird? (modelliert)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS gestört, niedriger Orbit trägt weiter

js-cat-leo-resilience-js-margin-question = Wie viel mehr Jamming übersteht ein stärkeres Signal im niedrigen Orbit als ein GNSS-Signal aus dem mittleren Orbit? (modelliert)

js-cat-leo-resilience-js-margin-title = Störabstandsreserve aus der Empfangsleistung

js-cat-leo-resilience-multiband-diversity-question = Welche von vier Bändern verfolgen weiter, wenn ein L-Band-Störsender hochgedreht wird? (modelliert)

js-cat-leo-resilience-multiband-diversity-title = Banddiversität unter einem Breitbandstörsender

js-cat-leo-resilience-spoof-doppler-question = Wie schnell erkennt eine Doppler- und Überflug-Geometrieprüfung einen Spoofer, der die berechnete Position um 30 m verschiebt? (modelliert)

js-cat-leo-resilience-spoof-doppler-title = Spoofing per Doppler erkannt

js-cat-leo-resilience-spoof-monitors-question = Welcher Monitor erkennt welche Art von Spoofer? (modelliert)

js-cat-leo-resilience-spoof-monitors-title = Spoofing-Monitore gegen vier Spoofer

js-cat-leo-timing-utc-question = Wie genau kann ein Empfänger die koordinierte Weltzeit (UTC) aus Satelliten im niedrigen Orbit zurückgewinnen, nach Oszillator und Signalpegel? (modelliert)

js-cat-leo-timing-utc-title = Zeitübertragung auf UTC

js-cat-leo-vertical-5g-network-timing-question = Hält die Zeit aus dem niedrigen Orbit eine Basisstation innerhalb ihrer Zeitgrenze, wenn GNSS einen Tag lang ausfällt? (modelliert)

js-cat-leo-vertical-5g-network-timing-title = Zeitgebung von 5G-Basisstationen

js-cat-leo-vertical-asset-tracking-iot-question = Was kostet jede Positionslösung ein Batterie-Tag entlang der Reise eines Containers? (modelliert)

js-cat-leo-vertical-asset-tracking-iot-title = Containerverfolgung

js-cat-leo-vertical-autonomous-vehicle-question = Hält eine Schicht im niedrigen Orbit ein Auto innerhalb eines spurgenauen Fehlers, wenn Gebäude die tief stehenden Satelliten verdecken? (modelliert)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Hält eine Schicht im niedrigen Orbit ein Auto auch dann noch innerhalb eines spurgenauen Fehlers, wenn statt eines flachen Grenzwinkels von 35° eine reale Straße modelliert wird? (modelliert; repräsentative Skyline)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Fahrzeug in einer Straße, nicht hinter einem flachen Grenzwinkel

js-cat-leo-vertical-autonomous-vehicle-title = Fahrzeug in einer Straßenschlucht

js-cat-leo-vertical-critical-infrastructure-timing-question = Hält die Zeit aus dem niedrigen Orbit die Synchronisation eines Umspannwerks, wenn GNSS ausfällt? (modelliert)

js-cat-leo-vertical-critical-infrastructure-timing-title = Zeitgebung im Umspannwerk

js-cat-leo-vertical-polar-arctic-question = Was bringt eine polare Schicht im niedrigen Orbit von Tromsø bis zum Nordpol zu GNSS hinzu? (modelliert)

js-cat-leo-vertical-polar-arctic-title = Arktisreise

js-cat-leo-vertical-rail-maritime-question = Erreicht ein Überflug im niedrigen Orbit die mitgelieferten Schiffs- und Zugszenarien noch, wenn sie GNSS verlieren? (modelliert)

js-cat-leo-vertical-rail-maritime-title = Schiene und Seeverkehr mit einer Schicht im niedrigen Orbit

js-cat-link-budget-question = Schließt die Einwegstrecke bei der gegebenen Entfernung und Datenrate mit Reserve?

js-cat-link-budget-title = Linkbudget

js-cat-lunanet-araim-question = Erfüllt eine dünne Mondrelais-Menge die Integritätsgrenzen für einen Empfänger in der Artemis-Region?

js-cat-lunanet-araim-title = Mondintegrität

js-cat-lunar-attack-surface-question = Was ist nötig, um einen Empfänger auf der Mondoberfläche zu spoofen oder zu blockieren, und welches Authentifizierungsbudget antwortet darauf? (modelliert)

js-cat-lunar-attack-surface-title = Angriffsfläche auf dem Mond

js-cat-lunar-beacon-question = Wie stark senkt eine Handvoll vermessener Oberflächenbaken den DOP am Südpol? (modelliert)

js-cat-lunar-beacon-title = Baken auf der Mondoberfläche

js-cat-lunar-differential-pnt-question = Wie stark hebt die Differenzialkorrektur den Gleichtaktfehler gegenüber der Basislinie auf dem Mond auf? (modelliert)

js-cat-lunar-differential-pnt-title = Differenzielles PNT auf dem Mond

js-cat-lunar-frame-campaign-question = Welche Datumsgenauigkeit ergibt sich aus einer Beobachtungskampagne statt aus einer eingespeisten Transformation? (modelliert)

js-cat-lunar-frame-campaign-title = Mond-Bezugssystem-Kampagne

js-cat-lunar-frame-realisation-question = Kann eine Helmert-Datumsanpassung eine Transformation des Mond-Bezugssystems zurückgewinnen? (modelliert)

js-cat-lunar-frame-realisation-title = Mond-Bezugssystem

js-cat-lunar-infrastructure-carrier-phase-question = Können eine Oberflächenstation und ein Orbiter gemeinsam die ganzzahligen Trägerphasen-Mehrdeutigkeiten von Erd-GNSS-Signalen lösen? Der schnelle Beispiellauf. (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-infrastructure-carrier-phase-title = Mond-Trägerphase: Oberflächenstation und Orbiter

js-cat-lunar-infrastructure-frame-coestimation-question = Wie viel mehr Information liefern Entfernungen zwischen Orbiter und Oberflächenstation für die sieben Parameter des Mond-Datums? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-infrastructure-frame-coestimation-title = Gemeinsame Schätzung des Mond-Bezugssystems mit Orbiter-Verbindungen

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Wie empfindlich sind Laserentfernungsmessung, Orbiter-Tracking, ein Gravimeter und eine Oberflächenuhr gegenüber h2, k2, l2 und der Libration? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Empfindlichkeit gegenüber Mond-Love-Zahlen und Libration

js-cat-lunar-infrastructure-od-consistency-model-error-question = Derselbe Vergleich mit einer eingespeisten kleinen nicht modellierten Beschleunigung: Bemerkt die Konsistenzprüfung sie? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Mond-Bahnbestimmung mit eingespeistem Modellierungsfehler

js-cat-lunar-infrastructure-od-consistency-question = Stimmen die GNSS-Bahnbestimmung der Erde an Bord in einem Mond-Halo-Orbit und die unabhängige radiometrische Bahnbestimmung vom Boden innerhalb ihrer angegebenen Unsicherheiten überein? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-infrastructure-od-consistency-title = Mond-Bahnbestimmung: GNSS an Bord gegen Bodenverfolgung

js-cat-lunar-infrastructure-space-tie-question = Wie genau lassen sich die Offsets zwischen drei Verfahren verknüpfen, verglichen mit dem Fehler der lokalen Verknüpfung? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-infrastructure-space-tie-title = Raumverknüpfung: GNSS, VLBI und Laserentfernungsmessung auf einem Raumfahrzeug

js-cat-lunar-interop-export-question = Kann Mond-Bezugssystem / Zeit / Ephemeride über CCSDS OEM + eine KIF-Hülle hin und zurück übertragen werden?

js-cat-lunar-interop-export-title = Mond-Interop-Export

js-cat-lunar-jamming-question = Wie weit entfernt darf ein Störsender stehen und dennoch einen Empfänger auf der Mondoberfläche blockieren? (modelliert)

js-cat-lunar-jamming-title = Jamming auf dem Mond

js-cat-lunar-joint-od-clock-question = Macht eine VLBI-Verknüpfung mit Erdbasislinie die absolute Position einer Mondstation beobachtbar? (modelliert)

js-cat-lunar-joint-od-clock-title = Gemeinsame Mond-OD und Uhr

js-cat-lunar-llr-datum-question = Wie sieht das Mond-Datum aus, wenn die Kampagne aus realen archivierten Mond-Laserentfernungsmessungen (LLR) besteht? (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-llr-datum-title = Datum aus Mond-Laserentfernungsmessung

js-cat-lunar-relay-constellation-question = Welche Abdeckung liefert eine Relais- und Navigationskonstellation in eingefrorenen und niedrigen Mondorbits über den gesamten Mond? (modelliert; ein Beispielentwurf)

js-cat-lunar-relay-constellation-title = Mond-Relaiskonstellation

js-cat-lunar-station-coverage-public-sources-question = Welchen korrigierten Fehler liefert die Station über dem Südpol allein unter den öffentlich genannten Annahmen? Das Ergebnis wird von den Bahnelementen dominiert, die nicht öffentlich sind und auf ILLUSTRATIV gesetzt wurden; dies ist die Eingabe der eingefrorenen Vorhersage. (modelliert; keine Aussage über ein reales System)

js-cat-lunar-station-coverage-public-sources-title = Mond-Referenzstation, öffentliche Annahmen

js-cat-lunar-station-coverage-question = Welchen korrigierten Fehler liefert eine Mond-Referenzstation über der Südpolregion und einen Tag, und wie weit von ihr entfernt hält die Abdeckung? (modelliert; keine Aussage über ein reales System)

js-cat-lunar-station-coverage-terrain-question = Wie viel Abdeckung verliert die Station durch Gelände, wenn der Horizont jedes Standorts über einem realen Mondhöhenmodell per Ray-Marching bestimmt wird? (modelliert)

js-cat-lunar-station-coverage-terrain-title = Mondstation mit realem Gelände

js-cat-lunar-station-coverage-title = Abdeckung der Mond-Referenzstation

js-cat-lunar-station-geodesy-baseline-question = Wie gut legen die heutigen fünf Retroreflektor-Felder das Mond-Datum auf einem realen Zeitplan fest, bevor eine Station hinzukommt? Die Basislinie eines Paares. (modelliert; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-station-geodesy-baseline-title = Geodäsie der Mondstation: die fünf Felder allein

js-cat-lunar-station-geodesy-with-station-question = Derselbe archivierte Zeitplan mit einem zusätzlichen Reflektor und VLBI-Bake am Südpol: Wie stark verengt sich die Schranke für das Datum? (modelliert, illustrativer Standort; ein mit der nativen Engine aufgezeichneter Lauf)

js-cat-lunar-station-geodesy-with-station-title = Geodäsie der Mondstation: mit einer Südpolstation

js-cat-lunar-station-time-lab-question = Wie lange bleibt die Miniatur-Rubidiumuhr einer Station nach ihrer letzten Steuerung auf Mondzeit innerhalb von 1, 10 und 100 ns, und welcher Fehlerterm dominiert? (modelliert)

js-cat-lunar-station-time-lab-title = Zeitlabor der Mondstation

js-cat-lunar-time-budget-question = Wie groß ist der Koordinatenzeit-Offset zwischen Erde und Mond, und wie sieht sein Fehlerbudget aus? (modelliert)

js-cat-lunar-time-budget-title = Mond-Zeitbudget

js-cat-lunar-time-offset-question = Wie schnell läuft eine Monduhr der Erdzeit davon (~56–59 µs/Tag)?

js-cat-lunar-time-offset-title = Mond-Zeitoffset

js-cat-lunar-vlbi-fim-question = Welche Genauigkeit der Stationskoordinaten bringt ein gegebener VLBI-Verfolgungsplan tatsächlich? (modelliert)

js-cat-lunar-vlbi-fim-title = Mond-VLBI-Information

js-cat-lunar-vlbi-question = Welche Laufzeitdifferenz sieht ein VLBI-Paar mit Erdbasislinie bei einer Bake auf der Mondoberfläche? (modelliert)

js-cat-lunar-vlbi-title = Mond-VLBI

js-cat-maritime-port-approach-coast-question = Wann verlässt ein INS der Navigationsklasse beim Einlaufen in einen Hafen ohne GNSS die Hafen- und Ozeanbudgets? (modelliert)

js-cat-maritime-port-approach-coast-title = Hafeneinfahrt inertial

js-cat-maritime-spoof-position-push-question = Welche Erkennungsschichten erfassen es, wenn ein Spoofer die Positionslösung eines Schiffes um 500 m verschiebt? (modelliert)

js-cat-maritime-spoof-position-push-title = Schiffsposition gespooft

js-cat-maritime-strait-jamming-question = Nimmt ein 50-W-Störsender einem Schiff über 30 km offenes Wasser das GNSS weg? (modelliert)

js-cat-maritime-strait-jamming-title = Schiff in einer Meerenge gestört

js-cat-mars-orbit-pnt-question = Wie gut wird ein Mars-Orbiter im niedrigen Orbit aus zwölf Navigationsrelais positioniert, und was bringt eine Entfernungsmessung von der Erde hinzu? (modelliert)

js-cat-mars-orbit-pnt-title = Mars-Orbiter mit Relais und Erdverbindung

js-cat-mars-pnt-lmo-question = Kann eine MARCONI-Relaiskonstellation einen Nutzer am Mars navigieren? (Kovarianz-Gütemaß, kein zertifiziertes PL)

js-cat-mars-pnt-lmo-title = Mars-PNT, niedriger Orbit

js-cat-mars-pnt-surface-question = Wie gut lässt sich ein Lander oder Rover auf der rotierenden Marsoberfläche gegen die Relaiskonstellation navigieren?

js-cat-mars-pnt-surface-title = Mars-PNT, Oberfläche

js-cat-mars-pnt-transfer-question = Wie gut wird ein Fahrzeug auf einem hohen, exzentrischen Anflug- oder Einfangbogen am Mars navigiert?

js-cat-mars-pnt-transfer-title = Mars-PNT, Transfer

js-cat-meo-leo-fused-pvt-question = Was bewirkt das Hinzufügen einer Schicht im niedrigen Orbit zu GPS und Galileo für Positionsfehler und Geometrie? (modelliert)

js-cat-meo-leo-fused-pvt-title = Fusionierte Positionslösung aus GNSS und niedrigem Orbit

js-cat-moonlight-service-volume-question = Welchen DOP, welche Abdeckung und welche Integrität liefert eine Konstellation der Klasse Moonlight/LCNS am Südpol? (modelliert)

js-cat-moonlight-service-volume-title = Mond-Dienstvolumen

js-cat-multi-band-jamming-waterfall-question = Was lässt ein für ein Band gebauter Störsender stehen, wenn die Navigationssignale auf vier Bänder verteilt sind? (modelliert)

js-cat-multi-band-jamming-waterfall-title = Mehrband-Jamming-Wasserfall

js-cat-notinbrowser-elevation-model = Benötigt den Ausschnitt des Mondhöhenmodells ({ $path }), der mit dem Repository ausgeliefert wird, nicht mit dem Browser-Build.

js-cat-notinbrowser-laser-ranging-data = Benötigt den archivierten Ausschnitt der Laserentfernungsdaten, der mit dem Repository ausgeliefert wird, nicht mit dem Browser-Build.

js-cat-notinbrowser-study-suite = Eine Studienreihe, kein einzelnes Szenario. Führen Sie sie mit dem Kommandozeilenwerkzeug aus: { $command }.

js-cat-ntn-5g-positioning-question = Wie genau kann sich ein Mobilgerät aus dem Downlink eines nichtterrestrischen 5G-Netzes positionieren, nach Signalbandbreite? (modelliert)

js-cat-ntn-5g-positioning-title = Positionierung über 5G-Satelliten-Downlink

js-cat-oem-interop-question = Lässt sich eine OEM-Ephemeride aus GMAT / Orekit / STK importieren und hin und zurück übertragen?

js-cat-oem-interop-title = CCSDS-OEM-Brücke

js-cat-optical-atmosphere-network-question = Wie oft steht eine optische Zeitverbindung durch Wolken und Turbulenz, und was bringen zusätzliche Bodenstationen? (modelliert; illustrative Wolkenklimata)

js-cat-optical-atmosphere-network-title = Optische Verbindung durch die Atmosphäre, drei Standorte

js-cat-optical-atmosphere-techniques-question = Was bringen eine größere Apertur, eine andere Wellenlänge oder adaptive Optik für eine optische Aufwärtsstrecke bei Wolken und Turbulenz? (modelliert; illustratives Wolkenklima)

js-cat-optical-atmosphere-techniques-title = Verfahren für optische Verbindungen

js-cat-orbit-gnss-challenged-question = Wann ist aus der Satellitengeometrie überhaupt eine Positionslösung möglich?

js-cat-orbit-gnss-challenged-title = GNSS-Verfügbarkeit

js-cat-orbit-molniya-question = Sieht ein Nutzer auf einer stark exzentrischen Molniya-Bahn nahe dem Apogäum noch genug GNSS-Satelliten?

js-cat-orbit-molniya-title = Molniya-Nutzer

js-cat-orbit-multignss-question = Wie stark heben GPS + Galileo zusammen die Verfügbarkeit und verbessern die Dilution of Precision?

js-cat-orbit-multignss-title = Multi-GNSS-Verfügbarkeit

js-cat-orbit-real-tle-question = Welche Abdeckung bietet eine tatsächliche Konstellation, angegeben als Zweizeilen-Elementsätze?

js-cat-orbit-real-tle-title = Reale Zweizeilen-Elemente

js-cat-orbit-rinex-question = Welche Verfügbarkeit ergibt sich aus einer realen RINEX-3-Broadcast-Ephemeride?

js-cat-orbit-rinex-title = Broadcast-Ephemeride

js-cat-orbit-sgp4-gps-question = Wie propagiert eine reale GPS-ähnliche Konstellation über einen Tag?

js-cat-orbit-sgp4-gps-title = SGP4-Bahnen

js-cat-orbit-urban-canyon-skyline-question = Wie viel vom Tag liefern GPS und Galileo am Grund einer Stadtstraße vier Satelliten, und was bewirkt der Himmelsstreifen für den PDOP? (modelliert; repräsentative Skyline)

js-cat-orbit-urban-canyon-skyline-title = Verfügbarkeit in einer Stadtstraße

js-cat-passes-question = Wann geht ein Satellit über einer Station auf und unter, und wie lange?

js-cat-passes-title = Bodenüberflüge

js-cat-polar-arctic-leo-coverage-question = Wie ändern sich vom Äquator bis zum Pol die Satelliten in Sicht und die Geometrie bei GNSS allein, bei einer polaren Schicht im niedrigen Orbit allein und bei beiden? (modelliert)

js-cat-polar-arctic-leo-coverage-title = Vom Äquator zum Pol

js-cat-pvt-abmf-question = Lässt sich aus rohen RINEX-Messungen eine reale Empfängerposition lösen?

js-cat-pvt-abmf-title = Positionierung (SPP)

js-cat-quantum-anomaly-detect-question = Wie gut werden Fehler von Quantensystemen bei einer festen Fehlalarmrate erkannt? (modelliert)

js-cat-quantum-anomaly-detect-title = Erkennung von Quantenanomalien

js-cat-quantum-cai-coast-question = Wie lange hält ein durch seine Physik spezifiziertes Kaltatom-Interferometer die Koppelnavigation nach GNSS-Verlust innerhalb von 100 m, verglichen mit einem Quarz-Beschleunigungsmesser der Navigationsklasse? (modelliert)

js-cat-quantum-cai-coast-title = Überbrückung mit Quantenbeschleunigungsmesser

js-cat-quantum-gnss-free-nav-question = Wie weit driftet ein Kaltatom-Navigator ohne GNSS im Vergleich zu einem INS der Navigationsklasse? (modelliert)

js-cat-quantum-gnss-free-nav-title = Quanten-Navigation ohne GNSS

js-cat-quantum-pnt-demonstrator-suite-question = Die drei Quantenanwendungsbereiche als eine Studie (eine Kommandozeilen-Studienreihe: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Studie zum Quanten-PNT-Demonstrator

js-cat-quantum-time-transfer-question = Was bringt vertrauenswürdige Quantenzeitgebung gegenüber einer klassischen CSAC + HF-Kette? (modelliert)

js-cat-quantum-time-transfer-title = Quanten-Zeitübertragung

js-cat-quantum-trade-question = Welchen Zeitgebungs- / Inertial-Holdover bringt eine Kandidatenuhr gegenüber einer klassischen Basislinie? (modelliert)

js-cat-quantum-trade-title = Quanten-PNT-Trade-off

js-cat-rail-tunnel-coast-question = Wie bald verlässt ein INS der taktischen Klasse bei 160 km/h in einem Tunnel sein Budget? (modelliert)

js-cat-rail-tunnel-coast-title = Zug durch einen Tunnel

js-cat-realtime-frame-eop-question = Wie viel Bezugssystemfehler führt die (vorhergesagte) Echtzeit-Erdorientierung ein? (modelliert)

js-cat-realtime-frame-eop-title = Echtzeit-Bezugssystem/EOP

js-cat-reentry-question = Welche Spitzenbeschleunigung und welche Geschwindigkeit der maximalen Erwärmung erlebt ein ballistischer Wiedereintritt?

js-cat-reentry-title = Wiedereintrittskorridor

js-cat-slot-timing-ocxo-leo-question = Wie lange bleibt ein ofengesteuerter Quarzoszillator auf einem Kleinsatelliten im niedrigen Orbit nach der letzten GNSS-Positionslösung innerhalb seines Slot-Schutzintervalls? (modelliert)

js-cat-slot-timing-ocxo-leo-title = Slot-Zeitgebung

js-cat-small-uas-jammed-nav-question = Wie weit driftet eine Inertialeinheit der Flugsteuerungsklasse, nachdem ein Störsender das GNSS weggenommen hat, verglichen mit einer der taktischen Klasse?

js-cat-small-uas-jammed-nav-title = Kleine Drohne unter Jamming

js-cat-solar-system-tour-question = Wo steht jeder Körper, den die Engine kennt, von der Sonne bis Pluto und den großen Monden, und wie lange braucht das Licht zwischen ihnen?

js-cat-solar-system-tour-title = Sonnensystem zu einer Epoche

js-cat-space-packet-question = Werden CCSDS-133.0-Pakete bitgenau kodiert und dekodiert?

js-cat-space-packet-title = Space Packet

js-cat-space-weather-question = Wie verändert die solare / geomagnetische Aktivität die Dichte der Thermosphäre? (modelliert)

js-cat-space-weather-title = Weltraumwetter

js-cat-spoof-attack-question = Wird ein ansteigendes Zeit-Spoofing erkannt, bevor es die Spezifikation erreicht?

js-cat-spoof-attack-title = Spoofing-Erkennung

js-cat-spoof-detect-question = Kann ein fusionierter Monitor aus HF und Messung ein koordiniertes Spoofing erkennen?

js-cat-spoof-detect-title = Mehrschichtige Spoofing-Erkennung

js-cat-spoof-meaconing-question = Wie oft erkennt ein uhrgestützter Energiedetektor bei fester Fehlalarmrate das Spoofing, wenn die Angriffsform ausdrücklich vorgegeben ist?

js-cat-spoof-meaconing-title = Statistik des Spoofing-Detektors

js-cat-starlink-sop-doppler-positioning-question = Wie gut kann sich ein Empfänger aus dem Doppler einer Breitbandkonstellation positionieren, die keine Navigationsnachricht sendet? (modelliert)

js-cat-starlink-sop-doppler-positioning-title = Breitbandige Gelegenheitssignale

js-cat-sweep-clock-stability-question = Wie ändert sich der Holdover, wenn ein Uhrenparameter durchgefahren wird?

js-cat-sweep-clock-stability-title = Parameterdurchlauf

js-cat-sweep-nd-inertial-question = Wie variiert eine Gütezahl über ein mehrdimensionales Parametergitter?

js-cat-sweep-nd-inertial-title = N-D-Durchlauf

js-cat-telecom-prtc-holdover-24h-question = Bleibt eine Rubidiumreferenz, die GNSS für 24 Stunden verliert, innerhalb der ITU-T-Zeitfehlermasken? (modelliert)

js-cat-telecom-prtc-holdover-24h-title = Telekom-Holdover, 24 h

js-cat-telecom-synce-eec-question = Bleibt ein frei laufender ofengesteuerter Oszillator innerhalb der Wander-Masken für die Geräteuhr von synchronem Ethernet? (modelliert)

js-cat-telecom-synce-eec-title = Frequenzsynchronisation gegen SyncE-Masken

js-cat-telecom-tie-ingest-question = Besteht eine Aufzeichnung des Zeitintervallfehlers die ITU-T-Masken für MTIE und TDEV?

js-cat-telecom-tie-ingest-title = Telekom-Maskenprüfung, Ihre Daten

js-cat-terrain-nav-question = Kann ein Höhenmesser die INS-Drift korrigieren, indem er ein Geländehöhenprofil abgleicht?

js-cat-terrain-nav-title = Geländenavigation

js-cat-terrain-slam-question = Kann ein Partikelfilter eine zeitveränderliche INS-Drift gegen eine Geländekarte verfolgen?

js-cat-terrain-slam-title = Gelände-SLAM

js-cat-time-transfer-budget-question = Was bewirken Stations-, Transponder-, Ionosphären- und Sagnac-Terme bei einem Zweiweg-Zeitoffset, und wie sieht sein Unsicherheitsbudget aus? (modelliert)

js-cat-time-transfer-budget-title = Zweiweg-Satelliten-Zeitübertragung

js-cat-timetransfer-question = Wie eng können zwei Standorte über eine Verbindung synchron bleiben?

js-cat-timetransfer-title = Zeitübertragung

js-cat-tracking-loop-question = Bei welchem C/N0 verliert ein Empfänger tatsächlich die Synchronisation, und kann ein Spoofer die Schleifen hinüberziehen? (modelliert)

js-cat-tracking-loop-title = Verfolgungsschleife

js-cat-xona-pulsar-end-to-end-question = Dieselbe Kette mit öffentlichen Xona-Pulsar-Zahlen: Signal, Überflug, Nachricht, fusionierte Positionslösung und präzise Positionierung. (modelliert)

js-cat-xona-pulsar-end-to-end-title = Durchgängig, Xona Pulsar

js-cat-xona-pulsar-signals-question = Wie genau kann ein Empfänger auf den veröffentlichten Signalen X1 und X5 Entfernungen messen, und wie groß ist der Akquisitionssuchraum? (öffentliche Signaltabelle)

js-cat-xona-pulsar-signals-title = Xona-Pulsar-Signale

js-geo-a-place = Ein Ort …

js-geo-axis-east = O +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = Die Straßenschluchtform benötigt Engine 0.36.

js-geo-canyon-out-of-range = Die Werte der Straßenschlucht liegen außerhalb des Bereichs (Azimut 0 bis 359,9°, Breite 1 bis 200 m, Höhen 0 bis 500 m, Antenne 0 bis 50 m); es wird ein offener Horizont verwendet.

js-geo-canyon-reduced = Die Reduktion der Schlucht durch die Engine auf eine Tabelle mit 360 Klassen.

js-geo-compute-failed = Die Engine konnte diesen Himmel nicht berechnen: { $reason }

js-geo-computing = Berechnung läuft …

js-geo-copy-link = Diesen Link kopieren: { $url }

js-geo-count-below = Unter dem Horizont

js-geo-count-hidden = Von der Skyline verdeckt

js-geo-count-in-view = In Sicht

js-geo-count-open-sky = Offener Himmel

js-geo-count-used = In der Lösung

js-geo-cursor-live = Azimut { $az }°, Skyline { $el }°.

js-geo-dated-sky = Ein datierter Himmel ist nur so gut wie die Elemente und ihr Alter; die Voreinstellungen entfallen.

js-geo-dop-geometric = geometrisch

js-geo-dop-geometric-title = geometrische Dilution of Precision

js-geo-dop-horizontal = horizontal

js-geo-dop-horizontal-title = horizontale Dilution of Precision

js-geo-dop-position = Position, 3D

js-geo-dop-position-title = Position, 3D-Dilution of Precision

js-geo-dop-time = Zeit

js-geo-dop-time-title = Zeit-Dilution of Precision

js-geo-dop-vertical = vertikal

js-geo-dop-vertical-title = vertikale Dilution of Precision

js-geo-east = O

js-geo-engine-not-running = Die Engine läuft in diesem Browser nicht ({ $reason }).

js-geo-err-geometry-object = die Geometrieantwort der Engine ist kein Objekt

js-geo-err-mc-object = die Monte-Carlo-Antwort der Engine ist kein Objekt

js-geo-err-no-sentences = die Antwort der Engine enthält keine Sätze

js-geo-err-reply-kind-not-json = die Antwort der Engine ({ $what }) war kein JSON

js-geo-err-reply-not-json = die Antwort der Engine war kein JSON

js-geo-error-line = Mit σ_UERE = { $uere } m unter dem angegebenen Fehlermodell (Engine-Werte): { $bits }.

js-geo-error-line-needs = Positionsfehler ≈ σ_UERE × HDOP horizontal und σ_UERE × VDOP vertikal; der Wert benötigt Engine 0.36.

js-geo-error-rms-3d = 3D-RMS σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = horizontaler RMS σ_UERE × HDOP = { $m } m

js-geo-error-sigma = 1-Sigma-Fehler Ost { $east } m, Nord { $north } m

js-geo-fact-ellipse-1s = Ellipse, 1-Sigma

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, lange Achse { $deg }° von Nord

js-geo-fact-ellipse-pct = Ellipse, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1-Sigma × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = Innerhalb der 95-%-Ellipse

js-geo-fact-inside-value = { $pct } % der Punkte

js-geo-fact-line = { $key }: { $value }.

js-geo-fact-mc = Monte Carlo

js-geo-fact-mc-value =
    { $n ->
        [one] { $n } Lösung nach kleinsten Quadraten, Seed { $seed }
       *[other] { $n } Lösungen nach kleinsten Quadraten, Seed { $seed }
    }

js-geo-fact-rms-3d = RMS der Punktwolke, 3D

js-geo-fact-rms-3d-beside = { $rms } m, neben σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = RMS der Punktwolke, horizontal

js-geo-fact-rms-h-beside = { $rms } m, neben σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }: kein GeoJSON (erwartet wurde eine FeatureCollection, ein Feature oder eine Geometrie).

js-geo-gj-not-json = { $name }: kein JSON ({ $reason }).

js-geo-gj-not-object = { $name }: kein GeoJSON-Objekt.

js-geo-gj-too-many =
    { $name }: { $count ->
        [one] { $count } Feature
       *[other] { $count } Features
    }; diese Seite zeichnet höchstens { $max }.

js-geo-legend-item = { $label }: { $used } von { $total } in der Lösung

js-geo-link-copied = Link kopiert.

js-geo-link-copied-no-tle = Link kopiert (ohne Ihre eingefügten Elemente: Ein Link öffnet die Voreinstellungen).

js-geo-mc-off = Aus

js-geo-missing-ellipse = die Fehlerellipse

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = die Monte-Carlo-Wolke

js-geo-missing-open-sky = der Anteil offenen Himmels

js-geo-missing-skyline = die Skyline

js-geo-missing-tdop = TDOP

js-geo-needs = benötigt Engine 0.36

js-geo-needs-cap = Benötigt Engine 0.36

js-geo-no = Nein

js-geo-no-ellipse = Keine Ellipse

js-geo-no-sats = Keine Satelliten zum Anzeigen.

js-geo-north = N

js-geo-not-given = nicht angegeben

js-geo-note-elements-skipped =
    { $count ->
        [one] { $count } Elementsatz wurde übersprungen: { $list }.
       *[other] { $count } Elementsätze wurden übersprungen: { $list }.
    }

js-geo-note-latitude-limited = Dieser Engine-Build modelliert Standorte bis 89° vom Äquator; die Breite wurde darauf begrenzt.

js-geo-note-leo-left-out = LEO: benötigt Engine 0.36; ausgelassen.

js-geo-note-no-engine = Die Engine läuft in diesem Browser nicht, daher gibt es nichts anzuzeigen. Sie läuft als WebAssembly; ein Browser oder Host, der WebAssembly blockiert, kann diese Ansicht nicht ausführen.

js-geo-note-pick-one = Wählen Sie mindestens eines von GPS, Galileo und BeiDou.

js-geo-note-skyline-not-applied = Die Skyline wird gezeichnet, aber nicht angewendet: Dafür wird Engine 0.36 benötigt. Dahinter liegende Satelliten zählen hier weiterhin.

js-geo-note-skyline-source = Skyline: { $source }.

js-geo-note-training-model = Engine { $version } Trainingshimmel-Modell (nmea_training) bei { $instant }: Winkel in ganzen Grad und DOPs mit einer Nachkommastelle, wie Empfängersätze sie tragen; die Positionslösung verwendet höchstens 12 Satelliten, nach Signalstärke gewählt.

js-geo-note-unknown-systems =
    { $count ->
        [one] { $count } Satellitendatensatz eines Systems, das diese Ansicht nicht zeichnet, wurde ausgelassen.
       *[other] { $count } Satellitendatensätze eines Systems, das diese Ansicht nicht zeichnet, wurden ausgelassen.
    }

js-geo-off-leo = LEO: benötigt Engine 0.36.

js-geo-off-monte-carlo = Die Monte-Carlo-Wolke benötigt Engine 0.36.

js-geo-off-skyline = Das Anwenden einer Skyline benötigt Engine 0.36: Hier wird sie nur gezeichnet.

js-geo-offset-own = Versatz zur Epoche Ihrer Elemente ({ $epoch })

js-geo-offset-ref = Versatz zur Referenzepoche der Konstellationen

js-geo-open-sky-share = { $pct } % der oberen Hemisphäre

js-geo-out-of-range = Außerhalb des Bereichs, daher auf dem letzten guten Wert belassen: { $names }.

js-geo-own-elements-at = Ihre eigenen Elemente zur Epoche { $epoch }.

js-geo-pick-constellation = Wählen Sie mindestens eine Konstellation.

js-geo-place-geiranger = Geirangerfjord, Norwegen

js-geo-place-manhattan = Midtown Manhattan, Vereinigte Staaten

js-geo-place-oslo = Hafen von Oslo, Norwegen

js-geo-place-rotterdam = Hafen von Rotterdam, Niederlande

js-geo-place-singapore = Straße von Singapur

js-geo-place-tallinn = Hafen von Tallinn, Estland

js-geo-place-tromso = Tromsø, Norwegen

js-geo-plot-desc =
    { $total ->
        [one] { $total } Satellit im Diagramm, { $used } in der Lösung.
       *[other] { $total } Satelliten im Diagramm, { $used } in der Lösung.
    }

js-geo-preset-illustrative = Von dieser Seite gezeichneter illustrativer Umriss; das Anwenden einer Skyline benötigt Engine 0.36.

js-geo-ready = Bereit.

js-geo-ready-needs = Bereit. Benötigt Engine 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: Azimut { $az }°, Elevation { $el }°, von der Skyline verdeckt

js-geo-sat-unused = { $label } { $id }: Azimut { $az }°, Elevation { $el }°, nicht verwendet

js-geo-sat-used = { $label } { $id }: Azimut { $az }°, Elevation { $el }°, in der Lösung

js-geo-scenarios-under = Die Szenarien der Engine unter dieser Skyline:

js-geo-sky-canyon = Straßenschlucht

js-geo-sky-drawn = Im Skyplot gezeichnet

js-geo-sky-open = Offener Horizont

js-geo-sky-preset = Voreinstellung: { $name }

js-geo-sky-source = Himmel: { $source }.

js-geo-skyline-city-street = Stadtstraße

js-geo-skyline-container = Containerterminal

js-geo-skyline-fjord = Fjord

js-geo-skyline-harbour = Hafeneinfahrt

js-geo-skyline-load-failed = Die Skyline konnte nicht geladen werden ({ $reason }).

js-geo-skyplot-downloaded = Skyplot heruntergeladen.

js-geo-skyplot-export-failed = Der Skyplot konnte nicht exportiert werden ({ $reason }).

js-geo-source-geometry = Kshana-Engine { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Kshana-Engine { $version }, Trainingshimmel-Modell

js-geo-south = S

js-geo-style-own-elements = Ihre Elemente

js-geo-svg-refused = das SVG der Engine wurde abgelehnt

js-geo-table-count =
    { $n ->
        [one] { $n } Satellit, derselbe wie im Skyplot.
       *[other] { $n } Satelliten, dieselben wie im Skyplot.
    }

js-geo-tle-epoch = Geben Sie eine UTC-Epoche von 2000 bis 2099 an.

js-geo-tle-paste-first = Fügen Sie zuerst einen oder mehrere Zweizeilen-Elementsätze ein.

js-geo-tle-too-large = Die eingefügten Elemente sind größer als 4 MiB, das Eingabelimit der Engine.

js-geo-used-masked = Nein: von der Skyline verdeckt

js-geo-using-own = Ihre eigenen Elemente werden verwendet. Ein Link enthält nur, dass Sie sie verwendet haben, nicht die Elemente selbst.

js-geo-wasm-blocked = WebAssembly ist blockiert

js-geo-west = W

js-geo-why = Warum

js-geo-why-interim = Die Fehlerellipse und die Monte-Carlo-Wolke benötigen Engine 0.36 (ihre Funktionen sky_geometry und sky_monte_carlo); die Engine auf dieser Seite ist älter.

js-geo-why-no-ellipse = Die Engine lieferte für diese Geometrie keine Ellipse (zu wenige Satelliten für eine Positionslösung oder eine singuläre Geometrie).

js-geo-why-no-ellipse-reason = Die Engine lieferte für diese Geometrie keine Ellipse (zu wenige Satelliten für eine Positionslösung oder eine singuläre Geometrie): { $reason }.

js-geo-why-waiting = Warten auf die Engine.

js-geo-yes = Ja

js-hold-axis-seconds = Sekunden ab der ersten Abtastung

js-hold-axis-tau = Beobachtungszeit τ, s (log)

js-hold-axis-te = Zeitfehler, ns

js-hold-band-title = Wiederherstellungsband ±{ $band } ns

js-hold-blurb-example = Abtastung alle 5 s: 600 s eingerastet, GNSS bei 600 s entfernt, Holdover, GNSS bei 2400 s wiederhergestellt. Die Aufzeichnung wird für das Beispiel erzeugt; sie ist keine Messung.

js-hold-blurb-ptp4l = Dieselben vier Schritte, gelesen aus einem ptp4l-Servoprotokoll (der eigene Offset des Daemons, in ns). Das Protokoll ist für das Beispiel geschrieben; es lief kein Daemon.

js-hold-budget-exceeded = { $name } erstmals { $s } s nach dem Entfernen überschritten

js-hold-chip-baseline = Basislinie gegen ihre Masken

js-hold-chip-envelope = Holdover-Hüllkurve ePRTC-A

js-hold-chip-holdover = Holdover gegen seine Masken

js-hold-chip-measured = gegen die Maske gemessen

js-hold-chip-recovery = Wiederherstellung

js-hold-chip-words = In Worten

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } über der Beobachtungszeit, mit den Grenzen der Maske

js-hold-envelope-exceeded = Holdover-Hüllkurve ePRTC-A erstmals { $s } s nach dem Entfernen überschritten

js-hold-envelope-exceeded-short = { $verdict }, erstmals { $s } s nach dem Entfernen überschritten (die Aufzeichnung ist kürzer als die Periode der Hüllkurve)

js-hold-envelope-exceeded-value = { $verdict }, erstmals { $s } s nach dem Entfernen überschritten

js-hold-envelope-short = { $verdict } (die Aufzeichnung ist kürzer als die Periode der Hüllkurve)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: kein JSON.

js-hold-file-read-here = { $name }, hier gelesen; es wurde nichts hochgeladen.

js-hold-file-too-large = { $name } ist größer, als diese Seite liest.

js-hold-from-record = die Aufzeichnung des Ergebnisses

js-hold-from-record-decimated = die Aufzeichnung des Ergebnisses, ausgedünnt auf { $have } von { $total } Abtastwerten

js-hold-gnss-removed = GNSS entfernt

js-hold-gnss-removed-stated = GNSS entfernt (vom Betreiber angegeben)

js-hold-gnss-restored = GNSS wiederhergestellt

js-hold-gnss-restored-stated = GNSS wiederhergestellt (vom Betreiber angegeben)

js-hold-largest-at = { $value } bei T+{ $time } s

js-hold-limit-label = ±{ $ns } ns Maske { $step }

js-hold-limit-title = { $id }: ±{ $ns } ns, der maximale absolute Zeitfehler im Schritt { $step }

js-hold-mark-title = { $id } Grenzwert { $limit } ns bei τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = n. v.

js-hold-no-curve = Keine Zeitfehlerkurve: Die Aufzeichnung konnte zum Zeichnen nicht reproduziert werden.

js-hold-no-which-curve = Keine Kurve { $which } in diesem Ergebnis.

js-hold-not-exceeded = nicht überschritten

js-hold-not-recovered = blieb nicht innerhalb des Bandes

js-hold-not-result = dies ist kein Ergebnis eines Holdover-Tests

js-hold-open-failed = { $title } konnte nicht geöffnet werden: { $reason }.

js-hold-opening = { $title } wird geöffnet …

js-hold-phase-baseline = Basislinie: eingerastet

js-hold-phase-holdover = Holdover: GNSS entfernt

js-hold-phase-recovery = Wiederherstellung: GNSS wiederhergestellt

js-hold-phase-title = { $phase }, T+{ $from } s bis { $to } s

js-hold-read-failed = Konnte nicht gelesen oder gezeichnet werden ({ $reason }).

js-hold-recorded = { $title }: das aufgezeichnete Ergebnis der Engine (Version { $version }).

js-hold-recovered = innerhalb von ±{ $band } ns für { $dwell } s, { $after } s nach der Rückkehr von GNSS

js-hold-result-not-json = das Ergebnis ist kein JSON ({ $reason })

js-hold-result-not-loaded = das aufgezeichnete Ergebnis wurde nicht geladen

js-hold-row-envelope = Holdover-Hüllkurve ePRTC-A

js-hold-row-frequency = Gehaltener Frequenzoffset (angepasste Steigung)

js-hold-row-largest = Größter absoluter Zeitfehler

js-hold-row-length = Holdover-Dauer

js-hold-row-margin = Kleinste Reserve innerhalb der Hüllkurve

js-hold-row-peak = Spitze nach der Wiederherstellung

js-hold-row-recovery = Wiederherstellung

js-hold-row-recovery-step = Größter Sprung während der Wiederherstellung

js-hold-row-residual = Residuum um diese Gerade (rms)

js-hold-row-step = Sprung im Moment des Entfernens

js-hold-status-final = { $status } { $label }; gegen die Maske gemessen.

js-hold-step-span = T+{ $from } bis { $to } s

js-hold-te-aria = Zeitfehler über die Aufzeichnung, mit den Phasen und den Grenzen der Masken

js-hold-te-line-title = Zeitfehler, ns

js-hold-te-note = Zeitfehler aus { $from }. Angabe der beiden Zeitpunkte: { $by }.

js-hold-th-budget = Budget

js-hold-th-budget-limit = Grenze |TE|, ns

js-hold-th-first-exceeded = Erstmals überschritten nach dem Entfernen, s

js-hold-th-largest = Größter |TE|, ns

js-hold-th-limit = Grenze, ns

js-hold-th-margin = Reserve, ns

js-hold-th-mask = Maske

js-hold-th-mean = Mittelwert, ns

js-hold-th-measured-on = Gemessen an

js-hold-th-metric = Kennzahl

js-hold-th-rms = RMS, ns

js-hold-th-samples = Abtastwerte

js-hold-th-source = Quelle

js-hold-th-span = Spanne

js-hold-th-step = Schritt

js-hold-th-value = Wert, ns

js-hold-th-verdict = Befund

js-hold-th-worst-at = Schlechtester Wert bei τ oder T+, s

js-hold-title-example = Eine Zeitfehleraufzeichnung

js-hold-title-ptp4l = Ein linuxptp-Protokoll

js-hold-why-no-samples = das Ergebnis enthält keine Zeitfehler-Abtastwerte (record.series), daher wird keine Kurve gezeichnet

js-hold-why-not-series = die Reihe im Ergebnis ist keine Zeitreihe (weniger als zwei Abtastwerte oder nicht ansteigende Zeit), daher wird keine Kurve gezeichnet

js-hold-why-sentence = { $why }.

js-hold-why-too-many = die Reihe im Ergebnis hat { $have } Abtastwerte, wo die Engine { $scored } bewertet hat, daher wird keine Kurve gezeichnet

js-interf-attribution = Zuordnung

js-interf-build-failed = { $name }: konnte nicht erstellt werden ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] { $n } Tageskarte aus { $name } mit Engine { $version } in diesem Browser erstellt.
       *[other] { $n } Tageskarten aus { $name } mit Engine { $version } in diesem Browser erstellt.
    }

js-interf-built-detail = { $date }: { $published } Zellen veröffentlicht, { $flagged } markiert

js-interf-built-from-sample = Mit der Engine in diesem Browser aus der synthetischen Stichprobe { $kind } erstellt. Erfundene Meldungen; kein reales Flugzeug, Schiff oder Datum.

js-interf-built-maps =
    { $n ->
        [one] { $n } Karte erstellt ({ $detail }). Nur aggregiert: Eine markierte Zelle nennt nicht eine Störung als Ursache.
       *[other] { $n } Karten erstellt ({ $detail }). Nur aggregiert: Eine markierte Zelle nennt nicht eine Störung als Ursache.
    }

js-interf-built-none = { $name }: Die Engine hat keine Karte erstellt.

js-interf-caveat-coverage = Die Abdeckung folgt der Datenquelle; lesen Sie die Hinweise zur Abdeckung.

js-interf-caveat-no-colour = Eine Zelle ohne Farbe wurde nicht beobachtet. Das ist kein Beleg dafür, dass das Gebiet frei war.

js-interf-caveat-not-finding = Eine beeinträchtigte oder auffällige Zelle ist kein Befund einer Störung. Es gibt andere Ursachen.

js-interf-caveat-past-reports = Dies ist eine Beschreibung vergangener Positionsmeldungen, keine Vorhersage und keine Messung eines Empfängers.

js-interf-caveats = Einschränkungen

js-interf-cell-size-rule = Die Zellgröße muss eine Zahl in Grad größer als 0 und höchstens 10 sein, oder leer für 0,5.

js-interf-check-failed = { $name }: konnte nicht geprüft werden ({ $reason }).

js-interf-click-cell = Klicken Sie auf eine Zelle oder fokussieren Sie die Karte und nutzen Sie die Pfeiltasten, um ihre Werte zu sehen.

js-interf-close = Schließen

js-interf-close-file = { $name } schließen

js-interf-col-affected = Betroffen

js-interf-col-cell-area = Zellfläche

js-interf-col-detectors = Detektoren

js-interf-col-observed = Beobachtet

js-interf-col-sampled = Abgetastet

js-interf-col-share = Anteil

js-interf-col-status = Status

js-interf-coverage-limits = Abdeckungsgrenzen dieser Quelle

js-interf-csv-too-big = { $name }: größer als 24 MiB; erstellen Sie aus einem Auszug (das Kommandozeilenwerkzeug nimmt eine ganze Datei).

js-interf-csv-too-big-short = { $name }: größer als 24 MiB; erstellen Sie aus einem Auszug.

js-interf-custom-needs-licence = Ein eigener Datensatz braucht die Lizenz, ihre URL und den Quellenhinweis: Sie werden in die Kartendatei geschrieben.

js-interf-dataset = Datensatz

js-interf-dates-rule = Datumsangaben haben die Form YYYY-MM-DD oder sind leer für keine Begrenzung.

js-interf-day = Tag

js-interf-day-aria = Tag { $kind }

js-interf-day-confounded-note = Dieser Tag ist konfundiert: Wegen des Hintergrunds des Tages wurde keine Zelle als beeinträchtigt eingestuft. Zellen, die sonst aufgefallen wären, werden als nicht bewertet gezeigt.

js-interf-day-figures-aria = Werte für den Tag

js-interf-demo-csv-name = { $file } (synthetische Stichprobe)

js-interf-demo-failed = Die Demo konnte nicht geöffnet werden: { $reason }.

js-interf-demo-opened = Synthetische Demo: drei erfundene Dateien über einer erfundenen Region auf offenem Ozean (zwei ADS-B-Tage, einer davon konfundiert, und ein AIS-Tag). Hinter ihnen steht kein reales Flugzeug, Schiff oder Datum. Nutzen Sie die Tagesauswahl auf der ADS-B-Ebene.

js-interf-demo-route-name = route.csv (synthetisch)

js-interf-describe-map = Karte { $kind } für { $date }: { $cells } Zellen gezeichnet, { $parts }. Nicht gezeichnete Zellen wurden nicht beobachtet.

js-interf-did-not-load = { $url } wurde nicht geladen

js-interf-engine-no-fn = Dieser Engine-Build (Version { $version }) hat kein { $fn }; er ist älter als diese Seite. Das Kommandozeilen-Äquivalent steht auf der Seite Werkzeuge.

js-interf-engine-start-failed = Die Engine konnte hier nicht gestartet werden ({ $reason }). Das Öffnen von Kartendateien oben funktioniert weiterhin.

js-interf-err-format-version = { $name }: keine unterstützte Kshana-Störungskarte (format_version { $version }; diese Seite unterstützt { $supported }).

js-interf-err-no-rows = { $name }: kein rows[] in diesem Bericht.

js-interf-err-not-json = { $name }: kein JSON ({ $reason }).

js-interf-err-not-map = { $name }: dies ist GeoJSON, aber keine Kshana-Störungskarte (kein Member kshana_interference_map).

js-interf-err-not-route = { $name }: kein Kshana-Routenexpositionsbericht (kein Member kshana_route_exposure).

js-interf-err-route-schema = { $name }: Schema { $schema } ist nicht { $expected }, das diese Seite liest.

js-interf-err-source-kind = { $name }: source_kind { $kind } ist weder adsb noch ais.

js-interf-err-unknown-schema = { $name }: unbekanntes Schema { $schema }; diese Seite liest { $supported }.

js-interf-foot-attribution = Quellenhinweis: { $text }

js-interf-foot-coverage = Abdeckung: { $notes }

js-interf-foot-layer = Ebene { $kind }, { $date }. Nicht gezeichnete Zellen wurden nicht beobachtet.

js-interf-foot-licence = Lizenz: { $licence }

js-interf-foot-licence-url = Lizenz: { $licence } ({ $url })

js-interf-grid = Raster: quadratische Zellen von { $size }° in Breite und Länge ({ $type }). Die Ost-West-Ausdehnung nimmt mit der Breite ab.

js-interf-guards = Schutzmaßnahmen gegen andere Ursachen

js-interf-input = Eingabe

js-interf-land-set = Landpolygone: { $name }.

js-interf-land-too-big = Diese Landdatei ist größer als 24 MiB.

js-interf-larger-than = { $name }: größer als { $limit }; diese Seite liest Kartendateien bis zu dieser Größe.

js-interf-layer-adsb-sub = Zellen, in denen Flugzeuge eine geringe Navigationsgenauigkeit gemeldet haben

js-interf-layer-ais-sub = Zellen, in denen Schiffe unplausible Positionen oder Bewegungen gemeldet haben

js-interf-layer-heading = Ebene { $kind }

js-interf-layer-hidden = Die Ebene { $kind } ist ausgeblendet.

js-interf-layers-separate = ADS-B und AIS sind getrennte Ebenen mit eigenen Schaltern, Legenden und Lizenzzeilen. Sie werden nie zu einem Farbfeld oder einer Zählung zusammengeführt.

js-interf-legend-aria = Was jeder Zellzustand bedeutet; ein Häkchen entfernen, um diese Zellen auszublenden

js-interf-licence = Lizenz

js-interf-licence-aria = Datenlizenz von { $name }

js-interf-licence-heading = Datenlizenz und Quellenhinweis

js-interf-map-aria = { $summary } Pfeiltasten wechseln zwischen gezeichneten Zellen.

js-interf-maps-open =
    { $n ->
        [one] { $n } Karte geöffnet.
       *[other] { $n } Karten geöffnet.
    }

js-interf-method-summary = Methode und Einschränkungen

js-interf-no-cell-at = Keine Zelle bei { $lat }, { $lon }: nicht beobachtet. Das ist kein Beleg dafür, dass das Gebiet frei war.

js-interf-no-cell-drawn = keine Zelle gezeichnet

js-interf-no-cells-draw = Diese Datei enthält keine Zellen zum Zeichnen.

js-interf-no-day-figures = Diese Datei nennt keine Werte auf Tagesebene.

js-interf-no-file-opened = Es konnte keine Datei geöffnet werden.

js-interf-no-file-text = Die geöffneten Karten tragen keinen Dateitext zum Prüfen (sie wurden nicht als Dateien geöffnet).

js-interf-none = keine

js-interf-none-stated = (keine angegeben)

js-interf-none-stated-file = (in dieser Datei keine angegeben)

js-interf-north-abbr = N

js-interf-not-evaluated = nicht ausgewertet

js-interf-not-opened-full = { $name }: nicht geöffnet, es sind bereits { $max } Karten geöffnet. Schließen Sie zuerst einige.

js-interf-nothing-open = Noch nichts geöffnet.

js-interf-nothing-opened = Nichts geöffnet.

js-interf-one-day = ein Tag nach dem anderen

js-interf-opened-file-map = { $files } Datei geöffnet; { $maps } Karte geöffnet.

js-interf-opened-file-maps = { $files } Datei geöffnet; { $maps } Karten geöffnet.

js-interf-opened-files-map = { $files } Dateien geöffnet; { $maps } Karte geöffnet.

js-interf-opened-files-maps = { $files } Dateien geöffnet; { $maps } Karten geöffnet.

js-interf-opening-demo = Die synthetische Demo wird geöffnet …

js-interf-parameters = Parameter, festgelegt vor dem Lesen jeglicher Daten

js-interf-read-draw-failed = { $name }: konnte nicht gelesen oder gezeichnet werden ({ $reason }).

js-interf-read-failed = { $name }: konnte nicht gelesen werden ({ $reason }).

js-interf-read-with-map = Lesen Sie dies zusammen mit der Karte

js-interf-reading = Wird gelesen …

js-interf-route-aria = Routenexposition { $name }

js-interf-route-chip = Route

js-interf-route-done =
    { $n ->
        [one] Routenexposition aus { $n } Karte mit Engine { $version } berechnet; der Bericht wird unten gezeigt.
       *[other] Routenexposition aus { $n } Karten mit Engine { $version } berechnet; der Bericht wird unten gezeigt.
    }

js-interf-route-explain = Anteil der Routenlänge in jedem Zustand, je Tag und Quelle. Die vier Anteile ergeben zusammen 1 und werden gemeinsam gelesen: Ein niedriger Anteil „beeinträchtigt“ bei einem hohen Anteil „nicht beobachtet“ ist nicht als frei nachgewiesen. Zeilen für ADS-B und AIS werden nie zusammengeführt.

js-interf-route-exposure = Routenexposition

js-interf-route-needs-map = Öffnen oder erstellen Sie zuerst mindestens eine Karte: Die Route wird gegen die Karten auf dieser Seite geprüft.

js-interf-route-open-failed = Die Route konnte nicht geöffnet werden: { $reason }.

js-interf-route-range = { $from } bis { $to }

js-interf-route-too-big = { $name }: größer als 24 MiB.

js-interf-row-affected-share = Betroffener Anteil

js-interf-row-aircraft-affected = Betroffene Flugzeuge

js-interf-row-aircraft-observed = Beobachtete Flugzeuge

js-interf-row-aircraft-sampled = Abgetastete Flugzeuge

js-interf-row-area = Fläche

js-interf-row-cell = Zelle

js-interf-row-detectors = Detektoren, die sich qualifizierten

js-interf-row-flagged = Markiert: { $detector }

js-interf-row-status = Status

js-interf-row-vessels-observed = Beobachtete Schiffe

js-interf-rows-skipped =
    { $count ->
        [one] { $count } Zeile war nicht gültig und wurde übersprungen.
       *[other] { $count } Zeilen waren nicht gültig und wurden übersprungen.
    }

js-interf-rt-day = Tag

js-interf-rt-km = Routen-km

js-interf-rt-licence = Lizenz und Quellenhinweis der Karte

js-interf-rt-shares = Anteile der Route

js-interf-rt-source = Quelle

js-interf-sample-failed = Die Stichprobe konnte nicht geöffnet werden: { $reason }.

js-interf-save = Speichern:

js-interf-save-report = Den Bericht speichern (JSON)

js-interf-show-layer = Diese Ebene anzeigen

js-interf-st-anomalous-label = Auffällig

js-interf-st-anomalous-text = Mindestens ein Detektor hat an diesem Tag hier genug verschiedene Schiffe markiert (mindestens 3 Schiffe und 20 % der beobachteten). Mögliche Ursachen sind Störungen, aber auch viele gewöhnliche.

js-interf-st-confounded-label = Tag konfundiert

js-interf-st-confounded-text = Der Median des Zellanteils über den ganzen Tag war hoch, was auf eine großflächige Ursache hindeutet. An einem solchen Tag wird keine Zelle als beeinträchtigt erklärt; diese Zelle wäre sonst aufgefallen.

js-interf-st-degraded-label = Beeinträchtigt

js-interf-st-degraded-text = Ein hoher Anteil der abgetasteten Flugzeuge meldete an diesem Tag hier eine geringe Navigationsgenauigkeit, deutlich über der Median-Zelle des Tages. Warum, sagt das nicht.

js-interf-st-no-background-label = Keine Hintergrundschätzung

js-interf-st-no-background-text = Der Hintergrund des Tages (der typische Anteil von Flugzeugen mit Meldung geringer Genauigkeit) konnte aus zu wenigen Zellen nicht geschätzt werden, daher wird keine Zelle damit verglichen und keine eingestuft.

js-interf-st-not-anomalous-label = Nicht auffällig

js-interf-st-not-anomalous-text = Beobachtet, und kein Detektor hat sich qualifiziert. Kein Beweis, dass nichts geschehen ist.

js-interf-st-not-degraded-label = Nicht beeinträchtigt

js-interf-st-not-degraded-text = Abgetastet, und der Anteil der Flugzeuge mit Meldung geringer Genauigkeit fiel nicht auf. Kein Beweis, dass nichts geschehen ist.

js-interf-st-too-few-label = Zu wenige Flugzeuge

js-interf-st-too-few-text = Veröffentlicht (mindestens 5 verschiedene Flugzeuge beobachtet), aber weniger als 10 Flugzeuge konnten abgetastet werden, daher wird keine Einstufung vorgenommen.

js-interf-starting-build = Engine wird gestartet und Karte erstellt …

js-interf-starting-route = Engine wird gestartet und Route geprüft …

js-interf-state-clear-adsb = Frei

js-interf-state-clear-adsb-text = Mit genug Flugzeugen beobachtet und nicht markiert. Kein Beweis, dass nichts geschehen ist.

js-interf-state-clear-ais = Frei

js-interf-state-clear-ais-text = Mit genug Schiffen beobachtet und nicht markiert. Kein Beweis, dass nichts geschehen ist.

js-interf-state-degraded-adsb = Beeinträchtigt

js-interf-state-degraded-adsb-text = Ein hoher Anteil der abgetasteten Flugzeuge meldete an diesem Tag hier eine geringe Navigationsgenauigkeit, deutlich über der Median-Zelle des Tages.

js-interf-state-degraded-ais = Auffällig

js-interf-state-degraded-ais-text = Mindestens ein Detektor hat an diesem Tag hier genug verschiedene Schiffe markiert (mindestens 3 Schiffe und 20 % der beobachteten).

js-interf-state-notobs-adsb = Nicht beobachtet

js-interf-state-notobs-adsb-text = Keine Zelle gezeichnet: Es wurden zu wenige Flugzeuge beobachtet, um sie zu veröffentlichen. Das ist kein Beleg dafür, dass das Gebiet frei war.

js-interf-state-notobs-ais = Nicht beobachtet

js-interf-state-notobs-ais-text = Keine Zelle gezeichnet: Es wurden zu wenige Schiffe beobachtet, um sie zu veröffentlichen. Das ist kein Beleg dafür, dass das Gebiet frei war.

js-interf-state-unassessed-adsb = Nicht bewertet

js-interf-state-unassessed-adsb-text = Beobachtet, aber es konnten zu wenige Flugzeuge abgetastet werden, der Tag war konfundiert oder der Hintergrund des Tages konnte nicht geschätzt werden, daher wird keine Einstufung vorgenommen.

js-interf-state-unassessed-ais = Nicht bewertet

js-interf-state-unassessed-ais-text = Beobachtet, aber es wird keine Einstufung vorgenommen.

js-interf-status-unknown = Ein Status, den diese Seite nicht beschreibt.

js-interf-table-first = Die ersten { $shown } von { $total } Zellen werden gezeigt, die wichtigen Einstufungen zuerst.

js-interf-table-summary = Jede gezeichnete Zelle als Tabelle ({ $n })

js-interf-the-day = Der Tag

js-interf-unknown-date = unbekanntes Datum

js-interf-warn-cell-size = Diese Datei verwendet eine Zellgröße von { $size }°, die nicht die vorab registrierte ist: Es ist nicht die vorab registrierte Methode, daher sind ihre Einstufungen nicht mit Dateien vergleichbar, die sie verwenden.

js-interf-warn-cell-size-known = Diese Datei verwendet eine Zellgröße von { $size }°, die nicht die vorab registrierte ({ $registered }°) ist: Es ist nicht die vorab registrierte Methode, daher sind ihre Einstufungen nicht mit Dateien vergleichbar, die sie verwenden.

js-interf-warn-day-confounded = Dieser Tag ist konfundiert: Wegen des Hintergrunds des Tages wurde keine Zelle als beeinträchtigt eingestuft (der Median des Zellanteils war selbst hoch).

js-interf-warn-flag-disagrees =
    { $count ->
        [one] { $count } Zelle hat eine Markierung „beeinträchtigt“, die ihrem Status widerspricht. Gezeichnet wird der Status.
       *[other] { $count } Zellen haben eine Markierung „beeinträchtigt“, die ihrem Status widerspricht. Gezeichnet wird der Status.
    }

js-interf-warn-no-licence = Diese Datei trägt keinen Text für { $fields }. Sie wird gezeigt, aber eine Karte ohne ihre Lizenz und ihren Quellenhinweis sollte nicht erneut veröffentlicht werden.

js-interf-warn-on-land-off = Der Detektor für Landpositionen war für diese Datei ausgeschaltet (es wurden keine Landpolygone geliefert).

js-interf-warn-skipped =
    { $count ->
        [one] { $count } Feature war kein gültiges GeoJSON und wurde übersprungen.
       *[other] { $count } Features waren kein gültiges GeoJSON und wurden übersprungen.
    }

js-interf-warn-unknown-status = Statuswerte, die diese Seite nicht kennt: { $values }. Sie werden als „keine Einstufung“ gezeichnet.

js-interf-withheld = zurückgehalten (weniger als 5)

js-interf-written-by = geschrieben von Kshana { $version }

js-kind-axis-3-d-position-error-m = 3D-Positionsfehler (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = Code-Jitter (m)

js-kind-axis-code-tracking-jitter-m = Code-Tracking-Jitter (m)

js-kind-axis-doppler-shift-hz = Dopplerverschiebung (Hz)

js-kind-axis-effective-c-n0-db-hz = effektives C/N0 (dB-Hz)

js-kind-axis-elevation = Elevation (°)

js-kind-axis-fit-interval-s = Anpassungsintervall (s)

js-kind-axis-formal-position-sigma-m = formales Positions-Sigma (m)

js-kind-axis-latitude = Breite (°)

js-kind-axis-leo-satellites-added-to-the = der Positionslösung hinzugefügte LEO-Satelliten

js-kind-axis-mean-satellites-in-view = mittlere Zahl der Satelliten in Sicht

js-kind-axis-median-dilution-of-precision = Median der Dilution of Precision

js-kind-axis-median-error-m = Medianfehler (m)

js-kind-axis-median-pdop = Median-PDOP

js-kind-axis-metres = Meter

js-kind-axis-observation-window-s = Beobachtungsfenster (s)

js-kind-axis-offset-from-the-signal-s = Abstand von der Signalmitte (MHz)

js-kind-axis-offset-from-the-snapshot-centre = Abstand von der Mitte der Momentaufnahme (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = Positionsfehler (m)

js-kind-axis-power-spectral-density-db-hz = spektrale Leistungsdichte (dB/Hz, Einheitsleistung)

js-kind-axis-power-spectral-density-dbw-hz = spektrale Leistungsdichte (dBW/Hz)

js-kind-axis-probability-of-detection = Detektionswahrscheinlichkeit

js-kind-axis-range-error-m = Entfernungsfehler (m)

js-kind-axis-relays = Relais

js-kind-axis-sisre-root-mean-square-m = SISRE, quadratischer Mittelwert (m)

js-kind-axis-time-error-ns = Zeitfehler (ns)

js-kind-axis-time-s = Zeit (s)

js-kind-axis-time-since-the-start-min = Zeit seit dem Start (min)

js-kind-axis-update-period-s = Aktualisierungsperiode (s)

js-kind-cap-body-pnt-label = Relaispositionierung

js-kind-cap-campaign-label = Kampagne

js-kind-cap-constellation-design-label = Abdeckung

js-kind-cap-leo-navmsg-label = Navigationsnachricht

js-kind-cap-leo-pass-label = Überflug & Link

js-kind-cap-leo-pnt-chain-label = Durchgängige Kette

js-kind-cap-leo-ppp-label = Positionierung

js-kind-cap-leo-pvt-label = Positionierung

js-kind-cap-leo-signal-label = Signalentwurf

js-kind-cap-lunar-llr-datum-label = Datum aus Laserentfernungsmessung

js-kind-cap-ntn-positioning-label = Positionierung

js-kind-cap-solar-system-label = Sonnensystem

js-kind-cap-spectrum-label = Spektrum

js-kind-guided-doppler-error-hz = Dopplerfehler (Hz)

js-kind-guided-duration-s = Dauer (s)

js-kind-guided-earth-range-error-m = Entfernungsfehler zur Erde (m)

js-kind-guided-elevation-mask = Elevationsmaske (°)

js-kind-guided-first-jammer-bandwidth-mhz = Bandbreite des ersten Störsenders (MHz)

js-kind-guided-first-jammer-power-dbw = Leistung des ersten Störsenders (dBW)

js-kind-guided-first-jammer-range-m = Entfernung des ersten Störsenders (m)

js-kind-guided-first-jammer-received-power-dbw = Empfangene Leistung des ersten Störsenders (dBW)

js-kind-guided-first-phase-length-s = Länge der ersten Phase (s)

js-kind-guided-first-shell-altitude-km = Höhe der ersten Schale (km)

js-kind-guided-first-shell-inclination = Inklination der ersten Schale (°)

js-kind-guided-first-signal-bandwidth-hz = Bandbreite des ersten Signals (Hz)

js-kind-guided-first-system-range-error-m = Entfernungsfehler des ersten Systems (m)

js-kind-guided-fit-interval-s = Anpassungsintervall (s)

js-kind-guided-gravity-field-degree = Grad des Schwerefelds

js-kind-guided-grid-step = Rasterschritt (°)

js-kind-guided-integration-time-s = Integrationszeit (s)

js-kind-guided-leo-satellites-in-the-sweep = LEO-Satelliten im Durchlauf

js-kind-guided-loop-bandwidth-hz = Schleifenbandbreite (Hz)

js-kind-guided-monte-carlo-runs = Monte-Carlo-Läufe

js-kind-guided-network-synchronisation-error-m = Netzsynchronisationsfehler (m)

js-kind-guided-orbit-altitude-km = Bahnhöhe (km)

js-kind-guided-orbit-determination-error-m = Fehler der Bahnbestimmung (m)

js-kind-guided-orbit-inclination = Bahninklination (°)

js-kind-guided-pdop-threshold = PDOP-Schwelle

js-kind-guided-peak-elevation-of-the-pass = Höchste Elevation des Überflugs (°)

js-kind-guided-points-per-orbit-track = Punkte pro Bahnspur

js-kind-guided-receiver-noise-figure-db = Rauschzahl des Empfängers (dB)

js-kind-guided-receiver-power-when-awake-mw = Empfängerleistung im Wachzustand (mW)

js-kind-guided-reference-c-n0-db-hz = Referenz-C/N0 (dB-Hz)

js-kind-guided-relay-altitude-km = Relaishöhe (km)

js-kind-guided-relay-inclination = Relaisinklination (°)

js-kind-guided-relay-planes = Relaisebenen

js-kind-guided-relay-range-error-m = Relais-Entfernungsfehler (m)

js-kind-guided-relays-per-plane = Relais pro Ebene

js-kind-guided-runs-per-case = Läufe pro Fall

js-kind-guided-satellite-altitude-km = Satellitenhöhe (km)

js-kind-guided-second-system-range-error-m = Entfernungsfehler des zweiten Systems (m)

js-kind-guided-shared-condition = Gemeinsame Bedingung

js-kind-guided-slant-electron-content-tecu = Schräger Elektronengehalt (TECU)

js-kind-guided-slant-range-km = Schrägentfernung (km)

js-kind-guided-spoofed-offset-m = Spoofing-Versatz (m)

js-kind-guided-spoofing-starts-s = Spoofing beginnt (s)

js-kind-guided-sweep-from = Durchlauf von

js-kind-guided-sweep-steps = Durchlaufschritte

js-kind-guided-sweep-to = Durchlauf bis

js-kind-guided-timeline-step-s = Zeitleistenschritt (s)

js-kind-guided-tracking-threshold-db-hz = Verfolgungsschwelle (dB-Hz)

js-kind-guided-transmit-power-dbw = Sendeleistung (dBW)

js-kind-guided-update-period-s = Aktualisierungsperiode (s)

js-kind-guided-user-latitude = Breite des Nutzers (°)

js-kind-hint-a-band-under-this-carrier = ein Band unterhalb dieser Trägerleistungsdichte relativ zum Rauschen hat die Synchronisation verloren

js-kind-hint-a-grid-point-is-available = ein Rasterpunkt ist verfügbar, solange seine Positions-Dilution-of-Precision darunter liegt

js-kind-hint-a-satellite-must-be-this = ein Satellit muss so hoch stehen, um als in Sicht zu zählen

js-kind-hint-a-satellite-must-be-this-2 = ein Satellit muss so hoch stehen, um verwendet zu werden

js-kind-hint-a-satellite-of-the-first = ein Satellit des ersten Systems muss so hoch stehen

js-kind-hint-arc-one-message-is-fitted = Bogen, über den eine Nachricht angepasst wird

js-kind-hint-code-tracking-loop-noise-bandwidth = Rauschbandbreite der Codeverfolgungsschleife

js-kind-hint-detail-of-the-truth-orbit = Detailgrad des Schweremodells der Referenzbahn

js-kind-hint-distance-from-the-first-jammer = Entfernung vom ersten Störsender zum Empfänger

js-kind-hint-distance-to-the-satellite-in = Entfernung zum Satelliten im Bandvergleich

js-kind-hint-drawn-while-acquiring-and-tracking = gezeichnet während der Akquisition und Verfolgung

js-kind-hint-equivalent-isotropically-radiated-power-of = äquivalente isotrope Strahlungsleistung des ersten Störsenders

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = äquivalente isotrope Strahlungsleistung des Bandes

js-kind-hint-filter-runs-averaged-for-each = Filterläufe, über die je Fall gemittelt wird (mehr ist langsamer)

js-kind-hint-first-value-of-the-swept = erster Wert des durchlaufenen Parameters

js-kind-hint-height-of-the-chain-s = Höhe des Satelliten der Kette

js-kind-hint-height-of-the-first-shell = Höhe der Bahnen der ersten Schale

js-kind-hint-height-of-the-relay-orbits = Höhe der Relaisbahnen über dem Körper

js-kind-hint-height-of-the-satellite-whose = Höhe des Satelliten, dessen Nachricht angepasst wird

js-kind-hint-how-far-the-spoofer-moves = wie weit der Spoofer die berechnete Position verschiebt

js-kind-hint-how-finely-each-orbit-is = wie fein jede Bahn für die Zeichnung abgetastet wird

js-kind-hint-how-high-the-satellite-climbs = wie hoch der Satellit steigt

js-kind-hint-how-long-the-first-phase = wie lange die erste Phase dauert

js-kind-hint-how-long-the-receiver-integrates = wie lange der Empfänger für eine Entfernung integriert

js-kind-hint-how-many-low-orbit-satellites = wie viele Satelliten im niedrigen Orbit der Geometriedurchlauf hinzufügt

js-kind-hint-how-many-seeded-runs-make = wie viele Läufe mit festem Seed das Ensemble bilden

js-kind-hint-how-many-values-are-run = wie viele Werte durchlaufen werden

js-kind-hint-how-often-a-new-message = wie oft eine neue Nachricht herausgegeben wird

js-kind-hint-how-wide-the-first-jammer = wie breit der erste Störsender seine Leistung verteilt

js-kind-hint-ionosphere-along-the-path-in = Ionosphäre entlang des Pfades, in Einheiten des Gesamtelektronengehalts

js-kind-hint-last-value-of-the-swept = letzter Wert des durchlaufenen Parameters

js-kind-hint-length-of-each-filter-run = Länge jedes Filterlaufs

js-kind-hint-length-of-the-run = Länge des Laufs

js-kind-hint-length-of-the-timeline = Länge der Zeitleiste

js-kind-hint-occupied-bandwidth-of-the-first = belegte Bandbreite des ersten Referenzsignals

js-kind-hint-orbital-planes-of-the-navigation = Bahnebenen der Navigationsrelais

js-kind-hint-power-of-the-first-jammer = Leistung des ersten Störsenders am Empfänger

js-kind-hint-raises-the-noise-floor-under = hebt den Rauschteppich unter jedem Band

js-kind-hint-satellites-in-each-plane = Satelliten in jeder Ebene

js-kind-hint-sets-the-doppler-range-a = legt den Dopplerbereich fest, den eine Kaltsuche abdecken muss

js-kind-hint-signal-in-space-range-error = Signal-in-Space-Entfernungsfehler des ersten Systems

js-kind-hint-signal-in-space-range-error-2 = Signal-in-Space-Entfernungsfehler des zweiten Systems

js-kind-hint-signal-level-the-tracking-figures = Signalpegel, bei dem die Verfolgungswerte angegeben werden

js-kind-hint-spacing-of-the-latitude-and = Abstand des Breiten- und Längenrasters

js-kind-hint-spacing-of-the-shared-mission = Abstand des gemeinsamen Missionszeitrasters

js-kind-hint-the-part-of-the-range = der Teil des Entfernungsfehlers, den die Nachricht nicht beseitigen kann

js-kind-hint-the-value-every-member-runs = der Wert, unter dem jedes Mitglied läuft

js-kind-hint-tilt-of-that-orbit = Neigung dieser Bahn

js-kind-hint-tilt-of-the-first-shell = Neigung der Ebenen der ersten Schale

js-kind-hint-tilt-of-the-relay-planes = Neigung der Relaisebenen

js-kind-hint-timing-error-between-satellites-as = Zeitfehler zwischen Satelliten, als Entfernung

js-kind-hint-when-the-spoofer-captures-the = wann der Spoofer den Empfänger einfängt

js-kind-hint-where-the-receiver-stands = wo der Empfänger steht

js-kind-hint-where-the-user-stands = wo der Nutzer steht

js-kind-label-3-d-error = 3D-Fehler

js-kind-label-3-d-error-time-of = 3D-Fehler, Ankunftszeit

js-kind-label-a-corrupted-frame-is-rejected = ein verfälschter Rahmen wird abgelehnt

js-kind-label-all-channels = alle Kanäle

js-kind-label-availability = Verfügbarkeit

js-kind-label-band = Band

js-kind-label-bodies = Körper

js-kind-label-body = Körper

js-kind-label-both = beide

js-kind-label-case = Fall

js-kind-label-class = Klasse

js-kind-label-code-jitter = Code-Jitter

js-kind-label-constellation = Konstellation

js-kind-label-doppler = Doppler

js-kind-label-event = Ereignis

js-kind-label-evidence = Nachweis

js-kind-label-fewest-in-view = Wenigste in Sicht

js-kind-label-field = Feld

js-kind-label-first-detection-after-onset = Erste Erkennung nach Beginn

js-kind-label-frame-length = Rahmenlänge

js-kind-label-fused = fusioniert

js-kind-label-fused-cap = Fusioniert

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS und LEO

js-kind-label-gnss-channels = GNSS-Kanäle

js-kind-label-gnss-highest-in-sky = GNSS { $id } (am höchsten am Himmel)

js-kind-label-gnss-only = nur GNSS

js-kind-label-gnss-only-cap = Nur GNSS

js-kind-label-gnss-signal = GNSS-Signal

js-kind-label-hdop = HDOP

js-kind-label-highest = Höchster

js-kind-label-horizontal-error = horizontaler Fehler

js-kind-label-horizontal-error-2 = Horizontaler Fehler

js-kind-label-jammer = Störsender

js-kind-label-jump-threshold = Sprungschwelle

js-kind-label-largest-range-jump = Größter Entfernungssprung

js-kind-label-largest-range-jump-against-the = größter Entfernungssprung gegen die Schwelle

js-kind-label-leo = LEO

js-kind-label-leo-channels = LEO-Kanäle

js-kind-label-leo-only = nur LEO

js-kind-label-light-time-from-observer = Lichtlaufzeit von { $observer }

js-kind-label-light-time-from-the-observer = Lichtlaufzeit vom Beobachter

js-kind-label-light-time-one-way = Lichtlaufzeit, einfache Strecke

js-kind-label-lowest = Niedrigster

js-kind-label-lowest-c-n0 = Niedrigstes C/N0

js-kind-label-mean = Mittelwert

js-kind-label-mean-in-view = Mittel in Sicht

js-kind-label-median-convergence = Mediane Konvergenz

js-kind-label-median-pdop = Median-PDOP

js-kind-label-member-runs = Läufe der Mitglieder

js-kind-label-message-switch-iod = Nachrichtenwechsel, Datenausgabe (IOD) { $old } auf { $new }

js-kind-label-mission-length = Missionsdauer

js-kind-label-model = Modell

js-kind-label-monte-carlo-runs = Monte-Carlo-Läufe

js-kind-label-noise-floor = Rauschteppich

js-kind-label-parameters = Parameter

js-kind-label-payload = Nutzlast

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, 95. Perzentil

js-kind-label-peak-elevation = Höchste Elevation

js-kind-label-peak-tracked-c-n0 = Höchstes verfolgtes C/N0

js-kind-label-phase = Phase

js-kind-label-predicted-horizontal-sigma = vorhergesagtes horizontales Sigma

js-kind-label-quantisation-position = Quantisierung, Position

js-kind-label-range-error = Entfernungsfehler

js-kind-label-relays-above-the-mask = Relais über der Maske

js-kind-label-relays-and-earth-link = Relais und Erdverbindung

js-kind-label-relays-only = nur Relais

js-kind-label-satellite = Satellit

js-kind-label-satellites = Satelliten

js-kind-label-satellites-used = Verwendete Satelliten

js-kind-label-signal = Signal

js-kind-label-signal-chip-spacing = { $name } ({ $spacing } Chip-Abstand)

js-kind-label-sisre-after-quantisation = SISRE nach Quantisierung

js-kind-label-sisre-root-mean-square = SISRE, quadratischer Mittelwert

js-kind-label-spoofing-starts = Spoofing beginnt

js-kind-label-standard-deviation = Standardabweichung

js-kind-label-sun-separation = Sonnenabstand

js-kind-label-sweep-runs = Durchlaufläufe

js-kind-label-system = System

js-kind-label-time-above-the-mask = Zeit über der Maske

js-kind-label-time-error-root-mean-square = Zeitfehler, quadratischer Mittelwert

js-kind-label-tracked-component = verfolgte Komponente

js-kind-label-tracking-threshold = Verfolgungsschwelle

js-kind-label-transmit-bandwidth = Sendebandbreite

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Welch-Schätzung der synthetisierten Abtastwerte

js-kind-label-whole-signal = gesamtes Signal

js-kind-label-wideband-j-s-tolerated = Tolerierte Breitband-J/S

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Verfügbarkeit am schlechtesten Standort

js-kind-no = nein

js-kind-note-a-gap-is-an-epoch = Eine Lücke ist eine Epoche mit zu wenigen Relais in Sicht für eine Positionslösung.

js-kind-note-a-helmert-transform-is-the = Eine Helmert-Transformation ist die Verschiebung, Drehung und Maßstabsänderung mit sieben Parametern zwischen zwei Bezugssystemen.

js-kind-note-a-low-earth-orbit-leo = Ein Satellit im niedrigen Erdorbit (LEO) überquert den Himmel in Minuten, daher steigt und fällt sein C/N0 (Träger-zu-Rausch-Leistungsdichteverhältnis) glockenförmig; ein GNSS-Satellit bewegt sich in derselben Zeit kaum.

js-kind-note-a-receiver-independent-exchange-format = Ein Datensatz im Stil des Receiver Independent Exchange Format (RINEX) 4. Die LEO-Datensatztypen sind eine Kshana-Erweiterung, wie der Header sagt.

js-kind-note-a-single-pass-fixes-the = Ein einzelner Überflug bestimmt die Richtung entlang der Bahn weit besser als die quer dazu.

js-kind-note-aos-is-acquisition-of-signal = AOS ist der Signalbeginn (Acquisition of Signal), TCA der Zeitpunkt der größten Annäherung und LOS der Signalverlust (Loss of Signal).

js-kind-note-c-n0-is-the-carrier = C/N0 ist das Träger-zu-Rausch-Leistungsdichteverhältnis. Ein Band unterhalb der Verfolgungsschwelle des Empfängers hat die Synchronisation verloren.

js-kind-note-cells-are-the-code-and = Zellen sind die Code- und Doppler-Klassen, die eine Kaltsuche prüfen muss.

js-kind-note-cold-is-a-first-fix = Kalt ist eine erste Positionslösung ohne Vorwissen; heiß ist eine Positionslösung kurz nach der letzten.

js-kind-note-dilution-of-precision-dop-scales = Die Dilution of Precision (DOP) skaliert einen Entfernungsfehler in einen Positionsfehler: G ist geometrisch, P Position, H horizontal, V vertikal. Perzentile gelten über jeden Rasterpunkt und jede Epoche.

js-kind-note-drawn-at-the-strongest-signal = Gezeichnet beim stärksten Signalpegel des Laufs. Eine Lücke ist ein Abschnitt ohne Satellit in Sicht.

js-kind-note-each-body-carries-its-own = Jeder Körper trägt sein eigenes Nachweisetikett. Die Lichtlaufzeit gilt für die einfache Strecke, vom im Szenario genannten Beobachter aus.

js-kind-note-each-row-is-one-full = Jede Zeile ist ein voller Engine-Lauf des durchlaufenen Szenarios.

js-kind-note-each-rule-is-a-switch = Jede Regel ist ein Wechsel auf eine neuere Nachricht mitten im Überflug.

js-kind-note-each-signal-is-drawn-about = Jedes Signal wird um seine eigene Mittenfrequenz gezeichnet. Eine Lücke ist eine spektrale Nullstelle.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP ist die äquivalente isotrope Strahlungsleistung.

js-kind-note-every-phase-is-an-ordinary = Jede Phase ist ein gewöhnlicher Szenariolauf. Die Hashes kennzeichnen die Eingabe jedes Mitglieds und sein Ergebnisdokument.

js-kind-note-iod-is-the-issue-of = IOD ist die Datenausgabe (Issue of Data): die laufende Nummer der Nachricht.

js-kind-note-j-s-is-the-jammer = J/S ist das Leistungsverhältnis von Störsender zu Signal. Der Verfolgungsanteil ist der Anteil des Laufs, in dem das Band über der Schwelle bleibt.

js-kind-note-p05-p50-and-p95-are = p05, p50 und p95 sind das 5., 50. und 95. Perzentil. ci95 ist das 95-%-Konfidenzintervall des Mittelwerts.

js-kind-note-parameters-are-public-with-a = Parameter sind ÖFFENTLICH (mit Quelle), REPRÄSENTATIV oder WORKSHOP, wie jede Voreinstellung angibt.

js-kind-note-precise-point-positioning-ppp-converges = Die präzise Punktpositionierung (PPP) konvergiert, wenn der Fehler unter dem Kriterium bleibt. NEES ist der normierte quadrierte Schätzfehler, eine Konsistenzprüfung des Filters.

js-kind-note-sisre-defined = SISRE ist der Signal-in-Space-Entfernungsfehler: was die gesendete Nachricht zur Entfernung eines Nutzers hinzufügt. Hier ist es der Darstellungsfehler der Nachricht gegenüber der eigenen Referenzbahn der Engine.

js-kind-note-sisre-is-the-signal-in = SISRE ist der Signal-in-Space-Entfernungsfehler, der für die gesendete Bahn und Uhr jedes Systems angenommen wird.

js-kind-note-ssc-is-the-spectral-separation = SSC ist der spektrale Trennkoeffizient: wie viel von der Leistung eines Signals in den Empfänger des anderen fällt. Ein Strich bedeutet, dass sich die beiden nicht überlappen.

js-kind-note-the-chain-runs-the-signal = Die Kette durchläuft die Stufen Signal, Überflug, Navigationsnachricht, Positionierung und präzise Positionierung der Reihe nach. Jede Zeile ist eine Zahl, die eine Stufe berechnet und die nächste verwendet hat.

js-kind-note-the-doppler-and-pass-geometry = Der Monitor für Doppler und Überflug-Geometrie vergleicht gemessene Entfernungsraten mit den aus den Bahnen vorhergesagten. Die Regel markiert den Beginn des Spoofers.

js-kind-note-the-engine-draws-its-spectrum = Die Engine zeichnet ihr Spektrummodell als In-Phase- und Quadratur-Abtastwerte (IQ) zu einem Zeitpunkt und schätzt daraus das Spektrum zurück. Dieselben Abtastwerte sind der SigMF-Export (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = Der eigene dokumentierte Binärrahmen der Engine, abgeschlossen durch eine zyklische 24-Bit-Redundanzprüfung (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = Die Gabor-Bandbreite (quadratischer Mittelwert) legt fest, wie scharf auf ein Signal Entfernungen gemessen werden können.

js-kind-note-the-largest-jammer-to-signal = Das größte Störer-Signal-Verhältnis (J/S), durch das jedes Signal weiter verfolgt, für einen Dauerstrich- (CW), einen spektral angepassten und einen Breitbandstörsender.

js-kind-note-the-shapiro-delay-is-the = Die Shapiro-Verzögerung ist die zusätzliche Lichtlaufzeit durch die Gravitation der Sonne entlang des Pfades.

js-kind-hint-one-sigma-doppler-measurement-error = Doppler-Messfehler als Ein-Sigma-Wert

js-kind-hint-one-sigma-error-of-a = Ein-Sigma-Fehler einer Entfernung zu einem Relais

js-kind-hint-one-sigma-error-of-the = Ein-Sigma-Fehler der Zweiwege-Entfernung von der Erde

js-kind-note-the-spectrum-kind-and-the = Die Art spectrum und die Art jamming berechnen dieselbe Verbindung auf zwei Wegen; die letzte Spalte ist ihre Differenz.

js-kind-note-time-of-arrival-toa-ranging = Entfernungsmessung über die Ankunftszeit (TOA) auf einem Downlink eines nichtterrestrischen Netzes (NTN): Ein breiteres Signal misst schärfer.

js-kind-note-what-half-a-least-significant = Was ein halbes niedrigstwertiges Bit (LSB) jedes Feldes in Position und in Uhr kostet, als Entfernung.

js-kind-rowhead-block = Block

js-kind-rowhead-condition = Bedingung

js-kind-rowhead-figure = Kennzahl

js-kind-rowhead-member = Mitglied

js-kind-rowhead-metric = Kennzahl

js-kind-rowhead-monitor = Monitor

js-kind-rowhead-phase = Phase

js-kind-rowhead-satellite = Satellit

js-kind-rowhead-signal = Signal

js-kind-rowhead-solution = Lösung

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = nur Doppler

js-kind-sub-from-to = { $from } bis { $to }

js-kind-sub-fused = fusioniert

js-kind-sub-gnss-and-leo-latitude = GNSS und LEO, Breite { $lat }°

js-kind-sub-gnss-only = nur GNSS

js-kind-sub-gnss-only-latitude = nur GNSS, Breite { $lat }°

js-kind-sub-model-fit-seconds = { $model }, { $fit } s Anpassung

js-kind-threshold-4-needed-for-a-fix = 4 nötig für eine Positionslösung

js-kind-threshold-convergence-criterion = Konvergenzkriterium

js-kind-threshold-elevation-mask = Elevationsmaske

js-kind-threshold-gnss-median = GNSS-Median

js-kind-threshold-tracking-threshold = Verfolgungsschwelle

js-kind-title-acquisition = Akquisition

js-kind-title-against-a-simulated-campaign = Gegen eine simulierte Kampagne

js-kind-title-assumptions = Annahmen

js-kind-title-band-trade-at-equal-transmit = Bandvergleich bei gleicher Sendeleistung

js-kind-title-bands = Bänder

js-kind-title-beside-the-published-figures = Neben den veröffentlichten Werten

js-kind-title-beside-the-published-speed-up = Neben der veröffentlichten Beschleunigung

js-kind-title-bodies = Körper

js-kind-title-body = Körper

js-kind-title-by-latitude = Nach Breite

js-kind-title-c-n0-by-band-over = C/N0 je Band über den Lauf

js-kind-title-c-n0-over-the-pass = C/N0 über den Überflug

js-kind-title-cases = Fälle

js-kind-title-central-body = Zentralkörper

js-kind-title-closed-form-doppler-against-finite = Geschlossener Doppler gegen finite Differenzen

js-kind-title-code-tracking-jitter = Code-Tracking-Jitter

js-kind-title-code-tracking-jitter-against-c = Code-Tracking-Jitter gegen C/N0

js-kind-title-combined-over-the-members = Kombiniert über die Mitglieder

js-kind-title-compatibility-with-gnss-signals = Kompatibilität mit GNSS-Signalen

js-kind-title-constellations = Konstellationen

js-kind-title-continuity-across-message-switches = Kontinuität über Nachrichtenwechsel

js-kind-title-cross-check-against-the-jamming = Gegenprüfung mit der Art jamming

js-kind-title-datum-accuracy = Datumsgenauigkeit

js-kind-title-dilution-of-precision-over-the = Dilution of Precision über das gesamte Raster

js-kind-title-doppler = Doppler

js-kind-title-doppler-envelopes = Doppler-Hüllkurven

js-kind-title-doppler-only-fix = Positionslösung allein aus Doppler

js-kind-title-doppler-over-the-pass = Doppler über den Überflug

js-kind-title-doppler-positioning-from-one-pass = Doppler-Positionierung aus einem Überflug

js-kind-title-earth-link = Erdverbindung

js-kind-title-elevation = Elevation

js-kind-title-encoded-frame = Kodierter Rahmen

js-kind-title-epoch = Epoche

js-kind-title-epoch-and-frame = Epoche und Bezugssystem

js-kind-title-events = Ereignisse

js-kind-title-every-node-of-the-sweep = Jeder Knoten des Durchlaufs

js-kind-title-field-table = Feldtabelle

js-kind-title-figures-of-merit = Gütezahlen

js-kind-title-filter-noise = Filterrauschen

js-kind-title-fit-interval-trade = Vergleich der Anpassungsintervalle

js-kind-title-fix-quality-against-observation-window = Qualität der Positionslösung gegen Beobachtungsfenster

js-kind-title-frame-checks = Rahmenprüfungen

js-kind-title-frame-hexadecimal = Rahmen, hexadezimal

js-kind-title-geometry-against-latitude = Geometrie gegen Breite

js-kind-title-geometry-as-leo-satellites-are = Geometrie, wenn LEO-Satelliten hinzukommen

js-kind-title-geometry-position-dilution-of-precision = Geometrie: Positions-Dilution-of-Precision

js-kind-title-global-coverage = Globale Abdeckung

js-kind-title-gnss-leo-and-fused = GNSS, LEO und fusioniert

js-kind-title-gnss-reference = GNSS-Referenz

js-kind-title-hand-offs-between-phases = Übergaben zwischen den Phasen

js-kind-title-helmert-fit = Helmert-Anpassung

js-kind-title-helmert-transform-parameters = Parameter der Helmert-Transformation

js-kind-title-inputs = Eingaben

js-kind-title-ionosphere-free-band-pairs = Ionosphärenfreie Bandpaare

js-kind-title-jammer-tolerance = Störsendertoleranz

js-kind-title-jammers = Störsender

js-kind-title-joint-fix = Gemeinsame Positionslösung

js-kind-title-leo-against-gnss = LEO gegen GNSS

js-kind-title-limitations = Einschränkungen

js-kind-title-links = Verbindungen

js-kind-title-member-runs = Läufe der Mitglieder

js-kind-title-members-under-the-shared-conditions = Mitglieder unter den gemeinsamen Bedingungen

js-kind-title-message = Nachricht

js-kind-title-message-models-compared = Nachrichtenmodelle im Vergleich

js-kind-title-message-switches = Nachrichtenwechsel

js-kind-title-metric-against-axis = { $metric } gegen { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: Verteilung über die Läufe

js-kind-title-mid-pass-update = Aktualisierung mitten im Überflug

js-kind-title-modelled = Modelliert

js-kind-title-monte-carlo = Monte Carlo

js-kind-title-navigation-message-stage = Stufe Navigationsnachricht

js-kind-title-not-modelled = Nicht modelliert

js-kind-title-notes = Anmerkungen

js-kind-title-notes-on-the-spoofing-model = Anmerkungen zum Spoofing-Modell

js-kind-title-observation-windows = Beobachtungsfenster

js-kind-title-one-pass-alone = Ein Überflug allein

js-kind-title-orbit = Umlaufbahn

js-kind-title-over-the-message-sequence = Über die Nachrichtenfolge

js-kind-title-pass = Überflug

js-kind-title-pass-c-n0-of-the = Überflug: C/N0 des gesamten Signals und der verfolgten Komponente

js-kind-title-pass-code-tracking-jitter = Überflug: Code-Tracking-Jitter

js-kind-title-pass-doppler = Überflug: Doppler

js-kind-title-pass-stage = Stufe Überflug

js-kind-title-passes = Überflüge

js-kind-title-phases = Phasen

js-kind-title-position-error-gnss-leo-and = Positionsfehler: GNSS, LEO und die fusionierte Positionslösung

js-kind-title-position-uncertainty-relays-alone-and = Positionsunsicherheit: Relais allein und mit der Erdverbindung

js-kind-title-positioning-by-signal-bandwidth = Positionierung nach Signalbandbreite

js-kind-title-positioning-gnss-alone-against-the = Positionierung: GNSS allein gegen die fusionierte Positionslösung

js-kind-title-power-spectral-density = Spektrale Leistungsdichte

js-kind-title-power-spectral-density-of-each = Spektrale Leistungsdichte jedes Signals

js-kind-title-precise-point-positioning = Präzise Punktpositionierung

js-kind-title-published-comparison = Veröffentlichter Vergleich

js-kind-title-quantisation-budget = Quantisierungsbudget

js-kind-title-range-residuals = Entfernungsresiduen

js-kind-title-ranging-stations = Entfernungsmessstationen

js-kind-title-reading-the-trade = Den Trade-off lesen

js-kind-title-realised-position-error = Realisierter Positionsfehler

js-kind-title-receiver = Empfänger

js-kind-title-receiver-power-budget = Leistungsbudget des Empfängers

js-kind-title-reflector-information = Reflektorinformation

js-kind-title-relay-constellation = Relaiskonstellation

js-kind-title-relays-in-view = Relais in Sicht

js-kind-title-reproducibility = Reproduzierbarkeit

js-kind-title-retroreflectors = Retroreflektoren

js-kind-title-rinex-style-record = Datensatz im RINEX-Stil

js-kind-title-round-trips = Hin-und-zurück-Läufe

js-kind-title-run = Lauf

js-kind-title-satellites-in-view-against-latitude = Satelliten in Sicht gegen Breite

js-kind-title-sensitivity-to-a-line-of = Empfindlichkeit gegenüber einer Neigung der Sichtlinie

js-kind-title-shared-conditions = Gemeinsame Bedingungen

js-kind-title-signal-components = Signalkomponenten

js-kind-title-signal-stage = Stufe Signal

js-kind-title-signals = Signale

js-kind-title-sisre-against-fit-interval = SISRE gegen Anpassungsintervall

js-kind-title-sisre-against-update-period = SISRE gegen Aktualisierungsperiode

js-kind-title-sisre-weights = SISRE-Gewichte

js-kind-title-snapshot = Momentaufnahme

js-kind-title-snapshot-against-the-model = Momentaufnahme gegen das Modell

js-kind-title-snapshot-spectrum-welch-estimate-against = Spektrum der Momentaufnahme: Welch-Schätzung gegen das Modell

js-kind-title-sources = Quellen

js-kind-title-spoofer-and-monitor-settings = Einstellungen von Spoofer und Monitor

js-kind-title-spoofing-monitor-probability-of-detection = Spoofing-Monitor: Detektionswahrscheinlichkeit

js-kind-title-statistics-over-the-runs = Statistik über die Läufe

js-kind-title-sweep = Durchlauf

js-kind-title-systems = Systeme

js-kind-title-systems-in-the-fix = Systeme in der Positionslösung

js-kind-title-the-archived-campaign = Die archivierte Kampagne

js-kind-title-time-error = Zeitfehler

js-kind-title-time-error-by-receiver-clock = Zeitfehler nach Empfängeruhr

js-kind-title-time-scale = Zeitskala

js-kind-title-time-to-first-fix-and = Zeit bis zur ersten Positionslösung und Energie pro Positionslösung

js-kind-title-time-transfer-by-clock-and = Zeitübertragung nach Uhr und Signalpegel

js-kind-title-trade-conditions = Bedingungen des Trade-offs

js-kind-title-update-period-trade = Vergleich der Aktualisierungsperioden

js-kind-title-user = Nutzer

js-kind-title-user-range-error-through-the = Nutzer-Entfernungsfehler über den Überflug

js-kind-title-validated = Validiert

js-kind-title-what-each-stage-hands-to = Was jede Stufe an die nächste weiterreicht

js-kind-title-what-this-run-is-and = Was dieser Lauf ist und was nicht

js-kind-title-when-each-monitor-detects = Wann jeder Monitor erkennt

js-kind-title-work-done = Geleistete Arbeit

js-kind-yes = ja

js-ledger-rows =
    { $n ->
        [one] { $n } Registerzeile
       *[other] { $n } Registerzeilen
    }

js-lib-abbr-apv = Anflug mit vertikaler Führung

js-lib-abbr-araim = erweiterte autonome Integritätsüberwachung im Empfänger

js-lib-abbr-auc = Fläche unter der Kurve

js-lib-abbr-c-n0 = Träger-zu-Rausch-Leistungsdichte

js-lib-abbr-ccsds = Consultative Committee for Space Data Systems

js-lib-abbr-cli = Kommandozeilenschnittstelle

js-lib-abbr-csac = Atomuhr im Chip-Format

js-lib-abbr-cw = Dauerstrich

js-lib-abbr-doi = Digital Object Identifier

js-lib-abbr-dop = Dilution of Precision

js-lib-abbr-eo = Erdbeobachtung

js-lib-abbr-gnss = globales Satellitennavigationssystem

js-lib-abbr-gps = Global Positioning System

js-lib-abbr-hal = horizontale Alarmgrenze

js-lib-abbr-hpl = horizontales Schutzniveau

js-lib-abbr-imu = inertiale Messeinheit

js-lib-abbr-ins = Inertialnavigationssystem

js-lib-abbr-iot = Internet der Dinge

js-lib-abbr-itu-t = Internationale Fernmeldeunion, Sektor Telekommunikationsstandardisierung

js-lib-abbr-j-s = Störer-Signal-Verhältnis

js-lib-abbr-leo = niedriger Erdorbit

js-lib-abbr-llr = Mond-Laserentfernungsmessung

js-lib-abbr-meo = mittlerer Erdorbit

js-lib-abbr-mtie = maximaler Zeitintervallfehler

js-lib-abbr-ntn = nichtterrestrisches Netz

js-lib-abbr-ocxo = ofengesteuerter Quarzoszillator

js-lib-abbr-oem = Orbit Ephemeris Message

js-lib-abbr-omm = Orbit Mean-elements Message

js-lib-abbr-pdop = Positions-Dilution-of-Precision

js-lib-abbr-pnt = Positionierung, Navigation und Zeitgebung

js-lib-abbr-ppp = präzise Punktpositionierung

js-lib-abbr-raim = autonome Integritätsüberwachung im Empfänger

js-lib-abbr-rf = Hochfrequenz

js-lib-abbr-rinex = Receiver Independent Exchange Format

js-lib-abbr-roc = Empfänger-Betriebskennlinie

js-lib-abbr-sbas = satellitengestütztes Ergänzungssystem

js-lib-abbr-sgp4 = Simplified General Perturbations 4, ein Bahnpropagator

js-lib-abbr-sisre = Signal-in-Space-Entfernungsfehler

js-lib-abbr-slam = simultane Lokalisierung und Kartierung

js-lib-abbr-spp = Einzelpunktpositionierung

js-lib-abbr-tdev = Zeitabweichung

js-lib-abbr-tle = Zweizeilen-Elementsatz

js-lib-abbr-toml = das Szenariodateiformat

js-lib-abbr-trn = geländegestützte Navigation

js-lib-abbr-uhf = Ultrahochfrequenz

js-lib-abbr-ukf = Unscented-Kalman-Filter

js-lib-abbr-utc = koordinierte Weltzeit

js-lib-abbr-val = vertikale Alarmgrenze

js-lib-abbr-vlbi = Interferometrie mit sehr langer Basislinie

js-lib-abbr-vpl = vertikales Schutzniveau

js-lib-abbr-wg = Arbeitsgruppe

js-lib-areas-ground-track = Bodenspur

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Verfügbarkeit

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Zeitgebung p95

js-lib-compare-timing-rms = Zeitgebungs-RMS

js-lib-counts-explorer-tally = { $validated } von { $total } Fähigkeiten gegen eine unabhängige externe Referenz validiert · { $modelled } modelliert · { $partner } im Besitz des Partners — hier dargestellt als { $cards } Fähigkeitskarten in { $domains } Bereichen, { $evidence } Nachweisaussagen

js-lib-counts-validated-tally = { $validated } von { $total } Fähigkeiten gegen eine unabhängige externe Referenz validiert — hier dargestellt als { $cards } Fähigkeitskarten und { $evidence } Nachweisaussagen

js-lib-engine-busy = { $verb } …

js-lib-engine-busy-seconds = { $verb } … { $s } s

js-lib-engine-page-http = die Engine-Datei lieferte HTTP { $status }

js-lib-engine-page-not-running = die Engine läuft hier nicht

js-lib-engine-worker-crashed = Engine-Worker abgestürzt

js-lib-evidence-aria = Nachweis: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } Registerzeile
       *[other] { $n } Registerzeilen
    }

js-lib-evidence-rows-behind = Registerzeilen hinter diesem Ergebnis

js-lib-geometry-url-bad-mc = Die Zahl der Monte-Carlo-Stichproben ist keine von { $choices }; es wird { $default } verwendet.

js-lib-geometry-url-bad-number = "{ $key }" ist keine Zahl von { $min } bis { $max }; der Standardwert wird verwendet.

js-lib-geometry-url-bad-site = Der Standort ist nicht Breite,Länge[,Höhe] im gültigen Bereich; der Standardstandort wird verwendet.

js-lib-geometry-url-bad-sky = Die Skyline ist weder eine Voreinstellung noch eine Tabelle mit 360 Klassen noch eine Schlucht im gültigen Bereich; es wird ein offener Horizont verwendet.

js-lib-geometry-url-bad-sys = Die Konstellationsliste ist nicht G, E, C und höchstens ein L:<LEO preset>, den diese Ansicht kennt; die Standardmischung wird verwendet.

js-lib-geometry-url-own-tle = Der Absender hat eigene Bahnelemente (TLE) verwendet, die ein Link nicht enthält; stattdessen werden die Voreinstellungen gezeigt.

js-lib-geometry-url-repeated = "{ $key }" kommt mehr als einmal vor; der erste Wert wird verwendet.

js-lib-geometry-url-too-long = Die Adresse ist länger als { $max } Zeichen, daher wurde keine ihrer Einstellungen gelesen.

js-lib-geometry-url-unreadable = Die Adresse konnte nicht gelesen werden.

js-lib-guided-duration-s-hint = wie lange die Bodenspur propagiert wird

js-lib-guided-duration-s-label = Dauer (s)

js-lib-guided-dut1-s-hint = Erdrotationsversatz; verschiebt die Bodenspur nach Ost/West

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = ein Satellit muss so hoch stehen, um als sichtbar zu zählen

js-lib-guided-mask-deg-label = Elevationsmaske (°)

js-lib-guided-seed-hint = eine andere Rauschziehung derselben Physik

js-lib-guided-seed-label = Zufalls-Seed

js-lib-guided-sigma-uere-m-hint = 1-σ nutzeräquivalenter Entfernungsfehler für die Positionszusammenfassung

js-lib-guided-sigma-uere-m-label = Entfernungsfehler σ (m)
