# SPDX-License-Identifier: AGPL-3.0-only
# fi catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = tuntematon kellolokin muoto { $other }; odotettiin yhtä seuraavista: { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = tuntematon aukkokäytäntö { $other }; odotettiin arvoa refuse, longest tai linear

engine-e-clock-log-give-either-the-log-text = anna joko lokin teksti tai sen polku, ei molempia

engine-e-clock-log-clock-log-needs-its-text = kellolokille on annettava teksti tai polku

engine-e-clock-log-tau0-must-be-finite-and = tau0_s on oltava äärellinen ja > 0 (saatiin { $t })

engine-e-clock-log-units-and-data-apply-to = units ja data koskevat vain timelab-muotoa

engine-e-clock-log-channel-applies-to-the-ticc = channel koskee vain ticc-muotoa

engine-e-clock-log-cannot-read-clock-log = kellolokia { $path } ei voi lukea: { $e }

engine-e-clock-log-clock-log-path-is-not = kellolokin polku ei ole käytettävissä WebAssembly-versiossa; anna loki tekstinä

engine-e-clock-log-the-log-has-missing-epoch = { $format }-lokissa on puuttuvia epookkeja: { $n_missing }, aukkoja: { $n_gaps }, ruudukon askel { $tau0 } s; aseta gaps = "longest" säilyttääksesi pisimmän aukottoman jakson tai gaps = "linear" interpoloidaksesi

engine-e-clock-log-the-log-yields-usable-sample = { $format }-lokista saadaan käyttökelpoisia näytteitä: { $x }; vähintään 3 tarvitaan

engine-e-clock-log-not-rinex-clock-file-no = ei ole RINEX-kellotiedosto: END OF HEADER -tietuetta ei ole

engine-e-clock-log-the-rinex-clock-file-has = RINEX-kellotiedostossa ei ole AS- tai AR-tietueita

engine-e-clock-log-the-rinex-clock-file-holds = RINEX-kellotiedostossa on kelloja: { $many }; nimeä yksi arvolla clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = kellolle { $id } ei ole AS- tai AR-tietueita

engine-e-clock-log-the-clock-has-single-epoch = kellolla on vain yksi epookki; tau0:aa ei voi määrittää

engine-e-clock-log-the-log-has-no-readings = { $format }-lokissa ei ole lukemia

engine-e-clock-log-unknown-phase-unit-expected-ms = tuntematon vaiheen yksikkö { $other }; odotettiin yksikköä s, ms, us, ns tai ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab-rivillä { $v1 } on sarakkeita: { $v }, ensimmäisellä datarivillä: { $first }

engine-e-clock-log-timelab-line-has-columns-one = TimeLab-rivillä { $v1 } on sarakkeita: { $v }; luetaan yksi (arvo) tai kaksi (aika arvo)

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab-rivi { $v1 } ei ole numeerinen: { $l }

engine-e-clock-log-the-timelab-log-has-no = timelab-lokissa ei ole lukemia

engine-e-clock-log-unknown-data-expected-phase-or = tuntematon data { $other }; odotettiin arvoa phase tai frequency

engine-e-clock-log-tau0-header-is-not-positive = tau0-otsake { $v } ei ole positiivinen sekuntimäärä

engine-e-clock-log-frequency-data-is-fractional-frequency = taajuusdata on suhteellista taajuutta; sen yksikkö voi olla vain 1

engine-e-clock-log-two-column-frequency-logs-are = kaksisarakkeisia taajuuslokeja ei lueta; anna taajuus yhtenä sarakkeena ja tau0

engine-e-clock-log-unknown-time-units-expected-or = tuntematon time_units { $o }; odotettiin arvoa s tai mjd

engine-e-clock-log-the-timelab-log-time-column = timelab-lokin aikasarakkeen on kasvettava

engine-e-clock-log-single-reading-tau0-cannot-be = vain yksi lukema; tau0:aa ei voi määrittää

engine-e-clock-log-the-timelab-log-has-non = timelab-lokissa on ei-äärellisiä lukemia: { $non_finite }

engine-e-clock-log-the-ticc-log-holds-channels = TICC-lokissa on kanavat { $many }; nimeä yksi arvolla channel = "..."

engine-e-clock-log-no-readings-on-channel-found = kanavalla { $channel } ei ole lukemia (löytyi { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC-intervallitilan rivit eivät sisällä aikaa; anna tau0_s (tapahtumajakso)

engine-e-clock-log-the-readings-do-not-increase = { $channel }-lukemat eivät kasva, joten ne eivät ole aikaleimoja (TICC Period -tilan tulostetta ei lueta; käytä Timestamp-tilaa)

engine-e-clock-log-single-time-stamp-tau0-cannot = vain yksi aikaleima; tau0:aa ei voi määrittää

engine-e-clock-log-two-time-stamps-apart-under = kaksi { $channel }-aikaleimaa { $w } s:n päässä toisistaan, alle puolet tau0-arvosta = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = { $format }-aikaleimat kellolle { $clock } kulkevat taaksepäin (daemon käynnistyi uudelleen tai kello hyppäsi); jaa loki ja lue kukin osa erikseen

engine-e-clock-log-the-log-has-no-readings-2 = lokissa ei ole { $what }-lukemia

engine-e-clock-log-the-log-holds-sources-name = lokissa on lähteitä: { $many }; nimeä yksi arvolla { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = kohteelle { $id } ei ole { $what }-lukemia (löytyi { $names })

engine-e-clock-log-the-servo-of-never-reached = kohteen { $id } servo ei koskaan saavuttanut lukittua tilaa s2

engine-e-clock-log-the-log-has-no-chrony = lokissa ei ole chrony-seurantalukemia

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = näytteenottotaajuus { $fs_hz } Hz ei ole kokonaislukumäärä näytteitä millisekunnissa

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms:n ja noncoherent:n on oltava positiivisia

engine-e-acquisition-the-doppler-grid-needs-positive = Doppler-ruudukko vaatii positiivisen askelen ja ei-negatiivisen enimmäisarvon

engine-e-acquisition-pfa-must-lie-in = pfa:n on oltava välillä (0, 1)

engine-e-acquisition-samples-supplied-needed = näytteitä annettu: { $samples }, tarvitaan: { $needed }

engine-e-acquisition-empty-doppler-grid = tyhjä Doppler-ruudukko

engine-e-acquisition-the-samples-carry-no-power = näytteissä ei ole tehoa

## src/adm.rs

engine-e-adm-unknown-attitude-type = tuntematon ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = AEM-viestissä on oltava vähintään yksi segmentti

engine-e-adm-segment-is-not-version-attitude = segmentti { $i }: { $t } ei ole version { $version } asentotyyppi

engine-e-adm-segment-values-for = segmentti { $i }: arvojen määrä { $values }, tyyppi { $t }

engine-e-adm-aem-version-has-no-ndm = AEM-versiolla 1.0 ei ole tässä NDM/XML-muotoa; kirjoita KVN

engine-e-adm-this-attitude-type-has-no = tällä asentotyypillä ei ole version 2.0 muotoa

engine-e-adm-expected-meta-start-found = odotettiin META_START, löytyi { $l }

engine-e-adm-meta-start-without-meta-stop = META_START ilman META_STOP

engine-e-adm-unexpected-metadata-line = odottamaton metadatarivi { $other }

engine-e-adm-in-version-aem = { $att } AEM-viestissä, jonka versio on { $version }

engine-e-adm-expected-data-start-after-meta = odotettiin DATA_START rivin META_STOP jälkeen

engine-e-adm-data-start-without-data-stop = DATA_START ilman DATA_STOP

engine-e-adm-empty-data-line = tyhjä datarivi

engine-e-adm-values-on-line = { $att }-rivillä arvojen määrä { $vals }: { $b }

engine-e-adm-unexpected-data-line = odottamaton datarivi { $other }

engine-e-adm-attitude-type-has-no-xml = asentotyypillä ei ole XML-muotoa

engine-e-adm-message-without-version-attribute = viesti ilman version-attribuuttia

engine-e-adm-expected-found = odotettiin { $vers_key }, löytyi { $other }

engine-e-adm-header-without-creation-date-or = otsakkeessa ei ole CREATION_DATE- tai ORIGINATOR-kenttää

engine-e-adm-missing = puuttuu { $k }

engine-e-adm-unexpected-keyword = odottamaton avainsana { $k }

engine-e-adm-spin-block-holds-nutation-or = spin-lohko sisältää nutaatio- tai liikemäärädataa, ei molempia

engine-e-adm-unexpected-apm-keyword = odottamaton APM-avainsana { $other }

engine-e-adm-unexpected-apm-line = odottamaton APM-rivi { $b }

engine-e-adm-without = { $b } ilman { $stop }

engine-e-adm-unexpected-line-in = odottamaton rivi lohkossa { $b }: { $other }

engine-e-adm-incomplete-group = puutteellinen ryhmä { $keys }

engine-e-adm-unknown-apm-block-start = tuntematon APM-lohko { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM-metadata vaatii kentät OBJECT_NAME, OBJECT_ID ja TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM ilman EPOCH-kenttää

engine-e-adm-rotation-axis = pyörimisakseli { $o }

engine-e-adm-values-for = { $t }: arvojen määrä { $values }

engine-e-adm-euler-record-without-euler-rot = Euler-tietue ilman EULER_ROT_SEQ-kenttää

engine-e-adm-rotation-sequence = kiertojärjestys { $seq }

engine-e-adm-epoch-has-no = epookissa { $s } ei ole 'T'-merkkiä

engine-e-adm-epoch-date = epookin päivämäärä { $date }

engine-e-adm-epoch-time = epookin aika { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = ”{ $s }” (teksti sellaisena kuin dokumentti sen esittää)

engine-advanced-report-mean-5th-to-95th-percentile = keskiarvo { $fmt_num } (5. - 95. persentiili { $fmt_num2 } - { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = kenttäyksiköiden skeema: units-merkintä `{ $key }`

engine-advanced-report-field-units-schema-input-entry = kenttäyksiköiden skeema: input-merkintä `{ $key }`, yhdistetty kentän nimen perusteella

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] ei-numeerisen sarakkeen { $n } rivi
       *[other] ei-numeerisen sarakkeen { $n } riviä
    }

engine-advanced-report-rows-from-to = rivejä { $nums }, arvosta { $fmt_num } arvoon { $fmt_num2 }

engine-advanced-report-phase-ended-by = vaihe { $name } (päättäjä { $ended })

engine-advanced-report-result-timeline-phases = tulos `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = vaihtuminen vaiheeseen { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = tulos `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = skenaarion syöte `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = skenaariotiedoston kommentti, rivi { $start }

engine-advanced-report-scenario-file-comment-lines-to = skenaariotiedoston kommentti, rivit { $start } - { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } on MODELLED, ei todennettu: { $it }.

engine-advanced-report-sweep-of-scale = Pyyhkäisy: { $param } (asteikko: { $str_of })

engine-e-advanced-report-the-result-document-is-not = tulosdokumentti ei ole JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = skenaario ei ole TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Monte Carlo -jakauma: { $metric }

engine-advanced-report-recorded-at-build-time-from = tallennettu käännösvaiheessa ympäristömuuttujasta { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = ei tallennettu: tämä moottori käännettiin ilman ympäristömuuttujaa { $GIT_COMMIT_ENV }; moottorin versio yksilöi julkaisun

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (lajin oma skenaarion sormenjälki; ei tiedoston tiiviste)

engine-advanced-report-input-file = Syötetiedosto { $path }

engine-advanced-report-study-generated = { " " }Tutkimus luotu { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2-rivi { $v1 }: odotettiin 8 pilkulla erotettua saraketta, löytyi { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2-rivi { $v1 }: virheellinen { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2-rivi { $v1 }: ei-äärellinen arvo

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: ei datarivejä

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: rivit ({ $rows }) eivät täytä niiden kattamaa ruudukkoa { $n_lat } x { $n_lon }

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: kaksoiskappale solmusta kohdassa { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = ruudukon askeleen on oltava äärellinen ja positiivinen, saatiin { $step }

engine-e-altpnt-maps-grid-box-must-have-north = ruudukkoalueella on oltava north > south ja east > west, saatiin [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = ruudukko { $n_lat } x { $n_lon } solmua on liian suuri

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: akseli { $what } vaatii vähintään 2 erillistä arvoa

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: akseli { $what } ei ole säännöllinen ({ $w } - { $w2 } keskimääräiseen askeleeseen { $step } nähden)

engine-e-altpnt-maps-error-sigma-must-be-finite = virheen sigman on oltava äärellinen ja ei-negatiivinen, saatiin { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = korrelaatiopituuden on oltava äärellinen ja positiivinen, saatiin { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side on oltava >= 2, saatiin { $n }

engine-e-altpnt-terrain-srtm-hgt-length = SRTM .hgt -tiedoston pituus { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = .hgt-ikkuna vaatii vähintään 2 x 2 näytettä, saatiin { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = askeleen on oltava äärellinen ja positiivinen, saatiin { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt-ikkunan pituus { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: tuntematon magnetic_grid-sarake `{ $other }` (käytä arvoa "sealevel" tai "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: magnetic_grid-csv-polkua { $csv_path } ei voi lukea: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = tuntematon animaatiomuoto '{ $other }'; odotettiin muotoa svg, html, frames tai all

engine-e-animation-no-animation-format-given-expected = animaatiomuotoa ei annettu; odotettiin muotoa svg, html, frames tai all

engine-e-animation-animation-fps-must-be-between = animaation fps:n on oltava välillä 1 - 60, saatiin { $fps }

engine-e-animation-animation-duration-must-be-between = animaation keston on oltava välillä 0.5 s - 600 s, saatiin { $duration_s }

engine-e-animation-animation-width-must-be-between = animaation leveyden on oltava välillä 480 - 3840 pikseliä, saatiin { $width }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] kesto x fps antaa { $n } kuvan; kuvasarjan on sisällettävä vähintään 2 ja enintään { $v1 } kuvaa
       *[other] kesto x fps antaa { $n } kuvaa; kuvasarjan on sisällettävä vähintään 2 ja enintään { $v1 } kuvaa
    }

engine-e-animation-result-is-not-json = tulos ei ole JSON: { $e }

engine-animation-mission-time = tehtäväaika ({ $lay })

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (tarvitsee librsvg-tuella käännetyn ffmpegin; muuten rasteroi kuvat ensin)

engine-animation-further-series-were-found-but = { " " }Löytyi lisää sarjoja: { $omitted }, joita ei piirretty (soitin näyttää enintään { $MAX_CHARTS } paneelia, joissa kussakin enintään { $MAX_TRACES } käyrää); ne luetellaan frames-viennin manifestissa.

## src/antenna.rs

engine-antenna-altitude-beamwidth-deg-points = korkeus { $a_lo }-{ $a_hi } m x keilanleveys { $b_lo }-{ $b_hi } deg, pisteet: { $points }

engine-antenna-limb-capture-is-reached-on = reunakaappaus ON saavutettu tällä ruudukolla ({ $grid }): otetuista toimintapisteistä reunan kaappaavia on { $points } / { $points2 } ja löydettyjä akselinylityksiä { $crossings }; suurin otettu reunan J/S on { $limb_js_db } dB korkeudella { $altitude_m } m / keilanleveydellä { $hpbw_deg } deg, kun kaappauskynnys on { $thr } dB.

engine-antenna-limb-capture-is-not-reached = reunakaappausta ei saavuteta missään tällä ruudukolla ({ $grid }) - ei nollakaappausta, vaan ei reunakaappausta: paras reunan J/S on { $limb_js_db } dB korkeudella { $altitude_m } m / keilanleveydellä { $hpbw_deg } deg, { $shortfall } dB alle { $thr } dB:n kaappauskynnyksen; tämä toimintapiste kaappaisi reunan lähetysteholla { $limb_capture_tx_power_dbw } dBW lennetyn { $p_tx_dbw } dBW:n sijaan.

engine-e-antenna-azimuths-must-strictly-increase = atsimuuttien on kasvettava aidosti

engine-e-antenna-azimuths-must-span-less-than = atsimuuttien on kattettava alle 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = akselista poikkeamiskulmien on kasvettava aidosti

engine-e-antenna-gain-grid-does-not-match = vahvistusruudukko ei vastaa akseleita

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = vahvistusten K ja P on oltava äärellisiä ja positiivisia

engine-e-aocs-at-least-three-reaction-wheels = vähintään kolme reaktiopyörää vaaditaan

engine-e-aocs-wheel-spin-axis-must-be = pyörä { $i }: pyörimisakselin on oltava yksikkövektori

engine-e-aocs-wheel-js-and-max-must = pyörä { $i }: js:n ja u_max:n on oltava äärellisiä ja positiivisia

engine-e-aocs-the-wheel-spin-axes-do = pyörien pyörimisakselit eivät viritä kolmea ulottuvuutta

engine-e-aocs-inertia-minus-the-wheels-spin = hitausmomentti vähennettynä pyörien pyörimishitaudella on oltava positiivisesti definiitti

engine-e-aocs-inertia-must-be-finite-and = hitausmomentin on oltava äärellinen ja symmetrinen

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis on oltava nollasta poikkeava äärellinen vektori

engine-e-aocs-kind-must-be-finite-and-positive = { $n } on oltava äärellinen ja positiivinen

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s saa olla enintään 2e6 askelta

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s on oltava dt_s:n kokonaislukukerrannainen

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0:n ja omega0_rad_s:n on oltava äärellisiä

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm on oltava äärellinen

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s on oltava äärellinen

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s on oltava vähintään dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg =
    { $n_w ->
        [one] aocs: { $n_w } pyörä, { $duration_s } s kääntö arvosta { $series_err } deg -> { $settle } | loppu { $final_err } deg | pyörän huippu { $peak_speed } rpm | { $v7 }
       *[other] aocs: { $n_w } pyörää, { $duration_s } s kääntö arvosta { $series_err } deg -> { $settle } | loppu { $final_err } deg | pyörän huippu { $peak_speed } rpm | { $v7 }
    }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = tuntematon palvelu '{ $other }' (odotettiin arvoa navigation|nav tai communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = tuntematon arbitrointikäytäntö '{ $other }' (odotettiin arvoa navigation-priority, communications-priority tai first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = yhteysaikataulussa on oltava vähintään yksi yhteysikkuna

engine-e-aperture-duty-apertures-must-be = apertures on oltava >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = raportointihorisontin on oltava äärellinen

engine-e-aperture-duty-contact-has-non-finite-aos = yhteydellä '{ $name }' on ei-äärellinen aos_s tai los_s

engine-e-aperture-duty-contact-must-have-los-aos = yhteydellä '{ $name }' on oltava los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = yhteysaikataulussa on oltava vähintään yksi [[contacts]]-ikkuna

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: istunnot { $sessions }, aukot { $apertures }, käytäntö { $policy } -> navigoinnin käyttöaste { $navigation_duty }, viestinnän käyttöaste { $communications_duty }, joutilas { $idle_duty }; kilpailun vuoksi menetetty { $total_outage_s } s pyydetystä { $total_requested_s } s:sta (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Tutkimus luotu { $html_escape }.

engine-e-api-failed-to-serialise-report-to = raportin sarjallistaminen JSON-muotoon epäonnistui: { $e }

engine-e-api-invalid-scenario = virheellinen skenaario: { $e }

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] tuntematon skenaarion laji { $other } — tarkoititko { $hint }? `kshana kinds` luettelee kaikki { $n } sisäänrakennetun lajin.
       *[other] tuntematon skenaarion laji { $other } — tarkoititko { $hint }? `kshana kinds` luettelee kaikki { $n } sisäänrakennettua lajia.
    }

engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] tuntematon skenaarion laji { $other }. `kshana kinds` luettelee kaikki { $n } sisäänrakennetun lajin.
       *[other] tuntematon skenaarion laji { $other }. `kshana kinds` luettelee kaikki { $n } sisäänrakennettua lajia.
    }

engine-api-required-fields = - **Pakolliset kentät:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Valinnaiset kentät:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML-jäsennysvirhe: { $e }

engine-api-could-not-classify-scenario-kind = skenaarion lajia ei voitu luokitella: { $e }

engine-api-missing-required-field = { $kind_name }: puuttuvat pakolliset kentät — { $options }

engine-api-missing-required-field-2 = { $kind_name }: puuttuva pakollinen kenttä "{ $entry }"

engine-e-api-invalid-orbit-scenario = virheellinen rataskenaario: { $e }

engine-e-api-sp3-export-requires-an-orbit = SP3-vienti vaatii rataskenaarion, ei '{ $k }'

engine-e-api-omm-export-requires-an-orbit = OMM-vienti vaatii rataskenaarion, ei '{ $k }'

engine-e-api-oem-export-requires-an-orbit = OEM-vienti vaatii rataskenaarion, ei '{ $k }'

engine-e-api-invalid-scenario-toml = virheellinen skenaario-TOML: { $e }

engine-e-api-could-not-re-serialise-scenario = skenaariota ei voitu sarjallistaa uudelleen: { $e }

engine-api-scenario-jamming-availability-under-jamming = skenaario { $r } | häirintä { $v2 } | saatavuus häirinnän aikana { $availability_under_jamming } (nominaali { $availability_nominal }) | pienin seuranta { $min_tracking } | keskimääräinen J/S { $v6 }

engine-e-api-the-result-document-already-carries = tulosdokumentti sisältää jo kentän `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = figure_tiers-kentän sarjallistaminen epäonnistui: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = virheellinen skenaario ({ $label }): { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = skenaario { $r } | kvantti-holdover { $holdover_s }s p95 { $pos_p95_m }m | klassinen holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = skenaario { $r } | harhautus { $scn } vs { $threshold_ns } ns spesifikaatio (P_fa { $target_pfa }) | kvanttiturvallisuus { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | klassinen turvallisuus { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] eheys | { $n_sats } satelliitti | epookit saatavilla { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): eheystapahtumat { $report2 }, HMI { $report3 }
       *[other] eheys | { $n_sats } satelliittia | epookit saatavilla { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): eheystapahtumat { $report2 }, HMI { $report3 }
    }

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | etelänapa | epookit saatavilla { $samples_available }/{ $samples_total } ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | maallinen LTC−TT-nopeus { $secular_rate_us_per_day } µs/day (vaihteluväli { $band_low }–{ $band_high }) | oma potentiaali { $self_potential_us_per_day } kineettinen { $kinetic_us_per_day } | siirtymä @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | kantaviiva { $baseline_km } km | majakan etäisyys { $beacon_range_km } km | viive { $report } µs (muutosnopeus { $delay_rate_s_per_s } s/s) | lähikenttä { $near_field_correction_us } µs | näytteet { $samples } / { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_sat ->
        [one] lunar-joint-od-clock | { $n_sat } satelliitti, maa-asemia { $n_earth } | aseman 3D-virhe VLBI:llä { $station_pos_err_m } m vs vain etäisyys { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× terävämpi) | sat. paikka-RMS { $sat_pos_rms_m } m | aseman kellovirhe { $station_clock_err_s } s | havainnot { $n_obs }/{ $n_params } parametria
       *[other] lunar-joint-od-clock | { $n_sat } satelliittia, maa-asemia { $n_earth } | aseman 3D-virhe VLBI:llä { $station_pos_err_m } m vs vain etäisyys { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× terävämpi) | sat. paikka-RMS { $sat_pos_rms_m } m | aseman kellovirhe { $station_clock_err_s } s | havainnot { $n_obs }/{ $n_params } parametria
    }

engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } piste | siirtovirhe { $trans_err_norm_m } m, kiertovirhe { $rot_err_norm_rad } rad, mittakaavavirhe { $scale_err_ppb } ppb | rms-residuaali { $rms_residual_m } m | suppeni { $converged }
       *[other] lunar-frame-realisation | { $n_points } pistettä | siirtovirhe { $trans_err_norm_m } m, kiertovirhe { $rot_err_norm_rad } rad, mittakaavavirhe { $scale_err_ppb } ppb | rms-residuaali { $rms_residual_m } m | suppeni { $converged }
    }

engine-api-builtins-moonlight-service-volume-sats-pts =
    { $n_sats ->
        [one] moonlight-service-volume | { $n_sats } satelliitti ({ $geometry_label }) | pisteet { $n_grid_points } × epookit { $n_epochs } | kattavuus { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelliitit { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL-saatavuus { $pl_availability_pct }% | MODELLED
       *[other] moonlight-service-volume | { $n_sats } satelliittia ({ $geometry_label }) | pisteet { $n_grid_points } × epookit { $n_epochs } | kattavuus { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelliitit { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL-saatavuus { $pl_availability_pct }% | MODELLED
    }

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemeridi { $report } ({ $provenance }) vaadittu σ_URE { $fmt } vs Kepler { $fmt2 } vs perturboitu { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    { $n_sats ->
        [one] lunar-differential-pnt | { $n_sats } satelliitti (havainnollistava LCNS-luokka, ei sidoksissa) | kantaviiva { $baseline_km } km | käyttäjän virhe { $user_error_uncorrected_m } m → { $user_error_corrected_m } m ({ $reduction_factor }× pienennys) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
       *[other] lunar-differential-pnt | { $n_sats } satelliittia (havainnollistava LCNS-luokka, ei sidoksissa) | kantaviiva { $baseline_km } km | käyttäjän virhe { $user_error_uncorrected_m } m → { $user_error_corrected_m } m ({ $reduction_factor }× pienennys) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
    }

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | pisteet { $n_grid_points } x epookit { $n_epochs } x toistot { $n_trials } | saatavuus { $v4 } % | kattavuus { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | korjattu p{ $percentile } 3D { $f } (korjaamaton { $f2 }) | HPL max { $f3 } | MODELLED; ei väite mistään todellisesta järjestelmästä

engine-api-builtins-terrain-horizon-at-the-station = { " " }| maastohorisontti ({ $sources }) asemalla enintään { $horizon_max_deg } deg, käyttäjäpisteiden keskimääräinen enimmäisarvo { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tila, OEM-rivit { $oem_line_count } | vastaavuus { $v5 } ({ $present_fields } läsnä / { $missing_fields } puuttuu) | OEM edestakainen kierto { $v8 } | aikametan edestakainen kierto { $v9 } | KIF-tavut { $kif_bytes } | MODELLED
       *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } tilaa, OEM-rivit { $oem_line_count } | vastaavuus { $v5 } ({ $present_fields } läsnä / { $missing_fields } puuttuu) | OEM edestakainen kierto { $v8 } | aikametan edestakainen kierto { $v9 } | KIF-tavut { $kif_bytes } | MODELLED
    }

## src/api/builtins.rs

engine-api-builtins-scenario-optical-sync-rms-ps = skenaario { $r } | optinen sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | kvanttiketju { $quantum_chain_sigma_s }s vs klassinen { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | turvallisuus Pd { $security_pd } (Pfa { $monitor_pfa }) | poikkeama Pd { $anomaly_pd } | vertailu kvantti voittaa { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | katko { $outage_s }s | kvantti, paikkavirhe { $quantum_pos_err_m } m vs klassinen { $classical_pos_err_m } m ({ $improvement_x }x) | holdover kvantti { $quantum_holdover_s }s vs klassinen { $classical_holdover_s }s (kynnys { $threshold_m } m) | vertailu kvantti voittaa { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC kvantti { $quantum_auc } vs klassinen { $classical_auc } | pienin havaittava vika kvantti { $quantum_min_detectable } vs klassinen { $classical_min_detectable } | vikaluokat: { $fault_catalog } | vertailu kvantti voittaa { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] koskee vain fusion-lajia

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = skenaario { $r } | kvantti-PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) eheys { $integ } turvallisuus { $security_na } | klassinen PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) eheys { $integ2 } turvallisuus { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = skenaario { $r } | fuusioitu | kvantti-PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) eheys { $integ } turvallisuus { $security_na } | klassinen PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) eheys { $integ2 } turvallisuus { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = skenaario { $r } | hybrid-ukf (17 tilaa, MODELLED) | anturi { $v2 } (q_va { $effective_q_va }) | kello q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } välillä [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } välillä [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | tuettu { $aided_pos_rms_m }m -> vapaa lasku { $coast_end_pos_rms_m }m ajalla { $coast_duration_s }s | sisäinen johdonmukaisuus, ei tarkkuus

engine-api-builtins-scenario-gnss-ins-quantum-outage = skenaario { $r } | gnss-ins | kvantti, katkon RMS fuusioitu { $fused_outage_rms_m }m vs vapaa { $free_outage_rms_m }m (holdover { $holdover_s }s, saatavuus { $availability }) | klassinen fuusioitu { $fused_outage_rms_m2 }m vs vapaa { $free_outage_rms_m2 }m (holdover { $holdover_s2 }s, saatavuus { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = skenaario { $r } | gnss-sim | keskimääräinen iono { $mean_iono_m }m tropo { $mean_tropo_m }m | RAIM-saatavuus { $raim_availability } keskimääräinen HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m vikataajuus { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db =
    { $n_sats ->
        [one] skenaario { $r } | spoof-detect | { $n_sats } SV, +{ $power_advantage_db } dB{ $v4 } | { $push } työntö | fuusiopisteet { $score } (kynnys { $fusion_threshold }) | { $verdict }
       *[other] skenaario { $r } | spoof-detect | { $n_sats } SV:tä, +{ $power_advantage_db } dB{ $v4 } | { $push } työntö | fuusiopisteet { $score } (kynnys { $fusion_threshold }) | { $verdict }
    }

engine-api-builtins-sweep-over-pts-scale-quantum = pyyhkäisy { $metric } parametrin { $parameter } yli ({ $first }..{ $last }, pisteet { $points }, asteikko { $scale }) | kvantti { $first2 }->{ $last2 } | klassinen { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = skenaario { $r } | { $nominal }/{ $series } näytettä GNSS-nominaali | paras PDOP { $fnum } paikka { $posm } | kvantti holdover { $holdover_s }s p95 { $ns1 }ns eheys { $integ } turvallisuus { $security_na } | klassinen holdover { $holdover_s2 }s p95 { $ns12 }ns eheys { $integ2 } turvallisuus { $security_na }

engine-e-api-builtins-ephemeris = efemeridi: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| korkein el { $el }° Doppler-huippu { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] skenaario { $r } | { $source } | { $n_samples } näyte | korkeus { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | nopeus { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] skenaario { $r } | { $source } | { $n_samples } näytettä | korkeus { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | nopeus { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }

engine-api-builtins-generic-sweep-of-over-nodes = yleinen pyyhkäisy lajista `{ $kind }` parametrien [{ $keys }] yli | solmut { $points } (muoto { $shape }) | mittarit [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | vapaan inertiaalinavigoinnin ajautuma { $free_inertial_drift_m } m | gravitaatiovastaavuus { $map_matched_error_m } m | täsmäytyksen sigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| vertailuaste { $reference_nmax } poikkeaman keskihajonta { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| karttavirhe MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% rajan { $target_m } m sisällä

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | vapaan inertiaalinavigoinnin ajautuma { $free_inertial_drift_m } m | maastovastaavuus { $matched_error_m } m ({ $v3 }x pienennys) | täsmäytyksen sigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | reittipisteet { $waypoints } | vapaa inertiaali RMS { $free_inertial_rms_m } m (loppu { $free_inertial_final_m } m) | maastovastaavuus RMS { $matched_rms_m } m (loppu { $matched_final_m } m, { $v6 }x pienennys) | keskimääräinen ESS { $mean_ess }/{ $cfg } | täsmäytyksen sigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | vapaan inertiaalinavigoinnin ajautuma { $free_inertial_drift_m } m | gravitaatio { $gravity_only_m } m magneettinen { $magnetic_only_m } m maasto { $terrain_only_m } m | FUSED { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] vaatii arvon runs = 1: mitattu loki on yksi tietue

engine-api-builtins-scenario-runs-quantum-holdover-p95 = skenaario { $r } | ajot { $runs } | kvantti holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns turvallisuus { $security_na } | klassinen holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns turvallisuus { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = skenaario { $r } | kvantti holdover { $holdover_s }s p95 { $ns1 }ns eheys { $integ } turvallisuus { $security_na } | klassinen holdover { $holdover_s2 }s p95 { $ns12 }ns eheys { $integ2 } turvallisuus { $security_na }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one] { " " }| RAIM saatavilla { $n_available } / { $n_epochs } epookki ({ $n_denied } estetty, { $n_alarm } hälytystä; MODELLED)
       *[other] { " " }| RAIM saatavilla { $n_available } / { $n_epochs } epookkia ({ $n_denied } estetty, { $n_alarm } hälytystä; MODELLED)
    }

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = vertailutapauksessa on oltava vähintään yksi satelliitti

engine-e-araim-reference-reference-case-needs-at-least-2 = vertailutapauksessa on oltava vähintään yksi satelliittitähdistö

engine-e-araim-reference-satellite-names-constellation-but-only = satelliitti { $i } nimeää satelliittitähdistön { $constellation }, mutta ilmoitettu on vain { $constellations }

engine-e-araim-reference-satellite-has-non-positive-error = satelliitin { $i } virhevarianssi ei ole positiivinen

engine-e-araim-reference-both-integrity-risk-allocations-must = molempien eheysriskin allokaatioiden on oltava positiivisia

engine-e-araim-reference-this-reference-implementation-monitors-single = tämä vertailutoteutus valvoo vain yhden tapahtuman vikatiloja, mutta tapauksen priorit vaativat arvon N_fault,max = { $nfm } (samanaikaisten usean tapahtuman osajoukot). Kieltäydytään aliarvioimasta vikatiloja.

engine-e-araim-reference-the-all-in-view-geometry = kaikki näkyvät satelliitit kattava geometria on singulaarinen

engine-e-araim-reference-no-fault-mode-is-observable = yksikään vikatila ei ole havaittavissa tällä geometrialla

engine-e-araim-reference-unknown-reference-vector-known-vectors = tuntematon vertailuvektori '{ $vector }'; tunnetut vektorit: { $ids } (tai 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: julkaistuja WG-C-vertailuvektoreita: { $wanted }; huonoin VPL/HPL-yhtäpitävyys { $worst_acceptance } m verrattuna vertailun omaan arvoon TOL_PL = { $tol } m, hyväksyntävektoreita tarkistettu: { $acceptance_checked }

engine-e-araim-reference-sat-needs-one-value-per = P_sat vaatii yhden arvon satelliittia kohti ja P_const yhden satelliittitähdistöä kohti

engine-e-araim-reference-satellite-names-an-undeclared-constellation = satelliitti nimeää ilmoittamattoman satelliittitähdistön

engine-e-araim-reference-every-prior-must-lie-in = jokaisen priorin on oltava välillä [0, 1)

engine-e-araim-reference-the-all-in-view-solution = kaikki näkyvät satelliitit kattavaa ratkaisua ei valittu

engine-e-araim-reference-an-add-v4-case-needs = ADD v4.2 -tapaus vaatii satelliitit ja satelliittitähdistöt

engine-e-araim-reference-nom-and-sat-need-one = b_nom ja P_sat vaativat yhden arvon satelliittia kohti

engine-e-araim-reference-const-needs-one-value-per = P_const vaatii yhden arvon satelliittitähdistöä kohti

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = satelliitti { $i } nimeää ilmoittamattoman satelliittitähdistön

engine-e-araim-reference-one-constellation-index-per-satellite = yksi satelliittitähdistön indeksi satelliittia kohti

engine-e-araim-reference-satellite-names-constellation-with-no = satelliitti { $i } nimeää satelliittitähdistön { $c }, jolla ei ole ISM:ää

engine-e-araim-reference-fewer-than-four-satellites-above = alle neljä satelliittia maskin yläpuolella

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m:n on sisällettävä vähintään yksi etäisyys

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (vaihteluväli { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | harhautus@{ $value } m { $nearest } W | jalanjälki { $a2 }% kaappaus, reuna { $footprint_limb_captured } | harhautuskaappaus { $spoof_captured } (lukitus { $spoof_lock_time_s } s) | maston kantama { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% luvusta 50 bit/s), { $nma_auth_latency_s } s viive

engine-attack-surface-reached-crossing-best-db = saavutettu (ylityksiä { $crossings }, paras { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = EI saavutettu tällä ruudukolla (paras { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB vajaa; tarvitaan { $best_limb_capture_tx_power_dbw } dBW vs { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| jalanjälkipyyhkäisy { $s }x{ $s2 } (korkeus { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), kaappaus { $v5 }-{ $v6 }% | reuna { $limb }

engine-attack-surface-afs-received-dbw = AFS vastaanotettu: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Vajaus: { $deficit_db } dB (vaihteluväli { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Kaappauksen jalanjälki: { $a }% kiekosta, reuna kaapattu: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Harhautuskaappauksen sisäänveto: { $spoof_captured } (lukitus { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Maston kantama: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Reuna: kaapattu ruudukolla { $na }x{ $nb }, ylityksiä { $crossings }

engine-attack-surface-limb-not-captured-on-grid = Reuna: ei kaapattu ruudukolla { $na }x{ $nb }; tarvitaan { $best_limb_capture_tx_power_dbw } dBW (lennetty { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km on oltava äärellinen ja positiivinen

engine-e-attitude-budget-inertias-must-be-finite-and = hitausmomenttien on oltava äärellisiä ja positiivisia

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 on oltava >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = vähintään yksi suuntausvirheen osatekijä vaaditaan

engine-e-attitude-budget-contributor-sigma-must-be-finite = osatekijän '{ $name }' sigman on oltava äärellinen ja >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> GG-momentti { $t_gg } N·m; suuntaus { $total }" RSS (hallitseva: { $dominant }) (MODELLED skalaaribudjetti)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } vaatii arvon

engine-bench-cli-unknown-option = tuntematon valitsin `{ $a }`

engine-bench-cli-unexpected-argument = odottamaton argumentti `{ $pos }`

engine-bench-cli-cannot-read = ei voi lukea { $p }: { $e }

engine-bench-cli-cannot-create = ei voi luoda { $d }: { $e }

engine-bench-cli-cannot-write = ei voi kirjoittaa { $p }: { $e }

engine-bench-cli-unknown-task-or = tuntematon tehtävä `{ $t }` (a, b, c tai d)

engine-bench-cli-scored-epochs-in-folder = pisteytetyt epookit { $labels } kansioissa { $folders }

engine-bench-cli-wrote-cases-json-and-truth = kirjoitettu { $out }/cases.json ja { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: tämä sitoumus on väliaikainen ja sen siemenluku (seed) paljastui; se ei ole julkaisuholdout

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: siemenluku (seed) ei ole se, joka tämän sitoumuksen taustalla on

engine-bench-cli-is-not-json = { $f } ei ole JSON: { $e }

engine-bench-cli-cannot-read-2 = ei voi lukea { $i }: { $e }

engine-bench-cli-result-rendered = tuloksia renderöity: { $results }

engine-bench-cli-unknown-subcommand =
    tuntematon alikomento `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-cannot-create-an-existing-seed = ei voi luoda { $path } (olemassa olevaa siemenluku-tiedostoa ei koskaan ylikirjoiteta): { $e }

engine-bench-cli-cannot-write-2 = ei voi kirjoittaa { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = siemenluku (seed) kirjoitettu polkuun { $path }: pidä se poissa versionhallinnasta ja kaikista viesteistä; vain alla oleva tiiviste on julkinen

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (siirretty, ei ajettu uudelleen)

engine-bench-cli-impairment-eval-baseline = impairment-eval-lähtötaso: { $det }

engine-bench-cli-no-scenario-json-under = hakemistossa { $root } ei ole scenario.json-tiedostoa

engine-bench-cli-is-not-json-2 = { $path } ei ole JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } ei täsmää, { $missing } puuttuu, { $unpinned } kiinnittämättä

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = tuntematon jako `{ $other }` (dev, test tai holdout)

engine-bench-score-for-is-not-finite = tapauksen `{ $id }` pisteet eivät ole äärellisiä

engine-bench-case-have-no-score-the = tapauksilla ei ole pisteitä: { $missing }, ensimmäinen on `{ $first_missing }`

engine-bench-predictions-name-case-that-is = ennusteet nimeävät tapauksen, jota ei ole totuusaineistossa: `{ $extra }`

engine-bench-schema-must-be = `schema`-kentän on oltava `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` on oltava 64-numeroinen heksadesimaalinen SHA-256

engine-bench-truth-is-not-json = totuusaineisto ei ole JSON: { $e }

engine-bench-predictions-are-not-json = ennusteet eivät ole JSON: { $e }

engine-bench-truth-schema-must-be = totuusaineiston `schema`-kentän on oltava `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = ennusteiden `schema`-kentän on oltava `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = totuusaineisto on tehty eri spesifikaatioversiolla kuin { $SPEC_VERSION }; eri pääversioiden tuloksia ei koskaan sekoiteta

engine-bench-unknown-task = tuntematon tehtävä `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = tulos { $v1 } ei ole kelvollinen: { $p }

engine-bench-site-result-is-task-holdout-result = tulos { $v1 } on tehtävän (d) holdout-tulos ilman kenttää `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = tulos { $v1 } on pisteytetty väliaikaisella, paljastuneella holdout-siemenluvulla (seed): ei julkaisuholdout

engine-bench-site-result-was-scored-under-this = tulos { $v1 } on pisteytetty versiolla { $v }; tämä sivu on versiolle { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = kohteen `{ $k }` pisteet eivät ole luku

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (0.35 oletusarvoinen valvontatunnusluku)

engine-bench-tasks-malformed-clock-line = virheellinen kellorivi `{ $line }`

engine-bench-tasks-the-clock-file-does-not = kellotiedosto ei vastaa kiinnitettyä SHA-256-arvoa (saatiin { $got }, odotettiin { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = satelliittia { $prn } ei ole kellotiedostossa

engine-bench-tasks-kshana-bench-baseline = kshana-bench-lähtötaso: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = ennusteet kattavat tapauksia: { $pmap }, totuusaineistossa niitä on { $tarr }

engine-bench-tasks-case-has-no-number-array = tapauksella `{ $id }` ei ole lukutaulukkoa

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] tapaus `{ $id }` tarvitsee { $n } arvon, siinä on { $a }
       *[other] tapaus `{ $id }` tarvitsee { $n } arvoa, siinä on { $a }
    }

engine-bench-tasks-case-has-non-finite-value = tapauksella `{ $id }` on ei-äärellinen arvo

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = sarjallista { $name }: { $e }

engine-e-bin-crossover-study-write = kirjoita { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = virhe: ei voi luoda { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = valmis: inertiaali, solmut { $nodes }, kello, käyrät { $curves } (seed 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } käyttäjäepookki x 3 URA-arvoa ajassa { $dt } s = { $v1 } ms käyttäjäepookkia kohti ({ $ok } ratkaistavissa)
       *[other] { $n } käyttäjäepookkia x 3 URA-arvoa ajassa { $dt } s = { $v1 } ms käyttäjäepookkia kohti ({ $ok } ratkaistavissa)
    }

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = kirjoitettu docs/INTEROP.md (vientitaulukko)

## src/bin/validation_report.rs

engine-bin-validation-report-wrote-validation-summary-to = validointiyhteenveto kirjoitettu polkuun { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = tuntematon taivaankappale '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigoi muun kuin Maan ympärillä olevan taivaankappaleen ympärillä Maa-yhteyden avulla; { $name } ei ole tuettu tässä

engine-e-body-pnt-duration-and-step-must-be = duration_s:n ja step_s:n on oltava positiivisia ja enintään 20000 epookkia; saatiin { $duration } ja { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind on oltava orbiter tai surface; saatiin '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = käyttäjän korkeuden on oltava positiivinen ja eksentrisyyden välillä [0, 0.9)

engine-e-body-pnt-the-user-orbit-periapsis-is = käyttäjän radan periapsis on pinnan alapuolella

engine-e-body-pnt-constellation-needs-to-200-satellites = satelliittitähdistössä on oltava 1-200 satelliittia vähintään yhdessä ratatasossa

engine-e-body-pnt-constellation-altitude-must-be-positive = satelliittitähdistön korkeuden on oltava positiivinen

engine-e-body-pnt-range-sigmas-must-be-positive = etäisyyden sigmojen on oltava positiivisia

engine-e-body-pnt-no-earth-position-relative-to = ei Maan paikkaa kohteen { $name } suhteen ajanhetkellä JD { $jd }

engine-e-body-pnt-serialising-report = raportin sarjallistaminen: { $e }

engine-e-body-pnt-the-report-must-serialise-to = raportin on sarjallistuttava JSON-objektiksi

engine-body-pnt-positioning-around = Paikannus kohteen { $name } ympärillä

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] { $user_kind }-käyttäjä · { $n_relays } rele · Maan valon kulkuaika { $one_way_light_time_s } s · MODELLED
       *[other] { $user_kind }-käyttäjä · { $n_relays } relettä · Maan valon kulkuaika { $one_way_light_time_s } s · MODELLED
    }

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = E1-skenaario ei ole taulukko

engine-e-calibration-ensembles-e1-scenario-has-no-monte = E1-skenaariossa ei ole osiota [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } puuttuu

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 on `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ensemblea, joissa kussakin 200 realisaatiota, suljettua muotoa vasten: keskiarvo 0, sigma = { $sigma } ns. Ensemble j käyttää perussiemenlukua (seed) 1 000 000 + 1000 j ja bootstrap-siemenlukua 20260928 + j. Suurin suhteellinen ADEV-virhe oli { $max } kohteelle E2 ja { $max2 } kohteelle E3 (arvoilla 1, 10 ja 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = tyhjä tulospolku

engine-e-campaign-result-path-has-an-empty = tulospolulla `{ $path }` on tyhjä segmentti

engine-e-campaign-result-path-bad-index-in = tulospolku `{ $path }`: virheellinen indeksi kohdassa `{ $part }`

engine-e-campaign-result-path-no-field = tulospolku `{ $path }`: kenttää `{ $name }` ei ole

engine-e-campaign-result-path-indexed-value-is = tulospolku `{ $path }`: indeksoitu arvo ei ole taulukko

engine-e-campaign-result-path-index-out-of =
    { $n ->
        [one] tulospolku `{ $path }`: indeksi { $i } alueen ulkopuolella ({ $n } alkio)
       *[other] tulospolku `{ $path }`: indeksi { $i } alueen ulkopuolella ({ $n } alkiota)
    }

engine-e-campaign-result-path-value-is-not = tulospolku `{ $path }`: arvo ei ole luku eikä lippu

engine-e-campaign-result-path-is-not-an = tulospolku `{ $path }`: `{ $k }` ei ole taulukko

engine-e-campaign-result-path-must-name-one = tulospolun `{ $path }` on nimettävä yksi arvo, ei rivejä

engine-e-campaign-result-path-is-not-an-2 = tulospolku `{ $path }`: `{ $name }` ei ole taulukko

engine-e-campaign-metric-path-has-no-entry = mittaripolulla `{ $path }` ei ole merkintää kyseisen lajin units-lohkossa; ilmoita sen `unit` kampanjassa

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` on oltava ei-tyhjä, kirjaimia, numeroita, `_` tai `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: kampanja ei voi sisältää kampanjaa

engine-e-campaign-serialise = { $label }: sarjallista: { $e }

engine-e-campaign-result-did-not-parse = { $label }: tulosta ei voitu jäsentää: { $e }

engine-e-campaign-seed-key-no-field-in = seed-avain `{ $key }`: skenaariossa ei ole kenttää `{ $part }`

engine-e-campaign-seed-key-is-not-non = seed-avain `{ $key }` ei ole ei-negatiivinen kokonaisluku

engine-e-campaign-seed-does-not-fit-toml = siemenluku (seed) { $seed } ei mahdu TOML-kokonaislukuun

engine-campaign-time-path-must-name-rows = aikapolun `{ $t }` on nimettävä rivit merkinnällä `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` ei ole below, above tai abs_above

engine-campaign-threshold-is-null = kynnys `{ $p }` on null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` ei ole mean, min, max tai count

engine-campaign-time-path-gives-several-values = aikapolku `{ $t }` antaa useita arvoja riviä kohti

engine-campaign-value-path-has-fewer-rows = arvopolulla `{ $y }` on vähemmän rivejä kuin polulla `{ $t }`

engine-campaign-value-path-has-rows-time = arvopolulla `{ $y }` on rivejä { $r }, aikapolulla `{ $t }` niitä on { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = vaiheita sisältävä kampanja vaatii osion [timeline] ja kentän step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s on oltava positiivinen, saatiin { $step }

engine-e-campaign-phase-is-named-twice = vaihe `{ $name }` on nimetty kahdesti

engine-e-campaign-phase-duration-must-be-non = vaihe `{ $name }`: duration_s on oltava ei-negatiivinen

engine-e-campaign-phase-has-no-runs = vaiheella `{ $name }` ei ole ajoja

engine-e-campaign-phase-the-first-phase-has = vaihe `{ $name }`: ensimmäisellä vaiheella ei ole mitään, mitä siirtää eteenpäin

engine-e-campaign-phase-handoff-from-channel-which = vaihe `{ $name }`: siirto kanavalta `{ $ch }`, jolla edellinen vaihe ei päättynyt

engine-e-campaign-phase-handoff-from-run-does = vaihe `{ $name }`: siirron from_run { $from_run } ei ole olemassa

engine-e-campaign-phase-handoff-is-null = vaihe `{ $name }`: siirto `{ $from }` on null

engine-e-campaign-phase-handoff-run-does-not = vaihe `{ $name }`: siirron ajo { $run } ei ole olemassa

engine-e-campaign-phase = vaihe `{ $name }`: { $e }

engine-campaign-phase-run = vaihe { $name }/ajo { $ri }

engine-e-campaign-phase-end-at-run-does = vaihe `{ $name }`: end_at_run { $end_at_run } ei ole olemassa

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s on myöhemmin)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } on null)

engine-e-campaign-phase-side-is-not-classical = vaihe `{ $name }`: puoli `{ $side }` ei ole classical tai quantum

engine-e-campaign-phase-skip-must-be-non = vaihe `{ $name }`: skip_s on oltava ei-negatiivinen

engine-e-campaign-phase-alarm-compare-is-not = vaihe `{ $name }`: hälytyksen compare `{ $compare }` ei ole below, above tai abs_above

engine-e-campaign-phase-alarm-threshold-is-null = vaihe `{ $name }`: hälytyksen kynnys `{ $p }` on null

engine-e-campaign-phase-channel-is-in-not = vaihe `{ $name }`: kanava `{ $channel }` on yksikössä { $u }, ei { $du }

## src/campaign.rs

engine-e-campaign-phase-channel-needs-unit = vaihe `{ $name }`: kanava `{ $channel }` tarvitsee yksikön

engine-e-campaign-phase-two-runs-both-provide = vaihe `{ $name }`: kaksi ajoa tarjoaa molemmat kanavan `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = vaihe `{ $name }` siirtää kanavan `{ $ch }`, jolla edellinen vaihe ei päättynyt

engine-e-campaign-phase-carries-but-no-run = vaihe `{ $name }` siirtää kanavan `{ $ch }`, mutta yksikään sen ajo ei tarjoa kanavaa `{ $ch }`

engine-e-campaign-channel-is-in-in-one = kanava `{ $name }` on yksikössä { $unit } yhdessä vaiheessa ja yksikössä { $unit2 } toisessa

engine-e-campaign-at-least-one-metric-is = vähintään yksi mittari tarvitaan

engine-e-campaign-metric-is-named-twice = mittari `{ $name }` on nimetty kahdesti

engine-e-campaign-seed-overflow-in-the-ensemble = siemenluvun (seed) ylivuoto ensemblessa

engine-e-campaign-an-ensemble-needs-at-least = ensemble tarvitsee vähintään yhden ajon

engine-e-campaign-sweep-takes-one-to-three = pyyhkäisy ottaa yhdestä kolmeen akselia, saatiin { $axes }

engine-e-campaign-axis-is-named-twice = akseli `{ $name }` on nimetty kahdesti

engine-e-campaign-axis-needs-at-least-two = akseli `{ $name }` tarvitsee vähintään kaksi askelta

engine-e-campaign-axis-scale-must-be-lin = akseli `{ $name }`: scale on oltava lin tai log

engine-e-campaign-axis-log-axis-needs-positive = akseli `{ $name }`: logaritmisen akselin päiden on oltava positiivisia

engine-campaign-sweep-node = pyyhkäisysolmu { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs on oltava vähintään kaksi

engine-e-campaign-compose-needs-at-least-one = compose tarvitsee vähintään yhden jäsenen

engine-e-campaign-shared-value-must-be-number = jaetun arvon `{ $name }` on oltava luku tai luvut

engine-e-campaign-shared-value-is-named-twice = jaettu arvo `{ $name }` on nimetty kahdesti

engine-e-campaign-member-binds-unknown-shared = jäsen `{ $label }` sitoo tuntemattoman jaetun arvon `{ $name }`

engine-e-campaign-member = jäsen `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = mittari `{ $name }` on yksikössä { $u } yhdelle jäsenelle ja yksikössä { $unit } jäsenelle `{ $label }`

engine-e-campaign-member-is-named-twice = jäsen `{ $label }` on nimetty kahdesti

engine-e-campaign-invalid-campaign-scenario = virheellinen kampanjaskenaario: { $e }

engine-e-campaign-invalid-campaign = virheellinen kampanja: { $e }

engine-campaign-of-across-the-realisations = { $d } kohteesta { $what } realisaatioiden yli

engine-campaign-value-of-at-the-end = kanavan { $ch } arvo edellisen vaiheen lopussa, lisättynä tämän vaiheen kanavaan { $ch }

engine-campaign-on-the-timeline-grid-the = { $label } aikajanan ruudukolla: omistavan vaiheen ajon viimeisin näyte kunkin ruudukkoajan hetkellä tai sitä ennen (nollannen asteen pito); null, kun yksikään kyseisen vaiheen ajo ei tarjoa sitä

engine-campaign-values-of-the-scenario-key = skenaarioavaimen { $key } arvot akselilla { $name }

engine-campaign-value-of-the-scenario-key = skenaarioavaimen { $key } arvo tässä solmussa

engine-campaign-of-the-node-result = { $path } solmun tuloksesta

engine-campaign-of-each-realisation-in-seed = { $path } jokaisesta realisaatiosta, siemenlukujen (seed) järjestyksessä

engine-campaign-shared-value-written-into-every = jaettu arvo { $name }, kirjoitettu jokaiseen jäseneen, joka sitoo sen

engine-campaign-metric-read-from-the-member = mittari { $name } luettu jäsenen tuloksesta

engine-campaign-smallest-across-the-members = pienin { $name } jäsenten yli

engine-campaign-largest-across-the-members = suurin { $name } jäsenten yli

engine-campaign-mean-across-the-members = keskiarvo { $name } jäsenten yli

engine-e-campaign-failed-to-serialise-campaign-result = kampanjan tuloksen sarjallistaminen epäonnistui: { $e }

engine-campaign-chain-phases-over-events-alarm = ketju: vaiheet { $phases }, kesto { $duration_s } s, tapahtumat { $events }, hälytys aktiivinen { $alarm_s } s ruudukosta

engine-campaign-sweep-of-nodes-over = lajin `{ $scenario_kind }` pyyhkäisy: solmut { $nodes } akseleiden [{ $axis_order }] yli{ $v4 }

engine-campaign-monte-carlo-of-seeds = lajin `{ $scenario_kind }` Monte Carlo: siemenluvut (seed) { $runs }

engine-campaign-compose-members = compose: jäsenet { $members }

engine-campaign-member-runs-modelled = jäsenajot { $runs_total } (MODELLED)

engine-campaign-sweep-of-over-nodes-each = lajin `{ $scenario_kind }` pyyhkäisy akseleiden { $axis_order } yli (solmut { $nodes }{ $v4 }; jokaisella viivalla oma alueensa)

engine-campaign-campaign-modelled-composition-every-value = kampanja { $r } | MODELLED-koostumus; jokainen arvo luettu nimetyn lajin todellisesta ajosta

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = optimointi ottaa yhdestä kolmeen parametria, saatiin { $params }

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` on nimetty kahdesti

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: tarvitsee äärellisen lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale on oltava lin tai log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: logaritmisen parametrin rajojen on oltava positiivisia

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start on oltava välillä [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: ruudukko tarvitsee vähintään kaksi askelta

engine-e-campaign-optimize-objective-target-is-only-read = objective.target luetaan vain arvolla goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" vaatii äärellisen objective.target-arvon

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal on oltava minimize, maximize tai target, saatiin `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = { $total } solmun ruudukko ylittää rajan 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps luetaan vain arvolla method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals on katettava alkusimpleksi (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step on oltava välillä (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol:n ja xtol:n on oltava ei-negatiivisia

engine-e-campaign-optimize-method-must-be-grid-or = method on oltava grid tai nelder-mead, saatiin `{ $other }`

engine-campaign-optimize-optimize-eval = optimoinnin arviointi { $trace }

engine-campaign-optimize-lower-bound-of-the-scenario = skenaarioavaimen { $key } alaraja

engine-campaign-optimize-upper-bound-of-the-scenario = skenaarioavaimen { $key } yläraja

engine-campaign-optimize-value-of-the-scenario-key = skenaarioavaimen { $key } arvo parhaassa arvioinnissa

engine-campaign-optimize-value-of-the-scenario-key-2 = skenaarioavaimen { $key } arvo tässä arvioinnissa

engine-campaign-optimize-target-value-of = kohteen { $what } tavoitearvo

engine-campaign-optimize-at-the-best-evaluation = { $what } parhaassa arvioinnissa

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } tästä arvioinnista (siemenlukujen (seed) keskiarvo, kun runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimoi `{ $objective_name }` ({ $goal } { $o }) lajista `{ $scenario_kind }` menetelmällä { $method }: arvioinnit { $evals } ({ $stop_reason }), paras { $o2 } kohdassa [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START ennen CCSDS_TDM_VERS-otsaketta

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: virheellinen otsakerivi: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: virheellinen metadatarivi: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: virheellinen datarivi: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: tunnistamaton datan avainsana { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: datariviltä { $k } puuttuu epookki

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: datariviltä { $k } puuttuu arvo

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: datarivin { $k } virheellinen arvo { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: päättämätön segmentti (META_STOP/DATA_STOP puuttuu)

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: virheellinen TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: virheellinen TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = tuntematon observable `{ $other }`: odotettiin yhtä arvoista range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = tuntematon coordinates `{ $other }`: odotettiin yhtä arvoista cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours on oltava äärellinen ja positiivinen, saatiin { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs on oltava ≥ 2, saatiin { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps on oltava ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials on oltava ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations on oltava ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd on oltava äärellinen ja positiivinen, saatiin { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor on oltava äärellinen ja positiivinen, saatiin { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km on oltava äärellinen ja positiivinen, saatiin { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m on oltava äärellinen ja positiivinen, saatiin { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s on oltava äärellinen ja positiivinen, saatiin { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = satelliittitähdistössä on oltava vähintään johtava (chief) ja yksi vertailu

engine-e-cislunar-arc-recovery-family-is-an-out-of = perhe `{ $family }` on tason ulkopuolinen perhe eikä sillä ole tasomaista nelitilaesitystä: aseta spatial = true pyyhkäistäksesi sen

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = suoramalli tuotti ei-äärellisen totuusmittauksen

engine-cislunar-arc-recovery-first-arc-length-at-which = ensimmäinen kaaren pituus, jolla KAIKKI siemenlukuun (seed) perustuvat kokeet saavat kohinattoman eräratkaisunsa pudottamaan lopputilan virheen enintään { $recovery_factor }-kertaiseksi lähtökohtana olleeseen a priori -poikkeamaan nähden. Tämä on rankkikriteerin palautumisvastine: tarkoilla mittauksilla kysymys `is the state observable?` muuttuu kysymykseksi `can an estimator get it back?`, eikä singulaariarvon toleranssi vaikuta vastaukseen.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = ensimmäinen kaaren pituus, jolla Monte Carlo -RMS-paikanpalautusvirhe { $trials } siemenlukuun (seed) perustuvan kohinarealisaation yli laskee arvoon { $error_bound_km } km tai sen alle. Tämä on estimoitavuuskriteerin palautumisvastine, mitattuna eikä ennustettuna: virhe on estimaatin etäisyys tunnetusta totuudesta, ei muodollisen kovarianssin jälki.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED yhden epookkiruudukon askeleen sisällä: estimaattori palautuu arvosta { $e } h, Gramin matriisin rankkikriteeri kääntyy arvossa { $g } h (suhde { $v1 }, ruudukko { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED palautettavuuden rajana: estimaattori palautuu arvosta { $e } h, { $v1 } Gramin matriisin rankkikriteerin { $g } h (suhde { $v2 }, ruudukko { $grid_hours } h). Rankkikriteeri on suhteellinen singulaariarvokäytäntö; palautumisraja on mitattu tilavirhe, eivätkä nämä kaksi osu tässä yhteen.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: estimaattori ei koskaan täytä palautumisrajaansa tällä kaarella, vaikka Gramin matriisin rankkikriteeri kääntyy arvossa { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = Gramin matriisin rankkikriteeri ei täyty koskaan tällä kaarella (geometria ei koskaan saavuta täyttä rankkia), vaikka estimaattori palautuu arvosta { $e } h — nämä kaksi ovat eri mieltä siitä, onko rajaa ylipäätään olemassa.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | perhe { $family }, { $state_dim } tilaa, { $n_spacecraft } s/c, { $observable } observable, { $coordinates } parametrisointi | kaari { $arc_hours } h, epookit { $epochs } (ruudukko { $grid_hours } h), kokeet { $trials }, seed { $seed } | äärelliset differenssit osittaisderivaatoille, ei analyyttistä Jacobiania / STM / SVD / SRIF | kohinaton palautuminen arvosta { $nf } (kerroin { $recovery_factor }) vs Gramin matriisin rankkikynnys { $gram } | Monte Carlo -estimoitavuus arvosta { $est } (RMS-paikka ≤ { $error_bound_km } km, σ { $sigma_range_m } m) vs Gramin matriisin estimoitavuus { $gram_est } | kaaren lopun RMS-paikka { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = tuntematon family `{ $other }`: odotettiin yhtä arvoista dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO ylitysetäisyydellä { $d } ei korjautunut differentiaalisesti

engine-e-cislunar-observability-member-at-x0-did-not = { $label } jäsen { $i } kohdassa x0 = { $x0 } ei korjautunut differentiaalisesti

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft on oltava välillä 2 - { $MAX_SPACECRAFT }, saatiin { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs on oltava ≥ 2, saatiin { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol on oltava äärellinen ja positiivinen, saatiin { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m on oltava äärellinen ja ei-negatiivinen, saatiin { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km on oltava äärellinen ja positiivinen, saatiin { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } s/c ({ $refs } viitettä) | kaari { $arc_hours } h, epookit { $rank_arc } | rankki { $first } → { $last } / { $state_dim } kaaren aikana | Gramin matriisin λ [{ $min_eigenvalue }…{ $max_eigenvalue }] kunto { $condition_str } | hetkellinen rankki vain etäisyys { $rank_range_only } → etäisyys+muutosnopeus { $rank_range_rate } (yhteyksiä { $n_links }) | GDOP vain etäisyys { $ro } etäisyys+muutosnopeus { $rr } | DRO-alkuehdot (suurin jaksollisuusresiduaali { $max_resid }) | SRIF-posteriori äärellinen rankki-4-epookissa { $srif_epoch } (Validated rank/STM/DRO-closure/SRIF, Modelled design)

engine-cislunar-observability-never-rank-of = ei koskaan (rankki { $rank } / { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | perhe { $family }, { $state_dim } tilaa, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | rankkikynnys { $rank_thr } (ruudukko { $c } h) | estimoitavuuskynnys (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = ensimmäinen kaaren pituus, jolla johtavan (chief) ALKUTILAN muodollinen 1σ-paikkaepävarmuus σ_pos = sqrt(trace(P_rr)), kun P = (ÕᵀÕ)⁻¹ ja Õ on mittauskohinalla valkaistu havaittavuusmatriisi, laskee arvoon { $sigma_pos_threshold_km } km tai sen alle. Tämä on kriteeri, jonka alla kaaren pituuden kynnys on ylipäätään kohinariippuvainen: P skaalautuu σ²:n mukana, joten σ_pos skaalautuu σ:n mukana, kun taas yllä oleva rankkikriteeri ei liiku σ:n mukana. Raja on ILMOITETTU insinöörivalinta, ei sovitettu — estimability_sweep raportoi kynnyksen neljällä muulla rajalla.

engine-cislunar-observability-extension-r3-this-run-is = LAAJENNUS (R3) — tämä ajo EI ole tasomainen DRO-kokoonpano, jota yllä oleva `label` kuvaa. Tilan dimensio { $state_dim }; ratayhdyskunta { $family }; avaruusalukset { $n_spacecraft }; etäisyysmittauksen sigma { $sigma_range_m } m. Missä `label` sanoo "planar" ja "planar DROs", lue tässä nimetty perhe. VALIDATED-lisäykset: 6x6 variaatio-STM on sama äärellisillä differensseillä validoitu CR3BP-STM (crate::cr3bp), jota käytetään täydellä leveydellä; spatiaaliset etäisyyden / etäisyyden muutosnopeuden Jacobian rivit ovat äärellisillä differensseillä validoituja analyyttisiä osittaisderivaattoja, ja muutosnopeusrivi on tarkistettu komponentti komponentilta crate-kirjaston riippumatonta 3D-funktiota deepspace_od::range_rate_observable vasten; halo- / NRHO-alkuehdot ovat differentiaalisesti korjattuja jaksollisia ratoja samalla korjaimella, joka toistaa julkaistun L2 southern 9:2 NRHO:n, jatkettuina kyseisestä julkaistusta siemenestä, ja kunkin jäsenen sulkeutumisresiduaali raportoidaan; kuusitilaiset RANKKI-tulokset vahvistetaan RIIPPUMATONTA riviporrasmuotoista rankkia (Gaussin eliminointi osittaisella pivotoinnilla) vasten, joka ei jaa koodia ominais-/SVD-reitin kanssa. SRIF-HAARAN TOSI RAJAUS: yllä oleva SRIF-ristiinvalidointi käyttää SAMOJA mittaus-Jacobianeja ja palautuu samaan O^T O:hon, joten sen yhtäpitävyys on johdonmukaisuustarkistus kahden numeerisen koneiston välillä, EI riippumaton vahvistus kynnykselle — sitä ei lasketa minkään tässä esitetyn luvun validoinniksi. MODELLED: perhesuunnittelu (mitkä abskissat, amplitudit ja vaiheet), epookkiruudukko, yhden yhteyden kaari ja estimoitavuuskriteerin ilmoitettu paikkaraja.

engine-cislunar-observability-validated-each-constellation-initial-condition = Validated: jokainen satelliittitähdistön alkuehto on perheen { $family } differentiaalisesti korjattu jaksollinen rata, joka sulkeutuu yhden jakson yli raportoituun jaksollisuusresiduaaliin (tasomaiset DRO:t ovat lisäksi retrogradisia Kuun suhteen). Perhe korjataan Maa-Kuu-massasuhteella. Modelled: perheparametrien ja vaiheiden valinta (satelliittitähdistön suunnittelu). Avainnimi `dro_provenance` säilytetään julkaistua dokumenttiskeemaa varten; se kantaa sen perheen, jota tämä ajo pyysi.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } on oltava äärellinen ja positiivinen, saatiin { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } on oltava välillä (0, 1), saatiin { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg on oltava välillä [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems on nimettävä vähintään yksi esiasetus

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias vaatii äärelliset bias_m, t0_s ja t1_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: ei tietueita

engine-e-clock-library-card-records-at-different-tau0 = { $name }: tietueet eri tau0-arvoilla

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: jaksollinen pienimmän neliösumman sovitus epäonnistui

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: stabiilisuuspisteitä { $used }, joilla edf >= { $MIN_FIT_EDF }; kortti tarvitsee kolme

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = aukot { $g }, vaiheen poikkeavat { $o }, vaiheen askeleet { $p }, purskeet { $b }, taajuusaskeleet { $f } (robusti sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` ei ole ei-negatiivinen kokonaisluku

engine-e-compliance-is-missing = `{ $p }` puuttuu

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } ylittää arvon events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } ylittää arvon predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: receiver-trust-laskurit virheelliset ({ $malformed_counts }); jätetty pois

engine-e-compliance-not-json = { $label }: ei ole JSON: { $e }

engine-compliance-cannot-read = { $label }: ei voi lukea: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: viereinen skenaario ilmoittaa lajiksi `{ $s }`, mutta tulos ilmoittaa `{ $o }`; ei käytetty

engine-e-compliance-scenario-kind-not-found-no = { $label }: skenaarion lajia ei löytynyt (ei viereistä skenaariotiedostoa, ei receiver-trust-tulos, ei ylätason `kind`-kenttää)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` ei ole moottorin tuntema skenaarion laji; ei käytetty

engine-compliance-written-by-kshana = Kirjoittanut kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    Testejä, joissa jokainen ilmoitettu kynnys täyttyi: { $met }, kynnys ei täyttynyt: { $not_met }, syötettä vaativia: { $needs_input }.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = intensiteettiruudukon min < max on oltava äärellisiä, saatiin [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = intensiteettiruudukko tarvitsee >= 2 askelta, saatiin { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = korrelaatioruudukossa on oltava vähintään yksi arvo

engine-e-conflict-resilience-correlation-values-must-lie-in = korrelaatioarvojen on oltava välillä [0, 1], saatiin { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience tarvitsee vähintään yhden kerroksen

engine-e-conflict-resilience-layer-availability-not-in = kerroksen { $i } availability { $availability } ei ole välillä [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = kerroksen { $i } sigma_m on oltava äärellinen ja positiivinen

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = kerroksen { $i } vulnerability on oltava äärellinen ja >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = kerroksen { $i } vector_weight on oltava äärellinen ja >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } alueen ulkopuolella (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials on oltava >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | kerrokset { $layers } ({ $primary } lähtötaso) | vertailuintensiteetti { $reference_intensity } | kestävyyssuhde suljettu muoto { $ratio_closed_form }x MC { $ratio_mc_independent }x (kerroksellinen vs yksikerroksinen) | korrelaatio mitätöi kerrostuksen: suhde { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | priorin CI [{ $ratio_lo }-{ $ratio_hi }]x | vektorikohtainen selviytyminen @ viite häirintä { $surv }% harhautus { $surv2 }% kineettinen { $surv3 }% kyber { $surv4 }% (terävin { $sharpest }) | ~7x pääluku MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = tuntematon keskuskappale { $name }: odotettiin planeettaa, Plutoa, Kuuta tai suurta kuuta (earth, moon, mars, europa, titan, ...; katso crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = Walker-kuori vaatii total > 0 ja planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walker total { $total } ei ole lukumäärän planes { $planes } monikerta

engine-e-constellation-walker-phasing-must-lie-in = Walker-vaihetuksen F = { $phasing } on oltava välillä 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } ei ole laajennettava GPS-paikka (SPS PS Table 3.2-2 luettelee B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: anna altitude_km tai semi_major_axis_km, ei molempia

engine-e-constellation-needs-altitude-km-or-semi = { $what }: tarvitsee altitude_km tai semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: isoakselin puolikas { $v1 } km ei ylitä kappaleen { $name } sädettä

engine-e-constellation-eccentricity-must-lie-in = { $what }: eksentrisyyden { $e } on oltava välillä [0, 0.9)

engine-e-constellation-perigee-is-below-the-surface = { $what }: perigeum on kappaleen { $name } pinnan alapuolella

engine-e-constellation-constellation-preset-is-an-earth = satelliittitähdistö { $name }: esiasetus { $p } on Maan satelliittitähdistö, kappale on { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = satelliittitähdistö { $name }: tuntematon esiasetus { $other } (odotettiin arvoa gps-baseline, gps-expandable, galileo, beidou, beidou-meo tai glonass)

engine-e-constellation-constellation-expanded-applies-only-to = satelliittitähdistö { $name }: `expanded` koskee vain gps-expandable-esiasetusta

engine-constellation-constellation-shell = satelliittitähdistö { $name } kuori { $v2 }

engine-constellation-explicit-element-sets = { $satellite } nimettyä elementtijoukkoa

engine-constellation-constellation-satellite = satelliittitähdistö { $name } satelliitti { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = satelliittitähdistöllä { $name } ei ole satelliitteja: anna esiasetus, [[constellation.shell]] tai [[constellation.satellite]]

engine-e-constellation-no-constellation-given = satelliittitähdistöä ei annettu

## src/constellation.rs

engine-e-constellation-constellations-with-one-clock-each = satelliittitähdistöjä, joilla kullakin on yksi kello: { $constellations }, ylittää { $MAX_CLOCKS } kellon rajan; käytä arvoa clock = "common" tai yhdistä satelliittitähdistöt

engine-e-constellation-must-be-finite = { $what } on oltava äärellinen

engine-e-constellation-need-step-and-duration-step = vaaditaan step_s > 0 ja duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = yli 100 000 epookkia; nosta step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg on oltava välillä [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold on oltava positiivinen

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg on oltava välillä [0.25, 90]

engine-e-constellation-need-90-lat-min-deg = vaaditaan -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = vaaditaan lon_min_deg < lon_max_deg, väli enintään 360 deg

engine-e-constellation-give-at-least-one-constellation = anna vähintään yksi [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points on rajattu arvoon 2000

engine-e-constellation-satellites-exceeds-the-50-000 = satelliitteja { $total } ylittää rajan 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: satelliitit { $total } ({ $names }) kappaleen { $name } ympärillä; saatavuus { $global_availability_pct }% (PDOP <= { $pdop_threshold }, { $mask_deg } deg maski), huonoin paikka { $worst_site_availability_pct }%, PDOP-mediaani { $cov }, keskimäärin { $global_mean_visible } näkyvissä; ruudukkopisteet { $grid_points } x epookit { $epochs } (MODELLED)

engine-constellation-constellation-coverage-over-the = Satelliittitähdistön kattavuus kappaleella { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } on oltava äärellinen ja positiivinen

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } on oltava äärellinen ja >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw on oltava äärellinen

engine-e-contact-schedule-satellite-altitude-km-must-be = satelliitti '{ $name }': altitude_km on oltava välillä (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satelliitti '{ $name }': inclination_deg on oltava välillä [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satelliitti '{ $name }': backlog_mbit on oltava >= 0

engine-e-contact-schedule-satellite-priority-must-be = satelliitti '{ $name }': priority on oltava > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satelliitti '{ $name }': eirp_dbw on oltava äärellinen

engine-e-contact-schedule-station-lat-deg-in-90 = asema '{ $name }': lat_deg välillä [-90, 90], lon_deg äärellinen

engine-e-contact-schedule-station-mask-deg-must-be = asema '{ $name }': mask_deg on oltava välillä [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = asema '{ $name }': alt_m on oltava välillä [0, 3000] (ITU-R P.834 -alue)

engine-e-contact-schedule-station-setup-and-over-db = asema '{ $name }': setup_s >= 0 ja g_over_t_db äärellinen

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours on oltava välillä (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s on oltava välillä (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = vähintään yksi satelliitti ja yksi asema vaaditaan

engine-e-contact-schedule-at-most-32-satellites-and = enintään 32 satelliittia ja 32 asemaa

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: satelliitit { $satellites } x asemat { $stations } ajalla { $duration_hours } h -> ehdokasyhteydet { $cands }, aikataulutettu { $greedy }; toimitettu { $total_del } / { $total_backlog } Mbit{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: ohitukset { $pairs }; ACM { $acm } Mbit vs CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = vaaditaan vähintään 2 koetta ja äärellinen sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total on oltava välillä (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = käyttäjällä ei ole paikallista koordinaatistoa

engine-e-dop-error-ci-singular-geometry = { $name }: singulaarinen geometria

engine-e-dop-error-ci-no-noise-free-fix = { $name }: ei kohinatonta paikkaratkaisua

engine-e-dop-error-ci-no-fix = { $name }: ei paikkaratkaisua

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singulaarinen geometria

engine-e-dop-error-mc-no-fix = { $label }: ei paikkaratkaisua

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km on oltava positiivinen; saatiin { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes ja sats_per_plane on molempien oltava nollasta poikkeavia

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz on oltava positiivinen; saatiin { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency on oltava välillä (0, 1]; saatiin { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k on oltava positiivinen; saatiin { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db on oltava ei-negatiivinen; saatiin { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m on oltava Maan ulkopuolella; saatiin { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] Maa-GNSS Kuun etäisyydellä — { $n_satellites } satelliitti, vastaanotin etäisyydellä { $r } km{ "\u000A" }
       *[other] Maa-GNSS Kuun etäisyydellä — { $n_satellites } satelliittia, vastaanotin etäisyydellä { $r } km{ "\u000A" }
    }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Maan reuna satelliittitähdistöstä: { $earth_limb_half_angle_deg } deg nadirista — jokaisen Kuuhun suuntautuvan säteen on ylitettävä tämä{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the =
    { $n_satellites ->
        [one] { "  " }{ $n_geometrically_visible } / { $n_satellites } ei peitetty; { $n_trackable } ylittää { $tracking_threshold_dbhz } dB-Hz seurantakynnyksen{ "\u000A" }
       *[other] { "  " }{ $n_geometrically_visible } / { $n_satellites } ei peitetty; { $n_trackable } ylittää { $tracking_threshold_dbhz } dB-Hz seurantakynnyksen{ "\u000A" }
    }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }paras yhteys { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }jokainen seurattavissa oleva näkölinja on { $a } deg puolikartion sisällä — geometria on lähes degeneroitunut{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }PYYHKÄISY { $epochs } epookin / { $span_s } s yli: signaalin saatavuus { $signal_availability }, FIX-saatavuus { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }seurattavat yhteydet keskiarvo { $mean_trackable }, enintään { $max_trackable }; paras C/N0 { $w }; paras PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = vaaditaan yhdestä kuuteen vaihetta

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg on oltava äärellinen ja ei-negatiivinen

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 on oltava äärellinen ja ei-negatiivinen

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg on oltava äärellinen ja ei-negatiivinen

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m on oltava äärellinen ja ei-negatiivinen

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg on oltava välillä [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s on oltava äärellinen ja ei-negatiivinen

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = nousun työntö-painosuhteen { $tw } on ylitettävä 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ihanteellinen dv { $ideal_dv_m_s } m/s, häviöt { $losses } m/s (painovoima { $gravity_loss_m_s }, ilmanvastus { $drag_loss_m_s }, ohjaus { $steering_loss_m_s }, vastapaine { $back_pressure_loss_m_s }); palamisen loppu { $r } km nopeudella { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } on oltava äärellinen ja positiivinen

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body on oltava "earth" tai "mars", saatiin "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = ilmakehä "{ $a }" ei ole käytettävissä kappaleelle "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg on oltava välillä (0, 90) (positiivinen alaspäin)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m on oltava välillä [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg on oltava äärellinen ja |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg:n ja longitude_deg:n on oltava äärellisiä

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag on oltava välillä [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg on oltava äärellinen

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s on oltava välillä (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m on oltava välillä [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s on oltava välillä (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame on oltava inertial|relative, saatiin "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> huippu { $pk_g } g korkeudella { $r } km, huippu-q { $r2 } W/cm² korkeudella { $r3 } km, lämpökuorma { $r4 } J/cm², huippu-q_dyn { $r5 } kPa; { $outcome } hetkellä { $end_time_s } s (suljettu muoto { $cf_g } g; MODELLED 3-DoF, ei säteily-/TPS-mallia)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } on oltava välillä (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } on oltava äärellinen ja ei-negatiivinen

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg on oltava välillä [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits on oltava välillä 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (kaivo { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = nadirkulma { $eta_rad }° ylittää Maan kulmasäteen { $rho }° (ohittaa Maan)

engine-e-eo-payload-no-sun-synchronous-inclination-at = ei aurinkosynkronista inklinaatiota korkeudella { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg on oltava välillä (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad on oltava äärellinen ja positiivinen

engine-e-eo-payload-half-fov-too-large = half_fov liian suuri: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> { $v3 } km kaista, { $gsd } m nadir-GSD, pääsy { $v5 } km nadirista sivuun; solmuväli { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Maa-Kuu-barycentre lähteestä { $table }, jaettu Montenbruck & Gill -kuusarjalla, joka on prekessoitu J2000:een

engine-ephem-provider-jpl-mean-elements-in-the = JPL:n keskielementit Laplacen tasossa, keskipituuden muutosnopeus IAU:n synkronisen pyörimisnopeuden mukaan, lisätty planeettaansa lähteestä { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = IAU:n synkronisen pyörimisen suunta JPL:n keskietäisyydellä, lisätty Saturnukseen lähteestä { $table }

engine-e-ephem-provider-read = lue { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = TLE:stä puuttuu rivi 1 (rivi, joka alkaa merkinnällä `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE:stä puuttuu rivi 2 (rivi, joka alkaa merkinnällä `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = analyyttinen `orbit`-efemeridi vaatii kentän `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = efemeridiskenaario vaatii joko kentän `tle` tai `orbit`

engine-e-ephemeris-step-must-be-positive = step_s on oltava positiivinen

engine-e-ephemeris-duration-must-be-non-negative = duration_s on oltava ei-negatiivinen

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz on oltava positiivinen, äärellinen taajuus

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` ei ole äärellinen

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` ei ole sekunteja eikä ISO-8601 UTC -aikaa

engine-e-evidence-assemble-no-epoch-of-the-log = lokin yksikään epookki ei osu välille { $t0 } s - { $t1 } s (loki kattaa välin 0 - { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config ei ole objekti

engine-e-evidence-assemble-config-json-already-has-an = config.json sisältää jo merkinnän `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = arvosta { $from_s } arvoon { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` ei ole UTC-aika, kuten 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } lokissa, jonka koko on { $log_bytes } tavua

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } vaatii arvon

engine-e-evidence-cli-cannot-create = ei voi luoda { $path }: { $e }

engine-e-evidence-cli-cannot-write = ei voi kirjoittaa { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = varoitus: { $path } on muiden käyttäjien luettavissa; rajoita sitä (chmod 600)

engine-e-evidence-cli-cannot-read-key = avainta { $path } ei voi lukea: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } ei ole heksadesimaaliavain

engine-e-evidence-cli-must-hold-32-byte-key = { $path } on sisällettävä 32-tavuinen avain 64 heksadesimaalinumerona

engine-e-evidence-cli-cannot-read = ei voi lukea { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = ei voi lukea { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } on olemassa eikä ole tyhjä

engine-e-evidence-cli-cannot-create-2 = ei voi luoda { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = varoitus: { $arg } on vain omistajan luettavissa (tila 600) eikä sen nimi ole *.pub: se voi olla yksityinen avain. Anna julkisen avaimen tiedosto.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` ei ole 64 heksadesimaalinumeroa eikä luettava tiedosto ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` ei sisällä heksadesimaalinumeroita

engine-evidence-cli-private-key-keep-it-secret = yksityinen avain: { $out }  (pidä salassa; älä koskaan tallenna versionhallintaan)

engine-evidence-cli-public-key-pub = julkinen avain:  { $out }.pub

engine-evidence-cli-public-key-hex = julkinen avain (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Anna tarkastajille julkinen avain luotettavaa reittiä pitkin; he kiinnittävät sen valitsimella --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify vaatii nippuhakemiston

engine-e-evidence-cli-cannot-read-3 = ei voi lukea { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: PEM-varmennetta ei löytynyt

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }Kshana ei ole vahvistanut aikaleimapalvelun allekirjoitusta

engine-evidence-cli-this-is-technical-record-not = Tämä on tekninen tallenne, ei oikeudellinen lausunto.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp vaatii nippuhakemiston

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp vaatii token-tiedoston

engine-e-evidence-cli-cannot-read-4 = ei voi lukea { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = ei voi kirjoittaa { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = huomio: token sijaitsee allekirjoitetun manifestin vieressä, ei sen sisällä; vaadi se valitsimella --require-timestamp.

engine-e-evidence-cli-round-trip-packs-are-not = round-trip-paketteja ei rakenneta WebAssemblylle

engine-e-evidence-cli-needs-scenario-path = vaatii skenaariopolun

engine-e-evidence-cli-needs-from = vaatii valitsimen --from

engine-e-evidence-cli-needs-to = vaatii valitsimen --to

engine-e-evidence-cli-cannot-read-lab-attestation = laboratoriovakuutusta { $p } ei voi lukea: { $e }

engine-e-evidence-cli-cannot-read-5 = ei voi lukea { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = virheellinen receiver-trust-skenaario: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation koskee komentoa `receiver-trust evidence`, ei komentoa `evidence round-trip` (jonka paketti tallentaa testiolosuhteet)

engine-e-evidence-cli-cannot-read-6 = ei voi lukea { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = ei voi lukea { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = todistepaketti kirjoitettu polkuun { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epookit ikkunassa: { $epochs_in_window }  ({ $from_s } s - { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }allekirjoittajan sormenjälki: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }manifest.json-tiedoston SHA-256 (se, jonka RFC 3161 -palvelun tulisi leimata): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }lokin osa: tavut { $a } - { $b } / { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }lokin osa: koko loki (tämä loki ei anna ikkunalle tavualuetta)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }laboratoriovakuutus tallennettu allekirjoitettuun manifestiin ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Paketti on tekninen tallenne, ei oikeudellinen lausunto.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s - { $to_s } s lokin ensimmäisen epookin jälkeen

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = virheellinen lab-attestation-TOML: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` on oltava taulukko

engine-e-evidence-lab-invalid-lab-attestation = virheellinen lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } vaaditaan

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } ylittää { $MAX_FIELD } tavua

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: päivämäärä { $date } ei ole päivä, kuten 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: suojattu järjestely vaatii kentän enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup on oltava "conducted" tai "shielded" (saatiin { $other }); ilmateitse tapahtuvaa järjestelyä ei hyväksytä laboratorioajoksi

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db on oltava äärellinen

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = testiolosuhteet ilmoittavat tapahtumia { $events }, mutta pisteytysskenaariossa niitä on { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = tapahtuma '{ $id }' testiolosuhteissa ({ $onset_s } s - { $offset_s } s) ei vastaa tapahtumaa '{ $label }' pisteytysskenaariossa ({ $onset_s2 } s - { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = lokin SHA-256 ({ $have }) ei ole se, jonka testiolosuhteet ilmoittavat ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = katkaistu DER

engine-e-evidence-tsa-bad-der-length = virheellinen DER-pituus

engine-e-evidence-tsa-unexpected-der-tag = { $what }: odottamaton DER-tunniste { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = tyhjä AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = virheellinen UTCTime

engine-e-evidence-tsa-bad-generalizedtime = virheellinen GeneralizedTime

engine-e-evidence-tsa-bad-time = virheellinen aika

engine-e-evidence-tsa-time-not-in-utc = aika ei ole UTC-muodossa

engine-e-evidence-tsa-bad-time-digits = virheelliset aikanumerot

engine-e-evidence-tsa-bad-bit-string = virheellinen BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: odotettiin kolmea elementtiä

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: liian lyhyt

engine-e-evidence-tsa-empty-extension = tyhjä Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: arvo ei ole OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: tyhjä

engine-e-evidence-tsa-validity-short = Validity: lyhyt

engine-e-evidence-tsa-pem-end-without-begin = PEM: END ilman BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: virheellinen base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: virheellinen base64-pituus

engine-e-evidence-tsa-spki-empty = SPKI: tyhjä

engine-e-evidence-tsa-spki-no-oid = SPKI: ei OID:ta

engine-e-evidence-tsa-spki-no-key = SPKI: ei avainta

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: odotettiin kahta kokonaislukua

engine-e-evidence-tsa-unsupported-elliptic-curve = ei-tuettu elliptinen käyrä

engine-e-evidence-tsa-unsupported-public-key-algorithm = ei-tuettu julkisen avaimen algoritmi

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA-avain tai -allekirjoitus liian suuri

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA-modulus ei ole pariton

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA-allekirjoitus alueen ulkopuolella

engine-e-evidence-tsa-rsa-key-too-small = RSA-avain liian pieni

engine-e-evidence-tsa-invalid-padding = virheellinen täyte

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: koodattu viesti liian pitkä

engine-e-evidence-tsa-last-octet-invalid = viimeinen oktetti virheellinen

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: vasemmanpuoleisimmat bitit eivät ole nollia

engine-e-evidence-tsa-pss-bad-padding = PSS: virheellinen täyte

engine-e-evidence-tsa-pss-signature-mismatch = PSS: allekirjoitus ei täsmää

engine-e-evidence-tsa-unsupported-mask-generation-function = ei-tuettu maskinmuodostusfunktio

engine-e-evidence-tsa-mgf1-without-hash = MGF1 ilman tiivistettä

engine-e-evidence-tsa-bad-pss-salt-length = virheellinen PSS-suolan pituus

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = ECDSA-allekirjoitus vaatii EC-avaimen

engine-e-evidence-tsa-an-rsa-signature-needs-an = RSA-allekirjoitus vaatii RSA-avaimen

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption ilman tiivistealgoritmia

engine-e-evidence-tsa-an-rsa-pss-signature-needs = RSA-PSS-allekirjoitus vaatii RSA-avaimen

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey ilman tiivistealgoritmia

engine-e-evidence-tsa-unsupported-signature-algorithm = ei-tuettu allekirjoitusalgoritmi

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: tyhjä

engine-e-evidence-tsa-time-stamp-request-not-granted = aikaleimapyyntöä ei myönnetty

engine-e-evidence-tsa-no-time-stamp-token-in = vastauksessa ei ole aikaleimatokenia

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = ei ole TimeStampResp eikä TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = ei ole CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: ei sisältöä

engine-e-evidence-tsa-signeddata-short = SignedData: lyhyt

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: tyhjä

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = kapseloitu sisältö ei ole TSTInfo

engine-e-evidence-tsa-no-tstinfo = ei TSTInfo:a

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo ei ole OCTET STRING -rakenteessa

engine-e-evidence-tsa-tstinfo-short = TSTInfo: lyhyt

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: ei genTime-kenttää

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: ei signerInfos-kenttää

engine-e-evidence-tsa-exactly-one-signerinfo-expected = odotettiin täsmälleen yhtä SignerInfo-rakennetta

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: ei sid-kenttää

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: ei tiivistealgoritmia

engine-e-evidence-tsa-signerinfo-short = SignerInfo: lyhyt

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: ei allekirjoitettuja attribuutteja

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: ei allekirjoitusalgoritmia

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: ei allekirjoitusta

engine-e-evidence-tsa-no-serial = ei sarjanumeroa

engine-e-evidence-tsa-signer-certificate-not-found = allekirjoittajan varmennetta ei löytynyt

engine-e-evidence-tsa-attribute-empty = Attribute: tyhjä

engine-e-evidence-tsa-attribute-no-values = Attribute: ei arvoja

engine-e-evidence-tsa-attribute-no-value = Attribute: ei arvoa

engine-e-evidence-tsa-content-type-attribute-mismatch = content-type-attribuutti ei täsmää

engine-e-evidence-tsa-digest-failure = tiivistevirhe

engine-e-evidence-tsa-signature-not-an-octet-string = allekirjoitus ei ole OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = ess signing certificate -attribuutti puuttuu

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: tyhjä

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id -tunnistetta ei löytynyt

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: ei tiivistettä

engine-e-evidence-tsa-unsuitable-certificate-purpose = sopimaton varmenteen käyttötarkoitus

engine-e-evidence-tsa-certificate-is-not-yet-valid = varmenne ei ole vielä voimassa

engine-e-evidence-tsa-certificate-has-expired = varmenne on vanhentunut

engine-e-evidence-tsa-invalid-ca-certificate = virheellinen CA-varmenne

engine-e-evidence-tsa-certificate-chain-too-long = varmenneketju liian pitkä

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: tyhjä

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: ei tiivistettä

engine-e-evidence-tsa-message-imprint-mismatch = message imprint ei täsmää

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = määrittelemättömän pituista BER-koodausta ei tueta

engine-e-evidence-tsr-expected-tag-found = odotettiin { $what } (tunniste { $tag }), löytyi { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = virheellinen PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = aikaleimavastausta ei myönnetty

engine-e-evidence-tsr-not-timestamp-token = ei ole aikaleimatoken

engine-e-evidence-tsr-the-token-content-type-is = tokenin sisältötyyppi ei ole CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = token ei sisällä TSTInfo-rakennetta

## src/evidence/tsr.rs

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = viestitiiviste käyttää tiivistealgoritmia, jota ei tueta

engine-e-evidence-tsr-the-imprint-is-bytes-not = tiivisteen pituus tavuina on { $digest }, ei { $want_len }, jonka { $hash_alg } antaa

engine-e-evidence-tsr-gentime-is-not-utc = genTime ei ole UTC-aikaa

engine-e-evidence-tsr-malformed-gentime = virheellinen genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime ei ole todellinen kalenteriaika

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = ei pienaakkosin kirjoitettua heksadesimaalia

engine-e-evidence-verify-expected-bytes-found = odotettu tavumäärä: { $N }, löytyi: { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = todistepaketilla on jo aikaleimatunniste; korvaa se antamalla --replace

engine-e-evidence-verify-not-attached-the-pack-with = ei liitetty: tämän tunnisteen sisältävä todistepaketti ei täsmää ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = todistepaketti sisältää laboratoriovahvistuksen: { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = allekirjoitustiedosto ei pääty rivinvaihtoon

engine-evidence-verify-signer-not-pinned-the-signature = allekirjoittajaa ei ole kiinnitetty: allekirjoitus osoittaa todistepaketin olevan ehjä avaimella { $r }, jonka todistepaketti nimeää itse. Vertaa sormenjälkeä allekirjoittajalta saamaasi sormenjälkeen tai anna avain.

engine-evidence-verify-range-is-not-inside-log = alue { $start }..{ $end } ei ole lokin sisällä, lokin koko tavuina: { $full_bytes }

engine-evidence-verify-timestamp-token-states-its-imprint = aikaleimatunniste ilmoittaa ajan { $gen_time }; sen tiiviste { $v2 } tiedoston manifest.json kanssa. Kshana ei ole varmentanut aikaleimapalvelun allekirjoitusta: tarkista se komennolla `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = aikaleimatunniste ilmoittaa ajan { $gen_time }; sen tiiviste { $v2 } tiedoston manifest.json kanssa; aikaleimapalvelun allekirjoitus ja ketju { $v3 } annettuja ankkureita vasten.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` on tyhjä merkkijono

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } on sanaston ulkopuolella

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = kustannushaarukan on oltava äärellinen, ei-negatiivinen ja järjestetty low≤nominal≤high, ja sillä on oltava lähde

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction ja availability on oltava osuuksia välillä [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name }: arvon on oltava äärellinen ja > 0, saatiin { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name }: arvon on oltava äärellinen ja >= 0, saatiin { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg on oltava välillä [-90, 90), saatiin { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = satelliittitähdistössä ei ole satelliitteja

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats on oltava >= 1, kun se on asetettu

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = lipsahduksen satelliitti { $sat } on alueen ulkopuolella

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = rivi { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = rivi { $lineno }: sarakkeita { $v }, odotettiin vähintään { $min }

engine-e-fusion-kfgins-line-columns = rivi { $v1 }: sarakkeita { $v }

engine-e-fusion-kfgins-line-block-lists-are-not = rivi { $lineno }: lohkolistoja ei tueta

engine-e-fusion-kfgins-line-expected-key-value = rivi { $lineno }: odotettiin muotoa `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = rivi { $lineno }: sisennetty avain ilman ylätason avainta

engine-e-fusion-kfgins-line-only-one-level-of = rivi { $lineno }: vain yksi sisäkkäisyystaso sallitaan

engine-e-fusion-kfgins-line-unterminated-flow-list = rivi { $lineno }: päättämätön virtauslista

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` on lista, odotettiin skalaaria

engine-e-fusion-kfgins-missing = `{ $k }` puuttuu

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` on oltava kolmialkioinen lista

engine-e-fusion-kfgins-no-imu-sample-at-or = ei IMU-näytettä ajanhetkellä starttime tai sen jälkeen

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU-aika ei kasva kohdassa { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name }: arvon on oltava äärellinen ja > 0, saatiin { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m on oltava äärellinen ja > 0, saatiin { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg on oltava välillä [-90, 90), saatiin { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = lentoradan csv-rivi { $v1 }: ei lukuja: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = lentoradan csv-rivi { $v1 }: odotettiin 10 saraketta, saatiin { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = lentoradan csv-rivi { $v1 }: aika ei kasva

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = lentoradan csv vaatii vähintään kaksi riviä

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = lentoradan csv kattaa { $rows } s, mutta skenaario kestää { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: site lat_deg on oltava välillä [-90, 90] ja jokaisen kentän äärellinen

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" ei ole GNSS-esiasetus ({ $e_gnss }) eikä LEO-esiasetus ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: anna käyttäjä joko kentällä `site` tai `user_ecef_m`, ei molemmilla

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m on oltava äärellinen eikä geokeskipiste

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satelliitti { $id }: atsimuutti/korkeuskulma alueen ulkopuolella

engine-e-geometry-sky-satellite-is-given-in = sky: satelliitti { $id } on annettu ECEF-koordinaatteina; pyyntö vaatii kentän `site` tai `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satelliitti { $id }: ECEF-paikka ei ole äärellinen

engine-e-geometry-sky-satellite-coincides-with-the = sky: satelliitti { $id } yhtyy käyttäjään

engine-e-geometry-sky-satellite-give-az-deg = sky: satelliitti { $id }: anna az_deg ja el_deg tai ecef_m, ei muuta

engine-e-geometry-sky-tle-is-bytes-the = sky: tle:n koko tavuina on { $text }; yläraja on { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = elementtijoukko hylätty: { $e }

engine-geometry-sky-tle-holds-no-complete = sky: tle ei sisällä yhtään täydellistä kaksirivistä elementtijoukkoa; ohitettuja rivejä: { $n_ignored }, ensimmäinen: { $first }

engine-e-geometry-sky-epoch = sky: epookki: { $e }

engine-geometry-and-more = { "." }.. ja { $more } lisää

engine-geometry-element-sets-propagated-by-the =
    { $n ->
        [one] { $n } elementtijoukko propagoitu moottorin SGP4:llä (WGS-72) ajanhetkeen { $iso } ja kierretty Maan mukana pyörivään kehykseen UT1:n ollessa UTC ja ilman napaliikettä: taivas, jonka nämä elementtijoukot antavat kyseisellä epookilla, ei sen mittaus.
       *[other] { $n } elementtijoukkoa propagoitu moottorin SGP4:llä (WGS-72) ajanhetkeen { $iso } ja kierretty Maan mukana pyörivään kehykseen UT1:n ollessa UTC ja ilman napaliikettä: taivas, jonka nämä elementtijoukot antavat kyseisellä epookilla, ei sen mittaus.
    }

engine-geometry-element-sets-propagated-by-the-2 =
    { $n ->
        [one] { $n } elementtijoukko propagoitu moottorin SGP4:llä (WGS-72) uusimman elementtijoukon epookkiin lisättynä time_s ({ $iso }). Epookkia ei annettu, joten tämä on edustava taivas, ei ilmoitetun päivämäärän taivas.
       *[other] { $n } elementtijoukkoa propagoitu moottorin SGP4:llä (WGS-72) uusimman elementtijoukon epookkiin lisättynä time_s ({ $iso }). Epookkia ei annettu, joten tämä on edustava taivas, ei ilmoitetun päivämäärän taivas.
    }

engine-e-geometry-sky-give-systems-or-tle = sky: anna `systems` tai `tle` (yhdessä kentän `site` kanssa) tai `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system nimeää `tle`-satelliitit; pyynnössä ei ole kenttää `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg on oltava välillä [-90, 90), saatiin { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` vaatii kentän `site` (tai `user_ecef_m`), josta katsotaan

engine-e-geometry-sky-time-must-be-finite = sky: time_s on oltava äärellinen

engine-e-geometry-sky-system-asks-for-satellites = sky: järjestelmä "{ $name }" pyytää satelliitteja: { $asked }; pyyntö sisältää enintään { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: satelliitteja enemmän kuin { $MAX_SATELLITES }

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` vaatii kentän `site` (tai `user_ecef_m`), josta katsotaan

engine-e-geometry-sky-more-than-satellites-above = sky: horisontin yläpuolella satelliitteja enemmän kuin { $MAX_SATELLITES }

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m on oltava positiivinen, saatiin { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence on oltava välillä (0, 1), saatiin { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: näkyvissä järjestelmiä enemmän kuin { $MAX_CLOCKS }, ja jokaisella on oma kellonsa; ryhmittele satelliitit harvempien `system`-nimiöiden alle tai käytä clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n on oltava välillä 1..={ $MAX_MC_SAMPLES }, saatiin { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: näkyvissä liian vähän satelliitteja paikkaratkaisuun; ei Monte Carlo -pilveä

engine-e-geometry-sky = sky: { $e }

engine-geometry-tle-sky-at-not-measurement = TLE-taivas hetkellä { $e }, ei mittaus

engine-e-geometry-invalid-sky-request-json = virheellinen sky-pyyntö (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = virheellinen sky-pyyntö (TOML): { $e }

engine-e-geometry-invalid-skyline-json = virheellinen horisonttiviiva (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = virheellinen horisonttiviiva (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = virheellinen GLONASS PRN kohdassa { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = sivutyyppiä { $pt } ei koodata tässä

engine-e-gnss-navmsg-gal-fnav-bits-expected = bittejä { $data }, odotettiin { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = bittejä { $p }, odotettiin { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = loppubitit eivät ole nollia

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q ei täsmää

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = sivutyyppiä { $pt } ei pura tässä

engine-e-gnss-navmsg-gal-fnav-symbols-expected = symboleja { $symbols }, odotettiin { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = synkronointikuviota ei löytynyt

engine-e-gnss-navmsg-gal-fnav-page-type-missing = sivutyyppi { $t } puuttuu

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = sivutyypin { $t } IOD_nav poikkeaa sivutyypin 1 arvosta

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = Galileo-kenttää { $name } ei ole

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = sanatyyppiä { $wt } ei koodata tässä

engine-e-gnss-navmsg-gal-inav-bits-expected = bittejä { $word }, odotettiin { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = sanatyyppiä { $wt } ei pura tässä

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = sivun osien on oltava 120 bittiä

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = parillinen/pariton-liput eivät ole 0 ja sitten 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = ei nimellissivu (sivutyyppi 1 on hälytyssivu)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = bittejä { $part }, odotettiin { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = symboleja { $symbols }, odotettiin { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = sanatyyppi { $t } puuttuu

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = sanatyypin { $t } IOD_nav poikkeaa sanatyypin 1 arvosta

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = tietue on järjestelmää { $system }, ei Galileoa

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = tyypillä 10 ei ole kenttää { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = tyypillä 11 ei ole kenttää { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = tyypillä 30 ei ole kenttää { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV-sisällössä on bittejä { $body }, odotettiin 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } tai TOW-laskuri { $tow_count } on alueen ulkopuolella

engine-e-gnss-navmsg-gps-cnav-bits-expected = bittejä { $bits }, odotettiin { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = alkutahti ei ole 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = viestityyppiä { $t } ei pura tässä

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = tarvitaan tyypin 10 ja tyypin 11 viesti

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } LSB-kohdassa { $value2 } ei mahdu: bittejä { $bits } { $v4 }

engine-e-gnss-navmsg-bits-layout-needs = bittejä { $bits }, asettelu vaatii { $need }

engine-e-gnss-navmsg-no-field = kenttää { $name } ei ole

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } asteikolla 2^{ $scale_pow2 } ei mahdu: bittejä { $bits } { $v1 }

engine-e-gps-lnav-no-value-for = ei arvoa kentälle { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: vertailumalli "gfc" vaatii kentän `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: gfc_path { $path } ei voi lukea: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: tuntematon vertailumalli `{ $other }` (käytä "egm2008" tai "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: tuntematon ellipsoidi `{ $other }` (käytä "wgs84" tai "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations on oltava vähintään 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations on rajattu arvoon 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = virheellinen reaaliluku '{ $t }'

engine-e-gravity-pds-bad-integer = virheellinen kokonaisluku '{ $t }'

engine-e-gravity-pds-empty-shadr-table = tyhjä SHADR-taulukko

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR-otsikossa on kenttiä { $f }, odotettiin vähintään 6

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR-otsikko: negatiivinen aste/kertaluku tai tuntematon normalisointi

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR-normalisoinnin tila { $normalization } (vain täysin normalisoitu, tila 1, on tuettu)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR-vertailupituuden/-leveyden on oltava 0

engine-e-gravity-pds-non-physical-gm-must-be = epäfysikaalinen GM (oltava äärellinen ja positiivinen)

engine-e-gravity-pds-non-physical-reference-radius-must = epäfysikaalinen vertailusäde (oltava äärellinen ja positiivinen)

engine-e-gravity-pds-shadr-record-fields = SHADR-tietue { $v1 }: kenttiä { $f }

engine-e-gravity-pds-shadr-record-bad = SHADR-tietue { $v1 }: virheellinen (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR-tietue { $v1 }: ei-äärellinen kerroin

engine-e-gravity-pds-no-shadr-coefficient-records = ei SHADR-kerrointietueita

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR-taulukko vaillinainen: puuttuu (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant puuttuu

engine-e-gravity-sh-missing-radius = radius puuttuu

engine-e-gravity-sh-non-physical-earth-gravity-constant = epäfysikaalinen earth_gravity_constant (oltava äärellinen ja positiivinen)

engine-e-gravity-sh-non-physical-radius-must-be = epäfysikaalinen radius (oltava äärellinen ja positiivinen)

engine-e-gravity-sh-no-gfc-coefficient-lines = ei gfc-kerroinrivejä

engine-e-gravity-sh-read-error = lukuvirhe: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = rivi { $lineno }: norm { $v } ei ole tuettu (vain fully_normalized)

engine-gravity-sh-line-bad = rivi { $lineno }: virheellinen { $what }

engine-e-gravity-sh-line-degree-above-the-declared = rivi { $lineno }: aste { $n } ylittää ilmoitetun max_degree-arvon { $dm }

engine-e-gravity-sh-line-order-above-degree = rivi { $lineno }: kertaluku { $m } ylittää asteen { $n }

engine-e-gravity-sh-line-time-variable-term-is = rivi { $lineno }: ajasta riippuva termi `{ $key }` ei ole tuettu (vain staattiset mallit)

engine-e-gravity-sh-missing-end-of-head = end_of_head puuttuu

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s on oltava positiivinen, saatiin { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s on oltava positiivinen, saatiin { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase = skenaario tuottaa epookkeja: { $n } (tarvitaan ≥ 2); kasvata duration_s tai pienennä step_s

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = tietue sisältää ei-äärellisen aikavirheen

engine-e-holdover-test-unknown-mask-expected-one-of = tuntematon maski { $id }; odotettiin yhtä seuraavista: { $masks }

engine-e-holdover-test-every-budget-max-abs-te = jokaisen budjetin max_abs_te_ns on oltava äärellinen ja positiivinen

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } on tietueen ulkopuolella ({ $t0_s } – { $t_end } s sen omalla aika-akselilla)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } on oltava myöhempi kuin gnss_removed_s ({ $gnss_removed_s }) eikä tietueen lopun ({ $t_end } s) jälkeen

engine-e-holdover-test-the-holdover-step-holds-no = holdover-vaihe ei sisällä yhtään näytettä

engine-holdover-test-the-record-has-no-step = tietueessa ei ole vaihetta { $step }: GNSS poistettiin sen ensimmäisessä näytteessä

engine-holdover-test-the-step-has-samples-the = vaiheessa { $step } on näytteitä: { $te_ns }; estimaattorit tarvitsevat vähintään 13

engine-e-holdover-test-step-with-mask-has-no = maskin sisältävällä vaiheella ei ole käyrää

engine-e-holdover-test-cannot-read-csv-path = csv_path { $path } ei voi lukea: { $e }

engine-holdover-test-recovered-after-gnss-returned = ; palautui { $t } s GNSS:n paluun jälkeen

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }{ $rec } (MODELLED, mitattu maskia vasten)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m on oltava äärellinen ja > 0, saatiin { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba on oltava >= 0 ja coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: kaksi haaraa eivät ole yhteisellä keskiarvoistusajalla. Optinen haara kerryttää ajalla integration_s = { $integration_s } s; RF-haaran silmukan kohinakaista B_L = { $dll_bandwidth_hz } Hz keskiarvoistaa ajalla 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Kahden eri keskiarvoistusajalla otetun sigman suhde ei ole vertailu, joten sellaista ei ilmoiteta. Poista rf_dll_bandwidth_hz-ohitus (silloin oletuksena on 1/(2*integration_s)) tai aseta se arvoon { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: haara ei ole käyttökelpoinen positiivinen äärellinen sigma (optinen { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), joten suhdetta ei muodosteta.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = tuntematon rf_band '{ $other }' (odotettiin s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name }: arvon on oltava äärellinen

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db on oltava äärellinen ja >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint = hybrid-optical-rf | optinen jalanjälki { $footprint_m } m, { $detected_photons } fotonia -> etäisyysmittauksen σ { $c } mm, ajoituksen σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | saatavuus { $c4 }% ({ $n_sites ->
        [one] { $n_sites } sijainti
       *[other] { $n_sites } sijaintia
    }) | luovutus ilman hyppyä { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | yhteinen FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Todennettu CRLB/χ²-PL/yhdiste/luovutus, Mallinnettu σ/ilmasto

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa on oltava välillä [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class on oltava >= 1

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | ilmaisin { $detector } | AUC { $auc_in } näytteessä / { $auc_out } näytteen ulkopuolella (ero { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ tavoite { $target_pfa } | { $n_cases ->
        [one] { $n_cases } tapaus
       *[other] { $n_cases } tapausta
    } | MODELLED synteettinen

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = tuntematon ilmaisin '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = tuntematon imu_grade { $other }; odotettiin yhtä seuraavista: navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = tuntematon combination { $other }; odotettiin yhtä seuraavista: rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = tuntematon trn_fix_mode { $other }; odotettiin yhtä seuraavista: none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name }: arvon on oltava äärellinen ja ei-negatiivinen (saatiin { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m on nimettävä vähintään yksi kynnys

engine-e-inertial-coast-crossing-thresholds-entries-must-be = crossing_thresholds_m-alkioiden on oltava äärellisiä ja positiivisia (saatiin { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades on nimettävä vähintään yksi IMU-luokka

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s on oltava äärellinen ja ei-negatiivinen (saatiin { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 on oltava äärellinen ja ei-negatiivinen (saatiin { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg on oltava äärellinen ja välillä (-89, 89) (saatiin { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m on oltava välillä [-1000, 100000] (saatiin { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s on oltava positiivinen

engine-e-inertial-coast-drift-band-must-satisfy-lo = ajautumiskaistan on täytettävä 0 < lo < hi (saatiin lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = ins-trn-coast-tuloksen serialisointi: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU, { $speed } m/s, yhdistelmä { $comb } | { $heads } | TRN { $mode } huippu { $peak_error_m } m jakson { $mission } s aikana

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va johdettu kylmäatomi-interferometrian fysiikasta)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = skenaarion koko tavuina on { $toml_text }, mikä ylittää rajan { $max_bytes } tavua

engine-e-inline-only-the-scenario-kind-reads-its = skenaariolaji `{ $kind }` lukee tietonsa isännän tiedostoista, joten tämä käyttöliittymä ei aja sitä; käytä komentoriviä `kshana`

engine-e-inline-only-the-field-names-file-this = kenttä `{ $k }` nimeää tiedoston: tämä käyttöliittymä hyväksyy vain sisäisen sisällön

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = jäljen JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = tuntematon aineisto `{ $key }`; hyväksytyt: { $v1 }, tai mukautettu aineisto

engine-e-interference-map-api-dataset-is-data-but-the = aineisto `{ $key }` on dataa lajia { $kind }, mutta syötteen laji on { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } ei ole päivämäärä muodossa YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = tuntematon valitsin `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = odotettiin paikkaargumentteja: { $positionals }, saatiin { $pos }

engine-e-interference-map-cli-cannot-read = ei voi lukea { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom vaatii { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } on jo olemassa; Kshana ei korvaa karttoja. Poista se tai valitse toinen --out-hakemisto

engine-interference-map-cli-note-cell-deg-is-not = huomautus: --cell-deg { $cell_deg } ei ole ennakkorekisteröity solukoko ({ $PREREGISTERED_CELL_DEG }); kartat kertovat tämän

engine-e-interference-map-cli-cannot-create = ei voi luoda { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = kirjoitettu { $path }: julkaistuja soluja { $cells }, merkittyjä { $n_deg }

engine-interference-map-cli-no-usable-rows-nothing-written = ei käyttökelpoisia rivejä: mitään ei kirjoitettu

engine-e-interference-map-cli-unknown-subcommand = tuntematon alikomento `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = ladatun tiedoston SHA-256 ({ $got }) ei vastaa kiinnitettyä arvoa ({ $expected }); se hylättiin

engine-e-interference-map-cli-cannot-write = ei voi kirjoittaa { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curlia ei löytynyt polusta PATH. Asenna curl tai lataa { $NATURAL_EARTH_LAND_URL } itse ja tarkista, että sen SHA-256 on { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = curlia ei voi ajaa: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = kirjoitettu { $out }: Natural Earth -maa-aluepolygonit, SHA-256 todennettu (public domain, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = ei trace_full_*-tiedostoja polussa { $path }

engine-e-interference-map-cli-cannot-read-2 = ei voi lukea { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } ei ole päivämäärä muodossa YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: virheellinen karttapäivä

engine-e-interference-map-cli-cannot-write-2 = ei voi kirjoittaa { $out }: { $e }

engine-interference-map-cli-route-length-km = reitin pituus { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Huomautukset: heikentynyt solu ei osoita häiriötä syyksi; havaitsemattomat solut eivät todista reittiä vapaaksi; tämä ei ole ennuste.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = maa-aluepolygonit: virheellinen JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = pakollinen sarake `{ $name }` puuttuu

engine-e-interference-map-cannot-read-input = syötettä ei voi lukea: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` ei ole päivämäärä (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours on oltava { $MIN_DELAY_HOURS } tai enemmän: observatorio ei julkaise aiemmin

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg on oltava { $MIN_CELL_DEG } tai karkeampi: observatorio julkaisee vain karkeita soluja

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } ei ole vielä julkaistavissa: sen tuote julkaistaan aikaisintaan { $fmt_utc } ({ $delay_hours } h päivän päättymisen jälkeen)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORIO  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG SOLUT  UTC-PÄIVÄ  NOT OBSERVED EI TARKOITA SELVÄÄ  SYYTÄ EI MÄÄRITETTY

engine-interference-map-observatory-source-licence = LÄHDE { $dataset }  LISENSSI { $dataset2 }

## src/interference_map/observatory.rs

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (JULKAISTUT SOLUT)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana-observatorio, ADS-B-navigointitarkkuuskartta, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = ei voi luoda { $path } (Kshana ei korvaa tuotteita): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = syötteessä ei ole käyttökelpoista raporttia päivältä { $day } (löydetyt päivät: { $days })

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } on jo olemassa; Kshana ei korvaa tuotteita

engine-interference-map-observatory-cells-published-degraded-incident = julkaistuja soluja { $p }, heikentyneitä { $p2 }, poikkeamia { $p3 }

engine-interference-map-observatory-rows-replayed-under-variants = rivejä toistettu: { $rows }, variantteja: { $variants }: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = kartta ei ole kelvollista JSONia: { $e }

engine-e-interference-map-route-route-invalid-json = reitti: virheellinen JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = reitti: rivi { $v1 } ei ole muotoa `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 } -vienti. Epookki: { $epoch_note }. Liikkuvat kohteet: GCRS (referenceFrame INERTIAL), metriä, sekunteja epookin jälkeen. Kiinteät sijainnit: Maan mukana pyörivä WGS 84 (referenceFrame FIXED), metriä.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Sijainti: GCRS, metriä.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Leveysaste { $lat_deg } deg, pituusaste { $lon_deg } deg, korkeus { $h_m } m WGS 84 -ellipsoidin yläpuolella. Sijainti: Maan mukana pyörivä, metriä.

engine-interop-czml-radius-along-the-ground = { $description }. Säde { $radius_m } m maanpintaa pitkin.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Ajaton: WGS 84 -pituus- ja leveysaste asteina, kiinnitetty maanpintaan.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Maan mukana pyörivät sijainnit; MultiLineString katkaistaan päivämäärärajalla, ja times_utc luettelee tällöin vain alkuperäiset näytteet.

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 } -vienti. Epookki: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = virheellinen GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString-kohteella ei ole coordinates-taulukkoa

engine-e-interop-geojson-an-rfc-7946-linestring-needs = RFC 7946 -mukainen LineString vaatii vähintään kaksi sijaintia

engine-interop-geojson-position-is-not-an-array = sijainti { $i } ei ole kahden tai kolmen luvun taulukko

engine-interop-geojson-position-longitude-is-not-number = sijainti { $i }: pituusaste ei ole luku

engine-interop-geojson-position-latitude-is-not-number = sijainti { $i }: leveysaste ei ole luku

engine-e-interop-geojson-position-longitude-is-outside-180 = sijainti { $i }: pituusaste { $lon } on välin [-180, 180] ulkopuolella (GeoJSONissa pituusaste on ensin)

engine-e-interop-geojson-position-latitude-is-outside-90 = sijainti { $i }: leveysaste { $lat } on välin [-90, 90] ulkopuolella (GeoJSONissa pituusaste on ensin)

engine-e-interop-geojson-track-needs-two-or-more = rata vaatii vähintään kaksi reittipistettä

engine-e-interop-geojson-the-route-spans-more-than = reitti kattaa yli 180 astetta pituuspiiriä; rataskenaariot etenevät tavallisina asteina eivätkä voi ylittää päivämäärärajaa

engine-e-interop-geojson-position-is-deg-from-an = sijainti { $worst } on { $worst2 } deg tasavälisestä suorasta radasta (toleranssi { $tol_deg } deg); rataskenaariot lentävät start + i*step, joten anna tasavälisiä sijainteja suoralla tai vain kaksi päätepistettä

engine-e-interop-geojson-route-applies-to-the-kinds = reitti koskee skenaariolajeja, jotka lentävät reittipisteradan (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` ei ota lentorataa syötteenä

engine-e-interop-geojson-scenario-toml-is-not-table = skenaarion TOML ei ole taulukko

engine-e-interop-geojson-cannot-serialise-scenario = skenaariota ei voi serialisoida: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = tuntematon vientimuoto '{ $other }'; odotettiin yhtä seuraavista: czml, kml, geojson, stk, sigmf, all tai list

engine-e-interop-member = jäsen { $label }: { $e }

engine-interop-the-scenario-could-not-be = skenaariota ei voitu viedä: { $m }

engine-e-interop-invalid-spectrum-scenario = virheellinen spektriskenaario: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } aikanäyte on enemmän kuin vienti kirjoittaa ({ $MAX_SAMPLES })
       *[other] { $n } aikanäytettä on enemmän kuin vienti kirjoittaa ({ $MAX_SAMPLES })
    }

engine-e-interop-scene-objects-samples-is-more-than = kohteita { $items } x näytteitä { $times } on enemmän kuin vienti kirjoittaa ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = virheellinen skenaario, laji { $kind }: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = häirintälaite { $jammer_type }, lähetysteho { $power_dbw } dBW, antennivahvistus { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, häirintälajin linkkiyhtälöistä, kun häirintälaite on vastaanottimen horisontissa ja vapaan tilan vaimennus

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (ketjun [pass]-vaihe)

engine-interop-scene-circular-orbit-km-altitude-deg = ympyrärata, korkeus { $altitude_km } km, inklinaatio { $inclination_deg } deg (SGP4:n keskimääräiset elementit ikkunan alussa, kuten passes-laji propagoi sen)

engine-interop-scene-ground-station-deg-elevation-mask = maa-asema, korkeuskulmamaski { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; GCRS- ja Maan mukana pyörivät tilat ovat ephemeris-lajin oma tuloste (UT1 ja napaliike skenaarion asettamina)

engine-interop-scene-static-scene-the-kind-flies = staattinen näkymä: laji { $kind } lentää ajattoman reittipisteradan

engine-interop-scene-true-track-flown-gps-denied = todellinen rata lennetty GPS-estettynä: reittipisteitä { $track } kohdasta start_lat_deg/start_lon_deg askelin step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` ei sisällä näkymää

engine-e-interop-scene-missing-numeric = numeerinen `{ $k }` puuttuu

engine-e-interop-scene-missing-integer-waypoints = kokonaisluku `waypoints` puuttuu

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } on välin 1..=1000000 ulkopuolella

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } korkeudella { $altitude_km } km, inklinaatio { $inclination_deg } deg (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = skenaario ei anna kenttää `epoch`; t = 0 on { $epoch }, aikaisin epookki, jonka satelliittien omat tiedot sisältävät (TLE, lähetetty efemeridi tai SP3-epookki). Jokainen satelliitti propagoidaan omasta epookistaan, ja ne kattavat { $spread_h } h: aikaleimat noudattavat moottorin oletusta, että jokainen satelliitti alkaa hetkellä t = 0, kun taas jokainen sijainti kierretään GCRS- ja Maan mukana pyörivään kehykseen kyseisen satelliitin omalla ajanhetkellä. SP3- ja OEM-viennit nimeävät t = 0 sen sijaan arvoksi 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = skenaario ei anna kenttää `epoch`; t = 0 on { $epoch }, epookki, jonka satelliittien omat tiedot sisältävät (TLE, lähetetty efemeridi tai SP3-epookki). SP3- ja OEM-viennit nimeävät t = 0 sen sijaan arvoksi 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = kohteita { $satellites } x näytteitä { $times_s } on enemmän kuin vienti kirjoittaa ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = käyttäjä { $user_environment }, liikkuva (lajin vakionopeus ja -suunta)

engine-interop-scene-user-receiver = käyttäjä { $user_environment } (vastaanotin)

engine-interop-scene-user-orbit-km-altitude-deg = käyttäjän rata, korkeus { $altitude_km } km, inklinaatio { $inclination_deg } deg (Kepler{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = liikkuvaa kohdetta { $index } ei ole

engine-interop-stk-kshana-export-object = # Kshana { $v1 } -vienti: { $scene }, kohde { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = häirintälaite { $jammer_type }, lähetysteho { $power_dbw } dBW, antennivahvistus { $gain_dbi } dBi (skenaarion linkkibudjetin parametri, ei signaali)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` ei sisällä ajoneuvon lentorataa vietäväksi; testipenkkivienti kattaa lajit gnss-ins, jamming ja gnss-sim

engine-e-interop-testbench-empty-motion-csv = tyhjä liike-CSV

engine-e-interop-testbench-motion-csv-header-is-not = liike-CSV:n otsikko ei ole odotetut sarakkeet: { $head }

engine-e-interop-testbench-row-fields-expected = rivi { $v1 }: kenttiä { $f }, odotettiin { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = rivi { $v1 }: sarake { $motion_columns } ei ole luku

engine-e-interop-testbench-line-no = rivi { $v1 }: ei merkkiä `$`

engine-e-interop-testbench-line-no-checksum = rivi { $v1 }: ei tarkistussummaa

engine-e-interop-testbench-line-bad-checksum-field = rivi { $v1 }: virheellinen tarkistussummakenttä

engine-e-interop-testbench-line-checksum-mismatch = rivi { $v1 }: tarkistussumma ei täsmää

engine-e-interop-testbench-line-short-gga = rivi { $v1 }: liian lyhyt GGA

engine-interop-testbench-line-bad-latitude = rivi { $v1 }: virheellinen leveysaste

engine-interop-testbench-line-bad-longitude = rivi { $v1 }: virheellinen pituusaste

engine-e-interop-testbench-line-bad-altitude = rivi { $v1 }: virheellinen korkeus

engine-e-interop-testbench-line-bad-separation = rivi { $v1 }: virheellinen geoidierotus

engine-e-interop-testbench-line-short-rmc = rivi { $v1 }: liian lyhyt RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = rivi { $v1 }: RMC ilman edeltävää GGA:ta

engine-e-interop-testbench-line-gga-and-rmc-times = rivi { $v1 }: GGA:n ja RMC:n ajat poikkeavat

engine-e-interop-testbench-line-bad-speed = rivi { $v1 }: virheellinen nopeus

engine-e-interop-testbench-line-bad-course = rivi { $v1 }: virheellinen kulkusuunta

engine-e-interop-testbench-line-bad-time-or-date = rivi { $v1 }: virheellinen aika tai päivämäärä

engine-e-interop-testbench-gga-with-no-following-rmc = GGA ilman seuraavaa RMC:tä

engine-e-interop-testbench-waypoint-file-needs-at-least = reittipistetiedosto vaatii vähintään kaksi näytettä

engine-e-interop-testbench-the-sample-step-is-not = näyteaskel { $step } s ei ole kokonaisluku millisekunteja

engine-e-interop-testbench-the-samples-are-not-equally = näytteet eivät ole tasavälisiä: väli { $v1 } on { $dt } s, ensimmäinen on { $step } s

engine-e-interop-testbench-empty-waypoint-file = tyhjä reittipistetiedosto

engine-e-interop-testbench-waypoint-not-three-numbers = reittipiste { $v1 }: ei kolmea lukua

engine-e-interop-testbench-waypoint-fields-expected = reittipiste { $v1 }: kenttiä { $f }, odotettiin 3

engine-e-interop-testbench-events-csv-header-is-not = tapahtuma-CSV:n otsikko ei ole label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = tapahtumarivi { $v1 }: odotettiin 5 kenttää

engine-e-interop-testbench-event-row-unknown-kind = tapahtumarivi { $v1 }: tuntematon laji { $f }

engine-e-interop-testbench-event-row-bad-onset = tapahtumarivi { $v1 }: virheellinen alku

engine-e-interop-testbench-event-row-bad-end = tapahtumarivi { $v1 }: virheellinen loppu

engine-interop-testbench-no-waypoints-txt-written = tiedostoa .waypoints.txt ei kirjoitettu: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = ei UTC-aika `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = puuttuu { $what }

engine-e-ionex-bad-number-in = { $what }: virheellinen luku kohdassa { $col }

engine-e-ionex-two-digit-year = { $what }: kaksinumeroinen vuosi { $year }

engine-e-ionex-no-end-of-header = ei END OF HEADER -riviä

engine-e-ionex-height-dependent-ionex-maps-are = korkeudesta riippuvia (3-D) IONEX-karttoja ei tueta

engine-e-ionex-zero-grid-step = ruudukon askel on nolla

engine-e-ionex-grid-needs-at-least-nodes = ruudukko vaatii vähintään 2 x 2 solmua

engine-e-ionex-map-no = kartta { $index }: ei { $end_label }

engine-e-ionex-map-band-latitude-header-grid = kartta { $index }: kaista { $band }, leveysaste { $band_lat }, otsikon ruudukko { $want }

engine-e-ionex-map-band-longitudes-differ = kartta { $index }: kaistan { $band } pituusasteet poikkeavat

engine-e-ionex-map-band-truncated = kartta { $index }: kaista { $band } katkaistu

engine-e-ionex-map-bands-header-grid-has = kartta { $index }: kaistoja { $band }, otsikon ruudukossa { $n_lat }

engine-e-ionex-map-no-epoch-of-current = kartta { $index }: ei EPOCH OF CURRENT MAP -riviä

engine-e-ionex-tec-maps-header-of-maps = TEC-karttoja { $tec_maps }, otsake # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = TEC-karttojen epookit eivät kasva

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz ei sisällä kokonaislukua näytteitä jaksoa { $code } kohti (näytteitä { $spc })

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods ja noncoherent on oltava positiivisia

engine-e-iq-acq-stream-ended-after-of-samples = virta päättyi näytteen { $got } jälkeen, tarvittiin { $needed }

engine-e-iq-acq-cfar-reference-cells-must-be = CFAR-vertailusolujen on oltava parillinen luku ja vähintään 2 (saatiin { $n })

engine-e-iq-acq-cfar-stride-must-be-at = CFAR-askeleen on oltava vähintään 1 viive

engine-e-iq-acq-cfar-per-cell-pfa-must = CFAR:n solukohtaisen Pfa:n on oltava välillä (0, 1) (saatiin { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = CFAR-ikkuna ulottuu { $reach } viivettä kummallekin puolelle, mikä on liian leveä { $samples_per_period } viiveen jaksolle

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = tuntematon pintamuoto { $s }: odotettiin csv, json tai bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = pinta sisältäisi soluja { $spc_cells } (raja { $MAX_SURFACE_CELLS }): suurenna Doppler-askelta tai kavenna Doppler-aluetta

engine-e-iq-acq-surface-surface-header = pinnan otsikko: { $e }

engine-e-iq-acq-surface-surface-schema-expected = pinnan skeema { $schema }; odotettiin { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = pinnan sisältö: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = tallenne '{ $id }': format ja sample_rate_hz on annettava yhdessä

engine-e-iq-campaign-conditions-test-conditions-json = testiolosuhteet (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = testiolosuhteet (TOML): { $e }

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf vaatii SigMF-tallenteen (saatiin { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF-metatiedot: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF-metatiedot: global core:sample_rate puuttuu

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start puuttuu

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: ei core:sample_count -kenttää eikä tehopisteitä tapahtuman päättämiseksi

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema on oltava "{ $SCHEMA }" (saatiin "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id ei saa olla tyhjä

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s on oltava äärellinen ja >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 on oltava 64 heksadesimaalinumeroa

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind on oltava "iq" tai "receiver-log" (saatiin "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = vähintään yksi [[expected]]-ryhmä vaaditaan

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids ei saa olla tyhjä

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } sisältää { $n } arvon; anna yksi tunnistetta kohti ({ $ids })
       *[other] { $at }: { $key } sisältää { $n } arvoa; anna yksi tunnistetta kohti ({ $ids })
    }

engine-e-iq-campaign-conditions-duplicate-id = { $at }: kaksoistunniste

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s on oltava onset_s:n jälkeen

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects on oltava "all" tai tunnisteiden lista

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: affects-tunniste { $bad } ei ole kohteessa [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q on oltava positiivinen

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points ei saa olla tyhjä

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points on oltava aikajärjestyksessä

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points on oltava äärellinen

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" vaatii kentän reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = tapahtumat '{ $id }' ja '{ $id2 }' menevät päällekkäin yhteisellä satelliitilla

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s on oltava >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s on oltava positiivinen

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = tallenne '{ $id }': SHA-256 { $sha } ei vastaa ilmoitettua arvoa { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: tallenteessa on näytteitä { $buf }, haun aloittamiseen tarvitaan { $n }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s on oltava positiivinen

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db on oltava positiivinen

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s on oltava >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz on oltava positiivinen

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs on oltava vähintään 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = kampanja (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = kampanja (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions on listattava vähintään yksi tiedosto tai glob-kuvio

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds on oltava >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = etupäiden nimien on oltava ei-tyhjiä ja yksilöllisiä ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' ei täsmää yhteenkään tiedostoon

engine-e-iq-campaign-spec-recording-id-appears-in-both = tallenteen tunniste '{ $w }' esiintyy sekä kohteessa { $w2 } että kohteessa { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names vaatii kentän inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: ei rakennetta '{ $n }' kohteessa { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = totuusrivi { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0-profiili: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0-profiili: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segmentti { $i }: askelarvojen on oltava äärellisiä

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segmentti { $i }: ramppi vaatii ehdon end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segmentti { $i }: pisteiden t_s ja db on oltava yhtä pitkät ja ei-tyhjät

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segmentti { $i }: t_s on kasvettava aidosti

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segmentti { $i }: pisteiden on oltava äärellisiä

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segmentti { $i }: häipymän s4 on oltava välillä (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segmentti { $i }: häipymän tau_s on oltava positiivinen

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: tallenteessa on näytteitä { $samples }, tähän hakuun tarvitaan { $need }

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: nimeä muoto valitsimella --surface-format csv|json|bin tai päätä polku tunnisteeseen .csv, .json tai .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = haku: { $fs_hz } Hz, koherentteja jaksoja: { $coherent_periods } x epäkoherentteja: { $noncoherent }, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = raportti koottu uudelleen: soluja { $cells_present } / { $cells_total }, rivejä { $rows }, kynnyksen alittavia { $rows_failed }; tiiviste { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    kampanja { $name }: soluja { $cells_total }; jo tehty { $cells_skipped }, ajettu nyt { $cells_run }, epäonnistunut { $cells_failed }, odottaa { $cells_pending }
    tuloste: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    ensimmäinen virhe ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: tapahtumia { $events }, odotettuja satelliitteja { $tc }; ehtojen tiiviste { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono vino { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono pysty { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo vuoden päivä { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = tuikinta S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = monitie { $h }m, maa { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground on oltava dry, wet tai sea (saatiin { $other })

engine-e-iq-cli-channel-give-at-most-one-of = anna enintään yksi valitsimista --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass odottaa muotoa lo,hi (saatiin { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass vaatii ehdon lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } siirtymäkaistalla { $transition } Hz ei mahdu alle fs/2:n ({ $v1 } Hz); kavenna kaistaa tai siirtymäkaistaa

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits on oltava 1..=16 (saatiin { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = suodatettu näytteitä { $total } ({ $fs_hz } Hz) kohteeseen { $out } ({ $format }); sivutiedosto { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = ei voi lukea { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = virheellinen labfit-skenaario: { $e }

engine-iq-cli-labfit-fitted-run-wrote = sovitettu ajoja: { $runs }; kirjoitettu { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = sovitettu yksiköitä kampanjasta: { $fit_units }; kirjoitettu { $written }

engine-iq-cli-labfit-cannot-write = ei voi kirjoittaa { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } vaatii arvon

engine-e-iq-cli-cannot-parse = { $k }: ei voi jäsentää { $v }

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } ottaa { $n } paikkaargumentin, saatiin { $pos }
       *[other] iq { $cmd } ottaa { $n } paikkaargumenttia, saatiin { $pos }
    }

engine-e-iq-cli-cannot-parse-2 = { $k }: ei voi jäsentää { $p }

engine-iq-cli-unknown-iq-processing-command-expected = tuntematon iq-käsittelykomento { $other }; odotettiin yhtä seuraavista: scene, acquire, track, sweep, labfit, frontend, monitor, campaign tai conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } on GPS:n alueen ulkopuolella

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = pyydetyille PRN-numeroille ei löytynyt terveitä GPS-efemerideja

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos odottaa muotoa lat,lon,alt (saatiin { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; C/N0-profiili (segmenttejä: { $segments })

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format on oltava csv tai jsonl (saatiin { $other })

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ; kokonaislukuskaala: 1 LSB = { $sc } kohinanormalisoitua yksikköä (odotettu RMS { $v1 } LSB komponenttia kohti), leikattuja alkioita: { $clipped }

engine-iq-cli-scene-written-by-kshana-iq-scene = kirjoittanut kshana iq scene: SIMULOITU näkymä, ei tallenne{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = ION SDR -metatiedot { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF-data { $data_path }, metatiedot { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = kirjoittanut kshana iq scene{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = kirjoitettu näytteitä { $samples } ({ $format }, { $fs_hz } Hz) kohteeseen { $data_path }; totuustietueita { $truth_records } kohteeseen { $truth_path }; { $meta_note }; kanava: { $chan_desc }{ $scale_note }

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } ei voi yhdistää valitsimeen --design: sweep ajaa kaikki tiedoston rakenteet

engine-iq-cli-sweep-loop-design-sweep-design-prn = silmukkarakenteiden sweep: tuloksia { $rows } (rakenne, PRN){ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: tallenteessa on näytteitä { $samples }, haun aloittamiseen tarvitaan { $need }

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: ei löytynyt (tunnusluku { $statistic } < kynnys { $threshold }); suurenna arvoa --doppler-max, --acq-coherent tai --acq-noncoherent tai tarkista tallenne

engine-iq-cli-track-designs-and-differ-in-integration = rakenteet { $first } ja { $d } poikkeavat kentässä integration.extra_taps_chips; yhden ajon rakenteiden on oltava yhtenevät, jotta jokaisella tulostetietueella on samat sarakkeet

## src/iq/cli/track.rs

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: nimeä muoto valitsimella --epochs-format csv|jsonl|bin tai päätä polku tunnisteeseen .csv, .jsonl tai .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz on { $r } näytettä per chip kohteessa { $c }: yhteismitallinen näytteistys muuttaa koodidiskriminaattorin portaikoksi (2 näytteellä/chip DLL värähtelee, noin 0,09 chipin RMS-koodivirhe tasolla 45 dB-Hz); koodisilmukan värinä ja harha tästä tallenteesta eivät ole edustavia. Arvioi koodisilmukoita käyttämällä näytteistystaajuutta, joka ei ole chip-taajuuden puolikkaan monikerta.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = työntekijä päättyi ennen tämän syötteen käsittelyä

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = tuntematon valitsin { $s }

engine-e-iq-io-cli-format-needs-rate = --format vaatii valitsimen --rate

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } ottaa { $n } polkuargumentin, saatiin { $pos }
       *[other] iq { $cmd } ottaa { $n } polkuargumenttia, saatiin { $pos }
    }

engine-iq-io-cli-unknown-iq-command = tuntematon iq-komento { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated = kirjoitettu näytteitä { $n } ({ $to }, { $fs_hz } Hz) kohteeseen { $files }; saturoituneita alkioita: { $w }{ $v4 }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow lukee vain yksikanavaisia tallenteita

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow lukee tallenteen, jossa on yksi kaappaus; tässä on { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: ei positiivista core:sample_rate -arvoa

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: kaappaus ei ala tavurajalta

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = tuntematon näytemuoto { $name }: odotettiin esim. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, kompleksiselle päätteenä voi olla lisäksi _qi

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sivutiedoston sample_rate_hz { $sample_rate_hz } ei ole positiivinen

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: .sdrx-tallenteet sisältävät yhden virran; kanavaa { $channel } ei ole

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: raakatiedosto ilman sivutiedostoa; ilmoita sen muoto tai kirjoita { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = riviä ei voi serialisoida: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = virheellinen suodinrakenne { $design }: passband_frac välillä (0, 1), vaimennus > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz on oltava aidosti välillä 0 ja puolet näytteistystaajuudesta ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx-data: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-bittinen { $enc } { $fmt } ({ $packed_bits } bittiä/näyte)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = tukematon SigMF core:datatype { $datatype }: tuettuja ovat ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be sekä reaaliset ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } ei ole SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = virheelliset SigMF-metatiedot: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format }:lla ei ole SigMF core:datatype -arvoa; kirjoita se raakana

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } ei vastaa ensimmäisen tallenteen arvoa { $c0 }

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: ei core:sample_rate -arvoa

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } ei ole positiivinen

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } taajuudella { $rate } Hz ei vastaa ensimmäisen tallenteen arvoa { $f0 } taajuudella { $r0 } Hz

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out = { $name }: kaappaus näytteessä { $sample_start } on väärässä järjestyksessä tai datan näytemäärän ({ $n_file }) ulkopuolella

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: ensimmäinen kaappaus ei ala tavurajalta

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = pyydetty kanavaa { $channel }; tallenteessa on kanavia { $channels } (kanavat lasketaan numerosta 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = virheellinen SigMF-kokoelma: { $e }

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } ei vastaa kokoelman arvoa { $h }

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = virtaa { $select } ({ $channels } lomitetusta virrasta) ei ole olemassa (virrat lasketaan numerosta 0)

engine-e-iq-io-stream-sample-of-does-not-start = näyte { $k } muodossa { $format } ei ala tavurajalta

engine-e-iq-io-stream-time-window-start-duration-both = aikaikkunan alku { $start_s } s, kesto { $duration_s } s: molempien on oltava ei-negatiivisia

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = haitallisin ilmoitettu Q (cw): ei taulukkoarvoa tyypille `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: kampanja ei ole valmis

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } ei vastaa soluja ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = tallenne `{ $id }`: testiolosuhteiden tiiviste { $h } ei vastaa tallennettua arvoa { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signaali `{ $signal }`: tuntematon chip-taajuus

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = yksikään ajo ei ole käyttökelpoinen lukitussovitukseen: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = riittämätön data: ei sovitettu (tallenteita { $m }; vähintään { $min_rec } tarvitaan)

engine-iq-labfit-iqfit-uncensored-span-db-is-under = sensuroimaton J/S-väli { $span_db } dB on alle { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff ja delta eivät ole erikseen tunnistettavissa (|corr| { $full } >= { $v2 }): malli riippuu vain suureesta delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed = ei sovitettu: uudelleenhakuja havaittu { $n_reacq } (vähintään 3 tarvitaan)

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = tuntematon tila `{ $m }` (vain `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage on oltava [lower, upper] välillä [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds on oltava [lower, upper] ehdolla 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db on oltava [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = kampanjassa ei ole tapahtumaa, jolla on ilmoitettu tehoprofiili sovitettavaksi

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Lab-sovitus IQ-kampanjasta: { $r }

    Skeema `{ $schema }`, moottori { $engine_version }. Nimiö: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = Kampanjan DIGEST `{ $campaign_digest }`; `campaign.json` SHA-256 `{ $campaign_json_sha256 }`; skenaarion SHA-256 `{ $scenario_sha256 }`; soluja: { $cells }; bootstrap-toistoja: { $bootstrap } (siemenluku { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Yksikkö { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Tila: { $status }. Tallenteita { $recordings }, satelliitteja { $satellites }, tapahtumia { $events }; sovitettuja binejä { $bins_used }, sensuroituja { $bins_censored }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0-malli ({ $q_mode }): `delta_eff` = { $ci } dB (tunnistettava siirtymä, suhteutettuna arvoon Q = 1); `Q_eff` = { $q }; `delta` tällä Q:lla = { $ci2 } dB; corr(Q, delta) { $om }; jäännös-RMS { $residual_rms_db } dB J/S-välillä { $span_db } dB. Q_eff ei ole tunnistettavissa C/N0-datasta ilman riippumatonta tehomittausta.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q pidetty ilmoitetussa arvossaan: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = Kynnys J/S, suora: mediaani { $om } dB, menetyksiä { $n } (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Hold-out (yksi tallenne pois kerrallaan), interpolaatio: binejä { $bins }, C/N0 RMS { $om } dB, PI90-kattavuus { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = ; { $model }: tapahtumia { $n }, menetysajan RMS { $om } s, PI90-kattavuus { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    Validointitaulukon SHA-256 `{ $table_sha256 }` (rekisteröity { $registered }):

    | kynnys | raja | arvo | verdikti |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = ajon `{ $label }` loki

engine-e-iq-labfit-run = ajo `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = skenaarion [input] ei nimeä kampanjaa

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign ja [[runs]] ovat toisensa poissulkevia: anna toinen

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit-skenaario: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = lokissa ei ole satelliittikohtaista C/N0-arvoa{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = ei epookkia ennen alkua kohdassa { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = ei epookkia alun kohdassa { $onset } s tai sen jälkeen

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Lab-sovitus: { $r }

    Nimiö: **{ $label }**. Asetusten SHA-256 `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db = { "\u000A" }C/N0-näytteitä: { $n_samples }, jäännös-RMS { $om } dB.{ $r }{ "\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Malli: { $model } ({ $label })

    | parametri | arvo | rajat | rajalla | bootstrap-keskihajonta (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }Tapahtuma-ajan RMS { $om } s, tapahtumia { $n_events }; menetyksiä puuttuu { $loss_missed } / ylimääräisiä { $loss_extra }, uudelleenlukituksia puuttuu { $reacq_missed } / ylimääräisiä { $reacq_extra }.

    | ajo | pudotus dB-Hz | uudelleenlukitus dB-Hz | tapahtumat | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Hold-out ({ $scheme }, { $folds } osaa): kaikki { $om } s, interpolaatio { $om2 } s, ekstrapolaatio { $om3 } s.

    | pidätetty ajo | luokka | etäisyys | lähin opetusajo | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } on varattu tulevaa käyttöä varten (vain FID 0 on määritelty)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } on välin 0..=99 ulkopuolella

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = SB1-symboleja, jotka poikkeavat dekoodatusta kentästä: { $sb1_err }

engine-iq-lunanet-afs-frames-at-and-are-symbols = kehysten { $w } ja { $w2 } etäisyys symboleina on { $gap }, ei { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } seuraa arvoa TOI { $w2 }, odotettiin { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = odottamaton merkki { $c } symbolivirrassa (vain 0, 1 ja tyhjä merkki)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: ensimmäiset 24 chipiä poikkeavat

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: viimeiset 24 chipiä poikkeavat

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (dokumentti tulostaa A14850 sekä PRN 147:lle että PRN 151:lle; generaattori toistaa PRN 151:n arvon, joten PRN 147:n rivi on todennäköisesti dokumentin painovirhe)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = koodattu 0x{ $word }, dekoodattu FID { $fid } TOI { $toi }

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = monitorin asetukset: { $e }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = staattinen sijainti ei ole äärellinen

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = vakionopeusrata ei ole äärellinen

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = reittipisteradalla ei ole reittipisteitä

engine-e-iq-scene-geometry-waypoint-not-finite = reittipiste ei ole äärellinen

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = reittipisteiden aikojen on kasvettava aidosti

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } ei ole GPS C/A -PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = efemeridijärjestelmä { $system } ei ole GPS

engine-e-iq-scene-satellite = satelliitti { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = on pilotti- (datavapaa) komponentti eikä kanna navigointidataa

engine-e-iq-scene-nav-carries-data-the-scene-does = kantaa dataa, jota näkymä ei mallinna; luo se ilman dataa

engine-e-iq-scene-nav-does-not-carry-gps-lnav = ei kanna GPS LNAV -dataa (vain GPS L1 C/A kantaa); käytä siemenlukudataa

engine-e-iq-scene-nav-not-an-lnav-source = ei ole LNAV-lähde

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = näkymä vaatii vähintään yhden satelliitin (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler sisältää arvoja: { $dopplers }; anna yksi kutakin --prn-arvoa kohti ({ $ids }) tai yksi arvo

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = totuusrivillä on kenttiä { $f }, odotettiin 10

engine-e-iq-scene-truth-truth-field = totuuskenttä { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = totuuden sat_id: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz on oltava positiivinen luku

engine-e-iq-short-duration-must-be-in = duration_s on oltava välillä (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids on sisällettävä 1–{ $MAX_SATELLITES } satelliittia

engine-e-iq-short-dopplers-must-be-finite = dopplers on oltava äärellisiä

engine-e-iq-short-samples-requested-short-run-holds = pyydetty näytteitä: { $n }; lyhyt ajo sisältää enintään { $MAX_SAMPLES }

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C -data PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C -pilotti PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } on alueen ulkopuolella

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF -taajuuskanava { $id } on välin -7..=6 ulkopuolella

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = tuntematon signaali { $other }; odotettiin yhtä seuraavista: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = rivi { $v1 }: ei merkkiä ';'

engine-e-iq-signals-galileo-line-no-code-number-in = rivi { $v1 }: ei koodinumeroa kohdassa { $label }

engine-e-iq-signals-galileo-code-appears-twice = koodi { $number } esiintyy kahdesti

engine-e-iq-signals-galileo-codes-the-icd-defines = { $path }: koodeja { $n }, ICD määrittelee { $CODES_PER_COMPONENT }

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primääri { $primary_prn } S{ $secondary } tertiääri { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primääri { $primary_prn } S{ $secondary } (tertiääri jätetty pois)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = ei-heksadesimaalimerkki { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } heksasymbolia ei voi sisältää täsmälleen { $len } chipiä

engine-iq-signals-primary-only = { $name } (vain primääri)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC-seuranta vaatii early-late-välin väliltä (0, { $max }) chip, jotta E ja L pysyvät pääpiikillä (saatiin { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = bump-jump-kynnyksen on oltava vähintään 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = näytteistystaajuuden on oltava positiivinen

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods on oltava positiivinen

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows on oltava positiivinen

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } on jaettava bitin pituudella { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = enintään { $MAX_EXTRA_TAPS } lisähaaraa tuetaan (saatiin { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = lisähaarojen siirtymien on oltava äärellisiä ja välillä ±{ $MAX_TAP_OFFSET_CHIPS } chip (saatiin { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = C/N0-ikkuna vaatii vähintään 2 prompt-arvoa

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: odotettiin atan2, costas-atan tai costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: odotettiin cross-product, atan2 tai atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: odotettiin pull-in tai always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: odotettiin eml-power, dot-product tai eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: odotettiin pll, fll tai fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } ei päde, kun carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: odotettiin lukua >= 0 (0 poistaa rajoituksen käytöstä)

engine-e-iq-track-design-must-be-positive-number-got = { $k }: oltava positiivinen luku (saatiin { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods on oltava vähintään 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips on oltava välillä (0, 2] (saatiin { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips sisältää enintään { $MAX_EXTRA_TAPS } siirtymää (saatiin { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = integration.extra_taps_chips-siirtymien on oltava äärellisiä ja välillä ±{ $MAX_TAP_OFFSET_CHIPS } chip (saatiin { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) on oltava pienempi kuin carrier.fll_off_pli ({ $off }), molemmat välillä (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s on oltava nolla tai positiivinen (saatiin { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s on oltava positiivinen (saatiin { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order on oltava 1, 2 tai 3 (saatiin { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order on oltava 1 tai 2 (saatiin { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order on oltava 1 tai 2 (saatiin { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold on oltava välillä [-1, 1] (saatiin { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows on oltava vähintään 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods on oltava vähintään 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) ei saa olla pienempi kuin lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db on oltava äärellinen

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes on oltava vähintään 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods on oltava vähintään 1 (tai "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent on oltava vähintään 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa on oltava välillä (0, 1) (saatiin { $pfa })

engine-e-iq-track-design-design-overrides = rakenteen ohitukset: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = rakenteen ohitukset eivät saa asettaa kenttää name tai extends

engine-e-iq-track-design-loop-design-file = silmukkarakennetiedosto: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = silmukkarakennetiedosto: skeemaa { $other } ei tueta; odotettiin { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = silmukkarakennetiedosto: schema = { $SCHEMA } puuttuu

engine-e-iq-track-design-loop-design-file-no-design = silmukkarakennetiedosto: ei [[design]]-taulukoita

engine-e-iq-track-design-loop-design-file-design-number = silmukkarakennetiedosto: [[design]] numero { $v1 } ei sisällä nimeä

engine-e-iq-track-design-loop-design-file-design-name = silmukkarakennetiedosto: rakenteen nimi { $name } on varattu tai tyhjä

engine-e-iq-track-design-loop-design-file-design-is = silmukkarakennetiedosto: rakenne { $name } on määritelty kahdesti

engine-e-iq-track-design-no-design-named-the-file = ei rakennetta nimeltä { $n }; tiedostossa on { $value }

engine-e-iq-track-design-loop-design-file-design-extends = silmukkarakennetiedosto: rakenne { $name } laajentaa itseään (kehä)

engine-e-iq-track-design-loop-design-file-design-extends-2 = silmukkarakennetiedosto: rakenne { $name } laajentaa tuntematonta rakennetta { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = vaihesilmukka vaatii kertaluvun 1..=3 ja Bn > 0 (saatiin { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = taajuussilmukka vaatii Bn > 0 (saatiin { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = taajuussilmukan kertaluvun on oltava 1 tai 2 (saatiin { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = silmukkasuodin vaatii vaihepolun, taajuuspolun tai molemmat

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = early-late-välin on oltava välillä (0, 2] chip (saatiin { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = DLL:n kertaluvun on oltava 1 tai 2 (saatiin { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = chip-taajuuden ja kantoaaltotaajuuden on oltava positiivisia

## src/iq/track/sink.rs

engine-e-iq-track-sink-an-epoch-carries-extra-taps = epookki sisältää lisähaaroja { $extra }, mutta tuloste on määritetty arvolle { $n }: ajon jokaisen kanavan on käytettävä samaa extra_taps_chips-arvoa

engine-e-iq-track-sink-record-is-bytes-expected = tietueen koko tavuina on { $b }; odotettiin { $want }

engine-e-iq-track-sink-unknown-lock-state-code = tuntematon lukitustilakoodi { $b }

engine-e-iq-track-sink-epoch-file-header = epookkitiedoston otsikko: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = epookkitiedoston skeema { $schema }; odotettiin { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = epookkitiedoston tietueiden koko tavuina on { $record_bytes }; tämä lukija odottaa { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } lisähaaraa kohti)

engine-e-iq-track-sink-epoch-file-ends-inside-record = epookkitiedosto päättyy tietueen sisällä (tavuja { $got } / { $size })

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = epookkimuoto { $o }: odotettiin csv, jsonl tai bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` ei ole luku

engine-e-jammertest-cli-is-not-utf-text = { $path } ei ole UTF-8-tekstiä

engine-e-jammertest-cli-needs-catalog = vaatii valitsimen --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = vaatii vähintään yhden --plan-valitsimen

engine-e-jammertest-cli-is-not-utf = { $cat } ei ole UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } ei ole UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` ei ole yksi arvoista ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` ei ole UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = vaatii valitsimen --log-start tai --log yhdessä valitsimen --format kanssa

engine-e-jammertest-cli-log-needs-format = --log vaatii valitsimen --format

engine-e-jammertest-cli-the-log-does-not-state = loki ei ilmoita alkuaikaansa: käytä valitsinta --log-start

engine-e-jammertest-cli-the-log-states-its-start = loki ilmoittaa alkunsa muodossa `{ $label }`: käytä valitsinta --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } ei ole UTF-8

engine-e-jammertest-cli-cannot-write = ei voi kirjoittaa { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = kirjoitettu { $o }: { $SCHEDULED_TRUTH }-tapahtumia { $events } (ohitettuja ei-RF-ajankohtia { $skipped_non_rf }, lokin ulkopuolella { $outside_log }, luettelossa olemattomia tunnisteita { $unknown_ids })

engine-jammertest-cli-note-ids-not-in-the = huomautus: luettelossa olemattomat tunnisteet: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = huomautus: nämä ovat suunnitelman aikataulutetut ajankohdat, eivät tallennettuja lähetysaikoja.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  testin nimi

## src/jammertest/cli.rs

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = testejä { $tests }, arvioitavia { $evaluable }: havaittu toleranssin sisällä { $detected }, myöhässä { $late }, ohi { $missed }; mediaaniviive { $fmt_opt }, mediaani palautumisaikaan { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = väärät hälytykset kaikkien ajankohtien ulkopuolella: ajoja { $false_alarm_runs }, epookkeja { $false_alarm_epochs } / { $clean_epochs } puhtaasta

engine-e-jammertest-cli-needs-session-path = vaatii istuntopolun

engine-e-jammertest-cli-needs-catalog-and-plan-or = vaatii valitsimet --catalog ja --plan tai valitsimen --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = todistepaketti kirjoitettu kohteeseen { $out }; allekirjoittajan sormenjälki { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = ei kansiota, jossa on scenario.json ja .ubx, polun { $root } alla

engine-e-jammertest-dataset-scenario = skenaario: { $e }

engine-e-jammertest-dataset-read = luku: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json ei sisällä päivämäärää

engine-e-jammertest-dataset-scenario-json-date-is-not = scenario.json:n date `{ $date }` ei ole päivämäärä

engine-e-jammertest-dataset-no-readable-epoch-in-mon = ei luettavaa epookkia tiedostoissa mon_rf.csv tai rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = ei kansiota, jossa on scenario.json, polun { $root } alla

engine-jammertest-dataset-recovered-of-median = { $f2 } palautui ({ $recovered } / { $alarmed }), mediaani { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = loki ilmoittaa alkunsa muodossa `{ $l }`, joka ei ole UTC ISO-8601: anna alku erikseen

engine-e-jammertest-the-log-does-not-state = loki ei ilmoita alkuaikaansa: anna se erikseen

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = luettelo ei ole JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = luettelossa ei ole `test_types`-taulukkoa

engine-e-jammertest-plan-test-type-has-no-type = testityypillä ei ole kenttää `type_id`

engine-e-jammertest-plan-test-group-has-no-group = testiryhmällä ei ole kenttää `group_id`

engine-e-jammertest-plan-test-has-no-test-id = testillä ei ole kenttää `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = luettelo ei listaa yhtään testiä

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` ei ole suunnitelma-aika, kuten 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = suunnitelma ei ole JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = suunnitelmassa ei ole `locations`-taulukkoa

engine-e-jammertest-plan-test-end-time-is-not = testi { $id }: end_time ei ole start_time:n jälkeen

engine-e-jammertest-plan-the-plan-has-no-test = suunnitelmassa ei ole testialuetta { $l }; siinä on { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = suunnitelmassa on useita testialueita { $areas }; kerro, millä alueella loki tallennettiin

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json ei ole JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = ei `attack_log`-taulukkoa

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024 testi { $id } ikkuna { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log ei sisällä alku-/loppuikkunaa

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = aikataulutettuja tapahtumia { $events }, mutta ajo pisteytti { $events2 }: anna ajon omat tapahtumat

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s on oltava positiivinen ja guard_s ei-negatiivinen

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m on listattava vähintään yksi elementti

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m on oltava äärellinen

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: odotettiin "null-steering" tai "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz on oltava positiivinen (saatiin { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: osio vaatii [jammer]-osion

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) on oltava äärellinen ja vähintään tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s on oltava äärellinen ja ei-negatiivinen (saatiin { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits on oltava 1–16 (saatiin { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz on oltava positiivinen (saatiin { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side on oltava vähintään 2 (saatiin { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } on oltava äärellinen (saatiin { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } on oltava positiivinen (saatiin { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: profiilipiste { $points } ({ $lat }, { $lon }) on DEM-ruudun ulkopuolella

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: profiilipiste { $points } ({ $lat }, { $lon }) on DEM-aukossa

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC-kalenteripäivä alueen ulkopuolella: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = ei tällaista kalenteripäivää: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC-sekunti { $second } alueen ulkopuolella kohdassa { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = napa-alueella sijaitsevalla laukaisupaikalla ei ole määriteltyä atsimuuttia

engine-e-launch-inclination-unreachable-from-latitude-without = inklinaatio { $inclination_rad }° ei ole saavutettavissa leveysasteelta { $lat_rad }° ilman dogleg-ohjausta (tarvitaan |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = todellisen navan paikan nopeus vaatii sekä `epoch`- että `eop_finals2000a`-kentän (todellinen IERS finals2000A -sisältö)

engine-e-launch-site-lon-deg-must-be = site_lon_deg on oltava välillä [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a ei sisältänyt luettavia IERS finals2000A -rivejä

engine-e-launch-epoch-mjd-is-outside-the = epookki { $epoch } (MJD { $mjd_utc }) on annettujen EOP-rivien ulkopuolella (MJD { $mjd } – { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg on oltava välillä [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg on oltava välillä [0, 180]

engine-launch-launch-window-lat-az-asc = launch-window: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° nouseva, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s Maan pyörimisen etu, { $opportunities } mahdollisuutta/vrk (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = jokainen etäisyysmuutosnopeus vaatii positiivisen äärellisen sigman

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = mittaukset eivät riitä Doppler-tuntemattomien ratkaisemiseen: mittauksia { $n_meas }, tuntemattomia { $n }

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = Doppler-geometria on singulaarinen

engine-e-leo-fusion-doppler-no-covariance = ei kovarianssia

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = jokainen pseudoetäisyys vaatii positiivisen äärellisen sigman

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = pseudoetäisyydet eivät riitä tuntemattomien ratkaisemiseen: pseudoetäisyyksiä { $obs }, tuntemattomia { $n } (3 paikkaa + kelloja: { $n_clock })

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = satelliitti yhtyy paikka-arvioon

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = geometria on singulaarinen

engine-e-leo-fusion-joint-pvt-no-iteration-ran = iteraatiota ei ajettu

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = rappeutunut lopullinen geometria

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP ei ole äärellinen

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } on oltava positiivinen

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m on oltava ei-negatiivinen ja ajossa saa olla enintään 5000 epookkia

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = jokainen signaali vaatii positiivisen kaistanleveyden

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz = 5G NTN -paikannus taajuudella { $r } MHz, C/N0 { $r2 } – { $r3 } dB-Hz, { $n_satellites ->
        [one] { $n_satellites } satelliitti
       *[other] { $n_satellites } satelliittia
    } ({ $mean_in_view } näkyvissä){ "\u000A" }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, CRB-etäisyysvirhe { $range_sigma_zenith_m } – { $range_sigma_mask_m } m; mediaani formaali 3D { $s2 } m, RMS-virhe { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples = { "  " }yhden satelliitin Doppler-ylilento: { $n_obs ->
        [one] { $n_obs } näyte
       *[other] { $n_obs } näytettä
    } ajalta { $duration_s } s, vaakavirhe { $horizontal_error_m } m{ "\u000A" }

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP vaatii vähintään yhden järjestelmän

engine-e-leo-fusion-ppp-duration-and-step-must-be = keston ja askeleen on oltava positiivisia, enintään 20000 epookkia

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs on oltava 1–200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = konvergenssikynnysten on oltava positiivisia

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical = PPP-konvergenssi tasoon { $criterion_horizontal_m } m vaaka / { $criterion_vertical_m } m pysty, ajoja tapausta kohti: { $runs_per_case }, GNSS-satelliitit: { $n_gnss }{ "\u000A" }

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  mediaani { $c } min  konvergoitunut { $v4 }%  NEES keskiarvo { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = mediaani vaakavirhe { $runs_per_case } ajon yli · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = esiasetus { $id } ei sisällä signaalia

engine-e-leo-fusion-presets-preset-has-no-signal-it = esiasetuksella { $id } ei ole signaalia { $n }; sillä on { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = tuntematon LEO-esiasetus { $id }; tunnetut: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s ja step_s on oltava positiivisia, enintään 20000 epookkia

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = polaaristen askelten on oltava positiivisia

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode on oltava doppler, joint, polar tai timing; saatiin { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = doppler-tila vaatii vähintään yhden LEO-järjestelmän

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = timing-tila vaatii LEO-järjestelmän, jossa on koodietäisyysmittaus

engine-e-leo-fusion-pvt-kind-unknown-clock-class = tuntematon kelloluokka { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) kohdassa { $user_lat_deg }, { $user_lon_deg } ajalta { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } satelliitteja { $n_satellites }, korkeus { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites = { "  " }Doppler-ratkaisu: mittauksia { $n_obs }, satelliitteja { $n_sats }, 3D-virhe { $error_3d_m } m (vaakavirhe { $horizontal_error_m } m){ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }ikkuna { $window_s } s: satelliitteja { $n_sats }, 3D-virhe { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } ylilento: suurin Doppler { $max_doppler_hz } Hz, muutosnopeus { $max_doppler_rate_hz_s } Hz/s, nykäys { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }LEO-etäisyysmittaussatelliitti näkyvissä { $v1 }% epookeista{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } saatavuus { $availability }, mediaani PDOP { $f }, RMS 3D-virhe { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } yhdistetty { $f3 }; näkyvissä { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, max { $row3 } ns (näkyvissä { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — tila { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = järjestelmä { $name }: role on oltava gnss tai leo, saatiin { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = järjestelmä { $name }: clock on oltava estimated tai known, saatiin { $c }

engine-e-leo-fusion-system-system-must-be-positive = järjestelmä { $name }: { $what } on oltava positiivinen

engine-e-leo-fusion-system-system-mask-deg-must-be = järjestelmä { $name }: mask_deg on oltava välillä [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = järjestelmä { $name }: sigma_pr_m on oltava positiivinen

engine-e-leo-fusion-system-give-at-least-one-system = anna vähintään yksi [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = epookkien välin on oltava positiivinen

engine-e-leo-fusion-timing-no-epochs = ei epookkeja

engine-e-leo-fusion-timing-no-satellite-was-ever-in = yksikään satelliitti ei ollut koskaan näkyvissä: vastaanotin ei saanut aikaa koskaan haltuun

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polarisaation on oltava rhcp, lhcp tai linear; saatiin '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4-virhekoodi { $code } hetkellä t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = rata, jonka inklinaatio on { $inc } deg, ei koskaan ylitä leveysastetta { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = pyydetty suurin korkeuskulma on horisontin ulottuvuuden alapuolella

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = rakennusluokan on oltava traditional tai thermally-efficient; saatiin '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = kenttä { $name } ei ole äärellinen

engine-e-leo-navmsg-codec-field-is-outside-its-bit = kenttä { $name } = { $value } { $unit } on bittialueensa ulkopuolella: bittejä { $bits } (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = viesti katkaistu

engine-e-leo-navmsg-codec-field-list-exhausted = kenttälista loppui

engine-e-leo-navmsg-codec-field-order-mismatch-vs = kenttien järjestys ei täsmää: { $name } vs { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID on oltava 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = jokainen korjauspolynomi vaatii 1-8 kerrointa

engine-e-leo-navmsg-codec-correction-time-scale-must-be = korjauksen aika-asteikon on oltava kakkosen potenssi väliltä 1 s – 32768 s; saatiin { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = ECEF-polynomi vaatii 1-11 kerrointa, yhtä paljon akselia kohti

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = ECEF-polynomin aste { $v1 } ylittää arvon 10

engine-e-leo-navmsg-codec-unknown-model-id = tuntematon mallitunniste { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = hyötykuorma ylittää 4095 tavua

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = kehys on lyhyempi kuin otsikko ja CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = virheellinen alkutahti 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = tukematon versio { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = kehyksen pituus { $frame } ei vastaa ilmoitettua hyötykuorman pituutta tavuina: { $len }

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q ei täsmää: laskettu 0x{ $crc }, kehyksessä 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees saa kukin olla enintään 7; saatiin { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree on oltava 1-10; saatiin { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = tuntematon efemeridimalli '{ $other }': käytä kepler16, kepler-rac, liu22 tai ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = sovitusvälin on oltava vähintään 10 s; saatiin { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = sovitusikkuna [{ $t0 }, { $v1 }] s on totuuskaaren [0, { $truth }] s ulkopuolella

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = ECEF-polynomisovitus on singulaarinen (liian vähän näytteitä asteeseen nähden)

engine-e-leo-navmsg-fit-clock-fit-is-singular = kellosovitus on singulaarinen

engine-e-leo-navmsg-fit-keplerian-fit-diverged = Kepler-sovitus hajaantui

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = tuntematon esiasetus '{ $k }'; saatavilla: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s on oltava 10-3600 s ja update_period_s välillä (0, fit_interval_s]; saatiin { $fit_interval_s } ja { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s ja eval_step_s on oltava 0,5-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz on oltava yli 10 MHz; saatiin { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid on oltava 1-255

engine-e-leo-navmsg-band-must-be-15-and = band on oltava 0-15 ja health 0-3

engine-e-leo-navmsg-unknown-csv-schema = tuntematon csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis on nimettävä vähintään yksi analyysi

engine-e-leo-navmsg-unknown-analysis-use = tuntematon analyysi '{ $a }'; käytä { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind on oltava leo-navmsg; saatiin { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg on oltava välillä [0, 60); saatiin { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO-navigointiviesti — { $res } km, { $res2 } deg, painovoima-aste { $gravity_degree }, malli { $res3 }
    { "  " }SISRE-painot: w_R { $w_r }, w_AC^2 1/{ $v6 } (maski { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s on oltava 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s on oltava ei-tyhjä, kukin 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }sovitusvälin vaihtokauppa jaksolla { $span } s (käyttöjakso = sovitusväli):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE-rata RMS { $sisre_orb_rms_m } m  max { $sisre_orb_max_m } m  kellon kanssa RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s on oltava ei-tyhjä, kukin 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s on oltava 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } parametria  SISRE-rata RMS { $sisre_orb_rms_m } m  kellon kanssa { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = ei ylilentoa yli { $mask } deg käyttäjälle kohdassa { $lat }, { $lon } ajassa { $search } s; laajenna midpass.search_s tai siirrä käyttäjää

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }ylilennon aikainen päivitys: ylilento { $p0 }-{ $p1 } s (suurin korkeuskulma { $pmax } deg), vaihtoja { $switches }, suurin käyttäjäetäisyyden hyppäys { $max_jump } m (pahimman tapauksen geometria { $max_worst } m) vs. kynnys { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }koodaus-dekoodaus: malli { $m }, kehys { $frame } tavua ({ $payload_bits } hyötykuormabittiä, { $eph_bits } efemeridi- ja kellobittiä), CRC-24Q 0x{ $hex }
    { "    " }kvantisointi: suurin paikan muutos { $v6 } mm, kello { $v7 } mm; SISRE tarkka { $acc_exact } m, kvantisoitu { $acc_q } m
    { "    " }vioittunut kehys hylätty: { $corrupted_rejected }; RINEX-kierros { $rin_dp } m; CSV-kierros { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs on oltava 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  julkaistu { $published } m  suhde { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = 16-parametrinen Kepler-joukko heikkenee arvosta { $a } m ajalla { $lo } s arvoon { $b } m ajalla { $hi } s: yksi Kepler-joukko kierroskohtaisine kaksinkertaisine harmonisineen ei pysty seuraamaan korkeataajuisempia painovoimatermejä ja LEO-kaaren ilmanvastusta kuin muutaman minuutin ajan, ja sen pienimmän neliösumman jäännös värähtelee ikkunan yli. Pitkittäis-, poikittais- ja säteissuuntaiset polynomit, joiden aste on korkeampi kuin Kepler-joukon kattama, vastaanottavat jäljelle jäävän ja antavat { $c } m ajalla { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = 16-parametrinen Kepler-joukko etenee arvosta { $a } m ajalla { $lo } s arvoon { $b } m ajalla { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, painovoima-aste { $gravity_degree } · esitysvirhe totuuteen nähden · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` on isäntäkirjaston

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: `rand_distr`-näytteistäjät kutsuvat isännän `exp`- ja `ln`-funktioita harvinaisissa haaroissaan; käytä `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` on isäntäkirjaston painovoimakenttä; käytä `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` ei ole tarkastettu

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = ei END OF HEADER -riviä

engine-e-leo-navmsg-text-expected-eph-record-header-got = odotettiin '> EPH' -tietueen otsikkoa, saatiin { $head }

engine-e-leo-navmsg-text-bad-satellite-id = virheellinen satelliittitunniste { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = epookkirivi puuttuu

engine-e-leo-navmsg-text-bad-epoch-line = virheellinen epookkirivi { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = virheellinen epookkikenttä kohdassa { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = epookkirivi vaatii kolme kellotermiä: { $ep }

engine-e-leo-navmsg-text-record-truncated = tietue katkaistu

engine-e-leo-navmsg-text-unknown-record-type = tuntematon tietuetyyppi { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = CSV-taulukko sisältää kepler16- ja kepler-rac-viestejä; saatiin { $m }

engine-e-leo-navmsg-text-empty-csv = tyhjä CSV

engine-e-leo-navmsg-text-row-has-cells-header = rivillä on soluja { $cells }, otsikossa { $header }

engine-e-leo-navmsg-text-bad-number-in-column = virheellinen luku { $c } sarakkeessa { $k }

engine-e-leo-navmsg-text-csv-row-lacks = CSV-riviltä puuttuu { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = ratakorkeuden on oltava välillä 100 km – 3000 km; saatiin { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = eksentrisyyden on oltava välillä [0, 0,1) LEO-sovitusta varten; saatiin { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = integrointiaskeleen on oltava välillä (0, 30] s; saatiin { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = keston on oltava positiivinen ja enintään 200000 askelta; saatiin { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree on oltava 0, 2-6 (zonaalinen) tai 7-{ $v1 } (EGM2008); saatiin { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = totuuspropagointi hajaantui

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = totuusrata rapautui alle 80 km:n

engine-e-leo-navmsg-truth-node-spacing-must-be-in = solmuvälin on oltava välillä (0, 60] s; saatiin { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = taulukoitu totuusrata vaatii vähintään kaksi tilaa; saatiin { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = tila { $k } ei ole äärellinen

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = kellon adev_1s on oltava välillä [0, 1e-6); saatiin { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = mitattu kello rakennetaan funktiolla TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = ohjattu kello vaatii sigma_s-arvon välillä [0, 1e-3) ja tau_s > 0; saatiin { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = mitattu kello vaatii positiivisen askeleen ja vähintään kaksi näytettä

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = mitattu kellonäyte ei ole äärellinen

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epookki '{ $s }' ei ole muotoa YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epookki '{ $s }' ei ole muotoa YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epookin '{ $s }' sekuntikenttä on virheellinen

engine-e-leo-pass-epoch-is-out-of-range = epookki '{ $s }' on alueen ulkopuolella

engine-e-leo-pass-band-unknown-signal-design-public = kaista '{ $name }': tuntematon signaalirakenne '{ $n }'; julkiset rakenteet: { $v2 }

engine-e-leo-pass-band-is-not-in-the = kaista '{ $name }' ei ole järjestelmän esiasetuksessa: anna frequency_mhz ja eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = kaista '{ $name }' vaatii kentän eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern on oltava isoflux, gaussian tai flat; saatiin '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = kaistan '{ $name }' taajuus on alueen ulkopuolella

engine-leo-pass-overridden-in-the-scenario = { $source } (ohitettu skenaariossa)

engine-e-leo-pass-system-has-no-band = järjestelmällä '{ $id }' ei ole kaistaa '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = LEO-satelliitti vaatii vähintään yhden kaistan

engine-e-leo-pass-at-most-12-bands-per = enintään 12 kaistaa satelliittia kohti

engine-leo-pass-unknown-system-presets-in-this = tuntematon järjestelmä '{ $n }'; tämän version esiasetukset: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = ei aurinkosynkronista rataa korkeudella { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (enintään 86400) ja step_s on oltava positiivisia, enintään 20000 epookkia; saatiin { $duration } ja { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO-satelliitti, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = skenaarion `epoch` { $epoch }, luettuna UTC-aikana

engine-leo-pass-the-kind-default-epoch-utc = lajin oletusepookki { $epoch } UTC (skenaario ei anna sellaista)

engine-e-leo-pass-user-environment-must-be-ground = user.environment on oltava ground, maritime, air tai indoor; saatiin '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg on oltava välillä +/-90

## src/leo_pass.rs

engine-e-leo-pass-user-speed-must-be-to = käyttäjän nopeuden on oltava 0–3000 m/s ja korkeuden -500–100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna on oltava patch, hemispherical tai isotropic; saatiin ”{ $o }”

engine-e-leo-pass-user-building-probability-must-be = user.building_probability on oltava välillä (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model on oltava klobuchar, vtec tai none; saatiin ”{ $o }”

engine-e-leo-pass-direction-must-be-ascending-or = direction on oltava ascending tai descending; saatiin ”{ $o }”

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satelliitti { $id }: virheellinen eksentrisyys tai perigeum

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satelliitti { $id }: tle vaatii kentät tle_line1 ja tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit on oltava pass, elements tai tle; saatiin ”{ $o }”

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation vaatii järjestelmän tai suunnitelman

engine-e-leo-pass-no-sun-synchronous-inclination = aurinkosynkronista inklinaatiota ei ole

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: enintään 5000 satelliittia

engine-e-leo-pass-no-leo-satellite-rises-above = yksikään LEO-satelliitti ei nouse maskin yläpuolelle aikaikkunassa

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s on oltava välillä (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: ”{ $b }” ei ole minkään LEO-satelliitin kaista ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = GNSS-signaalia ”{ $bname }” ei ole satelliittitähdistölle ”{ $cons }”

engine-e-leo-pass-empty-gnss-constellation = tyhjä GNSS-satelliittitähdistö

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: ”{ $a }”/”{ $b }” eivät ole kaksi eri kaistaa kohteessa { $id }

engine-e-leo-pass-iot-powers-and-battery-must = iot-tehojen ja akun on oltava positiivisia

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from on oltava median tai peak; saatiin ”{ $o }”

engine-leo-pass-detection-threshold-db-after-integration = havaitsemiskynnys { $detection_snr_db } dB integroinnin jälkeen

engine-leo-pass-coherent-integration-at-most-ms = koherentti integrointi enintään { $rx } ms, rajoitettuna Doppler-muutosnopeudella

engine-leo-pass-serial-search-with-correlators = sarjahaku { $correlators } korrelaattorilla

engine-leo-pass-hot-start-doppler-known-to = kuumakäynnistys: Doppler tunnetaan tarkkuudella +/-{ $aided } Hz, efemeridi voimassa

engine-leo-pass-leo-pass-link-budget-user = LEO-ohituksen linkkibudjetti, ympäristö { $environment }, käyttäjä sijainnissa { $lat_deg }, { $lon_deg }; LEO-satelliitit: { $satellites }, aikaikkuna { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, suurin korkeuskulma { $max_elevation_deg } deg hetkellä { $tca_s } s, maskin yläpuolella { $duration_above_mask_s } s{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 huippu { $opt } mediaani { $opt2 }; |Doppler| enintään { $opt3 }; ionosfääri { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: näkyvissä { $satellites_in_view }, C/N0 { $opt } – { $opt2 } (mediaani { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } huippu { $leo_peak_cn0_dbhz } dB-Hz on { $leo_peak_above_gnss_median_db } dB GNSS-mediaanin yläpuolella; voimakkaimman GNSS-kantoaallon yläpuolella { $leo_seconds_above_gnss_max } s ajan{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: kylmäkäynnistyksen TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), kuumakäynnistyksen { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Harhauttaja alkaen { $onset_s } s (hyppäys { $offset_m } m, työntö { $push_rate_m_s } m/s): Doppler-testi GNSS { $t }, LEO { $t2 }, yhdistetty { $t3 }; kaistojen välinen { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = Käyttäjä: { $environment } · LEO-huippu { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB GNSS-mediaanin yläpuolella · MODELLED

engine-leo-pass-user-modelled = Käyttäjä: { $environment } · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Kunkin LEO-satelliitin ensimmäisen kaistan Doppler (±{ $v1 } kHz koko asteikko)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = virheellinen [{ $what }]-taulukko: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design ”{ $signal_design }” ei ole taulukossa [signal] eikä julkinen rakenne ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design ”{ $name }” ei sisällä koodiseurattua komponenttia, joten se ei anna pseudoetäisyyttä

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind on oltava leo-pnt-chain; saatiin { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = seurattavalla komponentilla ei ole chip-nopeutta

engine-e-leo-pnt-chain-no-band-of-pass-names = yksikään [pass]-kaista ei nimeä signaaliksi signal = "{ $name }"; ketju tarvitsee sellaisen kantamaan rakennetta

engine-e-leo-pnt-chain-the-pass-gives-no-code = ohitus ei anna koodijitteriä

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m on oltava välillä [0, 100] m; saatiin { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion]-taulukon on käytettävä mode = "joint"; saatiin { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = seurattu C/N0 { $mask } deg maskilla (suorasovitus korkeuskulman sinin suhteen)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] ei sisällä LEO-järjestelmää, joka vastaanottaisi ketjun arvot

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] ei tuottanut joint-lohkoa

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT-ketju: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signaali { $name2 } ({ $design }), seurattu { $design2 } nopeudella { $v4 } Mchip/s, C/N0-siirtymä { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }ohitus { $id } { $sat } km: seurattu C/N0 huippu { $peak_tracked_cn0_dbhz } dB-Hz, koodijitterin mediaani { $jitter_median } m; C/N0-suora { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }viesti { $res } { $fit_interval_s } s sovitus / { $update_period_s } s päivitys: esitys-SISRE { $stats } mm RMS (rata { $stats2 } mm), radanmäärityksellä { $od } m: { $sisre } m välitetty eteenpäin{ "\u000A" }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }yhdistetty paikkaratkaisu: vain GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP:n suppeneminen: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } vaiheiden välillä välitetyt arvot. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Koodiseurannan jitter, etäisyysvirhe (m, 0–{ $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · vain GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulaatio { $label }: leveyden on oltava positiivinen

engine-e-leo-signal-unknown-signal-preset-the-library = tuntematon signaalin esiasetus { $name }: kirjastossa on { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = esiasetus { $name }: virheellinen esiasetustiedosto: { $e }

engine-e-leo-signal-preset-file-names-itself = esiasetustiedosto { $name } nimeää itsensä { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz on oltava positiivinen

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz on oltava positiivinen

engine-e-leo-signal-signal-needs-at-least-one = { $name }: signaalissa on oltava vähintään yksi komponentti

engine-e-leo-signal-component-power-fraction-must-be = { $name }: komponentin { $v1 } power_fraction on oltava positiivinen

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: komponentilla { $v1 } on fdma_shares mutta ei fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: komponentin { $v1 } fdma_shares on oltava positiivinen ja summaltaan yksi

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: komponentti { $v1 } tarvitsee yhden fdma_share-arvon siirtymää kohti

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps on oltava positiivinen

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips on oltava positiivinen

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: komponenttien tehoosuuksien summa on { $total }, ei 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km on oltava positiivinen

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: tasaista (OFDM-tyyppistä) komponenttia ei voi sijoittaa spektrimalliin

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: seurattu komponentti on FDMA-alikantoaalloilla; spektrimalli seuraa komponenttia kaistan keskellä

engine-e-leo-signal-signal-is-given-twice = signaali { $w } on annettu kahdesti

engine-e-leo-signal-signals-is-more-than-the = signaalien määrä { $out } ylittää sallitun määrän 24

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s on oltava alle 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: anna 1–40 cn0_dbhz-arvoa

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 ja slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points on oltava välillä 21–2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: käytä arvoa "coherent" tai "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = järjestelmän kohinalämpötilan on oltava positiivinen

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: tuntematon GNSS-signaali { $n } (tunnetut: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } ei ole skenaarion signaali

engine-e-leo-signal-shape-check-signal-is-not = muototarkistus: signaali { $signal } ei ole skenaariossa

engine-leo-signal-scenario-leo-signal-signals-noise = skenaario leo-signal | signaalit: { $runs } | kohinataso { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = vasen: kunkin rakenteen kaistarajoitettu PSD (dB huipun alapuolella, lähetyskaistan yli); oikea: koodijitter vs. kokonais-C/N0 chip-välillä { $reference_spacing_chips }

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = tuntematon kaista ”{ $other }” (odotettiin s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km on oltava äärellinen ja positiivinen

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps on oltava äärellinen ja positiivinen

engine-e-linkbudget-other-losses-db-must-be = other_losses_db on oltava äärellinen ja >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k on oltava äärellinen ja positiivinen, kun se annetaan

engine-linkbudget-link-budget-band-km-bit = link-budget: kaista { $value }, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, marginaali { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = ei voi kuunnella osoitteessa { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: kuunnellaan tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp-asiakas yhdistetty

engine-live-io-kshana-live-warning-is-not = kshana live: varoitus: { $addr } ei ole loopback-osoite; kuka tahansa, joka tavoittaa sen, voi lukea virran

engine-e-live-io-cannot-open = ei voi avata { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: pudotettiin tcp-asiakas, joka ei pysynyt mukana

engine-e-live-io-cannot-open-2 = ei voi avata { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: varoitus: { $addr } ei ole loopback-osoite; kuka tahansa, joka tavoittaa sen, voi lähettää tälle kerrokselle virran

engine-e-live-io-cannot-bind-udp = ei voi sitoa udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: kuunnellaan udp { $addr }

engine-e-live-io-cannot-connect-to = ei voi yhdistää kohteeseen { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: yhdistetty tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: luetaan sarjaporttia { $path } nopeudella { $baud } baud (vain luku)

engine-live-io-the-was-closed-by-the = { $v1 } suljettiin vastapuolen toimesta (kerros ei yhdistä uudelleen: aja se valvojan alaisuudessa, joka käynnistää sen uudelleen)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: käytä arvoa 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 tai 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } ei ole sarjalaite (tcgetattr epäonnistui)

engine-e-live-io-cannot-set-baud = ei voi asettaa nopeutta { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = ei voi asettaa rivitilaa kohteelle { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial on tuettu vain Unixissa; käytä --file, --tcp tai --stdin

engine-live-io-unknown-option = tuntematon valinta { $s }

engine-live-io-cannot-read = ei voi lukea { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: alusalusta, kalibrointi { $calibration_s } s ajan; portti { $v2 }. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite: käyttäjä vastaa edelleen.

engine-live-io-write-failed = kirjoitus epäonnistui: { $e }

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live: pudotettiin { $n } udp-datagrammi, jota moottori ei voinut ottaa vastaan ({ $udp_dropped } yhteensä)
       *[other] kshana live: pudotettiin { $n } udp-datagrammia, joita moottori ei voinut ottaa vastaan ({ $udp_dropped } yhteensä)
    }

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } on alueen 1..={ $MAX_PRN } ulkopuolella

engine-e-lunar-afs-codes-insertion-index-outside-10223 = lisäysindeksi { $p } on alueen 1..=10223 ulkopuolella

engine-e-lunar-afs-codes-annex-files-hold-and-codes = Annex 3 -tiedostot sisältävät { $gold } ja { $ter } koodia, odotettiin 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } ei ole g1, g2 -Gold-koodi (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = toissijaista koodia S{ $id } ei ole (S0–S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 määrittää koodit vain solmutunnisteille 1–12, ei { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } ei mahdu kahteen bittiin (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } on alueen 0..99 ulkopuolella (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = odotettiin { $SB1_SYMBOLS } alikehyksen 1 symbolia

engine-e-lunar-afs-frame-subframe-data-lengths-expected = alikehysten datapituudet { $sb2 }/{ $sb3 }/{ $sb4 } (odotettiin { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = odotettiin { $FRAME_SYMBOLS } symbolia, annettu { $soft }

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = rivi { $v1 }: odotettiin `row,column`

engine-e-lunar-afs-ldpc-line = rivi { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = rivi { $v1 }: ({ $r },{ $c }) on alueen { $rows }x{ $cols } ulkopuolella

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: odotettiin { $info_bits } informaatiobittiä, annettu { $info }

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = LSIS V1.0 -dataa ei ole hakemistossa { $cache_dir } (aseta KSHANA_LSIS_DIR tai aja xval/lunar-afs/fetch_lsis.sh, joka lataa { $LSIS_PDF_URL } ja purkaa sen liitteet; niitä ei jaeta uudelleen Kshanan mukana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } ei ole kiinnitetty LSIS-tiedosto

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = tiedoston { $path } SHA-256 on { $got }, odotettiin { $want } (kiinnitetty versioon LSIS V1.0, 29. tammikuuta 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal -kantataajuussignaali, { $LSIS_VERSION }; Kshanan vertailugeneraattori

engine-lunar-afs-waveform-afs-node = AFS-solmu { $node_id }

engine-lunar-afs-waveform-afs-node-frame-toi = AFS-solmu { $node_id } kehys TOI { $toi }

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites on oltava vähintään 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites on oltava vähintään 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg on oltava välillä [0, 90); saatiin { $mask_deg }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } satelliitti, ei majakoita
       *[other] { $n_sats } satelliittia, ei majakoita
    }

engine-lunar-beacon-satellites-visible-beacons = satelliitit { $n_sats } + näkyvät majakat { $n_vis_beacons }

engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } satelliitti, ei majakoita
       *[other] { $n_cmp } satelliittia, ei majakoita
    }

engine-e-lunar-beacon-serialising-beacon-report = serialisoidaan majakkaraportti: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = majakkaraportin on serialisoitava JSON-objektiksi

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Kuun pintamajakkojen augmentaatio — maski { $elevation_mask_deg } deg, epookki +{ $epoch_s } s, majakkakohtainen sigma_URE { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  satelliitit { $n_visible_sats }  majakat { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  toteutunut 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }majakat parantavat PDOP:ia kertoimella { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = sen sijaan suurempi satelliittitähdistö, { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = ei voi lukea Kuun efemeridiä { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = Kuun efemeridi: ensimmäisen rivin on oltava `{ $MAGIC }`, löytyi `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = Kuun efemeridi: tiedosto on tyhjä

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = Kuun efemeridi: `# format:` on oltava `states` tai `elements`, löytyi `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = Kuun efemeridi: ei datarivejä

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = Kuun efemeridi: puuttuva sarake `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = Kuun efemeridi: `# elements_frame:` on oltava `icrf` tai `mci`, löytyi `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = Kuun efemeridi: `elements_frame: icrf` vaatii rivin `# epoch_jd_tdb:` (epookki, johon elementit viittaavat ja jossa myös ICRF:stä Kuuhun kiinnitettyyn kehykseen siirtävä kierto lasketaan): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = Kuun efemeridi: lyhyt elementtirivi { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = Kuun efemeridi: elementtirivi { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = Kuun efemeridi: elementtirivin { $v1 } isoakselin puolikas ei ole positiivinen

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = Kuun efemeridi: elementtirivin { $v1 } eksentrisyys on { $ecc }, alueen [0, 1) ulkopuolella

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = Kuun efemeridi: `states`-tiedosto vaatii rivin `# frame: icrf` tai `# frame: mci`, löytyi `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = Kuun efemeridi: `icrf`-tilatiedosto vaatii rivin `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = Kuun efemeridi: lyhyt tilarivi { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = Kuun efemeridi: tilarivi { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = Kuun efemeridi: tilarivi { $v1 } ei ole äärellinen

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = Kuun efemeridi: tilarivi { $v1 } satelliitille { $sat } palaa ajassa taaksepäin ({ $t } kohteen { $last } jälkeen); epookkien on oltava aidosti kasvavia satelliittikohtaisesti

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Taulukoitu Kuu-keskinen tilaefemeridi ({ $e }-kehys), Lagrange-interpoloitu asteella { $LAGRANGE_ORDER } taulukon epookkien välillä ja redusoitu MCMF:ään menetelmällä { $v2 }. Tämä moottori EI propagoi tiloja. Alkuperäisluokka `published-ephemeris`: eroaa kaikista elementeistä johdetuista suureista.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Julkaistu satelliittitähdistön MÄÄRITELMÄ, annettu Kuu-keskisessä ICRF:ssä (`{ $v1 }`), propagoitu tämän moottorin omalla Kepler-ratkaisijalla samassa inertiaalikehyksessä ja redusoitu MCMF:ään IAU 2015 / WGCCRE -Kuun orientaatiolla (precessoiva napa, analyyttinen fysikaalinen libraatio) kullakin epookilla. EI kehysapproksimaatiota: lähde nimeää kehyksen ja epookin, ja molempia käytetään. Alkuperäisluokka `published-elements`: eroaa kaikista ydinpohjaisista suureista.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Julkaistu satelliittitähdistön MÄÄRITELMÄ, propagoitu tämän moottorin omalla Kepler-ratkaisijalla ja redusoitu keskiarvokiertoon perustuvalla Kuun pyörimismallilla — täsmälleen samaa polkua kuin havainnollistava satelliittitähdistö, joten ainoa ero kahden ajon välillä on satelliittitähdistön rakenne. Lähde antaa elementit `{ $v1 }`-kehyksessä; ne luetaan tässä MCI:nä, mikä kallistaa satelliittitähdistöä kulmalla `published_frame_tie_angle_deg`. Alkuperäisluokka `published-elements`: eroaa kaikista ydinpohjaisista suureista.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = tuntematon station_datum { $other }: odotettiin "fixed" tai "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = VLBI-kampanja tarvitsee vähintään 2 asemaa kantaviivan muodostamiseen, saatiin { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = asemalla { $name } on ei-äärellinen koordinaatti

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = aseman { $name } leveysaste { $lat } deg on alueen [-90, 90] ulkopuolella

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = seitsenparametrinen Helmert-datum vaatii vähintään 3 ei-kollineaarista majakkaa, saatiin { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = majakalla { $name } on ei-äärellinen koordinaatti

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = majakan { $name } leveysaste { $lat } deg on alueen [-90, 90] ulkopuolella

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours on oltava positiivinen ja äärellinen, saatiin { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min on oltava positiivinen ja äärellinen, saatiin { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = { $v1 } epookin aikataulu ylittää tämän skenaarion 5000 epookin rajan; pidennä step_min tai lyhennä arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s on oltava positiivinen ja äärellinen, saatiin { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg on oltava äärellinen ja välillä [-90, 90), saatiin { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg on oltava äärellinen ja välillä [-90, 90), saatiin { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol on oltava äärellinen ja välillä [0, 1), saatiin { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m on oltava positiivinen ja äärellinen, saatiin { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver on oltava "spectral" tai "srif", saatiin "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = serialisoidaan lunar-frame-campaign-tulos: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = yksikään kampanjan havainto ei ylitä Maan puoleista korkeuskulmamaskia { $mask } deg kantaviivan molemmissa päissä JA maskia { $earth_mask } deg majakan oman horisontin yläpuolella: kaikki { $n_epochs } epookin x { $v1 } kantaviivan x { $n_beacons } majakan yhdistelmät hylättiin. Pidennä arc_hours, laske maskia tai siirrä asemia.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = full-rank: tämä kampanja rajoittaa kaikkia 7 similariteettiparametria (ehtoluku { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: similariteettisuuntia 7:stä ei voi havaita tästä kampanjasta: { $defect }, joten datumin sigmaa EI julkaista; havaitsemattomat suunnat luetellaan seitsenparametrisessa kannassa

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | majakat { $n_beacons } x kantaviivat { $v1 } x epookit { $n_epochs } = havainnot { $n_obs } (viiveen sigma { $sigma_tau } s) | asemadatum { $station_datum } | Helmert-aste { $rank }/7 ehtoluku { $condition } | datumin translaation sigma { $v5 } vs. injektoidun muunnoksen palautusvirhe { $trans_err_norm_m } m (suhde { $v7 })

engine-lunar-frame-campaign-of-beacons-have-no-observation = Majakat ilman havaintoa tässä aikataulussa: { $names }/{ $beacons } ({ $names2 }); ne eivät kanna informaatiota, niiden sigmat ovat null ja datum realisoidaan vain havaituista majakoista

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = kaikkien sigmojen on oltava positiivisia

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane ja altitude_km on oltava positiivisia

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency on oltava välillä (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m vs. maa-asema { $v2 } m paikan sigma, keskimääräinen q { $v3 } (chi-square 6 odottaa arvoa 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: kokonaislukuepävarmuudet { $last }, ILS-onnistuminen { $last2 } (bootstrap { $last3 }) pisimmällä kaarella

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: pienin informaation ominaisarvo x{ $v } kiertäjälinkkien kanssa, CRLB-jälki x{ $v2 }

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: pyyhkäisypisteet { $last } kaarilla { $v }; laser vs. GNSS x-translaation sigma { $last2 } m rekisteröidyssä paikallisessa sidoksessa

engine-e-lunar-infra-unknown-study-expected-one-of = tuntematon tutkimus `{ $other }`: odotettiin yhtä seuraavista: { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = mittausjoukko ei määritä rataa (singulaarinen informaatio)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials on oltava vähintään 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = maa-aseman sigmojen on oltava positiivisia

engine-e-lunar-infra-od-unknown-station-dss-14-dss = tuntematon asema `{ $nm }`: DSS-14, DSS-63 tai DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = liian vähän maamittauksia radan määrittämiseen

engine-e-lunar-infra-od-the-covariance-of-the-difference = erotuksen kovarianssi on singulaarinen

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = NRHO:n differentiaalikorjaus ei suppennut lähtöarvosta

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo vaatii ehdon 0 < perilunin korkeus < apolunin korkeus

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = tuntematon rataperhe `{ $other }`: nrho tai elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s ja arc_days on oltava positiivisia

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = vastaanottimilla ei ole yhteistä satelliittia

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = kantoaallon vaiheen normaaliyhtälöt ovat singulaariset

engine-e-lunar-infra-phase-the-position-block-is-singular = paikkalohko on singulaarinen

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = kokonaislukuepävarmuuksien kovarianssi ei ole positiivisesti definiitti

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = tekniikoiden sigmojen on oltava positiivisia

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = paikallisen sidoksen sigmojen on oltava positiivisia

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz on oltava äärellinen ja positiivinen

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz on oltava äärellinen ja positiivinen

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k on oltava äärellinen ja positiivinen

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km on oltava äärellinen ja suurempi kuin Kuun säde

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity on oltava välillä [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw on oltava äärellinen

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | satelliitit { $n_sats }, epookit { $n_epochs }, linkit { $n_links } sijainnista ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (keskiarvo { $mean_js_db }) | { $n_lost } LOST | saatavuus { $availability_under_jamming } (nimellinen { $availability_nominal })

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | satelliitit { $n_sats }, epookit { $n_epochs }, linkit { $n_links } sijainnista ({ $site_lat_deg }, { $site_lon_deg }) | ei häirintälähdettä (puhtaan taivaan Kuun perustaso) | { $n_lost } LOST | saatavuus { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = odottamaton heijastinluettelon otsikko { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = lyhyt heijastinluettelon rivi { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = heijastinkenttä { $i } ei ole luettavissa kohteessa { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = heijastin { $f }: |(x,y,z)| = { $norm3 } m mutta julkaistun säteen sarake ilmoittaa { $radius } m — riviä on muokattu

engine-e-lunar-llr-reflector-catalogue-has-no-rows = heijastinluettelossa ei ole rivejä

engine-e-lunar-llr-unreadable-position-epoch-year = position_epoch_year ei ole luettavissa { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = odottamaton asemaluettelon otsikko { $t }

engine-e-lunar-llr-short-station-catalogue-row = lyhyt asemaluettelon rivi { $t }

engine-e-lunar-llr-unreadable-station-field-in = asemakenttä { $i } ei ole luettavissa kohteessa { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = ILRS-tunnus ei ole luettavissa kohteessa { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = asemaluettelossa ei ole rivejä

engine-e-lunar-llr-cannot-read-this-scenario-runs = ei voi lukea { $path } ({ $e }). Tämä skenaario ajetaan repositorion mukana toimitettavalla, versioidulla todellisella dataviipaleella hakemistossa { $DEFAULT_DATA_DIR }, jota ei toimiteta julkaistun crate-paketin mukana; osoita `data_dir` sen kopioon.

engine-e-lunar-llr-only-usable-normal-points-for = käyttökelpoisia normaalipisteitä vain: { $used }, heijastimia: { $reflectors } — liian vähän { $v3 } koordinaatin rajaamiseen; laajenna arkistoviipaletta

engine-e-lunar-llr-the-simulated-campaign-own-report = simuloidun kampanjan oma raportti ei jäsentynyt: { $e }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: arkistoituja normaalipisteitä { $used } (jäsennetty { $n_parsed }), asemat { $station_counts }, retroheijastinryhmiä { $reflectors }, ajanjakso { $v5 } d; mitattu normaalipisteen toistotarkkuus (mediaani) { $median } mm yhdensuuntainen; heijastimen informaatioaste { $rank }/{ $n }; Helmert-aste { $rank2 }/{ $n_helmert } ehtoluku { $condition }; datumin translaation sigma { $v12 } m; havaittu-miinus-laskettu yhdensuuntaisen residuaalin RMS { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg on oltava äärellinen ja välillä [-90, 90), saatiin { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name }: koordinaatti ei ole äärellinen

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } leveysaste { $lat_deg } deg on alueen [-90, 90] ulkopuolella

engine-e-lunar-llr-serialising-the-lunar-llr-datum = lunar-llr-datum-raportin serialisointi epäonnistui: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = integrointiaskeleen on oltava tulostusaskeleen tekijä

## src/lunar_receiver.rs

engine-lunar-receiver-must-be-finite-and-not = { $n } on oltava äärellinen eikä negatiivinen

engine-lunar-receiver-must-be-finite-and-positive = { $n } on oltava äärellinen ja positiivinen

## src/lunar_service.rs

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: sijainnin vienti: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = Kuun efemeridi { $path } kattaa { $until } s epookkinsa jälkeen, mutta skenaarion horisontti yltää arvoon { $last } s; lyhennä horizon_hours tai hae pidempi kaari (taulukoidun efemeridin ekstrapolointi evätään)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path vaatii kentän epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = OP-kehys epookilla { $epoch } UTC (Maan näennäisen radan normaali Kuun ympäri, x sen solmua pitkin IAU:n Kuun päiväntasaajalla); Kuun GM, J2 ja C22 IAU:n Kuuhun kiinnitetyssä kehyksessä, Maa ja Aurinko kolmansina kappaleina DE440-paikoissa lähteestä { $spk_path }; neljännen asteen Runge-Kutta, 10 s askel

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m on oltava äärellinen ja positiivinen

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m on oltava äärellinen ja positiivinen

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 vaatii height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites on oltava 3 tai 4, saatiin { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs on oltava 1–144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } on oltava äärellinen ja positiivinen

engine-lunar-station-must-be-finite-and-not = { $name } on oltava äärellinen eikä negatiivinen

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } ylittää arvon { $MAX_WORK }; pienennä n_trials, karkeista grid_lat_step_deg (tai listaa vähemmän pisteitä) tai nosta t_step_s / lyhennä t_span_s

engine-e-lunar-station-kind-must-be-got = kind on oltava { $KIND }; saatiin { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: efemeridi { $path } kattaa { $until } s, mutta ajo yltää arvoon { $last } s (viimeinen epookki plus latency_s); lyhennä t_span_s

engine-e-lunar-station-no-case = { $KIND }: ei tapausta ({ $j }, { $i }, { $k })

engine-lunar-station-points-epochs-trials = pisteet { $n_grid_points } · epookit { $n_epochs } · kokeet { $n_trials }

engine-lunar-station-hpl-max = HPL maks { $f }

engine-lunar-station-survey-latency-bits = kartoitus { $survey_sigma_m } m · latenssi { $latency_s } s · bitit { $quantization_bits }

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: rivien ja näytteiden määrän on oltava 2–{ $MAX_DEM_SIDE }, saatiin { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: korkeusarvoja { $heights_m } ruudukolle { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m on oltava positiivinen, saatiin { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m on oltava positiivinen, saatiin { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: ei voi lukea { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection on oltava south-polar-stereographic, saatiin { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type on oltava int16-le, saatiin { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: ei voi lukea { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: ruudukko ylittää { $MAX_DEM_SIDE } pikselin ylärajan

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } on { $bytes } tavua; { $lines } x { $samples } int16 vaatii { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: { $img } SHA-256 { $digest } ei vastaa kuvaajan arvoa { $image_sha256 }

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor on oltava positiivinen

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: ei voi lukea { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: vaatii vähintään 2 x 2 pistettä, kasvavan alueen välillä [-90, 90] deg ja 360 deg pituutta sekä äärelliset korkeudet

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } on oltava äärellinen ja positiivinen, saatiin { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m on oltava äärellinen eikä negatiivinen, saatiin { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg on oltava enintään 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m on oltava 1–1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: sijainti on korkeuskentän ulkopuolella

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: ilmoitettu horisontti vaatii ei-tyhjän lähteen

engine-e-lunar-terrain-terrain-stated-horizon = terrain: ilmoitettu horisontti: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: anna dem_path tai dem_tile_path, ei molempia

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km on oltava äärellinen ja positiivinen

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m on oltava äärellinen ja positiivinen

engine-e-lunar-terrain-site-deg-deg = { $e } (sijainti { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = tuntematon kello { $other }; odotettiin yhtä seuraavista: optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks-kentän on nimettävä vähintään yksi kelloluokka

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s on oltava äärellinen ja positiivinen, saatiin { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s on oltava äärellinen ja suurempi kuin tau_min_s ({ $lo }), saatiin { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade on oltava ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = termi { $name } on lyhyempi kuin tau-ruudukko

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | kello { $clock } | 7-termin x_Σ(τ) { $taus } τ-pisteellä ({ $taus2 }–{ $taus3 } s) | risteämiskohta τ { $crossover_tau_s } s (x { $crossover_x_s } s) | kehyslattia { $frame_term_s } s | kellon x(1 d) { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | aikalaboratorio: { $lab } { $lab2 } LTC:hen, x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: tuntematon kello { $other }; odotettiin yhtä seuraavista: optical-master, passive-h-maser, rafs, mini-rafs, tai anna sen sijaan device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: anna joko clock tai device_card, ei molempia

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s on oltava äärellinen ja positiivinen, saatiin { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } on oltava äärellinen ja ei-negatiivinen, saatiin { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s on oltava positiivisia lukuja

engine-lunar-time-lab-station-height-not-modelled-exactly = aseman korkeutta ei mallinneta tarkasti: { $height_sigma_m } m:n yhden sigman korkeusvirhe vinouttaa nopeutta { $value } ns/day, sovellettuna lineaarisena termina viimeisen ohjauksen jälkeen

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = valon kulkuaika ei suppennut arvoon 1e-15 s 30 iteraatiossa

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = ydinpolku vaatii yhdessä kentät planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = tuntematon datum { $other }: odotettiin "anchor-first-station", "free-network" tai "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = VLBI-aikataulu tarvitsee vähintään 2 asemaa kantaviivan muodostamiseen, saatiin { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = majakan koordinaattien on oltava äärellisiä

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = majakan leveysaste { $lat } deg on alueen [-90, 90] ulkopuolella

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = { $v1 } epookin aikataulu ylittää tämän skenaarion 20000 epookin rajan; pidennä step_min tai lyhennä arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g on oltava positiivinen ja äärellinen, saatiin { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = serialisoidaan lunar-vlbi-fim-tulos: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = yksikään aikataulun havainto ei ylitä korkeuskulmamaskia { $mask } deg kantaviivan molemmissa päissä: kaikki { $n_epochs } epookin x { $v1 } kantaviivan yhdistelmät hylättiin. Pidennä arc_hours, laske elevation_mask_deg tai siirrä asemia.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = datum ei jätä yhtään estimoitavaa parametria

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: havaitsemattomia suuntia { $defect }/{ $dim }, joten koordinaattikohtaista sigmaa ei raportoida; alla oleva havaittavan aliavaruuden arvo on pseudoinverssi, joka on rajattu { $rank } havaittavaan suuntaan, eikä se OLE aseman sigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | asemat { $n_stations } / kantaviivat { $v2 } x epookit { $n_epochs } = havainnot { $n_obs } (maski { $mask } deg) | datum { $datum } | aste { $rank }/{ $dim } ehtoluku { $condition } | aseman sigma { $v10 } vs. equipartition g={ $g } { $eq_g } m (suhde { $v13 })

## src/main.rs

engine-main-error-validate-needs-scenario-path = virhe: --validate vaatii skenaariopolun

engine-main-error-study-needs-suite-manifest = virhe: --study vaatii sarjan manifestipolun

engine-main-error-study-name-needs-value = virhe: --study-name vaatii arvon

engine-main-error-export-sp3-needs-path = virhe: --export-sp3 vaatii polun

engine-main-error-export-omm-needs-path = virhe: --export-omm vaatii polun

engine-main-error-export-oem-needs-path = virhe: --export-oem vaatii polun

engine-main-error-animate-needs-format-svg = virhe: --animate vaatii muodon: svg, html, frames tai all

engine-main-error-animate = virhe: --animate: { $e }

engine-main-error-animate-fps-needs-whole = virhe: --animate-fps vaatii kokonaisluvun kuvaa sekunnissa kohti

engine-main-error-export-needs-format-czml = virhe: --export vaatii muodon: czml, kml, geojson, stk, sigmf, all tai list

engine-main-error-animate-duration-needs-length = virhe: --animate-duration vaatii pituuden sekunteina

engine-main-error-import-route-needs-geojson = virhe: --import-route vaatii GeoJSON-tiedostopolun

engine-main-error-eop-needs-finals2000a-file = virhe: --eop vaatii finals2000A-tiedostopolun

engine-main-error-unknown-option = virhe: tuntematon valinta ”{ $other }”

engine-main-error-unexpected-argument-one-scenario = virhe: odottamaton argumentti ”{ $other }”; yksi skenaariotiedosto per ajo

engine-main-warning-animate-fps-and-animate = varoitus: --animate-fps ja --animate-duration eivät tee mitään ilman valintaa --animate

engine-main-error-animate-exports-one-scenario = virhe: --animate vie yhden skenaarioajon; sitä ei voi yhdistää valintoihin --validate tai --study

engine-main-error-validate-lints-one-scenario = virhe: --validate tarkistaa yhden skenaarion; älä anna samalla skenaariotiedostoa

engine-main-error-cannot-read = virhe: ei voi lukea { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind tunnistetaan; tämä kind ei vaadi yhtään kenttää (tyhjä runko ajaa sen vertailukonfiguraation), joten muuta tarkistettavaa ei ollut

engine-main-ok-kind-resolves-and-all = ok: { $kind } — kind tunnistetaan ja kaikki sen julkaistut pakollisten kenttien merkinnät ({ $n_required }) täyttyvät; kenttien arvoja ei tarkisteta

engine-main-error-study-runs-suite-do = virhe: --study ajaa sarjan; älä anna samalla yksittäistä skenaariotiedostoa

engine-main-warning-study-name-is-ignored = varoitus: --study-name ohitetaan valinnan --study kanssa; tutkimuksen otsikko tulee sarjan manifestin kohdasta `title =`

engine-main-error-cannot-read-2 = virhe: ei voi lukea { $path }: { $e }

engine-main-hint-kshana-example-lists-the = vihje: `kshana example` listaa mukana toimitetut vertailuskenaariot; `kshana example clock-holdover > clock-holdover.toml` kirjoittaa yhden

engine-main-error-cannot-read-3 = virhe: ei voi lukea { $eop_file }: { $e }

engine-main-error-eop = virhe: --eop: { $e }

engine-main-error-cannot-read-4 = virhe: ei voi lukea { $route_file }: { $e }

engine-main-error-import-route = virhe: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: ei sovellu: { $why }

engine-main-error-export = virhe: --export: { $e }

engine-main-error-animate-2 = virhe: --animate { $f }: { $e }

engine-main-error-export-2 = virhe: { $fmt }-vienti: { $e }

engine-main-error-cannot-write = virhe: ei voi kirjoittaa { $json_path }: { $e }

engine-main-error-cannot-write-2 = virhe: ei voi kirjoittaa { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = virhe: raporttia ei voi muodostaa: { $e }

engine-main-error-cannot-write-3 = virhe: ei voi kirjoittaa { $html_path }: { $e }

engine-main-error-cannot-write-4 = virhe: ei voi kirjoittaa { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = virhe: ei voi kirjoittaa { $csv_path }: { $e }

engine-main-wrote-and = kirjoitettu { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } ja { $csv_path }

engine-main-wrote-and-2 = kirjoitettu { $json_path }, { $svg_path }, { $html_path } ja { $report_json_path }

engine-main-error-cannot-write-6 = virhe: ei voi kirjoittaa { $target }: { $e }

engine-main-error-cannot-write-7 = virhe: ei voi kirjoittaa { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = virhe: SP3-vienti epäonnistui: { $e }

engine-main-error-cannot-write-8 = virhe: ei voi kirjoittaa { $omm_path }: { $e }

engine-main-error-omm-export-failed = virhe: OMM-vienti epäonnistui: { $e }

engine-main-error-cannot-write-9 = virhe: ei voi kirjoittaa { $oem_path }: { $e }

engine-main-error-oem-export-failed = virhe: OEM-vienti epäonnistui: { $e }

engine-main-error-unexpected-argument-after-kinds = virhe: odottamaton argumentti ”{ $other }” kohdan `kinds` jälkeen; vain --json hyväksytään

engine-main-bundled-reference-scenarios-write-one =
    Mukana toimitetut vertailuskenaariot ({ $v1 }). Kirjoita yksi tiedostoon ja aja se:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (ei mukana: { $name } — katso syy komennolla `kshana example { $name }`)

engine-main-error-is-not-bundled-it = virhe: ”{ $name }” ei ole mukana toimitettu: se { $why }

engine-main-error-no-bundled-scenario-named = virhe: mukana toimitettua skenaariota nimeltä ”{ $name }” ei ole; `kshana example` listaa olemassa olevat: { $v1 }

engine-main-error-cannot-read-5 = virhe: ei voi lukea { $suite_path }: { $e }

engine-main-wrote-and-3 = kirjoitettu { $json_path } ja { $html_path }

engine-main-error-needs-value = virhe: { $a } vaatii arvon

engine-main-error-expected-mean-needs-number = virhe: --expected-mean vaatii luvun

engine-main-error-unknown-imu-fit-option = virhe: tuntematon imu-fit-valinta { $x }

engine-main-error-imu-fit-needs-an = virhe: imu-fit vaatii IMU-lokin polun

engine-main-error-needs-value-2 = virhe: { $args } vaatii arvon

engine-main-error-epoch = virhe: --epoch: { $e }

engine-main-error-unknown-bench-export-option = virhe: tuntematon bench-export-valinta { $a }

engine-main-error-bench-export-needs-scenario = virhe: bench-export vaatii skenaariopolun

engine-main-needs-value = { $a } vaatii arvon

engine-main-site-takes-lat-lon-height = --site ottaa muodon lat,lon[,height_m], saatiin { $v }

engine-main-error-is-bytes-the-tle = virhe: { $p } on { $m } tavua; TLE-yläraja on { $cap } (4 MiB)

engine-main-error-cannot-read-6 = virhe: ei voi lukea { $p }: { $e }

engine-main-unknown-sky-option = tuntematon sky-valinta { $a }

engine-e-main-svg-and-monte-carlo-are = --svg ja --monte-carlo ovat erilliset tulosteet; anna toinen

engine-main-error-preset-needs-name =
    virhe: --preset vaatii nimen
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    virhe: --profile vaatii tiedoston
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = symbolit { $r }, löydetyt kehykset { $r2 }; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }kehys kohdassa { $f }: FID { $f2 } TOI { $f3 } (SB1-metriikka { $f4 }, SP-virheet { $f5 }, SB1-virheet { $f6 })

engine-main-not-checked = ei tarkistettu: { $r }

engine-main-wrote-frame-of-6000-symbols = kirjoitettu { $out }: kehykset { $frames }, joissa kussakin 6000 symbolia; alikehykset 2–4 ovat paikkamerkkejä (ei LDPC-koodattu, ei viestiä)

engine-main-error-cannot-write-10 = virhe: ei voi kirjoittaa { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = tuntematon lunanet-afs-check-alikomento { $other }

engine-main-needs-pack-id = { $cmd } vaatii pakettitunnuksen

engine-main-unknown-standards-pack-run-option = tuntematon standards-pack run -valinta { $a }

engine-main-unknown-standards-pack-subcommand = tuntematon standards-pack-alikomento { $other }

engine-main-error-out-needs-value = virhe: --out vaatii arvon

engine-main-error-unknown-compliance-report-option = virhe: tuntematon compliance-report-valinta { $a }

engine-main-error-compliance-report-needs-at = virhe: compliance-report vaatii vähintään yhden tulostiedoston (.json)

engine-main-runs-read-not-used-rows = luettuja ajoja { $runs }, käyttämättä { $unrecognised }; rivit: todisteilla katettu { $n }, osittain { $n2 }, ei todisteilla katettu { $n3 }, soveltamisalan ulkopuolella { $n4 }

engine-main-error-receiver-trust-needs-scenario = virhe: receiver-trust vaatii skenaariopolun

engine-main-error-invalid-receiver-trust-scenario = virhe: virheellinen receiver-trust-skenaario: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = poltto kuluttaa massan loppuun: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, poltto={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = lentoajan on oltava positiivinen

engine-e-maneuver-collinear-endpoints-transfer-plane-is = kollineaariset päätepisteet: siirtotaso on määrittelemätön (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs on tarkoitettu arvolle M >= 1; käytä lambert arvolle M = 0

engine-e-maneuver-no-revolution-transfer-the-time = ei { $revs }-kierroksen siirtymää: lentoaika on alle sen minimin

engine-e-maneuver-grid-step-days-must-be = grid_step_days on oltava positiivinen, saatiin { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = jokaisen ikkunan on edettävä eteenpäin (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = pyydetyn tyyppistä siirtymää ei löydy ikkunoista

engine-e-maneuver-the-optimum-left-the-feasible = optimi poistui sallitulta alueelta

## src/mars_od.rs

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: odotettiin 3 arvoa

engine-e-mars-od-dss-epoch-is-not-2003 = DSS-{ $id } epookki ei ole 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id }: DXYZ puuttuu

engine-e-mars-od-no-coordinates-for-dss = ei koordinaatteja asemalle DSS { $station }

engine-e-mars-od-no-ramps-for-dss = ei taajuusramppeja asemalle DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = ramppitaulukko ei kata väliä

engine-e-mars-od-epoch-outside-the-integrated-span = epookki { $et } integroidun jakson ulkopuolella

## src/mars_od.rs

engine-e-mars-od-normal-matrix-is-not-positive = normaalimatriisi ei ole positiivisesti definiitti

engine-e-mars-od-no-points = ei pisteitä

engine-e-mars-od-parameter-has-no-partial-on = parametrilla ei ole osittaisderivaattaa säilytetyissä pisteissä

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | käyttäjä { $user }, kello { $clock_class } | releet { $n_relays } (keskimäärin { $mean_relays_in_view } näkyvissä) | suppenneen paikan RMS { $converged_pos_rms_m } m, formaali 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — kovarianssin FoM, ei virallisesti hyväksytty PL) | kellotaajuuden σ { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — käyttäjä { $user }, kello { $clock_class }: 3D-paikkavirhe vs. totuus (suppennut RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = parivertailumatriisi on tyhjä

engine-e-mcda-ahp-pairwise-matrix-is-not-square = parivertailumatriisi ei ole neliö (rivi { $i }: alkioita { $row }, odotettiin { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = alkion a[{ $i }][{ $j }] = { $v } on oltava äärellinen ja positiivinen

engine-e-mcda-ahp-diagonal-must-be = lävistäjän a[{ $i }][{ $i }] = { $row } on oltava 1

engine-e-mcda-ahp-entries-must-be-reciprocal = alkioiden a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } on oltava käänteislukuja (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = yläkolmion rivi { $i }: alkioita { $row }, odotettiin { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = yläkolmion alkion ({ $i },{ $j }) = { $v } on oltava äärellinen ja positiivinen

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: tyhjä päätösmatriisi

engine-e-mcda-copras-copras-no-criteria = COPRAS: ei kriteerejä

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS: painoja { $n }, mutta kriteerityyppejä { $types }

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: vaatii vähintään yhden kustannuskriteerin (Min)

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS: vaihtoehto { $i }: arvoja { $row }, mutta kriteerejä { $n }

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: vaihtoehdon { $i } kriteerin { $j } arvon { $x } on oltava äärellinen ja > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: tyhjä aineisto

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: ei kriteerejä

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I: vaihtoehto { $i }: arvoja { $row }, mutta kriteerejä { $n }

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: vaihtoehdolla { $i } on ei-äärellinen arvo

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: tyhjä päätösmatriisi

engine-e-mcda-moora-moora-no-criteria = MOORA: ei kriteerejä

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA: painoja { $n }, mutta kriteerityyppejä { $types }

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA: vaihtoehto { $i }: arvoja { $row }, mutta kriteerejä { $n }

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: vaihtoehdolla { $i } on ei-äärellinen arvo

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: kriteerin { $j } L2-normi on nolla

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: tyhjä päätösmatriisi

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: ei kriteerejä

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II: painoja { $n }, mutta tyyppejä { $types } / preferenssifunktioita { $prefs }

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II: vaihtoehto { $i }: arvoja { $row }, mutta kriteerejä { $n }

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: vaihtoehdolla { $i } on ei-äärellinen arvo

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: tyhjä päätösmatriisi

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: ei kriteerejä

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS: painoja { $n }, mutta kriteerityyppejä { $types }

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS: vaihtoehto { $i }: arvoja { $row }, mutta kriteerejä { $n }

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: vaihtoehdolla { $i } on ei-äärellinen arvo

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = additiivisella hyötyfunktiolla ei ole attribuutteja

engine-e-mcda-utility-attributes-but-weights = attribuutteja { $attributes }, mutta painoja { $weights }

engine-e-mcda-utility-invalid-scaling-constant = virheellinen skaalausvakio { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = skaalausvakioiden summa on nolla

engine-e-mcda-utility-attribute-values-expected-got = odotettiin attribuuttiarvoja: { $attributes }, saatiin { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: tyhjä päätösmatriisi

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: ei kriteerejä

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR: painoja { $n }, mutta kriteerityyppejä { $types }

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR: vaihtoehto { $i }: arvoja { $row }, mutta kriteerejä { $n }

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: vaihtoehdolla { $i } on ei-äärellinen arvo

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: tyhjä päätösmatriisi

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: ei kriteerejä

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS: painoja { $n }, mutta kriteerityyppejä { $types }

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambdan { $lambda } on oltava välillä [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS: vaihtoehto { $i }: arvoja { $row }, mutta kriteerejä { $n }

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: vaihtoehdon { $i } kriteerin { $j } arvon { $x } on oltava äärellinen ja > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: tyhjä päätösmatriisi

engine-e-mcda-wpm-wpm-no-criteria = WPM: ei kriteerejä

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM: painoja { $n }, mutta kriteerityyppejä { $types }

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM: vaihtoehto { $i }: arvoja { $row }, mutta kriteerejä { $n }

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: vaihtoehdon { $i } kriteerin { $j } arvon { $x } on oltava äärellinen ja > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = päätösmatriisissa ei ole kriteerejä

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = päätösmatriisissa ei ole vaihtoehtoja

engine-e-mcda-wsm-criterion-has-an-invalid-weight = kriteerillä ”{ $name }” on virheellinen paino { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = kriteerien painojen summa on nolla

engine-e-mcda-wsm-alternative-has-values-but-there = vaihtoehto ”{ $name }”: arvoja { $values }, mutta kriteerejä { $n }

engine-e-mcda-wsm-alternative-has-non-finite-value = vaihtoehdolla ”{ $name }” on ei-äärellinen arvo kriteerillä ”{ $value }”

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = ei DAF: lyhyempi kuin yksi tietue

engine-e-naif-kernel-not-daf-identification-word = ei DAF: tunnistesana { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = tukematon DAF-binäärimuoto { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = epäuskottava DAF-otsikko: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF-osoite { $addr } on tiedoston lopun jälkeen

engine-e-naif-kernel-bad-daf-address-range = virheellinen DAF-osoitealue { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = DAF-yhteenvetoluettelo ei pääty

engine-e-naif-kernel-daf-summary-record-claims-summaries = DAF-yhteenvetotietue { $rec } ilmoittaa yhteenvetojen määräksi { $count }

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = virheellinen tyypin 2 segmentti: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = tyypin 2 segmentin koko ei vastaa sen hakemistoa

engine-e-naif-kernel-epoch-outside-the-record = epookki { $et } tietueen [{ $v1 }, { $v2 }] ulkopuolella

engine-e-naif-kernel-type-segment-size-does-not-2 = tyypin 1 segmentin koko ei vastaa arvoa N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = virheellinen tyypin 1 tietue: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = ei SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = SPK-yhteenveto ei ole ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = ei SPK-tyypin 1/2 dataa kappaleelle { $target } hetkellä ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = SPK-segmentti kappaleelle { $target } on kehyksessä { $frame }, ei J2000

engine-e-naif-kernel-spk-centre-chain-does-not = SPK-keskusketju ei yllä barycentreen

engine-e-naif-kernel-not-binary-pck = ei binäärinen PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = PCK-yhteenveto ei ole ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = ei PCK-tyypin 2 dataa kehykselle { $body_frame } hetkellä ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = PCK-kehys { $body_frame } on annettu kehyksen { $other } suhteen, joka ei ole J2000 eikä ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = virheellinen luku { $s }

engine-e-navsignal-must-be-positive-number = { $s } on oltava positiivinen luku

engine-e-navsignal-modulation-expected-name-args-bpsk = modulaatio { $label }: odotettiin muotoa NAME(args), esim. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulaatiosta { $label } puuttuu sulkeva sulku

engine-e-navsignal-modulation-is-not-one-of = modulaatio { $label } ei ole BPSK(n), BOC(m,n) eikä MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = päättymätön entiteetti kohteessa { $s }

engine-e-ndm-xml-bad-character-reference = virheellinen merkkiviite &{ $ent };

engine-e-ndm-xml-unknown-entity = tuntematon entiteetti &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = päättymätön prosessointikäsky

engine-e-ndm-xml-unterminated-comment = päättymätön kommentti

engine-e-ndm-xml-unterminated-declaration = päättymätön deklaraatio

engine-e-ndm-xml-expected-an-element-at-byte = odotettiin elementtiä tavussa { $pos }

engine-e-ndm-xml-unterminated-start-tag = päättymätön aloitustunniste

engine-e-ndm-xml-attribute-without-value = attribuutti ilman arvoa

engine-e-ndm-xml-unterminated-attribute-value = päättymätön attribuutin arvo

engine-e-ndm-xml-unterminated-end-tag = päättymätön lopetustunniste

engine-e-ndm-xml-unterminated-cdata = päättymätön CDATA

engine-e-ndm-xml-content-after-the-root-element = sisältöä juurielementin jälkeen

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } on oltava äärellinen ja ei-negatiivinen

engine-e-nma-budget-subframe-must-be-positive = subframe_s on oltava positiivinen

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps on oltava positiivinen

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed on oltava 0 tai positiivinen

engine-e-nmea-synth-cli-unexpected-argument = odottamaton argumentti { $s }

engine-nmea-synth-cli-instructor-log = ohjaajaloki: { $e }

engine-nmea-synth-cli-instructor-log-and = ohjaajaloki: { $jp } ja { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP-palvelin kuuntelee osoitteessa { $s }; odotettavat asiakkaat: { $wait_clients }

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = odotettiin YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = päivämäärä tai aika alueen ulkopuolella (vuodet 1980–2099)

engine-e-nmea-synth-clock-no-such-calendar-date = kalenteripäivää ei ole

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } on oltava äärellinen luku

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s on oltava välillä 1–86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz on oltava 1, 2, 5 tai 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = aluksen sijainnin on oltava 89 asteen sisällä päiväntasaajasta

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn on oltava välillä 0–60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = aluksen kääntymisnopeuden ja kiihtyvyyden rajojen on oltava positiivisia

engine-e-nmea-synth-config-give-at-least-one-waypoint = anna vähintään yksi [[waypoint]] tai vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = reittipiste { $v1 } on alueen ulkopuolella

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = reittipisteen { $v1 } speed_kn on oltava välillä 0–60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems on nimettävä vähintään yksi satelliittitähdistö

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } ei ole yksi arvoista { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s on oltava vähintään 1

engine-e-nmea-synth-config-event = tapahtuma { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s on oltava ajon sisällä

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s on oltava positiivinen; ramp_s ja recovery_s ei-negatiivisia

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s ei saa ylittää arvoa duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } ei päde tähän tyyppiin

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz on oltava välillä 20–60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db vaaditaan

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db on oltava välillä 0–80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db on oltava välillä 0–30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m vaaditaan

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m on oltava välillä 0–500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = vetäminen kiihdyttäisi väärää jälkeä enintään { $need } m/s^2, yli arvon max_accel_mps2 = { $a }; pidennä ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = anna täsmälleen yksi arvoista bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s vaaditaan

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s on oltava nollasta poikkeava ja vuorokauden sisällä

engine-e-nmea-synth-config-delay-is-required = delay_s vaaditaan

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s on oltava välillä 0–3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = horisonttiprofiili ei kuvaa yhtään estettä

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } on päättynyt

engine-nmea-synth-gen-the-receiver-reports-fix-again = vastaanotin ilmoittaa taas paikkaratkaisun (käytetyt satelliitit: { $n_used })

engine-nmea-synth-gen-the-receiver-has-no-fix = vastaanottimella ei ole paikkaratkaisua (käyttökelpoiset satelliitit: { $n_used }, tarvitaan neljä)

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = alkaen T+{ $start_s } s ajan { $duration_s } s (alkuramppi { $ramp_s } s, palautumisramppi { $recovery_s } s)

engine-nmea-synth-log-every-tracked-satellite-shows-db = ; jokainen seurattu satelliitti näyttää { $c } dB-Hz niin kauan kuin se kestää

engine-nmea-synth-log-jamming-received-n0-falls-by = häirintä: vastaanotettu C/N0 laskee enintään { $cn0_drop_db } dB (satelliittikohtainen hajonta { $spread_db } dB); satelliitteja putoaa pois ja paikkaratkaisu menetetään, kun käyttökelpoisia jää alle neljä

engine-nmea-synth-log-towards-deg-true = suuntaan { $b } deg (tosisuunta)

engine-nmea-synth-log-towards-deg-true-deg-relative = suuntaan { $t } deg (tosisuunta) ({ $r } deg suhteessa kulkusuuntaan alussa, sitten pidetty)

engine-nmea-synth-log-position-drag-off-the-reported = paikan irtiveto: ilmoitettu paikka siirtyy { $final_offset_m } m päähän { $dir }, kun vastaanotin säilyttää kelvollisen paikkaratkaisun (väärän jäljen huippu { $pv } m/s ja { $pa } m/s^2){ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = aikaharhautus: ilmoitettu UTC siirtyy { $offset_s } s todellisesta; paikka pysyy todellisena{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = toistoviive (meaconing-tyyli): paikka{ $v1 } jää totuudesta jälkeen { $delay_s } s{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = luonnollinen heikkeneminen: taivas sulkeutuu ilmoitetun horisonttiprofiilin ({ $e }) taakse; sen takana olevat satelliitit pysyvät listalla ilman SNR-arvoa eikä niitä käytetä, muiden C/N0 pysyy ennallaan eikä mikään ole väärennettyä

engine-nmea-synth-log-instructor-log = OHJAAJALOKI: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Ohjaajan huomautus: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Alku { $start_utc }   kesto { $duration_s } s   seed { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }HUIPUT  todellinen: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   ilmoitettu: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: tuntematon satelliittitähdistö { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Toleranssi on f64:n rankin luennan kohinalattian { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)) alapuolella: sitä vastaava ominaisarvolattia rel_tol^2 = { $v1 } jää Gram-matriisin pyöristyskohinan alle, joten ylimääräiset suunnat ovat aritmeettista jäännöstä eivätkä havaittavuutta.

engine-observability-gramian-rank-clamped-from-the-singular = aste rajattu singulaariarvojen lukumäärästä { $counted } arvoon min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } arvolla rel_tol { $rel_tol }: matriisin { $n_rows }x{ $n_cols } aste ei voi olla { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP määrittelemätön (asteeltaan vajaa / singulaarinen geometria): aste { $rank }, tilojen määrä { $n }, datumin vaje { $v3 }, ehtoluku { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } tavua ei ole kokonaislukumäärä 36 tavun tietueita

engine-e-odf-record-precedes-any-group-header = tietue { $v1 } edeltää mitään ryhmäotsikkoa

engine-e-odf-no-orbit-data-group = ei rata-aineistoryhmää

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } ei ole kohteen { $name } avainsana

engine-e-odm-without = { $name } ilman kohtaa { $k }

engine-e-odm-needs-exactly-one-of = { $name } vaatii täsmälleen yhden kohdista { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION ja MESSAGE_ID ovat version 3.0 otsikon avainsanoja (versio { $version })

engine-e-odm-unexpected-line = odottamaton rivi { $b }

engine-e-odm-unknown-keyword = tuntematon avainsana { $k }

engine-e-odm-block-repeated-or-out-of = { $block }-lohko toistuu tai on väärässä järjestyksessä kohdassa { $key }

engine-e-odm-repeated = { $key } toistuu

engine-e-odm-comments-after-the-last-keyword = kommentteja viimeisen avainsanan jälkeen

engine-e-odm-given-twice = { $b } annettu kahdesti

engine-e-odm-opm-without-metadata = OPM ilman metadataa

engine-e-odm-opm-without-state-vector = OPM ilman tilavektoria

engine-e-odm-omm-without-metadata = OMM ilman metadataa

engine-e-odm-omm-without-mean-elements = OMM ilman keskielementtejä

engine-e-odm-is-not-keyword-of-the = { $k } ei ole lohkon { $kind } avainsana

engine-e-odm-block-without = { $kind }-lohko ilman kohtaa { $k }

engine-e-odm-block-with-data-lines = { $kind }-lohko, jossa on datarivejä

engine-e-odm-line-has-values-expected = { $kind }-rivi { $l }: arvoja { $l2 }, odotettiin { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } ei ole OCM-metadatan avainsana

engine-e-odm-ocm-metadata-without = OCM-metadata ilman kohtaa { $k }

engine-e-odm-block-repeated = { $kind }-lohko toistuu

engine-e-odm-inside-block = { $t } lohkon sisällä

engine-e-odm-unsupported-ocm-block = tukematon OCM-lohko { $tag }

engine-odm-outside-block = { $t } lohkon ulkopuolella

engine-e-odm-closes-block = { $t } sulkee { $want }-lohkon

engine-e-odm-unexpected-line-2 = odottamaton rivi { $t }

engine-e-odm-outside-block = { $k } lohkon ulkopuolella

engine-e-odm-unterminated-block = päättymätön lohko

## src/oem.rs

engine-e-oem-epoch-missing-date-time-separator = epookista puuttuu päivämäärän ja ajan erotin ”T”: { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = tukematon OEM-epookin päivämäärä ”{ $date }” (odotettiin yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = tukematon OEM-epookin aika ”{ $time }” (odotettiin HH:MM:SS)

engine-e-oem-bad-epoch-year = virheellinen epookin vuosi: { $d }

engine-e-oem-bad-epoch-month = virheellinen epookin kuukausi: { $d }

engine-e-oem-bad-epoch-day = virheellinen epookin päivä: { $d }

engine-e-oem-bad-epoch-hour = virheellinen epookin tunti: { $t }

engine-e-oem-bad-epoch-minute = virheellinen epookin minuutti: { $t }

engine-e-oem-bad-epoch-second = virheellinen epookin sekunti: { $t }

engine-e-oem-oem-epoch-field-out-of = OEM-epookin kenttä alueen ulkopuolella: { $s }

engine-e-oem-unexpected-oem-header-line = odottamaton OEM-otsikkorivi: { $line }

engine-e-oem-expected-meta-start-found = odotettiin META_START, löytyi: { $line }

engine-e-oem-unexpected-oem-metadata-line = odottamaton OEM-metadatarivi: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM-segmentin metadatasta puuttuu META_STOP

engine-e-oem-oem-metadata-missing-object-name = OEM-metadatasta puuttuu OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = OEM-metadatasta puuttuu OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = OEM-metadatasta puuttuu CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = OEM-metadatasta puuttuu REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = OEM-metadatasta puuttuu TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = OEM-metadatasta puuttuu START_TIME

engine-e-oem-oem-metadata-missing-stop-time = OEM-metadatasta puuttuu STOP_TIME

engine-e-oem-oem-data-line-needs-position = OEM-datarivin komponentit: paikka+nopeus (6) tai +kiihtyvyys (9), saatiin { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = ei-numeerinen OEM-tila-arvo ”{ $t }” rivillä: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM:stä puuttuu otsikko CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = OEM:stä puuttuu otsikko CREATION_DATE

engine-e-oem-oem-missing-originator-header = OEM:stä puuttuu otsikko ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM ei sisältänyt segmenttejä

engine-oem-oem-interop-round-tripped-segment = oem-interop: edestakaisin muunnettuja segmenttejä { $segments }, tiloja { $n_states_total }; suurin edestakaisen muunnoksen virhe { $p } km / { $v } km/s (MODELLED yhteentoimivuus)

engine-oem-oem-interop-ingested-segment-states = oem-interop: vastaanotettu segmenttejä { $segments }, tiloja { $n_states_total } ulkoisesta OEM:stä (originator { $originator }) (MODELLED yhteentoimivuus)

engine-e-oem-no-covariance-start-block = ei COVARIANCE_START-lohkoa

engine-e-oem-no-covariance-stop = ei COVARIANCE_STOP-riviä

engine-e-oem-bad-covariance-value = virheellinen kovarianssiarvo ”{ $tok }”: { $e }

engine-e-oem-expected-21-covariance-values-found = odotettiin 21 kovarianssiarvoa, löydettiin: { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM-vienti vaatii täydet (rivi 1 + rivi 2) TLE:t; tässä lohkossa ei ole sellaisia

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } on oltava välillä [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg on oltava välillä [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave on oltava "plane" tai "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction on oltava "downlink" tai "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = availability_targets_pct-alkioiden on oltava välillä (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h on oltava enintään 8760 (yksi vuosi)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: askeleet { $steps } ylittää rajan { $MAX_STEPS }, jonka tulos voi sisältää; nosta step_s tai lyhennä duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = tuntematon kelloluokka "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = jokaisella sijainnilla on oltava nimi

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = sijainti { $name }: leveys-/pituusaste alueen ulkopuolella

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = sijainti { $name }: altitude_m on oltava välillä [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm korkeuskulmalla { $elevation_deg } deg, marginaali { $margin0 } dB ennen ilmakehää; paras sijainti { $scn } { $v5 } %; { $order }-sijaintinen verkko { $last } % riippumattomalla / { $last2 } % korreloivalla säällä (MODELLED, ohjeellinen)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = rinex-lohko jäsennettiin, mutta se ei sisältänyt tuettuja efemerideja

## src/orbit.rs

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg on oltava välillä [-90, 90] ja jokaisen kentän äärellinen

engine-e-orbit-no-satellites-to-export = ei vietäviä satelliitteja

engine-e-orbit-time-step-must-be-positive = time.step_s on oltava positiivinen SP3-viennille

engine-e-orbit-time-step-must-be-positive-2 = time.step_s on oltava positiivinen OEM-viennille

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } on oltava positiivinen; saatiin { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s on oltava äärellinen ja ei-negatiivinen

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate on oltava äärellinen ja ei-negatiivinen

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = harhauttajan pienimmän korkeuskulman on oltava välillä [0, 90) astetta

engine-e-orbital-timing-cross-check-sigma-ns-must = ristiintarkistuksen sigma_ns on oltava äärellinen ja ei-negatiivinen

engine-orbital-timing-the-in-plane-neighbour-degrees = samatasoinen naapuri, { $v1 } astetta edellä, on yhden harhauttajan peittoalueen ({ $v2 } astetta poikki) ulkopuolella

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = samatasoinen naapuri, { $v1 } astetta edellä, voi olla saman harhauttajan peittoalueen ({ $v2 } astetta poikki) sisällä, joten molempia kelloja voidaan vetää yhdessä

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = syötetiedosto puuttuu

engine-e-osnma-cli-max-time-error-has-no = --max-time-error ei vaikuta ilman valintaa --reference-time

engine-e-osnma-cli-not-number = ei ole luku: { $s }

engine-e-osnma-cli-public-key-must-be-id = julkisen avaimen muodon on oltava ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = julkisen avaimen tyypin on oltava p256 tai p521

engine-e-osnma-cli-unknown-format = tuntematon muoto { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } ei ole tekstiä; käytä UBX-virralle valintaa --format ubx

engine-e-osnma-cli-vector-csv-needs-start-gst = vektori-CSV vaatii valinnan --start-gst tai päivätyn tiedostonimen

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    virhe: ei voi lukea { $input }: { $e }

engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA -todennus
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = syöte: { $input } (sivut: { $pages })

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: kehykset { $frames }; dekoodatut I/NAV-sivut { $inav_pages }, aikaan sijoitetut { $pages } (CRC-virheet { $bad_crc }, sijoittamattomat { $unstamped }, aikaristiriidat { $time_conflicts })

engine-osnma-cli-overall-nma-status = kokonaistila: { $status_word }   NMA-tila: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = HÄLYTYS: vahvistettu OSNMA-hälytysviesti vastaanotettiin. Lopeta OSNMA-datan käyttö; mitään ei raportoida todennettuna.

engine-osnma-cli-freshness-not-enforced-no-reference = tuoreus: EI valvota. Vertailuaikaa ei annettu, joten alikehysten ajat otetaan syötteestä ja vanhan datan toisto todentuisi.

engine-osnma-cli-freshness-sub-frames-within-of = tuoreus: alikehykset, jotka ovat { $max_err } s sisällä vertailuajasta { $v2 }, käytetään; syrjäytetyt: { $set_aside }. Vertailuaika on yksittäinen ajanhetki.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satelliitti  tila             todennettu  epäonnistui  odottaa  hylätty  viimeksi todennettu

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epookki (tunnisteen alikehys)      tx   data  adkd  ctr  tulos

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = rivi { $v1 }: odotettiin 3 kenttää

engine-e-osnma-input-line-bad-svid = rivi { $v1 }: virheellinen SVID

engine-e-osnma-input-line-bad-bit-count = rivi { $v1 }: virheellinen bittimäärä

engine-e-osnma-input-line-data-is-not-hex = rivi { $v1 }: data ei ole heksadesimaalia

engine-e-osnma-input-line-bit-count-does-not = rivi { $v1 }: bittimäärä ei vastaa dataa

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = aikatoleranssin on oltava alle yhden alikehyksen ({ $SUBFRAME_S } s), saatiin { $t } s

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834 -refraktio on määritelty aseman korkeuksille 0–3 km; saatiin { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s ja step_s on oltava positiivisia

engine-e-passes-station-lat-deg-must-be = station_lat_deg on oltava välillä [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg on oltava välillä [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours on oltava äärellinen ja positiivinen

engine-e-passes-step-must-be-finite-and = step_s on oltava äärellinen ja positiivinen

engine-passes-passes-pass-es-of-km = passes: ohitukset { $passes }, rata { $altitude_km } km / { $inclination_deg }° kohteen ({ $station_lat_deg }°, { $station_lon_deg }°) yllä > { $mask_deg }° ajalla { $duration_hours } h; kokonaisyhteysaika { $total_access_s } s (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = lyhyt { $record }-tietue: { $line }

engine-e-precise-products-bad-number-in = virheellinen luku { $s } kohdassa { $line }

engine-e-precise-products-bad-field-in = virheellinen kenttä { $s } kohdassa { $line }

engine-e-precise-products-bad-antex-epoch = virheellinen ANTEX-epookki { $s }

engine-e-precise-products-bad-offset = virheellinen siirtymä { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = efemeridien tarjoajalla ei ole geosentristä { $name } hetkellä JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D-virheen RMS { $rms } m (maks { $max } m)

engine-pvt-post-fit-rms = { " " }| jälkisovituksen RMS { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | nav-satelliitit { $n_satellites_nav } | ratkaistut epookit { $epochs_solved }/{ $epochs_total } | keskimäärin { $mean_n_used } sat, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Yksittäispisteen paikannus — 3D-virhe vs. kartoitettu koordinaatti (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Yksittäispisteen paikannus — jälkisovituksen residuaalin RMS ({ $mean_postfit_rms_m } m keskiarvo)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = RunOutputin taulukkokäsittelijät vaativat NumPyn (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } ei ole numeerinen taulukko (lukujen lista tai yhtä pitkien lukulistojen lista)

engine-e-python-is-not-non-empty-list = { $path } ei ole ei-tyhjä tietueiden lista

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } tavua, svg={ $svg } tavua, csv={ $value } tavua, summary={ $value2 })

engine-e-python-and-must-be-the-same = i ja q on oltava yhtä pitkät ({ $i } vs. { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: ei saavutettu (tilasto { $statistic } < kynnys { $threshold })

engine-python-design-prn-channels-at-most = (design, PRN) -kanavat: { $designs }; enintään 256 per pyyhkäisy

engine-python-not-acquired-statistic-threshold = { $code }: ei saavutettu (tilasto { $statistic } < kynnys { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] vaatii kentän `label`

engine-e-python-runs-needs-result = runs[{ $i }] vaatii kentän `result`

engine-e-python-must-be-between-and-32 = { $name } on oltava välillä 0–2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | seed { $seed } | v{ $engine_version } | kvantti voittaa FoM-mittareista { $value }/{ $foms } | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } lähteestä { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = tuntematon baseline_clock_class ”{ $s }” (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = tuntematon candidate_clock_class ”{ $other }” (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = ADEV-tau-/arvojen on oltava äärellisiä ja > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | ehdokas { $candidate_source } | ajoituksen holdover { $timing_holdover_s }s vs { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inertiaalinen { $inertial_holdover_s }s vs { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | kestävyyden liukuaika { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = RINEX-kellotiedosto ilmoittaa aikajärjestelmän { $id }, jota tämä lukija ei tunne (tunnetut: { $known_clock_time_systems }); se hylätään sen sijaan, että sen epookit luettaisiin GPS-aikana

engine-e-realdata-clk-rinex-clock-file-has-satellite = RINEX-kellotiedostossa on satelliittijärjestelmä { $other } eikä se ilmoita kenttää TIME SYSTEM ID; sen epookkien aikajärjestelmää ei arvata

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX-kellotiedostot ilmoittavat eri aikajärjestelmät ({ $s } ja { $ts }); niitä ei yhdistetä yhdelle aika-akselille

engine-e-realdata-clk-no-as-or-ar-records = ei AS- tai AR-tietueita kohteelle { $id }

engine-e-realdata-clk-short-circular-row = lyhyt Circular T -rivi: { $t }

engine-e-realdata-clk-bad-value-in = virheellinen arvo { $s } kohdassa { $t }

engine-e-realdata-clk-no-section-mjd-header-found = Section 1 MJD -otsikkoa ei löytynyt

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = päättymätön sulkeva tunniste

engine-e-realdata-ion-sdr-unbalanced-closing-tag = epätasapainoinen sulkeva tunniste

engine-e-realdata-ion-sdr-unterminated-tag = päättymätön tunniste

engine-e-realdata-ion-sdr-attribute-value-missing = attribuutin arvo puuttuu

engine-e-realdata-ion-sdr-element-outside-the-document = elementti dokumentin ulkopuolella

engine-e-realdata-ion-sdr-text-outside-the-document = teksti dokumentin ulkopuolella

engine-e-realdata-ion-sdr-element-left-open = auki jääneet elementit: { $stack }

engine-e-realdata-ion-sdr-expected-one-root-element-found = odotettiin yhtä juurielementtiä, löytyi: { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = tuntematon taajuusmuoto { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = tukematon koodaus { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = virrat: { $streams }; vain yhden virran tiedostot luetaan

engine-e-realdata-ion-sdr-block-of-cycles-with-header = lohko ({ $cycles } jaksoa), jossa on otsikko tai alatunniste, toistuu; luetaan vain yksi koko tiedoston kattava lohko

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = lohko: sanojen määrä { $words_per_chunk }, sanan koko tavuina { $word_bytes }

engine-e-realdata-ion-sdr-unsupported-sample-format = tukematon näytemuoto { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = kvantisointi { $quantization }, pakattuja bittejä näytettä kohti: { $packed_bits }

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = näytteenottotaajuus { $sample_rate_hz } Hz ei ole nopeuskertoimen { $samples_per_lump } kokonaislukukerrannainen

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = lohko ei sisällä yhtään kokonaista lump-yksikköä

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = pyydetyt näytteet { $start }..{ $v1 }, tiedoston koko: { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = CRD-versio ei ole luettavissa { $f }

engine-realdata-llr-crd-crd-format-version-is-not = CRD-muotoversiota { $v } ei tueta (vain 1 ja 2 jakavat tietueen 11 kenttäjärjestyksen, johon tämä lukija nojaa)

engine-realdata-llr-crd-unreadable-station-id = aseman tunnus ei ole luettavissa { $f }

engine-realdata-llr-crd-unreadable-time-scale = aika-asteikko ei ole luettavissa { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD-epookin aika-asteikko { $time_scale } ei ole yksi niistä kolmesta, jotka muotomäärittely sanoo analyytikkojen hyväksyvän (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); sitä ei lueta UTC:nä

engine-realdata-llr-crd-unreadable-h4-field = h4-kenttä { $i } ei ole luettavissa: { $f }

engine-realdata-llr-crd-unreadable-field = kenttä { $i } ei ole luettavissa: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = epookkitapahtuma ei ole luettavissa { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = epäfysikaalinen kulkuaika { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = ei voi lukea normaalipistehakemistoa { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = hakemistossa { $dir } ei ole *.npt-normaalipistetiedostoja — tämä skenaario lukee todellisia arkistoituja mittauksia eikä toimi ilman niitä

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = virheellinen luku ”{ $t }”: { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM:n yksi ulottuvuus on nolla

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = koodaus { $encoding }: LuGRE-erä on kahden komplementti

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = tavut { $bytes }: lyhyempi kuin IQS-otsikko

engine-e-realdata-lugre-not-an-iqs-frame = ei IQS-kehys: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = näytteenottotaajuus: metadata { $sample_rate_hz } Hz, otsikko { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = kvantisointi (bittiä): metadata { $quantization }, otsikko { $quant_bits }

engine-realdata-lugre-centre-frequency-metadata-hz-header = keskitaajuus: metadata { $center_freq_hz } Hz, otsikko { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = välitaajuus: metadata { $translated_freq_hz } Hz, otsikko { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = näytteiden määrä: metadatan asettelu antaa { $layout }, otsikko { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = otsikko/alatunniste (tavua): metadata { $header_bytes }/{ $footer_bytes }, muoto { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = tiedoston pituus { $file_len } ei ole otsikko + { $value } näytetavua + alatunniste

engine-realdata-lugre-field-missing = kenttä { $key } puuttuu

engine-e-realdata-lugre-field-unreadable = kenttä { $key } ei ole luettavissa

engine-realdata-lugre-raw-line = RAW-rivi { $v1 }: { $e }

engine-realdata-lugre-acq-line = ACQ-rivi { $v1 }: { $e }

engine-realdata-lugre-nav-line = NAV-rivi { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK-rivi { $v1 }: ei luettavissa

engine-e-realdata-lugre-clk-row-columns-expected = CLK-rivi { $v1 }: sarakkeita { $v }, odotettiin 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = JSON-jäsennys: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = odotettiin JSON-objektia ylimmällä tasolla

engine-e-realdata-yunnan-missing-recordtime-array = recordTime-taulukko puuttuu

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = ei voi lukea EOP-tiedostoa { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s on oltava äärellinen ja ei-negatiivinen, saatiin { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = ei voi lukea myöhemmän version EOP-tiedostoa { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = EMPTY, ja tarkoituksella: ennustettu-vs.-lopullinen-rivi tarvitsee julkaisuepookin, jonka takana on KOKO { $window_days } päivän sovitusikkuna ja julkaistu Bulletin B FINAL kohde-epookissa. Voimassa oleva syöte ({ $eop_source }) ei tarjoa epookkia, joka täyttäisi molemmat. Lyhennä `operational_window_days` tai anna pidempi todellinen finals2000A-sarja — taulukon täyttämiseksi ei valmisteta yhtään riviä.

engine-realtime-frame-eop-measured-over-the-real-series = Mitattu käytössä olevan todellisen sarjan ({ $eop_source }) yli. Jokainen rivi on aito ennustevirhe: ennuste hetkelle T+h, muodostettu hetkellä T tai sitä ennen julkaistuista Bulletin A rapid -riveistä, arvioituna MYÖHEMMIN JULKAISTUA Bulletin B FINAL -arvoa vastaan hetkellä T+h. Persistenssi pisteytetään samalla epookkijoukolla samoja lopullisia arvoja vastaan, joten kaksi saraketta eroavat ennustimessa eivätkä missään muussa. `improvement_factor` alle 1 tarkoittaa, että operatiivinen ennustin on persistenssiä HUONOMPI kyseisellä horisontilla, ja se raportoidaan sellaisena.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Mitattu aidon kahden version parin yli: alkuperäinen versio ({ $eop_source }) sisältää todellisia Bulletin A -ennusteita oman dataleikkauksensa jälkeen, ja arkistoitu myöhempi versio ({ $c }) sisältää ne Bulletin B FINAL -arvot, jotka nämä päivät lopulta saivat. Kolmea ennustetta verrataan tähän lopulliseen arvoon — arkistoitu Bulletin A -ennuste itse, tämän crate-paketin operatiivistyylinen sovitus alkuperäisen version yli ja persistenssi leikkauspisteessä.

engine-realtime-frame-eop-empty-and-deliberately-so-later = EMPTY, ja tarkoituksella: myöhempi versio annettiin ({ $c }), mutta yhtäkään päivää ei ole sekä Bulletin A PREDICTION -arvona alkuperäisessä tiedostossa ({ $eop_source }) että Bulletin B FINAL -arvona myöhemmässä millään pyydetyllä horisontilla. Yhtään riviä ei synteesoida.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = EMPTY, ja tarkoituksella. AIDON ARKISTOIDUN ennusteen pisteytys tarvitsee saman finals2000A-tuotteen kaksi versiota; tälle ajolle annettiin yksi ({ $eop_source }). Repositorio ei sisällä arkistoitua aiempaa versiota, eikä sellaista EI valmisteta häiritsemällä sen versiota, joka sillä on — synteesoitu arkisto tekisi jokaisesta tämän taulukon luvusta häiriön mittauksen. Anna todellinen arkistoitu myöhempi versio valinnalla `eop_finals2000a_later` täyttääksesi sen. Siihen asti tämän raportin sisältämät aidot ennustettu-vs.-lopullinen-virheet ovat kohdassa `table5_operational_vs_persistence`, jossa ennuste on tämän crate-paketin oma ja totuus on myöhemmin julkaistu Bulletin B FINAL.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Taulukko 1: jälkiprosessointi { $c } m ({ $c2 } ms UT1) ↔ reaaliaika { $c3 } m ({ $c4 } ms UT1) | Taulukko 2: lopullinen lattia { $floor } ms → { $far } päivän { $far2 } ms | budjetti yhteensä { $total_m } m ({ $total_time_ns } ns) | L19 vipuvarsi + L18 todellinen data (Validated), OD cov (Modelled)

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Mitattu aidon kahden version parin yli: alkuperäisen tiedoston ({ $eop_source }) Bulletin A -ENNUSTETTU UT1 erotettuna arkistoidun myöhemmän version ({ $c }) lopullisesta Bulletin B FINAL -arvosta, horisonteilla: { $predicted_vs_final }.

engine-realtime-frame-eop-empty-and-deliberately-so-an = EMPTY, ja tarkoituksella: arkistoitu myöhempi versio annettiin ({ $c }), mutta yhtäkään päivää ei ole sekä Bulletin A PREDICTION -arvona alkuperäisessä tiedostossa ({ $eop_source }) että Bulletin B FINAL -arvona myöhemmässä millään pyydetyllä horisontilla, joten ennustettu-vs.-lopullinen-residuaalia ei ole raportoitavaksi. Yhtään riviä ei synteesoida.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = EMPTY, ja tarkoituksella: ennustettu-vs.-lopullinen-residuaali tarvitsee saman finals2000A-tuotteen KAKSI versiota. Tälle ajolle annettiin yksi ({ $eop_source }). Sen Bulletin A -ennusteriviit ovat tulevia päiviä varten, joilla ei vielä ole Bulletin B -lopullista arvoa, joten residuaalia ei ole mitattavissa eikä sitä keksitä tässä. Anna arkistoitu myöhempi versio valinnalla `eop_finals2000a_later` täyttääksesi tämän taulukon. Siihen asti kohdassa `table2_error_vs_horizon` raportoitu usean päivän kasvu on PERSISTENSSI-ennustin pisteytettynä todellisia lopullisia arvoja vastaan — todellinen mitattu virhe, mutta Modelled-ennustin, eikä IERS Bulletin A -ennusteen residuaali.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = alusarviointi vaatii [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = otteen koko tavuina: { $excerpt }; raja: { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = ote sisältää yli { $MAX_EXCERPT_EPOCHS } epookkia; lyhennä sitä

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = ote päättyy { $calibration_s } s:n kalibrointi-ikkunan sisään (epookit: { $epochs }): mitään ei pisteytetty

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = UBX-lokissa ei ole UTC-leimattua epookkia

engine-e-receiver-trust-calibration-no-scenario-json-under = hakemiston { $root } alla ei ole scenario.json-tiedostoa

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: pidätetty (held-out) puhdas Pfa <= { $B1_MAX_PFA } (kalibroitu: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } on oltava äärellinen ja > 0 (saatiin { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel on oltava äärellinen ja >= 0 (saatiin { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used on oltava vähintään 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg on oltava välillä [0, 90] (saatiin { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg on oltava välillä (0, 360] (saatiin { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points on oltava välillä [0, 100] (saatiin { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio on oltava äärellinen ja > 1 (saatiin { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor on oltava välillä (0, 100] (saatiin { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) on pisteytyksen degraded_min ({ $degraded_min }) alapuolella: geometria yksin voisi yltää ei-luotettuun kaistaan

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites = geometria { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, satelliitit { $n_used }{ $v6 }

## src/receiver_trust/geometry.rs

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: geometriapäätelmä luokitellaan epäjohdonmukaisuudeksi

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: raportoitu, ei pisteytetty (geometria ei ole heikko)

engine-receiver-trust-geometry-not-scored-the-score-deducts = ei pisteytetty (pisteytys vähentää vain, kun HDOP on yli { $hdop_max }, PDOP yli { $pdop_max } tai käytettyjä satelliitteja on alle { $min_used })

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] johdettu { $n } kirjatusta satelliitista
       *[other] johdettu { $n } kirjatusta satelliitista
    }

engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] vastaanottimen ilmoittamana { $n } satelliitti käytössä
       *[other] vastaanottimen ilmoittamana { $n } satelliittia käytössä
    }

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = ilmoitettu HDOP { $fmt_dop } ei täsmää ilmoitetusta taivaasta johdettuun HDOP:iin { $fmt_dop2 } toleranssin ylittävästi

engine-receiver-trust-geometry-satellites-in-view-but-not = näkyvissä olevat satelliitit, joita ei seurata ({ $g } / { $in_view } vähintään { $low_elev_deg } deg korkeuskulmassa): signaaliympäristö, ei geometria

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } satelliitti, vähemmän kuin { $min_used }
       *[other] { $n } satelliittia, vähemmän kuin { $min_used }
    }

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } yli { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } yli { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = ilmoitetun horisonttiviivan takana olevat satelliitit: { $m }

engine-receiver-trust-geometry-every-satellite-in-one-half = kaikki satelliitit taivaan toisella puoliskolla (aukko { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = geometrian heikentämä: { $parts } ({ $from }); ei epäjohdonmukaisuus

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = loki ei sisällä yhtään epookkia: mitään siitä ei voitu lukea muodossa { $name } ({ $skipped_records } tietuetta ohitettu vioittuneina tai jäsentymättöminä); tarkista muoto-asetus

engine-receiver-trust-ingest-gps-week-tow = GPS-viikko { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS-viikko { $w } TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (päivämäärä ei ole lokissa)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } on oltava äärellinen ja >= 0 (saatiin { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s on oltava suurempi kuin 0

engine-e-receiver-trust-live-invalid-session = virheellinen istunto: { $e }

engine-receiver-trust-live-no-score-could-be-produced = pisteytystä ei voitu tuottaa: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = yhtään GNSS-SDR:n synchro- tai pvt-tietuetta ei voitu lukea ({ $skipped } riviä ohitettu); rivimuoto on kuvattu tiedostossa integrations/gnss-sdr/README.md

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = IMU-tiedosto on tyhjä

engine-e-receiver-trust-machines-imu-imu-csv-no-column =
    { $n ->
        [one] IMU csv: saraketta `{ $n }` ei ole
       *[other] IMU csv: saraketta `{ $n }` ei ole
    }

engine-e-receiver-trust-machines-imu-imu-euroc-no-column =
    { $n ->
        [one] IMU euroc: saraketta `{ $n }` ei ole
       *[other] IMU euroc: saraketta `{ $n }` ei ole
    }

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = IMU-tiedostossa ei ole luettavaa näytettä

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = akselin on oltava 0, 1 tai 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean on oltava äärellinen

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] lokissa on { $n } näyte; Allan-sovitukseen tarvitaan vähintään { $MIN_SAMPLES }
       *[other] lokissa on { $n } näytettä; Allan-sovitukseen tarvitaan vähintään { $MIN_SAMPLES }
    }

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = lokin aika ei etene

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not =
    { $n ->
        [one] näyteväli ei ole tasainen ({ $uneven } / { $n } välistä poikkeaa yli 25 %): näytteistä loki ensin uudelleen
       *[other] näyteväli ei ole tasainen ({ $uneven } / { $n } välistä poikkeaa yli 25 %): näytteistä loki ensin uudelleen
    }

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = loki on liian lyhyt Allan-käyrän muodostamiseen

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = { $name }-käyrän alkuosan kulmakerroin on { $v }, ei noin -0.5: valkoinen kohina ei hallitse (onko anturi paikallaan?), joten sen kohinakerroin on epäluotettava

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = { $name }-käyrä on liian lyhyt kulmakertoimen tarkistamiseen

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = GPS-viikko { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = yhtään BESTPOS-, RANGE- tai RXSTATUS-lokia ei voitu lukea ({ $skipped } tietuetta ohitettu)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = kelvollista RTCM 3 -kehystä ei löytynyt ({ $skipped } ehdokasta epäonnistui CRC-tarkistuksessa)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } on oltava äärellinen ja > 0 (saatiin { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard on oltava välillä (0, 1) (saatiin { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac on oltava välillä [0, 1] (saatiin { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } on oltava välillä (0, 1) (saatiin { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats on oltava vähintään 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s on oltava vähintään 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = monitor config: tuntematon profiili ”{ $other }”; tunnetut: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = monitor config: { $name } on oltava äärellinen ja > 0 (saatiin { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = monitor config: jam_ind_threshold on oltava äärellinen

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = monitor config: mask_deg on oltava välillä [-90, 90) (saatiin { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = monitor config: raim_pfa on oltava välillä (0, 1) (saatiin { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = monitor config: cn0_min_sats on oltava vähintään 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = monitor config: sats_lost on oltava vähintään 1

engine-receiver-trust-monitors-the-receiver-own-set-against = vastaanottimen oma joukko ({ $self_report_source }) Kshana-monitoreja vasten; kumpikaan ei ole totuus, yhteneväisyys ei ole validointia

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = vastaanottimen aikajanalla on ei-äärellinen epookkiaika

engine-e-receiver-trust-monitors-the-log-is-shorter-than = loki on kalibrointi-ikkunaa lyhyempi: epookkeja ennen kohtaa { $cal_s } s on { $calibration_epochs } (loki kattaa { $span } s); perustason muodostamiseen tarvitaan vähintään 3

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } on oltava välillä ({ $lo }, { $hi }] (saatiin { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } koskee vain arvoa kind = "vessel" (kind on "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = tiedostoa { $path } ei voi lukea: WebAssembly-versiossa ei ole tiedostojärjestelmää; anna tiedosto upotettuna kenttänä `text` tai `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` ei ole kelvollista standardi-base64:ää

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: anna yksi kentistä `path`, `text` tai `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: anna vain yksi kentistä `path`, `text` tai `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } on oltava positiivinen luku, saatiin { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = tapahtuma { $label }: onset_s on oltava ei-negatiivinen luku

engine-e-receiver-trust-scenario-event-end-must-be-after = tapahtuma { $label }: end_s on oltava onset_s:n jälkeen

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg ja time_offset_s on oltava äärellisiä

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = luotettu koko ajan: yksikään monitori ei hälyttänyt kalibroinnin jälkeisinä epookkeina ({ $after_cal })

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = ensimmäinen hälytys ajassa { $t } s; kalibroinnin jälkeisiä epookkeja { $after_cal }, joista epäluotettuja { $untrusted_epochs } ja heikentyneitä { $degraded_epochs }

engine-receiver-trust-scenario-of-stated-events-detected-within = ; ilmoitetuista tapahtumista havaittiin { $events_detected } / { $events_evaluable } { $detect_tol_s } s sisällä

engine-receiver-trust-scenario-of-n0-predictions-within-db = ; C/N0-ennusteista { $predictions_agreeing } / { $predictions_evaluable } { $cn0_tol_db } dB:n sisällä

engine-receiver-trust-scenario-trust-score-lowest-final = ; luottamuspistemäärä: alin { $min }, lopullinen { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = skenaario { $r } | receiver-trust | loki { $format_name }, epookkeja { $epochs }, kesto { $duration_s } s | monitorit { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = tämä on { $k }-skenaario, ei receiver-trust-skenaario

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } on oltava äärellinen (saatiin { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: tarvitaan 0 < degraded_min < nominal_min <= 100 (saatiin { $degraded_min } ja { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s on oltava äärellinen ja >= 0 (saatiin { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: tarvitaan 0 <= onset_ratio < full_ratio (saatiin { $onset_ratio } ja { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: kohteen { $m } paino on oltava välillä [0, 100] (saatiin { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s on oltava äärellinen ja positiivinen

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg on oltava välillä (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 on oltava äärellinen ja positiivinen

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m ja rho0_kg_m3 on oltava äärellisiä ja positiivisia

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m on oltava välillä [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = paluu ilmakehään (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> huippu { $v3 } g korkeudessa { $v4 } km, { $velocity_at_peak_deceleration } m/s; lämpeneminen huipussaan nopeudella { $velocity_at_peak_heating } m/s; pistemassa (painovoima, kaarevuus, US76) huippu { $peak_deceleration_g } g (MODELLED ballistinen, ei aerotermistä)

## src/registry.rs

engine-e-registry-unknown-scenario-id = tuntematon skenaarion tunniste: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = TRL-alue ({ $lo },{ $hi }) ei ole hyvin muodostettu (vaaditaan 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = Modelled (vain simulointi) -väite ei voi olla edustava TRL-tason { $MODELLED_TRL_CEILING } yläpuolella (alueen yläraja hi={ $hi }); korkeampi TRL on aukko, ei simulaation tulos

engine-representativeness-representativeness-representative-for-trl = Edustavuus [{ $status }] — { $claim } (edustava TRL-tasoille { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = ilmoitettu({ $arch }) x lähteiden laadun keskiarvo

engine-resilience-score-weakest-rpcf-sub-score-bounded = heikoin RPCF-osapistemäärä = { $min_sub }; rajattu heikkeneminen = { $bounded } (rajoittuu tasoon 2, jos ei rajattu)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = tukematon navigointitietueen otsikko { $head }: '>'-merkillä alkava rivi on RINEX 4 -tietueen otsikko, ei RINEX 3 -navigointitietue

engine-e-rinex-bad-prn-in = virheellinen PRN kohteessa { $head }

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4 -navigointi: odotettiin '>'-tietueotsikkoa, löytyi { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4 -tietue { $head }: rivejä { $body }, { $msg }-efemeridi tarvitsee 8

engine-e-rinex-rinex-record-is-followed-by = RINEX 4 -tietueen { $head } perässä on { $body }, ei { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = virheellinen { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = RINEX-havaintotiedostossa ei ole END OF HEADER -riviä

engine-e-rinex-obs-rinex-observation-file-contained-no = RINEX-havaintotiedosto ei sisältänyt epookkitietueita

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s on oltava äärellinen ja > 0 (saatiin { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s on oltava äärellinen ja > 0 (saatiin { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) ei saa ylittää arvoa time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps =
    { $n ->
        [one] aikaruudukko on liian suuri: { $n } askel ylittää rajan MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); käytä karkeampaa askelta tai lyhyempää kestoa
       *[other] aikaruudukko on liian suuri: { $n } askelta ylittää rajan MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); käytä karkeampaa askelta tai lyhyempää kestoa
    }

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = näytteenottotaajuus on yhteismitallinen koodinopeuden kanssa ({ $samples_per_chip } näytettä/chip, { $offset_from_integer_samples } näytettä kokonaisluvusta): nollannen asteen pidolla muodostettu koodireplika ei erota koodivaiheen muutosta alle { $dead_band_chips } chipin, joten Early/Late-diskriminaattori on portaikko, jossa on yhden näytteen kuollut kaista, eikä kolmio, ja DLL asettuu väärään viiveeseen. Siirrä näytteenottotaajuus pois kokonaislukukerrannaisesta (5 MHz on 4.8876 näytettä/chip; 25 MHz on 24.4379) tai ylinäytteistä niin paljon, että kuollut kaista on alle tarvitsemasi koodivaiheen tarkkuuden.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = SGP4-virhekoodi { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = tukematon SigMF core:datatype { $other }: tämä lukija käsittelee kompleksityypit cf32_le, ci16_le ja ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: vain yksikanavaiset tallenteet luetaan

engine-e-sigmf-cannot-serialise-sigmf-metadata = SigMF-metadataa ei voi serialisoida: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = virheellinen SigMF-laajennuksen nimiavaruus { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = annotaatiolaajennuskarttoja: { $annotations }; annotaatioita: { $annotations2 }

engine-e-sigmf-extension-key-is-not-in = laajennusavain { $k } ei kuulu nimiavaruuteen { $ns }

engine-e-sigmf-extension-key-is-already-present = laajennusavain { $k } on jo olemassa

engine-e-sigmf-global-is-not-an-object = global ei ole objekti

engine-e-sigmf-annotations-is-not-an-array = annotations ei ole taulukko

engine-e-sigmf-annotation-is-not-an-object = annotation ei ole objekti

engine-e-sigmf-invalid-sigmf-metadata-json = virheellinen SigMF-metadatan JSON: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = SigMF-tallenne ei ilmoita positiivista core:sample_rate -arvoa

engine-e-sigmf-sigmf-capture-starts-at-sample = SigMF-tallenteen alku on näytteessä { $start }, datassa olevien { $data } näytteen jälkeen

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } on oltava välillä [0, 90) astetta, saatiin { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } on oltava äärellinen luku, saatiin { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: kanjoni tarvitsee arvon width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m on oltava positiivinen, saatiin { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: kanjonin korkeuksien ja antenna_m:n on oltava ei-negatiivisia

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m on oltava positiivinen, saatiin { $l }

engine-e-skyline-skyline-table-is-empty = skyline: taulukko on tyhjä

engine-e-skyline-skyline-table-has-rows-over = skyline: taulukon rivejä { $rows }, yli { $MAX_TABLE_ROWS } rivin rajan

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: taulukon atsimuutti { $az } on alueen [0, 360) ulkopuolella

engine-e-skyline-skyline-table-azimuths-must-be = skyline: taulukon atsimuuttien on kasvettava aidosti ({ $az } seuraa arvoa { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: sektoreita enemmän kuin { $MAX_SECTORS }

engine-e-skyline-skyline-the-sector-az-from = skyline: sektori az_from = { $az_from } – az_to = { $az_to } on tyhjä (täysi ympyrä on taulukko tai maski)

engine-e-skyline-skyline-more-than-terrain-points = skyline: maastopisteitä enemmän kuin { $MAX_TABLE_ROWS }

engine-e-skyline-skyline-terrain-distance-must-be = skyline: maaston distance_m on oltava positiivinen, saatiin { $distance_m }

engine-skyline-with-fields-overridden-or-added = { $provenance }; kenttien ohitukset tai lisäykset: { $user }

engine-skyline-stated-input = Annettu syöte: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = tuntematon skyline-esiasetus ”{ $name }”; tunnetut esiasetukset: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = datalehti tarvitsee vähintään kaksi Allanin poikkeaman pistettä

engine-e-slot-timing-datasheet-point-must-have-positive = datalehden piste ({ $t }, { $s }) tarvitsee positiivisen keskiarvoistusajan ja positiivisen Allanin poikkeaman

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s on oltava positiivinen sekuntiluku

engine-e-slot-timing-phase-record-needs-at-least = vaiheaineisto tarvitsee vähintään 32 näytettä kohinamallin sovittamiseen; saatiin { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = vaiheaineisto sisältää ei-äärellisen näytteen

engine-e-slot-timing-the-phase-record-yields-fewer = vaiheaineistosta saadaan alle kolme Allanin poikkeaman pistettä

engine-e-slot-timing-must-be-finite-and-non = { $name } on oltava äärellinen ja ei-negatiivinen; saatiin { $v }

engine-e-slot-timing-the-slot-guard-must-be = aikavälin suojavälin on oltava positiivinen aika

engine-e-slot-timing-sigma-must-be-positive = k_sigma on oltava positiivinen

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset on oltava äärellinen

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k on oltava äärellinen

engine-e-slot-timing-give-exactly-one-of-oscillator = anna täsmälleen yksi seuraavista: oscillator.class, oscillator.preset, oscillator.datasheet tai oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = tuntematon oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = tuntematon oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = { $c }-luokan oletus: sigma_y(1 s) arvosta { $c2 }; punaisen kohinan lattia syntetisoitu kaksi ja neljä dekadia sen alapuolelle (oletus, ei mittaus)

engine-slot-timing-fitted-to-the-allan-deviation = sovitettu asiakirjan { $document } Allanin poikkeaman maksimeihin, skaalattuna olemaan jokaisen pisteen tasolla tai yläpuolella

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] sovitettu { $n_samples } näytteen aineiston päällekkäiseen Allanin poikkeamaan, näyteväli { $tau0_s } s, IEEE Std 1139 -taajuusmodulaatiopohjalla
       *[other] sovitettu { $n_samples } näytteen aineiston päällekkäiseen Allanin poikkeamaan, näyteväli { $tau0_s } s, IEEE Std 1139 -taajuusmodulaatiopohjalla
    }

engine-slot-timing-slot-timing-source-guard-ns =
    { $n ->
        [one] slot-timing ({ $n } lähde): suojaväli { $c } ns arvolla k={ $k_sigma } ylittyy { $fmt_s } korjauksen jälkeen ({ $fmt_s2 } jäljellä); korjaus vähintään { $fmt_s3 } välein ({ $fixes_per_day } päivässä); hallitseva termi: { $b }{ $v9 }
       *[other] slot-timing ({ $n } lähdettä): suojaväli { $c } ns arvolla k={ $k_sigma } ylittyy { $fmt_s } korjauksen jälkeen ({ $fmt_s2 } jäljellä); korjaus vähintään { $fmt_s3 } välein ({ $fixes_per_day } päivässä); hallitseva termi: { $b }{ $v9 }
    }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = ajanhetken '{ $s }' on oltava muodossa YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = ajanhetki '{ $s }': virheellinen { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb on oltava äärellinen

engine-e-solar-system-table-must-be-auto-table1 = table on oltava auto, table1 tai table2; saatiin '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = ei efemeridiä linkille { $name } – { $name2 } hetkellä JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = ajanhetki JD { $jd } TDB on alueen 3000 eaa.–3000 jaa. ulkopuolella (Standishin taulukoiden kattama alue)

engine-e-solar-system-track-points-must-be-to =
    { $n_track ->
        [one] track_points on oltava 8–2000; saatiin { $n_track }
       *[other] track_points on oltava 8–2000; saatiin { $n_track }
    }

engine-e-solar-system-unknown-observer-body = tuntematon tarkkailijakappale '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies on nimettävä vähintään yksi kappale

engine-e-solar-system-unknown-body =
    { $n ->
        [one] tuntematon kappale '{ $n }'
       *[other] tuntematon kappale '{ $n }'
    }

engine-e-solar-system-no-position-for-at-jd = ei sijaintia kappaleelle { $name } hetkellä JD { $jd } TDB (Pluto vain 1800–2050 jaa.)

engine-e-solar-system-no-standish-elements-for = ei Standish-elementtejä kappaleelle { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliosentrinen tila ohjelmiston oman lukijan lukemana

engine-e-solar-system-unknown-link-body = tuntematon linkin kappale '{ $from }'

engine-e-solar-system-unknown-link-body-2 = tuntematon linkin kappale '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = linkki tarvitsee kaksi eri kappaletta; saatiin { $name }

engine-solar-system-solar-system-at-jd-tdb =
    { $n_bodies ->
        [one] Aurinkokunta hetkellä { $input } (JD { $jd_tdb } TDB), { $n_bodies } kappale, tarkkailija { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
       *[other] Aurinkokunta hetkellä { $input } (JD { $jd_tdb } TDB), { $n_bodies } kappaletta, tarkkailija { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
    }

engine-solar-system-light-time = valoaika { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  pit. { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }linkki { $from } -> { $to }: yhteen suuntaan { $one_way_light_time_s } s, edestakaisin { $two_way_light_time_s } s, Shapiro { $l } us, Aurinko { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = ajanhetki { $input } · { $standish_table } · sijainnit Standishin elementeistä

## src/sp3.rs

engine-e-sp3-epoch-needs-time-fields-got = epookki tarvitsee 6 aikakenttää, saatiin { $tokens }

engine-e-sp3-bad-second = virheellinen sekunti: { $tokens }

engine-e-sp3-record-needs-values-missing-column = tietue tarvitsee 4 arvoa, sarake { $v1 } puuttuu

engine-e-sp3-bad-number = virheellinen luku: { $field }

engine-e-sp3-empty-sp3-input = tyhjä SP3-syöte

engine-e-sp3-first-line-is-not-an = ensimmäinen rivi ei ole SP3-otsikko: { $first }

engine-e-sp3-unsupported-sp3-version-in = tukematon SP3-versio kohteessa { $first }

engine-e-sp3-missing-epoch-count-on-header = otsikkorivillä 1 puuttuu epookkien lukumäärä

engine-e-sp3-record-has-no-satellite-id = tietueella ei ole satelliittitunnistetta: { $line }

engine-e-sp3-position-record-before-any-epoch = paikkatietue ennen yhtään epookkiotsikkoa

engine-e-sp3-sp3-file-contained-no-epoch = SP3-tiedosto ei sisältänyt epookkitietueita

engine-e-sp3-bad-accuracy-exponent-in = virheellinen tarkkuuseksponentti { $f } kohteessa { $line }

engine-e-sp3-bad-header-accuracy = virheellinen otsikon tarkkuus { $t }

engine-e-sp3-short-line = lyhyt %f-rivi { $line }

engine-e-sp3-bad-base-in = virheellinen %f-kanta kohteessa { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = versio ylittää 3 bittiä

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID ylittää 11 bittiä (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count ylittää 14 bittiä (0..=16383)

engine-e-space-packet-data-field-must-be-at = datakentän on sisällettävä vähintään yksi oktetti

engine-e-space-packet-data-field-exceeds-65536-octets = datakenttä ylittää 65536 oktettia

engine-e-space-packet-packet-shorter-than-the-octet = paketti on lyhyempi kuin 6 oktetin otsikko: { $bytes } tavua

engine-e-space-packet-declared-data-length-header-octets = ilmoitettu datan pituus { $data_len } (+6 otsikko) = oktetteja { $total }, mutta puskuri on { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC coarse -oktetit { $coarse_octets } alueen 1..=4 ulkopuolella

engine-e-space-packet-cuc-fine-octets-outside-the = CUC fine -oktetit { $fine_octets } alueen 0..=3 ulkopuolella (laajennettua P-kenttää ei tueta)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-kenttä { $p }: laajennettua P-kenttää ei tueta

engine-e-space-packet-field-time-code-id-is = P-kenttä { $p }: aikakoodin tunniste { $id } ei ole CUC

engine-e-space-packet-field-is-not-cds-field = P-kenttä { $p } ei ole CDS P-kenttä

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-kenttä { $p }: varattu ali-ms-koodi 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC coarse { $coarse } ei mahdu { $c } oktettiin

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] CUC fine { $fine } ei mahdu { $n } oktettiin
       *[other] CUC fine { $fine } ei mahdu { $n } oktettiin
    }

engine-e-space-packet-cds-days-do-not-fit = CDS-päivät { $days } eivät mahdu { $f } oktettiin

engine-e-space-packet-cds-ms-of-day-above = CDS päivän millisekunnit { $ms_of_day } yli 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS alamillisekunti { $submillis } yli { $max_sub }

engine-e-space-packet-time-code-format-and-value = aikakoodin muoto ja arvo ovat eri koodeja

engine-e-space-packet-time-code-no-field-octet = aikakoodi: ei P-kenttäoktettia

engine-e-space-packet-time-code-needs-octets-present = aikakoodi tarvitsee oktetteja { $end }, läsnä { $bytes }

engine-e-space-packet-time-code-format-differs-from = aikakoodin muoto eroaa implisiittisestä P-kentästä

engine-e-space-packet-the-format-has-time-code = muodossa on aikakoodikenttä; sitä ei annettu

engine-e-space-packet-the-format-has-no-time = muodossa ei ole aikakoodikenttää

engine-e-space-packet-ancillary-data-is-octets-the = lisädatan oktetteja { $ancillary }; muoto ilmoittaa { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = toissijaisen otsikon on sisällettävä vähintään yksi oktetti

engine-e-space-packet-secondary-header-needs-octets-present = toissijainen otsikko tarvitsee oktetteja { $end }, läsnä { $bytes }

engine-e-space-packet-the-format-has-secondary-header = muodossa on toissijainen otsikko; sitä ei annettu

engine-e-space-packet-the-format-has-no-secondary = muodossa ei ole toissijaista otsikkoa

engine-e-space-packet-secondary-header-flag-disagrees-with = toissijaisen otsikon lippu { $v1 } on ristiriidassa muodon kanssa

engine-e-space-packet-data-field-shorter-than-the = datakenttä on lyhyempi kuin PEC

## src/space_packet.rs

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } ei vastaa paketin CRC-arvoa { $crc16_ccitt_false }

engine-e-space-packet-nothing-to-segment-empty-user = ei segmentoitavaa: käyttäjädata on tyhjä

engine-e-space-packet-max-user-octets-must-be = max_user_octets on oltava vähintään 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count ylittää 14 bittiä (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid }, odotettiin { $a }

engine-space-packet-sequence-count-repeated =
    { $sequence_count ->
        [one] sekvenssilaskuri { $sequence_count } toistuu
       *[other] sekvenssilaskuri { $sequence_count } toistuu
    }

engine-space-packet-sequence-count-gap-after-packet =
    { $sequence_count ->
        [one] sekvenssilaskurin aukko: { $sequence_count } arvon { $last } jälkeen (puuttuvia paketteja: { $v2 })
       *[other] sekvenssilaskurin aukko: { $sequence_count } arvon { $last } jälkeen (puuttuvia paketteja: { $v2 })
    }

engine-space-packet-sequence-count-out-of-order =
    { $sequence_count ->
        [one] sekvenssilaskuri väärässä järjestyksessä: { $sequence_count } arvon { $last } jälkeen
       *[other] sekvenssilaskuri väärässä järjestyksessä: { $sequence_count } arvon { $last } jälkeen
    }

engine-space-packet-packet-with-no-unit-open = { $f }-paketti ilman avointa yksikköä

engine-space-packet-packet-while-unit-is-open = { $f }-paketti, kun yksikkö on auki

engine-e-space-packet-packet = paketti { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = sekvenssi päättyy yksikköön, joka on yhä auki (ei viimeistä pakettia)

engine-e-space-packet-apid-must-be-in-2047 = apid on oltava välillä 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count on oltava >= 1

engine-e-space-packet-data-len-must-be-in = data_len on oltava välillä 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = sisäinen virhe: koodauksen ja purun edestakainen kierros ei täsmää

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: kehystetty { $packet_count } CCSDS-133.0-paketti ({ $v2 }), APID { $apid }, yhteensä oktetteja { $total_bytes }, edestakainen kierros tarkka ({ $round_trip_ok })
       *[other] space-packet: kehystetty { $packet_count } CCSDS-133.0-pakettia ({ $v2 }), APID { $apid }, yhteensä oktetteja { $total_bytes }, edestakainen kierros tarkka ({ $round_trip_ok })
    }

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 on oltava äärellinen ja positiivinen

engine-e-space-weather-f107a-must-be-finite-and = f107a on oltava äärellinen ja positiivinen

engine-e-space-weather-kp-must-be-in = kp on oltava välillä [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km ei saa olla tyhjä

engine-e-space-weather-altitude-km-must-be-finite = korkeuden { $h } km on oltava äärellinen ja positiivinen

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; tiheys x{ $density_activity_factor } korkeudessa { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: { $what }-häirintälähetin tarvitsee positiivisen bandwidth_mhz-arvon

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: chirp-häirintälähetin tarvitsee positiivisen sweep_period_us-arvon

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to nimeää tuntemattoman kaistan { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: anna joko received_power_dbw tai eirp_dbw ja positiivinen range_m (ei molempia)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s on oltava myöhemmin kuin on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: näytteenottotaajuuden on oltava positiivinen

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } on oltava kahden potenssi, vähintään 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: näytteitä { $x }, vähemmän kuin yksi { $nfft } pisteen segmentti

engine-e-spectrum-iq-must-be-power-of =
    { $n ->
        [one] iq: n = { $n } on oltava kahden potenssi, vähintään 16
       *[other] iq: n = { $n } on oltava kahden potenssi, vähintään 16
    }

engine-e-spectrum-cannot-read-recording-meta-path = tallenteen meta_path-tiedostoa { $meta_path } ei voi lukea: { $e }

engine-e-spectrum-cannot-read-recording-data = tallenteen dataa { $data_path } ei voi lukea: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz on oltava positiivinen

engine-e-spectrum-modulation-is-not-selectable-only =
    { $n ->
        [one] { $n }: modulaatio { $m } ei ole valittavissa (vain galileo-e1 hyväksyy "mboc" tai "boc11")
       *[other] { $n }: modulaatio { $m } ei ole valittavissa (vain galileo-e1 hyväksyy "mboc" tai "boc11")
    }

engine-e-spectrum-signal-is-not-in-the = { $name }: signaali { $sig } ei ole signaaliesiasetuskirjastossa ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: esiasetussignaali sisältää oman modulaationsa; poista `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: signaali { $sig } ei julkaise vastaanotettua tehoa; anna signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: mukautettu kaista tarvitsee kentän `modulation`, esim. "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: mukautettu kaista tarvitsee kentän signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: anna joko `signal` tai `centre_mhz`, ei molempia

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: anna rx_bandwidth_mhz (pääkeilaa ei voitu paikantaa)

engine-e-spectrum-duration-must-be-at-least = duration_s on oltava vähintään yksi step_s

engine-e-spectrum-time-rows-is-more-than = aikarivejä { $rows }, enemmän kuin sallitut 5000

engine-e-spectrum-at-most-extra-panels = enintään 8 lisäpaneelia

engine-e-spectrum-panel-need-max-mhz-min = paneeli { $name }: tarvitaan f_max_mhz > f_min_mhz ja 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = ruudukko: tarvitaan f_max_mhz > f_min_mhz ja 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = skenaarion spektri | kaistoja { $bands } | häirintälähettimiä { $jammers } | kohinataso { $n0_db } dBW/Hz | heikoin kaista { $name }, pienin C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = skenaarion spektri | ei kaistoja | kohinataso { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples on oltava välillä 10–20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: käytä arvoa cf32_le tai ci16_le

engine-spectrum-frequency-across-time-down-colour = taajuus vaakasuunnassa, aika alaspäin, väri = tehospektritiheys (dBW/Hz); kohinataso { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = jokaisella paneelilla oma taajuusalue, yksi aikajana alaspäin, yksi väriasteikko (dBW/Hz); kohinataso { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = kehyksellä { $other } ei ole tuettua NAIF-koodia

engine-e-spk-writer-segment-name-longer-than-40 = segmentin nimi on pidempi kuin 40 merkkiä: { $name }

engine-e-spk-writer-segment-name-has-non-printing = segmentin nimessä on ei-tulostettavia merkkejä: { $name }

engine-e-spk-writer-bad-target-for-centre = virheellinen kohde { $target } keskukselle { $centre }

engine-e-spk-writer-degree-outside-27 = aste { $degree } alueen 1..=27 ulkopuolella

engine-e-spk-writer-type-13-degree-is-not = tyypin 13 aste { $degree } ei ole pariton

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] { $states } tilaa { $n } epookille
       *[other] { $states } tilaa { $n } epookille
    }

engine-e-spk-writer-descriptor-start-is-not-before = deskriptorin alku ei ole ennen sen loppua

engine-e-spk-writer-epochs-are-not-strictly-increasing = epookit eivät kasva aidosti

engine-e-spk-writer-the-epochs-do-not-cover = epookit eivät kata deskriptorin väliä

engine-e-spk-writer-type-or-13-segment-carries = tyypin 9 tai 13 segmentti sisältää tiloja, ei tietueita

engine-e-spk-writer-type-segment-needs-at-least = tyypin 3 segmentti tarvitsee vähintään yhden tietueen

engine-e-spk-writer-type-degree-outside-27 = tyypin 3 aste { $degree } alueen 0..=27 ulkopuolella

engine-e-spk-writer-type-interval-length-is-not = tyypin 3 aikavälin pituus { $intlen } ei ole positiivinen

engine-e-spk-writer-type-record-has-coefficients-expected = tyypin 3 tietue { $i }: kertoimia { $value }, odotettiin { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = deskriptorin alku on sen lopun jälkeen

engine-e-spk-writer-descriptor-starts-before-the-first = deskriptori alkaa ennen ensimmäistä tietuetta

engine-e-spk-writer-descriptor-ends-after-the-last = deskriptori päättyy viimeisen tietueen jälkeen

engine-e-spk-writer-type-segment-carries-records-not = tyypin 3 segmentti sisältää tietueita, ei epookkeja tai tiloja

engine-e-spk-writer-type-21-segment-needs-at = tyypin 21 segmentti tarvitsee vähintään yhden differenssirivin

engine-e-spk-writer-difference-line-size-is-not = differenssirivin koko { $dlsize } ei ole 4 MAXDIM + 11, kun MAXDIM on 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = differenssirivit ovat eri kokoisia

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] { $epochs } epookkia { $n } differenssiriville
       *[other] { $epochs } epookkia { $n } differenssiriville
    }

engine-e-spk-writer-difference-line-epochs-are-not = differenssirivien epookit eivät kasva aidosti

engine-e-spk-writer-the-last-difference-line-ends = viimeinen differenssirivi päättyy ennen deskriptoria

engine-e-spk-writer-zero-step-size-in-difference = askelkoko nolla kohdassa { $j } differenssirivillä { $i }

engine-e-spk-writer-type-21-segment-carries-difference = tyypin 21 segmentti sisältää differenssirivejä, ei tiloja

engine-e-spk-writer-an-spk-needs-at-least = SPK tarvitsee vähintään yhden segmentin

engine-e-spk-writer-segment = segmentti { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = kommenttirivillä on ei-tulostettavia merkkejä: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = kommentit tarvitsevat { $nchars } merkkiä; varattuja { $v1 } (kasvata arvoa ncomch)

engine-e-spk-writer-difference-line-orders-out-of = differenssirivin kertaluvut { $kqmax1 } { $kq } alueen ulkopuolella

engine-e-spk-writer-zero-step-size-at-index = askelkoko nolla indeksissä { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } segmentin [{ $start }, { $end }] ulkopuolella

engine-e-spk-writer-type-segment-too-short = tyypin 3 segmentti { $name } on liian lyhyt

engine-e-spk-writer-type-segment-words-for-rsize =
    { $n ->
        [one] tyypin 3 segmentti { $name }: { $nw } sanaa arvoille N = { $n }, RSIZE = { $rsize }
       *[other] tyypin 3 segmentti { $name }: { $nw } sanaa arvoille N = { $n }, RSIZE = { $rsize }
    }

engine-e-spk-writer-type-21-segment-too-short = tyypin 21 segmentti { $name } on liian lyhyt

engine-e-spk-writer-type-21-segment-words-for =
    { $n ->
        [one] tyypin 21 segmentti { $name }: { $nw } sanaa arvoille N = { $n }, MAXDIM = { $maxdim }
       *[other] tyypin 21 segmentti { $name }: { $nw } sanaa arvoille N = { $n }, MAXDIM = { $maxdim }
    }

engine-e-spk-writer-segment-too-short = segmentti { $name } on liian lyhyt

engine-e-spk-writer-segment-words-for =
    { $n ->
        [one] segmentti { $name }: { $nw } sanaa arvolle N = { $n }
       *[other] segmentti { $name }: { $nw } sanaa arvolle N = { $n }
    }

engine-e-spk-writer-segment-is-in-frame = segmentti { $name } on kehyksessä { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = SPK-keskusketju ei pääty

engine-e-spk-writer-no-spk-chain-connects-and = mikään SPK-ketju ei yhdistä kohteita { $target } ja { $observer } hetkellä ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = ajanhetki { $s } ei ole muotoa YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = aikajärjestelmää { $other } ei tueta (UTC tai TDB)

engine-e-spk-writer-centre-has-no-supported-naif = keskuksella { $other } ei ole tuettua NAIF-tunnistetta

engine-e-spk-writer-oem-segment-has-no-data = OEM-segmentillä { $name } ei ole datarivejä

engine-e-spk-writer-oem-segment-no = OEM-segmentti { $idx }: ei kenttää { $k }

engine-e-spk-writer-no-export-settings-for-oem = ei vientiasetuksia OEM-segmentille { $idx }

engine-e-spk-writer-oem-data-line-has-fields = OEM-datarivin kenttiä { $f }: { $line }

engine-e-spk-writer-oem-value = OEM-arvo { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = OEM-segmenttejä { $out }, vientiasetuksia { $exports }

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (yhdistetty) — kerrokset: { $fired }

engine-spoof-detect-single-layer-indication-below-the = yhden kerroksen ilmaisu ({ $fired }) yhdistetyn kynnyksen alapuolella — tarvitaan vahvistus

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg on oltava positiivinen, saatiin { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = paneeli { $i }: pinta-alan on oltava >= 0

engine-e-srp-boxwing-panel-outside = paneeli { $i }: { $name } = { $c } alueen [0, 1] ulkopuolella

engine-e-srp-boxwing-panel-absorption-specular-diffuse = paneeli { $i }: absorption + specular + diffuse = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = paneeli { $i }: nolla normaali/akseli

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = ECOM2-normaalimatriisi on singulaarinen tai huonosti ehdollistettu

## src/ssv/check.rs

engine-e-ssv-check-heo-preset = heo-esiasetus

engine-e-ssv-check-lunar-preset = lunar-esiasetus

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = muodostelma tarvitsee vähintään yhden apusatelliitin

engine-e-ssv-formation-duration-min-and-step-must = duration_min ja step_s on oltava positiivisia

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = valituille tähdistöille ja kaistoille ei ole signaaleja

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = tuntematon antenni `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = kuvio-CSV on tyhjä

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` ei ole luku kuvio-CSV:ssä

engine-e-ssv-scenario-pattern-csv-row-has-columns = kuvio-CSV:n rivi `{ $l }`: sarakkeita { $f }, odotettiin { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" vaatii täsmälleen yhden kentistä pattern_csv ja pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` ei ole booklet, parametric tai table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: anna cn0_min_dbhz tai weak_signal, ei molempia

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = kantoaaltosilmukka ei pysty pitämään ilmoitettua Doppler-nopeutta millään C/N0-arvolla

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` ei ole acquisition, tracking tai both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz on oltava äärellinen

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: anna täsmälleen yksi kentistä preset ja orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` ei ole leo, meo, geo, heo tai lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: anna täsmälleen yksi kentistä duration_min ja duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } on oltava positiivinen

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg tarvitsee 1–8 äärellistä poikkeamaa

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd ei saa olla negatiivinen

engine-e-ssv-scenario-give-exactly-one-of-shell = anna täsmälleen yksi kentistä [shell], [trajectory] ja [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] tarvitsee [navigation]-taulun johtosatelliittia varten

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include ja constellations.bands eivät saa olla tyhjiä

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km on oltava yli 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels yli 5 ei ole tuettu

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna on oltava hemisphere tai omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = shell-pyyhkäisy tukee vain booklet-lähetinkuviota (muotoiltu kuvio tarvitsee trajectory-pyyhkäisyn)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] koskee [trajectory]-osiota, ei [shell]-osiota

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: anna täsmälleen yksi kentistä preset ja orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` ei ole leo, meo, geo, heo tai lunar-transfer

engine-e-ssv-scenario-unknown-preset = tuntematon esiasetus

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv-kuori { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv-navigointi: paikan RMS { $p } kokonaisuudessaan, { $p2 } GNSS-kiertoratojen sisäpuolella, { $p3 } yläpuolella; pisin aukko { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = apusatelliitti kulmassa { $offset_deg } deg ({ $baseline_km } km): suhteellinen RMS { $rel_rms_filter_m } m suodatettuna vs { $rel_rms_from_absolute_m } m absoluuttisista paikannuksista

engine-ssv-scenario-combined-max-outage-min = { $band } yhdistetty 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (pisin katko { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv-lentorata { $perigee_alt_km } – { $apogee_alt_km } km korkeudessa: { $parts }

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min ja step_min on oltava positiivisia

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number =
    { $n ->
        [one] receiver.{ $n } on oltava positiivinen luku, saatiin { $v }
       *[other] receiver.{ $n } on oltava positiivinen luku, saatiin { $v }
    }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = standardipakettia `{ $id }` ei ole; paketit ovat: { $ids }

engine-e-standards-pack-pack-manifest = pakettimanifesti: { $e }

engine-e-standards-pack-test-duplicate-id = testi { $id }: kaksoistunniste

engine-e-standards-pack-test-scenario-is-not-in = testi { $id }: skenaario `{ $s }` ei ole paketissa

engine-e-standards-pack-test-scored-test-needs-bar = testi { $id }: pisteytettävä testi tarvitsee kynnyksen

engine-e-standards-pack-test-test-that-needs-input = testi { $id }: testillä, joka tarvitsee syötteen, ei ole kynnyksiä

engine-e-standards-pack-test-give-either-scenario-or = testi { $id }: anna joko `scenario` tai `needs_input`, ei molempia eikä kumpaakaan

engine-e-standards-pack-test-supports-unknown-row = testi { $id }: tukee tuntematonta riviä `{ $r }`

engine-e-standards-pack-test-unknown-op = testi { $id }: tuntematon op `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = testi { $id }: kynnys kohteessa { $pointer } tarvitsee täsmälleen yhden kentistä `value` ja `against`

engine-e-standards-pack-row-duplicate-id = rivi { $id }: kaksoistunniste

engine-e-standards-pack-row-asks-must-be-short = rivi { $id }: `asks` on oltava lyhyt parafraasi

engine-e-standards-pack-row-no-test-supports-it = rivi { $id }: mikään testi ei tue sitä

engine-standards-pack-not-scored-needs-input =
    { $n ->
        [one] ei pisteytetty: tarvitsee syötteen ({ $n })
       *[other] ei pisteytetty: tarvitsee syötteen ({ $n })
    }

## src/study.rs

engine-e-study-study-has-no-scenarios-to = tutkimuksessa ei ole ajettavia skenaarioita

engine-e-study-cannot-read-scenario = skenaariota { $path } ei voi lukea: { $e }

engine-e-study-scenario-failed = skenaario { $path } epäonnistui: { $e }

engine-e-study-scenario-produced-unparseable-json = skenaario { $path } tuotti jäsentymätöntä JSON-tulostetta: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = virheellinen suite-manifesti: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = tuntematon lähde `{ $o }`: käytä `adsb` tai `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } on { $len } tavua, yli { $limit } tavun rajan

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` ei ole ISO-8601 UTC -aika

engine-e-surface-invalid-receiver-trust-session = virheellinen receiver-trust-istunto: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` ei ole ISO-8601 UTC -aika

engine-e-surface-dataset-custom-needs-licence-licence = dataset `custom` tarvitsee kentät licence, licence_url ja attribution

engine-e-surface-at-least-one-map-is = vähintään yksi kartta vaaditaan

engine-e-surface-epoch = ajanhetki: { $e }

engine-e-surface-not-utf = { $suffix }: ei ole UTF-8-muotoista

engine-e-surface-unknown-scenario-kind-the-kind = tuntematon skenaarion laji `{ $k }`; lajiluettelo nimeää kaikki lajit

engine-surface-is-not-bundled-it = `{ $name }` ei sisälly ohjelmistoon: { $why }

engine-surface-no-bundled-scenario-named-the = ohjelmistoon sisältyvää skenaariota nimeltä `{ $name }` ei ole; esimerkkiluettelo nimeää sisältyvät ({ $v1 })

engine-e-surface-invalid-toml = virheellinen TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = tuntematon vientimuoto `{ $format }`; odotettiin yhtä seuraavista: czml, kml, geojson, stk tai sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps antaa kuvia { $opts }, ja enintään { $MAX_ANIMATION_FRAMES } palautetaan; pienennä fps- tai duration_s-arvoa tai kirjoita pidempi sekvenssi komentoriviltä

engine-e-surface-scenario-run-failed = skenaarion ajo epäonnistui: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log nimeää tiedoston `path`; anna loki kenttänä `text` tai `base64` (tämä rajapinta ei lue tiedostoja)

engine-e-surface-max-sp-errors-must-be = max_sp_errors saa olla enintään 20

engine-e-surface-frames-must-be-to = frames on oltava välillä 1–{ $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 on oltava välillä 0–99

engine-e-surface-runs-given-at-most-per = annettuja ajoja { $runs }; enintään { $MAX_COMPLIANCE_RUNS } raporttia kohti

engine-e-surface-the-runs-total-bytes-the = ajojen yhteiskoko on { $total } tavua; yhden raportin raja on { $max_bytes }

engine-e-surface-result-files-given-at-most = tulostiedostoja annettu { $results }, enintään 256

engine-e-surface-result-is-not-json = tulos { $v1 } ei ole JSON-muotoa: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = tuntematon muoto `{ $o }`: käytä `prometheus`, `cef`, `leef`, `otlp` tai `mqtt`

engine-e-surface-unknown-imu-format-use-csv = tuntematon IMU-muoto `{ $o }`: käytä `csv` tai `euroc`

engine-e-surface-unknown-axis-use-or = tuntematon akseli `{ $o }`: käytä `x`, `y` tai `z`

engine-e-surface-id-must-be-to-64 = id on oltava 1–64 tulostettavaa ASCII-merkkiä ilman välilyöntejä

engine-surface-fitted-from-stationary-imu-log = sovitettu paikallaan pysyvästä IMU-lokista, sha256 { $sha }, akseli { $axis }, Allan-estimaattori

engine-e-surface-unknown-input-kind-use-result = tuntematon input_kind `{ $o }`: käytä `result` tai `jsonl`

engine-e-surface-the-input-holds-no-trust = syötteessä ei ole yhtään luottamusepookkia

engine-e-surface-the-reply-is-over-the = vastaus ylittää { $max_bytes } tavun rajan; lähetä vähemmän epookkeja tai jätä `syslog_all` pois päältä

engine-e-surface-otlp-needs-build-with-the = otlp vaatii koontiversion, jossa on ominaisuus `otlp`

engine-e-surface-the-pack-and-token-total = paketin ja tokenin yhteiskoko on { $total } tavua; raja on { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = aikaleimatoken on tyhjä

engine-e-surface-must-be-64-lower-case = { $what } on oltava 64 pientä heksadesimaalinumeroa

engine-e-surface-must-be-32-bytes = { $what } on oltava 32 tavua

engine-surface-verified-against-the-public-key = VERIFIED antamaasi julkiseen avaimeen nähden (allekirjoittajan sormenjälki { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: tiivisteet ja allekirjoitus ovat yhdenmukaisia avaimen { $fp } kanssa, jonka paketti nimeää itse. Anna allekirjoittajan julkinen avain, joka on saatu allekirjoittajalta toista reittiä, jotta allekirjoittaja voidaan todentaa.

engine-e-surface-files-must-be-json-object = files on oltava JSON-objekti, jossa nimi vastaa sisältöä

engine-e-surface-pack-has-at-most-64 = paketissa on enintään 64 tiedostoa

engine-e-surface-file-name-must-be-plain = tiedostonimen `{ $k }` on oltava pelkkä nimi

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` ei ole kelvollista standardi-base64:ää

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = tuntematon pyyhkäisyparametri: { $other }

engine-e-sweep-unknown-sweep-metric = tuntematon pyyhkäisymittari: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep tarvitsee vähintään yhden akselin

engine-e-sweep-sweep-key-is-malformed = pyyhkäisyavain `{ $key }` on virheellisesti muodostettu

engine-e-sweep-sweep-key-follows-an-array = pyyhkäisyavain `{ $key }`: `{ $part }` seuraa taulukkoa, joten sen on oltava indeksi

engine-e-sweep-unreachable = saavuttamaton

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] pyyhkäisyavain `{ $key }`: indeksi { $i } on taulukon { $n } alkion ulkopuolella
       *[other] pyyhkäisyavain `{ $key }`: indeksi { $i } on taulukon { $n } alkion ulkopuolella
    }

engine-e-sweep-sweep-key-parent-is-not = pyyhkäisyavain `{ $key }`: kohteen `{ $part }` vanhempi ei ole TOML-taulu

engine-e-sweep-sweep-key-no-field = pyyhkäisyavain `{ $key }`: kenttää `{ $part }` ei ole

engine-e-sweep-sweep-key-parent-of-is = pyyhkäisyavain `{ $key }`: kohteen `{ $last }` vanhempi ei ole TOML-taulu

engine-e-sweep-sweep-key-no-field-2 = pyyhkäisyavain `{ $key }`: kenttää `{ $last }` ei ole

engine-e-sweep-metric-no-field-in-result = mittari `{ $path }`: kenttää `{ $part }` ei ole tuloksessa

engine-e-sweep-metric-value-is-not-number = mittari `{ $path }`: arvo ei ole luku

engine-e-sweep-sweep-node-serialize = pyyhkäisysolmun serialisointi: { $e }

engine-e-sweep-sweep-node-result-parse = pyyhkäisysolmun tuloksen jäsennys: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = pyyhkäisyakseli `{ $key }`: ilmoitettu yksikkö `{ $d }`, mutta pyyhkäisty paketti julkaisee `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = pyyhkäisyn työsäie kaatui

engine-e-sweep-generic-sweep-needs-at-least = yleinen pyyhkäisy tarvitsee vähintään yhden akselin

engine-e-sweep-generic-sweep-needs-at-least-2 = yleinen pyyhkäisy tarvitsee vähintään yhden mittarin

engine-e-sweep-generic-sweep-base-must-carry = yleisen pyyhkäisyn `base` on sisällettävä oma `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = yleinen pyyhkäisy ei voi pyyhkäistä toista pyyhkäisyä

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = tuntematon oskillaattori { $oscillator }; odotettiin yhtä seuraavista: { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day ja temperature_coeff_per_k on oltava äärellisiä

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s on oltava äärellinen ja positiivinen

engine-e-telecom-timing-duration-must-be-finite-and = duration_s on oltava äärellinen ja vähintään kahdentoista näytteen pituinen

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s on oltava välillä [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns on oltava äärellinen ja >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = lämpötila- ja taajuuspoikkeamasyötteiden on oltava äärellisiä (jakso > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = aineisto ylittäisi 5 000 000 näytettä; kasvata arvoa sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = aikavirhesarja tarvitsee vähintään 13 näytettä, saatiin { $pairs }

engine-e-telecom-timing-every-time-and-time-error = kaikkien time_s- ja time_error_ns-arvojen on oltava äärellisiä

engine-e-telecom-timing-time-must-increase = time_s on kasvettava

engine-e-telecom-timing-the-series-must-be-uniformly = sarjan on oltava tasaisesti näytteistetty: askel { $v1 } on { $d } s, ensimmäinen on { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV-rivi { $v1 } ei ole muotoa `time_s,time_error_ns`

## src/telecom_timing.rs

engine-telecom-timing-the-mask-is-defined-through = maski on määritelty 0.1 Hz alipäästösuodattimen kautta, jota tämä moottori soveltaa vain, kun näyteväli on enintään { $MAX_FILTER_DT_S } s; tämän aineiston näyteväli on { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = anna joko [holdover] tai [series], ei molempia

engine-e-telecom-timing-give-either-series-samples-or = anna joko series.samples tai series.csv_path, ei molempia

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days on oltava äärellinen ja >= 0

engine-telecom-timing-ns-budget-exceeded-after = ; { $max_abs_te_ns } ns budjetti ylittyi ajan { $t } s jälkeen

engine-telecom-timing-ns-budget-never-exceeded = ; { $max_abs_te_ns } ns budjetti ei koskaan ylity

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns aikavälillä { $v2 } s; { $masks }{ $first_budget } (MODELLED)

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = tuntematon --format `{ $f }` (cef tai leef)

engine-e-telemetry-cli-unknown-option = tuntematon valitsin `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input ja --result ovat vaihtoehtoja toisilleen

engine-e-telemetry-cli-listen-no-address = --listen { $l }: ei osoitetta

engine-telemetry-cli-warning-metrics-is-served-without = varoitus: /metrics tarjotaan ilman todennusta osoitteessa { $addr }; sido localhostiin tai aseta oman pääsynhallintasi taakse

engine-e-telemetry-cli-bind = sidonta { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = palvelee http://{ $bound }/metrics

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp ja --syslog-tcp ovat vaihtoehtoja toisilleen

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting koskee valitsinta --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: aiheen osan on oltava ei-tyhjä, ilman merkkejä #, + tai alussa olevaa /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp vaatii koontiversion, jossa on `--features otlp`

engine-telemetry-cli-warning-input-line = varoitus: syöterivi { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = tiedostoa { $p } ei voi avata: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] varoitus: { $n } MQTT-viesti ei toimitettu
       *[other] varoitus: { $n } MQTT-viestiä ei toimitettu
    }

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpointin on alettava merkkijonolla http://

engine-e-telemetry-otlp-endpoint-has-no-host = endpointissa ei ole isäntää

engine-e-telemetry-otlp-resolve = nimenselvitys { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = ei osoitetta kohteelle { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = varoitus: otlp-vienti epäonnistui: { $e }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = ei JSON-muotoa: { $e }

engine-e-telemetry-sample-not-json-object = ei ole JSON-objekti

engine-e-telemetry-sample-is-not-number = `{ $k }` ei ole luku

engine-e-telemetry-sample-is-not-finite = `{ $k }` ei ole äärellinen

engine-e-telemetry-sample-missing = puuttuu `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } alueen 0..=100 ulkopuolella

engine-e-telemetry-sample-missing-state = puuttuu `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` ei ole taulukko

engine-e-telemetry-sample-entry-has-no-name = `{ $key }`-alkiolla ei ole nimeä

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` puuttuu tai ei ole äärellinen luku

engine-e-telemetry-sample-position-is-not-an-object = `position` ei ole objekti eikä null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` puuttuu tai ei ole merkkijono

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` ei ole äärellinen luku >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` ei ole merkkijono

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` ei ole totuusarvo

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` ei ole objekti eikä null

engine-e-telemetry-sample-result-has-no-epochs = tuloksessa ei ole kenttää `epochs`

engine-e-telemetry-sample-bad-epochs = virheellinen `epochs`: { $e }

## src/telemetry/syslog.rs

engine-e-telemetry-syslog-host-is-bytes-syslog-host = host on { $host } tavua; syslog-isäntänimi on enintään 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = host on oltava tulostettavaa ASCII-merkistöä ilman välilyöntejä

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } vs { $w } (ei esitettävissä f64-lukuna)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: läsnä, odotettiin puuttuvaksi

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: puuttuu, odotettiin läsnä olevaksi

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite =
    { $n ->
        [one] { $name }: { $n } on oltava äärellinen
       *[other] { $name }: { $n } on oltava äärellinen
    }

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu on oltava äärellinen ja ei-negatiivinen

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: rivi { $v1 }: ei muotoa MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: ei AR-tietueita koodille { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = tuntematon sarjamuoto { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 =
    { $n ->
        [one] { $n } on oltava äärellinen
       *[other] { $n } on oltava äärellinen
    }

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s on annettava 16–20000 mittausta

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } poikkeama { $ns } ns (Sagnac { $ns2 } ns, ionosfääri { $ns3 } ns); yhdistetty u { $ns4 } ns (tyyppi A { $ns5 } ns ajalla { $averaging_s } s); todellinen sarja: { $series } (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = ei-ASCII-merkkejä TLE:ssä { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE katkesi luettaessa { $what } (sarakkeet { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } on liian lyhyt sarakkeen 69 tarkistussummalle

engine-e-tle-tle-has-no-checksum-digit = TLE { $label }:ssä ei ole tarkistussummanumeroa sarakkeessa 69

engine-e-tle-tle-checksum-mismatch-column-69 = TLE { $label }: tarkistussumma ei täsmää, sarake 69 ilmoittaa { $want }, laskettu { $got }

engine-e-tle-not-tle-line = ei ole TLE:n rivi 1: { $line1 }

engine-e-tle-not-tle-line-2 = ei ole TLE:n rivi 2: { $line2 }

engine-e-tle-invalid-in-tle = virheellinen { $what } TLE:ssä: { $s }

engine-e-tle-invalid-epoch-year-in-tle = virheellinen epookkivuosi TLE:ssä: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = virheellinen luettelonumero TLE:ssä: { $col }

engine-e-tle-inclination-out-of-range-180 = inklinaatio alueen [0, 180] deg ulkopuolella: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = eksentrisyys alueen [0, 1) ulkopuolella: { $eccentricity }

engine-e-tle-non-positive-mean-motion = ei-positiivinen keskiliike: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = virheellinen { $what }-mantissa TLE:ssä: { $mant }

engine-e-tle-invalid-exponent-in-tle = virheellinen { $what }-eksponentti TLE:ssä: { $exp }

engine-tle-satellite-line-only-element-set = satelliitti { $satnum }: vain rivin 2 elementtijoukko jäsennettiin analyyttisinä Kepler-elementteinä (kaksikappale) — rivin 1 vastus/B* ja SGP4:n sekulaaritermit puuttuvat, joten tämä rata ajautuu pois todellisesta SGP4-sovitteesta kauas epookista; anna vastaava rivi 1 SGP4-tarkkuutta varten

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: C/N0-profiili tarvitsee positiivisen epookin ja keston

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: C/N0-profiili tarvitsisi yli { $MAX_DETECTOR_STEPS } ilmaisinaskelta ({ $total } s, { $epoch_s } s epookkia kohti); lyhennä ramp_duration_s tai pidennä predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } on oltava äärellinen

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } on oltava positiivinen (saatiin { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips on oltava alle 1.9 chipin (saatiin { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio on oltava vähintään 1 (saatiin { $pullin_bandwidth_ratio }) — silmukka, joka vetäytyy uudelleen lukkoon KAPEAMMALLA kaistanleveydellä kuin millä se seuraa, kääntäisi hystereesin

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s ei saa olla negatiivinen

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) ei saa ylittää arvoa cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } ei saa olla tyhjä

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } sisältää alkioita { $axis }; yläraja on { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } sisältää ei-äärellisen arvon

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: vahvistusviipeiden on oltava vähintään 1 epookki

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = tarvitaan vähintään kahdeksan näytettä

engine-e-twstft-budget-samples-must-increase-in-time = näytteiden on kasvettava ajassa

engine-e-twstft-budget-samples-must-be-on-regular = näytteiden on oltava säännöllisellä ruudukolla

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } riviä: { $validated } ulkoisesti validoitu, { $modelled } mallinnettu, { $partner_owned } kumppanin omistama.{ "\u000A" }

engine-verification-the-complete-machine-checked-evidence = Täydellinen, koneellisesti tarkistettu kirjanpito (ledger): **{ $total } riviä — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Rivi voi olla VALIDATED vain riippumattoman ulkoisen oraakkelin (riippumaton vertailu) kanssa (matriisin invarianttitestit valvovat tätä). Samat tiedot, joissa on klikattava rivikohtainen linkki jokaiseen testiin, moduuliin ja versionhallintaan tallennettuun testiaineistoon, ovat *Validation ledger* -näkymänä osoitteessa https://kshana.dev. Katso [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md), miksi jokaista Modelled-riviä ei ole validoitu ulkoisesti.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }MODELLED-merkittyjä ominaisuuksia: { $modelled }.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json ei ole JSON-muotoa: { $e }

engine-wasm-runs-json-is-not-json = runs_json ei ole JSON-muotoa: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] tarvitsee kentän `label`

engine-wasm-runs-needs-result = runs[{ $i }] tarvitsee kentän `result`

engine-wasm-results-json-is-not-json = results_json ei ole merkkijonojen JSON-taulukko: { $e }

engine-wasm-maps-json-must-be-json = maps_json on oltava merkkijonojen JSON-taulukko: { $e }

engine-wasm-plans-json-is-not-json = plans_json ei ole merkkijonojen JSON-taulukko: { $e }

engine-wasm-options-json-is-not-json = options_json ei ole JSON-muotoa: { $e }

engine-wasm-input-is-about-bytes-over = syöte on noin { $b64 } tavua, yli { $v2 } tavun rajan

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Sekventiaalinen maastoviitteinen navigointi (rekursiivinen SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = vapaa inertiaalinen ajelehtiminen (kasvaa)

engine-altpnt-sequential-terrain-matched-bounded = maastosovitettu (rajattu)

engine-altpnt-sequential-waypoint-full-scale = reittipiste →    asteikon enimmäisarvo { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Kshana-ajon raportti

engine-advanced-report-meta = Laji <code>{ $kind }</code> · moottori { $engine } · skenaario <code>{ $scenario }</code> (tiedoston tiiviste { $digest }…)

engine-advanced-report-toc-summary = 1 Yhteenveto

engine-advanced-report-toc-inputs = 2 Syötteet

engine-advanced-report-toc-results = 3 Tulokset

engine-advanced-report-toc-aggregation = 3a Yhdistäminen

engine-advanced-report-toc-companions = 3b Animaatio ja viennit

engine-advanced-report-toc-events = 4 Tapahtumat

engine-advanced-report-toc-labels = 5 Todennusmerkinnät

engine-advanced-report-toc-not-modelled = 6 Mallintamatta

engine-advanced-report-toc-reproducibility = 7 Toistettavuus

engine-advanced-report-h-summary = 1. Tiivistelmä

engine-advanced-report-honesty-label = <strong>Rehellisyysmerkintä</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Käytetyt kyvykkyydet:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (tuettu mutta ei tarjottu); katso kohta 5.

engine-advanced-report-member-runs = <strong>Jäsenajot:</strong> { $n }, yhdistetty kohdassa 3a.

engine-advanced-report-h-inputs = 2. Syötteet

engine-advanced-report-inputs-note = Jokainen skenaariotiedoston asettama kenttä, litistettynä polkuunsa. Yksiköt tulevat tuloksen <code>units</code>-lohkosta (kenttäyksiköiden skeema, docs/field-units-schema.json), jos se kuvaa kentän, muuten kentän nimen päätteestä; yksikkö, jota kumpikaan ei ilmoita, näytetään merkinnällä ei ilmoitettu.

engine-advanced-report-th-parameter = Parametri

engine-advanced-report-th-value = Arvo

engine-advanced-report-th-unit = Yksikkö

engine-advanced-report-th-unit-source = Yksikön lähde

engine-advanced-report-h-results = 3. Tulokset

engine-advanced-report-chart-alt = Tuloskaavio

engine-advanced-report-also-written-to = { " " }(kirjoitettu myös tiedostoon { $file })

engine-advanced-report-h-scalars = Skalaaritulokset

engine-advanced-report-h-columns = Numeeriset sarakkeet

engine-advanced-report-th-result = Tulos

engine-advanced-report-th-column = Sarake

engine-advanced-report-th-count = Lukumäärä

engine-advanced-report-th-min = Pienin

engine-advanced-report-th-max = Suurin

engine-advanced-report-th-first = Ensimmäinen

engine-advanced-report-th-last = Viimeinen

engine-advanced-report-omitted-inputs = <p class="note">Lisäsyötteitä jätetty pois tältä sivulta: { $n }; report.json luettelee samat rivit, ja tulosasiakirja sisältää jokaisen arvon.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">Lisäskalaaritulosta jätetty pois tältä sivulta: { $n }; report.json luettelee samat rivit, ja tulosasiakirja sisältää jokaisen arvon.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">Lisänumeerisia sarakkeita jätetty pois tältä sivulta: { $n }; report.json luettelee samat rivit, ja tulosasiakirja sisältää jokaisen arvon.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">Lisätapahtumia jätetty pois tältä sivulta: { $n }; report.json luettelee samat rivit, ja tulosasiakirja sisältää jokaisen arvon.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Jäsenajojen yhdistäminen

engine-advanced-report-mode = <p>Tila <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Tila <strong>{ $mode }</strong>, lajina <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Tila <strong>{ $mode }</strong>, jäsenajoja: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Tila <strong>{ $mode }</strong>, lajina <code>{ $kind }</code>, jäsenajoja: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-run-digest = Ajon tiiviste (SHA-256 jäsenten tulostiivisteiden yli, lähetysjärjestyksessä): <code>{ $digest }</code>

engine-advanced-report-table-empty = Tässä taulukossa ei ole rivejä: tulos ei luettele yhtään.

engine-advanced-report-distribution-caption = Monte Carlo -jakauma suureelle { $metric } (näytteitä: { $n }), 20 yhtä leveää luokkaa; katkoviivat osoittavat 5., 50. ja 95. persentiilin.

engine-advanced-report-distribution-caption-unit = Monte Carlo -jakauma suureelle { $metric } (näytteitä: { $n }, yksikkö: { $unit }), 20 yhtä leveää luokkaa; katkoviivat osoittavat 5., 50. ja 95. persentiilin.

engine-advanced-report-h-companions = 3b. Animaatio ja viennit

engine-advanced-report-animation-alt = Animaatio ajon aikasarjasta

engine-advanced-report-animation-caption = Ajon omat näytteet piirtyvät esiin liikkuvan aikakursorin takana (<code>--animate svg</code> -valinnan animoitu piirtäminen; se näyttää valmiin kuvan vähennetyn liikkeen asetuksella ja tulostettaessa).

engine-advanced-report-no-animation = Ei animaatiota: { $reason }

engine-advanced-report-no-animation-default = tulos ei sisällä aikasarjaa

engine-advanced-report-player-written-by = Interaktiivisen soittimen kirjoittaa <code>{ $command }</code>.

engine-advanced-report-written-beside = Kirjoitettu tämän raportin viereen: { $links }.

engine-advanced-report-th-export = Vienti

engine-advanced-report-th-applies = Soveltuu

engine-advanced-report-th-files-or-reason = Tiedostot tai syy

engine-advanced-report-written-by = kirjoittaja <code>{ $command }</code>

engine-advanced-report-does-not-apply = ei sovellu

engine-advanced-report-yes = kyllä

engine-advanced-report-no = ei

engine-advanced-report-h-events = 4. Tapahtuma-aikajana

engine-advanced-report-events-caption = Ikkunat palkkeina, pistemäiset tapahtumat pisteinä, ajon omalla aika-akselilla.

engine-advanced-report-th-start = Alku (s)

engine-advanced-report-th-end = Loppu (s)

engine-advanced-report-th-event = Tapahtuma

engine-advanced-report-th-source = Lähde

engine-advanced-report-point-event = pistemäinen tapahtuma

engine-advanced-report-events-timeline = Tapahtuma-aikajana

engine-advanced-report-point-events = pistemäiset tapahtumat ({ $n })

engine-advanced-report-distribution-of = Suureen { $metric } jakauma

engine-advanced-report-max-bin = suurin luokka { $n }

engine-advanced-report-h-labels = 5. Todennusmerkinnät

engine-advanced-report-th-capability = Kyvykkyys (matriisin vaatimus)

engine-advanced-report-th-label = Merkintä

engine-advanced-report-th-used-by = Käyttäjä

engine-advanced-report-th-oracle = Lähde: oraakkeli (riippumaton vertailu)

engine-advanced-report-th-test-evidence = Testitodisteet

engine-advanced-report-h-figure-tiers = Tuloksen ilmoittamat lukukohtaiset tasot

engine-advanced-report-th-figure = Luku

engine-advanced-report-th-tier = Taso

engine-advanced-report-th-matrix-requirement = Matriisin vaatimus

engine-advanced-report-th-applicable = Sovellettavissa

engine-advanced-report-no-attack = ei (hyökkäystä ei ole määritetty)

engine-advanced-report-h-not-modelled = 6. Mallintamatta jätetty ja oletukset

engine-advanced-report-not-modelled-note = Jokainen kohta lainataan paikasta, jossa se esitetään: tulosasiakirja, lajiluettelo, skenaariotiedosto tai todennusmatriisin perustelu sille, miksi MODELLED-rivi pysyy mallinnettuna.

engine-advanced-report-th-statement = Väite

engine-advanced-report-h-reproducibility = 7. Toistettavuustiedot

engine-advanced-report-rk-command = Toistamiskomento

engine-advanced-report-rk-working-directory = Työhakemisto

engine-advanced-report-rk-engine-version = Moottorin versio

engine-advanced-report-rk-source-commit = Lähdekoodin commit

engine-advanced-report-rk-scenario-file = Skenaariotiedosto

engine-advanced-report-rk-scenario-sha = Skenaariotiedoston SHA-256 (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = Tuloksen scenario_hash

engine-advanced-report-rk-result-sha = Tulosasiakirjan SHA-256

engine-advanced-report-rk-seed = Siemenluku (seed)

engine-advanced-report-rk-platform = Alusta

engine-advanced-report-rk-generated = Tutkimus luotu (UTC)

engine-advanced-report-rk-determinism = Determinismi

engine-advanced-report-result-hash-none = tulosasiakirja ei ilmoita sellaista

engine-advanced-report-print-note = Tulostaaksesi tämän sivun Portable Document Format (PDF) -tiedostoon, käytä selaimen tulostusikkunaa ja valitse ”Tallenna PDF-tiedostona”; tulostustyylitiedosto sovittaa sivun A4- ja US Letter -paperille, toistaa taulukoiden otsikot sivulta toiselle ja aloittaa syötteiden, tulosten, merkintöjen ja toistettavuuden osiot uudelta sivulta. Moottori ei kirjoita PDF-tiedostoa itse. report.json sisältää saman sisällön kuin tämä sivu.

engine-advanced-report-footer = Luonut Kshana { $engine }.{ $stamp } Toistettavissa skenaariosta, siemenluvusta (seed) ja moottorin versiosta. Vapaa ja avoimen lähdekoodin (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">lähdekoodi &amp; dokumentaatio</a>.

engine-advanced-report-empty-inputs = Skenaario ei aseta mitään kenttää `kind`-kentän lisäksi: laji ajoi vertailumäärityksensä dokumentoiduilla oletusarvoilla.

engine-advanced-report-empty-scalars = Tulosasiakirja ei sisällä skalaaria taulukoiden ulkopuolella; sen luvut on tiivistetty sarakkeittain alla.

engine-advanced-report-empty-series = Tulosasiakirja ei sisällä numeerista taulukkoa: jokainen tulos on skalaari yllä olevassa taulukossa.

engine-advanced-report-empty-events = Ei ajastettua tapahtumaa: skenaario ei ohjelmoi ikkunaa tai alkuhetkeä eikä tulos ilmoita tapahtumaa. Laji arvioi määrityksensä yhtenä tapauksena.

engine-advanced-report-empty-not-modelled = Mikään tuloksessa, lajiluettelossa, skenaariossa tai käytetyissä matriisiriveissä ei ilmoita tämän ajon mallinnusrajoitusta.

engine-advanced-report-capabilities-statement = Jokainen rivi on todennusmatriisin rivi, jota tämän ajon lajit käyttävät, ja siinä on merkintä ja oraakkeli (riippumaton vertailu), jonka matriisi sille antaa (src/verification.rs, docs/VERIFICATION-MATRIX.md). Merkintä arvioi kyvykkyyden sellaisena kuin matriisi sen kirjaa; se ei arvioi tämän skenaarion määritystä, eikä VALIDATED-rivi tee ajon syötteistä mitattuja. PARTNER-rivi on käytäntö, johon ajo nojaa ja jota Kshana ei tarjoa.

engine-advanced-report-no-run-label = Tulos ei sisällä ajotason rehellisyysmerkintää; käytettyjen kyvykkyyksien todennusmerkinnät luetellaan omassa osiossaan ja lukukohtaiset tasot siellä, missä tulos ne ilmoittaa.

engine-advanced-report-no-seed = Skenaario ja tulos eivät sisällä siemenlukua (seed). Tuloksen määräävät yksin skenaariotiedosto ja moottorin koontiversio; determinismitesti ajaa uudelleen jokaisen mukana toimitetun skenaarion ja vaatii tavu tavulta identtisen tulosteen.

engine-advanced-report-working-directory = Suorita komento hakemistosta, jossa alkuperäinen ajo käynnistettiin: skenaarion polku ja skenaarion sisällä olevat suhteelliset datapolut ratkaistaan sen mukaan. Tarkista skenaariotiedosto ensin arvoa scenario_sha256 vasten.

engine-advanced-report-determinism-stamped = Samat skenaarion tavut, siemenluku (seed) ja moottorin koontiversio antavat saman tulosasiakirjan, lukuun ottamatta sen meta.generated_utc-leimaa, jonka --study-name kirjoittaa kellosta; aja ilman --study-name -valintaa saadaksesi tavu tavulta identtisen tulosteen. Liukulukutulokset on kiinnitetty alustakohtaisesti; toinen käyttöjärjestelmä tai arkkitehtuuri voi poiketa viimeisissä numeroissa.

engine-advanced-report-determinism-plain = Samat skenaarion tavut, siemenluku (seed) ja moottorin koontiversio antavat tavu tavulta identtisen tulosasiakirjan ja raportin; tämä raportti ei sisällä aikaleimaa. Liukulukutulokset on kiinnitetty alustakohtaisesti; toinen käyttöjärjestelmä tai arkkitehtuuri voi poiketa viimeisissä numeroissa.

engine-advanced-report-not-applicable-no-attack = ei sovellu (hyökkäystä ei ole määritetty)

engine-advanced-report-what-ran-default = `{ $kind }`-skenaario.

engine-advanced-report-nothing-carried = ei sisältöä

engine-advanced-report-tbl-sweep-nodes = Pyyhkäisyn solmut

engine-advanced-report-tbl-mc-summary = Monte Carlo -jakauman yhteenveto (persentiilit ovat lähimmän sijan menetelmällä; keskiarvon 95 %:n luottamusväli on kiinteällä siemenluvulla (seed) laskettu persentiili-bootstrap)

engine-advanced-report-tbl-chain-phases = Ketjun vaiheet

engine-advanced-report-tbl-shared = Yhteiset olosuhteet

engine-advanced-report-tbl-members = Jäsenet

engine-advanced-report-tbl-combined = Yhdistetty jäsenten kesken

engine-advanced-report-tbl-optimiser-best = Optimoijan paras (paikallinen optimi annetuilla rajoilla)

engine-advanced-report-tbl-optimiser-trace = Optimoijan jälki

engine-advanced-report-tbl-sweep-grid = Pyyhkäisyn ruudukko

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Maastoviitteinen navigointi (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Painovoimakarttaan sovitettu navigointi

engine-altpnt-terrain-title-combined = Yhdistetty painovoima-, magneetti- ja maasto-alt-PNT

engine-altpnt-terrain-free-inertial-drift = vapaa inertiaalinen ajelehtiminen

engine-altpnt-terrain-terrain-matched = maastosovitettu

engine-altpnt-terrain-gravity-matched = painovoimasovitettu

engine-altpnt-terrain-gravity-only = vain painovoima

engine-altpnt-terrain-magnetic-only = vain magneettikenttä

engine-altpnt-terrain-terrain-only = vain maasto

engine-altpnt-terrain-combined-fused = yhdistetty (fuusioitu)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · skenaario { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Kuun signaaliturvallisuuden hyökkäyspinta (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = näkyvissä olevat releet

engine-body-pnt-chart-count = lukumäärä

engine-body-pnt-chart-formal-one-sigma-position = muodollinen yhden sigman paikka (log10 m): sininen vain satelliittitähdistö, keltainen Maa-etäisyyden kanssa

engine-body-pnt-chart-time-since-epoch = aika epookista, 0–{ $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = kellon aikavirhe vs. suoja-aika (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 vs. seurantakynnys (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = suojaustaso vs. hälytysraja (m)

engine-campaign-chart-position-error-vs-threshold = paikkavirhe vs. kynnys (m)

engine-campaign-chart-satellites-tracking = seurattavat satelliitit

engine-campaign-chart-alarm-flags-and-events = hälytyslaput ja tapahtumat

engine-campaign-chart-mission-time = tehtäväaika { $duration } s

engine-campaign-chart-sweep-percentile-band = , mediaani ja 5.–95. persentiilin kaista { $n_runs } siemenluvulla (seed)

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) kohdassa { $lead }

engine-campaign-chart-monte-carlo-of = Lajin `{ $scenario_kind }` Monte Carlo: { $n_runs } siemenlukua (seed) alkaen arvosta { $base_seed } (5., 50., 95. persentiili; palkki = keskiarvon bootstrap-95 %:n luottamusväli)

engine-campaign-chart-composed-members = yhteisissä olosuhteissa koostetut jäsenet: { $shared }

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Kuunläheisen kaaren pituuden palautus — estimaattori, joka ei jaa jakobiaaneja

engine-cislunar-arc-recovery-chart-subtitle = differenssipohjainen eräpienimmän neliösumman menetelmä · mitattu tilan palautusvirhe · ei analyyttistä jakobiaania, ei variaatio-STM:ää, ei SVD-asteen toleranssia

engine-cislunar-arc-recovery-chart-bound = raja { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = Gramin matriisin asteen kynnys

engine-cislunar-arc-recovery-chart-monte-carlo-rms = Monte Carlo -menetelmän RMS-paikanpalautusvirhe (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = kohinaton huonoin palautussuhde (loppuvirhe / siirtymä)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Kuunläheinen havaittavuus seurantakaaren yli (P6)

engine-cislunar-observability-chart-subtitle = aste vs. kaari (vain etäisyys, yksi linkki) · Gramin matriisin ominaisarvospektri · differentiaalikorjatut DRO-alkuehdot + SRIF-ristiintarkistus · { $modelled } suunnittelu, { $validated } aste/STM/sulkeutuminen

engine-cislunar-observability-chart-observable-rank = havaittava aste vs. kaaren pituus

engine-cislunar-observability-chart-arc-length = kaaren pituus (pyörivän koordinaatiston aikayksiköt, yhteensä { $arc_hours } h)

engine-cislunar-observability-chart-gramian-eigenvalues = Gramin matriisin ominaisarvot (log10)

engine-cislunar-observability-chart-condition = ehtoluku κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Kerrostetun PNT:n konfliktikestävyys (P7)

engine-conflict-resilience-chart-subtitle = kokonaishäviö vs. uhan voimakkuus (MC vs. suljettu muoto) · kestävyyssuhde vs. estokorrelaatio · { $modelled } priorit, { $validated } MC->suljettu muoto / kopulan reunajakaumat

engine-conflict-resilience-chart-total-loss-probability = kokonaishäviön todennäköisyys vs. voimakkuus

engine-conflict-resilience-chart-threat-intensity = uhan voimakkuus

engine-conflict-resilience-chart-layered-mc = kerrostettu MC

engine-conflict-resilience-chart-single-layer = yksittäinen kerros

engine-conflict-resilience-chart-resilience-ratio = kestävyyssuhde vs. estokorrelaatio

engine-conflict-resilience-chart-denial-correlation = estokorrelaatio ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = saatavuus (%)

engine-constellation-chart-mean-pdop = keskimääräinen PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = Maa-GNSS Kuun etäisyydellä — C/N0 suhteessa keilan akselista poikkeamaan

engine-earth-gnss-lunar-chart-track-threshold = seuranta { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = Maan reuna { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = poikkeama keilan akselista (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = kulta = seurattavissa · punainen = liian heikko · harmaa = Maan peittämä · { $modelled } lähetyskuvio

## src/ensemble.rs

engine-ensemble-chart-title = Kellon holdover: aikavirheen luottamuskaista ({ $n_runs } ajoa)

engine-ensemble-chart-timing-error-ns = aikavirhe (ns)

engine-ensemble-chart-spec-threshold = vaatimus { $threshold } ns

engine-ensemble-chart-time-s = aika (s)

engine-ensemble-chart-classical-median-band = klassinen: { $id } (mediaani, 5–95 %:n kaista)

engine-ensemble-chart-quantum-median-band = kvantti: { $id } (mediaani, 5–95 %:n kaista)

## src/frame_eop.rs

engine-frame-eop-chart-title = Reaaliaikainen koordinaatiston/EOP:n ennustebudjetti Kuun ajanmääritykselle

engine-frame-eop-chart-ut1-error-ms = UT1-virhe (ms)

engine-frame-eop-chart-position-at-moon-m = paikka Kuussa (m)

engine-frame-eop-chart-equiv-timing-ns = vastaava ajoitus (ns)

engine-frame-eop-chart-prediction-horizon-days = ennustehorisontti (päivää)

engine-frame-eop-chart-iers-final-floor = IERS:n lopullinen alaraja { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m Kuussa

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = 17-tilainen hybridi-UKF — suotimen sisäinen johdonmukaisuus (mallinnettu)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + innovaation valkoisuus vs. 95 %:n χ²-kaistat; 1.0 = johdonmukainen. Sisäinen johdonmukaisuus, ei tarkkuutta.

engine-fusion-hybrid-ukf-chart-target = tavoite 1.0

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (valkoisuus)

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Löyhästi kytketty GNSS/INS-vaakavirhe

engine-fusion-pack-chart-horizontal-error-m = vaakavirhe (m)

engine-fusion-pack-chart-spec-threshold = vaatimus { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Taivaskaavio ({ $label })

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (horisontin peittämä)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (maskin alapuolella)

engine-geometry-chart-no-fix = ei paikkaratkaisua

engine-geometry-chart-in-view-hidden = näkyvissä { $n_visible }, horisontin peittämiä { $n_masked } · { $dop } · ontto: ei näkyvissä

engine-geometry-chart-satellites-as-given = satelliitit annettuina

engine-geometry-chart-representative-sky = edustava taivas, ei päivätty

engine-geometry-chart-footer = Kshana v{ $version } · geometria ilmoitetun virhemallin alla · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = RAIM-suojaustasot vs. hälytysrajat

engine-gnss-sim-chart-protection-level-m = suojaustaso (m)

## src/holdover_test.rs

engine-holdover-test-not-recovered-within-record = ; ei palautunut tallenteen aikana

engine-holdover-test-chart-title = Holdover-testi: aikavirhe vaiheittain

engine-holdover-test-chart-y-title = |aikavirhe| (ns)

engine-holdover-test-chart-panel-caption = aikavirheen itseisarvo; holdover-vaihe varjostettu; katkoviivat ovat aikavirhebudjetit

engine-holdover-test-chart-gnss-removed = GNSS poistettu

engine-holdover-test-chart-gnss-restored = GNSS palautettu

engine-holdover-test-chart-time-axis = aika tallenteen akselilla ({ $min } min)

## src/hybrid.rs

engine-hybrid-chart-title = Hybridi-PNT:n vaatimuksen käyttöaste GNSS-katkon aikana (1.0 = vaatimus)

engine-hybrid-chart-y-title = vaatimuksen käyttöaste

engine-hybrid-chart-spec-line = vaatimus (1.0)

engine-hybrid-chart-classical-suite = klassinen sarja

engine-hybrid-chart-quantum-suite = kvanttisarja

## src/hybrid_integrity.rs

engine-hybrid-integrity-chart-availability = saatavuus

engine-hybrid-integrity-chart-precision = toistotarkkuus

engine-hybrid-integrity-chart-integrity = eheys

engine-hybrid-integrity-chart-joint-indep = yhteinen (riippumaton)

engine-hybrid-integrity-chart-joint-corr = yhteinen (korreloiva)

engine-hybrid-integrity-chart-title = Hybridi optinen + RF PNT:n yhteinen ansioluku

engine-hybrid-integrity-chart-subtitle = P(saatavilla JA toistotarkkuusluokka JA eheys varmistettu)

## src/inertial/mod.rs

engine-inertial-chart-title = Dead-reckoning-paikkavirhe GNSS-katkon aikana

engine-inertial-chart-y-title = paikkavirhe (m)

engine-inertial-chart-spec-line = vaatimus { $m } m

engine-inertial-chart-classical = klassinen: { $id }

engine-inertial-chart-quantum = kvantti: { $id }

## src/iq/campaign/report.rs

engine-iq-campaign-report-roc-aria-label = Havaitsemisen ROC valvojaa kohti

engine-iq-campaign-report-roc-x-title = P_fa (negatiivista ikkunaa kohti)

engine-iq-campaign-report-curve-aria-label = C/N0:n heikkeneminen suhteessa ilmoitettuun J/S-arvoon: { $rec } tapahtuma { $ev }

engine-iq-campaign-report-curve-x-title = ilmoitettu J/S (dB)

engine-iq-campaign-report-curve-y-title = C/N0:n heikkeneminen (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: SSC-vertailu, Q = { $q }

engine-iq-campaign-report-curve-model-legend = { $label }-vertailu (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } lisäsarjaa tulostaulukossa

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, mitattu heikkeneminen { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (mitattu)

## src/jamming.rs

engine-jamming-chart-title = Näkyvät vs. seurattavat satelliitit häirinnän (jamming) aikana

engine-jamming-chart-y-title = satelliitit

engine-jamming-chart-four-sv-fix = 4 SV:n paikkaratkaisu

engine-jamming-chart-visible = näkyvissä

engine-jamming-chart-tracking = seurannassa

## src/leo_fusion/ntn.rs

engine-leo-fusion-ntn-chart-title = 5G NTN -paikannus: Cramér–Rao-etäisyysraja kaistanleveyden mukaan

engine-leo-fusion-ntn-chart-caption = etäisyyden yksi sigma (log10 m): palkki = maskista zeniittiin C/N0; piste = 3D-paikkaratkaisun RMS-virhe

## src/leo_fusion/ppp.rs

engine-leo-fusion-ppp-chart-title = PPP:n konvergenssi LEO-täydennyksellä

engine-leo-fusion-ppp-chart-caption = vaakavirheen mediaani (log10 m) minuutteja vastaan

## src/leo_fusion/pvt_kind.rs

engine-leo-fusion-pvt-kind-chart-doppler-caption = 3D-Doppler-paikkaratkaisun virhe (log10 m) suhteessa ikkunan pituuteen

engine-leo-fusion-pvt-kind-chart-doppler-x-label = ikkuna (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = PDOP:n (sininen) ja VDOP:n (keltainen) mediaani, log10, suhteessa lisättyihin LEO-satelliitteihin

engine-leo-fusion-pvt-kind-chart-joint-x-label = lisätyt LEO-satelliitit

engine-leo-fusion-pvt-kind-chart-polar-caption = VDOP:n mediaani (log10): harmaa GNSS, sininen LEO, keltainen fuusioitu

engine-leo-fusion-pvt-kind-chart-polar-x-label = leveysaste (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = RMS-aikavirhe UTC:hen (log10 ns) suhteessa C/N0-siirtymään, yksi viiva oskillaattoria kohti

engine-leo-fusion-pvt-kind-chart-timing-x-label = C/N0-siirtymä (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 }–{ $x1 }

## src/leo_navmsg/mod.rs

engine-leo-navmsg-chart-title = LEO-navigointiviesti: SISRE vs. sovitusväli

engine-leo-navmsg-chart-no-trade-encode-decode = Tässä ajossa ei kompromissia; koodaus- ja dekoodaustaulukot sekä budjettitaulukot ovat tiedostossa result.json.

engine-leo-navmsg-chart-no-fit-interval-trade = Tässä ajossa ei sovitusvälin kompromissia; katso result.json.

engine-leo-navmsg-chart-caption = pelkän radan SISRE RMS (m, logaritminen asteikko) vs. sovitusväli (s)

## src/leo_pass.rs

engine-leo-pass-chart-title = LEO-ohitus: C/N0 kaistaa kohti ja Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20–80): LEO-kaistat värillisinä, GNSS harmaana

engine-leo-pass-chart-time-axis = aika epookista, 0–{ $s } s

## src/leo_pnt_chain.rs

engine-leo-pnt-chain-chart-subtitle = signaalisuunnittelu -> ohituksen C/N0 ja koodijitteri -> viestin SISRE -> fuusioitu paikkaratkaisu · { $label }

engine-leo-pnt-chain-chart-cn0-caption = Seurattavan komponentin C/N0 ohituksen aikana (dB-Hz, 20–80)

## src/leo_signal.rs

engine-leo-signal-chart-title = LEO-PNT-signaalisuunnitelmat

engine-leo-signal-chart-psd-axis = siirtymä ±0,6 × lähetyskaistanleveys; 0 – −50 dB kunkin huipun alapuolella

engine-leo-signal-chart-jitter-caption = koodijitteri (m, logaritminen asteikko) vs. kokonais-C/N0 (dB-Hz)

## src/main.rs

engine-main-fail = virhe: { $e }

## plural forms

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] priorit vaativat osajoukkoja, joissa on { $n_fault_max } samanaikainen tapahtuma; tämä polku luettelee enintään { $most }
       *[other] priorit vaativat osajoukkoja, joissa on { $n_fault_max } samanaikaista tapahtumaa; tämä polku luettelee enintään { $most }
    }

engine-body-pnt-positioning-around-user-relays-at =
    Paikannus kohteen { $name } ympärillä — { $user_kind }-käyttäjä, { $n_relays ->
        [one] { $n_relays } rele
       *[other] { $n_relays } relettä
    } etäisyydellä { $r } km, { $n_epochs ->
        [one] { $n_epochs } epookki
       *[other] { $n_epochs } epookkia
    }
    { "  " }Maan valon kulkuaika { $one_way_light_time_s } s yhteen suuntaan, { $two_way_light_time_s } s edestakaisin; Aurinko-Maa-taivaankappale-kulma { $sun_separation_deg } deg
    { "  " }saatavuus: { $availability_relays } vain satelliittitähdistöllä, { $availability_with_earth } Maa-etäisyyden kanssa (Maa näkyvissä { $earth_visibility })
    { "  " }PDOP mediaani { $opt }; RMS-virhe { $opt2 } vain satelliittitähdistöllä, { $opt3 } Maa-etäisyyden kanssa
    { "  " }muodollisen sigman mediaani { $opt4 } vain satelliittitähdistöllä, { $opt5 } Maa-etäisyyden kanssa{ "\u000A" }

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] integrity: { $n } epookki ylittää { $MAX_EPOCHS } epookin rajan; nosta step_s
       *[other] integrity: { $n } epookkia ylittää { $MAX_EPOCHS } epookin rajan; nosta step_s
    }

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] { $source } -maajälki · { $n_samples } näyte · korkeus { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
       *[other] { $source } -maajälki · { $n_samples } näytettä · korkeus { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
    }

engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } tila; aste { $degree } tarvitsee { $value }
       *[other] { $n } tilaa; aste { $degree } tarvitsee { $value }
    }

## legal

# legal: native review
engine-legal-compliance-statement = Rivi, joka on merkitty ”evidenced”, tarkoittaa, että tämän joukon ajo tukee todisteita rivin nimeämille ominaisuuksille. Se ei ole toteamus siitä, että kehys täyttyy, eikä se tarkoita, että kukaan olisi arvioinut tai hyväksynyt mitään tuotetta. Aukkosarake kertoo, mitä ajot eivät osoita.

# legal: native review
engine-legal-bench-surface-notice = Vain ajoneuvon liike ja nimetyt tapahtumavälit. Mikään tässä viety ei ole radiotaajuista tai kantataajuista signaalia, ei mallinna sellaista eikä ohjaa sitä, ja tapahtuma on aikaväli, ei resepti häiriön tuottamiseen. Signaalit toimittavat laboratoriosimulaattori ja sen käyttäjä, jotka vastaavat siitä, että ne ajetaan vain siellä, missä se on sallittua (johtimitse tai suojatussa tilassa, simulaattorin omien turvaohjeiden mukaisesti). Kshana ei julkaise tällaisten ajojen tuloksia.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ikkunatason ROC kullekin monitorille annetuilla tallenteilla. Jokainen ilmoitettu tapahtumaikkuna on positiivinen ja jokainen tapahtumien ulkopuolinen roc_window_s-ikkuna negatiivinen; ikkuna lasketaan kynnyksellä, kun monitorin testisuure saavuttaa sen ikkunassa. P_fa on negatiivista ikkunaa kohti, ei testiä kohti.

# legal: native review
engine-legal-lunanet-afs-advisory = Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Se tarkistaa symbolivirran julkaistun spesifikaation yhtä painosta vasten eikä kerro mitään yhdestäkään LunaNet-solmusta tai -palvelusta.

# legal: native review
engine-legal-iqfit-statement = MODELLED: jokainen sovitettu luku kuvaa avointa vastaanotinta (nimettyä silmukkasuunnittelua ja etupäätä) sille annetuilla tallenteilla, sovitettuna kampanjan pisteytettyihin tuloksiin. Se ei ole minkään toisen vastaanottimen mittaus. Ennusteet on merkitty PREDICTION, lähimmällä testatulla tallenteella ja etäisyydellä testattujen olosuhteiden ulkopuolelle.

# legal: native review
engine-legal-iqfit-advisory = Ohjeellinen: analyysitulos, ei tyyppihyväksytty navigointilaite; ennusteet ovat mallin tuloksia ilmoitetulla virheellä, eivät takuita.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Lähdelausuma, ei väite: ICG WG-B Lunar PNT -aineisto kesäkuulta 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, tutkimuksen lähde S3) kuvaa kuun aikaviitelaboratoriota asemalla nanosekuntitason aikatavoitteineen. Kshana siteeraa tätä tavoitetta vain taustaksi; se ei omaksu sitä, eikä mikään tässä lohkossa osoita, että yksikään todellinen asemakello täyttäisi sen.

# legal: native review
engine-legal-standards-pack-notice = Standardipaketti mittaa mallinnettuja skenaarioita ennen ajoa ilmoitettuja kynnyksiä vasten. Se tukee todisteita niille kehyksen riveille, jotka se nimeää; se ei arvioi tai hyväksy mitään tuotetta, ja MET-merkitty kynnys kertoo vain, että skenaarion mallinnettu tulos täytti ilmoitetun kynnyksen.

# legal: native review
engine-legal-standards-pack-advisory = Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu; sitä ei saa käyttää ainoana perusteena navigointia tai turvallisuutta koskevalle päätökselle.

# legal: native review
engine-legal-geometry-statement = Geometria ilmoitetulla virhemallilla (MODELLED): näköyhteysnäkyvyys ilmoitettua horisonttia vasten, DOP ja gaussinen virhe-ellipsi riippumattomille, yhtä suurille, nollakeskiarvoisille gaussisille etäisyysvirheille ilmoitetulla käyttäjän ekvivalentilla etäisyysvirheellä. Se ei ole ennuste vastaanottimen todellisesta virheestä, jossa on myös harhoja, monitie-etenemistä ja ei-näköyhteysvirheitä, eikä se ole eheysraja. Esiasetetut tähdistöt ovat edustava geometria, eivät kyseisen päivän taivas kyseisessä paikassa.

# legal: native review
engine-legal-resilience-disclaimer = Simulaatiosta johdettu itsearviointi, suhteutettu DHS RPCF v2.0:aan. Tämä ei ole sertifiointi tai akkreditointi, eikä se edusta minkään viranomaisen hyväksyntää (DHS, IEEE tai muu). Jokainen osapistemäärä on MODELLED, ellei sitä ole nimenomaisesti merkitty VALIDATED, ja pistemäärät ovat aika-alueen ja havaitsemisen hyvyysmittoja, eivät paikka-alueen tarkkuutta.

# legal: native review
engine-legal-observatory-notice = Heikentynyt solu tarkoittaa, että suuri osa ilma-aluksista ilmoitti siellä kyseisenä päivänä heikon navigointitarkkuuden. Mitään syytä ei esitetä. Solua, jota ei havaittu tai joka puuttuu, ei arvioitu, mikä ei ole sama asia kuin häiriötön. Vain ohjeellinen: ei hyväksyntä, sertifiointi eikä vaatimustenmukaisuusvakuutus.

# legal: native review
engine-legal-receiver-trust-advisory = Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC 61108, IEC 61162): käyttäjä vastaa edelleen aluksen navigoinnista.

# legal: native review
engine-legal-evidence-roundtrip-notice = Yhdistää neljä tietuetta tiivisteellä (hash): skenaarion, laboratorion ilmoittamat testiolosuhteet, vastaanotinlokin ja kyseisen lokin pisteytyksen ilmoitettuihin tapahtumiin nähden. Se ei ole signaali, ei toistoresepti eikä sertifiointi. Se, miten skenaarion liike pääsi vastaanottimelle (laboratoriosimulaattorilla toistettu tiedosto, johtimitse tai suojatussa tilassa), oli käyttäjän vastuulla, ja se on tässä kirjattu vain ilmoitetulla tavalla.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Tämä paketti on tekninen tallenne siitä, mitä Kshana-moottori laski ilmoitetusta vastaanotinlokista ilmoitetulla kokoonpanolla. Se ei ole oikeudellinen lausunto, ei tosiasiakonstatointi mistään tapahtumasta tai sen syystä eikä sertifiointi.

# legal: native review
engine-legal-bench-notice = Ohjeellinen: mallinnettu tai mitattu ilmoitettuja vertailukohtia vasten; ei hyväksyntä, sertifiointi eikä vaatimustenmukaisuusvakuutus. Pistemäärä kuvaa lokia tai aineistoa, ei koskaan tuotetta.

# legal: native review
engine-legal-osnma-advisory = Ohjeellinen: tämä on analyysi- ja valvontatuloste, ei tyyppihyväksytty navigointilaite. Tässä ilmoitettu todennuksen tila ei ole navigoinnin eheyspalvelu, eikä sitä saa käyttää ainoana perusteena navigointia tai turvallisuutta koskevalle päätökselle.
