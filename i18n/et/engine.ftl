# SPDX-License-Identifier: AGPL-3.0-only
# et catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = tundmatu kellalogi formaat { $other }; oodatud on üks järgmistest: { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = tundmatu lünga käsitlemise reegel { $other }; oodatud on refuse, longest või linear

engine-e-clock-log-give-either-the-log-text = esita kas logi tekst või selle tee, mitte mõlemat

engine-e-clock-log-clock-log-needs-its-text = kellalogi jaoks on vaja selle teksti või teed

engine-e-clock-log-tau0-must-be-finite-and = tau0_s peab olema lõplik ja > 0 (saadi { $t })

engine-e-clock-log-units-and-data-apply-to = units ja data kehtivad ainult timelab-formaadile

engine-e-clock-log-channel-applies-to-the-ticc = channel kehtib ainult ticc-formaadile

engine-e-clock-log-cannot-read-clock-log = kellalogi { $path } lugemine ebaõnnestus: { $e }

engine-e-clock-log-clock-log-path-is-not = kellalogi teed WebAssembly-järgus ei toetata; esita logi tekstina

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one] { $format } logis puudub { $n_missing } epohh (lünkasid: { $n_gaps }) { $tau0 } s ruudustikul; kasuta gaps = "longest", et säilitada pikim lünkadeta lõik, või gaps = "linear", et interpoleerida
       *[other] { $format } logis puudub { $n_missing } epohhi (lünkasid: { $n_gaps }) { $tau0 } s ruudustikul; kasuta gaps = "longest", et säilitada pikim lünkadeta lõik, või gaps = "linear", et interpoleerida
    }

engine-e-clock-log-the-log-yields-usable-sample = { $format } logist saadakse kasutatavaid valimeid: { $x }; vaja on vähemalt 3

engine-e-clock-log-not-rinex-clock-file-no = pole RINEX-i kellafail: puudub END OF HEADER kirje

engine-e-clock-log-the-rinex-clock-file-has = RINEX-i kellafailis puuduvad AS- ja AR-kirjed

engine-e-clock-log-the-rinex-clock-file-holds = RINEX-i kellafail sisaldab kelli: { $many }; nimeta üks valikuga clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = kellal { $id } puuduvad AS- ja AR-kirjed

engine-e-clock-log-the-clock-has-single-epoch = kellal on üksainus epohh; vaja on vähemalt kaks (tau0 väärtust ei saa leida)

engine-e-clock-log-the-log-has-no-readings = { $format } logis pole näite

engine-e-clock-log-unknown-phase-unit-expected-ms = tundmatu faasiühik { $other }; oodatud on s, ms, us, ns või ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab-i real { $v1 } on veerge: { $v }, esimesel andmereal: { $first }

engine-e-clock-log-timelab-line-has-columns-one = TimeLab-i real { $v1 } on veerge: { $v }; loetakse üks (väärtus) või kaks (aeg väärtus)

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab-i rida { $v1 } ei ole arvuline: { $l }

engine-e-clock-log-the-timelab-log-has-no = timelab-logis pole näite

engine-e-clock-log-unknown-data-expected-phase-or = tundmatu data { $other }; oodatud on phase või frequency

engine-e-clock-log-tau0-header-is-not-positive = tau0 päis { $v } ei ole positiivne sekundite arv

engine-e-clock-log-frequency-data-is-fractional-frequency = sagedusandmed on suhteline sagedus; units võib olla ainult 1

engine-e-clock-log-two-column-frequency-logs-are = kahe veeruga sagedusloge ei loeta; anna sagedus ühe veeruna koos tau0-ga

engine-e-clock-log-unknown-time-units-expected-or = tundmatu time_units { $o }; oodatud on s või mjd

engine-e-clock-log-the-timelab-log-time-column = timelab-logi ajaveerg peab kasvama

engine-e-clock-log-single-reading-tau0-cannot-be = üksainus näit; tau0 väärtust ei saa leida

engine-e-clock-log-the-timelab-log-has-non = timelab-logis on mittelõplikke näite: { $non_finite }

engine-e-clock-log-the-ticc-log-holds-channels = TICC logi sisaldab kanaleid { $many }; nimeta üks valikuga channel = "..."

engine-e-clock-log-no-readings-on-channel-found = kanalil { $channel } pole näite (leitud: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC intervallirežiimi read ei sisalda aega; anna tau0_s (sündmuse periood)

engine-e-clock-log-the-readings-do-not-increase = { $channel } näidud ei kasva, seega need pole ajatemplid (TICC Period-režiimi väljundit ei loeta; kasuta Timestamp-režiimi)

engine-e-clock-log-single-time-stamp-tau0-cannot = üksainus ajatempel; tau0 väärtust ei saa leida

engine-e-clock-log-two-time-stamps-apart-under = kaks { $channel } ajatemplit { $w } s kaugusel, alla poole tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = { $format } logi { $clock } ajatemplid lähevad tagasi (taaskäivitatud deemon või kellahüpe); jaga logi ja loe iga osa eraldi

engine-e-clock-log-the-log-has-no-readings-2 = logis pole { $what } näite

engine-e-clock-log-the-log-holds-sources-name = logi sisaldab allikaid: { $many }; nimeta üks valikuga { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = { $id } jaoks pole { $what } näite (leitud: { $names })

engine-e-clock-log-the-servo-of-never-reached = { $id } servo ei jõudnud kunagi lukustatud olekusse s2

engine-e-clock-log-the-log-has-no-chrony = logis pole chrony jälgimisnäite

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = valimisagedus { $fs_hz } Hz ei anna täisarvu valimeid millisekundi kohta

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms ja noncoherent peavad olema positiivsed

engine-e-acquisition-the-doppler-grid-needs-positive = Doppleri ruudustik vajab positiivset sammu ja mittenegatiivset maksimumi

engine-e-acquisition-pfa-must-lie-in = pfa peab olema vahemikus (0, 1)

engine-e-acquisition-samples-supplied-needed = antud valimeid: { $samples }, vaja: { $needed }

engine-e-acquisition-empty-doppler-grid = tühi Doppleri ruudustik

engine-e-acquisition-the-samples-carry-no-power = valimid ei sisalda võimsust

## src/adm.rs

engine-e-adm-unknown-attitude-type = tundmatu ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = AEM vajab vähemalt ühte segmenti

engine-e-adm-segment-is-not-version-attitude = segment { $i }: { $t } ei ole versiooni { $version } orientatsioonitüüp

engine-e-adm-segment-values-for = segment { $i }: väärtusi { $values } tüübi { $t } jaoks

engine-e-adm-aem-version-has-no-ndm = AEM versioonil 1.0 puudub siin NDM/XML-vorm; kirjuta KVN-ina

engine-e-adm-this-attitude-type-has-no = sellel orientatsioonitüübil puudub versiooni 2.0 vorm

engine-e-adm-expected-meta-start-found = oodatud META_START, leitud { $l }

engine-e-adm-meta-start-without-meta-stop = META_START ilma META_STOP-ita

engine-e-adm-unexpected-metadata-line = ootamatu metaandmete rida { $other }

engine-e-adm-in-version-aem = { $att } versiooni { $version } AEM-is

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = oodatud DATA_START pärast META_STOP-i

engine-e-adm-data-start-without-data-stop = DATA_START ilma DATA_STOP-ita

engine-e-adm-empty-data-line = tühi andmerida

engine-e-adm-values-on-line = väärtusi { $vals } { $att } real: { $b }

engine-e-adm-unexpected-data-line = ootamatu andmerida { $other }

engine-e-adm-attitude-type-has-no-xml = orientatsioonitüübil puudub XML-vorm

engine-e-adm-message-without-version-attribute = sõnum ilma versiooniatribuudita

engine-e-adm-expected-found = oodatud { $vers_key }, leitud { $other }

engine-e-adm-header-without-creation-date-or = päisel puudub CREATION_DATE või ORIGINATOR

engine-e-adm-missing = puudub { $k }

engine-e-adm-unexpected-keyword = ootamatu võtmesõna { $k }

engine-e-adm-spin-block-holds-nutation-or = spin-plokk sisaldab nutatsiooni- või impulsimomendi andmeid, mitte mõlemaid

engine-e-adm-unexpected-apm-keyword = ootamatu APM-i võtmesõna { $other }

engine-e-adm-unexpected-apm-line = ootamatu APM-i rida { $b }

engine-e-adm-without = { $b }: puudub { $stop }

engine-e-adm-unexpected-line-in = ootamatu rida plokis { $b }: { $other }

engine-e-adm-incomplete-group = mittetäielik rühm { $keys }

engine-e-adm-unknown-apm-block-start = tundmatu APM-i plokk { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM-i metaandmed vajavad väärtusi OBJECT_NAME, OBJECT_ID ja TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM ilma EPOCH-ita

engine-e-adm-rotation-axis = pöörlemistelg { $o }

engine-e-adm-values-for = väärtusi { $values } tüübi { $t } jaoks

engine-e-adm-euler-record-without-euler-rot = Euleri kirje ilma EULER_ROT_SEQ-ita

engine-e-adm-rotation-sequence = pöörete jada { $seq }

engine-e-adm-epoch-has-no = epohhil { $s } puudub 'T'

engine-e-adm-epoch-date = epohhi kuupäev { $date }

engine-e-adm-epoch-time = epohhi kellaaeg { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = „{ $s }“ (tekst nii, nagu dokument selle esitab)

engine-advanced-report-mean-5th-to-95th-percentile = keskmine { $fmt_num } (5. kuni 95. protsentiil { $fmt_num2 } kuni { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = väljaühikute skeem: units-kirje `{ $key }`

engine-advanced-report-field-units-schema-input-entry = väljaühikute skeem: input-kirje `{ $key }`, sobitatud välja nime järgi

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } mittearvulise veeru rida
       *[other] { $n } mittearvulise veeru rida
    }

engine-advanced-report-rows-from-to = ridu: { $nums }, vahemikus { $fmt_num } kuni { $fmt_num2 }

engine-advanced-report-phase-ended-by = faas { $name } (lõpetas { $ended })

engine-advanced-report-result-timeline-phases = tulemus `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = üleandmine faasi { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = tulemus `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = stsenaariumi sisend `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = stsenaariumifaili kommentaar, rida { $start }

engine-advanced-report-scenario-file-comment-lines-to = stsenaariumifaili kommentaar, read { $start } kuni { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } on MODELLED, mitte kinnitatud: { $it }.

engine-advanced-report-sweep-of-scale = Parameetri { $param } pühkimine (skaala: { $str_of })

engine-e-advanced-report-the-result-document-is-not = tulemusdokument ei ole JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = stsenaarium ei ole TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Monte Carlo jaotus: { $metric }

engine-advanced-report-recorded-at-build-time-from = salvestatud ehitamise ajal keskkonnamuutujast { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = salvestamata: see mootor ehitati ilma keskkonnamuutujata { $GIT_COMMIT_ENV }; mootori versioon identifitseerib väljalaske

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (stsenaariumi liigi enda sõrmejälg; mitte faili räsi)

engine-advanced-report-input-file = Sisendfail { $path }

engine-advanced-report-study-generated = { " " }Koostatud uuring { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2 rida { $v1 }: oodatud 8 komaga eraldatud veergu, leitud { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2 rida { $v1 }: vigane { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2 rida { $v1 }: mittelõplik väärtus

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: andmeridu pole

engine-e-altpnt-maps-emag2-rows-do-not-fill =
    { $n_lat ->
        [one] EMAG2: { $rows } rida ei täida neid hõlmavat { $n_lat } x { $n_lon } võret
       *[other] EMAG2: { $rows } rida ei täida neid hõlmavat { $n_lat } x { $n_lon } võret
    }

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: dubleeriv sõlm kohal { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = ruudustiku samm peab olema lõplik ja positiivne, saadi { $step }

engine-e-altpnt-maps-grid-box-must-have-north = ruudustiku kastil peab olema põhjapiir > lõunapiir ja idapiir > läänepiir, saadi [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too =
    { $n_lat ->
        [one] { $n_lat } x { $n_lon } sõlmega ruudustik on liiga suur
       *[other] { $n_lat } x { $n_lon } sõlmega ruudustik on liiga suur
    }

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: { $what } telg vajab vähemalt 2 erinevat väärtust

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: { $what } telg ei ole regulaarne (sammud { $w } kuni { $w2 } keskmise sammu { $step } suhtes)

engine-e-altpnt-maps-error-sigma-must-be-finite = veasigma peab olema lõplik ja mittenegatiivne, saadi { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = korrelatsioonipikkus peab olema lõplik ja positiivne, saadi { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be =
    { $n ->
        [one] samples_per_side peab olema >= 2, saadi { $n }
       *[other] samples_per_side peab olema >= 2, saadi { $n }
    }

engine-e-altpnt-terrain-srtm-hgt-length =
    { $n ->
        [one] SRTM .hgt pikkus { $bytes } != 2*{ $n }*{ $n } = { $v2 }
       *[other] SRTM .hgt pikkus { $bytes } != 2*{ $n }*{ $n } = { $v2 }
    }

engine-e-altpnt-terrain-an-hgt-window-needs-at =
    { $n_rows ->
        [one] .hgt aken vajab vähemalt 2 x 2 valimit, saadi { $n_rows } x { $n_cols }
       *[other] .hgt aken vajab vähemalt 2 x 2 valimit, saadi { $n_rows } x { $n_cols }
    }

engine-e-altpnt-terrain-step-must-be-finite-and = samm peab olema lõplik ja positiivne, saadi { $step_deg }

engine-e-altpnt-terrain-hgt-window-length =
    { $n_rows ->
        [one] { "." }hgt akna pikkus { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }
       *[other] { "." }hgt akna pikkus { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }
    }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: tundmatu magnetic_grid veerg `{ $other }` (kasuta "sealevel" või "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: magnetic_grid csv_path { $csv_path } lugemine ebaõnnestus: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = tundmatu animatsiooni formaat '{ $other }'; oodatud on svg, html, frames või all

engine-e-animation-no-animation-format-given-expected = animatsiooni formaat puudub; oodatud on svg, html, frames või all

engine-e-animation-animation-fps-must-be-between = animatsiooni fps peab olema vahemikus 1 kuni 60, saadi { $fps }

engine-e-animation-animation-duration-must-be-between = animatsiooni kestus peab olema vahemikus { $lit_0_5 } s kuni 600 s, saadi { $duration_s }

engine-e-animation-animation-width-must-be-between = animatsiooni laius peab olema vahemikus 480 kuni 3840 pikslit, saadi { $width }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] kestus x fps annab { $n } kaadri; kaadrijada vajab vahemikus 2 kuni { $v1 } kaadrit
       *[other] kestus x fps annab { $n } kaadrit; kaadrijada vajab vahemikus 2 kuni { $v1 } kaadrit
    }

engine-e-animation-result-is-not-json = tulemus ei ole JSON: { $e }

engine-animation-mission-time = missiooniaeg ({ $lay })

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (vajab librsvg-iga ehitatud ffmpeg-i; vastasel juhul rasteriseeri kaadrid enne)

engine-animation-further-series-were-found-but = { " " }Leiti veel jadasid, mida ei joonistatud: { $omitted } (esitaja näitab kuni { $MAX_CHARTS } paneeli, igaühel kuni { $MAX_TRACES } jälge); need on loetletud frames-ekspordi manifestis.

## src/antenna.rs

engine-antenna-limb-capture-is-reached-on = serva haaramine ON selles ruudustikus saavutatud (kõrgus { $a_lo }-{ $a_hi } m × kiirelaius { $b_lo }-{ $b_hi } deg, punkte { $points2 }): serva haaravaid valitud tööpunkte on { $points } / { $points2 } ja leitud telgede lõikepunkte: { $crossings }; tugevaim valitud serva J/S on { $limb_js_db } dB kõrgusel { $altitude_m } m / kiirelaiusel { $hpbw_deg } deg, haaramislävega { $thr } dB võrreldes.

engine-antenna-limb-capture-is-not-reached = serva haaramist EI saavutata kusagil selles ruudustikus (kõrgus { $a_lo }-{ $a_hi } m × kiirelaius { $b_lo }-{ $b_hi } deg, punkte { $points }) - mitte nullhaaramine, vaid serva haaramise puudumine: parim serva J/S on { $limb_js_db } dB kõrgusel { $altitude_m } m / kiirelaiusel { $hpbw_deg } deg, { $shortfall } dB alla { $thr } dB haaramisläve; see tööpunkt haaraks serva saatevõimsusel { $limb_capture_tx_power_dbw } dBW, kui lennatud võimsus oli { $p_tx_dbw } dBW.

engine-e-antenna-azimuths-must-strictly-increase = asimuudid peavad rangelt kasvama

engine-e-antenna-azimuths-must-span-less-than = asimuudid peavad katma alla 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = kiirgusteljest kõrvalekalde nurgad peavad rangelt kasvama

engine-e-antenna-gain-grid-does-not-match = võimenduse ruudustik ei vasta telgedele

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = võimendused K ja P peavad olema lõplikud ja positiivsed

engine-e-aocs-at-least-three-reaction-wheels = vaja on vähemalt kolme reaktsioonratast

engine-e-aocs-wheel-spin-axis-must-be = ratas { $i }: pöörlemistelg peab olema ühikvektor

engine-e-aocs-wheel-js-and-max-must = ratas { $i }: js ja u_max peavad olema lõplikud ja positiivsed

engine-e-aocs-the-wheel-spin-axes-do = rataste pöörlemisteljed ei hõlma kolme dimensiooni

engine-e-aocs-inertia-minus-the-wheels-spin = inertsimoment miinus rataste pöörlemisinerts peab olema positiivselt määratud

engine-e-aocs-inertia-must-be-finite-and = inertsimoment peab olema lõplik ja sümmeetriline

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis peab olema nullist erinev lõplik vektor

engine-e-aocs-kind-must-be-finite-and-positive =
    { $n ->
        [one] { $n } peab olema lõplik ja positiivne
       *[other] { $n } peab olema lõplik ja positiivne
    }

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s võib olla kuni 2e6 sammu

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s peab olema dt_s täisarvkordne

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 ja omega0_rad_s peavad olema lõplikud

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm peab olema lõplik

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s peab olema lõplik

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s peab olema vähemalt dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg =
    { $n_w ->
        [one] aocs: { $n_w } ratas, { $duration_s } s manööver väärtusest { $series_err } deg -> { $settle } | lõpp { $final_err } deg | ratta tippkiirus { $peak_speed } rpm | { $v7 }
       *[other] aocs: { $n_w } ratast, { $duration_s } s manööver väärtusest { $series_err } deg -> { $settle } | lõpp { $final_err } deg | ratta tippkiirus { $peak_speed } rpm | { $v7 }
    }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = tundmatu teenus '{ $other }' (oodatud navigation|nav või communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = tundmatu arbitreerimisreegel '{ $other }' (oodatud navigation-priority, communications-priority või first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = kontaktiplaan vajab vähemalt ühte kontaktiakent

engine-e-aperture-duty-apertures-must-be = apertuure peab olema >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = aruandlushorisont peab olema lõplik

engine-e-aperture-duty-contact-has-non-finite-aos = kontaktil '{ $name }' on mittelõplik aos_s või los_s

engine-e-aperture-duty-contact-must-have-los-aos = kontaktil '{ $name }' peab olema los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = kontaktiplaan vajab vähemalt ühte [[contacts]] akent

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: seansse { $sessions }, apertuure { $apertures }, reegel { $policy } -> navigatsioonikoormus { $navigation_duty }, sidekoormus { $communications_duty }, jõudeolek { $idle_duty }; vaidluse tõttu kaotsi läinud aeg { $total_outage_s } s (nõutud { $total_requested_s } s) (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Koostatud uuring { $html_escape }.

engine-e-api-failed-to-serialise-report-to = aruande serialiseerimine JSON-iks ebaõnnestus: { $e }

engine-e-api-invalid-scenario = vigane stsenaarium: { $e }

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] tundmatu stsenaariumi liik { $other } — kas mõtlesid { $hint }? `kshana kinds` loetleb kõik sisseehitatud liigid (kokku { $n }).
       *[other] tundmatu stsenaariumi liik { $other } — kas mõtlesid { $hint }? `kshana kinds` loetleb kõik sisseehitatud liigid (kokku { $n }).
    }

engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] tundmatu stsenaariumi liik { $other }. `kshana kinds` loetleb kõik sisseehitatud liigid (kokku { $n }).
       *[other] tundmatu stsenaariumi liik { $other }. `kshana kinds` loetleb kõik sisseehitatud liigid (kokku { $n }).
    }

engine-api-required-fields = - **Nõutavad väljad:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Valikulised väljad:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML-i parsimisviga: { $e }

engine-api-could-not-classify-scenario-kind = stsenaariumi liiki ei õnnestunud tuvastada: { $e }

engine-api-missing-required-field = { $kind_name }: puuduvad nõutavad väljad — { $options }

engine-api-missing-required-field-2 = { $kind_name }: puudub nõutav väli "{ $entry }"

engine-e-api-invalid-orbit-scenario = vigane orbiidistsenaarium: { $e }

engine-e-api-sp3-export-requires-an-orbit = SP3 eksport vajab orbiidistsenaariumi, mitte '{ $k }'

engine-e-api-omm-export-requires-an-orbit = OMM eksport vajab orbiidistsenaariumi, mitte '{ $k }'

engine-e-api-oem-export-requires-an-orbit = OEM eksport vajab orbiidistsenaariumi, mitte '{ $k }'

engine-e-api-invalid-scenario-toml = vigane stsenaariumi TOML: { $e }

engine-e-api-could-not-re-serialise-scenario = stsenaariumi uuesti serialiseerimine ebaõnnestus: { $e }

engine-api-scenario-jamming-availability-under-jamming = stsenaarium { $r } | segamine { $v2 } | kättesaadavus segamise korral { $availability_under_jamming } (nominaalne { $availability_nominal }) | väikseim jälgimine { $min_tracking } | keskmine J/S { $v6 }

engine-e-api-the-result-document-already-carries = tulemusdokument sisaldab juba võtit `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = figure_tiers serialiseerimine ebaõnnestus: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = vigane { $label } stsenaarium: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = stsenaarium { $r } | kvant-holdover { $holdover_s }s p95 { $pos_p95_m }m | klassikaline holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = stsenaarium { $r } | spuufimine { $scn } vs { $threshold_ns } ns spetsifikatsioon (P_fa { $target_pfa }) | kvantturve { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | klassikaline turve { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] terviklikkus | { $n_sats } satelliit | epohhe saadaval: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): terviklikkuse sündmusi { $report2 }, HMI { $report3 }
       *[other] terviklikkus | { $n_sats } satelliiti | epohhe saadaval: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): terviklikkuse sündmusi { $report2 }, HMI { $report3 }
    }

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | lõunapoolus | epohhe saadaval: { $samples_available }/{ $samples_total } ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | sekulaarne LTC−TT kiirus { $secular_rate_us_per_day } µs/day (riba { $band_low }–{ $band_high }) | isepotentsiaal { $self_potential_us_per_day } kineetiline { $kinetic_us_per_day } | nihe @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | baas { $baseline_km } km | majaka kaugus { $beacon_range_km } km | viivitus { $report } µs (kiirus { $delay_rate_s_per_s } s/s) | lähiväli { $near_field_correction_us } µs | valimeid { $samples } ajavahemikus { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_sat ->
        [one] lunar-joint-od-clock | { $n_sat } satelliit, Maa jaamu: { $n_earth } | jaama 3D-viga VLBI-ga { $station_pos_err_m } m vs ainult kaugusmõõtmisega { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× teravam) | sat. asukoha RMS { $sat_pos_rms_m } m | jaama kellaviga { $station_clock_err_s } s | vaatlusi/parameetreid: { $n_obs }/{ $n_params }
       *[other] lunar-joint-od-clock | { $n_sat } satelliiti, Maa jaamu: { $n_earth } | jaama 3D-viga VLBI-ga { $station_pos_err_m } m vs ainult kaugusmõõtmisega { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× teravam) | sat. asukoha RMS { $sat_pos_rms_m } m | jaama kellaviga { $station_clock_err_s } s | vaatlusi/parameetreid: { $n_obs }/{ $n_params }
    }

engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } punkt | nihkeviga { $trans_err_norm_m } m, pöördeviga { $rot_err_norm_rad } rad, skaalaviga { $scale_err_ppb } ppb | RMS-jääk { $rms_residual_m } m | koondunud { $converged }
       *[other] lunar-frame-realisation | { $n_points } punkti | nihkeviga { $trans_err_norm_m } m, pöördeviga { $rot_err_norm_rad } rad, skaalaviga { $scale_err_ppb } ppb | RMS-jääk { $rms_residual_m } m | koondunud { $converged }
    }

engine-api-builtins-moonlight-service-volume-sats-pts =
    { $n_sats ->
        [one] moonlight-service-volume | { $n_sats } satelliit ({ $geometry_label }) | punkte × epohhe: { $n_grid_points } × { $n_epochs } | kate { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelliite { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL kättesaadavus { $pl_availability_pct }% | MODELLED
       *[other] moonlight-service-volume | { $n_sats } satelliiti ({ $geometry_label }) | punkte × epohhe: { $n_grid_points } × { $n_epochs } | kate { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelliite { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL kättesaadavus { $pl_availability_pct }% | MODELLED
    }

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemeriid { $report } ({ $provenance }) nõutav σ_URE { $fmt } vs Kepleri { $fmt2 } vs häiritud { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    { $n_sats ->
        [one] lunar-differential-pnt | { $n_sats } satelliit (illustratiivne LCNS-klass, mitteseotud) | baas { $baseline_km } km | kasutaja viga { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (vähenemine { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
       *[other] lunar-differential-pnt | { $n_sats } satelliiti (illustratiivne LCNS-klass, mitteseotud) | baas { $baseline_km } km | kasutaja viga { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (vähenemine { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
    }

engine-api-builtins-lunar-station-coverage-points-epochs =
    { $n_trials ->
        [one] lunar-station-coverage | punkte x epohhe x katseid: { $n_grid_points } x { $n_epochs } x { $n_trials } | kättesaadavus { $v4 } % | kate { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | korrigeeritud p{ $percentile } 3D { $f } (korrigeerimata { $f2 }) | HPL maks { $f3 } | MODELLED; ei ole väide ühegi reaalse süsteemi kohta
       *[other] lunar-station-coverage | punkte x epohhe x katseid: { $n_grid_points } x { $n_epochs } x { $n_trials } | kättesaadavus { $v4 } % | kate { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | korrigeeritud p{ $percentile } 3D { $f } (korrigeerimata { $f2 }) | HPL maks { $f3 } | MODELLED; ei ole väide ühegi reaalse süsteemi kohta
    }

engine-api-builtins-terrain-horizon-at-the-station = { " " }| maastikuhorisont ({ $sources }) jaamas maks { $horizon_max_deg } deg, kasutajapunktide keskmine maks { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | olekuid { $n_states }, OEM-i ridu { $oem_line_count } | vastavuskontroll { $v5 } (olemas { $present_fields } / puudu { $missing_fields }) | OEM-i edasi-tagasi teisendus { $v8 } | ajametaandmete edasi-tagasi teisendus { $v9 } | KIF { $kif_bytes } baiti | MODELLED
       *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | olekuid { $n_states }, OEM-i ridu { $oem_line_count } | vastavuskontroll { $v5 } (olemas { $present_fields } / puudu { $missing_fields }) | OEM-i edasi-tagasi teisendus { $v8 } | ajametaandmete edasi-tagasi teisendus { $v9 } | KIF { $kif_bytes } baiti | MODELLED
    }

## src/api/builtins.rs

engine-api-builtins-scenario-optical-sync-rms-ps = stsenaarium { $r } | optiline sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | kvantahel { $quantum_chain_sigma_s }s vs klassikaline { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | turve Pd { $security_pd } (Pfa { $monitor_pfa }) | anomaalia Pd { $anomaly_pd } | kompromissivõrdlus: kvant võidab { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | katkestus { $outage_s }s | kvandi asukohaviga { $quantum_pos_err_m } m vs klassikaline { $classical_pos_err_m } m ({ $improvement_x }x) | holdover kvant { $quantum_holdover_s }s vs klassikaline { $classical_holdover_s }s (lävi { $threshold_m } m) | kompromissivõrdlus: kvant võidab { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC kvant { $quantum_auc } vs klassikaline { $classical_auc } | väikseim tuvastatav rike kvant { $quantum_min_detectable } vs klassikaline { $classical_min_detectable } | rikkeklasse: { $fault_catalog } | kompromissivõrdlus: kvant võidab { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] kehtib ainult fusion-liigile

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = stsenaarium { $r } | kvant PNT-holdover { $pnt_holdover_s }s (aeg { $timing_holdover_s }s/asukoht { $position_holdover_s }s) terviklikkus { $integ } turve { $security_na } | klassikaline PNT-holdover { $pnt_holdover_s2 }s (aeg { $timing_holdover_s2 }s/asukoht { $position_holdover_s2 }s) terviklikkus { $integ2 } turve { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = stsenaarium { $r } | liidetud | kvant PNT-holdover { $pnt_holdover_s }s (aeg { $timing_holdover_s }s/asukoht { $position_holdover_s }s) terviklikkus { $integ } turve { $security_na } | klassikaline PNT-holdover { $pnt_holdover_s2 }s (aeg { $timing_holdover_s2 }s/asukoht { $position_holdover_s2 }s) terviklikkus { $integ2 } turve { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = stsenaarium { $r } | hybrid-ukf (17 olekut, MODELLED) | andur { $v2 } (q_va { $effective_q_va }) | kell q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } vahemikus [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } vahemikus [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | toetatud { $aided_pos_rms_m }m -> vabajooks { $coast_end_pos_rms_m }m { $coast_duration_s }s jooksul | sisemine kooskõla, mitte täpsus

engine-api-builtins-scenario-gnss-ins-quantum-outage = stsenaarium { $r } | gnss-ins | kvant katkestuse-RMS liidetud { $fused_outage_rms_m }m vs vaba { $free_outage_rms_m }m (hold { $holdover_s }s, kättesaadavus { $availability }) | klassikaline liidetud { $fused_outage_rms_m2 }m vs vaba { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, kättesaadavus { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = stsenaarium { $r } | gnss-sim | keskmine iono { $mean_iono_m }m tropo { $mean_tropo_m }m | RAIM kättesaadavus { $raim_availability } keskmine HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m rikete sagedus { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db =
    { $n_sats ->
        [one] stsenaarium { $r } | spoof-detect | { $n_sats } SV, +{ $power_advantage_db } dB{ $v4 } | { $push } tõuge | liidetud skoor { $score } (lävi { $fusion_threshold }) | { $verdict }
       *[other] stsenaarium { $r } | spoof-detect | { $n_sats } SV, +{ $power_advantage_db } dB{ $v4 } | { $push } tõuge | liidetud skoor { $score } (lävi { $fusion_threshold }) | { $verdict }
    }

engine-api-builtins-sweep-over-pts-scale-quantum = pühkimine { $metric } parameetri { $parameter } üle ({ $first }..{ $last }, punkte: { $points }, skaala { $scale }) | kvant { $first2 }->{ $last2 } | klassikaline { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = stsenaarium { $r } | valimeid GNSS-nominaalne: { $nominal }/{ $series } | parim PDOP { $fnum } asukoht { $posm } | kvant holdover { $holdover_s }s p95 { $ns1 }ns terviklikkus { $integ } turve { $security_na } | klassikaline holdover { $holdover_s2 }s p95 { $ns12 }ns terviklikkus { $integ2 } turve { $security_na }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| maks kõrgusnurk { $el }° Doppleri tipp { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] stsenaarium { $r } | { $source } | { $n_samples } valim | kõrgus { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | kiirus { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] stsenaarium { $r } | { $source } | { $n_samples } valimit | kõrgus { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | kiirus { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }

engine-api-builtins-generic-sweep-of-over-nodes = `{ $kind }` üldine pühkimine üle [{ $keys }] | sõlmi: { $points } (kuju { $shape }) | mõõdikud [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | vaba-inertsiaalne triiv { $free_inertial_drift_m } m | gravitatsioonisobitatud { $map_matched_error_m } m | sobitamise sigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| viiteaste { $reference_nmax } anomaalia std { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| kaardivea MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% piires { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | vaba-inertsiaalne triiv { $free_inertial_drift_m } m | maastikusobitatud { $matched_error_m } m ({ $v3 }x vähenemine) | sobitamise sigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | teekonnapunkte: { $waypoints } | vaba-inertsiaalne RMS { $free_inertial_rms_m } m (lõpp { $free_inertial_final_m } m) | maastikusobitatud RMS { $matched_rms_m } m (lõpp { $matched_final_m } m, { $v6 }x vähenemine) | keskmine ESS { $mean_ess }/{ $cfg } | sobitamise sigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | vaba-inertsiaalne triiv { $free_inertial_drift_m } m | gravitatsioon { $gravity_only_m } m magnetiline { $magnetic_only_m } m maastik { $terrain_only_m } m | LIIDETUD { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] vajab runs = 1: mõõdetud logi on üks kirje

engine-api-builtins-scenario-runs-quantum-holdover-p95 = stsenaarium { $r } | käivitusi: { $runs } | kvant holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns turve { $security_na } | klassikaline holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns turve { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = stsenaarium { $r } | kvant holdover { $holdover_s }s p95 { $ns1 }ns terviklikkus { $integ } turve { $security_na } | klassikaline holdover { $holdover_s2 }s p95 { $ns12 }ns terviklikkus { $integ2 } turve { $security_na }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one] { " " }| RAIM saadaval epohhe: { $n_available } / { $n_epochs } (keelatud { $n_denied }, alarme { $n_alarm }; MODELLED)
       *[other] { " " }| RAIM saadaval epohhe: { $n_available } / { $n_epochs } (keelatud { $n_denied }, alarme { $n_alarm }; MODELLED)
    }

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = viitejuhtum vajab vähemalt ühte satelliiti

engine-e-araim-reference-reference-case-needs-at-least-2 = viitejuhtum vajab vähemalt ühte satelliidikonstellatsiooni

engine-e-araim-reference-satellite-names-constellation-but-only = satelliit { $i } viitab konstellatsioonile { $constellation }, kuid deklareeritud on ainult { $constellations }

engine-e-araim-reference-satellite-has-non-positive-error = satelliidil { $i } on mittepositiivne vea dispersioon

engine-e-araim-reference-both-integrity-risk-allocations-must = mõlemad terviklikkusriski jaotused peavad olema positiivsed

engine-e-araim-reference-this-reference-implementation-monitors-single = see viiterealisatsioon jälgib ainult üksiksündmuse rikkerežiime, kuid juhtumi apriooritõenäosused nõuavad N_fault,max = { $nfm } (samaaegsed mitmesündmuselised alamhulgad). Keeldutakse, selle asemel et rikkerežiime alaarvestada.

engine-e-araim-reference-the-all-in-view-geometry = kõigi nähtavate satelliitide geomeetria on singulaarne

engine-e-araim-reference-no-fault-mode-is-observable = ühtegi rikkerežiimi ei saa selles geomeetrias jälgida

engine-e-araim-reference-unknown-reference-vector-known-vectors = tundmatu viitevektor '{ $vector }'; tuntud vektorid: { $ids } (või 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: avaldatud WG-C viitevektoreid: { $wanted }; halvim VPL/HPL lahknevus { $worst_acceptance } m viite enda TOL_PL = { $tol } m suhtes (vastuvõtuvektoreid: { $acceptance_checked })

engine-e-araim-reference-sat-needs-one-value-per = P_sat vajab ühte väärtust satelliidi kohta ja P_const ühte konstellatsiooni kohta

engine-e-araim-reference-satellite-names-an-undeclared-constellation = satelliit viitab deklareerimata konstellatsioonile

engine-e-araim-reference-every-prior-must-lie-in = iga apriooritõenäosus peab olema vahemikus [0, 1)

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] apriooritõenäosused vajavad alamhulki samaaegsete sündmuste arvuga: { $n_fault_max }; see tee loendab kuni { $most }
       *[other] apriooritõenäosused vajavad alamhulki samaaegsete sündmuste arvuga: { $n_fault_max }; see tee loendab kuni { $most }
    }

engine-e-araim-reference-the-all-in-view-solution = kõigi nähtavate satelliitide lahendit ei valitud

engine-e-araim-reference-an-add-v4-case-needs = ADD v4.2 juhtum vajab satelliite ja konstellatsioone

engine-e-araim-reference-nom-and-sat-need-one = b_nom ja P_sat vajavad ühte väärtust satelliidi kohta

engine-e-araim-reference-const-needs-one-value-per = P_const vajab ühte väärtust konstellatsiooni kohta

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = satelliit { $i } viitab deklareerimata konstellatsioonile

engine-e-araim-reference-one-constellation-index-per-satellite = üks konstellatsiooniindeks satelliidi kohta

engine-e-araim-reference-satellite-names-constellation-with-no = satelliit { $i } viitab konstellatsioonile { $c }, millel puudub ISM

engine-e-araim-reference-fewer-than-four-satellites-above = maskist kõrgemal on alla nelja satelliidi

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m peab sisaldama vähemalt ühte turvakaugust (standoff)

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (riba { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | jalajälg { $a2 }% haaramine, serv { $footprint_limb_captured } | spuufimise haaramine { $spoof_captured } (lukk { $spoof_lock_time_s } s) | masti ulatus { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% väärtusest 50 bit/s), { $nma_auth_latency_s } s latentsus

engine-attack-surface-reached-crossing-best-db = saavutatud (lõikepunkte: { $crossings }, parim { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = EI saavutata selles ruudustikus (parim { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB puudu; vaja { $best_limb_capture_tx_power_dbw } dBW vs { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| jalajälje pühkimine { $s }x{ $s2 } (kõrgus { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), haaramine { $v5 }-{ $v6 }% | serv { $limb }

engine-attack-surface-afs-received-dbw = AFS vastuvõetud: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Puudujääk: { $deficit_db } dB (riba { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Haaramise jalajälg: { $a }% kettast, serv haaratud: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Spuufimise haaramise sissetõmme: { $spoof_captured } (lukk { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Masti ulatus: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Serv: haaratud { $na }x{ $nb } ruudustikul, lõikepunkte: { $crossings }

engine-attack-surface-limb-not-captured-on-grid = Serv: ei haaratud { $na }x{ $nb } ruudustikul; vaja { $best_limb_capture_tx_power_dbw } dBW (lennatud { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km peab olema lõplik ja positiivne

engine-e-attitude-budget-inertias-must-be-finite-and = inertsimomendid peavad olema lõplikud ja positiivsed

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 peab olema >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = vaja on vähemalt ühte sihtimise panustajat

engine-e-attitude-budget-contributor-sigma-must-be-finite = panustaja '{ $name }' sigma peab olema lõplik ja >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> GG moment { $t_gg } N·m; sihtimine { $total }" RSS (domineeriv: { $dominant }) (MODELLED skalaarbilanss)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } vajab väärtust

engine-bench-cli-unknown-option = tundmatu valik `{ $a }`

engine-bench-cli-unexpected-argument = ootamatu argument `{ $pos }`

engine-bench-cli-cannot-read = { $p } lugemine ebaõnnestus: { $e }

engine-bench-cli-cannot-create = { $d } loomine ebaõnnestus: { $e }

engine-bench-cli-cannot-write = { $p } kirjutamine ebaõnnestus: { $e }

engine-bench-cli-unknown-task-or = tundmatu ülesanne `{ $t }` (a, b, c või d)

engine-bench-cli-scored-epochs-in-folder = hinnatud epohhe: { $labels }, kaustu: { $folders }

engine-bench-cli-wrote-cases-json-and-truth = kirjutatud { $out }/cases.json ja { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: see sidumine (commitment) on esialgne ja selle algväärtus (seed) on avalikustatud; see ei ole väljalaske holdout

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: algväärtus (seed) ei ole see, mis on selle sidumise (commitment) taga

engine-bench-cli-is-not-json = { $f } ei ole JSON: { $e }

engine-bench-cli-cannot-read-2 = { $i } lugemine ebaõnnestus: { $e }

engine-bench-cli-result-rendered = renderdatud tulemusi: { $results }

engine-bench-cli-unknown-subcommand =
    tundmatu alamkäsk `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-cannot-create-an-existing-seed = { $path } loomine ebaõnnestus (olemasolevat algväärtusefaili ei kirjutata kunagi üle): { $e }

engine-bench-cli-cannot-write-2 = { $path } kirjutamine ebaõnnestus: { $e }

engine-bench-cli-seed-written-to-keep-it = algväärtus (seed) kirjutatud faili { $path }: hoia seda versioonihalduse ja kõigi sõnumite väljaspool; avalik on ainult allolev räsi

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (üle võetud, mitte uuesti käivitatud)

engine-bench-cli-impairment-eval-baseline = impairment-eval lähtetase: { $det }

engine-bench-cli-no-scenario-json-under = kausta { $root } all puudub scenario.json

engine-bench-cli-is-not-json-2 = { $path } ei ole JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = korras: { $ok }, lahknevaid: { $bad }, puuduvaid: { $missing }, fikseerimata: { $unpinned }

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = tundmatu jaotus `{ $other }` (dev, test või holdout)

engine-bench-score-for-is-not-finite = `{ $id }` skoor ei ole lõplik

engine-bench-case-have-no-score-the = skoorita juhtumeid: { $missing }, esimene on `{ $first_missing }`

engine-bench-predictions-name-case-that-is = ennustused nimetavad juhtumit, mida tõeandmetes pole: `{ $extra }`

engine-bench-schema-must-be = `schema` peab olema `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` peab olema 64-kohaline kuueteistkümnendsüsteemi SHA-256

engine-bench-truth-is-not-json = tõeandmed ei ole JSON: { $e }

engine-bench-predictions-are-not-json = ennustused ei ole JSON: { $e }

engine-bench-truth-schema-must-be = tõeandmete `schema` peab olema `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = ennustuste `schema` peab olema `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = tõeandmed on koostatud muu spetsifikatsiooniversiooni all kui { $SPEC_VERSION }; erinevate põhiversioonide tulemusi ei segata kunagi

engine-bench-unknown-task = tundmatu ülesanne `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = tulemus { $v1 } ei ole kehtiv: { $p }

engine-bench-site-result-is-task-holdout-result = tulemus { $v1 } on ülesande (d) holdout-tulemus ilma võtmeta `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = tulemus { $v1 } on hinnatud esialgse, avalikustatud holdout-algväärtuse (seed) alusel: see ei ole väljalaske holdout

engine-bench-site-result-was-scored-under-this = tulemus { $v1 } hinnati versiooni { $v } all; see leht on versiooni { $SPEC_VERSION } jaoks

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = `{ $k }` skoor ei ole arv

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } ({ $lit_0_35 } vaikimisi seirestatistik)

engine-bench-tasks-malformed-clock-line = vigane kellarida `{ $line }`

engine-bench-tasks-the-clock-file-does-not = kellafail ei vasta fikseeritud SHA-256-le (saadi { $got }, soovitud { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = satelliiti { $prn } kellafailis pole

engine-bench-tasks-kshana-bench-baseline = kshana-bench lähtetase: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = ennustused katavad juhtumeid: { $pmap }, tõeandmetes on { $tarr }

engine-bench-tasks-case-has-no-number-array = juhtumil `{ $id }` puudub arvumassiiv

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] juhtum `{ $id }` vajab { $n } väärtust, olemas: { $a }
       *[other] juhtum `{ $id }` vajab { $n } väärtust, olemas: { $a }
    }

engine-bench-tasks-case-has-non-finite-value = juhtumil `{ $id }` on mittelõplik väärtus

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialiseerimine { $name }: { $e }

engine-e-bin-crossover-study-write = kirjutamine { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = viga: { $dir } loomine ebaõnnestus: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = valmis: inertsiaal { $nodes } sõlme, kell { $curves } kõverat (algväärtus 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } kasutajaepohh x 3 URA väärtust { $dt } s jooksul = { $v1 } ms kasutajaepohhi kohta (lahendatavaid: { $ok })
       *[other] { $n } kasutajaepohhi x 3 URA väärtust { $dt } s jooksul = { $v1 } ms kasutajaepohhi kohta (lahendatavaid: { $ok })
    }

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = kirjutatud docs/INTEROP.md (ekspordi tabel)

## src/bin/validation_report.rs

engine-bin-validation-report-wrote-validation-summary-to = valideerimise kokkuvõte kirjutatud faili { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = tundmatu taevakeha '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigeerib Maast erineva taevakeha ümber Maa-lingiga; { $name } pole siin toetatud

engine-e-body-pnt-duration-and-step-must-be = duration_s ja step_s peavad olema positiivsed, kuni 20000 epohhi; saadi { $duration } ja { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind peab olema orbiter või surface; saadi '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = kasutaja kõrgus peab olema positiivne ja ekstsentrilisus vahemikus [0, { $lit_0_9 })

engine-e-body-pnt-the-user-orbit-periapsis-is = kasutaja orbiidi periapsis on pinna all

engine-e-body-pnt-constellation-needs-to-200-satellites = konstellatsioon vajab 1 kuni 200 satelliiti vähemalt ühes tasandis

engine-e-body-pnt-constellation-altitude-must-be-positive = konstellatsiooni kõrgus peab olema positiivne

engine-e-body-pnt-range-sigmas-must-be-positive = kaugussigmad peavad olema positiivsed

engine-e-body-pnt-no-earth-position-relative-to = Maa asukoht taevakeha { $name } suhtes puudub JD { $jd } juures

engine-e-body-pnt-serialising-report = aruande serialiseerimine: { $e }

engine-e-body-pnt-the-report-must-serialise-to = aruanne peab serialiseeruma JSON-objektiks

engine-body-pnt-positioning-around-user-relays-at =
    Positsioneerimine { $name } ümber — { $user_kind } kasutaja, releesid: { $n_relays } kaugusel { $r } km, epohhe: { $n_epochs }
    { "  " }Maa valgusaeg { $one_way_light_time_s } s ühesuunaline, { $two_way_light_time_s } s edasi-tagasi; Päike–Maa–taevakeha nurk { $sun_separation_deg } deg
    { "  " }kättesaadavus: { $availability_relays } ainult konstellatsioon, { $availability_with_earth } koos Maa kaugusega (Maa nähtav { $earth_visibility })
    { "  " }mediaan-PDOP { $opt }; RMS-viga { $opt2 } ainult konstellatsioon, { $opt3 } koos Maa kaugusega
    { "  " }mediaanne formaalne sigma { $opt4 } ainult konstellatsioon, { $opt5 } koos Maa kaugusega{ "\u000A" }

engine-body-pnt-positioning-around = Positsioneerimine { $name } ümber

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] { $user_kind } kasutaja · { $n_relays } relee · Maa valgusaeg { $one_way_light_time_s } s · MODELLED
       *[other] { $user_kind } kasutaja · { $n_relays } releed · Maa valgusaeg { $one_way_light_time_s } s · MODELLED
    }

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = E1 stsenaarium ei ole tabel

engine-e-calibration-ensembles-e1-scenario-has-no-monte = E1 stsenaariumil puudub [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } puudub

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 on `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ansamblit 200 realisatsiooniga igaüks, võrreldes suletud kujuga: keskmine 0, sigma = { $sigma } ns. Ansambel j kasutab baasalgväärtust (seed) 1 000 000 + 1000 j ja bootstrap-algväärtust (seed) 20260928 + j. Suurim suhteline ADEV-viga oli { $max } ansamblil E2 ja { $max2 } ansamblil E3 (üle 1, 10 ja 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = tühi tulemustee

engine-e-campaign-result-path-has-an-empty = tulemustee `{ $path }` sisaldab tühja segmenti

engine-e-campaign-result-path-bad-index-in = tulemustee `{ $path }`: vigane indeks osas `{ $part }`

engine-e-campaign-result-path-no-field = tulemustee `{ $path }`: väli `{ $name }` puudub

engine-e-campaign-result-path-indexed-value-is = tulemustee `{ $path }`: indekseeritud väärtus ei ole massiiv

engine-e-campaign-result-path-index-out-of =
    { $n ->
        [one] tulemustee `{ $path }`: indeks { $i } väljaspool vahemikku ({ $n })
       *[other] tulemustee `{ $path }`: indeks { $i } väljaspool vahemikku ({ $n })
    }

engine-e-campaign-result-path-value-is-not = tulemustee `{ $path }`: väärtus ei ole arv ega lipp

engine-e-campaign-result-path-is-not-an = tulemustee `{ $path }`: `{ $k }` ei ole massiiv

engine-e-campaign-result-path-must-name-one = tulemustee `{ $path }` peab nimetama ühte väärtust, mitte ridu

engine-e-campaign-result-path-is-not-an-2 = tulemustee `{ $path }`: `{ $name }` ei ole massiiv

engine-e-campaign-metric-path-has-no-entry = mõõdikutee `{ $path }` kirje puudub selle liigi units-plokis; deklareeri selle `unit` kampaanias

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` peab olema mittetühi: tähed, numbrid, `_` või `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: kampaania ei saa sisaldada kampaaniat

engine-e-campaign-serialise = { $label }: serialiseerimine: { $e }

engine-e-campaign-result-did-not-parse = { $label }: tulemust ei õnnestunud parsida: { $e }

engine-e-campaign-seed-key-no-field-in = algväärtuse võti `{ $key }`: stsenaariumis puudub väli `{ $part }`

engine-e-campaign-seed-key-is-not-non = algväärtuse võti `{ $key }` ei ole mittenegatiivne täisarv

engine-e-campaign-seed-does-not-fit-toml = algväärtus { $seed } ei mahu TOML-i täisarvu

engine-campaign-time-path-must-name-rows = ajatee `{ $t }` peab nimetama ridu märgendiga `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` ei ole below, above ega abs_above

engine-campaign-threshold-is-null = lävi `{ $p }` on null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` ei ole mean, min, max ega count

engine-campaign-time-path-gives-several-values = ajatee `{ $t }` annab rea kohta mitu väärtust

engine-campaign-value-path-has-fewer-rows = väärtustee `{ $y }` sisaldab vähem ridu kui `{ $t }`

engine-campaign-value-path-has-rows-time = väärtusteel `{ $y }` on ridu: { $r }, ajateel `{ $t }` ridu: { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = faasidega kampaania vajab sektsiooni [timeline], milles on step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s peab olema positiivne, saadi { $step }

engine-e-campaign-phase-is-named-twice = faas `{ $name }` on nimetatud kaks korda

engine-e-campaign-phase-duration-must-be-non = faas `{ $name }`: duration_s peab olema mittenegatiivne

engine-e-campaign-phase-has-no-runs = faasil `{ $name }` puuduvad käivitused (runs)

engine-e-campaign-phase-the-first-phase-has = faas `{ $name }`: esimesel faasil pole midagi edasi anda

engine-e-campaign-phase-handoff-from-channel-which = faas `{ $name }`: üleandmine kanalist `{ $ch }`, millega eelmine faas ei lõppenud

engine-e-campaign-phase-handoff-from-run-does = faas `{ $name }`: üleandmise from_run { $from_run } ei ole olemas

engine-e-campaign-phase-handoff-is-null = faas `{ $name }`: üleandmine `{ $from }` on null

engine-e-campaign-phase-handoff-run-does-not = faas `{ $name }`: üleandmise käivitust { $run } ei ole olemas

engine-e-campaign-phase = faas `{ $name }`: { $e }

engine-campaign-phase-run = faas { $name }/käivitus { $ri }

engine-e-campaign-phase-end-at-run-does = faas `{ $name }`: end_at_run { $end_at_run } ei ole olemas

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s on hilisem)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } on null)

engine-e-campaign-phase-side-is-not-classical = faas `{ $name }`: pool `{ $side }` ei ole classical ega quantum

engine-e-campaign-phase-skip-must-be-non = faas `{ $name }`: skip_s peab olema mittenegatiivne

engine-e-campaign-phase-alarm-compare-is-not = faas `{ $name }`: alarmi compare `{ $compare }` ei ole below, above ega abs_above

engine-e-campaign-phase-alarm-threshold-is-null = faas `{ $name }`: alarmi lävi `{ $p }` on null

engine-e-campaign-phase-channel-is-in-not = faas `{ $name }`: kanal `{ $channel }` on ühikus { $u }, mitte { $du }

## src/campaign.rs

engine-e-campaign-phase-channel-needs-unit = faas `{ $name }`: kanal `{ $channel }` vajab ühikut

engine-e-campaign-phase-two-runs-both-provide = faas `{ $name }`: kaks käivitust annavad mõlemad kanali `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = faas `{ $name }` kannab edasi `{ $ch }`, millega eelmine faas ei lõppenud

engine-e-campaign-phase-carries-but-no-run = faas `{ $name }` kannab edasi `{ $ch }`, kuid ükski selle käivitus ei anna `{ $ch }`

engine-e-campaign-channel-is-in-in-one = kanal `{ $name }` on ühes faasis ühikus { $unit } ja teises ühikus { $unit2 }

engine-e-campaign-at-least-one-metric-is = vaja on vähemalt ühte mõõdikut

engine-e-campaign-metric-is-named-twice = mõõdik `{ $name }` on nimetatud kaks korda

engine-e-campaign-seed-overflow-in-the-ensemble = algväärtuse (seed) ületäitumine ansamblis

engine-e-campaign-an-ensemble-needs-at-least = ansambel vajab vähemalt ühte käivitust

engine-e-campaign-sweep-takes-one-to-three = pühkimine võtab ühe kuni kolm telge, saadi { $axes }

engine-e-campaign-axis-is-named-twice = telg `{ $name }` on nimetatud kaks korda

engine-e-campaign-axis-needs-at-least-two = telg `{ $name }` vajab vähemalt kahte sammu

engine-e-campaign-axis-scale-must-be-lin = telg `{ $name }`: scale peab olema lin või log

engine-e-campaign-axis-log-axis-needs-positive = telg `{ $name }`: logaritmiline telg vajab positiivseid otspunkte

engine-campaign-sweep-node = pühkimise sõlm { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs peab olema vähemalt kaks

engine-e-campaign-compose-needs-at-least-one = compose vajab vähemalt ühte liiget

engine-e-campaign-shared-value-must-be-number = jagatud väärtus `{ $name }` peab olema arv või arvud

engine-e-campaign-shared-value-is-named-twice = jagatud väärtus `{ $name }` on nimetatud kaks korda

engine-e-campaign-member-binds-unknown-shared = liige `{ $label }` seob tundmatu jagatud väärtuse `{ $name }`

engine-e-campaign-member = liige `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = mõõdik `{ $name }` on ühel liikmel ühikus { $u } ja liikmel `{ $label }` ühikus { $unit }

engine-e-campaign-member-is-named-twice = liige `{ $label }` on nimetatud kaks korda

engine-e-campaign-invalid-campaign-scenario = vigane kampaania stsenaarium: { $e }

engine-e-campaign-invalid-campaign = vigane kampaania: { $e }

engine-campaign-of-across-the-realisations = { $d }: { $what } üle realisatsioonide

engine-campaign-value-of-at-the-end = { $ch } väärtus eelmise faasi lõpus, lisatud selle faasi väärtusele { $ch }

engine-campaign-on-the-timeline-grid-the = { $label } ajajoone ruudustikul: omanikufaasi käivituse viimane valim igal ruudustiku ajahetkel või enne seda (nullindat järku hoidja); null seal, kus selle faasi ükski käivitus seda ei anna

engine-campaign-values-of-the-scenario-key = stsenaariumi võtme { $key } väärtused piki telge { $name }

engine-campaign-value-of-the-scenario-key = stsenaariumi võtme { $key } väärtus selles sõlmes

engine-campaign-of-the-node-result = { $path } sõlme tulemusest

engine-campaign-of-each-realisation-in-seed = { $path } igast realisatsioonist algväärtuse (seed) järjekorras

engine-campaign-shared-value-written-into-every = jagatud väärtus { $name }, kirjutatud igasse seda siduvasse liikmesse

engine-campaign-metric-read-from-the-member = mõõdik { $name } loetud liikme tulemusest

engine-campaign-smallest-across-the-members = väikseim { $name } üle liikmete

engine-campaign-largest-across-the-members = suurim { $name } üle liikmete

engine-campaign-mean-across-the-members = keskmine { $name } üle liikmete

engine-e-campaign-failed-to-serialise-campaign-result = kampaania tulemuse serialiseerimine ebaõnnestus: { $e }

engine-campaign-chain-phases-over-events-alarm = ahel: faase { $phases }, kestus { $duration_s } s, sündmusi { $events }, alarm tõstetud ruudustiku { $alarm_s } s jooksul

engine-campaign-sweep-of-nodes-over = `{ $scenario_kind }` pühkimine: sõlmi { $nodes } üle [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = `{ $scenario_kind }` Monte Carlo: algväärtusi (seed): { $runs }

engine-campaign-compose-members = compose: liikmeid { $members }

engine-campaign-member-runs-modelled = liikmete käivitusi: { $runs_total } (MODELLED)

engine-campaign-sweep-of-over-nodes-each = `{ $scenario_kind }` pühkimine üle { $axis_order } (sõlmi { $nodes }; iga joon oma vahemikus)

engine-campaign-campaign-modelled-composition-every-value = kampaania { $r } | MODELLED koosseis; iga väärtus on loetud nimetatud liigi tegelikust käivitusest

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = optimeerimine võtab ühe kuni kolm parameetrit (params), saadi { $params }

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` on nimetatud kaks korda

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: vajab lõplikku lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale peab olema lin või log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: logaritmiline param vajab positiivseid piire

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start peab olema vahemikus [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: ruudustik vajab vähemalt kahte sammu (steps)

engine-e-campaign-optimize-objective-target-is-only-read = objective.target loetakse ainult siis, kui goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" vajab lõplikku objective.target-it

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal peab olema minimize, maximize või target, saadi `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = { $total } sõlmega ruudustik ületab piiri 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps loetakse ainult siis, kui method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals peab katma algse simpleksi (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step peab olema vahemikus (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol ja xtol peavad olema mittenegatiivsed

engine-e-campaign-optimize-method-must-be-grid-or = method peab olema grid või nelder-mead, saadi `{ $other }`

engine-campaign-optimize-optimize-eval = optimeerimise hindamine { $trace }

engine-campaign-optimize-lower-bound-of-the-scenario = stsenaariumi võtme { $key } alampiir

engine-campaign-optimize-upper-bound-of-the-scenario = stsenaariumi võtme { $key } ülempiir

engine-campaign-optimize-value-of-the-scenario-key = stsenaariumi võtme { $key } väärtus parimal hindamisel

engine-campaign-optimize-value-of-the-scenario-key-2 = stsenaariumi võtme { $key } väärtus sellel hindamisel

engine-campaign-optimize-target-value-of = { $what } sihtväärtus

engine-campaign-optimize-at-the-best-evaluation = { $what } parimal hindamisel

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } sellel hindamisel (algväärtuste (seed) keskmine, kui runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimeeri `{ $objective_name }` ({ $goal } { $o }) liigil `{ $scenario_kind }` meetodiga { $method }: hindamisi { $evals } ({ $stop_reason }), parim { $o2 } kohal [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START enne CCSDS_TDM_VERS päist

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: vigane päise rida: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: vigane metaandmete rida: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: vigane andmerida: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: tundmatu andmete võtmesõna { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: andmerida { $k }: puudub epohh

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: andmerida { $k }: puudub väärtus

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: andmerida { $k }: vigane väärtus { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: lõpetamata segment (puudub META_STOP/DATA_STOP)

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: vigane TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: vigane TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = tundmatu vaadeldav suurus `{ $other }`: oodatud on üks järgmistest: range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = tundmatu koordinaatide esitus `{ $other }`: oodatud on üks järgmistest: cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours peab olema lõplik ja positiivne, saadi { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs peab olema ≥ 2, saadi { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps peab olema ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials peab olema ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations peab olema ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd peab olema lõplik ja positiivne, saadi { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor peab olema lõplik ja positiivne, saadi { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km peab olema lõplik ja positiivne, saadi { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m peab olema lõplik ja positiivne, saadi { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s peab olema lõplik ja positiivne, saadi { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = konstellatsioon peab sisaldama vähemalt juhtsatelliiti (chief) ja ühte viitesatelliiti

engine-e-cislunar-arc-recovery-family-is-an-out-of = perekond `{ $family }` on tasandiväline perekond ja sellel puudub tasapinnaline nelja olekuga esitus: selle pühkimiseks sea spatial = true

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = otsemudel andis mittelõpliku tõemõõtmise

engine-cislunar-arc-recovery-first-arc-length-at-which = esimene kaare pikkus, mille korral IGA algväärtustatud (seeded) katse müravaba pakettlahendus viib lõppoleku vea kuni { $recovery_factor } korrani algselt lähtutud apriorsest nihkest. See on astakukriteeriumi taastamise analoog: täpsete mõõtmistega muutub küsimus `is the state observable?` küsimuseks `can an estimator get it back?`, ja vastusesse ei lähe ühtki singulaarväärtuse tolerantsi.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = esimene kaare pikkus, mille korral Monte Carlo RMS asukoha taastamisviga üle algväärtustatud (seeded) müra realisatsioonide (katseid: { $trials }) langeb tasemele { $error_bound_km } km või allapoole. See on hinnatavuse kriteeriumi taastamise analoog, mõõdetud, mitte ennustatud: viga on hinnangu kaugus teadaolevast tõest, mitte formaalse kovariatsiooni jälg.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED ühe epohhiruudustiku sammu piires: hindaja taastub alates { $e } h, Gramiani astakukriteerium lülitub { $g } h juures (suhe { $v1 }, ruudustik { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED taastatavuse piirina: hindaja taastub alates { $e } h, { $v1 } Gramiani astakukriteeriumi { $g } h (suhe { $v2 }, ruudustik { $grid_hours } h). Astakukriteerium on suhteline singulaarväärtuse kokkulepe; taastamispiir on mõõdetud olekuviga ja need kaks ei lange siin kokku.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: hindaja ei täida sellel kaarel kunagi oma taastamispiiri, samas kui Gramiani astakukriteerium lülitub { $g } h juures.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = Gramiani astakukriteeriumi ei täideta sellel kaarel kunagi (geomeetria ei jõua kunagi täisastakuni), samas kui hindaja taastub alates { $e } h — need kaks ei ole üksmeelel selles, kas piir üldse eksisteerib.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | perekond { $family }, { $state_dim } olekut, { $n_spacecraft } s/c, vaadeldav suurus { $observable }, parametriseering { $coordinates } | kaar { $arc_hours } h, epohhe { $epochs } (ruudustik { $grid_hours } h), katseid { $trials }, algväärtus { $seed } | lõplike vahede osatuletised, ilma analüütilise Jacobi maatriksi / STM / SVD / SRIF-ita | müravaba taastamine alates { $nf } (tegur { $recovery_factor }) vs Gramiani astakulävi { $gram } | Monte Carlo hinnatavus alates { $est } (RMS asukoht ≤ { $error_bound_km } km, σ { $sigma_range_m } m) vs Gramiani hinnatavus { $gram_est } | kaare lõpu RMS asukoht { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = tundmatu perekond `{ $other }`: oodatud on üks järgmistest: dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO ristumiskaugusel { $d } ei õnnestunud diferentsiaalselt korrigeerida

engine-e-cislunar-observability-member-at-x0-did-not = { $label } liiget { $i } kohal x0 = { $x0 } ei õnnestunud diferentsiaalselt korrigeerida

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft peab olema vahemikus 2 kuni { $MAX_SPACECRAFT }, saadi { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs peab olema ≥ 2, saadi { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol peab olema lõplik ja positiivne, saadi { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m peab olema lõplik ja mittenegatiivne, saadi { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km peab olema lõplik ja positiivne, saadi { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } s/c (viiteid { $refs }) | kaar { $arc_hours } h, { $rank_arc } epohhi | astak { $first } → { $last } / { $state_dim } üle kaare | Gramiani λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | hetkeastak ainult range { $rank_range_only } → range+rate { $rank_range_rate } (linke { $n_links }) | GDOP ainult range { $ro } range+rate { $rr } | DRO algtingimused (maks perioodilisuse jääk { $max_resid }) | SRIF posterioor lõplik astak-4 epohhil { $srif_epoch } (kinnitatud astak/STM/DRO-sulgumine/SRIF, modelleeritud kavand)

engine-cislunar-observability-never-rank-of = mitte kunagi (astak { $rank } / { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | perekond { $family }, { $state_dim } olekut, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | astakulävi { $rank_thr } (ruudustik { $c } h) | hinnatavuse lävi (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = esimene kaare pikkus, mille korral juhtsatelliidi (chief) ALGOLEKU formaalne 1σ asukoha määramatus, σ_pos = sqrt(trace(P_rr)) kus P = (ÕᵀÕ)⁻¹ ja Õ on mõõtemürast valgendatud jälgitavusmaatriks, langeb tasemele { $sigma_pos_threshold_km } km või allapoole. See on kriteerium, mille korral kaarepikkuse lävi on üldse mürast sõltuv: P skaleerub kui σ², seega σ_pos skaleerub kui σ, samas kui ülaltoodud astakukriteerium σ-ga ei liigu. Piir on ETTE ANTUD inseneeriline valik, mitte sobitatud — estimability_sweep annab läve nelja muu piiri jaoks.

engine-cislunar-observability-validated-each-constellation-initial-condition = Kinnitatud: iga konstellatsiooni algtingimus on perekonna { $family } diferentsiaalselt korrigeeritud perioodiline orbiit, mis sulgub ühe perioodi jooksul teatatud perioodilisusjäägini (tasapinnalised DRO-d on lisaks Kuu suhtes retrograadsed). Perekond on korrigeeritud Maa–Kuu massisuhte juures. Modelleeritud: perekonna parameetrite ja faaside valik (konstellatsiooni kavand). Võtmenimi `dro_provenance` on säilitatud avaldatud dokumendiskeemi jaoks; see kannab seda perekonda, mida käivitus küsis.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } peab olema lõplik ja positiivne, saadi { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } peab olema vahemikus (0, 1), saadi { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg peab olema vahemikus [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems peab nimetama vähemalt ühe eelseadistuse (preset)

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias vajab lõplikke bias_m, t0_s ja t1_s

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] integrity: { $n } epohh ületab { $MAX_EPOCHS } epohhi piiri; suurenda step_s
       *[other] integrity: { $n } epohhi ületavad { $MAX_EPOCHS } epohhi piiri; suurenda step_s
    }

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: kirjed puuduvad

engine-e-clock-library-card-records-at-different-tau0 = { $name }: kirjed erinevatel tau0 väärtustel

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: perioodiline vähimruutude meetod ebaõnnestus

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: stabiilsuspunkte edf >= { $MIN_FIT_EDF } korral: { $used }; kaart vajab kolme

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = lüngad { $g }, faasi erandid { $o }, faasihüpped { $p }, pursked { $b }, sagedushüpped { $f } (robustne sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` ei ole mittenegatiivne täisarv

engine-e-compliance-is-missing = `{ $p }` puudub

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } ületab väärtuse events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } ületab väärtuse predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: receiver-trust arvud on vigased ({ $malformed_counts }); välja jäetud

engine-e-compliance-not-json = { $label }: ei ole JSON: { $e }

engine-compliance-cannot-read = { $label }: lugemine ebaõnnestus: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: kõrvalstsenaarium ütleb liigiks `{ $s }`, kuid tulemus ütleb `{ $o }`; ei kasutata

engine-e-compliance-scenario-kind-not-found-no = { $label }: stsenaariumi liiki ei leitud (kõrvalstsenaariumi faili pole, ei ole receiver-trust tulemus, ülemisel tasemel puudub `kind`)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` ei ole mootorile tuntud stsenaariumi liik; ei kasutata

engine-compliance-written-by-kshana = Koostanud kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    Testide arv, mille kõik nimetatud läved on täidetud: { $met }, mõne täitmata lävega: { $not_met }, sisendit vajavad: { $needs_input }.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = intensiivsuse ruudustikul peab olema lõplik min < max, saadi [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = intensiivsuse ruudustik vajab >= 2 sammu, saadi { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = korrelatsiooniruudustikul peab olema vähemalt üks väärtus

engine-e-conflict-resilience-correlation-values-must-lie-in = korrelatsiooniväärtused peavad olema vahemikus [0, 1], saadi { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience vajab vähemalt ühte kihti

engine-e-conflict-resilience-layer-availability-not-in = kiht { $i } kättesaadavus { $availability } ei ole vahemikus [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = kiht { $i } sigma_m peab olema lõplik ja positiivne

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = kiht { $i } haavatavus peab olema lõplik ja >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = kiht { $i } vector_weight peab olema lõplik ja >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } väljaspool vahemikku (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials peab olema >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | kihte { $layers } ({ $primary } baastase) | viiteintensiivsus { $reference_intensity } | vastupidavuse suhe suletud kuju { $ratio_closed_form }x MC { $ratio_mc_independent }x (kihiline vs ühekihiline) | korrelatsioon nullib kihilisuse: suhe { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | apriooriline CI [{ $ratio_lo }-{ $ratio_hi }]x | vektorikohane ellujäämine @ viide segamine { $surv }% spuufimine { $surv2 }% kineetiline { $surv3 }% küber { $surv4 }% (teravaim { $sharpest }) | ~7x pealkirjaarv MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = tundmatu keskkeha { $name }: oodatud on planeet, Pluuto, Kuu või suurem kuu (earth, moon, mars, europa, titan, ...; vt crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = Walkeri kest vajab total > 0 ja planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walkeri total { $total } ei ole planes { $planes } kordne

engine-e-constellation-walker-phasing-must-lie-in = Walkeri faasistus F = { $phasing } peab olema vahemikus 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } ei ole laiendatav GPS-i slott (SPS PS tabel 3.2-2 loetleb B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: anna altitude_km või semi_major_axis_km, mitte mõlemat

engine-e-constellation-needs-altitude-km-or-semi = { $what }: vajab altitude_km või semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: poolsuurtelg { $v1 } km ei ole { $name } raadiusest suurem

engine-e-constellation-eccentricity-must-lie-in = { $what }: ekstsentrilisus { $e } peab olema vahemikus [0, { $lit_0_9 })

engine-e-constellation-perigee-is-below-the-surface = { $what }: perigee on pinna all (keha { $name })

engine-e-constellation-constellation-preset-is-an-earth = konstellatsioon { $name }: eelseadistus { $p } on Maa konstellatsioon, keha on { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = konstellatsioon { $name }: tundmatu eelseadistus { $other } (oodatud on gps-baseline, gps-expandable, galileo, beidou, beidou-meo või glonass)

engine-e-constellation-constellation-expanded-applies-only-to = konstellatsioon { $name }: `expanded` kehtib ainult eelseadistusele gps-expandable

engine-constellation-constellation-shell = konstellatsioon { $name } kest { $v2 }

engine-constellation-explicit-element-sets = selgesõnalisi elemendikomplekte: { $satellite }

engine-constellation-constellation-satellite = konstellatsioon { $name } satelliit { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = konstellatsioonil { $name } puuduvad satelliidid: anna eelseadistus, [[constellation.shell]] või [[constellation.satellite]]

engine-e-constellation-no-constellation-given = konstellatsiooni pole antud

## src/constellation.rs

engine-e-constellation-constellations-with-one-clock-each = konstellatsioone { $constellations }, igaühel üks kell, ületab piiri { $MAX_CLOCKS } kella; kasuta clock = "common" või ühenda konstellatsioonid

engine-e-constellation-must-be-finite = { $what } peab olema lõplik

engine-e-constellation-need-step-and-duration-step = vaja on step_s > 0 ja duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = rohkem kui 100 000 epohhi; suurenda step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg peab olema vahemikus [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold peab olema positiivne

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg peab olema vahemikus [{ $lit_0_25 }, 90]

engine-e-constellation-need-90-lat-min-deg = vaja on -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = vaja on lon_min_deg < lon_max_deg, hõlmates kuni 360 deg

engine-e-constellation-give-at-least-one-constellation = anna vähemalt üks [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points on piiratud väärtusega 2000

engine-e-constellation-satellites-exceeds-the-50-000 = satelliitide arv { $total } ületab piiri 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: satelliite { $total } ({ $names }) ümber: { $name }; kättesaadavus { $global_availability_pct }% (PDOP <= { $pdop_threshold } maskil { $mask_deg } deg), halvim asukoht { $worst_site_availability_pct }%, mediaan-PDOP { $cov }, keskmiselt nähtaval { $global_mean_visible }; ruudustiku punkte { $grid_points } x epohhe { $epochs } (MODELLED)

engine-constellation-constellation-coverage-over-the = Konstellatsiooni kate: { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } peab olema lõplik ja positiivne

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } peab olema lõplik ja >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw peab olema lõplik

engine-e-contact-schedule-satellite-altitude-km-must-be = satelliit '{ $name }': altitude_km peab olema vahemikus (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satelliit '{ $name }': inclination_deg peab olema vahemikus [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satelliit '{ $name }': backlog_mbit peab olema >= 0

engine-e-contact-schedule-satellite-priority-must-be = satelliit '{ $name }': priority peab olema > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satelliit '{ $name }': eirp_dbw peab olema lõplik

engine-e-contact-schedule-station-lat-deg-in-90 = jaam '{ $name }': lat_deg vahemikus [-90, 90], lon_deg lõplik

engine-e-contact-schedule-station-mask-deg-must-be = jaam '{ $name }': mask_deg peab olema vahemikus [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = jaam '{ $name }': alt_m peab olema vahemikus [0, 3000] (ITU-R P.834 vahemik)

engine-e-contact-schedule-station-setup-and-over-db = jaam '{ $name }': setup_s >= 0 ja g_over_t_db lõplik

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours peab olema vahemikus (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s peab olema vahemikus (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = vaja on vähemalt ühte satelliiti ja ühte jaama

engine-e-contact-schedule-at-most-32-satellites-and = kuni 32 satelliiti ja 32 jaama

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: satelliite { $satellites } x jaamu { $stations } ajavahemikus { $duration_hours } h -> kandidaatkontakte { $cands }, planeeritud { $greedy }; edastatud { $total_del } / { $total_backlog } Mbit{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: läbilende { $pairs }; ACM { $acm } Mbit vs CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = vaja on vähemalt 2 katset ja lõplikku sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total peab olema vahemikus (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = kasutajal puudub lokaalne koordinaatsüsteem

engine-e-dop-error-ci-singular-geometry = { $name }: singulaarne geomeetria

engine-e-dop-error-ci-no-noise-free-fix = { $name }: müravaba asukohamäärangut pole

engine-e-dop-error-ci-no-fix = { $name }: asukohamäärangut pole

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singulaarne geomeetria

engine-e-dop-error-mc-no-fix = { $label }: asukohamäärangut pole

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km peab olema positiivne; saadi { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes ja sats_per_plane peavad mõlemad olema nullist erinevad

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz peab olema positiivne; saadi { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency peab olema vahemikus (0, 1]; saadi { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k peab olema positiivne; saadi { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db peab olema mittenegatiivne; saadi { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m peab olema Maast väljaspool; saadi { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] Maa GNSS Kuu kaugusel — { $n_satellites } satelliit, vastuvõtja kaugusel { $r } km{ "\u000A" }
       *[other] Maa GNSS Kuu kaugusel — { $n_satellites } satelliiti, vastuvõtja kaugusel { $r } km{ "\u000A" }
    }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Maa serv konstellatsioonist vaadatuna: { $earth_limb_half_angle_deg } deg nadiirist — iga Kuu poole suunatud kiir peab seda ületama{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }varjamata: { $n_geometrically_visible } / { $n_satellites }; jälgimisläve { $tracking_threshold_dbhz } dB-Hz ületab: { $n_trackable }{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }parim link { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }iga jälgitav nähtavusjoon jääb { $a } deg poolkoonuse sisse — geomeetria on peaaegu degenereerunud{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }PÜHKIMINE { $epochs } epohhi / { $span_s } s jooksul: signaali kättesaadavus { $signal_availability }, asukohamäärangu kättesaadavus { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }jälgitavaid linke keskmiselt { $mean_trackable }, maks { $max_trackable }; parim C/N0 { $w }; parim PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = nõutav on üks kuni kuus astet

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg peab olema lõplik ja mittenegatiivne

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 peab olema lõplik ja mittenegatiivne

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg peab olema lõplik ja mittenegatiivne

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m peab olema lõplik ja mittenegatiivne

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg peab olema vahemikus [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s peab olema lõplik ja mittenegatiivne

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = stardi tõukejõu ja kaalu suhe { $tw } peab ületama 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ideaalne dv { $ideal_dv_m_s } m/s, kaod { $losses } m/s (gravitatsioon { $gravity_loss_m_s }, takistus { $drag_loss_m_s }, juhtimine { $steering_loss_m_s }, vastusurve { $back_pressure_loss_m_s }); põlemise lõpp { $r } km kiirusel { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } peab olema lõplik ja positiivne

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = keha peab olema "earth" või "mars", saadi "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = atmosfäär "{ $a }" ei ole keha "{ $b }" jaoks saadaval (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg peab olema vahemikus (0, 90) (positiivne allapoole)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m peab olema vahemikus [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg peab olema lõplik, |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg ja longitude_deg peavad olema lõplikud

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag peab olema vahemikus [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg peab olema lõplik

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s peab olema vahemikus (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m peab olema vahemikus [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s peab olema vahemikus (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame peab olema inertial|relative, saadi "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> tipp { $pk_g } g kõrgusel { $r } km, tipp q { $r2 } W/cm² kõrgusel { $r3 } km, soojuskoormus { $r4 } J/cm², tipp q_dyn { $r5 } kPa; { $outcome } ajahetkel { $end_time_s } s (suletud kuju { $cf_g } g; MODELLED 3-DoF, ilma kiirgus-/TPS-ita)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } peab olema vahemikus (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } peab olema lõplik ja mittenegatiivne

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg peab olema vahemikus [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits peab olema vahemikus 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (kaevu täitumus { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = nadiirinurk { $eta_rad }° ületab Maa nurkraadiuse { $rho }° (möödub Maast)

engine-e-eo-payload-no-sun-synchronous-inclination-at = päikesesünkroonset kaldenurka kõrgusel { $v1 } km pole

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg peab olema vahemikus (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad peab olema lõplik ja positiivne

engine-e-eo-payload-half-fov-too-large = half_fov on liiga suur: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> { $v3 } km lai riba (swath), { $gsd } m nadiiri GSD, ligipääs kuni { $v5 } km nadiirist kõrvale; sõlmevahe { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Maa–Kuu barütsenter tabelist { $table }, jagatud Montenbrucki ja Gilli Kuu-rea järgi, presesseeritud epohhile J2000

engine-ephem-provider-jpl-mean-elements-in-the = JPL keskmised elemendid Laplace'i tasandis, keskmise pikkuse muutumiskiirus IAU sünkroonse pöörlemiskiiruse järgi, liidetud oma planeedile tabelist { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = IAU sünkroonse pöörlemise suund JPL keskmisel kaugusel, liidetud Saturnile tabelist { $table }

engine-e-ephem-provider-read = lugemine { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = TLE-l puudub rida 1 (rida, mis algab `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE-l puudub rida 2 (rida, mis algab `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = analüütiline `orbit` efemeriid nõuab `epoch`-i

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = efemeriidi stsenaarium vajab kas `tle` või `orbit`

engine-e-ephemeris-step-must-be-positive = step_s peab olema positiivne

engine-e-ephemeris-duration-must-be-non-negative = duration_s peab olema mittenegatiivne

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz peab olema positiivne lõplik sagedus

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] { $source } maapealne jälg · { $n_samples } valim · kõrgus { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
       *[other] { $source } maapealne jälg · { $n_samples } valimit · kõrgus { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
    }

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` ei ole lõplik

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` ei ole sekundid ega ISO-8601 UTC aeg

engine-e-evidence-assemble-no-epoch-of-the-log = ükski logi epohh ei jää vahemikku { $t0 } s kuni { $t1 } s (logi katab vahemiku 0 kuni { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config ei ole objekt

engine-e-evidence-assemble-config-json-already-has-an = config.json sisaldab juba kirjet `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = alates { $from_s } kuni { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` ei ole UTC aeg kujul 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } logis suurusega { $log_bytes } baiti

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } vajab väärtust

engine-e-evidence-cli-cannot-create = { $path } loomine ebaõnnestus: { $e }

engine-e-evidence-cli-cannot-write = { $path } kirjutamine ebaõnnestus: { $e }

engine-evidence-cli-warning-is-readable-by-other = hoiatus: { $path } on teistele kasutajatele loetav; piira juurdepääsu (chmod 600)

engine-e-evidence-cli-cannot-read-key = võtme { $path } lugemine ebaõnnestus: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } ei ole heksadetsimaalne võti

engine-e-evidence-cli-must-hold-32-byte-key = { $path } peab sisaldama 32-baidist võtit 64 heksanumbrina

engine-e-evidence-cli-cannot-read = { $dir } lugemine ebaõnnestus: { $e }

engine-e-evidence-cli-cannot-read-2 = { $name } lugemine ebaõnnestus: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } on olemas ja ei ole tühi

engine-e-evidence-cli-cannot-create-2 = { $dir } loomine ebaõnnestus: { $e }

engine-evidence-cli-warning-is-owner-only-mode = hoiatus: { $arg } on ainult omanikule (režiim 600) ja nimi ei ole *.pub: see võib olla privaatvõti. Anna avaliku võtme fail.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` ei ole 64 heksanumbrit ega loetav fail ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` ei sisalda heksanumbreid

engine-evidence-cli-private-key-keep-it-secret = privaatvõti: { $out }  (hoia salajas; ära kunagi versioonihaldusse lisa)

engine-evidence-cli-public-key-pub = avalik võti:  { $out }.pub

engine-evidence-cli-public-key-hex = avalik võti (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Anna kontrollijatele avalik võti nende usaldatud kanali kaudu; nad fikseerivad selle valikuga --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify vajab komplekti kataloogi

engine-e-evidence-cli-cannot-read-3 = { $p } lugemine ebaõnnestus: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: PEM-sertifikaati ei leitud

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }ajatempliasutuse allkirja Kshana ei kontrolli

engine-evidence-cli-this-is-technical-record-not = See on tehniline kirje, mitte juriidiline arvamus.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp vajab komplekti kataloogi

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp vajab tokenifaili

engine-e-evidence-cli-cannot-read-4 = { $tok } lugemine ebaõnnestus: { $e }

engine-e-evidence-cli-cannot-write-2 = { $target } kirjutamine ebaõnnestus: { $e }

engine-evidence-cli-note-the-token-sits-beside = märkus: token asub allkirjastatud manifesti kõrval, mitte selle sees; kontrolli valikuga --require-timestamp, et seda nõuda.

engine-e-evidence-cli-round-trip-packs-are-not = edasi-tagasi pakette ei ehitata WebAssembly jaoks

engine-e-evidence-cli-needs-scenario-path = vajab stsenaariumi teed

engine-e-evidence-cli-needs-from = vajab valikut --from

engine-e-evidence-cli-needs-to = vajab valikut --to

engine-e-evidence-cli-cannot-read-lab-attestation = labori atesteeringu { $p } lugemine ebaõnnestus: { $e }

engine-e-evidence-cli-cannot-read-5 = { $scn_path } lugemine ebaõnnestus: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = vigane receiver-trust stsenaarium: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation kehtib käsule `receiver-trust evidence`, mitte käsule `evidence round-trip` (mille pakett salvestab katsetingimused)

engine-e-evidence-cli-cannot-read-6 = { $sp } lugemine ebaõnnestus: { $e }

engine-e-evidence-cli-cannot-read-7 = { $cp } lugemine ebaõnnestus: { $e }

engine-evidence-cli-evidence-pack-written-to = tõendipakett kirjutatud kataloogi { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epohhe aknas: { $epochs_in_window }  ({ $from_s } s kuni { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }allkirjastaja sõrmejälg: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }manifest.json-i SHA-256 (mida RFC 3161 asutus peaks tempeldama): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }logi lõik: baidid { $a } kuni { $b } / { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }logi lõik: kogu logi (see logi ei anna aknale baidivahemikku)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }labori atesteering on salvestatud allkirjastatud manifesti ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Pakett on tehniline kirje, mitte juriidiline arvamus.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s kuni { $to_s } s pärast logi esimest epohhi

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = vigane lab-attestation TOML: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` peab olema tabel

engine-e-evidence-lab-invalid-lab-attestation = vigane lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } on nõutav

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } ületab { $MAX_FIELD } baiti

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: kuupäev { $date } ei ole päev kujul 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: varjestatud seadistus vajab korpust (enclosure)

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup peab olema "conducted" või "shielded" (saadi { $other }); õhukaudne seadistus ei ole labori käivitusena aktsepteeritav

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db peab olema lõplik

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = katsetingimused esitavad sündmusi: { $events }, kuid hindamisstsenaariumis on neid { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = sündmus '{ $id }' katsetingimustes ({ $onset_s } s kuni { $offset_s } s) ei vasta sündmusele '{ $label }' hindamisstsenaariumis ({ $onset_s2 } s kuni { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = logi SHA-256 ({ $have }) ei ole see, mille katsetingimused esitavad ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = kärbitud DER

engine-e-evidence-tsa-bad-der-length = vigane DER-i pikkus

engine-e-evidence-tsa-unexpected-der-tag = { $what }: ootamatu DER-i silt { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = tühi AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = vigane UTCTime

engine-e-evidence-tsa-bad-generalizedtime = vigane GeneralizedTime

engine-e-evidence-tsa-bad-time = vigane aeg

engine-e-evidence-tsa-time-not-in-utc = aeg ei ole UTC-s

engine-e-evidence-tsa-bad-time-digits = vigased ajanumbrid

engine-e-evidence-tsa-bad-bit-string = vigane BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: oodatud on kolm elementi

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: liiga lühike

engine-e-evidence-tsa-empty-extension = tühi Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: väärtus ei ole OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: tühi

engine-e-evidence-tsa-validity-short = Validity: lühike

engine-e-evidence-tsa-pem-end-without-begin = PEM: END ilma BEGIN-ita

engine-e-evidence-tsa-pem-bad-base64 = PEM: vigane base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: vigane base64 pikkus

engine-e-evidence-tsa-spki-empty = SPKI: tühi

engine-e-evidence-tsa-spki-no-oid = SPKI: OID puudub

engine-e-evidence-tsa-spki-no-key = SPKI: võti puudub

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: oodatud on kaks täisarvu

engine-e-evidence-tsa-unsupported-elliptic-curve = toetamata elliptkõver

engine-e-evidence-tsa-unsupported-public-key-algorithm = toetamata avaliku võtme algoritm

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA võti või allkiri liiga suur

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA moodul ei ole paaritu

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA allkiri väljaspool vahemikku

engine-e-evidence-tsa-rsa-key-too-small = RSA võti liiga väike

engine-e-evidence-tsa-invalid-padding = vigane täide

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: kodeeritud sõnum liiga pikk

engine-e-evidence-tsa-last-octet-invalid = viimane oktett vigane

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: vasakpoolseimad bitid ei ole nullid

engine-e-evidence-tsa-pss-bad-padding = PSS: vigane täide

engine-e-evidence-tsa-pss-signature-mismatch = PSS: allkiri ei vasta

engine-e-evidence-tsa-unsupported-mask-generation-function = toetamata maski genereerimisfunktsioon

engine-e-evidence-tsa-mgf1-without-hash = MGF1 ilma räsita

engine-e-evidence-tsa-bad-pss-salt-length = vigane PSS-i soola pikkus

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = ECDSA allkiri vajab EC võtit

engine-e-evidence-tsa-an-rsa-signature-needs-an = RSA allkiri vajab RSA võtit

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption ilma räsialgoritmita

engine-e-evidence-tsa-an-rsa-pss-signature-needs = RSA-PSS allkiri vajab RSA võtit

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey ilma räsialgoritmita

engine-e-evidence-tsa-unsupported-signature-algorithm = toetamata allkirjaalgoritm

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: tühi

engine-e-evidence-tsa-time-stamp-request-not-granted = ajatemplipäringut ei rahuldatud

engine-e-evidence-tsa-no-time-stamp-token-in = vastuses puudub ajatempli token

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = ei ole TimeStampResp ega TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = ei ole CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: sisu puudub

engine-e-evidence-tsa-signeddata-short = SignedData: lühike

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: tühi

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = kapseldatud sisu ei ole TSTInfo

engine-e-evidence-tsa-no-tstinfo = TSTInfo puudub

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo ei ole OCTET STRING-us

engine-e-evidence-tsa-tstinfo-short = TSTInfo: lühike

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: genTime puudub

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: signerInfos puudub

engine-e-evidence-tsa-exactly-one-signerinfo-expected = oodatud on täpselt üks SignerInfo

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: sid puudub

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: räsialgoritm puudub

engine-e-evidence-tsa-signerinfo-short = SignerInfo: lühike

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: allkirjastatud atribuudid puuduvad

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: allkirjaalgoritm puudub

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: allkiri puudub

engine-e-evidence-tsa-no-serial = seerianumber puudub

engine-e-evidence-tsa-signer-certificate-not-found = allkirjastaja sertifikaati ei leitud

engine-e-evidence-tsa-attribute-empty = Attribute: tühi

engine-e-evidence-tsa-attribute-no-values = Attribute: väärtused puuduvad

engine-e-evidence-tsa-attribute-no-value = Attribute: väärtus puudub

engine-e-evidence-tsa-content-type-attribute-mismatch = content-type atribuut ei vasta

engine-e-evidence-tsa-digest-failure = räsi viga

engine-e-evidence-tsa-signature-not-an-octet-string = allkiri ei ole OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = ess signing certificate atribuut puudub

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: tühi

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id-d ei leitud

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: räsi puudub

engine-e-evidence-tsa-unsuitable-certificate-purpose = sobimatu sertifikaadi eesmärk

engine-e-evidence-tsa-certificate-is-not-yet-valid = sertifikaat ei ole veel kehtiv

engine-e-evidence-tsa-certificate-has-expired = sertifikaat on aegunud

engine-e-evidence-tsa-invalid-ca-certificate = vigane CA sertifikaat

engine-e-evidence-tsa-certificate-chain-too-long = sertifikaadiahel liiga pikk

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: tühi

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: räsi puudub

engine-e-evidence-tsa-message-imprint-mismatch = message imprint ei vasta

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = määramata pikkusega BER-i ei toetata

engine-e-evidence-tsr-expected-tag-found = oodatud { $what } (silt { $tag }), leitud { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = vigane PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = ajatemplivastust ei rahuldatud

engine-e-evidence-tsr-not-timestamp-token = ei ole ajatempli token

engine-e-evidence-tsr-the-token-content-type-is = tokeni sisutüüp ei ole CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = token ei kanna TSTInfo-d

## src/evidence/tsr.rs

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = sõnumi jäljend kasutab toetamata räsialgoritmi

engine-e-evidence-tsr-the-imprint-is-bytes-not = jäljend on { $digest } baiti, mitte { $want_len } baiti, mida annab { $hash_alg }

engine-e-evidence-tsr-gentime-is-not-utc = genTime ei ole UTC

engine-e-evidence-tsr-malformed-gentime = vigane genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime ei ole tegelik kalendriaeg

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = ei ole väiketähtedes kuueteistkümnendkood

engine-e-evidence-verify-expected-bytes-found = oodati { $N } baiti, leiti { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = paketil on juba ajatempli token; asendamiseks anna --replace

engine-e-evidence-verify-not-attached-the-pack-with = ei lisatud: selle tokeniga pakett ei läbi kontrolli ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = pakett registreerib labori kinnituse: { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = allkirjafail ei lõpe reavahetusega

engine-evidence-verify-signer-not-pinned-the-signature = allkirjastaja ei ole kinnitatud: allkiri tõendab, et pakett on terve võtme { $r } suhtes, mille nimetab pakett ise. Võrdle seda sõrmejälge allkirjastajalt saadud sõrmejäljega või anna võti.

engine-evidence-verify-range-is-not-inside-log = vahemik { $start }..{ $end } ei asu { $full_bytes } baidi pikkuse logi sees

engine-evidence-verify-timestamp-token-states-its-imprint = ajatempli token osutab ajale { $gen_time }; selle jäljend { $v2 } manifest.json. Ajatempliautoriteedi allkirja Kshana ei kontrolli: kontrolli seda käsuga `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = ajatempli token osutab ajale { $gen_time }; selle jäljend { $v2 } manifest.json; ajatempliautoriteedi allkiri ja ahel { $v3 } antud ankrute suhtes.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` on tühi sõne

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } jääb sõnavarast välja

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = kuluvahemik peab olema lõplik, mittenegatiivne, järjestatud low≤nominal≤high ja sisaldama allikat

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction ja availability peavad olema murrud vahemikus [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } peab olema lõplik ja > 0, saadi { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } peab olema lõplik ja >= 0, saadi { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg peab olema vahemikus [-90, 90), saadi { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = satelliidikonstellatsioonis ei ole satelliite

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats peab olema >= 1, kui see on määratud

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = libisemise satelliit { $sat } on vahemikust väljas

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = rida { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = rida { $lineno }: veerge { $v }, oodati vähemalt { $min }

engine-e-fusion-kfgins-line-columns = rida { $v1 }: veerge { $v }

engine-e-fusion-kfgins-line-block-lists-are-not = rida { $lineno }: plokkloendeid ei toetata

engine-e-fusion-kfgins-line-expected-key-value = rida { $lineno }: oodati kuju `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = rida { $lineno }: taandega võti ilma vanemata

engine-e-fusion-kfgins-line-only-one-level-of = rida { $lineno }: lubatud on ainult üks pesastustase

engine-e-fusion-kfgins-line-unterminated-flow-list = rida { $lineno }: lõpetamata vooloend

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` on loend, oodati skalaari

engine-e-fusion-kfgins-missing = `{ $k }` puudub

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` peab olema kolmeelemendiline loend

engine-e-fusion-kfgins-no-imu-sample-at-or = IMU näidist ajal starttime või pärast seda ei ole

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU aeg ei kasva kohas { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } peab olema lõplik ja > 0, saadi { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m peab olema lõplik ja > 0, saadi { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg peab olema vahemikus [-90, 90), saadi { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = trajektoori csv rida { $v1 }: ei ole arvud: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = trajektoori csv rida { $v1 }: oodati 10 veergu, saadi { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = trajektoori csv rida { $v1 }: aeg ei kasva

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = trajektoori csv vajab vähemalt kahte rida

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = trajektoori csv katab { $rows } s, aga stsenaarium kestab { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: asukoha lat_deg peab olema vahemikus [-90, 90] ja iga väli lõplik

engine-e-geometry-sky-is-neither-gnss-preset = sky: „{ $name }“ ei ole ei GNSS-i eelseadistus ({ $e_gnss }) ega LEO eelseadistus ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: anna kasutaja kas `site` või `user_ecef_m` kaudu, mitte mõlemaga

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m peab olema lõplik ja mitte geotsenter

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satelliit { $id }: asimuut/tõusunurk on vahemikust väljas

engine-e-geometry-sky-satellite-is-given-in = sky: satelliit { $id } on antud ECEF-is; päring vajab `site` või `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satelliit { $id }: ECEF-asukoht ei ole lõplik

engine-e-geometry-sky-satellite-coincides-with-the = sky: satelliit { $id } langeb kokku kasutajaga

engine-e-geometry-sky-satellite-give-az-deg = sky: satelliit { $id }: anna az_deg ja el_deg või ecef_m ja mitte midagi muud

engine-e-geometry-sky-tle-is-bytes-the = sky: tle on { $text } baiti; ülempiir on { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = elemendikomplekt tagasi lükatud: { $e }

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] sky: tle ei sisalda täielikku kaherealist elemendikomplekti; { $n_ignored } rida ignoreeriti, esimene: { $first }
       *[other] sky: tle ei sisalda täielikku kaherealist elemendikomplekti; { $n_ignored } rida ignoreeriti, esimene: { $first }
    }

engine-e-geometry-sky-epoch = sky: epohh: { $e }

engine-geometry-and-more = { "." }.. ja veel { $more }

engine-geometry-element-sets-propagated-by-the =
    { $n ->
        [one] { $n } elemendikomplekt levitati mootori SGP4-ga (WGS-72) ajahetkeni { $iso } ja pöörati Maaga seotud süsteemi, võttes UT1 võrdseks UTC-ga ja ilma poolusliikumiseta: need elemendikomplektid annavad sel epohhil sellise taeva, mitte selle mõõtmise.
       *[other] { $n } elemendikomplekti levitati mootori SGP4-ga (WGS-72) ajahetkeni { $iso } ja pöörati Maaga seotud süsteemi, võttes UT1 võrdseks UTC-ga ja ilma poolusliikumiseta: need elemendikomplektid annavad sel epohhil sellise taeva, mitte selle mõõtmise.
    }

engine-geometry-element-sets-propagated-by-the-2 =
    { $n ->
        [one] { $n } elemendikomplekt levitati mootori SGP4-ga (WGS-72) uusima elemendikomplekti epohhini pluss time_s ({ $iso }). Epohhi ei antud, seega on see esindav taevas, mitte nimetatud kuupäeva taevas.
       *[other] { $n } elemendikomplekti levitati mootori SGP4-ga (WGS-72) uusima elemendikomplekti epohhini pluss time_s ({ $iso }). Epohhi ei antud, seega on see esindav taevas, mitte nimetatud kuupäeva taevas.
    }

engine-e-geometry-sky-give-systems-or-tle = sky: anna `systems` või `tle` (koos `site`-ga) või `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system nimetab `tle` satelliidid; päringus ei ole `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg peab olema vahemikus [-90, 90), saadi { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` vajab `site` (või `user_ecef_m`), kust vaadata

engine-e-geometry-sky-time-must-be-finite = sky: time_s peab olema lõplik

engine-e-geometry-sky-system-asks-for-satellites = sky: süsteem „{ $name }“ nõuab { $asked } satelliiti; päring mahutab kuni { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: rohkem kui { $MAX_SATELLITES } satelliiti

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` vajab `site` (või `user_ecef_m`), kust vaadata

engine-e-geometry-sky-more-than-satellites-above = sky: rohkem kui { $MAX_SATELLITES } satelliiti horisondi kohal

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m peab olema positiivne, saadi { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence peab olema vahemikus (0, 1), saadi { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: nähtavas on rohkem kui { $MAX_CLOCKS } süsteemi, igaühel oma kell; rühmita satelliidid vähemate `system` siltide alla või kasuta clock = "common"

engine-e-geometry-sky-must-be-in-got =
    { $n ->
        [one] sky: n peab olema vahemikus 1..={ $MAX_MC_SAMPLES }, saadi { $n }
       *[other] sky: n peab olema vahemikus 1..={ $MAX_MC_SAMPLES }, saadi { $n }
    }

engine-e-geometry-sky-too-few-satellites-in = sky: nähtavas on positsiooni leidmiseks liiga vähe satelliite; Monte Carlo pilve ei ole

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = TLE taevas ajal { $e }, mitte mõõtmine

engine-e-geometry-invalid-sky-request-json = vigane sky päring (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = vigane sky päring (TOML): { $e }

engine-e-geometry-invalid-skyline-json = vigane horisondijoon (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = vigane horisondijoon (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = vigane GLONASS PRN kohas { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = lehetüüpi { $pt } ei kodeerita siin

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bitti, oodati { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bitti, oodati { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = lõpubitid ei ole null

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q ei klapi

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = lehetüüpi { $pt } ei dekodeerita siin

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } sümbolit, oodati { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = sünkroniseerimismustrit ei leitud

engine-e-gnss-navmsg-gal-fnav-page-type-missing = lehetüüp { $t } puudub

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = lehetüübi { $t } IOD_nav erineb lehetüübi 1 omast

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = Galileo välja { $name } ei ole

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = sõnatüüpi { $wt } ei kodeerita siin

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bitti, oodati { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = sõnatüüpi { $wt } ei dekodeerita siin

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = lehe osad peavad olema 120 bitti

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = paaris/paaritu lipud ei ole 0 ja siis 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = ei ole nominaalne leht (lehetüüp 1 on häirelehekülg)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bitti, oodati { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } sümbolit, oodati { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = sõnatüüp { $t } puudub

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = sõnatüübi { $t } IOD_nav erineb sõnatüübi 1 omast

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = kirje on süsteemi { $system }, mitte Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = tüübil 10 ei ole välja { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = tüübil 11 ei ole välja { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = tüübil 30 ei ole välja { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV keha on { $body } bitti, oodati 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out =
    { $tow_count ->
        [one] PRN { $prn } või TOW-loendur { $tow_count } on vahemikust väljas
       *[other] PRN { $prn } või TOW-loendur { $tow_count } on vahemikust väljas
    }

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bitti, oodati { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = preambul ei ole 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = sõnumitüüpi { $t } ei dekodeerita siin

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = vaja on tüübi 10 ja tüübi 11 sõnumit

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } LSB-l { $value2 } ei mahu { $bits } { $v4 } bitti

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bitti, paigutus vajab { $need }

engine-e-gnss-navmsg-no-field = välja { $name } ei ole

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } skaalal 2^{ $scale_pow2 } ei mahu { $bits } { $v1 } bitti

engine-e-gps-lnav-no-value-for = väärtust { $name } jaoks ei ole

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: etalonmudel „gfc“ vajab `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: gfc_path { $path } ei saa lugeda: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: tundmatu etalonmudel `{ $other }` (kasuta „egm2008“ või „gfc“)

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: tundmatu ellipsoid `{ $other }` (kasuta „wgs84“ või „grs80“)

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations peab olema vähemalt 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations ülempiir on 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = vigane reaalarv '{ $t }'

engine-e-gravity-pds-bad-integer = vigane täisarv '{ $t }'

engine-e-gravity-pds-empty-shadr-table = tühi SHADR tabel

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR päisel on { $f } välja, oodati vähemalt 6

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR päis: negatiivne aste/järk või tundmatu normeerimine

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR normeerimisolek { $normalization } (toetatud on ainult täielikult normeeritud, olek 1)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR etalonpikkus/-laius peab olema 0

engine-e-gravity-pds-non-physical-gm-must-be = mittefüüsikaline GM (peab olema lõplik ja positiivne)

engine-e-gravity-pds-non-physical-reference-radius-must = mittefüüsikaline etalonraadius (peab olema lõplik ja positiivne)

engine-e-gravity-pds-shadr-record-fields = SHADR kirje { $v1 }: { $f } välja

engine-e-gravity-pds-shadr-record-bad =
    { $n ->
        [one] SHADR kirje { $v1 }: vigane (n, m) = ({ $n }, { $m })
       *[other] SHADR kirje { $v1 }: vigane (n, m) = ({ $n }, { $m })
    }

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR kirje { $v1 }: mittelõplik koefitsient

engine-e-gravity-pds-no-shadr-coefficient-records = SHADR koefitsiendikirjeid ei ole

engine-e-gravity-pds-shadr-table-incomplete-missing =
    { $n ->
        [one] SHADR tabel on mittetäielik: puudub (n, m) = ({ $n }, { $m })
       *[other] SHADR tabel on mittetäielik: puudub (n, m) = ({ $n }, { $m })
    }

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant puudub

engine-e-gravity-sh-missing-radius = radius puudub

engine-e-gravity-sh-non-physical-earth-gravity-constant = mittefüüsikaline earth_gravity_constant (peab olema lõplik ja positiivne)

engine-e-gravity-sh-non-physical-radius-must-be = mittefüüsikaline radius (peab olema lõplik ja positiivne)

engine-e-gravity-sh-no-gfc-coefficient-lines = gfc koefitsiendiridu ei ole

engine-e-gravity-sh-read-error = lugemisviga: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = rida { $lineno }: norm { $v } ei ole toetatud (ainult fully_normalized)

engine-gravity-sh-line-bad = rida { $lineno }: vigane { $what }

engine-e-gravity-sh-line-degree-above-the-declared =
    { $n ->
        [one] rida { $lineno }: aste { $n } ületab deklareeritud max_degree { $dm }
       *[other] rida { $lineno }: aste { $n } ületab deklareeritud max_degree { $dm }
    }

engine-e-gravity-sh-line-order-above-degree =
    { $n ->
        [one] rida { $lineno }: järk { $m } ületab astet { $n }
       *[other] rida { $lineno }: järk { $m } ületab astet { $n }
    }

engine-e-gravity-sh-line-time-variable-term-is = rida { $lineno }: ajast sõltuv liige `{ $key }` ei ole toetatud (ainult staatilised mudelid)

engine-e-gravity-sh-missing-end-of-head = end_of_head puudub

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s peab olema positiivne, saadi { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s peab olema positiivne, saadi { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] stsenaarium annab { $n } epohhi (vaja ≥ 2); suurenda duration_s või vähenda step_s
       *[other] stsenaarium annab { $n } epohhi (vaja ≥ 2); suurenda duration_s või vähenda step_s
    }

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = kirje sisaldab mittelõplikku ajaviga

engine-e-holdover-test-unknown-mask-expected-one-of = tundmatu mask { $id }; oodati üht väärtustest { $masks }

engine-e-holdover-test-every-budget-max-abs-te = iga eelarve max_abs_te_ns peab olema lõplik ja positiivne

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } jääb kirjest välja ({ $t0_s } kuni { $t_end } s selle enda ajateljel)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } peab olema hilisem kui gnss_removed_s ({ $gnss_removed_s }) ega tohi ületada kirje lõppu ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = holdover-etapp ei sisalda ühtegi näidist

engine-holdover-test-the-record-has-no-step = kirjes ei ole etappi { $step }: GNSS eemaldati esimesel näidisel

engine-holdover-test-the-step-has-samples-the = etapil { $step } on { $te_ns } näidist; hinnangud vajavad vähemalt 13

engine-e-holdover-test-step-with-mask-has-no = maskiga etapil ei ole kõverat

engine-e-holdover-test-cannot-read-csv-path = csv_path { $path } ei saa lugeda: { $e }

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks } (MODELLED, mõõdetud maski suhtes)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m peab olema lõplik ja > 0, saadi { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba peab olema >= 0 ja coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: kaks haru ei ole ühisel keskmistamisajal. Optiline haru akumuleerib ajavahemikul integration_s = { $integration_s } s; RF-haru ahela mürajoone laius B_L = { $dll_bandwidth_hz } Hz keskmistab ajal 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Kahe sigma suhe, mis on võetud eri keskmistamisaegadel, ei ole võrdlus, seega seda ei esitata. Eemalda rf_dll_bandwidth_hz alistus (siis on vaikeväärtus 1/(2*integration_s)) või sea see väärtusele { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: haru ei ole kasutatav positiivne lõplik sigma (optiline { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), seega suhet ei moodustata.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = tundmatu rf_band '{ $other }' (oodati s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } peab olema lõplik

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db peab olema lõplik ja >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | optilise jalajälje { $footprint_m } m, { $detected_photons } footonit -> kauguse σ { $c } mm, aja σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | kättesaadavus { $c4 }% ({ $n_sites } asukoht) | üleandmine ilma hüppeta { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | ühine FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology
       *[other] hybrid-optical-rf | optilise jalajälje { $footprint_m } m, { $detected_photons } footonit -> kauguse σ { $c } mm, aja σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | kättesaadavus { $c4 }% ({ $n_sites } asukohta) | üleandmine ilma hüppeta { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | ühine FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology
    }

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa peab olema vahemikus [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class peab olema >= 1

engine-impairment-eval-impairment-eval-detector-auc-in =
    { $n_cases ->
        [one] impairment-eval | detektor { $detector } | AUC { $auc_in } sees / { $auc_out } väljas (vahe { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ siht { $target_pfa } | { $n_cases } juhtum | MODELLED synthetic
       *[other] impairment-eval | detektor { $detector } | AUC { $auc_in } sees / { $auc_out } väljas (vahe { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ siht { $target_pfa } | { $n_cases } juhtumit | MODELLED synthetic
    }

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = tundmatu detektor '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = tundmatu imu_grade { $other }; oodati üht väärtustest navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = tundmatu combination { $other }; oodati üht väärtustest rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = tundmatu trn_fix_mode { $other }; oodati üht väärtustest none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } peab olema lõplik ja mittenegatiivne (saadi { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m peab nimetama vähemalt ühe läve

engine-e-inertial-coast-crossing-thresholds-entries-must-be = crossing_thresholds_m kirjed peavad olema lõplikud ja positiivsed (saadi { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades peab nimetama vähemalt ühe IMU klassi

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s peab olema lõplik ja mittenegatiivne (saadi { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 peab olema lõplik ja mittenegatiivne (saadi { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg peab olema lõplik ja vahemikus (-89, 89) (saadi { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m peab olema vahemikus [-1000, 100000] (saadi { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s peab olema positiivne

engine-e-inertial-coast-drift-band-must-satisfy-lo = triivivahemik peab rahuldama 0 < lo < hi (saadi lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = ins-trn-coast tulemuse serialiseerimine: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU, { $speed } m/s, combination { $comb } | { $heads } | TRN { $mode } tipp { $peak_error_m } m ajavahemikul { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va tuletatud külma aatomi interferomeetria füüsikast)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = stsenaarium on { $toml_text } baiti, üle { $max_bytes }-baidise piiri

engine-e-inline-only-the-scenario-kind-reads-its = stsenaariumi liik `{ $kind }` loeb oma andmed hostil olevatest failidest, seega see pind seda ei käivita; kasuta käsurida `kshana`

engine-e-inline-only-the-field-names-file-this = väli `{ $k }` nimetab faili: see pind aktsepteerib ainult sisemist sisu

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = jälje JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = tundmatu andmekogum `{ $key }`; kinnitatud: { $v1 }, või kohandatud andmekogum

engine-e-interference-map-api-dataset-is-data-but-the = andmekogum `{ $key }` on { $kind } andmed, aga sisendi liik on { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } ei ole kuupäev kujul YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = tundmatu valik `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = oodati { $positionals } positsioonilist argumenti, saadi { $pos }

engine-e-interference-map-cli-cannot-read = { $path } ei saa lugeda: { $e }

engine-e-interference-map-cli-dataset-custom-needs =
    { $n ->
        [one] --dataset custom vajab { $n }
       *[other] --dataset custom vajab { $n }
    }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } on juba olemas; Kshana ei kirjuta kaarte üle. Eemalda see või vali teine --out kataloog

engine-interference-map-cli-note-cell-deg-is-not = märkus: --cell-deg { $cell_deg } ei ole eelregistreeritud lahtri suurus ({ $PREREGISTERED_CELL_DEG }); kaardid ütlevad seda ise

engine-e-interference-map-cli-cannot-create = { $out } ei saa luua: { $e }

engine-interference-map-cli-wrote-cells-published-flagged =
    { $n_deg ->
        [one] kirjutati { $path }: { $cells } lahtrit avaldatud, { $n_deg } märgitud
       *[other] kirjutati { $path }: { $cells } lahtrit avaldatud, { $n_deg } märgitud
    }

engine-interference-map-cli-no-usable-rows-nothing-written = kasutatavaid ridu ei ole: midagi ei kirjutatud

engine-e-interference-map-cli-unknown-subcommand = tundmatu alamkäsk `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = allalaaditud faili SHA-256 ({ $got }) ei vasta kinnitatud väärtusele ({ $expected }); see visati ära

engine-e-interference-map-cli-cannot-write = { $dest } ei saa kirjutada: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl-i ei leitud PATH-ist. Paigalda curl või laadi { $NATURAL_EARTH_LAND_URL } ise alla ja kontrolli, et selle SHA-256 on { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = curl-i ei saa käivitada: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = kirjutati { $out }: Natural Earth maapolügoonid, SHA-256 kontrollitud (avalik omand, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = trace_full_* faile kataloogis { $path } ei ole

engine-e-interference-map-cli-cannot-read-2 = { $spec } ei saa lugeda: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd =
    { $n ->
        [one] { $n } ei ole kuupäev kujul YYYY-MM-DD
       *[other] { $n } ei ole kuupäev kujul YYYY-MM-DD
    }

engine-e-interference-map-cli-bad-map-date = { $f }: vigane kaardi kuupäev

engine-e-interference-map-cli-cannot-write-2 = { $out } ei saa kirjutada: { $e }

engine-interference-map-cli-route-length-km = marsruudi pikkus { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Hoiatused: halvenenud lahter ei tuvasta häiret põhjusena; vaatlemata lahtrid ei ole tõend selgest marsruudist; see ei ole prognoos.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = maapolügoonid: vigane JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = nõutav veerg `{ $name }` puudub

engine-e-interference-map-cannot-read-input = sisendit ei saa lugeda: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` ei ole kuupäev (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours peab olema { $MIN_DELAY_HOURS } või rohkem: observatoorium ei avalda varem

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg peab olema { $MIN_CELL_DEG } või jämedam: observatoorium avaldab ainult jämedaid lahtreid

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } ei ole veel avaldatav: selle toode vabastatakse mitte varem kui { $fmt_utc } ({ $delay_hours } h pärast päeva lõppu)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORY  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED

engine-interference-map-observatory-source-licence = SOURCE { $dataset }  LICENCE { $dataset2 }

## src/interference_map/observatory.rs

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (PUBLISHED CELLS)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana observatoorium, ADS-B navigatsioonitäpsuse kaart, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = { $path } ei saa luua (Kshana ei kirjuta tooteid üle): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = sisendis ei ole kasutatavat aruannet päeva { $day } kohta (leitud päevad: { $days })

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } on juba olemas; Kshana ei kirjuta tooteid üle

engine-interference-map-observatory-cells-published-degraded-incident = lahtreid avaldatud { $p }, halvenenud { $p2 }, intsidente { $p3 }

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } rida taasesitati { $variants } variandi all: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = kaart ei ole kehtiv JSON: { $e }

engine-e-interference-map-route-route-invalid-json = marsruut: vigane JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = marsruut: rida { $v1 } ei ole kujul `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 } eksport. Epohh: { $epoch_note }. Liikuvad objektid: GCRS (referenceFrame INERTIAL), meetrites, sekundites epohhi järel. Fikseeritud asukohad: Maaga seotud WGS 84 (referenceFrame FIXED), meetrites.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Asukoht: GCRS, meetrites.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Laiuskraad { $lat_deg } deg, pikkuskraad { $lon_deg } deg, kõrgus { $h_m } m WGS 84 ellipsoidi kohal. Asukoht: Maaga seotud, meetrites.

engine-interop-czml-radius-along-the-ground = { $description }. Raadius { $radius_m } m piki maapinda.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Ajata: WGS 84 pikkus- ja laiuskraad kraadides, kinnitatud maapinnale.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Maaga seotud asukohad; MultiLineString lõigatakse antimeridiaanil ja times_utc loetleb siis ainult algsed näidised.

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 } eksport. Epohh: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = vigane GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString ei sisalda koordinaatide massiivi

engine-e-interop-geojson-an-rfc-7946-linestring-needs = RFC 7946 LineString vajab kahte või enamat asukohta

engine-interop-geojson-position-is-not-an-array = asukoht { $i } ei ole kahe või kolme arvu massiiv

engine-interop-geojson-position-longitude-is-not-number = asukoht { $i }: pikkuskraad ei ole arv

engine-interop-geojson-position-latitude-is-not-number = asukoht { $i }: laiuskraad ei ole arv

engine-e-interop-geojson-position-longitude-is-outside-180 = asukoht { $i }: pikkuskraad { $lon } jääb vahemikust [-180, 180] välja (GeoJSON annab pikkuskraadi esimesena)

engine-e-interop-geojson-position-latitude-is-outside-90 = asukoht { $i }: laiuskraad { $lat } jääb vahemikust [-90, 90] välja (GeoJSON annab pikkuskraadi esimesena)

engine-e-interop-geojson-track-needs-two-or-more = rada vajab kahte või enamat teekonnapunkti

engine-e-interop-geojson-the-route-spans-more-than = marsruut hõlmab rohkem kui 180 kraadi pikkuskraadi; rajaliigid astuvad lihtsates kraadides ega saa antimeridiaani ületada

engine-e-interop-geojson-position-is-deg-from-an = asukoht { $worst } on { $worst2 } deg kaugusel ühtlase sammuga sirgest rajast (tolerants { $tol_deg } deg); rajaliigid lendavad start + i*step, seega anna ühtlase sammuga asukohad sirgel või ainult kaks otspunkti

engine-e-interop-geojson-route-applies-to-the-kinds = marsruut kehtib liikidele, mis lendavad teekonnapunktide rada (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` ei võta trajektoorisisendit

engine-e-interop-geojson-scenario-toml-is-not-table = stsenaariumi TOML ei ole tabel

engine-e-interop-geojson-cannot-serialise-scenario = stsenaariumi ei saa serialiseerida: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = tundmatu ekspordivorming '{ $other }'; oodati üht väärtustest czml, kml, geojson, stk, sigmf, all või list

engine-e-interop-member = liige { $label }: { $e }

engine-interop-the-scenario-could-not-be = stsenaariumi ei saanud eksportida: { $m }

engine-e-interop-invalid-spectrum-scenario = vigane spektristsenaarium: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } ajanäidis on rohkem, kui eksport kirjutab ({ $MAX_SAMPLES })
       *[other] { $n } ajanäidist on rohkem, kui eksport kirjutab ({ $MAX_SAMPLES })
    }

engine-e-interop-scene-objects-samples-is-more-than = { $items } objekti x { $times } näidist on rohkem, kui eksport kirjutab ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = vigane { $kind } stsenaarium: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type } segaja, { $power_dbw } dBW saatevõimsus, { $gain_dbi } dBi antennivõimendus

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, segamisliigi lingivõrrandite järgi, kus segaja on vastuvõtja horisondil ja vabaruumi sumbuvus

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (ahela [pass] etapp)

engine-interop-scene-circular-orbit-km-altitude-deg = ringorbiit, kõrgus { $altitude_km } km, kaldenurk { $inclination_deg } deg (SGP4 keskmised elemendid akna alguses, nagu passes-liik neid levitab)

engine-interop-scene-ground-station-deg-elevation-mask = maajaam, tõusunurga mask { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; GCRS ja Maaga seotud olekud on ephemeris-liigi enda väljund (UT1 ja poolusliikumine nii, nagu stsenaarium need määrab)

engine-interop-scene-static-scene-the-kind-flies = staatiline stseen: liik { $kind } lendab ajata teekonnapunktide rada

engine-interop-scene-true-track-flown-gps-denied = tegelik rada lennati GPS-i keelatuna: { $track } teekonnapunkti alates start_lat_deg/start_lon_deg sammuga step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` ei sisalda stseeni

engine-e-interop-scene-missing-numeric = arvuline `{ $k }` puudub

engine-e-interop-scene-missing-integer-waypoints = täisarvuline `waypoints` puudub

engine-e-interop-scene-waypoints-is-outside-1000000 =
    { $n ->
        [one] waypoints = { $n } jääb vahemikust 1..=1000000 välja
       *[other] waypoints = { $n } jääb vahemikust 1..=1000000 välja
    }

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } kõrgusel { $altitude_km } km, kaldenurk { $inclination_deg } deg (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = stsenaarium ei anna `epoch`; t = 0 on { $epoch }, varaseim epohh, mida satelliitide enda andmed kannavad (TLE, edastatud efemeriid või SP3 epohh). Iga satelliiti levitatakse tema enda epohhist ja need hõlmavad { $spread_h } h: ajamärgised järgivad mootori eeldust, et iga satelliit algab hetkel t = 0, samas kui iga asukoht pööratakse GCRS- ja Maaga seotud süsteemi selle satelliidi enda ajahetkel. SP3 ja OEM eksport märgivad t = 0 hoopis kui 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = stsenaarium ei anna `epoch`; t = 0 on { $epoch }, epohh, mida satelliitide enda andmed kannavad (TLE, edastatud efemeriid või SP3 epohh). SP3 ja OEM eksport märgivad t = 0 hoopis kui 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objekti x { $times_s } näidist on rohkem, kui eksport kirjutab ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = { $user_environment } kasutaja, liikuv (liigi konstantne kiirus ja suund)

engine-interop-scene-user-receiver = { $user_environment } kasutaja (vastuvõtja)

engine-interop-scene-user-orbit-km-altitude-deg = kasutaja orbiit, kõrgus { $altitude_km } km, kaldenurk { $inclination_deg } deg (Kepleri{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = liikuvat objekti { $index } ei ole

engine-interop-stk-kshana-export-object = # Kshana { $v1 } eksport: { $scene }, objekt { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type } segaja, { $power_dbw } dBW saatevõimsus, { $gain_dbi } dBi antennivõimendus (stsenaariumi lingieelarve parameeter, mitte signaal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` ei sisalda eksporditavat sõiduki trajektoori; test-bench eksport katab liigid gnss-ins, jamming ja gnss-sim

engine-e-interop-testbench-empty-motion-csv = tühi liikumise CSV

engine-e-interop-testbench-motion-csv-header-is-not = liikumise CSV päis ei ole oodatud veerud: { $head }

engine-e-interop-testbench-row-fields-expected = rida { $v1 }: { $f } välja, oodati { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = rida { $v1 }: veerg { $motion_columns } ei ole arv

engine-e-interop-testbench-line-no = rida { $v1 }: puudub `$`

engine-e-interop-testbench-line-no-checksum = rida { $v1 }: kontrollsumma puudub

engine-e-interop-testbench-line-bad-checksum-field = rida { $v1 }: vigane kontrollsumma väli

engine-e-interop-testbench-line-checksum-mismatch = rida { $v1 }: kontrollsumma ei klapi

engine-e-interop-testbench-line-short-gga = rida { $v1 }: lühike GGA

engine-interop-testbench-line-bad-latitude = rida { $v1 }: vigane laiuskraad

engine-interop-testbench-line-bad-longitude = rida { $v1 }: vigane pikkuskraad

engine-e-interop-testbench-line-bad-altitude = rida { $v1 }: vigane kõrgus

engine-e-interop-testbench-line-bad-separation = rida { $v1 }: vigane geoidi kõrgus

engine-e-interop-testbench-line-short-rmc = rida { $v1 }: lühike RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = rida { $v1 }: RMC ilma eelneva GGA-ta

engine-e-interop-testbench-line-gga-and-rmc-times = rida { $v1 }: GGA ja RMC ajad erinevad

engine-e-interop-testbench-line-bad-speed = rida { $v1 }: vigane kiirus

engine-e-interop-testbench-line-bad-course = rida { $v1 }: vigane kurss

engine-e-interop-testbench-line-bad-time-or-date = rida { $v1 }: vigane aeg või kuupäev

engine-e-interop-testbench-gga-with-no-following-rmc = GGA ilma järgneva RMC-ta

engine-e-interop-testbench-waypoint-file-needs-at-least = teekonnapunktide fail vajab vähemalt kahte näidist

engine-e-interop-testbench-the-sample-step-is-not = näidissamm { $step } s ei ole täisarv millisekundeid

engine-e-interop-testbench-the-samples-are-not-equally = näidised ei ole võrdse vahega: intervall { $v1 } on { $dt } s, esimene on { $step } s

engine-e-interop-testbench-empty-waypoint-file = tühi teekonnapunktide fail

engine-e-interop-testbench-waypoint-not-three-numbers = teekonnapunkt { $v1 }: ei ole kolm arvu

engine-e-interop-testbench-waypoint-fields-expected = teekonnapunkt { $v1 }: { $f } välja, oodati 3

engine-e-interop-testbench-events-csv-header-is-not = sündmuste CSV päis ei ole label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = sündmuse rida { $v1 }: oodati 5 välja

engine-e-interop-testbench-event-row-unknown-kind = sündmuse rida { $v1 }: tundmatu liik { $f }

engine-e-interop-testbench-event-row-bad-onset = sündmuse rida { $v1 }: vigane algus

engine-e-interop-testbench-event-row-bad-end = sündmuse rida { $v1 }: vigane lõpp

engine-interop-testbench-no-waypoints-txt-written = .waypoints.txt-d ei kirjutatud: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = ei ole UTC aeg kujul `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = puudub { $what }

engine-e-ionex-bad-number-in = { $what }: vigane arv veerus { $col }

engine-e-ionex-two-digit-year = { $what }: kahekohaline aasta { $year }

engine-e-ionex-no-end-of-header = END OF HEADER puudub

engine-e-ionex-height-dependent-ionex-maps-are = kõrgusest sõltuvaid (3-D) IONEX kaarte ei toetata

engine-e-ionex-zero-grid-step = nullist ruudustikusamm

engine-e-ionex-grid-needs-at-least-nodes = ruudustik vajab vähemalt 2 x 2 sõlme

engine-e-ionex-map-no = kaart { $index }: puudub { $end_label }

engine-e-ionex-map-band-latitude-header-grid = kaart { $index }: riba { $band } laiuskraad { $band_lat }, päise ruudustik { $want }

engine-e-ionex-map-band-longitudes-differ = kaart { $index }: riba { $band } pikkuskraadid erinevad

engine-e-ionex-map-band-truncated = kaart { $index }: riba { $band } on kärbitud

engine-e-ionex-map-bands-header-grid-has =
    { $n_lat ->
        [one] kaart { $index }: ribasid { $band }, päise ruudustikul on { $n_lat }
       *[other] kaart { $index }: ribasid { $band }, päise ruudustikul on { $n_lat }
    }

engine-e-ionex-map-no-epoch-of-current = kaart { $index }: EPOCH OF CURRENT MAP puudub

engine-e-ionex-tec-maps-header-of-maps =
    { $n_maps ->
        [one] TEC kaarte { $tec_maps }, päis # OF MAPS IN FILE { $n_maps }
       *[other] TEC kaarte { $tec_maps }, päis # OF MAPS IN FILE { $n_maps }
    }

engine-e-ionex-tec-map-epochs-not-increasing = TEC kaardi epohhid ei kasva

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz ei sisalda täisarvu näidiseid { $code } perioodi kohta ({ $spc } näidist)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods ja noncoherent peavad olema positiivsed

engine-e-iq-acq-stream-ended-after-of-samples = voog lõppes pärast { $got } näidist { $needed }-st

engine-e-iq-acq-cfar-reference-cells-must-be =
    { $n ->
        [one] CFAR etalonlahtrid peavad olema paarisarv ja vähemalt 2 (saadi { $n })
       *[other] CFAR etalonlahtrid peavad olema paarisarv ja vähemalt 2 (saadi { $n })
    }

engine-e-iq-acq-cfar-stride-must-be-at = CFAR samm peab olema vähemalt 1 nihe

engine-e-iq-acq-cfar-per-cell-pfa-must = CFAR lahtripõhine Pfa peab olema vahemikus (0, 1) (saadi { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = CFAR aken ulatub { $reach } nihet mõlemale poole, liiga lai { $samples_per_period }-nihkelise perioodi jaoks

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = tundmatu pinna vorming { $s }: oodati csv, json või bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = pind sisaldaks { $spc_cells } lahtrit (piir { $MAX_SURFACE_CELLS }): suurenda Doppleri sammu või kitsenda Doppleri vahemikku

engine-e-iq-acq-surface-surface-header = pinna päis: { $e }

engine-e-iq-acq-surface-surface-schema-expected = pinna skeem { $schema }; oodati { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = pinna keha: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = salvestus '{ $id }': format ja sample_rate_hz tuleb anda koos

engine-e-iq-campaign-conditions-test-conditions-json = katsetingimused (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = katsetingimused (TOML): { $e }

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf vajab SigMF-salvestust (saadi { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF metaandmed: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF metaandmed: global core:sample_rate puudub

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start puudub

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: core:sample_count puudub ja sündmuse lõpetamiseks ei ole võimsuspunkte

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema peab olema „{ $SCHEMA }“ (saadi „{ $schema }“)

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id ei tohi olla tühi

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s peab olema lõplik ja >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 peab olema 64 kuueteistkümnendnumbrit

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind peab olema „iq“ või „receiver-log“ (saadi „{ $k }“)

engine-e-iq-campaign-conditions-at-least-one-expected-group = vähemalt üks [[expected]] rühm on nõutav

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids ei tohi olla tühi

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } loetleb { $n } väärtuse; anna üks iga id kohta ({ $ids })
       *[other] { $at }: { $key } loetleb { $n } väärtust; anna üks iga id kohta ({ $ids })
    }

engine-e-iq-campaign-conditions-duplicate-id = { $at }: dubleeritud id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s peab olema hilisem kui onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects peab olema „all“ või id-de loend

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: affects id { $bad } ei ole väljal [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q peab olema positiivne

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points ei tohi olla tühi

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points peab olema ajalises järjekorras

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points peab olema lõplik

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" vajab reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = sündmused '{ $id }' ja '{ $id2 }' kattuvad ühisel satelliidil

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s peab olema >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s peab olema positiivne

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = salvestus '{ $id }': SHA-256 { $sha } ei vasta märgitud väärtusele { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to =
    { $n ->
        [one] { $code }: salvestus sisaldab { $buf } näidist, haaramiseks on vaja { $n }
       *[other] { $code }: salvestus sisaldab { $buf } näidist, haaramiseks on vaja { $n }
    }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s peab olema positiivne

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db peab olema positiivne

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s peab olema >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz peab olema positiivne

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs peab olema vähemalt 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = kampaania (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = kampaania (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions peab loetlema vähemalt ühe faili või glob-mustri

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds peab olema >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = frontend-nimed peavad olema mittetühjad ja unikaalsed ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' ei sobi ühegi failiga

engine-e-iq-campaign-spec-recording-id-appears-in-both = salvestuse id '{ $w }' esineb nii failis { $w2 } kui ka failis { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names vajab inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design =
    { $n ->
        [one] inputs.design_names: kujundust '{ $n }' ei ole failis { $path }
       *[other] inputs.design_names: kujundust '{ $n }' ei ole failis { $path }
    }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = tõe rida { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0 profiil: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0 profiil: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i }: astmeväärtused peavad olema lõplikud

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i }: ramp vajab end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i }: punktid vajavad võrdse pikkusega mittetühje t_s ja db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i }: t_s peab rangelt kasvama

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i }: punktid peavad olema lõplikud

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i }: hääbumise s4 peab olema vahemikus (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i }: hääbumise tau_s peab olema positiivne

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: salvestus sisaldab { $samples } näidist, selle otsingu jaoks on vaja { $need }

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: nimeta vorming valikuga --surface-format csv|json|bin või lõpeta tee laiendiga .csv, .json või .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = haaramine: { $fs_hz } Hz, koherentseid perioode { $coherent_periods } x mittekoherentseid { $noncoherent }, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = aruanne ehitati uuesti: lahtreid { $cells_present } / { $cells_total }, ridu { $rows }, läve ei täitnud { $rows_failed }; räsi { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    kampaania { $name }: lahtreid { $cells_total }; juba tehtud { $cells_skipped }, nüüd käivitati { $cells_run }, ebaõnnestus { $cells_failed }, ootel { $cells_pending }
    väljund: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    esimene ebaõnnestumine ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: sündmusi { $events }, oodatud satelliite { $tc }; tingimuste räsi { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono kaldtee { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono vertikaal { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-multipath-ground = mitmeteelevi { $h }m { $multipath_ground } maapind

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground peab olema dry, wet või sea (saadi { $other })

engine-e-iq-cli-channel-give-at-most-one-of = anna valikutest --iono-stec, --iono-vtec, --iono-klobuchar kõige rohkem üks

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass ootab kuju lo,hi (saadi { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass vajab lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } üleminekuga { $transition } Hz ei mahu alla fs/2 ({ $v1 } Hz); kitsenda riba või üleminekut

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits peab olema 1..=16 (saadi { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = filtreeriti { $total } näidist ({ $fs_hz } Hz) faili { $out } ({ $format }); kõrvalfail { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = { $path } ei saa lugeda: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = vigane labfit-stsenaarium: { $e }

engine-iq-cli-labfit-fitted-run-wrote = sobitati käivitusi { $runs }; kirjutati { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = sobitati üksusi { $fit_units } kampaaniast; kirjutati { $written }

engine-iq-cli-labfit-cannot-write = { $target } ei saa kirjutada: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } vajab väärtust

engine-e-iq-cli-cannot-parse = { $k }: { $v } ei saa parsida

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } võtab { $n } positsioonilise argumendi, saadi { $pos }
       *[other] iq { $cmd } võtab { $n } positsioonilist argumenti, saadi { $pos }
    }

engine-e-iq-cli-cannot-parse-2 = { $k }: { $p } ei saa parsida

engine-iq-cli-unknown-iq-processing-command-expected = tundmatu iq töötlemiskäsk { $other }; oodati scene, acquire, track, sweep, labfit, frontend, monitor, campaign või conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } on GPS-i jaoks vahemikust väljas

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = soovitud PRN-ide jaoks ei leitud terve GPS-i efemeriidi

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos ootab kuju lat,lon,alt (saadi { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; C/N0 profiil (segmente { $segments })

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format peab olema csv või jsonl (saadi { $other })

engine-iq-cli-scene-written-by-kshana-iq-scene = kirjutas kshana iq scene: SIMULEERITUD stseen, mitte salvestus

engine-iq-cli-scene-ion-sdr-metadata = ION SDR metaandmed { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF andmed { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = kirjutas kshana iq scene

engine-iq-cli-scene-wrote-samples-hz-to-truth = kirjutati { $samples } näidist ({ $format }, { $fs_hz } Hz) faili { $data_path }; { $truth_records } tõekirjet faili { $truth_path }; { $meta_note }; kanal: { $chan_desc }

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } ei saa kombineerida valikuga --design: sweep käivitab iga failis oleva kujunduse

engine-iq-cli-sweep-loop-design-sweep-design-prn = ahelakujunduse sweep: { $rows } (kujundus, PRN) tulemust{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: salvestus sisaldab { $samples } näidist, haaramiseks on vaja { $need }

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: ei haaratud (statistik { $statistic } < lävi { $threshold }); suurenda --doppler-max, --acq-coherent või --acq-noncoherent või kontrolli salvestust

engine-iq-cli-track-designs-and-differ-in-integration = kujundused { $first } ja { $d } erinevad väljas integration.extra_taps_chips; ühe käivituse kujundused peavad ühtima, et iga väljundkirje oleks samade veergudega

## src/iq/cli/track.rs

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: nimeta vorming valikuga --epochs-format csv|jsonl|bin või lõpeta tee laiendiga .csv, .jsonl või .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz on { $r } näidist kiibi kohta signaalil { $c }: ühismõõduline diskreetimine muudab koodidiskriminaatori trepiks (2 näidise/kiibi korral DLL võngub, umbes { $lit_0_09 } kiibi RMS koodiviga 45 dB-Hz juures); selle salvestuse koodiahela jitter ja nihe ei ole esinduslikud. Koodiahelate hindamiseks kasuta diskreetimissagedust, mis ei ole kiibisageduse poole kordne.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = tööprotsess lõpetas enne selle sisendi töötlemist

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = tundmatu valik { $s }

engine-e-iq-io-cli-format-needs-rate = --format vajab --rate

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } võtab { $n } teeargumendi, saadi { $pos }
       *[other] iq { $cmd } võtab { $n } teeargumenti, saadi { $pos }
    }

engine-iq-io-cli-unknown-iq-command = tundmatu iq käsk { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] kirjutati { $n } näidis ({ $to }, { $fs_hz } Hz) faili { $files }; küllastunud elemente { $w }{ $v4 }
       *[other] kirjutati { $n } näidist ({ $to }, { $fs_hz } Hz) faili { $files }; küllastunud elemente { $w }{ $v4 }
    }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow loeb ainult üherealisi salvestusi

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow loeb salvestust ühe jäädvustusega, selles on { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: positiivset core:sample_rate ei ole

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: jäädvustus ei alga baidipiiril

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = tundmatu näidisvorming { $name }: oodati nt ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, kompleksarvu korral valikuliselt lõpus _qi

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = kõrvalfaili sample_rate_hz { $sample_rate_hz } ei ole positiivne

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: .sdrx salvestused sisaldavad ühte voogu; kanalit { $channel } ei ole

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: toorfail ilma kõrvalfailita; nimeta selle vorming või kirjuta { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = rida ei saa serialiseerida: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = vigane filtri kujundus { $design }: passband_frac vahemikus (0, 1), summutus > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz peab jääma rangelt vahemikku 0 kuni pool diskreetimissagedust ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx andmed: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-bitine { $enc } { $fmt } ({ $packed_bits } bitti/näidis)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = toetamata SigMF core:datatype { $datatype }: toetatud on ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be ja reaalarvulised ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } ei ole SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = vigased SigMF metaandmed: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } ei ole SigMF core:datatype; kirjuta see toorfailina

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } ei vasta esimese salvestuse omale { $c0 }

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: core:sample_rate puudub

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } ei ole positiivne

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } sagedusel { $rate } Hz ei vasta esimese salvestuse omale { $f0 } sagedusel { $r0 } Hz

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name }: jäädvustus näidisel { $sample_start } on vales järjekorras või väljaspool andmetes olevat { $n_file } näidist
       *[other] { $name }: jäädvustus näidisel { $sample_start } on vales järjekorras või väljaspool andmetes olevat { $n_file } näidist
    }

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: esimene jäädvustus ei alga baidipiiril

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = nõutud kanal { $channel }; salvestuses on { $channels } (kanalid algavad numbrist 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = vigane SigMF kollektsioon: { $e }

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } ei vasta kollektsiooni väärtusele { $h }

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = voogu { $select } { $channels } läbisegi voost ei ole (vood algavad numbrist 0)

engine-e-iq-io-stream-sample-of-does-not-start = näidis { $k } vormingust { $format } ei alga baidipiiril

engine-e-iq-io-stream-time-window-start-duration-both = ajaaken algus { $start_s } s, kestus { $duration_s } s: mõlemad peavad olema mittenegatiivsed

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = kahjulikum märgitud Q (cw): tüübi `{ $event_type }` tabeliväärtust ei ole

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: kampaania ei ole lõpetatud

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } ei vasta lahtritele ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = salvestus `{ $id }`: katsetingimuste räsi { $h } ei vasta registreeritud väärtusele { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signaal `{ $signal }`: tundmatu kiibisagedus

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = ükski käivitus ei ole lukusobituseks kasutatav: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = andmeid ei ole piisavalt: ei sobitatud ({ $m } salvestust; vaja on vähemalt { $min_rec })

engine-iq-labfit-iqfit-uncensored-span-db-is-under = tsenseerimata J/S ulatus { $span_db } dB on alla { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff ja delta ei ole eraldi tuvastatavad (|corr| { $full } >= { $v2 }): mudel sõltub ainult suurusest delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] ei sobitatud: vaadeldi { $n_reacq } uuesti haaramist (vaja on vähemalt 3)
       *[other] ei sobitatud: vaadeldi { $n_reacq } uuesti haaramist (vaja on vähemalt 3)
    }

engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = tundmatu režiim `{ $m }` (ainult `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage peab olema [lower, upper] vahemikus [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds peab olema [lower, upper], kus 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db peab olema [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = kampaanias ei ole sobitamiseks sündmust märgitud võimsusprofiiliga

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Labori sobitus IQ kampaaniast: { $r }

    Skeem `{ $schema }`, mootor { $engine_version }. Silt: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = Kampaania DIGEST `{ $campaign_digest }`; `campaign.json` SHA-256 `{ $campaign_json_sha256 }`; stsenaariumi SHA-256 `{ $scenario_sha256 }`; lahtreid { $cells }; algkogumi kordusi { $bootstrap } (seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Üksus { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Olek: { $status }. Salvestusi { $recordings }, satelliite { $satellites }, sündmusi { $events }; sobitati vahemikke { $bins_used }, tsenseeriti { $bins_censored }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0 mudel ({ $q_mode }): `delta_eff` = { $ci } dB (tuvastatav nihe, taandatud väärtusele Q = 1); `Q_eff` = { $q }; `delta` selle Q korral = { $ci2 } dB; corr(Q, delta) { $om }; jääkide RMS { $residual_rms_db } dB J/S ulatuses { $span_db } dB. Q_eff ei ole C/N0 andmetest tuvastatav ilma sõltumatu võimsusmõõtmiseta.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q hoitud märgitud väärtusel: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over =
    { $n ->
        [one] Lävi J/S, otse: mediaan { $om } dB { $n } kaotuse kohta (IQR { $t }).{ "\u000A\u000A" }
       *[other] Lävi J/S, otse: mediaan { $om } dB { $n } kaotuse kohta (IQR { $t }).{ "\u000A\u000A" }
    }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Kõrvalejätmine (üks salvestus jäetakse välja), interpolatsioon: vahemikke { $bins }, C/N0 RMS { $om } dB, PI90 kate { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    { $n ->
        [one] { $model }: { $n } sündmus, kaotusaja RMS { $om } s, PI90 kate { $om2 }
       *[other] { $model }: { $n } sündmust, kaotusaja RMS { $om } s, PI90 kate { $om2 }
    }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    Valideerimistabeli SHA-256 `{ $table_sha256 }` (registreeritud { $registered }):

    | lävi | piir | väärtus | otsus |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = käivitus `{ $label }` logi

engine-e-iq-labfit-run = käivitus `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = stsenaariumi [input] ei nimeta ühtegi kampaaniat

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign ja [[runs]] välistavad teineteist: anna üks

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit stsenaarium: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = logis ei ole satelliidipõhist C/N0{ $cfg } (vaatlussuurused: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = enne algust hetkel { $onset } s epohhi ei ole

engine-iq-labfit-observe-no-epoch-at-or-after = alguse hetkel { $onset } s või pärast seda epohhi ei ole

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Labori sobitus: { $r }

    Silt: **{ $label }**. Seadete SHA-256 `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } C/N0 näidis, jääkide RMS { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } C/N0 näidist, jääkide RMS { $om } dB.{ $r }{ "\u000A" }
    }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Mudel: { $model } ({ $label })

    | parameeter | väärtus | piirid | piiril | algkogumi sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one] { "\u000A" }Sündmuseaja RMS { $om } s { $n_events } sündmuse kohta; kaotusi vahele jäetud { $loss_missed } / lisaks { $loss_extra }, uuesti haaramisi vahele jäetud { $reacq_missed } / lisaks { $reacq_extra }.

            | käivitus | langus dB-Hz | uuesti lukustus dB-Hz | sündmusi | RMS s |
            |---|---|---|---|---|{ "\u000A" }
       *[other] { "\u000A" }Sündmuseaja RMS { $om } s { $n_events } sündmuse kohta; kaotusi vahele jäetud { $loss_missed } / lisaks { $loss_extra }, uuesti haaramisi vahele jäetud { $reacq_missed } / lisaks { $reacq_extra }.

            | käivitus | langus dB-Hz | uuesti lukustus dB-Hz | sündmusi | RMS s |
            |---|---|---|---|---|{ "\u000A" }
    }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Kõrvalejätmine ({ $scheme }, { $folds } voldi): kõik { $om } s, interpolatsioon { $om2 } s, ekstrapolatsioon { $om3 } s.

    | väljajäetud käivitus | klass | kaugus | lähim treeningkäivitus | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } on reserveeritud edaspidiseks kasutuseks (määratletud on ainult FID 0)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } jääb vahemikust 0..=99 välja

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = SB1 sümbolite ja dekodeeritud välja lahknevus: { $sb1_err }

engine-iq-lunanet-afs-frames-at-and-are-symbols = kaadrid kohtades { $w } ja { $w2 } on { $gap } sümbolit teineteisest, mitte { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } järgneb TOI-le { $w2 }, oodati { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = ootamatu märk { $c } sümbolivoos (lubatud on ainult 0, 1 ja tühik)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: esimesed 24 kiipi erinevad

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: viimased 24 kiipi erinevad

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (dokument esitab mõlema PRN 147 ja PRN 151 jaoks A14850; generaator taastoodab PRN 151 oma, seega on PRN 147 kirje tõenäoliselt dokumendi trükiviga)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = kodeeritud 0x{ $word }, dekodeeritud FID { $fid } TOI { $toi }

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = monitori seaded: { $e }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = staatiline asukoht ei ole lõplik

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = konstantse kiirusega trajektoor ei ole lõplik

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = teekonnapunktide trajektooril ei ole teekonnapunkte

engine-e-iq-scene-geometry-waypoint-not-finite = teekonnapunkt ei ole lõplik

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = teekonnapunktide ajad peavad rangelt kasvama

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } ei ole GPS C/A PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = efemeriidisüsteem { $system } ei ole GPS

engine-e-iq-scene-satellite = satelliit { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = on pilootkomponent (andmeteta) ega kanna navigatsiooniandmeid

engine-e-iq-scene-nav-carries-data-the-scene-does = kannab andmeid, mida stseen ei modelleeri; genereeri see ilma andmeteta

engine-e-iq-scene-nav-does-not-carry-gps-lnav = ei kanna GPS LNAV-i (seda kannab ainult GPS L1 C/A); kasuta algväärtusega (seed) andmeid

engine-e-iq-scene-nav-not-an-lnav-source = ei ole LNAV allikas

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = stseen vajab vähemalt ühte satelliiti (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler loetleb väärtusi { $dopplers }; anna üks iga --prn kohta ({ $ids }) või üks ühine väärtus

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = tõerea väljade arv on { $f }, oodati 10

engine-e-iq-scene-truth-truth-field = tõe väli { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = tõe sat_id: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz peab olema positiivne arv

engine-e-iq-short-duration-must-be-in = duration_s peab olema vahemikus (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids peab sisaldama 1 kuni { $MAX_SATELLITES } satelliiti

engine-e-iq-short-dopplers-must-be-finite = dopplers peab olema lõplik

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] nõutud { $n } näidis; lühike käivitus mahutab kuni { $MAX_SAMPLES }
       *[other] nõutud { $n } näidist; lühike käivitus mahutab kuni { $MAX_SAMPLES }
    }

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C andme-PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C piloot-PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } on vahemikust väljas

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF sageduskanal { $id } jääb vahemikust -7..=6 välja

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = tundmatu signaal { $other }; oodati üht väärtustest: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = rida { $v1 }: puudub ';'

engine-e-iq-signals-galileo-line-no-code-number-in = rida { $v1 }: koodi numbrit ei ole väljas { $label }

engine-e-iq-signals-galileo-code-appears-twice = kood { $number } esineb kaks korda

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path }: { $n } kood, ICD määratleb { $CODES_PER_COMPONENT }
       *[other] { $path }: { $n } koodi, ICD määratleb { $CODES_PER_COMPONENT }
    }

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q esmane { $primary_prn } S{ $secondary } kolmandajärguline { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q esmane { $primary_prn } S{ $secondary } (kolmandajärguline välja jäetud)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = mitte-kuueteistkümnendmärk { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } kuueteistkümnendsümbolit ei saa mahutada täpselt { $len } kiipi

engine-iq-signals-primary-only = { $name } (ainult esmane)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC jälgimine vajab vara-hilise vahet vahemikus (0, { $max }) kiipi, et E ja L jääksid peamisele tipule (saadi { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = bump-jump lävi peab olema vähemalt 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = diskreetimissagedus peab olema positiivne

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods peab olema positiivne

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows peab olema positiivne

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } peab jagama bitipikkuse { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = toetatud on kuni { $MAX_EXTRA_TAPS } lisaharu (saadi { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = lisaharude nihked peavad olema lõplikud ja vahemikus ±{ $MAX_TAP_OFFSET_CHIPS } kiipi (saadi { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = C/N0 aken vajab vähemalt 2 prompt-väärtust

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: oodati atan2, costas-atan või costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: oodati cross-product, atan2 või atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: oodati pull-in või always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: oodati eml-power, dot-product või eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: oodati pll, fll või fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } ei kehti, kui carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: oodati arvu >= 0 (0 keelab piirangu)

engine-e-iq-track-design-must-be-positive-number-got = { $k } peab olema positiivne arv (saadi { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods peab olema vähemalt 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips peab olema vahemikus (0, 2] (saadi { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips sisaldab kuni { $MAX_EXTRA_TAPS } nihet (saadi { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = integration.extra_taps_chips nihked peavad olema lõplikud ja vahemikus ±{ $MAX_TAP_OFFSET_CHIPS } kiipi (saadi { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) peab olema väiksem kui carrier.fll_off_pli ({ $off }), mõlemad vahemikus (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s peab olema null või positiivne (saadi { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s peab olema positiivne (saadi { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order peab olema 1, 2 või 3 (saadi { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order peab olema 1 või 2 (saadi { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order peab olema 1 või 2 (saadi { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold peab olema vahemikus [-1, 1] (saadi { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows peab olema vähemalt 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods peab olema vähemalt 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) ei tohi olla väiksem kui lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db peab olema lõplik

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes peab olema vähemalt 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods peab olema vähemalt 1 (või "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent peab olema vähemalt 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa peab olema vahemikus (0, 1) (saadi { $pfa })

engine-e-iq-track-design-design-overrides = kujunduse alistused: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = kujunduse alistused ei tohi määrata name ega extends

engine-e-iq-track-design-loop-design-file = loop-design fail: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = loop-design fail: skeem { $other } ei ole toetatud; oodati { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = loop-design fail: puudub schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = loop-design fail: [[design]] tabeleid ei ole

engine-e-iq-track-design-loop-design-file-design-number = loop-design fail: [[design]] number { $v1 } nimi puudub

engine-e-iq-track-design-loop-design-file-design-name = loop-design fail: kujunduse nimi { $name } on reserveeritud või tühi

engine-e-iq-track-design-loop-design-file-design-is = loop-design fail: kujundus { $name } on määratletud kaks korda

engine-e-iq-track-design-no-design-named-the-file =
    { $n ->
        [one] kujundust nimega { $n } ei ole; failis on { $value }
       *[other] kujundust nimega { $n } ei ole; failis on { $value }
    }

engine-e-iq-track-design-loop-design-file-design-extends = loop-design fail: kujundus { $name } laiendab iseennast (tsükkel)

engine-e-iq-track-design-loop-design-file-design-extends-2 = loop-design fail: kujundus { $name } laiendab tundmatut kujundust { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = faasiahel vajab järku 1..=3 ja Bn > 0 (saadi { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = sageduseahel vajab Bn > 0 (saadi { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = sageduseahela järk peab olema 1 või 2 (saadi { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = ahelafilter vajab faasirada, sagedusrada või mõlemat

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = vara-hilise vahe peab olema vahemikus (0, 2] kiipi (saadi { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = DLL järk peab olema 1 või 2 (saadi { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = kiibisagedus ja kandesagedus peavad olema positiivsed

## src/iq/track/sink.rs

engine-e-iq-track-sink-an-epoch-carries-extra-taps =
    { $n ->
        [one] epohh kannab { $extra } lisaharu, aga väljund seadistati { $n } jaoks: kõik ühe käivituse kanalid peavad kasutama sama extra_taps_chips
       *[other] epohh kannab { $extra } lisaharu, aga väljund seadistati { $n } jaoks: kõik ühe käivituse kanalid peavad kasutama sama extra_taps_chips
    }

engine-e-iq-track-sink-record-is-bytes-expected = kirje on { $b } baiti; oodati { $want }

engine-e-iq-track-sink-unknown-lock-state-code = tundmatu lukuoleku kood { $b }

engine-e-iq-track-sink-epoch-file-header = epohhifaili päis: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = epohhifaili skeem { $schema }; oodati { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = epohhifaili kirjed on { $record_bytes } baiti; see lugeja ootab { $want } ({ $BINARY_RECORD_BYTES } pluss { $BINARY_TAP_BYTES } iga lisaharu kohta)

engine-e-iq-track-sink-epoch-file-ends-inside-record = epohhifail lõpeb kirje sees ({ $got } baiti { $size }-st)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = epohhivorming { $o }: oodati csv, jsonl või bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` ei ole arv

engine-e-jammertest-cli-is-not-utf-text = { $path } ei ole UTF-8 tekst

engine-e-jammertest-cli-needs-catalog = vajab --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = vajab vähemalt ühte --plan

engine-e-jammertest-cli-is-not-utf = { $cat } ei ole UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } ei ole UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` ei ole üks väärtustest ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` ei ole UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = vajab --log-start või --log koos --format

engine-e-jammertest-cli-log-needs-format = --log vajab --format

engine-e-jammertest-cli-the-log-does-not-state = logi ei nimeta oma algusaega: kasuta --log-start

engine-e-jammertest-cli-the-log-states-its-start = logi nimetab oma alguse kujul `{ $label }`: kasuta --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } ei ole UTF-8

engine-e-jammertest-cli-cannot-write = { $o } ei saa kirjutada: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } { $SCHEDULED_TRUTH } sündmust kirjutati faili { $o } ({ $skipped_non_rf } mitte-RF pesa vahele jäetud, { $outside_log } logist väljas, { $unknown_ids } id-d ei ole kataloogis)

engine-jammertest-cli-note-ids-not-in-the = märkus: kataloogis puuduvad id-d: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = märkus: need on plaani ajastatud pesad, mitte salvestatud eetriajad.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  testi nimi

## src/jammertest/cli.rs

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = teste: { $tests }, hinnatavaid: { $evaluable }; tolerantsi piires tuvastati { $detected }, hilinenult { $late }, tuvastamata jäi { $missed }; mediaanlatentsus { $fmt_opt }, mediaantaastumisaeg { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = valehäired väljaspool kõiki pesasid: käivitusi { $false_alarm_runs }, { $false_alarm_epochs } puhtast epohhist { $clean_epochs }

engine-e-jammertest-cli-needs-session-path = vajab seansi teed

engine-e-jammertest-cli-needs-catalog-and-plan-or = vajab --catalog ja --plan või --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = tõendipakett kirjutati faili { $out }; allkirjastaja sõrmejälg { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = kataloogis { $root } ei ole kausta, kus oleks scenario.json ja .ubx

engine-e-jammertest-dataset-scenario = stsenaarium: { $e }

engine-e-jammertest-dataset-read = lugemine: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json ei sisalda kuupäeva

engine-e-jammertest-dataset-scenario-json-date-is-not = scenario.json kuupäev `{ $date }` ei ole kuupäev

engine-e-jammertest-dataset-no-readable-epoch-in-mon = failides mon_rf.csv ja rinex.csv ei ole loetavat epohhi

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = kataloogis { $root } ei ole kausta, kus oleks scenario.json

engine-jammertest-dataset-recovered-of-median = { $f2 } taastus ({ $recovered } / { $alarmed }), mediaan { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = logi nimetab oma alguse kujul `{ $l }`, mis ei ole UTC ISO-8601: anna algus selgesõnaliselt

engine-e-jammertest-the-log-does-not-state = logi ei nimeta oma algusaega: anna see selgesõnaliselt

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = kataloog ei ole JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = kataloogis ei ole massiivi `test_types`

engine-e-jammertest-plan-test-type-has-no-type = testitüübil puudub `type_id`

engine-e-jammertest-plan-test-group-has-no-group = testirühmal puudub `group_id`

engine-e-jammertest-plan-test-has-no-test-id = testil puudub `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = kataloog ei loetle ühtegi testi

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` ei ole plaaniaeg kujul 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = plaan ei ole JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = plaanis ei ole massiivi `locations`

engine-e-jammertest-plan-test-end-time-is-not = test { $id }: end_time ei ole hilisem kui start_time

engine-e-jammertest-plan-the-plan-has-no-test = plaanis ei ole katsepiirkonda { $l }; selles on { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = plaanis on mitu katsepiirkonda { $areas }; nimeta, millises neist logi salvestati

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json ei ole JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = massiivi `attack_log` ei ole

engine-jammertest-plan-jammertest-2024-test-window =
    { $n ->
        [one] { $SCHEDULED_TRUTH }: Jammertest 2024 test { $id } aken { $n } ({ $attack })
       *[other] { $SCHEDULED_TRUTH }: Jammertest 2024 test { $id } aken { $n } ({ $attack })
    }

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log ei sisalda alguse/lõpu akent

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = ajastatud sündmusi { $events }, aga käivitus hindas { $events2 }: anna käivituse enda sündmused

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s peab olema positiivne ja guard_s mitte negatiivne

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m peab loetlema vähemalt ühe elemendi

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m peab olema lõplik

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: oodati „null-steering“ või „mvdr“

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz peab olema positiivne (saadi { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: jaotis vajab [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) peab olema lõplik ning võrdne tracking_threshold_dbhz-ga ({ $tracking_threshold_dbhz }) või sellest suurem

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s peab olema lõplik ja mittenegatiivne (saadi { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits peab olema 1 kuni 16 (saadi { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz peab olema positiivne (saadi { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side peab olema vähemalt 2 (saadi { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } peab olema lõplik (saadi { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } peab olema positiivne (saadi { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: profiilipunkt { $points } ({ $lat }, { $lon }) jääb DEM-ruudust välja

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: profiilipunkt { $points } ({ $lat }, { $lon }) on DEM-i tühimikul

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC kalendrikuupäev on vahemikust väljas: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = sellist kalendrikuupäeva ei ole: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC sekund { $second } on vahemikust väljas hetkel { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = poolusel asuval stardipaigal ei ole määratletud asimuuti

engine-e-launch-inclination-unreachable-from-latitude-without = kaldenurk { $inclination_rad }° ei ole laiuskraadilt { $lat_rad }° saavutatav ilma dogleg-manöövrita (vaja |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = tegeliku poolusepaiga kiirus vajab nii `epoch` kui ka `eop_finals2000a` (tegelik IERS finals2000A sisu)

engine-e-launch-site-lon-deg-must-be = site_lon_deg peab olema vahemikus [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a ei sisaldanud loetavaid IERS finals2000A ridu

engine-e-launch-epoch-mjd-is-outside-the = epohh { $epoch } (MJD { $mjd_utc }) jääb antud EOP ridadest välja (MJD { $mjd } kuni { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg peab olema vahemikus [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg peab olema vahemikus [0, 180]

engine-launch-launch-window-lat-az-asc = launch-window: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° tõusev, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s Maa pöörlemise lisa, { $opportunities } võimalust päevas (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = iga kauguskiirus vajab positiivset lõplikku sigmat

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = Doppleri geomeetria on singulaarne

engine-e-leo-fusion-doppler-no-covariance = kovariatsiooni ei ole

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = iga pseudovahemaa vajab positiivset lõplikku sigmat

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = satelliit langeb kokku asukohahinnanguga

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = geomeetria on singulaarne

engine-e-leo-fusion-joint-pvt-no-iteration-ran = ühtegi iteratsiooni ei käivitatud

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = degenereerunud lõppgeomeetria

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP ei ole lõplik

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } peab olema positiivne

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m peab olema mittenegatiivne ja käivitus kuni 5000 epohhi

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = iga signaal vajab positiivset ribalaiust

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] 5G NTN positsioneerimine sagedusel { $r } MHz, C/N0 { $r2 } kuni { $r3 } dB-Hz, satelliite: { $n_satellites } (nähtavas { $mean_in_view }){ "\u000A" }
       *[other] 5G NTN positsioneerimine sagedusel { $r } MHz, C/N0 { $r2 } kuni { $r3 } dB-Hz, satelliite: { $n_satellites } (nähtavas { $mean_in_view }){ "\u000A" }
    }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, CRB vahemaa { $range_sigma_zenith_m } kuni { $range_sigma_mask_m } m; mediaan formaalne 3D { $s2 } m, RMS viga { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }ühe satelliidi Doppleri läbimine: { $n_obs } näidis ajavahemikul { $duration_s } s, horisontaalviga { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }ühe satelliidi Doppleri läbimine: { $n_obs } näidist ajavahemikul { $duration_s } s, horisontaalviga { $horizontal_error_m } m{ "\u000A" }
    }

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP vajab vähemalt ühte süsteemi

engine-e-leo-fusion-ppp-duration-and-step-must-be = kestus ja samm peavad olema positiivsed, kuni 20000 epohhiga

engine-e-leo-fusion-ppp-runs-must-be-to-200 = käivitusi peab olema 1 kuni 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = koondumislävid peavad olema positiivsed

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] PPP koondumine { $criterion_horizontal_m } m horisontaalselt / { $criterion_vertical_m } m vertikaalselt, { $runs_per_case } käivitust juhtumi kohta, GNSS-satelliite: { $n_gnss }{ "\u000A" }
       *[other] PPP koondumine { $criterion_horizontal_m } m horisontaalselt / { $criterion_vertical_m } m vertikaalselt, { $runs_per_case } käivitust juhtumi kohta, GNSS-satelliite: { $n_gnss }{ "\u000A" }
    }

engine-leo-fusion-ppp-leo-median-min-converged-nees =
    { $n_leo ->
        [one] { "  " }{ $name } { $n_leo } LEO  mediaan { $c } min  koondus { $v4 }%  NEES keskmine { $nees_mean }{ "\u000A" }
       *[other] { "  " }{ $name } { $n_leo } LEO  mediaan { $c } min  koondus { $v4 }%  NEES keskmine { $nees_mean }{ "\u000A" }
    }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = horisontaalvea mediaan { $runs_per_case } käivituse peale · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = eelseadistus { $id } ei kanna signaali

engine-e-leo-fusion-presets-preset-has-no-signal-it = eelseadistusel { $id } ei ole signaali { $n }; sellel on { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = tundmatu LEO eelseadistus { $id }; tuntud: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s ja step_s peavad olema positiivsed, kuni 20000 epohhiga

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = polaarsammud peavad olema positiivsed

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode peab olema doppler, joint, polar või timing; saadi { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = doppler-režiim vajab vähemalt ühte LEO süsteemi

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = timing-režiim vajab LEO süsteemi koodivahemõõtmisega

engine-e-leo-fusion-pvt-kind-unknown-clock-class = tundmatu kellaklass { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) asukohas { $user_lat_deg }, { $user_lon_deg } ajavahemikul { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz =
    { $n_satellites ->
        [one] { "  " }{ $name } { $role } satelliite: { $n_satellites }, kõrgus { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
       *[other] { "  " }{ $name } { $role } satelliite: { $n_satellites }, kõrgus { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one] { "  " }Doppleri positsioon: mõõtmisi { $n_obs }, satelliite { $n_sats }, 3D viga { $error_3d_m } m (horisontaalne { $horizontal_error_m } m){ "\u000A" }
       *[other] { "  " }Doppleri positsioon: mõõtmisi { $n_obs }, satelliite { $n_sats }, 3D viga { $error_3d_m } m (horisontaalne { $horizontal_error_m } m){ "\u000A" }
    }

engine-leo-fusion-pvt-kind-window-sats-3d-error =
    { $n_sats ->
        [one] { "    " }aken { $window_s } s: satelliite { $n_sats }, 3D viga { $f } m{ "\u000A" }
       *[other] { "    " }aken { $window_s } s: satelliite { $n_sats }, 3D viga { $f } m{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } kesktaeva läbimine: max Doppler { $max_doppler_hz } Hz, kiirus { $max_doppler_rate_hz_s } Hz/s, jerk { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }LEO kaugusmõõtmise satelliit nähtaval { $v1 }% epohhidest{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d =
    { $n ->
        [one] { "  " }{ $n } kättesaadavus { $availability }, PDOP mediaan { $f }, RMS 3D viga { $f2 } m{ "\u000A" }
       *[other] { "  " }{ $n } kättesaadavus { $availability }, PDOP mediaan { $f }, RMS 3D viga { $f2 } m{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } liidetud { $f3 }; nähtavas { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, max { $row3 } ns (nähtavas { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — režiim { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = süsteem { $name }: role peab olema gnss või leo, saadi { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = süsteem { $name }: clock peab olema estimated või known, saadi { $c }

engine-e-leo-fusion-system-system-must-be-positive = süsteem { $name }: { $what } peab olema positiivne

engine-e-leo-fusion-system-system-mask-deg-must-be = süsteem { $name }: mask_deg peab olema vahemikus [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = süsteem { $name }: sigma_pr_m peab olema positiivne

engine-e-leo-fusion-system-give-at-least-one-system = anna vähemalt üks [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = epohhide samm peab olema positiivne

engine-e-leo-fusion-timing-no-epochs = epohhe ei ole

engine-e-leo-fusion-timing-no-satellite-was-ever-in = ükski satelliit ei olnud kunagi nähtaval: vastuvõtja ei haaranud kunagi aega

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polarisatsioon peab olema rhcp, lhcp või linear; saadi '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4 veakood { $code } hetkel t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = orbiit kaldenurgaga { $inc } deg ei läbi kunagi laiuskraadi { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = nõutud maksimaalne tõusunurk jääb horisondi ulatusest allapoole

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = hoone klass peab olema traditional või thermally-efficient; saadi '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = väli { $name } ei ole lõplik

engine-e-leo-navmsg-codec-field-is-outside-its-bit = väli { $name } = { $value } { $unit } jääb väljapoole oma { $bits }-bitist vahemikku (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = sõnum on kärbitud

engine-e-leo-navmsg-codec-field-list-exhausted = väljade loend on ammendatud

engine-e-leo-navmsg-codec-field-order-mismatch-vs = väljade järjekord ei klapi: { $name } vs { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID peab olema 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = iga paranduspolünoom vajab 1-8 koefitsienti

engine-e-leo-navmsg-codec-correction-time-scale-must-be = paranduse ajaskaala peab olema kahe aste vahemikus 1 s kuni 32768 s; saadi { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = ECEF polünoom vajab 1-11 koefitsienti, telje kohta võrdselt

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = ECEF polünoomi aste { $v1 } ületab 10

engine-e-leo-navmsg-codec-unknown-model-id = tundmatu mudeli id { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = andmemaht ületab 4095 baiti

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = kaader on päisest ja CRC-st lühem

engine-e-leo-navmsg-codec-bad-preamble-0x = vigane preambul 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = toetamata versioon { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = kaadri pikkus { $frame } ei vasta deklareeritud { $len } baidi andmemahule

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q ei klapi: arvutatud 0x{ $crc }, kaader kannab 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees peavad igaüks olema kuni 7; saadi { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree peab olema 1-10; saadi { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = tundmatu efemeriidimudel '{ $other }': kasuta kepler16, kepler-rac, liu22 või ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = sobitusintervall peab olema vähemalt 10 s; saadi { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = sobitusaken [{ $t0 }, { $v1 }] s jääb väljapoole tõeorbiiti [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = ECEF polünoomi sobitus on singulaarne (liiga vähe näidiseid selle astme jaoks)

engine-e-leo-navmsg-fit-clock-fit-is-singular = kella sobitus on singulaarne

engine-e-leo-navmsg-fit-keplerian-fit-diverged = Kepleri sobitus hajus

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = tundmatu eelseadistus '{ $k }'; saadaval: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s peab olema 10-3600 s ja update_period_s vahemikus (0, fit_interval_s]; saadi { $fit_interval_s } ja { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s ja eval_step_s peavad olema { $lit_0_5 }-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz peab ületama 10 MHz; saadi { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid peab olema 1-255

engine-e-leo-navmsg-band-must-be-15-and = band peab olema 0-15 ja health 0-3

engine-e-leo-navmsg-unknown-csv-schema = tundmatu csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis peab nimetama vähemalt ühe analüüsi

engine-e-leo-navmsg-unknown-analysis-use = tundmatu analüüs '{ $a }'; kasuta { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind peab olema leo-navmsg; saadi { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg peab olema vahemikus [0, 60); saadi { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO navigatsioonisõnum — { $res } km, { $res2 } deg, gravitatsiooniaste { $gravity_degree }, mudel { $res3 }
    { "  " }SISRE kaalud: w_R { $w_r }, w_AC^2 1/{ $v6 } (mask { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s peab olema 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s peab olema mittetühi, igaüks 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }sobitusintervalli kompromiss ajavahemikul { $span } s (kasutusperiood = sobitusintervall):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE orbiidi RMS { $sisre_orb_rms_m } m  max { $sisre_orb_max_m } m  kellaga RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s peab olema mittetühi, igaüks 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s peab olema 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } parameetrit  SISRE orbiidi RMS { $sisre_orb_rms_m } m  kellaga { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = kasutajale asukohas { $lat }, { $lon } ei ole { $search } s jooksul läbimist üle { $mask } deg; laienda midpass.search_s või liiguta kasutajat

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }läbimise keskel uuendus: läbimine { $p0 }-{ $p1 } s (max tõusunurk { $pmax } deg), { $switches } lülitust, suurim kasutajavahemaa hüpe { $max_jump } m (halvima juhu geomeetria { $max_worst } m) vs lävi { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }kodeerimine-dekodeerimine: mudel { $m }, kaader { $frame } baiti (andmemaht { $payload_bits } bitti, efemeriid+kell { $eph_bits } bitti), CRC-24Q 0x{ $hex }
    { "    " }kvantimine: suurim asukohamuutus { $v6 } mm, kell { $v7 } mm; SISRE täpne { $acc_exact } m, kvantitud { $acc_q } m
    { "    " }rikutud kaader tagasi lükatud: { $corrupted_rejected }; RINEX edasi-tagasi { $rin_dp } m; CSV edasi-tagasi { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs peab olema 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  avaldatud { $published } m  suhe { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = 16-parameetriline Kepleri komplekt halveneb väärtuselt { $a } m hetkel { $lo } s väärtusele { $b } m hetkel { $hi } s: üks Kepleri komplekt kaks korda tiirus harmoonikutega ei suuda LEO kaare kõrgsageduslikke gravitatsiooniliikmeid ega õhutakistust jälgida kauem kui paar minutit ning selle vähimruutude jääk võngub üle akna. Piki/risti/raadiuse polünoomid, mille aste on kõrgem kui Kepleri komplekt hõlmab, neelavad ülejäänu ja annavad { $c } m hetkel { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = 16-parameetriline Kepleri komplekt läheb väärtuselt { $a } m hetkel { $lo } s väärtusele { $b } m hetkel { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, gravitatsiooniaste { $gravity_degree } · esitusviga tõe suhtes · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` on hostiteleteegi oma

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: `rand_distr` valimid kutsuvad harvades harudes hosti `exp` ja `ln`; kasuta `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` on hostiteleteegi gravitatsioonivälja; kasuta `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` ei ole üle vaadatud

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = rida END OF HEADER puudub

engine-e-leo-navmsg-text-expected-eph-record-header-got = oodati kirje päist '> EPH', saadi { $head }

engine-e-leo-navmsg-text-bad-satellite-id = vigane satelliidi id { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = epohhirida puudub

engine-e-leo-navmsg-text-bad-epoch-line = vigane epohhirida { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = vigane epohhiväli kohas { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = epohhirida vajab kolme kelle liiget: { $ep }

engine-e-leo-navmsg-text-record-truncated = kirje on kärbitud

engine-e-leo-navmsg-text-unknown-record-type = tundmatu kirjetüüp { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = CSV tabel kannab kepler16 ja kepler-rac sõnumeid; saadi { $m }

engine-e-leo-navmsg-text-empty-csv = tühi CSV

engine-e-leo-navmsg-text-row-has-cells-header = real on { $cells } lahtrit, päises { $header }

engine-e-leo-navmsg-text-bad-number-in-column = vigane arv { $c } veerus { $k }

engine-e-leo-navmsg-text-csv-row-lacks = CSV real puudub { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = orbiidi kõrgus peab olema vahemikus 100 km kuni 3000 km; saadi { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = ekstsentrilisus peab LEO sobituse jaoks olema vahemikus [0, { $lit_0_1 }); saadi { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = integreerimissamm peab olema vahemikus (0, 30] s; saadi { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = kestus peab olema positiivne, kuni 200000 sammuga; saadi { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree peab olema 0, 2-6 (zonaalne) või 7-{ $v1 } (EGM2008); saadi { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = tõe levitamine hajus

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = tõeorbiit lagunes alla 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = sõlmevahe peab olema vahemikus (0, 60] s; saadi { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = tabelina antud tõeorbiit vajab vähemalt kahte olekut; saadi { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = olek { $k } ei ole lõplik

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = kella adev_1s peab olema vahemikus [0, 1e-6); saadi { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = mõõdetud kell ehitatakse funktsiooniga TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = juhitud kell vajab sigma_s vahemikus [0, 1e-3) ja tau_s > 0; saadi { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = mõõdetud kell vajab positiivset sammu ja vähemalt kahte näidist

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = mõõdetud kella näidis ei ole lõplik

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epohh '{ $s }' ei ole kujul YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epohh '{ $s }' ei ole kujul YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epohhi '{ $s }' sekundiväli on vigane

engine-e-leo-pass-epoch-is-out-of-range = epohh '{ $s }' on vahemikust väljas

engine-e-leo-pass-band-unknown-signal-design-public =
    { $n ->
        [one] riba '{ $name }': tundmatu signaali kujundus '{ $n }'; avalikud kujundused: { $v2 }
       *[other] riba '{ $name }': tundmatu signaali kujundus '{ $n }'; avalikud kujundused: { $v2 }
    }

engine-e-leo-pass-band-is-not-in-the = riba '{ $name }' ei ole süsteemi eelseadistuses: anna frequency_mhz ja eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = riba '{ $name }' vajab eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern peab olema isoflux, gaussian või flat; saadi '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = riba '{ $name }' sagedus on vahemikust väljas

engine-leo-pass-overridden-in-the-scenario = { $source } (stsenaariumis alistatud)

engine-e-leo-pass-system-has-no-band =
    { $n ->
        [one] süsteemil '{ $id }' ei ole riba '{ $n }'
       *[other] süsteemil '{ $id }' ei ole riba '{ $n }'
    }

engine-e-leo-pass-leo-satellite-needs-at-least = LEO satelliit vajab vähemalt ühte riba

engine-e-leo-pass-at-most-12-bands-per = kuni 12 riba satelliidi kohta

engine-leo-pass-unknown-system-presets-in-this =
    { $n ->
        [one] tundmatu süsteem '{ $n }'; selle järgu eelseadistused: { $ids }
       *[other] tundmatu süsteem '{ $n }'; selle järgu eelseadistused: { $ids }
    }

engine-e-leo-pass-no-sun-synchronous-orbit-at = päikesesünkroonset orbiiti kõrgusel { $v1 } km ei ole

engine-e-leo-pass-duration-at-most-86400-and = duration_s (kuni 86400) ja step_s peavad olema positiivsed, kuni 20000 epohhiga; saadi { $duration } ja { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO satelliit, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = stsenaariumi `epoch` { $epoch }, loetud UTC-na

engine-leo-pass-the-kind-default-epoch-utc = liigi vaikeepohh { $epoch } UTC (stsenaarium ei anna ühtegi)

engine-e-leo-pass-user-environment-must-be-ground = user.environment peab olema ground, maritime, air või indoor; saadi '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg peab jääma vahemikku +/-90

## src/leo_pass.rs

engine-e-leo-pass-user-speed-must-be-to = kasutaja kiirus peab olema 0 kuni 3000 m/s ja kõrgus -500 kuni 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna peab olema patch, hemispherical või isotropic; saadi '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability peab olema vahemikus (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model peab olema klobuchar, vtec või none; saadi '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction peab olema ascending või descending; saadi '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satelliit { $id }: vigane ekstsentrilisus või perigee

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satelliit { $id }: tle vajab tle_line1 ja tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit peab olema pass, elements või tle; saadi '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation vajab süsteemi või kavandit

engine-e-leo-pass-no-sun-synchronous-inclination = päikesesünkroonset inklinatsiooni pole

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: kuni 5000 satelliiti

engine-e-leo-pass-no-leo-satellite-rises-above = ükski LEO satelliit ei tõuse aknas maskist kõrgemale

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s peab olema vahemikus (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' ei ole ühegi LEO satelliidi sagedusriba ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = GNSS-signaali '{ $bname }' satelliidikonstellatsioonile '{ $cons }' pole

engine-e-leo-pass-empty-gnss-constellation = tühi GNSS-i satelliidikonstellatsioon

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' ei ole kaks erinevat sagedusriba objektil { $id }

engine-e-leo-pass-iot-powers-and-battery-must = iot võimsused ja aku peavad olema positiivsed

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from peab olema median või peak; saadi '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = tuvastuslävi { $detection_snr_db } dB pärast integreerimist

engine-leo-pass-coherent-integration-at-most-ms = koherentne integreerimine kuni { $rx } ms, piiratud Doppleri kiirusega

engine-leo-pass-serial-search-with-correlators = järjestikotsing korrelaatoritega: { $correlators }

engine-leo-pass-hot-start-doppler-known-to = kuumkäivitus: Doppler teada täpsusega +/-{ $aided } Hz, efemeriid kehtiv

engine-leo-pass-leo-pass-link-budget-user = LEO ülelennu ühendusbilanss, { $environment } kasutaja asukohas { $lat_deg }, { $lon_deg }; LEO satelliite: { $satellites }, aken { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, maksimaalne kõrgusnurk { $max_elevation_deg } deg ajahetkel { $tca_s } s, maski kohal { $duration_above_mask_s } s{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 tipp { $opt } mediaan { $opt2 }; |Doppler| maks { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: nähtaval { $satellites_in_view }, C/N0 { $opt } kuni { $opt2 } (mediaan { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } tipp { $leo_peak_cn0_dbhz } dB-Hz on { $leo_peak_above_gnss_median_db } dB GNSS-i mediaanist kõrgem; tugevaimast GNSS-i kandjast kõrgem { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: külmkäivituse TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), kuumkäivituse { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spuuferi algus { $onset_s } s (hüpe { $offset_m } m, lükkekiirus { $push_rate_m_s } m/s): Doppleri test GNSS { $t }, LEO { $t2 }, liidetud { $t3 }; ribadevaheline { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = { $environment } kasutaja · LEO tipp { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB GNSS-i mediaanist kõrgem · MODELLED

engine-leo-pass-user-modelled = { $environment } kasutaja · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = iga LEO satelliidi esimese sagedusriba Doppler (±{ $v1 } kHz skaala täisulatus)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = vigane tabel [{ $what }]: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' ei ole ei jaotises [signal] ega avalik kavand ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' ei sisalda koodjälgitavat komponenti, seega ei anna see pseudovahemaad

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind peab olema leo-pnt-chain; saadi { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = jälgitaval komponendil puudub kiibisagedus

engine-e-leo-pnt-chain-no-band-of-pass-names = ükski jaotise [pass] sagedusriba ei nimeta signaali signal = "{ $name }"; ahel vajab ühte, mis kavandit kannaks

engine-e-leo-pnt-chain-the-pass-gives-no-code = ülelend ei anna koodivabinat

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m peab olema vahemikus [0, 100] m; saadi { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] peab töötama režiimis mode = "joint"; saadi { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = jälgitav C/N0 maskil { $mask } deg (sirgsobitus sin kõrgusnurga järgi)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] ei sisalda LEO süsteemi, mis ahela väärtused vastu võtaks

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] ei andnud ühisplokki

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT ahel: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signaal { $name2 } ({ $design }), jälgitud { $design2 } sagedusel { $v4 } Mchip/s, C/N0 nihe { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }ülelend { $id } { $sat } km: jälgitud C/N0 tipp { $peak_tracked_cn0_dbhz } dB-Hz, koodivabin mediaan { $jitter_median } m; C/N0 sirge { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }teade { $res } { $fit_interval_s } s sobitus / { $update_period_s } s uuendus: esitus-SISRE { $stats } mm RMS (orbiit { $stats2 } mm), orbiidi määramisega { $od } m: edasi antud { $sisre } m{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }liidetud lahend: ainult GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP koondumine: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } etappide vahel edasi antud väärtused. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = koodijälgimise vabin, kaugusmõõtmise viga (m, 0 kuni { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · ainult GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulatsioon { $label }: laius peab olema positiivne

engine-e-leo-signal-unknown-signal-preset-the-library = tundmatu signaali eelseadistus { $name }: teegis on { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = eelseadistus { $name }: vigane eelseadistuse fail: { $e }

engine-e-leo-signal-preset-file-names-itself = eelseadistuse fail { $name } nimetab end { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz peab olema positiivne

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz peab olema positiivne

engine-e-leo-signal-signal-needs-at-least-one = { $name }: signaal vajab vähemalt ühte komponenti

engine-e-leo-signal-component-power-fraction-must-be = { $name }: komponendi { $v1 } power_fraction peab olema positiivne

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: komponendil { $v1 } on fdma_shares, kuid puudub fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: komponendi { $v1 } fdma_shares peab olema positiivne ja summeeruma ühele

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: komponent { $v1 } vajab ühte fdma_share'i nihke kohta

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps peab olema positiivne

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips peab olema positiivne

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: komponentide võimsusosade summa on { $total }, mitte 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km peab olema positiivne

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: lamedat (OFDM-laadset) komponenti ei saa spektrimudelis paigutada

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: jälgitav komponent asub FDMA alamkandjatel; spektrimudel jälgib komponenti sagedusriba keskel

engine-e-leo-signal-signal-is-given-twice = signaal { $w } on antud kaks korda

engine-e-leo-signal-signals-is-more-than-the = { $out } signaali on rohkem kui lubatud 24

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s peab olema väiksem kui 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: anna 1 kuni 40 cn0_dbhz väärtust

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 ja slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points peab olema vahemikus 21 kuni 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: kasuta "coherent" või "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = süsteemi müratemperatuur peab olema positiivne

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = ühilduvus: tundmatu GNSS-signaal { $n } (tuntud: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } ei ole stsenaariumi signaal

engine-e-leo-signal-shape-check-signal-is-not = kujukontroll: signaal { $signal } ei kuulu stsenaariumi

engine-leo-signal-scenario-leo-signal-signals-noise = stsenaarium leo-signal | signaale: { $runs } | müratase { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = vasakul: iga kavandi sagedusribaga piiratud PSD (dB tipust allpool, kogu selle saatesagedusriba ulatuses); paremal: koodivabin ja kogu C/N0 kiibivahe { $reference_spacing_chips } korral

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = tundmatu sagedusriba '{ $other }' (oodatud s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km peab olema lõplik ja positiivne

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps peab olema lõplik ja positiivne

engine-e-linkbudget-other-losses-db-must-be = other_losses_db peab olema lõplik ja >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k peab olema lõplik ja positiivne, kui see on antud

engine-linkbudget-link-budget-band-km-bit = link-budget: { $value }-riba, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, varu { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = ei saa kuulata aadressil { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: kuulab tcp-l { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp klient ühendus

engine-live-io-kshana-live-warning-is-not = kshana live: hoiatus: { $addr } ei ole loopback-aadress; igaüks, kes selleni ulatub, saab voogu lugeda

engine-e-live-io-cannot-open = ei saa avada { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: tcp klient katkestati, sest see ei suutnud sammu pidada

engine-e-live-io-cannot-open-2 = ei saa avada { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: hoiatus: { $addr } ei ole loopback-aadress; igaüks, kes selleni ulatub, saab sellele kihile voogu saata

engine-e-live-io-cannot-bind-udp = ei saa siduda udp-d { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: kuulab udp-l { $addr }

engine-e-live-io-cannot-connect-to = ei saa ühenduda aadressiga { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: ühendatud tcp-ga { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: loeb jadaporti { $path } kiirusel { $baud } baud (ainult lugemine)

engine-live-io-the-was-closed-by-the = { $v1 } sulges vastaspool (kiht ei ühendu uuesti: käivita see järelevalvaja all, mis selle taaskäivitab)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: kasuta 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 või 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } ei ole jadaseade (tcgetattr ebaõnnestus)

engine-e-live-io-cannot-set-baud = ei saa seada kiirust { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = ei saa seada seadme { $path } rearežiimi

engine-e-live-io-serial-is-supported-on-unix = --serial on toetatud ainult Unixis; kasuta --file, --tcp või --stdin

engine-live-io-unknown-option = tundmatu valik { $s }

engine-live-io-cannot-read = ei saa lugeda { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: laeva platvorm, kalibreerimine { $calibration_s } s; värav { $v2 }. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade: vastutab jätkuvalt operaator.

engine-live-io-write-failed = kirjutamine ebaõnnestus: { $e }

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live: jäeti kõrvale { $n } udp datagramm, mida mootor vastu võtta ei suutnud ({ $udp_dropped } kokku)
       *[other] kshana live: jäeti kõrvale { $n } udp datagrammi, mida mootor vastu võtta ei suutnud ({ $udp_dropped } kokku)
    }

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } on väljaspool vahemikku 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = lisamisindeks { $p } on väljaspool vahemikku 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = Annex 3 failid sisaldavad { $gold } ja { $ter } koodi, oodatud 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } ei ole g1, g2 Goldi kood (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = järelkoodi S{ $id } pole olemas (S0 kuni S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 määrab koodid ainult sõlmetunnustele 1 kuni 12, mitte { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } ei mahu kahele bitile (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } on väljaspool vahemikku 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = oodatud { $SB1_SYMBOLS } alamkaadri-1 sümbolit

engine-e-lunar-afs-frame-subframe-data-lengths-expected = alamkaadri andmete pikkused { $sb2 }/{ $sb3 }/{ $sb4 } (oodatud { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = oodatud { $FRAME_SYMBOLS } sümbolit, antud { $soft }

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = rida { $v1 }: oodatud `row,column`

engine-e-lunar-afs-ldpc-line = rida { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = rida { $v1 }: ({ $r },{ $c }) on väljaspool { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: oodatud { $info_bits } infobitti, antud { $info }

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = LSIS V1.0 andmeid pole kataloogis { $cache_dir } (sea KSHANA_LSIS_DIR või käivita xval/lunar-afs/fetch_lsis.sh, mis laadib alla { $LSIS_PDF_URL } ja pakib lahti selle manused; neid Kshanaga ei levitata)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } ei ole kinnitatud LSIS-i fail

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } SHA-256 on { $got }, oodatud { $want } (kinnitatud LSIS V1.0 järgi, 29. jaanuar 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal baasriba, { $LSIS_VERSION }; Kshana etalongeneraator

engine-lunar-afs-waveform-afs-node = AFS sõlm { $node_id }

engine-lunar-afs-waveform-afs-node-frame-toi = AFS sõlm { $node_id } kaader TOI { $toi }

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites peab olema vähemalt 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites peab olema vähemalt 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg peab olema vahemikus [0, 90); saadi { $mask_deg }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } satelliit, majakaid pole
       *[other] { $n_sats } satelliiti, majakaid pole
    }

engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one] { $n_sats } satelliit
       *[other] { $n_sats } satelliiti
    } + { $n_vis_beacons ->
        [one] { $n_vis_beacons } nähtav majakas
       *[other] { $n_vis_beacons } nähtavat majakat
    }

engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } satelliit, majakaid pole
       *[other] { $n_cmp } satelliiti, majakaid pole
    }

engine-e-lunar-beacon-serialising-beacon-report = majakaruande serialiseerimine: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = majakaruanne peab serialiseeruma JSON-objektiks

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Kuu pinnamajakate täiendus — mask { $elevation_mask_deg } deg, epohh +{ $epoch_s } s, majaka kohta sigma_URE { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons =
    { "  " }{ $label }  { $n_visible_sats ->
        [one] { $n_visible_sats } satelliit
       *[other] { $n_visible_sats } satelliiti
    }  { $n_visible_beacons ->
        [one] { $n_visible_beacons } majakas
       *[other] { $n_visible_beacons } majakat
    }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  realiseerunud 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }majakad parandavad PDOP-i { $f } korda;{ " " }

engine-lunar-beacon-larger-constellation-instead = suurem satelliidikonstellatsioon selle asemel, { $f } korda{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = ei saa lugeda Kuu efemeriidi { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = Kuu efemeriid: esimene rida peab olema `{ $MAGIC }`, leiti `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = Kuu efemeriid: fail on tühi

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = Kuu efemeriid: `# format:` peab olema `states` või `elements`, leiti `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = Kuu efemeriid: andmeridu pole

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = Kuu efemeriid: puudub veerg `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = Kuu efemeriid: `# elements_frame:` peab olema `icrf` või `mci`, leiti `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = Kuu efemeriid: `elements_frame: icrf` vajab `# epoch_jd_tdb:` (epohh, millele elemendid viitavad ja millal hinnatakse ka ICRF-ist Kuuga seotud süsteemi pööret): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = Kuu efemeriid: lühike elemendirida { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = Kuu efemeriid: elemendirida { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = Kuu efemeriid: elemendireal { $v1 } on mittepositiivne pooltelg

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = Kuu efemeriid: elemendireal { $v1 } on ekstsentrilisus { $ecc }, väljaspool [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = Kuu efemeriid: `states` fail vajab `# frame: icrf` või `# frame: mci`, leiti `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = Kuu efemeriid: `icrf` states fail vajab `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = Kuu efemeriid: lühike olekurida { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = Kuu efemeriid: olekurida { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = Kuu efemeriid: olekurida { $v1 } ei ole lõplik

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = Kuu efemeriid: satelliidi { $sat } olekurida { $v1 } läheb ajas tagasi ({ $t } pärast { $last }); epohhid peavad satelliidi kohta rangelt kasvama

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Tabuleeritud Kuu-keskne olekuefemeriid ({ $e } süsteem), Lagrange'i interpoleeritud järgus { $LAGRANGE_ORDER } tabeli epohhide vahel ja taandatud MCMF-i meetodiga { $v2 }. Neid olekuid see mootor EI propageeri. Päritoluklass `published-ephemeris`: erineb igast elementidest tuletatud suurusest.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Avaldatud satelliidikonstellatsiooni MÄÄRATLUS, antud Kuu-keskses ICRF-is (`{ $v1 }`), propageeritud selle mootori enda Kepleri lahendajaga samas inertsiaalsüsteemis ja taandatud MCMF-i IAU 2015 / WGCCRE Kuu orientatsiooniga (pretsesseeruv pool, analüütiline füüsikaline libratsioon) igal epohhil. Süsteemi lähendust POLE: allikas nimetab süsteemi ja epohhi ning mõlemat kasutatakse. Päritoluklass `published-elements`: erineb igast kernelist tuletatud suurusest.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Avaldatud satelliidikonstellatsiooni MÄÄRATLUS, propageeritud selle mootori enda Kepleri lahendajaga ja taandatud keskmise pöörde Kuu pöörlemismudeliga — täpselt sama teed, mida illustreeriv satelliidikonstellatsioon läbib, nii et kahe käitamise ainus erinevus on satelliidikonstellatsiooni kavand. Allikas esitab elemendid süsteemis `{ $v1 }`; need loetakse siin MCI-na, mis kallutab satelliidikonstellatsiooni `published_frame_tie_angle_deg` võrra. Päritoluklass `published-elements`: erineb igast kernelist tuletatud suurusest.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = tundmatu station_datum { $other }: oodatud "fixed" või "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = VLBI kampaania vajab baasjoone moodustamiseks vähemalt 2 jaama, saadi { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = jaamal { $name } on mittelõplik koordinaat

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = jaama { $name } laiuskraad { $lat } deg on väljaspool vahemikku [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = seitsmeparameetriline Helmerti datum vajab vähemalt 3 mittekollineaarset majakat, saadi { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = majakal { $name } on mittelõplik koordinaat

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = majaka { $name } laiuskraad { $lat } deg on väljaspool vahemikku [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours peab olema positiivne ja lõplik, saadi { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min peab olema positiivne ja lõplik, saadi { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = { $v1 } epohhi ajakava ületab selle stsenaariumi 5000 epohhi piirangu; pikenda step_min või lühenda arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s peab olema positiivne ja lõplik, saadi { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg peab olema lõplik ja vahemikus [-90, 90), saadi { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg peab olema lõplik ja vahemikus [-90, 90), saadi { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol peab olema lõplik ja vahemikus [0, 1), saadi { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m peab olema positiivne ja lõplik, saadi { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver peab olema "spectral" või "srif", saadi "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = lunar-frame-campaign tulemuse serialiseerimine: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign =
    { $n_epochs ->
        [one] ükski vaatlus kampaanias ei ületa Maa-poolset kõrgusnurga maski { $mask } deg baasjoone mõlemas otsas JA maski { $earth_mask } deg majaka enda horisondi kohal: { $n_epochs } epohh x { $v1 } baasjoont x
       *[other] ükski vaatlus kampaanias ei ületa Maa-poolset kõrgusnurga maski { $mask } deg baasjoone mõlemas otsas JA maski { $earth_mask } deg majaka enda horisondi kohal: { $n_epochs } epohhi x { $v1 } baasjoont x
    } { $n_beacons ->
        [one] { $n_beacons } majakas, kõik tagasi lükatud. Pikenda arc_hours, langeta maski või liiguta jaamu.
       *[other] { $n_beacons } majakat, kõik tagasi lükatud. Pikenda arc_hours, langeta maski või liiguta jaamu.
    }

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = täisastak: kõiki 7 sarnasusparameetrit piirab see kampaania (tinglikkuse arv { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: { $defect } 7-st sarnasussuunast on sellest kampaaniast mittejälgitavad, seega datumi sigmat EI avaldata; mittejälgitavad suunad on loetletud seitsmeparameetrilises baasis

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines =
    { $n_beacons ->
        [one] lunar-frame-campaign | { $n_beacons } majakas x { $v1 } baasjoont x
       *[other] lunar-frame-campaign | { $n_beacons } majakat x { $v1 } baasjoont x
    } { $n_epochs ->
        [one] { $n_epochs } epohh
       *[other] { $n_epochs } epohhi
    } = { $n_obs ->
        [one] { $n_obs } vaatlus
       *[other] { $n_obs } vaatlust
    } (viivituse sigma { $sigma_tau } s) | jaama datum { $station_datum } | Helmerti astak { $rank }/7 tinglikkus { $condition } | datumi nihke sigma { $v5 } vs süstitud teisenduse taastamisviga { $trans_err_norm_m } m (suhe { $v7 })

engine-lunar-frame-campaign-of-beacons-have-no-observation = majakaid { $names } / { $beacons } ei sisalda selles ajakavas vaatlust ({ $names2 }); need ei kanna infot, nende sigmad on null ja datum realiseeritakse ainult vaadeldud majakatest

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = kõik sigmad peavad olema positiivsed

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane ja altitude_km peavad olema positiivsed

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency peab olema vahemikus (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m vs maapealne { $v2 } m asukoha sigma, keskmine q { $v3 } (hii-ruut 6 eeldab 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } mitmetähenduslikkust, ILS edukus { $last2 } (bootstrap { $last3 }) pikimal kaarel

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: väikseim infoomaväärtus x{ $v } orbiteri sidemetega, CRLB jälg x{ $v2 }

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } pühkimispunkti { $v } kaarel; laser vs GNSS x nihke sigma { $last2 } m registreeritud kohalikul sidemel

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB sigma h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = tundmatu uuring `{ $other }`: oodatud üks väärtustest { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = mõõtmiskomplekt ei määra orbiiti (singulaarne info)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials peab olema vähemalt 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = maapealsed sigmad peavad olema positiivsed

engine-e-lunar-infra-od-unknown-station-dss-14-dss = tundmatu jaam `{ $nm }`: DSS-14, DSS-63 või DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = liiga vähe maapealseid mõõtmisi orbiidi määramiseks

engine-e-lunar-infra-od-the-covariance-of-the-difference = vahe kovariatsioon on singulaarne

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = NRHO diferentsiaalparandus ei koondunud algväärtusest (seed)

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo vajab tingimust 0 < perilune kõrgus < apolune kõrgus

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = tundmatu orbiidiperekond `{ $other }`: nrho või elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s ja arc_days peavad olema positiivsed

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = vastuvõtjatel puudub ühine satelliit

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = kandelaine faasi normaalvõrrandid on singulaarsed

engine-e-lunar-infra-phase-the-position-block-is-singular = asukohaplokk on singulaarne

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = mitmetähenduslikkuste kovariatsioon ei ole positiivselt määratud

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = meetodi sigmad peavad olema positiivsed

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = kohaliku sideme sigmad peavad olema positiivsed

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz peab olema lõplik ja positiivne

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz peab olema lõplik ja positiivne

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k peab olema lõplik ja positiivne

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km peab olema lõplik ja Kuu raadiusest suurem

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity peab olema vahemikus [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw peab olema lõplik

engine-lunar-jamming-lunar-jamming-sats-epochs-links =
    lunar-jamming | { $n_sats ->
        [one] { $n_sats } satelliit
       *[other] { $n_sats } satelliiti
    }, { $n_epochs ->
        [one] { $n_epochs } epohh
       *[other] { $n_epochs } epohhi
    }, { $n_links ->
        [one] { $n_links } ühendus
       *[other] { $n_links } ühendust
    } punktist ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (keskmine { $mean_js_db }) | { $n_lost ->
        [one] { $n_lost } LOST
       *[other] { $n_lost } LOST
    } | kättesaadavus { $availability_under_jamming } nominaalsest { $availability_nominal }

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 =
    lunar-jamming | { $n_sats ->
        [one] { $n_sats } satelliit
       *[other] { $n_sats } satelliiti
    }, { $n_epochs ->
        [one] { $n_epochs } epohh
       *[other] { $n_epochs } epohhi
    }, { $n_links ->
        [one] { $n_links } ühendus
       *[other] { $n_links } ühendust
    } punktist ({ $site_lat_deg }, { $site_lon_deg }) | segajat pole (puhta taeva Kuu baastase) | { $n_lost ->
        [one] { $n_lost } LOST
       *[other] { $n_lost } LOST
    } | kättesaadavus { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = ootamatu peegelduskataloogi päis { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = lühike peegelduskataloogi rida { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = loetamatu peegeldaja väli { $i } real { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = peegeldaja { $f }: |(x,y,z)| = { $norm3 } m, kuid avaldatud raadiuse veerg ütleb { $radius } m — rida on muudetud

engine-e-lunar-llr-reflector-catalogue-has-no-rows = peegelduskataloogis pole ridu

engine-e-lunar-llr-unreadable-position-epoch-year = loetamatu position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = ootamatu jaamakataloogi päis { $t }

engine-e-lunar-llr-short-station-catalogue-row = lühike jaamakataloogi rida { $t }

engine-e-lunar-llr-unreadable-station-field-in = loetamatu jaama väli { $i } real { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = loetamatu ILRS id real { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = jaamakataloogis pole ridu

engine-e-lunar-llr-cannot-read-this-scenario-runs = ei saa lugeda { $path } ({ $e }). See stsenaarium töötab kataloogis { $DEFAULT_DATA_DIR } oleva kinnitatud päris andmete lõigu peal, mis tarnitakse hoidlaga, kuid mitte avaldatud crate'iga; suuna `data_dir` selle koopiale.

engine-e-lunar-llr-only-usable-normal-points-for = ainult { $used } kasutatavat normaalpunkti { $reflectors } peegeldaja kohta — liiga vähe, et piirata { $v3 } koordinaati; laienda arhiivilõiku

engine-e-lunar-llr-the-simulated-campaign-own-report = simuleeritud kampaania enda aruannet ei õnnestunud parsida: { $e }

engine-lunar-llr-lunar-llr-datum-archived-normal =
    lunar-llr-datum: { $used } arhiveeritud normaalpunkti ({ $n_parsed ->
        [one] { $n_parsed } parsitud
       *[other] { $n_parsed } parsitud
    }) { $station_counts } jaamast { $reflectors } retroreflektorimassiivini { $v5 } d jooksul; mõõdetud normaalpunkti korduvtäpsuse mediaan { $median } mm ühesuunaline; peegeldajate infoastak { $rank }/{ $n }; Helmerti astak { $rank2 }/{ $n_helmert } tinglikkus { $condition }; datumi nihke sigma { $v12 } m; vaadeldud-miinus-arvutatud ühesuunalise jääkvea RMS { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg peab olema lõplik ja vahemikus [-90, 90), saadi { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } sisaldab mittelõplikku koordinaati

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } laiuskraad { $lat_deg } deg on väljaspool vahemikku [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = lunar-llr-datum aruande serialiseerimine ebaõnnestus: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = integreerimissamm peab jagama väljundsammu

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not =
    { $n ->
        [one] { $n } peab olema lõplik ja mittenegatiivne
       *[other] { $n } peab olema lõplik ja mittenegatiivne
    }

engine-lunar-receiver-must-be-finite-and-positive =
    { $n ->
        [one] { $n } peab olema lõplik ja positiivne
       *[other] { $n } peab olema lõplik ja positiivne
    }

## src/lunar_service.rs

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: asukoha eksport: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = Kuu efemeriid { $path } katab { $until } s oma epohhist edasi, kuid stsenaariumi horisont ulatub { $last } s-ni; lühenda horizon_hours või hangi pikem kaar (tabuleeritud efemeriidi ekstrapoleerimisest keeldutakse)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path vajab epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = OP süsteem ajahetkel { $epoch } UTC (Maa näiv orbiidi normaal Kuu ümber, x piki selle sõlme IAU Kuu ekvaatoril); Kuu GM, J2 ja C22 IAU Kuuga seotud süsteemis, Maa ja Päike kolmanda kehana DE440 asukohtades failist { $spk_path }; neljandat järku Runge-Kutta, samm 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m peab olema lõplik ja positiivne

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m peab olema lõplik ja positiivne

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 vajab height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be =
    { $n ->
        [one] solution: min_satellites peab olema 3 või 4, saadi { $n }
       *[other] solution: min_satellites peab olema 3 või 4, saadi { $n }
    }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs peab olema 1 kuni 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } peab olema lõplik ja positiivne

engine-lunar-station-must-be-finite-and-not = { $name } peab olema lõplik ja mittenegatiivne

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } ületab piiri { $MAX_WORK }; vähenda n_trials, tee grid_lat_step_deg jämedamaks (või loetle vähem punkte) või suurenda t_step_s / lühenda t_span_s

engine-e-lunar-station-kind-must-be-got = kind peab olema { $KIND }; saadi { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: efemeriid { $path } katab { $until } s, kuid käitus ulatub { $last } s-ni (viimane epohh pluss latency_s); lühenda t_span_s

engine-e-lunar-station-no-case = { $KIND }: juhtu pole ({ $j }, { $i }, { $k })

engine-lunar-station-points-epochs-trials =
    { $n_grid_points ->
        [one] { $n_grid_points } punkt
       *[other] { $n_grid_points } punkti
    } · { $n_epochs ->
        [one] { $n_epochs } epohh
       *[other] { $n_epochs } epohhi
    } · { $n_trials ->
        [one] { $n_trials } katse
       *[other] { $n_trials } katset
    }

engine-lunar-station-hpl-max = HPL maks { $f }

engine-lunar-station-survey-latency-bits = mõõdistus { $survey_sigma_m } m · latentsus { $latency_s } s · { $quantization_bits } bitti

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines ja samples peavad olema 2 kuni { $MAX_DEM_SIDE }, saadi { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } kõrgust { $lines } x { $samples } ruudustiku jaoks

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m peab olema positiivne, saadi { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m peab olema positiivne, saadi { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: ei saa lugeda { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection peab olema south-polar-stereographic, saadi { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type peab olema int16-le, saadi { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: ei saa lugeda { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: ruudustik ületab { $MAX_DEM_SIDE } piksli piiri

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } on { $bytes } baiti; { $lines } x { $samples } int16 vajab { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: { $img } SHA-256 { $digest } ei ühti deskriptori väärtusega { $image_sha256 }

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor peab olema positiivne

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: ei saa lugeda { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: vajab vähemalt 2 x 2 punkti, kasvavat ulatust vahemikus [-90, 90] deg ja 360 deg pikkuskraadi ning lõplikke kõrgusi

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } peab olema lõplik ja positiivne, saadi { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m peab olema lõplik ja mittenegatiivne, saadi { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg peab olema kuni 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m peab olema 1 kuni 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: asukoht on kõrgusvälja väljaspool

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: esitatud horisont vajab mittetühja allikat

engine-e-lunar-terrain-terrain-stated-horizon = terrain: esitatud horisont: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: anna dem_path või dem_tile_path, mitte mõlemat

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km peab olema lõplik ja positiivne

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m peab olema lõplik ja positiivne

engine-e-lunar-terrain-site-deg-deg = { $e } (asukoht { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = tundmatu kell { $other }; oodatud üks väärtustest optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks peab nimetama vähemalt ühe kellaklassi

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s peab olema lõplik ja positiivne, saadi { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s peab olema lõplik ja suurem kui tau_min_s ({ $lo }), saadi { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade peab olema ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = liige { $name } on tau-ruudustikust lühem

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | kell { $clock } | 7-liikmeline x_Σ(τ) { $taus } τ-punkti kohta ({ $taus2 }–{ $taus3 } s) | ristumispunkt τ { $crossover_tau_s } s (x { $crossover_x_s } s) | süsteemi põhi { $frame_term_s } s | kell x(1 d) { $x_1day_ns } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: tundmatu kell { $other }; oodatud üks väärtustest optical-master, passive-h-maser, rafs, mini-rafs, või anna selle asemel device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: anna kas clock või device_card, mitte mõlemat

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must =
    { $n ->
        [one] time_lab: steer_interval_s peab olema lõplik ja positiivne, saadi { $n }
       *[other] time_lab: steer_interval_s peab olema lõplik ja positiivne, saadi { $n }
    }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } peab olema lõplik ja mittenegatiivne, saadi { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s peavad olema positiivsed arvud

engine-lunar-time-lab-station-height-not-modelled-exactly = jaama kõrgust ei modelleerita täpselt: { $height_sigma_m } m ühe sigma kõrgusviga nihutab kiirust { $value } ns/päevas, rakendatuna lineaarse liikmena alates viimasest juhtimisest

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = valguse levimisaeg ei koondunud 30 iteratsiooniga täpsuseni 1e-15 s

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = kerneli tee vajab koos planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = tundmatu datum { $other }: oodatud "anchor-first-station", "free-network" või "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = VLBI ajakava vajab baasjoone moodustamiseks vähemalt 2 jaama, saadi { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = majaka koordinaadid peavad olema lõplikud

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = majaka laiuskraad { $lat } deg on väljaspool vahemikku [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = { $v1 } epohhi ajakava ületab selle stsenaariumi 20000 epohhi piirangu; pikenda step_min või lühenda arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g peab olema positiivne ja lõplik, saadi { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = lunar-vlbi-fim tulemuse serialiseerimine: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule =
    { $n_epochs ->
        [one] ükski ajakava vaatlus ei ületa kõrgusnurga maski { $mask } deg baasjoone mõlemas otsas: { $n_epochs } epohh x { $v1 } baasjoont, kõik tagasi lükatud. Pikenda arc_hours, langeta elevation_mask_deg või liiguta jaamu.
       *[other] ükski ajakava vaatlus ei ületa kõrgusnurga maski { $mask } deg baasjoone mõlemas otsas: { $n_epochs } epohhi x { $v1 } baasjoont, kõik tagasi lükatud. Pikenda arc_hours, langeta elevation_mask_deg või liiguta jaamu.
    }

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = datum ei jäta hinnatavaid parameetreid

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: { $defect } / { $dim } suunast on mittejälgitavad, seega koordinaadipõhist sigmat ei anta; allpool olev jälgitava alamruumi väärtus on { $rank } jälgitavale suunale piiratud pseudo-pöördmaatriks ja EI ole jaama sigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines =
    lunar-vlbi-fim | { $n_stations ->
        [one] { $n_stations } jaam
       *[other] { $n_stations } jaama
    } / { $v2 } baasjoont x { $n_epochs ->
        [one] { $n_epochs } epohh
       *[other] { $n_epochs } epohhi
    } = { $n_obs ->
        [one] { $n_obs } vaatlus
       *[other] { $n_obs } vaatlust
    } (mask { $mask } deg) | datum { $datum } | astak { $rank }/{ $dim } tinglikkus { $condition } | jaama sigma { $v10 } vs equipartition g={ $g } { $eq_g } m (suhe { $v13 })

## src/main.rs

engine-main-error-validate-needs-scenario-path = viga: --validate vajab stsenaariumi teed

engine-main-error-study-needs-suite-manifest = viga: --study vajab komplekti manifesti teed

engine-main-error-study-name-needs-value = viga: --study-name vajab väärtust

engine-main-error-export-sp3-needs-path = viga: --export-sp3 vajab teed

engine-main-error-export-omm-needs-path = viga: --export-omm vajab teed

engine-main-error-export-oem-needs-path = viga: --export-oem vajab teed

engine-main-error-animate-needs-format-svg = viga: --animate vajab vormingut: svg, html, frames või all

engine-main-error-animate = viga: --animate: { $e }

engine-main-error-animate-fps-needs-whole = viga: --animate-fps vajab täisarvulist kaadrite arvu sekundis

engine-main-error-export-needs-format-czml = viga: --export vajab vormingut: czml, kml, geojson, stk, sigmf, all või list

engine-main-error-animate-duration-needs-length = viga: --animate-duration vajab pikkust sekundites

engine-main-error-import-route-needs-geojson = viga: --import-route vajab GeoJSON-faili teed

engine-main-error-eop-needs-finals2000a-file = viga: --eop vajab finals2000A faili teed

engine-main-error-unknown-option = viga: tundmatu valik '{ $other }'

engine-main-error-unexpected-argument-one-scenario = viga: ootamatu argument '{ $other }'; üks stsenaariumi fail käitluse kohta

engine-main-warning-animate-fps-and-animate = hoiatus: --animate-fps ja --animate-duration ei tee ilma --animate-ta midagi

engine-main-error-animate-exports-one-scenario = viga: --animate ekspordib ühe stsenaariumi käituse; seda ei saa kombineerida valikuga --validate või --study

engine-main-error-validate-lints-one-scenario = viga: --validate kontrollib ühte stsenaariumi; ära anna lisaks stsenaariumi faili

engine-main-error-cannot-read = viga: ei saa lugeda { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind lahendub; see kind ei nõua ühtegi välja (tühi keha käitab selle etalonseadistuse), seega polnud midagi rohkem kontrollida

engine-main-error-study-runs-suite-do = viga: --study käitab komplekti; ära anna lisaks üksikut stsenaariumi faili

engine-main-warning-study-name-is-ignored = hoiatus: --study-name ignoreeritakse koos --study-ga; uuringu pealkiri tuleb komplekti manifesti `title =` väärtusest

engine-main-error-cannot-read-2 = viga: ei saa lugeda { $path }: { $e }

engine-main-hint-kshana-example-lists-the = vihje: `kshana example` loetleb komplekteeritud etalonstsenaariumid; `kshana example clock-holdover > clock-holdover.toml` kirjutab ühe

engine-main-error-cannot-read-3 = viga: ei saa lugeda { $eop_file }: { $e }

engine-main-error-eop = viga: --eop: { $e }

engine-main-error-cannot-read-4 = viga: ei saa lugeda { $route_file }: { $e }

engine-main-error-import-route = viga: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: ei kehti: { $why }

engine-main-error-export = viga: --export: { $e }

engine-main-error-animate-2 = viga: --animate { $f }: { $e }

engine-main-error-export-2 = viga: { $fmt } eksport: { $e }

engine-main-error-cannot-write = viga: ei saa kirjutada { $json_path }: { $e }

engine-main-error-cannot-write-2 = viga: ei saa kirjutada { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = viga: ei saa aruannet koostada: { $e }

engine-main-error-cannot-write-3 = viga: ei saa kirjutada { $html_path }: { $e }

engine-main-error-cannot-write-4 = viga: ei saa kirjutada { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = viga: ei saa kirjutada { $csv_path }: { $e }

engine-main-wrote-and = kirjutati { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } ja { $csv_path }

engine-main-wrote-and-2 = kirjutati { $json_path }, { $svg_path }, { $html_path } ja { $report_json_path }

engine-main-error-cannot-write-6 = viga: ei saa kirjutada { $target }: { $e }

engine-main-error-cannot-write-7 = viga: ei saa kirjutada { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = viga: SP3 eksport ebaõnnestus: { $e }

engine-main-error-cannot-write-8 = viga: ei saa kirjutada { $omm_path }: { $e }

engine-main-error-omm-export-failed = viga: OMM eksport ebaõnnestus: { $e }

engine-main-error-cannot-write-9 = viga: ei saa kirjutada { $oem_path }: { $e }

engine-main-error-oem-export-failed = viga: OEM eksport ebaõnnestus: { $e }

engine-main-error-unexpected-argument-after-kinds = viga: ootamatu argument '{ $other }' pärast `kinds`; lubatud on ainult --json

engine-main-bundled-reference-scenarios-write-one =
    Komplekteeritud etalonstsenaariumid ({ $v1 }). Kirjuta üks faili ja käivita see:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (pole komplekteeritud: { $name } — põhjuse nägemiseks käivita `kshana example { $name }`)

engine-main-error-is-not-bundled-it = viga: '{ $name }' ei ole komplekteeritud: see { $why }

engine-main-error-no-bundled-scenario-named = viga: komplekteeritud stsenaariumi nimega '{ $name }' pole; `kshana example` loetleb need { $v1 }, mis on

engine-main-error-cannot-read-5 = viga: ei saa lugeda { $suite_path }: { $e }

engine-main-wrote-and-3 = kirjutati { $json_path } ja { $html_path }

engine-main-error-needs-value = viga: { $a } vajab väärtust

engine-main-error-expected-mean-needs-number = viga: --expected-mean vajab arvu

engine-main-error-unknown-imu-fit-option = viga: tundmatu imu-fit valik { $x }

engine-main-error-imu-fit-needs-an = viga: imu-fit vajab IMU logi teed

engine-main-error-needs-value-2 = viga: { $args } vajab väärtust

engine-main-error-epoch = viga: --epoch: { $e }

engine-main-error-unknown-bench-export-option = viga: tundmatu bench-export valik { $a }

engine-main-error-bench-export-needs-scenario = viga: bench-export vajab stsenaariumi teed

engine-main-needs-value = { $a } vajab väärtust

engine-main-site-takes-lat-lon-height = --site võtab argumendid lat,lon[,height_m], saadi { $v }

engine-main-error-is-bytes-the-tle = viga: { $p } on { $m } baiti; TLE piir on { $cap } (4 MiB)

engine-main-error-cannot-read-6 = viga: ei saa lugeda { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = tundmatu sky valik { $a }

engine-e-main-svg-and-monte-carlo-are = --svg ja --monte-carlo on eraldi väljundid; anna üks

engine-main-error-preset-needs-name =
    viga: --preset vajab nime
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    viga: --profile vajab faili
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } sümbolit, leiti kaadreid: { $r2 }; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }kaader kohal { $f }: FID { $f2 } TOI { $f3 } (SB1 mõõdik { $f4 }, SP vigu: { $f5 }, SB1 vigu: { $f6 })

engine-main-not-checked = kontrollimata: { $r }

engine-main-wrote-frame-of-6000-symbols = kirjutati { $out }: kaadreid: { $frames }, igaüks 6000 sümbolit; alamkaadrid 2 kuni 4 on kohahoidjad (ei ole LDPC-kodeeritud, teadet pole)

engine-main-error-cannot-write-10 = viga: ei saa kirjutada { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = tundmatu lunanet-afs-check alamkäsk { $other }

engine-main-needs-pack-id = { $cmd } vajab paketi id-d

engine-main-unknown-standards-pack-run-option = tundmatu standards-pack run valik { $a }

engine-main-unknown-standards-pack-subcommand = tundmatu standards-pack alamkäsk { $other }

engine-main-error-out-needs-value = viga: --out vajab väärtust

engine-main-error-unknown-compliance-report-option = viga: tundmatu compliance-report valik { $a }

engine-main-error-compliance-report-needs-at = viga: compliance-report vajab vähemalt ühte tulemuste .json faili

engine-main-runs-read-not-used-rows = loetud käitusi: { $runs }, kasutamata: { $unrecognised }; read: tõendatud { $n }, osaliselt { $n2 }, tõendamata { $n3 }, ulatusest väljas { $n4 }

engine-main-error-receiver-trust-needs-scenario = viga: receiver-trust vajab stsenaariumi teed

engine-main-error-invalid-receiver-trust-scenario = viga: vigane receiver-trust stsenaarium: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = põletus kulutab massi otsa: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, burn={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = lennuaeg peab olema positiivne

engine-e-maneuver-collinear-endpoints-transfer-plane-is = kollineaarsed otspunktid: üleminekutasand on määramata (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs on M >= 1 jaoks; M = 0 korral kasuta lambert

engine-e-maneuver-no-revolution-transfer-the-time = { $revs }-tiirulist üleminekut pole: lennuaeg on alla selle miinimumi

engine-e-maneuver-grid-step-days-must-be = grid_step_days peab olema positiivne, saadi { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = iga aken peab kulgema edasi (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = akendes pole nõutud tüüpi üleminekut

engine-e-maneuver-the-optimum-left-the-feasible = optimum lahkus lubatavast piirkonnast

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: oodatud 3 väärtust

engine-e-mars-od-dss-epoch-is-not-2003 = DSS-{ $id } epohh ei ole 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } puudub DXYZ

engine-e-mars-od-no-coordinates-for-dss = DSS { $station } koordinaate pole

engine-e-mars-od-no-ramps-for-dss = DSS { $station } ramp-e pole

engine-e-mars-od-ramp-table-does-not-cover = ramp-tabel ei kata intervalli

engine-e-mars-od-epoch-outside-the-integrated-span = epohh { $et } on väljaspool integreeritud ulatust

## src/mars_od.rs

engine-e-mars-od-normal-matrix-is-not-positive = normaalmaatriks ei ole positiivselt määratud

engine-e-mars-od-no-points = punkte pole

engine-e-mars-od-parameter-has-no-partial-on = parameetril puudub osatuletis säilitatud punktides

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays =
    mars-pnt { $r } | { $user } kasutaja, { $clock_class } kell | { $n_relays ->
        [one] { $n_relays } relee
       *[other] { $n_relays } releed
    } (keskmiselt { $mean_relays_in_view } nähtaval) | koondunud asukoha RMS { $converged_pos_rms_m } m, formaalne 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — kovariatsiooni FoM, mitte kinnitatud PL) | kella sageduse σ { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — { $user } kasutaja, { $clock_class } kell: 3-D asukohaviga vs tegelik (koondunud RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = paarvõrdlusmaatriks on tühi

engine-e-mcda-ahp-pairwise-matrix-is-not-square = paarvõrdlusmaatriks ei ole ruut (real { $i } on väärtuseid { $row }, vaja { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = element a[{ $i }][{ $j }] = { $v } peab olema lõplik ja positiivne

engine-e-mcda-ahp-diagonal-must-be = diagonaal a[{ $i }][{ $i }] = { $row } peab olema 1

engine-e-mcda-ahp-entries-must-be-reciprocal = elemendid a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } peavad olema pöördarvud (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = ülemisel real { $i } on elemente { $row }, oodatud { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = ülemine element ({ $i },{ $j }) = { $v } peab olema lõplik ja positiivne

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: tühi otsusemaatriks

engine-e-mcda-copras-copras-no-criteria = COPRAS: kriteeriume pole

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS: kaalude arv { $n }, kuid kriteeriumitüüpide arv { $types }

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: nõuab vähemalt ühte kulukriteeriumi (Min)

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS: alternatiivil { $i } on väärtuseid { $row }, kuid kriteeriumide arv on { $n }

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: alternatiivi { $i } kriteeriumi { $j } väärtus { $x } peab olema lõplik ja > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: tühi andmestik

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: kriteeriume pole

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I: alternatiivil { $i } on väärtuseid { $row }, kuid kriteeriumide arv on { $n }

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: alternatiivil { $i } on mittelõplik väärtus

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: tühi otsusemaatriks

engine-e-mcda-moora-moora-no-criteria = MOORA: kriteeriume pole

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA: kaalude arv { $n }, kuid kriteeriumitüüpide arv { $types }

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA: alternatiivil { $i } on väärtuseid { $row }, kuid kriteeriumide arv on { $n }

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: alternatiivil { $i } on mittelõplik väärtus

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: kriteeriumi { $j } L2 norm on null

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: tühi otsusemaatriks

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: kriteeriume pole

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II: kaalude arv { $n }, kuid tüüpide arv { $types } / eelistusfunktsioonide arv { $prefs }

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II: alternatiivil { $i } on väärtuseid { $row }, kuid kriteeriumide arv on { $n }

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: alternatiivil { $i } on mittelõplik väärtus

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: tühi otsusemaatriks

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: kriteeriume pole

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS: kaalude arv { $n }, kuid kriteeriumitüüpide arv { $types }

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS: alternatiivil { $i } on väärtuseid { $row }, kuid kriteeriumide arv on { $n }

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: alternatiivil { $i } on mittelõplik väärtus

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = aditiivsel kasulikkusel puuduvad atribuudid

engine-e-mcda-utility-attributes-but-weights = atribuutide arv { $attributes }, kuid kaalude arv { $weights }

engine-e-mcda-utility-invalid-scaling-constant = vigane skaleerimiskonstant { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = skaleerimiskonstantide summa on null

engine-e-mcda-utility-attribute-values-expected-got = oodatud atribuudiväärtuste arv { $attributes }, saadi { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: tühi otsusemaatriks

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: kriteeriume pole

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR: kaalude arv { $n }, kuid kriteeriumitüüpide arv { $types }

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR: alternatiivil { $i } on väärtuseid { $row }, kuid kriteeriumide arv on { $n }

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: alternatiivil { $i } on mittelõplik väärtus

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: tühi otsusemaatriks

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: kriteeriume pole

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS: kaalude arv { $n }, kuid kriteeriumitüüpide arv { $types }

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } peab olema vahemikus [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS: alternatiivil { $i } on väärtuseid { $row }, kuid kriteeriumide arv on { $n }

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: alternatiivi { $i } kriteeriumi { $j } väärtus { $x } peab olema lõplik ja > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: tühi otsusemaatriks

engine-e-mcda-wpm-wpm-no-criteria = WPM: kriteeriume pole

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM: kaalude arv { $n }, kuid kriteeriumitüüpide arv { $types }

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM: alternatiivil { $i } on väärtuseid { $row }, kuid kriteeriumide arv on { $n }

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: alternatiivi { $i } kriteeriumi { $j } väärtus { $x } peab olema lõplik ja > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = otsusemaatriksis pole kriteeriume

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = otsusemaatriksis pole alternatiive

engine-e-mcda-wsm-criterion-has-an-invalid-weight = kriteeriumil '{ $name }' on vigane kaal { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = kriteeriumide kaalude summa on null

engine-e-mcda-wsm-alternative-has-values-but-there = alternatiivil '{ $name }' on väärtuseid { $values }, kuid kriteeriumide arv on { $n }

engine-e-mcda-wsm-alternative-has-non-finite-value = alternatiivil '{ $name }' on kriteeriumil '{ $value }' mittelõplik väärtus

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = ei ole DAF: lühem kui üks kirje

engine-e-naif-kernel-not-daf-identification-word = ei ole DAF: tunnussõna { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = toetamata DAF binaarvorming { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = ebausutav DAF päis: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF aadress { $addr } on faili lõpust kaugemal

engine-e-naif-kernel-bad-daf-address-range = vigane DAF aadressivahemik { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = DAF kokkuvõtete loend ei lõpe

engine-e-naif-kernel-daf-summary-record-claims-summaries = DAF kokkuvõtte kirje { $rec } väidab kokkuvõtete arvuks { $count }

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = vigane tüüp-2 segment: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = tüüp-2 segmendi suurus ei ühti selle kataloogiga

engine-e-naif-kernel-epoch-outside-the-record = epohh { $et } on kirjest väljaspool [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = tüüp-1 segmendi suurus ei ühti selle väärtusega N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = vigane tüüp-1 kirje: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = ei ole SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = SPK kokkuvõte ei ole ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = keha { $target } kohta puuduvad SPK tüüp-1/2 andmed ajahetkel ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = SPK segment keha { $target } jaoks on süsteemis { $frame }, mitte J2000

engine-e-naif-kernel-spk-centre-chain-does-not = SPK keskmete ahel ei ulatu barütsentrini

engine-e-naif-kernel-not-binary-pck = ei ole binaarne PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = PCK kokkuvõte ei ole ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = süsteemi { $body_frame } kohta puuduvad PCK tüüp-2 andmed ajahetkel ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = PCK süsteem { $body_frame } on antud süsteemi { $other } suhtes, mis ei ole J2000 ega ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = vigane arv { $s }

engine-e-navsignal-must-be-positive-number = { $s } peab olema positiivne arv

engine-e-navsignal-modulation-expected-name-args-bpsk = modulatsioon { $label }: oodatud NAME(args), nt BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulatsioon { $label }: sulgev sulg puudub

engine-e-navsignal-modulation-is-not-one-of = modulatsioon { $label } ei ole ükski kujudest BPSK(n), BOC(m,n) või MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = lõpetamata olem real { $s }

engine-e-ndm-xml-bad-character-reference = vigane märgiviide &{ $ent };

engine-e-ndm-xml-unknown-entity = tundmatu olem &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = lõpetamata töötlusjuhis

engine-e-ndm-xml-unterminated-comment = lõpetamata kommentaar

engine-e-ndm-xml-unterminated-declaration = lõpetamata deklaratsioon

engine-e-ndm-xml-expected-an-element-at-byte = oodatud element baidil { $pos }

engine-e-ndm-xml-unterminated-start-tag = lõpetamata algussilt

engine-e-ndm-xml-attribute-without-value = atribuut ilma väärtuseta

engine-e-ndm-xml-unterminated-attribute-value = lõpetamata atribuudi väärtus

engine-e-ndm-xml-unterminated-end-tag = lõpetamata lõpusilt

engine-e-ndm-xml-unterminated-cdata = lõpetamata CDATA

engine-e-ndm-xml-content-after-the-root-element = sisu pärast juurelementi

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } peab olema lõplik ja mittenegatiivne

engine-e-nma-budget-subframe-must-be-positive = subframe_s peab olema positiivne

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps peab olema positiivne

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed peab olema 0 või positiivne

engine-e-nmea-synth-cli-unexpected-argument = ootamatu argument { $s }

engine-nmea-synth-cli-instructor-log = instruktori logi: { $e }

engine-nmea-synth-cli-instructor-log-and = instruktori logi: { $jp } ja { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP server kuulab aadressil { $s }; ootab kliente: { $wait_clients }

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = oodatud YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = kuupäev või kellaaeg on vahemikust väljas (aastad 1980 kuni 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = sellist kalendrikuupäeva pole

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } peab olema lõplik arv

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s peab olema vahemikus 1 kuni 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz peab olema 1, 2, 5 või 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = laeva asukoht peab jääma 89 kraadi piiresse ekvaatorist

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn peab olema vahemikus 0 kuni 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = laeva pöördekiiruse ja kiirenduse piirid peavad olema positiivsed

engine-e-nmea-synth-config-give-at-least-one-waypoint = anna vähemalt üks [[waypoint]] või vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = teekonnapunkt { $v1 } on vahemikust väljas

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = teekonnapunkti { $v1 } speed_kn peab olema vahemikus 0 kuni 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems peab nimetama vähemalt ühe satelliidikonstellatsiooni

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } ei ole ükski väärtustest { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s peab olema vähemalt 1

engine-e-nmea-synth-config-event = sündmus { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s peab jääma käituse sisse

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s peab olema positiivne; ramp_s ja recovery_s ei tohi olla negatiivsed

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s ei tohi ületada duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } ei kehti sellele liigile

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz peab olema vahemikus 20 kuni 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db on kohustuslik

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db peab olema vahemikus 0 kuni 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db peab olema vahemikus 0 kuni 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m on kohustuslik

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m peab olema vahemikus 0 kuni 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = äratõmme kiirendaks võltsrada kuni { $need } m/s^2, mis ületab väärtuse max_accel_mps2 = { $a }; pikenda ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = anna täpselt üks väärtustest bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s on kohustuslik

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s peab olema nullist erinev ja ööpäeva piires

engine-e-nmea-synth-config-delay-is-required = delay_s on kohustuslik

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s peab olema vahemikus 0 kuni 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = taevapiir ei kirjelda ühtegi takistust

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } on lõppenud

engine-nmea-synth-gen-the-receiver-reports-fix-again = vastuvõtja annab taas lahendi (kasutatud satelliite: { $n_used })

engine-nmea-synth-gen-the-receiver-has-no-fix = vastuvõtjal pole lahendit (kasutatavaid satelliite: { $n_used }, vaja neli)

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = alates T+{ $start_s } s kestusega { $duration_s } s (algusramp { $ramp_s } s, taastumisramp { $recovery_s } s)

engine-nmea-synth-log-jamming-received-n0-falls-by = segamine: vastuvõetud C/N0 langeb kuni { $cn0_drop_db } dB (satelliidipõhine hajuvus { $spread_db } dB); satelliidid langevad välja ja lahend kaob, kui kasutatavaid jääb alla nelja

engine-nmea-synth-log-towards-deg-true = suunas { $b } deg tõene

engine-nmea-synth-log-towards-deg-true-deg-relative = suunas { $t } deg tõene ({ $r } deg suhtes kursiga alguse hetkel, seejärel hoitud)

engine-nmea-synth-log-natural-degradation-the-sky-closes = loomulik halvenemine: taevas sulgub esitatud taevapiiri taga ({ $e }); selle taga olevad satelliidid jäävad loendisse ilma SNR-ita ja neid ei kasutata, ülejäänute C/N0 on muutumatu ja miski pole võlts

engine-nmea-synth-log-instructor-log = INSTRUKTORI LOGI: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Treeneri märkus: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Algus { $start_utc }   kestus { $duration_s } s   algväärtus (seed) { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }TIPUD  tegelik: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   raporteeritud: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: tundmatu satelliidikonstellatsioon { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Tolerants on alla f64 astaku lugemise müra põhitaseme { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): selle samaväärne omaväärtuse põhi rel_tol^2 = { $v1 } jääb Grami maatriksi ümardusmüra alla, seega lisasuunad on aritmeetiline jääk, mitte jälgitavus.

engine-observability-gramian-rank-clamped-from-the-singular = astak piiratud singulaarväärtuste arvult { $counted } väärtuseni min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } kui rel_tol { $rel_tol }: { $n_rows }x{ $n_cols } maatriksi astak ei saa olla { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP on määramata (astakupuudulik / singulaarne geomeetria): astak { $rank } olekust { $n }, datumi defekt { $v3 }, tinglikkus { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } baiti ei ole 36-baidiste kirjete täisarv

engine-e-odf-record-precedes-any-group-header = kirje { $v1 } eelneb igale grupipäisele

engine-e-odf-no-orbit-data-group = orbiidiandmete gruppi pole

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } ei ole { $name } märksõna

engine-e-odm-without = { $name } ilma { $k }

engine-e-odm-needs-exactly-one-of = { $name } vajab täpselt ühte väärtustest { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION ja MESSAGE_ID on versiooni 3.0 päise märksõnad (versioon { $version })

engine-e-odm-unexpected-line = ootamatu rida { $b }

engine-e-odm-unknown-keyword = tundmatu märksõna { $k }

engine-e-odm-block-repeated-or-out-of = { $block } plokk on korratud või vales järjekorras kohas { $key }

engine-e-odm-repeated = { $key } on korratud

engine-e-odm-comments-after-the-last-keyword = kommentaarid pärast viimast märksõna

engine-e-odm-given-twice = { $b } on antud kaks korda

engine-e-odm-opm-without-metadata = OPM ilma metaandmeteta

engine-e-odm-opm-without-state-vector = OPM ilma olekuvektorita

engine-e-odm-omm-without-metadata = OMM ilma metaandmeteta

engine-e-odm-omm-without-mean-elements = OMM ilma keskmiste elementideta

engine-e-odm-is-not-keyword-of-the = { $k } ei ole { $kind } ploki märksõna

engine-e-odm-block-without = { $kind } plokk ilma { $k }

engine-e-odm-block-with-data-lines = { $kind } plokk andmeridadega

engine-e-odm-line-has-values-expected = { $kind } real { $l } on väärtuseid { $l2 }, oodatud { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } ei ole OCM metaandmete märksõna

engine-e-odm-ocm-metadata-without = OCM metaandmed ilma { $k }

engine-e-odm-block-repeated = { $kind } plokk on korratud

engine-e-odm-inside-block = { $t } ploki sees

engine-e-odm-unsupported-ocm-block = toetamata OCM plokk { $tag }

engine-odm-outside-block = { $t } väljaspool plokki

engine-e-odm-closes-block = { $t } sulgeb { $want } ploki

engine-e-odm-unexpected-line-2 = ootamatu rida { $t }

engine-e-odm-outside-block = { $k } väljaspool plokki

engine-e-odm-unterminated-block = lõpetamata plokk

## src/oem.rs

engine-e-oem-epoch-missing-date-time-separator = epohhil puudub kuupäeva ja kellaaja eraldaja 'T': { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = toetamata OEM epohhi kuupäev '{ $date }' (oodatud yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = toetamata OEM epohhi kellaaeg '{ $time }' (oodatud HH:MM:SS)

engine-e-oem-bad-epoch-year = vigane epohhi aasta: { $d }

engine-e-oem-bad-epoch-month = vigane epohhi kuu: { $d }

engine-e-oem-bad-epoch-day = vigane epohhi päev: { $d }

engine-e-oem-bad-epoch-hour = vigane epohhi tund: { $t }

engine-e-oem-bad-epoch-minute = vigane epohhi minut: { $t }

engine-e-oem-bad-epoch-second = vigane epohhi sekund: { $t }

engine-e-oem-oem-epoch-field-out-of = OEM epohhi väli on vahemikust väljas: { $s }

engine-e-oem-unexpected-oem-header-line = ootamatu OEM päiserida: { $line }

engine-e-oem-expected-meta-start-found = oodatud META_START, leiti: { $line }

engine-e-oem-unexpected-oem-metadata-line = ootamatu OEM metaandmete rida: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM segmendi metaandmetest puudub META_STOP

engine-e-oem-oem-metadata-missing-object-name = OEM metaandmetest puudub OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = OEM metaandmetest puudub OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = OEM metaandmetest puudub CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = OEM metaandmetest puudub REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = OEM metaandmetest puudub TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = OEM metaandmetest puudub START_TIME

engine-e-oem-oem-metadata-missing-stop-time = OEM metaandmetest puudub STOP_TIME

engine-e-oem-oem-data-line-needs-position = OEM andmerida vajab asukoha+kiiruse (6) või +kiirenduse (9) komponente, saadi { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = mittenumbriline OEM olekuväärtus '{ $t }' real: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM-ist puudub päis CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = OEM-ist puudub päis CREATION_DATE

engine-e-oem-oem-missing-originator-header = OEM-ist puudub päis ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM ei sisaldanud segmente

engine-oem-oem-interop-round-tripped-segment = oem-interop: tsükliliselt läbitud segmente: { $segments }, olekuid { $n_states_total }; maksimaalne tsükli viga { $p } km / { $v } km/s (MODELLED interop)

engine-oem-oem-interop-ingested-segment-states = oem-interop: sisse loetud segmente: { $segments }, olekuid { $n_states_total } välisest OEM-ist (koostaja { $originator }) (MODELLED interop)

engine-e-oem-no-covariance-start-block = plokki COVARIANCE_START pole

engine-e-oem-no-covariance-stop = COVARIANCE_STOP puudub

engine-e-oem-bad-covariance-value = vigane kovariatsiooni väärtus '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = oodatud 21 kovariatsiooni väärtust, leiti { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM eksport vajab täielikke (rida 1 + rida 2) TLE-sid; selles plokis neid pole

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } peab olema vahemikus [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg peab olema vahemikus [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave peab olema "plane" või "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction peab olema "downlink" või "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = availability_targets_pct kirjed peavad olema vahemikus (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h peab olema kuni 8760 (üks aasta)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } sammu ületab tulemuse piiri { $MAX_STEPS }; suurenda step_s või lühenda duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = tundmatu kellaklass "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = igal asukohal peab olema nimi

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = asukoht { $name }: laius-/pikkuskraad on vahemikust väljas

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = asukoht { $name }: altitude_m peab olema vahemikus [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm kõrgusnurgal { $elevation_deg } deg, varu { $margin0 } dB enne atmosfääri; parim asukoht { $scn } { $v5 } %; { $order }-asukohaline võrk { $last } % sõltumatu / { $last2 } % korreleeritud ilmaga (MODELLED, nõuandev)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = RINEX plokk parsiti, kuid see ei sisaldanud toetatud efemeriide

## src/orbit.rs

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg peab olema vahemikus [-90, 90] ja iga väli lõplik

engine-e-orbit-no-satellites-to-export = eksportimiseks pole satelliite

engine-e-orbit-time-step-must-be-positive = time.step_s peab SP3 ekspordi jaoks olema positiivne

engine-e-orbit-time-step-must-be-positive-2 = time.step_s peab OEM ekspordi jaoks olema positiivne

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } peab olema positiivne; saadi { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s peab olema lõplik ja mittenegatiivne

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate peab olema lõplik ja mittenegatiivne

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = spuuferi minimaalne kõrgusnurk peab olema vahemikus [0, 90) kraadi

engine-e-orbital-timing-cross-check-sigma-ns-must = ristkontrolli sigma_ns peab olema lõplik ja mittenegatiivne

engine-orbital-timing-the-in-plane-neighbour-degrees = samal orbiiditasandil olev naaber, { $v1 } kraadi ees, jääb ühe spuuferi leviala välja ({ $v2 } kraadi ulatuses)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = samal orbiiditasandil olev naaber, { $v1 } kraadi ees, võib jääda sama spuuferi leviala sisse ({ $v2 } kraadi ulatuses), seega võib mõlemat kella koos mõjutada

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = sisendfail puudub

engine-e-osnma-cli-max-time-error-has-no = --max-time-error ei mõju ilma --reference-time-ita

engine-e-osnma-cli-not-number = ei ole arv: { $s }

engine-e-osnma-cli-public-key-must-be-id = avalik võti peab olema kujul ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = avaliku võtme tüüp peab olema p256 või p521

engine-e-osnma-cli-unknown-format = tundmatu vorming { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } ei ole tekst; UBX-voo jaoks kasuta --format ubx

engine-e-osnma-cli-vector-csv-needs-start-gst = vektori-CSV vajab valikut --start-gst või kuupäevaga failinime

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    viga: ei saa lugeda { $input }: { $e }

engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA kontroll
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = sisend: { $input } (lehti: { $pages })

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: kaadreid { $frames }; I/NAV lehti dekodeeritud { $inav_pages }, ajas paigutatud { $pages } (vigane CRC { $bad_crc }, paigutamatuid { $unstamped }, ajakonflikte { $time_conflicts })

engine-osnma-cli-overall-nma-status = üldine: { $status_word }   NMA olek: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = HOIATUS: võeti vastu kontrollitud OSNMA hoiatusteade. Lõpeta OSNMA andmete kasutamine; midagi ei raporteerita autentituna.

engine-osnma-cli-freshness-not-enforced-no-reference = värskus: EI rakendata. Etalonaega ei antud, seega võetakse alamkaadrite ajad sisendist ja vanade andmete taasesitus autentiks.

engine-osnma-cli-freshness-sub-frames-within-of = värskus: kasutatakse alamkaadreid, mis jäävad etalonajast { $v2 } { $max_err } s piiresse; kõrvale jäeti { $set_aside }. Etalonaeg on üks ajahetk.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satelliit  olek            autenditud  ebaõnnestunud  ootel  hüljatud  viimati autenditud

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epohh (sildi alamkaader)      tx   andmed  adkd  ctr  tulemus

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = rida { $v1 }: oodatud 3 välja

engine-e-osnma-input-line-bad-svid = rida { $v1 }: vigane SVID

engine-e-osnma-input-line-bad-bit-count = rida { $v1 }: vigane bittide arv

engine-e-osnma-input-line-data-is-not-hex = rida { $v1 }: andmed ei ole kuueteistkümnendkoodis

engine-e-osnma-input-line-bit-count-does-not = rida { $v1 }: bittide arv ei ühti andmetega

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = ajatolerants peab olema väiksem kui üks alamkaader ({ $SUBFRAME_S } s), saadi { $t } s

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834 murdumine on defineeritud jaama kõrgustele 0 kuni 3 km; saadi { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s ja step_s peavad olema positiivsed

engine-e-passes-station-lat-deg-must-be = station_lat_deg peab olema vahemikus [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg peab olema vahemikus [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours peab olema lõplik ja positiivne

engine-e-passes-step-must-be-finite-and = step_s peab olema lõplik ja positiivne

engine-passes-passes-pass-es-of-km = passes: ülelende { $passes }; orbiit { $altitude_km } km / { $inclination_deg }° punkti ({ $station_lat_deg }°, { $station_lon_deg }°) kohal > { $mask_deg }° { $duration_hours } h jooksul; kokku { $total_access_s } s juurdepääsu (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = lühike { $record } kirje: { $line }

engine-e-precise-products-bad-number-in = vigane arv { $s } real { $line }

engine-e-precise-products-bad-field-in = vigane väli { $s } real { $line }

engine-e-precise-products-bad-antex-epoch = vigane ANTEX epohh { $s }

engine-e-precise-products-bad-offset = vigane nihe { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = efemeriidiallikal puudub geotsentriline { $name } ajahetkel JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D vea RMS { $rms } m (maks { $max } m)

engine-pvt-post-fit-rms = { " " }| sobitusjärgne RMS { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved =
    pvt { $r } | { $n_satellites_nav ->
        [one] { $n_satellites_nav } nav-satelliit
       *[other] { $n_satellites_nav } nav-satelliiti
    } | lahendatud epohhe { $epochs_solved }/{ $epochs_total } | keskmiselt { $mean_n_used } sat, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Üksikpunktpositsioneerimine — 3D viga vs mõõdistatud koordinaat (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Üksikpunktpositsioneerimine — sobitusjärgne jääkvea RMS (keskmiselt { $mean_postfit_rms_m } m)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = RunOutput-i massiivipäringud vajavad NumPy-d (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } ei ole arvmassiiv (arvude loend või võrdse pikkusega arvuloendite loend)

engine-e-python-is-not-non-empty-list = { $path } ei ole kirjete mittetühi loend

engine-e-python-and-must-be-the-same = i ja q peavad olema sama pikkusega ({ $i } vs { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: haaramata (statistik { $statistic } < lävi { $threshold })

engine-python-design-prn-channels-at-most = { $designs } (kavand, PRN) kanalit; kuni 256 pühkimise kohta

engine-python-not-acquired-statistic-threshold = { $code }: haaramata (statistik { $statistic } < lävi { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] vajab `label`

engine-e-python-runs-needs-result = runs[{ $i }] vajab `result`

engine-e-python-must-be-between-and-32 = { $name } peab olema vahemikus 0 kuni 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | algväärtus (seed) { $seed } | v{ $engine_version } | kvant võidab { $value }/{ $foms } FoM-is | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } allikast { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = tundmatu baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = tundmatu candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = ADEV taus/values peavad olema lõplikud ja > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | kandidaat { $candidate_source } | aja holdover { $timing_holdover_s }s vs { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inertsiaalne { $inertial_holdover_s }s vs { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | vastupidavuse väljasõit { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = RINEX kellafail deklareerib ajasüsteemi { $id }, mida see lugeja ei tunne (tuntud: { $known_clock_time_systems }); fail lükatakse tagasi, selle asemel et lugeda selle epohhe GPS-ajana

engine-e-realdata-clk-rinex-clock-file-has-satellite = RINEX kellafailis on satelliidisüsteem { $other } ja see ei deklareeri TIME SYSTEM ID-d; keeldutakse selle epohhide ajasüsteemi ära arvamast

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX kellafailid deklareerivad erinevaid ajasüsteeme ({ $s } ja { $ts }); keeldutakse neid ühele ajateljele ühendamast

engine-e-realdata-clk-no-as-or-ar-records = objektile { $id } pole AS ega AR kirjeid

engine-e-realdata-clk-short-circular-row = lühike Circular T rida: { $t }

engine-e-realdata-clk-bad-value-in = vigane väärtus { $s } real { $t }

engine-e-realdata-clk-no-section-mjd-header-found = Section 1 MJD päist ei leitud

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = lõpetamata sulgemissilt

engine-e-realdata-ion-sdr-unbalanced-closing-tag = tasakaalustamata sulgemissilt

engine-e-realdata-ion-sdr-unterminated-tag = lõpetamata silt

engine-e-realdata-ion-sdr-attribute-value-missing = atribuudi väärtus puudub

engine-e-realdata-ion-sdr-element-outside-the-document = element dokumendist väljaspool

engine-e-realdata-ion-sdr-text-outside-the-document = tekst dokumendist väljaspool

engine-e-realdata-ion-sdr-element-left-open = lahtiseks jäänud elemente: { $stack }

engine-e-realdata-ion-sdr-expected-one-root-element-found = oodatud üks juurelement, leiti: { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = tundmatu sagedusvorming { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = toetamata kodeering { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = vooge: { $streams }; loetakse ainult ühe vooga faile

engine-e-realdata-ion-sdr-block-of-cycles-with-header = { $cycles } tsükli plokk päise või jalusega kordub; loetakse ainult ühte kogu faili hõlmavat plokki

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = tükk { $words_per_chunk } sõnast, igaüks { $word_bytes } baiti

engine-e-realdata-ion-sdr-unsupported-sample-format = toetamata valimivorming { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = kvantimine { $quantization } pakitud { $packed_bits } bitiga valimi kohta

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = valimisagedus { $sample_rate_hz } Hz ei ole sagedustegurist { $samples_per_lump } täisarvuline kordne

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = tükk ei sisalda ühtegi tervet kimpu

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = nõutud valimid { $start }..{ $v1 }, fail sisaldab { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = loetamatu CRD versioon { $f }

engine-realdata-llr-crd-crd-format-version-is-not = CRD vormingu versioon { $v } ei ole toetatud (ainult 1 ja 2 jagavad kirje-11 väljade järjekorda, millele see lugeja toetub)

engine-realdata-llr-crd-unreadable-station-id = loetamatu jaama id { $f }

engine-realdata-llr-crd-unreadable-time-scale = loetamatu ajaskaala { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD epohhi ajaskaala { $time_scale } ei ole ükski kolmest, mida vormingu spetsifikatsioon analüütikutele lubab (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); keeldutakse seda UTC-na lugemast

engine-realdata-llr-crd-unreadable-h4-field = loetamatu h4 väli { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = loetamatu väli { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = loetamatu epohhi sündmus { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = mittefüüsikaline lennuaeg { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = ei saa lugeda normaalpunktide kataloogi { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = kataloogis { $dir } pole *.npt normaalpunktide faile — see stsenaarium loeb päris arhiveeritud mõõtmisi ega käitu ilma nendeta

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = vigane arv '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM-il on null mõõde

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = kodeering { $encoding }: LuGRE partii on kahendkomplement

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } baiti: lühem kui IQS päis

engine-e-realdata-lugre-not-an-iqs-frame = ei ole IQS kaader: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = valimisagedus: metaandmed { $sample_rate_hz } Hz, päis { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = kvantimine: metaandmed { $quantization } bitti, päis { $quant_bits } bitti

engine-realdata-lugre-centre-frequency-metadata-hz-header = keskmine sagedus: metaandmed { $center_freq_hz } Hz, päis { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = vahesagedus: metaandmed { $translated_freq_hz } Hz, päis { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = valimite arv: metaandmete paigutus annab { $layout }, päis { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = päis/jalus: metaandmed { $header_bytes }/{ $footer_bytes } baiti, vorming { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = faili pikkus { $file_len } ei ole päis + { $value } valimibaiti + jalus

engine-realdata-lugre-field-missing = väli { $key } puudub

engine-e-realdata-lugre-field-unreadable = väli { $key } on loetamatu

engine-realdata-lugre-raw-line = RAW rida { $v1 }: { $e }

engine-realdata-lugre-acq-line = ACQ rida { $v1 }: { $e }

engine-realdata-lugre-nav-line = NAV rida { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK rida { $v1 }: loetamatu

engine-e-realdata-lugre-clk-row-columns-expected = CLK rida { $v1 }: veerge { $v }, oodatud 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = JSON-i parsimine: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = oodatud JSON-objekt ülemisel tasemel

engine-e-realdata-yunnan-missing-recordtime-array = recordTime massiiv puudub

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = ei saa lugeda EOP faili { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s peab olema lõplik ja mittenegatiivne, saadi { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = ei saa lugeda hilisema väljalaske EOP faili { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = TÜHI, ja see on tahtlik: ennustatud-versus-lõpliku rea jaoks on vaja väljaandmise epohhi, mille taga on TÄIELIK { $window_days }-päevane sobitusaken, ning avaldatud Bulletin B lõplikku väärtust sihtepohhil. Kehtiv sisend ({ $eop_source }) ei anna ühtegi epohhi, mis vastaks mõlemale. Lühenda `operational_window_days` või anna pikem päris finals2000A rida — tabeli täitmiseks ei valmistata ühtegi rida.

engine-realtime-frame-eop-measured-over-the-real-series = Mõõdetud kehtiva päris rea ({ $eop_source }) põhjal. Iga rida on tõeline ennustusviga: T+h ennustus, mis on moodustatud T hetkel või varem avaldatud kiirete Bulletin A ridade põhjal ja hinnatud HILJEM AVALDATUD Bulletin B lõpliku väärtuse vastu hetkel T+h. Püsivust hinnatakse identsel epohhide hulgal identsete lõplike väärtuste vastu, seega erinevad kaks veergu ennustaja poolest ja mitte millegi muu poolest. `improvement_factor` alla 1 tähendab, et operatiivne ennustaja on sellel horisondil püsivusest HALVEM ja seda ka nii raporteeritakse.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Mõõdetud tõelise kahe väljalaskega paari põhjal: välja antud väljalase ({ $eop_source }) sisaldab päris Bulletin A ennustusi oma andmepiirist kaugemale ja arhiveeritud hilisem väljalase ({ $c }) sisaldab Bulletin B lõplikke väärtusi, mille need kuupäevad lõpuks said. Selle lõpliku väärtuse vastu hinnatakse kolme ennustust — arhiveeritud Bulletin A ennustus ise, selle crate'i operatiivlaadne sobitus välja antud väljalaske peal ja püsivus andmepiiril.

engine-realtime-frame-eop-empty-and-deliberately-so-later = TÜHI, ja see on tahtlik: esitati hilisem väljalase ({ $c }), kuid ühtegi kuupäeva ei kanta välja antud failis ({ $eop_source }) Bulletin A PREDICTION-ina ja hilisemas failis Bulletin B LÕPLIKU väärtusena üheski nõutud horisondis. Ühtegi rida ei sünteesita.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = TÜHI, ja see on tahtlik. TÕELISE ARHIVEERITUD ennustuse hindamiseks on vaja sama finals2000A toote kahte väljalaset; sellele käitusele anti üks ({ $eop_source }). Hoidla ei tarni arhiveeritud varasemat väljalaset ja seda EI valmistata olemasoleva väljalaske häirimisel — sünteesitud arhiiv muudaks iga selle tabeli arvu häirimise mõõtmiseks. Tabeli täitmiseks anna päris arhiveeritud hilisem väljalase valiku `eop_finals2000a_later` kaudu. Seni on tõelised ennustatud-versus-lõplikud vead, mida see aruanne sisaldab, väljal `table5_operational_vs_persistence`, kus ennustus on selle crate'i enda ja tõde on hiljem avaldatud Bulletin B lõplik väärtus.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Table 1: järeltöötlus { $c } m ({ $c2 } ms UT1) ↔ reaalajas { $c3 } m ({ $c4 } ms UT1) | Table 2: lõplik põhi { $floor } ms → { $far }-päevane { $far2 } ms | eelarve kokku { $total_m } m ({ $total_time_ns } ns) | L19 hoovavars + L18 päris andmed (Validated), OD cov (Modelled)

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Mõõdetud tõelise kahe väljalaskega paari põhjal: välja antud faili ({ $eop_source }) Bulletin A ENNUSTATUD UT1 miinus arhiveeritud hilisema väljalaske ({ $c }) lõpuks saadud Bulletin B LÕPLIK väärtus, horisontidel: { $predicted_vs_final }.

engine-realtime-frame-eop-empty-and-deliberately-so-an = TÜHI, ja see on tahtlik: esitati arhiveeritud hilisem väljalase ({ $c }), kuid ühtegi kuupäeva ei kanta välja antud failis ({ $eop_source }) Bulletin A PREDICTION-ina ja hilisemas failis Bulletin B LÕPLIKU väärtusena üheski nõutud horisondis, seega pole ennustatud-versus-lõplikku jääki, mida raporteerida. Ühtegi rida ei sünteesita.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = TÜHI, ja see on tahtlik: ennustatud-versus-lõpliku jäägi jaoks on vaja sama finals2000A toote KAHTE väljalaset. Sellele käitusele anti üks ({ $eop_source }). Selle Bulletin A ennustusread on tulevaste kuupäevade kohta, millel pole veel Bulletin B lõplikku väärtust, seega pole jääki, mida mõõta, ja siin ei mõelda ühtegi välja. Tabeli täitmiseks anna arhiveeritud hilisem väljalase valiku `eop_finals2000a_later` kaudu. Seni on väljal `table2_error_vs_horizon` raporteeritud mitmepäevane kasv PÜSIVUSE ennustaja, mida hinnatakse päris lõplike väärtuste vastu — päris mõõdetud viga, kuid Modelled ennustaja ja mitte IERS Bulletin A ennustuse jääk.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = laeva hindamine vajab [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = väljavõte on { $excerpt } baiti; piir on { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = väljavõte sisaldab rohkem kui { $MAX_EXCERPT_EPOCHS } epohhi; lühenda seda

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = väljavõte lõpeb { $calibration_s } s kalibreerimisakna sees (epohhe { $epochs }): midagi ei hinnatud

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = UBX logis pole ühtegi UTC-märgisega epohhi

engine-e-receiver-trust-calibration-no-scenario-json-under = kataloogis { $root } pole scenario.json

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: kõrvale jäetud puhas Pfa <= { $B1_MAX_PFA } (kalibreeritud: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } peab olema lõplik ja > 0 (saadi { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel peab olema lõplik ja >= 0 (saadi { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used peab olema vähemalt 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg peab olema vahemikus [0, 90] (saadi { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg peab olema vahemikus (0, 360] (saadi { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points peab olema vahemikus [0, 100] (saadi { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio peab olema lõplik ja > 1 (saadi { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor peab olema vahemikus (0, 100] (saadi { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) on alla hinde degraded_min ({ $degraded_min }): ainuüksi geomeetria võiks jõuda ebausaldusväärsesse vahemikku

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    geometry { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used ->
        [one] { $n_used } satelliit
       *[other] { $n_used } satelliiti
    }{ $v6 }

## src/receiver_trust/geometry.rs

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: geomeetria järeldus liigitatakse vastuoluks

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: teatatud, kuid punkte ei anta (geomeetria ei ole kehv)

engine-receiver-trust-geometry-not-scored-the-score-deducts = punkte ei anta (skoorist arvatakse maha ainult siis, kui HDOP on üle { $hdop_max }, PDOP üle { $pdop_max } või satelliite on alla { $min_used })

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] tuletatud { $n } logitud satelliidist
       *[other] tuletatud { $n } logitud satelliidist
    }

engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] nagu vastuvõtja teatab, kasutusel { $n } satelliit
       *[other] nagu vastuvõtja teatab, kasutusel { $n } satelliiti
    }

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = teatatud HDOP { $fmt_dop } erineb teatatud taevast tuletatud HDOP-ist { $fmt_dop2 } rohkem, kui tolerants lubab

engine-receiver-trust-geometry-satellites-in-view-but-not = taevas nähtavad, kuid jälgimata satelliidid ({ $g } / { $in_view } kõrgusel vähemalt { $low_elev_deg } deg): signaalikeskkond, mitte geomeetria

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } satelliit, vähem kui { $min_used }
       *[other] { $n } satelliiti, vähem kui { $min_used }
    }

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } üle { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } üle { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satelliiti teatatud silmapiirijoone taga

engine-receiver-trust-geometry-every-satellite-in-one-half = kõik satelliidid taeva ühes pooles (vahe { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = geomeetria tõttu halvenenud: { $parts } ({ $from }); mitte vastuolu

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = logis ei ole ühtegi epohhi: midagi selles ei olnud loetav kui { $name } ({ $skipped_records } kirjet jäeti vahele rikutuna või parsimatuna); vormingu säte tuleb üle kontrollida

engine-receiver-trust-ingest-gps-week-tow = GPS nädal { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS nädal { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (kuupäev logis puudub)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } peab olema lõplik ja >= 0 (saadi { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s peab olema suurem kui 0

engine-e-receiver-trust-live-invalid-session = vigane seanss: { $e }

engine-receiver-trust-live-no-score-could-be-produced = skoori ei õnnestunud arvutada: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = ühtegi GNSS-SDR synchro- ega pvt-kirjet ei saanud lugeda ({ $skipped } rida jäeti vahele); reavormingu kohta vt integrations/gnss-sdr/README.md

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = IMU fail on tühi

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: veerg `{ $n }` puudub

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: veerg `{ $n }` puudub

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = IMU fail ei sisalda ühtegi loetavat näidist

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = telg peab olema 0, 1 või 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean peab olema lõplik

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] logis on { $n } näidis; Alani sobitamiseks on vaja vähemalt { $MIN_SAMPLES }
       *[other] logis on { $n } näidist; Alani sobitamiseks on vaja vähemalt { $MIN_SAMPLES }
    }

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = logi aeg ei edene

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not =
    { $n ->
        [one] näidisintervall ei ole ühtlane ({ $n } intervallist erineb { $uneven } üle 25 %): logi tuleb esmalt uuesti diskreetida
       *[other] näidisintervall ei ole ühtlane ({ $n } intervallist erineb { $uneven } üle 25 %): logi tuleb esmalt uuesti diskreetida
    }

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = logi on Alani kõvera moodustamiseks liiga lühike

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = kõvera { $name } algne kalle on { $v }, mitte ligikaudu -0.5: valge müra ei domineeri (kas andur on paigal?), seega selle mürategur on ebausaldusväärne

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = kõver { $name } on kalde kontrollimiseks liiga lühike

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = GPS nädal { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = ühtegi BESTPOS-, RANGE- ega RXSTATUS-logi ei saanud lugeda ({ $skipped } kirjet jäeti vahele)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = kehtivat RTCM 3 kaadrit ei leitud ({ $skipped } kandidaati ei läbinud CRC-kontrolli)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } peab olema lõplik ja > 0 (saadi { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard peab olema vahemikus (0, 1) (saadi { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac peab olema vahemikus [0, 1] (saadi { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } peab olema vahemikus (0, 1) (saadi { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats peab olema vähemalt 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s peab olema vähemalt 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = monitor config: tundmatu profiil „{ $other }“; teadaolevad: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = monitor config: { $name } peab olema lõplik ja > 0 (saadi { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = monitor config: jam_ind_threshold peab olema lõplik

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = monitor config: mask_deg peab olema vahemikus [-90, 90) (saadi { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = monitor config: raim_pfa peab olema vahemikus (0, 1) (saadi { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = monitor config: cn0_min_sats peab olema vähemalt 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = monitor config: sats_lost peab olema vähemalt 1

engine-receiver-trust-monitors-the-receiver-own-set-against = vastuvõtja enda { $self_report_source } kogum võrrelduna Kshana monitoritega; kumbki ei ole tegelik tõde, kokkulangevus ei ole valideerimine

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = vastuvõtja ajajoonel on mittelõplik epohhi aeg

engine-e-receiver-trust-monitors-the-log-is-shorter-than = logi on kalibreerimisaknast lühem: { $calibration_epochs } epohh(i) enne { $cal_s } s (logi ulatus { $span } s); baastaseme moodustamiseks on vaja vähemalt 3

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } peab olema vahemikus ({ $lo }, { $hi }] (saadi { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } kehtib ainult kind = "vessel" korral (kind on "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = faili { $path } ei saa lugeda: WebAssembly versioonil puudub failisüsteem; fail tuleb anda otse `text` või `base64` kaudu

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` ei ole kehtiv standardne base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: tuleb anda üks väljadest `path`, `text` või `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: tuleb anda ainult üks väljadest `path`, `text` või `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } peab olema positiivne arv, saadi { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = sündmus { $label }: onset_s peab olema mittenegatiivne arv

engine-e-receiver-trust-scenario-event-end-must-be-after = sündmus { $label }: end_s peab olema hilisem kui onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg ja time_offset_s peavad olema lõplikud

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = usaldusväärne kogu aeg: ükski monitor ei andnud häiret { $after_cal } epohhil (epohh(i)) pärast kalibreerimist

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = esimene häire ajal { $t } s; epohhe pärast kalibreerimist { $after_cal }, neist ebausaldusväärne: { $untrusted_epochs }, halvenenud: { $degraded_epochs }

engine-receiver-trust-scenario-of-stated-events-detected-within = nimetatud sündmustest tuvastati { $events_detected } / { $events_evaluable } { $detect_tol_s } s jooksul

engine-receiver-trust-scenario-of-n0-predictions-within-db = C/N0 ennustusi, mis jäävad { $cn0_tol_db } dB piiresse: { $predictions_agreeing } / { $predictions_evaluable }

engine-receiver-trust-scenario-trust-score-lowest-final = usaldusskoor madalaim { $min }, lõplik { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = stsenaarium { $r } | receiver-trust | { $format_name } logi, epohhe: { $epochs }, kestus { $duration_s } s | monitore: { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = see on { $k } stsenaarium, mitte receiver-trust-stsenaarium

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } peab olema lõplik (saadi { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: vaja on 0 < degraded_min < nominal_min <= 100 (saadi { $degraded_min } ja { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s peab olema lõplik ja >= 0 (saadi { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: vaja on 0 <= onset_ratio < full_ratio (saadi { $onset_ratio } ja { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: { $m } kaal peab olema vahemikus [0, 100] (saadi { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s peab olema lõplik ja positiivne

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg peab olema vahemikus (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 peab olema lõplik ja positiivne

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m ja rho0_kg_m3 peavad olema lõplikud ja positiivsed

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m peab olema vahemikus [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = taassisenemine (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> tipp { $v3 } g kõrgusel { $v4 } km, kiirusel { $velocity_at_peak_deceleration } m/s; kuumenemise tipp kiirusel { $velocity_at_peak_heating } m/s; punktmass (gravitatsioon, kõverus, US76) tipp { $peak_deceleration_g } g (MODELLED ballistiline, ilma aerotermilise mudelita)

## src/registry.rs

engine-e-registry-unknown-scenario-id = tundmatu stsenaariumi id: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = TRL riba ({ $lo },{ $hi }) ei ole korrektselt vormistatud (nõutav 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = Modelleeritud (ainult simulatsioonil põhinev) väide ei saa olla representatiivne TRL { $MODELLED_TRL_CEILING } kohal (riba hi={ $hi }); kõrgem TRL on lünk, mitte simulatsiooni väljund

engine-representativeness-representativeness-representative-for-trl = Representatiivsus [{ $status }] — { $claim } (representatiivne TRL { $lo }-{ $hi } jaoks){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = deklareeritud({ $arch }) x allikate keskmine kvaliteet

engine-resilience-score-weakest-rpcf-sub-score-bounded = nõrgim RPCF alamskoor = { $min_sub }; piiratud halvenemine = { $bounded } (piiramata korral piirdub tasemega 2)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = toetamata navigatsioonikirje päis { $head }: '>' märgiga algav rida on RINEX 4 kirje päis, mitte RINEX 3 navigatsioonikirje

engine-e-rinex-bad-prn-in = vigane PRN kirjes { $head }

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4 navigatsioon: oodati '>' kirjepäist, leiti { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4 kirje { $head } sisaldab ridu: { $body }, { $msg } efemeriid vajab 8 rida

engine-e-rinex-rinex-record-is-followed-by = RINEX 4 kirjele { $head } järgneb { $body }, mitte { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = vigane { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = RINEX vaatlusfailis puudub END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = RINEX vaatlusfail ei sisaldanud ühtegi epohhikirjet

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s peab olema lõplik ja > 0 (saadi { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s peab olema lõplik ja > 0 (saadi { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) ei tohi ületada time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps =
    { $n ->
        [one] ajaruudustik on liiga suur: { $n } samm ületab MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); tuleb kasutada jämedamat sammu või lühemat kestust
       *[other] ajaruudustik on liiga suur: { $n } sammu ületab MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); tuleb kasutada jämedamat sammu või lühemat kestust
    }

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = diskreetimissagedus on koodikiirusega kommensureeruv ({ $samples_per_chip } näidist/chip, { $offset_from_integer_samples } näidist täisarvust): nullastme hoidega koodikoopia ei suuda lahendada koodifaasi muutust, mis on väiksem kui { $dead_band_chips } chip, mistõttu Early/Late diskriminaator on kolmnurga asemel ühenäidise surnud tsooniga astmeline ja DLL stabiliseerub vale nihke juures. Diskreetimissagedus tuleb nihutada täisarvkordsest eemale (5 MHz on { $lit_4_8876 } näidist/chip; 25 MHz on { $lit_24_4379 }) või diskreetida üle piisavalt, et surnud tsoon jääks vajaliku koodifaasi täpsusest väiksemaks.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = SGP4 veakood { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = toetamata SigMF core:datatype { $other }: see lugeja käsitleb kompleksseid tüüpe cf32_le, ci16_le ja ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: loetakse ainult ühekanalilisi salvestisi

engine-e-sigmf-cannot-serialise-sigmf-metadata = SigMF metaandmeid ei saa serialiseerida: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = vigane SigMF laiendi nimeruum { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = annotatsioonilaiendi kaarte: { $annotations }, annotatsioone: { $annotations2 }

engine-e-sigmf-extension-key-is-not-in = laiendi võti { $k } ei kuulu nimeruumi { $ns }

engine-e-sigmf-extension-key-is-already-present = laiendi võti { $k } on juba olemas

engine-e-sigmf-global-is-not-an-object = global ei ole objekt

engine-e-sigmf-annotations-is-not-an-array = annotations ei ole massiiv

engine-e-sigmf-annotation-is-not-an-object = annotation ei ole objekt

engine-e-sigmf-invalid-sigmf-metadata-json = vigane SigMF metaandmete JSON: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = SigMF salvestis ei sea ühtegi positiivset core:sample_rate väärtust

engine-e-sigmf-sigmf-capture-starts-at-sample = SigMF salvestus algab näidisest { $start }, mis jääb kaugemale kui andmetes olevad näidised: { $data }

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } peab olema vahemikus [0, 90) kraadi, saadi { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } peab olema lõplik arv, saadi { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: kanjon vajab width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m peab olema positiivne, saadi { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: kanjoni kõrgused ja antenna_m peavad olema mittenegatiivsed

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m peab olema positiivne, saadi { $l }

engine-e-skyline-skyline-table-is-empty = skyline: tabel on tühi

engine-e-skyline-skyline-table-has-rows-over = skyline: tabelis on ridu: { $rows }, mis ületab piiri { $MAX_TABLE_ROWS } rida

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: tabeli asimuut { $az } jääb vahemikust [0, 360) välja

engine-e-skyline-skyline-table-azimuths-must-be = skyline: tabeli asimuudid peavad rangelt kasvama ({ $az } järgneb väärtusele { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: rohkem kui { $MAX_SECTORS } sektorit

engine-e-skyline-skyline-the-sector-az-from = skyline: sektor az_from = { $az_from } kuni az_to = { $az_to } on tühi (täisring on tabel või mask)

engine-e-skyline-skyline-more-than-terrain-points = skyline: rohkem kui { $MAX_TABLE_ROWS } maastikupunkti

engine-e-skyline-skyline-terrain-distance-must-be = skyline: maastiku distance_m peab olema positiivne, saadi { $distance_m }

engine-skyline-with-fields-overridden-or-added = { $provenance }; väljad, mida on üle kirjutatud või lisatud: { $user }

engine-skyline-stated-input = Nimetatud sisend: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = tundmatu silmapiiri eelseadistus „{ $name }“; teadaolevad eelseadistused: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = andmelehel peab olema vähemalt kaks Alani hälbe punkti

engine-e-slot-timing-datasheet-point-must-have-positive = andmelehe punktil ({ $t }, { $s }) peavad olema positiivne keskmistamisaeg ja positiivne Alani hälve

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s peab olema positiivne sekundite arv

engine-e-slot-timing-phase-record-needs-at-least = müramudeli sobitamiseks on faasiregistris vaja vähemalt 32 näidist; saadi { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = faasiregister sisaldab mittelõplikku näidist

engine-e-slot-timing-the-phase-record-yields-fewer = faasiregistrist saab vähem kui kolm Alani hälbe punkti

engine-e-slot-timing-must-be-finite-and-non = { $name } peab olema lõplik ja mittenegatiivne; saadi { $v }

engine-e-slot-timing-the-slot-guard-must-be = ajapesa kaitseintervall peab olema positiivne aeg

engine-e-slot-timing-sigma-must-be-positive = k_sigma peab olema positiivne

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset peab olema lõplik

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k peab olema lõplik

engine-e-slot-timing-give-exactly-one-of-oscillator = tuleb anda täpselt üks väljadest oscillator.class, oscillator.preset, oscillator.datasheet või oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = tundmatu oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = tundmatu oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = klassi { $c } vaikeväärtus: sigma_y(1 s) väärtusest { $c2 }; punase müra põhi on sünteesitud sellest kahe ja nelja dekaadi võrra allapoole (eeldus, mitte mõõtmine)

engine-slot-timing-fitted-to-the-allan-deviation = sobitatud dokumendi { $document } Alani hälbe maksimumidele ja skaleeritud nii, et see asub igal punktil või sellest kõrgemal

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] sobitatud { $n_samples } näidisest koosneva registri kattuvale Alani hälbele sagedusel { $tau0_s } s IEEE Std 1139 sageduse modulatsiooni baasis
       *[other] sobitatud { $n_samples } näidisest koosneva registri kattuvale Alani hälbele sagedusel { $tau0_s } s IEEE Std 1139 sageduse modulatsiooni baasis
    }

engine-slot-timing-slot-timing-source-guard-ns =
    { $n ->
        [one] slot-timing ({ $n } allikas): kaitseintervall { $c } ns juures k={ $k_sigma } katkeb { $fmt_s } pärast fiksi (jäänud { $fmt_s2 }); fiks vähemalt iga { $fmt_s3 } järel ({ $fixes_per_day } päevas); domineeriv liige: { $b }{ $v9 }
       *[other] slot-timing ({ $n } allikat): kaitseintervall { $c } ns juures k={ $k_sigma } katkeb { $fmt_s } pärast fiksi (jäänud { $fmt_s2 }); fiks vähemalt iga { $fmt_s3 } järel ({ $fixes_per_day } päevas); domineeriv liige: { $b }{ $v9 }
    }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epohh '{ $s }' peab olema kujul YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = epohh '{ $s }': vigane { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb peab olema lõplik

engine-e-solar-system-table-must-be-auto-table1 = table peab olema auto, table1 või table2; saadi '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = lingil { $name } – { $name2 } puudub efemeriid ajahetkel JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = epohh JD { $jd } TDB jääb väljapoole vahemikku 3000 BC kuni 3000 AD, mis on Standishi tabelite ulatus

engine-e-solar-system-track-points-must-be-to = track_points peab olema 8 kuni 2000; saadi { $n_track }

engine-e-solar-system-unknown-observer-body = tundmatu vaatlejakeha '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies peab nimetama vähemalt ühe keha

engine-e-solar-system-unknown-body = tundmatu keha '{ $n }'

engine-e-solar-system-no-position-for-at-jd = kehal { $name } puudub positsioon ajahetkel JD { $jd } TDB (Pluuto ainult 1800 AD kuni 2050 AD)

engine-e-solar-system-no-standish-elements-for = kehal { $name } puuduvad Standishi elemendid

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliotsentriline olek, mille luges mootori oma lugeja

engine-e-solar-system-unknown-link-body = tundmatu lingi keha '{ $from }'

engine-e-solar-system-unknown-link-body-2 = tundmatu lingi keha '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = link vajab kahte erinevat keha; saadi { $name }

engine-solar-system-solar-system-at-jd-tdb =
    { $n_bodies ->
        [one] Päikesesüsteem ajahetkel { $input } (JD { $jd_tdb } TDB), { $n_bodies } keha, vaatleja { $observer }
       *[other] Päikesesüsteem ajahetkel { $input } (JD { $jd_tdb } TDB), { $n_bodies } keha, vaatleja { $observer }
    }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = valgusaeg { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  pikkus { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }link { $from } -> { $to }: ühesuunaline { $one_way_light_time_s } s, kahesuunaline { $two_way_light_time_s } s, Shapiro { $l } us, Päike { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = epohh { $input } · { $standish_table } · positsioonid Standishi elementidest

## src/sp3.rs

engine-e-sp3-epoch-needs-time-fields-got = epohh vajab 6 ajavälja, saadi { $tokens }

engine-e-sp3-bad-second = vigane sekund: { $tokens }

engine-e-sp3-record-needs-values-missing-column = kirje vajab 4 väärtust, puudub veerg { $v1 }

engine-e-sp3-bad-number = vigane arv: { $field }

engine-e-sp3-empty-sp3-input = tühi SP3 sisend

engine-e-sp3-first-line-is-not-an = esimene rida ei ole SP3 päis: { $first }

engine-e-sp3-unsupported-sp3-version-in = toetamata SP3 versioon real { $first }

engine-e-sp3-missing-epoch-count-on-header = päise real 1 puudub epohhide arv

engine-e-sp3-record-has-no-satellite-id = kirjel puudub satelliidi id: { $line }

engine-e-sp3-position-record-before-any-epoch = positsioonikirje enne ühtegi epohhi päist

engine-e-sp3-sp3-file-contained-no-epoch = SP3 fail ei sisaldanud ühtegi epohhikirjet

engine-e-sp3-bad-accuracy-exponent-in = vigane täpsuse astendaja { $f } real { $line }

engine-e-sp3-bad-header-accuracy = vigane päise täpsus { $t }

engine-e-sp3-short-line = lühike %f rida { $line }

engine-e-sp3-bad-base-in = vigane %f alus real { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = versioon ületab 3 bitti

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID ületab 11 bitti (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count ületab 14 bitti (0..=16383)

engine-e-space-packet-data-field-must-be-at = andmeväli peab olema vähemalt üks oktett

engine-e-space-packet-data-field-exceeds-65536-octets = andmeväli ületab 65536 oktetti

engine-e-space-packet-packet-shorter-than-the-octet = pakett on lühem kui 6-oktetine päis: baite { $bytes }

engine-e-space-packet-declared-data-length-header-octets = deklareeritud andmepikkus { $data_len } (+6 päist) = { $total } oktetti, kuid puhvri suurus on { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC jämedate oktettide arv { $coarse_octets } jääb väljapoole vahemikku 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = CUC peente oktettide arv { $fine_octets } jääb väljapoole vahemikku 0..=3 (laiendatud P-välja ei toetata)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-väli { $p }: laiendatud P-välja ei toetata

engine-e-space-packet-field-time-code-id-is = P-väli { $p }: ajakoodi id { $id } ei ole CUC

engine-e-space-packet-field-is-not-cds-field = P-väli { $p } ei ole CDS P-väli

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-väli { $p }: reserveeritud alam-ms kood 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC jäme { $coarse } ei mahu { $c } oktetti

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] CUC peen { $fine } ei mahu { $n } oktetit
       *[other] CUC peen { $fine } ei mahu { $n } oktetti
    }

engine-e-space-packet-cds-days-do-not-fit = CDS päevad { $days } ei mahu { $f } oktetti

engine-e-space-packet-cds-ms-of-day-above = CDS ms päevas { $ms_of_day } üle 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS alammillisekund { $submillis } ületab väärtust { $max_sub }

engine-e-space-packet-time-code-format-and-value = ajakoodi vorming ja väärtus on erinevatest koodidest

engine-e-space-packet-time-code-no-field-octet = ajakood: P-välja oktett puudub

engine-e-space-packet-time-code-needs-octets-present = ajakood vajab { $end } oktetti, olemas on { $bytes }

engine-e-space-packet-time-code-format-differs-from = ajakoodi vorming erineb implitsiitsest P-väljast

engine-e-space-packet-the-format-has-time-code = vormingul on ajakoodi väli; ühtegi ei antud

engine-e-space-packet-the-format-has-no-time = vormingul puudub ajakoodi väli

engine-e-space-packet-ancillary-data-is-octets-the = lisaandmed on { $ancillary } oktetti; vorming ütleb { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = sekundaarne päis peab sisaldama vähemalt ühe oktetti

engine-e-space-packet-secondary-header-needs-octets-present = sekundaarne päis vajab { $end } oktetti, olemas on { $bytes }

engine-e-space-packet-the-format-has-secondary-header = vormingul on sekundaarne päis; ühtegi ei antud

engine-e-space-packet-the-format-has-no-secondary = vormingul puudub sekundaarne päis

engine-e-space-packet-secondary-header-flag-disagrees-with = sekundaarse päise lipp { $v1 } ei ühti vorminguga

engine-e-space-packet-data-field-shorter-than-the = andmeväli on PEC-ist lühem

## src/space_packet.rs

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } ei ühti paketi CRC-ga { $crc16_ccitt_false }

engine-e-space-packet-nothing-to-segment-empty-user = segmenteerida pole midagi: kasutajaandmed on tühjad

engine-e-space-packet-max-user-octets-must-be = max_user_octets peab olema vähemalt 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count ületab 14 bitti (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } seal, kus oodati { $a }

engine-space-packet-sequence-count-repeated = järjenumbri loendur { $sequence_count } kordub

engine-space-packet-sequence-count-gap-after-packet = järjenumbri loenduri lünk: { $sequence_count } pärast { $last } ({ $v2 } pakett(i) puudub)

engine-space-packet-sequence-count-out-of-order = järjenumbri loendur on vales järjekorras: { $sequence_count } pärast { $last }

engine-space-packet-packet-with-no-unit-open = { $f } pakett, kuid ühtegi üksust pole avatud

engine-space-packet-packet-while-unit-is-open = { $f } pakett, kui üksus on avatud

engine-e-space-packet-packet = pakett { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = jada lõpeb endiselt avatud üksusega (viimane pakett puudub)

engine-e-space-packet-apid-must-be-in-2047 = apid peab olema vahemikus 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count peab olema >= 1

engine-e-space-packet-data-len-must-be-in = data_len peab olema vahemikus 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = sisemine viga: kodeerimise ja dekodeerimise ringkäik ei ühti

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: kaadriks koostatud { $packet_count } CCSDS-133.0 { $v2 } pakett APID { $apid }, kokku { $total_bytes } oktetti, ringkäik täpne ({ $round_trip_ok })
       *[other] space-packet: kaadriks koostatud { $packet_count } CCSDS-133.0 { $v2 } paketti APID { $apid }, kokku { $total_bytes } oktetti, ringkäik täpne ({ $round_trip_ok })
    }

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 peab olema lõplik ja positiivne

engine-e-space-weather-f107a-must-be-finite-and = f107a peab olema lõplik ja positiivne

engine-e-space-weather-kp-must-be-in = kp peab olema vahemikus [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km ei tohi olla tühi

engine-e-space-weather-altitude-km-must-be-finite = kõrgus { $h } km peab olema lõplik ja positiivne

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; tihedus x{ $density_activity_factor } kõrgusel { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: { $what } segaja vajab positiivset bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: chirp-segaja vajab positiivset sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to nimetab tundmatu riba { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: tuleb anda kas received_power_dbw või eirp_dbw koos positiivse range_m-ga (mitte mõlemad)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s peab olema hilisem kui on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: diskreetimissagedus peab olema positiivne

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } peab olema kahe aste, vähemalt 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } näidist on vähem kui üks { $nfft }-punktiline segment

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } peab olema kahe aste, vähemalt 16

engine-e-spectrum-cannot-read-recording-meta-path = salvestise meta_path { $meta_path } ei saa lugeda: { $e }

engine-e-spectrum-cannot-read-recording-data = salvestise andmeid { $data_path } ei saa lugeda: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz peab olema positiivne

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: modulation { $m } ei ole valitav (ainult galileo-e1 võtab väärtused "mboc" või "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: signaal { $sig } puudub signaalide eelseadistuste teegis ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: eelseadistatud signaal kannab oma modulatsiooni; `modulation` tuleb ära jätta

engine-e-spectrum-signal-publishes-no-received-power = { $name }: signaal { $sig } ei avalda vastuvõetud võimsust; tuleb anda signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: kohandatud riba vajab `modulation`, nt "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: kohandatud riba vajab signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: tuleb anda kas `signal` või `centre_mhz`, mitte mõlemad

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: tuleb anda rx_bandwidth_mhz (peasagarat ei õnnestunud leida)

engine-e-spectrum-duration-must-be-at-least = duration_s peab olema vähemalt üks step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } ajarida on rohkem kui lubatud 5000

engine-e-spectrum-at-most-extra-panels = lisapaneele võib olla kuni 8

engine-e-spectrum-panel-need-max-mhz-min = paneel { $name }: vaja on f_max_mhz > f_min_mhz ja 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = ruudustik: vaja on f_max_mhz > f_min_mhz ja 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = stsenaarium spectrum | ribasid: { $bands } | segajaid: { $jammers } | müratase { $n0_db } dBW/Hz | halvim riba { $name } min C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = stsenaarium spectrum | ribasid pole | müratase { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples peab olema vahemikus 10 kuni 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: kasutada cf32_le või ci16_le

engine-spectrum-frequency-across-time-down-colour = sagedus risti, aeg alla, värv = võimsusspektri tihedus (dBW/Hz); müratase { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = igal paneelil oma sagedusvahemik, üks ajatelg alla, üks värviskaala (dBW/Hz); müratase { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = kaadril { $other } puudub toetatud NAIF-kood

engine-e-spk-writer-segment-name-longer-than-40 = segmendi nimi on pikem kui 40 tähemärki: { $name }

engine-e-spk-writer-segment-name-has-non-printing = segmendi nimi sisaldab mittetrükitavaid märke: { $name }

engine-e-spk-writer-bad-target-for-centre = vigane siht { $target } tsentri { $centre } jaoks

engine-e-spk-writer-degree-outside-27 = aste { $degree } jääb väljapoole vahemikku 1..=27

engine-e-spk-writer-type-13-degree-is-not = tüüp 13 aste { $degree } ei ole paaritu

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] { $states } olekut { $n } epohhi kohta
       *[other] { $states } olekut { $n } epohhi kohta
    }

engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } olek; aste { $degree } vajab { $value }
       *[other] { $n } olekut; aste { $degree } vajab { $value }
    }

engine-e-spk-writer-descriptor-start-is-not-before = deskriptori algus ei eelne selle lõpule

engine-e-spk-writer-epochs-are-not-strictly-increasing = epohhid ei kasva rangelt

engine-e-spk-writer-the-epochs-do-not-cover = epohhid ei kata deskriptori intervalli

engine-e-spk-writer-type-or-13-segment-carries = tüüp 9 või 13 segment kannab olekuid, mitte kirjeid

engine-e-spk-writer-type-segment-needs-at-least = tüüp 3 segment vajab vähemalt ühte kirjet

engine-e-spk-writer-type-degree-outside-27 = tüüp 3 aste { $degree } jääb väljapoole vahemikku 0..=27

engine-e-spk-writer-type-interval-length-is-not = tüüp 3 intervalli pikkus { $intlen } ei ole positiivne

engine-e-spk-writer-type-record-has-coefficients-expected = tüüp 3 kirjel { $i } on kordajaid: { $value }, oodati { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = deskriptori algus on pärast selle lõppu

engine-e-spk-writer-descriptor-starts-before-the-first = deskriptor algab enne esimest kirjet

engine-e-spk-writer-descriptor-ends-after-the-last = deskriptor lõpeb pärast viimast kirjet

engine-e-spk-writer-type-segment-carries-records-not = tüüp 3 segment kannab kirjeid, mitte epohhe ega olekuid

engine-e-spk-writer-type-21-segment-needs-at = tüüp 21 segment vajab vähemalt ühte diferentsirida

engine-e-spk-writer-difference-line-size-is-not = diferentsirea suurus { $dlsize } ei ole 4 MAXDIM + 11, kus MAXDIM on vahemikus 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = erineva suurusega diferentsiread

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] { $epochs } epohhi { $n } diferentsirea kohta
       *[other] { $epochs } epohhi { $n } diferentsirea kohta
    }

engine-e-spk-writer-difference-line-epochs-are-not = diferentsirea epohhid ei kasva rangelt

engine-e-spk-writer-the-last-difference-line-ends = viimane diferentsirida lõpeb enne deskriptorit

engine-e-spk-writer-zero-step-size-in-difference = nullsammu suurus { $j } diferentsireas { $i }

engine-e-spk-writer-type-21-segment-carries-difference = tüüp 21 segment kannab diferentsiridu, mitte olekuid

engine-e-spk-writer-an-spk-needs-at-least = SPK vajab vähemalt ühte segmenti

engine-e-spk-writer-segment = segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = kommentaarirea sisaldab mittetrükitavaid märke: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = kommentaarid vajavad { $nchars } märki; { $v1 } on reserveeritud (ncomch tuleb suurendada)

engine-e-spk-writer-difference-line-orders-out-of = diferentsirea järgud { $kqmax1 } { $kq } on vahemikust väljas

engine-e-spk-writer-zero-step-size-at-index = nullsammu suurus indeksil { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } jääb segmendist [{ $start }, { $end }] välja

engine-e-spk-writer-type-segment-too-short = tüüp 3 segment { $name } on liiga lühike

engine-e-spk-writer-type-segment-words-for-rsize = tüüp 3 segment { $name }: { $nw } sõna, kui N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = tüüp 21 segment { $name } on liiga lühike

engine-e-spk-writer-type-21-segment-words-for = tüüp 21 segment { $name }: { $nw } sõna, kui N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segment { $name } on liiga lühike

engine-e-spk-writer-segment-words-for = segment { $name }: { $nw } sõna, kui N = { $n }

engine-e-spk-writer-segment-is-in-frame = segment { $name } on kaadris { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = SPK tsentriahel ei lõpe

engine-e-spk-writer-no-spk-chain-connects-and = ükski SPK ahel ei ühenda { $target } ja { $observer } ajahetkel ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = epohh { $s } ei ole kujul YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = ajasüsteem { $other } ei ole toetatud (UTC või TDB)

engine-e-spk-writer-centre-has-no-supported-naif = tsentril { $other } puudub toetatud NAIF id

engine-e-spk-writer-oem-segment-has-no-data = OEM segmendis { $name } ei ole andmeridu

engine-e-spk-writer-oem-segment-no = OEM segment { $idx }: puudub { $k }

engine-e-spk-writer-no-export-settings-for-oem = OEM segmendi { $idx } jaoks ei ole ekspordisätteid

engine-e-spk-writer-oem-data-line-has-fields = OEM andmereal on väljade arv { $f }: { $line }

engine-e-spk-writer-oem-value = OEM väärtus { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = OEM segmente: { $out }, ekspordisätteid: { $exports }

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (liidetud) — kihid: { $fired }

engine-spoof-detect-single-layer-indication-below-the = ühekihiline viide ({ $fired }) jääb liidetud läve alla — vajalik on kinnitus

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg peab olema positiivne, saadi { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = paneel { $i }: pind peab olema >= 0

engine-e-srp-boxwing-panel-outside = paneel { $i }: { $name } = { $c } jääb väljapoole vahemikku [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = paneel { $i }: absorptsioon + peegelpeegeldus + hajuspeegeldus = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = paneel { $i }: normaal ja telg on null

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = ECOM2 normaalmaatriks on singulaarne või halvasti tingitud

## src/ssv/check.rs

engine-e-ssv-check-heo-preset = heo eelseadistus

engine-e-ssv-check-lunar-preset = kuu eelseadistus

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = moodustis vajab vähemalt ühte abisatelliiti

engine-e-ssv-formation-duration-min-and-step-must = duration_min ja step_s peavad olema positiivsed

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = valitud konstellatsioonidele ja ribadele ei ole signaale

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = tundmatu antenn `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = mustri CSV on tühi

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` ei ole mustri CSV-s arv

engine-e-ssv-scenario-pattern-csv-row-has-columns = mustri CSV rida `{ $l }` sisaldab veerge: { $f }, oodati { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" vajab täpselt ühte väljadest pattern_csv ja pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` ei ole booklet, parametric ega table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: tuleb anda cn0_min_dbhz või weak_signal, mitte mõlemad

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = kandelaine silmus ei suuda hoida nimetatud Doppleri kiirust üheski C/N0 juures

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` ei ole acquisition, tracking ega both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz peab olema lõplik

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: tuleb anda täpselt üks väljadest preset ja orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` ei ole leo, meo, geo, heo ega lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: tuleb anda täpselt üks väljadest duration_min ja duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } peab olema positiivne

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg vajab 1 kuni 8 lõplikku nihet

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd ei tohi olla negatiivne

engine-e-ssv-scenario-give-exactly-one-of-shell = tuleb anda täpselt üks väljadest [shell], [trajectory] ja [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] vajab peasatelliidi jaoks tabelit [navigation]

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include ja constellations.bands ei tohi olla tühjad

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km peab olema üle 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels üle 5 ei ole toetatud

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna peab olema hemisphere või omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = shell-pühkimine toetab ainult booklet-edastusmustrit (kujundatud muster vajab trajectory-pühkimist)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] kehtib tabelile [trajectory], mitte tabelile [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: tuleb anda täpselt üks väljadest preset ja orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` ei ole leo, meo, geo, heo ega lunar-transfer

engine-e-ssv-scenario-unknown-preset = tundmatu eelseadistus

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv kest { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv navigatsioon: asukoha RMS kokku { $p }, GNSS-i orbiitide sees { $p2 }, nendest kõrgemal { $p3 }; pikim vahe { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = abisatelliit nurgal { $offset_deg } deg ({ $baseline_km } km): suhteline RMS { $rel_rms_filter_m } m filtreeritult vs { $rel_rms_from_absolute_m } m absoluutsetest fiksidest

engine-ssv-scenario-combined-max-outage-min = { $band } kombineeritud 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (suurim katkestus { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv trajektoor { $perigee_alt_km } kuni { $apogee_alt_km } km kõrgus: { $parts }

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min ja step_min peavad olema positiivsed

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } peab olema positiivne arv, saadi { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = standardipakett nimega `{ $id }` puudub; paketid on: { $ids }

engine-e-standards-pack-pack-manifest = paketi manifest: { $e }

engine-e-standards-pack-test-duplicate-id = test { $id }: dubleeritud id

engine-e-standards-pack-test-scenario-is-not-in = test { $id }: stsenaarium `{ $s }` ei kuulu paketti

engine-e-standards-pack-test-scored-test-needs-bar = test { $id }: hinnatav test vajab läve

engine-e-standards-pack-test-test-that-needs-input = test { $id }: test, mis vajab sisendit, ei sisalda lävesid

engine-e-standards-pack-test-give-either-scenario-or = test { $id }: tuleb anda kas `scenario` või `needs_input`, mitte mõlemad ega mitte kumbagi

engine-e-standards-pack-test-supports-unknown-row = test { $id }: toetab tundmatut rida `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id }: tundmatu op `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id }: lävi väärtusel { $pointer } vajab täpselt ühte väljadest `value` ja `against`

engine-e-standards-pack-row-duplicate-id = rida { $id }: dubleeritud id

engine-e-standards-pack-row-asks-must-be-short = rida { $id }: `asks` peab olema lühike parafraas

engine-e-standards-pack-row-no-test-supports-it = rida { $id }: ükski test seda ei toeta

engine-standards-pack-not-scored-needs-input = hindamata: vajab sisendit ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = uuringus pole käivitatavaid stsenaariume

engine-e-study-cannot-read-scenario = stsenaariumi { $path } ei saa lugeda: { $e }

engine-e-study-scenario-failed = stsenaarium { $path } ebaõnnestus: { $e }

engine-e-study-scenario-produced-unparseable-json = stsenaarium { $path } andis parsimatu JSON-i: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = vigane komplekti manifest: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = tundmatu allikas `{ $o }`: kasutada `adsb` või `ais`

engine-e-surface-is-bytes-over-the-byte = { $what }: baite { $len }, üle piiri { $limit } baiti

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` ei ole ISO-8601 UTC aeg

engine-e-surface-invalid-receiver-trust-session = vigane receiver-trust seanss: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` ei ole ISO-8601 UTC aeg

engine-e-surface-dataset-custom-needs-licence-licence = andmekogum `custom` vajab väljasid licence, licence_url ja attribution

engine-e-surface-at-least-one-map-is = vajalik on vähemalt üks kaart

engine-e-surface-epoch = epohh: { $e }

engine-e-surface-not-utf = { $suffix }: ei ole UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = tundmatu stsenaariumi liik `{ $k }`; liikide loend nimetab kõik liigid

engine-surface-is-not-bundled-it = `{ $name }` ei ole komplekteeritud: see { $why }

engine-surface-no-bundled-scenario-named-the = komplekteeritud stsenaariumi nimega `{ $name }` ei ole; näidete loend nimetab olemasolevad: { $v1 }

engine-e-surface-invalid-toml = vigane TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = tundmatu ekspordivorming `{ $format }`; oodati ühte väärtustest czml, kml, geojson, stk või sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps annab { $opts } kaadrit, kuid tagastatakse kuni { $MAX_ANIMATION_FRAMES }; fps-i või duration_s tuleb vähendada või pikem jada käsureaga kirjutada

engine-e-surface-scenario-run-failed = stsenaariumi käivitamine ebaõnnestus: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log nimetab faili `path`; log tuleb anda kujul `text` või `base64` (see liides ei loe faile)

engine-e-surface-max-sp-errors-must-be = max_sp_errors võib olla kuni 20

engine-e-surface-frames-must-be-to = frames peab olema 1 kuni { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 peab olema 0 kuni 99

engine-e-surface-runs-given-at-most-per = käivitusi antud: { $runs }; ühes aruandes kuni { $MAX_COMPLIANCE_RUNS }

engine-e-surface-the-runs-total-bytes-the = käivituste kogumaht baitides: { $total }; ühe aruande piir on { $max_bytes }

engine-e-surface-result-files-given-at-most = tulemusfaile antud: { $results }, kuni 256

engine-e-surface-result-is-not-json = tulemus { $v1 } ei ole JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = tundmatu vorming `{ $o }`: kasutada `prometheus`, `cef`, `leef`, `otlp` või `mqtt`

engine-e-surface-unknown-imu-format-use-csv = tundmatu IMU vorming `{ $o }`: kasutada `csv` või `euroc`

engine-e-surface-unknown-axis-use-or = tundmatu telg `{ $o }`: kasutada `x`, `y` või `z`

engine-e-surface-id-must-be-to-64 = id peab olema 1 kuni 64 trükitavat ASCII märki ilma tühikuteta

engine-surface-fitted-from-stationary-imu-log = sobitatud statsionaarse IMU logi põhjal, sha256 { $sha }, telg { $axis }, Alani hinnang

engine-e-surface-unknown-input-kind-use-result = tundmatu input_kind `{ $o }`: kasutada `result` või `jsonl`

engine-e-surface-the-input-holds-no-trust = sisend ei sisalda ühtegi usaldusepohhi

engine-e-surface-the-reply-is-over-the = vastus ületab piiri { $max_bytes } baiti; tuleb saata vähem epohhe või jätta `syslog_all` välja lülitatuks

engine-e-surface-otlp-needs-build-with-the = otlp vajab ehitust funktsiooniga `otlp`

engine-e-surface-the-pack-and-token-total = paketi ja märgendi kogumaht on { $total } baiti; piir on { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = ajatempli märgend on tühi

engine-e-surface-must-be-64-lower-case = { $what } peab olema 64 väiketähelist kuueteistkümnendnumbrit

engine-e-surface-must-be-32-bytes = { $what } peab olema 32 baiti

engine-surface-verified-against-the-public-key = VERIFIED esitatud avaliku võtme vastu (allkirjastaja sõrmejälg { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: räsid ja allkiri on kooskõlas võtmega { $fp }, mille pakett ise nimetab. Selleks et tuvastada, kes allkirjastas, tuleb esitada allkirjastaja avalik võti, mis on saadud allkirjastajalt muud teed pidi.

engine-e-surface-files-must-be-json-object = files peab olema nime ja sisu JSON-objekt

engine-e-surface-pack-has-at-most-64 = paketis võib olla kuni 64 faili

engine-e-surface-file-name-must-be-plain = failinimi `{ $k }` peab olema lihtnimi

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` ei ole kehtiv standardne base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = tundmatu pühkimisparameeter: { $other }

engine-e-sweep-unknown-sweep-metric = tundmatu pühkimismeetrika: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep vajab vähemalt ühte telge

engine-e-sweep-sweep-key-is-malformed = pühkimisvõti `{ $key }` on vigane

engine-e-sweep-sweep-key-follows-an-array = pühkimisvõti `{ $key }`: `{ $part }` järgneb massiivile, seega peab olema indeks

engine-e-sweep-unreachable = kättesaamatu

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] pühkimisvõti `{ $key }`: indeks { $i } jääb massiivi { $n } kirjest kaugemale
       *[other] pühkimisvõti `{ $key }`: indeks { $i } jääb massiivi { $n } kirjest kaugemale
    }

engine-e-sweep-sweep-key-parent-is-not = pühkimisvõti `{ $key }`: `{ $part }` vanem ei ole tabel

engine-e-sweep-sweep-key-no-field = pühkimisvõti `{ $key }`: välja `{ $part }` ei ole

engine-e-sweep-sweep-key-parent-of-is = pühkimisvõti `{ $key }`: `{ $last }` vanem ei ole tabel

engine-e-sweep-sweep-key-no-field-2 = pühkimisvõti `{ $key }`: välja `{ $last }` ei ole

engine-e-sweep-metric-no-field-in-result = meetrika `{ $path }`: tulemuses puudub väli `{ $part }`

engine-e-sweep-metric-value-is-not-number = meetrika `{ $path }`: väärtus ei ole arv

engine-e-sweep-sweep-node-serialize = pühkimissõlme serialiseerimine: { $e }

engine-e-sweep-sweep-node-result-parse = pühkimissõlme tulemuse parsimine: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = pühkimistelg `{ $key }`: deklareeritud ühik `{ $d }`, kuid pühitud pakett avaldab `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = pühkimise töölõim jooksis kokku

engine-e-sweep-generic-sweep-needs-at-least = üldine pühkimine vajab vähemalt ühte telge

engine-e-sweep-generic-sweep-needs-at-least-2 = üldine pühkimine vajab vähemalt ühte meetrikat

engine-e-sweep-generic-sweep-base-must-carry = üldise pühkimise `base` peab kandma oma `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = üldine pühkimine ei saa pühkida teist pühkimist

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = tundmatu ostsillaator { $oscillator }; oodati ühte väärtustest { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day ja temperature_coeff_per_k peavad olema lõplikud

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s peab olema lõplik ja positiivne

engine-e-telecom-timing-duration-must-be-finite-and = duration_s peab olema lõplik ja vähemalt kaheteistkümne näidise pikkune

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s peab asuma vahemikus [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns peab olema lõplik ja >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = temperatuuri ja sagedusnihke sisendid peavad olema lõplikud (periood > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = register ületaks 5 000 000 näidist; sample_interval_s tuleb suurendada

engine-e-telecom-timing-time-error-series-needs-at = ajaveasari vajab vähemalt 13 näidist, saadi { $pairs }

engine-e-telecom-timing-every-time-and-time-error = iga time_s ja time_error_ns peab olema lõplik

engine-e-telecom-timing-time-must-increase = time_s peab kasvama

engine-e-telecom-timing-the-series-must-be-uniformly = sari peab olema ühtlaselt diskreteeritud: samm { $v1 } on { $d } s, esimene on { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV rida { $v1 } ei ole `time_s,time_error_ns`

## src/telecom_timing.rs

engine-telecom-timing-the-mask-is-defined-through = mask on defineeritud { $lit_0_1 } Hz madalpääsfiltri kaudu, mida see mootor rakendab ainult valimiintervallidel { $MAX_FILTER_DT_S } s või vähem; see register on diskreeritud iga { $dt_s } s järel

engine-e-telecom-timing-give-either-holdover-or-series = tuleb anda kas [holdover] või [series], mitte mõlemad

engine-e-telecom-timing-give-either-series-samples-or = tuleb anda kas series.samples või series.csv_path, mitte mõlemad

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days peab olema lõplik ja >= 0

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns { $v2 } s jooksul; { $masks } (MODELLED)

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = tundmatu --format `{ $f }` (cef või leef)

engine-e-telemetry-cli-unknown-option = tundmatu valik `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input ja --result on teineteist välistavad

engine-e-telemetry-cli-listen-no-address = --listen { $l }: aadress puudub

engine-telemetry-cli-warning-metrics-is-served-without = hoiatus: /metrics on aadressil { $addr } avatud ilma autentimiseta; siduda tuleb localhost-iga või panna see oma juurdepääsukontrolli taha

engine-e-telemetry-cli-bind = sidumine { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = teenindab http://{ $bound }/metrics

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp ja --syslog-tcp on teineteist välistavad

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting kehtib valiku --syslog-tcp kohta

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: teemaosa ei tohi olla tühi, ei tohi sisaldada #, + ega alguses olevat /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp vajab ehitust valikuga `--features otlp`

engine-telemetry-cli-warning-input-line = hoiatus: sisendrida { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = ei saa avada { $p }: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] hoiatus: { $n } MQTT sõnum ei toimetatud kohale
       *[other] hoiatus: { $n } MQTT sõnumit ei toimetatud kohale
    }

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = lõpp-punkt peab algama väärtusega http://

engine-e-telemetry-otlp-endpoint-has-no-host = lõpp-punktil puudub host

engine-e-telemetry-otlp-resolve = lahendamine { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = { $hostport } jaoks puudub aadress

engine-telemetry-otlp-warning-otlp-export-failed = hoiatus: otlp eksport ebaõnnestus: { $e }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = ei ole JSON: { $e }

engine-e-telemetry-sample-not-json-object = ei ole JSON-objekt

engine-e-telemetry-sample-is-not-number = `{ $k }` ei ole arv

engine-e-telemetry-sample-is-not-finite = `{ $k }` ei ole lõplik

engine-e-telemetry-sample-missing = `t_s` puudub

engine-e-telemetry-sample-score-outside-100 = `score` { $s } jääb väljapoole vahemikku 0..=100

engine-e-telemetry-sample-missing-state = `state` puudub

engine-e-telemetry-sample-is-not-an-array = `{ $key }` ei ole massiiv

engine-e-telemetry-sample-entry-has-no-name = `{ $key }` kirjel puudub nimi

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` puudub või ei ole lõplik arv

engine-e-telemetry-sample-position-is-not-an-object = `position` ei ole objekt ega null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` puudub või ei ole string

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` ei ole lõplik arv >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` ei ole string

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` ei ole tõeväärtus

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` ei ole objekt ega null

engine-e-telemetry-sample-result-has-no-epochs = tulemusel puudub `epochs`

engine-e-telemetry-sample-bad-epochs = vigane `epochs`: { $e }

## src/telemetry/syslog.rs

engine-e-telemetry-syslog-host-is-bytes-syslog-host = host: baite { $host }; syslog hosti nimi on kuni 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = host peab olema trükitav ASCII ilma tühikuteta

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } vs { $w } (ei ole esitatav kui f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: olemas, oodati puudumist

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: puudub, oodati olemasolu

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } peab olema lõplik

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu peab olema lõplik ja mittenegatiivne

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: rida { $v1 }: ei ole MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: koodi { $code } jaoks puuduvad AR-kirjed

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = tundmatu seeria vorming { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } peab olema lõplik

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s peab andma 16 kuni 20000 mõõtmist

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } nihe { $ns } ns (Sagnac { $ns2 } ns, ionosfäär { $ns3 } ns); kombineeritud u { $ns4 } ns (tüüp A { $ns5 } ns juures { $averaging_s } s); { $series } tegelik seeria (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = mitte-ASCII märgid TLE-s { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE katkes { $what } lugemisel (veerud { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } on veeru 69 kontrollsumma jaoks liiga lühike

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } real puudub veerus 69 kontrollsumma number

engine-e-tle-tle-checksum-mismatch-column-69 = TLE { $label } kontrollsumma ei ühti: veerg 69 ütleb { $want }, arvutatud { $got }

engine-e-tle-not-tle-line = ei ole TLE rida 1: { $line1 }

engine-e-tle-not-tle-line-2 = ei ole TLE rida 2: { $line2 }

engine-e-tle-invalid-in-tle = vigane { $what } TLE-s: { $s }

engine-e-tle-invalid-epoch-year-in-tle = vigane epohhi aasta TLE-s: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = vigane katalooginumber TLE-s: { $col }

engine-e-tle-inclination-out-of-range-180 = kalle väljaspool vahemikku [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = ekstsentrilisus väljaspool vahemikku [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = mittepositiivne keskmine liikumine: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = vigane { $what } mantiss TLE-s: { $mant }

engine-e-tle-invalid-exponent-in-tle = vigane { $what } astendaja TLE-s: { $exp }

engine-tle-satellite-line-only-element-set = satelliit { $satnum }: ainult rea 2 elemendikomplekt parsiti analüütiliste Kepleri (kahe keha) elementidena — rea 1 takistus/B* ja SGP4 sekulaarsed liikmed puuduvad, mistõttu see orbiit triivib epohhist eemal tõelisest SGP4 sobitusest; SGP4 täpsuse saamiseks tuleb esitada vastav rida 1

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: C/N0 profiil vajab positiivset epohhi ja kestust

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: C/N0 profiil vajaks rohkem kui { $MAX_DETECTOR_STEPS } detektorisammu ({ $total } s, kui epohhi pikkus on { $epoch_s } s); ramp_duration_s tuleb lühendada või predetection_integration_s pikendada

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } peab olema lõplik

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } peab olema positiivne (saadi { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips peab olema alla { $lit_1_9 } chip (saadi { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio peab olema vähemalt 1 (saadi { $pullin_bandwidth_ratio }) — silmus, mis haaratakse uuesti KITSAMA ribalaiusega kui see, millega ta jälgib, pööraks hüstereesi ümber

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s ei tohi olla negatiivne

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) ei tohi ületada cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } ei tohi olla tühi

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } sisaldab kirjeid: { $axis }; ülempiir on { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } sisaldab mittelõplikku väärtust

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: kinnitusviiteajad peavad olema vähemalt 1 epohh

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = vaja on vähemalt kaheksat näidist

engine-e-twstft-budget-samples-must-increase-in-time = näidised peavad ajas kasvama

engine-e-twstft-budget-samples-must-be-on-regular = näidised peavad asuma korrapärasel ruudustikul

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }Ridu kokku: { $total }; väliselt kinnitatud { $validated }, modelleeritud { $modelled }, partneri vastutusel { $partner_owned }.{ "\u000A" }

engine-verification-the-complete-machine-checked-evidence = Täielik, masinkontrollitud tõendite register (ledger): **ridu: { $total } — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Rida võib olla VALIDATED ainult sõltumatu välise oraakli (sõltumatu etalon) korral (maatriksi invariantide testid jõustavad seda). Samad andmed, koos klõpsatavate ridakaupa linkidega igale testile, moodulile ja sissekantud fikstuurile, on *Valideerimisregister (Validation ledger)* aadressil https://kshana.dev. Miks ükski modelleeritud rida ei ole väliselt kinnitatud, vt [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md).{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }Võimekusi märgisega MODELLED: { $modelled }.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json ei ole JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json ei ole JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] vajab `label`

engine-wasm-runs-needs-result = runs[{ $i }] vajab `result`

engine-wasm-results-json-is-not-json = results_json ei ole stringide JSON-massiiv: { $e }

engine-wasm-maps-json-must-be-json = maps_json peab olema stringide JSON-massiiv: { $e }

engine-wasm-plans-json-is-not-json = plans_json ei ole stringide JSON-massiiv: { $e }

engine-wasm-options-json-is-not-json = options_json ei ole JSON: { $e }

engine-wasm-input-is-about-bytes-over = sisend on umbes { $b64 } baiti, üle piiri { $v2 } baiti

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Järjestikune reljeefipõhine navigatsioon (rekursiivne SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = vaba inertsiaalne triiv (kasvab)

engine-altpnt-sequential-terrain-matched-bounded = reljeefiga sobitatud (piiratud)

engine-altpnt-sequential-waypoint-full-scale = teekonnapunkt →    skaala lõpp { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Kshana käivituse aruanne

engine-advanced-report-meta = Liik <code>{ $kind }</code> · mootor { $engine } · stsenaarium <code>{ $scenario }</code> (faili räsi { $digest }…)

engine-advanced-report-toc-summary = 1 Kokkuvõte

engine-advanced-report-toc-inputs = 2 Sisendid

engine-advanced-report-toc-results = 3 Tulemused

engine-advanced-report-toc-aggregation = 3a Koondamine

engine-advanced-report-toc-companions = 3b Animatsioon ja ekspordid

engine-advanced-report-toc-events = 4 Sündmused

engine-advanced-report-toc-labels = 5 Verifitseerimismärgised

engine-advanced-report-toc-not-modelled = 6 Modelleerimata

engine-advanced-report-toc-reproducibility = 7 Reprodutseeritavus

engine-advanced-report-h-summary = 1. Kokkuvõte juhtidele

engine-advanced-report-honesty-label = <strong>Ausameelsusmärgis</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Kasutatud võimekused:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (toetutud, mitte pakutud); vt jaotist 5.

engine-advanced-report-member-runs = <strong>Liikmekäivitused:</strong> { $n }, koondatud jaotises 3a.

engine-advanced-report-h-inputs = 2. Sisendid

engine-advanced-report-inputs-note = Iga stsenaariumifailis määratud väli, tasandatud oma teeni. Ühikud pärinevad tulemuse plokist <code>units</code> (väljaühikute skeem, docs/field-units-schema.json), kui see välja kirjeldab, muidu välja nime järelliitest; ühik, mida kumbki ei esita, kuvatakse kui esitamata.

engine-advanced-report-th-parameter = Parameeter

engine-advanced-report-th-value = Väärtus

engine-advanced-report-th-unit = Ühik

engine-advanced-report-th-unit-source = Ühiku allikas

engine-advanced-report-h-results = 3. Tulemused

engine-advanced-report-chart-alt = Tulemuste diagramm

engine-advanced-report-also-written-to = { " " }(kirjutatud ka faili { $file })

engine-advanced-report-h-scalars = Skalaarsed tulemused

engine-advanced-report-h-columns = Arvulised veerud

engine-advanced-report-th-result = Tulemus

engine-advanced-report-th-column = Veerg

engine-advanced-report-th-count = Arv

engine-advanced-report-th-min = Min

engine-advanced-report-th-max = Max

engine-advanced-report-th-first = Esimene

engine-advanced-report-th-last = Viimane

engine-advanced-report-omitted-inputs = <p class="note">Selle lehe alt on välja jäetud { $n } sisendit; report.json loetleb samu ridu ja tulemusdokument sisaldab kõiki väärtusi.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">Selle lehe alt on välja jäetud { $n } skalaarset tulemust; report.json loetleb samu ridu ja tulemusdokument sisaldab kõiki väärtusi.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">Selle lehe alt on välja jäetud { $n } arvulist veergu; report.json loetleb samu ridu ja tulemusdokument sisaldab kõiki väärtusi.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">Selle lehe alt on välja jäetud { $n } sündmust; report.json loetleb samu ridu ja tulemusdokument sisaldab kõiki väärtusi.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Liikmekäivituste koondamine

engine-advanced-report-mode = <p>Režiim <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Režiim <strong>{ $mode }</strong> liigi <code>{ $kind }</code> üle.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Režiim <strong>{ $mode }</strong>, liikmekäivituste arv: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Režiim <strong>{ $mode }</strong> liigi <code>{ $kind }</code> üle, liikmekäivituste arv: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-run-digest = Käivituse räsi (SHA-256 liikmetulemuste räside üle, väljastamise järjekorras): <code>{ $digest }</code>

engine-advanced-report-table-empty = Selles tabelis pole ridu: tulemus ei loetle ühtegi.

engine-advanced-report-distribution-caption = Suuruse { $metric } Monte Carlo jaotus (valimeid: { $n }), 20 võrdse laiusega klassi; katkendjooned tähistavad 5., 50. ja 95. protsentiili.

engine-advanced-report-distribution-caption-unit = Suuruse { $metric } Monte Carlo jaotus (valimeid: { $n }, { $unit }), 20 võrdse laiusega klassi; katkendjooned tähistavad 5., 50. ja 95. protsentiili.

engine-advanced-report-h-companions = 3b. Animatsioon ja ekspordid

engine-advanced-report-animation-alt = Käivituse aegrea animatsioon

engine-advanced-report-animation-caption = Käivituse enda valimid joonistuvad liikuva ajakursori taha (käsu <code>--animate svg</code> animeeritud joonistus; vähendatud liikumise korral ja printimisel näitab see valmis pilti).

engine-advanced-report-no-animation = Animatsiooni pole: { $reason }

engine-advanced-report-no-animation-default = tulemus ei sisalda aegrida

engine-advanced-report-player-written-by = Interaktiivse mängija kirjutab <code>{ $command }</code>.

engine-advanced-report-written-beside = Kirjutatud selle aruande kõrvale: { $links }.

engine-advanced-report-th-export = Eksport

engine-advanced-report-th-applies = Kohaldub

engine-advanced-report-th-files-or-reason = Failid või põhjus

engine-advanced-report-written-by = kirjutab <code>{ $command }</code>

engine-advanced-report-does-not-apply = ei kohaldu

engine-advanced-report-yes = jah

engine-advanced-report-no = ei

engine-advanced-report-h-events = 4. Sündmuste ajajoon

engine-advanced-report-events-caption = Aknad ribadena, punktsündmused punktidena, käivituse enda ajateljel.

engine-advanced-report-th-start = Algus (s)

engine-advanced-report-th-end = Lõpp (s)

engine-advanced-report-th-event = Sündmus

engine-advanced-report-th-source = Allikas

engine-advanced-report-point-event = punktsündmus

engine-advanced-report-events-timeline = Sündmuste ajajoon

engine-advanced-report-point-events = punktsündmused ({ $n })

engine-advanced-report-distribution-of = Suuruse { $metric } jaotus

engine-advanced-report-max-bin = suurim klass { $n }

engine-advanced-report-h-labels = 5. Verifitseerimismärgised

engine-advanced-report-th-capability = Võimekus (maatriksi nõue)

engine-advanced-report-th-label = Märgis

engine-advanced-report-th-used-by = Kasutaja

engine-advanced-report-th-oracle = Allikas: oraakel

engine-advanced-report-th-test-evidence = Testitõendid

engine-advanced-report-h-figure-tiers = Tulemuse esitatud näitajapõhised tasemed

engine-advanced-report-th-figure = Näitaja

engine-advanced-report-th-tier = Tase

engine-advanced-report-th-matrix-requirement = Maatriksi nõue

engine-advanced-report-th-applicable = Kohaldatav

engine-advanced-report-no-attack = ei (rünnakut pole seadistatud)

engine-advanced-report-h-not-modelled = 6. Modelleerimata asjad ja eeldused

engine-advanced-report-not-modelled-note = Iga punkt on tsiteeritud sealt, kus see on esitatud: tulemusdokumendist, liikide kataloogist, stsenaariumifailist või verifitseerimismaatriksi põhjendusest, miks MODELLED rida jääb modelleerituks.

engine-advanced-report-th-statement = Väide

engine-advanced-report-h-reproducibility = 7. Reprodutseeritavuse kirje

engine-advanced-report-rk-command = Reprodutseerimise käsk

engine-advanced-report-rk-working-directory = Töökataloog

engine-advanced-report-rk-engine-version = Mootori versioon

engine-advanced-report-rk-source-commit = Lähtekoodi commit

engine-advanced-report-rk-scenario-file = Stsenaariumifail

engine-advanced-report-rk-scenario-sha = Stsenaariumifaili SHA-256 (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = Tulemuse scenario_hash

engine-advanced-report-rk-result-sha = Tulemusdokumendi SHA-256

engine-advanced-report-rk-seed = Algväärtus (seed)

engine-advanced-report-rk-platform = Platvorm

engine-advanced-report-rk-generated = Uuringu koostamise aeg (UTC)

engine-advanced-report-rk-determinism = Determinism

engine-advanced-report-result-hash-none = tulemusdokument ei esita ühtegi

engine-advanced-report-print-note = Selle lehe printimiseks Portable Document Format (PDF) faili kasuta brauseri printimisdialoogi ja vali „Salvesta PDF-ina“; printimisstiil sobib A4- ja US Letter-paberile, kordab tabelipäiseid lehtede vahel ja alustab sisendite, tulemuste, märgiste ja reprodutseeritavuse jaotisi uuelt lehelt. Mootor ise PDF-i ei kirjuta. report.json sisaldab sama sisu mis see leht.

engine-advanced-report-footer = Koostanud Kshana { $engine }.{ $stamp } Reprodutseeritav stsenaariumi + algväärtuse (seed) + mootori versiooni põhjal. Vaba ja avatud lähtekoodiga (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">lähtekood ja dokumentatsioon</a>.

engine-advanced-report-empty-inputs = Stsenaarium ei määra ühtegi välja peale `kind`: liik käivitas oma etalonseadistuse dokumenteeritud vaikeväärtustega.

engine-advanced-report-empty-scalars = Tulemusdokument ei sisalda ühtegi massiividest väljaspool olevat skalaari; selle arvud on allpool veergude kaupa kokku võetud.

engine-advanced-report-empty-series = Tulemusdokument ei sisalda ühtegi arvmassiivi: iga tulemus on skalaar ülaltoodud tabelis.

engine-advanced-report-empty-events = Ajastatud sündmusi pole: stsenaarium ei skriptiga ühtegi akent ega algusaega ja tulemus ei raporteeri sündmust. Liik hindab oma seadistust ühe juhtumina.

engine-advanced-report-empty-not-modelled = Ei tulemus, liikide kataloog, stsenaarium ega kasutatud maatriksiread esita selle käivituse kohta modelleerimispiirangut.

engine-advanced-report-capabilities-statement = Iga rida on verifitseerimismaatriksi rida, mida selle käivituse liigid rakendavad, koos märgise ja oraakliga, mille maatriks sellele annab (src/verification.rs, docs/VERIFICATION-MATRIX.md). Märgis hindab võimekust nii, nagu maatriks seda registreerib; see ei hinda selle stsenaariumi seadistust ja VALIDATED rida ei tee käivituse sisendeid mõõdetuks. PARTNER rida on distsipliin, millele käivitus toetub ja mida Kshana ei paku.

engine-advanced-report-no-run-label = Tulemus ei sisalda käivitustaseme ausameelsusmärgist; kasutatud võimekuste verifitseerimismärgised on loetletud omaette jaotises ja näitajapõhised tasemed seal, kus tulemus need esitab.

engine-advanced-report-no-seed = Ei stsenaarium ega tulemus sisalda algväärtust (seed). Tulemuse määravad ainult stsenaariumifail ja mootori järk; determinismitest käivitab uuesti iga kaasasoleva stsenaariumi ja nõuab baidi täpsuseni identset väljundit.

engine-advanced-report-working-directory = Käivita käsk kataloogist, kust algne käivitus alustati: stsenaariumi tee ja kõik stsenaariumisisesed suhtelised andmeteed lahendatakse selle suhtes. Kontrolli esmalt stsenaariumifaili vastavust väärtusele scenario_sha256.

engine-advanced-report-determinism-stamped = Samad stsenaariumi baidid, algväärtus (seed) ja mootori järk annavad sama tulemusdokumendi, välja arvatud selle meta.generated_utc tempel, mille --study-name kirjutab kellast; baidi täpsuseni identse väljundi saamiseks käivita ilma --study-name. Ujukomatulemused on fikseeritud platvormi kaupa; teine operatsioonisüsteem või arhitektuur võib erineda viimastes numbrites.

engine-advanced-report-determinism-plain = Samad stsenaariumi baidid, algväärtus (seed) ja mootori järk annavad baidi täpsuseni identse tulemusdokumendi ja aruande; see aruanne ei sisalda ajatemplit. Ujukomatulemused on fikseeritud platvormi kaupa; teine operatsioonisüsteem või arhitektuur võib erineda viimastes numbrites.

engine-advanced-report-not-applicable-no-attack = ei kohaldu (rünnakut pole seadistatud)

engine-advanced-report-what-ran-default = Stsenaarium `{ $kind }`.

engine-advanced-report-nothing-carried = midagi pole kaasas

engine-advanced-report-tbl-sweep-nodes = Pühkimissõlmed

engine-advanced-report-tbl-mc-summary = Monte Carlo jaotuse kokkuvõte (protsentiilid on lähima järgu meetodil; 95% usaldusvahemik keskmisele on fikseeritud algväärtusega (seed) protsentiili bootstrap)

engine-advanced-report-tbl-chain-phases = Ahela faasid

engine-advanced-report-tbl-shared = Ühised tingimused

engine-advanced-report-tbl-members = Liikmed

engine-advanced-report-tbl-combined = Liikmete üleselt kombineeritud

engine-advanced-report-tbl-optimiser-best = Optimeerija parim (lokaalne optimum esitatud piirides)

engine-advanced-report-tbl-optimiser-trace = Optimeerija jälg

engine-advanced-report-tbl-sweep-grid = Pühkimisvõrk

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Reljeefipõhine navigatsioon (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Gravitatsioonikaardiga sobitatud navigatsioon

engine-altpnt-terrain-title-combined = Kombineeritud gravitatsiooni + magnet- + reljeefipõhine alt-PNT

engine-altpnt-terrain-free-inertial-drift = vaba inertsiaalne triiv

engine-altpnt-terrain-terrain-matched = reljeefiga sobitatud

engine-altpnt-terrain-gravity-matched = gravitatsiooniga sobitatud

engine-altpnt-terrain-gravity-only = ainult gravitatsioon

engine-altpnt-terrain-magnetic-only = ainult magnetväli

engine-altpnt-terrain-terrain-only = ainult reljeef

engine-altpnt-terrain-combined-fused = kombineeritud (liidetud)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · stsenaarium { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Kuu signaaliturbe ründepind (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = nähtavad releed

engine-body-pnt-chart-count = arv

engine-body-pnt-chart-formal-one-sigma-position = formaalne ühe sigma asukoht (log10 m): sinine ainult satelliidikonstellatsioon, merevaigukollane koos Maa vahemaaga

engine-body-pnt-chart-time-since-epoch = aeg epohhist, 0 kuni { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = kella ajaviga vs kaitsevaru (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 vs jälgimisalumine piir (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = kaitsetase vs häirepiir (m)

engine-campaign-chart-position-error-vs-threshold = asukohaviga vs lävi (m)

engine-campaign-chart-satellites-tracking = jälgitavad satelliidid

engine-campaign-chart-alarm-flags-and-events = häirelipud ja sündmused

engine-campaign-chart-mission-time = missiooniaeg { $duration } s

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) kohal { $lead }

engine-campaign-chart-monte-carlo-of = `{ $scenario_kind }` Monte Carlo: { $n_runs } algväärtust (seed) alates { $base_seed } (5., 50., 95. protsentiil; ribi = keskmise bootstrap 95% usaldusvahemik)

engine-campaign-chart-composed-members = ühiste tingimuste all koostatud liikmed: { $shared }

engine-campaign-chart-not-available = n/a

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Tsislunaarse kaare pikkuse taastamine — hindaja, mis ei jaga Jacobi maatrikseid

engine-cislunar-arc-recovery-chart-subtitle = lõplike vahede partii vähimruudud · mõõdetud olekutaastuse viga · ilma analüütilise Jacobi maatriksita, ilma variatsioonilise STM-ita, ilma SVD astaklävi tolerantsita

engine-cislunar-arc-recovery-chart-bound = tõke { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = Grami maatriksi astaklävi

engine-cislunar-arc-recovery-chart-monte-carlo-rms = Monte Carlo RMS asukohataastuse viga (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = müravaba halvim taastussuhe (lõppviga / nihe)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Tsislunaarne vaadeldavus jälgimiskaare ulatuses (P6)

engine-cislunar-observability-chart-subtitle = aste vs kaar (ainult vahemaa, üks link) · Grami maatriksi omaspekter · diferentsiaalselt korrigeeritud DRO ICs + SRIF ristkontroll · { $modelled } kavand, { $validated } aste/STM/sulgumine

engine-cislunar-observability-chart-observable-rank = vaadeldav aste vs kaare pikkus

engine-cislunar-observability-chart-arc-length = kaare pikkus (pöörleva taustsüsteemi ajaühikud, kokku { $arc_hours } h)

engine-cislunar-observability-chart-gramian-eigenvalues = Grami maatriksi omaväärtused (log10)

engine-cislunar-observability-chart-condition = tinglikkus κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Kihilise PNT konfliktikindlus (P7)

engine-conflict-resilience-chart-subtitle = täielik kadu vs ohu intensiivsus (MC vs suletud kuju) · vastupidavussuhe vs keelamise korrelatsioon · { $modelled } eeljaotust, { $validated } MC->suletud kuju / koopula servjaotused

engine-conflict-resilience-chart-total-loss-probability = täieliku kao tõenäosus vs intensiivsus

engine-conflict-resilience-chart-threat-intensity = ohu intensiivsus

engine-conflict-resilience-chart-layered-mc = kihiline MC

engine-conflict-resilience-chart-single-layer = üks kiht

engine-conflict-resilience-chart-resilience-ratio = vastupidavussuhe vs keelamise korrelatsioon

engine-conflict-resilience-chart-denial-correlation = keelamise korrelatsioon ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = kättesaadavus (%)

engine-constellation-chart-mean-pdop = keskmine PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = Maa GNSS Kuu kaugusel — C/N0 vs telgemaarne nurk

engine-earth-gnss-lunar-chart-track-threshold = jälgimine { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = Maa serv { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = telgemaarne nurk (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = kuldne = jälgitav · punane = liiga nõrk · hall = Maa poolt varjatud · { $modelled } saatemuster

## src/ensemble.rs

engine-ensemble-chart-title = Kella holdover (aja hoidmine ilma välise etalonita): ajavea usaldusriba (käivitusi: { $n_runs })

engine-ensemble-chart-timing-error-ns = ajaviga (ns)

engine-ensemble-chart-spec-threshold = spets { $threshold } ns

engine-ensemble-chart-time-s = aeg (s)

engine-ensemble-chart-classical-median-band = klassikaline: { $id } (mediaan, 5–95% riba)

engine-ensemble-chart-quantum-median-band = kvant: { $id } (mediaan, 5–95% riba)

## src/frame_eop.rs

engine-frame-eop-chart-title = Reaalajas taustsüsteemi / EOP prognoosi eelarve Kuu ajastuse jaoks

engine-frame-eop-chart-ut1-error-ms = UT1 viga (ms)

engine-frame-eop-chart-position-at-moon-m = asukoht Kuul (m)

engine-frame-eop-chart-equiv-timing-ns = samaväärne ajastus (ns)

engine-frame-eop-chart-prediction-horizon-days = prognoosihorisont (päeva)

engine-frame-eop-chart-iers-final-floor = IERS lõplik alampiir { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m Kuul

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = 17-olekuline hübriid-UKF — filtri enesekooskõla (modelleeritud)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + innovatsiooni valgus vs 95% χ² ribad; { $lit_1_0 } = kooskõlas. Enesekooskõla, mitte täpsus.

engine-fusion-hybrid-ukf-chart-target = siht { $lit_1_0 }

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (valgus)

engine-fusion-hybrid-ukf-chart-nees = NEES

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Lõdvalt seotud GNSS/INS horisontaalviga

engine-fusion-pack-chart-horizontal-error-m = horisontaalviga (m)

engine-fusion-pack-chart-spec-threshold = spets { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Taevakaart ({ $label })

engine-geometry-chart-satellite-tooltip = { $system } { $id } asimuut { $az } kõrgus { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } asimuut { $az } kõrgus { $el } (varjatud silmapiiri poolt)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } asimuut { $az } kõrgus { $el } (maski all)

engine-geometry-chart-no-fix = lahendus puudub

engine-geometry-chart-in-view-hidden = nähtav { $n_visible }, silmapiiri poolt varjatud { $n_masked } · { $dop } · õõnes: pole nähtav

engine-geometry-chart-satellites-as-given = satelliidid nii, nagu antud

engine-geometry-chart-representative-sky = esinduslik taevas, mitte dateeritud

engine-geometry-chart-footer = Kshana v{ $version } · geomeetria esitatud veamudeli all · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = RAIM kaitsetasemed vs häirepiirid

engine-gnss-sim-chart-protection-level-m = kaitsetase (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

## src/holdover_test.rs

engine-holdover-test-chart-title = Holdover-test (aja hoidmine ilma välise etalonita): ajaviga sammu kaupa

engine-holdover-test-chart-y-title = |ajaviga| (ns)

engine-holdover-test-chart-panel-caption = absoluutne ajaviga; holdover-i samm varjutatud; katkendjooned on ajavea eelarved

engine-holdover-test-chart-gnss-removed = GNSS eemaldatud

engine-holdover-test-chart-gnss-restored = GNSS taastatud

engine-holdover-test-chart-time-axis = aeg salvestuse teljel ({ $min } min)

## src/hybrid.rs

engine-hybrid-chart-title = Hübriid-PNT spetsifikatsiooni kasutus GNSS-i katkestuse ajal ({ $lit_1_0 } = spets)

engine-hybrid-chart-y-title = spetsifikatsiooni kasutus

engine-hybrid-chart-spec-line = spets ({ $lit_1_0 })

engine-hybrid-chart-classical-suite = klassikaline komplekt

engine-hybrid-chart-quantum-suite = kvantkomplekt

## src/hybrid_integrity.rs

engine-hybrid-integrity-chart-availability = kättesaadavus

engine-hybrid-integrity-chart-precision = korduvtäpsus

engine-hybrid-integrity-chart-integrity = terviklikkus

engine-hybrid-integrity-chart-joint-indep = ühine (sõltumatu)

engine-hybrid-integrity-chart-joint-corr = ühine (korreleeritud)

engine-hybrid-integrity-chart-title = Hübriid optilise + RF PNT-i ühine kvaliteedinäitaja

engine-hybrid-integrity-chart-subtitle = P(kättesaadav JA korduvtäpsuse klass JA terviklikkus tagatud)

## src/inertial/mod.rs

engine-inertial-chart-title = Asukohaarvestuse asukohaviga GNSS-i katkestuse ajal

engine-inertial-chart-y-title = asukohaviga (m)

engine-inertial-chart-spec-line = spets { $m } m

engine-inertial-chart-classical = klassikaline: { $id }

engine-inertial-chart-quantum = kvant: { $id }

## src/iq/campaign/report.rs

engine-iq-campaign-report-roc-aria-label = Tuvastamise ROC jälgija kohta

engine-iq-campaign-report-roc-x-title = P_fa (negatiivse akna kohta)

engine-iq-campaign-report-curve-aria-label = C/N0 halvenemine vs esitatud J/S sündmuse { $ev } jaoks ({ $rec })

engine-iq-campaign-report-curve-x-title = esitatud J/S (dB)

engine-iq-campaign-report-curve-y-title = C/N0 halvenemine (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: SSC etalon, Q = { $q }

engine-iq-campaign-report-curve-model-legend = { $label } etalon (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } rida skoorikaardi tabelis

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, mõõdetud halvenemine { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (mõõdetud)

## src/jamming.rs

engine-jamming-chart-title = Nähtavad vs jälgitavad satelliidid segamise (jamming) all

engine-jamming-chart-y-title = satelliidid

engine-jamming-chart-four-sv-fix = 4-SV lahendus

engine-jamming-chart-visible = nähtav

engine-jamming-chart-tracking = jälgitav

## src/leo_fusion/ntn.rs

engine-leo-fusion-ntn-chart-title = 5G NTN positsioneerimine: Cramér-Rao vahemaapiir ribalaiuse kaupa

engine-leo-fusion-ntn-chart-caption = vahemaa ühe sigma (log10 m): ribi = mask kuni seniit C/N0; punkt = RMS 3D lahenduse viga

## src/leo_fusion/ppp.rs

engine-leo-fusion-ppp-chart-title = PPP koondumine LEO täiendusega

engine-leo-fusion-ppp-chart-caption = mediaanne horisontaalviga (log10 m) vs minutid

engine-leo-fusion-ppp-chart-n-leo = { $n } LEO

## src/leo_fusion/pvt_kind.rs

engine-leo-fusion-pvt-kind-chart-doppler-caption = 3D Doppleri lahenduse viga (log10 m) vs akna pikkus

engine-leo-fusion-pvt-kind-chart-doppler-x-label = aken (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = mediaanne PDOP (sinine) ja VDOP (merevaigukollane), log10, vs lisatud LEO satelliidid

engine-leo-fusion-pvt-kind-chart-joint-x-label = lisatud LEO satelliidid

engine-leo-fusion-pvt-kind-chart-polar-caption = mediaanne VDOP (log10): hall GNSS, sinine LEO, merevaigukollane liidetud

engine-leo-fusion-pvt-kind-chart-polar-x-label = laiuskraad (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = RMS ajaviga UTC suhtes (log10 ns) vs C/N0 nihe, üks joon ostsillaatori kohta

engine-leo-fusion-pvt-kind-chart-timing-x-label = C/N0 nihe (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 } kuni { $x1 }

## src/leo_navmsg/mod.rs

engine-leo-navmsg-chart-title = LEO navigatsioonisõnum: SISRE vs sobitusintervall

engine-leo-navmsg-chart-no-trade-encode-decode = Selles käivituses kompromissi pole; kodeerimise/dekodeerimise ja eelarve tabeleid vt result.json.

engine-leo-navmsg-chart-no-fit-interval-trade = Selles käivituses sobitusintervalli kompromissi pole; vt result.json.

engine-leo-navmsg-chart-caption = ainult orbiidi SISRE RMS (m, logaritmiline skaala) vs sobitusintervall (s)

## src/leo_pass.rs

engine-leo-pass-chart-title = LEO ülelend: C/N0 sageduskiire kohta ja Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 kuni 80): LEO sageduskiired värviga, GNSS hallilt

engine-leo-pass-chart-time-axis = aeg epohhist, 0 kuni { $s } s

## src/leo_pnt_chain.rs

engine-leo-pnt-chain-chart-subtitle = signaali kavand -> ülelennu C/N0 ja koodi värin -> sõnumi SISRE -> liidetud lahendus · { $label }

engine-leo-pnt-chain-chart-cn0-caption = Jälgitud komponendi C/N0 ülelennu jooksul (dB-Hz, 20 kuni 80)

engine-leo-pnt-chain-chart-not-available = n/a

## src/leo_signal.rs

engine-leo-signal-chart-title = LEO-PNT signaalikavandid

engine-leo-signal-chart-psd-axis = nihe ±{ $lit_0_6 } × saate ribalaiusest; 0 kuni −50 dB iga tipu all

engine-leo-signal-chart-jitter-caption = koodi värin (m, logaritmiline skaala) vs kogu C/N0 (dB-Hz)

## src/main.rs

engine-main-fail = viga: { $e }

## plural forms

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] LAIENDUS (R3) — see käivitus EI OLE tasapinnaline DRO konfiguratsioon, mida ülaltoodud `label` kirjeldab. Olekudimensioon { $state_dim }; orbiidiperekond { $family }; { $n_spacecraft } kosmoseaparaat; kaugusmõõtmise sigma { $sigma_range_m } m. Kus `label` ütleb "planar" ja "planar DROs", lugege siin nimetatud perekonda. VALIDATED täiendused: 6x6 variatsiooniline STM on sama lõplike vahedega kinnitatud CR3BP STM (crate::cr3bp), mida kasutatakse täislaiuses; ruumilised range / range-rate Jacobi maatriksi read on lõplike vahedega kinnitatud analüütilised osatuletised, range-rate rida on komponent-komponendi haaval kontrollitud crate'i sõltumatu 3D deepspace_od::range_rate_observable vastu; halo / NRHO algtingimused on diferentsiaalselt korrigeeritud perioodilised orbiidid sama korrektori abil, mis reprodutseerib avaldatud L2 lõunapoolset 9:2 NRHO-d, jätkatud sellest avaldatud algväärtusest (seed), ja iga liikme sulgumisjääk on esitatud; kuue oleku ASTAKU otsused on kinnitatud SÕLTUMATU rea-astmelise astaku vastu (Gaussi elimineerimine osalise pöördvalikuga), mis ei jaga koodi omaväärtuste/SVD teega. SRIF-HARU AUS PIIRANG: ülaltoodud SRIF-i ristvalideerimine kasutab SAMU mõõtmise Jacobi maatrikseid ja taandub samale O^T O-le, seega on selle kooskõla kahe numbrilise masina vaheline järjepidevuskontroll, MITTE sõltumatu kinnitus lävele — seda ei loeta ühegi siinse arvu kinnitusena. MODELLED: perekonna kavand (millised abstsissid, amplituudid ja faasid), epohhiruudustik, ühe lingi kaar ja hinnatavuse kriteeriumi ette antud asukohapiir.
       *[other] LAIENDUS (R3) — see käivitus EI OLE tasapinnaline DRO konfiguratsioon, mida ülaltoodud `label` kirjeldab. Olekudimensioon { $state_dim }; orbiidiperekond { $family }; { $n_spacecraft } kosmoseaparaati; kaugusmõõtmise sigma { $sigma_range_m } m. Kus `label` ütleb "planar" ja "planar DROs", lugege siin nimetatud perekonda. VALIDATED täiendused: 6x6 variatsiooniline STM on sama lõplike vahedega kinnitatud CR3BP STM (crate::cr3bp), mida kasutatakse täislaiuses; ruumilised range / range-rate Jacobi maatriksi read on lõplike vahedega kinnitatud analüütilised osatuletised, range-rate rida on komponent-komponendi haaval kontrollitud crate'i sõltumatu 3D deepspace_od::range_rate_observable vastu; halo / NRHO algtingimused on diferentsiaalselt korrigeeritud perioodilised orbiidid sama korrektori abil, mis reprodutseerib avaldatud L2 lõunapoolset 9:2 NRHO-d, jätkatud sellest avaldatud algväärtusest (seed), ja iga liikme sulgumisjääk on esitatud; kuue oleku ASTAKU otsused on kinnitatud SÕLTUMATU rea-astmelise astaku vastu (Gaussi elimineerimine osalise pöördvalikuga), mis ei jaga koodi omaväärtuste/SVD teega. SRIF-HARU AUS PIIRANG: ülaltoodud SRIF-i ristvalideerimine kasutab SAMU mõõtmise Jacobi maatrikseid ja taandub samale O^T O-le, seega on selle kooskõla kahe numbrilise masina vaheline järjepidevuskontroll, MITTE sõltumatu kinnitus lävele — seda ei loeta ühegi siinse arvu kinnitusena. MODELLED: perekonna kavand (millised abstsissid, amplituudid ja faasid), epohhiruudustik, ühe lingi kaar ja hinnatavuse kriteeriumi ette antud asukohapiir.
    }

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one] { $n_meas } mõõtmine ei saa lahendada { $n ->
            [one] { $n } Doppleri tundmatu
           *[other] { $n } Doppleri tundmatut
        }
       *[other] { $n_meas } mõõtmist ei saa lahendada { $n ->
            [one] { $n } Doppleri tundmatu
           *[other] { $n } Doppleri tundmatut
        }
    }

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    { $n ->
        [one] { $obs } pseudovahemaad ei saa lahendada { $n } tundmatu (3 asukohta + { $n_clock ->
            [one] { $n_clock } kell
           *[other] { $n_clock } kella
        })
       *[other] { $obs } pseudovahemaad ei saa lahendada { $n } tundmatut (3 asukohta + { $n_clock ->
            [one] { $n_clock } kell
           *[other] { $n_clock } kella
        })
    }

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok: { $kind } — kind lahendub ja kõik { $n_required } selle avaldatud kohustusliku välja kirje on täidetud; väljade väärtusi ei kontrollita
       *[other] ok: { $kind } — kind lahendub ja kõik { $n_required } selle avaldatud kohustusliku välja kirjet on täidetud; väljade väärtusi ei kontrollita
    }

## legal

# legal: native review
engine-legal-compliance-statement = „evidenced“ märgitud rida tähendab, et selle komplekti käivitus toetab tõendeid rea nimetatud võimekuste jaoks. See ei ole järeldus, et raamistik on täidetud, ega tähenda, et keegi oleks mõnda toodet hinnanud või heaks kiitnud. Lünkade veerg näitab, mida käivitused ei näita.

# legal: native review
engine-legal-bench-surface-notice = Ainult sõiduki liikumine ja märgitud sündmusintervallid. Miski siin eksporditust ei ole raadiosagedus- ega baasribasignaal, ei modelleeri sellist signaali ega juhi seda ning sündmus on ajavahemik, mitte retsept häirete tekitamiseks. Signaalid annavad laborisimulaator ja selle operaator, kes vastutavad nende käivitamise eest ainult seal, kus see on lubatud (juhtmega või varjestatud ruumis, simulaatori enda ohutusjuhiste kohaselt). Kshana ei avalda selliste käivituste tulemusi.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: aknatasemel ROC iga monitori kohta antud salvestistel. Iga esitatud sündmuseaken on positiivne ja iga sündmustest väljaspool olev roc_window_s aken negatiivne; aken loetakse lävel arvesse, kui monitori testsuurus selle aknas saavutab. P_fa on negatiivse akna kohta, mitte testi kohta.

# legal: native review
engine-legal-lunanet-afs-advisory = Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. See kontrollib sümbolivoogu avaldatud spetsifikatsiooni ühe väljaande vastu ega ütle midagi ühegi LunaNeti sõlme ega teenuse kohta.

# legal: native review
engine-legal-iqfit-statement = MODELLED: iga sobitatud arv kirjeldab avatud vastuvõtjat (nimetatud ahelakujundust ja sisendtrakti) talle antud salvestistel, sobitatud kampaania hinnatud tulemustele. See ei ole ühegi teise vastuvõtja mõõtmine. Ennustused on märgitud PREDICTION, koos lähima testitud salvestise ja kaugusega testitud tingimustest väljaspool.

# legal: native review
engine-legal-iqfit-advisory = Nõuandev: analüüsitulemus, mitte tüübikinnitust omav navigatsiooniseade; ennustused on mudeli väljundid teatatud veaga, mitte garantiid.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Allikaavaldus, mitte väide: ICG WG-B Lunar PNT materjal juunist 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, uuringu allikas S3) kirjeldab jaama juures asuvat kuu ajaetaloni laborit nanosekunditasemel ajaeesmärgiga. Kshana tsiteerib seda eesmärki ainult konteksti jaoks; see ei võta seda omaks ja miski selles plokis ei näita, et ükski tegelik jaama kell seda täidaks.

# legal: native review
engine-legal-standards-pack-notice = Standardite pakett mõõdab modelleeritud stsenaariume enne käivitust esitatud lävede suhtes. See toetab tõendeid nimetatud raamistiku ridade jaoks; see ei hinda ega kiida heaks ühtegi toodet ning MET-märgitud lävi ütleb ainult, et stsenaariumi modelleeritud väljund täitis esitatud läve.

# legal: native review
engine-legal-standards-pack-advisory = Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus; seda ei tohi kasutada ainsa alusena ühegi navigatsiooni- ega ohutusotsuse tegemisel.

# legal: native review
engine-legal-geometry-statement = Geomeetria esitatud veamudeli korral (MODELLED): otsenähtavus esitatud silmapiiri suhtes, DOP ja gaussi vea-ellips sõltumatute, võrdsete, nullkeskmiste gaussi kaugusvigade jaoks esitatud kasutaja ekvivalentse kaugusveaga. See ei ole ennustus vastuvõtja tegeliku vea kohta, milles on ka nihkeid, mitmeteelevi ja otsenähtavuseta vigu, ning see ei ole terviklikkuse piir. Eelseadistatud konstellatsioonid on esinduslik geomeetria, mitte selle kuupäeva taevas selles kohas.

# legal: native review
engine-legal-resilience-disclaimer = Simulatsioonist tuletatud enesehinnang, seostatud DHS RPCF v2.0-ga. See ei ole sertifitseerimine ega akrediteerimine ega esinda ühegi asutuse (DHS, IEEE või muu) heakskiitu. Iga alamskoor on MODELLED, kui seda pole selgesõnaliselt märgitud VALIDATED, ning skoorid on ajadomeeni ja tuvastamise kvaliteedinäitajad, mitte asukohadomeeni täpsus.

# legal: native review
engine-legal-observatory-notice = Halvenenud lahter tähendab, et suur osa õhusõidukitest teatas seal sel päeval madalast navigatsioonitäpsusest. Ühtegi põhjust ei omistata. Lahter, mida ei vaadeldud või mis puudub, ei olnud hinnatud, mis ei ole sama mis häireteta. Ainult nõuandev: mitte heakskiit, sertifitseerimine ega vastavusavaldus.

# legal: native review
engine-legal-receiver-trust-advisory = Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC 61108, IEC 61162): laeva navigeerimise eest vastutab jätkuvalt operaator.

# legal: native review
engine-legal-evidence-roundtrip-notice = Seob neli kirjet räsiga (hash): stsenaarium, labori esitatud katsetingimused, vastuvõtjalogi ja selle logi skoor esitatud sündmuste suhtes. See ei ole signaal, mitte taasesituse retsept ega sertifitseerimine. See, kuidas stsenaariumi liikumine vastuvõtjani jõudis (laborisimulaatoriga esitatud fail, juhtmega või varjestatud ruumis), oli operaatori vastutus ja on siin kirjas ainult nii, nagu see esitati.

# legal: native review
engine-legal-evidence-bundle-disclaimer = See pakett on tehniline kirje sellest, mida Kshana mootor arvutas esitatud vastuvõtjalogist esitatud konfiguratsiooniga. See ei ole õiguslik arvamus, mitte faktide kindlakstegemine ühegi sündmuse või selle põhjuse kohta ega sertifitseerimine.

# legal: native review
engine-legal-bench-notice = Nõuandev: modelleeritud või mõõdetud teatatud etalonide suhtes; mitte heakskiit, sertifitseerimine ega vastavusavaldus. Skoor kirjeldab logi või korpust, mitte kunagi toodet.

# legal: native review
engine-legal-osnma-advisory = Nõuandev: see on analüüsi- ja seiretulemus, mitte tüübikinnitust omav navigatsiooniseade. Siin esitatud autentimise olek ei ole navigatsiooni terviklikkuse teenus ega tohi olla ainus alus ühegi navigatsiooni- ega ohutusotsuse tegemisel.

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = `{ $scenario_kind }` pühkimine üle { $axis_order } (sõlmi { $nodes }, mediaan 5.–95. protsentiili ribaga { $n_runs } algväärtuse (seed) kohta; iga joon oma vahemikus)

engine-holdover-test-holdover-not-recovered-within-record = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; ei taastunud salvestuse jooksul (MODELLED, mõõdetud maski suhtes)

engine-holdover-test-holdover-recovered-after-gnss-returned = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; taastus { $t } s pärast GNSS-i naasmist (MODELLED, mõõdetud maski suhtes)

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = kirjutas kshana iq scene: SIMULEERITUD stseen, mitte salvestus; täisarvuline skaala: 1 LSB = { $sc } müra suhtes normaliseeritud ühikut (oodatav RMS { $v1 } LSB komponendi kohta), kärbitud elemente: { $clipped }

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = kirjutas kshana iq scene; täisarvuline skaala: 1 LSB = { $sc } müra suhtes normaliseeritud ühikut (oodatav RMS { $v1 } LSB komponendi kohta), kärbitud elemente: { $clipped }

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = kirjutati { $samples } näidist ({ $format }, { $fs_hz } Hz) faili { $data_path }; { $truth_records } tõekirjet faili { $truth_path }; { $meta_note }; kanal: { $chan_desc }; täisarvuline skaala: 1 LSB = { $sc } müra suhtes normaliseeritud ühikut (oodatav RMS { $v1 } LSB komponendi kohta), kärbitud elemente: { $clipped }

engine-lunar-chart-title = Kuu lõunapooluse HPL ({ $availability }% kättesaadav, AL { $al } m, σ_URE { $sigma } m)

engine-lunar-beacon-chart-title = Pinnamajaki täiendus — PDOP konfiguratsiooni kaupa

engine-lunar-beacon-chart-no-solution = lahendus puudub

engine-lunar-beacon-chart-footnote = madalam on parem; majaki kohta sigma_URE { $sigma } m, mask { $mask } deg

engine-lunar-combination-chart-title = Kuu ühine OD + kell — jaama 3-D asukohaviga (VLBI taastab vaadeldavuse)

engine-lunar-combination-chart-subtitle = satelliite { $n_sat }, Maa jaamu { $n_earth } · paranduskordaja { $factor }×

engine-lunar-combination-chart-with-vlbi = VLBI-ga: { $m } m

engine-lunar-combination-chart-range-only = ainult vahemaa: { $m } m

engine-lunar-combination-chart-axis-note = log10 jaama viga (m); koondunud koos/ilma = { $with }/{ $without }

engine-lunar-dpnt-chart-title = Kuu diferentsiaal-PNT — satelliite { $n_sats }: korrigeeritud viga vs baasjoon (vähenemine × { $factor } kohal { $km } km)

engine-lunar-dpnt-chart-subtitle = korrigeerimata { $uncorrected } m | korrigeeritud { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = korrigeerimata (autonoomne)

engine-lunar-dpnt-chart-baseline-km = baasjoon (km)

engine-lunar-dpnt-chart-err-m = viga (m)

engine-lunar-frame-realise-chart-title = Kuu tugisüsteemi realiseerimine — 7-parameetriline Helmerti taastamine

engine-lunar-frame-realise-chart-subtitle = punkte { $n_points } · RMS jääk { $rms } m · koondunud { $converged }

engine-lunar-frame-realise-chart-scale = mõõtkava (ppb)

engine-lunar-frame-realise-chart-row = { $label }: sisestatud { $inj } { $unit } · taastatud { $rec } { $unit } · viga { $err }

engine-lunar-interop-chart-title = Kuu koostalitlusvõime eksport — CCSDS OEM + KIF (LunaNet/IOAG-ga joondatud)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | olekuid { $n_states } | OEM { $oem_lines } rida

engine-lunar-interop-chart-artifacts = artefaktid: { $list }

engine-lunar-interop-chart-conformance = väljade vastavus: { $verdict } (olemas { $present }, puudu { $missing }, andmeridu { $data_lines })

engine-lunar-interop-chart-roundtrip = OEM edasi-tagasi teisendus: { $oem } | ajametaandmete edasi-tagasi teisendus: { $time_metadata } | KIF { $kif_bytes } baiti

engine-lunar-interop-chart-footnote = Edasi-tagasi teisendus / väljade vastavus võrreldes CCSDS OEM-i ja avaldatud LunaNet/IOAG väljasemantikaga. { $label } — mitte sertifitseeritud koostalitlusvõime vastavustest; ühegi asutuse heakskiitu pole.

engine-lunar-jamming-chart-title = Satelliidi J/S vs tõusunurk, Kuu pinna kasutaja

engine-lunar-jamming-chart-y-title = J/S (dB)

engine-lunar-jamming-chart-x-title = satelliidi tõusunurk (deg)

engine-lunar-jamming-chart-n-links = linke: { $n_links }

engine-lunar-service-chart-title = Kuu teenindusmaht — satelliite { $n_sats }, punkte { $n_points } × epohhe { $n_epochs }: katvus { $coverage }% (PDOP&lt;{ $threshold })

engine-lunar-service-chart-subtitle = satelliite { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | PL kättesaadav { $pl_avail }% (AL { $al } m, σ_URE { $sigma } m)

engine-lunar-service-chart-pdop-min = PDOP min { $v }

engine-lunar-service-chart-pdop-mean = PDOP keskmine { $v }

engine-lunar-service-chart-pdop-max = PDOP max { $v }

engine-lunar-station-chart-title = Kuu tugijaam: p{ $percentile } korrigeeritud 3-D viga lõunapolaarpiirkonnas (MODELLED)

engine-lunar-station-chart-threshold = lävi { $thr } m kohal p{ $percentile }

engine-lunar-station-chart-availability = kättesaadavus { $v } %

engine-lunar-station-chart-coverage = katvus { $v } %

engine-lunar-station-chart-corrected-3d = korrigeeritud 3-D { $f }

engine-lunar-station-chart-uncorrected-3d = korrigeerimata 3-D { $f }

engine-lunar-station-chart-legend-half = ≤ pool läveväärtusest

engine-lunar-station-chart-legend-within = ≤ lävi

engine-lunar-station-chart-legend-twice = ≤ kaks korda läveväärtus

engine-lunar-station-chart-legend-above = üle kahekordse läveväärtuse

engine-lunar-station-chart-station-note = ◆ jaam · katkendjoon: kaugus, milleni katvus kehtib 95 % juures

engine-lunar-station-chart-disclaimer = MODELLED nimetatud eelduste korral; mitte väide ühegi reaalse süsteemi kohta; ühegi asutusega sidumata ja ühegi asutuse poolt heaks kiitmata.

engine-lunar-time-chart-title = Kuu koordinaataeg LTC−TT (kiirus { $rate } µs/day, riba { $low }–{ $high })

engine-lunar-time-chart-offset = { $offset } µs kohal { $days } d

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | kell { $clock } | 7-liikmeline x_Σ(τ) { $taus } τ-punkti kohta ({ $taus2 }–{ $taus3 } s) | ristumis-τ { $crossover_tau_s } s (x { $crossover_x_s } s) | tugisüsteemi põrand { $frame_term_s } s | kell x(1 d) { $x_1day_ns } ns (MODELLED) | ajalabor: { $lab } { $lab2 } LTC-ni, x(1 d) { $lab3 } ns (MODELLED)

engine-lunar-vlbi-chart-title = Kuu VLBI viivitus (baasjoon { $baseline } km, majaki kaugus { $range } km, lähiväli { $near_field } µs)

engine-lunar-vlbi-chart-footnote = viivitus { $delay } µs epohhil · { $samples } näidist { $hours } h jooksul

engine-mars-pnt-chart-formal-3sigma = formaalne 3σ (kovariatsioon, mitte sertifitseeritud PL)

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = asukoha äratirimine: teatatud asukoht nihkub { $final_offset_m } m kaugusele suunas { $dir }, samal ajal kui vastuvõtja säilitab kehtiva lahenduse (vale rada saavutab tipus { $pv } m/s ja { $pa } m/s^2); iga jälgitav satelliit näitab { $c } dB-Hz, kuni see kestab

engine-nmea-synth-log-position-drag-off-genuine-cn0 = asukoha äratirimine: teatatud asukoht nihkub { $final_offset_m } m kaugusele suunas { $dir }, samal ajal kui vastuvõtja säilitab kehtiva lahenduse (vale rada saavutab tipus { $pv } m/s ja { $pa } m/s^2); tegelik C/N0 muster säilitatakse

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = aja spuufimine: teatatud UTC nihkub tegelikust { $offset_s } s; asukoht jääb õigeks; iga jälgitav satelliit näitab { $c } dB-Hz, kuni see kestab

engine-nmea-synth-log-time-spoof-genuine-cn0 = aja spuufimine: teatatud UTC nihkub tegelikust { $offset_s } s; asukoht jääb õigeks; tegelik C/N0 muster säilitatakse

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = taasesituse viivitus (meaconing-laadne): asukoht{ $v1 } jääb tegelikkusest maha { $delay_s } s; iga jälgitav satelliit näitab { $c } dB-Hz, kuni see kestab

engine-nmea-synth-log-replay-delay-genuine-cn0 = taasesituse viivitus (meaconing-laadne): asukoht{ $v1 } jääb tegelikkusest maha { $delay_s } s; tegelik C/N0 muster säilitatakse

engine-pvt-chart-3d-error-m = 3D viga (m)

engine-pvt-chart-postfit-rms-m = järelsobituse RMS (m)

engine-quantum-faults-chart-title = quantum-anomaly-detect AUC (MODELLED)

engine-quantum-faults-chart-quantum = kvant

engine-quantum-faults-chart-classical = klassikaline

engine-quantum-nav-od-chart-title = quantum-gnss-free-nav (MODELLED)

engine-raim-stanford-chart-title = Stanfordi diagramm — terviklikkus ({ $n_epochs } epohhi, AL = { $al } m)

engine-raim-chart-title = RAIM kaitsetasemed ja kättesaadavus ({ $availability }% kättesaadav)

engine-receiver-trust-chart-track-caption = vastuvõtja teatatud rada, põhi üleval

engine-receiver-trust-chart-start = algus

engine-receiver-trust-chart-end-of-log = logi lõpp

engine-receiver-trust-chart-no-positions = logis pole asukohti

engine-receiver-trust-chart-score-axis = usaldusskoor, 0 kuni 100

engine-receiver-trust-chart-legend-vessel = usaldus: roheline nominaalne (skoor vähemalt { $nominal }), merevaigukollane halvenenud (vähemalt { $degraded }), punane mitteusaldatav, hall kalibreerimisel

engine-receiver-trust-chart-legend = usaldus: roheline nominaalne, merevaigukollane halvenenud, punane mitteusaldatav, hall kalibreerimisel

engine-receiver-trust-chart-advisory = Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade; vastutab jätkuvalt operaator.

engine-receiver-trust-chart-cn0-axis = keskmine C/N0, dB-Hz

engine-report-chart-title = Kella holdover: ajaviga GNSS-i katkestuse ajal

engine-slot-timing-chart-aria = Prognoositud ajaviga alates viimasest lahendusest möödunud aja suhtes koos ajavahe kaitseaknaga

engine-slot-timing-chart-time-since-fix = aeg alates lahendusest, 0 kuni { $t }

engine-slot-timing-chart-predicted-error = prognoositud ajaviga (ns); katkendjoon: kaitseaken { $guard } ns

engine-slot-timing-never = mitte kunagi

engine-solar-system-chart-title = Päikesesüsteem — J2000 ekliptika, ülaltvaade

engine-solar-system-chart-inner = Sisesüsteem (Marsini)

engine-solar-system-chart-whole = Kogu süsteem (Pluutoni)

engine-solar-system-chart-legend = roheline: VALIDATED JPL Horizonsi vastu · merevaigukollane: MODELLED · kuud on loetletud failis result.json koos emakeha-keskse rajaga

engine-spectrum-chart-title = L-riba spektri juga

engine-spectrum-chart-multi-title = Mitme riba spektri juga

engine-spectrum-chart-frequency-mhz = sagedus (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz): nominaalne (hall) / minimaalne

engine-spectrum-chart-threshold = lävi { $thr }

engine-spoof-chart-title = Aja spuufimise tuvastamine: nihe vs kellatoega tuvastuspiirid

engine-spoof-chart-offset-ns = spuufimise nihe (ns)

engine-spoof-chart-spoof-offset = spuufimise nihe

engine-spoof-chart-quantum-bound = kvanttuvastuspiir

engine-spoof-chart-classical-bound = klassikaline tuvastuspiir

engine-sweep-chart-title = { $metric } vs { $parameter } ({ $scale } skaala)

engine-sweep-nd-chart-title = `{ $kind }` { $n_dims }-D pühkimine — sõlmi { $n_nodes }

engine-sweep-nd-chart-axes = teljed: { $axes } (kuju { $shape })

engine-sweep-nd-chart-metrics = mõõdikud: { $metrics } — täisruudustik JSON-is

engine-sweep-nd-chart-line-title = `{ $kind }` pühkimine üle { $key }

engine-sweep-nd-chart-y-title = mõõdik

engine-telecom-timing-max-te-ns-budget-never-exceeded = telecom-timing: max|TE| { $max_abs } ns { $v2 } s jooksul; { $masks }; { $max_abs_te_ns } ns eelarvet ei ületatud kunagi (MODELLED)

engine-telecom-timing-max-te-ns-budget-exceeded-after = telecom-timing: max|TE| { $max_abs } ns { $v2 } s jooksul; { $masks }; { $max_abs_te_ns } ns eelarve ületati { $t } s möödudes (MODELLED)

engine-telecom-timing-chart-title = Telekommunikatsiooni ajastus: ajaviga, MTIE ja TDEV

engine-telecom-timing-chart-y-title = |ajaviga| (ns)

engine-telecom-timing-chart-te-caption = absoluutne ajaviga eelarvete suhtes

engine-telecom-timing-chart-holdover = holdover

engine-telecom-timing-chart-time-record = aeg ({ $h } h salvestus)

engine-telecom-timing-chart-mtie-caption = MTIE (pidev), TDEV (katkendjoon), esimene MTIE mask (hall), ns

engine-timetransfer-chart-title = Aja edastamise sünkroniseerimisviga (optiline vs RF)

engine-timetransfer-chart-y-title = sünkroniseerimisviga (ps)

engine-timetransfer-chart-spec = spets { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = mõõtmisaeg (s)

engine-timetransfer-chart-optical = optiline: { $id }

engine-timetransfer-chain-chart-title = quantum-time-transfer (MODELLED)

engine-kind-clock-description = Kella holdover vs spetsifikatsioon; valikuline Monte Carlo ansambel (runs > 1).

engine-kind-inertial-description = 1-DOF inertsiaalne asukohaarvestus GNSS-i katkestuse ajal.

engine-kind-orbit-description = GNSS-i kättesaadavus + DOP orbitaalsest satelliidikonstellatsioonist (Walker / TLE / RINEX).

engine-kind-ephemeris-description = Efemeriid ja maapealne jälg: ühe satelliidi propageerimine (TLE→SGP4 või analüütiline orbiit) ning selle TEME/GCRS oleku (asukoht + kiirus), ITRF/ECEF asukoha, WGS-84 alamsatelliidi laiuse/pikkuse/kõrguse ja sammu kohta jaama az/el/vahemaa + vahemaakiiruse (Doppler) väljastamine. Satelliit tuleb väljalt `tle` või analüütilisest `orbit` koos selle `epoch`-iga (kui on antud mõlemad, võidab `tle`); `tle` korral kirjutab `epoch` üle TLE enda epohhi kui t = 0.

engine-kind-integrity-description = Hetktõmmis / lahenduste lahutamise / ARAIM RAIM koos HPL/VPL-iga ja Stanfordi diagrammiga.

engine-kind-lunar-integrity-description = Kuu lõunapooluse ARAIM kaitsetaseme läbimäng vs esindusliku LunaNet releekomplekti vastu. sigma_ure_m teeb nähtavaks signaali ruumis levimise kaugusmõõtmise täpsuse (kaitsetasemed skaleeruvad sellega lineaarselt, seega selle pühkimine vastab küsimusele, millist kaugusmõõtmise täpsust häirepiir nõuab). Vaikimisi on ajalooline LNIS-klassi lõunapooluse juhtum.

engine-kind-lunar-time-offset-description = Modelleeritud relativistlik Maa–Kuu kellakiirus (Kuu koordinaataeg, LTC/TCL): sekulaarne LTC−TT kiirus omapotentsiaalide erinevusest ja Kuu kineetilisest liikmest, esitatud koos avaldatud 56–59 µs/day ribaga, pluss kogunenud nihe horisondi ulatuses.

engine-kind-lunar-vlbi-description = Modelleeritud Kuu geodeetiline VLBI viivituse vaadeldav suurus: Maa baasjoon (kaks maajaama, GCRS) vaatleb NovaMoon-klassi Kuu pinna majaki ühesuunalist signaali. Väljastab lähivälja kahe vahemaa vahe viivituse, selle kiiruse ja lainefrondi kõveruse lähivälja parandi üle ülelennu — kontrollitud sama koodibaasi tasalaine Δ-DOR vaadeldava suuruse vastu kaugvälja piiril, koos lõplike vahede abil kontrollitud osatuletistega. Vaikimisi analüütiline tee on MODELLED ja kannab tugisüsteemi järjepidevuse, xp=yp=0 poolusliikumise ning tasalaine-vs-lähivälja hoiatusi. Seadistused planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path käivitavad selle asemel tuumatee (DE440, MOON_PA_DE440, ITRF93; koondunud barütsentrilised valguse ajad; lisab epohhi majaki ja jaama osatuletised), mille Newtoni viivitus ja osatuletised nõustuvad NAIF SPICE koondunud valguse aegadega täpsusega { $lit_0_06 } ps ja 7.4e-9. Ei ole valideeritud tegelike VLBI andmete vastu.

engine-kind-lunar-joint-od-clock-description = Modelleeritud ühine mitme tehnikaga Kuu OD + kella partii hindaja SIMULEERITUD võrgus: Gauss-Newtoni hetktõmmise sobitus, mis ühendab Maa baasjoone geodeetilised VLBI viivitused, Kuu-lokaalsed jaama↔satelliidi vahemaad ja satelliitidevahelised vahemaad, et süstitud tõest koos taastada Kuu pinnajaama 3-D asukoht, väikese konstellatsiooni asukohad ja iga objekti kellanihe. Põhitulemus ausalt — VLBI teeb jaama täieliku 3-D asukoha vaadeldavaks seal, kus ainult Kuu-lokaalne kaugusmõõtmine jätab nõrgalt vaadeldava suuna — esitatakse jaama vea kontrastina VLBI-ga vs ilma. MODELLED simuleeritud suletud ahelaga taastamine (tõde jagab vaatlusmudelit), deterministlik (algväärtusega), EI OLE valideeritud tegelike andmete vastu; lahendajas puudub jõumudeli propageerimine; ei mingit TRL-i/pärandi/asutuse heakskiitu.

engine-kind-lunar-frame-realisation-description = Modelleeritud Kuu tugisüsteemi realiseerimine: 7-parameetriline Helmerti (sarnasus) datumi sobitus — 3 nihet, 3 väikese nurga pööret, 1 mõõtkava — mis seob hinnatud selenograafiliselt tuletatud MCMF punktikoordinaatide hulga datumiga kaalutud vähimruutudega (crate::batch_ls::gauss_newton), pluss lihtne orientatsiooniside, mis väljendab realiseeritud väikest pööret ICRF telgede ümber IAU 2015 WGCCRE kehaorientatsiooni suhtes. Stsenaarium süstib hästi hajutatud sünteetilisse punktivõrku teadaoleva väikese teisenduse (nihe ~kümneid m, pööre ~µrad, mõõtkava ~1e-7), lisab algväärtusega Gaussi müra, taastab datumi ja esitab taastatud teisenduse, parameetrikaupa taastamisvea vs süstitud tõde ning järelsobituse RMS jäägi. MODELLED enesekooskõla — taastab süstitud sarnasusteisenduse (müravaba ~masina täpsuseni), EI OLE realiseerimine tegelike jälgimis-/VLBI andmete vastu; deterministlik (algväärtusega); ei mingit TRL-i/pärandi/asutuse heakskiitu.

engine-kind-moonlight-service-volume-description = Modelleeritud Kuu navigatsiooni teenindusmahu analüüs ILLUSTRATIVE avaliku allika Moonlight/LCNS-klassi Kuu orbiidi konstellatsioonist (ESA-ga sidumata): pühib selenograafilist laiuse/pikkuse ruudustikku üle ajahorisondi ning esitab DOP-i / katvuse / kättesaadavuse (≥4 sat JA PDOP < lävi) pluss üldistatud Kuu ARAIM kaitsetaseme (HPL/VPL) mähise üle mahu. DOP geomeetria KASUTAB UUESTI gnss_lib_py-VALIDATED tuuma (crate::orbit::dop); kaitsetase KASUTAB UUESTI LunaNet LNIS Kuu ARAIM masinavärki (crate::lunar, σ_URE≈30 m) ja taandub olemasolevaks lõunapooluse PL-iks erijuhuna. MODELLED kompositsioon: ringikujuline/elliptiline Kepleri releekomplekt (mitte tegelik diferentsiaalselt korrigeeritud LCNS/NRHO efemeriid), keskmise pöörlemisega Kuu (ilma libratsiooni/pretsesseeriva poolusetta). Deterministlik (puhas geomeetria). Ei mingit TRL-i/pärandi/asutuse heakskiitu.

engine-kind-lunar-differential-pnt-description = Modelleeritud Kuu DIFERENTSIAAL-PNT (Kuu DGNSS/SBAS analoog): NovaMoon-klassi tugijaam TEADAOLEVAS selenograafilises asukohas arvutab satelliidikaupa diferentsiaalparandid ILLUSTRATIVE avaliku allika Moonlight/LCNS-klassi konstellatsioonist (NovaMoon viidatud ainult süsteemiklassina, ESA-ga sidumata) ning baseline_km võrra nihutatud kasutaja rakendab neid nii, et ÜHISREŽIIMI orbiidi + kella vead kaovad. Kellaliige kaob TÄPSELT (algebraline samasus); orbiidiliige jätab alles vaid vaatejoonte erinevuse projektsiooni, mis → 0, kui baasjoon → 0 (ruumilise dekorrelatsiooni põrand), ja kasvab ≈ lineaarselt baasjoonega. Esitab kasutaja 3-D asukohavea parandustega VS ILMA, vähenemiskordaja, vea-vs-baasjoone kõvera ja kasutaja kaitsetaseme, mis KASUTAB UUESTI DO-229E SBAS masinavärki (crate::sbas) diferentsiaaljäägi σ-ga. MODELLED — täpne tühistussamasus + esimese järgu dekorrelatsioonimudel; ei ole valideeritud tegelike andmete vastu; ei mingit TRL-i/pärandi/asutuse heakskiitu. Deterministlik, kui algväärtusega.

engine-kind-lunar-station-coverage-description = Modelleeritud Kuu tugijaama katvus: Kuu diferentsiaal-PNT mudeli Monte Carlo pühkimine üle lõunapolaarse kasutajaruudustiku ja ühe päeva epohhide. Teadaolevas lõunapolaarses asukohas olev diferentsiaaltugijaam korrigeerib nimetatud konstellatsiooni (illustratiivne Kepleri või tabuleeritud efemeriid) nimetatud signaali ruumis levimise vea, mõõdistusvea, parandusviivituse ja lingi kvantimisega; punkti kohta ja piirkonna ulatuses esitab see protsentiilina korrigeeritud ja korrigeerimata asukohavea (3-D, horisontaalne, vertikaalne), kättesaadavuse, katvuse nimetatud läve suhtes, DO-229E kaitsetasemed, katvusraadiuse asimuudi kohta ning paranduslingi eelarve jaamas ja halvimas punktis. Mitte väide ühegi reaalse süsteemi toimivuse kohta; ühegi asutusega sidumata ega ühegi asutuse poolt heaks kiitmata. MODELLED.

engine-kind-lunar-interop-export-description = Modelleeritud Kuu koostalitlusvõime eksport: väljastab Kuu tugisüsteemi, Kuu ajaskaala ja Kuu efemeriidi LunaNet/IOAG-ga joondatud CCSDS-põhistes vahetusvormingutes koos edasi-tagasi teisenduse / väljade vastavuse kontrolliga. KASUTAB UUESTI paketi CCSDS OEM 2.0 väljastajat+parserit (crate::oem), mis on Kuu konteksti jaoks ümber märgistatud — OEM-i REF_FRAME kannab IAU 2015 WGCCRE Kuu kehatugisüsteemi (MOON_ME / MOON_PA), TIME_SYSTEM Kuu ajaskaalat (LTC / TCL / UTC), CENTER_NAME = MOON — näidisena illustratiivse LCNS-klassi efemeriidi kohal (asukohad crate::lunar_service-ist, kiirus lõplike vahede abil). Väljastab ka LunaNet/IOAG-ga joondatud Kuu aja kirjeldaja (skaala id, sekulaarne kiirus µs/day crate::lunar_time-ist, avaldatud riba, tugipind), mis teeb serde_json kaudu edasi-tagasi teisenduse, ning mähib artefaktid olemasolevasse KIF ümbrisesse (crate::interchange) koos MODELLED ausameelsussildiga. Esitab väljastatud artefaktid, OEM-i ridade arvu, väljade vastavuse läbimise + olemasolevate/puuduvate väljade loendi, OEM-i edasi-tagasi teisenduse korras, ajametaandmete edasi-tagasi teisenduse korras ja KIF-i baidimahu. MODELLED — deterministlik edasi-tagasi teisendus + väljanimede vastavus võrreldes avaldatud CCSDS OEM-i + LunaNet/IOAG väljasemantikaga on oraakel; EI OLE sertifitseeritud koostalitlusvõime vastavustest; illustratiivne avaliku allika efemeriid, ESA-ga sidumata; ei mingit TRL-i/pärandi/asutuse heakskiitu.

engine-kind-timetransfer-description = Optiline vs RF kahesuunaline aja/sageduse edastamine.

engine-kind-quantum-anomaly-detect-description = MODELLED rikete/anomaaliate tuvastamine kvant-PNT süsteemides: märgendatud rikkekataloog (kella sagedushüpe/triiv/lukustuse kadu; anduri nihkesamm/väljalangemine), tuvastusstatistiku ROC AUC (koos bootstrap-usaldusvahemikuga väliselt valideeritud eval_stats-ist) ja minimaalne tuvastatav rike fikseeritud valehäire määra juures, kusjuures kvantkella toega seire (väiksem müra) tuvastab väiksemaid rikkeid — ausa TradeEvidence + esindatavusena. Gaussi tuvastusstatistiku mudel (AUC = Phi(mu/(sigma*sqrt2))); modelleerib klassi, illustratiivsed avaliku allika parameetrid, ei mingit TRL-i/lennuandmeid/sertifitseerimist.

engine-kind-quantum-gnss-free-nav-description = MODELLED GNSS-ivaba kvantnavigatsioon: GNSS-i katkestuse ajal kvant- (külmaatom-interferomeetri) inertsiaalne eelarve vs klassikaline navigatsioonitaseme INS — asukohavea kasv libisemise ajal, holdover (aja hoidmine ilma välise etalonita) asukohalävini ning kvant-vs-klassikaline kompromiss ausa TradeEvidence-ina koos esindatavusega. Aus vaadeldavuse märkus: ilma välise lahenduseta on kiirendusmõõturi nihe vaadeldamatu, seega viga kasvab; kvantandur aeglustab seda lõhet, kuid ei sulge seda. Illustratiivsed avaliku allika seadme parameetrid; modelleerib klassi, ei mingit TRL-i/lennuandmeid/sertifitseerimist.

engine-kind-quantum-time-transfer-description = MODELLED usaldusväärse kvantajastuse ahel: otsast lõpuni kvant- (optilise võrega kell + takerdumise/üksikfootoni link) vs klassikaline (CSAC + RF kahesuunaline) aja edastamise eelarve, taaskasutatud ajastuse kaitsetase + viivitus-/taasesitusründe turvalisuse FoM (1-P_md), kella anomaalia tuvastamise tõenäosus + CUSUM latentsus ning kvant-vs-klassikaline kompromiss ausa TradeEvidence-ina koos esindatavuse + lennuvalmiduse lünkade kirjega. Illustratiivsed avaliku allika seadme/lingi parameetrid; modelleerib klassi, ei väideta TRL-i/lennuandmeid/sertifitseerimist.

engine-kind-hybrid-description = Hübriid-PNT kroonetapp: kell + IMU + aja edastamise toetus.

engine-kind-fusion-description = Ühine Kalmani andurisulandamise PNT samade hübriidsisendite kohal.

engine-kind-hybrid-ukf-description = 17-olekuline hübriid kvant+klassikaline tihedalt seotud GNSS/INS UKF (MODELLED): 15 INS-i veaolekut + CAI-st tuletatud kiirendusmõõturi nihke parandus + 2-olekuline (faas+sagedus) kell q-parameetri kellamootorist, mida juhib sulgudes CAI vigade mudel. Headusnäitaja on filtri enesekooskõla (NEES + innovatsiooni valgus vs χ² piirid) — enesekooskõla väide, MITTE tegeliku maailma täpsuse garantii. Ainult simulatsioon; ei mingit TRL>3, ei mingit lennupärandit, ei mingit välist valideerimist.

engine-kind-gnss-ins-description = Lõdvalt ja tihedalt seotud GNSS/INS veaoleku EKF.

engine-kind-gnss-sim-description = Mõõtmisdomeeni pseudovahemaa simulatsioon (Klobuchari ionosfäär, Saastamoinen/Niell troposfäär) + RAIM.

engine-kind-jamming-description = Lingieelarve segamine (jamming): J/S → efektiivne C/N₀ → lukustuse kadu.

engine-kind-spoof-description = Stohhastiline aja spuufimise tuvastaja (Neyman–Pearson / χ²₁) koos Monte Carlo P_fa/P_md-ga.

engine-kind-spoof-detect-description = Kombineeritud RF/mõõtmise spuufimise tuvastaja (multi-SV RAIM-kooskõla + AGC + SQM, sulandatud) vs parametriseeritud rünnak (võimueelis, kandelaine faasi joondus, aja/asukoha lükkamine; TEXBAT-laadne).

engine-kind-sweep-description = 1-D kompromissiuuringu pühkimine kellapaketi parameetri üle.

engine-kind-sweep-nd-description = Üldine N-D pühkimine mis tahes paketi üle punktidega TOML-võtmete / JSON-i mõõdikuteede kaudu.

engine-kind-gravity-map-description = GPS-ita gravitatsioonikaardi sobitamise navigatsioon: külmaatom-gravimeeter taastab konstantse INS-i triivi gravitatsioonianomaaliate jadast, mida läbib.

engine-kind-terrain-nav-description = GPS-ita reljeefipõhine navigatsioon (TERCOM/SITAN): radari/baro-kõrgusmõõtur sobitab maapinna kõrgusprofiili SRTM-laadse DEM-iga, et taastada INS-i triiv.

engine-kind-terrain-slam-description = GPS-ita järjestikune (rekursiivne) reljeefipõhine navigatsioon: osakestefilter käivitab reljeefisobituse mõõtmismudeli epohhhaaval (SITAN töötava filtrina), nii et ajas muutuvat INS-i triivi jälgitakse mööda rada, kus partii-terrain-nav taastab vaid ühe konstantse nihke.

engine-kind-combined-altpnt-description = GPS-ita kombineeritud gravitatsiooni + magnet + reljeefi navigaator: kolm skalaarvälja kanalit sulandatud teekonnapunkti kohta, et saada teravam (madalama CRLB-ga) triivi lahendus kui ühegi üksikvälja puhul.

engine-kind-pvt-description = Tegelike vaatluste üksikpunkti positsioneerimine: lahenda vastuvõtja asukoht RINEX 3 vaatlusfailist ja ringhäälingu-navigatsioonifailist (koodi pseudovahemaad, ringhäälingu efemeriid, Klobuchari ionosfäär, Saastamoinen/Niell troposfäär), soovi korral mõõdistatud koordinaadi vastu valideeritud.

engine-kind-mars-pnt-description = Kaugkosmose Marsi PNT: simuleeritud MARCONI releekonstellatsioon (areostatsionaarsed + kaldus releed, mis edastavad ühesuunalist + releevad kahesuunalist kaugkosmose jaamale) navigeerib viitekasutajat (transfer | lmo | surface) ühise ühesuunalise/kahesuunalise radiomeetrilise sulandushindaja kaudu. Esitab epohhi kohta geomeetria/nähtavuse, saavutatud RMS-i tõe suhtes ja formaalse kovariatsiooni (1σ / 3σ asukoht) — aus simuleeritud FoM, MITTE sertifitseeritud kaitsetase.

engine-kind-impairment-eval-description = AI/ML RF-häirete tuvastamise hindamise katsestend (13494): genereeri märgendatud, parameetritega põhjendatud SÜNTEETILINE korpus (nominaalne/jamming/spoof-time/spoof-position/multipath), skoori tuvastajat (energy|agc|sqm|parity|fused) tuvastajast sõltumatu raamistikuga ning esita AUC/ROC/segadusmaatriks + klassikaupa Pd sihtmäära Pfa juures, pluss jaotusesisese vs jaotusevälise optimismilõhe. Ainult MODELLED tööomadused — mitte kunagi väli-/IQ-andmed, ei mingit hea/halva otsust.

engine-kind-quantum-trade-description = Kvant-vs-klassikaline PNT kompromiss (13503): kandidaatkella (mõõdetud ADEV kõver — kaitstavuse kandepunkt — või kvantkella klass) ajastuse-holdoveri + inertsiaalse holdoveri kasu vs klassikalise lähteklassi, koos artefaktil kantava pika-tau põranda eelduse hoiatusega, pluss GNSS-ita vastupidavuse-vs-aja mähis. MODELLED; kvantifitseerib (mitte kunagi ei valideeri) partneri seadet. Kandidaatkell on mõõdetud kõver (`candidate_adev_taus` + `candidate_adev_values`, võrdse pikkusega, vähemalt 2 punkti; kui antud on mõlemad vormid, võidab see) või `candidate_clock_class`.

engine-kind-space-weather-description = Kosmoseilma keskkonnamudel: päikese (F10.7/F10.7a) ja geomagnetilised (Kp, koos definitsioonilise Kp↔ap tabeliga) aktiivsusindeksid, nende poolt juhitav Jacchia-1971 eksosfääri temperatuur (valideeritud avaldatud päikese miinimumi/keskmise/maksimumi vastu) ning Jacchia-1971 termosfääri neutraaltihedus ööpäeva keskmise eksosfääri temperatuuri juures vs aktiivsuseta staatiline profiil mitmel kõrgusel — päikesetsükli tihedusfunktsioon, mida staatiline atmosfäär ei sisalda. MODELLED: tihedus nõustub kiirendusmõõturitest tuletatud tihedustega (TOLEOS CHAMP ja GRACE) teguri 2 piires päikese maksimumi ajal, kuid on 2008. aasta päikese miinimumis umbes { $lit_1_7 }x liiga tihe.

engine-kind-oem-interop-description = CCSDS OEM koostalitlussild: impordi välise lennudünaamika tööriista (GMAT/Orekit/STK kõik väljastavad OEM-i) loodud orbiidi efemeriidi sõnum ning esita selle segmendid/objektid/tugisüsteemid/epohhi ulatus pluss kiiruse kooskõla kontroll; sisendita teeb see loodud viiteorbiidi edasi-tagasi teisenduse ning esitab impordi↔ekspordi täpsuse. MODELLED struktuurne/füüsikaline sisselugemise kontroll, MITTE allika orbiiditäpsuse valideerimine.

engine-kind-launch-window-description = Kahe keha väljalaske ja tõusu geomeetria: väljalaske asimuut(id) (sin Az = cos i / cos lat), minimaalne saavutatav kaldenurk, ringkiirus, Maa pöörlemise idasuunaline boonus, dogleg-tasandimuutuse Δv, kui sihtkaldenurk on väiksem kui asukoha laiuskraad, ja ööpäevaste väljalaskevõimaluste arv. MODELLED sfäärilise Maa geomeetria (ilma pöörleva Maa kiiruskolmnurga paranduseta, ilma tõusu/takistuskao mudelita).

engine-kind-reentry-description = Allen-Eggersi ballistilise atmosfääri taassisenemise koridor: tippseisak (ballistilisest koefitsiendist sõltumatu, V_e^2 sin|γ|/(2eH)), kiirus ja kõrgus tippkoormuse (peak-g) hetkel ning tippkuumenemise kiirus sisenemiskiiruse/lennutrajektoori nurga/ballistilise koefitsiendi jaoks eksponentsiaalses atmosfääris, pluss sama ballistilise sisenemise tasapinnaline punktmassi integreerimine gravitatsiooni, Maa kõveruse ja USA standardatmosfääriga 1976 (tippseisak, kiirus, kõrgus ja aeg tipus). MODELLED ballistiline (tõstejõuta) sisenemine; kuumenemise väljund on tippkuumenemise KIIRUS, mitte soojusvoog (ilma aerotermilise/TPS-i mudelita).

engine-kind-eo-coverage-description = Maa vaatluse kasuliku koormuse jalajälje ja katvuse geomeetria (SMAD kosmosekolmnurk): Maa nurkraadius, haardelaius, nadiiri maapinna diskreetimisvahe, maksimaalne nadiirist kõrvalekalde juurdepääs, ringperiood, J2 sõlmeperiood ja ekvatoriaalne maapealse jälje vahe koos pideva katvuse lipuga, orbiidi kõrguse, kaldenurga (vaikimisi päikesega sünkroonne) ja anduri FOV/IFOV jaoks. MODELLED sfäärilise Maa geomeetria (ilma radiomeetria/MTF-i/atmosfääri/värina/läikeeta); sõlmevahe R_e·(ω − Ω̇)·T_nodal esimese järgu J2 sekulaarsete kiirustega.

engine-kind-space-packet-description = CCSDS 133.0-B kosmosepaketi protokolli raamistamine: kodeeri sünteetiline TM/TC paketivoog (6-oktetine primaarpäis + andmeväli) ning esita paketi kohta päise dekodeerimine, oktettide koguarv ja täpne kodeerimise↔dekodeerimise edasi-tagasi teisendus. Deterministlik täpne bitipaigutusega raamistamine — asutuse paketivormingu koostalitluskiht; EI OLE vastavussertifitseerimine (ilma sekundaarpäise/CRC/segmenteerimisloogikata peale lippude).

engine-kind-attitude-budget-description = 3-DOF orientatsiooni ja suunamisvea eelarve: halvima juhu gravitatsioonigradiendi häirimismoment ((3/2)(μ/R³)ΔI) ja ruutude summa juure suunamisvea eelarve nimetatud 1σ panuste üle (anduri müra, reaktsioonirattaga värin, termiline, joondus) koos domineeriva liikmega, orbiidi kõrguse + keha inertsihajuvuse jaoks. MODELLED skalaarne AOCS-i eelarve — riistvarale eelnev täiend Basilisk/42-le, mitte juhtahela/6-DoF/painduvate modaalide simulatsioon.

engine-kind-passes-description = Maajaama ülelendude ennustus: ringorbiidi ajadomeeni nähtavusülelennud (AOS/TCA/LOS, maksimaalne näiv tõusunurk, kestus), SGP4 keskmiste elementidena akna alguses, jaama kohal üle tõusunurga maski ühe akna jooksul, koos kogu juurdepääsuajaga. SGP4/SDP4 propageerimine IAU 2006/2000A Maaga seotud tugisüsteemis (valikuline UT1 - UTC ja poolusliikumine), ITU-R P.834-9 troposfääri murdumine ja allalingi valguse aeg (mõlemad vaikimisi sees), läbimised lahendatud täpsusega 1e-7 s ja kulminatsioon kuldlõike otsinguga. Ülelennu geomeetria on VALIDATED Orekit 13.1.8 vastu merepinna kõrgusel asuvates jaamades; stsenaariumi orbiit ja jaam on illustratiivsed sisendid.

engine-kind-link-budget-description = Ühesuunaline lingieelarve CCSDS 401 / DSN 810-005 lingivõrrandi kohal: vabaruumi trajektoorikadu, C/N₀, Eb/N₀, varu ja sulgumine saate EIRP, vastuvõtu G/T, vahemaa, andmekiiruse ja riba (s|x|ka) jaoks nõutava Eb/N₀ suhtes. Deterministlik inseneriarvutus antud sisenditest (mitte kalibreeritud terminali andmeleht).

engine-kind-lunar-time-budget-description = MODELLED otsast lõpuni Kuu koordineeritud aja (LTC) ajavea eelarve: seitse LTC veaterminit koondatud ajavea kõveratena x_i(τ) üle kogu keskmistamisaja ruudustiku, juurena summeeritud x_Σ(τ)-ks, ning kella-vs-tugisüsteemi RISTUMIS-τ, kus kasvav kellaliige ületab konstantse reaalajalise tugisüsteemi realiseerimise liikme (allpool seda on eelarve tugisüsteemiga piiratud, ülalpool kellaga piiratud) — aus vastus ühe-τ artefaktile. τ-tõusud on suletud kujul ja analüütiliselt kontrollitavad (kell τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }, põrandad τ^0, mõõtmine τ^{ "{" }-1/2{ "}" }) ja kellaread reprodutseerivad avaldatud ühepäevased kellaspetsifikatsioonid (crate::clock_specs); RF/optilise lingi, tugisüsteemi realiseerimise, relativistliku jäägi ja efemeriidi põrandate SUURUSED on modelleeritud eelarveeraldised (dokumenteeritud vaikeväärtused, kutsuja poolt üle kirjutatavad), mitte mõõtmised. Panus on reprodutseeritav ristumis-τ, mitte sertifitseeritud liikmekaupa arv; ei ole sertifitseeritud operatiivseks ajahoidmiseks.

engine-kind-hybrid-optical-rf-description = MODELLED heterogeenne optiline + RF PNT ühine headusnäitaja (P5): koostab 1550 nm kahesuunalise optilise lingi eelarve (footonitega piiratud kahesuunalise kaugusmõõtmise CRLB σ_τ/√N ja difraktsioonijalajälg λ/D·vahemaa), modaalsuseülese lahenduste lahutamise RAIM kaitsetaseme (asukoht JA ajastus), mis sulandab lõdva RF-i ja tiheda optilise lahenduse erinevate kovariatsioonidega, N-jaamalise optilise selge taeva kättesaadavuse (sõltumatu ühend 1−Π(1−a_i) ja ruumiliselt korreleeritud variant), optilise↔RF oleku/kovariatsiooni üleandmise TÕESTATUD bitipidevaga (hüppeta) keskmisega ja NEES χ² kooskõlavärava ning ühise P(kättesaadav JA korduvtäpsuse klass JA terviklikkus tagatud) skoori korrelatsioonikäsitlusega. VALIDATED suletud kuju: kaugusmõõtmise CRLB, difraktsioonijalajälg, χ² kaitsetaseme kvantiil, ühendi kombinatoorika, üleandmise keskmise pidevus + NEES värav ja ühine sõltumatu korrutis. MODELLED: optilised kaoeraldised, RF/optilise σ suurused, pilveklimatoloogia sisendid, korrelatsioonid ja P_HMI eelarve. Ei ole sertifitseeritud kättesaadavuse/terviklikkuse toode.

engine-kind-cislunar-observability-description = MODELLED tasapinnalise tsislunaarse konstellatsiooni vaadeldavus (P6): jälgib nelja kosmoselaeva diferentsiaalselt korrigeeritud tasapinnalist DRO konstellatsiooni satelliitidevahelise kaugusmõõtmisega ning esitab, kui suure osa kosmoselaeva neljaolekulisest [x,y,ẋ,ẏ] vektorist kaar vaadeldavaks teeb. Väljastab (1) astme-vs-kaare pikkuse tabeli ühe ainult-vahemaa lingi jaoks — hetkeliselt aste 1, kasvades kaare pikenedes täieliku neljaoleku suunas (P6 tabel 1); (2) vaadeldavuse Grami maatriksi omaspektri + tingimusarvu üle kaare; (3) ainult-vahemaa vs vahemaa+vahemaakiirus hetkelise astme võrdluse (Doppleri disainihoob) pluss ainult-vahemaa-singulaarse / vahemaa+kiirus-defineeritud GDOP-i esituse; ja (4) sõltumatu SRIF ristvalideerimise, mille aposterioorne kovariatsioon muutub lõplikuks / hästi tingituks täpselt kaarel, kus vaadeldav aste jõuab nelja. VALIDATED tuum: vaadeldav aste on astet paljastav singulaarväärtuse lävi, mida on ristkontrollitud Grami maatriksi omaastmega; omaspekter järgib spektraalseid invariante (trace=Σλ, det=Πλ, Frobenius²=Σλ²); variatsiooniline STM on lõplike vahede abil valideeritud CR3BP STM; vahemaa/vahemaakiiruse Jacobi maatriksi read on lõplike vahede abil valideeritud analüütilised osatuletised (ristkontrollitud paketi 3-D vahemaakiiruse vaadeldava suuruse vastu); neli algtingimust on diferentsiaalselt korrigeeritud tasapinnalised DRO-d, mis sulguvad range perioodilisuse jäägini ja on retrograadsed; astme üleminek on ristvalideeritud paketi ruutjuure infofiltri vastu (aposterioorne kovariatsioon on lõplik täpselt täisastmel, cond(P)=cond(OᵀO)); astmepuudulik hetktõmmis märgitakse GDOP-määratlemata (fim condition=inf), mitte kunagi võlts lõpliku väärtusena — sama singulaarse geomeetria kaitse, mida pvt::solve_spp rakendab. MODELLED: konstellatsiooni disain (DRO perilune amplituudid ja faasid) ning sellest tulenev konkreetne astme progressioon. Ei ole sertifitseeritud navigatsioonitoimivuse toode.

engine-kind-conflict-resilience-description = MODELLED kihilise PNT konfliktikindlus (P7): vaidlustatud keskkonna kasutajal on mitu PNT kihti (avatud teenuse GNSS, lairiba GNSS, autenditud konstellatsioon, täiendusrelee), igaühel baaskättesaadavus, 1σ täpsus ja vektorikaupa keelamistundlikkus ühise segamise/spuufimise ohu suhtes. Intensiivsuse järgi pühitud ALGVÄÄRTUSEGA Monte Carlo keelab iga kihi tõenäosusega clamp(vulnerability·intensity·vector_weight,0,1), sulandab ellujäänud suletud kujuga pöördvariatsioonireegliga σ_fused=(Σ 1/σ_i²)^(−1/2) ning esitab täieliku kao tõenäosuse (kõik kihid keelatud), mediaanse sulandatud vea ja kihikaupa kasutatavuse/keelamise statistika vs intensiivsus. Peamine vastupidavussuhe (üksikkihi vs kihilise täieliku kao tõenäosus) jääb SÕLTUMATUSE eelduse korral ~7x juurde; ühefaktoriline Gaussi koopula korreleeritud keelamise pühkimine näitab seejärel, et see ~7x variseb 1 poole, kui keelamise korrelatsioon kasvab (korrelatsioon nurjab kihistamise). Eelduste tundlikkuse plokk pühib peamist näitajat ALLIKAGA tundlikkuse eelduste üle mcda tornado + Dirichlet' ohupingutuse ümberjaotuse + protsentiilide usaldusvahemike kaudu. VALIDATED tuum: Monte Carlo täielik kadu koondub suletud kujuga sõltumatule korrutisele Π_i p_deny_i (MC standardvea piires fikseeritud algväärtuse ja suure N korral); pöördvariatsiooniga sulandamine on suletud kujuga samasus; ρ=0 korral taandub koopula sõltumatuks mudeliks ja iga ρ säilitab iga kihi marginaalse keelamismäära. MODELLED: kihikaupa tundlikkuse/kättesaadavuse/täpsuse suurused on allikaga-kuid-modelleeritud sisendid (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — vt conflict_threat_params) ning konkreetne ~7x suurus ja suhte-vs-korrelatsiooni kõvera kuju tulenevad sellest parametriseerimisest. §4.2 vektorikaupa ellujäämise lahutus lahendab seejärel ühise RF-ohu neljaks nimetatud vektoriks (jamming/spoofing/kinetic/cyber) ning esitab iga vektori kasutatava PNT sujuva halvenemise kõvera S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: algväärtusega kihikaupa Monte Carlo koondub sellele suletud kujule; jamming on korreleeritud RF lähtetaseme kõige teravam vektor ja RF-ile immuunne inertsiaalkiht on otsustav ellujääja. Ei ole sertifitseeritud navigatsiooni kättesaadavuse toode.

engine-kind-lunar-attack-surface-description = Kuu pinnanavigatsiooni signaaliturbe ründepind (P1): koostab avatud signaaliturbe analüüsid üheks binaarist ligipääsetavaks käiguks. Esitab (1) AFS-i vastuvõetud võimsuse ja selle võimsuse ÜLEJÄÄGI vs maapealne GPS-i viide, pluss 12-18 dB tundlikkusriba tõelise mitmetelgse pühkimisena üle lingi sisendite (viitetase x EIRP x kaldvahemaa) koos 25x-ümardatud / 28x-ümardamata lineaarteguri ühitamisega. PARANDATUD (reegel R4): see esitas { $lit_15_6 } dB võimsuse PUUDUJÄÄGI ja teguri 32x/36x, kuni GPS-i viide parandati väärtustelt -125 / -{ $lit_128_5 } (mis on dBm väärtused) väärtustele -155 / -{ $lit_158_5 } dBW, ICD-GPS-200 väärtused, mida jamming-moodul on alati kandnud. Märk pöördub: modelleeritud Kuu AFS-i signaal on { $lit_14_4 } dB TUGEVAM kui maapealne GPS L1 C/A, mitte nõrgem. Vastuvõetud võimsus ise ei nihkunud ühegi biti võrra ja lineaarne tegur on vana jagatud täpselt 1000-ga, mis on täpselt 30 dB dBm-i-dBW-ks nihe; (2) nõutav ründaja saatevõimsus spuufimiseks (J/S = 3 dB) ja keelamiseks (J/S = 30 dB) igal kaugusel, J/S lingi pöördvõrrand; (3) orbitaalne haaramisjalajälg reaalse ühtlase apertuuriga antennimustri all (Airy [2 J1(x)/x]^2), kõrgusega piiratud poolkerast väiksem kate, mille serva EI haarata; (4) arvutatud jälgimisahela spuufimise haaramise sissetõmbe tulemus (kas sobiva koodiga spuufija antud võimueelise ja koodinihkega tegelikult tirib DLL/PLL-i) väidetud 3 dB läve asemel; (5) tõstetud pinnasaatja õhuta keha geomeetriline silmapiiri ulatus; ja (6) OSNMA/TESLA autentimise eelarve (20 bit/s lisakulu = ~40 % 50 bit/s AFS-i navigatsioonisõnumist, võtme avalikustamise latentsus, 2^-40 võltsimine). Tühi keha reprodutseerib P1 lähtetaseme; iga sisend on vaikimisi antud ja üle kirjutatav. VALIDATED alamtulemused kannavad oma allikamooduli oraaklit (suletud kujuga dB radiomeetria; pöördvõrrandiga J/S edasi-tagasi; Airy muster vs A&S Besseli ja sfäärilise kupli geomeetria; DLL/PLL sissetõmme vs Kaplan & Hegarty; sfäärilise puutuja silmapiiri samasus vs eo_payload; OSNMA SIS-ICD väljamõõtmed). MODELLED: esindusliku geomeetria/võimsuse suurused ja konkreetsed haaramiskaardi lahtriväärtused. Ei ole sertifitseeritud turbetoode.

engine-kind-realtime-frame-eop-description = Reaalajas Kuu tugisüsteemi / Maa orientatsiooni prognoosi eelarve: P4 tabel 1 (tugisüsteemi vea kooskõlakontroll — järeltöödeldud ~{ $lit_0_27 } m ↔ ~{ $lit_0_010 } ms ja reaalajas ~15 m ↔ ~{ $lit_0_5 } ms, iga tugisüsteemi asukoht väljendatud samaväärse UT1 veana L19 hoobkäe Δr = D_EM·ω⊕·ΔUT1 kaudu) ja tabel 2 (mõõdetud UT1 prognoosi viga vs horisont — L18 kõver loetud otse tegelikust IERS finals2000A reast: Bulletin A − Bulletin B lõplik põrand ja mitmepäevane püsivusprognoosija viga, kumbki kujutatud Kuu tugisüsteemi asukohaks L19 kaudu), pluss L21 ruutude summa juure reaalajas tugisüsteemi vea eelarve (EOP + efemeriid + realiseerimise põrand). VALIDATED suletud kuju (L19 hoobkäsi, ω⊕ ristkontrollitud CIO Maa pöörlemisnurgaga) ja VALIDATED tegelikud andmed (L18 kõver tegelikest finals2000A ridadest); MODELLED on Kuu releede OD kovariatsiooni suurused ja tugisüsteemi realiseerimise põrand (esindavad eraldised) ning püsivusprognoosija (mitte IERS-i operatiivne Bulletin A algoritm). Ei ole sertifitseeritud reaalajas tugisüsteemi toode.

engine-kind-aperture-duty-cycle-description = Apertuuri töötsükkel: navigatsiooni-vs-side ajajaotus, mida kontaktiplaan eeldab juhitavate apertuuride kogumi jaoks. Võtab kontaktiplaani (`[[contacts]]` aos_s/los_s akende loend, millest igaüks küsib navigatsiooni või sidet — sama aos_s/los_s sõnavara, mida `passes` ennustaja väljastab), apertuuride arvu ja ARBITRAAŽIPOLIITIKA (vaikimisi navigatsiooniprioriteet, või sideprioriteet, või mitteeelistav first-come-first-served), ning esitab navigatsiooni töötsükli, side töötsükli, tühikäigu töötsükli ja seansikaupa katkestuse — kontaktiaja, mida seanss küsis ja ükski apertuur ei teenindanud. Täpne intervallipühkimine üle akna piiride, nii et kokkupuutuvad aknad ei konkureeri kunagi ja ühtegi apertuurisekundit ei loeta topelt; navigatsiooni, side ja tühikäigu apertuurisekundid kogutakse sõltumatult ja sulguvad vastu apertures*horizon_s. Aruanne esitab lahendatud poliitika, selle täieliku definitsiooni ning töötsükli ja katkestuse definitsioonid, sest ilma arbitraažipoliitikata esitatud töötsükli arv ei ole reprodutseeritav. MODELLED ajastusaritmeetika: ühtegi pöörde / ümberhäälestuse / üleminekuaega ei arvestata, kui apertuur vahetab teenust või seanssi, otsusesse ei lähe andmemahtu, puhvri olekut, energiaeelarvet ega lingi sulgumist ning kontaktiaknad on sisendid — nende geomeetria on see, mis need tekitas. Ei ole maasegmendi ajastamise toode.

engine-kind-lunar-jamming-description = Kuu-looduslik RF segamine (jamming): satelliidikaupa segaja-signaali suhe, efektiivne C/N₀ ja lukustuse kadu selenograafilisele pinnakasutajale Kuu pinna- (või tõstetud) segaja all, illustratiivse avaliku allika Moonlight/LCNS-klassi Kuu orbiidi konstellatsiooni kohal. Koostab olemasoleva avatud segamisfüüsika (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) olemasoleva Kuu taevageomeetriaga (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ühtegi geomeetriat ega radiomeetriat ei tuletata uuesti. Erinevalt Maa `jamming` liigist EI OLE signaaliosa fikseeritud vastuvõetud võimsus: iga satelliidi isotroopne vastuvõetud võimsus on selle enda lingieelarve EIRP − FSPL(kaldvahemaa), seega J/S varieerub satelliidi kaupa Kuu vahemaa ja tõusunurgaga. Esitab ÜHE RIDA IGA NÄHTAVA (epohh, satelliit) LINGI KOHTA — asimuut, tõusunurk, kaldvahemaa, mõlemad vastuvõetud võimsused, mille vahe J/S on, J/S, nominaalne ja efektiivne C/N₀ ning lukustuse olek — pluss koondheadusnäitajad selle tabeli kõrval (mitte selle asemel) ja sama tabel CSV artefaktina. Iga väljastatud arvväli kannab ühikut ja päritoluklassi. VALIDATED alamtulemused kannavad oma allikamooduli oraaklit (Kaplan & Hegarty §9.4 segamisvastane võrrand ja J/S link, välisel viitamisel failis tests/gnss_denied_jamming_resilience_reference.rs; lunar_service Kuu geomeetria). Koostet ennast on ristkontrollitud sõltumatu kahe lingieelarve teega (linkbudget::received_signal_power_dbw, erinev vabaruumi kao avaldis) täpsusega 1e-9 dB. MODELLED: illustratiivne konstellatsioon, esindavad EIRP / segaja võimsus / antenni võimendused / müratemperatuur ning reljeefivarju, mitmeteeleve, AGC dünaamika ja adaptiivse nullimise puudumine. Ei ole sertifitseeritud teenusetõkestuse toode. Konfigureeritud segaja korral kannab aruanne ka KEELAMISKONTUURI KOOS ÜLDISTE ANDMETE USALDUSRIBAGA, mitte ühest skalaarist loetud kontuuri: täieliku mõõdetud soovitud signaali C/N₀ jaotuse üle satelliidikaupa tabeli (n, min, p05, p25, mediaan, p75, p95, max, keskmine, valimi standardhälve ja valimi enda asümmeetria) ning kontuuri, hinnatuna igal neist järjestusstatistikutest MÕLEMA mootori tunnustatud keelamiskriteeriumi all — kehtiv võimusuhte oma (J/S = 30 dB, nagu attack-surface ja tracking-loop) ja lukustuse kao oma (efektiivne C/N₀ langeb tasemele tracking_threshold_dbhz, kriteerium, mida selle aruande enda olekuveerg kasutab) — keelamistasandi mõlemal teljel (nõutav segaja EIRP stsenaariumi kaugusel, keelamiskaugus stsenaariumi EIRP juures). Riba servad ON contour(p05) ja contour(p95), sama suletud kujuga kujutus rakendatud valimi enda kvantiilidele: mitte valimile sobitatud sigma ja mitte mediaan ± k·stdev, kusjuures stdev väljastatakse järjepidevuse huvides ja seda ei kasuta miski. Kvantiil, mis on juba jälgimisläve tasemel või sellest madalam, ei oma lõplikku keelavat J/S-i ning selle lukustuse kao veerud on null koos loendatud põhjusega, mitte kunagi kärbitud raadiusega.

engine-kind-ins-trn-coast-description = INS/TRN libisemise vea mudel: asukohaviga libisemise kestuse suhtes, ehitatud IMU koefitsientidest, mitte pühitud eeldatava triivikiirusena. Viis kasvupanust — kiirendusmõõturi nihe, güroskoobi nihkest tingitud kalle gravitatsiooni kaudu, kiiruse juhuslik ekslemine, nurga juhuslik ekslemine ja mõõtkavategur läbitud vahemaa suhtes — igaüks propageeritud üheksaolekulise kohaliku horisondi inertsiaalse vea mudeli kaudu Schuleri tagasisidega nimetatud laiuskraadil ja kõrgusel (lühikese libisemise juhtliikme seadused t², t³, t^1.5, t^2.5 ja t¹/t² esitatakse selle kõrval) ning kombineeritud NIMETATUD reegli alusel (vaikimisi ruutude summa juur, või lineaarsumma, või deterministlik summa koos stohhastilise rss-iga; kõik kolm arvutatakse igal käigul, et valik oleks nähtav, mitte peidetud). Libisemise kestused, mis jõuavad kutsuja antud asukohalävedeni (vaikimisi 10 m ja 50 m), leitakse mootori olemasoleva poolitusmeetodiga, igaühel panusekaupa lahutus, mis nimetab domineeriva allika, ning iga üksikpanuse läbimine on lisaks algebraliselt pööratud, et need kaks ühtiksid. Reljeefipõhise navigatsiooni režiim piirab libisemist perioodiliste asukohalahendustega ja esitab suurima lahendusintervalli, mis iga läve hoiab; ainult asukoha lahendus jätab kiiruse vea ja kalde lahenduse üle püsima, seega see ei piira libisemist alati ühegi lahenduskiiruse korral ning aruanne ütleb seda, mitte ei tagasta nulli. MODELLED: IMU klassi koefitsiendid on esindavad riba näitajad, mitte andmeleht, ja reljeefilahenduse jääk on sisend. Saavutamata lävi esitatakse nullina koos olekuga, mitte kunagi nulliga. Ei ole sertifitseeritud inertsiaalnavigatsiooni toimivuse toode.

engine-kind-lunar-vlbi-fim-description = Kuu-VLBI jaama koordinaatide kovariatsioon: lunar-vlbi vaadeldava suuruse viivituse osatuletised, kogutud selge GRAAFIKU (baasjooned x epohhid) üle Fisheri infomaatriksiks, pööratud ning esitatud jaama koordinaatide kovariatsioonina ja koordinaadikaupa jaama sigmana — arvutatud mootori väljund, mitte skalaarne viivituse täpsus, mis on surutud läbi eeldatava isotroopse g = 3 võrdjaotuse teguri. Olek kannab Maaga FIKSEERITUD (ITRS) jaama koordinaate, seega Jacobi maatriks on inertsiaalne osatuletis, mis on pööratud iga epohhi GCRS->ITRS maatriksiga: Maa pöörlemine teeb need koordinaadid vaadeldavaks ja aruanne MÕÕDAB Maaga fikseeritud vaatejoone pühkimist ja majaki deklinatsiooni, mitte ei eelda neid. Üks vaatlus on üks (baasjoon, epohh) paar, kus MÕLEMAD jaamad on tõusunurga maskist kõrgemal, kaaluga 1/delay_sigma_s^2. Esitab astme, datumi defekti, tingimusarvu, kogu infospektri, kovariatsioonimaatriksi, jaamakaupa teljekaupa ja 3-D sigmad ning vaba võrgu nullruumi igal käigul; astmepuuduse korral avaldatakse peamine sigma NULLINA koos olekuga, mitte kunagi peaaegu singulaarsest pöördmaatriksist välja loetuna. Võrdjaotuse väärtus c*delay_sigma_s*sqrt(g/N) SAMA graafiku jaoks väljastatakse arvutatud väärtuse kõrval koos suhtega, koos isotroopse jäljepiiriga sqrt(p/trace(M)), mille AM-HM teeb kõvaks põrandaks — seega suhe on anisotroopia, mille eeldus kõrvale heitis. Viivituse sulgemine tau_ik = tau_ij + tau_jk teeb geomeetriliselt sõltumatuks vaid n-1 baasjoont n(n-1)/2-st; aruanne esitab mõlemad arvud. MODELLED: Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooniparameetrid hoitakse FIKSEERITUNA ning vaatlusi käsitletakse sõltumatutena, seega kovariatsioon on Cramér-Rao piir vähendatud parameetrikomplekti jaoks, mitte ennustatud seansi tulemus; viivituse sigma, jaamakoordinaadid ja graafik on sisendid. Osatuletis, mille geomeetrilise viivituse Jacobi maatriks välja jätab (diferentseeritud Shapiro liige), mõõdetakse lõplike vahedega ja väljastatakse. Ei ole geodeetiline toode.

engine-kind-tracking-loop-description = Jälgimisahela lukustuse kadu: C/N0 -> lukustus/lukustuse lõpp HÜSTEREESIGA, lukustuse kaotamiseks kuluv aeg ning spuufimise sissetõmme koodi- ja kandelaine nihke KIIRUSE funktsioonina. Mootori olemasolevad keelamis- ja haaramiskriteeriumid on vastuvõetud võimsuse suhted (segaja keelab J/S = 30 dB juures, spuufija haarab 3 dB juures); tegelik lukustuse kadu ei ole võimsuse suhe, vaid see, kus ahela jitter pluss dünaamiline pinge jätab selle jälgimisläve eelarve. Esitab (1) kandelaine (Costas) ja koodi (mittekoherentne early/late) 1-sigma termilise jitteri vs C/N0, ruutumiskadu kaasa arvatud, nimetatud reeglite 3*sigma_PLL + theta_e <= 45 deg (15-kraadi reegel kolmsigma kujul) ja 3*sigma_DLL + ramp lag <= d/2 chip suhtes; (2) langemise ja uuesti lukustumise C/N0 läved koos siduva ahela nimetamisega, uuesti lukustumise lävi TULETATUD laiemast ribalaiusest, millel vastuvõtja uuesti sisse tõmbab, mitte väidetud, seega hüstereesi laius peab jääma vahemikku 5*log10(ratio) kuni 10*log10(ratio) dB; (3) deklareeritud lukustuse kaotamise aeg kahelävise lukustustuvastajaga koos kinnitusviibimistega, mida juhitakse üle C/N0 tõusu, esitatud eraldi füüsikalisest faasipõgenemise ajast (Viterbi keskmine aeg tsüklihüpete vahel, log10 s-na, sest see ulatub sadadesse dekaadidesse); (4) spuufimise sissetõmbe piirid — suurim koodi libisemine ja kandelaine Doppleri kiirus, mida ohvri ahelad suudavad jälgida, koos kaardiga üle mõlema telje, sest spuufija, mis libiseb neist kiiremini, ei haara ahelat, vaid jookseb sellest ette; ja (5) ahela dünaamikast tulenev KEELAMISRAADIUS, esitatud olemasoleva võimusuhte raadiuse KÕRVAL, mitte selle asemel, nende märgiga vahe omaette nimetatud väljana (denial_radius_delta_km) ja definitsioon selle kõrval. Iga väljastatud arvväli kannab ühikut ja päritoluklassi. VALIDATED suletud kujud: kandelaine ja koodi jitteri avaldised, ahelafiltri taandamine sqrt(2*B_n*T) ja esimese järgu tõusuviivitus on ristkontrollitud mootori enda sdr korrelaatoriga, mida on sammutud algväärtusega sünteetilisel IF-il — erinev tee samade arvudeni — vastavalt täpsusega { $lit_0_6 } %, { $lit_3_7 } % ja { $lit_0_17 } %, ning tsüklihüppe aja taga olev modifitseeritud Besseli I0 standardsete tabuleeritud väärtuste vastu täpsusega 1e-7. Alumine kehtivuspiir on väidetud, mitte lihtsalt nimetatud: allpool ~32 dB-Hz juures 1 ms korral saturatsioonib tegelik atan diskriminaator oma +-pi/2 ulatuse vastu ja mõõdab vähem jitterit kui ükski lineaarteooria. MODELLED: ahela ribalaiused, integreerimisaeg, korrelaatori vahe, sissetõmbe ribalaiuse suhe, kinnitusviibimised, segaja võimsus ja antenni võimendused on esindavad riba näitajad, mitte andmeleht. MITTE modelleeritud: ostsillaatori (Alani hälbe) ja vibratsiooni jitter, esiotsa ribalaiuse piiramine, mitmeteelevi, AGC dünaamika, andmebiti ülemineku kadu, väline toetus ja mis tahes poolhaaravaheparandus Costase tsüklihüppe valemile. Ahela dünaamika korral ei ole spuufimise haaramisel üldse raadiust — siduv piirang on nihkekiirus, mitte võimsus — seega see väli on null koos põhjendusega, mitte väljamõeldud arv. Ei ole sertifitseeritud vastuvõtja toimivuse toode.

engine-kind-araim-reference-check-description = Avaldatud ARAIM-i sertifitseerimise etalonvektorid: mootori ARAIM horisontaalsed ja vertikaalsed kaitsetasemed käivitatud WG-C ARAIM Technical Subgroup'i ENDA läbitöötatud arvnäidete vastu, nende dokumentide endi nimetatud tolerantsil (TOL_PL = 5e-2 m). Kaks vektorit on fikseeritud testandmetena, mõlemal oma allalaadimise URL, allalaadimise kuupäev, lähtefaili SHA-256 ja lehekülg: Reference Airborne Algorithm Description Document v3.1 (2019) lisa D — enesekooskõlaline ja vastuvõtuvektor — ning Milestone 3 Report (2016) lisa A jaotis A.IX, väide, mida uurimisbibliograafiad tsiteerivad. Iga avaldatud sisend (10-satelliidiline 2-konstellatsiooniline geomeetriamaatriks, C_int ja C_acc dispersiooni diagonaalid, b_nom, P_sat, P_const ja LPV-200 konstantide komplekt) ja iga avaldatud väljund (VPL, HPL, EMT, sigma_v_acc, K_fa_3 ning kahe konstellatsiooni rikkerežiimi sigma_3, sigma_ss_3 ja b_3) esitatakse mootori enda arvu ja nende absoluutse vahe kõrval. Kaitsetaseme võrrandit EI lahendata siin uuesti: etaloni režiimide loend antakse mootori olemasolevale raim::araim_protection_level / araim_integrity_risk-ile, seega katsetatav poolitus ja Gaussi sabaalgebra on mootori enda; ainult geomeetria, alamlahendused, tuvastuslävid ja avaldatud eelarvejaotus ehitatakse selle jaoks. VÄLISELT KONTROLLITUD 2019. aasta vektori vastu: VPL { $lit_18_2926 } m vs { $lit_18_3 } m avaldatud, HPL { $lit_13_4063 } m vs { $lit_13_45 } m, EMT { $lit_7_2997 } m vs { $lit_7_2998 } m, sigma_v_acc { $lit_1_3694 } m vs { $lit_1_3694 } m ja kõik kuus avaldatud vahetulemust poole ühiku täpsusega viimases trükitud kümnendkohas. 2016. aasta vektor kannab kahte sisemist viga, mida aruanne esitab, mitte ei peida — märgitrükiviga G rea 3 juures ja K_fa_3 hinnatud 57 rikkerežiimi juures, kuigi dokument nimetab N_fault_max = 1 (12 režiimi) — seega selle geomeetria vahetulemused reprodutseeruvad täpselt, kuid selle kaitsetasemed esitatakse mõõdetud lahknevustena ja jäetakse vastuvõtunäitajast välja; tolerantsi ei laiendata kunagi nende neelamiseks. Iga väljastatud arvväli kannab ühikut ja päritoluklassi ning ümber kirjutatud arv märgistatakse `published`, et seda ei saaks kunagi arvutatuga segi ajada. ULATUS: realiseeritud on ainult N_fault_max = 1 (üksiksatelliidi ja üksikkonstellatsiooni rikkerežiimid) ning juhtum, mille eeldused nõuavad üheaegseid mitmesündmuselisi rikkealamhulki, on REFUSED, mitte vaikselt kärbitud; rikke tuvastamine, väljaarvamine, hii-ruut kooskõlakontroll ja etalonalgoritmi topeltarvestuse ümberjaotussamm jäävad ulatusest välja. See reprodutseerib avaldatud etalonalgoritmi läbitöötatud näite — see ei ole sertifitseerimine, lennukõlblikkuse artefakt ega heakskiit.

engine-kind-lunar-frame-campaign-description = Seitseparameetriline Helmerti (sarnasus) tugisüsteemi datum, mida juhib SIMULEERITUD VAATLUSKAMPAANIA, mitte süstitud teisendus. Maajaamade võrk vaatleb Kuu pinna majakate kataloogi selge graafiku alusel; Kuu-VLBI viivituse osatuletised koondatakse selle graafiku üle majakakoordinaatide Fisheri infomaatriksiks täpselt nii nagu lunar-vlbi-fim; ning see info propageeritakse läbi Helmerti kujunduse A = [I3 | [p]_x | p] kataloogipunktides datumi kovariatsiooniks H = A^T M_b A, mida diagnoosib crate::fim::crlb. ÜHTEGI teisendust ei süstita ja miski ei taastata istutatud vastusest, seega esitatud datumi täpsus tuleneb vaatlusprogrammist: viivituse sigma poolitamine poolitab selle täpselt ja kaare pikendamine parandab seda, sest libratsioon, mida aruanne MÕÕDAB (sub_earth_direction_sweep_deg), eristab vaatejoone majakakoordinaati taevatasandi omadest. Aste, datumi defekt, tingimusarv, kogu spekter, vaadeldamatud suunad SEITSEPARAMEETRILISES BAASIS, nõrgim suund isegi täisastmel ja iga parameetri osakaal selles väljastatakse igal käigul; parameeter, mida kampaania ei piira, avaldatakse NULLINA koos olekuga, mitte kunagi peaaegu singulaarsest pöördmaatriksist välja loetuna. Majakavigade korrelatsioon on mõõdetud, mitte eeldatud: kinnitatud jaamade korral ei puuduta ükski vaatlus kahte majakat, seega infomaatriks on täpselt plokkdiagonaalne (offblock_fraction 0), ja hinnatud jaamade korral on Schuri marginaliseeritud plokk seotud, esilekutsutud korrelatsioon trükitud ja kogu propageerimine uuesti käivitatud selle kõrvalejätmisega, nii et sõltumatuse eelduse hind on arv. Sama propageerimine isotroopse koordinaadikaupa sigma all ja taastamisviga, mida lunar-frame-realisation stsenaarium esitab, mõlemad käivitatakse siin ja trükitakse kampaania väärtuse kõrval koos nende suhetega. MODELLED: majakakataloog on allikaga, kuid KAMPAANIA on simuleeritud — jaamavõrk ja viivituse sigma on illustratiivsed sisendid, üksikuid viivitusvaatlusi käsitletakse sõltumatutena ning Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooniparameetrid hoitakse FIKSEERITUNA, seega datumi kovariatsioon on Cramér-Rao piir vähendatud parameetrikomplekti jaoks. Ei ole geodeetiline toode.

engine-kind-lunar-llr-datum-description = Seitseparameetriline Helmerti Kuu tugisüsteemi datum, mida juhib TEGELIK, ARHIVEERITUD vaatluskampaania, mitte simuleeritud. Kus lunar-frame-campaign eemaldas süstitud teisenduse, kuid esitas oma jaamavõrgu, graafiku ja vaatluskaupa sigma ILLUSTRATIVE sisenditena, võtab see liik kõik kolm mõõtmisest: epohhid on arhiveeritud ILRS Consolidated Laser Ranging Data normaalpunktide maapealsed saateajad, vaatlused on tegelikult viiele Kuu peegeldusmassiivile tulistatud laserkaugused ning iga vaatluse kaal on selle normaalpunkti enda arhiveeritud täpsus bin_rms/sqrt(n_raw), mis on failist välja loetud. Jaamade koordinaadid pärinevad IERS ITRF2020 SLR lahendusest (propageeritud epohhini nende avaldatud kiiruste abil) ja peegeldajate koordinaadid JPL DE430 tabelist 7 keskmise Maa/keskmise pöörlemise tugisüsteemis, mille IAU 2015 WGCCRE mudel realiseerib. Kaugusosatuletised koondatakse ühiseks peegeldajakoordinaatide Fisheri infomaatriksiks ja propageeritakse läbi sama Helmerti kujunduse datumi kovariatsiooniks, mida diagnoosib crate::fim::crlb. Aste, defekt, tingimus, spekter, vaadeldamatud suunad seitseparameetrilises baasis, nõrgim suund täisastmel ja iga parameetri osakaal selles väljastatakse igal käigul ning piiramata parameeter avaldatakse NULLINA koos olekuga. Massiividevaheline korrelatsioon on MEASURED täpselt nulliks, mitte eeldatud, sest laserkaugus puudutab ühte massiivi. Kirje, mida kataloogid ei suuda paigutada — jaam ilma avaldatud ITRF-i asukohata — JÄETAKSE VAHELE JA LOETAKSE, mitte kunagi ei anta talle asendatud koordinaati. MIS LINGID ON MEASURED JA MIS MODELLED, ON ARUANNE, MITTE allmärkus: Kuu keskpunkti efemeriid ja IAU kehaorientatsioon jäävad modelleeritud ning nende ühendsuurus väljastatakse vaadeldud-miinus-arvutatud ühesuunalise kaugusjäägina üle kõigi kasutatud punktide; troposfäär, tahke keha looded, jaama ekstsentrilisus, poolusliikumine, UT1-UTC, relativistlik viivitus ja jaamakellad puuduvad ja on selle jäägi sees. Kuna efemeriidi viga jõuab kovariatsioonini ainult iga vaatejoone suuna kaudu, lahendab iga käik ka kogu datumi uuesti kõigi osatuletistega, mis on kallutatud sensitivity_tilt_deg võrra (märk vahelduv), ning väljastab suhte, nii et kovariatsiooni tundetus modelleeritud efemeriidi suhtes on arv, mitte argument. Simuleeritud kampaania enda näitajad KÄIVITATAKSE ja trükitakse mõõdetud näitajate kõrval, mitte ei kirjutata ümber. MODELLED: seitseparameetrilised näitajad on Cramér-Rao piir vähendatud parameetrikomplekti jaoks tegelikul graafikul — mitte lahendatud datum, mitte LLR analüüs ja mitte geodeetiline toode. Fikseeritud tegelike andmete lõik tarnitakse hoidlaga, kuid mitte avaldatud crate'iga; suuna data_dir selle koopiale.

engine-kind-lunar-beacon-description = Kuu orbitaalse navigatsiooniteenuse pinnamajakate täiendus käivitatava enne/pärast tabelina. Lõunapolaarne kasutaja näeb hõredat orbitaalset komplekti kitsas taevalaigus, seega kaugusmõõtmise geomeetria on halvasti tingitud; mõned MÕÕDISTATUD PINNAMAJAKAD annavad madala tõusunurgaga ja laia asimuudiga vaatejoonte read, mida täiesti pealaelise komplektil puudub, ning horisontaalne täpsuse halvenemise tegur kukub kokku. Stsenaarium esitab kolm konfiguratsiooni ühel epohhil — ainult satelliidid, satelliidid pluss nähtavad majakad ja suurem konstellatsioon alternatiivse teena sama geomeetriani — igaühel nähtavate allikate arvud, täielik DOP ja realiseeritud 1-sigma täpsus MEETRITES, mis saadakse läbi korrutamisel majakakaupa kasutaja ekvivalentse kaugusmõõtmise veaga, mis on koostatud kella sünkroniseerimise, mitmeteeleve ja mõõdistuse liikmete ruutude summa juurena. Majaka nähtavus on õhuta Kuu kahe kõrguse geomeetriline silmapiir (atmosfääri pole, seega piir on täpne) ja DOP-i kokkupanek on sama tuum, mida on ristkontrollitud gnss_lib_py vastu failis tests/dop_reference.rs. MIKS SEE LIIK OLEMAS ON: selle taga olev moodul on olnud mootoris ja kontrollitud sõltumatu DOP-i teega alates L08/L09, kuid see ei olnud käigust kättesaadav — ei liiki, ei dispetšeriharu, ei komplekteeritud faili. README reklaamis võimekust ja kontrollimaatriksis polnud selle jaoks ÜHTEGI rida, seega seda väideti samaaegselt proosas ja ei väidetud registris, olles samal ajal mootoris kättesaamatu. Vaikeväärtused on geomeetria, millel juba on fikseeritud etalon (kasutaja -80 deg juures 2 m antenniga, kolm majakat asukohtades -80/0, -79/+60 ja -79/-60 kõrgusel 2 km, kuuesatelliidiline illustratiivne LCNS-i hetktõmmis t=0 juures, 5 deg mask), seega paljas käik reprodutseerib tabeli, mida oraakel juba katab, mitte ei leiuta uusi arve. MODELLED: konstellatsiooni disain, majakate paigutus ja iga veaeelarve suurus on illustratiivsed sisendid, mitte kasutusel olev mõõdistus ega mõõdetud link; ainult DOP-i aritmeetika, silmapiiri suletud kuju ja seos sigma = DOP x sigma_URE on väliselt ankurdatud. Ei ole teenuse toimivuse kohustus.

engine-kind-earth-gnss-lunar-description = Maa GNSS-i vastuvõtt Kuu kaugusel, nõrga signaali kiht, mida konfliktikindluse artikkel nimetab ja mille jaoks mootoril polnud mudelit. GNSS-satelliit suunab oma antenni Maa poole; Kuu lähedal olev vastuvõtja asub umbes viisteist korda orbiidi raadiuse kaugusel, seega kolm asja hammustavad korraga. Maa VARJAB VISIIRI: 26,560 km kauguselt katab see { $lit_13_9 } deg poolnurga, seega iga Kuu poole suunduv kiir peab lahkuma saatjast vähemalt nii kaugel nadiirist, mis eemaldab kiire tipu enne, kui ühtegi võimsust arvutatakse. Alles jääb PEALOOBI SERV JA KÜLGLOOBID, režiim, milles LuGRE kasulik koormus 2025. aastal tegelikult töötas. Ja vabaruumi kadu on L1 juures umbes 208 dB, umbes 25 dB rohkem kui maapealne kasutaja maksab. Aruanne väljastab ühe rea satelliidi kohta (visiirist kõrvalekalde nurk, Maa varjamine, vahemaa, trajektoorikadu, saate võimendus selle nurga all, vastuvõetud võimsus, kandja ja müra tihedus) ja koondab ainult lingid, mis ületavad jälgimisläve. SEE ESITAB KA TINGITUSE, sest just see defineerib selle kihi: iga nähtav satelliit asub Kuult vaadates paarikraadise laiusega koonuse sees, seega vaatejooned on peaaegu paralleelsed, täpsuse halvenemise tegur on tohutu ja Maa GNSS-i lahendus Kuu kaugusel on palju rohkem AJASTUSE-klassi vaatlus kui asukohaklassi oma. MODELLED, ja saate muster on selle põhjus: gain nurga all on ühtlane ringapertuur (Airy), samas kui tegelik GPS L1 antenn on kaheteistkümne elemendiga heeliksmassiiv kujundatud pealoobi ja mitte-Airy külgloobidega. Mõõdetud mustrid on olemas ega ole siin kaasatud, seega järjestused ja suurusjärgud on tähenduslikud, ühe satelliidi dB aga mitte. Meelega PUUDUVAD, igaüks teeb eelarve optimistlikumaks: ei ionosfääri- ega troposfäärikadu serva riivavatel kiirtel, ei polarisatsiooni-, suunamis- ega teostuskadu ning sfääriline Maa ilma murdumislaienduseta. Kuu asukoht on SISEND (vahemaa pluss inertsiaalne suund), mitte efemeriidi otsing, sest katsetatav suurus on link ja kiire geomeetria. Selle rea ülendamine tasemele Validated vajab mõõdetud saatemustrit ja LuGRE normaalpunkte; ei üks ega teine ole hoidlas ja ei ole siin välja mõeldud.

engine-kind-lunar-infrastructure-description = MODELLED uuringud Kuu orbiidist ja pinnast navigatsiooni- ja geodeesiataristuna, viis uuringut ühe liigi taga, mida valib `study`: od-consistency (pardal Maa GNSS-i orbiidi määramine NRHO-s või ELFO-s sõltumatu maapealse radiomeetrilise orbiidi määramise vastu, hinnatud nende enda kovariatsioonide järgi algväärtusega Monte Carlo üle), carrier-phase (ühine pinna-orbiteri topeltdiferentseeritud kandelaine faas ja täisarvuliste mitmetähenduslikkuste lahendamine LAMBDA-ga), frame-coestimation (pinnajaam ja orbiterid lisatud Maa jaamade kaugusmõõtmisele seitseparameetrilise Kuu tugisüsteemi datumi jaoks), space-tie (GNSS, VLBI ja laserkaugusmõõtmine ühel kosmoselaeval, tugisüsteemi sideme täpsus vs kohaliku sideme viga) ja geodesy-sensitivity (Kuu Love'i arvude h2, k2, l2 ja füüsikalise libratsiooni Fisheri info laserkaugusmõõtmisest, orbiteri jälgimisest, pinna gravimeetrist ja pinnakellast). Piiratud kolme keha mudel nimetatud lihtsustustega; numbrilisi tulemusi on kontrollitud sõltumatute programmidega ja midagi ei võrreldud Kuu suuruse mõõtmisega.

engine-kind-cislunar-arc-recovery-description = MODELLED tsislunaarse kaare pikkuse vaadeldavuse läve sõltumatu hindaja test. See lävi on ASTME lugemine vaadeldavuse maatriksilt, mis on koostatud ANALÜÜTILISEST vahemaa Jacobi maatriksi ridadest ja ANALÜÜTILISEST variatsioonilisest olekuülemineku maatriksist, ning selle ruutjuure infofiltri ristkontroll voldib samu ridu — kooskõlakontroll kahe numbrilise masina vahel, mitte kinnitus. See liik annab puuduva vahekohtuniku: partii vähimruutude hindaja, mis tegelikult TAASTAB ülema algoleku simuleeritud mõõtmistest, mõõtmise osatuletistega, mis on võetud komponeeritud ettemudeli KESKSETE LÕPLIKE VAHENDITENA. See ei kutsu ühtegi analüütilist Jacobi rida, ühtegi variatsioonilist STM-i, ühtegi singulaarväärtuse ega omadekompositsiooni, ühtegi astme tolerantsi ega ruutjuure infofiltrit — lähtetekstikaitse failis tests/cislunar_arc_recovery_reference.rs teeb selle jõustatavaks — samas kui dünaamika (sama RK4 CR3BP voog), algtingimused (sama diferentsiaalselt korrigeeritud konstellatsioon), skalaarne vaadeldav suurus ja epohhiruudustik on meelega jagatud ning nimetatud väljastatud `independence` plokis, sest kaks sama füüsikalise probleemi analüüsi peavad füüsikas kokku leppima, et olla võrreldavad. Kaks kriteeriumi, mõlemad pühitud üle viie dekaadi oma piirist: MÜRAVABA TAASTAMINE (iga algväärtusega katse lõplik olekuviga on kõige rohkem recovery_factor korda selle apriorne nihe — astme analoog, ilma singulaarväärtuse tolerantsita) ja MONTE CARLO HINDAMISVÕIMALIKKUS (mõõdetud RMS asukohaviga algväärtusega müraansambli üle alla nimetatud piiri — hindamisvõimalikkuse analoog, mõõdetud, mitte ennustatud). Toetab tasapinnalist neljaolekut ja ruumilist kuueolekut, DRO / L2 halo / L2 NRHO perekondi, vahemaa ja vahemaakiiruse vaadeldavaid suurusi ning Kuu-keskset polaarparameetrisatsiooni, kus teisendust rakendatakse OLEKULE ja ettemudel diferentseeritakse seal uuesti. MEASURED avaldatud tasapinnalisel DRO ruudustikul: hindaja taastab neljaoleku alates { $lit_0_782609 } h astme kriteeriumi { $lit_2_086957 } h vastu rel_tol 1e-6 juures (suhe { $lit_0_375 }) — astme lävi EI OLE kinnitatud taastatavuse piirina — samas kui mõõdetud hindamisvõimalikkuse piir langeb samasse ruudustikulahtrisse mis formaalne, { $lit_5_739130 } h, ja mõõdetud veakõver reprodutseerib formaalse 1-sigma üle 21 kaare pikkuse geomeetrilise keskmise suhtega { $lit_0_98 }. MODELLED: konstellatsiooni disain, epohhiruudustik, ainus jälgitav link, nihke suurus, mõõtmise sigma ja kaks nimetatud piiri. Ei ole sertifitseeritud navigatsioonitoimivuse toode.

engine-kind-telecom-timing-description = Telekommunikatsiooni ajastus: GNSS-i holdoveri ajaviga, maksimaalne ajaintervalli viga (MTIE) ja ajahälve (TDEV), kontrollitud ITU-T maskide vastu PASS või FAIL ja varuga maski kohta. Sisend on kas SÜNTEETILINE HOLDOVER (ostsillaatori eelseadistus -- ocxo, rubidium, caesium või csac, igaüks kannab nimetatud avaliku Microchipi andmelehe stabiilsuse, vananemise ja temperatuuri näitajaid -- pluss GNSS-i kao aeg, salvestuse pikkus ja diskreetimisintervall; vabalt töötav kell kannab valget, flicker- ja, kus andmelehe sobitus seda vajab, juhusliku ekslemise sagedusmüra, lineaarset vananemist ja siinuselist temperatuuriliiget) või SISSELOETUD SARI [time_s, time_error_ns] paaridest, antud otse (ja ainult natiivsetes versioonides CSV-fail). Maskid: ITU-T G.8272 (07/2025) PRTC-A ja PRTC-B (max|TE| 100 / 40 ns, MTIE tabelid 1-2, TDEV tabelid 3-4); G.8272.1 (2024) Amd. 1 (07/2025) ePRTC lukustatud (30 ns, tabelid 1-2) ja ePRTC-A holdover (tabeli 3 ajavea mähis, mis tõuseb 30 ns-st 100 ns-ni holdoveri perioodi H jooksul, mille määrab lukustatud kestus, MTIE tabel 4, TDEV tabel 5); G.8273.2 (2023) Amd. 2 (11/2025) T-BC/T-TSC klassid A-C (max|TE|, konstantne ajaviga, madalpääsfiltreeritud MTIE ja TDEV) ja klass D (max|TE_L| 5 ns, ainus klassi D näitaja, mis pole jäetud edasiseks uurimiseks); G.8271.1 (2022) Amd. 3 (05/2025) tugipunkt C (max|TE_L| 1100 / 600 / 100 ns koos MTIE tabelitega 7-1 kuni 7-3). Iga kirje, mille soovitus märgib edasiseks uurimiseks, puudub, mitte ei ole täidetud, ja iga aruanne loetleb, mis ei ole realiseeritud. Esitab ka aja iga maksimaalse ajavea eelarve ületamiseni (vaikimisi: 100 ns ePRTC max|TE_HO|, 400 ns võrgu holdoveri eraldis, 1100 ns punkt C, { $lit_1_5 } us klass 4), MTIE/TDEV kõverad CSV tabelina koos iga maski piiriga ning ühikute ja päritolu kirje iga arvvälja kohta. VALIDATED: MTIE ja TDEV hindajad allantools paketi vastu fikseeritud holdoveri sarjal. MODELLED: maskitabelid on ümberkirjutused ja sünteetiline holdover on andmelehe maksimumidest ehitatud mudel, mitte ühegi seadme mõõtmine. Ei ole vastavustest.

engine-kind-slot-timing-description = Pesa ajastus: sekundid, kuni vabalt töötav kell lahkub ajaindekseeritud marsruutimis- või ülesandepesa kaitseaknast (suurim absoluutne ajaviga, mida pesa talub), iga liikme panus sellel hetkel koos domineeriva nimetamisega (lahenduse määramatus, valge faasimüra, valge, flicker-, juhusliku ekslemise ja juhusliku jooksu sagedusmüra, jääksagedusnihe, temperatuur, vananemine), viimasest lahendusest allesjäänud aeg ja suurim lahendusintervall, mis hoiab kella sees, lahendusviivitusega vähendatult. Ostsillaator on KLASSI vaikeväärtus (csac, uso, dsac, tcxo, ocxo või rafs: üks tsiteeritud ühesekundiline Alani hälve ja eeldatav punase müra põrand), telecom-timing ANDMELEHE EELSEADISTUS või otse antud ANDMELEHT (Alani hälbe maksimumid sobitatud mähisena, pluss vananemine ja temperatuurikoefitsient), või otse antud MEASURED FAASISALVESTUS (selle kattuv Alani hälve sobitatud kaalutud vähimruutudega valge faasi ja IEEE Std 1139 sagedusmodulatsiooni baasis, seega punase müra põrand on mõõdetud, mitte eeldatud). Rikkumine üle pikima keskmistamisaja, mida andmeleht või salvestus toetab, märgitakse ekstrapoleeritud. Valikuline spuufimise jaotis lisab orbiidil oleva vastuvõtja ajastuse kaitsetaseme: orbitaalkiirus ja periood, kui kaua üksik maapealne spuufija suudab satelliidini ülelennu jooksul ulatuda, kellatoega seire põrand ja CUSUM tuvastuslatentsus, tinglik piir, tõmme, mille spuufija nimetatud maksimaalse tõusukiirusega kogub enne, kui satelliit lahkub tema ulatusest või sõltumatu kontroll käivitub, ning kas iga maakontakti või ristlingi kontroll on sellest spuufijast sõltumatu. VALIDATED: holdoveri inversioon sobitatud salvestusest, hoitud tagasi tõelisel vesinikmaseri vastu mõõdetud tseesiumkellal (tests/slot_timing_cs5071a_holdout.rs, andmetega piiratud); mõõdetud kvartsostsillaatoril on tagasihoitud ennustus konservatiivne, kuid mitte läve piires, seega kvartsijuhtum on MODELLED. MODELLED: klassi ja andmelehe allikad, deterministlikud liikmed ja spuufimise hinnang.

engine-kind-spectrum-description = L-riba spektrimudel ja spektri juga: kogu GNSS-i L-riba ühe võimsusspektri tihedusena (PSD), sagedus risti, aeg alla, stsenaariumiga seatud segaja ajajoone kohal. SIGNAALID: GPS L1 C/A ja L2C (BPSK(1)), Galileo E1 avatud teenus (MBOC(6,1,1/11) või BOC(1,1)), GPS L5 ja Galileo E5a (BPSK(10)), igaüks oma kandjal liidesespetsifikatsiooni minimaalse vastuvõetud võimsusega (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), kui seda ei kirjutata üle; GLONASS, BeiDou ja Galileo E6 ei ole modelleeritud. SEGAJAD: pidevlaine toon, lame kitsaribaline müra, lineaarne saehambaline sirin (chirp) ja lairibamüra, mis on sobitatud riba enda modulatsiooniga, igaühel keskpunkt, ribalaius, vastuvõetud võimsus (otse, või EIRP ja vahemaa segamisliigi vabaruumi trajektoorikao kaudu) ja sisse/välja lülitamise ajad. Iga segajat hinnatakse iga riba suhtes selle spektraalse eralduskoefitsiendiga kappa üle vastuvõtja ribalaiuse ja (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; ühe segaja korral on see võrdne segamisliigi segamisvastase võrrandiga, kus Q = 1/(R_c kappa), ja aruanne kannab seda ristkontrolli (ning segamisliigi esindava Q näitaja selle kõrval). Müraalus on k T_sys, kus T_sys = T_ant + 290 K (F - 1). Spektri juga keskmistab iga lahtri üle selle lahtri ja rea (sirinad täpselt, tervete pühkimiste pluss osalise abil; segajad, mis lülituvad rea keskel, oma töötsükli järgi), seega C/N0 ajajoon ja pilt tulevad samadest arvudest; result.json kannab võimsuses plokkidena keskmistatud ruudustikku, riba kaupa C/N0 ja J/S rea kohta ning segaja ja riba kohta SSC, Q, J/S, ribasisese J/S ja püsiva C/N0. Valikuline [iq]: mudel joonistatud kompleksse IQ-na ühel hetkel, kirjutatud SigMF salvestusse (cf32_le või ci16_le) ja sealt tagasi loetud ning võrreldud Welchi hinnanguga. Valikuline [recording] (natiivsed versioonid): tegeliku SigMF salvestuse Welchi PSD mudeli kõrval. VALIDATED: signaalide PSD-d õpikuliste pealoobi laiuste vastu (BPSK(n) 2n x { $lit_1_023 } MHz nullist nullini; BOC(1,1) loobid tsentreeritud +/-{ $lit_1_023 } MHz juures) ja spektraalsed eralduskoefitsiendid nende Parsevali suletud kujude ning Kaplan & Hegarty Q = 1 (CW) ja { $lit_1_5 } (sobitatud) vastu. MODELLED: segajate võimsused, ajajoon, esiotsa ribalaiused, pideva spektri (ilma koodijoonteta) käsitlus ning AGC, tühistamise ja antennimustri puudumine.

engine-kind-solar-system-description = Kogu päikesesüsteem ühel epohhil, PNT jaoks (positsioneerimine, navigatsioon ja aeg) mis tahes keha ümber. Päikese, kaheksa planeedi, Pluuto, Kuu, Phobose, Deimose, Io, Europa, Ganymedese, Callisto ja Titani kohta esitab see heliotsentrilise asukoha ja kiiruse ICRF-is (rahvusvaheline taevane tugisüsteem, ekvatoriaalne J2000), heliotsentrilise kauguse ning J2000 ekliptika pikkuse ja laiuse, gravitatsiooniparameetri, ekvatoriaalse ja keskmise raadiuse, J2, kui see on avaldatud, ja selle tugiraadiuse, sideerilise pöörlemisperioodi, IAU pooluse ja nullmeridiaani epohhil, ühe tiirlemise ulatuses diskreeditud orbiidirea (planeetidel heliotsentriline, kuudel emakeha-keskne) ning valguse aja, ühe- ja kahesuunalise vahemaa, Päikese Shapiro viivituse ja Päikese nurkkauguse vaatluskehast (vaikimisi Maa); lisalingid from/to saavad sama käsitluse. Asukohad: Standishi ja Williamsi JPL Kepleri elemendid (tabel 1 aastatele 1800 AD kuni 2050 AD, tabelid 2a/2b aastatele 3000 BC kuni 3000 AD) koos iga planeedi nimiveaga, Montenbruck & Gilli Kuu rida Maa-Kuu lahutuseks, JPL keskmised elemendid IAU sünkroonse pöörlemiskiirusega Marsi ja Galilei kuudele ning IAU pöörlemismudel Titanile. Valguse aeg: radiomeetriline fikseeritud punkti lahendus, saatja oma hilinenud asukohas; Newtoni, Shapiro viivitus esitatud eraldi. VALIDATED JPL Horizonsi (DE441) vastu kahekordse nimivea piires: Merkuurist Saturnini ja Maa tabelist 1 (halvim { $lit_1_87 } korda nimiväärtus) ning kõik kaheksa planeeti tabelitest 2a/2b (halvim { $lit_1_71 } korda) ja Maa-Marsi ning Maa-Jupiteri valguse aeg. MODELLED, iga rida märgistatud: Uraan ja Neptuun tabelist 1 ({ $lit_2_0 } ja { $lit_5_2 } korda nimiviga DE441 vastu), Pluuto (1992. aasta rida; viga nimetamata), Kuu ja seitse kuud (mõõdetud Horizonsi vastu, avaldatud piiri pole).

engine-kind-body-pnt-description = Positsioneerimine mis tahes päikesesüsteemi keha ümber: orbiter või pinnalander nime järgi valitud keskkeha ümber, navigeerides ühesuunaliste pseudovahemaadega keha ümber oleva väikese Walkeri navigatsioonikonstellatsiooni (kahe keha orbiidid keha enda J2 sekulaarse triiviga, tundmatu kasutaja kell) ja valikuliselt kellavaba kaugkosmose kahesuunalise vahemaaga Maalt, mille suund ja kaugus tulevad analüütilisest päikesesüsteemi efemeriidist igal epohhil. Vaatejooned blokeerib keha keskmine sfäär ja pinnakasutaja vajab ka tõusunurga maski. Epohhi kohta: nähtavad releed, kas Maa on serva kohal, ainult konstellatsiooni GDOP ja PDOP (geomeetriline ja asukoha täpsuse halvenemise tegur), formaalne ühe sigma asukoha määramatus Maa reaga ja ilma ning algväärtusega Gauss-Newtoni vähimruutude lahenduse viga kummalgi viisil; käigu kohta: kättesaadavus, Maa nähtavus, mediaanne PDOP, RMS viga ja mediaanne formaalne sigma, pluss Maa-keha valguse aeg, edasi-tagasi tee, Shapiro viivitus ja Päikese nurkkaugus epohhil. MODELLED: releeorbiidid, mürataseme ja hetkeline mõõtmismudel on modelleerimisvalikud, mitte valideeritud missiooni navigatsiooniandmete vastu; keha konstandid on failis body.rs viidatud avaldatud väärtused ja Maa geomeetria pärib päikesesüsteemi efemeriidi märgised.

engine-kind-constellation-design-description = Konstellatsiooni disain mastaabis: Walker DELTA ja Walker STAR mustrid i: T/P/F tähistuses (sõlmed hajutatud 360 või 180 deg peale, tasandisisene vahe 360*P/T, tasanditevaheline faasinihe 360*F/T), selged elementide loendid ja mitmekihilised disainid, mitu konstellatsiooni ühes käigus, Maa, Kuu, Marsi või mis tahes muu planeedi, Pluuto või suure kuu ümber, kasutades moodulis body olevaid konstante (samu, mida kasutavad päikesesüsteemi ja body-pnt liigid). EELSEADISTUSED avaldatud nimielementidest: gps-baseline ja gps-expandable (24 pesa ja kuus ette/taha laiendatavat paari GPS Standard Positioning Service Performance Standard 5. väljaandest 2020, tabelid 3.2-1 kuni 3.2-3), galileo (Walker 24/3/1 kõrgusel 29 599.801 km ja 56 deg, Galileo Open Service Service Definition Document väljaanne 1.1 tabelid 1 ja 23), beidou ja beidou-meo (Walker 24/3/1 kõrgusel 21 528 km ja 55 deg pluss kolm geostatsionaarset satelliiti 80, { $lit_110_5 } ja 140 deg E juures ja kolm kaldus geosünkroonset satelliiti 55 deg juures, BeiDou Open Service Performance Standard 3.0 jaotis 4.1; MEO faas ja 118 deg E kaldus geosünkroonse läbimine on modelleeritud, sest standard neid ei nimeta) ja glonass (24/3/1 kõrgusel 19 100 km ja { $lit_64_8 } deg GLONASS Interface Control Document väljaande 5.1 jaotise 5.2 pesavalemist). KATVUS JA TÄPSUSE HALVENEMISE TEGUR: üle laius-/pikkusruudustiku ja diskreeditud akna tõusunurga maskiga nähtavate satelliitide arv, GDOP, PDOP, HDOP ja VDOP lahtri kohta, kättesaadavus (lahendus PDOP-iga läve tasemel või sellest madalam, vaikimisi 6) lahtri kohta, globaalselt (pindalaga kaalutud) ja halvimas asukohas, ühe vastuvõtja kellaga konstellatsiooni kohta, kui clock = "common" pole seatud. See skaleerub tuhandete satelliitideni: nähtavus on skalaarkorrutis iga satelliidi katvuse poolnurga vastu ning satelliidid jaotatakse ribadesse alamsatelliidi laiuse järgi iga epohhi kohta, nii et ruudustiku rida testib ainult neid, mis saavad olla nähtaval; aruanne loendab säästetud paaritestid. JSON kannab ruudustikukaardid ja allavalitud satelliidikaupa maapealsed jäljed. VALIDATED: Walkeri generaator Galileo OS SDD tabeli 23 ja GLONASS ICD pesavalemi vastu, GPS eelseadistus SPS PS tabeli 3.2-1 avaldatud ekvaatoriületuse veeru vastu ja GPS baastaseme globaalne HDOP jaotus SPS PS lisa B vastu (mediaan { $lit_0_94 }, 95% { $lit_1_25 }, keskmine { $lit_0_96 }, tolerants { $lit_0_03 }). MODELLED: kahe keha orbiidid valikulise sekulaarse J2-ga, sfääriline keha, ainult geomeetriline nähtavus (ilma signaalivõimsuse, tervise ega reljeefita) ja erinevate süsteemide suhteline faas, mis ei ole ühegi tegeliku kuupäeva hetktõmmis.

engine-kind-campaign-description = Kampaania: olemasolevad stsenaariumiliigid koostatud üheks käiguks, iga arv loetud nimetatud liigi tegelikust käigust. Neli jaotist, mis tahes kombinatsioonis. FAASID: aheldatud missioon ühel jagatud ajajoonel -- iga faas käivitab ühe või mitu stsenaariumi (näiteks jamming, siis spoofing, siis holdoveris kell koos selle kõrval libiseva inertsiaalnavigatsioonisüsteemiga, siis terviklikkuse alarm, siis taastumine), nende väljundid loetakse nimetatud kanaliteks (kella ajaviga selle kaitseakna suhtes, kandja ja müra tiheduse suhe jälgimispõranda suhtes, kaitsetase häirepiiri suhtes, asukohaviga, jälgivad satelliidid, alarmilipud) liigipõhise eelseadistuse või selgete tulemuseteede abil ning diskreeditakse ühisele ruudustikule nullastme hoidega, koos faasipiiride ja sündmustega; olek antakse edasi carry (kanal jätkub eelmise faasi lõppväärtusest), handoff (eelmise faasi arv kirjutatud selle faasi stsenaariumisse) ja end_at (faas lõpeb ajal, mille käik arvutas, näiteks spuufimise seire tuvastusajal) abil. PÜHKIMINE: ruudustik ühe kuni kolme punktidega stsenaariumivõtme üle mis tahes liigist (täisarvuline segment indekseerib tabelite massiivi, nagu system.2.sisre_m), mõõdikutega, mis loetakse tulemuseteega ja, kui käike on rohkem kui üks, algväärtusega Monte Carlo ansambliga igas sõlmes. MONTE_CARLO: realisatsioon k käivitub algväärtusega base_seed + k; iga mõõdik esitab keskmise, standardhälbe, lähima järgu 5./50./95. protsentiilid ja fikseeritud algväärtusega bootstrap 95% usaldusvahemiku keskmisele. COMPOSE: mitu stsenaariumi jagatud väärtuste all (ühe segaja võimsus ja asukoht kirjutatud mere- ja maanteevastuvõtjasse), koos kombineeritud parima/halvima kokkuvõttega. Tulemus kannab kampaania räsi, kõigi liikmetulemuste kokkuvõtte ja ühikute kirje iga väljastatud arvu kohta; koostalitluse ekspordid kirjutavad iga geomeetriaga liikmestsenaariumi oma failikomplektina. Koostamise samasusi testitakse: ühefaasiline kampaania reprodutseerib iseseisva käigu bitt bitilt, fikseeritud algväärtusega ansambel on baidistabiilne ning valge sagedusmüraga kellal jääb ansambli keskmine esitatud vahemiku sisse hajuvusega, mis vastab sqrt(q_wf * tau). MODELLED: liitev carry ja nullastme hoie on modelleerimisvalikud ning iga faas kannab seda käivitanud liigi märgist.

engine-kind-leo-signal-description = LEO-PNT signaalide disainid: parametriseeritud madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) signaalid mis tahes süsteemi, riba ja struktuuri jaoks. SIGNAAL on riba (kesksagedus, saate ribalaius, ITU jaotus RNSS/RDSS/MSS/EESS/non-RNSS/other) ja komponendid (omandamine, andmed, pilot; mis tahes alamhulk), igaühel modulatsioon (BPSK(n) murdarvulise n-iga, BOC(m,n), MBOC(6,1,p) või lame OFDM-laadne riba), võimsusosa, valikulised FDMA alamkandja nihked, koodi pikkus ja andmekiirus. Signaalid tulevad kompileeritud avalikest eelseadistusfailidest (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; igaüks oma allika URL-iga ja iga avaldamata väärtus märgistatud REPRESENTATIVE) või kirjutatakse otse. IGA SIGNAALI KOHTA: ribapiiratud võimsusspektri tihedus ja iga komponendi võimsuse osa, mille saateriba läbi laseb (BPSK suletud kuju arvväärtuse kõrval), RMS (Gabori) ribalaius, viivitusahela koodijälgimise termilise müra jitter vs C/N0 ja early-late vahe Betz & Kolodziejski 2009 ribapiiratud koherentsest (või mittekoherentsest) early-late valemist koos selle piiramata riba õpikuvormi ja kaduva vahe Gabori piiriga, kaugusmõõtmise täpsus meetrites, omandamise otsinguruum (Doppleri korvid orbiidi maksimaalsest Dopplerist pluss ostsillaatori ja kasutaja liikmed, korda koodikorvid), ruutseaduse tuvastustõenäosus ning keskmine järjestikune ja koodiga paralleelne omandamisaeg, signaali spektraalne eralduskoefitsient GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b ja E5 AltBOC-i suunas ning kumbki signaali suunas koos C/N0 halvenemisega, ning CW, lairiba ja sobitatud J/S, mida jälgitav komponent talub, spektriliigi enda SSC masinavärgist. RIBAKOMPROMISS: esimese järgu ionosfääriviivitus ({ $lit_40_3 } TEC/f^2), vabaruumi kadu, kaugusmõõtmise täpsus võrdsel C/N0 ja võrdsel EIRP juures ning segaja taluvus. Valikulised KUJUKONTROLLID hoiavad disaini spektrit kirjeldatud mõõtmise vastu (MODELLED kooskõla). VALIDATED: BPSK võimsus ribas ({ $lit_90_3 } % pealoobis) ja Gabori ribalaiuse suletud kujud, ribapiiratud jitter, mis taandub õpikuliseks koherentseks early-late kujuks ja selle Gabori piiriks, nihutatud BPSK spektraalne eralduskoefitsient selle Parsevali suletud kuju vastu, AltBOC spektri ühikpindala ja maksimaalne LEO Doppler avaldatud Xona Pulsari (32-34 kHz) ja Iridiumi (36 kHz) näitajate vastu. MODELLED: iga disain, võimsusjaotus, C/N0 ja segaja tase; EFQPSK, CSK ja OFDM spektrid on ligikaudsed.

engine-kind-leo-pass-description = LEO ülelend ja lingieelarve riba kaupa LEO-PNT jaoks (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt), süsteemist sõltumatu: kasutaja (maa, mere, õhu või siseruumi, staatiline või liikuv) ja üks või mitu LEO satelliiti KUJUNDATUD ÜLELENNUST (ringorbiit, mis on paigutatud nii, et kasutaja näeb ühte valitud maksimaalse tõusunurgaga ülelendu valitud ajal, soovi korral päikesega sünkroonne), selgetest ELEMENTIDEST, TLE-st (kahe rea elementide komplekt) läbi mootori SGP4 või WALKER konstellatsioonist, mille on ehitanud konstellatsiooni disaini kood (esitatakse kõrgeimad ülelennud). Ribad tulevad nimetatud eelseadistusest (üldine mitmeriba UHF/L/S/C, üldine C-riba, Xona Pulsar X1/X5, Iridium STL, Starlink ainult-Doppleri oportunistliku signaalina, CentiSpace ja valikuline Celeste IOD eelseadistus märgitud WORKSHOP) või kirjutatakse stsenaariumisse; iga eelseadistus ütleb, kas selle arvud on PUBLIC (URL-iga), REPRESENTATIVE või WORKSHOP. Satelliidi, riba ja epohhi kohta: tõusunurk, asimuut, vahemaa, vahemaakiirus ja vahemaakiirendus; vabaruumi trajektoorikadu; EIRP ja satelliidi mustri võimendus (isoflux, Gaussi kiir või lame); kasutaja antenni võimendus vs tõusunurk (plaaster, poolkerakujuline või isotroopne); gaasiline sumbumine (ITU-R P.676-10 lisa 2), vihma sumbumine (ITU-R P.838-3 koefitsiendid ja P.618-14 protseduur vihmakiirusest ja vihmakõrgusest), troposfääri sünkimine (ITU-R P.618-14 jaotis 2.4.1), hoonesse sisenemise kadu siseruumi kasutajale (ITU-R P.2109-2), polarisatsiooni mittesobivus, süsteemi müratemperatuur ja C/N0 (kandja ja müra tihedus); Doppler ja Doppleri kiirus suletud kujul vahemaakiirusest ja vahemaakiirendusest, kumbki kontrollitud kesksete vahedega; esimese järgu ionosfääriviivitus { $lit_40_3 } STEC/f^2 Klobuchari või vertikaalse TEC kaldus TEC-ist, skaleeritud satelliidist allpool oleva ionosfääri osale. Ribapaarid saavad ionosfäärivabad koefitsiendid, müra võimenduse ja koodimüra ülelennu tipus. MEO GNSS satelliite (Galileo või GPS eelseadistused) hinnatakse sama antenni- ja mürimudeliga nende liidesedokumentide vastuvõetud võimsustest, seega LEO kellukujuline ülelend ja lamedad GNSS kandjad jagavad ühte graafikut. Valikuline [iot] jaotis annab aja esimese lahenduseni, energia lahenduse kohta ja aku eluea töötsükli suhtes nimetatud vastuvõtja võimsuseelarve jaoks (MODELLED). Iga ribapaar annab ka kaldus TEC, mille geomeetriavaba kombinatsioon tipus taastab, ja selle hinnangu koodimüra sigma (ionosfääri sondeerimine). Valikuline [spoofer] jaotis võltsib väidetava asukoha signaale, mis hüppab või lükatakse tegelikust pärast algust, ning käivitab kaks seiret nimetatud valehäire ja tuvastamata jäänud sündmuse tõenäosustega: Doppleri ja ülelennu geomeetria kooskõla (mõõdetud vahemaakiirused võrreldes orbiitidest ja sõltumatust eelnevast asukohast ja kiirusest ennustatuga, üldistatud vähimruutude hii-ruut test üle akna, GNSS, LEO ja kõigil kanalitel) ning ribadevaheline kooskõla (iga LEO ribapaari mudelkorrigeeritud geomeetriavaba kombinatsiooni epohhist epohhi samm), esitades epohhikaupa statistikud ja millal kumbki seire tuvastab (MODELLED). VALIDATED komponendid: vabaruumi kadu, P.838-3 koefitsiendid selle tabeli 5 vastu, P.618-14 vihma ja sünkimise protseduurid ning P.2109 hoonesse sisenemise kadu ITU-R Study Group 3 valideerimisnäidete vastu, IS-GPS-200 L1/L2 grupiviivituse suhe ja staatilise kasutaja ringorbiidi maksimaalne Doppler arXiv 2509.19551 tabeli 1 vastu. MODELLED: EIRP-d, mustrid, TEC-i Chapmani osa satelliidist allpool ja kogu ülelend.

engine-kind-leo-navmsg-description = LEO navigatsioonisõnum: madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja satelliidi ringhäälingu efemeriid ja kell, mis tahes orbiidi, kandja ja mudeli jaoks, valikuliste nimetatud eelseadistustega (Xona Pulsar, Iridium, Starlink, CentiSpace, esindav C-riba süsteem, ATOMIC nullkella mudel, Celeste IOD). SISU: lisaandmed (SVID, andmete väljaanne, riba, signaali tervis), sünkroniseerimine (nädal, nädala aeg, teise järgu kellapolünoom af0-af2 ümber toc), efemeriid ühes neljast mudelist -- Galileo OS SIS ICD 16-parameetriline Kepleri komplekt; see komplekt pluss piki-, ristsuunalised ja radiaalsed parandupolünoomid; Liu et al. 2025 22-parameetriline mudel; ECEF polünoom ilma kellaliikmeteta (ATOMIC nullkell) -- ja muud teenused (Klobuchari ringhäälingukomplekt, NeQuick-G ai0-ai2 efektiivse ionisatsioonitasemega ning süsteemiaeg-UTC parameetrid ICD liigsekundi loogikaga). SOBITAJA: tõeorbiit, mis on integreeritud tsonaalse J2-J6 või EGM2008 gravitatsiooniga valitud astmeni ja takistusega, ning algväärtusega vaba või juhitud kell; Levenberg-Marquardti sobitus Kepleri komplektile mittesingulaarsetel elementidel, seejärel lineaarsed vähimruutude parandupolünoomid; kell sobitatud kasutaja lisatava relativistliku liikme võrra vähendatult. ANALÜÜSID: fit-interval-trade (signaali ruumis levimise kaugusviga, SISRE, globaalse keskmise kaaludega orbiidi kõrgusele, vs sobitusintervall ja uuenduse periood, ainult orbiit ja kellaga), model-comparison (neli mudelit, parameetrite arv, kodeeritud bitid ja Kshana sobitus Liu et al. kõrgustel avaldatud näitajate kõrval), midpass-update (kõrgeim ülelend kasutaja kohal, iga sõnumivahetuse asukoha, kella ja kasutaja kauguse hüpe, halvima geomeetria hüpe, PASS/FAIL pidevuse läve vastu), encode-decode (Kshana enda dokumenteeritud binaarne kaader CRC-24Q-ga, välja kohta pooleastmeline kvantimiseelarve, rikutud kaadri kontroll, RINEX-4-laadne kirje eksport ja import märgistatud Kshana laiendusena ning CSV tabel). VALIDATED: SISRE kaalud avaldatud MEO/GEO tabeli vastu (Montenbruck et al. 2018); Galileo kasutaja algoritm RTKLIB vastu tegelikel Galileo ringhäälingu efemeriididel; CRC-24Q selle kataloogi kontrollväärtuse ja RTCM 1005 näidiskaadri vastu. MODELLED: iga sobitus- ja SISRE näitaja on esitusviga Kshana poolt integreeritud tõe suhtes (ilma orbiidi määramise või prognoosi veata); Liu et al. võrdlus kasutab erinevaid orbiite; kodeering ja tekstivormingud on Kshana omad.

engine-kind-leo-pvt-description = Sulandatud keskmise Maa orbiidi (MEO) ja madala Maa orbiidi (LEO) positsioneerimine, navigatsioon ja aeg (PNT) MIS TAHES konstellatsioonide kohal: iga [[system]] on constellation-design liigi GNSS eelseadistus, LEO eelseadistus (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, atomic-zero-clock efemeriidimudel või muu eelseadistusfail, igaüks oma failis allikatega märgitud PUBLIC, WORKSHOP või DERIVED), Walkeri kihid või selged elementide komplektid, koos kandjaga, kiibikiirusega, kandja ja müra tiheduse (C/N0) mähisega tõusunurga maskilt seniidini, signaali ruumis levimise kaugusveaga (SISRE), Doppleri sigmaga ja kellamudeliga (selle enda vastuvõtja kell, seega süsteemidevaheline nihe hinnatakse, või teada ringhäälingu nihe). Neli režiimi. DOPPLER: partii Gauss-Newtoni positsioneerimine vahemaakiirusest analüütiliste osatuletistega, kella triivi ja valikuliste kiiruseolekutega ning valikulise kõrguspiiranguga, ühe- või mitme satelliidiga, viga vs akna pikkus, iga LEO süsteemi Doppleri, Doppleri kiiruse ja hõnguse mähis ning ühe ülelennu piki- ja ristsuunaline täpsus vs ristsuunaline nihe (ristsuunaline viga kasvab piiramatult, kui ülelend läheb pealaele; ühel ülelennul on ka peeglilahendus üle maapealse jälje). Ainult-Doppleri oportunistlik signaal (starlink-sop) töötab siin. JOINT: epohhikaupa kaalutud vähimruutude pseudovahemaa lahendused ainult GNSS-ist, ainult LEO-st ja mõlemast, mõõtmiskaupa sigmad viivitusahela termilise müra mudelist C/N0 juures pluss SISRE (või fikseeritud sigma, nii et signaalimudel saab neid toita), hinnatud süsteemidevahelised nihked ning PDOP/HDOP/VDOP vs lisatud LEO satelliitide arv. POLAR: nähtavad satelliidid ja DOP vs laiuskraad GNSS-i, LEO ja mõlema jaoks. TIMING: aja edastamine koordineeritud maailmaajale (UTC) teadaolevas asukohas LEO satelliitidelt kaheolekulise kellafiltriga, mille protsessimüra tuleb mootori ostsillaatoriklassidest, vs C/N0 ja ostsillaator, ning IS-GPS-200 süsteemiaeg-UTC avaldis; kui [timing] trace = true, esitab iga rida ka oma ajavea ja prognoositud sigma igal epohhil. VALIDATED: pealaelt horisondini ülelennu suurim Doppler avaldatud Iridiumi (kuni 36 kHz) ja Xona Pulsar X1 (32 kuni 34 kHz) näitajate vastu. MODELLED: kõik muu; DOP on kontrollitud käsitsi tuletatud juhtumiga, lahendused oma kovariatsiooniga ja Doppleri mudel vahemaakiirenduse samasusega.

engine-kind-leo-ppp-description = Täpne punktpositsioneerimine (PPP) koondumine ainult GNSS-iga ja LEO täiendusega: ujuv laiendatud Kalmani filter ionosfäärivabal koodil ja kandelaine faasil staatiliste jaamakoordinaatidega, valge vastuvõtja kell, üks süsteemidevaheline nihe lisasüsteemi kohta, juhusliku ekslemisega seniidi märgviivitus, mis on kujutatud 1/sin(elevation) kaudu, ja ujuv täisarvuline mitmetähenduslikkus satelliidi kaare kohta; täpne orbiidi-ja-kella viga on valge ja satelliidi koodile ning faasile ühine, seega iga satelliit on üks korreleeritud kahe rea uuendus Joseph-stabiliseeritud kujul. Mõõtmised simuleeritakse samast mudelist algväärtusega müraga mitme jaama ja algväärtuse üle ning iga juhtum (kõigepealt ainult GNSS, seejärel iga LEO süsteemide [[case]], mis tahes konstellatsioon või eelseadistus) esitab mediaanse koondumisaja (esimene epohh, mille järel horisontaalne ja vertikaalne viga jäävad allapoole lävesid, vaikimisi 10 cm), koondunud osa, mediaansed veakõverad ja filtri kooskõla (käigu keskmine asukoha NEES kahepoolse 95% hii-ruut ribaga võrreldes). Valikuliselt avaldatud Li et al. (2019, J. Geod. 93:749, doi 10.1007/s00190-018-1195-2) keskmiste laiuskraadide näitajate kõrval: { $lit_9_6 } min multi-GNSS-ile lüheneb väärtusteks { $lit_7_0 }, { $lit_3_2 }, { $lit_2_1 } ja { $lit_1_3 } min 60, 96, 192 ja 288 LEO satelliidiga. MODELLED: trendi kooskõlavõrdlus, mitte selle uuringu konstellatsioonide, müra ega jaamade reprodutseerimine; ei mingit täisarvuliste mitmetähenduslikkuste lahendamist, tsüklihüppeid, faasi pöördumist, looteid ega ajaliselt korreleeritud tootevigu.

engine-kind-ntn-positioning-description = Positsioneerimine 5G mitte-maapealse võrgu (NTN) allalingist mobiilse satelliiditeenuse (MSS) S-ribas (3GPP riba n256, allalink 2170 kuni 2200 MHz; vaikimisi kandja { $lit_2172_5 } MHz): Cramér-Rao piir (CRB) saabumisajale, c / (2 pi beta sqrt(2 (C/N0) T)), kus beta on lameda OFDM spektri ruutkeskmine (Gabori) ribalaius (B/sqrt(12)), ja kompleksse tooni Dopplerile, sqrt(3 / (2 pi^2 (C/N0) T^3)), iga signaali jaoks (vaikimisi 5 MHz New Radio kanal { $lit_4_5 } MHz hõivatuga ja 200 kHz kitsaribakanal 180 kHz hõivatuga); seejärel üle mis tahes LEO konstellatsiooni allalingi saabumisaja lahendused tundmatu vastuvõtja kellaga (algväärtusega, piir pluss võrgu sünkroniseerimisviga sigmana), nende PDOP ja formaalne 3D sigma ning ühe satelliidi Doppleri lahendus pikima ülelennu jooksul kõrgus fikseerituna. MODELLED: ribalaiuse-piiri samm on õpikuline suletud kuju, kontrollitud lameda ja ribapiiratud BPSK spektri numbrilise integreerimisega (sisemine kooskõla, avaldatud läbitöötatud näitajat ei kinnitata), ja positsioneerimise täpsus on piir mitmeteelevita kanalil nimetatud sünkroniseerimisveaga, mitte saavutatud tulemus.

engine-kind-leo-pnt-chain-description = Üks LEO-PNT (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt) süsteem otsast lõpuni, mis tahes konstellatsiooni ja signaali jaoks: signal_design poolt nimetatud leo-signal disain (avalik eelseadistus või otse antud [signal] disain) seab [pass] riba keskpunkti, ribalaiuse, kiibikiiruse ja EIRP jaotuse, leo-pass lingieelarve annab jälgitava C/N0 ja ribapiiratud koodi jitteri üle ülelennu, C/N0 sirge sin(elevation) kohal ja [navmsg] sõnumi ringhäälingu SISRE (sobitatud ülelennu satelliidi kõrgusel) toidavad iga [fusion] leo-pvt ühise lahenduse LEO süsteemi ja valikuliselt [ppp] leo-ppp juhtumeid; iga üleandmine on loetletud oma väärtuse ja ühikuga. MODELLED.

engine-kind-contact-schedule-description = Maakontaktide planeerimine mitme satelliidi jaoks mitme jaama kohal: näivad juurdepääsuaknad (SGP4, IAU 2006/2000A Maaga seotud tugisüsteem, ITU-R P.834 murdumine, valguse aeg), iga ülelennu DVB-S2 ACM andmemaht (ETSI EN 302 307-1 tabeli 13 läved) ja konfliktivaba ajakava (üks satelliit antenni kohta ümberlülitusajaga, üks jaam satelliidi kohta, prioriteediga kaalutud edastus piiratud iga mahajäämusega) piirväärtusega ahne meetodi, esimesena-tulnu lähtetaseme ja täpse hargne-ja-piira meetodiga väikestel hulkadel, koos ahne meetodi optimaalsuse lõhega. MODELLED.

engine-kind-acm-link-description = Üks satelliit ühe jaama kohal: iga ülelennu kaldvahemaa, tõusunurk ja Es/N0 piki ülelendu, igal sammul valitud DVB-S2 MODCOD (ETSI EN 302 307-1 tabeli 13 läved pluss teostusvaru) ja andmemaht, mida ACM liigutab, võrreldes konstantse kodeeringuga lähtetasemega, mis sulgub maskil. MODELLED.

engine-kind-aocs-description = Kosmoselaeva orientatsiooni juhtimine: jäiga naba inertsiaalse suunamise pööre kolme või enama tasakaalustatud reaktsioonirattaga MRP tagasiside all (L = -K sigma - P omega), minimaalse normiga rattamomendid kärbitud iga mootori piirini, RK4 nullastme hoidega; valikuliselt suletud multiplikatiivsele EKF-ile simuleeritud güroskoobist (nurga ja kiiruse juhuslik ekslemine) ja tähejälgijast. Esitab rahunemisaja, lõpliku ja tipp-suunamisvea, rattakiiruse ja -momendi tipu, küllastunud osa, nurkimpulsi triivi ning hindajaga selle orientatsioonivea ja NEES-i. Tõeoleku ahel on VALIDATED Basilisk 2.9.1 vastu; hindaja on MODELLED.

engine-kind-entry-heating-description = 3-DoF punktmassi atmosfääri sisenemine üle pöörleva sfäärilise Maa või Marsi (ballistiline või tõstejõuga konstantse kreeniga), RK4, läbi US76, eksponentsiaalse või Marsi atmosfääri, Sutton-Gravesi pidurduspunkti konvektiivse kuumenemisega (NASA TR R-376): tippseisak, soojusvoog ja dünaamiline rõhk, soojuskoormus, kaugus piki maapinda, pöörleva tugisüsteemi energiakontroll ja Allen-Eggersi suletud kuju selle kõrval. Tippseisakut kontrollitakse avaldatud Stardusti nimiväärtuse vastu; kuumenemine on MODELLED.

engine-kind-eo-radiometry-description = Nadiiri kujutaja radiomeetria ja pildikvaliteet: Lamberti stseeni apertuuril olev kiirgus, kaameravõrrand, signaal ja kvantmüra/tumeda voolu/lugemise/kvantimise müra ning SNR; süsteemi MTF Nyquisti sagedusel (difraktsioon x detektor x määrdumine x jitter), sellest suhteline servavastus, Q = lambda F/p ja GIQE versiooni 4 NIIRS ilma MTF-i kompenseerimiseta. MODELLED.

engine-kind-ascent-losses-description = Tasapinnaline gravitatsioonipöörde tõus mitmeastmelise kandja jaoks üle mittepöörleva sfäärilise Maa läbi USA standardatmosfääri 1976 (vertikaalne tõus, kaldenurga hoop, tõukejõud piki kiirust), integreerides gravitatsiooni-, takistus-, suunamis- ja vasturõhukaod ning kontrollides ideaalset dv miinus kaod põlemise lõpu kiiruse vastu; max-Q, tippkiirendus ja põlemise lõpu olek. MODELLED.

engine-kind-time-transfer-budget-description = Kahesuunaline satelliidi aja ja sageduse edastamine kahe jaama vahel läbi geostatsionaarse releesatelliidi: kahesuunaline võrrand lahendatud T_A - T_B jaoks iga mittevastastikuse liikmega (jaama seadmete viivitused, Ku-riba ionosfäär, transponder, Sagnac), ruutsummana määramatuse eelarve, mille A-tüübi liige on simuleeritud lingi TDEV keskmistamisajal, simuleeritud link valge ja flicker-faasimüra ning ööpäevase mittevastastikusega, ning mis tahes antud BIPM Circular T jaotise 1 sarja, MJD,ns CSV või IGS RINEX jaamakella kirjete stabiilsus (kiirus, jääk RMS, TDEV, ADEV). MODELLED.

engine-kind-optical-atmosphere-description = MODELLED optiline PNT läbi atmosfääri: optilise lingi ja nimetatud pilveklimaatidega maajaamade hulga jaoks esitab see lainepikkusest ja tõusunurgast sõltuva selge õhu kao (Kim nähtavusseadus pluss Rayleigh), Hufnagel-Valley turbulentsi oleku (Rytovi dispersioon, sünkimisindeks, gamma-gamma parameetrid, apertuurikeskmistamine), ilmast juhitud kättesaadavuse lingivaru suhtes (pilve optiline paksus log-normaalsest vedela vee kliimast, geomeetrilise optika ekstinktsioon, sõltumatu turbulentsi hajumine), lingivaru, mis on vajalik sihtkättesaadavuste jaoks, katkestuste kestuse jaotuse, ajastus- ja kaugusmõõtmise vea kasvu katkestuse kohta läbi kella holdover-mudeli, kaugusega korreleeritud jaamade mitmekesisuse kättesaadavuse ning täiustustehnikate mis-kui võidud (lainepikkus, vastuvõtuapertuur, adaptiivoptikaga sünkimise vähendamine, lisavaru). VALIDATED nimetatud valemite teostusena sõltumatu mpmath oraakli vastu: Rytovi dispersioon, sünkimisindeks, gamma-gamma hajumise tõenäosus, apertuurikeskmistamise tegur, pilve ja selge õhu optiline paksus. MODELLED: iga ilma-, tehnika- ja kellasisend ning sõltumatuse ja koopula eeldused; ühtegi mõõdetud kättesaadavuse kirjet pole võrreldud. Nõuandev analüüs, mitte sertifitseeritud kättesaadavuse ega navigatsiooni toode.

engine-kind-holdover-test-description = MODELLED ajastussüsteemi holdover-test (aja hoidmine ilma välise etalonita), skoorituna ajavea salvestusest, mille OPERAATOR esitab (linuxptp ptp4l, phc2sys või ts2phc logi, chrony tracking või statistics logi, TICC, TimeLab või RINEX kellalogi või time_s,time_error_ns paarid). Testil on neli sammu ja Kshana ei tee ühtegi neist: lukustatud LÄHTETASE, operaatori poolt EEMALDATUD GNSS (antennikaabel või simulaatori väljund; Kshana ei saada ega juhi midagi) nimetatud ajal, HOLDOVER süsteemi enda ostsillaatoril ja TAASTUMINE pärast seda, kui operaator taastab GNSS-i teisel nimetatud ajal. Salvestus jagatakse nende kahe ajahetke juures. Lähtetase: ajavea statistika ja lukustatud kellale kirjutatud ITU-T maskid. Holdover: statistika, süsteemi hoitud suhteline sagedusnihe (vähimruutude sirge), holdoveri või autonoomse kella jaoks kirjutatud maskid, ePRTC-A holdoveri mähis nimetatud lukustatud kestusest ja aeg iga ajavea eelarve ületamiseni. Taastumine: kas ja millal |TE| jõudis nimetatud ribasse ja jäi sinna, tipp ja suurim samm. Iga piir on ümber kirjutatud avalikust ITU-T tabelist (telecom-timing maskid); sõnastus on „mõõdetud maski suhtes“ ja kaks ajahetke on operaatori väide, mitte kontrollitud. Maski jaoks liiga lühike salvestus on INCOMPLETE, mitte kunagi ekstrapoleeritud. Vt docs/TIMING-HIL.md.

engine-kind-gnss-ssv-description = MODELLED GNSS-i kättesaadavus ja lingi tugevus kosmoseteenuse mahus ja kaugemal: kasutaja jaoks sfääril (ICG brošüüri globaalne kest) või Kepleri trajektooril (LEO-st Kuu transferini) loendab see konstellatsiooni kohta (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja kõigi kokku üle C/N0 läve kasutatavad signaalid - vähemalt ühe ja nelja signaali kättesaadavus, maksimaalne katkestuse kestus, vastuvõetud C/N0, täpsuse halvenemise tegur, pealoobi vs külgloobi lingid - brošüüri, parametrilise või kasutaja antud saatemustriga, valikuliste serva kiire ionosfääri, plasmasfääri ja atmosfääri mõjudega ning valikulise nõrga signaali vastuvõtja disainiga; samuti pardal GNSS-i laiendatud Kalmani filter HEO ja Kuu transferi aparaatidele (orbitaaldünaamika, päikesekiirguse rõhk, kolmandad kehad, kell) ja mitme aparaadi formatsiooni suhteline navigatsioon ühekordselt diferentseeritud pseudovahemaadega. Kontrollitud ICG SSV brošüüri tabelite vastu eelregistreerimise all (xval/gnss-ssv)

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-e-api-clock-log = clock_log: { $e }

engine-e-api-builtins-ephemeris = ephemeris: { $e }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-site-title-a = Ülesanne (a): tuvastamine vastuvõtja logides

engine-bench-site-title-b = Ülesanne (b): tuvastamine IQ-andmetes

engine-bench-site-title-c = Ülesanne (c): ajastuse holdover-i ennustamine

engine-bench-site-title-d = Ülesanne (d): jaotusest väljas olev optimismilõhe

engine-bench-site-col-rmse-3600 = RMSE 3600 s (ns)

engine-bench-site-col-rmse-300 = RMSE 300 s (ns)

engine-bench-site-col-rmse-7200 = RMSE 7200 s (ns)

engine-bench-site-col-auc-in = AUC sees

engine-bench-site-col-auc-out = AUC väljas

engine-bench-site-col-optimism-gap = Optimismilõhe

engine-bench-site-col-flag = Märge

engine-bench-site-col-auc = AUC

engine-bench-site-col-pd-at-pfa-cap = P_d P_fa piiril (ülempiir)

engine-bench-site-flag-optimistic = optimistlik

engine-bench-site-flag-within-tolerance = tolerantsi piires

engine-bench-site-not-available = n/a

engine-bench-site-none-published = Tulemusi pole veel avaldatud. Rida ilmub siia alles siis, kui tulemusfail on hinnatud ja lisatud; sellel lehel ei ole midagi hinnang.

engine-bench-site-none-for-task = Selle ülesande kohta pole veel tulemusi.

engine-bench-site-region-label = { $title } { $split } tulemused

engine-bench-site-caption-split = Jaotus: { $split }

engine-bench-site-th-system = Süsteem

engine-bench-site-th-provenance = Päritolu

engine-bench-site-th-truth-sha256 = Tõe SHA-256

engine-bench-site-provenance-carried = üle kantud: { $note }

engine-bench-site-provenance-scored = hinnatud

engine-bench-site-heading = kshana-bench edetabel

engine-bench-site-lede = Tulemusfailid, mis on hinnatud standardi <code>{ $spec }</code> alusel. Rida ütleb, et see fail sai sellel jaotusel selle tulemuse. See ei tähenda, et keegi oleks mõnda toodet hinnanud või heaks kiitnud, ning ühtegi organisatsiooni ei nimetata toetajana.

engine-bench-site-foot = Iga skoor on modelleeritud, kui rida ei ütle, et väline oraakel nõustus. Spetsifikatsiooni ja manifestide litsents: CC-BY-4.0 / CC0 on ettepanek, omaniku otsus on ootel. Päris andmete holdout ei ole salajane: vt spetsifikatsiooni jaotist 4.

engine-bench-site-meta-description = Esitatud tulemusfailide skoorid kshana-bench { $spec } alusel. Ainult nõuandev.

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

# The validation-tier words. The glossary: one message per word, shown next to a figure of merit in the study report and the run summary.
engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENT

engine-geometry-chart-north = N

engine-geometry-chart-east = E

engine-geometry-chart-south = S

engine-geometry-chart-west = W

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-iq-campaign-report-roc-heading = Tuvastamise ROC

engine-iq-campaign-report-roc-note = <p class="note">Märgend <b>{ $label }</b>. Iga nimetatud sündmuseaken on positiivne ja iga seatud pikkusega aken väljaspool sündmusi negatiivne. Aken loetakse läviväärtuse juures, kui monitori enda testistatistik jõuab aknas selleni. P<sub>fa</sub> on negatiivse akna kohta, mitte testi kohta. Samad arvud on failis <code>roc.json</code>.</p>

engine-iq-campaign-report-th-alarm-kind = Alarmi liik

engine-iq-campaign-report-th-positives = Positiivsed

engine-iq-campaign-report-th-negatives = Negatiivsed

engine-iq-campaign-report-th-auc = AUC

engine-iq-campaign-report-th-threshold = Lävi

engine-iq-campaign-report-th-pd-at-it = P<sub>d</sub> selle juures

engine-iq-campaign-report-th-pfa-at-it = P<sub>fa</sub> selle juures

engine-iq-campaign-report-title = Kampaania { $name }

engine-iq-campaign-report-heading = Laborireplay kampaania: { $name }

engine-iq-campaign-report-meta = Andmeklass <b>{ $data_class }</b> · Kshana { $engine } · { $n_recordings } salvestust × { $n_frontends } esiotsa × { $n_designs } kujundust = { $n_cells } lahtrit, { $n_done } valmis · räsi <code>{ $digest }</code>

engine-iq-campaign-report-digest-incomplete = (puudulik: kõik lahtrid pole valmis)

engine-iq-campaign-report-reference-note = <p class="note">Mõõdetud väärtused tulevad salvestuste jälgimisest. Katkendjooned märgendiga <b>{ $label }</b> on analüütiline spektraalse eraldatuse etalon <code>{ $formula }</code> labori esitatud J/S juures, kus Q tuleneb esitatud häire liigist. Need on esitatud tingimuse mudel, mitte mõõtmine ega häire simulatsioon.</p>

engine-iq-campaign-report-summary-heading = Kokkuvõte

engine-iq-campaign-report-th-recording = Salvestus

engine-iq-campaign-report-th-front-end = Esiots

engine-iq-campaign-report-th-design = Kujundus

engine-iq-campaign-report-th-satellites = Satelliidid

engine-iq-campaign-report-th-mean-availability = Keskmine kättesaadavus

engine-iq-campaign-report-th-events-lost = Kaotatud sündmused

engine-iq-campaign-report-th-median-reacq = Mediaan taastoomine (s)

engine-iq-campaign-report-th-pass = Läbitud

engine-iq-campaign-report-th-fail = Läbikukkunud

engine-iq-campaign-report-degradation-heading = C/N0 halvenemine esitatud J/S suhtes

engine-iq-campaign-report-scorecard-heading = Skoorikaart

engine-iq-campaign-report-scorecard-note-nwpr = <p class="meta">Samad read nagu failis <code>scorecard.csv</code>. Taasomandamist mõõdetakse sündmuse nihkest; katkestust lukustuse kadumisest. C/N0 veerg ja halvenemiskõverad kasutavad NWPR hinnangut (näitab silmuse enda värina korral umbes 8 dB · Bn·T liiga madalat, seega sõltuvad selle näidud silmuse kujundusest); mõlemad hinnangud on failis <code>scorecard.json</code>.</p>

engine-iq-campaign-report-scorecard-note-m2m4 = <p class="meta">Samad read nagu failis <code>scorecard.csv</code>. Taasomandamist mõõdetakse sündmuse nihkest; katkestust lukustuse kadumisest. C/N0 veerg ja halvenemiskõverad kasutavad M2M4 hinnangut (silmuse enda värina suhtes tundetu); mõlemad hinnangud on failis <code>scorecard.json</code>.</p>

engine-iq-campaign-report-th-sat = Sat

engine-iq-campaign-report-th-scope = Ulatus

engine-iq-campaign-report-th-event = Sündmus

engine-iq-campaign-report-th-avail = Kättes.

engine-iq-campaign-report-th-loss = Kadu (s)

engine-iq-campaign-report-th-js-at-loss = J/S kadumisel

engine-iq-campaign-report-th-reacq = Taastoomine (s)

engine-iq-campaign-report-th-outage = Katkestus (s)

engine-iq-campaign-report-th-cn0 = C/N0

engine-iq-campaign-report-th-pll = PLL σ (°)

engine-iq-campaign-report-th-dll = DLL σ (chip)

engine-iq-campaign-report-th-false-locks = Valelukustused

engine-iq-campaign-report-th-verdict = Otsus

engine-iq-campaign-report-scope-run = jooks

engine-iq-campaign-report-scope-event = sündmus

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scint S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

engine-iq-signals-galileo-galileo-e1-prn = Galileo E1-B PRN { $prn }

engine-iq-signals-galileo-galileo-e1-prn-2 = Galileo E1-C PRN { $prn }

engine-iq-signals-galileo-galileo-e5a-prn = Galileo E5a-I PRN { $prn }

engine-iq-signals-galileo-galileo-e5a-prn-2 = Galileo E5a-Q PRN { $prn }

engine-iq-signals-gps-gps-l1cd-prn = GPS L1CD PRN { $prn }

engine-iq-signals-gps-gps-l1cp-prn = GPS L1CP PRN { $prn }

engine-iq-signals-gps-gps-l5-i5-prn = GPS L5 I5 PRN { $prn }

engine-iq-signals-gps-gps-l5-q5-prn = GPS L5 Q5 PRN { $prn }

engine-iq-signals-gps-gps-l2-cm-prn = GPS L2 CM PRN { $prn }

engine-iq-signals-gps-gps-l2-cl-prn = GPS L2 CL PRN { $prn }

engine-iq-signals-gps-gps-l2c-prn = GPS L2C PRN { $prn }

engine-iq-signals-lunanet-lunanet-afs-prn = LunaNet AFS-I PRN { $prn }

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-chart-pdop = PDOP { $pdop }

engine-lunar-frame-realise-chart-tx = tx (m)

engine-lunar-frame-realise-chart-ty = ty (m)

engine-lunar-frame-realise-chart-tz = tz (m)

engine-lunar-frame-realise-chart-theta-x = θx (µrad)

engine-lunar-frame-realise-chart-theta-y = θy (µrad)

engine-lunar-frame-realise-chart-theta-z = θz (µrad)

engine-lunar-interop-chart-pass = PASS

engine-lunar-interop-chart-fail = FAIL

engine-lunar-interop-chart-ok = OK

engine-lunar-jamming-chart-locked = LOCKED

engine-lunar-jamming-chart-degraded = DEGRADED

engine-lunar-jamming-chart-lost = LOST

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-chart-zero-east = 0° E

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-omm-ccsds-omm-vers = CCSDS_OMM_VERS = { $version }{ "\u000A" }

engine-omm-mean-element-theory = MEAN_ELEMENT_THEORY = { $mean_element_theory }{ "\u000A" }

engine-omm-mean-motion = MEAN_MOTION = { $mean_motion_rev_day }{ "\u000A" }

engine-omm-ra-of-asc-node = RA_OF_ASC_NODE = { $ra_of_asc_node_deg }{ "\u000A" }

engine-omm-arg-of-pericenter = ARG_OF_PERICENTER = { $arg_of_pericenter_deg }{ "\u000A" }

engine-omm-mean-anomaly = MEAN_ANOMALY = { $mean_anomaly_deg }{ "\u000A" }

engine-omm-ephemeris-type = EPHEMERIS_TYPE = { $ephemeris_type }{ "\u000A" }

engine-omm-classification-type = CLASSIFICATION_TYPE = { $classification }{ "\u000A" }

engine-omm-norad-cat-id = NORAD_CAT_ID = { $norad_cat_id }{ "\u000A" }

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-raim-chart-hal = HAL { $al } m

engine-raim-chart-val = VAL { $al } m

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

engine-receiver-trust-machines-imu-fit-id-provenance-bias-va-gyro =
    { "[" }{ $table }]
    id = { $id }
    provenance = { $provenance }
    bias = { $bias }
    q_va = { $q_va }
    gyro_bias = { $gyro_bias }
    q_arw = { $q_arw }
    bias_instability = { $bias_instability }{ "\u000A" }

engine-resilience-report-title = PNT vastupidavuse enesehindamine

engine-resilience-report-status-partner = PARTNER

engine-resilience-report-summary = <p>Mootor { $engine }, stsenaarium { $scenario }, algväärtus (seed) { $seed }. Tõendite jaotus: { $n_validated } { $validated } / { $n_modelled } { $modelled } alamskoori. Esialgne RPCF tase: { $level } ({ $level_basis }).</p>

engine-resilience-report-h-rpcf = DHS RPCF tehnikakategooriad

engine-resilience-report-h-rdrr = RethinkPNT funktsioonid

engine-resilience-report-h-yang = Yangi kriteeriumid

engine-resilience-report-th-category = Kategooria

engine-resilience-report-th-function = Funktsioon

engine-resilience-report-th-criterion = Kriteerium

engine-resilience-report-th-subscore = Alamskoor

engine-resilience-report-th-status = Olek

engine-resilience-report-th-basis = Alus

engine-resilience-report-integrity = <p>SHA-256 terviklikkus: <code>{ $integrity }</code></p>

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-ssv-check-mod1-min = { $key } MOD1 min

engine-ssv-check-mod4-min = { $key } MOD4 min

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

engine-study-summary = uuring „{ $title }“: { $n_scenarios } stsenaariumi

engine-study-metric-holdover = Holdover (s)

engine-study-metric-timing-rms = Ajastuse RMS (ns)

engine-study-metric-timing-p95 = Ajastuse p95 (ns)

engine-study-metric-resilience-slope = Vastupidavuse tõus (ns/s)

engine-study-metric-availability = Kättesaadavus

engine-study-metric-integrity = Terviklikkus

engine-study-metric-security = Turvalisus

engine-study-th-metric = Mõõdik

engine-study-th-validation = Valideerimine

engine-study-not-applicable-no-attack = n/a (rünnakut pole)

engine-study-page-title = { $title } — Kshana uuring

engine-study-eyebrow = क्षण · täpne hetk

engine-study-h-comparison = Kõrvuti võrdlus

engine-study-tier-note = Iga kvaliteedinäitaja on märgitud kui { $validated } (kontrollitud välise oraakli vastu) või { $modelled } (esimestest printsiipidest, sisemiselt testitud), tuletatud kontrollimaatriksist. Veerud on sõltumatud stsenaariumid; väärtusi ei normaliseerita stsenaariumide vahel.

engine-study-footer = Koostanud Kshana { $version } kui { $n_scenarios } stsenaariumi koondatud uuring. Iga stsenaarium on reprodutseeritav oma stsenaariumi, algväärtuse (seed) ja mootori versiooni põhjal. Vaba ja avatud lähtekoodiga (AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">lähtekood ja dokumentatsioon</a>.

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-host = --host: { $e }

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

engine-timetransfer-chart-rf = RF: { $id }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-compliance-fw-dhs-rpcf-title = US DHS Resilient PNT Conformance Framework

engine-compliance-fw-imo-ships-title = IMO guidance on GNSS interference for ships

engine-compliance-fw-easa-aviation-title = EASA guidance on GNSS interference for aviation

engine-compliance-fw-nis2-art21-title = EU NIS2 Directive, Article 21 risk-management measures

engine-compliance-fw-en-16803-title = EN 16803, GNSS-based positioning for road ITS

engine-compliance-fw-nist-ir-8323r1-title = NIST IR 8323r1, Foundational PNT Profile

engine-compliance-source-dhs-rpcf-1-title = Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework

engine-compliance-source-dhs-rpcf-1-version = Versioon 2.0, 26. aprill 2022 (DHS Science and Technology Directorate koostöös CISA-ga)

engine-compliance-source-dhs-rpcf-1-checked = dokument loetud täielikult; väljaande sihtlehte ei laaditud

engine-compliance-source-imo-ships-1-title = Deliberate interference with the United States Global Positioning System and other global navigation satellite systems

engine-compliance-source-imo-ships-1-version = IMO MSC.1/Circ.1644, 18. oktoober 2021

engine-compliance-source-imo-ships-1-checked = tekst loetud täielikult tsirkulaari kolmanda osapoole peegelkoopiast, mitte IMO saidilt; autoriteetse koopia leiate IMO dokumendiraamatukogust

engine-compliance-source-imo-ships-2-title = Worldwide Radionavigation System

engine-compliance-source-imo-ships-2-version = IMO assamblee resolutsioon A.1046(27), vastu võetud 30. novembril 2011

engine-compliance-source-imo-ships-2-checked = dokument loetud täielikult

engine-compliance-source-imo-ships-3-title = Performance standards for multi-system shipborne radionavigation receivers

engine-compliance-source-imo-ships-3-version = IMO MSC.401(95), vastu võetud 8. juunil 2015 (muudetud MSC.432(98), 2017)

engine-compliance-source-imo-ships-3-checked = algne resolutsioon loetud täielikult; 2017. aasta muudatuse teksti ei loetud. Ühtegi IMO tsirkulaari GNSS-häirete kohta, mis oleks hilisem kui MSC.1/Circ.1644, ei leitud; uuemaid otsige IMO dokumendiraamatukogust

engine-compliance-source-easa-aviation-1-title = Global Navigation Satellite System Outage and Alterations Leading to Communication / Navigation / Surveillance Degradation

engine-compliance-source-easa-aviation-1-version = EASA ohutusteabe bülletään SIB 2022-02R4, välja antud 3. juulil 2026, parandatud 22. juulil 2026 (teavitav, mitte kohustuslik)

engine-compliance-source-easa-aviation-1-checked = redaktsioon 4 loetud täielikult; jaotistele viidatakse pealkirja järgi, sest bülletään ei nummerda oma soovitusi. Kontrollitud uuesti 2026-10-10: bülletääni PDF, EASA AD-tööriista leht (mis märgib selle asendamise puudumist) ja EASA GNSS-leht ei nimeta hilisemat redaktsiooni ega bülletääni numbriga 2026-07; bännerit, mis nimetaks SIB 2026-07 redaktsiooni 2, ei leitud, seega küsimus on lahtine ja tuleb kontrollida EASA aktiivselt lehelt. Konfliktipiirkonna teabebülletääne ei avatud

engine-compliance-source-nis2-art21-1-title = Directive (EU) 2022/2555 on measures for a high common level of cybersecurity across the Union (NIS 2 Directive)

engine-compliance-source-nis2-art21-1-version = ELT L 333, 27.12.2022, lk 80–152

engine-compliance-source-nis2-art21-1-checked = artikli 21 lõigete tähed loeti EUR-Lexi lehe kokkuvõttest ja need vastavad avaldatud tekstile; enne tähe viitamist avaldusel kontrollige seda lehe vastu

engine-compliance-source-en-16803-1-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 1: Definitions and system engineering procedures for the establishment and assessment of performances

engine-compliance-source-en-16803-1-version = EN 16803-1:2020 (kataloog: kehtib alates 2. oktoobrist 2020, asendab 2016. aasta väljaande)

engine-compliance-source-en-16803-1-checked = ainult kataloogi ulatuse tekst; standard on tasuline ja seda ei loetud

engine-compliance-source-en-16803-2-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 2: Assessment of basic performances of GNSS-based positioning terminals

engine-compliance-source-en-16803-2-version = EN 16803-2:2020 (kataloog: kehtib alates 2. oktoobrist 2020)

engine-compliance-source-en-16803-2-checked = ainult kataloogi ulatuse tekst; standard on tasuline ja seda ei loetud

engine-compliance-source-en-16803-3-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 3: Assessment of security performances of GNSS-based positioning terminals

engine-compliance-source-en-16803-3-version = EN 16803-3:2020 (kataloog: kehtib alates 2. oktoobrist 2020)

engine-compliance-source-en-16803-3-checked = ainult kataloogi ulatuse tekst; standard on tasuline ja seda ei loetud. Kataloogi tekst nimetab numbriga punkti 6 (salvestatud versus simuleeritud signaalid) ja lisa A (rünnakute kõrgetasemeline liigitus) ning mitte midagi muud; kataloog ei nimeta komiteed, seega siin seda ei esitata

engine-compliance-source-nist-ir-8323r1-1-title = Foundational PNT Profile: Applying the Cybersecurity Framework for the Responsible Use of Positioning, Navigation, and Timing (PNT) Services

engine-compliance-source-nist-ir-8323r1-1-version = NIST IR 8323r1, jaanuar 2023 (NIST sisearuanne)

engine-compliance-source-nist-ir-8323r1-1-checked = PDF laaditi 2026-10-18 (SHA-256 on salvestatud failis tests/fixtures/compliance/headings.json) ja selle profiili tabelid 3 kuni 25 loeti viidatud alamkategooriate jaoks; teisi jaotisi, lisasid ja väljaande sihtlehte ei loetud. Alamkategooriate identifikaatorid järgivad profiili enda tabeleid, mis kasutavad küberturvalisuse raamistiku 1.1 identifikaatoreid

engine-compliance-cap-receiver-log-trust-name = Vastuvõtja logi usaldusväärsuse hindamine

engine-compliance-cap-receiver-log-trust-output = päris vastuvõtja enda logi usaldusolek epohhi kohta, alarmide ajad ja kooskõla enne käivitust esitatud sündmustega

engine-compliance-cap-jamming-effects-name = Segamise mõjud lingieelarvele

engine-compliance-cap-jamming-effects-output = kandja ja müra tihedus ning lukustuse olek satelliidi kohta esitatud segaja geomeetria korral

engine-compliance-cap-spoofing-detection-name = Spuufimise ja meaconing-u tuvastamine

engine-compliance-cap-spoofing-detection-output = detektori otsused ja detektori eristusvõime esitatud spuufimisrünnaku korral

engine-compliance-cap-integrity-monitoring-name = Terviklikkuse seire ja kaitsetasemed

engine-compliance-cap-integrity-monitoring-output = kaitsetasemed, kättesaadavus häirepiiride suhtes ja veatuvastuse tulemused

engine-compliance-cap-holdover-name = Holdover ja inertsliikumine

engine-compliance-cap-holdover-output = asukoha- või ajavea kasv GNSS-i keelamise ajal esitatud läve suhtes

engine-compliance-cap-source-diversity-name = Alternatiivsed ja mitmekesised PNT allikad

engine-compliance-cap-source-diversity-output = navigatsiooni- või ajastustoimivus allikatest, mis on esmasest GNSS-sagedusalast sõltumatud

engine-compliance-cap-resilience-scoring-name = Vastupidavuse hindamine ohuansamblite kohal

engine-compliance-cap-resilience-scoring-output = ellujäämis- ja vastupidavussuhted ohuvektori kohta esitatud ansambli kohal, eeldused esitatud

engine-compliance-cap-run-provenance-name = Reprodutseeritav käivituse päritolu

engine-compliance-cap-run-provenance-output = stsenaariumi räsi, mootori versioon ja algväärtus (seed) on igas tulemuses kaasas, et käivitust saaks korrata

engine-compliance-req-dhs-s5-2-reference = Jaotis 5.2 (ennetamine, reageerimine, taastumine)

engine-compliance-req-dhs-s5-2-asks = Vastupidavust kirjeldatakse kolme funktsioonina: kahju ennetamine, reageerimine (tuvastamine, teatamine, leevendamine, piiramine) ja taastumine. Tuvastamine on tõenäosuslik, seega on olulised nii valehäired kui ka tuvastamata jäänud sündmused.

engine-compliance-req-dhs-s5-2-gap = Ennetamine on toote kujunduse omadus, mida ükski simulatsiooni väljund ei näita. Sünteetilise või ühe seansi käivituse tuvastusstatistika ei ole kasutusel oleva toote mõõdetud valehäire- ega möödalaskmismäär.

engine-compliance-req-dhs-l1-r1-reference = Tase 1, nõue 1

engine-compliance-req-dhs-l1-r1-asks = Kontrollida, et väliskeskkonnast saabuvad salvestatud andmed vastavad asjakohaste standardite vormingutele ja väärtusvahemikele.

engine-compliance-req-dhs-l1-r1-gap = Katsetatava toote tarkvaratagatise ja sisendi valideerimise omadus. Kshana ei kontrolli toote sisendikäsitlust.

engine-compliance-req-dhs-l1-r2-reference = Tase 1, nõue 2

engine-compliance-req-dhs-l1-r2-asks = Võimaldada täielikku käsitsi taastamist mälu tühjendamise või lähtestamise teel, viies süsteemi pärast ohu möödumist tagasi määratud toimivusele.

engine-compliance-req-dhs-l1-r2-gap = Vastuvõtja logi näitab, millal fiks muutus usaldamatuks ja millal see taastus; see ei näita, et käsitsi lähtestamine tühjendab iga salvestatud oleku.

engine-compliance-req-dhs-l1-r3-reference = Tase 1, nõue 3

engine-compliance-req-dhs-l1-r3-asks = Laadida püsivara turvaliselt uuesti või uuendada.

engine-compliance-req-dhs-l1-r3-gap = Püsivara uuendamise turvalisus jääb väljapoole seda, mida ükski Kshana väljund jälgib.

engine-compliance-req-dhs-l2-r4-reference = Tase 2, nõue 4

engine-compliance-req-dhs-l2-r4-asks = Tuvastada kompromiteeritud PNT allikad ja takistada neil lahendi rikkumist.

engine-compliance-req-dhs-l2-r4-gap = Kshana hindab detektoreid ja monitore, mida ta modelleerib või käivitab logi kohal; kas toote enda allikate välistamine toimib, vajab toote sisemist olekut, mitte ainult selle logi.

engine-compliance-req-dhs-l2-r5-reference = Tase 2, nõue 5

engine-compliance-req-dhs-l2-r5-asks = Taastada allikad ja süsteem automaatselt väljundit katkestamata; lahend antakse ka ohu ajal, võimalik piiramatu halvenemisega.

engine-compliance-req-dhs-l2-r5-gap = Holdover-käivitused piiravad modelleeritud triivi esitatud kella- või inertsmudeli korral, mitte toote enda taastumiskäitumist.

engine-compliance-req-dhs-l3-r6-reference = Tase 3, nõue 6

engine-compliance-req-dhs-l3-r6-asks = Ühe allika rikutud andmed ei tohi saastata teist allikat.

engine-compliance-req-dhs-l3-r6-gap = Kshana käivitab allikaid kõrvuti; allikate isolatsioon toote sees vajab kujunduse ülevaatust või vigade süstimist tootesse.

engine-compliance-req-dhs-l3-r7-reference = Tase 3, nõue 7

engine-compliance-req-dhs-l3-r7-asks = Ristkontrollida kõigi allikate lahendeid ja hoida halvenemine ohu ajal piiratuna.

engine-compliance-req-dhs-l3-r7-gap = Piiratud halvenemine on näidatud modelleeritud andurite kohta; toote enda ristkontrolli ei jälgita.

engine-compliance-req-dhs-l4-r8-reference = Tase 4, nõue 8

engine-compliance-req-dhs-l4-r8-asks = Kasutada erinevate tehnoloogiatega allikaid ühisrežiimi ohtude vastu, ilma halvenemiseta ohu ajal.

engine-compliance-req-dhs-l4-r8-gap = Ühisrežiimi argument vajab päris toote allikate komplekti ja neid hõlmavat ohtu; stsenaarium esitab ühe, see ei tõesta, et tootel poleks ühist nõrkust.

engine-compliance-req-dhs-s5-5-reference = Jaotis 5.5 (ühisrežiim)

engine-compliance-req-dhs-s5-5-asks = Mitmekesistel mehhanismidel ei tohi olla ühist nõrkust: näiteks segaja, mis katab kaht sagedusala, kummutab sagedusalade mitmekesisuse.

engine-compliance-req-dhs-s5-5-gap = Hindamisel kasutatakse sünteetilist ohuansamblit, mis on nii öeldud; see ei ole välitööandmed.

engine-compliance-req-dhs-s8-1-8-3-reference = Jaotised 8.1 kuni 8.3 (hindamine)

engine-compliance-req-dhs-s8-1-8-3-asks = Hindamine ühendab staatilise analüüsi dünaamilise analüüsiga, kus testvektorid esindavad ohte; testiklassid on allika rike, häire ja sisemised rikked. Simulaatorid on nimetatud testimismeetodina.

engine-compliance-req-dhs-s8-1-8-3-gap = Eksporditud liikumine ja sündmused võivad juhtida laborisimulaatorit (docs/TEST-BENCH.md). Kshana ei kirjuta ühtegi signaali, seega ohu annavad simulaator ja selle volitatud operaator.

engine-compliance-req-dhs-s8-6-reference = Jaotis 8.6 (testiplaani elemendid)

engine-compliance-req-dhs-s8-6-asks = Testiplaan esitab taseme, nõude, sisendid, viited, vajaliku andmetele juurdepääsu, protseduuri läbimise või kukkumise kriteeriumidega, tulemused ja märkused.

engine-compliance-req-dhs-s8-6-gap = Läbimise või kukkumise kriteeriumid valib hindaja; Kshana salvestab sisendid, läved ja räsid, millega ta käivitati.

engine-compliance-req-imo-1644-3-reference = MSC.1/Circ.1644, punkt 3

engine-compliance-req-imo-1644-3-asks = Tahtlik GNSS-häire on oluline oht navigatsiooni, inimeste, vara ja keskkonna ohutusele.

engine-compliance-req-imo-1644-3-gap = Riski väide; Kshana kvantifitseerib mõjusid esitatud geomeetria korral, mitte riski mere piirkonnas.

engine-compliance-req-imo-1644-5-reference = MSC.1/Circ.1644, punkt 5

engine-compliance-req-imo-1644-5-asks = Liikmesriikidel palutakse piirata häireid oma territooriumilt, kaaluda hoiatusi meremeestele ja kaaluda meetmeid lubamatu edastamise vastu.

engine-compliance-req-imo-1644-5-gap = Adresseeritud riikidele ja haldusasutustele; ükski simulatsiooni väljund seda ei puuduta.

engine-compliance-req-imo-a1046-3-reference = Resolutsioon A.1046(27), lisa punkt 3 (sadamasissepääsud, sadamalähenemised ja rannikuveed)

engine-compliance-req-imo-a1046-3-asks = Süsteemi loetakse kättesaadavaks ainult nii kaua, kuni see tagab esitatud terviklikkuse esitatud täpsusega, uuendatuna esitatud sagedusel, terviklikkushoiatusega esitatud aja jooksul.

engine-compliance-req-imo-a1046-3-gap = Kshana arvutab kaitsetasemeid ja kättesaadavust häirepiiri suhtes modelleeritud geomeetria korral; resolutsiooni täpsuse, kättesaadavuse ja hoiatusaja väärtusi siin ei väideta.

engine-compliance-req-imo-a1046-2-reference = Resolutsioon A.1046(27), lisa punkt 2 (ookeaniveed)

engine-compliance-req-imo-a1046-2-asks = Ookeanifaasi täpsuse, uuendussageduse, kättesaadavuse ja terviklikkushoiatuse nõuded raadionavigatsioonisüsteemile.

engine-compliance-req-imo-a1046-2-gap = Nagu eespool ookeanifaasi kohta.

engine-compliance-req-imo-401-3-1-reference = MSC.401(95), 3.1 kuni 3.2

engine-compliance-req-imo-401-3-1-asks = Vastuvõtja kasutab vähemalt kahe sõltumatu süsteemi tsiviilsignaale ja annab asukoha-, kiiruse- ja ajalahendi vajaliku vastupidavuse ja terviklikkusega.

engine-compliance-req-imo-401-3-1-gap = Mitme konstellatsiooni terviklikkus on modelleeritud; vastuvõtja tegelik kahe süsteemi kasutamine on toote test.

engine-compliance-req-imo-401-3-11-reference = MSC.401(95), 3.11 kuni 3.14

engine-compliance-req-imo-401-3-11-asks = Vastuvõtja hindab täpsust ja terviklikkust navigatsioonifaasi kohta, annab ettevaatusteate, kui ta ei saa, hoiatab, kui uut lahendit õigel ajal ei saabu, ning näitab viimast usutavat väärtust selge olekuga.

engine-compliance-req-imo-401-3-11-gap = Kshana loeb ajastuse ja usaldusväärsuse logist; kas kuvatud ettevaatusteate ja hoiatuse intervallid vastavad standardi nõuetele, vajab vastuvõtja kasutajaliidest, mida logi ei näita.

engine-compliance-req-imo-401-3-16-reference = MSC.401(95), 3.15 kuni 3.16

engine-compliance-req-imo-401-3-16-asks = Näidata täiendussüsteemi olekut ning asukohta, kurssi, kiirust, aega ja kasutatud allikaid.

engine-compliance-req-imo-401-3-16-gap = Kuvanõuded; ükski Kshana väljund neid ei puuduta.

engine-compliance-req-imo-401-4-2-reference = MSC.401(95), 4.2

engine-compliance-req-imo-401-4-2-asks = Töötada rahuldavalt tavapäraste häiretingimuste korral kooskõlas resolutsiooniga A.694(17) (laevaraadioseadmete üldnõuded) ning tüüpilise pardal oleva ja välise raadiokeskkonnaga. See ei ole segamisvastane ega spuufimisvastane nõue.

engine-compliance-req-imo-401-4-2-gap = Tavahäirete testimine on vastuvõtja laboratoorne mõõtmine; resolutsiooni A.694(17) ennast ei loetud.

engine-compliance-req-easa-desc-reference = SIB 2022-02R4, kirjeldus

engine-compliance-req-easa-desc-asks = Spuufimist on raskem tuvastada ja see on ohtlikum kui segamine; kokpitis puudub hoiatus, mis neid kaht eristaks; mõjud ulatuvad valedest maastikuhoiatustest rikutud seireandmeteni ja võivad püsida pärast piirkonnast lahkumist.

engine-compliance-req-easa-desc-gap = Kshana modelleerib detektori ja lingi mõjusid; kokpiti hoiatamine on seadme omadus.

engine-compliance-req-easa-mfr-reference = SIB 2022-02R4, soovitused: õhusõidukite ja seadmete tootjad peaksid

engine-compliance-req-easa-mfr-asks = Hinnata segamise ja spuufimise mõjusid tootele, sealhulgas kumulatiivseid mõjusid, ning anda operaatoritele juhiseid kahtlustatava spuufimise märkamiseks ja tööpiirangute kohta GNSS-i kaotuse korral.

engine-compliance-req-easa-mfr-gap = Toote enda hindamine on tootja ülesanne; Kshana annab selles tõendina korratava stsenaariumi ja hinnatud vastuvõtja logi.

engine-compliance-req-easa-ops-spoof-reference = SIB 2022-02R4, soovitused: õhusõiduki käitajad peaksid (spuufimine)

engine-compliance-req-easa-ops-spoof-asks = Võrrelda GNSS-i asukohta ja aega mitte-GNSS allikatega ning jälgida asukohamääramatuse näitajat ja navigatsioonivahendeid, et spuufimist märgata.

engine-compliance-req-easa-ops-spoof-gap = Operatiivne protseduur ja koolitus jäävad väljapoole simulatsiooni väljundeid.

engine-compliance-req-easa-ansp-reference = SIB 2022-02R4, soovitused: ATM/ANS pakkujad peaksid; ATM/ANS seadmete kavandamise või tootmisega seotud organisatsioonid peaksid

engine-compliance-req-easa-ansp-asks = Hinnata GNSS-i ajastuse kaotuse mõju side-, navigatsiooni- ja seiresüsteemidele, säilitada maapealsed navigatsioonivahendid ning aidata häireid tuvastada.

engine-compliance-req-easa-ansp-gap = Ajastuse holdover-käivitused käsitlevad ajastuse kaotuse hindamist; maapealsete süsteemide kujundus ja protseduurid ei ole kaetud.

engine-compliance-req-easa-report-reference = SIB 2022-02R4, soovitused: aruandlust puudutavad lõpumeeldetuletused

engine-compliance-req-easa-report-asks = Teatada ohutust mõjutavatest sündmustest sündmustest teatamise määruse alusel ning teatada kahtlustatavast spuufimisest ja kõrgema riskiga segamisest tootjale.

engine-compliance-req-easa-report-gap = Aruandluskohustus; ükski väljund seda ei puuduta.

engine-compliance-req-nis2-21-1-reference = Artikkel 21(1)

engine-compliance-req-nis2-21-1-asks = Võtta proportsionaalsed tehnilised, operatiivsed ja organisatsioonilised meetmed võrgu- ja infosüsteemide riskide juhtimiseks, arvestades tehnika taset, kokkupuudet, suurust ning intsidentide tõenäosust ja tõsidust.

engine-compliance-req-nis2-21-1-gap = Kshana käsitleb ainult süsteemi sõltuvust positsioneerimisest ja ajastusest, mitte infoturbe riski üldiselt.

engine-compliance-req-nis2-21-2-a-reference = Artikkel 21(2)(a)

engine-compliance-req-nis2-21-2-a-asks = Riskianalüüsi ja infosüsteemide turvalisuse poliitikad.

engine-compliance-req-nis2-21-2-a-gap = Toetab riskianalüüsi PNT osa; poliitika ise on organisatsiooniline.

engine-compliance-req-nis2-21-2-b-reference = Artikkel 21(2)(b)

engine-compliance-req-nis2-21-2-b-asks = Intsidentide käsitlemine.

engine-compliance-req-nis2-21-2-b-gap = Hinnatud vastuvõtja logi aitab dateerida PNT häirejuhtumi algust ja lõppu; käsitlemise protsess on organisatsiooniline.

engine-compliance-req-nis2-21-2-c-reference = Artikkel 21(2)(c)

engine-compliance-req-nis2-21-2-c-asks = Tegevuspidevus, näiteks varukoopiate haldus, avariitaaste ja kriisijuhtimine.

engine-compliance-req-nis2-21-2-c-gap = Näitab, kui kaua modelleeritud varulahendus hoiab ajastuse või asukoha piiri; pidevuskavad on organisatsioonilised.

engine-compliance-req-nis2-21-2-d-reference = Artikkel 21(2)(d)

engine-compliance-req-nis2-21-2-d-asks = Tarneahela turvalisus, sealhulgas suhted otseste tarnijatega.

engine-compliance-req-nis2-21-2-d-gap = Kshana ei hinda tarnijaid. Neutraalse, reprodutseeritava bench-i kasutamine vastuvõtja vastuvõtukatsetel on üks sisend, mida ostja saab kasutada, mitte tarneahela hindamine.

engine-compliance-req-nis2-21-2-e-reference = Artikkel 21(2)(e)

engine-compliance-req-nis2-21-2-e-asks = Turvalisus süsteemide hankimisel, arendamisel ja hooldamisel, sealhulgas haavatavuste käsitlemine ja avalikustamine.

engine-compliance-req-nis2-21-2-e-gap = Vastuvõtja häirekäitumise korratavad vastuvõtukatsed toetavad tõendeid (supports evidence for) hankeosa jaoks; haavatavuste käsitlemine jääb väljapoole.

engine-compliance-req-nis2-21-2-f-reference = Artikkel 21(2)(f)

engine-compliance-req-nis2-21-2-f-asks = Poliitikad ja protseduurid küberturvalisuse riskijuhtimismeetmete tõhususe hindamiseks.

engine-compliance-req-nis2-21-2-f-gap = Räsitud, korratavad käivitused ja enne hindamist esitatud sündmused toetavad tõendeid (supports evidence for) tõhususe testi jaoks; poliitika ja selle ajakava on organisatsioonilised.

engine-compliance-req-nis2-21-2-ghij-reference = Artikkel 21(2)(g) kuni (j)

engine-compliance-req-nis2-21-2-ghij-asks = Küberhügieen ja koolitus; krüptograafia ja krüpteerimine; personalijulgeolek, juurdepääsukontroll ja varahaldus; mitmefaktoriline autentimine ja turvatud side.

engine-compliance-req-nis2-21-2-ghij-gap = Positsioneerimise ja ajastuse käivituste väljunditega mittekäsitletav.

engine-compliance-req-nis2-21-3-reference = Artikkel 21(3)

engine-compliance-req-nis2-21-3-asks = Tarneahela meetmeid valides arvestada iga tarnija haavatavusi ning selle toodete kvaliteeti ja turvalist arendust.

engine-compliance-req-nis2-21-3-gap = Vt artikkel 21(2)(d).

engine-compliance-req-en16803-1-reference = EN 16803-1 (definitsioonid ja süsteemitehnika protseduurid)

engine-compliance-req-en16803-1-asks = Määratleb maanteede ITS arhitektuuri, toimivusnäitajad ja mõõdikud ning meetodi testikeskkondade võrdlemiseks. Ei sea nõudeid.

engine-compliance-req-en16803-1-gap = Punktide numbrid ei ole avalikult nähtavad. Litsentsiomanik peaks vastendama Kshana väljundiväljad mõõdikute definitsioonidega.

engine-compliance-req-en16803-2-reference = EN 16803-2 (GNSS-põhiste terminalide põhitoimivus)

engine-compliance-req-en16803-2-asks = Taasesitusel põhinevad laborikatsete protseduurid asukohaväljundi kättesaadavuse, pidevuse, täpsuse, terviklikkuse ja esimese fiksi aja kohta. Ei sea miinimumväärtusi.

engine-compliance-req-en16803-2-gap = Kshana eksporditud liikumine võib juhtida taasesitust; standardi protseduuri, selle salvestatud signaalide käsitlust ja mõõdikute arvutust siin ei reprodutseerita ning need vajavad litsentsitud teksti.

engine-compliance-req-en16803-3-6-reference = EN 16803-3, punkt 6

engine-compliance-req-en16803-3-6-asks = Eristab turvatestides salvestatud signaale simuleeritud signaalidest.

engine-compliance-req-en16803-3-6-gap = Kshana ei salvesta ega simuleeri signaali. See ekspordib liikumise ja sündmused ning hindab vastuvõtja logi.

engine-compliance-req-en16803-3-a-reference = EN 16803-3, lisa A

engine-compliance-req-en16803-3-a-asks = GNSS-i vastaste rünnakute kõrgetasemeline liigitus: häire, segamine, meaconing ja spuufimine.

engine-compliance-req-en16803-3-a-gap = Kshana stsenaariumid nimetavad rünnakuklasse samades üldterminites; punktitasemel vastavustabel vajab litsentsitud lisa.

engine-compliance-req-nist-id-ra-1-reference = ID.RA-1 (riskihindamine)

engine-compliance-req-nist-id-ra-1-asks = Tuvastada, dokumenteerida ja esitada PNT-süsteemi ning PNT-andmeid levitavate osade haavatavused; kus see on ohutu, testida vastuvõtlikkust häirimisele või manipuleerimisele, milleks võib kasutada PNT-signaali simulatsiooni, seaduse ja tegevuspidevuse piirides.

engine-compliance-req-nist-id-ra-1-gap = Kshana iseloomustab vastuvõtlikkust modelleeritud stsenaariumides ja vastuvõtja salvestatud logis. Päris süsteemi haavatavuste inventuur on operaatori ülesanne ning iga RF-katse tehakse operaatori enda seadmete ja loaga: Kshana ei edasta midagi.

engine-compliance-req-nist-id-ra-3-reference = ID.RA-3 (riskihindamine)

engine-compliance-req-nist-id-ra-3-asks = Tuvastada ja dokumenteerida PNT sisemised ja välised ohud, alates looduslikust ja tahtmatust häirest kuni tahtliku rünnakuni, nagu segamine (jamming), spuufimine ja viiterünnakud.

engine-compliance-req-nist-id-ra-3-gap = Stsenaariumid esitavad ohte ja nende mõjusid. Kasutaja enda asukoha ja süsteemi dokumenteeritud ohuhinnang on kasutaja kirjutada; ükski stsenaarium ei ole tõend, et seal selline oht eksisteerib.

engine-compliance-req-nist-id-ra-4-reference = ID.RA-4 (riskihindamine)

engine-compliance-req-nist-id-ra-4-asks = Tuvastada võimalikud mõjud ja tõenäosused; iga ohu kohta esitada mõju ulatus, vea väljendumisviis (hüpe või rambi), tuvastuslävid ja vea mõju järgnevatele süsteemidele.

engine-compliance-req-nist-id-ra-4-gap = Käivitused annavad mõjunäitajad (vea kasv, kaitsetasemed, lingi mõjud) modelleeritud andurite ja esitatud ohu jaoks. Tõenäosusi ei looda ning modelleeritud mõju ei ole mõõdetud mõju.

engine-compliance-req-nist-id-ra-5-reference = ID.RA-5 (riskihindamine)

engine-compliance-req-nist-id-ra-5-asks = Kasutada ohte, haavatavusi, tõenäosusi ja mõjusid riski hindamiseks ning hinnata risk uuesti perioodiliselt ja siis, kui süsteem või oht muutub.

engine-compliance-req-nist-id-ra-5-gap = Hindamisel kasutatakse sünteetilist ohtude ansamblit, mis on nii märgitud. Räsitud, korratavad käivitused muudavad korduvhindamise võrreldavaks; riskiotsus ja selle ajakava on organisatsioonilised.

engine-compliance-req-nist-pr-ds-6-reference = PR.DS-6 (andmeturve)

engine-compliance-req-nist-pr-ds-6-asks = Kontrollida PNT-andmete terviklikkust, kui allikad on vastuolus, näiteks kontrollides risti mitut sagedust, konstellatsiooni või sõltumatut allikat.

engine-compliance-req-nist-pr-ds-6-gap = Kshana arvutab kaitsetasemed ja allikatevahelised tulemused modelleeritud geomeetria ja andurite jaoks; toote sisemisi terviklikkuskontrolle ei jälgita.

engine-compliance-req-nist-pr-ip-10-reference = PR.IP-10 (teabe kaitse protsessid ja menetlused)

engine-compliance-req-nist-pr-ip-10-asks = Testida reageerimis- ja taastamisplaane; varuajaallikaga süsteemi puhul eemaldada põhiallikas ja kinnitada, et ajatäpsus, hüpped ja rambid jäävad esitatud kellanõuete piiresse.

engine-compliance-req-nist-pr-ip-10-gap = Holdover-käivitus modelleerib eemaldamist ja kontrollib viga esitatud läve suhtes; hinnatud vastuvõtjalogi näitab tegelikku kadu ja taastumist. Test operaatori enda ajaserveril ja selleks kasutatav RF on operaatori ülesanne.

engine-compliance-req-nist-pr-pt-5-reference = PR.PT-5 (kaitsetehnoloogia)

engine-compliance-req-nist-pr-pt-5-asks = Kasutada vastupidavusmehhanisme tavalistes ja ebasoodsates tingimustes: tagasi lükata halvad signaalid ja andmed ning siduda holdover anomaaliate tuvastamise, liigsete või liidetud allikate ja taastamisega.

engine-compliance-req-nist-pr-pt-5-gap = Näidatakse modelleeritud mehhanisme ja nende piire; kas toode neid rakendab, selgub tootetestist.

engine-compliance-req-nist-de-ae-2-reference = DE.AE-2 (anomaaliad ja sündmused)

engine-compliance-req-nist-de-ae-2-asks = Analüüsida tuvastatud PNT-sündmusi reaalajas ja pärast (allikas, veastatistika, kestus, sagedus, asukoht), eristada kahjulikke sündmusi tavatööst ning säilitada toorandmed ja analüüs.

engine-compliance-req-nist-de-ae-2-gap = Kshana hindab salvestatud logi tagantjärele ja säilitab oma käivitatu räsid. See ei leia ega omista häireallikat ning ei jälgi reaalajas teenusena.

engine-compliance-req-nist-de-ae-3-reference = DE.AE-3 (anomaaliad ja sündmused)

engine-compliance-req-nist-de-ae-3-asks = Koguda ja korreleerida sündmuseandmeid mitmest allikast ja andurist ning kontrollida PNT-andmeid risti rohkem kui ühest allikast, et tuvastada anomaalset käitumist.

engine-compliance-req-nist-de-ae-3-gap = Kshana monitorid kontrollivad risti ühe vastuvõtjalogi või ühe stsenaariumi vooge; korrelatsioon operaatori enda andurite ja logide vahel on nende ülesanne.

engine-compliance-req-nist-de-ae-4-reference = DE.AE-4 (anomaaliad ja sündmused)

engine-compliance-req-nist-de-ae-4-asks = Määrata sündmuste mõju PNT-andmetele ja neist sõltuvatele rakendustele, sealhulgas harvaesinevate sündmuste puhul.

engine-compliance-req-nist-de-ae-4-gap = Mõju näidatakse käivituse või logi PNT-väljundil. Mõju konkreetsele järgnevale rakendusele nõuab selle rakenduse enda nõudeid.

engine-compliance-req-nist-de-ae-5-reference = DE.AE-5 (anomaaliad ja sündmused)

engine-compliance-req-nist-de-ae-5-asks = Määrata ja dokumenteerida intsidendi häirelävi rakenduse vajaliku vea- ja määramatuse tolerantsi põhjal koos teavitamisajaga.

engine-compliance-req-nist-de-ae-5-gap = Käivitusi hinnatakse kasutaja esitatud läviväärtuste suhtes ja need salvestatakse. Läviväärtuste ja häiremenetluse valik on kasutaja ülesanne.

engine-compliance-req-nist-de-cm-1-reference = DE.CM-1 (pidev turvaseire)

engine-compliance-req-nist-de-cm-1-asks = Jälgida PNT-allikaid ja -väljundeid lähtetasemete suhtes anomaaliate tuvastamiseks, kasutades mitmekesiseid allikaid ning rikete tuvastamist ja välistamist, ning kontrollida, et seire katab tuvastatud rikkerežiimid.

engine-compliance-req-nist-de-cm-1-gap = Kshana käivitab ja hindab selliseid monitore logidel ja stsenaariumidel. Reaalse süsteemi pidevat seiret ja toote kõigi rikkerežiimide katvust käivituste kogum ei näita.

engine-compliance-req-nist-de-dp-3-reference = DE.DP-3 (tuvastusprotsessid)

engine-compliance-req-nist-de-dp-3-asks = Testida, et sündmuste tuvastamine töötab ettenähtud viisil, perioodiliselt ja pärast uuendusi, kehtivate ohuprofiilide suhtes.

engine-compliance-req-nist-de-dp-3-gap = Korratavad, räsitud stsenaariumid ja enne hindamist esitatud sündmused toetavad tõendeid (supports evidence for) sellise testi jaoks; selle ajakavajärgne käivitamine operaatori seadmetel on nende ülesanne.

engine-compliance-req-nist-rs-an-5-reference = RS.AN-5 (analüüs)

engine-compliance-req-nist-rs-an-5-asks = Seada sisse kontrollimine ja valideerimine teadaolevate rikkerežiimide ja uute haavatavuste jaoks ning salvestada intsidentide nominaalsed ja anomaalsed PNT-andmed hilisema tuvastamise parandamiseks.

engine-compliance-req-nist-rs-an-5-gap = Hinnatud logi iseloomustab ühte intsidenti tagantjärele. Avalikustatud haavatavuste vastuvõtmine ja nende põhjal tegutsemine on protsess, mis jääb väljapoole iga käivitust.

engine-compliance-req-nist-rs-mi-2-reference = RS.MI-2 (leevendamine)

engine-compliance-req-nist-rs-mi-2-asks = Kui intsident on piiratud, leevendada seda alternatiivsete või täiendavate PNT-allikatega, et töö jätkuks, ning viia süsteem tagasi nõuetekohasesse töökorda.

engine-compliance-req-nist-rs-mi-2-gap = Käivitused näitavad, kui kaua modelleeritud varuallikad hoiavad vea piiratuna; piiramine ja teenusesse naasmine on operatiivsammud.

engine-compliance-mapping-header-reference = Viide

engine-compliance-mapping-header-asks = Mida see nõuab (parafraseeritult)

engine-compliance-mapping-header-capabilities = Kshana väljundid, mis toetavad selle jaoks tõendeid (supports evidence for)

engine-compliance-mapping-header-gap = Lünk

engine-compliance-mapping-none = puudub

engine-compliance-source-line = **{ $title }**: { $version }. <{ $url }>. Loetud { $accessed }: { $checked }.

engine-kind-lunar-ascent-description = MODELLED mootoriga tõus Kuu lõunapooluse pinnakohast kohtumisorbiidile ning positsiooni-kiiruse kovariatsioon, mille see orbiidile kaasa viib (Artemis-klass). Lunar-descent'i viieoleku telgede kaupa inertsiaalse vea mudel (positsioon, kiirus, kiirendusmõõturi nihe, orientatsiooni kalle, güroskoobi nihe, mida juhib erijõud) töötab kõigil kolmel kohatelje suunal pinnaolekust, millega faas algab; AFS-positsioonifiksatsioon ILLUSTRATIVE LCNS-klassi konstellatsiooni nähtavatelt releedelt (eraldiseisev või diferentsiaalne, kasutades lunar-differential-pnt'i parandusliini jääki, kusjuures kella toetatakse, kui nähtavaid releesid on ainult kolm) võetakse määratud intervalliga; Kuu aeg siseneb sõiduki kella ja piki rada kulgeva ajatempli vea kaudu. Väljastab suletud kujul inertsiaalsed allikad, abivahendi panuse, ablatsiooni, navigatsiooni 1-sigmad tõusu jooksul, mootori väljalülitamise hajuvuse navigatsioonilise teadmise kõrval ja täieliku 6x6 MCI kovariatsiooni orbiidile sisenemisel, positsiooni-kiiruse korrelatsioon säilitatuna. MODELLED: illustratiivne IMU klass, erijõud, releekomplekt ja väljalülitamise hajuvus; vead on hoitud stardikoha telgedes; nominaalne väljumisolek on asendusväärtus. Ei ole ühegi ametkonna heaks kiidetud; nõuandev tarkvara, mitte sertifitseeritud navigatsiooniseade.

engine-kind-lunar-surface-description = MODELLED pinnapositsioneerimise ja ajastuse kättesaadavus koha ja aastaaja kaupa Artemis-klassi lõunapooluse kohtades. Iga koha ja aastaaja kohta (epohh ja selle järel olev aken) esitab see releepositsioneerimise (ILLUSTRATIVE LCNS-klassi konstellatsiooni neli või rohkem releed nähtaval ja PDOP alla läve, samadest funktsioonidest nagu moonlight-service-volume ning maastikuosa korral lunar-station-coverage'i maastiku kiirtega läbi käidud horisondijoon), kas Maa ja Päike on koha horisondi kohal (analüütiline Päike, Kuu ja Kuu orientatsioon, libratsioon kaasa arvatud, mis aastaajaga muutub), ning ajastuse kättesaadavuse (rele või Maa nähtaval) koos pikima lõiguga, kus ei ole kumbagi, st holdover'iga, mille pinnakell peab üle elama. Ühe koha tulemus võrdub moonlight-service-volume'i omaga bitini. MODELLED: illustratiivne Kepleri releekomplekt keskmise pöörlemisega Kuul; releenäitaja aastaajaga ei muutu; maastik on 1200 m LOLA väljalõige. Ei ole ühegi ametkonna heaks kiidetud; nõuandev tarkvara, mitte sertifitseeritud navigatsiooniseade.

engine-kind-lunar-descent-description = MODELLED maandumishajuvuse eelarve mootoriga laskumiseks lõunapooluse kohta (Artemis-klass). Horisontaaltelje kohta juhib laskumise erijõud viieoleku inertsiaalse vea mudelit (positsioon, kiirus, kiirendusmõõturi nihe, orientatsiooni kalle, güroskoobi nihe); järjestikfilter võtab positsioonifiksatsioone lubatud abivahenditelt: AFS-fiksatsioon ILLUSTRATIVE LCNS-klassi konstellatsiooni nähtavatelt releedelt (eraldiseisev või diferentsiaalne, kasutades lunar-differential-pnt'i parandusliini jääki, kusjuures kella toetatakse, kui nähtavaid releesid on ainult kolm) ja maastikusuhteline fiksatsioon (crate'i TERCOM/SITAN sobitaja sünteetilisel reljeefil või päris LOLA lõunapooluse DEM-i kõrgusakna sobitamise Cramer-Rao piir). Kuu aeg siseneb sõiduki kella kaudu fiksatsioonide hetkel (lunar-time-offset'i LTC-TT nihe või selle avaldatud riba määramatus) ja piki rada kulgeva ajatempli veana. Väljastab 3-sigma maandumisellipsi, R95, suletud kujul inertsiaalsed allikad, iga abivahendi panuse, kõigi abivahendite kombinatsioonide ablatsiooni, ellipsi Monte Carlo kalibreerimise ja edasi antud kovariatsiooni. MODELLED: illustratiivne IMU klass, releekomplekt, laskumisprofiil ja juhtimisliige; maastikunavigatsioon kasutab sünteetilist reljeefi Maa meetriskaalal; AFS-i kättesaadavus on üks epohh tasasel maskil. Ei ole ühegi ametkonna heaks kiidetud; nõuandev tarkvara, mitte sertifitseeritud navigatsiooniseade.

engine-kind-lunar-orbit-rendezvous-description = MODELLED suhteline navigatsioon Orioni-laadse maanduri dokkimiseks madalal Kuu orbiidil või elliptilisel polaarorbiidil (Artemis-klass). Jälitaja ja sihtmärk lendavad samal orbiidil crate'i Kuu jõumudeli all; ühine 21-parameetriline pakett-Gauss-Newtoni hinnang kaare ulatuses (kaks sõiduki olekut ja püsivad signaali ruumis levimise nihked) liidab iga sõiduki absoluutse positsioonifiksatsiooni ILLUSTRATIVE LCNS-klassi releekomplektilt (Kuu taha jäävad releed jäetakse välja, vaja on nelja, sõidukite vaheline ühisrežiimi signaali ruumis levimise viga kaob) ja ristlingi kaugusmõõtmise, kusjuures kaugusmõõtmise täpsus tuleb LunaNet AFS-piloodi koodijälgimise piirist. Väljastab formaalse ja Monte Carlo suhtelise positsiooni- ja kiiruseveaga sihtmärgi LVLH telgedes, fiksatsiooni kättesaadavuse, keskmise normeeritud hinnangu vea ruudu oodatud väärtuse kõrval ja iga katse, mille iteratsioon ei koondunud, raskusjõuharmoonikute eiramisest tuleneva triivi ja täieliku edasi antud 6x6 kovariatsiooni. Ringjuhu jaoks kehtib suletud kujul Hilli/Clohessy-Wiltshire'i kontroll. MODELLED: illustratiivne releekomplekt, veaeelarve ja eelteadmised; tõeline olek ja hindaja jagavad üht jõumudelit, seega NEES kontrollib sisemist kooskõla, mitte mudeli viga. Ei ole ühegi ametkonna heaks kiidetud; nõuandev tarkvara, mitte sertifitseeritud navigatsiooniseade.

engine-kind-mission-thread-description = MODELLED navigatsiooni ja ajastuse veaeelarve määratud missioonifaaside ahelale starditest sisenemiseni: start ja tõus, madala Maa orbiidi kohtumine ja dokkimine (korratav), Kuule suunav siire ja tsislunaarne lend, Kuu orbiidi kohtumine, laskumine, viibimine pinnal, tõus ning tagasitulek ja sisenemine, iga faas üks kaheksast registreeritud liigist oma andurite ja filtriga. 6x6 kovariatsioon, kell ja tugisüsteem antakse faasilt faasile edasi määratud reegli järgi (kanna edasi, paisuta või omanda uuesti); tugisüsteemi ja ajaskaala teisendused (GCRF, MCI, MCMF, UTC, TT, TDB, LTC) on oma eelarveread, Kuu olek valikulisest DE440 kerneli väljalõikest ja analüütiline rida määratud varuvariandina. Valikuline maajaamade võrgu kate määrab iga faasi jälgimistöötsükli. Väljastab faasipõhise eelarve (sisenemise, tipu ja väljumise 1-sigmad, iga panus koos ühikuga), varu määratud nõude suhtes, nõrgima lüli, sündmused ja ajajoone joonise. MODELLED: iga arv on määratud sisend; ahel järgib ühte komplekti ja ühtegi sõidukit ei modelleerita. Ainult avalikud allikad; ei ole seotud ühegi ametkonnaga ega nende heaks kiidetud; nõuandev tarkvara, mitte sertifitseeritud navigatsiooniseade.

engine-e-altpnt-terrain-combined-altpnt-magnetic-grid-replaces = combined-altpnt: `magnetic_grid` asendab sünteetilise magnetvälja, seega peab `magnetic_mascons` olema tühi, kui see on antud

engine-e-aperture-duty-the-reporting-horizon-must-have = aruandlushorisondil peab olema positiivne pikkus (horizon_end_s > horizon_start_s)

engine-e-api-figure-tiers-the-result-document = figure_tiers: tulemusdokument ei ole kujundatud JSON-objekt

engine-e-api-builtins-integrity-reports-one-run-raim = { "[" }integrity] esitab ühe käivituse RAIM-i selle holdover-näitajate kõrval; see vajab väärtust runs = 1

engine-e-araim-reference-the-unmonitored-fault-risk-exhausts = jälgimata rikke risk ammendab kogu terviklikkuse eelarve; lõplikku kaitsetaset ei ole

engine-e-araim-reference-the-add-v4-subset-rule = ADD v4.2 alamhulgareegel loetleb alati paarid; max_order peab olema >= 2

engine-e-attack-surface-capture-footprint-emitted-no-points = capture_footprint ei väljastanud ühtegi punkti

engine-e-bench-cli-scale-is-not-number = --scale ei ole arv

engine-e-bench-cli-truth-reads-dataset-and-is = `truth` loeb andmekogu ja on mõeldud ülesandele a; ülesanded c ja d kasutavad käsku `cases`

engine-e-bench-cli-task-has-no-sealed-holdout = ülesandel c ei ole suletud holdout'i

engine-e-bench-cli-cases-makes-the-files-of = `cases` teeb ülesannete c ja d failid; ülesanne a on ise andmekogu (kasuta `truth`)

engine-e-bench-cli-threshold-is-not-number = --threshold ei ole arv

engine-e-bench-cli-seed-file-is-required = --seed-file on nõutav

engine-e-bench-cli-validate-needs-at-least-one = validate vajab vähemalt ühte tulemusfaili

engine-e-bench-cli-manifest-is-for-task-the = `manifest` on mõeldud ülesandele a; teistel ülesannetel on kinnitatud manifestid

engine-e-bench-cli-verify-manifest-needs-one-manifest = verify-manifest vajab ühte manifestifaili

engine-e-bench-system-name-is-required = `system.name` on nõutav

engine-e-bench-tasks-truth-has-no-labels-array = truth'il puudub `labels` massiiv

engine-e-bench-tasks-label-has-no-id = sildil puudub `id`

engine-e-bench-tasks-label-has-no-positive = sildil puudub `positive`

engine-e-bench-tasks-predictions-have-no-scores-object = ennustustel puudub `scores` objekt

engine-e-bench-tasks-the-holdout-is-sealed-pass = holdout on suletud: anna saladus edasi võtmega --seed-file

engine-e-bench-tasks-task-truth-has-no-truth = ülesande (c) truth'il puudub `truth` massiiv

engine-e-bench-tasks-task-predictions-have-no-predictions = ülesande (c) ennustustel puudub `predictions` objekt

engine-e-bench-tasks-truth-entry-has-no-id = truth'i kirjel puudub `id`

engine-e-campaign-compare-needs-threshold = compare vajab läve

engine-e-ccsds-tdm-tdm-missing-ccsds-tdm-vers = TDM: puudub CCSDS_TDM_VERS päis

engine-e-cislunar-arc-recovery-the-chief-sits-on-the = chief asub Kuul: polaarkoordinaadid on singulaarsed

engine-e-clock-log-clock-applies-to-the-rinex = clock kehtib ainult vormingutele rinex-clk, linuxptp ja chrony (TICC kasutab väärtust channel)

engine-e-clock-log-single-column-timelab-log-needs = ühe veeruga timelab-logi vajab väärtust tau0: päis `# tau0 = <s>` või tau0_s

engine-e-clock-log-the-ticc-log-has-no = TICC-logis ei ole ühtegi näitu (`<seconds> chA|chB|chC|TI(...)` read)

engine-e-conflict-resilience-intensity-grid-unexpectedly-empty = intensiivsusruudustik on ootamatult tühi

engine-e-eo-payload-inclination-deg-must-be-in = inclination_deg peab olema vahemikus (0, 180) (ekvatoriaalsel orbiidil ei ole tõusvat sõlme)

engine-e-evidence-bundle-its-imprint-is-not-the = selle jäljend ei ole selle paketi manifest.json'i räsi (märgi saab hankida alles pärast paketi olemasolu: kasuta `kshana evidence attach-timestamp`)

engine-e-evidence-cli-pubkey-must-be-32-bytes = --pubkey peab olema 32 baiti (64 kuueteistkümnendnumbrit)

engine-e-evidence-cli-that-is-the-private-key = see on allkirjastaja PRIVAATVÕTI. Ära jaga seda kunagi; anna edasi avalik võti (.pub fail)

engine-e-evidence-lab-lab-attestation-conducted-setup-needs = lab-attestation: juhtmega seadistus vajab väärtust attenuation_db, lõplikku arvu dB-des, 0 või rohkem

engine-e-evidence-tsa-unsupported-digest-algorithm = toetamata räsialgoritm

engine-e-evidence-tsa-signature-failure = allkirja rike

engine-e-field-schema-entry-is-not-an-object = kirje ei ole objekt

engine-e-field-schema-no-unit-string = puudub `unit` string

engine-e-field-schema-no-provenance-string = puudub `provenance` string

engine-e-geometry-sky-tle-holds-no-complete = sky: tle ei sisalda ühtegi täielikku kaherealist orbiidielementide komplekti

engine-e-geometry-sky-epoch-dates-the-tle = sky: epoch dateerib `tle` satelliidid; eelseadistatud `systems` ja otse antud satelliidid ei kanna kuupäeva, seega anna selle kõrval `tle`

engine-e-gravimeter-gravity-map-reference-replaces-the = gravity-map: `reference` asendab sünteetilise välja, seega peavad `coeffs` ja `mascons` olema tühjad, kui see on antud

engine-e-gse-sim-fusion-od-produced-no-steps = liitmis-OD ei andnud ühtegi sammu (liiga vähe vaatlusi)

engine-e-holdover-test-give-one-of-series-samples = anna üks väärtustest series.samples, series.csv_path või series.clock_log

engine-e-holdover-test-give-one-of-series-samples-2 = anna üks väärtustest series.samples, series.csv_path või series.clock_log, mitte rohkem kui üks

engine-e-holdover-test-gnss-removed-must-be-finite = gnss_removed_s peab olema lõplik, locked_duration_days >= 0, recovery_band_ns > 0 ja recovery_dwell_s >= 0

engine-e-holdover-test-csv-path-is-not-available = csv_path ei ole WebAssembly ehituses saadaval; anna jada otse väärtusena `samples` või `clock_log.text`

engine-e-hybrid-coupled-geometry-needs-at-least = coupled.geometry vajab vähemalt kahte erinevat lõplikku nähtavusjoone tegurit

engine-e-hybrid-integrity-optical-link-delivered-no-photons = optiline link ei andnud ühtegi footonit (lõpmatu kaugusmõõtmise CRLB); suurenda võimsust / apertuuri / integreerimisaega

engine-e-hybrid-integrity-rf-tracking-threshold-dbhz-and = rf_tracking_threshold_dbhz ja rf_degraded_margin_db peavad olema lõplikud

engine-e-interference-map-adsb-need-at-least-one-of = vaja on vähemalt ühte veergudest `nic`, `nacp`

engine-e-interference-map-adsb-gzip-decompressed-size-over-the = gzip: lahtipakitud suurus ületab piiri

engine-e-interference-map-adsb-trace-json-lacks-icao-timestamp = trace JSON-ist puudub icao, timestamp või trace

engine-e-interference-map-api-custom-dataset-needs-licence-licence = oma andmekogu vajab litsentsi, litsentsi URL-i ja viidatava teksti

engine-e-interference-map-api-cell-size-must-be-between = lahtri suurus peab olema vahemikus { $lit_0_01 } kuni 10 kraadi

engine-e-interference-map-api-map-has-bad-date = kaardil on vigane kuupäev

engine-e-interference-map-api-no-map-falls-in-the = ühtegi kaarti ei jää kuupäevavahemikku

engine-e-interference-map-cli-dataset-is-required-so-the = --dataset on nõutav, et litsents ja viide manustataks

engine-e-interference-map-cli-cell-deg-is-not-number = --cell-deg ei ole arv

engine-e-interference-map-cli-cell-deg-must-be-between = --cell-deg peab olema vahemikus { $lit_0_01 } kuni 10

engine-e-interference-map-cli-subcommand-is-required = alamkäsk on nõutav

engine-e-interference-map-cli-input-file-missing = sisendfail puudub

engine-e-interference-map-cli-out-is-required = --out on nõutav

engine-e-interference-map-cli-fetch-land-downloads-file-pass = fetch-land laadib faili alla: kinnita võtmega --allow-network

engine-e-interference-map-cli-curl-failed-to-download-the = curl ei suutnud maapolügoone alla laadida

engine-e-interference-map-cli-route-is-required = --route on nõutav

engine-e-interference-map-cli-at-least-one-map-is = vähemalt üks --map on nõutav

engine-e-interference-map-land-land-polygons-no-polygon-or = maapolügoonid: ühtegi Polygon'i ega MultiPolygon'i ei leitud

engine-e-interference-map-empty-input-header-row-is = tühi sisend: päisrida on nõutav

engine-e-interference-map-observatory-bbox-is-south-west-north = --bbox on south,west,north,east kraadides

engine-e-interference-map-observatory-bbox-must-satisfy-south-north = --bbox peab rahuldama tingimusi south < north ja west < east, gloobuse piires (ilma antimeridiaani ületamiseta)

engine-e-interference-map-observatory-opensky-network-data-is-excluded = OpenSky Networki andmed on välja jäetud: selle litsents ei luba tuletatud kaartide kommertskasutust ega levitamist (docs/data/INTERFERENCE-DATA-SOURCES.md)

engine-e-interference-map-observatory-day-is-required = --day on nõutav

engine-e-interference-map-observatory-delay-hours-is-not-number = --delay-hours ei ole arv

engine-e-interference-map-observatory-cell-deg-must-be-between = --cell-deg peab olema vahemikus { $lit_0_5 } kuni 10

engine-e-interference-map-observatory-the-input-has-no-usable-2 = sisendis ei ole ühtegi kasutatavat aruannet

engine-e-interference-map-route-not-kshana-interference-map-no = ei ole Kshana häirekaart (puudub `kshana_interference_map` liige)

engine-e-interference-map-route-map-has-no-date = kaardil puudub kuupäev

engine-e-interference-map-route-map-has-no-grid-cell = kaardil puudub ruudustiku lahtri suurus

engine-e-interference-map-route-map-has-an-invalid-grid = kaardil on kehtetu ruudustiku lahtri suurus

engine-e-interference-map-route-route-no-linestring-found = marsruut: ühtegi LineString'i ei leitud

engine-e-interference-map-route-route-needs-at-least-two = marsruut vajab vähemalt kahte teekonnapunkti

engine-e-interference-map-route-route-waypoint-out-of-range = marsruut: teekonnapunkt väljaspool vahemikku

engine-e-interop-sigmf-records-signal-not-geometry = SigMF salvestab signaali, mitte geomeetriat; see kirjutatakse stsenaariumist, mitte stseenist

engine-e-interop-sigmf-holds-complex-baseband-samples = SigMF sisaldab kompleksseid baasriba loendeid, mida sünteesib ainult `spectrum` liik

engine-e-interop-this-spectrum-scenario-has-no = sellel spectrum-stsenaariumil ei ole [iq] plokki, seega salvestamiseks loendeid ei sünteesita

engine-e-interop-scene-time-step-must-be-positive = ekspordi ajasamm peab olema positiivne ja lõplik

engine-e-interop-scene-duration-must-be-non-negative = ekspordi kestus peab olema mittenegatiivne ja lõplik

engine-e-interop-scene-this-pvt-scenario-gives-no = see pvt-stsenaarium ei anna väärtust `truth_ecef`, mis on ainus positsioon, mida see esitab

engine-e-interop-stk-an-stk-ephemeris-describes-vehicle = STK efemeriid kirjeldab sõiduki positsiooni ja kiirust ajas; sellel stseenil on ainult fikseeritud punktid või ajata rajad (fikseeritud punkt on STK Facility, mitte efemeriid)

engine-e-interop-stk-scene-has-no-epoch = stseenil puudub epohh

engine-e-iq-acq-surface-surface-header-names-too-many = pinna päis nimetab liiga palju lahtreid

engine-e-iq-cli-acquire-needs-signal-name = vajab võtit --signal <name>

engine-e-iq-cli-acquire-needs-prn-list = vajab võtit --prn <list>

engine-e-iq-cli-acquire-surface-exports-one-search-surface = --surface ekspordib ühe otsingupinna: anna täpselt üks --prn

engine-e-iq-cli-channel-nlos-needs-reflected-path-add = --nlos vajab peegeldunud teed: lisa --multipath-height või --land-mobile

engine-e-iq-cli-frontend-bandpass-wants-two-values-lo = --bandpass tahab kahte väärtust: lo,hi

engine-e-iq-cli-frontend-iq-frontend-needs-at-least = iq frontend vajab vähemalt ühte astet (--bandpass/--notch/--blank/--excise/--agc/--bits)

engine-e-iq-cli-no-iq-processing-command-given = ühtegi iq töötlemiskäsku ei antud

engine-e-iq-cli-missing-recording-path = salvestuse tee puudub

engine-e-iq-cli-monitor-idle-timeout-only-goes-with = --idle-timeout sobib ainult koos võtmega --follow

engine-e-iq-cli-monitor-follow-reads-sigmf-recording-give = --follow loeb SigMF-salvestust (anna .sigmf-meta, .sigmf-data või baastee)

engine-e-iq-cli-monitor-idle-timeout-must-be-positive = --idle-timeout peab olema positiivne sekundite arv

engine-e-iq-cli-scene-rx-pos-wants-three-values = --rx-pos tahab kolme väärtust: lat,lon,alt (deg,deg,m)

engine-e-iq-cli-scene-iq-scene-needs-rate-hz = iq scene vajab võtit --rate <hz>

engine-e-iq-cli-scene-iq-scene-needs-duration-or = iq scene vajab võtit --duration <s> (või --window)

engine-e-iq-cli-scene-iq-scene-nav-needs-rx = iq scene --nav vajab võtit --rx-pos lat,lon,alt

engine-e-iq-cli-scene-iq-scene-needs-signal-name = iq scene vajab võtit --signal <name>

engine-e-iq-cli-scene-iq-scene-needs-prn-list = iq scene vajab võtit --prn <list>

engine-e-iq-cli-scene-format-takes-sigmf-or-sdrx = --format võtab väärtuse sigmf või sdrx, mitte mõlemat

engine-e-iq-cli-scene-format-sdrx-writes-ci8-the = --format sdrx kirjutab ci8 (vaikimisi) või ci16_le (sdrx:ci16_le); ION metaandmete standardis ei ole ujukomakodeeringut

engine-e-iq-cli-track-design-name-needs-design-file = --design-name vajab võtit --design <file.toml>

engine-e-iq-cli-track-threads-must-be-positive-integer = --threads peab olema positiivne täisarv või auto

engine-e-iq-cli-track-epochs-format-needs-epochs-path = --epochs-format vajab võtit --epochs <path>

engine-e-iq-io-cli-iq-convert-needs-to-format = iq convert vajab võtit --to <format>

engine-e-iq-io-cli-iq-extract-needs-start = iq extract vajab võtit --start

engine-e-iq-io-cli-iq-extract-needs-duration = iq extract vajab võtit --duration

engine-e-iq-io-cli-start-and-duration-must-be = --start ja --duration peavad olema mittenegatiivsed

engine-e-iq-io-cli-real-input-is-converted-to = reaalne sisend teisendatakse kompleksseks baasribaks: anna --factor <d> (>= 2)

engine-e-iq-io-cli-iq-decimate-needs-factor-or = iq decimate vajab võtit --factor <d> või --up <l> ja --down <m>

engine-e-iq-io-resample-resampling-factors-must-be-positive = ümberdiskreetimise tegurid peavad olema positiivsed

engine-e-iq-io-resample-resampling-factors-must-be-positive-2 = ümberdiskreetimise tegurid peavad olema positiivsed ja filter mittetühi

engine-e-iq-io-resample-real-if-conversion-needs-decimation = reaalse IF-i teisendus vajab vähemalt 2-kordset detsimeerimist, et peegelsagedus eemaldada

engine-e-iq-io-sdrx-sdrx-layout-chunk-holds-no = { "." }sdrx paigutus: tükk ei sisalda ühtegi tervet lumpi

engine-e-iq-io-sdrx-sdrx-data-ends-inside-its = { "." }sdrx andmed lõpevad päises

engine-e-iq-io-sigmf-stream-sigmf-core-num-channels = SigMF core:num_channels = 0

engine-e-iq-io-sigmf-stream-sigmf-stream-needs-at-least = SigMF-voog vajab vähemalt ühte salvestust

engine-e-iq-io-sigmf-stream-select-channel-must-be-called = select_channel tuleb kutsuda enne lugemist

engine-e-iq-io-sigmf-stream-sigmf-data-ends-before-its = SigMF andmed lõpevad enne esimest jäädvustust

engine-e-iq-labfit-iqfit-mode-validation-needs-validation-table = mode = "validation" vajab [validation] tabelit, mis on kirjutatud enne kampaania tulemuste lugemist

engine-e-iq-labfit-input-campaign-fit-from-an = { "[" }input] campaign: IQ kampaaniakausta sobitus vajab natiivset ehitust (kampaaniakiht ei ole WebAssembly jaoks ehitatud); vastuvõtjalogi tee ([[runs]]) töötab siin

engine-e-iq-scene-truth-missing-truth-csv-header = puudub truth CSV päis

engine-e-iq-track-design-carrier-fll-pull-in-max-2 = carrier.fll_pull_in_max_s kehtib ainult siis, kui fll_assist = "pull-in"

engine-e-iq-track-design-loop-design-file-holds-no = ahelakujunduse fail ei sisalda ühtegi kujundust

engine-e-iq-track-sink-short-record = lühike salvestus

engine-e-leo-navmsg-fit-correction-polynomial-fit-is-singular = paranduspolünoomi sobitus on singulaarne (astme jaoks liiga vähe loendeid)

engine-e-leo-navmsg-each-trade-update-periods-must = iga trade.update_periods_s peab olema vahemikus (0, update_fit_interval_s]

engine-e-leo-navmsg-midpass-user-lat-deg-in = midpass: user_lat_deg vahemikus [-90, 90], mask_deg vahemikus [0, 60), search_s 600-172800

engine-e-leo-pass-rain-rate-mm-rain-exceedance = rain_rate_mm_h >= 0, rain_exceedance_percent vahemikus [{ $lit_0_001 }, 5] ja scintillation_percent vahemikus [{ $lit_0_01 }, 50]

engine-e-leo-pass-spoofer-onset-within-the-window = spoofer: onset_s akna sees, offset_m vahemikus [0, 1e6], push_rate_m_s vahemikus [0, 1000], positiivsed prior_sigma_m, drift_sigma_m_s, fll_bandwidth_hz ja fll_integration_s, p_fa ja p_md vahemikus (0, { $lit_0_5 }), iono_rate_bound_m_s >= 0

engine-e-leo-signal-receiver-loop-bandwidth-hz-and = receiver: loop_bandwidth_hz ja integration_time_s peavad olema positiivsed

engine-e-leo-signal-receiver-to-12-correlator-spacings = receiver: 1 kuni 12 korrelaatori vahet, igaüks (nagu reference_spacing_chips) vahemikus 0 kuni 2 chip'i

engine-e-leo-signal-acquisition-coherent-ms-noncoherent-1000 = acquisition: coherent_ms > 0, 1 ≤ noncoherent ≤ 1000, 0 < pfa_cell < 1, code_bin_chips > 0, altitude_km > 0, oscillator_ppm ja user_speed_mps ≥ 0, 0 ≤ elevation_mask_deg < 90

engine-e-live-io-baud-needs-number = --baud vajab arvu

engine-e-live-io-configure-is-not-implemented-kshana = --configure ei ole realiseeritud: Kshana ei kirjuta kunagi vastuvõtjasse. Seadista see tootja enda tööriistaga ja loe seejärel võtmega --serial

engine-e-live-io-more-than-one-session-file = rohkem kui üks sessioonifail

engine-e-live-io-follow-and-from-end-apply = --follow ja --from-end kehtivad ainult võtmega --file

engine-e-live-io-baud-applies-to-serial-only = --baud kehtib ainult võtmega --serial

engine-e-live-io-live-needs-session-toml = live vajab sessiooni .toml-faili

engine-e-live-io-listen-serves-the-gated-stream = --listen teenindab väravdatud voogu: lisa --gate

engine-e-live-io-two-outputs-would-share-stdout = kaks väljundit jagaksid stdout'i; saada --json või --pksht faili

engine-e-lunar-ephemeris-lunar-ephemeris-give-exactly-one = Kuu efemeriid: anna täpselt üks väärtustest `mean_anom_deg` või `true_anom_deg`

engine-e-lunar-ephemeris-lunar-ephemeris-satellite-indices-must = Kuu efemeriid: satelliidiindeksid peavad olema pidevad alates 0-st, ilma lünkadeta

engine-e-lunar-frame-campaign-beacon-information-per-site-needs = majaki informatsioon koha kohta vajab väärtust station_datum = "fixed"; hinnatud jaama datum seob majakad

engine-e-lunar-infra-frame-llr-sigma-surface-orbiter-range = llr.sigma_m, surface.orbiter_range_sigma_m ja llr.epochs peavad olema positiivsed

engine-e-lunar-infra-od-too-few-trackable-gnss-measurements = liiga vähe jälgitavaid GNSS-mõõtmisi orbiidi ja vastuvõtja kella määramiseks

engine-e-lunar-infra-phase-fewer-than-two-connected-passes = vähem kui kaks ühendatud ülelendu: topeltvahe mitmetähenduslikkust ei ole mida lahendada

engine-e-lunar-infra-tie-the-space-tie-information-matrix = kosmoseseose informatsioonimaatriks on singulaarne

engine-e-lunar-jamming-jammer-range-must-be-finite = jammer.range_m peab olema lõplik ja positiivne (või anna jammer.lat_deg ja jammer.lon_deg, et segaja selenograafiliselt paigutada)

engine-e-lunar-llr-the-station-catalogue-states-no = jaamakataloog ei määra väärtust position_epoch_year; ITRF-positsiooni ei saa ilma selle epohhita edasi arvutada

engine-e-lunar-llr-beacon-campaign-beacons-is-not = beacon_campaign.beacons ei kasutata siin; määra lisatud majakad väljal extra_beacons

engine-e-lunar-service-planetary-kernel-path-applies-to = planetary_kernel_path kehtib elementide failile, mis on määratud OP-tugisüsteemis

engine-e-lunar-terrain-terrain-give-dem-path-dem = terrain: anna dem_path, dem_tile_path, station_horizon või user_horizon (või jäta [terrain] ära)

engine-e-lunar-terrain-terrain-station-horizon-has-no = terrain: station_horizon'il ei ole selles liigis jaama; kasuta user_horizon

engine-e-lunar-time-budget-scenario-sigma-is-shorter-than-the = x_sigma_s on tau-ruudustikust lühem

engine-e-lunar-time-lab-time-lab-thresholds-ns-must = time_lab: thresholds_ns peab olema positiivsete arvude mittetühi loend

engine-e-lunar-vlbi-fim-datum-all-stations-fixed-holds = datum "all-stations-fixed" hoiab kõiki jaamu fikseeritutena, seega ei hinda see midagi, välja arvatud juhul, kui majakat hinnatakse: sea estimate_beacon = true

engine-e-mars-pnt-fusion-od-run-produced-no = liitmis-OD käivitus ei andnud ühtegi sammu (liiga vähe vaatlusi)

engine-e-nmea-synth-clock-not-numeric = ei ole arv

engine-e-nmea-synth-config-scenario-name-must-be-to = scenario.name peab olema 1 kuni 64 märki hulgast A-Z a-z 0-9 . _ - ega tohi alata punktiga (see nimetab väljundfailid)

engine-e-nmea-synth-config-receiver-parameters-out-of-range = vastuvõtja parameetrid väljaspool vahemikku (mask 0-45 deg, track <= use threshold, 4-12 kasutatud satelliiti, noise >= 0, corr > 0, reacquire >= 0)

engine-e-nmea-synth-config-the-time-change-per-second = ajamuutus sekundis ulatub 1-ni, seega ettenäidatud aeg seiskuks või jookseks tagurpidi; pikenda ramp_s/recovery_s või kasuta astet (0)

engine-e-orbit-give-the-user-as-user = anna kasutaja kui `user` (orbiit) või `user_site` (maajaam), mitte mõlemat

engine-e-orbit-missing-the-user-give-user = kasutaja puudub: anna `user` (orbiit) või `user_site` (maajaam)

engine-e-orbit-skyline-needs-ground-site-give = [skyline] vajab maajaama: anna `user_site = { "{" } lat_deg, lon_deg, height_m { "}" }` orbiidil oleva `user` asemel (orbiidil ei ole Maaga seotud asimuuti)

engine-e-orbit-omm-export-requires-tle-defined = OMM eksport nõuab TLE-ga määratud konstellatsiooni; sellel stsenaariumil seda ei ole

engine-e-passes-earth-orientation-parameters-out-of = Maa orientatsiooniparameetrid väljaspool vahemikku: |ut1_minus_utc_s| <= 1, |xp_arcsec| ja |yp_arcsec| <= 2

engine-e-pvt-no-priori-position-set-apriori = a priori positsiooni ei ole: sea apriori_ecef, vaatluspäise APPROX POSITION XYZ või truth_ecef

engine-e-python-pll-bws-dll-bws-spacings = pll_bws, dll_bws, spacings ja coherents ei saa olla koos väärtusega design: pühkimine käivitab iga faili kujunduse

engine-e-python-no-designs-to-sweep = pühkimiseks ei ole kujundusi

engine-e-quantum-trade-candidate-adev-taus-and-candidate = candidate_adev_taus ja candidate_adev_values peavad olema võrdse pikkusega (>= 2)

engine-e-quantum-trade-provide-either-candidate-adev-taus = anna kas candidate_adev_taus + candidate_adev_values (mõõdetud) või candidate_clock_class

engine-e-quantum-trade-candidate-adev-taus-and-candidate-2 = candidate_adev_taus ja candidate_adev_values peavad olema mõlemad olemas (või mõlemad puuduma)

engine-e-quantum-trade-timing-threshold-and-position-threshold = timing_threshold_s ja position_threshold_m peavad olema lõplikud ja > 0

engine-e-realdata-clk-rinex-clock-file-is-mixed = RINEX-i kellafail on segasüsteemne ('M') ega deklareeri TIME SYSTEM ID-d; selle epohhide ajasüsteemi ei hakata ära arvama

engine-e-realdata-ion-sdr-more-than-one-block-only = rohkem kui üks <block>: loetakse ainult ühe rajaga faile

engine-e-realdata-ion-sdr-this-layout-carries-reading-fill = see paigutus kannab lugemist (fill_lsb_first või mid_rise), millele ION metaandmete standardis välja ei ole; seda ei saa kirjutada kui .sdrx

engine-e-realdata-ion-sdr-the-layout-needs-positive-sample = paigutus vajab positiivset diskreetimissagedust ja vähemalt 1 sagedustegurit

engine-e-realdata-lola-dem-unexpected-end-of-dem = DEM-i ootamatu lõpp

engine-e-realdata-lugre-not-raw-message = ei ole RAW-sõnum

engine-e-realdata-lugre-not-an-acq-message = ei ole ACQ-sõnum

engine-e-realdata-raim-no-priori-position-pass-one = a priori positsiooni ei ole: anna see või esita vaatluspäise APPROX POSITION XYZ

engine-e-receiver-trust-calibration-calibration-window-less-than-the = kalibreerimisaken on lühem kui kaitseaeg enne ründeakent või jääb ründeakna sisse

engine-e-receiver-trust-live-live-mode-needs-platform-kind = live-režiim vajab [platform] kind = "vessel": usaldusskoor on mõeldud liikuvale platvormile

engine-e-receiver-trust-machines-rtcm3-the-rtcm-stream-holds-no = RTCM 3 voog ei sisalda ühtegi MSM4 ega MSM7 vaatlussõnumit

engine-e-receiver-trust-machines-rtklib-rtklib-pos-with-degrees-minutes = RTKLIB .pos kraadid-minutid-sekundid positsioonidega ei ole loetav: käivita rnx2rtkp/RTKPOST uuesti kümnendkraadidega (-degf 0)

engine-e-receiver-trust-monitors-engine-fix-the-rinex-observation = mootori fiksatsioon: RINEX-i vaatluspäisel puudub APPROX POSITION XYZ, millest lahendamist alustada

engine-e-receiver-trust-monitors-platform-declares-heading-sensor-true = platvorm deklareerib heading_sensor = true, kuid logi ei kanna HDT, THS ega VHW suunda

engine-e-receiver-trust-scenario-log-imu-the-imu-series = log.imu: IMU jada ei kattu ühegi logi epohhiga; kontrolli time_offset_s

engine-e-receiver-trust-scenario-this-surface-does-not-carry = see pind ei kanna `[log.imu]` faili: käivita stsenaarium käsuga `kshana receiver-trust` hostil või jäta `[log.imu]` ära

engine-e-receiver-trust-scenario-log-nav-applies-only-to = log.nav kehtib ainult `rinex` logile: mootori fiksatsioon vajab selle pseudovahemaid

engine-e-receiver-trust-score-score-the-geometry-deduction-is = score: geomeetria mahaarvamine määratakse jaotises [geometry] (cap_points, full_ratio, floor), mitte jaotises [score.weights]

engine-e-spectrum-recording-is-not-available-in = salvestus ei ole WebAssembly ehituses saadaval: anna SigMF baitid hoopis funktsioonidele kshana::sigmf::read ja kshana::spectrum::welch_psd

engine-e-ssv-scenario-navigation-noise-and-radiation-pressure = navigation: müra ja kiirgusrõhu väärtused ei tohi olla negatiivsed

engine-e-ssv-scenario-trajectory-give-exactly-one-of-2 = trajectory: anna täpselt üks väärtustest duration_min ja duration_periods

engine-e-ssv-weak-receiver-pfa-total-and-receiver = receiver.pfa_total ja receiver.pd peavad olema tõenäosused vahemikus (0, 1)

engine-e-suite-suite-manifest-is-missing-title = komplekti manifestil puudub `title`

engine-e-suite-suite-manifest-has-no-scenarios = komplekti manifestil puudub `scenarios`: lisa mittetühi massiiv `scenarios = [...]`

engine-e-surface-path-sources-are-not-accepted = `path` allikaid siin ei aktsepteerita: anna logi otse väärtusena `text` või `base64`

engine-e-surface-input-campaign-names-campaign-folder = { "[" }input] campaign nimetab kampaaniakausta ja see pind ei loe faile; kampaaniaid loevad ainult CLI (`kshana iq labfit`), Python (`kshana.iq_labfit`) või MCP labfit-tööriist oma IQ töökataloogis

engine-e-surface-bad-merkle-root-hex = vigane Merkle'i juure kuueteistkümnendkuju

engine-e-surface-merkle-root-must-be-32 = Merkle'i juur peab olema 32 baiti

engine-e-telecom-timing-csv-path-is-not-available = csv_path ei ole WebAssembly ehituses saadaval; anna jada otse väärtusena `samples`

engine-e-telemetry-cli-otlp-every-needs-whole-number = --otlp-every vajab täisarvu

engine-e-telemetry-cli-registry-poisoned = register on mürgitatud

engine-e-telemetry-otlp-https-is-not-supported-by = https ei ole sisseehitatud eksportija poolt toetatud; kasuta kohalikku kogujat üle http

engine-e-telemetry-otlp-no-http-status-in-response = vastuses puudub HTTP olek

engine-e-tle-invalid-designator-launch-year-in = TLE-s on kehtetu tähise starditaasta

engine-e-tle-invalid-epoch-year-in-tle-2 = TLE-s on kehtetu epohhi aasta

engine-e-tle-invalid-epoch-day-in-tle = TLE-s on kehtetu epohhi päev

engine-e-adm-record-without-epoch = kirje ilma <EPOCH>-ita

engine-e-adm-ndm-holds-no = <ndm> ei sisalda ühtegi <{ $kind }>

engine-e-adm-root-element-is-not = juurelement <{ $name }> ei ole <{ $kind }>

engine-e-evidence-cli-keygen-needs-out-keyfile = keygen vajab võtit --out <keyfile>

engine-e-evidence-cli-needs-key-keyfile-make-one = vajab võtit --key <keyfile> (tee see käsuga `kshana evidence keygen`)

engine-e-evidence-cli-needs-out-dir = vajab võtit --out <dir>

engine-e-evidence-cli-needs-scenario-bench-scenario = vajab võtit --scenario <bench scenario>

engine-e-evidence-cli-needs-conditions-file = vajab võtit --conditions <file>

engine-e-evidence-tsa-bad-ecdsa-signature = vigane ECDSA allkiri

engine-e-evidence-tsa-certificate-signature-failure = sertifikaadi allkirja rike

engine-e-evidence-tsa-unable-to-get-issuer-certificate = väljastaja sertifikaati ei õnnestunud hankida

engine-e-evidence-tsa-unable-to-get-local-issuer = kohalikku väljastaja sertifikaati ei õnnestunud hankida

engine-e-evidence-tsr-gentime-is-not-text = genTime ei ole tekst

engine-e-glonass-bad-year = vigane aasta

engine-e-glonass-bad-month = vigane kuu

engine-e-glonass-bad-day = vigane päev

engine-e-glonass-bad-hour = vigane tund

engine-e-glonass-bad-minute = vigane minut

engine-e-gravity-sh-bad-degree = vigane aste

engine-e-gravity-sh-bad-order = vigane järk

engine-e-interop-testbench-first-line-is-not-resolution = esimene rida ei ole `RESOLUTION: <ms>`

engine-e-interop-testbench-bad-resolution = vigane resolutsioon

engine-e-iq-signals-galileo-the-galileo-e1-memory-codes = Galileo E1 mälukoode ei ole kaasatud (ICD tingimused lubavad levitamist ainult mittekommertseesmärkidel; vt LICENSING.md). Anna oma ICD Annex C koopia ({ $file }) võtmega { $env }=<path> või käivita scripts/fetch_galileo_e1_codes.sh lähtekoodi väljavõttes ({ $path }: { $e })

engine-e-jammertest-cli-key-needs-out-dir = --key vajab võtit --out <dir>

engine-e-leo-signal-modulation-expected-flat-mhz = modulatsioon { $label }: oodatud on FLAT(<MHz>)

engine-e-live-io-listen-takes-tcp-port-or = --listen võtab väärtuse tcp:<port> või tcp:<addr>:<port>

engine-e-ndm-xml-bad-attribute-in = vigane atribuut elemendis <{ $name }>

engine-e-ndm-xml-unquoted-attribute-in = jutumärkideta atribuut { $key } elemendis <{ $name }>

engine-e-ndm-xml-is-not-closed = <{ $name }> ei ole suletud

engine-e-nmea-synth-cli-wait-clients-not-number = --wait-clients: ei ole arv

engine-e-nmea-synth-cli-speed-not-number = --speed: ei ole arv

engine-e-nmea-synth-cli-seed-not-an-integer = --seed: ei ole täisarv

engine-e-odm-user-defined-without-parameter = <USER_DEFINED> ilma parameetrita

engine-e-osnma-cli-bad-public-key-id = vigane avaliku võtme id

engine-e-osnma-cli-bad-public-key-hex = vigane avaliku võtme kuueteistkümnendkuju

engine-e-realdata-ion-sdr-closing-tag-does-not-match = sulgemismärgend </{ $name }> ei sobi märgendiga <{ $name2 }>

engine-e-realdata-ion-sdr-closing-tag-without-an-opening = sulgemismärgend </{ $name }> ilma avamismärgendita

engine-e-realdata-ion-sdr-attribute-without-value-in = atribuut ilma väärtuseta elemendis <{ $name }>

engine-e-realdata-ion-sdr-is-not-an-integer = <{ $name }> { $key } ei ole täisarv: { $v }

engine-e-realdata-ion-sdr-chunk-lacks-sizeword = <chunk>-ilt puudub sizeword

engine-e-realdata-ion-sdr-chunk-lacks-countwords = <chunk>-ilt puudub countwords

engine-e-realdata-ion-sdr-is-not-an-integer-2 = <{ $key }> ei ole täisarv

engine-e-realdata-ion-sdr-ratefactor-is-not-an-integer = <ratefactor> ei ole täisarv

engine-e-realdata-ion-sdr-no-band-with-centerfreq-for = voole puudub <band> koos <centerfreq>-iga

engine-e-realdata-ion-sdr-offset-is-not-an-integer = <offset> ei ole täisarv

engine-e-receiver-trust-geometry-geometry-need-hdop-good-hdop = geometry: vaja on 0 < hdop_good <= hdop_max, 0 < pdop_good <= pdop_max ja used_good >= min_used (saadi { $hdop_good }, { $pdop_good }, { $used_good })

engine-e-sp3-bad-epoch-count = vigane epohhide arv

engine-e-spectrum-matched-jammer-needs-matched-to = { $name }: sobitatud segaja vajab väärtust matched_to = "<band name>"

engine-e-spectrum-unknown-band-the-spectrum-model = tundmatu riba { $name }: spektrimudelis on { $band_names } ja nime järgi { $more_band_names } (GLONASS                      kanalid kui glonass-l1of-k<K>, K = -7 kuni 6); iga muu riba võtab                      `signal = "<preset signal>"` või `centre_mhz` koos `modulation` ja                      `signal_power_dbw`

engine-e-evidence-assemble-the-log-does-not-state = logi ei määra sõelutavat algusaega; anna sekundid esimesest epohhist

engine-e-interop-geojson-no-linestring-found-give-linestring = LineString'i ei leitud: anna LineString-geomeetria, seda sisaldav Feature või FeatureCollection, mille objektide hulgas see on

engine-e-interop-geojson-the-scenario-has-no-waypoints = stsenaariumil ei ole 2 või rohkem `waypoints`, mille vahel kahe positsiooniga marsruuti laiali jaotada

engine-e-leo-pnt-chain-the-chain-satellite-is-visible = ahela satelliit on nähtav alla kahe epohhi või ainult ühel kõrgusel; laienda ülelennu akent

engine-e-nmea-synth-config-skyline-table-is-required-for = skyline-tabel on nõutav (näiteks skyline = { "{" } preset = "fjord" { "}" })

engine-e-python-prns-must-list-at-least = prns peab loetlema vähemalt ühe PRN-i

engine-e-python-design-name-needs-design = design_name vajab väärtust design

engine-e-python-bandpass-needs-both-bandpass-lo = bandpass vajab nii bandpass_lo kui ka bandpass_hi

engine-e-python-token-text-is-not-base64 = märgi tekst ei ole base64

engine-e-python-unix-nano-must-be-between = unix_nano peab olema vahemikus 0 kuni 2**64 - 1

engine-e-wasm-token-base64-is-not-base64 = token_base64 ei ole base64

engine-e-wasm-log-base64-is-not-base64 = log_base64 ei ole base64

engine-e-wasm-input-base64-is-not-base64 = input_base64 ei ole base64

engine-e-wasm-seed-must-be-non-negative = seed peab olema mittenegatiivne täisarv

engine-e-wasm-runs-json-must-be-an = runs_json peab olema massiiv kujul { "{" }label, result, scenario?{ "}" }

engine-e-nmea-synth-stream-no-udp-address = UDP-aadress puudub

engine-e-realdata-llr-crd-short-normal-point-11-record = lühike normaalpunkti (11) kirje

engine-e-realdata-llr-crd-normal-point-record-appeared-before = normaalpunkti kirje ilmus enne oma h2/h3/h4 sessioonipäist

engine-e-gravity-sh-line-bad-coefficient-non-finite = rida { $lineno }: vigane koefitsient (mitte lõplik)

engine-e-interop-time-extra-fields-utc = ei ole UTC aeg `YYYY-MM-DDTHH:MM:SS`: lisaväljad: { $text }

engine-e-interop-time-year-outside-2000-to-2099-utc = ei ole UTC aeg `YYYY-MM-DDTHH:MM:SS`: aasta väljaspool vahemikku 2000 kuni 2099: { $text }

engine-e-interop-time-month-outside-to-12-utc = ei ole UTC aeg `YYYY-MM-DDTHH:MM:SS`: kuu väljaspool vahemikku 1 kuni 12: { $text }

engine-e-interop-time-day-does-not-exist-in-utc = ei ole UTC aeg `YYYY-MM-DDTHH:MM:SS`: päeva ei ole sellel kuul olemas: { $text }

engine-e-interop-time-hour-above-23-utc = ei ole UTC aeg `YYYY-MM-DDTHH:MM:SS`: tund üle 23: { $text }

engine-e-interop-time-minute-above-59-utc = ei ole UTC aeg `YYYY-MM-DDTHH:MM:SS`: minut üle 59: { $text }

engine-e-interop-time-seconds-outside-60-utc = ei ole UTC aeg `YYYY-MM-DDTHH:MM:SS`: sekundid väljaspool vahemikku [0, 60): { $text }

engine-e-mcp-budget-work-budget-exceeded-for-call = MCP-serveri kaudu tehtud kõne töömaht ületati: { $errors }. Käivita suured uuringud käsurealt käsuga `kshana`.

engine-e-mcp-iq-the-iq-sample-budget-must = IQ loendite eelarve peab olema vähemalt 1

engine-e-mcp-iq-an-empty-path-was-given = anti tühi tee

engine-e-mcp-iq-rate-hz-must-be-positive = rate_hz peab olema positiivne arv

engine-e-mcp-iq-duration-must-be-positive-number = duration_s peab olema positiivne arv

engine-e-mcp-iq-broadcast-mode-nav-needs-rx = leviedastusrežiim (nav) vajab rx_pos [lat, lon, alt]

engine-e-mcp-iq-scene-needs-signal-or-nav = stseen vajab `signal` (või `nav` leviedastusrežiimi jaoks)

engine-e-mcp-iq-scene-needs-at-least-one = stseen vajab vähemalt ühte PRN-i väljal `prns`

engine-e-mcp-iq-surface-out-exports-one-surface = surface_out ekspordib ühe pinna: anna täpselt üks PRN

engine-e-mcp-iq-surface-out-must-end-in = surface_out peab lõppema laiendiga .csv, .json või .bin

engine-e-mcp-iq-max-seconds-must-be-positive = max_seconds peab olema positiivne arv

engine-e-mcp-iq-epochs-out-must-end-in = epochs_out peab lõppema laiendiga .csv, .jsonl või .bin (vorming järgib laiendit)

engine-e-mcp-iq-out-must-differ-from-input = out peab sisendist erinema

engine-e-mcp-iq-pll-bws-hz-dll-bws = pll_bws_hz, dll_bws_hz, spacings_chips ja coherents ei saa olla koos väärtusega design: pühkimine käivitab iga faili kujunduse

engine-e-mcp-iq-signal-and-prns-go-together = signal ja prns käivad koos

engine-e-mcp-iq-iq-work-directory = IQ töökataloog { $dir }: { $e }

engine-e-mcp-iq-iq-work-directory-is-not = IQ töökataloog { $dir } ei ole kataloog

engine-e-mcp-iq-iq-file-tools-are-off = IQ failitööriistad on välja lülitatud: { $reason }

engine-e-mcp-iq-output-does-not-name-file = väljund `{ $rel }` ei nimeta faili

engine-e-mcp-iq-output-its-folder = väljund `{ $rel }`: selle kaust: { $e }

engine-e-mcp-iq-output-is-symlink-refusing-to = väljund `{ $shown }` on sümbollink; kirjutamisest keeldutakse

engine-e-mcp-iq-output-already-exists-pass-overwrite = väljund `{ $shown }` on juba olemas; anna overwrite: true, et see asendada

engine-e-mcp-iq-output-exists-and-is-not = väljund `{ $shown }` on olemas ega ole fail

engine-e-mcp-iq-its-data-file-lies-outside = { $path }: selle andmefail asub väljaspool IQ töökataloogi

engine-e-mcp-iq-lies-outside-the-iq-work = { $path } asub väljaspool IQ töökataloogi

engine-e-mcp-iq-input-campaign-the-campaign-folder = { "[" }input] campaign `{ $rel }`: { $message }; kampaaniakaust peab olema olemasolev kaust IQ töökataloogi sees

engine-e-mcp-iq-out-dir-does-not-name = out_dir `{ $rel }` ei nimeta kausta

engine-e-mcp-iq-is-samples-and-one-call = { $what } on { $samples } loendit ja üks kõne võib töödelda kuni { $max_samples } ({ $env }); { $remedy }

engine-e-mcp-iq-threads-must-be-to = threads peab olema 1 kuni { $max_threads }

engine-e-mcp-iq-truth-format-must-be-csv = truth_format peab olema csv või jsonl (saadi { $other })

engine-e-mcp-iq-surface-out-would-hold-about = surface_out sisaldaks ligikaudu { $cells } lahtrit (Doppleri lahtrid × loendid koodiperioodi kohta; piir { $max_cells }, ligikaudu { $mb } MB binaarkujul): laienda doppler_step_hz või kitsenda doppler_max_hz

engine-e-mcp-iq-no-campaign-here = { $out_dir }: siin ei ole kampaaniat ({ $e })

engine-e-mcp-iq-design-prn-channels-at-most = { $n_channels } (kujundus, PRN) kanalit; kuni 256 ühe pühkimise kohta

engine-e-mcp-iq-test-conditions-invalid = katsetingimused on kehtetud: { $e }

engine-e-mcp-iq-labfit-failed = labfit ebaõnnestus: { $e }

engine-e-mcp-marine-give-exactly-one-of-log = anna täpselt üks väärtustest `log` ja `log_base64`

engine-e-mcp-marine-at-most-366-maps-per = kuni 366 kaarti ühe kõne kohta

engine-e-mcp-marine-mode-symbols-needs-symbols = režiim `symbols` vajab `symbols`

engine-e-mcp-marine-vessel-stream-assessment-failed = laeva voo hindamine ebaõnnestus: { $e }

engine-e-mcp-marine-jammertest-import-failed = jammertest import ebaõnnestus: { $e }

engine-e-mcp-marine-jammertest-score-failed = jammertest skoorimine ebaõnnestus: { $e }

engine-e-mcp-marine-vessel-log-assessment-failed = laeva logi hindamine ebaõnnestus: { $e }

engine-e-mcp-marine-training-scenario-failed = treeningstsenaarium ebaõnnestus: { $e }

engine-e-mcp-marine-evidence-pack-failed = tõendipaketi koostamine ebaõnnestus: { $e }

engine-e-mcp-marine-the-pack-is-bytes-over = pakett on { $size } baiti, üle { $max_bytes }-baidise vastusepiiri; kitsenda akent või kasuta käsureal käsku `kshana receiver-trust evidence`

engine-e-mcp-marine-round-trip-pack-failed = ringkäigupaketi koostamine ebaõnnestus: { $e }

engine-e-mcp-marine-the-pack-is-bytes-over-2 = pakett on { $size } baiti, üle { $max_bytes }-baidise vastusepiiri; kitsenda akent või kasuta käsureal käsku `kshana evidence round-trip`

engine-e-mcp-marine-files-are-over-the-byte = failid ületavad { $max_bytes }-baidist piiri

engine-e-mcp-marine-full-log-is-over-the = full_log ületab { $max_bytes }-baidist piiri

engine-e-mcp-marine-interference-map-failed = häirekaardi koostamine ebaõnnestus: { $e }

engine-e-mcp-marine-the-map-is-bytes-over = kaart on { $total } baiti, üle { $max_bytes }-baidise vastusepiiri; kasuta jämedamat cell_deg-i, vähem päevi või käsureal käsku `kshana interference-map`

engine-e-mcp-marine-route-exposure-failed = marsruudi ekspositsiooni arvutus ebaõnnestus: { $e }

engine-e-mcp-marine-compliance-report-failed = compliance-aruande koostamine ebaõnnestus: { $e }

engine-e-mcp-marine-standards-pack-failed = standardipaketi töötlemine ebaõnnestus: { $e }

engine-e-mcp-marine-lunanet-afs-check-failed = lunanet-afs-check ebaõnnestus: { $e }

engine-e-mcp-marine-mode-must-be-spec-symbols = mode peab olema spec, symbols või generate (saadi { $other })

engine-e-mcp-marine-benchmark-scoring-failed = etalontesti skoorimine ebaõnnestus: { $e }

engine-e-mcp-marine-leaderboard-failed = edetabeli koostamine ebaõnnestus: { $e }

engine-e-mcp-marine-test-bench-export-failed = katsepingi eksport ebaõnnestus: { $e }

engine-e-mcp-marine-the-pack-is-bytes-over-3 = pakett on { $size } baiti, üle { $max_bytes }-baidise vastusepiiri

engine-e-mcp-server-give-exactly-one-of-request = anna täpselt üks väärtustest `request` (taevageomeetria päring) või `skyline_preset` (eelseadistuse nimi või tühi string nende loetlemiseks)

engine-e-mcp-server-receiver-log-assessment-failed = vastuvõtja logi hindamine ebaõnnestus: { $e }

engine-e-mcp-server-unknown-scenario-kind-list-scenario = tundmatu stsenaariumi liik `{ $k }`; list_scenario_kinds nimetab iga liigi

engine-e-mcp-server-unknown-report-format-expected-json = tundmatu aruandevorming `{ $format }`; oodatud on json või html

engine-e-mcp-server-report-failed = aruande koostamine ebaõnnestus: { $e }

engine-e-mcp-server-duration-fps-gives-frames-and = duration_s x fps annab { $n_frames } kaadrit ja vastus kannab kuni { $max_frames }; vähenda fps-i või duration_s-i või kirjuta pikem jada käsurealt (`kshana <scenario.toml> --animate frames`)

engine-e-mcp-server-route-import-failed = marsruudi import ebaõnnestus: { $e }

engine-e-mcp-server-sp3-export-failed = SP3 eksport ebaõnnestus: { $e }

engine-e-mcp-server-omm-export-failed = OMM eksport ebaõnnestus: { $e }

engine-e-mcp-server-oem-export-failed = OEM eksport ebaõnnestus: { $e }

engine-e-mcp-server-scenario-kind-publishes-no-csv = stsenaariumi liik `{ $kind }` ei avalda CSV tabelit; seda teevad ainult { $kinds }

engine-e-mcp-server-unknown-skyline-preset-known-presets = tundmatu horisondijoone eelseadistus "{ $name }"; teadaolevad eelseadistused: { $presets }

engine-e-mcp-server-the-tool-call-did-not = tööriista kutse ei lõppenud: { $e }

engine-e-mcp-server-the-server-is-at-its-concurrent-work-limit = server on oma samaaegse töö piiril (varasemad kutsed veel töötavad); proovi peagi uuesti

engine-e-mcp-server-the-work-pool-is-closed = töökogum on suletud

engine-e-mcp-iq-no-work-directory = töökataloogi ei ole

engine-e-mcp-iq-input = sisend `{ $rel }`: { $e }

engine-e-mcp-iq-input-is-not-file = sisend `{ $rel }` ei ole fail

engine-e-mcp-iq-input-campaign-is-not-folder = { "[" }input] campaign `{ $rel }` ei ole kaust

engine-e-mcp-iq-out-dir-is-not-folder = out_dir `{ $rel }` ei ole kaust

engine-e-mcp-iq-out-dir = out_dir `{ $rel }`: { $e }

engine-e-mcp-iq-iq-failed = iq { $args } ebaõnnestus: { $m }

engine-e-adm-attitudestate-without = <attitudeState> ilma <{ $tag }>-ita

engine-e-bench-cli-is-required = { $flag } on nõutav

engine-e-bench-cli-is-empty = { $p } on tühi

engine-e-evidence-tsa-bad-256-key = vigane P-256 võti

engine-e-evidence-tsa-bad-384-key = vigane P-384 võti

engine-e-interop-no-iq-block = [iq] plokki ei ole

engine-e-ndm-xml-closes = </{ $close }> sulgeb elemendi <{ $name }>

engine-e-odm-unexpected-in-data = ootamatu <{ $name }> elemendis <data>

engine-e-odm-unsupported-in-ocm-data = toetamata <{ $name }> OCM-i elemendis <data>

engine-e-realdata-ion-sdr-no-stream-element = <stream> elementi ei ole

engine-e-realdata-ion-sdr-is-not-number = <{ $name }> ei ole arv: { $text }

engine-e-realdata-ion-sdr-no-chunk-element = <chunk> elementi ei ole

engine-e-realdata-ion-sdr-stream-lacks = <stream>-ilt puudub <{ $key }>

engine-e-realdata-ion-sdr-no-system-element = <system> elementi ei ole

engine-e-realdata-ion-sdr-no-file-with-url = <file>-i koos <url>-iga ei ole

engine-e-surface-give-string-utf8-or-base64 = { $k }: anna string, { "{" }"utf8": ...{ "}" } või { "{" }"base64": ...{ "}" }

engine-e-realdata-llr-crd-short-h1-record = lühike h1 kirje

engine-e-realdata-llr-crd-short-h2-record = lühike h2 (jaama) kirje

engine-e-realdata-llr-crd-short-h3-record = lühike h3 (sihtmärgi) kirje

engine-e-realdata-llr-crd-short-h4-record = lühike h4 (sessiooni) kirje

engine-e-mcp-main-needs-value = { $a } vajab väärtust

engine-main-usage =
    kasutus: kshana <scenario.toml> [--study-name <s>] [--eop <finals2000A>] [--export-sp3 <out.sp3>] [--export-omm <out.omm>] [--export-oem <out.oem>] [--export <czml|kml|geojson|stk|sigmf|all|list>]... [--import-route <route.geojson>]
    { "   " }või: kshana <scenario.toml> --animate <svg|html|frames|all> [--animate-fps <n>] [--animate-duration <s>]
    { "   " }või: kshana --study <suite.toml>
    { "   " }või: kshana --validate <scenario.toml>
    { "   " }või: kshana receiver-trust <scenario.toml>
    { "   " }või: kshana receiver-trust live <session.toml> [--stdin | --file <path> [--follow] | --tcp <host:port> | --udp <port>] [--gate] (kshana receiver-trust live --help)
    { "   " }või: kshana receiver-trust evidence <scenario.toml> --from <t0> --to <t1> --key <keyfile> --out <dir> (kshana evidence --help)
    { "   " }või: kshana evidence <keygen|verify|attach-timestamp> ... (kshana evidence --help)
    { "   " }või: kshana jammertest <import|score> ... (kshana jammertest --help)
    { "   " }või: kshana evidence round-trip <scenario.toml> --scenario <bench-scenario> --conditions <file> --from <t0> --to <t1> --key <keyfile> --out <dir> (kshana evidence --help)
    { "   " }või: kshana trust-telemetry [options] (kshana trust-telemetry --help)
    { "   " }või: kshana imu-fit <imu.csv> [--format csv|euroc] [--axis x|y|z] [--expected-mean <m/s2>] [--id <name>] [--json]
    { "   " }või: kshana nmea-scenario <scenario.toml> [--out <file.nmea>] [--tcp <addr>|--udp <addr>] (kshana nmea-scenario --help)
    { "   " }või: kshana interference-map <adsb|ais|fetch-land> ... (kshana interference-map --help)
    { "   " }või: kshana route-exposure --route <route> --map <map.geojson|dir> [--from <date>] [--to <date>]
    { "   " }või: kshana bench <spec|truth|cases|score|baseline|seal|reveal-check|manifest|verify-manifest|validate|leaderboard> ... (kshana bench --help)
    { "   " }või: kshana bench-export <scenario.toml> [--out <base>] [--epoch <YYYY-MM-DDTHH:MM:SS>]
    { "   " }või: kshana compliance-report [--out <base>] <result.json>... | --mapping | --sources
    { "   " }või: kshana lunanet-afs-check <spec [--json] [--strict]|symbols <file> [--max-sp-errors <n>] [--json]|generate --frames <n> [--toi0 <t>] --out <file>>
    { "   " }või: kshana standards-pack <list|run <id> [--json] [--out <base>]|rows <id>|tests <id>>
    { "   " }või: kshana partner check <submission.toml> [--json]
    { "   " }või: kshana osnma verify <pages|vectors.csv|stream.ubx> [--merkle-root <hex>] [--public-key <id:type:hex>] [--reference-time <gst-s>] [--json] (kshana osnma --help)
    { "   " }või: kshana iq <scene|acquire|track|sweep|labfit|campaign|conditions|frontend|monitor|inventory|info|extract|convert|decimate> ... (kshana iq --help)
    { "   " }või: kshana sky <request.json|request.toml> | --site <lat,lon[,h]> --systems <a,b,...> [--time <s>] [--mask <deg>] [--skyline-preset <name>] [--uere <m>] [--monte-carlo <n> --seed <s>] [--svg] (kshana sky --help)
    { "   " }või: kshana skyline --preset <name> [--json] | --presets | --profile <skyline.json|toml>
    { "   " }või: kshana kinds [--json]
    { "   " }või: kshana example [<name>]
    { "   " }või: kshana --help | --version

engine-main-usage-sky =
    kasutus: kshana sky <request.json|request.toml> [--monte-carlo <n> --seed <s>] [--svg]
    { "   " }või: kshana sky --site <lat,lon[,height_m]> (--systems <preset,...> | --tle <file>)
    { "                  " }[--epoch <YYYY-MM-DDTHH:MM:SSZ>] [--tle-system <label>] [--time <s>]
    { "                  " }[--mask <deg>] [--skyline-preset <name>] [--uere <m>]
    { "                  " }[--clock per-system|common] [--monte-carlo <n> --seed <s>] [--svg]

    Väljastab JSON-ina (sky_geometry) satelliidid, mida koht horisondijoone all näeb, nende DOP-i, ida-põhja-üles kofaktori
    ja kovariatsiooni ning horisontaalse vea ellipsi; võtmega --monte-carlo n (kuni 5000) algväärtustatud
    vähimruutude viga (sky_monte_carlo); võtmega --svg taevakaardi (skyplot).
    Süsteemid on mootori eelseadistused (gps-baseline, galileo, beidou-meo, glonass, xona-pulsar, ...):
    esindusliku geomeetria, mitte kuupäeva taeva kohas. --tle loeb kaherealisi elemendikomplekte
    (kuni 4 MiB) ja propageerib neid SGP4-ga epohhini --epoch (UTC) pluss --time: taevas, mille need
    elemendikomplektid sel epohhil annavad, mitte mõõtmine. Ilma --epoch'ita viiakse need uusima
    elemendikomplekti epohhini, esindusliku taevani. MODELLED; docs/SKYLINE.md.

engine-main-usage-skyline =
    kasutus: kshana skyline --preset <name> [--json]
    { "   " }või: kshana skyline --presets
    { "   " }või: kshana skyline --profile <skyline.json|skyline.toml>

    Väljastab horisondijoone eelseadistuse (city-street, harbour-approach, fjord, container-terminal) koos selle
    päritolu ja iga asimuudikraadi lõikega, eelseadistuste loendi või horisondijoone jaotise,
    taandatuna 360-kirjelisele tabelile, mida mootor kasutab. REPRESENTATIVE eelseadistused; docs/SKYLINE.md.

engine-main-usage-lunanet-afs-check =
    kasutus: kshana lunanet-afs-check spec [--json] [--strict]
    { "   " }või: kshana lunanet-afs-check symbols <file> [--max-sp-errors <n>] [--json]
    { "   " }või: kshana lunanet-afs-check generate --frames <n> [--toi0 <t>] --out <file>

    Seotud dokumendiga LunaNet Interoperability Specification V5, Applicable Document 1 Volume A (LSIS-AFS
    V1.0, 29 January 2025). `spec` kontrollib seda realisatsiooni dokumendi trükitud koodi-
    tabelite ja läbitöötatud näidete vastu (xval/lunanet-afs/PREREGISTRATION.md läved B1 kuni B10; võtmega --strict
    on väljumisolek 1, kui iga lävi ei ole täidetud). `symbols` kontrollib kõvaotsustusega sümbolivoogu
    (0-de ja 1-de tekst) sünkroniseerimismustri, SB1 dekodeerimise, FID-i, TOI järjepidevuse ja kaadri
    vahe osas; alamkaadreid 2 kuni 4 (LDPC, CRC-24Q) EI kontrollita. `generate` kirjutab sümbolite testvoo
    kohahoidja-alamkaadritega; see ei ole lainekuju ja Kshana ei kirjuta ühtegi signaali. AFS-i
    lainekuju hõivamiseks või jälgimiseks salvestuses kasuta `kshana iq acquire --signal lunanet-afs-i`
    (või lunanet-afs-q). Ainult nõuandev. docs/LUNANET-AFS.md.

engine-main-usage-standards-pack =
    kasutus: kshana standards-pack list
    { "   " }või: kshana standards-pack run <id> [--json] [--out <base>]
    { "   " }või: kshana standards-pack rows <id>
    { "   " }või: kshana standards-pack tests <id>

    Standardipakett on stsenaariumide komplekt, mida hinnatakse enne käivitust määratud lävede vastu ja mis on seotud
    compliance-report ridadega, mille jaoks see toetab tõendeid (supports evidence for). `run` väljastab tabeli (või --json) ja, kui on
    antud --out, kirjutab <base>.pack.json ja <base>.pack.md; anna JSON käsule `kshana compliance-report`,
    et ridu näha. Test, mis vajab vastuvõtja logi, on loetletud kui NEEDS INPUT ja seda ei hinnata.
    MODELLED: täidetud MET lävi ütleb, et modelleeritud stsenaarium täitis määratud läve, mitte seda, et mõni toode
    täidab nõude. docs/compliance/README.md.

engine-main-applies = { $fmt }: kehtib

engine-main-wrote = kirjutatud { $path }

engine-main-note = märkus: { $n }

engine-main-error-example-extra-argument = viga: ootamatu argument '{ $extra }' pärast `example <name>`; see võtab ühe nime

engine-main-lunanet-afs-generate-needs = generate vajab võtmeid --frames <n> ja --out <file> (ning täisarvulist --toi0)

engine-evidence-cli-usage =
    kasutus:
    { "  " }kshana evidence keygen --out <keyfile>
    { "  " }kshana evidence verify <bundle-dir> --pubkey <hex|file> [--log <full-log>] [--require-timestamp] [--tsa-ca <anchors.pem>]
    { "      " }[--allow-unpinned] [--json]      väljumiskood 0 kontrollitud, 1 ebaõnnestunud, 3 terve, kuid allkirjastaja pole kinnitatud
    { "  " }kshana evidence attach-timestamp <bundle-dir> <token.tsr> [--replace]
    { "      " }(loeb RFC 3161 märgi ja seob selle manifestiga; see EI kontrolli ajatempliasutuse
    { "      " }allkirja: kasuta `openssl ts -verify`)
    { "  " }kshana receiver-trust evidence <scenario.toml> --from <t0> --to <t1> --key <keyfile> --out <dir>
    { "      " }[--title <text>] [--created-utc <YYYY-MM-DDTHH:MM:SSZ|none>] [--lab-attestation <file.toml>]
    { "  " }kshana evidence round-trip <scenario.toml> --scenario <bench-scenario> --conditions <file> --from <t0> --to <t1>
    { "      " }--key <keyfile> --out <dir> [--title <text>] [--created-utc <...|none>]
    { "      " }(seob stsenaariumi, labori katsetingimused, vastuvõtja logi ja selle skoori;
    { "      " }<scenario.toml> on receiver-trust skoorimisstsenaarium; ei kirjuta signaali)
    { "  " }<t0>/<t1>: sekundid logi esimesest epohhist või ISO-8601 UTC aeg, kui logi
    { "  " }määrab oma algusaja. Pakett on tehniline kirje, mitte õiguslik arvamus.

engine-evidence-cli-fingerprint = sõrmejälg: { $fp }

engine-evidence-cli-verify-failure = { "  " }rike: { $f }

engine-evidence-cli-verify-note = { "  " }märkus: { $n }

engine-evidence-cli-verified-pinned = VERIFIED: iga räsi, ahel ja allkiri klapivad sinu esitatud võtmega.

engine-evidence-cli-verified-unpinned = VERIFIED paketi enda nimetatud võtme suhtes, sõrmejälg { $fp } (allkirjastajat EI ole kinnitatud; anna --pubkey).

engine-evidence-cli-intact-signer-not-pinned = INTACT, BUT THE SIGNER IS NOT PINNED: räsid ja allkiri on kooskõlas võtmega { $fp }, mille pakett ise nimetab. Anna --pubkey <signer public key>, et kindlaks teha, kes allkirjastas (või --allow-unpinned, et see teadlikult vastu võtta).

engine-evidence-cli-not-verified = NOT VERIFIED: vt ülaltoodud rikkeid.

engine-evidence-cli-attached = lisatud { $path }

engine-evidence-cli-verify-with = kontrolli käsuga: kshana evidence verify { $out } --pubkey <signer public key>

engine-interference-map-cli-usage-map =
    kasutus: kshana interference-map adsb <input.csv|trace.json[.gz]|dir> --dataset <adsb-lol|custom> --out <dir> [--cell-deg <deg>]
    { "   " }või: kshana interference-map ais <input.csv> --dataset <noaa-marinecadastre|kystverket|custom> --out <dir> [--land <land.geojson>] [--cell-deg <deg>]
    { "   " }või: kshana interference-map daily <input.csv|trace.json[.gz]|dir> --dataset <adsb-lol|custom> --day <YYYY-MM-DD> --out <dir> [--cell-deg <deg, { $lit_0_5 } or coarser>] [--bbox <south,west,north,east>] [--delay-hours <24 or more>]
    { "   " }või: kshana interference-map sensitivity <input.csv|trace.json[.gz]|dir> --dataset <adsb-lol|custom> --day <YYYY-MM-DD> --out <report.json> [--bbox <south,west,north,east>]
    { "   " }või: kshana interference-map fetch-land --out <land.geojson> --allow-network
    { "   " }(--dataset custom vajab lisaks --licence <text> --licence-url <url> --attribution <text>)

engine-interference-map-cli-usage-route = kasutus: kshana route-exposure --route <route.geojson|route.csv> --map <map.geojson|dir> [--map ...] [--from <YYYY-MM-DD>] [--to <YYYY-MM-DD>] [--out <report.json>] [--json]

engine-interference-map-cli-col-date = kuupäev

engine-interference-map-cli-col-src = allikas

engine-interference-map-cli-col-degraded = halvenenud

engine-interference-map-cli-col-not-degraded = halvenemata

engine-interference-map-cli-col-unassessed = hindamata

engine-interference-map-cli-col-not-observed = vaatlemata

engine-bench-cli-usage =
    kasutus: kshana bench spec
    { "   " }või: kshana bench truth --task a --data <extracted JammerTest 2024 dir> --split <dev|test|holdout|all> --out <truth.json>
    { "   " }või: kshana bench cases --task <c|d> --split <dev|test|holdout> --out <dir> [--clocks <clocks.txt>] [--scale <0..1>] [--seed-file <file>]
    { "   " }või: kshana bench score --truth <truth.json> --predictions <predictions.json> [--threshold <x>] [--out <result.json>]
    { "   " }või: kshana bench baseline --task <a|b|c|d> --split <dev|test|holdout> --out <dir> [--data <dir>] [--clocks <clocks.txt>] [--scale <0..1>] [--seed-file <file>]
    { "   " }või: kshana bench seal --task <a|b|c|d> --seed-file <file> [--new]
    { "   " }või: kshana bench reveal-check --task <a|b|c|d> --seed-file <file> --commitment <hex>
    { "   " }või: kshana bench manifest --task a --data <extracted dir> [--archive <tar.gz>] --out <manifest.json>
    { "   " }või: kshana bench verify-manifest <manifest.json> --root <dir>
    { "   " }või: kshana bench validate <result.json>...
    { "   " }või: kshana bench leaderboard [<results dir|result.json>...] --out <page.html> [--fragment]   (sisendeid ei ole: tühi olek; --fragment: manustatav jaotis)
    { "   " }(algväärtusefail hoiab suletud holdout'i taga olevat saladust; hoia see versioonihaldusest väljas)

engine-bench-cli-match = kattub

engine-bench-cli-valid = { $f }: kehtiv

engine-bench-cli-folders = { $n } kausta

engine-bench-cli-unpinned = kinnitamata: { $rel }

engine-bench-cli-missing = puudub: { $rel }

engine-bench-cli-mismatch-line = MISMATCH: { $rel }

engine-osnma-cli-usage =
    kasutus: kshana osnma verify <input> [options]

    { "  " }<input>                    I/NAV leheküljed: lihtvorming (vt docs/OSNMA.md) või
    { "                             " }avaldatud testvektorite CSV-paigutus
    { "  " }--format pages|vector-csv|ubx
    { "                             " }sisendi paigutus (vaikimisi: faili sisu järgi). ubx on u-blox
    { "                             " }baidivoog UBX-RXM-SFRBX sõnumitega (Galileo E1-B)
    { "  " }--start-gst SECONDS        vektori-CSV algusaeg GST sekundites
    { "                             " }(vaikimisi: loetakse failinimest, näiteks 16_AUG_2023_GST_05_00_01.csv)
    { "  " }--merkle-root HEX          usaldatud Merkle'i juur (64 kuueteistkümnendnumbrit) DSM-PKR kontrollideks
    { "  " }--public-key ID:TYPE:HEX   usaldatud avalik võti, TYPE p256 või p521, tihendatud punkt
    { "  " }--reference-time SECONDS   praegune aeg GST sekundites sõltumatust allikast. Üks
    { "                             " }hetk: sellest kaugemal asuvad alamkaadrid, kui lubatud tolerants, jäetakse
    { "                             " }kõrvale, seega kasuta seda otse- või äsja salvestatud andmete jaoks
    { "  " }--max-time-error SECONDS   alamkaadri suurim kaugus võrdlusajast, alla
    { "                             " }30 (vaikimisi 29); vajab võtit --reference-time
    { "  " }--epochs                   väljastab ka iga märgi tulemuse
    { "  " }--json                     väljastab teksti asemel JSON-i

    Väljumisolek: 0 tehtud, 2 kasutus- või sisendiviga, 3 mõne satelliidi andmete kontroll ebaõnnestus.

engine-iq-cli-usage =
    kasutus: kshana iq scene   <out> --rate <hz> --duration <s> --signal <name> --prn <list> [--doppler <list>] [--cn0 <dbhz>] [--noise-figure <db> | --no-noise] [--seed <n>] [--data] [--center <hz>] [--if <hz>] [--format <fmt>|sigmf|sdrx[:ci16_le]] [--truth <path>] [--truth-format csv|jsonl] [--threads <n>]
    { "   " }või: kshana iq scene   <out> --rate <hz> --window <s> --nav <rinex_nav> --rx-pos lat,lon,alt [--start <tow_s>] [--prn <list>] [--mask <deg>] [--cn0 <dbhz>] [--no-noise] [--format <fmt>|sigmf|sdrx[:ci16_le]]
    { "   " }või: kshana iq acquire <recording> --signal <name> --prn <list> [--coherent <N>] [--noncoherent <M>] [--doppler-max <hz>] [--doppler-step <hz>] [--pfa <p>] [--json <out>] [--csv <out>] [--surface <path> [--surface-format csv|json|bin]]
    { "   " }või: kshana iq track   <recording> --signal <name> --prn <list> [--design <file.toml> [--design-name <n>]] [--pll-bw <hz>] [--fll-bw <hz>] [--dll-bw <hz>] [--spacing <chips>] [--extra-taps <chips,...>] [--coherent <N>] [--reacquire] [--threads <N|auto>] [--max-seconds <s>] [--acq-coherent <N> (vaikimisi auto, ≈4 ms koherentne)] [--acq-noncoherent <M>] [--doppler-max <hz>] [--epochs <path> [--epochs-format csv|jsonl|bin]] [--events <path>] [--summary <path>] [--json <out>] [--csv <out>]
    { "   " }või: kshana iq sweep   <recording> --signal <name> --prn <list> (--design <file.toml> | [--pll-bw <list>] [--dll-bw <list>] [--spacing <list>] [--coherent <list>]) [--reacquire] [--threads <N|auto>] [--max-seconds <s>] [--doppler-max <hz>] [--epochs <path>] [--events <path>] [--json <out>] [--csv <out>]
    { "   " }või: kshana iq labfit  <scenario.toml> [--out-prefix <prefix>]
    { "   " }või: kshana iq campaign <campaign.toml> [--out <dir>] [--workers <n>] [--no-resume] [--max-cells <n>] [--dry-run] [--json <out>]
    { "   " }või: kshana iq campaign report <out-dir>
    { "   " }või: kshana iq conditions <test-conditions.toml|json>
    { "   " }või: kshana iq frontend <in> <out> [--bandpass lo,hi] [--notch] [--blank <thr>] [--excise] [--agc] [--bits <n>] [--out-format <fmt>]
    { "   " }või: kshana iq monitor <recording> [--power] [--spectral] [--settings <toml|json>] [--baseline <s>] [--signal <name> --prn <list> [--spacing <chips>] [--pll-bw <hz>] [--fll-bw <hz>] [--dll-bw <hz>] [--coherent <N>] [--cn0-windows <M>] [--doppler-max <hz>]] [--max-seconds <s>] [--follow [--idle-timeout <s>]] [--json <out>] [--csv <prefix>]
    { " " }labfit stsenaariumid: salvestuste [[runs]] vastuvõtja logidest või [input] campaign = "<out-dir>", mis nimetab kshana iq campaign väljundkausta (stsenaariumifaili suhtes)
    { " " }ahelakujundused: kshana.loop-design/1 TOML-fail (docs/design/LOOP-DESIGN-TOML.md); selgesõnalised ahela-/hõivamislipud tühistavad valitud kujunduse
    { " " }acquire/track/sweep võtavad ka sisendastme lipud [--bandpass lo,hi] [--notch] [--blank <thr>] [--excise] [--agc] [--bits <n>], mida rakendatakse enne töötlemist (nii hõivamisele kui ka jälgimiskäigule)
    { " " }stseeni kanali häälestused: [--iono-stec <tecu> | --iono-vtec <tecu> | --iono-klobuchar] [--tropo [--tropo-doy <n>]] [--s4 <v> [--scint-tau0 <s>]] [--sigma-phi <rad>] [--multipath-height <m> [--multipath-ground dry|wet|sea]] [--land-mobile] [--nlos]
    { " " }stseeni C/N0 profiil: [--cn0-profile <toml>] ajas muutuvad C/N0 nihked satelliidi kohta (aste, tõus, punktid, hääbumine), rakendatuna kanali peale; tõe cn0_dbhz järgib seda
    { " " }salvestuse/toorsisendi puhul ilma kõrvalfailita on lisaks: --format <format> --rate <hz> [--center <hz>] [--if <hz>] [--header <bytes>] [--channels <n>]; mitmevoolised sisendid võtavad --channel <k>
    { " " }signaalid: gps-l1ca gps-l5i gps-l5q gps-l2c galileo-e1b galileo-e1c galileo-e5a-i galileo-e5a-q beidou-b1i beidou-b1c glonass-l1of lunanet-afs-i lunanet-afs-q
    { " " }<list> on komadega eraldatud loend (üks --prn kohta või üks väärtus, mida rakendatakse kõigile)

engine-iq-cli-usage-error = kasutusviga: { $m }

engine-iq-io-cli-usage =
    kasutus: kshana iq inventory <dir> [--recursive] [--no-hash] [--workers <n>] [--json <out.json>] [--csv <out.csv>]
    { "   " }või: kshana iq info <recording>
    { "   " }või: kshana iq extract <in> <out> --start <s> --duration <s> [--to <format>]
    { "   " }või: kshana iq convert <in> <out> --to <format> [--gain <g>]
    { "   " }või: kshana iq decimate <in> <out> (--factor <d> | --up <l> --down <m>) [--to <format>] [--if-hz <hz>] [--invert]
    { " " }toorsisendid ilma kõrvalfailita võtavad ka: --format <format> --rate <hz> [--center <hz>] [--if <hz>] [--header <bytes>] [--channels <n>]
    { " " }mitmevoolised sisendid (mitmekanaliline SigMF, põimitud toor) võtavad --channel <k> (alates 0-st; vaikimisi 0)
    { " " }vormingud: ci8 cu8 ci16_le ci16_be cu16_le cu16_be cf32_le cf32_be, 12-bitine 16-s ci12r_le ci12l_be cu12r_le ..., pakitud 4-bitine ci4_msb cu4_lsb ..., pakitud 2-bitine c2tc_msb c2sm_lsb r2ob_msb ..., 2-bitine baidi kohta c2sm_byte ..., reaalne r..., Q-ees ..._qi

engine-telemetry-cli-usage =
    kasutus: kshana trust-telemetry [options]
    { "  " }sisend (vaikimisi: JSON-read stdin'ist):
    { "    " }--input <file|->         loe JSON-read failist või `-` stdin'i jaoks
    { "    " }--result <result.json>   esita uuesti `kshana receiver-trust` tulemusfaili epohhid
    { "  " }Prometheus:
    { "    " }--listen <addr:port>     teenindab /metrics (vaikimisi 127.0.0.1:9464, kui muud väljundit ei valita)
    { "    " }--print-metrics          väljastab lõpliku eksponeeringu stdout'i sisendi lõpus
    { "    " }--hold                   jätkab teenindamist pärast sisendi lõppu
    { "    " }--expose-position        avaldab vastuvõtja teatatud positsiooni ka mõõdikutena (vaikimisi väljas)
    { "  " }syslog (CEF või LEEF RFC 5424 ümbrises):
    { "    " }--syslog-udp <host:port> | --syslog-tcp <host:port> | --print-syslog
    { "    " }--syslog-octet-counting  raamistab TCP-sõnumid oktettide loendusega (RFC 6587), mitte ühe rea kaupa
    { "    " }--format cef|leef        sisukeel (vaikimisi cef)
    { "    " }--syslog-all             üks sündmus epohhi kohta (vaikimisi: üks riba muutuse kohta)
    { "    " }--host <name>            seadme hostinimi sündmustes (vaikimisi `kshana`)
    { "  " }Home Assistant / NTP seade (JSON olek + MQTT avastus; ainult avaldamine, ilma volituste ja TLS-ita):
    { "    " }--mqtt-tcp <host:port>   avalda kohalikule MQTT 3.1.1 vahendajale (säilitatud sõnumid, QoS 0)
    { "    " }--print-mqtt             väljastab sõnumid ridadena `topic<TAB>payload`
    { "    " }--mqtt-prefix <p>        oleku teema eesliide (vaikimisi kshana/trust); --mqtt-node <id> (vaikimisi kshana)
    { "    " }--mqtt-discovery <p>     Home Assistant avastuse eesliide (vaikimisi homeassistant)
    { "  " }OpenTelemetry (ehita võtmega --features otlp):
    { "    " }--otlp <http://host:4318/v1/metrics>  --otlp-every <epochs> (vaikimisi 10)

engine-jammertest-cli-usage =
    kasutus:
    { "  " }kshana jammertest import --attack-log <scenario.json> [--time-shift-h <h>] (--log-start <time> | --log <file> --format <fmt>)
    { "  " }kshana jammertest import --catalog <testcatalog.json> --plan <plan.json> [--plan <plan.json> ...]
    { "        " }[--location <n>] (--log-start <YYYY-MM-DDTHH:MM:SSZ> | --log <file> --format <ubx|rinex|android|nmea>)
    { "        " }[--local-offset-h <h>] [--year <y>] [--out <events.toml>]
    { "  " }kshana jammertest score <session.toml> --attack-log <scenario.json> [--time-shift-h <h>] [same options]
    { "  " }kshana jammertest score <session.toml> --catalog <testcatalog.json> --plan <plan.json> [--plan ...]
    { "        " }[--location <n>] [--log-start <time>] [--local-offset-h <h>] [--year <y>]
    { "        " }[--recover-hold-s <s>] [--guard-s <s>] [--json]
    { "        " }[--key <keyfile> --out <dir> [--title <t>] [--created-utc <time>|none]]
    Plaan ja kataloog on avaldatud NPRA/jammertest-plan JSON-failid (MIT; hangi need käsuga
    xval/jammertest-plan/fetch.sh). Plaani ajad on kohalik seinakella aeg; --local-offset-h (vaikimisi 2, CEST)
    ütleb, kui kaugel need UTC-st on. JammerTest 2024 andmekogu attack_log tempel ütleb Z, kuid on kohalik
    aeg: --time-shift-h vaikeväärtus on -2. Sündmused on planeeritud tõde, mitte salvestatud eetriajad.
    Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade.

engine-nmea-synth-cli-usage =
    kasutus: kshana nmea-scenario <scenario.toml> [options]

    Kirjutab või voogedastab sünteetilise sillal kasutatava NMEA 0183 komplekti (GGA RMC VTG GSV GSA GNS ZDA HDT VBW)
    skriptitud segamis-/spuufimissündmustega laevatrajektoorile ning juhendaja logi.
    Ainult koolituseks ja katsetamiseks: ära kunagi suuna seda laeva tegelikele navigatsioonisüsteemidele.

    valikud:
    { "  " }--out <file.nmea>          kirjuta voog faili (vaikimisi <name>.nmea, kui võrguväljundit
    { "                             " }ei ole antud)
    { "  " }--instructor-log <prefix>  kirjuta <prefix>.json ja <prefix>.txt (vaikimisi: faili
    { "                             " }kõrvale, muidu <name> praeguses kataloogis)
    { "  " }--tcp <addr:port|port>     teenindab voogu üle TCP (ootab esmalt klienti); ainult
    { "                             " }port kuulab ainult aadressil 127.0.0.1. Autentimist ei ole:
    { "                             " }igaüks, kes aadressini jõuab, saab voogu lugeda
    { "  " }--udp <addr:port|port>     saadab ühe lause UDP-datagrammi kohta sellele aadressile; ainult
    { "                             " }port saadab aadressile 127.0.0.1
    { "  " }--broadcast                lubab --udp kasutada leviedastusaadressi
    { "  " }--wait-clients <n>         kliente, mida oodata enne TCP-voo algust (vaikimisi 1)
    { "  " }--realtime                 tempo reaalajas (vaikimisi võrguväljundile)
    { "  " }--speed <x>                tempo x korda reaalajas; 0 on nii kiiresti kui võimalik
    { "                             " }(vaikimisi failidele)
    { "  " }--seed <n>                 asenda stsenaariumi algväärtus
    { "  " }--no-marker                jäta sünteetiliste andmete markerlause ära

engine-live-io-usage =
    kasutus: kshana receiver-trust live <session.toml> [--stdin | --file <path> [--follow] [--from-end] | --tcp <host:port> | --udp <[addr:]port> | --serial <device> [--baud <n>]] [--replay] [--gate [--listen tcp:[<addr>:]<port>]] [--json <path|->] [--pksht <path|->]

    Loeb NMEA 0183 (vaikimisi stdin'ist), skoorib laeva fiksatsiooni iga epohhi 0-100 ja kirjutab ühe
    JSON-rea epohhi kohta (vaikimisi stdout'i). Võtmega --gate suunatakse NMEA voog hoopis stdout'i
    läbi: muutmata, kuni fiksatsiooni usaldatakse, ja fiksatsioon kehtetuks märgitud, kui ei usaldata; igale
    tsüklile järgneb $PKSHT lause; JSON läheb siis ainult sinna, kuhu --json ütleb. Sessioon on
    stsenaariumi .toml koos [platform] kind = "vessel"; selle [log] tabelit ei ole vaja.

    --listen (koos --gate) teenindab väravdatud voogu suvalisele arvule TCP-klientidele (näiteks
    kaardiplotter) stdout'i kirjutamise asemel; vaikeaadress on loopback. Klient, kes
    sammu ei pea, visatakse välja, nii et see ei takista kunagi teisi ega sisendit.

    Vastuvõtja aega kontrollitakse ka selle arvuti kella suhtes, mis on mõttekas ainult
    reaalajas saabuva voo puhul; salvestatud logi puhul, mis söödetakse sisse kiiremini (stdin, tcp, udp), anna
    --replay, ja lihtne --file (ilma --follow) teeb seda juba.

    --serial loeb jadaseadet või USB-seadet (ainult Unix), ainult lugemiseks: see avab seadme lugemiseks, seab
    kohaliku liini toorrežiimi kiirusele --baud (vaikimisi 4800, NMEA 0183 kiirus) ega kirjuta kunagi baiti
    vastuvõtjasse. Kshana ei seadista vastuvõtjaid; sea vastuvõtja NMEA-d väljastama selle enda tööriistaga.

    See on nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC 61108, IEC 61162):
    laeva navigeerimise eest vastutab jätkuvalt operaator.

engine-tle-warning = hoiatus: { $w }

engine-e-animation-no-time-series-to-animate = animeeritavat ajajada ei ole: tulemus { $k } ei kanna diskreetitud ajatelge (vt docs/ANIMATION.md, milliseid kujusid eksportija tunneb)

engine-animation-svg-sub = liik { $kind } · { $t0 } kuni { $t1 } · loendid failist result.json, joonistatud ilma ümberdiskreetimiseta · Kshana { $version }

engine-animation-svg-strip-events = sündmused

engine-animation-svg-strip-phases = faasid

engine-animation-svg-waterfall = juga: { $title } [{ $unit }], aeg kulgeb allapoole, värv { $lo } kuni { $hi }

engine-animation-svg-mhz = { $f } MHz

engine-animation-epoch-index = epohhi indeks

engine-animation-svg-desc = { $kind } käivituse animeeritud ajajada: { $n_panels } paneel(i), { $n_events } sündmus(t), { $n_phases } faas(i). Iga punkt on käivituse result.json loend.

engine-animation-html-title = { $title } — Kshana animatsioon

engine-animation-html-sub = liik { $kind } · { $n } jada failist result.json, joonistatud ilma ümberdiskreetimiseta · Kshana { $version }

engine-animation-html-playback = Esitus

engine-animation-html-play = Esita

engine-animation-html-pause = Peata

engine-animation-html-mission-time = Missiooniaeg

engine-animation-html-speed = kiirus

engine-animation-html-playback-speed = Esituskiirus

engine-animation-html-events = Sündmused

engine-animation-html-footer-keys = Tühik esitab või peatab, nooleklahvid astuvad, Home ja End hüppavad. See on käivituse enda loendite renderdus: see on täpselt sama hea kui käivitus ega lisa tõendeid (MODELLED, sisemine kooskõla).

engine-animation-html-footer-determinism = Sama stsenaarium, algväärtus ja valikud annavad baidi kaupa identse faili.

engine-animation-html-exports-heading = Selle esitaja kõrvale kirjutatud eksportfailid

engine-animation-js-phases-and-events = faasid ja sündmused

engine-animation-js-waterfall = juga: { $title } [{ $unit }], aeg kulgeb allapoole

engine-animation-js-now = t = { $time }

engine-animation-js-phase = faas: { $name }

engine-e-evidence-bundle-bad-log-slice = vigane logilõik: { $s }

engine-e-evidence-bundle-bad-window = vigane aken: { $s }

engine-e-evidence-bundle-bad-creation-time = vigane loomisaeg: { $s }

engine-e-evidence-bundle-bad-timestamp-token = vigane ajatempli märk: { $s }

engine-e-evidence-bundle-cannot-serialise = serialiseerimine ebaõnnestus: { $s }

engine-e-osnma-page-not-valid-hex = lehekülg ei ole kehtiv kuueteistkümnendkuju

engine-e-osnma-page-time-outside-week-number = lehekülje aeg jääb väljapoole Galileo nädalanumbri 4096 nädalat

engine-e-osnma-page-bad-length = leheküljel on { $n } kuueteistkümnendnumbrit, oodatud 60

engine-e-osnma-page-malformed-line = vigase kujuga lehekülje rida: { $s }

engine-e-interchange-encode-payload = kasuliku koormuse kodeerimine ebaõnnestus: { $e }

engine-e-interchange-invalid-envelope = ei ole kehtiv vahetusümbrik: { $e }

engine-e-interchange-not-kshana-artifact = ei ole Kshana artefakt: vorming on { $found }, oodatud { $expected }

engine-e-interchange-incompatible-schema-version = ühildumatu skeemiversioon { $v } ({ $verdict }); see mootor kõneleb versiooni { $current }

engine-e-interchange-payload-mismatch = kasulik koormus ei vastanud nõutud tüübile: { $e }

engine-e-interop-not-applicable = ei kohaldu: { $why }

engine-e-iq-io-error = I/O viga: { $m }

engine-e-iq-format-error = vormingu viga: { $m }

engine-e-iq-signals-prn-not-defined = { $signal }: PRN { $prn } ei ole ICD-s määratletud

engine-e-iq-signals-glonass-channel-outside = GLONASS sageduskanal { $k } on väljaspool vahemikku -7..=6

engine-e-iq-signals-code-table = koodi tabel: { $m }

engine-e-kepler-out-of-domain = Kepleri võrrand: M või e väljaspool määramispiirkonda

engine-e-kepler-no-convergence = Kepleri võrrand ei koondunud { $iters } sammuga (jääk { $residual })

engine-e-lunar-orientation-epoch-outside-series = epohh { $t } Juliuse sajandit J2000-st on väljaspool DE440 Kuu orientatsiooni rida ({ $first } .. { $last }, 2014-01-01 .. 2030-12-31 TDB)

engine-e-propagator-sgp4-error = SGP4 propageerimise viga (kood { $code })

engine-e-integrator-dop853-stopped = DOP853 peatus hetkel t = { $t } ({ $failure }) pärast { $accepted } sammu

engine-e-portable-distr-variance-non-finite = normaaljaotuse dispersioon ei ole lõplik

engine-e-portable-distr-shape-not-positive = gammajaotuse kujuparameeter ei ole positiivne

engine-e-portable-distr-scale-not-positive = gammajaotuse skaalaparameeter ei ole positiivne

engine-bench-tasks-clock-line-before-header = kellarida tuleb enne mis tahes `@<PRN>` päist

engine-api-html-clock = Kell

engine-api-html-fom-heading = Tulemusnäitajad

engine-api-html-metric = Näitaja

engine-api-html-value = Väärtus

engine-api-html-validation = Valideerimine

engine-api-html-tier-note = Iga tulemusnäitaja on märgitud kas VALIDATED (kontrollitud välise oraakli vastu) või MODELLED (esimestest printsiipidest, sisemiselt testitud), tuletatud kontrollimaatriksist.

engine-api-html-default-title = Kshana — stsenaariumi tulemus

engine-api-html-study-title = { $title } — Kshana

engine-api-html-eyebrow = क्षण · täpne hetk

engine-api-html-tagline = Hübriid-kvant/klassikalise PNT jõudluse tulemuskaart

engine-api-html-chart-alt = Tulemuse diagramm

engine-api-html-full-result = Täielik tulemus (JSON)

engine-api-html-footer-generated = Genereerinud Kshana { $version }.
