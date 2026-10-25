# SPDX-License-Identifier: AGPL-3.0-only
# nb catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = ukjent klokkeloggformat { $other }; forventet ett av { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = ukjent hullpolicy { $other }; forventet refuse, longest eller linear

engine-e-clock-log-give-either-the-log-text = oppgi enten logg-teksten eller stien til den, ikke begge

engine-e-clock-log-clock-log-needs-its-text = en klokkelogg trenger teksten sin eller en sti

engine-e-clock-log-tau0-must-be-finite-and = tau0_s må være endelig og > 0 (fikk { $t })

engine-e-clock-log-units-and-data-apply-to = units og data gjelder bare for timelab-formatet

engine-e-clock-log-channel-applies-to-the-ticc = channel gjelder bare for ticc-formatet

engine-e-clock-log-cannot-read-clock-log = kan ikke lese klokkeloggen { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = en sti til klokkelogg er ikke tilgjengelig i WebAssembly-bygget; oppgi loggen som tekst

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one] { $format }-loggen har { $n_missing } manglende epoke i { $n_gaps } hull på et { $tau0 } s-rutenett; sett gaps = "longest" for å beholde den lengste hullfrie sekvensen, eller gaps = "linear" for å interpolere
       *[other] { $format }-loggen har { $n_missing } manglende epoker i { $n_gaps } hull på et { $tau0 } s-rutenett; sett gaps = "longest" for å beholde den lengste hullfrie sekvensen, eller gaps = "linear" for å interpolere
    }


engine-e-clock-log-the-log-yields-usable-sample = { $format }-loggen gir { $x } brukbar(e) måleverdi(er); minst 3 trengs

engine-e-clock-log-not-rinex-clock-file-no = ikke en RINEX-klokkefil: ingen END OF HEADER-post

engine-e-clock-log-the-rinex-clock-file-has = RINEX-klokkefilen har ingen AS- eller AR-poster

engine-e-clock-log-the-rinex-clock-file-holds = RINEX-klokkefilen inneholder { $many } klokker; angi én med clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = ingen AS- eller AR-poster for klokken { $id }

engine-e-clock-log-the-clock-has-single-epoch = klokken har bare én epoke; tau0 kan ikke bestemmes

engine-e-clock-log-the-log-has-no-readings = { $format }-loggen har ingen målinger

engine-e-clock-log-unknown-phase-unit-expected-ms = ukjent fasenhet { $other }; forventet s, ms, us, ns eller ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab-linje { $v1 } har { $v } kolonne(r), den første datalinjen har { $first }

engine-e-clock-log-timelab-line-has-columns-one = TimeLab-linje { $v1 } har { $v } kolonner; én (verdi) eller to (tid verdi) leses

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab-linje { $v1 } er ikke numerisk: { $l }

engine-e-clock-log-the-timelab-log-has-no = timelab-loggen har ingen målinger

engine-e-clock-log-unknown-data-expected-phase-or = ukjent data { $other }; forventet phase eller frequency

engine-e-clock-log-tau0-header-is-not-positive = tau0-headeren { $v } er ikke et positivt antall sekunder

engine-e-clock-log-frequency-data-is-fractional-frequency = frequency-data er relativ frekvens; enheten kan bare være 1

engine-e-clock-log-two-column-frequency-logs-are = frequency-logger med to kolonner leses ikke; oppgi frequency som én kolonne med tau0

engine-e-clock-log-unknown-time-units-expected-or = ukjent time_units { $o }; forventet s eller mjd

engine-e-clock-log-the-timelab-log-time-column = tidskolonnen i timelab-loggen må øke

engine-e-clock-log-single-reading-tau0-cannot-be = én enkelt måling; tau0 kan ikke bestemmes

engine-e-clock-log-the-timelab-log-has-non = timelab-loggen har { $non_finite } ikke-endelig(e) måling(er)

engine-e-clock-log-the-ticc-log-holds-channels = TICC-loggen inneholder kanalene { $many }; angi én med channel = "..."

engine-e-clock-log-no-readings-on-channel-found = ingen målinger på kanal { $channel } (fant { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC-linjer i intervallmodus har ingen tid; oppgi tau0_s (hendelsesperioden)

engine-e-clock-log-the-readings-do-not-increase = { $channel }-målingene øker ikke, så de er ikke tidsstempler (utdata fra TICC Period-modus leses ikke; bruk Timestamp-modus)

engine-e-clock-log-single-time-stamp-tau0-cannot = ett enkelt tidsstempel; tau0 kan ikke bestemmes

engine-e-clock-log-two-time-stamps-apart-under = to { $channel }-tidsstempler { $w } s fra hverandre, under halvparten av tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = { $format }-tidsstemplene for { $clock } går bakover (en omstartet daemon eller et klokkesprang); del loggen og les hver del for seg

engine-e-clock-log-the-log-has-no-readings-2 = loggen har ingen { $what }-målinger

engine-e-clock-log-the-log-holds-sources-name = loggen inneholder { $many } kilder; angi én med { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = ingen { $what }-målinger for { $id } (fant { $names })

engine-e-clock-log-the-servo-of-never-reached = servoen til { $id } nådde aldri den låste tilstanden s2

engine-e-clock-log-the-log-has-no-chrony = loggen har ingen chrony tracking-målinger

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = samplingsfrekvensen { $fs_hz } Hz er ikke et helt antall sampler per millisekund

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms og noncoherent må være positive

engine-e-acquisition-the-doppler-grid-needs-positive = Doppler-rutenettet trenger et positivt steg og et ikke-negativt maksimum

engine-e-acquisition-pfa-must-lie-in = pfa må ligge i (0, 1)

engine-e-acquisition-samples-supplied-needed = { $samples } sampler oppgitt, { $needed } trengs

engine-e-acquisition-empty-doppler-grid = tomt Doppler-rutenett

engine-e-acquisition-the-samples-carry-no-power = samplene har ingen effekt

## src/adm.rs

engine-e-adm-unknown-attitude-type = ukjent ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = en AEM trenger minst ett segment

engine-e-adm-segment-is-not-version-attitude = segment { $i }: { $t } er ikke en holdningstype i versjon { $version }

engine-e-adm-segment-values-for = segment { $i }: { $values } verdier for { $t }

engine-e-adm-aem-version-has-no-ndm = AEM versjon 1.0 har ingen NDM/XML-form her; skriv KVN

engine-e-adm-this-attitude-type-has-no = denne holdningstypen har ingen versjon 2.0-form

engine-e-adm-expected-meta-start-found = forventet META_START, fant { $l }

engine-e-adm-meta-start-without-meta-stop = META_START uten META_STOP

engine-e-adm-unexpected-metadata-line = uventet metadatalinje { $other }

engine-e-adm-in-version-aem = { $att } i en AEM i versjon { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = forventet DATA_START etter META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START uten DATA_STOP

engine-e-adm-empty-data-line = tom datalinje

engine-e-adm-values-on-line = { $vals } verdier på en { $att }-linje: { $b }

engine-e-adm-unexpected-data-line = uventet datalinje { $other }

engine-e-adm-attitude-type-has-no-xml = holdningstypen har ingen XML-form

engine-e-adm-message-without-version-attribute = melding uten versjonsattributt

engine-e-adm-expected-found = forventet { $vers_key }, fant { $other }

engine-e-adm-header-without-creation-date-or = header uten CREATION_DATE eller ORIGINATOR

engine-e-adm-missing = mangler { $k }

engine-e-adm-unexpected-keyword = uventet nøkkelord { $k }

engine-e-adm-spin-block-holds-nutation-or = en spin-blokk inneholder nutasjons- eller impulsdata, ikke begge

engine-e-adm-unexpected-apm-keyword = uventet APM-nøkkelord { $other }

engine-e-adm-unexpected-apm-line = uventet APM-linje { $b }

engine-e-adm-without = { $b } uten { $stop }

engine-e-adm-unexpected-line-in = uventet linje i { $b }: { $other }

engine-e-adm-incomplete-group = ufullstendig gruppe { $keys }

engine-e-adm-unknown-apm-block-start = ukjent APM-blokk { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM-metadata trenger OBJECT_NAME, OBJECT_ID og TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM uten EPOCH

engine-e-adm-rotation-axis = rotasjonsakse { $o }

engine-e-adm-values-for = { $values } verdier for { $t }

engine-e-adm-euler-record-without-euler-rot = Euler-post uten EULER_ROT_SEQ

engine-e-adm-rotation-sequence = rotasjonssekvens { $seq }

engine-e-adm-epoch-has-no = epoke { $s } har ingen 'T'

engine-e-adm-epoch-date = epokedato { $date }

engine-e-adm-epoch-time = epoketid { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = «{ $s }» (tekst slik dokumentet oppgir den)

engine-advanced-report-mean-5th-to-95th-percentile = middelverdi { $fmt_num } (5. til 95. persentil { $fmt_num2 } til { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = field-units-skjema: units-oppføring `{ $key }`

engine-advanced-report-field-units-schema-input-entry = field-units-skjema: input-oppføring `{ $key }`, funnet via feltnavn

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } rad i en ikke-numerisk kolonne
       *[other] { $n } rader i en ikke-numerisk kolonne
    }


engine-advanced-report-rows-from-to = { $nums } rader, fra { $fmt_num } til { $fmt_num2 }

engine-advanced-report-phase-ended-by = fase { $name } (avsluttet av { $ended })

engine-advanced-report-result-timeline-phases = resultat `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = overlevering til fase { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = resultat `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = scenario-inndata `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = kommentar i scenariofilen, linje { $start }

engine-advanced-report-scenario-file-comment-lines-to = kommentar i scenariofilen, linje { $start } til { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } er MODELLED, ikke prøvd mot en uavhengig ekstern referanse: { $it }.

engine-advanced-report-sweep-of-scale = Sveip over { $param } ({ $str_of }-skala)

engine-e-advanced-report-the-result-document-is-not = resultatdokumentet er ikke JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = scenarioet er ikke TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Monte Carlo-fordeling av { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = registrert ved bygging fra miljøvariabelen { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = ikke registrert: denne motoren ble bygget uten miljøvariabelen { $GIT_COMMIT_ENV }; motorversjonen identifiserer utgivelsen

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (kindens egen fingeravtrykk av scenarioet; ikke filens sjekksum)

engine-advanced-report-input-file = Inndatafil { $path }

engine-advanced-report-study-generated = { " " }Studie generert { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2-linje { $v1 }: forventet 8 kommaseparerte kolonner, fant { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2-linje { $v1 }: ugyldig { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2-linje { $v1 }: ikke-endelig verdi

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: ingen datarader

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: { $rows } rader fyller ikke gitteret på { $n_lat } x { $n_lon } som de spenner over

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: duplisert node ved { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = gittersteget må være endelig og positivt, fikk { $step }

engine-e-altpnt-maps-grid-box-must-have-north = gitterboksen må ha north > south og east > west, fikk [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = gitter på { $n_lat } x { $n_lon } noder er for stort

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: { $what }-aksen trenger minst 2 ulike verdier

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: { $what }-aksen er ikke regelmessig ({ $w } til { $w2 } mot et gjennomsnittlig steg på { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = feilens sigma må være endelig og ikke-negativ, fikk { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = korrelasjonslengden må være endelig og positiv, fikk { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side må være >= 2, fikk { $n }

engine-e-altpnt-terrain-srtm-hgt-length = SRTM .hgt-lengde { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = et .hgt-vindu trenger minst 2 x 2 sampler, fikk { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = steget må være endelig og positivt, fikk { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt-vinduslengde { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: ukjent magnetic_grid-kolonne `{ $other }` (bruk "sealevel" eller "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: kan ikke lese magnetic_grid csv_path { $csv_path }: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = ukjent animasjonsformat '{ $other }'; forventet svg, html, frames eller all

engine-e-animation-no-animation-format-given-expected = ingen animasjonsformat oppgitt; forventet svg, html, frames eller all

engine-e-animation-animation-fps-must-be-between = animasjonens fps må være mellom 1 og 60, fikk { $fps }

engine-e-animation-animation-duration-must-be-between = animasjonens varighet må være mellom { $lit_0_5 } s og 600 s, fikk { $duration_s }

engine-e-animation-animation-width-must-be-between = animasjonens bredde må være mellom 480 og 3840 piksler, fikk { $width }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] varighet x fps gir { $n } bilde; bildesekvensen trenger mellom 2 og { $v1 }
       *[other] varighet x fps gir { $n } bilder; bildesekvensen trenger mellom 2 og { $v1 }
    }


engine-e-animation-result-is-not-json = resultatet er ikke JSON: { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = oppdragstid ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (krever en ffmpeg bygget med librsvg; ellers må bildene rasteriseres først)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }{ $omitted } flere serier ble funnet, men ikke tegnet (spilleren viser høyst { $MAX_CHARTS } paneler med { $MAX_TRACES } kurver); de er oppført i manifestet til frames-eksporten.

## src/antenna.rs

engine-antenna-limb-capture-is-reached-on = limb-fangst nås på dette gitteret (høyde { $a_lo }-{ $a_hi } m x strålebredde { $b_lo }-{ $b_hi } deg, { $points2 } punkter): { $points } av { $points2 } samplede driftspunkter fanger limb, og { $crossings } akseskjæring(er) ble funnet; den sterkeste limb-J/S som ble samplet er { $limb_js_db } dB ved høyde { $altitude_m } m / strålebredde { $hpbw_deg } deg, mot en fangstterskel på { $thr } dB.

engine-antenna-limb-capture-is-not-reached = limb-fangst nås IKKE noe sted på dette gitteret (høyde { $a_lo }-{ $a_hi } m x strålebredde { $b_lo }-{ $b_hi } deg, { $points } punkter) - ikke null fangst, men ingen limb-fangst: den beste limb-J/S er { $limb_js_db } dB ved høyde { $altitude_m } m / strålebredde { $hpbw_deg } deg, { $shortfall } dB under fangstterskelen på { $thr } dB; det driftspunktet ville fange limb ved { $limb_capture_tx_power_dbw } dBW sendeeffekt mot { $p_tx_dbw } dBW som ble fløyet.

engine-e-antenna-azimuths-must-strictly-increase = asimutene må øke strengt

engine-e-antenna-azimuths-must-span-less-than = asimutene må spenne over mindre enn 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = vinklene utenfor siktelinjen må øke strengt

engine-e-antenna-gain-grid-does-not-match = forsterkningsgitteret passer ikke til aksene

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = forsterkningene K og P må være endelige og positive

engine-e-aocs-at-least-three-reaction-wheels = minst tre reaksjonshjul kreves

engine-e-aocs-wheel-spin-axis-must-be = hjul { $i }: spinnaksen må være en enhetsvektor

engine-e-aocs-wheel-js-and-max-must = hjul { $i }: js og u_max må være endelige og positive

engine-e-aocs-the-wheel-spin-axes-do = hjulenes spinnakser spenner ikke over tre dimensjoner

engine-e-aocs-inertia-minus-the-wheels-spin = treghet minus hjulenes spinntreghet må være positivt definitt

engine-e-aocs-inertia-must-be-finite-and = treghet må være endelig og symmetrisk

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis må være en endelig vektor som ikke er null

engine-e-aocs-kind-must-be-finite-and-positive = { $n } må være endelig og positiv

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s må være høyst 2e6 steg

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s må være et helt multiplum av dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 og omega0_rad_s må være endelige

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm må være endelig

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s må være endelig

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s må være minst dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs: { $n_w } hjul, { $duration_s } s sving fra { $series_err } deg -> { $settle } | slutt { $final_err } deg | topp hjul { $peak_speed } rpm | { $v7 }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = ukjent tjeneste '{ $other }' (forventet navigation|nav eller communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = ukjent arbitreringspolicy '{ $other }' (forventet navigation-priority, communications-priority eller first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = en kontaktplan trenger minst ett kontaktvindu

engine-e-aperture-duty-apertures-must-be = apertures må være >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = rapporteringshorisonten må være endelig

engine-e-aperture-duty-contact-has-non-finite-aos = kontakten '{ $name }' har en ikke-endelig aos_s eller los_s

engine-e-aperture-duty-contact-must-have-los-aos = kontakten '{ $name }' må ha los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = en kontaktplan trenger minst ett [[contacts]]-vindu

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: { $sessions } økt(er) på { $apertures } apertur(er) under { $policy } -> navigasjonsandel { $navigation_duty }, kommunikasjonsandel { $communications_duty }, ledig { $idle_duty }; { $total_outage_s } s av { $total_requested_s } s forespurt tapt til konflikt (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Studie generert { $html_escape }.

engine-e-api-failed-to-serialise-report-to = kunne ikke serialisere rapporten til JSON: { $e }

engine-e-api-invalid-scenario = ugyldig scenario: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] ukjent scenario-kind { $other } — mente du { $hint }? `kshana kinds` viser den ene innebygde kind ({ $n }).
       *[other] ukjent scenario-kind { $other } — mente du { $hint }? `kshana kinds` viser alle { $n } innebygde kinds.
    }


engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] ukjent scenario-kind { $other }. `kshana kinds` viser den ene innebygde kind ({ $n }).
       *[other] ukjent scenario-kind { $other }. `kshana kinds` viser alle { $n } innebygde kinds.
    }


engine-api-required-fields = - **Obligatoriske felt:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Valgfrie felt:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML-parsefeil: { $e }

engine-api-could-not-classify-scenario-kind = kunne ikke klassifisere scenario-kind: { $e }

engine-api-missing-required-field = { $kind_name }: mangler obligatorisk(e) felt — { $options }

engine-api-missing-required-field-2 = { $kind_name }: mangler obligatorisk felt "{ $entry }"

engine-e-api-invalid-orbit-scenario = ugyldig banescenario: { $e }

engine-e-api-sp3-export-requires-an-orbit = SP3-eksport krever et banescenario, ikke '{ $k }'

engine-e-api-omm-export-requires-an-orbit = OMM-eksport krever et banescenario, ikke '{ $k }'

engine-e-api-oem-export-requires-an-orbit = OEM-eksport krever et banescenario, ikke '{ $k }'

engine-e-api-invalid-scenario-toml = ugyldig scenario-TOML: { $e }

engine-e-api-could-not-re-serialise-scenario = kunne ikke serialisere scenarioet på nytt: { $e }

engine-api-scenario-jamming-availability-under-jamming = scenario { $r } | jamming { $v2 } | tilgjengelighet under jamming { $availability_under_jamming } (nominelt { $availability_nominal }) | min. sporing { $min_tracking } | gjennomsnittlig J/S { $v6 }

engine-e-api-the-result-document-already-carries = resultatdokumentet har allerede `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = kunne ikke serialisere figure_tiers: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = ugyldig { $label }-scenario: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = scenario { $r } | kvante-holdover { $holdover_s }s p95 { $pos_p95_m }m | klassisk holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = scenario { $r } | spoof { $scn } mot { $threshold_ns } ns-spesifikasjon (P_fa { $target_pfa }) | kvantesikkerhet { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | klassisk sikkerhet { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] integritet | { $n_sats } satellitt | { $samples_available }/{ $samples_total } epoker tilgjengelige ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } integritetshendelser, { $report3 } HMI
       *[other] integritet | { $n_sats } satellitter | { $samples_available }/{ $samples_total } epoker tilgjengelige ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } integritetshendelser, { $report3 } HMI
    }


engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | sørpolen | { $samples_available }/{ $samples_total } epoker tilgjengelige ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | sekulær LTC−TT-rate { $secular_rate_us_per_day } µs/day (bånd { $band_low }–{ $band_high }) | egenpotensial { $self_potential_us_per_day } kinetisk { $kinetic_us_per_day } | avvik @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | grunnlinje { $baseline_km } km | fyravstand { $beacon_range_km } km | forsinkelse { $report } µs (rate { $delay_rate_s_per_s } s/s) | nærfelt { $near_field_correction_us } µs | { $samples } sampler over { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_earth ->
        [one] lunar-joint-od-clock | { $n_sat } sats, { $n_earth } jordstasjon | stasjonens 3D-feil med VLBI { $station_pos_err_m } m mot kun avstand { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× skarpere) | sat-posisjon RMS { $sat_pos_rms_m } m | stasjonsklokkefeil { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametere
       *[other] lunar-joint-od-clock | { $n_sat } sats, { $n_earth } jordstasjoner | stasjonens 3D-feil med VLBI { $station_pos_err_m } m mot kun avstand { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× skarpere) | sat-posisjon RMS { $sat_pos_rms_m } m | stasjonsklokkefeil { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametere
    }


engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } punkt | translasjonsfeil { $trans_err_norm_m } m, rotasjonsfeil { $rot_err_norm_rad } rad, skalafeil { $scale_err_ppb } ppb | rms-residual { $rms_residual_m } m | konvergert { $converged }
       *[other] lunar-frame-realisation | { $n_points } punkter | translasjonsfeil { $trans_err_norm_m } m, rotasjonsfeil { $rot_err_norm_rad } rad, skalafeil { $scale_err_ppb } ppb | rms-residual { $rms_residual_m } m | konvergert { $converged }
    }


engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } sats ({ $geometry_label }) | { $n_grid_points } pkt × { $n_epochs } epoker | dekning { $coverage_pct }% (PDOP<{ $pdop_threshold }) | sats { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL-tilgj. { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemeride { $report } ({ $provenance }) σ_URE påkrevd { $fmt } mot Kepler { $fmt2 } mot forstyrret { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | { $n_sats } sats (illustrativ LCNS-klasse, ikke tilknyttet) | grunnlinje { $baseline_km } km | brukerfeil { $user_error_uncorrected_m } m → { $user_error_corrected_m } m ({ $reduction_factor }× reduksjon) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } punkter x { $n_epochs } epoker x { $n_trials } forsøk | tilgjengelighet { $v4 } % | dekning { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | korrigert p{ $percentile } 3D { $f } (ukorrigert { $f2 }) | HPL maks { $f3 } | MODELLED; ikke en påstand om noe virkelig system

engine-api-builtins-terrain-horizon-at-the-station = { " " }| terrenghorisont ({ $sources }) ved stasjonen maks { $horizon_max_deg } deg, brukerpunkter gjennomsnittlig maks { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilstand, OEM { $oem_line_count } linje | formatkontroll { $v5 } ({ $present_fields } til stede / { $missing_fields } mangler) | OEM-rundtur { $v8 } | tidsmeta-rundtur { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilstand, OEM { $oem_line_count } linjer | formatkontroll { $v5 } ({ $present_fields } til stede / { $missing_fields } mangler) | OEM-rundtur { $v8 } | tidsmeta-rundtur { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
       *[other]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilstander, OEM { $oem_line_count } linje | formatkontroll { $v5 } ({ $present_fields } til stede / { $missing_fields } mangler) | OEM-rundtur { $v8 } | tidsmeta-rundtur { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilstander, OEM { $oem_line_count } linjer | formatkontroll { $v5 } ({ $present_fields } til stede / { $missing_fields } mangler) | OEM-rundtur { $v8 } | tidsmeta-rundtur { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
    }


engine-api-builtins-scenario-optical-sync-rms-ps = scenario { $r } | optisk sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | kvantekjede { $quantum_chain_sigma_s }s mot klassisk { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | sikkerhet Pd { $security_pd } (Pfa { $monitor_pfa }) | anomali-Pd { $anomaly_pd } | avveining: kvante vinner { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | utfall { $outage_s }s | kvante posisjonsfeil { $quantum_pos_err_m } m mot klassisk { $classical_pos_err_m } m ({ $improvement_x }x) | holdover kvante { $quantum_holdover_s }s mot klassisk { $classical_holdover_s }s (terskel { $threshold_m } m) | avveining: kvante vinner { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC kvante { $quantum_auc } mot klassisk { $classical_auc } | minste detekterbare feil kvante { $quantum_min_detectable } mot klassisk { $classical_min_detectable } | { $fault_catalog } feilklasser | avveining: kvante vinner { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] gjelder bare for fusion-kind

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = scenario { $r } | kvante PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integritet { $integ } sikkerhet { $security_na } | klassisk PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integritet { $integ2 } sikkerhet { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = scenario { $r } | fusjonert | kvante PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integritet { $integ } sikkerhet { $security_na } | klassisk PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integritet { $integ2 } sikkerhet { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = scenario { $r } | hybrid-ukf (17 tilstander, MODELLED) | sensor { $v2 } (q_va { $effective_q_va }) | klokke q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } i [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } i [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | støttet { $aided_pos_rms_m }m -> fri drift { $coast_end_pos_rms_m }m over { $coast_duration_s }s | selvkonsistens, ikke nøyaktighet

engine-api-builtins-scenario-gnss-ins-quantum-outage = scenario { $r } | gnss-ins | kvante utfalls-RMS fusjonert { $fused_outage_rms_m }m mot fri { $free_outage_rms_m }m (hold { $holdover_s }s, tilgj. { $availability }) | klassisk fusjonert { $fused_outage_rms_m2 }m mot fri { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, tilgj. { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = scenario { $r } | gnss-sim | gjennomsnittlig iono { $mean_iono_m }m tropo { $mean_tropo_m }m | RAIM-tilgj. { $raim_availability } gjennomsnittlig HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m feilrate { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db =
    { $n_sats ->
        [one] scenario { $r } | spoof-detect | { $n_sats } SV, +{ $power_advantage_db } dB{ $v4 } | { $push } push | fusjonert score { $score } (terskel { $fusion_threshold }) | { $verdict }
       *[other] scenario { $r } | spoof-detect | { $n_sats } SV-er, +{ $power_advantage_db } dB{ $v4 } | { $push } push | fusjonert score { $score } (terskel { $fusion_threshold }) | { $verdict }
    }


engine-api-builtins-sweep-over-pts-scale-quantum = sveip { $metric } over { $parameter } ({ $first }..{ $last }, { $points } pkt, { $scale }-skala) | kvante { $first2 }->{ $last2 } | klassisk { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = scenario { $r } | { $nominal }/{ $series } sampler GNSS-nominelle | beste PDOP { $fnum } pos { $posm } | kvante-holdover { $holdover_s }s p95 { $ns1 }ns integritet { $integ } sikkerhet { $security_na } | klassisk holdover { $holdover_s2 }s p95 { $ns12 }ns integritet { $integ2 } sikkerhet { $security_na }

engine-e-api-builtins-ephemeris = efemeride: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| maks el { $el }° maks. Doppler { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] scenario { $r } | { $source } | { $n_samples } sample | høyde { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | fart { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] scenario { $r } | { $source } | { $n_samples } sampler | høyde { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | fart { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }


engine-api-builtins-generic-sweep-of-over-nodes = generisk sveip av `{ $kind }` over [{ $keys }] | { $points } noder (form { $shape }) | metrikker [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | fri treghetsdrift { $free_inertial_drift_m } m | tyngdetilpasset { $map_matched_error_m } m | tilpasnings-sigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| referansegrad { $reference_nmax } anomali-std { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| kartfeil-MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% innenfor { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | fri treghetsdrift { $free_inertial_drift_m } m | terrengtilpasset { $matched_error_m } m ({ $v3 }x reduksjon) | tilpasnings-sigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } veipunkter | fri treghets-RMS { $free_inertial_rms_m } m (slutt { $free_inertial_final_m } m) | terrengtilpasset RMS { $matched_rms_m } m (slutt { $matched_final_m } m, { $v6 }x reduksjon) | gjennomsnittlig ESS { $mean_ess }/{ $cfg } | tilpasnings-sigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | fri treghetsdrift { $free_inertial_drift_m } m | tyngde { $gravity_only_m } m magnetisk { $magnetic_only_m } m terreng { $terrain_only_m } m | FUSJONERT { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] krever runs = 1: en målt logg er én post

engine-api-builtins-scenario-runs-quantum-holdover-p95 = scenario { $r } | { $runs } kjøringer | kvante-holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns sikkerhet { $security_na } | klassisk holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns sikkerhet { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = scenario { $r } | kvante-holdover { $holdover_s }s p95 { $ns1 }ns integritet { $integ } sikkerhet { $security_na } | klassisk holdover { $holdover_s2 }s p95 { $ns12 }ns integritet { $integ2 } sikkerhet { $security_na }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one]
            { $n_alarm ->
                [one] { " " }| RAIM tilgjengelig { $n_available } av { $n_epochs } epoke ({ $n_denied } avvist, { $n_alarm } alarm; MODELLED)
               *[other] { " " }| RAIM tilgjengelig { $n_available } av { $n_epochs } epoke ({ $n_denied } avvist, { $n_alarm } alarmer; MODELLED)
            }
       *[other]
            { $n_alarm ->
                [one] { " " }| RAIM tilgjengelig { $n_available } av { $n_epochs } epoker ({ $n_denied } avvist, { $n_alarm } alarm; MODELLED)
               *[other] { " " }| RAIM tilgjengelig { $n_available } av { $n_epochs } epoker ({ $n_denied } avvist, { $n_alarm } alarmer; MODELLED)
            }
    }


## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = et referansetilfelle trenger minst én satellitt

engine-e-araim-reference-reference-case-needs-at-least-2 = et referansetilfelle trenger minst én konstellasjon

engine-e-araim-reference-satellite-names-constellation-but-only = satellitt { $i } oppgir konstellasjon { $constellation }, men bare { $constellations } er deklarert

engine-e-araim-reference-satellite-has-non-positive-error = satellitt { $i } har en ikke-positiv feilvarians

engine-e-araim-reference-both-integrity-risk-allocations-must = begge integritetsrisiko-allokeringene må være positive

engine-e-araim-reference-this-reference-implementation-monitors-single = denne referanseimplementasjonen overvåker bare feilmodi med én enkelt hendelse, men tilfellets a priori-sannsynligheter krever N_fault,max = { $nfm } (samtidige delmengder av flere hendelser). Avviser heller enn å telle for få feilmodi.

engine-e-araim-reference-the-all-in-view-geometry = all-in-view-geometrien er singulær

engine-e-araim-reference-no-fault-mode-is-observable = ingen feilmodus er observerbar i denne geometrien

engine-e-araim-reference-unknown-reference-vector-known-vectors = ukjent referansevektor '{ $vector }'; kjente vektorer: { $ids } (eller 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: { $wanted } publiserte WG-C-referansevektor(er); verste VPL/HPL-samsvar { $worst_acceptance } m mot referansens egen TOL_PL = { $tol } m over { $acceptance_checked } akseptvektor(er)

engine-e-araim-reference-sat-needs-one-value-per = P_sat trenger én verdi per satellitt og P_const én per konstellasjon

engine-e-araim-reference-satellite-names-an-undeclared-constellation = en satellitt oppgir en ikke-deklarert konstellasjon

engine-e-araim-reference-every-prior-must-lie-in = hver a priori-sannsynlighet må ligge i [0, 1)

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] a priori-sannsynlighetene trenger delmengder med { $n_fault_max } samtidig hendelse; denne banen teller opp høyst { $most }
       *[other] a priori-sannsynlighetene trenger delmengder med { $n_fault_max } samtidige hendelser; denne banen teller opp høyst { $most }
    }


engine-e-araim-reference-the-all-in-view-solution = all-in-view-løsningen ble ikke valgt

engine-e-araim-reference-an-add-v4-case-needs = et ADD v4.2-tilfelle trenger satellitter og konstellasjoner

engine-e-araim-reference-nom-and-sat-need-one = b_nom og P_sat trenger én verdi per satellitt

engine-e-araim-reference-const-needs-one-value-per = P_const trenger én verdi per konstellasjon

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = satellitt { $i } oppgir en ikke-deklarert konstellasjon

engine-e-araim-reference-one-constellation-index-per-satellite = én konstellasjonsindeks per satellitt

engine-e-araim-reference-satellite-names-constellation-with-no = satellitt { $i } oppgir konstellasjon { $c } uten ISM

engine-e-araim-reference-fewer-than-four-satellites-above = færre enn fire satellitter over masken

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m må inneholde minst én avstand

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (bånd { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | fotavtrykk { $a2 }% cap, limb { $footprint_limb_captured } | spoof-capture { $spoof_captured } (lås { $spoof_lock_time_s } s) | mastrekkevidde { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% av 50 bit/s), { $nma_auth_latency_s } s latens

engine-attack-surface-reached-crossing-best-db = nådd ({ $crossings } skjæring(er), best { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = IKKE nådd på dette gitteret (best { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB under; trenger { $best_limb_capture_tx_power_dbw } dBW mot { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| fotavtrykkssveip { $s }x{ $s2 } (høyde { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), fangst { $v5 }-{ $v6 }% | limb { $limb }

engine-attack-surface-afs-received-dbw = AFS mottatt: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Underskudd: { $deficit_db } dB (bånd { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Fangstfotavtrykk: { $a }% av skiven, limb fanget: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Spoof-capture-innfangning: { $spoof_captured } (lås { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Mastrekkevidde: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limb: fanget på { $na }x{ $nb }-gitter, { $crossings } skjæring(er)

engine-attack-surface-limb-not-captured-on-grid = Limb: ikke fanget på { $na }x{ $nb }-gitter; trenger { $best_limb_capture_tx_power_dbw } dBW (fløyet { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km må være endelig og positiv

engine-e-attitude-budget-inertias-must-be-finite-and = inertias må være endelige og positive

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 må være >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = minst ett bidrag til pekenøyaktighet kreves

engine-e-attitude-budget-contributor-sigma-must-be-finite = sigma for bidraget '{ $name }' må være endelig og >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> GG-moment { $t_gg } N·m; peking { $total }" RSS (dominerende: { $dominant }) (MODELLED skalarbudsjett)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } trenger en verdi

engine-bench-cli-unknown-option = ukjent valg `{ $a }`

engine-bench-cli-unexpected-argument = uventet argument `{ $pos }`

engine-bench-cli-cannot-read = kan ikke lese { $p }: { $e }

engine-bench-cli-cannot-create = kan ikke opprette { $d }: { $e }

engine-bench-cli-cannot-write = kan ikke skrive { $p }: { $e }

engine-bench-cli-unknown-task-or = ukjent oppgave `{ $t }` (a, b, c eller d)

engine-bench-cli-scored-epochs-in-folder = { $labels } scorede epoker i { $folders } mappe(r)

engine-bench-cli-wrote-cases-json-and-truth = skrev { $out }/cases.json og { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: denne forpliktelsen er foreløpig og seedet ble eksponert; det er ikke et tilbakeholdt datasett for utgivelse

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: seedet er ikke det som ligger bak denne forpliktelsen

engine-bench-cli-is-not-json = { $f } er ikke JSON: { $e }

engine-bench-cli-cannot-read-2 = kan ikke lese { $i }: { $e }

engine-bench-cli-result-rendered = { $results } resultat(er) gjengitt

engine-bench-cli-unknown-subcommand =
    ukjent underkommando `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = kan ikke opprette { $path } (en eksisterende seed-fil blir aldri overskrevet): { $e }

engine-bench-cli-cannot-write-2 = kan ikke skrive { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = seed skrevet til { $path }: hold det utenfor versjonskontroll og utenfor alle meldinger; bare hashen nedenfor er offentlig

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (videreført, ikke kjørt på nytt)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = impairment-eval-grunnlinje: { $det }

engine-bench-cli-no-scenario-json-under = ingen scenario.json under { $root }

engine-bench-cli-is-not-json-2 = { $path } er ikke JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } avvikende, { $missing } mangler, { $unpinned } uten festet sjekksum

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = ukjent split `{ $other }` (dev, test eller holdout)

engine-bench-score-for-is-not-finite = scoren for `{ $id }` er ikke endelig

engine-bench-case-have-no-score-the = { $missing } tilfelle(r) har ingen score, det første er `{ $first_missing }`

engine-bench-predictions-name-case-that-is = prediksjonene oppgir et tilfelle som ikke finnes i referansen: `{ $extra }`

engine-bench-schema-must-be = `schema` må være `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` må være en 64-sifret hex SHA-256

engine-bench-truth-is-not-json = referansen er ikke JSON: { $e }

engine-bench-predictions-are-not-json = prediksjonene er ikke JSON: { $e }

engine-bench-truth-schema-must-be = referansens `schema` må være `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = prediksjonenes `schema` må være `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = referansen ble laget under en annen spesifikasjonsversjon enn { $SPEC_VERSION }; resultater fra ulike hovedversjoner blandes aldri

engine-bench-unknown-task = ukjent oppgave `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = resultat { $v1 } er ikke gyldig: { $p }

engine-bench-site-result-is-task-holdout-result = resultat { $v1 } er et resultat for oppgave (d) fra et tilbakeholdt datasett uten `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = resultat { $v1 } er scoret mot et foreløpig, eksponert seed for tilbakeholdt datasett: ikke et tilbakeholdt datasett for utgivelse

engine-bench-site-result-was-scored-under-this = resultat { $v1 } ble scoret under { $v }; denne siden gjelder for { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = scoren for `{ $k }` er ikke et tall

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } ({ $lit_0_35 } standard overvåkingsstatistikk)

engine-bench-tasks-malformed-clock-line = ugyldig klokkelinje `{ $line }`

engine-bench-tasks-the-clock-file-does-not = klokkefilen samsvarer ikke med den festede SHA-256 (fikk { $got }, ventet { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = satellitt { $prn } finnes ikke i klokkefilen

engine-bench-tasks-kshana-bench-baseline = kshana-bench-grunnlinje: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = prediksjonene dekker { $pmap } tilfeller, referansen har { $tarr }

engine-bench-tasks-case-has-no-number-array = tilfellet `{ $id }` har ingen tallrekke

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] tilfellet `{ $id }` trenger { $n } verdi, har { $a }
       *[other] tilfellet `{ $id }` trenger { $n } verdier, har { $a }
    }


engine-bench-tasks-case-has-non-finite-value = tilfellet `{ $id }` har en ikke-endelig verdi

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialiser { $name }: { $e }

engine-e-bin-crossover-study-write = skriv { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = feil: kan ikke opprette { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = ferdig: treghet { $nodes } noder, klokke { $curves } kurver (seed 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } brukerepoke x 3 URA-verdier på { $dt } s = { $v1 } ms per brukerepoke ({ $ok } løsbare)
       *[other] { $n } brukerepoker x 3 URA-verdier på { $dt } s = { $v1 } ms per brukerepoke ({ $ok } løsbare)
    }


## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = skrev docs/INTEROP.md (eksporttabell)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = skrev valideringssammendrag til { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = ukjent himmellegeme '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigerer rundt et annet himmellegeme enn jorden med en jordforbindelse; { $name } støttes ikke her

engine-e-body-pnt-duration-and-step-must-be = duration_s og step_s må være positive med høyst 20000 epoker; fikk { $duration } og { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind må være orbiter eller surface; fikk '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = brukerens høyde må være positiv og eksentrisiteten i [0, { $lit_0_9 })

engine-e-body-pnt-the-user-orbit-periapsis-is = brukerbanens periapsis ligger under overflaten

engine-e-body-pnt-constellation-needs-to-200-satellites = konstellasjonen trenger 1 til 200 satellitter i minst ett plan

engine-e-body-pnt-constellation-altitude-must-be-positive = konstellasjonens høyde må være positiv

engine-e-body-pnt-range-sigmas-must-be-positive = avstandssigmaene må være positive

engine-e-body-pnt-no-earth-position-relative-to = ingen jordposisjon relativt til { $name } ved JD { $jd }

engine-e-body-pnt-serialising-report = serialiserer rapport: { $e }

engine-e-body-pnt-the-report-must-serialise-to = rapporten må serialiseres til et JSON-objekt

engine-body-pnt-positioning-around-user-relays-at =
    Posisjonsbestemmelse rundt { $name } — { $user_kind }-bruker, { $n_relays } reléer på { $r } km, { $n_epochs } epoker
    { "  " }Jordens lystid { $one_way_light_time_s } s én vei, { $two_way_light_time_s } s tur-retur; vinkel Sol-jord-legeme { $sun_separation_deg } deg
    { "  " }tilgjengelighet: { $availability_relays } bare konstellasjon, { $availability_with_earth } med jordavstanden (jorden i sikte { $earth_visibility })
    { "  " }median PDOP { $opt }; RMS-feil { $opt2 } bare konstellasjon, { $opt3 } med jordavstanden
    { "  " }median formell sigma { $opt4 } bare konstellasjon, { $opt5 } med jordavstanden{ "\u000A" }

engine-body-pnt-positioning-around = Posisjonsbestemmelse rundt { $name }

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] { $user_kind }-bruker · { $n_relays } relé · jordens lystid { $one_way_light_time_s } s · MODELLED
       *[other] { $user_kind }-bruker · { $n_relays } reléer · jordens lystid { $one_way_light_time_s } s · MODELLED
    }


## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = E1-scenarioet er ikke en tabell

engine-e-calibration-ensembles-e1-scenario-has-no-monte = E1-scenarioet har ingen [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } mangler

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 er `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ensembler med 200 realisasjoner hver, mot den lukkede formen: middelverdi 0, sigma = { $sigma } ns. Ensemble j bruker basisseed 1 000 000 + 1000 j og bootstrap-seed 20260928 + j. Den største relative ADEV-feilen var { $max } for E2 og { $max2 } for E3 (over 1, 10 og 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = tom resultatsti

engine-e-campaign-result-path-has-an-empty = resultatstien `{ $path }` har et tomt segment

engine-e-campaign-result-path-bad-index-in = resultatstien `{ $path }`: ugyldig indeks i `{ $part }`

engine-e-campaign-result-path-no-field = resultatstien `{ $path }`: ingen felt `{ $name }`

engine-e-campaign-result-path-indexed-value-is = resultatstien `{ $path }`: den indekserte verdien er ikke en tabell

engine-e-campaign-result-path-index-out-of = resultatstien `{ $path }`: indeks { $i } utenfor området ({ $n })

engine-e-campaign-result-path-value-is-not = resultatstien `{ $path }`: verdien er ikke et tall eller et flagg

engine-e-campaign-result-path-is-not-an = resultatstien `{ $path }`: `{ $k }` er ikke en array

engine-e-campaign-result-path-must-name-one = resultatstien `{ $path }` må peke ut én verdi, ikke rader

engine-e-campaign-result-path-is-not-an-2 = resultatstien `{ $path }`: `{ $name }` er ikke en array

engine-e-campaign-metric-path-has-no-entry = metrikkstien `{ $path }` har ingen oppføring i units-blokken for den kind-en; deklarer `unit` i kampanjen

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` må bestå av bokstaver, sifre, `_` eller `-` og kan ikke være tom

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: en kampanje kan ikke inneholde en kampanje

engine-e-campaign-serialise = { $label }: serialiser: { $e }

engine-e-campaign-result-did-not-parse = { $label }: resultatet kunne ikke parses: { $e }

engine-e-campaign-seed-key-no-field-in = seed-nøkkel `{ $key }`: ingen felt `{ $part }` i scenarioet

engine-e-campaign-seed-key-is-not-non = seed-nøkkelen `{ $key }` er ikke et ikke-negativt heltall

engine-e-campaign-seed-does-not-fit-toml = seed { $seed } passer ikke i et TOML-heltall

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = tidsstien `{ $t }` må peke ut rader med `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` er ikke below, above eller abs_above

engine-campaign-threshold-is-null = terskelen `{ $p }` er null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` er ikke mean, min, max eller count

engine-campaign-time-path-gives-several-values = tidsstien `{ $t }` gir flere verdier per rad

engine-campaign-value-path-has-fewer-rows = verdistien `{ $y }` har færre rader enn `{ $t }`

engine-campaign-value-path-has-rows-time = verdistien `{ $y }` har { $r } rader, tidsstien `{ $t }` har { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = en kampanje med faser trenger en [timeline] med step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s må være positiv, fikk { $step }

engine-e-campaign-phase-is-named-twice = fasen `{ $name }` er navngitt to ganger

engine-e-campaign-phase-duration-must-be-non = fase `{ $name }`: duration_s må være ikke-negativ

engine-e-campaign-phase-has-no-runs = fasen `{ $name }` har ingen kjøringer

engine-e-campaign-phase-the-first-phase-has = fase `{ $name }`: den første fasen har ingenting å overlevere fra

engine-e-campaign-phase-handoff-from-channel-which = fase `{ $name }`: overlevering fra kanalen `{ $ch }`, som den forrige fasen ikke endte med

engine-e-campaign-phase-handoff-from-run-does = fase `{ $name }`: overlevering fra_run { $from_run } finnes ikke

engine-e-campaign-phase-handoff-is-null = fase `{ $name }`: overleveringen `{ $from }` er null

engine-e-campaign-phase-handoff-run-does-not = fase `{ $name }`: overleveringskjøringen { $run } finnes ikke

engine-e-campaign-phase = fase `{ $name }`: { $e }

engine-campaign-phase-run = fase { $name }/kjøring { $ri }

engine-e-campaign-phase-end-at-run-does = fase `{ $name }`: end_at_run { $end_at_run } finnes ikke

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s er senere)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } er null)

engine-e-campaign-phase-side-is-not-classical = fase `{ $name }`: siden `{ $side }` er ikke classical eller quantum

engine-e-campaign-phase-skip-must-be-non = fase `{ $name }`: skip_s må være ikke-negativ

engine-e-campaign-phase-alarm-compare-is-not = fase `{ $name }`: alarmens compare `{ $compare }` er ikke below, above eller abs_above

engine-e-campaign-phase-alarm-threshold-is-null = fase `{ $name }`: alarmterskelen `{ $p }` er null

engine-e-campaign-phase-channel-is-in-not = fase `{ $name }`: kanalen `{ $channel }` er i { $u }, ikke { $du }

engine-e-campaign-phase-channel-needs-unit = fase `{ $name }`: kanalen `{ $channel }` trenger en enhet

engine-e-campaign-phase-two-runs-both-provide = fase `{ $name }`: to kjøringer gir begge kanalen `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = fase `{ $name }` fører videre `{ $ch }`, som den forrige fasen ikke endte med

engine-e-campaign-phase-carries-but-no-run = fase `{ $name }` fører videre `{ $ch }`, men ingen kjøring av den gir `{ $ch }`

engine-e-campaign-channel-is-in-in-one = kanalen `{ $name }` er i { $unit } i én fase og i { $unit2 } i en annen

engine-e-campaign-at-least-one-metric-is = minst én metrikk trengs

engine-e-campaign-metric-is-named-twice = metrikken `{ $name }` er navngitt to ganger

engine-e-campaign-seed-overflow-in-the-ensemble = seed-overflyt i ensemblet

engine-e-campaign-an-ensemble-needs-at-least = et ensemble trenger minst én kjøring

engine-e-campaign-sweep-takes-one-to-three = et sveip tar én til tre akser, fikk { $axes }

engine-e-campaign-axis-is-named-twice = aksen `{ $name }` er navngitt to ganger

engine-e-campaign-axis-needs-at-least-two = aksen `{ $name }` trenger minst to steg

engine-e-campaign-axis-scale-must-be-lin = akse `{ $name }`: scale må være lin eller log

engine-e-campaign-axis-log-axis-needs-positive = akse `{ $name }`: en log-akse trenger positive endepunkter

engine-campaign-sweep-node = sveipnode { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs må være minst to

engine-e-campaign-compose-needs-at-least-one = compose trenger minst ett medlem

engine-e-campaign-shared-value-must-be-number = den delte verdien `{ $name }` må være et tall eller tall

engine-e-campaign-shared-value-is-named-twice = den delte verdien `{ $name }` er navngitt to ganger

engine-e-campaign-member-binds-unknown-shared = medlemmet `{ $label }` binder ukjent shared `{ $name }`

engine-e-campaign-member = medlem `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = metrikken `{ $name }` er i { $u } for ett medlem og i { $unit } for `{ $label }`

engine-e-campaign-member-is-named-twice = medlemmet `{ $label }` er navngitt to ganger

engine-e-campaign-invalid-campaign-scenario = ugyldig kampanjescenario: { $e }

engine-e-campaign-invalid-campaign = ugyldig kampanje: { $e }

engine-e-campaign-sweep = sveip: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } av { $what } over realiseringene

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = verdien av { $ch } ved slutten av den forrige fasen, lagt til { $ch } i denne fasen

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } på tidslinjerutenettet: den siste samplen i den eiende fasens kjøring ved eller før hvert rutenetttidspunkt (nullteordens hold); null der ingen kjøring i den fasen gir den

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = verdier av scenarionøkkelen { $key } langs aksen { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = verdien av scenarionøkkelen { $key } i denne noden

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } av nodens resultat

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } av hver realisering, i seed-rekkefølge

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = delt verdi { $name }, skrevet inn i hvert medlem som binder den

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = metrikk { $name } lest fra medlemmets resultat

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = minste { $name } over medlemmene

engine-campaign-largest-across-the-members = største { $name } over medlemmene

engine-campaign-mean-across-the-members = middelverdi av { $name } over medlemmene

engine-e-campaign-failed-to-serialise-campaign-result = kunne ikke serialisere kampanjeresultatet: { $e }

engine-campaign-chain-phases-over-events-alarm = kjede: { $phases } faser over { $duration_s } s, { $events } hendelser, alarm utløst i { $alarm_s } s av rutenettet

engine-campaign-sweep-of-nodes-over = sveip av `{ $scenario_kind }`: { $nodes } noder over [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = monte carlo av `{ $scenario_kind }`: { $runs } seeds

engine-campaign-compose-members = compose: { $members } medlemmer

engine-campaign-member-runs-modelled = { $runs_total } medlemskjøringer (MODELLED)

engine-campaign-sweep-of-over-nodes-each = sveip av `{ $scenario_kind }` over { $axis_order } ({ $nodes } noder; hver linje på sitt eget område)

engine-campaign-campaign-modelled-composition-every-value = kampanje { $r } | MODELLED sammensetning; hver verdi lest fra en reell kjøring av den navngitte kind-en

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = en optimalisering tar én til tre params, fikk { $params }

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` er navngitt to ganger

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: trenger endelig lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale må være lin eller log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: en log-param trenger positive grenser

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start må ligge i [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: et rutenett trenger steps på minst to

engine-e-campaign-optimize-objective-target-is-only-read = objective.target leses bare med goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" trenger en endelig objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal må være minimize, maximize eller target, fikk `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = et rutenett på { $total } noder er over grensen på 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps leses bare med method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals må dekke den innledende simpleksen (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step må ligge i (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol og xtol må være ikke-negative

engine-e-campaign-optimize-method-must-be-grid-or = method må være grid eller nelder-mead, fikk `{ $other }`

engine-campaign-optimize-optimize-eval = optimize eval { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = nedre grense for scenarionøkkelen { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = øvre grense for scenarionøkkelen { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = verdien av scenarionøkkelen { $key } ved den beste evalueringen

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = verdien av scenarionøkkelen { $key } ved denne evalueringen

engine-campaign-optimize-target-value-of = målverdi for { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } ved den beste evalueringen

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } for denne evalueringen (seed-middelverdien når runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) av `{ $scenario_kind }` med { $method }: { $evals } evals ({ $stop_reason }), best { $o2 } ved [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START før CCSDS_TDM_VERS-headeren

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: ugyldig headerlinje: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: ugyldig metadatalinje: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: ugyldig datalinje: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: ukjent datanøkkelord { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: datalinje { $k } mangler epoke

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: datalinje { $k } mangler verdi

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: datalinje { $k } har ugyldig verdi { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: uavsluttet segment (mangler META_STOP/DATA_STOP)

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: ugyldig TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: ugyldig TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = ukjent observable `{ $other }`: forventet én av range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = ukjente coordinates `{ $other }`: forventet én av cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours må være endelig og positiv, fikk { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs må være ≥ 2, fikk { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps må være ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials må være ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations må være ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd må være endelig og positiv, fikk { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor må være endelig og positiv, fikk { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km må være endelig og positiv, fikk { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m må være endelig og positiv, fikk { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s må være endelig og positiv, fikk { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = konstellasjonen må ha minst en chief og én referanse

engine-e-cislunar-arc-recovery-family-is-an-out-of = familien `{ $family }` er en familie utenfor planet og har ingen plan firetilstandsrepresentasjon: sett spatial = true for å sveipe den

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = forovermodellen ga en ikke-endelig referansemåling

engine-cislunar-arc-recovery-first-arc-length-at-which = første buelengde der HVERT seedede forsøks støyfrie batchløsning driver sluttilstandsfeilen til høyst { $recovery_factor } ganger den a priori-forskyvningen den startet fra. Dette er gjenvinningsanalogen til rangkriteriet: med eksakte målinger blir spørsmålet `is the state observable?` til `can an estimator get it back?`, og ingen toleranse for singulærverdier inngår i svaret.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = første buelengde der Monte Carlo-RMS-feilen i posisjonsgjenvinning over { $trials } seedede støyrealiseringer faller til eller under { $error_bound_km } km. Dette er gjenvinningsanalogen til estimerbarhetskriteriet, målt i stedet for forutsagt: feilen er avstanden fra estimatet til den kjente referansen, ikke sporet av en formell kovarians.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED innenfor ett steg i epokerutenettet: estimatoren gjenvinner fra { $e } h, Gramian-rangkriteriet snur ved { $g } h (forhold { $v1 }, rutenett { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED som gjenvinnbarhetsgrense: estimatoren gjenvinner fra { $e } h, { $v1 } Gramian-rangkriteriets { $g } h (forhold { $v2 }, rutenett { $grid_hours } h). Rangkriteriet er en relativ konvensjon for singulærverdier; gjenvinningsgrensen er en målt tilstandsfeil, og de to faller ikke sammen her.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: estimatoren oppfyller aldri gjenvinningsgrensen sin på denne buen, mens Gramian-rangkriteriet snur ved { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = Gramian-rangkriteriet er aldri nådd på denne buen (geometrien når aldri full rang), mens estimatoren gjenvinner fra { $e } h — de to er uenige om det i det hele tatt finnes en grense.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | { $family }-familie, { $state_dim } tilstander, { $n_spacecraft } s/c, { $observable } observable, { $coordinates } parametrisering | { $arc_hours } h bue, { $epochs } epoker (rutenett { $grid_hours } h), { $trials } forsøk, seed { $seed } | partiell derivasjon med differanser, ingen analytisk Jacobi-matrise / STM / SVD / SRIF | støyfri gjenvinning fra { $nf } (faktor { $recovery_factor }) mot Gramian-rangterskel { $gram } | Monte Carlo-estimerbarhet fra { $est } (RMS pos ≤ { $error_bound_km } km, σ { $sigma_range_m } m) mot Gramian-estimerbarhet { $gram_est } | RMS pos ved buens slutt { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = ukjent family `{ $other }`: forventet én av dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO ved kryssingsavstand { $d } ble ikke differensialkorrigert

engine-e-cislunar-observability-member-at-x0-did-not = { $label }-medlem { $i } ved x0 = { $x0 } ble ikke differensialkorrigert

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft må være mellom 2 og { $MAX_SPACECRAFT }, fikk { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs må være ≥ 2, fikk { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol må være endelig og positiv, fikk { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m må være endelig og ikke-negativ, fikk { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km må være endelig og positiv, fikk { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    { $n_links ->
        [one] cislunar-observability | { $c } s/c ({ $refs } referanser) | { $arc_hours } h bue, { $rank_arc } epoker | rang { $first } → { $last } av { $state_dim } over buen | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | momentan rang kun avstand { $rank_range_only } → avstand+rate { $rank_range_rate } ({ $n_links } lenke) | GDOP kun avstand { $ro } avstand+rate { $rr } | DRO ICs (maks periodisitetsresidual { $max_resid }) | SRIF-posterior endelig ved rang-4-epoke { $srif_epoch } (rang/STM/DRO-lukking/SRIF prøvd mot en uavhengig ekstern referanse, utforming beregnet fra en modell)
       *[other] cislunar-observability | { $c } s/c ({ $refs } referanser) | { $arc_hours } h bue, { $rank_arc } epoker | rang { $first } → { $last } av { $state_dim } over buen | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | momentan rang kun avstand { $rank_range_only } → avstand+rate { $rank_range_rate } ({ $n_links } lenker) | GDOP kun avstand { $ro } avstand+rate { $rr } | DRO ICs (maks periodisitetsresidual { $max_resid }) | SRIF-posterior endelig ved rang-4-epoke { $srif_epoch } (rang/STM/DRO-lukking/SRIF prøvd mot en uavhengig ekstern referanse, utforming beregnet fra en modell)
    }


engine-cislunar-observability-never-rank-of = aldri (rang { $rank } av { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | { $family }-familie, { $state_dim } tilstander, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | rangterskel { $rank_thr } (rutenett { $c } h) | estimerbarhetsterskel (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = første buelengde der den formelle 1σ-posisjonsusikkerheten for chiefs INITIELLE tilstand, σ_pos = sqrt(trace(P_rr)) med P = (ÕᵀÕ)⁻¹ og Õ den målestøyblekede observerbarhetsmatrisen, faller til eller under { $sigma_pos_threshold_km } km. Dette er kriteriet der en buelengdeterskel i det hele tatt er støyavhengig: P skalerer som σ², så σ_pos skalerer som σ, mens rangkriteriet ovenfor ikke beveger seg med σ. Grensen er et OPPGITT ingeniørvalg, ikke et tilpasset: estimability_sweep rapporterer terskelen ved fire andre grenser.

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] UTVIDELSE (R3) — denne kjøringen er IKKE den plane DRO-konfigurasjonen som `label` ovenfor beskriver. Tilstandsdimensjon { $state_dim }; banefamilie { $family }; { $n_spacecraft } romfartøy; avstandsmålingens sigma { $sigma_range_m } m. Der `label` sier "planar" og "planar DROs", les familien som er oppgitt her. VALIDATED tillegg: den variasjonelle 6x6-STM-en er den samme CR3BP-STM-en kontrollert mot endelige differanser (crate::cr3bp) som brukes i full bredde; de romlige Jacobi-radene for avstand / avstandsrate er analytiske partiellderiverte kontrollert mot endelige differanser, der raden for avstandsrate er kontrollert komponent for komponent mot crate-ets uavhengige 3D-funksjon deepspace_od::range_rate_observable; halo- og NRHO-initialbetingelsene er differensialkorrigerte periodiske baner fra den samme korrektoren som reproduserer den publiserte sørlige L2 9:2-NRHO-en, videreført fra det publiserte startpunktet, og lukkingsresidualet for hvert medlem rapporteres; de seks tilstandenes RANG-utfall er bekreftet mot en UAVHENGIG radtrappe-rang (Gauss-eliminasjon med delvis pivotering) som ikke deler kode med egenverdi-/SVD-veien. ÆRLIG OMFANG FOR SRIF-LEDDET: SRIF-krysskontrollen ovenfor bruker de SAMME måle-Jacobi-matrisene og reduseres til den samme O^T O, så samsvaret er en konsistenssjekk mellom to numeriske maskiner, IKKE uavhengig korroborering av terskelen — det telles ikke som prøving mot en uavhengig ekstern referanse av noen størrelse her. MODELLED: familieutformingen (hvilke abscisser, amplituder og faser), epokerutenettet, enkeltlenkebuen og den oppgitte posisjonsgrensen i estimerbarhetskriteriet.
       *[other] UTVIDELSE (R3) — denne kjøringen er IKKE den plane DRO-konfigurasjonen som `label` ovenfor beskriver. Tilstandsdimensjon { $state_dim }; banefamilie { $family }; { $n_spacecraft } romfartøyer; avstandsmålingens sigma { $sigma_range_m } m. Der `label` sier "planar" og "planar DROs", les familien som er oppgitt her. VALIDATED tillegg: den variasjonelle 6x6-STM-en er den samme CR3BP-STM-en kontrollert mot endelige differanser (crate::cr3bp) som brukes i full bredde; de romlige Jacobi-radene for avstand / avstandsrate er analytiske partiellderiverte kontrollert mot endelige differanser, der raden for avstandsrate er kontrollert komponent for komponent mot crate-ets uavhengige 3D-funksjon deepspace_od::range_rate_observable; halo- og NRHO-initialbetingelsene er differensialkorrigerte periodiske baner fra den samme korrektoren som reproduserer den publiserte sørlige L2 9:2-NRHO-en, videreført fra det publiserte startpunktet, og lukkingsresidualet for hvert medlem rapporteres; de seks tilstandenes RANG-utfall er bekreftet mot en UAVHENGIG radtrappe-rang (Gauss-eliminasjon med delvis pivotering) som ikke deler kode med egenverdi-/SVD-veien. ÆRLIG OMFANG FOR SRIF-LEDDET: SRIF-krysskontrollen ovenfor bruker de SAMME måle-Jacobi-matrisene og reduseres til den samme O^T O, så samsvaret er en konsistenssjekk mellom to numeriske maskiner, IKKE uavhengig korroborering av terskelen — det telles ikke som prøving mot en uavhengig ekstern referanse av noen størrelse her. MODELLED: familieutformingen (hvilke abscisser, amplituder og faser), epokerutenettet, enkeltlenkebuen og den oppgitte posisjonsgrensen i estimerbarhetskriteriet.
    }


engine-cislunar-observability-validated-each-constellation-initial-condition = Prøvd mot en uavhengig ekstern referanse: hver initialbetingelse i konstellasjonen er en differensialkorrigert periodisk bane i { $family }-familien, som lukker seg over én periode til det rapporterte periodisitetsresidualet (plane DRO-er er i tillegg retrograde om Månen). Familien korrigeres ved Jord-Måne-massetilforholdet. Beregnet fra en modell: valget av familieparametere og faser (konstellasjonens utforming). Nøkkelnavnet `dro_provenance` beholdes for det utgitte dokumentskjemaet; det bærer den familien denne kjøringen ba om.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } må være endelig og positiv, fikk { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } må ligge i (0, 1), fikk { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg må ligge i [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems må navngi minst én forhåndsinnstilling

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias trenger endelige bias_m, t0_s og t1_s

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] integrity: { $n } epoke overstiger taket på { $MAX_EPOCHS } epoker; øk step_s
       *[other] integrity: { $n } epoker overstiger taket på { $MAX_EPOCHS } epoker; øk step_s
    }


## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: ingen poster

engine-e-clock-library-card-records-at-different-tau0 = { $name }: poster ved ulik tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: periodisk minste kvadraters metode feilet

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: { $used } stabilitetspunkter med edf >= { $MIN_FIT_EDF }; et kort trenger tre

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = hull { $g }, faseavvikere { $o }, fasesprang { $p }, støtvise avvik { $b }, frekvenssprang { $f } (robust sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` er ikke et ikke-negativt heltall

engine-e-compliance-is-missing = `{ $p }` mangler

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } overstiger events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } overstiger predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: receiver-trust-tellingene er ugyldige ({ $malformed_counts }); utelatt

engine-e-compliance-not-json = { $label }: ikke JSON: { $e }

engine-compliance-cannot-read = { $label }: kan ikke leses: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: søskenscenarioet sier kind `{ $s }`, men resultatet sier `{ $o }`; ikke brukt

engine-e-compliance-scenario-kind-not-found-no = { $label }: scenario-kind ikke funnet (ingen søskenscenariofil, ikke et receiver-trust-resultat, ingen `kind` på toppnivå)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` er ikke en scenario-kind motoren kjenner; ikke brukt

engine-compliance-written-by-kshana = Skrevet av kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } test(er) med hver oppgitte terskel nådd, { $not_met } med en terskel ikke nådd, { $needs_input } som trenger inndata.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = intensitetsrutenettet må ha endelig min < max, fikk [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = intensitetsrutenettet trenger >= 2 steg, fikk { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = korrelasjonsrutenettet må ha minst én verdi

engine-e-conflict-resilience-correlation-values-must-lie-in = korrelasjonsverdiene må ligge i [0, 1], fikk { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience trenger minst ett lag

engine-e-conflict-resilience-layer-availability-not-in = lag { $i } tilgjengelighet { $availability } ikke i [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = lag { $i } sigma_m må være endelig og positiv

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = lag { $i } vulnerability må være endelig og >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = lag { $i } vector_weight må være endelig og >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } utenfor området (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials må være >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } lag ({ $primary } grunnlinje) | referanseintensitet { $reference_intensity } | robusthetsforhold lukket form { $ratio_closed_form }x MC { $ratio_mc_independent }x (flerlags mot enkeltlags) | korrelasjon svekker lagdeling: forhold { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | a priori-KI [{ $ratio_lo }-{ $ratio_hi }]x | overlevelse per vektor @ ref jam { $surv }% spoof { $surv2 }% kinetisk { $surv3 }% cyber { $surv4 }% (skarpest { $sharpest }) | ~7x hovedtall MODELLED, VALIDATED MC->lukket form / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = ukjent sentrallegeme { $name }: forventet en planet, Pluto, Månen eller en stor måne (earth, moon, mars, europa, titan, ...; se crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = et Walker-skall trenger total > 0 og planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walker-total { $total } er ikke et multiplum av planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = Walker-fasing F = { $phasing } må ligge i 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } er ikke en utvidbar GPS-slot (SPS PS Table 3.2-2 oppgir B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: oppgi altitude_km eller semi_major_axis_km, ikke begge

engine-e-constellation-needs-altitude-km-or-semi = { $what }: trenger altitude_km eller semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: store halvakse { $v1 } km er ikke over radien til { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: eksentrisiteten { $e } må ligge i [0, { $lit_0_9 })

engine-e-constellation-perigee-is-below-the-surface = { $what }: perigeum ligger under overflaten til { $name }

engine-e-constellation-constellation-preset-is-an-earth = konstellasjon { $name }: forhåndsinnstilling { $p } er en jordkonstellasjon, legemet er { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = konstellasjon { $name }: ukjent forhåndsinnstilling { $other } (forventet gps-baseline, gps-expandable, galileo, beidou, beidou-meo eller glonass)

engine-e-constellation-constellation-expanded-applies-only-to = konstellasjon { $name }: `expanded` gjelder bare for forhåndsinnstillingen gps-expandable

engine-constellation-constellation-shell = konstellasjon { $name } skall { $v2 }

engine-constellation-explicit-element-sets = { $satellite } eksplisitte elementsett

engine-constellation-constellation-satellite = konstellasjon { $name } satellitt { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = konstellasjon { $name } har ingen satellitter: oppgi en forhåndsinnstilling, en [[constellation.shell]] eller en [[constellation.satellite]]

engine-e-constellation-no-constellation-given = ingen konstellasjon oppgitt

engine-e-constellation-constellations-with-one-clock-each = { $constellations } konstellasjoner med én klokke hver overstiger grensen på { $MAX_CLOCKS } klokker; bruk clock = "common" eller slå sammen konstellasjoner

engine-e-constellation-must-be-finite = { $what } må være endelig

engine-e-constellation-need-step-and-duration-step = trenger step_s > 0 og duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = mer enn 100 000 epoker; øk step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg må ligge i [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold må være positiv

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg må ligge i [{ $lit_0_25 }, 90]

engine-e-constellation-need-90-lat-min-deg = trenger -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = trenger lon_min_deg < lon_max_deg som spenner over høyst 360 deg

engine-e-constellation-give-at-least-one-constellation = oppgi minst én [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points er begrenset til 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } satellitter overstiger grensen på 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: { $total } satellitter ({ $names }) rundt { $name }; tilgjengelighet { $global_availability_pct }% (PDOP <= { $pdop_threshold } ved { $mask_deg } deg maske), verste sted { $worst_site_availability_pct }%, median PDOP { $cov }, gjennomsnittlig { $global_mean_visible } i sikte; { $grid_points } rutenettpunkter x { $epochs } epoker (MODELLED)

engine-constellation-constellation-coverage-over-the = Konstellasjonsdekning over { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } må være endelig og positiv

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } må være endelig og >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw må være endelig

engine-e-contact-schedule-satellite-altitude-km-must-be = satellitt '{ $name }': altitude_km må være i (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satellitt '{ $name }': inclination_deg må være i [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satellitt '{ $name }': backlog_mbit må være >= 0

engine-e-contact-schedule-satellite-priority-must-be = satellitt '{ $name }': priority må være > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satellitt '{ $name }': eirp_dbw må være endelig

engine-e-contact-schedule-station-lat-deg-in-90 = stasjon '{ $name }': lat_deg i [-90, 90], lon_deg endelig

engine-e-contact-schedule-station-mask-deg-must-be = stasjon '{ $name }': mask_deg må være i [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = stasjon '{ $name }': alt_m må være i [0, 3000] (ITU-R P.834-området)

engine-e-contact-schedule-station-setup-and-over-db = stasjon '{ $name }': setup_s >= 0 og g_over_t_db endelig

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours må være i (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s må være i (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = minst én satellitt og én stasjon kreves

engine-e-contact-schedule-at-most-32-satellites-and = høyst 32 satellitter og 32 stasjoner

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: { $satellites } satellitter x { $stations } stasjoner over { $duration_hours } h -> { $cands } kandidatkontakter, { $greedy } planlagt; { $total_del } av { $total_backlog } Mbit levert{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: { $pairs } passering(er); ACM { $acm } Mbit mot CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = trenger minst 2 trials og en endelig sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total må være i (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = ingen lokal ramme ved brukeren

engine-e-dop-error-ci-singular-geometry = { $name }: singulær geometri

engine-e-dop-error-ci-no-noise-free-fix = { $name }: ingen støyfri posisjonsbestemmelse

engine-e-dop-error-ci-no-fix = { $name }: ingen posisjonsbestemmelse

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singulær geometri

engine-e-dop-error-mc-no-fix = { $label }: ingen posisjonsbestemmelse

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km må være positiv; fikk { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes og sats_per_plane må begge være ulik null

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz må være positiv; fikk { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency må være i (0, 1]; fikk { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k må være positiv; fikk { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db må være ikke-negativ; fikk { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m må ligge utenfor jorden; fikk { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] Jord-GNSS på månens avstand — { $n_satellites } satellitt, mottaker ved { $r } km{ "\u000A" }
       *[other] Jord-GNSS på månens avstand — { $n_satellites } satellitter, mottaker ved { $r } km{ "\u000A" }
    }


engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Jordens limb sett fra konstellasjonen: { $earth_limb_half_angle_deg } deg fra nadir — enhver stråle mot Månen må overstige dette{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_geometrically_visible } av { $n_satellites } er ikke okkultert; { $n_trackable } overstiger sporingsterskelen på { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }beste lenke { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }hver sporbare siktelinje ligger innenfor en halvkjegle på { $a } deg — geometrien er nesten degenerert{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }SVEIP over { $epochs } epoker / { $span_s } s: signaltilgjengelighet { $signal_availability }, tilgjengelighet for posisjonsbestemmelse { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }sporbare lenker gjennomsnitt { $mean_trackable }, maks { $max_trackable }; beste C/N0 { $w }; beste PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = mellom ett og seks trinn kreves

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg må være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 må være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg må være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m må være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg må være i [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s må være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = skyv-til-vekt-forholdet ved avløft { $tw } må overstige 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ideell dv { $ideal_dv_m_s } m/s, tap { $losses } m/s (tyngde { $gravity_loss_m_s }, luftmotstand { $drag_loss_m_s }, styring { $steering_loss_m_s }, mottrykk { $back_pressure_loss_m_s }); brennslutt { $r } km ved { $end_speed_m_s } m/s, gamma { $r2 } deg; maks-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } må være endelig og positiv

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body må være "earth" eller "mars", fikk "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = atmosfæren "{ $a }" er ikke tilgjengelig for legemet "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg må være i (0, 90) (positiv nedover)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m må være i [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg må være endelig med |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg og longitude_deg må være endelige

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag må være i [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg må være endelig

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s må være i (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m må være i [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s må være i (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame må være inertial|relative, fikk "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> topp { $pk_g } g ved { $r } km, topp-q { $r2 } W/cm² ved { $r3 } km, varmelast { $r4 } J/cm², topp-q_dyn { $r5 } kPa; { $outcome } ved { $end_time_s } s (lukket form { $cf_g } g; MODELLED 3-DoF, ingen stråling/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } må være i (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } må være endelig og ikke-negativ

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg må være i [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits må være i 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (brønn { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = nadirvinkelen { $eta_rad }° overstiger jordens vinkelradius { $rho }° (bommer på jorden)

engine-e-eo-payload-no-sun-synchronous-inclination-at = ingen solsynkron inklinasjon ved { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg må være i (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad må være endelig og positiv

engine-e-eo-payload-half-fov-too-large = half_fov er for stor: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> { $v3 } km sveipbredde, { $gsd } m GSD i nadir, tilgang til { $v5 } km utenfor nadir; nodeavstand { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Jord-Måne-barysenteret fra { $table }, delt av Montenbruck & Gill-månerekken presesert til J2000

engine-ephem-provider-jpl-mean-elements-in-the = JPL-middelelementer i Laplace-planet, midlere lengderate fra IAUs synkrone rotasjonsrate, lagt til sin planet fra { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = IAUs retning for synkron rotasjon ved JPLs middelavstand, lagt til Saturn fra { $table }

engine-e-ephem-provider-read = les { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = TLE mangler linje 1 (en linje som begynner med `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE mangler linje 2 (en linje som begynner med `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = en analytisk `orbit`-efemeride krever en `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = et efemeridescenario trenger enten en `tle` eller en `orbit`

engine-e-ephemeris-step-must-be-positive = step_s må være positiv

engine-e-ephemeris-duration-must-be-non-negative = duration_s må være ikke-negativ

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz må være en positiv, endelig frekvens

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] { $source } bakkespor · { $n_samples } sample · høyde { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
       *[other] { $source } bakkespor · { $n_samples } sampler · høyde { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
    }


## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` er ikke endelig

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` er verken sekunder eller et ISO-8601 UTC-tidspunkt

engine-e-evidence-assemble-no-epoch-of-the-log = ingen epoke i loggen ligger mellom { $t0 } s og { $t1 } s (loggen spenner fra 0 til { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config er ikke et objekt

engine-e-evidence-assemble-config-json-already-has-an = config.json har allerede en oppføring `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = fra { $from_s } til { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` er ikke et UTC-tidspunkt som 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } i en logg på { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } trenger en verdi

engine-e-evidence-cli-cannot-create = kan ikke opprette { $path }: { $e }

engine-e-evidence-cli-cannot-write = kan ikke skrive { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = advarsel: { $path } kan leses av andre brukere; begrens det (chmod 600)

engine-e-evidence-cli-cannot-read-key = kan ikke lese nøkkelen { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } er ikke en hex-nøkkel

engine-e-evidence-cli-must-hold-32-byte-key = { $path } må inneholde en 32-byte-nøkkel som 64 hex-sifre

engine-e-evidence-cli-cannot-read = kan ikke lese { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = kan ikke lese { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } finnes og er ikke tom

engine-e-evidence-cli-cannot-create-2 = kan ikke opprette { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = advarsel: { $arg } er kun for eieren (modus 600) og heter ikke *.pub: det kan være en privat nøkkel. Oppgi filen med den offentlige nøkkelen.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` er verken 64 hex-sifre eller en lesbar fil ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` inneholder ikke hex-sifre

engine-evidence-cli-private-key-keep-it-secret = privat nøkkel: { $out }  (hold den hemmelig; aldri commit den)

engine-evidence-cli-public-key-pub = offentlig nøkkel:  { $out }.pub

engine-evidence-cli-public-key-hex = offentlig nøkkel (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Gi verifikatorene den offentlige nøkkelen via en vei de stoler på; de fester den med --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify trenger en bundle-mappe

engine-e-evidence-cli-cannot-read-3 = kan ikke lese { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: fant ikke noe PEM-sertifikat

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }signaturen fra tidsstempelmyndigheten er ikke verifisert av Kshana

engine-evidence-cli-this-is-technical-record-not = Dette er en teknisk oppføring, ikke en juridisk vurdering.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp trenger en bundle-mappe

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp trenger en tokenfil

engine-e-evidence-cli-cannot-read-4 = kan ikke lese { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = kan ikke skrive { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = merk: tokenet ligger ved siden av det signerte manifestet, ikke inni det; bruk --require-timestamp ved verifisering for å kreve det.

engine-e-evidence-cli-round-trip-packs-are-not = rundturspakker bygges ikke for WebAssembly

engine-e-evidence-cli-needs-scenario-path = trenger en scenariosti

engine-e-evidence-cli-needs-from = trenger --from

engine-e-evidence-cli-needs-to = trenger --to

engine-e-evidence-cli-cannot-read-lab-attestation = kan ikke lese laboratorieattesten { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = kan ikke lese { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = ugyldig receiver-trust-scenario: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation gjelder for `receiver-trust evidence`, ikke for `evidence round-trip` (der pakken registrerer testforholdene)

engine-e-evidence-cli-cannot-read-6 = kan ikke lese { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = kan ikke lese { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = bevispakke skrevet til { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epoker i vinduet: { $epochs_in_window }  ({ $from_s } s til { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }signerens fingeravtrykk: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 for manifest.json (det en RFC 3161-myndighet bør tidsstemple): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }loggutsnitt: bytes { $a } til { $b } av { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }loggutsnitt: hele loggen (denne loggen gir ikke noe byteområde for vinduet)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }laboratorieattest registrert i det signerte manifestet ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = En pakke er en teknisk oppføring, ikke en juridisk vurdering.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s til { $to_s } s etter den første epoken i loggen

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = ugyldig lab-attestation-TOML: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` må være en tabell

engine-e-evidence-lab-invalid-lab-attestation = ugyldig lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } er påkrevd

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } er over { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: datoen { $date } er ikke en dag som 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: et skjermet oppsett trenger enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup må være "conducted" eller "shielded" (fikk { $other }); et over-the-air-oppsett godtas ikke som en laboratoriekjøring

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db må være endelig

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = testforholdene oppgir { $events } hendelse(r), men skåringsscenarioet har { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = hendelsen '{ $id }' i testforholdene ({ $onset_s } s til { $offset_s } s) stemmer ikke med '{ $label }' i skåringsscenarioet ({ $onset_s2 } s til { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = loggens SHA-256 ({ $have }) er ikke den testforholdene oppgir ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = avkortet DER

engine-e-evidence-tsa-bad-der-length = ugyldig DER-lengde

engine-e-evidence-tsa-unexpected-der-tag = { $what }: uventet DER-tagg { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = tom AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = ugyldig UTCTime

engine-e-evidence-tsa-bad-generalizedtime = ugyldig GeneralizedTime

engine-e-evidence-tsa-bad-time = ugyldig tid

engine-e-evidence-tsa-time-not-in-utc = tiden er ikke i UTC

engine-e-evidence-tsa-bad-time-digits = ugyldige tidssiffer

engine-e-evidence-tsa-bad-bit-string = ugyldig BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: tre elementer forventet

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: for kort

engine-e-evidence-tsa-empty-extension = tom Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: verdien er ikke en OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: tom

engine-e-evidence-tsa-validity-short = Validity: for kort

engine-e-evidence-tsa-pem-end-without-begin = PEM: END uten BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: ugyldig base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: ugyldig base64-lengde

engine-e-evidence-tsa-spki-empty = SPKI: tom

engine-e-evidence-tsa-spki-no-oid = SPKI: ingen OID

engine-e-evidence-tsa-spki-no-key = SPKI: ingen nøkkel

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: to heltall forventet

engine-e-evidence-tsa-unsupported-elliptic-curve = ikke støttet elliptisk kurve

engine-e-evidence-tsa-unsupported-public-key-algorithm = ikke støttet algoritme for offentlig nøkkel

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA-nøkkel eller -signatur for stor

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA-modulus er ikke oddetall

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA-signatur utenfor gyldig område

engine-e-evidence-tsa-rsa-key-too-small = RSA-nøkkel for liten

engine-e-evidence-tsa-invalid-padding = ugyldig utfylling

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: kodet melding for lang

engine-e-evidence-tsa-last-octet-invalid = siste oktett er ugyldig

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: bitene lengst til venstre er ikke null

engine-e-evidence-tsa-pss-bad-padding = PSS: ugyldig utfylling

engine-e-evidence-tsa-pss-signature-mismatch = PSS: signaturen stemmer ikke

engine-e-evidence-tsa-unsupported-mask-generation-function = ikke støttet maskegenereringsfunksjon

engine-e-evidence-tsa-mgf1-without-hash = MGF1 uten hash

engine-e-evidence-tsa-bad-pss-salt-length = ugyldig PSS-saltlengde

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = en ECDSA-signatur trenger en EC-nøkkel

engine-e-evidence-tsa-an-rsa-signature-needs-an = en RSA-signatur trenger en RSA-nøkkel

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption uten en digest-algoritme

engine-e-evidence-tsa-an-rsa-pss-signature-needs = en RSA-PSS-signatur trenger en RSA-nøkkel

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey uten en digest-algoritme

engine-e-evidence-tsa-unsupported-signature-algorithm = ikke støttet signaturalgoritme

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: tom

engine-e-evidence-tsa-time-stamp-request-not-granted = forespørselen om tidsstempel ble ikke innvilget

engine-e-evidence-tsa-no-time-stamp-token-in = ingen tidsstempeltoken i svaret

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = ikke en TimeStampResp eller TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = ikke CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: uten innhold

engine-e-evidence-tsa-signeddata-short = SignedData: for kort

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: tom

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = det innkapslede innholdet er ikke en TSTInfo

engine-e-evidence-tsa-no-tstinfo = ingen TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo ligger ikke i en OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: for kort

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: ingen genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: ingen signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = nøyaktig én SignerInfo forventet

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: ingen sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: ingen digest-algoritme

engine-e-evidence-tsa-signerinfo-short = SignerInfo: for kort

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: ingen signerte attributter

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: ingen signaturalgoritme

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: ingen signatur

engine-e-evidence-tsa-no-serial = ingen serienummer

engine-e-evidence-tsa-signer-certificate-not-found = signerens sertifikat ble ikke funnet

engine-e-evidence-tsa-attribute-empty = Attribute: tom

engine-e-evidence-tsa-attribute-no-values = Attribute: ingen verdier

engine-e-evidence-tsa-attribute-no-value = Attribute: ingen verdi

engine-e-evidence-tsa-content-type-attribute-mismatch = content-type-attributtet stemmer ikke

engine-e-evidence-tsa-digest-failure = digest-feil

engine-e-evidence-tsa-signature-not-an-octet-string = signaturen er ikke en OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = ess-attributtet for signeringssertifikat mangler

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: tom

engine-e-evidence-tsa-ess-cert-id-not-found = ess-sertifikat-ID ble ikke funnet

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: ingen hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = uegnet formål for sertifikatet

engine-e-evidence-tsa-certificate-is-not-yet-valid = sertifikatet er ikke gyldig ennå

engine-e-evidence-tsa-certificate-has-expired = sertifikatet er utløpt

engine-e-evidence-tsa-invalid-ca-certificate = ugyldig CA-sertifikat

engine-e-evidence-tsa-certificate-chain-too-long = sertifikatkjeden er for lang

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: tom

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: ingen digest

engine-e-evidence-tsa-message-imprint-mismatch = avvik i meldingsavtrykket

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER med ubestemt lengde støttes ikke

engine-e-evidence-tsr-expected-tag-found = forventet { $what } (tagg { $tag }), fant { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = ugyldig PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = tidsstempelsvaret ble ikke innvilget

engine-e-evidence-tsr-not-timestamp-token = ikke et tidsstempeltoken

engine-e-evidence-tsr-the-token-content-type-is = tokenets innholdstype er ikke CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = tokenet inneholder ikke en TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = meldingsavtrykket bruker en hash-algoritme som ikke støttes

engine-e-evidence-tsr-the-imprint-is-bytes-not = avtrykket er { $digest } bytes, ikke de { $want_len } som { $hash_alg } gir

engine-e-evidence-tsr-gentime-is-not-utc = genTime er ikke UTC

engine-e-evidence-tsr-malformed-gentime = ugyldig genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime er ikke et virkelig kalendertidspunkt

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = ikke hex med små bokstaver

engine-e-evidence-verify-expected-bytes-found = forventet { $N } bytes, fant { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = pakken har allerede et tidsstempeltoken; bruk --replace for å erstatte det

engine-e-evidence-verify-not-attached-the-pack-with = ikke vedlagt: pakken med dette tokenet kan ikke verifiseres ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = pakken registrerer en laboratorieattest fra { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = signaturfilen slutter ikke med et linjeskift

engine-evidence-verify-signer-not-pinned-the-signature = signer ikke festet: signaturen viser at pakken er intakt mot nøkkelen { $r }, som pakken selv oppgir. Sammenlign det fingeravtrykket med et du har fått fra signeren, eller oppgi nøkkelen.

engine-evidence-verify-range-is-not-inside-log = området { $start }..{ $end } ligger ikke innenfor en logg på { $full_bytes } bytes

engine-evidence-verify-timestamp-token-states-its-imprint = tidsstempeltokenet oppgir { $gen_time }; avtrykket { $v2 } manifest.json. Signaturen fra tidsstempelmyndigheten er ikke verifisert av Kshana: kontroller den med `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = tidsstempeltokenet oppgir { $gen_time }; avtrykket { $v2 } manifest.json; tidsstempelmyndighetens signatur og kjede { $v3 } mot de oppgitte ankrene.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` er en tom streng

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } er utenfor vokabularet

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = kostnadsintervallet må være endelig, ikke-negativt, ordnet lav≤nominell≤høy og oppgi en kilde

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction og availability må være andeler i [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } må være endelig og > 0, fikk { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } må være endelig og >= 0, fikk { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg må være i [-90, 90), fikk { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = konstellasjonen har ingen satellitter

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats må være >= 1 når den er satt

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = slip-satellitt { $sat } utenfor gyldig område

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = linje { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = linje { $lineno }: { $v } kolonner, minst { $min } forventet

engine-e-fusion-kfgins-line-columns = linje { $v1 }: { $v } kolonner

engine-e-fusion-kfgins-line-block-lists-are-not = linje { $lineno }: blokklister støttes ikke

engine-e-fusion-kfgins-line-expected-key-value = linje { $lineno }: forventet `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = linje { $lineno }: innrykket nøkkel uten overordnet nøkkel

engine-e-fusion-kfgins-line-only-one-level-of = linje { $lineno }: bare ett nivå av nesting

engine-e-fusion-kfgins-line-unterminated-flow-list = linje { $lineno }: uavsluttet flow-liste

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` er en liste, en skalar forventet

engine-e-fusion-kfgins-missing = `{ $k }` mangler

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` må være en liste med tre elementer

engine-e-fusion-kfgins-no-imu-sample-at-or = ingen IMU-sample ved eller etter starttime

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU-tiden øker ikke ved { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } må være endelig og > 0, fikk { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m må være endelig og > 0, fikk { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg må være i [-90, 90), fikk { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = trajectory-csv linje { $v1 }: ikke tall: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = trajectory-csv linje { $v1 }: forventet 10 kolonner, fikk { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = trajectory-csv linje { $v1 }: tiden øker ikke

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = trajectory-csv trenger minst to rader

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = trajectory-csv dekker { $rows } s, men scenarioet varer { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg for site må være i [-90, 90], og alle felt må være endelige

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" er verken en GNSS-forhåndsinnstilling ({ $e_gnss }) eller en LEO-forhåndsinnstilling ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: oppgi brukeren som `site` eller `user_ecef_m`, ikke begge

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m må være endelig og ikke geosenteret

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satellitt { $id }: azimut/elevasjon utenfor gyldig område

engine-e-geometry-sky-satellite-is-given-in = sky: satellitt { $id } er oppgitt i ECEF; forespørselen trenger `site` eller `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satellitt { $id }: ECEF-posisjonen er ikke endelig

engine-e-geometry-sky-satellite-coincides-with-the = sky: satellitt { $id } faller sammen med brukeren

engine-e-geometry-sky-satellite-give-az-deg = sky: satellitt { $id }: oppgi az_deg og el_deg, eller ecef_m, og ingenting annet

engine-e-geometry-sky-tle-is-bytes-the = sky: tle er { $text } bytes; grensen er { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = elementsett avvist: { $e }

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] sky: tle inneholder ikke noe fullstendig tolinjers elementsett; { $n_ignored } linje ignorert, den første: { $first }
       *[other] sky: tle inneholder ikke noe fullstendig tolinjers elementsett; { $n_ignored } linjer ignorert, den første: { $first }
    }


engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. og { $more } til

engine-geometry-element-sets-propagated-by-the = { $n } elementsett propagert av motorens SGP4 (WGS-72) til { $iso } og rotert til jordfast system med UT1 satt lik UTC og uten polbevegelse: himmelen disse elementsettene gir ved den epoken, ikke en måling av den.

engine-geometry-element-sets-propagated-by-the-2 = { $n } elementsett propagert av motorens SGP4 (WGS-72) til det nyeste elementsettets epoke pluss time_s ({ $iso }). Ingen epoke ble oppgitt, så dette er en representativ himmel, ikke himmelen på en oppgitt dato.

engine-e-geometry-sky-give-systems-or-tle = sky: oppgi `systems` eller `tle` (med en `site`), eller `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system navngir `tle`-satellittene; forespørselen har ingen `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg må være i [-90, 90), fikk { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` trenger en `site` (eller `user_ecef_m`) å se fra

engine-e-geometry-sky-time-must-be-finite = sky: time_s må være endelig

engine-e-geometry-sky-system-asks-for-satellites = sky: systemet "{ $name }" ber om { $asked } satellitter; en forespørsel rommer høyst { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: mer enn { $MAX_SATELLITES } satellitter

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` trenger en `site` (eller `user_ecef_m`) å se fra

engine-e-geometry-sky-more-than-satellites-above = sky: mer enn { $MAX_SATELLITES } satellitter over horisonten

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m må være positiv, fikk { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence må være i (0, 1), fikk { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: mer enn { $MAX_CLOCKS } systemer i sikte, hvert med sin egen klokke; grupper satellitter under færre `system`-etiketter eller bruk clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n må være i 1..={ $MAX_MC_SAMPLES }, fikk { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: for få satellitter i sikte for en posisjonsbestemmelse; ingen Monte Carlo-sky

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = TLE-himmel ved { $e }, ikke en måling

engine-e-geometry-invalid-sky-request-json = ugyldig sky-forespørsel (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = ugyldig sky-forespørsel (TOML): { $e }

engine-e-geometry-invalid-skyline-json = ugyldig skyline (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = ugyldig skyline (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = ugyldig GLONASS-PRN i { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = sidetype { $pt } kodes ikke her

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bit, forventet { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bit, forventet { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = haledelen av bit er ikke null

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q stemmer ikke

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = sidetype { $pt } dekodes ikke her

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } symboler, forventet { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = synkroniseringsmønsteret ble ikke funnet

engine-e-gnss-navmsg-gal-fnav-page-type-missing = sidetype { $t } mangler

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav for sidetype { $t } avviker fra sidetype 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = ingen Galileo-felt { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = ordtype { $wt } kodes ikke her

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bit, forventet { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = ordtype { $wt } dekodes ikke her

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = sidedeler må være 120 bit

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = partalls-/oddetallsflaggene er ikke 0 og så 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = ikke en nominell side (sidetype 1 er en varselside)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bit, forventet { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } symboler, forventet { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = ordtype { $t } mangler

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav for ordtype { $t } avviker fra ordtype 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = posten tilhører system { $system }, ikke Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = type 10 har ikke feltet { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = type 11 har ikke feltet { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = type 30 har ikke feltet { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV-kroppen har { $body } bit, forventet 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } eller TOW-teller { $tow_count } utenfor gyldig område

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bit, forventet { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = preamblen er ikke 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = meldingstype { $t } dekodes ikke her

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = trenger en melding av type 10 og en av type 11

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } ved LSB { $value2 } passer ikke i { $bits } { $v4 } bit

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bit, oppsettet trenger { $need }

engine-e-gnss-navmsg-no-field = ingen felt { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } ved skala 2^{ $scale_pow2 } passer ikke i { $bits } { $v1 } bit

engine-e-gps-lnav-no-value-for = ingen verdi for { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: referansemodellen "gfc" trenger `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: kan ikke lese gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: ukjent referansemodell `{ $other }` (bruk "egm2008" eller "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: ukjent ellipsoide `{ $other }` (bruk "wgs84" eller "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations må være minst 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations er begrenset til 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = ugyldig reelt tall '{ $t }'

engine-e-gravity-pds-bad-integer = ugyldig heltall '{ $t }'

engine-e-gravity-pds-empty-shadr-table = tom SHADR-tabell

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR-headeren har { $f } felt, forventet minst 6

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR-header: negativ grad/orden eller ukjent normalisering

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR-normaliseringstilstand { $normalization } (bare full normalisering, tilstand 1, støttes)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR referanselengdegrad/-breddegrad må være 0

engine-e-gravity-pds-non-physical-gm-must-be = ikke-fysisk GM (må være endelig og positiv)

engine-e-gravity-pds-non-physical-reference-radius-must = ikke-fysisk referanseradius (må være endelig og positiv)

engine-e-gravity-pds-shadr-record-fields = SHADR-post { $v1 }: { $f } felt

engine-e-gravity-pds-shadr-record-bad = SHADR-post { $v1 }: ugyldig (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR-post { $v1 }: ikke-endelig koeffisient

engine-e-gravity-pds-no-shadr-coefficient-records = ingen SHADR-koeffisientposter

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR-tabellen er ufullstendig: mangler (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = mangler earth_gravity_constant / gravity_constant

engine-e-gravity-sh-missing-radius = mangler radius

engine-e-gravity-sh-non-physical-earth-gravity-constant = ikke-fysisk earth_gravity_constant (må være endelig og positiv)

engine-e-gravity-sh-non-physical-radius-must-be = ikke-fysisk radius (må være endelig og positiv)

engine-e-gravity-sh-no-gfc-coefficient-lines = ingen gfc-koeffisientlinjer

engine-e-gravity-sh-read-error = lesefeil: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = linje { $lineno }: norm { $v } støttes ikke (bare fully_normalized)

engine-gravity-sh-line-bad = linje { $lineno }: ugyldig { $what }

engine-e-gravity-sh-line-degree-above-the-declared = linje { $lineno }: grad { $n } over den deklarerte max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = linje { $lineno }: orden { $m } over grad { $n }

engine-e-gravity-sh-line-time-variable-term-is = linje { $lineno }: tidsvariabelt ledd `{ $key }` støttes ikke (bare statiske modeller)

engine-e-gravity-sh-missing-end-of-head = mangler end_of_head

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s må være positiv, fikk { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s må være positiv, fikk { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] scenarioet gir { $n } epoke (trenger ≥ 2); øk duration_s eller reduser step_s
       *[other] scenarioet gir { $n } epoker (trenger ≥ 2); øk duration_s eller reduser step_s
    }


## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = posten inneholder en ikke-endelig tidsfeil

engine-e-holdover-test-unknown-mask-expected-one-of = ukjent maske { $id }; forventet en av { $masks }

engine-e-holdover-test-every-budget-max-abs-te = hver budsjett-max_abs_te_ns må være endelig og positiv

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } ligger utenfor posten ({ $t0_s } til { $t_end } s på postens egen tidsakse)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } må være senere enn gnss_removed_s ({ $gnss_removed_s }) og ikke etter slutten av posten ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = holdover-steget inneholder ingen sample

engine-holdover-test-the-record-has-no-step = posten har ikke noe { $step }-steg: GNSS ble fjernet ved første sample

engine-holdover-test-the-step-has-samples-the = { $step }-steget har { $te_ns } sampler; estimatorene trenger minst 13

engine-e-holdover-test-step-with-mask-has-no = et steg med en maske har ingen kurve

engine-e-holdover-test-cannot-read-csv-path = kan ikke lese csv_path { $path }: { $e }

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, maks|TE| { $max_abs } ns; { $masks } (MODELLED, målt mot masken)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m må være endelig og > 0, fikk { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba må være >= 0 og coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: de to grenene har ikke en felles midlingstid. Den optiske grenen akkumulerer over integration_s = { $integration_s } s; RF-grenens sløyfestøybåndbredde B_L = { $dll_bandwidth_hz } Hz midler over 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Et forhold mellom to sigmaer tatt ved ulike midlingstider er ikke en sammenligning, så ingen oppgis. Fjern overstyringen rf_dll_bandwidth_hz (den er da som standard 1/(2*integration_s)) eller sett den til { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: en gren er ikke en brukbar positiv endelig sigma (optisk { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), så ingen ratio dannes.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = ukjent rf_band '{ $other }' (forventet s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } må være endelig

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db må være endelig og >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | optisk fotavtrykk { $footprint_m } m, { $detected_photons } fotoner -> avstands-σ { $c } mm, tids-σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | tilgjengelighet { $c4 }% ({ $n_sites } sted) | overlevering uten sprang { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | felles FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | prøvd mot en uavhengig ekstern referanse: CRLB/χ²-PL/union/overlevering, beregnet fra en modell: σ/klimatologi
       *[other] hybrid-optical-rf | optisk fotavtrykk { $footprint_m } m, { $detected_photons } fotoner -> avstands-σ { $c } mm, tids-σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | tilgjengelighet { $c4 }% ({ $n_sites } steder) | overlevering uten sprang { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | felles FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | prøvd mot en uavhengig ekstern referanse: CRLB/χ²-PL/union/overlevering, beregnet fra en modell: σ/klimatologi
    }


## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa må være i [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class må være >= 1

engine-impairment-eval-impairment-eval-detector-auc-in =
    { $n_cases ->
        [one] impairment-eval | detektor { $detector } | AUC { $auc_in } inne / { $auc_out } ute (gap { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ mål { $target_pfa } | { $n_cases } tilfelle | MODELLED syntetisk
       *[other] impairment-eval | detektor { $detector } | AUC { $auc_in } inne / { $auc_out } ute (gap { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ mål { $target_pfa } | { $n_cases } tilfeller | MODELLED syntetisk
    }


engine-e-impairment-eval-unknown-detector-energy-agc-sqm = ukjent detektor '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = ukjent imu_grade { $other }; forventet en av navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = ukjent combination { $other }; forventet en av rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = ukjent trn_fix_mode { $other }; forventet en av none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } må være endelig og ikke-negativ (fikk { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m må oppgi minst én terskel

engine-e-inertial-coast-crossing-thresholds-entries-must-be = oppføringene i crossing_thresholds_m må være endelige og positive (fikk { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades må oppgi minst én IMU-klasse

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s må være endelig og ikke-negativ (fikk { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 må være endelig og ikke-negativ (fikk { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg må være endelig og innenfor (-89, 89) (fikk { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m må være innenfor [-1000, 100000] (fikk { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s må være positiv

engine-e-inertial-coast-drift-band-must-satisfy-lo = driftbåndet må oppfylle 0 < lo < hi (fikk lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = serialiserer ins-trn-coast-resultat: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU, { $speed } m/s, combination { $comb } | { $heads } | TRN { $mode } topp { $peak_error_m } m over { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va utledet fra fysikken til kaldatominterferometre)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = scenarioet er { $toml_text } bytes, over grensen på { $max_bytes } bytes

engine-e-inline-only-the-scenario-kind-reads-its = scenario-kind `{ $kind }` leser dataene sine fra filer på verten, så denne flaten kjører den ikke; bruk `kshana`-kommandolinjen

engine-e-inline-only-the-field-names-file-this = feltet `{ $k }` navngir en fil: denne flaten godtar bare innebygd innhold

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = trace-JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = ukjent datasett `{ $key }`; støttede: { $v1 }, eller et eget datasett

engine-e-interference-map-api-dataset-is-data-but-the = datasettet `{ $key }` er { $kind }-data, men inndatatypen er { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } er ikke en dato på formen YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = ukjent valg `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = forventet { $positionals } posisjonsargument(er), fikk { $pos }

engine-e-interference-map-cli-cannot-read = kan ikke lese { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom trenger { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } finnes allerede; Kshana overskriver ikke kart. Fjern den eller velg en annen --out-mappe

engine-interference-map-cli-note-cell-deg-is-not = merk: --cell-deg { $cell_deg } er ikke den forhåndsregistrerte cellestørrelsen ({ $PREREGISTERED_CELL_DEG }); kartene sier det

engine-e-interference-map-cli-cannot-create = kan ikke opprette { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = skrev { $path }: { $cells } celler publisert, { $n_deg } markert

engine-interference-map-cli-no-usable-rows-nothing-written = ingen brukbare rader: ingenting skrevet

engine-e-interference-map-cli-unknown-subcommand = ukjent underkommando `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = SHA-256 for den nedlastede filen ({ $got }) stemmer ikke med den festede verdien ({ $expected }); filen ble forkastet

engine-e-interference-map-cli-cannot-write = kan ikke skrive { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl ble ikke funnet i PATH. Installer curl, eller last ned { $NATURAL_EARTH_LAND_URL } selv og kontroller at SHA-256 er { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = kan ikke kjøre curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = skrev { $out }: Natural Earth-landpolygoner, SHA-256 verifisert (offentlig eiendom, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = ingen trace_full_*-filer under { $path }

engine-e-interference-map-cli-cannot-read-2 = kan ikke lese { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } er ikke en dato på formen YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: ugyldig kartdato

engine-e-interference-map-cli-cannot-write-2 = kan ikke skrive { $out }: { $e }

engine-interference-map-cli-route-length-km = rutelengde { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Forbehold: en degradert celle viser ikke at interferens er årsaken; celler som ikke er observert er ikke belegg for en fri rute; dette er ikke en prognose.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = landpolygoner: ugyldig JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = mangler påkrevd kolonne `{ $name }`

engine-e-interference-map-cannot-read-input = kan ikke lese inndata: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` er ikke en dato (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours må være { $MIN_DELAY_HOURS } eller mer: observatoriet publiserer ikke tidligere

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg må være { $MIN_CELL_DEG } eller grovere: observatoriet publiserer bare grove celler

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } kan ikke publiseres ennå: produktet utgis tidligst { $fmt_utc } ({ $delay_hours } h etter at dagen slutter)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORY  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED

engine-interference-map-observatory-source-licence = SOURCE { $dataset }  LICENCE { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (PUBLISHED CELLS)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana observatory, ADS-B-kart over navigasjonsnøyaktighet, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = kan ikke opprette { $path } (Kshana overskriver ikke produkter): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = inndataene har ingen brukbar rapport for { $day } (dager funnet: { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } finnes allerede; Kshana overskriver ikke produkter

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } celler publisert, { $p2 } degraderte, { $p3 } hendelse(r)

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } rader avspilt på nytt under { $variants } varianter: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = kartet er ikke gyldig JSON: { $e }

engine-e-interference-map-route-route-invalid-json = rute: ugyldig JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = rute: linje { $v1 } er ikke `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 }-eksport. Epoke: { $epoch_note }. Bevegelige objekter: GCRS (referenceFrame INERTIAL), meter, sekunder etter epoken. Faste steder: jordfast WGS 84 (referenceFrame FIXED), meter.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Posisjon: GCRS, meter.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Breddegrad { $lat_deg } deg, lengdegrad { $lon_deg } deg, høyde { $h_m } m over WGS 84-ellipsoiden. Posisjon: jordfast, meter.

engine-interop-czml-radius-along-the-ground = { $description }. Radius { $radius_m } m langs bakken.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Uten tid: WGS 84 lengde- og breddegrad i grader, festet til bakken.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Jordfaste posisjoner; en MultiLineString deles ved antimeridianen, og times_utc oppgir da bare de opprinnelige samplene.

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 }-eksport. Epoke: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = ugyldig GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString har ingen koordinatrekke

engine-e-interop-geojson-an-rfc-7946-linestring-needs = en RFC 7946 LineString trenger to eller flere posisjoner

engine-interop-geojson-position-is-not-an-array = posisjon { $i } er ikke en rekke med to eller tre tall

engine-interop-geojson-position-longitude-is-not-number = posisjon { $i }: lengdegrad er ikke et tall

engine-interop-geojson-position-latitude-is-not-number = posisjon { $i }: breddegrad er ikke et tall

engine-e-interop-geojson-position-longitude-is-outside-180 = posisjon { $i }: lengdegrad { $lon } er utenfor [-180, 180] (GeoJSON setter lengdegrad først)

engine-e-interop-geojson-position-latitude-is-outside-90 = posisjon { $i }: breddegrad { $lat } er utenfor [-90, 90] (GeoJSON setter lengdegrad først)

engine-e-interop-geojson-track-needs-two-or-more = et spor trenger to eller flere veipunkter

engine-e-interop-geojson-the-route-spans-more-than = ruten spenner over mer enn 180 grader lengdegrad; spor-kindene går i rene grader og kan ikke krysse antimeridianen

engine-e-interop-geojson-position-is-deg-from-an = posisjon { $worst } er { $worst2 } deg fra et jevnt fordelt rett spor (toleranse { $tol_deg } deg); spor-kindene flyr start + i*step, så oppgi jevnt fordelte posisjoner på en linje, eller bare de to endene

engine-e-interop-geojson-route-applies-to-the-kinds = en rute gjelder for kindene som flyr et veipunktspor (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` tar ingen bevegelsesbane som inndata

engine-e-interop-geojson-scenario-toml-is-not-table = scenario-TOML er ikke en tabell

engine-e-interop-geojson-cannot-serialise-scenario = kan ikke serialisere scenarioet: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = ukjent eksportformat '{ $other }'; forventet ett av czml, kml, geojson, stk, sigmf, all eller list

engine-e-interop-member = medlem { $label }: { $e }

engine-interop-the-scenario-could-not-be = scenarioet kunne ikke eksporteres: { $m }

engine-e-interop-invalid-spectrum-scenario = ugyldig spectrum-scenario: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } tidssample er mer enn en eksport skriver ({ $MAX_SAMPLES })
       *[other] { $n } tidssampler er mer enn en eksport skriver ({ $MAX_SAMPLES })
    }


engine-e-interop-scene-objects-samples-is-more-than = { $items } objekter x { $times } sampler er mer enn en eksport skriver ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = ugyldig { $kind }-scenario: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type } jammer, { $power_dbw } dBW sendeeffekt, { $gain_dbi } dBi antenneforsterkning

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, fra linkligningene til jamming-kind med jammeren ved mottakerens horisont og frirom-tap

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (kjedens [pass]-trinn)

engine-interop-scene-circular-orbit-km-altitude-deg = sirkulær bane, { $altitude_km } km høyde, { $inclination_deg } deg inklinasjon (SGP4 midlere elementer ved vinduets start, slik passes-kind propagerer den)

engine-interop-scene-ground-station-deg-elevation-mask = bakkestasjon, { $mask_deg } deg elevasjonsmaske

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; GCRS- og jordfaste tilstander er ephemeris-kinds egne utdata (UT1 og polbevegelse slik scenarioet setter dem)

engine-interop-scene-static-scene-the-kind-flies = statisk scene: kind { $kind } flyr et spor av veipunkter uten tid

engine-interop-scene-true-track-flown-gps-denied = sant spor fløyet uten GPS: { $track } veipunkter fra start_lat_deg/start_lon_deg i steg på step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` har ingen scene

engine-e-interop-scene-missing-numeric = mangler numerisk `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = mangler heltallet `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } er utenfor 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } på { $altitude_km } km, { $inclination_deg } deg inklinasjon (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = scenarioet oppgir ingen `epoch`; t = 0 er { $epoch }, den tidligste epoken satellittenes egne data bærer (TLE-, kringkastingsefemeride- eller SP3-epoke). Hver satellitt propageres fra sin egen epoke, og disse spenner over { $spread_h } h: tidsmerkene følger motorens forutsetning om at alle satellitter starter ved t = 0, mens hver posisjon roteres inn i GCRS- og jordfaste referansesystemer ved den satellittens eget tidspunkt. SP3- og OEM-eksportene merker i stedet t = 0 som 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = scenarioet oppgir ingen `epoch`; t = 0 er { $epoch }, epoken satellittenes egne data bærer (TLE-, kringkastingsefemeride- eller SP3-epoke). SP3- og OEM-eksportene merker i stedet t = 0 som 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objekter x { $times_s } sampler er mer enn en eksport skriver ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = { $user_environment }-bruker, i bevegelse (kindens konstante fart og kurs)

engine-interop-scene-user-receiver = { $user_environment }-bruker (mottaker)

engine-interop-scene-user-orbit-km-altitude-deg = brukerbane, { $altitude_km } km høyde, { $inclination_deg } deg inklinasjon (Kepler{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = ingen bevegelig objekt { $index }

engine-interop-stk-kshana-export-object = # Kshana { $v1 }-eksport: { $scene }, objekt { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type } jammer, { $power_dbw } dBW sendeeffekt, { $gain_dbi } dBi antenneforsterkning (en parameter i scenarioets linkbudsjett, ikke et signal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` har ingen kjøretøybane å eksportere; testbenk-eksporten dekker kindene gnss-ins, jamming og gnss-sim

engine-e-interop-testbench-empty-motion-csv = tom bevegelses-CSV

engine-e-interop-testbench-motion-csv-header-is-not = overskriftsraden i bevegelses-CSV har ikke de forventede kolonnene: { $head }

engine-e-interop-testbench-row-fields-expected = rad { $v1 }: { $f } felt, forventet { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = rad { $v1 }: kolonne { $motion_columns } er ikke et tall

engine-e-interop-testbench-line-no = linje { $v1 }: ingen `$`

engine-e-interop-testbench-line-no-checksum = linje { $v1 }: ingen sjekksum

engine-e-interop-testbench-line-bad-checksum-field = linje { $v1 }: ugyldig sjekksumfelt

engine-e-interop-testbench-line-checksum-mismatch = linje { $v1 }: sjekksummen stemmer ikke

engine-e-interop-testbench-line-short-gga = linje { $v1 }: for kort GGA

engine-interop-testbench-line-bad-latitude = linje { $v1 }: ugyldig breddegrad

engine-interop-testbench-line-bad-longitude = linje { $v1 }: ugyldig lengdegrad

engine-e-interop-testbench-line-bad-altitude = linje { $v1 }: ugyldig høyde

engine-e-interop-testbench-line-bad-separation = linje { $v1 }: ugyldig separasjon

engine-e-interop-testbench-line-short-rmc = linje { $v1 }: for kort RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = linje { $v1 }: RMC uten foregående GGA

engine-e-interop-testbench-line-gga-and-rmc-times = linje { $v1 }: GGA- og RMC-tidene er ulike

engine-e-interop-testbench-line-bad-speed = linje { $v1 }: ugyldig fart

engine-e-interop-testbench-line-bad-course = linje { $v1 }: ugyldig kurs

engine-e-interop-testbench-line-bad-time-or-date = linje { $v1 }: ugyldig tid eller dato

engine-e-interop-testbench-gga-with-no-following-rmc = en GGA uten påfølgende RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = en veipunktfil trenger minst to sampler

engine-e-interop-testbench-the-sample-step-is-not = samplesteget { $step } s er ikke et helt antall millisekunder

engine-e-interop-testbench-the-samples-are-not-equally = samplene er ikke jevnt fordelt: intervall { $v1 } er { $dt } s, det første er { $step } s

engine-e-interop-testbench-empty-waypoint-file = tom veipunktfil

engine-e-interop-testbench-waypoint-not-three-numbers = veipunkt { $v1 }: ikke tre tall

engine-e-interop-testbench-waypoint-fields-expected = veipunkt { $v1 }: { $f } felt, forventet 3

engine-e-interop-testbench-events-csv-header-is-not = overskriftsraden i hendelses-CSV er ikke label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = hendelsesrad { $v1 }: forventet 5 felt

engine-e-interop-testbench-event-row-unknown-kind = hendelsesrad { $v1 }: ukjent kind { $f }

engine-e-interop-testbench-event-row-bad-onset = hendelsesrad { $v1 }: ugyldig start

engine-e-interop-testbench-event-row-bad-end = hendelsesrad { $v1 }: ugyldig slutt

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-interop-testbench-no-waypoints-txt-written = ingen .waypoints.txt skrevet: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = ikke et UTC-tidspunkt `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = mangler { $what }

engine-e-ionex-bad-number-in = { $what }: ugyldig tall i { $col }

engine-e-ionex-two-digit-year = { $what }: tosifret år { $year }

engine-e-ionex-no-end-of-header = ingen END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = høydeavhengige (3D) IONEX-kart støttes ikke

engine-e-ionex-zero-grid-step = gittersteg på null

engine-e-ionex-grid-needs-at-least-nodes = gitteret trenger minst 2 x 2 noder

engine-e-ionex-map-no = kart { $index }: ingen { $end_label }

engine-e-ionex-map-band-latitude-header-grid = kart { $index }: bånd { $band } breddegrad { $band_lat }, headerens gitter { $want }

engine-e-ionex-map-band-longitudes-differ = kart { $index }: bånd { $band } har ulike lengdegrader

engine-e-ionex-map-band-truncated = kart { $index }: bånd { $band } er avkortet

engine-e-ionex-map-bands-header-grid-has = kart { $index }: { $band } bånd, headerens gitter har { $n_lat }

engine-e-ionex-map-no-epoch-of-current = kart { $index }: ingen EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } TEC-kart, header # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = TEC-kartenes epoker øker ikke

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz rommer ikke et helt antall sampler per { $code }-periode ({ $spc } sampler)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods og noncoherent må være positive

engine-e-iq-acq-stream-ended-after-of-samples = strømmen sluttet etter { $got } av { $needed } sampler

engine-e-iq-acq-cfar-reference-cells-must-be = CFAR-referanseceller må være et partall og minst 2 (fikk { $n })

engine-e-iq-acq-cfar-stride-must-be-at = CFAR-steget må være minst 1 lag

engine-e-iq-acq-cfar-per-cell-pfa-must = CFAR-Pfa per celle må ligge i (0, 1) (fikk { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = CFAR-vinduet når { $reach } lag til hver side, for bredt for en periode på { $samples_per_period } lag

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = ukjent flateformat { $s }: forventet csv, json eller bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = flaten ville inneholdt { $spc_cells } celler (grense { $MAX_SURFACE_CELLS }): øk Doppler-steget eller innsnevr Doppler-området

engine-e-iq-acq-surface-surface-header = flateheader: { $e }

engine-e-iq-acq-surface-surface-schema-expected = flateskjema { $schema }; forventet { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = flatekropp: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = opptak '{ $id }': format og sample_rate_hz må oppgis sammen

engine-e-iq-campaign-conditions-test-conditions-json = testbetingelser (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = testbetingelser (TOML): { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf trenger et SigMF-opptak (fikk { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF-metadata: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF-metadata: global core:sample_rate mangler

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start mangler

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: ingen core:sample_count og ingen effektpunkter som avslutter hendelsen

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema må være "{ $SCHEMA }" (fikk "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id må ikke være tom

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s må være endelig og >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 må være 64 heksadesimale sifre

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind må være "iq" eller "receiver-log" (fikk "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = minst én [[expected]]-gruppe kreves

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids må ikke være tom

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } har { $n } verdi; oppgi én per id ({ $ids })
       *[other] { $at }: { $key } har { $n } verdier; oppgi én per id ({ $ids })
    }


engine-e-iq-campaign-conditions-duplicate-id = { $at }: duplisert id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s må ligge etter onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects må være "all" eller en liste med id-er

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: affects-id { $bad } finnes ikke i [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q må være positiv

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points må ikke være tom

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points må være i tidsrekkefølge

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points må være endelige

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" trenger reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = hendelsene '{ $id }' og '{ $id2 }' overlapper på en felles satellitt

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s må være >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s må være positiv

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = opptak '{ $id }': SHA-256 { $sha } stemmer ikke med den oppgitte { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: opptaket har { $buf } sampler, { $n } trengs for å fange signalet

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s må være positiv

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db må være positiv

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s må være >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz må være positiv

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs må være minst 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = kampanje (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = kampanje (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions må liste minst én fil eller glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds må være >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = frontend-navn må være ikke-tomme og unike ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' treffer ingen fil

engine-e-iq-campaign-spec-recording-id-appears-in-both = opptaks-id '{ $w }' forekommer i både { $w2 } og { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names trenger inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: ingen utforming '{ $n }' i { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = referanselinje { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0-profil: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0-profil: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i }: stegverdiene må være endelige

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i }: en rampe trenger end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i }: punktene trenger like lange, ikke-tomme t_s og db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i }: t_s må øke strengt

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i }: punktene må være endelige

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i }: fade s4 må ligge i (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i }: fade tau_s må være positiv

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: opptaket har { $samples } sampler, { $need } trengs for dette søket

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: angi formatet med --surface-format csv|json|bin, eller la stien ende på .csv, .json eller .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = signalfangst: { $fs_hz } Hz, { $coherent_periods } koherent(e) periode(r) x { $noncoherent } ikke-koherent, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = rapport bygget på nytt: { $cells_present } av { $cells_total } celle(r), { $rows } rad(er), { $rows_failed } som ikke nådde en terskel; digest { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    kampanje { $name }: { $cells_total } celle(r); { $cells_skipped } allerede ferdig, { $cells_run } kjørt nå, { $cells_failed } mislyktes, { $cells_pending } venter
    utdata: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    første feil ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: { $events } hendelse(r), { $tc } forventet(e) satellitt(er); betingelses-hash { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono skrå { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono vertikal { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scint S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = flerveis { $h }m { $multipath_ground } grunn

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground må være dry, wet eller sea (fikk { $other })

engine-e-iq-cli-channel-give-at-most-one-of = oppgi høyst én av --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass vil ha lo,hi (fikk { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass trenger lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } med overgang { $transition } Hz passer ikke under fs/2 ({ $v1 } Hz); innsnevr båndet eller overgangen

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits må være 1..=16 (fikk { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = filtrerte { $total } sampler ({ $fs_hz } Hz) til { $out } ({ $format }); sidecar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = kan ikke lese { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = ugyldig labfit-scenario: { $e }

engine-iq-cli-labfit-fitted-run-wrote = tilpasset { $runs } kjøring(er); skrev { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = tilpasset { $fit_units } enhet(er) fra kampanje; skrev { $written }

engine-iq-cli-labfit-cannot-write = kan ikke skrive { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } trenger en verdi

engine-e-iq-cli-cannot-parse = { $k }: kan ikke tolke { $v }

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } tar { $n } posisjonsargument, fikk { $pos }
       *[other] iq { $cmd } tar { $n } posisjonsargumenter, fikk { $pos }
    }


engine-e-iq-cli-cannot-parse-2 = { $k }: kan ikke tolke { $p }

engine-iq-cli-unknown-iq-processing-command-expected = ukjent iq-behandlingskommando { $other }; forventet scene, acquire, track, sweep, labfit, frontend, monitor, campaign eller conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } er utenfor området for GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = fant ingen frisk GPS-efemeride for de forespurte PRN-ene

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos vil ha lat,lon,alt (fikk { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; C/N0-profil ({ $segments } segment(er))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format må være csv eller jsonl (fikk { $other })

engine-iq-cli-scene-written-by-kshana-iq-scene = skrevet av kshana iq scene: en SIMULERT scene, ikke et opptak

engine-iq-cli-scene-ion-sdr-metadata = ION SDR-metadata { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF-data { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = skrevet av kshana iq scene

engine-iq-cli-scene-wrote-samples-hz-to-truth = skrev { $samples } sampler ({ $format }, { $fs_hz } Hz) til { $data_path }; { $truth_records } referanseposter til { $truth_path }; { $meta_note }; kanal: { $chan_desc }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } kan ikke kombineres med --design: sweep kjører hver utforming i filen

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = sløyfeutformings-sweep: { $rows } (utforming, PRN)-resultat(er){ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: opptaket har { $samples } sampler, { $need } trengs for å fange signalet

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: ikke fanget (statistikk { $statistic } < terskel { $threshold }); øk --doppler-max, --acq-coherent eller --acq-noncoherent, eller kontroller opptaket

engine-iq-cli-track-designs-and-differ-in-integration = utformingene { $first } og { $d } er ulike i integration.extra_taps_chips; utformingene i én kjøring må være like slik at hver utdatapost får de samme kolonnene

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: angi formatet med --epochs-format csv|jsonl|bin, eller la stien ende på .csv, .jsonl eller .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz er { $r } sampler per chip på { $c }: kommensurabel sampling gjør kodediskriminatoren til en trapp (ved 2 sampler/chip dirrer DLL-en, omtrent { $lit_0_09 } chip RMS kodefeil ved 45 dB-Hz); kodesløyfens jitter og bias fra dette opptaket er ikke representative. Bruk en frekvens som ikke er et multiplum av halve chip-raten for å vurdere kodesløyfer.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = arbeideren avsluttet før den behandlet denne inndataen

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = ukjent valg { $s }

engine-e-iq-io-cli-format-needs-rate = --format trenger --rate

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } tar { $n } stiargument, fikk { $pos }
       *[other] iq { $cmd } tar { $n } stiargumenter, fikk { $pos }
    }


engine-iq-io-cli-unknown-iq-command = ukjent iq-kommando { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] skrev { $n } sample ({ $to }, { $fs_hz } Hz) til { $files }; { $w } mettet(e) element(er){ $v4 }
       *[other] skrev { $n } sampler ({ $to }, { $fs_hz } Hz) til { $files }; { $w } mettet(e) element(er){ $v4 }
    }


## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow leser bare enkeltkanals opptak

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow leser et opptak med én capture, dette har { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: ingen positiv core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: capturen starter ikke på en bytegrense

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = ukjent sampleformat { $name }: forventet f.eks. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, eventuelt avsluttet med _qi for komplekse

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sidecar sample_rate_hz { $sample_rate_hz } er ikke positiv

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: .sdrx-opptak har én strøm; kanal { $channel } finnes ikke

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: rå fil uten sidecar; oppgi formatet, eller skriv { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = kan ikke serialisere raden: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = ugyldig filterutforming { $design }: passband_frac i (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz må ligge strengt mellom 0 og halve samplingsfrekvensen ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx-data: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-bit { $enc } { $fmt } ({ $packed_bits } bits/sample)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = SigMF core:datatype { $datatype } støttes ikke: støttet er ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be og de reelle ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } er ikke en SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = ugyldig SigMF-metadata: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } har ingen SigMF core:datatype; skriv det som raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } stemmer ikke med det første opptakets { $c0 }

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: ingen core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } er ikke positiv

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } ved { $rate } Hz stemmer ikke med det første opptakets { $f0 } ved { $r0 } Hz

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name }: capture ved sample { $sample_start } er i feil rekkefølge eller ligger utenfor det eneste samplet i dataene ({ $n_file })
       *[other] { $name }: capture ved sample { $sample_start } er i feil rekkefølge eller ligger utenfor de { $n_file } samplene i dataene
    }


engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: den første capturen starter ikke på en bytegrense

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = kanal { $channel } forespurt; opptaket har { $channels } (kanaler telles fra 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = ugyldig SigMF-collection: { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } stemmer ikke med collectionens { $h }

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = strøm { $select } av { $channels } sammenflettede strømmer finnes ikke (strømmer telles fra 0)

engine-e-iq-io-stream-sample-of-does-not-start = sample { $k } av { $format } starter ikke på en bytegrense

engine-e-iq-io-stream-time-window-start-duration-both = tidsvindu start { $start_s } s, varighet { $duration_s } s: begge må være ikke-negative

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = mest skadelige oppgitte Q (cw): ingen tabellverdi for typen `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: kampanjen er ikke fullstendig

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } stemmer ikke med cellene ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = opptak `{ $id }`: hashen for testbetingelsene { $h } stemmer ikke med den registrerte { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signal `{ $signal }`: ukjent chip-rate

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = ingen kjøring er brukbar for låstilpasningen: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = utilstrekkelige data: ikke tilpasset ({ $m } opptak; minst { $min_rec } trengs)

engine-iq-labfit-iqfit-uncensored-span-db-is-under = ikke-sensurert J/S-spenn { $span_db } dB er under { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff og delta kan ikke identifiseres hver for seg (|corr| { $full } >= { $v2 }): modellen avhenger bare av delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] ikke tilpasset: { $n_reacq } gjenfangst observert (minst 3 trengs)
       *[other] ikke tilpasset: { $n_reacq } gjenfangster observert (minst 3 trengs)
    }


engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = ukjent mode `{ $m }` (bare `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage må være [lower, upper] innenfor [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds må være [lower, upper] med 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db må være [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = kampanjen har ingen hendelse med en oppgitt effektprofil å tilpasse

## src/iq/labfit/iqreport.rs

# legal: native review
engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Labtilpasning fra IQ-kampanje: { $r }

    Skjema `{ $schema }`, motor { $engine_version }. Etikett: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = Kampanje-DIGEST `{ $campaign_digest }`; `campaign.json` SHA-256 `{ $campaign_json_sha256 }`; scenario SHA-256 `{ $scenario_sha256 }`; { $cells } celler; { $bootstrap } bootstrap-replikater (seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Enhet { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Status: { $status }. { $recordings } opptak, { $satellites } satellitter, { $events } hendelser; { $bins_used } intervaller tilpasset, { $bins_censored } sensurert.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0-modell ({ $q_mode }): `delta_eff` = { $ci } dB (forskyvningen som kan identifiseres, referert til Q = 1); `Q_eff` = { $q }; `delta` ved dette Q = { $ci2 } dB; corr(Q, delta) { $om }; residual-RMS { $residual_rms_db } dB over et J/S-spenn på { $span_db } dB. Q_eff kan ikke identifiseres fra C/N0-data uten en uavhengig effektmåling.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q holdt på sin oppgitte verdi: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = Terskel-J/S, direkte: median { $om } dB over { $n } tap (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Tilbakeholdt (utelat ett opptak), interpolasjon: { $bins } intervaller, C/N0 RMS { $om } dB, PI90-dekning { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    { $n ->
        [one] { $model }: { $n } hendelse, tapstid-RMS { $om } s, PI90-dekning { $om2 }
       *[other] { $model }: { $n } hendelser, tapstid-RMS { $om } s, PI90-dekning { $om2 }
    }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    Valideringstabell SHA-256 `{ $table_sha256 }` (registrert { $registered }):

    | terskel | grense | verdi | utfall |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = kjøring `{ $label }` logg

engine-e-iq-labfit-run = kjøring `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = scenarioets [input] angir ingen kampanje

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign og [[runs]] utelukker hverandre: oppgi én

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit-scenario: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = loggen har ingen C/N0 per satellitt{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = ingen epoke før starten ved { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = ingen epoke ved eller etter starten ved { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Labtilpasning: { $r }

    Etikett: **{ $label }**. Innstillinger SHA-256 `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } C/N0-sample, residual-RMS { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } C/N0-sampler, residual-RMS { $om } dB.{ $r }{ "\u000A" }
    }


engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Modell: { $model } ({ $label })

    | parameter | verdi | grenser | ved grense | bootstrap-sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one]
            { "\u000A" }Hendelsestid-RMS { $om } s over { $n_events } hendelse; tap oversett { $loss_missed } / ekstra { $loss_extra }, gjenfangster oversett { $reacq_missed } / ekstra { $reacq_extra }.

            | kjøring | fall dB-Hz | gjenlåsing dB-Hz | hendelser | RMS s |
            |---|---|---|---|---|{ "\u000A" }
       *[other]
            { "\u000A" }Hendelsestid-RMS { $om } s over { $n_events } hendelser; tap oversett { $loss_missed } / ekstra { $loss_extra }, gjenfangster oversett { $reacq_missed } / ekstra { $reacq_extra }.

            | kjøring | fall dB-Hz | gjenlåsing dB-Hz | hendelser | RMS s |
            |---|---|---|---|---|{ "\u000A" }
    }


engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Tilbakeholdt ({ $scheme }, { $folds } folder): alle { $om } s, interpolasjon { $om2 } s, ekstrapolasjon { $om3 } s.

    | tilbakeholdt kjøring | klasse | avstand | nærmeste treningskjøring | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } er reservert for fremtidig bruk (bare FID 0 er definert)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } er utenfor 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } SB1-symbol(er) er uenige med det dekodede feltet

engine-iq-lunanet-afs-frames-at-and-are-symbols = rammene ved { $w } og { $w2 } er { $gap } symboler fra hverandre, ikke { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } følger etter TOI { $w2 }, forventet { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = uventet tegn { $c } i en symbolstrøm (bare 0, 1 og blanke)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: de første 24 chipene er ulike

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: de siste 24 chipene er ulike

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (dokumentet oppgir A14850 for både PRN 147 og PRN 151; generatoren gjengir PRN 151s, så oppføringen for PRN 147 er mest sannsynlig en trykkfeil i dokumentet)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = kodet 0x{ $word }, dekodet FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = monitorinnstillinger: { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = statisk posisjon er ikke endelig

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = bane med konstant hastighet er ikke endelig

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = veipunktbanen har ingen veipunkter

engine-e-iq-scene-geometry-waypoint-not-finite = veipunkt er ikke endelig

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = veipunkttidene må øke strengt

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } er ikke en GPS C/A-PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = efemeridesystemet { $system } er ikke GPS

engine-e-iq-scene-satellite = satellitt { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = er en pilotkomponent (uten data) og bærer ingen navigasjonsdata

engine-e-iq-scene-nav-carries-data-the-scene-does = bærer data scenen ikke modellerer; generer det uten data

engine-e-iq-scene-nav-does-not-carry-gps-lnav = bærer ikke GPS LNAV (bare GPS L1 C/A gjør det); bruk seedede data

engine-e-iq-scene-nav-not-an-lnav-source = ikke en LNAV-kilde

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = en scene trenger minst én satellitt (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler har { $dopplers } verdi(er); oppgi én per --prn ({ $ids }) eller én enkelt verdi

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = referanseraden har { $f } felt, forventet 10

engine-e-iq-scene-truth-truth-field = referansefelt { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = referanse sat_id: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz må være et positivt tall

engine-e-iq-short-duration-must-be-in = duration_s må ligge i (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids må inneholde 1 til { $MAX_SATELLITES } satellitter

engine-e-iq-short-dopplers-must-be-finite = dopplers må være endelige

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] { $n } sample forespurt; en kort kjøring rommer høyst { $MAX_SAMPLES }
       *[other] { $n } sampler forespurt; en kort kjøring rommer høyst { $MAX_SAMPLES }
    }


## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C data PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C pilot PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } er utenfor området

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF-frekvenskanal { $id } er utenfor -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = ukjent signal { $other }; forventet ett av: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = linje { $v1 }: ingen ';'

engine-e-iq-signals-galileo-line-no-code-number-in = linje { $v1 }: ingen kodenummer i { $label }

engine-e-iq-signals-galileo-code-appears-twice = kode { $number } forekommer to ganger

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path }: { $n } kode, ICD-en definerer { $CODES_PER_COMPONENT }
       *[other] { $path }: { $n } koder, ICD-en definerer { $CODES_PER_COMPONENT }
    }


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

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primær { $primary_prn } S{ $secondary } tertiær { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primær { $primary_prn } S{ $secondary } (tertiær utelatt)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = ikke-hex-tegn { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } hex-symboler kan ikke rumme nøyaktig { $len } chips

engine-iq-signals-primary-only = { $name } (kun primær)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC-sporing trenger en tidlig-sen-avstand i (0, { $max }) chips slik at E og L holder seg på hovedtoppen (fikk { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = bump-jump-terskelen må være minst 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = samplingsfrekvensen må være positiv

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods må være positiv

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows må være positiv

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } må dele bitlengden { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = høyst { $MAX_EXTRA_TAPS } ekstra tapper støttes (fikk { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = forskyvninger for ekstra tapper må være endelige og innenfor ±{ $MAX_TAP_OFFSET_CHIPS } chips (fikk { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = et C/N0-vindu trenger minst 2 prompts

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: forventet atan2, costas-atan eller costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: forventet cross-product, atan2 eller atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: forventet pull-in eller always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: forventet eml-power, dot-product eller eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: forventet pll, fll eller fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } gjelder ikke for carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: forventet et tall >= 0 (0 slår av begrensningen)

engine-e-iq-track-design-must-be-positive-number-got = { $k } må være et positivt tall (fikk { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods må være minst 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips må ligge i (0, 2] (fikk { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips rommer høyst { $MAX_EXTRA_TAPS } forskyvninger (fikk { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = integration.extra_taps_chips-forskyvninger må være endelige og innenfor ±{ $MAX_TAP_OFFSET_CHIPS } chips (fikk { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) må ligge under carrier.fll_off_pli ({ $off }), begge i (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s må være null eller positiv (fikk { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s må være positiv (fikk { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order må være 1, 2 eller 3 (fikk { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order må være 1 eller 2 (fikk { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order må være 1 eller 2 (fikk { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold må ligge i [-1, 1] (fikk { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows må være minst 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods må være minst 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) må ikke ligge under lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db må være endelig

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes må være minst 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods må være minst 1 (eller "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent må være minst 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa må ligge i (0, 1) (fikk { $pfa })

engine-e-iq-track-design-design-overrides = overstyringer av utformingen: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = overstyringer av utformingen kan ikke sette name eller extends

engine-e-iq-track-design-loop-design-file = loop-design-fil: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = loop-design-fil: skjemaet { $other } støttes ikke; forventet { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = loop-design-fil: mangler schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = loop-design-fil: ingen [[design]]-tabeller

engine-e-iq-track-design-loop-design-file-design-number = loop-design-fil: [[design]] nummer { $v1 } har ikke noe name

engine-e-iq-track-design-loop-design-file-design-name = loop-design-fil: utformingsnavnet { $name } er reservert eller tomt

engine-e-iq-track-design-loop-design-file-design-is = loop-design-fil: utformingen { $name } er definert to ganger

engine-e-iq-track-design-no-design-named-the-file = ingen utforming med navnet { $n }; filen inneholder { $value }

engine-e-iq-track-design-loop-design-file-design-extends = loop-design-fil: utformingen { $name } utvider seg selv (en syklus)

engine-e-iq-track-design-loop-design-file-design-extends-2 = loop-design-fil: utformingen { $name } utvider den ukjente utformingen { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = en fasesløyfe trenger orden 1..=3 og Bn > 0 (fikk { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = en frekvenssløyfe trenger Bn > 0 (fikk { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = ordenen til en frekvenssløyfe må være 1 eller 2 (fikk { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = et sløyfefilter trenger en fasebane, en frekvensbane eller begge

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = tidlig-sen-avstanden må ligge i (0, 2] chips (fikk { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = DLL-ordenen må være 1 eller 2 (fikk { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = chip-raten og bærefrekvensen må være positive

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = en epoke har { $extra } ekstra tapper, men utdataene ble satt opp for { $n }: alle kanaler i en kjøring må bruke samme extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = en post er { $b } bytes; forventet { $want }

engine-e-iq-track-sink-unknown-lock-state-code = ukjent låsetilstandskode { $b }

engine-e-iq-track-sink-epoch-file-header = header i epokefilen: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = skjema i epokefilen { $schema }; forventet { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = postene i epokefilen er { $record_bytes } bytes; denne leseren forventer { $want } ({ $BINARY_RECORD_BYTES } pluss { $BINARY_TAP_BYTES } per ekstra tapp)

engine-e-iq-track-sink-epoch-file-ends-inside-record = epokefilen slutter midt i en post ({ $got } av { $size } bytes)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = epokeformat { $o }: forventet csv, jsonl eller bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` er ikke et tall

engine-e-jammertest-cli-is-not-utf-text = { $path } er ikke UTF-8-tekst

engine-e-jammertest-cli-needs-catalog = trenger --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = trenger minst én --plan

engine-e-jammertest-cli-is-not-utf = { $cat } er ikke UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } er ikke UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` er ikke en av ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` er ikke UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = trenger --log-start eller --log med --format

engine-e-jammertest-cli-log-needs-format = --log trenger --format

engine-e-jammertest-cli-the-log-does-not-state = loggen oppgir ikke starttidspunktet sitt: bruk --log-start

engine-e-jammertest-cli-the-log-states-its-start = loggen oppgir starten sin som `{ $label }`: bruk --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } er ikke UTF-8

engine-e-jammertest-cli-cannot-write = kan ikke skrive { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } { $SCHEDULED_TRUTH }-hendelser skrevet til { $o } ({ $skipped_non_rf } ikke-RF-perioder hoppet over, { $outside_log } utenfor loggen, { $unknown_ids } id-er som ikke finnes i katalogen)

engine-jammertest-cli-note-ids-not-in-the = merk: id-er som ikke finnes i katalogen: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = merk: dette er planens planlagte perioder, ikke registrerte sendetider.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  testnavn

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } tester, { $evaluable } kan vurderes: { $detected } oppdaget innenfor toleransen, { $late } sene, { $missed } oversett; median ventetid { $fmt_opt }, median tid til gjenoppretting { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = falske alarmer utenfor alle perioder: { $false_alarm_runs } kjøringer, { $false_alarm_epochs } av { $clean_epochs } rene epoker

engine-e-jammertest-cli-needs-session-path = trenger en sesjonssti

engine-e-jammertest-cli-needs-catalog-and-plan-or = trenger --catalog og --plan, eller --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = bevispakke skrevet til { $out }; fingeravtrykk for signereren { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = ingen mappe med en scenario.json og en .ubx under { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = scenario: { $e }

engine-e-jammertest-dataset-read = lesing: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json har ingen dato

engine-e-jammertest-dataset-scenario-json-date-is-not = scenario.json-datoen `{ $date }` er ikke en dato

engine-e-jammertest-dataset-no-readable-epoch-in-mon = ingen lesbar epoke i mon_rf.csv eller rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = ingen mappe med en scenario.json under { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } gjenopprettet ({ $recovered } av { $alarmed }), median { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = loggen oppgir starten sin som `{ $l }`, som ikke er UTC ISO-8601: oppgi starten eksplisitt

engine-e-jammertest-the-log-does-not-state = loggen oppgir ikke starttidspunktet sitt: oppgi det eksplisitt

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = katalogen er ikke JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = katalogen har ingen `test_types`-liste

engine-e-jammertest-plan-test-type-has-no-type = en testtype har ingen `type_id`

engine-e-jammertest-plan-test-group-has-no-group = en testgruppe har ingen `group_id`

engine-e-jammertest-plan-test-has-no-test-id = en test har ingen `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = katalogen oppfører ingen tester

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` er ikke et plantidspunkt som 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = planen er ikke JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = planen har ingen `locations`-liste

engine-e-jammertest-plan-test-end-time-is-not = test { $id }: end_time er ikke etter start_time

engine-e-jammertest-plan-the-plan-has-no-test = planen har ikke noe testområde { $l }; den har { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = planen har flere testområder { $areas }; oppgi hvilket loggen ble registrert i

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json er ikke JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = ingen `attack_log`-liste

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024 test { $id } vindu { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log inneholder ikke noe start/slutt-vindu

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } planlagte hendelser, men kjøringen scoret { $events2 }: oppgi kjøringens egne hendelser

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s må være positiv og guard_s ikke negativ

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m må oppgi minst ett element

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m må være endelig

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: forventet "null-steering" eller "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz må være positiv (fikk { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: seksjonen trenger en [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) må være endelig og på eller over tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s må være endelig og ikke-negativ (fikk { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits må være 1 til 16 (fikk { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz må være positiv (fikk { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side må være minst 2 (fikk { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } må være endelig (fikk { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } må være positiv (fikk { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: profilpunkt { $points } ({ $lat }, { $lon }) ligger utenfor DEM-flisen

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: profilpunkt { $points } ({ $lat }, { $lon }) ligger på et DEM-hull

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC-kalenderdato utenfor gyldig område: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = ingen slik kalenderdato: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC-sekund { $second } utenfor gyldig område ved { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = en oppskytingsplass ved polen har ingen definert asimut

engine-e-launch-inclination-unreachable-from-latitude-without = inklinasjon { $inclination_rad }° kan ikke nås fra breddegrad { $lat_rad }° uten dogleg (trenger |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = farten til en plass ved den sanne polen trenger både `epoch` og `eop_finals2000a` (en ekte IERS finals2000A-kropp)

engine-e-launch-site-lon-deg-must-be = site_lon_deg må ligge i [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a inneholdt ingen lesbare IERS finals2000A-rader

engine-e-launch-epoch-mjd-is-outside-the = epoke { $epoch } (MJD { $mjd_utc }) ligger utenfor de oppgitte EOP-radene (MJD { $mjd } til { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg må ligge i [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg må ligge i [0, 180]

engine-launch-launch-window-lat-az-asc = launch-window: bredde { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° stigende, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s bonus fra jordrotasjonen, { $opportunities } muligheter/døgn (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = hver avstandsrate trenger en positiv, endelig sigma

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one]
            { $n ->
                [one] { $n_meas } måling kan ikke løse { $n } Doppler-ukjent
               *[other] { $n_meas } måling kan ikke løse { $n } Doppler-ukjente
            }
       *[other]
            { $n ->
                [one] { $n_meas } målinger kan ikke løse { $n } Doppler-ukjent
               *[other] { $n_meas } målinger kan ikke løse { $n } Doppler-ukjente
            }
    }


engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = Doppler-geometrien er singulær

engine-e-leo-fusion-doppler-no-covariance = ingen kovarians

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = hver pseudoavstand trenger en positiv, endelig sigma

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    { $n ->
        [one]
            { $n_clock ->
                [one] { $obs } pseudoavstander kan ikke løse { $n } ukjent (3 posisjon + { $n_clock } klokke)
               *[other] { $obs } pseudoavstander kan ikke løse { $n } ukjent (3 posisjon + { $n_clock } klokker)
            }
       *[other]
            { $n_clock ->
                [one] { $obs } pseudoavstander kan ikke løse { $n } ukjente (3 posisjon + { $n_clock } klokke)
               *[other] { $obs } pseudoavstander kan ikke løse { $n } ukjente (3 posisjon + { $n_clock } klokker)
            }
    }


engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = en satellitt faller sammen med posisjonsestimatet

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = geometrien er singulær

engine-e-leo-fusion-joint-pvt-no-iteration-ran = ingen iterasjon ble kjørt

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = degenerert sluttgeometri

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP er ikke endelig

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } må være positiv

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m må være ikke-negativ og kjøringen høyst 5000 epoker

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = hvert signal trenger en positiv båndbredde

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] 5G NTN-posisjonsbestemmelse ved { $r } MHz, C/N0 { $r2 } til { $r3 } dB-Hz, { $n_satellites } satellitt ({ $mean_in_view } i sikte){ "\u000A" }
       *[other] 5G NTN-posisjonsbestemmelse ved { $r } MHz, C/N0 { $r2 } til { $r3 } dB-Hz, { $n_satellites } satellitter ({ $mean_in_view } i sikte){ "\u000A" }
    }


engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, CRB-avstand { $range_sigma_zenith_m } til { $range_sigma_mask_m } m; median formell 3D { $s2 } m, RMS-feil { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }Doppler-passering med én satellitt: { $n_obs } sample over { $duration_s } s, horisontal feil { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }Doppler-passering med én satellitt: { $n_obs } sampler over { $duration_s } s, horisontal feil { $horizontal_error_m } m{ "\u000A" }
    }


engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP trenger minst ett system

engine-e-leo-fusion-ppp-duration-and-step-must-be = varighet og steg må være positive med høyst 20000 epoker

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs må være 1 til 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = konvergensterskler må være positive

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] PPP-konvergens til { $criterion_horizontal_m } m horisontalt / { $criterion_vertical_m } m vertikalt, { $runs_per_case } kjøringer per tilfelle, { $n_gnss } GNSS-satellitt{ "\u000A" }
       *[other] PPP-konvergens til { $criterion_horizontal_m } m horisontalt / { $criterion_vertical_m } m vertikalt, { $runs_per_case } kjøringer per tilfelle, { $n_gnss } GNSS-satellitter{ "\u000A" }
    }


engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  median { $c } min  konvergert { $v4 }%  NEES middelverdi { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = median horisontal feil over { $runs_per_case } kjøringer · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = forhåndsinnstillingen { $id } har ikke noe signal

engine-e-leo-fusion-presets-preset-has-no-signal-it = forhåndsinnstillingen { $id } har ikke noe signal { $n }; den har { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = ukjent LEO-forhåndsinnstilling { $id }; kjente: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s og step_s må være positive med høyst 20000 epoker

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = polarstegene må være positive

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode må være doppler, joint, polar eller timing; fikk { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = doppler-modus trenger minst ett LEO-system

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = timing-modus trenger et LEO-system med kodeavstandsmåling

engine-e-leo-fusion-pvt-kind-unknown-clock-class = ukjent klokkeklasse { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) ved { $user_lat_deg }, { $user_lon_deg } over { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } sats på { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one]
            { $n_sats ->
                [one] { "  " }Doppler-posisjonsbestemmelse: { $n_obs } måling fra { $n_sats } satellitt, 3D-feil { $error_3d_m } m (horisontalt { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }Doppler-posisjonsbestemmelse: { $n_obs } måling fra { $n_sats } satellitter, 3D-feil { $error_3d_m } m (horisontalt { $horizontal_error_m } m){ "\u000A" }
            }
       *[other]
            { $n_sats ->
                [one] { "  " }Doppler-posisjonsbestemmelse: { $n_obs } målinger fra { $n_sats } satellitt, 3D-feil { $error_3d_m } m (horisontalt { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }Doppler-posisjonsbestemmelse: { $n_obs } målinger fra { $n_sats } satellitter, 3D-feil { $error_3d_m } m (horisontalt { $horizontal_error_m } m){ "\u000A" }
            }
    }


engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }vindu { $window_s } s: { $n_sats } sats, 3D-feil { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } passering rett over: maks Doppler { $max_doppler_hz } Hz, rate { $max_doppler_rate_hz_s } Hz/s, rykk { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }LEO-avstandssatellitt i sikte i { $v1 }% av epokene{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } tilgjengelighet { $availability }, median PDOP { $f }, RMS 3D-feil { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }bredde { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } fusjonert { $f3 }; i sikte { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, maks { $row3 } ns (i sikte { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — { $mode }-modus

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = system { $name }: role må være gnss eller leo, fikk { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = system { $name }: clock må være estimated eller known, fikk { $c }

engine-e-leo-fusion-system-system-must-be-positive = system { $name }: { $what } må være positiv

engine-e-leo-fusion-system-system-mask-deg-must-be = system { $name }: mask_deg må ligge i [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = system { $name }: sigma_pr_m må være positiv

engine-e-leo-fusion-system-give-at-least-one-system = oppgi minst ett [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = epokeavstanden må være positiv

engine-e-leo-fusion-timing-no-epochs = ingen epoker

engine-e-leo-fusion-timing-no-satellite-was-ever-in = ingen satellitt var noen gang i sikte: mottakeren fikk aldri tid

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polarisasjonen må være rhcp, lhcp eller linear; fikk '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4-feilkode { $code } ved t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = en bane med inklinasjon { $inc } deg passerer aldri over breddegrad { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = den forespurte maksimale elevasjonen ligger under horisontrekkevidden

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = bygningsklassen må være traditional eller thermally-efficient; fikk '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = feltet { $name } er ikke endelig

engine-e-leo-navmsg-codec-field-is-outside-its-bit = feltet { $name } = { $value } { $unit } ligger utenfor sitt { $bits }-bits område (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = meldingen er avkortet

engine-e-leo-navmsg-codec-field-list-exhausted = feltlisten er oppbrukt

engine-e-leo-navmsg-codec-field-order-mismatch-vs = feltrekkefølgen stemmer ikke: { $name } mot { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID må være 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = hvert korreksjonspolynom trenger 1-8 koeffisienter

engine-e-leo-navmsg-codec-correction-time-scale-must-be = korreksjonens tidsskala må være en potens av to fra 1 s til 32768 s; fikk { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = ECEF-polynomet trenger 1-11 koeffisienter, like mange per akse

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = ECEF-polynomets grad { $v1 } overstiger 10

engine-e-leo-navmsg-codec-unknown-model-id = ukjent modell-id { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = nyttelasten overstiger 4095 bytes

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = rammen er kortere enn header og CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = ugyldig preamble 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = versjon { $version } støttes ikke

engine-e-leo-navmsg-codec-frame-length-does-not-match = ramelengden { $frame } stemmer ikke med den oppgitte nyttelasten på { $len } bytes

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q stemmer ikke: beregnet 0x{ $crc }, rammen har 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees må hver være høyst 7; fikk { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree må være 1-10; fikk { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = ukjent efemeridemodell '{ $other }': bruk kepler16, kepler-rac, liu22 eller ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = tilpasningsintervallet må være minst 10 s; fikk { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = tilpasningsvinduet [{ $t0 }, { $v1 }] s ligger utenfor referansebuen [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = ECEF-polynomtilpasningen er singulær (for få sampler for graden)

engine-e-leo-navmsg-fit-clock-fit-is-singular = klokketilpasningen er singulær

engine-e-leo-navmsg-fit-keplerian-fit-diverged = Kepler-tilpasningen divergerte

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = ukjent forhåndsinnstilling '{ $k }'; tilgjengelige: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s må være 10-3600 s og update_period_s i (0, fit_interval_s]; fikk { $fit_interval_s } og { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s og eval_step_s må være { $lit_0_5 }-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz må overstige 10 MHz; fikk { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid må være 1-255

engine-e-leo-navmsg-band-must-be-15-and = band må være 0-15 og health 0-3

engine-e-leo-navmsg-unknown-csv-schema = ukjent csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis må nevne minst én analyse

engine-e-leo-navmsg-unknown-analysis-use = ukjent analyse '{ $a }'; bruk { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind må være leo-navmsg; fikk { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg må ligge i [0, 60); fikk { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO-navigasjonsmelding — { $res } km, { $res2 } deg, gravitasjonsgrad { $gravity_degree }, modell { $res3 }
    { "  " }SISRE-vekter: w_R { $w_r }, w_AC^2 1/{ $v6 } (maske { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s må være 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s må være ikke-tom, hver 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }avveining av tilpasningsintervall over { $span } s (bruksperiode = tilpasningsintervall):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE bane-RMS { $sisre_orb_rms_m } m  maks { $sisre_orb_max_m } m  med klokke-RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s må være ikke-tom, hver 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s må være 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } parametere  SISRE bane-RMS { $sisre_orb_rms_m } m  med klokke { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = ingen passering over { $mask } deg for brukeren ved { $lat }, { $lon } innen { $search } s; utvid midpass.search_s eller flytt brukeren

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }oppdatering midt i passeringen: passering { $p0 }-{ $p1 } s (maks elevasjon { $pmax } deg), { $switches } bytter, største sprang i brukeravstand { $max_jump } m (verste tilfelle av geometri { $max_worst } m) mot terskel { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }koding-dekoding: { $m }-modell, ramme { $frame } bytes ({ $payload_bits } nyttelastbiter, { $eph_bits } efemeride+klokke-biter), CRC-24Q 0x{ $hex }
    { "    " }kvantisering: største posisjonsendring { $v6 } mm, klokke { $v7 } mm; SISRE eksakt { $acc_exact } m, kvantisert { $acc_q } m
    { "    " }ødelagt ramme avvist: { $corrupted_rejected }; RINEX-rundtur { $rin_dp } m; CSV-rundtur { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs må være 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  publisert { $published } m  forhold { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = Kepler-settet med 16 parametere forverres fra { $a } m ved { $lo } s til { $b } m ved { $hi } s: ett Kepler-sett med harmoniske to ganger per omløp kan ikke følge gravitasjonstermene med høyere frekvens og luftmotstanden på en LEO-bue i mer enn noen få minutter, og dets minste kvadraters residual svinger over vinduet. Langs-/tvers-/radial-polynomene, med høyere grad enn Kepler-settet spenner over, tar opp det som er igjen og gir { $c } m ved { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = Kepler-settet med 16 parametere går fra { $a } m ved { $lo } s til { $b } m ved { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, gravitasjonsgrad { $gravity_degree } · representasjonsfeil mot referansen · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` er vertsbibliotekets

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: `rand_distr`-samplere kaller vertens `exp` og `ln` i sine sjeldne grener; bruk `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` er vertsbibliotekets gravitasjonsfelt; bruk `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` er ikke gjennomgått

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = ingen END OF HEADER-linje

engine-e-leo-navmsg-text-expected-eph-record-header-got = forventet en '> EPH'-post-header, fikk { $head }

engine-e-leo-navmsg-text-bad-satellite-id = ugyldig satellitt-id { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = mangler epokelinje

engine-e-leo-navmsg-text-bad-epoch-line = ugyldig epokelinje { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = ugyldig epokefelt i { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = epokelinjen trenger tre klokkeledd: { $ep }

engine-e-leo-navmsg-text-record-truncated = posten er avkortet

engine-e-leo-navmsg-text-unknown-record-type = ukjent posttype { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = CSV-tabellen inneholder kepler16- og kepler-rac-meldinger; fikk { $m }

engine-e-leo-navmsg-text-empty-csv = tom CSV

engine-e-leo-navmsg-text-row-has-cells-header = raden har { $cells } celler, headeren { $header }

engine-e-leo-navmsg-text-bad-number-in-column = ugyldig tall { $c } i kolonne { $k }

engine-e-leo-navmsg-text-csv-row-lacks = CSV-raden mangler { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = banehøyden må ligge mellom 100 km og 3000 km; fikk { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = eksentrisiteten må ligge i [0, { $lit_0_1 }) for en LEO-tilpasning; fikk { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = integrasjonssteget må ligge i (0, 30] s; fikk { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = varigheten må være positiv med høyst 200000 steg; fikk { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree må være 0, 2-6 (zonal) eller 7-{ $v1 } (EGM2008); fikk { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = propageringen av referansen divergerte

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = referansebanen avtok til under 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = nodeavstanden må ligge i (0, 60] s; fikk { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = en tabulert referansebane trenger minst to tilstander; fikk { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = tilstand { $k } er ikke endelig

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = klokkens adev_1s må ligge i [0, 1e-6); fikk { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = en målt klokke bygges med TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = en styrt klokke trenger sigma_s i [0, 1e-3) og tau_s > 0; fikk { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = en målt klokke trenger et positivt steg og minst to sampler

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = en måleverdi for en målt klokke er ikke endelig

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epoken '{ $s }' er ikke YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epoken '{ $s }' er ikke YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epoken '{ $s }' har et ugyldig sekundfelt

engine-e-leo-pass-epoch-is-out-of-range = epoken '{ $s }' er utenfor gyldig område

engine-e-leo-pass-band-unknown-signal-design-public = bånd '{ $name }': ukjent signalutforming '{ $n }'; offentlige utforminger: { $v2 }

engine-e-leo-pass-band-is-not-in-the = båndet '{ $name }' finnes ikke i systemets forhåndsinnstilling: oppgi frequency_mhz og eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = båndet '{ $name }' trenger eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern må være isoflux, gaussian eller flat; fikk '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = frekvensen til båndet '{ $name }' er utenfor gyldig område

engine-leo-pass-overridden-in-the-scenario = { $source } (overstyrt i scenarioet)

engine-e-leo-pass-system-has-no-band = systemet '{ $id }' har ikke noe bånd '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = en LEO-satellitt trenger minst ett bånd

engine-e-leo-pass-at-most-12-bands-per = høyst 12 bånd per satellitt

engine-leo-pass-unknown-system-presets-in-this = ukjent system '{ $n }'; forhåndsinnstillinger i dette bygget: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = ingen solsynkron bane ved { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (høyst 86400) og step_s må være positive med høyst 20000 epoker; fikk { $duration } og { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO-satellitt, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = scenarioets `epoch` { $epoch }, lest som UTC

engine-leo-pass-the-kind-default-epoch-utc = kindens standardepoke { $epoch } UTC (scenarioet oppgir ingen)

engine-e-leo-pass-user-environment-must-be-ground = user.environment må være ground, maritime, air eller indoor; fikk '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg må ligge innenfor +/-90

engine-e-leo-pass-user-speed-must-be-to = brukerens fart må være 0 til 3000 m/s og høyden -500 til 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna må være patch, hemispherical eller isotropic; fikk '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability må ligge i (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model må være klobuchar, vtec eller none; fikk '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction må være ascending eller descending; fikk '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satellitt { $id }: ugyldig eksentrisitet eller perigeum

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satellitt { $id }: tle trenger tle_line1 og tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit må være pass, elements eller tle; fikk '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation trenger et system eller en utforming

engine-e-leo-pass-no-sun-synchronous-inclination = ingen solsynkron inklinasjon

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: høyst 5000 satellitter

engine-e-leo-pass-no-leo-satellite-rises-above = ingen LEO-satellitt stiger over masken i vinduet

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s må ligge i (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' er ikke et bånd på noen LEO-satellitt ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = ingen GNSS-signal '{ $bname }' for konstellasjonen '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = tom GNSS-konstellasjon

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' er ikke to ulike bånd i { $id }

engine-e-leo-pass-iot-powers-and-battery-must = IoT-effekter og batteri må være positive

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from må være median eller peak; fikk '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = deteksjonsterskel { $detection_snr_db } dB etter integrasjon

engine-leo-pass-coherent-integration-at-most-ms = koherent integrasjon høyst { $rx } ms, begrenset av Doppler-raten

engine-leo-pass-serial-search-with-correlators = serielt søk med { $correlators } korrelatorer

engine-leo-pass-hot-start-doppler-known-to = hot start: Doppler kjent til +/-{ $aided } Hz, efemeride gyldig

engine-leo-pass-leo-pass-link-budget-user = LEO-passeringens linkbudsjett, { $environment }-bruker ved { $lat_deg }, { $lon_deg }; { $satellites } LEO-satellitt(er), { $duration_s } s vindu{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, maks elevasjon { $max_elevation_deg } deg ved { $tca_s } s, { $duration_above_mask_s } s over masken{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 topp { $opt } median { $opt2 }; |Doppler| maks { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: { $satellites_in_view } i sikte, C/N0 { $opt } til { $opt2 } (median { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } topp { $leo_peak_cn0_dbhz } dB-Hz er { $leo_peak_above_gnss_median_db } dB over GNSS-medianen; over den sterkeste GNSS-bæreren i { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: kald TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), hot { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer fra { $onset_s } s (sprang { $offset_m } m, push { $push_rate_m_s } m/s): Doppler-test GNSS { $t }, LEO { $t2 }, fusjonert { $t3 }; tvers over bånd { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = { $environment }-bruker · LEO topp { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB over GNSS-medianen · MODELLED

engine-leo-pass-user-modelled = { $environment }-bruker · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler for hver LEO-satellitts første bånd (±{ $v1 } kHz full skala)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = ugyldig [{ $what }]-tabell: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' finnes verken i [signal] eller blant de offentlige utformingene ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' har ingen kodesporet komponent, så den gir ingen pseudoavstand

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind må være leo-pnt-chain; fikk { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = den sporede komponenten har ingen chip-rate

engine-e-leo-pnt-chain-no-band-of-pass-names = ingen band i [pass] nevner signal = "{ $name }"; kjeden trenger ett som bærer utformingen

engine-e-leo-pnt-chain-the-pass-gives-no-code = passeringen gir ingen kodejitter

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m må ligge i [0, 100] m; fikk { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] må kjøre mode = "joint"; fikk { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = sporet C/N0 ved masken på { $mask } deg (linjetilpasning i sin elevasjon)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] har ikke noe LEO-system som kan motta kjedens verdier

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] ga ingen joint-blokk

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT-kjede: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signal { $name2 } ({ $design }), sporet { $design2 } ved { $v4 } Mchip/s, C/N0-forskyvning { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }passering { $id } { $sat } km: sporet C/N0 topp { $peak_tracked_cn0_dbhz } dB-Hz, kodejitter median { $jitter_median } m; C/N0-linje { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }melding { $res } { $fit_interval_s } s tilpasning / { $update_period_s } s oppdatering: representasjons-SISRE { $stats } mm RMS (bane { $stats2 } mm), med { $od } m banebestemmelse: { $sisre } m videreført{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }fusjonert posisjonsbestemmelse: kun GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP-konvergens: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } verdier videreført mellom trinnene. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Kodesporingsjitter, avstandsfeilen (m, 0 til { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · kun GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulasjon { $label }: bredden må være positiv

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = ukjent signalforhåndsinnstilling { $name }: biblioteket har { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = forhåndsinnstilling { $name }: ugyldig forhåndsinnstillingsfil: { $e }

engine-e-leo-signal-preset-file-names-itself = forhåndsinnstillingsfilen { $name } kaller seg selv { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz må være positiv

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz må være positiv

engine-e-leo-signal-signal-needs-at-least-one = { $name }: et signal trenger minst én komponent

engine-e-leo-signal-component-power-fraction-must-be = { $name }: komponent { $v1 } power_fraction må være positiv

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: komponent { $v1 } har fdma_shares, men ingen fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: komponent { $v1 } fdma_shares må være positive og summere til én

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: komponent { $v1 } trenger én fdma_share per forskyvning

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps må være positiv

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips må være positiv

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: komponentenes effektandeler summerer til { $total }, ikke 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km må være positiv

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: en flat (OFDM-lignende) komponent kan ikke plasseres i spektrummodellen

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: den sporede komponenten ligger på FDMA-underbærere; spektrummodellen sporer en komponent i bandets senter

engine-e-leo-signal-signal-is-given-twice = signal { $w } er oppgitt to ganger

engine-e-leo-signal-signals-is-more-than-the = { $out } signaler er mer enn de 24 som er tillatt

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s må være under 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: oppgi 1 til 40 cn0_dbhz-verdier

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 og slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points må være mellom 21 og 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: bruk "coherent" eller "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = systemets støytemperatur må være positiv

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: ukjent GNSS-signal { $n } (kjente: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } er ikke et signal i scenarioet

engine-e-leo-signal-shape-check-signal-is-not = formkontroll: signal { $signal } finnes ikke i scenarioet

engine-leo-signal-scenario-leo-signal-signals-noise = scenario leo-signal | { $runs } signaler | støygulv { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = venstre: båndbegrenset PSD for hver utforming (dB under topp, over sendebåndet); høyre: kodejitter mot total C/N0 ved { $reference_spacing_chips } chips avstand

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = ukjent bånd '{ $other }' (forventet s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km må være endelig og positiv

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps må være endelig og positiv

engine-e-linkbudget-other-losses-db-must-be = other_losses_db må være endelig og >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k må være endelig og positiv når den oppgis

engine-linkbudget-link-budget-band-km-bit = link-budget: { $value }-bånd, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, margin { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = kan ikke lytte på { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: lytter på tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp-klient koblet til

engine-live-io-kshana-live-warning-is-not = kshana live: advarsel: { $addr } er ikke en loopback-adresse; alt som kan nå den, kan lese strømmen

engine-e-live-io-cannot-open = kan ikke åpne { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: forkastet en tcp-klient som ikke holdt følge

engine-e-live-io-cannot-open-2 = kan ikke åpne { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: advarsel: { $addr } er ikke en loopback-adresse; alt som kan nå den, kan sende en strøm til dette laget

engine-e-live-io-cannot-bind-udp = kan ikke binde udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: lytter på udp { $addr }

engine-e-live-io-cannot-connect-to = kan ikke koble til { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: koblet til tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: leser seriell { $path } ved { $baud } baud (kun lesing)

engine-live-io-the-was-closed-by-the = { $v1 } ble lukket av motparten (laget kobler ikke til på nytt: kjør det under en supervisor som starter det på nytt)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: bruk 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 eller 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } er ikke en seriell enhet (tcgetattr mislyktes)

engine-e-live-io-cannot-set-baud = kan ikke sette { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = kan ikke sette linjemodus for { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial støttes bare på Unix; bruk --file, --tcp eller --stdin

engine-live-io-unknown-option = ukjent valg { $s }

engine-live-io-cannot-read = kan ikke lese { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: fartøysplattform, kalibrerer i { $calibration_s } s; terskel { $v2 }. Veiledende programvare, ikke typegodkjent navigasjonsutstyr: operatøren er fortsatt ansvarlig.

engine-live-io-write-failed = skriving mislyktes: { $e }

engine-live-io-kshana-live-dropped-udp-datagram = kshana live: forkastet { $n } udp-datagram som motoren ikke kunne ta imot ({ $udp_dropped } totalt)

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } er utenfor 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = innsettingsindeks { $p } utenfor 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = Annex 3-filene inneholder { $gold } og { $ter } koder, 210 forventet

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } er ikke en Gold-kode av g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = sekundærkode S{ $id } finnes ikke (S0 til S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 tildeler koder bare til nodeidentifikatorene 1 til 12, ikke { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } passer ikke i to bit (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } utenfor 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = { $SB1_SYMBOLS } delramme-1-symboler forventet

engine-e-lunar-afs-frame-subframe-data-lengths-expected = lengder på delrammedata { $sb2 }/{ $sb3 }/{ $sb4 } (forventet { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = { $FRAME_SYMBOLS } symboler forventet, { $soft } oppgitt

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = linje { $v1 }: forventet `row,column`

engine-e-lunar-afs-ldpc-line = linje { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = linje { $v1 }: ({ $r },{ $c }) utenfor { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: { $info_bits } informasjonsbit forventet, { $info } oppgitt

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = LSIS V1.0-dataene finnes ikke i { $cache_dir } (sett KSHANA_LSIS_DIR eller kjør xval/lunar-afs/fetch_lsis.sh, som laster ned { $LSIS_PDF_URL } og pakker ut vedleggene; de videredistribueres ikke med Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } er ikke en festet LSIS-fil

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } har SHA-256 { $got }, forventet { $want } (festet til LSIS V1.0 av 29 January 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal-basebånd, { $LSIS_VERSION }; Kshana referansegenerator

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = AFS-node { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = AFS-node { $node_id } ramme TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites må være minst 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites må være minst 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg må ligge i [0, 90); fikk { $mask_deg }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } satellitt, ingen fyr
       *[other] { $n_sats } satellitter, ingen fyr
    }


engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one] { $n_sats } satellitt + { $n_vis_beacons } synlige fyr
       *[other] { $n_sats } satellitter + { $n_vis_beacons } synlige fyr
    }


engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } satellitt, ingen fyr
       *[other] { $n_cmp } satellitter, ingen fyr
    }


engine-e-lunar-beacon-serialising-beacon-report = serialiserer fyrrapport: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = fyrrapporten må serialiseres til et JSON-objekt

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Månens overflatefyr-utvidelse — maske { $elevation_mask_deg } deg, epoke +{ $epoch_s } s, sigma_URE per fyr { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  sats { $n_visible_sats }  fyr { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  realisert 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }fyr forbedrer PDOP med { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = en større konstellasjon i stedet, { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = kan ikke lese månens efemeride { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = månens efemeride: første linje må være `{ $MAGIC }`, fant `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = månens efemeride: filen er tom

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = månens efemeride: `# format:` må være `states` eller `elements`, fant `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = månens efemeride: ingen datarader

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = månens efemeride: mangler kolonnen `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = månens efemeride: `# elements_frame:` må være `icrf` eller `mci`, fant `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = månens efemeride: `elements_frame: icrf` trenger `# epoch_jd_tdb:` (epoken elementene refererer til, som også er der rotasjonen fra ICRF til månefast system beregnes): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = månens efemeride: for kort elementrad { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = månens efemeride: elementrad { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = månens efemeride: elementrad { $v1 } har en ikke-positiv store halvakse

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = månens efemeride: elementrad { $v1 } har eksentrisitet { $ecc }, utenfor [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = månens efemeride: en `states`-fil trenger `# frame: icrf` eller `# frame: mci`, fant `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = månens efemeride: en `icrf`-states-fil trenger `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = månens efemeride: for kort tilstandsrad { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = månens efemeride: tilstandsrad { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = månens efemeride: tilstandsrad { $v1 } er ikke endelig

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = månens efemeride: tilstandsrad { $v1 } for satellitt { $sat } går bakover i tid ({ $t } etter { $last }); epoker må øke strengt per satellitt

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Tabulert månesentrert tilstandsefemeride ({ $e }-system), Lagrange-interpolert i orden { $LAGRANGE_ORDER } mellom tabellepoker og redusert til MCMF ved { $v2 }. Tilstandene propageres IKKE av denne motoren. Opphavsklasse `published-ephemeris`: skilt fra alle tall utledet fra elementer.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Publisert konstellasjons-DEFINISJON oppgitt i månesentrert ICRF (`{ $v1 }`), propagert av denne motorens egen Kepler-løser i det samme treghetssystemet og redusert til MCMF ved IAU 2015 / WGCCRE-månens orientering (presesjonspol, analytisk fysisk librasjon) ved hver epoke. INGEN systemtilnærming: kilden angir systemet og epoken, og begge brukes. Opphavsklasse `published-elements`: skilt fra alle tall utledet fra kjerner.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Publisert konstellasjons-DEFINISJON, propagert av denne motorens egen Kepler-løser og redusert av månespinnmodellen med middelrotasjon — nøyaktig samme vei som den illustrative konstellasjonen følger, slik at den eneste forskjellen mellom de to kjøringene er konstellasjonens utforming. Kilden oppgir elementene i `{ $v1 }`-systemet; de leses her som MCI, noe som heller konstellasjonen med `published_frame_tie_angle_deg`. Opphavsklasse `published-elements`: skilt fra alle tall utledet fra kjerner.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = ukjent station_datum { $other }: forventet "fixed" eller "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = en VLBI-kampanje trenger minst 2 stasjoner for å danne en grunnlinje, fikk { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = stasjon { $name } har en ikke-endelig koordinat

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = stasjon { $name } breddegrad { $lat } deg er utenfor [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = et Helmert-datum med sju parametere trenger minst 3 ikke-kollineære fyr, fikk { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = fyr { $name } har en ikke-endelig koordinat

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = fyr { $name } breddegrad { $lat } deg er utenfor [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours må være positiv og endelig, fikk { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min må være positiv og endelig, fikk { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = en plan med { $v1 } epoker er over dette scenarioets grense på 5000 epoker; øk step_min eller reduser arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s må være positiv og endelig, fikk { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg må være endelig og i [-90, 90), fikk { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg må være endelig og i [-90, 90), fikk { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol må være endelig og i [0, 1), fikk { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m må være positiv og endelig, fikk { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver må være "spectral" eller "srif", fikk "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = serialiserer lunar-frame-campaign-resultat: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign =
    { $n_epochs ->
        [one] ingen observasjon i kampanjen passerer jordsidens høydemaske på { $mask } deg i begge ender av en grunnlinje OG masken på { $earth_mask } deg over fyrets egen horisont: { $n_epochs } epoke x { $v1 } grunnlinjer x { $n_beacons } fyr er alle avvist. Øk arc_hours, senk en maske eller flytt stasjonene.
       *[other] ingen observasjon i kampanjen passerer jordsidens høydemaske på { $mask } deg i begge ender av en grunnlinje OG masken på { $earth_mask } deg over fyrets egen horisont: { $n_epochs } epoker x { $v1 } grunnlinjer x { $n_beacons } fyr er alle avvist. Øk arc_hours, senk en maske eller flytt stasjonene.
    }


engine-lunar-frame-campaign-full-rank-all-similarity-parameters = full rang: alle 7 likhetsparametere er bundet av denne kampanjen (kondisjonstall { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANGMANGEL: { $defect } av 7 likhetsretninger kan ikke observeres fra denne kampanjen, så INGEN datum-sigma publiseres; de uobserverbare retningene er oppført i sjuparameter-basisen

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines =
    { $n_epochs ->
        [one] lunar-frame-campaign | { $n_beacons } fyr x { $v1 } grunnlinjer x { $n_epochs } epoke = { $n_obs } obs (forsinkelsessigma { $sigma_tau } s) | stasjonsdatum { $station_datum } | Helmert-rang { $rank }/7 kond { $condition } | datum-translasjonssigma { $v5 } mot gjenvinningsfeil for injisert transformasjon { $trans_err_norm_m } m (forhold { $v7 })
       *[other] lunar-frame-campaign | { $n_beacons } fyr x { $v1 } grunnlinjer x { $n_epochs } epoker = { $n_obs } obs (forsinkelsessigma { $sigma_tau } s) | stasjonsdatum { $station_datum } | Helmert-rang { $rank }/7 kond { $condition } | datum-translasjonssigma { $v5 } mot gjenvinningsfeil for injisert transformasjon { $trans_err_norm_m } m (forhold { $v7 })
    }


engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } av { $beacons } fyr har ingen observasjon i denne planen ({ $names2 }); de bærer ingen informasjon, sigmaene deres er null, og datumet realiseres bare fra de observerte fyrene

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = alle sigmaer må være positive

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane og altitude_km må være positive

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency må ligge i (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m mot bakke { $v2 } m posisjonssigma, gjennomsnittlig q { $v3 } (kjikvadrat 6 forventer 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } flertydigheter, ILS-suksess { $last2 } (bootstrap { $last3 }) på den lengste buen

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: minste informasjonsegenverdi x{ $v } med banefartøylenker, CRLB-spor x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } sveippunkter på { $v } buer; laser mot GNSS x translasjonssigma { $last2 } m ved det registrerte lokale båndet

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB-sigma h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = ukjent studie `{ $other }`: forventet én av { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = måledataene bestemmer ikke banen (singulær informasjon)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials må være minst 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = bakkesigmaer må være positive

engine-e-lunar-infra-od-unknown-station-dss-14-dss = ukjent stasjon `{ $nm }`: DSS-14, DSS-63 eller DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = for få bakkemålinger til å bestemme banen

engine-e-lunar-infra-od-the-covariance-of-the-difference = kovariansen til differansen er singulær

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = den differensielle korreksjonen for NRHO konvergerte ikke fra startverdien

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo trenger 0 < perilune-høyde < apolune-høyde

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = ukjent banefamilie `{ $other }`: nrho eller elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s og arc_days må være positive

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = ingen felles satellitt mellom mottakerne

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = normalligningene for bærebølgefase er singulære

engine-e-lunar-infra-phase-the-position-block-is-singular = posisjonsblokken er singulær

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = flertydighetskovariansen er ikke positivt definitt

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = teknikksigmaer må være positive

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = sigmaer for lokalt bånd må være positive

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz må være endelig og positiv

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz må være endelig og positiv

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k må være endelig og positiv

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km må være endelig og over månens radius

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity må ligge i [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw må være endelig

engine-lunar-jamming-lunar-jamming-sats-epochs-links =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } epoke, { $n_links } lenke fra ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (gjennomsnitt { $mean_js_db }) | { $n_lost } LOST | tilgjengelighet { $availability_under_jamming } av { $availability_nominal } nominelt
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } epoke, { $n_links } lenker fra ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (gjennomsnitt { $mean_js_db }) | { $n_lost } LOST | tilgjengelighet { $availability_under_jamming } av { $availability_nominal } nominelt
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } epoker, { $n_links } lenke fra ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (gjennomsnitt { $mean_js_db }) | { $n_lost } LOST | tilgjengelighet { $availability_under_jamming } av { $availability_nominal } nominelt
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } epoker, { $n_links } lenker fra ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (gjennomsnitt { $mean_js_db }) | { $n_lost } LOST | tilgjengelighet { $availability_under_jamming } av { $availability_nominal } nominelt
            }
    }


engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } epoke, { $n_links } lenke fra ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (rent-himmel lunar grunnlinje) | { $n_lost } LOST | tilgjengelighet { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } epoke, { $n_links } lenker fra ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (rent-himmel lunar grunnlinje) | { $n_lost } LOST | tilgjengelighet { $availability_nominal }
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } epoker, { $n_links } lenke fra ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (rent-himmel lunar grunnlinje) | { $n_lost } LOST | tilgjengelighet { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } epoker, { $n_links } lenker fra ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (rent-himmel lunar grunnlinje) | { $n_lost } LOST | tilgjengelighet { $availability_nominal }
            }
    }


## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = uventet header i reflektorkatalogen { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = for kort rad i reflektorkatalogen { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = uleselig reflektorfelt { $i } i { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = reflektor { $f }: |(x,y,z)| = { $norm3 } m, men den publiserte radiuskolonnen sier { $radius } m — raden er redigert

engine-e-lunar-llr-reflector-catalogue-has-no-rows = reflektorkatalogen har ingen rader

engine-e-lunar-llr-unreadable-position-epoch-year = uleselig position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = uventet header i stasjonskatalogen { $t }

engine-e-lunar-llr-short-station-catalogue-row = for kort rad i stasjonskatalogen { $t }

engine-e-lunar-llr-unreadable-station-field-in = uleselig stasjonsfelt { $i } i { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = uleselig ILRS-id i { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = stasjonskatalogen har ingen rader

engine-e-lunar-llr-cannot-read-this-scenario-runs = kan ikke lese { $path } ({ $e }). Dette scenarioet kjører på det innsjekkede virkelige datautsnittet under { $DEFAULT_DATA_DIR }, som følger med depotet, men ikke med den publiserte crate-en; pek `data_dir` til en kopi av det.

engine-e-lunar-llr-only-usable-normal-points-for = bare { $used } brukbare normalpunkter for { $reflectors } reflektorer — for få til å avgrense { $v3 } koordinater; utvid arkivutsnittet

engine-e-lunar-llr-the-simulated-campaign-own-report = den simulerte kampanjens egen rapport kunne ikke tolkes: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: { $used } arkiverte normalpunkter ({ $n_parsed } tolket) fra { $station_counts } stasjon(er) til { $reflectors } retroreflektorer over { $v5 } d; median målt normalpunktpresisjon { $median } mm enveis; informasjonsrang for reflektorer { $rank }/{ $n }; Helmert-rang { $rank2 }/{ $n_helmert } kond { $condition }; datum-translasjonssigma { $v12 } m; RMS for observert-minus-beregnet enveis residual { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg må være endelig og i [-90, 90), fikk { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } har en ikke-endelig koordinat

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } breddegrad { $lat_deg } deg er utenfor [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = serialisering av lunar-llr-datum-rapporten mislyktes: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = integrasjonssteget må dele utdatasteget

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } må være endelig og ikke-negativ

engine-lunar-receiver-must-be-finite-and-positive = { $n } må være endelig og positiv

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: eksportsted: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = månens efemeride { $path } dekker { $until } s etter epoken sin, men scenarioets horisont når { $last } s; forkort horizon_hours eller hent en lengre bue (ekstrapolering av en tabulert efemeride avvises)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path trenger epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = OP-system ved { $epoch } UTC (jordens tilsynelatende banenormal om Månen, x langs dens knute på det månefaste IAU-ekvatorplanet); månens GM, J2 og C22 i IAU-systemet fast på Månen, jorden og solen som tredjelegemer ved DE440-posisjoner fra { $spk_path }; fjerdeordens Runge-Kutta, 10 s steg

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m må være endelig og positiv

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m må være endelig og positiv

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 krever height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites må være 3 eller 4, fikk { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs må være 1 til 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } må være endelig og positiv

engine-lunar-station-must-be-finite-and-not = { $name } må være endelig og ikke-negativ

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } overstiger { $MAX_WORK }; reduser n_trials, gjør grid_lat_step_deg grovere (eller list færre punkter), eller øk t_step_s / forkort t_span_s

engine-e-lunar-station-kind-must-be-got = kind må være { $KIND }; fikk { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: efemeriden { $path } dekker { $until } s, men kjøringen når { $last } s (siste epoke pluss latency_s); forkort t_span_s

engine-e-lunar-station-no-case = { $KIND }: ingen case ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } punkter · { $n_epochs } epoker · { $n_trials } forsøk

engine-lunar-station-hpl-max = HPL maks { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = oppmåling { $survey_sigma_m } m · latens { $latency_s } s · { $quantization_bits } bit

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines og samples må være 2 til { $MAX_DEM_SIDE }, fikk { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } høyder for et { $lines } x { $samples } gitter

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m må være positiv, fikk { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m må være positiv, fikk { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: kan ikke lese { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection må være south-polar-stereographic, fikk { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type må være int16-le, fikk { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: kan ikke lese { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: gitteret overstiger grensen på { $MAX_DEM_SIDE } piksler

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } er { $bytes } bytes; { $lines } x { $samples } int16 trenger { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: { $img } SHA-256 { $digest } stemmer ikke med beskrivelsens { $image_sha256 }

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor må være positiv

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: kan ikke lese { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: trenger minst 2 x 2 punkter, en økende utstrekning innenfor [-90, 90] deg og 360 deg lengdegrad, og endelige høyder

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } må være endelig og positiv, fikk { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m må være endelig og ikke-negativ, fikk { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg må være høyst 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m må være 1 til 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: stedet ligger utenfor høydefeltet

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: en oppgitt horisont trenger en kilde som ikke er tom

engine-e-lunar-terrain-terrain-stated-horizon = terrain: oppgitt horisont: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: oppgi dem_path eller dem_tile_path, ikke begge

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km må være endelig og positiv

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m må være endelig og positiv

engine-e-lunar-terrain-site-deg-deg = { $e } (sted { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = ukjent klokke { $other }; forventet én av optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks må angi minst én klokkeklasse

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s må være endelig og positiv, fikk { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s må være endelig og større enn tau_min_s ({ $lo }), fikk { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade må være ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = leddet { $name } er kortere enn tau-gitteret

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | klokke { $clock } | 7-leddet x_Σ(τ) over { $taus } τ-punkter ({ $taus2 }–{ $taus3 } s) | krysningspunkt τ { $crossover_tau_s } s (x { $crossover_x_s } s) | systemgulv { $frame_term_s } s | klokke x(1 d) { $x_1day_ns } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: ukjent klokke { $other }; forventet én av optical-master, passive-h-maser, rafs, mini-rafs, eller oppgi et device_card i stedet

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: oppgi enten clock eller device_card, ikke begge

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s må være endelig og positiv, fikk { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } må være endelig og ikke-negativ, fikk { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s må være positive tall

engine-lunar-time-lab-station-height-not-modelled-exactly = stasjonshøyden er ikke modellert eksakt: en énsigma høydefeil på { $height_sigma_m } m gir en skjevhet i raten på { $value } ns/day, anvendt som et lineært ledd siden siste styring

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = lystiden konvergerte ikke til 1e-15 s på 30 iterasjoner

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = kjernestien trenger planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path sammen

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = ukjent datum { $other }: forventet "anchor-first-station", "free-network" eller "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = en VLBI-plan trenger minst 2 stasjoner for å danne en grunnlinje, fikk { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = fyrkoordinater må være endelige

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = fyrets breddegrad { $lat } deg er utenfor [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = en plan med { $v1 } epoker er over dette scenarioets grense på 20000 epoker; øk step_min eller reduser arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g må være positiv og endelig, fikk { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = serialiserer lunar-vlbi-fim-resultat: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule =
    { $n_epochs ->
        [one] ingen observasjon i planen passerer høydemasken på { $mask } deg i begge ender av en grunnlinje: { $n_epochs } epoke x { $v1 } grunnlinjer er alle avvist. Øk arc_hours, senk elevation_mask_deg eller flytt stasjonene.
       *[other] ingen observasjon i planen passerer høydemasken på { $mask } deg i begge ender av en grunnlinje: { $n_epochs } epoker x { $v1 } grunnlinjer er alle avvist. Øk arc_hours, senk elevation_mask_deg eller flytt stasjonene.
    }


engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = datumet etterlater ingen parameter å estimere

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANGMANGEL: { $defect } av { $dim } retninger kan ikke observeres, så ingen sigma per koordinat rapporteres; verdien for det observerbare underrommet nedenfor er en pseudoinvers begrenset til de { $rank } observerbare retningene og er IKKE en stasjonssigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines =
    { $n_stations ->
        [one]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } stasjon / { $v2 } grunnlinjer x { $n_epochs } epoke = { $n_obs } obs (maske { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond { $condition } | stasjonssigma { $v10 } mot equipartition g={ $g } { $eq_g } m (forhold { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } stasjon / { $v2 } grunnlinjer x { $n_epochs } epoker = { $n_obs } obs (maske { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond { $condition } | stasjonssigma { $v10 } mot equipartition g={ $g } { $eq_g } m (forhold { $v13 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } stasjoner / { $v2 } grunnlinjer x { $n_epochs } epoke = { $n_obs } obs (maske { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond { $condition } | stasjonssigma { $v10 } mot equipartition g={ $g } { $eq_g } m (forhold { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } stasjoner / { $v2 } grunnlinjer x { $n_epochs } epoker = { $n_obs } obs (maske { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond { $condition } | stasjonssigma { $v10 } mot equipartition g={ $g } { $eq_g } m (forhold { $v13 })
            }
    }


## src/main.rs

engine-main-error-validate-needs-scenario-path = feil: --validate trenger en scenariosti

engine-main-error-study-needs-suite-manifest = feil: --study trenger en sti til suitemanifest

engine-main-error-study-name-needs-value = feil: --study-name trenger en verdi

engine-main-error-export-sp3-needs-path = feil: --export-sp3 trenger en sti

engine-main-error-export-omm-needs-path = feil: --export-omm trenger en sti

engine-main-error-export-oem-needs-path = feil: --export-oem trenger en sti

engine-main-error-animate-needs-format-svg = feil: --animate trenger et format: svg, html, frames eller all

engine-main-error-animate = feil: --animate: { $e }

engine-main-error-animate-fps-needs-whole = feil: --animate-fps trenger et helt antall bilder per sekund

engine-main-error-export-needs-format-czml = feil: --export trenger et format: czml, kml, geojson, stk, sigmf, all eller list

engine-main-error-animate-duration-needs-length = feil: --animate-duration trenger en lengde i sekunder

engine-main-error-import-route-needs-geojson = feil: --import-route trenger en GeoJSON-filsti

engine-main-error-eop-needs-finals2000a-file = feil: --eop trenger en finals2000A-filsti

engine-main-error-unknown-option = feil: ukjent valg '{ $other }'

engine-main-error-unexpected-argument-one-scenario = feil: uventet argument '{ $other }'; én scenariofil per kjøring

engine-main-warning-animate-fps-and-animate = advarsel: --animate-fps og --animate-duration gjør ingenting uten --animate

engine-main-error-animate-exports-one-scenario = feil: --animate eksporterer én scenariokjøring; det kan ikke kombineres med --validate eller --study

engine-main-error-validate-lints-one-scenario = feil: --validate lintsjekker ett scenario; ikke oppgi også en scenariofil

engine-main-error-cannot-read = feil: kan ikke lese { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind gjenkjennes; denne kind-en krever ingen felt (en tom kropp kjører referanseoppsettet sitt), så det var ikke noe mer å kontrollere

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok: { $kind } — kind gjenkjennes og den publiserte obligatoriske feltoppføringen ({ $n_required }) er oppfylt; feltverdier kontrolleres ikke
       *[other] ok: { $kind } — kind gjenkjennes og alle { $n_required } av de publiserte obligatoriske feltoppføringene er oppfylt; feltverdier kontrolleres ikke
    }


engine-main-error-study-runs-suite-do = feil: --study kjører en suite; ikke oppgi også en enkelt scenariofil

engine-main-warning-study-name-is-ignored = advarsel: --study-name ignoreres med --study; en studie får tittelen fra suitemanifestets `title =`

engine-main-error-cannot-read-2 = feil: kan ikke lese { $path }: { $e }

engine-main-hint-kshana-example-lists-the = tips: `kshana example` viser de medfølgende referansescenarioene; `kshana example clock-holdover > clock-holdover.toml` skriver ett til fil

engine-main-error-cannot-read-3 = feil: kan ikke lese { $eop_file }: { $e }

engine-main-error-eop = feil: --eop: { $e }

engine-main-error-cannot-read-4 = feil: kan ikke lese { $route_file }: { $e }

engine-main-error-import-route = feil: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: gjelder ikke: { $why }

engine-main-error-export = feil: --export: { $e }

engine-main-error-animate-2 = feil: --animate { $f }: { $e }

engine-main-error-export-2 = feil: { $fmt }-eksport: { $e }

engine-main-error-cannot-write = feil: kan ikke skrive { $json_path }: { $e }

engine-main-error-cannot-write-2 = feil: kan ikke skrive { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = feil: kan ikke bygge rapporten: { $e }

engine-main-error-cannot-write-3 = feil: kan ikke skrive { $html_path }: { $e }

engine-main-error-cannot-write-4 = feil: kan ikke skrive { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = feil: kan ikke skrive { $csv_path }: { $e }

engine-main-wrote-and = skrev { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } og { $csv_path }

engine-main-wrote-and-2 = skrev { $json_path }, { $svg_path }, { $html_path } og { $report_json_path }

engine-main-error-cannot-write-6 = feil: kan ikke skrive { $target }: { $e }

engine-main-error-cannot-write-7 = feil: kan ikke skrive { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = feil: SP3-eksport mislyktes: { $e }

engine-main-error-cannot-write-8 = feil: kan ikke skrive { $omm_path }: { $e }

engine-main-error-omm-export-failed = feil: OMM-eksport mislyktes: { $e }

engine-main-error-cannot-write-9 = feil: kan ikke skrive { $oem_path }: { $e }

engine-main-error-oem-export-failed = feil: OEM-eksport mislyktes: { $e }

engine-main-error-unexpected-argument-after-kinds = feil: uventet argument '{ $other }' etter `kinds`; bare --json godtas

engine-main-bundled-reference-scenarios-write-one =
    Medfølgende referansescenarioer ({ $v1 }). Skriv ett til en fil og kjør det:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (ikke medfølgende: { $name } — kjør `kshana example { $name }` for å se hvorfor)

engine-main-error-is-not-bundled-it = feil: '{ $name }' følger ikke med: den { $why }

engine-main-error-no-bundled-scenario-named = feil: ingen medfølgende scenario med navn '{ $name }'; `kshana example` viser de { $v1 } som finnes

engine-main-error-cannot-read-5 = feil: kan ikke lese { $suite_path }: { $e }

engine-main-wrote-and-3 = skrev { $json_path } og { $html_path }

engine-main-error-needs-value = feil: { $a } trenger en verdi

engine-main-error-expected-mean-needs-number = feil: --expected-mean trenger et tall

engine-main-error-unknown-imu-fit-option = feil: ukjent imu-fit-valg { $x }

engine-main-error-imu-fit-needs-an = feil: imu-fit trenger en sti til en IMU-logg

engine-main-error-needs-value-2 = feil: { $args } trenger en verdi

engine-main-error-epoch = feil: --epoch: { $e }

engine-main-error-unknown-bench-export-option = feil: ukjent bench-export-valg { $a }

engine-main-error-bench-export-needs-scenario = feil: bench-export trenger en scenariosti

engine-main-needs-value = { $a } trenger en verdi

engine-main-site-takes-lat-lon-height = --site tar lat,lon[,height_m], fikk { $v }

engine-main-error-is-bytes-the-tle = feil: { $p } er { $m } bytes; TLE-grensen er { $cap } (4 MiB)

engine-main-error-cannot-read-6 = feil: kan ikke lese { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = ukjent sky-valg { $a }

engine-e-main-svg-and-monte-carlo-are = --svg og --monte-carlo er separate utdata; oppgi ett

engine-main-error-preset-needs-name =
    feil: --preset trenger et navn
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    feil: --profile trenger en fil
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } symboler, { $r2 } ramme(r) funnet; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }ramme ved { $f }: FID { $f2 } TOI { $f3 } (SB1-metrikk { $f4 }, { $f5 } SP-feil, { $f6 } SB1-feil)

engine-main-not-checked = ikke kontrollert: { $r }

engine-main-wrote-frame-of-6000-symbols = skrev { $out }: { $frames } ramme(r) på 6000 symboler; delrammene 2 til 4 er plassholdere (ikke LDPC-kodet, ingen melding)

engine-main-error-cannot-write-10 = feil: kan ikke skrive { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = ukjent underkommando for lunanet-afs-check { $other }

engine-main-needs-pack-id = { $cmd } trenger en pakke-id

engine-main-unknown-standards-pack-run-option = ukjent valg for standards-pack run { $a }

engine-main-unknown-standards-pack-subcommand = ukjent underkommando for standards-pack { $other }

engine-main-error-out-needs-value = feil: --out trenger en verdi

engine-main-error-unknown-compliance-report-option = feil: ukjent compliance-report-valg { $a }

engine-main-error-compliance-report-needs-at = feil: compliance-report trenger minst én resultatfil i .json

engine-main-runs-read-not-used-rows = { $runs } kjøringer lest, { $unrecognised } ikke brukt; rader: { $n } dokumentert, { $n2 } delvis, { $n3 } ikke dokumentert, { $n4 } utenfor omfang

engine-main-error-receiver-trust-needs-scenario = feil: receiver-trust trenger en scenariosti

engine-main-error-invalid-receiver-trust-scenario = feil: ugyldig receiver-trust-scenario: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = brenningen tømmer massen: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, brenning={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = flytiden må være positiv

engine-e-maneuver-collinear-endpoints-transfer-plane-is = kollineære endepunkter: overgangsplanet er udefinert (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs er for M >= 1; bruk lambert for M = 0

engine-e-maneuver-no-revolution-transfer-the-time = ingen overføring med { $revs } omløp: flytiden er under minimum

engine-e-maneuver-grid-step-days-must-be = grid_step_days må være positiv, fikk { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = hvert vindu må gå framover (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = ingen overføring av den forespurte typen i vinduene

engine-e-maneuver-the-optimum-left-the-feasible = optimum forlot det gjennomførbare området

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: forventet 3 verdier

engine-e-mars-od-dss-epoch-is-not-2003 = DSS-{ $id } epoke er ikke 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } har ingen DXYZ

engine-e-mars-od-no-coordinates-for-dss = ingen koordinater for DSS { $station }

engine-e-mars-od-no-ramps-for-dss = ingen ramper for DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = ramptabellen dekker ikke intervallet

engine-e-mars-od-epoch-outside-the-integrated-span = epoke { $et } utenfor det integrerte spennet

engine-e-mars-od-normal-matrix-is-not-positive = normalmatrisen er ikke positivt definitt

engine-e-mars-od-no-points = ingen punkter

engine-e-mars-od-parameter-has-no-partial-on = en parameter har ingen partiell derivert på de beholdte punktene

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays =
    { $n_relays ->
        [one] mars-pnt { $r } | { $user }-bruker, { $clock_class }-klokke | { $n_relays } relé (gjennomsnittlig { $mean_relays_in_view } i sikte) | konvergert pos-RMS { $converged_pos_rms_m } m, formell 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — kovarians-FoM, ikke en sertifisert PL) | klokkefrekvens-σ { $final_clock_freq_sigma } | kov-PD { $covariance_pd_throughout }
       *[other] mars-pnt { $r } | { $user }-bruker, { $clock_class }-klokke | { $n_relays } reléer (gjennomsnittlig { $mean_relays_in_view } i sikte) | konvergert pos-RMS { $converged_pos_rms_m } m, formell 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — kovarians-FoM, ikke en sertifisert PL) | klokkefrekvens-σ { $final_clock_freq_sigma } | kov-PD { $covariance_pd_throughout }
    }


engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — { $user }-bruker, { $clock_class }-klokke: 3D-posisjonsfeil mot referanse (konvergert RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = den parvise matrisen er tom

engine-e-mcda-ahp-pairwise-matrix-is-not-square = den parvise matrisen er ikke kvadratisk (rad { $i } har { $row } av { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = element a[{ $i }][{ $j }] = { $v } må være endelig og positivt

engine-e-mcda-ahp-diagonal-must-be = diagonal a[{ $i }][{ $i }] = { $row } må være 1

engine-e-mcda-ahp-entries-must-be-reciprocal = elementene a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } må være resiproke (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = øvre rad { $i } har { $row } elementer, forventet { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = øvre element ({ $i },{ $j }) = { $v } må være endelig og positivt

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: tom beslutningsmatrise

engine-e-mcda-copras-copras-no-criteria = COPRAS: ingen kriterier

engine-e-mcda-copras-copras-weights-but-criterion-types =
    { $n ->
        [one] COPRAS: { $n } vekt, men { $types } kriterietyper
       *[other] COPRAS: { $n } vekter, men { $types } kriterietyper
    }


engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: krever minst ett kostnadskriterium (Min)

engine-e-mcda-copras-copras-alternative-has-values-but =
    { $n ->
        [one] COPRAS: alternativ { $i } har { $row } verdier, men det er { $n } kriterium
       *[other] COPRAS: alternativ { $i } har { $row } verdier, men det er { $n } kriterier
    }


engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: alternativ { $i } kriterium { $j } verdi { $x } må være endelig og > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: tomt datasett

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: ingen kriterier

engine-e-mcda-electre-electre-alternative-has-values-but =
    { $n ->
        [one] ELECTRE I: alternativ { $i } har { $row } verdier, men det er { $n } kriterium
       *[other] ELECTRE I: alternativ { $i } har { $row } verdier, men det er { $n } kriterier
    }


engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: alternativ { $i } har en ikke-endelig verdi

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: tom beslutningsmatrise

engine-e-mcda-moora-moora-no-criteria = MOORA: ingen kriterier

engine-e-mcda-moora-moora-weights-but-criterion-types =
    { $n ->
        [one] MOORA: { $n } vekt, men { $types } kriterietyper
       *[other] MOORA: { $n } vekter, men { $types } kriterietyper
    }


engine-e-mcda-moora-moora-alternative-has-values-but =
    { $n ->
        [one] MOORA: alternativ { $i } har { $row } verdier, men det er { $n } kriterium
       *[other] MOORA: alternativ { $i } har { $row } verdier, men det er { $n } kriterier
    }


engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: alternativ { $i } har en ikke-endelig verdi

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: kriterium { $j } har L2-norm null

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: tom beslutningsmatrise

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: ingen kriterier

engine-e-mcda-promethee-promethee-ii-weights-but-types =
    { $n ->
        [one] PROMETHEE II: { $n } vekt, men { $types } typer / { $prefs } preferansefunksjoner
       *[other] PROMETHEE II: { $n } vekter, men { $types } typer / { $prefs } preferansefunksjoner
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    { $n ->
        [one] PROMETHEE II: alternativ { $i } har { $row } verdier, men det er { $n } kriterium
       *[other] PROMETHEE II: alternativ { $i } har { $row } verdier, men det er { $n } kriterier
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: alternativ { $i } har en ikke-endelig verdi

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: tom beslutningsmatrise

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: ingen kriterier

engine-e-mcda-topsis-topsis-weights-but-criterion-types =
    { $n ->
        [one] TOPSIS: { $n } vekt, men { $types } kriterietyper
       *[other] TOPSIS: { $n } vekter, men { $types } kriterietyper
    }


engine-e-mcda-topsis-topsis-alternative-has-values-but =
    { $n ->
        [one] TOPSIS: alternativ { $i } har { $row } verdier, men det er { $n } kriterium
       *[other] TOPSIS: alternativ { $i } har { $row } verdier, men det er { $n } kriterier
    }


engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: alternativ { $i } har en ikke-endelig verdi

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = additiv nytte har ingen attributter

engine-e-mcda-utility-attributes-but-weights = { $attributes } attributter, men { $weights } vekter

engine-e-mcda-utility-invalid-scaling-constant = ugyldig skaleringskonstant { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = skaleringskonstantene summerer til null

engine-e-mcda-utility-attribute-values-expected-got = { $attributes } attributtverdier forventet, fikk { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: tom beslutningsmatrise

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: ingen kriterier

engine-e-mcda-vikor-vikor-weights-but-criterion-types =
    { $n ->
        [one] VIKOR: { $n } vekt, men { $types } kriterietyper
       *[other] VIKOR: { $n } vekter, men { $types } kriterietyper
    }


engine-e-mcda-vikor-vikor-alternative-has-values-but =
    { $n ->
        [one] VIKOR: alternativ { $i } har { $row } verdier, men det er { $n } kriterium
       *[other] VIKOR: alternativ { $i } har { $row } verdier, men det er { $n } kriterier
    }


engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: alternativ { $i } har en ikke-endelig verdi

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: tom beslutningsmatrise

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: ingen kriterier

engine-e-mcda-waspas-waspas-weights-but-criterion-types =
    { $n ->
        [one] WASPAS: { $n } vekt, men { $types } kriterietyper
       *[other] WASPAS: { $n } vekter, men { $types } kriterietyper
    }


engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } må ligge i [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    { $n ->
        [one] WASPAS: alternativ { $i } har { $row } verdier, men det er { $n } kriterium
       *[other] WASPAS: alternativ { $i } har { $row } verdier, men det er { $n } kriterier
    }


engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: alternativ { $i } kriterium { $j } verdi { $x } må være endelig og > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: tom beslutningsmatrise

engine-e-mcda-wpm-wpm-no-criteria = WPM: ingen kriterier

engine-e-mcda-wpm-wpm-weights-but-criterion-types =
    { $n ->
        [one] WPM: { $n } vekt, men { $types } kriterietyper
       *[other] WPM: { $n } vekter, men { $types } kriterietyper
    }


engine-e-mcda-wpm-wpm-alternative-has-values-but =
    { $n ->
        [one] WPM: alternativ { $i } har { $row } verdier, men det er { $n } kriterium
       *[other] WPM: alternativ { $i } har { $row } verdier, men det er { $n } kriterier
    }


engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: alternativ { $i } kriterium { $j } verdi { $x } må være endelig og > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = beslutningsmatrisen har ingen kriterier

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = beslutningsmatrisen har ingen alternativer

engine-e-mcda-wsm-criterion-has-an-invalid-weight = kriteriet '{ $name }' har en ugyldig vekt { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = kriterievektene summerer til null

engine-e-mcda-wsm-alternative-has-values-but-there =
    { $n ->
        [one] alternativet '{ $name }' har { $values } verdier, men det er { $n } kriterium
       *[other] alternativet '{ $name }' har { $values } verdier, men det er { $n } kriterier
    }


engine-e-mcda-wsm-alternative-has-non-finite-value = alternativet '{ $name }' har en ikke-endelig verdi på kriteriet '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = ikke en DAF: kortere enn én post

engine-e-naif-kernel-not-daf-identification-word = ikke en DAF: identifikasjonsord { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = binærformatet { $other } for DAF støttes ikke

engine-e-naif-kernel-implausible-daf-header-nd-ni = usannsynlig DAF-header: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF-adresse { $addr } utenfor slutten av filen

engine-e-naif-kernel-bad-daf-address-range = ugyldig DAF-adresseområde { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = DAF-sammendragslisten avsluttes ikke

engine-e-naif-kernel-daf-summary-record-claims-summaries = DAF-sammendragsposten { $rec } hevder { $count } sammendrag

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = ugyldig type-2-segment: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = størrelsen på type-2-segmentet samsvarer ikke med katalogen

engine-e-naif-kernel-epoch-outside-the-record = epoke { $et } utenfor posten [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = størrelsen på type-1-segmentet samsvarer ikke med N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = ugyldig type-1-post: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = ikke en SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = SPK-sammendraget er ikke ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = ingen SPK type-1/2-data for legeme { $target } ved ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = SPK-segmentet for { $target } er i systemet { $frame }, ikke J2000

engine-e-naif-kernel-spk-centre-chain-does-not = SPK-sentrumskjeden når ikke barysenteret

engine-e-naif-kernel-not-binary-pck = ikke en binær PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = PCK-sammendraget er ikke ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = ingen PCK type-2-data for systemet { $body_frame } ved ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = PCK-systemet { $body_frame } er gitt mot systemet { $other }, som ikke er J2000 eller ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = ugyldig tall { $s }

engine-e-navsignal-must-be-positive-number = { $s } må være et positivt tall

engine-e-navsignal-modulation-expected-name-args-bpsk = modulasjon { $label }: forventet NAME(args), f.eks. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulasjon { $label }: mangler avsluttende parentes

engine-e-navsignal-modulation-is-not-one-of = modulasjon { $label } er ingen av BPSK(n), BOC(m,n) eller MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = uavsluttet entitet i { $s }

engine-e-ndm-xml-bad-character-reference = ugyldig tegnreferanse &{ $ent };

engine-e-ndm-xml-unknown-entity = ukjent entitet &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = uavsluttet prosesseringsinstruksjon

engine-e-ndm-xml-unterminated-comment = uavsluttet kommentar

engine-e-ndm-xml-unterminated-declaration = uavsluttet deklarasjon

engine-e-ndm-xml-expected-an-element-at-byte = forventet et element ved byte { $pos }

engine-e-ndm-xml-unterminated-start-tag = uavsluttet start-tagg

engine-e-ndm-xml-attribute-without-value = attributt uten verdi

engine-e-ndm-xml-unterminated-attribute-value = uavsluttet attributtverdi

engine-e-ndm-xml-unterminated-end-tag = uavsluttet slutt-tagg

engine-e-ndm-xml-unterminated-cdata = uavsluttet CDATA

engine-e-ndm-xml-content-after-the-root-element = innhold etter rotelementet

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } må være endelig og ikke-negativ

engine-e-nma-budget-subframe-must-be-positive = subframe_s må være positiv

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps må være positiv

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed må være 0 eller positiv

engine-e-nmea-synth-cli-unexpected-argument = uventet argument { $s }

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = instruktørlogg: { $e }

engine-nmea-synth-cli-instructor-log-and = instruktørlogg: { $jp } og { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP-server lytter på { $s }; venter på { $wait_clients } klient(er)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = forventet YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = dato eller tid utenfor området (årene 1980 til 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = ingen slik kalenderdato

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } må være et endelig tall

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s må ligge i 1 til 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz må være 1, 2, 5 eller 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = fartøyets posisjon må ligge innenfor 89 grader fra ekvator

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn må ligge i 0 til 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = fartøyets grenser for svingrate og akselerasjon må være positive

engine-e-nmea-synth-config-give-at-least-one-waypoint = oppgi minst ett [[waypoint]] eller vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = veipunkt { $v1 } er utenfor området

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = veipunkt { $v1 } speed_kn må ligge i 0 til 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems må nevne minst én konstellasjon

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } er ingen av { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s må være minst 1

engine-e-nmea-synth-config-event = hendelse { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s må ligge innenfor kjøringen

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s må være positiv; ramp_s og recovery_s må ikke være negative

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s må ikke overstige duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } gjelder ikke for denne typen

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz må ligge i 20 til 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db er påkrevd

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db må ligge i 0 til 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db må ligge i 0 til 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m er påkrevd

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m må ligge i 0 til 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = trekkingen ville akselerere det falske sporet med opptil { $need } m/s^2, over max_accel_mps2 = { $a }; forleng ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = oppgi nøyaktig én av bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s er påkrevd

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s må være ulik null og innenfor et døgn

engine-e-nmea-synth-config-delay-is-required = delay_s er påkrevd

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s må ligge i 0 til 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = horisontlinjen beskriver ingen hindring

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } er avsluttet

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    { $n_used ->
        [one] mottakeren rapporterer posisjonsbestemmelse igjen ({ $n_used } satellitt brukt)
       *[other] mottakeren rapporterer posisjonsbestemmelse igjen ({ $n_used } satellitter brukt)
    }


engine-nmea-synth-gen-the-receiver-has-no-fix =
    { $n_used ->
        [one] mottakeren har ingen posisjonsbestemmelse ({ $n_used } brukbar satellitt, fire trengs)
       *[other] mottakeren har ingen posisjonsbestemmelse ({ $n_used } brukbare satellitter, fire trengs)
    }


## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = fra T+{ $start_s } s i { $duration_s } s (innledende rampe { $ramp_s } s, gjenopprettingsrampe { $recovery_s } s)

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: mottatt C/N0 faller med opptil { $cn0_drop_db } dB (spredning per satellitt { $spread_db } dB); satellitter faller ut og posisjonsbestemmelsen går tapt når færre enn fire er brukbare

engine-nmea-synth-log-towards-deg-true = mot { $b } deg rettvisende

engine-nmea-synth-log-towards-deg-true-deg-relative = mot { $t } deg rettvisende ({ $r } deg relativt til kursen ved start, deretter holdt)

engine-nmea-synth-log-natural-degradation-the-sky-closes = naturlig svekkelse: himmelen lukkes bak en oppgitt horisontlinje ({ $e }); satellitter bak den står fortsatt oppført uten SNR og brukes ikke, C/N0 for resten er uendret, og ingenting er forfalsket

engine-nmea-synth-log-instructor-log = INSTRUKTØRLOGG: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Merknad fra instruktør: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Start { $start_utc }   varighet { $duration_s } s   seed { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }TOPPER  faktisk: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   rapportert: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: ukjent konstellasjon { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Toleransen er under støygulvet { $RANK_TOLERANCE_NOISE_FLOOR } for rangavlesning i f64 (= sqrt(f64::EPSILON)): det tilsvarende egenverdigulvet rel_tol^2 = { $v1 } ligger under avrundingsstøyen i Gram-matrisen, så de ekstra retningene er aritmetisk rest, ikke observerbarhet.

engine-observability-gramian-rank-clamped-from-the-singular = rangen er begrenset fra antallet singulærverdier { $counted } til min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } ved rel_tol { $rel_tol }: en { $n_rows }x{ $n_cols }-matrise kan ikke ha rang { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular =
    { $n ->
        [one] GDOP er udefinert (rangdefekt / singulær geometri): rang { $rank } av { $n } tilstand, datumdefekt { $v3 }, kondisjon { $v4 }
       *[other] GDOP er udefinert (rangdefekt / singulær geometri): rang { $rank } av { $n } tilstander, datumdefekt { $v3 }, kondisjon { $v4 }
    }


## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bytes er ikke et helt antall poster på 36 bytes

engine-e-odf-record-precedes-any-group-header = post { $v1 } kommer før enhver gruppeheader

engine-e-odf-no-orbit-data-group = ingen banedatagruppe

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } er ikke et nøkkelord i { $name }

engine-e-odm-without = { $name } uten { $k }

engine-e-odm-needs-exactly-one-of = { $name } trenger nøyaktig én av { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION og MESSAGE_ID er headernøkkelord i versjon 3.0 (versjon { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = uventet linje { $b }

engine-e-odm-unknown-keyword = ukjent nøkkelord { $k }

engine-e-odm-block-repeated-or-out-of = blokken { $block } er gjentatt eller i feil rekkefølge ved { $key }

engine-e-odm-repeated = { $key } er gjentatt

engine-e-odm-comments-after-the-last-keyword = kommentarer etter siste nøkkelord

engine-e-odm-given-twice = { $b } er oppgitt to ganger

engine-e-odm-opm-without-metadata = OPM uten metadata

engine-e-odm-opm-without-state-vector = OPM uten tilstandsvektor

engine-e-odm-omm-without-metadata = OMM uten metadata

engine-e-odm-omm-without-mean-elements = OMM uten midlere elementer

engine-e-odm-is-not-keyword-of-the = { $k } er ikke et nøkkelord i blokken { $kind }

engine-e-odm-block-without = blokken { $kind } uten { $k }

engine-e-odm-block-with-data-lines = blokken { $kind } med datalinjer

engine-e-odm-line-has-values-expected = { $kind }-linje { $l } har { $l2 } verdier, forventet { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } er ikke et OCM-metadatanøkkelord

engine-e-odm-ocm-metadata-without = OCM-metadata uten { $k }

engine-e-odm-block-repeated = blokken { $kind } er gjentatt

engine-e-odm-inside-block = { $t } inne i en blokk

engine-e-odm-unsupported-ocm-block = OCM-blokken { $tag } støttes ikke

engine-odm-outside-block = { $t } utenfor en blokk

engine-e-odm-closes-block = { $t } lukker en { $want }-blokk

engine-e-odm-unexpected-line-2 = uventet linje { $t }

engine-e-odm-outside-block = { $k } utenfor en blokk

engine-e-odm-unterminated-block = uavsluttet blokk

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = epoken mangler skilletegnet 'T' mellom dato og tid: { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = OEM-epokedatoen '{ $date }' støttes ikke (forventet yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = OEM-epoketiden '{ $time }' støttes ikke (forventet HH:MM:SS)

engine-e-oem-bad-epoch-year = ugyldig epokeår: { $d }

engine-e-oem-bad-epoch-month = ugyldig epokemåned: { $d }

engine-e-oem-bad-epoch-day = ugyldig epokedag: { $d }

engine-e-oem-bad-epoch-hour = ugyldig epoketime: { $t }

engine-e-oem-bad-epoch-minute = ugyldig epokeminutt: { $t }

engine-e-oem-bad-epoch-second = ugyldig epokesekund: { $t }

engine-e-oem-oem-epoch-field-out-of = OEM-epokefelt utenfor området: { $s }

engine-e-oem-unexpected-oem-header-line = uventet OEM-headerlinje: { $line }

engine-e-oem-expected-meta-start-found = forventet META_START, fant: { $line }

engine-e-oem-unexpected-oem-metadata-line = uventet OEM-metadatalinje: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM-segmentmetadata mangler META_STOP

engine-e-oem-oem-metadata-missing-object-name = OEM-metadata mangler OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = OEM-metadata mangler OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = OEM-metadata mangler CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = OEM-metadata mangler REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = OEM-metadata mangler TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = OEM-metadata mangler START_TIME

engine-e-oem-oem-metadata-missing-stop-time = OEM-metadata mangler STOP_TIME

engine-e-oem-oem-data-line-needs-position = en OEM-datalinje trenger komponenter for posisjon+hastighet (6) eller +akselerasjon (9), fikk { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = ikke-numerisk OEM-tilstandsverdi '{ $t }' i: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM mangler headeren CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = OEM mangler headeren CREATION_DATE

engine-e-oem-oem-missing-originator-header = OEM mangler headeren ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM hadde ingen segmenter

engine-oem-oem-interop-round-tripped-segment =
    { $n_states_total ->
        [one] oem-interop: rundtur for { $segments } segment(er), { $n_states_total } tilstand; maks rundturfeil { $p } km / { $v } km/s (MODELLED interop)
       *[other] oem-interop: rundtur for { $segments } segment(er), { $n_states_total } tilstander; maks rundturfeil { $p } km / { $v } km/s (MODELLED interop)
    }


engine-oem-oem-interop-ingested-segment-states =
    { $n_states_total ->
        [one] oem-interop: innlest { $segments } segment(er), { $n_states_total } tilstand fra ekstern OEM (avsender { $originator }) (MODELLED interop)
       *[other] oem-interop: innlest { $segments } segment(er), { $n_states_total } tilstander fra ekstern OEM (avsender { $originator }) (MODELLED interop)
    }


engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = ingen COVARIANCE_START-blokk

engine-e-oem-no-covariance-stop = ingen COVARIANCE_STOP

engine-e-oem-bad-covariance-value = ugyldig kovariansverdi '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = forventet 21 kovariansverdier, fant { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM-eksport trenger fullstendige TLE-er (linje 1 + linje 2); denne blokken har ingen

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

engine-e-optical-atmosphere-scenario-must-be-in = { $n } må ligge i [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg må ligge i [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave må være "plane" eller "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction må være "downlink" eller "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = oppføringene i availability_targets_pct må ligge i (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h må være høyst 8760 (ett år)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } steg er over de { $MAX_STEPS } et resultat rommer; øk step_s eller forkort duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = ukjent klokkeklasse "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = hvert sted trenger et navn

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = sted { $name }: breddegrad/lengdegrad utenfor området

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = sted { $name }: altitude_m må ligge i [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm ved { $elevation_deg } deg elevasjon, margin { $margin0 } dB før atmosfæren; beste sted { $scn } { $v5 } %; { $order }-stedsnettverk { $last } % uavhengig / { $last2 } % korrelert vær (MODELLED, veiledende)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = RINEX-blokken ble tolket, men inneholdt ingen støttede efemerider

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg må ligge i [-90, 90] og alle felt må være endelige

engine-e-orbit-no-satellites-to-export = ingen satellitter å eksportere

engine-e-orbit-time-step-must-be-positive = time.step_s må være positiv for SP3-eksport

engine-e-orbit-time-step-must-be-positive-2 = time.step_s må være positiv for OEM-eksport

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } må være positiv; fikk { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s må være endelig og ikke-negativ

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate må være endelig og ikke-negativ

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = spooferens minimumselevasjon må ligge i [0, 90) grader

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns for kryssjekken må være endelig og ikke-negativ

engine-orbital-timing-the-in-plane-neighbour-degrees = naboen i samme plan, { $v1 } grader foran, er utenfor fotavtrykket til én enkelt spoofer ({ $v2 } grader på tvers)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = naboen i samme plan, { $v1 } grader foran, kan være innenfor fotavtrykket til samme spoofer ({ $v2 } grader på tvers), så begge klokkene kan trekkes sammen

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = mangler inndatafil

engine-e-osnma-cli-max-time-error-has-no = --max-time-error har ingen effekt uten --reference-time

engine-e-osnma-cli-not-number = ikke et tall: { $s }

engine-e-osnma-cli-public-key-must-be-id = offentlig nøkkel må være ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = typen på offentlig nøkkel må være p256 eller p521

engine-e-osnma-cli-unknown-format = ukjent format { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } er ikke tekst; bruk --format ubx for en UBX-strøm

engine-e-osnma-cli-vector-csv-needs-start-gst = en vektor-CSV trenger --start-gst eller et datert filnavn

# legal: native review
engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    feil: kan ikke lese { $input }: { $e }

# legal: native review
engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA-verifisering
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = inndata: { $input } ({ $pages } sider)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: { $frames } rammer; { $inav_pages } I/NAV-sider dekodet, { $pages } plassert i tid ({ $bad_crc } ugyldig CRC, { $unstamped } kan ikke plasseres, { $time_conflicts } tidskonflikter)

engine-osnma-cli-overall-nma-status = samlet: { $status_word }   NMA-status: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALARM: en verifisert OSNMA-alarmmelding ble mottatt. Slutt å bruke OSNMA-data; ingenting rapporteres som autentisert.

engine-osnma-cli-freshness-not-enforced-no-reference = ferskhet: IKKE håndhevet. Ingen referansetid ble oppgitt, så tidene for underrammene hentes fra inndataene, og en avspilling av gamle data ville bli autentisert.

engine-osnma-cli-freshness-sub-frames-within-of = ferskhet: underrammer innenfor { $max_err } s fra referansetiden { $v2 } brukes; { $set_aside } ble lagt til side. En referansetid er ett enkelt tidspunkt.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satellitt  status          autentisert    feilet  ventende  forkastet  sist autentisert

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epoke (tag-underramme)     tx   data  adkd  ctr  resultat

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = linje { $v1 }: forventet 3 felt

engine-e-osnma-input-line-bad-svid = linje { $v1 }: ugyldig SVID

engine-e-osnma-input-line-bad-bit-count = linje { $v1 }: ugyldig antall bit

engine-e-osnma-input-line-data-is-not-hex = linje { $v1 }: dataene er ikke hex

engine-e-osnma-input-line-bit-count-does-not = linje { $v1 }: antall bit samsvarer ikke med dataene

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = tidstoleransen må være under én underramme ({ $SUBFRAME_S } s), fikk { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834-refraksjon er definert for stasjonshøyder fra 0 til 3 km; fikk { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s og step_s må være positive

engine-e-passes-station-lat-deg-must-be = station_lat_deg må ligge i [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg må ligge i [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours må være endelig og positiv

engine-e-passes-step-must-be-finite-and = step_s må være endelig og positiv

engine-passes-passes-pass-es-of-km = passes: { $passes } passering(er) av en bane på { $altitude_km } km / { $inclination_deg }° over ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° på { $duration_hours } h; { $total_access_s } s total tilgang (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = for kort { $record }-post: { $line }

engine-e-precise-products-bad-number-in = ugyldig tall { $s } i { $line }

engine-e-precise-products-bad-field-in = ugyldig felt { $s } i { $line }

engine-e-precise-products-bad-antex-epoch = ugyldig ANTEX-epoke { $s }

engine-e-precise-products-bad-offset = ugyldig forskyvning { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = efemerideleverandøren har ingen geosentrisk { $name } ved JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D-feil RMS { $rms } m (maks { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS etter tilpasning { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } sat nav | { $epochs_solved }/{ $epochs_total } epoker løst | gjennomsnittlig { $mean_n_used } sat, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Enkeltpunktsposisjonering — 3D-feil mot oppmålt koordinat (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Enkeltpunktsposisjonering — RMS for residual etter tilpasning ({ $mean_postfit_rms_m } m i gjennomsnitt)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = RunOutputs array-tilgangsmetoder trenger NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } er ikke en numerisk array (en liste med tall, eller med like lange lister med tall)

engine-e-python-is-not-non-empty-list = { $path } er ikke en ikke-tom liste med poster

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-e-python-and-must-be-the-same = i og q må ha samme lengde ({ $i } mot { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: ikke fanget (statistikk { $statistic } < terskel { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } (utforming, PRN)-kanaler; høyst 256 per sveip

engine-python-not-acquired-statistic-threshold = { $code }: ikke fanget (statistikk { $statistic } < terskel { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] trenger `label`

engine-e-python-runs-needs-result = runs[{ $i }] trenger `result`

engine-e-python-must-be-between-and-32 = { $name } må være mellom 0 og 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | seed { $seed } | v{ $engine_version } | kvante vinner { $value }/{ $foms } FoM-er | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } fra { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = ukjent baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = ukjent candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = ADEV taus/verdier må være endelige og > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | kandidat { $candidate_source } | tidssynkronisering-holdover { $timing_holdover_s }s mot { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | treghet { $inertial_holdover_s }s mot { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | resiliens-drift { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = RINEX-klokkefilen oppgir tidssystemet { $id }, som denne leseren ikke kjenner (kjente: { $known_clock_time_systems }); avviser den heller enn å lese epokene som GPS-tid

engine-e-realdata-clk-rinex-clock-file-has-satellite = RINEX-klokkefilen har satellittsystemet { $other } og oppgir ingen TIME SYSTEM ID; avviser å gjette tidssystemet for epokene

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX-klokkefiler oppgir ulike tidssystemer ({ $s } og { $ts }); avviser å slå dem sammen på én tidsakse

engine-e-realdata-clk-no-as-or-ar-records = ingen AS- eller AR-poster for { $id }

engine-e-realdata-clk-short-circular-row = for kort Circular T-rad: { $t }

engine-e-realdata-clk-bad-value-in = ugyldig verdi { $s } i { $t }

engine-e-realdata-clk-no-section-mjd-header-found = fant ingen MJD-header for Section 1

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = uavsluttet slutt-tagg

engine-e-realdata-ion-sdr-unbalanced-closing-tag = ubalansert slutt-tagg

engine-e-realdata-ion-sdr-unterminated-tag = uavsluttet tagg

engine-e-realdata-ion-sdr-attribute-value-missing = attributtverdi mangler

engine-e-realdata-ion-sdr-element-outside-the-document = element utenfor dokumentet

engine-e-realdata-ion-sdr-text-outside-the-document = tekst utenfor dokumentet

engine-e-realdata-ion-sdr-element-left-open = { $stack } element(er) står åpne

engine-e-realdata-ion-sdr-expected-one-root-element-found = forventet ett rotelement, fant { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = ukjent frekvensformat { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = kodingen { $other } støttes ikke

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } strømmer: bare filer med én strøm leses

engine-e-realdata-ion-sdr-block-of-cycles-with-header = en blokk på { $cycles } sykluser med header eller footer gjentas; bare én enkelt blokk som spenner over filen leses

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = blokk på { $words_per_chunk } ord à { $word_bytes } bytes

engine-e-realdata-ion-sdr-unsupported-sample-format = ikke støttet samplingsformat { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = kvantisering { $quantization } i { $packed_bits } pakkede bit per sample

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = en samplingsfrekvens på { $sample_rate_hz } Hz er ikke et helt multiplum av ratefaktoren { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = en blokk inneholder ingen hel lump

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = sampler { $start }..{ $v1 } forespurt, filen inneholder { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = uleselig CRD-versjon { $f }

engine-realdata-llr-crd-crd-format-version-is-not = CRD-formatversjon { $v } støttes ikke (bare 1 og 2 deler den feltrekkefølgen for post 11 som denne leseren bygger på)

engine-realdata-llr-crd-unreadable-station-id = uleselig stasjons-id { $f }

engine-realdata-llr-crd-unreadable-time-scale = uleselig tidsskala { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD-epokens tidsskala { $time_scale } er ikke en av de tre som formatspesifikasjonen sier at analytikere godtar (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); nekter å lese den som UTC

engine-realdata-llr-crd-unreadable-h4-field = uleselig h4-felt { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = uleselig felt { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = uleselig epokehendelse { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = ikke-fysisk flytid { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = kan ikke lese normalpunktmappen { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = ingen *.npt-normalpunktfiler i { $dir } — dette scenarioet leser virkelige arkiverte målinger og kjører ikke uten dem

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = ugyldig tall '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM har en dimensjon på null

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = koding { $encoding }: en LuGRE-batch er toerkomplement

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bytes: kortere enn IQS-headeren

engine-e-realdata-lugre-not-an-iqs-frame = ikke en IQS-ramme: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = samplingsfrekvens: metadata { $sample_rate_hz } Hz, header { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = kvantisering: metadata { $quantization } bit, header { $quant_bits } bit

engine-realdata-lugre-centre-frequency-metadata-hz-header = senterfrekvens: metadata { $center_freq_hz } Hz, header { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = mellomfrekvens: metadata { $translated_freq_hz } Hz, header { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = antall sampler: metadatalayouten gir { $layout }, header { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = header/footer: metadata { $header_bytes }/{ $footer_bytes } bytes, format { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = fillengden { $file_len } er ikke header + { $value } samplebytes + footer

engine-realdata-lugre-field-missing = feltet { $key } mangler

engine-e-realdata-lugre-field-unreadable = feltet { $key } er uleselig

engine-realdata-lugre-raw-line = RAW-linje { $v1 }: { $e }

engine-realdata-lugre-acq-line = ACQ-linje { $v1 }: { $e }

engine-realdata-lugre-nav-line = NAV-linje { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK-rad { $v1 }: uleselig

engine-e-realdata-lugre-clk-row-columns-expected = CLK-rad { $v1 }: { $v } kolonner, forventet 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = tolk JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = forventet et JSON-objekt på øverste nivå

engine-e-realdata-yunnan-missing-recordtime-array = recordTime-tabellen mangler

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = kan ikke lese EOP-filen { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s må være endelig og ikke-negativ, fikk { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = kan ikke lese EOP-filen i den senere utgaven { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = TOM, og med vilje: en rad med predikert mot endelig verdi trenger en utstedelsesepoke med et KOMPLETT tilpasningsvindu på { $window_days } dager bak seg og en publisert endelig Bulletin B-verdi ved målepoken. Inndataene som gjelder ({ $eop_source }) har ingen epoke som dekker begge vilkårene. Forkort `operational_window_days`, eller oppgi en lengre virkelig finals2000A-serie — ingen rad lages for å fylle tabellen.

engine-realtime-frame-eop-measured-over-the-real-series = Målt over den virkelige serien som gjelder ({ $eop_source }). Hver rad er en ekte prediksjonsfeil: en prognose for T+h laget fra raske Bulletin A-rader ved eller før T, scoret mot den SENERE PUBLISERTE endelige Bulletin B-verdien ved T+h. Persistens scores over nøyaktig samme epokesett mot nøyaktig samme endelige verdier, så de to kolonnene skiller seg i prediktoren og i ingenting annet. `improvement_factor` under 1 betyr at den operative prediktoren er VERRE enn persistens ved den horisonten, og rapporteres slik.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Målt over et ekte par med to utgaver: utgaven slik den ble utstedt ({ $eop_source }) har virkelige Bulletin A-prediksjoner forbi sin egen datagrense, og den arkiverte senere utgaven ({ $c }) har de endelige Bulletin B-verdiene disse datoene til slutt fikk. Tre prognoser scores mot den endelige verdien — selve den arkiverte Bulletin A-prediksjonen, denne cratens tilpasning i operativ stil over utgaven slik den ble utstedt, og persistens ved datagrensen.

engine-realtime-frame-eop-empty-and-deliberately-so-later = TOM, og med vilje: en senere utgave ble oppgitt ({ $c }), men ingen dato finnes både som Bulletin A-PREDIKSJON i filen slik den ble utstedt ({ $eop_source }) og som ENDELIG Bulletin B-verdi i den senere, ved noen forespurt horisont. Ingen rad syntetiseres.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = TOM, og med vilje. Å score en EKTE ARKIVERT prediksjon krever to utgaver av samme finals2000A-produkt; denne kjøringen fikk én ({ $eop_source }). Depotet leverer ingen arkivert tidligere utgave, og en lages IKKE ved å forstyrre utgaven det har — et syntetisert arkiv ville gjort hvert tall i denne tabellen til en måling av forstyrrelsen. Oppgi en virkelig arkivert senere utgave via `eop_finals2000a_later` for å fylle den. Inntil da finnes de ekte feilene mellom predikert og endelig verdi som denne rapporten har, i `table5_operational_vs_persistence`, der prognosen er denne cratens egen og referansen er den senere publiserte endelige Bulletin B-verdien.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabell 1: etterprosessering { $c } m ({ $c2 } ms UT1) ↔ sanntid { $c3 } m ({ $c4 } ms UT1) | Tabell 2: endelig gulv { $floor } ms → { $far }-dagers { $far2 } ms | budsjett totalt { $total_m } m ({ $total_time_ns } ns) | L19 momentarm + L18 virkelige data (prøvd mot en uavhengig ekstern referanse), OD-kov (beregnet fra en modell)

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

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Målt over et ekte par med to utgaver: den Bulletin A-PREDIKERTE UT1 i filen slik den ble utstedt ({ $eop_source }) differensiert mot den til slutt ENDELIGE Bulletin B-verdien i den arkiverte senere utgaven ({ $c }), ved { $predicted_vs_final } horisont(er).

engine-realtime-frame-eop-empty-and-deliberately-so-an = TOM, og med vilje: en arkivert senere utgave ble oppgitt ({ $c }), men ingen dato finnes både som Bulletin A-PREDIKSJON i filen slik den ble utstedt ({ $eop_source }) og som ENDELIG Bulletin B-verdi i den senere, ved noen forespurt horisont, så det finnes ingen residual mellom predikert og endelig verdi å rapportere. Ingen rad syntetiseres.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = TOM, og med vilje: en residual mellom predikert og endelig verdi krever TO utgaver av samme finals2000A-produkt. Denne kjøringen fikk én ({ $eop_source }). Bulletin A-prediksjonsradene i den gjelder fremtidige datoer som ennå ikke har noen endelig Bulletin B-verdi, så residualen finnes ikke å måle, og ingen er funnet på her. Oppgi en arkivert senere utgave via `eop_finals2000a_later` for å fylle denne tabellen. Inntil da er veksten over flere dager som rapporteres i `table2_error_vs_horizon` PERSISTENS-prediktoren scoret over de virkelige endelige verdiene — en virkelig målt feil, men en prediktor beregnet fra en modell, og ikke IERS Bulletin A-prediksjonens residual.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = en fartøyvurdering trenger [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = utdraget er { $excerpt } bytes; grensen er { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = utdraget inneholder mer enn { $MAX_EXCERPT_EPOCHS } epoker; kutt det kortere

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = utdraget slutter inne i kalibreringsvinduet på { $calibration_s } s ({ $epochs } epoker): ingenting ble scoret

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = ingen UTC-merket epoke i UBX-loggen

engine-e-receiver-trust-calibration-no-scenario-json-under = ingen scenario.json under { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: Pfa på tilbakeholdte rene data <= { $B1_MAX_PFA } (kalibrert: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } må være endelig og > 0 (fikk { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel må være endelig og >= 0 (fikk { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used må være minst 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg må ligge i [0, 90] (fikk { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg må ligge i (0, 360] (fikk { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points må ligge i [0, 100] (fikk { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio må være endelig og > 1 (fikk { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor må ligge i (0, 100] (fikk { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) ligger under scorens degraded_min ({ $degraded_min }): geometrien alene kunne nå det ikke-pålitelige båndet

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    { $n_used ->
        [one] geometri { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satellitt{ $v6 }
       *[other] geometri { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satellitter{ $v6 }
    }


engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: geometrifradraget regnes som en inkonsistens

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: rapportert, ikke scoret (geometrien er ikke dårlig)

engine-receiver-trust-geometry-not-scored-the-score-deducts = ikke scoret (scoren trekker bare fra over HDOP { $hdop_max }, PDOP { $pdop_max } eller under { $min_used } satellitter)

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] utledet fra { $n } loggført satellitt
       *[other] utledet fra { $n } loggførte satellitter
    }


engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] slik mottakeren rapporterer det, { $n } satellitt brukt
       *[other] slik mottakeren rapporterer det, { $n } satellitter brukt
    }


engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = den oppgitte HDOP { $fmt_dop } avviker fra HDOP { $fmt_dop2 } utledet fra den oppgitte himmelen, utover toleransen

engine-receiver-trust-geometry-satellites-in-view-but-not = satellitter i sikte, men ikke sporet ({ $g } av { $in_view } ved eller over { $low_elev_deg } deg): signalmiljø, ikke geometri

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } satellitt, færre enn { $min_used }
       *[other] { $n } satellitter, færre enn { $min_used }
    }


engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } over { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } over { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satellitter bak den oppgitte horisontlinjen

engine-receiver-trust-geometry-every-satellite-in-one-half = alle satellitter i én halvdel av himmelen (hull { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = svekket av geometri: { $parts } ({ $from }); ikke en inkonsistens

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = loggen inneholder ingen epoker: ingenting i den var lesbart som { $name } ({ $skipped_records } poster hoppet over som ødelagte eller ikke tolkbare); sjekk formatinnstillingen

engine-receiver-trust-ingest-gps-week-tow = GPS-uke { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS-uke { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (dato ikke i loggen)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } må være endelig og >= 0 (fikk { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s må være over 0

engine-e-receiver-trust-live-invalid-session = ugyldig økt: { $e }

engine-receiver-trust-live-no-score-could-be-produced = ingen score kunne produseres: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = ingen GNSS-SDR synchro- eller pvt-post var lesbar ({ $skipped } linjer hoppet over); se integrations/gnss-sdr/README.md for linjeformatet

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = IMU-filen er tom

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: ingen kolonne `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: ingen kolonne `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = IMU-filen inneholder ingen lesbar sample

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis må være 0, 1 eller 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean må være endelig

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] loggen har { $n } sample; minst { $MIN_SAMPLES } trengs for en Allan-tilpasning
       *[other] loggen har { $n } sampler; minst { $MIN_SAMPLES } trengs for en Allan-tilpasning
    }


engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = loggens tid går ikke fremover

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not =
    { $n ->
        [one] samplingsintervallet er ikke jevnt ({ $uneven } av { $n } intervall avviker med over 25 %): resample loggen først
       *[other] samplingsintervallet er ikke jevnt ({ $uneven } av { $n } intervaller avviker med over 25 %): resample loggen først
    }


engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = loggen er for kort til å danne en Allan-kurve

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = den tidlige stigningen på kurven for { $name } er { $v }, ikke omtrent -0.5: hvit støy dominerer ikke (står sensoren stille?), så støykoeffisienten er upålitelig

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = kurven for { $name } er for kort til å sjekke stigningen

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

engine-receiver-trust-machines-novatel-gps-week-tow = GPS-uke { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = ingen BESTPOS-, RANGE- eller RXSTATUS-logg var lesbar ({ $skipped } poster hoppet over)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = ingen gyldig RTCM 3-ramme ble funnet ({ $skipped } kandidater feilet CRC)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } må være endelig og > 0 (fikk { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard må ligge i (0, 1) (fikk { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac må ligge i [0, 1] (fikk { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } må ligge i (0, 1) (fikk { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats må være minst 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s må være minst 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = monitor config: ukjent profil "{ $other }"; kjente: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = monitor config: { $name } må være endelig og > 0 (fikk { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = monitor config: jam_ind_threshold må være endelig

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = monitor config: mask_deg må ligge i [-90, 90) (fikk { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = monitor config: raim_pfa må ligge i (0, 1) (fikk { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = monitor config: cn0_min_sats må være minst 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = monitor config: sats_lost må være minst 1

engine-receiver-trust-monitors-the-receiver-own-set-against = mottakerens eget { $self_report_source }-sett mot Kshanas monitorer; ingen av dem er en referanse, overensstemmelse er ikke validering

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = mottakerens tidslinje har en ikke-endelig epoketid

engine-e-receiver-trust-monitors-the-log-is-shorter-than = loggen er kortere enn kalibreringsvinduet: { $calibration_epochs } epoke(r) før { $cal_s } s (loggen spenner over { $span } s); minst 3 trengs for å danne grunnlinjen

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } må ligge i ({ $lo }, { $hi }] (fikk { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } gjelder bare for kind = "vessel" (kind er "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = kan ikke lese { $path }: WebAssembly-bygget har ikke noe filsystem; oppgi filen innebygd som `text` eller `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` er ikke gyldig standard base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: oppgi én av `path`, `text` eller `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: oppgi bare én av `path`, `text` eller `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } må være et positivt tall, fikk { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = hendelse { $label }: onset_s må være et ikke-negativt tall

engine-e-receiver-trust-scenario-event-end-must-be-after = hendelse { $label }: end_s må være etter onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg og time_offset_s må være endelige

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = pålitelig hele veien: ingen monitor slo alarm i { $after_cal } epoker etter kalibreringen

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = første alarm ved { $t } s; ikke pålitelig i { $untrusted_epochs } og svekket i { $degraded_epochs } av { $after_cal } epoker etter kalibreringen

engine-receiver-trust-scenario-of-stated-events-detected-within = { $events_detected } av { $events_evaluable } oppgitte hendelser oppdaget innen { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = { $predictions_agreeing } av { $predictions_evaluable } C/N0-prediksjoner innen { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = tillitsscore laveste { $min }, siste { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = scenario { $r } | receiver-trust | { $format_name }-logg, { $epochs } epoker over { $duration_s } s | monitorer { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = dette er et { $k }-scenario, ikke et receiver-trust-scenario

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } må være endelig (fikk { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: krever 0 < degraded_min < nominal_min <= 100 (fikk { $degraded_min } og { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s må være endelig og >= 0 (fikk { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: krever 0 <= onset_ratio < full_ratio (fikk { $onset_ratio } og { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: vekten til { $m } må ligge i [0, 100] (fikk { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s må være endelig og positiv

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg må ligge i (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 må være endelig og positiv

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m og rho0_kg_m3 må være endelige og positive

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m må ligge i [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = gjeninntreden (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> topp { $v3 } g ved { $v4 } km, { $velocity_at_peak_deceleration } m/s; oppvarmingen topper seg ved { $velocity_at_peak_heating } m/s; punktmasse (tyngdekraft, krumning, US76) topp { $peak_deceleration_g } g (MODELLED ballistisk, ingen aerotermisk)

## src/registry.rs

engine-e-registry-unknown-scenario-id = ukjent scenario-id: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = TRL-båndet ({ $lo },{ $hi }) er ikke velformet (krever 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = En påstand beregnet fra en modell (kun simulering) kan ikke være representativ over TRL { $MODELLED_TRL_CEILING } (bånd hi={ $hi }); høyere TRL er et hull, ikke et simuleringsresultat

engine-representativeness-representativeness-representative-for-trl = Representativitet [{ $status }] — { $claim } (representativ for TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = deklarert({ $arch }) x gjennomsnittlig kildekvalitet

engine-resilience-score-weakest-rpcf-sub-score-bounded = svakeste RPCF-delscore = { $min_sub }; avgrenset degradering = { $bounded } (begrenses til nivå 2 hvis ikke avgrenset)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = ikke støttet navigasjonspost-header { $head }: en linje som begynner med '>' er en RINEX 4-posthheader, ikke en RINEX 3-navigasjonspost

engine-e-rinex-bad-prn-in = ugyldig PRN i { $head }

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4-navigasjon: forventet en '>'-posthheader, fant { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4-posten { $head } har { $body } linjer, en { $msg }-efemeride trenger 8

engine-e-rinex-rinex-record-is-followed-by = RINEX 4-posten { $head } etterfølges av { $body }, ikke { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = ugyldig { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = RINEX-observasjonsfilen har ingen END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = RINEX-observasjonsfilen inneholdt ingen epokeposter

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s må være endelig og > 0 (fikk { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s må være endelig og > 0 (fikk { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) må ikke overstige time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps = tidsrutenettet er for stort: { $n } steg overstiger MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); bruk et grovere steg eller kortere varighet

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = samplingsfrekvensen er kommensurabel med kodefrekvensen ({ $samples_per_chip } sampler/chip, { $offset_from_integer_samples } sampler fra et helt tall): kodereplikaen med nullteordens holding kan ikke oppløse en kodefaseendring under { $dead_band_chips } chip, så Early/Late-diskriminatoren blir en trappetrinnskurve med ett samples dødbånd i stedet for en trekant, og DLL-en stabiliserer seg på feil forsinkelse. Forskyv samplingsfrekvensen bort fra det hele multiplumet (5 MHz er { $lit_4_8876 } sampler/chip; 25 MHz er { $lit_24_4379 }), eller oversampl langt nok til at dødbåndet ligger under kodefasenøyaktigheten du trenger.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = SGP4-feilkode { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = ikke støttet SigMF core:datatype { $other }: denne leseren håndterer de komplekse typene cf32_le, ci16_le og ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: bare opptak med én kanal leses

engine-e-sigmf-cannot-serialise-sigmf-metadata = kan ikke serialisere SigMF-metadata: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = ugyldig SigMF-utvidelsesnavneområde { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } utvidelsestabeller for merknader for { $annotations2 } merknader

engine-e-sigmf-extension-key-is-not-in = utvidelsesnøkkelen { $k } er ikke i navneområdet { $ns }

engine-e-sigmf-extension-key-is-already-present = utvidelsesnøkkelen { $k } finnes allerede

engine-e-sigmf-global-is-not-an-object = global er ikke et objekt

engine-e-sigmf-annotations-is-not-an-array = annotations er ikke en tabell

engine-e-sigmf-annotation-is-not-an-object = merknaden er ikke et objekt

engine-e-sigmf-invalid-sigmf-metadata-json = ugyldig SigMF-metadata-JSON: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = SigMF-opptaket oppgir ingen positiv core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = SigMF-opptaket starter ved sample { $start }, utenfor de { $data } samplene i dataene

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } må ligge i [0, 90) grader, fikk { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } må være et endelig tall, fikk { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: en canyon trenger width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m må være positiv, fikk { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: canyon-høyder og antenna_m må være ikke-negative

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m må være positiv, fikk { $l }

engine-e-skyline-skyline-table-is-empty = skyline: tabellen er tom

engine-e-skyline-skyline-table-has-rows-over = skyline: tabellen har { $rows } rader, over grensen på { $MAX_TABLE_ROWS } rader

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: tabellens asimut { $az } ligger utenfor [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: tabellens asimuter må øke strengt ({ $az } følger etter { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: mer enn { $MAX_SECTORS } sektorer

engine-e-skyline-skyline-the-sector-az-from = skyline: sektoren az_from = { $az_from } til az_to = { $az_to } er tom (en full sirkel er en tabell eller masken)

engine-e-skyline-skyline-more-than-terrain-points = skyline: mer enn { $MAX_TABLE_ROWS } terrengpunkter

engine-e-skyline-skyline-terrain-distance-must-be = skyline: terrengets distance_m må være positiv, fikk { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance }; med felt overstyrt eller lagt til av { $user }

engine-skyline-stated-input = Oppgitt inndata: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = ukjent skyline-forhåndsinnstilling "{ $name }"; kjente forhåndsinnstillinger: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = et datablad trenger minst to Allan-deviasjonspunkter

engine-e-slot-timing-datasheet-point-must-have-positive = databladpunktet ({ $t }, { $s }) må ha en positiv midlingstid og en positiv Allan-deviasjon

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s må være et positivt antall sekunder

engine-e-slot-timing-phase-record-needs-at-least = en fasepost trenger minst 32 sampler for å tilpasse en støymodell; fikk { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = faseposten inneholder en ikke-endelig sample

engine-e-slot-timing-the-phase-record-yields-fewer = faseposten gir færre enn tre Allan-deviasjonspunkter

engine-e-slot-timing-must-be-finite-and-non = { $name } må være endelig og ikke-negativ; fikk { $v }

engine-e-slot-timing-the-slot-guard-must-be = slot-guarden må være en positiv tid

engine-e-slot-timing-sigma-must-be-positive = k_sigma må være positiv

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset må være endelig

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k må være endelig

engine-e-slot-timing-give-exactly-one-of-oscillator = oppgi nøyaktig én av oscillator.class, oscillator.preset, oscillator.datasheet eller oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = ukjent oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = ukjent oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = standard for klassen { $c }: sigma_y(1 s) fra { $c2 }; rødstøygulv syntetisert to og fire dekader under det (en antakelse, ikke en måling)

engine-slot-timing-fitted-to-the-allan-deviation = tilpasset Allan-deviasjonsmaksimaene i { $document }, skalert til å ligge på eller over hvert punkt

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] tilpasset den overlappende Allan-deviasjonen til en post på { $n_samples } sample ved { $tau0_s } s, i IEEE Std 1139-grunnlaget for frekvensmodulasjon
       *[other] tilpasset den overlappende Allan-deviasjonen til en post på { $n_samples } sampler ved { $tau0_s } s, i IEEE Std 1139-grunnlaget for frekvensmodulasjon
    }


engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } kilde): guard { $c } ns ved k={ $k_sigma } brytes { $fmt_s } etter en posisjonsbestemmelse ({ $fmt_s2 } igjen); posisjonsbestemmelse minst hver { $fmt_s3 } ({ $fixes_per_day } per døgn); dominerende ledd: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epoken '{ $s }' må være YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = epoke '{ $s }': ugyldig { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb må være endelig

engine-e-solar-system-table-must-be-auto-table1 = table må være auto, table1 eller table2; fikk '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = ingen efemeride for lenken { $name } til { $name2 } ved JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = epoke JD { $jd } TDB ligger utenfor 3000 f.Kr. til 3000 e.Kr., området for Standish-tabellene

engine-e-solar-system-track-points-must-be-to = track_points må være 8 til 2000; fikk { $n_track }

engine-e-solar-system-unknown-observer-body = ukjent observatørlegeme '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies må navngi minst ett legeme

engine-e-solar-system-unknown-body = ukjent legeme '{ $n }'

engine-e-solar-system-no-position-for-at-jd = ingen posisjon for { $name } ved JD { $jd } TDB (Pluto gjelder bare 1800 e.Kr. til 2050 e.Kr.)

engine-e-solar-system-no-standish-elements-for = ingen Standish-elementer for { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliosentrisk tilstand lest av motorens egen leser

engine-e-solar-system-unknown-link-body = ukjent lenkelegeme '{ $from }'

engine-e-solar-system-unknown-link-body-2 = ukjent lenkelegeme '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = en lenke trenger to ulike legemer; fikk { $name }

engine-solar-system-solar-system-at-jd-tdb =
    { $n_bodies ->
        [one]
            Solsystemet ved { $input } (JD { $jd_tdb } TDB), { $n_bodies } legeme, observatør { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
       *[other]
            Solsystemet ved { $input } (JD { $jd_tdb } TDB), { $n_bodies } legemer, observatør { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
    }


engine-solar-system-light-time = lystid { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }lenke { $from } -> { $to }: én vei { $one_way_light_time_s } s, tur-retur { $two_way_light_time_s } s, Shapiro { $l } us, Sol { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = epoke { $input } · { $standish_table } · posisjoner fra Standish-elementene

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = epoken trenger 6 tidsfelt, fikk { $tokens }

engine-e-sp3-bad-second = ugyldig sekund: { $tokens }

engine-e-sp3-record-needs-values-missing-column = posten trenger 4 verdier, kolonne { $v1 } mangler

engine-e-sp3-bad-number = ugyldig tall: { $field }

engine-e-sp3-empty-sp3-input = tom SP3-inndata

engine-e-sp3-first-line-is-not-an = første linje er ikke en SP3-header: { $first }

engine-e-sp3-unsupported-sp3-version-in = ikke støttet SP3-versjon i { $first }

engine-e-sp3-missing-epoch-count-on-header = antall epoker mangler på header-linje 1

engine-e-sp3-record-has-no-satellite-id = posten har ingen satellitt-id: { $line }

engine-e-sp3-position-record-before-any-epoch = posisjonspost før noen epokeheader

engine-e-sp3-sp3-file-contained-no-epoch = SP3-filen inneholdt ingen epokeposter

engine-e-sp3-bad-accuracy-exponent-in = ugyldig nøyaktighetseksponent { $f } i { $line }

engine-e-sp3-bad-header-accuracy = ugyldig header-nøyaktighet { $t }

engine-e-sp3-short-line = for kort %f-linje { $line }

engine-e-sp3-bad-base-in = ugyldig %f-base i { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = versjonen overstiger 3 bit

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID overstiger 11 bit (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count overstiger 14 bit (0..=16383)

engine-e-space-packet-data-field-must-be-at = datafeltet må være minst én oktett

engine-e-space-packet-data-field-exceeds-65536-octets = datafeltet overstiger 65536 oktetter

engine-e-space-packet-packet-shorter-than-the-octet = pakken er kortere enn headeren på 6 oktetter: { $bytes } bytes

engine-e-space-packet-declared-data-length-header-octets = deklarert datalengde { $data_len } (+6 header) = { $total } oktetter, men bufferet er { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC coarse-oktetter { $coarse_octets } utenfor 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = CUC fine-oktetter { $fine_octets } utenfor 0..=3 (det utvidede P-feltet støttes ikke)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-felt { $p }: utvidet P-felt støttes ikke

engine-e-space-packet-field-time-code-id-is = P-felt { $p }: tidskode-id { $id } er ikke CUC

engine-e-space-packet-field-is-not-cds-field = P-felt { $p } er ikke et CDS P-felt

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-felt { $p }: reservert sub-ms-kode 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC coarse { $coarse } passer ikke i { $c } oktetter

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] CUC fine { $fine } passer ikke i { $n } oktett
       *[other] CUC fine { $fine } passer ikke i { $n } oktetter
    }


engine-e-space-packet-cds-days-do-not-fit = CDS days { $days } passer ikke i { $f } oktetter

engine-e-space-packet-cds-ms-of-day-above = CDS ms of day { $ms_of_day } over 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS sub-millisecond { $submillis } over { $max_sub }

engine-e-space-packet-time-code-format-and-value = tidskodeformat og verdi hører til ulike koder

engine-e-space-packet-time-code-no-field-octet = tidskode: ingen P-felt-oktett

engine-e-space-packet-time-code-needs-octets-present = tidskoden trenger { $end } oktetter, { $bytes } til stede

engine-e-space-packet-time-code-format-differs-from = tidskodeformatet avviker fra det implisitte P-feltet

engine-e-space-packet-the-format-has-time-code = formatet har et tidskodefelt; ingen oppgitt

engine-e-space-packet-the-format-has-no-time = formatet har ikke noe tidskodefelt

engine-e-space-packet-ancillary-data-is-octets-the = tilleggsdataene er { $ancillary } oktetter; formatet sier { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = en sekundær header må inneholde minst én oktett

engine-e-space-packet-secondary-header-needs-octets-present = den sekundære headeren trenger { $end } oktetter, { $bytes } til stede

engine-e-space-packet-the-format-has-secondary-header = formatet har en sekundær header; ingen oppgitt

engine-e-space-packet-the-format-has-no-secondary = formatet har ingen sekundær header

engine-e-space-packet-secondary-header-flag-disagrees-with = flagget for sekundær header { $v1 } stemmer ikke med formatet

engine-e-space-packet-data-field-shorter-than-the = datafeltet er kortere enn PEC

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } stemmer ikke med pakkens CRC { $crc16_ccitt_false }

engine-e-space-packet-nothing-to-segment-empty-user = ingenting å segmentere: tomme brukerdata

engine-e-space-packet-max-user-octets-must-be = max_user_octets må være minst 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count overstiger 14 bit (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } der { $a } var forventet

engine-space-packet-sequence-count-repeated = sekvenstelleren { $sequence_count } gjentatt

engine-space-packet-sequence-count-gap-after-packet = hull i sekvenstelleren: { $sequence_count } etter { $last } ({ $v2 } pakke(r) mangler)

engine-space-packet-sequence-count-out-of-order = sekvenstelleren er ute av rekkefølge: { $sequence_count } etter { $last }

engine-space-packet-packet-with-no-unit-open = { $f }-pakke uten åpen enhet

engine-space-packet-packet-while-unit-is-open = { $f }-pakke mens en enhet er åpen

engine-e-space-packet-packet = pakke { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = sekvensen slutter med en enhet som fortsatt er åpen (ingen siste pakke)

engine-e-space-packet-apid-must-be-in-2047 = apid må ligge i 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count må være >= 1

engine-e-space-packet-data-len-must-be-in = data_len må ligge i 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = intern feil: avvik i rundtur for koding/dekoding

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: innrammet { $packet_count } CCSDS-133.0 { $v2 }-pakke APID { $apid }, { $total_bytes } oktetter totalt, rundtur eksakt ({ $round_trip_ok })
       *[other] space-packet: innrammet { $packet_count } CCSDS-133.0 { $v2 }-pakker APID { $apid }, { $total_bytes } oktetter totalt, rundtur eksakt ({ $round_trip_ok })
    }


## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 må være endelig og positiv

engine-e-space-weather-f107a-must-be-finite-and = f107a må være endelig og positiv

engine-e-space-weather-kp-must-be-in = kp må ligge i [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km må være ikke-tom

engine-e-space-weather-altitude-km-must-be-finite = høyde { $h } km må være endelig og positiv

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; tetthet x{ $density_activity_factor } ved { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: en { $what }-jammer trenger en positiv bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: en chirp-jammer trenger en positiv sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to navngir et ukjent bånd { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: oppgi enten received_power_dbw, eller eirp_dbw med en positiv range_m (ikke begge)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s må være senere enn on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: samplingsfrekvensen må være positiv

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } må være en potens av to, minst 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } sampler er færre enn ett segment på { $nfft } punkter

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } må være en potens av to, minst 16

engine-e-spectrum-cannot-read-recording-meta-path = kan ikke lese opptakets meta_path { $meta_path }: { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = kan ikke lese opptaksdata { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz må være positiv

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: modulasjonen { $m } kan ikke velges (bare galileo-e1 tar "mboc" eller "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: signalet { $sig } finnes ikke i signalbiblioteket med forhåndsinnstillinger ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: et signal fra en forhåndsinnstilling har sin egen modulasjon; fjern `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: signalet { $sig } oppgir ingen mottatt effekt; oppgi signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: et egendefinert bånd trenger `modulation`, for eksempel "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: et egendefinert bånd trenger signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: oppgi enten `signal` eller `centre_mhz`, ikke begge

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: oppgi rx_bandwidth_mhz (ingen hovedlobe kunne lokaliseres)

engine-e-spectrum-duration-must-be-at-least = duration_s må være minst ett step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } tidsrader er mer enn de 5000 som er tillatt

engine-e-spectrum-at-most-extra-panels = høyst 8 ekstra paneler

engine-e-spectrum-panel-need-max-mhz-min = panel { $name }: f_max_mhz > f_min_mhz og 2 ≤ n_freq ≤ 4096 kreves

engine-e-spectrum-grid-need-max-mhz-min = grid: f_max_mhz > f_min_mhz og 2 ≤ n_freq ≤ 4096 kreves

engine-spectrum-scenario-spectrum-bands-jammers-noise = scenario spectrum | { $bands } bånd | { $jammers } jammere | støygulv { $n0_db } dBW/Hz | dårligste bånd { $name } min C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = scenario spectrum | ingen bånd | støygulv { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples må være mellom 10 og 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: bruk cf32_le eller ci16_le

engine-spectrum-frequency-across-time-down-colour = frekvens vannrett, tid nedover, farge = effekttetthetsspekter (dBW/Hz); støygulv { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = hvert panel har sitt eget frekvensområde, én tidslinje nedover, én fargeskala (dBW/Hz); støygulv { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = referansesystemet { $other } har ingen støttet NAIF-kode

engine-e-spk-writer-segment-name-longer-than-40 = segmentnavnet er lengre enn 40 tegn: { $name }

engine-e-spk-writer-segment-name-has-non-printing = segmentnavnet har tegn som ikke kan skrives ut: { $name }

engine-e-spk-writer-bad-target-for-centre = ugyldig mål { $target } for sentrum { $centre }

engine-e-spk-writer-degree-outside-27 = grad { $degree } utenfor 1..=27

engine-e-spk-writer-type-13-degree-is-not = type 13-grad { $degree } er ikke et oddetall

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] { $states } tilstander for { $n } epoke
       *[other] { $states } tilstander for { $n } epoker
    }


engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } tilstand; grad { $degree } trenger { $value }
       *[other] { $n } tilstander; grad { $degree } trenger { $value }
    }


engine-e-spk-writer-descriptor-start-is-not-before = deskriptorens start er ikke før slutten

engine-e-spk-writer-epochs-are-not-strictly-increasing = epokene øker ikke strengt

engine-e-spk-writer-the-epochs-do-not-cover = epokene dekker ikke deskriptorintervallet

engine-e-spk-writer-type-or-13-segment-carries = et segment av type 9 eller 13 inneholder tilstander, ikke poster

engine-e-spk-writer-type-segment-needs-at-least = et segment av type 3 trenger minst én post

engine-e-spk-writer-type-degree-outside-27 = type 3-grad { $degree } utenfor 0..=27

engine-e-spk-writer-type-interval-length-is-not = type 3-intervalllengde { $intlen } er ikke positiv

engine-e-spk-writer-type-record-has-coefficients-expected = type 3-post { $i } har { $value } koeffisienter, forventet { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = deskriptorens start er etter slutten

engine-e-spk-writer-descriptor-starts-before-the-first = deskriptoren starter før den første posten

engine-e-spk-writer-descriptor-ends-after-the-last = deskriptoren slutter etter den siste posten

engine-e-spk-writer-type-segment-carries-records-not = et segment av type 3 inneholder poster, ikke epoker eller tilstander

engine-e-spk-writer-type-21-segment-needs-at = et segment av type 21 trenger minst én differanselinje

engine-e-spk-writer-difference-line-size-is-not = differanselinjens størrelse { $dlsize } er ikke 4 MAXDIM + 11 med MAXDIM i 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = differanselinjer av ulik størrelse

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] { $epochs } epoker for { $n } differanselinje
       *[other] { $epochs } epoker for { $n } differanselinjer
    }


engine-e-spk-writer-difference-line-epochs-are-not = differanselinjenes epoker øker ikke strengt

engine-e-spk-writer-the-last-difference-line-ends = den siste differanselinjen slutter før deskriptoren

engine-e-spk-writer-zero-step-size-in-difference = steglengde null { $j } i differanselinje { $i }

engine-e-spk-writer-type-21-segment-carries-difference = et segment av type 21 inneholder differanselinjer, ikke tilstander

engine-e-spk-writer-an-spk-needs-at-least = en SPK trenger minst ett segment

engine-e-spk-writer-segment = segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = kommentarlinjen har tegn som ikke kan skrives ut: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = kommentarene trenger { $nchars } tegn; { $v1 } er reservert (øk ncomch)

engine-e-spk-writer-difference-line-orders-out-of = differanselinjens ordener { $kqmax1 } { $kq } er utenfor området

engine-e-spk-writer-zero-step-size-at-index = steglengde null ved indeks { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } utenfor segmentet [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = type 3-segmentet { $name } er for kort

engine-e-spk-writer-type-segment-words-for-rsize = type 3-segmentet { $name }: { $nw } ord for N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = type 21-segmentet { $name } er for kort

engine-e-spk-writer-type-21-segment-words-for = type 21-segmentet { $name }: { $nw } ord for N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segmentet { $name } er for kort

engine-e-spk-writer-segment-words-for = segmentet { $name }: { $nw } ord for N = { $n }

engine-e-spk-writer-segment-is-in-frame = segmentet { $name } ligger i referansesystemet { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = SPK-sentrumskjeden ender ikke

engine-e-spk-writer-no-spk-chain-connects-and = ingen SPK-kjede forbinder { $target } og { $observer } ved ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = epoken { $s } er ikke YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = tidssystemet { $other } støttes ikke (UTC eller TDB)

engine-e-spk-writer-centre-has-no-supported-naif = sentrum { $other } har ingen støttet NAIF-id

engine-e-spk-writer-oem-segment-has-no-data = OEM-segmentet { $name } har ingen datalinjer

engine-e-spk-writer-oem-segment-no = OEM-segment { $idx }: ingen { $k }

engine-e-spk-writer-no-export-settings-for-oem = ingen eksportinnstillinger for OEM-segment { $idx }

engine-e-spk-writer-oem-data-line-has-fields = OEM-datalinjen har { $f } felt: { $line }

engine-e-spk-writer-oem-value = OEM-verdi { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } OEM-segmenter for { $exports } eksportinnstillinger

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (fused) — lag: { $fired }

engine-spoof-detect-single-layer-indication-below-the = indikasjon fra ett enkelt lag ({ $fired }) under den fusjonerte terskelen — bekreftelse trengs

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg må være positiv, fikk { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = panel { $i }: arealet må være >= 0

engine-e-srp-boxwing-panel-outside = panel { $i }: { $name } = { $c } utenfor [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = panel { $i }: absorpsjon + speilende + diffus = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = panel { $i }: normal/akse er null

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = ECOM2-normalmatrisen er singulær eller dårlig betinget

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 min

engine-ssv-check-mod4-min = { $key } MOD4 min

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = heo-forhåndsinnstilling

engine-e-ssv-check-lunar-preset = lunar-forhåndsinnstilling

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = en formasjon trenger minst én etterfølger

engine-e-ssv-formation-duration-min-and-step-must = duration_min og step_s må være positive

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = ingen signaler for de valgte konstellasjonene og båndene

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = ukjent antenne `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = mønster-CSV er tom

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` er ikke et tall i mønster-CSV-en

engine-e-ssv-scenario-pattern-csv-row-has-columns = mønster-CSV-raden `{ $l }` har { $f } kolonner, forventet { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" trenger nøyaktig én av pattern_csv og pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` er ikke booklet, parametric eller table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: oppgi cn0_min_dbhz eller weak_signal, ikke begge

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = bærebølgesløyfen kan ikke holde den oppgitte Doppler-raten ved noen C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` er ikke acquisition, tracking eller both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz må være endelig

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: oppgi nøyaktig én av preset og orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` er ikke leo, meo, geo, heo eller lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: oppgi nøyaktig én av duration_min og duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } må være positiv

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg trenger 1 til 8 endelige forskyvninger

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd kan ikke være negativ

engine-e-ssv-scenario-give-exactly-one-of-shell = oppgi nøyaktig én av [shell], [trajectory] og [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] trenger en [navigation]-tabell for hovedsatellitten

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include og constellations.bands kan ikke være tomme

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km må være over 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels over 5 støttes ikke

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna må være hemisphere eller omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = shell-sveipet støtter bare booklet-sendemønsteret (et formet mønster trenger trajectory-sveipet)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] gjelder for en [trajectory], ikke en [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: oppgi nøyaktig én av preset og orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` er ikke leo, meo, geo, heo eller lunar-transfer

engine-e-ssv-scenario-unknown-preset = ukjent forhåndsinnstilling

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv-skall { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv navigation: posisjons-RMS { $p } samlet, { $p2 } innenfor GNSS-banene, { $p3 } over; lengste opphold { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = etterfølger ved { $offset_deg } deg ({ $baseline_km } km): relativ RMS { $rel_rms_filter_m } m filtrert mot { $rel_rms_from_absolute_m } m fra absolutte posisjonsbestemmelser

engine-ssv-scenario-combined-max-outage-min = { $band } kombinert 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (maks utfall { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv trajectory { $perigee_alt_km } til { $apogee_alt_km } km høyde: { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min og step_min må være positive

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } må være et positivt tall, fikk { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = ingen standardpakke med navnet `{ $id }`; pakkene er: { $ids }

engine-e-standards-pack-pack-manifest = pakkemanifest: { $e }

engine-e-standards-pack-test-duplicate-id = test { $id }: duplisert id

engine-e-standards-pack-test-scenario-is-not-in = test { $id }: scenarioet `{ $s }` finnes ikke i pakken

engine-e-standards-pack-test-scored-test-needs-bar = test { $id }: en scoret test trenger en terskel

engine-e-standards-pack-test-test-that-needs-input = test { $id }: en test som trenger inndata har ingen terskler

engine-e-standards-pack-test-give-either-scenario-or = test { $id }: oppgi enten `scenario` eller `needs_input`, ikke begge og ikke ingen

engine-e-standards-pack-test-supports-unknown-row = test { $id }: gir belegg for en ukjent rad `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id }: ukjent op `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id }: terskelen på { $pointer } trenger nøyaktig én av `value` og `against`

engine-e-standards-pack-row-duplicate-id = rad { $id }: duplisert id

engine-e-standards-pack-row-asks-must-be-short = rad { $id }: `asks` må være en kort omskrivning

engine-e-standards-pack-row-no-test-supports-it = rad { $id }: ingen test gir belegg for den

engine-standards-pack-not-scored-needs-input = ikke scoret: trenger inndata ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = studien har ingen scenarioer å kjøre

engine-e-study-cannot-read-scenario = kan ikke lese scenarioet { $path }: { $e }

engine-e-study-scenario-failed = scenarioet { $path } feilet: { $e }

engine-e-study-scenario-produced-unparseable-json = scenarioet { $path } ga JSON som ikke kan tolkes: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = ugyldig suitemanifest: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = ukjent kilde `{ $o }`: bruk `adsb` eller `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } er { $len } bytes, over grensen på { $limit } bytes

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` er ikke et ISO-8601 UTC-tidspunkt

engine-e-surface-invalid-receiver-trust-session = ugyldig receiver-trust-økt: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` er ikke et ISO-8601 UTC-tidspunkt

engine-e-surface-dataset-custom-needs-licence-licence = datasettet `custom` trenger licence, licence_url og attribution

engine-e-surface-at-least-one-map-is = minst ett kart kreves

engine-e-surface-epoch = epoch: { $e }

engine-e-surface-not-utf = { $suffix }: ikke UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = ukjent scenario-kind `{ $k }`; kind-listen navngir alle kinds

engine-surface-is-not-bundled-it = `{ $name }` er ikke innebygd: den { $why }

engine-surface-no-bundled-scenario-named-the = ingen innebygd scenario med navnet `{ $name }`; eksempellisten navngir de { $v1 } som finnes

engine-e-surface-invalid-toml = ugyldig TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = ukjent eksportformat `{ $format }`; forventet ett av czml, kml, geojson, stk eller sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps gir { $opts } bilder, og høyst { $MAX_ANIMATION_FRAMES } returneres; senk fps eller duration_s, eller skriv en lengre sekvens med kommandolinjen

engine-e-surface-scenario-run-failed = scenariokjøringen feilet: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log navngir en fil `path`; oppgi loggen som `text` eller `base64` (denne flaten leser ingen filer)

engine-e-surface-max-sp-errors-must-be = max_sp_errors må være høyst 20

engine-e-surface-frames-must-be-to = frames må være 1 til { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 må være 0 til 99

engine-e-surface-runs-given-at-most-per = { $runs } kjøringer oppgitt; høyst { $MAX_COMPLIANCE_RUNS } per rapport

engine-e-surface-the-runs-total-bytes-the = kjøringene utgjør til sammen { $total } bytes; grensen for én rapport er { $max_bytes }

engine-e-surface-result-files-given-at-most = { $results } resultatfiler oppgitt, høyst 256

engine-e-surface-result-is-not-json = resultat { $v1 } er ikke JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = ukjent format `{ $o }`: bruk `prometheus`, `cef`, `leef`, `otlp` eller `mqtt`

engine-e-surface-unknown-imu-format-use-csv = ukjent IMU-format `{ $o }`: bruk `csv` eller `euroc`

engine-e-surface-unknown-axis-use-or = ukjent akse `{ $o }`: bruk `x`, `y` eller `z`

engine-e-surface-id-must-be-to-64 = id må være 1 til 64 skrivbare ASCII-tegn uten mellomrom

engine-surface-fitted-from-stationary-imu-log = tilpasset fra en stasjonær IMU-logg, sha256 { $sha }, akse { $axis }, Allan-estimator

engine-e-surface-unknown-input-kind-use-result = ukjent input_kind `{ $o }`: bruk `result` eller `jsonl`

engine-e-surface-the-input-holds-no-trust = inndataene inneholder ingen tillitsepoke

engine-e-surface-the-reply-is-over-the = svaret er over grensen på { $max_bytes } bytes; send færre epoker eller la `syslog_all` stå av

engine-e-surface-otlp-needs-build-with-the = otlp trenger en bygging med funksjonen `otlp`

engine-e-surface-the-pack-and-token-total = pakken og tokenet utgjør til sammen { $total } bytes; grensen er { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = tidsstempeltokenet er tomt

engine-e-surface-must-be-64-lower-case = { $what } må være 64 heksadesimale siffer med små bokstaver

engine-e-surface-must-be-32-bytes = { $what } må være 32 bytes

engine-surface-verified-against-the-public-key = VERIFIED mot den offentlige nøkkelen du oppga (signatørens fingeravtrykk { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: hashene og signaturen er konsistente med nøkkelen { $fp }, som pakken selv navngir. Oppgi signatørens offentlige nøkkel, hentet fra signatøren på en annen måte, for å fastslå hvem som signerte den.

engine-e-surface-files-must-be-json-object = files må være et JSON-objekt med navn til innhold

engine-e-surface-pack-has-at-most-64 = en pakke har høyst 64 filer

engine-e-surface-file-name-must-be-plain = filnavnet `{ $k }` må være et rent navn

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` er ikke gyldig standard base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = ukjent sveipeparameter: { $other }

engine-e-sweep-unknown-sweep-metric = ukjent sveipemetrikk: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep trenger minst én akse

engine-e-sweep-sweep-key-is-malformed = sveipenøkkelen `{ $key }` er ugyldig utformet

engine-e-sweep-sweep-key-follows-an-array = sveipenøkkelen `{ $key }`: `{ $part }` følger en tabell med flere elementer, så den må være en indeks

engine-e-sweep-unreachable = uoppnåelig

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] sveipenøkkelen `{ $key }`: indeks { $i } er utenfor det eneste elementet i tabellen ({ $n })
       *[other] sveipenøkkelen `{ $key }`: indeks { $i } er utenfor de { $n } elementene i tabellen
    }


engine-e-sweep-sweep-key-parent-is-not = sveipenøkkelen `{ $key }`: overordnet til `{ $part }` er ikke en tabell

engine-e-sweep-sweep-key-no-field = sveipenøkkelen `{ $key }`: ingen felt `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = sveipenøkkelen `{ $key }`: overordnet til `{ $last }` er ikke en tabell

engine-e-sweep-sweep-key-no-field-2 = sveipenøkkelen `{ $key }`: ingen felt `{ $last }`

engine-e-sweep-metric-no-field-in-result = metrikken `{ $path }`: ingen felt `{ $part }` i resultatet

engine-e-sweep-metric-value-is-not-number = metrikken `{ $path }`: verdien er ikke et tall

engine-e-sweep-sweep-node-serialize = serialisering av sveipenode: { $e }

engine-e-sweep-sweep-node-result-parse = tolking av sveipenodens resultat: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = sveipeaksen `{ $key }`: erklært enhet `{ $d }`, men den sveipede pakken oppgir `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = sveipearbeidstråden panikket

engine-e-sweep-generic-sweep-needs-at-least = et generisk sveip trenger minst én akse

engine-e-sweep-generic-sweep-needs-at-least-2 = et generisk sveip trenger minst én metrikk

engine-e-sweep-generic-sweep-base-must-carry = `base` i et generisk sveip må ha sin egen `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = et generisk sveip kan ikke sveipe et annet sveip

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = ukjent oscillator { $oscillator }; forventet ett av { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day og temperature_coeff_per_k må være endelige

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s må være endelig og positiv

engine-e-telecom-timing-duration-must-be-finite-and = duration_s må være endelig og minst tolv sampler lang

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s må ligge i [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns må være endelig og >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = temperatur- og frekvensavviksinndata må være endelige (periode > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = posten ville overskride 5 000 000 sampler; øk sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = en tidsfeilserie trenger minst 13 sampler, fikk { $pairs }

engine-e-telecom-timing-every-time-and-time-error = hver time_s og time_error_ns må være endelig

engine-e-telecom-timing-time-must-increase = time_s må øke

engine-e-telecom-timing-the-series-must-be-uniformly = serien må være jevnt samplet: steg { $v1 } er { $d } s, det første er { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV-linje { $v1 } er ikke `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = masken er definert gjennom et { $lit_0_1 } Hz lavpassfilter, som denne motoren bare bruker ved samplingsintervaller på { $MAX_FILTER_DT_S } s eller mindre; denne posten er samplet hvert { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = oppgi enten [holdover] eller [series], ikke begge

engine-e-telecom-timing-give-either-series-samples-or = oppgi enten series.samples eller series.csv_path, ikke begge

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days må være endelig og >= 0

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: maks|TE| { $max_abs } ns over { $v2 } s; { $masks } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = ukjent --format `{ $f }` (cef eller leef)

engine-e-telemetry-cli-unknown-option = ukjent valg `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input og --result er alternativer

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: ingen adresse

engine-telemetry-cli-warning-metrics-is-served-without = advarsel: /metrics serveres uten autentisering på { $addr }; bind til localhost eller legg den bak din egen tilgangskontroll

engine-e-telemetry-cli-bind = bind { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = serverer http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp og --syslog-tcp er alternativer

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting gjelder for --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: en emnedel må være ikke-tom, uten #, + eller en innledende /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp trenger en bygging med `--features otlp`

engine-telemetry-cli-warning-input-line = advarsel: inndatalinje { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = kan ikke åpne { $p }: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] advarsel: { $n } MQTT-melding ble ikke levert
       *[other] advarsel: { $n } MQTT-meldinger ble ikke levert
    }


## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint må starte med http://

engine-e-telemetry-otlp-endpoint-has-no-host = endpoint har ingen vert

engine-e-telemetry-otlp-resolve = oppslag { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = ingen adresse for { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = advarsel: otlp-eksport feilet: { $e }

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

engine-e-telemetry-sample-not-json = ikke JSON: { $e }

engine-e-telemetry-sample-not-json-object = ikke et JSON-objekt

engine-e-telemetry-sample-is-not-number = `{ $k }` er ikke et tall

engine-e-telemetry-sample-is-not-finite = `{ $k }` er ikke endelig

engine-e-telemetry-sample-missing = mangler `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } utenfor 0..=100

engine-e-telemetry-sample-missing-state = mangler `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` er ikke en tabell

engine-e-telemetry-sample-entry-has-no-name = en `{ $key }`-oppføring har ikke noe navn

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` mangler eller er ikke et endelig tall

engine-e-telemetry-sample-position-is-not-an-object = `position` er ikke et objekt eller null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` mangler eller er ikke en streng

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` er ikke et endelig tall >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` er ikke en streng

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` er ikke en boolsk verdi

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` er ikke et objekt eller null

engine-e-telemetry-sample-result-has-no-epochs = resultatet har ingen `epochs`

engine-e-telemetry-sample-bad-epochs = ugyldig `epochs`: { $e }

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

engine-e-telemetry-syslog-host-is-bytes-syslog-host = verten er { $host } bytes; et syslog-vertsnavn er høyst 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = host må være skrivbar ASCII uten mellomrom

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } mot { $w } (kan ikke representeres som f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: til stede, forventet fraværende

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: fraværende, forventet til stede

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } må være endelig

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu må være endelig og ikke-negativ

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: linje { $v1 }: ikke MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: ingen AR-poster for { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = ukjent serieformat { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } må være endelig

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s må gi 16 til 20000 målinger

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } avvik { $ns } ns (Sagnac { $ns2 } ns, ionosfære { $ns3 } ns); samlet u { $ns4 } ns (type A { $ns5 } ns ved { $averaging_s } s); { $series } virkelig(e) serie(r) (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = ikke-ASCII-tegn i TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE avkortet ved lesing av { $what } (kolonne { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } er for kort for en sjekksum i kolonne 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } har ikke noe sjekksumsiffer i kolonne 69

engine-e-tle-tle-checksum-mismatch-column-69 = TLE { $label } sjekksum stemmer ikke: kolonne 69 sier { $want }, beregnet { $got }

engine-e-tle-not-tle-line = ikke en TLE-linje 1: { $line1 }

engine-e-tle-not-tle-line-2 = ikke en TLE-linje 2: { $line2 }

engine-e-tle-invalid-in-tle = ugyldig { $what } i TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = ugyldig epokeår i TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = ugyldig katalognummer i TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = inklinasjon utenfor området [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = eksentrisitet utenfor området [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = ikke-positiv middelbevegelse: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = ugyldig { $what }-mantisse i TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = ugyldig { $what }-eksponent i TLE: { $exp }

engine-tle-satellite-line-only-element-set = satellitt { $satnum }: et elementsett med bare linje 2 ble tolket som analytiske keplerske (todelslegeme) elementer — linje 1-leddene for luftmotstand/B* og SGP4 sekulære ledd mangler, så denne banen avviker fra en ekte SGP4-tilpasning bort fra epoken; oppgi den tilhørende linje 1 for SGP4-nøyaktighet

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: C/N0-profilen trenger en positiv epoke og varighet

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: C/N0-profilen ville trenge mer enn { $MAX_DETECTOR_STEPS } detektorsteg ({ $total } s ved { $epoch_s } s per epoke); forkort ramp_duration_s eller forleng predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } må være endelig

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } må være positiv (fikk { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips må være under { $lit_1_9 } chips (fikk { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio må være minst 1 (fikk { $pullin_bandwidth_ratio }) — en sløyfe som fanger inn på nytt med en SMALERE båndbredde enn den sporer med ville snu hysteresen

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s kan ikke være negativ

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) kan ikke overstige cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } kan ikke være tom

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } har { $axis } oppføringer; taket er { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } inneholder en ikke-endelig verdi

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: bekreftelsesoppholdene må være minst 1 epoke

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = minst åtte sampler trengs

engine-e-twstft-budget-samples-must-increase-in-time = samplene må øke i tid

engine-e-twstft-budget-samples-must-be-on-regular = samplene må ligge på et regelmessig rutenett

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } rader: { $validated } prøvd mot en uavhengig ekstern referanse, { $modelled } beregnet fra en modell, { $partner_owned } hos partner.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = Det fullstendige, maskinkontrollerte bevisregisteret: **{ $total } rader — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. En rad kan bare være VALIDATED med en uavhengig ekstern referanse (matriseinvarianttestene håndhever dette). De samme dataene, med klikkbare lenker per rad til hver test, modul og innsjekket fixture, er *Valideringsregisteret* på https://kshana.dev. Se [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) for hvorfor hver rad som er beregnet fra en modell ikke er prøvd mot en uavhengig ekstern referanse.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } funksjoner merket MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json er ikke JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json er ikke JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] trenger `label`

engine-wasm-runs-needs-result = runs[{ $i }] trenger `result`

engine-wasm-results-json-is-not-json = results_json er ikke en JSON-tabell med strenger: { $e }

engine-wasm-maps-json-must-be-json = maps_json må være en JSON-tabell med strenger: { $e }

engine-wasm-plans-json-is-not-json = plans_json er ikke en JSON-tabell med strenger: { $e }

engine-wasm-options-json-is-not-json = options_json er ikke JSON: { $e }

engine-wasm-input-is-about-bytes-over = inndataene er omtrent { $b64 } bytes, over grensen på { $v2 } bytes

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Sekvensiell terrengreferert navigasjon (rekursiv SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = fri treghetsdrift (vokser)

engine-altpnt-sequential-terrain-matched-bounded = terrengtilpasset (begrenset)

engine-altpnt-sequential-waypoint-full-scale = veipunkt →    full skala { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Kshana-kjøringsrapport

engine-advanced-report-meta = Kind <code>{ $kind }</code> · motor { $engine } · scenario <code>{ $scenario }</code> (filsjekksum { $digest }…)

engine-advanced-report-toc-summary = 1 Sammendrag

engine-advanced-report-toc-inputs = 2 Inndata

engine-advanced-report-toc-results = 3 Resultater

engine-advanced-report-toc-aggregation = 3a Aggregering

engine-advanced-report-toc-companions = 3b Animasjon og eksporter

engine-advanced-report-toc-events = 4 Hendelser

engine-advanced-report-toc-labels = 5 Verifikasjonsetiketter

engine-advanced-report-toc-not-modelled = 6 Ikke modellert

engine-advanced-report-toc-reproducibility = 7 Reproduserbarhet

engine-advanced-report-h-summary = 1. Sammendrag for ledelsen

engine-advanced-report-honesty-label = <strong>Redelighetsetikett</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Egenskaper brukt:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (forutsatt, ikke levert); se avsnitt 5.

engine-advanced-report-member-runs = <strong>Medlemskjøringer:</strong> { $n }, aggregert i avsnitt 3a.

engine-advanced-report-h-inputs = 2. Inndata

engine-advanced-report-inputs-note = Hvert felt scenariofilen setter, flatet ut til stien sin. Enheter hentes fra resultatets <code>units</code>-blokk (feltenhetsskjemaet, docs/field-units-schema.json) der den beskriver feltet, ellers fra suffikset i feltnavnet; en enhet ingen av dem oppgir, vises som ikke oppgitt.

engine-advanced-report-th-parameter = Parameter

engine-advanced-report-th-value = Verdi

engine-advanced-report-th-unit = Enhet

engine-advanced-report-th-unit-source = Enhetskilde

engine-advanced-report-h-results = 3. Resultater

engine-advanced-report-chart-alt = Resultatdiagram

engine-advanced-report-also-written-to = { " " }(også skrevet til { $file })

engine-advanced-report-h-scalars = Skalare resultater

engine-advanced-report-h-columns = Numeriske kolonner

engine-advanced-report-th-result = Resultat

engine-advanced-report-th-column = Kolonne

engine-advanced-report-th-count = Antall

engine-advanced-report-th-min = Min

engine-advanced-report-th-max = Maks

engine-advanced-report-th-first = Første

engine-advanced-report-th-last = Siste

engine-advanced-report-omitted-inputs = <p class="note">{ $n } flere inndata er utelatt fra denne siden; report.json oppfører de samme radene, og resultatdokumentet inneholder hver verdi.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">{ $n } flere skalare resultater er utelatt fra denne siden; report.json oppfører de samme radene, og resultatdokumentet inneholder hver verdi.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">{ $n } flere numeriske kolonner er utelatt fra denne siden; report.json oppfører de samme radene, og resultatdokumentet inneholder hver verdi.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">{ $n } flere hendelser er utelatt fra denne siden; report.json oppfører de samme radene, og resultatdokumentet inneholder hver verdi.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Aggregering av medlemskjøringer

engine-advanced-report-mode = <p>Modus <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Modus <strong>{ $mode }</strong> over kind-en <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Modus <strong>{ $mode }</strong>, { $n_runs } medlemskjøringer.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Modus <strong>{ $mode }</strong> over kind-en <code>{ $kind }</code>, { $n_runs } medlemskjøringer.</p>{ "\u000A" }

engine-advanced-report-run-digest = Kjøringens sjekksum (SHA-256 over medlemsresultatenes sjekksummer, i utsendelsesrekkefølge): <code>{ $digest }</code>

engine-advanced-report-table-empty = Denne tabellen har ingen rader: resultatet oppfører ingen.

engine-advanced-report-distribution-caption = Monte Carlo-fordeling av { $metric } ({ $n } utvalg), 20 søyler med lik bredde; stiplede linjer markerer 5., 50. og 95. persentil.

engine-advanced-report-distribution-caption-unit = Monte Carlo-fordeling av { $metric } ({ $n } utvalg, { $unit }), 20 søyler med lik bredde; stiplede linjer markerer 5., 50. og 95. persentil.

engine-advanced-report-h-companions = 3b. Animasjon og eksporter

engine-advanced-report-animation-alt = Animasjon av kjøringens tidsserie

engine-advanced-report-animation-caption = Kjøringens egne sampler tegnes inn bak en bevegelig tidsmarkør (den animerte tegningen fra <code>--animate svg</code>; den viser det ferdige bildet ved redusert bevegelse og på utskrift).

engine-advanced-report-no-animation = Ingen animasjon: { $reason }

engine-advanced-report-no-animation-default = resultatet har ingen tidsserie

engine-advanced-report-player-written-by = Den interaktive spilleren skrives av <code>{ $command }</code>.

engine-advanced-report-written-beside = Skrevet ved siden av denne rapporten: { $links }.

engine-advanced-report-th-export = Eksport

engine-advanced-report-th-applies = Gjelder

engine-advanced-report-th-files-or-reason = Filer eller årsak

engine-advanced-report-written-by = skrevet av <code>{ $command }</code>

engine-advanced-report-does-not-apply = gjelder ikke

engine-advanced-report-yes = ja

engine-advanced-report-no = nei

engine-advanced-report-h-events = 4. Hendelsestidslinje

engine-advanced-report-events-caption = Vinduer som felt, punkthendelser som prikker, på kjøringens egen tidsakse.

engine-advanced-report-th-start = Start (s)

engine-advanced-report-th-end = Slutt (s)

engine-advanced-report-th-event = Hendelse

engine-advanced-report-th-source = Kilde

engine-advanced-report-point-event = punkthendelse

engine-advanced-report-events-timeline = Hendelsestidslinje

engine-advanced-report-point-events = punkthendelser ({ $n })

engine-advanced-report-distribution-of = Fordeling av { $metric }

engine-advanced-report-max-bin = største søyle { $n }

engine-advanced-report-h-labels = 5. Verifikasjonsetiketter

engine-advanced-report-th-capability = Egenskap (matrisekrav)

engine-advanced-report-th-label = Etikett

engine-advanced-report-th-used-by = Brukt av

engine-advanced-report-th-oracle = Kilde: uavhengig referanse

engine-advanced-report-th-test-evidence = Testbelegg

engine-advanced-report-h-figure-tiers = Evidensnivå per tall, oppgitt av resultatet

engine-advanced-report-th-figure = Tall

engine-advanced-report-th-tier = Evidensnivå

engine-advanced-report-th-matrix-requirement = Matrisekrav

engine-advanced-report-th-applicable = Relevant

engine-advanced-report-no-attack = nei (ingen angrep konfigurert)

engine-advanced-report-h-not-modelled = 6. Ikke modellert, og forutsetninger

engine-advanced-report-not-modelled-note = Hvert punkt er sitert fra stedet der det er oppgitt: resultatdokumentet, kind-katalogen, scenariofilen, eller verifikasjonsmatrisens begrunnelse for at en MODELLED-rad forblir modellberegnet.

engine-advanced-report-th-statement = Utsagn

engine-advanced-report-h-reproducibility = 7. Reproduserbarhetsregister

engine-advanced-report-rk-command = Kommando for å reprodusere

engine-advanced-report-rk-working-directory = Arbeidsmappe

engine-advanced-report-rk-engine-version = Motorversjon

engine-advanced-report-rk-source-commit = Kildecommit

engine-advanced-report-rk-scenario-file = Scenariofil

engine-advanced-report-rk-scenario-sha = SHA-256 for scenariofilen (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = Resultatets scenario_hash

engine-advanced-report-rk-result-sha = SHA-256 for resultatdokumentet

engine-advanced-report-rk-seed = Seed

engine-advanced-report-rk-platform = Plattform

engine-advanced-report-rk-generated = Studie generert (UTC)

engine-advanced-report-rk-determinism = Determinisme

engine-advanced-report-result-hash-none = resultatdokumentet oppgir ingen

engine-advanced-report-print-note = For å skrive ut denne siden til en PDF-fil (Portable Document Format), bruk nettleserens utskriftsdialog og velg «Lagre som PDF»; utskriftsstilarket passer for papir i A4 og US Letter, gjentar tabelloverskrifter over sider og starter avsnittene for inndata, resultater, etiketter og reproduserbarhet på en ny side. Motoren skriver ingen PDF selv. report.json har samme innhold som denne siden.

engine-advanced-report-footer = Generert av Kshana { $engine }.{ $stamp } Reproduserbar fra scenario + seed + motorversjon. Fri programvare med åpen kildekode (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">kildekode &amp; dokumentasjon</a>.

engine-advanced-report-empty-inputs = Scenarioet setter ingen felt utover `kind`: kind-en kjørte sin referansekonfigurasjon fra de dokumenterte standardverdiene.

engine-advanced-report-empty-scalars = Resultatdokumentet har ingen skalar utenfor tabellene sine; tallene oppsummeres per kolonne nedenfor.

engine-advanced-report-empty-series = Resultatdokumentet har ingen numerisk tabell: hvert resultat er en skalar i tabellen ovenfor.

engine-advanced-report-empty-events = Ingen tidsatt hendelse: scenarioet skriptstyrer ingen vinduer eller starttidspunkter, og resultatet rapporterer ingen hendelse. Kind-en evaluerer konfigurasjonen sin som ett tilfelle.

engine-advanced-report-empty-not-modelled = Verken resultatet, kind-katalogen, scenarioet eller de brukte matriseradene oppgir noen modelleringsbegrensning for denne kjøringen.

engine-advanced-report-capabilities-statement = Hver rad er en rad i verifikasjonsmatrisen som kind-ene i denne kjøringen bruker, med etiketten og den uavhengige referansen matrisen gir den (src/verification.rs, docs/VERIFICATION-MATRIX.md). En etikett vurderer egenskapen slik matrisen registrerer den; den vurderer ikke dette scenarioets konfigurasjon, og en VALIDATED-rad gjør ikke kjøringens inndata målt. En PARTNER-rad er en disiplin kjøringen støtter seg på, men som Kshana ikke leverer.

engine-advanced-report-no-run-label = Resultatet har ingen redelighetsetikett på kjøringsnivå; verifikasjonsetikettene for egenskapene det brukte er oppført i sitt eget avsnitt, og evidensnivåene per tall der resultatet oppgir dem.

engine-advanced-report-no-seed = Verken scenarioet eller resultatet har en seed. Resultatet er fastlagt av scenariofilen og motorbygget alene; determinismetesten kjører hvert medfølgende scenario på nytt og krever byte-identiske utdata.

engine-advanced-report-working-directory = Kjør kommandoen fra mappen den opprinnelige kjøringen ble startet i: scenariostien, og enhver relativ datasti inne i scenarioet, løses mot den. Kontroller først scenariofilen mot scenario_sha256.

engine-advanced-report-determinism-stamped = Samme scenariobytes, seed og motorbygg gir samme resultatdokument, bortsett fra meta.generated_utc-stempelet, som --study-name skriver fra klokken; kjør uten --study-name for byte-identiske utdata. Flyttallsresultater er festet per plattform; et annet operativsystem eller en annen arkitektur kan avvike i de siste sifrene.

engine-advanced-report-determinism-plain = Samme scenariobytes, seed og motorbygg gir et byte-identisk resultatdokument og rapport; denne rapporten har ikke noe tidsstempel. Flyttallsresultater er festet per plattform; et annet operativsystem eller en annen arkitektur kan avvike i de siste sifrene.

engine-advanced-report-not-applicable-no-attack = ikke relevant (ingen angrep konfigurert)

engine-advanced-report-what-ran-default = Et `{ $kind }`-scenario.

engine-advanced-report-nothing-carried = ingenting oppgitt

engine-advanced-report-tbl-sweep-nodes = Sveipenoder

engine-advanced-report-tbl-mc-summary = Sammendrag av Monte Carlo-fordelingen (persentiler er nærmeste rang; 95 % konfidensintervallet for middelverdien er en persentil-bootstrap med fast seed)

engine-advanced-report-tbl-chain-phases = Kjedefaser

engine-advanced-report-tbl-shared = Felles betingelser

engine-advanced-report-tbl-members = Medlemmer

engine-advanced-report-tbl-combined = Samlet over medlemmene

engine-advanced-report-tbl-optimiser-best = Beste fra optimereren (et lokalt optimum innenfor de oppgitte grensene)

engine-advanced-report-tbl-optimiser-trace = Spor fra optimereren

engine-advanced-report-tbl-sweep-grid = Sveipegitter

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Terrengreferert navigasjon (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Tyngdekarttilpasset navigasjon

engine-altpnt-terrain-title-combined = Kombinert tyngde + magnetisk + terreng alt-PNT

engine-altpnt-terrain-free-inertial-drift = fri treghetsdrift

engine-altpnt-terrain-terrain-matched = terrengtilpasset

engine-altpnt-terrain-gravity-matched = tyngdetilpasset

engine-altpnt-terrain-gravity-only = bare tyngde

engine-altpnt-terrain-magnetic-only = bare magnetisk

engine-altpnt-terrain-terrain-only = bare terreng

engine-altpnt-terrain-combined-fused = kombinert (fusjonert)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · scenario { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Angrepsflate for signalsikkerhet på Månen (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = reléer i sikte

engine-body-pnt-chart-count = antall

engine-body-pnt-chart-formal-one-sigma-position = formell énsigma posisjon (log10 m): bare blå konstellasjon, rav med jordavstanden

engine-body-pnt-chart-time-since-epoch = tid siden epoken, 0 til { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = klokkens tidsfeil mot vern (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 mot sporingsgulv (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = beskyttelsesnivå mot alarmgrense (m)

engine-campaign-chart-position-error-vs-threshold = posisjonsfeil mot terskel (m)

engine-campaign-chart-satellites-tracking = satellitter som spores

engine-campaign-chart-alarm-flags-and-events = alarmflagg og hendelser

engine-campaign-chart-mission-time = { $duration } s oppdragstid

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) ved { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo av `{ $scenario_kind }`: { $n_runs } seeds fra { $base_seed } (5., 50., 95. persentil; feillinje = bootstrap 95 % konfidensintervall for middelverdien)

engine-campaign-chart-composed-members = sammensatte medlemmer under felles betingelser: { $shared }

engine-campaign-chart-not-available = n/a

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Gjenvinning av cislunar buelengde — en estimator som ikke deler jakobianene

engine-cislunar-arc-recovery-chart-subtitle = batch-minstekvadrater med finitt differanse · målt gjenvinningsfeil for tilstanden · ingen analytisk jakobian, ingen variasjonell STM, ingen SVD-rangtoleranse

engine-cislunar-arc-recovery-chart-bound = grense { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = Gram-matrisens rangterskel

engine-cislunar-arc-recovery-chart-monte-carlo-rms = Monte Carlo RMS-feil i posisjonsgjenvinning (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = verste gjenvinningsforhold uten støy (sluttfeil / forskyvning)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Cislunar observerbarhet over en sporingsbue (P6)

engine-cislunar-observability-chart-subtitle = rang mot bue (én lenke med kun avstand) · egenverdispekter for Gram-matrisen · differensialkorrigerte DRO-startverdier + SRIF-kontroll · { $modelled } utforming, { $validated } rang/STM/lukking

engine-cislunar-observability-chart-observable-rank = observerbar rang mot buelengde

engine-cislunar-observability-chart-arc-length = buelengde (tidsenheter i det roterende systemet, { $arc_hours } h totalt)

engine-cislunar-observability-chart-gramian-eigenvalues = egenverdier for Gram-matrisen (log10)

engine-cislunar-observability-chart-condition = kondisjon κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Konfliktmotstandsdyktighet for lagdelt PNT (P7)

engine-conflict-resilience-chart-subtitle = totaltap mot trusselintensitet (MC mot lukket form) · motstandsdyktighetsforhold mot nektelseskorrelasjon · { $modelled } a priori-fordelinger, { $validated } MC->lukket form / kopula-marginaler

engine-conflict-resilience-chart-total-loss-probability = sannsynlighet for totaltap mot intensitet

engine-conflict-resilience-chart-threat-intensity = trusselintensitet

engine-conflict-resilience-chart-layered-mc = lagdelt MC

engine-conflict-resilience-chart-single-layer = enkeltlag

engine-conflict-resilience-chart-resilience-ratio = motstandsdyktighetsforhold mot nektelseskorrelasjon

engine-conflict-resilience-chart-denial-correlation = nektelseskorrelasjon ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = tilgjengelighet (%)

engine-constellation-chart-mean-pdop = gjennomsnittlig PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = Jord-GNSS i månens avstand — C/N0 mot vinkel utenfor siktelinjen

engine-earth-gnss-lunar-chart-track-threshold = sporing { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = Jordens limb { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = vinkel utenfor siktelinjen (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = gull = kan spores · rød = for svak · grå = skjult av jorden · { $modelled } sendemønster

## src/ensemble.rs

engine-ensemble-chart-title = Klokke-holdover: konfidensbånd for tidsfeil ({ $n_runs } kjøringer)

engine-ensemble-chart-timing-error-ns = tidsfeil (ns)

engine-ensemble-chart-spec-threshold = spesifikasjon { $threshold } ns

engine-ensemble-chart-time-s = tid (s)

engine-ensemble-chart-classical-median-band = klassisk: { $id } (median, 5-95 % bånd)

engine-ensemble-chart-quantum-median-band = kvante: { $id } (median, 5-95 % bånd)

## src/fom_label.rs

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Sanntids prediksjonsbudsjett for referansesystem / EOP for månetid

engine-frame-eop-chart-ut1-error-ms = UT1-feil (ms)

engine-frame-eop-chart-position-at-moon-m = posisjon ved Månen (m)

engine-frame-eop-chart-equiv-timing-ns = tilsv. tid (ns)

engine-frame-eop-chart-prediction-horizon-days = prediksjonshorisont (dager)

engine-frame-eop-chart-iers-final-floor = IERS endelig gulv { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m ved Månen

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = Hybrid UKF med 17 tilstander — filterets selvkonsistens (modellberegnet)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + innovasjonshvithet mot 95 % χ²-bånd; { $lit_1_0 } = konsistent. Selvkonsistens, ikke nøyaktighet.

engine-fusion-hybrid-ukf-chart-target = mål { $lit_1_0 }

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (hvithet)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = KONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = IKKE KONSISTENT

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Horisontal feil for løst koblet GNSS/INS

engine-fusion-pack-chart-horizontal-error-m = horisontal feil (m)

engine-fusion-pack-chart-spec-threshold = spesifikasjon { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Himmelplott ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = Ø

engine-geometry-chart-south = S

engine-geometry-chart-west = V

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (skjult av horisontlinjen)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (under masken)

engine-geometry-chart-no-fix = ingen posisjonsbestemmelse

engine-geometry-chart-in-view-hidden = { $n_visible } i sikte, { $n_masked } skjult av horisontlinjen · { $dop } · hul: ikke i sikte

engine-geometry-chart-satellites-as-given = satellitter som oppgitt

engine-geometry-chart-representative-sky = representativ himmel, ikke en datert

engine-geometry-chart-footer = Kshana v{ $version } · geometri under en oppgitt feilmodell · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = RAIM-beskyttelsesnivåer mot alarmgrenser

engine-gnss-sim-chart-protection-level-m = beskyttelsesnivå (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/main.rs

engine-main-fail = feil: { $e }

## legal (advisories, disclaimers and notices; the English text is the source, the constant in code is what machine files carry)

# legal: native review
engine-legal-compliance-statement = En rad merket evidenced betyr at en kjøring i dette settet gir belegg for egenskapene raden nevner. Det er ikke en konstatering av at et rammeverk er oppfylt, og det betyr ikke at noe produkt er vurdert eller godkjent av noen. Kolonnen gap oppgir hva kjøringene ikke viser.

# legal: native review
engine-legal-bench-surface-notice = Kun kjøretøybevegelse og merkede hendelsesintervaller. Ingenting som eksporteres her er, modellerer eller driver et radiofrekvens- eller basebåndsignal, og en hendelse er et tidsintervall, ikke en oppskrift for å fremkalle interferens. Laboratoriesimulatoren og operatøren av den leverer signalene og er ansvarlige for å kjøre dem bare der det er tillatt (ledningsbundet eller skjermet, etter simulatorens egne sikkerhetsinstruksjoner). Kshana publiserer ingen resultater fra slike kjøringer.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC på vindusnivå for hver monitor på de oppgitte opptakene. Hvert oppgitte hendelsesvindu er en positiv og hvert roc_window_s-vindu utenfor hendelsene en negativ; et vindu teller ved en terskel når monitorens teststatistikk når den i vinduet. P_fa gjelder per negativt vindu, ikke per test.

# legal: native review
engine-legal-lunanet-afs-advisory = Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Det kontrollerer en symbolstrøm mot én utgave av en publisert spesifikasjon og sier ingenting om noen LunaNet-node eller -tjeneste.

# legal: native review
engine-legal-iqfit-statement = MODELLED: hvert tilpassede tall beskriver den åpne mottakeren (den navngitte sløyfeutformingen og front-end-kjeden) på opptakene den fikk, tilpasset kampanjens scorede resultater. Det er ikke en måling av noen annen mottaker. Prediksjoner merkes PREDICTION, med nærmeste testede opptak og avstanden utenfor de testede forholdene.

# legal: native review
engine-legal-iqfit-advisory = Veiledende: analyseresultat, ikke typegodkjent navigasjonsutstyr; prediksjoner er modellutdata med oppgitt feil, ikke garantier.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Kildeerklæring, ikke en påstand: ICG WG-B Lunar PNT-materialet fra juni 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, kilde S3 i studien) beskriver et laboratorium for månetidsreferanse ved stasjonen med et tidsmål på nanosekundnivå. Kshana siterer dette målet bare som kontekst; det gjør det ikke til sitt eget, og ingenting i denne blokken viser at noen virkelig stasjonsklokke når det.

# legal: native review
engine-legal-standards-pack-notice = En standardpakke måler modellberegnede scenarioer mot terskler oppgitt før kjøringen. Den gir belegg for rammeverkradene den nevner; den vurderer eller godkjenner ikke noe produkt, og en MET-terskel sier bare at scenarioets modellberegnede utdata nådde den oppgitte terskelen.

# legal: native review
engine-legal-standards-pack-advisory = Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste; det må ikke være det eneste grunnlaget for noen navigasjons- eller sikkerhetsbeslutning.

# legal: native review
engine-legal-geometry-statement = Geometri under en oppgitt feilmodell (MODELLED): siktlinjesynlighet mot den oppgitte horisontlinjen, presisjonsfortynning og en gaussisk feilellipse for uavhengige, like gaussiske avstandsfeil med null middelverdi og den oppgitte brukerekvivalente avstandsfeilen. Det er ikke en prediksjon av en mottakers virkelige feil, som også har skjevheter, flerveisfeil og feil uten siktlinje, og det er ikke en integritetsgrense. Forhåndsinnstilte konstellasjoner er en representativ geometri, ikke himmelen den datoen på det stedet.

# legal: native review
engine-legal-resilience-disclaimer = Simuleringsbasert egenvurdering innrettet etter DHS RPCF v2.0. Dette er ikke en sertifisering eller akkreditering, og det representerer ingen godkjenning fra noen myndighet (DHS, IEEE eller andre). Hver delscore er MODELLED med mindre den uttrykkelig er merket VALIDATED, og scorene er kvalitetsmål for tidsdomenet og deteksjon, ikke nøyaktighet i posisjonsdomenet.

# legal: native review
engine-legal-observatory-notice = En degradert celle betyr at en stor andel fly rapporterte lav navigasjonsnøyaktighet der den dagen. Ingen årsak tilskrives. En celle som ikke er observert, eller mangler, ble ikke vurdert, og det er ikke det samme som klar. Kun veiledende: ikke en godkjenning, sertifisering eller erklæring om samsvar.

# legal: native review
engine-legal-receiver-trust-advisory = Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC 61108, IEC 61162): operatøren er fortsatt ansvarlig for fartøyets navigasjon.

# legal: native review
engine-legal-evidence-roundtrip-notice = Knytter sammen fire poster med hash: scenarioet, laboratoriets oppgitte testforhold, mottakerloggen og scoren til loggen mot de oppgitte hendelsene. Det er ikke et signal, ikke en avspillingsoppskrift og ikke en sertifisering. Hvordan scenarioets bevegelse nådde mottakeren (en fil spilt av gjennom en laboratoriesimulator, ledningsbundet eller skjermet) var operatørens ansvar og er registrert her bare slik det er oppgitt.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Denne pakken er en teknisk registrering av hva Kshana-motoren beregnet ut fra den oppgitte mottakerloggen med den oppgitte konfigurasjonen. Den er ikke en juridisk vurdering, ikke en faktakonstatering om noen hendelse eller dens årsak, og ikke en sertifisering.

# legal: native review
engine-legal-bench-notice = Veiledende: modellberegnet eller målt mot oppgitte referanser, ikke en godkjenning, sertifisering eller erklæring om samsvar. En score beskriver en logg eller et korpus, aldri et produkt.

# legal: native review
engine-legal-osnma-advisory = Veiledende: dette er analyse- og overvåkingsutdata og ikke typegodkjent navigasjonsutstyr. Autentiseringsstatusen som rapporteres her er ikke en integritetstjeneste for navigasjon og må ikke være det eneste grunnlaget for noen navigasjons- eller sikkerhetsbeslutning.

## added by the second pass

engine-holdover-test-chart-title = Holdover-test: tidsfeil per trinn

engine-holdover-test-chart-y-title = |tidsfeil| (ns)

engine-holdover-test-chart-panel-caption = absolutt tidsfeil; holdover-trinn skravert; stiplede linjer er tidsfeilbudsjettene

engine-holdover-test-chart-gnss-removed = GNSS fjernet

engine-holdover-test-chart-gnss-restored = GNSS gjenopprettet

engine-holdover-test-chart-time-axis = tid på opptakets akse ({ $min } min)

engine-hybrid-chart-title = Utnyttelse av spesifikasjonen for hybrid PNT under GNSS-utfall ({ $lit_1_0 } = spesifikasjon)

engine-hybrid-chart-y-title = utnyttelse av spesifikasjonen

engine-hybrid-chart-spec-line = spesifikasjon ({ $lit_1_0 })

engine-hybrid-chart-classical-suite = klassisk suite

engine-hybrid-chart-quantum-suite = kvantesuite

engine-hybrid-integrity-chart-availability = tilgjengelighet

engine-hybrid-integrity-chart-precision = presisjon

engine-hybrid-integrity-chart-integrity = integritet

engine-hybrid-integrity-chart-joint-indep = felles (uavh.)

engine-hybrid-integrity-chart-joint-corr = felles (korr.)

engine-hybrid-integrity-chart-title = Felles kvalitetsmål for hybrid optisk + RF PNT

engine-hybrid-integrity-chart-subtitle = P(tilgjengelig AND presisjonsklasse AND integritetssikret)

engine-inertial-chart-title = Posisjonsfeil ved dødregning under GNSS-utfall

engine-inertial-chart-y-title = posisjonsfeil (m)

engine-inertial-chart-spec-line = spesifikasjon { $m } m

engine-inertial-chart-classical = klassisk: { $id }

engine-inertial-chart-quantum = kvante: { $id }

engine-iq-campaign-report-roc-aria-label = Deteksjons-ROC per monitor

engine-iq-campaign-report-roc-x-title = P_fa (per negativt vindu)

engine-iq-campaign-report-curve-aria-label = C/N0-degradering mot oppgitt J/S for { $rec }, hendelse { $ev }

engine-iq-campaign-report-curve-x-title = oppgitt J/S (dB)

engine-iq-campaign-report-curve-y-title = C/N0-degradering (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: SSC-referanse, Q = { $q }

engine-iq-campaign-report-curve-model-legend = { $label }-referanse (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } flere serier i resultattabellen

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, målt degradering { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (målt)

engine-jamming-chart-title = Synlige satellitter mot sporede under jamming

engine-jamming-chart-y-title = satellitter

engine-jamming-chart-four-sv-fix = 4-SV-posisjonsbestemmelse

engine-jamming-chart-visible = synlige

engine-jamming-chart-tracking = sporede

engine-leo-fusion-ntn-chart-title = 5G NTN-posisjonering: Cramér-Rao-avstandsgrense etter båndbredde

engine-leo-fusion-ntn-chart-caption = avstand, én sigma (log10 m): søyle = maske til zenit C/N0; prikk = RMS-feil for 3D-posisjonsbestemmelse

engine-leo-fusion-ppp-chart-title = PPP-konvergens med LEO-forsterkning

engine-leo-fusion-ppp-chart-caption = median horisontal feil (log10 m) mot minutter

engine-leo-fusion-ppp-chart-n-leo = { $n } LEO

engine-leo-fusion-pvt-kind-chart-doppler-caption = feil for 3D-Doppler-posisjonsbestemmelse (log10 m) mot vinduslengde

engine-leo-fusion-pvt-kind-chart-doppler-x-label = vindu (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = median PDOP (blå) og VDOP (rav), log10, mot tillagte LEO-satellitter

engine-leo-fusion-pvt-kind-chart-joint-x-label = tillagte LEO-satellitter

engine-leo-fusion-pvt-kind-chart-polar-caption = median VDOP (log10): grå GNSS, blå LEO, rav fusjonert

engine-leo-fusion-pvt-kind-chart-polar-x-label = breddegrad (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = RMS-tidsfeil til UTC (log10 ns) mot C/N0-forskyvning, én linje per oscillator

engine-leo-fusion-pvt-kind-chart-timing-x-label = C/N0-forskyvning (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 } til { $x1 }

engine-leo-navmsg-chart-title = LEO-navigasjonsmelding: SISRE mot tilpasningsintervall

engine-leo-navmsg-chart-no-trade-encode-decode = Ingen avveining i denne kjøringen; se result.json for tabellene over koding/dekoding og budsjett.

engine-leo-navmsg-chart-no-fit-interval-trade = Ingen avveining av tilpasningsintervall i denne kjøringen; se result.json.

engine-leo-navmsg-chart-caption = SISRE RMS kun fra bane (m, log-skala) mot tilpasningsintervall (s)

engine-leo-pass-chart-title = LEO-passering: C/N0 per bånd og Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 til 80): LEO-bånd i farger, GNSS i grått

engine-leo-pass-chart-time-axis = tid siden epoke, 0 til { $s } s

engine-leo-pnt-chain-chart-subtitle = signalutforming -> passering C/N0 og kodejitter -> melding SISRE -> fusjonert posisjonsbestemmelse · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 for sporet komponent over passeringen (dB-Hz, 20 til 80)

engine-leo-pnt-chain-chart-not-available = ikke tilgjengelig

engine-leo-signal-chart-title = LEO-PNT-signalutforminger

engine-leo-signal-chart-psd-axis = forskyvning over ±{ $lit_0_6 } × senderbåndbredde; 0 til −50 dB under hver topp

engine-leo-signal-chart-jitter-caption = kodejitter (m, log-skala) mot total C/N0 (dB-Hz)

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = sveip av `{ $scenario_kind }` over { $axis_order } ({ $nodes } noder, median med persentilbånd fra 5. til 95. persentil over { $n_runs } seed; hver linje på sitt eget område)

engine-holdover-test-holdover-not-recovered-within-record = holdover-test: holdover { $hold } s, maks|TE| { $max_abs } ns; { $masks }; ikke gjenopprettet innenfor opptaket (MODELLED, målt mot masken)

engine-holdover-test-holdover-recovered-after-gnss-returned = holdover-test: holdover { $hold } s, maks|TE| { $max_abs } ns; { $masks }; gjenopprettet { $t } s etter at GNSS kom tilbake (MODELLED, målt mot masken)

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = skrevet av kshana iq scene: en SIMULERT scene, ikke et opptak; heltallsskala: 1 LSB = { $sc } støynormaliserte enheter (forventet RMS { $v1 } LSB per komponent), { $clipped } element(er) klippet

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = skrevet av kshana iq scene; heltallsskala: 1 LSB = { $sc } støynormaliserte enheter (forventet RMS { $v1 } LSB per komponent), { $clipped } element(er) klippet

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = skrev { $samples } sampler ({ $format }, { $fs_hz } Hz) til { $data_path }; { $truth_records } referanseposter til { $truth_path }; { $meta_note }; kanal: { $chan_desc }; heltallsskala: 1 LSB = { $sc } støynormaliserte enheter (forventet RMS { $v1 } LSB per komponent), { $clipped } element(er) klippet

engine-lunar-chart-title = HPL ved månens sørpol ({ $availability } % tilgjengelig, AL { $al } m, σ_URE { $sigma } m)

engine-lunar-beacon-chart-title = Utvidelse med overflatefyr — PDOP per konfigurasjon

engine-lunar-beacon-chart-pdop = PDOP { $pdop }

engine-lunar-beacon-chart-no-solution = ingen løsning

engine-lunar-beacon-chart-footnote = lavere er bedre; sigma_URE per fyr { $sigma } m, maske { $mask } deg

engine-lunar-combination-chart-title = Felles OD + klokke for månen — 3D-posisjonsfeil for stasjonen (VLBI gjenoppretter observerbarheten)

engine-lunar-combination-chart-subtitle = { $n_sat } sat., { $n_earth } jordstasjoner · forbedringsfaktor { $factor }×

engine-lunar-combination-chart-with-vlbi = med VLBI: { $m } m

engine-lunar-combination-chart-range-only = kun avstand: { $m } m

engine-lunar-combination-chart-axis-note = log10 stasjonsfeil (m); konvergert med/uten = { $with }/{ $without }

engine-lunar-dpnt-chart-title = Differensiell PNT på månen — { $n_sats } sat.: korrigert feil mot grunnlinje (× { $factor } reduksjon ved { $km } km)

engine-lunar-dpnt-chart-subtitle = ukorrigert { $uncorrected } m | korrigert { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = ukorrigert (frittstående)

engine-lunar-dpnt-chart-baseline-km = grunnlinje (km)

engine-lunar-dpnt-chart-err-m = feil (m)

engine-lunar-frame-realise-chart-title = Realisering av referansesystemet for månen — gjenoppretting av 7-parameter Helmert

engine-lunar-frame-realise-chart-subtitle = { $n_points } punkter · RMS-residual { $rms } m · konvergert { $converged }

engine-lunar-frame-realise-chart-tx = tx (m)

engine-lunar-frame-realise-chart-ty = ty (m)

engine-lunar-frame-realise-chart-tz = tz (m)

engine-lunar-frame-realise-chart-theta-x = θx (µrad)

engine-lunar-frame-realise-chart-theta-y = θy (µrad)

engine-lunar-frame-realise-chart-theta-z = θz (µrad)

engine-lunar-frame-realise-chart-scale = skala (ppb)

engine-lunar-frame-realise-chart-row = { $label }: påført { $inj } { $unit } · gjenopprettet { $rec } { $unit } · feil { $err }

engine-lunar-interop-chart-title = Interoperabilitetseksport for månen — CCSDS OEM + KIF (tilpasset LunaNet/IOAG)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | { $n_states } tilstander | OEM { $oem_lines } linjer

engine-lunar-interop-chart-artifacts = artefakter: { $list }

engine-lunar-interop-chart-pass = PASS

engine-lunar-interop-chart-fail = FAIL

engine-lunar-interop-chart-ok = OK

engine-lunar-interop-chart-conformance = feltkontroll: { $verdict } ({ $present } til stede, { $missing } mangler, { $data_lines } datalinjer)

engine-lunar-interop-chart-roundtrip = OEM rundtur: { $oem } | rundtur for tidsmetadata: { $time_metadata } | KIF { $kif_bytes } bytes

engine-lunar-interop-chart-footnote = Rundtur / feltkontroll mot CCSDS OEM + publisert feltsemantikk fra LunaNet/IOAG. { $label } — ikke en sertifisert test av interoperabilitet; ingen støtte fra noe byrå.

engine-lunar-jamming-chart-title = J/S per satellitt mot elevasjon, bruker på månens overflate

engine-lunar-jamming-chart-y-title = J/S (dB)

engine-lunar-jamming-chart-x-title = satellittens elevasjon (deg)

engine-lunar-jamming-chart-locked = LOCKED

engine-lunar-jamming-chart-degraded = DEGRADED

engine-lunar-jamming-chart-lost = LOST

engine-lunar-jamming-chart-n-links = { $n_links } lenker

engine-lunar-service-chart-title = Tjenestevolum på månen — { $n_sats } sat., { $n_points } punkter × { $n_epochs } epoker: { $coverage } % dekning (PDOP&lt;{ $threshold })

engine-lunar-service-chart-subtitle = sat. { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | PL-tilgjengelighet { $pl_avail } % (AL { $al } m, σ_URE { $sigma } m)

engine-lunar-service-chart-pdop-min = PDOP min { $v }

engine-lunar-service-chart-pdop-mean = PDOP gjennomsnitt { $v }

engine-lunar-service-chart-pdop-max = PDOP maks { $v }

engine-lunar-station-chart-title = Referansestasjon på månen: p{ $percentile } korrigert 3D-feil over sørpolområdet (MODELLED)

engine-lunar-station-chart-zero-east = 0° Ø

engine-lunar-station-chart-threshold = terskel { $thr } m ved p{ $percentile }

engine-lunar-station-chart-availability = tilgjengelighet { $v } %

engine-lunar-station-chart-coverage = dekning { $v } %

engine-lunar-station-chart-corrected-3d = korrigert 3D { $f }

engine-lunar-station-chart-uncorrected-3d = ukorrigert 3D { $f }

engine-lunar-station-chart-legend-half = ≤ halve terskelen

engine-lunar-station-chart-legend-within = ≤ terskelen

engine-lunar-station-chart-legend-twice = ≤ dobbelt så mye som terskelen

engine-lunar-station-chart-legend-above = over dobbelt så mye som terskelen

engine-lunar-station-chart-station-note = ◆ stasjon · stiplet: avstanden dekningen holder til ved 95 %

engine-lunar-station-chart-disclaimer = MODELLED under oppgitte forutsetninger; ikke en uttalelse om noe virkelig system; ikke tilknyttet eller støttet av noe byrå.

engine-lunar-time-chart-title = Koordinattid for månen LTC−TT (rate { $rate } µs/døgn, bånd { $low }–{ $high })

engine-lunar-time-chart-offset = { $offset } µs ved { $days } d

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | klokke { $clock } | 7-ledds x_Σ(τ) over { $taus } τ-punkter ({ $taus2 }–{ $taus3 } s) | krysningspunkt τ { $crossover_tau_s } s (x { $crossover_x_s } s) | referansesystemgulv { $frame_term_s } s | klokke x(1 d) { $x_1day_ns } ns (MODELLED) | tidslaboratorium: { $lab } { $lab2 } til LTC, x(1 d) { $lab3 } ns (MODELLED)

engine-lunar-vlbi-chart-title = VLBI-forsinkelse for månen (grunnlinje { $baseline } km, fyravstand { $range } km, nærfelt { $near_field } µs)

engine-lunar-vlbi-chart-footnote = forsinkelse { $delay } µs ved epoken · { $samples } sampler over { $hours } t

engine-mars-pnt-chart-formal-3sigma = formell 3σ (kovarians, ikke et sertifisert PL)

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = posisjons-drag-off: den rapporterte posisjonen driver { $final_offset_m } m bort { $dir } mens mottakeren beholder en gyldig posisjonsbestemmelse (det falske sporet topper seg på { $pv } m/s og { $pa } m/s^2); hver sporede satellitt viser { $c } dB-Hz så lenge den varer

engine-nmea-synth-log-position-drag-off-genuine-cn0 = posisjons-drag-off: den rapporterte posisjonen driver { $final_offset_m } m bort { $dir } mens mottakeren beholder en gyldig posisjonsbestemmelse (det falske sporet topper seg på { $pv } m/s og { $pa } m/s^2); det ekte C/N0-mønsteret beholdes

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = tids-spoofing: rapportert UTC flytter seg { $offset_s } s fra sann tid; posisjonen forblir sann; hver sporede satellitt viser { $c } dB-Hz så lenge den varer

engine-nmea-synth-log-time-spoof-genuine-cn0 = tids-spoofing: rapportert UTC flytter seg { $offset_s } s fra sann tid; posisjonen forblir sann; det ekte C/N0-mønsteret beholdes

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = replay-forsinkelse (meaconing-stil): posisjonen{ $v1 } henger { $delay_s } s etter referansen; hver sporede satellitt viser { $c } dB-Hz så lenge den varer

engine-nmea-synth-log-replay-delay-genuine-cn0 = replay-forsinkelse (meaconing-stil): posisjonen{ $v1 } henger { $delay_s } s etter referansen; det ekte C/N0-mønsteret beholdes

engine-pvt-chart-3d-error-m = 3D-feil (m)

engine-pvt-chart-postfit-rms-m = RMS etter tilpasning (m)

engine-quantum-faults-chart-title = quantum-anomaly-detect AUC (MODELLED)

engine-quantum-faults-chart-quantum = kvante

engine-quantum-faults-chart-classical = klassisk

engine-quantum-nav-od-chart-title = quantum-gnss-free-nav (MODELLED)

engine-raim-stanford-chart-title = Stanford-diagram — integritet ({ $n_epochs } epoker, AL = { $al } m)

engine-raim-chart-title = RAIM-beskyttelsesnivåer og tilgjengelighet ({ $availability } % tilgjengelig)

engine-raim-chart-hal = HAL { $al } m

engine-raim-chart-val = VAL { $al } m

engine-receiver-trust-chart-track-caption = spor rapportert av mottakeren, nord opp

engine-receiver-trust-chart-start = start

engine-receiver-trust-chart-end-of-log = slutt på loggen

engine-receiver-trust-chart-no-positions = ingen posisjoner i loggen

engine-receiver-trust-chart-score-axis = tillitsscore, 0 til 100

engine-receiver-trust-chart-legend-vessel = tillit: grønn nominell (score på eller over { $nominal }), gul degradert (på eller over { $degraded }), rød ikke tiltrodd, grå kalibrerer

engine-receiver-trust-chart-legend = tillit: grønn nominell, gul degradert, rød ikke tiltrodd, grå kalibrerer

engine-receiver-trust-chart-advisory = Veiledende programvare, ikke typegodkjent navigasjonsutstyr; operatøren er fortsatt ansvarlig.

engine-receiver-trust-chart-cn0-axis = gjennomsnittlig C/N0, dB-Hz

engine-report-chart-title = Klokke-holdover: tidsfeil under GNSS-utfall

engine-slot-timing-chart-aria = Predikert tidsfeil mot tiden siden siste posisjonsbestemmelse, med slotvakten

engine-slot-timing-chart-time-since-fix = tid siden posisjonsbestemmelse, 0 til { $t }

engine-slot-timing-chart-predicted-error = predikert tidsfeil (ns); stiplet: vakt { $guard } ns

engine-slot-timing-never = aldri

engine-solar-system-chart-title = Solsystemet — J2000-ekliptikk, ovenfra

engine-solar-system-chart-inner = Det indre systemet (til Mars)

engine-solar-system-chart-whole = Hele systemet (til Pluto)

engine-solar-system-chart-legend = grønn: VALIDATED mot JPL Horizons · gul: MODELLED · måner er oppført i result.json med spor sentrert på moderlegemet

engine-spectrum-chart-title = Spektrumvannfall for L-bånd

engine-spectrum-chart-multi-title = Spektrumvannfall for flere bånd

engine-spectrum-chart-frequency-mhz = frekvens (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz): nominell (grå) / minimum

engine-spectrum-chart-threshold = terskel { $thr }

engine-spoof-chart-title = Deteksjon av tids-spoofing: forskyvning mot klokkestøttede deteksjonsgrenser

engine-spoof-chart-offset-ns = spoofingforskyvning (ns)

engine-spoof-chart-spoof-offset = spoofingforskyvning

engine-spoof-chart-quantum-bound = kvantedeteksjonsgrense

engine-spoof-chart-classical-bound = klassisk deteksjonsgrense

engine-sweep-chart-title = { $metric } mot { $parameter } ({ $scale }-skala)

engine-sweep-nd-chart-title = { $n_dims }-D-sveip av `{ $kind }` — { $n_nodes } noder

engine-sweep-nd-chart-axes = akser: { $axes } (form { $shape })

engine-sweep-nd-chart-metrics = metrikker: { $metrics } — fullt gitter i JSON

engine-sweep-nd-chart-line-title = sveip av `{ $kind }` over { $key }

engine-sweep-nd-chart-y-title = metrikk

engine-telecom-timing-max-te-ns-budget-never-exceeded = telecom-timing: maks|TE| { $max_abs } ns over { $v2 } s; { $masks }; budsjettet på { $max_abs_te_ns } ns ble aldri overskredet (MODELLED)

engine-telecom-timing-max-te-ns-budget-exceeded-after = telecom-timing: maks|TE| { $max_abs } ns over { $v2 } s; { $masks }; budsjettet på { $max_abs_te_ns } ns ble overskredet etter { $t } s (MODELLED)

engine-telecom-timing-chart-title = Telekomtidssynkronisering: tidsfeil, MTIE og TDEV

engine-telecom-timing-chart-y-title = |tidsfeil| (ns)

engine-telecom-timing-chart-te-caption = absolutt tidsfeil mot budsjettene

engine-telecom-timing-chart-holdover = holdover

engine-telecom-timing-chart-time-record = tid ({ $h } t opptak)

engine-telecom-timing-chart-mtie-caption = MTIE (heltrukket), TDEV (stiplet), første MTIE-maske (grå), ns

engine-timetransfer-chart-title = Synkroniseringsfeil ved tidsoverføring (optisk mot RF)

engine-timetransfer-chart-y-title = synkroniseringsfeil (ps)

engine-timetransfer-chart-spec = spesifikasjon { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = målingstid (s)

engine-timetransfer-chart-rf = RF: { $id }

engine-timetransfer-chart-optical = optisk: { $id }

engine-timetransfer-chain-chart-title = quantum-time-transfer (MODELLED)

engine-kind-clock-description = Klokke-holdover mot spesifikasjon; valgfri Monte Carlo-ensemble (runs > 1).

engine-kind-inertial-description = 1-DOF treghetsnavigasjon (dead-reckoning) under et GNSS-utfall.

engine-kind-orbit-description = GNSS-tilgjengelighet + DOP fra en banekonstellasjon (Walker / TLE / RINEX).

engine-kind-ephemeris-description = Efemeride og bakkespor: propager én satellitt (TLE→SGP4 eller analytisk bane) og gi ut tilstanden i TEME/GCRS (posisjon + hastighet), ITRF/ECEF-posisjon, WGS-84 breddegrad/lengdegrad/høyde for subsatellittpunktet og azimut/elevasjon/avstand + avstandsrate (Doppler) per steg for stasjonen. Satellitten kommer fra en `tle` eller fra en analytisk `orbit` med sin `epoch` (en `tle` går foran når begge er oppgitt); med en `tle` overstyrer en `epoch` TLE-ens egen epoke som t = 0.

engine-kind-integrity-description = Snapshot- / løsningsseparasjons- / ARAIM-RAIM med HPL/VPL og et Stanford-diagram.

engine-kind-lunar-integrity-description = ARAIM-beskyttelsesnivå ved månens sørpol mot et representativt sett av LunaNet-reléer. sigma_ure_m gir tilgang til nøyaktigheten for avstandsmåling i signal i rommet (beskyttelsesnivåene skalerer lineært med den, så et sveip over den svarer på hvilken nøyaktighet for avstandsmåling en varslingsgrense krever). Standardverdien er det historiske tilfellet av LNIS-klassen ved sørpolen.

engine-kind-lunar-time-offset-description = Modellert relativistisk klokkerate mellom jorden og månen (Lunar Coordinate Time, LTC/TCL): den sekulære LTC−TT-raten fra forskjellen i selvpotensial og månens kinetiske ledd, oppgitt med det publiserte båndet på 56–59 µs/døgn, pluss den akkumulerte forskyvningen over en horisont.

engine-kind-lunar-vlbi-description = Modellert observerbar for geodetisk VLBI-forsinkelse på månen: en jordgrunnlinje (to bakkestasjoner, GCRS) observerer et enveissignal fra et fyr av NovaMoon-klassen på månens overflate. Gir ut nærfeltsforsinkelsen som differanse mellom to avstander, dens rate og nærfeltskorreksjonen for bølgefrontens krumning over en passering — kontrollert mot den tilsvarende planbølge-Δ-DOR-observerbare i samme kodebase i fjernfeltsgrensen, med partielle deriverte verifisert ved finite differanser. Den analytiske standardveien er MODELLED og bærer forbeholdene om referansesystemkonsistens, polbevegelse xp=yp=0 og planbølge mot nærfelt. Hvis du setter planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path, kjøres kjerneveien i stedet (DE440, MOON_PA_DE440, ITRF93; konvergerte barysentriske lystider; legger til epokens partielle deriverte for fyr og stasjon), og dens newtonske forsinkelse og partielle deriverte stemmer med NAIF SPICE konvergerte lystider til { $lit_0_06 } ps og 7.4e-9. Ikke validert mot virkelige VLBI-data.

engine-kind-lunar-joint-od-clock-description = Modellert felles flerteknikks batch-estimator for månens banebestemmelse (OD) + klokke på et SIMULERT nettverk: en Gauss-Newton-snapshottilpasning som slår sammen geodetiske VLBI-forsinkelser for jordgrunnlinjer, lokale avstander mellom stasjon og satellitt på månen og avstander mellom satellitter, for å gjenopprette sammen 3D-posisjonen til en stasjon på månens overflate, posisjonene til en liten konstellasjon og klokkeforskyvningen til hver enhet ut fra en påført referanse. Hovedresultatet, ærlig oppgitt — VLBI gjør stasjonens fulle 3D-posisjon observerbar der lokal avstandsmåling på månen alene lar en retning være svakt observert — rapporteres som kontrasten i stasjonsfeil med og uten VLBI. MODELLED simulert gjenoppretting i lukket sløyfe (referansen deler observasjonsmodellen), deterministisk (med seed), IKKE validert mot virkelige data; ingen propagering med kraftmodell i løseren; ingen TRL-, arv- eller byråstøtte.

engine-kind-lunar-frame-realisation-description = Modellert realisering av referansesystemet for månen: en datumtilpasning med 7 parametere etter Helmert (likhetstransformasjon) — 3 translasjoner, 3 små rotasjoner, 1 skala — som knytter et estimert sett av MCMF-punktkoordinater avledet fra selenografiske koordinater til et datum ved vektet minste kvadraters metode (crate::batch_ls::gauss_newton), pluss en enkel orienteringsknytning som uttrykker den realiserte lille rotasjonen om ICRF-aksene i forhold til IAU 2015 WGCCRE-orienteringen av legemet. Scenarioet påfører en kjent liten transformasjon (translasjon ~titalls m, rotasjon ~µrad, skala ~1e-7) på et godt spredt syntetisk punktnettverk, legger til gaussisk støy med seed, gjenoppretter datumet og rapporterer den gjenopprettede transformasjonen, gjenopprettingsfeilen per parameter mot den påførte referansen og RMS-residualen etter tilpasning. MODELLED selvkonsistens — gjenoppretter en påført likhetstransformasjon (uten støy til ~maskinpresisjon), IKKE en realisering mot virkelige sporings-/VLBI-data; deterministisk (med seed); ingen TRL-, arv- eller byråstøtte.

engine-kind-moonlight-service-volume-description = Modellert analyse av tjenestevolumet for navigasjon på månen ut fra en ILLUSTRATIV konstellasjon i månebane av Moonlight/LCNS-klassen fra offentlige kilder (ikke tilknyttet ESA): sveiper et selenografisk gitter av breddegrad/lengdegrad over en tidshorisont og rapporterer DOP / dekning / tilgjengelighet (≥4 sat. OG PDOP < terskel) pluss en generalisert ARAIM-envelope for beskyttelsesnivå (HPL/VPL) på månen over volumet. DOP-geometrien GJENBRUKER kjernen som er VALIDATED mot gnss_lib_py (crate::orbit::dop); beskyttelsesnivået GJENBRUKER LunaNet LNIS-maskineriet for ARAIM på månen (crate::lunar, σ_URE≈30 m) og reduseres til det eksisterende beskyttelsesnivået for sørpolen som et spesialtilfelle. MODELLED sammensetning: et sett av reléer med sirkulære/elliptiske Kepler-baner (ikke den virkelige differensialkorrigerte LCNS/NRHO-efemeriden), en måne med middelrotasjon (ingen librasjon/presesjonerende pol). Deterministisk (ren geometri). Ingen TRL-, arv- eller byråstøtte.

engine-kind-lunar-differential-pnt-description = Modellert DIFFERENSIELL PNT på månen (en analog til DGNSS/SBAS på månen): en referansestasjon av NovaMoon-klassen på et KJENT selenografisk sted beregner differensialkorreksjoner per satellitt ut fra en ILLUSTRATIV konstellasjon av Moonlight/LCNS-klassen fra offentlige kilder (NovaMoon nevnes bare som en systemKLASSE, ikke tilknyttet ESA), og en bruker forskjøvet med baseline_km anvender dem slik at de FELLES bane- og klokkefeilene opphever hverandre. Klokkeleddet oppheves NØYAKTIG (en algebraisk identitet); banedelen etterlater bare projeksjonen av forskjellen i siktelinje, som → 0 når grunnlinjen → 0 (gulvet for romlig dekorrelasjon) og vokser ≈ lineært med grunnlinjen. Rapporterer brukerens 3D-posisjonsfeil MED og UTEN korreksjoner, reduksjonsfaktoren, kurven for feil mot grunnlinje og et beskyttelsesnivå for brukeren som GJENBRUKER SBAS-maskineriet fra DO-229E (crate::sbas) med differensialresidualen σ. MODELLED — eksakt identitet for oppheving + førsteordens dekorrelasjonsmodell; ikke validert mot virkelige data; ingen TRL-, arv- eller byråstøtte. Deterministisk hvis den kjøres med seed.

engine-kind-lunar-station-coverage-description = Modellert dekning for en referansestasjon på månen: et Monte Carlo-sveip av modellen for differensiell PNT på månen over et brukergitter ved sørpolen og et døgn med epoker. En differensiell referansestasjon på et kjent sted ved sørpolen korrigerer en oppgitt konstellasjon (illustrativ Kepler-bane eller en tabulert efemeride) med en oppgitt feil i signal i rommet, innmålingsfeil, korreksjonsforsinkelse og kvantisering av lenken; per punkt og over regionen rapporterer den persentilen for korrigert og ukorrigert posisjonsfeil (3D, horisontal, vertikal), tilgjengelighet, dekning mot en oppgitt terskel, beskyttelsesnivåer etter DO-229E, dekningsradius per azimut og lenkebudsjettet for korreksjonene ved stasjonen og ved det verste punktet. Ikke en uttalelse om ytelsen til noe virkelig system; ikke tilknyttet eller støttet av noe byrå. MODELLED.

engine-kind-lunar-interop-export-description = Modellert interoperabilitetseksport for månen: gir ut referansesystemet for månen, tidsskalaen for månen og efemeriden for månen i utvekslingsformer basert på CCSDS og tilpasset LunaNet/IOAG, med rundtur / feltkontroll. GJENBRUKER crate-ens CCSDS OEM 2.0-skriver og -parser (crate::oem), omtagget for månekonteksten — OEM-ens REF_FRAME bærer IAU 2015 WGCCRE-legemssystemet for månen (MOON_ME / MOON_PA), TIME_SYSTEM tidsskalaen for månen (LTC / TCL / UTC), CENTER_NAME = MOON — over en illustrativ eksempelefemeride av LCNS-klassen (posisjoner fra crate::lunar_service, hastighet ved finite differanser). Gir også ut en deskriptor for månetid tilpasset LunaNet/IOAG (skala-id, sekulær rate µs/døgn fra crate::lunar_time, publisert bånd, referanseflate) som går rundtur via serde_json, og pakker artefaktene inn i den eksisterende KIF-konvolutten (crate::interchange) med ærlighetsmerket MODELLED. Rapporterer utgitte artefakter, antall OEM-linjer, bestått feltkontroll + liste over felt som er til stede/mangler, OEM-rundtur ok, rundtur for tidsmetadata ok og KIF-størrelse i bytes. MODELLED — deterministisk rundtur + kontroll av feltnavn mot publisert CCSDS OEM + feltsemantikk fra LunaNet/IOAG er den uavhengige referansen; IKKE en sertifisert test av interoperabilitet; illustrativ efemeride fra offentlige kilder, ikke tilknyttet ESA; ingen TRL-, arv- eller byråstøtte.

engine-kind-timetransfer-description = Optisk mot RF toveis overføring av tid/frekvens.

engine-kind-quantum-anomaly-detect-description = MODELLED feil-/anomalideteksjon for kvante-PNT-systemer: en merket feilkatalog (klokkens frekvenssprang/drift/tap av lås; sensorens bias-steg/bortfall), en ROC-AUC for deteksjonsstatistikken (med et bootstrap-KI fra den eksternt validerte eval_stats) og en minste detekterbare feil ved en fast falsk-alarmrate, der den kvanteklokkestøttede monitoren (lavere støy) oppdager mindre feil — som ærlig TradeEvidence + representativitet. Gaussisk modell for deteksjonsstatistikken (AUC = Phi(mu/(sigma*sqrt2))); modellerer klassen, illustrative parametere fra offentlige kilder, ingen TRL/flyging/sertifisering.

engine-kind-quantum-gnss-free-nav-description = MODELLED GNSS-fri kvantenavigasjon: under et GNSS-utfall, et kvantebasert (kaldatom-interferometer) treghetsbudsjett mot et klassisk INS av navigasjonsklasse — vekst i posisjonsfeil over drivfasen, holdover til en posisjonsterskel, og avveiningen mellom kvante og klassisk som ærlig TradeEvidence med representativitet. Ærlig merknad om observerbarhet: uten ekstern posisjonsbestemmelse er akselerometerets bias uobserverbar, så feilen vokser; kvantesensoren bremser, men tetter ikke det gapet. Illustrative parametere for enheten fra offentlige kilder; modellerer klassen, ingen TRL/flyging/sertifisering.

engine-kind-quantum-time-transfer-description = MODELLED kjede for pålitelig kvantetidssynkronisering: et ende-til-ende-budsjett for tidsoverføring med kvante (optisk gitterklokke + sammenfiltring/enkeltfotonlenke) mot klassisk (CSAC + toveis RF), et gjenbrukt beskyttelsesnivå for tidssynkronisering + et sikkerhets-FoM mot forsinkelses-/replay-angrep (1-P_md), en deteksjonssannsynlighet for klokkeanomalier + CUSUM-latens, og avveiningen mellom kvante og klassisk som ærlig TradeEvidence med en post for representativitet + gap mot flyging. Illustrative parametere for enhet/lenke fra offentlige kilder; modellerer klassen, ingen TRL/flyging/sertifisering hevdet.

engine-kind-hybrid-description = Hybrid PNT-sluttstein: klokke + IMU + støtte fra tidsoverføring.

engine-kind-fusion-description = Felles Kalman-sensorfusjons-PNT over de samme hybride inndataene.

engine-kind-hybrid-ukf-description = Hybrid kvante+klassisk tett koblet GNSS/INS-UKF med 17 tilstander (MODELLED): 15 INS-feiltilstander + CAI-avledet korreksjon av akselerometerbias + en klokke med 2 tilstander (fase+frekvens) fra klokkemotoren med q-parametere, drevet av den innrammede CAI-feilmodellen. Fortjenestetallet er filterets selvkonsistens (NEES + innovasjonshvithet mot χ²-grenser) — en uttalelse om selvkonsistens, IKKE en garanti for nøyaktighet i den virkelige verden. Kun simulering; ingen TRL>3, ingen flyarv, ingen ekstern validering.

engine-kind-gnss-ins-description = Løst og tett koblet GNSS/INS-EKF med feiltilstander.

engine-kind-gnss-sim-description = Pseudoavstandssimulering i måledomenet (Klobuchar-ionosfære, Saastamoinen/Niell-troposfære) + RAIM.

engine-kind-jamming-description = Jamming med lenkebudsjett: J/S → effektiv C/N₀ → tap av lås.

engine-kind-spoof-description = Stokastisk detektor for tids-spoofing (Neyman–Pearson / χ²₁) med Monte Carlo P_fa/P_md.

engine-kind-spoof-detect-description = Kombinert RF-/måledetektor for spoofing (RAIM-konsistens over flere SV + AGC + SQM, fusjonert) mot et parametrisert angrep (effektfordel, innretting av bærebølgefase, push i tid/posisjon; TEXBAT-stil).

engine-kind-sweep-description = 1D-sveip for en avveiningsstudie over en parameter i en klokkepakke.

engine-kind-sweep-nd-description = Generisk N-D-sveip over en hvilken som helst pakke via punktsatte TOML-nøkler / JSON-metrikkstier.

engine-kind-gravity-map-description = GPS-fri navigasjon med gravitasjonskartmatching: et kaldatomgravimeter gjenoppretter en konstant INS-drift fra sekvensen av gravitasjonsanomalier det flyr gjennom.

engine-kind-terrain-nav-description = GPS-fri terrengreferert navigasjon (TERCOM/SITAN): en radar-/barohøydemåler matcher bakkehøydeprofilen mot en DEM i SRTM-stil for å gjenopprette INS-driften.

engine-kind-terrain-slam-description = GPS-fri sekvensiell (rekursiv) terrengreferert navigasjon: et partikkelfilter kjører målemodellen for terrengmatching epoke for epoke (SITAN som et løpende filter), slik at en tidsvarierende INS-drift følges langs sporet, der den batchbaserte terrain-nav bare gjenoppretter én enkelt konstant forskyvning.

engine-kind-combined-altpnt-description = GPS-fri kombinert navigator for gravitasjon + magnetisme + terreng: tre skalare feltkanaler slått sammen per veipunkt for en skarpere posisjonsbestemmelse av driften (lavere CRLB) enn noe enkeltfelt.

engine-kind-pvt-description = Enkeltpunktsposisjonering fra virkelige observasjoner: løs en mottakers posisjon fra en RINEX 3-observasjonsfil og en kringkastet navigasjonsfil (kodepseudoavstander, kringkastet efemeride, Klobuchar-ionosfære, Saastamoinen/Niell-troposfære), eventuelt validert mot en oppmålt koordinat.

engine-kind-mars-pnt-description = PNT for dypt rom ved Mars: en simulert MARCONI-relékonstellasjon (areostasjonære + skråstilte reléer som kringkaster enveis + videresender toveis til en stasjon i dypt rom) navigerer en referansebruker (transfer | lmo | surface) gjennom den felles estimatoren for enveis/toveis radiometrisk fusjon. Rapporterer geometri/synlighet per epoke, oppnådd RMS mot referansen og den formelle kovariansen (1σ / 3σ posisjon) — et ærlig simulert FoM, IKKE et sertifisert beskyttelsesnivå.

engine-kind-impairment-eval-description = Evalueringstestbenk for AI/ML-deteksjon av RF-forstyrrelser (13494): generer et merket, parameterforankret SYNTETISK korpus (nominal/jamming/spoof-time/spoof-position/multipath), skår en detektor (energy|agc|sqm|parity|fused) med den detektoruavhengige harnessen, og rapporter AUC/ROC/forvekslingsmatrise + Pd per klasse ved en mål-Pfa, pluss optimismegapet mellom data i og utenfor fordelingen. Kun MODELLED driftskarakteristikker — aldri felt/IQ, ingen god/dårlig-dom.

engine-kind-quantum-trade-description = Avveining kvante mot klassisk PNT (13503): nytten for timing-holdover + treghets-holdover av en kandidatklokke (en målt ADEV-kurve — det avgjørende forsvarspunktet — eller en kvanteklokkeklasse) mot en klassisk grunnlinjeklasse, med forbeholdet om antagelsen om gulvet ved lang tau båret på artefakten, pluss en omslutning av GNSS-nektet robusthet mot tid. MODELLED; kvantifiserer (validerer aldri) en partnerenhet. Kandidatklokken er en målt kurve (`candidate_adev_taus` + `candidate_adev_values`, like lange, minst 2 punkter; den går foran når begge former er oppgitt) eller en `candidate_clock_class`.

engine-kind-space-weather-description = Modell av romværmiljøet: solaraktivitet (F10.7/F10.7a) og geomagnetisk aktivitet (Kp, med den definisjonsmessige tabellen Kp↔ap) som indekser, eksosfæretemperaturen etter Jacchia-1971 de driver (validert mot publisert solminimum/middel/solmaksimum), og nøytraltettheten i termosfæren etter Jacchia-1971 ved døgnmiddelet av eksosfæretemperaturen mot den aktivitetsfrie statiske profilen i et sett av høyder — solsyklusavhengigheten i tettheten som den statiske atmosfæren utelater. MODELLED: tettheten stemmer med akselerometeravledede tettheter (TOLEOS CHAMP og GRACE) innenfor en faktor 2 ved solmaksimum, men er omtrent { $lit_1_7 }x for tett i solminimumet i 2008.

engine-kind-oem-interop-description = Interoperabilitetsbro for CCSDS OEM: importer en Orbit Ephemeris Message laget av et eksternt verktøy for flydynamikk (GMAT/Orekit/STK gir alle ut OEM) og rapporter segmenter/objekter/referansesystemer/epokespenn pluss en kontroll av hastighetskonsistens; uten inndata går den rundtur med en generert referansebane og rapporterer troverdigheten import↔eksport. MODELLED strukturell/fysisk innlesingskontroll, IKKE en validering av banenøyaktigheten til kilden.

engine-kind-launch-window-description = Tolegemegeometri for oppskyting og stigning: oppskytingsazimut, minste oppnåelige inklinasjon, sirkulær hastighet, jordrotasjonens østlige bonus, Δv for dogleg-planendring når målinklinasjonen er under stedets breddegrad, og antall daglige oppskytingsmuligheter (sin Az = cos i / cos lat). MODELLED geometri med kuleformet jord (ingen korreksjon med hastighetstrekant for roterende jord, ingen modell for stigning/dragtap).

engine-kind-reentry-description = Allen-Eggers-korridor for ballistisk gjeninntreden: toppdeselerasjon (uavhengig av ballistisk koeffisient, V_e^2 sin|γ|/(2eH)), hastigheten og høyden ved topp-g, og hastigheten ved topp-oppvarming, for en inngangshastighet/flybanevinkel/ballistisk koeffisient gjennom en eksponentiell atmosfære, pluss en plan punktmasseintegrasjon av den samme ballistiske gjeninntredenen med tyngdekraft, jordkrumning og US Standard Atmosphere 1976 (toppdeselerasjon, fart, høyde og tid ved toppen). MODELLED ballistisk (uten løft) gjeninntreden; oppvarmingsutdataene er hastigheten ved topp-oppvarming, IKKE en varmefluks (ingen aerotermisk/TPS-modell).

engine-kind-eo-coverage-description = Fotavtrykk og dekningsgeometri for jordobservasjonsnyttelast (SMAD-romtrekant): jordens vinkelradius, svathbredde, bakkeoppløsning i nadir, maksimal tilgang utenfor nadir, sirkulær periode, J2-nodeperiode og avstand mellom ekvatoriale bakkespor med et flagg for sammenhengende dekning, for en banehøyde, inklinasjon (solsynkron som standard) og sensorens FOV/IFOV. MODELLED geometri med kuleformet jord (ingen radiometri/MTF/atmosfære/jitter/glint); nodeavstand R_e·(ω − Ω̇)·T_nodal med førsteordens sekulære J2-rater.

engine-kind-space-packet-description = Innramming etter CCSDS 133.0-B Space Packet Protocol: kod en syntetisk TM/TC-pakkestrøm (primærhode på 6 oktetter + datafelt) og rapporter dekodingen av hodet per pakke, totalt antall oktetter og en eksakt rundtur kode↔dekode. Deterministisk, eksakt innramming av bitoppsett — interoperabilitetslaget for pakkeformat hos byråene; IKKE en sertifisering av samsvar (ingen logikk for sekundærhode/CRC/segmentering utover flaggene).

engine-kind-attitude-budget-description = Feilbudsjett for orientering og peking med 3 frihetsgrader: det verste tilfellet av forstyrrelsesmoment fra gravitasjonsgradient ((3/2)(μ/R³)ΔI) og et root-sum-square-budsjett for pekefeil over navngitte 1σ-bidrag (sensorstøy, jitter fra reaksjonshjul, termisk, innretting) med det dominerende leddet, for en banehøyde + spredning i legemets treghet. MODELLED skalart AOCS-budsjett — et supplement før maskinvare til Basilisk/42, ikke en simulering av reguleringssløyfe/6-DoF/fleksible moder.

engine-kind-passes-description = Prediksjon av passeringer over bakkestasjon: passeringene med synlighet i tidsdomenet (AOS/TCA/LOS, maksimal tilsynelatende elevasjon, varighet) for en sirkulær bane, som SGP4-middelelementer ved vinduets start, over en stasjon over en elevasjonsmaske i et vindu, med total tilgangstid. SGP4/SDP4-propagering i det jordfaste referansesystemet etter IAU 2006/2000A (valgfritt UT1 - UTC og polbevegelse), ITU-R P.834-9 troposfærisk refraksjon og lystiden for nedlenken (begge på som standard), krysninger løst til 1e-7 s og kulminasjonen ved gyllent snitt-søk. Passeringsgeometrien er VALIDATED mot Orekit 13.1.8 ved stasjoner på havnivå; scenarioets bane og stasjon er illustrative inndata.

engine-kind-link-budget-description = Enveis lenkebudsjett etter lenkeligningen i CCSDS 401 / DSN 810-005: frirommstap, C/N₀, Eb/N₀, margin og lukking for en sender-EIRP, mottaker-G/T, avstand, datarate og bånd (s|x|ka) mot et påkrevd Eb/N₀. En deterministisk ingeniørberegning fra de oppgitte inndataene (ikke et kalibrert databladd for en terminal).

engine-kind-lunar-time-budget-description = MODELLED ende-til-ende tidsfeilbudsjett for Coordinated Lunar Time (LTC): de sju LTC-feilleddene satt sammen som tidsfeilkurver x_i(τ) over et helt rutenett av midlingstider, summert som rot til x_Σ(τ), og KRYSNINGS-τ mellom klokke og referansesystem, der det voksende klokkeleddet overtar for det konstante sanntidsleddet for realisering av referansesystemet (under den er budsjettet begrenset av referansesystemet, over den av klokken) — det ærlige svaret på artefakten med én enkelt τ. τ-stigningene er på lukket form og kan sjekkes analytisk (klokke τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }, gulv τ^0, måling τ^{ "{" }-1/2{ "}" }), og klokkeradene gjengir de publiserte klokkespesifikasjonene for ett døgn (crate::clock_specs); STØRRELSENE på gulvene for RF-/optisk lenke, realisering av referansesystemet, relativistisk residual og efemeride er Modelled budsjettallokeringer (dokumenterte standardverdier, kan overstyres av kalleren), ikke målinger. Bidraget er den reproduserbare krysnings-τ, ikke et sertifisert tall per ledd; ikke sertifisert for operativ tidtaking.

engine-kind-hybrid-optical-rf-description = MODELLED felles fortjenestetall for heterogen optisk + RF PNT (P5): setter sammen lenkebudsjettet for toveis optisk lenke på 1550 nm (fotonbegrenset CRLB for toveis avstandsmåling σ_τ/√N og diffraksjonsfotavtrykk λ/D·avstand), et beskyttelsesnivå med RAIM og løsningsseparasjon på tvers av modaliteter (posisjon OG tidssynkronisering) som slår sammen den løse RF-løsningen og den tette optiske løsningen med ulike kovarianser, den optiske tilgjengeligheten ved klar himmel for N stasjoner (uavhengig union 1−Π(1−a_i) og en romlig korrelert variant), en overlevering av tilstand/kovarians mellom optisk↔RF med et PÅVIST bitkontinuerlig (uten hopp) middel og en NEES χ²-konsistensport, og en samlet skår P(tilgjengelig OG presisjonsklasse OG integritetssikret) med håndtering av korrelasjon. VALIDATED lukket form: CRLB for avstandsmåling, diffraksjonsfotavtrykk, χ²-kvantilen for beskyttelsesnivå, kombinatorikken for union, kontinuitet i middel ved overlevering + NEES-porten, og det felles uavhengige produktet. MODELLED: de optiske tapsallokeringene, størrelsene på RF-/optisk σ, inndata fra skyklimatologi, korrelasjoner og P_HMI-budsjettet. Ikke et sertifisert produkt for tilgjengelighet/integritet.

engine-kind-cislunar-observability-description = MODELLED observerbarhet for en plan cislunar konstellasjon (P6): sporer en konstellasjon av fire romfartøyer i differensialkorrigerte plane DRO-er med avstandsmåling mellom satellittene og rapporterer hvor mye av et romfartøys firetilstand [x,y,ẋ,ẏ] buen gjør observerbar. Gir ut (1) tabellen rang mot buelengde for en enkelt lenke med kun avstand — øyeblikkelig rang 1, voksende mot full firetilstand etter hvert som buen forlenges (P6 tabell 1); (2) egenspekteret til observerbarhetsgramianen + kondisjonstallet over buen; (3) sammenligningen av øyeblikkelig rang for kun avstand mot avstand+avstandsrate (spaken for Doppler i utformingen) pluss rapporteringen av GDOP som er singulær for kun avstand / definert for avstand+rate; og (4) en uavhengig SRIF-kryssvalidering der den posteriore kovariansen blir endelig / veltilpasset nøyaktig ved buen der den observerbare rangen når fire. VALIDATED kjerne: den observerbare rangen er en rangavslørende terskel på singulærverdier, krysskontrollert mot egenrangen til gramianen; egenspekteret følger de spektrale invariantene (spor=Σλ, det=Πλ, Frobenius²=Σλ²); den variasjonelle STM-en er den CR3BP-STM-en som er verifisert ved finite differanser; radene i jacobianen for avstand/avstandsrate er analytiske partielle deriverte verifisert ved finite differanser (krysskontrollert mot crate-ens 3D-observerbare for avstandsrate); de fire initialbetingelsene er differensialkorrigerte plane DRO-er som lukker seg til en stram periodisitetsresidual og er retrograde; rangovergangen er kryssvalidert mot crate-ens kvadratrotinformasjonsfilter (posterior kovarians endelig nøyaktig ved full rang, cond(P)=cond(OᵀO)); et rangdefekt snapshot flagges som GDOP-udefinert (fim condition=inf), aldri som en falsk endelig verdi — den samme vernen mot singulær geometri som pvt::solve_spp bruker. MODELLED: utformingen av konstellasjonen (DRO-ens perilune-amplituder og -faser) og den spesifikke rangprogresjonen den gir. Ikke et sertifisert produkt for navigasjonsytelse.

engine-kind-conflict-resilience-description = MODELLED robusthet for lagdelt PNT i konflikt (P7): en bruker i et omstridt miljø har flere PNT-lag (GNSS med åpen tjeneste, bredbånds-GNSS, en autentisert konstellasjon, et relé for utvidelse), hver med en basistilgjengelighet, en 1σ-nøyaktighet og en sårbarhet for nekting per vektor mot den delte jamming-/spoofingtrusselen. Et intensitetssveipet Monte Carlo med SEED nekter hvert lag med sannsynlighet clamp(vulnerability·intensity·vector_weight,0,1), fusjonerer de som overlever med regelen for invers varians på lukket form σ_fused=(Σ 1/σ_i²)^(−1/2), og rapporterer sannsynligheten for totalt tap (alle lag nektet), medianen av den fusjonerte feilen og statistikk for brukbarhet/nekting per lag mot intensitet. Hovedforholdet for robusthet (enkeltlag mot lagdelt sannsynlighet for totalt tap) havner på ~7x under forutsetningen om UAVHENGIGHET; et sveip med korrelert nekting etter en enfaktors gaussisk kopula viser så at de ~7x faller sammen mot 1 når korrelasjonen mellom nektingene øker (korrelasjon motvirker lagdeling). En blokk for prioritetsfølsomhet lar hovedtallet variere over de KILDEBELAGTE sårbarhetsprioritetene via mcda-tornadoen + en Dirichlet-omfordeling av trusselinnsats + persentil-KI-er. VALIDATED kjerne: Monte Carlo-estimatet av totalt tap konvergerer mot det uavhengige produktet på lukket form Π_i p_deny_i (innenfor MC-standardfeilen ved fast seed og stor N); fusjonen med invers varians er en identitet på lukket form; ved ρ=0 reduseres kopulaen til den uavhengige modellen, og hver ρ bevarer marginalraten for nekting i hvert lag. MODELLED: størrelsene på sårbarhet/tilgjengelighet/nøyaktighet per lag er kildebelagte, men Modelled inndata (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), og den spesifikke størrelsen ~7x og formen på kurven forhold-mot-korrelasjon følger av denne parametriseringen. En oppdeling av overlevelse per vektor i §4.2 løser så den delte RF-trusselen opp i de fire navngitte vektorene (jamming/spoofing/kinetisk/cyber) og rapporterer hver vektors kurve for gradvis forringelse av brukbar PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: Monte Carlo med seed per lag konvergerer mot denne lukkede formen; jamming er den skarpeste vektoren for den korrelerte RF-grunnlinjen, og det RF-immune treghetslaget er den avgjørende overlevende. Ikke et sertifisert produkt for navigasjonstilgjengelighet.

engine-kind-lunar-attack-surface-description = Angrepsflate for signalsikkerhet ved navigasjon på månens overflate (P1): setter de åpne analysene av signalsikkerhet sammen til én kjøring som kan nås fra binærfilen. Rapporterer (1) AFS-mottatt effekt og dens effektOVERSKUDD i forhold til en terrestrisk GPS-referanse, pluss båndet for følsomhet på 12-18 dB som et ekte flerakset sveip over lenkens inndata (referansenivå x EIRP x skrå avstand) med forsoningen av lineærfaktorene 25x avrundet / 28x uavrundet. REVIDERT (regel R4): dette rapporterte et effektUNDERSKUDD på { $lit_15_6 } dB og en faktor 32x/36x helt til GPS-referansen ble korrigert fra -125 / -{ $lit_128_5 } (som er dBm-tallene) til -155 / -{ $lit_158_5 } dBW, ICD-GPS-200-verdiene som jamming-modulen alltid har båret. Fortegnet snur: det modellerte AFS-signalet på månen er { $lit_14_4 } dB STERKERE enn terrestrisk GPS L1 C/A, ikke svakere. Selve mottatt effekt endret seg ikke med en bit, og lineærfaktoren er den gamle delt på nøyaktig 1000, som nettopp er forskjellen på 30 dB mellom dBm og dBW; (2) den påkrevde senderstyrken for en angriper for å spoofe (J/S = 3 dB) og for å nekte (J/S = 30 dB) ved hver avstand, den inverse av J/S-lenken; (3) fangstfotavtrykket i bane under et virkelig antennemønster med uniform apertur (Airy [2 J1(x)/x]^2), en undersfærisk kalott begrenset av høyde der limb IKKE fanges; (4) et beregnet utfall av pull-in for spoofingfangst i sporingssløyfen (drar en spoofer med matchet kode ved en gitt effektfordel og kodeforskyvning faktisk med seg DLL/PLL) i stedet for den påståtte terskelen på 3 dB; (5) den geometriske horisontrekkevidden på et legeme uten atmosfære for en hevet sender på overflaten; og (6) budsjettet for OSNMA/TESLA-autentisering (20 bit/s ekstra = ~40 % av en AFS-navigasjonsmelding på 50 bit/s, forsinkelse ved offentliggjøring av nøkkel, 2^-40 forfalskning). Et tomt innhold gjengir P1-grunnlinjen; hver inndata har en standardverdi og kan overstyres. VALIDATED delresultater bærer den uavhengige referansen fra kildemodulen sin (lukket form for dB-radiometri; rundtur for invers J/S; Airy-mønster mot A&S Bessel og geometri for sfærisk kalott; DLL/PLL-pull-in mot Kaplan & Hegarty; identitet for sfærisk tangenthorisont mot eo_payload; OSNMA SIS-ICD-feltdimensjonering). MODELLED: de representative størrelsene for geometri/effekt og de spesifikke celleverdiene i fangstkartet. Ikke et sertifisert sikkerhetsprodukt.

engine-kind-realtime-frame-eop-description = Budsjett for prediksjon av referansesystem for månen / jordorientering i sanntid: P4 tabell 1 (konsistenskontrollen av referansesystemfeil — etterbehandlet ~{ $lit_0_27 } m ↔ ~{ $lit_0_010 } ms og sanntid ~15 m ↔ ~{ $lit_0_5 } ms, hver posisjon i referansesystemet uttrykt som sin tilsvarende UT1-feil via L19-vektarmen Δr = D_EM·ω⊕·ΔUT1) og tabell 2 (målt UT1-prediksjonsfeil mot horisont — L18-kurven lest direkte av den virkelige IERS finals2000A-serien: det endelige gulvet Bulletin A − Bulletin B og persistensprediktorens feil over flere døgn, hver avbildet til en posisjon i månens referansesystem med L19), pluss L21-budsjettet for referansesystemfeil i sanntid som root-sum-square (EOP + efemeride + realiseringsgulv). VALIDATED lukket form (L19-vektarmen, ω⊕ krysskontrollert mot CIO-jordrotasjonsvinkelen) og VALIDATED virkelige data (L18-kurven av de virkelige radene i finals2000A); MODELLED er størrelsene på OD-kovariansen for månereléer og realiseringsgulvet for referansesystemet (representative allokeringer) og persistensprediktoren (ikke IERS sin operative Bulletin A-algoritme). Ikke et sertifisert produkt for referansesystem i sanntid.

engine-kind-aperture-duty-cycle-description = Driftssyklus for aperturer: tidsfordelingen mellom navigasjon og kommunikasjon en kontaktplan innebærer for en pulje av styrbare aperturer. Tar en kontaktplan (en liste av `[[contacts]]`-vinduer med aos_s/los_s, hvert med forespørsel om navigasjon eller kommunikasjon — det samme aos_s/los_s-vokabularet som prediktoren `passes` gir ut), et antall aperturer og en ARBITRERINGSPOLICY (navigasjonsprioritet som standard, eller kommunikasjonsprioritet, eller ikke-preemptiv først-til-mølla), og rapporterer navigasjonsdriften, kommunikasjonsdriften, ledig drift og bortfallet per økt — kontakttiden en økt ba om og ingen apertur betjente. Et eksakt intervallsveip over vindusgrensene, slik at vinduer som berører hverandre aldri konkurrerer og ingen apertursekunder telles dobbelt; navigasjons-, kommunikasjons- og ledige apertursekunder akkumuleres uavhengig og går opp mot apertures*horizon_s. Rapporten oppgir den løste policyen, dens fulle definisjon og definisjonene av drift og bortfall, fordi et driftstall oppgitt uten arbitreringspolicy ikke kan reproduseres. MODELLED planleggingsaritmetikk: ingen tid for svinging / omstilling / skifte belastes når en apertur skifter tjeneste eller økt, ingen datavolum, bufferstatus, energibudsjett eller lenkelukking inngår i beslutningen, og kontaktvinduene er inndata — geometrien deres er det som frambrakte dem. Ikke et produkt for planlegging av bakkesegment.

engine-kind-lunar-jamming-description = Månespesifikk RF-jamming: J/S per satellitt, effektiv C/N₀ og tap av lås for en selenografisk bruker på overflaten under en jammer på månens overflate (eller hevet), over den illustrative konstellasjonen i månebane av Moonlight/LCNS-klassen fra offentlige kilder. Setter sammen den eksisterende åpne fysikken for jamming (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) med den eksisterende himmelgeometrien for månen (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri utledes på nytt. I motsetning til jordkinden `jamming` er signalleddet IKKE en fast mottatt effekt: hver satellitts isotrope mottatte effekt er dens eget lenkebudsjett EIRP − FSPL(skrå avstand), så J/S varierer fra satellitt til satellitt med avstand og elevasjon på månen. Rapporterer ÉN RAD PER SYNLIG LENKE (epoke, satellitt) — azimut, elevasjon, skrå avstand, begge mottatte effekter J/S er differansen av, J/S, nominell og effektiv C/N₀ og lock-status — pluss samlede fortjenestetall ved siden av (aldri i stedet for) den tabellen, og den samme tabellen som CSV-artefakt. Hvert utgitt numerisk felt bærer en enhet og en proveniensklasse. VALIDATED delresultater bærer den uavhengige referansen fra kildemodulen sin (anti-jam-ligningen og J/S-lenken fra Kaplan & Hegarty §9.4, eksternt referert i tests/gnss_denied_jamming_resilience_reference.rs; månegeometrien fra lunar_service). Selve sammensetningen er krysskontrollert mot en uavhengig vei med to lenkebudsjetter (linkbudget::received_signal_power_dbw, et annet uttrykk for frirommstap) til 1e-9 dB. MODELLED: den illustrative konstellasjonen, representativ EIRP / jammereffekt / antennegevinster / støytemperatur, og fraværet av terrengskygge, multipath, AGC-dynamikk og adaptiv nulling. Ikke et sertifisert produkt for denial-of-service. Med en jammer konfigurert bærer rapporten også en NEKTINGSKONTUR MED ET USIKKERHETSBÅND i stedet for en kontur lest av ett enkelt skalar: hele den målte fordelingen av ønsket signal-C/N₀ over tabellen per satellitt (n, min, p05, p25, median, p75, p95, maks, gjennomsnitt, utvalgets standardavvik og utvalgets egen asymmetri), og konturen evaluert ved hver av disse ordensstatistikkene under BEGGE nektingskriteriene motoren gjenkjenner — det etablerte effektforholdskriteriet (J/S = 30 dB, som i attack-surface og tracking-loop) og kriteriet tap av lås (effektiv C/N₀ som faller til tracking_threshold_dbhz, kriteriet denne rapportens egen statuskolonne bruker) — på begge aksene i nektingsplanet (påkrevd jammer-EIRP ved scenarioets avstand, nektingsavstand ved scenarioets EIRP). Bandkantene ER contour(p05) og contour(p95), den samme lukkede avbildningen anvendt på utvalgets egne kvantiler: ikke en sigma tilpasset utvalget og ikke median ± k·stdev, med stdev gitt ut for kontinuitet og brukt av ingenting. En kvantil som allerede er på eller under sporingsterskelen har ingen endelig J/S som nekter, og kolonnene for tap av lås er null med en talt årsak, aldri en avkortet radius.

engine-kind-ins-trn-coast-description = Feilmodell for INS/TRN-drift: posisjonsfeil mot varighet av driften, bygget fra IMU-koeffisienter i stedet for sveipet som en antatt driftrate. Fem bidrag til vekst — akselerometerbias, tilt fra gyrobias gjennom tyngdekraften, hastighets-random walk, vinkel-random walk og skalafaktor mot tilbakelagt avstand — hver propagert gjennom en treghetsfeilmodell med ni tilstander i lokalt nivå med Schuler-tilbakekobling ved en oppgitt breddegrad og høyde (de ledende lovene for kort drift t², t³, t^1.5, t^2.5 og t¹/t² rapporteres ved siden av) og kombinert under en OPPGITT regel (root-sum-square som standard, eller lineær sum, eller deterministisk sum med stokastisk rss; alle tre beregnes ved hver kjøring slik at valget er synlig i stedet for skjult). Varighetene av drift som når posisjonsterskler oppgitt av kalleren (10 m og 50 m som standard) finnes med motorens eksisterende halvering, hver med en oppdeling per bidrag som navngir den dominerende kilden, og hvert enkeltbidrags krysning inverteres i tillegg algebraisk slik at de to stemmer. En modus for terrengrelativ navigasjon begrenser driften med periodiske posisjonsbestemmelser og rapporterer det største intervallet mellom dem som holder hver terskel; en posisjonsbestemmelse med kun posisjon lar hastighetsfeil og tilt leve videre over posisjonsbestemmelsen, så den begrenser ikke alltid driften ved noen rate, og rapporten sier det i stedet for å gi en null. MODELLED: IMU-klassens koeffisienter er representative tall for et bånd, ikke et databladd, og residualen etter terrengposisjonsbestemmelse er en inndata. En terskel som ikke nås rapporteres som null med en status, aldri som en null. Ikke et sertifisert produkt for ytelsen til treghetsnavigasjon.

engine-kind-lunar-vlbi-fim-description = Kovarians for stasjonskoordinater ved VLBI på månen: de partielle deriverte av forsinkelsen for den observerbare i lunar-vlbi akkumulert over en eksplisitt PLAN (grunnlinjer x epoker) til en Fisher-informasjonsmatrise, invertert og rapportert som kovariansen for stasjonskoordinatene og stasjonens sigma per koordinat — en beregnet utdata fra motoren i stedet for en skalar forsinkelsespresisjon skjøvet gjennom en antatt isotrop ekvipartisjonsfaktor g = 3. Tilstanden bærer JORDFASTE (ITRS) stasjonskoordinater, så jacobianen er den inertielle partielle deriverte rotert med hver epokes GCRS->ITRS-matrise: jordrotasjonen er det som gjør disse koordinatene observerbare, og rapporten MÅLER det jordfaste sveipet av siktelinjen og deklinasjonen til fyret i stedet for å anta dem. Én observasjon er ett par (grunnlinje, epoke) med BEGGE stasjoner over elevasjonsmasken, vektet 1/delay_sigma_s^2. Rapporterer rang, datumdefekt, kondisjonstall, hele informasjonsspekteret, kovariansmatrisen, sigma per stasjon per akse og i 3D, og nullrommet for det frie nettverket ved hver kjøring; ved rangdefekt publiseres hovedsigmaen som NULL med en status, aldri lest ut av en nesten singulær invers. Ekvipartisjonsverdien c*delay_sigma_s*sqrt(g/N) for den SAMME planen gis ut ved siden av den beregnede verdien med forholdet, sammen med den isotrope sporgrensen sqrt(p/trace(M)) som AM-HM gjør til et hardt gulv — så forholdet er anisotropien som antagelsen forkastet. Forsinkelseslukkingen tau_ik = tau_ij + tau_jk gjør at bare n-1 av de n(n-1)/2 grunnlinjene er geometrisk uavhengige; rapporten oppgir begge tallene. MODELLED: efemeriden for månens sentrum, stasjonsklokker, troposfære og jordorienteringsparametere holdes FASTE og observasjonene behandles som uavhengige, så kovariansen er en Cramer-Rao-grense for et redusert parametersett, ikke et predikert resultat av en økt; forsinkelsens sigma, stasjonskoordinatene og planen er inndata. Den partielle deriverte som jacobianen for geometrisk forsinkelse utelater (det differensierte Shapiro-leddet) måles ved finite differanser og gis ut. Ikke et geodetisk produkt.

engine-kind-tracking-loop-description = Tap av lås i sporingssløyfen: C/N0 -> lås/opphevet lås MED HYSTERESE, tiden det tar å miste låsen, og spoofing-pull-in som funksjon av RATEN for kode- og bærebølgeforskyvning. Motorens eksisterende kriterier for nekting og fangst er forhold på mottatt effekt (en jammer nekter ved J/S = 30 dB, en spoofer fanger ved 3 dB); virkelig tap av lås er ikke et effektforhold, det er der en sløyfes jitter pluss dynamisk belastning lar den falle under budsjettet for sporingsterskel. Rapporterer (1) 1-sigma termisk jitter for bærebølge (Costas) og kode (ikke-koherent early/late) mot C/N0, med kvadreringstap, mot de oppgitte reglene 3*sigma_PLL + theta_e <= 45 deg (15-gradersregelen i tresigmaform) og 3*sigma_DLL + ramp lag <= d/2 chips; (2) C/N0-terskelene for tap og ny låsing med den bindende sløyfen navngitt, der terskelen for ny låsing er UTLEDET av den bredere båndbredden en mottaker trekker inn igjen med i stedet for påstått, så hysteresebredden må ligge mellom 5*log10(ratio) og 10*log10(ratio) dB; (3) den erklærte tiden til tap av lås fra en låsdetektor med to terskler og bekreftelsestider drevet over en C/N0-rampe, rapportert atskilt fra den fysiske tiden for faseflukt (Viterbis gjennomsnittlige tid mellom syklusslipp, i log10 s fordi den spenner over hundrevis av dekader); (4) grenser for spoofing-pull-in — den største kodesvingen og bærebølge-Dopplerraten en offers sløyfer kan følge, med et kart over begge aksene, fordi en spoofer som svinger raskere enn dette ikke fanger sløyfen, den løper fra den; og (5) NEKTINGSRADIUSEN som sløyfedynamikken innebærer, rapportert VED SIDEN AV den eksisterende effektforholdsradiusen, aldri i stedet for den, med deres fortegnsbaserte differanse som et eget navngitt felt (denial_radius_delta_km) og en definisjon ved siden av. Hvert utgitt numerisk felt bærer en enhet og en proveniensklasse. VALIDATED lukkede former: uttrykkene for bærebølge- og kodejitter, sløyfefilterreduksjonen sqrt(2*B_n*T) og førsteordens rampeforsinkelse er krysskontrollert mot motorens egen sdr-korrelator steppet framover på syntetisk IF med seed — en annen vei til de samme tallene — til henholdsvis { $lit_0_6 } %, { $lit_3_7 } % og { $lit_0_17 } %, og den modifiserte Bessel I0 bak tiden for syklusslipp mot standard tabellerte verdier til 1e-7. Den nedre gyldighetsgrensen er hevdet, ikke bare oppgitt: under ~32 dB-Hz ved 1 ms metter den virkelige atan-diskriminatoren mot sitt +-pi/2-område og måler mindre jitter enn noen lineær teori. MODELLED: sløyfebåndbreddene, integrasjonstiden, korrelatoravstanden, forholdet for pull-in-båndbredde, bekreftelsestidene, jammereffekten og antennegevinstene er representative tall for et bånd, ikke et databladd. IKKE modellert: jitter fra oscillator (Allan-avvik) og vibrasjon, begrensning av båndbredden i frontenden, multipath, AGC-dynamikk, tap ved databitovergang, ekstern støtte og enhver halvsyklus-korreksjon til Costas-formelen for syklusslipp. Under sløyfedynamikk har spoofingfangst ingen radius i det hele tatt — den bindende begrensningen er forskyvningsraten, ikke effekten — så det feltet er null med en årsak i stedet for et oppdiktet tall. Ikke et sertifisert produkt for mottakerytelse.

engine-kind-araim-reference-check-description = Publiserte ARAIM-referansevektorer for sertifisering: motorens horisontale og vertikale ARAIM-beskyttelsesnivåer kjørt mot de EGNE utarbeidede numeriske eksemplene til WG-C ARAIM Technical Subgroup, ved toleransen (TOL_PL = 5e-2 m) disse dokumentene selv oppgir. To vektorer er innsjekket som fixtures, hver med sin URL for innhenting, dato for innhenting, SHA-256 for kildefilen og side: Reference Airborne Algorithm Description Document v3.1 (2019) vedlegg D — selvkonsistent, og akseptvektoren — og Milestone 3 Report (2016) Annex A avsnitt A.IX, utsagnet forskningsbibliografiene siterer. Hver publiserte inndata (geometrimatrisen for 10 satellitter og 2 konstellasjoner, diagonalene for varians C_int og C_acc, b_nom, P_sat, P_const og konstantsettet for LPV-200) og hver publiserte utdata (VPL, HPL, EMT, sigma_v_acc, K_fa_3 og sigma_3, sigma_ss_3 og b_3 for de to feilmodusene for konstellasjon) rapporteres ved siden av motorens eget tall og deres absolutte differanse. Ligningen for beskyttelsesnivå løses IKKE på nytt her: referansens modusliste gis til motorens eksisterende raim::araim_protection_level / araim_integrity_risk, slik at halveringen og den gaussiske hale-algebraen som testes er motorens egne; bare geometrien, delløsningene, deteksjonsterskelene og den publiserte fordelingen av budsjettet bygges for den. EKSTERNT KONTROLLERT mot vektoren fra 2019: VPL { $lit_18_2926 } m mot { $lit_18_3 } m publisert, HPL { $lit_13_4063 } m mot { $lit_13_45 } m, EMT { $lit_7_2997 } m mot { $lit_7_2998 } m, sigma_v_acc { $lit_1_3694 } m mot { $lit_1_3694 } m, og alle seks publiserte mellomresultater innenfor en halv enhet i sin siste trykte desimal. Vektoren fra 2016 bærer to interne feil som rapporten oppgir i stedet for å skjule — en fortegnsfeil i rad 3 i G, og en K_fa_3 evaluert ved 57 feilmoduser mens dokumentet oppgir N_fault_max = 1 (12 moduser) — så dens mellomresultater for geometri gjengis eksakt mens beskyttelsesnivåene rapporteres som målte avvik og utelates fra akseptfiguren; toleransen utvides aldri for å absorbere dem. Hvert utgitt numerisk felt bærer en enhet og en proveniensklasse, og et overført tall merkes `published` slik at det aldri kan forveksles med et beregnet. OMFANG: bare N_fault_max = 1 (feilmoduser for én enkelt satellitt og én enkelt konstellasjon) er implementert, og et tilfelle der prioritetene krever samtidige delmengder med flere hendelser er REFUSED i stedet for stille avkortet; feildeteksjon, utelukking, χ²-konsistenskontrollen og trinnet for omfordeling av dobbelttelling i referansealgoritmen ligger utenfor omfanget. Dette gjengir det utarbeidede eksempelet i en publisert referansealgoritme — det er ikke en sertifisering, en luftdyktighetsartefakt eller en godkjenning.

engine-kind-lunar-frame-campaign-description = Datum for et referansesystem med sju parametere etter Helmert (likhetstransformasjon) drevet av en SIMULERT OBSERVASJONSKAMPANJE i stedet for av en påført transformasjon. Et nettverk av jordstasjoner observerer en katalog av fyr på månens overflate over en eksplisitt plan; de partielle deriverte av forsinkelsen for VLBI på månen akkumuleres over den planen til en Fisher-informasjonsmatrise for fyrkoordinater akkurat som lunar-vlbi-fim gjør; og den informasjonen propageres gjennom Helmert-designet A = [I3 | [p]_x | p] i katalogpunktene til datumkovariansen H = A^T M_b A, diagnostisert av crate::fim::crlb. INGEN transformasjon påføres og ingenting gjenopprettes fra et plantet svar, så den rapporterte datumnøyaktigheten stammer fra observasjonsprogrammet: å halvere forsinkelsens sigma halverer den eksakt, og å forlenge buen forbedrer den fordi librasjonen rapporten MÅLER (sub_earth_direction_sweep_deg) er det som skiller fyrkoordinaten i siktelinjen fra de i himmelplanet. Rang, datumdefekt, kondisjonstall, hele spekteret, de uobserverbare retningene I BASISEN MED SJU PARAMETERE, den svakeste retningen selv ved full rang og hver parameters andel av den gis ut ved hver kjøring; en parameter kampanjen ikke begrenser publiseres som NULL med en status, aldri lest ut av en nesten singulær invers. Korrelasjon mellom fyrfeil måles, ikke antas: med stasjonene holdt faste berører ingen observasjon to fyr, så informasjonsmatrisen er eksakt blokkdiagonal (offblock_fraction 0), og med stasjonene estimert er den Schur-marginaliserte blokken koblet, med den induserte korrelasjonen skrevet ut og hele propageringen kjørt på nytt med den forkastet, slik at prisen for en antagelse om uavhengighet er et tall. Den samme propageringen under en isotrop sigma per koordinat, og gjenopprettingsfeilen scenarioet lunar-frame-realisation rapporterer, kjøres begge her og skrives ut ved siden av kampanjeverdien med forholdene mellom dem. MODELLED: fyrkatalogen er kildebelagt, men KAMPANJEN er simulert — stasjonsnettverket og forsinkelsens sigma er illustrative inndata, enkeltobservasjoner av forsinkelse behandles som uavhengige, og efemeriden for månens sentrum, stasjonsklokker, troposfære og jordorienteringsparametere holdes FASTE, så datumkovariansen er en Cramer-Rao-grense for et redusert parametersett. Ikke et geodetisk produkt.

engine-kind-lunar-llr-datum-description = Datum for et referansesystem for månen med sju parametere etter Helmert drevet av en VIRKELIG, ARKIVERT observasjonskampanje i stedet for en simulert. Der lunar-frame-campaign fjernet den påførte transformasjonen, men fortsatt oppga stasjonsnettverket, planen og sigmaen per observasjon som ILLUSTRATIVE inndata, tar denne kinden alle tre fra målinger: epokene er sendetidene fra bakken for arkiverte ILRS Consolidated Laser Ranging Data-normalpunkter, observasjonene er laseravstandene som virkelig ble avfyrt mot de fem retroreflektorsettene på månen, og hver observasjonsvekt er det normalpunktets egen arkiverte presisjon bin_rms/sqrt(n_raw) lest ut av filen. Stasjonskoordinatene kommer fra IERS ITRF2020 SLR-løsningen (propagert til epoken med sine publiserte hastigheter) og reflektorkoordinatene fra JPL DE430 tabell 7 i det middeljord-/middelrotasjonsreferansesystemet IAU 2015 WGCCRE-modellen realiserer. Partielle deriverte av avstand akkumuleres til den felles Fisher-informasjonsmatrisen for reflektorkoordinater og propageres gjennom det samme Helmert-designet til datumkovariansen, diagnostisert av crate::fim::crlb. Rang, defekt, kondisjon, spektrum, uobserverbare retninger i basisen med sju parametere, den svakeste retningen ved full rang og hver parameters andel av den gis ut ved hver kjøring, og en parameter uten begrensning publiseres som NULL med en status. Korrelasjon mellom settene MÅLES til nøyaktig null i stedet for å antas, fordi en laseravstand berører ett sett. En post katalogene ikke kan plassere — en stasjon uten publisert ITRF-posisjon — er HOPPET OVER OG TALT, aldri gitt en erstattet koordinat. HVILKE LENKER SOM ER MÅLT OG HVILKE SOM ER MODELLED ER SELVE RAPPORTEN, IKKE EN FOTNOTE: efemeriden for månens sentrum og IAU-orienteringen av legemet forblir modellert, og deres samlede størrelse gis ut som residualen observert-minus-beregnet for enveis avstand over hvert punkt som er brukt; troposfære, faste legemers tidevann, stasjonseksentrisitet, polbevegelse, UT1-UTC, relativistisk forsinkelse og stasjonsklokker er fraværende og ligger inne i den residualen. Fordi en efemeridefeil bare når en kovarians gjennom retningen på hver siktelinje, løser hver kjøring også hele datumet på nytt med alle partielle deriverte vippet med sensitivity_tilt_deg (vekslende fortegn) og gir ut forholdet, slik at kovariansens ufølsomhet for den modellerte efemeriden er et tall i stedet for et argument. Den simulerte kampanjens egne tall KJØRES og skrives ut ved siden av de målte, ikke overført. MODELLED: tallene for de sju parametrene er en Cramer-Rao-grense for et redusert parametersett på en virkelig plan — ikke et løst datum, ikke en LLR-analyse og ikke et geodetisk produkt. Det innsjekkede utsnittet av virkelige data følger med repositoriet, men ikke med den publiserte crate-en; pek data_dir på en kopi av det.

engine-kind-lunar-beacon-description = Utvidelse av en orbital navigasjonstjeneste for månen med overflatefyr, som en kjørbar før/etter-tabell. En bruker ved sørpolen ser et tynt orbitalt sett i en smal flekk av himmelen, så geometrien for avstandsmåling er dårlig kondisjonert; noen få OPPMÅLTE OVERFLATEFYR gir de radene for siktelinjer med lav elevasjon og bred azimut som et sett som alt står i senit mangler, og den horisontale dilusjonen av presisjon kollapser. Scenarioet rapporterer tre konfigurasjoner ved én epoke — kun satellitter, satellitter pluss de synlige fyrene, og en større konstellasjon som alternativ vei til den samme geometrien — hver med sine antall synlige kilder, sin fulle DOP og den realiserte 1-sigma-nøyaktigheten i METER, oppnådd ved å multiplisere med en brukerekvivalent avstandsfeil per fyr satt sammen som root-sum-square av ledd for klokkesynkronisering, multipath og oppmåling. Synlighet av fyr er den geometriske horisonten for månen uten atmosfære med to høyder (ingen atmosfære, så grensen er eksakt), og DOP-sammensetningen er den samme kjernen som er krysskontrollert mot gnss_lib_py i tests/dop_reference.rs. HVORFOR DENNE KINDEN FINNES: modulen bak den har vært i motoren og kontrollert mot en uavhengig DOP-vei siden L08/L09, men den kunne ikke nås fra en kjøring — ingen kind, ingen dispatch-arm, ingen medfølgende fil. README-en annonserte funksjonen og verifikasjonsmatrisen hadde INGEN rad for den i det hele tatt, så den var samtidig hevdet i prosa og ikke hevdet i registeret, mens den var utilgjengelig i motoren. Standardverdiene er geometrien som allerede bærer en innsjekket golden (en bruker ved -80 deg med en antenne på 2 m, tre fyr ved -80/0, -79/+60 og -79/-60 på 2 km, et illustrativt LCNS-snapshot med seks satellitter ved t=0, en maske på 5 deg), så en kjøring uten argumenter gjengir en tabell en uavhengig referanse allerede dekker i stedet for å finne på nye tall. MODELLED: utformingen av konstellasjonen, plasseringen av fyrene og alle størrelser i feilbudsjettet er illustrative inndata, ikke en feltmessig oppmåling eller en målt lenke; bare DOP-aritmetikken, den lukkede formen for horisonten og relasjonen sigma = DOP x sigma_URE er forankret eksternt. Ikke en forpliktelse om tjenesteytelse.

engine-kind-earth-gnss-lunar-description = Mottak av jord-GNSS på månens avstand, laget med svakt signal som artikkelen om robusthet i konflikt navngir og som motoren ikke hadde noen modell for. En GNSS-satellitt peker antennen mot jorden; en mottaker nær månen sitter omtrent femten ganger banens radius unna, så tre ting biter samtidig. Jorden SKJULER SIKTEAKSEN: fra 26,560 km utspenner den en halvvinkel på { $lit_13_9 } deg, så enhver stråle mot månen må forlate senderen minst så langt fra nadir, noe som fjerner toppen av loben før noen effekt er beregnet. Det som gjenstår er HOVEDLOBENS KANT OG SIDELOBENE, regimet LuGRE-nyttelasten faktisk opererte i under 2025. Og frirommstapet er omtrent 208 dB ved L1, omtrent 25 dB mer enn en terrestrisk bruker betaler. Rapporten gir ut én rad per satellitt (vinkel utenfor siktelinjen, jordokkultasjon, avstand, veitap, sendegevinst ved den vinkelen, mottatt effekt, bærebølge-til-støytetthet) og aggregerer bare lenkene som klarer sporingsterskelen. DEN RAPPORTERER OGSÅ KONDISJONERINGEN, fordi det er det som definerer dette laget: hver synlig satellitt ligger innenfor en kjegle på et par grader sett fra månen, så siktelinjene er nesten parallelle, dilusjonen av presisjon er enorm, og en jord-GNSS-posisjonsbestemmelse på månens avstand er en observasjon av TIDSSYNKRONISERINGSklasse mye mer enn av posisjonsklasse. MODELLED, og sendemønsteret er grunnen: gevinsten ved vinkel er en uniform sirkulær apertur (Airy), mens en virkelig GPS L1-antenne er en heliksformet gruppe med tolv elementer med en formet hovedlobe og ikke-Airy-sidelober. Målte mønstre finnes og er ikke medlevert her, så rekkefølger og størrelsesordener er meningsfulle mens dB for en enkelt satellitt ikke er det. Bevisst FRAVÆRENDE, hver med at budsjettet blir optimistisk: intet ionosfærisk eller troposfærisk tap på strålene som tangerer limb, intet tap for polarisasjon, peking eller implementering, og en kuleformet jord uten refraktiv utvidelse. Månens posisjon er en INNDATA (avstand pluss inertiell retning) i stedet for et efemeridoppslag, fordi størrelsen som testes er lenken og stråleoppsettet. Å oppgradere denne raden til Validated krever et målt sendemønster og LuGRE-normalpunkter; ingen av dem finnes i repositoriet og ingen er funnet på her.

engine-kind-lunar-infrastructure-description = MODELLED studier av månens bane og overflate som infrastruktur for navigasjon og geodesi, fem studier bak én kind valgt med `study`: od-consistency (banebestemmelse ombord med jord-GNSS i en NRHO eller ELFO mot uavhengig radiometrisk banebestemmelse fra bakken, bedømt etter sine egne kovarianser over et Monte Carlo med seed), carrier-phase (felles dobbeltdifferensiert bærebølgefase mellom overflate og orbiter og oppløsning av heltallsflertydighet med LAMBDA), frame-coestimation (en stasjon på overflaten og orbitere lagt til avstandsmåling fra jordstasjoner for datumet i referansesystemet for månen med sju parametere), space-tie (GNSS, VLBI og laseravstandsmåling på ett romfartøy, presisjon i referansesystemknytningen mot feilen i lokalknytningen) og geodesy-sensitivity (Fisher-informasjon for Love-tallene h2, k2, l2 for månen og den fysiske librasjonen fra laseravstandsmåling, sporing av orbitere, et gravimeter på overflaten og en klokke på overflaten). En begrenset tre-legemers modell med oppgitte forenklinger; tallene er kontrollert mot uavhengige programmer og ingenting er sammenlignet med en måling av en størrelse på månen.

engine-kind-cislunar-arc-recovery-description = MODELLED test med uavhengig estimator av terskelen for observerbarhet i buelengde for cislunar bane. Den terskelen er en RANG-avlesning på observerbarhetsmatrisen satt sammen av de ANALYTISKE radene i jacobianen for avstand og den ANALYTISKE variasjonelle tilstandsovergangsmatrisen, og dens krysskontroll med kvadratrotinformasjonsfilter bretter inn de samme radene — en konsistenskontroll mellom to numeriske maskiner, ikke belegg. Denne kinden gir den manglende dommeren: en batch-estimator med minste kvadrater som faktisk GJENOPPRETTER sjefens initialtilstand fra simulerte målinger, med de partielle deriverte for målingene tatt som SENTRALE FINITE DIFFERANSER av den sammensatte foroverrettede modellen. Den kaller ingen analytisk jacobianrad, ingen variasjonell STM, ingen singulærverdi- eller egenverdidekomposisjon, ingen rangtoleranse og intet kvadratrotinformasjonsfilter — en vern i kildeteksten i tests/cislunar_arc_recovery_reference.rs gjør dette håndhevbart — mens dynamikken (den samme RK4 CR3BP-flyten), initialbetingelsene (den samme differensialkorrigerte konstellasjonen), den skalare observerbare og epokerutenettet deles med vilje og navngis i den utgitte `independence`-blokken, fordi to analyser av ett fysisk problem må være enige om fysikken for å kunne sammenlignes. To kriterier, hvert sveipet over fem dekader av sin egen grense: STØYFRI GJENOPPRETTING (hver forsøkstilstands endelige tilstandsfeil høyst recovery_factor ganger dens a priori forskyvning — rangmotstykket, uten singulærverditoleranse i det) og MONTE CARLO-ESTIMERBARHET (den målte RMS-posisjonsfeilen over et støyensemble med seed under en oppgitt grense — estimerbarhetsmotstykket, målt i stedet for predikert). Støtter den plane firetilstanden og den romlige sekstilstanden, familiene DRO / L2 halo / L2 NRHO, observerbare for avstand og avstandsrate, og en månesentrert polar parametrisering der transformasjonen anvendes på TILSTANDEN og den foroverrettede modellen differensieres på nytt der. MÅLT på det publiserte plane DRO-rutenettet: estimatoren gjenoppretter firetilstanden fra { $lit_0_782609 } t mot rangkriteriets { $lit_2_086957 } t ved rel_tol 1e-6 (forhold { $lit_0_375 }) — rangterskelen er IKKE bekreftet som en grense for gjenopprettbarhet — mens den målte grensen for estimerbarhet havner i den samme rutenettcellen som den formelle, { $lit_5_739130 } t, og den målte feilkurven gjengir den formelle 1-sigma over 21 buelengder til et geometrisk middelforhold på { $lit_0_98 }. MODELLED: utformingen av konstellasjonen, epokerutenettet, den ene sporede lenken, størrelsen på forskyvningen, målingens sigma og de to oppgitte grensene. Ikke et sertifisert produkt for navigasjonsytelse.

engine-kind-telecom-timing-description = Telekomtidssynkronisering: tidsfeil, maksimal tidsintervallfeil (MTIE) og tidsavvik (TDEV) for en GNSS-holdover, kontrollert mot ITU-T-masker med PASS eller FAIL og en margin per maske. Inndata er enten en SYNTETISK HOLDOVER (en oscillatorforhåndsinnstilling -- ocxo, rubidium, caesium eller csac, hver med stabilitets-, aldrings- og temperaturtallene fra et navngitt offentlig Microchip-databladd -- pluss tiden for GNSS-tap, opptakslengde og samplingsintervall; den frittløpende klokken bærer hvit, flicker- og, der tilpasningen til databladdet trenger det, random walk-frekvensstøy, lineær aldring og et sinusformet temperaturledd) eller en INNLEST SERIE av par [time_s, time_error_ns] oppgitt inline (og, bare på native bygg, en CSV-fil). Masker: ITU-T G.8272 (07/2025) PRTC-A og PRTC-B (maks|TE| 100 / 40 ns, MTIE tabell 1-2, TDEV tabell 3-4); G.8272.1 (2024) Amd. 1 (07/2025) ePRTC låst (30 ns, tabell 1-2) og ePRTC-A holdover (tidsfeilomslutningen i tabell 3 som stiger fra 30 ns til 100 ns over holdoverperioden H satt av den låste varigheten, MTIE tabell 4, TDEV tabell 5); G.8273.2 (2023) Amd. 2 (11/2025) T-BC/T-TSC klasse A-C (maks|TE|, konstant tidsfeil, lavpassfiltrert MTIE og TDEV) og klasse D (maks|TE_L| 5 ns, det eneste tallet for klasse D som ikke er overlatt til videre studier); G.8271.1 (2022) Amd. 3 (05/2025) referansepunkt C (maks|TE_L| 1100 / 600 / 100 ns med MTIE tabell 7-1 til 7-3). Hver post en Recommendation merker for videre studier er fraværende i stedet for utfylt, og hver rapport lister hva som ikke er implementert. Rapporterer også tiden til hvert budsjett for maksimal tidsfeil overskrides (standardverdier: 100 ns ePRTC maks|TE_HO|, 400 ns tildeling for nettverks-holdover, 1100 ns punkt C, { $lit_1_5 } us klasse 4), MTIE/TDEV-kurvene som en CSV-tabell med hver maskegrense, og en post for enheter og proveniens per numerisk felt. VALIDATED: estimatorene for MTIE og TDEV mot pakken allantools på en innsjekket holdoverserie. MODELLED: masketabellene er transkripsjoner, og en syntetisk holdover er en modell bygget fra maksimalverdier i databladd, ikke en måling av noen enhet. Ikke en test av samsvar.

engine-kind-slot-timing-description = Slottiming: sekunder til en frittløpende klokke forlater vakten til en tidsindeksert rutings- eller oppgaveslot (den største absolutte tidsfeilen slotten tåler), bidraget fra hvert ledd i det øyeblikket med det dominerende navngitt (usikkerhet i posisjonsbestemmelse, hvit fasestøy, hvit, flicker, random walk og random run frekvensstøy, residual frekvensforskyvning, temperatur, aldring), tiden som er igjen siden siste posisjonsbestemmelse, og det største intervallet mellom posisjonsbestemmelser som holder klokken innenfor, netto etter latensen for posisjonsbestemmelsen. Oscillatoren er en KLASSE-standard (csac, uso, dsac, tcxo, ocxo eller rafs: ett sitert Allan-avvik ved ett sekund og et antatt gulv for rød støy), en DATABLADD-FORHÅNDSINNSTILLING fra telecom-timing eller et inline DATABLADD (maksimalverdier for Allan-avvik tilpasset som en omslutning, pluss aldring og en temperaturkoeffisient), eller en inline MÅLT FASEREGISTRERING (dens overlappende Allan-avvik tilpasset med vektet minste kvadraters metode i basisen hvit fase og IEEE Std 1139 frekvensmodulering, så gulvet for rød støy er målt i stedet for antatt). Et brudd utover den lengste midlingstiden databladdet eller registreringen støtter flagges som ekstrapolert. En valgfri seksjon for spoofing legger til beskyttelsesnivået for tidssynkronisering for en mottaker i bane: banehastighet og periode, hvor lenge en enkelt spoofer på bakken kan nå satellitten per passering, gulvet for den klokkestøttede monitoren og CUSUM-deteksjonslatens, den betingede grensen, trekket en spoofer med en oppgitt maksimal rampefart akkumulerer før satellitten forlater rekkevidden eller en uavhengig kontroll kjøres, og om hver kontroll mot bakkekontakt eller krysslenke er uavhengig av den spoofer. VALIDATED: holdover-inversjonen fra en tilpasset registrering, holdt tilbake på en virkelig caesiumklokke målt mot et hydrogenmaser (tests/slot_timing_cs5071a_holdout.rs, datastyrt); på en målt krystalloscillator er den tilbakeholdte prediksjonen konservativ, men ikke innenfor terskelen, så krystalltilfellet er MODELLED. MODELLED: klasse- og databladdkilder, de deterministiske leddene og vurderingen av spoofing.

engine-kind-spectrum-description = Spektrummodell og vannfall for L-bånd: hele GNSS L-båndet som én effektspektraltetthet (PSD), frekvens bortover, tid nedover, over en skriptet tidslinje for jammere. SIGNALER: GPS L1 C/A og L2C (BPSK(1)), Galileo E1 åpen tjeneste (MBOC(6,1,1/11), eller BOC(1,1)), GPS L5 og Galileo E5a (BPSK(10)), hver ved sin bærebølge med minste mottatte effekt etter grensesnittspesifikasjonen (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) hvis ikke overstyrt; GLONASS, BeiDou og Galileo E6 er ikke modellert. JAMMERE: kontinuerlig bølge (tone), flat smalbåndsstøy, lineær sagtannchirp og bredbåndsstøy tilpasset et bånds egen modulasjon, hver med et senter, en båndbredde, en mottatt effekt (direkte, eller EIRP og avstand gjennom frirommstapet til jamming-kinden) og på/av-tider. Hver jammer skåres mot hvert bånd med sin spektrale separasjonskoeffisient kappa over mottakerens båndbredde, og (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; for én jammer tilsvarer dette anti-jam-ligningen til jamming-kinden med Q = 1/(R_c kappa), og rapporten bærer den krysskontrollen (og representativt Q-tall for jamming-kinden ved siden av). Støygulvet er k T_sys med T_sys = T_ant + 290 K (F - 1). Vannfallet midler hver celle over sin bin og sin rad (chirper eksakt, hele sveip pluss det delvise; jammere som slår om midt i raden etter sin driftssyklus), så C/N0-tidslinjen og bildet kommer fra de samme tallene; result.json bærer gitteret blokkmidlet i effekt, C/N0 og J/S per bånd per rad, og per jammer per bånd SSC, Q, J/S, J/S i båndet og stabil C/N0. Valgfri [iq]: modellen tegnet som kompleks IQ ved ett tidspunkt, skrevet til og lest tilbake fra et SigMF-opptak (cf32_le eller ci16_le), og sammenlignet med et Welch-estimat. Valgfri [recording] (native bygg): Welch-PSD-en til et virkelig SigMF-opptak ved siden av modellen. VALIDATED: signal-PSD-ene mot lærebokverdiene for hovedlobens bredder (BPSK(n) 2n x { $lit_1_023 } MHz null til null; BOC(1,1)-lober sentrert ved +/-{ $lit_1_023 } MHz) og de spektrale separasjonskoeffisientene mot sine lukkede former etter Parseval og Q = 1 (CW) og { $lit_1_5 } (matchet) hos Kaplan & Hegarty. MODELLED: jammereffekter, tidslinje, båndbredder i frontenden, behandlingen med kontinuerlig spektrum (ingen kodelinjer) og fraværet av AGC, blanking og antennemønster.

engine-kind-solar-system-description = Hele solsystemet ved én epoke, for PNT (posisjonering, navigasjon og tidssynkronisering) rundt et hvilket som helst legeme. For Solen, de åtte planetene, Pluto, Månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan rapporterer den heliosentrisk posisjon og hastighet i ICRF (International Celestial Reference Frame, ekvatorial J2000), heliosentrisk avstand og J2000-ekliptikal lengdegrad og breddegrad, gravitasjonsparameteren, ekvatorial og middelradius, J2 der den er publisert og dens referanseradius, den siderale rotasjonsperioden, IAU-polen og nullmeridianen ved epoken, et banespor samplet over én omdreining (heliosentrisk for planeter, sentrert på moderlegemet for måner), og lystiden, enveis og toveis avstand, solens Shapiro-forsinkelse og avstand til Solen fra et observatørlegeme (standard Jorden); ekstra from/to-lenker får den samme behandlingen. Posisjoner: JPL Kepler-elementene til Standish og Williams (tabell 1 for 1800 AD til 2050 AD, tabell 2a/2b for 3000 BC til 3000 AD) med hver planets nominelle feil, månerekken til Montenbruck & Gill for delingen Jord-Måne, JPL-middelelementer med IAU sin synkrone rotasjonsrate for Mars- og Galilei-månene, og IAU-rotasjonsmodellen for Titan. Lystid: den radiometriske fastpunktsløsningen, med senderen ved sin retarderte posisjon; newtonsk, med Shapiro-forsinkelsen rapportert separat. VALIDATED mot JPL Horizons (DE441) innenfor to ganger den nominelle feilen: Merkur til Saturn og Jorden fra tabell 1 (verst { $lit_1_87 } ganger nominelt) og alle åtte planetene fra tabell 2a/2b (verst { $lit_1_71 } ganger), og lystiden fra Jorden til Mars og Jupiter. MODELLED, hver rad merket: Uranus og Neptun fra tabell 1 ({ $lit_2_0 } og { $lit_5_2 } ganger den nominelle feilen mot DE441), Pluto (raden fra 1992; ingen oppgitt feil), Månen og de sju månene (målt mot Horizons, ingen publisert grense).

engine-kind-body-pnt-description = Posisjonering rundt et hvilket som helst legeme i solsystemet: en orbiter eller en lander på overflaten rundt et sentrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten av solsystemkatalogen), som navigerer med enveis pseudoavstander fra en liten Walker-navigasjonskonstellasjon rundt legemet (tolegemebaner med legemets egen sekulære J2-drift, en ukjent brukerklokke) og eventuelt en klokkefri toveis avstand i dypt rom fra Jorden, hvis retning og avstand kommer fra den analytiske efemeriden for solsystemet ved hver epoke. Siktelinjer blokkeres av legemets middelkule, og en bruker på overflaten trenger også elevasjonsmasken. Per epoke: reléer i sikte, om Jorden er over limb, GDOP og PDOP for kun konstellasjonen (geometrisk dilusjon og dilusjon av posisjonspresisjon), den formelle énsigma posisjonsusikkerheten med og uten raden for Jorden, og feilen til en posisjonsbestemmelse med Gauss-Newton minste kvadrater med seed hver vei; over kjøringen: tilgjengelighet, synlighet av Jorden, median PDOP, RMS-feil og median formell sigma, pluss lystid fra Jorden til legemet, rundtur, Shapiro-forsinkelse og avstand til Solen ved epoken. MODELLED: relébanene, støynivåene og den øyeblikkelige målemodellen er modelleringsvalg, ikke validert mot navigasjonsdata fra et oppdrag; legemskonstantene er de publiserte verdiene som er sitert i body.rs, og geometrien for Jorden arver merkingen til efemeriden for solsystemet.

engine-kind-constellation-design-description = Utforming av konstellasjoner i stor skala: Walker DELTA- og Walker STAR-mønstre i konvensjonen i: T/P/F (noder spredt over 360 eller 180 deg, avstand i planet 360*P/T, faseforskyvning mellom plan 360*F/T), eksplisitte elementlister og design med flere skall, flere konstellasjoner i én kjøring, rundt Jorden, Månen, Mars eller en annen planet, Pluto eller en stor måne med konstantene i body-modulen (de samme som kindene solar-system og body-pnt bruker). FORHÅNDSINNSTILLINGER fra publiserte nominelle elementer: gps-baseline og gps-expandable (de 24 slottene og de seks utvidbare parene foran/bak i GPS Standard Positioning Service Performance Standard, 5. utgave 2020, tabell 3.2-1 til 3.2-3), galileo (Walker 24/3/1 ved 29 599.801 km og 56 deg, Galileo Open Service Service Definition Document utgave 1.1 tabell 1 og 23), beidou og beidou-meo (Walker 24/3/1 ved 21 528 km og 55 deg pluss tre geostasjonære satellitter ved 80, { $lit_110_5 } og 140 deg Ø og tre skråstilte geosynkrone satellitter ved 55 deg, BeiDou Open Service Performance Standard 3.0 avsnitt 4.1; MEO-fasen og krysningen av 118 deg Ø for skråstilt geosynkron er modellert fordi standarden ikke oppgir dem) og glonass (24/3/1 ved 19 100 km og { $lit_64_8 } deg fra slotformelen i GLONASS Interface Control Document utgave 5.1 avsnitt 5.2). DEKNING OG DILUSJON AV PRESISJON: over et gitter av breddegrad/lengdegrad og et samplet vindu med en elevasjonsmaske, antall satellitter i sikte, GDOP, PDOP, HDOP og VDOP per celle, tilgjengeligheten (en posisjonsbestemmelse med PDOP på eller under en terskel, 6 som standard) per celle, globalt (arealvektet) og ved det verste stedet, med én mottakerklokke per konstellasjon med mindre clock = "common". Den skalerer til tusenvis av satellitter: synlighet er et skalarprodukt mot hver satellitts halvvinkel for dekning, og satellitter deles i bånd etter breddegraden til subsatellittpunktet hver epoke slik at en gitterrad bare tester de som kan være i sikte; rapporten teller de sparte par-testene. JSON-en bærer gitterkartene og nedsamplede bakkespor per satellitt. VALIDATED: Walker-generatoren mot Galileo OS SDD tabell 23 og GLONASS ICD-slotformelen, GPS-forhåndsinnstillingen mot den publiserte kolonnen for ekvatorkrysning i SPS PS tabell 3.2-1, og den globale HDOP-fordelingen for GPS-baseline mot SPS PS vedlegg B (median { $lit_0_94 }, 95 % { $lit_1_25 }, middel { $lit_0_96 }, toleranse { $lit_0_03 }). MODELLED: tolegemebaner med valgfri sekulær J2, et kuleformet legeme, kun geometrisk synlighet (ingen signaleffekt, helse eller terreng), og relativ fase mellom ulike systemer, som ikke er et snapshot av noen virkelig dato.

engine-kind-campaign-description = Kampanje: eksisterende scenariokinder satt sammen til én kjøring, med hvert tall lest fra en virkelig kjøring av den navngitte kinden. Fire seksjoner, i en hvilken som helst kombinasjon. FASER: et lenket oppdrag på én felles tidslinje -- hver fase kjører ett eller flere scenarioer (for eksempel jamming, så spoofing, så en klokke i holdover med et treghetsnavigasjonssystem som driver ved siden av, så en integritetsalarm, så gjenoppretting), utdataene leses inn i navngitte kanaler (klokkens tidsfeil mot sin vakt, forholdet mellom bærebølge og støytetthet mot sporingsgulvet, beskyttelsesnivå mot varslingsgrensen, posisjonsfeil, satellitter som spores, alarmflagg) med en forhåndsinnstilling per kind eller med eksplisitte resultatstier, og resamples på et felles gitter med nullteordens holding, med fasegrenser og hendelser; tilstand videreføres ved carry (en kanal fortsetter fra forrige fases sluttverdi), handoff (et tall fra en forrige fase skrevet inn i denne fasens scenario) og end_at (en fase slutter ved et tidspunkt en kjøring beregnet, som deteksjonstiden til en monitor for spoofing). SWEEP: et gitter over én til tre punktsatte scenarionøkler av en hvilken som helst kind (et heltallssegment indekserer en array av tabeller, som i system.2.sisre_m), med metrikker lest ved resultatsti og, med runs over én, et Monte Carlo-ensemble med seed ved hver node. MONTE_CARLO: realisering k kjører ved base_seed + k; hver metrikk rapporterer middel, standardavvik, 5./50./95. persentil etter nærmeste rang og et bootstrap-konfidensintervall på 95 % for middelet med fast seed. COMPOSE: flere scenarioer under felles verdier (én jammers effekt og posisjon skrevet inn i en maritim og en vei-mottaker), med en samlet beste/verste oppsummering. Resultatet bærer en kampanje-hash, et sammendrag over hvert medlemsresultat og en enhetspost for hvert tall som gis ut; interoperabilitetseksportene skriver hvert medlemsscenario som har geometri som sitt eget filsett. Identiteter for sammensetning testes: en kampanje med én fase gjengir den frittstående kjøringen bit for bit, et ensemble med fast seed er byte-stabilt, og på en klokke med hvit frekvensstøy faller ensemblemiddelet innenfor det rapporterte intervallet med spredning som samsvarer med sqrt(q_wf * tau). MODELLED: den additive carry og nullteordens holding er modelleringsvalg, og hver fase bærer merkingen til kinden som kjørte den.

engine-kind-leo-signal-description = Signalutforminger for LEO-PNT: parametriserte PNT-signaler (posisjonering, navigasjon og tidssynkronisering) fra lav jordbane (LEO) for et hvilket som helst system, bånd og struktur. Et SIGNAL er et bånd (senterfrekvens, sendebåndbredde, ITU-tildeling RNSS/RDSS/MSS/EESS/non-RNSS/other) og komponenter (anskaffelse, data, pilot; en hvilken som helst delmengde), hver med en modulasjon (BPSK(n) med brøk-n, BOC(m,n), MBOC(6,1,p) eller et flatt OFDM-lignende bånd), en effektandel, valgfrie FDMA-forskyvninger av underbærebølger, en kodelengde og en datarate. Signaler kommer fra innkompilerte offentlige forhåndsinnstillingsfiler (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; hver med sin kilde-URL og hver upublisert verdi merket REPRESENTATIVE) eller skrives inline. PER SIGNAL: den båndbegrensede effektspektraltettheten og andelen av hver komponents effekt sendebåndet slipper gjennom (lukket form for BPSK ved siden av den numeriske verdien), RMS-båndbredden (Gabor), den termiske støyjitteren for kodesporing i en delay-lock-løkke mot C/N0 og early-late-avstand fra den båndbegrensede koherente (eller ikke-koherente) early-late-formelen til Betz & Kolodziejski 2009 med dens lærebokform for ubegrenset bånd og dens Gabor-grense for forsvinnende avstand, avstandsnøyaktigheten i meter, søkerommet for anskaffelse (Doppler-bins fra banens maksimale Doppler pluss oscillator- og brukerledd, ganger kodebins), deteksjonssannsynlighet med kvadratlov og gjennomsnittlig seriell og kodeparallell anskaffelsestid, den spektrale separasjonskoeffisienten for signalet inn i GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og E5 AltBOC og for hver av dem inn i signalet med C/N0-forringelsen, og CW-, bredbånds- og matchet J/S den sporede komponenten tåler, fra spectrum-kindens eget SSC-maskineri. En BÅNDAVVEINING: førsteordens ionosfæreforsinkelse ({ $lit_40_3 } TEC/f^2), frirommstap, avstandsnøyaktighet ved lik C/N0 og ved lik EIRP, og jammertoleranse. Valgfrie FORMKONTROLLER holder et designs spektrum mot en beskrevet måling (MODELLED konsistens). VALIDATED: lukkede former for BPSK-effekt i båndet ({ $lit_90_3 } % i hovedloben) og Gabor-båndbredde, den båndbegrensede jitteren som reduseres til lærebokformen for koherent early-late og til sin Gabor-grense, den spektrale separasjonskoeffisienten for forskjøvet BPSK mot sin lukkede form etter Parseval, enhetsarealet til AltBOC-spekteret, og maksimal LEO-Doppler mot de publiserte tallene for Xona Pulsar (32-34 kHz) og Iridium (36 kHz). MODELLED: hvert design, effektfordeling, C/N0 og jammernivå; EFQPSK-, CSK- og OFDM-spektre er tilnærmet.

engine-kind-leo-pass-description = LEO-passering og lenkebudsjett, bånd for bånd, for LEO-PNT (posisjonering, navigasjon og tidssynkronisering fra lav jordbane), systemuavhengig: en bruker (bakke, maritim, luft eller innendørs, statisk eller i bevegelse) og én eller flere LEO-satellitter fra en DESIGNET PASSERING (en sirkulær bane plassert slik at brukeren ser én passering med en valgt maksimal elevasjon på et valgt tidspunkt, solsynkron hvis ønsket), eksplisitte ELEMENTER, en TLE (to-linjers elementsett) gjennom motorens SGP4, eller en WALKER-konstellasjon bygget av koden for konstellasjonsutforming (de høyeste passeringene rapporteres). Bånd kommer fra en navngitt forhåndsinnstilling (generisk flerbånds UHF/L/S/C, generisk C-bånd, Xona Pulsar X1/X5, Iridium STL, Starlink som et signal for opportunistisk bruk kun med Doppler, CentiSpace, og en valgfri Celeste IOD-forhåndsinnstilling merket WORKSHOP) eller skrives inn i scenarioet; hver forhåndsinnstilling oppgir om tallene er PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP. Per satellitt, bånd og epoke: elevasjon, azimut, avstand, avstandsrate og avstandsakselerasjon; frirommstap; EIRP og satellittens mønstergevinst (isoflux, gaussisk stråle eller flat); brukerantennens gevinst mot elevasjon (patch, halvkuleformet eller isotrop); gassdemping (ITU-R P.676-10 vedlegg 2), regndemping (ITU-R P.838-3-koeffisienter og P.618-14-prosedyren, fra en regnrate og regnhøyde), troposfærisk scintillasjon (ITU-R P.618-14 avsnitt 2.4.1), tap ved inntrenging i bygning for en innendørs bruker (ITU-R P.2109-2), polarisasjonsavvik, systemets støytemperatur og C/N0 (forholdet mellom bærebølge og støytetthet); Doppler og Doppler-rate på lukket form fra avstandsraten og avstandsakselerasjonen, hver kontrollert mot sentrale differanser; førsteordens ionosfæreforsinkelse { $lit_40_3 } STEC/f^2 fra en Klobuchar- eller vertikal-TEC-skrå TEC skalert til den delen av ionosfæren under satellitten. Båndpar får de ionosfærefrie koeffisientene, støyforsterkningen og kodestøyen ved passeringens topp. MEO GNSS-satellitter (forhåndsinnstillinger for Galileo eller GPS) evalueres med den samme antenne- og støymodellen fra mottatte effekter i grensesnittdokumentene, så den klokkeformede LEO-passeringen og de flate GNSS-bærebølgene deler ett plott. En valgfri [iot]-seksjon gir tid til første posisjonsbestemmelse, energi per posisjonsbestemmelse og batteritid mot driftssyklus for et oppgitt effektbudsjett for mottakeren (MODELLED). Hvert båndpar gir også den skrå TEC-en dens geometrifrie kombinasjon gjenoppretter ved toppen og kodestøy-sigmaen til det estimatet (ionosfæresondering). En valgfri [spoofer]-seksjon forfalsker signalene til en påstått posisjon som hopper eller skyves bort fra den sanne etter et startpunkt og kjører to monitorer med oppgitte sannsynligheter for falsk alarm og tapt deteksjon: konsistens mellom Doppler og passeringsgeometri (målte avstandsrater mot de som er predikert fra banene og en uavhengig a priori posisjon og hastighet, en generalisert χ²-test med minste kvadrater over et vindu, på GNSS-, LEO- og alle kanaler) og konsistens på tvers av bånd (steget fra epoke til epoke i hvert LEO-båndpars modellkorrigerte geometrifrie kombinasjon), som rapporterer statistikk per epoke og når hver monitor oppdager (MODELLED). VALIDATED komponenter: frirommstap, P.838-3-koeffisientene mot sin tabell 5, prosedyrene for regn og scintillasjon i P.618-14 og tapet ved inntrenging i bygning i P.2109 mot valideringseksemplene fra ITU-R Study Group 3, gruppeforsinkelsesforholdet L1/L2 i IS-GPS-200, og maksimal Doppler for en statisk bruker i en sirkulær bane mot arXiv 2509.19551 tabell 1. MODELLED: EIRP-er, mønstre, Chapman-andelen av TEC under satellitten og hele passeringen.

engine-kind-leo-navmsg-description = LEO-navigasjonsmelding: den kringkastede efemeriden og klokken til en satellitt for posisjonering, navigasjon og tidssynkronisering i lav jordbane (LEO), for en hvilken som helst bane, bærebølge og modell, med valgfrie navngitte forhåndsinnstillinger (Xona Pulsar, Iridium, Starlink, CentiSpace, et representativt C-bånd-system, nullklokkemodellen ATOMIC, Celeste IOD). INNHOLD: hjelpedata (SVID, issue of data, bånd, signalhelse), synkronisering (uke, ukesekund, et andreordens klokkepolynom af0-af2 om toc), efemeride i én av fire modeller -- Galileo OS SIS ICD sitt Kepler-sett med 16 parametere; det settet pluss korreksjonspolynomer langs banen, på tvers av banen og radielt; modellen med 22 parametere av Liu et al. 2025; et ECEF-polynom uten klokkeledd (ATOMIC nullklokke) -- og andre tjenester (et kringkastet Klobuchar-sett, NeQuick-G ai0-ai2 med det effektive ioniseringsnivået, og parametere fra systemtid til UTC med ICD-logikken for skuddsekund). TILPASSER: en referansebane integrert med sonal J2-J6 eller EGM2008-tyngdekraft til valgt grad og luftmotstand, og en fri eller styrt klokke med seed; Levenberg-Marquardt-tilpasning av Kepler-settet på ikke-singulære elementer, så lineære korreksjonspolynomer med minste kvadrater; klokke tilpasset netto etter det relativistiske leddet brukeren legger til. ANALYSER: fit-interval-trade (avstandsfeil i signal i rommet, SISRE, med globalt gjennomsnittlige vekter for banehøyden, mot tilpasningsintervall og oppdateringsperiode, kun bane og med klokke), model-comparison (fire modeller, antall parametere, kodede biter, og Kshanas tilpasning ved høydene til Liu et al. ved siden av de publiserte tallene), midpass-update (den høyeste passeringen over en bruker, hvert meldingsbyttes hopp i posisjon, klokke og brukeravstand, hopp ved verst mulig geometri, PASS/FAIL mot en kontinuitetsterskel), encode-decode (Kshanas egen dokumenterte binære ramme med CRC-24Q, et budsjett for kvantisering med halvt steg per felt, en kontroll av ødelagt ramme, en eksport og import av poster i RINEX-4-stil merket som en Kshana-utvidelse, og en CSV-tabell). VALIDATED: SISRE-vektene mot den publiserte MEO/GEO-tabellen (Montenbruck et al. 2018); brukeralgoritmen for Galileo mot RTKLIB på virkelige kringkastede Galileo-efemerider; CRC-24Q mot sin kataloggitte kontrollverdi og eksempelrammen RTCM 1005. MODELLED: hvert tall for tilpasning og SISRE er representasjonsfeil mot en referanse integrert av Kshana (ingen feil i banebestemmelse eller prediksjon); sammenligningen med Liu et al. bruker andre baner; kodingen og tekstformatene er Kshanas egne.

engine-kind-leo-pvt-description = Fusjonert PNT (posisjonering, navigasjon og tidssynkronisering) med bane i middels høyde (MEO) og lav høyde (LEO) over HVILKE SOM HELST konstellasjoner: hver [[system]] er en GNSS-forhåndsinnstilling av kinden constellation-design, en LEO-forhåndsinnstilling (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, efemeridemodellen atomic-zero-clock, eller en annen forhåndsinnstillingsfil, hver i sin egen fil med kildene merket PUBLIC, WORKSHOP eller DERIVED), Walker-skall eller eksplisitte elementsett, med en bærebølge, en chiprate, en omslutning for forholdet mellom bærebølge og støytetthet (C/N0) fra elevasjonsmasken til senit, en avstandsfeil i signal i rommet (SISRE), en Doppler-sigma og en klokkemodell (sin egen mottakerklokke, så intersystembiasen estimeres, eller en kjent kringkastet forskyvning). Fire moduser. DOPPLER: batch Gauss-Newton-posisjonering fra avstandsrate med analytiske partielle deriverte, tilstander for klokkedrift og valgfri hastighet og en valgfri høydebegrensning, med én eller flere satellitter, feilen mot vindulengde, omslutningen for Doppler, Doppler-rate og rykk for hvert LEO-system, og nøyaktigheten langs og på tvers av banen for én enkelt passering mot forskyvningen på tvers av banen (feilen på tvers av banen vokser uten grense når passeringen går over hodet; en enkelt passering har også en speilløsning over bakkesporet). Et signal for opportunistisk bruk kun med Doppler (starlink-sop) kjører her. JOINT: posisjonsbestemmelser med pseudoavstand og vektet minste kvadrater per epoke fra kun GNSS, kun LEO og begge, sigma per måling fra en modell for termisk støy i delay-lock-løkke ved C/N0 pluss SISRE (eller en fast sigma, så en signalmodell kan mate dem), de estimerte intersystembiasene, og PDOP/HDOP/VDOP mot antall LEO-satellitter lagt til. POLAR: satellitter i sikte og DOP mot breddegrad for GNSS, LEO og begge. TIMING: tidsoverføring til Coordinated Universal Time (UTC) fra LEO-satellitter ved en kjent posisjon med et klokkefilter med to tilstander der prosessstøyen kommer fra motorens oscillatorklasser, mot C/N0 og oscillatoren, og uttrykket fra systemtid til UTC i IS-GPS-200; med [timing] trace = true rapporterer hver rad også sin tidsfeil og predikerte sigma ved hver epoke. VALIDATED: den største Doppler for en passering fra senit til horisont mot de publiserte tallene for Iridium (opptil 36 kHz) og Xona Pulsar X1 (32 til 34 kHz). MODELLED: alt annet; DOP er kontrollert mot et håndutledet tilfelle, posisjonsbestemmelsene mot sin kovarians, og Doppler-modellen mot identiteten for avstandsakselerasjon.

engine-kind-leo-ppp-description = Konvergens for presis punktposisjonering (PPP) med kun GNSS og med LEO-utvidelse: et flytende utvidet Kalman-filter på ionosfærefri kode og bærebølgefase med de statiske stasjonskoordinatene, en hvit mottakerklokke, én intersystembias per ekstra system, en zenitt våt forsinkelse med random walk avbildet med 1/sin(elevasjon) og en flytende flertydighet per satellittbue; feilen i presis bane og klokke er hvit og felles for kode og fase for en satellitt, så hver satellitt er én korrelert oppdatering med to rader i en Joseph-stabilisert form. Målinger simuleres fra den samme modellen med støy med seed over flere steder og seed, og hvert tilfelle (kun GNSS først, så hver [[case]] av LEO-systemer, en hvilken som helst konstellasjon eller forhåndsinnstilling) rapporterer medianen for konvergenstid (første epoke etter at de horisontale og vertikale feilene holder seg under terskelene, 10 cm som standard), andelen som konvergerte, mediankurvene for feil og filterets konsistens (den kjøringsmidlede posisjons-NEES mot det tosidige χ²-båndet på 95 %). Valgfritt ved siden av de publiserte tallene for midlere breddegrader fra Li et al. (2019, J. Geod. 93:749, doi 10.1007/s00190-018-1195-2): { $lit_9_6 } min for multi-GNSS forkortet til { $lit_7_0 }, { $lit_3_2 }, { $lit_2_1 } og { $lit_1_3 } min med 60, 96, 192 og 288 LEO-satellitter. MODELLED: en konsistenssammenligning av trenden, ikke en gjengivelse av konstellasjonene, støyen eller stasjonene i den studien; ingen oppløsning av flertydighet, syklusslipp, faseopprulling, tidevann eller tidskorrelerte produktfeil.

engine-kind-ntn-positioning-description = Posisjonering fra en 5G ikke-terrestrisk nedlenke (NTN) i S-båndet for mobil satellitttjeneste (MSS) (3GPP-bånd n256, nedlenke 2170 til 2200 MHz; standard bærebølge { $lit_2172_5 } MHz): Cramér-Rao-grensen (CRB) for ankomsttid, c / (2 pi beta sqrt(2 (C/N0) T)) med beta rotmiddelkvadrat-båndbredden (Gabor) til det flate OFDM-spekteret (B/sqrt(12)), og for Doppler til en kompleks tone, sqrt(3 / (2 pi^2 (C/N0) T^3)), for hvert signal (standard en New Radio-kanal på 5 MHz med { $lit_4_5 } MHz belagt og en smalbåndskanal på 200 kHz med 180 kHz belagt); så, over en hvilken som helst LEO-konstellasjon, posisjonsbestemmelser fra ankomsttid i nedlenken med en ukjent mottakerklokke (med seed, med grensen pluss en nettverkssynkroniseringsfeil som sigma), deres PDOP og formelle 3D-sigma, og en Doppler-posisjonsbestemmelse med én satellitt over den lengste passeringen med høyden holdt fast. MODELLED: steget fra båndbredde til grense er lærebokens lukkede form, kontrollert mot numerisk integrasjon av de flate og båndbegrensede BPSK-spektrene (intern konsistens, intet publisert utarbeidet tall er festet), og posisjoneringsnøyaktigheten er en grense på en kanal uten multipath med en oppgitt synkroniseringsfeil, ikke et oppnådd resultat.

engine-kind-leo-pnt-chain-description = Ett LEO-PNT-system (posisjonering, navigasjon og tidssynkronisering fra lav jordbane) fra ende til ende, for en hvilken som helst konstellasjon og signal: leo-signal-designet navngitt av signal_design (en offentlig forhåndsinnstilling eller et inline [signal]-design) setter senter, båndbredde, chiprate og EIRP-fordeling for et [pass]-bånd, lenkebudsjettet leo-pass gir den sporede C/N0 og den båndbegrensede kodejitteren over passeringen, en C/N0-linje i sin(elevasjon) og den kringkastede SISRE fra [navmsg]-meldingen (tilpasset ved høyden til satellitten i passeringen) mater hvert LEO-system i den felles posisjonsbestemmelsen leo-pvt i [fusion], og eventuelt [ppp]-tilfellene leo-ppp; hver overlevering er listet med sin verdi og enhet. MODELLED.

engine-kind-contact-schedule-description = Planlegging av bakkekontakt for flere satellitter over flere stasjoner: tilsynelatende tilgangsvinduer (SGP4, jordfast referansesystem etter IAU 2006/2000A, refraksjon etter ITU-R P.834, lystid), DVB-S2 ACM-datavolumet for hver passering (terskler fra ETSI EN 302 307-1 tabell 13) og en konfliktfri plan (én satellitt per antenne med en omstillingstid, én stasjon per satellitt, prioritetsvektet levering begrenset av hvert etterslep) ved en grådig metode med marginalverdi, en først-til-mølla-grunnlinje og en eksakt branch and bound på små sett, med den grådige metodens optimalitetsgap. MODELLED.

engine-kind-acm-link-description = Én satellitt over én stasjon: hver passerings skrå avstand, elevasjon og Es/N0 langs passeringen, DVB-S2 MODCOD valgt ved hvert steg (terskler fra ETSI EN 302 307-1 tabell 13 pluss en implementeringsmargin) og datavolumet ACM flytter mot grunnlinjen med konstant koding som lukker ved masken. MODELLED.

engine-kind-aocs-description = Orientering av romfartøy: en treghetspekende svinging av et stivt navlegeme med tre eller flere balanserte reaksjonshjul under MRP-tilbakekobling (L = -K sigma - P omega), minimumsnorm-hjulmomenter avkortet til hver motors grense, RK4 med nullteordens holding; eventuelt lukket på en multiplikativ EKF fra en simulert gyro (vinkel- og rate-random walk) og stjernesporer. Rapporterer innsvingingstid, endelig og maksimal pekefeil, maksimal hjulhastighet og moment, den mettede andelen, drift i dreieimpuls og, med estimatoren, dens orienteringsfeil og NEES. Sløyfen for sann tilstand er VALIDATED mot Basilisk 2.9.1; estimatoren er MODELLED.

engine-kind-entry-heating-description = Atmosfærisk gjeninntreden som punktmasse med 3 frihetsgrader over en roterende kuleformet jord eller Mars (ballistisk eller med løft ved konstant krengning), RK4, gjennom US76, en eksponentiell atmosfære eller Mars-atmosfæren, med konvektiv oppvarming i stagnasjonspunktet etter Sutton-Graves (NASA TR R-376): toppdeselerasjon, varmefluks og dynamisk trykk, varmelast, avstand langs bakken, en energikontroll i roterende system og den lukkede formen etter Allen-Eggers ved siden av. Toppdeselerasjonen er kontrollert mot den publiserte nominelle verdien for Stardust; oppvarmingen er MODELLED.

engine-kind-eo-radiometry-description = Radiometri og bildekvalitet for nadirkamera: radians ved aperturen for en lambertsk scene, kameraligningen, signal og skudd-/mørke-/lese-/kvantiseringsstøy og SNR; systemets MTF ved Nyquist (diffraksjon x detektor x utsmøring x jitter), den relative kantresponsen fra den, Q = lambda F/p og GIQE versjon 4 NIIRS uten MTF-kompensasjon. MODELLED.

engine-kind-ascent-losses-description = Plan stigning med gravitasjonssving for et kjøretøy med flere trinn over en ikke-roterende kuleformet jord gjennom US Standard Atmosphere 1976 (vertikal stigning, tippspark, skyvekraft langs hastigheten), som integrerer tapene fra tyngdekraft, luftmotstand, styring og mottrykk og kontrollerer ideell dv minus tap mot hastigheten ved brennslutt; max-Q, toppakselerasjon og tilstand ved brennslutt. MODELLED.

engine-kind-time-transfer-budget-description = Toveis satellitt-tids- og frekvensoverføring mellom to stasjoner gjennom et geostasjonært relé: toveisligningen løst for T_A - T_B med hvert ikke-resiproke ledd (forsinkelser i stasjonsutstyr, Ku-bånd-ionosfære, transponder, Sagnac), et kvadratisk usikkerhetsbudsjett der type A-leddet er TDEV for den simulerte lenken ved midlingstiden, en simulert lenke med hvit og flicker fasestøy og en døgnvariasjon i ikke-resiprositet, og stabiliteten (rate, residual RMS, TDEV, ADEV) til en hvilken som helst oppgitt BIPM Circular T-seksjon 1-serie, MJD,ns CSV eller IGS RINEX-stasjonsklokkeposter. MODELLED.

engine-kind-optical-atmosphere-description = MODELLED optisk PNT gjennom atmosfæren: for en optisk lenke og et sett av bakkesteder med oppgitt skyklima rapporterer den det bølgelengde- og elevasjonsavhengige tapet i klar luft (synlighetsloven til Kim pluss Rayleigh), turbulenstilstanden etter Hufnagel-Valley (Rytov-varians, scintillasjonsindeks, gamma-gamma-parametere, aperturmidling), den værdrevne tilgjengeligheten mot lenkemarginen (skyens optiske dybde fra et log-normalt klima for flytende vann, ekstinksjon i geometrisk optikk, uavhengig turbulensfading), lenkemarginen som trengs for måltilgjengeligheter, fordelingen av bortfallsvarighet, veksten i tids- og avstandsfeil per bortfall gjennom holdover-modellen for klokken, avstandskorrelert tilgjengelighet med stedsdiversitet, og hva-hvis-gevinster for forbedringsteknikker (bølgelengde, mottaksapertur, scintillasjonsreduksjon med adaptiv optikk, ekstra margin). VALIDATED som implementering av de oppgitte formlene mot en uavhengig mpmath-referanse: Rytov-varians, scintillasjonsindeks, gamma-gamma-fadingsannsynlighet, aperturmidlingsfaktor, optisk dybde for sky og klar luft. MODELLED: alle inndata for vær, teknikk og klokke og antagelsene om uavhengighet og kopula; ingen målt tilgjengelighetsregistrering er sammenlignet. Veiledende analyse, ikke et sertifisert produkt for tilgjengelighet eller navigasjon.

engine-kind-holdover-test-description = MODELLED holdover-test av et tidssynkroniseringssystem, skåret fra en tidsfeilregistrering OPERATØREN leverer (en linuxptp-logg fra ptp4l, phc2sys eller ts2phc, en chrony-logg for sporing eller statistikk, en TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns). Testen har fire trinn og Kshana utfører ingen av dem: en låst GRUNNLINJE, GNSS FJERNET av operatøren (antennekabelen eller simulatorutgangen; Kshana sender og styrer ingenting) på et oppgitt tidspunkt, HOLDOVER på systemets egen oscillator, og GJENOPPRETTING etter at operatøren gjenoppretter GNSS på et andre oppgitt tidspunkt. Registreringen deles ved de to tidspunktene. Grunnlinje: tidsfeilstatistikk og ITU-T-maskene skrevet for en låst klokke. Holdover: statistikk, den fraksjonelle frekvensforskyvningen systemet holdt (en linje med minste kvadrater), maskene skrevet for holdover eller en autonom klokke, ePRTC-A-omslutningen for holdover fra den oppgitte låste varigheten, og tiden til hvert tidsfeilbudsjett overskrides. Gjenoppretting: om og når |TE| kom innenfor et oppgitt bånd og ble der, toppen og det største steget. Hver grense er overført fra en offentlig ITU-T-tabell (maskene i telecom-timing); ordene er 'målt mot masken', og de to tidspunktene er operatørens utsagn, ikke verifisert. En registrering som er for kort for en maske er INCOMPLETE, aldri ekstrapolert. Se docs/TIMING-HIL.md.

engine-kind-gnss-ssv-description = MODELLED GNSS-tilgjengelighet og lenkestyrke i Space Service Volume og utover: for en bruker på en kule (det globale skallet i ICG-heftet) eller på en Kepler-bane (LEO til månetransfer) teller den, per konstellasjon (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og for alle sammen, signalene som kan brukes over en C/N0-terskel - tilgjengelighet av minst ett og av fire signaler, maksimal varighet av bortfall, mottatt C/N0, dilusjon av presisjon, lenker i hovedlobe mot sidelobe - med et sendemønster fra heftet, parametrisk eller levert av brukeren, valgfrie effekter fra ionosfære, plasmasfære og atmosfære for stråler som tangerer limb og en valgfri utforming av mottaker for svake signaler; også et utvidet Kalman-filter for GNSS ombord for HEO- og månetransferfarkoster (banedynamikk, solstrålingstrykk, tredjelegemer, klokke) og relativ navigasjon for en formasjon av flere farkoster med enkeltdifferensierte pseudoavstander. Kontrollert mot tabellene i ICG SSV-heftet under en forhåndsregistrering (xval/gnss-ssv)
