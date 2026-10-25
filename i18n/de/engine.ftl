# SPDX-License-Identifier: AGPL-3.0-only
# de catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = unbekanntes Uhrenlog-Format { $other }; erwartet wird eines von { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = unbekannte Lückenrichtlinie { $other }; erwartet wird refuse, longest oder linear

engine-e-clock-log-give-either-the-log-text = geben Sie entweder den Logtext oder seinen Pfad an, nicht beides

engine-e-clock-log-clock-log-needs-its-text = ein Uhrenlog benötigt seinen Text oder einen Pfad

engine-e-clock-log-tau0-must-be-finite-and = tau0_s muss endlich und > 0 sein (erhalten: { $t })

engine-e-clock-log-units-and-data-apply-to = units und data gelten nur für das Format timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel gilt nur für das Format ticc

engine-e-clock-log-cannot-read-clock-log = Uhrenlog { $path } kann nicht gelesen werden: { $e }

engine-e-clock-log-clock-log-path-is-not = ein Uhrenlog-Pfad ist im WebAssembly-Build nicht verfügbar; geben Sie das Log als Text an

engine-e-clock-log-the-log-has-missing-epoch = das { $format }-Log hat { $n_missing } fehlende(n) Epoche(n) in { $n_gaps } Lücke(n) auf einem { $tau0 }-s-Raster; setzen Sie gaps = "longest", um den längsten lückenlosen Abschnitt zu behalten, oder gaps = "linear", um zu interpolieren

engine-e-clock-log-the-log-yields-usable-sample = das { $format }-Log liefert { $x } verwendbare(n) Stichprobe(n); mindestens 3 sind erforderlich

engine-e-clock-log-not-rinex-clock-file-no = keine RINEX-Uhrendatei: kein END-OF-HEADER-Satz

engine-e-clock-log-the-rinex-clock-file-has = die RINEX-Uhrendatei enthält keine AS- oder AR-Sätze

engine-e-clock-log-the-rinex-clock-file-holds = die RINEX-Uhrendatei enthält { $many } Uhren; benennen Sie eine mit clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = keine AS- oder AR-Sätze für Uhr { $id }

engine-e-clock-log-the-clock-has-single-epoch = die Uhr hat nur eine Epoche; tau0 kann nicht bestimmt werden

engine-e-clock-log-the-log-has-no-readings = das { $format }-Log enthält keine Messwerte

engine-e-clock-log-unknown-phase-unit-expected-ms = unbekannte Phaseneinheit { $other }; erwartet wird s, ms, us, ns oder ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab-Zeile { $v1 } hat { $v } Spalte(n), die erste Datenzeile hat { $first }

engine-e-clock-log-timelab-line-has-columns-one = TimeLab-Zeile { $v1 } hat { $v } Spalten; gelesen werden eine (Wert) oder zwei (Zeit Wert)

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab-Zeile { $v1 } ist nicht numerisch: { $l }

engine-e-clock-log-the-timelab-log-has-no = das timelab-Log enthält keine Messwerte

engine-e-clock-log-unknown-data-expected-phase-or = unbekannter Wert { $other } für data; erwartet wird phase oder frequency

engine-e-clock-log-tau0-header-is-not-positive = der tau0-Header { $v } ist keine positive Anzahl von Sekunden

engine-e-clock-log-frequency-data-is-fractional-frequency = Frequenzdaten sind relative Frequenzabweichungen; ihre Einheit kann nur 1 sein

engine-e-clock-log-two-column-frequency-logs-are = zweispaltige Frequenzlogs werden nicht gelesen; geben Sie die Frequenz als einzelne Spalte mit tau0 an

engine-e-clock-log-unknown-time-units-expected-or = unbekannte time_units { $o }; erwartet wird s oder mjd

engine-e-clock-log-the-timelab-log-time-column = die Zeitspalte des timelab-Logs muss ansteigen

engine-e-clock-log-single-reading-tau0-cannot-be = nur ein Messwert; tau0 kann nicht bestimmt werden

engine-e-clock-log-the-timelab-log-has-non = das timelab-Log enthält { $non_finite } nicht endliche(n) Messwert(e)

engine-e-clock-log-the-ticc-log-holds-channels = das TICC-Log enthält die Kanäle { $many }; benennen Sie einen mit channel = "..."

engine-e-clock-log-no-readings-on-channel-found = keine Messwerte auf Kanal { $channel } (gefunden: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC-Zeilen im Intervallmodus enthalten keine Zeit; geben Sie tau0_s an (die Ereignisperiode)

engine-e-clock-log-the-readings-do-not-increase = die { $channel }-Messwerte steigen nicht an, sind also keine Zeitstempel (die Ausgabe des TICC-Modus Period wird nicht gelesen; verwenden Sie den Modus Timestamp)

engine-e-clock-log-single-time-stamp-tau0-cannot = nur ein Zeitstempel; tau0 kann nicht bestimmt werden

engine-e-clock-log-two-time-stamps-apart-under = zwei { $channel }-Zeitstempel im Abstand von { $w } s, unter der Hälfte von tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = die { $format }-Zeitstempel von { $clock } laufen rückwärts (ein neu gestarteter Daemon oder ein Uhrensprung); teilen Sie das Log und lesen Sie jeden Teil einzeln

engine-e-clock-log-the-log-has-no-readings-2 = das Log enthält keine { $what }-Messwerte

engine-e-clock-log-the-log-holds-sources-name = das Log enthält { $many } Quellen; benennen Sie eine mit { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = keine { $what }-Messwerte für { $id } (gefunden: { $names })

engine-e-clock-log-the-servo-of-never-reached = der Servo von { $id } hat den gelockten Zustand s2 nie erreicht

engine-e-clock-log-the-log-has-no-chrony = das Log enthält keine chrony-Tracking-Messwerte

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = die Abtastrate { $fs_hz } Hz ist keine ganze Zahl von Abtastwerten pro Millisekunde

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms und noncoherent müssen positiv sein

engine-e-acquisition-the-doppler-grid-needs-positive = das Doppler-Raster benötigt eine positive Schrittweite und ein nicht negatives Maximum

engine-e-acquisition-pfa-must-lie-in = pfa muss in (0, 1) liegen

engine-e-acquisition-samples-supplied-needed = { $samples } Abtastwerte geliefert, { $needed } erforderlich

engine-e-acquisition-empty-doppler-grid = leeres Doppler-Raster

engine-e-acquisition-the-samples-carry-no-power = die Abtastwerte enthalten keine Leistung

## src/adm.rs

engine-e-adm-unknown-attitude-type = unbekannter ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = ein AEM benötigt mindestens ein Segment

engine-e-adm-segment-is-not-version-attitude = Segment { $i }: { $t } ist kein Lagetyp der Version { $version }

engine-e-adm-segment-values-for = Segment { $i }: { $values } Werte für { $t }

engine-e-adm-aem-version-has-no-ndm = AEM Version 1.0 hat hier keine NDM/XML-Form; schreiben Sie KVN

engine-e-adm-this-attitude-type-has-no = dieser Lagetyp hat keine Form der Version 2.0

engine-e-adm-expected-meta-start-found = META_START erwartet, gefunden: { $l }

engine-e-adm-meta-start-without-meta-stop = META_START ohne META_STOP

engine-e-adm-unexpected-metadata-line = unerwartete Metadatenzeile { $other }

engine-e-adm-in-version-aem = { $att } in einem AEM der Version { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = DATA_START nach META_STOP erwartet

engine-e-adm-data-start-without-data-stop = DATA_START ohne DATA_STOP

engine-e-adm-empty-data-line = leere Datenzeile

engine-e-adm-values-on-line = { $vals } Werte in einer { $att }-Zeile: { $b }

engine-e-adm-unexpected-data-line = unerwartete Datenzeile { $other }

engine-e-adm-attitude-type-has-no-xml = der Lagetyp hat keine XML-Form

engine-e-adm-message-without-version-attribute = Nachricht ohne Versionsattribut

engine-e-adm-expected-found = { $vers_key } erwartet, gefunden: { $other }

engine-e-adm-header-without-creation-date-or = Header ohne CREATION_DATE oder ORIGINATOR

engine-e-adm-missing = { $k } fehlt

engine-e-adm-unexpected-keyword = unerwartetes Schlüsselwort { $k }

engine-e-adm-spin-block-holds-nutation-or = ein Spin-Block enthält Nutations- oder Impulsdaten, nicht beides

engine-e-adm-unexpected-apm-keyword = unerwartetes APM-Schlüsselwort { $other }

engine-e-adm-unexpected-apm-line = unerwartete APM-Zeile { $b }

engine-e-adm-without = { $b } ohne { $stop }

engine-e-adm-unexpected-line-in = unerwartete Zeile in { $b }: { $other }

engine-e-adm-incomplete-group = unvollständige Gruppe { $keys }

engine-e-adm-unknown-apm-block-start = unbekannter APM-Block { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM-Metadaten benötigen OBJECT_NAME, OBJECT_ID und TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM ohne EPOCH

engine-e-adm-rotation-axis = Rotationsachse { $o }

engine-e-adm-values-for = { $values } Werte für { $t }

engine-e-adm-euler-record-without-euler-rot = Euler-Satz ohne EULER_ROT_SEQ

engine-e-adm-rotation-sequence = Rotationsfolge { $seq }

engine-e-adm-epoch-has-no = Epoche { $s } enthält kein 'T'

engine-e-adm-epoch-date = Epochendatum { $date }

engine-e-adm-epoch-time = Epochenzeit { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = „{ $s }“ (Text wie im Dokument angegeben)

engine-advanced-report-mean-5th-to-95th-percentile = Mittelwert { $fmt_num } (5. bis 95. Perzentil { $fmt_num2 } bis { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = Feldeinheiten-Schema: units-Eintrag `{ $key }`

engine-advanced-report-field-units-schema-input-entry = Feldeinheiten-Schema: input-Eintrag `{ $key }`, zugeordnet über den Feldnamen

engine-advanced-report-rows-of-non-numeric-column = { $n } Zeilen einer nicht numerischen Spalte

engine-advanced-report-rows-from-to = { $nums } Zeilen, von { $fmt_num } bis { $fmt_num2 }

engine-advanced-report-phase-ended-by = Phase { $name } (beendet durch { $ended })

engine-advanced-report-result-timeline-phases = Ergebnis `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = Übergabe in Phase { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = Ergebnis `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = Szenarioeingabe `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = Kommentar der Szenariodatei, Zeile { $start }

engine-advanced-report-scenario-file-comment-lines-to = Kommentar der Szenariodatei, Zeilen { $start } bis { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } ist MODELLED, nicht gegen eine unabhängige Referenz geprüft: { $it }.

engine-advanced-report-sweep-of-scale = Durchlauf von { $param } ({ $str_of }-Skala)

engine-e-advanced-report-the-result-document-is-not = das Ergebnisdokument ist kein JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = das Szenario ist kein TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Monte-Carlo-Verteilung von { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = beim Build aus der Umgebungsvariable { $GIT_COMMIT_ENV } erfasst

engine-advanced-report-not-recorded-this-engine-was = nicht erfasst: diese Engine wurde ohne die Umgebungsvariable { $GIT_COMMIT_ENV } gebaut; die Engine-Version kennzeichnet das Release

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (der eigene Fingerabdruck des Szenarios durch die Art; nicht der Dateihash)

engine-advanced-report-input-file = Eingabedatei { $path }

engine-advanced-report-study-generated = { " " }Studie erzeugt { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2-Zeile { $v1 }: 8 kommagetrennte Spalten erwartet, gefunden: { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2-Zeile { $v1 }: ungültiger Wert für { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2-Zeile { $v1 }: nicht endlicher Wert

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: keine Datenzeilen

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: { $rows } Zeilen füllen das aufgespannte Gitter von { $n_lat } x { $n_lon } nicht aus

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: doppelter Knoten bei { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = die Gitterschrittweite muss endlich und positiv sein, erhalten: { $step }

engine-e-altpnt-maps-grid-box-must-have-north = die Gitterbox muss Nord > Süd und Ost > West haben, erhalten: [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = ein Gitter von { $n_lat } x { $n_lon } Knoten ist zu groß

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: die Achse { $what } benötigt mindestens 2 verschiedene Werte

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: die Achse { $what } ist nicht regelmäßig ({ $w } bis { $w2 } bei einer mittleren Schrittweite von { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = die Fehler-Sigma muss endlich und nicht negativ sein, erhalten: { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = die Korrelationslänge muss endlich und positiv sein, erhalten: { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side muss >= 2 sein, erhalten: { $n }

engine-e-altpnt-terrain-srtm-hgt-length = Länge der SRTM-.hgt-Datei { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = ein .hgt-Fenster benötigt mindestens 2 x 2 Abtastwerte, erhalten: { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = die Schrittweite muss endlich und positiv sein, erhalten: { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = Länge des { "." }hgt-Fensters { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: unbekannte magnetic_grid-Spalte `{ $other }` (verwenden Sie "sealevel" oder "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: magnetic_grid csv_path { $csv_path } kann nicht gelesen werden: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = unbekanntes Animationsformat '{ $other }'; erwartet wird svg, html, frames oder all

engine-e-animation-no-animation-format-given-expected = kein Animationsformat angegeben; erwartet wird svg, html, frames oder all

engine-e-animation-animation-fps-must-be-between = die Animations-fps muss zwischen 1 und 60 liegen, erhalten: { $fps }

engine-e-animation-animation-duration-must-be-between = die Animationsdauer muss zwischen 0.5 s und 600 s liegen, erhalten: { $duration_s }

engine-e-animation-animation-width-must-be-between = die Animationsbreite muss zwischen 480 und 3840 Pixeln liegen, erhalten: { $width }

engine-e-animation-duration-fps-gives-frames-the = Dauer x fps ergibt { $n } Einzelbilder; die Bildfolge benötigt zwischen 2 und { $v1 }

engine-e-animation-result-is-not-json = das Ergebnis ist kein JSON: { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = Missionszeit ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (benötigt ein ffmpeg mit librsvg; andernfalls rastern Sie die Einzelbilder zuerst)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }{ $omitted } weitere Reihen wurden gefunden, aber nicht gezeichnet (der Player zeigt höchstens { $MAX_CHARTS } Felder mit je { $MAX_TRACES } Verläufen); sie sind im Manifest des frames-Exports aufgeführt.

## src/antenna.rs

engine-antenna-altitude-beamwidth-deg-points = Höhe { $a_lo }-{ $a_hi } m x Halbwertsbreite { $b_lo }-{ $b_hi } deg, { $points } Punkte

engine-antenna-limb-capture-is-reached-on = Limb-Capture wird auf diesem Raster ({ $grid }) erreicht: { $points } von { $points2 } abgetasteten Betriebspunkten erfassen den Limb und { $crossings } Achsenkreuzung(en) wurden lokalisiert; das stärkste abgetastete Limb-J/S beträgt { $limb_js_db } dB bei Höhe { $altitude_m } m / Halbwertsbreite { $hpbw_deg } deg, gegenüber einer Capture-Schwelle von { $thr } dB.

engine-antenna-limb-capture-is-not-reached = Limb-Capture wird auf diesem Raster ({ $grid }) NICHT erreicht - nicht null Capture, sondern kein Limb-Capture: das beste Limb-J/S beträgt { $limb_js_db } dB bei Höhe { $altitude_m } m / Halbwertsbreite { $hpbw_deg } deg, { $shortfall } dB unter der Capture-Schwelle von { $thr } dB; dieser Betriebspunkt würde den Limb bei { $limb_capture_tx_power_dbw } dBW Sendeleistung erfassen, gegenüber den geflogenen { $p_tx_dbw } dBW.

engine-e-antenna-azimuths-must-strictly-increase = die Azimute müssen streng ansteigen

engine-e-antenna-azimuths-must-span-less-than = die Azimute müssen weniger als 360 deg umfassen

engine-e-antenna-off-boresight-angles-must-strictly = die Off-Boresight-Winkel müssen streng ansteigen

engine-e-antenna-gain-grid-does-not-match = das Gewinnraster passt nicht zu den Achsen

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = die Verstärkungen K und P müssen endlich und positiv sein

engine-e-aocs-at-least-three-reaction-wheels = mindestens drei Reaktionsräder sind erforderlich

engine-e-aocs-wheel-spin-axis-must-be = Rad { $i }: die Drehachse muss ein Einheitsvektor sein

engine-e-aocs-wheel-js-and-max-must = Rad { $i }: js und u_max müssen endlich und positiv sein

engine-e-aocs-the-wheel-spin-axes-do = die Raddrehachsen spannen keinen dreidimensionalen Raum auf

engine-e-aocs-inertia-minus-the-wheels-spin = die Trägheit abzüglich der Spinträgheit der Räder muss positiv definit sein

engine-e-aocs-inertia-must-be-finite-and = die Trägheit muss endlich und symmetrisch sein

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis muss ein endlicher Vektor ungleich null sein

engine-e-aocs-kind-must-be-finite-and-positive = { $n } muss endlich und positiv sein

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s darf höchstens 2e6 Schritte ergeben

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s muss ein ganzzahliges Vielfaches von dt_s sein

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 und omega0_rad_s müssen endlich sein

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm muss endlich sein

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s muss endlich sein

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s muss mindestens dt_s betragen

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs: { $n_w } Räder, { $duration_s } s Schwenk von { $series_err } deg -> { $settle } | final { $final_err } deg | Spitze Rad { $peak_speed } rpm | { $v7 }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = unbekannter Dienst '{ $other }' (erwartet wird navigation|nav oder communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = unbekannte Arbitrierungsrichtlinie '{ $other }' (erwartet wird navigation-priority, communications-priority oder first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = ein Kontaktplan benötigt mindestens ein Kontaktfenster

engine-e-aperture-duty-apertures-must-be = apertures muss >= 1 sein

engine-e-aperture-duty-the-reporting-horizon-must-be = der Berichtshorizont muss endlich sein

engine-e-aperture-duty-contact-has-non-finite-aos = Kontakt '{ $name }' hat ein nicht endliches aos_s oder los_s

engine-e-aperture-duty-contact-must-have-los-aos = Kontakt '{ $name }' muss los_s > aos_s haben

engine-e-aperture-duty-contact-plan-needs-at-least-2 = ein Kontaktplan benötigt mindestens ein [[contacts]]-Fenster

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: { $sessions } Sitzung(en) auf { $apertures } Apertur(en) unter { $policy } -> Navigationsauslastung { $navigation_duty }, Kommunikationsauslastung { $communications_duty }, Leerlauf { $idle_duty }; { $total_outage_s } s von { $total_requested_s } s Anforderung durch Konkurrenz verloren (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Studie erzeugt { $html_escape }.

engine-e-api-failed-to-serialise-report-to = Bericht konnte nicht in JSON serialisiert werden: { $e }

engine-e-api-invalid-scenario = ungültiges Szenario: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you = unbekannte Szenarioart { $other } — meinten Sie { $hint }? `kshana kinds` listet alle { $n } eingebauten Arten auf.

engine-api-unknown-scenario-kind-kshana-kinds = unbekannte Szenarioart { $other }. `kshana kinds` listet alle { $n } eingebauten Arten auf.

engine-api-required-fields = - **Pflichtfelder:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Optionale Felder:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML-Parsefehler: { $e }

engine-api-could-not-classify-scenario-kind = Szenarioart konnte nicht bestimmt werden: { $e }

engine-api-missing-required-field = { $kind_name }: fehlende(s) Pflichtfeld(er) — { $options }

engine-api-missing-required-field-2 = { $kind_name }: fehlendes Pflichtfeld "{ $entry }"

engine-e-api-invalid-orbit-scenario = ungültiges Bahnszenario: { $e }

engine-e-api-sp3-export-requires-an-orbit = der SP3-Export erfordert ein Bahnszenario, nicht '{ $k }'

engine-e-api-omm-export-requires-an-orbit = der OMM-Export erfordert ein Bahnszenario, nicht '{ $k }'

engine-e-api-oem-export-requires-an-orbit = der OEM-Export erfordert ein Bahnszenario, nicht '{ $k }'

engine-e-api-invalid-scenario-toml = ungültiges Szenario-TOML: { $e }

engine-e-api-could-not-re-serialise-scenario = das Szenario konnte nicht erneut serialisiert werden: { $e }

engine-api-scenario-jamming-availability-under-jamming = Szenario { $r } | jamming { $v2 } | Verfügbarkeit unter jamming { $availability_under_jamming } (nominal { $availability_nominal }) | min. Tracking { $min_tracking } | mittleres J/S { $v6 }

engine-e-api-the-result-document-already-carries = das Ergebnisdokument enthält bereits `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = figure_tiers konnte nicht serialisiert werden: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = ungültiges { $label }-Szenario: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = Szenario { $r } | Quanten-holdover { $holdover_s }s p95 { $pos_p95_m }m | klassischer holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = Szenario { $r } | spoof { $scn } vs { $threshold_ns } ns Spez. (P_fa { $target_pfa }) | Quanten-Sicherheit { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | klassische Sicherheit { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal = Integrität | { $n_sats } Satelliten | { $samples_available }/{ $samples_total } Epochen verfügbar ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } Integritätsereignisse, { $report3 } HMI

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | Südpol | { $samples_available }/{ $samples_total } Epochen verfügbar ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | säkulare LTC−TT-Rate { $secular_rate_us_per_day } µs/day (Band { $band_low }–{ $band_high }) | Eigenpotenzial { $self_potential_us_per_day } kinetisch { $kinetic_us_per_day } | Offset @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | Basislinie { $baseline_km } km | Beacon-Entfernung { $beacon_range_km } km | Verzögerung { $report } µs (Rate { $delay_rate_s_per_s } s/s) | Nahfeld { $near_field_correction_us } µs | { $samples } Abtastwerte über { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats = lunar-joint-od-clock | { $n_sat } Satelliten, { $n_earth } Erdstationen | 3-D-Stationsfehler mit VLBI { $station_pos_err_m } m vs. nur Entfernung { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× schärfer) | Satellitenposition RMS { $sat_pos_rms_m } m | Stationsuhrfehler { $station_clock_err_s } s | Beob. { $n_obs }/{ $n_params } Parameter

engine-api-builtins-lunar-frame-realisation-points-translation = lunar-frame-realisation | { $n_points } Punkte | Translationsfehler { $trans_err_norm_m } m, Rotationsfehler { $rot_err_norm_rad } rad, Maßstabsfehler { $scale_err_ppb } ppb | RMS-Residuum { $rms_residual_m } m | konvergiert { $converged }

engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } Satelliten ({ $geometry_label }) | { $n_grid_points } Punkte × { $n_epochs } Epochen | Abdeckung { $coverage_pct }% (PDOP<{ $pdop_threshold }) | Satelliten { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL-Verfügbarkeit { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| Ephemeride { $report } ({ $provenance }) σ_URE erforderlich { $fmt } vs. Kepler { $fmt2 } vs. gestört { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | { $n_sats } Satelliten (illustrativ, LCNS-Klasse, nicht verbunden) | Basislinie { $baseline_km } km | Nutzerfehler { $user_error_uncorrected_m } m → { $user_error_corrected_m } m ({ $reduction_factor }× Reduktion) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } Punkte x { $n_epochs } Epochen x { $n_trials } Versuche | Verfügbarkeit { $v4 } % | Abdeckung { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | korrigiert p{ $percentile } 3-D { $f } (unkorrigiert { $f2 }) | HPL max. { $f3 } | MODELLED; keine Aussage über ein reales System

engine-api-builtins-terrain-horizon-at-the-station = { " " }| Geländehorizont ({ $sources }) an der Station max. { $horizon_max_deg } deg, Nutzerpunkte Mittel max. { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame = lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } Zustände, OEM { $oem_line_count } Zeilen | Formatprüfung { $v5 } ({ $present_fields } vorhanden / { $missing_fields } fehlend) | OEM-Round-trip { $v8 } | Zeitmeta-Round-trip { $v9 } | KIF { $kif_bytes } bytes | MODELLED

engine-api-builtins-scenario-optical-sync-rms-ps = Szenario { $r } | optisch sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | Quantenkette { $quantum_chain_sigma_s }s vs. klassisch { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | Sicherheit Pd { $security_pd } (Pfa { $monitor_pfa }) | Anomalie Pd { $anomaly_pd } | Abwägung Quanten-Siege { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | Ausfall { $outage_s }s | Quanten-Positionsfehler { $quantum_pos_err_m } m vs. klassisch { $classical_pos_err_m } m ({ $improvement_x }x) | holdover Quanten { $quantum_holdover_s }s vs. klassisch { $classical_holdover_s }s (Schw. { $threshold_m } m) | Abwägung Quanten-Siege { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC Quanten { $quantum_auc } vs. klassisch { $classical_auc } | minimal detektierbarer Fehler Quanten { $quantum_min_detectable } vs. klassisch { $classical_min_detectable } | { $fault_catalog } Fehlerklassen | Abwägung Quanten-Siege { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] gilt nur für die Art fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = Szenario { $r } | Quanten-PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) Integrität { $integ } Sicherheit { $security_na } | klassischer PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) Integrität { $integ2 } Sicherheit { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = Szenario { $r } | fusioniert | Quanten-PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) Integrität { $integ } Sicherheit { $security_na } | klassischer PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) Integrität { $integ2 } Sicherheit { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = Szenario { $r } | hybrid-ukf (17 Zustände, MODELLED) | Sensor { $v2 } (q_va { $effective_q_va }) | Uhr q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } in [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } in [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | gestützt { $aided_pos_rms_m }m -> Auslaufen { $coast_end_pos_rms_m }m über { $coast_duration_s }s | Selbstkonsistenz, nicht Genauigkeit

engine-api-builtins-scenario-gnss-ins-quantum-outage = Szenario { $r } | gnss-ins | Quanten-Ausfall-RMS fusioniert { $fused_outage_rms_m }m vs. frei { $free_outage_rms_m }m (hold { $holdover_s }s, Verf. { $availability }) | klassisch fusioniert { $fused_outage_rms_m2 }m vs. frei { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, Verf. { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = Szenario { $r } | gnss-sim | mittlere Iono { $mean_iono_m }m Tropo { $mean_tropo_m }m | RAIM-Verf. { $raim_availability } mittleres HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m Fehlerrate { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = Szenario { $r } | spoof-detect | { $n_sats } SVs, +{ $power_advantage_db } dB{ $v4 } | { $push } Push | fusionierter Score { $score } (Schw. { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = Durchlauf { $metric } über { $parameter } ({ $first }..{ $last }, { $points } Pkt., { $scale }-Skala) | Quanten { $first2 }->{ $last2 } | klassisch { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = Szenario { $r } | { $nominal }/{ $series } Abtastwerte GNSS-nominal | bester PDOP { $fnum } Pos. { $posm } | Quanten-holdover { $holdover_s }s p95 { $ns1 }ns Integrität { $integ } Sicherheit { $security_na } | klassischer holdover { $holdover_s2 }s p95 { $ns12 }ns Integrität { $integ2 } Sicherheit { $security_na }

engine-e-api-builtins-ephemeris = Ephemeride: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| max. El { $el }° Doppler-Spitze { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat = Szenario { $r } | { $source } | { $n_samples } Abtastwerte | Höhe { $alt_min_km }–{ $alt_max_km } km | |Breite| ≤ { $r2 }° | Geschwindigkeit { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }

engine-api-builtins-generic-sweep-of-over-nodes = generischer Durchlauf von `{ $kind }` über [{ $keys }] | { $points } Knoten (Form { $shape }) | Metriken [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | freie Inertialdrift { $free_inertial_drift_m } m | schwerefeldgestützt { $map_matched_error_m } m | Abgleich-Sigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| Referenzgrad { $reference_nmax } Anomalie-Std { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| Kartenfehler-MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% innerhalb { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | freie Inertialdrift { $free_inertial_drift_m } m | geländegestützt { $matched_error_m } m ({ $v3 }x Reduktion) | Abgleich-Sigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } Wegpunkte | freie Inertial-RMS { $free_inertial_rms_m } m (final { $free_inertial_final_m } m) | geländegestützte RMS { $matched_rms_m } m (final { $matched_final_m } m, { $v6 }x Reduktion) | mittlere ESS { $mean_ess }/{ $cfg } | Abgleich-Sigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | freie Inertialdrift { $free_inertial_drift_m } m | Schwere { $gravity_only_m } m Magnetik { $magnetic_only_m } m Gelände { $terrain_only_m } m | FUSIONIERT { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] benötigt runs = 1: ein gemessenes Log ist ein Datensatz

engine-api-builtins-scenario-runs-quantum-holdover-p95 = Szenario { $r } | { $runs } Läufe | Quanten-holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns Sicherheit { $security_na } | klassischer holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns Sicherheit { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = Szenario { $r } | Quanten-holdover { $holdover_s }s p95 { $ns1 }ns Integrität { $integ } Sicherheit { $security_na } | klassischer holdover { $holdover_s2 }s p95 { $ns12 }ns Integrität { $integ2 } Sicherheit { $security_na }

engine-api-builtins-raim-available-of-epochs-denied = { " " }| RAIM verfügbar { $n_available } von { $n_epochs } Epochen ({ $n_denied } verweigert, { $n_alarm } Alarme; MODELLED)

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = ein Referenzfall benötigt mindestens einen Satelliten

engine-e-araim-reference-reference-case-needs-at-least-2 = ein Referenzfall benötigt mindestens eine Konstellation

engine-e-araim-reference-satellite-names-constellation-but-only = Satellit { $i } nennt die Konstellation { $constellation }, aber nur { $constellations } sind deklariert

engine-e-araim-reference-satellite-has-non-positive-error = Satellit { $i } hat eine nicht positive Fehlervarianz

engine-e-araim-reference-both-integrity-risk-allocations-must = beide Integritätsrisiko-Zuteilungen müssen positiv sein

engine-e-araim-reference-this-reference-implementation-monitors-single = diese Referenzimplementierung überwacht nur Einzelereignis-Fehlermodi, die Vorannahmen des Falls erfordern jedoch N_fault,max = { $nfm } (gleichzeitige Mehrfachereignis-Teilmengen). Die Ausführung wird verweigert, statt Fehlermodi zu unterzählen.

engine-e-araim-reference-the-all-in-view-geometry = die All-in-View-Geometrie ist singulär

engine-e-araim-reference-no-fault-mode-is-observable = auf dieser Geometrie ist kein Fehlermodus beobachtbar

engine-e-araim-reference-unknown-reference-vector-known-vectors = unbekannter Referenzvektor '{ $vector }'; bekannte Vektoren: { $ids } (oder 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: { $wanted } veröffentlichte(r) WG-C-Referenzvektor(en); schlechteste VPL/HPL-Übereinstimmung { $worst_acceptance } m gegenüber dem eigenen TOL_PL = { $tol } m der Referenz über { $acceptance_checked } Abnahmevektor(en)

engine-e-araim-reference-sat-needs-one-value-per = P_sat benötigt einen Wert je Satellit und P_const einen je Konstellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation = ein Satellit nennt eine nicht deklarierte Konstellation

engine-e-araim-reference-every-prior-must-lie-in = jede Vorannahme muss in [0, 1) liegen

engine-e-araim-reference-the-priors-need-subsets-of = die Vorannahmen erfordern Teilmengen von { $n_fault_max } gleichzeitigen Ereignissen; dieser Pfad zählt höchstens { $most } auf

engine-e-araim-reference-the-all-in-view-solution = die All-in-View-Lösung wurde nicht ausgewählt

engine-e-araim-reference-an-add-v4-case-needs = ein ADD-v4.2-Fall benötigt Satelliten und Konstellationen

engine-e-araim-reference-nom-and-sat-need-one = b_nom und P_sat benötigen einen Wert je Satellit

engine-e-araim-reference-const-needs-one-value-per = P_const benötigt einen Wert je Konstellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = Satellit { $i } nennt eine nicht deklarierte Konstellation

engine-e-araim-reference-one-constellation-index-per-satellite = ein Konstellationsindex je Satellit

engine-e-araim-reference-satellite-names-constellation-with-no = Satellit { $i } nennt die Konstellation { $c } ohne ISM

engine-e-araim-reference-fewer-than-four-satellites-above = weniger als vier Satelliten über der Maske

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m muss mindestens einen Abstand enthalten

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (Band { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | Footprint { $a2 }% Cap, Limb { $footprint_limb_captured } | spoof-capture { $spoof_captured } (Lock { $spoof_lock_time_s } s) | Mastreichweite { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% von 50 bit/s), { $nma_auth_latency_s } s Latenz

engine-attack-surface-reached-crossing-best-db = erreicht ({ $crossings } Kreuzung(en), bester Wert { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = auf diesem Raster NICHT erreicht (bester Wert { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB zu wenig; benötigt { $best_limb_capture_tx_power_dbw } dBW gegenüber { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| Footprint-Durchlauf { $s }x{ $s2 } (Höhe { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), Capture { $v5 }-{ $v6 }% | Limb { $limb }

engine-attack-surface-afs-received-dbw = AFS empfangen: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Defizit: { $deficit_db } dB (Band { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Capture-Footprint: { $a }% der Scheibe, Limb erfasst: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Spoof-Capture-Pull-in: { $spoof_captured } (Lock { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Mastreichweite: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limb: erfasst auf dem { $na }x{ $nb }-Raster, { $crossings } Kreuzung(en)

engine-attack-surface-limb-not-captured-on-grid = Limb: nicht erfasst auf dem { $na }x{ $nb }-Raster; benötigt { $best_limb_capture_tx_power_dbw } dBW (geflogen { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km muss endlich und positiv sein

engine-e-attitude-budget-inertias-must-be-finite-and = die Trägheiten müssen endlich und positiv sein

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 muss >= i_min_kg_m2 sein

engine-e-attitude-budget-at-least-one-pointing-contributor = mindestens ein Ausrichtungsbeitrag ist erforderlich

engine-e-attitude-budget-contributor-sigma-must-be-finite = Sigma des Beitrags '{ $name }' muss endlich und >= 0 sein

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> GG-Moment { $t_gg } N·m; Ausrichtung { $total }" RSS (dominant: { $dominant }) (MODELLED, skalares Budget)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } benötigt einen Wert

engine-bench-cli-unknown-option = unbekannte Option `{ $a }`

engine-bench-cli-unexpected-argument = unerwartetes Argument `{ $pos }`

engine-bench-cli-cannot-read = { $p } kann nicht gelesen werden: { $e }

engine-bench-cli-cannot-create = { $d } kann nicht erstellt werden: { $e }

engine-bench-cli-cannot-write = { $p } kann nicht geschrieben werden: { $e }

engine-bench-cli-unknown-task-or = unbekannte Aufgabe `{ $t }` (a, b, c oder d)

engine-bench-cli-scored-epochs-in-folder = { $labels } bewertete Epochen in { $folders } Ordner(n)

engine-bench-cli-wrote-cases-json-and-truth = { $out }/cases.json und { $out }/truth.json geschrieben

engine-bench-cli-refused-this-commitment-is-provisional = ABGELEHNT: diese Festlegung ist vorläufig und ihr Seed wurde offengelegt; sie ist kein Release-Holdout

engine-bench-cli-mismatch-the-seed-is-not = ABWEICHUNG: der Seed ist nicht der, der zu dieser Festlegung gehört

engine-bench-cli-is-not-json = { $f } ist kein JSON: { $e }

engine-bench-cli-cannot-read-2 = { $i } kann nicht gelesen werden: { $e }

engine-bench-cli-result-rendered = { $results } Ergebnis(se) dargestellt

engine-bench-cli-unknown-subcommand =
    unbekannter Unterbefehl `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = { $path } kann nicht erstellt werden (eine vorhandene Seed-Datei wird nie überschrieben): { $e }

engine-bench-cli-cannot-write-2 = { $path } kann nicht geschrieben werden: { $e }

engine-bench-cli-seed-written-to-keep-it = Seed nach { $path } geschrieben: halten Sie ihn aus der Versionskontrolle und aus jeder Nachricht heraus; nur der Hash unten ist öffentlich

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (übernommen, nicht erneut ausgeführt)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = impairment-eval-Basislinie: { $det }

engine-bench-cli-no-scenario-json-under = keine scenario.json unter { $root }

engine-bench-cli-is-not-json-2 = { $path } ist kein JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } abweichend, { $missing } fehlend, { $unpinned } nicht festgelegt

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = unbekannter Split `{ $other }` (dev, test oder holdout)

engine-bench-score-for-is-not-finite = der Score für `{ $id }` ist nicht endlich

engine-bench-case-have-no-score-the = { $missing } Fall/Fälle ohne Score, der erste ist `{ $first_missing }`

engine-bench-predictions-name-case-that-is = die Vorhersagen nennen einen Fall, der nicht in der Wahrheit enthalten ist: `{ $extra }`

engine-bench-schema-must-be = `schema` muss `{ $RESULT_SCHEMA }` sein

engine-bench-must-be-64-digit-hex = `{ $k }` muss ein 64-stelliger Hex-SHA-256 sein

engine-bench-truth-is-not-json = die Wahrheit ist kein JSON: { $e }

engine-bench-predictions-are-not-json = die Vorhersagen sind kein JSON: { $e }

engine-bench-truth-schema-must-be = `schema` der Wahrheit muss `{ $TRUTH_SCHEMA }` sein

engine-bench-predictions-schema-must-be = `schema` der Vorhersagen muss `{ $PREDICTIONS_SCHEMA }` sein

engine-bench-truth-was-made-under-another = die Wahrheit wurde unter einer anderen Spezifikationsversion als { $SPEC_VERSION } erstellt; Ergebnisse verschiedener Hauptversionen werden nie vermischt

engine-bench-unknown-task = unbekannte Aufgabe `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = Ergebnis { $v1 } ist nicht gültig: { $p }

engine-bench-site-result-is-task-holdout-result = Ergebnis { $v1 } ist ein Holdout-Ergebnis der Aufgabe (d) ohne `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = Ergebnis { $v1 } wurde auf einem vorläufigen, offengelegten Holdout-Seed bewertet: kein Release-Holdout

engine-bench-site-result-was-scored-under-this = Ergebnis { $v1 } wurde unter { $v } bewertet; diese Seite gilt für { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = der Score für `{ $k }` ist keine Zahl

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (0.35 Standard-Monitorstatistik)

engine-bench-tasks-malformed-clock-line = fehlerhafte Uhrenzeile `{ $line }`

engine-bench-tasks-the-clock-file-does-not = die Uhrendatei stimmt nicht mit dem festgelegten SHA-256 überein (erhalten { $got }, erwartet { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = Satellit { $prn } ist nicht in der Uhrendatei enthalten

engine-bench-tasks-kshana-bench-baseline = kshana-bench-Basislinie: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = die Vorhersagen decken { $pmap } Fälle ab, die Wahrheit hat { $tarr }

engine-bench-tasks-case-has-no-number-array = Fall `{ $id }` hat kein Zahlen-Array

engine-bench-tasks-case-needs-values-has = Fall `{ $id }` benötigt { $n } Werte, hat { $a }

engine-bench-tasks-case-has-non-finite-value = Fall `{ $id }` hat einen nicht endlichen Wert

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = { $name } serialisieren: { $e }

engine-e-bin-crossover-study-write = { $path } schreiben: { $e }

engine-bin-crossover-study-error-cannot-create = Fehler: { $dir } kann nicht erstellt werden: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = fertig: Inertial { $nodes } Knoten, Uhr { $curves } Kurven (Seed 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in = { $n } Nutzerepochen x 3 URA-Werte in { $dt } s = { $v1 } ms je Nutzerepoche ({ $ok } lösbar)

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = docs/INTEROP.md geschrieben (Exporttabelle)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = Validierungszusammenfassung nach { $path } geschrieben

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = unbekannter Körper '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigiert um einen anderen Körper als die Erde mit einer Erdverbindung; { $name } wird hier nicht unterstützt

engine-e-body-pnt-duration-and-step-must-be = duration_s und step_s müssen positiv sein, mit höchstens 20000 Epochen; erhalten: { $duration } und { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind muss orbiter oder surface sein; erhalten: '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = die Nutzerhöhe muss positiv und die Exzentrizität in [0, 0.9) sein

engine-e-body-pnt-the-user-orbit-periapsis-is = das Periapsis der Nutzerbahn liegt unter der Oberfläche

engine-e-body-pnt-constellation-needs-to-200-satellites = die Konstellation benötigt 1 bis 200 Satelliten in mindestens einer Ebene

engine-e-body-pnt-constellation-altitude-must-be-positive = die Höhe der Konstellation muss positiv sein

engine-e-body-pnt-range-sigmas-must-be-positive = die Entfernungs-Sigmas müssen positiv sein

engine-e-body-pnt-no-earth-position-relative-to = keine Erdposition relativ zu { $name } bei JD { $jd }

engine-e-body-pnt-serialising-report = Bericht wird serialisiert: { $e }

engine-e-body-pnt-the-report-must-serialise-to = der Bericht muss zu einem JSON-Objekt serialisiert werden

engine-body-pnt-positioning-around-user-relays-at =
    Positionierung um { $name } — { $user_kind }-Nutzer, { $n_relays } Relais bei { $r } km, { $n_epochs } Epochen
    { "  " }Erd-Lichtlaufzeit { $one_way_light_time_s } s einfach, { $two_way_light_time_s } s Hin- und Rückweg; Winkel Sonne-Erde-Körper { $sun_separation_deg } deg
    { "  " }Verfügbarkeit: { $availability_relays } nur Konstellation, { $availability_with_earth } mit der Erdentfernung (Erde in Sicht { $earth_visibility })
    { "  " }mittlerer PDOP { $opt }; RMS-Fehler { $opt2 } nur Konstellation, { $opt3 } mit der Erdentfernung
    { "  " }mittleres formales Sigma { $opt4 } nur Konstellation, { $opt5 } mit der Erdentfernung{ "\u000A" }

engine-body-pnt-positioning-around = Positionierung um { $name }

engine-body-pnt-user-relays-earth-light-time = { $user_kind }-Nutzer · { $n_relays } Relais · Erd-Lichtlaufzeit { $one_way_light_time_s } s · MODELLED

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = das E1-Szenario ist keine Tabelle

engine-e-calibration-ensembles-e1-scenario-has-no-monte = das E1-Szenario hat kein [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } fehlt

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 ist `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 Ensembles zu je 200 Realisierungen, gegenüber der geschlossenen Form: Mittelwert 0, Sigma = { $sigma } ns. Ensemble j verwendet den Basis-Seed 1 000 000 + 1000 j und den Bootstrap-Seed 20260928 + j. Der größte relative ADEV-Fehler betrug { $max } für E2 und { $max2 } für E3 (über 1, 10 und 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = leerer Ergebnispfad

engine-e-campaign-result-path-has-an-empty = der Ergebnispfad `{ $path }` hat ein leeres Segment

engine-e-campaign-result-path-bad-index-in = Ergebnispfad `{ $path }`: ungültiger Index in `{ $part }`

engine-e-campaign-result-path-no-field = Ergebnispfad `{ $path }`: kein Feld `{ $name }`

engine-e-campaign-result-path-indexed-value-is = Ergebnispfad `{ $path }`: der indizierte Wert ist kein Array

engine-e-campaign-result-path-index-out-of = Ergebnispfad `{ $path }`: Index { $i } außerhalb des Bereichs ({ $n })

engine-e-campaign-result-path-value-is-not = Ergebnispfad `{ $path }`: Wert ist weder eine Zahl noch ein Flag

engine-e-campaign-result-path-is-not-an = Ergebnispfad `{ $path }`: `{ $k }` ist kein Array

engine-e-campaign-result-path-must-name-one = Ergebnispfad `{ $path }` muss einen Wert benennen, keine Zeilen

engine-e-campaign-result-path-is-not-an-2 = Ergebnispfad `{ $path }`: `{ $name }` ist kein Array

engine-e-campaign-metric-path-has-no-entry = Metrikpfad `{ $path }` hat keinen Eintrag im Einheitenblock dieser Art; deklarieren Sie seine `unit` in der Kampagne

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` muss aus nicht leeren Buchstaben, Ziffern, `_` oder `-` bestehen

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: eine Kampagne kann keine Kampagne enthalten

engine-e-campaign-serialise = { $label }: Serialisierung: { $e }

engine-e-campaign-result-did-not-parse = { $label }: Ergebnis konnte nicht gelesen werden: { $e }

engine-e-campaign-seed-key-no-field-in = Seed-Schlüssel `{ $key }`: kein Feld `{ $part }` im Szenario

engine-e-campaign-seed-key-is-not-non = Seed-Schlüssel `{ $key }` ist keine nichtnegative ganze Zahl

engine-e-campaign-seed-does-not-fit-toml = Seed { $seed } passt nicht in eine TOML-Ganzzahl

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = Zeitpfad `{ $t }` muss Zeilen mit `[]` benennen

engine-campaign-compare-is-not-below-above = compare `{ $c }` ist weder below, above noch abs_above

engine-campaign-threshold-is-null = Schwellenwert `{ $p }` ist null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` ist weder mean, min, max noch count

engine-campaign-time-path-gives-several-values = Zeitpfad `{ $t }` liefert mehrere Werte pro Zeile

engine-campaign-value-path-has-fewer-rows = Wertpfad `{ $y }` hat weniger Zeilen als `{ $t }`

engine-campaign-value-path-has-rows-time = Wertpfad `{ $y }` hat { $r } Zeilen, Zeitpfad `{ $t }` hat { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = eine Kampagne mit Phasen benötigt eine [timeline] mit step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s muss positiv sein (erhalten: { $step })

engine-e-campaign-phase-is-named-twice = Phase `{ $name }` ist doppelt benannt

engine-e-campaign-phase-duration-must-be-non = Phase `{ $name }`: duration_s darf nicht negativ sein

engine-e-campaign-phase-has-no-runs = Phase `{ $name }` hat keine Läufe

engine-e-campaign-phase-the-first-phase-has = Phase `{ $name }`: die erste Phase hat nichts, was sie übernehmen könnte

engine-e-campaign-phase-handoff-from-channel-which = Phase `{ $name }`: Übergabe aus Kanal `{ $ch }`, mit dem die vorherige Phase nicht endete

engine-e-campaign-phase-handoff-from-run-does = Phase `{ $name }`: Übergabe aus from_run { $from_run } existiert nicht

engine-e-campaign-phase-handoff-is-null = Phase `{ $name }`: Übergabe `{ $from }` ist null

engine-e-campaign-phase-handoff-run-does-not = Phase `{ $name }`: Übergabe-Lauf { $run } existiert nicht

engine-e-campaign-phase = Phase `{ $name }`: { $e }

engine-campaign-phase-run = Phase { $name }/Lauf { $ri }

engine-e-campaign-phase-end-at-run-does = Phase `{ $name }`: end_at_run { $end_at_run } existiert nicht

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s liegt später)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } ist null)

engine-e-campaign-phase-side-is-not-classical = Phase `{ $name }`: Seite `{ $side }` ist weder classical noch quantum

engine-e-campaign-phase-skip-must-be-non = Phase `{ $name }`: skip_s darf nicht negativ sein

engine-e-campaign-phase-alarm-compare-is-not = Phase `{ $name }`: Alarm-compare `{ $compare }` ist weder below, above noch abs_above

engine-e-campaign-phase-alarm-threshold-is-null = Phase `{ $name }`: Alarm-Schwellenwert `{ $p }` ist null

engine-e-campaign-phase-channel-is-in-not = Phase `{ $name }`: Kanal `{ $channel }` ist in { $u }, nicht in { $du }

engine-e-campaign-phase-channel-needs-unit = Phase `{ $name }`: Kanal `{ $channel }` benötigt eine Einheit

engine-e-campaign-phase-two-runs-both-provide = Phase `{ $name }`: zwei Läufe liefern beide den Kanal `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = Phase `{ $name }` übernimmt `{ $ch }`, womit die vorherige Phase nicht endete

engine-e-campaign-phase-carries-but-no-run = Phase `{ $name }` übernimmt `{ $ch }`, aber kein Lauf dieser Phase liefert `{ $ch }`

engine-e-campaign-channel-is-in-in-one = Kanal `{ $name }` ist in einer Phase in { $unit } und in einer anderen in { $unit2 }

engine-e-campaign-at-least-one-metric-is = es wird mindestens eine Metrik benötigt

engine-e-campaign-metric-is-named-twice = Metrik `{ $name }` ist doppelt benannt

engine-e-campaign-seed-overflow-in-the-ensemble = Seed-Überlauf im Ensemble

engine-e-campaign-an-ensemble-needs-at-least = ein Ensemble benötigt mindestens einen Lauf

engine-e-campaign-sweep-takes-one-to-three = ein Sweep nimmt ein bis drei Achsen entgegen (erhalten: { $axes })

engine-e-campaign-axis-is-named-twice = Achse `{ $name }` ist doppelt benannt

engine-e-campaign-axis-needs-at-least-two = Achse `{ $name }` benötigt mindestens zwei Schritte

engine-e-campaign-axis-scale-must-be-lin = Achse `{ $name }`: scale muss lin oder log sein

engine-e-campaign-axis-log-axis-needs-positive = Achse `{ $name }`: eine log-Achse benötigt positive Endwerte

engine-campaign-sweep-node = Sweep-Knoten { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs muss mindestens zwei betragen

engine-e-campaign-compose-needs-at-least-one = compose benötigt mindestens ein Mitglied

engine-e-campaign-shared-value-must-be-number = gemeinsamer Wert `{ $name }` muss eine Zahl oder mehrere Zahlen sein

engine-e-campaign-shared-value-is-named-twice = gemeinsamer Wert `{ $name }` ist doppelt benannt

engine-e-campaign-member-binds-unknown-shared = Mitglied `{ $label }` bindet den unbekannten gemeinsamen Wert `{ $name }`

engine-e-campaign-member = Mitglied `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = Metrik `{ $name }` ist für ein Mitglied in { $u } und für `{ $label }` in { $unit }

engine-e-campaign-member-is-named-twice = Mitglied `{ $label }` ist doppelt benannt

engine-e-campaign-invalid-campaign-scenario = ungültiges Kampagnenszenario: { $e }

engine-e-campaign-invalid-campaign = ungültige Kampagne: { $e }

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } von { $what } über die Realisierungen

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = Wert von { $ch } am Ende der vorherigen Phase, addiert zu { $ch } dieser Phase

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } auf dem Zeitraster: die jüngste Stichprobe des Laufs der zugehörigen Phase zu oder vor jedem Rasterzeitpunkt (Halteglied nullter Ordnung); null, wo kein Lauf dieser Phase sie liefert

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = Werte des Szenarioschlüssels { $key } entlang der Achse { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = Wert des Szenarioschlüssels { $key } an diesem Knoten

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } des Knotenergebnisses

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } jeder Realisierung, in Seed-Reihenfolge

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = gemeinsamer Wert { $name }, in jedes Mitglied geschrieben, das ihn bindet

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = Metrik { $name }, gelesen aus dem Ergebnis des Mitglieds

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = kleinster Wert von { $name } über die Mitglieder

engine-campaign-largest-across-the-members = größter Wert von { $name } über die Mitglieder

engine-campaign-mean-across-the-members = Mittelwert von { $name } über die Mitglieder

engine-e-campaign-failed-to-serialise-campaign-result = Kampagnenergebnis konnte nicht serialisiert werden: { $e }

engine-campaign-chain-phases-over-events-alarm = Kette: { $phases } Phasen über { $duration_s } s, { $events } Ereignisse, Alarm auf { $alarm_s } s des Rasters ausgelöst

engine-campaign-sweep-of-nodes-over = Sweep von `{ $scenario_kind }`: { $nodes } Knoten über [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Monte-Carlo von `{ $scenario_kind }`: { $runs } Seeds

engine-campaign-compose-members = compose: { $members } Mitglieder

engine-campaign-member-runs-modelled = { $runs_total } Mitgliedsläufe (MODELLED)

engine-campaign-sweep-of-over-nodes-each = Sweep von `{ $scenario_kind }` über { $axis_order } ({ $nodes } Knoten{ $v4 }; jede Linie mit eigenem Bereich)

engine-campaign-campaign-modelled-composition-every-value = Kampagne { $r } | MODELLED-Komposition; jeder Wert stammt aus einem echten Lauf der benannten Art

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = eine Optimierung nimmt ein bis drei Parameter entgegen (erhalten: { $params })

engine-e-campaign-optimize-param-is-named-twice = Parameter `{ $name }` ist doppelt benannt

engine-e-campaign-optimize-param-needs-finite-lo-hi = Parameter `{ $name }`: benötigt endliche Werte mit lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = Parameter `{ $name }`: scale muss lin oder log sein

engine-e-campaign-optimize-param-log-param-needs-positive = Parameter `{ $name }`: ein log-Parameter benötigt positive Grenzen

engine-e-campaign-optimize-param-start-must-lie-in = Parameter `{ $name }`: start muss in [lo, hi] liegen

engine-e-campaign-optimize-param-grid-needs-steps-of = Parameter `{ $name }`: ein Gitter benötigt mindestens zwei Schritte

engine-e-campaign-optimize-objective-target-is-only-read = objective.target wird nur mit goal = "target" gelesen

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" benötigt ein endliches objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal muss minimize, maximize oder target sein (erhalten: `{ $other }`)

engine-e-campaign-optimize-grid-of-nodes-is-above = ein Gitter aus { $total } Knoten liegt über der Grenze von 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps wird nur mit method = "grid" gelesen

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals muss den anfänglichen Simplex abdecken (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step muss in (0, 1] liegen

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol und xtol dürfen nicht negativ sein

engine-e-campaign-optimize-method-must-be-grid-or = method muss grid oder nelder-mead sein (erhalten: `{ $other }`)

engine-campaign-optimize-optimize-eval = optimize-Auswertung { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = untere Grenze des Szenarioschlüssels { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = obere Grenze des Szenarioschlüssels { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = Wert des Szenarioschlüssels { $key } bei der besten Auswertung

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = Wert des Szenarioschlüssels { $key } bei dieser Auswertung

engine-campaign-optimize-target-value-of = Zielwert von { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } bei der besten Auswertung

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } dieser Auswertung (der Seed-Mittelwert, wenn runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) von `{ $scenario_kind }` mit { $method }: { $evals } Auswertungen ({ $stop_reason }), bestes { $o2 } bei [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START vor dem Header CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: fehlerhafte Header-Zeile: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: fehlerhafte Metadatenzeile: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: fehlerhafte Datenzeile: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: unbekanntes Datenschlüsselwort { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: Datenzeile { $k } ohne Epoche

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: Datenzeile { $k } ohne Wert

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: Datenzeile { $k } mit ungültigem Wert { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: nicht abgeschlossenes Segment (META_STOP/DATA_STOP fehlt)

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: ungültiger TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: ungültiger TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = unbekannte Observable `{ $other }`: erwartet wird eine von range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = unbekannte Koordinaten `{ $other }`: erwartet wird eine von cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours muss endlich und positiv sein (erhalten: { $arc_hours })

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs muss ≥ 2 sein (erhalten: { $epochs })

engine-e-cislunar-arc-recovery-steps-must-be = steps muss ≥ 1 sein

engine-e-cislunar-arc-recovery-trials-must-be = trials muss ≥ 1 sein

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations muss ≥ 1 sein

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd muss endlich und positiv sein (erhalten: { $displacement_nd })

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor muss endlich und positiv sein (erhalten: { $recovery_factor })

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km muss endlich und positiv sein (erhalten: { $error_bound_km })

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m muss endlich und positiv sein (erhalten: { $sigma_range_m })

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s muss endlich und positiv sein (erhalten: { $sigma_range_rate_mm_s })

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = die Konstellation muss mindestens einen Chief und eine Referenz enthalten

engine-e-cislunar-arc-recovery-family-is-an-out-of = die Familie `{ $family }` ist eine Familie außerhalb der Ebene und hat keine ebene Vierzustandsdarstellung: setzen Sie spatial = true, um sie zu durchlaufen

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = das Vorwärtsmodell hat eine nicht endliche Wahrheitsmessung erzeugt

engine-cislunar-arc-recovery-first-arc-length-at-which = erste Bogenlänge, bei der die rauschfreie Batch-Lösung JEDES gesetzten Versuchs den Endzustandsfehler auf höchstens das { $recovery_factor }-Fache der a-priori-Verschiebung senkt, von der sie ausging. Dies ist das Wiedergewinnungs-Analogon des Rangkriteriums: Bei exakten Messungen wird aus der Frage `is the state observable?` die Frage `can an estimator get it back?`, und keine Toleranz für Singulärwerte geht in die Antwort ein.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = erste Bogenlänge, bei der der Monte-Carlo-RMS-Positionswiedergewinnungsfehler über { $trials } gesetzte Rauschrealisierungen auf { $error_bound_km } km oder darunter fällt. Dies ist das Wiedergewinnungs-Analogon des Schätzbarkeitskriteriums, gemessen statt vorhergesagt: Der Fehler ist der Abstand der Schätzung zur bekannten Wahrheit, nicht die Spur einer formalen Kovarianz.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED innerhalb eines Epochenraster-Schritts: Der Schätzer gewinnt ab { $e } h zurück, das Gramian-Rangkriterium schlägt bei { $g } h um (Verhältnis { $v1 }, Raster { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED als Wiedergewinnbarkeitsgrenze: Der Schätzer gewinnt ab { $e } h zurück, { $v1 } den { $g } h des Gramian-Rangkriteriums (Verhältnis { $v2 }, Raster { $grid_hours } h). Das Rangkriterium ist eine relative Singulärwert-Konvention; die Wiedergewinnungsgrenze ist ein gemessener Zustandsfehler, und beide fallen hier nicht zusammen.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: Der Schätzer erreicht auf diesem Bogen nie seine Wiedergewinnungsgrenze, während das Gramian-Rangkriterium bei { $g } h umschlägt.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = das Gramian-Rangkriterium wird auf diesem Bogen nie erreicht (die Geometrie erreicht nie vollen Rang), während der Schätzer ab { $e } h zurückgewinnt — beide widersprechen sich darin, ob überhaupt eine Grenze existiert.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | Familie { $family }, { $state_dim }-Zustand, { $n_spacecraft } s/c, Observable { $observable }, Parametrisierung { $coordinates } | Bogen von { $arc_hours } h, { $epochs } Epochen (Raster { $grid_hours } h), { $trials } Versuche, Seed { $seed } | partielle Ableitungen per finiter Differenz, keine analytische Jacobi-Matrix / STM / SVD / SRIF | rauschfreie Wiedergewinnung ab { $nf } (Faktor { $recovery_factor }) gegenüber Gramian-Rangschwelle { $gram } | Monte-Carlo-Schätzbarkeit ab { $est } (RMS Pos ≤ { $error_bound_km } km, σ { $sigma_range_m } m) gegenüber Gramian-Schätzbarkeit { $gram_est } | RMS Pos am Bogenende { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = unbekannte Familie `{ $other }`: erwartet wird eine von dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO bei Kreuzungsabstand { $d } konvergierte nicht in der Differentialkorrektur

engine-e-cislunar-observability-member-at-x0-did-not = { $label }-Mitglied { $i } bei x0 = { $x0 } konvergierte nicht in der Differentialkorrektur

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft muss zwischen 2 und { $MAX_SPACECRAFT } liegen (erhalten: { $n })

engine-e-cislunar-observability-epochs-must-be-got = epochs muss ≥ 2 sein (erhalten: { $n_epochs })

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol muss endlich und positiv sein (erhalten: { $rel_tol })

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m muss endlich und nichtnegativ sein (erhalten: { $sigma_range_m })

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km muss endlich und positiv sein (erhalten: { $sigma_pos_threshold_km })

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } s/c ({ $refs } Referenzen) | Bogen von { $arc_hours } h, { $rank_arc } Epochen | Rang { $first } → { $last } von { $state_dim } über den Bogen | Gramian-λ [{ $min_eigenvalue }…{ $max_eigenvalue }] Kond. { $condition_str } | momentaner Rang nur Entfernung { $rank_range_only } → Entfernung+Rate { $rank_range_rate } ({ $n_links } Verbindungen) | GDOP nur Entfernung { $ro } Entfernung+Rate { $rr } | DRO-Anfangsbedingungen (maximales Periodizitätsresiduum { $max_resid }) | SRIF-Posterior endlich bei Epoche { $srif_epoch } mit Rang 4 (gegen unabhängige Referenz geprüft: Rang/STM/DRO-Schließung/SRIF, aus einem Modell berechnet: Entwurf)

engine-cislunar-observability-never-rank-of = nie (Rang { $rank } von { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | Familie { $family }, { $state_dim }-Zustand, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | Rangschwelle { $rank_thr } (Raster { $c } h) | Schätzbarkeitsschwelle (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = erste Bogenlänge, bei der die formale 1σ-Positionsunsicherheit des ANFANGSZUSTANDS des Chief, σ_pos = sqrt(trace(P_rr)) mit P = (ÕᵀÕ)⁻¹ und Õ die um das Messrauschen weißgefilterte Beobachtbarkeitsmatrix, auf { $sigma_pos_threshold_km } km oder darunter fällt. Dies ist das Kriterium, unter dem eine Bogenlängenschwelle überhaupt rauschabhängig ist: P skaliert mit σ², also skaliert σ_pos mit σ, während sich das obige Rangkriterium nicht mit σ verschiebt. Die Grenze ist eine ANGEGEBENE technische Wahl, keine angepasste — estimability_sweep meldet die Schwelle bei vier weiteren Grenzen.

engine-cislunar-observability-extension-r3-this-run-is = ERWEITERUNG (R3) — dieser Lauf ist NICHT die ebene DRO-Konfiguration, die das obige `label` beschreibt. Zustandsdimension { $state_dim }; Bahnfamilie { $family }; { $n_spacecraft } Raumfahrzeuge; Entfernungsmessung Sigma { $sigma_range_m } m. Wo `label` „planar" und „planar DROs" sagt, ist die hier benannte Familie zu lesen. VALIDATED-Ergänzungen: Die variationelle 6x6-STM ist dieselbe durch finite Differenzen validierte CR3BP-STM (crate::cr3bp), die in voller Breite verwendet wird; die räumlichen Jacobi-Zeilen für Entfernung / Entfernungsrate sind durch finite Differenzen validierte analytische partielle Ableitungen, wobei die Entfernungsraten-Zeile Komponente für Komponente gegen die unabhängige 3-D-Funktion deepspace_od::range_rate_observable des Crates gegengeprüft wurde; die Anfangsbedingungen für Halo / NRHO sind differentialkorrigierte periodische Bahnen desselben Korrektors, der den veröffentlichten südlichen L2-9:2-NRHO reproduziert, fortgesetzt von diesem veröffentlichten Startwert, und das Schließungsresiduum jedes Mitglieds wird gemeldet; die RANG-Urteile für sechs Zustände werden gegen einen UNABHÄNGIGEN Zeilenstufen-Rang (Gauß-Elimination mit partieller Pivotisierung) bestätigt, der keinen Code mit dem Eigenwert-/SVD-Weg teilt. EHRLICHER GELTUNGSBEREICH DES SRIF-ZWEIGS: Die obige SRIF-Kreuzvalidierung verwendet dieselben Mess-Jacobi-Matrizen und reduziert sich auf dasselbe O^T O; ihre Übereinstimmung ist daher eine Konsistenzprüfung zwischen zwei numerischen Maschinen, KEINE unabhängige Bekräftigung der Schwelle — sie wird nicht als Validierung irgendeiner Größe hier gezählt. MODELLED: der Familienentwurf (welche Abszissen, Amplituden und Phasen), das Epochenraster, der Einzelverbindungsbogen und die angegebene Positionsgrenze des Schätzbarkeitskriteriums.

engine-cislunar-observability-validated-each-constellation-initial-condition = Gegen unabhängige Referenz geprüft: Jede Anfangsbedingung der Konstellation ist eine differentialkorrigierte periodische Bahn der Familie { $family }, die sich über eine Periode bis auf das gemeldete Periodizitätsresiduum schließt (ebene DROs sind zusätzlich retrograd um den Mond). Die Familie wird beim Erde-Mond-Massenverhältnis korrigiert. Aus einem Modell berechnet: die Wahl der Familienparameter und Phasen (der Konstellationsentwurf). Der Schlüsselname `dro_provenance` bleibt für das veröffentlichte Dokumentschema erhalten; er trägt die Familie, die dieser Lauf angefordert hat.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } muss endlich und positiv sein (erhalten: { $v })

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } muss in (0, 1) liegen (erhalten: { $v })

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg muss in [0, 90) liegen

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems muss mindestens eine Voreinstellung benennen

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias benötigt endliche Werte für bias_m, t0_s und t1_s

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch = integrity: { $n } Epochen überschreiten die Obergrenze von { $MAX_EPOCHS } Epochen; erhöhen Sie step_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: keine Datensätze

engine-e-clock-library-card-records-at-different-tau0 = { $name }: Datensätze mit unterschiedlichem tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: periodische Kleinste-Quadrate-Anpassung fehlgeschlagen

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: { $used } Stabilitätspunkte mit edf >= { $MIN_FIT_EDF }; eine Karte benötigt drei

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = Lücken { $g }, Phasenausreißer { $o }, Phasensprünge { $p }, Bursts { $b }, Frequenzsprünge { $f } (robustes sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` ist keine nichtnegative ganze Zahl

engine-e-compliance-is-missing = `{ $p }` fehlt

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } überschreitet events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } überschreitet predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: Zählwerte von receiver-trust fehlerhaft ({ $malformed_counts }); ausgeschlossen

engine-e-compliance-not-json = { $label }: kein JSON: { $e }

engine-compliance-cannot-read = { $label }: kann nicht gelesen werden: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: das benachbarte Szenario nennt die Art `{ $s }`, das Ergebnis aber `{ $o }`; nicht verwendet

engine-e-compliance-scenario-kind-not-found-no = { $label }: Szenarioart nicht gefunden (keine benachbarte Szenariodatei, kein receiver-trust-Ergebnis, kein `kind` auf oberster Ebene)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` ist keine Szenarioart, die die Engine kennt; nicht verwendet

engine-compliance-written-by-kshana = Geschrieben von kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } Test(s), bei denen jeder angegebene Zielwert erreicht wurde, { $not_met } mit einem verfehlten Zielwert, { $needs_input } mit Eingabebedarf.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = das Intensitätsraster muss endliche Werte mit min < max haben (erhalten: [{ $min }, { $max }])

engine-e-conflict-resilience-intensity-grid-needs-steps-got = das Intensitätsraster benötigt >= 2 Schritte (erhalten: { $steps })

engine-e-conflict-resilience-correlation-grid-must-have-at = das Korrelationsraster muss mindestens einen Wert haben

engine-e-conflict-resilience-correlation-values-must-lie-in = Korrelationswerte müssen in [0, 1] liegen (erhalten: { $r })

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience benötigt mindestens eine Schicht

engine-e-conflict-resilience-layer-availability-not-in = Schicht { $i } Verfügbarkeit { $availability } nicht in [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = Schicht { $i } sigma_m muss endlich und positiv sein

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = Schicht { $i } vulnerability muss endlich und >= 0 sein

engine-e-conflict-resilience-layer-vector-weight-must-be = Schicht { $i } vector_weight muss endlich und >= 0 sein

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } außerhalb des Bereichs (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials muss >= 1 sein

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } Schichten ({ $primary } Basislinie) | Referenzintensität { $reference_intensity } | Resilienzverhältnis geschlossene Form { $ratio_closed_form }x MC { $ratio_mc_independent }x (geschichtet gegenüber einschichtig) | Korrelation hebt die Schichtung auf: Verhältnis { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | Prior-KI [{ $ratio_lo }-{ $ratio_hi }]x | Überleben je Vektor @ Ref. jam { $surv }% spoof { $surv2 }% kinetic { $surv3 }% cyber { $surv4 }% (schärfster { $sharpest }) | ~7x Kernaussage MODELLED, VALIDATED MC->geschlossene Form / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = unbekannter Zentralkörper { $name }: erwartet wird ein Planet, Pluto, der Mond oder ein großer Mond (earth, moon, mars, europa, titan, ...; siehe crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = eine Walker-Schale benötigt total > 0 und planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walker-total { $total } ist kein Vielfaches von planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = Walker-Phasierung F = { $phasing } muss in 0..planes (= { $planes }) liegen

engine-e-constellation-is-not-an-expandable-gps = { $name } ist kein erweiterbarer GPS-Slot (SPS PS Table 3.2-2 listet B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: geben Sie altitude_km oder semi_major_axis_km an, nicht beides

engine-e-constellation-needs-altitude-km-or-semi = { $what }: benötigt altitude_km oder semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: große Halbachse { $v1 } km liegt nicht über dem Radius von { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: Exzentrizität { $e } muss in [0, 0.9) liegen

engine-e-constellation-perigee-is-below-the-surface = { $what }: Perigäum liegt unter der Oberfläche von { $name }

engine-e-constellation-constellation-preset-is-an-earth = Konstellation { $name }: Voreinstellung { $p } ist eine Erdkonstellation, der Körper ist { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = Konstellation { $name }: unbekannte Voreinstellung { $other } (erwartet wird gps-baseline, gps-expandable, galileo, beidou, beidou-meo oder glonass)

engine-e-constellation-constellation-expanded-applies-only-to = Konstellation { $name }: `expanded` gilt nur für die Voreinstellung gps-expandable

engine-constellation-constellation-shell = Konstellation { $name } Schale { $v2 }

engine-constellation-explicit-element-sets = { $satellite } explizite Elementsätze

engine-constellation-constellation-satellite = Konstellation { $name } Satellit { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = Konstellation { $name } hat keine Satelliten: geben Sie eine Voreinstellung, eine [[constellation.shell]] oder eine [[constellation.satellite]] an

engine-e-constellation-no-constellation-given = keine Konstellation angegeben

engine-e-constellation-constellations-with-one-clock-each = { $constellations } Konstellationen mit je einer Uhr überschreiten die Grenze von { $MAX_CLOCKS } Uhren; verwenden Sie clock = "common" oder führen Sie Konstellationen zusammen

engine-e-constellation-must-be-finite = { $what } muss endlich sein

engine-e-constellation-need-step-and-duration-step = step_s > 0 und duration_s >= step_s erforderlich

engine-e-constellation-more-than-100-000-epochs = mehr als 100 000 Epochen; erhöhen Sie step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg muss in [0, 90) liegen

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold muss positiv sein

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg muss in [0.25, 90] liegen

engine-e-constellation-need-90-lat-min-deg = -90 <= lat_min_deg < lat_max_deg <= 90 erforderlich

engine-e-constellation-need-lon-min-deg-lon = lon_min_deg < lon_max_deg erforderlich, höchstens 360 deg überspannend

engine-e-constellation-give-at-least-one-constellation = geben Sie mindestens eine [[constellation]] an

engine-e-constellation-track-points-is-capped-at = track_points ist auf 2000 begrenzt

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } Satelliten überschreiten die Grenze von 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: { $total } Satelliten ({ $names }) um { $name }; Verfügbarkeit { $global_availability_pct }% (PDOP <= { $pdop_threshold } bei { $mask_deg } deg Maske), schlechtester Standort { $worst_site_availability_pct }%, medianer PDOP { $cov }, im Mittel { $global_mean_visible } sichtbar; { $grid_points } Rasterpunkte x { $epochs } Epochen (MODELLED)

engine-constellation-constellation-coverage-over-the = Konstellationsabdeckung über { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } muss endlich und positiv sein

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } muss endlich und >= 0 sein

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw muss endlich sein

engine-e-contact-schedule-satellite-altitude-km-must-be = Satellit '{ $name }': altitude_km muss in (100, 40000) liegen

engine-e-contact-schedule-satellite-inclination-deg-must-be = Satellit '{ $name }': inclination_deg muss in [0, 180] liegen

engine-e-contact-schedule-satellite-backlog-mbit-must-be = Satellit '{ $name }': backlog_mbit muss >= 0 sein

engine-e-contact-schedule-satellite-priority-must-be = Satellit '{ $name }': priority muss > 0 sein

engine-e-contact-schedule-satellite-eirp-dbw-must-be = Satellit '{ $name }': eirp_dbw muss endlich sein

engine-e-contact-schedule-station-lat-deg-in-90 = Station '{ $name }': lat_deg in [-90, 90], lon_deg endlich

engine-e-contact-schedule-station-mask-deg-must-be = Station '{ $name }': mask_deg muss in [0, 90) liegen

engine-e-contact-schedule-station-alt-must-be-in = Station '{ $name }': alt_m muss in [0, 3000] liegen (Bereich nach ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = Station '{ $name }': setup_s >= 0 und g_over_t_db endlich

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours muss in (0, 168] liegen

engine-e-contact-schedule-step-must-be-in-300 = step_s muss in (0, 300] liegen

engine-e-contact-schedule-at-least-one-satellite-and = mindestens ein Satellit und eine Station sind erforderlich

engine-e-contact-schedule-at-most-32-satellites-and = höchstens 32 Satelliten und 32 Stationen

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: { $satellites } Satelliten x { $stations } Stationen über { $duration_hours } h -> { $cands } Kandidatenkontakte, { $greedy } eingeplant; { $total_del } von { $total_backlog } Mbit ausgeliefert{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: { $pairs } Überflug/Überflüge; ACM { $acm } Mbit gegenüber CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = mindestens 2 Versuche und ein endliches sigma_m > 0 erforderlich

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total muss in (0, 1) liegen

engine-e-dop-error-ci-no-local-frame-at-the = kein lokales Bezugssystem am Nutzer

engine-e-dop-error-ci-singular-geometry = { $name }: singuläre Geometrie

engine-e-dop-error-ci-no-noise-free-fix = { $name }: keine rauschfreie Lösung

engine-e-dop-error-ci-no-fix = { $name }: keine Lösung

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singuläre Geometrie

engine-e-dop-error-mc-no-fix = { $label }: keine Lösung

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km muss positiv sein; erhalten { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes und sats_per_plane müssen beide ungleich null sein

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz muss positiv sein; erhalten { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency muss in (0, 1] liegen; erhalten { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k muss positiv sein; erhalten { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db muss nichtnegativ sein; erhalten { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m muss außerhalb der Erde liegen; erhalten { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance = Erde-GNSS in Mondentfernung — { $n_satellites } Satelliten, Empfänger bei { $r } km{ "\u000A" }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Erdrand von der Konstellation aus: { $earth_limb_half_angle_deg } deg vom Nadir — jeder mondwärts gerichtete Strahl muss dies überschreiten{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_geometrically_visible } von { $n_satellites } nicht verdeckt; { $n_trackable } überschreiten die Nachführschwelle von { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }beste Verbindung { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }jede nachführbare Sichtlinie liegt innerhalb eines Halbkegels von { $a } deg — die Geometrie ist nahezu entartet{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }SWEEP über { $epochs } Epochen / { $span_s } s: Signalverfügbarkeit { $signal_availability }, FIX-Verfügbarkeit { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }nachführbare Verbindungen Mittel { $mean_trackable }, Max. { $max_trackable }; bestes C/N0 { $w }; bester PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = es sind ein bis sechs Stufen erforderlich

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg muss endlich und nichtnegativ sein

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 muss endlich und nichtnegativ sein

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg muss endlich und nichtnegativ sein

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m muss endlich und nichtnegativ sein

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg muss in [0, 45) liegen

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s muss endlich und nichtnegativ sein

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = das Schub-Gewichts-Verhältnis beim Abheben { $tw } muss 1 überschreiten

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ideales dv { $ideal_dv_m_s } m/s, Verluste { $losses } m/s (Gravitation { $gravity_loss_m_s }, Luftwiderstand { $drag_loss_m_s }, Lenkung { $steering_loss_m_s }, Gegendruck { $back_pressure_loss_m_s }); Brennschluss { $r } km bei { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } muss endlich und positiv sein

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body muss "earth" oder "mars" sein (erhalten: "{ $other }")

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = Atmosphäre "{ $a }" ist für den Körper "{ $b }" nicht verfügbar (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg muss in (0, 90) liegen (positiv nach unten)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m muss in [20 km, 1000 km] liegen

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg muss endlich sein mit |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg und longitude_deg müssen endlich sein

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag muss in [0, 3] liegen

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg muss endlich sein

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s muss in (0, 1] s liegen

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m muss in [0, entry_interface_altitude_m) liegen

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s muss in (0, 20000] s liegen

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame muss inertial|relative sein (erhalten: "{ $o }")

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> Spitze { $pk_g } g bei { $r } km, Spitzen-q { $r2 } W/cm² bei { $r3 } km, Wärmelast { $r4 } J/cm², Spitzen-q_dyn { $r5 } kPa; { $outcome } bei { $end_time_s } s (geschlossene Form { $cf_g } g; MODELLED 3-DoF, keine Strahlung/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } muss in (0, 1] liegen

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } muss endlich und nichtnegativ sein

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg muss in [0, 90) liegen

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits muss in 1..=24 liegen

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (Füllung { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = Nadirwinkel { $eta_rad }° überschreitet den scheinbaren Erdradius { $rho }° (verfehlt die Erde)

engine-e-eo-payload-no-sun-synchronous-inclination-at = keine sonnensynchrone Inklination bei { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg muss in (0, 90) liegen

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad muss endlich und positiv sein

engine-e-eo-payload-half-fov-too-large = half_fov zu groß: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> { $v3 } km Streifenbreite, { $gsd } m GSD im Nadir, Zugriff bis { $v5 } km außerhalb des Nadirs; Knotenabstand { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Erde-Mond-Baryzentrum aus { $table }, aufgeteilt durch die Mondreihe von Montenbruck & Gill, präzediert nach J2000

engine-ephem-provider-jpl-mean-elements-in-the = mittlere JPL-Elemente in der Laplace-Ebene, Rate der mittleren Länge aus der synchronen Rotationsrate der IAU, zu seinem Planeten aus { $table } addiert

engine-ephem-provider-iau-synchronous-rotation-direction-at = Richtung der synchronen Rotation nach IAU beim mittleren JPL-Abstand, zu Saturn aus { $table } addiert

engine-e-ephem-provider-read = { $path } lesen: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = dem TLE fehlt Zeile 1 (eine Zeile, die mit `1 ` beginnt)

engine-e-ephemeris-tle-is-missing-line-line-2 = dem TLE fehlt Zeile 2 (eine Zeile, die mit `2 ` beginnt)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = eine analytische `orbit`-Ephemeride erfordert eine `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = ein Ephemeridenszenario benötigt entweder ein `tle` oder eine `orbit`

engine-e-ephemeris-step-must-be-positive = step_s muss positiv sein

engine-e-ephemeris-duration-must-be-non-negative = duration_s darf nicht negativ sein

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz muss eine positive, endliche Frequenz sein

engine-ephemeris-ground-track-samples-alt-km = { $source }-Bodenspur · { $n_samples } Stichproben · Höhe { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` ist nicht endlich

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` sind weder Sekunden noch eine ISO-8601-UTC-Zeit

engine-e-evidence-assemble-no-epoch-of-the-log = keine Epoche des Logs liegt zwischen { $t0 } s und { $t1 } s (das Log erstreckt sich von 0 bis { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config ist kein Objekt

engine-e-evidence-assemble-config-json-already-has-an = config.json hat bereits einen Eintrag `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = von { $from_s } bis { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` ist keine UTC-Zeit wie 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } in einem Log von { $log_bytes } Bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } benötigt einen Wert

engine-e-evidence-cli-cannot-create = { $path } kann nicht erstellt werden: { $e }

engine-e-evidence-cli-cannot-write = { $path } kann nicht geschrieben werden: { $e }

engine-evidence-cli-warning-is-readable-by-other = Warnung: { $path } ist für andere Benutzer lesbar; schränken Sie den Zugriff ein (chmod 600)

engine-e-evidence-cli-cannot-read-key = Schlüssel { $path } kann nicht gelesen werden: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } ist kein Hex-Schlüssel

engine-e-evidence-cli-must-hold-32-byte-key = { $path } muss einen 32-Byte-Schlüssel als 64 Hex-Ziffern enthalten

engine-e-evidence-cli-cannot-read = { $dir } kann nicht gelesen werden: { $e }

engine-e-evidence-cli-cannot-read-2 = { $name } kann nicht gelesen werden: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } existiert und ist nicht leer

engine-e-evidence-cli-cannot-create-2 = { $dir } kann nicht erstellt werden: { $e }

engine-evidence-cli-warning-is-owner-only-mode = Warnung: { $arg } ist nur für den Eigentümer lesbar (Modus 600) und nicht als *.pub benannt: Es könnte ein privater Schlüssel sein. Übergeben Sie die Datei mit dem öffentlichen Schlüssel.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` besteht weder aus 64 Hex-Ziffern noch ist es eine lesbare Datei ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` enthält keine Hex-Ziffern

engine-evidence-cli-private-key-keep-it-secret = privater Schlüssel: { $out }  (geheim halten; niemals einchecken)

engine-evidence-cli-public-key-pub = öffentlicher Schlüssel:  { $out }.pub

engine-evidence-cli-public-key-hex = öffentlicher Schlüssel (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Geben Sie Prüfern den öffentlichen Schlüssel über einen Weg, dem sie vertrauen; sie legen ihn mit --pubkey fest.

engine-e-evidence-cli-verify-needs-bundle-directory = verify benötigt ein Bundle-Verzeichnis

engine-e-evidence-cli-cannot-read-3 = { $p } kann nicht gelesen werden: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: kein PEM-Zertifikat gefunden

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }Signatur der Zeitstempelautorität wurde von Kshana nicht geprüft

engine-evidence-cli-this-is-technical-record-not = Dies ist eine technische Aufzeichnung, keine rechtliche Stellungnahme.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp benötigt ein Bundle-Verzeichnis

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp benötigt eine Token-Datei

engine-e-evidence-cli-cannot-read-4 = { $tok } kann nicht gelesen werden: { $e }

engine-e-evidence-cli-cannot-write-2 = { $target } kann nicht geschrieben werden: { $e }

engine-evidence-cli-note-the-token-sits-beside = Hinweis: Das Token liegt neben dem signierten Manifest, nicht darin; verwenden Sie verify mit --require-timestamp, um es zu verlangen.

engine-e-evidence-cli-round-trip-packs-are-not = Round-trip-Pakete werden für WebAssembly nicht erstellt

engine-e-evidence-cli-needs-scenario-path = benötigt einen Szenariopfad

engine-e-evidence-cli-needs-from = benötigt --from

engine-e-evidence-cli-needs-to = benötigt --to

engine-e-evidence-cli-cannot-read-lab-attestation = Laborerklärung { $p } kann nicht gelesen werden: { $e }

engine-e-evidence-cli-cannot-read-5 = { $scn_path } kann nicht gelesen werden: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = ungültiges receiver-trust-Szenario: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation gilt für `receiver-trust evidence`, nicht für `evidence round-trip` (dessen Paket die Testbedingungen festhält)

engine-e-evidence-cli-cannot-read-6 = { $sp } kann nicht gelesen werden: { $e }

engine-e-evidence-cli-cannot-read-7 = { $cp } kann nicht gelesen werden: { $e }

engine-evidence-cli-evidence-pack-written-to = Nachweispaket nach { $out } geschrieben

engine-evidence-cli-epochs-in-window-to = { "  " }Epochen im Fenster: { $epochs_in_window }  ({ $from_s } s bis { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }Fingerabdruck des Signierenden: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 von manifest.json (das, was eine RFC-3161-Autorität stempeln sollte): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }Log-Ausschnitt: bytes { $a } bis { $b } von { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }Log-Ausschnitt: gesamtes Log (dieses Log liefert keinen Byte-Bereich für das Fenster)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }Laborerklärung im signierten Manifest festgehalten ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Ein Paket ist eine technische Aufzeichnung, keine rechtliche Stellungnahme.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s bis { $to_s } s nach der ersten Epoche des Logs

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = ungültiges lab-attestation-TOML: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` muss eine Tabelle sein

engine-e-evidence-lab-invalid-lab-attestation = ungültige lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } ist erforderlich

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } überschreitet { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: date { $date } ist kein Tag wie 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: ein abgeschirmter Aufbau benötigt enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup muss "conducted" oder "shielded" sein (erhalten: { $other }); ein Aufbau über die Luftschnittstelle wird nicht als Laborlauf akzeptiert

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db muss endlich sein

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = die Testbedingungen nennen { $events } Ereignis(se), das Bewertungsszenario hat jedoch { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = Ereignis '{ $id }' in den Testbedingungen ({ $onset_s } s bis { $offset_s } s) stimmt nicht mit '{ $label }' im Bewertungsszenario ({ $onset_s2 } s bis { $end_s } s) überein

engine-e-evidence-roundtrip-the-log-sha-256-is = der SHA-256 des Logs ({ $have }) ist nicht der, den die Testbedingungen nennen ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = abgeschnittenes DER

engine-e-evidence-tsa-bad-der-length = ungültige DER-Länge

engine-e-evidence-tsa-unexpected-der-tag = { $what }: unerwartetes DER-Tag { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = leerer AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = ungültige UTCTime

engine-e-evidence-tsa-bad-generalizedtime = ungültige GeneralizedTime

engine-e-evidence-tsa-bad-time = ungültige Zeit

engine-e-evidence-tsa-time-not-in-utc = Zeit nicht in UTC

engine-e-evidence-tsa-bad-time-digits = ungültige Zeitziffern

engine-e-evidence-tsa-bad-bit-string = ungültiger BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: drei Elemente erwartet

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: zu kurz

engine-e-evidence-tsa-empty-extension = leere Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: Wert ist kein OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: leer

engine-e-evidence-tsa-validity-short = Validity: zu kurz

engine-e-evidence-tsa-pem-end-without-begin = PEM: END ohne BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: ungültiges base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: ungültige base64-Länge

engine-e-evidence-tsa-spki-empty = SPKI: leer

engine-e-evidence-tsa-spki-no-oid = SPKI: keine OID

engine-e-evidence-tsa-spki-no-key = SPKI: kein Schlüssel

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: zwei Ganzzahlen erwartet

engine-e-evidence-tsa-unsupported-elliptic-curve = nicht unterstützte elliptische Kurve

engine-e-evidence-tsa-unsupported-public-key-algorithm = nicht unterstütztes Public-Key-Verfahren

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA-Schlüssel oder -Signatur zu groß

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA-Modulus nicht ungerade

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA-Signatur außerhalb des Bereichs

engine-e-evidence-tsa-rsa-key-too-small = RSA-Schlüssel zu klein

engine-e-evidence-tsa-invalid-padding = ungültiges Padding

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: codierte Nachricht zu lang

engine-e-evidence-tsa-last-octet-invalid = letztes Oktett ungültig

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: äußerste linke Bits sind nicht null

engine-e-evidence-tsa-pss-bad-padding = PSS: ungültiges Padding

engine-e-evidence-tsa-pss-signature-mismatch = PSS: Signatur stimmt nicht überein

engine-e-evidence-tsa-unsupported-mask-generation-function = nicht unterstützte Maskengenerierungsfunktion

engine-e-evidence-tsa-mgf1-without-hash = MGF1 ohne Hash

engine-e-evidence-tsa-bad-pss-salt-length = ungültige PSS-Salt-Länge

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = eine ECDSA-Signatur benötigt einen EC-Schlüssel

engine-e-evidence-tsa-an-rsa-signature-needs-an = eine RSA-Signatur benötigt einen RSA-Schlüssel

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption ohne Digest-Algorithmus

engine-e-evidence-tsa-an-rsa-pss-signature-needs = eine RSA-PSS-Signatur benötigt einen RSA-Schlüssel

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey ohne Digest-Algorithmus

engine-e-evidence-tsa-unsupported-signature-algorithm = nicht unterstütztes Signaturverfahren

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: leer

engine-e-evidence-tsa-time-stamp-request-not-granted = Zeitstempelanfrage nicht gewährt

engine-e-evidence-tsa-no-time-stamp-token-in = kein Zeitstempel-Token in der Antwort

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = weder TimeStampResp noch TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = kein CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: kein Inhalt

engine-e-evidence-tsa-signeddata-short = SignedData: zu kurz

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: leer

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = der gekapselte Inhalt ist keine TSTInfo

engine-e-evidence-tsa-no-tstinfo = keine TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo nicht in einem OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: zu kurz

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: keine genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: keine signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = genau eine SignerInfo erwartet

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: keine sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: kein Digest-Algorithmus

engine-e-evidence-tsa-signerinfo-short = SignerInfo: zu kurz

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: keine signierten Attribute

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: kein Signaturverfahren

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: keine Signatur

engine-e-evidence-tsa-no-serial = keine Seriennummer

engine-e-evidence-tsa-signer-certificate-not-found = Signierzertifikat nicht gefunden

engine-e-evidence-tsa-attribute-empty = Attribute: leer

engine-e-evidence-tsa-attribute-no-values = Attribute: keine Werte

engine-e-evidence-tsa-attribute-no-value = Attribute: kein Wert

engine-e-evidence-tsa-content-type-attribute-mismatch = Abweichung beim content-type-Attribut

engine-e-evidence-tsa-digest-failure = Digest-Fehler

engine-e-evidence-tsa-signature-not-an-octet-string = Signatur ist kein OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = ESS-Signing-Certificate-Attribut fehlt

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: leer

engine-e-evidence-tsa-ess-cert-id-not-found = ESS-Cert-ID nicht gefunden

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: kein Hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = ungeeigneter Zertifikatszweck

engine-e-evidence-tsa-certificate-is-not-yet-valid = Zertifikat ist noch nicht gültig

engine-e-evidence-tsa-certificate-has-expired = Zertifikat ist abgelaufen

engine-e-evidence-tsa-invalid-ca-certificate = ungültiges CA-Zertifikat

engine-e-evidence-tsa-certificate-chain-too-long = Zertifikatskette zu lang

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: leer

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: kein Digest

engine-e-evidence-tsa-message-imprint-mismatch = Message-Imprint stimmt nicht überein

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER mit unbestimmter Länge wird nicht unterstützt

engine-e-evidence-tsr-expected-tag-found = { $what } (Tag { $tag }) erwartet, gefunden: { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = fehlerhafte PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = die Zeitstempelantwort wurde nicht gewährt

engine-e-evidence-tsr-not-timestamp-token = kein Zeitstempel-Token

engine-e-evidence-tsr-the-token-content-type-is = der Inhaltstyp des Tokens ist nicht CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = das Token enthält keine TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = das Message-Imprint verwendet einen nicht unterstützten Hash-Algorithmus

engine-e-evidence-tsr-the-imprint-is-bytes-not = das Imprint umfasst { $digest } bytes, nicht die { $want_len }, die { $hash_alg } liefert

engine-e-evidence-tsr-gentime-is-not-utc = genTime ist nicht UTC

engine-e-evidence-tsr-malformed-gentime = fehlerhafte genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime ist keine reale Kalenderzeit

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = nicht als Kleinbuchstaben-Hex

engine-e-evidence-verify-expected-bytes-found = { $N } bytes erwartet, gefunden: { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = das Paket enthält bereits ein Zeitstempel-Token; verwenden Sie --replace, um es zu ersetzen

engine-e-evidence-verify-not-attached-the-pack-with = nicht angehängt: das Paket mit diesem Token wird nicht verifiziert ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = das Paket hält eine Laborerklärung von { $operator } fest ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = die Signaturdatei endet nicht mit einem Zeilenumbruch

engine-evidence-verify-signer-not-pinned-the-signature = Signierender nicht festgelegt: Die Signatur belegt, dass das Paket gegenüber dem Schlüssel { $r } unverändert ist, den das Paket selbst nennt. Vergleichen Sie diesen Fingerabdruck mit einem, den Sie vom Signierenden erhalten haben, oder geben Sie den Schlüssel an.

engine-evidence-verify-range-is-not-inside-log = Bereich { $start }..{ $end } liegt nicht innerhalb eines Logs von { $full_bytes } bytes

engine-evidence-verify-timestamp-token-states-its-imprint = Zeitstempel-Token nennt { $gen_time }; sein Imprint { $v2 } manifest.json. Signatur der Zeitstempelautorität wurde von Kshana nicht geprüft: Prüfen Sie sie mit `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = Zeitstempel-Token nennt { $gen_time }; sein Imprint { $v2 } manifest.json; Signatur und Kette der Zeitstempelautorität { $v3 } gegenüber den angegebenen Ankern.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` ist die leere Zeichenkette

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } liegt außerhalb des Vokabulars

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = die Kostenspanne muss endlich, nicht negativ und geordnet sein (low≤nominal≤high) und eine Quelle tragen

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction und availability müssen Anteile in [0, 1] sein

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } muss endlich und > 0 sein, erhalten: { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } muss endlich und >= 0 sein, erhalten: { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg muss in [-90, 90) liegen, erhalten: { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = die Konstellation hat keine Satelliten

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats muss >= 1 sein, wenn gesetzt

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = Slip-Satellit { $sat } außerhalb des Bereichs

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = Zeile { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = Zeile { $lineno }: { $v } Spalten, mindestens { $min } erwartet

engine-e-fusion-kfgins-line-columns = Zeile { $v1 }: { $v } Spalten

engine-e-fusion-kfgins-line-block-lists-are-not = Zeile { $lineno }: Blocklisten werden nicht unterstützt

engine-e-fusion-kfgins-line-expected-key-value = Zeile { $lineno }: `key: value` erwartet

engine-e-fusion-kfgins-line-indented-key-without-parent = Zeile { $lineno }: eingerückter Schlüssel ohne übergeordneten Schlüssel

engine-e-fusion-kfgins-line-only-one-level-of = Zeile { $lineno }: nur eine Verschachtelungsebene

engine-e-fusion-kfgins-line-unterminated-flow-list = Zeile { $lineno }: nicht abgeschlossene Flow-Liste

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` ist eine Liste, ein Skalar wird erwartet

engine-e-fusion-kfgins-missing = `{ $k }` fehlt

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` muss eine Liste mit drei Elementen sein

engine-e-fusion-kfgins-no-imu-sample-at-or = kein IMU-Abtastwert bei oder nach starttime

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU-Zeit steigt bei { $t } nicht an

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } muss endlich und > 0 sein, erhalten: { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m muss endlich und > 0 sein, erhalten: { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg muss in [-90, 90) liegen, erhalten: { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = Trajektorien-CSV, Zeile { $v1 }: keine Zahlen: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = Trajektorien-CSV, Zeile { $v1 }: 10 Spalten erwartet, erhalten: { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = Trajektorien-CSV, Zeile { $v1 }: die Zeit steigt nicht an

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = die Trajektorien-CSV benötigt mindestens zwei Zeilen

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = die Trajektorien-CSV deckt { $rows } s ab, das Szenario läuft jedoch { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg des Standorts muss in [-90, 90] liegen und jedes Feld endlich sein

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" ist weder ein GNSS-Preset ({ $e_gnss }) noch ein LEO-Preset ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: geben Sie den Nutzer als `site` oder `user_ecef_m` an, nicht beides

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m muss endlich und nicht das Geozentrum sein

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: Satellit { $id }: Azimut/Elevation außerhalb des Bereichs

engine-e-geometry-sky-satellite-is-given-in = sky: Satellit { $id } ist in ECEF angegeben; die Anfrage benötigt `site` oder `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: Satellit { $id }: ECEF-Position nicht endlich

engine-e-geometry-sky-satellite-coincides-with-the = sky: Satellit { $id } fällt mit dem Nutzer zusammen

engine-e-geometry-sky-satellite-give-az-deg = sky: Satellit { $id }: geben Sie az_deg und el_deg oder ecef_m an, sonst nichts

engine-e-geometry-sky-tle-is-bytes-the = sky: tle umfasst { $text } bytes; die Obergrenze beträgt { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = Elementsatz abgelehnt: { $e }

engine-geometry-sky-tle-holds-no-complete = sky: tle enthält keinen vollständigen Zweizeilen-Elementsatz; { $n_ignored } Zeilen ignoriert, die erste: { $first }

engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. und { $more } weitere

engine-geometry-element-sets-propagated-by-the = { $n } Elementsätze, von der SGP4 der Engine (WGS-72) auf { $iso } propagiert und mit UT1 gleich UTC und ohne Polbewegung ins erdfeste System gedreht: der Himmel, den diese Elementsätze zu dieser Epoche ergeben, keine Messung davon.

engine-geometry-element-sets-propagated-by-the-2 = { $n } Elementsätze, von der SGP4 der Engine (WGS-72) auf die Epoche des neuesten Elementsatzes plus time_s ({ $iso }) propagiert. Es wurde keine Epoche angegeben, daher ist dies ein repräsentativer Himmel, nicht der Himmel eines genannten Datums.

engine-e-geometry-sky-give-systems-or-tle = sky: geben Sie `systems` oder `tle` (mit einer `site`) oder `satellites` an

engine-e-geometry-sky-tle-system-names-the = sky: tle_system benennt die `tle`-Satelliten; die Anfrage enthält kein `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg muss in [-90, 90) liegen, erhalten: { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` benötigt eine `site` (oder `user_ecef_m`), von der aus beobachtet wird

engine-e-geometry-sky-time-must-be-finite = sky: time_s muss endlich sein

engine-e-geometry-sky-system-asks-for-satellites = sky: System "{ $name }" fordert { $asked } Satelliten an; eine Anfrage enthält höchstens { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: mehr als { $MAX_SATELLITES } Satelliten

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` benötigt eine `site` (oder `user_ecef_m`), von der aus beobachtet wird

engine-e-geometry-sky-more-than-satellites-above = sky: mehr als { $MAX_SATELLITES } Satelliten über dem Horizont

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m muss positiv sein, erhalten: { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence muss in (0, 1) liegen, erhalten: { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: mehr als { $MAX_CLOCKS } Systeme in Sicht, jedes mit eigener Uhr; fassen Sie Satelliten unter weniger `system`-Labels zusammen oder verwenden Sie clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n muss in 1..={ $MAX_MC_SAMPLES } liegen, erhalten: { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: zu wenige Satelliten in Sicht für eine Lösung; keine Monte-Carlo-Wolke

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = TLE-Himmel bei { $e }, keine Messung

engine-e-geometry-invalid-sky-request-json = ungültige sky-Anfrage (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = ungültige sky-Anfrage (TOML): { $e }

engine-e-geometry-invalid-skyline-json = ungültige skyline (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = ungültige skyline (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = ungültige GLONASS-PRN in { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = Seitentyp { $pt } wird hier nicht codiert

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } Bits, erwartet { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } Bits, erwartet { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = Schlussbits sind nicht null

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q stimmt nicht überein

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = Seitentyp { $pt } wird hier nicht decodiert

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } Symbole, erwartet { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = Synchronisationsmuster nicht gefunden

engine-e-gnss-navmsg-gal-fnav-page-type-missing = Seitentyp { $t } fehlt

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav von Seitentyp { $t } weicht von Seitentyp 1 ab

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = kein Galileo-Feld { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = Worttyp { $wt } wird hier nicht codiert

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } Bits, erwartet { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = Worttyp { $wt } wird hier nicht decodiert

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = Seitenteile müssen 120 Bits umfassen

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = die Even/Odd-Flags sind nicht 0, dann 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = keine nominale Seite (Seitentyp 1 ist eine Alert-Seite)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } Bits, erwartet { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } Symbole, erwartet { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = Worttyp { $t } fehlt

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav von Worttyp { $t } weicht von Worttyp 1 ab

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = der Satz gehört zum System { $system }, nicht zu Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = Typ 10 hat kein Feld { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = Typ 11 hat kein Feld { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = Typ 30 hat kein Feld { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV-Rumpf hat { $body } Bits, erwartet 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } oder TOW-Zähler { $tow_count } außerhalb des Bereichs

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } Bits, erwartet { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = die Präambel ist nicht 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = Nachrichtentyp { $t } wird hier nicht decodiert

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = eine Nachricht vom Typ 10 und eine vom Typ 11 sind erforderlich

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } bei LSB { $value2 } passt nicht in { $bits } { $v4 } Bits

engine-e-gnss-navmsg-bits-layout-needs = { $bits } Bits, das Layout benötigt { $need }

engine-e-gnss-navmsg-no-field = kein Feld { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } bei Skalierung 2^{ $scale_pow2 } passt nicht in { $bits } { $v1 } Bits

engine-e-gps-lnav-no-value-for = kein Wert für { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: das Referenzmodell "gfc" benötigt `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: gfc_path { $path } kann nicht gelesen werden: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: unbekanntes Referenzmodell `{ $other }` (verwenden Sie "egm2008" oder "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: unbekanntes Ellipsoid `{ $other }` (verwenden Sie "wgs84" oder "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations muss mindestens 1 sein

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations ist auf 10000 begrenzt

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = ungültige reelle Zahl '{ $t }'

engine-e-gravity-pds-bad-integer = ungültige Ganzzahl '{ $t }'

engine-e-gravity-pds-empty-shadr-table = leere SHADR-Tabelle

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR-Header hat { $f } Felder, mindestens 6 erwartet

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR-Header: negativer Grad/negative Ordnung oder unbekannte Normalisierung

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR-Normalisierungszustand { $normalization } (unterstützt wird nur vollständig normalisiert, Zustand 1)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR-Referenzlänge/-breite muss 0 sein

engine-e-gravity-pds-non-physical-gm-must-be = unphysikalisches GM (muss endlich und positiv sein)

engine-e-gravity-pds-non-physical-reference-radius-must = unphysikalischer Referenzradius (muss endlich und positiv sein)

engine-e-gravity-pds-shadr-record-fields = SHADR-Satz { $v1 }: { $f } Felder

engine-e-gravity-pds-shadr-record-bad = SHADR-Satz { $v1 }: ungültiges (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR-Satz { $v1 }: nicht endlicher Koeffizient

engine-e-gravity-pds-no-shadr-coefficient-records = keine SHADR-Koeffizientensätze

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR-Tabelle unvollständig: (n, m) = ({ $n }, { $m }) fehlt

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant fehlt

engine-e-gravity-sh-missing-radius = radius fehlt

engine-e-gravity-sh-non-physical-earth-gravity-constant = unphysikalische earth_gravity_constant (muss endlich und positiv sein)

engine-e-gravity-sh-non-physical-radius-must-be = unphysikalischer radius (muss endlich und positiv sein)

engine-e-gravity-sh-no-gfc-coefficient-lines = keine gfc-Koeffizientenzeilen

engine-e-gravity-sh-read-error = Lesefehler: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = Zeile { $lineno }: norm { $v } wird nicht unterstützt (nur fully_normalized)

engine-gravity-sh-line-bad = Zeile { $lineno }: { $what } ungültig

engine-e-gravity-sh-line-degree-above-the-declared = Zeile { $lineno }: Grad { $n } über dem deklarierten max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = Zeile { $lineno }: Ordnung { $m } über dem Grad { $n }

engine-e-gravity-sh-line-time-variable-term-is = Zeile { $lineno }: zeitvariabler Term `{ $key }` wird nicht unterstützt (nur statische Modelle)

engine-e-gravity-sh-missing-end-of-head = end_of_head fehlt

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s muss positiv sein, erhalten: { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s muss positiv sein, erhalten: { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase = das Szenario erzeugt { $n } Epochen (erforderlich ≥ 2); erhöhen Sie duration_s oder verringern Sie step_s

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = die Aufzeichnung enthält einen nicht endlichen Zeitfehler

engine-e-holdover-test-unknown-mask-expected-one-of = unbekannte Maske { $id }; erwartet wird eine von { $masks }

engine-e-holdover-test-every-budget-max-abs-te = jedes Budget max_abs_te_ns muss endlich und positiv sein

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } liegt außerhalb der Aufzeichnung ({ $t0_s } bis { $t_end } s auf ihrer eigenen Zeitachse)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } muss später als gnss_removed_s ({ $gnss_removed_s }) liegen und nicht über das Ende der Aufzeichnung ({ $t_end } s) hinaus

engine-e-holdover-test-the-holdover-step-holds-no = der holdover-Schritt enthält keinen Abtastwert

engine-holdover-test-the-record-has-no-step = die Aufzeichnung hat keinen Schritt { $step }: GNSS wurde bei ihrem ersten Abtastwert entfernt

engine-holdover-test-the-step-has-samples-the = der Schritt { $step } hat { $te_ns } Abtastwerte; die Schätzer benötigen mindestens 13

engine-e-holdover-test-step-with-mask-has-no = ein Schritt mit Maske hat keine Kurve

engine-e-holdover-test-cannot-read-csv-path = csv_path { $path } kann nicht gelesen werden: { $e }

engine-holdover-test-recovered-after-gnss-returned = ; { $t } s nach der Rückkehr von GNSS wiederhergestellt

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }{ $rec } (MODELLED, gegen die Maske gemessen)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m muss endlich und > 0 sein, erhalten: { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba muss >= 0 und coupled.bias_var > 0 sein

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = ABGELEHNT: Die beiden Zweige haben keine gemeinsame Mittelungszeit. Der optische Zweig akkumuliert über integration_s = { $integration_s } s; die Schleifenrauschbandbreite des RF-Zweigs B_L = { $dll_bandwidth_hz } Hz mittelt über 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Ein Verhältnis zweier Sigmas, die zu unterschiedlichen Mittelungszeiten bestimmt wurden, ist kein Vergleich, daher wird keines angegeben. Entfernen Sie die Überschreibung rf_dll_bandwidth_hz (sie ist dann standardmäßig 1/(2*integration_s)) oder setzen Sie sie auf { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = ABGELEHNT: Ein Zweig ist kein verwendbares positives endliches Sigma (optisch { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), daher wird kein Verhältnis gebildet.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = unbekanntes rf_band '{ $other }' (erwartet s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } muss endlich sein

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db muss endlich und >= 0 sein

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint = hybrid-optical-rf | optischer Footprint { $footprint_m } m, { $detected_photons } Photonen -> Entfernungs-σ { $c } mm, Zeitgebungs-σ { $c2 } ps | Cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | Verfügbarkeit { $c4 }% ({ $n_sites } Standorte) | Übergabe sprungfrei { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | gemeinsame FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | gegen unabhängige Referenz geprüft: CRLB/χ²-PL/Vereinigung/Übergabe, aus Modell berechnet: σ/Klimatologie

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa muss in [0, 1] liegen

engine-e-impairment-eval-per-class-must-be = n_per_class muss >= 1 sein

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | Detektor { $detector } | AUC { $auc_in } intern / { $auc_out } extern (Lücke { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ Ziel { $target_pfa } | { $n_cases } Fälle | MODELLED synthetisch

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = unbekannter Detektor '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = unbekannter imu_grade { $other }; erwartet wird einer von navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = unbekannte combination { $other }; erwartet wird eine von rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = unbekannter trn_fix_mode { $other }; erwartet wird einer von none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } muss endlich und nicht negativ sein (erhalten: { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m muss mindestens einen Schwellenwert nennen

engine-e-inertial-coast-crossing-thresholds-entries-must-be = die Einträge von crossing_thresholds_m müssen endlich und positiv sein (erhalten: { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades muss mindestens eine IMU-Klasse nennen

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s muss endlich und nicht negativ sein (erhalten: { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 muss endlich und nicht negativ sein (erhalten: { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg muss endlich sein und innerhalb von (-89, 89) liegen (erhalten: { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m muss innerhalb von [-1000, 100000] liegen (erhalten: { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s muss positiv sein

engine-e-inertial-coast-drift-band-must-satisfy-lo = das Driftband muss 0 < lo < hi erfüllen (erhalten: lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = Serialisierung des ins-trn-coast-Ergebnisses: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade }-IMU, { $speed } m/s, Kombination { $comb } | { $heads } | TRN { $mode } Spitze { $peak_error_m } m über { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va aus der Physik des Kaltatom-Interferometers abgeleitet)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = das Szenario umfasst { $toml_text } bytes, über dem Limit von { $max_bytes } bytes

engine-e-inline-only-the-scenario-kind-reads-its = die Szenarioart `{ $kind }` liest ihre Daten aus Dateien auf dem Host, daher führt diese Oberfläche sie nicht aus; verwenden Sie die `kshana`-Befehlszeile

engine-e-inline-only-the-field-names-file-this = das Feld `{ $k }` nennt eine Datei: diese Oberfläche akzeptiert nur Inline-Inhalte

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = Trace-JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = unbekannter Datensatz `{ $key }`; vorgegeben: { $v1 }, oder ein benutzerdefinierter Datensatz

engine-e-interference-map-api-dataset-is-data-but-the = der Datensatz `{ $key }` enthält { $kind }-Daten, die Eingabeart ist jedoch { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } ist kein Datum im Format YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = unbekannte Option `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = { $positionals } Positionsargument(e) erwartet, erhalten: { $pos }

engine-e-interference-map-cli-cannot-read = { $path } kann nicht gelesen werden: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom benötigt { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } existiert bereits; Kshana überschreibt keine Karten. Entfernen Sie es oder wählen Sie ein anderes --out-Verzeichnis

engine-interference-map-cli-note-cell-deg-is-not = Hinweis: --cell-deg { $cell_deg } ist nicht die vorregistrierte Zellgröße ({ $PREREGISTERED_CELL_DEG }); die Karten weisen darauf hin

engine-e-interference-map-cli-cannot-create = { $out } kann nicht erstellt werden: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = { $path } geschrieben: { $cells } Zellen veröffentlicht, { $n_deg } markiert

engine-interference-map-cli-no-usable-rows-nothing-written = keine verwendbaren Zeilen: nichts geschrieben

engine-e-interference-map-cli-unknown-subcommand = unbekannter Unterbefehl `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = der SHA-256 der heruntergeladenen Datei ({ $got }) stimmt nicht mit dem festgelegten Wert ({ $expected }) überein; sie wurde verworfen

engine-e-interference-map-cli-cannot-write = { $dest } kann nicht geschrieben werden: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl wurde im PATH nicht gefunden. Installieren Sie curl oder laden Sie { $NATURAL_EARTH_LAND_URL } selbst herunter und prüfen Sie, dass sein SHA-256 { $NATURAL_EARTH_LAND_SHA256 } lautet

engine-e-interference-map-cli-cannot-run-curl = curl kann nicht ausgeführt werden: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = { $out } geschrieben: Natural-Earth-Landpolygone, SHA-256 geprüft (gemeinfrei, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = keine trace_full_*-Dateien unter { $path }

engine-e-interference-map-cli-cannot-read-2 = { $spec } kann nicht gelesen werden: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } ist kein Datum im Format YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: ungültiges Kartendatum

engine-e-interference-map-cli-cannot-write-2 = { $out } kann nicht geschrieben werden: { $e }

engine-interference-map-cli-route-length-km = Routenlänge { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Einschränkungen: Eine beeinträchtigte Zelle weist Störung nicht als Ursache aus; nicht beobachtete Zellen sind kein Beleg für eine freie Route; dies ist keine Vorhersage.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = Landpolygone: ungültiges JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = erforderliche Spalte `{ $name }` fehlt

engine-e-interference-map-cannot-read-input = Eingabe kann nicht gelesen werden: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` ist kein Datum (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours muss { $MIN_DELAY_HOURS } oder mehr betragen: das Observatorium veröffentlicht nicht früher

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg muss { $MIN_CELL_DEG } oder gröber sein: das Observatorium veröffentlicht nur grobe Zellen

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } ist noch nicht veröffentlichbar: sein Produkt wird frühestens { $fmt_utc } veröffentlicht ({ $delay_hours } h nach Ende des Tages)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORIUM  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG ZELLEN  UTC-TAG  NICHT BEOBACHTET HEISST NICHT FREI  KEINE URSACHE ZUGEORDNET

engine-interference-map-observatory-source-licence = QUELLE { $dataset }  LIZENZ { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } BEEINTRÄCHTIGT  { $summary2 } NICHT BEEINTRÄCHTIGT  { $summary3 } NICHT BEOBACHTET (VERÖFFENTLICHTE ZELLEN)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana-Observatorium, ADS-B-Navigationsgenauigkeitskarte, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = { $path } kann nicht erstellt werden (Kshana überschreibt keine Produkte): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = die Eingabe enthält keinen verwendbaren Bericht für { $day } (gefundene Tage: { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } existiert bereits; Kshana überschreibt keine Produkte

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } Zellen veröffentlicht, { $p2 } beeinträchtigt, { $p3 } Vorfall/Vorfälle

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } Zeilen unter { $variants } Varianten wiedergegeben: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = die Karte ist kein gültiges JSON: { $e }

engine-e-interference-map-route-route-invalid-json = Route: ungültiges JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = Route: Zeile { $v1 } ist nicht `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana-{ $v1 }-Export. Epoche: { $epoch_note }. Bewegte Objekte: GCRS (referenceFrame INERTIAL), Meter, Sekunden nach der Epoche. Feste Standorte: erdfest WGS 84 (referenceFrame FIXED), Meter.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Position: GCRS, Meter.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Breite { $lat_deg } deg, Länge { $lon_deg } deg, Höhe { $h_m } m über dem WGS-84-Ellipsoid. Position: erdfest, Meter.

engine-interop-czml-radius-along-the-ground = { $description }. Radius { $radius_m } m entlang des Bodens.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Ohne Zeitbezug: WGS-84-Länge und -Breite in Grad, an den Boden angepasst.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Erdfeste Positionen; eine MultiLineString wird am Antimeridian getrennt, und times_utc listet dann nur die ursprünglichen Abtastwerte auf.

engine-interop-geojson-kshana-export-epoch = Kshana-{ $v1 }-Export. Epoche: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = ungültiges GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString hat kein coordinates-Array

engine-e-interop-geojson-an-rfc-7946-linestring-needs = ein LineString nach RFC 7946 benötigt zwei oder mehr Positionen

engine-interop-geojson-position-is-not-an-array = Position { $i } ist kein Array aus zwei oder drei Zahlen

engine-interop-geojson-position-longitude-is-not-number = Position { $i }: die Länge ist keine Zahl

engine-interop-geojson-position-latitude-is-not-number = Position { $i }: die Breite ist keine Zahl

engine-e-interop-geojson-position-longitude-is-outside-180 = Position { $i }: die Länge { $lon } liegt außerhalb von [-180, 180] (GeoJSON nennt die Länge zuerst)

engine-e-interop-geojson-position-latitude-is-outside-90 = Position { $i }: die Breite { $lat } liegt außerhalb von [-90, 90] (GeoJSON nennt die Länge zuerst)

engine-e-interop-geojson-track-needs-two-or-more = eine Spur benötigt zwei oder mehr Wegpunkte

engine-e-interop-geojson-the-route-spans-more-than = die Route umfasst mehr als 180 Grad Länge; die Spurarten schreiten in einfachen Grad voran und können den Antimeridian nicht überqueren

engine-e-interop-geojson-position-is-deg-from-an = Position { $worst } weicht um { $worst2 } deg von einer gleichmäßig verteilten geraden Spur ab (Toleranz { $tol_deg } deg); die Spurarten fliegen start + i*step, geben Sie also gleichmäßig verteilte Positionen auf einer Linie an, oder nur die beiden Enden

engine-e-interop-geojson-route-applies-to-the-kinds = eine Route gilt für die Arten, die eine Wegpunktspur fliegen (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` nimmt keine Trajektorieneingabe an

engine-e-interop-geojson-scenario-toml-is-not-table = das Szenario-TOML ist keine Tabelle

engine-e-interop-geojson-cannot-serialise-scenario = das Szenario kann nicht serialisiert werden: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = unbekanntes Exportformat '{ $other }'; erwartet wird eines von czml, kml, geojson, stk, sigmf, all oder list

engine-e-interop-member = Mitglied { $label }: { $e }

engine-interop-the-scenario-could-not-be = das Szenario konnte nicht exportiert werden: { $m }

engine-e-interop-invalid-spectrum-scenario = ungültiges Spektrumszenario: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than = { $n } Zeitabtastwerte sind mehr, als ein Export schreibt ({ $MAX_SAMPLES })

engine-e-interop-scene-objects-samples-is-more-than = { $items } Objekte x { $times } Abtastwerte sind mehr, als ein Export schreibt ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = ungültiges { $kind }-Szenario: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type }-Jammer, { $power_dbw } dBW Sendeleistung, { $gain_dbi } dBi Antennengewinn

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, aus den Streckengleichungen der Art jamming, mit dem Jammer am Horizont des Empfängers und Freiraumdämpfung

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (Stufe [pass] der Kette)

engine-interop-scene-circular-orbit-km-altitude-deg = Kreisbahn, { $altitude_km } km Höhe, { $inclination_deg } deg Neigung (mittlere SGP4-Elemente zu Fensterbeginn, wie die Art passes sie propagiert)

engine-interop-scene-ground-station-deg-elevation-mask = Bodenstation, { $mask_deg } deg Elevationsmaske

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; GCRS- und erdfeste Zustände sind die eigene Ausgabe der Art ephemeris (UT1 und Polbewegung, wie das Szenario sie festlegt)

engine-interop-scene-static-scene-the-kind-flies = statische Szene: die Art { $kind } fliegt eine Wegpunktspur ohne Zeitbezug

engine-interop-scene-true-track-flown-gps-denied = wahre Spur ohne GPS geflogen: { $track } Wegpunkte ab start_lat_deg/start_lon_deg in Schritten von step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` hat keine Szene

engine-e-interop-scene-missing-numeric = numerisches `{ $k }` fehlt

engine-e-interop-scene-missing-integer-waypoints = ganzzahliges `waypoints` fehlt

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } liegt außerhalb von 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } auf { $altitude_km } km, { $inclination_deg } deg Neigung (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = das Szenario gibt kein `epoch` an; t = 0 ist { $epoch }, die früheste Epoche, die die eigenen Daten der Satelliten tragen (TLE-, Broadcast-Ephemeriden- oder SP3-Epoche). Jeder Satellit wird von seiner eigenen Epoche aus propagiert, und diese erstrecken sich über { $spread_h } h: die Zeitmarken folgen der Prämisse der Engine, dass jeder Satellit bei t = 0 beginnt, während jede Position zum eigenen Zeitpunkt dieses Satelliten in das GCRS und in erdfeste Bezugssysteme gedreht wird. Die SP3- und OEM-Exporte kennzeichnen t = 0 stattdessen als 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = das Szenario gibt kein `epoch` an; t = 0 ist { $epoch }, die Epoche, die die eigenen Daten der Satelliten tragen (TLE-, Broadcast-Ephemeriden- oder SP3-Epoche). Die SP3- und OEM-Exporte kennzeichnen t = 0 stattdessen als 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } Objekte x { $times_s } Abtastwerte sind mehr, als ein Export schreibt ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = { $user_environment }-Nutzer, bewegt (konstante Geschwindigkeit und Richtung der Art)

engine-interop-scene-user-receiver = { $user_environment }-Nutzer (Empfänger)

engine-interop-scene-user-orbit-km-altitude-deg = Nutzerbahn, { $altitude_km } km Höhe, { $inclination_deg } deg Neigung (Kepler{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = kein bewegtes Objekt { $index }

engine-interop-stk-kshana-export-object = # Kshana-{ $v1 }-Export: { $scene }, Objekt { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type }-Jammer, { $power_dbw } dBW Sendeleistung, { $gain_dbi } dBi Antennengewinn (ein Parameter des Link-Budgets des Szenarios, kein Signal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` hat keine Fahrzeugtrajektorie zum Exportieren; der Prüfstandexport umfasst die Arten gnss-ins, jamming und gnss-sim

engine-e-interop-testbench-empty-motion-csv = leere Bewegungs-CSV

engine-e-interop-testbench-motion-csv-header-is-not = der Header der Bewegungs-CSV entspricht nicht den erwarteten Spalten: { $head }

engine-e-interop-testbench-row-fields-expected = Zeile { $v1 }: { $f } Felder, erwartet { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = Zeile { $v1 }: Spalte { $motion_columns } ist keine Zahl

engine-e-interop-testbench-line-no = Zeile { $v1 }: kein `$`

engine-e-interop-testbench-line-no-checksum = Zeile { $v1 }: keine Prüfsumme

engine-e-interop-testbench-line-bad-checksum-field = Zeile { $v1 }: ungültiges Prüfsummenfeld

engine-e-interop-testbench-line-checksum-mismatch = Zeile { $v1 }: Prüfsumme stimmt nicht überein

engine-e-interop-testbench-line-short-gga = Zeile { $v1 }: zu kurze GGA

engine-interop-testbench-line-bad-latitude = Zeile { $v1 }: ungültige Breite

engine-interop-testbench-line-bad-longitude = Zeile { $v1 }: ungültige Länge

engine-e-interop-testbench-line-bad-altitude = Zeile { $v1 }: ungültige Höhe

engine-e-interop-testbench-line-bad-separation = Zeile { $v1 }: ungültige Separation

engine-e-interop-testbench-line-short-rmc = Zeile { $v1 }: zu kurze RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = Zeile { $v1 }: RMC ohne vorangehende GGA

engine-e-interop-testbench-line-gga-and-rmc-times = Zeile { $v1 }: die Zeiten von GGA und RMC weichen ab

engine-e-interop-testbench-line-bad-speed = Zeile { $v1 }: ungültige Geschwindigkeit

engine-e-interop-testbench-line-bad-course = Zeile { $v1 }: ungültiger Kurs

engine-e-interop-testbench-line-bad-time-or-date = Zeile { $v1 }: ungültige Zeit oder ungültiges Datum

engine-e-interop-testbench-gga-with-no-following-rmc = eine GGA ohne nachfolgende RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = eine Wegpunktdatei benötigt mindestens zwei Abtastwerte

engine-e-interop-testbench-the-sample-step-is-not = die Abtastschrittweite { $step } s ist keine ganze Zahl von Millisekunden

engine-e-interop-testbench-the-samples-are-not-equally = die Abtastwerte sind nicht gleichmäßig verteilt: Intervall { $v1 } beträgt { $dt } s, das erste { $step } s

engine-e-interop-testbench-empty-waypoint-file = leere Wegpunktdatei

engine-e-interop-testbench-waypoint-not-three-numbers = Wegpunkt { $v1 }: keine drei Zahlen

engine-e-interop-testbench-waypoint-fields-expected = Wegpunkt { $v1 }: { $f } Felder, erwartet 3

engine-e-interop-testbench-events-csv-header-is-not = der Header der Ereignis-CSV ist nicht label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = Ereigniszeile { $v1 }: 5 Felder erwartet

engine-e-interop-testbench-event-row-unknown-kind = Ereigniszeile { $v1 }: unbekannte Art { $f }

engine-e-interop-testbench-event-row-bad-onset = Ereigniszeile { $v1 }: ungültiger Beginn

engine-e-interop-testbench-event-row-bad-end = Ereigniszeile { $v1 }: ungültiges Ende

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-interop-testbench-no-waypoints-txt-written = keine .waypoints.txt geschrieben: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = keine UTC-Zeit `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = { $what } fehlt

engine-e-ionex-bad-number-in = { $what }: ungültige Zahl in { $col }

engine-e-ionex-two-digit-year = { $what }: zweistellige Jahreszahl { $year }

engine-e-ionex-no-end-of-header = kein END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = höhenabhängige (3-D-)IONEX-Karten werden nicht unterstützt

engine-e-ionex-zero-grid-step = Gitterschrittweite null

engine-e-ionex-grid-needs-at-least-nodes = ein Gitter benötigt mindestens 2 x 2 Knoten

engine-e-ionex-map-no = Karte { $index }: kein { $end_label }

engine-e-ionex-map-band-latitude-header-grid = Karte { $index }: Band { $band } Breite { $band_lat }, Header-Gitter { $want }

engine-e-ionex-map-band-longitudes-differ = Karte { $index }: die Längen von Band { $band } weichen ab

engine-e-ionex-map-band-truncated = Karte { $index }: Band { $band } abgeschnitten

engine-e-ionex-map-bands-header-grid-has = Karte { $index }: { $band } Bänder, das Header-Gitter hat { $n_lat }

engine-e-ionex-map-no-epoch-of-current = Karte { $index }: kein EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } TEC-Karten, Header # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = die Epochen der TEC-Karten steigen nicht an

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz enthalten keine ganze Zahl von Abtastwerten pro { $code }-Periode ({ $spc } Abtastwerte)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods und noncoherent müssen positiv sein

engine-e-iq-acq-stream-ended-after-of-samples = der Strom endete nach { $got } von { $needed } Abtastwerten

engine-e-iq-acq-cfar-reference-cells-must-be = die CFAR-Referenzzellen müssen gerade und mindestens 2 sein (erhalten { $n })

engine-e-iq-acq-cfar-stride-must-be-at = die CFAR-Schrittweite muss mindestens 1 Lag betragen

engine-e-iq-acq-cfar-per-cell-pfa-must = die CFAR-Pfa je Zelle muss in (0, 1) liegen (erhalten { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = das CFAR-Fenster reicht { $reach } Lags je Seite, zu breit für eine Periode von { $samples_per_period } Lags

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = unbekanntes Oberflächenformat { $s }: erwartet wird csv, json oder bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = die Oberfläche würde { $spc_cells } Zellen enthalten (Grenze { $MAX_SURFACE_CELLS }): vergrößern Sie die Doppler-Schrittweite oder verkleinern Sie den Doppler-Bereich

engine-e-iq-acq-surface-surface-header = Oberflächen-Header: { $e }

engine-e-iq-acq-surface-surface-schema-expected = Oberflächenschema { $schema }; erwartet { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = Oberflächenrumpf: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = Aufzeichnung '{ $id }': format und sample_rate_hz müssen zusammen angegeben werden

engine-e-iq-campaign-conditions-test-conditions-json = Testbedingungen (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = Testbedingungen (TOML): { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf benötigt eine SigMF-Aufzeichnung (erhalten { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF-Metadaten: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF-Metadaten: global core:sample_rate fehlt

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start fehlt

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: kein core:sample_count und keine Leistungspunkte, die das Ereignis beenden

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema muss "{ $SCHEMA }" sein (erhalten "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id darf nicht leer sein

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s muss endlich und >= 0 sein

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 muss aus 64 Hexziffern bestehen

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind muss "iq" oder "receiver-log" sein (erhalten "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = mindestens eine [[expected]]-Gruppe ist erforderlich

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids darf nicht leer sein

engine-e-iq-campaign-conditions-lists-value-give-one-per = { $at }: { $key } listet { $n } Wert(e); geben Sie einen je id an ({ $ids })

engine-e-iq-campaign-conditions-duplicate-id = { $at }: doppelte id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s muss nach onset_s liegen

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects muss "all" oder eine Liste von ids sein

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: die affects-id { $bad } ist nicht in [[expected]] enthalten

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q muss positiv sein

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points darf nicht leer sein

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points muss in zeitlicher Reihenfolge stehen

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points muss endlich sein

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" benötigt reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = die Ereignisse '{ $id }' und '{ $id2 }' überlappen sich auf einem gemeinsamen Satelliten

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s muss >= 0 sein

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s muss positiv sein

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = Aufzeichnung '{ $id }': SHA-256 { $sha } stimmt nicht mit dem angegebenen { $want } überein

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: die Aufzeichnung enthält { $buf } Abtastwerte, { $n } sind zur Akquisition erforderlich

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s muss positiv sein

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db muss positiv sein

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s muss >= 0 sein

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz muss positiv sein

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs muss mindestens 1 sein

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = Kampagne (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = Kampagne (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions muss mindestens eine Datei oder ein Glob auflisten

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds muss >= 0 sein

engine-e-iq-campaign-spec-frontend-names-must-be-non = Frontend-Namen müssen nicht leer und eindeutig sein ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' trifft auf keine Datei zu

engine-e-iq-campaign-spec-recording-id-appears-in-both = die Aufzeichnungs-id '{ $w }' erscheint sowohl in { $w2 } als auch in { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names benötigt inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: kein Entwurf '{ $n }' in { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = Wahrheitszeile { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0-Profil: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0-Profil: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = Segment { $i }: die Stufenwerte müssen endlich sein

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = Segment { $i }: eine Rampe benötigt end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = Segment { $i }: points benötigt gleich lange, nicht leere t_s und db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = Segment { $i }: t_s muss streng ansteigen

engine-iq-channel-cn0-profile-segment-points-must-be-finite = Segment { $i }: points muss endlich sein

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = Segment { $i }: fade s4 muss in (0, 1] liegen

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = Segment { $i }: fade tau_s muss positiv sein

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: die Aufzeichnung enthält { $samples } Abtastwerte, { $need } sind für diese Suche erforderlich

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: benennen Sie das Format mit --surface-format csv|json|bin, oder lassen Sie den Pfad auf .csv, .json oder .bin enden

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = Akquisition: { $fs_hz } Hz, { $coherent_periods } kohärente Periode(n) x { $noncoherent } nichtkohärent, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = Bericht neu erstellt: { $cells_present } von { $cells_total } Zelle(n), { $rows } Zeile(n), davon { $rows_failed } mit verfehltem Zielwert; Digest { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    Kampagne { $name }: { $cells_total } Zelle(n); { $cells_skipped } bereits erledigt, { $cells_run } jetzt ausgeführt, { $cells_failed } fehlgeschlagen, { $cells_pending } ausstehend
    Ausgabe: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    erster Fehlschlag ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: { $events } Ereignis(se), { $tc } erwartete(r) Satellit(en); Bedingungs-Hash { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = Iono schräg { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = Iono vertikal { $t } TECU

engine-iq-cli-channel-tropo-doy = Tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = Szintillation S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = Mehrwege { $h }m { $multipath_ground } Boden

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground muss dry, wet oder sea sein (erhalten { $other })

engine-e-iq-cli-channel-give-at-most-one-of = geben Sie höchstens eines von --iono-stec, --iono-vtec, --iono-klobuchar an

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass erwartet lo,hi (erhalten { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass benötigt lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } mit Übergang { $transition } Hz passt nicht unter fs/2 ({ $v1 } Hz); verengen Sie das Band oder den Übergang

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits muss 1..=16 sein (erhalten { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = { $total } Abtastwerte gefiltert ({ $fs_hz } Hz) nach { $out } ({ $format }); Sidecar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = { $path } kann nicht gelesen werden: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = ungültiges labfit-Szenario: { $e }

engine-iq-cli-labfit-fitted-run-wrote = { $runs } Lauf/Läufe angepasst; { $written } geschrieben

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = { $fit_units } Einheit(en) aus der Kampagne angepasst; { $written } geschrieben

engine-iq-cli-labfit-cannot-write = { $target } kann nicht geschrieben werden: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } benötigt einen Wert

engine-e-iq-cli-cannot-parse = { $k }: { $v } kann nicht gelesen werden

engine-iq-cli-iq-takes-positional-argument-got = iq { $cmd } nimmt { $n } Positionsargument(e) an, erhalten { $pos }

engine-e-iq-cli-cannot-parse-2 = { $k }: { $p } kann nicht gelesen werden

engine-iq-cli-unknown-iq-processing-command-expected = unbekannter iq-Verarbeitungsbefehl { $other }; erwartet wird scene, acquire, track, sweep, labfit, frontend, monitor, campaign oder conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } liegt außerhalb des Bereichs für GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = keine gesunde GPS-Ephemeride für die angeforderten PRNs gefunden

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos erwartet lat,lon,alt (erhalten { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; C/N0-Profil ({ $segments } Segment(e))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format muss csv oder jsonl sein (erhalten { $other })

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ; Ganzzahlskala: 1 LSB = { $sc } rauschnormierte Einheiten (erwartetes RMS { $v1 } LSB je Komponente), { $clipped } Element(e) abgeschnitten

engine-iq-cli-scene-written-by-kshana-iq-scene = geschrieben von kshana iq scene: eine SIMULIERTE Szene, keine Aufzeichnung{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = ION-SDR-Metadaten { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF-Daten { $data_path }, Meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = geschrieben von kshana iq scene{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = { $samples } Abtastwerte ({ $format }, { $fs_hz } Hz) nach { $data_path } geschrieben; { $truth_records } Wahrheitssätze nach { $truth_path }; { $meta_note }; Kanal: { $chan_desc }{ $scale_note }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } kann nicht mit --design kombiniert werden: sweep führt jeden Entwurf der Datei aus

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = Schleifenentwurf-Durchlauf: { $rows } (Entwurf, PRN)-Ergebnis(se){ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: die Aufzeichnung enthält { $samples } Abtastwerte, { $need } sind zur Akquisition erforderlich

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: nicht akquiriert (Statistik { $statistic } < Schwelle { $threshold }); erhöhen Sie --doppler-max, --acq-coherent oder --acq-noncoherent, oder prüfen Sie die Aufzeichnung

engine-iq-cli-track-designs-and-differ-in-integration = die Entwürfe { $first } und { $d } unterscheiden sich in integration.extra_taps_chips; die Entwürfe eines Laufs müssen übereinstimmen, damit jeder Ausgabesatz dieselben Spalten hat

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: benennen Sie das Format mit --epochs-format csv|jsonl|bin, oder lassen Sie den Pfad auf .csv, .jsonl oder .bin enden

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz sind { $r } Abtastwerte pro Chip von { $c }: kommensurable Abtastung macht den Code-Diskriminator zu einer Treppe (bei 2 Abtastwerten/Chip zittert die DLL, etwa 0.09 Chip RMS Codefehler bei 45 dB-Hz); Code-Schleifen-Jitter und -Bias aus dieser Aufzeichnung sind nicht repräsentativ. Verwenden Sie eine Rate, die kein Vielfaches der halben Chiprate ist, um Code-Schleifen zu beurteilen.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = der Worker wurde beendet, bevor er diese Eingabe verarbeitet hat

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = unbekannte Option { $s }

engine-e-iq-io-cli-format-needs-rate = --format benötigt --rate

engine-iq-io-cli-iq-takes-path-argument-got = iq { $cmd } nimmt { $n } Pfadargument(e) an, erhalten { $pos }

engine-iq-io-cli-unknown-iq-command = unbekannter iq-Befehl { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated = { $n } Abtastwerte ({ $to }, { $fs_hz } Hz) nach { $files } geschrieben; { $w } gesättigte(s) Element(e){ $v4 }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow liest nur einkanalige Aufzeichnungen

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow liest eine Aufzeichnung mit einer Capture, diese hat { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: kein positives core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: die Capture beginnt nicht an einer Bytegrenze

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = unbekanntes Abtastformat { $name }: erwartet wird z. B. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, optional mit Endung _qi für komplex

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sidecar sample_rate_hz { $sample_rate_hz } ist nicht positiv

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: .sdrx-Aufzeichnungen enthalten einen Strom; Kanal { $channel } existiert nicht

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: Rohdatei ohne Sidecar; geben Sie ihr Format an, oder schreiben Sie { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = die Zeile kann nicht serialisiert werden: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = ungültiger Filterentwurf { $design }: passband_frac in (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = die ZF { $if_hz } Hz muss streng zwischen 0 und der halben Abtastrate ({ $v1 } Hz) liegen

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx-Daten: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-Bit { $enc } { $fmt } ({ $packed_bits } Bit/Abtastwert)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = nicht unterstütztes SigMF core:datatype { $datatype }: unterstützt werden ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be und die reellen ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } ist kein SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = ungültige SigMF-Metadaten: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } hat kein SigMF core:datatype; schreiben Sie es als raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } stimmt nicht mit dem { $c0 } der ersten Aufzeichnung überein

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: kein core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } ist nicht positiv

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } bei { $rate } Hz stimmt nicht mit dem { $f0 } bei { $r0 } Hz der ersten Aufzeichnung überein

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out = { $name }: die Capture bei Abtastwert { $sample_start } liegt außer der Reihe oder jenseits der { $n_file } Abtastwerte in den Daten

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: die erste Capture beginnt nicht an einer Bytegrenze

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = Kanal { $channel } angefordert; die Aufzeichnung hat { $channels } (Kanäle zählen ab 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = ungültige SigMF-Collection: { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } stimmt nicht mit dem { $h } der Collection überein

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = Strom { $select } von { $channels } verschachtelten Strömen existiert nicht (Ströme zählen ab 0)

engine-e-iq-io-stream-sample-of-does-not-start = Abtastwert { $k } von { $format } beginnt nicht an einer Bytegrenze

engine-e-iq-io-stream-time-window-start-duration-both = Zeitfenster Beginn { $start_s } s, Dauer { $duration_s } s: beide müssen nicht negativ sein

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = schädlichstes angegebenes Q (cw): kein Tabellenwert für den Typ `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: die Kampagne ist nicht vollständig

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } stimmt nicht mit den Zellen überein ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = Aufzeichnung `{ $id }`: der Hash der Testbedingungen { $h } stimmt nicht mit dem aufgezeichneten { $conditions_hash } überein

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = Signal `{ $signal }`: unbekannte Chiprate

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = kein Lauf ist für die Lock-Anpassung verwendbar: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = unzureichende Daten: nicht angepasst ({ $m } Aufzeichnungen; mindestens { $min_rec } sind erforderlich)

engine-iq-labfit-iqfit-uncensored-span-db-is-under = die unzensierte J/S-Spanne { $span_db } dB liegt unter { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff und delta sind nicht getrennt identifizierbar (|corr| { $full } >= { $v2 }): das Modell hängt nur von delta - 10 log10 Q_eff ab

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed = nicht angepasst: { $n_reacq } Wiederakquisitionen beobachtet (mindestens 3 sind erforderlich)

engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = unbekannter Modus `{ $m }` (nur `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage muss [lower, upper] innerhalb von [0, 1] sein

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds muss [lower, upper] mit 0 < lower < upper sein

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db muss [lower, upper] sein

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = die Kampagne hat kein Ereignis mit angegebenem Leistungsprofil zur Anpassung

## src/iq/labfit/iqreport.rs

# legal: native review
engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Laboranpassung aus IQ-Kampagne: { $r }

    Schema `{ $schema }`, Engine { $engine_version }. Kennzeichnung: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = Kampagnen-DIGEST `{ $campaign_digest }`; `campaign.json` SHA-256 `{ $campaign_json_sha256 }`; Szenario-SHA-256 `{ $scenario_sha256 }`; { $cells } Zellen; { $bootstrap } Bootstrap-Replikate (Seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Einheit { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Status: { $status }. { $recordings } Aufzeichnungen, { $satellites } Satelliten, { $events } Ereignisse; { $bins_used } Klassen angepasst, { $bins_censored } zensiert.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0-Modell ({ $q_mode }): `delta_eff` = { $ci } dB (der identifizierbare Versatz, bezogen auf Q = 1); `Q_eff` = { $q }; `delta` bei diesem Q = { $ci2 } dB; corr(Q, delta) { $om }; Residuum-RMS { $residual_rms_db } dB über eine J/S-Spanne von { $span_db } dB. Q_eff ist aus C/N0-Daten ohne unabhängige Leistungsmessung nicht identifizierbar.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q auf seinem angegebenen Wert gehalten: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = Schwellen-J/S, direkt: Median { $om } dB über { $n } Verluste (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Hold-out (jeweils eine Aufzeichnung ausgelassen), Interpolation: { $bins } Klassen, C/N0-RMS { $om } dB, PI90-Abdeckung { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = ; { $model }: { $n } Ereignisse, Verlustzeit-RMS { $om } s, PI90-Abdeckung { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    SHA-256 der Validierungstabelle `{ $table_sha256 }` (registriert { $registered }):

    | Zielwert | Grenzwert | Wert | Befund |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = Lauf `{ $label }` Log

engine-e-iq-labfit-run = Lauf `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = das [input] des Szenarios nennt keine Kampagne

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign und [[runs]] schließen sich aus: geben Sie eines an

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit-Szenario: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = das Log enthält kein C/N0 je Satellit{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = keine Epoche vor dem Beginn bei { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = keine Epoche beim oder nach dem Beginn bei { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Laboranpassung: { $r }

    Kennzeichnung: **{ $label }**. Einstellungs-SHA-256 `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db = { "\u000A" }{ $n_samples } C/N0-Abtastwerte, Residuum-RMS { $om } dB.{ $r }{ "\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Modell: { $model } ({ $label })

    | Parameter | Wert | Grenzen | an der Grenze | Bootstrap-sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }Ereigniszeit-RMS { $om } s über { $n_events } Ereignisse; Verluste verpasst { $loss_missed } / zusätzlich { $loss_extra }, Wiederakquisitionen verpasst { $reacq_missed } / zusätzlich { $reacq_extra }.

    | Lauf | Abfall dB-Hz | Wieder-Lock dB-Hz | Ereignisse | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Hold-out ({ $scheme }, { $folds } Folds): alle { $om } s, Interpolation { $om2 } s, Extrapolation { $om3 } s.

    | zurückgehaltener Lauf | Klasse | Abstand | nächster Trainingslauf | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } ist für künftige Verwendung reserviert (nur FID 0 ist definiert)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } liegt außerhalb von 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } SB1-Symbol(e) weichen vom dekodierten Feld ab

engine-iq-lunanet-afs-frames-at-and-are-symbols = die Rahmen bei { $w } und { $w2 } sind { $gap } Symbole voneinander entfernt, nicht { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } folgt auf TOI { $w2 }, erwartet { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = unerwartetes Zeichen { $c } in einem Symbolstrom (nur 0, 1 und Leerraum)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: die ersten 24 Chips weichen ab

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: die letzten 24 Chips weichen ab

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (das Dokument gibt A14850 sowohl für PRN 147 als auch für PRN 151 an; der Generator reproduziert den Wert von PRN 151, daher ist der Eintrag für PRN 147 höchstwahrscheinlich ein Druckfehler im Dokument)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = kodiert 0x{ $word }, dekodiert FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = Monitor-Einstellungen: { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = die statische Position ist nicht endlich

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = die Trajektorie mit konstanter Geschwindigkeit ist nicht endlich

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = die Wegpunkttrajektorie hat keine Wegpunkte

engine-e-iq-scene-geometry-waypoint-not-finite = ein Wegpunkt ist nicht endlich

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = die Wegpunktzeiten müssen streng ansteigen

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } ist keine GPS-C/A-PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = das Ephemeridensystem { $system } ist nicht GPS

engine-e-iq-scene-satellite = Satellit { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = ist eine Pilotkomponente (ohne Daten) und trägt keine Navigationsdaten

engine-e-iq-scene-nav-carries-data-the-scene-does = trägt Daten, die die Szene nicht modelliert; erzeugen Sie es ohne Daten

engine-e-iq-scene-nav-does-not-carry-gps-lnav = trägt kein GPS LNAV (nur GPS L1 C/A tut dies); verwenden Sie Seed-Daten

engine-e-iq-scene-nav-not-an-lnav-source = keine LNAV-Quelle

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = eine Szene benötigt mindestens einen Satelliten (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler listet { $dopplers } Wert(e); geben Sie einen je --prn ({ $ids }) oder einen einzelnen Wert an

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = die Wahrheitszeile hat { $f } Felder, erwartet 10

engine-e-iq-scene-truth-truth-field = Wahrheitsfeld { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = Wahrheits-sat_id: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz muss eine positive Zahl sein

engine-e-iq-short-duration-must-be-in = duration_s muss in (0, { $MAX_DURATION_S }] liegen

engine-e-iq-short-ids-must-hold-to-satellites = ids muss 1 bis { $MAX_SATELLITES } Satelliten enthalten

engine-e-iq-short-dopplers-must-be-finite = dopplers muss endlich sein

engine-e-iq-short-samples-requested-short-run-holds = { $n } Abtastwerte angefordert; ein kurzer Lauf enthält höchstens { $MAX_SAMPLES }

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C Daten-PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C Pilot-PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } liegt außerhalb des Bereichs

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = der GLONASS-L1OF-Frequenzkanal { $id } liegt außerhalb von -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = unbekanntes Signal { $other }; erwartet wird eines von: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = Zeile { $v1 }: kein ';'

engine-e-iq-signals-galileo-line-no-code-number-in = Zeile { $v1 }: keine Codenummer in { $label }

engine-e-iq-signals-galileo-code-appears-twice = Code { $number } erscheint zweimal

engine-e-iq-signals-galileo-codes-the-icd-defines = { $path }: { $n } Codes, das ICD definiert { $CODES_PER_COMPONENT }

engine-iq-signals-galileo-galileo-e1-prn = Galileo E1-B PRN { $prn }

engine-iq-signals-galileo-galileo-e1-prn-2 = Galileo E1-C PRN { $prn }

engine-iq-signals-galileo-galileo-e5a-prn = Galileo E5a-I PRN { $prn }

engine-iq-signals-galileo-galileo-e5a-prn-2 = Galileo E5a-Q PRN { $prn }

## src/iq/signals/gps.rs

engine-iq-signals-gps-gps-l1cd-prn = GPS L1CD PRN { $prn }

engine-iq-signals-gps-gps-l1cp-prn = GPS L1CP PRN { $prn }

engine-iq-signals-gps-gps-l5-i5-prn = GPS L5 I5 PRN { $prn }

engine-iq-signals-gps-gps-l5-q5-prn = GPS L5 Q5 PRN { $prn }

engine-iq-signals-gps-gps-l2-cm-prn = GPS L2 CM PRN { $prn }

engine-iq-signals-gps-gps-l2-cl-prn = GPS L2 CL PRN { $prn }

engine-iq-signals-gps-gps-l2c-prn = GPS L2C PRN { $prn }

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-prn = LunaNet AFS-I PRN { $prn }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q Primärcode { $primary_prn } S{ $secondary } Tertiärcode { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q Primärcode { $primary_prn } S{ $secondary } (Tertiärcode weggelassen)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = nicht hexadezimales Zeichen { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } Hex-Symbole können nicht genau { $len } Chips aufnehmen

engine-iq-signals-primary-only = { $name } (nur Primärcode)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC-Tracking benötigt einen Early-Late-Abstand in (0, { $max }) Chips, damit E und L auf dem Hauptmaximum bleiben (erhalten: { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = die Bump-Jump-Schwelle muss mindestens 1 betragen

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = die Abtastrate muss positiv sein

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods muss positiv sein

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows muss positiv sein

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } muss die Bitlänge { $ppb } teilen

engine-e-iq-track-channel-at-most-extra-taps-are = höchstens { $MAX_EXTRA_TAPS } zusätzliche Abgriffe werden unterstützt (erhalten: { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = die Offsets zusätzlicher Abgriffe müssen endlich sein und innerhalb von ±{ $MAX_TAP_OFFSET_CHIPS } Chips liegen (erhalten: { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = ein C/N0-Fenster benötigt mindestens 2 Prompts

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: erwartet wird atan2, costas-atan oder costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: erwartet wird cross-product, atan2 oder atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: erwartet wird pull-in oder always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: erwartet wird eml-power, dot-product oder eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: erwartet wird pll, fll oder fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } gilt nicht für carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: erwartet wird eine Zahl >= 0 (0 deaktiviert die Begrenzung)

engine-e-iq-track-design-must-be-positive-number-got = { $k } muss eine positive Zahl sein (erhalten: { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods muss mindestens 1 betragen

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips muss in (0, 2] liegen (erhalten: { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips enthält höchstens { $MAX_EXTRA_TAPS } Offsets (erhalten: { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = die Offsets von integration.extra_taps_chips müssen endlich sein und innerhalb von ±{ $MAX_TAP_OFFSET_CHIPS } Chips liegen (erhalten: { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) muss unter carrier.fll_off_pli ({ $off }) liegen, beide in (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s muss null oder positiv sein (erhalten: { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s muss positiv sein (erhalten: { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order muss 1, 2 oder 3 sein (erhalten: { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order muss 1 oder 2 sein (erhalten: { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order muss 1 oder 2 sein (erhalten: { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold muss in [-1, 1] liegen (erhalten: { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows muss mindestens 1 betragen

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods muss mindestens 2 betragen

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) darf nicht unter lock.reacq_interval_s ({ $reacq_interval_s }) liegen

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db muss endlich sein

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes muss mindestens 1 betragen

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods muss mindestens 1 betragen (oder "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent muss mindestens 1 betragen

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa muss in (0, 1) liegen (erhalten: { $pfa })

engine-e-iq-track-design-design-overrides = Entwurfsüberschreibungen: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = Entwurfsüberschreibungen dürfen weder name noch extends setzen

engine-e-iq-track-design-loop-design-file = Schleifenentwurfsdatei: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = Schleifenentwurfsdatei: Schema { $other } wird nicht unterstützt; erwartet wird { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = Schleifenentwurfsdatei: schema = { $SCHEMA } fehlt

engine-e-iq-track-design-loop-design-file-no-design = Schleifenentwurfsdatei: keine [[design]]-Tabellen

engine-e-iq-track-design-loop-design-file-design-number = Schleifenentwurfsdatei: [[design]] Nummer { $v1 } hat keinen Namen

engine-e-iq-track-design-loop-design-file-design-name = Schleifenentwurfsdatei: der Entwurfsname { $name } ist reserviert oder leer

engine-e-iq-track-design-loop-design-file-design-is = Schleifenentwurfsdatei: der Entwurf { $name } ist doppelt definiert

engine-e-iq-track-design-no-design-named-the-file = kein Entwurf namens { $n }; die Datei enthält { $value }

engine-e-iq-track-design-loop-design-file-design-extends = Schleifenentwurfsdatei: der Entwurf { $name } erweitert sich selbst (ein Zyklus)

engine-e-iq-track-design-loop-design-file-design-extends-2 = Schleifenentwurfsdatei: der Entwurf { $name } erweitert den unbekannten Entwurf { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = die Phasenschleife benötigt Ordnung 1..=3 und Bn > 0 (erhalten: { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = die Frequenzschleife benötigt Bn > 0 (erhalten: { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = die Ordnung der Frequenzschleife muss 1 oder 2 sein (erhalten: { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = ein Schleifenfilter benötigt einen Phasenpfad, einen Frequenzpfad oder beides

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = der Early-Late-Abstand muss in (0, 2] Chips liegen (erhalten: { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = die DLL-Ordnung muss 1 oder 2 sein (erhalten: { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = Chiprate und Trägerfrequenz müssen positiv sein

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = eine Epoche enthält { $extra } zusätzliche Abgriffe, die Ausgabe wurde aber für { $n } eingerichtet: alle Kanäle eines Laufs müssen dasselbe extra_taps_chips verwenden

engine-e-iq-track-sink-record-is-bytes-expected = ein Satz umfasst { $b } Bytes; erwartet werden { $want }

engine-e-iq-track-sink-unknown-lock-state-code = unbekannter Lock-Zustandscode { $b }

engine-e-iq-track-sink-epoch-file-header = Header der Epochendatei: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = Schema der Epochendatei { $schema }; erwartet wird { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = die Sätze der Epochendatei umfassen { $record_bytes } Bytes; dieser Leser erwartet { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } je zusätzlichem Abgriff)

engine-e-iq-track-sink-epoch-file-ends-inside-record = die Epochendatei endet mitten in einem Satz ({ $got } von { $size } Bytes)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = Epochenformat { $o }: erwartet wird csv, jsonl oder bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` ist keine Zahl

engine-e-jammertest-cli-is-not-utf-text = { $path } ist kein UTF-8-Text

engine-e-jammertest-cli-needs-catalog = benötigt --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = benötigt mindestens einen --plan

engine-e-jammertest-cli-is-not-utf = { $cat } ist kein UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } ist kein UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` ist keines von ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` ist kein UTC-ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = benötigt --log-start oder --log mit --format

engine-e-jammertest-cli-log-needs-format = --log benötigt --format

engine-e-jammertest-cli-the-log-does-not-state = das Log gibt seine Startzeit nicht an: verwenden Sie --log-start

engine-e-jammertest-cli-the-log-states-its-start = das Log gibt seinen Start als `{ $label }` an: verwenden Sie --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } ist kein UTF-8

engine-e-jammertest-cli-cannot-write = { $o } kann nicht geschrieben werden: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } { $SCHEDULED_TRUTH }-Ereignisse nach { $o } geschrieben ({ $skipped_non_rf } Nicht-HF-Slots übersprungen, { $outside_log } außerhalb des Logs, { $unknown_ids } IDs nicht im Katalog)

engine-jammertest-cli-note-ids-not-in-the = Hinweis: IDs, die nicht im Katalog stehen: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = Hinweis: Dies sind die geplanten Slots des Plans, keine aufgezeichneten Sendezeiten.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  Testname

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } Tests, { $evaluable } auswertbar: { $detected } innerhalb der Toleranz erkannt, { $late } verspätet, { $missed } verpasst; mediane Latenz { $fmt_opt }, mediane Erholungszeit { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = Fehlalarme außerhalb aller Slots: { $false_alarm_runs } Läufe, { $false_alarm_epochs } von { $clean_epochs } ungestörten Epochen

engine-e-jammertest-cli-needs-session-path = benötigt einen Sitzungspfad

engine-e-jammertest-cli-needs-catalog-and-plan-or = benötigt --catalog und --plan oder --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = Nachweispaket nach { $out } geschrieben; Fingerabdruck des Unterzeichners { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = kein Ordner mit einer scenario.json und einer .ubx unter { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = Szenario: { $e }

engine-e-jammertest-dataset-read = Lesen: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json enthält kein Datum

engine-e-jammertest-dataset-scenario-json-date-is-not = das Datum `{ $date }` in scenario.json ist kein Datum

engine-e-jammertest-dataset-no-readable-epoch-in-mon = keine lesbare Epoche in mon_rf.csv oder rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = kein Ordner mit einer scenario.json unter { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } erholt ({ $recovered } von { $alarmed }), Median { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = das Log gibt seinen Start als `{ $l }` an, was kein UTC-ISO-8601 ist: geben Sie den Start ausdrücklich an

engine-e-jammertest-the-log-does-not-state = das Log gibt seine Startzeit nicht an: geben Sie sie ausdrücklich an

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = der Katalog ist kein JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = der Katalog hat kein Array `test_types`

engine-e-jammertest-plan-test-type-has-no-type = ein Testtyp hat keine `type_id`

engine-e-jammertest-plan-test-group-has-no-group = eine Testgruppe hat keine `group_id`

engine-e-jammertest-plan-test-has-no-test-id = ein Test hat keine `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = der Katalog enthält keine Tests

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` ist keine Planzeit wie 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = der Plan ist kein JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = der Plan hat kein Array `locations`

engine-e-jammertest-plan-test-end-time-is-not = Test { $id }: end_time liegt nicht nach start_time

engine-e-jammertest-plan-the-plan-has-no-test = der Plan hat kein Testgebiet { $l }; er hat { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = der Plan hat mehrere Testgebiete { $areas }; geben Sie an, in welchem das Log aufgezeichnet wurde

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json ist kein JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = kein Array `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024 Test { $id } Fenster { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = das attack_log enthält kein Start-/Endfenster

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } geplante Ereignisse, der Lauf bewertete aber { $events2 }: übergeben Sie die eigenen Ereignisse des Laufs

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s muss positiv und guard_s darf nicht negativ sein

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m muss mindestens ein Element aufführen

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m muss endlich sein

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: erwartet wird "null-steering" oder "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz muss positiv sein (erhalten: { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: der Abschnitt benötigt einen [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) muss endlich sein und mindestens tracking_threshold_dbhz ({ $tracking_threshold_dbhz }) betragen

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s muss endlich und nicht negativ sein (erhalten: { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits muss 1 bis 16 sein (erhalten: { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz muss positiv sein (erhalten: { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side muss mindestens 2 betragen (erhalten: { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } muss endlich sein (erhalten: { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } muss positiv sein (erhalten: { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: der Profilpunkt { $points } ({ $lat }, { $lon }) liegt außerhalb der DEM-Kachel

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: der Profilpunkt { $points } ({ $lat }, { $lon }) liegt auf einer DEM-Lücke

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC-Kalenderdatum außerhalb des Bereichs: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = kein solches Kalenderdatum: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC-Sekunde { $second } außerhalb des Bereichs bei { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = ein Startplatz am Pol hat kein definiertes Azimut

engine-e-launch-inclination-unreachable-from-latitude-without = Inklination { $inclination_rad }° ist von der Breite { $lat_rad }° aus ohne Dogleg nicht erreichbar (erforderlich: |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = die Standortgeschwindigkeit am wahren Pol benötigt sowohl `epoch` als auch `eop_finals2000a` (einen echten IERS-finals2000A-Inhalt)

engine-e-launch-site-lon-deg-must-be = site_lon_deg muss in [-180, 360] liegen

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a enthielt keine lesbaren IERS-finals2000A-Zeilen

engine-e-launch-epoch-mjd-is-outside-the = Epoche { $epoch } (MJD { $mjd_utc }) liegt außerhalb der gelieferten EOP-Zeilen (MJD { $mjd } bis { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg muss in [-90, 90] liegen

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg muss in [0, 180] liegen

engine-launch-launch-window-lat-az-asc = launch-window: Breite { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° aufst., v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s Bonus durch die Erdrotation, { $opportunities } Gelegenheiten/Tag (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = jede Entfernungsrate benötigt ein positives, endliches Sigma

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = { $n_meas } Messungen können { $n } Doppler-Unbekannte nicht auflösen

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = die Doppler-Geometrie ist singulär

engine-e-leo-fusion-doppler-no-covariance = keine Kovarianz

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = jede Pseudoentfernung benötigt ein positives, endliches Sigma

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = { $obs } Pseudoentfernungen können { $n } Unbekannte nicht auflösen (3 Position + { $n_clock } Uhren)

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = ein Satellit fällt mit der geschätzten Position zusammen

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = die Geometrie ist singulär

engine-e-leo-fusion-joint-pvt-no-iteration-ran = es lief keine Iteration

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = entartete Endgeometrie

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = der DOP ist nicht endlich

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } muss positiv sein

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m muss nicht negativ sein und der Lauf höchstens 5000 Epochen umfassen

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = jedes Signal benötigt eine positive Bandbreite

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz = 5G-NTN-Positionierung bei { $r } MHz, C/N0 { $r2 } bis { $r3 } dB-Hz, { $n_satellites } Satelliten ({ $mean_in_view } in Sicht){ "\u000A" }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, CRB-Entfernung { $range_sigma_zenith_m } bis { $range_sigma_mask_m } m; mediane formale 3D-Abweichung { $s2 } m, RMS-Fehler { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples = { "  " }Doppler-Überflug mit einem Satelliten: { $n_obs } Abtastwerte über { $duration_s } s, Horizontalfehler { $horizontal_error_m } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP benötigt mindestens ein System

engine-e-leo-fusion-ppp-duration-and-step-must-be = Dauer und Schrittweite müssen positiv sein, mit höchstens 20000 Epochen

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs muss 1 bis 200 sein

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = die Konvergenzschwellen müssen positiv sein

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical = PPP-Konvergenz auf { $criterion_horizontal_m } m horizontal / { $criterion_vertical_m } m vertikal, { $runs_per_case } Läufe je Fall, { $n_gnss } GNSS-Satelliten{ "\u000A" }

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  Median { $c } min  konvergiert { $v4 }%  NEES-Mittel { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = medianer Horizontalfehler über { $runs_per_case } Läufe · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = das Preset { $id } enthält kein Signal

engine-e-leo-fusion-presets-preset-has-no-signal-it = das Preset { $id } hat kein Signal { $n }; es hat { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = unbekanntes LEO-Preset { $id }; bekannt: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s und step_s müssen positiv sein, mit höchstens 20000 Epochen

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = die Polar-Schritte müssen positiv sein

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode muss doppler, joint, polar oder timing sein; erhalten: { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = der Modus doppler benötigt mindestens ein LEO-System

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = der Modus timing benötigt ein LEO-System mit Codeentfernungsmessung

engine-e-leo-fusion-pvt-kind-unknown-clock-class = unbekannte Uhrenklasse { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO-PVT ({ $mode }) bei { $user_lat_deg }, { $user_lon_deg } über { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } Sats in { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites = { "  " }Doppler-Fix: { $n_obs } Messungen von { $n_sats } Satelliten, 3D-Fehler { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }Fenster { $window_s } s: { $n_sats } Sats, 3D-Fehler { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } Zenitüberflug: max. Doppler { $max_doppler_hz } Hz, Rate { $max_doppler_rate_hz_s } Hz/s, Ruck { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }LEO-Entfernungsmesssatellit in Sicht bei { $v1 }% der Epochen{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } Verfügbarkeit { $availability }, medianer PDOP { $f }, RMS-3D-Fehler { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }Breite { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } fusioniert { $f3 }; in Sicht { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, max. { $row3 } ns (in Sicht { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO-PVT — Modus { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = System { $name }: role muss gnss oder leo sein, erhalten: { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = System { $name }: clock muss estimated oder known sein, erhalten: { $c }

engine-e-leo-fusion-system-system-must-be-positive = System { $name }: { $what } muss positiv sein

engine-e-leo-fusion-system-system-mask-deg-must-be = System { $name }: mask_deg muss in [0, 90) liegen

engine-e-leo-fusion-system-system-sigma-pr-must-be = System { $name }: sigma_pr_m muss positiv sein

engine-e-leo-fusion-system-give-at-least-one-system = geben Sie mindestens ein [[system]] an

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = der Epochenabstand muss positiv sein

engine-e-leo-fusion-timing-no-epochs = keine Epochen

engine-e-leo-fusion-timing-no-satellite-was-ever-in = kein Satellit war je in Sicht: der Empfänger hat nie die Zeit erfasst

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = die Polarisation muss rhcp, lhcp oder linear sein; erhalten: '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4-Fehlercode { $code } bei t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = eine um { $inc } deg geneigte Bahn überfliegt nie die Breite { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = die angeforderte maximale Elevation liegt unterhalb der Horizontreichweite

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = die Gebäudeklasse muss traditional oder thermally-efficient sein; erhalten: '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = das Feld { $name } ist nicht endlich

engine-e-leo-navmsg-codec-field-is-outside-its-bit = das Feld { $name } = { $value } { $unit } liegt außerhalb seines { $bits }-Bit-Bereichs (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = Nachricht abgeschnitten

engine-e-leo-navmsg-codec-field-list-exhausted = Feldliste erschöpft

engine-e-leo-navmsg-codec-field-order-mismatch-vs = Feldreihenfolge stimmt nicht überein: { $name } gegenüber { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID muss 1-255 sein

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = jedes Korrekturpolynom benötigt 1-8 Koeffizienten

engine-e-leo-navmsg-codec-correction-time-scale-must-be = die Zeitskala der Korrektur muss eine Zweierpotenz von 1 s bis 32768 s sein; erhalten: { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = das ECEF-Polynom benötigt 1-11 Koeffizienten, je Achse gleich viele

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = der Grad { $v1 } des ECEF-Polynoms überschreitet 10

engine-e-leo-navmsg-codec-unknown-model-id = unbekannte Modell-ID { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = die Nutzlast überschreitet 4095 Bytes

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = der Frame ist kürzer als Header und CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = ungültige Präambel 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = nicht unterstützte Version { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = die Frame-Länge { $frame } passt nicht zur angegebenen Nutzlast von { $len } Bytes

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q stimmt nicht überein: berechnet 0x{ $crc }, Frame enthält 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees dürfen jeweils höchstens 7 sein; erhalten: { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree muss 1-10 sein; erhalten: { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = unbekanntes Ephemeridenmodell '{ $other }': verwenden Sie kepler16, kepler-rac, liu22 oder ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = das Fit-Intervall muss mindestens 10 s betragen; erhalten: { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = das Fit-Fenster [{ $t0 }, { $v1 }] s liegt außerhalb des Referenzbogens [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = der ECEF-Polynom-Fit ist singulär (zu wenige Abtastwerte für den Grad)

engine-e-leo-navmsg-fit-clock-fit-is-singular = der Uhren-Fit ist singulär

engine-e-leo-navmsg-fit-keplerian-fit-diverged = der Kepler-Fit ist divergiert

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = unbekanntes Preset '{ $k }'; verfügbar: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s muss 10-3600 s sein und update_period_s in (0, fit_interval_s] liegen; erhalten: { $fit_interval_s } und { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s und eval_step_s müssen 0.5-60 s sein

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz muss 10 MHz überschreiten; erhalten: { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid muss 1-255 sein

engine-e-leo-navmsg-band-must-be-15-and = band muss 0-15 und health 0-3 sein

engine-e-leo-navmsg-unknown-csv-schema = unbekanntes csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis muss mindestens eine Analyse benennen

engine-e-leo-navmsg-unknown-analysis-use = unbekannte Analyse '{ $a }'; verwenden Sie { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind muss leo-navmsg sein; erhalten: { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg muss in [0, 60) liegen; erhalten: { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO-Navigationsnachricht — { $res } km, { $res2 } deg, Gravitationsgrad { $gravity_degree }, Modell { $res3 }
    { "  " }SISRE-Gewichte: w_R { $w_r }, w_AC^2 1/{ $v6 } (Maske { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s muss 60-86400 s sein

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s darf nicht leer sein, jeweils 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }Abwägung des Fit-Intervalls über { $span } s (Nutzungsdauer = Fit-Intervall):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE-Bahn-RMS { $sisre_orb_rms_m } m  max. { $sisre_orb_max_m } m  mit Uhren-RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s darf nicht leer sein, jeweils 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s muss 60-86400 s sein

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } Parameter  SISRE-Bahn-RMS { $sisre_orb_rms_m } m  mit Uhr { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = kein Überflug über { $mask } deg für den Nutzer bei { $lat }, { $lon } innerhalb von { $search } s; erweitern Sie midpass.search_s oder verlegen Sie den Nutzer

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }Update mitten im Überflug: Überflug { $p0 }-{ $p1 } s (max. Elevation { $pmax } deg), { $switches } Wechsel, größter Sprung der Nutzerentfernung { $max_jump } m (ungünstigste Geometrie { $max_worst } m) gegenüber Schwelle { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }Kodieren-Dekodieren: Modell { $m }, Frame { $frame } Bytes ({ $payload_bits } Nutzlast-Bits, { $eph_bits } Ephemeriden-+Uhren-Bits), CRC-24Q 0x{ $hex }
    { "    " }Quantisierung: größte Positionsänderung { $v6 } mm, Uhr { $v7 } mm; SISRE exakt { $acc_exact } m, quantisiert { $acc_q } m
    { "    " }beschädigter Frame abgewiesen: { $corrupted_rejected }; RINEX-Round-trip { $rin_dp } m; CSV-Round-trip { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs muss 1-20 sein

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  veröffentlicht { $published } m  Verhältnis { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = Der Kepler-Satz mit 16 Parametern verschlechtert sich von { $a } m bei { $lo } s auf { $b } m bei { $hi } s: Ein Kepler-Satz mit Harmonischen der doppelten Umlauffrequenz kann den höherfrequenten Gravitationstermen und dem Luftwiderstand eines LEO-Bogens nur wenige Minuten lang folgen, und sein Residuum der kleinsten Quadrate schwingt über das Fenster. Die Polynome in Along-, Cross- und Radial-Richtung, deren Grad höher ist als der vom Kepler-Satz abgedeckte, nehmen den Rest auf und ergeben { $c } m bei { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = Der Kepler-Satz mit 16 Parametern geht von { $a } m bei { $lo } s auf { $b } m bei { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, Gravitationsgrad { $gravity_degree } · Darstellungsfehler gegenüber der Referenz · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` gehört zur Bibliothek des Hosts

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: `rand_distr`-Sampler rufen in ihren seltenen Zweigen das `exp` und `ln` des Hosts auf; verwenden Sie `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` ist das Gravitationsfeld der Host-Bibliothek; verwenden Sie `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` wurde nicht geprüft

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = keine END-OF-HEADER-Zeile

engine-e-leo-navmsg-text-expected-eph-record-header-got = erwartet wird ein '> EPH'-Satzkopf, erhalten: { $head }

engine-e-leo-navmsg-text-bad-satellite-id = ungültige Satelliten-ID { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = Epochenzeile fehlt

engine-e-leo-navmsg-text-bad-epoch-line = ungültige Epochenzeile { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = ungültiges Epochenfeld in { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = die Epochenzeile benötigt drei Uhrenterme: { $ep }

engine-e-leo-navmsg-text-record-truncated = Satz abgeschnitten

engine-e-leo-navmsg-text-unknown-record-type = unbekannter Satztyp { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = die CSV-Tabelle enthält kepler16- und kepler-rac-Nachrichten; erhalten: { $m }

engine-e-leo-navmsg-text-empty-csv = leere CSV

engine-e-leo-navmsg-text-row-has-cells-header = die Zeile hat { $cells } Zellen, der Header { $header }

engine-e-leo-navmsg-text-bad-number-in-column = ungültige Zahl { $c } in Spalte { $k }

engine-e-leo-navmsg-text-csv-row-lacks = der CSV-Zeile fehlt { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = die Bahnhöhe muss zwischen 100 km und 3000 km liegen; erhalten: { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = die Exzentrizität muss für einen LEO-Fit in [0, 0.1) liegen; erhalten: { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = die Integrationsschrittweite muss in (0, 30] s liegen; erhalten: { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = die Dauer muss positiv sein, mit höchstens 200000 Schritten; erhalten: { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree muss 0, 2-6 (zonal) oder 7-{ $v1 } (EGM2008) sein; erhalten: { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = die Propagation der Referenz ist divergiert

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = die Referenzbahn ist unter 80 km abgesunken

engine-e-leo-navmsg-truth-node-spacing-must-be-in = der Knotenabstand muss in (0, 60] s liegen; erhalten: { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = eine tabellierte Referenzbahn benötigt mindestens zwei Zustände; erhalten: { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = der Zustand { $k } ist nicht endlich

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = adev_1s der Uhr muss in [0, 1e-6) liegen; erhalten: { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = eine gemessene Uhr wird mit TruthClock::from_samples erstellt

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = eine gesteuerte Uhr benötigt sigma_s in [0, 1e-3) und tau_s > 0; erhalten: { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = eine gemessene Uhr benötigt eine positive Schrittweite und mindestens zwei Abtastwerte

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = ein Abtastwert der gemessenen Uhr ist nicht endlich

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = Epoche '{ $s }' ist nicht YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = Epoche '{ $s }' ist nicht YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = Epoche '{ $s }' hat ein ungültiges Sekundenfeld

engine-e-leo-pass-epoch-is-out-of-range = Epoche '{ $s }' liegt außerhalb des Bereichs

engine-e-leo-pass-band-unknown-signal-design-public = Band '{ $name }': unbekannter Signalentwurf '{ $n }'; öffentliche Entwürfe: { $v2 }

engine-e-leo-pass-band-is-not-in-the = Band '{ $name }' ist nicht im Systempreset enthalten: geben Sie frequency_mhz und eirp_dbw an

engine-e-leo-pass-band-needs-eirp-dbw = Band '{ $name }' benötigt eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern muss isoflux, gaussian oder flat sein; erhalten: '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = die Frequenz von Band '{ $name }' liegt außerhalb des Bereichs

engine-leo-pass-overridden-in-the-scenario = { $source } (im Szenario überschrieben)

engine-e-leo-pass-system-has-no-band = System '{ $id }' hat kein Band '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = ein LEO-Satellit benötigt mindestens ein Band

engine-e-leo-pass-at-most-12-bands-per = höchstens 12 Bänder je Satellit

engine-leo-pass-unknown-system-presets-in-this = unbekanntes System '{ $n }'; Presets in diesem Build: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = keine sonnensynchrone Bahn bei { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (höchstens 86400) und step_s müssen positiv sein, mit höchstens 20000 Epochen; erhalten: { $duration } und { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO-Satellit, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = die `epoch` { $epoch } des Szenarios, als UTC gelesen

engine-leo-pass-the-kind-default-epoch-utc = die Standardepoche der Art { $epoch } UTC (das Szenario gibt keine an)

engine-e-leo-pass-user-environment-must-be-ground = user.environment muss ground, maritime, air oder indoor sein; erhalten: '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg muss innerhalb von +/-90 liegen

engine-e-leo-pass-user-speed-must-be-to = die Nutzergeschwindigkeit muss 0 bis 3000 m/s und die Höhe -500 bis 100000 m betragen

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna muss patch, hemispherical oder isotropic sein; erhalten: '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability muss in (0, 1) liegen

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model muss klobuchar, vtec oder none sein; erhalten: '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction muss ascending oder descending sein; erhalten: '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = Satellit { $id }: ungültige Exzentrizität oder ungültiges Perigäum

engine-e-leo-pass-satellite-tle-needs-tle-line1 = Satellit { $id }: tle benötigt tle_line1 und tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit muss pass, elements oder tle sein; erhalten: '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation benötigt ein System oder einen Entwurf

engine-e-leo-pass-no-sun-synchronous-inclination = keine sonnensynchrone Inklination

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: höchstens 5000 Satelliten

engine-e-leo-pass-no-leo-satellite-rises-above = kein LEO-Satellit steigt im Fenster über die Maske

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s muss in (0, 3600] liegen

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' ist kein Band eines LEO-Satelliten ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = kein GNSS-Signal '{ $bname }' für die Konstellation '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = leere GNSS-Konstellation

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' sind nicht zwei verschiedene Bänder von { $id }

engine-e-leo-pass-iot-powers-and-battery-must = IoT-Leistungen und Batterie müssen positiv sein

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from muss median oder peak sein; erhalten: '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = Detektionsschwelle { $detection_snr_db } dB nach der Integration

engine-leo-pass-coherent-integration-at-most-ms = kohärente Integration höchstens { $rx } ms, begrenzt durch die Doppler-Rate

engine-leo-pass-serial-search-with-correlators = serielle Suche mit { $correlators } Korrelatoren

engine-leo-pass-hot-start-doppler-known-to = Hot Start: Doppler bekannt auf +/-{ $aided } Hz, Ephemeride gültig

engine-leo-pass-leo-pass-link-budget-user = LEO-Überflug-Link-Budget, Nutzer ({ $environment }) bei { $lat_deg }, { $lon_deg }; { $satellites } LEO-Satellit(en), Fenster von { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, max. Elevation { $max_elevation_deg } deg bei { $tca_s } s, { $duration_above_mask_s } s über der Maske{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 Spitze { $opt } Median { $opt2 }; |Doppler| max. { $opt3 }; Iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: { $satellites_in_view } in Sicht, C/N0 { $opt } bis { $opt2 } (Median { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } Spitze { $leo_peak_cn0_dbhz } dB-Hz liegt { $leo_peak_above_gnss_median_db } dB über dem GNSS-Median; über dem stärksten GNSS-Träger für { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: Kaltstart-TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), Hot { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer ab { $onset_s } s (Sprung { $offset_m } m, Schub { $push_rate_m_s } m/s): Doppler-Test GNSS { $t }, LEO { $t2 }, fusioniert { $t3 }; Cross-Band { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = Nutzer ({ $environment }) · LEO-Spitze { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB über dem GNSS-Median · MODELLED

engine-leo-pass-user-modelled = Nutzer ({ $environment }) · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler des ersten Bandes jedes LEO-Satelliten (±{ $v1 } kHz Vollausschlag)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = ungültige [{ $what }]-Tabelle: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' steht weder in [signal] noch ist es ein öffentlicher Entwurf ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' hat keine codegetrackte Komponente und liefert daher keine Pseudoentfernung

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind muss leo-pnt-chain sein; erhalten: { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = die getrackte Komponente hat keine Chiprate

engine-e-leo-pnt-chain-no-band-of-pass-names = kein Band von [pass] nennt signal = "{ $name }"; die Kette benötigt eines, das den Entwurf trägt

engine-e-leo-pnt-chain-the-pass-gives-no-code = der Überflug liefert keinen Code-Jitter

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m muss in [0, 100] m liegen; erhalten: { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] muss mode = "joint" ausführen; erhalten: { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = getracktes C/N0 an der Maske von { $mask } deg (Geradenfit über den Sinus der Elevation)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] hat kein LEO-System, das die Werte der Kette aufnimmt

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] hat keinen joint-Block erzeugt

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT-Kette: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }Signal { $name2 } ({ $design }), getrackt { $design2 } bei { $v4 } Mchip/s, C/N0-Offset { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }Überflug { $id } { $sat } km: getrackte C/N0-Spitze { $peak_tracked_cn0_dbhz } dB-Hz, Code-Jitter-Median { $jitter_median } m; C/N0-Gerade { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }Nachricht { $res } { $fit_interval_s } s Fit / { $update_period_s } s Update: Darstellungs-SISRE { $stats } mm RMS (Bahn { $stats2 } mm), mit { $od } m Bahnbestimmung: { $sisre } m weitergereicht{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }fusionierter Fix: nur GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP-Konvergenz: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } zwischen den Stufen weitergereichte Werte. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Code-Tracking-Jitter, der Entfernungsmessfehler (m, 0 bis { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · nur GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = Modulation { $label }: die Breite muss positiv sein

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = unbekanntes Signalpreset { $name }: die Bibliothek enthält { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = Preset { $name }: ungültige Preset-Datei: { $e }

engine-e-leo-signal-preset-file-names-itself = die Preset-Datei { $name } nennt sich selbst { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz muss positiv sein

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz muss positiv sein

engine-e-leo-signal-signal-needs-at-least-one = { $name }: ein Signal benötigt mindestens eine Komponente

engine-e-leo-signal-component-power-fraction-must-be = { $name }: power_fraction der Komponente { $v1 } muss positiv sein

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: die Komponente { $v1 } hat fdma_shares, aber keine fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: fdma_shares der Komponente { $v1 } müssen positiv sein und sich zu eins summieren

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: die Komponente { $v1 } benötigt je Offset einen fdma_share

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps muss positiv sein

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips muss positiv sein

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: die Leistungsanteile der Komponenten summieren sich zu { $total }, nicht zu 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km muss positiv sein

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: eine flache (OFDM-artige) Komponente kann im Spektrummodell nicht platziert werden

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: die verfolgte Komponente liegt auf FDMA-Unterträgern; das Spektrummodell verfolgt eine Komponente in der Bandmitte

engine-e-leo-signal-signal-is-given-twice = Signal { $w } wurde doppelt angegeben

engine-e-leo-signal-signals-is-more-than-the = { $out } Signale sind mehr als die erlaubten 24

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s muss unter 1 liegen

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: geben Sie 1 bis 40 cn0_dbhz-Werte an

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 und slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points muss zwischen 21 und 2001 liegen

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: verwenden Sie "coherent" oder "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = die Systemrauschtemperatur muss positiv sein

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: unbekanntes GNSS-Signal { $n } (bekannt: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } ist kein Szenariosignal

engine-e-leo-signal-shape-check-signal-is-not = Formprüfung: Signal { $signal } ist nicht im Szenario enthalten

engine-leo-signal-scenario-leo-signal-signals-noise = Szenario leo-signal | { $runs } Signale | Rauschteppich { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = links: bandbegrenzte PSD jedes Entwurfs (dB unter der Spitze, über sein Sendeband); rechts: Code-Jitter gegenüber dem gesamten C/N0 bei { $reference_spacing_chips } Chip Abstand

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = unbekanntes Band '{ $other }' (erwartet wird s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km muss endlich und positiv sein

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps muss endlich und positiv sein

engine-e-linkbudget-other-losses-db-must-be = other_losses_db muss endlich und >= 0 sein

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k muss, wenn angegeben, endlich und positiv sein

engine-linkbudget-link-budget-band-km-bit = link-budget: { $value }-Band, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, Marge { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = auf { $addr } kann nicht gelauscht werden: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: lauscht auf tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp-Client verbunden

engine-live-io-kshana-live-warning-is-not = kshana live: Warnung: { $addr } ist keine Loopback-Adresse; jeder, der sie erreichen kann, kann den Datenstrom lesen

engine-e-live-io-cannot-open = { $spec } kann nicht geöffnet werden: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: ein tcp-Client, der nicht mithalten konnte, wurde getrennt

engine-e-live-io-cannot-open-2 = { $path } kann nicht geöffnet werden: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: Warnung: { $addr } ist keine Loopback-Adresse; jeder, der sie erreichen kann, kann dieser Schicht einen Datenstrom senden

engine-e-live-io-cannot-bind-udp = udp { $addr } kann nicht gebunden werden: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: lauscht auf udp { $addr }

engine-e-live-io-cannot-connect-to = Verbindung zu { $addr } nicht möglich: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: mit tcp { $addr } verbunden

engine-live-io-kshana-live-reading-serial-at = kshana live: liest seriell { $path } mit { $baud } Baud (nur lesend)

engine-live-io-the-was-closed-by-the = { $v1 } wurde von der Gegenstelle geschlossen (die Schicht verbindet sich nicht neu: betreiben Sie sie unter einem Supervisor, der sie neu startet)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: verwenden Sie 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 oder 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } ist kein serielles Gerät (tcgetattr fehlgeschlagen)

engine-e-live-io-cannot-set-baud = { $baud } Baud können nicht eingestellt werden

engine-e-live-io-cannot-set-the-line-mode = der Zeilenmodus von { $path } kann nicht eingestellt werden

engine-e-live-io-serial-is-supported-on-unix = --serial wird nur unter Unix unterstützt; verwenden Sie --file, --tcp oder --stdin

engine-live-io-unknown-option = unbekannte Option { $s }

engine-live-io-cannot-read = { $session } kann nicht gelesen werden: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: Schiffsplattform, Kalibrierung für { $calibration_s } s; Gate { $v2 }. Beratende Software, keine typzugelassene Navigationsausrüstung: Der Betreiber bleibt verantwortlich.

engine-live-io-write-failed = Schreiben fehlgeschlagen: { $e }

engine-live-io-kshana-live-dropped-udp-datagram = kshana live: { $n } udp-Datagramm(e) verworfen, die die Engine nicht aufnehmen konnte ({ $udp_dropped } insgesamt)

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS-PRN { $prn } liegt außerhalb von 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = Einfügeindex { $p } außerhalb von 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = die Dateien von Anhang 3 enthalten { $gold } und { $ter } Codes, erwartet werden 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Anhang 3, AFS-I-PRN { $v1 } ist kein Gold-Code aus g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = der Sekundärcode S{ $id } existiert nicht (S0 bis S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 weist nur den Knotenkennungen 1 bis 12 Codes zu, nicht { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } passt nicht in zwei Bit (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } außerhalb von 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = { $SB1_SYMBOLS } Symbole von Subframe 1 erwartet

engine-e-lunar-afs-frame-subframe-data-lengths-expected = Datenlängen der Subframes { $sb2 }/{ $sb3 }/{ $sb4 } (erwartet { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = { $FRAME_SYMBOLS } Symbole erwartet, { $soft } angegeben

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = Zeile { $v1 }: `row,column` erwartet

engine-e-lunar-afs-ldpc-line = Zeile { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = Zeile { $v1 }: ({ $r },{ $c }) außerhalb von { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: { $info_bits } Informationsbits erwartet, { $info } angegeben

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = die Daten von LSIS V1.0 liegen nicht in { $cache_dir } (setzen Sie KSHANA_LSIS_DIR oder führen Sie xval/lunar-afs/fetch_lsis.sh aus, das { $LSIS_PDF_URL } herunterlädt und dessen Anhänge extrahiert; sie werden nicht mit Kshana weiterverbreitet)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } ist keine festgelegte LSIS-Datei

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } hat SHA-256 { $got }, erwartet wird { $want } (festgelegt auf LSIS V1.0 vom 29. Januar 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal, Basisband, { $LSIS_VERSION }; Kshana-Referenzgenerator

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = AFS-Knoten { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = AFS-Knoten { $node_id } Frame TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites muss mindestens 1 sein

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites muss mindestens 1 sein

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg muss in [0, 90) liegen; erhalten: { $mask_deg }

engine-lunar-beacon-satellites-no-beacons = { $n_sats } Satelliten, keine Beacons

engine-lunar-beacon-satellites-visible-beacons = { $n_sats } Satelliten + { $n_vis_beacons } sichtbare Beacons

engine-lunar-beacon-satellites-no-beacons-2 = { $n_cmp } Satelliten, keine Beacons

engine-e-lunar-beacon-serialising-beacon-report = Beacon-Bericht wird serialisiert: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = der Beacon-Bericht muss sich zu einem JSON-Objekt serialisieren lassen

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Lunar-Surface-Beacon-Augmentation — Maske { $elevation_mask_deg } deg, Epoche +{ $epoch_s } s, Sigma_URE je Beacon { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  Sat. { $n_visible_sats }  Beacons { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  realisiertes 1-Sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }Beacons verbessern PDOP um den Faktor { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = stattdessen eine größere Konstellation: { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = Mond-Ephemeride { $path } kann nicht gelesen werden: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = Mond-Ephemeride: die erste Zeile muss `{ $MAGIC }` lauten, gefunden: `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = Mond-Ephemeride: Datei ist leer

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = Mond-Ephemeride: `# format:` muss `states` oder `elements` sein, gefunden: `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = Mond-Ephemeride: keine Datenzeilen

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = Mond-Ephemeride: Spalte `{ $name }` fehlt

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = Mond-Ephemeride: `# elements_frame:` muss `icrf` oder `mci` sein, gefunden: `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = Mond-Ephemeride: `elements_frame: icrf` benötigt `# epoch_jd_tdb:` (die Epoche, auf die sich die Elemente beziehen und zu der auch die Rotation von ICRF ins mondfeste System ausgewertet wird): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = Mond-Ephemeride: zu kurze Elementzeile { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = Mond-Ephemeride: Elementzeile { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = Mond-Ephemeride: Elementzeile { $v1 } hat eine nicht positive große Halbachse

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = Mond-Ephemeride: Elementzeile { $v1 } hat die Exzentrizität { $ecc }, außerhalb von [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = Mond-Ephemeride: eine `states`-Datei benötigt `# frame: icrf` oder `# frame: mci`, gefunden: `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = Mond-Ephemeride: eine `icrf`-states-Datei benötigt `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = Mond-Ephemeride: zu kurze Zustandszeile { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = Mond-Ephemeride: Zustandszeile { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = Mond-Ephemeride: Zustandszeile { $v1 } ist nicht endlich

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = Mond-Ephemeride: Zustandszeile { $v1 } für Satellit { $sat } läuft in der Zeit zurück ({ $t } nach { $last }); die Epochen müssen je Satellit streng ansteigen

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Tabellierte mondzentrierte Zustandsephemeride ({ $e }-System), Lagrange-interpoliert mit der Ordnung { $LAGRANGE_ORDER } zwischen den Tabellenepochen und reduziert auf MCMF durch { $v2 }. Die Zustände werden von dieser Engine NICHT propagiert. Herkunftsklasse `published-ephemeris`: unterscheidet sich von jeder aus Elementen abgeleiteten Größe.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Veröffentlichte Konstellationsdefinition, angegeben in mondzentriertem ICRF (`{ $v1 }`), propagiert vom eigenen Kepler-Löser dieser Engine in demselben Inertialsystem und bei jeder Epoche durch die IAU-2015/WGCCRE-Mondorientierung (präzedierender Pol, analytische physikalische Libration) auf MCMF reduziert. KEINE Bezugssystem-Näherung: Die Quelle nennt das Bezugssystem und die Epoche, und beide werden verwendet. Herkunftsklasse `published-elements`: unterscheidet sich von jeder aus Kernels abgeleiteten Größe.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Veröffentlichte Konstellationsdefinition, propagiert vom eigenen Kepler-Löser dieser Engine und reduziert durch das Mondrotationsmodell mit mittlerer Rotation — genau der Weg, den die illustrative Konstellation nimmt, sodass der einzige Unterschied zwischen den beiden Läufen der Konstellationsentwurf ist. Die Quelle gibt die Elemente im `{ $v1 }`-System an; sie werden hier als MCI gelesen, was die Konstellation um `published_frame_tie_angle_deg` kippt. Herkunftsklasse `published-elements`: unterscheidet sich von jeder aus Kernels abgeleiteten Größe.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = unbekanntes station_datum { $other }: erwartet wird "fixed" oder "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = eine VLBI-Kampagne benötigt mindestens 2 Stationen, um eine Basislinie zu bilden, erhalten: { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = Station { $name } hat eine nicht endliche Koordinate

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = Breite { $lat } deg der Station { $name } liegt außerhalb von [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = ein Helmert-Datum mit sieben Parametern benötigt mindestens 3 nicht kollineare Beacons, erhalten: { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = Beacon { $name } hat eine nicht endliche Koordinate

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = Breite { $lat } deg des Beacons { $name } liegt außerhalb von [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours muss positiv und endlich sein, erhalten: { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min muss positiv und endlich sein, erhalten: { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = ein Plan mit { $v1 } Epochen überschreitet die Schranke von 5000 Epochen dieses Szenarios; verlängern Sie step_min oder verkürzen Sie arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s muss positiv und endlich sein, erhalten: { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg muss endlich sein und in [-90, 90) liegen, erhalten: { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg muss endlich sein und in [-90, 90) liegen, erhalten: { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol muss endlich sein und in [0, 1) liegen, erhalten: { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m muss positiv und endlich sein, erhalten: { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver muss "spectral" oder "srif" sein, erhalten: "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = Ergebnis von lunar-frame-campaign wird serialisiert: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = keine Beobachtung der Kampagne überschreitet die erdseitige Elevationsmaske von { $mask } deg an beiden Enden einer Basislinie UND die Maske von { $earth_mask } deg über dem eigenen Horizont des Beacons: { $n_epochs } Epochen x { $v1 } Basislinien x { $n_beacons } Beacons wurden alle verworfen. Verlängern Sie arc_hours, senken Sie eine Maske oder verlegen Sie die Stationen.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = voller Rang: alle 7 Ähnlichkeitsparameter werden durch diese Kampagne bestimmt (Konditionszahl { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANGDEFIZIT: { $defect } von 7 Ähnlichkeitsrichtungen sind aus dieser Kampagne nicht beobachtbar, daher wird KEIN Datum-Sigma veröffentlicht; die nicht beobachtbaren Richtungen sind in der Basis der sieben Parameter aufgeführt

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | { $n_beacons } Beacons x { $v1 } Basislinien x { $n_epochs } Epochen = { $n_obs } Beob. (Verzögerungs-Sigma { $sigma_tau } s) | Stationsdatum { $station_datum } | Helmert-Rang { $rank }/7 Kond. { $condition } | Datum-Translations-Sigma { $v5 } gegenüber Rückgewinnungsfehler der eingebrachten Transformation { $trans_err_norm_m } m (Verhältnis { $v7 })

engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } von { $beacons } Beacons haben in diesem Plan keine Beobachtung ({ $names2 }); sie tragen keine Information bei, ihre Sigmas sind null, und das Datum wird nur aus den beobachteten Beacons realisiert

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = alle Sigmas müssen positiv sein

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane und altitude_km müssen positiv sein

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency muss in (0, 1] liegen

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m gegenüber Boden { $v2 } m Positions-Sigma, mittleres q { $v3 } (Chi-Quadrat 6 erwartet 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } Mehrdeutigkeiten, ILS-Erfolg { $last2 } (Bootstrap { $last3 }) auf dem längsten Bogen

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: kleinster Informationseigenwert x{ $v } mit Orbiter-Verbindungen, CRLB-Spur x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } Durchlaufpunkte auf { $v } Bögen; Laser gegenüber GNSS x Translations-Sigma { $last2 } m an der registrierten lokalen Anbindung

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB-Sigma h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = unbekannte Studie `{ $other }`: erwartet wird eine von { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = der Messdatensatz bestimmt die Bahn nicht (singuläre Information)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials muss mindestens 1 sein

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = die Boden-Sigmas müssen positiv sein

engine-e-lunar-infra-od-unknown-station-dss-14-dss = unbekannte Station `{ $nm }`: DSS-14, DSS-63 oder DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = zu wenige Bodenmessungen, um die Bahn zu bestimmen

engine-e-lunar-infra-od-the-covariance-of-the-difference = die Kovarianz der Differenz ist singulär

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = die differentielle NRHO-Korrektur ist ausgehend vom Startwert nicht konvergiert

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo benötigt 0 < Perilun-Höhe < Apolun-Höhe

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = unbekannte Bahnfamilie `{ $other }`: nrho oder elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s und arc_days müssen positiv sein

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = kein gemeinsamer Satellit zwischen den Empfängern

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = die Normalgleichungen der Trägerphase sind singulär

engine-e-lunar-infra-phase-the-position-block-is-singular = der Positionsblock ist singulär

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = die Mehrdeutigkeitskovarianz ist nicht positiv definit

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = die Sigmas der Verfahren müssen positiv sein

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = die Sigmas der lokalen Anbindung müssen positiv sein

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz muss endlich und positiv sein

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz muss endlich und positiv sein

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k muss endlich und positiv sein

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km muss endlich sein und über dem Mondradius liegen

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity muss in [0, 1) liegen

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw muss endlich sein

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | { $n_sats } Sat., { $n_epochs } Epochen, { $n_links } Verbindungen von ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (Mittel { $mean_js_db }) | { $n_lost } VERLOREN | Verfügbarkeit { $availability_under_jamming } von { $availability_nominal } nominal

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | { $n_sats } Sat., { $n_epochs } Epochen, { $n_links } Verbindungen von ({ $site_lat_deg }, { $site_lon_deg }) | kein Jammer (störungsfreie lunare Basislinie) | { $n_lost } VERLOREN | Verfügbarkeit { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = unerwarteter Header des Reflektorkatalogs { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = zu kurze Zeile des Reflektorkatalogs { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = Reflektorfeld { $i } in { $t } nicht lesbar

engine-e-lunar-llr-reflector-but-the-published-radius = Reflektor { $f }: |(x,y,z)| = { $norm3 } m, aber die veröffentlichte Radiusspalte nennt { $radius } m — die Zeile wurde bearbeitet

engine-e-lunar-llr-reflector-catalogue-has-no-rows = der Reflektorkatalog hat keine Zeilen

engine-e-lunar-llr-unreadable-position-epoch-year = position_epoch_year { $rest } nicht lesbar

engine-e-lunar-llr-unexpected-station-catalogue-header = unerwarteter Header des Stationskatalogs { $t }

engine-e-lunar-llr-short-station-catalogue-row = zu kurze Zeile des Stationskatalogs { $t }

engine-e-lunar-llr-unreadable-station-field-in = Stationsfeld { $i } in { $t } nicht lesbar

engine-e-lunar-llr-unreadable-ilrs-id-in = ILRS-ID in { $t } nicht lesbar

engine-e-lunar-llr-station-catalogue-has-no-rows = der Stationskatalog hat keine Zeilen

engine-e-lunar-llr-cannot-read-this-scenario-runs = { $path } kann nicht gelesen werden ({ $e }). Dieses Szenario läuft auf dem eingecheckten Realdatenausschnitt unter { $DEFAULT_DATA_DIR }, der mit dem Repository, aber nicht mit dem veröffentlichten Crate ausgeliefert wird; verweisen Sie `data_dir` auf eine Kopie davon.

engine-e-lunar-llr-only-usable-normal-points-for = nur { $used } verwendbare Normalpunkte für { $reflectors } Reflektoren — zu wenige, um { $v3 } Koordinaten einzugrenzen; erweitern Sie den Archivausschnitt

engine-e-lunar-llr-the-simulated-campaign-own-report = der eigene Bericht der simulierten Kampagne konnte nicht geparst werden: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: { $used } archivierte Normalpunkte ({ $n_parsed } geparst) von { $station_counts } Station(en) zu { $reflectors } Retroreflektor-Arrays über { $v5 } d; mediane gemessene Normalpunkt-Präzision { $median } mm einfach; Informationsrang der Reflektoren { $rank }/{ $n }; Helmert-Rang { $rank2 }/{ $n_helmert } Kond. { $condition }; Datum-Translations-Sigma { $v12 } m; RMS des einfachen Beobachtet-minus-Berechnet-Residuums { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg muss endlich sein und in [-90, 90) liegen, erhalten: { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } hat eine nicht endliche Koordinate

engine-e-lunar-llr-latitude-deg-is-outside-90 = Breite { $lat_deg } deg von { $kind } { $name } liegt außerhalb von [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = Serialisierung des Berichts von lunar-llr-datum fehlgeschlagen: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = die Integrationsschrittweite muss die Ausgabeschrittweite teilen

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } muss endlich und nicht negativ sein

engine-lunar-receiver-must-be-finite-and-positive = { $n } muss endlich und positiv sein

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: Export der Station: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = die Mond-Ephemeride { $path } deckt { $until } s nach ihrer Epoche ab, aber der Szenariohorizont reicht bis { $last } s; verkürzen Sie horizon_hours oder beziehen Sie einen längeren Bogen (das Extrapolieren einer tabellierten Ephemeride wird verweigert)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path benötigt epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = OP-System bei { $epoch } UTC (scheinbare Bahnnormale der Erde um den Mond, x entlang ihres Knotens auf dem IAU-Mondäquator); lunares GM, J2 und C22 im mondfesten IAU-System, Erde und Sonne als Drittkörper an DE440-Positionen aus { $spk_path }; Runge-Kutta vierter Ordnung, Schrittweite 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m muss endlich und positiv sein

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m muss endlich und positiv sein

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 benötigt height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites muss 3 oder 4 sein, erhalten: { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs muss 1 bis 144 sein

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } muss endlich und positiv sein

engine-lunar-station-must-be-finite-and-not = { $name } muss endlich und nicht negativ sein

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } überschreitet { $MAX_WORK }; senken Sie n_trials, vergröbern Sie grid_lat_step_deg (oder listen Sie weniger Punkte auf) oder erhöhen Sie t_step_s / verkürzen Sie t_span_s

engine-e-lunar-station-kind-must-be-got = kind muss { $KIND } sein; erhalten: { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: die Ephemeride { $path } deckt { $until } s ab, aber der Lauf reicht bis { $last } s (die letzte Epoche plus latency_s); verkürzen Sie t_span_s

engine-e-lunar-station-no-case = { $KIND }: kein Fall ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } Punkte · { $n_epochs } Epochen · { $n_trials } Versuche

engine-lunar-station-hpl-max = HPL max. { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = Vermessung { $survey_sigma_m } m · Latenz { $latency_s } s · { $quantization_bits } Bit

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines und samples müssen 2 bis { $MAX_DEM_SIDE } sein, erhalten: { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } Höhen für ein Raster von { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m muss positiv sein, erhalten: { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m muss positiv sein, erhalten: { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: { $descriptor_path } kann nicht gelesen werden: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection muss south-polar-stereographic sein, erhalten: { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type muss int16-le sein, erhalten: { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: { $img } kann nicht gelesen werden: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: Raster über der Grenze von { $MAX_DEM_SIDE } Pixeln

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } hat { $bytes } Bytes; { $lines } x { $samples } int16 benötigen { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: SHA-256 { $digest } von { $img } passt nicht zu { $image_sha256 } des Deskriptors

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor muss positiv sein

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: { $path } kann nicht gelesen werden: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: benötigt mindestens 2 x 2 Punkte, eine ansteigende Ausdehnung innerhalb von [-90, 90] deg und 360 deg Länge sowie endliche Höhen

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } muss endlich und positiv sein, erhalten: { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m muss endlich und nicht negativ sein, erhalten: { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg darf höchstens 90 sein

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m muss 1 bis 1e6 sein

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: der Standort liegt außerhalb des Höhenfelds

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: ein angegebener Horizont benötigt eine nicht leere Quelle

engine-e-lunar-terrain-terrain-stated-horizon = terrain: angegebener Horizont: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: geben Sie dem_path oder dem_tile_path an, nicht beides

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km muss endlich und positiv sein

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m muss endlich und positiv sein

engine-e-lunar-terrain-site-deg-deg = { $e } (Standort { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = unbekannte Uhr { $other }; erwartet wird eine von optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks muss mindestens eine Uhrenklasse nennen

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s muss endlich und positiv sein, erhalten: { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s muss endlich und größer als tau_min_s ({ $lo }) sein, erhalten: { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade muss ≥ 1 sein

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = der Term { $name } ist kürzer als das tau-Raster

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | Uhr { $clock } | 7-Term x_Σ(τ) über { $taus } τ-Punkte ({ $taus2 }–{ $taus3 } s) | Kreuzungspunkt τ { $crossover_tau_s } s (x { $crossover_x_s } s) | Bezugssystem-Untergrenze { $frame_term_s } s | Uhr x(1 d) { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | Zeitlabor: { $lab } { $lab2 } bis LTC, x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: unbekannte Uhr { $other }; erwartet wird eine von optical-master, passive-h-maser, rafs, mini-rafs, oder geben Sie stattdessen eine device_card an

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: geben Sie entweder clock oder device_card an, nicht beides

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s muss endlich und positiv sein, erhalten: { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } muss endlich und nicht negativ sein, erhalten: { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s müssen positive Zahlen sein

engine-lunar-time-lab-station-height-not-modelled-exactly = Stationshöhe nicht exakt modelliert: ein Einzel-Sigma-Höhenfehler von { $height_sigma_m } m verfälscht die Rate um { $value } ns/day, angewendet als linearer Term seit der letzten Steuerung

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = die Lichtlaufzeit ist in 30 Iterationen nicht auf 1e-15 s konvergiert

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = der Kernel-Pfad benötigt planetary_kernel_path, earth_orientation_kernel_path und moon_orientation_kernel_path gemeinsam

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = unbekanntes Datum { $other }: erwartet wird "anchor-first-station", "free-network" oder "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = ein VLBI-Plan benötigt mindestens 2 Stationen, um eine Basislinie zu bilden, erhalten: { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = die Beacon-Koordinaten müssen endlich sein

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = die Beacon-Breite { $lat } deg liegt außerhalb von [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = ein Plan mit { $v1 } Epochen überschreitet die Schranke von 20000 Epochen dieses Szenarios; verlängern Sie step_min oder verkürzen Sie arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g muss positiv und endlich sein, erhalten: { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = Ergebnis von lunar-vlbi-fim wird serialisiert: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = keine Beobachtung des Plans überschreitet die Elevationsmaske von { $mask } deg an beiden Enden einer Basislinie: { $n_epochs } Epochen x { $v1 } Basislinien wurden alle verworfen. Verlängern Sie arc_hours, senken Sie elevation_mask_deg oder verlegen Sie die Stationen.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = das Datum lässt keinen Parameter zum Schätzen übrig

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANGDEFIZIT: { $defect } von { $dim } Richtungen sind nicht beobachtbar, daher wird kein Sigma je Koordinate angegeben; der Wert des beobachtbaren Unterraums unten ist eine auf die { $rank } beobachtbaren Richtungen beschränkte Pseudoinverse und KEIN Stations-Sigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | { $n_stations } Stationen / { $v2 } Basislinien x { $n_epochs } Epochen = { $n_obs } Beob. (Maske { $mask } deg) | Datum { $datum } | Rang { $rank }/{ $dim } Kond. { $condition } | Stations-Sigma { $v10 } gegenüber Gleichverteilung g={ $g } { $eq_g } m (Verhältnis { $v13 })

## src/main.rs

engine-main-error-validate-needs-scenario-path = Fehler: --validate benötigt einen Szenariopfad

engine-main-error-study-needs-suite-manifest = Fehler: --study benötigt den Pfad eines Suite-Manifests

engine-main-error-study-name-needs-value = Fehler: --study-name benötigt einen Wert

engine-main-error-export-sp3-needs-path = Fehler: --export-sp3 benötigt einen Pfad

engine-main-error-export-omm-needs-path = Fehler: --export-omm benötigt einen Pfad

engine-main-error-export-oem-needs-path = Fehler: --export-oem benötigt einen Pfad

engine-main-error-animate-needs-format-svg = Fehler: --animate benötigt ein Format: svg, html, frames oder all

engine-main-error-animate = Fehler: --animate: { $e }

engine-main-error-animate-fps-needs-whole = Fehler: --animate-fps benötigt eine ganze Zahl von Einzelbildern pro Sekunde

engine-main-error-export-needs-format-czml = Fehler: --export benötigt ein Format: czml, kml, geojson, stk, sigmf, all oder list

engine-main-error-animate-duration-needs-length = Fehler: --animate-duration benötigt eine Länge in Sekunden

engine-main-error-import-route-needs-geojson = Fehler: --import-route benötigt den Pfad einer GeoJSON-Datei

engine-main-error-eop-needs-finals2000a-file = Fehler: --eop benötigt den Pfad einer finals2000A-Datei

engine-main-error-unknown-option = Fehler: unbekannte Option '{ $other }'

engine-main-error-unexpected-argument-one-scenario = Fehler: unerwartetes Argument '{ $other }'; eine Szenariodatei pro Lauf

engine-main-warning-animate-fps-and-animate = Warnung: --animate-fps und --animate-duration bewirken ohne --animate nichts

engine-main-error-animate-exports-one-scenario = Fehler: --animate exportiert einen Szenariolauf; es lässt sich nicht mit --validate oder --study kombinieren

engine-main-error-validate-lints-one-scenario = Fehler: --validate prüft ein Szenario; übergeben Sie nicht zusätzlich eine Szenariodatei

engine-main-error-cannot-read = Fehler: { $validate_file } kann nicht gelesen werden: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — die Art wird aufgelöst; diese Art erfordert kein Feld (ein leerer Rumpf führt ihre Referenzkonfiguration aus), daher gab es nichts weiter zu prüfen

engine-main-ok-kind-resolves-and-all = ok: { $kind } — die Art wird aufgelöst, und alle { $n_required } ihrer veröffentlichten Pflichtfeld-Einträge sind erfüllt; Feldwerte werden nicht geprüft

engine-main-error-study-runs-suite-do = Fehler: --study führt eine Suite aus; übergeben Sie nicht zusätzlich eine einzelne Szenariodatei

engine-main-warning-study-name-is-ignored = Warnung: --study-name wird mit --study ignoriert; eine Studie wird mit dem `title =` des Suite-Manifests betitelt

engine-main-error-cannot-read-2 = Fehler: { $path } kann nicht gelesen werden: { $e }

engine-main-hint-kshana-example-lists-the = Hinweis: `kshana example` listet die mitgelieferten Referenzszenarien auf; `kshana example clock-holdover > clock-holdover.toml` schreibt eines

engine-main-error-cannot-read-3 = Fehler: { $eop_file } kann nicht gelesen werden: { $e }

engine-main-error-eop = Fehler: --eop: { $e }

engine-main-error-cannot-read-4 = Fehler: { $route_file } kann nicht gelesen werden: { $e }

engine-main-error-import-route = Fehler: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: nicht anwendbar: { $why }

engine-main-error-export = Fehler: --export: { $e }

engine-main-error-animate-2 = Fehler: --animate { $f }: { $e }

engine-main-error-export-2 = Fehler: { $fmt }-Export: { $e }

engine-main-error-cannot-write = Fehler: { $json_path } kann nicht geschrieben werden: { $e }

engine-main-error-cannot-write-2 = Fehler: { $svg_path } kann nicht geschrieben werden: { $e }

engine-main-error-cannot-build-the-report = Fehler: der Bericht kann nicht erstellt werden: { $e }

engine-main-error-cannot-write-3 = Fehler: { $html_path } kann nicht geschrieben werden: { $e }

engine-main-error-cannot-write-4 = Fehler: { $report_json_path } kann nicht geschrieben werden: { $e }

engine-main-error-cannot-write-5 = Fehler: { $csv_path } kann nicht geschrieben werden: { $e }

engine-main-wrote-and = { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } und { $csv_path } geschrieben

engine-main-wrote-and-2 = { $json_path }, { $svg_path }, { $html_path } und { $report_json_path } geschrieben

engine-main-error-cannot-write-6 = Fehler: { $target } kann nicht geschrieben werden: { $e }

engine-main-error-cannot-write-7 = Fehler: { $sp3_path } kann nicht geschrieben werden: { $e }

engine-main-error-sp3-export-failed = Fehler: SP3-Export fehlgeschlagen: { $e }

engine-main-error-cannot-write-8 = Fehler: { $omm_path } kann nicht geschrieben werden: { $e }

engine-main-error-omm-export-failed = Fehler: OMM-Export fehlgeschlagen: { $e }

engine-main-error-cannot-write-9 = Fehler: { $oem_path } kann nicht geschrieben werden: { $e }

engine-main-error-oem-export-failed = Fehler: OEM-Export fehlgeschlagen: { $e }

engine-main-error-unexpected-argument-after-kinds = Fehler: unerwartetes Argument '{ $other }' nach `kinds`; nur --json wird akzeptiert

engine-main-bundled-reference-scenarios-write-one =
    Mitgelieferte Referenzszenarien ({ $v1 }). Schreiben Sie eines in eine Datei und führen Sie es aus:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (nicht mitgeliefert: { $name } — führen Sie `kshana example { $name }` aus, um den Grund zu erfahren)

engine-main-error-is-not-bundled-it = Fehler: '{ $name }' ist nicht mitgeliefert: es { $why }

engine-main-error-no-bundled-scenario-named = Fehler: kein mitgeliefertes Szenario namens '{ $name }'; `kshana example` listet die { $v1 } auf, die es gibt

engine-main-error-cannot-read-5 = Fehler: { $suite_path } kann nicht gelesen werden: { $e }

engine-main-wrote-and-3 = { $json_path } und { $html_path } geschrieben

engine-main-error-needs-value = Fehler: { $a } benötigt einen Wert

engine-main-error-expected-mean-needs-number = Fehler: --expected-mean benötigt eine Zahl

engine-main-error-unknown-imu-fit-option = Fehler: unbekannte imu-fit-Option { $x }

engine-main-error-imu-fit-needs-an = Fehler: imu-fit benötigt den Pfad eines IMU-Logs

engine-main-error-needs-value-2 = Fehler: { $args } benötigt einen Wert

engine-main-error-epoch = Fehler: --epoch: { $e }

engine-main-error-unknown-bench-export-option = Fehler: unbekannte bench-export-Option { $a }

engine-main-error-bench-export-needs-scenario = Fehler: bench-export benötigt einen Szenariopfad

engine-main-needs-value = { $a } benötigt einen Wert

engine-main-site-takes-lat-lon-height = --site erwartet lat,lon[,height_m], erhalten: { $v }

engine-main-error-is-bytes-the-tle = Fehler: { $p } hat { $m } Bytes; die TLE-Grenze beträgt { $cap } (4 MiB)

engine-main-error-cannot-read-6 = Fehler: { $p } kann nicht gelesen werden: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = unbekannte sky-Option { $a }

engine-e-main-svg-and-monte-carlo-are = --svg und --monte-carlo sind getrennte Ausgaben; geben Sie eine an

engine-main-error-preset-needs-name =
    Fehler: --preset benötigt einen Namen
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    Fehler: --profile benötigt eine Datei
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } Symbole, { $r2 } Frame(s) gefunden; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }Frame bei { $f }: FID { $f2 } TOI { $f3 } (SB1-Metrik { $f4 }, { $f5 } SP-Fehler, { $f6 } SB1-Fehler)

engine-main-not-checked = nicht geprüft: { $r }

engine-main-wrote-frame-of-6000-symbols = { $out } geschrieben: { $frames } Frame(s) mit 6000 Symbolen; die Subframes 2 bis 4 sind Platzhalter (nicht LDPC-codiert, keine Nachricht)

engine-main-error-cannot-write-10 = Fehler: { $out } kann nicht geschrieben werden: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = unbekannter lunanet-afs-check-Unterbefehl { $other }

engine-main-needs-pack-id = { $cmd } benötigt eine Pack-ID

engine-main-unknown-standards-pack-run-option = unbekannte standards-pack-run-Option { $a }

engine-main-unknown-standards-pack-subcommand = unbekannter standards-pack-Unterbefehl { $other }

engine-main-error-out-needs-value = Fehler: --out benötigt einen Wert

engine-main-error-unknown-compliance-report-option = Fehler: unbekannte compliance-report-Option { $a }

engine-main-error-compliance-report-needs-at = Fehler: compliance-report benötigt mindestens eine Ergebnisdatei .json

engine-main-runs-read-not-used-rows = { $runs } Läufe gelesen, { $unrecognised } nicht verwendet; Zeilen: { $n } belegt, { $n2 } teilweise, { $n3 } nicht belegt, { $n4 } außerhalb des Umfangs

engine-main-error-receiver-trust-needs-scenario = Fehler: receiver-trust benötigt einen Szenariopfad

engine-main-error-invalid-receiver-trust-scenario = Fehler: ungültiges receiver-trust-Szenario: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = der Brennvorgang verbraucht die Masse: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, Brenndauer={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = die Flugzeit muss positiv sein

engine-e-maneuver-collinear-endpoints-transfer-plane-is = kollineare Endpunkte: die Transferebene ist nicht definiert (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs ist für M >= 1; verwenden Sie lambert für M = 0

engine-e-maneuver-no-revolution-transfer-the-time = kein Transfer mit { $revs } Umläufen: die Flugzeit liegt unter ihrem Minimum

engine-e-maneuver-grid-step-days-must-be = grid_step_days muss positiv sein, erhalten: { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = jedes Fenster muss vorwärts laufen (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = kein Transfer des angeforderten Typs in den Fenstern

engine-e-maneuver-the-optimum-left-the-feasible = das Optimum hat den zulässigen Bereich verlassen

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: 3 Werte erwartet

engine-e-mars-od-dss-epoch-is-not-2003 = die Epoche von DSS-{ $id } ist nicht 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } hat kein DXYZ

engine-e-mars-od-no-coordinates-for-dss = keine Koordinaten für DSS { $station }

engine-e-mars-od-no-ramps-for-dss = keine Rampen für DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = die Rampentabelle deckt das Intervall nicht ab

engine-e-mars-od-epoch-outside-the-integrated-span = Epoche { $et } außerhalb der integrierten Spanne

engine-e-mars-od-normal-matrix-is-not-positive = die Normalmatrix ist nicht positiv definit

engine-e-mars-od-no-points = keine Punkte

engine-e-mars-od-parameter-has-no-partial-on = ein Parameter hat auf den behaltenen Punkten keine partielle Ableitung

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | Nutzer { $user }, Uhr { $clock_class } | { $n_relays } Relais (Mittel { $mean_relays_in_view } in Sicht) | konvergierte Pos.-RMS { $converged_pos_rms_m } m, formales 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — Kovarianz-FoM, keine zertifizierte PL) | Uhrenfrequenz-σ { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — Nutzer { $user }, Uhr { $clock_class }: 3-D-Positionsfehler gegenüber der Wahrheit (konvergierte RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = die Paarvergleichsmatrix ist leer

engine-e-mcda-ahp-pairwise-matrix-is-not-square = die Paarvergleichsmatrix ist nicht quadratisch (Zeile { $i } hat { $row } von { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = Eintrag a[{ $i }][{ $j }] = { $v } muss endlich und positiv sein

engine-e-mcda-ahp-diagonal-must-be = Diagonale a[{ $i }][{ $i }] = { $row } muss 1 sein

engine-e-mcda-ahp-entries-must-be-reciprocal = die Einträge a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } müssen reziprok sein (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = obere Zeile { $i } hat { $row } Einträge, erwartet { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = oberer Eintrag ({ $i },{ $j }) = { $v } muss endlich und positiv sein

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: leere Entscheidungsmatrix

engine-e-mcda-copras-copras-no-criteria = COPRAS: keine Kriterien

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS: { $n } Gewichte, aber { $types } Kriterientypen

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: erfordert mindestens ein Kostenkriterium (Min)

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS: Alternative { $i } hat { $row } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: Alternative { $i } Kriterium { $j } Wert { $x } muss endlich und > 0 sein

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: leerer Datensatz

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: keine Kriterien

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I: Alternative { $i } hat { $row } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: Alternative { $i } hat einen nicht endlichen Wert

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: leere Entscheidungsmatrix

engine-e-mcda-moora-moora-no-criteria = MOORA: keine Kriterien

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA: { $n } Gewichte, aber { $types } Kriterientypen

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA: Alternative { $i } hat { $row } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: Alternative { $i } hat einen nicht endlichen Wert

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: Kriterium { $j } hat die L2-Norm null

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: leere Entscheidungsmatrix

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: keine Kriterien

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II: { $n } Gewichte, aber { $types } Typen / { $prefs } Präferenzfunktionen

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II: Alternative { $i } hat { $row } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: Alternative { $i } hat einen nicht endlichen Wert

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: leere Entscheidungsmatrix

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: keine Kriterien

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS: { $n } Gewichte, aber { $types } Kriterientypen

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS: Alternative { $i } hat { $row } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: Alternative { $i } hat einen nicht endlichen Wert

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = der additive Nutzen hat keine Attribute

engine-e-mcda-utility-attributes-but-weights = { $attributes } Attribute, aber { $weights } Gewichte

engine-e-mcda-utility-invalid-scaling-constant = ungültige Skalierungskonstante { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = die Skalierungskonstanten summieren sich zu null

engine-e-mcda-utility-attribute-values-expected-got = { $attributes } Attributwerte erwartet, erhalten: { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: leere Entscheidungsmatrix

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: keine Kriterien

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR: { $n } Gewichte, aber { $types } Kriterientypen

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR: Alternative { $i } hat { $row } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: Alternative { $i } hat einen nicht endlichen Wert

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: leere Entscheidungsmatrix

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: keine Kriterien

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS: { $n } Gewichte, aber { $types } Kriterientypen

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } muss in [0, 1] liegen

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS: Alternative { $i } hat { $row } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: Alternative { $i } Kriterium { $j } Wert { $x } muss endlich und > 0 sein

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: leere Entscheidungsmatrix

engine-e-mcda-wpm-wpm-no-criteria = WPM: keine Kriterien

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM: { $n } Gewichte, aber { $types } Kriterientypen

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM: Alternative { $i } hat { $row } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: Alternative { $i } Kriterium { $j } Wert { $x } muss endlich und > 0 sein

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = die Entscheidungsmatrix hat keine Kriterien

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = die Entscheidungsmatrix hat keine Alternativen

engine-e-mcda-wsm-criterion-has-an-invalid-weight = Kriterium '{ $name }' hat ein ungültiges Gewicht { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = die Kriteriengewichte summieren sich zu null

engine-e-mcda-wsm-alternative-has-values-but-there = Alternative '{ $name }' hat { $values } Werte, aber es gibt { $n } Kriterien

engine-e-mcda-wsm-alternative-has-non-finite-value = Alternative '{ $name }' hat einen nicht endlichen Wert bei Kriterium '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = kein DAF: kürzer als ein Satz

engine-e-naif-kernel-not-daf-identification-word = kein DAF: Kennwort { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = nicht unterstütztes binäres DAF-Format { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = unplausibler DAF-Header: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF-Adresse { $addr } hinter dem Ende der Datei

engine-e-naif-kernel-bad-daf-address-range = ungültiger DAF-Adressbereich { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = die DAF-Zusammenfassungsliste endet nicht

engine-e-naif-kernel-daf-summary-record-claims-summaries = der DAF-Zusammenfassungssatz { $rec } meldet { $count } Zusammenfassungen

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = fehlerhaftes Typ-2-Segment: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = die Größe des Typ-2-Segments passt nicht zu seinem Verzeichnis

engine-e-naif-kernel-epoch-outside-the-record = Epoche { $et } außerhalb des Satzes [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = die Größe des Typ-1-Segments passt nicht zu seinem N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = fehlerhafter Typ-1-Satz: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = kein SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = die SPK-Zusammenfassung ist nicht ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = keine SPK-Daten vom Typ 1/2 für Körper { $target } bei ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = das SPK-Segment für { $target } liegt im Bezugssystem { $frame }, nicht J2000

engine-e-naif-kernel-spk-centre-chain-does-not = die SPK-Zentrumskette erreicht das Baryzentrum nicht

engine-e-naif-kernel-not-binary-pck = kein binäres PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = die PCK-Zusammenfassung ist nicht ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = keine PCK-Daten vom Typ 2 für Bezugssystem { $body_frame } bei ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = das PCK-Bezugssystem { $body_frame } ist gegen das Bezugssystem { $other } angegeben, das nicht J2000 oder ECLIPJ2000 ist

## src/navsignal.rs

engine-e-navsignal-bad-number = ungültige Zahl { $s }

engine-e-navsignal-must-be-positive-number = { $s } muss eine positive Zahl sein

engine-e-navsignal-modulation-expected-name-args-bpsk = Modulation { $label }: NAME(args) erwartet, z. B. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = Modulation { $label }: schließende Klammer fehlt

engine-e-navsignal-modulation-is-not-one-of = Modulation { $label } ist keine von BPSK(n), BOC(m,n) oder MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = nicht abgeschlossene Entität in { $s }

engine-e-ndm-xml-bad-character-reference = ungültige Zeichenreferenz &{ $ent };

engine-e-ndm-xml-unknown-entity = unbekannte Entität &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = nicht abgeschlossene Verarbeitungsanweisung

engine-e-ndm-xml-unterminated-comment = nicht abgeschlossener Kommentar

engine-e-ndm-xml-unterminated-declaration = nicht abgeschlossene Deklaration

engine-e-ndm-xml-expected-an-element-at-byte = Element bei Byte { $pos } erwartet

engine-e-ndm-xml-unterminated-start-tag = nicht abgeschlossenes Start-Tag

engine-e-ndm-xml-attribute-without-value = Attribut ohne Wert

engine-e-ndm-xml-unterminated-attribute-value = nicht abgeschlossener Attributwert

engine-e-ndm-xml-unterminated-end-tag = nicht abgeschlossenes End-Tag

engine-e-ndm-xml-unterminated-cdata = nicht abgeschlossenes CDATA

engine-e-ndm-xml-content-after-the-root-element = Inhalt nach dem Wurzelelement

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } muss endlich und nicht negativ sein

engine-e-nma-budget-subframe-must-be-positive = subframe_s muss positiv sein

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps muss positiv sein

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed muss 0 oder positiv sein

engine-e-nmea-synth-cli-unexpected-argument = unerwartetes Argument { $s }

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = Ausbilderlog: { $e }

engine-nmea-synth-cli-instructor-log-and = Ausbilderlog: { $jp } und { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP-Server lauscht auf { $s }; wartet auf { $wait_clients } Client(s)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = erwartet wird YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = Datum oder Uhrzeit außerhalb des Bereichs (Jahre 1980 bis 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = kein solches Kalenderdatum

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } muss eine endliche Zahl sein

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s muss im Bereich 1 bis 86400 s liegen

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz muss 1, 2, 5 oder 10 sein

engine-e-nmea-synth-config-vessel-position-must-lie-within = die Position des Schiffes muss innerhalb von 89 Grad vom Äquator liegen

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn muss im Bereich 0 bis 60 liegen

engine-e-nmea-synth-config-vessel-rate-of-turn-and = die Grenzen für Drehrate und Beschleunigung des Schiffes müssen positiv sein

engine-e-nmea-synth-config-give-at-least-one-waypoint = geben Sie mindestens einen [[waypoint]] oder vessel.heading_deg an

engine-e-nmea-synth-config-waypoint-is-out-of-range = Wegpunkt { $v1 } liegt außerhalb des Bereichs

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = speed_kn von Wegpunkt { $v1 } muss im Bereich 0 bis 60 liegen

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems muss mindestens eine Konstellation nennen

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } ist keines von { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s muss mindestens 1 sein

engine-e-nmea-synth-config-event = Ereignis { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s muss innerhalb des Laufs liegen

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s muss positiv sein; ramp_s und recovery_s dürfen nicht negativ sein

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s darf duration_s nicht überschreiten

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } gilt nicht für diese Art

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz muss im Bereich 20 bis 60 liegen

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db ist erforderlich

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db muss im Bereich 0 bis 80 liegen

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db muss im Bereich 0 bis 30 liegen

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m ist erforderlich

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m muss im Bereich 0 bis 500000 liegen

engine-e-nmea-synth-config-the-drag-would-accelerate-the = das Wegziehen würde die falsche Spur mit bis zu { $need } m/s^2 beschleunigen, über max_accel_mps2 = { $a }; verlängern Sie ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = geben Sie genau eines von bearing_deg, relative_bearing_deg an

engine-e-nmea-synth-config-offset-is-required = offset_s ist erforderlich

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s muss ungleich null sein und innerhalb eines Tages liegen

engine-e-nmea-synth-config-delay-is-required = delay_s ist erforderlich

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s muss im Bereich 0 bis 3600 liegen

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = das Horizontprofil beschreibt keine Abschattung

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } ist beendet

engine-nmea-synth-gen-the-receiver-reports-fix-again = der Empfänger meldet wieder einen Fix ({ $n_used } Satelliten verwendet)

engine-nmea-synth-gen-the-receiver-has-no-fix = der Empfänger hat keinen Fix ({ $n_used } nutzbare Satelliten, vier erforderlich)

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = ab T+{ $start_s } s für { $duration_s } s (Anstiegsrampe { $ramp_s } s, Erholungsrampe { $recovery_s } s)

engine-nmea-synth-log-every-tracked-satellite-shows-db = ; jeder verfolgte Satellit zeigt { $c } dB-Hz, solange es andauert

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: empfangenes C/N0 fällt um bis zu { $cn0_drop_db } dB (Spreizung je Satellit { $spread_db } dB); Satelliten fallen aus und der Fix geht verloren, wenn weniger als vier nutzbar bleiben

engine-nmea-synth-log-towards-deg-true = in Richtung { $b } deg wahr

engine-nmea-synth-log-towards-deg-true-deg-relative = in Richtung { $t } deg wahr ({ $r } deg relativ zum Kurs bei Beginn, dann gehalten)

engine-nmea-synth-log-position-drag-off-the-reported = Positions-Drag-off: die gemeldete Position wandert { $final_offset_m } m { $dir } weg, während der Empfänger einen gültigen Fix behält (die falsche Spur erreicht Spitzenwerte von { $pv } m/s und { $pa } m/s^2){ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = Zeit-spoofing: die gemeldete UTC weicht um { $offset_s } s von der wahren ab; die Position bleibt wahr{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = Replay-Verzögerung (meaconing-Stil): die Position{ $v1 } hinkt der Wahrheit um { $delay_s } s hinterher{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = natürliche Degradation: der Himmel schließt sich hinter einem angegebenen Horizontprofil ({ $e }); Satelliten dahinter bleiben ohne SNR gelistet und werden nicht verwendet, das C/N0 der übrigen bleibt unverändert, und nichts ist gefälscht

engine-nmea-synth-log-instructor-log = AUSBILDERLOG: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Ausbilderhinweis: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Start { $start_utc }   Dauer { $duration_s } s   Seed { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }SPITZEN  wahr: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   gemeldet: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: unbekannte Konstellation { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Die Toleranz liegt unter der f64-Rauschgrenze beim Rangablesen { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): ihre äquivalente Eigenwertschwelle rel_tol^2 = { $v1 } liegt unter dem Rundungsrauschen der Gram-Matrix, die zusätzlichen Richtungen sind also arithmetischer Rest, keine Beobachtbarkeit.

engine-observability-gramian-rank-clamped-from-the-singular = Rang begrenzt von der Anzahl der Singulärwerte { $counted } auf min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } bei rel_tol { $rel_tol }: eine Matrix der Größe { $n_rows }x{ $n_cols } kann nicht den Rang { $counted } haben.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP nicht definiert (rangdefiziente / singuläre Geometrie): Rang { $rank } von { $n } Zuständen, Datumsdefekt { $v3 }, Kondition { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bytes sind keine ganze Zahl von 36-Byte-Sätzen

engine-e-odf-record-precedes-any-group-header = Satz { $v1 } steht vor jedem Gruppen-Header

engine-e-odf-no-orbit-data-group = keine Bahndatengruppe

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } ist kein Schlüsselwort von { $name }

engine-e-odm-without = { $name } ohne { $k }

engine-e-odm-needs-exactly-one-of = { $name } benötigt genau eines von { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION und MESSAGE_ID sind Header-Schlüsselwörter der Version 3.0 (Version { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = unerwartete Zeile { $b }

engine-e-odm-unknown-keyword = unbekanntes Schlüsselwort { $k }

engine-e-odm-block-repeated-or-out-of = Block { $block } wiederholt oder in falscher Reihenfolge bei { $key }

engine-e-odm-repeated = { $key } wiederholt

engine-e-odm-comments-after-the-last-keyword = Kommentare nach dem letzten Schlüsselwort

engine-e-odm-given-twice = { $b } doppelt angegeben

engine-e-odm-opm-without-metadata = OPM ohne Metadaten

engine-e-odm-opm-without-state-vector = OPM ohne Zustandsvektor

engine-e-odm-omm-without-metadata = OMM ohne Metadaten

engine-e-odm-omm-without-mean-elements = OMM ohne mittlere Elemente

engine-e-odm-is-not-keyword-of-the = { $k } ist kein Schlüsselwort des Blocks { $kind }

engine-e-odm-block-without = Block { $kind } ohne { $k }

engine-e-odm-block-with-data-lines = Block { $kind } mit Datenzeilen

engine-e-odm-line-has-values-expected = { $kind }: Zeile { $l } hat { $l2 } Werte, erwartet { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } ist kein OCM-Metadaten-Schlüsselwort

engine-e-odm-ocm-metadata-without = OCM-Metadaten ohne { $k }

engine-e-odm-block-repeated = Block { $kind } wiederholt

engine-e-odm-inside-block = { $t } innerhalb eines Blocks

engine-e-odm-unsupported-ocm-block = nicht unterstützter OCM-Block { $tag }

engine-odm-outside-block = { $t } außerhalb eines Blocks

engine-e-odm-closes-block = { $t } schließt einen Block { $want }

engine-e-odm-unexpected-line-2 = unerwartete Zeile { $t }

engine-e-odm-outside-block = { $k } außerhalb eines Blocks

engine-e-odm-unterminated-block = nicht abgeschlossener Block

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = Epoche ohne Datums-/Zeittrenner 'T': { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = nicht unterstütztes OEM-Epochendatum '{ $date }' (erwartet yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = nicht unterstützte OEM-Epochenzeit '{ $time }' (erwartet HH:MM:SS)

engine-e-oem-bad-epoch-year = ungültiges Epochenjahr: { $d }

engine-e-oem-bad-epoch-month = ungültiger Epochenmonat: { $d }

engine-e-oem-bad-epoch-day = ungültiger Epochentag: { $d }

engine-e-oem-bad-epoch-hour = ungültige Epochenstunde: { $t }

engine-e-oem-bad-epoch-minute = ungültige Epochenminute: { $t }

engine-e-oem-bad-epoch-second = ungültige Epochensekunde: { $t }

engine-e-oem-oem-epoch-field-out-of = OEM-Epochenfeld außerhalb des Bereichs: { $s }

engine-e-oem-unexpected-oem-header-line = unerwartete OEM-Header-Zeile: { $line }

engine-e-oem-expected-meta-start-found = META_START erwartet, gefunden: { $line }

engine-e-oem-unexpected-oem-metadata-line = unerwartete OEM-Metadatenzeile: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = den OEM-Segment-Metadaten fehlt META_STOP

engine-e-oem-oem-metadata-missing-object-name = den OEM-Metadaten fehlt OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = den OEM-Metadaten fehlt OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = den OEM-Metadaten fehlt CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = den OEM-Metadaten fehlt REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = den OEM-Metadaten fehlt TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = den OEM-Metadaten fehlt START_TIME

engine-e-oem-oem-metadata-missing-stop-time = den OEM-Metadaten fehlt STOP_TIME

engine-e-oem-oem-data-line-needs-position = eine OEM-Datenzeile benötigt Position+Geschwindigkeit (6) oder +Beschleunigung (9) Komponenten, erhalten { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = nicht numerischer OEM-Zustandswert '{ $t }' in: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = dem OEM fehlt der Header CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = dem OEM fehlt der Header CREATION_DATE

engine-e-oem-oem-missing-originator-header = dem OEM fehlt der Header ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM enthielt keine Segmente

engine-oem-oem-interop-round-tripped-segment = oem-interop: { $segments } Segment(e) hin und zurück gewandelt, { $n_states_total } Zustände; max. Round-trip-Fehler { $p } km / { $v } km/s (MODELLED Interop)

engine-oem-oem-interop-ingested-segment-states = oem-interop: { $segments } Segment(e), { $n_states_total } Zustände aus externem OEM eingelesen (Ersteller { $originator }) (MODELLED Interop)

engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = kein COVARIANCE_START-Block

engine-e-oem-no-covariance-stop = kein COVARIANCE_STOP

engine-e-oem-bad-covariance-value = ungültiger Kovarianzwert '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = 21 Kovarianzwerte erwartet, gefunden: { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = der OMM-Export benötigt vollständige TLEs (Zeile 1 + Zeile 2); dieser Block hat keine

engine-omm-ccsds-omm-vers = CCSDS_OMM_VERS = { $version }{ "\u000A" }

engine-omm-mean-element-theory = MEAN_ELEMENT_THEORY = { $mean_element_theory }{ "\u000A" }

engine-omm-mean-motion = MEAN_MOTION = { $mean_motion_rev_day }{ "\u000A" }

engine-omm-ra-of-asc-node = RA_OF_ASC_NODE = { $ra_of_asc_node_deg }{ "\u000A" }

engine-omm-arg-of-pericenter = ARG_OF_PERICENTER = { $arg_of_pericenter_deg }{ "\u000A" }

engine-omm-mean-anomaly = MEAN_ANOMALY = { $mean_anomaly_deg }{ "\u000A" }

engine-omm-ephemeris-type = EPHEMERIS_TYPE = { $ephemeris_type }{ "\u000A" }

engine-omm-classification-type = CLASSIFICATION_TYPE = { $classification }{ "\u000A" }

engine-omm-norad-cat-id = NORAD_CAT_ID = { $norad_cat_id }{ "\u000A" }

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } muss in [0, 1] liegen

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg muss in [5, 90] liegen

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave muss "plane" oder "spherical" sein

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction muss "downlink" oder "uplink" sein

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = die Einträge von availability_targets_pct müssen in (0, 100) liegen

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h darf höchstens 8760 betragen (ein Jahr)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } Schritte liegen über den { $MAX_STEPS }, die ein Ergebnis aufnimmt; erhöhen Sie step_s oder verkürzen Sie duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = unbekannte Uhrenklasse "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = jeder Standort benötigt einen Namen

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = Standort { $name }: Breite/Länge außerhalb des Bereichs

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = Standort { $name }: altitude_m muss in [0, top) liegen

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm bei { $elevation_deg } deg Elevation, Marge { $margin0 } dB vor der Atmosphäre; bester Standort { $scn } { $v5 } %; Netz aus { $order } Standorten { $last } % bei unabhängigem / { $last2 } % bei korreliertem Wetter (MODELLED, beratend)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = der RINEX-Block wurde gelesen, enthielt aber keine unterstützten Ephemeriden

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg muss in [-90, 90] liegen und jedes Feld endlich sein

engine-e-orbit-no-satellites-to-export = keine Satelliten zu exportieren

engine-e-orbit-time-step-must-be-positive = time.step_s muss für den SP3-Export positiv sein

engine-e-orbit-time-step-must-be-positive-2 = time.step_s muss für den OEM-Export positiv sein

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } muss positiv sein; erhalten: { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s muss endlich und nicht negativ sein

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate muss endlich und nicht negativ sein

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = die Mindestelevation des Spoofers muss in [0, 90) Grad liegen

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns der Kreuzprüfung muss endlich und nicht negativ sein

engine-orbital-timing-the-in-plane-neighbour-degrees = der Nachbar in der Bahnebene, { $v1 } Grad voraus, liegt außerhalb des Footprints eines einzelnen Spoofers ({ $v2 } Grad breit)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = der Nachbar in der Bahnebene, { $v1 } Grad voraus, kann innerhalb des Footprints desselben Spoofers liegen ({ $v2 } Grad breit), sodass beide Uhren gemeinsam gezogen werden können

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = Eingabedatei fehlt

engine-e-osnma-cli-max-time-error-has-no = --max-time-error hat ohne --reference-time keine Wirkung

engine-e-osnma-cli-not-number = keine Zahl: { $s }

engine-e-osnma-cli-public-key-must-be-id = der öffentliche Schlüssel muss ID:TYPE:HEX sein

engine-e-osnma-cli-public-key-type-must-be = der Typ des öffentlichen Schlüssels muss p256 oder p521 sein

engine-e-osnma-cli-unknown-format = unbekanntes Format { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } ist kein Text; verwenden Sie --format ubx für einen UBX-Strom

engine-e-osnma-cli-vector-csv-needs-start-gst = eine Vektor-CSV benötigt --start-gst oder einen datierten Dateinamen

# legal: native review
engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    Fehler: { $input } kann nicht gelesen werden: { $e }

# legal: native review
engine-osnma-cli-galileo-osnma-verification =
    Galileo-OSNMA-Verifikation
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = Eingabe: { $input } ({ $pages } Seiten)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: { $frames } Frames; { $inav_pages } I/NAV-Seiten dekodiert, { $pages } zeitlich eingeordnet ({ $bad_crc } fehlerhafte CRC, { $unstamped } nicht einordenbar, { $time_conflicts } Zeitkonflikte)

engine-osnma-cli-overall-nma-status = gesamt: { $status_word }   NMA-Status: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALARM: eine verifizierte OSNMA-Alarmnachricht wurde empfangen. Verwenden Sie keine OSNMA-Daten mehr; nichts wird als authentifiziert gemeldet.

engine-osnma-cli-freshness-not-enforced-no-reference = Aktualität: NICHT erzwungen. Es wurde keine Referenzzeit angegeben, daher werden die Subframe-Zeiten aus der Eingabe übernommen, und eine Wiedereinspielung alter Daten würde authentifiziert.

engine-osnma-cli-freshness-sub-frames-within-of = Aktualität: Subframes innerhalb von { $max_err } s um die Referenzzeit { $v2 } werden verwendet; { $set_aside } wurden zurückgestellt. Eine Referenzzeit ist ein einzelner Zeitpunkt.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }Satellit  Status          authentifiziert  fehlgeschlagen  ausstehend  verworfen  zuletzt authentifiziert

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }Epoche (Tag-Subframe)      tx   Daten  adkd  ctr  Ergebnis

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = Zeile { $v1 }: 3 Felder erwartet

engine-e-osnma-input-line-bad-svid = Zeile { $v1 }: ungültige SVID

engine-e-osnma-input-line-bad-bit-count = Zeile { $v1 }: ungültige Bitanzahl

engine-e-osnma-input-line-data-is-not-hex = Zeile { $v1 }: die Daten sind nicht hexadezimal

engine-e-osnma-input-line-bit-count-does-not = Zeile { $v1 }: die Bitanzahl passt nicht zu den Daten

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = die Zeittoleranz muss unter einem Subframe ({ $SUBFRAME_S } s) liegen, erhalten: { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = die Refraktion nach ITU-R P.834 ist für Stationshöhen von 0 bis 3 km definiert; erhalten: { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s und step_s müssen positiv sein

engine-e-passes-station-lat-deg-must-be = station_lat_deg muss in [-90, 90] liegen

engine-e-passes-mask-deg-must-be-in = mask_deg muss in [0, 90) liegen

engine-e-passes-duration-hours-must-be-finite = duration_hours muss endlich und positiv sein

engine-e-passes-step-must-be-finite-and = step_s muss endlich und positiv sein

engine-passes-passes-pass-es-of-km = passes: { $passes } Überflug/Überflüge einer Bahn ({ $altitude_km } km / { $inclination_deg }°) über ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° in { $duration_hours } h; { $total_access_s } s Gesamtzugang (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = zu kurzer { $record }-Satz: { $line }

engine-e-precise-products-bad-number-in = ungültige Zahl { $s } in { $line }

engine-e-precise-products-bad-field-in = ungültiges Feld { $s } in { $line }

engine-e-precise-products-bad-antex-epoch = ungültige ANTEX-Epoche { $s }

engine-e-precise-products-bad-offset = ungültiger Offset { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = der Ephemeridenanbieter hat keine geozentrischen Daten für { $name } bei JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D-Fehler RMS { $rms } m (max. { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS nach Anpassung { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } Sat. Nav | { $epochs_solved }/{ $epochs_total } Epochen gelöst | Mittel { $mean_n_used } Sat., PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Einzelpunktbestimmung — 3D-Fehler gegenüber der vermessenen Koordinate (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Einzelpunktbestimmung — Residuen-RMS nach Anpassung ({ $mean_postfit_rms_m } m Mittel)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = die Array-Zugriffsfunktionen von RunOutput benötigen NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } ist kein numerisches Array (eine Liste von Zahlen oder von gleich langen Listen von Zahlen)

engine-e-python-is-not-non-empty-list = { $path } ist keine nicht leere Liste von Datensätzen

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-e-python-and-must-be-the-same = i und q müssen gleich lang sein ({ $i } vs. { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: nicht akquiriert (Statistik { $statistic } < Schwelle { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } (Design, PRN)-Kanäle; höchstens 256 je Durchlauf

engine-python-not-acquired-statistic-threshold = { $code }: nicht akquiriert (Statistik { $statistic } < Schwelle { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] benötigt `label`

engine-e-python-runs-needs-result = runs[{ $i }] benötigt `result`

engine-e-python-must-be-between-and-32 = { $name } muss zwischen 0 und 2**32 - 1 liegen

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | Seed { $seed } | v{ $engine_version } | Quanten-Siege { $value }/{ $foms } FoMs | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } aus { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = unbekannte baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = unbekannte candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = ADEV-taus/-Werte müssen endlich und > 0 sein

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | Kandidat { $candidate_source } | Zeitgebungs-holdover { $timing_holdover_s }s vs. { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inertialer holdover { $inertial_holdover_s }s vs. { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | Resilienz-Auslauf { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = die RINEX-Uhrendatei deklariert das Zeitsystem { $id }, das dieser Leser nicht kennt (bekannt: { $known_clock_time_systems }); sie wird abgelehnt, statt ihre Epochen als GPS-Zeit zu lesen

engine-e-realdata-clk-rinex-clock-file-has-satellite = die RINEX-Uhrendatei hat das Satellitensystem { $other } und deklariert keine TIME SYSTEM ID; das Zeitsystem ihrer Epochen wird nicht erraten

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX-Uhrendateien deklarieren unterschiedliche Zeitsysteme ({ $s } und { $ts }); sie werden nicht auf einer gemeinsamen Zeitachse zusammengeführt

engine-e-realdata-clk-no-as-or-ar-records = keine AS- oder AR-Sätze für { $id }

engine-e-realdata-clk-short-circular-row = zu kurze Circular-T-Zeile: { $t }

engine-e-realdata-clk-bad-value-in = ungültiger Wert { $s } in { $t }

engine-e-realdata-clk-no-section-mjd-header-found = kein MJD-Header in Abschnitt 1 gefunden

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = nicht abgeschlossenes schließendes Tag

engine-e-realdata-ion-sdr-unbalanced-closing-tag = unausgewogenes schließendes Tag

engine-e-realdata-ion-sdr-unterminated-tag = nicht abgeschlossenes Tag

engine-e-realdata-ion-sdr-attribute-value-missing = Attributwert fehlt

engine-e-realdata-ion-sdr-element-outside-the-document = Element außerhalb des Dokuments

engine-e-realdata-ion-sdr-text-outside-the-document = Text außerhalb des Dokuments

engine-e-realdata-ion-sdr-element-left-open = { $stack } Element(e) offen gelassen

engine-e-realdata-ion-sdr-expected-one-root-element-found = ein Wurzelelement erwartet, gefunden: { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = unbekanntes Frequenzformat { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = nicht unterstützte Kodierung { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } Ströme: nur Dateien mit einem einzelnen Strom werden gelesen

engine-e-realdata-ion-sdr-block-of-cycles-with-header = ein Block von { $cycles } Zyklen mit Header oder Footer wiederholt sich; nur ein einzelner, die Datei umspannender Block wird gelesen

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = Chunk aus { $words_per_chunk } Wörtern zu je { $word_bytes } Bytes

engine-e-realdata-ion-sdr-unsupported-sample-format = nicht unterstütztes Abtastformat { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = Quantisierung { $quantization } in { $packed_bits } gepackten Bits pro Abtastwert

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = eine Abtastrate von { $sample_rate_hz } Hz ist kein ganzzahliges Vielfaches des Ratenfaktors { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = ein Chunk enthält keinen ganzen Lump

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = Abtastwerte { $start }..{ $v1 } angefordert, die Datei enthält { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = CRD-Version { $f } nicht lesbar

engine-realdata-llr-crd-crd-format-version-is-not = CRD-Formatversion { $v } wird nicht unterstützt (nur 1 und 2 teilen die Feldreihenfolge von Satz 11, auf die sich dieser Leser stützt)

engine-realdata-llr-crd-unreadable-station-id = Stations-ID { $f } nicht lesbar

engine-realdata-llr-crd-unreadable-time-scale = Zeitskala { $f } nicht lesbar

engine-realdata-llr-crd-crd-epoch-time-scale-is = die CRD-Epochen-Zeitskala { $time_scale } gehört nicht zu den drei, die laut Formatspezifikation Analysten akzeptieren (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); das Lesen als UTC wird verweigert

engine-realdata-llr-crd-unreadable-h4-field = h4-Feld { $i } nicht lesbar: { $f }

engine-realdata-llr-crd-unreadable-field = Feld { $i } nicht lesbar: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = Epochenereignis { $f } nicht lesbar

engine-realdata-llr-crd-non-physical-time-of-flight = nicht physikalische Laufzeit { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = das Normalpunkt-Verzeichnis { $dir } kann nicht gelesen werden: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = keine *.npt-Normalpunkt-Dateien in { $dir } — dieses Szenario liest echte archivierte Messungen und läuft ohne sie nicht

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = ungültige Zahl '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = das DEM hat eine Dimension der Größe null

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = Kodierung { $encoding }: ein LuGRE-Batch ist im Zweierkomplement

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } Bytes: kürzer als der IQS-Header

engine-e-realdata-lugre-not-an-iqs-frame = kein IQS-Frame: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = Abtastrate: Metadaten { $sample_rate_hz } Hz, Header { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = Quantisierung: Metadaten { $quantization } Bit, Header { $quant_bits } Bit

engine-realdata-lugre-centre-frequency-metadata-hz-header = Mittenfrequenz: Metadaten { $center_freq_hz } Hz, Header { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = Zwischenfrequenz: Metadaten { $translated_freq_hz } Hz, Header { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = Anzahl der Abtastwerte: das Metadaten-Layout ergibt { $layout }, der Header { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = Header/Footer: Metadaten { $header_bytes }/{ $footer_bytes } Bytes, Format { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = die Dateilänge { $file_len } ist nicht Header + { $value } Abtastbytes + Footer

engine-realdata-lugre-field-missing = Feld { $key } fehlt

engine-e-realdata-lugre-field-unreadable = Feld { $key } nicht lesbar

engine-realdata-lugre-raw-line = RAW-Zeile { $v1 }: { $e }

engine-realdata-lugre-acq-line = ACQ-Zeile { $v1 }: { $e }

engine-realdata-lugre-nav-line = NAV-Zeile { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK-Zeile { $v1 }: nicht lesbar

engine-e-realdata-lugre-clk-row-columns-expected = CLK-Zeile { $v1 }: { $v } Spalten, erwartet werden 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = JSON lesen: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = auf oberster Ebene wird ein JSON-Objekt erwartet

engine-e-realdata-yunnan-missing-recordtime-array = das Array recordTime fehlt

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = die EOP-Datei { $path } kann nicht gelesen werden: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s muss endlich und nicht negativ sein, erhalten: { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = die EOP-Datei der späteren Ausgabe { $path } kann nicht gelesen werden: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = LEER, und zwar absichtlich: eine Zeile für vorhergesagt gegen endgültig benötigt eine Ausgabeepoche mit einem VOLLSTÄNDIGEN Anpassungsfenster von { $window_days } Tagen davor und einem veröffentlichten endgültigen Bulletin B zur Zielepoche. Die gültige Eingabe ({ $eop_source }) liefert keine Epoche, die beides erfüllt. Verkürzen Sie `operational_window_days` oder liefern Sie eine längere echte finals2000A-Reihe — es wird keine Zeile erzeugt, um die Tabelle zu füllen.

engine-realtime-frame-eop-measured-over-the-real-series = Gemessen über die gültige echte Reihe ({ $eop_source }). Jede Zeile ist ein echter Vorhersagefehler: eine Vorhersage für T+h, gebildet aus schnellen Bulletin-A-Zeilen zu oder vor T, bewertet gegen den SPÄTER VERÖFFENTLICHTEN endgültigen Wert des Bulletin B zu T+h. Die Persistenz wird über dieselbe Epochenmenge gegen dieselben endgültigen Werte bewertet, sodass sich die beiden Spalten im Prädiktor und in nichts sonst unterscheiden. `improvement_factor` unter 1 bedeutet, dass der operationelle Prädiktor bei diesem Horizont SCHLECHTER ist als die Persistenz, und wird so ausgewiesen.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Gemessen über ein echtes Paar aus zwei Ausgaben: die ursprünglich ausgegebene Fassung ({ $eop_source }) enthält echte Bulletin-A-Vorhersagen über ihr eigenes Datenende hinaus, und die archivierte spätere Ausgabe ({ $c }) enthält die endgültigen Werte des Bulletin B, die diese Daten schließlich erhielten. Drei Vorhersagen werden gegen diesen endgültigen Wert bewertet — die archivierte Bulletin-A-Vorhersage selbst, die operationelle Anpassung dieses Crates über die ursprünglich ausgegebene Fassung und die Persistenz am Datenende.

engine-realtime-frame-eop-empty-and-deliberately-so-later = LEER, und zwar absichtlich: eine spätere Ausgabe wurde geliefert ({ $c }), aber bei keinem angeforderten Horizont ist ein Datum in der ursprünglich ausgegebenen Datei ({ $eop_source }) als VORHERSAGE des Bulletin A und in der späteren als ENDGÜLTIGER Wert des Bulletin B enthalten. Es wird keine Zeile synthetisiert.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = LEER, und zwar absichtlich. Die Bewertung einer ECHTEN ARCHIVIERTEN Vorhersage benötigt zwei Ausgaben desselben finals2000A-Produkts; dieser Lauf erhielt eine ({ $eop_source }). Das Repository enthält keine archivierte frühere Ausgabe, und es wird keine durch Störung der vorhandenen Ausgabe erzeugt — ein synthetisches Archiv würde jede Zahl in dieser Tabelle zu einer Messung der Störung machen. Liefern Sie über `eop_finals2000a_later` eine echte archivierte spätere Ausgabe, um sie zu füllen. Bis dahin stehen die echten Fehler vorhergesagt gegen endgültig, die dieser Bericht enthält, in `table5_operational_vs_persistence`, wo die Vorhersage vom Crate selbst stammt und die Wahrheit der später veröffentlichte endgültige Wert des Bulletin B ist.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabelle 1: Nachverarbeitung { $c } m ({ $c2 } ms UT1) ↔ Echtzeit { $c3 } m ({ $c4 } ms UT1) | Tabelle 2: Untergrenze der Endwerte { $floor } ms → { $far }-Tage { $far2 } ms | Budget gesamt { $total_m } m ({ $total_time_ns } ns) | L19-Hebelarm + L18-Realdaten (gegen eine unabhängige externe Referenz geprüft), OD-Kov. (aus einem Modell berechnet)

engine-realtime-frame-eop-table3-joint-eop = table3_joint_eop[].{ $q }.n

engine-realtime-frame-eop-table3-joint-eop-truth-fallback = table3_joint_eop[].{ $q }.truth_fallback_rows

engine-realtime-frame-eop-table3-joint-eop-epochs-mjd = table3_joint_eop[].{ $q }.epochs_mjd

engine-realtime-frame-eop-table3-joint-eop-rms-native = table3_joint_eop[].{ $q }.rms_native

engine-realtime-frame-eop-table3-joint-eop-p50-native = table3_joint_eop[].{ $q }.p50_native

engine-realtime-frame-eop-table3-joint-eop-p95-native = table3_joint_eop[].{ $q }.p95_native

engine-realtime-frame-eop-table3-joint-eop-max-native = table3_joint_eop[].{ $q }.max_native

engine-realtime-frame-eop-table3-joint-eop-rms-position = table3_joint_eop[].{ $q }.rms_position_m

engine-realtime-frame-eop-table3-joint-eop-p95-position = table3_joint_eop[].{ $q }.p95_position_m

engine-realtime-frame-eop-table3-joint-eop-rms-light = table3_joint_eop[].{ $q }.rms_light_time_ns

engine-realtime-frame-eop-operational-predictor-model-representative-fit = operational_predictor_model.representative_fit.{ $q }.issue_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-2 = operational_predictor_model.representative_fit.{ $q }.window_first_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-3 = operational_predictor_model.representative_fit.{ $q }.window_last_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-4 = operational_predictor_model.representative_fit.{ $q }.n_fit

engine-realtime-frame-eop-operational-predictor-model-representative-fit-5 = operational_predictor_model.representative_fit.{ $q }.rms_fit_residual_native

engine-realtime-frame-eop-operational-predictor-model-representative-fit-6 = operational_predictor_model.representative_fit.{ $q }.anchor_residual_native

engine-realtime-frame-eop-operational-predictor-model-representative-fit-7 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].period_days

engine-realtime-frame-eop-operational-predictor-model-representative-fit-8 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].cycles_spanned

engine-realtime-frame-eop-operational-predictor-model-representative-fit-9 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].threshold_cycles

engine-realtime-frame-eop-rows-horizon-days = { $t5 }.rows[].horizon_days

engine-realtime-frame-eop-rows-epochs-mjd = { $t5 }.rows[].epochs_mjd

engine-realtime-frame-eop-rows-target-mjds = { $t5 }.rows[].target_mjds

engine-realtime-frame-eop-rows-min-fit-lead-days = { $t5 }.rows[].min_fit_lead_days

engine-realtime-frame-eop-rows-fit-rows-min = { $t5 }.rows[].fit_rows_min

engine-realtime-frame-eop-rows-fit-rows-max = { $t5 }.rows[].fit_rows_max

engine-realtime-frame-eop-rows-improvement-factor = { $t5 }.rows[].*.improvement_factor

engine-realtime-frame-eop-rows-rms-native = { $t5 }.rows[].*.{ $p }.rms_native

engine-realtime-frame-eop-rows-p50-native = { $t5 }.rows[].*.{ $p }.p50_native

engine-realtime-frame-eop-rows-p95-native = { $t5 }.rows[].*.{ $p }.p95_native

engine-realtime-frame-eop-rows-max-native = { $t5 }.rows[].*.{ $p }.max_native

engine-realtime-frame-eop-rows-rms-position = { $t5 }.rows[].*.{ $p }.rms_position_m

engine-realtime-frame-eop-rows-p95-position = { $t5 }.rows[].*.{ $p }.p95_position_m

engine-realtime-frame-eop-rows-rms-light-time-ns = { $t5 }.rows[].*.{ $p }.rms_light_time_ns

engine-realtime-frame-eop-equivalent-horizon-days-target-position = { $t5 }.equivalent_horizon_days.target_position_m

engine-realtime-frame-eop-equivalent-horizon-days = { $t5 }.equivalent_horizon_days.{ $q }.{ $p }

engine-realtime-frame-eop-rows-horizon-days-2 = { $t6 }.rows[].horizon_days

engine-realtime-frame-eop-rows-issue-mjd = { $t6 }.rows[].issue_mjd

engine-realtime-frame-eop-rows-epochs-mjd-2 = { $t6 }.rows[].epochs_mjd

engine-realtime-frame-eop-rows-rms-native-2 = { $t6 }.rows[].*.{ $p }.rms_native

engine-realtime-frame-eop-rows-p50-native-2 = { $t6 }.rows[].*.{ $p }.p50_native

engine-realtime-frame-eop-rows-p95-native-2 = { $t6 }.rows[].*.{ $p }.p95_native

engine-realtime-frame-eop-rows-max-native-2 = { $t6 }.rows[].*.{ $p }.max_native

engine-realtime-frame-eop-rows-rms-position-2 = { $t6 }.rows[].*.{ $p }.rms_position_m

engine-realtime-frame-eop-rows-p95-position-2 = { $t6 }.rows[].*.{ $p }.p95_position_m

engine-realtime-frame-eop-rows-rms-light-time-ns-2 = { $t6 }.rows[].*.{ $p }.rms_light_time_ns

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Gemessen über ein echtes Paar aus zwei Ausgaben: das VORHERGESAGTE UT1 des Bulletin A der ursprünglich ausgegebenen Datei ({ $eop_source }), differenziert gegen den schließlich ENDGÜLTIGEN Wert des Bulletin B der archivierten späteren Ausgabe ({ $c }), bei { $predicted_vs_final } Horizont(en).

engine-realtime-frame-eop-empty-and-deliberately-so-an = LEER, und zwar absichtlich: eine archivierte spätere Ausgabe wurde geliefert ({ $c }), aber bei keinem angeforderten Horizont ist ein Datum in der ursprünglich ausgegebenen Datei ({ $eop_source }) als VORHERSAGE des Bulletin A und in der späteren als ENDGÜLTIGER Wert des Bulletin B enthalten, sodass kein Residuum vorhergesagt gegen endgültig zu berichten ist. Es wird keine Zeile synthetisiert.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = LEER, und zwar absichtlich: ein Residuum vorhergesagt gegen endgültig benötigt ZWEI Ausgaben desselben finals2000A-Produkts. Dieser Lauf erhielt eine ({ $eop_source }). Ihre Bulletin-A-Vorhersagezeilen betreffen künftige Daten, für die es noch keinen endgültigen Wert des Bulletin B gibt; das Residuum existiert also nicht und kann nicht gemessen werden, und es wird hier keines erfunden. Liefern Sie über `eop_finals2000a_later` eine archivierte spätere Ausgabe, um diese Tabelle zu füllen. Bis dahin ist das in `table2_error_vs_horizon` berichtete mehrtägige Wachstum der Fehler des PERSISTENZ-Prädiktors, bewertet über die echten endgültigen Werte — ein echter gemessener Fehler, aber ein aus einem Modell berechneter Prädiktor und nicht das Vorhersageresiduum des IERS Bulletin A.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = eine Schiffsbewertung benötigt [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = der Auszug hat { $excerpt } Bytes; die Grenze liegt bei { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = der Auszug enthält mehr als { $MAX_EXCERPT_EPOCHS } Epochen; kürzen Sie ihn

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = der Auszug endet innerhalb des Kalibrierfensters von { $calibration_s } s ({ $epochs } Epochen): nichts wurde bewertet

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = keine mit UTC gekennzeichnete Epoche im UBX-Log

engine-e-receiver-trust-calibration-no-scenario-json-under = keine scenario.json unter { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: zurückgehaltene saubere Pfa <= { $B1_MAX_PFA } (kalibriert: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } muss endlich und > 0 sein (erhalten: { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel muss endlich und >= 0 sein (erhalten: { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used muss mindestens 1 sein

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg muss in [0, 90] liegen (erhalten: { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg muss in (0, 360] liegen (erhalten: { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points muss in [0, 100] liegen (erhalten: { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio muss endlich und > 1 sein (erhalten: { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor muss in (0, 100] liegen (erhalten: { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) liegt unter dem degraded_min des Scores ({ $degraded_min }): die Geometrie allein könnte das nicht vertrauenswürdige Band erreichen

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites = Geometrie { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } Satelliten{ $v6 }

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: der Geometrieabzug wird als Inkonsistenz eingestuft

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: berichtet, nicht bewertet (die Geometrie ist nicht schlecht)

engine-receiver-trust-geometry-not-scored-the-score-deducts = nicht bewertet (der Score zieht nur oberhalb von HDOP { $hdop_max }, PDOP { $pdop_max } oder unterhalb von { $min_used } Satelliten ab)

engine-receiver-trust-geometry-derived-from-logged-satellites = abgeleitet aus { $n } protokollierten Satelliten

engine-receiver-trust-geometry-as-the-receiver-reports-it = wie vom Empfänger berichtet, { $n } Satelliten verwendet

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = der angegebene HDOP { $fmt_dop } weicht über die Toleranz hinaus vom HDOP { $fmt_dop2 } ab, der aus dem angegebenen Himmel abgeleitet wurde

engine-receiver-trust-geometry-satellites-in-view-but-not = Satelliten in Sicht, aber nicht verfolgt ({ $g } von { $in_view } bei oder über { $low_elev_deg } deg): Signalumgebung, nicht Geometrie

engine-receiver-trust-geometry-satellites-fewer-than = { $n } Satelliten, weniger als { $min_used }

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } über { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } über { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } Satelliten hinter der angegebenen Horizontlinie

engine-receiver-trust-geometry-every-satellite-in-one-half = alle Satelliten in einer Himmelshälfte (Lücke { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = durch die Geometrie beeinträchtigt: { $parts } ({ $from }); keine Inkonsistenz

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = das Log enthält keine Epochen: nichts darin war als { $name } lesbar ({ $skipped_records } Datensätze als beschädigt oder nicht lesbar übersprungen); prüfen Sie die Formateinstellung

engine-receiver-trust-ingest-gps-week-tow = GPS-Woche { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS-Woche { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS-TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (Datum nicht im Log)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } muss endlich und >= 0 sein (erhalten: { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s muss größer als 0 sein

engine-e-receiver-trust-live-invalid-session = ungültige Sitzung: { $e }

engine-receiver-trust-live-no-score-could-be-produced = es konnte kein Score erzeugt werden: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = es war kein GNSS-SDR-synchro- oder -pvt-Satz lesbar ({ $skipped } Zeilen übersprungen); das Zeilenformat steht in integrations/gnss-sdr/README.md

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS-TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = die IMU-Datei ist leer

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU-csv: keine Spalte `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU-euroc: keine Spalte `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = die IMU-Datei enthält keinen lesbaren Abtastwert

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis muss 0, 1 oder 2 sein (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean muss endlich sein

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at = das Log hat { $n } Abtastwerte; für eine Allan-Anpassung sind mindestens { $MIN_SAMPLES } nötig

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = die Zeit des Logs schreitet nicht fort

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = das Abtastintervall ist nicht gleichmäßig ({ $uneven } von { $n } Intervallen weichen um mehr als 25 % ab): tasten Sie das Log zuerst neu ab

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = das Log ist zu kurz, um eine Allan-Kurve zu bilden

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = die frühe Steigung der Kurve { $name } beträgt { $v }, nicht etwa -0.5: weißes Rauschen dominiert nicht (steht der Sensor still?), daher ist sein Rauschkoeffizient unzuverlässig

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = die Kurve { $name } ist zu kurz, um ihre Steigung zu prüfen

engine-receiver-trust-machines-imu-fit-id-provenance-bias-va-gyro =
    { "[" }{ $table }]
    id = { $id }
    provenance = { $provenance }
    bias = { $bias }
    q_va = { $q_va }
    gyro_bias = { $gyro_bias }
    q_arw = { $q_arw }
    bias_instability = { $bias_instability }{ "\u000A" }

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = GPS-Woche { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = es war kein BESTPOS-, RANGE- oder RXSTATUS-Log lesbar ({ $skipped } Datensätze übersprungen)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = es wurde kein gültiger RTCM-3-Frame gefunden ({ $skipped } Kandidaten bestanden die CRC-Prüfung nicht)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } muss endlich und > 0 sein (erhalten: { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard muss in (0, 1) liegen (erhalten: { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac muss in [0, 1] liegen (erhalten: { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } muss in (0, 1) liegen (erhalten: { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats muss mindestens 3 sein

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s muss mindestens 2 s betragen

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = Monitor-Konfiguration: unbekanntes Profil "{ $other }"; bekannt: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = Monitor-Konfiguration: { $name } muss endlich und > 0 sein (erhalten: { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = Monitor-Konfiguration: jam_ind_threshold muss endlich sein

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = Monitor-Konfiguration: mask_deg muss in [-90, 90) liegen (erhalten: { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = Monitor-Konfiguration: raim_pfa muss in (0, 1) liegen (erhalten: { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = Monitor-Konfiguration: cn0_min_sats muss mindestens 1 sein

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = Monitor-Konfiguration: sats_lost muss mindestens 1 sein

engine-receiver-trust-monitors-the-receiver-own-set-against = die eigene { $self_report_source }-Menge des Empfängers gegen die Monitore von Kshana; keine von beiden ist Bodenwahrheit, Übereinstimmung ist keine Prüfung gegen eine unabhängige Referenz

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = die Empfänger-Zeitleiste enthält eine nicht endliche Epochenzeit

engine-e-receiver-trust-monitors-the-log-is-shorter-than = das Log ist kürzer als das Kalibrierfenster: { $calibration_epochs } Epoche(n) vor { $cal_s } s (das Log umfasst { $span } s); zur Bildung der Basislinie sind mindestens 3 nötig

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } muss in ({ $lo }, { $hi }] liegen (erhalten: { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } gilt nur für kind = "vessel" (kind ist "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = { $path } kann nicht gelesen werden: der WebAssembly-Build hat kein Dateisystem; übergeben Sie die Datei inline als `text` oder `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` ist kein gültiges Standard-Base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: geben Sie eines von `path`, `text` oder `base64` an

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: geben Sie nur eines von `path`, `text` oder `base64` an

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } muss eine positive Zahl sein, erhalten: { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = Ereignis { $label }: onset_s muss eine nicht negative Zahl sein

engine-e-receiver-trust-scenario-event-end-must-be-after = Ereignis { $label }: end_s muss nach onset_s liegen

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg und time_offset_s müssen endlich sein

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = durchgehend vertrauenswürdig: kein Monitor hat in { $after_cal } Epochen nach der Kalibrierung Alarm gegeben

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = erster Alarm bei { $t } s; nicht vertrauenswürdig in { $untrusted_epochs } und beeinträchtigt in { $degraded_epochs } von { $after_cal } Epochen nach der Kalibrierung

engine-receiver-trust-scenario-of-stated-events-detected-within = ; { $events_detected } von { $events_evaluable } angegebenen Ereignissen innerhalb von { $detect_tol_s } s erkannt

engine-receiver-trust-scenario-of-n0-predictions-within-db = ; { $predictions_agreeing } von { $predictions_evaluable } C/N0-Vorhersagen innerhalb von { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = ; Vertrauenswert am niedrigsten { $min }, zuletzt { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = Szenario { $r } | receiver-trust | { $format_name }-Log, { $epochs } Epochen über { $duration_s } s | Monitore { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = dies ist ein Szenario der Art { $k }, kein receiver-trust-Szenario

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } muss endlich sein (erhalten: { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: erforderlich ist 0 < degraded_min < nominal_min <= 100 (erhalten: { $degraded_min } und { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s muss endlich und >= 0 sein (erhalten: { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: erforderlich ist 0 <= onset_ratio < full_ratio (erhalten: { $onset_ratio } und { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: das Gewicht von { $m } muss in [0, 100] liegen (erhalten: { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s muss endlich und positiv sein

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg muss in (0, 90) liegen

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 muss endlich und positiv sein

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m und rho0_kg_m3 müssen endlich und positiv sein

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m muss in [10 km, 1000 km] liegen

engine-reentry-reentry-allen-eggers-peak-at = Wiedereintritt (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> Spitze { $v3 } g bei { $v4 } km, { $velocity_at_peak_deceleration } m/s; die Erwärmung erreicht ihre Spitze bei { $velocity_at_peak_heating } m/s; Punktmasse (Gravitation, Krümmung, US76) Spitze { $peak_deceleration_g } g (MODELLED ballistisch, ohne Aerothermik)

## src/registry.rs

engine-e-registry-unknown-scenario-id = unbekannte Szenario-ID: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = das TRL-Band ({ $lo },{ $hi }) ist nicht wohlgeformt (erforderlich ist 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = eine aus einem Modell berechnete Aussage (nur Simulation) kann oberhalb von TRL { $MODELLED_TRL_CEILING } nicht repräsentativ sein (Band hi={ $hi }); ein höherer TRL ist eine Lücke, kein Simulationsergebnis

engine-representativeness-representativeness-representative-for-trl = Repräsentativität [{ $status }] — { $claim } (repräsentativ für TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = deklariert({ $arch }) x mittlere Quellenqualität

engine-resilience-score-weakest-rpcf-sub-score-bounded = schwächster RPCF-Teilwert = { $min_sub }; begrenzte Degradation = { $bounded } (bei unbegrenzter Degradation Obergrenze Stufe 2)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = nicht unterstützter Navigationssatz-Header { $head }: eine Zeile, die mit '>' beginnt, ist ein RINEX-4-Satz-Header, kein RINEX-3-Navigationssatz

engine-e-rinex-bad-prn-in = ungültige PRN in { $head }

engine-e-rinex-rinex-navigation-expected-record-header = RINEX-4-Navigation: ein '>'-Satz-Header wurde erwartet, gefunden: { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX-4-Satz { $head } hat { $body } Zeilen, eine { $msg }-Ephemeride benötigt 8

engine-e-rinex-rinex-record-is-followed-by = auf den RINEX-4-Satz { $head } folgt { $body }, nicht { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = ungültige(r) { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = die RINEX-Beobachtungsdatei hat kein END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = die RINEX-Beobachtungsdatei enthielt keine Epochensätze

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s muss endlich und > 0 sein (erhalten: { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s muss endlich und > 0 sein (erhalten: { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) darf time.duration_s ({ $duration_s }) nicht überschreiten

engine-e-scenario-time-grid-too-large-steps = Zeitraster zu groß: { $n } Schritte überschreiten MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); verwenden Sie eine gröbere Schrittweite oder eine kürzere Dauer

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = die Abtastrate ist mit der Coderate kommensurabel ({ $samples_per_chip } Abtastwerte/Chip, { $offset_from_integer_samples } Abtastwerte von einer ganzen Zahl entfernt): die Code-Replik mit Halteglied nullter Ordnung kann keine Codephasenänderung unterhalb von { $dead_band_chips } Chips auflösen, sodass der Early/Late-Diskriminator statt eines Dreiecks eine Treppe mit einem Totband von einem Abtastwert ist und die DLL auf der falschen Verzögerung einrastet. Verschieben Sie die Abtastrate vom ganzzahligen Vielfachen weg (5 MHz sind 4.8876 Abtastwerte/Chip; 25 MHz sind 24.4379) oder überabtasten Sie so weit, dass das Totband unter der benötigten Codephasengenauigkeit liegt.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = SGP4-Fehlercode { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = nicht unterstützter SigMF-core:datatype { $other }: dieser Leser verarbeitet die komplexen Typen cf32_le, ci16_le und ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: nur Einkanal-Aufzeichnungen werden gelesen

engine-e-sigmf-cannot-serialise-sigmf-metadata = SigMF-Metadaten können nicht serialisiert werden: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = ungültiger SigMF-Erweiterungs-Namespace { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } Annotationserweiterungs-Maps für { $annotations2 } Annotationen

engine-e-sigmf-extension-key-is-not-in = der Erweiterungsschlüssel { $k } liegt nicht im Namespace { $ns }

engine-e-sigmf-extension-key-is-already-present = der Erweiterungsschlüssel { $k } ist bereits vorhanden

engine-e-sigmf-global-is-not-an-object = global ist kein Objekt

engine-e-sigmf-annotations-is-not-an-array = annotations ist kein Array

engine-e-sigmf-annotation-is-not-an-object = die Annotation ist kein Objekt

engine-e-sigmf-invalid-sigmf-metadata-json = ungültiges SigMF-Metadaten-JSON: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = die SigMF-Aufzeichnung gibt kein positives core:sample_rate an

engine-e-sigmf-sigmf-capture-starts-at-sample = die SigMF-Aufnahme beginnt bei Abtastwert { $start }, jenseits der { $data } Abtastwerte in den Daten

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } muss in [0, 90) Grad liegen, erhalten: { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } muss eine endliche Zahl sein, erhalten: { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: ein Canyon benötigt width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m muss positiv sein, erhalten: { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: Canyon-Höhen und antenna_m müssen nicht negativ sein

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m muss positiv sein, erhalten: { $l }

engine-e-skyline-skyline-table-is-empty = skyline: die Tabelle ist leer

engine-e-skyline-skyline-table-has-rows-over = skyline: die Tabelle hat { $rows } Zeilen, über der Obergrenze von { $MAX_TABLE_ROWS } Zeilen

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: der Tabellenazimut { $az } liegt außerhalb von [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: die Tabellenazimute müssen streng ansteigen ({ $az } folgt auf { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: mehr als { $MAX_SECTORS } Sektoren

engine-e-skyline-skyline-the-sector-az-from = skyline: der Sektor az_from = { $az_from } bis az_to = { $az_to } ist leer (ein Vollkreis ist eine Tabelle oder die Maske)

engine-e-skyline-skyline-more-than-terrain-points = skyline: mehr als { $MAX_TABLE_ROWS } Geländepunkte

engine-e-skyline-skyline-terrain-distance-must-be = skyline: das Gelände-distance_m muss positiv sein, erhalten: { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance }; mit Feldern, die durch { $user } überschrieben oder ergänzt wurden

engine-skyline-stated-input = Angegebene Eingabe: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = unbekanntes skyline-Preset "{ $name }"; bekannte Presets: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = ein Datenblatt benötigt mindestens zwei Punkte der Allan-Abweichung

engine-e-slot-timing-datasheet-point-must-have-positive = der Datenblattpunkt ({ $t }, { $s }) muss eine positive Mittelungszeit und eine positive Allan-Abweichung haben

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s muss eine positive Anzahl von Sekunden sein

engine-e-slot-timing-phase-record-needs-at-least = eine Phasenaufzeichnung benötigt mindestens 32 Abtastwerte, um ein Rauschmodell anzupassen; erhalten: { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = die Phasenaufzeichnung enthält einen nicht endlichen Abtastwert

engine-e-slot-timing-the-phase-record-yields-fewer = die Phasenaufzeichnung liefert weniger als drei Punkte der Allan-Abweichung

engine-e-slot-timing-must-be-finite-and-non = { $name } muss endlich und nicht negativ sein; erhalten: { $v }

engine-e-slot-timing-the-slot-guard-must-be = der Slot-Guard muss eine positive Zeit sein

engine-e-slot-timing-sigma-must-be-positive = k_sigma muss positiv sein

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset muss endlich sein

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k muss endlich sein

engine-e-slot-timing-give-exactly-one-of-oscillator = geben Sie genau eines von oscillator.class, oscillator.preset, oscillator.datasheet oder oscillator.record an

engine-e-slot-timing-unknown-oscillator-class-csac-uso = unbekannte oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = unbekanntes oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = Klassenvorgabe { $c }: sigma_y(1 s) aus { $c2 }; Rotrauschgrenze zwei und vier Dekaden darunter synthetisiert (eine Annahme, keine Messung)

engine-slot-timing-fitted-to-the-allan-deviation = angepasst an die Maxima der Allan-Abweichung von { $document }, skaliert, sodass sie bei oder über jedem Punkt liegt

engine-slot-timing-fitted-to-the-overlapping-allan = angepasst an die überlappende Allan-Abweichung einer Aufzeichnung mit { $n_samples } Abtastwerten bei { $tau0_s } s, in der Frequenzmodulationsbasis nach IEEE Std 1139

engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } Quelle(n)): Guard { $c } ns bei k={ $k_sigma } bricht { $fmt_s } nach einer Korrektur ({ $fmt_s2 } verbleiben); Korrektur mindestens alle { $fmt_s3 } ({ $fixes_per_day } pro Tag); dominanter Term: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = die Epoche '{ $s }' muss YYYY-MM-DDTHH:MM:SS lauten

engine-solar-system-epoch-bad = Epoche '{ $s }': ungültige(r) { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb muss endlich sein

engine-e-solar-system-table-must-be-auto-table1 = table muss auto, table1 oder table2 sein; erhalten: '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = keine Ephemeride für die Verbindung { $name } nach { $name2 } bei JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = die Epoche JD { $jd } TDB liegt außerhalb von 3000 v. Chr. bis 3000 n. Chr., dem Gültigkeitsbereich der Standish-Tabellen

engine-e-solar-system-track-points-must-be-to = track_points muss 8 bis 2000 sein; erhalten: { $n_track }

engine-e-solar-system-unknown-observer-body = unbekannter Beobachterkörper '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies muss mindestens einen Körper nennen

engine-e-solar-system-unknown-body = unbekannter Körper '{ $n }'

engine-e-solar-system-no-position-for-at-jd = keine Position für { $name } bei JD { $jd } TDB (Pluto nur 1800 n. Chr. bis 2050 n. Chr.)

engine-e-solar-system-no-standish-elements-for = keine Standish-Elemente für { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliozentrischer Zustand, gelesen vom eigenen Leser der Engine

engine-e-solar-system-unknown-link-body = unbekannter Verbindungskörper '{ $from }'

engine-e-solar-system-unknown-link-body-2 = unbekannter Verbindungskörper '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = eine Verbindung benötigt zwei verschiedene Körper; erhalten: { $name }

engine-solar-system-solar-system-at-jd-tdb =
    Sonnensystem bei { $input } (JD { $jd_tdb } TDB), { $n_bodies } Körper, Beobachter { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = Lichtlaufzeit { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }Verbindung { $from } -> { $to }: einfach { $one_way_light_time_s } s, doppelt { $two_way_light_time_s } s, Shapiro { $l } us, Sonne { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = Epoche { $input } · { $standish_table } · Positionen aus den Standish-Elementen

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = die Epoche benötigt 6 Zeitfelder, erhalten: { $tokens }

engine-e-sp3-bad-second = ungültige Sekunde: { $tokens }

engine-e-sp3-record-needs-values-missing-column = der Satz benötigt 4 Werte, Spalte { $v1 } fehlt

engine-e-sp3-bad-number = ungültige Zahl: { $field }

engine-e-sp3-empty-sp3-input = leere SP3-Eingabe

engine-e-sp3-first-line-is-not-an = die erste Zeile ist kein SP3-Header: { $first }

engine-e-sp3-unsupported-sp3-version-in = nicht unterstützte SP3-Version in { $first }

engine-e-sp3-missing-epoch-count-on-header = die Epochenanzahl in Header-Zeile 1 fehlt

engine-e-sp3-record-has-no-satellite-id = der Satz hat keine Satelliten-ID: { $line }

engine-e-sp3-position-record-before-any-epoch = Positionssatz vor jedem Epochen-Header

engine-e-sp3-sp3-file-contained-no-epoch = die SP3-Datei enthielt keine Epochensätze

engine-e-sp3-bad-accuracy-exponent-in = ungültiger Genauigkeitsexponent { $f } in { $line }

engine-e-sp3-bad-header-accuracy = ungültige Header-Genauigkeit { $t }

engine-e-sp3-short-line = kurze %f-Zeile { $line }

engine-e-sp3-bad-base-in = ungültige %f-Basis in { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = die Version überschreitet 3 Bits

engine-e-space-packet-apid-exceeds-11-bits-2047 = die APID überschreitet 11 Bits (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count überschreitet 14 Bits (0..=16383)

engine-e-space-packet-data-field-must-be-at = das Datenfeld muss mindestens ein Oktett umfassen

engine-e-space-packet-data-field-exceeds-65536-octets = das Datenfeld überschreitet 65536 Oktette

engine-e-space-packet-packet-shorter-than-the-octet = das Paket ist kürzer als der 6-Oktett-Header: { $bytes } Bytes

engine-e-space-packet-declared-data-length-header-octets = angegebene Datenlänge { $data_len } (+6 Header) = { $total } Oktette, der Puffer hat aber { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC-Grob-Oktette { $coarse_octets } außerhalb von 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = CUC-Fein-Oktette { $fine_octets } außerhalb von 0..=3 (das erweiterte P-Feld wird nicht unterstützt)

engine-e-space-packet-cuc-field-extended-field-not = CUC-P-Feld { $p }: erweitertes P-Feld nicht unterstützt

engine-e-space-packet-field-time-code-id-is = P-Feld { $p }: Zeitcode-ID { $id } ist nicht CUC

engine-e-space-packet-field-is-not-cds-field = P-Feld { $p } ist kein CDS-P-Feld

engine-e-space-packet-cds-field-reserved-sub-ms = CDS-P-Feld { $p }: reservierter Sub-ms-Code 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC-Grobwert { $coarse } passt nicht in { $c } Oktette

engine-e-space-packet-cuc-fine-does-not-fit = CUC-Feinwert { $fine } passt nicht in { $n } Oktette

engine-e-space-packet-cds-days-do-not-fit = CDS-Tage { $days } passen nicht in { $f } Oktette

engine-e-space-packet-cds-ms-of-day-above = CDS-ms des Tages { $ms_of_day } über 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS-Submillisekunde { $submillis } über { $max_sub }

engine-e-space-packet-time-code-format-and-value = Zeitcode-Format und Wert gehören zu verschiedenen Codes

engine-e-space-packet-time-code-no-field-octet = Zeitcode: kein P-Feld-Oktett

engine-e-space-packet-time-code-needs-octets-present = der Zeitcode benötigt { $end } Oktette, vorhanden sind { $bytes }

engine-e-space-packet-time-code-format-differs-from = das Zeitcode-Format weicht vom impliziten P-Feld ab

engine-e-space-packet-the-format-has-time-code = das Format hat ein Zeitcode-Feld; keines angegeben

engine-e-space-packet-the-format-has-no-time = das Format hat kein Zeitcode-Feld

engine-e-space-packet-ancillary-data-is-octets-the = die Zusatzdaten umfassen { $ancillary } Oktette; das Format gibt { $ancillary_octets } an

engine-e-space-packet-secondary-header-must-hold-at = ein Sekundär-Header muss mindestens ein Oktett umfassen

engine-e-space-packet-secondary-header-needs-octets-present = der Sekundär-Header benötigt { $end } Oktette, vorhanden sind { $bytes }

engine-e-space-packet-the-format-has-secondary-header = das Format hat einen Sekundär-Header; keiner angegeben

engine-e-space-packet-the-format-has-no-secondary = das Format hat keinen Sekundär-Header

engine-e-space-packet-secondary-header-flag-disagrees-with = das Sekundär-Header-Flag { $v1 } widerspricht dem Format

engine-e-space-packet-data-field-shorter-than-the = das Datenfeld ist kürzer als der PEC

engine-e-space-packet-pec-does-not-match-the = der PEC { $v1 } stimmt nicht mit der CRC { $crc16_ccitt_false } des Pakets überein

engine-e-space-packet-nothing-to-segment-empty-user = nichts zu segmentieren: leere Nutzdaten

engine-e-space-packet-max-user-octets-must-be = max_user_octets muss mindestens 1 sein

engine-e-space-packet-first-count-exceeds-14-bits = first_count überschreitet 14 Bits (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid }, erwartet wurde { $a }

engine-space-packet-sequence-count-repeated = Sequenzzähler { $sequence_count } wiederholt

engine-space-packet-sequence-count-gap-after-packet = Sequenzzähler-Lücke: { $sequence_count } nach { $last } ({ $v2 } Paket(e) fehlen)

engine-space-packet-sequence-count-out-of-order = Sequenzzähler außer der Reihe: { $sequence_count } nach { $last }

engine-space-packet-packet-with-no-unit-open = { $f }-Paket ohne offene Einheit

engine-space-packet-packet-while-unit-is-open = { $f }-Paket bei offener Einheit

engine-e-space-packet-packet = Paket { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = die Sequenz endet mit einer noch offenen Einheit (kein letztes Paket)

engine-e-space-packet-apid-must-be-in-2047 = apid muss in 0..=2047 liegen

engine-e-space-packet-packet-count-must-be = packet_count muss >= 1 sein

engine-e-space-packet-data-len-must-be-in = data_len muss in 1..=65536 liegen

engine-e-space-packet-internal-error-encode-decode-round = interner Fehler: Abweichung beim Hin-und-zurück von Kodierung und Dekodierung

engine-space-packet-space-packet-framed-ccsds-133 = space-packet: { $packet_count } CCSDS-133.0-{ $v2 }-Paket(e) gerahmt, APID { $apid }, { $total_bytes } Oktette insgesamt, Hin-und-zurück exakt ({ $round_trip_ok })

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 muss endlich und positiv sein

engine-e-space-weather-f107a-must-be-finite-and = f107a muss endlich und positiv sein

engine-e-space-weather-kp-must-be-in = kp muss in [0, 9] liegen

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km darf nicht leer sein

engine-e-space-weather-altitude-km-must-be-finite = die Höhe { $h } km muss endlich und positiv sein

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; Dichte x{ $density_activity_factor } bei { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: ein { $what }-jammer benötigt eine positive bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: ein chirp-jammer benötigt eine positive sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to nennt das unbekannte Band { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: geben Sie entweder received_power_dbw oder eirp_dbw mit einer positiven range_m an (nicht beides)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s muss später als on_s liegen

engine-e-spectrum-welch-the-sample-rate-must = welch: die Abtastrate muss positiv sein

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } muss eine Zweierpotenz sein, mindestens 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } Abtastwerte sind weniger als ein Segment von { $nfft } Punkten

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } muss eine Zweierpotenz sein, mindestens 16

engine-e-spectrum-cannot-read-recording-meta-path = die Aufzeichnung meta_path { $meta_path } kann nicht gelesen werden: { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = Aufzeichnungsdaten { $data_path } können nicht gelesen werden: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz muss positiv sein

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: Modulation { $m } ist nicht wählbar (nur galileo-e1 akzeptiert "mboc" oder "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: Signal { $sig } ist nicht in der Signalvorgabenbibliothek enthalten ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: ein Vorgabesignal bringt seine eigene Modulation mit; lassen Sie `modulation` weg

engine-e-spectrum-signal-publishes-no-received-power = { $name }: Signal { $sig } veröffentlicht keine Empfangsleistung; geben Sie signal_power_dbw an

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: ein benutzerdefiniertes Band benötigt `modulation`, z. B. "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: ein benutzerdefiniertes Band benötigt signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: geben Sie entweder `signal` oder `centre_mhz` an, nicht beides

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: geben Sie rx_bandwidth_mhz an (es konnte keine Hauptkeule gefunden werden)

engine-e-spectrum-duration-must-be-at-least = duration_s muss mindestens einem step_s entsprechen

engine-e-spectrum-time-rows-is-more-than = { $rows } Zeitzeilen sind mehr als die erlaubten 5000

engine-e-spectrum-at-most-extra-panels = höchstens 8 zusätzliche Panels

engine-e-spectrum-panel-need-max-mhz-min = Panel { $name }: erforderlich sind f_max_mhz > f_min_mhz und 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = Raster: erforderlich sind f_max_mhz > f_min_mhz und 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = Szenariospektrum | { $bands } Bänder | { $jammers } Jammer | Rauschboden { $n0_db } dBW/Hz | schlechtestes Band { $name } min. C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = Szenariospektrum | keine Bänder | Rauschboden { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples muss zwischen 10 und 20 liegen

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: verwenden Sie cf32_le oder ci16_le

engine-spectrum-frequency-across-time-down-colour = Frequenz horizontal, Zeit vertikal, Farbe = spektrale Leistungsdichte (dBW/Hz); Rauschboden { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = jedes Panel mit eigenem Frequenzbereich, eine Zeitachse vertikal, eine Farbskala (dBW/Hz); Rauschboden { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = Bezugssystem { $other } hat keinen unterstützten NAIF-Code

engine-e-spk-writer-segment-name-longer-than-40 = Segmentname länger als 40 Zeichen: { $name }

engine-e-spk-writer-segment-name-has-non-printing = Segmentname enthält nicht druckbare Zeichen: { $name }

engine-e-spk-writer-bad-target-for-centre = ungültiges Ziel { $target } für Zentrum { $centre }

engine-e-spk-writer-degree-outside-27 = Grad { $degree } außerhalb von 1..=27

engine-e-spk-writer-type-13-degree-is-not = Grad { $degree } von Typ 13 ist nicht ungerade

engine-e-spk-writer-states-for-epochs = { $states } Zustände für { $n } Epochen

engine-e-spk-writer-states-degree-needs = { $n } Zustände; Grad { $degree } benötigt { $value }

engine-e-spk-writer-descriptor-start-is-not-before = der Beginn des Deskriptors liegt nicht vor seinem Ende

engine-e-spk-writer-epochs-are-not-strictly-increasing = die Epochen steigen nicht streng an

engine-e-spk-writer-the-epochs-do-not-cover = die Epochen decken das Deskriptorintervall nicht ab

engine-e-spk-writer-type-or-13-segment-carries = ein Segment vom Typ 9 oder 13 enthält Zustände, keine Datensätze

engine-e-spk-writer-type-segment-needs-at-least = ein Segment vom Typ 3 benötigt mindestens einen Datensatz

engine-e-spk-writer-type-degree-outside-27 = Grad { $degree } von Typ 3 außerhalb von 0..=27

engine-e-spk-writer-type-interval-length-is-not = Intervalllänge { $intlen } von Typ 3 ist nicht positiv

engine-e-spk-writer-type-record-has-coefficients-expected = Datensatz { $i } von Typ 3 hat { $value } Koeffizienten, erwartet { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = der Beginn des Deskriptors liegt nach seinem Ende

engine-e-spk-writer-descriptor-starts-before-the-first = der Deskriptor beginnt vor dem ersten Datensatz

engine-e-spk-writer-descriptor-ends-after-the-last = der Deskriptor endet nach dem letzten Datensatz

engine-e-spk-writer-type-segment-carries-records-not = ein Segment vom Typ 3 enthält Datensätze, keine Epochen oder Zustände

engine-e-spk-writer-type-21-segment-needs-at = ein Segment vom Typ 21 benötigt mindestens eine Differenzzeile

engine-e-spk-writer-difference-line-size-is-not = die Differenzzeilengröße { $dlsize } ist nicht 4 MAXDIM + 11 mit MAXDIM in 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = Differenzzeilen unterschiedlicher Größe

engine-e-spk-writer-epochs-for-difference-lines = { $epochs } Epochen für { $n } Differenzzeilen

engine-e-spk-writer-difference-line-epochs-are-not = die Epochen der Differenzzeilen steigen nicht streng an

engine-e-spk-writer-the-last-difference-line-ends = die letzte Differenzzeile endet vor dem Deskriptor

engine-e-spk-writer-zero-step-size-in-difference = Schrittweite null { $j } in Differenzzeile { $i }

engine-e-spk-writer-type-21-segment-carries-difference = ein Segment vom Typ 21 enthält Differenzzeilen, keine Zustände

engine-e-spk-writer-an-spk-needs-at-least = ein SPK benötigt mindestens ein Segment

engine-e-spk-writer-segment = Segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = Kommentarzeile enthält nicht druckbare Zeichen: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = Kommentare benötigen { $nchars } Zeichen; { $v1 } sind reserviert (erhöhen Sie ncomch)

engine-e-spk-writer-difference-line-orders-out-of = Ordnungen { $kqmax1 } { $kq } der Differenzzeile außerhalb des Bereichs

engine-e-spk-writer-zero-step-size-at-index = Schrittweite null bei Index { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } außerhalb des Segments [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = Segment { $name } von Typ 3 ist zu kurz

engine-e-spk-writer-type-segment-words-for-rsize = Segment { $name } von Typ 3: { $nw } Wörter für N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = Segment { $name } von Typ 21 ist zu kurz

engine-e-spk-writer-type-21-segment-words-for = Segment { $name } von Typ 21: { $nw } Wörter für N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = Segment { $name } ist zu kurz

engine-e-spk-writer-segment-words-for = Segment { $name }: { $nw } Wörter für N = { $n }

engine-e-spk-writer-segment-is-in-frame = Segment { $name } liegt im Bezugssystem { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = die SPK-Zentrumskette endet nicht

engine-e-spk-writer-no-spk-chain-connects-and = keine SPK-Kette verbindet { $target } und { $observer } bei ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = Epoche { $s } hat nicht die Form YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = Zeitsystem { $other } wird nicht unterstützt (UTC oder TDB)

engine-e-spk-writer-centre-has-no-supported-naif = Zentrum { $other } hat keine unterstützte NAIF-ID

engine-e-spk-writer-oem-segment-has-no-data = OEM-Segment { $name } hat keine Datenzeilen

engine-e-spk-writer-oem-segment-no = OEM-Segment { $idx }: kein { $k }

engine-e-spk-writer-no-export-settings-for-oem = keine Exporteinstellungen für OEM-Segment { $idx }

engine-e-spk-writer-oem-data-line-has-fields = OEM-Datenzeile hat { $f } Felder: { $line }

engine-e-spk-writer-oem-value = OEM-Wert { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } OEM-Segmente für { $exports } Exporteinstellungen

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF ERKANNT (fusioniert) — Schichten: { $fired }

engine-spoof-detect-single-layer-indication-below-the = Hinweis einer einzelnen Schicht ({ $fired }) unter der Fusionsschwelle — Bestätigung erforderlich

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg muss positiv sein, erhalten: { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = Panel { $i }: die Fläche muss >= 0 sein

engine-e-srp-boxwing-panel-outside = Panel { $i }: { $name } = { $c } außerhalb von [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = Panel { $i }: Absorption + spiegelnd + diffus = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = Panel { $i }: Normale/Achse gleich null

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = die ECOM2-Normalmatrix ist singulär oder schlecht konditioniert

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 min

engine-ssv-check-mod4-min = { $key } MOD4 min

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = heo-Vorgabe

engine-e-ssv-check-lunar-preset = lunar-Vorgabe

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = eine Formation benötigt mindestens einen Deputy

engine-e-ssv-formation-duration-min-and-step-must = duration_min und step_s müssen positiv sein

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = keine Signale für die gewählten Konstellationen und Bänder

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = unbekannte Antenne `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = die Muster-CSV ist leer

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` ist keine Zahl in der Muster-CSV

engine-e-ssv-scenario-pattern-csv-row-has-columns = die Muster-CSV-Zeile `{ $l }` hat { $f } Spalten, erwartet { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" benötigt genau eines von pattern_csv und pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` ist weder booklet, parametric noch table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = Empfänger: geben Sie cn0_min_dbhz oder weak_signal an, nicht beides

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = die Trägerschleife kann die angegebene Dopplerrate bei keinem C/N0 halten

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` ist weder acquisition, tracking noch both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz muss endlich sein

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: geben Sie genau eines von preset und orbit an

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` ist weder leo, meo, geo, heo noch lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: geben Sie genau eines von duration_min und duration_periods an

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } muss positiv sein

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg benötigt 1 bis 8 endliche Versätze

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd darf nicht negativ sein

engine-e-ssv-scenario-give-exactly-one-of-shell = geben Sie genau eines von [shell], [trajectory] und [navigation] an

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] benötigt eine [navigation]-Tabelle für den Chief

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include und constellations.bands dürfen nicht leer sein

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km muss über 100 liegen

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels über 5 wird nicht unterstützt

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna muss hemisphere oder omni sein

engine-e-ssv-scenario-the-shell-sweep-supports-the = der Shell-Durchlauf unterstützt nur das booklet-Sendemuster (ein geformtes Muster benötigt den Trajektoriendurchlauf)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] gilt für eine [trajectory], nicht für eine [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: geben Sie genau eines von preset und orbit an

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` ist weder leo, meo, geo, heo noch lunar-transfer

engine-e-ssv-scenario-unknown-preset = unbekannte Vorgabe

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv-Shell { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv-Navigation: Positions-RMS { $p } insgesamt, { $p2 } innerhalb der GNSS-Bahnen, { $p3 } darüber; längste Lücke { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = Deputy bei { $offset_deg } deg ({ $baseline_km } km): relativer RMS { $rel_rms_filter_m } m gefiltert gegenüber { $rel_rms_from_absolute_m } m aus absoluten Lösungen

engine-ssv-scenario-combined-max-outage-min = { $band } kombiniert 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (max. Ausfall { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv-Trajektorie { $perigee_alt_km } bis { $apogee_alt_km } km Höhe: { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min und step_min müssen positiv sein

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } muss eine positive Zahl sein, erhalten: { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = kein Normenpaket mit dem Namen `{ $id }`; vorhanden sind: { $ids }

engine-e-standards-pack-pack-manifest = Paketmanifest: { $e }

engine-e-standards-pack-test-duplicate-id = Test { $id }: doppelte ID

engine-e-standards-pack-test-scenario-is-not-in = Test { $id }: Szenario `{ $s }` ist nicht im Paket enthalten

engine-e-standards-pack-test-scored-test-needs-bar = Test { $id }: ein bewerteter Test benötigt einen Zielwert

engine-e-standards-pack-test-test-that-needs-input = Test { $id }: ein Test, der Eingaben benötigt, hat keine Zielwerte

engine-e-standards-pack-test-give-either-scenario-or = Test { $id }: geben Sie entweder `scenario` oder `needs_input` an, nicht beides und nicht keines

engine-e-standards-pack-test-supports-unknown-row = Test { $id }: stützt unbekannte Zeile `{ $r }`

engine-e-standards-pack-test-unknown-op = Test { $id }: unbekannte Operation `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = Test { $id }: der Zielwert auf { $pointer } benötigt genau eines von `value` und `against`

engine-e-standards-pack-row-duplicate-id = Zeile { $id }: doppelte ID

engine-e-standards-pack-row-asks-must-be-short = Zeile { $id }: `asks` muss eine kurze Umschreibung sein

engine-e-standards-pack-row-no-test-supports-it = Zeile { $id }: kein Test stützt sie

engine-standards-pack-not-scored-needs-input = nicht bewertet: benötigt Eingaben ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = die Studie hat keine auszuführenden Szenarien

engine-e-study-cannot-read-scenario = Szenario { $path } kann nicht gelesen werden: { $e }

engine-e-study-scenario-failed = Szenario { $path } ist fehlgeschlagen: { $e }

engine-e-study-scenario-produced-unparseable-json = Szenario { $path } hat nicht lesbares JSON erzeugt: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = ungültiges Suite-Manifest: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = unbekannte Quelle `{ $o }`: verwenden Sie `adsb` oder `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } hat { $len } Bytes, über dem Limit von { $limit } Bytes

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` ist keine ISO-8601-UTC-Zeit

engine-e-surface-invalid-receiver-trust-session = ungültige receiver-trust-Sitzung: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` ist keine ISO-8601-UTC-Zeit

engine-e-surface-dataset-custom-needs-licence-licence = der Datensatz `custom` benötigt licence, licence_url und attribution

engine-e-surface-at-least-one-map-is = mindestens eine Karte ist erforderlich

engine-e-surface-epoch = Epoche: { $e }

engine-e-surface-not-utf = { $suffix }: kein UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = unbekannte Szenarioart `{ $k }`; die Artenliste nennt jede Art

engine-surface-is-not-bundled-it = `{ $name }` ist nicht mitgeliefert: es { $why }

engine-surface-no-bundled-scenario-named-the = kein mitgeliefertes Szenario mit dem Namen `{ $name }`; die Beispielliste nennt die { $v1 }, die es sind

engine-e-surface-invalid-toml = ungültiges TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = unbekanntes Exportformat `{ $format }`; erwartet wird eines von czml, kml, geojson, stk oder sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps ergibt { $opts } Einzelbilder, und höchstens { $MAX_ANIMATION_FRAMES } werden zurückgegeben; senken Sie fps oder duration_s, oder schreiben Sie eine längere Folge mit der Befehlszeile

engine-e-surface-scenario-run-failed = Szenarioausführung fehlgeschlagen: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log nennt eine Datei `path`; geben Sie das Log als `text` oder `base64` an (diese Schnittstelle liest keine Dateien)

engine-e-surface-max-sp-errors-must-be = max_sp_errors darf höchstens 20 sein

engine-e-surface-frames-must-be-to = frames muss 1 bis { $MAX_AFS_FRAMES } sein

engine-e-surface-toi0-must-be-to-99 = toi0 muss 0 bis 99 sein

engine-e-surface-runs-given-at-most-per = { $runs } Läufe angegeben; höchstens { $MAX_COMPLIANCE_RUNS } je Bericht

engine-e-surface-the-runs-total-bytes-the = die Läufe umfassen insgesamt { $total } Bytes; das Limit für einen Bericht beträgt { $max_bytes }

engine-e-surface-result-files-given-at-most = { $results } Ergebnisdateien angegeben, höchstens 256

engine-e-surface-result-is-not-json = Ergebnis { $v1 } ist kein JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = unbekanntes Format `{ $o }`: verwenden Sie `prometheus`, `cef`, `leef`, `otlp` oder `mqtt`

engine-e-surface-unknown-imu-format-use-csv = unbekanntes IMU-Format `{ $o }`: verwenden Sie `csv` oder `euroc`

engine-e-surface-unknown-axis-use-or = unbekannte Achse `{ $o }`: verwenden Sie `x`, `y` oder `z`

engine-e-surface-id-must-be-to-64 = die ID muss aus 1 bis 64 druckbaren ASCII-Zeichen ohne Leerzeichen bestehen

engine-surface-fitted-from-stationary-imu-log = angepasst aus einem stationären IMU-Log, sha256 { $sha }, Achse { $axis }, Allan-Schätzer

engine-e-surface-unknown-input-kind-use-result = unbekannte input_kind `{ $o }`: verwenden Sie `result` oder `jsonl`

engine-e-surface-the-input-holds-no-trust = die Eingabe enthält keine Vertrauensepoche

engine-e-surface-the-reply-is-over-the = die Antwort überschreitet das Limit von { $max_bytes } Bytes; senden Sie weniger Epochen oder lassen Sie `syslog_all` ausgeschaltet

engine-e-surface-otlp-needs-build-with-the = otlp benötigt einen Build mit dem Feature `otlp`

engine-e-surface-the-pack-and-token-total = Paket und Token umfassen insgesamt { $total } Bytes; das Limit beträgt { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = das Zeitstempel-Token ist leer

engine-e-surface-must-be-64-lower-case = { $what } muss aus 64 hexadezimalen Kleinbuchstaben-Ziffern bestehen

engine-e-surface-must-be-32-bytes = { $what } muss 32 Bytes umfassen

engine-surface-verified-against-the-public-key = GEPRÜFT gegen den von Ihnen angegebenen öffentlichen Schlüssel (Fingerabdruck des Signierenden { $fp }).

engine-surface-intact-but-the-signer-is = UNVERÄNDERT, ABER DER SIGNIERENDE IST NICHT FESTGELEGT: die Hashes und die Signatur sind mit dem Schlüssel { $fp } konsistent, den das Paket selbst nennt. Geben Sie den öffentlichen Schlüssel des Signierenden an, den Sie auf einem anderen Weg vom Signierenden erhalten haben, um festzustellen, wer signiert hat.

engine-e-surface-files-must-be-json-object = files muss ein JSON-Objekt aus Name und Inhalt sein

engine-e-surface-pack-has-at-most-64 = ein Paket hat höchstens 64 Dateien

engine-e-surface-file-name-must-be-plain = der Dateiname `{ $k }` muss ein einfacher Name sein

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` ist kein gültiges Standard-Base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = unbekannter Durchlaufparameter: { $other }

engine-e-sweep-unknown-sweep-metric = unbekannte Durchlaufmetrik: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep benötigt mindestens eine Achse

engine-e-sweep-sweep-key-is-malformed = der Durchlaufschlüssel `{ $key }` ist fehlerhaft

engine-e-sweep-sweep-key-follows-an-array = Durchlaufschlüssel `{ $key }`: `{ $part }` folgt auf ein Array und muss daher ein Index sein

engine-e-sweep-unreachable = nicht erreichbar

engine-e-sweep-sweep-key-index-is-past = Durchlaufschlüssel `{ $key }`: Index { $i } liegt hinter den { $n } Einträgen des Arrays

engine-e-sweep-sweep-key-parent-is-not = Durchlaufschlüssel `{ $key }`: das übergeordnete Element von `{ $part }` ist keine Tabelle

engine-e-sweep-sweep-key-no-field = Durchlaufschlüssel `{ $key }`: kein Feld `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = Durchlaufschlüssel `{ $key }`: das übergeordnete Element von `{ $last }` ist keine Tabelle

engine-e-sweep-sweep-key-no-field-2 = Durchlaufschlüssel `{ $key }`: kein Feld `{ $last }`

engine-e-sweep-metric-no-field-in-result = Metrik `{ $path }`: kein Feld `{ $part }` im Ergebnis

engine-e-sweep-metric-value-is-not-number = Metrik `{ $path }`: der Wert ist keine Zahl

engine-e-sweep-sweep-node-serialize = Serialisierung des Durchlaufknotens: { $e }

engine-e-sweep-sweep-node-result-parse = Auswertung des Durchlaufknotenergebnisses: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = Durchlaufachse `{ $key }`: Einheit `{ $d }` deklariert, aber das durchlaufene Paket veröffentlicht `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = der Durchlauf-Worker-Thread ist abgestürzt

engine-e-sweep-generic-sweep-needs-at-least = ein generischer Durchlauf benötigt mindestens eine Achse

engine-e-sweep-generic-sweep-needs-at-least-2 = ein generischer Durchlauf benötigt mindestens eine Metrik

engine-e-sweep-generic-sweep-base-must-carry = die `base` eines generischen Durchlaufs muss ihr eigenes `kind` tragen

engine-e-sweep-generic-sweep-cannot-sweep-another = ein generischer Durchlauf kann keinen anderen Durchlauf durchlaufen

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = unbekannter Oszillator { $oscillator }; erwartet wird einer von { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day und temperature_coeff_per_k müssen endlich sein

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s muss endlich und positiv sein

engine-e-telecom-timing-duration-must-be-finite-and = duration_s muss endlich sein und mindestens zwölf Abtastwerte lang

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s muss in [0, duration_s) liegen

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns muss endlich und >= 0 sein

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = Temperatur- und Frequenzabweichungseingaben müssen endlich sein (Periode > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = der Datensatz würde 5 000 000 Abtastwerte überschreiten; erhöhen Sie sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = eine Zeitfehlerreihe benötigt mindestens 13 Abtastwerte, erhalten: { $pairs }

engine-e-telecom-timing-every-time-and-time-error = jedes time_s und time_error_ns muss endlich sein

engine-e-telecom-timing-time-must-increase = time_s muss ansteigen

engine-e-telecom-timing-the-series-must-be-uniformly = die Reihe muss gleichmäßig abgetastet sein: Schritt { $v1 } beträgt { $d } s, der erste { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV-Zeile { $v1 } ist nicht `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = die Maske ist über einen 0.1-Hz-Tiefpassfilter definiert, den diese Engine nur bei Abtastintervallen von { $MAX_FILTER_DT_S } s oder weniger anwendet; dieser Datensatz wird alle { $dt_s } s abgetastet

engine-e-telecom-timing-give-either-holdover-or-series = geben Sie entweder [holdover] oder [series] an, nicht beides

engine-e-telecom-timing-give-either-series-samples-or = geben Sie entweder series.samples oder series.csv_path an, nicht beides

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days muss endlich und >= 0 sein

engine-telecom-timing-ns-budget-exceeded-after = ; { $max_abs_te_ns }-ns-Budget nach { $t } s überschritten

engine-telecom-timing-ns-budget-never-exceeded = ; { $max_abs_te_ns }-ns-Budget nie überschritten

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns über { $v2 } s; { $masks }{ $first_budget } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = unbekanntes --format `{ $f }` (cef oder leef)

engine-e-telemetry-cli-unknown-option = unbekannte Option `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input und --result schließen einander aus

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: keine Adresse

engine-telemetry-cli-warning-metrics-is-served-without = Warnung: /metrics wird ohne Authentifizierung auf { $addr } bereitgestellt; binden Sie an localhost oder stellen Sie es hinter Ihre eigene Zugriffskontrolle

engine-e-telemetry-cli-bind = bind { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = stellt http://{ $bound }/metrics bereit

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp und --syslog-tcp schließen einander aus

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting gilt für --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: ein Topic-Teil darf nicht leer sein und weder # noch + noch ein führendes / enthalten

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp benötigt einen Build mit `--features otlp`

engine-telemetry-cli-warning-input-line = Warnung: Eingabezeile { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = { $p } kann nicht geöffnet werden: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not = Warnung: { $n } MQTT-Nachrichten wurden nicht zugestellt

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = der Endpunkt muss mit http:// beginnen

engine-e-telemetry-otlp-endpoint-has-no-host = der Endpunkt hat keinen Host

engine-e-telemetry-otlp-resolve = { $hostport } kann nicht aufgelöst werden: { $e }

engine-telemetry-otlp-no-address-for = keine Adresse für { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = Warnung: otlp-Export fehlgeschlagen: { $e }

## src/telemetry/prometheus.rs

engine-telemetry-prometheus-kshana-build-info-version = kshana_build_info{ "{" }version="{ $escape_label }"{ "}" } 1{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-score = kshana_trust_score { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-band-band = kshana_trust_band{ "{" }band="{ $b }"{ "}" } { $on }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-gate-gate = kshana_trust_gate{ "{" }gate="{ $st }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-active-reason = kshana_trust_reason_active{ "{" }reason="{ $escape_label }"{ $class }{ "}" } { $v2 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-epochs-total-band = kshana_trust_epochs_total{ "{" }band="{ $b }"{ "}" } { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-epochs-total = kshana_trust_reason_epochs_total{ "{" }reason="{ $escape_label }"{ "}" } { $n }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-input-errors-total = kshana_trust_input_errors_total { $input_errors }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-overflow-total = kshana_trust_reason_overflow_total { $reason_overflow }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-syslog-send-failures = kshana_trust_syslog_send_failures_total { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-epoch-offset-seconds = kshana_trust_epoch_offset_seconds { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-last-sample-timestamp = kshana_trust_last_sample_timestamp_seconds { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-status = kshana_trust_geometry{ "{" }status="{ $st }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-degraded = kshana_trust_geometry_degraded { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-signal-loss = kshana_trust_geometry_signal_loss { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-epochs-total = kshana_trust_geometry_epochs_total{ "{" }status="{ $st }"{ "}" } { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-label-label = kshana_trust_geometry_label{ "{" }label="{ $l }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-vdop = kshana_trust_geometry_vdop { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-help-type =
    # HELP { $name } { $help }
    # TYPE { $name } { $kind }{ "\u000A" }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = kein JSON: { $e }

engine-e-telemetry-sample-not-json-object = kein JSON-Objekt

engine-e-telemetry-sample-is-not-number = `{ $k }` ist keine Zahl

engine-e-telemetry-sample-is-not-finite = `{ $k }` ist nicht endlich

engine-e-telemetry-sample-missing = `t_s` fehlt

engine-e-telemetry-sample-score-outside-100 = `score` { $s } außerhalb von 0..=100

engine-e-telemetry-sample-missing-state = `state` fehlt

engine-e-telemetry-sample-is-not-an-array = `{ $key }` ist kein Array

engine-e-telemetry-sample-entry-has-no-name = ein Eintrag in `{ $key }` hat keinen Namen

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` fehlt oder ist keine endliche Zahl

engine-e-telemetry-sample-position-is-not-an-object = `position` ist weder ein Objekt noch null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` fehlt oder ist keine Zeichenkette

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` ist keine endliche Zahl >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` ist keine Zeichenkette

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` ist kein boolescher Wert

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` ist weder ein Objekt noch null

engine-e-telemetry-sample-result-has-no-epochs = das Ergebnis hat keine `epochs`

engine-e-telemetry-sample-bad-epochs = ungültige `epochs`: { $e }

## src/telemetry/syslog.rs

engine-telemetry-syslog-cat-gnss-trust-dvchost-cs1label = cat=gnss-trust dvchost={ $cef_ext_escape } cs1Label=band cs1={ $band }

engine-telemetry-syslog-cs2label-reasons-cs2 = { " " }cs2Label=reasons cs2={ $cef_ext_escape }

engine-telemetry-syslog-cs3label-previousband-cs3 = { " " }cs3Label=previousBand cs3={ $p }

engine-telemetry-syslog-cfp1label-trustscore-cfp1 = { " " }cfp1Label=trustScore cfp1={ $num }

engine-telemetry-syslog-cfp2label-epochoffsetseconds-cfp2 = { " " }cfp2Label=epochOffsetSeconds cfp2={ $num }

engine-telemetry-syslog-cs4label-logtime-cs4 = { " " }cs4Label=logTime cs4={ $cef_ext_escape }

engine-telemetry-syslog-cs5label-gate-cs5 = { " " }cs5Label=gate cs5={ $cef_ext_escape }

engine-telemetry-syslog-cs6label-geometry-cs6 = { " " }cs6Label=geometry cs6={ $status }{ $classes }

engine-telemetry-syslog-cfp3label-geometryhdop-cfp3 = { " " }cfp3Label=geometryHdop cfp3={ $num }

engine-telemetry-syslog-cfp4label-geometrypdop-cfp4 = { " " }cfp4Label=geometryPdop cfp4={ $num }

engine-telemetry-syslog-cn1label-geometryusedsatellites-cn1 = { " " }cn1Label=geometryUsedSatellites cn1={ $v1 }

engine-telemetry-syslog-cef-gnss-trust = CEF:0|{ $cef_header_escape }|{ $cef_header_escape2 }|{ $cef_header_escape3 }|{ $EVENT_PREFIX }.{ $band }|GNSS trust { $band }|{ $cef_severity }|{ $ext }

engine-e-telemetry-syslog-host-is-bytes-syslog-host = der Host hat { $host } Bytes; ein Syslog-Hostname hat höchstens 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = der Host muss aus druckbaren ASCII-Zeichen ohne Leerzeichen bestehen

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } vs. { $w } (nicht als f64 darstellbar)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: vorhanden, erwartet fehlend

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: fehlend, erwartet vorhanden

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } muss endlich sein

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu muss endlich und nicht negativ sein

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: Zeile { $v1 }: nicht MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: keine AR-Sätze für { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = unbekanntes Reihenformat { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } muss endlich sein

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s muss 16 bis 20000 Messungen ergeben

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } Offset { $ns } ns (Sagnac { $ns2 } ns, Ionosphäre { $ns3 } ns); kombiniert u { $ns4 } ns (Typ A { $ns5 } ns bei { $averaging_s } s); { $series } reale Reihe (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = Nicht-ASCII-Zeichen in TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE beim Lesen von { $what } abgeschnitten (Spalten { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } ist zu kurz für eine Prüfsumme in Spalte 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } hat keine Prüfsummenziffer in Spalte 69

engine-e-tle-tle-checksum-mismatch-column-69 = Prüfsumme von TLE { $label } stimmt nicht: Spalte 69 nennt { $want }, berechnet { $got }

engine-e-tle-not-tle-line = keine TLE-Zeile 1: { $line1 }

engine-e-tle-not-tle-line-2 = keine TLE-Zeile 2: { $line2 }

engine-e-tle-invalid-in-tle = ungültiger Wert für { $what } in TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = ungültiges Epochenjahr in TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = ungültige Katalognummer in TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = Inklination außerhalb des Bereichs [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = Exzentrizität außerhalb des Bereichs [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = nicht positive mittlere Bewegung: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = ungültige Mantisse von { $what } in TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = ungültiger Exponent von { $what } in TLE: { $exp }

engine-tle-satellite-line-only-element-set = Satellit { $satnum }: der Elementesatz nur mit Zeile 2 wurde als analytische Kepler-Elemente (Zweikörper) ausgewertet — die Zeile-1-Terme für Luftwiderstand/B* und die säkularen SGP4-Terme fehlen, daher weicht diese Bahn abseits der Epoche von einer echten SGP4-Anpassung ab; geben Sie die passende Zeile 1 an, um SGP4-Genauigkeit zu erhalten

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: das C/N0-Profil benötigt eine positive Epoche und Dauer

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: das C/N0-Profil würde mehr als { $MAX_DETECTOR_STEPS } Detektorschritte benötigen ({ $total } s bei { $epoch_s } s je Epoche); verkürzen Sie ramp_duration_s oder verlängern Sie predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } muss endlich sein

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } muss positiv sein (erhalten: { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips muss unter 1.9 Chips liegen (erhalten: { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio muss mindestens 1 sein (erhalten: { $pullin_bandwidth_ratio }) — eine Schleife, die mit einer SCHMALEREN Bandbreite wieder einzieht, als sie beim Nachführen verwendet, würde die Hysterese umkehren

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s darf nicht negativ sein

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) darf cn0_high_dbhz ({ $cn0_high_dbhz }) nicht überschreiten

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } darf nicht leer sein

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } hat { $axis } Einträge; die Obergrenze beträgt { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } enthält einen nicht endlichen Wert

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: die Bestätigungsverweilzeiten müssen mindestens 1 Epoche betragen

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = mindestens acht Abtastwerte sind erforderlich

engine-e-twstft-budget-samples-must-increase-in-time = die Abtastwerte müssen zeitlich ansteigen

engine-e-twstft-budget-samples-must-be-on-regular = die Abtastwerte müssen auf einem regelmäßigen Raster liegen

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } Zeilen: { $validated } gegen eine unabhängige externe Referenz geprüft, { $modelled } aus einem Modell berechnet, { $partner_owned } in Partnerhand.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = Das vollständige, maschinell geprüfte Nachweisregister: **{ $total } Zeilen — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Eine Zeile darf nur mit einer unabhängigen externen Referenz VALIDATED sein (die Invariantentests der Matrix erzwingen dies). Dieselben Daten, mit anklickbaren Links je Zeile zu jedem Test, Modul und festgeschriebenen Fixture, bilden das *Validation ledger* auf https://kshana.dev. Siehe [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md), warum jede aus einem Modell berechnete Zeile nicht gegen eine externe Referenz geprüft ist.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } Fähigkeiten mit der Kennzeichnung MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json ist kein JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json ist kein JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] benötigt `label`

engine-wasm-runs-needs-result = runs[{ $i }] benötigt `result`

engine-wasm-results-json-is-not-json = results_json ist kein JSON-Array aus Zeichenketten: { $e }

engine-wasm-maps-json-must-be-json = maps_json muss ein JSON-Array aus Zeichenketten sein: { $e }

engine-wasm-plans-json-is-not-json = plans_json ist kein JSON-Array aus Zeichenketten: { $e }

engine-wasm-options-json-is-not-json = options_json ist kein JSON: { $e }

engine-wasm-input-is-about-bytes-over = die Eingabe hat etwa { $b64 } Bytes, über dem Limit von { $v2 } Bytes

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Sequenzielle geländegestützte Navigation (rekursives SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = freie Inertialdrift (wächst)

engine-altpnt-sequential-terrain-matched-bounded = geländegestützt (begrenzt)

engine-altpnt-sequential-waypoint-full-scale = Wegpunkt →    Skalenendwert { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Kshana-Laufbericht

engine-advanced-report-meta = Art <code>{ $kind }</code> · Engine { $engine } · Szenario <code>{ $scenario }</code> (Dateiprüfsumme { $digest }…)

engine-advanced-report-toc-summary = 1 Zusammenfassung

engine-advanced-report-toc-inputs = 2 Eingaben

engine-advanced-report-toc-results = 3 Ergebnisse

engine-advanced-report-toc-aggregation = 3a Aggregation

engine-advanced-report-toc-companions = 3b Animation und Exporte

engine-advanced-report-toc-events = 4 Ereignisse

engine-advanced-report-toc-labels = 5 Verifikationskennzeichnungen

engine-advanced-report-toc-not-modelled = 6 Nicht modelliert

engine-advanced-report-toc-reproducibility = 7 Reproduzierbarkeit

engine-advanced-report-h-summary = 1. Zusammenfassung

engine-advanced-report-honesty-label = <strong>Redlichkeitskennzeichnung</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Verwendete Fähigkeiten:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (vorausgesetzt, nicht bereitgestellt); siehe Abschnitt 5.

engine-advanced-report-member-runs = <strong>Teilläufe:</strong> { $n }, aggregiert in Abschnitt 3a.

engine-advanced-report-h-inputs = 2. Eingaben

engine-advanced-report-inputs-note = Jedes Feld, das die Szenariodatei setzt, auf seinen Pfad abgeflacht. Die Einheiten stammen aus dem Block <code>units</code> des Ergebnisses (dem Feldeinheiten-Schema, docs/field-units-schema.json), sofern er das Feld beschreibt, andernfalls aus dem Suffix des Feldnamens; eine Einheit, die keines von beiden angibt, wird als nicht angegeben dargestellt.

engine-advanced-report-th-parameter = Parameter

engine-advanced-report-th-value = Wert

engine-advanced-report-th-unit = Einheit

engine-advanced-report-th-unit-source = Einheitenquelle

engine-advanced-report-h-results = 3. Ergebnisse

engine-advanced-report-chart-alt = Ergebnisdiagramm

engine-advanced-report-also-written-to = { " " }(auch geschrieben nach { $file })

engine-advanced-report-h-scalars = Skalare Ergebnisse

engine-advanced-report-h-columns = Numerische Spalten

engine-advanced-report-th-result = Ergebnis

engine-advanced-report-th-column = Spalte

engine-advanced-report-th-count = Anzahl

engine-advanced-report-th-min = Min

engine-advanced-report-th-max = Max

engine-advanced-report-th-first = Erster

engine-advanced-report-th-last = Letzter

engine-advanced-report-omitted-inputs = <p class="note">{ $n } weitere Eingaben sind auf dieser Seite ausgelassen; report.json führt dieselben Zeilen auf, und das Ergebnisdokument enthält jeden Wert.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">{ $n } weitere skalare Ergebnisse sind auf dieser Seite ausgelassen; report.json führt dieselben Zeilen auf, und das Ergebnisdokument enthält jeden Wert.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">{ $n } weitere numerische Spalten sind auf dieser Seite ausgelassen; report.json führt dieselben Zeilen auf, und das Ergebnisdokument enthält jeden Wert.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">{ $n } weitere Ereignisse sind auf dieser Seite ausgelassen; report.json führt dieselben Zeilen auf, und das Ergebnisdokument enthält jeden Wert.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Aggregation der Teilläufe

engine-advanced-report-mode = <p>Modus <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Modus <strong>{ $mode }</strong> über die Art <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Modus <strong>{ $mode }</strong>, { $n_runs } Teilläufe.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Modus <strong>{ $mode }</strong> über die Art <code>{ $kind }</code>, { $n_runs } Teilläufe.</p>{ "\u000A" }

engine-advanced-report-run-digest = Laufprüfsumme (SHA-256 über die Ergebnisprüfsummen der Teilläufe, in Ausführungsreihenfolge): <code>{ $digest }</code>

engine-advanced-report-table-empty = Diese Tabelle hat keine Zeilen: Das Ergebnis führt keine auf.

engine-advanced-report-distribution-caption = Monte-Carlo-Verteilung von { $metric } ({ $n } Stichproben), 20 gleich breite Klassen; gestrichelte Linien markieren das 5., 50. und 95. Perzentil.

engine-advanced-report-distribution-caption-unit = Monte-Carlo-Verteilung von { $metric } ({ $n } Stichproben, { $unit }), 20 gleich breite Klassen; gestrichelte Linien markieren das 5., 50. und 95. Perzentil.

engine-advanced-report-h-companions = 3b. Animation und Exporte

engine-advanced-report-animation-alt = Animation der Zeitreihen des Laufs

engine-advanced-report-animation-caption = Die eigenen Stichproben des Laufs zeichnen sich hinter einem wandernden Zeitcursor ein (die animierte Zeichnung von <code>--animate svg</code>; bei reduzierter Bewegung und im Druck zeigt sie das fertige Bild).

engine-advanced-report-no-animation = Keine Animation: { $reason }

engine-advanced-report-no-animation-default = das Ergebnis enthält keine Zeitreihe

engine-advanced-report-player-written-by = Der interaktive Player wird von <code>{ $command }</code> geschrieben.

engine-advanced-report-written-beside = Neben diesem Bericht geschrieben: { $links }.

engine-advanced-report-th-export = Export

engine-advanced-report-th-applies = Anwendbar

engine-advanced-report-th-files-or-reason = Dateien oder Grund

engine-advanced-report-written-by = geschrieben von <code>{ $command }</code>

engine-advanced-report-does-not-apply = nicht anwendbar

engine-advanced-report-yes = ja

engine-advanced-report-no = nein

engine-advanced-report-h-events = 4. Ereigniszeitachse

engine-advanced-report-events-caption = Zeitfenster als Balken, Punktereignisse als Punkte, auf der eigenen Zeitachse des Laufs.

engine-advanced-report-th-start = Beginn (s)

engine-advanced-report-th-end = Ende (s)

engine-advanced-report-th-event = Ereignis

engine-advanced-report-th-source = Quelle

engine-advanced-report-point-event = Punktereignis

engine-advanced-report-events-timeline = Ereigniszeitachse

engine-advanced-report-point-events = Punktereignisse ({ $n })

engine-advanced-report-distribution-of = Verteilung von { $metric }

engine-advanced-report-max-bin = größte Klasse { $n }

engine-advanced-report-h-labels = 5. Verifikationskennzeichnungen

engine-advanced-report-th-capability = Fähigkeit (Matrixanforderung)

engine-advanced-report-th-label = Kennzeichnung

engine-advanced-report-th-used-by = Verwendet von

engine-advanced-report-th-oracle = Quelle: unabhängige Referenz

engine-advanced-report-th-test-evidence = Testnachweis

engine-advanced-report-h-figure-tiers = Vom Ergebnis angegebene Stufen je Kennzahl

engine-advanced-report-th-figure = Kennzahl

engine-advanced-report-th-tier = Stufe

engine-advanced-report-th-matrix-requirement = Matrixanforderung

engine-advanced-report-th-applicable = Anwendbar

engine-advanced-report-no-attack = nein (kein Angriff konfiguriert)

engine-advanced-report-h-not-modelled = 6. Nicht modelliert, und Annahmen

engine-advanced-report-not-modelled-note = Jeder Punkt ist von der Stelle zitiert, an der er angegeben ist: das Ergebnisdokument, der Artenkatalog, die Szenariodatei oder die Begründung der Verifikationsmatrix, warum eine Zeile MODELLED bleibt.

engine-advanced-report-th-statement = Aussage

engine-advanced-report-h-reproducibility = 7. Reproduzierbarkeitsprotokoll

engine-advanced-report-rk-command = Befehl zur Reproduktion

engine-advanced-report-rk-working-directory = Arbeitsverzeichnis

engine-advanced-report-rk-engine-version = Engine-Version

engine-advanced-report-rk-source-commit = Quell-Commit

engine-advanced-report-rk-scenario-file = Szenariodatei

engine-advanced-report-rk-scenario-sha = SHA-256 der Szenariodatei (Secure Hash Algorithm, 256 Bit)

engine-advanced-report-rk-result-hash = Ergebnis scenario_hash

engine-advanced-report-rk-result-sha = SHA-256 des Ergebnisdokuments

engine-advanced-report-rk-seed = Seed

engine-advanced-report-rk-platform = Plattform

engine-advanced-report-rk-generated = Studie erzeugt (UTC)

engine-advanced-report-rk-determinism = Determinismus

engine-advanced-report-result-hash-none = das Ergebnisdokument gibt keinen an

engine-advanced-report-print-note = Um diese Seite in eine Portable-Document-Format-Datei (PDF) zu drucken, verwenden Sie den Druckdialog des Browsers und wählen Sie „Als PDF speichern“; das Druckformat passt auf A4- und US-Letter-Papier, wiederholt Tabellenköpfe über Seiten hinweg und beginnt die Abschnitte Eingaben, Ergebnisse, Kennzeichnungen und Reproduzierbarkeit auf einer neuen Seite. Die Engine schreibt selbst kein PDF. report.json enthält denselben Inhalt wie diese Seite.

engine-advanced-report-footer = Erzeugt von Kshana { $engine }.{ $stamp } Reproduzierbar aus Szenario + Seed + Engine-Version. Frei und quelloffen (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">Quellcode &amp; Dokumentation</a>.

engine-advanced-report-empty-inputs = Das Szenario setzt kein Feld außer `kind`: Die Art lief mit ihrer Referenzkonfiguration aus ihren dokumentierten Standardwerten.

engine-advanced-report-empty-scalars = Das Ergebnisdokument enthält keinen Skalar außerhalb seiner Arrays; seine Zahlen sind unten nach Spalten zusammengefasst.

engine-advanced-report-empty-series = Das Ergebnisdokument enthält kein numerisches Array: Jedes Ergebnis ist ein Skalar in der Tabelle oben.

engine-advanced-report-empty-events = Kein zeitgebundenes Ereignis: Das Szenario skriptet kein Zeitfenster und keinen Einsatzzeitpunkt, und das Ergebnis meldet kein Ereignis. Die Art wertet ihre Konfiguration als einen Fall aus.

engine-advanced-report-empty-not-modelled = Nichts im Ergebnis, im Artenkatalog, im Szenario oder in den verwendeten Matrixzeilen nennt eine Modellierungsgrenze für diesen Lauf.

engine-advanced-report-capabilities-statement = Jede Zeile ist eine Verifikationsmatrix-Zeile, die die Arten dieses Laufs ausüben, mit der Kennzeichnung und der unabhängigen Referenz, die die Matrix ihr zuweist (src/verification.rs, docs/VERIFICATION-MATRIX.md). Eine Kennzeichnung bewertet die Fähigkeit so, wie die Matrix sie festhält; sie bewertet nicht die Konfiguration dieses Szenarios, und eine VALIDATED-Zeile macht die Eingaben des Laufs nicht zu gemessenen. Eine PARTNER-Zeile ist eine Disziplin, auf die sich der Lauf stützt und die Kshana nicht bereitstellt.

engine-advanced-report-no-run-label = Das Ergebnis trägt keine Redlichkeitskennzeichnung auf Laufebene; die Verifikationskennzeichnungen der verwendeten Fähigkeiten stehen in einem eigenen Abschnitt, und die Stufen je Kennzahl dort, wo das Ergebnis sie angibt.

engine-advanced-report-no-seed = Weder das Szenario noch das Ergebnis enthält einen Seed. Das Ergebnis ist allein durch die Szenariodatei und den Engine-Build festgelegt; der Determinismustest führt jedes mitgelieferte Szenario erneut aus und verlangt byte-identische Ausgabe.

engine-advanced-report-working-directory = Führen Sie den Befehl in dem Verzeichnis aus, in dem der ursprüngliche Lauf gestartet wurde: Der Szenariopfad und jeder relative Datenpfad im Szenario werden relativ dazu aufgelöst. Prüfen Sie die Szenariodatei zuerst gegen scenario_sha256.

engine-advanced-report-determinism-stamped = Dieselben Szenario-Bytes, derselbe Seed und derselbe Engine-Build ergeben dasselbe Ergebnisdokument, mit Ausnahme seines Stempels meta.generated_utc, den --study-name aus der Uhr schreibt; für byte-identische Ausgabe führen Sie den Lauf ohne --study-name aus. Gleitkommaergebnisse sind je Plattform festgelegt; ein anderes Betriebssystem oder eine andere Architektur kann sich in den letzten Stellen unterscheiden.

engine-advanced-report-determinism-plain = Dieselben Szenario-Bytes, derselbe Seed und derselbe Engine-Build ergeben ein byte-identisches Ergebnisdokument und einen byte-identischen Bericht; dieser Bericht trägt keinen Zeitstempel. Gleitkommaergebnisse sind je Plattform festgelegt; ein anderes Betriebssystem oder eine andere Architektur kann sich in den letzten Stellen unterscheiden.

engine-advanced-report-not-applicable-no-attack = nicht anwendbar (kein Angriff konfiguriert)

engine-advanced-report-what-ran-default = Ein Szenario der Art `{ $kind }`.

engine-advanced-report-nothing-carried = nichts enthalten

engine-advanced-report-tbl-sweep-nodes = Durchlaufknoten

engine-advanced-report-tbl-mc-summary = Zusammenfassung der Monte-Carlo-Verteilung (Perzentile sind Nearest-Rank; das 95-%-Konfidenzintervall des Mittelwerts ist ein Perzentil-Bootstrap mit festem Seed)

engine-advanced-report-tbl-chain-phases = Kettenphasen

engine-advanced-report-tbl-shared = Gemeinsame Bedingungen

engine-advanced-report-tbl-members = Teilnehmer

engine-advanced-report-tbl-combined = Über die Teilnehmer kombiniert

engine-advanced-report-tbl-optimiser-best = Bester Wert des Optimierers (ein lokales Optimum innerhalb der angegebenen Grenzen)

engine-advanced-report-tbl-optimiser-trace = Optimierer-Verlauf

engine-advanced-report-tbl-sweep-grid = Durchlaufraster

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Geländegestützte Navigation (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Schwerekartengestützte Navigation

engine-altpnt-terrain-title-combined = Kombiniertes Schwere- + Magnetik- + Gelände-alt-PNT

engine-altpnt-terrain-free-inertial-drift = freie Inertialdrift

engine-altpnt-terrain-terrain-matched = geländegestützt

engine-altpnt-terrain-gravity-matched = schweregestützt

engine-altpnt-terrain-gravity-only = nur Schwere

engine-altpnt-terrain-magnetic-only = nur Magnetik

engine-altpnt-terrain-terrain-only = nur Gelände

engine-altpnt-terrain-combined-fused = kombiniert (fusioniert)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · Szenario { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Angriffsfläche der Signalsicherheit auf dem Mond (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = Relais in Sicht

engine-body-pnt-chart-count = Anzahl

engine-body-pnt-chart-formal-one-sigma-position = formale Ein-Sigma-Position (log10 m): blau nur Konstellation, bernstein mit der Erdentfernung

engine-body-pnt-chart-time-since-epoch = Zeit seit Epoche, 0 bis { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = Uhrzeitfehler gegenüber Schutzgrenze (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 gegenüber Tracking-Untergrenze (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = Schutzniveau gegenüber Alarmgrenze (m)

engine-campaign-chart-position-error-vs-threshold = Positionsfehler gegenüber Schwelle (m)

engine-campaign-chart-satellites-tracking = verfolgte Satelliten

engine-campaign-chart-alarm-flags-and-events = Alarmmarken und Ereignisse

engine-campaign-chart-mission-time = { $duration } s Missionszeit

engine-campaign-chart-sweep-percentile-band = , Median mit Perzentilband vom 5. bis 95. Perzentil über { $n_runs } Seeds

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) bei { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo von `{ $scenario_kind }`: { $n_runs } Seeds ab { $base_seed } (5., 50., 95. Perzentil; Balken = Bootstrap-95-%-Konfidenzintervall des Mittelwerts)

engine-campaign-chart-composed-members = zusammengesetzte Teilnehmer unter gemeinsamen Bedingungen: { $shared }

engine-campaign-chart-not-available = n/v

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Wiedergewinnung der Bogenlänge im cislunaren Raum — ein Schätzer, der die Jacobi-Matrizen nicht teilt

engine-cislunar-arc-recovery-chart-subtitle = Batch-Kleinste-Quadrate mit finiten Differenzen · gemessener Zustandswiedergewinnungsfehler · keine analytische Jacobi-Matrix, keine variationelle STM, keine SVD-Rangtoleranz

engine-cislunar-arc-recovery-chart-bound = Grenze { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = Gramian-Rangschwelle

engine-cislunar-arc-recovery-chart-monte-carlo-rms = Monte-Carlo-RMS-Positionswiedergewinnungsfehler (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = schlechtestes rauschfreies Wiedergewinnungsverhältnis (Endfehler / Verschiebung)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Cislunare Beobachtbarkeit über einen Tracking-Bogen (P6)

engine-cislunar-observability-chart-subtitle = Rang gegenüber Bogen (Einzelverbindung nur Entfernung) · Gramian-Eigenspektrum · differentialkorrigierte DRO-Anfangsbedingungen + SRIF-Gegenprüfung · { $modelled } Entwurf, { $validated } Rang/STM/Schließung

engine-cislunar-observability-chart-observable-rank = beobachtbarer Rang gegenüber Bogenlänge

engine-cislunar-observability-chart-arc-length = Bogenlänge (Zeiteinheiten im rotierenden Bezugssystem, { $arc_hours } h gesamt)

engine-cislunar-observability-chart-gramian-eigenvalues = Gramian-Eigenwerte (log10)

engine-cislunar-observability-chart-condition = Kondition κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Konfliktresilienz geschichteter PNT (P7)

engine-conflict-resilience-chart-subtitle = Totalausfall gegenüber Bedrohungsintensität (MC gegenüber geschlossener Form) · Resilienzverhältnis gegenüber Ausfallkorrelation · { $modelled } Vorannahmen, { $validated } MC->geschlossene Form / Copula-Randverteilungen

engine-conflict-resilience-chart-total-loss-probability = Totalausfallwahrscheinlichkeit gegenüber Intensität

engine-conflict-resilience-chart-threat-intensity = Bedrohungsintensität

engine-conflict-resilience-chart-layered-mc = geschichtetes MC

engine-conflict-resilience-chart-single-layer = einzelne Schicht

engine-conflict-resilience-chart-resilience-ratio = Resilienzverhältnis gegenüber Ausfallkorrelation

engine-conflict-resilience-chart-denial-correlation = Ausfallkorrelation ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = Verfügbarkeit (%)

engine-constellation-chart-mean-pdop = mittlerer PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = Erd-GNSS in Monddistanz — C/N0 gegenüber Off-Boresight-Winkel

engine-earth-gnss-lunar-chart-track-threshold = Tracking { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = Erdlimb { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = Off-Boresight-Winkel (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = Gold = verfolgbar · Rot = zu schwach · Grau = von der Erde verdeckt · { $modelled } Sendediagramm

## src/ensemble.rs

engine-ensemble-chart-title = Uhren-holdover: Konfidenzband des Zeitfehlers ({ $n_runs } Läufe)

engine-ensemble-chart-timing-error-ns = Zeitfehler (ns)

engine-ensemble-chart-spec-threshold = Spez. { $threshold } ns

engine-ensemble-chart-time-s = Zeit (s)

engine-ensemble-chart-classical-median-band = klassisch: { $id } (Median, 5-95-%-Band)

engine-ensemble-chart-quantum-median-band = Quanten: { $id } (Median, 5-95-%-Band)

## src/fom_label.rs

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Echtzeit-Vorhersagebudget für Bezugssystem / EOP bei Mondzeitgebung

engine-frame-eop-chart-ut1-error-ms = UT1-Fehler (ms)

engine-frame-eop-chart-position-at-moon-m = Position am Mond (m)

engine-frame-eop-chart-equiv-timing-ns = äquiv. Zeitgebung (ns)

engine-frame-eop-chart-prediction-horizon-days = Vorhersagehorizont (Tage)

engine-frame-eop-chart-iers-final-floor = IERS-Untergrenze der Endwerte { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m am Mond

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = Hybrid-UKF mit 17 Zuständen — Selbstkonsistenz des Filters (aus einem Modell berechnet)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + Innovationsweißheit gegenüber 95-%-χ²-Bändern; 1.0 = konsistent. Selbstkonsistenz, nicht Genauigkeit.

engine-fusion-hybrid-ukf-chart-target = Ziel 1.0

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (Weißheit)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = KONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INKONSISTENT

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Horizontaler Fehler einer lose gekoppelten GNSS/INS

engine-fusion-pack-chart-horizontal-error-m = horizontaler Fehler (m)

engine-fusion-pack-chart-spec-threshold = Spez. { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Skyplot ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = O

engine-geometry-chart-south = S

engine-geometry-chart-west = W

engine-geometry-chart-satellite-tooltip = { $system } { $id } Az { $az } El { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } Az { $az } El { $el } (von der Skyline verdeckt)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } Az { $az } El { $el } (unter der Maske)

engine-geometry-chart-no-fix = keine Lösung

engine-geometry-chart-in-view-hidden = { $n_visible } in Sicht, { $n_masked } von der Skyline verdeckt · { $dop } · hohl: nicht in Sicht

engine-geometry-chart-satellites-as-given = Satelliten wie angegeben

engine-geometry-chart-representative-sky = repräsentativer Himmel, kein datierter

engine-geometry-chart-footer = Kshana v{ $version } · Geometrie unter einem angegebenen Fehlermodell · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = RAIM-Schutzniveaus gegenüber Alarmgrenzen

engine-gnss-sim-chart-protection-level-m = Schutzniveau (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/main.rs

engine-main-fail = Fehler: { $e }

## legal (advisories, disclaimers and notices; the English text is the source, the constant in code is what machine files carry)

# legal: native review
engine-legal-compliance-statement = Eine als „evidenced“ gekennzeichnete Zeile bedeutet, dass ein Lauf in diesem Satz Belege für die Fähigkeiten liefert, die die Zeile nennt. Es ist keine Feststellung, dass ein Rahmenwerk erfüllt ist, und es bedeutet nicht, dass irgendjemand ein Produkt bewertet oder genehmigt hat. Die Spalte „gap“ gibt an, was die Läufe nicht zeigen.

# legal: native review
engine-legal-bench-surface-notice = Nur Fahrzeugbewegung und gekennzeichnete Ereignisintervalle. Nichts, was hier exportiert wird, ist ein Hochfrequenz- oder Basisbandsignal, modelliert eines oder steuert eines, und ein Ereignis ist ein Zeitintervall, keine Anleitung zur Erzeugung von Störungen. Der Laborsimulator und sein Betreiber liefern die Signale und sind dafür verantwortlich, sie nur dort auszuführen, wo dies zulässig ist (leitungsgebunden oder abgeschirmt, gemäß den eigenen Sicherheitshinweisen des Simulators). Kshana veröffentlicht keine Ergebnisse aus solchen Läufen.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC auf Fensterebene jedes Monitors auf den angegebenen Aufzeichnungen. Jedes angegebene Ereignisfenster ist ein Positivum und jedes roc_window_s-Fenster außerhalb der Ereignisse ein Negativum; ein Fenster zählt bei einer Schwelle, wenn die Teststatistik des Monitors sie im Fenster erreicht. P_fa bezieht sich auf das einzelne Negativfenster, nicht auf den einzelnen Test.

# legal: native review
engine-legal-lunanet-afs-advisory = Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Es prüft einen Symbolstrom gegen eine Ausgabe einer veröffentlichten Spezifikation und sagt nichts über einen LunaNet-Knoten oder -Dienst aus.

# legal: native review
engine-legal-iqfit-statement = MODELLED: Jede angepasste Zahl beschreibt den offenen Empfänger (den benannten Schleifenentwurf und die Front-End-Kette) auf den Aufzeichnungen, die ihm vorlagen, angepasst an die bewerteten Ergebnisse der Kampagne. Sie ist keine Messung irgendeines anderen Empfängers. Vorhersagen sind mit PREDICTION gekennzeichnet, mit der nächstgelegenen getesteten Aufzeichnung und dem Abstand außerhalb der getesteten Bedingungen.

# legal: native review
engine-legal-iqfit-advisory = Hinweis: Analyseausgabe, keine typzugelassene Navigationsausrüstung; Vorhersagen sind Modellausgaben mit angegebenem Fehler, keine Garantien.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Quellenangabe, keine Behauptung: Das Material der ICG WG-B Lunar PNT vom Juni 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, Quelle S3 der Studie) beschreibt ein Mondzeitreferenzlabor an der Station mit einem Zeitziel im Nanosekundenbereich. Kshana zitiert dieses Ziel nur als Kontext; es übernimmt es nicht, und nichts in diesem Block zeigt, dass eine reale Stationsuhr es erreicht.

# legal: native review
engine-legal-standards-pack-notice = Ein Normenpaket misst modellierte Szenarien an Zielwerten, die vor dem Lauf festgelegt wurden. Es liefert Belege für die Rahmenwerk-Zeilen, die es nennt; es bewertet oder genehmigt kein Produkt, und ein Zielwert mit dem Urteil MET besagt nur, dass die modellierte Ausgabe des Szenarios den angegebenen Zielwert erreicht hat.

# legal: native review
engine-legal-standards-pack-advisory = Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst; sie darf nicht die alleinige Grundlage für eine Navigations- oder Sicherheitsentscheidung sein.

# legal: native review
engine-legal-geometry-statement = Geometrie unter einem angegebenen Fehlermodell (MODELLED): Sichtbarkeit in Sichtlinie gegenüber der angegebenen Skyline, Dilution of Precision und eine gaußsche Fehlerellipse für unabhängige, gleiche, mittelwertfreie gaußsche Entfernungsfehler mit dem angegebenen nutzeräquivalenten Entfernungsfehler. Sie ist keine Vorhersage des realen Fehlers eines Empfängers, der außerdem Biase, Mehrwegeausbreitung und Nicht-Sichtlinien-Fehler hat, und keine Integritätsgrenze. Voreingestellte Konstellationen sind eine repräsentative Geometrie, nicht der Himmel dieses Datums an diesem Ort.

# legal: native review
engine-legal-resilience-disclaimer = Aus Simulation abgeleitete Selbstbewertung, ausgerichtet an DHS RPCF v2.0. Dies ist keine Zertifizierung oder Akkreditierung und stellt keine Genehmigung durch eine Behörde dar (DHS, IEEE oder sonstige). Jeder Teilwert ist MODELLED, sofern nicht ausdrücklich als VALIDATED gekennzeichnet, und die Werte sind Gütemaße im Zeitbereich und der Detektion, keine Genauigkeit im Positionsbereich.

# legal: native review
engine-legal-observatory-notice = Eine beeinträchtigte Zelle bedeutet, dass ein hoher Anteil der Luftfahrzeuge dort an diesem Tag eine geringe Navigationsgenauigkeit gemeldet hat. Es wird keine Ursache zugeschrieben. Eine Zelle, die nicht beobachtet wird oder fehlt, wurde nicht bewertet, was nicht dasselbe ist wie unauffällig. Nur beratend: keine Genehmigung, Zertifizierung oder Konformitätsaussage.

# legal: native review
engine-legal-receiver-trust-advisory = Beratende Software, keine typzugelassene Navigationsausrüstung (IEC 61108, IEC 61162): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# legal: native review
engine-legal-evidence-roundtrip-notice = Verknüpft vier Aufzeichnungen per Hash: das Szenario, die angegebenen Testbedingungen des Labors, das Empfängerlog und die Bewertung dieses Logs gegenüber den angegebenen Ereignissen. Es ist kein Signal, keine Wiedergabeanleitung und keine Zertifizierung. Wie die Bewegung des Szenarios zum Empfänger gelangte (eine über einen Laborsimulator abgespielte Datei, leitungsgebunden oder abgeschirmt), lag in der Verantwortung des Betreibers und wird hier nur wie angegeben festgehalten.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Dieses Paket ist eine technische Aufzeichnung dessen, was die Kshana-Engine aus dem angegebenen Empfängerlog mit der angegebenen Konfiguration berechnet hat. Es ist kein Rechtsgutachten, keine Tatsachenfeststellung zu einem Ereignis oder seiner Ursache und keine Zertifizierung.

# legal: native review
engine-legal-bench-notice = Hinweis: aus einem Modell berechnet oder gegen angegebene Referenzen gemessen, keine Genehmigung, Zertifizierung oder Konformitätsaussage. Ein Wert beschreibt ein Log oder einen Korpus, nie ein Produkt.

# legal: native review
engine-legal-osnma-advisory = Hinweis: Dies ist Analyse- und Überwachungsausgabe und keine typzugelassene Navigationsausrüstung. Der hier gemeldete Authentifizierungsstatus ist kein Navigationsintegritätsdienst und darf nicht die alleinige Grundlage für eine Navigations- oder Sicherheitsentscheidung sein.
