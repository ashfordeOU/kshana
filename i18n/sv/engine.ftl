# SPDX-License-Identifier: AGPL-3.0-only
# sv catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = okänt klockloggformat { $other }; förväntade ett av { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = okänd luckpolicy { $other }; förväntade refuse, longest eller linear

engine-e-clock-log-give-either-the-log-text = ange antingen logtexten eller dess sökväg, inte båda

engine-e-clock-log-clock-log-needs-its-text = en klocklogg behöver sin text eller en sökväg

engine-e-clock-log-tau0-must-be-finite-and = tau0_s måste vara ändligt och > 0 (fick { $t })

engine-e-clock-log-units-and-data-apply-to = units och data gäller bara för formatet timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel gäller bara för formatet ticc

engine-e-clock-log-cannot-read-clock-log = kan inte läsa klockloggen { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = en sökväg till klocklogg är inte tillgänglig i WebAssembly-bygget; ange loggen som text

engine-e-clock-log-the-log-has-missing-epoch = loggen i formatet { $format } har { $n_missing } saknade epok(er) i { $n_gaps } lucka(or) på ett rutnät med { $tau0 } s steg; ange gaps = "longest" för att behålla den längsta luckfria sekvensen eller gaps = "linear" för att interpolera

engine-e-clock-log-the-log-yields-usable-sample = loggen i formatet { $format } ger { $x } användbara sampel; minst 3 behövs

engine-e-clock-log-not-rinex-clock-file-no = inte en RINEX-klockfil: ingen END OF HEADER-post

engine-e-clock-log-the-rinex-clock-file-has = RINEX-klockfilen har inga AS- eller AR-poster

engine-e-clock-log-the-rinex-clock-file-holds = RINEX-klockfilen innehåller { $many } klockor; ange en med clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = inga AS- eller AR-poster för klocka { $id }

engine-e-clock-log-the-clock-has-single-epoch = klockan har en enda epok; tau0 kan inte bestämmas

engine-e-clock-log-the-log-has-no-readings = loggen i formatet { $format } har inga avläsningar

engine-e-clock-log-unknown-phase-unit-expected-ms = okänd fasenhet { $other }; förväntade s, ms, us, ns eller ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab-rad { $v1 } har { $v } kolumn(er), den första dataraden har { $first }

engine-e-clock-log-timelab-line-has-columns-one = TimeLab-rad { $v1 } har { $v } kolumner; en (värde) eller två (tid värde) läses

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab-rad { $v1 } är inte numerisk: { $l }

engine-e-clock-log-the-timelab-log-has-no = timelab-loggen har inga avläsningar

engine-e-clock-log-unknown-data-expected-phase-or = okänd data { $other }; förväntade phase eller frequency

engine-e-clock-log-tau0-header-is-not-positive = tau0-huvudet { $v } är inte ett positivt antal sekunder

engine-e-clock-log-frequency-data-is-fractional-frequency = frekvensdata är relativ frekvens; dess enheter kan bara vara 1

engine-e-clock-log-two-column-frequency-logs-are = frekvensloggar med två kolumner läses inte; ange frekvens som en enda kolumn med tau0

engine-e-clock-log-unknown-time-units-expected-or = okänd time_units { $o }; förväntade s eller mjd

engine-e-clock-log-the-timelab-log-time-column = timelab-loggens tidskolumn måste öka

engine-e-clock-log-single-reading-tau0-cannot-be = en enda avläsning; tau0 kan inte bestämmas

engine-e-clock-log-the-timelab-log-has-non = timelab-loggen har { $non_finite } icke-ändliga avläsning(ar)

engine-e-clock-log-the-ticc-log-holds-channels = TICC-loggen innehåller kanalerna { $many }; ange en med channel = "..."

engine-e-clock-log-no-readings-on-channel-found = inga avläsningar på kanal { $channel } (hittade { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC-rader i intervalläge saknar tid; ange tau0_s (händelseperioden)

engine-e-clock-log-the-readings-do-not-increase = avläsningarna för { $channel } ökar inte, så de är inte tidsstämplar (utdata från TICC i Period-läge läses inte; använd Timestamp-läge)

engine-e-clock-log-single-time-stamp-tau0-cannot = en enda tidsstämpel; tau0 kan inte bestämmas

engine-e-clock-log-two-time-stamps-apart-under = två tidsstämplar för { $channel } med { $w } s mellanrum, under hälften av tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = tidsstämplarna i formatet { $format } för { $clock } går bakåt (en omstartad daemon eller ett klocksteg); dela upp loggen och läs varje del

engine-e-clock-log-the-log-has-no-readings-2 = loggen har inga avläsningar av typen { $what }

engine-e-clock-log-the-log-holds-sources-name = loggen innehåller { $many } källor; ange en med { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = inga avläsningar av typen { $what } för { $id } (hittade { $names })

engine-e-clock-log-the-servo-of-never-reached = servot för { $id } nådde aldrig det låsta tillståndet s2

engine-e-clock-log-the-log-has-no-chrony = loggen har inga avläsningar av chrony tracking

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = samplingshastigheten { $fs_hz } Hz är inte ett helt antal sampel per millisekund

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms och noncoherent måste vara positiva

engine-e-acquisition-the-doppler-grid-needs-positive = Doppler-rutnätet behöver ett positivt steg och ett icke-negativt maximum

engine-e-acquisition-pfa-must-lie-in = pfa måste ligga i (0, 1)

engine-e-acquisition-samples-supplied-needed = { $samples } sampel angivna, { $needed } behövs

engine-e-acquisition-empty-doppler-grid = tomt Doppler-rutnät

engine-e-acquisition-the-samples-carry-no-power = samplen saknar effekt

## src/adm.rs

engine-e-adm-unknown-attitude-type = okänd ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = en AEM behöver minst ett segment

engine-e-adm-segment-is-not-version-attitude = segment { $i }: { $t } är inte en attitydtyp i version { $version }

engine-e-adm-segment-values-for = segment { $i }: { $values } värden för { $t }

engine-e-adm-aem-version-has-no-ndm = AEM version 1.0 har ingen NDM/XML-form här; skriv KVN

engine-e-adm-this-attitude-type-has-no = den här attitydtypen har ingen form i version 2.0

engine-e-adm-expected-meta-start-found = förväntade META_START, hittade { $l }

engine-e-adm-meta-start-without-meta-stop = META_START utan META_STOP

engine-e-adm-unexpected-metadata-line = oväntad metadatarad { $other }

engine-e-adm-in-version-aem = { $att } i en AEM version { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = förväntade DATA_START efter META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START utan DATA_STOP

engine-e-adm-empty-data-line = tom datarad

engine-e-adm-values-on-line = { $vals } värden på en rad av typen { $att }: { $b }

engine-e-adm-unexpected-data-line = oväntad datarad { $other }

engine-e-adm-attitude-type-has-no-xml = attitydtypen har ingen XML-form

engine-e-adm-message-without-version-attribute = meddelande utan versionsattribut

engine-e-adm-expected-found = förväntade { $vers_key }, hittade { $other }

engine-e-adm-header-without-creation-date-or = huvud utan CREATION_DATE eller ORIGINATOR

engine-e-adm-missing = { $k } saknas

engine-e-adm-unexpected-keyword = oväntat nyckelord { $k }

engine-e-adm-spin-block-holds-nutation-or = ett spinnblock innehåller nutations- eller rörelsemängdsdata, inte båda

engine-e-adm-unexpected-apm-keyword = oväntat APM-nyckelord { $other }

engine-e-adm-unexpected-apm-line = oväntad APM-rad { $b }

engine-e-adm-without = { $b } utan { $stop }

engine-e-adm-unexpected-line-in = oväntad rad i { $b }: { $other }

engine-e-adm-incomplete-group = ofullständig grupp { $keys }

engine-e-adm-unknown-apm-block-start = okänt APM-block { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM-metadata kräver OBJECT_NAME, OBJECT_ID och TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM utan EPOCH

engine-e-adm-rotation-axis = rotationsaxel { $o }

engine-e-adm-values-for = { $values } värden för { $t }

engine-e-adm-euler-record-without-euler-rot = Euler-post utan EULER_ROT_SEQ

engine-e-adm-rotation-sequence = rotationssekvens { $seq }

engine-e-adm-epoch-has-no = epoken { $s } saknar 'T'

engine-e-adm-epoch-date = epokens datum { $date }

engine-e-adm-epoch-time = epokens tid { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = “{ $s }” (text som dokumentet anger den)

engine-advanced-report-mean-5th-to-95th-percentile = medelvärde { $fmt_num } (5:e till 95:e percentilen { $fmt_num2 } till { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = schema för fältenheter: enhetspost `{ $key }`

engine-advanced-report-field-units-schema-input-entry = schema för fältenheter: indatapost `{ $key }`, matchad på fältnamn

engine-advanced-report-rows-of-non-numeric-column = { $n } rader i en icke-numerisk kolumn

engine-advanced-report-rows-from-to = { $nums } rader, från { $fmt_num } till { $fmt_num2 }

engine-advanced-report-phase-ended-by = fas { $name } (avslutad av { $ended })

engine-advanced-report-result-timeline-phases = resultat `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = överlämning till fas { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = resultat `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = scenarioindata `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = kommentar i scenariofilen, rad { $start }

engine-advanced-report-scenario-file-comment-lines-to = kommentar i scenariofilen, rad { $start } till { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } är MODELLED, inte prövad mot en oberoende extern referens: { $it }.

engine-advanced-report-sweep-of-scale = Svep av { $param } (skala { $str_of })

engine-e-advanced-report-the-result-document-is-not = resultatdokumentet är inte JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = scenariot är inte TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Monte Carlo-fördelning av { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = registrerad vid bygget från miljövariabeln { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = inte registrerad: den här motorn byggdes utan miljövariabeln { $GIT_COMMIT_ENV }; motorns version identifierar utgåvan

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (scenariotypens egna fingeravtryck av scenariot; inte filens kontrollsumma)

engine-advanced-report-input-file = Indatafil { $path }

engine-advanced-report-study-generated = { " " }Studie genererad { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2 rad { $v1 }: förväntade 8 kommaseparerade kolumner, hittade { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2 rad { $v1 }: felaktigt { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2 rad { $v1 }: icke-ändligt värde

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: inga datarader

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: { $rows } rader fyller inte det gitter på { $n_lat } x { $n_lon } som de spänner upp

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: dubblerad nod vid { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = rutnätssteget måste vara ändligt och positivt, fick { $step }

engine-e-altpnt-maps-grid-box-must-have-north = rutnätsområdet måste ha north > south och east > west, fick [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = rutnät med { $n_lat } x { $n_lon } noder är för stort

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: axeln för { $what } behöver minst 2 skilda värden

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: axeln för { $what } är inte regelbunden ({ $w } till { $w2 } mot ett medelsteg på { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = felsigma måste vara ändligt och icke-negativt, fick { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = korrelationslängden måste vara ändlig och positiv, fick { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side måste vara >= 2, fick { $n }

engine-e-altpnt-terrain-srtm-hgt-length = SRTM .hgt-längd { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = ett .hgt-fönster behöver minst 2 x 2 sampel, fick { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = steget måste vara ändligt och positivt, fick { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt-fönsterlängd { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: okänd magnetic_grid-kolumn `{ $other }` (använd "sealevel" eller "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: kan inte läsa magnetic_grid csv_path { $csv_path }: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = okänt animationsformat '{ $other }'; förväntade svg, html, frames eller all

engine-e-animation-no-animation-format-given-expected = inget animationsformat angivet; förväntade svg, html, frames eller all

engine-e-animation-animation-fps-must-be-between = animationens fps måste vara mellan 1 och 60, fick { $fps }

engine-e-animation-animation-duration-must-be-between = animationens längd måste vara mellan 0.5 s och 600 s, fick { $duration_s }

engine-e-animation-animation-width-must-be-between = animationens bredd måste vara mellan 480 och 3840 pixlar, fick { $width }

engine-e-animation-duration-fps-gives-frames-the = duration x fps ger { $n } bildrutor; bildrutesekvensen kräver mellan 2 och { $v1 }

engine-e-animation-result-is-not-json = resultatet är inte JSON: { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = uppdragstid ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (kräver en ffmpeg byggd med librsvg; annars rastrera bildrutorna först)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }{ $omitted } ytterligare serier hittades men ritades inte (spelaren visar högst { $MAX_CHARTS } paneler med { $MAX_TRACES } kurvor vardera); de är listade i manifestet för frames-exporten.

## src/antenna.rs

engine-antenna-altitude-beamwidth-deg-points = höjd { $a_lo }-{ $a_hi } m x strålbredd { $b_lo }-{ $b_hi } deg, { $points } punkter

engine-antenna-limb-capture-is-reached-on = limbfångst UPPNÅS på det här rutnätet ({ $grid }): { $points } av { $points2 } samplade arbetspunkter fångar limben och { $crossings } axelkorsning(ar) hittades; det starkaste samplade limb-J/S är { $limb_js_db } dB vid höjd { $altitude_m } m / strålbredd { $hpbw_deg } deg, mot en fångsttröskel på { $thr } dB.

engine-antenna-limb-capture-is-not-reached = limbfångst uppnås INTE någonstans på det här rutnätet ({ $grid }) - inte noll fångst, men ingen limbfångst: det bästa limb-J/S är { $limb_js_db } dB vid höjd { $altitude_m } m / strålbredd { $hpbw_deg } deg, { $shortfall } dB under fångsttröskeln på { $thr } dB; den arbetspunkten skulle fånga limben vid { $limb_capture_tx_power_dbw } dBW sändareffekt mot de { $p_tx_dbw } dBW som flögs.

engine-e-antenna-azimuths-must-strictly-increase = azimuter måste öka strikt

engine-e-antenna-azimuths-must-span-less-than = azimuter måste spänna över mindre än 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = off-boresight-vinklar måste öka strikt

engine-e-antenna-gain-grid-does-not-match = förstärkningsrutnätet stämmer inte med axlarna

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = förstärkningarna K och P måste vara ändliga och positiva

engine-e-aocs-at-least-three-reaction-wheels = minst tre reaktionshjul krävs

engine-e-aocs-wheel-spin-axis-must-be = hjul { $i }: spinnaxeln måste vara en enhetsvektor

engine-e-aocs-wheel-js-and-max-must = hjul { $i }: js och u_max måste vara ändliga och positiva

engine-e-aocs-the-wheel-spin-axes-do = hjulens spinnaxlar spänner inte upp tre dimensioner

engine-e-aocs-inertia-minus-the-wheels-spin = tröghetsmomentet minus hjulens spinntröghet måste vara positivt definit

engine-e-aocs-inertia-must-be-finite-and = tröghetsmomentet måste vara ändligt och symmetriskt

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis måste vara en ändlig vektor skild från noll

engine-e-aocs-kind-must-be-finite-and-positive = { $n } måste vara ändligt och positivt

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s får vara högst 2e6 steg

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s måste vara en heltalsmultipel av dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 och omega0_rad_s måste vara ändliga

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm måste vara ändligt

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s måste vara ändligt

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s måste vara minst dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs: { $n_w } hjul, { $duration_s } s vridning från { $series_err } deg -> { $settle } | slutligt { $final_err } deg | toppvarvtal hjul { $peak_speed } rpm | { $v7 }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = okänd tjänst '{ $other }' (förväntade navigation|nav eller communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = okänd arbitreringspolicy '{ $other }' (förväntade navigation-priority, communications-priority eller first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = en kontaktplan behöver minst ett kontaktfönster

engine-e-aperture-duty-apertures-must-be = apertures måste vara >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = rapporteringshorisonten måste vara ändlig

engine-e-aperture-duty-contact-has-non-finite-aos = kontakten '{ $name }' har ett icke-ändligt aos_s eller los_s

engine-e-aperture-duty-contact-must-have-los-aos = kontakten '{ $name }' måste ha los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = en kontaktplan behöver minst ett [[contacts]]-fönster

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: { $sessions } session(er) på { $apertures } apertur(er) under { $policy } -> navigeringsandel { $navigation_duty }, kommunikationsandel { $communications_duty }, overksam { $idle_duty }; { $total_outage_s } s av { $total_requested_s } s begärd tid förlorades på grund av konkurrens (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Studie genererad { $html_escape }.

engine-e-api-failed-to-serialise-report-to = kunde inte serialisera rapporten till JSON: { $e }

engine-e-api-invalid-scenario = ogiltigt scenario: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you = okänd scenariotyp { $other } — menade du { $hint }? `kshana kinds` listar alla { $n } inbyggda typer.

engine-api-unknown-scenario-kind-kshana-kinds = okänd scenariotyp { $other }. `kshana kinds` listar alla { $n } inbyggda typer.

engine-api-required-fields = - **Obligatoriska fält:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Valfria fält:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML-tolkningsfel: { $e }

engine-api-could-not-classify-scenario-kind = kunde inte fastställa scenariotyp: { $e }

engine-api-missing-required-field = { $kind_name }: obligatoriska fält saknas — { $options }

engine-api-missing-required-field-2 = { $kind_name }: obligatoriskt fält "{ $entry }" saknas

engine-e-api-invalid-orbit-scenario = ogiltigt omloppsscenario: { $e }

engine-e-api-sp3-export-requires-an-orbit = SP3-export kräver ett omloppsscenario, inte '{ $k }'

engine-e-api-omm-export-requires-an-orbit = OMM-export kräver ett omloppsscenario, inte '{ $k }'

engine-e-api-oem-export-requires-an-orbit = OEM-export kräver ett omloppsscenario, inte '{ $k }'

engine-e-api-invalid-scenario-toml = ogiltig scenario-TOML: { $e }

engine-e-api-could-not-re-serialise-scenario = kunde inte serialisera om scenariot: { $e }

engine-api-scenario-jamming-availability-under-jamming = scenario { $r } | jamming { $v2 } | tillgänglighet under jamming { $availability_under_jamming } (nominell { $availability_nominal }) | min spårning { $min_tracking } | medel-J/S { $v6 }

engine-e-api-the-result-document-already-carries = resultatdokumentet innehåller redan `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = kunde inte serialisera figure_tiers: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = ogiltigt scenario ({ $label }): { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = scenario { $r } | quantum holdover { $holdover_s }s p95 { $pos_p95_m }m | klassisk holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = scenario { $r } | spoof { $scn } mot { $threshold_ns } ns spec (P_fa { $target_pfa }) | quantum-säkerhet { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | klassisk säkerhet { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal = integritet | { $n_sats } satelliter | { $samples_available }/{ $samples_total } epoker tillgängliga ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } integritetshändelser, { $report3 } HMI

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | sydpolen | { $samples_available }/{ $samples_total } epoker tillgängliga ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | sekulär LTC−TT-takt { $secular_rate_us_per_day } µs/day (band { $band_low }–{ $band_high }) | egenpotential { $self_potential_us_per_day } kinetisk { $kinetic_us_per_day } | offset @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | baslinje { $baseline_km } km | fyravstånd { $beacon_range_km } km | fördröjning { $report } µs (takt { $delay_rate_s_per_s } s/s) | närfält { $near_field_correction_us } µs | { $samples } sampel över { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats = lunar-joint-od-clock | { $n_sat } satelliter, { $n_earth } jordstationer | stationens 3D-fel med VLBI { $station_pos_err_m } m mot enbart avstånd { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× skarpare) | satellitposition RMS { $sat_pos_rms_m } m | stationsklockfel { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrar

engine-api-builtins-lunar-frame-realisation-points-translation = lunar-frame-realisation | { $n_points } punkter | translationsfel { $trans_err_norm_m } m, rotationsfel { $rot_err_norm_rad } rad, skalfel { $scale_err_ppb } ppb | rms-residual { $rms_residual_m } m | konvergerad { $converged }

engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } satelliter ({ $geometry_label }) | { $n_grid_points } punkter × { $n_epochs } epoker | täckning { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelliter { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL-tillgänglighet { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemerid { $report } ({ $provenance }) σ_URE som krävs { $fmt } mot Kepler { $fmt2 } mot perturberad { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | { $n_sats } satelliter (illustrativ LCNS-klass, inte knuten till någon organisation) | baslinje { $baseline_km } km | användarfel { $user_error_uncorrected_m } m → { $user_error_corrected_m } m ({ $reduction_factor }× minskning) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } punkter x { $n_epochs } epoker x { $n_trials } försök | tillgänglighet { $v4 } % | täckning { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | korrigerad p{ $percentile } 3D { $f } (okorrigerad { $f2 }) | HPL max { $f3 } | MODELLED; inget påstående om något verkligt system

engine-api-builtins-terrain-horizon-at-the-station = { " " }| terränghorisont ({ $sources }) vid stationen max { $horizon_max_deg } deg, användarpunkter medelmax { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame = lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tillstånd, OEM { $oem_line_count } rader | formatkontroll { $v5 } ({ $present_fields } finns / { $missing_fields } saknas) | OEM round-trip { $v8 } | tidsmeta round-trip { $v9 } | KIF { $kif_bytes } bytes | MODELLED

engine-api-builtins-scenario-optical-sync-rms-ps = scenario { $r } | optisk sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | quantum-kedja { $quantum_chain_sigma_s }s mot klassisk { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | säkerhet Pd { $security_pd } (Pfa { $monitor_pfa }) | anomali Pd { $anomaly_pd } | avvägning quantum vinner { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | avbrott { $outage_s }s | quantum-positionsfel { $quantum_pos_err_m } m mot klassiskt { $classical_pos_err_m } m ({ $improvement_x }x) | holdover quantum { $quantum_holdover_s }s mot klassisk { $classical_holdover_s }s (tröskel { $threshold_m } m) | avvägning quantum vinner { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC quantum { $quantum_auc } mot klassisk { $classical_auc } | minsta detekterbara fel quantum { $quantum_min_detectable } mot klassiskt { $classical_min_detectable } | { $fault_catalog } felklasser | avvägning quantum vinner { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] gäller endast scenariotypen fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = scenario { $r } | quantum PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integritet { $integ } säkerhet { $security_na } | klassisk PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integritet { $integ2 } säkerhet { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = scenario { $r } | fused | quantum PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integritet { $integ } säkerhet { $security_na } | klassisk PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integritet { $integ2 } säkerhet { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = scenario { $r } | hybrid-ukf (17 tillstånd, MODELLED) | sensor { $v2 } (q_va { $effective_q_va }) | klocka q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } i [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } i [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | stött { $aided_pos_rms_m }m -> fri färd { $coast_end_pos_rms_m }m över { $coast_duration_s }s | självkonsistens, inte noggrannhet

engine-api-builtins-scenario-gnss-ins-quantum-outage = scenario { $r } | gnss-ins | quantum avbrotts-RMS fused { $fused_outage_rms_m }m mot fri { $free_outage_rms_m }m (hold { $holdover_s }s, tillg. { $availability }) | klassisk fused { $fused_outage_rms_m2 }m mot fri { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, tillg. { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = scenario { $r } | gnss-sim | medel-iono { $mean_iono_m }m tropo { $mean_tropo_m }m | RAIM-tillgänglighet { $raim_availability } medel-HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m felfrekvens { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = scenario { $r } | spoof-detect | { $n_sats } SV, +{ $power_advantage_db } dB{ $v4 } | { $push } push | fused score { $score } (tröskel { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = svep { $metric } över { $parameter } ({ $first }..{ $last }, { $points } punkter, skala { $scale }) | quantum { $first2 }->{ $last2 } | klassisk { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = scenario { $r } | { $nominal }/{ $series } sampel GNSS-nominella | bästa PDOP { $fnum } pos { $posm } | quantum holdover { $holdover_s }s p95 { $ns1 }ns integritet { $integ } säkerhet { $security_na } | klassisk holdover { $holdover_s2 }s p95 { $ns12 }ns integritet { $integ2 } säkerhet { $security_na }

engine-e-api-builtins-ephemeris = efemerid: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| max el { $el }° topp-Doppler { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat = scenario { $r } | { $source } | { $n_samples } sampel | höjd { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | hastighet { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }

engine-api-builtins-generic-sweep-of-over-nodes = generiskt svep av `{ $kind }` över [{ $keys }] | { $points } noder (form { $shape }) | mått [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | fri tröghetsdrift { $free_inertial_drift_m } m | tyngdkraftsmatchad { $map_matched_error_m } m | matchningssigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| referensgrad { $reference_nmax } anomalins standardavvikelse { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| kartfel-MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% inom { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | fri tröghetsdrift { $free_inertial_drift_m } m | terrängmatchad { $matched_error_m } m ({ $v3 }x minskning) | matchningssigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } färdpunkter | fri tröghets-RMS { $free_inertial_rms_m } m (slutvärde { $free_inertial_final_m } m) | terrängmatchad RMS { $matched_rms_m } m (slutvärde { $matched_final_m } m, { $v6 }x minskning) | medel-ESS { $mean_ess }/{ $cfg } | matchningssigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | fri tröghetsdrift { $free_inertial_drift_m } m | tyngdkraft { $gravity_only_m } m magnetism { $magnetic_only_m } m terräng { $terrain_only_m } m | FUSED { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] kräver runs = 1: en uppmätt logg är en post

engine-api-builtins-scenario-runs-quantum-holdover-p95 = scenario { $r } | { $runs } körningar | quantum holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns säkerhet { $security_na } | klassisk holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns säkerhet { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = scenario { $r } | quantum holdover { $holdover_s }s p95 { $ns1 }ns integritet { $integ } säkerhet { $security_na } | klassisk holdover { $holdover_s2 }s p95 { $ns12 }ns integritet { $integ2 } säkerhet { $security_na }

engine-api-builtins-raim-available-of-epochs-denied = { " " }| RAIM tillgänglig { $n_available } av { $n_epochs } epoker ({ $n_denied } nekade, { $n_alarm } larm; MODELLED)

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = ett referensfall behöver minst en satellit

engine-e-araim-reference-reference-case-needs-at-least-2 = ett referensfall behöver minst en konstellation

engine-e-araim-reference-satellite-names-constellation-but-only = satellit { $i } anger konstellation { $constellation } men bara { $constellations } är deklarerade

engine-e-araim-reference-satellite-has-non-positive-error = satellit { $i } har en icke-positiv felvarians

engine-e-araim-reference-both-integrity-risk-allocations-must = båda integritetsriskallokeringarna måste vara positiva

engine-e-araim-reference-this-reference-implementation-monitors-single = den här referensimplementationen övervakar bara felmoder med en enda händelse, men fallets apriorisannolikheter kräver N_fault,max = { $nfm } (samtidiga delmängder med flera händelser). Avvisar hellre än att underräkna felmoder.

engine-e-araim-reference-the-all-in-view-geometry = geometrin med alla satelliter i sikte är singulär

engine-e-araim-reference-no-fault-mode-is-observable = ingen felmod är observerbar i den här geometrin

engine-e-araim-reference-unknown-reference-vector-known-vectors = okänd referensvektor '{ $vector }'; kända vektorer: { $ids } (eller 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: { $wanted } publicerade WG-C-referensvektor(er); sämsta VPL/HPL-skillnad { $worst_acceptance } m mot referensens egen TOL_PL = { $tol } m över { $acceptance_checked } acceptansvektor(er)

engine-e-araim-reference-sat-needs-one-value-per = P_sat behöver ett värde per satellit och P_const ett per konstellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation = en satellit anger en odeklarerad konstellation

engine-e-araim-reference-every-prior-must-lie-in = varje apriorisannolikhet måste ligga i [0, 1)

engine-e-araim-reference-the-priors-need-subsets-of = apriorisannolikheterna kräver delmängder med { $n_fault_max } samtidiga händelser; den här vägen räknar upp högst { $most }

engine-e-araim-reference-the-all-in-view-solution = lösningen med alla satelliter i sikte valdes inte

engine-e-araim-reference-an-add-v4-case-needs = ett ADD v4.2-fall behöver satelliter och konstellationer

engine-e-araim-reference-nom-and-sat-need-one = b_nom och P_sat behöver ett värde per satellit

engine-e-araim-reference-const-needs-one-value-per = P_const behöver ett värde per konstellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = satellit { $i } anger en odeklarerad konstellation

engine-e-araim-reference-one-constellation-index-per-satellite = ett konstellationsindex per satellit

engine-e-araim-reference-satellite-names-constellation-with-no = satellit { $i } anger konstellation { $c } utan ISM

engine-e-araim-reference-fewer-than-four-satellites-above = färre än fyra satelliter över elevationsmasken

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m måste innehålla minst ett avstånd

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (band { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | fotavtryck { $a2 }% tak, limb { $footprint_limb_captured } | spoof-fångst { $spoof_captured } (lock { $spoof_lock_time_s } s) | mastens räckvidd { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% av 50 bit/s), { $nma_auth_latency_s } s latens

engine-attack-surface-reached-crossing-best-db = uppnådd ({ $crossings } korsning(ar), bäst { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = INTE uppnådd på det här rutnätet (bäst { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB under; kräver { $best_limb_capture_tx_power_dbw } dBW mot { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| fotavtryckssvep { $s }x{ $s2 } (höjd { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), fångst { $v5 }-{ $v6 }% | limb { $limb }

engine-attack-surface-afs-received-dbw = AFS mottagen: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Underskott: { $deficit_db } dB (band { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Fångstfotavtryck: { $a }% av skivan, limb fångad: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Spoof-fångst, indragning: { $spoof_captured } (lock { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Mastens räckvidd: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limb: fångad på rutnät { $na }x{ $nb }, { $crossings } korsning(ar)

engine-attack-surface-limb-not-captured-on-grid = Limb: inte fångad på rutnät { $na }x{ $nb }; kräver { $best_limb_capture_tx_power_dbw } dBW (flög { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km måste vara ändligt och positivt

engine-e-attitude-budget-inertias-must-be-finite-and = inertias måste vara ändliga och positiva

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 måste vara >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = minst en pekningsbidragande källa krävs

engine-e-attitude-budget-contributor-sigma-must-be-finite = sigma för bidragsgivaren '{ $name }' måste vara ändligt och >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> GG-moment { $t_gg } N·m; pekning { $total }" RSS (dominerande: { $dominant }) (MODELLED skalär budget)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } behöver ett värde

engine-bench-cli-unknown-option = okänt alternativ `{ $a }`

engine-bench-cli-unexpected-argument = oväntat argument `{ $pos }`

engine-bench-cli-cannot-read = kan inte läsa { $p }: { $e }

engine-bench-cli-cannot-create = kan inte skapa { $d }: { $e }

engine-bench-cli-cannot-write = kan inte skriva { $p }: { $e }

engine-bench-cli-unknown-task-or = okänd uppgift `{ $t }` (a, b, c eller d)

engine-bench-cli-scored-epochs-in-folder = { $labels } poängsatta epoker i { $folders } mapp(ar)

engine-bench-cli-wrote-cases-json-and-truth = skrev { $out }/cases.json och { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: det här åtagandet är preliminärt och dess frö har avslöjats; det är inte en undanhållen datamängd för utgåvan

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: fröet är inte det som ligger bakom det här åtagandet

engine-bench-cli-is-not-json = { $f } är inte JSON: { $e }

engine-bench-cli-cannot-read-2 = kan inte läsa { $i }: { $e }

engine-bench-cli-result-rendered = { $results } resultat återgivna

engine-bench-cli-unknown-subcommand =
    okänt underkommando `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = kan inte skapa { $path } (en befintlig fröfil skrivs aldrig över): { $e }

engine-bench-cli-cannot-write-2 = kan inte skriva { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = frö skrivet till { $path }: håll det utanför versionshantering och utanför alla meddelanden; bara hashen nedan är offentlig

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (överförd, inte körd på nytt)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = impairment-eval baslinje: { $det }

engine-bench-cli-no-scenario-json-under = ingen scenario.json under { $root }

engine-bench-cli-is-not-json-2 = { $path } är inte JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } avvikande, { $missing } saknade, { $unpinned } ofästa

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = okänd delmängd `{ $other }` (dev, test eller holdout)

engine-bench-score-for-is-not-finite = poängen för `{ $id }` är inte ändlig

engine-bench-case-have-no-score-the = { $missing } fall saknar poäng, det första är `{ $first_missing }`

engine-bench-predictions-name-case-that-is = prediktionerna anger ett fall som inte finns i referensen: `{ $extra }`

engine-bench-schema-must-be = `schema` måste vara `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` måste vara en SHA-256 med 64 hexsiffror

engine-bench-truth-is-not-json = referensen är inte JSON: { $e }

engine-bench-predictions-are-not-json = prediktionerna är inte JSON: { $e }

engine-bench-truth-schema-must-be = referensens `schema` måste vara `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = prediktionernas `schema` måste vara `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = referensen gjordes under en annan specifikationsversion än { $SPEC_VERSION }; resultat från olika huvudversioner blandas aldrig

engine-bench-unknown-task = okänd uppgift `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = resultat { $v1 } är inte giltigt: { $p }

engine-bench-site-result-is-task-holdout-result = resultat { $v1 } är ett resultat för uppgift (d) på undanhållen datamängd utan `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = resultat { $v1 } är poängsatt mot ett preliminärt, avslöjat frö för undanhållen datamängd: inte en undanhållen datamängd för utgåvan

engine-bench-site-result-was-scored-under-this = resultat { $v1 } poängsattes under { $v }; den här sidan gäller { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = poängen för `{ $k }` är inte ett tal

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (0.35 standardövervakningsstatistik)

engine-bench-tasks-malformed-clock-line = felformad klockrad `{ $line }`

engine-bench-tasks-the-clock-file-does-not = klockfilen stämmer inte med den fastlåsta SHA-256 (fick { $got }, väntade { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = satellit { $prn } finns inte i klockfilen

engine-bench-tasks-kshana-bench-baseline = kshana-bench baslinje: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = prediktionerna täcker { $pmap } fall, referensen har { $tarr }

engine-bench-tasks-case-has-no-number-array = fallet `{ $id }` har ingen talmatris

engine-bench-tasks-case-needs-values-has = fallet `{ $id }` behöver { $n } värden, har { $a }

engine-bench-tasks-case-has-non-finite-value = fallet `{ $id }` har ett icke-ändligt värde

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialisera { $name }: { $e }

engine-e-bin-crossover-study-write = skriv { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = fel: kan inte skapa { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = klart: tröghet { $nodes } noder, klocka { $curves } kurvor (frö 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in = { $n } användarepoker x 3 URA-värden på { $dt } s = { $v1 } ms per användarepok ({ $ok } lösbara)

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = skrev docs/INTEROP.md (exporttabell)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = skrev valideringssammanfattning till { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = okänd kropp '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigerar runt en annan kropp än jorden med en jordlänk; { $name } stöds inte här

engine-e-body-pnt-duration-and-step-must-be = duration_s och step_s måste vara positiva med högst 20000 epoker; fick { $duration } och { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind måste vara orbiter eller surface; fick '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = användarens höjd måste vara positiv och excentriciteten i [0, 0.9)

engine-e-body-pnt-the-user-orbit-periapsis-is = användarbanans periapsis ligger under ytan

engine-e-body-pnt-constellation-needs-to-200-satellites = konstellationen behöver 1 till 200 satelliter i minst ett plan

engine-e-body-pnt-constellation-altitude-must-be-positive = konstellationens höjd måste vara positiv

engine-e-body-pnt-range-sigmas-must-be-positive = avståndssigman måste vara positiva

engine-e-body-pnt-no-earth-position-relative-to = ingen jordposition relativt { $name } vid JD { $jd }

engine-e-body-pnt-serialising-report = serialiserar rapport: { $e }

engine-e-body-pnt-the-report-must-serialise-to = rapporten måste serialiseras till ett JSON-objekt

engine-body-pnt-positioning-around-user-relays-at =
    Positionsbestämning runt { $name } — { $user_kind }-användare, { $n_relays } reläer på { $r } km, { $n_epochs } epoker
    { "  " }Jordens ljustid { $one_way_light_time_s } s enkel väg, { $two_way_light_time_s } s tur och retur; vinkel Sol-Jorden-kropp { $sun_separation_deg } deg
    { "  " }tillgänglighet: { $availability_relays } enbart konstellation, { $availability_with_earth } med jordavståndet (Jorden i sikte { $earth_visibility })
    { "  " }median-PDOP { $opt }; RMS-fel { $opt2 } enbart konstellation, { $opt3 } med jordavståndet
    { "  " }formell mediansigma { $opt4 } enbart konstellation, { $opt5 } med jordavståndet{ "\u000A" }

engine-body-pnt-positioning-around = Positionsbestämning runt { $name }

engine-body-pnt-user-relays-earth-light-time = { $user_kind }-användare · { $n_relays } reläer · Jordens ljustid { $one_way_light_time_s } s · MODELLED

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = E1-scenariot är inte en tabell

engine-e-calibration-ensembles-e1-scenario-has-no-monte = E1-scenariot har ingen [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } saknas

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 är `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ensembler med 200 realiseringar vardera, mot det slutna uttrycket: medelvärde 0, sigma = { $sigma } ns. Ensemble j använder basfrö 1 000 000 + 1000 j och bootstrapfrö 20260928 + j. Det största relativa ADEV-felet var { $max } för E2 och { $max2 } för E3 (över 1, 10 och 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = tom resultatsökväg

engine-e-campaign-result-path-has-an-empty = resultatsökvägen `{ $path }` har ett tomt segment

engine-e-campaign-result-path-bad-index-in = resultatsökvägen `{ $path }`: felaktigt index i `{ $part }`

engine-e-campaign-result-path-no-field = resultatsökvägen `{ $path }`: inget fält `{ $name }`

engine-e-campaign-result-path-indexed-value-is = resultatsökvägen `{ $path }`: det indexerade värdet är inte en matris

engine-e-campaign-result-path-index-out-of = resultatsökvägen `{ $path }`: index { $i } ligger utanför intervallet ({ $n })

engine-e-campaign-result-path-value-is-not = resultatsökvägen `{ $path }`: värdet är inte ett tal eller en flagga

engine-e-campaign-result-path-is-not-an = resultatsökvägen `{ $path }`: `{ $k }` är inte en matris

engine-e-campaign-result-path-must-name-one = resultatsökvägen `{ $path }` måste ange ett värde, inte rader

engine-e-campaign-result-path-is-not-an-2 = resultatsökvägen `{ $path }`: `{ $name }` är inte en matris

engine-e-campaign-metric-path-has-no-entry = måttsökvägen `{ $path }` saknar post i den typens units-block; ange dess `unit` i kampanjen

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` måste bestå av bokstäver, siffror, `_` eller `-` och får inte vara tomt

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: en kampanj kan inte innehålla en kampanj

engine-e-campaign-serialise = { $label }: serialisera: { $e }

engine-e-campaign-result-did-not-parse = { $label }: resultatet kunde inte tolkas: { $e }

engine-e-campaign-seed-key-no-field-in = frönyckeln `{ $key }`: inget fält `{ $part }` i scenariot

engine-e-campaign-seed-key-is-not-non = frönyckeln `{ $key }` är inte ett icke-negativt heltal

engine-e-campaign-seed-does-not-fit-toml = fröet { $seed } ryms inte i ett TOML-heltal

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = tidssökvägen `{ $t }` måste ange rader med `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` är inte below, above eller abs_above

engine-campaign-threshold-is-null = tröskeln `{ $p }` är null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` är inte mean, min, max eller count

engine-campaign-time-path-gives-several-values = tidssökvägen `{ $t }` ger flera värden per rad

engine-campaign-value-path-has-fewer-rows = värdesökvägen `{ $y }` har färre rader än `{ $t }`

engine-campaign-value-path-has-rows-time = värdesökvägen `{ $y }` har { $r } rader, tidssökvägen `{ $t }` har { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = en kampanj med faser behöver en [timeline] med step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s måste vara positivt, fick { $step }

engine-e-campaign-phase-is-named-twice = fasen `{ $name }` har namngetts två gånger

engine-e-campaign-phase-duration-must-be-non = fasen `{ $name }`: duration_s måste vara icke-negativt

engine-e-campaign-phase-has-no-runs = fasen `{ $name }` har inga körningar

engine-e-campaign-phase-the-first-phase-has = fasen `{ $name }`: den första fasen har inget att ta över från

engine-e-campaign-phase-handoff-from-channel-which = fasen `{ $name }`: överlämning från kanalen `{ $ch }`, som den föregående fasen inte avslutades med

engine-e-campaign-phase-handoff-from-run-does = fasen `{ $name }`: överlämning från from_run { $from_run } finns inte

engine-e-campaign-phase-handoff-is-null = fasen `{ $name }`: överlämningen `{ $from }` är null

engine-e-campaign-phase-handoff-run-does-not = fasen `{ $name }`: överlämningskörningen { $run } finns inte

engine-e-campaign-phase = fasen `{ $name }`: { $e }

engine-campaign-phase-run = fas { $name }/körning { $ri }

engine-e-campaign-phase-end-at-run-does = fasen `{ $name }`: end_at_run { $end_at_run } finns inte

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s är senare)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } är null)

engine-e-campaign-phase-side-is-not-classical = fasen `{ $name }`: sidan `{ $side }` är inte classical eller quantum

engine-e-campaign-phase-skip-must-be-non = fasen `{ $name }`: skip_s måste vara icke-negativt

engine-e-campaign-phase-alarm-compare-is-not = fasen `{ $name }`: larmets compare `{ $compare }` är inte below, above eller abs_above

engine-e-campaign-phase-alarm-threshold-is-null = fasen `{ $name }`: larmtröskeln `{ $p }` är null

engine-e-campaign-phase-channel-is-in-not = fasen `{ $name }`: kanalen `{ $channel }` är i { $u }, inte { $du }

engine-e-campaign-phase-channel-needs-unit = fasen `{ $name }`: kanalen `{ $channel }` behöver en enhet

engine-e-campaign-phase-two-runs-both-provide = fasen `{ $name }`: två körningar tillhandahåller båda kanalen `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = fasen `{ $name }` för över `{ $ch }`, som den föregående fasen inte avslutades med

engine-e-campaign-phase-carries-but-no-run = fasen `{ $name }` för över `{ $ch }` men ingen körning av den tillhandahåller `{ $ch }`

engine-e-campaign-channel-is-in-in-one = kanalen `{ $name }` är i { $unit } i en fas och i { $unit2 } i en annan

engine-e-campaign-at-least-one-metric-is = minst ett mått behövs

engine-e-campaign-metric-is-named-twice = måttet `{ $name }` har namngetts två gånger

engine-e-campaign-seed-overflow-in-the-ensemble = fröet svämmar över i ensemblen

engine-e-campaign-an-ensemble-needs-at-least = en ensemble behöver minst en körning

engine-e-campaign-sweep-takes-one-to-three = ett svep tar en till tre axlar, fick { $axes }

engine-e-campaign-axis-is-named-twice = axeln `{ $name }` har namngetts två gånger

engine-e-campaign-axis-needs-at-least-two = axeln `{ $name }` behöver minst två steg

engine-e-campaign-axis-scale-must-be-lin = axeln `{ $name }`: scale måste vara lin eller log

engine-e-campaign-axis-log-axis-needs-positive = axeln `{ $name }`: en log-axel behöver positiva ändpunkter

engine-campaign-sweep-node = svepnod { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs måste vara minst två

engine-e-campaign-compose-needs-at-least-one = compose behöver minst en medlem

engine-e-campaign-shared-value-must-be-number = det delade värdet `{ $name }` måste vara ett tal eller flera tal

engine-e-campaign-shared-value-is-named-twice = det delade värdet `{ $name }` har namngetts två gånger

engine-e-campaign-member-binds-unknown-shared = medlemmen `{ $label }` binder okänt delat värde `{ $name }`

engine-e-campaign-member = medlemmen `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = måttet `{ $name }` är i { $u } för en medlem och i { $unit } för `{ $label }`

engine-e-campaign-member-is-named-twice = medlemmen `{ $label }` har namngetts två gånger

engine-e-campaign-invalid-campaign-scenario = ogiltigt kampanjscenario: { $e }

engine-e-campaign-invalid-campaign = ogiltig kampanj: { $e }

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } av { $what } över realiseringarna

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = värdet av { $ch } vid slutet av den föregående fasen, adderat till den här fasens { $ch }

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } på tidslinjens rutnät: det senaste sampelet från den ägande fasens körning vid eller före varje rutnätstid (nollte ordningens hållning); null där ingen körning av den fasen tillhandahåller det

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = värden för scenarionyckeln { $key } längs axeln { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = värdet för scenarionyckeln { $key } vid den här noden

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } i nodens resultat

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } för varje realisering, i frönas ordning

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = delat värde { $name }, skrivet in i varje medlem som binder det

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = måttet { $name } läst från medlemmens resultat

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = minsta { $name } över medlemmarna

engine-campaign-largest-across-the-members = största { $name } över medlemmarna

engine-campaign-mean-across-the-members = medelvärde av { $name } över medlemmarna

engine-e-campaign-failed-to-serialise-campaign-result = kunde inte serialisera kampanjresultatet: { $e }

engine-campaign-chain-phases-over-events-alarm = kedja: { $phases } faser över { $duration_s } s, { $events } händelser, larm utlöst under { $alarm_s } s av rutnätet

engine-campaign-sweep-of-nodes-over = svep av `{ $scenario_kind }`: { $nodes } noder över [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = monte carlo av `{ $scenario_kind }`: { $runs } frön

engine-campaign-compose-members = compose: { $members } medlemmar

engine-campaign-member-runs-modelled = { $runs_total } medlemskörningar (MODELLED)

engine-campaign-sweep-of-over-nodes-each = svep av `{ $scenario_kind }` över { $axis_order } ({ $nodes } noder{ $v4 }; varje linje har sitt eget intervall)

engine-campaign-campaign-modelled-composition-every-value = kampanj { $r } | MODELLED sammansättning; varje värde läst från en verklig körning av den angivna typen

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = en optimering tar en till tre params, fick { $params }

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` har namngetts två gånger

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: kräver ändligt lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale måste vara lin eller log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: en log-param behöver positiva gränser

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start måste ligga i [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: ett rutnät behöver minst två steg

engine-e-campaign-optimize-objective-target-is-only-read = objective.target läses bara med goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" kräver ett ändligt objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal måste vara minimize, maximize eller target, fick `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = ett rutnät med { $total } noder överskrider gränsen på 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps läses bara med method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals måste täcka den initiala simplexen (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step måste ligga i (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol och xtol måste vara icke-negativa

engine-e-campaign-optimize-method-must-be-grid-or = method måste vara grid eller nelder-mead, fick `{ $other }`

engine-campaign-optimize-optimize-eval = optimize eval { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = nedre gräns för scenarionyckeln { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = övre gräns för scenarionyckeln { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = värdet för scenarionyckeln { $key } vid den bästa utvärderingen

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = värdet för scenarionyckeln { $key } vid den här utvärderingen

engine-campaign-optimize-target-value-of = målvärde för { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } vid den bästa utvärderingen

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } för den här utvärderingen (frömedelvärdet när runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) av `{ $scenario_kind }` med { $method }: { $evals } utvärderingar ({ $stop_reason }), bäst { $o2 } vid [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START före huvudet CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: felformad huvudrad: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: felformad metadatarad: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: felformad datarad: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: okänt datanyckelord { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: datarad { $k } saknar epok

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: datarad { $k } saknar värde

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: datarad { $k } har felaktigt värde { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: oavslutat segment (META_STOP/DATA_STOP saknas)

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: felaktig TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: felaktig TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = okänd observable `{ $other }`: förväntade en av range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = okända coordinates `{ $other }`: förväntade en av cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours måste vara ändligt och positivt, fick { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs måste vara ≥ 2, fick { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps måste vara ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials måste vara ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations måste vara ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd måste vara ändligt och positivt, fick { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor måste vara ändligt och positivt, fick { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km måste vara ändligt och positivt, fick { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m måste vara ändligt och positivt, fick { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s måste vara ändligt och positivt, fick { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = konstellationen måste innehålla minst en chief och en referens

engine-e-cislunar-arc-recovery-family-is-an-out-of = familjen `{ $family }` är en familj utanför planet och har ingen plan fyrtillståndsrepresentation: ange spatial = true för att svepa över den

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = framåtmodellen gav en icke-ändlig referensmätning

engine-cislunar-arc-recovery-first-arc-length-at-which = första båglängd vid vilken VARJE såddad försöksomgångs brusfria batchlösning driver det slutliga tillståndsfelet till högst { $recovery_factor } gånger den a priori-förskjutning den startade från. Detta är återvinningsmotsvarigheten till rangkriteriet: med exakta mätningar blir frågan `is the state observable?` till `can an estimator get it back?`, och ingen tolerans för singulärvärden ingår i svaret.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = första båglängd vid vilken Monte Carlo-RMS-felet i positionsåtervinning över { $trials } såddade brusrealiseringar faller till eller under { $error_bound_km } km. Detta är återvinningsmotsvarigheten till estimerbarhetskriteriet, uppmätt snarare än förutsagd: felet är avståndet från skattningen till den kända referensen, inte spåret av en formell kovarians.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED inom ett epokrutnätssteg: estimatorn återvinner från { $e } h, Gramian-rangkriteriet slår om vid { $g } h (kvot { $v1 }, rutnät { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED som återvinningsgräns: estimatorn återvinner från { $e } h, { $v1 } Gramian-rangkriteriets { $g } h (kvot { $v2 }, rutnät { $grid_hours } h). Rangkriteriet är en relativ konvention för singulärvärden; återvinningsgränsen är ett uppmätt tillståndsfel, och de två sammanfaller inte här.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: estimatorn når aldrig sin återvinningsgräns på den här bågen, medan Gramian-rangkriteriet slår om vid { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = Gramian-rangkriteriet uppfylls aldrig på den här bågen (geometrin når aldrig full rang), medan estimatorn återvinner från { $e } h — de två är oense om huruvida en gräns alls finns.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | familj { $family }, { $state_dim } tillstånd, { $n_spacecraft } s/c, observable { $observable }, parametrisering { $coordinates } | båge på { $arc_hours } h, { $epochs } epoker (rutnät { $grid_hours } h), { $trials } försök, frö { $seed } | partialderivator med finita differenser, ingen analytisk Jacobian / STM / SVD / SRIF | brusfri återvinning från { $nf } (faktor { $recovery_factor }) mot Gramian-rangtröskel { $gram } | Monte Carlo-estimerbarhet från { $est } (RMS pos ≤ { $error_bound_km } km, σ { $sigma_range_m } m) mot Gramian-estimerbarhet { $gram_est } | RMS pos vid bågens slut { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = okänd family `{ $other }`: förväntade en av dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO vid korsningsavstånd { $d } differentialkorrigerades inte

engine-e-cislunar-observability-member-at-x0-did-not = { $label } medlem { $i } vid x0 = { $x0 } differentialkorrigerades inte

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft måste vara mellan 2 och { $MAX_SPACECRAFT }, fick { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs måste vara ≥ 2, fick { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol måste vara ändligt och positivt, fick { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m måste vara ändligt och icke-negativt, fick { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km måste vara ändligt och positivt, fick { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } s/c ({ $refs } ref) | båge på { $arc_hours } h, { $rank_arc } epoker | rang { $first } → { $last } av { $state_dim } över bågen | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | momentan rang enbart avstånd { $rank_range_only } → avstånd+takt { $rank_range_rate } ({ $n_links } länkar) | GDOP enbart avstånd { $ro } avstånd+takt { $rr } | DRO ICs (största periodicitetsresidual { $max_resid }) | SRIF a posteriori ändlig vid rang 4-epok { $srif_epoch } (prövad mot oberoende referens: rang/STM/DRO-slutning/SRIF, beräknad ur en modell: utformning)

engine-cislunar-observability-never-rank-of = aldrig (rang { $rank } av { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | familj { $family }, { $state_dim } tillstånd, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | rangtröskel { $rank_thr } (rutnät { $c } h) | estimerbarhetströskel (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = första båglängd vid vilken den formella 1σ-positionsosäkerheten för chiefs INITIALA tillstånd, σ_pos = sqrt(trace(P_rr)) med P = (ÕᵀÕ)⁻¹ och Õ den med mätbrus vitade observerbarhetsmatrisen, faller till eller under { $sigma_pos_threshold_km } km. Detta är kriteriet under vilket en båglängdströskel överhuvudtaget är brusberoende: P skalar som σ², så σ_pos skalar som σ, medan rangkriteriet ovan inte rör sig med σ. Gränsen är ett ANGIVET tekniskt val, inte ett anpassat — estimability_sweep redovisar tröskeln vid fyra andra gränser.

engine-cislunar-observability-extension-r3-this-run-is = UTÖKNING (R3) — den här körningen är INTE den plana DRO-konfiguration som `label` ovan beskriver. Tillståndsdimension { $state_dim }; banfamilj { $family }; { $n_spacecraft } rymdfarkoster; avståndsmätningens sigma { $sigma_range_m } m. Där `label` säger "planar" och "planar DROs", läs den familj som anges här. Tillägg som är VALIDATED: den variationella 6x6-STM:en är samma med finita differenser prövade CR3BP-STM (crate::cr3bp) som används i full bredd; de rumsliga raderna för avstånd / avståndstakt i Jacobianen är analytiska partialderivator prövade med finita differenser, där raden för avståndstakt har kontrollerats komponent för komponent mot cratens oberoende 3D-funktion deepspace_od::range_rate_observable; initialvillkoren för halo / NRHO är differentialkorrigerade periodiska banor från samma korrigerare som reproducerar den publicerade södra L2 9:2-NRHO, fortsatta från det publicerade fröet, och varje medlems slutningsresidual redovisas; RANG-utfallen för sex tillstånd bekräftas mot en OBEROENDE radtrappsrang (Gauss-elimination med partiell pivotering) som inte delar någon kod med egen-/SVD-vägen. SRIF-LEDETS ÄRLIGA OMFATTNING: SRIF-korsvalideringen ovan använder SAMMA mätningsjacobianer och reduceras till samma O^T O, så dess överensstämmelse är en konsistenskontroll mellan två numeriska maskiner, INTE oberoende belägg för tröskeln — den räknas inte som prövning av någon siffra här. MODELLED: familjens utformning (vilka abskissor, amplituder och faser), epokrutnätet, den enskilda länkbågen och den angivna positionsgränsen i estimerbarhetskriteriet.

engine-cislunar-observability-validated-each-constellation-initial-condition = Prövad mot oberoende referens: varje initialvillkor i konstellationen är en differentialkorrigerad periodisk bana i familjen { $family }, som sluter sig över en period till den redovisade periodicitetsresidualen (plana DRO:er är dessutom retrograda kring månen). Familjen korrigeras vid massförhållandet jorden–månen. Beräknad ur en modell: valet av familjeparametrar och faser (konstellationens utformning). Nyckelnamnet `dro_provenance` behålls för det utgivna dokumentschemat; det bär den familj som den här körningen bad om.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } måste vara ändligt och positivt, fick { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } måste ligga i (0, 1), fick { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg måste ligga i [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems måste ange minst en förinställning

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias kräver ändliga bias_m, t0_s och t1_s

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch = integrity: { $n } epoker överskrider taket på { $MAX_EPOCHS } epoker; höj step_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: inga poster

engine-e-clock-library-card-records-at-different-tau0 = { $name }: poster med olika tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: periodisk minstakvadratanpassning misslyckades

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: { $used } stabilitetspunkter med edf >= { $MIN_FIT_EDF }; ett kort behöver tre

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = luckor { $g }, fasavvikare { $o }, fassteg { $p }, skurar { $b }, frekvenssteg { $f } (robust sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` är inte ett icke-negativt heltal

engine-e-compliance-is-missing = `{ $p }` saknas

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } överskrider events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } överskrider predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: receiver-trust-räkningarna är felformade ({ $malformed_counts }); utesluten

engine-e-compliance-not-json = { $label }: inte JSON: { $e }

engine-compliance-cannot-read = { $label }: kan inte läsa: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: det intilliggande scenariot anger kind `{ $s }` men resultatet anger `{ $o }`; används inte

engine-e-compliance-scenario-kind-not-found-no = { $label }: scenariotyp hittades inte (ingen intilliggande scenariofil, inte ett receiver-trust-resultat, ingen `kind` på toppnivå)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` är inte en scenariotyp som motorn känner till; används inte

engine-compliance-written-by-kshana = Skrivet av kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } test med varje angiven tröskel uppnådd, { $not_met } med en tröskel som inte uppnåtts, { $needs_input } som behöver indata.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = intensitetsrutnätet måste ha ändliga min < max, fick [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = intensitetsrutnätet behöver >= 2 steg, fick { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = korrelationsrutnätet måste ha minst ett värde

engine-e-conflict-resilience-correlation-values-must-lie-in = korrelationsvärden måste ligga i [0, 1], fick { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience behöver minst ett lager

engine-e-conflict-resilience-layer-availability-not-in = lager { $i } tillgänglighet { $availability } ligger inte i [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = lager { $i } sigma_m måste vara ändligt och positivt

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = lager { $i } vulnerability måste vara ändligt och >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = lager { $i } vector_weight måste vara ändligt och >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } utanför intervallet (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials måste vara >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } lager ({ $primary } baslinje) | referensintensitet { $reference_intensity } | resiliensförhållande slutet uttryck { $ratio_closed_form }x MC { $ratio_mc_independent }x (flerlager mot enkelt lager) | korrelation sänker flerlagerseffekten: förhållande { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | apriori-KI [{ $ratio_lo }-{ $ratio_hi }]x | överlevnad per vektor @ ref jam { $surv }% spoof { $surv2 }% kinetic { $surv3 }% cyber { $surv4 }% (skarpast { $sharpest }) | ~7x huvudsiffra MODELLED, VALIDATED MC->slutet uttryck / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = okänd centralkropp { $name }: förväntade en planet, Pluto, månen eller en stor måne (earth, moon, mars, europa, titan, ...; se crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = ett Walker-skal behöver total > 0 och planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walker total { $total } är inte en multipel av planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = Walker-fasning F = { $phasing } måste ligga i 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } är inte en expanderbar GPS-plats (SPS PS Table 3.2-2 listar B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: ange altitude_km eller semi_major_axis_km, inte båda

engine-e-constellation-needs-altitude-km-or-semi = { $what }: kräver altitude_km eller semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: halva storaxeln { $v1 } km ligger inte över { $name }s radie

engine-e-constellation-eccentricity-must-lie-in = { $what }: excentriciteten { $e } måste ligga i [0, 0.9)

engine-e-constellation-perigee-is-below-the-surface = { $what }: perigeum ligger under ytan på { $name }

engine-e-constellation-constellation-preset-is-an-earth = konstellation { $name }: förinställningen { $p } är en jordkonstellation, kroppen är { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = konstellation { $name }: okänd förinställning { $other } (förväntade gps-baseline, gps-expandable, galileo, beidou, beidou-meo eller glonass)

engine-e-constellation-constellation-expanded-applies-only-to = konstellation { $name }: `expanded` gäller bara förinställningen gps-expandable

engine-constellation-constellation-shell = konstellation { $name } skal { $v2 }

engine-constellation-explicit-element-sets = { $satellite } explicita elementmängder

engine-constellation-constellation-satellite = konstellation { $name } satellit { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = konstellation { $name } har inga satelliter: ange en förinställning, en [[constellation.shell]] eller en [[constellation.satellite]]

engine-e-constellation-no-constellation-given = ingen konstellation angiven

engine-e-constellation-constellations-with-one-clock-each = { $constellations } konstellationer med en klocka vardera överskrider gränsen på { $MAX_CLOCKS } klockor; använd clock = "common" eller slå ihop konstellationer

engine-e-constellation-must-be-finite = { $what } måste vara ändligt

engine-e-constellation-need-step-and-duration-step = kräver step_s > 0 och duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = fler än 100 000 epoker; höj step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg måste ligga i [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold måste vara positivt

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg måste ligga i [0.25, 90]

engine-e-constellation-need-90-lat-min-deg = kräver -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = kräver lon_min_deg < lon_max_deg som spänner över högst 360 deg

engine-e-constellation-give-at-least-one-constellation = ange minst en [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points är begränsat till 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } satelliter överskrider gränsen på 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: { $total } satelliter ({ $names }) runt { $name }; tillgänglighet { $global_availability_pct }% (PDOP <= { $pdop_threshold } vid { $mask_deg } deg mask), sämsta plats { $worst_site_availability_pct }%, median-PDOP { $cov }, medelvärde { $global_mean_visible } i sikte; { $grid_points } rutnätspunkter x { $epochs } epoker (MODELLED)

engine-constellation-constellation-coverage-over-the = Konstellationens täckning över { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } måste vara ändligt och positivt

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } måste vara ändligt och >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw måste vara ändligt

engine-e-contact-schedule-satellite-altitude-km-must-be = satelliten '{ $name }': altitude_km måste ligga i (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satelliten '{ $name }': inclination_deg måste ligga i [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satelliten '{ $name }': backlog_mbit måste vara >= 0

engine-e-contact-schedule-satellite-priority-must-be = satelliten '{ $name }': priority måste vara > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satelliten '{ $name }': eirp_dbw måste vara ändligt

engine-e-contact-schedule-station-lat-deg-in-90 = stationen '{ $name }': lat_deg i [-90, 90], lon_deg ändligt

engine-e-contact-schedule-station-mask-deg-must-be = stationen '{ $name }': mask_deg måste ligga i [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = stationen '{ $name }': alt_m måste ligga i [0, 3000] (intervallet i ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = stationen '{ $name }': setup_s >= 0 och g_over_t_db ändligt

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours måste ligga i (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s måste ligga i (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = minst en satellit och en station krävs

engine-e-contact-schedule-at-most-32-satellites-and = högst 32 satelliter och 32 stationer

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: { $satellites } satelliter x { $stations } stationer över { $duration_hours } h -> { $cands } kandidatkontakter, { $greedy } schemalagda; { $total_del } av { $total_backlog } Mbit levererade{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: { $pairs } pass; ACM { $acm } Mbit mot CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = kräver minst 2 trials och ett ändligt sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total måste ligga i (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = inget lokalt system vid användaren

engine-e-dop-error-ci-singular-geometry = { $name }: singulär geometri

engine-e-dop-error-ci-no-noise-free-fix = { $name }: ingen brusfri positionsbestämning

engine-e-dop-error-ci-no-fix = { $name }: ingen positionsbestämning

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singulär geometri

engine-e-dop-error-mc-no-fix = { $label }: ingen positionsbestämning

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km måste vara positivt; fick { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes och sats_per_plane måste båda vara skilda från noll

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz måste vara positivt; fick { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency måste ligga i (0, 1]; fick { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k måste vara positivt; fick { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db måste vara icke-negativt; fick { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m måste ligga utanför jorden; fick { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance = Earth-GNSS på månavstånd — { $n_satellites } satelliter, mottagare på { $r } km{ "\u000A" }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Jordlimb sedd från konstellationen: { $earth_limb_half_angle_deg } deg från nadir — varje stråle mot månen måste överskrida detta{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_geometrically_visible } av { $n_satellites } inte skymda; { $n_trackable } klarar spårningströskeln på { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }bästa länk { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }varje spårbar siktlinje ligger inom en halvkon på { $a } deg — geometrin är nästan degenererad{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }SVEP över { $epochs } epoker / { $span_s } s: signaltillgänglighet { $signal_availability }, tillgänglighet för positionsbestämning { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }spårbara länkar medel { $mean_trackable }, max { $max_trackable }; bästa C/N0 { $w }; bästa PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = mellan ett och sex steg krävs

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg måste vara ändligt och icke-negativt

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 måste vara ändligt och icke-negativt

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg måste vara ändligt och icke-negativt

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m måste vara ändligt och icke-negativt

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg måste ligga i [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s måste vara ändligt och icke-negativt

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = start-dragkraft-till-vikt { $tw } måste överstiga 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ideal dv { $ideal_dv_m_s } m/s, förluster { $losses } m/s (gravitation { $gravity_loss_m_s }, luftmotstånd { $drag_loss_m_s }, styrning { $steering_loss_m_s }, mottryck { $back_pressure_loss_m_s }); brinnslut { $r } km vid { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } måste vara ändligt och positivt

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body måste vara "earth" eller "mars", fick "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = atmosfären "{ $a }" är inte tillgänglig för kroppen "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg måste ligga i (0, 90) (positivt nedåt)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m måste ligga i [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg måste vara ändligt med |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg och longitude_deg måste vara ändliga

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag måste ligga i [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg måste vara ändligt

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s måste ligga i (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m måste ligga i [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s måste ligga i (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame måste vara inertial|relative, fick "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> topp { $pk_g } g vid { $r } km, topp-q { $r2 } W/cm² vid { $r3 } km, värmelast { $r4 } J/cm², topp-q_dyn { $r5 } kPa; { $outcome } vid { $end_time_s } s (slutet uttryck { $cf_g } g; MODELLED 3-DoF, ingen strålning/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } måste ligga i (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } måste vara ändligt och icke-negativt

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg måste ligga i [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits måste ligga i 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (brunn { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = nadirvinkeln { $eta_rad }° överskrider jordens vinkelradie { $rho }° (missar jorden)

engine-e-eo-payload-no-sun-synchronous-inclination-at = ingen solsynkron inklination vid { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg måste ligga i (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad måste vara ändligt och positivt

engine-e-eo-payload-half-fov-too-large = half_fov är för stort: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> { $v3 } km svepbredd, { $gsd } m GSD i nadir, åtkomst till { $v5 } km utanför nadir; nodavstånd { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Jord–måne-barycentrum från { $table }, delat med lunarserien av Montenbruck & Gill precesserad till J2000

engine-ephem-provider-jpl-mean-elements-in-the = JPL-medelelement i Laplace-planet, medellongitudens takt från IAU:s synkrona rotationstakt, adderade till sin planet från { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = IAU:s synkrona rotationsriktning vid JPL:s medelavstånd, adderad till Saturnus från { $table }

engine-e-ephem-provider-read = läs { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = TLE saknar rad 1 (en rad som börjar med `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE saknar rad 2 (en rad som börjar med `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = en analytisk `orbit`-efemerid kräver en `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = ett efemeridscenario behöver antingen en `tle` eller en `orbit`

engine-e-ephemeris-step-must-be-positive = step_s måste vara positivt

engine-e-ephemeris-duration-must-be-non-negative = duration_s måste vara icke-negativt

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz måste vara en positiv, ändlig frekvens

engine-ephemeris-ground-track-samples-alt-km = { $source } markspår · { $n_samples } sampel · höjd { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` är inte ändligt

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` är varken sekunder eller en ISO-8601 UTC-tid

engine-e-evidence-assemble-no-epoch-of-the-log = ingen epok i loggen ligger mellan { $t0 } s och { $t1 } s (loggen sträcker sig från 0 till { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config är inte ett objekt

engine-e-evidence-assemble-config-json-already-has-an = config.json har redan en post `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = från { $from_s } till { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` är inte en UTC-tid som 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } i en logg på { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } behöver ett värde

engine-e-evidence-cli-cannot-create = kan inte skapa { $path }: { $e }

engine-e-evidence-cli-cannot-write = kan inte skriva { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = varning: { $path } är läsbar för andra användare; begränsa den (chmod 600)

engine-e-evidence-cli-cannot-read-key = kan inte läsa nyckeln { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } är inte en hexnyckel

engine-e-evidence-cli-must-hold-32-byte-key = { $path } måste innehålla en 32-bytesnyckel som 64 hexsiffror

engine-e-evidence-cli-cannot-read = kan inte läsa { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = kan inte läsa { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } finns och är inte tom

engine-e-evidence-cli-cannot-create-2 = kan inte skapa { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = varning: { $arg } är enbart för ägaren (läge 600) och heter inte *.pub: det kan vara en privat nyckel. Ange filen med den publika nyckeln.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` är varken 64 hexsiffror eller en läsbar fil ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` innehåller inte hexsiffror

engine-evidence-cli-private-key-keep-it-secret = privat nyckel: { $out }  (håll den hemlig; checka aldrig in den)

engine-evidence-cli-public-key-pub = publik nyckel:  { $out }.pub

engine-evidence-cli-public-key-hex = publik nyckel (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Ge verifierarna den publika nyckeln på en väg de litar på; de fäster den med --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify behöver en bundle-mapp

engine-e-evidence-cli-cannot-read-3 = kan inte läsa { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: inget PEM-certifikat hittades

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }tidsstämpelauktoritetens signatur har inte verifierats av Kshana

engine-evidence-cli-this-is-technical-record-not = Det här är en teknisk journal, inte ett juridiskt utlåtande.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp behöver en bundle-mapp

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp behöver en tokenfil

engine-e-evidence-cli-cannot-read-4 = kan inte läsa { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = kan inte skriva { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = obs: token ligger bredvid det signerade manifestet, inte i det; verifiera med --require-timestamp för att kräva den.

engine-e-evidence-cli-round-trip-packs-are-not = round-trip-paket byggs inte för WebAssembly

engine-e-evidence-cli-needs-scenario-path = behöver en scenariosökväg

engine-e-evidence-cli-needs-from = behöver --from

engine-e-evidence-cli-needs-to = behöver --to

engine-e-evidence-cli-cannot-read-lab-attestation = kan inte läsa laboratorieintyget { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = kan inte läsa { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = ogiltigt receiver-trust-scenario: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation gäller för `receiver-trust evidence`, inte för `evidence round-trip` (vars paket registrerar testvillkoren)

engine-e-evidence-cli-cannot-read-6 = kan inte läsa { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = kan inte läsa { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = bevispaket skrivet till { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epoker i fönstret: { $epochs_in_window }  ({ $from_s } s till { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }signerarens fingeravtryck: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 för manifest.json (det en RFC 3161-auktoritet ska tidsstämpla): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }loggutsnitt: bytes { $a } till { $b } av { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }loggutsnitt: hela loggen (den här loggen ger inget byteintervall för fönstret)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }laboratorieintyg registrerat i det signerade manifestet ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Ett paket är en teknisk journal, inte ett juridiskt utlåtande.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s till { $to_s } s efter loggens första epok

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = ogiltig TOML för laboratorieintyg: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` måste vara en tabell

engine-e-evidence-lab-invalid-lab-attestation = ogiltigt laboratorieintyg: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } krävs

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } är över { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: datumet { $date } är inte en dag som 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: en skärmad uppställning behöver enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup måste vara "conducted" eller "shielded" (fick { $other }); en uppställning över luften godtas inte som en laboratoriekörning

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db måste vara ändligt

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = testvillkoren anger { $events } händelse(r) men poängsättningsscenariot har { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = händelsen '{ $id }' i testvillkoren ({ $onset_s } s till { $offset_s } s) stämmer inte med '{ $label }' i poängsättningsscenariot ({ $onset_s2 } s till { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = loggens SHA-256 ({ $have }) är inte den som testvillkoren anger ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = avkortad DER

engine-e-evidence-tsa-bad-der-length = felaktig DER-längd

engine-e-evidence-tsa-unexpected-der-tag = { $what }: oväntad DER-tagg { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = tom AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = felaktig UTCTime

engine-e-evidence-tsa-bad-generalizedtime = felaktig GeneralizedTime

engine-e-evidence-tsa-bad-time = felaktig tid

engine-e-evidence-tsa-time-not-in-utc = tiden är inte i UTC

engine-e-evidence-tsa-bad-time-digits = felaktiga tidssiffror

engine-e-evidence-tsa-bad-bit-string = felaktig BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: tre element förväntades

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: för kort

engine-e-evidence-tsa-empty-extension = tom Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: värdet är inte en OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: tom

engine-e-evidence-tsa-validity-short = Validity: kort

engine-e-evidence-tsa-pem-end-without-begin = PEM: END utan BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: felaktig base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: felaktig base64-längd

engine-e-evidence-tsa-spki-empty = SPKI: tom

engine-e-evidence-tsa-spki-no-oid = SPKI: ingen OID

engine-e-evidence-tsa-spki-no-key = SPKI: ingen nyckel

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: två heltal förväntades

engine-e-evidence-tsa-unsupported-elliptic-curve = elliptisk kurva som inte stöds

engine-e-evidence-tsa-unsupported-public-key-algorithm = algoritm för publik nyckel som inte stöds

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA-nyckel eller signatur för stor

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA-modulen är inte udda

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA-signaturen är utanför intervallet

engine-e-evidence-tsa-rsa-key-too-small = RSA-nyckeln är för liten

engine-e-evidence-tsa-invalid-padding = ogiltig utfyllnad

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: kodat meddelande för långt

engine-e-evidence-tsa-last-octet-invalid = sista oktetten ogiltig

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: de vänstraste bitarna är inte noll

engine-e-evidence-tsa-pss-bad-padding = PSS: felaktig utfyllnad

engine-e-evidence-tsa-pss-signature-mismatch = PSS: signaturen stämmer inte

engine-e-evidence-tsa-unsupported-mask-generation-function = maskgenereringsfunktion som inte stöds

engine-e-evidence-tsa-mgf1-without-hash = MGF1 utan hash

engine-e-evidence-tsa-bad-pss-salt-length = felaktig PSS-saltlängd

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = en ECDSA-signatur behöver en EC-nyckel

engine-e-evidence-tsa-an-rsa-signature-needs-an = en RSA-signatur behöver en RSA-nyckel

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption utan sammandragsalgoritm

engine-e-evidence-tsa-an-rsa-pss-signature-needs = en RSA-PSS-signatur behöver en RSA-nyckel

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey utan sammandragsalgoritm

engine-e-evidence-tsa-unsupported-signature-algorithm = signaturalgoritm som inte stöds

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: tom

engine-e-evidence-tsa-time-stamp-request-not-granted = tidsstämpelbegäran beviljades inte

engine-e-evidence-tsa-no-time-stamp-token-in = ingen tidsstämpeltoken i svaret

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = inte en TimeStampResp eller TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = inte CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: inget innehåll

engine-e-evidence-tsa-signeddata-short = SignedData: kort

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: tom

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = det inkapslade innehållet är inte en TSTInfo

engine-e-evidence-tsa-no-tstinfo = ingen TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo ligger inte i en OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: kort

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: ingen genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: inga signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = exakt en SignerInfo förväntades

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: ingen sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: ingen sammandragsalgoritm

engine-e-evidence-tsa-signerinfo-short = SignerInfo: kort

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: inga signerade attribut

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: ingen signaturalgoritm

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: ingen signatur

engine-e-evidence-tsa-no-serial = inget serienummer

engine-e-evidence-tsa-signer-certificate-not-found = signerarens certifikat hittades inte

engine-e-evidence-tsa-attribute-empty = Attribute: tom

engine-e-evidence-tsa-attribute-no-values = Attribute: inga värden

engine-e-evidence-tsa-attribute-no-value = Attribute: inget värde

engine-e-evidence-tsa-content-type-attribute-mismatch = attributet content-type stämmer inte

engine-e-evidence-tsa-digest-failure = sammandragsfel

engine-e-evidence-tsa-signature-not-an-octet-string = signaturen är inte en OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = attributet ess signing certificate saknas

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: tom

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id hittades inte

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: ingen hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = olämpligt syfte för certifikatet

engine-e-evidence-tsa-certificate-is-not-yet-valid = certifikatet är inte giltigt ännu

engine-e-evidence-tsa-certificate-has-expired = certifikatet har gått ut

engine-e-evidence-tsa-invalid-ca-certificate = ogiltigt CA-certifikat

engine-e-evidence-tsa-certificate-chain-too-long = certifikatkedjan är för lång

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: tom

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: inget sammandrag

engine-e-evidence-tsa-message-imprint-mismatch = message imprint stämmer inte

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER med obestämd längd stöds inte

engine-e-evidence-tsr-expected-tag-found = förväntade { $what } (tagg { $tag }), hittade { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = felformad PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = tidsstämpelsvaret beviljades inte

engine-e-evidence-tsr-not-timestamp-token = inte en tidsstämpeltoken

engine-e-evidence-tsr-the-token-content-type-is = tokenens innehållstyp är inte CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = token innehåller ingen TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = message imprint använder en hashalgoritm som inte stöds

engine-e-evidence-tsr-the-imprint-is-bytes-not = imprint är { $digest } bytes, inte de { $want_len } som { $hash_alg } ger

engine-e-evidence-tsr-gentime-is-not-utc = genTime är inte UTC

engine-e-evidence-tsr-malformed-gentime = felformad genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime är inte en verklig kalendertid

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = inte hex med gemener

engine-e-evidence-verify-expected-bytes-found = förväntade { $N } bytes, hittade { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = paketet har redan en tidsstämpeltoken; ange --replace för att ersätta den

engine-e-evidence-verify-not-attached-the-pack-with = inte bifogad: paketet med den här token verifieras inte ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = paketet registrerar ett laboratorieintyg av { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = signaturfilen slutar inte med ett radslut

engine-evidence-verify-signer-not-pinned-the-signature = signerare inte fastlåst: signaturen visar att paketet är intakt mot nyckel { $r }, som paketet själv anger. Jämför det fingeravtrycket med ett du fått av signeraren, eller ange nyckeln.

engine-evidence-verify-range-is-not-inside-log = intervallet { $start }..{ $end } ligger inte inom en logg på { $full_bytes } bytes

engine-evidence-verify-timestamp-token-states-its-imprint = tidsstämpeltoken anger { $gen_time }; dess imprint { $v2 } manifest.json. Tidsstämpelauktoritetens signatur har inte verifierats av Kshana: kontrollera den med `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = tidsstämpeltoken anger { $gen_time }; dess imprint { $v2 } manifest.json; tidsstämpelauktoritetens signatur och kedja { $v3 } mot de angivna ankarna.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` är den tomma strängen

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } ligger utanför vokabulären

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = kostnadsintervallet måste vara ändligt, icke-negativt, ordnat låg≤nominell≤hög och ange en källa

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction och availability måste vara andelar i [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } måste vara ändligt och > 0, fick { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } måste vara ändligt och >= 0, fick { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg måste ligga i [-90, 90), fick { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = konstellationen har inga satelliter

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats måste vara >= 1 när det anges

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = slip-satellit { $sat } utanför intervallet

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = rad { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = rad { $lineno }: { $v } kolumner, minst { $min } förväntades

engine-e-fusion-kfgins-line-columns = rad { $v1 }: { $v } kolumner

engine-e-fusion-kfgins-line-block-lists-are-not = rad { $lineno }: blocklistor stöds inte

engine-e-fusion-kfgins-line-expected-key-value = rad { $lineno }: förväntade `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = rad { $lineno }: indragen nyckel utan förälder

engine-e-fusion-kfgins-line-only-one-level-of = rad { $lineno }: bara en nivå av nästling

engine-e-fusion-kfgins-line-unterminated-flow-list = rad { $lineno }: oavslutad flödeslista

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` är en lista, ett skalärt värde förväntades

engine-e-fusion-kfgins-missing = `{ $k }` saknas

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` måste vara en lista med tre element

engine-e-fusion-kfgins-no-imu-sample-at-or = inget IMU-sampel vid eller efter starttime

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU-tiden ökar inte vid { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } måste vara ändligt och > 0, fick { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m måste vara ändligt och > 0, fick { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg måste ligga i [-90, 90), fick { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = trajectory csv rad { $v1 }: inte tal: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = trajectory csv rad { $v1 }: förväntade 10 kolumner, fick { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = trajectory csv rad { $v1 }: tiden ökar inte

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = trajectory csv behöver minst två rader

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = trajectory csv täcker { $rows } s men scenariot körs { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: platsens lat_deg måste ligga i [-90, 90] och varje fält vara ändligt

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" är varken en GNSS-förinställning ({ $e_gnss }) eller en LEO-förinställning ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: ange användaren som `site` eller `user_ecef_m`, inte båda

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m måste vara ändligt och inte geocentrum

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satellit { $id }: azimut/elevation utanför intervallet

engine-e-geometry-sky-satellite-is-given-in = sky: satellit { $id } anges i ECEF; begäran behöver `site` eller `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satellit { $id }: ECEF-positionen är inte ändlig

engine-e-geometry-sky-satellite-coincides-with-the = sky: satellit { $id } sammanfaller med användaren

engine-e-geometry-sky-satellite-give-az-deg = sky: satellit { $id }: ange az_deg och el_deg, eller ecef_m, och inget annat

engine-e-geometry-sky-tle-is-bytes-the = sky: tle är { $text } bytes; gränsen är { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = elementuppsättningen avvisades: { $e }

engine-geometry-sky-tle-holds-no-complete = sky: tle innehåller ingen fullständig tvåradig elementuppsättning; { $n_ignored } rader ignorerades, den första: { $first }

engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. och { $more } till

engine-geometry-element-sets-propagated-by-the = { $n } elementuppsättningar propagerade med motorns SGP4 (WGS-72) till { $iso } och roterade till jordfast system med UT1 satt lika med UTC och utan polarrörelse: den himmel som de elementuppsättningarna ger vid den epoken, inte en mätning av den.

engine-geometry-element-sets-propagated-by-the-2 = { $n } elementuppsättningar propagerade med motorns SGP4 (WGS-72) till den nyaste elementuppsättningens epok plus time_s ({ $iso }). Ingen epok angavs, så det här är en representativ himmel, inte himlen för ett angivet datum.

engine-e-geometry-sky-give-systems-or-tle = sky: ange `systems` eller `tle` (med en `site`), eller `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system anger `tle`-satelliterna; begäran har ingen `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg måste ligga i [-90, 90), fick { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` behöver en `site` (eller `user_ecef_m`) att se från

engine-e-geometry-sky-time-must-be-finite = sky: time_s måste vara ändligt

engine-e-geometry-sky-system-asks-for-satellites = sky: systemet "{ $name }" ber om { $asked } satelliter; en begäran rymmer högst { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: fler än { $MAX_SATELLITES } satelliter

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` behöver en `site` (eller `user_ecef_m`) att se från

engine-e-geometry-sky-more-than-satellites-above = sky: fler än { $MAX_SATELLITES } satelliter över horisonten

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m måste vara positivt, fick { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence måste ligga i (0, 1), fick { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: fler än { $MAX_CLOCKS } system i sikte, vart och ett med egen klocka; gruppera satelliter under färre `system`-etiketter eller använd clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n måste ligga i 1..={ $MAX_MC_SAMPLES }, fick { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: för få satelliter i sikte för en positionsbestämning; inget Monte Carlo-moln

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = TLE-himmel vid { $e }, inte en mätning

engine-e-geometry-invalid-sky-request-json = ogiltig sky-begäran (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = ogiltig sky-begäran (TOML): { $e }

engine-e-geometry-invalid-skyline-json = ogiltig skyline (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = ogiltig skyline (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = felaktigt GLONASS-PRN i { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = sidtyp { $pt } kodas inte här

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bitar, förväntade { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bitar, förväntade { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = svansbitarna är inte noll

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q stämmer inte

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = sidtyp { $pt } avkodas inte här

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } symboler, förväntade { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = synkroniseringsmönstret hittades inte

engine-e-gnss-navmsg-gal-fnav-page-type-missing = sidtyp { $t } saknas

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav för sidtyp { $t } skiljer sig från sidtyp 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = inget Galileo-fält { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = ordtyp { $wt } kodas inte här

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bitar, förväntade { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = ordtyp { $wt } avkodas inte här

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = sidans delar måste vara 120 bitar

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = jämn/udda-flaggorna är inte 0 och sedan 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = inte en nominell sida (sidtyp 1 är en larmsida)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bitar, förväntade { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } symboler, förväntade { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = ordtyp { $t } saknas

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav för ordtyp { $t } skiljer sig från ordtyp 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = posten tillhör system { $system }, inte Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = typ 10 har inget fält { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = typ 11 har inget fält { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = typ 30 har inget fält { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV-kroppen har { $body } bitar, förväntade 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } eller TOW-räknare { $tow_count } utanför intervallet

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bitar, förväntade { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = preambeln är inte 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = meddelandetyp { $t } avkodas inte här

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = ett meddelande av typ 10 och ett av typ 11 behövs

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } vid LSB { $value2 } ryms inte i { $bits } { $v4 } bitar

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bitar, layouten kräver { $need }

engine-e-gnss-navmsg-no-field = inget fält { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } vid skala 2^{ $scale_pow2 } ryms inte i { $bits } { $v1 } bitar

engine-e-gps-lnav-no-value-for = inget värde för { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: referensmodellen "gfc" behöver `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: kan inte läsa gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: okänd referensmodell `{ $other }` (använd "egm2008" eller "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: okänd ellipsoid `{ $other }` (använd "wgs84" eller "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations måste vara minst 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations är begränsat till 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = felaktigt reellt tal '{ $t }'

engine-e-gravity-pds-bad-integer = felaktigt heltal '{ $t }'

engine-e-gravity-pds-empty-shadr-table = tom SHADR-tabell

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR-huvudet har { $f } fält, förväntade minst 6

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR-huvud: negativ grad/ordning eller okänd normalisering

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR-normaliseringstillstånd { $normalization } (bara fullständigt normaliserat, tillstånd 1, stöds)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR-referenslongitud/latitud måste vara 0

engine-e-gravity-pds-non-physical-gm-must-be = ofysikaliskt GM (måste vara ändligt och positivt)

engine-e-gravity-pds-non-physical-reference-radius-must = ofysikalisk referensradie (måste vara ändlig och positiv)

engine-e-gravity-pds-shadr-record-fields = SHADR-post { $v1 }: { $f } fält

engine-e-gravity-pds-shadr-record-bad = SHADR-post { $v1 }: felaktigt (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR-post { $v1 }: icke-ändlig koefficient

engine-e-gravity-pds-no-shadr-coefficient-records = inga SHADR-koefficientposter

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR-tabellen är ofullständig: saknar (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant saknas

engine-e-gravity-sh-missing-radius = radius saknas

engine-e-gravity-sh-non-physical-earth-gravity-constant = ofysikalisk earth_gravity_constant (måste vara ändlig och positiv)

engine-e-gravity-sh-non-physical-radius-must-be = ofysikalisk radius (måste vara ändlig och positiv)

engine-e-gravity-sh-no-gfc-coefficient-lines = inga gfc-koefficientrader

engine-e-gravity-sh-read-error = läsfel: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = rad { $lineno }: norm { $v } stöds inte (bara fully_normalized)

engine-gravity-sh-line-bad = rad { $lineno }: felaktigt { $what }

engine-e-gravity-sh-line-degree-above-the-declared = rad { $lineno }: grad { $n } över det deklarerade max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = rad { $lineno }: ordning { $m } över grad { $n }

engine-e-gravity-sh-line-time-variable-term-is = rad { $lineno }: tidsvariabel term `{ $key }` stöds inte (bara statiska modeller)

engine-e-gravity-sh-missing-end-of-head = end_of_head saknas

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s måste vara positivt, fick { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s måste vara positivt, fick { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase = scenariot ger { $n } epoker (≥ 2 behövs); öka duration_s eller minska step_s

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = posten innehåller ett icke-ändligt tidsfel

engine-e-holdover-test-unknown-mask-expected-one-of = okänd mask { $id }; förväntade en av { $masks }

engine-e-holdover-test-every-budget-max-abs-te = varje budgets max_abs_te_ns måste vara ändligt och positivt

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } ligger utanför posten ({ $t0_s } till { $t_end } s på dess egen tidsaxel)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } måste vara senare än gnss_removed_s ({ $gnss_removed_s }) och inte efter postens slut ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = holdover-steget innehåller inget sampel

engine-holdover-test-the-record-has-no-step = posten har inget { $step }-steg: GNSS togs bort vid dess första sampel

engine-holdover-test-the-step-has-samples-the = { $step }-steget har { $te_ns } sampel; skattarna behöver minst 13

engine-e-holdover-test-step-with-mask-has-no = ett steg med en mask har ingen kurva

engine-e-holdover-test-cannot-read-csv-path = kan inte läsa csv_path { $path }: { $e }

engine-holdover-test-recovered-after-gnss-returned = ; återhämtade sig { $t } s efter att GNSS återkom

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }{ $rec } (MODELLED, uppmätt mot masken)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m måste vara ändligt och > 0, fick { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba måste vara >= 0 och coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: de två benen har inte en gemensam medelvärdesbildningstid. Det optiska benet ackumulerar över integration_s = { $integration_s } s; RF-benets slingbrusbandbredd B_L = { $dll_bandwidth_hz } Hz medelvärdesbildar över 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Kvoten mellan två sigman tagna vid olika medelvärdesbildningstider är ingen jämförelse, så ingen anges. Ta bort åsidosättningen rf_dll_bandwidth_hz (den får då standardvärdet 1/(2*integration_s)) eller sätt den till { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: ett ben är inte ett användbart positivt ändligt sigma (optiskt { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), så ingen kvot bildas.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = okänt rf_band '{ $other }' (förväntade s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } måste vara ändligt

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db måste vara ändligt och >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint = hybrid-optical-rf | optiskt fotavtryck { $footprint_m } m, { $detected_photons } fotoner -> avståndsσ { $c } mm, tidsσ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | tillgänglighet { $c4 }% ({ $n_sites } platser) | överlämning utan hopp { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | gemensam FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Prövade mot oberoende extern referens: CRLB/χ²-PL/union/handoff; beräknade ur en modell: σ/klimatologi

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa måste ligga i [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class måste vara >= 1

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | detektor { $detector } | AUC { $auc_in } in / { $auc_out } ut (gap { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ mål { $target_pfa } | { $n_cases } fall | MODELLED syntetiskt

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = okänd detektor '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = okänd imu_grade { $other }; förväntade en av navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = okänd combination { $other }; förväntade en av rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = okänd trn_fix_mode { $other }; förväntade en av none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } måste vara ändligt och icke-negativt (fick { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m måste ange minst en tröskel

engine-e-inertial-coast-crossing-thresholds-entries-must-be = poster i crossing_thresholds_m måste vara ändliga och positiva (fick { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades måste ange minst en IMU-klass

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s måste vara ändligt och icke-negativt (fick { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 måste vara ändligt och icke-negativt (fick { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg måste vara ändligt och inom (-89, 89) (fick { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m måste ligga inom [-1000, 100000] (fick { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s måste vara positivt

engine-e-inertial-coast-drift-band-must-satisfy-lo = driftbandet måste uppfylla 0 < lo < hi (fick lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = serialiserar ins-trn-coast-resultat: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU, { $speed } m/s, kombination { $comb } | { $heads } | TRN { $mode } topp { $peak_error_m } m över { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va härlett ur fysiken hos kallatomsinterferometrar)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = scenariot är { $toml_text } bytes, över gränsen på { $max_bytes } bytes

engine-e-inline-only-the-scenario-kind-reads-its = scenariotypen `{ $kind }` läser sina data från filer på värden, så den här ytan kör den inte; använd kommandoraden `kshana`

engine-e-inline-only-the-field-names-file-this = fältet `{ $k }` anger en fil: den här ytan godtar bara inbäddat innehåll

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = trace JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = okänd datamängd `{ $key }`; tillåtna: { $v1 }, eller en egen datamängd

engine-e-interference-map-api-dataset-is-data-but-the = datamängden `{ $key }` är { $kind }-data men indatatypen är { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } är inte ett datum av formen YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = okänt alternativ `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = förväntade { $positionals } positionella argument, fick { $pos }

engine-e-interference-map-cli-cannot-read = kan inte läsa { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom behöver { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } finns redan; Kshana skriver inte över kartor. Ta bort den eller välj en annan --out-katalog

engine-interference-map-cli-note-cell-deg-is-not = obs: --cell-deg { $cell_deg } är inte den förhandsregistrerade cellstorleken ({ $PREREGISTERED_CELL_DEG }); kartorna anger det

engine-e-interference-map-cli-cannot-create = kan inte skapa { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = skrev { $path }: { $cells } celler publicerade, { $n_deg } flaggade

engine-interference-map-cli-no-usable-rows-nothing-written = inga användbara rader: inget skrevs

engine-e-interference-map-cli-unknown-subcommand = okänt underkommando `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = den nedladdade filens SHA-256 ({ $got }) stämmer inte med det fastlåsta värdet ({ $expected }); den kasserades

engine-e-interference-map-cli-cannot-write = kan inte skriva { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl hittades inte på PATH. Installera curl, eller ladda ner { $NATURAL_EARTH_LAND_URL } själv och kontrollera att dess SHA-256 är { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = kan inte köra curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = skrev { $out }: Natural Earth-landpolygoner, SHA-256 verifierad (public domain, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = inga trace_full_*-filer under { $path }

engine-e-interference-map-cli-cannot-read-2 = kan inte läsa { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } är inte ett datum av formen YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: felaktigt kartdatum

engine-e-interference-map-cli-cannot-write-2 = kan inte skriva { $out }: { $e }

engine-interference-map-cli-route-length-km = ruttlängd { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Förbehåll: en försämrad cell visar inte att störning är orsaken; celler som inte observerats är inget belägg för en klar rutt; det här är inte en prognos.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = landpolygoner: ogiltig JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = obligatorisk kolumn `{ $name }` saknas

engine-e-interference-map-cannot-read-input = kan inte läsa indata: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` är inte ett datum (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours måste vara { $MIN_DELAY_HOURS } eller mer: observatoriet publicerar inte tidigare

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg måste vara { $MIN_CELL_DEG } eller grövre: observatoriet publicerar bara grova celler

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } kan inte publiceras ännu: dess produkt släpps tidigast { $fmt_utc } ({ $delay_hours } h efter att dagen slutat)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORIUM  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLER  UTC-DAG  EJ OBSERVERAD ÄR INTE KLAR  INGEN ORSAK ANGES

engine-interference-map-observatory-source-licence = KÄLLA { $dataset }  LICENS { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } FÖRSÄMRADE  { $summary2 } EJ FÖRSÄMRADE  { $summary3 } EJ OBSERVERADE (PUBLICERADE CELLER)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana-observatoriet, ADS-B-karta över navigeringsnoggrannhet, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = kan inte skapa { $path } (Kshana skriver aldrig över produkter): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = indata saknar användbar rapport för { $day } (hittade dagar: { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } finns redan; Kshana skriver aldrig över produkter

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } celler publicerade, { $p2 } försämrade, { $p3 } incident(er)

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } rader återspelade under { $variants } varianter: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = kartan är inte giltig JSON: { $e }

engine-e-interference-map-route-route-invalid-json = route: ogiltig JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = route: rad { $v1 } är inte `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 }-export. Epok: { $epoch_note }. Rörliga objekt: GCRS (referenceFrame INERTIAL), meter, sekunder efter epoken. Fasta platser: jordfast WGS 84 (referenceFrame FIXED), meter.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Position: GCRS, meter.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Latitud { $lat_deg } deg, longitud { $lon_deg } deg, höjd { $h_m } m över WGS 84-ellipsoiden. Position: jordfast, meter.

engine-interop-czml-radius-along-the-ground = { $description }. Radie { $radius_m } m längs marken.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Utan tid: WGS 84-longitud och latitud i grader, fastlåst mot marken.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Jordfasta positioner; en MultiLineString klipps vid antimeridianen, och times_utc listar då bara de ursprungliga sampeln.

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 }-export. Epok: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = ogiltig GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString saknar coordinates-matris

engine-e-interop-geojson-an-rfc-7946-linestring-needs = en RFC 7946 LineString behöver två eller fler positioner

engine-interop-geojson-position-is-not-an-array = position { $i } är inte en matris med två eller tre tal

engine-interop-geojson-position-longitude-is-not-number = position { $i }: longituden är inte ett tal

engine-interop-geojson-position-latitude-is-not-number = position { $i }: latituden är inte ett tal

engine-e-interop-geojson-position-longitude-is-outside-180 = position { $i }: longituden { $lon } ligger utanför [-180, 180] (GeoJSON anger longitud först)

engine-e-interop-geojson-position-latitude-is-outside-90 = position { $i }: latituden { $lat } ligger utanför [-90, 90] (GeoJSON anger longitud först)

engine-e-interop-geojson-track-needs-two-or-more = ett spår behöver två eller fler färdpunkter

engine-e-interop-geojson-the-route-spans-more-than = rutten spänner över mer än 180 grader longitud; spårtyperna stegar i vanliga grader och kan inte korsa antimeridianen

engine-e-interop-geojson-position-is-deg-from-an = position { $worst } ligger { $worst2 } deg från ett jämnt fördelat rakt spår (tolerans { $tol_deg } deg); spårtyperna flyger start + i*step, så ange jämnt fördelade positioner på en linje, eller bara de två ändpunkterna

engine-e-interop-geojson-route-applies-to-the-kinds = en rutt gäller de typer som flyger ett spår av färdpunkter (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` tar ingen banindata

engine-e-interop-geojson-scenario-toml-is-not-table = scenario-TOML är inte en tabell

engine-e-interop-geojson-cannot-serialise-scenario = kan inte serialisera scenariot: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = okänt exportformat '{ $other }'; förväntade ett av czml, kml, geojson, stk, sigmf, all eller list

engine-e-interop-member = medlem { $label }: { $e }

engine-interop-the-scenario-could-not-be = scenariot kunde inte exporteras: { $m }

engine-e-interop-invalid-spectrum-scenario = ogiltigt spektrumscenario: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than = { $n } tidssampel är fler än en export skriver ({ $MAX_SAMPLES })

engine-e-interop-scene-objects-samples-is-more-than = { $items } objekt x { $times } sampel är fler än en export skriver ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = ogiltigt { $kind }-scenario: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type }-jammer, { $power_dbw } dBW sändareffekt, { $gain_dbi } dBi antennförstärkning

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, från länkekvationerna i jamming-typen med jammern vid mottagarens horisont och friutrymmesförlust

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (kedjans [pass]-steg)

engine-interop-scene-circular-orbit-km-altitude-deg = cirkulär bana, { $altitude_km } km höjd, { $inclination_deg } deg inklination (SGP4-medelelement vid fönstrets början, så som passes-typen propagerar den)

engine-interop-scene-ground-station-deg-elevation-mask = markstation, { $mask_deg } deg elevationsmask

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; GCRS- och jordfasta tillstånd är ephemeris-typens egna utdata (UT1 och polrörelse så som scenariot anger dem)

engine-interop-scene-static-scene-the-kind-flies = statisk scen: { $kind }-typen flyger ett spår av färdpunkter utan tid

engine-interop-scene-true-track-flown-gps-denied = verkligt spår flugit utan GPS: { $track } färdpunkter från start_lat_deg/start_lon_deg i steg om step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` har ingen scen

engine-e-interop-scene-missing-numeric = numeriskt `{ $k }` saknas

engine-e-interop-scene-missing-integer-waypoints = heltalet `waypoints` saknas

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } ligger utanför 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } på { $altitude_km } km, { $inclination_deg } deg inklination (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = scenariot anger ingen `epoch`; t = 0 är { $epoch }, den tidigaste epok som satelliternas egna data bär (TLE-, sändningsefemerid- eller SP3-epok). Varje satellit propageras från sin egen epok, och dessa spänner över { $spread_h } h: tidsetiketterna följer motorns förutsättning att varje satellit startar vid t = 0, medan varje position roteras till GCRS- och jordfasta system vid den satellitens egna tidpunkt. SP3- och OEM-exporterna anger i stället t = 0 som 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = scenariot anger ingen `epoch`; t = 0 är { $epoch }, den epok som satelliternas egna data bär (TLE-, sändningsefemerid- eller SP3-epok). SP3- och OEM-exporterna anger i stället t = 0 som 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objekt x { $times_s } sampel är fler än en export skriver ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = { $user_environment }-användare, rörlig (typens konstanta hastighet och kurs)

engine-interop-scene-user-receiver = { $user_environment }-användare (mottagare)

engine-interop-scene-user-orbit-km-altitude-deg = användarbana, { $altitude_km } km höjd, { $inclination_deg } deg inklination (Kepler{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = inget rörligt objekt { $index }

engine-interop-stk-kshana-export-object = # Kshana { $v1 }-export: { $scene }, objekt { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type }-jammer, { $power_dbw } dBW sändareffekt, { $gain_dbi } dBi antennförstärkning (en parameter i scenariots länkbudget, inte en signal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` har ingen fordonsbana att exportera; testbänksexporten omfattar typerna gnss-ins, jamming och gnss-sim

engine-e-interop-testbench-empty-motion-csv = tom rörelse-CSV

engine-e-interop-testbench-motion-csv-header-is-not = rörelse-CSV:ns huvud har inte de förväntade kolumnerna: { $head }

engine-e-interop-testbench-row-fields-expected = rad { $v1 }: { $f } fält, förväntade { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = rad { $v1 }: kolumn { $motion_columns } är inte ett tal

engine-e-interop-testbench-line-no = rad { $v1 }: inget `$`

engine-e-interop-testbench-line-no-checksum = rad { $v1 }: ingen kontrollsumma

engine-e-interop-testbench-line-bad-checksum-field = rad { $v1 }: felaktigt kontrollsummefält

engine-e-interop-testbench-line-checksum-mismatch = rad { $v1 }: kontrollsumman stämmer inte

engine-e-interop-testbench-line-short-gga = rad { $v1 }: för kort GGA

engine-interop-testbench-line-bad-latitude = rad { $v1 }: felaktig latitud

engine-interop-testbench-line-bad-longitude = rad { $v1 }: felaktig longitud

engine-e-interop-testbench-line-bad-altitude = rad { $v1 }: felaktig höjd

engine-e-interop-testbench-line-bad-separation = rad { $v1 }: felaktig separation

engine-e-interop-testbench-line-short-rmc = rad { $v1 }: för kort RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = rad { $v1 }: RMC utan föregående GGA

engine-e-interop-testbench-line-gga-and-rmc-times = rad { $v1 }: GGA- och RMC-tiderna skiljer sig

engine-e-interop-testbench-line-bad-speed = rad { $v1 }: felaktig hastighet

engine-e-interop-testbench-line-bad-course = rad { $v1 }: felaktig kurs

engine-e-interop-testbench-line-bad-time-or-date = rad { $v1 }: felaktig tid eller datum

engine-e-interop-testbench-gga-with-no-following-rmc = en GGA utan efterföljande RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = en färdpunktsfil behöver minst två sampel

engine-e-interop-testbench-the-sample-step-is-not = samplingssteget { $step } s är inte ett helt antal millisekunder

engine-e-interop-testbench-the-samples-are-not-equally = samplen är inte jämnt fördelade: intervall { $v1 } är { $dt } s, det första är { $step } s

engine-e-interop-testbench-empty-waypoint-file = tom färdpunktsfil

engine-e-interop-testbench-waypoint-not-three-numbers = färdpunkt { $v1 }: inte tre tal

engine-e-interop-testbench-waypoint-fields-expected = färdpunkt { $v1 }: { $f } fält, förväntade 3

engine-e-interop-testbench-events-csv-header-is-not = huvudet i händelse-CSV är inte label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = händelserad { $v1 }: förväntade 5 fält

engine-e-interop-testbench-event-row-unknown-kind = händelserad { $v1 }: okänd typ { $f }

engine-e-interop-testbench-event-row-bad-onset = händelserad { $v1 }: felaktig start

engine-e-interop-testbench-event-row-bad-end = händelserad { $v1 }: felaktigt slut

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-interop-testbench-no-waypoints-txt-written = ingen .waypoints.txt skriven: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = inte en UTC-tid `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = { $what } saknas

engine-e-ionex-bad-number-in = { $what }: felaktigt tal i { $col }

engine-e-ionex-two-digit-year = { $what }: tvåsiffrigt år { $year }

engine-e-ionex-no-end-of-header = ingen END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = höjdberoende (3D) IONEX-kartor stöds inte

engine-e-ionex-zero-grid-step = rutnätssteg noll

engine-e-ionex-grid-needs-at-least-nodes = rutnätet behöver minst 2 x 2 noder

engine-e-ionex-map-no = karta { $index }: ingen { $end_label }

engine-e-ionex-map-band-latitude-header-grid = karta { $index }: band { $band } latitud { $band_lat }, huvudets rutnät { $want }

engine-e-ionex-map-band-longitudes-differ = karta { $index }: band { $band } longituder skiljer sig

engine-e-ionex-map-band-truncated = karta { $index }: band { $band } avkortat

engine-e-ionex-map-bands-header-grid-has = karta { $index }: { $band } band, huvudets rutnät har { $n_lat }

engine-e-ionex-map-no-epoch-of-current = karta { $index }: ingen EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } TEC-kartor, huvud # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = TEC-kartornas epoker ökar inte

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz rymmer inte ett helt antal sampel per { $code }-period ({ $spc } sampel)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods och noncoherent måste vara positiva

engine-e-iq-acq-stream-ended-after-of-samples = strömmen tog slut efter { $got } av { $needed } sampel

engine-e-iq-acq-cfar-reference-cells-must-be = CFAR-referensceller måste vara ett jämnt tal och minst 2 (fick { $n })

engine-e-iq-acq-cfar-stride-must-be-at = CFAR-steget måste vara minst 1 lag

engine-e-iq-acq-cfar-per-cell-pfa-must = CFAR-Pfa per cell måste ligga i (0, 1) (fick { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = CFAR-fönstret når { $reach } lag åt vardera hållet, för brett för en period på { $samples_per_period } lag

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = okänt ytformat { $s }: förväntade csv, json eller bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = ytan skulle rymma { $spc_cells } celler (gräns { $MAX_SURFACE_CELLS }): vidga Doppler-steget eller smalna av Doppler-intervallet

engine-e-iq-acq-surface-surface-header = ythuvud: { $e }

engine-e-iq-acq-surface-surface-schema-expected = ysschema { $schema }; förväntade { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = ykropp: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = inspelning '{ $id }': format och sample_rate_hz måste anges tillsammans

engine-e-iq-campaign-conditions-test-conditions-json = testvillkor (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = testvillkor (TOML): { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf kräver en SigMF-inspelning (fick { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF-metadata: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF-metadata: global core:sample_rate saknas

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start saknas

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: ingen core:sample_count och inga effektpunkter som avslutar händelsen

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema måste vara "{ $SCHEMA }" (fick "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id får inte vara tomt

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s måste vara ändligt och >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 måste vara 64 hexsiffror

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind måste vara "iq" eller "receiver-log" (fick "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = minst en [[expected]]-grupp krävs

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids får inte vara tomt

engine-e-iq-campaign-conditions-lists-value-give-one-per = { $at }: { $key } listar { $n } värde(n); ange ett per id ({ $ids })

engine-e-iq-campaign-conditions-duplicate-id = { $at }: dubblerat id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s måste ligga efter onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects måste vara "all" eller en lista med id

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: affects-id { $bad } finns inte i [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q måste vara positivt

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points får inte vara tomt

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points måste vara i tidsordning

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points måste vara ändliga

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" kräver reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = händelserna '{ $id }' och '{ $id2 }' överlappar på en gemensam satellit

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s måste vara >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s måste vara positivt

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = inspelning '{ $id }': SHA-256 { $sha } stämmer inte med den angivna { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: inspelningen innehåller { $buf } sampel, { $n } behövs för att göra en infångning

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s måste vara positivt

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db måste vara positivt

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s måste vara >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz måste vara positivt

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs måste vara minst 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = kampanj (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = kampanj (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions måste lista minst en fil eller glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds måste vara >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = frontend-namn måste vara icke-tomma och unika ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' matchar ingen fil

engine-e-iq-campaign-spec-recording-id-appears-in-both = inspelnings-id '{ $w }' finns i både { $w2 } och { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names kräver inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: ingen utformning '{ $n }' i { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = referensrad { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0-profil: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0-profil: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i }: stegvärden måste vara ändliga

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i }: ramp kräver end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i }: points kräver lika långa, icke-tomma t_s och db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i }: t_s måste öka strikt

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i }: points måste vara ändliga

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i }: fade s4 måste ligga i (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i }: fade tau_s måste vara positivt

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: inspelningen innehåller { $samples } sampel, { $need } behövs för den här sökningen

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: ange formatet med --surface-format csv|json|bin, eller låt sökvägen sluta på .csv, .json eller .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = infångning: { $fs_hz } Hz, { $coherent_periods } koherent(a) period(er) x { $noncoherent } icke-koherenta, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = rapporten återskapad: { $cells_present } av { $cells_total } cell(er), { $rows } rad(er), { $rows_failed } underskrider en tröskel; digest { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    kampanj { $name }: { $cells_total } cell(er); { $cells_skipped } redan klara, { $cells_run } körs nu, { $cells_failed } misslyckade, { $cells_pending } väntande
    utdata: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    första felet ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: { $events } händelse(r), { $tc } förväntad(e) satellit(er); villkorshash { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono snedlinje { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono vertikal { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scint S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = multipath { $h }m { $multipath_ground } mark

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground måste vara dry, wet eller sea (fick { $other })

engine-e-iq-cli-channel-give-at-most-one-of = ange högst en av --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass vill ha lo,hi (fick { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass kräver lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } med övergång { $transition } Hz ryms inte under fs/2 ({ $v1 } Hz); smalna av bandet eller övergången

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits måste vara 1..=16 (fick { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = filtrerade { $total } sampel ({ $fs_hz } Hz) till { $out } ({ $format }); sidecar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = kan inte läsa { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = ogiltigt labfit-scenario: { $e }

engine-iq-cli-labfit-fitted-run-wrote = anpassade { $runs } körning(ar); skrev { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = anpassade { $fit_units } enhet(er) från kampanjen; skrev { $written }

engine-iq-cli-labfit-cannot-write = kan inte skriva { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } behöver ett värde

engine-e-iq-cli-cannot-parse = { $k }: kan inte tolka { $v }

engine-iq-cli-iq-takes-positional-argument-got = iq { $cmd } tar { $n } positionsargument, fick { $pos }

engine-e-iq-cli-cannot-parse-2 = { $k }: kan inte tolka { $p }

engine-iq-cli-unknown-iq-processing-command-expected = okänt iq-bearbetningskommando { $other }; förväntade scene, acquire, track, sweep, labfit, frontend, monitor, campaign eller conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } ligger utanför intervallet för GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = ingen frisk GPS-efemerid hittades för de begärda PRN

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos vill ha lat,lon,alt (fick { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; C/N0-profil ({ $segments } segment)

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format måste vara csv eller jsonl (fick { $other })

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ; heltalsskala: 1 LSB = { $sc } brusnormaliserade enheter (förväntad RMS { $v1 } LSB per komponent), { $clipped } element klippta

engine-iq-cli-scene-written-by-kshana-iq-scene = skriven av kshana iq scene: en SIMULERAD scen, inte en inspelning{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = ION SDR-metadata { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF-data { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = skriven av kshana iq scene{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = skrev { $samples } sampel ({ $format }, { $fs_hz } Hz) till { $data_path }; { $truth_records } referensposter till { $truth_path }; { $meta_note }; kanal: { $chan_desc }{ $scale_note }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } kan inte kombineras med --design: sweep kör varje utformning i filen

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = svep över slingutformning: { $rows } (utformning, PRN)-resultat{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: inspelningen innehåller { $samples } sampel, { $need } behövs för att göra en infångning

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: inte infångad (statistik { $statistic } < tröskel { $threshold }); höj --doppler-max, --acq-coherent eller --acq-noncoherent, eller kontrollera inspelningen

engine-iq-cli-track-designs-and-differ-in-integration = utformningarna { $first } och { $d } skiljer sig i integration.extra_taps_chips; utformningarna i en körning måste stämma överens så att varje utdatapost har samma kolumner

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: ange formatet med --epochs-format csv|jsonl|bin, eller låt sökvägen sluta på .csv, .jsonl eller .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz är { $r } sampel per chip av { $c }: kommensurabel sampling gör kodens diskriminator till en trappa (vid 2 sampel/chip dithrar DLL, cirka 0.09 chip RMS kodfel vid 45 dB-Hz); kodslingans jitter och bias från den här inspelningen är inte representativa. Använd en hastighet som inte är en multipel av halva chiphastigheten för att bedöma kodslingor.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = arbetaren avslutades innan den bearbetade den här indatan

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = okänt alternativ { $s }

engine-e-iq-io-cli-format-needs-rate = --format kräver --rate

engine-iq-io-cli-iq-takes-path-argument-got = iq { $cmd } tar { $n } sökvägsargument, fick { $pos }

engine-iq-io-cli-unknown-iq-command = okänt iq-kommando { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated = skrev { $n } sampel ({ $to }, { $fs_hz } Hz) till { $files }; { $w } mättade element{ $v4 }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow läser bara enkanaliga inspelningar

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow läser en inspelning med en capture, den här har { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: ingen positiv core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: capture börjar inte på en bytegräns

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = okänt samplingsformat { $name }: förväntade t.ex. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, eventuellt med _qi som ändelse för komplex

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sidecar sample_rate_hz { $sample_rate_hz } är inte positivt

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: .sdrx-inspelningar innehåller en ström; kanal { $channel } finns inte

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: rå fil utan sidecar; ange dess format, eller skriv { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = kan inte serialisera raden: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = ogiltig filterutformning { $design }: passband_frac i (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz måste ligga strikt mellan 0 och halva samplingshastigheten ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx-data: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-bitars { $enc } { $fmt } ({ $packed_bits } bitar/sampel)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = SigMF core:datatype { $datatype } stöds inte: de som stöds är ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be och de reella ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } är inte en SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = ogiltig SigMF-metadata: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } har ingen SigMF core:datatype; skriv det som raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } stämmer inte med den första inspelningens { $c0 }

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: ingen core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } är inte positiv

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } vid { $rate } Hz stämmer inte med den första inspelningens { $f0 } vid { $r0 } Hz

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out = { $name }: capture vid sampel { $sample_start } är i fel ordning eller ligger bortom de { $n_file } sampel som finns i datan

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: första capture börjar inte på en bytegräns

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = kanal { $channel } begärd; inspelningen har { $channels } (kanaler räknas från 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = ogiltig SigMF-collection: { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } stämmer inte med collectionens { $h }

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = ström { $select } av { $channels } sammanflätade strömmar finns inte (strömmar räknas från 0)

engine-e-iq-io-stream-sample-of-does-not-start = sampel { $k } av { $format } börjar inte på en bytegräns

engine-e-iq-io-stream-time-window-start-duration-both = tidsfönster start { $start_s } s, längd { $duration_s } s: båda måste vara icke-negativa

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = mest skadliga angivna Q (cw): inget tabellvärde för typen `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: kampanjen är inte komplett

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } stämmer inte med cellerna ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = inspelning `{ $id }`: hashen för testvillkoren { $h } stämmer inte med den registrerade { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signal `{ $signal }`: okänd chiphastighet

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = ingen körning är användbar för låsanpassningen: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = otillräckliga data: inte anpassad ({ $m } inspelningar; minst { $min_rec } behövs)

engine-iq-labfit-iqfit-uncensored-span-db-is-under = ocensurerat J/S-spann { $span_db } dB är under { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff och delta kan inte identifieras separat (|corr| { $full } >= { $v2 }): modellen beror bara på delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed = inte anpassad: { $n_reacq } återinfångningar observerade (minst 3 behövs)

engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = okänt läge `{ $m }` (bara `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage måste vara [lower, upper] inom [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds måste vara [lower, upper] med 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db måste vara [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = kampanjen har ingen händelse med en angiven effektprofil att anpassa

## src/iq/labfit/iqreport.rs

# legal: native review
engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Labbanpassning från IQ-kampanj: { $r }

    Schema `{ $schema }`, motor { $engine_version }. Etikett: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = Kampanj-DIGEST `{ $campaign_digest }`; `campaign.json` SHA-256 `{ $campaign_json_sha256 }`; scenario SHA-256 `{ $scenario_sha256 }`; { $cells } celler; { $bootstrap } bootstrap-replikat (frö { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Enhet { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Status: { $status }. { $recordings } inspelningar, { $satellites } satelliter, { $events } händelser; { $bins_used } intervall anpassade, { $bins_censored } censurerade.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0-modell ({ $q_mode }): `delta_eff` = { $ci } dB (den identifierbara förskjutningen, relaterad till Q = 1); `Q_eff` = { $q }; `delta` vid det Q = { $ci2 } dB; corr(Q, delta) { $om }; residual-RMS { $residual_rms_db } dB över ett J/S-spann på { $span_db } dB. Q_eff kan inte identifieras ur C/N0-data utan en oberoende effektmätning.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q hålls vid sitt angivna värde: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = Tröskel-J/S, direkt: median { $om } dB över { $n } förluster (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Undanhållen datamängd (en inspelning utelämnas åt gången), interpolation: { $bins } intervall, C/N0-RMS { $om } dB, PI90-täckning { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = ; { $model }: { $n } händelser, förlusttids-RMS { $om } s, PI90-täckning { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    Valideringstabell SHA-256 `{ $table_sha256 }` (registrerad { $registered }):

    | tröskel | gräns | värde | utfall |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = körning `{ $label }` logg

engine-e-iq-labfit-run = körning `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = scenariots [input] anger ingen kampanj

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign och [[runs]] utesluter varandra: ange en av dem

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit-scenario: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = loggen har ingen C/N0 per satellit{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = ingen epok före starten vid { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = ingen epok vid eller efter starten vid { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Labbanpassning: { $r }

    Etikett: **{ $label }**. Inställningar SHA-256 `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db = { "\u000A" }{ $n_samples } C/N0-sampel, residual-RMS { $om } dB.{ $r }{ "\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Modell: { $model } ({ $label })

    | parameter | värde | gränser | vid gräns | bootstrap-sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }Händelsetids-RMS { $om } s över { $n_events } händelser; förluster missade { $loss_missed } / extra { $loss_extra }, återinfångningar missade { $reacq_missed } / extra { $reacq_extra }.

    | körning | fall dB-Hz | återlåsning dB-Hz | händelser | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Undanhållen datamängd ({ $scheme }, { $folds } delmängder): alla { $om } s, interpolation { $om2 } s, extrapolation { $om3 } s.

    | undanhållen körning | klass | avstånd | närmaste träningskörning | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } är reserverat för framtida bruk (bara FID 0 är definierat)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } ligger utanför 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } SB1-symbol(er) avviker från det avkodade fältet

engine-iq-lunanet-afs-frames-at-and-are-symbols = ramar vid { $w } och { $w2 } ligger { $gap } symboler isär, inte { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } följer på TOI { $w2 }, förväntade { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = oväntat tecken { $c } i en symbolström (bara 0, 1 och blanksteg)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: de första 24 chipen skiljer sig

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: de sista 24 chipen skiljer sig

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (dokumentet anger A14850 för både PRN 147 och PRN 151; generatorn återskapar PRN 151:s, så posten för PRN 147 är med största sannolikhet ett tryckfel i dokumentet)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = kodat 0x{ $word }, avkodat FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = övervakningsinställningar: { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = statisk position är inte ändlig

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = bana med konstant hastighet är inte ändlig

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = färdpunktsbanan har inga färdpunkter

engine-e-iq-scene-geometry-waypoint-not-finite = färdpunkt är inte ändlig

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = färdpunktstider måste öka strikt

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } är inte en GPS C/A PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = efemeridsystemet { $system } är inte GPS

engine-e-iq-scene-satellite = satellit { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = är en pilotkomponent (utan data) och bär inga navigeringsdata

engine-e-iq-scene-nav-carries-data-the-scene-does = bär data som scenen inte modellerar; generera det utan data

engine-e-iq-scene-nav-does-not-carry-gps-lnav = bär inte GPS LNAV (bara GPS L1 C/A gör det); använd seedade data

engine-e-iq-scene-nav-not-an-lnav-source = inte en LNAV-källa

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = en scen behöver minst en satellit (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler listar { $dopplers } värde(n); ange ett per --prn ({ $ids }) eller ett enda värde

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = referensraden har { $f } fält, förväntade 10

engine-e-iq-scene-truth-truth-field = referensfält { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = referens sat_id: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz måste vara ett positivt tal

engine-e-iq-short-duration-must-be-in = duration_s måste ligga i (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids måste innehålla 1 till { $MAX_SATELLITES } satelliter

engine-e-iq-short-dopplers-must-be-finite = dopplers måste vara ändliga

engine-e-iq-short-samples-requested-short-run-holds = { $n } sampel begärda; en kort körning rymmer högst { $MAX_SAMPLES }

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C data PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C pilot PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } ligger utanför intervallet

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF-frekvenskanal { $id } ligger utanför -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = okänd signal { $other }; förväntade en av: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = rad { $v1 }: inget ';'

engine-e-iq-signals-galileo-line-no-code-number-in = rad { $v1 }: inget kodnummer i { $label }

engine-e-iq-signals-galileo-code-appears-twice = kod { $number } förekommer två gånger

engine-e-iq-signals-galileo-codes-the-icd-defines = { $path }: { $n } koder, ICD definierar { $CODES_PER_COMPONENT }

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

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primär { $primary_prn } S{ $secondary } tertiär { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primär { $primary_prn } S{ $secondary } (tertiär utelämnad)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = icke-hex-tecken { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } hex-symboler kan inte rymma exakt { $len } chips

engine-iq-signals-primary-only = { $name } (endast primär)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC-spårning behöver ett early-late-avstånd i (0, { $max }) chips så att E och L stannar på huvudtoppen (fick { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = bump-jump-tröskeln måste vara minst 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = samplingshastigheten måste vara positiv

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods måste vara positivt

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows måste vara positivt

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } måste dela bitlängden { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = högst { $MAX_EXTRA_TAPS } extra tappar stöds (fick { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = förskjutningarna för extra tappar måste vara ändliga och inom ±{ $MAX_TAP_OFFSET_CHIPS } chips (fick { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = ett C/N0-fönster behöver minst 2 prompt-värden

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: förväntade atan2, costas-atan eller costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: förväntade cross-product, atan2 eller atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: förväntade pull-in eller always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: förväntade eml-power, dot-product eller eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: förväntade pll, fll eller fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } gäller inte för carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: förväntade ett tal >= 0 (0 inaktiverar begränsningen)

engine-e-iq-track-design-must-be-positive-number-got = { $k } måste vara ett positivt tal (fick { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods måste vara minst 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips måste ligga i (0, 2] (fick { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips rymmer högst { $MAX_EXTRA_TAPS } förskjutningar (fick { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = förskjutningarna i integration.extra_taps_chips måste vara ändliga och inom ±{ $MAX_TAP_OFFSET_CHIPS } chips (fick { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) måste vara under carrier.fll_off_pli ({ $off }), båda i (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s måste vara noll eller positivt (fick { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s måste vara positivt (fick { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order måste vara 1, 2 eller 3 (fick { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order måste vara 1 eller 2 (fick { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order måste vara 1 eller 2 (fick { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold måste ligga i [-1, 1] (fick { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows måste vara minst 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods måste vara minst 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) får inte vara under lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db måste vara ändligt

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes måste vara minst 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods måste vara minst 1 (eller "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent måste vara minst 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa måste ligga i (0, 1) (fick { $pfa })

engine-e-iq-track-design-design-overrides = åsidosättningar av utformningen: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = åsidosättningar av utformningen får inte sätta name eller extends

engine-e-iq-track-design-loop-design-file = slingutformningsfil: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = slingutformningsfil: schemat { $other } stöds inte; förväntade { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = slingutformningsfil: schema = { $SCHEMA } saknas

engine-e-iq-track-design-loop-design-file-no-design = slingutformningsfil: inga [[design]]-tabeller

engine-e-iq-track-design-loop-design-file-design-number = slingutformningsfil: [[design]] nummer { $v1 } saknar namn

engine-e-iq-track-design-loop-design-file-design-name = slingutformningsfil: utformningsnamnet { $name } är reserverat eller tomt

engine-e-iq-track-design-loop-design-file-design-is = slingutformningsfil: utformningen { $name } är definierad två gånger

engine-e-iq-track-design-no-design-named-the-file = ingen utformning med namnet { $n }; filen innehåller { $value }

engine-e-iq-track-design-loop-design-file-design-extends = slingutformningsfil: utformningen { $name } utökar sig själv (en cykel)

engine-e-iq-track-design-loop-design-file-design-extends-2 = slingutformningsfil: utformningen { $name } utökar en okänd utformning { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = fasslingan behöver ordning 1..=3 och Bn > 0 (fick { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = frekvensslingan behöver Bn > 0 (fick { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = frekvensslingans ordning måste vara 1 eller 2 (fick { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = ett slingfilter behöver en fasväg, en frekvensväg eller båda

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = early-late-avståndet måste ligga i (0, 2] chips (fick { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = DLL-ordningen måste vara 1 eller 2 (fick { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = chiphastigheten och bärvågsfrekvensen måste vara positiva

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = en epok har { $extra } extra tappar men utdata var ställd för { $n }: alla kanaler i en körning måste använda samma extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = en post är { $b } bytes; förväntade { $want }

engine-e-iq-track-sink-unknown-lock-state-code = okänd låstillståndskod { $b }

engine-e-iq-track-sink-epoch-file-header = epokfilens huvud: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = epokfilens schema { $schema }; förväntade { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = epokfilens poster är { $record_bytes } bytes; den här läsaren förväntar { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } per extra tapp)

engine-e-iq-track-sink-epoch-file-ends-inside-record = epokfilen slutar mitt i en post ({ $got } av { $size } bytes)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = epokformat { $o }: förväntade csv, jsonl eller bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` är inte ett tal

engine-e-jammertest-cli-is-not-utf-text = { $path } är inte UTF-8-text

engine-e-jammertest-cli-needs-catalog = kräver --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = kräver minst en --plan

engine-e-jammertest-cli-is-not-utf = { $cat } är inte UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } är inte UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` är inte ett av ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` är inte UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = kräver --log-start eller --log med --format

engine-e-jammertest-cli-log-needs-format = --log kräver --format

engine-e-jammertest-cli-the-log-does-not-state = loggen anger inte sin starttid: använd --log-start

engine-e-jammertest-cli-the-log-states-its-start = loggen anger sin start som `{ $label }`: använd --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } är inte UTF-8

engine-e-jammertest-cli-cannot-write = kan inte skriva { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } händelser av typen { $SCHEDULED_TRUTH } skrivna till { $o } ({ $skipped_non_rf } icke-RF-slottar hoppades över, { $outside_log } utanför loggen, { $unknown_ids } id saknas i katalogen)

engine-jammertest-cli-note-ids-not-in-the = obs: id som saknas i katalogen: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = obs: det här är planens schemalagda slottar, inte registrerade sändningstider.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  testnamn

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } tester, { $evaluable } utvärderingsbara: { $detected } detekterade inom toleransen, { $late } sena, { $missed } missade; medianfördröjning { $fmt_opt }, mediantid till återhämtning { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = falsklarm utanför alla slottar: { $false_alarm_runs } körningar, { $false_alarm_epochs } av { $clean_epochs } rena epoker

engine-e-jammertest-cli-needs-session-path = kräver en sessionssökväg

engine-e-jammertest-cli-needs-catalog-and-plan-or = kräver --catalog och --plan, eller --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = bevispaket skrivet till { $out }; signerarens fingeravtryck { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = ingen mapp med en scenario.json och en .ubx under { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = scenario: { $e }

engine-e-jammertest-dataset-read = läsning: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json saknar datum

engine-e-jammertest-dataset-scenario-json-date-is-not = scenario.json-datumet `{ $date }` är inte ett datum

engine-e-jammertest-dataset-no-readable-epoch-in-mon = ingen läsbar epok i mon_rf.csv eller rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = ingen mapp med en scenario.json under { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } återhämtade ({ $recovered } av { $alarmed }), median { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = loggen anger sin start som `{ $l }`, vilket inte är UTC ISO-8601: ange starten explicit

engine-e-jammertest-the-log-does-not-state = loggen anger inte sin starttid: ange den explicit

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = katalogen är inte JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = katalogen saknar matrisen `test_types`

engine-e-jammertest-plan-test-type-has-no-type = en testtyp saknar `type_id`

engine-e-jammertest-plan-test-group-has-no-group = en testgrupp saknar `group_id`

engine-e-jammertest-plan-test-has-no-test-id = ett test saknar `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = katalogen listar inga tester

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` är inte en plantid som 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = planen är inte JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = planen saknar matrisen `locations`

engine-e-jammertest-plan-test-end-time-is-not = test { $id }: end_time ligger inte efter start_time

engine-e-jammertest-plan-the-plan-has-no-test = planen har inget testområde { $l }; den har { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = planen har flera testområden { $areas }; ange i vilket av dem loggen spelades in

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json är inte JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = ingen matris `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024 test { $id } fönster { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log innehåller inget start-/slutfönster

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } schemalagda händelser men körningen poängsatte { $events2 }: ange körningens egna händelser

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s måste vara positivt och guard_s inte negativt

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m måste lista minst ett element

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m måste vara ändligt

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: förväntade "null-steering" eller "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz måste vara positivt (fick { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: sektionen behöver en [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) måste vara ändligt och vid eller över tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s måste vara ändligt och icke-negativt (fick { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits måste vara 1 till 16 (fick { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz måste vara positivt (fick { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side måste vara minst 2 (fick { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } måste vara ändligt (fick { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } måste vara positivt (fick { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: profilpunkt { $points } ({ $lat }, { $lon }) ligger utanför DEM-rutan

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: profilpunkt { $points } ({ $lat }, { $lon }) ligger på ett DEM-hål

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC-kalenderdatum utanför intervallet: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = inget sådant kalenderdatum: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC-sekund { $second } utanför intervallet vid { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = en uppskjutningsplats vid polen har ingen definierad azimut

engine-e-launch-inclination-unreachable-from-latitude-without = inklinationen { $inclination_rad }° kan inte nås från latituden { $lat_rad }° utan en dogleg (kräver |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = platshastigheten vid den sanna polen behöver både `epoch` och `eop_finals2000a` (en riktig IERS finals2000A-kropp)

engine-e-launch-site-lon-deg-must-be = site_lon_deg måste vara i [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a innehöll inga läsbara IERS finals2000A-rader

engine-e-launch-epoch-mjd-is-outside-the = epok { $epoch } (MJD { $mjd_utc }) ligger utanför de angivna EOP-raderna (MJD { $mjd } till { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg måste vara i [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg måste vara i [0, 180]

engine-launch-launch-window-lat-az-asc = launch-window: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° asc, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s bonus från jordrotationen, { $opportunities } tillfällen/dygn (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = varje avståndshastighet behöver en positiv, ändlig sigma

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = { $n_meas } mätningar kan inte lösa { $n } Doppler-obekanta

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = Doppler-geometrin är singulär

engine-e-leo-fusion-doppler-no-covariance = ingen kovarians

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = varje pseudoavstånd behöver en positiv, ändlig sigma

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = { $obs } pseudoavstånd kan inte lösa { $n } obekanta (3 position + { $n_clock } klockor)

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = en satellit sammanfaller med positionsskattningen

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = geometrin är singulär

engine-e-leo-fusion-joint-pvt-no-iteration-ran = ingen iteration kördes

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = degenererad slutgeometri

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP är inte ändlig

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } måste vara positivt

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m måste vara icke-negativt och körningen högst 5000 epoker

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = varje signal behöver en positiv bandbredd

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz = 5G NTN-positionsbestämning vid { $r } MHz, C/N0 { $r2 } till { $r3 } dB-Hz, { $n_satellites } satelliter ({ $mean_in_view } i sikte){ "\u000A" }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, CRB-avstånd { $range_sigma_zenith_m } till { $range_sigma_mask_m } m; formell median i 3D { $s2 } m, RMS-fel { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples = { "  " }Doppler-pass med en satellit: { $n_obs } sampel över { $duration_s } s, horisontellt fel { $horizontal_error_m } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP behöver minst ett system

engine-e-leo-fusion-ppp-duration-and-step-must-be = varaktighet och steg måste vara positiva med högst 20000 epoker

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs måste vara 1 till 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = konvergenströsklarna måste vara positiva

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical = PPP-konvergens till { $criterion_horizontal_m } m horisontellt / { $criterion_vertical_m } m vertikalt, { $runs_per_case } körningar per fall, { $n_gnss } GNSS-satelliter{ "\u000A" }

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  median { $c } min  konvergerade { $v4 }%  NEES medel { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = horisontellt medianfel över { $runs_per_case } körningar · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = förinställningen { $id } har ingen signal

engine-e-leo-fusion-presets-preset-has-no-signal-it = förinställningen { $id } har ingen signal { $n }; den har { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = okänd LEO-förinställning { $id }; kända: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s och step_s måste vara positiva med högst 20000 epoker

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = polarstegen måste vara positiva

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode måste vara doppler, joint, polar eller timing; fick { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = doppler-läget behöver minst ett LEO-system

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = timing-läget behöver ett LEO-system med kodavståndsmätning

engine-e-leo-fusion-pvt-kind-unknown-clock-class = okänd klockklass { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) vid { $user_lat_deg }, { $user_lon_deg } över { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } sat. på { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites = { "  " }Doppler-positionsbestämning: { $n_obs } mätningar från { $n_sats } satelliter, 3D-fel { $error_3d_m } m (horisontellt { $horizontal_error_m } m){ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }fönster { $window_s } s: { $n_sats } sat., 3D-fel { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } överflygning: max Doppler { $max_doppler_hz } Hz, hastighet { $max_doppler_rate_hz_s } Hz/s, ryck { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }LEO-avståndssatellit i sikte under { $v1 }% av epokerna{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } tillgänglighet { $availability }, median-PDOP { $f }, RMS 3D-fel { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } fused { $f3 }; i sikte { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, max { $row3 } ns (i sikte { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — läge { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = system { $name }: role måste vara gnss eller leo, fick { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = system { $name }: clock måste vara estimated eller known, fick { $c }

engine-e-leo-fusion-system-system-must-be-positive = system { $name }: { $what } måste vara positivt

engine-e-leo-fusion-system-system-mask-deg-must-be = system { $name }: mask_deg måste vara i [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = system { $name }: sigma_pr_m måste vara positivt

engine-e-leo-fusion-system-give-at-least-one-system = ange minst ett [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = epokavståndet måste vara positivt

engine-e-leo-fusion-timing-no-epochs = inga epoker

engine-e-leo-fusion-timing-no-satellite-was-ever-in = ingen satellit var någonsin i sikte: mottagaren fick aldrig tid

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polarisationen måste vara rhcp, lhcp eller linear; fick '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4-felkod { $code } vid t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = en bana med inklinationen { $inc } deg passerar aldrig över latituden { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = den begärda maximala elevationen ligger under horisontens räckvidd

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = byggnadsklassen måste vara traditional eller thermally-efficient; fick '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = fältet { $name } är inte ändligt

engine-e-leo-navmsg-codec-field-is-outside-its-bit = fältet { $name } = { $value } { $unit } ligger utanför sitt { $bits }-bitarsintervall (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = meddelandet är avkortat

engine-e-leo-navmsg-codec-field-list-exhausted = fältlistan är slut

engine-e-leo-navmsg-codec-field-order-mismatch-vs = fältordningen stämmer inte: { $name } mot { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID måste vara 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = varje korrektionspolynom behöver 1-8 koefficienter

engine-e-leo-navmsg-codec-correction-time-scale-must-be = korrektionens tidsskala måste vara en tvåpotens från 1 s till 32768 s; fick { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = ECEF-polynomet behöver 1-11 koefficienter, lika många per axel

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = ECEF-polynomets grad { $v1 } överstiger 10

engine-e-leo-navmsg-codec-unknown-model-id = okänt modell-id { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = nyttolasten överstiger 4095 bytes

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = ramen är kortare än huvud och CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = felaktig preamble 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = versionen { $version } stöds inte

engine-e-leo-navmsg-codec-frame-length-does-not-match = ramlängden { $frame } stämmer inte med den deklarerade nyttolasten på { $len } bytes

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q stämmer inte: beräknad 0x{ $crc }, ramen bär 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees måste vara högst 7 vardera; fick { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree måste vara 1-10; fick { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = okänd efemeridmodell '{ $other }': använd kepler16, kepler-rac, liu22 eller ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = anpassningsintervallet måste vara minst 10 s; fick { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = anpassningsfönstret [{ $t0 }, { $v1 }] s ligger utanför referensbågen [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = ECEF-polynomanpassningen är singulär (för få sampel för graden)

engine-e-leo-navmsg-fit-clock-fit-is-singular = klockanpassningen är singulär

engine-e-leo-navmsg-fit-keplerian-fit-diverged = den Keplerska anpassningen divergerade

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = okänd förinställning '{ $k }'; tillgängliga: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s måste vara 10-3600 s och update_period_s i (0, fit_interval_s]; fick { $fit_interval_s } och { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s och eval_step_s måste vara 0.5-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz måste överstiga 10 MHz; fick { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid måste vara 1-255

engine-e-leo-navmsg-band-must-be-15-and = band måste vara 0-15 och health 0-3

engine-e-leo-navmsg-unknown-csv-schema = okänt csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis måste ange minst en analys

engine-e-leo-navmsg-unknown-analysis-use = okänd analys '{ $a }'; använd { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind måste vara leo-navmsg; fick { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg måste vara i [0, 60); fick { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO-navigeringsmeddelande — { $res } km, { $res2 } deg, tyngdkraftsgrad { $gravity_degree }, modell { $res3 }
    { "  " }SISRE-vikter: w_R { $w_r }, w_AC^2 1/{ $v6 } (mask { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s måste vara 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s måste vara icke-tom, vardera 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }avvägning av anpassningsintervall över { $span } s (användningsperiod = anpassningsintervall):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE bana RMS { $sisre_orb_rms_m } m  max { $sisre_orb_max_m } m  med klocka RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s måste vara icke-tom, vardera 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s måste vara 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } parametrar  SISRE bana RMS { $sisre_orb_rms_m } m  med klocka { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = ingen passage över { $mask } deg för användaren vid { $lat }, { $lon } inom { $search } s; vidga midpass.search_s eller flytta användaren

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }uppdatering mitt i passagen: passage { $p0 }-{ $p1 } s (maxelevation { $pmax } deg), { $switches } byten, största hopp i användaravstånd { $max_jump } m (sämsta geometri { $max_worst } m) mot tröskeln { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }kodning-avkodning: modell { $m }, ram { $frame } bytes ({ $payload_bits } nyttolastbitar, { $eph_bits } efemerid- och klockbitar), CRC-24Q 0x{ $hex }
    { "    " }kvantisering: största positionsändring { $v6 } mm, klocka { $v7 } mm; SISRE exakt { $acc_exact } m, kvantiserad { $acc_q } m
    { "    " }skadad ram avvisad: { $corrupted_rejected }; RINEX round trip { $rin_dp } m; CSV round trip { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs måste vara 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  publicerat { $published } m  kvot { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = Den Keplerska uppsättningen med 16 parametrar försämras från { $a } m vid { $lo } s till { $b } m vid { $hi } s: en Kepler-uppsättning med övertoner två gånger per varv kan inte följa de högfrekventa tyngdkraftstermerna och luftmotståndet längs en LEO-båge i mer än några minuter, och dess minsta-kvadratresidual svänger över fönstret. Polynomen längs banan, tvärs banan och radiellt, av högre grad än den Keplerska uppsättningen spänner över, tar upp det som återstår och ger { $c } m vid { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = Den Keplerska uppsättningen med 16 parametrar går från { $a } m vid { $lo } s till { $b } m vid { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, tyngdkraftsgrad { $gravity_degree } · representationsfel mot referensen · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` är värdbibliotekets

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: `rand_distr`-samplers anropar värdens `exp` och `ln` i sina sällsynta grenar; använd `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` är värdbibliotekets tyngdkraftsfält; använd `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` har inte granskats

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = ingen END OF HEADER-rad

engine-e-leo-navmsg-text-expected-eph-record-header-got = förväntade ett posthuvud '> EPH', fick { $head }

engine-e-leo-navmsg-text-bad-satellite-id = felaktigt satellit-id { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = epokrad saknas

engine-e-leo-navmsg-text-bad-epoch-line = felaktig epokrad { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = felaktigt epokfält i { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = epokraden behöver tre klocktermer: { $ep }

engine-e-leo-navmsg-text-record-truncated = posten är avkortad

engine-e-leo-navmsg-text-unknown-record-type = okänd posttyp { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = CSV-tabellen bär kepler16- och kepler-rac-meddelanden; fick { $m }

engine-e-leo-navmsg-text-empty-csv = tom CSV

engine-e-leo-navmsg-text-row-has-cells-header = raden har { $cells } celler, huvudet { $header }

engine-e-leo-navmsg-text-bad-number-in-column = felaktigt tal { $c } i kolumn { $k }

engine-e-leo-navmsg-text-csv-row-lacks = CSV-raden saknar { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = banhöjden måste vara mellan 100 km och 3000 km; fick { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = excentriciteten måste vara i [0, 0.1) för en LEO-anpassning; fick { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = integrationssteget måste vara i (0, 30] s; fick { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = varaktigheten måste vara positiv med högst 200000 steg; fick { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree måste vara 0, 2-6 (zonal) eller 7-{ $v1 } (EGM2008); fick { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = referenspropageringen divergerade

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = referensbanan förföll under 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = nodavståndet måste vara i (0, 60] s; fick { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = en tabulerad referensbana behöver minst två tillstånd; fick { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = tillstånd { $k } är inte ändligt

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = klockans adev_1s måste vara i [0, 1e-6); fick { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = en uppmätt klocka byggs med TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = en styrd klocka behöver sigma_s i [0, 1e-3) och tau_s > 0; fick { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = en uppmätt klocka behöver ett positivt steg och minst två sampel

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = ett sampel från en uppmätt klocka är inte ändligt

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epoken '{ $s }' är inte YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epoken '{ $s }' är inte YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epoken '{ $s }' har ett felaktigt sekundfält

engine-e-leo-pass-epoch-is-out-of-range = epoken '{ $s }' är utanför intervallet

engine-e-leo-pass-band-unknown-signal-design-public = band '{ $name }': okänd signalutformning '{ $n }'; publika utformningar: { $v2 }

engine-e-leo-pass-band-is-not-in-the = bandet '{ $name }' finns inte i systemets förinställning: ange frequency_mhz och eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = bandet '{ $name }' behöver eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern måste vara isoflux, gaussian eller flat; fick '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = bandet '{ $name }' har frekvens utanför intervallet

engine-leo-pass-overridden-in-the-scenario = { $source } (åsidosatt i scenariot)

engine-e-leo-pass-system-has-no-band = systemet '{ $id }' har inget band '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = en LEO-satellit behöver minst ett band

engine-e-leo-pass-at-most-12-bands-per = högst 12 band per satellit

engine-leo-pass-unknown-system-presets-in-this = okänt system '{ $n }'; förinställningar i det här bygget: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = ingen solsynkron bana vid { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (högst 86400) och step_s måste vara positiva med högst 20000 epoker; fick { $duration } och { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO-satellit, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = scenariots `epoch` { $epoch }, tolkad som UTC

engine-leo-pass-the-kind-default-epoch-utc = typens standardepok { $epoch } UTC (scenariot anger ingen)

engine-e-leo-pass-user-environment-must-be-ground = user.environment måste vara ground, maritime, air eller indoor; fick '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg måste ligga inom +/-90

engine-e-leo-pass-user-speed-must-be-to = användarens hastighet måste vara 0 till 3000 m/s och höjden -500 till 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna måste vara patch, hemispherical eller isotropic; fick '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability måste vara i (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model måste vara klobuchar, vtec eller none; fick '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction måste vara ascending eller descending; fick '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satellit { $id }: felaktig excentricitet eller perigeum

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satellit { $id }: tle behöver tle_line1 och tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit måste vara pass, elements eller tle; fick '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation behöver ett system eller en utformning

engine-e-leo-pass-no-sun-synchronous-inclination = ingen solsynkron inklination

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: högst 5000 satelliter

engine-e-leo-pass-no-leo-satellite-rises-above = ingen LEO-satellit når över masken i fönstret

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s måste vara i (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' är inte ett band hos någon LEO-satellit ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = ingen GNSS-signal '{ $bname }' för konstellationen '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = tom GNSS-konstellation

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' är inte två skilda band hos { $id }

engine-e-leo-pass-iot-powers-and-battery-must = IoT-effekter och batteri måste vara positiva

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from måste vara median eller peak; fick '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = detektionströskel { $detection_snr_db } dB efter integration

engine-leo-pass-coherent-integration-at-most-ms = koherent integration högst { $rx } ms, begränsad av Doppler-hastigheten

engine-leo-pass-serial-search-with-correlators = seriell sökning med { $correlators } korrelatorer

engine-leo-pass-hot-start-doppler-known-to = varmstart: Doppler känd till +/-{ $aided } Hz, efemeriden giltig

engine-leo-pass-leo-pass-link-budget-user = LEO-passagens länkbudget, { $environment }-användare vid { $lat_deg }, { $lon_deg }; { $satellites } LEO-satellit(er), fönster på { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, maxelevation { $max_elevation_deg } deg vid { $tca_s } s, { $duration_above_mask_s } s över masken{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 topp { $opt } median { $opt2 }; |Doppler| max { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: { $satellites_in_view } i sikte, C/N0 { $opt } till { $opt2 } (median { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } topp { $leo_peak_cn0_dbhz } dB-Hz är { $leo_peak_above_gnss_median_db } dB över GNSS-medianen; över den starkaste GNSS-bärvågen under { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: kall TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), varm { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer från { $onset_s } s (hopp { $offset_m } m, push { $push_rate_m_s } m/s): Doppler-test GNSS { $t }, LEO { $t2 }, fused { $t3 }; korsband { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = { $environment }-användare · LEO topp { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB över GNSS-medianen · MODELLED

engine-leo-pass-user-modelled = { $environment }-användare · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler för varje LEO-satellits första band (±{ $v1 } kHz fullt utslag)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = ogiltig [{ $what }]-tabell: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' finns varken i [signal] eller bland de publika utformningarna ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' har ingen kodspårad komponent, så den ger inget pseudoavstånd

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind måste vara leo-pnt-chain; fick { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = den spårade komponenten har ingen chiphastighet

engine-e-leo-pnt-chain-no-band-of-pass-names = inget band i [pass] anger signal = "{ $name }"; kedjan behöver ett som bär utformningen

engine-e-leo-pnt-chain-the-pass-gives-no-code = passagen ger ingen kodjitter

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m måste vara i [0, 100] m; fick { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] måste köra mode = "joint"; fick { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = spårad C/N0 vid masken { $mask } deg (linjeanpassning i sin elevation)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] har inget LEO-system som kan ta emot kedjans värden

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] gav inget joint-block

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT-kedja: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signal { $name2 } ({ $design }), spårad { $design2 } vid { $v4 } Mchip/s, C/N0-förskjutning { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }passage { $id } { $sat } km: spårad C/N0 topp { $peak_tracked_cn0_dbhz } dB-Hz, kodjitter median { $jitter_median } m; C/N0-linje { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }meddelande { $res } { $fit_interval_s } s anpassning / { $update_period_s } s uppdatering: representations-SISRE { $stats } mm RMS (bana { $stats2 } mm), med { $od } m banbestämning: { $sisre } m förs vidare{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }fused positionsbestämning: enbart GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP-konvergens: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } värden förs över mellan stegen. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Kodspårningsjitter, avståndsfelet (m, 0 till { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · enbart GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulation { $label }: bredden måste vara positiv

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = okänd signalförinställning { $name }: biblioteket har { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = förinställning { $name }: ogiltig förinställningsfil: { $e }

engine-e-leo-signal-preset-file-names-itself = förinställningsfilen { $name } kallar sig { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz måste vara positivt

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz måste vara positivt

engine-e-leo-signal-signal-needs-at-least-one = { $name }: en signal behöver minst en komponent

engine-e-leo-signal-component-power-fraction-must-be = { $name }: komponent { $v1 } power_fraction måste vara positivt

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: komponent { $v1 } har fdma_shares men ingen fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: komponent { $v1 } fdma_shares måste vara positiva och ha summan ett

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: komponent { $v1 } behöver en fdma_share per förskjutning

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps måste vara positivt

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips måste vara positivt

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: komponenternas effektandelar har summan { $total }, inte 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km måste vara positivt

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: en platt (OFDM-liknande) komponent kan inte placeras i spektrummodellen

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: den spårade komponenten ligger på FDMA-underbärvågor; spektrummodellen spårar en komponent i bandets mitt

engine-e-leo-signal-signal-is-given-twice = signal { $w } anges två gånger

engine-e-leo-signal-signals-is-more-than-the = { $out } signaler är fler än de 24 som tillåts

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s måste vara under 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: ange 1 till 40 cn0_dbhz-värden

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 och slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points måste vara mellan 21 och 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: använd "coherent" eller "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = systembrustemperaturen måste vara positiv

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: okänd GNSS-signal { $n } (kända: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } är inte en scenariosignal

engine-e-leo-signal-shape-check-signal-is-not = formkontroll: signal { $signal } finns inte i scenariot

engine-leo-signal-scenario-leo-signal-signals-noise = scenario leo-signal | { $runs } signaler | brusgolv { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = vänster: bandbegränsad PSD för varje utformning (dB under toppen, över dess sändningsband); höger: kodjitter mot total C/N0 vid { $reference_spacing_chips } chips avstånd

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = okänt band '{ $other }' (förväntade s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km måste vara ändligt och positivt

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps måste vara ändligt och positivt

engine-e-linkbudget-other-losses-db-must-be = other_losses_db måste vara ändligt och >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k måste vara ändligt och positivt när det anges

engine-linkbudget-link-budget-band-km-bit = link-budget: { $value }-band, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, marginal { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = kan inte lyssna på { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: lyssnar på tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp-klient ansluten

engine-live-io-kshana-live-warning-is-not = kshana live: varning: { $addr } är inte en loopback-adress; allt som kan nå den kan läsa strömmen

engine-e-live-io-cannot-open = kan inte öppna { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: kopplade bort en tcp-klient som inte hängde med

engine-e-live-io-cannot-open-2 = kan inte öppna { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: varning: { $addr } är inte en loopback-adress; allt som kan nå den kan skicka en ström till det här lagret

engine-e-live-io-cannot-bind-udp = kan inte binda udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: lyssnar på udp { $addr }

engine-e-live-io-cannot-connect-to = kan inte ansluta till { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: ansluten till tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: läser serieport { $path } med { $baud } baud (endast läsning)

engine-live-io-the-was-closed-by-the = { $v1 } stängdes av motparten (lagret återansluter inte: kör det under en övervakare som startar om det)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: använd 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 eller 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } är inte en seriell enhet (tcgetattr misslyckades)

engine-e-live-io-cannot-set-baud = kan inte ställa in { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = kan inte ställa in radläget för { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial stöds bara på Unix; använd --file, --tcp eller --stdin

engine-live-io-unknown-option = okänt alternativ { $s }

engine-live-io-cannot-read = kan inte läsa { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: fartygsplattform, kalibrerar i { $calibration_s } s; grind { $v2 }. Rådgivande programvara, inte typgodkänd navigationsutrustning: operatören är fortsatt ansvarig.

engine-live-io-write-failed = skrivningen misslyckades: { $e }

engine-live-io-kshana-live-dropped-udp-datagram = kshana live: släppte { $n } udp-datagram som motorn inte kunde ta emot ({ $udp_dropped } totalt)

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } ligger utanför 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = insättningsindex { $p } ligger utanför 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = Annex 3-filerna innehåller { $gold } och { $ter } koder, 210 förväntades

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } är inte en Gold-kod av g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = sekundärkoden S{ $id } finns inte (S0 till S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 tilldelar koder bara till nodidentiteterna 1 till 12, inte { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } ryms inte i två bitar (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } ligger utanför 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = { $SB1_SYMBOLS } subframe-1-symboler förväntades

engine-e-lunar-afs-frame-subframe-data-lengths-expected = datalängder för delramar { $sb2 }/{ $sb3 }/{ $sb4 } (förväntade { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = { $FRAME_SYMBOLS } symboler förväntades, { $soft } angavs

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = rad { $v1 }: förväntade `row,column`

engine-e-lunar-afs-ldpc-line = rad { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = rad { $v1 }: ({ $r },{ $c }) ligger utanför { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: { $info_bits } informationsbitar förväntades, { $info } angavs

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = LSIS V1.0-data finns inte i { $cache_dir } (sätt KSHANA_LSIS_DIR eller kör xval/lunar-afs/fetch_lsis.sh, som hämtar { $LSIS_PDF_URL } och extraherar dess bilagor; de vidaredistribueras inte med Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } är inte en fastlåst LSIS-fil

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } har SHA-256 { $got }, förväntade { $want } (fastlåst till LSIS V1.0 av 29 January 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal-basband, { $LSIS_VERSION }; Kshanas referensgenerator

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = AFS-nod { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = AFS-nod { $node_id } ram TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites måste vara minst 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites måste vara minst 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg måste ligga i [0, 90); fick { $mask_deg }

engine-lunar-beacon-satellites-no-beacons = { $n_sats } satelliter, inga fyrar

engine-lunar-beacon-satellites-visible-beacons = { $n_sats } satelliter + { $n_vis_beacons } synliga fyrar

engine-lunar-beacon-satellites-no-beacons-2 = { $n_cmp } satelliter, inga fyrar

engine-e-lunar-beacon-serialising-beacon-report = serialiserar fyrrapport: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = fyrrapporten måste serialiseras till ett JSON-objekt

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Förstärkning med månytefyrar — mask { $elevation_mask_deg } deg, epok +{ $epoch_s } s, sigma_URE per fyr { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  sat. { $n_visible_sats }  fyrar { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  uppnådd 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }fyrar förbättrar PDOP med { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = en större konstellation i stället, { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = kan inte läsa månefemeriden { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = månefemerid: första raden måste vara `{ $MAGIC }`, hittade `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = månefemerid: filen är tom

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = månefemerid: `# format:` måste vara `states` eller `elements`, hittade `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = månefemerid: inga datarader

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = månefemerid: kolumnen `{ $name }` saknas

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = månefemerid: `# elements_frame:` måste vara `icrf` eller `mci`, hittade `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = månefemerid: `elements_frame: icrf` behöver `# epoch_jd_tdb:` (den epok som elementen avser, och där rotationen från ICRF till månfast system också beräknas): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = månefemerid: för kort elementrad { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = månefemerid: elementrad { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = månefemerid: elementrad { $v1 } har en icke-positiv halv storaxel

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = månefemerid: elementrad { $v1 } har excentriciteten { $ecc }, utanför [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = månefemerid: en `states`-fil behöver `# frame: icrf` eller `# frame: mci`, hittade `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = månefemerid: en `icrf`-states-fil behöver `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = månefemerid: för kort tillståndsrad { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = månefemerid: tillståndsrad { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = månefemerid: tillståndsrad { $v1 } är inte ändlig

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = månefemerid: tillståndsrad { $v1 } för satellit { $sat } går bakåt i tiden ({ $t } efter { $last }); epoker måste öka strikt per satellit

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Tabellerad månscentrerad tillståndsefemerid ({ $e }-system), Lagrange-interpolerad av ordning { $LAGRANGE_ORDER } mellan tabellens epoker och reducerad till MCMF med { $v2 }. Tillstånden propageras INTE av den här motorn. Proveniensklass `published-ephemeris`: skild från varje elementhärlett värde.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Publicerad konstellations-DEFINITION angiven i månscentrerat ICRF (`{ $v1 }`), propagerad av den här motorns egen Kepler-lösare i samma tröghetssystem och reducerad till MCMF med IAU 2015 / WGCCRE:s månorientering (precisionerande pol, analytisk fysisk libration) vid varje epok. INGEN approximation av referenssystemet: källan anger både system och epok, och båda används. Proveniensklass `published-elements`: skild från varje kärnhärlett värde.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Publicerad konstellations-DEFINITION, propagerad av den här motorns egen Kepler-lösare och reducerad med spinnmodellen för månens medelrotation — exakt samma väg som den illustrativa konstellationen tar, så den enda skillnaden mellan de två körningarna är konstellationens utformning. Källan anger elementen i systemet `{ $v1 }`; de läses här som MCI, vilket lutar konstellationen med `published_frame_tie_angle_deg`. Proveniensklass `published-elements`: skild från varje kärnhärlett värde.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = okänt station_datum { $other }: förväntade "fixed" eller "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = en VLBI-kampanj behöver minst 2 stationer för att bilda en baslinje, fick { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = station { $name } har en icke-ändlig koordinat

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = station { $name } latitud { $lat } deg ligger utanför [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = ett Helmert-datum med sju parametrar behöver minst 3 icke-kollinjära fyrar, fick { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = fyr { $name } har en icke-ändlig koordinat

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = fyr { $name } latitud { $lat } deg ligger utanför [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours måste vara positivt och ändligt, fick { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min måste vara positivt och ändligt, fick { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = ett schema med { $v1 } epoker överskrider det här scenariots spärr på 5000 epoker; förläng step_min eller förkorta arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s måste vara positivt och ändligt, fick { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg måste vara ändligt och i [-90, 90), fick { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg måste vara ändligt och i [-90, 90), fick { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol måste vara ändligt och i [0, 1), fick { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m måste vara positivt och ändligt, fick { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver måste vara "spectral" eller "srif", fick "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = serialiserar resultatet av lunar-frame-campaign: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = ingen observation i kampanjen klarar elevationsmasken på { $mask } deg på jordsidan i båda ändar av en baslinje OCH masken på { $earth_mask } deg över fyrens egen horisont: { $n_epochs } epoker x { $v1 } baslinjer x { $n_beacons } fyrar avvisades alla. Förläng arc_hours, sänk en mask eller flytta stationerna.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = full-rank: alla 7 likformighetsparametrar begränsas av den här kampanjen (konditionstal { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: { $defect } av 7 likformighetsriktningar kan inte observeras från den här kampanjen, så INGEN datum-sigma publiceras; de oobserverbara riktningarna listas i sjuparameterbasen

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | { $n_beacons } fyrar x { $v1 } baslinjer x { $n_epochs } epoker = { $n_obs } obs (fördröjningssigma { $sigma_tau } s) | stationsdatum { $station_datum } | Helmert-rang { $rank }/7 kond { $condition } | datumtranslationens sigma { $v5 } mot återvinningsfel för injicerad transform { $trans_err_norm_m } m (kvot { $v7 })

engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } av { $beacons } fyrar har ingen observation i det här schemat ({ $names2 }); de bär ingen information, deras sigman är null, och datumet realiseras bara från de observerade fyrarna

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = alla sigman måste vara positiva

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane och altitude_km måste vara positiva

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency måste ligga i (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m mot mark { $v2 } m positionssigma, medel q { $v3 } (chi-två 6 förväntar 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } osäkerheter, ILS-framgång { $last2 } (bootstrap { $last3 }) på den längsta bågen

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: minsta informationsegenvärde x{ $v } med omloppslänkar, CRLB-spår x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } svepunkter på { $v } bågar; laser mot GNSS x translationssigma { $last2 } m vid den registrerade lokala bindningen

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB-sigma h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = okänd studie `{ $other }`: förväntade en av { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = mätuppsättningen bestämmer inte banan (singulär information)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials måste vara minst 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = marksigman måste vara positiva

engine-e-lunar-infra-od-unknown-station-dss-14-dss = okänd station `{ $nm }`: DSS-14, DSS-63 eller DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = för få markmätningar för att bestämma banan

engine-e-lunar-infra-od-the-covariance-of-the-difference = differensens kovarians är singulär

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = NRHO:ns differentialkorrektion konvergerade inte från startvärdet

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo kräver 0 < perilunhöjd < apolunhöjd

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = okänd banfamilj `{ $other }`: nrho eller elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s och arc_days måste vara positiva

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = ingen gemensam satellit mellan mottagarna

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = normalekvationerna för bärvågsfas är singulära

engine-e-lunar-infra-phase-the-position-block-is-singular = positionsblocket är singulärt

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = osäkerhetskovariansen är inte positivt definit

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = teknikernas sigman måste vara positiva

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = sigman för lokal bindning måste vara positiva

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz måste vara ändligt och positivt

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz måste vara ändligt och positivt

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k måste vara ändligt och positivt

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km måste vara ändligt och över månens radie

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity måste ligga i [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw måste vara ändligt

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | { $n_sats } sat., { $n_epochs } epoker, { $n_links } länkar från ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (medel { $mean_js_db }) | { $n_lost } LOST | tillgänglighet { $availability_under_jamming } av { $availability_nominal } nominell

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | { $n_sats } sat., { $n_epochs } epoker, { $n_links } länkar från ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (månbaslinje med ren himmel) | { $n_lost } LOST | tillgänglighet { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = oväntat huvud i reflektorkatalogen { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = för kort rad i reflektorkatalogen { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = oläsligt reflektorfält { $i } i { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = reflektor { $f }: |(x,y,z)| = { $norm3 } m men den publicerade radiekolumnen anger { $radius } m — raden har redigerats

engine-e-lunar-llr-reflector-catalogue-has-no-rows = reflektorkatalogen har inga rader

engine-e-lunar-llr-unreadable-position-epoch-year = oläsligt position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = oväntat huvud i stationskatalogen { $t }

engine-e-lunar-llr-short-station-catalogue-row = för kort rad i stationskatalogen { $t }

engine-e-lunar-llr-unreadable-station-field-in = oläsligt stationsfält { $i } i { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = oläslig ILRS-id i { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = stationskatalogen har inga rader

engine-e-lunar-llr-cannot-read-this-scenario-runs = kan inte läsa { $path } ({ $e }). Det här scenariot körs på det incheckade utsnittet av verkliga data under { $DEFAULT_DATA_DIR }, som följer med arkivet men inte med det publicerade paketet; peka `data_dir` på en kopia av det.

engine-e-lunar-llr-only-usable-normal-points-for = bara { $used } användbara normalpunkter för { $reflectors } reflektorer — för få för att begränsa { $v3 } koordinater; bredda arkivutsnittet

engine-e-lunar-llr-the-simulated-campaign-own-report = den simulerade kampanjens egen rapport kunde inte tolkas: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: { $used } arkiverade normalpunkter ({ $n_parsed } tolkade) från { $station_counts } station(er) till { $reflectors } retroreflektorsamlingar över { $v5 } d; median för uppmätt normalpunktsprecision { $median } mm enkelväg; reflektorernas informationsrang { $rank }/{ $n }; Helmert-rang { $rank2 }/{ $n_helmert } kond { $condition }; datumtranslationens sigma { $v12 } m; RMS för residual observerat-minus-beräknat enkelväg { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg måste vara ändligt och i [-90, 90), fick { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } har en icke-ändlig koordinat

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } latitud { $lat_deg } deg ligger utanför [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = serialiseringen av lunar-llr-datum-rapporten misslyckades: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = integrationssteget måste dela utdatasteget

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } måste vara ändligt och inte negativt

engine-lunar-receiver-must-be-finite-and-positive = { $n } måste vara ändligt och positivt

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: exportplats: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = månefemeriden { $path } täcker { $until } s efter sin epok men scenariots horisont når { $last } s; förkorta horizon_hours eller hämta en längre båge (extrapolering av en tabellerad efemerid avvisas)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path kräver epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = OP-system vid { $epoch } UTC (jordens skenbara banormal kring månen, x längs dess nod på IAU:s månekvator); lunar GM, J2 och C22 i IAU:s månfasta system, jorden och solen som tredjekroppar vid DE440-positioner från { $spk_path }; Runge-Kutta av fjärde ordningen, steg 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m måste vara ändligt och positivt

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m måste vara ändligt och positivt

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 kräver height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites måste vara 3 eller 4, fick { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs måste vara 1 till 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } måste vara ändligt och positivt

engine-lunar-station-must-be-finite-and-not = { $name } måste vara ändligt och inte negativt

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } överskrider { $MAX_WORK }; sänk n_trials, gör grid_lat_step_deg grövre (eller lista färre punkter), eller höj t_step_s / förkorta t_span_s

engine-e-lunar-station-kind-must-be-got = kind måste vara { $KIND }; fick { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: efemeriden { $path } täcker { $until } s men körningen når { $last } s (sista epoken plus latency_s); förkorta t_span_s

engine-e-lunar-station-no-case = { $KIND }: inget fall ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } punkter · { $n_epochs } epoker · { $n_trials } försök

engine-lunar-station-hpl-max = HPL max { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = inmätning { $survey_sigma_m } m · latens { $latency_s } s · { $quantization_bits } bitar

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines och samples måste vara 2 till { $MAX_DEM_SIDE }, fick { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } höjder för ett rutnät på { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m måste vara positivt, fick { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m måste vara positivt, fick { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: kan inte läsa { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection måste vara south-polar-stereographic, fick { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type måste vara int16-le, fick { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: kan inte läsa { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: rutnätet överskrider gränsen på { $MAX_DEM_SIDE } pixlar

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } är { $bytes } bytes; { $lines } x { $samples } int16 kräver { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: SHA-256 { $digest } för { $img } stämmer inte med beskrivarens { $image_sha256 }

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor måste vara positivt

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: kan inte läsa { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: kräver minst 2 x 2 punkter, en växande utsträckning inom [-90, 90] deg och 360 deg longitud, samt ändliga höjder

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } måste vara ändligt och positivt, fick { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m måste vara ändligt och inte negativt, fick { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg får vara högst 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m måste vara 1 till 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: platsen ligger utanför höjdfältet

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: en angiven horisont kräver en icke-tom källa

engine-e-lunar-terrain-terrain-stated-horizon = terrain: angiven horisont: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: ange dem_path eller dem_tile_path, inte båda

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km måste vara ändligt och positivt

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m måste vara ändligt och positivt

engine-e-lunar-terrain-site-deg-deg = { $e } (plats { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = okänd klocka { $other }; förväntade en av optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks måste ange minst en klockklass

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s måste vara ändligt och positivt, fick { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s måste vara ändligt och större än tau_min_s ({ $lo }), fick { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade måste vara ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = termen { $name } är kortare än tau-rutnätet

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | klocka { $clock } | 7-terms x_Σ(τ) över { $taus } τ-punkter ({ $taus2 }–{ $taus3 } s) | skärning τ { $crossover_tau_s } s (x { $crossover_x_s } s) | referenssystemets golv { $frame_term_s } s | klocka x(1 d) { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | tidslabb: { $lab } { $lab2 } till LTC, x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: okänd klocka { $other }; förväntade en av optical-master, passive-h-maser, rafs, mini-rafs, eller ange ett device_card i stället

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: ange antingen clock eller device_card, inte båda

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s måste vara ändligt och positivt, fick { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } måste vara ändligt och icke-negativt, fick { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s måste vara positiva tal

engine-lunar-time-lab-station-height-not-modelled-exactly = stationshöjden är inte exakt modellerad: ett enkelsigmafel på { $height_sigma_m } m i höjd ger en skevhet i takten på { $value } ns/day, tillämpad som en linjär term sedan den senaste styrningen

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = ljustiden konvergerade inte till 1e-15 s på 30 iterationer

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = kärnsökvägen kräver planetary_kernel_path, earth_orientation_kernel_path och moon_orientation_kernel_path tillsammans

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = okänt datum { $other }: förväntade "anchor-first-station", "free-network" eller "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = ett VLBI-schema behöver minst 2 stationer för att bilda en baslinje, fick { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = fyrkoordinaterna måste vara ändliga

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = fyrens latitud { $lat } deg ligger utanför [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = ett schema med { $v1 } epoker överskrider det här scenariots spärr på 20000 epoker; förläng step_min eller förkorta arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g måste vara positivt och ändligt, fick { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = serialiserar resultatet av lunar-vlbi-fim: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = ingen observation i schemat klarar elevationsmasken på { $mask } deg i båda ändar av en baslinje: { $n_epochs } epoker x { $v1 } baslinjer avvisades alla. Förläng arc_hours, sänk elevation_mask_deg eller flytta stationerna.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = datumet lämnar ingen parameter att skatta

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: { $defect } av { $dim } riktningar kan inte observeras, så ingen sigma per koordinat rapporteras; värdet för det observerbara underrummet nedan är en pseudoinvers begränsad till de { $rank } observerbara riktningarna och är INTE en stationssigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | { $n_stations } stationer / { $v2 } baslinjer x { $n_epochs } epoker = { $n_obs } obs (mask { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond { $condition } | stationssigma { $v10 } mot equipartition g={ $g } { $eq_g } m (kvot { $v13 })

## src/main.rs

engine-main-error-validate-needs-scenario-path = fel: --validate kräver en scenariosökväg

engine-main-error-study-needs-suite-manifest = fel: --study kräver en sökväg till ett svitmanifest

engine-main-error-study-name-needs-value = fel: --study-name kräver ett värde

engine-main-error-export-sp3-needs-path = fel: --export-sp3 kräver en sökväg

engine-main-error-export-omm-needs-path = fel: --export-omm kräver en sökväg

engine-main-error-export-oem-needs-path = fel: --export-oem kräver en sökväg

engine-main-error-animate-needs-format-svg = fel: --animate kräver ett format: svg, html, frames eller all

engine-main-error-animate = fel: --animate: { $e }

engine-main-error-animate-fps-needs-whole = fel: --animate-fps kräver ett helt antal bildrutor per sekund

engine-main-error-export-needs-format-czml = fel: --export kräver ett format: czml, kml, geojson, stk, sigmf, all eller list

engine-main-error-animate-duration-needs-length = fel: --animate-duration kräver en längd i sekunder

engine-main-error-import-route-needs-geojson = fel: --import-route kräver en sökväg till en GeoJSON-fil

engine-main-error-eop-needs-finals2000a-file = fel: --eop kräver en sökväg till en finals2000A-fil

engine-main-error-unknown-option = fel: okänt alternativ '{ $other }'

engine-main-error-unexpected-argument-one-scenario = fel: oväntat argument '{ $other }'; en scenariofil per körning

engine-main-warning-animate-fps-and-animate = varning: --animate-fps och --animate-duration gör ingenting utan --animate

engine-main-error-animate-exports-one-scenario = fel: --animate exporterar en scenariokörning; det kombineras inte med --validate eller --study

engine-main-error-validate-lints-one-scenario = fel: --validate kontrollerar ett scenario; ange inte också en scenariofil

engine-main-error-cannot-read = fel: kan inte läsa { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — typen kan lösas upp; den här typen kräver inget fält (en tom kropp kör dess referenskonfiguration), så det fanns inget mer att kontrollera

engine-main-ok-kind-resolves-and-all = ok: { $kind } — typen kan lösas upp och alla { $n_required } av dess publicerade poster för obligatoriska fält är uppfyllda; fältvärden kontrolleras inte

engine-main-error-study-runs-suite-do = fel: --study kör en svit; ange inte också en enskild scenariofil

engine-main-warning-study-name-is-ignored = varning: --study-name ignoreras med --study; en studie får sin titel av svitmanifestets `title =`

engine-main-error-cannot-read-2 = fel: kan inte läsa { $path }: { $e }

engine-main-hint-kshana-example-lists-the = tips: `kshana example` listar de medföljande referensscenarierna; `kshana example clock-holdover > clock-holdover.toml` skriver ett

engine-main-error-cannot-read-3 = fel: kan inte läsa { $eop_file }: { $e }

engine-main-error-eop = fel: --eop: { $e }

engine-main-error-cannot-read-4 = fel: kan inte läsa { $route_file }: { $e }

engine-main-error-import-route = fel: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: gäller inte: { $why }

engine-main-error-export = fel: --export: { $e }

engine-main-error-animate-2 = fel: --animate { $f }: { $e }

engine-main-error-export-2 = fel: { $fmt }-export: { $e }

engine-main-error-cannot-write = fel: kan inte skriva { $json_path }: { $e }

engine-main-error-cannot-write-2 = fel: kan inte skriva { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = fel: kan inte bygga rapporten: { $e }

engine-main-error-cannot-write-3 = fel: kan inte skriva { $html_path }: { $e }

engine-main-error-cannot-write-4 = fel: kan inte skriva { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = fel: kan inte skriva { $csv_path }: { $e }

engine-main-wrote-and = skrev { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } och { $csv_path }

engine-main-wrote-and-2 = skrev { $json_path }, { $svg_path }, { $html_path } och { $report_json_path }

engine-main-error-cannot-write-6 = fel: kan inte skriva { $target }: { $e }

engine-main-error-cannot-write-7 = fel: kan inte skriva { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = fel: SP3-exporten misslyckades: { $e }

engine-main-error-cannot-write-8 = fel: kan inte skriva { $omm_path }: { $e }

engine-main-error-omm-export-failed = fel: OMM-exporten misslyckades: { $e }

engine-main-error-cannot-write-9 = fel: kan inte skriva { $oem_path }: { $e }

engine-main-error-oem-export-failed = fel: OEM-exporten misslyckades: { $e }

engine-main-error-unexpected-argument-after-kinds = fel: oväntat argument '{ $other }' efter `kinds`; bara --json accepteras

engine-main-bundled-reference-scenarios-write-one =
    Medföljande referensscenarier ({ $v1 }). Skriv ett till en fil och kör det:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (medföljer inte: { $name } — kör `kshana example { $name }` för att se varför)

engine-main-error-is-not-bundled-it = fel: '{ $name }' medföljer inte: det { $why }

engine-main-error-no-bundled-scenario-named = fel: inget medföljande scenario heter '{ $name }'; `kshana example` listar de { $v1 } som finns

engine-main-error-cannot-read-5 = fel: kan inte läsa { $suite_path }: { $e }

engine-main-wrote-and-3 = skrev { $json_path } och { $html_path }

engine-main-error-needs-value = fel: { $a } kräver ett värde

engine-main-error-expected-mean-needs-number = fel: --expected-mean kräver ett tal

engine-main-error-unknown-imu-fit-option = fel: okänt imu-fit-alternativ { $x }

engine-main-error-imu-fit-needs-an = fel: imu-fit kräver en sökväg till en IMU-logg

engine-main-error-needs-value-2 = fel: { $args } kräver ett värde

engine-main-error-epoch = fel: --epoch: { $e }

engine-main-error-unknown-bench-export-option = fel: okänt bench-export-alternativ { $a }

engine-main-error-bench-export-needs-scenario = fel: bench-export kräver en scenariosökväg

engine-main-needs-value = { $a } kräver ett värde

engine-main-site-takes-lat-lon-height = --site tar lat,lon[,height_m], fick { $v }

engine-main-error-is-bytes-the-tle = fel: { $p } är { $m } bytes; gränsen för TLE är { $cap } (4 MiB)

engine-main-error-cannot-read-6 = fel: kan inte läsa { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = okänt sky-alternativ { $a }

engine-e-main-svg-and-monte-carlo-are = --svg och --monte-carlo är separata utdata; ange ett

engine-main-error-preset-needs-name =
    fel: --preset kräver ett namn
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    fel: --profile kräver en fil
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } symboler, { $r2 } ram(ar) hittades; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }ram vid { $f }: FID { $f2 } TOI { $f3 } (SB1-mått { $f4 }, { $f5 } SP-fel, { $f6 } SB1-fel)

engine-main-not-checked = inte kontrollerat: { $r }

engine-main-wrote-frame-of-6000-symbols = skrev { $out }: { $frames } ram(ar) med 6000 symboler; delramarna 2 till 4 är platshållare (inte LDPC-kodade, inget meddelande)

engine-main-error-cannot-write-10 = fel: kan inte skriva { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = okänt underkommando till lunanet-afs-check { $other }

engine-main-needs-pack-id = { $cmd } kräver ett paket-id

engine-main-unknown-standards-pack-run-option = okänt alternativ för standards-pack run { $a }

engine-main-unknown-standards-pack-subcommand = okänt underkommando till standards-pack { $other }

engine-main-error-out-needs-value = fel: --out kräver ett värde

engine-main-error-unknown-compliance-report-option = fel: okänt compliance-report-alternativ { $a }

engine-main-error-compliance-report-needs-at = fel: compliance-report kräver minst en resultatfil i .json

engine-main-runs-read-not-used-rows = { $runs } körningar lästa, { $unrecognised } används inte; rader: { $n } belagda, { $n2 } delvis, { $n3 } inte belagda, { $n4 } utanför omfattningen

engine-main-error-receiver-trust-needs-scenario = fel: receiver-trust kräver en scenariosökväg

engine-main-error-invalid-receiver-trust-scenario = fel: ogiltigt receiver-trust-scenario: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = brinntiden förbrukar massan: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, brinntid={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = flygtiden måste vara positiv

engine-e-maneuver-collinear-endpoints-transfer-plane-is = kollinjära ändpunkter: överföringsplanet är odefinierat (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs är för M >= 1; använd lambert för M = 0

engine-e-maneuver-no-revolution-transfer-the-time = ingen överföring med { $revs } varv: flygtiden är kortare än minimum

engine-e-maneuver-grid-step-days-must-be = grid_step_days måste vara positivt, fick { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = varje fönster måste löpa framåt (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = ingen överföring av den begärda typen i fönstren

engine-e-maneuver-the-optimum-left-the-feasible = optimum lämnade det tillåtna området

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: förväntade 3 värden

engine-e-mars-od-dss-epoch-is-not-2003 = DSS-{ $id } epoken är inte 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } saknar DXYZ

engine-e-mars-od-no-coordinates-for-dss = inga koordinater för DSS { $station }

engine-e-mars-od-no-ramps-for-dss = inga ramper för DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = ramptabellen täcker inte intervallet

engine-e-mars-od-epoch-outside-the-integrated-span = epok { $et } ligger utanför det integrerade spannet

engine-e-mars-od-normal-matrix-is-not-positive = normalmatrisen är inte positivt definit

engine-e-mars-od-no-points = inga punkter

engine-e-mars-od-parameter-has-no-partial-on = en parameter saknar partiell derivata på de behållna punkterna

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | { $user }-användare, { $clock_class }-klocka | { $n_relays } reläer (i medel { $mean_relays_in_view } i sikte) | konvergerad positions-RMS { $converged_pos_rms_m } m, formell 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — kovariansbaserat kvalitetsmått, inte en certifierad PL) | klockfrekvens-σ { $final_clock_freq_sigma } | kov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — { $user }-användare, { $clock_class }-klocka: 3D-positionsfel mot referens (konvergerad RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = parjämförelsematrisen är tom

engine-e-mcda-ahp-pairwise-matrix-is-not-square = parjämförelsematrisen är inte kvadratisk (rad { $i } har { $row } av { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = elementet a[{ $i }][{ $j }] = { $v } måste vara ändligt och positivt

engine-e-mcda-ahp-diagonal-must-be = diagonalen a[{ $i }][{ $i }] = { $row } måste vara 1

engine-e-mcda-ahp-entries-must-be-reciprocal = elementen a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } måste vara reciproka (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = övre rad { $i } har { $row } element, förväntade { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = övre elementet ({ $i },{ $j }) = { $v } måste vara ändligt och positivt

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: tom beslutsmatris

engine-e-mcda-copras-copras-no-criteria = COPRAS: inga kriterier

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS: { $n } vikter men { $types } kriterietyper

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: kräver minst ett kostnadskriterium (Min)

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS: alternativ { $i } har { $row } värden men det finns { $n } kriterier

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: alternativ { $i } kriterium { $j } värdet { $x } måste vara ändligt och > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: tom datamängd

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: inga kriterier

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I: alternativ { $i } har { $row } värden men det finns { $n } kriterier

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: alternativ { $i } har ett icke-ändligt värde

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: tom beslutsmatris

engine-e-mcda-moora-moora-no-criteria = MOORA: inga kriterier

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA: { $n } vikter men { $types } kriterietyper

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA: alternativ { $i } har { $row } värden men det finns { $n } kriterier

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: alternativ { $i } har ett icke-ändligt värde

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: kriterium { $j } har L2-norm noll

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: tom beslutsmatris

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: inga kriterier

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II: { $n } vikter men { $types } typer / { $prefs } preferensfunktioner

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II: alternativ { $i } har { $row } värden men det finns { $n } kriterier

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: alternativ { $i } har ett icke-ändligt värde

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: tom beslutsmatris

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: inga kriterier

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS: { $n } vikter men { $types } kriterietyper

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS: alternativ { $i } har { $row } värden men det finns { $n } kriterier

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: alternativ { $i } har ett icke-ändligt värde

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = den additiva nyttan har inga attribut

engine-e-mcda-utility-attributes-but-weights = { $attributes } attribut men { $weights } vikter

engine-e-mcda-utility-invalid-scaling-constant = ogiltig skalningskonstant { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = skalningskonstanterna summerar till noll

engine-e-mcda-utility-attribute-values-expected-got = { $attributes } attributvärden förväntades, fick { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: tom beslutsmatris

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: inga kriterier

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR: { $n } vikter men { $types } kriterietyper

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR: alternativ { $i } har { $row } värden men det finns { $n } kriterier

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: alternativ { $i } har ett icke-ändligt värde

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: tom beslutsmatris

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: inga kriterier

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS: { $n } vikter men { $types } kriterietyper

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } måste ligga i [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS: alternativ { $i } har { $row } värden men det finns { $n } kriterier

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: alternativ { $i } kriterium { $j } värdet { $x } måste vara ändligt och > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: tom beslutsmatris

engine-e-mcda-wpm-wpm-no-criteria = WPM: inga kriterier

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM: { $n } vikter men { $types } kriterietyper

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM: alternativ { $i } har { $row } värden men det finns { $n } kriterier

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: alternativ { $i } kriterium { $j } värdet { $x } måste vara ändligt och > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = beslutsmatrisen har inga kriterier

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = beslutsmatrisen har inga alternativ

engine-e-mcda-wsm-criterion-has-an-invalid-weight = kriteriet '{ $name }' har en ogiltig vikt { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = kriterievikterna summerar till noll

engine-e-mcda-wsm-alternative-has-values-but-there = alternativet '{ $name }' har { $values } värden men det finns { $n } kriterier

engine-e-mcda-wsm-alternative-has-non-finite-value = alternativet '{ $name }' har ett icke-ändligt värde på kriteriet '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = inte en DAF: kortare än en post

engine-e-naif-kernel-not-daf-identification-word = inte en DAF: identifieringsord { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = binärformatet { $other } för DAF stöds inte

engine-e-naif-kernel-implausible-daf-header-nd-ni = osannolikt DAF-huvud: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF-adress { $addr } ligger bortom filens slut

engine-e-naif-kernel-bad-daf-address-range = felaktigt DAF-adressintervall { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = DAF-sammanfattningslistan avslutas inte

engine-e-naif-kernel-daf-summary-record-claims-summaries = DAF-sammanfattningsposten { $rec } anger { $count } sammanfattningar

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = felformat segment av typ 2: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = storleken på segmentet av typ 2 stämmer inte med dess katalog

engine-e-naif-kernel-epoch-outside-the-record = epok { $et } ligger utanför posten [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = storleken på segmentet av typ 1 stämmer inte med dess N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = felformad post av typ 1: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = inte en SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = SPK-sammanfattningen är inte ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = inga SPK-data av typ 1/2 för kropp { $target } vid ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = SPK-segmentet för { $target } ligger i systemet { $frame }, inte J2000

engine-e-naif-kernel-spk-centre-chain-does-not = SPK-centrumkedjan når inte barycentret

engine-e-naif-kernel-not-binary-pck = inte en binär PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = PCK-sammanfattningen är inte ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = inga PCK-data av typ 2 för systemet { $body_frame } vid ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = PCK-systemet { $body_frame } anges mot systemet { $other }, som inte är J2000 eller ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = felaktigt tal { $s }

engine-e-navsignal-must-be-positive-number = { $s } måste vara ett positivt tal

engine-e-navsignal-modulation-expected-name-args-bpsk = modulation { $label }: förväntade NAME(args), t.ex. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulation { $label }: avslutande parentes saknas

engine-e-navsignal-modulation-is-not-one-of = modulation { $label } är inte någon av BPSK(n), BOC(m,n) eller MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = oavslutad entitet i { $s }

engine-e-ndm-xml-bad-character-reference = felaktig teckenreferens &{ $ent };

engine-e-ndm-xml-unknown-entity = okänd entitet &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = oavslutad bearbetningsinstruktion

engine-e-ndm-xml-unterminated-comment = oavslutad kommentar

engine-e-ndm-xml-unterminated-declaration = oavslutad deklaration

engine-e-ndm-xml-expected-an-element-at-byte = förväntade ett element vid byte { $pos }

engine-e-ndm-xml-unterminated-start-tag = oavslutad starttagg

engine-e-ndm-xml-attribute-without-value = attribut utan värde

engine-e-ndm-xml-unterminated-attribute-value = oavslutat attributvärde

engine-e-ndm-xml-unterminated-end-tag = oavslutad sluttagg

engine-e-ndm-xml-unterminated-cdata = oavslutad CDATA

engine-e-ndm-xml-content-after-the-root-element = innehåll efter rotelementet

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } måste vara ändligt och icke-negativt

engine-e-nma-budget-subframe-must-be-positive = subframe_s måste vara positivt

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps måste vara positivt

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed måste vara 0 eller positivt

engine-e-nmea-synth-cli-unexpected-argument = oväntat argument { $s }

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = instruktörslogg: { $e }

engine-nmea-synth-cli-instructor-log-and = instruktörslogg: { $jp } och { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP-server lyssnar på { $s }; väntar på { $wait_clients } klient(er)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = förväntade YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = datum eller tid utanför intervallet (åren 1980 till 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = inget sådant kalenderdatum

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } måste vara ett ändligt tal

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s måste ligga i 1 till 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz måste vara 1, 2, 5 eller 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = fartygets position måste ligga inom 89 grader från ekvatorn

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn måste ligga i 0 till 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = fartygets gränser för girhastighet och acceleration måste vara positiva

engine-e-nmea-synth-config-give-at-least-one-waypoint = ange minst en [[waypoint]] eller vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = waypoint { $v1 } ligger utanför intervallet

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = waypoint { $v1 } speed_kn måste ligga i 0 till 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems måste ange minst en konstellation

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } är inte någon av { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s måste vara minst 1

engine-e-nmea-synth-config-event = händelse { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s måste ligga inom körningen

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s måste vara positivt; ramp_s och recovery_s får inte vara negativa

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s får inte överstiga duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } gäller inte för den här typen

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz måste ligga i 20 till 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db krävs

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db måste ligga i 0 till 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db måste ligga i 0 till 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m krävs

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m måste ligga i 0 till 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = släpningen skulle accelerera det falska spåret med upp till { $need } m/s^2, över max_accel_mps2 = { $a }; förläng ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = ange exakt en av bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s krävs

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s måste vara skilt från noll och inom ett dygn

engine-e-nmea-synth-config-delay-is-required = delay_s krävs

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s måste ligga i 0 till 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = siluetten beskriver inget hinder

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } har upphört

engine-nmea-synth-gen-the-receiver-reports-fix-again = mottagaren rapporterar åter en positionsbestämning ({ $n_used } satelliter används)

engine-nmea-synth-gen-the-receiver-has-no-fix = mottagaren har ingen positionsbestämning ({ $n_used } användbara satelliter, fyra behövs)

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = från T+{ $start_s } s i { $duration_s } s (inledande ramp { $ramp_s } s, återhämtningsramp { $recovery_s } s)

engine-nmea-synth-log-every-tracked-satellite-shows-db = ; varje spårad satellit visar { $c } dB-Hz så länge den varar

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: mottagen C/N0 sjunker med upp till { $cn0_drop_db } dB (spridning per satellit { $spread_db } dB); satelliter faller bort och positionsbestämningen går förlorad när färre än fyra förblir användbara

engine-nmea-synth-log-towards-deg-true = mot { $b } deg sann

engine-nmea-synth-log-towards-deg-true-deg-relative = mot { $t } deg sann ({ $r } deg relativt kursen vid starten, därefter hållen)

engine-nmea-synth-log-position-drag-off-the-reported = positionsbortdragning: den rapporterade positionen vandrar { $final_offset_m } m bort { $dir } medan mottagaren behåller en giltig positionsbestämning (det falska spåret når som mest { $pv } m/s och { $pa } m/s^2){ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = tidsspoofing: rapporterad UTC avviker { $offset_s } s från sann; positionen förblir sann{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = återspelningsfördröjning (meaconing-stil): positionen{ $v1 } släpar { $delay_s } s efter referensen{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = naturlig försämring: himlen stängs bakom en angiven siluett ({ $e }); satelliter bakom den förblir listade utan SNR och används inte, C/N0 för övriga är oförändrad, och inget är förfalskat

engine-nmea-synth-log-instructor-log = INSTRUKTÖRSLOGG: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Instruktörsanteckning: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Start { $start_utc }   varaktighet { $duration_s } s   frö { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }TOPPAR  sann: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   rapporterad: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: okänd konstellation { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Toleransen ligger under brusgolvet { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)) för rangavläsning i f64: dess motsvarande egenvärdesgolv rel_tol^2 = { $v1 } ligger under avrundningsbruset i Gram-matrisen, så de extra riktningarna är aritmetiska rester, inte observerbarhet.

engine-observability-gramian-rank-clamped-from-the-singular = rangen begränsad från antalet singulärvärden { $counted } till min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } vid rel_tol { $rel_tol }: en { $n_rows }x{ $n_cols }-matris kan inte ha rang { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP odefinierad (rangbrist / singulär geometri): rang { $rank } av { $n } tillstånd, datumdefekt { $v3 }, konditionstal { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bytes är inte ett helt antal poster på 36 bytes

engine-e-odf-record-precedes-any-group-header = post { $v1 } kommer före alla grupphuvuden

engine-e-odf-no-orbit-data-group = ingen omloppsdatagrupp

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } är inte ett nyckelord i { $name }

engine-e-odm-without = { $name } utan { $k }

engine-e-odm-needs-exactly-one-of = { $name } behöver exakt en av { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION och MESSAGE_ID är huvudnyckelord i version 3.0 (version { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = oväntad rad { $b }

engine-e-odm-unknown-keyword = okänt nyckelord { $k }

engine-e-odm-block-repeated-or-out-of = blocket { $block } upprepat eller i fel ordning vid { $key }

engine-e-odm-repeated = { $key } upprepat

engine-e-odm-comments-after-the-last-keyword = kommentarer efter det sista nyckelordet

engine-e-odm-given-twice = { $b } angivet två gånger

engine-e-odm-opm-without-metadata = OPM utan metadata

engine-e-odm-opm-without-state-vector = OPM utan tillståndsvektor

engine-e-odm-omm-without-metadata = OMM utan metadata

engine-e-odm-omm-without-mean-elements = OMM utan medelelement

engine-e-odm-is-not-keyword-of-the = { $k } är inte ett nyckelord i blocket { $kind }

engine-e-odm-block-without = blocket { $kind } utan { $k }

engine-e-odm-block-with-data-lines = blocket { $kind } med datarader

engine-e-odm-line-has-values-expected = { $kind }-raden { $l } har { $l2 } värden, förväntade { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } är inte ett OCM-metadatanyckelord

engine-e-odm-ocm-metadata-without = OCM-metadata utan { $k }

engine-e-odm-block-repeated = blocket { $kind } upprepat

engine-e-odm-inside-block = { $t } inuti ett block

engine-e-odm-unsupported-ocm-block = OCM-blocket { $tag } stöds inte

engine-odm-outside-block = { $t } utanför ett block

engine-e-odm-closes-block = { $t } avslutar ett block { $want }

engine-e-odm-unexpected-line-2 = oväntad rad { $t }

engine-e-odm-outside-block = { $k } utanför ett block

engine-e-odm-unterminated-block = oavslutat block

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = epoken saknar avgränsaren 'T' mellan datum och tid: { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = OEM-epokens datum '{ $date }' stöds inte (förväntade yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = OEM-epokens tid '{ $time }' stöds inte (förväntade HH:MM:SS)

engine-e-oem-bad-epoch-year = felaktigt epokår: { $d }

engine-e-oem-bad-epoch-month = felaktig epokmånad: { $d }

engine-e-oem-bad-epoch-day = felaktig epokdag: { $d }

engine-e-oem-bad-epoch-hour = felaktig epoktimme: { $t }

engine-e-oem-bad-epoch-minute = felaktig epokminut: { $t }

engine-e-oem-bad-epoch-second = felaktig epoksekund: { $t }

engine-e-oem-oem-epoch-field-out-of = OEM-epokfält utanför intervallet: { $s }

engine-e-oem-unexpected-oem-header-line = oväntad OEM-huvudrad: { $line }

engine-e-oem-expected-meta-start-found = förväntade META_START, hittade: { $line }

engine-e-oem-unexpected-oem-metadata-line = oväntad OEM-metadatarad: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM-segmentets metadata saknar META_STOP

engine-e-oem-oem-metadata-missing-object-name = OEM-metadata saknar OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = OEM-metadata saknar OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = OEM-metadata saknar CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = OEM-metadata saknar REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = OEM-metadata saknar TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = OEM-metadata saknar START_TIME

engine-e-oem-oem-metadata-missing-stop-time = OEM-metadata saknar STOP_TIME

engine-e-oem-oem-data-line-needs-position = en OEM-datarad behöver komponenter för position+hastighet (6) eller +acceleration (9), fick { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = icke-numeriskt OEM-tillståndsvärde '{ $t }' i: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM saknar huvudet CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = OEM saknar huvudet CREATION_DATE

engine-e-oem-oem-missing-originator-header = OEM saknar huvudet ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM innehöll inga segment

engine-oem-oem-interop-round-tripped-segment = oem-interop: round-trip för { $segments } segment, { $n_states_total } tillstånd; största round-trip-fel { $p } km / { $v } km/s (MODELLED interop)

engine-oem-oem-interop-ingested-segment-states = oem-interop: inläste { $segments } segment, { $n_states_total } tillstånd från extern OEM (upphovsman { $originator }) (MODELLED interop)

engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = inget COVARIANCE_START-block

engine-e-oem-no-covariance-stop = ingen COVARIANCE_STOP

engine-e-oem-bad-covariance-value = felaktigt kovariansvärde '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = förväntade 21 kovariansvärden, hittade { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM-export behöver kompletta TLE (rad 1 + rad 2); det här blocket har ingen

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

engine-e-optical-atmosphere-scenario-must-be-in = { $n } måste ligga i [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg måste ligga i [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave måste vara "plane" eller "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction måste vara "downlink" eller "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = posterna i availability_targets_pct måste ligga i (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h får vara högst 8760 (ett år)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } steg överstiger de { $MAX_STEPS } som ett resultat rymmer; höj step_s eller förkorta duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = okänd klockklass "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = varje plats behöver ett namn

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = plats { $name }: latitud/longitud utanför intervallet

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = plats { $name }: altitude_m måste ligga i [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm vid { $elevation_deg } deg elevation, marginal { $margin0 } dB före atmosfären; bästa plats { $scn } { $v5 } %; nätverk med { $order } platser { $last } % oberoende / { $last2 } % korrelerat väder (MODELLED, rådgivande)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = RINEX-blocket lästes men innehöll inga efemerider som stöds

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg måste ligga i [-90, 90] och alla fält vara ändliga

engine-e-orbit-no-satellites-to-export = inga satelliter att exportera

engine-e-orbit-time-step-must-be-positive = time.step_s måste vara positivt för SP3-export

engine-e-orbit-time-step-must-be-positive-2 = time.step_s måste vara positivt för OEM-export

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } måste vara positivt; fick { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s måste vara ändligt och icke-negativt

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate måste vara ändligt och icke-negativt

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = spoofarens minimielevation måste ligga i [0, 90) grader

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns för korskontrollen måste vara ändligt och icke-negativt

engine-orbital-timing-the-in-plane-neighbour-degrees = grannen i samma plan, { $v1 } grader framåt, ligger utanför en enskild spoofares fotavtryck ({ $v2 } grader brett)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = grannen i samma plan, { $v1 } grader framåt, kan ligga inom samma spoofares fotavtryck ({ $v2 } grader brett), så båda klockorna kan dras samtidigt

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = indatafil saknas

engine-e-osnma-cli-max-time-error-has-no = --max-time-error har ingen effekt utan --reference-time

engine-e-osnma-cli-not-number = inte ett tal: { $s }

engine-e-osnma-cli-public-key-must-be-id = den publika nyckeln måste vara ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = den publika nyckelns typ måste vara p256 eller p521

engine-e-osnma-cli-unknown-format = okänt format { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } är inte text; använd --format ubx för en UBX-ström

engine-e-osnma-cli-vector-csv-needs-start-gst = en vektor-CSV behöver --start-gst eller ett daterat filnamn

# legal: native review
engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    fel: kan inte läsa { $input }: { $e }

# legal: native review
engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA-verifiering
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = indata: { $input } ({ $pages } sidor)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: { $frames } ramar; { $inav_pages } I/NAV-sidor avkodade, { $pages } placerade i tid ({ $bad_crc } felaktig CRC, { $unstamped } kan inte placeras, { $time_conflicts } tidskonflikter)

engine-osnma-cli-overall-nma-status = totalt: { $status_word }   NMA-status: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = LARM: ett verifierat OSNMA-larmmeddelande togs emot. Sluta använda OSNMA-data; ingenting rapporteras som autentiserat.

engine-osnma-cli-freshness-not-enforced-no-reference = aktualitet: tillämpas INTE. Ingen referenstid angavs, så delramstider tas från indata och en återspelning av gamla data skulle autentiseras.

engine-osnma-cli-freshness-sub-frames-within-of = aktualitet: delramar inom { $max_err } s från referenstiden { $v2 } används; { $set_aside } sattes åt sidan. En referenstid är en enda tidpunkt.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satellit   status          autentiserad   felade  väntande förkastade senast autentiserad

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epok (tagg-delram)         tx   data  adkd  ctr  resultat

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = rad { $v1 }: förväntade 3 fält

engine-e-osnma-input-line-bad-svid = rad { $v1 }: felaktigt SVID

engine-e-osnma-input-line-bad-bit-count = rad { $v1 }: felaktigt antal bitar

engine-e-osnma-input-line-data-is-not-hex = rad { $v1 }: data är inte hex

engine-e-osnma-input-line-bit-count-does-not = rad { $v1 }: antalet bitar stämmer inte med data

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = tidstoleransen måste vara under en delram ({ $SUBFRAME_S } s), fick { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834-refraktion är definierad för stationshöjder 0 till 3 km; fick { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s och step_s måste vara positiva

engine-e-passes-station-lat-deg-must-be = station_lat_deg måste ligga i [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg måste ligga i [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours måste vara ändligt och positivt

engine-e-passes-step-must-be-finite-and = step_s måste vara ändligt och positivt

engine-passes-passes-pass-es-of-km = passes: { $passes } pass av en bana på { $altitude_km } km / { $inclination_deg }° över ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° på { $duration_hours } h; { $total_access_s } s total åtkomst (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = för kort { $record }-post: { $line }

engine-e-precise-products-bad-number-in = felaktigt tal { $s } i { $line }

engine-e-precise-products-bad-field-in = felaktigt fält { $s } i { $line }

engine-e-precise-products-bad-antex-epoch = felaktig ANTEX-epok { $s }

engine-e-precise-products-bad-offset = felaktig förskjutning { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = efemerisleverantören saknar geocentrisk { $name } vid JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D-fel RMS { $rms } m (max { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS efter anpassning { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } satelliter nav | { $epochs_solved }/{ $epochs_total } epoker lösta | medel { $mean_n_used } satelliter, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Enpunktspositionering — 3D-fel mot uppmätt koordinat (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Enpunktspositionering — RMS för residualer efter anpassning ({ $mean_postfit_rms_m } m i medel)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = RunOutputs arrayåtkomstmetoder kräver NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } är inte en numerisk array (en lista med tal, eller med lika långa listor med tal)

engine-e-python-is-not-non-empty-list = { $path } är inte en icke-tom lista med poster

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-e-python-and-must-be-the-same = i och q måste ha samma längd ({ $i } mot { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: inte infångad (statistik { $statistic } < tröskel { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } kanaler (utformning, PRN); högst 256 per svep

engine-python-not-acquired-statistic-threshold = { $code }: inte infångad (statistik { $statistic } < tröskel { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] behöver `label`

engine-e-python-runs-needs-result = runs[{ $i }] behöver `result`

engine-e-python-must-be-between-and-32 = { $name } måste ligga mellan 0 och 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | frö { $seed } | v{ $engine_version } | quantum vinner { $value }/{ $foms } kvalitetsmått | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } från { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = okänd baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = okänd candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = ADEV-taus/värden måste vara ändliga och > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | kandidat { $candidate_source } | tidshållning holdover { $timing_holdover_s }s mot { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | tröghet { $inertial_holdover_s }s mot { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | motståndskraft, fri färd { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = RINEX-klockfilen anger tidssystemet { $id }, som den här läsaren inte känner till (kända: { $known_clock_time_systems }); avvisar den hellre än att läsa dess epoker som GPS-tid

engine-e-realdata-clk-rinex-clock-file-has-satellite = RINEX-klockfilen har satellitsystemet { $other } och anger inget TIME SYSTEM ID; avvisar att gissa tidssystemet för dess epoker

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX-klockfilerna anger olika tidssystem ({ $s } och { $ts }); avvisar att foga ihop dem på en gemensam tidsaxel

engine-e-realdata-clk-no-as-or-ar-records = inga AS- eller AR-poster för { $id }

engine-e-realdata-clk-short-circular-row = kort Circular T-rad: { $t }

engine-e-realdata-clk-bad-value-in = felaktigt värde { $s } i { $t }

engine-e-realdata-clk-no-section-mjd-header-found = inget MJD-huvud för Section 1 hittades

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = oavslutad sluttagg

engine-e-realdata-ion-sdr-unbalanced-closing-tag = obalanserad sluttagg

engine-e-realdata-ion-sdr-unterminated-tag = oavslutad tagg

engine-e-realdata-ion-sdr-attribute-value-missing = attributvärde saknas

engine-e-realdata-ion-sdr-element-outside-the-document = element utanför dokumentet

engine-e-realdata-ion-sdr-text-outside-the-document = text utanför dokumentet

engine-e-realdata-ion-sdr-element-left-open = { $stack } element lämnade öppna

engine-e-realdata-ion-sdr-expected-one-root-element-found = förväntade ett rotelement, hittade { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = okänt frekvensformat { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = kodningen { $other } stöds inte

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } strömmar: bara filer med en enda ström läses

engine-e-realdata-ion-sdr-block-of-cycles-with-header = ett block med { $cycles } cykler med huvud eller sidfot upprepas; bara ett enda block som spänner över filen läses

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = chunk med { $words_per_chunk } ord på { $word_bytes } bytes

engine-e-realdata-ion-sdr-unsupported-sample-format = samplingsformatet { $other } stöds inte

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = kvantisering { $quantization } i { $packed_bits } packade bitar per sampel

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = samplingshastigheten { $sample_rate_hz } Hz är inte en heltalsmultipel av hastighetsfaktorn { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = ett chunk innehåller ingen hel lump

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = sampel { $start }..{ $v1 } begärdes, filen innehåller { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = oläsbar CRD-version { $f }

engine-realdata-llr-crd-crd-format-version-is-not = CRD-formatversion { $v } stöds inte (bara 1 och 2 delar den fältordning i post 11 som den här läsaren förutsätter)

engine-realdata-llr-crd-unreadable-station-id = oläsbart stations-id { $f }

engine-realdata-llr-crd-unreadable-time-scale = oläsbar tidsskala { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD-epokens tidsskala { $time_scale } är inte en av de tre som formatspecifikationen säger att analytiker godtar (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); läser den inte som UTC

engine-realdata-llr-crd-unreadable-h4-field = oläsbart h4-fält { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = oläsbart fält { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = oläsbar epokhändelse { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = icke-fysikalisk gångtid { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = kan inte läsa katalogen med normalpunkter { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = inga *.npt-filer med normalpunkter i { $dir } — det här scenariot läser verkliga arkiverade mätningar och körs inte utan dem

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = felaktigt tal '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM har en dimension som är noll

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = kodning { $encoding }: en LuGRE-batch är tvåkomplement

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bytes: kortare än IQS-huvudet

engine-e-realdata-lugre-not-an-iqs-frame = inte en IQS-ram: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = samplingshastighet: metadata { $sample_rate_hz } Hz, huvud { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = kvantisering: metadata { $quantization } bitar, huvud { $quant_bits } bitar

engine-realdata-lugre-centre-frequency-metadata-hz-header = mittfrekvens: metadata { $center_freq_hz } Hz, huvud { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = mellanfrekvens: metadata { $translated_freq_hz } Hz, huvud { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = antal sampel: metadatalayouten ger { $layout }, huvud { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = huvud/fot: metadata { $header_bytes }/{ $footer_bytes } bytes, format { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = fillängden { $file_len } är inte huvud + { $value } sampelbytes + fot

engine-realdata-lugre-field-missing = fältet { $key } saknas

engine-e-realdata-lugre-field-unreadable = fältet { $key } är oläsbart

engine-realdata-lugre-raw-line = RAW-rad { $v1 }: { $e }

engine-realdata-lugre-acq-line = ACQ-rad { $v1 }: { $e }

engine-realdata-lugre-nav-line = NAV-rad { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK-rad { $v1 }: oläsbar

engine-e-realdata-lugre-clk-row-columns-expected = CLK-rad { $v1 }: { $v } kolumner, förväntade 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = tolka JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = förväntade ett JSON-objekt på översta nivån

engine-e-realdata-yunnan-missing-recordtime-array = matrisen recordTime saknas

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = kan inte läsa EOP-filen { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s måste vara ändligt och icke-negativt, fick { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = kan inte läsa den senare EOP-filen { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = TOM, och avsiktligt: en rad med prediktion mot slutgiltigt värde behöver en utgivningsepok med ett KOMPLETT { $window_days }-dygns anpassningsfönster bakom sig och ett publicerat slutgiltigt Bulletin B-värde vid målepoken. Den gällande indatan ({ $eop_source }) ger ingen epok som uppfyller båda. Korta ned `operational_window_days`, eller ange en längre verklig finals2000A-serie — ingen rad tillverkas för att fylla tabellen.

engine-realtime-frame-eop-measured-over-the-real-series = Uppmätt över den verkliga serie som gäller ({ $eop_source }). Varje rad är ett äkta prediktionsfel: en prognos för T+h som bildats av snabba Bulletin A-rader vid eller före T, poängsatt mot det SENARE publicerade slutgiltiga Bulletin B-värdet vid T+h. Persistens poängsätts över samma epokmängd mot samma slutgiltiga värden, så de två kolumnerna skiljer sig i prediktorn och i inget annat. `improvement_factor` under 1 betyder att den operativa prediktorn är SÄMRE än persistens vid den horisonten, och redovisas så.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Uppmätt över ett äkta par med två utgåvor: den utgåva som gavs ut ({ $eop_source }) innehåller verkliga Bulletin A-prediktioner bortom sin egen dataavgränsning, och den arkiverade senare utgåvan ({ $c }) innehåller de slutgiltiga Bulletin B-värden som dessa datum till sist fick. Tre prognoser poängsätts mot det slutgiltiga värdet — själva den arkiverade Bulletin A-prediktionen, den här cratens anpassning i operativ stil över den utgivna utgåvan och persistens vid avgränsningen.

engine-realtime-frame-eop-empty-and-deliberately-so-later = TOM, och avsiktligt: en senare utgåva angavs ({ $c }) men inget datum finns både som Bulletin A-PREDIKTION i den utgivna filen ({ $eop_source }) och som Bulletin B-SLUTGILTIGT värde i den senare vid någon begärd horisont. Ingen rad syntetiseras.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = TOM, och avsiktligt. För att poängsätta en ÄKTA ARKIVERAD prediktion krävs två utgåvor av samma finals2000A-produkt; den här körningen fick en ({ $eop_source }). Repositoriet levererar ingen arkiverad tidigare utgåva, och ingen TILLVERKAS genom att störa den utgåva som finns — ett syntetiserat arkiv skulle göra varje tal i den här tabellen till en mätning av störningen. Ange en verklig arkiverad senare utgåva via `eop_finals2000a_later` för att fylla den. Tills dess finns de äkta felen mellan prediktion och slutgiltigt värde som den här rapporten innehåller i `table5_operational_vs_persistence`, där prognosen är den här cratens egen och referensen är det senare publicerade slutgiltiga Bulletin B-värdet.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabell 1: efterbearbetning { $c } m ({ $c2 } ms UT1) ↔ realtid { $c3 } m ({ $c4 } ms UT1) | Tabell 2: slutligt golv { $floor } ms → { $far }-dygn { $far2 } ms | budget totalt { $total_m } m ({ $total_time_ns } ns) | L19 hävarm + L18 verkliga data (prövad mot en oberoende extern referens), OD-kovarians (beräknad ur en modell, utan extern referens)

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

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Uppmätt över ett äkta par med två utgåvor: den PREDIKTERADE UT1 i Bulletin A i den utgivna filen ({ $eop_source }) differentierad mot det slutgiltiga Bulletin B-värdet i den arkiverade senare utgåvan ({ $c }), vid { $predicted_vs_final } horisont(er).

engine-realtime-frame-eop-empty-and-deliberately-so-an = TOM, och avsiktligt: en arkiverad senare utgåva angavs ({ $c }) men inget datum finns både som Bulletin A-PREDIKTION i den utgivna filen ({ $eop_source }) och som Bulletin B-SLUTGILTIGT värde i den senare vid någon begärd horisont, så det finns ingen residual mellan prediktion och slutgiltigt värde att redovisa. Ingen rad syntetiseras.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = TOM, och avsiktligt: en residual mellan prediktion och slutgiltigt värde kräver TVÅ utgåvor av samma finals2000A-produkt. Den här körningen fick en ({ $eop_source }). Dess Bulletin A-prediktionsrader gäller framtida datum som ännu inte har något slutgiltigt Bulletin B-värde, så residualen finns inte att mäta och ingen hittas på här. Ange en arkiverad senare utgåva via `eop_finals2000a_later` för att fylla den här tabellen. Tills dess är den flerdagarstillväxt som redovisas i `table2_error_vs_horizon` PERSISTENS-prediktorn poängsatt över de verkliga slutgiltiga värdena — ett verkligt uppmätt fel, men en prediktor beräknad ur en modell, utan extern referens, och inte residualen för IERS Bulletin A-prediktionen.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = en bedömning av fartyg kräver [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = utdraget är { $excerpt } bytes; gränsen är { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = utdraget innehåller fler än { $MAX_EXCERPT_EPOCHS } epoker; korta ned det

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = utdraget slutar inom kalibreringsfönstret på { $calibration_s } s ({ $epochs } epoker): inget poängsattes

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = ingen UTC-märkt epok i UBX-loggen

engine-e-receiver-trust-calibration-no-scenario-json-under = ingen scenario.json under { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: Pfa för ren undanhållen datamängd <= { $B1_MAX_PFA } (kalibrerad: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } måste vara ändligt och > 0 (fick { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel måste vara ändligt och >= 0 (fick { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used måste vara minst 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg måste ligga i [0, 90] (fick { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg måste ligga i (0, 360] (fick { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points måste ligga i [0, 100] (fick { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio måste vara ändligt och > 1 (fick { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor måste ligga i (0, 100] (fick { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) ligger under poängens degraded_min ({ $degraded_min }): enbart geometrin kunde nå det ej betrodda bandet

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites = geometri { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satelliter{ $v6 }

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: geometriavdraget klassas som en inkonsekvens

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: redovisas, poängsätts inte (geometrin är inte dålig)

engine-receiver-trust-geometry-not-scored-the-score-deducts = poängsätts inte (poängen drar av först över HDOP { $hdop_max }, PDOP { $pdop_max } eller under { $min_used } satelliter)

engine-receiver-trust-geometry-derived-from-logged-satellites = härledd ur { $n } loggade satelliter

engine-receiver-trust-geometry-as-the-receiver-reports-it = enligt mottagarens rapport, { $n } satelliter använda

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = det angivna HDOP { $fmt_dop } avviker från HDOP { $fmt_dop2 } som härletts ur den angivna himlen, mer än toleransen

engine-receiver-trust-geometry-satellites-in-view-but-not = satelliter i sikte men inte spårade ({ $g } av { $in_view } vid eller över { $low_elev_deg } deg): signalmiljö, inte geometri

engine-receiver-trust-geometry-satellites-fewer-than = { $n } satelliter, färre än { $min_used }

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } över { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } över { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satelliter bakom den angivna skylinen

engine-receiver-trust-geometry-every-satellite-in-one-half = alla satelliter i ena halvan av himlen (lucka { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = försämrad av geometri: { $parts } ({ $from }); inte en inkonsekvens

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = loggen innehåller inga epoker: inget i den gick att läsa som { $name } ({ $skipped_records } poster hoppades över som skadade eller otolkbara); kontrollera formatinställningen

engine-receiver-trust-ingest-gps-week-tow = GPS-vecka { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS-vecka { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (datum finns inte i loggen)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } måste vara ändligt och >= 0 (fick { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s måste vara över 0

engine-e-receiver-trust-live-invalid-session = ogiltig session: { $e }

engine-receiver-trust-live-no-score-could-be-produced = ingen poäng kunde tas fram: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = ingen GNSS-SDR-post av typen synchro eller pvt gick att läsa ({ $skipped } rader hoppades över); se integrations/gnss-sdr/README.md för radformatet

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = IMU-filen är tom

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: ingen kolumn `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: ingen kolumn `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = IMU-filen innehåller inget läsbart sampel

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis måste vara 0, 1 eller 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean måste vara ändligt

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at = loggen har { $n } sampel; minst { $MIN_SAMPLES } behövs för en Allan-anpassning

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = loggens tid går inte framåt

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = samplingsintervallet är inte likformigt ({ $uneven } av { $n } intervall avviker med över 25 %): omsampla loggen först

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = loggen är för kort för att bilda en Allan-kurva

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = kurvan { $name } har en tidig lutning på { $v }, inte omkring -0.5: vitt brus dominerar inte (står sensorn still?), så dess brusskoefficient är opålitlig

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = kurvan { $name } är för kort för att kontrollera dess lutning

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

engine-receiver-trust-machines-novatel-gps-week-tow = GPS-vecka { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = ingen BESTPOS-, RANGE- eller RXSTATUS-logg gick att läsa ({ $skipped } poster hoppades över)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = ingen giltig RTCM 3-ram hittades ({ $skipped } kandidater klarade inte CRC-kontrollen)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } måste vara ändligt och > 0 (fick { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard måste ligga i (0, 1) (fick { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac måste ligga i [0, 1] (fick { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } måste ligga i (0, 1) (fick { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats måste vara minst 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s måste vara minst 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = monitor config: okänd profil "{ $other }"; kända: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = monitor config: { $name } måste vara ändligt och > 0 (fick { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = monitor config: jam_ind_threshold måste vara ändligt

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = monitor config: mask_deg måste ligga i [-90, 90) (fick { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = monitor config: raim_pfa måste ligga i (0, 1) (fick { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = monitor config: cn0_min_sats måste vara minst 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = monitor config: sats_lost måste vara minst 1

engine-receiver-trust-monitors-the-receiver-own-set-against = mottagarens egen { $self_report_source }-uppsättning mot Kshanas monitorer; ingen av dem är referens, samstämmighet är ingen prövning mot en oberoende extern referens

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = mottagarens tidslinje har en icke-ändlig epoktid

engine-e-receiver-trust-monitors-the-log-is-shorter-than = loggen är kortare än kalibreringsfönstret: { $calibration_epochs } epok(er) före { $cal_s } s (loggen spänner över { $span } s); minst 3 behövs för att bilda baslinjen

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } måste ligga i ({ $lo }, { $hi }] (fick { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } gäller bara för kind = "vessel" (kind är "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = kan inte läsa { $path }: WebAssembly-bygget har inget filsystem; ange filen direkt som `text` eller `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` är inte giltig standard-base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: ange en av `path`, `text` eller `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: ange bara en av `path`, `text` eller `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } måste vara ett positivt tal, fick { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = händelse { $label }: onset_s måste vara ett icke-negativt tal

engine-e-receiver-trust-scenario-event-end-must-be-after = händelse { $label }: end_s måste ligga efter onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg och time_offset_s måste vara ändliga

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = betrodd genomgående: ingen monitor larmade under { $after_cal } epoker efter kalibreringen

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = första larm vid { $t } s; ej betrodd under { $untrusted_epochs } och försämrad under { $degraded_epochs } av { $after_cal } epoker efter kalibreringen

engine-receiver-trust-scenario-of-stated-events-detected-within = ; { $events_detected } av { $events_evaluable } angivna händelser upptäcktes inom { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = ; { $predictions_agreeing } av { $predictions_evaluable } C/N0-prediktioner inom { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = ; förtroendepoäng lägst { $min }, slutlig { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = scenario { $r } | receiver-trust | { $format_name }-logg, { $epochs } epoker över { $duration_s } s | monitorer { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = det här är ett { $k }-scenario, inte ett receiver-trust-scenario

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } måste vara ändligt (fick { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: kräver 0 < degraded_min < nominal_min <= 100 (fick { $degraded_min } och { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s måste vara ändligt och >= 0 (fick { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: kräver 0 <= onset_ratio < full_ratio (fick { $onset_ratio } och { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: vikten för { $m } måste ligga i [0, 100] (fick { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s måste vara ändligt och positivt

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg måste ligga i (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 måste vara ändligt och positivt

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m och rho0_kg_m3 måste vara ändliga och positiva

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m måste ligga i [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = återinträde (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> topp { $v3 } g vid { $v4 } km, { $velocity_at_peak_deceleration } m/s; uppvärmningen toppar vid { $velocity_at_peak_heating } m/s; punktmassa (gravitation, krökning, US76) topp { $peak_deceleration_g } g (MODELLED ballistisk, ingen aerotermisk)

## src/registry.rs

engine-e-registry-unknown-scenario-id = okänt scenario-id: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = TRL-bandet ({ $lo },{ $hi }) är inte välformat (kräver 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = Ett påstående beräknat ur en modell, utan extern referens (enbart simulering), kan inte vara representativt över TRL { $MODELLED_TRL_CEILING } (band hi={ $hi }); högre TRL är en lucka, inte ett simuleringsresultat

engine-representativeness-representativeness-representative-for-trl = Representativitet [{ $status }] — { $claim } (representativ för TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = deklarerad({ $arch }) x genomsnittlig källkvalitet

engine-resilience-score-weakest-rpcf-sub-score-bounded = svagaste RPCF-delpoäng = { $min_sub }; begränsad försämring = { $bounded } (tak vid nivå 2 om obegränsad)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = navigeringspostens huvud { $head } stöds inte: en rad som börjar med '>' är ett RINEX 4-posthuvud, inte en RINEX 3-navigeringspost

engine-e-rinex-bad-prn-in = felaktigt PRN i { $head }

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4-navigering: förväntade ett '>'-posthuvud, hittade { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4-posten { $head } har { $body } rader, en { $msg }-efemerid behöver 8

engine-e-rinex-rinex-record-is-followed-by = RINEX 4-posten { $head } följs av { $body }, inte { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = felaktigt { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = RINEX-observationsfilen har ingen END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = RINEX-observationsfilen innehöll inga epokposter

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s måste vara ändligt och > 0 (fick { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s måste vara ändligt och > 0 (fick { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) får inte överstiga time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps = tidsrutnätet är för stort: { $n } steg överstiger MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); använd ett grövre steg eller en kortare varaktighet

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = samplingshastigheten är kommensurabel med kodhastigheten ({ $samples_per_chip } sampel/chip, { $offset_from_integer_samples } sampel från ett heltal): kodreplikan med nollte ordningens hållning kan inte särskilja en kodfasändring under { $dead_band_chips } chip, så Early/Late-diskriminatorn blir en trappa med ett dödband på ett sampel i stället för en triangel och DLL:en ställer in sig på fel fördröjning. Förskjut samplingshastigheten från heltalsmultipeln (5 MHz är 4.8876 sampel/chip; 25 MHz är 24.4379) eller översampla tillräckligt långt för att dödbandet ska ligga under den kodfasnoggrannhet du behöver.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = SGP4-felkod { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = SigMF core:datatype { $other } stöds inte: den här läsaren hanterar de komplexa typerna cf32_le, ci16_le och ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: bara enkanaliga inspelningar läses

engine-e-sigmf-cannot-serialise-sigmf-metadata = kan inte serialisera SigMF-metadata: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = ogiltigt SigMF-tilläggsnamnrymd { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } tilläggskartor för annotationer för { $annotations2 } annotationer

engine-e-sigmf-extension-key-is-not-in = tilläggsnyckeln { $k } finns inte i namnrymden { $ns }

engine-e-sigmf-extension-key-is-already-present = tilläggsnyckeln { $k } finns redan

engine-e-sigmf-global-is-not-an-object = global är inte ett objekt

engine-e-sigmf-annotations-is-not-an-array = annotations är inte en matris

engine-e-sigmf-annotation-is-not-an-object = annotationen är inte ett objekt

engine-e-sigmf-invalid-sigmf-metadata-json = ogiltig SigMF-metadata-JSON: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = SigMF-inspelningen anger ingen positiv core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = SigMF-inspelningen börjar vid sampel { $start }, bortom de { $data } sampel som finns i data

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } måste ligga i [0, 90) grader, fick { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } måste vara ett ändligt tal, fick { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: en kanjon behöver width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m måste vara positivt, fick { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: kanjonens höjder och antenna_m måste vara icke-negativa

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m måste vara positivt, fick { $l }

engine-e-skyline-skyline-table-is-empty = skyline: tabellen är tom

engine-e-skyline-skyline-table-has-rows-over = skyline: tabellen har { $rows } rader, över taket på { $MAX_TABLE_ROWS } rader

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: tabellens azimut { $az } ligger utanför [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: tabellens azimuter måste öka strikt ({ $az } följer på { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: fler än { $MAX_SECTORS } sektorer

engine-e-skyline-skyline-the-sector-az-from = skyline: sektorn az_from = { $az_from } till az_to = { $az_to } är tom (en hel cirkel är en tabell eller masken)

engine-e-skyline-skyline-more-than-terrain-points = skyline: fler än { $MAX_TABLE_ROWS } terrängpunkter

engine-e-skyline-skyline-terrain-distance-must-be = skyline: terrängens distance_m måste vara positivt, fick { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance }; med fält som åsidosatts eller lagts till av { $user }

engine-skyline-stated-input = Angiven indata: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = okänd skyline-förinställning "{ $name }"; kända förinställningar: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = ett datablad behöver minst två Allan-avvikelsepunkter

engine-e-slot-timing-datasheet-point-must-have-positive = databladspunkten ({ $t }, { $s }) måste ha en positiv medelvärdestid och en positiv Allan-avvikelse

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s måste vara ett positivt antal sekunder

engine-e-slot-timing-phase-record-needs-at-least = en fasregistrering behöver minst 32 sampel för att anpassa en brusmodell; fick { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = fasregistreringen innehåller ett icke-ändligt sampel

engine-e-slot-timing-the-phase-record-yields-fewer = fasregistreringen ger färre än tre Allan-avvikelsepunkter

engine-e-slot-timing-must-be-finite-and-non = { $name } måste vara ändligt och icke-negativt; fick { $v }

engine-e-slot-timing-the-slot-guard-must-be = slotguarden måste vara en positiv tid

engine-e-slot-timing-sigma-must-be-positive = k_sigma måste vara positivt

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset måste vara ändligt

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k måste vara ändligt

engine-e-slot-timing-give-exactly-one-of-oscillator = ange exakt en av oscillator.class, oscillator.preset, oscillator.datasheet eller oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = okänd oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = okänd oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = standardvärde för klassen { $c }: sigma_y(1 s) från { $c2 }; rödbrusgolv syntetiserat två och fyra dekader under det (ett antagande, inte en mätning)

engine-slot-timing-fitted-to-the-allan-deviation = anpassad till Allan-avvikelsens maxima i { $document }, skalad så att den ligger vid eller över varje punkt

engine-slot-timing-fitted-to-the-overlapping-allan = anpassad till den överlappande Allan-avvikelsen för en registrering på { $n_samples } sampel vid { $tau0_s } s, i frekvensmodulationsbasen enligt IEEE Std 1139

engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } källa): guard { $c } ns vid k={ $k_sigma } bryts { $fmt_s } efter en positionsbestämning ({ $fmt_s2 } kvar); positionsbestämning minst var { $fmt_s3 } ({ $fixes_per_day } per dygn); dominerande term: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epoken '{ $s }' måste vara YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = epok '{ $s }': felaktigt { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb måste vara ändligt

engine-e-solar-system-table-must-be-auto-table1 = table måste vara auto, table1 eller table2; fick '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = ingen efemerid för länken { $name } till { $name2 } vid JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = epoken JD { $jd } TDB ligger utanför 3000 f.Kr. till 3000 e.Kr., Standish-tabellernas omfång

engine-e-solar-system-track-points-must-be-to = track_points måste vara 8 till 2000; fick { $n_track }

engine-e-solar-system-unknown-observer-body = okänd observatörskropp '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies måste ange minst en kropp

engine-e-solar-system-unknown-body = okänd kropp '{ $n }'

engine-e-solar-system-no-position-for-at-jd = ingen position för { $name } vid JD { $jd } TDB (Pluto gäller bara 1800 e.Kr. till 2050 e.Kr.)

engine-e-solar-system-no-standish-elements-for = inga Standish-element för { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliocentriskt tillstånd läst av motorns egen läsare

engine-e-solar-system-unknown-link-body = okänd länkkropp '{ $from }'

engine-e-solar-system-unknown-link-body-2 = okänd länkkropp '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = en länk behöver två olika kroppar; fick { $name }

engine-solar-system-solar-system-at-jd-tdb =
    Solsystemet vid { $input } (JD { $jd_tdb } TDB), { $n_bodies } kroppar, observatör { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = ljustid { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }länk { $from } -> { $to }: enkel väg { $one_way_light_time_s } s, tur och retur { $two_way_light_time_s } s, Shapiro { $l } us, Solen { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = epok { $input } · { $standish_table } · positioner från Standish-elementen

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = en epok behöver 6 tidsfält, fick { $tokens }

engine-e-sp3-bad-second = felaktig sekund: { $tokens }

engine-e-sp3-record-needs-values-missing-column = en post behöver 4 värden, kolumn { $v1 } saknas

engine-e-sp3-bad-number = felaktigt tal: { $field }

engine-e-sp3-empty-sp3-input = tom SP3-indata

engine-e-sp3-first-line-is-not-an = första raden är inte ett SP3-huvud: { $first }

engine-e-sp3-unsupported-sp3-version-in = SP3-versionen i { $first } stöds inte

engine-e-sp3-missing-epoch-count-on-header = antalet epoker saknas på huvudrad 1

engine-e-sp3-record-has-no-satellite-id = posten har inget satellit-id: { $line }

engine-e-sp3-position-record-before-any-epoch = positionspost före något epokhuvud

engine-e-sp3-sp3-file-contained-no-epoch = SP3-filen innehöll inga epokposter

engine-e-sp3-bad-accuracy-exponent-in = felaktig noggrannhetsexponent { $f } i { $line }

engine-e-sp3-bad-header-accuracy = felaktig huvudnoggrannhet { $t }

engine-e-sp3-short-line = kort %f-rad { $line }

engine-e-sp3-bad-base-in = felaktig %f-bas i { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = versionen överstiger 3 bitar

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID överstiger 11 bitar (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count överstiger 14 bitar (0..=16383)

engine-e-space-packet-data-field-must-be-at = datafältet måste vara minst en oktett

engine-e-space-packet-data-field-exceeds-65536-octets = datafältet överstiger 65536 oktetter

engine-e-space-packet-packet-shorter-than-the-octet = paketet är kortare än huvudet på 6 oktetter: { $bytes } bytes

engine-e-space-packet-declared-data-length-header-octets = angiven datalängd { $data_len } (+6 huvud) = { $total } oktetter, men bufferten är { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC-grova oktetter { $coarse_octets } utanför 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = CUC-fina oktetter { $fine_octets } utanför 0..=3 (det utökade P-fältet stöds inte)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-fält { $p }: utökat P-fält stöds inte

engine-e-space-packet-field-time-code-id-is = P-fält { $p }: tidskods-id { $id } är inte CUC

engine-e-space-packet-field-is-not-cds-field = P-fält { $p } är inte ett CDS P-fält

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-fält { $p }: reserverad submillisekundskod 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC grov { $coarse } ryms inte i { $c } oktetter

engine-e-space-packet-cuc-fine-does-not-fit = CUC fin { $fine } ryms inte i { $n } oktetter

engine-e-space-packet-cds-days-do-not-fit = CDS-dagar { $days } ryms inte i { $f } oktetter

engine-e-space-packet-cds-ms-of-day-above = CDS ms av dygnet { $ms_of_day } över 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS submillisekund { $submillis } över { $max_sub }

engine-e-space-packet-time-code-format-and-value = tidskodens format och värde hör till olika koder

engine-e-space-packet-time-code-no-field-octet = tidskod: ingen P-fältsoktett

engine-e-space-packet-time-code-needs-octets-present = tidskoden behöver { $end } oktetter, { $bytes } finns

engine-e-space-packet-time-code-format-differs-from = tidskodens format skiljer sig från det implicita P-fältet

engine-e-space-packet-the-format-has-time-code = formatet har ett tidskodsfält; inget angavs

engine-e-space-packet-the-format-has-no-time = formatet har inget tidskodsfält

engine-e-space-packet-ancillary-data-is-octets-the = hjälpdata är { $ancillary } oktetter; formatet anger { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = ett sekundärt huvud måste innehålla minst en oktett

engine-e-space-packet-secondary-header-needs-octets-present = det sekundära huvudet behöver { $end } oktetter, { $bytes } finns

engine-e-space-packet-the-format-has-secondary-header = formatet har ett sekundärt huvud; inget angavs

engine-e-space-packet-the-format-has-no-secondary = formatet har inget sekundärt huvud

engine-e-space-packet-secondary-header-flag-disagrees-with = flaggan för sekundärt huvud { $v1 } stämmer inte med formatet

engine-e-space-packet-data-field-shorter-than-the = datafältet är kortare än PEC

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } stämmer inte med paketets CRC { $crc16_ccitt_false }

engine-e-space-packet-nothing-to-segment-empty-user = inget att segmentera: tomma användardata

engine-e-space-packet-max-user-octets-must-be = max_user_octets måste vara minst 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count överstiger 14 bitar (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } där { $a } förväntades

engine-space-packet-sequence-count-repeated = sekvensräknaren { $sequence_count } upprepades

engine-space-packet-sequence-count-gap-after-packet = lucka i sekvensräknaren: { $sequence_count } efter { $last } ({ $v2 } paket saknas)

engine-space-packet-sequence-count-out-of-order = sekvensräknaren i fel ordning: { $sequence_count } efter { $last }

engine-space-packet-packet-with-no-unit-open = { $f }-paket utan öppen enhet

engine-space-packet-packet-while-unit-is-open = { $f }-paket medan en enhet är öppen

engine-e-space-packet-packet = paket { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = sekvensen slutar med en enhet som fortfarande är öppen (inget sista paket)

engine-e-space-packet-apid-must-be-in-2047 = apid måste ligga i 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count måste vara >= 1

engine-e-space-packet-data-len-must-be-in = data_len måste ligga i 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = internt fel: avvikelse i rundtur för kodning/avkodning

engine-space-packet-space-packet-framed-ccsds-133 = space-packet: inramade { $packet_count } CCSDS-133.0 { $v2 }-paket APID { $apid }, { $total_bytes } oktetter totalt, rundtur exakt ({ $round_trip_ok })

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 måste vara ändligt och positivt

engine-e-space-weather-f107a-must-be-finite-and = f107a måste vara ändligt och positivt

engine-e-space-weather-kp-must-be-in = kp måste ligga i [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km får inte vara tom

engine-e-space-weather-altitude-km-must-be-finite = höjden { $h } km måste vara ändlig och positiv

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; densitet x{ $density_activity_factor } vid { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: en { $what }-jammer behöver en positiv bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: en chirp-jammer behöver en positiv sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to anger det okända bandet { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: ange antingen received_power_dbw, eller eirp_dbw med ett positivt range_m (inte båda)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s måste ligga efter on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: samplingshastigheten måste vara positiv

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } måste vara en tvåpotens, minst 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } sampel är färre än ett segment på { $nfft } punkter

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } måste vara en tvåpotens, minst 16

engine-e-spectrum-cannot-read-recording-meta-path = kan inte läsa inspelningens meta_path { $meta_path }: { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = kan inte läsa inspelningsdata { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz måste vara positivt

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: modulation { $m } kan inte väljas (bara galileo-e1 tar "mboc" eller "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: signal { $sig } finns inte i biblioteket med signalförinställningar ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: en förinställd signal har sin egen modulation; ta bort `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: signal { $sig } anger ingen mottagen effekt; ange signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: ett eget band behöver `modulation`, t.ex. "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: ett eget band behöver signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: ange antingen `signal` eller `centre_mhz`, inte båda

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: ange rx_bandwidth_mhz (ingen huvudlob kunde hittas)

engine-e-spectrum-duration-must-be-at-least = duration_s måste vara minst ett step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } tidsrader är fler än de 5000 som tillåts

engine-e-spectrum-at-most-extra-panels = högst 8 extra paneler

engine-e-spectrum-panel-need-max-mhz-min = panel { $name }: kräver f_max_mhz > f_min_mhz och 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = grid: kräver f_max_mhz > f_min_mhz och 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = scenario spectrum | { $bands } band | { $jammers } jammers | brusgolv { $n0_db } dBW/Hz | sämsta band { $name } min C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = scenario spectrum | inga band | brusgolv { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples måste ligga mellan 10 och 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: använd cf32_le eller ci16_le

engine-spectrum-frequency-across-time-down-colour = frekvens på tvären, tid nedåt, färg = effekttäthetsspektrum (dBW/Hz); brusgolv { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = varje panel har sitt eget frekvensområde, en tidslinje nedåt, en färgskala (dBW/Hz); brusgolv { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = referenssystemet { $other } har ingen NAIF-kod som stöds

engine-e-spk-writer-segment-name-longer-than-40 = segmentnamnet är längre än 40 tecken: { $name }

engine-e-spk-writer-segment-name-has-non-printing = segmentnamnet innehåller icke-utskrivbara tecken: { $name }

engine-e-spk-writer-bad-target-for-centre = felaktigt mål { $target } för centrum { $centre }

engine-e-spk-writer-degree-outside-27 = grad { $degree } utanför 1..=27

engine-e-spk-writer-type-13-degree-is-not = typ 13, grad { $degree } är inte udda

engine-e-spk-writer-states-for-epochs = { $states } tillstånd för { $n } epoker

engine-e-spk-writer-states-degree-needs = { $n } tillstånd; grad { $degree } behöver { $value }

engine-e-spk-writer-descriptor-start-is-not-before = deskriptorns start ligger inte före dess slut

engine-e-spk-writer-epochs-are-not-strictly-increasing = epokerna ökar inte strikt

engine-e-spk-writer-the-epochs-do-not-cover = epokerna täcker inte deskriptorns intervall

engine-e-spk-writer-type-or-13-segment-carries = ett segment av typ 9 eller 13 innehåller tillstånd, inte poster

engine-e-spk-writer-type-segment-needs-at-least = ett segment av typ 3 behöver minst en post

engine-e-spk-writer-type-degree-outside-27 = typ 3, grad { $degree } utanför 0..=27

engine-e-spk-writer-type-interval-length-is-not = typ 3, intervallängd { $intlen } är inte positiv

engine-e-spk-writer-type-record-has-coefficients-expected = typ 3, post { $i } har { $value } koefficienter, förväntade { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = deskriptorns start ligger efter dess slut

engine-e-spk-writer-descriptor-starts-before-the-first = deskriptorn börjar före den första posten

engine-e-spk-writer-descriptor-ends-after-the-last = deskriptorn slutar efter den sista posten

engine-e-spk-writer-type-segment-carries-records-not = ett segment av typ 3 innehåller poster, inte epoker eller tillstånd

engine-e-spk-writer-type-21-segment-needs-at = ett segment av typ 21 behöver minst en differensrad

engine-e-spk-writer-difference-line-size-is-not = differensradens storlek { $dlsize } är inte 4 MAXDIM + 11 med MAXDIM i 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = differensrader av olika storlek

engine-e-spk-writer-epochs-for-difference-lines = { $epochs } epoker för { $n } differensrader

engine-e-spk-writer-difference-line-epochs-are-not = differensradernas epoker ökar inte strikt

engine-e-spk-writer-the-last-difference-line-ends = den sista differensraden slutar före deskriptorn

engine-e-spk-writer-zero-step-size-in-difference = steglängd noll { $j } i differensrad { $i }

engine-e-spk-writer-type-21-segment-carries-difference = ett segment av typ 21 innehåller differensrader, inte tillstånd

engine-e-spk-writer-an-spk-needs-at-least = en SPK behöver minst ett segment

engine-e-spk-writer-segment = segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = kommentarsraden innehåller icke-utskrivbara tecken: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = kommentarer behöver { $nchars } tecken; { $v1 } är reserverade (höj ncomch)

engine-e-spk-writer-difference-line-orders-out-of = differensradens ordningar { $kqmax1 } { $kq } utanför intervallet

engine-e-spk-writer-zero-step-size-at-index = steglängd noll vid index { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } utanför segmentet [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = segment { $name } av typ 3 är för kort

engine-e-spk-writer-type-segment-words-for-rsize = segment { $name } av typ 3: { $nw } ord för N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = segment { $name } av typ 21 är för kort

engine-e-spk-writer-type-21-segment-words-for = segment { $name } av typ 21: { $nw } ord för N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segment { $name } är för kort

engine-e-spk-writer-segment-words-for = segment { $name }: { $nw } ord för N = { $n }

engine-e-spk-writer-segment-is-in-frame = segment { $name } ligger i referenssystemet { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = SPK-centrumkedjan tar inte slut

engine-e-spk-writer-no-spk-chain-connects-and = ingen SPK-kedja förbinder { $target } och { $observer } vid ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = epoken { $s } är inte YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = tidssystemet { $other } stöds inte (UTC eller TDB)

engine-e-spk-writer-centre-has-no-supported-naif = centrum { $other } har ingen NAIF-id som stöds

engine-e-spk-writer-oem-segment-has-no-data = OEM-segmentet { $name } har inga datarader

engine-e-spk-writer-oem-segment-no = OEM-segment { $idx }: ingen { $k }

engine-e-spk-writer-no-export-settings-for-oem = inga exportinställningar för OEM-segment { $idx }

engine-e-spk-writer-oem-data-line-has-fields = OEM-datarad har { $f } fält: { $line }

engine-e-spk-writer-oem-value = OEM-värde { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } OEM-segment för { $exports } exportinställningar

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (fused) — lager: { $fired }

engine-spoof-detect-single-layer-indication-below-the = indikation från ett enda lager ({ $fired }) under den sammanslagna tröskeln — styrkande underlag behövs

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg måste vara positivt, fick { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = panel { $i }: arean måste vara >= 0

engine-e-srp-boxwing-panel-outside = panel { $i }: { $name } = { $c } utanför [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = panel { $i }: absorption + spegelreflektion + diffus reflektion = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = panel { $i }: noll normal/axel

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = ECOM2-normalmatrisen är singulär eller illa konditionerad

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 min

engine-ssv-check-mod4-min = { $key } MOD4 min

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = heo-förinställning

engine-e-ssv-check-lunar-preset = lunar-förinställning

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = en formation behöver minst en deputy

engine-e-ssv-formation-duration-min-and-step-must = duration_min och step_s måste vara positiva

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = inga signaler för de valda konstellationerna och banden

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = okänd antenn `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = mönster-CSV är tom

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` är inte ett tal i mönster-CSV

engine-e-ssv-scenario-pattern-csv-row-has-columns = mönster-CSV-raden `{ $l }` har { $f } kolumner, förväntade { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" behöver exakt en av pattern_csv och pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` är inte booklet, parametric eller table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: ange cn0_min_dbhz eller weak_signal, inte båda

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = bärvågsslingan kan inte hålla den angivna Doppler-takten vid någon C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` är inte acquisition, tracking eller both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz måste vara ändligt

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: ange exakt en av preset och orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` är inte leo, meo, geo, heo eller lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: ange exakt en av duration_min och duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } måste vara positivt

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg behöver 1 till 8 ändliga förskjutningar

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd får inte vara negativt

engine-e-ssv-scenario-give-exactly-one-of-shell = ange exakt en av [shell], [trajectory] och [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] behöver en [navigation]-tabell för chief

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include och constellations.bands får inte vara tomma

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km måste vara över 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels över 5 stöds inte

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna måste vara hemisphere eller omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = shell-svepet stöder bara sändningsmönstret booklet (ett format mönster kräver trajectory-svepet)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] gäller en [trajectory], inte en [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: ange exakt en av preset och orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` är inte leo, meo, geo, heo eller lunar-transfer

engine-e-ssv-scenario-unknown-preset = okänd förinställning

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv shell { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv navigation: positions-RMS { $p } totalt, { $p2 } inom GNSS-banorna, { $p3 } ovanför; längsta lucka { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = deputy vid { $offset_deg } deg ({ $baseline_km } km): relativ RMS { $rel_rms_filter_m } m filtrerad mot { $rel_rms_from_absolute_m } m från absoluta positionsbestämningar

engine-ssv-scenario-combined-max-outage-min = { $band } kombinerat 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (max avbrott { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv trajectory { $perigee_alt_km } till { $apogee_alt_km } km höjd: { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min och step_min måste vara positiva

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } måste vara ett positivt tal, fick { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = inget standardpaket med namnet `{ $id }`; paketen är: { $ids }

engine-e-standards-pack-pack-manifest = paketmanifest: { $e }

engine-e-standards-pack-test-duplicate-id = test { $id }: dubblerat id

engine-e-standards-pack-test-scenario-is-not-in = test { $id }: scenariot `{ $s }` finns inte i paketet

engine-e-standards-pack-test-scored-test-needs-bar = test { $id }: ett poängsatt test behöver en tröskel

engine-e-standards-pack-test-test-that-needs-input = test { $id }: ett test som behöver indata har inga trösklar

engine-e-standards-pack-test-give-either-scenario-or = test { $id }: ange antingen `scenario` eller `needs_input`, inte båda eller ingen

engine-e-standards-pack-test-supports-unknown-row = test { $id }: ger belägg för en okänd rad `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id }: okänd op `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id }: tröskeln på { $pointer } behöver exakt en av `value` och `against`

engine-e-standards-pack-row-duplicate-id = rad { $id }: dubblerat id

engine-e-standards-pack-row-asks-must-be-short = rad { $id }: `asks` måste vara en kort omskrivning

engine-e-standards-pack-row-no-test-supports-it = rad { $id }: inget test ger belägg för den

engine-standards-pack-not-scored-needs-input = inte poängsatt: behöver indata ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = studien har inga scenarier att köra

engine-e-study-cannot-read-scenario = kan inte läsa scenariot { $path }: { $e }

engine-e-study-scenario-failed = scenariot { $path } misslyckades: { $e }

engine-e-study-scenario-produced-unparseable-json = scenariot { $path } gav JSON som inte går att tolka: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = ogiltigt sviitmanifest: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = okänd källa `{ $o }`: använd `adsb` eller `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } är { $len } bytes, över gränsen på { $limit } bytes

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` är inte en UTC-tid enligt ISO-8601

engine-e-surface-invalid-receiver-trust-session = ogiltig receiver-trust-session: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` är inte en UTC-tid enligt ISO-8601

engine-e-surface-dataset-custom-needs-licence-licence = datamängden `custom` behöver licence, licence_url och attribution

engine-e-surface-at-least-one-map-is = minst en karta krävs

engine-e-surface-epoch = epok: { $e }

engine-e-surface-not-utf = { $suffix }: inte UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = okänd scenariotyp `{ $k }`; typlistan anger alla typer

engine-surface-is-not-bundled-it = `{ $name }` medföljer inte: den { $why }

engine-surface-no-bundled-scenario-named-the = inget medföljande scenario med namnet `{ $name }`; exempellistan anger de { $v1 } som finns

engine-e-surface-invalid-toml = ogiltig TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = okänt exportformat `{ $format }`; förväntade ett av czml, kml, geojson, stk eller sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps ger { $opts } bildrutor och högst { $MAX_ANIMATION_FRAMES } returneras; sänk fps eller duration_s, eller skriv en längre sekvens med kommandoraden

engine-e-surface-scenario-run-failed = scenariokörningen misslyckades: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log anger en fil `path`; ange loggen som `text` eller `base64` (den här ytan läser inga filer)

engine-e-surface-max-sp-errors-must-be = max_sp_errors får vara högst 20

engine-e-surface-frames-must-be-to = frames måste vara 1 till { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 måste vara 0 till 99

engine-e-surface-runs-given-at-most-per = { $runs } körningar angivna; högst { $MAX_COMPLIANCE_RUNS } per rapport

engine-e-surface-the-runs-total-bytes-the = körningarna omfattar sammanlagt { $total } bytes; gränsen för en rapport är { $max_bytes }

engine-e-surface-result-files-given-at-most = { $results } resultatfiler angivna, högst 256

engine-e-surface-result-is-not-json = resultat { $v1 } är inte JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = okänt format `{ $o }`: använd `prometheus`, `cef`, `leef`, `otlp` eller `mqtt`

engine-e-surface-unknown-imu-format-use-csv = okänt IMU-format `{ $o }`: använd `csv` eller `euroc`

engine-e-surface-unknown-axis-use-or = okänd axel `{ $o }`: använd `x`, `y` eller `z`

engine-e-surface-id-must-be-to-64 = id måste vara 1 till 64 skrivbara ASCII-tecken utan blanksteg

engine-surface-fitted-from-stationary-imu-log = anpassad från en stillastående IMU-logg, sha256 { $sha }, axel { $axis }, Allan-estimator

engine-e-surface-unknown-input-kind-use-result = okänd input_kind `{ $o }`: använd `result` eller `jsonl`

engine-e-surface-the-input-holds-no-trust = indata innehåller ingen förtroendeepok

engine-e-surface-the-reply-is-over-the = svaret överskrider gränsen på { $max_bytes } bytes; skicka färre epoker eller låt `syslog_all` vara avstängt

engine-e-surface-otlp-needs-build-with-the = otlp kräver ett bygge med funktionen `otlp`

engine-e-surface-the-pack-and-token-total = paketet och token omfattar sammanlagt { $total } bytes; gränsen är { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = tidsstämpeltoken är tom

engine-e-surface-must-be-64-lower-case = { $what } måste vara 64 hexsiffror med gemener

engine-e-surface-must-be-32-bytes = { $what } måste vara 32 bytes

engine-surface-verified-against-the-public-key = VERIFIED mot den publika nyckel du angav (signerarens fingeravtryck { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: hasharna och signaturen är förenliga med nyckel { $fp }, som paketet själv anger. Ange signerarens publika nyckel, hämtad från signeraren på annan väg, för att fastställa vem som signerade det.

engine-e-surface-files-must-be-json-object = files måste vara ett JSON-objekt från namn till innehåll

engine-e-surface-pack-has-at-most-64 = ett paket har högst 64 filer

engine-e-surface-file-name-must-be-plain = filnamnet `{ $k }` måste vara ett vanligt namn

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` är inte giltig standard-base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = okänd svepparameter: { $other }

engine-e-sweep-unknown-sweep-metric = okänt svepmått: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep behöver minst en axel

engine-e-sweep-sweep-key-is-malformed = svepnyckeln `{ $key }` är felformad

engine-e-sweep-sweep-key-follows-an-array = svepnyckeln `{ $key }`: `{ $part }` följer efter en matris, så den måste vara ett index

engine-e-sweep-unreachable = onåbar

engine-e-sweep-sweep-key-index-is-past = svepnyckeln `{ $key }`: index { $i } ligger efter matrisens { $n } poster

engine-e-sweep-sweep-key-parent-is-not = svepnyckeln `{ $key }`: förälder till `{ $part }` är inte en tabell

engine-e-sweep-sweep-key-no-field = svepnyckeln `{ $key }`: inget fält `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = svepnyckeln `{ $key }`: förälder till `{ $last }` är inte en tabell

engine-e-sweep-sweep-key-no-field-2 = svepnyckeln `{ $key }`: inget fält `{ $last }`

engine-e-sweep-metric-no-field-in-result = måttet `{ $path }`: inget fält `{ $part }` i resultatet

engine-e-sweep-metric-value-is-not-number = måttet `{ $path }`: värdet är inte ett tal

engine-e-sweep-sweep-node-serialize = serialisering av svepnod: { $e }

engine-e-sweep-sweep-node-result-parse = tolkning av svepnodens resultat: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = svepaxeln `{ $key }`: deklarerad enhet `{ $d }` men det svepta paketet anger `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = svepets arbetstråd kraschade

engine-e-sweep-generic-sweep-needs-at-least = ett generiskt svep behöver minst en axel

engine-e-sweep-generic-sweep-needs-at-least-2 = ett generiskt svep behöver minst ett mått

engine-e-sweep-generic-sweep-base-must-carry = det generiska svepets `base` måste ha sin egen `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = ett generiskt svep kan inte svepa ett annat svep

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = okänd oscillator { $oscillator }; förväntade en av { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day och temperature_coeff_per_k måste vara ändliga

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s måste vara ändligt och positivt

engine-e-telecom-timing-duration-must-be-finite-and = duration_s måste vara ändligt och minst tolv sampel långt

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s måste ligga i [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns måste vara ändligt och >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = temperatur- och frekvensoffsetindata måste vara ändliga (period > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = posten skulle överskrida 5 000 000 sampel; höj sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = en tidsfelsserie behöver minst 13 sampel, fick { $pairs }

engine-e-telecom-timing-every-time-and-time-error = alla time_s och time_error_ns måste vara ändliga

engine-e-telecom-timing-time-must-increase = time_s måste öka

engine-e-telecom-timing-the-series-must-be-uniformly = serien måste vara likformigt samplad: steg { $v1 } är { $d } s, det första är { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV-rad { $v1 } är inte `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = masken definieras genom ett lågpassfilter på 0.1 Hz, som den här motorn bara tillämpar vid samplingsintervall på { $MAX_FILTER_DT_S } s eller mindre; den här posten samplas var { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = ange antingen [holdover] eller [series], inte båda

engine-e-telecom-timing-give-either-series-samples-or = ange antingen series.samples eller series.csv_path, inte båda

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days måste vara ändligt och >= 0

engine-telecom-timing-ns-budget-exceeded-after = ; budgeten på { $max_abs_te_ns } ns överskreds efter { $t } s

engine-telecom-timing-ns-budget-never-exceeded = ; budgeten på { $max_abs_te_ns } ns överskreds aldrig

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns under { $v2 } s; { $masks }{ $first_budget } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = okänt --format `{ $f }` (cef eller leef)

engine-e-telemetry-cli-unknown-option = okänt alternativ `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input och --result är alternativ till varandra

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: ingen adress

engine-telemetry-cli-warning-metrics-is-served-without = varning: /metrics levereras utan autentisering på { $addr }; bind till localhost eller lägg den bakom din egen åtkomstkontroll

engine-e-telemetry-cli-bind = bind { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = levererar http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp och --syslog-tcp är alternativ till varandra

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting gäller --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: en ämnesdel får inte vara tom, innehålla #, + eller börja med /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp kräver ett bygge med `--features otlp`

engine-telemetry-cli-warning-input-line = varning: indatarad { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = kan inte öppna { $p }: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not = varning: { $n } MQTT-meddelanden levererades inte

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint måste börja med http://

engine-e-telemetry-otlp-endpoint-has-no-host = endpoint saknar värd

engine-e-telemetry-otlp-resolve = slå upp { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = ingen adress för { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = varning: otlp-exporten misslyckades: { $e }

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

engine-e-telemetry-sample-not-json = inte JSON: { $e }

engine-e-telemetry-sample-not-json-object = inte ett JSON-objekt

engine-e-telemetry-sample-is-not-number = `{ $k }` är inte ett tal

engine-e-telemetry-sample-is-not-finite = `{ $k }` är inte ändligt

engine-e-telemetry-sample-missing = `t_s` saknas

engine-e-telemetry-sample-score-outside-100 = `score` { $s } utanför 0..=100

engine-e-telemetry-sample-missing-state = `state` saknas

engine-e-telemetry-sample-is-not-an-array = `{ $key }` är inte en matris

engine-e-telemetry-sample-entry-has-no-name = en post i `{ $key }` saknar namn

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` saknas eller är inte ett ändligt tal

engine-e-telemetry-sample-position-is-not-an-object = `position` är inte ett objekt eller null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` saknas eller är inte en sträng

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` är inte ett ändligt tal >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` är inte en sträng

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` är inte ett booleskt värde

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` är inte ett objekt eller null

engine-e-telemetry-sample-result-has-no-epochs = resultatet saknar `epochs`

engine-e-telemetry-sample-bad-epochs = felaktig `epochs`: { $e }

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

engine-e-telemetry-syslog-host-is-bytes-syslog-host = värden är { $host } bytes; ett syslog-värdnamn är högst 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = host måste vara skrivbar ASCII utan blanksteg

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } mot { $w } (kan inte representeras som f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: finns, förväntades saknas

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: saknas, förväntades finnas

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } måste vara ändligt

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu måste vara ändligt och icke-negativt

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: rad { $v1 }: inte MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: inga AR-poster för { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = okänt serieformat { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } måste vara ändligt

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s måste ge 16 till 20000 mätningar

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } offset { $ns } ns (Sagnac { $ns2 } ns, jonosfär { $ns3 } ns); kombinerad u { $ns4 } ns (typ A { $ns5 } ns vid { $averaging_s } s); { $series } verklig serie (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = icke-ASCII-tecken i TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE avkortad vid läsning av { $what } (kolumn { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } är för kort för en kontrollsumma i kolumn 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } saknar kontrollsiffra i kolumn 69

engine-e-tle-tle-checksum-mismatch-column-69 = TLE { $label } kontrollsumman stämmer inte: kolumn 69 anger { $want }, beräknat { $got }

engine-e-tle-not-tle-line = inte en TLE-rad 1: { $line1 }

engine-e-tle-not-tle-line-2 = inte en TLE-rad 2: { $line2 }

engine-e-tle-invalid-in-tle = ogiltigt { $what } i TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = ogiltigt epokår i TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = ogiltigt katalognummer i TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = inklinationen ligger utanför intervallet [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = excentriciteten ligger utanför intervallet [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = icke-positiv medelrörelse: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = ogiltig mantissa för { $what } i TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = ogiltig exponent för { $what } i TLE: { $exp }

engine-tle-satellite-line-only-element-set = satellit { $satnum }: ett elementsats med bara rad 2 tolkades som analytiska Kepler-element (tvåkropps) — drag/B* från rad 1 och de sekulära SGP4-termerna saknas, så den här banan avviker från en verklig SGP4-anpassning längre från epoken; ange motsvarande rad 1 för SGP4-noggrannhet

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: C/N0-profilen behöver en positiv epok och längd

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: C/N0-profilen skulle kräva fler än { $MAX_DETECTOR_STEPS } detektorsteg ({ $total } s med { $epoch_s } s per epok); förkorta ramp_duration_s eller förläng predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } måste vara ändligt

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } måste vara positivt (fick { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips måste vara under 1.9 chip (fick { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio måste vara minst 1 (fick { $pullin_bandwidth_ratio }) — en slinga som återinfångar med en SMALARE bandbredd än den spårar med skulle invertera hysteresen

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s får inte vara negativt

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) får inte överstiga cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } får inte vara tomt

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } har { $axis } poster; taket är { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } innehåller ett icke-ändligt värde

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: bekräftelsetiderna måste vara minst 1 epok

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = minst åtta sampel behövs

engine-e-twstft-budget-samples-must-increase-in-time = samplen måste öka i tid

engine-e-twstft-budget-samples-must-be-on-regular = samplen måste ligga på ett regelbundet rutnät

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } rader: { $validated } externt prövade, { $modelled } beräknade ur en modell, { $partner_owned } hos partner.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = Det kompletta, maskinkontrollerade evidensregistret: **{ $total } rader — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. En rad får vara VALIDATED endast med en oberoende extern referens (matrisens invarianttester kräver det). Samma data, med klickbara länkar per rad till varje test, modul och incheckad fixtur, finns som *Validation ledger* på https://kshana.dev. Se [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) för varför varje rad som är beräknad ur en modell inte är externt prövad.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } funktioner märkta MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json är inte JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json är inte JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] behöver `label`

engine-wasm-runs-needs-result = runs[{ $i }] behöver `result`

engine-wasm-results-json-is-not-json = results_json är inte en JSON-matris av strängar: { $e }

engine-wasm-maps-json-must-be-json = maps_json måste vara en JSON-matris av strängar: { $e }

engine-wasm-plans-json-is-not-json = plans_json är inte en JSON-matris av strängar: { $e }

engine-wasm-options-json-is-not-json = options_json är inte JSON: { $e }

engine-wasm-input-is-about-bytes-over = indata är cirka { $b64 } bytes, över gränsen på { $v2 } bytes

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Sekventiell terrängreferensnavigering (rekursiv SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = fri tröghetsdrift (växer)

engine-altpnt-sequential-terrain-matched-bounded = terrängmatchad (begränsad)

engine-altpnt-sequential-waypoint-full-scale = vägpunkt →    full skala { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Kshana körningsrapport

engine-advanced-report-meta = Typ <code>{ $kind }</code> · motor { $engine } · scenario <code>{ $scenario }</code> (filsammandrag { $digest }…)

engine-advanced-report-toc-summary = 1 Sammanfattning

engine-advanced-report-toc-inputs = 2 Indata

engine-advanced-report-toc-results = 3 Resultat

engine-advanced-report-toc-aggregation = 3a Aggregering

engine-advanced-report-toc-companions = 3b Animation och exporter

engine-advanced-report-toc-events = 4 Händelser

engine-advanced-report-toc-labels = 5 Verifieringsetiketter

engine-advanced-report-toc-not-modelled = 6 Ej modellerat

engine-advanced-report-toc-reproducibility = 7 Reproducerbarhet

engine-advanced-report-h-summary = 1. Sammanfattning

engine-advanced-report-honesty-label = <strong>Ärlighetsetikett</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Använda förmågor:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (som förutsätts, inte tillhandahålls); se avsnitt 5.

engine-advanced-report-member-runs = <strong>Medlemskörningar:</strong> { $n }, aggregerade i avsnitt 3a.

engine-advanced-report-h-inputs = 2. Indata

engine-advanced-report-inputs-note = Varje fält som scenariofilen sätter, utplattat till sin sökväg. Enheter hämtas från resultatets <code>units</code>-block (fältenhetsschemat, docs/field-units-schema.json) där det beskriver fältet, annars från fältnamnets ändelse; en enhet som ingen av dem anger visas som ej angiven.

engine-advanced-report-th-parameter = Parameter

engine-advanced-report-th-value = Värde

engine-advanced-report-th-unit = Enhet

engine-advanced-report-th-unit-source = Enhetskälla

engine-advanced-report-h-results = 3. Resultat

engine-advanced-report-chart-alt = Resultatdiagram

engine-advanced-report-also-written-to = { " " }(skrivs också till { $file })

engine-advanced-report-h-scalars = Skalära resultat

engine-advanced-report-h-columns = Numeriska kolumner

engine-advanced-report-th-result = Resultat

engine-advanced-report-th-column = Kolumn

engine-advanced-report-th-count = Antal

engine-advanced-report-th-min = Min

engine-advanced-report-th-max = Max

engine-advanced-report-th-first = Första

engine-advanced-report-th-last = Sista

engine-advanced-report-omitted-inputs = <p class="note">{ $n } ytterligare indata utelämnas från den här sidan; report.json listar samma rader, och resultatdokumentet innehåller varje värde.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">{ $n } ytterligare skalära resultat utelämnas från den här sidan; report.json listar samma rader, och resultatdokumentet innehåller varje värde.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">{ $n } ytterligare numeriska kolumner utelämnas från den här sidan; report.json listar samma rader, och resultatdokumentet innehåller varje värde.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">{ $n } ytterligare händelser utelämnas från den här sidan; report.json listar samma rader, och resultatdokumentet innehåller varje värde.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Aggregering av medlemskörningar

engine-advanced-report-mode = <p>Läge <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Läge <strong>{ $mode }</strong> över typen <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Läge <strong>{ $mode }</strong>, { $n_runs } medlemskörningar.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Läge <strong>{ $mode }</strong> över typen <code>{ $kind }</code>, { $n_runs } medlemskörningar.</p>{ "\u000A" }

engine-advanced-report-run-digest = Körningssammandrag (SHA-256 över medlemmarnas resultatsammandrag, i utskickningsordning): <code>{ $digest }</code>

engine-advanced-report-table-empty = Den här tabellen har inga rader: resultatet listar inga.

engine-advanced-report-distribution-caption = Monte Carlo-fördelning av { $metric } ({ $n } sampel), 20 lika breda intervall; streckade linjer markerar 5:e, 50:e och 95:e percentilen.

engine-advanced-report-distribution-caption-unit = Monte Carlo-fördelning av { $metric } ({ $n } sampel, { $unit }), 20 lika breda intervall; streckade linjer markerar 5:e, 50:e och 95:e percentilen.

engine-advanced-report-h-companions = 3b. Animation och exporter

engine-advanced-report-animation-alt = Animation av körningens tidsserie

engine-advanced-report-animation-caption = Körningens egna sampel ritas upp bakom en rörlig tidsmarkör (den animerade ritningen från <code>--animate svg</code>; den visar den färdiga bilden vid reducerad rörelse och vid utskrift).

engine-advanced-report-no-animation = Ingen animation: { $reason }

engine-advanced-report-no-animation-default = resultatet innehåller ingen tidsserie

engine-advanced-report-player-written-by = Den interaktiva spelaren skrivs av <code>{ $command }</code>.

engine-advanced-report-written-beside = Skrivs bredvid den här rapporten: { $links }.

engine-advanced-report-th-export = Export

engine-advanced-report-th-applies = Gäller

engine-advanced-report-th-files-or-reason = Filer eller orsak

engine-advanced-report-written-by = skrivs av <code>{ $command }</code>

engine-advanced-report-does-not-apply = gäller inte

engine-advanced-report-yes = ja

engine-advanced-report-no = nej

engine-advanced-report-h-events = 4. Händelsetidslinje

engine-advanced-report-events-caption = Fönster som staplar, punkthändelser som punkter, på körningens egen tidsaxel.

engine-advanced-report-th-start = Start (s)

engine-advanced-report-th-end = Slut (s)

engine-advanced-report-th-event = Händelse

engine-advanced-report-th-source = Källa

engine-advanced-report-point-event = punkthändelse

engine-advanced-report-events-timeline = Händelsetidslinje

engine-advanced-report-point-events = punkthändelser ({ $n })

engine-advanced-report-distribution-of = Fördelning av { $metric }

engine-advanced-report-max-bin = största intervall { $n }

engine-advanced-report-h-labels = 5. Verifieringsetiketter

engine-advanced-report-th-capability = Förmåga (matriskrav)

engine-advanced-report-th-label = Etikett

engine-advanced-report-th-used-by = Används av

engine-advanced-report-th-oracle = Källa: oberoende referens

engine-advanced-report-th-test-evidence = Testbelägg

engine-advanced-report-h-figure-tiers = Nivåer per värde som resultatet anger

engine-advanced-report-th-figure = Värde

engine-advanced-report-th-tier = Nivå

engine-advanced-report-th-matrix-requirement = Matriskrav

engine-advanced-report-th-applicable = Tillämplig

engine-advanced-report-no-attack = nej (ingen attack konfigurerad)

engine-advanced-report-h-not-modelled = 6. Ej modellerat, och antaganden

engine-advanced-report-not-modelled-note = Varje punkt citeras från där den anges: resultatdokumentet, typkatalogen, scenariofilen eller verifieringsmatrisens skäl till att en MODELLED-rad förblir modellerad.

engine-advanced-report-th-statement = Påstående

engine-advanced-report-h-reproducibility = 7. Reproducerbarhetsunderlag

engine-advanced-report-rk-command = Kommando för att reproducera

engine-advanced-report-rk-working-directory = Arbetskatalog

engine-advanced-report-rk-engine-version = Motorversion

engine-advanced-report-rk-source-commit = Källcommit

engine-advanced-report-rk-scenario-file = Scenariofil

engine-advanced-report-rk-scenario-sha = Scenariofilens SHA-256 (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = Resultatets scenario_hash

engine-advanced-report-rk-result-sha = Resultatdokumentets SHA-256

engine-advanced-report-rk-seed = Frö

engine-advanced-report-rk-platform = Plattform

engine-advanced-report-rk-generated = Studien genererad (UTC)

engine-advanced-report-rk-determinism = Determinism

engine-advanced-report-result-hash-none = resultatdokumentet anger ingen

engine-advanced-report-print-note = För att skriva ut den här sidan till en Portable Document Format-fil (PDF), använd webbläsarens utskriftsdialog och välj ”Spara som PDF”; utskriftsformatmallen passar pappersformaten A4 och US Letter, upprepar tabellhuvuden över sidor och startar avsnitten indata, resultat, etiketter och reproducerbarhet på en ny sida. Motorn skriver ingen PDF själv. report.json innehåller samma innehåll som den här sidan.

engine-advanced-report-footer = Genererad av Kshana { $engine }.{ $stamp } Reproducerbar från scenario + frö + motorversion. Gratis och öppen källkod (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">källkod &amp; dokumentation</a>.

engine-advanced-report-empty-inputs = Scenariot sätter inget fält utöver `kind`: typen körde sin referenskonfiguration från sina dokumenterade standardvärden.

engine-advanced-report-empty-scalars = Resultatdokumentet innehåller inget skalärt värde utanför sina fält; dess tal sammanfattas per kolumn nedan.

engine-advanced-report-empty-series = Resultatdokumentet innehåller ingen numerisk array: varje resultat är ett skalärt värde i tabellen ovan.

engine-advanced-report-empty-events = Ingen tidsatt händelse: scenariot skriptar inget fönster eller starttid och resultatet rapporterar ingen händelse. Typen utvärderar sin konfiguration som ett enda fall.

engine-advanced-report-empty-not-modelled = Inget i resultatet, typkatalogen, scenariot eller de använda matrisraderna anger någon modelleringsbegränsning för den här körningen.

engine-advanced-report-capabilities-statement = Varje rad är en verifieringsmatrisrad som den här körningens typer utnyttjar, med den etikett och den oberoende referens som matrisen ger den (src/verification.rs, docs/VERIFICATION-MATRIX.md). En etikett graderar förmågan så som matrisen registrerar den; den graderar inte det här scenariots konfiguration, och en VALIDATED-rad gör inte körningens indata uppmätta. En PARTNER-rad är en disciplin som körningen förutsätter och som Kshana inte tillhandahåller.

engine-advanced-report-no-run-label = Resultatet har ingen ärlighetsetikett på körningsnivå; verifieringsetiketterna för de förmågor som användes listas i sitt eget avsnitt, och nivåerna per värde där resultatet anger dem.

engine-advanced-report-no-seed = Varken scenariot eller resultatet innehåller något frö. Resultatet bestäms enbart av scenariofilen och motorbygget; determinismtestet kör om varje medföljande scenario och kräver byte-identisk utdata.

engine-advanced-report-working-directory = Kör kommandot från den katalog där den ursprungliga körningen startades: scenariosökvägen, och varje relativ datasökväg i scenariot, tolkas relativt den. Kontrollera först scenariofilen mot scenario_sha256.

engine-advanced-report-determinism-stamped = Samma scenariobytes, frö och motorbygge ger samma resultatdokument, utom dess meta.generated_utc-stämpel, som --study-name skriver från klockan; kör utan --study-name för byte-identisk utdata. Flyttalsresultat är låsta per plattform; ett annat operativsystem eller en annan arkitektur kan skilja sig i de sista siffrorna.

engine-advanced-report-determinism-plain = Samma scenariobytes, frö och motorbygge ger ett byte-identiskt resultatdokument och en byte-identisk rapport; den här rapporten har ingen tidsstämpel. Flyttalsresultat är låsta per plattform; ett annat operativsystem eller en annan arkitektur kan skilja sig i de sista siffrorna.

engine-advanced-report-not-applicable-no-attack = ej tillämpligt (ingen attack konfigurerad)

engine-advanced-report-what-ran-default = Ett `{ $kind }`-scenario.

engine-advanced-report-nothing-carried = inget medföljer

engine-advanced-report-tbl-sweep-nodes = Svepnoder

engine-advanced-report-tbl-mc-summary = Sammanfattning av Monte Carlo-fördelning (percentiler är närmaste rang; det 95-procentiga konfidensintervallet för medelvärdet är en percentil-bootstrap med fast frö)

engine-advanced-report-tbl-chain-phases = Kedjefaser

engine-advanced-report-tbl-shared = Delade villkor

engine-advanced-report-tbl-members = Medlemmar

engine-advanced-report-tbl-combined = Kombinerat över medlemmar

engine-advanced-report-tbl-optimiser-best = Optimerarens bästa (ett lokalt optimum över de angivna gränserna)

engine-advanced-report-tbl-optimiser-trace = Optimerarens spår

engine-advanced-report-tbl-sweep-grid = Svepnät

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Terrängreferensnavigering (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Gravitationskartmatchad navigering

engine-altpnt-terrain-title-combined = Kombinerad gravitation + magnetfält + terräng alt-PNT

engine-altpnt-terrain-free-inertial-drift = fri tröghetsdrift

engine-altpnt-terrain-terrain-matched = terrängmatchad

engine-altpnt-terrain-gravity-matched = gravitationsmatchad

engine-altpnt-terrain-gravity-only = enbart gravitation

engine-altpnt-terrain-magnetic-only = enbart magnetfält

engine-altpnt-terrain-terrain-only = enbart terräng

engine-altpnt-terrain-combined-fused = kombinerad (fusionerad)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · scenario { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Attackyta för månsignalsäkerhet (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = reläer i sikte

engine-body-pnt-chart-count = antal

engine-body-pnt-chart-formal-one-sigma-position = formell positions-ett-sigma (log10 m): enbart blå konstellation, bärnstensfärgad med jordavstånd

engine-body-pnt-chart-time-since-epoch = tid sedan epok, 0 till { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = klockans tidsfel mot skyddsmarginal (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 mot spårningsgolv (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = skyddsnivå mot larmgräns (m)

engine-campaign-chart-position-error-vs-threshold = positionsfel mot tröskel (m)

engine-campaign-chart-satellites-tracking = spårade satelliter

engine-campaign-chart-alarm-flags-and-events = larmflaggor och händelser

engine-campaign-chart-mission-time = { $duration } s uppdragstid

engine-campaign-chart-sweep-percentile-band = , median med 5:e–95:e percentilband över { $n_runs } frön

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) vid { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo av `{ $scenario_kind }`: { $n_runs } frön från { $base_seed } (5:e, 50:e, 95:e percentilen; stapel = bootstrap-konfidensintervall på 95 % för medelvärdet)

engine-campaign-chart-composed-members = sammansatta medlemmar under delade villkor: { $shared }

engine-campaign-chart-not-available = saknas

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Cislunar återvinning av båglängd — en estimator som inte delar jacobianerna

engine-cislunar-arc-recovery-chart-subtitle = batch-minstakvadrat med finita differenser · uppmätt tillståndsåtervinningsfel · ingen analytisk Jacobian, ingen variationell STM, ingen SVD-rangtolerans

engine-cislunar-arc-recovery-chart-bound = gräns { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = Gramian-rangtröskel

engine-cislunar-arc-recovery-chart-monte-carlo-rms = Monte Carlo-RMS för positionsåtervinningsfel (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = sämsta brusfria återvinningskvot (slutfel / förflyttning)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Cislunar observerbarhet över en spårningsbåge (P6)

engine-cislunar-observability-chart-subtitle = rang mot båge (enkellänk med enbart avstånd) · Gramian-egenspektrum · differentialkorrigerade DRO-begynnelsevillkor + SRIF-korskontroll · { $modelled } utformning, { $validated } rang/STM/slutning

engine-cislunar-observability-chart-observable-rank = observerbar rang mot båglängd

engine-cislunar-observability-chart-arc-length = båglängd (tidsenheter i roterande system, { $arc_hours } h totalt)

engine-cislunar-observability-chart-gramian-eigenvalues = Gramian-egenvärden (log10)

engine-cislunar-observability-chart-condition = konditionstal κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Lagerbaserad PNT-motståndskraft i konflikt (P7)

engine-conflict-resilience-chart-subtitle = totalbortfall mot hotintensitet (MC mot sluten form) · motståndskraftskvot mot nekandekorrelation · { $modelled } a priori, { $validated } MC->sluten form / copula-marginaler

engine-conflict-resilience-chart-total-loss-probability = sannolikhet för totalbortfall mot intensitet

engine-conflict-resilience-chart-threat-intensity = hotintensitet

engine-conflict-resilience-chart-layered-mc = lagerbaserad MC

engine-conflict-resilience-chart-single-layer = enkelt lager

engine-conflict-resilience-chart-resilience-ratio = motståndskraftskvot mot nekandekorrelation

engine-conflict-resilience-chart-denial-correlation = nekandekorrelation ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = tillgänglighet (%)

engine-constellation-chart-mean-pdop = medel-PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = Jord-GNSS på månavstånd — C/N0 mot vinkel från huvudriktningen

engine-earth-gnss-lunar-chart-track-threshold = spåra { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = Jordens rand { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = vinkel från huvudriktningen (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = guld = spårbar · röd = för svag · grå = skymd av jorden · { $modelled } sändningsmönster

## src/ensemble.rs

engine-ensemble-chart-title = Klock-holdover: konfidensband för tidsfel ({ $n_runs } körningar)

engine-ensemble-chart-timing-error-ns = tidsfel (ns)

engine-ensemble-chart-spec-threshold = spec { $threshold } ns

engine-ensemble-chart-time-s = tid (s)

engine-ensemble-chart-classical-median-band = klassisk: { $id } (median, band 5–95 %)

engine-ensemble-chart-quantum-median-band = kvant: { $id } (median, band 5–95 %)

## src/fom_label.rs

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Realtidsbudget för system-/EOP-prediktion för tidshållning på månen

engine-frame-eop-chart-ut1-error-ms = UT1-fel (ms)

engine-frame-eop-chart-position-at-moon-m = position vid månen (m)

engine-frame-eop-chart-equiv-timing-ns = motsv. tidsfel (ns)

engine-frame-eop-chart-prediction-horizon-days = prediktionshorisont (dagar)

engine-frame-eop-chart-iers-final-floor = IERS slutgiltigt golv { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m vid månen

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = Hybrid UKF med 17 tillstånd — filtrets självkonsistens (modelled)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + innovationsvithet mot 95-procentiga χ²-band; 1.0 = konsistent. Självkonsistens, inte noggrannhet.

engine-fusion-hybrid-ukf-chart-target = mål 1.0

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (vithet)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = KONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INKONSISTENT

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Löst kopplat GNSS/INS horisontellt fel

engine-fusion-pack-chart-horizontal-error-m = horisontellt fel (m)

engine-fusion-pack-chart-spec-threshold = spec { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Skyplot ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = O

engine-geometry-chart-south = S

engine-geometry-chart-west = V

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (skymd av skylinen)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (under masken)

engine-geometry-chart-no-fix = ingen positionsbestämning

engine-geometry-chart-in-view-hidden = { $n_visible } i sikte, { $n_masked } skymda av skylinen · { $dop } · ofylld: ej i sikte

engine-geometry-chart-satellites-as-given = satelliter som angivna

engine-geometry-chart-representative-sky = representativ himmel, inte en daterad

engine-geometry-chart-footer = Kshana v{ $version } · geometri under en angiven felmodell · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = RAIM-skyddsnivåer mot larmgränser

engine-gnss-sim-chart-protection-level-m = skyddsnivå (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/main.rs

engine-main-fail = fel: { $e }

## legal (advisories, disclaimers and notices; the English text is the source, the constant in code is what machine files carry)

# legal: native review
engine-legal-compliance-statement = En rad markerad som evidenced betyder att en körning i den här uppsättningen ger belägg för de förmågor som raden nämner. Det är inte ett konstaterande att ett ramverk är uppfyllt, och det betyder inte att någon produkt har betygsatts eller godkänts av någon. Kolumnen för glapp anger vad körningarna inte visar.

# legal: native review
engine-legal-bench-surface-notice = Endast fordonsrörelse och märkta händelseintervall. Inget som exporteras här är, modellerar eller driver en radiofrekvens- eller basbandssignal, och en händelse är ett tidsintervall, inte ett recept för att framställa störning. Laboratoriesimulatorn och dess operatör tillhandahåller signalerna och ansvarar för att köra dem endast där det är tillåtet (ledningsbundet eller skärmat, enligt simulatorns egna säkerhetsanvisningar). Kshana publicerar inga resultat från sådana körningar.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC på fönsternivå för varje monitor på de givna inspelningarna. Varje angivet händelsefönster är ett positivt och varje roc_window_s-fönster utanför händelserna ett negativt; ett fönster räknas vid en tröskel när monitorns teststatistika når den i fönstret. P_fa gäller per negativt fönster, inte per test.

# legal: native review
engine-legal-lunanet-afs-advisory = Rådgivande: analysutdata från ett forsknings- och utvecklingsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Den kontrollerar en symbolström mot en utgåva av en publicerad specifikation och säger ingenting om någon LunaNet-nod eller -tjänst.

# legal: native review
engine-legal-iqfit-statement = MODELLED: varje anpassat tal beskriver den öppna mottagaren (den namngivna slingutformningen och front-end-kedjan) på de inspelningar den fick, anpassat till kampanjens poängsatta resultat. Det är inte en mätning av någon annan mottagare. Prediktioner märks PREDICTION, med den närmaste testade inspelningen och avståndet utanför de testade förhållandena.

# legal: native review
engine-legal-iqfit-advisory = Rådgivande: analysutdata, inte typgodkänd navigationsutrustning; prediktioner är modellutdata med angivet fel, inte garantier.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Källuppgift, inte ett påstående: ICG WG-B Lunar PNT-materialet från juni 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, källa S3 i studien) beskriver ett tidsreferenslaboratorium för månen vid stationen med ett tidsmål på nanosekundsnivå. Kshana citerar det målet enbart som sammanhang; den antar det inte, och inget i det här blocket visar att någon verklig stationsklocka uppfyller det.

# legal: native review
engine-legal-standards-pack-notice = Ett standardpaket mäter modellerade scenarier mot trösklar som anges före körningen. Det ger belägg för de ramverksrader det nämner; det betygsätter eller godkänner ingen produkt, och en MET-tröskel säger endast att scenariots modellerade utdata nådde den angivna tröskeln.

# legal: native review
engine-legal-standards-pack-advisory = Rådgivande: analysutdata från ett forsknings- och utvecklingsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst; den får inte vara den enda grunden för något navigations- eller säkerhetsbeslut.

# legal: native review
engine-legal-geometry-statement = Geometri under en angiven felmodell (MODELLED): siktlinjesynlighet mot den angivna skylinen, geometrisk försämring av precisionen och en gaussisk felellips för oberoende, lika, nollmedelvärdes gaussiska avståndsfel med det angivna användarekvivalenta avståndsfelet. Det är inte en prediktion av en mottagares verkliga fel, som också har systematiska fel, flervägsfel och fel utan siktlinje, och det är inte en integritetsgräns. Förinställda konstellationer är en representativ geometri, inte himlen den dagen på den platsen.

# legal: native review
engine-legal-resilience-disclaimer = Simuleringsbaserad självbedömning i linje med DHS RPCF v2.0. Det här är inte en certifiering eller ackreditering, och det representerar inget godkännande från någon myndighet (DHS, IEEE eller annan). Varje delpoäng är MODELLED om den inte uttryckligen märks VALIDATED, och poängen är tidsdomän- och detektionsnyckeltal, inte noggrannhet i positionsdomänen.

# legal: native review
engine-legal-observatory-notice = En försämrad cell betyder att en hög andel flygplan rapporterade låg navigeringsnoggrannhet där den dagen. Ingen orsak anges. En cell som inte observeras, eller saknas, bedömdes inte, vilket inte är detsamma som fri. Endast rådgivande: inte ett godkännande, en certifiering eller ett utlåtande om överensstämmelse.

# legal: native review
engine-legal-receiver-trust-advisory = Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC 61108, IEC 61162): operatören är fortsatt ansvarig för fartygets navigering.

# legal: native review
engine-legal-evidence-roundtrip-notice = Länkar fyra poster med sammandrag: scenariot, laboratoriets angivna testvillkor, mottagarloggen och poängen för den loggen mot de angivna händelserna. Det är inte en signal, inte ett recept för återspelning och inte en certifiering. Hur scenariots rörelse nådde mottagaren (en fil som spelats upp genom en laboratoriesimulator, ledningsbundet eller skärmat) var operatörens ansvar och registreras här endast som angivet.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Det här paketet är en teknisk redovisning av vad Kshana-motorn beräknade från den angivna mottagarloggen med den angivna konfigurationen. Det är inte ett juridiskt utlåtande, inte ett konstaterande av faktum om någon händelse eller dess orsak och inte en certifiering.

# legal: native review
engine-legal-bench-notice = Rådgivande: modellerat eller uppmätt mot angivna referenser, inte ett godkännande, en certifiering eller ett utlåtande om överensstämmelse. En poäng beskriver en logg eller ett korpus, aldrig en produkt.

# legal: native review
engine-legal-osnma-advisory = Rådgivande: det här är analys- och övervakningsutdata och inte typgodkänd navigationsutrustning. Autentiseringsstatusen som rapporteras här är inte en integritetstjänst för navigering och får inte vara den enda grunden för något navigations- eller säkerhetsbeslut.

## added by the second pass

engine-holdover-test-not-recovered-within-record = ; inte återhämtad inom registreringen

engine-holdover-test-chart-title = Holdover-test: tidsfel per steg

engine-holdover-test-chart-y-title = |tidsfel| (ns)

engine-holdover-test-chart-panel-caption = absolut tidsfel; holdover-steg skuggat; streckade linjer är tidsfelsbudgetarna

engine-holdover-test-chart-gnss-removed = GNSS borttaget

engine-holdover-test-chart-gnss-restored = GNSS återställt

engine-holdover-test-chart-time-axis = tid på registreringens axel ({ $min } min)

engine-hybrid-chart-title = Utnyttjande av specifikationen för hybrid-PNT under GNSS-avbrott (1.0 = specifikation)

engine-hybrid-chart-y-title = utnyttjande av specifikationen

engine-hybrid-chart-spec-line = specifikation (1.0)

engine-hybrid-chart-classical-suite = klassisk svit

engine-hybrid-chart-quantum-suite = kvantsvit

engine-hybrid-integrity-chart-availability = tillgänglighet

engine-hybrid-integrity-chart-precision = precision

engine-hybrid-integrity-chart-integrity = integritet

engine-hybrid-integrity-chart-joint-indep = gemensam (oberoende)

engine-hybrid-integrity-chart-joint-corr = gemensam (korrel.)

engine-hybrid-integrity-chart-title = Gemensamt kvalitetsmått för hybrid optisk + RF-PNT

engine-hybrid-integrity-chart-subtitle = P(tillgänglig AND precisionsklass AND integritetssäkrad)

engine-inertial-chart-title = Positionsfel vid dödräkning under GNSS-avbrott

engine-inertial-chart-y-title = positionsfel (m)

engine-inertial-chart-spec-line = specifikation { $m } m

engine-inertial-chart-classical = klassisk: { $id }

engine-inertial-chart-quantum = kvant: { $id }

engine-iq-campaign-report-roc-aria-label = Detekterings-ROC per monitor

engine-iq-campaign-report-roc-x-title = P_fa (per negativt fönster)

engine-iq-campaign-report-curve-aria-label = C/N0-försämring mot angiven J/S för { $rec }, händelse { $ev }

engine-iq-campaign-report-curve-x-title = angiven J/S (dB)

engine-iq-campaign-report-curve-y-title = C/N0-försämring (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: SSC-referens, Q = { $q }

engine-iq-campaign-report-curve-model-legend = { $label }-referens (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } fler serier i resultattabellen

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, uppmätt försämring { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (uppmätt)

engine-jamming-chart-title = Synliga satelliter mot spårade under jamming

engine-jamming-chart-y-title = satelliter

engine-jamming-chart-four-sv-fix = 4-SV-positionsbestämning

engine-jamming-chart-visible = synliga

engine-jamming-chart-tracking = spårade

engine-leo-fusion-ntn-chart-title = 5G NTN-positionering: Cramér-Rao-avståndsgräns efter bandbredd

engine-leo-fusion-ntn-chart-caption = avstånd, en sigma (log10 m): stapel = mask till zenit C/N0; punkt = RMS-fel för 3D-positionsbestämning

engine-leo-fusion-ppp-chart-title = PPP-konvergens med LEO-förstärkning

engine-leo-fusion-ppp-chart-caption = median horisontellt fel (log10 m) mot minuter

engine-leo-fusion-ppp-chart-n-leo = { $n } LEO

engine-leo-fusion-pvt-kind-chart-doppler-caption = fel för 3D-Doppler-positionsbestämning (log10 m) mot fönsterlängd

engine-leo-fusion-pvt-kind-chart-doppler-x-label = fönster (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = median PDOP (blå) och VDOP (bärnsten), log10, mot tillagda LEO-satelliter

engine-leo-fusion-pvt-kind-chart-joint-x-label = tillagda LEO-satelliter

engine-leo-fusion-pvt-kind-chart-polar-caption = median VDOP (log10): grå GNSS, blå LEO, bärnsten fusionerad

engine-leo-fusion-pvt-kind-chart-polar-x-label = latitud (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = RMS-tidsfel till UTC (log10 ns) mot C/N0-förskjutning, en linje per oscillator

engine-leo-fusion-pvt-kind-chart-timing-x-label = C/N0-förskjutning (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 } till { $x1 }

engine-leo-navmsg-chart-title = LEO-navigeringsmeddelande: SISRE mot anpassningsintervall

engine-leo-navmsg-chart-no-trade-encode-decode = Ingen avvägning i den här körningen; se result.json för tabellerna över kodning/avkodning och budget.

engine-leo-navmsg-chart-no-fit-interval-trade = Ingen avvägning av anpassningsintervall i den här körningen; se result.json.

engine-leo-navmsg-chart-caption = SISRE RMS enbart från bana (m, log-skala) mot anpassningsintervall (s)

engine-leo-pass-chart-title = LEO-passage: C/N0 per band och Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 till 80): LEO-band i färg, GNSS i grått

engine-leo-pass-chart-time-axis = tid sedan epok, 0 till { $s } s

engine-leo-pnt-chain-chart-subtitle = signalutformning -> passage C/N0 och kodjitter -> meddelande SISRE -> fusionerad positionsbestämning · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 för spårad komponent över passagen (dB-Hz, 20 till 80)

engine-leo-pnt-chain-chart-not-available = ej tillgängligt

engine-leo-signal-chart-title = LEO-PNT-signalutformningar

engine-leo-signal-chart-psd-axis = förskjutning över ±0.6 × sändarbandbredd; 0 till −50 dB under varje topp

engine-leo-signal-chart-jitter-caption = kodjitter (m, log-skala) mot total C/N0 (dB-Hz)
