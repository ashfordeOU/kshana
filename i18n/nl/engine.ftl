# SPDX-License-Identifier: AGPL-3.0-only
# nl catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = onbekend kloklogformaat { $other }; verwacht een van { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = onbekend hiaatbeleid { $other }; verwacht refuse, longest of linear

engine-e-clock-log-give-either-the-log-text = geef de logtekst of het pad ervan op, niet beide

engine-e-clock-log-clock-log-needs-its-text = een kloklog heeft zijn tekst of een pad nodig

engine-e-clock-log-tau0-must-be-finite-and = tau0_s moet eindig en > 0 zijn (ontvangen: { $t })

engine-e-clock-log-units-and-data-apply-to = units en data gelden alleen voor het timelab-formaat

engine-e-clock-log-channel-applies-to-the-ticc = channel geldt alleen voor het ticc-formaat

engine-e-clock-log-cannot-read-clock-log = kan de kloklog { $path } niet lezen: { $e }

engine-e-clock-log-clock-log-path-is-not = een kloklogpad is niet beschikbaar in de WebAssembly-build; geef het log als tekst op

engine-e-clock-log-the-log-has-missing-epoch = het { $format }-log heeft { $n_missing } ontbrekende epoch(s) in { $n_gaps } hiaat/hiaten op een raster van { $tau0 } s; stel gaps = "longest" in om de langste hiaatloze reeks te behouden of gaps = "linear" om te interpoleren

engine-e-clock-log-the-log-yields-usable-sample = het { $format }-log levert { $x } bruikbare sample(s) op; er zijn er minstens 3 nodig

engine-e-clock-log-not-rinex-clock-file-no = geen RINEX-klokbestand: geen END OF HEADER-record

engine-e-clock-log-the-rinex-clock-file-has = het RINEX-klokbestand bevat geen AS- of AR-records

engine-e-clock-log-the-rinex-clock-file-holds = het RINEX-klokbestand bevat { $many } klokken; noem er een met clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = geen AS- of AR-records voor klok { $id }

engine-e-clock-log-the-clock-has-single-epoch = de klok heeft één enkele epoch; tau0 kan niet worden bepaald

engine-e-clock-log-the-log-has-no-readings = het { $format }-log bevat geen metingen

engine-e-clock-log-unknown-phase-unit-expected-ms = onbekende foseenheid { $other }; verwacht s, ms, us, ns of ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab-regel { $v1 } heeft { $v } kolom(men), de eerste dataregel heeft { $first }

engine-e-clock-log-timelab-line-has-columns-one = TimeLab-regel { $v1 } heeft { $v } kolommen; een (waarde) of twee (tijd waarde) worden gelezen

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab-regel { $v1 } is niet numeriek: { $l }

engine-e-clock-log-the-timelab-log-has-no = het timelab-log bevat geen metingen

engine-e-clock-log-unknown-data-expected-phase-or = onbekende data { $other }; verwacht phase of frequency

engine-e-clock-log-tau0-header-is-not-positive = tau0-header { $v } is geen positief aantal seconden

engine-e-clock-log-frequency-data-is-fractional-frequency = frequentiedata is relatieve frequentie; de eenheden kunnen alleen 1 zijn

engine-e-clock-log-two-column-frequency-logs-are = frequentielogs met twee kolommen worden niet gelezen; geef frequentie als enkele kolom met tau0 op

engine-e-clock-log-unknown-time-units-expected-or = onbekende time_units { $o }; verwacht s of mjd

engine-e-clock-log-the-timelab-log-time-column = de tijdkolom van het timelab-log moet oplopen

engine-e-clock-log-single-reading-tau0-cannot-be = een enkele meting; tau0 kan niet worden bepaald

engine-e-clock-log-the-timelab-log-has-non = het timelab-log bevat { $non_finite } niet-eindige meting(en)

engine-e-clock-log-the-ticc-log-holds-channels = het TICC-log bevat de kanalen { $many }; noem er een met channel = "..."

