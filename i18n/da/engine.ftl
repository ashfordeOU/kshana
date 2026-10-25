# SPDX-License-Identifier: AGPL-3.0-only
# da catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = ukendt format for urlog { $other }; forventet et af { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = ukendt hulpolitik { $other }; forventet refuse, longest eller linear

engine-e-clock-log-give-either-the-log-text = angiv enten logteksten eller dens sti, ikke begge

engine-e-clock-log-clock-log-needs-its-text = en urlog kræver sin tekst eller en sti

engine-e-clock-log-tau0-must-be-finite-and = tau0_s skal være endelig og > 0 (fik { $t })

engine-e-clock-log-units-and-data-apply-to = units og data gælder kun for formatet timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel gælder kun for formatet ticc

engine-e-clock-log-cannot-read-clock-log = kan ikke læse urlog { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = en sti til en urlog er ikke tilgængelig i WebAssembly-udgaven; angiv loggen som tekst

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one]
            { $n_gaps ->
                [one] { $format }-loggen har { $n_missing } manglende epoke i { $n_gaps } hul på et { $tau0 } s gitter; angiv gaps = "longest" for at beholde den længste sammenhængende række uden huller eller gaps = "linear" for at interpolere
               *[other] { $format }-loggen har { $n_missing } manglende epoke i { $n_gaps } huller på et { $tau0 } s gitter; angiv gaps = "longest" for at beholde den længste sammenhængende række uden huller eller gaps = "linear" for at interpolere
            }
       *[other]
            { $n_gaps ->
                [one] { $format }-loggen har { $n_missing } manglende epoker i { $n_gaps } hul på et { $tau0 } s gitter; angiv gaps = "longest" for at beholde den længste sammenhængende række uden huller eller gaps = "linear" for at interpolere
               *[other] { $format }-loggen har { $n_missing } manglende epoker i { $n_gaps } huller på et { $tau0 } s gitter; angiv gaps = "longest" for at beholde den længste sammenhængende række uden huller eller gaps = "linear" for at interpolere
            }
    }


engine-e-clock-log-the-log-yields-usable-sample = { $format }-loggen giver { $x } brugbar(e) måling(er); der kræves mindst 3

engine-e-clock-log-not-rinex-clock-file-no = ikke en RINEX-urfil: ingen END OF HEADER-post

engine-e-clock-log-the-rinex-clock-file-has = RINEX-urfilen har ingen AS- eller AR-poster

engine-e-clock-log-the-rinex-clock-file-holds = RINEX-urfilen indeholder { $many } ure; angiv ét med clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = ingen AS- eller AR-poster for ur { $id }

engine-e-clock-log-the-clock-has-single-epoch = uret har kun én epoke; tau0 kan ikke findes

engine-e-clock-log-the-log-has-no-readings = { $format }-loggen har ingen målinger

engine-e-clock-log-unknown-phase-unit-expected-ms = ukendt faseenhed { $other }; forventet s, ms, us, ns eller ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab-linje { $v1 } har { $v } kolonne(r), den første datalinje har { $first }

engine-e-clock-log-timelab-line-has-columns-one = TimeLab-linje { $v1 } har { $v } kolonner; der læses én (værdi) eller to (tid værdi)

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab-linje { $v1 } er ikke numerisk: { $l }

engine-e-clock-log-the-timelab-log-has-no = timelab-loggen har ingen målinger

engine-e-clock-log-unknown-data-expected-phase-or = ukendt data { $other }; forventet phase eller frequency

engine-e-clock-log-tau0-header-is-not-positive = tau0-headeren { $v } er ikke et positivt antal sekunder

engine-e-clock-log-frequency-data-is-fractional-frequency = frequency-data er relativ frekvens; dens enheder kan kun være 1

engine-e-clock-log-two-column-frequency-logs-are = frequency-logs med to kolonner læses ikke; angiv frequency som én kolonne med tau0

engine-e-clock-log-unknown-time-units-expected-or = ukendt time_units { $o }; forventet s eller mjd

engine-e-clock-log-the-timelab-log-time-column = timelab-logens tidskolonne skal være voksende

engine-e-clock-log-single-reading-tau0-cannot-be = én enkelt måling; tau0 kan ikke findes

engine-e-clock-log-the-timelab-log-has-non = timelab-loggen har { $non_finite } ikke-endelig(e) måling(er)

engine-e-clock-log-the-ticc-log-holds-channels = TICC-loggen indeholder kanalerne { $many }; angiv én med channel = "..."

engine-e-clock-log-no-readings-on-channel-found = ingen målinger på kanal { $channel } (fundet { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC-linjer i interval-tilstand indeholder ingen tid; angiv tau0_s (hændelsesperioden)

engine-e-clock-log-the-readings-do-not-increase = { $channel }-målingerne er ikke voksende, så de er ikke tidsstempler (output fra TICC i Period-tilstand læses ikke; brug Timestamp-tilstand)

engine-e-clock-log-single-time-stamp-tau0-cannot = ét enkelt tidsstempel; tau0 kan ikke findes

engine-e-clock-log-two-time-stamps-apart-under = to { $channel }-tidsstempler med { $w } s imellem, under halvdelen af tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = { $format }-tidsstemplerne for { $clock } går baglæns (en genstartet daemon eller et urspring); del loggen op og læs hver del for sig

engine-e-clock-log-the-log-has-no-readings-2 = loggen har ingen { $what }-målinger

engine-e-clock-log-the-log-holds-sources-name = loggen indeholder { $many } kilder; angiv én med { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = ingen { $what }-målinger for { $id } (fundet { $names })

engine-e-clock-log-the-servo-of-never-reached = servoen for { $id } nåede aldrig den låste tilstand s2

engine-e-clock-log-the-log-has-no-chrony = loggen har ingen chrony tracking-målinger

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = samplingfrekvensen { $fs_hz } Hz er ikke et helt antal samples pr. millisekund

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms og noncoherent skal være positive

engine-e-acquisition-the-doppler-grid-needs-positive = Doppler-gitteret kræver et positivt trin og et ikke-negativt maksimum

engine-e-acquisition-pfa-must-lie-in = pfa skal ligge i (0, 1)

engine-e-acquisition-samples-supplied-needed = { $samples } samples angivet, { $needed } kræves

engine-e-acquisition-empty-doppler-grid = tomt Doppler-gitter

engine-e-acquisition-the-samples-carry-no-power = samplene indeholder ingen effekt

## src/adm.rs

engine-e-adm-unknown-attitude-type = ukendt ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = en AEM kræver mindst ét segment

engine-e-adm-segment-is-not-version-attitude = segment { $i }: { $t } er ikke en attitude-type i version { $version }

engine-e-adm-segment-values-for = segment { $i }: { $values } værdier for { $t }

engine-e-adm-aem-version-has-no-ndm = AEM version 1.0 har ingen NDM/XML-form her; skriv KVN

engine-e-adm-this-attitude-type-has-no = denne attitude-type har ingen form i version 2.0

engine-e-adm-expected-meta-start-found = forventet META_START, fandt { $l }

engine-e-adm-meta-start-without-meta-stop = META_START uden META_STOP

engine-e-adm-unexpected-metadata-line = uventet metadatalinje { $other }

engine-e-adm-in-version-aem = { $att } i en AEM i version { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = forventet DATA_START efter META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START uden DATA_STOP

engine-e-adm-empty-data-line = tom datalinje

engine-e-adm-values-on-line = { $vals } værdier på en { $att }-linje: { $b }

engine-e-adm-unexpected-data-line = uventet datalinje { $other }

engine-e-adm-attitude-type-has-no-xml = attitude-typen har ingen XML-form

engine-e-adm-message-without-version-attribute = meddelelse uden versionsattribut

engine-e-adm-expected-found = forventet { $vers_key }, fandt { $other }

engine-e-adm-header-without-creation-date-or = header uden CREATION_DATE eller ORIGINATOR

engine-e-adm-missing = mangler { $k }

engine-e-adm-unexpected-keyword = uventet nøgleord { $k }

engine-e-adm-spin-block-holds-nutation-or = en spin-blok indeholder nutations- eller impulsdata, ikke begge

engine-e-adm-unexpected-apm-keyword = uventet APM-nøgleord { $other }

engine-e-adm-unexpected-apm-line = uventet APM-linje { $b }

engine-e-adm-without = { $b } uden { $stop }

engine-e-adm-unexpected-line-in = uventet linje i { $b }: { $other }

engine-e-adm-incomplete-group = ufuldstændig gruppe { $keys }

engine-e-adm-unknown-apm-block-start = ukendt APM-blok { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM-metadata kræver OBJECT_NAME, OBJECT_ID og TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM uden EPOCH

engine-e-adm-rotation-axis = rotationsakse { $o }

engine-e-adm-values-for = { $values } værdier for { $t }

engine-e-adm-euler-record-without-euler-rot = Euler-post uden EULER_ROT_SEQ

engine-e-adm-rotation-sequence = rotationssekvens { $seq }

engine-e-adm-epoch-has-no = epoke { $s } har intet 'T'

engine-e-adm-epoch-date = epokedato { $date }

engine-e-adm-epoch-time = epoketid { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = “{ $s }” (tekst som dokumentet angiver den)

engine-advanced-report-mean-5th-to-95th-percentile = middelværdi { $fmt_num } (5. til 95. percentil { $fmt_num2 } til { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = field-units-skema: units-post `{ $key }`

engine-advanced-report-field-units-schema-input-entry = field-units-skema: input-post `{ $key }`, matchet på feltnavn

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } række i en ikke-numerisk kolonne
       *[other] { $n } rækker i en ikke-numerisk kolonne
    }


engine-advanced-report-rows-from-to = { $nums } rækker, fra { $fmt_num } til { $fmt_num2 }

engine-advanced-report-phase-ended-by = fase { $name } (afsluttet af { $ended })

engine-advanced-report-result-timeline-phases = resultat `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = overdragelse til fase { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = resultat `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = scenarie-input `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = kommentar i scenariefilen, linje { $start }

engine-advanced-report-scenario-file-comment-lines-to = kommentar i scenariefilen, linje { $start } til { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } er MODELLED, ikke afprøvet mod en uafhængig ekstern reference: { $it }.

engine-advanced-report-sweep-of-scale = Sweep af { $param } ({ $str_of }-skala)

engine-e-advanced-report-the-result-document-is-not = resultatdokumentet er ikke JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = scenariet er ikke TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Monte Carlo-fordeling af { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = registreret ved bygning fra miljøvariablen { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = ikke registreret: denne motor blev bygget uden miljøvariablen { $GIT_COMMIT_ENV }; motorversionen identificerer udgivelsen

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (kindens eget fingeraftryk af scenariet; ikke filens digest)

engine-advanced-report-input-file = Inputfil { $path }

engine-advanced-report-study-generated = { " " }Studie genereret { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2-linje { $v1 }: forventet 8 kommaseparerede kolonner, fandt { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2-linje { $v1 }: ugyldig { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2-linje { $v1 }: ikke-endelig værdi

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: ingen datarækker

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: { $rows } rækker udfylder ikke det { $n_lat } x { $n_lon } gitter, de spænder over

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: dubleret knude ved { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = gittertrinnet skal være endeligt og positivt, fik { $step }

engine-e-altpnt-maps-grid-box-must-have-north = gitterboksen skal have nord > syd og øst > vest, fik [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = gitter på { $n_lat } x { $n_lon } knuder er for stort

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: { $what }-aksen kræver mindst 2 forskellige værdier

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: { $what }-aksen er ikke regelmæssig ({ $w } til { $w2 } mod et gennemsnitligt trin på { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = fejl-sigma skal være endelig og ikke-negativ, fik { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = korrelationslængden skal være endelig og positiv, fik { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side skal være >= 2, fik { $n }

engine-e-altpnt-terrain-srtm-hgt-length = SRTM .hgt-længde { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = et .hgt-vindue kræver mindst 2 x 2 samples, fik { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = trinnet skal være endeligt og positivt, fik { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt-vinduets længde { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: ukendt magnetic_grid-kolonne `{ $other }` (brug "sealevel" eller "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: kan ikke læse magnetic_grid csv_path { $csv_path }: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = ukendt animationsformat '{ $other }'; forventet svg, html, frames eller all

engine-e-animation-no-animation-format-given-expected = intet animationsformat angivet; forventet svg, html, frames eller all

engine-e-animation-animation-fps-must-be-between = animationens fps skal ligge mellem 1 og 60, fik { $fps }

engine-e-animation-animation-duration-must-be-between = animationens varighed skal ligge mellem { $lit_0_5 } s og 600 s, fik { $duration_s }

engine-e-animation-animation-width-must-be-between = animationens bredde skal ligge mellem 480 og 3840 pixel, fik { $width }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] varighed x fps giver { $n } billede; billedsekvensen kræver mellem 2 og { $v1 }
       *[other] varighed x fps giver { $n } billeder; billedsekvensen kræver mellem 2 og { $v1 }
    }


engine-e-animation-result-is-not-json = resultatet er ikke JSON: { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = missionstid ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (kræver en ffmpeg bygget med librsvg; ellers rasteriser billederne først)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }{ $omitted } yderligere serier blev fundet, men ikke tegnet (afspilleren viser højst { $MAX_CHARTS } paneler med { $MAX_TRACES } kurver); de er opført i manifestet for billedeksporten.

## src/antenna.rs

engine-antenna-limb-capture-is-reached-on = limb-indfangning NÅS på dette gitter (højde { $a_lo }-{ $a_hi } m x strålebredde { $b_lo }-{ $b_hi } deg, { $points2 } punkter): { $points } af { $points2 } samplede arbejdspunkter indfanger limben, og { $crossings } akseskæring(er) blev lokaliseret; den stærkeste samplede limb-J/S er { $limb_js_db } dB ved højde { $altitude_m } m / strålebredde { $hpbw_deg } deg, mod en indfangningstærskel på { $thr } dB.

engine-antenna-limb-capture-is-not-reached = limb-indfangning nås IKKE noget sted på dette gitter (højde { $a_lo }-{ $a_hi } m x strålebredde { $b_lo }-{ $b_hi } deg, { $points } punkter) - ikke nul indfangning, men ingen limb-indfangning: den bedste limb-J/S er { $limb_js_db } dB ved højde { $altitude_m } m / strålebredde { $hpbw_deg } deg, { $shortfall } dB under indfangningstærsklen på { $thr } dB; dette arbejdspunkt ville indfange limben ved { $limb_capture_tx_power_dbw } dBW sendeeffekt mod de { $p_tx_dbw } dBW, der blev fløjet.

engine-e-antenna-azimuths-must-strictly-increase = azimutter skal være strengt voksende

engine-e-antenna-azimuths-must-span-less-than = azimutter skal spænde over mindre end 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = off-boresight-vinkler skal være strengt voksende

engine-e-antenna-gain-grid-does-not-match = forstærkningsgitteret passer ikke til akserne

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = forstærkningerne K og P skal være endelige og positive

engine-e-aocs-at-least-three-reaction-wheels = der kræves mindst tre reaktionshjul

engine-e-aocs-wheel-spin-axis-must-be = hjul { $i }: spinaksen skal være en enhedsvektor

engine-e-aocs-wheel-js-and-max-must = hjul { $i }: js og u_max skal være endelige og positive

engine-e-aocs-the-wheel-spin-axes-do = hjulenes spinakser udspænder ikke tre dimensioner

engine-e-aocs-inertia-minus-the-wheels-spin = inertien minus hjulenes spininertia skal være positivt definit

engine-e-aocs-inertia-must-be-finite-and = inertien skal være endelig og symmetrisk

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis skal være en endelig vektor forskellig fra nul

engine-e-aocs-kind-must-be-finite-and-positive = { $n } skal være endelig og positiv

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s må højst være 2e6 trin

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s skal være et helt multiplum af dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 og omega0_rad_s skal være endelige

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm skal være endelig

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s skal være endelig

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s skal være mindst dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs: { $n_w } hjul, { $duration_s } s slew fra { $series_err } deg -> { $settle } | slutfejl { $final_err } deg | højeste hjulhastighed { $peak_speed } rpm | { $v7 }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = ukendt tjeneste '{ $other }' (forventet navigation|nav eller communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = ukendt arbitreringspolitik '{ $other }' (forventet navigation-priority, communications-priority eller first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = en kontaktplan kræver mindst ét kontaktvindue

engine-e-aperture-duty-apertures-must-be = apertures skal være >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = rapporteringshorisonten skal være endelig

engine-e-aperture-duty-contact-has-non-finite-aos = kontakt '{ $name }' har en ikke-endelig aos_s eller los_s

engine-e-aperture-duty-contact-must-have-los-aos = kontakt '{ $name }' skal have los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = en kontaktplan kræver mindst ét [[contacts]]-vindue

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: { $sessions } session(er) på { $apertures } aperture(r) under { $policy } -> navigationsbelastning { $navigation_duty }, kommunikationsbelastning { $communications_duty }, ledig { $idle_duty }; { $total_outage_s } s af { $total_requested_s } s anmodet tabt til konkurrence (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Studie genereret { $html_escape }.

engine-e-api-failed-to-serialise-report-to = kunne ikke serialisere rapporten til JSON: { $e }

engine-e-api-invalid-scenario = ugyldigt scenarie: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] ukendt scenarietype { $other } — mente du { $hint }? `kshana kinds` viser den ene indbyggede type ({ $n }).
       *[other] ukendt scenarietype { $other } — mente du { $hint }? `kshana kinds` viser alle { $n } indbyggede typer.
    }


engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] ukendt scenarietype { $other }. `kshana kinds` viser den ene indbyggede type ({ $n }).
       *[other] ukendt scenarietype { $other }. `kshana kinds` viser alle { $n } indbyggede typer.
    }


engine-api-required-fields = - **Obligatoriske felter:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Valgfrie felter:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML-parsingfejl: { $e }

engine-api-could-not-classify-scenario-kind = kunne ikke klassificere scenarietypen: { $e }

engine-api-missing-required-field = { $kind_name }: mangler obligatorisk(e) felt(er) — { $options }

engine-api-missing-required-field-2 = { $kind_name }: mangler obligatorisk felt "{ $entry }"

engine-e-api-invalid-orbit-scenario = ugyldigt banescenarie: { $e }

engine-e-api-sp3-export-requires-an-orbit = SP3-eksport kræver et banescenarie, ikke '{ $k }'

engine-e-api-omm-export-requires-an-orbit = OMM-eksport kræver et banescenarie, ikke '{ $k }'

engine-e-api-oem-export-requires-an-orbit = OEM-eksport kræver et banescenarie, ikke '{ $k }'

engine-e-api-invalid-scenario-toml = ugyldigt scenarie-TOML: { $e }

engine-e-api-could-not-re-serialise-scenario = kunne ikke re-serialisere scenariet: { $e }

engine-api-scenario-jamming-availability-under-jamming = scenarie { $r } | jamming { $v2 } | tilgængelighed under jamming { $availability_under_jamming } (nominel { $availability_nominal }) | min. tracking { $min_tracking } | gennemsnitlig J/S { $v6 }

engine-e-api-the-result-document-already-carries = resultatdokumentet indeholder allerede `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = kunne ikke serialisere figure_tiers: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = ugyldigt { $label }-scenarie: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = scenarie { $r } | kvante-holdover { $holdover_s }s p95 { $pos_p95_m }m | klassisk holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = scenarie { $r } | spoof { $scn } mod { $threshold_ns } ns-specifikation (P_fa { $target_pfa }) | kvantesikkerhed { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | klassisk sikkerhed { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] integritet | { $n_sats } satellit | { $samples_available }/{ $samples_total } epoker tilgængelige ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } integritetshændelser, { $report3 } HMI
       *[other] integritet | { $n_sats } satellitter | { $samples_available }/{ $samples_total } epoker tilgængelige ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } integritetshændelser, { $report3 } HMI
    }


engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | sydpol | { $samples_available }/{ $samples_total } epoker tilgængelige ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | sekulær LTC−TT-rate { $secular_rate_us_per_day } µs/dag (bånd { $band_low }–{ $band_high }) | egenpotential { $self_potential_us_per_day } kinetisk { $kinetic_us_per_day } | offset @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | baseline { $baseline_km } km | beacon-afstand { $beacon_range_km } km | forsinkelse { $report } µs (rate { $delay_rate_s_per_s } s/s) | nærfelt { $near_field_correction_us } µs | { $samples } samples over { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_earth ->
        [one] lunar-joint-od-clock | { $n_sat } sats, { $n_earth } jordstation | stationens 3D-fejl med VLBI { $station_pos_err_m } m mod kun afstand { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× skarpere) | sat-pos. RMS { $sat_pos_rms_m } m | stationsurfejl { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametre
       *[other] lunar-joint-od-clock | { $n_sat } sats, { $n_earth } jordstationer | stationens 3D-fejl med VLBI { $station_pos_err_m } m mod kun afstand { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× skarpere) | sat-pos. RMS { $sat_pos_rms_m } m | stationsurfejl { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametre
    }


engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } punkt | translationsfejl { $trans_err_norm_m } m, rotationsfejl { $rot_err_norm_rad } rad, skalafejl { $scale_err_ppb } ppb | rms-residual { $rms_residual_m } m | konvergeret { $converged }
       *[other] lunar-frame-realisation | { $n_points } punkter | translationsfejl { $trans_err_norm_m } m, rotationsfejl { $rot_err_norm_rad } rad, skalafejl { $scale_err_ppb } ppb | rms-residual { $rms_residual_m } m | konvergeret { $converged }
    }


engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } sats ({ $geometry_label }) | { $n_grid_points } pkt × { $n_epochs } epoker | dækning { $coverage_pct }% (PDOP<{ $pdop_threshold }) | sats { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL-tilgængelighed { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemeride { $report } ({ $provenance }) σ_URE krævet { $fmt } mod Kepler { $fmt2 } mod perturberet { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | { $n_sats } sats (illustrativ LCNS-klasse, ikke tilknyttet) | baseline { $baseline_km } km | brugerfejl { $user_error_uncorrected_m } m → { $user_error_corrected_m } m ({ $reduction_factor }× reduktion) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } punkter x { $n_epochs } epoker x { $n_trials } forsøg | tilgængelighed { $v4 } % | dækning { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | korrigeret p{ $percentile } 3D { $f } (ukorrigeret { $f2 }) | HPL maks. { $f3 } | MODELLED; ikke en udtalelse om noget reelt system

engine-api-builtins-terrain-horizon-at-the-station = { " " }| terrænhorisont ({ $sources }) ved stationen maks. { $horizon_max_deg } deg, brugerpunkter middel af maks. { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilstand, OEM { $oem_line_count } linje | formatkontrol { $v5 } ({ $present_fields } til stede / { $missing_fields } mangler) | OEM-rundtur { $v8 } | tidsmeta-rundtur { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilstand, OEM { $oem_line_count } linjer | formatkontrol { $v5 } ({ $present_fields } til stede / { $missing_fields } mangler) | OEM-rundtur { $v8 } | tidsmeta-rundtur { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
       *[other]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilstande, OEM { $oem_line_count } linje | formatkontrol { $v5 } ({ $present_fields } til stede / { $missing_fields } mangler) | OEM-rundtur { $v8 } | tidsmeta-rundtur { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilstande, OEM { $oem_line_count } linjer | formatkontrol { $v5 } ({ $present_fields } til stede / { $missing_fields } mangler) | OEM-rundtur { $v8 } | tidsmeta-rundtur { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
    }


engine-api-builtins-scenario-optical-sync-rms-ps = scenarie { $r } | optisk sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | kvantekæde { $quantum_chain_sigma_s }s mod klassisk { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | sikkerhed Pd { $security_pd } (Pfa { $monitor_pfa }) | anomali Pd { $anomaly_pd } | afvejning: kvante vinder { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | udfald { $outage_s }s | kvante-positionsfejl { $quantum_pos_err_m } m mod klassisk { $classical_pos_err_m } m ({ $improvement_x }x) | holdover kvante { $quantum_holdover_s }s mod klassisk { $classical_holdover_s }s (tærskel { $threshold_m } m) | afvejning: kvante vinder { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC kvante { $quantum_auc } mod klassisk { $classical_auc } | mindste detekterbare fejl kvante { $quantum_min_detectable } mod klassisk { $classical_min_detectable } | { $fault_catalog } fejlklasser | afvejning: kvante vinder { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] gælder kun for fusion-typen

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = scenarie { $r } | kvante-PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integritet { $integ } sikkerhed { $security_na } | klassisk PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integritet { $integ2 } sikkerhed { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = scenarie { $r } | fusioneret | kvante-PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integritet { $integ } sikkerhed { $security_na } | klassisk PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integritet { $integ2 } sikkerhed { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = scenarie { $r } | hybrid-ukf (17 tilstande, MODELLED) | sensor { $v2 } (q_va { $effective_q_va }) | ur q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } i [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } i [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | støttet { $aided_pos_rms_m }m -> coast { $coast_end_pos_rms_m }m over { $coast_duration_s }s | selvkonsistens, ikke nøjagtighed

engine-api-builtins-scenario-gnss-ins-quantum-outage = scenarie { $r } | gnss-ins | kvante udfalds-RMS fusioneret { $fused_outage_rms_m }m mod fri { $free_outage_rms_m }m (hold { $holdover_s }s, tilg. { $availability }) | klassisk fusioneret { $fused_outage_rms_m2 }m mod fri { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, tilg. { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = scenarie { $r } | gnss-sim | middel iono { $mean_iono_m }m tropo { $mean_tropo_m }m | RAIM-tilgængelighed { $raim_availability } middel-HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m fejlrate { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db =
    { $n_sats ->
        [one] scenarie { $r } | spoof-detect | { $n_sats } SV, +{ $power_advantage_db } dB{ $v4 } | { $push } push | fusioneret score { $score } (tærskel { $fusion_threshold }) | { $verdict }
       *[other] scenarie { $r } | spoof-detect | { $n_sats } SV'er, +{ $power_advantage_db } dB{ $v4 } | { $push } push | fusioneret score { $score } (tærskel { $fusion_threshold }) | { $verdict }
    }


engine-api-builtins-sweep-over-pts-scale-quantum = sweep { $metric } over { $parameter } ({ $first }..{ $last }, { $points } pkt, { $scale }-skala) | kvante { $first2 }->{ $last2 } | klassisk { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = scenarie { $r } | { $nominal }/{ $series } samples GNSS-nominelle | bedste PDOP { $fnum } pos { $posm } | kvante-holdover { $holdover_s }s p95 { $ns1 }ns integritet { $integ } sikkerhed { $security_na } | klassisk holdover { $holdover_s2 }s p95 { $ns12 }ns integritet { $integ2 } sikkerhed { $security_na }

engine-e-api-builtins-ephemeris = efemeride: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| maks. el { $el }° spids-Doppler { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] scenarie { $r } | { $source } | { $n_samples } sample | højde { $alt_min_km }–{ $alt_max_km } km | |bredde| ≤ { $r2 }° | hastighed { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] scenarie { $r } | { $source } | { $n_samples } samples | højde { $alt_min_km }–{ $alt_max_km } km | |bredde| ≤ { $r2 }° | hastighed { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }


engine-api-builtins-generic-sweep-of-over-nodes = generisk sweep af `{ $kind }` over [{ $keys }] | { $points } knuder (form { $shape }) | metrikker [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | fri inertiel drift { $free_inertial_drift_m } m | tyngdekortmatchet { $map_matched_error_m } m | matchende sigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| referencegrad { $reference_nmax } anomali-std { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| kortfejl-MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% inden for { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | fri inertiel drift { $free_inertial_drift_m } m | terrænmatchet { $matched_error_m } m ({ $v3 }x reduktion) | matchende sigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } waypoints | fri inertiel RMS { $free_inertial_rms_m } m (slut { $free_inertial_final_m } m) | terrænmatchet RMS { $matched_rms_m } m (slut { $matched_final_m } m, { $v6 }x reduktion) | middel-ESS { $mean_ess }/{ $cfg } | matchende sigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | fri inertiel drift { $free_inertial_drift_m } m | tyngde { $gravity_only_m } m magnetisk { $magnetic_only_m } m terræn { $terrain_only_m } m | FUSIONERET { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] kræver runs = 1: en målt log er én optegnelse

engine-api-builtins-scenario-runs-quantum-holdover-p95 = scenarie { $r } | { $runs } kørsler | kvante-holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns sikkerhed { $security_na } | klassisk holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns sikkerhed { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = scenarie { $r } | kvante-holdover { $holdover_s }s p95 { $ns1 }ns integritet { $integ } sikkerhed { $security_na } | klassisk holdover { $holdover_s2 }s p95 { $ns12 }ns integritet { $integ2 } sikkerhed { $security_na }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one]
            { $n_alarm ->
                [one] { " " }| RAIM tilgængelig { $n_available } af { $n_epochs } epoke ({ $n_denied } nægtet, { $n_alarm } alarm; MODELLED)
               *[other] { " " }| RAIM tilgængelig { $n_available } af { $n_epochs } epoke ({ $n_denied } nægtet, { $n_alarm } alarmer; MODELLED)
            }
       *[other]
            { $n_alarm ->
                [one] { " " }| RAIM tilgængelig { $n_available } af { $n_epochs } epoker ({ $n_denied } nægtet, { $n_alarm } alarm; MODELLED)
               *[other] { " " }| RAIM tilgængelig { $n_available } af { $n_epochs } epoker ({ $n_denied } nægtet, { $n_alarm } alarmer; MODELLED)
            }
    }


## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = et referencetilfælde kræver mindst én satellit

engine-e-araim-reference-reference-case-needs-at-least-2 = et referencetilfælde kræver mindst én konstellation

engine-e-araim-reference-satellite-names-constellation-but-only = satellit { $i } angiver konstellation { $constellation }, men kun { $constellations } er deklareret

engine-e-araim-reference-satellite-has-non-positive-error = satellit { $i } har en ikke-positiv fejlvarians

engine-e-araim-reference-both-integrity-risk-allocations-must = begge integritetsrisiko-allokeringer skal være positive

engine-e-araim-reference-this-reference-implementation-monitors-single = denne referenceimplementering overvåger kun fejltilstande med enkelthændelser, men tilfældets apriori-sandsynligheder kræver N_fault,max = { $nfm } (samtidige delmængder med flere hændelser). Afviser frem for at undertælle fejltilstande.

engine-e-araim-reference-the-all-in-view-geometry = all-in-view-geometrien er singulær

engine-e-araim-reference-no-fault-mode-is-observable = ingen fejltilstand er observerbar på denne geometri

engine-e-araim-reference-unknown-reference-vector-known-vectors = ukendt referencevektor '{ $vector }'; kendte vektorer: { $ids } (eller 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: { $wanted } publicerede WG-C-referencevektor(er); dårligste VPL/HPL-overensstemmelse { $worst_acceptance } m mod referencens egen TOL_PL = { $tol } m over { $acceptance_checked } kontrolvektor(er)

engine-e-araim-reference-sat-needs-one-value-per = P_sat kræver én værdi pr. satellit og P_const én pr. konstellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation = en satellit angiver en ikke-deklareret konstellation

engine-e-araim-reference-every-prior-must-lie-in = hver apriori-sandsynlighed skal ligge i [0, 1)

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] apriori-sandsynlighederne kræver delmængder med { $n_fault_max } samtidig hændelse; denne sti opregner højst { $most }
       *[other] apriori-sandsynlighederne kræver delmængder med { $n_fault_max } samtidige hændelser; denne sti opregner højst { $most }
    }


engine-e-araim-reference-the-all-in-view-solution = all-in-view-løsningen blev ikke valgt

engine-e-araim-reference-an-add-v4-case-needs = et ADD v4.2-tilfælde kræver satellitter og konstellationer

engine-e-araim-reference-nom-and-sat-need-one = b_nom og P_sat kræver én værdi pr. satellit

engine-e-araim-reference-const-needs-one-value-per = P_const kræver én værdi pr. konstellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = satellit { $i } angiver en ikke-deklareret konstellation

engine-e-araim-reference-one-constellation-index-per-satellite = ét konstellationsindeks pr. satellit

engine-e-araim-reference-satellite-names-constellation-with-no = satellit { $i } angiver konstellation { $c } uden ISM

engine-e-araim-reference-fewer-than-four-satellites-above = færre end fire satellitter over masken

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m skal indeholde mindst én standoff

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (bånd { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | fodaftryk { $a2 }% loft, limb { $footprint_limb_captured } | spoof-indfangning { $spoof_captured } (lock { $spoof_lock_time_s } s) | mastrækkevidde { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% af 50 bit/s), { $nma_auth_latency_s } s latenstid

engine-attack-surface-reached-crossing-best-db = nået ({ $crossings } skæring(er), bedste { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = IKKE nået på dette gitter (bedste { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB for lavt; kræver { $best_limb_capture_tx_power_dbw } dBW mod { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| fodaftryks-sweep { $s }x{ $s2 } (højde { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), indfangning { $v5 }-{ $v6 }% | limb { $limb }

engine-attack-surface-afs-received-dbw = AFS modtaget: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Underskud: { $deficit_db } dB (bånd { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Indfangningsfodaftryk: { $a }% af skiven, limb indfanget: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Spoof-indfangning, indtrækning: { $spoof_captured } (lock { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Mastrækkevidde: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limb: indfanget på { $na }x{ $nb }-gitter, { $crossings } skæring(er)

engine-attack-surface-limb-not-captured-on-grid = Limb: ikke indfanget på { $na }x{ $nb }-gitter; kræver { $best_limb_capture_tx_power_dbw } dBW (fløjet { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km skal være endelig og positiv

engine-e-attitude-budget-inertias-must-be-finite-and = inertier skal være endelige og positive

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 skal være >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = der kræves mindst ét bidrag til pegningen

engine-e-attitude-budget-contributor-sigma-must-be-finite = bidragets '{ $name }' sigma skal være endelig og >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> GG-moment { $t_gg } N·m; pegning { $total }" RSS (dominerende: { $dominant }) (MODELLED skalarbudget)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } kræver en værdi

engine-bench-cli-unknown-option = ukendt tilvalg `{ $a }`

engine-bench-cli-unexpected-argument = uventet argument `{ $pos }`

engine-bench-cli-cannot-read = kan ikke læse { $p }: { $e }

engine-bench-cli-cannot-create = kan ikke oprette { $d }: { $e }

engine-bench-cli-cannot-write = kan ikke skrive { $p }: { $e }

engine-bench-cli-unknown-task-or = ukendt opgave `{ $t }` (a, b, c eller d)

engine-bench-cli-scored-epochs-in-folder = { $labels } bedømte epoker i { $folders } mappe(r)

engine-bench-cli-wrote-cases-json-and-truth = skrev { $out }/cases.json og { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: denne forpligtelse er foreløbig, og dens seed blev afsløret; det er ikke et tilbageholdt datasæt til udgivelsen

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: seeden er ikke den, der ligger bag denne forpligtelse

engine-bench-cli-is-not-json = { $f } er ikke JSON: { $e }

engine-bench-cli-cannot-read-2 = kan ikke læse { $i }: { $e }

engine-bench-cli-result-rendered = { $results } resultat(er) gengivet

engine-bench-cli-unknown-subcommand =
    ukendt underkommando `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = kan ikke oprette { $path } (en eksisterende seed-fil overskrives aldrig): { $e }

engine-bench-cli-cannot-write-2 = kan ikke skrive { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = seed skrevet til { $path }: hold den uden for versionsstyring og uden for enhver meddelelse; kun hashen nedenfor er offentlig

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (overtaget, ikke kørt igen)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = impairment-eval baseline: { $det }

engine-bench-cli-no-scenario-json-under = ingen scenario.json under { $root }

engine-bench-cli-is-not-json-2 = { $path } er ikke JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } afvigende, { $missing } mangler, { $unpinned } ikke fastlåst

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = ukendt split `{ $other }` (dev, test eller holdout)

engine-bench-score-for-is-not-finite = score for `{ $id }` er ikke endelig

engine-bench-case-have-no-score-the = { $missing } tilfælde har ingen score, det første er `{ $first_missing }`

engine-bench-predictions-name-case-that-is = prædiktionerne angiver et tilfælde, der ikke findes i referencen: `{ $extra }`

engine-bench-schema-must-be = `schema` skal være `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` skal være en 64-cifret hex SHA-256

engine-bench-truth-is-not-json = referencen er ikke JSON: { $e }

engine-bench-predictions-are-not-json = prædiktionerne er ikke JSON: { $e }

engine-bench-truth-schema-must-be = referencens `schema` skal være `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = prædiktionernes `schema` skal være `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = referencen blev lavet under en anden specifikationsversion end { $SPEC_VERSION }; resultater fra forskellige hovedversioner blandes aldrig

engine-bench-unknown-task = ukendt opgave `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = resultat { $v1 } er ikke gyldigt: { $p }

engine-bench-site-result-is-task-holdout-result = resultat { $v1 } er et resultat for opgave (d) på tilbageholdt datasæt uden `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = resultat { $v1 } er bedømt på en foreløbig, afsløret seed for tilbageholdt datasæt: ikke et tilbageholdt datasæt til udgivelsen

engine-bench-site-result-was-scored-under-this = resultat { $v1 } blev bedømt under { $v }; denne side gælder for { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = score for `{ $k }` er ikke et tal

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } ({ $lit_0_35 } standard-overvågningsstatistik)

engine-bench-tasks-malformed-clock-line = fejlformet urlinje `{ $line }`

engine-bench-tasks-the-clock-file-does-not = urfilen matcher ikke den fastlåste SHA-256 (fik { $got }, ønsket { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = satellit { $prn } findes ikke i urfilen

engine-bench-tasks-kshana-bench-baseline = kshana-bench baseline: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = prædiktionerne dækker { $pmap } tilfælde, referencen har { $tarr }

engine-bench-tasks-case-has-no-number-array = tilfælde `{ $id }` har ingen talarray

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] tilfælde `{ $id }` kræver { $n } værdi, har { $a }
       *[other] tilfælde `{ $id }` kræver { $n } værdier, har { $a }
    }


engine-bench-tasks-case-has-non-finite-value = tilfælde `{ $id }` har en ikke-endelig værdi

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialiser { $name }: { $e }

engine-e-bin-crossover-study-write = skriv { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = fejl: kan ikke oprette { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = færdig: inertiel { $nodes } knuder, ur { $curves } kurver (seed 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } brugerepoke x 3 URA-værdier på { $dt } s = { $v1 } ms pr. brugerepoke ({ $ok } løsbare)
       *[other] { $n } brugerepoker x 3 URA-værdier på { $dt } s = { $v1 } ms pr. brugerepoke ({ $ok } løsbare)
    }


## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = skrev docs/INTEROP.md (eksporttabel)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = skrev valideringsoversigt til { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = ukendt legeme '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigerer omkring et andet legeme end Jorden med en Jord-forbindelse; { $name } understøttes ikke her

engine-e-body-pnt-duration-and-step-must-be = duration_s og step_s skal være positive med højst 20000 epoker; fik { $duration } og { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind skal være orbiter eller surface; fik '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = brugerens højde skal være positiv og excentriciteten i [0, { $lit_0_9 })

engine-e-body-pnt-the-user-orbit-periapsis-is = brugerbanens periapsis ligger under overfladen

engine-e-body-pnt-constellation-needs-to-200-satellites = konstellationen kræver 1 til 200 satellitter i mindst ét plan

engine-e-body-pnt-constellation-altitude-must-be-positive = konstellationens højde skal være positiv

engine-e-body-pnt-range-sigmas-must-be-positive = afstands-sigmaer skal være positive

engine-e-body-pnt-no-earth-position-relative-to = ingen Jord-position relativt til { $name } ved JD { $jd }

engine-e-body-pnt-serialising-report = serialiserer rapport: { $e }

engine-e-body-pnt-the-report-must-serialise-to = rapporten skal serialiseres til et JSON-objekt

engine-body-pnt-positioning-around-user-relays-at =
    Positionsbestemmelse omkring { $name } — { $user_kind }-bruger, { $n_relays } relæer ved { $r } km, { $n_epochs } epoker
    { "  " }Jordens lystid { $one_way_light_time_s } s én vej, { $two_way_light_time_s } s rundtur; Sol-Jord-legeme-vinkel { $sun_separation_deg } deg
    { "  " }tilgængelighed: { $availability_relays } kun konstellation, { $availability_with_earth } med Jord-afstanden (Jorden i sigte { $earth_visibility })
    { "  " }median-PDOP { $opt }; RMS-fejl { $opt2 } kun konstellation, { $opt3 } med Jord-afstanden
    { "  " }median formel sigma { $opt4 } kun konstellation, { $opt5 } med Jord-afstanden{ "\u000A" }

engine-body-pnt-positioning-around = Positionsbestemmelse omkring { $name }

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] { $user_kind }-bruger · { $n_relays } relæ · Jordens lystid { $one_way_light_time_s } s · MODELLED
       *[other] { $user_kind }-bruger · { $n_relays } relæer · Jordens lystid { $one_way_light_time_s } s · MODELLED
    }


## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = E1-scenariet er ikke en tabel

engine-e-calibration-ensembles-e1-scenario-has-no-monte = E1-scenariet har ingen [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } mangler

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 er `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ensembler på hver 200 realisationer, mod den lukkede form: middelværdi 0, sigma = { $sigma } ns. Ensemble j bruger basis-seed 1 000 000 + 1000 j og bootstrap-seed 20260928 + j. Den største relative ADEV-fejl var { $max } for E2 og { $max2 } for E3 (på tværs af 1, 10 og 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = tom resultatsti

engine-e-campaign-result-path-has-an-empty = resultatstien `{ $path }` har et tomt segment

engine-e-campaign-result-path-bad-index-in = resultatsti `{ $path }`: ugyldigt indeks i `{ $part }`

engine-e-campaign-result-path-no-field = resultatsti `{ $path }`: intet felt `{ $name }`

engine-e-campaign-result-path-indexed-value-is = resultatsti `{ $path }`: den indekserede værdi er ikke et array

engine-e-campaign-result-path-index-out-of = resultatsti `{ $path }`: indeks { $i } uden for intervallet ({ $n })

engine-e-campaign-result-path-value-is-not = resultatsti `{ $path }`: værdien er hverken et tal eller et flag

engine-e-campaign-result-path-is-not-an = resultatsti `{ $path }`: `{ $k }` er ikke et array

engine-e-campaign-result-path-must-name-one = resultatstien `{ $path }` skal angive én værdi, ikke rækker

engine-e-campaign-result-path-is-not-an-2 = resultatsti `{ $path }`: `{ $name }` er ikke et array

engine-e-campaign-metric-path-has-no-entry = metrikstien `{ $path }` har ingen post i den pågældende scenarietypes units-blok; angiv dens `unit` i kampagnen

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` skal bestå af mindst ét tegn og kun indeholde bogstaver, cifre, `_` eller `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: en kampagne kan ikke indeholde en kampagne

engine-e-campaign-serialise = { $label }: serialisering: { $e }

engine-e-campaign-result-did-not-parse = { $label }: resultatet kunne ikke læses: { $e }

engine-e-campaign-seed-key-no-field-in = seed-nøglen `{ $key }`: scenariet har intet felt `{ $part }`

engine-e-campaign-seed-key-is-not-non = seed-nøglen `{ $key }` er ikke et ikke-negativt heltal

engine-e-campaign-seed-does-not-fit-toml = seed { $seed } passer ikke i et TOML-heltal

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = tidsstien `{ $t }` skal angive rækker med `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` er ikke below, above eller abs_above

engine-campaign-threshold-is-null = tærsklen `{ $p }` er null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` er ikke mean, min, max eller count

engine-campaign-time-path-gives-several-values = tidsstien `{ $t }` giver flere værdier pr. række

engine-campaign-value-path-has-fewer-rows = værdistien `{ $y }` har færre rækker end `{ $t }`

engine-campaign-value-path-has-rows-time = værdistien `{ $y }` har { $r } rækker, tidsstien `{ $t }` har { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = en kampagne med faser kræver en [timeline] med step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s skal være positiv, fik { $step }

engine-e-campaign-phase-is-named-twice = fasen `{ $name }` er navngivet to gange

engine-e-campaign-phase-duration-must-be-non = fase `{ $name }`: duration_s skal være ikke-negativ

engine-e-campaign-phase-has-no-runs = fasen `{ $name }` har ingen kørsler

engine-e-campaign-phase-the-first-phase-has = fase `{ $name }`: den første fase har intet at overdrage fra

engine-e-campaign-phase-handoff-from-channel-which = fase `{ $name }`: overdragelse fra kanalen `{ $ch }`, som den forrige fase ikke sluttede med

engine-e-campaign-phase-handoff-from-run-does = fase `{ $name }`: overdragelsens from_run { $from_run } findes ikke

engine-e-campaign-phase-handoff-is-null = fase `{ $name }`: overdragelsen `{ $from }` er null

engine-e-campaign-phase-handoff-run-does-not = fase `{ $name }`: overdragelsens kørsel { $run } findes ikke

engine-e-campaign-phase = fase `{ $name }`: { $e }

engine-campaign-phase-run = fase { $name }/kørsel { $ri }

engine-e-campaign-phase-end-at-run-does = fase `{ $name }`: end_at_run { $end_at_run } findes ikke

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s er senere)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } er null)

engine-e-campaign-phase-side-is-not-classical = fase `{ $name }`: side `{ $side }` er hverken classical eller quantum

engine-e-campaign-phase-skip-must-be-non = fase `{ $name }`: skip_s skal være ikke-negativ

engine-e-campaign-phase-alarm-compare-is-not = fase `{ $name }`: alarmens compare `{ $compare }` er ikke below, above eller abs_above

engine-e-campaign-phase-alarm-threshold-is-null = fase `{ $name }`: alarmtærsklen `{ $p }` er null

engine-e-campaign-phase-channel-is-in-not = fase `{ $name }`: kanalen `{ $channel }` er i { $u }, ikke { $du }

engine-e-campaign-phase-channel-needs-unit = fase `{ $name }`: kanalen `{ $channel }` kræver en enhed

engine-e-campaign-phase-two-runs-both-provide = fase `{ $name }`: to kørsler leverer begge kanalen `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = fasen `{ $name }` fører `{ $ch }` videre, som den forrige fase ikke sluttede med

engine-e-campaign-phase-carries-but-no-run = fasen `{ $name }` fører `{ $ch }` videre, men ingen kørsel i den leverer `{ $ch }`

engine-e-campaign-channel-is-in-in-one = kanalen `{ $name }` er i { $unit } i én fase og i { $unit2 } i en anden

engine-e-campaign-at-least-one-metric-is = der kræves mindst én metrik

engine-e-campaign-metric-is-named-twice = metrikken `{ $name }` er navngivet to gange

engine-e-campaign-seed-overflow-in-the-ensemble = seed-overløb i ensemblet

engine-e-campaign-an-ensemble-needs-at-least = et ensemble kræver mindst én kørsel

engine-e-campaign-sweep-takes-one-to-three = et sweep tager én til tre akser, fik { $axes }

engine-e-campaign-axis-is-named-twice = aksen `{ $name }` er navngivet to gange

engine-e-campaign-axis-needs-at-least-two = aksen `{ $name }` kræver mindst to trin

engine-e-campaign-axis-scale-must-be-lin = akse `{ $name }`: scale skal være lin eller log

engine-e-campaign-axis-log-axis-needs-positive = akse `{ $name }`: en log-akse kræver positive endepunkter

engine-campaign-sweep-node = sweep-knudepunkt { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs skal være mindst to

engine-e-campaign-compose-needs-at-least-one = compose kræver mindst ét medlem

engine-e-campaign-shared-value-must-be-number = den delte værdi `{ $name }` skal være et tal eller flere tal

engine-e-campaign-shared-value-is-named-twice = den delte værdi `{ $name }` er navngivet to gange

engine-e-campaign-member-binds-unknown-shared = medlemmet `{ $label }` binder den ukendte delte værdi `{ $name }`

engine-e-campaign-member = medlem `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = metrikken `{ $name }` er i { $u } for ét medlem og i { $unit } for `{ $label }`

engine-e-campaign-member-is-named-twice = medlemmet `{ $label }` er navngivet to gange

engine-e-campaign-invalid-campaign-scenario = ugyldigt kampagnescenarie: { $e }

engine-e-campaign-invalid-campaign = ugyldig kampagne: { $e }

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } af { $what } på tværs af realiseringerne

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = værdien af { $ch } ved afslutningen af den forrige fase, lagt til denne fases { $ch }

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } på tidslinjegitteret: den seneste sample fra den pågældende fases kørsel ved eller før hvert gittertidspunkt (zero-order hold); null hvor ingen kørsel i den fase leverer den

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = værdier af scenarienøglen { $key } langs aksen { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = værdien af scenarienøglen { $key } i dette knudepunkt

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } af knudepunktets resultat

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } af hver realisering, i seed-rækkefølge

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = delt værdi { $name }, skrevet ind i hvert medlem, der binder den

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = metrikken { $name } læst fra medlemmets resultat

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = mindste { $name } på tværs af medlemmerne

engine-campaign-largest-across-the-members = største { $name } på tværs af medlemmerne

engine-campaign-mean-across-the-members = middelværdi af { $name } på tværs af medlemmerne

engine-e-campaign-failed-to-serialise-campaign-result = kampagneresultatet kunne ikke serialiseres: { $e }

engine-campaign-chain-phases-over-events-alarm = chain: { $phases } faser over { $duration_s } s, { $events } hændelser, alarm udløst på { $alarm_s } s af gitteret

engine-campaign-sweep-of-nodes-over = sweep af `{ $scenario_kind }`: { $nodes } knudepunkter over [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Monte Carlo af `{ $scenario_kind }`: { $runs } seeds

engine-campaign-compose-members = compose: { $members } medlemmer

engine-campaign-member-runs-modelled = { $runs_total } medlemskørsler (MODELLED)

engine-campaign-sweep-of-over-nodes-each = sweep af `{ $scenario_kind }` over { $axis_order } ({ $nodes } knudepunkter; hver linje på sit eget interval)

engine-campaign-campaign-modelled-composition-every-value = kampagne { $r } | MODELLED sammensætning; hver værdi er læst fra en reel kørsel af den angivne type

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = en optimering tager én til tre params, fik { $params }

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` er navngivet to gange

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: kræver endelig lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale skal være lin eller log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: en log-param kræver positive grænser

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start skal ligge i [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: et gitter kræver mindst to trin

engine-e-campaign-optimize-objective-target-is-only-read = objective.target læses kun med goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" kræver et endeligt objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal skal være minimize, maximize eller target, fik `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = et gitter på { $total } knudepunkter ligger over grænsen på 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps læses kun med method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals skal dække den indledende simplex (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step skal ligge i (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol og xtol skal være ikke-negative

engine-e-campaign-optimize-method-must-be-grid-or = method skal være grid eller nelder-mead, fik `{ $other }`

engine-campaign-optimize-optimize-eval = optimize-evaluering { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = nedre grænse for scenarienøglen { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = øvre grænse for scenarienøglen { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = værdien af scenarienøglen { $key } ved den bedste evaluering

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = værdien af scenarienøglen { $key } ved denne evaluering

engine-campaign-optimize-target-value-of = målværdi for { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } ved den bedste evaluering

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } for denne evaluering (seed-middelværdien når runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) af `{ $scenario_kind }` med { $method }: { $evals } evalueringer ({ $stop_reason }), bedste { $o2 } ved [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START før headeren CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: ugyldig headerlinje: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: ugyldig metadatalinje: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: ugyldig datalinje: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: ukendt datanøgleord { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: datalinjen { $k } mangler epoke

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: datalinjen { $k } mangler værdi

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: datalinjen { $k } har ugyldig værdi { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: uafsluttet segment (mangler META_STOP/DATA_STOP)

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

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = ukendt observable `{ $other }`: forventet en af range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = ukendte koordinater `{ $other }`: forventet en af cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours skal være endelig og positiv, fik { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs skal være ≥ 2, fik { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps skal være ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials skal være ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations skal være ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd skal være endelig og positiv, fik { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor skal være endelig og positiv, fik { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km skal være endelig og positiv, fik { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m skal være endelig og positiv, fik { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s skal være endelig og positiv, fik { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = konstellationen skal som minimum indeholde en chief og én reference

engine-e-cislunar-arc-recovery-family-is-an-out-of = familien `{ $family }` er en familie uden for planet og har ingen plan firetilstandsrepræsentation: angiv spatial = true for at gennemløbe den

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = fremadmodellen gav en ikke-endelig referencemåling

engine-cislunar-arc-recovery-first-arc-length-at-which = første buelængde, hvor ALLE seedede forsøgs støjfri batchløsning bringer den endelige tilstandsfejl ned på højst { $recovery_factor } gange den a priori-forskydning, den startede fra. Dette er genfindingsanalogen til rangkriteriet: med eksakte målinger bliver spørgsmålet `is the state observable?` til `can an estimator get it back?`, og ingen singulærværditolerance indgår i svaret.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = første buelængde, hvor Monte Carlo-RMS-positionsfejlen ved genfinding over { $trials } seedede støjrealiseringer falder til eller under { $error_bound_km } km. Dette er genfindingsanalogen til estimerbarhedskriteriet, målt frem for forudsagt: fejlen er afstanden fra estimatet til den kendte reference, ikke sporet af en formel kovarians.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED inden for ét trin af epokegitteret: estimatoren genfinder fra { $e } h, Gramian-rangkriteriet vender ved { $g } h (forhold { $v1 }, gitter { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED som genfindbarhedsgrænse: estimatoren genfinder fra { $e } h, { $v1 } Gramian-rangkriteriets { $g } h (forhold { $v2 }, gitter { $grid_hours } h). Rangkriteriet er en relativ singulærværdikonvention; genfindingsgrænsen er en målt tilstandsfejl, og de to falder ikke sammen her.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: estimatoren når aldrig sin genfindingsgrænse på denne bue, mens Gramian-rangkriteriet vender ved { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = Gramian-rangkriteriet nås aldrig på denne bue (geometrien når aldrig fuld rang), mens estimatoren genfinder fra { $e } h — de to er uenige om, hvorvidt der overhovedet findes en grænse.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | { $family }-familie, { $state_dim } tilstande, { $n_spacecraft } s/c, observable { $observable }, parametrisering { $coordinates } | bue på { $arc_hours } h, { $epochs } epoker (gitter { $grid_hours } h), { $trials } forsøg, seed { $seed } | partielle afledte ved finite differenser, ingen analytisk Jacobian / STM / SVD / SRIF | støjfri genfinding fra { $nf } (faktor { $recovery_factor }) mod Gramian-rangtærskel { $gram } | Monte Carlo-estimerbarhed fra { $est } (RMS pos ≤ { $error_bound_km } km, σ { $sigma_range_m } m) mod Gramian-estimerbarhed { $gram_est } | RMS pos ved buens slutning { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = ukendt familie `{ $other }`: forventet en af dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO ved krydsningsafstand { $d } kunne ikke differentialkorrigeres

engine-e-cislunar-observability-member-at-x0-did-not = { $label }-medlem { $i } ved x0 = { $x0 } kunne ikke differentialkorrigeres

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft skal være mellem 2 og { $MAX_SPACECRAFT }, fik { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs skal være ≥ 2, fik { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol skal være endelig og positiv, fik { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m skal være endelig og ikke-negativ, fik { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km skal være endelig og positiv, fik { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    { $n_links ->
        [one] cislunar-observability | { $c } s/c ({ $refs } referencer) | bue på { $arc_hours } h, { $rank_arc } epoker | rang { $first } → { $last } af { $state_dim } over buen | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | øjeblikkelig rang kun range { $rank_range_only } → range+rate { $rank_range_rate } ({ $n_links } link) | GDOP kun range { $ro } range+rate { $rr } | DRO-begyndelsesbetingelser (maks. periodicitetsresidual { $max_resid }) | SRIF-posterior endelig ved epoke med rang 4 { $srif_epoch } (afprøvet: rang/STM/DRO-lukning/SRIF; beregnet ud fra en model: udformning)
       *[other] cislunar-observability | { $c } s/c ({ $refs } referencer) | bue på { $arc_hours } h, { $rank_arc } epoker | rang { $first } → { $last } af { $state_dim } over buen | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | øjeblikkelig rang kun range { $rank_range_only } → range+rate { $rank_range_rate } ({ $n_links } links) | GDOP kun range { $ro } range+rate { $rr } | DRO-begyndelsesbetingelser (maks. periodicitetsresidual { $max_resid }) | SRIF-posterior endelig ved epoke med rang 4 { $srif_epoch } (afprøvet: rang/STM/DRO-lukning/SRIF; beregnet ud fra en model: udformning)
    }


engine-cislunar-observability-never-rank-of = aldrig (rang { $rank } af { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | { $family }-familie, { $state_dim } tilstande, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | rangtærskel { $rank_thr } (gitter { $c } h) | estimerbarhedstærskel (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = første buelængde, hvor den formelle 1σ-positionsusikkerhed for chief'ens INDLEDENDE tilstand, σ_pos = sqrt(trace(P_rr)) med P = (ÕᵀÕ)⁻¹ og Õ den målestøjshvidnede observerbarhedsmatrix, falder til eller under { $sigma_pos_threshold_km } km. Dette er det kriterium, under hvilket en buelængdetærskel overhovedet er støjafhængig: P skalerer som σ², så σ_pos skalerer som σ, mens rangkriteriet ovenfor ikke flytter sig med σ. Grænsen er et ANGIVET ingeniørmæssigt valg, ikke et tilpasset — estimability_sweep rapporterer tærsklen ved fire andre grænser.

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] UDVIDELSE (R3) — denne kørsel er IKKE den plane DRO-konfiguration, som `label` ovenfor beskriver. Tilstandsdimension { $state_dim }; banefamilie { $family }; { $n_spacecraft } rumfartøj; afstandsmålingens sigma { $sigma_range_m } m. Hvor `label` siger "planar" og "planar DROs", skal du læse den familie, der er angivet her. VALIDATED tilføjelser: den variationelle 6x6-STM er den samme CR3BP-STM (crate::cr3bp), valideret ved finite differenser, som bruges i fuld bredde; de rumlige range-/range-rate-Jacobian-rækker er analytiske partielle afledte valideret ved finite differenser, hvor range-rate-rækken er krydstjekket komponent for komponent mod cratens uafhængige 3D-funktion deepspace_od::range_rate_observable; begyndelsesbetingelserne for halo/NRHO er differentialkorrigerede periodiske baner fra den samme korrektor, som gengiver den publicerede sydlige L2 9:2-NRHO, fortsat fra det publicerede startpunkt, og hvert medlems lukningsresidual rapporteres; de seks-tilstands RANG-konklusioner er bekræftet mod en UAFHÆNGIG række-echelon-rang (Gauss-elimination med partiel pivotering), som ikke deler kode med egenværdi-/SVD-vejen. REDELIG AFGRÆNSNING AF SRIF-LEDDET: SRIF-krydsvalideringen ovenfor bruger de SAMME målings-Jacobianer og reduceres til det samme O^T O, så dens overensstemmelse er et konsistenstjek mellem to numeriske maskiner, IKKE uafhængig bekræftelse af tærsklen — den tæller ikke som afprøvning af noget tal her. MODELLED: familieudformningen (hvilke abscisser, amplituder og faser), epokegitteret, enkeltlink-buen og den angivne positionsgrænse i estimerbarhedskriteriet.
       *[other] UDVIDELSE (R3) — denne kørsel er IKKE den plane DRO-konfiguration, som `label` ovenfor beskriver. Tilstandsdimension { $state_dim }; banefamilie { $family }; { $n_spacecraft } rumfartøjer; afstandsmålingens sigma { $sigma_range_m } m. Hvor `label` siger "planar" og "planar DROs", skal du læse den familie, der er angivet her. VALIDATED tilføjelser: den variationelle 6x6-STM er den samme CR3BP-STM (crate::cr3bp), valideret ved finite differenser, som bruges i fuld bredde; de rumlige range-/range-rate-Jacobian-rækker er analytiske partielle afledte valideret ved finite differenser, hvor range-rate-rækken er krydstjekket komponent for komponent mod cratens uafhængige 3D-funktion deepspace_od::range_rate_observable; begyndelsesbetingelserne for halo/NRHO er differentialkorrigerede periodiske baner fra den samme korrektor, som gengiver den publicerede sydlige L2 9:2-NRHO, fortsat fra det publicerede startpunkt, og hvert medlems lukningsresidual rapporteres; de seks-tilstands RANG-konklusioner er bekræftet mod en UAFHÆNGIG række-echelon-rang (Gauss-elimination med partiel pivotering), som ikke deler kode med egenværdi-/SVD-vejen. REDELIG AFGRÆNSNING AF SRIF-LEDDET: SRIF-krydsvalideringen ovenfor bruger de SAMME målings-Jacobianer og reduceres til det samme O^T O, så dens overensstemmelse er et konsistenstjek mellem to numeriske maskiner, IKKE uafhængig bekræftelse af tærsklen — den tæller ikke som afprøvning af noget tal her. MODELLED: familieudformningen (hvilke abscisser, amplituder og faser), epokegitteret, enkeltlink-buen og den angivne positionsgrænse i estimerbarhedskriteriet.
    }


engine-cislunar-observability-validated-each-constellation-initial-condition = Afprøvet: hver konstellations begyndelsesbetingelse er en differentialkorrigeret periodisk bane i familien { $family }, der lukker over én periode inden for det rapporterede periodicitetsresidual (plane DRO'er er desuden retrograde omkring Månen). Familien korrigeres ved Jord-Måne-masseforholdet. Beregnet ud fra en model: valget af familieparametre og faser (konstellationens udformning). Nøglenavnet `dro_provenance` bevares for det udgivne dokumentskema; det rummer den familie, som denne kørsel bad om.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } skal være endelig og positiv, fik { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } skal ligge i (0, 1), fik { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg skal ligge i [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems skal angive mindst én forudindstilling

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias kræver endelige bias_m, t0_s og t1_s

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] integrity: { $n } epoke overstiger grænsen på { $MAX_EPOCHS } epoker; hæv step_s
       *[other] integrity: { $n } epoker overstiger grænsen på { $MAX_EPOCHS } epoker; hæv step_s
    }


## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: ingen poster

engine-e-clock-library-card-records-at-different-tau0 = { $name }: poster med forskellig tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: periodisk mindste kvadraters metode mislykkedes

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: { $used } stabilitetspunkter med edf >= { $MIN_FIT_EDF }; et kort kræver tre

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = huller { $g }, faseudliggere { $o }, fasespring { $p }, byger { $b }, frekvensspring { $f } (robust sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` er ikke et ikke-negativt heltal

engine-e-compliance-is-missing = `{ $p }` mangler

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } overstiger events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } overstiger predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: receiver-trust-tællingerne er ugyldige ({ $malformed_counts }); udeladt

engine-e-compliance-not-json = { $label }: ikke JSON: { $e }

engine-compliance-cannot-read = { $label }: kan ikke læses: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: det tilhørende scenarie angiver kind `{ $s }`, men resultatet angiver `{ $o }`; bruges ikke

engine-e-compliance-scenario-kind-not-found-no = { $label }: scenarietype ikke fundet (ingen tilhørende scenariefil, ikke et receiver-trust-resultat, ingen `kind` på øverste niveau)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` er ikke en scenarietype, motoren kender; bruges ikke

engine-compliance-written-by-kshana = Skrevet af kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } test(s) med alle angivne tærskler nået, { $not_met } med en tærskel, der ikke er nået, { $needs_input } kræver input.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = intensitetsgitteret skal have endelig min < max, fik [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = intensitetsgitteret kræver >= 2 trin, fik { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = korrelationsgitteret skal have mindst én værdi

engine-e-conflict-resilience-correlation-values-must-lie-in = korrelationsværdier skal ligge i [0, 1], fik { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience kræver mindst ét lag

engine-e-conflict-resilience-layer-availability-not-in = lag { $i } availability { $availability } ligger ikke i [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = lag { $i } sigma_m skal være endelig og positiv

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = lag { $i } vulnerability skal være endelig og >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = lag { $i } vector_weight skal være endelig og >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } uden for intervallet (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials skal være >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } lag ({ $primary } baseline) | referenceintensitet { $reference_intensity } | robusthedsforhold lukket form { $ratio_closed_form }x MC { $ratio_mc_independent }x (lagdelt mod enkeltlag) | korrelation underminerer lagdeling: forhold { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | a priori-CI [{ $ratio_lo }-{ $ratio_hi }]x | overlevelse pr. vektor @ ref jamming { $surv }% spoofing { $surv2 }% kinetic { $surv3 }% cyber { $surv4 }% (skarpest { $sharpest }) | ~7x hovedtal MODELLED, VALIDATED MC->lukket form / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = ukendt centrallegeme { $name }: forventet en planet, Pluto, Månen eller en stor måne (earth, moon, mars, europa, titan, ...; se crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = et Walker-skal kræver total > 0 og planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walker-total { $total } er ikke et multiplum af planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = Walker-faseforskydning F = { $phasing } skal ligge i 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } er ikke en udvidelig GPS-slot (SPS PS Table 3.2-2 angiver B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: angiv altitude_km eller semi_major_axis_km, ikke begge

engine-e-constellation-needs-altitude-km-or-semi = { $what }: kræver altitude_km eller semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: store halvakse { $v1 } km ligger ikke over { $name }-radius

engine-e-constellation-eccentricity-must-lie-in = { $what }: excentricitet { $e } skal ligge i [0, { $lit_0_9 })

engine-e-constellation-perigee-is-below-the-surface = { $what }: perigæum ligger under overfladen på { $name }

engine-e-constellation-constellation-preset-is-an-earth = konstellation { $name }: forudindstillingen { $p } er en jordkonstellation, centrallegemet er { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = konstellation { $name }: ukendt forudindstilling { $other } (forventet gps-baseline, gps-expandable, galileo, beidou, beidou-meo eller glonass)

engine-e-constellation-constellation-expanded-applies-only-to = konstellation { $name }: `expanded` gælder kun for forudindstillingen gps-expandable

engine-constellation-constellation-shell = konstellation { $name } shell { $v2 }

engine-constellation-explicit-element-sets = { $satellite } eksplicitte elementsæt

engine-constellation-constellation-satellite = konstellation { $name } satellit { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = konstellation { $name } har ingen satellitter: angiv en forudindstilling, en [[constellation.shell]] eller en [[constellation.satellite]]

engine-e-constellation-no-constellation-given = ingen konstellation angivet

engine-e-constellation-constellations-with-one-clock-each = { $constellations } konstellationer med ét ur hver overstiger grænsen på { $MAX_CLOCKS } ure; brug clock = "common" eller slå konstellationer sammen

engine-e-constellation-must-be-finite = { $what } skal være endelig

engine-e-constellation-need-step-and-duration-step = kræver step_s > 0 og duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = mere end 100 000 epoker; hæv step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg skal ligge i [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold skal være positiv

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg skal ligge i [{ $lit_0_25 }, 90]

engine-e-constellation-need-90-lat-min-deg = kræver -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = kræver lon_min_deg < lon_max_deg med en udstrækning på højst 360 deg

engine-e-constellation-give-at-least-one-constellation = angiv mindst én [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points er begrænset til 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } satellitter overstiger grænsen på 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: { $total } satellitter ({ $names }) omkring { $name }; tilgængelighed { $global_availability_pct }% (PDOP <= { $pdop_threshold } ved { $mask_deg } deg maske), dårligste sted { $worst_site_availability_pct }%, median-PDOP { $cov }, middel { $global_mean_visible } i sigte; { $grid_points } gitterpunkter x { $epochs } epoker (MODELLED)

engine-constellation-constellation-coverage-over-the = Konstellationsdækning over { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } skal være endelig og positiv

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } skal være endelig og >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw skal være endelig

engine-e-contact-schedule-satellite-altitude-km-must-be = satellit '{ $name }': altitude_km skal ligge i (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satellit '{ $name }': inclination_deg skal ligge i [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satellit '{ $name }': backlog_mbit skal være >= 0

engine-e-contact-schedule-satellite-priority-must-be = satellit '{ $name }': priority skal være > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satellit '{ $name }': eirp_dbw skal være endelig

engine-e-contact-schedule-station-lat-deg-in-90 = station '{ $name }': lat_deg i [-90, 90], lon_deg endelig

engine-e-contact-schedule-station-mask-deg-must-be = station '{ $name }': mask_deg skal ligge i [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = station '{ $name }': alt_m skal ligge i [0, 3000] (ITU-R P.834-intervallet)

engine-e-contact-schedule-station-setup-and-over-db = station '{ $name }': setup_s >= 0 og g_over_t_db endelig

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours skal ligge i (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s skal ligge i (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = der kræves mindst én satellit og én station

engine-e-contact-schedule-at-most-32-satellites-and = højst 32 satellitter og 32 stationer

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: { $satellites } satellitter x { $stations } stationer over { $duration_hours } h -> { $cands } kandidatkontakter, { $greedy } planlagt; { $total_del } af { $total_backlog } Mbit leveret{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: { $pairs } passage(r); ACM { $acm } Mbit mod CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = kræver mindst 2 trials og en endelig sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total skal ligge i (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = intet lokalt referencesystem ved brugeren

engine-e-dop-error-ci-singular-geometry = { $name }: singulær geometri

engine-e-dop-error-ci-no-noise-free-fix = { $name }: ingen støjfri positionsbestemmelse

engine-e-dop-error-ci-no-fix = { $name }: ingen positionsbestemmelse

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singulær geometri

engine-e-dop-error-mc-no-fix = { $label }: ingen positionsbestemmelse

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km skal være positiv; fik { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes og sats_per_plane skal begge være forskellige fra nul

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz skal være positiv; fik { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency skal ligge i (0, 1]; fik { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k skal være positiv; fik { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db skal være ikke-negativ; fik { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m skal ligge uden for Jorden; fik { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] Earth-GNSS på månens afstand — { $n_satellites } satellit, modtager ved { $r } km{ "\u000A" }
       *[other] Earth-GNSS på månens afstand — { $n_satellites } satellitter, modtager ved { $r } km{ "\u000A" }
    }


engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Jordens rand set fra konstellationen: { $earth_limb_half_angle_deg } deg fra nadir — enhver stråle mod Månen skal overstige dette{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_geometrically_visible } af { $n_satellites } ikke skjult; { $n_trackable } overstiger sporingstærsklen på { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }bedste link { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }hver sporbar sigtelinje ligger inden for en halvkegle på { $a } deg — geometrien er næsten degenereret{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }SWEEP over { $epochs } epoker / { $span_s } s: signaltilgængelighed { $signal_availability }, tilgængelighed af positionsbestemmelse { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }sporbare links middel { $mean_trackable }, maks. { $max_trackable }; bedste C/N0 { $w }; bedste PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = der kræves mellem ét og seks trin

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg skal være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 skal være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg skal være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m skal være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg skal ligge i [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s skal være endelig og ikke-negativ

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = løftforholdet mellem thrust og vægt { $tw } skal overstige 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ideel dv { $ideal_dv_m_s } m/s, tab { $losses } m/s (tyngdekraft { $gravity_loss_m_s }, modstand { $drag_loss_m_s }, styring { $steering_loss_m_s }, mottryk { $back_pressure_loss_m_s }); udbrænding { $r } km ved { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } skal være endelig og positiv

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body skal være "earth" eller "mars", fik "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = atmosfæren "{ $a }" er ikke tilgængelig for body "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg skal ligge i (0, 90) (positiv nedad)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m skal ligge i [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg skal være endelig med |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg og longitude_deg skal være endelige

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag skal ligge i [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg skal være endelig

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s skal ligge i (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m skal ligge i [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s skal ligge i (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame skal være inertial|relative, fik "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> spids { $pk_g } g ved { $r } km, spids-q { $r2 } W/cm² ved { $r3 } km, varmebelastning { $r4 } J/cm², spids-q_dyn { $r5 } kPa; { $outcome } ved { $end_time_s } s (lukket form { $cf_g } g; MODELLED 3-DoF, ingen stråling/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } skal ligge i (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } skal være endelig og ikke-negativ

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg skal ligge i [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits skal ligge i 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (brønd { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = nadirvinklen { $eta_rad }° overstiger Jordens vinkelradius { $rho }° (rammer ikke Jorden)

engine-e-eo-payload-no-sun-synchronous-inclination-at = ingen solsynkron inklination ved { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg skal ligge i (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad skal være endelig og positiv

engine-e-eo-payload-half-fov-too-large = half_fov er for stor: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> { $v3 } km sporbredde, { $gsd } m GSD i nadir, adgang til { $v5 } km fra nadir; knudepunktsafstand { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Jord-Måne-barycenter fra { $table }, opdelt efter Montenbruck & Gills månerække, præcesseret til J2000

engine-ephem-provider-jpl-mean-elements-in-the = JPL-middelelementer i Laplace-planen, middellængderate fra IAU's synkrone rotationsrate, lagt til sin planet fra { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = IAU's synkrone rotationsretning ved JPL's middelafstand, lagt til Saturn fra { $table }

engine-e-ephem-provider-read = læs { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = TLE mangler linje 1 (en linje, der starter med `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE mangler linje 2 (en linje, der starter med `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = en analytisk `orbit`-efemeride kræver en `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = et efemeridescenarie kræver enten en `tle` eller en `orbit`

engine-e-ephemeris-step-must-be-positive = step_s skal være positiv

engine-e-ephemeris-duration-must-be-non-negative = duration_s skal være ikke-negativ

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz skal være en positiv, endelig frekvens

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] { $source } sporet på jorden · { $n_samples } sample · højde { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
       *[other] { $source } sporet på jorden · { $n_samples } samples · højde { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
    }


## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` er ikke endelig

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` er hverken sekunder eller et ISO-8601 UTC-tidspunkt

engine-e-evidence-assemble-no-epoch-of-the-log = ingen epoke i loggen ligger mellem { $t0 } s og { $t1 } s (loggen spænder fra 0 til { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config er ikke et objekt

engine-e-evidence-assemble-config-json-already-has-an = config.json har allerede en post `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = fra { $from_s } til { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` er ikke et UTC-tidspunkt som 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } i en log på { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } kræver en værdi

engine-e-evidence-cli-cannot-create = kan ikke oprette { $path }: { $e }

engine-e-evidence-cli-cannot-write = kan ikke skrive { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = advarsel: { $path } kan læses af andre brugere; begræns adgangen (chmod 600)

engine-e-evidence-cli-cannot-read-key = kan ikke læse nøglen { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } er ikke en hex-nøgle

engine-e-evidence-cli-must-hold-32-byte-key = { $path } skal indeholde en nøgle på 32 bytes som 64 hex-cifre

engine-e-evidence-cli-cannot-read = kan ikke læse { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = kan ikke læse { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } findes og er ikke tom

engine-e-evidence-cli-cannot-create-2 = kan ikke oprette { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = advarsel: { $arg } er kun for ejeren (mode 600) og hedder ikke *.pub: det kan være en privat nøgle. Angiv filen med den offentlige nøgle.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` er hverken 64 hex-cifre eller en læsbar fil ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` indeholder ikke hex-cifre

engine-evidence-cli-private-key-keep-it-secret = privat nøgle: { $out }  (hold den hemmelig; commit den aldrig)

engine-evidence-cli-public-key-pub = offentlig nøgle:  { $out }.pub

engine-evidence-cli-public-key-hex = offentlig nøgle (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Giv verificerende parter den offentlige nøgle ad en vej, de har tillid til; de fastlåser den med --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify kræver en bundle-mappe

engine-e-evidence-cli-cannot-read-3 = kan ikke læse { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: intet PEM-certifikat fundet

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }tidsstempelmyndighedens signatur er ikke verificeret af Kshana

engine-evidence-cli-this-is-technical-record-not = Dette er en teknisk registrering, ikke en juridisk vurdering.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp kræver en bundle-mappe

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp kræver en token-fil

engine-e-evidence-cli-cannot-read-4 = kan ikke læse { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = kan ikke skrive { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = bemærk: tokenet ligger ved siden af det signerede manifest, ikke inde i det; kør verify med --require-timestamp for at kræve det.

engine-e-evidence-cli-round-trip-packs-are-not = round-trip-pakker bygges ikke til WebAssembly

engine-e-evidence-cli-needs-scenario-path = kræver en scenariesti

engine-e-evidence-cli-needs-from = kræver --from

engine-e-evidence-cli-needs-to = kræver --to

engine-e-evidence-cli-cannot-read-lab-attestation = kan ikke læse laboratorieerklæringen { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = kan ikke læse { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = ugyldigt receiver-trust-scenarie: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation gælder for `receiver-trust evidence`, ikke for `evidence round-trip` (hvis pakke registrerer testbetingelserne)

engine-e-evidence-cli-cannot-read-6 = kan ikke læse { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = kan ikke læse { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = bevispakke skrevet til { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epoker i vinduet: { $epochs_in_window }  ({ $from_s } s til { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }signatarens fingeraftryk: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 af manifest.json (det, en RFC 3161-myndighed bør stemple): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }logudsnit: bytes { $a } til { $b } af { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }logudsnit: hele loggen (denne log angiver intet byteinterval for vinduet)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }laboratorieerklæring registreret i det signerede manifest ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = En pakke er en teknisk registrering, ikke en juridisk vurdering.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s til { $to_s } s efter logens første epoke

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = ugyldig lab-attestation-TOML: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` skal være en tabel

engine-e-evidence-lab-invalid-lab-attestation = ugyldig lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } er påkrævet

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } er over { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: datoen { $date } er ikke en dag som 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: en afskærmet opsætning kræver enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup skal være "conducted" eller "shielded" (fik { $other }); en opsætning over luften accepteres ikke som en laboratoriekørsel

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db skal være endelig

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = testbetingelserne angiver { $events } hændelse(r), men scoringsscenariet har { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = hændelsen '{ $id }' i testbetingelserne ({ $onset_s } s til { $offset_s } s) svarer ikke til '{ $label }' i scoringsscenariet ({ $onset_s2 } s til { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = logens SHA-256 ({ $have }) er ikke den, testbetingelserne angiver ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = afkortet DER

engine-e-evidence-tsa-bad-der-length = ugyldig DER-længde

engine-e-evidence-tsa-unexpected-der-tag = { $what }: uventet DER-tag { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = tom AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = ugyldig UTCTime

engine-e-evidence-tsa-bad-generalizedtime = ugyldig GeneralizedTime

engine-e-evidence-tsa-bad-time = ugyldigt tidspunkt

engine-e-evidence-tsa-time-not-in-utc = tidspunktet er ikke i UTC

engine-e-evidence-tsa-bad-time-digits = ugyldige tidscifre

engine-e-evidence-tsa-bad-bit-string = ugyldig BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: tre elementer forventet

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: for kort

engine-e-evidence-tsa-empty-extension = tom Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: værdien er ikke en OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: tom

engine-e-evidence-tsa-validity-short = Validity: for kort

engine-e-evidence-tsa-pem-end-without-begin = PEM: END uden BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: ugyldig base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: ugyldig base64-længde

engine-e-evidence-tsa-spki-empty = SPKI: tom

engine-e-evidence-tsa-spki-no-oid = SPKI: ingen OID

engine-e-evidence-tsa-spki-no-key = SPKI: ingen nøgle

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: to heltal forventet

engine-e-evidence-tsa-unsupported-elliptic-curve = ikke-understøttet elliptisk kurve

engine-e-evidence-tsa-unsupported-public-key-algorithm = ikke-understøttet algoritme til offentlig nøgle

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA-nøgle eller -signatur for stor

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA-modulus er ikke ulige

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA-signatur uden for intervallet

engine-e-evidence-tsa-rsa-key-too-small = RSA-nøgle for lille

engine-e-evidence-tsa-invalid-padding = ugyldig padding

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: kodet meddelelse for lang

engine-e-evidence-tsa-last-octet-invalid = sidste oktet ugyldig

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: yderste venstre bits er ikke nul

engine-e-evidence-tsa-pss-bad-padding = PSS: ugyldig padding

engine-e-evidence-tsa-pss-signature-mismatch = PSS: signaturen stemmer ikke

engine-e-evidence-tsa-unsupported-mask-generation-function = ikke-understøttet maskegenereringsfunktion

engine-e-evidence-tsa-mgf1-without-hash = MGF1 uden hash

engine-e-evidence-tsa-bad-pss-salt-length = ugyldig PSS-saltlængde

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = en ECDSA-signatur kræver en EC-nøgle

engine-e-evidence-tsa-an-rsa-signature-needs-an = en RSA-signatur kræver en RSA-nøgle

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption uden digest-algoritme

engine-e-evidence-tsa-an-rsa-pss-signature-needs = en RSA-PSS-signatur kræver en RSA-nøgle

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey uden digest-algoritme

engine-e-evidence-tsa-unsupported-signature-algorithm = ikke-understøttet signaturalgoritme

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: tom

engine-e-evidence-tsa-time-stamp-request-not-granted = tidsstempelanmodningen blev ikke imødekommet

engine-e-evidence-tsa-no-time-stamp-token-in = intet tidsstempel-token i svaret

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = ikke en TimeStampResp eller et TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = ikke CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: intet indhold

engine-e-evidence-tsa-signeddata-short = SignedData: for kort

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: tom

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = det indkapslede indhold er ikke en TSTInfo

engine-e-evidence-tsa-no-tstinfo = ingen TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo ikke i en OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: for kort

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: ingen genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: ingen signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = præcis én SignerInfo forventet

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: ingen sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: ingen digest-algoritme

engine-e-evidence-tsa-signerinfo-short = SignerInfo: for kort

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: ingen signerede attributter

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: ingen signaturalgoritme

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: ingen signatur

engine-e-evidence-tsa-no-serial = intet serienummer

engine-e-evidence-tsa-signer-certificate-not-found = signatarens certifikat blev ikke fundet

engine-e-evidence-tsa-attribute-empty = Attribute: tom

engine-e-evidence-tsa-attribute-no-values = Attribute: ingen værdier

engine-e-evidence-tsa-attribute-no-value = Attribute: ingen værdi

engine-e-evidence-tsa-content-type-attribute-mismatch = content-type-attributten stemmer ikke

engine-e-evidence-tsa-digest-failure = digest-fejl

engine-e-evidence-tsa-signature-not-an-octet-string = signaturen er ikke en OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = ess signing certificate-attributten mangler

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: tom

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id blev ikke fundet

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: ingen hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = uegnet certifikatformål

engine-e-evidence-tsa-certificate-is-not-yet-valid = certifikatet er endnu ikke gyldigt

engine-e-evidence-tsa-certificate-has-expired = certifikatet er udløbet

engine-e-evidence-tsa-invalid-ca-certificate = ugyldigt CA-certifikat

engine-e-evidence-tsa-certificate-chain-too-long = certifikatkæden er for lang

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: tom

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: ingen digest

engine-e-evidence-tsa-message-imprint-mismatch = message imprint stemmer ikke

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER med ubestemt længde understøttes ikke

engine-e-evidence-tsr-expected-tag-found = forventede { $what } (tag { $tag }), fandt { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = misdannet PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = tidsstempelsvaret blev ikke imødekommet

engine-e-evidence-tsr-not-timestamp-token = ikke et tidsstempel-token

engine-e-evidence-tsr-the-token-content-type-is = tokenets indholdstype er ikke CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = tokenet indeholder ingen TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = message imprint bruger en ikke-understøttet hashalgoritme

engine-e-evidence-tsr-the-imprint-is-bytes-not = aftrykket er { $digest } bytes, ikke de { $want_len }, som { $hash_alg } giver

engine-e-evidence-tsr-gentime-is-not-utc = genTime er ikke UTC

engine-e-evidence-tsr-malformed-gentime = misdannet genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime er ikke et gyldigt kalendertidspunkt

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = ikke hex med små bogstaver

engine-e-evidence-verify-expected-bytes-found = forventede { $N } bytes, fandt { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = pakken har allerede et tidsstempel-token; brug --replace for at erstatte det

engine-e-evidence-verify-not-attached-the-pack-with = ikke vedhæftet: pakken med dette token kan ikke verificeres ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = pakken registrerer en laboratorieerklæring fra { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = signaturfilen slutter ikke med et linjeskift

engine-evidence-verify-signer-not-pinned-the-signature = signatar ikke fastlåst: signaturen beviser, at pakken er intakt i forhold til nøglen { $r }, som pakken selv angiver. Sammenlign det fingeraftryk med et, du har fået fra signataren, eller angiv nøglen.

engine-evidence-verify-range-is-not-inside-log = intervallet { $start }..{ $end } ligger ikke inde i en log på { $full_bytes } bytes

engine-evidence-verify-timestamp-token-states-its-imprint = tidsstempel-tokenet angiver { $gen_time }; dets aftryk { $v2 } manifest.json. Tidsstempelmyndighedens signatur er ikke verificeret af Kshana: kontrollér den med `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = tidsstempel-tokenet angiver { $gen_time }; dets aftryk { $v2 } manifest.json; tidsstempelmyndighedens signatur og kæde { $v3 } mod de angivne ankre.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` er den tomme streng

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } ligger uden for ordforrådet

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = omkostningsintervallet skal være endeligt, ikke-negativt, ordnet lav≤nominel≤høj og angive en kilde

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction og availability skal være brøker i [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } skal være endelig og > 0, fik { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } skal være endelig og >= 0, fik { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg skal ligge i [-90, 90), fik { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = konstellationen har ingen satellitter

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats skal være >= 1, når den er sat

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = slip-satellit { $sat } uden for intervallet

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = linje { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = linje { $lineno }: { $v } kolonner, mindst { $min } forventet

engine-e-fusion-kfgins-line-columns = linje { $v1 }: { $v } kolonner

engine-e-fusion-kfgins-line-block-lists-are-not = linje { $lineno }: bloklister understøttes ikke

engine-e-fusion-kfgins-line-expected-key-value = linje { $lineno }: forventede `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = linje { $lineno }: indrykket nøgle uden overordnet nøgle

engine-e-fusion-kfgins-line-only-one-level-of = linje { $lineno }: kun ét niveau af indlejring

engine-e-fusion-kfgins-line-unterminated-flow-list = linje { $lineno }: uafsluttet flow-liste

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` er en liste, en skalar forventet

engine-e-fusion-kfgins-missing = `{ $k }` mangler

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` skal være en liste med tre elementer

engine-e-fusion-kfgins-no-imu-sample-at-or = ingen IMU-måling ved eller efter starttime

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU-tiden er ikke voksende ved { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } skal være endelig og > 0, fik { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m skal være endelig og > 0, fik { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg skal ligge i [-90, 90), fik { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = trajectory-csv linje { $v1 }: ikke tal: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = trajectory-csv linje { $v1 }: forventede 10 kolonner, fik { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = trajectory-csv linje { $v1 }: tiden vokser ikke

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = trajectory-csv kræver mindst to rækker

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = trajectory-csv dækker { $rows } s, men scenariet kører { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: site lat_deg skal ligge i [-90, 90], og hvert felt skal være endeligt

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" er hverken en GNSS-forudindstilling ({ $e_gnss }) eller en LEO-forudindstilling ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: angiv brugeren som `site` eller `user_ecef_m`, ikke begge

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m skal være endelig og ikke geocentret

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satellit { $id }: azimut/elevation uden for intervallet

engine-e-geometry-sky-satellite-is-given-in = sky: satellit { $id } er angivet i ECEF; forespørgslen kræver `site` eller `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satellit { $id }: ECEF-positionen er ikke endelig

engine-e-geometry-sky-satellite-coincides-with-the = sky: satellit { $id } falder sammen med brugeren

engine-e-geometry-sky-satellite-give-az-deg = sky: satellit { $id }: angiv az_deg og el_deg, eller ecef_m, og intet andet

engine-e-geometry-sky-tle-is-bytes-the = sky: tle er { $text } bytes; grænsen er { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = elementsæt afvist: { $e }

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] sky: tle indeholder intet komplet topunkts elementsæt; { $n_ignored } linje ignoreret, den første: { $first }
       *[other] sky: tle indeholder intet komplet topunkts elementsæt; { $n_ignored } linjer ignoreret, den første: { $first }
    }


engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. og { $more } flere

engine-geometry-element-sets-propagated-by-the = { $n } elementsæt propageret med motorens SGP4 (WGS-72) til { $iso } og roteret til jordfast med UT1 sat til UTC og uden polbevægelse: den himmel, disse elementsæt giver på den epoke, ikke en måling af den.

engine-geometry-element-sets-propagated-by-the-2 = { $n } elementsæt propageret med motorens SGP4 (WGS-72) til det nyeste elementsæts epoke plus time_s ({ $iso }). Ingen epoke blev angivet, så dette er en repræsentativ himmel, ikke himlen på en angiven dato.

engine-e-geometry-sky-give-systems-or-tle = sky: angiv `systems` eller `tle` (med en `site`), eller `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system navngiver `tle`-satellitterne; forespørgslen har ingen `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg skal ligge i [-90, 90), fik { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` kræver en `site` (eller `user_ecef_m`) at se fra

engine-e-geometry-sky-time-must-be-finite = sky: time_s skal være endelig

engine-e-geometry-sky-system-asks-for-satellites = sky: systemet "{ $name }" beder om { $asked } satellitter; en forespørgsel rummer højst { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: mere end { $MAX_SATELLITES } satellitter

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` kræver en `site` (eller `user_ecef_m`) at se fra

engine-e-geometry-sky-more-than-satellites-above = sky: mere end { $MAX_SATELLITES } satellitter over horisonten

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m skal være positiv, fik { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence skal ligge i (0, 1), fik { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: mere end { $MAX_CLOCKS } systemer i sigte, hver med sit eget ur; gruppér satellitter under færre `system`-etiketter eller brug clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n skal ligge i 1..={ $MAX_MC_SAMPLES }, fik { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: for få satellitter i sigte til en positionsbestemmelse; ingen Monte Carlo-sky

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = TLE-himmel ved { $e }, ikke en måling

engine-e-geometry-invalid-sky-request-json = ugyldig sky-forespørgsel (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = ugyldig sky-forespørgsel (TOML): { $e }

engine-e-geometry-invalid-skyline-json = ugyldig skyline (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = ugyldig skyline (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = ugyldigt GLONASS-PRN i { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = sidetype { $pt } kodes ikke her

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bits, forventede { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bits, forventede { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = haledbits er ikke nul

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q stemmer ikke

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = sidetype { $pt } afkodes ikke her

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } symboler, forventede { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = synkroniseringsmønster ikke fundet

engine-e-gnss-navmsg-gal-fnav-page-type-missing = sidetype { $t } mangler

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav for sidetype { $t } afviger fra sidetype 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = intet Galileo-felt { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = ordtype { $wt } kodes ikke her

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bits, forventede { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = ordtype { $wt } afkodes ikke her

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = sidedele skal være på 120 bits

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = lige/ulige-flag er ikke 0 og derefter 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = ikke en nominel side (sidetype 1 er en alarmside)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bits, forventede { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } symboler, forventede { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = ordtype { $t } mangler

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav for ordtype { $t } afviger fra ordtype 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = posten er system { $system }, ikke Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = type 10 har intet felt { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = type 11 har intet felt { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = type 30 har intet felt { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV-body har { $body } bits, forventede 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } eller TOW-tæller { $tow_count } uden for intervallet

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bits, forventede { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = preamblen er ikke 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = meddelelsestype { $t } afkodes ikke her

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = kræver en type 10- og en type 11-meddelelse

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } ved LSB { $value2 } passer ikke i { $bits } { $v4 } bits

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bits, layoutet kræver { $need }

engine-e-gnss-navmsg-no-field = intet felt { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } ved skala 2^{ $scale_pow2 } passer ikke i { $bits } { $v1 } bits

engine-e-gps-lnav-no-value-for = ingen værdi for { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: referencemodellen "gfc" kræver `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: kan ikke læse gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: ukendt referencemodel `{ $other }` (brug "egm2008" eller "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: ukendt ellipsoide `{ $other }` (brug "wgs84" eller "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations skal være mindst 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations er begrænset til 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = ugyldigt reelt tal '{ $t }'

engine-e-gravity-pds-bad-integer = ugyldigt heltal '{ $t }'

engine-e-gravity-pds-empty-shadr-table = tom SHADR-tabel

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR-headeren har { $f } felter, forventede mindst 6

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR-header: negativ grad/orden eller ukendt normalisering

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR-normaliseringstilstand { $normalization } (kun fuldt normaliseret, tilstand 1, understøttes)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR-referencelængdegrad/-breddegrad skal være 0

engine-e-gravity-pds-non-physical-gm-must-be = ikke-fysisk GM (skal være endelig og positiv)

engine-e-gravity-pds-non-physical-reference-radius-must = ikke-fysisk referenceradius (skal være endelig og positiv)

engine-e-gravity-pds-shadr-record-fields = SHADR-post { $v1 }: { $f } felter

engine-e-gravity-pds-shadr-record-bad = SHADR-post { $v1 }: ugyldigt (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR-post { $v1 }: ikke-endelig koefficient

engine-e-gravity-pds-no-shadr-coefficient-records = ingen SHADR-koefficientposter

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR-tabellen er ufuldstændig: mangler (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant mangler

engine-e-gravity-sh-missing-radius = radius mangler

engine-e-gravity-sh-non-physical-earth-gravity-constant = ikke-fysisk earth_gravity_constant (skal være endelig og positiv)

engine-e-gravity-sh-non-physical-radius-must-be = ikke-fysisk radius (skal være endelig og positiv)

engine-e-gravity-sh-no-gfc-coefficient-lines = ingen gfc-koefficientlinjer

engine-e-gravity-sh-read-error = læsefejl: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = linje { $lineno }: norm { $v } understøttes ikke (kun fully_normalized)

engine-gravity-sh-line-bad = linje { $lineno }: ugyldig { $what }

engine-e-gravity-sh-line-degree-above-the-declared = linje { $lineno }: grad { $n } over den angivne max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = linje { $lineno }: orden { $m } over grad { $n }

engine-e-gravity-sh-line-time-variable-term-is = linje { $lineno }: det tidsvariable led `{ $key }` understøttes ikke (kun statiske modeller)

engine-e-gravity-sh-missing-end-of-head = end_of_head mangler

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s skal være positiv, fik { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s skal være positiv, fik { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] scenariet producerer { $n } epoke (kræver ≥ 2); øg duration_s eller formindsk step_s
       *[other] scenariet producerer { $n } epoker (kræver ≥ 2); øg duration_s eller formindsk step_s
    }


## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = posten indeholder en ikke-endelig tidsfejl

engine-e-holdover-test-unknown-mask-expected-one-of = ukendt maske { $id }; forventede en af { $masks }

engine-e-holdover-test-every-budget-max-abs-te = hvert budgets max_abs_te_ns skal være endeligt og positivt

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } ligger uden for posten ({ $t0_s } til { $t_end } s på dens egen tidsakse)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } skal ligge efter gnss_removed_s ({ $gnss_removed_s }) og ikke efter postens slutning ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = holdover-trinnet indeholder ingen måling

engine-holdover-test-the-record-has-no-step = posten har intet { $step }-trin: GNSS blev fjernet ved dens første måling

engine-holdover-test-the-step-has-samples-the = { $step }-trinnet har { $te_ns } målinger; estimatorerne kræver mindst 13

engine-e-holdover-test-step-with-mask-has-no = et trin med en maske har ingen kurve

engine-e-holdover-test-cannot-read-csv-path = kan ikke læse csv_path { $path }: { $e }

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks } (MODELLED, målt mod masken)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m skal være endelig og > 0, fik { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba skal være >= 0 og coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: de to ben ligger ikke på en fælles middelværditid. Det optiske ben akkumulerer over integration_s = { $integration_s } s; RF-benets sløjfestøjbåndbredde B_L = { $dll_bandwidth_hz } Hz middelværdidannes over 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Et forhold mellem to sigma-værdier taget ved forskellige middelværditider er ikke en sammenligning, så der angives intet. Fjern tilsidesættelsen rf_dll_bandwidth_hz (den er så som standard 1/(2*integration_s)) eller sæt den til { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: et ben er ikke et brugbart positivt endeligt sigma (optisk { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), så der dannes intet forhold.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = ukendt rf_band '{ $other }' (forventede s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } skal være endelig

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db skal være endelig og >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | optisk fodaftryk { $footprint_m } m, { $detected_photons } fotoner -> afstandsmålings-σ { $c } mm, tids-σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | tilgængelighed { $c4 }% ({ $n_sites } lokalitet) | handoff uden spring { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | samlet FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | afprøvet CRLB/χ²-PL/union/handoff, modelleret σ/klimatologi
       *[other] hybrid-optical-rf | optisk fodaftryk { $footprint_m } m, { $detected_photons } fotoner -> afstandsmålings-σ { $c } mm, tids-σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | tilgængelighed { $c4 }% ({ $n_sites } lokaliteter) | handoff uden spring { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | samlet FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | afprøvet CRLB/χ²-PL/union/handoff, modelleret σ/klimatologi
    }


## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa skal ligge i [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class skal være >= 1

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | detektor { $detector } | AUC { $auc_in } inde / { $auc_out } ude (hul { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ mål { $target_pfa } | { $n_cases } tilfælde | MODELLED syntetisk

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = ukendt detektor '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = ukendt imu_grade { $other }; forventede en af navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = ukendt combination { $other }; forventede en af rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = ukendt trn_fix_mode { $other }; forventede en af none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } skal være endelig og ikke-negativ (fik { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m skal angive mindst én tærskel

engine-e-inertial-coast-crossing-thresholds-entries-must-be = crossing_thresholds_m-poster skal være endelige og positive (fik { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades skal angive mindst én IMU-klasse

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s skal være endelig og ikke-negativ (fik { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 skal være endelig og ikke-negativ (fik { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg skal være endelig og ligge inden for (-89, 89) (fik { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m skal ligge inden for [-1000, 100000] (fik { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s skal være positiv

engine-e-inertial-coast-drift-band-must-satisfy-lo = driftbåndet skal opfylde 0 < lo < hi (fik lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = serialisering af ins-trn-coast-resultat: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU, { $speed } m/s, combination { $comb } | { $heads } | TRN { $mode } spids { $peak_error_m } m over { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va afledt af fysikken bag koldatominterferometre)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = scenariet er { $toml_text } bytes, over grænsen på { $max_bytes } bytes

engine-e-inline-only-the-scenario-kind-reads-its = scenarietypen `{ $kind }` læser sine data fra filer på værten, så denne flade kører den ikke; brug `kshana`-kommandolinjen

engine-e-inline-only-the-field-names-file-this = feltet `{ $k }` angiver en fil: denne flade accepterer kun indlejret indhold

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = trace-JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = ukendt datasæt `{ $key }`; tilladte: { $v1 }, eller et brugerdefineret datasæt

engine-e-interference-map-api-dataset-is-data-but-the = datasættet `{ $key }` er { $kind }-data, men inputtypen er { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } er ikke en YYYY-MM-DD-dato

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = ukendt indstilling `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = forventede { $positionals } positionelt/positionelle argument(er), fik { $pos }

engine-e-interference-map-cli-cannot-read = kan ikke læse { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom kræver { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } findes allerede; Kshana overskriver ikke kort. Fjern den, eller vælg en anden --out-mappe

engine-interference-map-cli-note-cell-deg-is-not = bemærk: --cell-deg { $cell_deg } er ikke den præregistrerede cellestørrelse ({ $PREREGISTERED_CELL_DEG }); kortene angiver det

engine-e-interference-map-cli-cannot-create = kan ikke oprette { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = skrev { $path }: { $cells } celler publiceret, { $n_deg } markeret

engine-interference-map-cli-no-usable-rows-nothing-written = ingen brugbare rækker: intet skrevet

engine-e-interference-map-cli-unknown-subcommand = ukendt underkommando `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = den hentede fils SHA-256 ({ $got }) svarer ikke til den fastlåste værdi ({ $expected }); den blev kasseret

engine-e-interference-map-cli-cannot-write = kan ikke skrive { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl blev ikke fundet i PATH. Installér curl, eller hent { $NATURAL_EARTH_LAND_URL } selv og kontrollér, at dens SHA-256 er { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = kan ikke køre curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = skrev { $out }: Natural Earth-landpolygoner, SHA-256 verificeret (offentligt domæne, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = ingen trace_full_*-filer under { $path }

engine-e-interference-map-cli-cannot-read-2 = kan ikke læse { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } er ikke en YYYY-MM-DD-dato

engine-e-interference-map-cli-bad-map-date = { $f }: ugyldig kortdato

engine-e-interference-map-cli-cannot-write-2 = kan ikke skrive { $out }: { $e }

engine-interference-map-cli-route-length-km = rutelængde { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Forbehold: en forringet celle peger ikke på interferens som årsag; celler, der ikke er observeret, er ikke belæg for en fri rute; dette er ikke en prognose.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = landpolygoner: ugyldig JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = påkrævet kolonne `{ $name }` mangler

engine-e-interference-map-cannot-read-input = kan ikke læse input: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` er ikke en dato (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours skal være { $MIN_DELAY_HOURS } eller mere: observatoriet publicerer ikke tidligere

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg skal være { $MIN_CELL_DEG } eller grovere: observatoriet publicerer kun grove celler

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } kan ikke publiceres endnu: dens produkt frigives tidligst { $fmt_utc } ({ $delay_hours } timer efter dagens slutning)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORY  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED

engine-interference-map-observatory-source-licence = SOURCE { $dataset }  LICENCE { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (PUBLISHED CELLS)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana-observatoriet, ADS-B-kort over navigationsnøjagtighed, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = kan ikke oprette { $path } (Kshana overskriver ikke produkter): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = inputtet har ingen brugbar rapport for { $day } (fundne dage: { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } findes allerede; Kshana overskriver ikke produkter

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } celler publiceret, { $p2 } forringede, { $p3 } hændelse(r)

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } rækker afspillet igen under { $variants } varianter: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = kortet er ikke gyldig JSON: { $e }

engine-e-interference-map-route-route-invalid-json = rute: ugyldig JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = rute: linje { $v1 } er ikke `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 }-eksport. Epoke: { $epoch_note }. Bevægelige objekter: GCRS (referenceFrame INERTIAL), meter, sekunder efter epoken. Faste steder: jordfast WGS 84 (referenceFrame FIXED), meter.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Position: GCRS, meter.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Breddegrad { $lat_deg } deg, længdegrad { $lon_deg } deg, højde { $h_m } m over WGS 84-ellipsoiden. Position: jordfast, meter.

engine-interop-czml-radius-along-the-ground = { $description }. Radius { $radius_m } m langs jorden.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Uden tid: WGS 84-længdegrad og -breddegrad i grader, klemt fast til jorden.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Jordfaste positioner; en MultiLineString skæres ved antimeridianen, og times_utc angiver derefter kun de oprindelige samples.

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 }-eksport. Epoke: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = ugyldig GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString har ingen coordinates-array

engine-e-interop-geojson-an-rfc-7946-linestring-needs = en RFC 7946-LineString kræver to eller flere positioner

engine-interop-geojson-position-is-not-an-array = position { $i } er ikke en array med to eller tre tal

engine-interop-geojson-position-longitude-is-not-number = position { $i }: længdegrad er ikke et tal

engine-interop-geojson-position-latitude-is-not-number = position { $i }: breddegrad er ikke et tal

engine-e-interop-geojson-position-longitude-is-outside-180 = position { $i }: længdegrad { $lon } ligger uden for [-180, 180] (GeoJSON angiver længdegrad først)

engine-e-interop-geojson-position-latitude-is-outside-90 = position { $i }: breddegrad { $lat } ligger uden for [-90, 90] (GeoJSON angiver længdegrad først)

engine-e-interop-geojson-track-needs-two-or-more = et spor kræver to eller flere waypoints

engine-e-interop-geojson-the-route-spans-more-than = ruten spænder over mere end 180 grader længdegrad; spor-kinds trinner i almindelige grader og kan ikke krydse antimeridianen

engine-e-interop-geojson-position-is-deg-from-an = position { $worst } er { $worst2 } deg fra et jævnt fordelt, ret spor (tolerance { $tol_deg } deg); spor-kinds flyver start + i*step, så angiv jævnt fordelte positioner på en linje, eller kun de to ender

engine-e-interop-geojson-route-applies-to-the-kinds = en rute gælder for de kinds, der flyver et waypoint-spor (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` tager ikke imod noget trajektorie-input

engine-e-interop-geojson-scenario-toml-is-not-table = scenarie-TOML er ikke en tabel

engine-e-interop-geojson-cannot-serialise-scenario = kan ikke serialisere scenariet: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = ukendt eksportformat '{ $other }'; forventede et af czml, kml, geojson, stk, sigmf, all eller list

engine-e-interop-member = medlem { $label }: { $e }

engine-interop-the-scenario-could-not-be = scenariet kunne ikke eksporteres: { $m }

engine-e-interop-invalid-spectrum-scenario = ugyldigt spektrumscenarie: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } tidssample er mere, end en eksport skriver ({ $MAX_SAMPLES })
       *[other] { $n } tidssamples er mere, end en eksport skriver ({ $MAX_SAMPLES })
    }


engine-e-interop-scene-objects-samples-is-more-than = { $items } objekter x { $times } samples er mere, end en eksport skriver ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = ugyldigt { $kind }-scenarie: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type }-jammer, { $power_dbw } dBW sendeeffekt, { $gain_dbi } dBi antennegevinst

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, fra jamming-kindens linkligninger med jammeren ved modtagerens horisont og fririumstab

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (kædens [pass]-trin)

engine-interop-scene-circular-orbit-km-altitude-deg = cirkulær bane, { $altitude_km } km højde, { $inclination_deg } deg inklination (SGP4 middelelementer ved vinduets start, som passes-kinden propagerer den)

engine-interop-scene-ground-station-deg-elevation-mask = jordstation, { $mask_deg } deg elevationsmaske

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; GCRS- og jordfaste tilstande er ephemeris-kindens eget output (UT1 og polbevægelse som scenariet angiver dem)

engine-interop-scene-static-scene-the-kind-flies = statisk scene: { $kind }-kinden flyver et sted uden tid med waypoints

engine-interop-scene-true-track-flown-gps-denied = sandt spor fløjet uden GPS: { $track } waypoints fra start_lat_deg/start_lon_deg i trin af step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` har ingen scene

engine-e-interop-scene-missing-numeric = manglende numerisk `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = manglende heltal `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } ligger uden for 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } ved { $altitude_km } km, { $inclination_deg } deg inklination (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = scenariet angiver ingen `epoch`; t = 0 er { $epoch }, den tidligste epoke, som satellitternes egne data bærer (TLE-, broadcast-efemeride- eller SP3-epoke). Hver satellit propageres fra sin egen epoke, og de spænder over { $spread_h } h: tidsmærkerne følger motorens forudsætning om, at hver satellit starter ved t = 0, mens hver position roteres ind i GCRS- og jordfaste systemer ved den pågældende satellits eget tidspunkt. SP3- og OEM-eksporterne mærker i stedet t = 0 som 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = scenariet angiver ingen `epoch`; t = 0 er { $epoch }, den epoke, som satellitternes egne data bærer (TLE-, broadcast-efemeride- eller SP3-epoke). SP3- og OEM-eksporterne mærker i stedet t = 0 som 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objekter x { $times_s } samples er mere, end en eksport skriver ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = { $user_environment }-bruger, i bevægelse (kindens konstante fart og kurs)

engine-interop-scene-user-receiver = { $user_environment }-bruger (modtager)

engine-interop-scene-user-orbit-km-altitude-deg = brugerbane, { $altitude_km } km højde, { $inclination_deg } deg inklination (Kepler{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = intet bevægeligt objekt { $index }

engine-interop-stk-kshana-export-object = # Kshana { $v1 }-eksport: { $scene }, objekt { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type }-jammer, { $power_dbw } dBW sendeeffekt, { $gain_dbi } dBi antennegevinst (en parameter i scenariets linkbudget, ikke et signal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` har ingen køretøjstrajektorie at eksportere; testbænkeksporten dækker kinds gnss-ins, jamming og gnss-sim

engine-e-interop-testbench-empty-motion-csv = tom bevægelses-CSV

engine-e-interop-testbench-motion-csv-header-is-not = bevægelses-CSV'ens header er ikke de forventede kolonner: { $head }

engine-e-interop-testbench-row-fields-expected = række { $v1 }: { $f } felter, forventede { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = række { $v1 }: kolonne { $motion_columns } er ikke et tal

engine-e-interop-testbench-line-no = linje { $v1 }: ingen `$`

engine-e-interop-testbench-line-no-checksum = linje { $v1 }: ingen kontrolsum

engine-e-interop-testbench-line-bad-checksum-field = linje { $v1 }: ugyldigt kontrolsumfelt

engine-e-interop-testbench-line-checksum-mismatch = linje { $v1 }: kontrolsum stemmer ikke

engine-e-interop-testbench-line-short-gga = linje { $v1 }: for kort GGA

engine-interop-testbench-line-bad-latitude = linje { $v1 }: ugyldig breddegrad

engine-interop-testbench-line-bad-longitude = linje { $v1 }: ugyldig længdegrad

engine-e-interop-testbench-line-bad-altitude = linje { $v1 }: ugyldig højde

engine-e-interop-testbench-line-bad-separation = linje { $v1 }: ugyldig separation

engine-e-interop-testbench-line-short-rmc = linje { $v1 }: for kort RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = linje { $v1 }: RMC uden forudgående GGA

engine-e-interop-testbench-line-gga-and-rmc-times = linje { $v1 }: GGA- og RMC-tider er forskellige

engine-e-interop-testbench-line-bad-speed = linje { $v1 }: ugyldig fart

engine-e-interop-testbench-line-bad-course = linje { $v1 }: ugyldig kurs

engine-e-interop-testbench-line-bad-time-or-date = linje { $v1 }: ugyldigt tidspunkt eller ugyldig dato

engine-e-interop-testbench-gga-with-no-following-rmc = en GGA uden efterfølgende RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = en waypoint-fil kræver mindst to samples

engine-e-interop-testbench-the-sample-step-is-not = sampletrinnet { $step } s er ikke et helt antal millisekunder

engine-e-interop-testbench-the-samples-are-not-equally = samplene er ikke jævnt fordelt: interval { $v1 } er { $dt } s, det første er { $step } s

engine-e-interop-testbench-empty-waypoint-file = tom waypoint-fil

engine-e-interop-testbench-waypoint-not-three-numbers = waypoint { $v1 }: ikke tre tal

engine-e-interop-testbench-waypoint-fields-expected = waypoint { $v1 }: { $f } felter, forventede 3

engine-e-interop-testbench-events-csv-header-is-not = hændelses-CSV'ens header er ikke label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = hændelsesrække { $v1 }: forventede 5 felter

engine-e-interop-testbench-event-row-unknown-kind = hændelsesrække { $v1 }: ukendt kind { $f }

engine-e-interop-testbench-event-row-bad-onset = hændelsesrække { $v1 }: ugyldig start

engine-e-interop-testbench-event-row-bad-end = hændelsesrække { $v1 }: ugyldig slutning

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

engine-e-ionex-bad-number-in = { $what }: ugyldigt tal i { $col }

engine-e-ionex-two-digit-year = { $what }: tocifret år { $year }

engine-e-ionex-no-end-of-header = ingen END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = højdeafhængige (3D) IONEX-kort understøttes ikke

engine-e-ionex-zero-grid-step = gridtrin på nul

engine-e-ionex-grid-needs-at-least-nodes = et grid kræver mindst 2 x 2 knuder

engine-e-ionex-map-no = kort { $index }: ingen { $end_label }

engine-e-ionex-map-band-latitude-header-grid = kort { $index }: bånd { $band } breddegrad { $band_lat }, headergrid { $want }

engine-e-ionex-map-band-longitudes-differ = kort { $index }: bånd { $band } længdegrader er forskellige

engine-e-ionex-map-band-truncated = kort { $index }: bånd { $band } afkortet

engine-e-ionex-map-bands-header-grid-has = kort { $index }: { $band } bånd, headergrid har { $n_lat }

engine-e-ionex-map-no-epoch-of-current = kort { $index }: ingen EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } TEC-kort, header # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = TEC-kortenes epoker er ikke stigende

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz rummer ikke et helt antal samples pr. { $code }-periode ({ $spc } samples)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods og noncoherent skal være positive

engine-e-iq-acq-stream-ended-after-of-samples = strømmen sluttede efter { $got } af { $needed } samples

engine-e-iq-acq-cfar-reference-cells-must-be = CFAR-referenceceller skal være lige og mindst 2 (fik { $n })

engine-e-iq-acq-cfar-stride-must-be-at = CFAR-skridtet skal være mindst 1 lag

engine-e-iq-acq-cfar-per-cell-pfa-must = CFAR-Pfa pr. celle skal ligge i (0, 1) (fik { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = CFAR-vinduet rækker { $reach } lag til hver side, for bredt til en periode på { $samples_per_period } lag

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = ukendt overfladeformat { $s }: forventede csv, json eller bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = overfladen ville rumme { $spc_cells } celler (grænse { $MAX_SURFACE_CELLS }): gør Doppler-trinnet bredere eller Doppler-området smallere

engine-e-iq-acq-surface-surface-header = overfladeheader: { $e }

engine-e-iq-acq-surface-surface-schema-expected = overfladeskema { $schema }; forventede { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = overfladeindhold: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = optagelse '{ $id }': format og sample_rate_hz skal angives sammen

engine-e-iq-campaign-conditions-test-conditions-json = testbetingelser (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = testbetingelser (TOML): { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf kræver en SigMF-optagelse (fik { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF-metadata: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF-metadata: global core:sample_rate mangler

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start mangler

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: ingen core:sample_count og ingen effektpunkter til at afslutte hændelsen

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = skemaet skal være "{ $SCHEMA }" (fik "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id må ikke være tom

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s skal være endelig og >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 skal være 64 hex-cifre

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind skal være "iq" eller "receiver-log" (fik "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = mindst én [[expected]]-gruppe er påkrævet

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids må ikke være tomme

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } angiver { $n } værdi; angiv én pr. id ({ $ids })
       *[other] { $at }: { $key } angiver { $n } værdier; angiv én pr. id ({ $ids })
    }


engine-e-iq-campaign-conditions-duplicate-id = { $at }: dubleret id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s skal ligge efter onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects skal være "all" eller en liste af ids

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: affects-id { $bad } findes ikke i [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q skal være positiv

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points må ikke være tom

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points skal stå i tidsrækkefølge

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points skal være endelige

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" kræver reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = hændelserne '{ $id }' og '{ $id2 }' overlapper på en fælles satellit

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s skal være >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s skal være positiv

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = optagelse '{ $id }': SHA-256 { $sha } stemmer ikke med den angivne { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: optagelsen rummer { $buf } samples, { $n } kræves for at opnå fangst

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s skal være positiv

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db skal være positiv

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s skal være >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz skal være positiv

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs skal være mindst 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = kampagne (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = kampagne (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions skal angive mindst én fil eller glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds skal være >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = frontend-navne skal være ikke-tomme og unikke ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' matcher ingen fil

engine-e-iq-campaign-spec-recording-id-appears-in-both = optagelses-id '{ $w }' optræder i både { $w2 } og { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names kræver inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: ingen udformning '{ $n }' i { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = referencelinje { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0-profil: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0-profil: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i }: trinværdier skal være endelige

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i }: ramp kræver end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i }: points kræver lige lange, ikke-tomme t_s og db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i }: t_s skal vokse strengt

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i }: points skal være endelige

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i }: fade s4 skal ligge i (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i }: fade tau_s skal være positiv

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: optagelsen rummer { $samples } samples, { $need } kræves til denne søgning

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: angiv formatet med --surface-format csv|json|bin, eller lad stien ende på .csv, .json eller .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = fangst: { $fs_hz } Hz, { $coherent_periods } kohærent(e) periode(r) x { $noncoherent } ikke-kohærent, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = rapport genopbygget: { $cells_present } af { $cells_total } celle(r), { $rows } række(r), { $rows_failed } under en tærskel; digest { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    kampagne { $name }: { $cells_total } celle(r); { $cells_skipped } allerede færdige, { $cells_run } kørt nu, { $cells_failed } mislykkedes, { $cells_pending } afventer
    output: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    første fejl ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: { $events } hændelse(r), { $tc } forventet(e) satellit(ter); betingelseshash { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono skrå { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono lodret { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scint S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = multipath { $h }m { $multipath_ground } jord

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground skal være dry, wet eller sea (fik { $other })

engine-e-iq-cli-channel-give-at-most-one-of = angiv højst én af --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass kræver lo,hi (fik { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass kræver lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } med overgang { $transition } Hz passer ikke under fs/2 ({ $v1 } Hz); gør båndet eller overgangen smallere

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits skal være 1..=16 (fik { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = filtrerede { $total } samples ({ $fs_hz } Hz) til { $out } ({ $format }); sidecar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = kan ikke læse { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = ugyldigt labfit-scenarie: { $e }

engine-iq-cli-labfit-fitted-run-wrote = tilpassede { $runs } kørsel/kørsler; skrev { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = tilpassede { $fit_units } enhed(er) fra kampagne; skrev { $written }

engine-iq-cli-labfit-cannot-write = kan ikke skrive { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } kræver en værdi

engine-e-iq-cli-cannot-parse = { $k }: kan ikke fortolke { $v }

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } tager { $n } positionelt argument, fik { $pos }
       *[other] iq { $cmd } tager { $n } positionelle argumenter, fik { $pos }
    }


engine-e-iq-cli-cannot-parse-2 = { $k }: kan ikke fortolke { $p }

engine-iq-cli-unknown-iq-processing-command-expected = ukendt iq-behandlingskommando { $other }; forventede scene, acquire, track, sweep, labfit, frontend, monitor, campaign eller conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } er uden for området for GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = ingen sund GPS-efemeride fundet for de ønskede PRN'er

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos kræver lat,lon,alt (fik { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; C/N0-profil ({ $segments } segment(er))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format skal være csv eller jsonl (fik { $other })

engine-iq-cli-scene-written-by-kshana-iq-scene = skrevet af kshana iq scene: en SIMULERET scene, ikke en optagelse

engine-iq-cli-scene-ion-sdr-metadata = ION SDR-metadata { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF-data { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = skrevet af kshana iq scene

engine-iq-cli-scene-wrote-samples-hz-to-truth = skrev { $samples } samples ({ $format }, { $fs_hz } Hz) til { $data_path }; { $truth_records } referenceposter til { $truth_path }; { $meta_note }; kanal: { $chan_desc }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } kan ikke kombineres med --design: sweep kører hver udformning i filen

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = sløjfeudformnings-sweep: { $rows } (udformning, PRN) resultat(er){ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: optagelsen rummer { $samples } samples, { $need } kræves for at opnå fangst

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: ikke fanget (statistik { $statistic } < tærskel { $threshold }); hæv --doppler-max, --acq-coherent eller --acq-noncoherent, eller kontrollér optagelsen

engine-iq-cli-track-designs-and-differ-in-integration = udformningerne { $first } og { $d } er forskellige i integration.extra_taps_chips; udformningerne i én kørsel skal være ens, så hver outputpost har de samme kolonner

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: angiv formatet med --epochs-format csv|jsonl|bin, eller lad stien ende på .csv, .jsonl eller .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz er { $r } samples pr. chip af { $c }: kommensurabel sampling gør kodediskriminatoren til en trappe (ved 2 samples/chip dirrer DLL'en, omkring { $lit_0_09 } chip RMS-kodefejl ved 45 dB-Hz); kodesløjfens jitter og bias fra denne optagelse er ikke repræsentative. Brug en rate, der ikke er et multiplum af halvdelen af chiprate, for at bedømme kodesløjfer.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = arbejderen afsluttede, før dette input blev behandlet

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = ukendt indstilling { $s }

engine-e-iq-io-cli-format-needs-rate = --format kræver --rate

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } tager { $n } stiargument, fik { $pos }
       *[other] iq { $cmd } tager { $n } stiargumenter, fik { $pos }
    }


engine-iq-io-cli-unknown-iq-command = ukendt iq-kommando { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] skrev { $n } sample ({ $to }, { $fs_hz } Hz) til { $files }; { $w } mættet(e) element(er){ $v4 }
       *[other] skrev { $n } samples ({ $to }, { $fs_hz } Hz) til { $files }; { $w } mættet(e) element(er){ $v4 }
    }


## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow læser kun enkeltkanals-optagelser

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow læser en optagelse med én capture, denne har { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: ingen positiv core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: capturen starter ikke ved en bytegrænse

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = ukendt sampleformat { $name }: forventede f.eks. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, evt. med endelsen _qi for kompleks

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sidecar sample_rate_hz { $sample_rate_hz } er ikke positiv

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: .sdrx-optagelser rummer én strøm; kanal { $channel } findes ikke

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: rå fil uden sidecar; angiv dens format, eller skriv { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = kan ikke serialisere rækken: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = ugyldig filterudformning { $design }: passband_frac i (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz skal ligge strengt mellem 0 og halvdelen af samplerate ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx-data: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-bit { $enc } { $fmt } ({ $packed_bits } bits/sample)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = ikke understøttet SigMF core:datatype { $datatype }: understøttede er ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be og de reelle ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } er ikke en SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = ugyldig SigMF-metadata: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } har ingen SigMF core:datatype; skriv den som raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } stemmer ikke med den første optagelses { $c0 }

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: ingen core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } er ikke positiv

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } ved { $rate } Hz stemmer ikke med den første optagelses { $f0 } ved { $r0 } Hz

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name }: capture ved sample { $sample_start } er i forkert rækkefølge eller ligger uden for det eneste sample i dataene ({ $n_file })
       *[other] { $name }: capture ved sample { $sample_start } er i forkert rækkefølge eller ligger uden for de { $n_file } samples i dataene
    }


engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: første capture starter ikke ved en bytegrænse

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = kanal { $channel } ønsket; optagelsen har { $channels } (kanaler tælles fra 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = ugyldig SigMF-collection: { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } stemmer ikke med collectionens { $h }

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = strøm { $select } af { $channels } sammenflettede strømme findes ikke (strømme tælles fra 0)

engine-e-iq-io-stream-sample-of-does-not-start = sample { $k } af { $format } starter ikke ved en bytegrænse

engine-e-iq-io-stream-time-window-start-duration-both = tidsvindue start { $start_s } s, varighed { $duration_s } s: begge skal være ikke-negative

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = mest skadelige angivne Q (cw): ingen tabelværdi for typen `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: kampagnen er ikke komplet

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } stemmer ikke med cellerne ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = optagelse `{ $id }`: testbetingelsernes hash { $h } stemmer ikke med den registrerede { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signal `{ $signal }`: ukendt chiprate

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = ingen kørsel kan bruges til låsetilpasningen: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = utilstrækkelige data: ikke tilpasset ({ $m } optagelser; mindst { $min_rec } kræves)

engine-iq-labfit-iqfit-uncensored-span-db-is-under = ucensureret J/S-spændvidde { $span_db } dB er under { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff og delta kan ikke identificeres hver for sig (|corr| { $full } >= { $v2 }): modellen afhænger kun af delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] ikke tilpasset: { $n_reacq } genfangst observeret (mindst 3 kræves)
       *[other] ikke tilpasset: { $n_reacq } genfangster observeret (mindst 3 kræves)
    }


engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = ukendt mode `{ $m }` (kun `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage skal være [lower, upper] inden for [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds skal være [lower, upper] med 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db skal være [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = kampagnen har ingen hændelse med en angivet effektprofil at tilpasse

## src/iq/labfit/iqreport.rs

# legal: native review
engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Laboratorietilpasning fra IQ-kampagne: { $r }

    Skema `{ $schema }`, motor { $engine_version }. Label: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = Kampagne-DIGEST `{ $campaign_digest }`; `campaign.json` SHA-256 `{ $campaign_json_sha256 }`; scenarie-SHA-256 `{ $scenario_sha256 }`; { $cells } celler; { $bootstrap } bootstrap-replikater (seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Enhed { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Status: { $status }. { $recordings } optagelser, { $satellites } satellitter, { $events } hændelser; { $bins_used } bins tilpasset, { $bins_censored } censureret.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0-model ({ $q_mode }): `delta_eff` = { $ci } dB (den identificerbare forskydning, henført til Q = 1); `Q_eff` = { $q }; `delta` ved dette Q = { $ci2 } dB; corr(Q, delta) { $om }; residual-RMS { $residual_rms_db } dB over en J/S-spændvidde på { $span_db } dB. Q_eff kan ikke identificeres ud fra C/N0-data uden en uafhængig effektmåling.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q holdt ved sin angivne værdi: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = Tærskel-J/S, direkte: median { $om } dB over { $n } tab (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Tilbageholdt datasæt (udelad én optagelse ad gangen), interpolation: { $bins } bins, C/N0-RMS { $om } dB, PI90-dækning { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = { $model }: hændelser { $n }, tabstids-RMS { $om } s, PI90-dækning { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    Valideringstabel SHA-256 `{ $table_sha256 }` (registreret { $registered }):

    | tærskel | grænse | værdi | afgørelse |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = kørsel `{ $label }` log

engine-e-iq-labfit-run = kørsel `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = scenariets [input] angiver ingen kampagne

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign og [[runs]] udelukker hinanden: angiv det ene

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit-scenarie: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = loggen indeholder ingen C/N0 pr. satellit{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = ingen epoke før starten ved { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = ingen epoke ved eller efter starten ved { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Laboratorietilpasning: { $r }

    Label: **{ $label }**. Indstillinger SHA-256 `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } C/N0-sample, residual-RMS { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } C/N0-samples, residual-RMS { $om } dB.{ $r }{ "\u000A" }
    }


engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Model: { $model } ({ $label })

    | parameter | værdi | grænser | ved grænse | bootstrap-sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one]
            { "\u000A" }Hændelsestids-RMS { $om } s over { $n_events } hændelse; tab ikke fundet { $loss_missed } / ekstra { $loss_extra }, genfangster ikke fundet { $reacq_missed } / ekstra { $reacq_extra }.

            | kørsel | fald dB-Hz | genlåsning dB-Hz | hændelser | RMS s |
            |---|---|---|---|---|{ "\u000A" }
       *[other]
            { "\u000A" }Hændelsestids-RMS { $om } s over { $n_events } hændelser; tab ikke fundet { $loss_missed } / ekstra { $loss_extra }, genfangster ikke fundet { $reacq_missed } / ekstra { $reacq_extra }.

            | kørsel | fald dB-Hz | genlåsning dB-Hz | hændelser | RMS s |
            |---|---|---|---|---|{ "\u000A" }
    }


engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Tilbageholdt datasæt ({ $scheme }, { $folds } folds): alle { $om } s, interpolation { $om2 } s, ekstrapolation { $om3 } s.

    | tilbageholdt kørsel | klasse | afstand | nærmeste træningskørsel | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } er reserveret til fremtidig brug (kun FID 0 er defineret)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } ligger uden for 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } SB1-symbol(er) afviger fra det afkodede felt

engine-iq-lunanet-afs-frames-at-and-are-symbols = frames ved { $w } og { $w2 } ligger { $gap } symboler fra hinanden, ikke { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } følger efter TOI { $w2 }, forventede { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = uventet tegn { $c } i en symbolstrøm (kun 0, 1 og blanktegn)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: de første 24 chips er forskellige

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: de sidste 24 chips er forskellige

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (dokumentet angiver A14850 for både PRN 147 og PRN 151; generatoren gengiver PRN 151's, så posten for PRN 147 er højst sandsynligt en trykfejl i dokumentet)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = kodet 0x{ $word }, afkodet FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = monitorindstillinger: { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = statisk position er ikke endelig

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = trajektorie med konstant hastighed er ikke endelig

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = waypoint-trajektorie har ingen waypoints

engine-e-iq-scene-geometry-waypoint-not-finite = waypoint er ikke endeligt

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = waypoint-tider skal vokse strengt

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } er ikke en GPS C/A-PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = efemeridesystem { $system } er ikke GPS

engine-e-iq-scene-satellite = satellit { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = er en pilotkomponent (uden data) og bærer ingen navigationsdata

engine-e-iq-scene-nav-carries-data-the-scene-does = bærer data, som scenen ikke modellerer; generér det uden data

engine-e-iq-scene-nav-does-not-carry-gps-lnav = bærer ikke GPS LNAV (kun GPS L1 C/A gør); brug seedede data

engine-e-iq-scene-nav-not-an-lnav-source = ikke en LNAV-kilde

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = en scene kræver mindst én satellit (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler angiver { $dopplers } værdi(er); angiv én pr. --prn ({ $ids }) eller en enkelt værdi

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = referencerække har { $f } felter, forventede 10

engine-e-iq-scene-truth-truth-field = referencefelt { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = reference sat_id: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz skal være et positivt tal

engine-e-iq-short-duration-must-be-in = duration_s skal ligge i (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids skal rumme 1 til { $MAX_SATELLITES } satellitter

engine-e-iq-short-dopplers-must-be-finite = dopplers skal være endelige

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] { $n } sample ønsket; en kort kørsel rummer højst { $MAX_SAMPLES }
       *[other] { $n } samples ønsket; en kort kørsel rummer højst { $MAX_SAMPLES }
    }


## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C data PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C pilot PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } er uden for området

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF-frekvenskanal { $id } ligger uden for -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = ukendt signal { $other }; forventede et af: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = linje { $v1 }: ingen ';'

engine-e-iq-signals-galileo-line-no-code-number-in = linje { $v1 }: intet kodenummer i { $label }

engine-e-iq-signals-galileo-code-appears-twice = kode { $number } optræder to gange

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path }: { $n } kode, ICD'en definerer { $CODES_PER_COMPONENT }
       *[other] { $path }: { $n } koder, ICD'en definerer { $CODES_PER_COMPONENT }
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

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primær { $primary_prn } S{ $secondary } (tertiær udeladt)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = tegn uden for hex { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } hex-symboler kan ikke rumme præcis { $len } chips

engine-iq-signals-primary-only = { $name } (kun primær)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC-sporing kræver en early-late-afstand i (0, { $max }) chips, så E og L bliver på hovedtoppen (fik { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = bump-jump-tærsklen skal være mindst 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = samplingsraten skal være positiv

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods skal være positiv

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows skal være positiv

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } skal gå op i bitlængden { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = højst { $MAX_EXTRA_TAPS } ekstra taps understøttes (fik { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = forskydninger for ekstra taps skal være endelige og inden for ±{ $MAX_TAP_OFFSET_CHIPS } chips (fik { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = et C/N0-vindue kræver mindst 2 prompts

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: forventede atan2, costas-atan eller costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: forventede cross-product, atan2 eller atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: forventede pull-in eller always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: forventede eml-power, dot-product eller eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: forventede pll, fll eller fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } gælder ikke for carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: forventede et tal >= 0 (0 slår begrænsningen fra)

engine-e-iq-track-design-must-be-positive-number-got = { $k } skal være et positivt tal (fik { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods skal være mindst 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips skal ligge i (0, 2] (fik { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips rummer højst { $MAX_EXTRA_TAPS } forskydninger (fik { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = forskydninger i integration.extra_taps_chips skal være endelige og inden for ±{ $MAX_TAP_OFFSET_CHIPS } chips (fik { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) skal ligge under carrier.fll_off_pli ({ $off }), begge i (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s skal være nul eller positiv (fik { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s skal være positiv (fik { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order skal være 1, 2 eller 3 (fik { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order skal være 1 eller 2 (fik { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order skal være 1 eller 2 (fik { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold skal ligge i [-1, 1] (fik { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows skal være mindst 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods skal være mindst 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) må ikke ligge under lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db skal være endelig

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes skal være mindst 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods skal være mindst 1 (eller "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent skal være mindst 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa skal ligge i (0, 1) (fik { $pfa })

engine-e-iq-track-design-design-overrides = overskrivninger af udformningen: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = overskrivninger af udformningen må ikke sætte name eller extends

engine-e-iq-track-design-loop-design-file = loop-udformningsfil: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = loop-udformningsfil: skemaet { $other } understøttes ikke; forventede { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = loop-udformningsfil: schema = { $SCHEMA } mangler

engine-e-iq-track-design-loop-design-file-no-design = loop-udformningsfil: ingen [[design]]-tabeller

engine-e-iq-track-design-loop-design-file-design-number = loop-udformningsfil: [[design]] nummer { $v1 } har intet navn

engine-e-iq-track-design-loop-design-file-design-name = loop-udformningsfil: udformningens navn { $name } er reserveret eller tomt

engine-e-iq-track-design-loop-design-file-design-is = loop-udformningsfil: udformningen { $name } er defineret to gange

engine-e-iq-track-design-no-design-named-the-file = ingen udformning ved navn { $n }; filen indeholder { $value }

engine-e-iq-track-design-loop-design-file-design-extends = loop-udformningsfil: udformningen { $name } udvider sig selv (en cyklus)

engine-e-iq-track-design-loop-design-file-design-extends-2 = loop-udformningsfil: udformningen { $name } udvider den ukendte udformning { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = en faseløkke kræver orden 1..=3 og Bn > 0 (fik { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = en frekvensløkke kræver Bn > 0 (fik { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = ordenen af en frekvensløkke skal være 1 eller 2 (fik { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = et løkkefilter kræver en fasesti, en frekvenssti eller begge

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = early-late-afstanden skal ligge i (0, 2] chips (fik { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = DLL-ordenen skal være 1 eller 2 (fik { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = chiprate og bærefrekvens skal være positive

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = en epoke bærer { $extra } ekstra taps, men outputtet er sat op til { $n }: alle kanaler i en kørsel skal bruge samme extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = en post er { $b } bytes; forventede { $want }

engine-e-iq-track-sink-unknown-lock-state-code = ukendt kode for låsetilstand { $b }

engine-e-iq-track-sink-epoch-file-header = header i epokefil: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = epokefilens skema { $schema }; forventede { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = posterne i epokefilen er { $record_bytes } bytes; denne læser forventer { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } pr. ekstra tap)

engine-e-iq-track-sink-epoch-file-ends-inside-record = epokefilen slutter midt i en post ({ $got } af { $size } bytes)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = epokeformat { $o }: forventede csv, jsonl eller bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` er ikke et tal

engine-e-jammertest-cli-is-not-utf-text = { $path } er ikke UTF-8-tekst

engine-e-jammertest-cli-needs-catalog = kræver --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = kræver mindst én --plan

engine-e-jammertest-cli-is-not-utf = { $cat } er ikke UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } er ikke UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` er ikke en af ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` er ikke UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = kræver --log-start eller --log med --format

engine-e-jammertest-cli-log-needs-format = --log kræver --format

engine-e-jammertest-cli-the-log-does-not-state = loggen angiver ikke sin starttid: brug --log-start

engine-e-jammertest-cli-the-log-states-its-start = loggen angiver sin start som `{ $label }`: brug --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } er ikke UTF-8

engine-e-jammertest-cli-cannot-write = kan ikke skrive { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } { $SCHEDULED_TRUTH }-hændelser skrevet til { $o } ({ $skipped_non_rf } ikke-RF-slots sprunget over, { $outside_log } uden for loggen, { $unknown_ids } id'er ikke i kataloget)

engine-jammertest-cli-note-ids-not-in-the = bemærk: id'er ikke i kataloget: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = bemærk: det er planens planlagte slots, ikke optagne tider på luften.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  testnavn

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } test, { $evaluable } kan vurderes: { $detected } registreret inden for tolerancen, { $late } sene, { $missed } mistet; median for latens { $fmt_opt }, median for tid til genopretning { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = falske alarmer uden for alle slots: { $false_alarm_runs } kørsler, { $false_alarm_epochs } af { $clean_epochs } rene epoker

engine-e-jammertest-cli-needs-session-path = kræver en sessionssti

engine-e-jammertest-cli-needs-catalog-and-plan-or = kræver --catalog og --plan, eller --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = bevispakke skrevet til { $out }; underskrivers fingeraftryk { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = ingen mappe med en scenario.json og en .ubx under { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = scenarie: { $e }

engine-e-jammertest-dataset-read = læsning: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json har ingen dato

engine-e-jammertest-dataset-scenario-json-date-is-not = scenario.json-datoen `{ $date }` er ikke en dato

engine-e-jammertest-dataset-no-readable-epoch-in-mon = ingen læsbar epoke i mon_rf.csv eller rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = ingen mappe med en scenario.json under { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } genoprettet ({ $recovered } af { $alarmed }), median { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = loggen angiver sin start som `{ $l }`, hvilket ikke er UTC ISO-8601: angiv starten eksplicit

engine-e-jammertest-the-log-does-not-state = loggen angiver ikke sin starttid: angiv den eksplicit

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = kataloget er ikke JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = kataloget har ingen `test_types`-array

engine-e-jammertest-plan-test-type-has-no-type = en testtype har ingen `type_id`

engine-e-jammertest-plan-test-group-has-no-group = en testgruppe har ingen `group_id`

engine-e-jammertest-plan-test-has-no-test-id = en test har ingen `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = kataloget opregner ingen tests

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` er ikke et plantidspunkt som 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = planen er ikke JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = planen har ingen `locations`-array

engine-e-jammertest-plan-test-end-time-is-not = test { $id }: end_time ligger ikke efter start_time

engine-e-jammertest-plan-the-plan-has-no-test = planen har intet testområde { $l }; den har { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = planen har flere testområder { $areas }; angiv hvilket af dem loggen blev optaget i

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json er ikke JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = ingen `attack_log`-array

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024 test { $id } vindue { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log indeholder intet start-/slutvindue

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } planlagte hændelser, men kørslen bedømte { $events2 }: giv kørslens egne hændelser

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s skal være positiv og guard_s ikke negativ

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m skal opregne mindst ét element

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m skal være endelig

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: forventede "null-steering" eller "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz skal være positiv (fik { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: sektionen kræver en [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) skal være endelig og ligge på eller over tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s skal være endelig og ikke-negativ (fik { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits skal være 1 til 16 (fik { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz skal være positiv (fik { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side skal være mindst 2 (fik { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } skal være endelig (fik { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } skal være positiv (fik { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: profilpunkt { $points } ({ $lat }, { $lon }) ligger uden for DEM-fliesen

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: profilpunkt { $points } ({ $lat }, { $lon }) ligger på et DEM-hul

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC-kalenderdato uden for intervallet: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = ingen sådan kalenderdato: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC-sekund { $second } uden for intervallet ved { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = en opsendelsesplads ved polen har ingen defineret azimut

engine-e-launch-inclination-unreachable-from-latitude-without = inklinationen { $inclination_rad }° kan ikke nås fra breddegraden { $lat_rad }° uden et dogleg (kræver |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = hastigheden for en plads ved den sande pol kræver både `epoch` og `eop_finals2000a` (en ægte IERS finals2000A-krop)

engine-e-launch-site-lon-deg-must-be = site_lon_deg skal være i [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a indeholdt ingen læsbare IERS finals2000A-rækker

engine-e-launch-epoch-mjd-is-outside-the = epoke { $epoch } (MJD { $mjd_utc }) ligger uden for de leverede EOP-rækker (MJD { $mjd } til { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg skal være i [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg skal være i [0, 180]

engine-launch-launch-window-lat-az-asc = opsendelsesvindue: bredde { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° stigende, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s bonus fra jordrotationen, { $opportunities } muligheder/dag (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = hver afstandshastighed kræver en positiv, endelig sigma

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one]
            { $n ->
                [one] { $n_meas } måling kan ikke løse { $n } Doppler-ubekendt
               *[other] { $n_meas } måling kan ikke løse { $n } Doppler-ubekendte
            }
       *[other]
            { $n ->
                [one] { $n_meas } målinger kan ikke løse { $n } Doppler-ubekendt
               *[other] { $n_meas } målinger kan ikke løse { $n } Doppler-ubekendte
            }
    }


engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = Doppler-geometrien er singulær

engine-e-leo-fusion-doppler-no-covariance = ingen kovarians

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = hver pseudoafstand kræver en positiv, endelig sigma

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    { $n ->
        [one]
            { $n_clock ->
                [one] { $obs } pseudoafstande kan ikke løse { $n } ubekendt (3 position + { $n_clock } ur)
               *[other] { $obs } pseudoafstande kan ikke løse { $n } ubekendt (3 position + { $n_clock } ure)
            }
       *[other]
            { $n_clock ->
                [one] { $obs } pseudoafstande kan ikke løse { $n } ubekendte (3 position + { $n_clock } ur)
               *[other] { $obs } pseudoafstande kan ikke løse { $n } ubekendte (3 position + { $n_clock } ure)
            }
    }


engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = en satellit falder sammen med positionsestimatet

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = geometrien er singulær

engine-e-leo-fusion-joint-pvt-no-iteration-ran = ingen iteration kørte

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = degenereret slutgeometri

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP er ikke endelig

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } skal være positiv

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m skal være ikke-negativ og kørslen højst 5000 epoker

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = hvert signal kræver en positiv båndbredde

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] 5G NTN-positionsbestemmelse ved { $r } MHz, C/N0 { $r2 } til { $r3 } dB-Hz, { $n_satellites } satellit ({ $mean_in_view } i sigte){ "\u000A" }
       *[other] 5G NTN-positionsbestemmelse ved { $r } MHz, C/N0 { $r2 } til { $r3 } dB-Hz, { $n_satellites } satellitter ({ $mean_in_view } i sigte){ "\u000A" }
    }


engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, CRB-afstand { $range_sigma_zenith_m } til { $range_sigma_mask_m } m; median for formel 3D { $s2 } m, RMS-fejl { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }Doppler-passage med én satellit: { $n_obs } sample over { $duration_s } s, vandret fejl { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }Doppler-passage med én satellit: { $n_obs } samples over { $duration_s } s, vandret fejl { $horizontal_error_m } m{ "\u000A" }
    }


engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP kræver mindst ét system

engine-e-leo-fusion-ppp-duration-and-step-must-be = varighed og trin skal være positive med højst 20000 epoker

engine-e-leo-fusion-ppp-runs-must-be-to-200 = antal kørsler skal være 1 til 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = konvergenstærskler skal være positive

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] PPP-konvergens til { $criterion_horizontal_m } m vandret / { $criterion_vertical_m } m lodret, { $runs_per_case } kørsler pr. tilfælde, { $n_gnss } GNSS-satellit{ "\u000A" }
       *[other] PPP-konvergens til { $criterion_horizontal_m } m vandret / { $criterion_vertical_m } m lodret, { $runs_per_case } kørsler pr. tilfælde, { $n_gnss } GNSS-satellitter{ "\u000A" }
    }


engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  median { $c } min  konvergeret { $v4 }%  NEES-middel { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = median for vandret fejl over { $runs_per_case } kørsler · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = forudindstilling { $id } har intet signal

engine-e-leo-fusion-presets-preset-has-no-signal-it = forudindstilling { $id } har intet signal { $n }; den har { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = ukendt LEO-forudindstilling { $id }; kendte: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s og step_s skal være positive med højst 20000 epoker

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = polære trin skal være positive

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode skal være doppler, joint, polar eller timing; fik { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = doppler-tilstand kræver mindst ét LEO-system

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = timing-tilstand kræver et LEO-system med kodeafstandsmåling

engine-e-leo-fusion-pvt-kind-unknown-clock-class = ukendt urklasse { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) ved { $user_lat_deg }, { $user_lon_deg } over { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } sats i { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one]
            { $n_sats ->
                [one] { "  " }Doppler-positionsbestemmelse: { $n_obs } måling fra { $n_sats } satellit, 3D-fejl { $error_3d_m } m (vandret { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }Doppler-positionsbestemmelse: { $n_obs } måling fra { $n_sats } satellitter, 3D-fejl { $error_3d_m } m (vandret { $horizontal_error_m } m){ "\u000A" }
            }
       *[other]
            { $n_sats ->
                [one] { "  " }Doppler-positionsbestemmelse: { $n_obs } målinger fra { $n_sats } satellit, 3D-fejl { $error_3d_m } m (vandret { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }Doppler-positionsbestemmelse: { $n_obs } målinger fra { $n_sats } satellitter, 3D-fejl { $error_3d_m } m (vandret { $horizontal_error_m } m){ "\u000A" }
            }
    }


engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }vindue { $window_s } s: { $n_sats } sats, 3D-fejl { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } passage lige overhead: maks. Doppler { $max_doppler_hz } Hz, rate { $max_doppler_rate_hz_s } Hz/s, ryk { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }LEO-satellit til afstandsmåling i sigte i { $v1 }% af epokerne{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } tilgængelighed { $availability }, median for PDOP { $f }, RMS 3D-fejl { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }bredde { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } fusioneret { $f3 }; i sigte { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, maks. { $row3 } ns (i sigte { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — tilstanden { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = system { $name }: role skal være gnss eller leo, fik { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = system { $name }: clock skal være estimated eller known, fik { $c }

engine-e-leo-fusion-system-system-must-be-positive = system { $name }: { $what } skal være positiv

engine-e-leo-fusion-system-system-mask-deg-must-be = system { $name }: mask_deg skal være i [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = system { $name }: sigma_pr_m skal være positiv

engine-e-leo-fusion-system-give-at-least-one-system = angiv mindst ét [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = epokeafstanden skal være positiv

engine-e-leo-fusion-timing-no-epochs = ingen epoker

engine-e-leo-fusion-timing-no-satellite-was-ever-in = ingen satellit var nogensinde i sigte: modtageren fik aldrig tid

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polarisationen skal være rhcp, lhcp eller linear; fik '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4-fejlkode { $code } ved t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = en bane med inklination { $inc } deg passerer aldrig over breddegraden { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = den ønskede maksimale elevation ligger under horisontens rækkevidde

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = bygningsklassen skal være traditional eller thermally-efficient; fik '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = feltet { $name } er ikke endeligt

engine-e-leo-navmsg-codec-field-is-outside-its-bit = feltet { $name } = { $value } { $unit } ligger uden for sit { $bits }-bit-interval (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = meddelelsen er afkortet

engine-e-leo-navmsg-codec-field-list-exhausted = feltlisten er opbrugt

engine-e-leo-navmsg-codec-field-order-mismatch-vs = uoverensstemmelse i feltrækkefølge: { $name } mod { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID skal være 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = hvert korrektionspolynomium kræver 1-8 koefficienter

engine-e-leo-navmsg-codec-correction-time-scale-must-be = korrektionens tidsskala skal være en potens af to fra 1 s til 32768 s; fik { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = ECEF-polynomium kræver 1-11 koefficienter, lige mange pr. akse

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = ECEF-polynomiets grad { $v1 } overstiger 10

engine-e-leo-navmsg-codec-unknown-model-id = ukendt model-id { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = nyttelasten overstiger 4095 bytes

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = rammen er kortere end header og CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = ugyldig præambel 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = version { $version } understøttes ikke

engine-e-leo-navmsg-codec-frame-length-does-not-match = rammelængden { $frame } svarer ikke til den angivne nyttelast på { $len } bytes

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q-uoverensstemmelse: beregnet 0x{ $crc }, rammen bærer 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees skal hver være højst 7; fik { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree skal være 1-10; fik { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = ukendt efemeridemodel '{ $other }': brug kepler16, kepler-rac, liu22 eller ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = tilpasningsintervallet skal være mindst 10 s; fik { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = tilpasningsvinduet [{ $t0 }, { $v1 }] s ligger uden for referencebuen [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = ECEF-polynomiets tilpasning er singulær (for få samples til graden)

engine-e-leo-navmsg-fit-clock-fit-is-singular = urtilpasningen er singulær

engine-e-leo-navmsg-fit-keplerian-fit-diverged = den keplerske tilpasning divergerede

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = ukendt forudindstilling '{ $k }'; tilgængelige: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s skal være 10-3600 s og update_period_s i (0, fit_interval_s]; fik { $fit_interval_s } og { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s og eval_step_s skal være { $lit_0_5 }-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz skal overstige 10 MHz; fik { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid skal være 1-255

engine-e-leo-navmsg-band-must-be-15-and = band skal være 0-15 og health 0-3

engine-e-leo-navmsg-unknown-csv-schema = ukendt csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis skal angive mindst én analyse

engine-e-leo-navmsg-unknown-analysis-use = ukendt analyse '{ $a }'; brug { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind skal være leo-navmsg; fik { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg skal være i [0, 60); fik { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO-navigationsmeddelelse — { $res } km, { $res2 } deg, tyngdegrad { $gravity_degree }, model { $res3 }
    { "  " }SISRE-vægte: w_R { $w_r }, w_AC^2 1/{ $v6 } (maske { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s skal være 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s må ikke være tom, hver 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }afvejning af tilpasningsinterval over { $span } s (brugsperiode = tilpasningsinterval):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE bane-RMS { $sisre_orb_rms_m } m  maks. { $sisre_orb_max_m } m  med ur-RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s må ikke være tom, hver 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s skal være 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } parametre  SISRE bane-RMS { $sisre_orb_rms_m } m  med ur { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = ingen passage over { $mask } deg for brugeren ved { $lat }, { $lon } inden for { $search } s; udvid midpass.search_s eller flyt brugeren

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }opdatering midt i passagen: passage { $p0 }-{ $p1 } s (maks. elevation { $pmax } deg), { $switches } skift, største spring i brugerafstand { $max_jump } m (værstetilfældegeometri { $max_worst } m) mod tærskel { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }kodning og afkodning: modellen { $m }, ramme { $frame } bytes ({ $payload_bits } bit nyttelast, { $eph_bits } bit efemeride og ur), CRC-24Q 0x{ $hex }
    { "    " }kvantisering: største positionsændring { $v6 } mm, ur { $v7 } mm; SISRE nøjagtig { $acc_exact } m, kvantiseret { $acc_q } m
    { "    " }beskadiget ramme afvist: { $corrupted_rejected }; RINEX-rundtur { $rin_dp } m; CSV-rundtur { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs skal være 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  publiceret { $published } m  forhold { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = Det keplerske sæt med 16 parametre forringes fra { $a } m ved { $lo } s til { $b } m ved { $hi } s: ét keplersk sæt med harmoniske to gange pr. omløb kan ikke følge de højfrekvente tyngdeled og luftmodstanden på en LEO-bue i mere end nogle få minutter, og dets mindste-kvadraters residual svinger hen over vinduet. Polynomierne langs/på tværs/radialt, af højere grad end det keplerske sæt spænder over, optager det, der er tilbage, og giver { $c } m ved { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = Det keplerske sæt med 16 parametre går fra { $a } m ved { $lo } s til { $b } m ved { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, tyngdegrad { $gravity_degree } · repræsentationsfejl mod referencen · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` hører til værtsbiblioteket

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: `rand_distr`-samplere kalder værtens `exp` og `ln` i deres sjældne grene; brug `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` er værtsbibliotekets tyngdefelt; brug `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` er ikke gennemgået

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = ingen END OF HEADER-linje

engine-e-leo-navmsg-text-expected-eph-record-header-got = forventede en '> EPH'-posthoved, fik { $head }

engine-e-leo-navmsg-text-bad-satellite-id = ugyldigt satellit-id { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = epokelinje mangler

engine-e-leo-navmsg-text-bad-epoch-line = ugyldig epokelinje { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = ugyldigt epokefelt i { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = epokelinjen kræver tre urled: { $ep }

engine-e-leo-navmsg-text-record-truncated = posten er afkortet

engine-e-leo-navmsg-text-unknown-record-type = ukendt posttype { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = CSV-tabellen bærer kepler16- og kepler-rac-meddelelser; fik { $m }

engine-e-leo-navmsg-text-empty-csv = tom CSV

engine-e-leo-navmsg-text-row-has-cells-header = rækken har { $cells } celler, headeren { $header }

engine-e-leo-navmsg-text-bad-number-in-column = ugyldigt tal { $c } i kolonnen { $k }

engine-e-leo-navmsg-text-csv-row-lacks = CSV-rækken mangler { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = banehøjden skal være mellem 100 km og 3000 km; fik { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = excentriciteten skal være i [0, { $lit_0_1 }) for en LEO-tilpasning; fik { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = integrationstrinnet skal være i (0, 30] s; fik { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = varigheden skal være positiv med højst 200000 trin; fik { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree skal være 0, 2-6 (zonal) eller 7-{ $v1 } (EGM2008); fik { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = propageringen af referencen divergerede

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = referencebanen henfaldt til under 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = nodeafstanden skal være i (0, 60] s; fik { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = en tabelleret referencebane kræver mindst to tilstande; fik { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = tilstand { $k } er ikke endelig

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = urets adev_1s skal være i [0, 1e-6); fik { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = et målt ur bygges med TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = et styret ur kræver sigma_s i [0, 1e-3) og tau_s > 0; fik { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = et målt ur kræver et positivt trin og mindst to samples

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = et sample af et målt ur er ikke endeligt

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epoken '{ $s }' er ikke YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epoken '{ $s }' er ikke YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epoken '{ $s }' har et ugyldigt sekundfelt

engine-e-leo-pass-epoch-is-out-of-range = epoken '{ $s }' ligger uden for intervallet

engine-e-leo-pass-band-unknown-signal-design-public = bånd '{ $name }': ukendt signaludformning '{ $n }'; offentlige udformninger: { $v2 }

engine-e-leo-pass-band-is-not-in-the = bånd '{ $name }' findes ikke i systemets forudindstilling: angiv frequency_mhz og eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = bånd '{ $name }' kræver eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern skal være isoflux, gaussian eller flat; fik '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = frekvensen for bånd '{ $name }' ligger uden for intervallet

engine-leo-pass-overridden-in-the-scenario = { $source } (overskrevet i scenariet)

engine-e-leo-pass-system-has-no-band = system '{ $id }' har intet bånd '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = en LEO-satellit kræver mindst ét bånd

engine-e-leo-pass-at-most-12-bands-per = højst 12 bånd pr. satellit

engine-leo-pass-unknown-system-presets-in-this = ukendt system '{ $n }'; forudindstillinger i dette build: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = ingen solsynkron bane ved { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (højst 86400) og step_s skal være positive med højst 20000 epoker; fik { $duration } og { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO-satellit, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = scenariets `epoch` { $epoch }, læst som UTC

engine-leo-pass-the-kind-default-epoch-utc = kindens standardepoke { $epoch } UTC (scenariet angiver ingen)

engine-e-leo-pass-user-environment-must-be-ground = user.environment skal være ground, maritime, air eller indoor; fik '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg skal ligge inden for +/-90

engine-e-leo-pass-user-speed-must-be-to = brugerens hastighed skal være 0 til 3000 m/s og højden -500 til 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna skal være patch, hemispherical eller isotropic; fik '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability skal være i (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model skal være klobuchar, vtec eller none; fik '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction skal være ascending eller descending; fik '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satellit { $id }: ugyldig excentricitet eller perigæum

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satellit { $id }: tle kræver tle_line1 og tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit skal være pass, elements eller tle; fik '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation kræver et system eller en udformning

engine-e-leo-pass-no-sun-synchronous-inclination = ingen solsynkron inklination

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: højst 5000 satellitter

engine-e-leo-pass-no-leo-satellite-rises-above = ingen LEO-satellit stiger op over masken i vinduet

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s skal være i (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' er ikke et bånd for nogen LEO-satellit ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = intet GNSS-signal '{ $bname }' for konstellationen '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = tom GNSS-konstellation

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' er ikke to forskellige bånd for { $id }

engine-e-leo-pass-iot-powers-and-battery-must = iot-effekter og batteri skal være positive

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from skal være median eller peak; fik '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = detektionstærskel { $detection_snr_db } dB efter integration

engine-leo-pass-coherent-integration-at-most-ms = koherent integration højst { $rx } ms, begrænset af Doppler-raten

engine-leo-pass-serial-search-with-correlators = seriel søgning med { $correlators } korrelatorer

engine-leo-pass-hot-start-doppler-known-to = hot start: Doppler kendt til +/-{ $aided } Hz, efemeride gyldig

engine-leo-pass-leo-pass-link-budget-user = linkbudget for LEO-passage, { $environment }-bruger ved { $lat_deg }, { $lon_deg }; { $satellites } LEO-satellit(ter), vindue på { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, maks. elevation { $max_elevation_deg } deg ved { $tca_s } s, { $duration_above_mask_s } s over masken{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 peak { $opt } median { $opt2 }; |Doppler| maks. { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: { $satellites_in_view } i sigte, C/N0 { $opt } til { $opt2 } (median { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } peak { $leo_peak_cn0_dbhz } dB-Hz er { $leo_peak_above_gnss_median_db } dB over GNSS-medianen; over den stærkeste GNSS-bærebølge i { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: kold TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), hot { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer fra { $onset_s } s (spring { $offset_m } m, skub { $push_rate_m_s } m/s): Doppler-test GNSS { $t }, LEO { $t2 }, fusioneret { $t3 }; på tværs af bånd { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = { $environment }-bruger · LEO peak { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB over GNSS-medianen · MODELLED

engine-leo-pass-user-modelled = { $environment }-bruger · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler for hver LEO-satellits første bånd (±{ $v1 } kHz fuld skala)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = ugyldig [{ $what }]-tabel: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' findes hverken i [signal] eller blandt de offentlige udformninger ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' har ingen kodesporet komponent og giver derfor ingen pseudoafstand

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind skal være leo-pnt-chain; fik { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = den sporede komponent har ingen chiprate

engine-e-leo-pnt-chain-no-band-of-pass-names = intet bånd i [pass] angiver signal = "{ $name }"; kæden kræver ét til at bære udformningen

engine-e-leo-pnt-chain-the-pass-gives-no-code = passagen giver ingen kodejitter

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m skal være i [0, 100] m; fik { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] skal køre mode = "joint"; fik { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = sporet C/N0 ved masken på { $mask } deg (linjetilpasning i sin elevation)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] har intet LEO-system til at modtage kædens værdier

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] gav ingen joint-blok

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT-kæde: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signal { $name2 } ({ $design }), sporet { $design2 } ved { $v4 } Mchip/s, C/N0-forskydning { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }passage { $id } { $sat } km: sporet C/N0 peak { $peak_tracked_cn0_dbhz } dB-Hz, median for kodejitter { $jitter_median } m; C/N0-linje { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }meddelelse { $res } { $fit_interval_s } s tilpasning / { $update_period_s } s opdatering: repræsentations-SISRE { $stats } mm RMS (bane { $stats2 } mm), med { $od } m banebestemmelse: { $sisre } m givet videre{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }fusioneret positionsbestemmelse: kun GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP-konvergens: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } værdier givet videre mellem trinene. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Kodesporingsjitter, afstandsfejlen (m, 0 til { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · kun GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulation { $label }: bredden skal være positiv

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = ukendt signalforudindstilling { $name }: biblioteket har { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = forudindstilling { $name }: ugyldig forudindstillingsfil: { $e }

engine-e-leo-signal-preset-file-names-itself = forudindstillingsfilen { $name } kalder sig selv { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz skal være positiv

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz skal være positiv

engine-e-leo-signal-signal-needs-at-least-one = { $name }: et signal skal have mindst én komponent

engine-e-leo-signal-component-power-fraction-must-be = { $name }: komponent { $v1 }: power_fraction skal være positiv

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: komponent { $v1 } har fdma_shares, men ingen fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: komponent { $v1 }: fdma_shares skal være positiv og have summen én

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: komponent { $v1 } skal have én fdma_share pr. forskydning

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps skal være positiv

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips skal være positiv

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: komponenternes effektandele har summen { $total }, ikke 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km skal være positiv

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: en flad (OFDM-lignende) komponent kan ikke placeres i spektrummodellen

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: den sporede komponent ligger på FDMA-underbærebølger; spektrummodellen sporer en komponent i båndets midte

engine-e-leo-signal-signal-is-given-twice = signal { $w } er angivet to gange

engine-e-leo-signal-signals-is-more-than-the = { $out } signaler er flere end de 24 tilladte

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s skal være under 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: angiv 1 til 40 cn0_dbhz-værdier

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 og slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points skal ligge mellem 21 og 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: brug "coherent" eller "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = systemets støjtemperatur skal være positiv

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: ukendt GNSS-signal { $n } (kendte: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } er ikke et signal i scenariet

engine-e-leo-signal-shape-check-signal-is-not = formkontrol: signal { $signal } findes ikke i scenariet

engine-leo-signal-scenario-leo-signal-signals-noise = scenarie leo-signal | { $runs } signaler | støjgulv { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = venstre: båndbegrænset PSD for hver udformning (dB under toppen, på tværs af dens sendebånd); højre: kodejitter som funktion af samlet C/N0 ved { $reference_spacing_chips } chip-afstand

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = ukendt bånd '{ $other }' (forventet s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km skal være endelig og positiv

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps skal være endelig og positiv

engine-e-linkbudget-other-losses-db-must-be = other_losses_db skal være endelig og >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k skal være endelig og positiv, når den angives

engine-linkbudget-link-budget-band-km-bit = link-budget: { $value }-bånd, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, margen { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = kan ikke lytte på { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: lytter på tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp-klient forbundet

engine-live-io-kshana-live-warning-is-not = kshana live: advarsel: { $addr } er ikke en loopback-adresse; alt, der kan nå den, kan læse strømmen

engine-e-live-io-cannot-open = kan ikke åbne { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: afbrød en tcp-klient, der ikke kunne følge med

engine-e-live-io-cannot-open-2 = kan ikke åbne { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: advarsel: { $addr } er ikke en loopback-adresse; alt, der kan nå den, kan sende dette lag en strøm

engine-e-live-io-cannot-bind-udp = kan ikke binde udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: lytter på udp { $addr }

engine-e-live-io-cannot-connect-to = kan ikke oprette forbindelse til { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: forbundet til tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: læser seriel { $path } ved { $baud } baud (kun læsning)

engine-live-io-the-was-closed-by-the = { $v1 } blev lukket af modparten (laget opretter ikke forbindelse igen: kør det under en supervisor, der genstarter det)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: brug 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 eller 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } er ikke en seriel enhed (tcgetattr mislykkedes)

engine-e-live-io-cannot-set-baud = kan ikke indstille { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = kan ikke indstille linjetilstanden for { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial understøttes kun på Unix; brug --file, --tcp eller --stdin

engine-live-io-unknown-option = ukendt indstilling { $s }

engine-live-io-cannot-read = kan ikke læse { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: fartøjsplatform, kalibrerer i { $calibration_s } s; gate { $v2 }. Vejledende software, ikke typegodkendt navigationsudstyr: operatøren er fortsat ansvarlig.

engine-live-io-write-failed = skrivning mislykkedes: { $e }

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live: kasserede { $n } udp-datagram, som motoren ikke kunne tage imod ({ $udp_dropped } i alt)
       *[other] kshana live: kasserede { $n } udp-datagrammer, som motoren ikke kunne tage imod ({ $udp_dropped } i alt)
    }


## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } ligger uden for 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = indsætningsindeks { $p } ligger uden for 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = Annex 3-filerne indeholder { $gold } og { $ter } koder, 210 forventet

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } er ikke en Gold-kode af g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = sekundærkoden S{ $id } findes ikke (S0 til S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 tildeler kun koder til knude-id'er 1 til 12, ikke { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } kan ikke være i to bit (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } ligger uden for 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = { $SB1_SYMBOLS } subframe-1-symboler forventet

engine-e-lunar-afs-frame-subframe-data-lengths-expected = subframe-datalængder { $sb2 }/{ $sb3 }/{ $sb4 } (forventet { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = { $FRAME_SYMBOLS } symboler forventet, { $soft } angivet

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = linje { $v1 }: forventet `row,column`

engine-e-lunar-afs-ldpc-line = linje { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = linje { $v1 }: ({ $r },{ $c }) ligger uden for { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: { $info_bits } informationsbit forventet, { $info } angivet

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = LSIS V1.0-dataene findes ikke i { $cache_dir } (sæt KSHANA_LSIS_DIR eller kør xval/lunar-afs/fetch_lsis.sh, som henter { $LSIS_PDF_URL } og udpakker dens bilag; de videredistribueres ikke sammen med Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } er ikke en fastlåst LSIS-fil

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } har SHA-256 { $got }, forventet { $want } (fastlåst til LSIS V1.0 af 29 January 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal-basisbånd, { $LSIS_VERSION }; Kshana-referencegenerator

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = AFS-knude { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = AFS-knude { $node_id } frame TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites skal være mindst 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites skal være mindst 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg skal ligge i [0, 90); fik { $mask_deg }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } satellit, ingen beacons
       *[other] { $n_sats } satellitter, ingen beacons
    }


engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one]
            { $n_vis_beacons ->
                [one] { $n_sats } satellit + { $n_vis_beacons } synlig beacon
               *[other] { $n_sats } satellit + { $n_vis_beacons } synlige beacons
            }
       *[other]
            { $n_vis_beacons ->
                [one] { $n_sats } satellitter + { $n_vis_beacons } synlig beacon
               *[other] { $n_sats } satellitter + { $n_vis_beacons } synlige beacons
            }
    }


engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } satellit, ingen beacons
       *[other] { $n_cmp } satellitter, ingen beacons
    }


engine-e-lunar-beacon-serialising-beacon-report = serialisering af beacon-rapport: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = beacon-rapporten skal kunne serialiseres til et JSON-objekt

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Understøttelse med beacons på månens overflade — maske { $elevation_mask_deg } deg, epoke +{ $epoch_s } s, sigma_URE pr. beacon { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  sat. { $n_visible_sats }  beacons { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  realiseret 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }beacons forbedrer PDOP med { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = en større konstellation i stedet, { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = kan ikke læse månens efemeride { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = månens efemeride: første linje skal være `{ $MAGIC }`, fandt `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = månens efemeride: filen er tom

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = månens efemeride: `# format:` skal være `states` eller `elements`, fandt `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = månens efemeride: ingen datarækker

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = månens efemeride: kolonnen `{ $name }` mangler

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = månens efemeride: `# elements_frame:` skal være `icrf` eller `mci`, fandt `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = månens efemeride: `elements_frame: icrf` kræver `# epoch_jd_tdb:` (den epoke, elementerne refererer til, og som også er der, hvor rotationen fra ICRF til månefast system beregnes): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = månens efemeride: for kort elementrække { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = månens efemeride: elementrække { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = månens efemeride: elementrække { $v1 } har en ikke-positiv store halvakse

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = månens efemeride: elementrække { $v1 } har excentricitet { $ecc }, uden for [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = månens efemeride: en `states`-fil kræver `# frame: icrf` eller `# frame: mci`, fandt `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = månens efemeride: en `icrf`-states-fil kræver `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = månens efemeride: for kort tilstandsrække { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = månens efemeride: tilstandsrække { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = månens efemeride: tilstandsrække { $v1 } er ikke endelig

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = månens efemeride: tilstandsrække { $v1 } for satellit { $sat } går tilbage i tid ({ $t } efter { $last }); epoker skal være strengt voksende pr. satellit

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Tabelleret månecentreret tilstandsefemeride ({ $e }-system), Lagrange-interpoleret i orden { $LAGRANGE_ORDER } mellem tabellens epoker og reduceret til MCMF ved { $v2 }. Tilstandene propageres IKKE af denne motor. Proveniensklasse `published-ephemeris`: adskilt fra ethvert tal udledt af elementer.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Publiceret konstellations-DEFINITION angivet i månecentreret ICRF (`{ $v1 }`), propageret af denne motors egen Kepler-løser i samme inertialsystem og reduceret til MCMF ved IAU 2015 / WGCCRE-månens orientering (præcederende pol, analytisk fysisk libration) ved hver epoke. INGEN systemtilnærmelse: kilden angiver både system og epoke, og begge bruges. Proveniensklasse `published-elements`: adskilt fra ethvert tal udledt af kerner.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Publiceret konstellations-DEFINITION, propageret af denne motors egen Kepler-løser og reduceret ved spinmodellen for månens middelrotation — nøjagtig den vej, den illustrative konstellation følger, så den eneste forskel mellem de to kørsler er konstellationens udformning. Kilden angiver elementerne i `{ $v1 }`-systemet; de læses her som MCI, hvilket tilter konstellationen med `published_frame_tie_angle_deg`. Proveniensklasse `published-elements`: adskilt fra ethvert tal udledt af kerner.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = ukendt station_datum { $other }: forventet "fixed" eller "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = en VLBI-kampagne kræver mindst 2 stationer for at danne en baselinje, fik { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = station { $name } har en ikke-endelig koordinat

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = station { $name } breddegrad { $lat } deg ligger uden for [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = et syvparameter-Helmert-datum kræver mindst 3 ikke-kollineære beacons, fik { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = beacon { $name } har en ikke-endelig koordinat

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = beacon { $name } breddegrad { $lat } deg ligger uden for [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours skal være positiv og endelig, fik { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min skal være positiv og endelig, fik { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = en plan på { $v1 } epoker overskrider dette scenaries grænse på 5000 epoker; forlæng step_min eller forkort arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s skal være positiv og endelig, fik { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg skal være endelig og ligge i [-90, 90), fik { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg skal være endelig og ligge i [-90, 90), fik { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol skal være endelig og ligge i [0, 1), fik { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m skal være positiv og endelig, fik { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver skal være "spectral" eller "srif", fik "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = serialisering af lunar-frame-campaign-resultat: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign =
    { $n_epochs ->
        [one]
            { $n_beacons ->
                [one] ingen observation i kampagnen passerer den jordvendte elevationsmaske på { $mask } deg i begge ender af en baselinje OG masken på { $earth_mask } deg over beaconens egen horisont: { $n_epochs } epoke x { $v1 } baselinjer x { $n_beacons } beacon blev alle afvist. Forlæng arc_hours, sænk en maske, eller flyt stationerne.
               *[other] ingen observation i kampagnen passerer den jordvendte elevationsmaske på { $mask } deg i begge ender af en baselinje OG masken på { $earth_mask } deg over beaconens egen horisont: { $n_epochs } epoke x { $v1 } baselinjer x { $n_beacons } beacons blev alle afvist. Forlæng arc_hours, sænk en maske, eller flyt stationerne.
            }
       *[other]
            { $n_beacons ->
                [one] ingen observation i kampagnen passerer den jordvendte elevationsmaske på { $mask } deg i begge ender af en baselinje OG masken på { $earth_mask } deg over beaconens egen horisont: { $n_epochs } epoker x { $v1 } baselinjer x { $n_beacons } beacon blev alle afvist. Forlæng arc_hours, sænk en maske, eller flyt stationerne.
               *[other] ingen observation i kampagnen passerer den jordvendte elevationsmaske på { $mask } deg i begge ender af en baselinje OG masken på { $earth_mask } deg over beaconens egen horisont: { $n_epochs } epoker x { $v1 } baselinjer x { $n_beacons } beacons blev alle afvist. Forlæng arc_hours, sænk en maske, eller flyt stationerne.
            }
    }


engine-lunar-frame-campaign-full-rank-all-similarity-parameters = fuld rang: alle 7 ligedannethedsparametre er bundet af denne kampagne (konditionstal { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: { $defect } af 7 ligedannethedsretninger kan ikke observeres ud fra denne kampagne, så der offentliggøres INGEN datum-sigma; de uobserverbare retninger er opført i syvparameterbasen

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines =
    { $n_beacons ->
        [one]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } beacon x { $v1 } baselinjer x { $n_epochs } epoke = { $n_obs } obs (forsinkelses-sigma { $sigma_tau } s) | stationsdatum { $station_datum } | Helmert-rang { $rank }/7 kond. { $condition } | datum-translations-sigma { $v5 } mod gendannelsesfejl for den indlagte transformation { $trans_err_norm_m } m (forhold { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } beacon x { $v1 } baselinjer x { $n_epochs } epoker = { $n_obs } obs (forsinkelses-sigma { $sigma_tau } s) | stationsdatum { $station_datum } | Helmert-rang { $rank }/7 kond. { $condition } | datum-translations-sigma { $v5 } mod gendannelsesfejl for den indlagte transformation { $trans_err_norm_m } m (forhold { $v7 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } beacons x { $v1 } baselinjer x { $n_epochs } epoke = { $n_obs } obs (forsinkelses-sigma { $sigma_tau } s) | stationsdatum { $station_datum } | Helmert-rang { $rank }/7 kond. { $condition } | datum-translations-sigma { $v5 } mod gendannelsesfejl for den indlagte transformation { $trans_err_norm_m } m (forhold { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } beacons x { $v1 } baselinjer x { $n_epochs } epoker = { $n_obs } obs (forsinkelses-sigma { $sigma_tau } s) | stationsdatum { $station_datum } | Helmert-rang { $rank }/7 kond. { $condition } | datum-translations-sigma { $v5 } mod gendannelsesfejl for den indlagte transformation { $trans_err_norm_m } m (forhold { $v7 })
            }
    }


engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } af { $beacons } beacons har ingen observation i denne plan ({ $names2 }); de bærer ingen information, deres sigma er null, og datum realiseres kun ud fra de observerede beacons

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = alle sigma skal være positive

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane og altitude_km skal være positive

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency skal ligge i (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m mod jord { $v2 } m positions-sigma, middel-q { $v3 } (chi-i-anden 6 forventer 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } multiplicitetsparametre, ILS-succes { $last2 } (bootstrap { $last3 }) på den længste bue

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: mindste informationsegenværdi x{ $v } med orbiter-forbindelser, CRLB-spor x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } sweep-punkter på { $v } buer; laser mod GNSS x translations-sigma { $last2 } m ved det registrerede lokale tie

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB-sigma h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = ukendt study `{ $other }`: forventet en af { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = målesættet bestemmer ikke banen (singulær information)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials skal være mindst 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = jordsigma skal være positive

engine-e-lunar-infra-od-unknown-station-dss-14-dss = ukendt station `{ $nm }`: DSS-14, DSS-63 eller DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = for få jordmålinger til at bestemme banen

engine-e-lunar-infra-od-the-covariance-of-the-difference = differensens kovarians er singulær

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = den differentielle NRHO-korrektion konvergerede ikke fra startværdien

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo kræver 0 < perilune-højde < apolune-højde

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = ukendt banefamilie `{ $other }`: nrho eller elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s og arc_days skal være positive

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = ingen fælles satellit mellem modtagerne

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = bærebølgefasens normalligninger er singulære

engine-e-lunar-infra-phase-the-position-block-is-singular = positionsblokken er singulær

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = multiplicitetskovariansen er ikke positiv definit

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = teknik-sigma skal være positive

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = lokale tie-sigma skal være positive

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz skal være endelig og positiv

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz skal være endelig og positiv

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k skal være endelig og positiv

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km skal være endelig og over månens radius

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity skal ligge i [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw skal være endelig

engine-lunar-jamming-lunar-jamming-sats-epochs-links =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } epoke, { $n_links } forbindelse fra ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (middel { $mean_js_db }) | { $n_lost } LOST | tilgængelighed { $availability_under_jamming } af { $availability_nominal } nominel
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } epoke, { $n_links } forbindelser fra ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (middel { $mean_js_db }) | { $n_lost } LOST | tilgængelighed { $availability_under_jamming } af { $availability_nominal } nominel
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } epoker, { $n_links } forbindelse fra ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (middel { $mean_js_db }) | { $n_lost } LOST | tilgængelighed { $availability_under_jamming } af { $availability_nominal } nominel
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } epoker, { $n_links } forbindelser fra ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (middel { $mean_js_db }) | { $n_lost } LOST | tilgængelighed { $availability_under_jamming } af { $availability_nominal } nominel
            }
    }


engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } epoke, { $n_links } forbindelse fra ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (baseline for månen med ren himmel) | { $n_lost } LOST | tilgængelighed { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } epoke, { $n_links } forbindelser fra ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (baseline for månen med ren himmel) | { $n_lost } LOST | tilgængelighed { $availability_nominal }
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } epoker, { $n_links } forbindelse fra ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (baseline for månen med ren himmel) | { $n_lost } LOST | tilgængelighed { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } epoker, { $n_links } forbindelser fra ({ $site_lat_deg }, { $site_lon_deg }) | ingen jammer (baseline for månen med ren himmel) | { $n_lost } LOST | tilgængelighed { $availability_nominal }
            }
    }


## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = uventet header i reflektorkatalog { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = for kort række i reflektorkatalog { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = ulæseligt reflektorfelt { $i } i { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = reflektor { $f }: |(x,y,z)| = { $norm3 } m, men den publicerede radiuskolonne angiver { $radius } m — rækken er blevet redigeret

engine-e-lunar-llr-reflector-catalogue-has-no-rows = reflektorkataloget har ingen rækker

engine-e-lunar-llr-unreadable-position-epoch-year = ulæseligt position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = uventet header i stationskatalog { $t }

engine-e-lunar-llr-short-station-catalogue-row = for kort række i stationskatalog { $t }

engine-e-lunar-llr-unreadable-station-field-in = ulæseligt stationsfelt { $i } i { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = ulæseligt ILRS-id i { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = stationskataloget har ingen rækker

engine-e-lunar-llr-cannot-read-this-scenario-runs = kan ikke læse { $path } ({ $e }). Dette scenarie kører på det indlagte udsnit af rigtige data under { $DEFAULT_DATA_DIR }, som følger med repositoriet, men ikke med den publicerede crate; peg `data_dir` på en kopi af det.

engine-e-lunar-llr-only-usable-normal-points-for = kun { $used } anvendelige normalpunkter for { $reflectors } reflektorer — for få til at afgrænse { $v3 } koordinater; udvid arkivudsnittet

engine-e-lunar-llr-the-simulated-campaign-own-report = den simulerede kampagnes egen rapport kunne ikke fortolkes: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: { $used } arkiverede normalpunkter ({ $n_parsed } fortolket) fra { $station_counts } station(er) til { $reflectors } retroreflektorarrays over { $v5 } d; median af målt normalpunktpræcision { $median } mm envejs; reflektorernes informationsrang { $rank }/{ $n }; Helmert-rang { $rank2 }/{ $n_helmert } kond. { $condition }; datum-translations-sigma { $v12 } m; RMS af observeret-minus-beregnet envejsresidual { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg skal være endelig og ligge i [-90, 90), fik { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } har en ikke-endelig koordinat

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } breddegrad { $lat_deg } deg ligger uden for [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = serialisering af lunar-llr-datum-rapporten mislykkedes: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = integrationstrinnet skal gå op i outputtrinnet

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } skal være endelig og ikke negativ

engine-lunar-receiver-must-be-finite-and-positive = { $n } skal være endelig og positiv

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: eksport af sted: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = månens efemeride { $path } dækker { $until } s efter sin epoke, men scenariets horisont når { $last } s; forkort horizon_hours eller hent en længere bue (ekstrapolation af en tabelleret efemeride afvises)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path kræver epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = OP-system ved { $epoch } UTC (Jordens tilsyneladende banenormal om Månen, x langs dens knude på IAU's månelige ækvator); månens GM, J2 og C22 i IAU's månefaste system, Jorden og Solen som tredjelegemer ved DE440-positioner fra { $spk_path }; fjerdeordens Runge-Kutta, 10 s trin

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m skal være endelig og positiv

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m skal være endelig og positiv

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 kræver height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites skal være 3 eller 4, fik { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs skal være 1 til 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } skal være endelig og positiv

engine-lunar-station-must-be-finite-and-not = { $name } skal være endelig og ikke negativ

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } overstiger { $MAX_WORK }; sænk n_trials, gør grid_lat_step_deg grovere (eller angiv færre punkter), eller hæv t_step_s / forkort t_span_s

engine-e-lunar-station-kind-must-be-got = kind skal være { $KIND }; fik { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: efemeriden { $path } dækker { $until } s, men kørslen når { $last } s (sidste epoke plus latency_s); forkort t_span_s

engine-e-lunar-station-no-case = { $KIND }: intet tilfælde ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } punkter · { $n_epochs } epoker · { $n_trials } forsøg

engine-lunar-station-hpl-max = HPL maks. { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = opmåling { $survey_sigma_m } m · latenstid { $latency_s } s · { $quantization_bits } bit

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines og samples skal være 2 til { $MAX_DEM_SIDE }, fik { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } højder til et { $lines } x { $samples } gitter

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m skal være positiv, fik { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m skal være positiv, fik { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: kan ikke læse { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection skal være south-polar-stereographic, fik { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type skal være int16-le, fik { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: kan ikke læse { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: gitteret overskrider grænsen på { $MAX_DEM_SIDE } pixel

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } er { $bytes } bytes; { $lines } x { $samples } int16 kræver { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: { $img } SHA-256 { $digest } stemmer ikke med beskrivelsens { $image_sha256 }

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor skal være positiv

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: kan ikke læse { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: kræver mindst 2 x 2 punkter, en voksende udstrækning inden for [-90, 90] deg og 360 deg længdegrad samt endelige højder

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } skal være endelig og positiv, fik { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m skal være endelig og ikke negativ, fik { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg må højst være 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m skal være 1 til 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: stedet ligger uden for højdefeltet

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: en angivet horisont kræver en ikke-tom kilde

engine-e-lunar-terrain-terrain-stated-horizon = terrain: angivet horisont: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: angiv dem_path eller dem_tile_path, ikke begge

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km skal være endelig og positiv

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m skal være endelig og positiv

engine-e-lunar-terrain-site-deg-deg = { $e } (sted { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = ukendt ur { $other }; forventet en af optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks skal angive mindst én urklasse

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s skal være endelig og positiv, fik { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s skal være endelig og større end tau_min_s ({ $lo }), fik { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade skal være ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = leddet { $name } er kortere end tau-gitteret

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | ur { $clock } | 7-leddet x_Σ(τ) over { $taus } τ-punkter ({ $taus2 }–{ $taus3 } s) | krydsningspunkt τ { $crossover_tau_s } s (x { $crossover_x_s } s) | systemgulv { $frame_term_s } s | ur x(1 d) { $x_1day_ns } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: ukendt ur { $other }; forventet en af optical-master, passive-h-maser, rafs, mini-rafs, eller angiv i stedet et device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: angiv enten clock eller device_card, ikke begge

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s skal være endelig og positiv, fik { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } skal være endelig og ikke negativ, fik { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s skal være positive tal

engine-lunar-time-lab-station-height-not-modelled-exactly = stationshøjden er ikke modelleret nøjagtigt: en højdefejl på { $height_sigma_m } m (én sigma) forskyder raten med { $value } ns/døgn, anvendt som et lineært led siden sidste styring

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = lysets rejsetid konvergerede ikke til 1e-15 s på 30 iterationer

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = kernestien kræver planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path sammen

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = ukendt datum { $other }: forventet "anchor-first-station", "free-network" eller "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = en VLBI-plan kræver mindst 2 stationer for at danne en baselinje, fik { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = beaconkoordinater skal være endelige

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = beaconens breddegrad { $lat } deg ligger uden for [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = en plan på { $v1 } epoker overskrider dette scenaries grænse på 20000 epoker; forlæng step_min eller forkort arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g skal være positiv og endelig, fik { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = serialisering af lunar-vlbi-fim-resultat: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule =
    { $n_epochs ->
        [one] ingen observation i planen passerer elevationsmasken på { $mask } deg i begge ender af en baselinje: { $n_epochs } epoke x { $v1 } baselinjer blev alle afvist. Forlæng arc_hours, sænk elevation_mask_deg, eller flyt stationerne.
       *[other] ingen observation i planen passerer elevationsmasken på { $mask } deg i begge ender af en baselinje: { $n_epochs } epoker x { $v1 } baselinjer blev alle afvist. Forlæng arc_hours, sænk elevation_mask_deg, eller flyt stationerne.
    }


engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = datum efterlader ingen parameter at estimere

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: { $defect } af { $dim } retninger kan ikke observeres, så der rapporteres ingen sigma pr. koordinat; værdien i det observerbare underrum nedenfor er en pseudoinvers begrænset til de { $rank } observerbare retninger og er IKKE en stationssigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines =
    { $n_stations ->
        [one]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } station / { $v2 } baselinjer x { $n_epochs } epoke = { $n_obs } obs (maske { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond. { $condition } | stations-sigma { $v10 } mod equipartition g={ $g } { $eq_g } m (forhold { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } station / { $v2 } baselinjer x { $n_epochs } epoker = { $n_obs } obs (maske { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond. { $condition } | stations-sigma { $v10 } mod equipartition g={ $g } { $eq_g } m (forhold { $v13 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } stationer / { $v2 } baselinjer x { $n_epochs } epoke = { $n_obs } obs (maske { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond. { $condition } | stations-sigma { $v10 } mod equipartition g={ $g } { $eq_g } m (forhold { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } stationer / { $v2 } baselinjer x { $n_epochs } epoker = { $n_obs } obs (maske { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } kond. { $condition } | stations-sigma { $v10 } mod equipartition g={ $g } { $eq_g } m (forhold { $v13 })
            }
    }


## src/main.rs

engine-main-error-validate-needs-scenario-path = fejl: --validate kræver en scenariesti

engine-main-error-study-needs-suite-manifest = fejl: --study kræver en sti til et suite-manifest

engine-main-error-study-name-needs-value = fejl: --study-name kræver en værdi

engine-main-error-export-sp3-needs-path = fejl: --export-sp3 kræver en sti

engine-main-error-export-omm-needs-path = fejl: --export-omm kræver en sti

engine-main-error-export-oem-needs-path = fejl: --export-oem kræver en sti

engine-main-error-animate-needs-format-svg = fejl: --animate kræver et format: svg, html, frames eller all

engine-main-error-animate = fejl: --animate: { $e }

engine-main-error-animate-fps-needs-whole = fejl: --animate-fps kræver et helt antal billeder pr. sekund

engine-main-error-export-needs-format-czml = fejl: --export kræver et format: czml, kml, geojson, stk, sigmf, all eller list

engine-main-error-animate-duration-needs-length = fejl: --animate-duration kræver en længde i sekunder

engine-main-error-import-route-needs-geojson = fejl: --import-route kræver en sti til en GeoJSON-fil

engine-main-error-eop-needs-finals2000a-file = fejl: --eop kræver en sti til en finals2000A-fil

engine-main-error-unknown-option = fejl: ukendt indstilling '{ $other }'

engine-main-error-unexpected-argument-one-scenario = fejl: uventet argument '{ $other }'; én scenariefil pr. kørsel

engine-main-warning-animate-fps-and-animate = advarsel: --animate-fps og --animate-duration gør intet uden --animate

engine-main-error-animate-exports-one-scenario = fejl: --animate eksporterer én scenariekørsel; det kan ikke kombineres med --validate eller --study

engine-main-error-validate-lints-one-scenario = fejl: --validate kontrollerer ét scenarie; angiv ikke også en scenariefil

engine-main-error-cannot-read = fejl: kan ikke læse { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind kan opløses; denne kind kræver intet felt (en tom krop kører sin referencekonfiguration), så der var intet yderligere at kontrollere

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok: { $kind } — kind kan opløses, og dens { $n_required } publicerede post med obligatoriske felter er opfyldt; feltværdier kontrolleres ikke
       *[other] ok: { $kind } — kind kan opløses, og alle { $n_required } af dens publicerede poster med obligatoriske felter er opfyldt; feltværdier kontrolleres ikke
    }


engine-main-error-study-runs-suite-do = fejl: --study kører en suite; angiv ikke også en enkelt scenariefil

engine-main-warning-study-name-is-ignored = advarsel: --study-name ignoreres sammen med --study; en study får sin titel fra suite-manifestets `title =`

engine-main-error-cannot-read-2 = fejl: kan ikke læse { $path }: { $e }

engine-main-hint-kshana-example-lists-the = tip: `kshana example` viser de medfølgende referencescenarier; `kshana example clock-holdover > clock-holdover.toml` skriver et

engine-main-error-cannot-read-3 = fejl: kan ikke læse { $eop_file }: { $e }

engine-main-error-eop = fejl: --eop: { $e }

engine-main-error-cannot-read-4 = fejl: kan ikke læse { $route_file }: { $e }

engine-main-error-import-route = fejl: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: gælder ikke: { $why }

engine-main-error-export = fejl: --export: { $e }

engine-main-error-animate-2 = fejl: --animate { $f }: { $e }

engine-main-error-export-2 = fejl: eksport af { $fmt }: { $e }

engine-main-error-cannot-write = fejl: kan ikke skrive { $json_path }: { $e }

engine-main-error-cannot-write-2 = fejl: kan ikke skrive { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = fejl: kan ikke bygge rapporten: { $e }

engine-main-error-cannot-write-3 = fejl: kan ikke skrive { $html_path }: { $e }

engine-main-error-cannot-write-4 = fejl: kan ikke skrive { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = fejl: kan ikke skrive { $csv_path }: { $e }

engine-main-wrote-and = skrev { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } og { $csv_path }

engine-main-wrote-and-2 = skrev { $json_path }, { $svg_path }, { $html_path } og { $report_json_path }

engine-main-error-cannot-write-6 = fejl: kan ikke skrive { $target }: { $e }

engine-main-error-cannot-write-7 = fejl: kan ikke skrive { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = fejl: SP3-eksport mislykkedes: { $e }

engine-main-error-cannot-write-8 = fejl: kan ikke skrive { $omm_path }: { $e }

engine-main-error-omm-export-failed = fejl: OMM-eksport mislykkedes: { $e }

engine-main-error-cannot-write-9 = fejl: kan ikke skrive { $oem_path }: { $e }

engine-main-error-oem-export-failed = fejl: OEM-eksport mislykkedes: { $e }

engine-main-error-unexpected-argument-after-kinds = fejl: uventet argument '{ $other }' efter `kinds`; kun --json accepteres

engine-main-bundled-reference-scenarios-write-one =
    Medfølgende referencescenarier ({ $v1 }). Skriv et til en fil, og kør det:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (ikke medfølgende: { $name } — kør `kshana example { $name }` for at se hvorfor)

engine-main-error-is-not-bundled-it = fejl: '{ $name }' er ikke medfølgende: det { $why }

engine-main-error-no-bundled-scenario-named = fejl: intet medfølgende scenarie med navnet '{ $name }'; `kshana example` viser de { $v1 }, der findes

engine-main-error-cannot-read-5 = fejl: kan ikke læse { $suite_path }: { $e }

engine-main-wrote-and-3 = skrev { $json_path } og { $html_path }

engine-main-error-needs-value = fejl: { $a } kræver en værdi

engine-main-error-expected-mean-needs-number = fejl: --expected-mean kræver et tal

engine-main-error-unknown-imu-fit-option = fejl: ukendt imu-fit-indstilling { $x }

engine-main-error-imu-fit-needs-an = fejl: imu-fit kræver en sti til en IMU-log

engine-main-error-needs-value-2 = fejl: { $args } kræver en værdi

engine-main-error-epoch = fejl: --epoch: { $e }

engine-main-error-unknown-bench-export-option = fejl: ukendt bench-export-indstilling { $a }

engine-main-error-bench-export-needs-scenario = fejl: bench-export kræver en scenariesti

engine-main-needs-value = { $a } kræver en værdi

engine-main-site-takes-lat-lon-height = --site tager lat,lon[,height_m], fik { $v }

engine-main-error-is-bytes-the-tle = fejl: { $p } er { $m } bytes; TLE-grænsen er { $cap } (4 MiB)

engine-main-error-cannot-read-6 = fejl: kan ikke læse { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = ukendt sky-indstilling { $a }

engine-e-main-svg-and-monte-carlo-are = --svg og --monte-carlo er separate outputs; angiv ét

engine-main-error-preset-needs-name =
    fejl: --preset kræver et navn
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    fejl: --profile kræver en fil
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } symboler, { $r2 } frame fundet; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }frame ved { $f }: FID { $f2 } TOI { $f3 } (SB1-metrik { $f4 }, { $f5 } SP-fejl, { $f6 } SB1-fejl)

engine-main-not-checked = ikke kontrolleret: { $r }

engine-main-wrote-frame-of-6000-symbols = skrev { $out }: { $frames } frame på 6000 symboler; subframes 2 til 4 er pladsholdere (ikke LDPC-kodet, ingen besked)

engine-main-error-cannot-write-10 = fejl: kan ikke skrive { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = ukendt lunanet-afs-check-underkommando { $other }

engine-main-needs-pack-id = { $cmd } kræver et pack-id

engine-main-unknown-standards-pack-run-option = ukendt standards-pack run-indstilling { $a }

engine-main-unknown-standards-pack-subcommand = ukendt standards-pack-underkommando { $other }

engine-main-error-out-needs-value = fejl: --out kræver en værdi

engine-main-error-unknown-compliance-report-option = fejl: ukendt compliance-report-indstilling { $a }

engine-main-error-compliance-report-needs-at = fejl: compliance-report kræver mindst én .json-resultatfil

engine-main-runs-read-not-used-rows = { $runs } kørsler læst, { $unrecognised } ikke brugt; rækker: { $n } med belæg, { $n2 } delvist, { $n3 } uden belæg, { $n4 } uden for omfang

engine-main-error-receiver-trust-needs-scenario = fejl: receiver-trust kræver en scenariesti

engine-main-error-invalid-receiver-trust-scenario = fejl: ugyldigt receiver-trust-scenarie: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = brændingen opbruger massen: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, brænding={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = flyvetiden skal være positiv

engine-e-maneuver-collinear-endpoints-transfer-plane-is = kollineære endepunkter: overførselsplanet er udefineret (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs er til M >= 1; brug lambert til M = 0

engine-e-maneuver-no-revolution-transfer-the-time = ingen overførsel med { $revs } omløb: flyvetiden er under minimum

engine-e-maneuver-grid-step-days-must-be = grid_step_days skal være positiv, fik { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = hvert vindue skal løbe fremad (start <= slut)

engine-e-maneuver-no-transfer-of-the-requested = ingen overførsel af den ønskede type i vinduerne

engine-e-maneuver-the-optimum-left-the-feasible = optimum forlod det tilladte område

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: forventede 3 værdier

engine-e-mars-od-dss-epoch-is-not-2003 = DSS-{ $id } epoke er ikke 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } har ingen DXYZ

engine-e-mars-od-no-coordinates-for-dss = ingen koordinater for DSS { $station }

engine-e-mars-od-no-ramps-for-dss = ingen ramper for DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = rampetabellen dækker ikke intervallet

engine-e-mars-od-epoch-outside-the-integrated-span = epoke { $et } uden for det integrerede tidsrum

engine-e-mars-od-normal-matrix-is-not-positive = normalmatricen er ikke positivt definit

engine-e-mars-od-no-points = ingen punkter

engine-e-mars-od-parameter-has-no-partial-on = en parameter har ingen partiel afledt på de bibeholdte punkter

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays =
    { $n_relays ->
        [one] mars-pnt { $r } | { $user }-bruger, { $clock_class }-ur | { $n_relays } relæ (middel { $mean_relays_in_view } i sigte) | konvergeret pos. RMS { $converged_pos_rms_m } m, formel 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — kovarians-nøgletal, ikke et certificeret PL) | urfrekvens-σ { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
       *[other] mars-pnt { $r } | { $user }-bruger, { $clock_class }-ur | { $n_relays } relæer (middel { $mean_relays_in_view } i sigte) | konvergeret pos. RMS { $converged_pos_rms_m } m, formel 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — kovarians-nøgletal, ikke et certificeret PL) | urfrekvens-σ { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
    }


engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — { $user }-bruger, { $clock_class }-ur: 3D-positionsfejl mod reference (konvergeret RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = den parvise matrix er tom

engine-e-mcda-ahp-pairwise-matrix-is-not-square = den parvise matrix er ikke kvadratisk (række { $i } har { $row } af { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = elementet a[{ $i }][{ $j }] = { $v } skal være endeligt og positivt

engine-e-mcda-ahp-diagonal-must-be = diagonalen a[{ $i }][{ $i }] = { $row } skal være 1

engine-e-mcda-ahp-entries-must-be-reciprocal = elementerne a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } skal være reciprokke (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = øvre række { $i } har { $row } elementer, forventede { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = øvre element ({ $i },{ $j }) = { $v } skal være endeligt og positivt

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: tom beslutningsmatrix

engine-e-mcda-copras-copras-no-criteria = COPRAS: ingen kriterier

engine-e-mcda-copras-copras-weights-but-criterion-types =
    { $n ->
        [one] COPRAS: { $n } vægt, men { $types } kriterietyper
       *[other] COPRAS: { $n } vægte, men { $types } kriterietyper
    }


engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: kræver mindst ét omkostningskriterium (Min)

engine-e-mcda-copras-copras-alternative-has-values-but =
    { $n ->
        [one] COPRAS: alternativ { $i } har { $row } værdier, men der er { $n } kriterium
       *[other] COPRAS: alternativ { $i } har { $row } værdier, men der er { $n } kriterier
    }


engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: alternativ { $i } kriterium { $j } værdi { $x } skal være endelig og > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: tomt datasæt

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: ingen kriterier

engine-e-mcda-electre-electre-alternative-has-values-but =
    { $n ->
        [one] ELECTRE I: alternativ { $i } har { $row } værdier, men der er { $n } kriterium
       *[other] ELECTRE I: alternativ { $i } har { $row } værdier, men der er { $n } kriterier
    }


engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: alternativ { $i } har en ikke-endelig værdi

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: tom beslutningsmatrix

engine-e-mcda-moora-moora-no-criteria = MOORA: ingen kriterier

engine-e-mcda-moora-moora-weights-but-criterion-types =
    { $n ->
        [one] MOORA: { $n } vægt, men { $types } kriterietyper
       *[other] MOORA: { $n } vægte, men { $types } kriterietyper
    }


engine-e-mcda-moora-moora-alternative-has-values-but =
    { $n ->
        [one] MOORA: alternativ { $i } har { $row } værdier, men der er { $n } kriterium
       *[other] MOORA: alternativ { $i } har { $row } værdier, men der er { $n } kriterier
    }


engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: alternativ { $i } har en ikke-endelig værdi

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: kriterium { $j } har L2-norm nul

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: tom beslutningsmatrix

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: ingen kriterier

engine-e-mcda-promethee-promethee-ii-weights-but-types =
    { $n ->
        [one] PROMETHEE II: { $n } vægt, men { $types } typer / { $prefs } præferencefunktioner
       *[other] PROMETHEE II: { $n } vægte, men { $types } typer / { $prefs } præferencefunktioner
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    { $n ->
        [one] PROMETHEE II: alternativ { $i } har { $row } værdier, men der er { $n } kriterium
       *[other] PROMETHEE II: alternativ { $i } har { $row } værdier, men der er { $n } kriterier
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: alternativ { $i } har en ikke-endelig værdi

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: tom beslutningsmatrix

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: ingen kriterier

engine-e-mcda-topsis-topsis-weights-but-criterion-types =
    { $n ->
        [one] TOPSIS: { $n } vægt, men { $types } kriterietyper
       *[other] TOPSIS: { $n } vægte, men { $types } kriterietyper
    }


engine-e-mcda-topsis-topsis-alternative-has-values-but =
    { $n ->
        [one] TOPSIS: alternativ { $i } har { $row } værdier, men der er { $n } kriterium
       *[other] TOPSIS: alternativ { $i } har { $row } værdier, men der er { $n } kriterier
    }


engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: alternativ { $i } har en ikke-endelig værdi

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = additiv nytte har ingen attributter

engine-e-mcda-utility-attributes-but-weights = { $attributes } attributter, men { $weights } vægte

engine-e-mcda-utility-invalid-scaling-constant = ugyldig skaleringskonstant { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = skaleringskonstanterne summerer til nul

engine-e-mcda-utility-attribute-values-expected-got = forventede { $attributes } attributværdier, fik { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: tom beslutningsmatrix

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: ingen kriterier

engine-e-mcda-vikor-vikor-weights-but-criterion-types =
    { $n ->
        [one] VIKOR: { $n } vægt, men { $types } kriterietyper
       *[other] VIKOR: { $n } vægte, men { $types } kriterietyper
    }


engine-e-mcda-vikor-vikor-alternative-has-values-but =
    { $n ->
        [one] VIKOR: alternativ { $i } har { $row } værdier, men der er { $n } kriterium
       *[other] VIKOR: alternativ { $i } har { $row } værdier, men der er { $n } kriterier
    }


engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: alternativ { $i } har en ikke-endelig værdi

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: tom beslutningsmatrix

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: ingen kriterier

engine-e-mcda-waspas-waspas-weights-but-criterion-types =
    { $n ->
        [one] WASPAS: { $n } vægt, men { $types } kriterietyper
       *[other] WASPAS: { $n } vægte, men { $types } kriterietyper
    }


engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } skal ligge i [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    { $n ->
        [one] WASPAS: alternativ { $i } har { $row } værdier, men der er { $n } kriterium
       *[other] WASPAS: alternativ { $i } har { $row } værdier, men der er { $n } kriterier
    }


engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: alternativ { $i } kriterium { $j } værdi { $x } skal være endelig og > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: tom beslutningsmatrix

engine-e-mcda-wpm-wpm-no-criteria = WPM: ingen kriterier

engine-e-mcda-wpm-wpm-weights-but-criterion-types =
    { $n ->
        [one] WPM: { $n } vægt, men { $types } kriterietyper
       *[other] WPM: { $n } vægte, men { $types } kriterietyper
    }


engine-e-mcda-wpm-wpm-alternative-has-values-but =
    { $n ->
        [one] WPM: alternativ { $i } har { $row } værdier, men der er { $n } kriterium
       *[other] WPM: alternativ { $i } har { $row } værdier, men der er { $n } kriterier
    }


engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: alternativ { $i } kriterium { $j } værdi { $x } skal være endelig og > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = beslutningsmatricen har ingen kriterier

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = beslutningsmatricen har ingen alternativer

engine-e-mcda-wsm-criterion-has-an-invalid-weight = kriteriet '{ $name }' har en ugyldig vægt { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = kriterievægtene summerer til nul

engine-e-mcda-wsm-alternative-has-values-but-there =
    { $n ->
        [one] alternativet '{ $name }' har { $values } værdier, men der er { $n } kriterium
       *[other] alternativet '{ $name }' har { $values } værdier, men der er { $n } kriterier
    }


engine-e-mcda-wsm-alternative-has-non-finite-value = alternativet '{ $name }' har en ikke-endelig værdi for kriteriet '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = ikke en DAF: kortere end én post

engine-e-naif-kernel-not-daf-identification-word = ikke en DAF: identifikationsord { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = DAF-binærformat { $other } understøttes ikke

engine-e-naif-kernel-implausible-daf-header-nd-ni = usandsynlig DAF-header: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF-adresse { $addr } ligger efter filens slutning

engine-e-naif-kernel-bad-daf-address-range = ugyldigt DAF-adresseinterval { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = DAF-oversigtslisten afsluttes ikke

engine-e-naif-kernel-daf-summary-record-claims-summaries =
    { $count ->
        [one] DAF-oversigtsposten { $rec } angiver { $count } oversigt
       *[other] DAF-oversigtsposten { $rec } angiver { $count } oversigter
    }


engine-e-naif-kernel-malformed-type-segment-rsize-intlen = fejlformet type-2-segment: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = type-2-segmentets størrelse passer ikke til dets katalog

engine-e-naif-kernel-epoch-outside-the-record = epoke { $et } uden for posten [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = type-1-segmentets størrelse passer ikke til dets N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = fejlformet type-1-post: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = ikke en SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = SPK-oversigten er ikke ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = ingen SPK type-1/2-data for legemet { $target } ved ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = SPK-segmentet for { $target } er i referencesystemet { $frame }, ikke J2000

engine-e-naif-kernel-spk-centre-chain-does-not = SPK-centerkæden når ikke barycentret

engine-e-naif-kernel-not-binary-pck = ikke en binær PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = PCK-oversigten er ikke ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = ingen PCK type-2-data for referencesystemet { $body_frame } ved ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = PCK-referencesystemet { $body_frame } er angivet i forhold til referencesystemet { $other }, som ikke er J2000 eller ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = ugyldigt tal { $s }

engine-e-navsignal-must-be-positive-number = { $s } skal være et positivt tal

engine-e-navsignal-modulation-expected-name-args-bpsk = modulation { $label }: forventede NAME(args), f.eks. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulation { $label }: mangler afsluttende parentes

engine-e-navsignal-modulation-is-not-one-of = modulation { $label } er ikke en af BPSK(n), BOC(m,n) eller MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = uafsluttet entitet i { $s }

engine-e-ndm-xml-bad-character-reference = ugyldig tegnreference &{ $ent };

engine-e-ndm-xml-unknown-entity = ukendt entitet &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = uafsluttet processing instruction

engine-e-ndm-xml-unterminated-comment = uafsluttet kommentar

engine-e-ndm-xml-unterminated-declaration = uafsluttet deklaration

engine-e-ndm-xml-expected-an-element-at-byte = forventede et element ved byte { $pos }

engine-e-ndm-xml-unterminated-start-tag = uafsluttet start-tag

engine-e-ndm-xml-attribute-without-value = attribut uden værdi

engine-e-ndm-xml-unterminated-attribute-value = uafsluttet attributværdi

engine-e-ndm-xml-unterminated-end-tag = uafsluttet slut-tag

engine-e-ndm-xml-unterminated-cdata = uafsluttet CDATA

engine-e-ndm-xml-content-after-the-root-element = indhold efter rodelementet

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } skal være endelig og ikke-negativ

engine-e-nma-budget-subframe-must-be-positive = subframe_s skal være positiv

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps skal være positiv

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed skal være 0 eller positiv

engine-e-nmea-synth-cli-unexpected-argument = uventet argument { $s }

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = instruktørlog: { $e }

engine-nmea-synth-cli-instructor-log-and = instruktørlog: { $jp } og { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP-server lytter på { $s }; venter på { $wait_clients } klient(er)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = forventede YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = dato eller tid uden for området (årene 1980 til 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = ingen sådan kalenderdato

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } skal være et endeligt tal

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s skal ligge i 1 til 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz skal være 1, 2, 5 eller 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = fartøjets position skal ligge inden for 89 grader fra ækvator

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn skal ligge i 0 til 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = fartøjets grænser for drejehastighed og acceleration skal være positive

engine-e-nmea-synth-config-give-at-least-one-waypoint = angiv mindst ét [[waypoint]] eller vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = waypoint { $v1 } er uden for området

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = waypoint { $v1 } speed_kn skal ligge i 0 til 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems skal angive mindst én konstellation

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } er ikke en af { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s skal være mindst 1

engine-e-nmea-synth-config-event = hændelse { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s skal ligge inden for kørslen

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s skal være positiv; ramp_s og recovery_s må ikke være negative

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s må ikke overstige duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } gælder ikke for denne type

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz skal ligge i 20 til 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db er påkrævet

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db skal ligge i 0 til 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db skal ligge i 0 til 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m er påkrævet

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m skal ligge i 0 til 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = slæbningen ville accelerere det falske spor med op til { $need } m/s^2, over max_accel_mps2 = { $a }; forlæng ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = angiv præcis én af bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s er påkrævet

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s skal være forskellig fra nul og inden for et døgn

engine-e-nmea-synth-config-delay-is-required = delay_s er påkrævet

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s skal ligge i 0 til 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = silhuetten beskriver ingen afskærmning

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } er slut

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    { $n_used ->
        [one] modtageren melder igen en positionsbestemmelse ({ $n_used } satellit brugt)
       *[other] modtageren melder igen en positionsbestemmelse ({ $n_used } satellitter brugt)
    }


engine-nmea-synth-gen-the-receiver-has-no-fix =
    { $n_used ->
        [one] modtageren har ingen positionsbestemmelse ({ $n_used } brugbar satellit, fire kræves)
       *[other] modtageren har ingen positionsbestemmelse ({ $n_used } brugbare satellitter, fire kræves)
    }


## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = fra T+{ $start_s } s i { $duration_s } s (indsætningsrampe { $ramp_s } s, genopretningsrampe { $recovery_s } s)

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: modtaget C/N0 falder med op til { $cn0_drop_db } dB (spredning pr. satellit { $spread_db } dB); satellitter falder fra, og positionsbestemmelsen går tabt, når færre end fire forbliver brugbare

engine-nmea-synth-log-towards-deg-true = mod { $b } deg ret

engine-nmea-synth-log-towards-deg-true-deg-relative = mod { $t } deg ret ({ $r } deg relativt til kursen ved indsætning, derefter fastholdt)

engine-nmea-synth-log-natural-degradation-the-sky-closes = naturlig forringelse: himlen lukkes bag en angivet silhuet ({ $e }); satellitter bag den forbliver opført uden SNR og bruges ikke, C/N0 for de øvrige er uændret, og intet er forfalsket

engine-nmea-synth-log-instructor-log = INSTRUKTØRLOG: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Instruktørnote: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Start { $start_utc }   varighed { $duration_s } s   seed { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }TOPPE  sande: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   rapporterede: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: ukendt konstellation { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Tolerancen ligger under støjgulvet for f64-rangaflæsning { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): dens tilsvarende egenværdigulv rel_tol^2 = { $v1 } ligger under afrundingsstøjen i Gram-matricen, så de ekstra retninger er aritmetisk restværdi, ikke observerbarhed.

engine-observability-gramian-rank-clamped-from-the-singular = rangen er begrænset fra antallet af singulærværdier { $counted } til min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } ved rel_tol { $rel_tol }: en { $n_rows }x{ $n_cols }-matrix kan ikke have rang { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular =
    { $n ->
        [one] GDOP udefineret (rangdeficient / singulær geometri): rang { $rank } af { $n } tilstand, datumdefekt { $v3 }, konditionstal { $v4 }
       *[other] GDOP udefineret (rangdeficient / singulær geometri): rang { $rank } af { $n } tilstande, datumdefekt { $v3 }, konditionstal { $v4 }
    }


## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bytes er ikke et helt antal poster på 36 bytes

engine-e-odf-record-precedes-any-group-header = post { $v1 } kommer før enhver gruppeheader

engine-e-odf-no-orbit-data-group = ingen banedatagruppe

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } er ikke et nøgleord i { $name }

engine-e-odm-without = { $name } uden { $k }

engine-e-odm-needs-exactly-one-of = { $name } kræver præcis én af { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION og MESSAGE_ID er header-nøgleord i version 3.0 (version { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = uventet linje { $b }

engine-e-odm-unknown-keyword = ukendt nøgleord { $k }

engine-e-odm-block-repeated-or-out-of = blokken { $block } er gentaget eller står i forkert rækkefølge ved { $key }

engine-e-odm-repeated = { $key } er gentaget

engine-e-odm-comments-after-the-last-keyword = kommentarer efter det sidste nøgleord

engine-e-odm-given-twice = { $b } er angivet to gange

engine-e-odm-opm-without-metadata = OPM uden metadata

engine-e-odm-opm-without-state-vector = OPM uden tilstandsvektor

engine-e-odm-omm-without-metadata = OMM uden metadata

engine-e-odm-omm-without-mean-elements = OMM uden middelelementer

engine-e-odm-is-not-keyword-of-the = { $k } er ikke et nøgleord i blokken { $kind }

engine-e-odm-block-without = blokken { $kind } uden { $k }

engine-e-odm-block-with-data-lines = blokken { $kind } med datalinjer

engine-e-odm-line-has-values-expected = { $kind }-linje { $l } har { $l2 } værdier, forventede { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } er ikke et OCM-metadatanøgleord

engine-e-odm-ocm-metadata-without = OCM-metadata uden { $k }

engine-e-odm-block-repeated = blokken { $kind } er gentaget

engine-e-odm-inside-block = { $t } inde i en blok

engine-e-odm-unsupported-ocm-block = OCM-blokken { $tag } understøttes ikke

engine-odm-outside-block = { $t } uden for en blok

engine-e-odm-closes-block = { $t } lukker en { $want }-blok

engine-e-odm-unexpected-line-2 = uventet linje { $t }

engine-e-odm-outside-block = { $k } uden for en blok

engine-e-odm-unterminated-block = uafsluttet blok

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = epoken mangler 'T' som skilletegn mellem dato og tid: { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = OEM-epokedatoen '{ $date }' understøttes ikke (forventede yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = OEM-epoketiden '{ $time }' understøttes ikke (forventede HH:MM:SS)

engine-e-oem-bad-epoch-year = ugyldigt epokeår: { $d }

engine-e-oem-bad-epoch-month = ugyldig epokemåned: { $d }

engine-e-oem-bad-epoch-day = ugyldig epokedag: { $d }

engine-e-oem-bad-epoch-hour = ugyldig epoketime: { $t }

engine-e-oem-bad-epoch-minute = ugyldigt epokeminut: { $t }

engine-e-oem-bad-epoch-second = ugyldigt epokesekund: { $t }

engine-e-oem-oem-epoch-field-out-of = OEM-epokefelt uden for området: { $s }

engine-e-oem-unexpected-oem-header-line = uventet OEM-headerlinje: { $line }

engine-e-oem-expected-meta-start-found = forventede META_START, fandt: { $line }

engine-e-oem-unexpected-oem-metadata-line = uventet OEM-metadatalinje: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM-segmentmetadata mangler META_STOP

engine-e-oem-oem-metadata-missing-object-name = OEM-metadata mangler OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = OEM-metadata mangler OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = OEM-metadata mangler CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = OEM-metadata mangler REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = OEM-metadata mangler TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = OEM-metadata mangler START_TIME

engine-e-oem-oem-metadata-missing-stop-time = OEM-metadata mangler STOP_TIME

engine-e-oem-oem-data-line-needs-position = en OEM-datalinje kræver komponenter for position+hastighed (6) eller +acceleration (9), fik { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = ikke-numerisk OEM-tilstandsværdi '{ $t }' i: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM mangler headeren CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = OEM mangler headeren CREATION_DATE

engine-e-oem-oem-missing-originator-header = OEM mangler headeren ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM indeholdt ingen segmenter

engine-oem-oem-interop-round-tripped-segment =
    { $n_states_total ->
        [one] oem-interop: rundtur for { $segments } segment(er), { $n_states_total } tilstand; største rundturfejl { $p } km / { $v } km/s (MODELLED interop)
       *[other] oem-interop: rundtur for { $segments } segment(er), { $n_states_total } tilstande; største rundturfejl { $p } km / { $v } km/s (MODELLED interop)
    }


engine-oem-oem-interop-ingested-segment-states =
    { $n_states_total ->
        [one] oem-interop: indlæste { $segments } segment(er), { $n_states_total } tilstand fra ekstern OEM (afsender { $originator }) (MODELLED interop)
       *[other] oem-interop: indlæste { $segments } segment(er), { $n_states_total } tilstande fra ekstern OEM (afsender { $originator }) (MODELLED interop)
    }


engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = ingen COVARIANCE_START-blok

engine-e-oem-no-covariance-stop = ingen COVARIANCE_STOP

engine-e-oem-bad-covariance-value = ugyldig kovariansværdi '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = forventede 21 kovariansværdier, fandt { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM-eksport kræver fulde TLE'er (linje 1 + linje 2); denne blok har ingen

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

engine-e-optical-atmosphere-scenario-must-be-in = { $n } skal ligge i [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg skal ligge i [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave skal være "plane" eller "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction skal være "downlink" eller "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = elementerne i availability_targets_pct skal ligge i (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h må højst være 8760 (ét år)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } trin er over de { $MAX_STEPS }, et resultat rummer; forøg step_s eller forkort duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = ukendt urklasse "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = hvert sted kræver et navn

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = sted { $name }: bredde/længde uden for området

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = sted { $name }: altitude_m skal ligge i [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm ved { $elevation_deg } deg elevation, margen { $margin0 } dB før atmosfæren; bedste sted { $scn } { $v5 } %; netværk med { $order } steder { $last } % uafhængigt / { $last2 } % korreleret vejr (MODELLED, vejledende)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = RINEX-blokken blev læst, men indeholdt ingen understøttede efemerider

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg skal ligge i [-90, 90], og alle felter skal være endelige

engine-e-orbit-no-satellites-to-export = ingen satellitter at eksportere

engine-e-orbit-time-step-must-be-positive = time.step_s skal være positiv ved SP3-eksport

engine-e-orbit-time-step-must-be-positive-2 = time.step_s skal være positiv ved OEM-eksport

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } skal være positiv; fik { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s skal være endelig og ikke-negativ

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate skal være endelig og ikke-negativ

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = spoofers mindste elevation skal ligge i [0, 90) grader

engine-e-orbital-timing-cross-check-sigma-ns-must = krydskontrollens sigma_ns skal være endelig og ikke-negativ

engine-orbital-timing-the-in-plane-neighbour-degrees = naboen i samme plan, { $v1 } grader foran, ligger uden for en enkelt spoofers fodaftryk ({ $v2 } grader på tværs)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = naboen i samme plan, { $v1 } grader foran, kan ligge inden for samme spoofers fodaftryk ({ $v2 } grader på tværs), så begge ure kan trækkes sammen

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = inputfil mangler

engine-e-osnma-cli-max-time-error-has-no = --max-time-error har ingen virkning uden --reference-time

engine-e-osnma-cli-not-number = ikke et tal: { $s }

engine-e-osnma-cli-public-key-must-be-id = den offentlige nøgle skal være ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = typen på den offentlige nøgle skal være p256 eller p521

engine-e-osnma-cli-unknown-format = ukendt format { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } er ikke tekst; brug --format ubx til en UBX-strøm

engine-e-osnma-cli-vector-csv-needs-start-gst = en vektor-CSV kræver --start-gst eller et dateret filnavn

# legal: native review
engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    fejl: kan ikke læse { $input }: { $e }

# legal: native review
engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA-verifikation
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = input: { $input } ({ $pages } sider)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: { $frames } frames; { $inav_pages } I/NAV-sider afkodet, { $pages } placeret i tid ({ $bad_crc } med ugyldig CRC, { $unstamped } kan ikke placeres, { $time_conflicts } tidskonflikter)

engine-osnma-cli-overall-nma-status = samlet: { $status_word }   NMA-status: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALARM: en verificeret OSNMA-alarmmeddelelse blev modtaget. Stop med at bruge OSNMA-data; intet rapporteres som autentificeret.

engine-osnma-cli-freshness-not-enforced-no-reference = aktualitet: IKKE håndhævet. Der blev ikke angivet nogen referencetid, så subframe-tider tages fra inputtet, og en genafspilning af gamle data ville blive autentificeret.

engine-osnma-cli-freshness-sub-frames-within-of = aktualitet: subframes inden for { $max_err } s af referencetiden { $v2 } bruges; { $set_aside } blev sat til side. En referencetid er ét enkelt tidspunkt.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satellit  status          autentificeret  fejlet  afventer  kasseret  sidst autentificeret

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epoke (tag-subframe)      tx   data  adkd  ctr  resultat

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = linje { $v1 }: forventede 3 felter

engine-e-osnma-input-line-bad-svid = linje { $v1 }: ugyldigt SVID

engine-e-osnma-input-line-bad-bit-count = linje { $v1 }: ugyldigt bitantal

engine-e-osnma-input-line-data-is-not-hex = linje { $v1 }: data er ikke hex

engine-e-osnma-input-line-bit-count-does-not = linje { $v1 }: bitantallet passer ikke til dataene

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = tidstolerancen skal være under én subframe ({ $SUBFRAME_S } s), fik { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834-refraktion er defineret for stationshøjder fra 0 til 3 km; fik { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s og step_s skal være positive

engine-e-passes-station-lat-deg-must-be = station_lat_deg skal ligge i [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg skal ligge i [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours skal være endelig og positiv

engine-e-passes-step-must-be-finite-and = step_s skal være endelig og positiv

engine-passes-passes-pass-es-of-km = passes: { $passes } overflyvning(er) af en { $altitude_km } km / { $inclination_deg }°-bane over ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° på { $duration_hours } h; { $total_access_s } s samlet adgang (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = for kort { $record }-post: { $line }

engine-e-precise-products-bad-number-in = ugyldigt tal { $s } i { $line }

engine-e-precise-products-bad-field-in = ugyldigt felt { $s } i { $line }

engine-e-precise-products-bad-antex-epoch = ugyldig ANTEX-epoke { $s }

engine-e-precise-products-bad-offset = ugyldig forskydning { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = efemeridekilden har ingen geocentrisk { $name } ved JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D-fejl RMS { $rms } m (maks. { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS efter tilpasning { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } sat nav | { $epochs_solved }/{ $epochs_total } epoker løst | middel { $mean_n_used } sats, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Enkeltpunktspositionsbestemmelse — 3D-fejl mod opmålt koordinat (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Enkeltpunktspositionsbestemmelse — RMS af residualer efter tilpasning ({ $mean_postfit_rms_m } m i middel)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = RunOutputs array-tilgange kræver NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } er ikke et numerisk array (en liste af tal eller af lister af tal med samme længde)

engine-e-python-is-not-non-empty-list = { $path } er ikke en ikke-tom liste af poster

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-e-python-and-must-be-the-same = i og q skal have samme længde ({ $i } mod { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: ikke fanget (statistik { $statistic } < tærskel { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } (udformning, PRN)-kanaler; højst 256 pr. sweep

engine-python-not-acquired-statistic-threshold = { $code }: ikke fanget (statistik { $statistic } < tærskel { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] kræver `label`

engine-e-python-runs-needs-result = runs[{ $i }] kræver `result`

engine-e-python-must-be-between-and-32 = { $name } skal ligge mellem 0 og 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | seed { $seed } | v{ $engine_version } | kvante vinder { $value }/{ $foms } nøgletal | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } fra { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = ukendt baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = ukendt candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = ADEV taus/værdier skal være endelige og > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | kandidat { $candidate_source } | tidssynkroniserings-holdover { $timing_holdover_s }s mod { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inertial { $inertial_holdover_s }s mod { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | modstandsdygtighed coast { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = RINEX-urfilen angiver tidssystemet { $id }, som denne læser ikke kender (kendte: { $known_clock_time_systems }); afviser den i stedet for at læse dens epoker som GPS-tid

engine-e-realdata-clk-rinex-clock-file-has-satellite = RINEX-urfilen har satellitsystemet { $other } og angiver ikke noget TIME SYSTEM ID; afviser at gætte tidssystemet for dens epoker

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX-urfiler angiver forskellige tidssystemer ({ $s } og { $ts }); afviser at samle dem på én tidsakse

engine-e-realdata-clk-no-as-or-ar-records = ingen AS- eller AR-poster for { $id }

engine-e-realdata-clk-short-circular-row = for kort Circular T-række: { $t }

engine-e-realdata-clk-bad-value-in = ugyldig værdi { $s } i { $t }

engine-e-realdata-clk-no-section-mjd-header-found = ingen MJD-header for Section 1 fundet

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = uafsluttet slut-tag

engine-e-realdata-ion-sdr-unbalanced-closing-tag = ubalanceret slut-tag

engine-e-realdata-ion-sdr-unterminated-tag = uafsluttet tag

engine-e-realdata-ion-sdr-attribute-value-missing = attributværdi mangler

engine-e-realdata-ion-sdr-element-outside-the-document = element uden for dokumentet

engine-e-realdata-ion-sdr-text-outside-the-document = tekst uden for dokumentet

engine-e-realdata-ion-sdr-element-left-open = { $stack } element(er) efterladt åbne

engine-e-realdata-ion-sdr-expected-one-root-element-found = forventede ét rodelement, fandt { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = ukendt frekvensformat { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = kodningen { $other } understøttes ikke

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } strømme: kun filer med én strøm læses

engine-e-realdata-ion-sdr-block-of-cycles-with-header = en blok på { $cycles } cyklusser med en header eller footer gentages; kun en enkelt blok, der spænder over filen, læses

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = blok på { $words_per_chunk } ord à { $word_bytes } bytes

engine-e-realdata-ion-sdr-unsupported-sample-format = ikke-understøttet sampleformat { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = kvantisering { $quantization } i { $packed_bits } pakkede bit pr. sample

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = en samplingfrekvens på { $sample_rate_hz } Hz er ikke et helt multiplum af ratefaktoren { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = en blok indeholder ingen hel lump

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = samples { $start }..{ $v1 } anmodet, filen indeholder { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = ulæselig CRD-version { $f }

engine-realdata-llr-crd-crd-format-version-is-not = CRD-formatversion { $v } understøttes ikke (kun 1 og 2 deler den feltrækkefølge i record-11, som denne læser bygger på)

engine-realdata-llr-crd-unreadable-station-id = ulæseligt stations-id { $f }

engine-realdata-llr-crd-unreadable-time-scale = ulæselig tidsskala { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD-epokens tidsskala { $time_scale } er ikke en af de tre, som formatspecifikationen siger, at analytikere accepterer (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); nægter at læse den som UTC

engine-realdata-llr-crd-unreadable-h4-field = ulæseligt h4-felt { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = ulæseligt felt { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = ulæselig epokehændelse { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = ikke-fysisk flyvetid { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = kan ikke læse normalpunktmappen { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = ingen *.npt-normalpunktfiler i { $dir } — dette scenarie læser rigtige arkiverede målinger og kører ikke uden dem

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = ugyldigt tal '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM har en dimension på nul

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = kodning { $encoding }: en LuGRE-batch er toerkomplement

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bytes: kortere end IQS-headeren

engine-e-realdata-lugre-not-an-iqs-frame = ikke en IQS-frame: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = samplingfrekvens: metadata { $sample_rate_hz } Hz, header { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = kvantisering: metadata { $quantization } bit, header { $quant_bits } bit

engine-realdata-lugre-centre-frequency-metadata-hz-header = centerfrekvens: metadata { $center_freq_hz } Hz, header { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = mellemfrekvens: metadata { $translated_freq_hz } Hz, header { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = antal samples: metadatalayout giver { $layout }, header { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = header/footer: metadata { $header_bytes }/{ $footer_bytes } bytes, format { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = filens længde { $file_len } er ikke header + { $value } sample-bytes + footer

engine-realdata-lugre-field-missing = feltet { $key } mangler

engine-e-realdata-lugre-field-unreadable = feltet { $key } kan ikke læses

engine-realdata-lugre-raw-line = RAW-linje { $v1 }: { $e }

engine-realdata-lugre-acq-line = ACQ-linje { $v1 }: { $e }

engine-realdata-lugre-nav-line = NAV-linje { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK-række { $v1 }: kan ikke læses

engine-e-realdata-lugre-clk-row-columns-expected = CLK-række { $v1 }: { $v } kolonner, forventet 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = parsing af JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = forventede et JSON-objekt på øverste niveau

engine-e-realdata-yunnan-missing-recordtime-array = recordTime-array mangler

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = kan ikke læse EOP-filen { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s skal være endelig og ikke-negativ, fik { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = kan ikke læse EOP-fil af senere udgave { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = TOM, og det med vilje: en række med forudsagt mod endelig kræver en udstedelsesepoke med et KOMPLET { $window_days }-dages tilpasningsvindue bag sig og en publiceret endelig Bulletin B-værdi ved målepoken. Det gældende input ({ $eop_source }) leverer ingen epoke, der har begge dele. Forkort `operational_window_days`, eller angiv en længere reel finals2000A-serie — ingen række fremstilles for at fylde tabellen.

engine-realtime-frame-eop-measured-over-the-real-series = Målt over den reelle serie i brug ({ $eop_source }). Hver række er en ægte prædiktionsfejl: en prognose for T+h dannet ud fra hurtige Bulletin A-rækker ved eller før T, bedømt mod den SENERE PUBLICEREDE endelige Bulletin B-værdi ved T+h. Persistens bedømmes over det identiske epokesæt mod de identiske endelige værdier, så de to kolonner kun adskiller sig i prædiktoren og i intet andet. `improvement_factor` under 1 betyder, at den operationelle prædiktor er VÆRRE end persistens ved den horisont, og rapporteres som sådan.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Målt over et ægte par af to udgaver: den oprindeligt udstedte udgave ({ $eop_source }) indeholder reelle Bulletin A-prædiktioner ud over sit eget datasluttidspunkt, og den arkiverede senere udgave ({ $c }) indeholder de endelige Bulletin B-værdier, som disse datoer til sidst fik. Tre prognoser bedømmes mod den endelige værdi — selve den arkiverede Bulletin A-prædiktion, denne crates tilpasning i operationel stil over den oprindeligt udstedte udgave og persistens ved dataslut.

engine-realtime-frame-eop-empty-and-deliberately-so-later = TOM, og det med vilje: der blev angivet en senere udgave ({ $c }), men ingen dato er både med som Bulletin A-PRÆDIKTION i den oprindeligt udstedte fil ({ $eop_source }) og som endelig Bulletin B-værdi i den senere ved nogen ønsket horisont. Ingen række syntetiseres.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = TOM, og det med vilje. Bedømmelse af en ÆGTE ARKIVERET prædiktion kræver to udgaver af det samme finals2000A-produkt; denne kørsel fik én ({ $eop_source }). Repositoriet leverer ingen arkiveret tidligere udgave, og der fremstilles IKKE en ved at forstyrre den udgave, det har — et syntetiseret arkiv ville gøre hvert tal i denne tabel til en måling af forstyrrelsen. Angiv en ægte arkiveret senere udgave via `eop_finals2000a_later` for at udfylde den. Indtil da findes de ægte fejl mellem forudsagt og endelig, som denne rapport indeholder, i `table5_operational_vs_persistence`, hvor prognosen er crate'ens egen, og referencen er den senere publicerede endelige Bulletin B-værdi.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabel 1: efterbehandling { $c } m ({ $c2 } ms UT1) ↔ realtid { $c3 } m ({ $c4 } ms UT1) | Tabel 2: endeligt gulv { $floor } ms → { $far }-dages { $far2 } ms | budget i alt { $total_m } m ({ $total_time_ns } ns) | L19 løftearm + L18 reelle data (afprøvet mod en uafhængig ekstern reference), OD-kovarians (beregnet ud fra en model)

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

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Målt over et ægte par af to udgaver: den Bulletin A-FORUDSAGTE UT1 i den oprindeligt udstedte fil ({ $eop_source }) differenseret mod den endelige Bulletin B-værdi i den arkiverede senere udgave ({ $c }), ved { $predicted_vs_final } horisont(er).

engine-realtime-frame-eop-empty-and-deliberately-so-an = TOM, og det med vilje: der blev angivet en arkiveret senere udgave ({ $c }), men ingen dato er både med som Bulletin A-PRÆDIKTION i den oprindeligt udstedte fil ({ $eop_source }) og som endelig Bulletin B-værdi i den senere ved nogen ønsket horisont, så der er intet residual mellem forudsagt og endelig at rapportere. Ingen række syntetiseres.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = TOM, og det med vilje: et residual mellem forudsagt og endelig kræver TO udgaver af det samme finals2000A-produkt. Denne kørsel fik én ({ $eop_source }). Dens Bulletin A-prædiktionsrækker gælder fremtidige datoer, som endnu ikke har en endelig Bulletin B-værdi, så residualet findes ikke og kan ikke måles, og intet opfindes her. Angiv en arkiveret senere udgave via `eop_finals2000a_later` for at udfylde denne tabel. Indtil da er den flerdages vækst, der rapporteres i `table2_error_vs_horizon`, PERSISTENS-prædiktoren bedømt over de reelle endelige værdier — en reel målt fejl, men en modelberegnet prædiktor og ikke IERS Bulletin A-prædiktionsresidualet.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = en fartøjsvurdering kræver [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = uddraget er { $excerpt } bytes; grænsen er { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = uddraget indeholder mere end { $MAX_EXCERPT_EPOCHS } epoker; klip det kortere

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = uddraget slutter inde i kalibreringsvinduet på { $calibration_s } s ({ $epochs } epoker): intet blev bedømt

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = ingen UTC-mærket epoke i UBX-loggen

engine-e-receiver-trust-calibration-no-scenario-json-under = ingen scenario.json under { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: tilbageholdt ren Pfa <= { $B1_MAX_PFA } (kalibreret: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } skal være endelig og > 0 (fik { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel skal være endelig og >= 0 (fik { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used skal være mindst 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg skal ligge i [0, 90] (fik { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg skal ligge i (0, 360] (fik { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points skal ligge i [0, 100] (fik { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio skal være endelig og > 1 (fik { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor skal ligge i (0, 100] (fik { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) ligger under scorens degraded_min ({ $degraded_min }): geometrien alene kunne nå det ubetroede bånd

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    { $n_used ->
        [one] geometri { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satellit{ $v6 }
       *[other] geometri { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satellitter{ $v6 }
    }


engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: geometrifradraget klassificeres som en inkonsistens

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: rapporteret, ikke scoret (geometrien er ikke dårlig)

engine-receiver-trust-geometry-not-scored-the-score-deducts = ikke scoret (scoren trækker kun fra over HDOP { $hdop_max }, PDOP { $pdop_max } eller under { $min_used } satellitter)

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] udledt af { $n } logget satellit
       *[other] udledt af { $n } loggede satellitter
    }


engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] som modtageren rapporterer det, { $n } satellit brugt
       *[other] som modtageren rapporterer det, { $n } satellitter brugt
    }


engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = den angivne HDOP { $fmt_dop } afviger fra den HDOP { $fmt_dop2 }, der er udledt af den angivne himmel, ud over tolerancen

engine-receiver-trust-geometry-satellites-in-view-but-not = satellitter i sigte, men ikke sporet ({ $g } af { $in_view } ved eller over { $low_elev_deg } deg): signalmiljø, ikke geometri

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } satellit, færre end { $min_used }
       *[other] { $n } satellitter, færre end { $min_used }
    }


engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } over { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } over { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satellitter bag den angivne horisontprofil

engine-receiver-trust-geometry-every-satellite-in-one-half = alle satellitter i den ene halvdel af himlen (hul { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = forringet af geometri: { $parts } ({ $from }); ikke en inkonsistens

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = loggen indeholder ingen epoker: intet i den kunne læses som { $name } ({ $skipped_records } poster sprunget over som korrupte eller ikke fortolkelige); tjek formatindstillingen

engine-receiver-trust-ingest-gps-week-tow = GPS-uge { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS-uge { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (dato ikke i loggen)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } skal være endelig og >= 0 (fik { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s skal være over 0

engine-e-receiver-trust-live-invalid-session = ugyldig session: { $e }

engine-receiver-trust-live-no-score-could-be-produced = ingen score kunne frembringes: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = ingen GNSS-SDR synchro- eller pvt-post kunne læses ({ $skipped } linjer sprunget over); se integrations/gnss-sdr/README.md for linjeformatet

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = IMU-filen er tom

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: ingen kolonne `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: ingen kolonne `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = IMU-filen indeholder ingen læsbar sample

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis skal være 0, 1 eller 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean skal være endelig

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] loggen har { $n } sample; der kræves mindst { $MIN_SAMPLES } til en Allan-tilpasning
       *[other] loggen har { $n } samples; der kræves mindst { $MIN_SAMPLES } til en Allan-tilpasning
    }


engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = loggens tid går ikke frem

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not =
    { $n ->
        [one] samplingintervallet er ikke ensartet ({ $uneven } af { $n } interval afviger med over 25 %): resample loggen først
       *[other] samplingintervallet er ikke ensartet ({ $uneven } af { $n } intervaller afviger med over 25 %): resample loggen først
    }


engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = loggen er for kort til at danne en Allan-kurve

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = den tidlige hældning for kurven { $name } er { $v }, ikke omkring -0.5: hvid støj dominerer ikke (står sensoren stille?), så dens støjkoefficient er upålidelig

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = kurven { $name } er for kort til at kontrollere dens hældning

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

engine-receiver-trust-machines-novatel-gps-week-tow = GPS-uge { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = ingen BESTPOS-, RANGE- eller RXSTATUS-log kunne læses ({ $skipped } poster sprunget over)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = ingen gyldig RTCM 3-frame blev fundet ({ $skipped } kandidater fejlede CRC)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } skal være endelig og > 0 (fik { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard skal ligge i (0, 1) (fik { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac skal ligge i [0, 1] (fik { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } skal ligge i (0, 1) (fik { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats skal være mindst 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s skal være mindst 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = monitor config: ukendt profil "{ $other }"; kendte: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = monitor config: { $name } skal være endelig og > 0 (fik { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = monitor config: jam_ind_threshold skal være endelig

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = monitor config: mask_deg skal ligge i [-90, 90) (fik { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = monitor config: raim_pfa skal ligge i (0, 1) (fik { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = monitor config: cn0_min_sats skal være mindst 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = monitor config: sats_lost skal være mindst 1

engine-receiver-trust-monitors-the-receiver-own-set-against = modtagerens eget { $self_report_source }-sæt sat op mod Kshanas monitorer; ingen af dem er reference, enighed er ikke afprøvning mod en uafhængig reference

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = modtagerens tidslinje har en ikke-endelig epoketid

engine-e-receiver-trust-monitors-the-log-is-shorter-than = loggen er kortere end kalibreringsvinduet: { $calibration_epochs } epoke(r) før { $cal_s } s (loggen spænder over { $span } s); der kræves mindst 3 for at danne baseline

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } skal ligge i ({ $lo }, { $hi }] (fik { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } gælder kun for kind = "vessel" (kind er "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = kan ikke læse { $path }: WebAssembly-udgaven har intet filsystem; angiv filen inline som `text` eller `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` er ikke gyldig standard-base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: angiv en af `path`, `text` eller `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: angiv kun en af `path`, `text` eller `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } skal være et positivt tal, fik { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = hændelse { $label }: onset_s skal være et ikke-negativt tal

engine-e-receiver-trust-scenario-event-end-must-be-after = hændelse { $label }: end_s skal ligge efter onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg og time_offset_s skal være endelige

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = betroet hele vejen: ingen monitor gav alarm i { $after_cal } epoker efter kalibrering

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = første alarm ved { $t } s; ikke betroet i { $untrusted_epochs } og forringet i { $degraded_epochs } af { $after_cal } epoker efter kalibrering

engine-receiver-trust-scenario-of-stated-events-detected-within = { $events_detected } af { $events_evaluable } angivne hændelser detekteret inden for { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = { $predictions_agreeing } af { $predictions_evaluable } C/N0-forudsigelser inden for { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = tillidsscore laveste { $min }, sidste { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = scenarie { $r } | receiver-trust | { $format_name }-log, { $epochs } epoker over { $duration_s } s | monitorer { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = dette er et { $k }-scenarie, ikke et receiver-trust-scenarie

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } skal være endelig (fik { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: kræver 0 < degraded_min < nominal_min <= 100 (fik { $degraded_min } og { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s skal være endelig og >= 0 (fik { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: kræver 0 <= onset_ratio < full_ratio (fik { $onset_ratio } og { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: vægten for { $m } skal ligge i [0, 100] (fik { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s skal være endelig og positiv

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg skal ligge i (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 skal være endelig og positiv

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m og rho0_kg_m3 skal være endelige og positive

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m skal ligge i [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = reentry (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> spids { $v3 } g ved { $v4 } km, { $velocity_at_peak_deceleration } m/s; opvarmningen topper ved { $velocity_at_peak_heating } m/s; punktmasse (tyngde, krumning, US76) spids { $peak_deceleration_g } g (MODELLED ballistisk, ingen aerotermik)

## src/registry.rs

engine-e-registry-unknown-scenario-id = ukendt scenarie-id: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = TRL-båndet ({ $lo },{ $hi }) er ikke velformet (kræver 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = Et modelberegnet udsagn (kun simulering) kan ikke være repræsentativt over TRL { $MODELLED_TRL_CEILING } (bånd hi={ $hi }); højere TRL er et hul, ikke et simuleringsresultat

engine-representativeness-representativeness-representative-for-trl = Repræsentativitet [{ $status }] — { $claim } (repræsentativ for TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = angivet({ $arch }) x gennemsnitlig kildekvalitet

engine-resilience-score-weakest-rpcf-sub-score-bounded = svageste RPCF-delscore = { $min_sub }; bounded-degradation = { $bounded } (begrænses til niveau 2, hvis ubegrænset)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = ikke-understøttet navigationsposthoved { $head }: en linje, der begynder med '>', er et RINEX 4-posthoved, ikke en RINEX 3-navigationspost

engine-e-rinex-bad-prn-in = ugyldig PRN i { $head }

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4-navigation: forventede et '>'-posthoved, fandt { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4-post { $head } har { $body } linjer, en { $msg }-efemeride kræver 8

engine-e-rinex-rinex-record-is-followed-by = RINEX 4-post { $head } efterfølges af { $body }, ikke { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = ugyldig { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = RINEX-observationsfilen har ingen END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = RINEX-observationsfilen indeholdt ingen epokeposter

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s skal være endelig og > 0 (fik { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s skal være endelig og > 0 (fik { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) må ikke overstige time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps = tidsgitter for stort: { $n } trin overstiger MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); brug et grovere trin eller en kortere varighed

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = samplingfrekvensen er kommensurabel med kodefrekvensen ({ $samples_per_chip } samples/chip, { $offset_from_integer_samples } samples fra et helt tal): kodereplikaen med nulte-ordens-hold kan ikke opløse en kodefaseændring under { $dead_band_chips } chips, så Early/Late-diskriminatoren er en trappefunktion med et dødbånd på én sample i stedet for en trekant, og DLL'en indstiller sig ved den forkerte forsinkelse. Forskyd samplingfrekvensen væk fra det hele multiplum (5 MHz er { $lit_4_8876 } samples/chip; 25 MHz er { $lit_24_4379 }) eller oversampl nok til, at dødbåndet ligger under den kodefasenøjagtighed, du har brug for.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = SGP4-fejlkode { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = ikke-understøttet SigMF core:datatype { $other }: denne læser håndterer de komplekse typer cf32_le, ci16_le og ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: kun enkeltkanals-optagelser læses

engine-e-sigmf-cannot-serialise-sigmf-metadata = kan ikke serialisere SigMF-metadata: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = ugyldigt SigMF-udvidelsesnavneområde { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } annotationsudvidelseskort for { $annotations2 } annotationer

engine-e-sigmf-extension-key-is-not-in = udvidelsesnøglen { $k } ligger ikke i navneområdet { $ns }

engine-e-sigmf-extension-key-is-already-present = udvidelsesnøglen { $k } findes allerede

engine-e-sigmf-global-is-not-an-object = global er ikke et objekt

engine-e-sigmf-annotations-is-not-an-array = annotations er ikke et array

engine-e-sigmf-annotation-is-not-an-object = annotation er ikke et objekt

engine-e-sigmf-invalid-sigmf-metadata-json = ugyldig SigMF-metadata-JSON: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = SigMF-optagelsen angiver ingen positiv core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = SigMF-optagelsen starter ved sample { $start }, ud over de { $data } samples i dataene

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } skal ligge i [0, 90) grader, fik { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } skal være et endeligt tal, fik { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: en canyon kræver width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m skal være positiv, fik { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: canyon-højder og antenna_m skal være ikke-negative

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m skal være positiv, fik { $l }

engine-e-skyline-skyline-table-is-empty = skyline: tabellen er tom

engine-e-skyline-skyline-table-has-rows-over = skyline: tabellen har { $rows } rækker, over grænsen på { $MAX_TABLE_ROWS } rækker

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: tabelazimut { $az } ligger uden for [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: tabelazimutter skal være strengt voksende ({ $az } følger efter { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: mere end { $MAX_SECTORS } sektorer

engine-e-skyline-skyline-the-sector-az-from = skyline: sektoren az_from = { $az_from } til az_to = { $az_to } er tom (en hel cirkel er en tabel eller masken)

engine-e-skyline-skyline-more-than-terrain-points = skyline: mere end { $MAX_TABLE_ROWS } terrænpunkter

engine-e-skyline-skyline-terrain-distance-must-be = skyline: terrænets distance_m skal være positiv, fik { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance }; med felter tilsidesat eller tilføjet af { $user }

engine-skyline-stated-input = Angivet input: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = ukendt skyline-forudindstilling "{ $name }"; kendte forudindstillinger: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = et datablad kræver mindst to Allan-deviationspunkter

engine-e-slot-timing-datasheet-point-must-have-positive = databladpunktet ({ $t }, { $s }) skal have en positiv middelingstid og en positiv Allan-deviation

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s skal være et positivt antal sekunder

engine-e-slot-timing-phase-record-needs-at-least = en faseregistrering kræver mindst 32 samples for at tilpasse en støjmodel; fik { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = faseregistreringen indeholder en ikke-endelig sample

engine-e-slot-timing-the-phase-record-yields-fewer = faseregistreringen giver færre end tre Allan-deviationspunkter

engine-e-slot-timing-must-be-finite-and-non = { $name } skal være endelig og ikke-negativ; fik { $v }

engine-e-slot-timing-the-slot-guard-must-be = slot-guarden skal være en positiv tid

engine-e-slot-timing-sigma-must-be-positive = k_sigma skal være positiv

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset skal være endelig

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k skal være endelig

engine-e-slot-timing-give-exactly-one-of-oscillator = angiv præcis en af oscillator.class, oscillator.preset, oscillator.datasheet eller oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = ukendt oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = ukendt oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = standard for klassen { $c }: sigma_y(1 s) fra { $c2 }; rødstøjsgulv syntetiseret to og fire dekader under det (en antagelse, ikke en måling)

engine-slot-timing-fitted-to-the-allan-deviation = tilpasset til Allan-deviationsmaksima i { $document }, skaleret til at ligge ved eller over hvert punkt

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] tilpasset til den overlappende Allan-deviation for en registrering på { $n_samples } sample ved { $tau0_s } s, i IEEE Std 1139-frekvensmodulationsbasis
       *[other] tilpasset til den overlappende Allan-deviation for en registrering på { $n_samples } samples ved { $tau0_s } s, i IEEE Std 1139-frekvensmodulationsbasis
    }


engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } kilde): guard { $c } ns ved k={ $k_sigma } brydes { $fmt_s } efter en positionsbestemmelse ({ $fmt_s2 } tilbage); positionsbestemmelse mindst hver { $fmt_s3 } ({ $fixes_per_day } pr. dag); dominerende led: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epoke '{ $s }' skal være YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = epoke '{ $s }': ugyldig { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb skal være endelig

engine-e-solar-system-table-must-be-auto-table1 = table skal være auto, table1 eller table2; fik '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = ingen efemeride for linket fra { $name } til { $name2 } ved JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = epoke JD { $jd } TDB ligger uden for 3000 f.Kr. til 3000 e.Kr., Standish-tabellernes område

engine-e-solar-system-track-points-must-be-to = track_points skal være 8 til 2000; fik { $n_track }

engine-e-solar-system-unknown-observer-body = ukendt observatørlegeme '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies skal angive mindst ét legeme

engine-e-solar-system-unknown-body = ukendt legeme '{ $n }'

engine-e-solar-system-no-position-for-at-jd = ingen position for { $name } ved JD { $jd } TDB (Pluto kun 1800 e.Kr. til 2050 e.Kr.)

engine-e-solar-system-no-standish-elements-for = ingen Standish-elementer for { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliocentrisk tilstand læst af motorens egen læser

engine-e-solar-system-unknown-link-body = ukendt linklegeme '{ $from }'

engine-e-solar-system-unknown-link-body-2 = ukendt linklegeme '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = et link kræver to forskellige legemer; fik { $name }

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

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  længde { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }link { $from } -> { $to }: envejs { $one_way_light_time_s } s, tovejs { $two_way_light_time_s } s, Shapiro { $l } us, Sol { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = epoke { $input } · { $standish_table } · positioner fra Standish-elementerne

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = epoke kræver 6 tidsfelter, fik { $tokens }

engine-e-sp3-bad-second = ugyldigt sekund: { $tokens }

engine-e-sp3-record-needs-values-missing-column = posten kræver 4 værdier, kolonne { $v1 } mangler

engine-e-sp3-bad-number = ugyldigt tal: { $field }

engine-e-sp3-empty-sp3-input = tomt SP3-input

engine-e-sp3-first-line-is-not-an = første linje er ikke en SP3-header: { $first }

engine-e-sp3-unsupported-sp3-version-in = ikke-understøttet SP3-version i { $first }

engine-e-sp3-missing-epoch-count-on-header = epokeantal mangler på headerlinje 1

engine-e-sp3-record-has-no-satellite-id = posten har intet satellit-id: { $line }

engine-e-sp3-position-record-before-any-epoch = positionspost før nogen epokeheader

engine-e-sp3-sp3-file-contained-no-epoch = SP3-filen indeholdt ingen epokeposter

engine-e-sp3-bad-accuracy-exponent-in = ugyldig nøjagtighedseksponent { $f } i { $line }

engine-e-sp3-bad-header-accuracy = ugyldig header-nøjagtighed { $t }

engine-e-sp3-short-line = kort %f-linje { $line }

engine-e-sp3-bad-base-in = ugyldig %f-base i { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = version overstiger 3 bit

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID overstiger 11 bit (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count overstiger 14 bit (0..=16383)

engine-e-space-packet-data-field-must-be-at = datafeltet skal være mindst ét oktet

engine-e-space-packet-data-field-exceeds-65536-octets = datafeltet overstiger 65536 oktetter

engine-e-space-packet-packet-shorter-than-the-octet = pakken er kortere end headeren på 6 oktetter: { $bytes } bytes

engine-e-space-packet-declared-data-length-header-octets = angivet datalængde { $data_len } (+6 header) = { $total } oktetter, men bufferen er { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC coarse-oktetter { $coarse_octets } uden for 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = CUC fine-oktetter { $fine_octets } uden for 0..=3 (det udvidede P-field understøttes ikke)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-field { $p }: udvidet P-field understøttes ikke

engine-e-space-packet-field-time-code-id-is = P-field { $p }: tidskode-id { $id } er ikke CUC

engine-e-space-packet-field-is-not-cds-field = P-field { $p } er ikke et CDS P-field

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-field { $p }: reserveret sub-ms-kode 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC coarse { $coarse } passer ikke i { $c } oktetter

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] CUC fine { $fine } passer ikke i { $n } oktet
       *[other] CUC fine { $fine } passer ikke i { $n } oktetter
    }


engine-e-space-packet-cds-days-do-not-fit = CDS-dage { $days } passer ikke i { $f } oktetter

engine-e-space-packet-cds-ms-of-day-above = CDS ms af døgnet { $ms_of_day } over 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS sub-millisekund { $submillis } over { $max_sub }

engine-e-space-packet-time-code-format-and-value = tidskodeformat og -værdi hører til forskellige koder

engine-e-space-packet-time-code-no-field-octet = tidskode: intet P-field-oktet

engine-e-space-packet-time-code-needs-octets-present = tidskoden kræver { $end } oktetter, { $bytes } til stede

engine-e-space-packet-time-code-format-differs-from = tidskodeformatet afviger fra det implicitte P-field

engine-e-space-packet-the-format-has-time-code = formatet har et tidskodefelt; intet angivet

engine-e-space-packet-the-format-has-no-time = formatet har intet tidskodefelt

engine-e-space-packet-ancillary-data-is-octets-the = ancillary-data er { $ancillary } oktetter; formatet siger { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = en sekundær header skal indeholde mindst ét oktet

engine-e-space-packet-secondary-header-needs-octets-present = sekundær header kræver { $end } oktetter, { $bytes } til stede

engine-e-space-packet-the-format-has-secondary-header = formatet har en sekundær header; ingen angivet

engine-e-space-packet-the-format-has-no-secondary = formatet har ingen sekundær header

engine-e-space-packet-secondary-header-flag-disagrees-with = flaget for sekundær header { $v1 } stemmer ikke med formatet

engine-e-space-packet-data-field-shorter-than-the = datafeltet er kortere end PEC

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } matcher ikke pakkens CRC { $crc16_ccitt_false }

engine-e-space-packet-nothing-to-segment-empty-user = intet at segmentere: tomme brugerdata

engine-e-space-packet-max-user-octets-must-be = max_user_octets skal være mindst 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count overstiger 14 bit (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } hvor { $a } var forventet

engine-space-packet-sequence-count-repeated = sekvenstæller { $sequence_count } gentaget

engine-space-packet-sequence-count-gap-after-packet = hul i sekvenstælleren: { $sequence_count } efter { $last } ({ $v2 } pakke(r) mangler)

engine-space-packet-sequence-count-out-of-order = sekvenstæller i forkert rækkefølge: { $sequence_count } efter { $last }

engine-space-packet-packet-with-no-unit-open = { $f }-pakke uden åben enhed

engine-space-packet-packet-while-unit-is-open = { $f }-pakke mens en enhed er åben

engine-e-space-packet-packet = pakke { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = sekvensen slutter med en enhed, der stadig er åben (ingen sidste pakke)

engine-e-space-packet-apid-must-be-in-2047 = apid skal ligge i 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count skal være >= 1

engine-e-space-packet-data-len-must-be-in = data_len skal ligge i 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = intern fejl: encode/decode-rundtur stemmer ikke

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: indrammede { $packet_count } CCSDS-133.0 { $v2 }-pakke APID { $apid }, { $total_bytes } oktetter i alt, rundtur præcis ({ $round_trip_ok })
       *[other] space-packet: indrammede { $packet_count } CCSDS-133.0 { $v2 }-pakker APID { $apid }, { $total_bytes } oktetter i alt, rundtur præcis ({ $round_trip_ok })
    }


## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 skal være endelig og positiv

engine-e-space-weather-f107a-must-be-finite-and = f107a skal være endelig og positiv

engine-e-space-weather-kp-must-be-in = kp skal ligge i [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km må ikke være tom

engine-e-space-weather-altitude-km-must-be-finite = højde { $h } km skal være endelig og positiv

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; tæthed x{ $density_activity_factor } ved { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: en { $what }-jammer kræver en positiv bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: en chirp-jammer kræver en positiv sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to angiver et ukendt bånd { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: angiv enten received_power_dbw eller eirp_dbw med en positiv range_m (ikke begge)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s skal ligge senere end on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: samplingfrekvensen skal være positiv

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } skal være en potens af to, mindst 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } samples er færre end ét segment på { $nfft } punkter

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } skal være en potens af to, mindst 16

engine-e-spectrum-cannot-read-recording-meta-path = kan ikke læse optagelsens meta_path { $meta_path }: { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = kan ikke læse optagedata { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz skal være positiv

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: modulationen { $m } kan ikke vælges (kun galileo-e1 tager "mboc" eller "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: signalet { $sig } findes ikke i biblioteket med signalforudindstillinger ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: et signal fra en forudindstilling har sin egen modulation; udelad `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: signalet { $sig } angiver ingen modtaget effekt; angiv signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: et brugerdefineret bånd kræver `modulation`, f.eks. "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: et brugerdefineret bånd kræver signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: angiv enten `signal` eller `centre_mhz`, ikke begge

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: angiv rx_bandwidth_mhz (ingen hovedlobe kunne findes)

engine-e-spectrum-duration-must-be-at-least = duration_s skal være mindst ét step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } tidsrækker er mere end de tilladte 5000

engine-e-spectrum-at-most-extra-panels = højst 8 ekstra paneler

engine-e-spectrum-panel-need-max-mhz-min = panel { $name }: kræver f_max_mhz > f_min_mhz og 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = grid: kræver f_max_mhz > f_min_mhz og 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = scenarie-spektrum | { $bands } bånd | { $jammers } jammere | støjgulv { $n0_db } dBW/Hz | dårligste bånd { $name } min. C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = scenarie-spektrum | ingen bånd | støjgulv { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples skal ligge mellem 10 og 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: brug cf32_le eller ci16_le

engine-spectrum-frequency-across-time-down-colour = frekvens vandret, tid lodret, farve = effektspektraltæthed (dBW/Hz); støjgulv { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = hvert panel har sit eget frekvensområde, én tidslinje nedad, én farveskala (dBW/Hz); støjgulv { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = referencesystemet { $other } har ingen understøttet NAIF-kode

engine-e-spk-writer-segment-name-longer-than-40 = segmentnavnet er længere end 40 tegn: { $name }

engine-e-spk-writer-segment-name-has-non-printing = segmentnavnet har ikke-udskrivbare tegn: { $name }

engine-e-spk-writer-bad-target-for-centre = ugyldigt mål { $target } for centrum { $centre }

engine-e-spk-writer-degree-outside-27 = grad { $degree } uden for 1..=27

engine-e-spk-writer-type-13-degree-is-not = type 13-grad { $degree } er ikke ulige

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] { $states } tilstande for { $n } epoke
       *[other] { $states } tilstande for { $n } epoker
    }


engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } tilstand; grad { $degree } kræver { $value }
       *[other] { $n } tilstande; grad { $degree } kræver { $value }
    }


engine-e-spk-writer-descriptor-start-is-not-before = beskrivelsens start ligger ikke før dens slutning

engine-e-spk-writer-epochs-are-not-strictly-increasing = epokerne er ikke strengt voksende

engine-e-spk-writer-the-epochs-do-not-cover = epokerne dækker ikke beskrivelsens interval

engine-e-spk-writer-type-or-13-segment-carries = et segment af type 9 eller 13 indeholder tilstande, ikke poster

engine-e-spk-writer-type-segment-needs-at-least = et segment af type 3 kræver mindst én post

engine-e-spk-writer-type-degree-outside-27 = type 3-grad { $degree } uden for 0..=27

engine-e-spk-writer-type-interval-length-is-not = type 3-intervallængden { $intlen } er ikke positiv

engine-e-spk-writer-type-record-has-coefficients-expected = type 3-post { $i } har { $value } koefficienter, forventet { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = beskrivelsens start ligger efter dens slutning

engine-e-spk-writer-descriptor-starts-before-the-first = beskrivelsen starter før den første post

engine-e-spk-writer-descriptor-ends-after-the-last = beskrivelsen slutter efter den sidste post

engine-e-spk-writer-type-segment-carries-records-not = et segment af type 3 indeholder poster, ikke epoker eller tilstande

engine-e-spk-writer-type-21-segment-needs-at = et segment af type 21 kræver mindst én differenslinje

engine-e-spk-writer-difference-line-size-is-not = differenslinjens størrelse { $dlsize } er ikke 4 MAXDIM + 11 med MAXDIM i 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = differenslinjer af forskellig størrelse

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] { $epochs } epoker for { $n } differenslinje
       *[other] { $epochs } epoker for { $n } differenslinjer
    }


engine-e-spk-writer-difference-line-epochs-are-not = differenslinjernes epoker er ikke strengt voksende

engine-e-spk-writer-the-last-difference-line-ends = den sidste differenslinje slutter før beskrivelsen

engine-e-spk-writer-zero-step-size-in-difference = trinstørrelse nul { $j } i differenslinje { $i }

engine-e-spk-writer-type-21-segment-carries-difference = et segment af type 21 indeholder differenslinjer, ikke tilstande

engine-e-spk-writer-an-spk-needs-at-least = en SPK kræver mindst ét segment

engine-e-spk-writer-segment = segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = kommentarlinjen har ikke-udskrivbare tegn: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = kommentarer kræver { $nchars } tegn; { $v1 } er reserveret (hæv ncomch)

engine-e-spk-writer-difference-line-orders-out-of = differenslinjens ordener { $kqmax1 } { $kq } uden for intervallet

engine-e-spk-writer-zero-step-size-at-index = trinstørrelse nul ved indeks { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } uden for segmentet [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = type 3-segmentet { $name } er for kort

engine-e-spk-writer-type-segment-words-for-rsize = type 3-segmentet { $name }: { $nw } ord for N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = type 21-segmentet { $name } er for kort

engine-e-spk-writer-type-21-segment-words-for = type 21-segmentet { $name }: { $nw } ord for N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segmentet { $name } er for kort

engine-e-spk-writer-segment-words-for = segmentet { $name }: { $nw } ord for N = { $n }

engine-e-spk-writer-segment-is-in-frame = segmentet { $name } ligger i referencesystemet { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = SPK-centerkæden ender ikke

engine-e-spk-writer-no-spk-chain-connects-and = ingen SPK-kæde forbinder { $target } og { $observer } ved ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = epoken { $s } er ikke YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = tidssystemet { $other } understøttes ikke (UTC eller TDB)

engine-e-spk-writer-centre-has-no-supported-naif = centrum { $other } har intet understøttet NAIF-id

engine-e-spk-writer-oem-segment-has-no-data = OEM-segmentet { $name } har ingen datalinjer

engine-e-spk-writer-oem-segment-no = OEM-segment { $idx }: ingen { $k }

engine-e-spk-writer-no-export-settings-for-oem = ingen eksportindstillinger for OEM-segment { $idx }

engine-e-spk-writer-oem-data-line-has-fields = OEM-datalinjen har { $f } felter: { $line }

engine-e-spk-writer-oem-value = OEM-værdi { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } OEM-segmenter for { $exports } eksportindstillinger

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (fusioneret) — lag: { $fired }

engine-spoof-detect-single-layer-indication-below-the = indikation fra ét lag ({ $fired }) under den fusionerede tærskel — bekræftelse kræves

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg skal være positiv, fik { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = panel { $i }: arealet skal være >= 0

engine-e-srp-boxwing-panel-outside = panel { $i }: { $name } = { $c } uden for [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = panel { $i }: absorption + spejlende + diffus = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = panel { $i }: nul-normal/akse

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = ECOM2-normalmatricen er singulær eller dårligt konditioneret

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 min

engine-ssv-check-mod4-min = { $key } MOD4 min

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = heo-forudindstilling

engine-e-ssv-check-lunar-preset = lunar-forudindstilling

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = en formation kræver mindst én deputy

engine-e-ssv-formation-duration-min-and-step-must = duration_min og step_s skal være positive

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = ingen signaler for de valgte konstellationer og bånd

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = ukendt antenne `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = mønster-CSV er tom

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` er ikke et tal i mønster-CSV

engine-e-ssv-scenario-pattern-csv-row-has-columns = mønster-CSV-rækken `{ $l }` har { $f } kolonner, forventet { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" kræver præcis én af pattern_csv og pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` er ikke booklet, parametric eller table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: angiv cn0_min_dbhz eller weak_signal, ikke begge

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = bærebølgesløjfen kan ikke holde den angivne Doppler-rate ved nogen C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` er ikke acquisition, tracking eller both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz skal være endelig

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: angiv præcis én af preset og orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` er ikke leo, meo, geo, heo eller lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: angiv præcis én af duration_min og duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } skal være positiv

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg kræver 1 til 8 endelige forskydninger

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd må ikke være negativ

engine-e-ssv-scenario-give-exactly-one-of-shell = angiv præcis én af [shell], [trajectory] og [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] kræver en [navigation]-tabel for chief

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include og constellations.bands må ikke være tomme

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km skal være over 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels over 5 understøttes ikke

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna skal være hemisphere eller omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = shell-sweepet understøtter kun booklet-sendemønsteret (et formet mønster kræver trajectory-sweepet)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] gælder for en [trajectory], ikke for en [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: angiv præcis én af preset og orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` er ikke leo, meo, geo, heo eller lunar-transfer

engine-e-ssv-scenario-unknown-preset = ukendt forudindstilling

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv-skal { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv-navigation: positions-RMS { $p } samlet, { $p2 } inden for GNSS-banerne, { $p3 } over; længste hul { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = deputy ved { $offset_deg } deg ({ $baseline_km } km): relativ RMS { $rel_rms_filter_m } m filtreret mod { $rel_rms_from_absolute_m } m fra absolutte positionsbestemmelser

engine-ssv-scenario-combined-max-outage-min = { $band } kombineret 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (maks. udfald { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv-bane { $perigee_alt_km } til { $apogee_alt_km } km højde: { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min og step_min skal være positive

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } skal være et positivt tal, fik { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = ingen standardpakke med navnet `{ $id }`; pakkerne er: { $ids }

engine-e-standards-pack-pack-manifest = pakkemanifest: { $e }

engine-e-standards-pack-test-duplicate-id = test { $id }: dubleret id

engine-e-standards-pack-test-scenario-is-not-in = test { $id }: scenariet `{ $s }` findes ikke i pakken

engine-e-standards-pack-test-scored-test-needs-bar = test { $id }: en bedømt test kræver en tærskel

engine-e-standards-pack-test-test-that-needs-input = test { $id }: en test, der kræver input, har ingen tærskler

engine-e-standards-pack-test-give-either-scenario-or = test { $id }: angiv enten `scenario` eller `needs_input`, ikke begge og ikke ingen af dem

engine-e-standards-pack-test-supports-unknown-row = test { $id }: leverer belæg for en ukendt række `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id }: ukendt op `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id }: tærsklen på { $pointer } kræver præcis én af `value` og `against`

engine-e-standards-pack-row-duplicate-id = række { $id }: dubleret id

engine-e-standards-pack-row-asks-must-be-short = række { $id }: `asks` skal være en kort omskrivning

engine-e-standards-pack-row-no-test-supports-it = række { $id }: ingen test leverer belæg for den

engine-standards-pack-not-scored-needs-input = ikke bedømt: kræver input ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = studiet har ingen scenarier at køre

engine-e-study-cannot-read-scenario = kan ikke læse scenariet { $path }: { $e }

engine-e-study-scenario-failed = scenariet { $path } mislykkedes: { $e }

engine-e-study-scenario-produced-unparseable-json = scenariet { $path } gav JSON, der ikke kan fortolkes: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = ugyldigt suite-manifest: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = ukendt kilde `{ $o }`: brug `adsb` eller `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } er { $len } bytes, over grænsen på { $limit } bytes

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` er ikke et ISO-8601 UTC-tidspunkt

engine-e-surface-invalid-receiver-trust-session = ugyldig receiver-trust-session: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` er ikke et ISO-8601 UTC-tidspunkt

engine-e-surface-dataset-custom-needs-licence-licence = datasættet `custom` kræver licence, licence_url og attribution

engine-e-surface-at-least-one-map-is = mindst ét kort kræves

engine-e-surface-epoch = epoch: { $e }

engine-e-surface-not-utf = { $suffix }: ikke UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = ukendt scenarietype `{ $k }`; typelisten nævner alle typer

engine-surface-is-not-bundled-it = `{ $name }` er ikke indbygget: den { $why }

engine-surface-no-bundled-scenario-named-the = intet indbygget scenarie med navnet `{ $name }`; eksempellisten nævner de { $v1 }, der er det

engine-e-surface-invalid-toml = ugyldig TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = ukendt eksportformat `{ $format }`; forventet et af czml, kml, geojson, stk eller sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps giver { $opts } billeder, og højst { $MAX_ANIMATION_FRAMES } returneres; sænk fps eller duration_s, eller skriv en længere sekvens med kommandolinjen

engine-e-surface-scenario-run-failed = scenariekørslen mislykkedes: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log angiver en fil `path`; angiv loggen som `text` eller `base64` (denne flade læser ingen filer)

engine-e-surface-max-sp-errors-must-be = max_sp_errors må højst være 20

engine-e-surface-frames-must-be-to = frames skal være 1 til { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 skal være 0 til 99

engine-e-surface-runs-given-at-most-per = { $runs } kørsler angivet; højst { $MAX_COMPLIANCE_RUNS } pr. rapport

engine-e-surface-the-runs-total-bytes-the = kørslerne udgør i alt { $total } bytes; grænsen for én rapport er { $max_bytes }

engine-e-surface-result-files-given-at-most = { $results } resultatfiler angivet, højst 256

engine-e-surface-result-is-not-json = resultat { $v1 } er ikke JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = ukendt format `{ $o }`: brug `prometheus`, `cef`, `leef`, `otlp` eller `mqtt`

engine-e-surface-unknown-imu-format-use-csv = ukendt IMU-format `{ $o }`: brug `csv` eller `euroc`

engine-e-surface-unknown-axis-use-or = ukendt akse `{ $o }`: brug `x`, `y` eller `z`

engine-e-surface-id-must-be-to-64 = id skal være 1 til 64 udskrivbare ASCII-tegn uden mellemrum

engine-surface-fitted-from-stationary-imu-log = tilpasset ud fra en IMU-log i hvile, sha256 { $sha }, akse { $axis }, Allan-estimator

engine-e-surface-unknown-input-kind-use-result = ukendt input_kind `{ $o }`: brug `result` eller `jsonl`

engine-e-surface-the-input-holds-no-trust = inputtet indeholder ingen trust-epoke

engine-e-surface-the-reply-is-over-the = svaret er over grænsen på { $max_bytes } bytes; send færre epoker, eller lad `syslog_all` være slået fra

engine-e-surface-otlp-needs-build-with-the = otlp kræver en bygning med featuren `otlp`

engine-e-surface-the-pack-and-token-total = pakken og tokenet udgør i alt { $total } bytes; grænsen er { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = tidsstempel-tokenet er tomt

engine-e-surface-must-be-64-lower-case = { $what } skal være 64 hex-cifre med små bogstaver

engine-e-surface-must-be-32-bytes = { $what } skal være 32 bytes

engine-surface-verified-against-the-public-key = VERIFIED mod den offentlige nøgle, du angav (underskriverens fingeraftryk { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, MEN UNDERSKRIVEREN ER IKKE FASTLÅST: hashes og signatur er konsistente med nøglen { $fp }, som pakken selv angiver. Angiv underskriverens offentlige nøgle, indhentet fra underskriveren ad en anden vej, for at fastslå, hvem der har underskrevet den.

engine-e-surface-files-must-be-json-object = files skal være et JSON-objekt med navn til indhold

engine-e-surface-pack-has-at-most-64 = en pakke har højst 64 filer

engine-e-surface-file-name-must-be-plain = filnavnet `{ $k }` skal være et almindeligt navn

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` er ikke gyldig standard-base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = ukendt sweep-parameter: { $other }

engine-e-sweep-unknown-sweep-metric = ukendt sweep-metrik: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep kræver mindst én akse

engine-e-sweep-sweep-key-is-malformed = sweep-nøglen `{ $key }` er fejlformet

engine-e-sweep-sweep-key-follows-an-array = sweep-nøglen `{ $key }`: `{ $part }` følger efter et array, så det skal være et indeks

engine-e-sweep-unreachable = uopnåelig

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] sweep-nøglen `{ $key }`: indeks { $i } ligger uden for arrayets eneste post ({ $n })
       *[other] sweep-nøglen `{ $key }`: indeks { $i } ligger uden for arrayets { $n } poster
    }


engine-e-sweep-sweep-key-parent-is-not = sweep-nøglen `{ $key }`: forælderen til `{ $part }` er ikke en tabel

engine-e-sweep-sweep-key-no-field = sweep-nøglen `{ $key }`: intet felt `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = sweep-nøglen `{ $key }`: forælderen til `{ $last }` er ikke en tabel

engine-e-sweep-sweep-key-no-field-2 = sweep-nøglen `{ $key }`: intet felt `{ $last }`

engine-e-sweep-metric-no-field-in-result = metrik `{ $path }`: intet felt `{ $part }` i resultatet

engine-e-sweep-metric-value-is-not-number = metrik `{ $path }`: værdien er ikke et tal

engine-e-sweep-sweep-node-serialize = serialisering af sweep-knude: { $e }

engine-e-sweep-sweep-node-result-parse = fortolkning af sweep-knudens resultat: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = sweep-aksen `{ $key }`: deklareret enhed `{ $d }`, men den sweepede pakke angiver `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = sweep-arbejdstråden gik i panik

engine-e-sweep-generic-sweep-needs-at-least = et generisk sweep kræver mindst én akse

engine-e-sweep-generic-sweep-needs-at-least-2 = et generisk sweep kræver mindst én metrik

engine-e-sweep-generic-sweep-base-must-carry = et generisk sweeps `base` skal selv have sin `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = et generisk sweep kan ikke sweepe et andet sweep

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = ukendt oscillator { $oscillator }; forventet en af { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day og temperature_coeff_per_k skal være endelige

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s skal være endelig og positiv

engine-e-telecom-timing-duration-must-be-finite-and = duration_s skal være endelig og mindst tolv samples lang

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s skal ligge i [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns skal være endelig og >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = temperatur- og frekvensforskydningsinput skal være endelige (periode > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = optegnelsen ville overstige 5 000 000 samples; hæv sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = en tidsfejlsserie kræver mindst 13 samples, fik { $pairs }

engine-e-telecom-timing-every-time-and-time-error = hver time_s og time_error_ns skal være endelig

engine-e-telecom-timing-time-must-increase = time_s skal være voksende

engine-e-telecom-timing-the-series-must-be-uniformly = serien skal være ensartet samplet: trin { $v1 } er { $d } s, det første er { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV-linje { $v1 } er ikke `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = masken er defineret gennem et { $lit_0_1 } Hz lavpasfilter, som denne motor kun anvender ved sampleintervaller på { $MAX_FILTER_DT_S } s eller derunder; denne optegnelse er samplet hver { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = angiv enten [holdover] eller [series], ikke begge

engine-e-telecom-timing-give-either-series-samples-or = angiv enten series.samples eller series.csv_path, ikke begge

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days skal være endelig og >= 0

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: maks.|TE| { $max_abs } ns over { $v2 } s; { $masks } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = ukendt --format `{ $f }` (cef eller leef)

engine-e-telemetry-cli-unknown-option = ukendt tilvalg `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input og --result er alternativer

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: ingen adresse

engine-telemetry-cli-warning-metrics-is-served-without = advarsel: /metrics leveres uden autentificering på { $addr }; bind til localhost, eller sæt den bag din egen adgangskontrol

engine-e-telemetry-cli-bind = bind { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = leverer http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp og --syslog-tcp er alternativer

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting gælder for --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: en emnedel må ikke være tom, må ikke indeholde #, + eller en indledende /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp kræver en bygning med `--features otlp`

engine-telemetry-cli-warning-input-line = advarsel: inputlinje { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = kan ikke åbne { $p }: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] advarsel: { $n } MQTT-meddelelse blev ikke leveret
       *[other] advarsel: { $n } MQTT-meddelelser blev ikke leveret
    }


## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint skal starte med http://

engine-e-telemetry-otlp-endpoint-has-no-host = endpoint har ingen vært

engine-e-telemetry-otlp-resolve = opslag af { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = ingen adresse for { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = advarsel: otlp-eksport mislykkedes: { $e }

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

engine-e-telemetry-sample-is-not-number = `{ $k }` er ikke et tal

engine-e-telemetry-sample-is-not-finite = `{ $k }` er ikke endelig

engine-e-telemetry-sample-missing = mangler `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } uden for 0..=100

engine-e-telemetry-sample-missing-state = mangler `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` er ikke et array

engine-e-telemetry-sample-entry-has-no-name = en `{ $key }`-post har intet navn

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` mangler eller er ikke et endeligt tal

engine-e-telemetry-sample-position-is-not-an-object = `position` er ikke et objekt eller null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` mangler eller er ikke en streng

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` er ikke et endeligt tal >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` er ikke en streng

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` er ikke en boolsk værdi

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

engine-e-telemetry-syslog-host-is-bytes-syslog-host = værten er { $host } bytes; et syslog-værtsnavn er højst 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = værten skal være udskrivbar ASCII uden mellemrum

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } mod { $w } (kan ikke repræsenteres som f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: til stede, forventet fraværende

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: fraværende, forventet til stede

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } skal være endelig

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu skal være endelig og ikke-negativ

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: linje { $v1 }: ikke MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: ingen AR-poster for { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = ukendt serieformat { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } skal være endelig

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s skal give 16 til 20000 målinger

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } forskydning { $ns } ns (Sagnac { $ns2 } ns, ionosfære { $ns3 } ns); kombineret u { $ns4 } ns (type A { $ns5 } ns ved { $averaging_s } s); { $series } reelle serier (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = ikke-ASCII-tegn i TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE afkortet under læsning af { $what } (kolonne { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } er for kort til en kontrolsum i kolonne 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } har intet kontrolsumciffer i kolonne 69

engine-e-tle-tle-checksum-mismatch-column-69 = TLE { $label }: kontrolsummen passer ikke; kolonne 69 angiver { $want }, beregnet { $got }

engine-e-tle-not-tle-line = ikke en TLE-linje 1: { $line1 }

engine-e-tle-not-tle-line-2 = ikke en TLE-linje 2: { $line2 }

engine-e-tle-invalid-in-tle = ugyldig { $what } i TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = ugyldigt epokeår i TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = ugyldigt katalognummer i TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = inklinationen er uden for intervallet [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = excentriciteten er uden for intervallet [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = ikke-positiv middelbevægelse: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = ugyldig mantisse for { $what } i TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = ugyldig eksponent for { $what } i TLE: { $exp }

engine-tle-satellite-line-only-element-set = satellit { $satnum }: et elementsæt med kun linje 2 er læst som analytiske Kepler-elementer (to-legeme) — linje 1's træk/B* og de sekulære SGP4-led mangler, så denne bane driver væk fra en ægte SGP4-tilpasning, jo længere den er fra epoken; angiv den tilhørende linje 1 for SGP4-nøjagtighed

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: C/N0-profilen kræver en positiv epoke og varighed

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: C/N0-profilen ville kræve mere end { $MAX_DETECTOR_STEPS } detektortrin ({ $total } s ved { $epoch_s } s pr. epoke); forkort ramp_duration_s, eller forlæng predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } skal være endelig

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } skal være positiv (fik { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips skal være under { $lit_1_9 } chips (fik { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio skal være mindst 1 (fik { $pullin_bandwidth_ratio }) — en sløjfe, der trækkes ind igen med en SMALLERE båndbredde, end den sporer med, ville vende hysteresen om

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s må ikke være negativ

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) må ikke overstige cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } må ikke være tom

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } har { $axis } poster; loftet er { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } indeholder en ikke-endelig værdi

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: bekræftelsesopholdene skal være mindst 1 epoke

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = der kræves mindst otte samples

engine-e-twstft-budget-samples-must-increase-in-time = samples skal være voksende i tid

engine-e-twstft-budget-samples-must-be-on-regular = samples skal ligge på et regelmæssigt gitter

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } rækker: { $validated } eksternt afprøvet, { $modelled } modelleret, { $partner_owned } hos partner.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = Det komplette, maskinkontrollerede evidensregister: **{ $total } rækker — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. En række må kun være VALIDATED med en uafhængig ekstern reference (matrixens invarianttests gennemtvinger dette). De samme data, med klikbare links pr. række til hver test, hvert modul og hver committet fixture, er *Validation ledger* på https://kshana.dev. Se [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) for, hvorfor hver Modelled-række ikke er afprøvet eksternt.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } funktioner mærket MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json er ikke JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json er ikke JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] kræver `label`

engine-wasm-runs-needs-result = runs[{ $i }] kræver `result`

engine-wasm-results-json-is-not-json = results_json er ikke et JSON-array af strenge: { $e }

engine-wasm-maps-json-must-be-json = maps_json skal være et JSON-array af strenge: { $e }

engine-wasm-plans-json-is-not-json = plans_json er ikke et JSON-array af strenge: { $e }

engine-wasm-options-json-is-not-json = options_json er ikke JSON: { $e }

engine-wasm-input-is-about-bytes-over = inputtet er ca. { $b64 } bytes, over grænsen på { $v2 } bytes

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Sekventiel terrænreferenceret navigation (rekursiv SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = frit inertialt drift (vokser)

engine-altpnt-sequential-terrain-matched-bounded = terrænmatchet (afgrænset)

engine-altpnt-sequential-waypoint-full-scale = waypoint →    fuld skala { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Kshana-kørselsrapport

engine-advanced-report-meta = Type <code>{ $kind }</code> · motor { $engine } · scenarie <code>{ $scenario }</code> (filens digest { $digest }…)

engine-advanced-report-toc-summary = 1 Resumé

engine-advanced-report-toc-inputs = 2 Input

engine-advanced-report-toc-results = 3 Resultater

engine-advanced-report-toc-aggregation = 3a Aggregering

engine-advanced-report-toc-companions = 3b Animation og eksporter

engine-advanced-report-toc-events = 4 Hændelser

engine-advanced-report-toc-labels = 5 Verifikationsmærker

engine-advanced-report-toc-not-modelled = 6 Ikke modelleret

engine-advanced-report-toc-reproducibility = 7 Reproducerbarhed

engine-advanced-report-h-summary = 1. Resumé for ledelsen

engine-advanced-report-honesty-label = <strong>Ærlighedsmærke</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Anvendte funktioner:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (der støttes på, men ikke leveres); se afsnit 5.

engine-advanced-report-member-runs = <strong>Medlemskørsler:</strong> { $n }, aggregeret i afsnit 3a.

engine-advanced-report-h-inputs = 2. Input

engine-advanced-report-inputs-note = Hvert felt, som scenariefilen angiver, flettet ud til sin sti. Enhederne kommer fra resultatets <code>units</code>-blok (feltenhedsskemaet, docs/field-units-schema.json), hvor den beskriver feltet, ellers fra feltnavnets endelse; en enhed, som ingen af dem angiver, vises som ikke angivet.

engine-advanced-report-th-parameter = Parameter

engine-advanced-report-th-value = Værdi

engine-advanced-report-th-unit = Enhed

engine-advanced-report-th-unit-source = Enhedens kilde

engine-advanced-report-h-results = 3. Resultater

engine-advanced-report-chart-alt = Resultatdiagram

engine-advanced-report-also-written-to = { " " }(også skrevet til { $file })

engine-advanced-report-h-scalars = Skalare resultater

engine-advanced-report-h-columns = Numeriske kolonner

engine-advanced-report-th-result = Resultat

engine-advanced-report-th-column = Kolonne

engine-advanced-report-th-count = Antal

engine-advanced-report-th-min = Min

engine-advanced-report-th-max = Maks

engine-advanced-report-th-first = Første

engine-advanced-report-th-last = Sidste

engine-advanced-report-omitted-inputs = <p class="note">{ $n } yderligere input er udeladt fra denne side; report.json viser de samme rækker, og resultatdokumentet indeholder hver værdi.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">{ $n } yderligere skalare resultater er udeladt fra denne side; report.json viser de samme rækker, og resultatdokumentet indeholder hver værdi.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">{ $n } yderligere numeriske kolonner er udeladt fra denne side; report.json viser de samme rækker, og resultatdokumentet indeholder hver værdi.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">{ $n } yderligere hændelser er udeladt fra denne side; report.json viser de samme rækker, og resultatdokumentet indeholder hver værdi.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Aggregering af medlemskørsler

engine-advanced-report-mode = <p>Tilstand <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Tilstand <strong>{ $mode }</strong> over typen <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Tilstand <strong>{ $mode }</strong>, { $n_runs } medlemskørsler.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Tilstand <strong>{ $mode }</strong> over typen <code>{ $kind }</code>, { $n_runs } medlemskørsler.</p>{ "\u000A" }

engine-advanced-report-run-digest = Kørselsdigest (SHA-256 over medlemsresultaternes digests, i afsendelsesrækkefølge): <code>{ $digest }</code>

engine-advanced-report-table-empty = Denne tabel har ingen rækker: resultatet angiver ingen.

engine-advanced-report-distribution-caption = Monte Carlo-fordeling af { $metric } ({ $n } stikprøver), 20 intervaller af samme bredde; stiplede linjer markerer 5., 50. og 95. percentil.

engine-advanced-report-distribution-caption-unit = Monte Carlo-fordeling af { $metric } ({ $n } stikprøver, { $unit }), 20 intervaller af samme bredde; stiplede linjer markerer 5., 50. og 95. percentil.

engine-advanced-report-h-companions = 3b. Animation og eksporter

engine-advanced-report-animation-alt = Animation af kørslens tidsserie

engine-advanced-report-animation-caption = Kørslens egne stikprøver tegnes ind bag en bevægelig tidsmarkør (den animerede tegning fra <code>--animate svg</code>; den viser det færdige billede ved reduceret bevægelse og i print).

engine-advanced-report-no-animation = Ingen animation: { $reason }

engine-advanced-report-no-animation-default = resultatet indeholder ingen tidsserie

engine-advanced-report-player-written-by = Den interaktive afspiller skrives af <code>{ $command }</code>.

engine-advanced-report-written-beside = Skrevet ved siden af denne rapport: { $links }.

engine-advanced-report-th-export = Eksport

engine-advanced-report-th-applies = Gælder

engine-advanced-report-th-files-or-reason = Filer eller årsag

engine-advanced-report-written-by = skrevet af <code>{ $command }</code>

engine-advanced-report-does-not-apply = gælder ikke

engine-advanced-report-yes = ja

engine-advanced-report-no = nej

engine-advanced-report-h-events = 4. Hændelsestidslinje

engine-advanced-report-events-caption = Vinduer som bjælker, punkthændelser som prikker, på kørslens egen tidsakse.

engine-advanced-report-th-start = Start (s)

engine-advanced-report-th-end = Slut (s)

engine-advanced-report-th-event = Hændelse

engine-advanced-report-th-source = Kilde

engine-advanced-report-point-event = punkthændelse

engine-advanced-report-events-timeline = Hændelsestidslinje

engine-advanced-report-point-events = punkthændelser ({ $n })

engine-advanced-report-distribution-of = Fordeling af { $metric }

engine-advanced-report-max-bin = største interval { $n }

engine-advanced-report-h-labels = 5. Verifikationsmærker

engine-advanced-report-th-capability = Funktion (matrixkrav)

engine-advanced-report-th-label = Mærke

engine-advanced-report-th-used-by = Anvendt af

engine-advanced-report-th-oracle = Kilde: uafhængig reference

engine-advanced-report-th-test-evidence = Testbelæg

engine-advanced-report-h-figure-tiers = Niveauer pr. nøgletal angivet af resultatet

engine-advanced-report-th-figure = Nøgletal

engine-advanced-report-th-tier = Niveau

engine-advanced-report-th-matrix-requirement = Matrixkrav

engine-advanced-report-th-applicable = Relevant

engine-advanced-report-no-attack = nej (intet angreb konfigureret)

engine-advanced-report-h-not-modelled = 6. Ikke modelleret, og antagelser

engine-advanced-report-not-modelled-note = Hvert punkt er citeret fra det sted, hvor det er angivet: resultatdokumentet, typekataloget, scenariefilen eller verifikationsmatrixens begrundelse for, at en MODELLED-række forbliver modelleret.

engine-advanced-report-th-statement = Udsagn

engine-advanced-report-h-reproducibility = 7. Reproducerbarhedsregistrering

engine-advanced-report-rk-command = Kommando til gentagelse

engine-advanced-report-rk-working-directory = Arbejdsmappe

engine-advanced-report-rk-engine-version = Motorversion

engine-advanced-report-rk-source-commit = Kildecommit

engine-advanced-report-rk-scenario-file = Scenariefil

engine-advanced-report-rk-scenario-sha = Scenariefilens SHA-256 (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = Resultatets scenario_hash

engine-advanced-report-rk-result-sha = Resultatdokumentets SHA-256

engine-advanced-report-rk-seed = Seed

engine-advanced-report-rk-platform = Platform

engine-advanced-report-rk-generated = Studie genereret (UTC)

engine-advanced-report-rk-determinism = Determinisme

engine-advanced-report-result-hash-none = resultatdokumentet angiver ingen

engine-advanced-report-print-note = Hvis du vil udskrive denne side til en Portable Document Format-fil (PDF), så brug browserens udskriftsdialog og vælg “Gem som PDF”; udskriftsstilarket passer til A4- og US Letter-papir, gentager tabeloverskrifter på tværs af sider og starter afsnittene input, resultater, mærker og reproducerbarhed på en ny side. Motoren skriver ingen PDF selv. report.json indeholder samme indhold som denne side.

engine-advanced-report-footer = Genereret af Kshana { $engine }.{ $stamp } Kan reproduceres ud fra scenarie + seed + motorversion. Gratis og open source (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">kilde &amp; dokumentation</a>.

engine-advanced-report-empty-inputs = Scenariet angiver intet felt ud over `kind`: typen kørte sin referencekonfiguration ud fra sine dokumenterede standardværdier.

engine-advanced-report-empty-scalars = Resultatdokumentet indeholder ingen skalar uden for sine arrays; dets tal er opsummeret pr. kolonne nedenfor.

engine-advanced-report-empty-series = Resultatdokumentet indeholder intet numerisk array: hvert resultat er en skalar i tabellen ovenfor.

engine-advanced-report-empty-events = Ingen tidsbestemt hændelse: scenariet scripter intet vindue eller indtrædelsestidspunkt, og resultatet rapporterer ingen hændelse. Typen evaluerer sin konfiguration som ét tilfælde.

engine-advanced-report-empty-not-modelled = Intet i resultatet, typekataloget, scenariet eller de anvendte matrixrækker angiver en modelleringsbegrænsning for denne kørsel.

engine-advanced-report-capabilities-statement = Hver række er en verifikationsmatrixrække, som denne kørsels typer anvender, med det mærke og den uafhængige reference, som matrixen giver den (src/verification.rs, docs/VERIFICATION-MATRIX.md). Et mærke bedømmer funktionen, som matrixen registrerer den; det bedømmer ikke dette scenaries konfiguration, og en VALIDATED-række gør ikke kørslens input til målte værdier. En PARTNER-række er en disciplin, som kørslen støtter sig på, og som Kshana ikke leverer.

engine-advanced-report-no-run-label = Resultatet har intet ærlighedsmærke på kørselsniveau; de anvendte funktioners verifikationsmærker er opført i deres eget afsnit, og niveauerne pr. nøgletal, hvor resultatet angiver dem.

engine-advanced-report-no-seed = Hverken scenariet eller resultatet indeholder en seed. Resultatet er fastlagt af scenariefilen og motorbygningen alene; determinismetesten genkører hvert medfølgende scenarie og kræver byte-identisk output.

engine-advanced-report-working-directory = Kør kommandoen fra den mappe, hvor den oprindelige kørsel blev startet: scenariestien og enhver relativ datasti i scenariet opløses i forhold til den. Kontrollér først scenariefilen mod scenario_sha256.

engine-advanced-report-determinism-stamped = Samme scenariebytes, seed og motorbygning giver samme resultatdokument, bortset fra dets meta.generated_utc-stempel, som --study-name skriver ud fra uret; kør uden --study-name for byte-identisk output. Flydende-komma-resultater er fastlåst pr. platform; et andet operativsystem eller en anden arkitektur kan afvige i de sidste cifre.

engine-advanced-report-determinism-plain = Samme scenariebytes, seed og motorbygning giver et byte-identisk resultatdokument og en byte-identisk rapport; denne rapport indeholder intet tidsstempel. Flydende-komma-resultater er fastlåst pr. platform; et andet operativsystem eller en anden arkitektur kan afvige i de sidste cifre.

engine-advanced-report-not-applicable-no-attack = ikke relevant (intet angreb konfigureret)

engine-advanced-report-what-ran-default = Et `{ $kind }`-scenarie.

engine-advanced-report-nothing-carried = intet medført

engine-advanced-report-tbl-sweep-nodes = Sweep-knuder

engine-advanced-report-tbl-mc-summary = Opsummering af Monte Carlo-fordeling (percentiler er nærmeste rang; det 95 % konfidensinterval for middelværdien er en percentil-bootstrap med fast seed)

engine-advanced-report-tbl-chain-phases = Kædefaser

engine-advanced-report-tbl-shared = Fælles betingelser

engine-advanced-report-tbl-members = Medlemmer

engine-advanced-report-tbl-combined = Kombineret på tværs af medlemmer

engine-advanced-report-tbl-optimiser-best = Optimeringens bedste (et lokalt optimum inden for de angivne grænser)

engine-advanced-report-tbl-optimiser-trace = Optimeringens forløb

engine-advanced-report-tbl-sweep-grid = Sweep-gitter

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Terrænreferenceret navigation (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Navigation matchet mod tyngdekraftskort

engine-altpnt-terrain-title-combined = Kombineret alt-PNT med tyngdekraft + magnetfelt + terræn

engine-altpnt-terrain-free-inertial-drift = frit inertialt drift

engine-altpnt-terrain-terrain-matched = terrænmatchet

engine-altpnt-terrain-gravity-matched = tyngdekraftsmatchet

engine-altpnt-terrain-gravity-only = kun tyngdekraft

engine-altpnt-terrain-magnetic-only = kun magnetfelt

engine-altpnt-terrain-terrain-only = kun terræn

engine-altpnt-terrain-combined-fused = kombineret (fusioneret)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · scenarie { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Angrebsflade for signalsikkerhed på Månen (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = relæer i sigte

engine-body-pnt-chart-count = antal

engine-body-pnt-chart-formal-one-sigma-position = formel positions-sigma (log10 m): kun blå konstellation, rav med jordafstanden

engine-body-pnt-chart-time-since-epoch = tid siden epoke, 0 til { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = urets tidsfejl mod grænse (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 mod sporingsgulv (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = beskyttelsesniveau mod alarmgrænse (m)

engine-campaign-chart-position-error-vs-threshold = positionsfejl mod tærskel (m)

engine-campaign-chart-satellites-tracking = satellitter i sporing

engine-campaign-chart-alarm-flags-and-events = alarmflag og hændelser

engine-campaign-chart-mission-time = { $duration } s missionstid

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) ved { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo af `{ $scenario_kind }`: { $n_runs } seeds fra { $base_seed } (5., 50., 95. percentil; bjælke = bootstrap 95 % konfidensinterval for middelværdien)

engine-campaign-chart-composed-members = sammensatte medlemmer under fælles betingelser: { $shared }

engine-campaign-chart-not-available = n/a

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Genfinding af cislunar buelængde — en estimator, der ikke deler Jacobianerne

engine-cislunar-arc-recovery-chart-subtitle = finite-difference batch-mindste kvadrater · målt tilstandsgenfindingsfejl · ingen analytisk Jacobian, ingen variational STM, ingen SVD-rangtolerance

engine-cislunar-arc-recovery-chart-bound = grænse { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = Gramian-rangtærskel

engine-cislunar-arc-recovery-chart-monte-carlo-rms = Monte Carlo-RMS-fejl i positionsgenfinding (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = støjfrit dårligste genfindingsforhold (slutfejl / forskydning)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Cislunar observerbarhed over en sporingsbue (P6)

engine-cislunar-observability-chart-subtitle = rang mod bue (enkelt link kun med afstand) · Gramian-egenspektrum · differentialkorrigerede DRO-begyndelsesbetingelser + SRIF-krydskontrol · { $modelled } udformning, { $validated } rang/STM/lukning

engine-cislunar-observability-chart-observable-rank = observerbar rang mod buelængde

engine-cislunar-observability-chart-arc-length = buelængde (tidsenheder i roterende system, { $arc_hours } h i alt)

engine-cislunar-observability-chart-gramian-eigenvalues = Gramian-egenværdier (log10)

engine-cislunar-observability-chart-condition = konditionstal κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Konfliktrobusthed for lagdelt PNT (P7)

engine-conflict-resilience-chart-subtitle = totaltab mod trusselsintensitet (MC mod lukket form) · robusthedsforhold mod afbrydelseskorrelation · { $modelled } a priori-fordelinger, { $validated } MC->lukket form / copula-marginaler

engine-conflict-resilience-chart-total-loss-probability = sandsynlighed for totaltab mod intensitet

engine-conflict-resilience-chart-threat-intensity = trusselsintensitet

engine-conflict-resilience-chart-layered-mc = lagdelt MC

engine-conflict-resilience-chart-single-layer = enkelt lag

engine-conflict-resilience-chart-resilience-ratio = robusthedsforhold mod afbrydelseskorrelation

engine-conflict-resilience-chart-denial-correlation = afbrydelseskorrelation ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = tilgængelighed (%)

engine-constellation-chart-mean-pdop = middel-PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = Jord-GNSS i månens afstand — C/N0 mod vinkel uden for pejleaksen

engine-earth-gnss-lunar-chart-track-threshold = sporing { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = Jordens rand { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = vinkel uden for pejleaksen (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = guld = kan spores · rød = for svag · grå = skjult af Jorden · { $modelled } sendemønster

## src/ensemble.rs

engine-ensemble-chart-title = Ur-holdover: konfidensbånd for tidsfejl ({ $n_runs } kørsler)

engine-ensemble-chart-timing-error-ns = tidsfejl (ns)

engine-ensemble-chart-spec-threshold = spec { $threshold } ns

engine-ensemble-chart-time-s = tid (s)

engine-ensemble-chart-classical-median-band = klassisk: { $id } (median, 5-95 % bånd)

engine-ensemble-chart-quantum-median-band = kvante: { $id } (median, 5-95 % bånd)

## src/fom_label.rs

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Budget for realtidsforudsigelse af referencesystem / EOP til månetidssynkronisering

engine-frame-eop-chart-ut1-error-ms = UT1-fejl (ms)

engine-frame-eop-chart-position-at-moon-m = position ved Månen (m)

engine-frame-eop-chart-equiv-timing-ns = tilsv. tidssynkronisering (ns)

engine-frame-eop-chart-prediction-horizon-days = forudsigelseshorisont (dage)

engine-frame-eop-chart-iers-final-floor = IERS-endeligt gulv { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m ved Månen

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = Hybrid UKF med 17 tilstande — filterets selvkonsistens (modelled)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + innovationshvidhed mod 95 % χ²-bånd; { $lit_1_0 } = konsistent. Selvkonsistens, ikke nøjagtighed.

engine-fusion-hybrid-ukf-chart-target = mål { $lit_1_0 }

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (hvidhed)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENT

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Løst koblet GNSS/INS horisontal fejl

engine-fusion-pack-chart-horizontal-error-m = horisontal fejl (m)

engine-fusion-pack-chart-spec-threshold = spec { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Skyplot ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = Ø

engine-geometry-chart-south = S

engine-geometry-chart-west = V

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (skjult af horisontlinjen)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (under masken)

engine-geometry-chart-no-fix = ingen positionsbestemmelse

engine-geometry-chart-in-view-hidden = { $n_visible } i sigte, { $n_masked } skjult af horisontlinjen · { $dop } · hul: ikke i sigte

engine-geometry-chart-satellites-as-given = satellitter som angivet

engine-geometry-chart-representative-sky = repræsentativ himmel, ikke en dateret

engine-geometry-chart-footer = Kshana v{ $version } · geometri under en angivet fejlmodel · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = RAIM-beskyttelsesniveauer mod alarmgrænser

engine-gnss-sim-chart-protection-level-m = beskyttelsesniveau (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/main.rs

engine-main-fail = fejl: { $e }

## legal (advisories, disclaimers and notices; the English text is the source, the constant in code is what machine files carry)

# legal: native review
engine-legal-compliance-statement = En række markeret evidenced betyder, at en kørsel i dette sæt leverer belæg for de funktioner, som rækken nævner. Det er ikke en konstatering af, at en ramme er opfyldt, og det betyder ikke, at noget produkt er blevet vurderet eller godkendt af nogen. Kolonnen med mangler angiver, hvad kørslerne ikke viser.

# legal: native review
engine-legal-bench-surface-notice = Kun køretøjets bevægelse og mærkede hændelsesintervaller. Intet, der eksporteres her, er, modellerer eller driver et radiofrekvens- eller basebåndssignal, og en hændelse er et tidsinterval, ikke en opskrift på at fremkalde interferens. Laboratoriesimulatoren og dens operatør leverer signalerne og er ansvarlige for kun at køre dem, hvor det er tilladt (ledningsbundet eller afskærmet, efter simulatorens egne sikkerhedsinstruktioner). Kshana offentliggør ingen resultater fra sådanne kørsler.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC på vinduesniveau for hver monitor på de angivne optagelser. Hvert angivet hændelsesvindue er en positiv, og hvert roc_window_s-vindue uden for hændelserne er en negativ; et vindue tæller ved en tærskel, når monitorens teststatistik når den i vinduet. P_fa er pr. negativt vindue, ikke pr. test.

# legal: native review
engine-legal-lunanet-afs-advisory = Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Den kontrollerer en symbolstrøm mod én udgave af en offentliggjort specifikation og siger intet om nogen LunaNet-node eller -tjeneste.

# legal: native review
engine-legal-iqfit-statement = MODELLED: hvert tilpasset tal beskriver den åbne modtager (den navngivne sløjfeudformning og frontend-kæden) på de optagelser, den fik, tilpasset kampagnens bedømte resultater. Det er ikke en måling af nogen anden modtager. Forudsigelser er mærket PREDICTION, med den nærmeste testede optagelse og afstanden uden for de testede betingelser.

# legal: native review
engine-legal-iqfit-advisory = Vejledende: analyseoutput, ikke typegodkendt navigationsudstyr; forudsigelser er modeloutput med angivet fejl, ikke garantier.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Kildeangivelse, ikke en påstand: ICG WG-B Lunar PNT-materialet fra juni 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, kilde S3 i studiet) beskriver et laboratorium for månens tidsreference på stationen med et tidsmål på nanosekundniveau. Kshana citerer dette mål kun som kontekst; den gør det ikke til sit eget, og intet i denne blok viser, at noget rigtigt stationsur når det.

# legal: native review
engine-legal-standards-pack-notice = En standardpakke måler modellerede scenarier mod tærskler, der er angivet før kørslen. Den leverer belæg for de rammerækker, den nævner; den vurderer eller godkender ikke noget produkt, og en MET-tærskel siger kun, at scenariets modellerede output nåede den angivne tærskel.

# legal: native review
engine-legal-standards-pack-advisory = Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste; det må ikke være det eneste grundlag for nogen navigations- eller sikkerhedsbeslutning.

# legal: native review
engine-legal-geometry-statement = Geometri under en angivet fejlmodel (MODELLED): sigtlinjesynlighed mod den angivne horisontlinje, præcisionsfortynding og en gaussisk fejlellipse for uafhængige, ens gaussiske afstandsfejl med middelværdi nul og den angivne brugerækvivalente afstandsfejl. Det er ikke en forudsigelse af en modtagers reelle fejl, som også har bias, multipath og fejl uden sigtlinje, og det er ikke en integritetsgrænse. Konstellationer fra forudindstillinger er en repræsentativ geometri, ikke himlen på den dato det pågældende sted.

# legal: native review
engine-legal-resilience-disclaimer = Simuleringsbaseret selvvurdering afstemt efter DHS RPCF v2.0. Dette er ikke en certificering eller akkreditering, og det repræsenterer ingen godkendelse fra nogen myndighed (DHS, IEEE eller andre). Hver delscore er MODELLED, medmindre den udtrykkeligt er mærket VALIDATED, og scorerne er nøgletal for tidsdomæne og detektion, ikke nøjagtighed i positionsdomænet.

# legal: native review
engine-legal-observatory-notice = En forringet celle betyder, at en høj andel af fly rapporterede lav navigationsnøjagtighed dér den dag. Der tilskrives ingen årsag. En celle, der ikke er observeret eller mangler, blev ikke vurderet, hvilket ikke er det samme som fri. Kun vejledende: ikke en godkendelse, certificering eller erklæring om overensstemmelse.

# legal: native review
engine-legal-receiver-trust-advisory = Vejledende software, ikke typegodkendt navigationsudstyr (IEC 61108, IEC 61162): operatøren er fortsat ansvarlig for fartøjets navigation.

# legal: native review
engine-legal-evidence-roundtrip-notice = Forbinder fire registreringer via hash: scenariet, laboratoriets angivne testbetingelser, modtagerloggen og scoren for denne log mod de angivne hændelser. Det er ikke et signal, ikke en opskrift på genafspilning og ikke en certificering. Hvordan scenariets bevægelse nåede modtageren (en fil afspillet gennem en laboratoriesimulator, ledningsbundet eller afskærmet) var operatørens ansvar og registreres her kun som angivet.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Denne pakke er en teknisk registrering af, hvad Kshana-motoren beregnede ud fra den angivne modtagerlog med den angivne konfiguration. Den er ikke en juridisk udtalelse, ikke en konstatering af faktum om nogen hændelse eller dens årsag og ikke en certificering.

# legal: native review
engine-legal-bench-notice = Vejledende: modelleret eller målt mod angivne referencer, ikke en godkendelse, certificering eller erklæring om overensstemmelse. En score beskriver en log eller et korpus, aldrig et produkt.

# legal: native review
engine-legal-osnma-advisory = Vejledende: dette er analyse- og overvågningsoutput og ikke typegodkendt navigationsudstyr. Den autentificeringsstatus, der rapporteres her, er ikke en navigationsintegritetstjeneste og må ikke være det eneste grundlag for nogen navigations- eller sikkerhedsbeslutning.

## added by the second pass

engine-holdover-test-chart-title = Holdover-test: tidsfejl pr. trin

engine-holdover-test-chart-y-title = |tidsfejl| (ns)

engine-holdover-test-chart-panel-caption = absolut tidsfejl; holdover-trin skraveret; stiplede linjer er tidsfejlbudgetterne

engine-holdover-test-chart-gnss-removed = GNSS fjernet

engine-holdover-test-chart-gnss-restored = GNSS genoprettet

engine-holdover-test-chart-time-axis = tid på optagelsens akse ({ $min } min)

engine-hybrid-chart-title = Udnyttelse af specifikationen for hybrid PNT under GNSS-udfald ({ $lit_1_0 } = specifikation)

engine-hybrid-chart-y-title = udnyttelse af specifikationen

engine-hybrid-chart-spec-line = specifikation ({ $lit_1_0 })

engine-hybrid-chart-classical-suite = klassisk suite

engine-hybrid-chart-quantum-suite = kvantesuite

engine-hybrid-integrity-chart-availability = tilgængelighed

engine-hybrid-integrity-chart-precision = præcision

engine-hybrid-integrity-chart-integrity = integritet

engine-hybrid-integrity-chart-joint-indep = fælles (uafh.)

engine-hybrid-integrity-chart-joint-corr = fælles (korr.)

engine-hybrid-integrity-chart-title = Fælles kvalitetsmål for hybrid optisk + RF PNT

engine-hybrid-integrity-chart-subtitle = P(tilgængelig AND præcisionsklasse AND integritetssikret)

engine-inertial-chart-title = Positionsfejl ved dødregning under GNSS-udfald

engine-inertial-chart-y-title = positionsfejl (m)

engine-inertial-chart-spec-line = specifikation { $m } m

engine-inertial-chart-classical = klassisk: { $id }

engine-inertial-chart-quantum = kvante: { $id }

engine-iq-campaign-report-roc-aria-label = Detektions-ROC pr. monitor

engine-iq-campaign-report-roc-x-title = P_fa (pr. negativt vindue)

engine-iq-campaign-report-curve-aria-label = C/N0-degradering mod angivet J/S for { $rec }, hændelse { $ev }

engine-iq-campaign-report-curve-x-title = angivet J/S (dB)

engine-iq-campaign-report-curve-y-title = C/N0-degradering (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: SSC-reference, Q = { $q }

engine-iq-campaign-report-curve-model-legend = { $label }-reference (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } flere serier i scorekorttabellen

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, målt degradering { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (målt)

engine-jamming-chart-title = Synlige satellitter mod sporede under jamming

engine-jamming-chart-y-title = satellitter

engine-jamming-chart-four-sv-fix = 4-SV-positionsbestemmelse

engine-jamming-chart-visible = synlige

engine-jamming-chart-tracking = sporede

engine-leo-fusion-ntn-chart-title = 5G NTN-positionering: Cramér-Rao-afstandsgrænse efter båndbredde

engine-leo-fusion-ntn-chart-caption = afstand, ét sigma (log10 m): søjle = maske til zenit C/N0; prik = RMS-fejl for 3D-positionsbestemmelse

engine-leo-fusion-ppp-chart-title = PPP-konvergens med LEO-augmentering

engine-leo-fusion-ppp-chart-caption = median vandret fejl (log10 m) mod minutter

engine-leo-fusion-ppp-chart-n-leo = { $n } LEO

engine-leo-fusion-pvt-kind-chart-doppler-caption = fejl for 3D-Doppler-positionsbestemmelse (log10 m) mod vindueslængde

engine-leo-fusion-pvt-kind-chart-doppler-x-label = vindue (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = median PDOP (blå) og VDOP (rav), log10, mod tilføjede LEO-satellitter

engine-leo-fusion-pvt-kind-chart-joint-x-label = tilføjede LEO-satellitter

engine-leo-fusion-pvt-kind-chart-polar-caption = median VDOP (log10): grå GNSS, blå LEO, rav fusioneret

engine-leo-fusion-pvt-kind-chart-polar-x-label = breddegrad (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = RMS-tidsfejl til UTC (log10 ns) mod C/N0-forskydning, én linje pr. oscillator

engine-leo-fusion-pvt-kind-chart-timing-x-label = C/N0-forskydning (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 } til { $x1 }

engine-leo-navmsg-chart-title = LEO-navigationsbesked: SISRE mod tilpasningsinterval

engine-leo-navmsg-chart-no-trade-encode-decode = Ingen afvejning i denne kørsel; se result.json for tabellerne over kodning/afkodning og budget.

engine-leo-navmsg-chart-no-fit-interval-trade = Ingen afvejning af tilpasningsinterval i denne kørsel; se result.json.

engine-leo-navmsg-chart-caption = SISRE RMS kun fra bane (m, log-skala) mod tilpasningsinterval (s)

engine-leo-pass-chart-title = LEO-passage: C/N0 pr. bånd og Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 til 80): LEO-bånd i farve, GNSS i gråt

engine-leo-pass-chart-time-axis = tid siden epoke, 0 til { $s } s

engine-leo-pnt-chain-chart-subtitle = signaludformning -> passage C/N0 og kodejitter -> besked SISRE -> fusioneret positionsbestemmelse · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 for sporet komponent over passagen (dB-Hz, 20 til 80)

engine-leo-pnt-chain-chart-not-available = ikke tilgængelig

engine-leo-signal-chart-title = LEO-PNT-signaludformninger

engine-leo-signal-chart-psd-axis = forskydning på tværs af ±{ $lit_0_6 } × senderbåndbredde; 0 til −50 dB under hver top

engine-leo-signal-chart-jitter-caption = kodejitter (m, log-skala) mod samlet C/N0 (dB-Hz)

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = sweep af `{ $scenario_kind }` over { $axis_order } ({ $nodes } knudepunkter, median med 5.-95. percentilbånd over { $n_runs } seeds; hver linje på sit eget interval)

engine-holdover-test-holdover-not-recovered-within-record = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; ikke genoprettet inden for optagelsen (MODELLED, målt mod masken)

engine-holdover-test-holdover-recovered-after-gnss-returned = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; genoprettet { $t } s efter, at GNSS vendte tilbage (MODELLED, målt mod masken)

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = skrevet af kshana iq scene: en SIMULERET scene, ikke en optagelse; heltalsskala: 1 LSB = { $sc } støjnormaliserede enheder (forventet RMS { $v1 } LSB pr. komponent), { $clipped } element(er) clippet

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = skrevet af kshana iq scene; heltalsskala: 1 LSB = { $sc } støjnormaliserede enheder (forventet RMS { $v1 } LSB pr. komponent), { $clipped } element(er) clippet

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = skrev { $samples } samples ({ $format }, { $fs_hz } Hz) til { $data_path }; { $truth_records } referenceposter til { $truth_path }; { $meta_note }; kanal: { $chan_desc }; heltalsskala: 1 LSB = { $sc } støjnormaliserede enheder (forventet RMS { $v1 } LSB pr. komponent), { $clipped } element(er) clippet

engine-lunar-chart-title = Lunar sydpol-HPL ({ $availability } % tilgængelighed, AL { $al } m, σ_URE { $sigma } m)

engine-lunar-beacon-chart-title = Udvidelse med overfladebeacons — PDOP pr. konfiguration

engine-lunar-beacon-chart-pdop = PDOP { $pdop }

engine-lunar-beacon-chart-no-solution = ingen løsning

engine-lunar-beacon-chart-footnote = lavere er bedre; sigma_URE pr. beacon { $sigma } m, maske { $mask } deg

engine-lunar-combination-chart-title = Lunar fælles OD + ur — stationens 3-D-positionsfejl (VLBI genopretter observerbarheden)

engine-lunar-combination-chart-subtitle = { $n_sat } satellitter, { $n_earth } jordstationer · forbedringsfaktor { $factor }×

engine-lunar-combination-chart-with-vlbi = med VLBI: { $m } m

engine-lunar-combination-chart-range-only = kun afstand: { $m } m

engine-lunar-combination-chart-axis-note = log10 stationsfejl (m); konvergeret med/uden = { $with }/{ $without }

engine-lunar-dpnt-chart-title = Lunar differentiel PNT — { $n_sats } satellitter: korrigeret fejl mod baseline (× { $factor } reduktion ved { $km } km)

engine-lunar-dpnt-chart-subtitle = ukorrigeret { $uncorrected } m | korrigeret { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = ukorrigeret (uden støtte)

engine-lunar-dpnt-chart-baseline-km = baseline (km)

engine-lunar-dpnt-chart-err-m = fejl (m)

engine-lunar-frame-realise-chart-title = Realisering af lunart referencesystem — 7-parameter Helmert-genopretning

engine-lunar-frame-realise-chart-subtitle = { $n_points } punkter · RMS-residual { $rms } m · konvergeret { $converged }

engine-lunar-frame-realise-chart-scale = skala (ppb)

engine-lunar-frame-realise-chart-row = { $label }: injiceret { $inj } { $unit } · genoprettet { $rec } { $unit } · fejl { $err }

engine-lunar-interop-chart-title = Lunar interoperabilitetseksport — CCSDS OEM + KIF (på linje med LunaNet/IOAG)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | { $n_states } tilstande | OEM { $oem_lines } linjer

engine-lunar-interop-chart-artifacts = artefakter: { $list }

engine-lunar-interop-chart-pass = PASS

engine-lunar-interop-chart-fail = FAIL

engine-lunar-interop-chart-conformance = formatkontrol af felter: { $verdict } ({ $present } til stede, { $missing } mangler, { $data_lines } datalinjer)

engine-lunar-interop-chart-roundtrip = OEM-rundtur: { $oem } | rundtur for tidsmetadata: { $time_metadata } | KIF { $kif_bytes } bytes

engine-lunar-interop-chart-footnote = Rundtur / formatkontrol af felter mod CCSDS OEM + offentliggjort LunaNet/IOAG-feltsemantik. { $label } — ikke en certificeret test af interoperabilitet og formatkontrol; ingen opbakning fra nogen myndighed.

engine-lunar-jamming-chart-title = J/S pr. satellit mod elevation, lunar overfladebruger

engine-lunar-jamming-chart-y-title = J/S (dB)

engine-lunar-jamming-chart-x-title = satellittens elevation (deg)

engine-lunar-jamming-chart-n-links = { $n_links } forbindelser

engine-lunar-service-chart-title = Lunar servicevolumen — { $n_sats } satellitter, { $n_points } punkter × { $n_epochs } epoker: { $coverage } % dækning (PDOP&lt;{ $threshold })

engine-lunar-service-chart-subtitle = satellitter { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | PL-tilgængelighed { $pl_avail } % (AL { $al } m, σ_URE { $sigma } m)

engine-lunar-service-chart-pdop-min = PDOP min. { $v }

engine-lunar-service-chart-pdop-mean = PDOP middel { $v }

engine-lunar-service-chart-pdop-max = PDOP maks. { $v }

engine-lunar-station-chart-title = Lunar referencestation: p{ $percentile } korrigeret 3-D-fejl over sydpolarregionen (MODELLED)

engine-lunar-station-chart-threshold = tærskel { $thr } m ved p{ $percentile }

engine-lunar-station-chart-availability = tilgængelighed { $v } %

engine-lunar-station-chart-coverage = dækning { $v } %

engine-lunar-station-chart-corrected-3d = korrigeret 3-D { $f }

engine-lunar-station-chart-uncorrected-3d = ukorrigeret 3-D { $f }

engine-lunar-station-chart-legend-half = ≤ halvdelen af tærsklen

engine-lunar-station-chart-legend-within = ≤ tærskel

engine-lunar-station-chart-legend-twice = ≤ det dobbelte af tærsklen

engine-lunar-station-chart-legend-above = over det dobbelte af tærsklen

engine-lunar-station-chart-station-note = ◆ station · stiplet: afstand, hvor dækningen holder ved 95 %

engine-lunar-station-chart-disclaimer = MODELLED under angivne forudsætninger; ikke en udtalelse om noget reelt system; ikke tilknyttet eller støttet af nogen myndighed.

engine-lunar-time-chart-title = Lunar koordinattid LTC−TT (rate { $rate } µs/dag, bånd { $low }–{ $high })

engine-lunar-time-chart-offset = { $offset } µs ved { $days } d

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | ur { $clock } | 7-leddet x_Σ(τ) over { $taus } τ-punkter ({ $taus2 }–{ $taus3 } s) | krydsningspunkt τ { $crossover_tau_s } s (x { $crossover_x_s } s) | referencesystemets gulv { $frame_term_s } s | ur x(1 d) { $x_1day_ns } ns (MODELLED) | tidslaboratorium: { $lab } { $lab2 } til LTC, x(1 d) { $lab3 } ns (MODELLED)

engine-lunar-vlbi-chart-title = Lunar VLBI-forsinkelse (baseline { $baseline } km, beaconafstand { $range } km, nærfelt { $near_field } µs)

engine-lunar-vlbi-chart-footnote = forsinkelse { $delay } µs ved epoke · { $samples } samples over { $hours } h

engine-mars-pnt-chart-formal-3sigma = formel 3σ (kovarians, ikke et certificeret PL)

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = position drag-off: den rapporterede position vandrer { $final_offset_m } m væk { $dir }, mens modtageren bevarer en gyldig positionsbestemmelse (det falske spor topper ved { $pv } m/s og { $pa } m/s^2); hver sporet satellit viser { $c } dB-Hz, så længe det varer

engine-nmea-synth-log-position-drag-off-genuine-cn0 = position drag-off: den rapporterede position vandrer { $final_offset_m } m væk { $dir }, mens modtageren bevarer en gyldig positionsbestemmelse (det falske spor topper ved { $pv } m/s og { $pa } m/s^2); det ægte C/N0-mønster bevares

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = time spoof: rapporteret UTC flytter sig { $offset_s } s fra det sande; positionen forbliver sand; hver sporet satellit viser { $c } dB-Hz, så længe det varer

engine-nmea-synth-log-time-spoof-genuine-cn0 = time spoof: rapporteret UTC flytter sig { $offset_s } s fra det sande; positionen forbliver sand; det ægte C/N0-mønster bevares

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = replay delay (meaconing-stil): position{ $v1 } ligger { $delay_s } s efter referencen; hver sporet satellit viser { $c } dB-Hz, så længe det varer

engine-nmea-synth-log-replay-delay-genuine-cn0 = replay delay (meaconing-stil): position{ $v1 } ligger { $delay_s } s efter referencen; det ægte C/N0-mønster bevares

engine-pvt-chart-3d-error-m = 3D-fejl (m)

engine-pvt-chart-postfit-rms-m = post-fit RMS (m)

engine-quantum-faults-chart-title = quantum-anomaly-detect AUC (MODELLED)

engine-quantum-faults-chart-quantum = kvante

engine-quantum-faults-chart-classical = klassisk

engine-quantum-nav-od-chart-title = quantum-gnss-free-nav (MODELLED)

engine-raim-stanford-chart-title = Stanford-diagram — integritet ({ $n_epochs } epoker, AL = { $al } m)

engine-raim-chart-title = RAIM-beskyttelsesniveauer og tilgængelighed ({ $availability } % tilgængelig)

engine-raim-chart-hal = HAL { $al } m

engine-raim-chart-val = VAL { $al } m

engine-receiver-trust-chart-track-caption = modtagerrapporteret spor, nord opad

engine-receiver-trust-chart-start = start

engine-receiver-trust-chart-end-of-log = slut på loggen

engine-receiver-trust-chart-no-positions = ingen positioner i loggen

engine-receiver-trust-chart-score-axis = tillidsscore, 0 til 100

engine-receiver-trust-chart-legend-vessel = tillid: grøn nominel (score på eller over { $nominal }), gul forringet (på eller over { $degraded }), rød ikke betroet, grå kalibrerer

engine-receiver-trust-chart-legend = tillid: grøn nominel, gul forringet, rød ikke betroet, grå kalibrerer

engine-receiver-trust-chart-advisory = Vejledende software, ikke typegodkendt navigationsudstyr; operatøren er fortsat ansvarlig.

engine-receiver-trust-chart-cn0-axis = gennemsnitlig C/N0, dB-Hz

engine-report-chart-title = Ur-holdover: tidsfejl under GNSS-udfald

engine-slot-timing-chart-aria = Forudsagt tidsfejl mod tid siden sidste positionsbestemmelse, med slottets guard

engine-slot-timing-chart-time-since-fix = tid siden positionsbestemmelse, 0 til { $t }

engine-slot-timing-chart-predicted-error = forudsagt tidsfejl (ns); stiplet: guard { $guard } ns

engine-slot-timing-never = aldrig

engine-solar-system-chart-title = Solsystemet — J2000-ekliptika, set ovenfra

engine-solar-system-chart-inner = Det indre solsystem (til Mars)

engine-solar-system-chart-whole = Hele solsystemet (til Pluto)

engine-solar-system-chart-legend = grøn: VALIDATED mod JPL Horizons · gul: MODELLED · måner er opført i result.json med forælder-centrerede spor

engine-spectrum-chart-title = L-bånd-spektrum, vandfald

engine-spectrum-chart-multi-title = Flerbånds spektrum, vandfald

engine-spectrum-chart-frequency-mhz = frekvens (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz): nominel (grå) / minimum

engine-spectrum-chart-threshold = tærskel { $thr }

engine-spoof-chart-title = Time-spoof-detektion: forskydning mod urstøttede detektionsgrænser

engine-spoof-chart-offset-ns = spoof-forskydning (ns)

engine-spoof-chart-spoof-offset = spoof-forskydning

engine-spoof-chart-quantum-bound = kvantedetektionsgrænse

engine-spoof-chart-classical-bound = klassisk detektionsgrænse

engine-sweep-chart-title = { $metric } mod { $parameter } ({ $scale }-skala)

engine-sweep-nd-chart-title = { $n_dims }-D sweep af `{ $kind }` — { $n_nodes } knudepunkter

engine-sweep-nd-chart-axes = akser: { $axes } (form { $shape })

engine-sweep-nd-chart-metrics = metrikker: { $metrics } — hele gitteret i JSON

engine-sweep-nd-chart-line-title = sweep af `{ $kind }` over { $key }

engine-sweep-nd-chart-y-title = metrik

engine-telecom-timing-max-te-ns-budget-never-exceeded = telecom-timing: maks.|TE| { $max_abs } ns over { $v2 } s; { $masks }; budgettet på { $max_abs_te_ns } ns blev aldrig overskredet (MODELLED)

engine-telecom-timing-max-te-ns-budget-exceeded-after = telecom-timing: maks.|TE| { $max_abs } ns over { $v2 } s; { $masks }; budgettet på { $max_abs_te_ns } ns blev overskredet efter { $t } s (MODELLED)

engine-telecom-timing-chart-title = Telecom timing: tidsfejl, MTIE og TDEV

engine-telecom-timing-chart-y-title = |tidsfejl| (ns)

engine-telecom-timing-chart-te-caption = absolut tidsfejl mod budgetterne

engine-telecom-timing-chart-holdover = holdover

engine-telecom-timing-chart-time-record = tid ({ $h } h optagelse)

engine-telecom-timing-chart-mtie-caption = MTIE (optrukket), TDEV (stiplet), første MTIE-maske (grå), ns

engine-timetransfer-chart-title = Synkroniseringsfejl ved tidsoverførsel (optisk mod RF)

engine-timetransfer-chart-y-title = synkroniseringsfejl (ps)

engine-timetransfer-chart-spec = spec { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = målingstid (s)

engine-timetransfer-chart-rf = RF: { $id }

engine-timetransfer-chart-optical = optisk: { $id }

engine-timetransfer-chain-chart-title = quantum-time-transfer (MODELLED)

engine-kind-clock-description = Ur-holdover mod specifikation; valgfrit Monte Carlo-ensemble (runs > 1).

engine-kind-inertial-description = 1-DOF inertial dødregning under et GNSS-udfald.

engine-kind-orbit-description = GNSS-tilgængelighed + DOP fra en orbital konstellation (Walker / TLE / RINEX).

engine-kind-ephemeris-description = Efemeride og jordspor: propager én satellit (TLE→SGP4 eller analytisk bane) og udlæs dens TEME/GCRS-tilstand (position + hastighed), ITRF/ECEF-position, WGS-84-subsatellitbredde/-længde/-højde og pr. trin stationens az/el/afstand + afstandsrate (Doppler). Satellitten kommer fra en `tle` eller fra en analytisk `orbit` med dens `epoch` (en `tle` vinder, når begge er angivet); med en `tle` tilsidesætter en `epoch` TLE'ens egen epoke som t = 0.

engine-kind-integrity-description = Snapshot / solution-separation / ARAIM RAIM med HPL/VPL og et Stanford-diagram.

engine-kind-lunar-integrity-description = Lunar sydpol-ARAIM-beskyttelsesniveau-gennemløb mod et repræsentativt LunaNet-relæsæt. sigma_ure_m udstiller signal-i-rummet-afstandsnøjagtigheden (beskyttelsesniveauerne skalerer lineært med den, så et sweep over den besvarer, hvilken afstandsnøjagtighed en alarmgrænse kræver). Standard er det historiske LNIS-klasse-sydpoltilfælde.

engine-kind-lunar-time-offset-description = Modelleret relativistisk jord–måne-urrate (Lunar Coordinate Time, LTC/TCL): den sekulære LTC−TT-rate ud fra selvpotentialforskellen og månens kinetiske led, rapporteret med det offentliggjorte bånd på 56–59 µs/dag, plus den akkumulerede forskydning over en horisont.

engine-kind-lunar-vlbi-description = Modelleret lunar geodætisk VLBI-forsinkelsesobservabel: en jordbaseline (to jordstationer, GCRS) observerer et envejssignal fra en lunar-overflade-beacon af NovaMoon-klassen. Udsender nærfeltsforsinkelsen som to-afstandsdifferens, dens rate og bølgefrontkrumningens nærfeltskorrektion over en overflyvning — krydstjekket mod den plane-bølge-Δ-DOR-observabel fra samme kodebase i fjernfeltsgrænsen, med partielle afledte verificeret ved endelig differens. Den analytiske standardsti er MODELLED og bærer forbeholdene om referencesystem-konsistens, xp=yp=0-polbevægelse og plan bølge mod nærfelt. Angives planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path, køres kernestien i stedet (DE440, MOON_PA_DE440, ITRF93; konvergerede barycentriske lystider; tilføjer epokens beacon- og stationspartialer), hvis newtonske forsinkelse og partialer stemmer overens med NAIF SPICE-konvergerede lystider til { $lit_0_06 } ps og 7.4e-9. Ikke afprøvet mod rigtige VLBI-data.

engine-kind-lunar-joint-od-clock-description = Modelleret fælles multiteknik lunar OD + ur-batchestimator på et SIMULERET netværk: en Gauss-Newton-snapshottilpasning, der fusionerer geodætiske VLBI-forsinkelser for jordbaseline, lunar-lokale afstande station↔satellit og afstande mellem satellitter for sammen at genfinde en lunar overfladestations 3-D-position, en lille konstellations positioner og hvert aktivs urforskydning ud fra en injiceret reference. Det ærlige hovedresultat — VLBI gør stationens fulde 3-D-position observerbar, hvor lunar-lokal afstandsmåling alene efterlader en svagt observeret retning — rapporteres som kontrasten i stationsfejl med og uden VLBI. MODELLED simuleret genfinding i lukket sløjfe (referencen deler observationsmodellen), deterministisk (seedet), IKKE afprøvet mod rigtige data; ingen kraftmodelpropagering inde i solveren; ingen TRL/heritage/opbakning fra nogen myndighed.

engine-kind-lunar-frame-realisation-description = Modelleret realisering af lunart referencesystem: en 7-parameter Helmert-datumtilpasning (ligedannethed) — 3 translationer, 3 små rotationsvinkler, 1 skala — der knytter et estimeret sæt af selenografisk afledte MCMF-punktkoordinater til et datum ved vægtet mindste kvadraters metode (crate::batch_ls::gauss_newton), plus en simpel orienteringsknytning, der udtrykker den realiserede lille rotation om ICRF-akserne i forhold til IAU 2015 WGCCRE-legemets orientering. Scenariet injicerer en kendt lille transformation (translation ~titusinder af m, rotation ~µrad, skala ~1e-7) i et velspredt syntetisk punktnetværk, tilføjer seedet gaussisk støj, genfinder datummet og rapporterer den genfundne transformation, genfindingsfejlen pr. parameter i forhold til den injicerede reference og den post-fit RMS-residual. MODELLED selvkonsistens — genfinder en injiceret ligedannethedstransformation (støjfri til ~maskinpræcision), IKKE en realisering mod rigtige tracking-/VLBI-data; deterministisk (seedet); ingen TRL/heritage/opbakning fra nogen myndighed.

engine-kind-moonlight-service-volume-description = Modelleret lunar navigationsservicevolumen-analyse ud fra en ILLUSTRATIV konstellation i lunar bane af Moonlight/LCNS-klassen fra offentlige kilder (ikke tilknyttet ESA): sweeper et selenografisk bredde-/længdegitter over en tidshorisont og rapporterer DOP / dækning / tilgængelighed (≥4 satellitter OG PDOP < tærskel) plus en generaliseret lunar ARAIM-beskyttelsesniveau-kuvert (HPL/VPL) over volumenet. DOP-geometrien GENBRUGER den kerne (crate::orbit::dop), der er VALIDATED mod gnss_lib_py; beskyttelsesniveauet GENBRUGER LunaNet LNIS' lunare ARAIM-maskineri (crate::lunar, σ_URE≈30 m) og reduceres til det eksisterende sydpol-PL som specialtilfælde. MODELLED sammensætning: et cirkulært/elliptisk Kepler-relæsæt (ikke den rigtige differentialkorrigerede LCNS/NRHO-efemeride), en måne med middelrotation (ingen libration/præcederende pol). Deterministisk (ren geometri). Ingen TRL/heritage/opbakning fra nogen myndighed.

engine-kind-lunar-differential-pnt-description = Modelleret lunar DIFFERENTIEL PNT (et lunart DGNSS/SBAS-modstykke): en referencestation af NovaMoon-klassen på en KENDT selenografisk placering beregner differentialkorrektioner pr. satellit ud fra en ILLUSTRATIV konstellation af Moonlight/LCNS-klassen fra offentlige kilder (NovaMoon nævnes kun som en system-KLASSE, ikke tilknyttet ESA), og en bruger forskudt med baseline_km anvender dem, så de FÆLLES orbit- og urfejl ophæves. Urleddet ophæves PRÆCIST (en algebraisk identitet); orbitleddet efterlader kun projektionen af synslinjeforskellen, som → 0, når baseline → 0 (den rumlige dekorrelationsbund) og vokser ≈ lineært med baseline. Rapporterer brugerens 3-D-positionsfejl MED og UDEN korrektioner, reduktionsfaktoren, kurven fejl mod baseline og et brugerbeskyttelsesniveau, der GENBRUGER DO-229E SBAS-maskineriet (crate::sbas) med den differentielle residual σ. MODELLED — præcis ophævelsesidentitet + førsteordens dekorrelationsmodel; ikke afprøvet mod rigtige data; ingen TRL/heritage/opbakning fra nogen myndighed. Deterministisk, hvis seedet.

engine-kind-lunar-station-coverage-description = Modelleret lunar referencestationsdækning: et Monte Carlo-sweep af den lunare differentielle PNT-model over et sydpolart brugergitter og et døgns epoker. En differentiel referencestation på et kendt sydpolart sted korrigerer en angivet konstellation (illustrativ Kepler eller en tabuleret efemeride) med en angivet signal-i-rummet-fejl, opmålingsfejl, korrektionslatens og linkkvantisering; pr. punkt og over regionen rapporterer den den korrigerede og ukorrigerede positionsfejl som percentil (3-D, horisontal, vertikal), tilgængelighed, dækning mod en angivet tærskel, DO-229E-beskyttelsesniveauer, dækningsradius pr. azimut og korrektionslinkets budget ved stationen og i det værste punkt. Ikke en udtalelse om ydeevnen af noget reelt system; ikke tilknyttet eller støttet af nogen myndighed. MODELLED.

engine-kind-lunar-interop-export-description = Modelleret lunar interoperabilitetseksport: udsender det lunare referencesystem, den lunare tidsskala og den lunare efemeride i LunaNet/IOAG-afstemte, CCSDS-baserede udvekslingsformer med rundtur-/feltkontrol. GENBRUGER cratens CCSDS OEM 2.0-udsender+parser (crate::oem), gentaget for den lunare kontekst — OEM-feltet REF_FRAME bærer IAU 2015 WGCCRE's lunare legemssystem (MOON_ME / MOON_PA), TIME_SYSTEM den lunare tidsskala (LTC / TCL / UTC), CENTER_NAME = MOON — over en illustrativ eksempelefemeride af LCNS-klassen (positioner fra crate::lunar_service, hastighed ved endelig differens). Udsender også en LunaNet/IOAG-afstemt lunar tidsbeskrivelse (skala-id, sekulær rate µs/dag fra crate::lunar_time, offentliggjort bånd, referenceoverflade), der går rundtur via serde_json, og pakker artefakterne ind i den eksisterende KIF-kuvert (crate::interchange) med den MODELLED ærlighedsmærkat. Rapporterer udsendte artefakter, OEM-linjeantal, bestået feltkontrol + liste over til stede værende/manglende felter, OEM-rundtur ok, rundtur for tidsmetadata ok og KIF-bytestørrelse. MODELLED — deterministisk rundtur + kontrol af feltnavne mod offentliggjort CCSDS OEM + LunaNet/IOAG-feltsemantik er den uafhængige reference; IKKE en certificeret test af interoperabilitet; illustrativ efemeride fra offentlige kilder, ikke tilknyttet ESA; ingen TRL/heritage/opbakning fra nogen myndighed.

engine-kind-timetransfer-description = Optisk mod RF tovejs tids-/frekvensoverførsel.

engine-kind-quantum-anomaly-detect-description = MODELLED fejl-/anomalidetektion for kvante-PNT-systemer: et mærket fejlkatalog (urets frekvenssprang/drift/tab af lås; sensorens biastrin/udfald), en detektionsstatistiks ROC AUC (med et bootstrap-CI fra de eksternt validerede eval_stats) og en mindste detekterbar fejl ved en fast falsk-alarmrate, hvor den kvanteur-støttede monitor (lavere støj) detekterer mindre fejl — som ærlig TradeEvidence + repræsentativitet. Gaussisk detektionsstatistikmodel (AUC = Phi(mu/(sigma*sqrt2))); modellerer klassen, illustrative parametre fra offentlige kilder, ingen TRL/flyvning/certificering.

engine-kind-quantum-gnss-free-nav-description = MODELLED GNSS-fri kvantenavigation: under et GNSS-udfald et kvante- (kold-atom-interferometer) inertialbudget mod et klassisk INS af navigationskvalitet — vækst i positionsfejl over udløbet, holdover til en positionstærskel og kvante-mod-klassisk-afvejningen som ærlig TradeEvidence med repræsentativitet. Ærlig observerbarhedsnote: uden ekstern positionsbestemmelse er accelerometerbiasen uobserverbar, så fejlen vokser; kvantesensoren bremser, men lukker ikke dette hul. Illustrative enhedsparametre fra offentlige kilder; modellerer klassen, ingen TRL/flyvning/certificering.

engine-kind-quantum-time-transfer-description = MODELLED betroet kvantetidskæde: et ende-til-ende-budget for kvante- (optisk-gitter-ur + sammenfiltring/enkeltfoton-link) mod klassisk (CSAC + RF tovejs) tidsoverførsel, et genbrugt tidsbeskyttelsesniveau + en sikkerheds-FoM mod forsinkelses-/replay-angreb (1-P_md), en sandsynlighed for detektion af uranomali + CUSUM-latens og kvante-mod-klassisk-afvejningen som ærlig TradeEvidence med en repræsentativitets- og gaps-to-flight-post. Illustrative enheds-/linkparametre fra offentlige kilder; modellerer klassen, ingen TRL/flyvning/certificering hævdes.

engine-kind-hybrid-description = Hybrid PNT-capstone: ur + IMU + støtte fra tidsoverførsel.

engine-kind-fusion-description = Fælles Kalman-sensorfusions-PNT over de samme hybride input.

engine-kind-hybrid-ukf-description = 17-tilstands hybrid kvante+klassisk tæt koblet GNSS/INS UKF (MODELLED): 15 INS-fejltilstande + CAI-afledt accelerometerbias-korrektion + et 2-tilstands (fase+frekvens) ur fra q-parameter-urmotoren, drevet af den afgrænsede CAI-fejlmodel. Kvalitetsmålet er filterets selvkonsistens (NEES + innovationshvidhed mod χ²-grænser) — en selvkonsistensudtalelse, IKKE en garanti for nøjagtighed i den virkelige verden. Kun simulering; ingen TRL>3, ingen flyvearv, ingen ekstern validering.

engine-kind-gnss-ins-description = Løst og tæt koblet GNSS/INS fejltilstands-EKF.

engine-kind-gnss-sim-description = Pseudoafstandssimulering i måledomænet (Klobuchar-ionosfære, Saastamoinen/Niell-troposfære) + RAIM.

engine-kind-jamming-description = Linkbudget for jamming: J/S → effektiv C/N₀ → tab af lås.

engine-kind-spoof-description = Stokastisk time-spoof-detektor (Neyman–Pearson / χ²₁) med Monte Carlo P_fa/P_md.

engine-kind-spoof-detect-description = Kombineret RF-/måle-spoof-detektor (multi-SV RAIM-konsistens + AGC + SQM, fusioneret) mod et parametriseret angreb (effektfordel, bærebølgefase-justering, tids-/positionspåvirkning; TEXBAT-stil).

engine-kind-sweep-description = 1-D sweep til afvejningsstudie over en urpakke-parameter.

engine-kind-sweep-nd-description = Generisk N-D sweep over enhver pakke via punkterede TOML-nøgler / JSON-metrikstier.

engine-kind-gravity-map-description = GPS-nægtet navigation med tyngdekortmatchning: et kold-atom-gravimeter genfinder en konstant INS-drift ud fra den tyngdeanomalisekvens, det flyver igennem.

engine-kind-terrain-nav-description = GPS-nægtet terrænreferencenavigation (TERCOM/SITAN): en radar-/barohøjdemåler matcher jordhøjdeprofilen mod en DEM i SRTM-stil for at genfinde INS-driften.

engine-kind-terrain-slam-description = GPS-nægtet sekventiel (rekursiv) terrænreferencenavigation: et partikelfilter kører terrænmatchningens målemodel epoke for epoke (SITAN som et løbende filter), så en tidsvarierende INS-drift følges langs sporet, hvor den batchbaserede terrain-nav kun genfinder en enkelt konstant forskydning.

engine-kind-combined-altpnt-description = GPS-nægtet kombineret tyngde- + magnet- + terrænnavigator: tre skalare feltkanaler fusioneret pr. waypoint for en skarpere (lavere CRLB) driftbestemmelse end noget enkelt felt.

engine-kind-pvt-description = Enkeltpunktspositionering med virkelige observationer: løs en modtagers position ud fra en RINEX 3-observationsfil og en broadcast-navigationsfil (kodepseudoafstande, broadcast-efemeride, Klobuchar-ionosfære, Saastamoinen/Niell-troposfære), eventuelt afprøvet mod en opmålt koordinat.

engine-kind-mars-pnt-description = Dybrums-Mars-PNT: en simuleret MARCONI-relækonstellation (areostationære + inklinerede relæer, der udsender envejs + videresender tovejs til en dybrumsstation) navigerer en referencebruger (transfer | lmo | surface) gennem den fælles envejs-/tovejs-radiometriske fusionsestimator. Rapporterer geometri/synlighed pr. epoke, opnået RMS mod reference og den formelle kovarians (1σ / 3σ position) — en ærlig simuleret FoM, IKKE et certificeret beskyttelsesniveau.

engine-kind-impairment-eval-description = Evalueringstestbed for AI/ML-detektion af RF-forringelser (13494): generér et mærket, parameterbaseret SYNTETISK korpus (nominel/jamming/spoof-tid/spoof-position/multipath), score en detektor (energy|agc|sqm|parity|fused) med den detektoruafhængige harness, og rapportér AUC/ROC/forvekslingsmatrix + Pd pr. klasse ved en mål-Pfa, plus optimismegabet mellem i- og uden-for-fordelingen. Kun MODELLED driftskarakteristika — aldrig felt/IQ, ingen god/dårlig-dom.

engine-kind-quantum-trade-description = Kvante-mod-klassisk PNT-afvejning (13503): fordelen ved timing-holdover + inertial-holdover for et kandidatur (en målt ADEV-kurve — forsvarlighedens omdrejningspunkt — eller en kvanteurklasse) mod en klassisk baseline-klasse, med forbeholdet om lang-tau-gulvets antagelse båret på artefaktet, plus en GNSS-nægtet robusthed-mod-tid-kuvert. MODELLED; kvantificerer (afprøver aldrig) en partnerenhed. Kandidaturet er en målt kurve (`candidate_adev_taus` + `candidate_adev_values`, lige lange, mindst 2 punkter; den vinder, når begge former er angivet) eller en `candidate_clock_class`.

engine-kind-space-weather-description = Rumvejrsmiljømodel: sol- (F10.7/F10.7a) og geomagnetiske (Kp, med den definitoriske Kp↔ap-tabel) aktivitetsindeks, den Jacchia-1971-eksosfæriske temperatur, de driver (afprøvet mod offentliggjort solminimum/-middel/-maksimum), og den Jacchia-1971-termosfæriske neutraltæthed ved den døgngennemsnitlige eksosfæriske temperatur mod den aktivitetsfri statiske profil i et sæt højder — den solcyklusafhængighed i tætheden, som den statiske atmosfære udelader. MODELLED: tætheden stemmer overens med accelerometerafledte tætheder (TOLEOS CHAMP og GRACE) inden for en faktor 2 ved solmaksimum, men er omkring { $lit_1_7 }x for tæt i solminimum 2008.

engine-kind-oem-interop-description = CCSDS OEM-interoperabilitetsbro: importér en Orbit Ephemeris Message produceret af et eksternt flyvedynamikværktøj (GMAT/Orekit/STK udsender alle OEM) og rapportér dens segmenter/objekter/referencesystemer/epokespænd plus en hastighedskonsistenskontrol; uden input går en genereret referencebane rundtur og rapporterer import↔eksport-troskaben. MODELLED strukturel/fysisk indlæsningskontrol, IKKE en afprøvning af kildens banenøjagtighed.

engine-kind-launch-window-description = Totlegemers opsendelses- og stigningsgeometri: opsendelsesazimut(er) (sin Az = cos i / cos lat), mindste opnåelige inklination, cirkulær hastighed, jordrotationens østlige bonus, dogleg-planskifte-Δv, når målinklinationen er under stedets bredde, og antallet af daglige opsendelsesmuligheder. MODELLED sfærisk-jord-geometri (ingen korrektion for hastighedstrekant med roterende jord, ingen stignings-/modstandstabsmodel).

engine-kind-reentry-description = Allen-Eggers ballistisk genindtrædelseskorridor: spidsdeceleration (uafhængig af ballistisk koefficient, V_e^2 sin|γ|/(2eH)), hastigheden og højden ved spids-g og spidsopvarmningshastigheden, for en indtrædelseshastighed/flyvebanevinkel/ballistisk koefficient gennem en eksponentiel atmosfære, plus en plan punktmasseintegration af den samme ballistiske indtrædelse med tyngdekraft, jordkrumning og US Standard Atmosphere 1976 (spidsdeceleration, fart, højde og tid ved spidsen). MODELLED ballistisk (løftefri) indtrædelse; opvarmningsoutput er spidsopvarmnings-HASTIGHEDEN, ikke en varmeflux (ingen aerotermisk/TPS-model).

engine-kind-eo-coverage-description = Jordobservationsnyttelasts fodaftryk og dækningsgeometri (SMAD-rumtrekant): jordens vinkelradius, svathbredde, nadir-jordprøveafstand, maksimal off-nadir-adgang, cirkulær periode, J2-knudeperiode og ækvatorial jordsporsafstand med et sammenhængende-dækning-flag, for en banehøjde, inklination (solsynkron som standard) og sensor-FOV/IFOV. MODELLED sfærisk-jord-geometri (ingen radiometri/MTF/atmosfære/jitter/glint); knudeafstand R_e·(ω − Ω̇)·T_nodal med førsteordens J2-sekulære rater.

engine-kind-space-packet-description = CCSDS 133.0-B Space Packet Protocol-indramning: kod en syntetisk TM/TC-pakkestrøm (6-oktet primær header + datafelt) og rapportér dekodning af header pr. pakke, samlede oktetter og en nøjagtig kod↔dekod-rundtur. Deterministisk nøjagtig bitlayout-indramning — myndighedernes pakkeformat-interoplag; IKKE en certificering af formatkontrol (ingen sekundær-header-/CRC-/segmenteringslogik ud over flagene).

engine-kind-attitude-budget-description = 3-DOF attitude- og pegefejlbudget: det værst tænkelige tyngdegradient-forstyrrelsesmoment ((3/2)(μ/R³)ΔI) og et root-sum-square-pegefejlbudget over navngivne 1σ-bidrag (sensorstøj, reaktionshjulsjitter, termisk, justering) med det dominerende led, for en banehøjde + legemets inertispredning. MODELLED skalart AOCS-budget — et komplement før hardware til Basilisk/42, ikke en simulering af kontrolsløjfe/6-DoF/fleksible modes.

engine-kind-passes-description = Forudsigelse af jordstationsoverflyvninger: de tidsdomæne-synlighedsoverflyvninger (AOS/TCA/LOS, maksimal tilsyneladende elevation, varighed) af en cirkulær bane, som SGP4-middelelementer ved vinduets start, over en station over en elevationsmaske på tværs af et vindue, med samlet adgangstid. SGP4/SDP4-propagering i IAU 2006/2000A jordfast referencesystem (valgfri UT1 - UTC og polbevægelse), ITU-R P.834-9 troposfærisk refraktion og downlink-lystiden (begge som standard slået til), krydsninger løst til 1e-7 s og kulminationen ved gyldensnitssøgning. Overflyvningsgeometrien er VALIDATED mod Orekit 13.1.8 ved stationer i havniveau; scenariets bane og station er illustrative input.

engine-kind-link-budget-description = Envejs-linkbudget over CCSDS 401 / DSN 810-005-linkligningen: frirumsdæmpning, C/N₀, Eb/N₀, margin og lukning for en sende-EIRP, modtage-G/T, afstand, datarate og bånd (s|x|ka) mod et påkrævet Eb/N₀. En deterministisk ingeniørberegning ud fra de leverede input (ikke et kalibreret terminaldatablad).

engine-kind-lunar-time-budget-description = MODELLED ende-til-ende tidsfejlbudget for Coordinated Lunar Time (LTC): de syv LTC-fejlled samlet som tidsfejlkurver x_i(τ) over et helt middelværditidsgitter, rod-summeret til x_Σ(τ), og ur-mod-referencesystem-KRYDSNINGS-τ, hvor det voksende urled overhaler det konstante realtids-led for realisering af referencesystemet (under det er budgettet begrænset af referencesystemet, over det begrænset af uret) — det ærlige svar på artefaktet med ét enkelt τ. τ-hældningerne er på lukket form og kan kontrolleres analytisk (ur τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }, gulve τ^0, måling τ^{ "{" }-1/2{ "}" }), og urrækkerne gengiver de offentliggjorte endagsurspecifikationer (crate::clock_specs); STØRRELSERNE af gulvene for RF-/optisk link, realisering af referencesystemet, relativistisk residual og efemeride er Modelled budgettildelinger (dokumenterede standardværdier, kan tilsidesættes af kalderen), ikke målinger. Bidraget er den reproducerbare krydsnings-τ, ikke et certificeret tal pr. led; ikke certificeret til operationel tidtagning.

engine-kind-hybrid-optical-rf-description = MODELLED heterogen optisk + RF PNT-fælles-kvalitetsmål (P5): sammensætter 1550 nm tovejs optisk linkbudget (fotonbegrænset tovejs-afstandsmålings-CRLB σ_τ/√N og diffraktionsfodaftryk λ/D·afstand), et tværmodalt solution-separation-RAIM-beskyttelsesniveau (position OG timing), der fusionerer de løse RF- og tætte optiske løsninger med forskellige kovarianser, den optiske klarhimmeltilgængelighed for N stationer (uafhængig forening 1−Π(1−a_i) og en rumligt korreleret variant), en optisk↔RF-tilstands-/kovarians-overdragelse med et BEVIST bit-kontinuert (spring-frit) middelværdi og en NEES χ²-konsistensport, og en fælles score for P(tilgængelig OG præcisionsklasse OG integritetssikret) med korrelationshåndtering. VALIDATED lukket form: afstandsmålings-CRLB, diffraktionsfodaftryk, χ²-beskyttelsesniveau-kvantilen, forenings-kombinatorik, overdragelsens middelværdikontinuitet + NEES-port og det fælles uafhængige produkt. MODELLED: de optiske tabstildelinger, RF-/optiske σ-størrelser, skyklimatologi-input, korrelationer og P_HMI-budget. Ikke et certificeret tilgængeligheds-/integritetsprodukt.

engine-kind-cislunar-observability-description = MODELLED plan cislunar konstellationsobserverbarhed (P6): sporer en konstellation af fire differentialkorrigerede plane DRO-rumfartøjer med afstandsmåling mellem satellitter og rapporterer, hvor meget af et rumfartøjs fire tilstande [x,y,ẋ,ẏ] buen gør observerbart. Udsender (1) tabellen rang mod buelængde for et enkelt kun-afstands-link — øjeblikkeligt rang 1, voksende mod alle fire tilstande, når buen forlænges (P6 Table 1); (2) observerbarhedsgramianens egenspektrum + konditionstal over buen; (3) sammenligningen af øjeblikkelig rang for kun-afstand mod afstand+afstandsrate (Doppler-designhåndtaget) plus rapporteringen af GDOP, der er singulær for kun-afstand / defineret for afstand+rate; og (4) en uafhængig SRIF-krydsvalidering, hvis posteriore kovarians bliver endelig / velkonditioneret præcis ved den bue, hvor den observerbare rang når fire. VALIDATED kerne: den observerbare rang er en rangafslørende singulærværdi-tærskel krydstjekket mod gramianens egenrang; egenspektret overholder de spektrale invarianter (trace=Σλ, det=Πλ, Frobenius²=Σλ²); den variationelle STM er den ved endelig differens afprøvede CR3BP-STM; rækkerne i afstands-/afstandsrate-jacobianen er analytiske partialer afprøvet ved endelig differens (krydstjekket mod cratens 3-D-afstandsrate-observabel); de fire begyndelsesbetingelser er differentialkorrigerede plane DRO'er, der lukker til et snævert periodicitetsresidual og er retrograde; rangovergangen er krydsvalideret mod cratens kvadratrods-informationsfilter (posterior kovarians endelig præcis ved fuld rang, cond(P)=cond(OᵀO)); et rangdefekt snapshot flagges som GDOP-udefineret (fim condition=inf), aldrig som en falsk endelig værdi — den samme singulær-geometri-vagt, som pvt::solve_spp anvender. MODELLED: konstellationsudformningen (DRO-perilune-amplituder og -faser) og den specifikke rangudvikling, den giver. Ikke et certificeret produkt for navigationsydeevne.

engine-kind-conflict-resilience-description = MODELLED lagdelt PNT-konfliktrobusthed (P7): en bruger i et omstridt miljø råder over flere PNT-lag (åben-service-GNSS, bredbånds-GNSS, en autentificeret konstellation, et supplerende relæ), hvert med en basistilgængelighed, en 1σ-nøjagtighed og en sårbarhed over for nægtelse pr. vektor over for den delte jamming-/spoofing-trussel. Et intensitetssweepet SEEDET Monte Carlo nægter hvert lag med sandsynlighed clamp(vulnerability·intensity·vector_weight,0,1), fusionerer de overlevende efter den lukkede invers-varians-regel σ_fused=(Σ 1/σ_i²)^(−1/2) og rapporterer totaltabssandsynligheden (alle lag nægtet), den mediane fusionerede fejl og anvendelighed/nægtelse pr. lag mod intensitet. Det overordnede robusthedsforhold (enkeltlag mod lagdelt totaltabssandsynlighed) lander på ~7x under UAFHÆNGIGHEDS-antagelsen; et enfaktor-gaussisk-copula-sweep med korreleret nægtelse viser derefter, at disse ~7x kollapser mod 1, når nægtelseskorrelationen stiger (korrelation underminerer lagdeling). En prior-følsomhedsblok afgrænser hovedtallet over de KILDEBELAGTE sårbarheds-priors via mcda-tornado + en Dirichlet-omfordeling af trusselsindsats + percentil-CI'er. VALIDATED kerne: Monte Carlo-totaltabet konvergerer mod det lukkede uafhængige produkt Π_i p_deny_i (inden for MC-standardfejl ved et fast seed og stort N); invers-varians-fusionen er en lukket identitet; ved ρ=0 reduceres copulaen til den uafhængige model, og hvert ρ bevarer hvert lags marginale nægtelsesrate. MODELLED: størrelserne af sårbarhed/tilgængelighed/nøjagtighed pr. lag er kildebelagte-men-Modelled input (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), og den specifikke størrelse på ~7x og kurveformen for forhold mod korrelation følger af denne parametrisering. En §4.2-overlevelsesopdeling pr. vektor opløser derefter den delte RF-trussel i de fire navngivne vektorer (jamming/spoofing/kinetisk/cyber) og rapporterer hver vektors graduelle nedbrydningskurve for anvendelig PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: det seedede Monte Carlo pr. lag konvergerer mod denne lukkede form; jamming er den skarpeste vektor for den korrelerede RF-baseline, og det RF-immune inertiallag er den afgørende overlever. Ikke et certificeret produkt for navigationstilgængelighed.

engine-kind-lunar-attack-surface-description = Angrebsflade for signalsikkerhed ved lunar overflade-navigation (P1): sammensætter de åbne signalsikkerhedsanalyser i ét binært tilgængeligt run. Rapporterer (1) AFS-modtaget effekt og dens effektOVERSKUD i forhold til en terrestrisk GPS-reference, plus 12-18 dB-følsomhedsbåndet som et ægte multiakse-sweep over linkinput (referenceniveau x EIRP x skråafstand) med afstemning af den 25x-afrundede / 28x-uafrundede lineære faktor. REVIDERET (regel R4): dette rapporterede et { $lit_15_6 } dB effektUNDERSKUD og en 32x/36x-faktor, indtil GPS-referencen blev rettet fra -125 / -{ $lit_128_5 } (som er dBm-tallene) til -155 / -{ $lit_158_5 } dBW, ICD-GPS-200-værdierne, som jamming-modulet altid har båret. Fortegnet vendes: det modellerede lunare AFS-signal er { $lit_14_4 } dB STÆRKERE end terrestrisk GPS L1 C/A, ikke svagere. Selve den modtagne effekt flyttede sig ikke en bit, og den lineære faktor er den gamle divideret med præcis 1000, hvilket netop er dBm-til-dBW-forskydningen på 30 dB; (2) den krævede sendeeffekt for en angriber til at spoofe (J/S = 3 dB) og til at nægte (J/S = 30 dB) ved hver afstand, det inverse af J/S-linket; (3) det orbitale indfangningsfodaftryk under et ægte uniform-apertur-antennemønster (Airy [2 J1(x)/x]^2), en højdebegrænset sub-hemisfærisk kalot, hvis limb IKKE indfanges; (4) et beregnet udfald af tracking-sløjfens spoof-indfangnings-pull-in (trækker en spoofer med matchet kode ved en given effektfordel og kodeforskydning faktisk DLL/PLL med sig) i stedet for den påstandne 3 dB-tærskel; (5) den geometriske horisontrækkevidde på et atmosfæreløst legeme for en hævet overfladesender; og (6) OSNMA/TESLA-autentificeringsbudgettet (20 bit/s overhead = ~40 % af en 50 bit/s AFS-navigationsmeddelelse, nøgleafsløringslatens, 2^-40 forfalskning). En tom forespørgselskrop gengiver P1-baseline; hvert input har en standardværdi og kan tilsidesættes. VALIDATED delresultater bærer deres kildemoduls uafhængige reference (lukket form dB-radiometri; invers J/S-rundtur; Airy-mønster mod A&S Bessel og sfærisk kalotgeometri; DLL/PLL-pull-in mod Kaplan & Hegarty; sfærisk-tangent-horisontidentitet mod eo_payload; OSNMA SIS-ICD-feltstørrelser). MODELLED: de repræsentative geometri-/effektstørrelser og de specifikke værdier i indfangningskortets celler. Ikke et certificeret sikkerhedsprodukt.

engine-kind-realtime-frame-eop-description = Budget for realtidsforudsigelse af lunart referencesystem / jordorientering: P4 Table 1 (konsistenskontrollen af referencesystemfejl — efterbehandlet ~{ $lit_0_27 } m ↔ ~{ $lit_0_010 } ms og realtid ~15 m ↔ ~{ $lit_0_5 } ms, hver referencesystemposition udtrykt som dens ækvivalente UT1-fejl via L19-løftearmen Δr = D_EM·ω⊕·ΔUT1) og Table 2 (målt UT1-forudsigelsesfejl mod horisont — L18-kurven aflæst direkte fra den virkelige IERS finals2000A-serie: Bulletin A − Bulletin B-slutgulvet og den flerdages persistensprædiktorfejl, hver afbildet til en månereferencesystemposition ved L19), plus L21 root-sum-square-realtidsbudgettet for referencesystemfejl (EOP + efemeride + realiseringsgulv). VALIDATED lukket form (L19-løftearmen, ω⊕ krydstjekket mod CIO-jordrotationsvinklen) og VALIDATED virkelige data (L18-kurven fra de virkelige finals2000A-rækker); MODELLED er størrelserne af lunar-relæ-OD-kovariansen og realiseringsgulvet for referencesystemet (repræsentative tildelinger) og persistensprædiktoren (ikke IERS's operationelle Bulletin A-algoritme). Ikke et certificeret realtidsprodukt for referencesystem.

engine-kind-aperture-duty-cycle-description = Aperturdriftscyklus: den tidsdeling mellem navigation og kommunikation, som en kontaktplan medfører for en pulje af styrbare aperturer. Tager en kontaktplan (en liste af `[[contacts]]` aos_s/los_s-vinduer, der hver beder om navigation eller kommunikation — det samme aos_s/los_s-vokabular, som `passes`-prædiktoren udsender), et aperturantal og en ARBITRERINGSPOLITIK (navigationsprioritet som standard, eller kommunikationsprioritet, eller ikke-præemptiv først-til-mølle), og rapporterer navigationsdriften, kommunikationsdriften, tomgangsdriften og udfaldet pr. session — den kontakttid, en session anmodede om, og ingen apertur leverede. Et nøjagtigt intervalsweep over vinduesgrænserne, så vinduer, der berører hinanden, aldrig konkurrerer, og ingen aperturssekunder tælles dobbelt; navigations-, kommunikations- og tomgangsaperturssekunder akkumuleres uafhængigt og går op mod apertures*horizon_s. Rapporten angiver den afklarede politik, dens fulde definition og definitionerne af drift og udfald, fordi et driftstal citeret uden sin arbitreringspolitik ikke kan reproduceres. MODELLED planlægningsaritmetik: ingen omstillings-/omtunings-/skiftetid opkræves, når en apertur skifter tjeneste eller session, ingen datavolumen, bufferstatus, energibudget eller linklukning indgår i beslutningen, og kontaktvinduerne er input — deres geometri er, hvad der nu frembragte dem. Ikke et planlægningsprodukt til jordsegmentet.

engine-kind-lunar-jamming-description = Lunar-nativ RF-jamming: jammer-til-signal-forhold pr. satellit, effektiv C/N₀ og tab af lås for en selenografisk overfladebruger under en lunar overflade- (eller hævet) jammer, over den illustrative konstellation i lunar bane af Moonlight/LCNS-klassen fra offentlige kilder. Sammensætter den eksisterende åbne jamming-fysik (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) med den eksisterende lunare himmelgeometri (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri udledes på ny. I modsætning til jord-`jamming`-typen er signalleddet IKKE en fast modtaget effekt: hver satellits isotrope modtagne effekt er dens eget linkbudget EIRP − FSPL(skråafstand), så J/S varierer satellit for satellit med lunar afstand og elevation. Rapporterer ÉN RÆKKE PR. SYNLIG (epoke, satellit)-FORBINDELSE — azimut, elevation, skråafstand, begge modtagne effekter, som J/S er differensen af, J/S, den nominelle og effektive C/N₀ og låsestatus — plus samlede kvalitetsmål ved siden af (aldrig i stedet for) den tabel, og den samme tabel som et CSV-artefakt. Hvert udsendt numerisk felt bærer en enhed og en proveniensklasse. VALIDATED delresultater bærer deres kildemoduls uafhængige reference (anti-jam-ligningen og J/S-linket fra Kaplan & Hegarty §9.4, eksternt refereret i tests/gnss_denied_jamming_resilience_reference.rs; den lunare geometri fra lunar_service). Selve sammensætningen er krydstjekket mod en uafhængig sti med to linkbudgetter (linkbudget::received_signal_power_dbw, et andet udtryk for frirumstab) til 1e-9 dB. MODELLED: den illustrative konstellation, de repræsentative EIRP / jammereffekt / antennegevinster / støjtemperatur og fraværet af terrænskygge, multipath, AGC-dynamik og adaptiv nulstilling. Ikke et certificeret nægtelsesprodukt. Med en konfigureret jammer bærer rapporten også en NÆGTELSESKONTUR MED ET USIKKERHEDSBÅND i stedet for en kontur aflæst fra ét skalar: hele den målte fordeling af ønsket-signal-C/N₀ over tabellen pr. satellit (n, min, p05, p25, median, p75, p95, max, middel, stikprøvestandardafvigelse og stikprøvens egen asymmetri) og konturen evalueret ved hver af disse ordensstatistikker under BEGGE nægtelseskriterier, som motoren kender — det gældende effektforholds-kriterium (J/S = 30 dB, som i attack-surface og tracking-loop) og tab-af-lås-kriteriet (effektiv C/N₀ falder til tracking_threshold_dbhz, det kriterium, denne rapports egen statuskolonne bruger) — på begge akser i nægtelsesplanet (påkrævet jammer-EIRP ved scenariets afstand, nægtelsesafstand ved scenariets EIRP). Båndets kanter ER contour(p05) og contour(p95), den samme lukkede afbildning anvendt på stikprøvens egne kvantiler: ikke en sigma tilpasset til stikprøven og ikke median ± k·stdev, hvor stdev udsendes for kontinuitetens skyld og ikke bruges af noget. En kvantil, der allerede ligger på eller under tracking-tærsklen, har ingen endelig nægtende J/S, og dens tab-af-lås-kolonner er null med en talt begrundelse, aldrig en afklemt radius.

engine-kind-ins-trn-coast-description = INS/TRN-fejlmodel for udløb: positionsfejl mod udløbsvarighed, bygget ud fra IMU-koefficienter i stedet for at blive sweepet som en antaget driftrate. Fem vækstbidrag — accelerometerbias, gyrobias-tilt gennem tyngdekraften, velocity random walk, angle random walk og skalafaktor mod tilbagelagt afstand — hvert propageret gennem en niltilstands lokalniveau-inertialfejlmodel med Schuler-feedback ved en angivet bredde og højde (de førsteordens love for kort udløb t², t³, t^1.5, t^2.5 og t¹/t² rapporteres ved siden af) og kombineret efter en ANGIVET regel (root-sum-square som standard, eller lineær sum, eller deterministisk sum med stokastisk rss; alle tre beregnes ved hvert run, så valget er synligt i stedet for skjult). De udløbsvarigheder, der når positionstærskler angivet af kalderen (10 m og 50 m som standard), lokaliseres af motorens eksisterende bisektion, hver med en opdeling pr. bidrag, der navngiver den dominerende kilde, og hvert enkelt bidrags krydsning inverteres desuden algebraisk, så de to stemmer overens. En terrænreferencenavigations-tilstand begrænser udløbet med periodiske positionsbestemmelser og rapporterer det største interval mellem positionsbestemmelser, der holder hver tærskel; en positionsbestemmelse kun for position lader hastighedsfejl og tilt leve videre over positionsbestemmelsen, så den ikke altid begrænser udløbet ved enhver rate, og rapporten siger det i stedet for at returnere et nul. MODELLED: IMU-klassens koefficienter er repræsentative båndtal, ikke et datablad, og terrænpositionsbestemmelsens residual er et input. En tærskel, der ikke nås, rapporteres som null med en status, aldrig som et nul. Ikke et certificeret produkt for inertialnavigationsydeevne.

engine-kind-lunar-vlbi-fim-description = Lunar-VLBI-stationskoordinatkovarians: forsinkelsespartialerne af lunar-vlbi-observablen akkumuleret over en eksplicit PLAN (baselines x epoker) til en Fisher-informationsmatrix, inverteret og rapporteret som stationskoordinatkovariansen og stationens sigma pr. koordinat — et beregnet motoroutput i stedet for en skalar forsinkelsespræcision skubbet gennem en antaget isotrop g = 3-ligefordelingsfaktor. Tilstanden bærer jordFASTE (ITRS) stationskoordinater, så jacobianen er det inertiale partial roteret med hver epokes GCRS->ITRS-matrix: jordrotationen er det, der gør disse koordinater observerbare, og rapporten MÅLER den jordfaste synslinjesvejning og beacondeklinationen i stedet for at antage dem. Én observation er ét (baseline, epoke)-par med BEGGE stationer over elevationsmasken, vægtet 1/delay_sigma_s^2. Rapporterer rang, datumdefekt, konditionstal, hele informationsspektret, kovariansmatricen, sigma pr. station pr. akse og i 3-D samt det frie netværks nulrum ved hvert run; ved rangdefekt offentliggøres det overordnede sigma som NULL med en status, aldrig aflæst fra en næsten singulær invers. Ligefordelingsværdien c*delay_sigma_s*sqrt(g/N) for den SAMME plan udsendes ved siden af den beregnede værdi med forholdet, sammen med den isotrope sporgrænse sqrt(p/trace(M)), som AM-HM gør til et hårdt gulv — så forholdet er den anisotropi, antagelsen kasserede. Forsinkelseslukningen tau_ik = tau_ij + tau_jk gør kun n-1 af de n(n-1)/2 baselines geometrisk uafhængige; rapporten angiver begge antal. MODELLED: månecentrets efemeride, stationsure, troposfære og jordorienteringsparametre holdes FASTE, og observationer behandles som uafhængige, så kovariansen er en Cramer-Rao-grænse for et reduceret parametersæt, ikke et forudsagt sessionsresultat; forsinkelsessigma, stationskoordinater og plan er input. Det partial, som den geometriske forsinkelsesjacobian udelader (det differencerede Shapiro-led), måles ved endelig differens og udsendes. Ikke et geodætisk produkt.

engine-kind-tracking-loop-description = Tab af lås i tracking-sløjfer: C/N0 -> lås/oplåsning MED HYSTERESE, tiden det tager at miste låsen, og spoof-pull-in som funktion af kode- og bærebølgeforskydningens RATE. Motorens eksisterende nægtelses- og indfangningskriterier er forhold på modtaget effekt (en jammer nægter ved J/S = 30 dB, en spoofer indfanger ved 3 dB); et reelt tab af lås er ikke et effektforhold, det er der, hvor en sløjfes jitter plus dynamiske belastning efterlader dens tracking-tærskelbudget. Rapporterer (1) termisk 1-sigma-jitter for bærebølge (Costas) og kode (ikke-kohærent early/late) mod C/N0, kvadreringstab medregnet, mod de angivne regler 3*sigma_PLL + theta_e <= 45 deg (15-graders-reglen i tre-sigma-form) og 3*sigma_DLL + ramp lag <= d/2 chips; (2) C/N0-tærsklerne for tab og genopnåelse af lås med den bindende sløjfe navngivet, hvor genopnåelsestærsklen er UDLEDT af den bredere båndbredde, en modtager gentrækker ind ved, i stedet for påstået, så hysteresebredden må ligge mellem 5*log10(ratio) og 10*log10(ratio) dB; (3) den erklærede tid til at miste låsen fra en låsedetektor med to tærskler og bekræftelsesophold, drevet over en C/N0-rampe, rapporteret adskilt fra den fysiske faseflugttid (Viterbis middeltid mellem cycle slips, i log10 s, fordi den spænder over hundreder af dekader); (4) spoof-pull-in-grænser — den største kodeslew og bærebølge-Dopplerrate, en offers sløjfer kan følge, med et kort over begge akser, fordi en spoofer, der slewer hurtigere end disse, ikke indfanger sløjfen, men løber fra den; og (5) den NÆGTELSESRADIUS, sløjfedynamikken medfører, rapporteret SAMMEN MED den eksisterende effektforholdsradius, aldrig i stedet for den, med deres fortegnsbehæftede differens som et eget navngivet felt (denial_radius_delta_km) og en definition ved siden af. Hvert udsendt numerisk felt bærer en enhed og en proveniensklasse. VALIDATED lukkede former: udtrykkene for bærebølge- og kodejitter, sløjfefilterreduktionen sqrt(2*B_n*T) og førsteordens ramp lag er krydstjekket mod motorens egen sdr-korrelator trinet frem på seedet syntetisk IF — en anden vej til de samme tal — til henholdsvis { $lit_0_6 } %, { $lit_3_7 } % og { $lit_0_17 } %, og den modificerede Bessel I0 bag cycle-slip-tiden mod standardtabulerede værdier til 1e-7. Den nedre gyldighedsgrænse er hævdet, ikke blot angivet: under ~32 dB-Hz ved 1 ms mætter den reelle atan-diskriminator mod sit +-pi/2-område og måler mindre jitter end enhver lineær teori. MODELLED: sløjfebåndbredderne, integrationstiden, korrelatorafstanden, pull-in-båndbreddeforholdet, bekræftelsesopholdene, jammereffekten og antennegevinsterne er repræsentative båndtal, ikke et datablad. IKKE modelleret: oscillator- (Allan-deviation) og vibrationsjitter, begrænsning af frontendens båndbredde, multipath, AGC-dynamik, tab ved databitovergange, ekstern støtte og enhver halvcyklus-korrektion til Costas' cycle-slip-formel. Under sløjfedynamik har spoof-indfangning slet ingen radius — den bindende begrænsning er forskydningsraten, ikke effekten — så det felt er null med en begrundelse i stedet for et opdigtet tal. Ikke et certificeret produkt for modtagerydeevne.

engine-kind-araim-reference-check-description = Offentliggjorte ARAIM-certificerings-referencevektorer: motorens ARAIM-horisontale og vertikale beskyttelsesniveauer kørt mod WG-C ARAIM Technical Subgroups EGNE gennemregnede numeriske eksempler, ved den tolerance (TOL_PL = 5e-2 m), som disse dokumenter selv angiver. To vektorer er indlagt som fixtures, hver med sin hentings-URL, hentedato, kildefilens SHA-256 og side: Reference Airborne Algorithm Description Document v3.1 (2019) Appendix D — selvkonsistent, og acceptvektoren — og Milestone 3 Report (2016) Annex A section A.IX, den fremstilling, forskningsbibliografierne citerer. Hvert offentliggjort input (10-satellit-2-konstellations-geometrimatricen, C_int- og C_acc-variansdiagonalerne, b_nom, P_sat, P_const og LPV-200-konstantsættet) og hvert offentliggjort output (VPL, HPL, EMT, sigma_v_acc, K_fa_3 og de to konstellationsfejltilstandes sigma_3, sigma_ss_3 og b_3) rapporteres ved siden af motorens eget tal og deres absolutte differens. Beskyttelsesniveauligningen løses IKKE på ny her: referencens tilstandsliste afleveres til motorens eksisterende raim::araim_protection_level / araim_integrity_risk, så bisektionen og den gaussiske hale-algebra under test er motorens egen; kun geometrien, delløsningerne, detektionstærsklerne og den offentliggjorte budgetfordeling bygges til den. EKSTERNT KONTROLLERET mod 2019-vektoren: VPL { $lit_18_2926 } m mod { $lit_18_3 } m offentliggjort, HPL { $lit_13_4063 } m mod { $lit_13_45 } m, EMT { $lit_7_2997 } m mod { $lit_7_2998 } m, sigma_v_acc { $lit_1_3694 } m mod { $lit_1_3694 } m, og alle seks offentliggjorte mellemresultater inden for en halv enhed i deres sidste udskrevne decimal. 2016-vektoren bærer to interne defekter, som rapporten angiver i stedet for at skjule — en fortegnsfejl i række 3 af G og en K_fa_3 evalueret ved 57 fejltilstande, mens dokumentet angiver N_fault_max = 1 (12 tilstande) — så dens geometri-mellemresultater gengives præcist, mens dens beskyttelsesniveauer rapporteres som målte afvigelser og udelades af acceptværdien; tolerancen udvides aldrig for at rumme dem. Hvert udsendt numerisk felt bærer en enhed og en proveniensklasse, og et afskrevet tal mærkes `published`, så det aldrig kan forveksles med et beregnet. OMFANG: kun N_fault_max = 1 (fejltilstande for enkelt satellit og enkelt konstellation) er implementeret, og et tilfælde, hvis priors kræver samtidige fejlundermængder med flere hændelser, bliver REFUSED i stedet for stiltiende at blive afkortet; fejldetektion, udelukkelse, chi-i-anden-konsistenskontrollen og dobbelttællings-omfordelingstrinnet i referencealgoritmen ligger uden for omfanget. Dette gengiver en offentliggjort referencealgoritmes gennemregnede eksempel — det er ikke en certificering, et luftdygtighedsartefakt eller en godkendelse.

engine-kind-lunar-frame-campaign-description = Syvparameter-Helmert-datum (ligedannethed) for referencesystem, drevet af en SIMULERET OBSERVATIONSKAMPAGNE i stedet for en injiceret transformation. Et netværk af jordstationer observerer et katalog af beacons på den lunare overflade efter en eksplicit plan; de lunar-VLBI-forsinkelsespartialer akkumuleres over den plan til en Fisher-informationsmatrix for beaconkoordinater præcis som lunar-vlbi-fim gør; og den information propageres gennem Helmert-designet A = [I3 | [p]_x | p] ved katalogpunkterne til datumkovariansen H = A^T M_b A, diagnosticeret af crate::fim::crlb. INGEN transformation injiceres, og intet genfindes fra et plantet svar, så den rapporterede datumnøjagtighed udspringer af observationsprogrammet: halveres forsinkelsessigma, halveres den præcis, og en længere bue forbedrer den, fordi den libration, rapporten MÅLER (sub_earth_direction_sweep_deg), er det, der adskiller synslinje-beaconkoordinaten fra koordinaterne i himmelplanet. Rang, datumdefekt, konditionstal, hele spektret, de uobserverbare retninger I SYVPARAMETERBASISEN, den svageste retning selv ved fuld rang og hver parameters andel af den udsendes ved hvert run; en parameter, kampagnen ikke begrænser, offentliggøres som NULL med en status, aldrig aflæst fra en næsten singulær invers. Korrelation mellem beaconfejl er målt, ikke antaget: med stationerne holdt fast berører ingen observation to beacons, så informationsmatricen er præcis blokdiagonal (offblock_fraction 0), og med stationerne estimeret er den Schur-marginaliserede blok koblet, med den inducerede korrelation udskrevet og hele propageringen kørt igen med den kasseret, så prisen for en uafhængighedsantagelse er et tal. Den samme propagering under et isotropt sigma pr. koordinat og den genfindingsfejl, som lunar-frame-realisation-scenariet rapporterer, køres begge her og udskrives ved siden af kampagneværdien med deres forhold. MODELLED: beaconkataloget er kildebelagt, men KAMPAGNEN er simuleret — stationsnetværket og forsinkelsessigma er illustrative input, enkelte forsinkelsesobservationer behandles som uafhængige, og månecentrets efemeride, stationsure, troposfære og jordorienteringsparametre holdes FASTE, så datumkovariansen er en Cramer-Rao-grænse for et reduceret parametersæt. Ikke et geodætisk produkt.

engine-kind-lunar-llr-datum-description = Syvparameter-Helmert-datum for lunart referencesystem, drevet af en VIRKELIG, ARKIVERET observationskampagne i stedet for en simuleret. Hvor lunar-frame-campaign fjernede den injicerede transformation, men stadig angav sit stationsnetværk, sin plan og sin sigma pr. observation som ILLUSTRATIVE input, henter denne type alle tre fra målinger: epokerne er jordsendetiderne for arkiverede ILRS Consolidated Laser Ranging Data-normalpunkter, observationerne er de laserafstande, der virkelig blev affyret mod de fem retroreflektorarrays på Månen, og hver observationsvægt er dét normalpunkts egen arkiverede præcision bin_rms/sqrt(n_raw) aflæst fra filen. Stationskoordinater kommer fra IERS ITRF2020 SLR-løsningen (propageret til epoken ved deres offentliggjorte hastigheder) og reflektorkoordinaterne fra JPL DE430 Table 7 i det mean-Earth/mean-rotation-referencesystem, som IAU 2015 WGCCRE-modellen realiserer. Afstandspartialer akkumuleres til den fælles Fisher-informationsmatrix for reflektorkoordinater og propageres gennem det samme Helmert-design til datumkovariansen, diagnosticeret af crate::fim::crlb. Rang, defekt, konditionstal, spektrum, uobserverbare retninger i syvparameterbasisen, den svageste retning ved fuld rang og hver parameters andel af den udsendes ved hvert run, og en ubegrænset parameter offentliggøres som NULL med en status. Korrelation mellem arrays er MÅLT til præcis nul i stedet for antaget, fordi en laserafstand berører ét array. En post, kataloger ikke kan placere — en station uden offentliggjort ITRF-position — SPRINGES OVER OG TÆLLES, aldrig givet en erstattet koordinat. HVILKE LINKS DER ER MÅLT OG HVILKE DER ER MODELLED ER SELVE RAPPORTEN, IKKE EN FODNOTE: månecentrets efemeride og IAU-legemsorienteringen forbliver modelleret, og deres samlede størrelse udsendes som den observerede-minus-beregnede envejsafstandsresidual over hvert anvendt punkt; troposfære, faste legemstidevand, stationsexcentricitet, polbevægelse, UT1-UTC, relativistisk forsinkelse og stationsure er fraværende og indeholdt i den residual. Fordi en efemeridefejl kun når en kovarians gennem retningen af hver synslinje, genløser hvert run også hele datummet med alle partialer vippet med sensitivity_tilt_deg (fortegn skiftende) og udsender forholdet, så kovariansens ufølsomhed over for den modellerede efemeride er et tal i stedet for et argument. Den simulerede kampagnes egne tal KØRES og udskrives ved siden af de målte, ikke afskrevet. MODELLED: syvparametertallene er en Cramer-Rao-grænse for et reduceret parametersæt på en virkelig plan — ikke et løst datum, ikke en LLR-analyse og ikke et geodætisk produkt. Den indlagte virkelige dataudsnit følger med repositoryet, men ikke med den offentliggjorte crate; peg data_dir på en kopi af det.

engine-kind-lunar-beacon-description = Udvidelse af en lunar orbital navigationstjeneste med overfladebeacons, som en kørbar før/efter-tabel. En sydpolar bruger ser et spredt orbitalt sæt i en smal plet af himlen, så afstandsmålingens geometri er dårligt konditioneret; nogle få OPMÅLTE OVERFLADEBEACONS leverer de synslinjerækker med lav elevation og bred azimut, som et helt igennem overliggende sæt mangler, og den horisontale præcisionsfortynding kollapser. Scenariet rapporterer tre konfigurationer ved én epoke — satellitter alene, satellitter plus de synlige beacons og en større konstellation som den alternative vej til den samme geometri — hver med sine antal synlige kilder, sin fulde DOP og den realiserede 1-sigma-nøjagtighed i METER, opnået ved at gange igennem med en brugerækvivalent afstandsfejl pr. beacon, sammensat som root-sum-square af urssynkroniserings-, multipath- og opmålingsled. Beaconsynlighed er den geometriske horisont for to højder på en atmosfæreløs Måne (ingen atmosfære, så grænsen er præcis), og DOP-sammensætningen er den samme kerne, der er krydstjekket mod gnss_lib_py i tests/dop_reference.rs. HVORFOR DENNE TYPE FINDES: modulet bag den har ligget i motoren og været kontrolleret mod en uafhængig DOP-sti siden L08/L09, men det var ikke tilgængeligt fra et run — ingen type, ingen dispatch-arm, ingen medfølgende fil. README annoncerede muligheden, og verifikationsmatricen havde slet INGEN række for den, så den på én gang var hævdet i prosa og ikke hævdet i registeret, mens den var utilgængelig i motoren. Standardværdierne er den geometri, der allerede bærer en indlagt golden (en bruger ved -80 deg med en 2 m antenne, tre beacons ved -80/0, -79/+60 og -79/-60 ved 2 km, et seks-satellit illustrativt LCNS-snapshot ved t=0, en maske på 5 deg), så et bart run gengiver en tabel, en uafhængig reference allerede dækker, i stedet for at opfinde friske tal. MODELLED: konstellationsudformningen, beaconplaceringen og hver fejlbudgetstørrelse er illustrative input, ikke en udrullet opmåling eller et målt link; kun DOP-aritmetikken, horisontens lukkede form og relationen sigma = DOP x sigma_URE er eksternt forankret. Ikke en forpligtelse på tjenesteydeevne.

engine-kind-earth-gnss-lunar-description = Jord-GNSS-modtagelse på lunar afstand, det svagsignal-lag, konfliktrobusthedsartiklen nævner, og som motoren ingen model havde for. En GNSS-satellit peger sin antenne mod Jorden; en modtager nær Månen befinder sig omkring femten gange baneradius væk, så tre ting bider på én gang. Jorden OKKLUDERER BORESIGHT: fra 26,560 km spænder den en halvvinkel på { $lit_13_9 } deg, så enhver stråle mod Månen skal forlade senderen mindst så langt fra nadir, hvilket fjerner strålens top, før nogen effekt beregnes. Det, der er tilbage, er HOVEDLOBENS KANT OG SIDELOBERNE, det regime, LuGRE-nyttelasten faktisk opererede i under 2025. Og frirumstabet er omkring 208 dB ved L1, cirka 25 dB mere end en terrestrisk bruger betaler. Rapporten udsender én række pr. satellit (vinkel uden for boresight, jordokklusion, afstand, vejtab, sendegevinst ved den vinkel, modtaget effekt, bærebølge-til-støj-tæthed) og aggregerer kun de links, der klarer tracking-tærsklen. DEN RAPPORTERER OGSÅ KONDITIONERINGEN, fordi det er det, der definerer dette lag: hver synlig satellit ligger inden for en kegle på et par grader set fra Månen, så synslinjerne er næsten parallelle, præcisionsfortyndingen er enorm, og en Jord-GNSS-positionsbestemmelse på lunar afstand er en observation af TIMING-kvalitet langt mere end af positionskvalitet. MODELLED, og sendemønstret er grunden: gevinsten ved vinklen er en uniform cirkulær apertur (Airy), mens en rigtig GPS L1-antenne er et tolv-elements helix-array med en formet hovedlobe og ikke-Airy-sidelober. Målte mønstre findes og er ikke medtaget her, så rækkefølger og størrelsesordener er meningsfulde, mens dB for en enkelt satellit ikke er det. Bevidst FRAVÆRENDE, hver især med det resultat, at budgettet bliver optimistisk: intet ionosfærisk eller troposfærisk tab på de limb-strejfende stråler, intet polarisations-, peg- eller implementeringstab og en sfærisk Jord uden refraktiv udvidelse. Månens position er et INPUT (afstand plus inertial retning) i stedet for et efemeride-opslag, fordi det, der testes, er linket og strålegeometrien. At opgradere denne række til Validated kræver et målt sendemønster og LuGRE-normalpunkter; ingen af delene findes i repositoryet, og ingen af delene er opfundet her.

engine-kind-lunar-infrastructure-description = MODELLED studier af Månens bane og overflade som navigations- og geodætisk infrastruktur, fem studier bag én type valgt med `study`: od-consistency (onboard Jord-GNSS-banebestemmelse i en NRHO eller ELFO mod uafhængig radiometrisk jordbaseret banebestemmelse, bedømt ved deres egne kovarianser over et seedet Monte Carlo), carrier-phase (fælles overflade-orbiter-dobbeltdifferentieret bærebølgefase og løsning af heltalsmultiplicitet med LAMBDA), frame-coestimation (en overfladestation og orbitere føjet til afstandsmåling fra jordstationer for det syvparameter lunare referencesystemdatum), space-tie (GNSS, VLBI og laserafstandsmåling på ét rumfartøj, præcision af referencesystemknytningen mod den lokale knytningsfejl) og geodesy-sensitivity (Fisher-information af de lunare Love-tal h2, k2, l2 og den fysiske libration fra laserafstandsmåling, orbitersporing, et overfladegravimeter og et overfladeur). En begrænset tre-legemers-model med angivne forenklinger; tallene er kontrolleret mod uafhængige programmer, og intet sammenlignes med en måling af en lunar størrelse.

engine-kind-cislunar-arc-recovery-description = MODELLED test med uafhængig estimator af den cislunare observerbarhedstærskel for buelængde. Den tærskel er en RANG-aflæsning på observerbarhedsmatricen, samlet af de ANALYTISKE afstandsjacobianrækker og den ANALYTISKE variationelle tilstandsovergangsmatrix, og dens krydstjek med kvadratrods-informationsfilter folder de samme rækker — en konsistenskontrol mellem to numeriske maskiner, ikke bekræftelse. Denne type leverer den manglende opmand: en batch-mindste-kvadraters estimator, der faktisk GENFINDER chefens begyndelsestilstand fra simulerede målinger, med målepartialerne taget som CENTRALE ENDELIGE DIFFERENSER af den sammensatte fremadmodel. Den kalder ingen analytisk jacobianrække, ingen variationel STM, ingen singulærværdi- eller egenværdidekomposition, ingen ranktolerance og intet kvadratrods-informationsfilter — en kildetekstvagt i tests/cislunar_arc_recovery_reference.rs gør det håndhævbart — mens dynamikken (det samme RK4 CR3BP-flow), begyndelsesbetingelserne (den samme differentialkorrigerede konstellation), den skalare observabel og epokegitteret deles bevidst og navngives i den udsendte `independence`-blok, fordi to analyser af ét fysisk problem må være enige om fysikken for at være sammenlignelige. To kriterier, hvert sweepet over fem dekader af sin egen grænse: STØJFRI GENFINDING (hvert seedet forsøgs endelige tilstandsfejl højst recovery_factor gange dens a priori-forskydning — rang-analogen, uden singulærværdi-tolerance i sig) og MONTE CARLO-ESTIMERBARHED (den målte RMS-positionsfejl over et seedet støjensemble under en angivet grænse — estimerbarheds-analogen, målt i stedet for forudsagt). Understøtter de plane fire tilstande og de rumlige seks tilstande, familierne DRO / L2 halo / L2 NRHO, afstands- og afstandsrate-observabler og en månecentreret polær parametrisering, hvor transformationen anvendes på TILSTANDEN, og fremadmodellen differentieres på ny dér. MÅLT på det offentliggjorte plane DRO-gitter: estimatoren genfinder de fire tilstande fra { $lit_0_782609 } h mod rangkriteriets { $lit_2_086957 } h ved rel_tol 1e-6 (forhold { $lit_0_375 }) — ranktærsklen er IKKE bekræftet som en genfindbarhedsgrænse — mens den målte estimerbarhedsgrænse lander i den samme gittercelle som den formelle, { $lit_5_739130 } h, og den målte fejlkurve gengiver den formelle 1-sigma over 21 buelængder til et geometrisk middelforhold på { $lit_0_98 }. MODELLED: konstellationsudformningen, epokegitteret, det enkelte sporede link, forskydningens størrelse, målesigma og de to angivne grænser. Ikke et certificeret produkt for navigationsydeevne.

engine-kind-telecom-timing-description = Telecom timing: tidsfejl, maksimal tidsintervalfejl (MTIE) og tidsafvigelse (TDEV) for en GNSS-holdover, kontrolleret mod ITU-T-masker med et PASS eller FAIL og en margin pr. maske. Input er enten en SYNTETISK HOLDOVER (en oscillatorforudindstilling -- ocxo, rubidium, caesium eller csac, hver med stabilitets-, aldrings- og temperaturtallene fra et navngivet offentligt Microchip-datablad -- plus GNSS-tabstid, optagelseslængde og sampleinterval; det frit løbende ur bærer hvid, flicker- og, hvor databladstilpasningen kræver det, random-walk-frekvensstøj, lineær aldring og et sinusformet temperaturled) eller en INDLÆST SERIE af [time_s, time_error_ns]-par angivet inline (og kun på native builds en CSV-fil). Masker: ITU-T G.8272 (07/2025) PRTC-A og PRTC-B (max|TE| 100 / 40 ns, MTIE Tables 1-2, TDEV Tables 3-4); G.8272.1 (2024) Amd. 1 (07/2025) ePRTC låst (30 ns, Tables 1-2) og ePRTC-A holdover (Table 3-tidsfejlkuverten, der stiger fra 30 ns til 100 ns over holdover-perioden H bestemt af den låste varighed, MTIE Table 4, TDEV Table 5); G.8273.2 (2023) Amd. 2 (11/2025) T-BC/T-TSC-klasser A-C (max|TE|, konstant tidsfejl, lavpasfiltreret MTIE og TDEV) og klasse D (max|TE_L| 5 ns, det eneste klasse D-tal, der ikke er overladt til yderligere studier); G.8271.1 (2022) Amd. 3 (05/2025) referencepunkt C (max|TE_L| 1100 / 600 / 100 ns med MTIE Tables 7-1 til 7-3). Hver post, en Recommendation markerer til yderligere studier, er udeladt i stedet for udfyldt, og hver rapport angiver, hvad der ikke er implementeret. Rapporterer også tiden til at overskride hvert budget for maksimal tidsfejl (standard: 100 ns ePRTC max|TE_HO|, 400 ns netværksholdover-tildeling, 1100 ns punkt C, { $lit_1_5 } us klasse 4), MTIE-/TDEV-kurverne som en CSV-tabel med hver maskegrænse og en post for enheder og proveniens pr. numerisk felt. VALIDATED: MTIE- og TDEV-estimatorerne mod pakken allantools på en indlagt holdover-serie. MODELLED: masketabellerne er afskrifter, og en syntetisk holdover er en model bygget af databladmaksima, ikke en måling af nogen enhed. Ikke en formatkontroltest.

engine-kind-slot-timing-description = Slot timing: sekunder, indtil et frit løbende ur forlader guarden for et tidsindekseret routing- eller tasking-slot (den største absolutte tidsfejl, slottet tåler), bidraget fra hvert led i det øjeblik med det dominerende navngivet (positionsbestemmelsesusikkerhed, hvid fasestøj, hvid, flicker-, random-walk- og random-run-frekvensstøj, residual frekvensforskydning, temperatur, aldring), tiden tilbage siden sidste positionsbestemmelse og det største interval mellem positionsbestemmelser, der holder uret inden for, fratrukket latensen for positionsbestemmelsen. Oscillatoren er en KLASSE-standard (csac, uso, dsac, tcxo, ocxo eller rafs: én citeret Allan-deviation ved et sekund og et antaget rødstøjsgulv), en telecom-timing-DATABLADS-FORUDINDSTILLING eller et inline DATABLAD (Allan-deviation-maksima tilpasset som en kuvert, plus aldring og en temperaturkoefficient), eller en inline MÅLT FASEOPTAGELSE (dens overlappende Allan-deviation tilpasset ved vægtet mindste kvadraters metode i hvid-fase- og IEEE Std 1139-frekvensmodulationsbasen, så rødstøjsgulvet er målt i stedet for antaget). Et brud ud over den længste middelværditid, databladet eller optagelsen understøtter, markeres som ekstrapoleret. En valgfri spoofing-sektion tilføjer tidsbeskyttelsesniveauet for en modtager i kredsløb: banehastighed og -periode, hvor længe en enkelt jordbaseret spoofer kan nå satellitten pr. overflyvning, den urstøttede monitors gulv og CUSUM-detektionslatens, den betingede grænse, det træk, en spoofer ved en angiven maksimal ramperate akkumulerer, før satellitten forlader dens rækkevidde, eller en uafhængig kontrol kører, og om hver jordkontakt- eller crosslink-kontrol er uafhængig af den spoofer. VALIDATED: holdover-inversionen fra en tilpasset optagelse, holdt ude på et virkeligt caesiumur målt mod en brintmaser (tests/slot_timing_cs5071a_holdout.rs, datastyret); på en målt krystaloscillator er den udeholdte forudsigelse konservativ, men ikke inden for tærsklen, så krystaltilfældet er MODELLED. MODELLED: klasse- og databladskilder, de deterministiske led og spoofingvurderingen.

engine-kind-spectrum-description = L-bånd-spektrummodel og vandfald: hele GNSS-L-båndet som én effektspektraltæthed (PSD), frekvens på tværs, tid nedad, over en scriptet jammer-tidslinje. SIGNALER: GPS L1 C/A og L2C (BPSK(1)), Galileo E1 åben service (MBOC(6,1,1/11) eller BOC(1,1)), GPS L5 og Galileo E5a (BPSK(10)), hver ved sin bærebølge med den mindste modtagne effekt fra interfacespecifikationen (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), medmindre den tilsidesættes; GLONASS, BeiDou og Galileo E6 er ikke modelleret. JAMMERE: kontinuert-bølge-tone, flad smalbåndsstøj, lineær savtands-chirp og bredbåndsstøj tilpasset et bånds egen modulation, hver med et centrum, en båndbredde, en modtaget effekt (direkte, eller EIRP og afstand gennem jamming-typens frirumsdæmpning) og til-/fra-tider. Hver jammer scores mod hvert bånd ved sin spektrale separationskoefficient kappa over modtagerbåndbredden, og (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; for én jammer er dette lig med jamming-typens anti-jam-ligning med Q = 1/(R_c kappa), og rapporten bærer det krydstjek (og jamming-typens repræsentative Q-tal ved siden af). Støjgulvet er k T_sys med T_sys = T_ant + 290 K (F - 1). Vandfaldet middelværdisætter hver celle over dens bin og dens række (chirps præcist, hele sweeps plus det delvise; jammere, der skifter midt i rækken, efter deres duty), så C/N0-tidslinjen og billedet kommer fra de samme tal; result.json bærer gitteret blokmiddelværdisat i effekt, C/N0 og J/S pr. bånd pr. række og pr. jammer pr. bånd SSC, Q, J/S, J/S i båndet og stationær C/N0. Valgfri [iq]: modellen tegnet som komplekst IQ på ét tidspunkt, skrevet til og læst tilbage fra en SigMF-optagelse (cf32_le eller ci16_le) og sammenlignet med et Welch-estimat. Valgfri [recording] (native builds): en rigtig SigMF-optagelses Welch-PSD ved siden af modellen. VALIDATED: signal-PSD'erne mod lærebogens hovedlobebredder (BPSK(n) 2n x { $lit_1_023 } MHz nul til nul; BOC(1,1)-lober centreret ved +/-{ $lit_1_023 } MHz) og de spektrale separationskoefficienter mod deres Parseval-lukkede former og Kaplan & Hegartys Q = 1 (CW) og { $lit_1_5 } (matchet). MODELLED: jammereffekter, tidslinje, frontend-båndbredder, behandlingen af kontinuert spektrum (ingen kodelinjer) og fraværet af AGC, blanking og antennemønster.

engine-kind-solar-system-description = Hele solsystemet ved én epoke, til PNT (positionering, navigation og timing) omkring ethvert legeme. For Solen, de otte planeter, Pluto, Månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan rapporterer den heliocentrisk position og hastighed i ICRF (International Celestial Reference Frame, ækvatorial J2000), den heliocentriske afstand og J2000-ekliptikal længde og bredde, gravitationsparameteren, ækvatorial og middelradius, J2, hvor den er offentliggjort, og dens referenceradius, den sideriske rotationsperiode, IAU-polen og nulmeridianen ved epoken, et banespor samplet over én omløbstid (heliocentrisk for planeter, forældercentreret for måner) og lystiden, envejs- og tovejsafstanden, den solare Shapiro-forsinkelse og Solseparationen fra et observatørlegeme (standard Jorden); ekstra from/to-links får den samme behandling. Positioner: JPL's Kepler-elementer fra Standish og Williams (Table 1 for 1800 AD til 2050 AD, Tables 2a/2b for 3000 BC til 3000 AD) med hver plantes nominelle fejl, Montenbruck & Gills lunare serie til jord-måne-opdelingen, JPL's middelelementer med IAU's synkrone rotationsrate for Mars' og Jupiters galilæiske måner og IAU's rotationsmodel for Titan. Lystid: den radiometriske fikspunktsløsning, sender ved sin retarderede position; newtonsk, med Shapiro-forsinkelsen rapporteret separat. VALIDATED mod JPL Horizons (DE441) inden for det dobbelte af den nominelle fejl: Merkur til Saturn og Jorden fra Table 1 (værst { $lit_1_87 } gange nominel) og alle otte planeter fra Tables 2a/2b (værst { $lit_1_71 } gange) og lystiden fra Jorden til Mars og Jupiter. MODELLED, hver række mærket: Uranus og Neptun fra Table 1 ({ $lit_2_0 } og { $lit_5_2 } gange den nominelle fejl mod DE441), Pluto (rækken fra 1992; ingen angivet fejl), Månen og de syv måner (målt mod Horizons, ingen offentliggjort grænse).

engine-kind-body-pnt-description = Positionering omkring ethvert solsystemlegeme: en orbiter eller en overflade-lander omkring et centrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten af solsystemkataloget), der navigerer med envejs-pseudoafstande fra en lille Walker-navigationskonstellation omkring legemet (totlegemebaner med legemets eget J2-sekulære drift, et ukendt brugerur) og eventuelt en urfri dybrums-tovejsafstand fra Jorden, hvis retning og afstand kommer fra den analytiske solsystemefemeride ved hver epoke. Synslinjer blokeres af legemets middelsfære, og en overfladebruger har også brug for elevationsmasken. Pr. epoke: relæer i sigte, om Jorden er over limben, den GDOP og PDOP (geometrisk og positionel præcisionsfortynding), der kun hører til konstellationen, den formelle énsigma-positionsusikkerhed med og uden Jord-rækken og fejlen på en seedet Gauss-Newton-mindste-kvadraters positionsbestemmelse begge veje; over runnet: tilgængelighed, Jord-synlighed, median-PDOP, RMS-fejl og median formel sigma, plus lystiden fra Jorden til legemet, rundtur, Shapiro-forsinkelse og Solseparation ved epoken. MODELLED: relæbanerne, støjniveauerne og den øjeblikkelige målemodel er modelleringsvalg, ikke afprøvet mod en missions navigationsdata; legemskonstanterne er de offentliggjorte værdier, der er citeret i body.rs, og Jord-geometrien arver mærkerne fra solsystemefemeriden.

engine-kind-constellation-design-description = Konstellationsudformning i stor skala: Walker DELTA- og Walker STAR-mønstre i i: T/P/F-konventionen (knuder spredt over 360 eller 180 deg, afstand i planet 360*P/T, faseforskydning mellem planer 360*F/T), eksplicitte elementlister og multishell-udformninger, flere konstellationer i ét run, omkring Jorden, Månen, Mars eller enhver anden planet, Pluto eller større måne med konstanterne i body-modulet (de samme, som solar-system- og body-pnt-typerne bruger). FORUDINDSTILLINGER fra offentliggjorte nominelle elementer: gps-baseline og gps-expandable (de 24 slots og de seks fore/aft-udvidelige par fra GPS Standard Positioning Service Performance Standard, 5th edition 2020, Tables 3.2-1 til 3.2-3), galileo (Walker 24/3/1 ved 29 599.801 km og 56 deg, Galileo Open Service Service Definition Document issue 1.1 Tables 1 og 23), beidou og beidou-meo (Walker 24/3/1 ved 21 528 km og 55 deg plus tre geostationære satellitter ved 80, { $lit_110_5 } og 140 deg E og tre inklinerede geosynkrone satellitter ved 55 deg, BeiDou Open Service Performance Standard 3.0 section 4.1; MEO-fasen og den inklinerede geosynkrone krydsning ved 118 deg E er modelleret, fordi standarden ikke angiver dem) og glonass (24/3/1 ved 19 100 km og { $lit_64_8 } deg fra slotformlen i GLONASS Interface Control Document edition 5.1 section 5.2). DÆKNING OG PRÆCISIONSFORTYNDING: over et bredde-/længdegitter og et samplet vindue med en elevationsmaske, antallet af satellitter i sigte, GDOP, PDOP, HDOP og VDOP pr. celle, tilgængeligheden (en positionsbestemmelse med PDOP på eller under en tærskel, 6 som standard) pr. celle, globalt (arealvægtet) og på det værste sted, med ét modtagerur pr. konstellation, medmindre clock = "common". Det skalerer til tusindvis af satellitter: synlighed er et prikprodukt mod hver satellits dækningshalvvinkel, og satellitter opdeles i bånd efter subsatellitbredde ved hver epoke, så en gitterrække kun tester dem, der kan være i sigte; rapporten tæller de sparede part-tests. JSON'en bærer gitterkortene og nedsamplede jordspor pr. satellit. VALIDATED: Walker-generatoren mod Galileo OS SDD Table 23 og GLONASS ICD's slotformel, GPS-forudindstillingen mod den offentliggjorte ækvatorkrydsningskolonne i SPS PS Table 3.2-1 og den globale HDOP-fordeling for GPS-baseline mod SPS PS Appendix B (median { $lit_0_94 }, 95 % { $lit_1_25 }, middel { $lit_0_96 }, tolerance { $lit_0_03 }). MODELLED: totlegemebaner med valgfri sekulær J2, et sfærisk legeme, kun geometrisk synlighed (ingen signaleffekt, sundhed eller terræn) og den relative fase mellem forskellige systemer, som ikke er et snapshot af nogen virkelig dato.

engine-kind-campaign-description = Kampagne: eksisterende scenarietyper sammensat til ét run, hvor hvert tal er læst fra et virkeligt run af den navngivne type. Fire sektioner, i enhver kombination. PHASES: en kædet mission på én fælles tidslinje -- hver fase kører ét eller flere scenarier (for eksempel jamming, så spoofing, så et ur i holdover med et inertialnavigationssystem, der løber ved siden af, så en integritetsalarm, så genopretning), deres output læses ind i navngivne kanaler (urtidsfejl mod dens guard, bærebølge-til-støj-tæthedsforhold mod tracking-gulvet, beskyttelsesniveau mod alarmgrænsen, positionsfejl, satellitter i tracking, alarmflag) ved en forudindstilling pr. type eller ved eksplicitte resultatstier og resamples på et fælles gitter ved nulte-ordens-hold, med fasegrænser og hændelser; tilstand gives videre ved carry (en kanal fortsætter fra den foregående fases slutværdi), handoff (en tidligere fases tal skrevet ind i denne fases scenarie) og end_at (en fase slutter på et tidspunkt, et run beregnede, såsom en spoofing-monitors detektionstid). SWEEP: et gitter over én til tre punkterede scenarienøgler af enhver type (et heltalssegment indekserer et array af tabeller, som i system.2.sisre_m), med metrikker læst ved resultatsti og, med flere end ét run, et seedet Monte Carlo-ensemble ved hver knude. MONTE_CARLO: realisering k kører ved base_seed + k; hver metrik rapporterer middel, standardafvigelse, nærmeste-rang 5.-/50.-/95.-percentiler og et bootstrap-95 %-konfidensinterval med fast seed på middelværdien. COMPOSE: flere scenarier under fælles værdier (én jammers effekt og position skrevet ind i en maritim og en vejmodtager), med en kombineret bedste/værste oversigt. Resultatet bærer en kampagne-hash, en digest over hvert medlemsresultat og en units-post for hvert udsendt tal; interoperabilitetseksporterne skriver hvert medlemsscenarie, der har geometri, som sit eget filsæt. Sammensætningsidentiteter testes: en etfaset kampagne gengiver det selvstændige run bit for bit, et ensemble med fast seed er bytestabilt, og på et ur med hvid frekvensstøj falder ensemblemiddelværdien inden for det rapporterede interval med en spredning, der svarer til sqrt(q_wf * tau). MODELLED: den additive carry og nulte-ordens-holdet er modelleringsvalg, og hver fase bærer mærket for den type, der kørte den.

engine-kind-leo-signal-description = LEO-PNT-signaludformninger: parametriserede PNT-signaler (positionering, navigation og timing) fra lav jordbane (LEO) for ethvert system, bånd og enhver struktur. Et SIGNAL er et bånd (centerfrekvens, senderbåndbredde, ITU-allokering RNSS/RDSS/MSS/EESS/non-RNSS/other) og komponenter (acquisition, data, pilot; enhver delmængde), hver med en modulation (BPSK(n) med brøk-n, BOC(m,n), MBOC(6,1,p) eller et fladt OFDM-lignende bånd), en effektandel, valgfri FDMA-underbærebølgeforskydninger, en kodelængde og en datarate. Signaler kommer fra indbyggede offentlige forudindstillingsfiler (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; hver med sin kilde-URL og hver ikke-offentliggjort værdi mærket REPRESENTATIVE) eller skrives inline. PR. SIGNAL: den båndbegrænsede effektspektraltæthed og den brøkdel af hver komponents effekt, som senderbåndet lader passere (BPSK lukket form ved siden af den numeriske værdi), RMS-båndbredden (Gabor), den termiske støjjitter for delay-lock-loop-kodetracking mod C/N0 og early-late-afstand fra Betz & Kolodziejskis 2009 båndbegrænsede kohærente (eller ikke-kohærente) early-late-formel med dens ubegrænsede-bånd-lærebogsform og dens forsvindende-afstands-Gabor-grænse, afstandsmålingsnøjagtigheden i meter, acquisition-søgerummet (Doppler-bins fra banens maksimale Doppler plus oscillator- og brugerled, gange kode-bins), kvadratlovsdetektionssandsynligheden og den gennemsnitlige serielle og kodeparallelle acquisition-tid, signalets spektrale separationskoefficient ind i GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og E5 AltBOC og for hver af dem ind i signalet med C/N0-forringelsen, og den CW-, bredbånds- og matchede J/S, den sporede komponent tåler, fra spektrum-typens eget SSC-maskineri. En BÅNDAFVEJNING: førsteordens ionosfærisk forsinkelse ({ $lit_40_3 } TEC/f^2), frirumstab, afstandsmålingsnøjagtighed ved lige C/N0 og ved lige EIRP og jammertolerance. Valgfri FORMKONTROLLER holder en udformnings spektrum op mod en beskrevet måling (MODELLED konsistens). VALIDATED: BPSK-effekt-i-bånd ({ $lit_90_3 } % i hovedloben) og Gabor-båndbredde i lukket form, den båndbegrænsede jitter, der reduceres til lærebogens kohærente early-late-form og til sin Gabor-grænse, den forskudte BPSK spektrale separationskoefficient mod sin Parseval-lukkede form, AltBOC-spektrets enhedsareal og den maksimale LEO-Doppler mod de offentliggjorte tal for Xona Pulsar (32-34 kHz) og Iridium (36 kHz). MODELLED: hver udformning, effektfordeling, C/N0 og jammerniveau; EFQPSK-, CSK- og OFDM-spektre er tilnærmet.

engine-kind-leo-pass-description = LEO-overflyvning og linkbudget, bånd for bånd, til LEO-PNT (positionering, navigation og timing fra lav jordbane), systemagnostisk: en bruger (jord, maritim, luft eller indendørs, statisk eller i bevægelse) og én eller flere LEO-satellitter fra en DESIGNET OVERFLYVNING (en cirkulær bane placeret, så brugeren ser én overflyvning med en valgt maksimal elevation på et valgt tidspunkt, solsynkron hvis ønsket), eksplicitte ELEMENTER, en TLE (to-linjers elementsæt) gennem motorens SGP4 eller en WALKER-konstellation bygget af konstellationsudformningskoden (de højeste overflyvninger rapporteres). Bånd kommer fra en navngiven forudindstilling (generisk multiband UHF/L/S/C, generisk C-bånd, Xona Pulsar X1/X5, Iridium STL, Starlink som et signal af opportunity kun med Doppler, CentiSpace og en valgfri Celeste IOD-forudindstilling mærket WORKSHOP) eller skrives ind i scenariet; hver forudindstilling angiver, om dens tal er PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP. Pr. satellit, bånd og epoke: elevation, azimut, afstand, afstandsrate og afstandsacceleration; frirumsdæmpning; EIRP og satellittens mønstergevinst (isoflux, gaussisk stråle eller flad); brugerantennens gevinst mod elevation (patch, hemisfærisk eller isotrop); gasdæmpning (ITU-R P.676-10 Annex 2), regndæmpning (ITU-R P.838-3-koefficienter og P.618-14-proceduren, fra en regnrate og regnhøjde), troposfærisk scintillation (ITU-R P.618-14 section 2.4.1), bygningsindtrængningstab for en indendørs bruger (ITU-R P.2109-2), polarisationsmismatch, systemstøjtemperatur og C/N0 (bærebølge-til-støj-tæthed); Doppler og Doppler-rate i lukket form fra afstandsraten og afstandsaccelerationen, hver kontrolleret mod centrale differenser; den førsteordens ionosfæriske forsinkelse { $lit_40_3 } STEC/f^2 fra en Klobuchar- eller vertikal-TEC-skrå TEC skaleret til den del af ionosfæren, der ligger under satellitten. Båndpar får de ionosfærefrie koefficienter, støjforstærkning og kodestøj ved overflyvningens top. MEO GNSS-satellitter (Galileo- eller GPS-forudindstillinger) evalueres med den samme antenne- og støjmodel ud fra deres modtagne effekter fra interfacedokumenterne, så den klokkeformede LEO-overflyvning og de flade GNSS-bærebølger deler ét plot. En valgfri [iot]-sektion giver tid til første positionsbestemmelse, energi pr. positionsbestemmelse og batterilevetid mod duty cycle for et angivet modtagereffektbudget (MODELLED). Hvert båndpar giver også den skrå TEC, dets geometrifrie kombination genfinder ved toppen, og dette estimats kodestøjs-sigma (ionosfærelodning). En valgfri [spoofer]-sektion forfalsker signalerne fra en påstået position, der hopper eller skubbes væk fra den sande efter et starttidspunkt, og kører to monitorer med angivne sandsynligheder for falsk alarm og manglende detektion: Doppler- og overflyvningsgeometri-konsistens (målte afstandsrater mod dem, der forudsiges fra banerne og en uafhængig prior position og hastighed, en generaliseret mindste-kvadraters chi-i-anden-test over et vindue, på GNSS-, LEO- og alle kanaler) og tværbåndskonsistens (epoke-til-epoke-trinnet i hvert LEO-båndpars modelkorrigerede geometrifrie kombination), der rapporterer statistikker pr. epoke og hvornår hver monitor detekterer (MODELLED). VALIDATED komponenter: frirumstab, P.838-3-koefficienterne mod dens Table 5, P.618-14-regn- og scintillationsprocedurerne og P.2109-bygningsindtrængningstabet mod ITU-R Study Group 3-valideringseksemplerne, IS-GPS-200 L1/L2-gruppeforsinkelsesforholdet og den maksimale Doppler for en statisk bruger af en cirkulær bane mod arXiv 2509.19551 Table 1. MODELLED: EIRP'er, mønstre, Chapman-andelen af TEC under satellitten og hele overflyvningen.

engine-kind-leo-navmsg-description = LEO-navigationsmeddelelse: den broadcastede efemeride og det broadcastede ur for en PNT-satellit (positionering, navigation og timing) i lav jordbane (LEO), for enhver bane, bærebølge og model, med valgfri navngivne forudindstillinger (Xona Pulsar, Iridium, Starlink, CentiSpace, et repræsentativt C-bånd-system, ATOMIC-nulur-modellen, Celeste IOD). INDHOLD: hjælpedata (SVID, issue of data, bånd, signalsundhed), synkronisering (uge, ugetid, et andenordens urpolynomium af0-af2 om toc), efemeride i én af fire modeller -- Galileo OS SIS ICD's 16-parameter Kepler-sæt; det sæt plus korrektionspolynomier langs banen, på tværs af banen og radialt; Liu et al. 2025's 22-parametermodel; et ECEF-polynomium uden urled (ATOMIC-nulur) -- og andre tjenester (et Klobuchar-broadcastsæt, NeQuick-G ai0-ai2 med det effektive ioniseringsniveau og parametre for systemtid til UTC med ICD's skudsekundlogik). TILPASNING: en referencebane integreret med zonal J2-J6- eller EGM2008-tyngdekraft til den valgte grad og luftmodstand og et seedet frit eller styret ur; Levenberg-Marquardt-tilpasning af Kepler-sættet på ikke-singulære elementer, derefter lineære mindste-kvadraters korrektionspolynomier; ur tilpasset fratrukket det relativistiske led, brugeren tilføjer. ANALYSER: fit-interval-trade (signal-i-rummet-afstandsfejl, SISRE, med globalt gennemsnitlige vægte for banehøjden, mod tilpasningsinterval og opdateringsperiode, kun bane og med ur), model-comparison (fire modeller, parameterantal, kodede bits og Kshanas tilpasning ved Liu et al.-højderne ved siden af de offentliggjorte tal), midpass-update (den højeste overflyvning over en bruger, hvert meddelelsesskifts positions-, ur- og brugerafstandssprang, værste-geometri-sprang, PASS/FAIL mod en kontinuitetstærskel), encode-decode (Kshanas eget dokumenterede binære frame med CRC-24Q, et kvantiseringsbudget med halvt trin pr. felt, en kontrol af korrupt frame, en eksport og import af RINEX-4-lignende post mærket en Kshana-udvidelse og en CSV-tabel). VALIDATED: SISRE-vægtene mod den offentliggjorte MEO/GEO-tabel (Montenbruck et al. 2018); Galileo-brugeralgoritmen mod RTKLIB på virkelige Galileo-broadcast-efemerider; CRC-24Q mod dens katalogkontrolværdi og RTCM 1005-eksempelframen. MODELLED: hvert tilpasnings- og SISRE-tal er repræsentationsfejl mod en af Kshana integreret reference (ingen banebestemmelses- eller forudsigelsesfejl); Liu et al.-sammenligningen bruger andre baner; kodnings- og tekstformaterne er Kshanas egne.

engine-kind-leo-pvt-description = Fusioneret PNT (positionering, navigation og timing) fra mellemhøj jordbane (MEO) og lav jordbane (LEO) over ENHVER konstellation: hvert [[system]] er en GNSS-forudindstilling af constellation-design-typen, en LEO-forudindstilling (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, atomic-zero-clock-efemeridemodellen eller en anden forudindstillingsfil, hver i sin egen fil med sine kilder mærket PUBLIC, WORKSHOP eller DERIVED), Walker-shells eller eksplicitte elementsæt, med en bærebølge, en chiprate, en kuvert for bærebølge-til-støj-tæthed (C/N0) fra elevationsmasken til zenit, en signal-i-rummet-afstandsfejl (SISRE), et Doppler-sigma og en urmodel (dets eget modtagerur, så inter-systembiasen estimeres, eller en kendt broadcast-forskydning). Fire tilstande. DOPPLER: batch-Gauss-Newton-positionering fra afstandsrate med analytiske partialer, urdrift og valgfri hastighedstilstande og en valgfri højdebegrænsning, enkelt- eller multisatellit, fejlen mod vinduelængde, Doppler-, Doppler-rate- og jerk-kuverten for hvert LEO-system og den enkelte overflyvnings nøjagtighed langs og på tværs af sporet mod forskydningen på tværs af sporet (fejlen på tværs af sporet vokser uden grænse, når overflyvningen går direkte overhead; en enkelt overflyvning har også en spejlløsning på tværs af jordsporet). Et signal af opportunity kun med Doppler (starlink-sop) kører her. JOINT: vægtede mindste-kvadraters pseudoafstandspositionsbestemmelser pr. epoke fra kun GNSS, kun LEO og begge, sigma pr. måling fra en termisk støjmodel for delay-lock-loop ved C/N0 plus SISRE (eller et fast sigma, så en signalmodel kan fodre dem), de estimerede inter-systembiaser og PDOP/HDOP/VDOP mod antallet af tilføjede LEO-satellitter. POLAR: satellitter i sigte og DOP mod bredde for GNSS, LEO og begge. TIMING: tidsoverførsel til Coordinated Universal Time (UTC) fra LEO-satellitter ved en kendt position med et to-tilstands urfilter, hvis processtøj kommer fra motorens oscillatorklasser, mod C/N0 og oscillatoren, og IS-GPS-200-udtrykket for systemtid til UTC; med [timing] trace = true rapporterer hver række også sin tidsfejl og forudsagte sigma ved hver epoke. VALIDATED: den største Doppler for en overflyvning fra overhead til horisont mod de offentliggjorte tal for Iridium (op til 36 kHz) og Xona Pulsar X1 (32 til 34 kHz). MODELLED: alt andet; DOP er kontrolleret mod et håndudledt tilfælde, positionsbestemmelserne mod deres kovarians og Doppler-modellen mod afstandsaccelerationsidentiteten.

engine-kind-leo-ppp-description = Konvergens for præcis punktpositionering (PPP) med kun GNSS og med LEO-støtte: et float-udvidet Kalman-filter på ionosfærefri kode og bærebølgefase med de statiske stationskoordinater, et hvidt modtagerur, ét inter-systembias pr. ekstra system, en random-walk zenit-vådforsinkelse afbildet med 1/sin(elevation) og en float-multiplicitet pr. satellitbue; den præcise bane-og-ur-fejl er hvid og fælles for en satellits kode og fase, så hver satellit er én korreleret to-rækkers opdatering i Joseph-stabiliseret form. Målinger simuleres fra den samme model med seedet støj over flere steder og seeds, og hvert tilfælde (først kun GNSS, derefter hvert [[case]] af LEO-systemer, enhver konstellation eller forudindstilling) rapporterer mediankonvergenstiden (den første epoke, hvorefter de horisontale og vertikale fejl bliver under tærsklerne, 10 cm som standard), den konvergerede andel, de mediane fejlkurver og filterkonsistensen (den run-gennemsnitlige positions-NEES mod det tosidede 95 % chi-i-anden-bånd). Valgfrit ved siden af de offentliggjorte tal fra Li et al. (2019, J. Geod. 93:749, doi 10.1007/s00190-018-1195-2) for mellembredde: { $lit_9_6 } min for multi-GNSS forkortet til { $lit_7_0 }, { $lit_3_2 }, { $lit_2_1 } og { $lit_1_3 } min med 60, 96, 192 og 288 LEO-satellitter. MODELLED: en konsistenssammenligning af tendensen, ikke en gengivelse af det studies konstellationer, støj eller stationer; ingen løsning af multiplicitet, cycle slips, phase wind-up, tidevand eller tidskorrelerede produktfejl.

engine-kind-ntn-positioning-description = Positionering fra en 5G ikke-terrestrisk netværks-(NTN-)downlink i S-båndet for mobil satellittjeneste (MSS) (3GPP-bånd n256, downlink 2170 til 2200 MHz; standardbærebølge { $lit_2172_5 } MHz): Cramér-Rao-grænsen (CRB) på ankomsttid, c / (2 pi beta sqrt(2 (C/N0) T)), hvor beta er rod-middelkvadrat-båndbredden (Gabor) for det flade OFDM-spektrum (B/sqrt(12)), og på Doppler for en kompleks tone, sqrt(3 / (2 pi^2 (C/N0) T^3)), for hvert signal (standard en 5 MHz New Radio-kanal med { $lit_4_5 } MHz optaget og en 200 kHz smalbåndskanal med 180 kHz optaget); derefter, over enhver LEO-konstellation, downlink-ankomsttidspositionsbestemmelser med et ukendt modtagerur (seedet, med grænsen plus en netværkssynkroniseringsfejl som sigma), deres PDOP og formelle 3D-sigma og en enkeltsatellit-Dopplerpositionsbestemmelse over den længste overflyvning med højden fastholdt. MODELLED: trinnet fra båndbredde til grænse er lærebogens lukkede form, kontrolleret mod numerisk integration af de flade og båndbegrænsede BPSK-spektre (intern konsistens, intet offentliggjort gennemregnet tal fastlåst), og positioneringsnøjagtigheden er en grænse på en multipath-fri kanal med en angiven synkroniseringsfejl, ikke et opnået resultat.

engine-kind-leo-pnt-chain-description = Ét LEO-PNT-system (positionering, navigation og timing fra lav jordbane) fra ende til anden, for enhver konstellation og ethvert signal: leo-signal-udformningen, der er navngivet af signal_design (en offentlig forudindstilling eller en inline [signal]-udformning), fastsætter et [pass]-bånds centrum, båndbredde, chiprate og EIRP-fordeling, leo-pass-linkbudgettet giver den sporede C/N0 og den båndbegrænsede kodejitter over overflyvningen, en C/N0-linje i sin(elevation) og [navmsg]-meddelelsens broadcast-SISRE (tilpasset ved overflyvningssatellittens højde) fodrer hvert LEO-system i [fusion] leo-pvt's fælles positionsbestemmelse og eventuelt [ppp]-leo-ppp-tilfældene; hver overdragelse er opført med sin værdi og enhed. MODELLED.

engine-kind-contact-schedule-description = Jordkontaktplanlægning for flere satellitter over flere stationer: tilsyneladende adgangsvinduer (SGP4, IAU 2006/2000A jordfast referencesystem, ITU-R P.834-refraktion, lystid), DVB-S2 ACM-datavolumen for hver overflyvning (ETSI EN 302 307-1 Table 13-tærskler) og en konfliktfri plan (én satellit pr. antenne med en vendetid, én station pr. satellit, prioritetsvægtet levering begrænset af hvert efterslæb) ved en marginalværdi-grådig algoritme, en først-til-mølle-baseline og en nøjagtig branch and bound på små sæt, med den grådiges optimalitetsgab. MODELLED.

engine-kind-acm-link-description = Én satellit over én station: hver overflyvnings skrå afstand, elevation og Es/N0 langs overflyvningen, den DVB-S2 MODCOD, der vælges ved hvert trin (ETSI EN 302 307-1 Table 13-tærskler plus en implementeringsmargin), og den datavolumen, ACM flytter, mod konstant-kodnings-baseline, der lukker ved masken. MODELLED.

engine-kind-aocs-description = Rumfartøjets attitudekontrol: en inertial peg-slew af en stiv hub med tre eller flere balancerede reaktionshjul under MRP-feedback (L = -K sigma - P omega), minimum-norm-hjulmomenter klippet til hver motors grænse, RK4 med nulte-ordens-hold; eventuelt lukket på et multiplikativt EKF fra en simuleret gyro (vinkel- og raterandom walk) og star tracker. Rapporterer indsvingningstid, endelig og maksimal pegefejl, maksimal hjulhastighed og -moment, den mættede andel, drift i impulsmoment og, med estimatoren, dens attitudefejl og NEES. Sandtilstands-sløjfen er VALIDATED mod Basilisk 2.9.1; estimatoren er MODELLED.

engine-kind-entry-heating-description = 3-DoF punktmasse-atmosfærisk indtrædelse over en roterende sfærisk Jord eller Mars (ballistisk eller løftende ved konstant krængning), RK4, gennem US76, en eksponentiel eller Mars-atmosfæren, med Sutton-Graves konvektiv opvarmning i stagnationspunktet (NASA TR R-376): spidsdeceleration, varmeflux og dynamisk tryk, varmebelastning, downrange, en energikontrol i roterende referencesystem og Allen-Eggers lukkede form ved siden af. Spidsdecelerationen er kontrolleret mod den offentliggjorte nominelle Stardust; opvarmningen er MODELLED.

engine-kind-eo-radiometry-description = Radiometri og billedkvalitet for nadirbilledsensor: radians ved aperturen for en lambertsk scene, kameraligningen, signal og skud-/mørke-/udlæsnings-/kvantiseringsstøj og SNR; systemets MTF ved Nyquist (diffraktion x detektor x udtværing x jitter), den relative kantrespons ud fra den, Q = lambda F/p og GIQE version 4 NIIRS uden MTF-kompensation. MODELLED.

engine-kind-ascent-losses-description = Plan tyngdedrejnings-opstigning for et flertrinsfartøj over en ikke-roterende sfærisk Jord gennem US Standard Atmosphere 1976 (lodret stigning, pitch-kick, fremdrift langs hastigheden), der integrerer tyngde-, modstands-, styrings- og modtrykstabene og kontrollerer ideelt dv minus tab mod burnout-hastigheden; max-Q, maksimal acceleration og burnout-tilstand. MODELLED.

engine-kind-time-transfer-budget-description = Tovejs satellittids- og frekvensoverførsel mellem to stationer gennem et geostationært relæ: tovejsligningen løst for T_A - T_B med hvert ikke-reciprokt led (stationsudstyrsforsinkelser, Ku-bånd-ionosfære, transponder, Sagnac), et kvadratisk usikkerhedsbudget, hvis type A-led er den simulerede links TDEV ved middelværditiden, et simuleret link med hvid og flicker-fasestøj og en døgnlig ikke-reciprocitet, og stabiliteten (rate, residual-RMS, TDEV, ADEV) for enhver leveret BIPM Circular T Section 1-serie, MJD,ns-CSV eller IGS RINEX-stationsurposter. MODELLED.

engine-kind-optical-atmosphere-description = MODELLED optisk PNT gennem atmosfæren: for et optisk link og et sæt jordsteder med angivne skyklimaer rapporterer den det bølgelængde- og elevationsafhængige klarluftstab (Kims synlighedslov plus Rayleigh), Hufnagel-Valley-turbulenstilstanden (Rytov-varians, scintillationsindeks, gamma-gamma-parametre, aperturmiddelværdisætning), den vejrdrevne tilgængelighed mod linkmarginen (skyers optiske dybde fra et log-normalt flydendevandsklima, geometrisk-optisk ekstinktion, uafhængigt turbulensfading), den linkmargin, der skal til for mål-tilgængeligheder, fordelingen af udfaldsvarigheder, væksten i timing- og afstandsfejl pr. udfald gennem ur-holdover-modellen, afstandskorreleret stedsdiversitetstilgængelighed og hvad-nu-hvis-gevinster for forbedringsteknikker (bølgelængde, modtageaperture, adaptiv-optik-scintillationsreduktion, ekstra margin). VALIDATED som implementering af de angivne formler mod et uafhængigt mpmath-orakel: Rytov-varians, scintillationsindeks, gamma-gamma-fadingsandsynlighed, aperturmiddelværdisætningsfaktor, sky- og klarluftsoptisk dybde. MODELLED: hvert vejr-, teknik- og urinput og uafhængigheds- og copula-antagelserne; ingen målt tilgængelighedsregistrering er sammenlignet. Vejledende analyse, ikke et certificeret tilgængeligheds- eller navigationsprodukt.

engine-kind-holdover-test-description = MODELLED holdover-test af et timingsystem, scoret ud fra en tidsfejlsoptegnelse, som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-log, en chrony tracking- eller statistics-log, en TICC-, TimeLab- eller RINEX-urlog eller time_s,time_error_ns-par). Testen har fire trin, og Kshana udfører ingen af dem: en låst BASELINE, GNSS FJERNET af operatøren (antennekablet eller simulatoroutputtet; Kshana sender og driver intet) på et angivet tidspunkt, HOLDOVER på systemets egen oscillator og GENOPRETNING, efter operatøren genopretter GNSS på et andet angivet tidspunkt. Optegnelsen deles ved disse to tidspunkter. Baseline: tidsfejlsstatistik og de ITU-T-masker, der er skrevet til et låst ur. Holdover: statistik, den fraktionelle frekvensforskydning, systemet holdt (en mindste-kvadraters linje), de masker, der er skrevet til holdover eller et autonomt ur, ePRTC-A-holdoverkuverten fra den angivne låste varighed og tiden til at overskride hvert tidsfejlsbudget. Genopretning: om og hvornår |TE| kom inden for et angivet bånd og blev der, toppen og det største trin. Hver grænse er afskrevet fra en offentlig ITU-T-tabel (telecom-timing-masker); ordene er 'målt mod masken', og de to tidspunkter er operatørens udsagn, ikke verificeret. En optegnelse, der er for kort til en maske, er INCOMPLETE, aldrig ekstrapoleret. Se docs/TIMING-HIL.md.

engine-kind-gnss-ssv-description = MODELLED GNSS-tilgængelighed og linkstyrke i Space Service Volume og videre: for en bruger på en sfære (ICG-bookletens globale skal) eller på en Kepler-bane (LEO til lunar transfer) tæller den pr. konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og for alle samlet de signaler, der kan bruges over en C/N0-tærskel - tilgængelighed af mindst ét og af fire signaler, maksimal udfaldsvarighed, modtaget C/N0, præcisionsfortynding, hovedlobe- mod sidelobe-links - med et booklet-, parametrisk eller brugerleveret sendemønster, valgfri limb-stråle-ionosfære-, plasmasfære- og atmosfæreeffekter og et valgfrit modtagerdesign til svage signaler; også et onboard GNSS-udvidet Kalman-filter til HEO- og lunar-transfer-fartøjer (banedynamik, solstrålingstryk, tredjelegemer, ur) og relativ navigation af en formation med flere fartøjer ved enkeltdifferentierede pseudoafstande. Kontrolleret mod ICG SSV-bookletens tabeller under en præregistrering (xval/gnss-ssv)
