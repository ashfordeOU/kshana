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