engine-e-clock-log-no-readings-on-channel-found = geen metingen op kanaal { $channel } (gevonden: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC-regels in intervalmodus bevatten geen tijd; geef tau0_s (de gebeurtenisperiode) op

engine-e-clock-log-the-readings-do-not-increase = de metingen van { $channel } nemen niet toe, dus het zijn geen tijdstempels (uitvoer van de TICC-periodemodus wordt niet gelezen; gebruik de timestampmodus)

engine-e-clock-log-single-time-stamp-tau0-cannot = een enkel tijdstempel; tau0 kan niet worden bepaald

engine-e-clock-log-two-time-stamps-apart-under = twee tijdstempels van { $channel } liggen { $w } s uit elkaar, minder dan de helft van tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = de tijdstempels van { $clock } in het { $format }-log lopen terug (een herstarte daemon of een klokstap); splits het log en lees elk deel apart

engine-e-clock-log-the-log-has-no-readings-2 = het log bevat geen { $what }-metingen

engine-e-clock-log-the-log-holds-sources-name = het log bevat { $many } bronnen; noem er een met { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = geen { $what }-metingen voor { $id } (gevonden: { $names })

engine-e-clock-log-the-servo-of-never-reached = de servo van { $id } heeft de vergrendelde toestand s2 nooit bereikt

engine-e-clock-log-the-log-has-no-chrony = het log bevat geen chrony-trackingmetingen

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = samplefrequentie { $fs_hz } Hz is geen geheel aantal samples per milliseconde

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms en noncoherent moeten positief zijn

engine-e-acquisition-the-doppler-grid-needs-positive = het Doppler-raster heeft een positieve stap en een niet-negatief maximum nodig

engine-e-acquisition-pfa-must-lie-in = pfa moet in (0, 1) liggen

engine-e-acquisition-samples-supplied-needed = { $samples } samples aangeleverd, { $needed } nodig

engine-e-acquisition-empty-doppler-grid = leeg Doppler-raster

engine-e-acquisition-the-samples-carry-no-power = de samples bevatten geen vermogen

## src/adm.rs

engine-e-adm-unknown-attitude-type = onbekend ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = een AEM heeft minstens een segment nodig

engine-e-adm-segment-is-not-version-attitude = segment { $i }: { $t } is geen standtype van versie { $version }

engine-e-adm-segment-values-for = segment { $i }: { $values } waarden voor { $t }

engine-e-adm-aem-version-has-no-ndm = AEM-versie 1.0 heeft hier geen NDM/XML-vorm; schrijf KVN

engine-e-adm-this-attitude-type-has-no = dit standtype heeft geen vorm van versie 2.0

engine-e-adm-expected-meta-start-found = verwacht META_START, gevonden: { $l }

engine-e-adm-meta-start-without-meta-stop = META_START zonder META_STOP

engine-e-adm-unexpected-metadata-line = onverwachte metadataregel { $other }

engine-e-adm-in-version-aem = { $att } in een AEM van versie { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = verwacht DATA_START na META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START zonder DATA_STOP

engine-e-adm-empty-data-line = lege dataregel

engine-e-adm-values-on-line = { $vals } waarden op een { $att }-regel: { $b }

engine-e-adm-unexpected-data-line = onverwachte dataregel { $other }

engine-e-adm-attitude-type-has-no-xml = standtype heeft geen XML-vorm

engine-e-adm-message-without-version-attribute = bericht zonder versieattribuut

engine-e-adm-expected-found = verwacht { $vers_key }, gevonden: { $other }

engine-e-adm-header-without-creation-date-or = header zonder CREATION_DATE of ORIGINATOR

engine-e-adm-missing = ontbrekend: { $k }

engine-e-adm-unexpected-keyword = onverwacht sleutelwoord { $k }

engine-e-adm-spin-block-holds-nutation-or = een spinblok bevat nutatie- of momentumdata, niet beide

engine-e-adm-unexpected-apm-keyword = onverwacht APM-sleutelwoord { $other }

engine-e-adm-unexpected-apm-line = onverwachte APM-regel { $b }

engine-e-adm-without = { $b } zonder { $stop }

engine-e-adm-unexpected-line-in = onverwachte regel in { $b }: { $other }

engine-e-adm-incomplete-group = onvolledige groep { $keys }

engine-e-adm-unknown-apm-block-start = onbekend APM-blok { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM-metadata heeft OBJECT_NAME, OBJECT_ID en TIME_SYSTEM nodig

engine-e-adm-apm-without-epoch = APM zonder EPOCH

engine-e-adm-rotation-axis = rotatieas { $o }

engine-e-adm-values-for = { $values } waarden voor { $t }

engine-e-adm-euler-record-without-euler-rot = Euler-record zonder EULER_ROT_SEQ

engine-e-adm-rotation-sequence = rotatievolgorde { $seq }

engine-e-adm-epoch-has-no = epoch { $s } bevat geen 'T'

engine-e-adm-epoch-date = epoch-datum { $date }

engine-e-adm-epoch-time = epoch-tijd { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = “{ $s }” (tekst zoals het document die vermeldt)

engine-advanced-report-mean-5th-to-95th-percentile = gemiddelde { $fmt_num } (5e tot 95e percentiel { $fmt_num2 } tot { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = field-units-schema: units-vermelding `{ $key }`

engine-advanced-report-field-units-schema-input-entry = field-units-schema: input-vermelding `{ $key }`, gekoppeld op veldnaam

engine-advanced-report-rows-of-non-numeric-column = { $n } rijen van een niet-numerieke kolom

engine-advanced-report-rows-from-to = { $nums } rijen, van { $fmt_num } tot { $fmt_num2 }

engine-advanced-report-phase-ended-by = fase { $name } (beëindigd door { $ended })

engine-advanced-report-result-timeline-phases = resultaat `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = overdracht naar fase { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = resultaat `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = scenario-invoer `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = opmerking in het scenariobestand, regel { $start }

engine-advanced-report-scenario-file-comment-lines-to = opmerking in het scenariobestand, regels { $start } tot { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } is MODELLED, niet getoetst aan een onafhankelijke externe referentie: { $it }.

engine-advanced-report-sweep-of-scale = Sweep van { $param } (schaal: { $str_of })

engine-e-advanced-report-the-result-document-is-not = het resultaatdocument is geen JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = het scenario is geen TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Monte Carlo-verdeling van { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = bij het bouwen vastgelegd uit de omgevingsvariabele { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = niet vastgelegd: deze engine is gebouwd zonder de omgevingsvariabele { $GIT_COMMIT_ENV }; de engineversie identificeert de release

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (de eigen vingerafdruk van het scenariotype voor het scenario; niet de bestandshash)

engine-advanced-report-input-file = Invoerbestand { $path }

engine-advanced-report-study-generated = { " " }Studie gegenereerd { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2-regel { $v1 }: verwacht 8 kolommen gescheiden door komma's, gevonden: { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2-regel { $v1 }: ongeldige { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2-regel { $v1 }: niet-eindige waarde

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: geen datarijen

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: { $rows } rijen vullen het rooster van { $n_lat } x { $n_lon } dat ze beslaan niet

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: dubbel knooppunt op { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = de rasterstap moet eindig en positief zijn, ontvangen: { $step }

engine-e-altpnt-maps-grid-box-must-have-north = de rasterbox moet noord > zuid en oost > west hebben, ontvangen: [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = raster van { $n_lat } x { $n_lon } knooppunten is te groot

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: de as { $what } heeft minstens 2 verschillende waarden nodig

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: de as { $what } is niet regelmatig ({ $w } tot { $w2 } ten opzichte van een gemiddelde stap van { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = de foutsigma moet eindig en niet-negatief zijn, ontvangen: { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = de correlatielengte moet eindig en positief zijn, ontvangen: { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side moet >= 2 zijn, ontvangen: { $n }

engine-e-altpnt-terrain-srtm-hgt-length = SRTM .hgt-lengte { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = een .hgt-venster heeft minstens 2 x 2 samples nodig, ontvangen: { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = de stap moet eindig en positief zijn, ontvangen: { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt-venster, lengte { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: onbekende magnetic_grid-kolom `{ $other }` (gebruik "sealevel" of "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: kan magnetic_grid csv_path { $csv_path } niet lezen: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = onbekend animatieformaat '{ $other }'; verwacht svg, html, frames of all

engine-e-animation-no-animation-format-given-expected = geen animatieformaat opgegeven; verwacht svg, html, frames of all

engine-e-animation-animation-fps-must-be-between = animatie-fps moet tussen 1 en 60 liggen, ontvangen: { $fps }

engine-e-animation-animation-duration-must-be-between = animatieduur moet tussen 0.5 s en 600 s liggen, ontvangen: { $duration_s }

engine-e-animation-animation-width-must-be-between = animatiebreedte moet tussen 480 en 3840 pixels liggen, ontvangen: { $width }

engine-e-animation-duration-fps-gives-frames-the = duur x fps geeft { $n } frames; de framereeks heeft tussen 2 en { $v1 } nodig

engine-e-animation-result-is-not-json = resultaat is geen JSON: { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = missietijd ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (vereist een ffmpeg gebouwd met librsvg; rasteriseer anders eerst de frames)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }{ $omitted } overige reeksen zijn gevonden maar niet getekend (de speler toont ten hoogste { $MAX_CHARTS } panelen van { $MAX_TRACES } sporen); ze staan in het manifest van de frames-export.

## src/antenna.rs

engine-antenna-altitude-beamwidth-deg-points = hoogte { $a_lo }-{ $a_hi } m x bundelbreedte { $b_lo }-{ $b_hi } deg, { $points } punten

engine-antenna-limb-capture-is-reached-on = limb-capture WORDT bereikt op dit raster ({ $grid }): { $points } van { $points2 } bemonsterde werkpunten vangen de limb en { $crossings } askruising(en) zijn gelokaliseerd; de sterkste bemonsterde limb-J/S is { $limb_js_db } dB op hoogte { $altitude_m } m / bundelbreedte { $hpbw_deg } deg, tegenover een capture-drempel van { $thr } dB.

engine-antenna-limb-capture-is-not-reached = limb-capture wordt NERGENS bereikt op dit raster ({ $grid }) - niet nul capture, maar geen limb-capture: de beste limb-J/S is { $limb_js_db } dB op hoogte { $altitude_m } m / bundelbreedte { $hpbw_deg } deg, { $shortfall } dB onder de capture-drempel van { $thr } dB; dat werkpunt zou de limb vangen bij { $limb_capture_tx_power_dbw } dBW zendvermogen tegenover de { $p_tx_dbw } dBW die werd gevlogen.

engine-e-antenna-azimuths-must-strictly-increase = azimuts moeten strikt oplopen

engine-e-antenna-azimuths-must-span-less-than = azimuts moeten minder dan 360 deg beslaan

engine-e-antenna-off-boresight-angles-must-strictly = off-boresight-hoeken moeten strikt oplopen

engine-e-antenna-gain-grid-does-not-match = het gainraster komt niet overeen met de assen

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = de versterkingen K en P moeten eindig en positief zijn

engine-e-aocs-at-least-three-reaction-wheels = minstens drie reactiewielen zijn vereist

engine-e-aocs-wheel-spin-axis-must-be = wiel { $i }: de spinas moet een eenheidsvector zijn

engine-e-aocs-wheel-js-and-max-must = wiel { $i }: js en u_max moeten eindig en positief zijn

engine-e-aocs-the-wheel-spin-axes-do = de spinassen van de wielen overspannen geen drie dimensies

engine-e-aocs-inertia-minus-the-wheels-spin = traagheid min de spintraagheid van de wielen moet positief-definiet zijn

engine-e-aocs-inertia-must-be-finite-and = traagheid moet eindig en symmetrisch zijn

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis moet een eindige vector ongelijk aan nul zijn

engine-e-aocs-kind-must-be-finite-and-positive = { $n } moet eindig en positief zijn

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s mag hoogstens 2e6 stappen zijn

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s moet een geheel veelvoud van dt_s zijn

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 en omega0_rad_s moeten eindig zijn

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm moet eindig zijn

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s moet eindig zijn

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s moet minstens dt_s zijn

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs: { $n_w } wielen, slew van { $duration_s } s vanaf { $series_err } deg -> { $settle } | eindfout { $final_err } deg | piekwiel { $peak_speed } rpm | { $v7 }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = onbekende dienst '{ $other }' (verwacht navigation|nav of communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = onbekend arbitragebeleid '{ $other }' (verwacht navigation-priority, communications-priority of first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = een contactplan heeft minstens een contactvenster nodig

engine-e-aperture-duty-apertures-must-be = apertures moet >= 1 zijn

engine-e-aperture-duty-the-reporting-horizon-must-be = de rapportagehorizon moet eindig zijn

engine-e-aperture-duty-contact-has-non-finite-aos = contact '{ $name }' heeft een niet-eindige aos_s of los_s

engine-e-aperture-duty-contact-must-have-los-aos = contact '{ $name }' moet los_s > aos_s hebben

engine-e-aperture-duty-contact-plan-needs-at-least-2 = een contactplan heeft minstens een [[contacts]]-venster nodig

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: { $sessions } sessie(s) op { $apertures } aperture(s) onder { $policy } -> navigatiebelasting { $navigation_duty }, communicatiebelasting { $communications_duty }, inactief { $idle_duty }; { $total_outage_s } s van { $total_requested_s } s gevraagd verloren door contentie (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Studie gegenereerd { $html_escape }.

engine-e-api-failed-to-serialise-report-to = rapport serialiseren naar JSON mislukt: { $e }

engine-e-api-invalid-scenario = ongeldig scenario: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you = onbekend scenariotype { $other } — bedoelde u { $hint }? `kshana kinds` toont alle { $n } ingebouwde typen.

engine-api-unknown-scenario-kind-kshana-kinds = onbekend scenariotype { $other }. `kshana kinds` toont alle { $n } ingebouwde typen.

engine-api-required-fields = - **Verplichte velden:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Optionele velden:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML-parseerfout: { $e }

engine-api-could-not-classify-scenario-kind = kon het scenariotype niet bepalen: { $e }

engine-api-missing-required-field = { $kind_name }: ontbrekend(e) verplicht(e) veld(en) — { $options }

engine-api-missing-required-field-2 = { $kind_name }: ontbrekend verplicht veld "{ $entry }"

engine-e-api-invalid-orbit-scenario = ongeldig baanscenario: { $e }

engine-e-api-sp3-export-requires-an-orbit = SP3-export vereist een baanscenario, niet '{ $k }'

engine-e-api-omm-export-requires-an-orbit = OMM-export vereist een baanscenario, niet '{ $k }'

engine-e-api-oem-export-requires-an-orbit = OEM-export vereist een baanscenario, niet '{ $k }'

engine-e-api-invalid-scenario-toml = ongeldige scenario-TOML: { $e }

engine-e-api-could-not-re-serialise-scenario = kon het scenario niet opnieuw serialiseren: { $e }

engine-api-scenario-jamming-availability-under-jamming = scenario { $r } | jamming { $v2 } | beschikbaarheid onder jamming { $availability_under_jamming } (nominaal { $availability_nominal }) | min. tracking { $min_tracking } | gemiddelde J/S { $v6 }

engine-e-api-the-result-document-already-carries = het resultaatdocument bevat al `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = figure_tiers serialiseren mislukt: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = ongeldig { $label }-scenario: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = scenario { $r } | kwantum-holdover { $holdover_s }s p95 { $pos_p95_m }m | klassieke holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = scenario { $r } | spoof { $scn } t.o.v. { $threshold_ns } ns-specificatie (P_fa { $target_pfa }) | kwantumbeveiliging { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | klassieke beveiliging { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal = integriteit | { $n_sats } satellieten | { $samples_available }/{ $samples_total } epochs beschikbaar ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } integriteitsgebeurtenissen, { $report3 } HMI

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | zuidpool | { $samples_available }/{ $samples_total } epochs beschikbaar ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | seculiere LTC−TT-snelheid { $secular_rate_us_per_day } µs/day (band { $band_low }–{ $band_high }) | zelfpotentiaal { $self_potential_us_per_day } kinetisch { $kinetic_us_per_day } | offset @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | basislijn { $baseline_km } km | bakenafstand { $beacon_range_km } km | vertraging { $report } µs (snelheid { $delay_rate_s_per_s } s/s) | nabije veld { $near_field_correction_us } µs | { $samples } samples over { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats = lunar-joint-od-clock | { $n_sat } sats, { $n_earth } aardstations | 3D-stationsfout met VLBI { $station_pos_err_m } m tegenover alleen afstand { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× scherper) | sat-pos RMS { $sat_pos_rms_m } m | stationsklokfout { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } params

engine-api-builtins-lunar-frame-realisation-points-translation = lunar-frame-realisation | { $n_points } punten | translatiefout { $trans_err_norm_m } m, rotatiefout { $rot_err_norm_rad } rad, schaalfout { $scale_err_ppb } ppb | rms-residu { $rms_residual_m } m | geconvergeerd { $converged }

engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } sats ({ $geometry_label }) | { $n_grid_points } punten × { $n_epochs } epochs | dekking { $coverage_pct }% (PDOP<{ $pdop_threshold }) | sats { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL-beschikbaarheid { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemeride { $report } ({ $provenance }) σ_URE vereist { $fmt } t.o.v. Kepler { $fmt2 } t.o.v. verstoord { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | { $n_sats } sats (illustratief LCNS-type, niet gelieerd) | basislijn { $baseline_km } km | gebruikersfout { $user_error_uncorrected_m } m → { $user_error_corrected_m } m ({ $reduction_factor }× reductie) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } punten x { $n_epochs } epochs x { $n_trials } trials | beschikbaarheid { $v4 } % | dekking { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | gecorrigeerd p{ $percentile } 3D { $f } (ongecorrigeerd { $f2 }) | HPL max { $f3 } | MODELLED; geen uitspraak over enig echt systeem

engine-api-builtins-terrain-horizon-at-the-station = { " " }| terreinhorizon ({ $sources }) bij het station max { $horizon_max_deg } deg, gebruikerspunten gemiddeld max { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame = lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } toestanden, OEM { $oem_line_count } regels | formaatcontrole { $v5 } ({ $present_fields } aanwezig / { $missing_fields } ontbrekend) | OEM-roundtrip { $v8 } | tijdmeta-roundtrip { $v9 } | KIF { $kif_bytes } bytes | MODELLED

engine-api-builtins-scenario-optical-sync-rms-ps = scenario { $r } | optisch sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | kwantumketen { $quantum_chain_sigma_s }s t.o.v. klassiek { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | beveiliging Pd { $security_pd } (Pfa { $monitor_pfa }) | anomalie Pd { $anomaly_pd } | afweging: kwantum wint { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | uitval { $outage_s }s | kwantum-positiefout { $quantum_pos_err_m } m t.o.v. klassiek { $classical_pos_err_m } m ({ $improvement_x }x) | holdover kwantum { $quantum_holdover_s }s t.o.v. klassiek { $classical_holdover_s }s (drempel { $threshold_m } m) | afweging: kwantum wint { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC kwantum { $quantum_auc } t.o.v. klassiek { $classical_auc } | minimaal detecteerbare fout kwantum { $quantum_min_detectable } t.o.v. klassiek { $classical_min_detectable } | { $fault_catalog } foutklassen | afweging: kwantum wint { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] geldt alleen voor het fusion-type

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = scenario { $r } | kwantum PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integriteit { $integ } beveiliging { $security_na } | klassieke PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integriteit { $integ2 } beveiliging { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = scenario { $r } | gefuseerd | kwantum PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integriteit { $integ } beveiliging { $security_na } | klassieke PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integriteit { $integ2 } beveiliging { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = scenario { $r } | hybrid-ukf (17 toestanden, MODELLED) | sensor { $v2 } (q_va { $effective_q_va }) | klok q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } in [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } in [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | ondersteund { $aided_pos_rms_m }m -> coast { $coast_end_pos_rms_m }m over { $coast_duration_s }s | zelfconsistentie, geen nauwkeurigheid

engine-api-builtins-scenario-gnss-ins-quantum-outage = scenario { $r } | gnss-ins | kwantum uitval-RMS gefuseerd { $fused_outage_rms_m }m t.o.v. vrij { $free_outage_rms_m }m (hold { $holdover_s }s, besch. { $availability }) | klassiek gefuseerd { $fused_outage_rms_m2 }m t.o.v. vrij { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, besch. { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = scenario { $r } | gnss-sim | gemiddelde iono { $mean_iono_m }m tropo { $mean_tropo_m }m | RAIM-beschikbaarheid { $raim_availability } gemiddelde HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m foutfrequentie { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = scenario { $r } | spoof-detect | { $n_sats } SVs, +{ $power_advantage_db } dB{ $v4 } | { $push } push | gefuseerde score { $score } (drempel { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = sweep { $metric } over { $parameter } ({ $first }..{ $last }, { $points } punten, schaal { $scale }) | kwantum { $first2 }->{ $last2 } | klassiek { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = scenario { $r } | { $nominal }/{ $series } samples GNSS-nominaal | beste PDOP { $fnum } pos { $posm } | kwantum-holdover { $holdover_s }s p95 { $ns1 }ns integriteit { $integ } beveiliging { $security_na } | klassieke holdover { $holdover_s2 }s p95 { $ns12 }ns integriteit { $integ2 } beveiliging { $security_na }

engine-e-api-builtins-ephemeris = efemeride: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| max. elevatie { $el }° piek-Doppler { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat = scenario { $r } | { $source } | { $n_samples } samples | hoogte { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | snelheid { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }

engine-api-builtins-generic-sweep-of-over-nodes = generieke sweep van `{ $kind }` over [{ $keys }] | { $points } knooppunten (vorm { $shape }) | metrics [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | vrije inertiale drift { $free_inertial_drift_m } m | zwaartekrachtgematcht { $map_matched_error_m } m | matching-sigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| referentiegraad { $reference_nmax } anomalie-std { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| kaartfout-MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% binnen { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | vrije inertiale drift { $free_inertial_drift_m } m | terreingematcht { $matched_error_m } m ({ $v3 }x reductie) | matching-sigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } waypoints | vrij-inertiaal RMS { $free_inertial_rms_m } m (eind { $free_inertial_final_m } m) | terreingematcht RMS { $matched_rms_m } m (eind { $matched_final_m } m, { $v6 }x reductie) | gemiddelde ESS { $mean_ess }/{ $cfg } | matching-sigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | vrije inertiale drift { $free_inertial_drift_m } m | zwaartekracht { $gravity_only_m } m magnetisch { $magnetic_only_m } m terrein { $terrain_only_m } m | GEFUSEERD { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] vereist runs = 1: een gemeten log is een enkel record

engine-api-builtins-scenario-runs-quantum-holdover-p95 = scenario { $r } | { $runs } runs | kwantum-holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns beveiliging { $security_na } | klassieke holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns beveiliging { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = scenario { $r } | kwantum-holdover { $holdover_s }s p95 { $ns1 }ns integriteit { $integ } beveiliging { $security_na } | klassieke holdover { $holdover_s2 }s p95 { $ns12 }ns integriteit { $integ2 } beveiliging { $security_na }

engine-api-builtins-raim-available-of-epochs-denied = { " " }| RAIM beschikbaar { $n_available } van { $n_epochs } epochs ({ $n_denied } geweigerd, { $n_alarm } alarmen; MODELLED)

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = een referentiegeval heeft minstens een satelliet nodig

engine-e-araim-reference-reference-case-needs-at-least-2 = een referentiegeval heeft minstens een constellatie nodig

engine-e-araim-reference-satellite-names-constellation-but-only = satelliet { $i } noemt constellatie { $constellation }, maar alleen { $constellations } zijn gedeclareerd

engine-e-araim-reference-satellite-has-non-positive-error = satelliet { $i } heeft een niet-positieve foutvariantie

engine-e-araim-reference-both-integrity-risk-allocations-must = beide allocaties van integriteitsrisico moeten positief zijn

engine-e-araim-reference-this-reference-implementation-monitors-single = deze referentie-implementatie bewaakt alleen foutmodi met een enkele gebeurtenis, maar de a-priorikansen van het geval vereisen N_fault,max = { $nfm } (gelijktijdige deelverzamelingen met meerdere gebeurtenissen). Er wordt geweigerd in plaats van foutmodi te weinig te tellen.

engine-e-araim-reference-the-all-in-view-geometry = de all-in-view-geometrie is singulier

engine-e-araim-reference-no-fault-mode-is-observable = geen foutmodus is waarneembaar op deze geometrie

engine-e-araim-reference-unknown-reference-vector-known-vectors = onbekende referentievector '{ $vector }'; bekende vectoren: { $ids } (of 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: { $wanted } gepubliceerde WG-C-referentievector(en); slechtste VPL/HPL-overeenkomst { $worst_acceptance } m ten opzichte van de eigen TOL_PL = { $tol } m van de referentie over { $acceptance_checked } toetsvector(en)

engine-e-araim-reference-sat-needs-one-value-per = P_sat heeft een waarde per satelliet nodig en P_const een per constellatie

engine-e-araim-reference-satellite-names-an-undeclared-constellation = een satelliet noemt een niet-gedeclareerde constellatie

engine-e-araim-reference-every-prior-must-lie-in = elke a-priorikans moet in [0, 1) liggen

engine-e-araim-reference-the-priors-need-subsets-of = de a-priorikansen vereisen deelverzamelingen van { $n_fault_max } gelijktijdige gebeurtenissen; dit pad somt er hoogstens { $most } op

engine-e-araim-reference-the-all-in-view-solution = de all-in-view-oplossing is niet geselecteerd

engine-e-araim-reference-an-add-v4-case-needs = een ADD v4.2-geval heeft satellieten en constellaties nodig

engine-e-araim-reference-nom-and-sat-need-one = b_nom en P_sat hebben een waarde per satelliet nodig

engine-e-araim-reference-const-needs-one-value-per = P_const heeft een waarde per constellatie nodig

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = satelliet { $i } noemt een niet-gedeclareerde constellatie

engine-e-araim-reference-one-constellation-index-per-satellite = een constellatie-index per satelliet

engine-e-araim-reference-satellite-names-constellation-with-no = satelliet { $i } noemt constellatie { $c } zonder ISM

engine-e-araim-reference-fewer-than-four-satellites-above = minder dan vier satellieten boven het masker

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m moet minstens een standoff bevatten

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (band { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | footprint { $a2 }% capture, limb { $footprint_limb_captured } | spoof-capture { $spoof_captured } (lock { $spoof_lock_time_s } s) | mastbereik { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% van 50 bit/s), { $nma_auth_latency_s } s latentie

engine-attack-surface-reached-crossing-best-db = bereikt ({ $crossings } kruising(en), best { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = NIET bereikt op dit raster (best { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB tekort; vereist { $best_limb_capture_tx_power_dbw } dBW tegenover { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| footprint-sweep { $s }x{ $s2 } (hoogte { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), capture { $v5 }-{ $v6 }% | limb { $limb }

engine-attack-surface-afs-received-dbw = AFS ontvangen: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Tekort: { $deficit_db } dB (band { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Capture-footprint: { $a }% van de schijf, limb gevangen: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Spoof-capture pull-in: { $spoof_captured } (lock { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Mastbereik: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limb: gevangen op raster van { $na }x{ $nb }, { $crossings } kruising(en)

engine-attack-surface-limb-not-captured-on-grid = Limb: niet gevangen op raster van { $na }x{ $nb }; vereist { $best_limb_capture_tx_power_dbw } dBW (gevlogen { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km moet eindig en positief zijn

engine-e-attitude-budget-inertias-must-be-finite-and = traagheidsmomenten moeten eindig en positief zijn

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 moet >= i_min_kg_m2 zijn

engine-e-attitude-budget-at-least-one-pointing-contributor = minstens een pointingbijdrage is vereist

engine-e-attitude-budget-contributor-sigma-must-be-finite = de sigma van bijdrage '{ $name }' moet eindig en >= 0 zijn

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> GG-koppel { $t_gg } N·m; pointing { $total }" RSS (dominant: { $dominant }) (MODELLED scalair budget)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } heeft een waarde nodig

engine-bench-cli-unknown-option = onbekende optie `{ $a }`

engine-bench-cli-unexpected-argument = onverwacht argument `{ $pos }`

engine-bench-cli-cannot-read = kan { $p } niet lezen: { $e }

engine-bench-cli-cannot-create = kan { $d } niet aanmaken: { $e }

engine-bench-cli-cannot-write = kan { $p } niet schrijven: { $e }

engine-bench-cli-unknown-task-or = onbekende taak `{ $t }` (a, b, c of d)

engine-bench-cli-scored-epochs-in-folder = { $labels } gescoorde epochs in { $folders } map(pen)

engine-bench-cli-wrote-cases-json-and-truth = geschreven: { $out }/cases.json en { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = GEWEIGERD: deze vastlegging is voorlopig en de seed is blootgelegd; het is geen achtergehouden set voor een release

engine-bench-cli-mismatch-the-seed-is-not = AFWIJKING: de seed is niet de seed achter deze vastlegging

engine-bench-cli-is-not-json = { $f } is geen JSON: { $e }

engine-bench-cli-cannot-read-2 = kan { $i } niet lezen: { $e }

engine-bench-cli-result-rendered = { $results } resultaat/resultaten weergegeven

engine-bench-cli-unknown-subcommand =
    onbekend subcommando `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = kan { $path } niet aanmaken (een bestaand seedbestand wordt nooit overschreven): { $e }

engine-bench-cli-cannot-write-2 = kan { $path } niet schrijven: { $e }

engine-bench-cli-seed-written-to-keep-it = seed geschreven naar { $path }: houd het buiten versiebeheer en buiten elk bericht; alleen de onderstaande hash is openbaar

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (overgenomen, niet opnieuw uitgevoerd)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = impairment-eval-basislijn: { $det }

engine-bench-cli-no-scenario-json-under = geen scenario.json onder { $root }

engine-bench-cli-is-not-json-2 = { $path } is geen JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } in orde, { $bad } afwijkend, { $missing } ontbrekend, { $unpinned } niet vastgezet

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = onbekende split `{ $other }` (dev, test of holdout)

engine-bench-score-for-is-not-finite = score voor `{ $id }` is niet eindig

engine-bench-case-have-no-score-the = { $missing } geval/gevallen hebben geen score, het eerste is `{ $first_missing }`

engine-bench-predictions-name-case-that-is = voorspellingen noemen een geval dat niet in de referentie staat: `{ $extra }`

engine-bench-schema-must-be = `schema` moet `{ $RESULT_SCHEMA }` zijn

engine-bench-must-be-64-digit-hex = `{ $k }` moet een SHA-256 van 64 hexcijfers zijn

engine-bench-truth-is-not-json = de referentie is geen JSON: { $e }

engine-bench-predictions-are-not-json = voorspellingen zijn geen JSON: { $e }

engine-bench-truth-schema-must-be = `schema` van de referentie moet `{ $TRUTH_SCHEMA }` zijn

engine-bench-predictions-schema-must-be = `schema` van de voorspellingen moet `{ $PREDICTIONS_SCHEMA }` zijn

engine-bench-truth-was-made-under-another = de referentie is opgesteld onder een andere specificatieversie dan { $SPEC_VERSION }; resultaten van verschillende hoofdversies worden nooit gemengd

engine-bench-unknown-task = onbekende taak `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = resultaat { $v1 } is niet geldig: { $p }

engine-bench-site-result-is-task-holdout-result = resultaat { $v1 } is een holdout-resultaat van taak (d) zonder `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = resultaat { $v1 } is gescoord op een voorlopige, blootgelegde holdout-seed: geen achtergehouden set voor een release

engine-bench-site-result-was-scored-under-this = resultaat { $v1 } is gescoord onder { $v }; deze pagina is voor { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = score voor `{ $k }` is geen getal

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (0.35 standaard monitorstatistiek)

engine-bench-tasks-malformed-clock-line = misvormde klokregel `{ $line }`

engine-bench-tasks-the-clock-file-does-not = het klokbestand komt niet overeen met de vastgezette SHA-256 (ontvangen { $got }, verwacht { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = satelliet { $prn } staat niet in het klokbestand

engine-bench-tasks-kshana-bench-baseline = kshana-bench-basislijn: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = voorspellingen dekken { $pmap } gevallen, de referentie heeft er { $tarr }

engine-bench-tasks-case-has-no-number-array = geval `{ $id }` heeft geen getallenreeks

engine-bench-tasks-case-needs-values-has = geval `{ $id }` heeft { $n } waarden nodig, heeft er { $a }

engine-bench-tasks-case-has-non-finite-value = geval `{ $id }` heeft een niet-eindige waarde

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialiseren van { $name }: { $e }

engine-e-bin-crossover-study-write = schrijven van { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = fout: kan { $dir } niet aanmaken: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = klaar: inertiaal { $nodes } knooppunten, klok { $curves } curven (seed 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in = { $n } gebruikersepochs x 3 URA-waarden in { $dt } s = { $v1 } ms per gebruikersepoch ({ $ok } oplosbaar)

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = docs/INTEROP.md geschreven (exporttabel)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = validatieoverzicht geschreven naar { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = onbekend hemellichaam '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigeert rond een ander hemellichaam dan de aarde met een aardverbinding; { $name } wordt hier niet ondersteund

engine-e-body-pnt-duration-and-step-must-be = duration_s en step_s moeten positief zijn met hoogstens 20000 epochs; ontvangen: { $duration } en { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind moet orbiter of surface zijn; ontvangen: '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = de hoogte van de gebruiker moet positief zijn en de excentriciteit in [0, 0.9) liggen

engine-e-body-pnt-the-user-orbit-periapsis-is = de periapsis van de baan van de gebruiker ligt onder het oppervlak

engine-e-body-pnt-constellation-needs-to-200-satellites = de constellatie heeft 1 tot 200 satellieten in minstens een vlak nodig

engine-e-body-pnt-constellation-altitude-must-be-positive = de hoogte van de constellatie moet positief zijn

engine-e-body-pnt-range-sigmas-must-be-positive = de afstandssigma's moeten positief zijn

engine-e-body-pnt-no-earth-position-relative-to = geen aardpositie ten opzichte van { $name } op JD { $jd }

engine-e-body-pnt-serialising-report = rapport serialiseren: { $e }

engine-e-body-pnt-the-report-must-serialise-to = het rapport moet naar een JSON-object serialiseren

engine-body-pnt-positioning-around-user-relays-at =
    Positiebepaling rond { $name } — { $user_kind }-gebruiker, { $n_relays } relays op { $r } km, { $n_epochs } epochs
    { "  " }Lichttijd naar de aarde { $one_way_light_time_s } s enkele reis, { $two_way_light_time_s } s heen en terug; hoek zon-aarde-lichaam { $sun_separation_deg } deg
    { "  " }beschikbaarheid: { $availability_relays } alleen constellatie, { $availability_with_earth } met de aardafstand (aarde in zicht { $earth_visibility })
    { "  " }mediane PDOP { $opt }; RMS-fout { $opt2 } alleen constellatie, { $opt3 } met de aardafstand
    { "  " }mediane formele sigma { $opt4 } alleen constellatie, { $opt5 } met de aardafstand{ "\u000A" }

engine-body-pnt-positioning-around = Positiebepaling rond { $name }

engine-body-pnt-user-relays-earth-light-time = { $user_kind }-gebruiker · { $n_relays } relays · lichttijd naar de aarde { $one_way_light_time_s } s · MODELLED

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = het E1-scenario is geen tabel

engine-e-calibration-ensembles-e1-scenario-has-no-monte = het E1-scenario heeft geen [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } ontbreekt

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 is `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ensembles van elk 200 realisaties, tegen de gesloten vorm: gemiddelde 0, sigma = { $sigma } ns. Ensemble j gebruikt basis-seed 1 000 000 + 1000 j en bootstrap-seed 20260928 + j. De grootste relatieve ADEV-fout was { $max } voor E2 en { $max2 } voor E3 (over 1, 10 en 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = leeg resultaatpad

engine-e-campaign-result-path-has-an-empty = resultaatpad `{ $path }` heeft een leeg segment

engine-e-campaign-result-path-bad-index-in = resultaatpad `{ $path }`: ongeldige index in `{ $part }`

engine-e-campaign-result-path-no-field = resultaatpad `{ $path }`: geen veld `{ $name }`

engine-e-campaign-result-path-indexed-value-is = resultaatpad `{ $path }`: de geïndexeerde waarde is geen array

engine-e-campaign-result-path-index-out-of = resultaatpad `{ $path }`: index { $i } buiten bereik ({ $n })

engine-e-campaign-result-path-value-is-not = resultaatpad `{ $path }`: waarde is geen getal of vlag

engine-e-campaign-result-path-is-not-an = resultaatpad `{ $path }`: `{ $k }` is geen array

engine-e-campaign-result-path-must-name-one = resultaatpad `{ $path }` moet één waarde noemen, geen rijen

engine-e-campaign-result-path-is-not-an-2 = resultaatpad `{ $path }`: `{ $name }` is geen array

engine-e-campaign-metric-path-has-no-entry = metriekpad `{ $path }` heeft geen vermelding in het units-blok van dat type; declareer de `unit` ervan in de campagne

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` moet bestaan uit letters, cijfers, `_` of `-` en mag niet leeg zijn

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: een campagne kan geen campagne bevatten

engine-e-campaign-serialise = { $label }: serialiseren: { $e }

engine-e-campaign-result-did-not-parse = { $label }: resultaat kon niet worden geparseerd: { $e }

engine-e-campaign-seed-key-no-field-in = seedsleutel `{ $key }`: geen veld `{ $part }` in het scenario

engine-e-campaign-seed-key-is-not-non = seedsleutel `{ $key }` is geen niet-negatief geheel getal

engine-e-campaign-seed-does-not-fit-toml = seed { $seed } past niet in een TOML-geheel getal

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = tijdpad `{ $t }` moet rijen noemen met `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` is niet below, above of abs_above

engine-campaign-threshold-is-null = drempel `{ $p }` is null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` is niet mean, min, max of count

engine-campaign-time-path-gives-several-values = tijdpad `{ $t }` geeft meerdere waarden per rij

engine-campaign-value-path-has-fewer-rows = waardepad `{ $y }` heeft minder rijen dan `{ $t }`

engine-campaign-value-path-has-rows-time = waardepad `{ $y }` heeft { $r } rijen, tijdpad `{ $t }` heeft er { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = een campagne met fasen heeft een [timeline] met step_s nodig

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s moet positief zijn, ontvangen: { $step }

engine-e-campaign-phase-is-named-twice = fase `{ $name }` is twee keer benoemd

engine-e-campaign-phase-duration-must-be-non = fase `{ $name }`: duration_s moet niet-negatief zijn

engine-e-campaign-phase-has-no-runs = fase `{ $name }` heeft geen runs

engine-e-campaign-phase-the-first-phase-has = fase `{ $name }`: de eerste fase heeft niets om over te dragen

engine-e-campaign-phase-handoff-from-channel-which = fase `{ $name }`: overdracht van kanaal `{ $ch }`, waarmee de vorige fase niet eindigde

engine-e-campaign-phase-handoff-from-run-does = fase `{ $name }`: overdracht from_run { $from_run } bestaat niet

engine-e-campaign-phase-handoff-is-null = fase `{ $name }`: overdracht `{ $from }` is null

engine-e-campaign-phase-handoff-run-does-not = fase `{ $name }`: overdracht van run { $run } bestaat niet

engine-e-campaign-phase = fase `{ $name }`: { $e }

engine-campaign-phase-run = fase { $name }/run { $ri }

engine-e-campaign-phase-end-at-run-does = fase `{ $name }`: end_at_run { $end_at_run } bestaat niet

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s is later)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } is null)

engine-e-campaign-phase-side-is-not-classical = fase `{ $name }`: zijde `{ $side }` is niet classical of quantum

engine-e-campaign-phase-skip-must-be-non = fase `{ $name }`: skip_s moet niet-negatief zijn

engine-e-campaign-phase-alarm-compare-is-not = fase `{ $name }`: alarm-compare `{ $compare }` is niet below, above of abs_above

engine-e-campaign-phase-alarm-threshold-is-null = fase `{ $name }`: alarmdrempel `{ $p }` is null

engine-e-campaign-phase-channel-is-in-not = fase `{ $name }`: kanaal `{ $channel }` is in { $u }, niet in { $du }

engine-e-campaign-phase-channel-needs-unit = fase `{ $name }`: kanaal `{ $channel }` heeft een eenheid nodig

engine-e-campaign-phase-two-runs-both-provide = fase `{ $name }`: twee runs leveren beide kanaal `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = fase `{ $name }` draagt `{ $ch }` over, waarmee de vorige fase niet eindigde

engine-e-campaign-phase-carries-but-no-run = fase `{ $name }` draagt `{ $ch }` over, maar geen enkele run ervan levert `{ $ch }`

engine-e-campaign-channel-is-in-in-one = kanaal `{ $name }` is in { $unit } in de ene fase en in { $unit2 } in een andere

engine-e-campaign-at-least-one-metric-is = er is minstens één metriek nodig

engine-e-campaign-metric-is-named-twice = metriek `{ $name }` is twee keer benoemd

engine-e-campaign-seed-overflow-in-the-ensemble = seed-overloop in het ensemble

engine-e-campaign-an-ensemble-needs-at-least = een ensemble heeft minstens één run nodig

engine-e-campaign-sweep-takes-one-to-three = een sweep heeft één tot drie assen, ontvangen: { $axes }

engine-e-campaign-axis-is-named-twice = as `{ $name }` is twee keer benoemd

engine-e-campaign-axis-needs-at-least-two = as `{ $name }` heeft minstens twee stappen nodig

engine-e-campaign-axis-scale-must-be-lin = as `{ $name }`: scale moet lin of log zijn

engine-e-campaign-axis-log-axis-needs-positive = as `{ $name }`: een log-as heeft positieve uiteinden nodig

engine-campaign-sweep-node = sweepknooppunt { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs moet minstens twee zijn

engine-e-campaign-compose-needs-at-least-one = compose heeft minstens één lid nodig

engine-e-campaign-shared-value-must-be-number = gedeelde waarde `{ $name }` moet een getal of getallen zijn

engine-e-campaign-shared-value-is-named-twice = gedeelde waarde `{ $name }` is twee keer benoemd

engine-e-campaign-member-binds-unknown-shared = lid `{ $label }` bindt onbekende gedeelde waarde `{ $name }`

engine-e-campaign-member = lid `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = metriek `{ $name }` is in { $u } voor één lid en in { $unit } voor `{ $label }`

engine-e-campaign-member-is-named-twice = lid `{ $label }` is twee keer benoemd

engine-e-campaign-invalid-campaign-scenario = ongeldig campagnescenario: { $e }

engine-e-campaign-invalid-campaign = ongeldige campagne: { $e }

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } van { $what } over de realisaties

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = waarde van { $ch } aan het einde van de vorige fase, opgeteld bij de { $ch } van deze fase

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } op het tijdraster: het laatste sample van de run van de eigenaarsfase op of vóór elke rastertijd (zero-order hold); null waar geen run van die fase het levert

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = waarden van de scenariosleutel { $key } langs as { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = waarde van de scenariosleutel { $key } op dit knooppunt

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } van het resultaat van het knooppunt

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } van elke realisatie, in volgorde van seed

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = gedeelde waarde { $name }, geschreven in elk lid dat haar bindt

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = metriek { $name } gelezen uit het resultaat van het lid

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = kleinste { $name } over de leden

engine-campaign-largest-across-the-members = grootste { $name } over de leden

engine-campaign-mean-across-the-members = gemiddelde { $name } over de leden

engine-e-campaign-failed-to-serialise-campaign-result = serialiseren van het campagneresultaat mislukt: { $e }

engine-campaign-chain-phases-over-events-alarm = chain: { $phases } fasen over { $duration_s } s, { $events } gebeurtenissen, alarm gegeven op { $alarm_s } s van het raster

engine-campaign-sweep-of-nodes-over = sweep van `{ $scenario_kind }`: { $nodes } knooppunten over [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Monte Carlo van `{ $scenario_kind }`: { $runs } seeds

engine-campaign-compose-members = compose: { $members } leden

engine-campaign-member-runs-modelled = { $runs_total } runs van leden (MODELLED)

engine-campaign-sweep-of-over-nodes-each = sweep van `{ $scenario_kind }` over { $axis_order } ({ $nodes } knooppunten{ $v4 }; elke lijn op een eigen bereik)

engine-campaign-campaign-modelled-composition-every-value = campagne { $r } | MODELLED samenstelling; elke waarde gelezen uit een echte run van het genoemde type

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = een optimalisatie heeft één tot drie params, ontvangen: { $params }

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` is twee keer benoemd

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: heeft eindige lo < hi nodig

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale moet lin of log zijn

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: een log-param heeft positieve grenzen nodig

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start moet in [lo, hi] liggen

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: een raster heeft minstens twee stappen nodig

engine-e-campaign-optimize-objective-target-is-only-read = objective.target wordt alleen gelezen met goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" heeft een eindige objective.target nodig

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal moet minimize, maximize of target zijn, ontvangen: `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = een raster van { $total } knooppunten ligt boven de limiet van 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps wordt alleen gelezen met method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals moet de initiële simplex dekken (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step moet in (0, 1] liggen

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol en xtol moeten niet-negatief zijn

engine-e-campaign-optimize-method-must-be-grid-or = method moet grid of nelder-mead zijn, ontvangen: `{ $other }`

engine-campaign-optimize-optimize-eval = optimize-evaluatie { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = ondergrens van de scenariosleutel { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = bovengrens van de scenariosleutel { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = waarde van de scenariosleutel { $key } bij de beste evaluatie

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = waarde van de scenariosleutel { $key } bij deze evaluatie

engine-campaign-optimize-target-value-of = doelwaarde van { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } bij de beste evaluatie

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } van deze evaluatie (het gemiddelde over de seeds als runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) van `{ $scenario_kind }` met { $method }: { $evals } evaluaties ({ $stop_reason }), beste { $o2 } bij [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START vóór de header CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: misvormde headerregel: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: misvormde metadataregel: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: misvormde dataregel: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: onbekend datasleutelwoord { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: dataregel { $k } mist een epoch

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: dataregel { $k } mist een waarde

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: dataregel { $k } heeft een ongeldige waarde { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: niet afgesloten segment (META_STOP/DATA_STOP ontbreekt)

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: ongeldige TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: ongeldige TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = onbekende observable `{ $other }`: verwacht een van range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = onbekende coordinates `{ $other }`: verwacht een van cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours moet eindig en positief zijn, ontvangen: { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs moet ≥ 2 zijn, ontvangen: { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps moet ≥ 1 zijn

engine-e-cislunar-arc-recovery-trials-must-be = trials moet ≥ 1 zijn

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations moet ≥ 1 zijn

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd moet eindig en positief zijn, ontvangen: { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor moet eindig en positief zijn, ontvangen: { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km moet eindig en positief zijn, ontvangen: { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m moet eindig en positief zijn, ontvangen: { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s moet eindig en positief zijn, ontvangen: { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = de constellatie moet minstens een chief en één referentie bevatten

engine-e-cislunar-arc-recovery-family-is-an-out-of = familie `{ $family }` is een familie buiten het vlak en heeft geen vlakke representatie met vier toestanden: stel spatial = true in om haar te sweepen

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = het voorwaartse model gaf een niet-eindige referentiemeting

engine-cislunar-arc-recovery-first-arc-length-at-which = eerste booglengte waarbij de ruisvrije batch-oplossing van ELKE geseede trial de eindtoestandsfout terugbrengt tot ten hoogste { $recovery_factor } keer de a-priori-verplaatsing waarmee zij begon. Dit is het herstelanaloog van het rangcriterium: bij exacte metingen wordt de vraag `is the state observable?` tot `can an estimator get it back?`, en geen enkele tolerantie voor singuliere waarden speelt een rol in het antwoord.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = eerste booglengte waarbij de Monte Carlo-RMS-fout van het positieherstel over { $trials } geseede ruisrealisaties daalt tot of onder { $error_bound_km } km. Dit is het herstelanaloog van het schatbaarheidscriterium, gemeten in plaats van voorspeld: de fout is de afstand van de schatting tot de bekende referentie, niet het spoor van een formele covariantie.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED binnen één stap van het epochraster: de schatter herstelt vanaf { $e } h, het Gramian-rangcriterium keert bij { $g } h (verhouding { $v1 }, raster { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED als herstelbaarheidsgrens: de schatter herstelt vanaf { $e } h, { $v1 } de { $g } h van het Gramian-rangcriterium (verhouding { $v2 }, raster { $grid_hours } h). Het rangcriterium is een relatieve conventie voor singuliere waarden; de herstelgrens is een gemeten toestandsfout, en de twee vallen hier niet samen.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: de schatter haalt zijn herstelgrens op deze boog nooit, terwijl het Gramian-rangcriterium bij { $g } h keert.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = het Gramian-rangcriterium wordt op deze boog nooit gehaald (de geometrie bereikt nooit volledige rang), terwijl de schatter herstelt vanaf { $e } h — de twee zijn het oneens over de vraag of er überhaupt een grens bestaat.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | familie { $family }, { $state_dim } toestanden, { $n_spacecraft } s/c, observable { $observable }, parametrisering { $coordinates } | boog van { $arc_hours } h, { $epochs } epochs (raster { $grid_hours } h), { $trials } trials, seed { $seed } | partiële afgeleiden met eindige differenties, geen analytische Jacobiaan / STM / SVD / SRIF | ruisvrij herstel vanaf { $nf } (factor { $recovery_factor }) t.o.v. Gramian-rangdrempel { $gram } | Monte Carlo-schatbaarheid vanaf { $est } (RMS pos ≤ { $error_bound_km } km, σ { $sigma_range_m } m) t.o.v. Gramian-schatbaarheid { $gram_est } | RMS pos aan het einde van de boog { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = onbekende familie `{ $other }`: verwacht een van dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO bij kruisingsafstand { $d } kon niet differentieel worden gecorrigeerd

engine-e-cislunar-observability-member-at-x0-did-not = { $label }-lid { $i } bij x0 = { $x0 } kon niet differentieel worden gecorrigeerd

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft moet tussen 2 en { $MAX_SPACECRAFT } liggen, ontvangen: { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs moet ≥ 2 zijn, ontvangen: { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol moet eindig en positief zijn, ontvangen: { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m moet eindig en niet-negatief zijn, ontvangen: { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km moet eindig en positief zijn, ontvangen: { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } s/c ({ $refs } refs) | boog van { $arc_hours } h, { $rank_arc } epochs | rang { $first } → { $last } van { $state_dim } over de boog | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | ogenblikkelijke rang alleen afstand { $rank_range_only } → afstand+afstandssnelheid { $rank_range_rate } ({ $n_links } links) | GDOP alleen afstand { $ro } afstand+afstandssnelheid { $rr } | DRO-beginvoorwaarden (max. periodiciteitsresidu { $max_resid }) | SRIF-posterior eindig bij epoch met rang 4 { $srif_epoch } (getoetst: rang/STM/DRO-sluiting/SRIF; berekend uit een model: ontwerp)

engine-cislunar-observability-never-rank-of = nooit (rang { $rank } van { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | familie { $family }, { $state_dim } toestanden, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | rangdrempel { $rank_thr } (raster { $c } h) | schatbaarheidsdrempel (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = eerste booglengte waarbij de formele 1σ-positieonzekerheid van de INITIËLE toestand van de chief, σ_pos = sqrt(trace(P_rr)) met P = (ÕᵀÕ)⁻¹ en Õ de door meetruis gewhitende waarneembaarheidsmatrix, daalt tot of onder { $sigma_pos_threshold_km } km. Dit is het criterium waaronder een drempel voor de booglengte überhaupt ruisafhankelijk is: P schaalt met σ², dus σ_pos schaalt met σ, terwijl het rangcriterium hierboven niet met σ meebeweegt. De grens is een VASTGESTELDE ingenieurskeuze, geen gefitte — estimability_sweep rapporteert de drempel bij vier andere grenzen.

engine-cislunar-observability-extension-r3-this-run-is = UITBREIDING (R3) — deze run is NIET de vlakke DRO-configuratie die het `label` hierboven beschrijft. Toestandsdimensie { $state_dim }; baanfamilie { $family }; { $n_spacecraft } ruimtevaartuigen; afstandsmeting-sigma { $sigma_range_m } m. Waar `label` "planar" en "planar DROs" zegt, lees de hier genoemde familie. VALIDATED toevoegingen: de variationele 6x6-STM is dezelfde door eindige differenties getoetste CR3BP-STM (crate::cr3bp) die op volle breedte wordt gebruikt; de ruimtelijke Jacobiaanrijen voor afstand / afstandssnelheid zijn door eindige differenties getoetste analytische partiële afgeleiden, waarbij de rij voor afstandssnelheid component voor component is gecontroleerd tegen de onafhankelijke 3D-functie deepspace_od::range_rate_observable van de crate; de beginvoorwaarden van halo en NRHO zijn differentieel gecorrigeerde periodieke banen van dezelfde corrector die de gepubliceerde zuidelijke L2 9:2 NRHO reproduceert, voortgezet vanaf die gepubliceerde seed, en het sluitingsresidu van elk lid wordt gerapporteerd; de RANG-oordelen voor zes toestanden worden bevestigd met een ONAFHANKELIJKE rij-echelonrang (gauss-eliminatie met partiële pivotering) die geen code deelt met de eigen-/SVD-route. EERLIJKE REIKWIJDTE VAN DE SRIF-TAK: de SRIF-kruisvalidatie hierboven gebruikt DEZELFDE meet-Jacobianen en reduceert tot dezelfde O^T O, dus haar overeenstemming is een consistentiecontrole tussen twee numerieke machines, GEEN onafhankelijke bevestiging van de drempel — ze telt niet als toetsing van enig cijfer hier. MODELLED: het familieontwerp (welke abscissen, amplitudes en fasen), het epochraster, de boog met één link en de vastgestelde positiegrens van het schatbaarheidscriterium.

engine-cislunar-observability-validated-each-constellation-initial-condition = Getoetst: elke beginvoorwaarde van de constellatie is een differentieel gecorrigeerde periodieke baan van de familie { $family }, die over één periode sluit tot het gerapporteerde periodiciteitsresidu (vlakke DRO's zijn bovendien retrograde om de Maan). De familie wordt gecorrigeerd bij de massaverhouding van Aarde en Maan. Berekend uit een model: de keuze van familieparameters en fasen (het ontwerp van de constellatie). De sleutelnaam `dro_provenance` blijft behouden voor het vrijgegeven documentschema; ze bevat de familie waar deze run om vroeg.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } moet eindig en positief zijn, ontvangen: { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } moet in (0, 1) liggen, ontvangen: { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg moet in [0, 90) liggen

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems moet minstens één voorinstelling noemen

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias heeft eindige bias_m, t0_s en t1_s nodig

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch = integrity: { $n } epochs overschrijden de limiet van { $MAX_EPOCHS } epochs; verhoog step_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: geen records

engine-e-clock-library-card-records-at-different-tau0 = { $name }: records met verschillende tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: periodieke kleinste-kwadratenmethode mislukt

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: { $used } stabiliteitspunten met edf >= { $MIN_FIT_EDF }; een kaart heeft er drie nodig

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = hiaten { $g }, fase-uitschieters { $o }, fasesprongen { $p }, bursts { $b }, frequentiesprongen { $f } (robuuste sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` is geen niet-negatief geheel getal

engine-e-compliance-is-missing = `{ $p }` ontbreekt

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } is groter dan events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } is groter dan predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: de aantallen voor ontvangervertrouwen zijn misvormd ({ $malformed_counts }); uitgesloten

engine-e-compliance-not-json = { $label }: geen JSON: { $e }

engine-compliance-cannot-read = { $label }: kan niet lezen: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: het zusterscenario noemt type `{ $s }` maar het resultaat noemt `{ $o }`; niet gebruikt

engine-e-compliance-scenario-kind-not-found-no = { $label }: scenariotype niet gevonden (geen zusterscenariobestand, geen receiver-trust-resultaat, geen `kind` op het hoogste niveau)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` is geen scenariotype dat de engine kent; niet gebruikt

engine-compliance-written-by-kshana = Geschreven door kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } test(s) waarbij elke vermelde drempel is gehaald, { $not_met } waarbij een drempel niet is gehaald, { $needs_input } die invoer nodig hebben.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = het intensiteitsraster moet een eindige min < max hebben, ontvangen: [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = het intensiteitsraster heeft >= 2 stappen nodig, ontvangen: { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = het correlatieraster moet minstens één waarde hebben

engine-e-conflict-resilience-correlation-values-must-lie-in = correlatiewaarden moeten in [0, 1] liggen, ontvangen: { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience heeft minstens één laag nodig

engine-e-conflict-resilience-layer-availability-not-in = laag { $i } availability { $availability } niet in [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = laag { $i } sigma_m moet eindig en positief zijn

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = laag { $i } vulnerability moet eindig en >= 0 zijn

engine-e-conflict-resilience-layer-vector-weight-must-be = laag { $i } vector_weight moet eindig en >= 0 zijn

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } buiten bereik (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials moet >= 1 zijn

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } lagen ({ $primary } basislijn) | referentie-intensiteit { $reference_intensity } | veerkrachtverhouding gesloten vorm { $ratio_closed_form }x MC { $ratio_mc_independent }x (gelaagd t.o.v. enkellaags) | correlatie ondermijnt gelaagdheid: verhouding { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | prior-betrouwbaarheidsinterval [{ $ratio_lo }-{ $ratio_hi }]x | overleving per vector @ ref jam { $surv }% spoof { $surv2 }% kinetic { $surv3 }% cyber { $surv4 }% (scherpste { $sharpest }) | ~7x kopgetal MODELLED, VALIDATED MC->gesloten vorm / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = onbekend centraal hemellichaam { $name }: verwacht een planeet, Pluto, de Maan of een grote maan (earth, moon, mars, europa, titan, ...; zie crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = een Walker-shell heeft total > 0 en planes > 0 nodig

engine-e-constellation-walker-total-is-not-multiple = Walker total { $total } is geen veelvoud van planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = Walker-fasering F = { $phasing } moet in 0..planes (= { $planes }) liggen

engine-e-constellation-is-not-an-expandable-gps = { $name } is geen uitbreidbaar GPS-slot (SPS PS Tabel 3.2-2 noemt B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: geef altitude_km of semi_major_axis_km op, niet beide

engine-e-constellation-needs-altitude-km-or-semi = { $what }: heeft altitude_km of semi_major_axis_km nodig

engine-e-constellation-semi-major-axis-km-is = { $what }: halve lange as { $v1 } km ligt niet boven de straal van { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: excentriciteit { $e } moet in [0, 0.9) liggen

engine-e-constellation-perigee-is-below-the-surface = { $what }: het perigeum ligt onder het oppervlak van { $name }

engine-e-constellation-constellation-preset-is-an-earth = constellatie { $name }: voorinstelling { $p } is een aardconstellatie, het hemellichaam is { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = constellatie { $name }: onbekende voorinstelling { $other } (verwacht gps-baseline, gps-expandable, galileo, beidou, beidou-meo of glonass)

engine-e-constellation-constellation-expanded-applies-only-to = constellatie { $name }: `expanded` geldt alleen voor de voorinstelling gps-expandable

engine-constellation-constellation-shell = constellatie { $name } shell { $v2 }

engine-constellation-explicit-element-sets = { $satellite } expliciete elementensets

engine-constellation-constellation-satellite = constellatie { $name } satelliet { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = constellatie { $name } heeft geen satellieten: geef een voorinstelling, een [[constellation.shell]] of een [[constellation.satellite]] op

engine-e-constellation-no-constellation-given = geen constellatie opgegeven

engine-e-constellation-constellations-with-one-clock-each = { $constellations } constellaties met elk één klok overschrijden de limiet van { $MAX_CLOCKS } klokken; gebruik clock = "common" of voeg constellaties samen

engine-e-constellation-must-be-finite = { $what } moet eindig zijn

engine-e-constellation-need-step-and-duration-step = step_s > 0 en duration_s >= step_s zijn nodig

engine-e-constellation-more-than-100-000-epochs = meer dan 100 000 epochs; verhoog step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg moet in [0, 90) liggen

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold moet positief zijn

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg moet in [0.25, 90] liggen

engine-e-constellation-need-90-lat-min-deg = -90 <= lat_min_deg < lat_max_deg <= 90 is nodig

engine-e-constellation-need-lon-min-deg-lon = lon_min_deg < lon_max_deg is nodig, met een spreiding van hoogstens 360 deg

engine-e-constellation-give-at-least-one-constellation = geef minstens één [[constellation]] op

engine-e-constellation-track-points-is-capped-at = track_points is begrensd op 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } satellieten overschrijdt de limiet van 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: { $total } satellieten ({ $names }) rond { $name }; beschikbaarheid { $global_availability_pct }% (PDOP <= { $pdop_threshold } bij { $mask_deg } deg masker), slechtste locatie { $worst_site_availability_pct }%, mediane PDOP { $cov }, gemiddeld { $global_mean_visible } in zicht; { $grid_points } rasterpunten x { $epochs } epochs (MODELLED)

engine-constellation-constellation-coverage-over-the = Constellatiedekking boven { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } moet eindig en positief zijn

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } moet eindig en >= 0 zijn

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw moet eindig zijn

engine-e-contact-schedule-satellite-altitude-km-must-be = satelliet '{ $name }': altitude_km moet in (100, 40000) liggen

engine-e-contact-schedule-satellite-inclination-deg-must-be = satelliet '{ $name }': inclination_deg moet in [0, 180] liggen

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satelliet '{ $name }': backlog_mbit moet >= 0 zijn

engine-e-contact-schedule-satellite-priority-must-be = satelliet '{ $name }': priority moet > 0 zijn

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satelliet '{ $name }': eirp_dbw moet eindig zijn

engine-e-contact-schedule-station-lat-deg-in-90 = station '{ $name }': lat_deg in [-90, 90], lon_deg eindig

engine-e-contact-schedule-station-mask-deg-must-be = station '{ $name }': mask_deg moet in [0, 90) liggen

engine-e-contact-schedule-station-alt-must-be-in = station '{ $name }': alt_m moet in [0, 3000] liggen (bereik van ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = station '{ $name }': setup_s >= 0 en g_over_t_db eindig

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours moet in (0, 168] liggen

engine-e-contact-schedule-step-must-be-in-300 = step_s moet in (0, 300] liggen

engine-e-contact-schedule-at-least-one-satellite-and = minstens één satelliet en één station zijn vereist

engine-e-contact-schedule-at-most-32-satellites-and = hoogstens 32 satellieten en 32 stations

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: { $satellites } satellieten x { $stations } stations over { $duration_hours } h -> { $cands } kandidaatcontacten, { $greedy } ingepland; { $total_del } van { $total_backlog } Mbit afgeleverd{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: { $pairs } passage(s); ACM { $acm } Mbit t.o.v. CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = minstens 2 trials en een eindige sigma_m > 0 zijn nodig

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total moet in (0, 1) liggen

engine-e-dop-error-ci-no-local-frame-at-the = geen lokaal referentiestelsel bij de gebruiker

engine-e-dop-error-ci-singular-geometry = { $name }: singuliere geometrie

engine-e-dop-error-ci-no-noise-free-fix = { $name }: geen ruisvrije positiebepaling

engine-e-dop-error-ci-no-fix = { $name }: geen positiebepaling

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singuliere geometrie

engine-e-dop-error-mc-no-fix = { $label }: geen positiebepaling

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km moet positief zijn; ontvangen: { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes en sats_per_plane moeten beide niet nul zijn

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz moet positief zijn; ontvangen: { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency moet in (0, 1] liggen; ontvangen: { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k moet positief zijn; ontvangen: { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db moet niet-negatief zijn; ontvangen: { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m moet buiten de aarde liggen; ontvangen: { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance = Earth-GNSS op maanafstand — { $n_satellites } satellieten, ontvanger op { $r } km{ "\u000A" }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Aardlimb vanaf de constellatie: { $earth_limb_half_angle_deg } deg van nadir — elke naar de maan gerichte straal moet dit overschrijden{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_geometrically_visible } van { $n_satellites } niet geoccludeerd; { $n_trackable } halen de trackingdrempel van { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }beste link { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }elke volgbare zichtlijn ligt binnen een halve kegel van { $a } deg — de geometrie is bijna ontaard{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }SWEEP over { $epochs } epochs / { $span_s } s: signaalbeschikbaarheid { $signal_availability }, beschikbaarheid van de POSITIEBEPALING { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }volgbare links gemiddeld { $mean_trackable }, max { $max_trackable }; beste C/N0 { $w }; beste PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = tussen één en zes trappen zijn vereist

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg moet eindig en niet-negatief zijn

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 moet eindig en niet-negatief zijn

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg moet eindig en niet-negatief zijn

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m moet eindig en niet-negatief zijn

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg moet in [0, 45) liggen

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s moet eindig en niet-negatief zijn

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = de stuwkracht-gewichtsverhouding bij lift-off { $tw } moet groter zijn dan 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ideale dv { $ideal_dv_m_s } m/s, verliezen { $losses } m/s (zwaartekracht { $gravity_loss_m_s }, weerstand { $drag_loss_m_s }, sturing { $steering_loss_m_s }, tegendruk { $back_pressure_loss_m_s }); burn-out { $r } km bij { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } moet eindig en positief zijn

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body moet "earth" of "mars" zijn, ontvangen: "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = atmosfeer "{ $a }" is niet beschikbaar voor lichaam "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg moet in (0, 90) liggen (positief naar beneden)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m moet in [20 km, 1000 km] liggen

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg moet eindig zijn met |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg en longitude_deg moeten eindig zijn

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag moet in [0, 3] liggen

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg moet eindig zijn

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s moet in (0, 1] s liggen

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m moet in [0, entry_interface_altitude_m) liggen

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s moet in (0, 20000] s liggen

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame moet inertial|relative zijn, ontvangen: "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> piek { $pk_g } g op { $r } km, piek-q { $r2 } W/cm² op { $r3 } km, warmtelading { $r4 } J/cm², piek-q_dyn { $r5 } kPa; { $outcome } op { $end_time_s } s (gesloten vorm { $cf_g } g; MODELLED 3-DoF, geen straling/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } moet in (0, 1] liggen

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } moet eindig en niet-negatief zijn

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg moet in [0, 90) liggen

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits moet in 1..=24 liggen

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (put { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = nadirhoek { $eta_rad }° overschrijdt de hoekstraal van de aarde { $rho }° (mist de aarde)

engine-e-eo-payload-no-sun-synchronous-inclination-at = geen zonsynchrone inclinatie bij { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg moet in (0, 90) liggen

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad moet eindig en positief zijn

engine-e-eo-payload-half-fov-too-large = half_fov te groot: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> { $v3 } km zwad, { $gsd } m nadir-GSD, toegang tot { $v5 } km buiten nadir; afstand tussen knooppunten { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Aarde-Maan-barycentrum uit { $table }, gesplitst met de maanreeks van Montenbruck & Gill, gepreceseerd naar J2000

engine-ephem-provider-jpl-mean-elements-in-the = gemiddelde JPL-elementen in het Laplace-vlak, snelheid van de gemiddelde lengte uit de synchrone rotatiesnelheid van de IAU, opgeteld bij zijn planeet uit { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = IAU-richting van synchrone rotatie op de gemiddelde JPL-afstand, opgeteld bij Saturnus uit { $table }

engine-e-ephem-provider-read = lezen van { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = de TLE mist regel 1 (een regel die begint met `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = de TLE mist regel 2 (een regel die begint met `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = een analytische `orbit`-efemeride vereist een `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = een efemeridescenario heeft een `tle` of een `orbit` nodig

engine-e-ephemeris-step-must-be-positive = step_s moet positief zijn

engine-e-ephemeris-duration-must-be-non-negative = duration_s moet niet-negatief zijn

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz moet een positieve, eindige frequentie zijn

engine-ephemeris-ground-track-samples-alt-km = { $source } grondspoor · { $n_samples } samples · hoogte { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` is niet eindig

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` is geen seconden en geen ISO-8601 UTC-tijd

engine-e-evidence-assemble-no-epoch-of-the-log = geen epoch van het log valt tussen { $t0 } s en { $t1 } s (het log beslaat 0 tot { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config is geen object

engine-e-evidence-assemble-config-json-already-has-an = config.json heeft al een vermelding `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = van { $from_s } tot { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` is geen UTC-tijd zoals 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } in een log van { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } heeft een waarde nodig

engine-e-evidence-cli-cannot-create = kan { $path } niet aanmaken: { $e }

engine-e-evidence-cli-cannot-write = kan { $path } niet schrijven: { $e }

engine-evidence-cli-warning-is-readable-by-other = waarschuwing: { $path } is leesbaar voor andere gebruikers; beperk dit (chmod 600)

engine-e-evidence-cli-cannot-read-key = kan sleutel { $path } niet lezen: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } is geen hexsleutel

engine-e-evidence-cli-must-hold-32-byte-key = { $path } moet een sleutel van 32 bytes bevatten als 64 hexcijfers

engine-e-evidence-cli-cannot-read = kan { $dir } niet lezen: { $e }

engine-e-evidence-cli-cannot-read-2 = kan { $name } niet lezen: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } bestaat en is niet leeg

engine-e-evidence-cli-cannot-create-2 = kan { $dir } niet aanmaken: { $e }

engine-evidence-cli-warning-is-owner-only-mode = waarschuwing: { $arg } is alleen voor de eigenaar (modus 600) en heet niet *.pub: het kan een privésleutel zijn. Geef het bestand met de publieke sleutel op.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` is geen 64 hexcijfers en geen leesbaar bestand ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` bevat geen hexcijfers

engine-evidence-cli-private-key-keep-it-secret = privésleutel: { $out }  (houd het geheim; commit het nooit)

engine-evidence-cli-public-key-pub = publieke sleutel:  { $out }.pub

engine-evidence-cli-public-key-hex = publieke sleutel (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Geef verificateurs de publieke sleutel via een route die ze vertrouwen; zij zetten die vast met --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify heeft een bundelmap nodig

engine-e-evidence-cli-cannot-read-3 = kan { $p } niet lezen: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: geen PEM-certificaat gevonden

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }handtekening van de tijdstempelautoriteit niet geverifieerd door Kshana

engine-evidence-cli-this-is-technical-record-not = Dit is een technische registratie, geen juridisch oordeel.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp heeft een bundelmap nodig

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp heeft een tokenbestand nodig

engine-e-evidence-cli-cannot-read-4 = kan { $tok } niet lezen: { $e }

engine-e-evidence-cli-cannot-write-2 = kan { $target } niet schrijven: { $e }

engine-evidence-cli-note-the-token-sits-beside = let op: het token staat naast het ondertekende manifest, niet erin; verifieer met --require-timestamp om het af te dwingen.

engine-e-evidence-cli-round-trip-packs-are-not = roundtrip-pakketten worden niet gebouwd voor WebAssembly

engine-e-evidence-cli-needs-scenario-path = heeft een scenariopad nodig

engine-e-evidence-cli-needs-from = heeft --from nodig

engine-e-evidence-cli-needs-to = heeft --to nodig

engine-e-evidence-cli-cannot-read-lab-attestation = kan de labverklaring { $p } niet lezen: { $e }

engine-e-evidence-cli-cannot-read-5 = kan { $scn_path } niet lezen: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = ongeldig receiver-trust-scenario: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation geldt voor `receiver-trust evidence`, niet voor `evidence round-trip` (waarvan het pakket de testomstandigheden vastlegt)

engine-e-evidence-cli-cannot-read-6 = kan { $sp } niet lezen: { $e }

engine-e-evidence-cli-cannot-read-7 = kan { $cp } niet lezen: { $e }

engine-evidence-cli-evidence-pack-written-to = bewijspakket geschreven naar { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epochs in venster: { $epochs_in_window }  ({ $from_s } s tot { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }vingerafdruk van de ondertekenaar: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 van manifest.json (wat een RFC 3161-autoriteit moet stempelen): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }logfragment: bytes { $a } tot { $b } van { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }logfragment: het hele log (dit log geeft geen bytebereik voor het venster)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }labverklaring vastgelegd in het ondertekende manifest ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Een pakket is een technische registratie, geen juridisch oordeel.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s tot { $to_s } s na de eerste epoch van het log

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = ongeldige lab-attestation-TOML: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` moet een tabel zijn

engine-e-evidence-lab-invalid-lab-attestation = ongeldige lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } is verplicht

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } is groter dan { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: datum { $date } is geen dag zoals 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: een afgeschermde opstelling heeft enclosure nodig

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup moet "conducted" of "shielded" zijn (ontvangen: { $other }); een opstelling via de lucht wordt niet geaccepteerd als labrun

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db moet eindig zijn

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = de testomstandigheden vermelden { $events } gebeurtenis(sen) maar het scoringsscenario heeft er { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = gebeurtenis '{ $id }' in de testomstandigheden ({ $onset_s } s tot { $offset_s } s) komt niet overeen met '{ $label }' in het scoringsscenario ({ $onset_s2 } s tot { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = de SHA-256 van het log ({ $have }) is niet de waarde die de testomstandigheden vermelden ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = afgekapte DER

engine-e-evidence-tsa-bad-der-length = ongeldige DER-lengte

engine-e-evidence-tsa-unexpected-der-tag = { $what }: onverwachte DER-tag { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = lege AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = ongeldige UTCTime

engine-e-evidence-tsa-bad-generalizedtime = ongeldige GeneralizedTime

engine-e-evidence-tsa-bad-time = ongeldige tijd

engine-e-evidence-tsa-time-not-in-utc = tijd niet in UTC

engine-e-evidence-tsa-bad-time-digits = ongeldige tijdcijfers

engine-e-evidence-tsa-bad-bit-string = ongeldige BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: drie elementen verwacht

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: te kort

engine-e-evidence-tsa-empty-extension = lege Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: waarde is geen OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: leeg

engine-e-evidence-tsa-validity-short = Validity: kort

engine-e-evidence-tsa-pem-end-without-begin = PEM: END zonder BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: ongeldige base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: ongeldige base64-lengte

engine-e-evidence-tsa-spki-empty = SPKI: leeg

engine-e-evidence-tsa-spki-no-oid = SPKI: geen OID

engine-e-evidence-tsa-spki-no-key = SPKI: geen sleutel

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: twee gehele getallen verwacht

engine-e-evidence-tsa-unsupported-elliptic-curve = niet-ondersteunde elliptische kromme

engine-e-evidence-tsa-unsupported-public-key-algorithm = niet-ondersteund algoritme voor publieke sleutels

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA-sleutel of -handtekening te groot

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA-modulus niet oneven

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA-handtekening buiten bereik

engine-e-evidence-tsa-rsa-key-too-small = RSA-sleutel te klein

engine-e-evidence-tsa-invalid-padding = ongeldige padding

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: gecodeerd bericht te lang

engine-e-evidence-tsa-last-octet-invalid = laatste octet ongeldig

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: meest linkse bits niet nul

engine-e-evidence-tsa-pss-bad-padding = PSS: ongeldige padding

engine-e-evidence-tsa-pss-signature-mismatch = PSS: handtekening komt niet overeen

engine-e-evidence-tsa-unsupported-mask-generation-function = niet-ondersteunde maskergeneratiefunctie

engine-e-evidence-tsa-mgf1-without-hash = MGF1 zonder hash

engine-e-evidence-tsa-bad-pss-salt-length = ongeldige PSS-saltlengte

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = een ECDSA-handtekening heeft een EC-sleutel nodig

engine-e-evidence-tsa-an-rsa-signature-needs-an = een RSA-handtekening heeft een RSA-sleutel nodig

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption zonder digestalgoritme

engine-e-evidence-tsa-an-rsa-pss-signature-needs = een RSA-PSS-handtekening heeft een RSA-sleutel nodig

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey zonder digestalgoritme

engine-e-evidence-tsa-unsupported-signature-algorithm = niet-ondersteund handtekeningalgoritme

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: leeg

engine-e-evidence-tsa-time-stamp-request-not-granted = tijdstempelverzoek niet toegekend

engine-e-evidence-tsa-no-time-stamp-token-in = geen tijdstempeltoken in het antwoord

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = geen TimeStampResp of TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = geen CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: geen inhoud

engine-e-evidence-tsa-signeddata-short = SignedData: kort

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: leeg

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = ingesloten inhoud is geen TSTInfo

engine-e-evidence-tsa-no-tstinfo = geen TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo niet in een OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: kort

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: geen genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: geen signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = precies een SignerInfo verwacht

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: geen sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: geen digestalgoritme

engine-e-evidence-tsa-signerinfo-short = SignerInfo: kort

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: geen signed attributes

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: geen handtekeningalgoritme

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: geen handtekening

engine-e-evidence-tsa-no-serial = geen serienummer

engine-e-evidence-tsa-signer-certificate-not-found = certificaat van de ondertekenaar niet gevonden

engine-e-evidence-tsa-attribute-empty = Attribute: leeg

engine-e-evidence-tsa-attribute-no-values = Attribute: geen waarden

engine-e-evidence-tsa-attribute-no-value = Attribute: geen waarde

engine-e-evidence-tsa-content-type-attribute-mismatch = content-type-attribuut komt niet overeen

engine-e-evidence-tsa-digest-failure = digestfout

engine-e-evidence-tsa-signature-not-an-octet-string = handtekening is geen OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = ess-attribuut voor het ondertekeningscertificaat ontbreekt

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: leeg

engine-e-evidence-tsa-ess-cert-id-not-found = ess-certificaat-id niet gevonden

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: geen hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = ongeschikt doel van het certificaat

engine-e-evidence-tsa-certificate-is-not-yet-valid = certificaat is nog niet geldig

engine-e-evidence-tsa-certificate-has-expired = certificaat is verlopen

engine-e-evidence-tsa-invalid-ca-certificate = ongeldig CA-certificaat

engine-e-evidence-tsa-certificate-chain-too-long = certificaatketen te lang

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: leeg

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: geen digest

engine-e-evidence-tsa-message-imprint-mismatch = message imprint komt niet overeen

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER met onbepaalde lengte wordt niet ondersteund

engine-e-evidence-tsr-expected-tag-found = verwacht { $what } (tag { $tag }), gevonden { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = misvormde PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = het tijdstempelantwoord is niet toegekend

engine-e-evidence-tsr-not-timestamp-token = geen tijdstempeltoken

engine-e-evidence-tsr-the-token-content-type-is = het contenttype van het token is niet CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = het token bevat geen TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = de message imprint gebruikt een niet-ondersteund hashalgoritme

engine-e-evidence-tsr-the-imprint-is-bytes-not = de imprint is { $digest } bytes, niet de { $want_len } die { $hash_alg } geeft

engine-e-evidence-tsr-gentime-is-not-utc = genTime is geen UTC

engine-e-evidence-tsr-malformed-gentime = misvormde genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime is geen bestaand kalendertijdstip

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = geen hex in kleine letters

engine-e-evidence-verify-expected-bytes-found = { $N } bytes verwacht, { $v } gevonden

engine-e-evidence-verify-the-pack-already-has-timestamp = het pakket heeft al een tijdstempeltoken; geef --replace op om het te vervangen

engine-e-evidence-verify-not-attached-the-pack-with = niet bijgevoegd: het pakket met dit token verifieert niet ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = het pakket legt een labverklaring vast van { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = het handtekeningbestand eindigt niet met een regeleinde

engine-evidence-verify-signer-not-pinned-the-signature = ondertekenaar niet vastgezet: de handtekening bewijst dat het pakket intact is ten opzichte van sleutel { $r }, die het pakket zelf noemt. Vergelijk die vingerafdruk met een die u van de ondertekenaar hebt gekregen, of geef de sleutel op.

engine-evidence-verify-range-is-not-inside-log = bereik { $start }..{ $end } ligt niet binnen een log van { $full_bytes } bytes

engine-evidence-verify-timestamp-token-states-its-imprint = tijdstempeltoken vermeldt { $gen_time }; zijn imprint { $v2 } manifest.json. Handtekening van de tijdstempelautoriteit niet geverifieerd door Kshana: controleer die met `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = tijdstempeltoken vermeldt { $gen_time }; zijn imprint { $v2 } manifest.json; de handtekening en keten van de tijdstempelautoriteit { $v3 } tegen de opgegeven ankers.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` is de lege tekenreeks

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } valt buiten het vocabulaire

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = de kostenband moet eindig en niet-negatief zijn, geordend laag≤nominaal≤hoog, en een bron bevatten

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction en availability moeten fracties in [0, 1] zijn

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } moet eindig en > 0 zijn, ontvangen: { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } moet eindig en >= 0 zijn, ontvangen: { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg moet in [-90, 90) liggen, ontvangen: { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = de constellatie heeft geen satellieten

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats moet >= 1 zijn indien ingesteld

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = slipsatelliet { $sat } buiten bereik

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = regel { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = regel { $lineno }: { $v } kolommen, minstens { $min } verwacht

engine-e-fusion-kfgins-line-columns = regel { $v1 }: { $v } kolommen

engine-e-fusion-kfgins-line-block-lists-are-not = regel { $lineno }: bloklijsten worden niet ondersteund

engine-e-fusion-kfgins-line-expected-key-value = regel { $lineno }: `key: value` verwacht

engine-e-fusion-kfgins-line-indented-key-without-parent = regel { $lineno }: ingesprongen sleutel zonder ouder

engine-e-fusion-kfgins-line-only-one-level-of = regel { $lineno }: slechts een nestingniveau

engine-e-fusion-kfgins-line-unterminated-flow-list = regel { $lineno }: niet afgesloten flowlijst

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` is een lijst, een scalar verwacht

engine-e-fusion-kfgins-missing = `{ $k }` ontbreekt

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` moet een lijst van drie elementen zijn

engine-e-fusion-kfgins-no-imu-sample-at-or = geen IMU-sample op of na starttime

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU-tijd neemt niet toe bij { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } moet eindig en > 0 zijn, ontvangen: { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m moet eindig en > 0 zijn, ontvangen: { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg moet in [-90, 90) liggen, ontvangen: { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = trajectory-csv regel { $v1 }: geen getallen: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = trajectory-csv regel { $v1 }: 10 kolommen verwacht, { $v } ontvangen

engine-e-fusion-trajectory-trajectory-csv-line-time-does = trajectory-csv regel { $v1 }: tijd neemt niet toe

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = trajectory-csv heeft minstens twee rijen nodig

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = trajectory-csv beslaat { $rows } s maar het scenario loopt { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg van de site moet in [-90, 90] liggen en elk veld moet eindig zijn

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" is geen GNSS-voorinstelling ({ $e_gnss }) en geen LEO-voorinstelling ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: geef de gebruiker op als `site` of `user_ecef_m`, niet beide

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m moet eindig zijn en niet het geocentrum

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satelliet { $id }: azimut/elevatie buiten bereik

engine-e-geometry-sky-satellite-is-given-in = sky: satelliet { $id } is opgegeven in ECEF; het verzoek heeft `site` of `user_ecef_m` nodig

engine-e-geometry-sky-satellite-ecef-position-not = sky: satelliet { $id }: ECEF-positie niet eindig

engine-e-geometry-sky-satellite-coincides-with-the = sky: satelliet { $id } valt samen met de gebruiker

engine-e-geometry-sky-satellite-give-az-deg = sky: satelliet { $id }: geef az_deg en el_deg, of ecef_m, en niets anders

engine-e-geometry-sky-tle-is-bytes-the = sky: tle is { $text } bytes; het maximum is { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = elementenset geweigerd: { $e }

engine-geometry-sky-tle-holds-no-complete = sky: tle bevat geen complete tweeregelige elementenset; { $n_ignored } regels genegeerd, de eerste: { $first }

engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. en { $more } meer

engine-geometry-element-sets-propagated-by-the = { $n } elementensets gepropageerd door de SGP4 (WGS-72) van de engine naar { $iso } en geroteerd naar aardvast met UT1 als UTC en zonder poolbeweging: de hemel die die elementensets op die epoch geven, geen meting ervan.

engine-geometry-element-sets-propagated-by-the-2 = { $n } elementensets gepropageerd door de SGP4 (WGS-72) van de engine naar de epoch van de nieuwste elementenset plus time_s ({ $iso }). Er is geen epoch opgegeven, dus dit is een representatieve hemel, niet de hemel van een genoemde datum.

engine-e-geometry-sky-give-systems-or-tle = sky: geef `systems` of `tle` (met een `site`), of `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system benoemt de `tle`-satellieten; het verzoek heeft geen `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg moet in [-90, 90) liggen, ontvangen: { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` heeft een `site` (of `user_ecef_m`) nodig om vanuit te kijken

engine-e-geometry-sky-time-must-be-finite = sky: time_s moet eindig zijn

engine-e-geometry-sky-system-asks-for-satellites = sky: systeem "{ $name }" vraagt { $asked } satellieten; een verzoek bevat er hoogstens { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: meer dan { $MAX_SATELLITES } satellieten

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` heeft een `site` (of `user_ecef_m`) nodig om vanuit te kijken

engine-e-geometry-sky-more-than-satellites-above = sky: meer dan { $MAX_SATELLITES } satellieten boven de horizon

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m moet positief zijn, ontvangen: { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence moet in (0, 1) liggen, ontvangen: { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: meer dan { $MAX_CLOCKS } systemen in zicht, elk met een eigen klok; groepeer satellieten onder minder `system`-labels of gebruik clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n moet in 1..={ $MAX_MC_SAMPLES } liggen, ontvangen: { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: te weinig satellieten in zicht voor een positiebepaling; geen Monte Carlo-wolk

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = TLE-hemel op { $e }, geen meting

engine-e-geometry-invalid-sky-request-json = ongeldig sky-verzoek (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = ongeldig sky-verzoek (TOML): { $e }

engine-e-geometry-invalid-skyline-json = ongeldige skyline (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = ongeldige skyline (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = ongeldige GLONASS-PRN in { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = paginatype { $pt } wordt hier niet gecodeerd

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bits, { $DATA_BITS } verwacht

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bits, { $PAGE_BITS } verwacht

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = staartbits zijn niet nul

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q komt niet overeen

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = paginatype { $pt } wordt hier niet gedecodeerd

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } symbolen, { $PAGE_SYMBOLS } verwacht

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = synchronisatiepatroon niet gevonden

engine-e-gnss-navmsg-gal-fnav-page-type-missing = paginatype { $t } ontbreekt

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav van paginatype { $t } wijkt af van paginatype 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = geen Galileo-veld { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = woordtype { $wt } wordt hier niet gecodeerd

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bits, { $WORD_BITS } verwacht

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = woordtype { $wt } wordt hier niet gedecodeerd

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = paginadelen moeten 120 bits zijn

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = even/oneven-vlaggen zijn niet 0 gevolgd door 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = geen nominale pagina (paginatype 1 is een alarmpagina)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bits, { $PART_BITS } verwacht

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } symbolen, { $PART_SYMBOLS } verwacht

engine-e-gnss-navmsg-gal-inav-word-type-missing = woordtype { $t } ontbreekt

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav van woordtype { $t } wijkt af van woordtype 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = record is systeem { $system }, niet Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = type 10 heeft geen veld { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = type 11 heeft geen veld { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = type 30 heeft geen veld { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV-body heeft { $body } bits, 238 verwacht

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } of TOW-telling { $tow_count } buiten bereik

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bits, { $MESSAGE_BITS } verwacht

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = preamble is niet 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = berichttype { $t } wordt hier niet gedecodeerd

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = een bericht van type 10 en een van type 11 zijn nodig

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } op LSB { $value2 } past niet in { $bits } { $v4 } bits

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bits, de indeling heeft er { $need } nodig

engine-e-gnss-navmsg-no-field = geen veld { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } op schaal 2^{ $scale_pow2 } past niet in { $bits } { $v1 } bits

engine-e-gps-lnav-no-value-for = geen waarde voor { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: referentiemodel "gfc" heeft `gfc_path` nodig

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: kan gfc_path { $path } niet lezen: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: onbekend referentiemodel `{ $other }` (gebruik "egm2008" of "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: onbekende ellipsoïde `{ $other }` (gebruik "wgs84" of "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations moet minstens 1 zijn

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations is begrensd op 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = ongeldig reëel getal '{ $t }'

engine-e-gravity-pds-bad-integer = ongeldig geheel getal '{ $t }'

engine-e-gravity-pds-empty-shadr-table = lege SHADR-tabel

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR-header heeft { $f } velden, minstens 6 verwacht

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR-header: negatieve graad/orde of onbekende normalisatie

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR-normalisatiestatus { $normalization } (alleen volledig genormaliseerd, status 1, wordt ondersteund)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR-referentielengtegraad/-breedtegraad moet 0 zijn

engine-e-gravity-pds-non-physical-gm-must-be = niet-fysische GM (moet eindig en positief zijn)

engine-e-gravity-pds-non-physical-reference-radius-must = niet-fysische referentiestraal (moet eindig en positief zijn)

engine-e-gravity-pds-shadr-record-fields = SHADR-record { $v1 }: { $f } velden

engine-e-gravity-pds-shadr-record-bad = SHADR-record { $v1 }: ongeldig (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR-record { $v1 }: niet-eindige coëfficiënt

engine-e-gravity-pds-no-shadr-coefficient-records = geen SHADR-coëfficiëntrecords

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR-tabel onvolledig: ontbrekend (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant ontbreekt

engine-e-gravity-sh-missing-radius = radius ontbreekt

engine-e-gravity-sh-non-physical-earth-gravity-constant = niet-fysische earth_gravity_constant (moet eindig en positief zijn)

engine-e-gravity-sh-non-physical-radius-must-be = niet-fysische radius (moet eindig en positief zijn)

engine-e-gravity-sh-no-gfc-coefficient-lines = geen gfc-coëfficiëntregels

engine-e-gravity-sh-read-error = leesfout: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = regel { $lineno }: norm { $v } wordt niet ondersteund (alleen fully_normalized)

engine-gravity-sh-line-bad = regel { $lineno }: ongeldige { $what }

engine-e-gravity-sh-line-degree-above-the-declared = regel { $lineno }: graad { $n } boven de gedeclareerde max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = regel { $lineno }: orde { $m } boven graad { $n }

engine-e-gravity-sh-line-time-variable-term-is = regel { $lineno }: tijdvariabele term `{ $key }` wordt niet ondersteund (alleen statische modellen)

engine-e-gravity-sh-missing-end-of-head = end_of_head ontbreekt

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s moet positief zijn, ontvangen: { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s moet positief zijn, ontvangen: { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase = scenario levert { $n } epochs op (≥ 2 nodig); verhoog duration_s of verlaag step_s

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = het record bevat een niet-eindige tijdfout

engine-e-holdover-test-unknown-mask-expected-one-of = onbekend masker { $id }; verwacht een van { $masks }

engine-e-holdover-test-every-budget-max-abs-te = elke max_abs_te_ns van een budget moet eindig en positief zijn

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } ligt buiten het record ({ $t0_s } tot { $t_end } s op zijn eigen tijdas)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } moet later zijn dan gnss_removed_s ({ $gnss_removed_s }) en niet voorbij het einde van het record ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = de holdover-stap bevat geen sample

engine-holdover-test-the-record-has-no-step = het record heeft geen stap { $step }: GNSS is bij het eerste sample verwijderd

engine-holdover-test-the-step-has-samples-the = stap { $step } heeft { $te_ns } samples; de schatters hebben er minstens 13 nodig

engine-e-holdover-test-step-with-mask-has-no = een stap met een masker heeft geen curve

engine-e-holdover-test-cannot-read-csv-path = kan csv_path { $path } niet lezen: { $e }

engine-holdover-test-recovered-after-gnss-returned = ; hersteld { $t } s nadat GNSS terugkeerde

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }{ $rec } (MODELLED, gemeten tegen het masker)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m moet eindig en > 0 zijn, ontvangen: { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba moet >= 0 zijn en coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = GEWEIGERD: de twee takken zitten niet op een gemeenschappelijke middelingstijd. De optische tak accumuleert over integration_s = { $integration_s } s; de lusruisbandbreedte van de RF-tak B_L = { $dll_bandwidth_hz } Hz middelt over 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Een verhouding van twee sigma's op verschillende middelingstijden is geen vergelijking, dus er wordt er geen genoemd. Verwijder de override rf_dll_bandwidth_hz (die valt dan terug op 1/(2*integration_s)) of stel die in op { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = GEWEIGERD: een tak is geen bruikbare positieve eindige sigma (optisch { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), dus er wordt geen verhouding gevormd.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = onbekende rf_band '{ $other }' (verwacht s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } moet eindig zijn

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db moet eindig en >= 0 zijn

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint = hybrid-optical-rf | optische footprint { $footprint_m } m, { $detected_photons } fotonen -> afstandsmeting σ { $c } mm, tijdsynchronisatie σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | beschikbaarheid { $c4 }% ({ $n_sites } sites) | overdracht zonder sprong { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | gezamenlijke FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Getoetst CRLB/χ²-PL/union/handoff, gemodelleerd σ/klimatologie

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa moet in [0, 1] liggen

engine-e-impairment-eval-per-class-must-be = n_per_class moet >= 1 zijn

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | detector { $detector } | AUC { $auc_in } in / { $auc_out } uit (verschil { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ doel { $target_pfa } | { $n_cases } gevallen | MODELLED synthetisch

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = onbekende detector '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = onbekende imu_grade { $other }; verwacht een van navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = onbekende combination { $other }; verwacht een van rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = onbekende trn_fix_mode { $other }; verwacht een van none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } moet eindig en niet-negatief zijn (ontvangen: { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m moet minstens een drempel noemen

engine-e-inertial-coast-crossing-thresholds-entries-must-be = de vermeldingen van crossing_thresholds_m moeten eindig en positief zijn (ontvangen: { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades moet minstens een IMU-klasse noemen

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s moet eindig en niet-negatief zijn (ontvangen: { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 moet eindig en niet-negatief zijn (ontvangen: { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg moet eindig zijn en binnen (-89, 89) liggen (ontvangen: { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m moet binnen [-1000, 100000] liggen (ontvangen: { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s moet positief zijn

engine-e-inertial-coast-drift-band-must-satisfy-lo = de driftband moet voldoen aan 0 < lo < hi (ontvangen: lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = serialiseren van ins-trn-coast-resultaat: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU, { $speed } m/s, combinatie { $comb } | { $heads } | TRN { $mode } piek { $peak_error_m } m over { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va afgeleid uit de fysica van koudeatoominterferometers)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = scenario is { $toml_text } bytes, boven de limiet van { $max_bytes } bytes

engine-e-inline-only-the-scenario-kind-reads-its = het scenariotype `{ $kind }` leest zijn data uit bestanden op de host, dus dit oppervlak voert het niet uit; gebruik de `kshana`-opdrachtregel

engine-e-inline-only-the-field-names-file-this = het veld `{ $k }` noemt een bestand: dit oppervlak accepteert alleen inline inhoud

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = trace-JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = onbekende dataset `{ $key }`; toegestaan: { $v1 }, of een eigen dataset

engine-e-interference-map-api-dataset-is-data-but-the = dataset `{ $key }` bevat { $kind }-data maar het invoertype is { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } is geen datum in de vorm YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = onbekende optie `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = { $positionals } positioneel(e) argument(en) verwacht, { $pos } ontvangen

engine-e-interference-map-cli-cannot-read = kan { $path } niet lezen: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom heeft { $n } nodig

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } bestaat al; Kshana overschrijft kaarten niet. Verwijder het of kies een andere --out-map

engine-interference-map-cli-note-cell-deg-is-not = let op: --cell-deg { $cell_deg } is niet de vooraf vastgelegde celgrootte ({ $PREREGISTERED_CELL_DEG }); de kaarten vermelden dit

engine-e-interference-map-cli-cannot-create = kan { $out } niet aanmaken: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = { $path } geschreven: { $cells } cellen gepubliceerd, { $n_deg } gemarkeerd

engine-interference-map-cli-no-usable-rows-nothing-written = geen bruikbare rijen: niets geschreven

engine-e-interference-map-cli-unknown-subcommand = onbekend subcommando `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = de SHA-256 van het gedownloade bestand ({ $got }) komt niet overeen met de vastgezette waarde ({ $expected }); het is verwijderd

engine-e-interference-map-cli-cannot-write = kan { $dest } niet schrijven: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl is niet gevonden op PATH. Installeer curl, of download { $NATURAL_EARTH_LAND_URL } zelf en controleer of de SHA-256 { $NATURAL_EARTH_LAND_SHA256 } is

engine-e-interference-map-cli-cannot-run-curl = kan curl niet uitvoeren: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = { $out } geschreven: Natural Earth-landpolygonen, SHA-256 geverifieerd (publiek domein, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = geen trace_full_*-bestanden onder { $path }

engine-e-interference-map-cli-cannot-read-2 = kan { $spec } niet lezen: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } is geen datum in de vorm YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: ongeldige kaartdatum

engine-e-interference-map-cli-cannot-write-2 = kan { $out } niet schrijven: { $e }

engine-interference-map-cli-route-length-km = routelengte { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Kanttekeningen: een gedegradeerde cel wijst interferentie niet aan als oorzaak; niet-waargenomen cellen zijn geen bewijs van een vrije route; dit is geen voorspelling.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = landpolygonen: ongeldige JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = vereiste kolom `{ $name }` ontbreekt

engine-e-interference-map-cannot-read-input = kan invoer niet lezen: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` is geen datum (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours moet { $MIN_DELAY_HOURS } of meer zijn: het observatorium publiceert niet eerder

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg moet { $MIN_CELL_DEG } of grover zijn: het observatorium publiceert alleen grove cellen

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } is nog niet publiceerbaar: het product wordt niet eerder vrijgegeven dan { $fmt_utc } ({ $delay_hours } uur nadat de dag eindigt)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORIUM  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLEN  UTC-DAG  NIET WAARGENOMEN IS NIET VRIJ  GEEN OORZAAK TOEGEWEZEN

engine-interference-map-observatory-source-licence = BRON { $dataset }  LICENTIE { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } GEDEGRADEERD  { $summary2 } NIET GEDEGRADEERD  { $summary3 } NIET WAARGENOMEN (GEPUBLICEERDE CELLEN)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana-observatorium, ADS-B-navigatienauwkeurigheidskaart, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = kan { $path } niet aanmaken (Kshana overschrijft geen producten): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = de invoer bevat geen bruikbaar rapport over { $day } (gevonden dagen: { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } bestaat al; Kshana overschrijft geen producten

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } cellen gepubliceerd, { $p2 } verslechterd, { $p3 } incident(en)

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } rijen opnieuw afgespeeld onder { $variants } varianten: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = kaart is geen geldige JSON: { $e }

engine-e-interference-map-route-route-invalid-json = route: ongeldige JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = route: regel { $v1 } is niet van de vorm `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 }-export. Epoch: { $epoch_note }. Bewegende objecten: GCRS (referenceFrame INERTIAL), meters, seconden na de epoch. Vaste locaties: aardvast WGS 84 (referenceFrame FIXED), meters.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Positie: GCRS, meters.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Breedtegraad { $lat_deg } deg, lengtegraad { $lon_deg } deg, hoogte { $h_m } m boven de WGS 84-ellipsoïde. Positie: aardvast, meters.

engine-interop-czml-radius-along-the-ground = { $description }. Straal { $radius_m } m langs de grond.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Zonder tijd: WGS 84-lengte- en breedtegraad in graden, aan de grond vastgeklemd.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Aardvaste posities; een MultiLineString wordt bij de antimeridiaan doorgesneden, en times_utc vermeldt dan alleen de oorspronkelijke samples.

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 }-export. Epoch: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = ongeldige GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString heeft geen coordinates-array

engine-e-interop-geojson-an-rfc-7946-linestring-needs = een RFC 7946-LineString heeft twee of meer posities nodig

engine-interop-geojson-position-is-not-an-array = positie { $i } is geen array van twee of drie getallen

engine-interop-geojson-position-longitude-is-not-number = positie { $i }: lengtegraad is geen getal

engine-interop-geojson-position-latitude-is-not-number = positie { $i }: breedtegraad is geen getal

engine-e-interop-geojson-position-longitude-is-outside-180 = positie { $i }: lengtegraad { $lon } ligt buiten [-180, 180] (GeoJSON zet de lengtegraad eerst)

engine-e-interop-geojson-position-latitude-is-outside-90 = positie { $i }: breedtegraad { $lat } ligt buiten [-90, 90] (GeoJSON zet de lengtegraad eerst)

engine-e-interop-geojson-track-needs-two-or-more = een spoor heeft twee of meer waypoints nodig

engine-e-interop-geojson-the-route-spans-more-than = de route beslaat meer dan 180 graden lengtegraad; de sporen stappen in gewone graden en kunnen de antimeridiaan niet kruisen

engine-e-interop-geojson-position-is-deg-from-an = positie { $worst } ligt { $worst2 } deg van een gelijkmatig verdeeld recht spoor (tolerantie { $tol_deg } deg); de spoorsoorten vliegen start + i*step, dus geef gelijkmatig verdeelde posities op een lijn op, of alleen de twee uiteinden

engine-e-interop-geojson-route-applies-to-the-kinds = een route geldt voor de soorten die een waypointspoor vliegen (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` neemt geen trajectinvoer

engine-e-interop-geojson-scenario-toml-is-not-table = scenario-TOML is geen tabel

engine-e-interop-geojson-cannot-serialise-scenario = kan het scenario niet serialiseren: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = onbekend exportformaat '{ $other }'; verwacht een van czml, kml, geojson, stk, sigmf, all of list

engine-e-interop-member = lid { $label }: { $e }

engine-interop-the-scenario-could-not-be = het scenario kon niet worden geëxporteerd: { $m }

engine-e-interop-invalid-spectrum-scenario = ongeldig spectrumscenario: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than = { $n } tijdsamples is meer dan een export schrijft ({ $MAX_SAMPLES })

engine-e-interop-scene-objects-samples-is-more-than = { $items } objecten x { $times } samples is meer dan een export schrijft ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = ongeldig { $kind }-scenario: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type }-jammer, { $power_dbw } dBW zendvermogen, { $gain_dbi } dBi antennewinst

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, uit de linkvergelijkingen van de jamming-soort met de jammer aan de horizon van de ontvanger en vrije-ruimteverlies

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (de [pass]-fase van de keten)

engine-interop-scene-circular-orbit-km-altitude-deg = cirkelvormige baan, { $altitude_km } km hoogte, { $inclination_deg } deg inclinatie (SGP4-gemiddelde elementen aan het begin van het venster, zoals de passes-soort ze propageert)

engine-interop-scene-ground-station-deg-elevation-mask = grondstation, { $mask_deg } deg elevatiemasker

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; GCRS- en aardvaste toestanden zijn de eigen uitvoer van de ephemeris-soort (UT1 en poolbeweging zoals het scenario ze instelt)

engine-interop-scene-static-scene-the-kind-flies = statische scène: de soort { $kind } vliegt een spoor van waypoints zonder tijd

engine-interop-scene-true-track-flown-gps-denied = werkelijk spoor, zonder GPS gevlogen: { $track } waypoints vanaf start_lat_deg/start_lon_deg in stappen van step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` heeft geen scène

engine-e-interop-scene-missing-numeric = numerieke `{ $k }` ontbreekt

engine-e-interop-scene-missing-integer-waypoints = geheel getal `waypoints` ontbreekt

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } ligt buiten 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } op { $altitude_km } km, { $inclination_deg } deg inclinatie (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = het scenario geeft geen `epoch`; t = 0 is { $epoch }, de vroegste epoch in de eigen gegevens van de satellieten (TLE-, broadcast-efemeride- of SP3-epoch). Elke satelliet wordt vanaf zijn eigen epoch gepropageerd, en die beslaan { $spread_h } h: de tijdlabels volgen het uitgangspunt van de engine dat elke satelliet bij t = 0 begint, terwijl elke positie op het eigen tijdstip van die satelliet naar de GCRS- en aardvaste stelsels wordt geroteerd. De SP3- en OEM-exports labelen t = 0 in plaats daarvan als 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = het scenario geeft geen `epoch`; t = 0 is { $epoch }, de epoch in de eigen gegevens van de satellieten (TLE-, broadcast-efemeride- of SP3-epoch). De SP3- en OEM-exports labelen t = 0 in plaats daarvan als 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objecten x { $times_s } samples is meer dan een export schrijft ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = { $user_environment }-gebruiker, bewegend (constante snelheid en koers van de soort)

engine-interop-scene-user-receiver = { $user_environment }-gebruiker (ontvanger)

engine-interop-scene-user-orbit-km-altitude-deg = gebruikersbaan, { $altitude_km } km hoogte, { $inclination_deg } deg inclinatie (Kepler{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = geen bewegend object { $index }

engine-interop-stk-kshana-export-object = # Kshana { $v1 }-export: { $scene }, object { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type }-jammer, { $power_dbw } dBW zendvermogen, { $gain_dbi } dBi antennewinst (een parameter van het linkbudget van het scenario, geen signaal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` heeft geen voertuigtraject om te exporteren; de testbankexport omvat de soorten gnss-ins, jamming en gnss-sim

engine-e-interop-testbench-empty-motion-csv = lege bewegings-CSV

engine-e-interop-testbench-motion-csv-header-is-not = de header van de bewegings-CSV bevat niet de verwachte kolommen: { $head }

engine-e-interop-testbench-row-fields-expected = rij { $v1 }: { $f } velden, verwacht { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = rij { $v1 }: kolom { $motion_columns } is geen getal

engine-e-interop-testbench-line-no = regel { $v1 }: geen `$`

engine-e-interop-testbench-line-no-checksum = regel { $v1 }: geen controlesom

engine-e-interop-testbench-line-bad-checksum-field = regel { $v1 }: ongeldig controlesomveld

engine-e-interop-testbench-line-checksum-mismatch = regel { $v1 }: controlesom komt niet overeen

engine-e-interop-testbench-line-short-gga = regel { $v1 }: te korte GGA

engine-interop-testbench-line-bad-latitude = regel { $v1 }: ongeldige breedtegraad

engine-interop-testbench-line-bad-longitude = regel { $v1 }: ongeldige lengtegraad

engine-e-interop-testbench-line-bad-altitude = regel { $v1 }: ongeldige hoogte

engine-e-interop-testbench-line-bad-separation = regel { $v1 }: ongeldige scheiding

engine-e-interop-testbench-line-short-rmc = regel { $v1 }: te korte RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = regel { $v1 }: RMC zonder voorafgaande GGA

engine-e-interop-testbench-line-gga-and-rmc-times = regel { $v1 }: GGA- en RMC-tijden verschillen

engine-e-interop-testbench-line-bad-speed = regel { $v1 }: ongeldige snelheid

engine-e-interop-testbench-line-bad-course = regel { $v1 }: ongeldige koers

engine-e-interop-testbench-line-bad-time-or-date = regel { $v1 }: ongeldige tijd of datum

engine-e-interop-testbench-gga-with-no-following-rmc = een GGA zonder volgende RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = een waypointbestand heeft minstens twee samples nodig

engine-e-interop-testbench-the-sample-step-is-not = de samplestap { $step } s is geen geheel aantal milliseconden

engine-e-interop-testbench-the-samples-are-not-equally = de samples liggen niet op gelijke afstand: interval { $v1 } is { $dt } s, het eerste is { $step } s

engine-e-interop-testbench-empty-waypoint-file = leeg waypointbestand

engine-e-interop-testbench-waypoint-not-three-numbers = waypoint { $v1 }: niet drie getallen

engine-e-interop-testbench-waypoint-fields-expected = waypoint { $v1 }: { $f } velden, verwacht 3

engine-e-interop-testbench-events-csv-header-is-not = de header van de gebeurtenissen-CSV is niet label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = gebeurtenisrij { $v1 }: 5 velden verwacht

engine-e-interop-testbench-event-row-unknown-kind = gebeurtenisrij { $v1 }: onbekende soort { $f }

engine-e-interop-testbench-event-row-bad-onset = gebeurtenisrij { $v1 }: ongeldig begin

engine-e-interop-testbench-event-row-bad-end = gebeurtenisrij { $v1 }: ongeldig einde

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-interop-testbench-no-waypoints-txt-written = geen .waypoints.txt geschreven: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = geen UTC-tijd `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = { $what } ontbreekt

engine-e-ionex-bad-number-in = { $what }: ongeldig getal in { $col }

engine-e-ionex-two-digit-year = { $what }: tweecijferig jaar { $year }

engine-e-ionex-no-end-of-header = geen END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = hoogteafhankelijke (3D) IONEX-kaarten worden niet ondersteund

engine-e-ionex-zero-grid-step = rasterstap nul

engine-e-ionex-grid-needs-at-least-nodes = een raster heeft minstens 2 x 2 knooppunten nodig

engine-e-ionex-map-no = kaart { $index }: geen { $end_label }

engine-e-ionex-map-band-latitude-header-grid = kaart { $index }: band { $band } breedtegraad { $band_lat }, headerraster { $want }

engine-e-ionex-map-band-longitudes-differ = kaart { $index }: lengtegraden van band { $band } verschillen

engine-e-ionex-map-band-truncated = kaart { $index }: band { $band } afgebroken

engine-e-ionex-map-bands-header-grid-has = kaart { $index }: { $band } banden, headerraster heeft er { $n_lat }

engine-e-ionex-map-no-epoch-of-current = kaart { $index }: geen EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } TEC-kaarten, header # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = TEC-kaartepochs lopen niet op

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz bevat geen geheel aantal samples per { $code }-periode ({ $spc } samples)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods en noncoherent moeten positief zijn

engine-e-iq-acq-stream-ended-after-of-samples = stroom eindigde na { $got } van { $needed } samples

engine-e-iq-acq-cfar-reference-cells-must-be = CFAR-referentiecellen moeten even zijn en minstens 2 (ontvangen: { $n })

engine-e-iq-acq-cfar-stride-must-be-at = de CFAR-stap moet minstens 1 lag zijn

engine-e-iq-acq-cfar-per-cell-pfa-must = de CFAR-Pfa per cel moet in (0, 1) liggen (ontvangen: { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = het CFAR-venster reikt { $reach } lags aan elke kant, te breed voor een periode van { $samples_per_period } lags

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = onbekend oppervlakformaat { $s }: verwacht csv, json of bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = het oppervlak zou { $spc_cells } cellen bevatten (limiet { $MAX_SURFACE_CELLS }): vergroot de Doppler-stap of verklein het Doppler-bereik

engine-e-iq-acq-surface-surface-header = oppervlakheader: { $e }

engine-e-iq-acq-surface-surface-schema-expected = oppervlakschema { $schema }; verwacht { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = oppervlakinhoud: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = opname '{ $id }': format en sample_rate_hz moeten samen worden opgegeven

engine-e-iq-campaign-conditions-test-conditions-json = testcondities (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = testcondities (TOML): { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf heeft een SigMF-opname nodig (ontvangen: { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF-metadata: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF-metadata: global core:sample_rate ontbreekt

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start ontbreekt

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: geen core:sample_count en geen vermogenspunten om de gebeurtenis te beëindigen

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema moet "{ $SCHEMA }" zijn (ontvangen: "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id mag niet leeg zijn

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s moet eindig en >= 0 zijn

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 moet uit 64 hexadecimale cijfers bestaan

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind moet "iq" of "receiver-log" zijn (ontvangen: "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = minstens een [[expected]]-groep is vereist

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids mogen niet leeg zijn

engine-e-iq-campaign-conditions-lists-value-give-one-per = { $at }: { $key } bevat { $n } waarde(n); geef er een per id ({ $ids })

engine-e-iq-campaign-conditions-duplicate-id = { $at }: dubbel id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s moet na onset_s liggen

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects moet "all" zijn of een lijst met ids

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: affects-id { $bad } staat niet in [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q moet positief zijn

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points mag niet leeg zijn

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points moet in tijdvolgorde staan

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points moet eindig zijn

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" heeft reference_signal_dbm nodig

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = gebeurtenissen '{ $id }' en '{ $id2 }' overlappen op een gedeelde satelliet

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s moet >= 0 zijn

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s moet positief zijn

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = opname '{ $id }': SHA-256 { $sha } komt niet overeen met de opgegeven { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: opname bevat { $buf } samples, { $n } nodig om te acquireren

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s moet positief zijn

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db moet positief zijn

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s moet >= 0 zijn

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz moet positief zijn

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs moet minstens 1 zijn

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = campagne (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = campagne (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions moet minstens een bestand of glob opgeven

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds moet >= 0 zijn

engine-e-iq-campaign-spec-frontend-names-must-be-non = frontendnamen moeten niet leeg en uniek zijn ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' komt met geen enkel bestand overeen

engine-e-iq-campaign-spec-recording-id-appears-in-both = opname-id '{ $w }' komt voor in zowel { $w2 } als { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names heeft inputs.designs nodig

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: geen ontwerp '{ $n }' in { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = referentieregel { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0-profiel: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0-profiel: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i }: stapwaarden moeten eindig zijn

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i }: een ramp heeft end_s > start_s nodig

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i }: points hebben t_s en db van gelijke, niet-lege lengte nodig

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i }: t_s moet strikt oplopen

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i }: points moeten eindig zijn

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i }: fade s4 moet in (0, 1] liggen

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i }: fade tau_s moet positief zijn

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: opname bevat { $samples } samples, { $need } nodig voor deze zoekactie

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: noem het formaat met --surface-format csv|json|bin, of laat het pad eindigen op .csv, .json of .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = acquisitie: { $fs_hz } Hz, { $coherent_periods } coherente periode(n) x { $noncoherent } niet-coherent, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = rapport herbouwd: { $cells_present } van { $cells_total } cel(len), { $rows } rij(en), { $rows_failed } onder een drempel; digest { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    campagne { $name }: { $cells_total } cel(len); { $cells_skipped } al klaar, { $cells_run } nu uitgevoerd, { $cells_failed } mislukt, { $cells_pending } in afwachting
    uitvoer: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    eerste mislukking ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: { $events } gebeurtenis(sen), { $tc } verwachte satelliet(en); conditiehash { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono schuin { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono verticaal { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scint S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = multipath { $h }m { $multipath_ground } grond

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground moet dry, wet of sea zijn (ontvangen: { $other })

engine-e-iq-cli-channel-give-at-most-one-of = geef hoogstens een van --iono-stec, --iono-vtec, --iono-klobuchar op

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass verwacht lo,hi (ontvangen: { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass heeft lo < hi nodig

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } met overgang { $transition } Hz past niet onder fs/2 ({ $v1 } Hz); versmal de band of de overgang

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits moet 1..=16 zijn (ontvangen: { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = { $total } samples ({ $fs_hz } Hz) gefilterd naar { $out } ({ $format }); sidecar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = kan { $path } niet lezen: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = ongeldig labfit-scenario: { $e }

engine-iq-cli-labfit-fitted-run-wrote = { $runs } run(s) gefit; { $written } geschreven

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = { $fit_units } eenheid/eenheden uit campagne gefit; { $written } geschreven

engine-iq-cli-labfit-cannot-write = kan { $target } niet schrijven: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } heeft een waarde nodig

engine-e-iq-cli-cannot-parse = { $k }: kan { $v } niet parsen

engine-iq-cli-iq-takes-positional-argument-got = iq { $cmd } neemt { $n } positioneel argument(en), ontvangen: { $pos }

engine-e-iq-cli-cannot-parse-2 = { $k }: kan { $p } niet parsen

engine-iq-cli-unknown-iq-processing-command-expected = onbekend iq-verwerkingscommando { $other }; verwacht scene, acquire, track, sweep, labfit, frontend, monitor, campaign of conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } valt buiten het bereik voor GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = geen gezonde GPS-efemeride gevonden voor de gevraagde PRN's

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos verwacht lat,lon,alt (ontvangen: { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; C/N0-profiel ({ $segments } segment(en))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format moet csv of jsonl zijn (ontvangen: { $other })

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ; geheeltallige schaal: 1 LSB = { $sc } ruisgenormaliseerde eenheden (verwachte RMS { $v1 } LSB per component), { $clipped } element(en) afgekapt

engine-iq-cli-scene-written-by-kshana-iq-scene = geschreven door kshana iq scene: een GESIMULEERDE scène, geen opname{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = ION SDR-metadata { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF-data { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = geschreven door kshana iq scene{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = { $samples } samples ({ $format }, { $fs_hz } Hz) geschreven naar { $data_path }; { $truth_records } referentierecords naar { $truth_path }; { $meta_note }; kanaal: { $chan_desc }{ $scale_note }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } kan niet worden gecombineerd met --design: sweep voert elk ontwerp in het bestand uit

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = lusontwerp-sweep: { $rows } (ontwerp, PRN)-resultaat/resultaten{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: opname bevat { $samples } samples, { $need } nodig om te acquireren

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: niet geacquireerd (statistiek { $statistic } < drempel { $threshold }); verhoog --doppler-max, --acq-coherent of --acq-noncoherent, of controleer de opname

engine-iq-cli-track-designs-and-differ-in-integration = ontwerpen { $first } en { $d } verschillen in integration.extra_taps_chips; de ontwerpen van een run moeten overeenstemmen zodat elk uitvoerrecord dezelfde kolommen heeft

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: noem het formaat met --epochs-format csv|jsonl|bin, of laat het pad eindigen op .csv, .jsonl of .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz is { $r } samples per chip van { $c }: commensurabele sampling maakt van de codediscriminator een trap (bij 2 samples/chip dithert de DLL, ongeveer 0.09 chip RMS-codefout bij 45 dB-Hz); codelusjitter en -bias uit deze opname zijn niet representatief. Gebruik een frequentie die geen veelvoud is van de helft van de chipfrequentie om codelussen te beoordelen.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = worker is gestopt voordat deze invoer was verwerkt

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = onbekende optie { $s }

engine-e-iq-io-cli-format-needs-rate = --format heeft --rate nodig

engine-iq-io-cli-iq-takes-path-argument-got = iq { $cmd } neemt { $n } padargument(en), ontvangen: { $pos }

engine-iq-io-cli-unknown-iq-command = onbekend iq-commando { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated = { $n } samples ({ $to }, { $fs_hz } Hz) geschreven naar { $files }; { $w } verzadigd(e) element(en){ $v4 }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow leest alleen eenkanaalsopnamen

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow leest een opname met een capture, deze heeft er { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: geen positieve core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: de capture begint niet op een bytegrens

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = onbekend sampleformaat { $name }: verwacht bijvoorbeeld ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, eventueel eindigend op _qi voor complex

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sidecar sample_rate_hz { $sample_rate_hz } is niet positief

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: .sdrx-opnamen bevatten een stroom; kanaal { $channel } bestaat niet

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: raw-bestand zonder sidecar; geef het formaat op, of schrijf { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = kan de rij niet serialiseren: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = ongeldig filterontwerp { $design }: passband_frac in (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz moet strikt tussen 0 en de helft van de samplefrequentie liggen ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx-data: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-bit { $enc } { $fmt } ({ $packed_bits } bits/sample)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = niet-ondersteunde SigMF core:datatype { $datatype }: ondersteund zijn ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be en de reële ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } is geen SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = ongeldige SigMF-metadata: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } heeft geen SigMF core:datatype; schrijf het als raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } komt niet overeen met { $c0 } van de eerste opname

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: geen core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } is niet positief

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } bij { $rate } Hz komt niet overeen met { $f0 } bij { $r0 } Hz van de eerste opname

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out = { $name }: capture bij sample { $sample_start } is in de verkeerde volgorde of ligt voorbij de { $n_file } samples in de data

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: eerste capture begint niet op een bytegrens

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = kanaal { $channel } gevraagd; de opname heeft er { $channels } (kanalen tellen vanaf 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = ongeldige SigMF-collectie: { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } komt niet overeen met { $h } van de collectie

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = stroom { $select } van { $channels } geïnterleavede stromen bestaat niet (stromen tellen vanaf 0)

engine-e-iq-io-stream-sample-of-does-not-start = sample { $k } van { $format } begint niet op een bytegrens

engine-e-iq-io-stream-time-window-start-duration-both = tijdvenster begin { $start_s } s, duur { $duration_s } s: beide moeten niet-negatief zijn

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = meest schadelijke opgegeven Q (cw): geen tabelwaarde voor type `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: de campagne is niet volledig

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } komt niet overeen met de cellen ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = opname `{ $id }`: hash van de testcondities { $h } komt niet overeen met de vastgelegde { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signaal `{ $signal }`: onbekende chipfrequentie

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = geen run is bruikbaar voor de vergrendelingsfit: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = onvoldoende data: niet gefit ({ $m } opnamen; er zijn er minstens { $min_rec } nodig)

engine-iq-labfit-iqfit-uncensored-span-db-is-under = ongecensureerd J/S-bereik { $span_db } dB is kleiner dan { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff en delta zijn niet afzonderlijk identificeerbaar (|corr| { $full } >= { $v2 }): het model hangt alleen af van delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed = niet gefit: { $n_reacq } heracquisities waargenomen (er zijn er minstens 3 nodig)

engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = onbekende modus `{ $m }` (alleen `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage moet [lower, upper] zijn binnen [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds moet [lower, upper] zijn met 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db moet [lower, upper] zijn

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = de campagne heeft geen gebeurtenis met een opgegeven vermogensprofiel om te fitten

## src/iq/labfit/iqreport.rs

# legal: native review
engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Labfit uit IQ-campagne: { $r }

    Schema `{ $schema }`, engine { $engine_version }. Label: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = Campagne-DIGEST `{ $campaign_digest }`; `campaign.json` SHA-256 `{ $campaign_json_sha256 }`; scenario-SHA-256 `{ $scenario_sha256 }`; { $cells } cellen; { $bootstrap } bootstrapreplicaties (seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Eenheid { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Status: { $status }. { $recordings } opnamen, { $satellites } satellieten, { $events } gebeurtenissen; { $bins_used } bins gefit, { $bins_censored } gecensureerd.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0-model ({ $q_mode }): `delta_eff` = { $ci } dB (de identificeerbare offset, betrokken op Q = 1); `Q_eff` = { $q }; `delta` bij die Q = { $ci2 } dB; corr(Q, delta) { $om }; residu-RMS { $residual_rms_db } dB over een J/S-bereik van { $span_db } dB. Q_eff is niet identificeerbaar uit C/N0-data zonder een onafhankelijke vermogensmeting.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q vastgehouden op de opgegeven waarde: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = Drempel-J/S, direct: mediaan { $om } dB over { $n } verliezen (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Achtergehouden set (een opname weglaten), interpolatie: { $bins } bins, C/N0-RMS { $om } dB, PI90-dekking { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = ; { $model }: { $n } gebeurtenissen, verliestijd-RMS { $om } s, PI90-dekking { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    Validatietabel-SHA-256 `{ $table_sha256 }` (geregistreerd { $registered }):

    | drempel | limiet | waarde | oordeel |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = run `{ $label }` log

engine-e-iq-labfit-run = run `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = de [input] van het scenario noemt geen campagne

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign en [[runs]] sluiten elkaar uit: geef er een op

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit-scenario: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = het log bevat geen C/N0 per satelliet{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = geen epoch vóór het begin bij { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = geen epoch op of na het begin bij { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Labfit: { $r }

    Label: **{ $label }**. Instellingen-SHA-256 `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db = { "\u000A" }{ $n_samples } C/N0-samples, residu-RMS { $om } dB.{ $r }{ "\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Model: { $model } ({ $label })

    | parameter | waarde | grenzen | op grens | bootstrap-sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }Gebeurtenistijd-RMS { $om } s over { $n_events } gebeurtenissen; verliezen gemist { $loss_missed } / extra { $loss_extra }, heracquisities gemist { $reacq_missed } / extra { $reacq_extra }.

    | run | daling dB-Hz | herkoppeling dB-Hz | gebeurtenissen | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Achtergehouden set ({ $scheme }, { $folds } folds): alle { $om } s, interpolatie { $om2 } s, extrapolatie { $om3 } s.

    | achtergehouden run | klasse | afstand | dichtstbijzijnde trainingsrun | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } is gereserveerd voor toekomstig gebruik (alleen FID 0 is gedefinieerd)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } ligt buiten 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } SB1-symbo(o)l(en) wijken af van het gedecodeerde veld

engine-iq-lunanet-afs-frames-at-and-are-symbols = frames bij { $w } en { $w2 } liggen { $gap } symbolen uit elkaar, niet { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } volgt op TOI { $w2 }, verwacht { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = onverwacht teken { $c } in een symboolstroom (alleen 0, 1 en witruimte)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: eerste 24 chips verschillen

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: laatste 24 chips verschillen

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (het document drukt A14850 af voor zowel PRN 147 als PRN 151; de generator reproduceert die van PRN 151, dus de invoer voor PRN 147 is waarschijnlijk een drukfout in het document)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = gecodeerd 0x{ $word }, gedecodeerd FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = monitorinstellingen: { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = statische positie niet eindig

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = traject met constante snelheid niet eindig

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = waypointtraject heeft geen waypoints

engine-e-iq-scene-geometry-waypoint-not-finite = waypoint niet eindig

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = waypointtijden moeten strikt oplopen

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } is geen GPS C/A-PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = efemeridesysteem { $system } is niet GPS

engine-e-iq-scene-satellite = satelliet { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = is een pilootcomponent (zonder data) en bevat geen navigatiedata

engine-e-iq-scene-nav-carries-data-the-scene-does = bevat data die de scène niet modelleert; genereer het zonder data

engine-e-iq-scene-nav-does-not-carry-gps-lnav = bevat geen GPS LNAV (alleen GPS L1 C/A doet dat); gebruik geseede data

engine-e-iq-scene-nav-not-an-lnav-source = geen LNAV-bron

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = een scène heeft minstens een satelliet nodig (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler bevat { $dopplers } waarde(n); geef er een per --prn ({ $ids }) of een enkele waarde

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = referentierij heeft { $f } velden, verwacht 10

engine-e-iq-scene-truth-truth-field = referentieveld { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = referentie sat_id: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz moet een positief getal zijn

engine-e-iq-short-duration-must-be-in = duration_s moet in (0, { $MAX_DURATION_S }] liggen

engine-e-iq-short-ids-must-hold-to-satellites = ids moet 1 tot { $MAX_SATELLITES } satellieten bevatten

engine-e-iq-short-dopplers-must-be-finite = dopplers moeten eindig zijn

engine-e-iq-short-samples-requested-short-run-holds = { $n } samples gevraagd; een korte run bevat er hoogstens { $MAX_SAMPLES }

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C data PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C pilot PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } valt buiten het bereik

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF-frequentiekanaal { $id } ligt buiten -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = onbekend signaal { $other }; verwacht een van: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = regel { $v1 }: geen ';'

engine-e-iq-signals-galileo-line-no-code-number-in = regel { $v1 }: geen codenummer in { $label }

engine-e-iq-signals-galileo-code-appears-twice = code { $number } komt twee keer voor

engine-e-iq-signals-galileo-codes-the-icd-defines = { $path }: { $n } codes, de ICD definieert er { $CODES_PER_COMPONENT }

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

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primair { $primary_prn } S{ $secondary } tertiair { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primair { $primary_prn } S{ $secondary } (tertiair weggelaten)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = niet-hexadecimaal teken { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } hexadecimale symbolen kunnen niet exact { $len } chips bevatten

engine-iq-signals-primary-only = { $name } (alleen primair)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC-tracking heeft een early-late-afstand in (0, { $max }) chips nodig, zodat E en L op de hoofdpiek blijven (ontvangen: { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = de bump-jump-drempel moet minstens 1 zijn

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = de samplefrequentie moet positief zijn

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods moet positief zijn

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows moet positief zijn

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } moet een deler zijn van de bitlengte { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = maximaal { $MAX_EXTRA_TAPS } extra taps worden ondersteund (ontvangen: { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = de offsets van extra taps moeten eindig zijn en binnen ±{ $MAX_TAP_OFFSET_CHIPS } chips liggen (ontvangen: { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = een C/N0-venster heeft minstens 2 prompts nodig

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: verwacht atan2, costas-atan of costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: verwacht cross-product, atan2 of atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: verwacht pull-in of always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: verwacht eml-power, dot-product of eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: verwacht pll, fll of fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } geldt niet voor carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: verwacht een getal >= 0 (0 schakelt de begrenzing uit)

engine-e-iq-track-design-must-be-positive-number-got = { $k } moet een positief getal zijn (ontvangen: { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods moet minstens 1 zijn

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips moet in (0, 2] liggen (ontvangen: { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips bevat maximaal { $MAX_EXTRA_TAPS } offsets (ontvangen: { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = de offsets van integration.extra_taps_chips moeten eindig zijn en binnen ±{ $MAX_TAP_OFFSET_CHIPS } chips liggen (ontvangen: { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) moet onder carrier.fll_off_pli ({ $off }) liggen, beide in (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s moet nul of positief zijn (ontvangen: { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s moet positief zijn (ontvangen: { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order moet 1, 2 of 3 zijn (ontvangen: { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order moet 1 of 2 zijn (ontvangen: { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order moet 1 of 2 zijn (ontvangen: { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold moet in [-1, 1] liggen (ontvangen: { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows moet minstens 1 zijn

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods moet minstens 2 zijn

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) mag niet onder lock.reacq_interval_s ({ $reacq_interval_s }) liggen

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db moet eindig zijn

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes moet minstens 1 zijn

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods moet minstens 1 zijn (of "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent moet minstens 1 zijn

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa moet in (0, 1) liggen (ontvangen: { $pfa })

engine-e-iq-track-design-design-overrides = overschrijvingen van het ontwerp: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = overschrijvingen van het ontwerp mogen name of extends niet instellen

engine-e-iq-track-design-loop-design-file = loop-design-bestand: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = loop-design-bestand: schema { $other } wordt niet ondersteund; verwacht { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = loop-design-bestand: schema = { $SCHEMA } ontbreekt

engine-e-iq-track-design-loop-design-file-no-design = loop-design-bestand: geen [[design]]-tabellen

engine-e-iq-track-design-loop-design-file-design-number = loop-design-bestand: [[design]] nummer { $v1 } heeft geen naam

engine-e-iq-track-design-loop-design-file-design-name = loop-design-bestand: ontwerpnaam { $name } is gereserveerd of leeg

engine-e-iq-track-design-loop-design-file-design-is = loop-design-bestand: ontwerp { $name } is tweemaal gedefinieerd

engine-e-iq-track-design-no-design-named-the-file = geen ontwerp met de naam { $n }; het bestand bevat { $value }

engine-e-iq-track-design-loop-design-file-design-extends = loop-design-bestand: ontwerp { $name } breidt zichzelf uit (een cyclus)

engine-e-iq-track-design-loop-design-file-design-extends-2 = loop-design-bestand: ontwerp { $name } breidt een onbekend ontwerp { $parent } uit

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = een fasenlus heeft orde 1..=3 en Bn > 0 nodig (ontvangen: { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = een frequentielus heeft Bn > 0 nodig (ontvangen: { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = de orde van een frequentielus moet 1 of 2 zijn (ontvangen: { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = een lusfilter heeft een fasepad, een frequentiepad of beide nodig

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = de early-late-afstand moet in (0, 2] chips liggen (ontvangen: { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = de DLL-orde moet 1 of 2 zijn (ontvangen: { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = de chipsnelheid en de draaggolffrequentie moeten positief zijn

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = een epoch bevat { $extra } extra taps, maar de uitvoer is ingesteld voor { $n }: alle kanalen van een run moeten dezelfde extra_taps_chips gebruiken

engine-e-iq-track-sink-record-is-bytes-expected = een record is { $b } bytes; verwacht { $want }

engine-e-iq-track-sink-unknown-lock-state-code = onbekende vergrendelingstoestandscode { $b }

engine-e-iq-track-sink-epoch-file-header = header van het epochbestand: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = schema van het epochbestand { $schema }; verwacht { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = de records van het epochbestand zijn { $record_bytes } bytes; deze lezer verwacht { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } per extra tap)

engine-e-iq-track-sink-epoch-file-ends-inside-record = het epochbestand eindigt midden in een record ({ $got } van { $size } bytes)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = epochformaat { $o }: verwacht csv, jsonl of bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` is geen getal

engine-e-jammertest-cli-is-not-utf-text = { $path } is geen UTF-8-tekst

engine-e-jammertest-cli-needs-catalog = vereist --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = vereist minstens een --plan

engine-e-jammertest-cli-is-not-utf = { $cat } is niet UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } is niet UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` is geen van ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` is geen UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = vereist --log-start of --log met --format

engine-e-jammertest-cli-log-needs-format = --log vereist --format

engine-e-jammertest-cli-the-log-does-not-state = het log vermeldt zijn starttijd niet: gebruik --log-start

engine-e-jammertest-cli-the-log-states-its-start = het log vermeldt zijn start als `{ $label }`: gebruik --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } is niet UTF-8

engine-e-jammertest-cli-cannot-write = kan { $o } niet schrijven: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } { $SCHEDULED_TRUTH }-gebeurtenissen geschreven naar { $o } ({ $skipped_non_rf } niet-RF-slots overgeslagen, { $outside_log } buiten het log, { $unknown_ids } id's die niet in de catalogus staan)

engine-jammertest-cli-note-ids-not-in-the = let op: id's die niet in de catalogus staan: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = let op: dit zijn de geplande slots van het plan, geen opgenomen uitzendtijden.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  testnaam

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } tests, { $evaluable } evalueerbaar: { $detected } gedetecteerd binnen de tolerantie, { $late } te laat, { $missed } gemist; mediane latentie { $fmt_opt }, mediane hersteltijd { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = valse alarmen buiten elk slot: { $false_alarm_runs } runs, { $false_alarm_epochs } van { $clean_epochs } schone epochs

engine-e-jammertest-cli-needs-session-path = vereist een sessiepad

engine-e-jammertest-cli-needs-catalog-and-plan-or = vereist --catalog en --plan, of --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = bewijspakket geschreven naar { $out }; vingerafdruk van de ondertekenaar { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = geen map met een scenario.json en een .ubx onder { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = scenario: { $e }

engine-e-jammertest-dataset-read = lezen: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json bevat geen datum

engine-e-jammertest-dataset-scenario-json-date-is-not = de datum `{ $date }` in scenario.json is geen datum

engine-e-jammertest-dataset-no-readable-epoch-in-mon = geen leesbare epoch in mon_rf.csv of rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = geen map met een scenario.json onder { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } hersteld ({ $recovered } van { $alarmed }), mediaan { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = het log vermeldt zijn start als `{ $l }`, wat geen UTC ISO-8601 is: geef de start expliciet op

engine-e-jammertest-the-log-does-not-state = het log vermeldt zijn starttijd niet: geef die expliciet op

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = de catalogus is geen JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = de catalogus bevat geen array `test_types`

engine-e-jammertest-plan-test-type-has-no-type = een testtype heeft geen `type_id`

engine-e-jammertest-plan-test-group-has-no-group = een testgroep heeft geen `group_id`

engine-e-jammertest-plan-test-has-no-test-id = een test heeft geen `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = de catalogus bevat geen tests

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` is geen plantijd zoals 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = het plan is geen JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = het plan bevat geen array `locations`

engine-e-jammertest-plan-test-end-time-is-not = test { $id }: end_time ligt niet na start_time

engine-e-jammertest-plan-the-plan-has-no-test = het plan heeft geen testgebied { $l }; het heeft { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = het plan heeft meerdere testgebieden { $areas }; geef aan in welk gebied het log is opgenomen

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json is geen JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = geen array `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024 test { $id } venster { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = de attack_log bevat geen start-/eindvenster

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } geplande gebeurtenissen, maar de run scoorde { $events2 }: geef de eigen gebeurtenissen van de run op

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s moet positief zijn en guard_s niet negatief

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m moet minstens een element bevatten

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m moet eindig zijn

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: verwacht "null-steering" of "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz moet positief zijn (ontvangen: { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: de sectie heeft een [jammer] nodig

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) moet eindig zijn en gelijk aan of boven tracking_threshold_dbhz ({ $tracking_threshold_dbhz }) liggen

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s moet eindig en niet-negatief zijn (ontvangen: { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits moet 1 tot 16 zijn (ontvangen: { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz moet positief zijn (ontvangen: { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side moet minstens 2 zijn (ontvangen: { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } moet eindig zijn (ontvangen: { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } moet positief zijn (ontvangen: { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: profielpunt { $points } ({ $lat }, { $lon }) ligt buiten de DEM-tegel

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: profielpunt { $points } ({ $lat }, { $lon }) ligt op een DEM-leemte

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC-kalenderdatum buiten bereik: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = zo'n kalenderdatum bestaat niet: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC-seconde { $second } buiten bereik om { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = een lanceerplaats op de pool heeft geen gedefinieerd azimut

engine-e-launch-inclination-unreachable-from-latitude-without = inclinatie { $inclination_rad }° is onbereikbaar vanaf breedtegraad { $lat_rad }° zonder dogleg (vereist |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = de snelheid van een lanceerplaats op de ware pool vereist zowel `epoch` als `eop_finals2000a` (een echte IERS-finals2000A-inhoud)

engine-e-launch-site-lon-deg-must-be = site_lon_deg moet in [-180, 360] liggen

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a bevatte geen leesbare IERS-finals2000A-rijen

engine-e-launch-epoch-mjd-is-outside-the = epoch { $epoch } (MJD { $mjd_utc }) ligt buiten de aangeleverde EOP-rijen (MJD { $mjd } tot { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg moet in [-90, 90] liggen

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg moet in [0, 180] liggen

engine-launch-launch-window-lat-az-asc = lanceervenster: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° asc, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s voordeel van de aardrotatie, { $opportunities } kansen/dag (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = elke afstandssnelheid heeft een positieve, eindige sigma nodig

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = { $n_meas } metingen kunnen { $n } Doppler-onbekenden niet oplossen

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = de Doppler-geometrie is singulier

engine-e-leo-fusion-doppler-no-covariance = geen covariantie

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = elke pseudoafstand heeft een positieve, eindige sigma nodig

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = { $obs } pseudoafstanden kunnen { $n } onbekenden niet oplossen (3 positie + { $n_clock } klokken)

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = een satelliet valt samen met de positieschatting

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = de geometrie is singulier

engine-e-leo-fusion-joint-pvt-no-iteration-ran = er is geen iteratie uitgevoerd

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = ontaarde eindgeometrie

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = de DOP is niet eindig

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } moet positief zijn

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m moet niet-negatief zijn en de run mag hoogstens 5000 epochs bevatten

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = elk signaal heeft een positieve bandbreedte nodig

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz = 5G NTN-positiebepaling bij { $r } MHz, C/N0 { $r2 } tot { $r3 } dB-Hz, { $n_satellites } satellieten ({ $mean_in_view } in zicht){ "\u000A" }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, CRB-afstand { $range_sigma_zenith_m } tot { $range_sigma_mask_m } m; mediane formele 3D { $s2 } m, RMS-fout { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples = { "  " }Doppler-overpas van een satelliet: { $n_obs } samples gedurende { $duration_s } s, horizontale fout { $horizontal_error_m } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP heeft minstens een systeem nodig

engine-e-leo-fusion-ppp-duration-and-step-must-be = duur en stap moeten positief zijn, met hoogstens 20000 epochs

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs moet 1 tot 200 zijn

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = convergentiedrempels moeten positief zijn

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical = PPP-convergentie naar { $criterion_horizontal_m } m horizontaal / { $criterion_vertical_m } m verticaal, { $runs_per_case } runs per geval, { $n_gnss } GNSS-satellieten{ "\u000A" }

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  mediaan { $c } min  geconvergeerd { $v4 }%  NEES gemiddeld { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = mediane horizontale fout over { $runs_per_case } runs · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = voorinstelling { $id } bevat geen signaal

engine-e-leo-fusion-presets-preset-has-no-signal-it = voorinstelling { $id } heeft geen signaal { $n }; ze heeft { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = onbekende LEO-voorinstelling { $id }; bekend: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s en step_s moeten positief zijn, met hoogstens 20000 epochs

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = de polaire stappen moeten positief zijn

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode moet doppler, joint, polar of timing zijn; ontvangen: { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = de modus doppler heeft minstens een LEO-systeem nodig

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = de modus timing heeft een LEO-systeem met codebereik nodig

engine-e-leo-fusion-pvt-kind-unknown-clock-class = onbekende klokklasse { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) op { $user_lat_deg }, { $user_lon_deg } gedurende { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } satellieten op { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites = { "  " }Doppler-positiebepaling: { $n_obs } metingen van { $n_sats } satellieten, 3D-fout { $error_3d_m } m (horizontaal { $horizontal_error_m } m){ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }venster { $window_s } s: { $n_sats } satellieten, 3D-fout { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } overpas door het zenit: max. Doppler { $max_doppler_hz } Hz, snelheid { $max_doppler_rate_hz_s } Hz/s, jerk { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }LEO-afstandsmetingssatelliet in zicht bij { $v1 }% van de epochs{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } beschikbaarheid { $availability }, mediane PDOP { $f }, RMS 3D-fout { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } gefuseerd { $f3 }; in zicht { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, max { $row3 } ns (in zicht { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — modus { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = systeem { $name }: role moet gnss of leo zijn, ontvangen: { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = systeem { $name }: clock moet estimated of known zijn, ontvangen: { $c }

engine-e-leo-fusion-system-system-must-be-positive = systeem { $name }: { $what } moet positief zijn

engine-e-leo-fusion-system-system-mask-deg-must-be = systeem { $name }: mask_deg moet in [0, 90) liggen

engine-e-leo-fusion-system-system-sigma-pr-must-be = systeem { $name }: sigma_pr_m moet positief zijn

engine-e-leo-fusion-system-give-at-least-one-system = geef minstens een [[system]] op

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = de epochafstand moet positief zijn

engine-e-leo-fusion-timing-no-epochs = geen epochs

engine-e-leo-fusion-timing-no-satellite-was-ever-in = geen enkele satelliet was ooit in zicht: de ontvanger heeft nooit tijd verkregen

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = de polarisatie moet rhcp, lhcp of linear zijn; ontvangen: '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4-foutcode { $code } bij t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = een baan met een inclinatie van { $inc } deg passeert nooit breedtegraad { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = de gevraagde maximale elevatie ligt onder het bereik van de horizon

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = de gebouwklasse moet traditional of thermally-efficient zijn; ontvangen: '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = veld { $name } is niet eindig

engine-e-leo-navmsg-codec-field-is-outside-its-bit = veld { $name } = { $value } { $unit } ligt buiten zijn { $bits }-bitbereik (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = bericht afgekapt

engine-e-leo-navmsg-codec-field-list-exhausted = veldlijst uitgeput

engine-e-leo-navmsg-codec-field-order-mismatch-vs = veldvolgorde komt niet overeen: { $name } versus { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID moet 1-255 zijn

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = elke correctiepolynoom heeft 1-8 coëfficiënten nodig

engine-e-leo-navmsg-codec-correction-time-scale-must-be = de correctietijdschaal moet een macht van twee zijn van 1 s tot 32768 s; ontvangen: { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = een ECEF-polynoom heeft 1-11 coëfficiënten nodig, gelijk per as

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = de graad { $v1 } van de ECEF-polynoom overschrijdt 10

engine-e-leo-navmsg-codec-unknown-model-id = onbekende model-id { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = de payload overschrijdt 4095 bytes

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = frame is korter dan header en CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = ongeldige preambule 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = niet-ondersteunde versie { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = de framelengte { $frame } komt niet overeen met de aangegeven payload van { $len } bytes

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q komt niet overeen: berekend 0x{ $crc }, frame bevat 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees mogen elk hoogstens 7 zijn; ontvangen: { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree moet 1-10 zijn; ontvangen: { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = onbekend efemeridemodel '{ $other }': gebruik kepler16, kepler-rac, liu22 of ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = het fitinterval moet minstens 10 s zijn; ontvangen: { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = het fitvenster [{ $t0 }, { $v1 }] s ligt buiten de referentieboog [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = de ECEF-polynoomfit is singulier (te weinig samples voor de graad)

engine-e-leo-navmsg-fit-clock-fit-is-singular = de klokfit is singulier

engine-e-leo-navmsg-fit-keplerian-fit-diverged = de Kepler-fit is divergent

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = onbekende voorinstelling '{ $k }'; beschikbaar: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s moet 10-3600 s zijn en update_period_s in (0, fit_interval_s]; ontvangen: { $fit_interval_s } en { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s en eval_step_s moeten 0.5-60 s zijn

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz moet 10 MHz overschrijden; ontvangen: { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid moet 1-255 zijn

engine-e-leo-navmsg-band-must-be-15-and = band moet 0-15 zijn en health 0-3

engine-e-leo-navmsg-unknown-csv-schema = onbekend csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis moet minstens een analyse noemen

engine-e-leo-navmsg-unknown-analysis-use = onbekende analyse '{ $a }'; gebruik { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind moet leo-navmsg zijn; ontvangen: { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg moet in [0, 60) liggen; ontvangen: { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO-navigatiebericht — { $res } km, { $res2 } deg, zwaartekrachtgraad { $gravity_degree }, model { $res3 }
    { "  " }SISRE-gewichten: w_R { $w_r }, w_AC^2 1/{ $v6 } (masker { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s moet 60-86400 s zijn

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s mag niet leeg zijn, elk 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }afweging van het fitinterval over { $span } s (gebruiksperiode = fitinterval):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE baan-RMS { $sisre_orb_rms_m } m  max { $sisre_orb_max_m } m  met klok-RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s mag niet leeg zijn, elk 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s moet 60-86400 s zijn

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } parameters  SISRE baan-RMS { $sisre_orb_rms_m } m  met klok { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = geen overpas boven { $mask } deg voor de gebruiker op { $lat }, { $lon } binnen { $search } s; vergroot midpass.search_s of verplaats de gebruiker

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }update halverwege de overpas: overpas { $p0 }-{ $p1 } s (max. elevatie { $pmax } deg), { $switches } omschakelingen, grootste sprong in gebruikersafstand { $max_jump } m (slechtste geometrie { $max_worst } m) versus drempel { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }encodering-decodering: model { $m }, frame { $frame } bytes ({ $payload_bits } payloadbits, { $eph_bits } efemeride+klokbits), CRC-24Q 0x{ $hex }
    { "    " }kwantisatie: grootste positieverandering { $v6 } mm, klok { $v7 } mm; SISRE exact { $acc_exact } m, gekwantiseerd { $acc_q } m
    { "    " }beschadigd frame afgewezen: { $corrupted_rejected }; RINEX-rondgang { $rin_dp } m; CSV-rondgang { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs moet 1-20 zijn

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  gepubliceerd { $published } m  verhouding { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = De Kepler-set met 16 parameters verslechtert van { $a } m bij { $lo } s tot { $b } m bij { $hi } s: een Kepler-set met harmonischen van tweemaal per omloop kan de hoogfrequente zwaartekrachttermen en de luchtweerstand van een LEO-boog niet langer dan enkele minuten volgen, en de kleinstekwadratenresidu oscilleert over het venster. De langs-/dwars-/radiale polynomen, van hogere graad dan de Kepler-set omvat, absorberen wat overblijft en geven { $c } m bij { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = De Kepler-set met 16 parameters gaat van { $a } m bij { $lo } s naar { $b } m bij { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, zwaartekrachtgraad { $gravity_degree } · representatiefout ten opzichte van de referentie · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` is van de hostbibliotheek

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: `rand_distr`-samplers roepen in hun zeldzame takken de host-`exp` en -`ln` aan; gebruik `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` is het zwaartekrachtveld van de hostbibliotheek; gebruik `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` is niet beoordeeld

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = geen END OF HEADER-regel

engine-e-leo-navmsg-text-expected-eph-record-header-got = verwacht een recordheader '> EPH', ontvangen: { $head }

engine-e-leo-navmsg-text-bad-satellite-id = ongeldige satelliet-id { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = epochregel ontbreekt

engine-e-leo-navmsg-text-bad-epoch-line = ongeldige epochregel { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = ongeldig epochveld in { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = een epochregel heeft drie klokttermen nodig: { $ep }

engine-e-leo-navmsg-text-record-truncated = record afgekapt

engine-e-leo-navmsg-text-unknown-record-type = onbekend recordtype { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = de CSV-tabel bevat kepler16- en kepler-rac-berichten; ontvangen: { $m }

engine-e-leo-navmsg-text-empty-csv = lege CSV

engine-e-leo-navmsg-text-row-has-cells-header = rij heeft { $cells } cellen, header { $header }

engine-e-leo-navmsg-text-bad-number-in-column = ongeldig getal { $c } in kolom { $k }

engine-e-leo-navmsg-text-csv-row-lacks = CSV-rij mist { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = de baanhoogte moet tussen 100 km en 3000 km liggen; ontvangen: { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = de excentriciteit moet voor een LEO-fit in [0, 0.1) liggen; ontvangen: { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = de integratiestap moet in (0, 30] s liggen; ontvangen: { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = de duur moet positief zijn met hoogstens 200000 stappen; ontvangen: { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree moet 0, 2-6 (zonaal) of 7-{ $v1 } (EGM2008) zijn; ontvangen: { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = de propagatie van de referentie is divergent

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = de referentiebaan is vervallen tot onder 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = de knoopafstand moet in (0, 60] s liggen; ontvangen: { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = een getabelleerde referentiebaan heeft minstens twee toestanden nodig; ontvangen: { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = toestand { $k } is niet eindig

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = de klok-adev_1s moet in [0, 1e-6) liggen; ontvangen: { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = een gemeten klok wordt gebouwd met TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = een gestuurde klok heeft sigma_s in [0, 1e-3) en tau_s > 0 nodig; ontvangen: { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = een gemeten klok heeft een positieve stap en minstens twee samples nodig

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = een sample van een gemeten klok is niet eindig

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epoch '{ $s }' is niet van de vorm YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epoch '{ $s }' is niet van de vorm YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epoch '{ $s }' heeft een ongeldig secondenveld

engine-e-leo-pass-epoch-is-out-of-range = epoch '{ $s }' valt buiten het bereik

engine-e-leo-pass-band-unknown-signal-design-public = band '{ $name }': onbekend signaalontwerp '{ $n }'; openbare ontwerpen: { $v2 }

engine-e-leo-pass-band-is-not-in-the = band '{ $name }' staat niet in de systeemvoorinstelling: geef frequency_mhz en eirp_dbw op

engine-e-leo-pass-band-needs-eirp-dbw = band '{ $name }' heeft eirp_dbw nodig

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern moet isoflux, gaussian of flat zijn; ontvangen: '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = de frequentie van band '{ $name }' valt buiten het bereik

engine-leo-pass-overridden-in-the-scenario = { $source } (overschreven in het scenario)

engine-e-leo-pass-system-has-no-band = systeem '{ $id }' heeft geen band '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = een LEO-satelliet heeft minstens een band nodig

engine-e-leo-pass-at-most-12-bands-per = hoogstens 12 banden per satelliet

engine-leo-pass-unknown-system-presets-in-this = onbekend systeem '{ $n }'; voorinstellingen in deze build: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = geen zonsynchrone baan op { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (hoogstens 86400) en step_s moeten positief zijn, met hoogstens 20000 epochs; ontvangen: { $duration } en { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO-satelliet, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = de `epoch` { $epoch } van het scenario, gelezen als UTC

engine-leo-pass-the-kind-default-epoch-utc = de standaardepoch { $epoch } UTC van de kind (het scenario geeft er geen op)

engine-e-leo-pass-user-environment-must-be-ground = user.environment moet ground, maritime, air of indoor zijn; ontvangen: '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg moet binnen +/-90 liggen

engine-e-leo-pass-user-speed-must-be-to = de snelheid van de gebruiker moet 0 tot 3000 m/s zijn en de hoogte -500 tot 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna moet patch, hemispherical of isotropic zijn; ontvangen: '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability moet in (0, 1) liggen

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model moet klobuchar, vtec of none zijn; ontvangen: '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction moet ascending of descending zijn; ontvangen: '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satelliet { $id }: ongeldige excentriciteit of perigeum

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satelliet { $id }: tle heeft tle_line1 en tle_line2 nodig

engine-e-leo-pass-orbit-must-be-pass-elements = orbit moet pass, elements of tle zijn; ontvangen: '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation heeft een system of een design nodig

engine-e-leo-pass-no-sun-synchronous-inclination = geen zonsynchrone inclinatie

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: hoogstens 5000 satellieten

engine-e-leo-pass-no-leo-satellite-rises-above = geen LEO-satelliet komt in het venster boven het masker uit

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s moet in (0, 3600] liggen

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' is geen band van enige LEO-satelliet ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = geen GNSS-signaal '{ $bname }' voor constellatie '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = lege GNSS-constellatie

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' zijn niet twee verschillende banden van { $id }

engine-e-leo-pass-iot-powers-and-battery-must = de IoT-vermogens en de batterij moeten positief zijn

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from moet median of peak zijn; ontvangen: '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = detectiedrempel { $detection_snr_db } dB na integratie

engine-leo-pass-coherent-integration-at-most-ms = coherente integratie hoogstens { $rx } ms, begrensd door de Doppler-snelheid

engine-leo-pass-serial-search-with-correlators = seriële zoekactie met { $correlators } correlatoren

engine-leo-pass-hot-start-doppler-known-to = hot start: Doppler bekend tot op +/-{ $aided } Hz, efemeride geldig

engine-leo-pass-leo-pass-link-budget-user = linkbudget van de LEO-overpas, gebruiker ({ $environment }) op { $lat_deg }, { $lon_deg }; { $satellites } LEO-satelliet(ten), venster van { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, max. elevatie { $max_elevation_deg } deg bij { $tca_s } s, { $duration_above_mask_s } s boven het masker{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 piek { $opt } mediaan { $opt2 }; |Doppler| max { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: { $satellites_in_view } in zicht, C/N0 { $opt } tot { $opt2 } (mediaan { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } piek { $leo_peak_cn0_dbhz } dB-Hz is { $leo_peak_above_gnss_median_db } dB boven de GNSS-mediaan; boven de sterkste GNSS-draaggolf gedurende { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: koude TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), hot { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer vanaf { $onset_s } s (sprong { $offset_m } m, duw { $push_rate_m_s } m/s): Doppler-test GNSS { $t }, LEO { $t2 }, gefuseerd { $t3 }; cross-band { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = gebruiker ({ $environment }) · LEO-piek { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB boven de GNSS-mediaan · MODELLED

engine-leo-pass-user-modelled = gebruiker ({ $environment }) · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler van de eerste band van elke LEO-satelliet (±{ $v1 } kHz volledige schaal)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = ongeldige tabel [{ $what }]: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' staat niet in [signal] en is geen openbaar ontwerp ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' heeft geen codegevolgde component en geeft dus geen pseudoafstand

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind moet leo-pnt-chain zijn; ontvangen: { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = de gevolgde component heeft geen chipsnelheid

engine-e-leo-pnt-chain-no-band-of-pass-names = geen band van [pass] noemt signal = "{ $name }"; de keten heeft er een nodig om het ontwerp te dragen

engine-e-leo-pnt-chain-the-pass-gives-no-code = de overpas geeft geen codejitter

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m moet in [0, 100] m liggen; ontvangen: { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] moet mode = "joint" gebruiken; ontvangen: { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = gevolgde C/N0 bij het masker van { $mask } deg (lijnfit in sin elevatie)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] heeft geen LEO-systeem om de waarden van de keten te ontvangen

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] leverde geen joint-blok op

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT-keten: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signaal { $name2 } ({ $design }), gevolgd { $design2 } bij { $v4 } Mchip/s, C/N0-offset { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }overpas { $id } { $sat } km: gevolgde C/N0 piek { $peak_tracked_cn0_dbhz } dB-Hz, codejitter mediaan { $jitter_median } m; C/N0-lijn { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }bericht { $res } { $fit_interval_s } s fit / { $update_period_s } s update: representatie-SISRE { $stats } mm RMS (baan { $stats2 } mm), met { $od } m baanbepaling: { $sisre } m doorgegeven{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }gefuseerde positiebepaling: alleen GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP-convergentie: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } waarden doorgegeven tussen de fasen. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Codetrackingjitter, de afstandsmetingsfout (m, 0 tot { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · alleen GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulatie { $label }: de breedte moet positief zijn

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = onbekende signaalvoorinstelling { $name }: de bibliotheek heeft { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = voorinstelling { $name }: ongeldig voorinstellingsbestand: { $e }

engine-e-leo-signal-preset-file-names-itself = voorinstellingsbestand { $name } noemt zichzelf { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz moet positief zijn

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz moet positief zijn

engine-e-leo-signal-signal-needs-at-least-one = { $name }: een signaal heeft minstens een component nodig

engine-e-leo-signal-component-power-fraction-must-be = { $name }: component { $v1 } power_fraction moet positief zijn

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: component { $v1 } heeft fdma_shares maar geen fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: component { $v1 } fdma_shares moeten positief zijn en optellen tot een

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: component { $v1 } heeft een fdma_share per offset nodig

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps moet positief zijn

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips moet positief zijn

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: de vermogensfracties van de componenten tellen op tot { $total }, niet 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km moet positief zijn

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: een vlakke (OFDM-achtige) component kan niet in het spectrummodel worden geplaatst

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: de gevolgde component zit op FDMA-subdraaggolven; het spectrummodel volgt een component op het bandcentrum

engine-e-leo-signal-signal-is-given-twice = signaal { $w } is twee keer opgegeven

engine-e-leo-signal-signals-is-more-than-the = { $out } signalen is meer dan de toegestane 24

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s moet kleiner zijn dan 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: geef 1 tot 40 cn0_dbhz-waarden op

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 en slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points moet tussen 21 en 2001 liggen

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: gebruik "coherent" of "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = de systeemruistemperatuur moet positief zijn

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: onbekend GNSS-signaal { $n } (bekend: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } is geen scenariosignaal

engine-e-leo-signal-shape-check-signal-is-not = vormcontrole: signaal { $signal } staat niet in het scenario

engine-leo-signal-scenario-leo-signal-signals-noise = scenario leo-signal | { $runs } signalen | ruisvloer { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = links: bandbegrensde PSD van elk ontwerp (dB onder de piek, over de zendband); rechts: codejitter t.o.v. totale C/N0 bij { $reference_spacing_chips } chipafstand

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = onbekende band '{ $other }' (verwacht s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km moet eindig en positief zijn

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps moet eindig en positief zijn

engine-e-linkbudget-other-losses-db-must-be = other_losses_db moet eindig en >= 0 zijn

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k moet eindig en positief zijn indien opgegeven

engine-linkbudget-link-budget-band-km-bit = link-budget: { $value }-band, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, marge { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = kan niet luisteren op { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: luistert op tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp-client verbonden

engine-live-io-kshana-live-warning-is-not = kshana live: waarschuwing: { $addr } is geen loopback-adres; alles wat het kan bereiken kan de stream lezen

engine-e-live-io-cannot-open = kan { $spec } niet openen: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: een tcp-client die het niet kon bijhouden is losgekoppeld

engine-e-live-io-cannot-open-2 = kan { $path } niet openen: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: waarschuwing: { $addr } is geen loopback-adres; alles wat het kan bereiken kan deze laag een stream sturen

engine-e-live-io-cannot-bind-udp = kan udp { $addr } niet binden: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: luistert op udp { $addr }

engine-e-live-io-cannot-connect-to = kan geen verbinding maken met { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: verbonden met tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: leest serieel { $path } op { $baud } baud (alleen lezen)

engine-live-io-the-was-closed-by-the = de { $v1 } is door de tegenpartij gesloten (de laag maakt niet opnieuw verbinding: draai haar onder een supervisor die haar herstart)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: gebruik 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 of 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } is geen serieel apparaat (tcgetattr mislukt)

engine-e-live-io-cannot-set-baud = kan { $baud } baud niet instellen

engine-e-live-io-cannot-set-the-line-mode = kan de regelmodus van { $path } niet instellen

engine-e-live-io-serial-is-supported-on-unix = --serial wordt alleen op Unix ondersteund; gebruik --file, --tcp of --stdin

engine-live-io-unknown-option = onbekende optie { $s }

engine-live-io-cannot-read = kan { $session } niet lezen: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: vaartuigplatform, kalibreert gedurende { $calibration_s } s; poort { $v2 }. Adviserende software, geen typegoedgekeurde navigatieapparatuur: de exploitant blijft verantwoordelijk.

engine-live-io-write-failed = schrijven mislukt: { $e }

engine-live-io-kshana-live-dropped-udp-datagram = kshana live: { $n } udp-datagram(men) die de engine niet kon verwerken zijn verworpen ({ $udp_dropped } in totaal)

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } ligt buiten 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = invoegindex { $p } buiten 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = de bestanden van bijlage 3 bevatten { $gold } en { $ter } codes, 210 verwacht

engine-e-lunar-afs-codes-annex-afs-prn-is-not = AFS-I PRN { $v1 } uit bijlage 3 is geen Gold-code van g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = secundaire code S{ $id } bestaat niet (S0 tot S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 wijst codes alleen toe aan knooppuntidentificaties 1 tot 12, niet { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } past niet in twee bits (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } buiten 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = { $SB1_SYMBOLS } subframe-1-symbolen verwacht

engine-e-lunar-afs-frame-subframe-data-lengths-expected = lengtes van de subframedata { $sb2 }/{ $sb3 }/{ $sb4 } (verwacht { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = { $FRAME_SYMBOLS } symbolen verwacht, { $soft } gegeven

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = regel { $v1 }: verwacht `row,column`

engine-e-lunar-afs-ldpc-line = regel { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = regel { $v1 }: ({ $r },{ $c }) buiten { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: { $info_bits } informatiebits verwacht, { $info } gegeven

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = de LSIS V1.0-data staat niet in { $cache_dir } (stel KSHANA_LSIS_DIR in of draai xval/lunar-afs/fetch_lsis.sh, dat { $LSIS_PDF_URL } downloadt en de bijlagen uitpakt; ze worden niet met Kshana meegeleverd)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } is geen vastgezet LSIS-bestand

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } heeft SHA-256 { $got }, verwacht { $want } (vastgezet op LSIS V1.0 van 29 januari 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal-basisband, { $LSIS_VERSION }; Kshana-referentiegenerator

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = AFS-knooppunt { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = AFS-knooppunt { $node_id } frame TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites moet minstens 1 zijn

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites moet minstens 1 zijn

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg moet in [0, 90) liggen; ontvangen: { $mask_deg }

engine-lunar-beacon-satellites-no-beacons = { $n_sats } satellieten, geen bakens

engine-lunar-beacon-satellites-visible-beacons = { $n_sats } satellieten + { $n_vis_beacons } zichtbare bakens

engine-lunar-beacon-satellites-no-beacons-2 = { $n_cmp } satellieten, geen bakens

engine-e-lunar-beacon-serialising-beacon-report = bakenrapport serialiseren: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = het bakenrapport moet naar een JSON-object serialiseren

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Lunaire oppervlaktebaken-augmentatie — masker { $elevation_mask_deg } deg, epoch +{ $epoch_s } s, sigma_URE per baken { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  sats { $n_visible_sats }  bakens { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  gerealiseerde 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }bakens verbeteren PDOP met een factor { $f };{ " " }

engine-lunar-beacon-larger-constellation-instead = een grotere constellatie in plaats daarvan, een factor { $f }{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = kan de lunaire efemeride { $path } niet lezen: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = lunaire efemeride: de eerste regel moet `{ $MAGIC }` zijn, gevonden: `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = lunaire efemeride: het bestand is leeg

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = lunaire efemeride: `# format:` moet `states` of `elements` zijn, gevonden: `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = lunaire efemeride: geen datarijen

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = lunaire efemeride: ontbrekende kolom `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = lunaire efemeride: `# elements_frame:` moet `icrf` of `mci` zijn, gevonden: `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = lunaire efemeride: `elements_frame: icrf` heeft `# epoch_jd_tdb:` nodig (de epoch waarop de elementen betrekking hebben, en tevens waar de rotatie van ICRF naar maangebonden wordt geëvalueerd): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = lunaire efemeride: te korte elementenrij { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = lunaire efemeride: elementenrij { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = lunaire efemeride: elementenrij { $v1 } heeft een niet-positieve halve lange as

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = lunaire efemeride: elementenrij { $v1 } heeft excentriciteit { $ecc }, buiten [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = lunaire efemeride: een `states`-bestand heeft `# frame: icrf` of `# frame: mci` nodig, gevonden: `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = lunaire efemeride: een `icrf`-toestandsbestand heeft `# epoch_jd_tdb:` nodig: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = lunaire efemeride: te korte toestandsrij { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = lunaire efemeride: toestandsrij { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = lunaire efemeride: toestandsrij { $v1 } is niet eindig

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = lunaire efemeride: toestandsrij { $v1 } voor satelliet { $sat } gaat terug in de tijd ({ $t } na { $last }); epochs moeten per satelliet strikt oplopen

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Getabelleerde maangecentreerde toestandsefemeride ({ $e }-frame), Lagrange-geïnterpoleerd met orde { $LAGRANGE_ORDER } tussen tabelepochs en door { $v2 } herleid naar MCMF. De toestanden worden door deze engine NIET gepropageerd. Herkomstklasse `published-ephemeris`: te onderscheiden van elk uit elementen afgeleid cijfer.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Gepubliceerde constellatiedefinitie, vermeld in maangecentreerd ICRF (`{ $v1 }`), gepropageerd door de eigen Kepler-oplosser van deze engine in datzelfde inertiale frame en herleid naar MCMF door de IAU 2015 / WGCCRE-maanoriëntatie (precesserende pool, analytische fysieke libratie) op elke epoch. GEEN frameapproximatie: de bron noemt het frame en de epoch, en beide worden gebruikt. Herkomstklasse `published-elements`: te onderscheiden van elk uit een kernel afgeleid cijfer.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Gepubliceerde constellatiedefinitie, gepropageerd door de eigen Kepler-oplosser van deze engine en herleid met het lunaire spinmodel met gemiddelde rotatie — precies het pad dat de illustratieve constellatie volgt, zodat het enige verschil tussen de twee runs het constellatieontwerp is. De bron vermeldt de elementen in het `{ $v1 }`-frame; ze worden hier als MCI gelezen, wat de constellatie kantelt met `published_frame_tie_angle_deg`. Herkomstklasse `published-elements`: te onderscheiden van elk uit een kernel afgeleid cijfer.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = onbekend station_datum { $other }: verwacht "fixed" of "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = een VLBI-campagne heeft minstens 2 stations nodig om een basislijn te vormen, ontvangen: { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = station { $name } heeft een niet-eindige coördinaat

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = station { $name } breedtegraad { $lat } deg ligt buiten [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = een Helmert-datum met zeven parameters heeft minstens 3 niet-collineaire bakens nodig, ontvangen: { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = baken { $name } heeft een niet-eindige coördinaat

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = baken { $name } breedtegraad { $lat } deg ligt buiten [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours moet positief en eindig zijn, ontvangen: { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min moet positief en eindig zijn, ontvangen: { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = een schema van { $v1 } epochs overschrijdt de grens van 5000 epochs van dit scenario; verleng step_min of verkort arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s moet positief en eindig zijn, ontvangen: { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg moet eindig zijn en in [-90, 90) liggen, ontvangen: { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg moet eindig zijn en in [-90, 90) liggen, ontvangen: { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol moet eindig zijn en in [0, 1) liggen, ontvangen: { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m moet positief en eindig zijn, ontvangen: { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver moet "spectral" of "srif" zijn, ontvangen: "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = lunar-frame-campaign-resultaat serialiseren: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = geen enkele waarneming in de campagne haalt het { $mask } deg aardzijdige elevatiemasker aan beide uiteinden van een basislijn EN het { $earth_mask } deg masker boven de eigen horizon van het baken: { $n_epochs } epochs x { $v1 } basislijnen x { $n_beacons } bakens zijn allemaal verworpen. Verleng arc_hours, verlaag een masker of verplaats de stations.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = volle rang: alle 7 gelijkvormigheidsparameters worden door deze campagne vastgelegd (conditiegetal { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANGTEKORT: { $defect } van de 7 gelijkvormigheidsrichtingen zijn niet waarneembaar vanuit deze campagne, dus er wordt GEEN datumsigma gepubliceerd; de niet-waarneembare richtingen staan in de basis met zeven parameters

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | { $n_beacons } bakens x { $v1 } basislijnen x { $n_epochs } epochs = { $n_obs } waarnemingen (vertragingssigma { $sigma_tau } s) | stationsdatum { $station_datum } | Helmert-rang { $rank }/7 cond { $condition } | datumtranslatiesigma { $v5 } t.o.v. herstelfout van de geïnjecteerde transformatie { $trans_err_norm_m } m (verhouding { $v7 })

engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } van { $beacons } bakens hebben geen waarneming in dit schema ({ $names2 }); ze bevatten geen informatie, hun sigma's zijn null, en de datum wordt alleen uit de waargenomen bakens gerealiseerd

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = alle sigma's moeten positief zijn

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane en altitude_km moeten positief zijn

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency moet in (0, 1] liggen

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m t.o.v. grond { $v2 } m positiesigma, gemiddelde q { $v3 } (chi-kwadraat 6 verwacht 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } ambiguïteiten, ILS-succes { $last2 } (bootstrap { $last3 }) op de langste boog

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: kleinste informatie-eigenwaarde x{ $v } met orbiterverbindingen, CRLB-spoor x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } sweeppunten op { $v } bogen; laser t.o.v. GNSS x translatiesigma { $last2 } m bij de geregistreerde lokale koppeling

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB-sigma h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = onbekende studie `{ $other }`: verwacht een van { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = de metingenset bepaalt de baan niet (singuliere informatie)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials moet minstens 1 zijn

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = grondsigma's moeten positief zijn

engine-e-lunar-infra-od-unknown-station-dss-14-dss = onbekend station `{ $nm }`: DSS-14, DSS-63 of DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = te weinig grondmetingen om de baan te bepalen

engine-e-lunar-infra-od-the-covariance-of-the-difference = de covariantie van het verschil is singulier

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = de differentiële correctie van de NRHO is vanuit de startwaarde niet geconvergeerd

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo heeft 0 < pericynthionhoogte < apocynthionhoogte nodig

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = onbekende banenfamilie `{ $other }`: nrho of elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s en arc_days moeten positief zijn

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = geen gemeenschappelijke satelliet tussen de ontvangers

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = de normaalvergelijkingen van de draaggolffase zijn singulier

engine-e-lunar-infra-phase-the-position-block-is-singular = het positieblok is singulier

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = de ambiguïteitscovariantie is niet positief-definiet

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = techniek-sigma's moeten positief zijn

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = sigma's van de lokale koppeling moeten positief zijn

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz moet eindig en positief zijn

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz moet eindig en positief zijn

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k moet eindig en positief zijn

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km moet eindig zijn en boven de maanstraal liggen

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity moet in [0, 1) liggen

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw moet eindig zijn

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | { $n_sats } sats, { $n_epochs } epochs, { $n_links } verbindingen vanaf ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (gemiddelde { $mean_js_db }) | { $n_lost } VERLOREN | beschikbaarheid { $availability_under_jamming } van { $availability_nominal } nominaal

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | { $n_sats } sats, { $n_epochs } epochs, { $n_links } verbindingen vanaf ({ $site_lat_deg }, { $site_lon_deg }) | geen jammer (lunaire basislijn met schone hemel) | { $n_lost } VERLOREN | beschikbaarheid { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = onverwachte header van de reflectorcatalogus { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = te korte rij in de reflectorcatalogus { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = onleesbaar reflectorveld { $i } in { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = reflector { $f }: |(x,y,z)| = { $norm3 } m maar de gepubliceerde stralenkolom zegt { $radius } m — de rij is bewerkt

engine-e-lunar-llr-reflector-catalogue-has-no-rows = de reflectorcatalogus heeft geen rijen

engine-e-lunar-llr-unreadable-position-epoch-year = onleesbaar position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = onverwachte header van de stationscatalogus { $t }

engine-e-lunar-llr-short-station-catalogue-row = te korte rij in de stationscatalogus { $t }

engine-e-lunar-llr-unreadable-station-field-in = onleesbaar stationsveld { $i } in { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = onleesbaar ILRS-id in { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = de stationscatalogus heeft geen rijen

engine-e-lunar-llr-cannot-read-this-scenario-runs = kan { $path } niet lezen ({ $e }). Dit scenario draait op het vastgelegde echte-datadeel onder { $DEFAULT_DATA_DIR }, dat met de repository wordt meegeleverd maar niet met de gepubliceerde crate; wijs `data_dir` naar een kopie ervan.

engine-e-lunar-llr-only-usable-normal-points-for = slechts { $used } bruikbare normaalpunten voor { $reflectors } reflectoren — te weinig om { $v3 } coördinaten te begrenzen; verbreed het archiefdeel

engine-e-lunar-llr-the-simulated-campaign-own-report = het eigen rapport van de gesimuleerde campagne kon niet worden gelezen: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: { $used } gearchiveerde normaalpunten ({ $n_parsed } gelezen) van { $station_counts } station(s) naar { $reflectors } retroreflectorarrays over { $v5 } d; mediane gemeten normaalpuntprecisie { $median } mm enkele reis; reflectorinformatierang { $rank }/{ $n }; Helmert-rang { $rank2 }/{ $n_helmert } cond { $condition }; datumtranslatiesigma { $v12 } m; RMS van het residu waargenomen-min-berekend enkele reis { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg moet eindig zijn en in [-90, 90) liggen, ontvangen: { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } heeft een niet-eindige coördinaat

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } breedtegraad { $lat_deg } deg ligt buiten [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = het lunar-llr-datum-rapport serialiseren mislukt: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = de integratiestap moet een deler van de uitvoerstap zijn

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } moet eindig en niet-negatief zijn

engine-lunar-receiver-must-be-finite-and-positive = { $n } moet eindig en positief zijn

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: exportlocatie: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = lunaire efemeride { $path } beslaat { $until } s na haar epoch maar de scenariohorizon reikt tot { $last } s; verkort horizon_hours of haal een langere boog op (extrapoleren van een getabelleerde efemeride wordt geweigerd)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path heeft epoch_utc nodig (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = OP-frame op { $epoch } UTC (schijnbare baannormaal van de aarde rond de maan, x langs haar knoop op de IAU-maanequator); lunaire GM, J2 en C22 in het IAU maangebonden frame, aarde en zon als derde lichamen op DE440-posities uit { $spk_path }; Runge-Kutta van de vierde orde, stap van 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m moet eindig en positief zijn

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m moet eindig en positief zijn

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 heeft height_aided = true nodig

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites moet 3 of 4 zijn, ontvangen: { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs moet 1 tot 144 zijn

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } moet eindig en positief zijn

engine-lunar-station-must-be-finite-and-not = { $name } moet eindig en niet-negatief zijn

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } overschrijdt { $MAX_WORK }; verlaag n_trials, maak grid_lat_step_deg grover (of geef minder punten op), of verhoog t_step_s / verkort t_span_s

engine-e-lunar-station-kind-must-be-got = kind moet { $KIND } zijn; ontvangen: { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: de efemeride { $path } beslaat { $until } s maar de run reikt tot { $last } s (de laatste epoch plus latency_s); verkort t_span_s

engine-e-lunar-station-no-case = { $KIND }: geen geval ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } punten · { $n_epochs } epochs · { $n_trials } trials

engine-lunar-station-hpl-max = HPL max { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = opmeting { $survey_sigma_m } m · latentie { $latency_s } s · { $quantization_bits } bits

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines en samples moeten 2 tot { $MAX_DEM_SIDE } zijn, ontvangen: { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } hoogten voor een raster van { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m moet positief zijn, ontvangen: { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m moet positief zijn, ontvangen: { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: kan { $descriptor_path } niet lezen: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection moet south-polar-stereographic zijn, ontvangen: { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type moet int16-le zijn, ontvangen: { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: kan { $img } niet lezen: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: raster boven de limiet van { $MAX_DEM_SIDE } pixels

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } is { $bytes } bytes; { $lines } x { $samples } int16 heeft { $d } nodig

engine-e-lunar-terrain-dem-sha-256-does-not = dem: SHA-256 { $digest } van { $img } komt niet overeen met { $image_sha256 } uit de descriptor

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor moet positief zijn

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: kan { $path } niet lezen: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: heeft minstens 2 x 2 punten nodig, een oplopende uitgestrektheid binnen [-90, 90] deg en 360 deg lengtegraad, en eindige hoogten

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } moet eindig en positief zijn, ontvangen: { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m moet eindig en niet-negatief zijn, ontvangen: { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg mag hoogstens 90 zijn

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m moet 1 tot 1e6 zijn

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: de locatie ligt buiten het hoogteveld

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: een opgegeven horizon heeft een niet-lege bron nodig

engine-e-lunar-terrain-terrain-stated-horizon = terrain: opgegeven horizon: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: geef dem_path of dem_tile_path op, niet beide

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km moet eindig en positief zijn

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m moet eindig en positief zijn

engine-e-lunar-terrain-site-deg-deg = { $e } (locatie { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = onbekende klok { $other }; verwacht een van optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks moet minstens een klokklasse noemen

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s moet eindig en positief zijn, ontvangen: { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s moet eindig zijn en groter dan tau_min_s ({ $lo }), ontvangen: { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade moet ≥ 1 zijn

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = term { $name } is korter dan het tau-raster

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | klok { $clock } | 7-termen x_Σ(τ) over { $taus } τ-punten ({ $taus2 }–{ $taus3 } s) | kruispunt τ { $crossover_tau_s } s (x { $crossover_x_s } s) | framevloer { $frame_term_s } s | klok x(1 d) { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | timelab: { $lab } { $lab2 } naar LTC, x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: onbekende klok { $other }; verwacht een van optical-master, passive-h-maser, rafs, mini-rafs, of geef een device_card op

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: geef clock of device_card op, niet beide

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s moet eindig en positief zijn, ontvangen: { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } moet eindig en niet-negatief zijn, ontvangen: { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s moeten positieve getallen zijn

engine-lunar-time-lab-station-height-not-modelled-exactly = stationshoogte niet exact gemodelleerd: een hoogtefout van { $height_sigma_m } m (een sigma) verschuift de snelheid met { $value } ns/dag, toegepast als lineaire term sinds de laatste bijsturing

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = de lichttijd is niet binnen 30 iteraties tot 1e-15 s geconvergeerd

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = het kernelpad heeft planetary_kernel_path, earth_orientation_kernel_path en moon_orientation_kernel_path samen nodig

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = onbekende datum { $other }: verwacht "anchor-first-station", "free-network" of "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = een VLBI-schema heeft minstens 2 stations nodig om een basislijn te vormen, ontvangen: { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = bakencoördinaten moeten eindig zijn

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = bakenbreedtegraad { $lat } deg ligt buiten [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = een schema van { $v1 } epochs overschrijdt de grens van 20000 epochs van dit scenario; verleng step_min of verkort arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g moet positief en eindig zijn, ontvangen: { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = lunar-vlbi-fim-resultaat serialiseren: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = geen enkele waarneming in het schema haalt het { $mask } deg elevatiemasker aan beide uiteinden van een basislijn: { $n_epochs } epochs x { $v1 } basislijnen zijn allemaal verworpen. Verleng arc_hours, verlaag elevation_mask_deg of verplaats de stations.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = de datum laat geen parameter over om te schatten

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANGTEKORT: { $defect } van { $dim } richtingen zijn niet waarneembaar, dus er wordt geen sigma per coördinaat gerapporteerd; de onderstaande waarde voor de waarneembare deelruimte is een pseudo-inverse beperkt tot de { $rank } waarneembare richtingen en is GEEN stationssigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | { $n_stations } stations / { $v2 } basislijnen x { $n_epochs } epochs = { $n_obs } waarnemingen (masker { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | stationssigma { $v10 } t.o.v. equipartitie g={ $g } { $eq_g } m (verhouding { $v13 })

## src/main.rs

engine-main-error-validate-needs-scenario-path = fout: --validate heeft een scenariopad nodig

engine-main-error-study-needs-suite-manifest = fout: --study heeft een pad naar een suitemanifest nodig

engine-main-error-study-name-needs-value = fout: --study-name heeft een waarde nodig

engine-main-error-export-sp3-needs-path = fout: --export-sp3 heeft een pad nodig

engine-main-error-export-omm-needs-path = fout: --export-omm heeft een pad nodig

engine-main-error-export-oem-needs-path = fout: --export-oem heeft een pad nodig

engine-main-error-animate-needs-format-svg = fout: --animate heeft een formaat nodig: svg, html, frames of all

engine-main-error-animate = fout: --animate: { $e }

engine-main-error-animate-fps-needs-whole = fout: --animate-fps heeft een geheel aantal frames per seconde nodig

engine-main-error-export-needs-format-czml = fout: --export heeft een formaat nodig: czml, kml, geojson, stk, sigmf, all of list

engine-main-error-animate-duration-needs-length = fout: --animate-duration heeft een lengte in seconden nodig

engine-main-error-import-route-needs-geojson = fout: --import-route heeft een GeoJSON-bestandspad nodig

engine-main-error-eop-needs-finals2000a-file = fout: --eop heeft een finals2000A-bestandspad nodig

engine-main-error-unknown-option = fout: onbekende optie '{ $other }'

engine-main-error-unexpected-argument-one-scenario = fout: onverwacht argument '{ $other }'; een scenariobestand per run

engine-main-warning-animate-fps-and-animate = waarschuwing: --animate-fps en --animate-duration doen niets zonder --animate

engine-main-error-animate-exports-one-scenario = fout: --animate exporteert een scenariorun; het kan niet worden gecombineerd met --validate of --study

engine-main-error-validate-lints-one-scenario = fout: --validate controleert een scenario; geef niet ook een scenariobestand op

engine-main-error-cannot-read = fout: kan { $validate_file } niet lezen: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — het type wordt herkend; dit type vereist geen veld (een lege body draait zijn referentieconfiguratie), dus er was verder niets te controleren

engine-main-ok-kind-resolves-and-all = ok: { $kind } — het type wordt herkend en alle { $n_required } gepubliceerde verplichte veldvermeldingen zijn aanwezig; veldwaarden worden niet gecontroleerd

engine-main-error-study-runs-suite-do = fout: --study draait een suite; geef niet ook een enkel scenariobestand op

engine-main-warning-study-name-is-ignored = waarschuwing: --study-name wordt genegeerd met --study; een studie krijgt zijn titel van `title =` in het suitemanifest

engine-main-error-cannot-read-2 = fout: kan { $path } niet lezen: { $e }

engine-main-hint-kshana-example-lists-the = hint: `kshana example` toont de ingebouwde referentiescenario's; `kshana example clock-holdover > clock-holdover.toml` schrijft er een weg

engine-main-error-cannot-read-3 = fout: kan { $eop_file } niet lezen: { $e }

engine-main-error-eop = fout: --eop: { $e }

engine-main-error-cannot-read-4 = fout: kan { $route_file } niet lezen: { $e }

engine-main-error-import-route = fout: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: is niet van toepassing: { $why }

engine-main-error-export = fout: --export: { $e }

engine-main-error-animate-2 = fout: --animate { $f }: { $e }

engine-main-error-export-2 = fout: { $fmt }-export: { $e }

engine-main-error-cannot-write = fout: kan { $json_path } niet schrijven: { $e }

engine-main-error-cannot-write-2 = fout: kan { $svg_path } niet schrijven: { $e }

engine-main-error-cannot-build-the-report = fout: kan het rapport niet opbouwen: { $e }

engine-main-error-cannot-write-3 = fout: kan { $html_path } niet schrijven: { $e }

engine-main-error-cannot-write-4 = fout: kan { $report_json_path } niet schrijven: { $e }

engine-main-error-cannot-write-5 = fout: kan { $csv_path } niet schrijven: { $e }

engine-main-wrote-and = geschreven: { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } en { $csv_path }

engine-main-wrote-and-2 = geschreven: { $json_path }, { $svg_path }, { $html_path } en { $report_json_path }

engine-main-error-cannot-write-6 = fout: kan { $target } niet schrijven: { $e }

engine-main-error-cannot-write-7 = fout: kan { $sp3_path } niet schrijven: { $e }

engine-main-error-sp3-export-failed = fout: SP3-export mislukt: { $e }

engine-main-error-cannot-write-8 = fout: kan { $omm_path } niet schrijven: { $e }

engine-main-error-omm-export-failed = fout: OMM-export mislukt: { $e }

engine-main-error-cannot-write-9 = fout: kan { $oem_path } niet schrijven: { $e }

engine-main-error-oem-export-failed = fout: OEM-export mislukt: { $e }

engine-main-error-unexpected-argument-after-kinds = fout: onverwacht argument '{ $other }' na `kinds`; alleen --json wordt geaccepteerd

engine-main-bundled-reference-scenarios-write-one =
    Ingebouwde referentiescenario's ({ $v1 }). Schrijf er een naar een bestand en draai het:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (niet ingebouwd: { $name } — draai `kshana example { $name }` voor de reden)

engine-main-error-is-not-bundled-it = fout: '{ $name }' is niet ingebouwd: het { $why }

engine-main-error-no-bundled-scenario-named = fout: geen ingebouwd scenario met de naam '{ $name }'; `kshana example` toont de { $v1 } die er zijn

engine-main-error-cannot-read-5 = fout: kan { $suite_path } niet lezen: { $e }

engine-main-wrote-and-3 = geschreven: { $json_path } en { $html_path }

engine-main-error-needs-value = fout: { $a } heeft een waarde nodig

engine-main-error-expected-mean-needs-number = fout: --expected-mean heeft een getal nodig

engine-main-error-unknown-imu-fit-option = fout: onbekende imu-fit-optie { $x }

engine-main-error-imu-fit-needs-an = fout: imu-fit heeft een pad naar een IMU-log nodig

engine-main-error-needs-value-2 = fout: { $args } heeft een waarde nodig

engine-main-error-epoch = fout: --epoch: { $e }

engine-main-error-unknown-bench-export-option = fout: onbekende bench-export-optie { $a }

engine-main-error-bench-export-needs-scenario = fout: bench-export heeft een scenariopad nodig

engine-main-needs-value = { $a } heeft een waarde nodig

engine-main-site-takes-lat-lon-height = --site neemt lat,lon[,height_m], ontvangen: { $v }

engine-main-error-is-bytes-the-tle = fout: { $p } is { $m } bytes; de TLE-limiet is { $cap } (4 MiB)

engine-main-error-cannot-read-6 = fout: kan { $p } niet lezen: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = onbekende sky-optie { $a }

engine-e-main-svg-and-monte-carlo-are = --svg en --monte-carlo zijn aparte uitvoer; geef er een op

engine-main-error-preset-needs-name =
    fout: --preset heeft een naam nodig
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    fout: --profile heeft een bestand nodig
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } symbolen, { $r2 } frame(s) gevonden; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }frame op { $f }: FID { $f2 } TOI { $f3 } (SB1-maat { $f4 }, { $f5 } SP-fout(en), { $f6 } SB1-fout(en))

engine-main-not-checked = niet gecontroleerd: { $r }

engine-main-wrote-frame-of-6000-symbols = geschreven: { $out }: { $frames } frame(s) van 6000 symbolen; subframes 2 tot 4 zijn plaatshouders (niet LDPC-gecodeerd, geen bericht)

engine-main-error-cannot-write-10 = fout: kan { $out } niet schrijven: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = onbekend lunanet-afs-check-subcommando { $other }

engine-main-needs-pack-id = { $cmd } heeft een pakket-id nodig

engine-main-unknown-standards-pack-run-option = onbekende standards-pack run-optie { $a }

engine-main-unknown-standards-pack-subcommand = onbekend standards-pack-subcommando { $other }

engine-main-error-out-needs-value = fout: --out heeft een waarde nodig

engine-main-error-unknown-compliance-report-option = fout: onbekende compliance-report-optie { $a }

engine-main-error-compliance-report-needs-at = fout: compliance-report heeft minstens een resultaatbestand .json nodig

engine-main-runs-read-not-used-rows = { $runs } runs gelezen, { $unrecognised } niet gebruikt; rijen: { $n } met bewijs, { $n2 } gedeeltelijk, { $n3 } zonder bewijs, { $n4 } buiten bereik

engine-main-error-receiver-trust-needs-scenario = fout: receiver-trust heeft een scenariopad nodig

engine-main-error-invalid-receiver-trust-scenario = fout: ongeldig receiver-trust-scenario: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = de brandstoot put de massa uit: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, brandduur={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = de vliegtijd moet positief zijn

engine-e-maneuver-collinear-endpoints-transfer-plane-is = collineaire eindpunten: het transfervlak is ongedefinieerd (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs is voor M >= 1; gebruik lambert voor M = 0

engine-e-maneuver-no-revolution-transfer-the-time = geen overdracht met { $revs } omwentelingen: de vliegtijd ligt onder het minimum

engine-e-maneuver-grid-step-days-must-be = grid_step_days moet positief zijn, ontvangen: { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = elk venster moet vooruit lopen (start <= einde)

engine-e-maneuver-no-transfer-of-the-requested = geen overdracht van het gevraagde type in de vensters

engine-e-maneuver-the-optimum-left-the-feasible = het optimum lag buiten het toegestane gebied

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: 3 waarden verwacht

engine-e-mars-od-dss-epoch-is-not-2003 = de epoch van DSS-{ $id } is niet 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } heeft geen DXYZ

engine-e-mars-od-no-coordinates-for-dss = geen coördinaten voor DSS { $station }

engine-e-mars-od-no-ramps-for-dss = geen ramps voor DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = de ramptabel dekt het interval niet

engine-e-mars-od-epoch-outside-the-integrated-span = epoch { $et } ligt buiten het geïntegreerde bereik

engine-e-mars-od-normal-matrix-is-not-positive = de normaalmatrix is niet positief-definiet

engine-e-mars-od-no-points = geen punten

engine-e-mars-od-parameter-has-no-partial-on = een parameter heeft geen partiële afgeleide op de behouden punten

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | { $user } gebruiker, { $clock_class } klok | { $n_relays } relays (gemiddeld { $mean_relays_in_view } in zicht) | geconvergeerde pos-RMS { $converged_pos_rms_m } m, formele 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM van de covariantie, geen gecertificeerde PL) | klokfrequentie-σ { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — { $user } gebruiker, { $clock_class } klok: 3D-positiefout t.o.v. referentie (geconvergeerde RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = de paarsgewijze matrix is leeg

engine-e-mcda-ahp-pairwise-matrix-is-not-square = de paarsgewijze matrix is niet vierkant (rij { $i } heeft { $row } van { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = element a[{ $i }][{ $j }] = { $v } moet eindig en positief zijn

engine-e-mcda-ahp-diagonal-must-be = diagonaal a[{ $i }][{ $i }] = { $row } moet 1 zijn

engine-e-mcda-ahp-entries-must-be-reciprocal = elementen a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } moeten reciprook zijn (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = bovenste rij { $i } heeft { $row } elementen, verwacht { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = bovenste element ({ $i },{ $j }) = { $v } moet eindig en positief zijn

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: lege beslismatrix

engine-e-mcda-copras-copras-no-criteria = COPRAS: geen criteria

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS: { $n } gewichten maar { $types } criteriumtypen

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: vereist minstens één kostencriterium (Min)

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS: alternatief { $i } heeft { $row } waarden maar er zijn { $n } criteria

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: alternatief { $i } criterium { $j } waarde { $x } moet eindig en > 0 zijn

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: lege dataset

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: geen criteria

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I: alternatief { $i } heeft { $row } waarden maar er zijn { $n } criteria

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: alternatief { $i } heeft een niet-eindige waarde

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: lege beslismatrix

engine-e-mcda-moora-moora-no-criteria = MOORA: geen criteria

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA: { $n } gewichten maar { $types } criteriumtypen

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA: alternatief { $i } heeft { $row } waarden maar er zijn { $n } criteria

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: alternatief { $i } heeft een niet-eindige waarde

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: criterium { $j } heeft L2-norm nul

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: lege beslismatrix

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: geen criteria

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II: { $n } gewichten maar { $types } typen / { $prefs } voorkeursfuncties

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II: alternatief { $i } heeft { $row } waarden maar er zijn { $n } criteria

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: alternatief { $i } heeft een niet-eindige waarde

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: lege beslismatrix

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: geen criteria

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS: { $n } gewichten maar { $types } criteriumtypen

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS: alternatief { $i } heeft { $row } waarden maar er zijn { $n } criteria

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: alternatief { $i } heeft een niet-eindige waarde

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = de additieve nutsfunctie heeft geen attributen

engine-e-mcda-utility-attributes-but-weights = { $attributes } attributen maar { $weights } gewichten

engine-e-mcda-utility-invalid-scaling-constant = ongeldige schaalconstante { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = de schaalconstanten sommeren tot nul

engine-e-mcda-utility-attribute-values-expected-got = { $attributes } attribuutwaarden verwacht, ontvangen: { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: lege beslismatrix

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: geen criteria

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR: { $n } gewichten maar { $types } criteriumtypen

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR: alternatief { $i } heeft { $row } waarden maar er zijn { $n } criteria

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: alternatief { $i } heeft een niet-eindige waarde

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: lege beslismatrix

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: geen criteria

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS: { $n } gewichten maar { $types } criteriumtypen

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } moet in [0, 1] liggen

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS: alternatief { $i } heeft { $row } waarden maar er zijn { $n } criteria

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: alternatief { $i } criterium { $j } waarde { $x } moet eindig en > 0 zijn

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: lege beslismatrix

engine-e-mcda-wpm-wpm-no-criteria = WPM: geen criteria

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM: { $n } gewichten maar { $types } criteriumtypen

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM: alternatief { $i } heeft { $row } waarden maar er zijn { $n } criteria

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: alternatief { $i } criterium { $j } waarde { $x } moet eindig en > 0 zijn

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = de beslismatrix heeft geen criteria

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = de beslismatrix heeft geen alternatieven

engine-e-mcda-wsm-criterion-has-an-invalid-weight = criterium '{ $name }' heeft een ongeldig gewicht { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = de criteriumgewichten sommeren tot nul

engine-e-mcda-wsm-alternative-has-values-but-there = alternatief '{ $name }' heeft { $values } waarden maar er zijn { $n } criteria

engine-e-mcda-wsm-alternative-has-non-finite-value = alternatief '{ $name }' heeft een niet-eindige waarde op criterium '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = geen DAF: korter dan één record

engine-e-naif-kernel-not-daf-identification-word = geen DAF: identificatiewoord { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = niet-ondersteund binair DAF-formaat { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = onwaarschijnlijke DAF-header: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF-adres { $addr } ligt voorbij het einde van het bestand

engine-e-naif-kernel-bad-daf-address-range = ongeldig DAF-adresbereik { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = de DAF-samenvattingslijst eindigt niet

engine-e-naif-kernel-daf-summary-record-claims-summaries = DAF-samenvattingsrecord { $rec } claimt { $count } samenvattingen

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = misvormd type-2-segment: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = de grootte van het type-2-segment komt niet overeen met de directory

engine-e-naif-kernel-epoch-outside-the-record = epoch { $et } ligt buiten het record [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = de grootte van het type-1-segment komt niet overeen met N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = misvormd type-1-record: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = geen SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = de SPK-samenvatting is niet ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = geen SPK type-1/2-data voor lichaam { $target } op ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = het SPK-segment voor { $target } staat in stelsel { $frame }, niet J2000

engine-e-naif-kernel-spk-centre-chain-does-not = de SPK-middelpuntketen bereikt het zwaartepunt niet

engine-e-naif-kernel-not-binary-pck = geen binaire PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = de PCK-samenvatting is niet ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = geen PCK type-2-data voor stelsel { $body_frame } op ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = het PCK-stelsel { $body_frame } is gegeven ten opzichte van stelsel { $other }, dat niet J2000 of ECLIPJ2000 is

## src/navsignal.rs

engine-e-navsignal-bad-number = ongeldig getal { $s }

engine-e-navsignal-must-be-positive-number = { $s } moet een positief getal zijn

engine-e-navsignal-modulation-expected-name-args-bpsk = modulatie { $label }: verwacht NAME(args), bijvoorbeeld BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulatie { $label }: sluitende haakje ontbreekt

engine-e-navsignal-modulation-is-not-one-of = modulatie { $label } is niet een van BPSK(n), BOC(m,n) of MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = niet-afgesloten entiteit in { $s }

engine-e-ndm-xml-bad-character-reference = ongeldige tekenverwijzing &{ $ent };

engine-e-ndm-xml-unknown-entity = onbekende entiteit &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = niet-afgesloten verwerkingsinstructie

engine-e-ndm-xml-unterminated-comment = niet-afgesloten commentaar

engine-e-ndm-xml-unterminated-declaration = niet-afgesloten declaratie

engine-e-ndm-xml-expected-an-element-at-byte = element verwacht op byte { $pos }

engine-e-ndm-xml-unterminated-start-tag = niet-afgesloten starttag

engine-e-ndm-xml-attribute-without-value = attribuut zonder waarde

engine-e-ndm-xml-unterminated-attribute-value = niet-afgesloten attribuutwaarde

engine-e-ndm-xml-unterminated-end-tag = niet-afgesloten eindtag

engine-e-ndm-xml-unterminated-cdata = niet-afgesloten CDATA

engine-e-ndm-xml-content-after-the-root-element = inhoud na het root-element

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } moet eindig en niet-negatief zijn

engine-e-nma-budget-subframe-must-be-positive = subframe_s moet positief zijn

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps moet positief zijn

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed moet 0 of positief zijn

engine-e-nmea-synth-cli-unexpected-argument = onverwacht argument { $s }

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = instructeurslog: { $e }

engine-nmea-synth-cli-instructor-log-and = instructeurslog: { $jp } en { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP-server luistert op { $s }; wacht op { $wait_clients } client(s)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = verwacht YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = datum of tijd buiten bereik (jaren 1980 tot 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = zo'n kalenderdatum bestaat niet

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } moet een eindig getal zijn

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s moet in 1 tot 86400 s liggen

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz moet 1, 2, 5 of 10 zijn

engine-e-nmea-synth-config-vessel-position-must-lie-within = de positie van het vaartuig moet binnen 89 graden van de evenaar liggen

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn moet in 0 tot 60 liggen

engine-e-nmea-synth-config-vessel-rate-of-turn-and = de limieten voor draaisnelheid en versnelling van het vaartuig moeten positief zijn

engine-e-nmea-synth-config-give-at-least-one-waypoint = geef minstens één [[waypoint]] of vessel.heading_deg op

engine-e-nmea-synth-config-waypoint-is-out-of-range = waypoint { $v1 } ligt buiten bereik

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = speed_kn van waypoint { $v1 } moet in 0 tot 60 liggen

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems moet minstens één constellatie noemen

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } is niet een van { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s moet minstens 1 zijn

engine-e-nmea-synth-config-event = gebeurtenis { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s moet binnen de run liggen

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s moet positief zijn; ramp_s en recovery_s mogen niet negatief zijn

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s mag duration_s niet overschrijden

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } geldt niet voor dit type

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz moet in 20 tot 60 liggen

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db is vereist

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db moet in 0 tot 80 liggen

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db moet in 0 tot 30 liggen

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m is vereist

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m moet in 0 tot 500000 liggen

engine-e-nmea-synth-config-the-drag-would-accelerate-the = de drag-off zou het valse spoor versnellen met tot { $need } m/s^2, boven max_accel_mps2 = { $a }; verleng ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = geef precies één van bearing_deg, relative_bearing_deg op

engine-e-nmea-synth-config-offset-is-required = offset_s is vereist

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s moet ongelijk aan nul zijn en binnen een dag liggen

engine-e-nmea-synth-config-delay-is-required = delay_s is vereist

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s moet in 0 tot 3600 liggen

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = de skyline beschrijft geen obstructie

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } is beëindigd

engine-nmea-synth-gen-the-receiver-reports-fix-again = de ontvanger meldt weer een positiebepaling ({ $n_used } satellieten gebruikt)

engine-nmea-synth-gen-the-receiver-has-no-fix = de ontvanger heeft geen positiebepaling ({ $n_used } bruikbare satellieten, vier nodig)

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = vanaf T+{ $start_s } s gedurende { $duration_s } s (inzetramp { $ramp_s } s, herstelramp { $recovery_s } s)

engine-nmea-synth-log-every-tracked-satellite-shows-db = ; elke gevolgde satelliet toont { $c } dB-Hz zolang het duurt

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: ontvangen C/N0 daalt met maximaal { $cn0_drop_db } dB (spreiding per satelliet { $spread_db } dB); satellieten vallen weg en de positiebepaling gaat verloren wanneer minder dan vier bruikbaar blijven

engine-nmea-synth-log-towards-deg-true = richting { $b } deg ware koers

engine-nmea-synth-log-towards-deg-true-deg-relative = richting { $t } deg ware koers ({ $r } deg relatief ten opzichte van de koers bij aanvang, daarna aangehouden)

engine-nmea-synth-log-position-drag-off-the-reported = positie-drag-off: de gemelde positie loopt { $final_offset_m } m weg { $dir } terwijl de ontvanger een geldige positiebepaling houdt (het valse spoor piekt op { $pv } m/s en { $pa } m/s^2){ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = tijdspoofing: gemelde UTC wijkt { $offset_s } s af van de ware tijd; de positie blijft waar{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = replay-vertraging (meaconing-stijl): positie{ $v1 } ijlt { $delay_s } s achter op de referentie{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = natuurlijke degradatie: de hemel sluit zich achter een opgegeven skyline ({ $e }); satellieten erachter blijven vermeld zonder SNR en worden niet gebruikt, de C/N0 van de overige is ongewijzigd en niets is nagemaakt

engine-nmea-synth-log-instructor-log = INSTRUCTEURSLOG: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Opmerking van de trainer: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Start { $start_utc }   duur { $duration_s } s   seed { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }PIEKEN  werkelijk: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   gemeld: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: onbekende constellatie { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }De tolerantie ligt onder de ruisvloer { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)) van de f64-rangaflezing: de equivalente eigenwaardedrempel rel_tol^2 = { $v1 } ligt onder de afrondingsruis van de Gram-matrix, dus de extra richtingen zijn rekenkundig residu, geen waarneembaarheid.

engine-observability-gramian-rank-clamped-from-the-singular = rang begrensd van het aantal singuliere waarden { $counted } tot min(rijen, kolommen) = min({ $n_rows }, { $n_cols }) = { $shape_bound } bij rel_tol { $rel_tol }: een { $n_rows }x{ $n_cols }-matrix kan geen rang { $counted } hebben.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP ongedefinieerd (rangdeficiënte / singuliere geometrie): rang { $rank } van { $n } toestanden, datumdefect { $v3 }, conditie { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bytes is geen geheel aantal records van 36 bytes

engine-e-odf-record-precedes-any-group-header = record { $v1 } komt vóór elke groepsheader

engine-e-odf-no-orbit-data-group = geen baandatagroep

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } is geen sleutelwoord van { $name }

engine-e-odm-without = { $name } zonder { $k }

engine-e-odm-needs-exactly-one-of = { $name } heeft precies één van { $group } nodig

engine-e-odm-classification-and-message-id-are = CLASSIFICATION en MESSAGE_ID zijn headersleutelwoorden van versie 3.0 (versie { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = onverwachte regel { $b }

engine-e-odm-unknown-keyword = onbekend sleutelwoord { $k }

engine-e-odm-block-repeated-or-out-of = blok { $block } herhaald of in de verkeerde volgorde bij { $key }

engine-e-odm-repeated = { $key } herhaald

engine-e-odm-comments-after-the-last-keyword = commentaar na het laatste sleutelwoord

engine-e-odm-given-twice = { $b } tweemaal opgegeven

engine-e-odm-opm-without-metadata = OPM zonder metadata

engine-e-odm-opm-without-state-vector = OPM zonder toestandsvector

engine-e-odm-omm-without-metadata = OMM zonder metadata

engine-e-odm-omm-without-mean-elements = OMM zonder gemiddelde elementen

engine-e-odm-is-not-keyword-of-the = { $k } is geen sleutelwoord van het blok { $kind }

engine-e-odm-block-without = blok { $kind } zonder { $k }

engine-e-odm-block-with-data-lines = blok { $kind } met dataregels

engine-e-odm-line-has-values-expected = regel { $l } van { $kind } heeft { $l2 } waarden, verwacht { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } is geen OCM-metadatasleutelwoord

engine-e-odm-ocm-metadata-without = OCM-metadata zonder { $k }

engine-e-odm-block-repeated = blok { $kind } herhaald

engine-e-odm-inside-block = { $t } binnen een blok

engine-e-odm-unsupported-ocm-block = niet-ondersteund OCM-blok { $tag }

engine-odm-outside-block = { $t } buiten een blok

engine-e-odm-closes-block = { $t } sluit een blok { $want }

engine-e-odm-unexpected-line-2 = onverwachte regel { $t }

engine-e-odm-outside-block = { $k } buiten een blok

engine-e-odm-unterminated-block = niet-afgesloten blok

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = epoch mist het scheidingsteken 'T' tussen datum en tijd: { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = niet-ondersteunde OEM-epochdatum '{ $date }' (verwacht yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = niet-ondersteunde OEM-epochtijd '{ $time }' (verwacht HH:MM:SS)

engine-e-oem-bad-epoch-year = ongeldig epochjaar: { $d }

engine-e-oem-bad-epoch-month = ongeldige epochmaand: { $d }

engine-e-oem-bad-epoch-day = ongeldige epochdag: { $d }

engine-e-oem-bad-epoch-hour = ongeldig epochuur: { $t }

engine-e-oem-bad-epoch-minute = ongeldige epochminuut: { $t }

engine-e-oem-bad-epoch-second = ongeldige epochseconde: { $t }

engine-e-oem-oem-epoch-field-out-of = OEM-epochveld buiten bereik: { $s }

engine-e-oem-unexpected-oem-header-line = onverwachte OEM-headerregel: { $line }

engine-e-oem-expected-meta-start-found = verwacht META_START, gevonden: { $line }

engine-e-oem-unexpected-oem-metadata-line = onverwachte OEM-metadataregel: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM-segmentmetadata mist META_STOP

engine-e-oem-oem-metadata-missing-object-name = OEM-metadata mist OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = OEM-metadata mist OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = OEM-metadata mist CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = OEM-metadata mist REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = OEM-metadata mist TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = OEM-metadata mist START_TIME

engine-e-oem-oem-metadata-missing-stop-time = OEM-metadata mist STOP_TIME

engine-e-oem-oem-data-line-needs-position = een OEM-dataregel heeft positie+snelheid (6) of +versnelling (9) componenten nodig, ontvangen: { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = niet-numerieke OEM-toestandswaarde '{ $t }' in: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM mist de header CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = OEM mist de header CREATION_DATE

engine-e-oem-oem-missing-originator-header = OEM mist de header ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM bevatte geen segmenten

engine-oem-oem-interop-round-tripped-segment = oem-interop: roundtrip van { $segments } segment(en), { $n_states_total } toestanden; maximale roundtripfout { $p } km / { $v } km/s (MODELLED interop)

engine-oem-oem-interop-ingested-segment-states = oem-interop: { $segments } segment(en), { $n_states_total } toestanden ingelezen uit externe OEM (opsteller { $originator }) (MODELLED interop)

engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = geen COVARIANCE_START-blok

engine-e-oem-no-covariance-stop = geen COVARIANCE_STOP

engine-e-oem-bad-covariance-value = ongeldige covariantiewaarde '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = 21 covariantiewaarden verwacht, gevonden: { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM-export vereist volledige TLE's (regel 1 + regel 2); dit blok heeft ze niet

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

engine-e-optical-atmosphere-scenario-must-be-in = { $n } moet in [0, 1] liggen

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg moet in [5, 90] liggen

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave moet "plane" of "spherical" zijn

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction moet "downlink" of "uplink" zijn

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = de elementen van availability_targets_pct moeten in (0, 100) liggen

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h mag hoogstens 8760 zijn (één jaar)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } stappen is meer dan de { $MAX_STEPS } die een resultaat bevat; verhoog step_s of verkort duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = onbekende klokklasse "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = elke site heeft een naam nodig

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = site { $name }: breedte/lengte buiten bereik

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = site { $name }: altitude_m moet in [0, top) liggen

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm bij { $elevation_deg } deg elevatie, marge { $margin0 } dB vóór de atmosfeer; beste site { $scn } { $v5 } %; netwerk van { $order } sites { $last } % onafhankelijk / { $last2 } % gecorreleerd weer (MODELLED, adviserend)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = RINEX-blok verwerkt maar bevatte geen ondersteunde efemeriden

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg moet in [-90, 90] liggen en elk veld moet eindig zijn

engine-e-orbit-no-satellites-to-export = geen satellieten om te exporteren

engine-e-orbit-time-step-must-be-positive = time.step_s moet positief zijn voor SP3-export

engine-e-orbit-time-step-must-be-positive-2 = time.step_s moet positief zijn voor OEM-export

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } moet positief zijn; ontvangen: { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s moet eindig en niet-negatief zijn

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate moet eindig en niet-negatief zijn

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = de minimale elevatie van de spoofer moet in [0, 90) graden liggen

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns van de kruiscontrole moet eindig en niet-negatief zijn

engine-orbital-timing-the-in-plane-neighbour-degrees = de buur in hetzelfde baanvlak, { $v1 } graden vooruit, ligt buiten de footprint van één spoofer ({ $v2 } graden breed)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = de buur in hetzelfde baanvlak, { $v1 } graden vooruit, kan binnen de footprint van dezelfde spoofer liggen ({ $v2 } graden breed), dus beide klokken kunnen samen worden meegetrokken

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = invoerbestand ontbreekt

engine-e-osnma-cli-max-time-error-has-no = --max-time-error heeft geen effect zonder --reference-time

engine-e-osnma-cli-not-number = geen getal: { $s }

engine-e-osnma-cli-public-key-must-be-id = de publieke sleutel moet ID:TYPE:HEX zijn

engine-e-osnma-cli-public-key-type-must-be = het type van de publieke sleutel moet p256 of p521 zijn

engine-e-osnma-cli-unknown-format = onbekend formaat { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } is geen tekst; gebruik --format ubx voor een UBX-stroom

engine-e-osnma-cli-vector-csv-needs-start-gst = een vector-CSV heeft --start-gst of een bestandsnaam met datum nodig

# legal: native review
engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    fout: kan { $input } niet lezen: { $e }

# legal: native review
engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA-verificatie
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = invoer: { $input } ({ $pages } pagina's)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: { $frames } frames; { $inav_pages } I/NAV-pagina's gedecodeerd, { $pages } in de tijd geplaatst ({ $bad_crc } ongeldige CRC, { $unstamped } niet te plaatsen, { $time_conflicts } tijdconflicten)

engine-osnma-cli-overall-nma-status = algemeen: { $status_word }   NMA-status: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALARM: een geverifieerd OSNMA-alarmbericht is ontvangen. Stop met het gebruik van OSNMA-data; niets wordt als geauthenticeerd gemeld.

engine-osnma-cli-freshness-not-enforced-no-reference = actualiteit: NIET afgedwongen. Er is geen referentietijd opgegeven, dus de tijden van de subframes worden uit de invoer overgenomen en een replay van oude data zou worden geauthenticeerd.

engine-osnma-cli-freshness-sub-frames-within-of = actualiteit: subframes binnen { $max_err } s van de referentietijd { $v2 } worden gebruikt; { $set_aside } zijn terzijde gelegd. Een referentietijd is één enkel tijdstip.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satelliet  status          geauthenticeerd  mislukt  in behandeling  verworpen  laatst geauthenticeerd

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epoch (tag-subframe)      tx   data  adkd  ctr  resultaat

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = regel { $v1 }: 3 velden verwacht

engine-e-osnma-input-line-bad-svid = regel { $v1 }: ongeldige SVID

engine-e-osnma-input-line-bad-bit-count = regel { $v1 }: ongeldig aantal bits

engine-e-osnma-input-line-data-is-not-hex = regel { $v1 }: data is geen hex

engine-e-osnma-input-line-bit-count-does-not = regel { $v1 }: het aantal bits komt niet overeen met de data

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = de tijdtolerantie moet onder één subframe liggen ({ $SUBFRAME_S } s), ontvangen: { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834-refractie is gedefinieerd voor stationshoogten 0 tot 3 km; ontvangen: { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s en step_s moeten positief zijn

engine-e-passes-station-lat-deg-must-be = station_lat_deg moet in [-90, 90] liggen

engine-e-passes-mask-deg-must-be-in = mask_deg moet in [0, 90) liggen

engine-e-passes-duration-hours-must-be-finite = duration_hours moet eindig en positief zijn

engine-e-passes-step-must-be-finite-and = step_s moet eindig en positief zijn

engine-passes-passes-pass-es-of-km = passes: { $passes } pass(es) van een baan van { $altitude_km } km / { $inclination_deg }° boven ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° in { $duration_hours } h; { $total_access_s } s totale toegang (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = te kort { $record }-record: { $line }

engine-e-precise-products-bad-number-in = ongeldig getal { $s } in { $line }

engine-e-precise-products-bad-field-in = ongeldig veld { $s } in { $line }

engine-e-precise-products-bad-antex-epoch = ongeldige ANTEX-epoch { $s }

engine-e-precise-products-bad-offset = ongeldige offset { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = de efemerideleverancier heeft geen geocentrische { $name } op JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D-fout RMS { $rms } m (max. { $max } m)

engine-pvt-post-fit-rms = { " " }| post-fit-RMS { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } sat nav | { $epochs_solved }/{ $epochs_total } epochs opgelost | gemiddeld { $mean_n_used } sats, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Enkelpuntspositiebepaling — 3D-fout t.o.v. opgemeten coördinaat (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Enkelpuntspositiebepaling — post-fit-residu-RMS ({ $mean_postfit_rms_m } m gemiddeld)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = de array-accessors van RunOutput vereisen NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } is geen numerieke array (een lijst getallen, of lijsten getallen van gelijke lengte)

engine-e-python-is-not-non-empty-list = { $path } is geen niet-lege lijst records

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-e-python-and-must-be-the-same = i en q moeten even lang zijn ({ $i } t.o.v. { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: niet verworven (statistiek { $statistic } < drempel { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } (ontwerp, PRN)-kanalen; ten hoogste 256 per sweep

engine-python-not-acquired-statistic-threshold = { $code }: niet verworven (statistiek { $statistic } < drempel { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] heeft `label` nodig

engine-e-python-runs-needs-result = runs[{ $i }] heeft `result` nodig

engine-e-python-must-be-between-and-32 = { $name } moet tussen 0 en 2**32 - 1 liggen

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | seed { $seed } | v{ $engine_version } | kwantum wint { $value }/{ $foms } FoMs | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } van { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = onbekende baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = onbekende candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = ADEV-taus/waarden moeten eindig en > 0 zijn

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | kandidaat { $candidate_source } | timing-holdover { $timing_holdover_s }s t.o.v. { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inertiaal { $inertial_holdover_s }s t.o.v. { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | veerkracht-coast { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = het RINEX-klokbestand declareert tijdsysteem { $id }, dat deze lezer niet kent (bekend: { $known_clock_time_systems }); het wordt geweigerd in plaats van de epochs als GPS-tijd te lezen

engine-e-realdata-clk-rinex-clock-file-has-satellite = het RINEX-klokbestand heeft satellietsysteem { $other } en declareert geen TIME SYSTEM ID; het wordt geweigerd in plaats van het tijdsysteem van de epochs te raden

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX-klokbestanden declareren verschillende tijdsystemen ({ $s } en { $ts }); ze worden geweigerd in plaats van op één tijdas te worden samengevoegd

engine-e-realdata-clk-no-as-or-ar-records = geen AS- of AR-records voor { $id }

engine-e-realdata-clk-short-circular-row = te korte Circular T-rij: { $t }

engine-e-realdata-clk-bad-value-in = ongeldige waarde { $s } in { $t }

engine-e-realdata-clk-no-section-mjd-header-found = geen MJD-header van sectie 1 gevonden

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = niet-afgesloten sluittag

engine-e-realdata-ion-sdr-unbalanced-closing-tag = niet-passende sluittag

engine-e-realdata-ion-sdr-unterminated-tag = niet-afgesloten tag

engine-e-realdata-ion-sdr-attribute-value-missing = attribuutwaarde ontbreekt

engine-e-realdata-ion-sdr-element-outside-the-document = element buiten het document

engine-e-realdata-ion-sdr-text-outside-the-document = tekst buiten het document

engine-e-realdata-ion-sdr-element-left-open = { $stack } element(en) opengelaten

engine-e-realdata-ion-sdr-expected-one-root-element-found = één root-element verwacht, gevonden: { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = onbekend frequentieformaat { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = niet-ondersteunde codering { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } streams: alleen bestanden met één stream worden gelezen

engine-e-realdata-ion-sdr-block-of-cycles-with-header = een blok van { $cycles } cycli met een header of footer herhaalt zich; alleen één blok dat het hele bestand beslaat wordt gelezen

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = chunk van { $words_per_chunk } woorden van { $word_bytes } bytes

engine-e-realdata-ion-sdr-unsupported-sample-format = niet-ondersteund sampleformaat { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = kwantisatie { $quantization } in { $packed_bits } gepakte bits per sample

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = een samplefrequentie van { $sample_rate_hz } Hz is geen geheel veelvoud van de frequentiefactor { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = een chunk bevat geen volledige lump

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = samples { $start }..{ $v1 } gevraagd, het bestand bevat er { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = onleesbare CRD-versie { $f }

engine-realdata-llr-crd-crd-format-version-is-not = CRD-formaatversie { $v } wordt niet ondersteund (alleen 1 en 2 delen de veldvolgorde van record-11 waarop deze lezer steunt)

engine-realdata-llr-crd-unreadable-station-id = onleesbare station-id { $f }

engine-realdata-llr-crd-unreadable-time-scale = onleesbare tijdschaal { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD-epoch-tijdschaal { $time_scale } is er niet een van de drie die de formaatspecificatie voor analisten toelaat (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); wordt niet als UTC gelezen

engine-realdata-llr-crd-unreadable-h4-field = onleesbaar h4-veld { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = onleesbaar veld { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = onleesbare epoch-gebeurtenis { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = niet-fysieke looptijd { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = kan de normal-point-map { $dir } niet lezen: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = geen *.npt normal-point-bestanden in { $dir } — dit scenario leest echte gearchiveerde metingen en draait niet zonder die

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = ongeldig getal '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM heeft een dimensie van nul

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = codering { $encoding }: een LuGRE-batch is tweecomplement

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bytes: korter dan de IQS-header

engine-e-realdata-lugre-not-an-iqs-frame = geen IQS-frame: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = samplefrequentie: metadata { $sample_rate_hz } Hz, header { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = kwantisatie: metadata { $quantization } bits, header { $quant_bits } bits

engine-realdata-lugre-centre-frequency-metadata-hz-header = middenfrequentie: metadata { $center_freq_hz } Hz, header { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = tussenfrequentie: metadata { $translated_freq_hz } Hz, header { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = aantal samples: de metadata-indeling geeft { $layout }, header { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = header/footer: metadata { $header_bytes }/{ $footer_bytes } bytes, formaat { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = bestandslengte { $file_len } is niet header + { $value } samplebytes + footer

engine-realdata-lugre-field-missing = veld { $key } ontbreekt

engine-e-realdata-lugre-field-unreadable = veld { $key } onleesbaar

engine-realdata-lugre-raw-line = RAW-regel { $v1 }: { $e }

engine-realdata-lugre-acq-line = ACQ-regel { $v1 }: { $e }

engine-realdata-lugre-nav-line = NAV-regel { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK-rij { $v1 }: onleesbaar

engine-e-realdata-lugre-clk-row-columns-expected = CLK-rij { $v1 }: { $v } kolommen, verwacht 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = JSON parseren: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = een JSON-object op het hoogste niveau verwacht

engine-e-realdata-yunnan-missing-recordtime-array = recordTime-array ontbreekt

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = kan het EOP-bestand { $path } niet lezen: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s moet eindig en niet-negatief zijn, ontvangen: { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = kan het EOP-bestand van de latere uitgave { $path } niet lezen: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = LEEG, en dat is bewust: een rij voorspeld-tegenover-definitief heeft een uitgifte-epoch nodig met een VOLLEDIG fitvenster van { $window_days } dagen erachter en een gepubliceerde definitieve Bulletin B op de doelepoch. De geldende invoer ({ $eop_source }) levert geen epoch die aan beide voldoet. Verkort `operational_window_days`, of lever een langere echte finals2000A-reeks aan — er wordt geen rij gefabriceerd om de tabel te vullen.

engine-realtime-frame-eop-measured-over-the-real-series = Gemeten over de geldende echte reeks ({ $eop_source }). Elke rij is een echte voorspelfout: een voorspelling voor T+h gevormd uit snelle Bulletin A-rijen op of vóór T, gescoord tegen de LATER GEPUBLICEERDE definitieve Bulletin B op T+h. Persistentie wordt gescoord over dezelfde epochverzameling tegen dezelfde definitieve waarden, zodat de twee kolommen alleen in de voorspeller verschillen en in niets anders. `improvement_factor` onder 1 betekent dat de operationele voorspeller SLECHTER is dan persistentie op die horizon, en wordt als zodanig gerapporteerd.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Gemeten over een echt paar van twee uitgaven: de uitgave zoals uitgegeven ({ $eop_source }) bevat echte Bulletin A-voorspellingen na haar eigen datagrens, en de gearchiveerde latere uitgave ({ $c }) bevat de definitieve Bulletin B-waarden die die data uiteindelijk kregen. Drie voorspellingen worden tegen die definitieve waarde gescoord — de gearchiveerde Bulletin A-voorspelling zelf, de fit in operationele stijl van deze crate over de uitgave zoals uitgegeven, en persistentie op de datagrens.

engine-realtime-frame-eop-empty-and-deliberately-so-later = LEEG, en dat is bewust: er is een latere uitgave aangeleverd ({ $c }), maar geen enkele datum staat als Bulletin A-VOORSPELLING in het bestand zoals uitgegeven ({ $eop_source }) en als definitieve Bulletin B in het latere bestand op een gevraagde horizon. Er wordt geen rij gesynthetiseerd.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = LEEG, en dat is bewust. Het scoren van een ECHTE GEARCHIVEERDE voorspelling vereist twee uitgaven van hetzelfde finals2000A-product; deze run kreeg er een ({ $eop_source }). De repository bevat geen gearchiveerde eerdere uitgave, en er wordt er geen gefabriceerd door de bestaande uitgave te verstoren — een gesynthetiseerd archief zou van elk getal in deze tabel een meting van de verstoring maken. Lever een echte gearchiveerde latere uitgave aan via `eop_finals2000a_later` om de tabel te vullen. Tot dan staan de echte fouten voorspeld-tegenover-definitief die dit rapport wel bevat in `table5_operational_vs_persistence`, waar de voorspelling die van deze crate zelf is en de referentie de later gepubliceerde definitieve Bulletin B.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabel 1: nabewerking { $c } m ({ $c2 } ms UT1) ↔ realtime { $c3 } m ({ $c4 } ms UT1) | Tabel 2: definitieve ondergrens { $floor } ms → { $far } dagen { $far2 } ms | budget totaal { $total_m } m ({ $total_time_ns } ns) | L19 hefboomarm + L18 echte data (getoetst aan een onafhankelijke externe referentie), OD cov (gemodelleerd)

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

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Gemeten over een echt paar van twee uitgaven: de Bulletin A VOORSPELDE UT1 van het bestand zoals uitgegeven ({ $eop_source }) verminderd met de uiteindelijke DEFINITIEVE Bulletin B van de gearchiveerde latere uitgave ({ $c }), op { $predicted_vs_final } horizon(nen).

engine-realtime-frame-eop-empty-and-deliberately-so-an = LEEG, en dat is bewust: er is een gearchiveerde latere uitgave aangeleverd ({ $c }), maar geen enkele datum staat als Bulletin A-VOORSPELLING in het bestand zoals uitgegeven ({ $eop_source }) en als definitieve Bulletin B in het latere bestand op een gevraagde horizon, dus er is geen residu voorspeld-tegenover-definitief om te rapporteren. Er wordt geen rij gesynthetiseerd.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = LEEG, en dat is bewust: een residu voorspeld-tegenover-definitief vereist TWEE uitgaven van hetzelfde finals2000A-product. Deze run kreeg er een ({ $eop_source }). De Bulletin A-voorspellingsrijen ervan gelden voor toekomstige data die nog geen definitieve Bulletin B hebben, dus het residu bestaat nog niet om gemeten te worden en er wordt hier geen verzonnen. Lever een gearchiveerde latere uitgave aan via `eop_finals2000a_later` om deze tabel te vullen. Tot dan is de groei over meerdere dagen die `table2_error_vs_horizon` rapporteert de PERSISTENTIE-voorspeller gescoord over de echte definitieve waarden — een echte gemeten fout, maar een gemodelleerde voorspeller, en niet het residu van de IERS Bulletin A-voorspelling.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = een beoordeling van een vaartuig vereist [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = het fragment is { $excerpt } bytes; de limiet is { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = het fragment bevat meer dan { $MAX_EXCERPT_EPOCHS } epochs; kort het in

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = het fragment eindigt binnen het kalibratievenster van { $calibration_s } s ({ $epochs } epochs): er is niets gescoord

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = geen als UTC gelabelde epoch in het UBX-log

engine-e-receiver-trust-calibration-no-scenario-json-under = geen scenario.json onder { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: achtergehouden schone Pfa <= { $B1_MAX_PFA } (gekalibreerd: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } moet eindig en > 0 zijn (ontvangen: { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel moet eindig en >= 0 zijn (ontvangen: { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used moet minstens 1 zijn

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg moet in [0, 90] liggen (ontvangen: { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg moet in (0, 360] liggen (ontvangen: { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points moet in [0, 100] liggen (ontvangen: { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio moet eindig en > 1 zijn (ontvangen: { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor moet in (0, 100] liggen (ontvangen: { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) ligt onder de degraded_min van de score ({ $degraded_min }): de geometrie alleen kan de onbetrouwbare band bereiken

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites = geometrie { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satellieten{ $v6 }

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: de aftrek voor geometrie wordt als inconsistentie geclassificeerd

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: gerapporteerd, niet gescoord (de geometrie is niet slecht)

engine-receiver-trust-geometry-not-scored-the-score-deducts = niet gescoord (de score trekt alleen af boven HDOP { $hdop_max }, PDOP { $pdop_max } of onder { $min_used } satellieten)

engine-receiver-trust-geometry-derived-from-logged-satellites = afgeleid uit { $n } gelogde satellieten

engine-receiver-trust-geometry-as-the-receiver-reports-it = zoals de ontvanger het rapporteert, { $n } satellieten gebruikt

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = de opgegeven HDOP { $fmt_dop } wijkt voorbij de tolerantie af van de HDOP { $fmt_dop2 } afgeleid uit de opgegeven hemel

engine-receiver-trust-geometry-satellites-in-view-but-not = satellieten in zicht maar niet gevolgd ({ $g } van { $in_view } op of boven { $low_elev_deg } deg): signaalomgeving, niet geometrie

engine-receiver-trust-geometry-satellites-fewer-than = { $n } satellieten, minder dan { $min_used }

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } boven { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } boven { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satellieten achter de opgegeven skyline

engine-receiver-trust-geometry-every-satellite-in-one-half = elke satelliet in een helft van de hemel (hiaat { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = gedegradeerd door geometrie: { $parts } ({ $from }); geen inconsistentie

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = het log bevat geen epochs: niets erin was leesbaar als { $name } ({ $skipped_records } records overgeslagen als corrupt of niet te parsen); controleer de formaatinstelling

engine-receiver-trust-ingest-gps-week-tow = GPS-week { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS-week { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (datum niet in het log)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } moet eindig en >= 0 zijn (ontvangen: { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s moet boven 0 liggen

engine-e-receiver-trust-live-invalid-session = ongeldige sessie: { $e }

engine-receiver-trust-live-no-score-could-be-produced = er kon geen score worden bepaald: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = er was geen GNSS-SDR synchro- of pvt-record leesbaar ({ $skipped } regels overgeslagen); zie integrations/gnss-sdr/README.md voor het regelformaat

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = het IMU-bestand is leeg

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: geen kolom `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: geen kolom `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = het IMU-bestand bevat geen leesbare sample

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis moet 0, 1 of 2 zijn (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean moet eindig zijn

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at = het log heeft { $n } samples; voor een Allan-fit zijn er minstens { $MIN_SAMPLES } nodig

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = de tijd van het log loopt niet op

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = het sample-interval is niet uniform ({ $uneven } van { $n } intervallen wijken meer dan 25 % af): resample het log eerst

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = het log is te kort om een Allan-curve te vormen

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = de beginhelling van de curve { $name } is { $v }, niet ongeveer -0.5: witte ruis domineert niet (staat de sensor stil?), dus de ruiscoëfficiënt is onbetrouwbaar

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = de curve { $name } is te kort om de helling te controleren

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

engine-receiver-trust-machines-novatel-gps-week-tow = GPS-week { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = er was geen BESTPOS-, RANGE- of RXSTATUS-log leesbaar ({ $skipped } records overgeslagen)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = er is geen geldig RTCM 3-frame gevonden ({ $skipped } kandidaten faalden op de CRC)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } moet eindig en > 0 zijn (ontvangen: { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard moet in (0, 1) liggen (ontvangen: { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac moet in [0, 1] liggen (ontvangen: { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } moet in (0, 1) liggen (ontvangen: { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats moet minstens 3 zijn

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s moet minstens 2 s zijn

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = monitorconfiguratie: onbekend profiel "{ $other }"; bekend: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = monitorconfiguratie: { $name } moet eindig en > 0 zijn (ontvangen: { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = monitorconfiguratie: jam_ind_threshold moet eindig zijn

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = monitorconfiguratie: mask_deg moet in [-90, 90) liggen (ontvangen: { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = monitorconfiguratie: raim_pfa moet in (0, 1) liggen (ontvangen: { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = monitorconfiguratie: cn0_min_sats moet minstens 1 zijn

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = monitorconfiguratie: sats_lost moet minstens 1 zijn

engine-receiver-trust-monitors-the-receiver-own-set-against = de eigen set van de ontvanger ({ $self_report_source }) afgezet tegen de monitors van Kshana; geen van beide is de referentie, overeenstemming is geen toetsing

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = de tijdlijn van de ontvanger heeft een niet-eindige epochtijd

engine-e-receiver-trust-monitors-the-log-is-shorter-than = het log is korter dan het kalibratievenster: { $calibration_epochs } epoch(s) vóór { $cal_s } s (het log beslaat { $span } s); er zijn er minstens 3 nodig om de basislijn te vormen

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } moet in ({ $lo }, { $hi }] liggen (ontvangen: { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } geldt alleen voor kind = "vessel" (kind is "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = kan { $path } niet lezen: de WebAssembly-build heeft geen bestandssysteem; geef het bestand inline op als `text` of `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` is geen geldige standaard-base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: geef een van `path`, `text` of `base64` op

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: geef slechts een van `path`, `text` of `base64` op

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } moet een positief getal zijn, ontvangen: { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = gebeurtenis { $label }: onset_s moet een niet-negatief getal zijn

engine-e-receiver-trust-scenario-event-end-must-be-after = gebeurtenis { $label }: end_s moet na onset_s liggen

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg en time_offset_s moeten eindig zijn

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = de hele tijd vertrouwd: geen monitor sloeg alarm in { $after_cal } epochs na de kalibratie

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = eerste alarm op { $t } s; niet vertrouwd gedurende { $untrusted_epochs } en gedegradeerd gedurende { $degraded_epochs } van { $after_cal } epochs na de kalibratie

engine-receiver-trust-scenario-of-stated-events-detected-within = ; { $events_detected } van { $events_evaluable } opgegeven gebeurtenissen gedetecteerd binnen { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = ; { $predictions_agreeing } van { $predictions_evaluable } C/N0-voorspellingen binnen { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = ; vertrouwensscore laagste { $min }, laatste { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = scenario { $r } | receiver-trust | log { $format_name }, { $epochs } epochs over { $duration_s } s | monitors { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = dit is een scenario van het type { $k }, geen receiver-trust-scenario

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } moet eindig zijn (ontvangen: { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: vereist 0 < degraded_min < nominal_min <= 100 (ontvangen: { $degraded_min } en { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s moet eindig en >= 0 zijn (ontvangen: { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: vereist 0 <= onset_ratio < full_ratio (ontvangen: { $onset_ratio } en { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: het gewicht van { $m } moet in [0, 100] liggen (ontvangen: { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s moet eindig en positief zijn

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg moet in (0, 90) liggen

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 moet eindig en positief zijn

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m en rho0_kg_m3 moeten eindig en positief zijn

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m moet in [10 km, 1000 km] liggen

engine-reentry-reentry-allen-eggers-peak-at = terugkeer (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> piek { $v3 } g op { $v4 } km, { $velocity_at_peak_deceleration } m/s; verhitting piekt bij { $velocity_at_peak_heating } m/s; puntmassa (zwaartekracht, kromming, US76) piek { $peak_deceleration_g } g (MODELLED ballistisch, geen aerothermisch)

## src/registry.rs

engine-e-registry-unknown-scenario-id = onbekende scenario-id: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = de TRL-band ({ $lo },{ $hi }) is niet goed gevormd (vereist 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = een gemodelleerde bewering (alleen simulatie) kan niet representatief zijn boven TRL { $MODELLED_TRL_CEILING } (band hi={ $hi }); een hogere TRL is een leemte, geen simulatieresultaat

engine-representativeness-representativeness-representative-for-trl = Representativiteit [{ $status }] — { $claim } (representatief voor TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = gedeclareerd({ $arch }) x gemiddelde bronkwaliteit

engine-resilience-score-weakest-rpcf-sub-score-bounded = zwakste RPCF-subscore = { $min_sub }; bounded-degradation = { $bounded } (begrenst op niveau 2 indien onbegrensd)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = niet-ondersteunde navigatierecord-header { $head }: een regel die met '>' begint is een RINEX 4-recordheader, geen RINEX 3-navigatierecord

engine-e-rinex-bad-prn-in = ongeldige PRN in { $head }

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4-navigatie: een '>'-recordheader verwacht, gevonden { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4-record { $head } heeft { $body } regels, een efemeride van { $msg } vereist er 8

engine-e-rinex-rinex-record-is-followed-by = RINEX 4-record { $head } wordt gevolgd door { $body }, niet door { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = ongeldige { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = het RINEX-observatiebestand heeft geen END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = het RINEX-observatiebestand bevatte geen epochrecords

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s moet eindig en > 0 zijn (ontvangen: { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s moet eindig en > 0 zijn (ontvangen: { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) mag time.duration_s ({ $duration_s }) niet overschrijden

engine-e-scenario-time-grid-too-large-steps = tijdraster te groot: { $n } stappen overschrijdt MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); gebruik een grovere stap of kortere duur

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = de samplefrequentie is commensurabel met de codefrequentie ({ $samples_per_chip } samples/chip, { $offset_from_integer_samples } samples van een geheel getal): de zero-order-hold-codereplica kan een codefaseverandering onder { $dead_band_chips } chips niet onderscheiden, dus de Early/Late-discriminator is een trap met een dode band van een sample in plaats van een driehoek en de DLL stabiliseert op de verkeerde vertraging. Verschuif de samplefrequentie weg van het gehele veelvoud (5 MHz is 4.8876 samples/chip; 25 MHz is 24.4379) of oversample ver genoeg zodat de dode band onder de codefasenauwkeurigheid ligt die u nodig hebt.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = SGP4-foutcode { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = niet-ondersteund SigMF core:datatype { $other }: deze lezer verwerkt de complexe typen cf32_le, ci16_le en ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: alleen opnamen met een kanaal worden gelezen

engine-e-sigmf-cannot-serialise-sigmf-metadata = kan SigMF-metadata niet serialiseren: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = ongeldige SigMF-extensienaamruimte { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } annotatie-extensietabellen voor { $annotations2 } annotaties

engine-e-sigmf-extension-key-is-not-in = extensiesleutel { $k } staat niet in naamruimte { $ns }

engine-e-sigmf-extension-key-is-already-present = extensiesleutel { $k } is al aanwezig

engine-e-sigmf-global-is-not-an-object = global is geen object

engine-e-sigmf-annotations-is-not-an-array = annotations is geen array

engine-e-sigmf-annotation-is-not-an-object = annotation is geen object

engine-e-sigmf-invalid-sigmf-metadata-json = ongeldige SigMF-metadata-JSON: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = de SigMF-opname vermeldt geen positieve core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = de SigMF-capture begint bij sample { $start }, voorbij de { $data } samples in de data

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } moet in [0, 90) graden liggen, ontvangen: { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } moet een eindig getal zijn, ontvangen: { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: een canyon vereist width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m moet positief zijn, ontvangen: { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: canyonhoogten en antenna_m moeten niet-negatief zijn

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m moet positief zijn, ontvangen: { $l }

engine-e-skyline-skyline-table-is-empty = skyline: tabel is leeg

engine-e-skyline-skyline-table-has-rows-over = skyline: de tabel heeft { $rows } rijen, boven het maximum van { $MAX_TABLE_ROWS } rijen

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: tabelazimut { $az } ligt buiten [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: tabelazimuts moeten strikt oplopen ({ $az } volgt op { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: meer dan { $MAX_SECTORS } sectoren

engine-e-skyline-skyline-the-sector-az-from = skyline: de sector az_from = { $az_from } tot az_to = { $az_to } is leeg (een volle cirkel is een tabel of het masker)

engine-e-skyline-skyline-more-than-terrain-points = skyline: meer dan { $MAX_TABLE_ROWS } terreinpunten

engine-e-skyline-skyline-terrain-distance-must-be = skyline: terrein-distance_m moet positief zijn, ontvangen: { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance }; met velden overschreven of toegevoegd door { $user }

engine-skyline-stated-input = Opgegeven invoer: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = onbekende skyline-voorinstelling "{ $name }"; bekende voorinstellingen: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = een datasheet vereist minstens twee Allan-deviatiepunten

engine-e-slot-timing-datasheet-point-must-have-positive = datasheetpunt ({ $t }, { $s }) moet een positieve middelingstijd en een positieve Allan-deviatie hebben

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s moet een positief aantal seconden zijn

engine-e-slot-timing-phase-record-needs-at-least = een foserecord vereist minstens 32 samples om een ruismodel te fitten; ontvangen: { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = het foserecord bevat een niet-eindige sample

engine-e-slot-timing-the-phase-record-yields-fewer = het foserecord levert minder dan drie Allan-deviatiepunten op

engine-e-slot-timing-must-be-finite-and-non = { $name } moet eindig en niet-negatief zijn; ontvangen: { $v }

engine-e-slot-timing-the-slot-guard-must-be = de slotguard moet een positieve tijd zijn

engine-e-slot-timing-sigma-must-be-positive = k_sigma moet positief zijn

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset moet eindig zijn

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k moet eindig zijn

engine-e-slot-timing-give-exactly-one-of-oscillator = geef precies een van oscillator.class, oscillator.preset, oscillator.datasheet of oscillator.record op

engine-e-slot-timing-unknown-oscillator-class-csac-uso = onbekende oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = onbekende oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = standaard voor klasse { $c }: sigma_y(1 s) uit { $c2 }; roodruisvloer gesynthetiseerd twee en vier decaden eronder (een aanname, geen meting)

engine-slot-timing-fitted-to-the-allan-deviation = gefit aan de Allan-deviatiemaxima van { $document }, geschaald zodat de curve op of boven elk punt ligt

engine-slot-timing-fitted-to-the-overlapping-allan = gefit aan de overlappende Allan-deviatie van een record van { $n_samples } samples bij { $tau0_s } s, in de IEEE Std 1139-frequentiemodulatiebasis

engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } bron): guard { $c } ns bij k={ $k_sigma } breekt { $fmt_s } na een positiebepaling ({ $fmt_s2 } resterend); positiebepaling minstens elke { $fmt_s3 } ({ $fixes_per_day } per dag); dominante term: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epoch '{ $s }' moet de vorm YYYY-MM-DDTHH:MM:SS hebben

engine-solar-system-epoch-bad = epoch '{ $s }': ongeldige { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb moet eindig zijn

engine-e-solar-system-table-must-be-auto-table1 = table moet auto, table1 of table2 zijn; ontvangen: '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = geen efemeride voor de verbinding van { $name } naar { $name2 } op JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = epoch JD { $jd } TDB ligt buiten 3000 BC tot 3000 AD, het bereik van de Standish-tabellen

engine-e-solar-system-track-points-must-be-to = track_points moet 8 tot 2000 zijn; ontvangen: { $n_track }

engine-e-solar-system-unknown-observer-body = onbekend waarnemerlichaam '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies moet minstens een lichaam noemen

engine-e-solar-system-unknown-body = onbekend lichaam '{ $n }'

engine-e-solar-system-no-position-for-at-jd = geen positie voor { $name } op JD { $jd } TDB (Pluto alleen van 1800 AD tot 2050 AD)

engine-e-solar-system-no-standish-elements-for = geen Standish-elementen voor { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliocentrische toestand gelezen door de eigen lezer van de engine

engine-e-solar-system-unknown-link-body = onbekend verbindingslichaam '{ $from }'

engine-e-solar-system-unknown-link-body-2 = onbekend verbindingslichaam '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = een verbinding vereist twee verschillende lichamen; ontvangen: { $name }

engine-solar-system-solar-system-at-jd-tdb =
    Zonnestelsel op { $input } (JD { $jd_tdb } TDB), { $n_bodies } lichamen, waarnemer { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = lichttijd { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lengte { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }verbinding { $from } -> { $to }: enkele reis { $one_way_light_time_s } s, heen en terug { $two_way_light_time_s } s, Shapiro { $l } us, Zon { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = epoch { $input } · { $standish_table } · posities uit de Standish-elementen

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = epoch vereist 6 tijdvelden, ontvangen: { $tokens }

engine-e-sp3-bad-second = ongeldige seconde: { $tokens }

engine-e-sp3-record-needs-values-missing-column = record vereist 4 waarden, kolom { $v1 } ontbreekt

engine-e-sp3-bad-number = ongeldig getal: { $field }

engine-e-sp3-empty-sp3-input = lege SP3-invoer

engine-e-sp3-first-line-is-not-an = de eerste regel is geen SP3-header: { $first }

engine-e-sp3-unsupported-sp3-version-in = niet-ondersteunde SP3-versie in { $first }

engine-e-sp3-missing-epoch-count-on-header = epochaantal ontbreekt op headerregel 1

engine-e-sp3-record-has-no-satellite-id = record heeft geen satelliet-id: { $line }

engine-e-sp3-position-record-before-any-epoch = positierecord vóór enige epochheader

engine-e-sp3-sp3-file-contained-no-epoch = het SP3-bestand bevatte geen epochrecords

engine-e-sp3-bad-accuracy-exponent-in = ongeldige nauwkeurigheidsexponent { $f } in { $line }

engine-e-sp3-bad-header-accuracy = ongeldige headernauwkeurigheid { $t }

engine-e-sp3-short-line = korte %f-regel { $line }

engine-e-sp3-bad-base-in = ongeldige %f-basis in { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = versie overschrijdt 3 bits

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID overschrijdt 11 bits (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count overschrijdt 14 bits (0..=16383)

engine-e-space-packet-data-field-must-be-at = het datafield moet minstens een octet zijn

engine-e-space-packet-data-field-exceeds-65536-octets = het datafield overschrijdt 65536 octetten

engine-e-space-packet-packet-shorter-than-the-octet = pakket korter dan de header van 6 octetten: { $bytes } bytes

engine-e-space-packet-declared-data-length-header-octets = opgegeven datalengte { $data_len } (+6 header) = { $total } octetten, maar de buffer is { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC-grove octetten { $coarse_octets } buiten 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = CUC-fijne octetten { $fine_octets } buiten 0..=3 (het uitgebreide P-field wordt niet ondersteund)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-field { $p }: uitgebreid P-field wordt niet ondersteund

engine-e-space-packet-field-time-code-id-is = P-field { $p }: tijdcode-id { $id } is geen CUC

engine-e-space-packet-field-is-not-cds-field = P-field { $p } is geen CDS-P-field

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-field { $p }: gereserveerde sub-ms-code 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC-grof { $coarse } past niet in { $c } octetten

engine-e-space-packet-cuc-fine-does-not-fit = CUC-fijn { $fine } past niet in { $n } octetten

engine-e-space-packet-cds-days-do-not-fit = CDS-dagen { $days } passen niet in { $f } octetten

engine-e-space-packet-cds-ms-of-day-above = CDS ms van de dag { $ms_of_day } boven 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS-submilliseconde { $submillis } boven { $max_sub }

engine-e-space-packet-time-code-format-and-value = tijdcodeformaat en waarde horen bij verschillende codes

engine-e-space-packet-time-code-no-field-octet = tijdcode: geen P-field-octet

engine-e-space-packet-time-code-needs-octets-present = tijdcode vereist { $end } octetten, { $bytes } aanwezig

engine-e-space-packet-time-code-format-differs-from = het tijdcodeformaat wijkt af van het impliciete P-field

engine-e-space-packet-the-format-has-time-code = het formaat heeft een tijdcodeveld; er is er geen opgegeven

engine-e-space-packet-the-format-has-no-time = het formaat heeft geen tijdcodeveld

engine-e-space-packet-ancillary-data-is-octets-the = hulpdata is { $ancillary } octetten; het formaat zegt { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = een secundaire header moet minstens een octet bevatten

engine-e-space-packet-secondary-header-needs-octets-present = secundaire header vereist { $end } octetten, { $bytes } aanwezig

engine-e-space-packet-the-format-has-secondary-header = het formaat heeft een secundaire header; er is er geen opgegeven

engine-e-space-packet-the-format-has-no-secondary = het formaat heeft geen secundaire header

engine-e-space-packet-secondary-header-flag-disagrees-with = de vlag voor de secundaire header { $v1 } komt niet overeen met het formaat

engine-e-space-packet-data-field-shorter-than-the = het datafield is korter dan de PEC

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } komt niet overeen met de CRC { $crc16_ccitt_false } van het pakket

engine-e-space-packet-nothing-to-segment-empty-user = niets te segmenteren: lege gebruikersdata

engine-e-space-packet-max-user-octets-must-be = max_user_octets moet minstens 1 zijn

engine-e-space-packet-first-count-exceeds-14-bits = first_count overschrijdt 14 bits (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } waar { $a } werd verwacht

engine-space-packet-sequence-count-repeated = sequence count { $sequence_count } herhaald

engine-space-packet-sequence-count-gap-after-packet = sequence count-hiaat: { $sequence_count } na { $last } ({ $v2 } pakket(ten) ontbreekt/ontbreken)

engine-space-packet-sequence-count-out-of-order = sequence count niet in volgorde: { $sequence_count } na { $last }

engine-space-packet-packet-with-no-unit-open = { $f }-pakket zonder open eenheid

engine-space-packet-packet-while-unit-is-open = { $f }-pakket terwijl een eenheid open is

engine-e-space-packet-packet = pakket { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = de reeks eindigt met een nog open eenheid (geen laatste pakket)

engine-e-space-packet-apid-must-be-in-2047 = apid moet in 0..=2047 liggen

engine-e-space-packet-packet-count-must-be = packet_count moet >= 1 zijn

engine-e-space-packet-data-len-must-be-in = data_len moet in 1..=65536 liggen

engine-e-space-packet-internal-error-encode-decode-round = interne fout: encode/decode-roundtrip wijkt af

engine-space-packet-space-packet-framed-ccsds-133 = space-packet: { $packet_count } CCSDS-133.0 { $v2 } pakket(ten) ingekaderd, APID { $apid }, { $total_bytes } octetten in totaal, roundtrip exact ({ $round_trip_ok })

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 moet eindig en positief zijn

engine-e-space-weather-f107a-must-be-finite-and = f107a moet eindig en positief zijn

engine-e-space-weather-kp-must-be-in = kp moet in [0, 9] liggen

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km mag niet leeg zijn

engine-e-space-weather-altitude-km-must-be-finite = hoogte { $h } km moet eindig en positief zijn

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; dichtheid x{ $density_activity_factor } op { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: een jammer van het type { $what } vereist een positieve bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: een chirp-jammer vereist een positieve sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to noemt een onbekende band { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: geef received_power_dbw op, of eirp_dbw met een positieve range_m (niet beide)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s moet later zijn dan on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: de samplefrequentie moet positief zijn

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } moet een macht van twee zijn, minstens 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } samples is minder dan een segment van { $nfft } punten

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } moet een macht van twee zijn, minstens 16

engine-e-spectrum-cannot-read-recording-meta-path = kan de opname-meta_path { $meta_path } niet lezen: { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = kan de opnamegegevens { $data_path } niet lezen: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz moet positief zijn

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: modulatie { $m } is niet te kiezen (alleen galileo-e1 accepteert "mboc" of "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: signaal { $sig } staat niet in de signaalbibliotheek met voorinstellingen ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: een signaal uit een voorinstelling heeft zijn eigen modulatie; laat `modulation` weg

engine-e-spectrum-signal-publishes-no-received-power = { $name }: signaal { $sig } publiceert geen ontvangen vermogen; geef signal_power_dbw op

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: een eigen band heeft `modulation` nodig, bijvoorbeeld "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: een eigen band heeft signal_power_dbw nodig

engine-e-spectrum-give-either-signal-or-centre = { $name }: geef `signal` of `centre_mhz` op, niet beide

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: geef rx_bandwidth_mhz op (er kon geen hoofdlob worden gevonden)

engine-e-spectrum-duration-must-be-at-least = duration_s moet minstens één step_s zijn

engine-e-spectrum-time-rows-is-more-than = { $rows } tijdrijen is meer dan de toegestane 5000

engine-e-spectrum-at-most-extra-panels = hooguit 8 extra panelen

engine-e-spectrum-panel-need-max-mhz-min = paneel { $name }: f_max_mhz > f_min_mhz en 2 ≤ n_freq ≤ 4096 zijn vereist

engine-e-spectrum-grid-need-max-mhz-min = raster: f_max_mhz > f_min_mhz en 2 ≤ n_freq ≤ 4096 zijn vereist

engine-spectrum-scenario-spectrum-bands-jammers-noise = scenariospectrum | { $bands } banden | { $jammers } jammers | ruisvloer { $n0_db } dBW/Hz | slechtste band { $name } min C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = scenariospectrum | geen banden | ruisvloer { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples moet tussen 10 en 20 liggen

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: gebruik cf32_le of ci16_le

engine-spectrum-frequency-across-time-down-colour = frequentie horizontaal, tijd verticaal, kleur = spectrale vermogensdichtheid (dBW/Hz); ruisvloer { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = elk paneel een eigen frequentiebereik, één tijdlijn verticaal, één kleurschaal (dBW/Hz); ruisvloer { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = frame { $other } heeft geen ondersteunde NAIF-code

engine-e-spk-writer-segment-name-longer-than-40 = segmentnaam langer dan 40 tekens: { $name }

engine-e-spk-writer-segment-name-has-non-printing = segmentnaam bevat niet-afdrukbare tekens: { $name }

engine-e-spk-writer-bad-target-for-centre = ongeldig doel { $target } voor centrum { $centre }

engine-e-spk-writer-degree-outside-27 = graad { $degree } buiten 1..=27

engine-e-spk-writer-type-13-degree-is-not = graad { $degree } van type 13 is niet oneven

engine-e-spk-writer-states-for-epochs = { $states } toestanden voor { $n } epochs

engine-e-spk-writer-states-degree-needs = { $n } toestanden; graad { $degree } heeft er { $value } nodig

engine-e-spk-writer-descriptor-start-is-not-before = het begin van de descriptor ligt niet voor het einde

engine-e-spk-writer-epochs-are-not-strictly-increasing = de epochs nemen niet strikt toe

engine-e-spk-writer-the-epochs-do-not-cover = de epochs beslaan het interval van de descriptor niet

engine-e-spk-writer-type-or-13-segment-carries = een segment van type 9 of 13 bevat toestanden, geen records

engine-e-spk-writer-type-segment-needs-at-least = een segment van type 3 heeft minstens één record nodig

engine-e-spk-writer-type-degree-outside-27 = graad { $degree } van type 3 buiten 0..=27

engine-e-spk-writer-type-interval-length-is-not = intervallengte { $intlen } van type 3 is niet positief

engine-e-spk-writer-type-record-has-coefficients-expected = record { $i } van type 3 heeft { $value } coëfficiënten, verwacht { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = het begin van de descriptor ligt na het einde

engine-e-spk-writer-descriptor-starts-before-the-first = de descriptor begint voor het eerste record

engine-e-spk-writer-descriptor-ends-after-the-last = de descriptor eindigt na het laatste record

engine-e-spk-writer-type-segment-carries-records-not = een segment van type 3 bevat records, geen epochs of toestanden

engine-e-spk-writer-type-21-segment-needs-at = een segment van type 21 heeft minstens één differentieregel nodig

engine-e-spk-writer-difference-line-size-is-not = grootte { $dlsize } van de differentieregel is niet 4 MAXDIM + 11 met MAXDIM in 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = differentieregels van verschillende grootte

engine-e-spk-writer-epochs-for-difference-lines = { $epochs } epochs voor { $n } differentieregels

engine-e-spk-writer-difference-line-epochs-are-not = de epochs van de differentieregels nemen niet strikt toe

engine-e-spk-writer-the-last-difference-line-ends = de laatste differentieregel eindigt voor de descriptor

engine-e-spk-writer-zero-step-size-in-difference = stapgrootte nul { $j } in differentieregel { $i }

engine-e-spk-writer-type-21-segment-carries-difference = een segment van type 21 bevat differentieregels, geen toestanden

engine-e-spk-writer-an-spk-needs-at-least = een SPK heeft minstens één segment nodig

engine-e-spk-writer-segment = segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = de commentaarregel bevat niet-afdrukbare tekens: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = commentaar heeft { $nchars } tekens nodig; { $v1 } zijn gereserveerd (verhoog ncomch)

engine-e-spk-writer-difference-line-orders-out-of = ordes { $kqmax1 } { $kq } van de differentieregel buiten bereik

engine-e-spk-writer-zero-step-size-at-index = stapgrootte nul bij index { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } buiten het segment [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = segment { $name } van type 3 is te kort

engine-e-spk-writer-type-segment-words-for-rsize = segment { $name } van type 3: { $nw } woorden voor N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = segment { $name } van type 21 is te kort

engine-e-spk-writer-type-21-segment-words-for = segment { $name } van type 21: { $nw } woorden voor N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segment { $name } is te kort

engine-e-spk-writer-segment-words-for = segment { $name }: { $nw } woorden voor N = { $n }

engine-e-spk-writer-segment-is-in-frame = segment { $name } staat in frame { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = de SPK-centrumketen eindigt niet

engine-e-spk-writer-no-spk-chain-connects-and = geen SPK-keten verbindt { $target } en { $observer } op ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = epoch { $s } is niet YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = tijdsysteem { $other } wordt niet ondersteund (UTC of TDB)

engine-e-spk-writer-centre-has-no-supported-naif = centrum { $other } heeft geen ondersteunde NAIF-id

engine-e-spk-writer-oem-segment-has-no-data = OEM-segment { $name } heeft geen dataregels

engine-e-spk-writer-oem-segment-no = OEM-segment { $idx }: geen { $k }

engine-e-spk-writer-no-export-settings-for-oem = geen exportinstellingen voor OEM-segment { $idx }

engine-e-spk-writer-oem-data-line-has-fields = de OEM-dataregel heeft { $f } velden: { $line }

engine-e-spk-writer-oem-value = OEM-waarde { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } OEM-segmenten voor { $exports } exportinstellingen

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOFING GEDETECTEERD (gefuseerd) — lagen: { $fired }

engine-spoof-detect-single-layer-indication-below-the = indicatie van één laag ({ $fired }) onder de gefuseerde drempel — bevestiging nodig

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg moet positief zijn, kreeg { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = paneel { $i }: oppervlak moet >= 0 zijn

engine-e-srp-boxwing-panel-outside = paneel { $i }: { $name } = { $c } buiten [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = paneel { $i }: absorption + specular + diffuse = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = paneel { $i }: nulnormaal/nulas

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = de normaalmatrix van ECOM2 is singulier of slecht geconditioneerd

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 min

engine-ssv-check-mod4-min = { $key } MOD4 min

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = heo-voorinstelling

engine-e-ssv-check-lunar-preset = lunar-voorinstelling

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = een formatie heeft minstens één deputy nodig

engine-e-ssv-formation-duration-min-and-step-must = duration_min en step_s moeten positief zijn

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = geen signalen voor de gekozen constellaties en banden

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = onbekende antenne `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = het patroon-CSV is leeg

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` is geen getal in het patroon-CSV

engine-e-ssv-scenario-pattern-csv-row-has-columns = patroon-CSV-rij `{ $l }` heeft { $f } kolommen, verwacht { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" heeft precies één van pattern_csv en pattern_text nodig

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` is niet booklet, parametric of table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: geef cn0_min_dbhz of weak_signal op, niet beide

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = de draaggolflus kan de opgegeven Doppler-snelheid bij geen enkele C/N0 volhouden

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` is niet acquisition, tracking of both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz moet eindig zijn

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: geef precies één van preset en orbit op

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` is niet leo, meo, geo, heo of lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: geef precies één van duration_min en duration_periods op

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } moet positief zijn

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg heeft 1 tot 8 eindige offsets nodig

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd mag niet negatief zijn

engine-e-ssv-scenario-give-exactly-one-of-shell = geef precies één van [shell], [trajectory] en [navigation] op

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] heeft een [navigation]-tabel voor de chief nodig

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include en constellations.bands mogen niet leeg zijn

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km moet boven 100 liggen

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels boven 5 wordt niet ondersteund

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna moet hemisphere of omni zijn

engine-e-ssv-scenario-the-shell-sweep-supports-the = de shell-sweep ondersteunt alleen het booklet-zendpatroon (een gevormd patroon heeft de trajectory-sweep nodig)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] geldt voor een [trajectory], niet voor een [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: geef precies één van preset en orbit op

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` is niet leo, meo, geo, heo of lunar-transfer

engine-e-ssv-scenario-unknown-preset = onbekende voorinstelling

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv-shell { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv-navigatie: positie-RMS { $p } totaal, { $p2 } binnen de GNSS-banen, { $p3 } erboven; langste hiaat { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = deputy bij { $offset_deg } deg ({ $baseline_km } km): relatieve RMS { $rel_rms_filter_m } m gefilterd tegenover { $rel_rms_from_absolute_m } m uit absolute positiebepalingen

engine-ssv-scenario-combined-max-outage-min = { $band } gecombineerd 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (max. uitval { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv-traject { $perigee_alt_km } tot { $apogee_alt_km } km hoogte: { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min en step_min moeten positief zijn

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } moet een positief getal zijn, kreeg { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = geen standaardenpakket met de naam `{ $id }`; de pakketten zijn: { $ids }

engine-e-standards-pack-pack-manifest = pakketmanifest: { $e }

engine-e-standards-pack-test-duplicate-id = test { $id }: dubbele id

engine-e-standards-pack-test-scenario-is-not-in = test { $id }: scenario `{ $s }` zit niet in het pakket

engine-e-standards-pack-test-scored-test-needs-bar = test { $id }: een gescoorde test heeft een drempel nodig

engine-e-standards-pack-test-test-that-needs-input = test { $id }: een test die invoer nodig heeft, heeft geen drempels

engine-e-standards-pack-test-give-either-scenario-or = test { $id }: geef `scenario` of `needs_input` op, niet beide en niet geen van beide

engine-e-standards-pack-test-supports-unknown-row = test { $id }: levert bewijs voor onbekende rij `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id }: onbekende op `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id }: drempel op { $pointer } heeft precies één van `value` en `against` nodig

engine-e-standards-pack-row-duplicate-id = rij { $id }: dubbele id

engine-e-standards-pack-row-asks-must-be-short = rij { $id }: `asks` moet een korte parafrase zijn

engine-e-standards-pack-row-no-test-supports-it = rij { $id }: geen test levert er bewijs voor

engine-standards-pack-not-scored-needs-input = niet gescoord: invoer nodig ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = de studie heeft geen scenario's om uit te voeren

engine-e-study-cannot-read-scenario = kan scenario { $path } niet lezen: { $e }

engine-e-study-scenario-failed = scenario { $path } is mislukt: { $e }

engine-e-study-scenario-produced-unparseable-json = scenario { $path } leverde onleesbare JSON op: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = ongeldig suitemanifest: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = onbekende bron `{ $o }`: gebruik `adsb` of `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } is { $len } bytes, boven de limiet van { $limit } bytes

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` is geen ISO-8601-UTC-tijd

engine-e-surface-invalid-receiver-trust-session = ongeldige receiver-trust-sessie: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` is geen ISO-8601-UTC-tijd

engine-e-surface-dataset-custom-needs-licence-licence = dataset `custom` heeft licence, licence_url en attribution nodig

engine-e-surface-at-least-one-map-is = minstens één kaart is vereist

engine-e-surface-epoch = epoch: { $e }

engine-e-surface-not-utf = { $suffix }: geen UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = onbekende scenariosoort `{ $k }`; de lijst met soorten noemt elke soort

engine-surface-is-not-bundled-it = `{ $name }` is niet meegeleverd: het { $why }

engine-surface-no-bundled-scenario-named-the = geen meegeleverd scenario met de naam `{ $name }`; de voorbeeldenlijst noemt de { $v1 } die er zijn

engine-e-surface-invalid-toml = ongeldige TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = onbekend exportformaat `{ $format }`; verwacht een van czml, kml, geojson, stk of sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps geeft { $opts } frames en hooguit { $MAX_ANIMATION_FRAMES } worden teruggegeven; verlaag fps of duration_s, of schrijf een langere reeks met de opdrachtregel

engine-e-surface-scenario-run-failed = scenario-uitvoering mislukt: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log noemt een bestand `path`; geef het log als `text` of `base64` op (dit oppervlak leest geen bestanden)

engine-e-surface-max-sp-errors-must-be = max_sp_errors mag hooguit 20 zijn

engine-e-surface-frames-must-be-to = frames moet 1 tot { $MAX_AFS_FRAMES } zijn

engine-e-surface-toi0-must-be-to-99 = toi0 moet 0 tot 99 zijn

engine-e-surface-runs-given-at-most-per = { $runs } runs opgegeven; hooguit { $MAX_COMPLIANCE_RUNS } per rapport

engine-e-surface-the-runs-total-bytes-the = de runs beslaan samen { $total } bytes; de limiet voor één rapport is { $max_bytes }

engine-e-surface-result-files-given-at-most = { $results } resultaatbestanden opgegeven, hooguit 256

engine-e-surface-result-is-not-json = resultaat { $v1 } is geen JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = onbekend formaat `{ $o }`: gebruik `prometheus`, `cef`, `leef`, `otlp` of `mqtt`

engine-e-surface-unknown-imu-format-use-csv = onbekend IMU-formaat `{ $o }`: gebruik `csv` of `euroc`

engine-e-surface-unknown-axis-use-or = onbekende as `{ $o }`: gebruik `x`, `y` of `z`

engine-e-surface-id-must-be-to-64 = id moet 1 tot 64 afdrukbare ASCII-tekens zonder spaties zijn

engine-surface-fitted-from-stationary-imu-log = gefit op een stilstaand IMU-log, sha256 { $sha }, as { $axis }, Allan-schatter

engine-e-surface-unknown-input-kind-use-result = onbekende input_kind `{ $o }`: gebruik `result` of `jsonl`

engine-e-surface-the-input-holds-no-trust = de invoer bevat geen vertrouwensepoch

engine-e-surface-the-reply-is-over-the = het antwoord is groter dan de limiet van { $max_bytes } bytes; stuur minder epochs of laat `syslog_all` uit

engine-e-surface-otlp-needs-build-with-the = otlp heeft een build met de feature `otlp` nodig

engine-e-surface-the-pack-and-token-total = het pakket en het token beslaan samen { $total } bytes; de limiet is { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = het tijdstempeltoken is leeg

engine-e-surface-must-be-64-lower-case = { $what } moet uit 64 hexadecimale cijfers in kleine letters bestaan

engine-e-surface-must-be-32-bytes = { $what } moet 32 bytes zijn

engine-surface-verified-against-the-public-key = VERIFIED tegen de openbare sleutel die u hebt opgegeven (vingerafdruk van de ondertekenaar { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: de hashes en de handtekening zijn consistent met sleutel { $fp }, die het pakket zelf noemt. Geef de openbare sleutel van de ondertekenaar op, langs een andere weg van de ondertekenaar verkregen, om vast te stellen wie heeft ondertekend.

engine-e-surface-files-must-be-json-object = files moet een JSON-object van naam naar inhoud zijn

engine-e-surface-pack-has-at-most-64 = een pakket heeft hooguit 64 bestanden

engine-e-surface-file-name-must-be-plain = bestandsnaam `{ $k }` moet een gewone naam zijn

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` is geen geldige standaard-base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = onbekende sweepparameter: { $other }

engine-e-sweep-unknown-sweep-metric = onbekende sweepmetriek: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep heeft minstens één as nodig

engine-e-sweep-sweep-key-is-malformed = sweepsleutel `{ $key }` is misvormd

engine-e-sweep-sweep-key-follows-an-array = sweepsleutel `{ $key }`: `{ $part }` volgt op een array, dus het moet een index zijn

engine-e-sweep-unreachable = onbereikbaar

engine-e-sweep-sweep-key-index-is-past = sweepsleutel `{ $key }`: index { $i } ligt voorbij de { $n } items van de array

engine-e-sweep-sweep-key-parent-is-not = sweepsleutel `{ $key }`: het bovenliggende element van `{ $part }` is geen tabel

engine-e-sweep-sweep-key-no-field = sweepsleutel `{ $key }`: geen veld `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = sweepsleutel `{ $key }`: het bovenliggende element van `{ $last }` is geen tabel

engine-e-sweep-sweep-key-no-field-2 = sweepsleutel `{ $key }`: geen veld `{ $last }`

engine-e-sweep-metric-no-field-in-result = metriek `{ $path }`: geen veld `{ $part }` in het resultaat

engine-e-sweep-metric-value-is-not-number = metriek `{ $path }`: de waarde is geen getal

engine-e-sweep-sweep-node-serialize = serialisatie van sweepknooppunt: { $e }

engine-e-sweep-sweep-node-result-parse = verwerking van sweepknooppuntresultaat: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = sweepas `{ $key }`: eenheid `{ $d }` opgegeven, maar het gesweepte pakket publiceert `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = de sweepwerkthread is gepaniekeerd

engine-e-sweep-generic-sweep-needs-at-least = een generieke sweep heeft minstens één as nodig

engine-e-sweep-generic-sweep-needs-at-least-2 = een generieke sweep heeft minstens één metriek nodig

engine-e-sweep-generic-sweep-base-must-carry = `base` van een generieke sweep moet een eigen `kind` hebben

engine-e-sweep-generic-sweep-cannot-sweep-another = een generieke sweep kan geen andere sweep doorlopen

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = onbekende oscillator { $oscillator }; verwacht een van { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day en temperature_coeff_per_k moeten eindig zijn

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s moet eindig en positief zijn

engine-e-telecom-timing-duration-must-be-finite-and = duration_s moet eindig zijn en minstens twaalf samples lang

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s moet in [0, duration_s) liggen

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns moet eindig en >= 0 zijn

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = temperatuur- en frequentieoffsetinvoer moet eindig zijn (periode > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = de opname zou meer dan 5 000 000 samples bevatten; verhoog sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = een tijdfoutreeks heeft minstens 13 samples nodig, kreeg { $pairs }

engine-e-telecom-timing-every-time-and-time-error = elke time_s en time_error_ns moet eindig zijn

engine-e-telecom-timing-time-must-increase = time_s moet oplopen

engine-e-telecom-timing-the-series-must-be-uniformly = de reeks moet gelijkmatig bemonsterd zijn: stap { $v1 } is { $d } s, de eerste is { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV-regel { $v1 } is niet `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = het masker is gedefinieerd via een laagdoorlaatfilter van 0.1 Hz, dat deze engine alleen toepast bij sampleintervallen van { $MAX_FILTER_DT_S } s of minder; deze opname is elke { $dt_s } s bemonsterd

engine-e-telecom-timing-give-either-holdover-or-series = geef [holdover] of [series] op, niet beide

engine-e-telecom-timing-give-either-series-samples-or = geef series.samples of series.csv_path op, niet beide

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days moet eindig en >= 0 zijn

engine-telecom-timing-ns-budget-exceeded-after = ; budget van { $max_abs_te_ns } ns overschreden na { $t } s

engine-telecom-timing-ns-budget-never-exceeded = ; budget van { $max_abs_te_ns } ns nooit overschreden

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns over { $v2 } s; { $masks }{ $first_budget } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = onbekende --format `{ $f }` (cef of leef)

engine-e-telemetry-cli-unknown-option = onbekende optie `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input en --result sluiten elkaar uit

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: geen adres

engine-telemetry-cli-warning-metrics-is-served-without = waarschuwing: /metrics wordt zonder authenticatie aangeboden op { $addr }; bind aan localhost of plaats het achter uw eigen toegangscontrole

engine-e-telemetry-cli-bind = bind { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = aanbieden van http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp en --syslog-tcp sluiten elkaar uit

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting geldt voor --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: een topicdeel mag niet leeg zijn, geen # of + bevatten en niet met / beginnen

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp heeft een build met `--features otlp` nodig

engine-telemetry-cli-warning-input-line = waarschuwing: invoerregel { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = kan { $p } niet openen: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not = waarschuwing: { $n } MQTT-berichten zijn niet afgeleverd

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = het endpoint moet met http:// beginnen

engine-e-telemetry-otlp-endpoint-has-no-host = het endpoint heeft geen host

engine-e-telemetry-otlp-resolve = omzetten van { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = geen adres voor { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = waarschuwing: otlp-export mislukt: { $e }

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

engine-e-telemetry-sample-not-json = geen JSON: { $e }

engine-e-telemetry-sample-not-json-object = geen JSON-object

engine-e-telemetry-sample-is-not-number = `{ $k }` is geen getal

engine-e-telemetry-sample-is-not-finite = `{ $k }` is niet eindig

engine-e-telemetry-sample-missing = `t_s` ontbreekt

engine-e-telemetry-sample-score-outside-100 = `score` { $s } buiten 0..=100

engine-e-telemetry-sample-missing-state = `state` ontbreekt

engine-e-telemetry-sample-is-not-an-array = `{ $key }` is geen array

engine-e-telemetry-sample-entry-has-no-name = een item van `{ $key }` heeft geen naam

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` ontbreekt of is geen eindig getal

engine-e-telemetry-sample-position-is-not-an-object = `position` is geen object of null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` ontbreekt of is geen tekenreeks

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` is geen eindig getal >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` is geen tekenreeks

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` is geen booleaanse waarde

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` is geen object of null

engine-e-telemetry-sample-result-has-no-epochs = het resultaat heeft geen `epochs`

engine-e-telemetry-sample-bad-epochs = ongeldige `epochs`: { $e }

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

engine-e-telemetry-syslog-host-is-bytes-syslog-host = host is { $host } bytes; een syslog-hostnaam is hooguit 255 bytes

engine-e-telemetry-syslog-host-must-be-printable-ascii = host moet afdrukbaar ASCII zonder spaties zijn

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } tegenover { $w } (niet weer te geven als f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: aanwezig, afwezig verwacht

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: afwezig, aanwezig verwacht

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } moet eindig zijn

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu moet eindig en niet-negatief zijn

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: regel { $v1 }: niet MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: geen AR-records voor { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = onbekend reeksformaat { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } moet eindig zijn

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s moet 16 tot 20000 metingen opleveren

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } offset { $ns } ns (Sagnac { $ns2 } ns, ionosfeer { $ns3 } ns); gecombineerde u { $ns4 } ns (type A { $ns5 } ns bij { $averaging_s } s); { $series } echte reeks (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = niet-ASCII-tekens in TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE afgebroken bij het lezen van { $what } (kolommen { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } is te kort voor een controlesom in kolom 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } heeft geen controlecijfer in kolom 69

engine-e-tle-tle-checksum-mismatch-column-69 = controlesom van TLE { $label } komt niet overeen: kolom 69 zegt { $want }, berekend { $got }

engine-e-tle-not-tle-line = geen TLE-regel 1: { $line1 }

engine-e-tle-not-tle-line-2 = geen TLE-regel 2: { $line2 }

engine-e-tle-invalid-in-tle = ongeldige { $what } in TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = ongeldig epochjaar in TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = ongeldig catalogusnummer in TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = inclinatie buiten bereik [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = excentriciteit buiten bereik [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = niet-positieve gemiddelde beweging: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = ongeldige mantisse van { $what } in TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = ongeldige exponent van { $what } in TLE: { $exp }

engine-tle-satellite-line-only-element-set = satelliet { $satnum }: elementenset met alleen regel 2 verwerkt als analytische Kepler-elementen (twee lichamen) — de weerstand/B* van regel 1 en de seculiere SGP4-termen ontbreken, dus deze baan wijkt weg van de epoch af van een echte SGP4-fit; geef de bijbehorende regel 1 op voor SGP4-nauwkeurigheid

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: het C/N0-profiel heeft een positieve epoch en duur nodig

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: het C/N0-profiel zou meer dan { $MAX_DETECTOR_STEPS } detectorstappen nodig hebben ({ $total } s bij { $epoch_s } s per epoch); verkort ramp_duration_s of verleng predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } moet eindig zijn

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } moet positief zijn (kreeg { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips moet onder 1.9 chips liggen (kreeg { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio moet minstens 1 zijn (kreeg { $pullin_bandwidth_ratio }) — een lus die opnieuw invangt met een SMALLERE bandbreedte dan waarmee hij volgt, zou de hysterese omkeren

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s mag niet negatief zijn

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) mag cn0_high_dbhz ({ $cn0_high_dbhz }) niet overschrijden

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } mag niet leeg zijn

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } heeft { $axis } items; het maximum is { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } bevat een niet-eindige waarde

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: de bevestigingsverblijftijden moeten minstens 1 epoch zijn

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = minstens acht samples zijn nodig

engine-e-twstft-budget-samples-must-increase-in-time = samples moeten in de tijd oplopen

engine-e-twstft-budget-samples-must-be-on-regular = samples moeten op een regelmatig raster liggen

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } rijen: { $validated } extern getoetst, { $modelled } uit een model berekend, { $partner_owned } in handen van een partner.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = Het volledige, machinaal gecontroleerde bewijsregister: **{ $total } rijen — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Een rij mag alleen VALIDATED zijn met een onafhankelijke externe referentie (de invarianttests van de matrix dwingen dit af). Dezelfde gegevens, met aanklikbare koppelingen per rij naar elke test, elke module en elke vastgelegde fixture, staan in het *Valideringsregister* op https://kshana.dev. Zie [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) voor waarom elke gemodelleerde rij niet extern getoetst is.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } mogelijkheden gelabeld als MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json is geen JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json is geen JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] heeft `label` nodig

engine-wasm-runs-needs-result = runs[{ $i }] heeft `result` nodig

engine-wasm-results-json-is-not-json = results_json is geen JSON-array van tekenreeksen: { $e }

engine-wasm-maps-json-must-be-json = maps_json moet een JSON-array van tekenreeksen zijn: { $e }

engine-wasm-plans-json-is-not-json = plans_json is geen JSON-array van tekenreeksen: { $e }

engine-wasm-options-json-is-not-json = options_json is geen JSON: { $e }

engine-wasm-input-is-about-bytes-over = de invoer is ongeveer { $b64 } bytes, boven de limiet van { $v2 } bytes
