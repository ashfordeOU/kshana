# SPDX-License-Identifier: AGPL-3.0-only
# uk catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = невідомий формат журналу годинника { $other }; очікується один із: { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = невідома політика пропусків { $other }; очікується refuse, longest або linear

engine-e-clock-log-give-either-the-log-text = задайте або текст журналу, або шлях до нього, але не обидва

engine-e-clock-log-clock-log-needs-its-text = журналу годинника потрібен текст або шлях

engine-e-clock-log-tau0-must-be-finite-and = tau0_s має бути скінченним і > 0 (отримано { $t })

engine-e-clock-log-units-and-data-apply-to = units і data застосовуються лише до формату timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel застосовується лише до формату ticc

engine-e-clock-log-cannot-read-clock-log = не вдалося прочитати журнал годинника { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = шлях до журналу годинника недоступний у збірці WebAssembly; передайте журнал як текст

engine-e-clock-log-the-log-yields-usable-sample = журнал формату { $format }: придатних відліків — { $x }; потрібно щонайменше 3

engine-e-clock-log-not-rinex-clock-file-no = це не файл годинників RINEX: немає запису END OF HEADER

engine-e-clock-log-the-rinex-clock-file-has = у файлі годинників RINEX немає записів AS або AR

engine-e-clock-log-the-rinex-clock-file-holds = у файлі годинників RINEX кількість годинників: { $many }; назвіть один через clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = немає записів AS або AR для годинника { $id }

engine-e-clock-log-the-clock-has-single-epoch = у годинника лише одна епоха; потрібні щонайменше дві (tau0 визначити неможливо)

engine-e-clock-log-the-log-has-no-readings = журнал формату { $format } не містить показань

engine-e-clock-log-unknown-phase-unit-expected-ms = невідома одиниця фази { $other }; очікується s, ms, us, ns або ps

engine-e-clock-log-timelab-line-has-column-the = рядок TimeLab { $v1 }: кількість стовпців — { $v }, у першому рядку даних — { $first }

engine-e-clock-log-timelab-line-has-columns-one = рядок TimeLab { $v1 }: кількість стовпців — { $v }; зчитується один (значення) або два (час, значення)

engine-e-clock-log-timelab-line-is-not-numeric = рядок TimeLab { $v1 } не є числовим: { $l }

engine-e-clock-log-the-timelab-log-has-no = журнал timelab не містить показань

engine-e-clock-log-unknown-data-expected-phase-or = невідоме значення data { $other }; очікується phase або frequency

engine-e-clock-log-tau0-header-is-not-positive = заголовок tau0 { $v } не є додатним числом секунд

engine-e-clock-log-frequency-data-is-fractional-frequency = дані частоти — це відносна частота; її одиниці можуть бути лише 1

engine-e-clock-log-two-column-frequency-logs-are = двостовпцеві журнали частоти не зчитуються; задайте частоту одним стовпцем разом із tau0

engine-e-clock-log-unknown-time-units-expected-or = невідоме значення time_units { $o }; очікується s або mjd

engine-e-clock-log-the-timelab-log-time-column = стовпець часу журналу timelab має зростати

engine-e-clock-log-single-reading-tau0-cannot-be = лише одне показання; tau0 визначити неможливо

engine-e-clock-log-the-timelab-log-has-non = журнал timelab: нескінченних або нечислових показань — { $non_finite }

engine-e-clock-log-the-ticc-log-holds-channels = журнал TICC містить канали: { $many }; назвіть один через channel = "..."

engine-e-clock-log-no-readings-on-channel-found = немає показань на каналі { $channel } (знайдено: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = рядки TICC у режимі інтервалів не містять часу; задайте tau0_s (період події)

engine-e-clock-log-the-readings-do-not-increase = показання { $channel } не зростають, тож вони не є мітками часу (вивід TICC у режимі Period не зчитується; використайте режим Timestamp)

engine-e-clock-log-single-time-stamp-tau0-cannot = лише одна мітка часу; tau0 визначити неможливо

engine-e-clock-log-two-time-stamps-apart-under = дві мітки часу { $channel } з інтервалом { $w } s, менше за половину tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = мітки часу формату { $format } для { $clock } йдуть у зворотному напрямку (перезапуск демона або стрибок годинника); розділіть журнал і прочитайте кожну частину окремо

engine-e-clock-log-the-log-has-no-readings-2 = журнал не містить показань: { $what }

engine-e-clock-log-the-log-holds-sources-name = журнал містить джерела: { $many }; назвіть одне через { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = немає показань ({ $what }) для { $id } (знайдено: { $names })

engine-e-clock-log-the-servo-of-never-reached = серво { $id } ніколи не досягло стану захоплення s2

engine-e-clock-log-the-log-has-no-chrony = журнал не містить показань відстеження chrony

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = частота дискретизації { $fs_hz } Hz не дає цілого числа відліків на мілісекунду

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms і noncoherent мають бути додатними

engine-e-acquisition-the-doppler-grid-needs-positive = сітка Доплера потребує додатного кроку та невід'ємного максимуму

engine-e-acquisition-pfa-must-lie-in = pfa має лежати в межах (0, 1)

engine-e-acquisition-samples-supplied-needed = відліків: надано { $samples }, потрібно { $needed }

engine-e-acquisition-empty-doppler-grid = порожня сітка Доплера

engine-e-acquisition-the-samples-carry-no-power = відліки не містять потужності

## src/adm.rs

engine-e-adm-unknown-attitude-type = невідомий ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = AEM потребує щонайменше одного сегмента

engine-e-adm-segment-is-not-version-attitude = сегмент { $i }: { $t } не є типом орієнтації версії { $version }

engine-e-adm-segment-values-for = сегмент { $i }: значень — { $values }, для { $t }

engine-e-adm-aem-version-has-no-ndm = AEM версії 1.0 тут не має форми NDM/XML; запишіть KVN

engine-e-adm-this-attitude-type-has-no = цей тип орієнтації не має форми версії 2.0

engine-e-adm-expected-meta-start-found = очікувалося META_START, знайдено { $l }

engine-e-adm-meta-start-without-meta-stop = META_START без META_STOP

engine-e-adm-unexpected-metadata-line = неочікуваний рядок метаданих { $other }

engine-e-adm-in-version-aem = { $att } в AEM версії { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = очікувалося DATA_START після META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START без DATA_STOP

engine-e-adm-empty-data-line = порожній рядок даних

engine-e-adm-values-on-line = рядок { $att }: значень — { $vals }: { $b }

engine-e-adm-unexpected-data-line = неочікуваний рядок даних { $other }

engine-e-adm-attitude-type-has-no-xml = тип орієнтації не має форми XML

engine-e-adm-message-without-version-attribute = повідомлення без атрибута version

engine-e-adm-expected-found = очікувалося { $vers_key }, знайдено { $other }

engine-e-adm-header-without-creation-date-or = заголовок без CREATION_DATE або ORIGINATOR

engine-e-adm-missing = бракує { $k }

engine-e-adm-unexpected-keyword = неочікуване ключове слово { $k }

engine-e-adm-spin-block-holds-nutation-or = блок обертання містить дані нутації або моменту, але не обидва

engine-e-adm-unexpected-apm-keyword = неочікуване ключове слово APM { $other }

engine-e-adm-unexpected-apm-line = неочікуваний рядок APM { $b }

engine-e-adm-without = { $b } без { $stop }

engine-e-adm-unexpected-line-in = неочікуваний рядок у { $b }: { $other }

engine-e-adm-incomplete-group = неповна група { $keys }

engine-e-adm-unknown-apm-block-start = невідомий блок APM { $other }_START

engine-e-adm-apm-metadata-needs-object-name = метаданим APM потрібні OBJECT_NAME, OBJECT_ID і TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM без EPOCH

engine-e-adm-rotation-axis = вісь обертання { $o }

engine-e-adm-values-for = значень — { $values }, для { $t }

engine-e-adm-euler-record-without-euler-rot = запис Ейлера без EULER_ROT_SEQ

engine-e-adm-rotation-sequence = послідовність обертань { $seq }

engine-e-adm-epoch-has-no = в епосі { $s } немає 'T'

engine-e-adm-epoch-date = дата епохи { $date }

engine-e-adm-epoch-time = час епохи { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = «{ $s }» (текст, як його подає документ)

engine-advanced-report-mean-5th-to-95th-percentile = середнє { $fmt_num } (від 5-го до 95-го перцентиля: { $fmt_num2 } – { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = схема одиниць полів: запис units `{ $key }`

engine-advanced-report-field-units-schema-input-entry = схема одиниць полів: запис input `{ $key }`, зіставлений за назвою поля

engine-advanced-report-rows-from-to = рядків: { $nums }, від { $fmt_num } до { $fmt_num2 }

engine-advanced-report-phase-ended-by = фаза { $name } (завершена: { $ended })

engine-advanced-report-result-timeline-phases = результат `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = передавання у фазу { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = результат `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = вхід сценарію `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = коментар у файлі сценарію, рядок { $start }

engine-advanced-report-scenario-file-comment-lines-to = коментар у файлі сценарію, рядки від { $start } до { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement }: MODELLED, не підтверджено незалежним еталоном: { $it }.

engine-advanced-report-sweep-of-scale = Перебір параметра { $param } (шкала: { $str_of })

engine-e-advanced-report-the-result-document-is-not = документ результату не є JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = сценарій не є TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = розподіл Монте-Карло для { $metric }

engine-advanced-report-recorded-at-build-time-from = записано під час збирання зі змінної середовища { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = не записано: рушій зібрано без змінної середовища { $GIT_COMMIT_ENV }; випуск визначає версія рушія

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (власний відбиток сценарію цього виду; не дайджест файлу)

engine-advanced-report-input-file = Вхідний файл { $path }

engine-advanced-report-study-generated = { " " }Дослідження створено: { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = рядок EMAG2 { $v1 }: очікувалося 8 стовпців, розділених комами, знайдено { $p }

engine-e-altpnt-maps-emag2-line-bad = рядок EMAG2 { $v1 }: некоректне значення ({ $what }) `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = рядок EMAG2 { $v1 }: нескінченне або нечислове значення

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: немає рядків даних

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: рядків — { $rows }; вони не заповнюють ґратку { $n_lat } x { $n_lon }, яку охоплюють

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: дубльований вузол у { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = крок сітки має бути скінченним і додатним, отримано { $step }

engine-e-altpnt-maps-grid-box-must-have-north = межі сітки мають задовольняти north > south та east > west, отримано [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = сітка { $n_lat } x { $n_lon } вузлів завелика

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: вісь { $what } потребує щонайменше 2 різних значень

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: вісь { $what } нерегулярна ({ $w } – { $w2 } за середнього кроку { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = сигма похибки має бути скінченною та невід'ємною, отримано { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = довжина кореляції має бути скінченною та додатною, отримано { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side має бути >= 2, отримано { $n }

engine-e-altpnt-terrain-srtm-hgt-length = довжина SRTM .hgt { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = вікно .hgt потребує щонайменше 2 x 2 відліків, отримано { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = крок має бути скінченним і додатним, отримано { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt: довжина вікна { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: невідомий стовпець magnetic_grid `{ $other }` (використайте "sealevel" або "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: не вдалося прочитати csv_path { $csv_path } для magnetic_grid: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = невідомий формат анімації '{ $other }'; очікується svg, html, frames або all

engine-e-animation-no-animation-format-given-expected = формат анімації не задано; очікується svg, html, frames або all

engine-e-animation-animation-fps-must-be-between = fps анімації має бути від 1 до 60, отримано { $fps }

engine-e-animation-animation-duration-must-be-between = тривалість анімації має бути від { $lit_0_5 } s до 600 s, отримано { $duration_s }

engine-e-animation-animation-width-must-be-between = ширина анімації має бути від 480 до 3840 пікселів, отримано { $width }

engine-e-animation-result-is-not-json = результат не є JSON: { $e }

engine-animation-mission-time = час місії ({ $lay })

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (потрібен ffmpeg зі збіркою librsvg; інакше спершу растеризуйте кадри)

engine-animation-further-series-were-found-but = { " " }Додаткових рядів знайдено, але не намальовано: { $omitted } (програвач показує щонайбільше { $MAX_CHARTS } панелей по { $MAX_TRACES } ліній); їх перелічено в маніфесті експорту кадрів.

## src/antenna.rs

engine-antenna-limb-capture-is-reached-on = захоплення лімба ДОСЯГАЄТЬСЯ на цій сітці (висота { $a_lo }-{ $a_hi } m x ширина променя { $b_lo }-{ $b_hi } deg, точок: { $points2 }): робочих точок вибірки, що захоплюють лімб — { $points } із { $points2 }, знайдених перетинів осі — { $crossings }; найсильніше J/S лімба у вибірці — { $limb_js_db } dB на висоті { $altitude_m } m / за ширини променя { $hpbw_deg } deg, за порога захоплення { $thr } dB.

engine-antenna-limb-capture-is-not-reached = захоплення лімба НЕ досягається ніде на цій сітці (висота { $a_lo }-{ $a_hi } m x ширина променя { $b_lo }-{ $b_hi } deg, точок: { $points }) — це не нульове захоплення, а відсутність захоплення лімба: найкраще J/S лімба — { $limb_js_db } dB на висоті { $altitude_m } m / за ширини променя { $hpbw_deg } deg, що на { $shortfall } dB нижче за поріг захоплення { $thr } dB; ця робоча точка захоплювала б лімб за потужності передавача { $limb_capture_tx_power_dbw } dBW проти { $p_tx_dbw } dBW у польоті.

engine-e-antenna-azimuths-must-strictly-increase = азимути мають строго зростати

engine-e-antenna-azimuths-must-span-less-than = азимути мають охоплювати менш ніж 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = кути від осі мають строго зростати

engine-e-antenna-gain-grid-does-not-match = сітка підсилення не відповідає осям

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = коефіцієнти K і P мають бути скінченними та додатними

engine-e-aocs-at-least-three-reaction-wheels = потрібні щонайменше три реакційні махові колеса

engine-e-aocs-wheel-spin-axis-must-be = колесо { $i }: вісь обертання має бути одиничним вектором

engine-e-aocs-wheel-js-and-max-must = колесо { $i }: js і u_max мають бути скінченними та додатними

engine-e-aocs-the-wheel-spin-axes-do = осі обертання коліс не охоплюють трьох вимірів

engine-e-aocs-inertia-minus-the-wheels-spin = інерція за вирахуванням інерції обертання коліс має бути додатно визначеною

engine-e-aocs-inertia-must-be-finite-and = інерція має бути скінченною та симетричною

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis має бути ненульовим скінченним вектором

engine-e-aocs-kind-must-be-finite-and-positive = { $n } має бути скінченним і додатним

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s має давати щонайбільше 2e6 кроків

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s має бути цілою кратною dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 і omega0_rad_s мають бути скінченними

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm має бути скінченним

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s має бути скінченним

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s має бути не меншим за dt_s

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = невідома служба '{ $other }' (очікується navigation|nav або communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = невідома політика арбітражу '{ $other }' (очікується navigation-priority, communications-priority або first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = план контактів потребує щонайменше одного вікна контакту

engine-e-aperture-duty-apertures-must-be = apertures має бути >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = горизонт звітування має бути скінченним

engine-e-aperture-duty-contact-has-non-finite-aos = контакт '{ $name }' має нескінченне або нечислове aos_s чи los_s

engine-e-aperture-duty-contact-must-have-los-aos = контакт '{ $name }' має мати los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = план контактів потребує щонайменше одного вікна [[contacts]]

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: сеансів — { $sessions }, апертур — { $apertures }, політика { $policy } -> навігаційне навантаження { $navigation_duty }, комунікаційне навантаження { $communications_duty }, простій { $idle_duty }; { $total_outage_s } s із запитаних { $total_requested_s } s втрачено через конкуренцію (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Дослідження створено: { $html_escape }.

engine-e-api-failed-to-serialise-report-to = не вдалося серіалізувати звіт у JSON: { $e }

engine-e-api-invalid-scenario = некоректний сценарій: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you = невідомий вид сценарію { $other } — можливо, ви мали на увазі { $hint }? `kshana kinds` перелічує всі вбудовані види: { $n }.

engine-api-unknown-scenario-kind-kshana-kinds = невідомий вид сценарію { $other }. `kshana kinds` перелічує всі вбудовані види: { $n }.

engine-api-required-fields = - **Обов'язкові поля:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Необов'язкові поля:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = помилка розбору TOML: { $e }

engine-api-could-not-classify-scenario-kind = не вдалося визначити вид сценарію: { $e }

engine-api-missing-required-field = { $kind_name }: бракує обов'язкових полів — { $options }

engine-api-missing-required-field-2 = { $kind_name }: бракує обов'язкового поля "{ $entry }"

engine-e-api-invalid-orbit-scenario = некоректний орбітальний сценарій: { $e }

engine-e-api-sp3-export-requires-an-orbit = експорт SP3 потребує орбітального сценарію, а не '{ $k }'

engine-e-api-omm-export-requires-an-orbit = експорт OMM потребує орбітального сценарію, а не '{ $k }'

engine-e-api-oem-export-requires-an-orbit = експорт OEM потребує орбітального сценарію, а не '{ $k }'

engine-e-api-invalid-scenario-toml = некоректний TOML сценарію: { $e }

engine-e-api-could-not-re-serialise-scenario = не вдалося повторно серіалізувати сценарій: { $e }

engine-api-scenario-jamming-availability-under-jamming = сценарій { $r } | глушіння { $v2 } | доступність під час глушіння { $availability_under_jamming } (номінальна { $availability_nominal }) | мін. відстеження { $min_tracking } | середнє J/S { $v6 }

engine-e-api-the-result-document-already-carries = документ результату вже містить `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = не вдалося серіалізувати figure_tiers: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = некоректний сценарій { $label }: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = сценарій { $r } | квантовий holdover { $holdover_s }s p95 { $pos_p95_m }m | класичний holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = сценарій { $r } | спуфінг { $scn } проти специфікації { $threshold_ns } ns (P_fa { $target_pfa }) | квантова безпека { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | класична безпека { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | південний полюс | доступних епох: { $samples_available }/{ $samples_total } ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | віковий темп LTC−TT { $secular_rate_us_per_day } µs/day (смуга { $band_low }–{ $band_high }) | власний потенціал { $self_potential_us_per_day } кінетичний { $kinetic_us_per_day } | зміщення @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | база { $baseline_km } km | дальність маяка { $beacon_range_km } km | затримка { $report } µs (швидкість { $delay_rate_s_per_s } s/s) | поправка ближнього поля { $near_field_correction_us } µs | відліків: { $samples } за { $horizon_hours } h

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| ефемериди { $report } ({ $provenance }) потрібне σ_URE { $fmt } проти кеплерівського { $fmt2 } проти збуреного { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | точок: { $n_grid_points } x епох: { $n_epochs } x спроб: { $n_trials } | доступність { $v4 } % | покриття { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | скориговане p{ $percentile } 3-D { $f } (нескориговане { $f2 }) | HPL макс. { $f3 } | MODELLED; не є твердженням про жодну реальну систему

engine-api-builtins-terrain-horizon-at-the-station = { " " }| горизонт місцевості ({ $sources }) на станції макс. { $horizon_max_deg } deg, користувацькі точки: середній макс. { $user_horizon_max_deg_mean } deg

## src/api/builtins.rs

engine-api-builtins-scenario-optical-sync-rms-ps = сценарій { $r } | оптичний sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | квантовий ланцюг { $quantum_chain_sigma_s }s проти класичного { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | безпека Pd { $security_pd } (Pfa { $monitor_pfa }) | аномалія Pd { $anomaly_pd } | компроміс, перемоги квантового: { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | перерва { $outage_s }s | похибка положення квантового { $quantum_pos_err_m } m проти класичного { $classical_pos_err_m } m ({ $improvement_x }x) | holdover квантового { $quantum_holdover_s }s проти класичного { $classical_holdover_s }s (поріг { $threshold_m } m) | компроміс, перемоги квантового: { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC квантового { $quantum_auc } проти класичного { $classical_auc } | мінімальна виявна несправність квантового { $quantum_min_detectable } проти класичного { $classical_min_detectable } | класів несправностей: { $fault_catalog } | компроміс, перемоги квантового: { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] застосовується лише до виду fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = сценарій { $r } | квантовий PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) цілісність { $integ } безпека { $security_na } | класичний PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) цілісність { $integ2 } безпека { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = сценарій { $r } | fused | квантовий PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) цілісність { $integ } безпека { $security_na } | класичний PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) цілісність { $integ2 } безпека { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = сценарій { $r } | hybrid-ukf (17-state, MODELLED) | сенсор { $v2 } (q_va { $effective_q_va }) | годинник q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } у [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } у [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | з підтримкою { $aided_pos_rms_m }m -> інерційний вибіг { $coast_end_pos_rms_m }m за { $coast_duration_s }s | внутрішня узгодженість, а не точність

engine-api-builtins-scenario-gnss-ins-quantum-outage = сценарій { $r } | gnss-ins | квантовий RMS перерви, комплексований { $fused_outage_rms_m }m проти вільного { $free_outage_rms_m }m (holdover { $holdover_s }s, доступність { $availability }) | класичний, комплексований { $fused_outage_rms_m2 }m проти вільного { $free_outage_rms_m2 }m (holdover { $holdover_s2 }s, доступність { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = сценарій { $r } | gnss-sim | середня іоносфера { $mean_iono_m }m троп. { $mean_tropo_m }m | доступність RAIM { $raim_availability } середній HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m частота несправностей { $fault_rate }

engine-api-builtins-sweep-over-pts-scale-quantum = розгортка { $metric } за { $parameter } ({ $first }..{ $last }, точок: { $points }, шкала { $scale }) | квантовий { $first2 }->{ $last2 } | класичний { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = сценарій { $r } | відліків GNSS-nominal: { $nominal }/{ $series } | найкращий PDOP { $fnum } положення { $posm } | квантовий holdover { $holdover_s }s p95 { $ns1 }ns цілісність { $integ } безпека { $security_na } | класичний holdover { $holdover_s2 }s p95 { $ns12 }ns цілісність { $integ2 } безпека { $security_na }

engine-e-api-builtins-ephemeris = ефемериди: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| макс. висота { $el }° пік Доплера { $v1 } kHz

engine-api-builtins-generic-sweep-of-over-nodes = узагальнена розгортка `{ $kind }` за [{ $keys }] | вузлів: { $points } (форма { $shape }) | метрики [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | дрейф вільної інерціальної навігації { $free_inertial_drift_m } m | за гравітаційною картою { $map_matched_error_m } m | сигма зіставлення { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| еталонний ступінь { $reference_nmax } СКВ аномалії { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| похибка карти, Монте-Карло x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% у межах { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | дрейф вільної інерціальної навігації { $free_inertial_drift_m } m | за рельєфом { $matched_error_m } m (зменшення в { $v3 }x) | сигма зіставлення { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | шляхових точок: { $waypoints } | RMS вільної інерціальної навігації { $free_inertial_rms_m } m (кінцева { $free_inertial_final_m } m) | RMS за рельєфом { $matched_rms_m } m (кінцева { $matched_final_m } m, зменшення в { $v6 }x) | середній ESS { $mean_ess }/{ $cfg } | сигма зіставлення { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | дрейф вільної інерціальної навігації { $free_inertial_drift_m } m | гравітація { $gravity_only_m } m магнітне поле { $magnetic_only_m } m рельєф { $terrain_only_m } m | FUSED { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] потребує runs = 1: виміряний журнал є одним записом

engine-api-builtins-scenario-runs-quantum-holdover-p95 = сценарій { $r } | прогонів: { $runs } | квантовий holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns безпека { $security_na } | класичний holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns безпека { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = сценарій { $r } | квантовий holdover { $holdover_s }s p95 { $ns1 }ns цілісність { $integ } безпека { $security_na } | класичний holdover { $holdover_s2 }s p95 { $ns12 }ns цілісність { $integ2 } безпека { $security_na }

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = еталонному випадку потрібен щонайменше один супутник

engine-e-araim-reference-reference-case-needs-at-least-2 = еталонному випадку потрібне щонайменше одне орбітальне угруповання

engine-e-araim-reference-satellite-names-constellation-but-only = супутник { $i } посилається на орбітальне угруповання { $constellation }, але оголошено лише: { $constellations }

engine-e-araim-reference-satellite-has-non-positive-error = супутник { $i } має недодатну дисперсію похибки

engine-e-araim-reference-both-integrity-risk-allocations-must = обидва розподіли ризику цілісності мають бути додатними

engine-e-araim-reference-this-reference-implementation-monitors-single = ця еталонна реалізація контролює лише режими несправностей з однією подією, але апріорні ймовірності випадку вимагають N_fault,max = { $nfm } (підмножини одночасних багатьох подій). Відмова замість заниження кількості режимів несправностей.

engine-e-araim-reference-the-all-in-view-geometry = геометрія за всіма видимими супутниками вироджена

engine-e-araim-reference-no-fault-mode-is-observable = жоден режим несправності не спостерігається на цій геометрії

engine-e-araim-reference-unknown-reference-vector-known-vectors = невідомий еталонний вектор '{ $vector }'; відомі вектори: { $ids } (або 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: опублікованих еталонних векторів WG-C: { $wanted }; найгірше узгодження VPL/HPL { $worst_acceptance } m щодо власного TOL_PL еталона = { $tol } m на векторах прийнятності: { $acceptance_checked }

engine-e-araim-reference-sat-needs-one-value-per = P_sat потребує одного значення на супутник, а P_const — одного на орбітальне угруповання

engine-e-araim-reference-satellite-names-an-undeclared-constellation = супутник посилається на неоголошене орбітальне угруповання

engine-e-araim-reference-every-prior-must-lie-in = кожна апріорна ймовірність має лежати в [0, 1)

engine-e-araim-reference-the-all-in-view-solution = розв'язок за всіма видимими супутниками не було вибрано

engine-e-araim-reference-an-add-v4-case-needs = випадку ADD v4.2 потрібні супутники та орбітальні угруповання

engine-e-araim-reference-nom-and-sat-need-one = b_nom і P_sat потребують одного значення на супутник

engine-e-araim-reference-const-needs-one-value-per = P_const потребує одного значення на орбітальне угруповання

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = супутник { $i } посилається на неоголошене орбітальне угруповання

engine-e-araim-reference-one-constellation-index-per-satellite = один індекс орбітального угруповання на супутник

engine-e-araim-reference-satellite-names-constellation-with-no = супутник { $i } посилається на орбітальне угруповання { $c } без ISM

engine-e-araim-reference-fewer-than-four-satellites-above = менш ніж чотири супутники над маскою

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m має містити щонайменше одну відстань

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (смуга { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | спуфінг@{ $value } m { $nearest } W | пляма { $a2 }% захоплення диска, лімб { $footprint_limb_captured } | захоплення спуфінгом { $spoof_captured } (утримання { $spoof_lock_time_s } s) | дальність щогли { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% від 50 bit/s), затримка автентифікації { $nma_auth_latency_s } s

engine-attack-surface-reached-crossing-best-db = досягнуто (перетинів: { $crossings }, найкраще { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = НЕ досягнуто на цій сітці (найкраще { $best_limb_js_db } dB, бракує { $best_limb_shortfall_db } dB; потрібно { $best_limb_capture_tx_power_dbw } dBW проти { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| розгортка плями { $s }x{ $s2 } (висота { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), захоплення { $v5 }-{ $v6 }% | лімб { $limb }

engine-attack-surface-afs-received-dbw = AFS прийнято: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Дефіцит: { $deficit_db } dB (смуга { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Пляма захоплення: { $a }% диска, лімб захоплено: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Захоплення спуфінгом: { $spoof_captured } (утримання { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Дальність щогли: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Лімб: захоплено на сітці { $na }x{ $nb }, перетинів: { $crossings }

engine-attack-surface-limb-not-captured-on-grid = Лімб: не захоплено на сітці { $na }x{ $nb }; потрібно { $best_limb_capture_tx_power_dbw } dBW (фактично { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km має бути скінченним і додатним

engine-e-attitude-budget-inertias-must-be-finite-and = моменти інерції мають бути скінченними й додатними

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 має бути >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = потрібен щонайменше один внесок у наведення

engine-e-attitude-budget-contributor-sigma-must-be-finite = сигма внеску '{ $name }' має бути скінченною і >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> момент GG { $t_gg } N·m; наведення { $total }" RSS (домінує: { $dominant }) (MODELLED скалярний бюджет)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } потребує значення

engine-bench-cli-unknown-option = невідомий параметр `{ $a }`

engine-bench-cli-unexpected-argument = неочікуваний аргумент `{ $pos }`

engine-bench-cli-cannot-read = не вдалося прочитати { $p }: { $e }

engine-bench-cli-cannot-create = не вдалося створити { $d }: { $e }

engine-bench-cli-cannot-write = не вдалося записати { $p }: { $e }

engine-bench-cli-unknown-task-or = невідоме завдання `{ $t }` (a, b, c або d)

engine-bench-cli-scored-epochs-in-folder = оцінених епох: { $labels }; тек: { $folders }

engine-bench-cli-wrote-cases-json-and-truth = записано { $out }/cases.json і { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: це зобов'язання є попереднім, а його зерно було розкрито; це не відкладений набір для випуску

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: зерно не те, що лежить в основі цього зобов'язання

engine-bench-cli-is-not-json = { $f } не є JSON: { $e }

engine-bench-cli-cannot-read-2 = не вдалося прочитати { $i }: { $e }

engine-bench-cli-result-rendered = відображено результатів: { $results }

engine-bench-cli-unknown-subcommand =
    невідома підкоманда `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-cannot-create-an-existing-seed = не вдалося створити { $path } (наявний файл зерна ніколи не перезаписується): { $e }

engine-bench-cli-cannot-write-2 = не вдалося записати { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = зерно записано в { $path }: не додавайте його до системи керування версіями і не передавайте в жодному повідомленні; публічним є лише хеш нижче

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (перенесено, не запущено повторно)

engine-bench-cli-impairment-eval-baseline = базовий рівень impairment-eval: { $det }

engine-bench-cli-no-scenario-json-under = немає scenario.json у { $root }

engine-bench-cli-is-not-json-2 = { $path } не є JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = ok: { $ok }, не збігається: { $bad }, відсутніх: { $missing }, незакріплених: { $unpinned }

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = невідомий розподіл `{ $other }` (dev, test або holdout)

engine-bench-score-for-is-not-finite = оцінка для `{ $id }` не є скінченною

engine-bench-case-have-no-score-the = випадків без оцінки: { $missing }, перший — `{ $first_missing }`

engine-bench-predictions-name-case-that-is = прогнози посилаються на випадок, якого немає в еталоні: `{ $extra }`

engine-bench-schema-must-be = `schema` має бути `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` має бути 64-цифровим шістнадцятковим SHA-256

engine-bench-truth-is-not-json = еталон не є JSON: { $e }

engine-bench-predictions-are-not-json = прогнози не є JSON: { $e }

engine-bench-truth-schema-must-be = `schema` еталона має бути `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = `schema` прогнозів має бути `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = еталон створено за іншою версією специфікації, ніж { $SPEC_VERSION }; результати різних основних версій ніколи не змішуються

engine-bench-unknown-task = невідоме завдання `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = результат { $v1 } недійсний: { $p }

engine-bench-site-result-is-task-holdout-result = результат { $v1 } є результатом holdout завдання (d) без `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = результат { $v1 } оцінено за попереднім, розкритим зерном holdout: це не відкладений набір для випуску

engine-bench-site-result-was-scored-under-this = результат { $v1 } оцінено за { $v }; ця сторінка призначена для { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = оцінка для `{ $k }` не є числом

engine-bench-tasks-kshana-receiver-trust-35-default = kshana: довіра до приймача { $s } (типова статистика монітора { $lit_0_35 })

engine-bench-tasks-malformed-clock-line = некоректний рядок годинника `{ $line }`

engine-bench-tasks-the-clock-file-does-not = файл годинників не збігається із закріпленим SHA-256 (отримано { $got }, очікується { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = супутника { $prn } немає у файлі годинників

engine-bench-tasks-kshana-bench-baseline = базовий рівень kshana-bench: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = прогнози охоплюють випадків: { $pmap }, в еталоні: { $tarr }

engine-bench-tasks-case-has-no-number-array = випадок `{ $id }` не має масиву чисел

engine-bench-tasks-case-has-non-finite-value = випадок `{ $id }` має нескінченне значення

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = серіалізація { $name }: { $e }

engine-e-bin-crossover-study-write = запис { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = помилка: не вдалося створити { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = готово: інерціальних вузлів: { $nodes }, кривих годинника: { $curves } (зерно 42)

## src/bin/gen_araim_m3_study.rs

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = записано docs/INTEROP.md (таблиця експорту)

## src/bin/validation_report.rs

engine-bin-validation-report-wrote-validation-summary-to = підсумок перевірки записано до { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = невідоме тіло '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt виконує навігацію навколо тіла, відмінного від Землі, із земним каналом зв'язку; { $name } тут не підтримується

engine-e-body-pnt-duration-and-step-must-be = duration_s і step_s мають бути додатними, не більш ніж 20000 епох; отримано { $duration } і { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind має бути orbiter або surface; отримано '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = висота користувача має бути додатною, а ексцентриситет — у [0, { $lit_0_9 })

engine-e-body-pnt-the-user-orbit-periapsis-is = перицентр орбіти користувача нижче за поверхню

engine-e-body-pnt-constellation-needs-to-200-satellites = орбітальному угрупованню потрібно від 1 до 200 супутників принаймні в одній площині

engine-e-body-pnt-constellation-altitude-must-be-positive = висота орбітального угруповання має бути додатною

engine-e-body-pnt-range-sigmas-must-be-positive = сигми дальності мають бути додатними

engine-e-body-pnt-no-earth-position-relative-to = немає положення Землі відносно { $name } на JD { $jd }

engine-e-body-pnt-serialising-report = серіалізація звіту: { $e }

engine-e-body-pnt-the-report-must-serialise-to = звіт має серіалізуватися в об'єкт JSON

engine-body-pnt-positioning-around = Позиціонування навколо { $name }

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = сценарій E1 не є таблицею

engine-e-calibration-ensembles-e1-scenario-has-no-monte = у сценарії E1 немає [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: відсутнє final_error.{ $k }

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 — це `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ансамблів по 200 реалізацій кожен, порівняно із замкненою формою: середнє 0, сигма = { $sigma } ns. Ансамбль j використовує базове зерно 1 000 000 + 1000 j і початкове зерно бутстрепу 20260928 + j. Найбільша відносна похибка ADEV становила { $max } для E2 і { $max2 } для E3 (для 1, 10 і 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = порожній шлях до результату

engine-e-campaign-result-path-has-an-empty = шлях до результату `{ $path }` має порожній сегмент

engine-e-campaign-result-path-bad-index-in = шлях до результату `{ $path }`: хибний індекс у `{ $part }`

engine-e-campaign-result-path-no-field = шлях до результату `{ $path }`: немає поля `{ $name }`

engine-e-campaign-result-path-indexed-value-is = шлях до результату `{ $path }`: індексоване значення не є масивом

engine-e-campaign-result-path-index-out-of = шлях до результату `{ $path }`: індекс { $i } поза межами ({ $n })

engine-e-campaign-result-path-value-is-not = шлях до результату `{ $path }`: значення не є числом або прапорцем

engine-e-campaign-result-path-is-not-an = шлях до результату `{ $path }`: `{ $k }` не є масивом

engine-e-campaign-result-path-must-name-one = шлях до результату `{ $path }` має вказувати одне значення, а не рядки

engine-e-campaign-result-path-is-not-an-2 = шлях до результату `{ $path }`: `{ $name }` не є масивом

engine-e-campaign-metric-path-has-no-entry = шлях метрики `{ $path }` не має запису в блоці units цього виду; оголосіть його `unit` у кампанії

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` має складатися з літер, цифр, `_` або `-` і бути непорожнім

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: кампанія не може містити кампанію

engine-e-campaign-serialise = { $label }: серіалізація: { $e }

engine-e-campaign-result-did-not-parse = { $label }: результат не вдалося розібрати: { $e }

engine-e-campaign-seed-key-no-field-in = ключ зерна `{ $key }`: у сценарії немає поля `{ $part }`

engine-e-campaign-seed-key-is-not-non = ключ зерна `{ $key }` не є невід'ємним цілим числом

engine-e-campaign-seed-does-not-fit-toml = зерно { $seed } не вміщується в ціле число TOML

engine-campaign-time-path-must-name-rows = шлях часу `{ $t }` має вказувати рядки через `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` не є below, above або abs_above

engine-campaign-threshold-is-null = поріг `{ $p }` має значення null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` не є mean, min, max або count

engine-campaign-time-path-gives-several-values = шлях часу `{ $t }` дає кілька значень на рядок

engine-campaign-value-path-has-fewer-rows = шлях значень `{ $y }` має менше рядків, ніж `{ $t }`

engine-campaign-value-path-has-rows-time = шлях значень `{ $y }` має рядків: { $r }, шлях часу `{ $t }` має рядків: { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = кампанія з фазами потребує [timeline] із step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s має бути додатним, отримано { $step }

engine-e-campaign-phase-is-named-twice = фаза `{ $name }` названа двічі

engine-e-campaign-phase-duration-must-be-non = фаза `{ $name }`: duration_s має бути невід'ємним

engine-e-campaign-phase-has-no-runs = фаза `{ $name }` не має прогонів

engine-e-campaign-phase-the-first-phase-has = фаза `{ $name }`: першій фазі нема від чого передавати

engine-e-campaign-phase-handoff-from-channel-which = фаза `{ $name }`: передавання з каналу `{ $ch }`, яким попередня фаза не завершилася

engine-e-campaign-phase-handoff-from-run-does = фаза `{ $name }`: передавання з from_run { $from_run } не існує

engine-e-campaign-phase-handoff-is-null = фаза `{ $name }`: передавання `{ $from }` має значення null

engine-e-campaign-phase-handoff-run-does-not = фаза `{ $name }`: прогону передавання { $run } не існує

engine-e-campaign-phase = фаза `{ $name }`: { $e }

engine-campaign-phase-run = фаза { $name }/прогін { $ri }

engine-e-campaign-phase-end-at-run-does = фаза `{ $name }`: end_at_run { $end_at_run } не існує

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s пізніше)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } має значення null)

engine-e-campaign-phase-side-is-not-classical = фаза `{ $name }`: сторона `{ $side }` не є classical або quantum

engine-e-campaign-phase-skip-must-be-non = фаза `{ $name }`: skip_s має бути невід'ємним

engine-e-campaign-phase-alarm-compare-is-not = фаза `{ $name }`: compare тривоги `{ $compare }` не є below, above або abs_above

engine-e-campaign-phase-alarm-threshold-is-null = фаза `{ $name }`: поріг тривоги `{ $p }` має значення null

engine-e-campaign-phase-channel-is-in-not = фаза `{ $name }`: канал `{ $channel }` в одиницях { $u }, а не { $du }

## src/campaign.rs

engine-e-campaign-phase-channel-needs-unit = фаза `{ $name }`: каналу `{ $channel }` потрібна одиниця

engine-e-campaign-phase-two-runs-both-provide = фаза `{ $name }`: два прогони задають канал `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = фаза `{ $name }` переносить `{ $ch }`, яким попередня фаза не завершилася

engine-e-campaign-phase-carries-but-no-run = фаза `{ $name }` переносить `{ $ch }`, але жоден її прогін не задає `{ $ch }`

engine-e-campaign-channel-is-in-in-one = канал `{ $name }` в одиницях { $unit } в одній фазі та { $unit2 } в іншій

engine-e-campaign-at-least-one-metric-is = потрібна щонайменше одна метрика

engine-e-campaign-metric-is-named-twice = метрика `{ $name }` названа двічі

engine-e-campaign-seed-overflow-in-the-ensemble = переповнення зерна в ансамблі

engine-e-campaign-an-ensemble-needs-at-least = ансамблю потрібен щонайменше один прогін

engine-e-campaign-sweep-takes-one-to-three = розгортка приймає від однієї до трьох осей, отримано { $axes }

engine-e-campaign-axis-is-named-twice = вісь `{ $name }` названа двічі

engine-e-campaign-axis-needs-at-least-two = вісь `{ $name }` потребує щонайменше двох кроків

engine-e-campaign-axis-scale-must-be-lin = вісь `{ $name }`: scale має бути lin або log

engine-e-campaign-axis-log-axis-needs-positive = вісь `{ $name }`: логарифмічна вісь потребує додатних кінців

engine-campaign-sweep-node = вузол розгортки { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs має бути щонайменше два

engine-e-campaign-compose-needs-at-least-one = compose потребує щонайменше одного учасника

engine-e-campaign-shared-value-must-be-number = спільне значення `{ $name }` має бути числом або числами

engine-e-campaign-shared-value-is-named-twice = спільне значення `{ $name }` названо двічі

engine-e-campaign-member-binds-unknown-shared = учасник `{ $label }` прив'язує невідоме спільне значення `{ $name }`

engine-e-campaign-member = учасник `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = метрика `{ $name }` в одиницях { $u } для одного учасника та { $unit } для `{ $label }`

engine-e-campaign-member-is-named-twice = учасник `{ $label }` названий двічі

engine-e-campaign-invalid-campaign-scenario = недійсний сценарій кампанії: { $e }

engine-e-campaign-invalid-campaign = недійсна кампанія: { $e }

engine-e-campaign-sweep = розгортка: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } для { $what } за реалізаціями

engine-campaign-value-of-at-the-end = значення { $ch } наприкінці попередньої фази, додане до { $ch } цієї фази

engine-campaign-on-the-timeline-grid-the = { $label } на сітці часової шкали: останній відлік прогону фази-власника не пізніше кожного моменту сітки (утримання нульового порядку); null, де жоден прогін цієї фази його не задає

engine-campaign-values-of-the-scenario-key = значення ключа сценарію { $key } уздовж осі { $name }

engine-campaign-value-of-the-scenario-key = значення ключа сценарію { $key } у цьому вузлі

engine-campaign-of-the-node-result = { $path } результату вузла

engine-campaign-of-each-realisation-in-seed = { $path } кожної реалізації в порядку зерен

engine-campaign-shared-value-written-into-every = спільне значення { $name }, записане в кожного учасника, що його прив'язує

engine-campaign-metric-read-from-the-member = метрика { $name }, прочитана з результату учасника

engine-campaign-smallest-across-the-members = найменше { $name } серед учасників

engine-campaign-largest-across-the-members = найбільше { $name } серед учасників

engine-campaign-mean-across-the-members = середнє { $name } серед учасників

engine-e-campaign-failed-to-serialise-campaign-result = не вдалося серіалізувати результат кампанії: { $e }

engine-campaign-chain-phases-over-events-alarm = chain: фаз: { $phases } за { $duration_s } s, подій: { $events }, тривогу піднято на { $alarm_s } s сітки

engine-campaign-sweep-of-nodes-over = розгортка `{ $scenario_kind }`: вузлів: { $nodes } за [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Монте-Карло `{ $scenario_kind }`: зерен: { $runs }

engine-campaign-compose-members = compose: учасників: { $members }

engine-campaign-member-runs-modelled = прогонів учасників: { $runs_total } (MODELLED)

engine-campaign-sweep-of-over-nodes-each = розгортка `{ $scenario_kind }` за { $axis_order } (вузлів: { $nodes }; кожна лінія у своєму діапазоні)

engine-campaign-campaign-modelled-composition-every-value = кампанія { $r } | MODELLED композиція; кожне значення прочитано з реального прогону названого виду

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = оптимізація приймає від одного до трьох параметрів, отримано { $params }

engine-e-campaign-optimize-param-is-named-twice = параметр `{ $name }` названий двічі

engine-e-campaign-optimize-param-needs-finite-lo-hi = параметр `{ $name }`: потрібні скінченні lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = параметр `{ $name }`: scale має бути lin або log

engine-e-campaign-optimize-param-log-param-needs-positive = параметр `{ $name }`: логарифмічний параметр потребує додатних меж

engine-e-campaign-optimize-param-start-must-lie-in = параметр `{ $name }`: start має лежати в [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = параметр `{ $name }`: сітка потребує щонайменше двох кроків

engine-e-campaign-optimize-objective-target-is-only-read = objective.target читається лише при goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" потребує скінченного objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal має бути minimize, maximize або target, отримано `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = сітка з { $total } вузлів перевищує межу 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps читається лише при method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals має охоплювати початковий симплекс (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step має лежати в (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol і xtol мають бути невід'ємними

engine-e-campaign-optimize-method-must-be-grid-or = method має бути grid або nelder-mead, отримано `{ $other }`

engine-campaign-optimize-optimize-eval = обчислення optimize { $trace }

engine-campaign-optimize-lower-bound-of-the-scenario = нижня межа ключа сценарію { $key }

engine-campaign-optimize-upper-bound-of-the-scenario = верхня межа ключа сценарію { $key }

engine-campaign-optimize-value-of-the-scenario-key = значення ключа сценарію { $key } на найкращому обчисленні

engine-campaign-optimize-value-of-the-scenario-key-2 = значення ключа сценарію { $key } на цьому обчисленні

engine-campaign-optimize-target-value-of = цільове значення { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } на найкращому обчисленні

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } цього обчислення (середнє за зернами, коли runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) для `{ $scenario_kind }` методом { $method }: обчислень: { $evals } ({ $stop_reason }), найкраще { $o2 } у [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START перед заголовком CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: некоректний рядок заголовка: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: некоректний рядок метаданих: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: некоректний рядок даних: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: нерозпізнане ключове слово даних { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: у рядку даних { $k } бракує епохи

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: у рядку даних { $k } бракує значення

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: рядок даних { $k } має хибне значення { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: незавершений сегмент (бракує META_STOP/DATA_STOP)

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: хибне TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: хибне TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = невідома спостережувана `{ $other }`: очікується одна з range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = невідомі координати `{ $other }`: очікуються одні з cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours має бути скінченним і додатним, отримано { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs має бути ≥ 2, отримано { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps має бути ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials має бути ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations має бути ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd має бути скінченним і додатним, отримано { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor має бути скінченним і додатним, отримано { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km має бути скінченним і додатним, отримано { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m має бути скінченним і додатним, отримано { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s має бути скінченним і додатним, отримано { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = орбітальне угруповання має містити щонайменше головний апарат і один опорний

engine-e-cislunar-arc-recovery-family-is-an-out-of = родина `{ $family }` є позаплощинною і не має планарного чотиривимірного подання стану: задайте spatial = true, щоб виконати її розгортку

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = пряма модель дала нескінченне істинне вимірювання

engine-cislunar-arc-recovery-first-arc-length-at-which = перша довжина дуги, за якої безшумове пакетне розв'язання КОЖНОГО випробування із зерном зводить похибку кінцевого стану щонайбільше до { $recovery_factor } апріорного зміщення, з якого воно стартувало. Це аналог відновлення критерію рангу: за точних вимірювань питання `is the state observable?` стає питанням `can an estimator get it back?`, і допуск сингулярних значень у відповідь не входить.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = перша довжина дуги, за якої RMS-похибка відновлення положення за Монте-Карло за реалізаціями шуму із зерном (випробувань: { $trials }) спадає до { $error_bound_km } km або нижче. Це аналог відновлення критерію оцінюваності, виміряний, а не передбачений: похибка є відстанню від оцінки до відомої істини, а не слідом формальної коваріації.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED у межах одного кроку сітки епох: оцінювач відновлює з { $e } h, критерій рангу грамієна змінюється на { $g } h (відношення { $v1 }, сітка { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED як межа відновлюваності: оцінювач відновлює з { $e } h, { $v1 } { $g } h за критерієм рангу грамієна (відношення { $v2 }, сітка { $grid_hours } h). Критерій рангу є відносною угодою щодо сингулярних значень; межа відновлення є виміряною похибкою стану, і тут вони не збігаються.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: оцінювач ніколи не досягає своєї межі відновлення на цій дузі, тоді як критерій рангу грамієна змінюється на { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = критерій рангу грамієна ніколи не виконується на цій дузі (геометрія ніколи не досягає повного рангу), тоді як оцінювач відновлює з { $e } h — вони розходяться навіть щодо того, чи існує межа.

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = невідома родина `{ $other }`: очікується одна з dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO на відстані перетину { $d } не пройшла диференціальну корекцію

engine-e-cislunar-observability-member-at-x0-did-not = { $label } член { $i } при x0 = { $x0 } не пройшов диференціальну корекцію

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft має бути від 2 до { $MAX_SPACECRAFT }, отримано { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs має бути ≥ 2, отримано { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol має бути скінченним і додатним, отримано { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m має бути скінченним і невід'ємним, отримано { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km має бути скінченним і додатним, отримано { $sigma_pos_threshold_km }

engine-cislunar-observability-never-rank-of = ніколи (ранг { $rank } з { $state_dim })

engine-cislunar-observability-first-arc-length-at-which = перша довжина дуги, за якої формальна невизначеність положення 1σ ПОЧАТКОВОГО стану головного апарата, σ_pos = sqrt(trace(P_rr)) із P = (ÕᵀÕ)⁻¹ та Õ — матрицею спостережуваності, відбіленою від шуму вимірювань, спадає до { $sigma_pos_threshold_km } km або нижче. Це критерій, за якого поріг довжини дуги взагалі залежить від шуму: P масштабується як σ², тож σ_pos масштабується як σ, тоді як наведений вище критерій рангу з σ не змінюється. Межа є ЗАЯВЛЕНИМ інженерним вибором, а не підігнаним — estimability_sweep повідомляє поріг за чотирьох інших меж.

engine-cislunar-observability-validated-each-constellation-initial-condition = Перевірено: кожна початкова умова орбітального угруповання є диференційно скоригованою періодичною орбітою родини { $family }, що замикається за один період із повідомленою нев'язкою періодичності (планарні DRO додатково ретроградні відносно Місяця). Родину скоректовано для відношення мас Земля–Місяць. Змодельовано: вибір параметрів і фаз родини (проєкт орбітального угруповання). Назву ключа `dro_provenance` збережено для випущеної схеми документа; вона несе ту родину, яку запитав цей прогін.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = цілісність: { $n } має бути скінченним і додатним, отримано { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = цілісність: { $n } має лежати в (0, 1), отримано { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = цілісність: mask_deg має лежати в [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = цілісність: systems має називати щонайменше один пресет

engine-e-clock-integrity-integrity-injected-bias-needs-finite = цілісність: injected_bias потребує скінченних bias_m, t0_s і t1_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: немає записів

engine-e-clock-library-card-records-at-different-tau0 = { $name }: записи з різними tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: періодичний метод найменших квадратів не вдався

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: точок стабільності з edf >= { $MIN_FIT_EDF }: { $used }; картці потрібно три

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = пропусків { $g }, викидів фази { $o }, стрибків фази { $p }, сплесків { $b }, стрибків частоти { $f } (робастна sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` не є невід'ємним цілим числом

engine-e-compliance-is-missing = `{ $p }` відсутнє

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } перевищує events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } перевищує predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: лічильники receiver-trust некоректні ({ $malformed_counts }); виключено

engine-e-compliance-not-json = { $label }: не JSON: { $e }

engine-compliance-cannot-read = { $label }: не вдалося прочитати: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: сусідній сценарій указує вид `{ $s }`, а результат — `{ $o }`; не використано

engine-e-compliance-scenario-kind-not-found-no = { $label }: вид сценарію не знайдено (немає сусіднього файлу сценарію, це не результат receiver-trust, немає `kind` верхнього рівня)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` не є видом сценарію, відомим рушію; не використано

engine-compliance-written-by-kshana = Записано kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    тестів із виконаним кожним заявленим порогом: { $met }, з невиконаним порогом: { $not_met }, що потребують введення: { $needs_input }.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = сітка інтенсивності має мати скінченні min < max, отримано [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = сітка інтенсивності потребує >= 2 кроків, отримано { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = сітка кореляції має містити щонайменше одне значення

engine-e-conflict-resilience-correlation-values-must-lie-in = значення кореляції мають лежати в [0, 1], отримано { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience потребує щонайменше одного шару

engine-e-conflict-resilience-layer-availability-not-in = доступність шару { $i } { $availability } не в [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = sigma_m шару { $i } має бути скінченною і додатною

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = vulnerability шару { $i } має бути скінченною і >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = vector_weight шару { $i } має бути скінченною і >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } поза діапазоном (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials має бути >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | шарів: { $layers } (базовий { $primary }) | еталонна інтенсивність { $reference_intensity } | коефіцієнт стійкості за замкненою формою { $ratio_closed_form }x Монте-Карло { $ratio_mc_independent }x (багатошаровий проти одношарового) | кореляція нівелює багатошаровість: коефіцієнт { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | апріорний довірчий інтервал [{ $ratio_lo }-{ $ratio_hi }]x | виживання за вектором @ еталонне глушіння { $surv }% спуфінг { $surv2 }% кінетичне { $surv3 }% кібер { $surv4 }% (найгостріший { $sharpest }) | основний результат ~7x MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = невідоме центральне тіло { $name }: очікується планета, Плутон, Місяць або велика супутниця планети (earth, moon, mars, europa, titan, ...; див. crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = оболонка Волкера потребує total > 0 і planes > 0

engine-e-constellation-walker-total-is-not-multiple = total Волкера { $total } не кратне planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = фазування Волкера F = { $phasing } має лежати в 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } не є розширюваним слотом GPS (SPS PS Table 3.2-2 перелічує B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: задайте altitude_km або semi_major_axis_km, але не обидва

engine-e-constellation-needs-altitude-km-or-semi = { $what }: потрібен altitude_km або semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: велика піввісь { $v1 } km не перевищує радіус { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: ексцентриситет { $e } має лежати в [0, { $lit_0_9 })

engine-e-constellation-perigee-is-below-the-surface = { $what }: перигей нижче за поверхню { $name }

engine-e-constellation-constellation-preset-is-an-earth = орбітальне угруповання { $name }: пресет { $p } є земним орбітальним угрупованням, а тіло — { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = орбітальне угруповання { $name }: невідомий пресет { $other } (очікується gps-baseline, gps-expandable, galileo, beidou, beidou-meo або glonass)

engine-e-constellation-constellation-expanded-applies-only-to = орбітальне угруповання { $name }: `expanded` застосовується лише до пресета gps-expandable

engine-constellation-constellation-shell = орбітальне угруповання { $name } оболонка { $v2 }

engine-constellation-explicit-element-sets = явних наборів елементів: { $satellite }

engine-constellation-constellation-satellite = орбітальне угруповання { $name } супутник { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = орбітальне угруповання { $name } не має супутників: задайте пресет, [[constellation.shell]] або [[constellation.satellite]]

engine-e-constellation-no-constellation-given = орбітальне угруповання не задано

## src/constellation.rs

engine-e-constellation-constellations-with-one-clock-each = кількість орбітальних угруповань з одним годинником кожне ({ $constellations }) перевищує межу годинників ({ $MAX_CLOCKS }); задайте clock = "common" або об'єднайте орбітальні угруповання

engine-e-constellation-must-be-finite = { $what } має бути скінченним

engine-e-constellation-need-step-and-duration-step = потрібні step_s > 0 і duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = понад 100 000 епох; збільште step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg має лежати в [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold має бути додатним

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg має лежати в [{ $lit_0_25 }, 90]

engine-e-constellation-need-90-lat-min-deg = потрібно -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = потрібно lon_min_deg < lon_max_deg, діапазон не більш ніж 360 deg

engine-e-constellation-give-at-least-one-constellation = задайте щонайменше одне [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points обмежено значенням 2000

engine-e-constellation-satellites-exceeds-the-50-000 = кількість супутників { $total } перевищує межу 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: супутників { $total } ({ $names }) навколо { $name }; доступність { $global_availability_pct }% (PDOP <= { $pdop_threshold } при масці { $mask_deg } deg), найгірший пункт { $worst_site_availability_pct }%, медіанний PDOP { $cov }, середня кількість у видимості { $global_mean_visible }; вузлів сітки: { $grid_points } x епох: { $epochs } (MODELLED)

engine-constellation-constellation-coverage-over-the = Покриття орбітального угруповання над { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } має бути скінченним і додатним

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } має бути скінченним і >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw має бути скінченним

engine-e-contact-schedule-satellite-altitude-km-must-be = супутник '{ $name }': altitude_km має бути в (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = супутник '{ $name }': inclination_deg має бути в [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = супутник '{ $name }': backlog_mbit має бути >= 0

engine-e-contact-schedule-satellite-priority-must-be = супутник '{ $name }': priority має бути > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = супутник '{ $name }': eirp_dbw має бути скінченним

engine-e-contact-schedule-station-lat-deg-in-90 = станція '{ $name }': lat_deg у [-90, 90], lon_deg скінченний

engine-e-contact-schedule-station-mask-deg-must-be = станція '{ $name }': mask_deg має бути в [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = станція '{ $name }': alt_m має бути в [0, 3000] (діапазон ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = станція '{ $name }': setup_s >= 0 і g_over_t_db скінченний

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours має бути в (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s має бути в (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = потрібні щонайменше один супутник і одна станція

engine-e-contact-schedule-at-most-32-satellites-and = щонайбільше 32 супутники і 32 станції

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: супутників { $satellites } x станцій { $stations } за { $duration_hours } h -> кандидатів на сеанс: { $cands }, заплановано: { $greedy }; доставлено { $total_del } з { $total_backlog } Mbit{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: проходів: { $pairs }; ACM { $acm } Mbit проти CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = потрібні щонайменше 2 випробування і скінченна sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total має бути в (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = немає локальної системи координат у користувача

engine-e-dop-error-ci-singular-geometry = { $name }: вироджена геометрія

engine-e-dop-error-ci-no-noise-free-fix = { $name }: немає безшумового розв'язку

engine-e-dop-error-ci-no-fix = { $name }: немає розв'язку

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: вироджена геометрія

engine-e-dop-error-mc-no-fix = { $label }: немає розв'язку

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km має бути додатним; отримано { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes і sats_per_plane мають бути ненульовими

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz має бути додатним; отримано { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency має бути в (0, 1]; отримано { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k має бути додатним; отримано { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db має бути невід'ємним; отримано { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m має бути поза Землею; отримано { $range_m }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Лімб Землі з орбітального угруповання: { $earth_limb_half_angle_deg } deg від надира — будь-який промінь до Місяця має перевищувати це значення{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }найкращий канал { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }кожна лінія візування, що супроводжується, лежить усередині напівконуса { $a } deg — геометрія майже вироджена{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }РОЗГОРТКА за епохами: { $epochs } / { $span_s } s: доступність сигналу { $signal_availability }, доступність FIX { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }каналів, що супроводжуються: середнє { $mean_trackable }, макс. { $max_trackable }; найкраще C/N0 { $w }; найкращий PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = потрібно від одного до шести ступенів

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg має бути скінченним і невід'ємним

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 має бути скінченним і невід'ємним

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg має бути скінченним і невід'ємним

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m має бути скінченним і невід'ємним

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg має бути в [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s має бути скінченним і невід'ємним

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = тягоозброєність під час старту { $tw } має перевищувати 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ідеальна dv { $ideal_dv_m_s } m/s, втрати { $losses } m/s (гравітаційні { $gravity_loss_m_s }, аеродинамічні { $drag_loss_m_s }, на керування { $steering_loss_m_s }, протитиск { $back_pressure_loss_m_s }); вигоряння { $r } km при { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } має бути скінченним і додатним

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body має бути "earth" або "mars", отримано "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = атмосфера "{ $a }" недоступна для тіла "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg має бути в (0, 90) (додатний донизу)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m має бути в [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg має бути скінченним, з |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg і longitude_deg мають бути скінченними

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag має бути в [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg має бути скінченним

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s має бути в (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m має бути в [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s має бути в (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame має бути inertial|relative, отримано "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> пік { $pk_g } g на { $r } km, пік q { $r2 } W/cm² на { $r3 } km, теплове навантаження { $r4 } J/cm², пік q_dyn { $r5 } kPa; { $outcome } на { $end_time_s } s (замкнена форма { $cf_g } g; MODELLED 3-DoF, без радіаційного/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } має бути в (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } має бути скінченним і невід'ємним

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg має бути в [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits має бути в 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (заповнення комірки { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = кут надира { $eta_rad }° перевищує кутовий радіус Землі { $rho }° (повз Землю)

engine-e-eo-payload-no-sun-synchronous-inclination-at = немає сонячно-синхронного нахилу на { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg має бути в (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad має бути скінченним і додатним

engine-e-eo-payload-half-fov-too-large = half_fov завеликий: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> смуга захоплення { $v3 } km, GSD в надирі { $gsd } m, доступ до { $v5 } km від надира; крок вузлів { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = барицентр Земля–Місяць із { $table }, розділений місячним рядом Монтенбрука та Гілла, прецесованим до J2000

engine-ephem-provider-jpl-mean-elements-in-the = середні елементи JPL у площині Лапласа, швидкість середньої довготи з IAU-швидкості синхронного обертання, додані до своєї планети з { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = IAU-напрям синхронного обертання на середній відстані JPL, доданий до Сатурна з { $table }

engine-e-ephem-provider-read = читання { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = у TLE бракує рядка 1 (рядка, що починається з `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = у TLE бракує рядка 2 (рядка, що починається з `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = аналітичні ефемериди `orbit` потребують `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = сценарій ефемерид потребує `tle` або `orbit`

engine-e-ephemeris-step-must-be-positive = step_s має бути додатним

engine-e-ephemeris-duration-must-be-non-negative = duration_s має бути невід'ємним

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz має бути додатною скінченною частотою

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` не є скінченним

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` не є ні секундами, ні часом UTC за ISO-8601

engine-e-evidence-assemble-no-epoch-of-the-log = жодна епоха журналу не припадає між { $t0 } s і { $t1 } s (журнал охоплює від 0 до { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config не є об'єктом

engine-e-evidence-assemble-config-json-already-has-an = config.json уже має запис `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = від { $from_s } до { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` не є часом UTC на кшталт 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } у журналі (байтів: { $log_bytes })

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } потребує значення

engine-e-evidence-cli-cannot-create = не вдалося створити { $path }: { $e }

engine-e-evidence-cli-cannot-write = не вдалося записати { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = попередження: { $path } доступний для читання іншим користувачам; обмежте доступ (chmod 600)

engine-e-evidence-cli-cannot-read-key = не вдалося прочитати ключ { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } не є шістнадцятковим ключем

engine-e-evidence-cli-must-hold-32-byte-key = { $path } має містити 32-байтовий ключ у вигляді 64 шістнадцяткових цифр

engine-e-evidence-cli-cannot-read = не вдалося прочитати { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = не вдалося прочитати { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } існує і не порожній

engine-e-evidence-cli-cannot-create-2 = не вдалося створити { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = попередження: { $arg } доступний лише власнику (режим 600) і не названий *.pub: це може бути закритий ключ. Передайте файл відкритого ключа.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` не є ні 64 шістнадцятковими цифрами, ні читабельним файлом ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` не містить шістнадцяткових цифр

engine-evidence-cli-private-key-keep-it-secret = закритий ключ: { $out }  (тримайте його в таємниці; ніколи не фіксуйте в репозиторії)

engine-evidence-cli-public-key-pub = відкритий ключ:  { $out }.pub

engine-evidence-cli-public-key-hex = відкритий ключ (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Передайте тим, хто перевіряє, відкритий ключ довіреним шляхом; вони закріплюють його через --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify потребує теки пакета

engine-e-evidence-cli-cannot-read-3 = не вдалося прочитати { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: сертифікат PEM не знайдено

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }підпис органу позначок часу не перевірено Kshana

engine-evidence-cli-this-is-technical-record-not = Це технічний запис, а не юридичний висновок.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp потребує теки пакета

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp потребує файлу токена

engine-e-evidence-cli-cannot-read-4 = не вдалося прочитати { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = не вдалося записати { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = примітка: токен лежить поруч із підписаним маніфестом, а не всередині нього; щоб його вимагати, перевіряйте з --require-timestamp.

engine-e-evidence-cli-round-trip-packs-are-not = пакети round-trip не збираються для WebAssembly

engine-e-evidence-cli-needs-scenario-path = потрібен шлях до сценарію

engine-e-evidence-cli-needs-from = потрібен --from

engine-e-evidence-cli-needs-to = потрібен --to

engine-e-evidence-cli-cannot-read-lab-attestation = не вдалося прочитати лабораторне підтвердження { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = не вдалося прочитати { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = недійсний сценарій receiver-trust: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation застосовується до `receiver-trust evidence`, а не до `evidence round-trip` (пакет якого фіксує умови випробування)

engine-e-evidence-cli-cannot-read-6 = не вдалося прочитати { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = не вдалося прочитати { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = пакет доказів записано до { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }епох у вікні: { $epochs_in_window }  ({ $from_s } s до { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }відбиток підписувача: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 файлу manifest.json (його має засвідчити орган RFC 3161): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }зріз журналу: байти { $a } до { $b } з { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }зріз журналу: увесь журнал (цей журнал не задає діапазону байтів для вікна)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }лабораторне підтвердження записано в підписаний маніфест ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Пакет — це технічний запис, а не юридичний висновок.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = від { $from_s } s до { $to_s } s після першої епохи журналу

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = недійсний TOML lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` має бути таблицею

engine-e-evidence-lab-invalid-lab-attestation = недійсний lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } обов'язкове

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } перевищує { $MAX_FIELD } байтів

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: дата { $date } не є днем на кшталт 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: екранована установка потребує enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup має бути "conducted" або "shielded" (отримано { $other }); установка з випромінюванням в ефір не приймається як лабораторний прогін

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db має бути скінченним

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = умови випробування задають подій: { $events }, а оцінюваний сценарій має { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = подія '{ $id }' в умовах випробування ({ $onset_s } s до { $offset_s } s) не відповідає '{ $label }' в оцінюваному сценарії ({ $onset_s2 } s до { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = SHA-256 журналу ({ $have }) не той, що задано в умовах випробування ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = усічений DER

engine-e-evidence-tsa-bad-der-length = хибна довжина DER

engine-e-evidence-tsa-unexpected-der-tag = { $what }: неочікуваний тег DER { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = порожній AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = хибний UTCTime

engine-e-evidence-tsa-bad-generalizedtime = хибний GeneralizedTime

engine-e-evidence-tsa-bad-time = хибний час

engine-e-evidence-tsa-time-not-in-utc = час не в UTC

engine-e-evidence-tsa-bad-time-digits = хибні цифри часу

engine-e-evidence-tsa-bad-bit-string = хибний BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: очікується три елементи

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: закороткий

engine-e-evidence-tsa-empty-extension = порожній Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: значення не є OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: порожнє

engine-e-evidence-tsa-validity-short = Validity: закоротке

engine-e-evidence-tsa-pem-end-without-begin = PEM: END без BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: хибний base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: хибна довжина base64

engine-e-evidence-tsa-spki-empty = SPKI: порожній

engine-e-evidence-tsa-spki-no-oid = SPKI: немає OID

engine-e-evidence-tsa-spki-no-key = SPKI: немає ключа

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: очікується два цілих числа

engine-e-evidence-tsa-unsupported-elliptic-curve = непідтримувана еліптична крива

engine-e-evidence-tsa-unsupported-public-key-algorithm = непідтримуваний алгоритм відкритого ключа

engine-e-evidence-tsa-rsa-key-or-signature-too = ключ або підпис RSA завеликий

engine-e-evidence-tsa-rsa-modulus-not-odd = модуль RSA не є непарним

engine-e-evidence-tsa-rsa-signature-out-of-range = підпис RSA поза діапазоном

engine-e-evidence-tsa-rsa-key-too-small = ключ RSA замалий

engine-e-evidence-tsa-invalid-padding = хибне доповнення

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: закодоване повідомлення задовге

engine-e-evidence-tsa-last-octet-invalid = останній октет хибний

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: крайні ліві біти не нульові

engine-e-evidence-tsa-pss-bad-padding = PSS: хибне доповнення

engine-e-evidence-tsa-pss-signature-mismatch = PSS: підпис не збігається

engine-e-evidence-tsa-unsupported-mask-generation-function = непідтримувана функція генерації маски

engine-e-evidence-tsa-mgf1-without-hash = MGF1 без хеша

engine-e-evidence-tsa-bad-pss-salt-length = хибна довжина солі PSS

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = підпис ECDSA потребує ключа EC

engine-e-evidence-tsa-an-rsa-signature-needs-an = підпис RSA потребує ключа RSA

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption без алгоритму дайджесту

engine-e-evidence-tsa-an-rsa-pss-signature-needs = підпис RSA-PSS потребує ключа RSA

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey без алгоритму дайджесту

engine-e-evidence-tsa-unsupported-signature-algorithm = непідтримуваний алгоритм підпису

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: порожній

engine-e-evidence-tsa-time-stamp-request-not-granted = запит позначки часу не задоволено

engine-e-evidence-tsa-no-time-stamp-token-in = у відповіді немає токена позначки часу

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = не є TimeStampResp або TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = не є CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: немає вмісту

engine-e-evidence-tsa-signeddata-short = SignedData: закороткий

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: порожній

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = інкапсульований вміст не є TSTInfo

engine-e-evidence-tsa-no-tstinfo = немає TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo не в OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: закороткий

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: немає genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: немає signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = очікується рівно один SignerInfo

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: немає sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: немає алгоритму дайджесту

engine-e-evidence-tsa-signerinfo-short = SignerInfo: закороткий

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: немає підписаних атрибутів

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: немає алгоритму підпису

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: немає підпису

engine-e-evidence-tsa-no-serial = немає серійного номера

engine-e-evidence-tsa-signer-certificate-not-found = сертифікат підписувача не знайдено

engine-e-evidence-tsa-attribute-empty = Attribute: порожній

engine-e-evidence-tsa-attribute-no-values = Attribute: немає значень

engine-e-evidence-tsa-attribute-no-value = Attribute: немає значення

engine-e-evidence-tsa-content-type-attribute-mismatch = атрибут content-type не збігається

engine-e-evidence-tsa-digest-failure = збій дайджесту

engine-e-evidence-tsa-signature-not-an-octet-string = підпис не є OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = відсутній атрибут ess signing certificate

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: порожній

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id не знайдено

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: немає хеша

engine-e-evidence-tsa-unsuitable-certificate-purpose = непридатне призначення сертифіката

engine-e-evidence-tsa-certificate-is-not-yet-valid = сертифікат ще не дійсний

engine-e-evidence-tsa-certificate-has-expired = строк дії сертифіката минув

engine-e-evidence-tsa-invalid-ca-certificate = недійсний сертифікат CA

engine-e-evidence-tsa-certificate-chain-too-long = ланцюжок сертифікатів задовгий

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: порожній

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: немає дайджесту

engine-e-evidence-tsa-message-imprint-mismatch = відбиток повідомлення не збігається

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER із невизначеною довжиною не підтримується

engine-e-evidence-tsr-expected-tag-found = очікувалося { $what } (тег { $tag }), знайдено { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = некоректний PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = відповідь із позначкою часу не було задоволено

engine-e-evidence-tsr-not-timestamp-token = не є токеном позначки часу

engine-e-evidence-tsr-the-token-content-type-is = тип вмісту токена не є CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = токен не містить TSTInfo

## src/evidence/tsr.rs

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = відбиток повідомлення використовує непідтримуваний алгоритм хешування

engine-e-evidence-tsr-the-imprint-is-bytes-not = відбиток має байтів: { $digest }, а не { $want_len }, як дає { $hash_alg }

engine-e-evidence-tsr-gentime-is-not-utc = genTime не в UTC

engine-e-evidence-tsr-malformed-gentime = некоректний genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime не є дійсним календарним часом

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = не шістнадцяткове в нижньому регістрі

engine-e-evidence-verify-expected-bytes-found = очікувалося байтів: { $N }, знайдено { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = пакет уже має токен позначки часу; щоб замінити його, передайте --replace

engine-e-evidence-verify-not-attached-the-pack-with = не приєднано: пакет із цим токеном не проходить перевірку ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = пакет фіксує лабораторне підтвердження від { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = файл підпису не закінчується символом нового рядка

engine-evidence-verify-signer-not-pinned-the-signature = підписувача не закріплено: підпис доводить, що пакет цілий щодо ключа { $r }, який пакет називає сам. Порівняйте цей відбиток з отриманим від підписувача або передайте ключ.

engine-evidence-verify-range-is-not-inside-log = діапазон { $start }..{ $end } не міститься в журналі (байтів: { $full_bytes })

engine-evidence-verify-timestamp-token-states-its-imprint = токен позначки часу вказує { $gen_time }; його відбиток { $v2 } manifest.json. Підпис органу позначок часу не перевірено Kshana: перевірте його за допомогою `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = токен позначки часу вказує { $gen_time }; його відбиток { $v2 } manifest.json; підпис органу позначок часу та ланцюжок { $v3 } щодо наданих якорів.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` є порожнім рядком

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } поза словником

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = діапазон вартості має бути скінченним, невід'ємним, упорядкованим low≤nominal≤high і мати джерело

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction і availability мають бути частками в [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } має бути скінченним і > 0, отримано { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } має бути скінченним і >= 0, отримано { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg має бути в [-90, 90), отримано { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = орбітальне угруповання не має супутників

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats має бути >= 1, якщо задано

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = супутник зриву { $sat } поза діапазоном

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = рядок { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = рядок { $lineno }: стовпців { $v }, очікувалося щонайменше { $min }

engine-e-fusion-kfgins-line-columns = рядок { $v1 }: стовпців { $v }

engine-e-fusion-kfgins-line-block-lists-are-not = рядок { $lineno }: блокові списки не підтримуються

engine-e-fusion-kfgins-line-expected-key-value = рядок { $lineno }: очікувалося `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = рядок { $lineno }: ключ із відступом без батьківського

engine-e-fusion-kfgins-line-only-one-level-of = рядок { $lineno }: підтримується лише один рівень вкладеності

engine-e-fusion-kfgins-line-unterminated-flow-list = рядок { $lineno }: незавершений потоковий список

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` є списком, очікувався скаляр

engine-e-fusion-kfgins-missing = `{ $k }` відсутнє

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` має бути списком із трьох елементів

engine-e-fusion-kfgins-no-imu-sample-at-or = немає відліку IMU на starttime або після нього

engine-e-fusion-kfgins-imu-time-not-increasing-at = час IMU не зростає на { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } має бути скінченним і > 0, отримано { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m має бути скінченним і > 0, отримано { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg має бути в [-90, 90), отримано { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = рядок { $v1 } csv траєкторії: не числа: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = рядок { $v1 } csv траєкторії: очікувалося 10 стовпців, отримано { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = рядок { $v1 } csv траєкторії: час не зростає

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = csv траєкторії потребує щонайменше двох рядків

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = csv траєкторії охоплює { $rows } s, але сценарій триває { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg пункту має бути в [-90, 90], і кожне поле скінченне

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" не є ні пресетом GNSS ({ $e_gnss }), ні пресетом LEO ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: задайте користувача як `site` або `user_ecef_m`, але не обидва

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m має бути скінченним і не збігатися з геоцентром

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: супутник { $id }: азимут/висота поза діапазоном

engine-e-geometry-sky-satellite-is-given-in = sky: супутник { $id } заданий в ECEF; запит потребує `site` або `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: супутник { $id }: положення ECEF не скінченне

engine-e-geometry-sky-satellite-coincides-with-the = sky: супутник { $id } збігається з користувачем

engine-e-geometry-sky-satellite-give-az-deg = sky: супутник { $id }: задайте az_deg і el_deg, або ecef_m, і більше нічого

engine-e-geometry-sky-tle-is-bytes-the = sky: розмір tle (байтів): { $text }; обмеження { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = набір елементів відхилено: { $e }

engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. і ще { $more }

engine-e-geometry-sky-give-systems-or-tle = sky: задайте `systems` або `tle` (із `site`), або `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system називає супутники `tle`; у запиті немає `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg має бути в [-90, 90), отримано { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` потребує `site` (або `user_ecef_m`), з якого дивитися

engine-e-geometry-sky-time-must-be-finite = sky: time_s має бути скінченним

engine-e-geometry-sky-system-asks-for-satellites = sky: система "{ $name }" запитує супутників: { $asked }; запит містить щонайбільше { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: більше ніж { $MAX_SATELLITES } супутників

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` потребує `site` (або `user_ecef_m`), з якого дивитися

engine-e-geometry-sky-more-than-satellites-above = sky: більше ніж { $MAX_SATELLITES } супутників над горизонтом

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m має бути додатним, отримано { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence має бути в (0, 1), отримано { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: понад { $MAX_CLOCKS } систем у видимості, кожна зі своїм годинником; згрупуйте супутники під меншою кількістю міток `system` або використайте clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n має бути в 1..={ $MAX_MC_SAMPLES }, отримано { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: замало супутників у видимості для розв'язку; хмари Монте-Карло немає

engine-e-geometry-sky = sky: { $e }

engine-geometry-tle-sky-at-not-measurement = небо за TLE на { $e }, а не вимірювання

engine-e-geometry-invalid-sky-request-json = недійсний запит sky (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = недійсний запит sky (TOML): { $e }

engine-e-geometry-invalid-skyline-json = недійсний skyline (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = недійсний skyline (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = хибний PRN GLONASS у { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = тип сторінки { $pt } тут не кодується

engine-e-gnss-navmsg-gal-fnav-bits-expected = бітів: { $data }, очікувалося { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = бітів: { $p }, очікувалося { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = хвостові біти не нульові

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q не збігається

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = тип сторінки { $pt } тут не декодується

engine-e-gnss-navmsg-gal-fnav-symbols-expected = символів: { $symbols }, очікувалося { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = шаблон синхронізації не знайдено

engine-e-gnss-navmsg-gal-fnav-page-type-missing = тип сторінки { $t } відсутній

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav типу сторінки { $t } відрізняється від типу сторінки 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = немає поля Galileo { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = тип слова { $wt } тут не кодується

engine-e-gnss-navmsg-gal-inav-bits-expected = бітів: { $word }, очікувалося { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = тип слова { $wt } тут не декодується

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = частини сторінки мають бути по 120 бітів

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = прапорці парна/непарна не є 0, а потім 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = не номінальна сторінка (тип сторінки 1 є сторінкою тривоги)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = бітів: { $part }, очікувалося { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = символів: { $symbols }, очікувалося { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = тип слова { $t } відсутній

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav типу слова { $t } відрізняється від типу слова 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = запис належить системі { $system }, а не Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = тип 10 не має поля { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = тип 11 не має поля { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = тип 30 не має поля { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = тіло CNAV має бітів: { $body }, очікувалося 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } або лічильник TOW { $tow_count } поза діапазоном

engine-e-gnss-navmsg-gps-cnav-bits-expected = бітів: { $bits }, очікувалося { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = преамбула не дорівнює 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = тип повідомлення { $t } тут не декодується

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = потрібні повідомлення типу 10 і типу 11

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } при LSB { $value2 } не вміщується в бітів: { $bits } { $v4 }

engine-e-gnss-navmsg-bits-layout-needs = бітів: { $bits }, макет потребує { $need }

engine-e-gnss-navmsg-no-field = немає поля { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } при масштабі 2^{ $scale_pow2 } не вміщується в бітів: { $bits } { $v1 }

engine-e-gps-lnav-no-value-for = немає значення для { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: еталонна модель "gfc" потребує `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: не вдалося прочитати gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: невідома еталонна модель `{ $other }` (використовуйте "egm2008" або "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: невідомий еліпсоїд `{ $other }` (використовуйте "wgs84" або "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations має бути щонайменше 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations обмежено значенням 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = хибне дійсне число '{ $t }'

engine-e-gravity-pds-bad-integer = хибне ціле число '{ $t }'

engine-e-gravity-pds-empty-shadr-table = порожня таблиця SHADR

engine-e-gravity-pds-shadr-header-has-fields-expected = заголовок SHADR має полів: { $f }, очікувалося щонайменше 6

engine-e-gravity-pds-shadr-header-negative-degree-order = заголовок SHADR: від'ємний степінь/порядок або невідома нормалізація

engine-e-gravity-pds-shadr-normalization-state-only-fully = стан нормалізації SHADR { $normalization } (підтримується лише повністю нормалізований, стан 1)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = еталонні довгота/широта SHADR мають бути 0

engine-e-gravity-pds-non-physical-gm-must-be = нефізичне GM (має бути скінченним і додатним)

engine-e-gravity-pds-non-physical-reference-radius-must = нефізичний еталонний радіус (має бути скінченним і додатним)

engine-e-gravity-pds-shadr-record-fields = запис SHADR { $v1 }: полів { $f }

engine-e-gravity-pds-shadr-record-bad = запис SHADR { $v1 }: хибне (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = запис SHADR { $v1 }: нескінченний коефіцієнт

engine-e-gravity-pds-no-shadr-coefficient-records = немає записів коефіцієнтів SHADR

engine-e-gravity-pds-shadr-table-incomplete-missing = таблиця SHADR неповна: бракує (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = відсутнє earth_gravity_constant / gravity_constant

engine-e-gravity-sh-missing-radius = відсутній radius

engine-e-gravity-sh-non-physical-earth-gravity-constant = нефізичне earth_gravity_constant (має бути скінченним і додатним)

engine-e-gravity-sh-non-physical-radius-must-be = нефізичний radius (має бути скінченним і додатним)

engine-e-gravity-sh-no-gfc-coefficient-lines = немає рядків коефіцієнтів gfc

engine-e-gravity-sh-read-error = помилка читання: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = рядок { $lineno }: norm { $v } не підтримується (лише fully_normalized)

engine-gravity-sh-line-bad = рядок { $lineno }: хибне { $what }

engine-e-gravity-sh-line-degree-above-the-declared = рядок { $lineno }: степінь { $n } вищий за оголошений max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = рядок { $lineno }: порядок { $m } вищий за степінь { $n }

engine-e-gravity-sh-line-time-variable-term-is = рядок { $lineno }: змінний у часі член `{ $key }` не підтримується (лише статичні моделі)

engine-e-gravity-sh-missing-end-of-head = відсутній end_of_head

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s має бути додатним, отримано { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s має бути додатним, отримано { $duration_s }

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = запис містить нескінченну похибку часу

engine-e-holdover-test-unknown-mask-expected-one-of = невідома маска { $id }; очікується одна з: { $masks }

engine-e-holdover-test-every-budget-max-abs-te = кожен max_abs_te_ns бюджету має бути скінченним і додатним

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } лежить поза записом ({ $t0_s } до { $t_end } s на його власній осі часу)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } має бути пізнішим за gnss_removed_s ({ $gnss_removed_s }) і не виходити за кінець запису ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = крок holdover не містить жодного відліку

engine-holdover-test-the-record-has-no-step = у записі немає кроку { $step }: GNSS було вилучено на його першому відліку

engine-holdover-test-the-step-has-samples-the = крок { $step } має відліків: { $te_ns }; оцінювачам потрібно щонайменше 13

engine-e-holdover-test-step-with-mask-has-no = крок із маскою не має кривої

engine-e-holdover-test-cannot-read-csv-path = не вдалося прочитати csv_path { $path }: { $e }

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks } (MODELLED, виміряно щодо маски)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m має бути скінченним і > 0, отримано { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba має бути >= 0, а coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: дві гілки не мають спільного часу усереднення. Оптична гілка накопичує за integration_s = { $integration_s } s; ширина шумової смуги петлі РЧ-гілки B_L = { $dll_bandwidth_hz } Hz усереднює за 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Відношення двох сигм, узятих за різних часів усереднення, не є порівнянням, тож жодного не наводиться. Приберіть перевизначення rf_dll_bandwidth_hz (тоді за замовчуванням буде 1/(2*integration_s)) або задайте його { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: гілка не є придатною додатною скінченною сигмою (оптична { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), тож відношення не утворюється.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = невідомий rf_band '{ $other }' (очікується s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } має бути скінченним

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db має бути скінченним і >= 0

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa має бути в [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class має бути >= 1

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = невідомий детектор '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = невідомий imu_grade { $other }; очікується один з: navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = невідома combination { $other }; очікується одна з: rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = невідомий trn_fix_mode { $other }; очікується один з: none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } має бути скінченним і невід'ємним (отримано { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m має називати щонайменше один поріг

engine-e-inertial-coast-crossing-thresholds-entries-must-be = записи crossing_thresholds_m мають бути скінченними і додатними (отримано { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades має називати щонайменше один клас IMU

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s має бути скінченним і невід'ємним (отримано { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 має бути скінченним і невід'ємним (отримано { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg має бути скінченним і в межах (-89, 89) (отримано { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m має бути в межах [-1000, 100000] (отримано { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s має бути додатним

engine-e-inertial-coast-drift-band-must-satisfy-lo = смуга дрейфу має задовольняти 0 < lo < hi (отримано lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = серіалізація результату ins-trn-coast: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | IMU { $grade }, { $speed } m/s, комбінація { $comb } | { $heads } | TRN { $mode } пік { $peak_error_m } m за { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va виведено з фізики холодноатомної інтерферометрії)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = розмір сценарію (байтів): { $toml_text }, що перевищує межу в { $max_bytes }

engine-e-inline-only-the-scenario-kind-reads-its = вид сценарію `{ $kind }` читає дані з файлів на хості, тому ця поверхня його не виконує; використайте командний рядок `kshana`

engine-e-inline-only-the-field-names-file-this = поле `{ $k }` називає файл: ця поверхня приймає лише вбудований вміст

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-trace-json = trace JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = невідомий набір даних `{ $key }`; затверджені: { $v1 } або власний набір даних

engine-e-interference-map-api-dataset-is-data-but-the = набір даних `{ $key }` має вид { $kind }, але вид входу — { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } не є датою у форматі YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = невідомий параметр `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = очікувалося позиційних аргументів: { $positionals }, отримано { $pos }

engine-e-interference-map-cli-cannot-read = не вдалося прочитати { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom потребує { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } уже існує; Kshana не перезаписує карти. Видаліть його або виберіть інший каталог --out

engine-interference-map-cli-note-cell-deg-is-not = примітка: --cell-deg { $cell_deg } не є попередньо зареєстрованим розміром клітинки ({ $PREREGISTERED_CELL_DEG }); про це сказано на картах

engine-e-interference-map-cli-cannot-create = не вдалося створити { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = записано { $path }: опубліковано клітинок: { $cells }, позначено: { $n_deg }

engine-interference-map-cli-no-usable-rows-nothing-written = немає придатних рядків: нічого не записано

engine-e-interference-map-cli-unknown-subcommand = невідома підкоманда `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = SHA-256 завантаженого файлу ({ $got }) не збігається із закріпленим значенням ({ $expected }); файл відкинуто

engine-e-interference-map-cli-cannot-write = не вдалося записати { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl не знайдено в PATH. Установіть curl або завантажте { $NATURAL_EARTH_LAND_URL } самостійно і перевірте, що його SHA-256 дорівнює { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = не вдалося запустити curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = записано { $out }: полігони суші Natural Earth, SHA-256 перевірено (суспільне надбання, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = немає файлів trace_full_* у { $path }

engine-e-interference-map-cli-cannot-read-2 = не вдалося прочитати { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } не є датою у форматі YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: хибна дата карти

engine-e-interference-map-cli-cannot-write-2 = не вдалося записати { $out }: { $e }

engine-interference-map-cli-route-length-km = довжина маршруту { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Застереження: погіршена клітинка не визначає завади як причину; клітинки, які не спостерігалися, не є доказом чистого маршруту; це не прогноз.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = полігони суші: недійсний JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = відсутній обов'язковий стовпець `{ $name }`

engine-e-interference-map-cannot-read-input = не вдалося прочитати вхідні дані: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` не є датою (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours має бути { $MIN_DELAY_HOURS } або більше: обсерваторія не публікує раніше

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg має бути { $MIN_CELL_DEG } або грубішим: обсерваторія публікує лише грубі клітинки

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } ще не можна опублікувати: його продукт випускається не раніше { $fmt_utc } ({ $delay_hours } h після завершення доби)

engine-interference-map-observatory-kshana-observatory-ads = ОБСЕРВАТОРІЯ KSHANA  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = КЛІТИНКИ { $trim_deg } DEG  ДОБА UTC  NOT OBSERVED НЕ ОЗНАЧАЄ ЧИСТО  ПРИЧИНУ НЕ ВКАЗАНО

engine-interference-map-observatory-source-licence = ДЖЕРЕЛО { $dataset }  ЛІЦЕНЗІЯ { $dataset2 }

## src/interference_map/observatory.rs

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (опубліковані комірки)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Обсерваторія Kshana, карта навігаційної точності ADS-B, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = не вдалося створити { $path } (Kshana не перезаписує продукти): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = у вхідних даних немає придатного звіту за { $day } (знайдені дні: { $days })

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } уже існує; Kshana не перезаписує продукти

engine-interference-map-observatory-cells-published-degraded-incident = опубліковано комірок: { $p }, з них погіршених: { $p2 },інцидентів: { $p3 }

engine-interference-map-observatory-rows-replayed-under-variants = відтворено рядків: { $rows }, варіантів: { $variants }: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = карта не є коректним JSON: { $e }

engine-e-interference-map-route-route-invalid-json = маршрут: некоректний JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = маршрут: рядок { $v1 } не має вигляду `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Експорт Kshana { $v1 }. Епоха: { $epoch_note }. Рухомі об'єкти: GCRS (referenceFrame INERTIAL), метри, секунди після епохи. Нерухомі пункти: земна фіксована WGS 84 (referenceFrame FIXED), метри.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Положення: GCRS, метри.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Широта { $lat_deg } deg, довгота { $lon_deg } deg, висота { $h_m } m над еліпсоїдом WGS 84. Положення: земна фіксована система, метри.

engine-interop-czml-radius-along-the-ground = { $description }. Радіус { $radius_m } m уздовж поверхні землі.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Без часу: довгота і широта WGS 84 у градусах, притиснуті до поверхні землі.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Положення в земній фіксованій системі; MultiLineString розрізається на антимеридіані, а times_utc тоді містить лише вихідні відліки.

engine-interop-geojson-kshana-export-epoch = Експорт Kshana { $v1 }. Епоха: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = некоректний GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString не має масиву coordinates

engine-e-interop-geojson-an-rfc-7946-linestring-needs = LineString за RFC 7946 потребує двох або більше положень

engine-interop-geojson-position-is-not-an-array = положення { $i } не є масивом із двох або трьох чисел

engine-interop-geojson-position-longitude-is-not-number = положення { $i }: довгота не є числом

engine-interop-geojson-position-latitude-is-not-number = положення { $i }: широта не є числом

engine-e-interop-geojson-position-longitude-is-outside-180 = положення { $i }: довгота { $lon } поза межами [-180, 180] (у GeoJSON довгота йде першою)

engine-e-interop-geojson-position-latitude-is-outside-90 = положення { $i }: широта { $lat } поза межами [-90, 90] (у GeoJSON довгота йде першою)

engine-e-interop-geojson-track-needs-two-or-more = траєкторія потребує двох або більше шляхових точок

engine-e-interop-geojson-the-route-spans-more-than = маршрут охоплює понад 180 градусів довготи; види треків крокують у простих градусах і не можуть перетинати антимеридіан

engine-e-interop-geojson-position-is-deg-from-an = положення { $worst } відхиляється на { $worst2 } deg від рівномірно розміщеного прямого треку (допуск { $tol_deg } deg); види треків летять за схемою start + i*step, тож задайте рівномірно розміщені положення на прямій або лише два кінці

engine-e-interop-geojson-route-applies-to-the-kinds = маршрут застосовується до видів, що летять за треком шляхових точок (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` не приймає вхідних даних траєкторії

engine-e-interop-geojson-scenario-toml-is-not-table = TOML сценарію не є таблицею

engine-e-interop-geojson-cannot-serialise-scenario = не вдалося серіалізувати сценарій: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = невідомий формат експорту '{ $other }'; очікується один із czml, kml, geojson, stk, sigmf, all або list

engine-e-interop-member = елемент { $label }: { $e }

engine-interop-the-scenario-could-not-be = сценарій не вдалося експортувати: { $m }

engine-e-interop-invalid-spectrum-scenario = некоректний сценарій спектра: { $e }

## src/interop/scene.rs

engine-e-interop-scene-objects-samples-is-more-than = об'єктів: { $items } x відліків: { $times }, це більше, ніж записує експорт ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = некоректний сценарій { $kind }: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = джамер, тип: { $jammer_type }, потужність передавання { $power_dbw } dBW, коефіцієнт підсилення антени { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, за рівняннями лінії зв'язку виду глушіння, коли джамер перебуває на горизонті приймача, з втратами у вільному просторі

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (етап [pass] ланцюжка)

engine-interop-scene-circular-orbit-km-altitude-deg = колова орбіта, висота { $altitude_km } km, нахил { $inclination_deg } deg (середні елементи SGP4 на початку вікна, як їх поширює вид passes)

engine-interop-scene-ground-station-deg-elevation-mask = наземна станція, маска кута місця { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; стани в GCRS і в земній фіксованій системі є власним результатом виду ephemeris (UT1 і рух полюса, як їх задає сценарій)

engine-interop-scene-static-scene-the-kind-flies = статична сцена: вид { $kind } летить за треком шляхових точок без часу

engine-interop-scene-true-track-flown-gps-denied = істинний трек пройдено без GPS: шляхових точок: { $track }, від start_lat_deg/start_lon_deg із кроком step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` не має сцени

engine-e-interop-scene-missing-numeric = відсутнє числове значення `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = відсутнє ціле значення `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } поза межами 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f }, висота { $altitude_km } km, нахил { $inclination_deg } deg (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = сценарій не задає `epoch`; t = 0 є { $epoch }, найраніша епоха з власних даних супутників (епоха TLE, бортових ефемерид або SP3). Кожен супутник поширюється від власної епохи, і вони охоплюють { $spread_h } h: часові мітки відповідають припущенню рушія, що кожен супутник стартує при t = 0, тоді як кожне положення повертається в системи GCRS і земну фіксовану в момент власного часу цього супутника. Експорти SP3 і OEM натомість позначають t = 0 як 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = сценарій не задає `epoch`; t = 0 є { $epoch }, епоха з власних даних супутників (епоха TLE, бортових ефемерид або SP3). Експорти SP3 і OEM натомість позначають t = 0 як 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = об'єктів: { $satellites } x відліків: { $times_s }, це більше, ніж записує експорт ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = користувач, середовище: { $user_environment }, у русі (стала швидкість і курс виду)

engine-interop-scene-user-receiver = користувач, середовище: { $user_environment } (приймач)

engine-interop-scene-user-orbit-km-altitude-deg = орбіта користувача, висота { $altitude_km } km, нахил { $inclination_deg } deg (кеплерова{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = немає рухомого об'єкта { $index }

engine-interop-stk-kshana-export-object = # Експорт Kshana { $v1 }: { $scene }, об'єкт { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = джамер, тип: { $jammer_type }, потужність передавання { $power_dbw } dBW, коефіцієнт підсилення антени { $gain_dbi } dBi (параметр бюджету лінії зв'язку сценарію, а не сигнал)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` не має траєкторії транспортного засобу для експорту; експорт для test-bench охоплює види gnss-ins, jamming і gnss-sim

engine-e-interop-testbench-empty-motion-csv = порожній CSV руху

engine-e-interop-testbench-motion-csv-header-is-not = заголовок CSV руху не збігається з очікуваними стовпцями: { $head }

engine-e-interop-testbench-row-fields-expected = рядок { $v1 }: полів: { $f }, очікується: { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = рядок { $v1 }: стовпець { $motion_columns } не є числом

engine-e-interop-testbench-line-no = рядок { $v1 }: немає `$`

engine-e-interop-testbench-line-no-checksum = рядок { $v1 }: немає контрольної суми

engine-e-interop-testbench-line-bad-checksum-field = рядок { $v1 }: хибне поле контрольної суми

engine-e-interop-testbench-line-checksum-mismatch = рядок { $v1 }: контрольна сума не збігається

engine-e-interop-testbench-line-short-gga = рядок { $v1 }: короткий GGA

engine-interop-testbench-line-bad-latitude = рядок { $v1 }: хибна широта

engine-interop-testbench-line-bad-longitude = рядок { $v1 }: хибна довгота

engine-e-interop-testbench-line-bad-altitude = рядок { $v1 }: хибна висота

engine-e-interop-testbench-line-bad-separation = рядок { $v1 }: хибне відокремлення геоїда

engine-e-interop-testbench-line-short-rmc = рядок { $v1 }: короткий RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = рядок { $v1 }: RMC без попереднього GGA

engine-e-interop-testbench-line-gga-and-rmc-times = рядок { $v1 }: час GGA і RMC відрізняється

engine-e-interop-testbench-line-bad-speed = рядок { $v1 }: хибна швидкість

engine-e-interop-testbench-line-bad-course = рядок { $v1 }: хибний курс

engine-e-interop-testbench-line-bad-time-or-date = рядок { $v1 }: хибний час або дата

engine-e-interop-testbench-gga-with-no-following-rmc = GGA без наступного RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = файл шляхових точок потребує щонайменше двох відліків

engine-e-interop-testbench-the-sample-step-is-not = крок відліків { $step } s не є цілим числом мілісекунд

engine-e-interop-testbench-the-samples-are-not-equally = відліки розміщені нерівномірно: інтервал { $v1 } дорівнює { $dt } s, перший дорівнює { $step } s

engine-e-interop-testbench-empty-waypoint-file = порожній файл шляхових точок

engine-e-interop-testbench-waypoint-not-three-numbers = шляхова точка { $v1 }: не три числа

engine-e-interop-testbench-waypoint-fields-expected = шляхова точка { $v1 }: полів: { $f }, очікується 3

engine-e-interop-testbench-events-csv-header-is-not = заголовок CSV подій не має вигляду label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = рядок події { $v1 }: очікується 5 полів

engine-e-interop-testbench-event-row-unknown-kind = рядок події { $v1 }: невідомий вид { $f }

engine-e-interop-testbench-event-row-bad-onset = рядок події { $v1 }: хибний початок

engine-e-interop-testbench-event-row-bad-end = рядок події { $v1 }: хибний кінець

engine-interop-testbench-no-waypoints-txt-written = .waypoints.txt не записано: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = не час UTC `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = відсутнє: { $what }

engine-e-ionex-bad-number-in = { $what }: хибне число в { $col }

engine-e-ionex-two-digit-year = { $what }: дворозрядний рік { $year }

engine-e-ionex-no-end-of-header = немає END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = карти IONEX із залежністю від висоти (3-D) не підтримуються

engine-e-ionex-zero-grid-step = нульовий крок сітки

engine-e-ionex-grid-needs-at-least-nodes = сітка потребує щонайменше 2 x 2 вузлів

engine-e-ionex-map-no = карта { $index }: немає { $end_label }

engine-e-ionex-map-band-latitude-header-grid = карта { $index }: смуга { $band }, широта { $band_lat }, сітка заголовка { $want }

engine-e-ionex-map-band-longitudes-differ = карта { $index }: довготи смуги { $band } відрізняються

engine-e-ionex-map-band-truncated = карта { $index }: смуга { $band } обірвана

engine-e-ionex-map-bands-header-grid-has = карта { $index }: смуг: { $band }, сітка заголовка має { $n_lat }

engine-e-ionex-map-no-epoch-of-current = карта { $index }: немає EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = карт TEC: { $tec_maps }, заголовок # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = епохи карт TEC не зростають

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz не вміщує ціле число відліків на період { $code } (відліків: { $spc })

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods і noncoherent мають бути додатними

engine-e-iq-acq-stream-ended-after-of-samples = потік завершився після { $got } з { $needed } відліків

engine-e-iq-acq-cfar-reference-cells-must-be = опорні комірки CFAR мають бути парними й не меншими за 2 (отримано { $n })

engine-e-iq-acq-cfar-stride-must-be-at = крок CFAR має становити щонайменше 1 лаг

engine-e-iq-acq-cfar-per-cell-pfa-must = Pfa CFAR на комірку має лежати в (0, 1) (отримано { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = вікно CFAR сягає { $reach } лагів з кожного боку, що надто широко для періоду в { $samples_per_period } лагів

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = невідомий формат поверхні { $s }: очікується csv, json або bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = поверхня містила б комірок: { $spc_cells } (ліміт { $MAX_SURFACE_CELLS }): збільште крок Доплера або звузьте діапазон Доплера

engine-e-iq-acq-surface-surface-header = заголовок поверхні: { $e }

engine-e-iq-acq-surface-surface-schema-expected = схема поверхні { $schema }; очікується { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = тіло поверхні: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = запис '{ $id }': format і sample_rate_hz слід задавати разом

engine-e-iq-campaign-conditions-test-conditions-json = умови випробування (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = умови випробування (TOML): { $e }

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf потребує запису SigMF (отримано { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = метадані SigMF: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = метадані SigMF: відсутнє глобальне core:sample_rate

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: відсутнє core:sample_start

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: немає core:sample_count і немає точок потужності, які завершили б подію

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema має бути "{ $SCHEMA }" (отримано "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id не може бути порожнім

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s має бути скінченним і >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 має містити 64 шістнадцяткові цифри

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind має бути "iq" або "receiver-log" (отримано "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = потрібна щонайменше одна група [[expected]]

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids не може бути порожнім

engine-e-iq-campaign-conditions-duplicate-id = { $at }: повторюваний id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s має бути після onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects має бути "all" або списком id

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: id у affects { $bad } немає в [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q має бути додатним

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points не може бути порожнім

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points мають іти в порядку часу

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points мають бути скінченними

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" потребує reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = події '{ $id }' і '{ $id2 }' перекриваються на спільному супутнику

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s має бути >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s має бути додатним

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = запис '{ $id }': SHA-256 { $sha } не збігається із заявленим { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s має бути додатним

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db має бути додатним

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s має бути >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz має бути додатним

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs має бути не меншим за 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = кампанія (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = кампанія (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions має містити щонайменше один файл або glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds має бути >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = назви frontend мають бути непорожніми й унікальними ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' не відповідає жодному файлу

engine-e-iq-campaign-spec-recording-id-appears-in-both = id запису '{ $w }' трапляється і в { $w2 }, і в { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names потребує inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: у { $path } немає проєкту '{ $n }'

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = рядок істини { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = профіль C/N0: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = профіль C/N0: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = сегмент { $i }: значення кроку мають бути скінченними

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = сегмент { $i }: лінійне наростання потребує end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = сегмент { $i }: точки потребують однакових непорожніх t_s і db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = сегмент { $i }: t_s має строго зростати

engine-iq-channel-cn0-profile-segment-points-must-be-finite = сегмент { $i }: точки мають бути скінченними

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = сегмент { $i }: завмирання s4 має лежати в (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = сегмент { $i }: завмирання tau_s має бути додатним

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: запис містить відліків: { $samples }, для цього пошуку потрібно: { $need }

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: вкажіть формат через --surface-format csv|json|bin або завершіть шлях на .csv, .json чи .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = захоплення: { $fs_hz } Hz, когерентних періодів: { $coherent_periods } x некогерентних: { $noncoherent }, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = звіт перебудовано: комірок { $cells_present } з { $cells_total }, рядків: { $rows }, з них не виконують поріг: { $rows_failed }; дайджест { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    кампанія { $name }: комірок: { $cells_total }; уже виконано: { $cells_skipped }, виконано зараз: { $cells_run }, невдало: { $cells_failed }, очікують: { $cells_pending }
    вивід: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    перша невдача ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: подій: { $events }, очікуваних супутників: { $tc }; хеш умов { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = похила іоносфера { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = вертикальна іоносфера { $t } TECU

engine-iq-cli-channel-tropo-doy = тропосфера, доба року { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = сцинтиляція S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = багатопроменевість { $h }m, поверхня: { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground має бути dry, wet або sea (отримано { $other })

engine-e-iq-cli-channel-give-at-most-one-of = задайте не більш як один із --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass очікує lo,hi (отримано { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass потребує lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } із переходом { $transition } Hz не вміщується нижче fs/2 ({ $v1 } Hz); звузьте смугу або перехід

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits має бути 1..=16 (отримано { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = відфільтровано відліків: { $total } ({ $fs_hz } Hz) у { $out } ({ $format }); супровідний файл { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = не вдалося прочитати { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = некоректний сценарій labfit: { $e }

engine-iq-cli-labfit-fitted-run-wrote = підігнано прогонів: { $runs }; записано { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = підігнано одиниць із кампанії: { $fit_units }; записано { $written }

engine-iq-cli-labfit-cannot-write = не вдалося записати { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } потребує значення

engine-e-iq-cli-cannot-parse = { $k }: не вдалося розібрати { $v }

engine-e-iq-cli-cannot-parse-2 = { $k }: не вдалося розібрати { $p }

engine-iq-cli-unknown-iq-processing-command-expected = невідома команда обробки iq { $other }; очікується scene, acquire, track, sweep, labfit, frontend, monitor, campaign або conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } поза допустимим діапазоном для GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = для запитаних PRN не знайдено справних ефемерид GPS

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos очікує lat,lon,alt (отримано { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; профіль C/N0 (сегментів: { $segments })

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format має бути csv або jsonl (отримано { $other })

engine-iq-cli-scene-written-by-kshana-iq-scene = записано kshana iq scene: СИМУЛЬОВАНА сцена, а не запис

engine-iq-cli-scene-ion-sdr-metadata = метадані ION SDR { $path }

engine-iq-cli-scene-sigmf-data-meta = дані SigMF { $data_path }, метадані { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = записано kshana iq scene

engine-iq-cli-scene-wrote-samples-hz-to-truth = записано відліків: { $samples } ({ $format }, { $fs_hz } Hz) у { $data_path }; записів істини: { $truth_records } у { $truth_path }; { $meta_note }; канал: { $chan_desc }

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } не можна поєднувати з --design: sweep виконує кожен проєкт у файлі

engine-iq-cli-sweep-loop-design-sweep-design-prn = перебір проєктів контурів: результатів (проєкт, PRN): { $rows }{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: запис містить відліків: { $samples }, для захоплення потрібно: { $need }

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: не захоплено (статистика { $statistic } < порогу { $threshold }); збільште --doppler-max, --acq-coherent або --acq-noncoherent, або перевірте запис

engine-iq-cli-track-designs-and-differ-in-integration = проєкти { $first } і { $d } відрізняються в integration.extra_taps_chips; проєкти одного прогону мають збігатися, щоб кожен вихідний запис мав однакові стовпці

## src/iq/cli/track.rs

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: вкажіть формат через --epochs-format csv|jsonl|bin або завершіть шлях на .csv, .jsonl чи .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz дорівнює { $r } відліку на чіп для { $c }: співмірна дискретизація перетворює дискримінатор коду на сходинки (за 2 відліків/чіп DLL тремтить, приблизно { $lit_0_09 } чіпа RMS похибки коду за 45 dB-Hz); джитер і зміщення контуру коду за цим записом не є репрезентативними. Щоб оцінювати контури коду, використовуйте частоту, що не кратна половині чіпової частоти.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = робочий процес завершився до обробки цього входу

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = невідомий параметр { $s }

engine-e-iq-io-cli-format-needs-rate = --format потребує --rate

engine-iq-io-cli-unknown-iq-command = невідома команда iq { $other }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow читає лише одноканальні записи

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow читає запис з одним захопленням, а в цьому їх: { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: немає додатного core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: захоплення не починається на межі байта

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = невідомий формат відліків { $name }: очікується, наприклад, ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, за потреби із закінченням _qi для комплексних

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sample_rate_hz супровідного файлу { $sample_rate_hz } не є додатним

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: записи .sdrx містять один потік; канал { $channel } не існує

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: сирий файл без супровідного файлу; вкажіть його формат або запишіть { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = не вдалося серіалізувати рядок: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = некоректний проєкт фільтра { $design }: passband_frac у (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz має лежати строго між 0 і половиною частоти дискретизації ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx, дані: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-бітний { $enc } { $fmt } ({ $packed_bits } біт/відлік)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = непідтримуваний SigMF core:datatype { $datatype }: підтримуються ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be та дійсні ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } не є SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = некоректні метадані SigMF: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } не має SigMF core:datatype; запишіть його як raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } не збігається зі значенням { $c0 } першого запису

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: немає core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } не є додатним

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } за { $rate } Hz не збігається зі значенням { $f0 } за { $r0 } Hz першого запису

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: перше захоплення не починається на межі байта

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = запитано канал { $channel }; у записі каналів: { $channels } (канали рахуються з 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = некоректна колекція SigMF: { $e }

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } не збігається зі значенням колекції { $h }

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = потік { $select } із { $channels } черезрядкових потоків не існує (потоки рахуються з 0)

engine-e-iq-io-stream-sample-of-does-not-start = відлік { $k } формату { $format } не починається на межі байта

engine-e-iq-io-stream-time-window-start-duration-both = часове вікно: початок { $start_s } s, тривалість { $duration_s } s: обидва значення мають бути невід'ємними

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = найшкідливіше задане Q (cw): немає табличного значення для типу `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: кампанія не завершена

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } не збігається з комірками ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = запис `{ $id }`: хеш умов випробування { $h } не збігається із записаним { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = сигнал `{ $signal }`: невідома чіпова частота

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = жоден прогін не придатний для підгонки захоплення: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = недостатньо даних: не підігнано (записів: { $m }; потрібно щонайменше: { $min_rec })

engine-iq-labfit-iqfit-uncensored-span-db-is-under = нецензурований розмах J/S { $span_db } dB менший за { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff і delta не ідентифікуються окремо (|corr| { $full } >= { $v2 }): модель залежить лише від delta - 10 log10 Q_eff

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = невідомий режим `{ $m }` (лише `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage має бути [lower, upper] у межах [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds має бути [lower, upper], де 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db має бути [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = у кампанії немає події із заданим профілем потужності для підгонки

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Лабораторна підгонка за кампанією IQ: { $r }

    Схема `{ $schema }`, рушій { $engine_version }. Мітка: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = DIGEST кампанії `{ $campaign_digest }`; SHA-256 `campaign.json` `{ $campaign_json_sha256 }`; SHA-256 сценарію `{ $scenario_sha256 }`; комірок: { $cells }; реплікацій bootstrap: { $bootstrap } (seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Одиниця { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Стан: { $status }. Записів: { $recordings }, супутників: { $satellites }, подій: { $events }; бінів підігнано: { $bins_used }, цензуровано: { $bins_censored }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = Модель C/N0 ({ $q_mode }): `delta_eff` = { $ci } dB (ідентифіковане зміщення, зведене до Q = 1); `Q_eff` = { $q }; `delta` за цього Q = { $ci2 } dB; corr(Q, delta) { $om }; залишковий RMS { $residual_rms_db } dB на розмаху J/S { $span_db } dB. Q_eff не ідентифікується за даними C/N0 без незалежного вимірювання потужності.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q зафіксовано на заданому значенні: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Відкладена вибірка (з виключенням одного запису), інтерполяція: бінів: { $bins }, RMS C/N0 { $om } dB, покриття PI90 { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    SHA-256 таблиці перевірки `{ $table_sha256 }` (зареєстровано { $registered }):

    | поріг | межа | значення | вердикт |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = журнал прогону `{ $label }`

engine-e-iq-labfit-run = прогін `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = у [input] сценарію не названо жодної кампанії

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign і [[runs]] взаємовиключні: задайте одне з них

engine-e-iq-labfit-iq-labfit-scenario = сценарій iq-labfit: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = журнал не містить C/N0 для окремих супутників{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = немає епохи до початку на { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = немає епохи на початку або після нього на { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Лабораторна підгонка: { $r }

    Мітка: **{ $label }**. SHA-256 налаштувань `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Модель: { $model } ({ $label })

    | параметр | значення | межі | на межі | bootstrap sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Відкладена вибірка ({ $scheme }, блоків: { $folds }): усе { $om } s, інтерполяція { $om2 } s, екстраполяція { $om3 } s.

    | відкладений прогін | клас | відстань | найближчий навчальний прогін | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } зарезервовано для майбутнього використання (визначено лише FID 0)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } поза межами 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = символів SB1, що розходяться з декодованим полем: { $sb1_err }

engine-iq-lunanet-afs-frames-at-and-are-symbols = кадри на { $w } і { $w2 } розділені { $gap } символами, а не { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } іде після TOI { $w2 }, очікувалося { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = неочікуваний символ { $c } у потоці символів (лише 0, 1 і пробіли)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: перші 24 чіпи відрізняються

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: останні 24 чіпи відрізняються

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (документ друкує A14850 і для PRN 147, і для PRN 151; генератор відтворює значення PRN 151, тож запис PRN 147, найімовірніше, є друкарською помилкою в документі)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = закодовано 0x{ $word }, декодовано FID { $fid } TOI { $toi }

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = налаштування монітора: { $e }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = статичне положення не є скінченним

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = траєкторія зі сталою швидкістю не є скінченною

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = траєкторія за шляховими точками не має шляхових точок

engine-e-iq-scene-geometry-waypoint-not-finite = шляхова точка не є скінченною

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = час шляхових точок має строго зростати

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } не є PRN GPS C/A

engine-e-iq-scene-ephemeris-system-is-not-gps = система ефемерид { $system } не є GPS

engine-e-iq-scene-satellite = супутник { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = є пілотним компонентом (без даних) і не несе навігаційних даних

engine-e-iq-scene-nav-carries-data-the-scene-does = несе дані, яких сцена не моделює; згенеруйте його без даних

engine-e-iq-scene-nav-does-not-carry-gps-lnav = не несе GPS LNAV (лише GPS L1 C/A); використайте дані із seed

engine-e-iq-scene-nav-not-an-lnav-source = не є джерелом LNAV

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = сцена потребує щонайменше одного супутника (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler містить значень: { $dopplers }; задайте по одному на кожен --prn ({ $ids }) або одне значення

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = рядок істини має полів: { $f }, очікується 10

engine-e-iq-scene-truth-truth-field = поле істини { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = sat_id істини: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz має бути додатним числом

engine-e-iq-short-duration-must-be-in = duration_s має лежати в (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids має містити від 1 до { $MAX_SATELLITES } супутників

engine-e-iq-short-dopplers-must-be-finite = dopplers мають бути скінченними

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } поза допустимим діапазоном

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = частотний канал GLONASS L1OF { $id } поза межами -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = невідомий сигнал { $other }; очікується один із: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = рядок { $v1 }: немає ';'

engine-e-iq-signals-galileo-line-no-code-number-in = рядок { $v1 }: немає номера коду в { $label }

engine-e-iq-signals-galileo-code-appears-twice = код { $number } трапляється двічі

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q первинний { $primary_prn } S{ $secondary } третинний { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q первинний { $primary_prn } S{ $secondary } (третинний пропущено)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = нешістнадцятковий символ { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = шістнадцяткових символів { $hex } не вміщують рівно { $len } чіпів

engine-iq-signals-primary-only = { $name } (лише первинний)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = стеження BOC потребує інтервалу випереджальний-запізнілий у (0, { $max }) чіпів, щоб E і L залишалися на головному піку (отримано { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = поріг bump-jump має бути не меншим за 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = частота дискретизації має бути додатною

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods має бути додатним

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows має бути додатним

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } має ділити довжину біта { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = підтримується щонайбільше { $MAX_EXTRA_TAPS } додаткових відводів (отримано { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = зсуви додаткових відводів мають бути скінченними й у межах ±{ $MAX_TAP_OFFSET_CHIPS } чіпів (отримано { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = вікно C/N0 потребує щонайменше 2 prompt

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: очікується atan2, costas-atan або costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: очікується cross-product, atan2 або atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: очікується pull-in або always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: очікується eml-power, dot-product або eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: очікується pll, fll або fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } не застосовується до carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: очікується число >= 0 (0 вимикає обмеження)

engine-e-iq-track-design-must-be-positive-number-got = { $k } має бути додатним числом (отримано { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods має бути не меншим за 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips має лежати в (0, 2] (отримано { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips містить щонайбільше { $MAX_EXTRA_TAPS } зсувів (отримано { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = зсуви integration.extra_taps_chips мають бути скінченними й у межах ±{ $MAX_TAP_OFFSET_CHIPS } чіпів (отримано { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) має бути нижчим за carrier.fll_off_pli ({ $off }), обидва в (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s має бути нулем або додатним (отримано { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s має бути додатним (отримано { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order має бути 1, 2 або 3 (отримано { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order має бути 1 або 2 (отримано { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order має бути 1 або 2 (отримано { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold має лежати в [-1, 1] (отримано { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows має бути не меншим за 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods має бути не меншим за 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) не може бути меншим за lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db має бути скінченним

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes має бути не меншим за 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods має бути не меншим за 1 (або "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent має бути не меншим за 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa має лежати в (0, 1) (отримано { $pfa })

engine-e-iq-track-design-design-overrides = перевизначення проєкту: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = перевизначення проєкту не можуть задавати name або extends

engine-e-iq-track-design-loop-design-file = файл проєктів контурів: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = файл проєктів контурів: схема { $other } не підтримується; очікується { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = файл проєктів контурів: відсутня schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = файл проєктів контурів: немає таблиць [[design]]

engine-e-iq-track-design-loop-design-file-design-number = файл проєктів контурів: [[design]] номер { $v1 } не має name

engine-e-iq-track-design-loop-design-file-design-name = файл проєктів контурів: назва проєкту { $name } зарезервована або порожня

engine-e-iq-track-design-loop-design-file-design-is = файл проєктів контурів: проєкт { $name } визначено двічі

engine-e-iq-track-design-no-design-named-the-file = немає проєкту з назвою { $n }; у файлі: { $value }

engine-e-iq-track-design-loop-design-file-design-extends = файл проєктів контурів: проєкт { $name } розширює сам себе (цикл)

engine-e-iq-track-design-loop-design-file-design-extends-2 = файл проєктів контурів: проєкт { $name } розширює невідомий проєкт { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = контур фази потребує порядку 1..=3 і Bn > 0 (отримано { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = контур частоти потребує Bn > 0 (отримано { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = порядок контуру частоти має бути 1 або 2 (отримано { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = фільтр контуру потребує тракту фази, тракту частоти або обох

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = інтервал випереджальний-запізнілий має лежати в (0, 2] чіпів (отримано { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = порядок DLL має бути 1 або 2 (отримано { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = чіпова частота і частота несівної мають бути додатними

## src/iq/track/sink.rs

engine-e-iq-track-sink-record-is-bytes-expected = запис становить { $b } байтів; очікується { $want }

engine-e-iq-track-sink-unknown-lock-state-code = невідомий код стану захоплення { $b }

engine-e-iq-track-sink-epoch-file-header = заголовок файлу епох: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = схема файлу епох { $schema }; очікується { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = записи файлу епох мають { $record_bytes } байтів; цей читач очікує { $want } ({ $BINARY_RECORD_BYTES } плюс { $BINARY_TAP_BYTES } на кожен додатковий відвід)

engine-e-iq-track-sink-epoch-file-ends-inside-record = файл епох закінчується всередині запису ({ $got } з { $size } байтів)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = формат епох { $o }: очікується csv, jsonl або bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` не є числом

engine-e-jammertest-cli-is-not-utf-text = { $path } не є текстом UTF-8

engine-e-jammertest-cli-needs-catalog = потребує --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = потребує щонайменше одного --plan

engine-e-jammertest-cli-is-not-utf = { $cat } не є UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } не є UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` не є одним із ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` не є UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = потребує --log-start або --log разом із --format

engine-e-jammertest-cli-log-needs-format = --log потребує --format

engine-e-jammertest-cli-the-log-does-not-state = журнал не вказує час свого початку: використайте --log-start

engine-e-jammertest-cli-the-log-states-its-start = журнал вказує свій початок як `{ $label }`: використайте --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } не є UTF-8

engine-e-jammertest-cli-cannot-write = не вдалося записати { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = подій { $events } { $SCHEDULED_TRUTH } записано в { $o } (пропущено нерадіочастотних слотів: { $skipped_non_rf }, поза журналом: { $outside_log }, id не з каталогу: { $unknown_ids })

engine-jammertest-cli-note-ids-not-in-the = примітка: id не з каталогу: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = примітка: це заплановані слоти плану, а не записані ефірні часи.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  назва випробування

## src/jammertest/cli.rs

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = випробувань: { $tests }, придатних до оцінки: { $evaluable }: виявлено в межах допуску: { $detected }, із запізненням: { $late }, пропущено: { $missed }; медіанна затримка { $fmt_opt }, медіанний час відновлення { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = хибні тривоги поза всіма слотами: прогонів: { $false_alarm_runs }, епох: { $false_alarm_epochs } з { $clean_epochs } чистих

engine-e-jammertest-cli-needs-session-path = потребує шляху до сесії

engine-e-jammertest-cli-needs-catalog-and-plan-or = потребує --catalog і --plan або --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = пакет доказів записано в { $out }; відбиток підписувача { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = у { $root } немає теки зі scenario.json і .ubx

engine-e-jammertest-dataset-scenario = сценарій: { $e }

engine-e-jammertest-dataset-read = читання: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json не має дати

engine-e-jammertest-dataset-scenario-json-date-is-not = дата `{ $date }` у scenario.json не є датою

engine-e-jammertest-dataset-no-readable-epoch-in-mon = у mon_rf.csv чи rinex.csv немає придатних до читання епох

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = у { $root } немає теки зі scenario.json

engine-jammertest-dataset-recovered-of-median = { $f2 } відновлено ({ $recovered } з { $alarmed }), медіана { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = журнал вказує свій початок як `{ $l }`, що не є UTC ISO-8601: задайте початок явно

engine-e-jammertest-the-log-does-not-state = журнал не вказує час свого початку: задайте його явно

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = каталог не є JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = у каталозі немає масиву `test_types`

engine-e-jammertest-plan-test-type-has-no-type = тип випробування не має `type_id`

engine-e-jammertest-plan-test-group-has-no-group = група випробувань не має `group_id`

engine-e-jammertest-plan-test-has-no-test-id = випробування не має `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = каталог не містить жодного випробування

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` не є часом плану на кшталт 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = план не є JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = у плані немає масиву `locations`

engine-e-jammertest-plan-test-end-time-is-not = випробування { $id }: end_time не пізніше за start_time

engine-e-jammertest-plan-the-plan-has-no-test = у плані немає випробувального майданчика { $l }; наявні: { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = у плані кілька випробувальних майданчиків: { $areas }; вкажіть, на якому записано журнал

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json не є JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = немає масиву `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024, випробування { $id }, вікно { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log не містить вікна початок/кінець

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = запланованих подій: { $events }, але прогін оцінив: { $events2 }: передайте події самого прогону

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s має бути додатним, а guard_s невід'ємним

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m має містити щонайменше один елемент

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m має бути скінченним

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: очікується "null-steering" або "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz має бути додатним (отримано { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: розділ потребує [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) має бути скінченним і не меншим за tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s має бути скінченним і невід'ємним (отримано { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits має бути від 1 до 16 (отримано { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz має бути додатним (отримано { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side має бути не меншим за 2 (отримано { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } має бути скінченним (отримано { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } має бути додатним (отримано { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: точка профілю { $points } ({ $lat }, { $lon }) поза плиткою DEM

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: точка профілю { $points } ({ $lat }, { $lon }) припадає на порожнечу DEM

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = календарна дата UTC поза допустимим діапазоном: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = такої календарної дати немає: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = секунда UTC { $second } поза допустимим діапазоном на { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = місце запуску на полюсі не має визначеного азимута

engine-e-launch-inclination-unreachable-from-latitude-without = нахил { $inclination_rad }° недосяжний із широти { $lat_rad }° без доглега (потрібно |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = швидкість місця запуску на істинному полюсі потребує і `epoch`, і `eop_finals2000a` (справжнього тіла IERS finals2000A)

engine-e-launch-site-lon-deg-must-be = site_lon_deg має бути в [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a не містив придатних до читання рядків IERS finals2000A

engine-e-launch-epoch-mjd-is-outside-the = епоха { $epoch } (MJD { $mjd_utc }) поза наданими рядками EOP (MJD від { $mjd } до { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg має бути в [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg має бути в [0, 180]

engine-launch-launch-window-lat-az-asc = вікно запуску: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° asc, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s бонус обертання Землі, можливостей на добу: { $opportunities } (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = кожна швидкість зміни дальності потребує додатної скінченної сигми

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = геометрія Доплера вироджена

engine-e-leo-fusion-doppler-no-covariance = немає коваріації

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = кожна псевдодальність потребує додатної скінченної сигми

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = супутник збігається з оцінкою положення

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = геометрія вироджена

engine-e-leo-fusion-joint-pvt-no-iteration-ran = жодної ітерації не виконано

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = вироджена кінцева геометрія

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP не є скінченним

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } має бути додатним

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m має бути невід'ємним, а прогін не довшим за 5000 епох

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = кожен сигнал потребує додатної смуги

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, діапазон CRB від { $range_sigma_zenith_m } до { $range_sigma_mask_m } m; медіана формальної 3D { $s2 } m, похибка RMS { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP потребує щонайменше однієї системи

engine-e-leo-fusion-ppp-duration-and-step-must-be = тривалість і крок мають бути додатними, не більш як 20000 епох

engine-e-leo-fusion-ppp-runs-must-be-to-200 = кількість прогонів має бути від 1 до 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = пороги збіжності мають бути додатними

engine-leo-fusion-ppp-median-horizontal-error-across-runs = медіанна горизонтальна похибка за прогонами: { $runs_per_case } · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = пресет { $id } не несе жодного сигналу

engine-e-leo-fusion-presets-preset-has-no-signal-it = пресет { $id } не має сигналу { $n }; наявні: { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = невідомий пресет LEO { $id }; відомі: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s і step_s мають бути додатними, не більш як 20000 епох

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = полярні кроки мають бути додатними

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = режим має бути doppler, joint, polar або timing; отримано { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = режим doppler потребує щонайменше однієї системи LEO

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = режим timing потребує системи LEO з кодовим вимірюванням дальності

engine-e-leo-fusion-pvt-kind-unknown-clock-class = невідомий клас годинника { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) у { $user_lat_deg }, { $user_lon_deg } за { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } прохід над головою: макс. Доплер { $max_doppler_hz } Hz, швидкість { $max_doppler_rate_hz_s } Hz/s, ривок { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }супутник LEO для вимірювання дальності в зоні видимості на { $v1 }% епох{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } доступність { $availability }, медіана PDOP { $f }, 3D похибка RMS { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } об'єднане { $f3 }; у зоні видимості { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, макс. { $row3 } ns (у зоні видимості { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — режим { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = система { $name }: role має бути gnss або leo, отримано { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = система { $name }: clock має бути estimated або known, отримано { $c }

engine-e-leo-fusion-system-system-must-be-positive = система { $name }: { $what } має бути додатним

engine-e-leo-fusion-system-system-mask-deg-must-be = система { $name }: mask_deg має бути в [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = система { $name }: sigma_pr_m має бути додатним

engine-e-leo-fusion-system-give-at-least-one-system = задайте щонайменше одну [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = інтервал між епохами має бути додатним

engine-e-leo-fusion-timing-no-epochs = немає епох

engine-e-leo-fusion-timing-no-satellite-was-ever-in = жоден супутник ніколи не був у зоні видимості: приймач так і не захопив час

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = поляризація має бути rhcp, lhcp або linear; отримано '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = код помилки SGP4 { $code } при t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = орбіта з нахилом { $inc } deg ніколи не проходить над широтою { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = запитаний максимальний кут місця нижчий за досяжність горизонту

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = клас будівлі має бути traditional або thermally-efficient; отримано '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = поле { $name } не є скінченним

engine-e-leo-navmsg-codec-field-is-outside-its-bit = поле { $name } = { $value } { $unit } поза своїм { $bits }-бітним діапазоном (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = повідомлення обірване

engine-e-leo-navmsg-codec-field-list-exhausted = список полів вичерпано

engine-e-leo-navmsg-codec-field-order-mismatch-vs = порядок полів не збігається: { $name } проти { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID має бути 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = кожен поліном поправки потребує 1-8 коефіцієнтів

engine-e-leo-navmsg-codec-correction-time-scale-must-be = часовий масштаб поправки має бути степенем двійки від 1 s до 32768 s; отримано { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = поліном ECEF потребує 1-11 коефіцієнтів, однакових для кожної осі

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = степінь полінома ECEF { $v1 } перевищує 10

engine-e-leo-navmsg-codec-unknown-model-id = невідомий id моделі { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = корисне навантаження перевищує 4095 байтів

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = кадр коротший за заголовок і CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = хибна преамбула 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = непідтримувана версія { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = довжина кадру { $frame } не збігається із заявленим корисним навантаженням у { $len } байтів

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = невідповідність CRC-24Q: обчислено 0x{ $crc }, кадр несе 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = кожен із rac_degrees має бути не більшим за 7; отримано { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree має бути 1-10; отримано { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = невідома модель ефемерид '{ $other }': використайте kepler16, kepler-rac, liu22 або ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = інтервал підгонки має бути не меншим за 10 s; отримано { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = вікно підгонки [{ $t0 }, { $v1 }] s лежить поза дугою істини [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = підгонка полінома ECEF вироджена (замало відліків для цього степеня)

engine-e-leo-navmsg-fit-clock-fit-is-singular = підгонка годинника вироджена

engine-e-leo-navmsg-fit-keplerian-fit-diverged = кеплерова підгонка розійшлася

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = невідомий пресет '{ $k }'; доступні: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s має бути 10-3600 s, а update_period_s у (0, fit_interval_s]; отримано { $fit_interval_s } і { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s і eval_step_s мають бути { $lit_0_5 }-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz має перевищувати 10 MHz; отримано { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid має бути 1-255

engine-e-leo-navmsg-band-must-be-15-and = band має бути 0-15, а health 0-3

engine-e-leo-navmsg-unknown-csv-schema = невідома csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis має називати щонайменше один аналіз

engine-e-leo-navmsg-unknown-analysis-use = невідомий аналіз '{ $a }'; використайте { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind має бути leo-navmsg; отримано { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg має бути в [0, 60); отримано { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    навігаційне повідомлення LEO — { $res } km, { $res2 } deg, степінь гравітації { $gravity_degree }, модель { $res3 }
    { "  " }ваги SISRE: w_R { $w_r }, w_AC^2 1/{ $v6 } (маска { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s має бути 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s має бути непорожнім, кожен елемент 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }компроміс щодо інтервалу підгонки на { $span } s (період використання = інтервал підгонки):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE орбіти RMS { $sisre_orb_rms_m } m  макс. { $sisre_orb_max_m } m  із годинником RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s має бути непорожнім, кожен елемент 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s має бути 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } парам.  SISRE орбіти RMS { $sisre_orb_rms_m } m  із годинником { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = немає проходу вище { $mask } deg для користувача в { $lat }, { $lon } протягом { $search } s; збільште midpass.search_s або перемістіть користувача

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }оновлення посеред проходу: прохід { $p0 }-{ $p1 } s (макс. кут місця { $pmax } deg), перемикань: { $switches }, найбільший стрибок дальності користувача { $max_jump } m (геометрія найгіршого випадку { $max_worst } m) проти порогу { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }кодування-декодування: модель { $m }, кадр { $frame } байтів (біт корисного навантаження: { $payload_bits }, біт ефемерид і годинника: { $eph_bits }), CRC-24Q 0x{ $hex }
    { "    " }квантування: найбільша зміна положення { $v6 } mm, годинника { $v7 } mm; SISRE точне { $acc_exact } m, квантоване { $acc_q } m
    { "    " }пошкоджений кадр відхилено: { $corrupted_rejected }; кругообіг RINEX { $rin_dp } m; кругообіг CSV { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs має бути 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  опубліковано { $published } m  відношення { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = 16-параметровий кеплерів набір погіршується від { $a } m на { $lo } s до { $b } m на { $hi } s: один кеплерів набір із гармоніками двічі за оберт не може довше за кілька хвилин відстежувати високочастотні члени гравітації та опір дуги LEO, і його залишок за найменшими квадратами коливається вздовж вікна. Поліноми вздовж/поперек/радіально, вищого степеня, ніж охоплює кеплерів набір, поглинають залишок, даючи { $c } m на { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = 16-параметровий кеплерів набір переходить від { $a } m на { $lo } s до { $b } m на { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, степінь гравітації { $gravity_degree } · похибка подання відносно істини · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` належить бібліотеці хоста

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: семплери `rand_distr` у рідкісних гілках викликають `exp` і `ln` хоста; використайте `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` є гравітаційним полем бібліотеки хоста; використайте `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` не пройшов перегляд

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = немає рядка END OF HEADER

engine-e-leo-navmsg-text-expected-eph-record-header-got = очікувався заголовок запису '> EPH', отримано { $head }

engine-e-leo-navmsg-text-bad-satellite-id = хибний id супутника { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = відсутній рядок епохи

engine-e-leo-navmsg-text-bad-epoch-line = хибний рядок епохи { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = хибне поле епохи в { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = рядок епохи потребує трьох членів годинника: { $ep }

engine-e-leo-navmsg-text-record-truncated = запис обірваний

engine-e-leo-navmsg-text-unknown-record-type = невідомий тип запису { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = таблиця CSV несе повідомлення kepler16 і kepler-rac; отримано { $m }

engine-e-leo-navmsg-text-empty-csv = порожній CSV

engine-e-leo-navmsg-text-row-has-cells-header = рядок має комірок: { $cells }, заголовок: { $header }

engine-e-leo-navmsg-text-bad-number-in-column = хибне число { $c } у стовпці { $k }

engine-e-leo-navmsg-text-csv-row-lacks = у рядку CSV бракує { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = висота орбіти має бути між 100 km і 3000 km; отримано { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = ексцентриситет має бути в [0, { $lit_0_1 }) для підгонки LEO; отримано { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = крок інтегрування має бути в (0, 30] s; отримано { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = тривалість має бути додатною, не більш як 200000 кроків; отримано { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree має бути 0, 2-6 (зональний) або 7-{ $v1 } (EGM2008); отримано { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = поширення істини розійшлося

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = орбіта істини деградувала нижче 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = інтервал вузлів має бути в (0, 60] s; отримано { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = табульована орбіта істини потребує щонайменше двох станів; отримано { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = стан { $k } не є скінченним

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = adev_1s годинника має бути в [0, 1e-6); отримано { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = виміряний годинник будується через TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = кермований годинник потребує sigma_s у [0, 1e-3) і tau_s > 0; отримано { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = виміряний годинник потребує додатного кроку й щонайменше двох відліків

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = відлік виміряного годинника не є скінченним

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = епоха '{ $s }' не має вигляду YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = епоха '{ $s }' не має вигляду YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = епоха '{ $s }' має хибне поле секунд

engine-e-leo-pass-epoch-is-out-of-range = епоха '{ $s }' поза допустимим діапазоном

engine-e-leo-pass-band-unknown-signal-design-public = діапазон '{ $name }': невідомий проєкт сигналу '{ $n }'; публічні проєкти: { $v2 }

engine-e-leo-pass-band-is-not-in-the = діапазону '{ $name }' немає в пресеті системи: задайте frequency_mhz і eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = діапазон '{ $name }' потребує eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern має бути isoflux, gaussian або flat; отримано '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = частота діапазону '{ $name }' поза допустимим діапазоном

engine-leo-pass-overridden-in-the-scenario = { $source } (перевизначено в сценарії)

engine-e-leo-pass-system-has-no-band = система '{ $id }' не має діапазону '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = супутник LEO потребує щонайменше одного діапазону

engine-e-leo-pass-at-most-12-bands-per = щонайбільше 12 діапазонів на супутник

engine-leo-pass-unknown-system-presets-in-this = невідома система '{ $n }'; пресети в цій збірці: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = немає сонячно-синхронної орбіти на { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (не більше 86400) і step_s мають бути додатними, не більш як 20000 епох; отримано { $duration } і { $step }

engine-leo-pass-leo-satellite-km-deg = супутник LEO { $system }, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = `epoch` сценарію { $epoch }, прочитано як UTC

engine-leo-pass-the-kind-default-epoch-utc = типова епоха виду { $epoch } UTC (сценарій її не задає)

engine-e-leo-pass-user-environment-must-be-ground = user.environment має бути ground, maritime, air або indoor; отримано '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg має бути в межах +/-90

## src/leo_pass.rs

engine-e-leo-pass-user-speed-must-be-to = швидкість користувача має бути від 0 до 3000 m/s, а висота від -500 до 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna має бути patch, hemispherical або isotropic; отримано '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability має бути в (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model має бути klobuchar, vtec або none; отримано '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction має бути ascending або descending; отримано '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = супутник { $id }: хибний ексцентриситет або перигей

engine-e-leo-pass-satellite-tle-needs-tle-line1 = супутник { $id }: tle потребує tle_line1 і tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit має бути pass, elements або tle; отримано '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation потребує system або design

engine-e-leo-pass-no-sun-synchronous-inclination = немає сонячно-синхронного нахилу

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: щонайбільше 5000 супутників

engine-e-leo-pass-no-leo-satellite-rises-above = жоден супутник LEO не піднімається над маскою у вікні

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s має бути в (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' не є діапазоном жодного супутника LEO ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = немає сигналу GNSS '{ $bname }' для орбітального угруповання '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = порожнє орбітальне угруповання GNSS

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' не є двома різними діапазонами { $id }

engine-e-leo-pass-iot-powers-and-battery-must = потужності та батарея iot мають бути додатними

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from має бути median або peak; отримано '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = поріг виявлення { $detection_snr_db } dB після інтегрування

engine-leo-pass-coherent-integration-at-most-ms = когерентне інтегрування щонайбільше { $rx } ms, обмежене швидкістю зміни Доплера

engine-leo-pass-serial-search-with-correlators = послідовний пошук із корелятором(ами): { $correlators }

engine-leo-pass-hot-start-doppler-known-to = гарячий старт: Доплер відомий з точністю +/-{ $aided } Hz, ефемериди чинні

engine-leo-pass-leo-pass-link-budget-user = бюджет лінії зв'язку проходу LEO, користувач, середовище: { $environment }, у { $lat_deg }, { $lon_deg }; супутників LEO: { $satellites }, вікно { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, макс. кут місця { $max_elevation_deg } deg на { $tca_s } s, { $duration_above_mask_s } s над маскою{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 пік { $opt } медіана { $opt2 }; |Доплер| макс. { $opt3 }; іоносфера { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: у зоні видимості: { $satellites_in_view }, C/N0 від { $opt } до { $opt2 } (медіана { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } пік { $leo_peak_cn0_dbhz } dB-Hz на { $leo_peak_above_gnss_median_db } dB вище за медіану GNSS; вище за найсильнішу несівну GNSS протягом { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: холодний TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), гарячий { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Спуфер від { $onset_s } s (стрибок { $offset_m } m, зсув { $push_rate_m_s } m/s): тест Доплера GNSS { $t }, LEO { $t2 }, об'єднаний { $t3 }; міждіапазонний { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = користувач, середовище: { $environment } · пік LEO { $leo_peak_cn0_dbhz } dB-Hz, на { $leo_peak_above_gnss_median_db } dB вище за медіану GNSS · MODELLED

engine-leo-pass-user-modelled = користувач, середовище: { $environment } · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Доплер першого діапазону кожного супутника LEO (±{ $v1 } kHz повна шкала)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = некоректна таблиця [{ $what }]: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' не належить ні [signal], ні публічним проєктам ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' не має кодово відстежуваного компонента, тож не дає псевдодальності

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind має бути leo-pnt-chain; отримано { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = відстежуваний компонент не має чіпової частоти

engine-e-leo-pnt-chain-no-band-of-pass-names = жоден діапазон [pass] не називає signal = "{ $name }"; ланцюжок потребує одного, щоб нести проєкт

engine-e-leo-pnt-chain-the-pass-gives-no-code = прохід не дає джитера коду

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m має бути в [0, 100] m; отримано { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] має працювати в режимі mode = "joint"; отримано { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = відстежуваний C/N0 на масці { $mask } deg (лінійна підгонка за sin кута місця)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = у { "[" }fusion] немає системи LEO, яка б прийняла значення ланцюжка

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] не дав блоку joint

engine-leo-pnt-chain-leo-pnt-chain = ланцюжок LEO-PNT: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }сигнал { $name2 } ({ $design }), відстежується { $design2 } на { $v4 } Mchip/s, зсув C/N0 { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }прохід { $id } { $sat } km: пік відстежуваного C/N0 { $peak_tracked_cn0_dbhz } dB-Hz, медіана джитера коду { $jitter_median } m; лінія C/N0 { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }повідомлення { $res } { $fit_interval_s } s підгонка / { $update_period_s } s оновлення: SISRE подання { $stats } mm RMS (орбіта { $stats2 } mm), із визначенням орбіти { $od } m: передано далі { $sisre } m{ "\u000A" }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }об'єднане визначення: лише GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }збіжність PPP: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } значення, передані між етапами. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Джитер кодового стеження, похибка вимірювання дальності (m, від 0 до { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · лише GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = модуляція { $label }: ширина має бути додатною

engine-e-leo-signal-unknown-signal-preset-the-library = невідомий пресет сигналу { $name }: бібліотека містить { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = пресет { $name }: некоректний файл пресету: { $e }

engine-e-leo-signal-preset-file-names-itself = файл пресету { $name } називає себе { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz має бути додатним

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz має бути додатним

engine-e-leo-signal-signal-needs-at-least-one = { $name }: сигнал потребує щонайменше одного компонента

engine-e-leo-signal-component-power-fraction-must-be = { $name }: power_fraction компонента { $v1 } має бути додатним

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: компонент { $v1 } має fdma_shares, але не має fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: fdma_shares компонента { $v1 } мають бути додатними й давати в сумі одиницю

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: компонент { $v1 } потребує одного fdma_share на кожен зсув

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps має бути додатним

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips має бути додатним

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: частки потужності компонентів у сумі дають { $total }, а не 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km має бути додатним

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: плоский (схожий на OFDM) компонент не можна розмістити в моделі спектра

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: відстежуваний компонент лежить на піднесучих FDMA; модель спектра відстежує компонент у центрі діапазону

engine-e-leo-signal-signal-is-given-twice = сигнал { $w } задано двічі

engine-e-leo-signal-signals-is-more-than-the = сигналів: { $out }, це більше за дозволені 24

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s має бути меншим за 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: задайте від 1 до 40 значень cn0_dbhz

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 і slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points має бути між 21 і 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: використайте "coherent" або "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = шумова температура системи має бути додатною

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: невідомий сигнал GNSS { $n } (відомі: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } не є сигналом сценарію

engine-e-leo-signal-shape-check-signal-is-not = перевірка форми: сигналу { $signal } немає у сценарії

engine-leo-signal-scenario-leo-signal-signals-noise = сценарій leo-signal | сигналів: { $runs } | рівень шуму { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = ліворуч: обмежена за смугою PSD кожного проєкту (dB нижче піку, у межах його смуги передавання); праворуч: джитер коду проти сумарного C/N0 за інтервалу { $reference_spacing_chips } чіпа

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = невідомий діапазон '{ $other }' (очікується s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km має бути скінченним і додатним

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps має бути скінченним і додатним

engine-e-linkbudget-other-losses-db-must-be = other_losses_db має бути скінченним і >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k, якщо задано, має бути скінченним і додатним

engine-linkbudget-link-budget-band-km-bit = бюджет лінії зв'язку: діапазон { $value }, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, запас { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = не вдалося слухати на { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: слухає на tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: клієнт tcp підключився

engine-live-io-kshana-live-warning-is-not = kshana live: попередження: { $addr } не є адресою loopback; будь-хто, хто може до неї дістатися, може читати потік

engine-e-live-io-cannot-open = не вдалося відкрити { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: відкинуто клієнта tcp, який не встигав

engine-e-live-io-cannot-open-2 = не вдалося відкрити { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: попередження: { $addr } не є адресою loopback; будь-хто, хто може до неї дістатися, може надіслати цьому шару потік

engine-e-live-io-cannot-bind-udp = не вдалося прив'язати udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: слухає на udp { $addr }

engine-e-live-io-cannot-connect-to = не вдалося підключитися до { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: підключено до tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: читання послідовного порту { $path } на { $baud } baud (лише читання)

engine-live-io-the-was-closed-by-the = { $v1 } закрито іншою стороною (шар не перепідключається: запускайте його під наглядачем, який його перезапускає)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: використайте 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 або 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } не є послідовним пристроєм (tcgetattr завершився помилкою)

engine-e-live-io-cannot-set-baud = не вдалося встановити { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = не вдалося встановити режим лінії для { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial підтримується лише в Unix; використайте --file, --tcp або --stdin

engine-live-io-unknown-option = невідомий параметр { $s }

engine-live-io-cannot-read = не вдалося прочитати { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: платформа судна, калібрування { $calibration_s } s; ворота { $v2 }. Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу: відповідальність залишається на операторі.

engine-live-io-write-failed = запис не вдався: { $e }

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } поза межами 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = індекс вставки { $p } поза межами 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = файли Annex 3 містять кодів: { $gold } і { $ter }, очікується 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = AFS-I PRN { $v1 } з Annex 3 не є кодом Голда з g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = вторинного коду S{ $id } не існує (від S0 до S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 призначає коди лише ідентифікаторам вузлів від 1 до 12, а не { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } не вміщується у два біти (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } поза межами 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = очікується символів підкадру 1: { $SB1_SYMBOLS }

engine-e-lunar-afs-frame-subframe-data-lengths-expected = довжини даних підкадрів { $sb2 }/{ $sb3 }/{ $sb4 } (очікується { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = очікується символів: { $FRAME_SYMBOLS }, подано: { $soft }

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = рядок { $v1 }: очікується `row,column`

engine-e-lunar-afs-ldpc-line = рядок { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = рядок { $v1 }: ({ $r },{ $c }) поза межами { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: очікується інформаційних бітів: { $info_bits }, подано: { $info }

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = даних LSIS V1.0 немає в { $cache_dir } (задайте KSHANA_LSIS_DIR або запустіть xval/lunar-afs/fetch_lsis.sh, який завантажує { $LSIS_PDF_URL } і витягує його вкладення; вони не розповсюджуються разом із Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } не є закріпленим файлом LSIS

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } має SHA-256 { $got }, очікується { $want } (закріплено за LSIS V1.0 від 29 січня 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal, baseband, { $LSIS_VERSION }; еталонний генератор Kshana

engine-lunar-afs-waveform-afs-node = вузол AFS { $node_id }

engine-lunar-afs-waveform-afs-node-frame-toi = вузол AFS { $node_id }, кадр TOI { $toi }

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites має бути не меншим за 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites має бути не меншим за 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg має бути в [0, 90); отримано { $mask_deg }

engine-e-lunar-beacon-serialising-beacon-report = серіалізація звіту про маяки: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = звіт про маяки має серіалізуватися в об'єкт JSON

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Доповнення місячними поверхневими маяками — маска { $elevation_mask_deg } deg, епоха +{ $epoch_s } s, sigma_URE кожного маяка { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  супутників { $n_visible_sats }  маяків { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  реалізована 1-сигма: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }маяки покращують PDOP у { $f } раза;{ " " }

engine-lunar-beacon-larger-constellation-instead = натомість більше орбітальне угруповання: у { $f } раза{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = не вдалося прочитати місячні ефемериди { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = місячні ефемериди: перший рядок має бути `{ $MAGIC }`, знайдено `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = місячні ефемериди: файл порожній

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = місячні ефемериди: `# format:` має бути `states` або `elements`, знайдено `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = місячні ефемериди: немає рядків даних

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = місячні ефемериди: відсутній стовпець `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = місячні ефемериди: `# elements_frame:` має бути `icrf` або `mci`, знайдено `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = місячні ефемериди: `elements_frame: icrf` потребує `# epoch_jd_tdb:` (епохи, до якої віднесено елементи, а також у якій обчислюється поворот з ICRF у Місяць-фіксовану систему): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = місячні ефемериди: короткий рядок елементів { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = місячні ефемериди: рядок елементів { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = місячні ефемериди: рядок елементів { $v1 } має недодатну велику піввісь

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = місячні ефемериди: рядок елементів { $v1 } має ексцентриситет { $ecc } поза [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = місячні ефемериди: файл `states` потребує `# frame: icrf` або `# frame: mci`, знайдено `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = місячні ефемериди: файл станів `icrf` потребує `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = місячні ефемериди: короткий рядок стану { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = місячні ефемериди: рядок стану { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = місячні ефемериди: рядок стану { $v1 } не є скінченним

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = місячні ефемериди: рядок стану { $v1 } для супутника { $sat } іде назад у часі ({ $t } після { $last }); епохи мають строго зростати для кожного супутника

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Табульовані ефемериди станів з центром у Місяці (система { $e }), інтерпольовані за Лагранжем порядку { $LAGRANGE_ORDER } між епохами таблиці й зведені до MCMF через { $v2 }. Стани НЕ поширюються цим рушієм. Клас походження `published-ephemeris`: відмінний від усіх величин, отриманих з елементів.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Опубліковане ВИЗНАЧЕННЯ орбітального угруповання, задане в ICRF з центром у Місяці (`{ $v1 }`), поширене власним розв'язувачем Кеплера цього рушія в тій самій інерціальній системі й зведене до MCMF орієнтацією Місяця за IAU 2015 / WGCCRE (прецесійний полюс, аналітична фізична лібрація) на кожну епоху. БЕЗ наближення системи відліку: джерело називає систему та епоху, і використано обидві. Клас походження `published-elements`: відмінний від усіх величин, отриманих з ядер.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Опубліковане ВИЗНАЧЕННЯ орбітального угруповання, поширене власним розв'язувачем Кеплера цього рушія та зведене моделлю середнього обертання Місяця — точно тим самим шляхом, яким іде ілюстративне угруповання, тож єдина відмінність між двома прогонами полягає в конструкції угруповання. Джерело задає елементи в системі `{ $v1 }`; тут їх прочитано як MCI, що нахиляє угруповання на `published_frame_tie_angle_deg`. Клас походження `published-elements`: відмінний від усіх величин, отриманих з ядер.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = невідомий station_datum { $other }: очікується "fixed" або "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = кампанія VLBI потребує щонайменше 2 станцій для утворення бази, отримано { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = станція { $name } має нескінченну координату

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = широта станції { $name } { $lat } deg поза [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = семипараметровий датум Гельмерта потребує щонайменше 3 неколінеарних маяків, отримано { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = маяк { $name } має нескінченну координату

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = широта маяка { $name } { $lat } deg поза [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours має бути додатним і скінченним, отримано { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min має бути додатним і скінченним, отримано { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = розклад з епох: { $v1 } виходить за 5000-епоховий запобіжник цього сценарію; збільште step_min або зменште arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s має бути додатним і скінченним, отримано { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg має бути скінченним і в [-90, 90), отримано { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg має бути скінченним і в [-90, 90), отримано { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol має бути скінченним і в [0, 1), отримано { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m має бути додатним і скінченним, отримано { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver має бути "spectral" або "srif", отримано "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = серіалізація результату lunar-frame-campaign: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = жодне спостереження в кампанії не проходить маску кута місця з боку Землі { $mask } deg на обох кінцях бази І маску { $earth_mask } deg над власним горизонтом маяка: епох: { $n_epochs } x баз: { $v1 } x маяків: { $n_beacons } усі відхилено. Збільште arc_hours, знизьте маску або перемістіть станції.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = повний ранг: усі 7 параметрів подібності обмежені цією кампанією (число обумовленості { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: { $defect } із 7 напрямків подібності неспостережні за цією кампанією, тому сигма датуму НЕ публікується; неспостережні напрямки перелічено в семипараметровому базисі

engine-lunar-frame-campaign-of-beacons-have-no-observation = маяки без спостережень у цьому розкладі: { $names } з { $beacons } ({ $names2 }); вони не несуть інформації, їхні сигми дорівнюють null, а датум реалізується лише зі спостережуваних маяків

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = усі сигми мають бути додатними

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane і altitude_km мають бути додатними

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency має бути в (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m проти наземної { $v2 } m сигми положення, середнє q { $v3 } (хі-квадрат 6 очікує 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: неоднозначностей: { $last }, успіх ILS { $last2 } (bootstrap { $last3 }) на найдовшій дузі

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: найменше інформаційне власне значення x{ $v } із зв'язками орбітального апарата, слід CRLB x{ $v2 }

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: точок розгортки: { $last }, дуг: { $v }; сигма поступальної складової x лазер проти GNSS: { $last2 } м на зареєстрованій локальній прив'язці

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB сигма h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = невідоме дослідження `{ $other }`: очікується одне з { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = набір вимірювань не визначає орбіту (сингулярна інформація)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials має бути не менше 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = наземні сигми мають бути додатними

engine-e-lunar-infra-od-unknown-station-dss-14-dss = невідома станція `{ $nm }`: DSS-14, DSS-63 або DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = замало наземних вимірювань для визначення орбіти

engine-e-lunar-infra-od-the-covariance-of-the-difference = коваріація різниці сингулярна

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = диференціальне уточнення NRHO не збіглося від зерна (seed)

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo потребує 0 < висота периселенія < висота апоселенія

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = невідоме сімейство орбіт `{ $other }`: nrho або elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s і arc_days мають бути додатними

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = немає спільного супутника між приймачами

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = нормальні рівняння фази несівної сингулярні

engine-e-lunar-infra-phase-the-position-block-is-singular = блок положення сингулярний

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = коваріація неоднозначностей не є додатно визначеною

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = сигми методик мають бути додатними

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = сигми локальної прив'язки мають бути додатними

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz має бути скінченним і додатним

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz має бути скінченним і додатним

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k має бути скінченним і додатним

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km має бути скінченним і більшим за місячний радіус

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity має бути в [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw має бути скінченним

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = неочікуваний заголовок каталогу відбивачів { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = закороткий рядок каталогу відбивачів { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = нечитке поле відбивача { $i } у { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = відбивач { $f }: |(x,y,z)| = { $norm3 } m, але в опублікованому стовпці радіуса вказано { $radius } m — рядок було змінено

engine-e-lunar-llr-reflector-catalogue-has-no-rows = каталог відбивачів не має рядків

engine-e-lunar-llr-unreadable-position-epoch-year = нечитке значення position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = неочікуваний заголовок каталогу станцій { $t }

engine-e-lunar-llr-short-station-catalogue-row = закороткий рядок каталогу станцій { $t }

engine-e-lunar-llr-unreadable-station-field-in = нечитке поле станції { $i } у { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = нечитний ідентифікатор ILRS у { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = каталог станцій не має рядків

engine-e-lunar-llr-cannot-read-this-scenario-runs = не вдається прочитати { $path } ({ $e }). Цей сценарій працює на зафіксованому зрізі реальних даних у { $DEFAULT_DATA_DIR }, який постачається з репозиторієм, але не з опублікованим пакетом (crate); вкажіть у `data_dir` його копію.

engine-e-lunar-llr-only-usable-normal-points-for = придатних нормальних точок: лише { $used } для відбивачів: { $reflectors } — замало для обмеження координат: { $v3 }; розширте зріз архіву

engine-e-lunar-llr-the-simulated-campaign-own-report = власний звіт змодельованої кампанії не вдалося розібрати: { $e }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: архівних нормальних точок: { $used } (розібрано: { $n_parsed }) зі станцій: { $station_counts } до ретрорефлекторних масивів: { $reflectors } за { $v5 } д; медіанна виміряна прецизійність нормальної точки { $median } мм в один бік; інформаційний ранг відбивачів { $rank }/{ $n }; ранг Гельмерта { $rank2 }/{ $n_helmert }, обумовленість { $condition }; сигма трансляції датума { $v12 } м; RMS залишку «спостережене мінус обчислене» в один бік { $rms_m } м ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg має бути скінченним і в [-90, 90), отримано { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } має нескінченну координату

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name }: широта { $lat_deg } deg поза [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = не вдалося серіалізувати звіт lunar-llr-datum: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = крок інтегрування має ділити крок виведення

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = приймач: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } має бути скінченним і невід'ємним

engine-lunar-receiver-must-be-finite-and-positive = { $n } має бути скінченним і додатним

## src/lunar_service.rs

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: експорт ділянки: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = місячні ефемериди { $path } охоплюють { $until } с після своєї епохи, але горизонт сценарію сягає { $last } с; скоротіть horizon_hours або отримайте довшу дугу (екстраполяцію табличних ефемерид відхилено)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path потребує epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = система OP на { $epoch } UTC (видима нормаль до орбіти Землі навколо Місяця, x уздовж її вузла на місячному екваторі IAU); місячні GM, J2 і C22 у зв'язаній із Місяцем системі IAU, треті тіла Земля й Сонце в положеннях DE440 з { $spk_path }; метод Рунге–Кутти четвертого порядку, крок 10 с

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m має бути скінченним і додатним

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m має бути скінченним і додатним

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 потребує height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites має бути 3 або 4, отримано { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs має бути від 1 до 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } має бути скінченним і додатним

engine-lunar-station-must-be-finite-and-not = { $name } має бути скінченним і невід'ємним

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } перевищує { $MAX_WORK }; зменште n_trials, укрупніть grid_lat_step_deg (або перелічіть менше точок), або збільште t_step_s / скоротіть t_span_s

engine-e-lunar-station-kind-must-be-got = kind має бути { $KIND }; отримано { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: ефемериди { $path } охоплюють { $until } с, але прогін сягає { $last } с (остання епоха плюс latency_s); скоротіть t_span_s

engine-e-lunar-station-no-case = { $KIND }: немає випадку ({ $j }, { $i }, { $k })

engine-lunar-station-points-epochs-trials = точок: { $n_grid_points } · епох: { $n_epochs } · випробувань: { $n_trials }

engine-lunar-station-hpl-max = HPL макс. { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } м

engine-lunar-station-survey-latency-bits = зйомка { $survey_sigma_m } м · затримка { $latency_s } с · біт: { $quantization_bits }

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines і samples мають бути від 2 до { $MAX_DEM_SIDE }, отримано { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: висот: { $heights_m } для сітки { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m має бути додатним, отримано { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m має бути додатним, отримано { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: не вдається прочитати { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection має бути south-polar-stereographic, отримано { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type має бути int16-le, отримано { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: не вдається прочитати { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: сітка перевищує межу в { $MAX_DEM_SIDE } пікселів

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } має { $bytes } байтів; { $lines } x { $samples } int16 потребує { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: SHA-256 { $digest } файлу { $img } не збігається із { $image_sha256 } з дескриптора

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor має бути додатним

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: не вдається прочитати { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: потрібно щонайменше 2 x 2 точки, зростальний діапазон у межах [-90, 90] deg і 360 deg довготи, а також скінченні висоти

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } має бути скінченним і додатним, отримано { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m має бути скінченним і невід'ємним, отримано { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg має бути не більше 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m має бути від 1 до 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: ділянка поза полем висот

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: заданий горизонт потребує непорожнього джерела

engine-e-lunar-terrain-terrain-stated-horizon = terrain: заданий горизонт: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: вкажіть dem_path або dem_tile_path, але не обидва

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km має бути скінченним і додатним

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m має бути скінченним і додатним

engine-e-lunar-terrain-site-deg-deg = { $e } (ділянка { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = невідомий годинник { $other }; очікується одне з optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks має називати щонайменше один клас годинників

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s має бути скінченним і додатним, отримано { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s має бути скінченним і більшим за tau_min_s ({ $lo }), отримано { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade має бути ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = доданок { $name } коротший за сітку tau

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | годинник { $clock } | 7-доданковий x_Σ(τ) за точками τ: { $taus } ({ $taus2 }–{ $taus3 } с) | перетин τ { $crossover_tau_s } с (x { $crossover_x_s } с) | поріг системи координат { $frame_term_s } с | x(1 d) годинника { $x_1day_ns } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: невідомий годинник { $other }; очікується одне з optical-master, passive-h-maser, rafs, mini-rafs, або вкажіть натомість device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: вкажіть clock або device_card, але не обидва

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s має бути скінченним і додатним, отримано { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } має бути скінченним і невід'ємним, отримано { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s мають бути додатними числами

engine-lunar-time-lab-station-height-not-modelled-exactly = висоту станції змодельовано неточно: похибка висоти в одну сигму { $height_sigma_m } м зміщує швидкість на { $value } ns/day, що застосовується як лінійний доданок від останнього підстроювання

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = світловий час не збігся до 1e-15 с за 30 ітерацій

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = шлях до ядра потребує planetary_kernel_path, earth_orientation_kernel_path і moon_orientation_kernel_path разом

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = невідомий датум { $other }: очікується "anchor-first-station", "free-network" або "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = розклад VLBI потребує щонайменше 2 станцій для утворення бази, отримано { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = координати маяка мають бути скінченними

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = широта маяка { $lat } deg поза [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = розклад з епох: { $v1 } виходить за межу цього сценарію в 20000 епох; збільште step_min або скоротіть arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g має бути додатним і скінченним, отримано { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = серіалізація результату lunar-vlbi-fim: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = жодне спостереження в розкладі не долає маску висоти { $mask } deg на обох кінцях бази: епох: { $n_epochs } x баз: { $v1 } — усі відхилено. Збільште arc_hours, зменште elevation_mask_deg або перемістіть станції.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = датум не залишає параметрів для оцінювання

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: неспостережуваних напрямків: { $defect } з { $dim }, тому сигма за координатою не повідомляється; наведене нижче значення спостережуваного підпростору є псевдооберненою, обмеженою спостережуваними напрямками (їх { $rank }), і НЕ є сигмою станції

## src/main.rs

engine-main-error-validate-needs-scenario-path = помилка: --validate потребує шляху до сценарію

engine-main-error-study-needs-suite-manifest = помилка: --study потребує шляху до маніфесту набору

engine-main-error-study-name-needs-value = помилка: --study-name потребує значення

engine-main-error-export-sp3-needs-path = помилка: --export-sp3 потребує шляху

engine-main-error-export-omm-needs-path = помилка: --export-omm потребує шляху

engine-main-error-export-oem-needs-path = помилка: --export-oem потребує шляху

engine-main-error-animate-needs-format-svg = помилка: --animate потребує формату: svg, html, frames або all

engine-main-error-animate = помилка: --animate: { $e }

engine-main-error-animate-fps-needs-whole = помилка: --animate-fps потребує цілого числа кадрів за секунду

engine-main-error-export-needs-format-czml = помилка: --export потребує формату: czml, kml, geojson, stk, sigmf, all або list

engine-main-error-animate-duration-needs-length = помилка: --animate-duration потребує тривалості в секундах

engine-main-error-import-route-needs-geojson = помилка: --import-route потребує шляху до файлу GeoJSON

engine-main-error-eop-needs-finals2000a-file = помилка: --eop потребує шляху до файлу finals2000A

engine-main-error-unknown-option = помилка: невідомий параметр '{ $other }'

engine-main-error-unexpected-argument-one-scenario = помилка: неочікуваний аргумент '{ $other }'; один файл сценарію на запуск

engine-main-warning-animate-fps-and-animate = попередження: --animate-fps і --animate-duration нічого не роблять без --animate

engine-main-error-animate-exports-one-scenario = помилка: --animate експортує один прогін сценарію; його не можна поєднувати з --validate або --study

engine-main-error-validate-lints-one-scenario = помилка: --validate перевіряє один сценарій; не передавайте додатково файл сценарію

engine-main-error-cannot-read = помилка: не вдається прочитати { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind розпізнано; цей kind не вимагає жодного поля (порожнє тіло запускає його еталонну конфігурацію), тож перевіряти більше нічого

engine-main-error-study-runs-suite-do = помилка: --study запускає набір; не передавайте додатково окремий файл сценарію

engine-main-warning-study-name-is-ignored = попередження: --study-name ігнорується разом із --study; назву дослідження задає `title =` у маніфесті набору

engine-main-error-cannot-read-2 = помилка: не вдається прочитати { $path }: { $e }

engine-main-hint-kshana-example-lists-the = підказка: `kshana example` перелічує вбудовані еталонні сценарії; `kshana example clock-holdover > clock-holdover.toml` записує один із них

engine-main-error-cannot-read-3 = помилка: не вдається прочитати { $eop_file }: { $e }

engine-main-error-eop = помилка: --eop: { $e }

engine-main-error-cannot-read-4 = помилка: не вдається прочитати { $route_file }: { $e }

engine-main-error-import-route = помилка: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: не застосовується: { $why }

engine-main-error-export = помилка: --export: { $e }

engine-main-error-animate-2 = помилка: --animate { $f }: { $e }

engine-main-error-export-2 = помилка: експорт { $fmt }: { $e }

engine-main-error-cannot-write = помилка: не вдається записати { $json_path }: { $e }

engine-main-error-cannot-write-2 = помилка: не вдається записати { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = помилка: не вдається побудувати звіт: { $e }

engine-main-error-cannot-write-3 = помилка: не вдається записати { $html_path }: { $e }

engine-main-error-cannot-write-4 = помилка: не вдається записати { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = помилка: не вдається записати { $csv_path }: { $e }

engine-main-wrote-and = записано { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } і { $csv_path }

engine-main-wrote-and-2 = записано { $json_path }, { $svg_path }, { $html_path } і { $report_json_path }

engine-main-error-cannot-write-6 = помилка: не вдається записати { $target }: { $e }

engine-main-error-cannot-write-7 = помилка: не вдається записати { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = помилка: експорт SP3 не вдався: { $e }

engine-main-error-cannot-write-8 = помилка: не вдається записати { $omm_path }: { $e }

engine-main-error-omm-export-failed = помилка: експорт OMM не вдався: { $e }

engine-main-error-cannot-write-9 = помилка: не вдається записати { $oem_path }: { $e }

engine-main-error-oem-export-failed = помилка: експорт OEM не вдався: { $e }

engine-main-error-unexpected-argument-after-kinds = помилка: неочікуваний аргумент '{ $other }' після `kinds`; приймається лише --json

engine-main-bundled-reference-scenarios-write-one =
    Вбудовані еталонні сценарії ({ $v1 }). Запишіть один із них у файл і запустіть його:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (не вбудовано: { $name } — причину дивіться за `kshana example { $name }`)

engine-main-error-is-not-bundled-it = помилка: '{ $name }' не вбудовано: він { $why }

engine-main-error-no-bundled-scenario-named = помилка: немає вбудованого сценарію з назвою '{ $name }'; `kshana example` перелічує вбудовані, їх { $v1 }

engine-main-error-cannot-read-5 = помилка: не вдається прочитати { $suite_path }: { $e }

engine-main-wrote-and-3 = записано { $json_path } і { $html_path }

engine-main-error-needs-value = помилка: { $a } потребує значення

engine-main-error-expected-mean-needs-number = помилка: --expected-mean потребує числа

engine-main-error-unknown-imu-fit-option = помилка: невідомий параметр imu-fit { $x }

engine-main-error-imu-fit-needs-an = помилка: imu-fit потребує шляху до журналу IMU

engine-main-error-needs-value-2 = помилка: { $args } потребує значення

engine-main-error-epoch = помилка: --epoch: { $e }

engine-main-error-unknown-bench-export-option = помилка: невідомий параметр bench-export { $a }

engine-main-error-bench-export-needs-scenario = помилка: bench-export потребує шляху до сценарію

engine-main-needs-value = { $a } потребує значення

engine-main-site-takes-lat-lon-height = --site приймає lat,lon[,height_m], отримано { $v }

engine-main-error-is-bytes-the-tle = помилка: { $p } має { $m } байтів; обмеження для TLE становить { $cap } (4 MiB)

engine-main-error-cannot-read-6 = помилка: не вдається прочитати { $p }: { $e }

engine-main-unknown-sky-option = невідомий параметр sky { $a }

engine-e-main-svg-and-monte-carlo-are = --svg і --monte-carlo — окремі виходи; вкажіть один

engine-main-error-preset-needs-name =
    помилка: --preset потребує назви
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    помилка: --profile потребує файлу
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = символів: { $r }, кадрів знайдено: { $r2 }; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }кадр на { $f }: FID { $f2 } TOI { $f3 } (метрика SB1 { $f4 }, помилок SP: { $f5 }, помилок SB1: { $f6 })

engine-main-not-checked = не перевірено: { $r }

engine-main-wrote-frame-of-6000-symbols = записано { $out }: кадрів: { $frames } по 6000 символів; підкадри від 2 до 4 є заповнювачами (без кодування LDPC, без повідомлення)

engine-main-error-cannot-write-10 = помилка: не вдається записати { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = невідома підкоманда lunanet-afs-check { $other }

engine-main-needs-pack-id = { $cmd } потребує ідентифікатора пакета

engine-main-unknown-standards-pack-run-option = невідомий параметр запуску standards-pack { $a }

engine-main-unknown-standards-pack-subcommand = невідома підкоманда standards-pack { $other }

engine-main-error-out-needs-value = помилка: --out потребує значення

engine-main-error-unknown-compliance-report-option = помилка: невідомий параметр compliance-report { $a }

engine-main-error-compliance-report-needs-at = помилка: compliance-report потребує щонайменше одного файлу результатів .json

engine-main-runs-read-not-used-rows = прогонів прочитано: { $runs }, не використано: { $unrecognised }; рядки: підтверджено доказами: { $n }, частково: { $n2 }, без доказів: { $n3 }, поза обсягом: { $n4 }

engine-main-error-receiver-trust-needs-scenario = помилка: receiver-trust потребує шляху до сценарію

engine-main-error-invalid-receiver-trust-scenario = помилка: некоректний сценарій receiver-trust: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = робота двигуна вичерпує масу: m0={ $m0_kg } кг, ṁ={ $mdot } кг/с, робота={ $burn_s } с ⇒ mf={ $mf } кг

engine-e-maneuver-time-of-flight-must-be = час польоту має бути додатним

engine-e-maneuver-collinear-endpoints-transfer-plane-is = колінеарні кінцеві точки: площина переходу не визначена (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs призначено для M >= 1; для M = 0 використовуйте lambert

engine-e-maneuver-no-revolution-transfer-the-time = немає переходу з оборотами: { $revs }: час польоту менший за мінімальний

engine-e-maneuver-grid-step-days-must-be = grid_step_days має бути додатним, отримано { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = кожне вікно має йти вперед (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = у вікнах немає переходу запитаного типу

engine-e-maneuver-the-optimum-left-the-feasible = оптимум вийшов за допустиму область

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: очікується 3 значення

engine-e-mars-od-dss-epoch-is-not-2003 = епоха DSS-{ $id } не є 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } не має DXYZ

engine-e-mars-od-no-coordinates-for-dss = немає координат для DSS { $station }

engine-e-mars-od-no-ramps-for-dss = немає ramp-таблиць для DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = ramp-таблиця не покриває інтервал

engine-e-mars-od-epoch-outside-the-integrated-span = епоха { $et } поза інтегрованим інтервалом

## src/mars_od.rs

engine-e-mars-od-normal-matrix-is-not-positive = нормальна матриця не є додатно визначеною

engine-e-mars-od-no-points = немає точок

engine-e-mars-od-parameter-has-no-partial-on = параметр не має частинної похідної на збережених точках

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — користувач { $user }, годинник { $clock_class }: просторова 3-D похибка положення проти істини (зведена RMS { $converged_pos_rms_m } м)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = матриця попарних порівнянь порожня

engine-e-mcda-ahp-pairwise-matrix-is-not-square = матриця попарних порівнянь не квадратна (рядок { $i } має { $row } з { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = елемент a[{ $i }][{ $j }] = { $v } має бути скінченним і додатним

engine-e-mcda-ahp-diagonal-must-be = діагональ a[{ $i }][{ $i }] = { $row } має дорівнювати 1

engine-e-mcda-ahp-entries-must-be-reciprocal = елементи a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } мають бути взаємно оберненими (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = верхній рядок { $i } містить елементів: { $row }, очікується { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = верхній елемент ({ $i },{ $j }) = { $v } має бути скінченним і додатним

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: порожня матриця рішень

engine-e-mcda-copras-copras-no-criteria = COPRAS: немає критеріїв

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: потребує щонайменше одного критерію витрат (Min)

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: значення { $x } альтернативи { $i } за критерієм { $j } має бути скінченним і > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: порожній набір даних

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: немає критеріїв

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: альтернатива { $i } має нескінченне значення

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: порожня матриця рішень

engine-e-mcda-moora-moora-no-criteria = MOORA: немає критеріїв

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: альтернатива { $i } має нескінченне значення

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: критерій { $j } має нульову норму L2

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: порожня матриця рішень

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: немає критеріїв

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: альтернатива { $i } має нескінченне значення

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: порожня матриця рішень

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: немає критеріїв

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: альтернатива { $i } має нескінченне значення

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = адитивна корисність не має атрибутів

engine-e-mcda-utility-attributes-but-weights = атрибутів: { $attributes }, а ваг: { $weights }

engine-e-mcda-utility-invalid-scaling-constant = недійсна масштабна стала { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = масштабні сталі в сумі дають нуль

engine-e-mcda-utility-attribute-values-expected-got = очікувана кількість значень атрибутів: { $attributes }, отримано { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: порожня матриця рішень

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: немає критеріїв

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: альтернатива { $i } має нескінченне значення

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: порожня матриця рішень

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: немає критеріїв

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } має лежати в [0, 1]

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: значення { $x } альтернативи { $i } за критерієм { $j } має бути скінченним і > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: порожня матриця рішень

engine-e-mcda-wpm-wpm-no-criteria = WPM: немає критеріїв

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: значення { $x } альтернативи { $i } за критерієм { $j } має бути скінченним і > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = матриця рішень не має критеріїв

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = матриця рішень не має альтернатив

engine-e-mcda-wsm-criterion-has-an-invalid-weight = критерій '{ $name }' має недійсну вагу { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = ваги критеріїв у сумі дають нуль

engine-e-mcda-wsm-alternative-has-non-finite-value = альтернатива '{ $name }' має нескінченне значення за критерієм '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = не DAF: коротший за один запис

engine-e-naif-kernel-not-daf-identification-word = не DAF: ідентифікаційне слово { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = непідтримуваний двійковий формат DAF { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = неправдоподібний заголовок DAF: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = адреса DAF { $addr } за кінцем файлу

engine-e-naif-kernel-bad-daf-address-range = хибний діапазон адрес DAF { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = список зведень DAF не завершується

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = некоректний сегмент типу 2: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = розмір сегмента типу 2 не відповідає його каталогу

engine-e-naif-kernel-epoch-outside-the-record = епоха { $et } поза записом [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = розмір сегмента типу 1 не відповідає його N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = некоректний запис типу 1: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = не SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = зведення SPK не має ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = немає даних SPK типу 1/2 для тіла { $target } на ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = сегмент SPK для { $target } заданий у системі координат { $frame }, а не J2000

engine-e-naif-kernel-spk-centre-chain-does-not = ланцюжок центрів SPK не сягає барицентра

engine-e-naif-kernel-not-binary-pck = не двійковий PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = зведення PCK не має ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = немає даних PCK типу 2 для системи координат { $body_frame } на ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = система координат PCK { $body_frame } задана відносно системи { $other }, яка не є J2000 чи ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = хибне число { $s }

engine-e-navsignal-must-be-positive-number = { $s } має бути додатним числом

engine-e-navsignal-modulation-expected-name-args-bpsk = модуляція { $label }: очікується NAME(args), наприклад BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = модуляція { $label }: бракує закривної дужки

engine-e-navsignal-modulation-is-not-one-of = модуляція { $label } не є жодною з BPSK(n), BOC(m,n) чи MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = незавершена сутність у { $s }

engine-e-ndm-xml-bad-character-reference = хибне посилання на символ &{ $ent };

engine-e-ndm-xml-unknown-entity = невідома сутність &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = незавершена інструкція обробки

engine-e-ndm-xml-unterminated-comment = незавершений коментар

engine-e-ndm-xml-unterminated-declaration = незавершена декларація

engine-e-ndm-xml-expected-an-element-at-byte = очікується елемент на байті { $pos }

engine-e-ndm-xml-unterminated-start-tag = незавершений початковий тег

engine-e-ndm-xml-attribute-without-value = атрибут без значення

engine-e-ndm-xml-unterminated-attribute-value = незавершене значення атрибута

engine-e-ndm-xml-unterminated-end-tag = незавершений кінцевий тег

engine-e-ndm-xml-unterminated-cdata = незавершений CDATA

engine-e-ndm-xml-content-after-the-root-element = вміст після кореневого елемента

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } має бути скінченним і невід'ємним

engine-e-nma-budget-subframe-must-be-positive = subframe_s має бути додатним

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps має бути додатним

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed має бути 0 або додатним

engine-e-nmea-synth-cli-unexpected-argument = неочікуваний аргумент { $s }

engine-nmea-synth-cli-instructor-log = журнал інструктора: { $e }

engine-nmea-synth-cli-instructor-log-and = журнал інструктора: { $jp } і { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = сервер TCP слухає на { $s }; очікування клієнтів: { $wait_clients }

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = очікується YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = дата або час поза діапазоном (роки від 1980 до 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = такої календарної дати не існує

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } має бути скінченним числом

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s має лежати в діапазоні від 1 до 86400 с

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz має бути 1, 2, 5 або 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = положення судна має лежати в межах 89 градусів від екватора

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn має лежати в діапазоні від 0 до 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = обмеження швидкості повороту й прискорення судна мають бути додатними

engine-e-nmea-synth-config-give-at-least-one-waypoint = вкажіть щонайменше один [[waypoint]] або vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = waypoint { $v1 } поза діапазоном

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = waypoint { $v1 }: speed_kn має лежати в діапазоні від 0 до 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems має називати щонайменше одне орбітальне угруповання

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } не є жодним із { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s має бути не менше 1

engine-e-nmea-synth-config-event = подія { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s має лежати всередині прогону

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s має бути додатним; ramp_s і recovery_s невід'ємними

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s не має перевищувати duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } не застосовується до цього kind

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz має лежати в діапазоні від 20 до 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db обов'язковий

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db має лежати в діапазоні від 0 до 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db має лежати в діапазоні від 0 до 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m обов'язковий

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m має лежати в діапазоні від 0 до 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = відведення прискорювало б хибний трек до { $need } m/s^2, що вище за max_accel_mps2 = { $a }; збільште ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = вкажіть рівно одне з bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s обов'язковий

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s має бути ненульовим і в межах доби

engine-e-nmea-synth-config-delay-is-required = delay_s обов'язковий

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s має лежати в діапазоні від 0 до 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = лінія горизонту не описує жодної перешкоди

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } завершено

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = від T+{ $start_s } с тривалістю { $duration_s } с (наростання на початку { $ramp_s } с, наростання відновлення { $recovery_s } с)

engine-nmea-synth-log-jamming-received-n0-falls-by = глушіння: прийняте C/N0 падає до { $cn0_drop_db } dB (розкид за супутниками { $spread_db } dB); супутники випадають, і рішення втрачається, коли придатними лишається менше чотирьох

engine-nmea-synth-log-towards-deg-true = у напрямку { $b } deg істинних

engine-nmea-synth-log-towards-deg-true-deg-relative = у напрямку { $t } deg істинних ({ $r } deg відносно курсу на початку, далі утримується)

engine-nmea-synth-log-natural-degradation-the-sky-closes = природна деградація: небо закривається за заданою лінією горизонту ({ $e }); супутники за нею лишаються в переліку без SNR і не використовуються, C/N0 решти не змінюється, і нічого не підроблено

engine-nmea-synth-log-instructor-log = ЖУРНАЛ ІНСТРУКТОРА: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Примітка тренера: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Початок { $start_utc }   тривалість { $duration_s } с   зерно (seed) { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }ПІКИ  істинні: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   повідомлені: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: невідоме орбітальне угруповання { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Допуск нижчий за поріг шуму читання рангу f64 { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): його еквівалентний поріг власних значень rel_tol^2 = { $v1 } лежить під шумом округлення матриці Грама, тож додаткові напрямки є арифметичним залишком, а не спостережуваністю.

engine-observability-gramian-rank-clamped-from-the-singular = ранг обмежено з кількості сингулярних значень { $counted } до min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } за rel_tol { $rel_tol }: матриця { $n_rows }x{ $n_cols } не може мати ранг { $counted }.{ $floor_note }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = байтів: { $bytes } — не ціле число 36-байтових записів

engine-e-odf-record-precedes-any-group-header = запис { $v1 } передує будь-якому заголовку групи

engine-e-odf-no-orbit-data-group = немає групи даних орбіти

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } не є ключовим словом { $name }

engine-e-odm-without = { $name } без { $k }

engine-e-odm-needs-exactly-one-of = { $name } потребує рівно одного з { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION і MESSAGE_ID є ключовими словами заголовка версії 3.0 (версія { $version })

engine-e-odm-unexpected-line = неочікуваний рядок { $b }

engine-e-odm-unknown-keyword = невідоме ключове слово { $k }

engine-e-odm-block-repeated-or-out-of = блок { $block } повторено або подано поза порядком на { $key }

engine-e-odm-repeated = { $key } повторено

engine-e-odm-comments-after-the-last-keyword = коментарі після останнього ключового слова

engine-e-odm-given-twice = { $b } задано двічі

engine-e-odm-opm-without-metadata = OPM без метаданих

engine-e-odm-opm-without-state-vector = OPM без вектора стану

engine-e-odm-omm-without-metadata = OMM без метаданих

engine-e-odm-omm-without-mean-elements = OMM без середніх елементів

engine-e-odm-is-not-keyword-of-the = { $k } не є ключовим словом блоку { $kind }

engine-e-odm-block-without = блок { $kind } без { $k }

engine-e-odm-block-with-data-lines = блок { $kind } з рядками даних

engine-e-odm-line-has-values-expected = рядок { $l } блоку { $kind } має значень: { $l2 }, очікується { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } не є ключовим словом метаданих OCM

engine-e-odm-ocm-metadata-without = метадані OCM без { $k }

engine-e-odm-block-repeated = блок { $kind } повторено

engine-e-odm-inside-block = { $t } усередині блоку

engine-e-odm-unsupported-ocm-block = непідтримуваний блок OCM { $tag }

engine-odm-outside-block = { $t } поза блоком

engine-e-odm-closes-block = { $t } закриває блок { $want }

engine-e-odm-unexpected-line-2 = неочікуваний рядок { $t }

engine-e-odm-outside-block = { $k } поза блоком

engine-e-odm-unterminated-block = незавершений блок

## src/oem.rs

engine-e-oem-epoch-missing-date-time-separator = в епосі бракує роздільника дати й часу 'T': { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = непідтримувана дата епохи OEM '{ $date }' (очікується yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = непідтримуваний час епохи OEM '{ $time }' (очікується HH:MM:SS)

engine-e-oem-bad-epoch-year = хибний рік епохи: { $d }

engine-e-oem-bad-epoch-month = хибний місяць епохи: { $d }

engine-e-oem-bad-epoch-day = хибний день епохи: { $d }

engine-e-oem-bad-epoch-hour = хибна година епохи: { $t }

engine-e-oem-bad-epoch-minute = хибна хвилина епохи: { $t }

engine-e-oem-bad-epoch-second = хибна секунда епохи: { $t }

engine-e-oem-oem-epoch-field-out-of = поле епохи OEM поза діапазоном: { $s }

engine-e-oem-unexpected-oem-header-line = неочікуваний рядок заголовка OEM: { $line }

engine-e-oem-expected-meta-start-found = очікується META_START, знайдено: { $line }

engine-e-oem-unexpected-oem-metadata-line = неочікуваний рядок метаданих OEM: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = у метаданих сегмента OEM бракує META_STOP

engine-e-oem-oem-metadata-missing-object-name = у метаданих OEM бракує OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = у метаданих OEM бракує OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = у метаданих OEM бракує CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = у метаданих OEM бракує REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = у метаданих OEM бракує TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = у метаданих OEM бракує START_TIME

engine-e-oem-oem-metadata-missing-stop-time = у метаданих OEM бракує STOP_TIME

engine-e-oem-oem-data-line-needs-position = рядок даних OEM потребує компонент положення+швидкості (6) або +прискорення (9), отримано { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = нечислове значення стану OEM '{ $t }' у: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = в OEM бракує заголовка CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = в OEM бракує заголовка CREATION_DATE

engine-e-oem-oem-missing-originator-header = в OEM бракує заголовка ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM не містив сегментів

engine-e-oem-no-covariance-start-block = немає блоку COVARIANCE_START

engine-e-oem-no-covariance-stop = немає COVARIANCE_STOP

engine-e-oem-bad-covariance-value = хибне значення коваріації '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = очікується 21 значення коваріації, знайдено { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = експорт OMM потребує повних TLE (рядок 1 + рядок 2); цей блок їх не має

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } має бути в [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg має бути в [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave має бути "plane" або "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction має бути "downlink" або "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = записи availability_targets_pct мають бути в (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h має бути не більше 8760 (один рік)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: кроків { $steps } більше, ніж результат вміщує ({ $MAX_STEPS }); збільште step_s або скоротіть duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = невідомий клас годинника "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = кожна ділянка потребує назви

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = ділянка { $name }: широта/довгота поза діапазоном

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = ділянка { $name }: altitude_m має бути в [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm за висоти { $elevation_deg } deg, запас { $margin0 } dB до атмосфери; найкраща ділянка { $scn } { $v5 } %; мережа (ділянок: { $order }): { $last } % за незалежної / { $last2 } % за корельованої погоди (MODELLED, консультативно)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = блок rinex розібрано, але він не містив підтримуваних ефемерид

## src/orbit.rs

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg має бути в [-90, 90], і кожне поле скінченне

engine-e-orbit-no-satellites-to-export = немає супутників для експорту

engine-e-orbit-time-step-must-be-positive = time.step_s має бути додатним для експорту SP3

engine-e-orbit-time-step-must-be-positive-2 = time.step_s має бути додатним для експорту OEM

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } має бути додатним; отримано { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s має бути скінченним і невід'ємним

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate має бути скінченним і невід'ємним

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = мінімальна висота спуфера має бути в [0, 90) градусів

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns перехресної перевірки має бути скінченним і невід'ємним

engine-orbital-timing-the-in-plane-neighbour-degrees = сусід у тій самій площині, попереду на { $v1 } градусів, лежить поза зоною покриття одного спуфера ({ $v2 } градусів у поперечнику)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = сусід у тій самій площині, попереду на { $v1 } градусів, може лежати в зоні покриття того самого спуфера ({ $v2 } градусів у поперечнику), тож обидва годинники можуть бути зсунуті разом

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = бракує вхідного файлу

engine-e-osnma-cli-max-time-error-has-no = --max-time-error не діє без --reference-time

engine-e-osnma-cli-not-number = не число: { $s }

engine-e-osnma-cli-public-key-must-be-id = відкритий ключ має мати вигляд ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = тип відкритого ключа має бути p256 або p521

engine-e-osnma-cli-unknown-format = невідомий формат { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } не є текстом; для потоку UBX використовуйте --format ubx

engine-e-osnma-cli-vector-csv-needs-start-gst = вектор CSV потребує --start-gst або назви файлу з датою

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    помилка: не вдається прочитати { $input }: { $e }

engine-osnma-cli-galileo-osnma-verification =
    Перевірка Galileo OSNMA
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = вхід: { $input } (сторінок: { $pages })

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: кадрів: { $frames }; сторінок I/NAV декодовано: { $inav_pages }, розміщено в часі: { $pages } (хибний CRC: { $bad_crc }, не вдалося розмістити: { $unstamped }, конфліктів часу: { $time_conflicts })

engine-osnma-cli-overall-nma-status = загалом: { $status_word }   стан NMA: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ТРИВОГА: отримано перевірене повідомлення-тривогу OSNMA. Припиніть використання даних OSNMA; нічого не повідомляється як автентифіковане.

engine-osnma-cli-freshness-not-enforced-no-reference = актуальність: НЕ примусова. Опорного часу не задано, тому часи підкадрів беруться з входу, і повторне відтворення старих даних пройшло б автентифікацію.

engine-osnma-cli-freshness-sub-frames-within-of = актуальність: використовуються підкадри в межах { $max_err } с від опорного часу { $v2 }; відкладено: { $set_aside }. Опорний час — єдиний момент.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }супутник  стан            автентиф.  невдало  очікує  відкинуто  остання автентиф.

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }епоха (підкадр тега)      tx   дані  adkd  ctr  результат

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = рядок { $v1 }: очікується 3 поля

engine-e-osnma-input-line-bad-svid = рядок { $v1 }: хибний SVID

engine-e-osnma-input-line-bad-bit-count = рядок { $v1 }: хибна кількість бітів

engine-e-osnma-input-line-data-is-not-hex = рядок { $v1 }: дані не є шістнадцятковими

engine-e-osnma-input-line-bit-count-does-not = рядок { $v1 }: кількість бітів не відповідає даним

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = допуск за часом має бути меншим за один підкадр ({ $SUBFRAME_S } с), отримано { $t } с

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = рефракція ITU-R P.834 визначена для висот станції від 0 до 3 км; отримано { $h_km } км

engine-e-passes-duration-and-step-must-be = duration_s і step_s мають бути додатними

engine-e-passes-station-lat-deg-must-be = station_lat_deg має бути в [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg має бути в [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours має бути скінченним і додатним

engine-e-passes-step-must-be-finite-and = step_s має бути скінченним і додатним

engine-passes-passes-pass-es-of-km = passes: прольотів: { $passes } орбіти { $altitude_km } km / { $inclination_deg }° над ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° за { $duration_hours } h; сумарний доступ { $total_access_s } с (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = закороткий запис { $record }: { $line }

engine-e-precise-products-bad-number-in = хибне число { $s } у { $line }

engine-e-precise-products-bad-field-in = хибне поле { $s } у { $line }

engine-e-precise-products-bad-antex-epoch = хибна епоха ANTEX { $s }

engine-e-precise-products-bad-offset = хибний зсув { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = постачальник ефемерид не має геоцентричного { $name } на JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| RMS 3D-похибки { $rms } м (макс. { $max } м)

engine-pvt-post-fit-rms = { " " }| RMS після підгонки { $mean_postfit_rms_m } м

engine-pvt-single-point-positioning-3d-error = Одноточкове позиціонування — 3D-похибка проти зйомочної координати (RMS { $rms_3d_m } м)

engine-pvt-single-point-positioning-post-fit = Одноточкове позиціонування — RMS залишків після підгонки (у середньому { $mean_postfit_rms_m } м)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = для методів доступу до масивів RunOutput потрібен NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } не є числовим масивом (список чисел або списків чисел однакової довжини)

engine-e-python-is-not-non-empty-list = { $path } не є непорожнім списком записів

engine-e-python-and-must-be-the-same = i та q мають бути однакової довжини ({ $i } проти { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: не захоплено (статистика { $statistic } < поріг { $threshold })

engine-python-design-prn-channels-at-most = каналів (проєкт, PRN): { $designs }; щонайбільше 256 на один прохід

engine-python-not-acquired-statistic-threshold = { $code }: не захоплено (статистика { $statistic } < поріг { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] потребує `label`

engine-e-python-runs-needs-result = runs[{ $i }] потребує `result`

engine-e-python-must-be-between-and-32 = { $name } має бути від 0 до 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | зерно (seed) { $seed } | v{ $engine_version } | квантові виграють: { $value }/{ $foms } FoM | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } з { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = невідомий baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = невідомий candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = taus/values ADEV мають бути скінченними і > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | кандидат { $candidate_source } | holdover часу { $timing_holdover_s } с проти { $timing_holdover_s2 } с ({ $timing_benefit_x }x) | інерційний { $inertial_holdover_s } с проти { $inertial_holdover_s2 } с ({ $inertial_benefit_x }x) | стійкість, вибіг { $coast_time_s } с{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = файл годинників RINEX оголошує систему часу { $id }, якої цей зчитувач не знає (відомі: { $known_clock_time_systems }); його відхилено замість читання його епох як часу GPS

engine-e-realdata-clk-rinex-clock-file-has-satellite = файл годинників RINEX має супутникову систему { $other } і не оголошує TIME SYSTEM ID; відмова вгадувати систему часу його епох

engine-e-realdata-clk-rinex-clock-files-declare-different = файли годинників RINEX оголошують різні системи часу ({ $s } і { $ts }); відмова об'єднувати їх на одній осі часу

engine-e-realdata-clk-no-as-or-ar-records = немає записів AS або AR для { $id }

engine-e-realdata-clk-short-circular-row = закороткий рядок Circular T: { $t }

engine-e-realdata-clk-bad-value-in = хибне значення { $s } у { $t }

engine-e-realdata-clk-no-section-mjd-header-found = не знайдено заголовка MJD розділу 1

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = незавершений закривний тег

engine-e-realdata-ion-sdr-unbalanced-closing-tag = незбалансований закривний тег

engine-e-realdata-ion-sdr-unterminated-tag = незавершений тег

engine-e-realdata-ion-sdr-attribute-value-missing = бракує значення атрибута

engine-e-realdata-ion-sdr-element-outside-the-document = елемент поза документом

engine-e-realdata-ion-sdr-text-outside-the-document = текст поза документом

engine-e-realdata-ion-sdr-element-left-open = елементів лишилося відкритими: { $stack }

engine-e-realdata-ion-sdr-expected-one-root-element-found = очікується один кореневий елемент, знайдено { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = невідомий формат частоти { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = непідтримуване кодування { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = потоків: { $streams }; читаються лише однопотокові файли

engine-e-realdata-ion-sdr-block-of-cycles-with-header = повторюється блок із { $cycles } циклів із заголовком або кінцівкою; читається лише один блок, що охоплює файл

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = фрагмент із { $words_per_chunk } слів по { $word_bytes } байтів

engine-e-realdata-ion-sdr-unsupported-sample-format = непідтримуваний формат відліків { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = квантування { $quantization } у { $packed_bits } упакованих бітах на відлік

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = частота дискретизації { $sample_rate_hz } Hz не кратна цілому коефіцієнту швидкості { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = фрагмент не вміщує жодної цілої групи

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = запитано відліки { $start }..{ $v1 }, у файлі { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = нечитна версія CRD { $f }

engine-realdata-llr-crd-crd-format-version-is-not = версія формату CRD { $v } не підтримується (лише 1 і 2 мають порядок полів запису 11, на який спирається цей зчитувач)

engine-realdata-llr-crd-unreadable-station-id = нечитний ідентифікатор станції { $f }

engine-realdata-llr-crd-unreadable-time-scale = нечитна шкала часу { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = шкала часу епохи CRD { $time_scale } не є однією з трьох, які специфікація формату дозволяє аналітикам (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); відмова читати її як UTC

engine-realdata-llr-crd-unreadable-h4-field = нечитне поле h4 { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = нечитне поле { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = нечитна подія епохи { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = нефізичний час польоту { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = не вдається прочитати каталог нормальних точок { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = у { $dir } немає файлів нормальних точок *.npt — цей сценарій читає реальні архівні вимірювання і без них не запуститься

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = хибне число '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM має нульовий вимір

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = кодування { $encoding }: пакет LuGRE подано в додатковому коді

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = байтів: { $bytes } — менше за заголовок IQS

engine-e-realdata-lugre-not-an-iqs-frame = не кадр IQS: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = частота дискретизації: метадані { $sample_rate_hz } Hz, заголовок { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = квантування: метадані { $quantization } біт, заголовок { $quant_bits } біт

engine-realdata-lugre-centre-frequency-metadata-hz-header = центральна частота: метадані { $center_freq_hz } Hz, заголовок { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = проміжна частота: метадані { $translated_freq_hz } Hz, заголовок { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = кількість відліків: розкладка метаданих дає { $layout }, заголовок { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = заголовок/кінцівка: метадані { $header_bytes }/{ $footer_bytes } байт, формат { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = довжина файлу { $file_len } не дорівнює заголовку + { $value } байт відліків + кінцівці

engine-realdata-lugre-field-missing = бракує поля { $key }

engine-e-realdata-lugre-field-unreadable = поле { $key } нечитне

engine-realdata-lugre-raw-line = рядок RAW { $v1 }: { $e }

engine-realdata-lugre-acq-line = рядок ACQ { $v1 }: { $e }

engine-realdata-lugre-nav-line = рядок NAV { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = рядок CLK { $v1 }: нечитний

engine-e-realdata-lugre-clk-row-columns-expected = рядок CLK { $v1 }: стовпців: { $v }, очікується 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = розбір JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = очікується об'єкт JSON на верхньому рівні

engine-e-realdata-yunnan-missing-recordtime-array = бракує масиву recordTime

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = не вдається прочитати файл EOP { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s має бути скінченним і невід'ємним, отримано { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = не вдається прочитати пізніший випуск файлу EOP { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = ПОРОЖНЬО, і це навмисно: рядок «прогнозоване проти остаточного» потребує епохи випуску з ПОВНИМ вікном підгонки (діб: { $window_days }) за нею та опублікованого остаточного Bulletin B на цільову епоху. Чинний вхід ({ $eop_source }) не дає жодної епохи, що відповідає обом умовам. Скоротіть `operational_window_days` або надайте довшу реальну серію finals2000A — жоден рядок не вигадується, щоб заповнити таблицю.

engine-realtime-frame-eop-measured-over-the-real-series = Виміряно на чинній реальній серії ({ $eop_source }). Кожен рядок є справжньою похибкою прогнозу: прогноз на T+h, сформований із рядків швидкого Bulletin A на момент T або раніше, оцінений проти ПІЗНІШЕ опублікованого остаточного Bulletin B на T+h. Персистентність оцінюється на тому самому наборі епох проти тих самих остаточних значень, тож два стовпці відрізняються предиктором і більш нічим. `improvement_factor` нижче 1 означає, що оперативний предиктор ГІРШИЙ за персистентність на цьому горизонті, і про це повідомляється так.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Виміряно на справжній парі з двох випусків: випуск «як видано» ({ $eop_source }) містить реальні прогнози Bulletin A за межею власного зрізу даних, а архівований пізніший випуск ({ $c }) містить остаточні значення Bulletin B, яких ці дати зрештою набули. Три прогнози оцінюються проти цього остаточного значення — сам архівований прогноз Bulletin A, підгонка цього крейта в оперативному стилі за випуском «як видано» і персистентність на межі зрізу.

engine-realtime-frame-eop-empty-and-deliberately-so-later = ПОРОЖНЬО, і це навмисно: пізніший випуск надано ({ $c }), але жодна дата не подана як Bulletin A PREDICTION у файлі «як видано» ({ $eop_source }) і як остаточне значення Bulletin B у пізнішому на жодному із запитаних горизонтів. Жоден рядок не синтезується.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = ПОРОЖНЬО, і це навмисно. Оцінювання СПРАВЖНЬОГО АРХІВНОГО прогнозу потребує двох випусків того самого продукту finals2000A; цей прогін отримав один ({ $eop_source }). Репозиторій не постачає архівованого раннього випуску, і його НЕ створюють збуренням наявного, адже синтезований архів зробив би кожне число в цій таблиці вимірюванням збурення. Надайте справжній архівований пізніший випуск через `eop_finals2000a_later`, щоб заповнити її. До того справжні похибки «прогнозоване проти остаточного», які цей звіт все ж містить, наведено в `table5_operational_vs_persistence`, де прогноз належить цьому крейту, а істиною є пізніше опубліковане остаточне значення Bulletin B.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Таблиця 1: постобробка { $c } м ({ $c2 } мс UT1) ↔ реальний час { $c3 } м ({ $c4 } мс UT1) | Таблиця 2: остаточний поріг { $floor } мс → горизонт { $far } д: { $far2 } мс | загальний бюджет { $total_m } м ({ $total_time_ns } нс) | важіль L19 + реальні дані L18 (перевірено), коваріація OD (змодельовано)

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Виміряно на справжній парі з двох випусків: ПРОГНОЗНЕ UT1 Bulletin A із файлу «як видано» ({ $eop_source }), віднятого від остаточного значення Bulletin B архівованого пізнішого випуску ({ $c }), на горизонтах: { $predicted_vs_final }.

engine-realtime-frame-eop-empty-and-deliberately-so-an = ПОРОЖНЬО, і це навмисно: архівований пізніший випуск надано ({ $c }), але жодна дата не подана як Bulletin A PREDICTION у файлі «як видано» ({ $eop_source }) і як остаточне значення Bulletin B у пізнішому на жодному із запитаних горизонтів, тож залишку «прогнозоване проти остаточного» для звіту немає. Жоден рядок не синтезується.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = ПОРОЖНЬО, і це навмисно: залишок «прогнозоване проти остаточного» потребує ДВОХ випусків того самого продукту finals2000A. Цей прогін отримав один ({ $eop_source }). Його рядки прогнозу Bulletin A стосуються майбутніх дат, які ще не мають остаточного Bulletin B, тож залишку для вимірювання не існує, і тут його не вигадують. Надайте архівований пізніший випуск через `eop_finals2000a_later`, щоб заповнити цю таблицю. До того багатодобове зростання, наведене в `table2_error_vs_horizon`, є предиктором ПЕРСИСТЕНТНОСТІ, оціненим на реальних остаточних значеннях, — реальною виміряною похибкою, але змодельованого предиктора, а не залишком прогнозу IERS Bulletin A.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = оцінювання судна потребує [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = уривок має { $excerpt } байтів; межа становить { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = уривок містить понад { $MAX_EXCERPT_EPOCHS } епох; скоротіть його

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = уривок закінчується всередині калібрувального вікна { $calibration_s } с (епох: { $epochs }): нічого не оцінено

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = немає епохи з позначкою UTC у журналі UBX

engine-e-receiver-trust-calibration-no-scenario-json-under = немає scenario.json у { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: відкладена чиста Pfa <= { $B1_MAX_PFA } (відкалібровано: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } має бути скінченним і > 0 (отримано { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel має бути скінченним і >= 0 (отримано { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used має бути не менше 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg має бути в [0, 90] (отримано { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg має бути в (0, 360] (отримано { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points має бути в [0, 100] (отримано { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio має бути скінченним і > 1 (отримано { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor має бути в (0, 100] (отримано { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) нижчий за degraded_min оцінки ({ $degraded_min }): сама геометрія могла б досягти смуги недовіри

## src/receiver_trust/geometry.rs

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: зниження за геометрією класифіковано як неузгодженість

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: повідомлено, не оцінено (геометрія не погана)

engine-receiver-trust-geometry-not-scored-the-score-deducts = не оцінено (оцінка знижується лише за HDOP вище { $hdop_max }, PDOP вище { $pdop_max } або за кількості супутників нижче { $min_used })

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = заявлений HDOP { $fmt_dop } розходиться з HDOP { $fmt_dop2 }, виведеним із заявленого неба, понад допуск

engine-receiver-trust-geometry-satellites-in-view-but-not = супутники у видимості, але не відстежувані ({ $g } з { $in_view } на висоті { $low_elev_deg } deg або вище): середовище сигналу, а не геометрія

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } вище за { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } вище за { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = супутників за заявленою лінією горизонту: { $m }

engine-receiver-trust-geometry-every-satellite-in-one-half = усі супутники в одній половині неба (проміжок { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = знижено геометрією: { $parts } ({ $from }); це не неузгодженість

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = журнал не містить епох: у ньому нічого не вдалося прочитати як { $name } (записів пропущено як пошкоджені чи нерозбірні: { $skipped_records }); перевірте налаштування формату

engine-receiver-trust-ingest-gps-week-tow = тиждень GPS { $week } TOW { $tow } с

engine-receiver-trust-ingest-gps-week-tow-2 = тиждень GPS { $w } TOW { $tow } с

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (дати немає в журналі)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } має бути скінченним і >= 0 (отримано { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s має бути більшим за 0

engine-e-receiver-trust-live-invalid-session = недійсний сеанс: { $e }

engine-receiver-trust-live-no-score-could-be-produced = не вдалося отримати оцінку: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = не вдалося прочитати жодного запису synchro чи pvt GNSS-SDR (рядків пропущено: { $skipped }); формат рядка описано в integrations/gnss-sdr/README.md

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = файл IMU порожній

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: немає стовпця `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: немає стовпця `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = файл IMU не містить жодного придатного до читання відліку

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis має бути 0, 1 або 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean має бути скінченним

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = час журналу не просувається

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = журнал закороткий для побудови кривої Аллана

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = початковий нахил кривої { $name } дорівнює { $v }, а не приблизно -0.5: білий шум не домінує (чи датчик нерухомий?), тому його коефіцієнт шуму ненадійний

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = крива { $name } закоротка для перевірки її нахилу

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = тиждень GPS { $week } TOW { $r } с

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = не вдалося прочитати жодного журналу BESTPOS, RANGE чи RXSTATUS (записів пропущено: { $skipped })

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = не знайдено дійсного кадру RTCM 3 (кандидатів, що не пройшли CRC: { $skipped })

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } має бути скінченним і > 0 (отримано { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard має бути в (0, 1) (отримано { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac має бути в [0, 1] (отримано { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } має бути в (0, 1) (отримано { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats має бути не менше 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s має бути не менше 2 с

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = конфігурація монітора: невідомий профіль "{ $other }"; відомі: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = конфігурація монітора: { $name } має бути скінченним і > 0 (отримано { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = конфігурація монітора: jam_ind_threshold має бути скінченним

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = конфігурація монітора: mask_deg має бути в [-90, 90) (отримано { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = конфігурація монітора: raim_pfa має бути в (0, 1) (отримано { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = конфігурація монітора: cn0_min_sats має бути не менше 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = конфігурація монітора: sats_lost має бути не менше 1

engine-receiver-trust-monitors-the-receiver-own-set-against = власний набір { $self_report_source } приймача проти моніторів Kshana; жоден із них не є еталонною істиною, збіг не є перевіркою

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = часова лінія приймача має нескінченний час епохи

engine-e-receiver-trust-monitors-the-log-is-shorter-than = журнал коротший за калібрувальне вікно: епох до { $cal_s } с: { $calibration_epochs } (журнал охоплює { $span } с); для побудови базової лінії потрібно щонайменше 3

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } має бути в ({ $lo }, { $hi }] (отримано { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } застосовується лише до kind = "vessel" (kind має значення "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = не вдається прочитати { $path }: збірка WebAssembly не має файлової системи; передайте файл безпосередньо як `text` або `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` не є дійсним стандартним base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: вкажіть одне з `path`, `text` або `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: вкажіть лише одне з `path`, `text` або `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } має бути додатним числом, отримано { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = подія { $label }: onset_s має бути невід'ємним числом

engine-e-receiver-trust-scenario-event-end-must-be-after = подія { $label }: end_s має бути після onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg і time_offset_s мають бути скінченними

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = довіра збережена протягом усього часу: жоден монітор не спрацював за епох після калібрування: { $after_cal }

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = перша тривога на { $t } с; епох без довіри: { $untrusted_epochs }, знижених: { $degraded_epochs } із { $after_cal } після калібрування

engine-receiver-trust-scenario-of-stated-events-detected-within = виявлено заявлених подій: { $events_detected } з { $events_evaluable } протягом { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = прогнозів C/N0 у межах { $cn0_tol_db } dB: { $predictions_agreeing } з { $predictions_evaluable }

engine-receiver-trust-scenario-trust-score-lowest-final = оцінка довіри: найнижча { $min }, кінцева { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = сценарій { $r } | receiver-trust | журнал { $format_name }, епох: { $epochs } за { $duration_s } с | моніторів: { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = це сценарій { $k }, а не receiver-trust

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } має бути скінченним (отримано { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: потрібно 0 < degraded_min < nominal_min <= 100 (отримано { $degraded_min } і { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s має бути скінченним і >= 0 (отримано { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: потрібно 0 <= onset_ratio < full_ratio (отримано { $onset_ratio } і { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: вага { $m } має бути в [0, 100] (отримано { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s має бути скінченним і додатним

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg має бути в (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 має бути скінченним і додатним

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m і rho0_kg_m3 мають бути скінченними і додатними

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m має бути в [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = входження в атмосферу (Аллен–Еггерс): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> пік { $v3 } g на { $v4 } km, { $velocity_at_peak_deceleration } m/s; нагрівання сягає піку за { $velocity_at_peak_heating } m/s; точкова маса (гравітація, кривина, US76) пік { $peak_deceleration_g } g (MODELLED балістично, без аеротермічних ефектів)

## src/registry.rs

engine-e-registry-unknown-scenario-id = невідомий ідентифікатор сценарію: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = смуга TRL ({ $lo },{ $hi }) сформована некоректно (потрібно 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = змодельоване твердження (лише симуляція) не може бути репрезентативним вище TRL { $MODELLED_TRL_CEILING } (смуга hi={ $hi }); вищий TRL є прогалиною, а не результатом симуляції

engine-representativeness-representativeness-representative-for-trl = Репрезентативність [{ $status }] — { $claim } (репрезентативно для TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = заявлено({ $arch }) x середня якість джерела

engine-resilience-score-weakest-rpcf-sub-score-bounded = найслабша підоцінка RPCF = { $min_sub }; обмежена деградація = { $bounded } (обмежується Level 2, якщо не обмежена)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = непідтримуваний заголовок навігаційного запису { $head }: рядок, що починається з '>', є заголовком запису RINEX 4, а не навігаційним записом RINEX 3

engine-e-rinex-bad-prn-in = хибний PRN у { $head }

engine-e-rinex-rinex-navigation-expected-record-header = навігація RINEX 4: очікується заголовок запису '>', знайдено { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = запис RINEX 4 { $head } має рядків: { $body }, ефемериди { $msg } потребують 8

engine-e-rinex-rinex-record-is-followed-by = за записом RINEX 4 { $head } іде { $body }, а не { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = хибне { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = у файлі спостережень RINEX немає END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = файл спостережень RINEX не містив записів епох

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s має бути скінченним і > 0 (отримано { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s має бути скінченним і > 0 (отримано { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) не має перевищувати time.duration_s ({ $duration_s })

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = частота дискретизації сумірна зі швидкістю коду ({ $samples_per_chip } відліків/чип, { $offset_from_integer_samples } відліків від цілого числа): репліка коду з утриманням нульового порядку не може розрізнити зміну фази коду менше за { $dead_band_chips } чипів, тож дискримінатор Early/Late є сходинковим із мертвою зоною в один відлік замість трикутного, і DLL встановлюється з хибним відставанням. Зсуньте частоту дискретизації від цілого кратного (5 MHz дає { $lit_4_8876 } відліків/чип; 25 MHz дає { $lit_24_4379 }) або збільште передискретизацію настільки, щоб мертва зона була нижчою за потрібну вам точність фази коду.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = код помилки SGP4 { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = непідтримуваний SigMF core:datatype { $other }: цей зчитувач обробляє комплексні типи cf32_le, ci16_le і ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: читаються лише одноканальні записи

engine-e-sigmf-cannot-serialise-sigmf-metadata = не вдається серіалізувати метадані SigMF: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = недійсний простір імен розширення SigMF { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = мап розширень анотацій: { $annotations } для анотацій: { $annotations2 }

engine-e-sigmf-extension-key-is-not-in = ключ розширення { $k } не належить простору імен { $ns }

engine-e-sigmf-extension-key-is-already-present = ключ розширення { $k } уже наявний

engine-e-sigmf-global-is-not-an-object = global не є об'єктом

engine-e-sigmf-annotations-is-not-an-array = annotations не є масивом

engine-e-sigmf-annotation-is-not-an-object = annotation не є об'єктом

engine-e-sigmf-invalid-sigmf-metadata-json = недійсний JSON метаданих SigMF: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = запис SigMF не вказує додатного core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = захоплення SigMF починається з відліку { $start }, за межами відліків у даних: { $data }

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } має бути в [0, 90) градусів, отримано { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } має бути скінченним числом, отримано { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: каньйон потребує width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m має бути додатним, отримано { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: висоти каньйону й antenna_m мають бути невід'ємними

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m має бути додатним, отримано { $l }

engine-e-skyline-skyline-table-is-empty = skyline: таблиця порожня

engine-e-skyline-skyline-table-has-rows-over = skyline: рядків у таблиці { $rows }, понад обмеження в { $MAX_TABLE_ROWS }

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: азимут таблиці { $az } поза [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: азимути таблиці мають суворо зростати ({ $az } іде після { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: секторів понад { $MAX_SECTORS }

engine-e-skyline-skyline-the-sector-az-from = skyline: сектор az_from = { $az_from } до az_to = { $az_to } порожній (повне коло задається таблицею або маскою)

engine-e-skyline-skyline-more-than-terrain-points = skyline: точок рельєфу понад { $MAX_TABLE_ROWS }

engine-e-skyline-skyline-terrain-distance-must-be = skyline: distance_m рельєфу має бути додатним, отримано { $distance_m }

engine-skyline-with-fields-overridden-or-added = { $provenance }; з полями, перевизначеними або доданими { $user }

engine-skyline-stated-input = Заявлений вхід: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = невідомий пресет skyline "{ $name }"; відомі пресети: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = технічний паспорт потребує щонайменше двох точок девіації Аллана

engine-e-slot-timing-datasheet-point-must-have-positive = точка технічного паспорта ({ $t }, { $s }) має мати додатний час усереднення й додатну девіацію Аллана

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s має бути додатним числом секунд

engine-e-slot-timing-phase-record-needs-at-least = запис фази потребує щонайменше 32 відліків для підгонки моделі шуму; отримано { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = запис фази містить нескінченний відлік

engine-e-slot-timing-the-phase-record-yields-fewer = запис фази дає менш як три точки девіації Аллана

engine-e-slot-timing-must-be-finite-and-non = { $name } має бути скінченним і невід'ємним; отримано { $v }

engine-e-slot-timing-the-slot-guard-must-be = захисний інтервал слота має бути додатним часом

engine-e-slot-timing-sigma-must-be-positive = k_sigma має бути додатним

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset має бути скінченним

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k має бути скінченним

engine-e-slot-timing-give-exactly-one-of-oscillator = вкажіть рівно одне з oscillator.class, oscillator.preset, oscillator.datasheet або oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = невідомий oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = невідомий oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = типове значення класу { $c }: sigma_y(1 s) з { $c2 }; поріг червоного шуму синтезовано на два й чотири порядки нижче (припущення, а не вимірювання)

engine-slot-timing-fitted-to-the-allan-deviation = підігнано до максимумів девіації Аллана з { $document } і масштабовано так, щоб лежати на кожній точці або вище

engine-slot-timing-slot-timing-source-guard-ns = slot-timing (джерело { $n }): захисний інтервал { $c } ns за k={ $k_sigma } порушується через { $fmt_s } після виправлення (залишилося { $fmt_s2 }); виправлення принаймні кожні { $fmt_s3 } (на добу: { $fixes_per_day }); домінантний доданок: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epoch '{ $s }' має бути YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = epoch '{ $s }': хибне { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb має бути скінченним

engine-e-solar-system-table-must-be-auto-table1 = table має бути auto, table1 або table2; отримано '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = немає ефемерид для лінії { $name } до { $name2 } на JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = епоха JD { $jd } TDB поза діапазоном від 3000 BC до 3000 AD, межами таблиць Стендіша

engine-e-solar-system-track-points-must-be-to = track_points має бути від 8 до 2000; отримано { $n_track }

engine-e-solar-system-unknown-observer-body = невідоме тіло спостерігача '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies має називати щонайменше одне тіло

engine-e-solar-system-unknown-body = невідоме тіло '{ $n }'

engine-e-solar-system-no-position-for-at-jd = немає положення для { $name } на JD { $jd } TDB (Плутон лише від 1800 AD до 2050 AD)

engine-e-solar-system-no-standish-elements-for = немає елементів Стендіша для { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), геліоцентричний стан прочитано власним зчитувачем рушія

engine-e-solar-system-unknown-link-body = невідоме тіло лінії '{ $from }'

engine-e-solar-system-unknown-link-body-2 = невідоме тіло лінії '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = лінія потребує двох різних тіл; отримано { $name }

engine-solar-system-light-time = світловий час { $one_way_light_time_s } с

engine-solar-system-link-one-way-two-way = { "  " }лінія { $from } -> { $to }: в один бік { $one_way_light_time_s } с, в обидва боки { $two_way_light_time_s } с, Шапіро { $l } us, Сонце { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = епоха { $input } · { $standish_table } · положення з елементів Стендіша

## src/sp3.rs

engine-e-sp3-epoch-needs-time-fields-got = епоха потребує 6 полів часу, отримано { $tokens }

engine-e-sp3-bad-second = хибна секунда: { $tokens }

engine-e-sp3-record-needs-values-missing-column = запис потребує 4 значень, бракує стовпця { $v1 }

engine-e-sp3-bad-number = хибне число: { $field }

engine-e-sp3-empty-sp3-input = порожній вхід SP3

engine-e-sp3-first-line-is-not-an = перший рядок не є заголовком SP3: { $first }

engine-e-sp3-unsupported-sp3-version-in = непідтримувана версія SP3 у { $first }

engine-e-sp3-missing-epoch-count-on-header = у рядку 1 заголовка бракує кількості епох

engine-e-sp3-record-has-no-satellite-id = запис не має ідентифікатора супутника: { $line }

engine-e-sp3-position-record-before-any-epoch = запис положення перед будь-яким заголовком епохи

engine-e-sp3-sp3-file-contained-no-epoch = файл SP3 не містив записів епох

engine-e-sp3-bad-accuracy-exponent-in = хибний показник точності { $f } у { $line }

engine-e-sp3-bad-header-accuracy = хибна точність заголовка { $t }

engine-e-sp3-short-line = закороткий рядок %f { $line }

engine-e-sp3-bad-base-in = хибна основа %f у { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = версія перевищує 3 біти

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID перевищує 11 біт (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count перевищує 14 біт (0..=16383)

engine-e-space-packet-data-field-must-be-at = поле даних має містити щонайменше один октет

engine-e-space-packet-data-field-exceeds-65536-octets = поле даних перевищує 65536 октетів

engine-e-space-packet-packet-shorter-than-the-octet = пакет коротший за 6-октетний заголовок: { $bytes } байтів

engine-e-space-packet-declared-data-length-header-octets = заявлена довжина даних { $data_len } (+6 заголовка) = { $total } октетів, але буфер має { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = грубі октети CUC { $coarse_octets } поза 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = точні октети CUC { $fine_octets } поза 0..=3 (розширений P-field не підтримується)

engine-e-space-packet-cuc-field-extended-field-not = P-field CUC { $p }: розширений P-field не підтримується

engine-e-space-packet-field-time-code-id-is = P-field { $p }: ідентифікатор часового коду { $id } не є CUC

engine-e-space-packet-field-is-not-cds-field = P-field { $p } не є P-field CDS

engine-e-space-packet-cds-field-reserved-sub-ms = P-field CDS { $p }: зарезервований код субміліс. 11

engine-e-space-packet-cuc-coarse-does-not-fit = грубе значення CUC { $coarse } не вміщується в { $c } октетів

engine-e-space-packet-cds-days-do-not-fit = доби CDS { $days } не вміщуються в { $f } октетів

engine-e-space-packet-cds-ms-of-day-above = мілісекунди доби CDS { $ms_of_day } вищі за 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = субмілісекунди CDS { $submillis } вищі за { $max_sub }

engine-e-space-packet-time-code-format-and-value = формат і значення часового коду належать різним кодам

engine-e-space-packet-time-code-no-field-octet = часовий код: немає октета P-field

engine-e-space-packet-time-code-needs-octets-present = часовий код потребує октетів: { $end }, наявно: { $bytes }

engine-e-space-packet-time-code-format-differs-from = формат часового коду відрізняється від неявного P-field

engine-e-space-packet-the-format-has-time-code = формат має поле часового коду; жодного не задано

engine-e-space-packet-the-format-has-no-time = формат не має поля часового коду

engine-e-space-packet-ancillary-data-is-octets-the = допоміжні дані: { $ancillary } октетів; формат вказує { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = вторинний заголовок має містити щонайменше один октет

engine-e-space-packet-secondary-header-needs-octets-present = вторинний заголовок потребує октетів: { $end }, наявно: { $bytes }

engine-e-space-packet-the-format-has-secondary-header = формат має вторинний заголовок; жодного не задано

engine-e-space-packet-the-format-has-no-secondary = формат не має вторинного заголовка

engine-e-space-packet-secondary-header-flag-disagrees-with = прапорець вторинного заголовка { $v1 } суперечить формату

engine-e-space-packet-data-field-shorter-than-the = поле даних коротше за PEC

## src/space_packet.rs

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } не збігається з CRC { $crc16_ccitt_false } пакета

engine-e-space-packet-nothing-to-segment-empty-user = нічого сегментувати: порожні дані користувача

engine-e-space-packet-max-user-octets-must-be = max_user_octets має бути не менше 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count перевищує 14 біт (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid }, а очікувався { $a }

engine-space-packet-sequence-count-repeated = лічильник послідовності { $sequence_count } повторено

engine-space-packet-sequence-count-gap-after-packet = пропуск у лічильнику послідовності: { $sequence_count } після { $last } (бракує пакетів: { $v2 })

engine-space-packet-sequence-count-out-of-order = лічильник послідовності поза порядком: { $sequence_count } після { $last }

engine-space-packet-packet-with-no-unit-open = пакет { $f } без відкритої одиниці даних

engine-space-packet-packet-while-unit-is-open = пакет { $f } при відкритій одиниці даних

engine-e-space-packet-packet = пакет { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = послідовність завершується незакритою одиницею даних (немає останнього пакета)

engine-e-space-packet-apid-must-be-in-2047 = apid має бути в діапазоні 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count має бути >= 1

engine-e-space-packet-data-len-must-be-in = data_len має бути в діапазоні 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = внутрішня помилка: розбіжність у циклі кодування й декодування

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 має бути скінченним і додатним

engine-e-space-weather-f107a-must-be-finite-and = f107a має бути скінченним і додатним

engine-e-space-weather-kp-must-be-in = kp має бути в діапазоні [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km не має бути порожнім

engine-e-space-weather-altitude-km-must-be-finite = висота { $h } km має бути скінченною і додатною

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; густина x{ $density_activity_factor } на { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: для джамера типу { $what } потрібне додатне значення bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: для чирп-джамера потрібне додатне значення sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to вказує невідомий діапазон { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: вкажіть або received_power_dbw, або eirp_dbw з додатним range_m (не обидва)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s має бути пізніше за on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: частота дискретизації має бути додатною

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } має бути степенем двійки, не менше 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: відліків { $x } менше, ніж один сегмент із { $nfft } точок

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } має бути степенем двійки, не менше 16

engine-e-spectrum-cannot-read-recording-meta-path = не вдалося прочитати meta_path запису { $meta_path }: { $e }

engine-e-spectrum-cannot-read-recording-data = не вдалося прочитати дані запису { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz має бути додатним

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: модуляцію { $m } вибрати не можна (лише galileo-e1 приймає "mboc" або "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: сигналу { $sig } немає в бібліотеці заданих сигналів ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: заданий сигнал має власну модуляцію; приберіть `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: для сигналу { $sig } не опубліковано прийнятої потужності; вкажіть signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: для користувацького діапазону потрібна `modulation`, наприклад "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: для користувацького діапазону потрібен signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: вкажіть або `signal`, або `centre_mhz`, не обидва

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: вкажіть rx_bandwidth_mhz (головну пелюстку виявити не вдалося)

engine-e-spectrum-duration-must-be-at-least = duration_s має бути не менше одного step_s

engine-e-spectrum-time-rows-is-more-than = рядків часу { $rows } більше, ніж дозволені 5000

engine-e-spectrum-at-most-extra-panels = щонайбільше 8 додаткових панелей

engine-e-spectrum-panel-need-max-mhz-min = панель { $name }: потрібно f_max_mhz > f_min_mhz і 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = сітка: потрібно f_max_mhz > f_min_mhz і 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = спектр сценарію | діапазонів: { $bands } | джамерів: { $jammers } | рівень шуму { $n0_db } dBW/Hz | найгірший діапазон { $name } мін. C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = спектр сценарію | без діапазонів | рівень шуму { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples має бути від 10 до 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: використайте cf32_le або ci16_le

engine-spectrum-frequency-across-time-down-colour = частота по горизонталі, час донизу, колір = спектральна густина потужності (dBW/Hz); рівень шуму { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = кожна панель має власний діапазон частот, одну часову вісь донизу, одну шкалу кольору (dBW/Hz); рівень шуму { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = система координат { $other } не має підтримуваного коду NAIF

engine-e-spk-writer-segment-name-longer-than-40 = назва сегмента довша за 40 символів: { $name }

engine-e-spk-writer-segment-name-has-non-printing = назва сегмента містить недруковані символи: { $name }

engine-e-spk-writer-bad-target-for-centre = хибна ціль { $target } для центра { $centre }

engine-e-spk-writer-degree-outside-27 = степінь { $degree } поза діапазоном 1..=27

engine-e-spk-writer-type-13-degree-is-not = степінь { $degree } типу 13 не є непарним

engine-e-spk-writer-descriptor-start-is-not-before = початок дескриптора не передує його кінцю

engine-e-spk-writer-epochs-are-not-strictly-increasing = епохи не зростають строго

engine-e-spk-writer-the-epochs-do-not-cover = епохи не покривають інтервал дескриптора

engine-e-spk-writer-type-or-13-segment-carries = сегмент типу 9 або 13 містить стани, а не записи

engine-e-spk-writer-type-segment-needs-at-least = сегмент типу 3 потребує щонайменше одного запису

engine-e-spk-writer-type-degree-outside-27 = степінь { $degree } типу 3 поза діапазоном 0..=27

engine-e-spk-writer-type-interval-length-is-not = довжина інтервалу { $intlen } типу 3 не є додатною

engine-e-spk-writer-type-record-has-coefficients-expected = запис { $i } типу 3 містить коефіцієнтів: { $value }, очікувалося { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = початок дескриптора йде після його кінця

engine-e-spk-writer-descriptor-starts-before-the-first = дескриптор починається раніше за перший запис

engine-e-spk-writer-descriptor-ends-after-the-last = дескриптор закінчується після останнього запису

engine-e-spk-writer-type-segment-carries-records-not = сегмент типу 3 містить записи, а не епохи чи стани

engine-e-spk-writer-type-21-segment-needs-at = сегмент типу 21 потребує щонайменше одного рядка різниць

engine-e-spk-writer-difference-line-size-is-not = розмір рядка різниць { $dlsize } не дорівнює 4 MAXDIM + 11 при MAXDIM у 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = рядки різниць різних розмірів

engine-e-spk-writer-difference-line-epochs-are-not = епохи рядків різниць не зростають строго

engine-e-spk-writer-the-last-difference-line-ends = останній рядок різниць закінчується раніше за дескриптор

engine-e-spk-writer-zero-step-size-in-difference = нульовий розмір кроку { $j } у рядку різниць { $i }

engine-e-spk-writer-type-21-segment-carries-difference = сегмент типу 21 містить рядки різниць, а не стани

engine-e-spk-writer-an-spk-needs-at-least = SPK потребує щонайменше одного сегмента

engine-e-spk-writer-segment = сегмент { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = рядок коментаря містить недруковані символи: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = для коментарів потрібно символів: { $nchars }; зарезервовано: { $v1 } (збільште ncomch)

engine-e-spk-writer-difference-line-orders-out-of = порядки рядка різниць { $kqmax1 } { $kq } поза діапазоном

engine-e-spk-writer-zero-step-size-at-index = нульовий розмір кроку за індексом { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } поза сегментом [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = сегмент типу 3 { $name } закороткий

engine-e-spk-writer-type-segment-words-for-rsize = сегмент типу 3 { $name }: слів { $nw } для N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = сегмент типу 21 { $name } закороткий

engine-e-spk-writer-type-21-segment-words-for = сегмент типу 21 { $name }: слів { $nw } для N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = сегмент { $name } закороткий

engine-e-spk-writer-segment-words-for = сегмент { $name }: слів { $nw } для N = { $n }

engine-e-spk-writer-segment-is-in-frame = сегмент { $name } в системі координат { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = ланцюг центрів SPK не завершується

engine-e-spk-writer-no-spk-chain-connects-and = жоден ланцюг SPK не з'єднує { $target } і { $observer } на ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = епоха { $s } не має вигляду YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = система часу { $other } не підтримується (UTC або TDB)

engine-e-spk-writer-centre-has-no-supported-naif = центр { $other } не має підтримуваного ідентифікатора NAIF

engine-e-spk-writer-oem-segment-has-no-data = сегмент OEM { $name } не має рядків даних

engine-e-spk-writer-oem-segment-no = сегмент OEM { $idx }: немає { $k }

engine-e-spk-writer-no-export-settings-for-oem = немає параметрів експорту для сегмента OEM { $idx }

engine-e-spk-writer-oem-data-line-has-fields = рядок даних OEM містить полів: { $f }: { $line }

engine-e-spk-writer-oem-value = значення OEM { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = сегментів OEM: { $out }, параметрів експорту: { $exports }

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (об'єднано) — шари: { $fired }

engine-spoof-detect-single-layer-indication-below-the = ознака з одного шару ({ $fired }) нижча за об'єднаний поріг — потрібне підтвердження

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg має бути додатною, отримано { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = панель { $i }: площа має бути >= 0

engine-e-srp-boxwing-panel-outside = панель { $i }: { $name } = { $c } поза [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = панель { $i }: поглинання + дзеркальне + дифузне = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = панель { $i }: нульова нормаль/вісь

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = нормальна матриця ECOM2 вироджена або погано зумовлена

## src/ssv/check.rs

engine-e-ssv-check-heo-preset = пресет heo

engine-e-ssv-check-lunar-preset = пресет lunar

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = формація потребує щонайменше одного депутата

engine-e-ssv-formation-duration-min-and-step-must = duration_min і step_s мають бути додатними

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = немає сигналів для вибраних орбітальних угруповань і діапазонів

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = невідома антена `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = CSV діаграми порожній

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` не є числом у CSV діаграми

engine-e-ssv-scenario-pattern-csv-row-has-columns = рядок CSV діаграми `{ $l }` містить стовпців: { $f }, очікувалося { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" потребує рівно одного з pattern_csv і pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` не є booklet, parametric чи table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: вкажіть cn0_min_dbhz або weak_signal, не обидва

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = контур несівної не може утримати задану швидкість зміни Доплера за жодного C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` не є acquisition, tracking чи both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz має бути скінченним

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: вкажіть рівно одне з preset і orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` не є leo, meo, geo, heo чи lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: вкажіть рівно одне з duration_min і duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } має бути додатним

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg потребує від 1 до 8 скінченних зсувів

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd не має бути від'ємним

engine-e-ssv-scenario-give-exactly-one-of-shell = вкажіть рівно одне з [shell], [trajectory] і [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] потребує таблиці [navigation] для головного апарата

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include і constellations.bands не мають бути порожніми

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km має бути вище за 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels вище за 5 не підтримується

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna має бути hemisphere або omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = розгортка оболонки підтримує лише діаграму передавання booklet (сформована діаграма потребує розгортки траєкторії)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] стосується [trajectory], а не [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: вкажіть рівно одне з preset і orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` не є leo, meo, geo, heo чи lunar-transfer

engine-e-ssv-scenario-unknown-preset = невідомий пресет

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv, оболонка { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv, навігація: RMS позиції загалом { $p }, усередині орбіт GNSS { $p2 }, вище { $p3 }; найдовший пропуск { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = депутат на { $offset_deg } deg ({ $baseline_km } km): відносний RMS { $rel_rms_filter_m } m із фільтром проти { $rel_rms_from_absolute_m } m з абсолютних визначень

engine-ssv-scenario-combined-max-outage-min = { $band } разом 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (макс. перерва { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv, траєкторія з висотою від { $perigee_alt_km } до { $apogee_alt_km } km: { $parts }

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min і step_min мають бути додатними

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } має бути додатним числом, отримано { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = немає пакета стандартів з назвою `{ $id }`; наявні пакети: { $ids }

engine-e-standards-pack-pack-manifest = маніфест пакета: { $e }

engine-e-standards-pack-test-duplicate-id = тест { $id }: дубльований ідентифікатор

engine-e-standards-pack-test-scenario-is-not-in = тест { $id }: сценарію `{ $s }` немає в пакеті

engine-e-standards-pack-test-scored-test-needs-bar = тест { $id }: тест з оцінкою потребує порога

engine-e-standards-pack-test-test-that-needs-input = тест { $id }: тест, що потребує вхідних даних, не має порогів

engine-e-standards-pack-test-give-either-scenario-or = тест { $id }: вкажіть або `scenario`, або `needs_input`, не обидва й не жодного

engine-e-standards-pack-test-supports-unknown-row = тест { $id }: supports вказує невідомий рядок `{ $r }`

engine-e-standards-pack-test-unknown-op = тест { $id }: невідома операція `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = тест { $id }: поріг на { $pointer } потребує рівно одного з `value` і `against`

engine-e-standards-pack-row-duplicate-id = рядок { $id }: дубльований ідентифікатор

engine-e-standards-pack-row-asks-must-be-short = рядок { $id }: `asks` має бути коротким переказом

engine-e-standards-pack-row-no-test-supports-it = рядок { $id }: жоден тест його не підтримує

engine-standards-pack-not-scored-needs-input = без оцінки: потрібні вхідні дані ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = у дослідженні немає сценаріїв для запуску

engine-e-study-cannot-read-scenario = не вдалося прочитати сценарій { $path }: { $e }

engine-e-study-scenario-failed = сценарій { $path } завершився помилкою: { $e }

engine-e-study-scenario-produced-unparseable-json = сценарій { $path } дав JSON, який неможливо розібрати: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = некоректний маніфест набору: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = невідоме джерело `{ $o }`: використайте `adsb` або `ais`

engine-e-surface-is-bytes-over-the-byte = { $what }: { $len } байт, понад ліміт у { $limit } байт

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` не є часом UTC за ISO-8601

engine-e-surface-invalid-receiver-trust-session = некоректний сеанс довіри до приймача: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` не є часом UTC за ISO-8601

engine-e-surface-dataset-custom-needs-licence-licence = набір даних `custom` потребує licence, licence_url і attribution

engine-e-surface-at-least-one-map-is = потрібна щонайменше одна мапа

engine-e-surface-epoch = епоха: { $e }

engine-e-surface-not-utf = { $suffix }: не UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = невідомий вид сценарію `{ $k }`; у списку видів наведено кожен вид

engine-surface-is-not-bundled-it = `{ $name }` не входить до постачання: він { $why }

engine-surface-no-bundled-scenario-named-the = немає вбудованого сценарію з назвою `{ $name }`; у списку прикладів названо { $v1 } наявних

engine-e-surface-invalid-toml = некоректний TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = невідомий формат експорту `{ $format }`; очікувався один із czml, kml, geojson, stk або sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps дає кадрів: { $opts }, а повертається щонайбільше { $MAX_ANIMATION_FRAMES }; зменште fps або duration_s чи запишіть довшу послідовність через командний рядок

engine-e-surface-scenario-run-failed = запуск сценарію завершився помилкою: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log називає файл `path`; передайте журнал як `text` або `base64` (цей інтерфейс не читає файлів)

engine-e-surface-max-sp-errors-must-be = max_sp_errors має бути не більше 20

engine-e-surface-frames-must-be-to = frames має бути від 1 до { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 має бути від 0 до 99

engine-e-surface-runs-given-at-most-per = передано запусків: { $runs }; щонайбільше { $MAX_COMPLIANCE_RUNS } на один звіт

engine-e-surface-the-runs-total-bytes-the = запуски разом займають байт: { $total }; ліміт для одного звіту: { $max_bytes }

engine-e-surface-result-files-given-at-most = передано файлів результатів: { $results }, щонайбільше 256

engine-e-surface-result-is-not-json = результат { $v1 } не є JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = невідомий формат `{ $o }`: використайте `prometheus`, `cef`, `leef`, `otlp` або `mqtt`

engine-e-surface-unknown-imu-format-use-csv = невідомий формат IMU `{ $o }`: використайте `csv` або `euroc`

engine-e-surface-unknown-axis-use-or = невідома вісь `{ $o }`: використайте `x`, `y` або `z`

engine-e-surface-id-must-be-to-64 = id має складатися з 1–64 друкованих символів ASCII без пробілів

engine-surface-fitted-from-stationary-imu-log = підігнано за журналом нерухомого IMU, sha256 { $sha }, вісь { $axis }, оцінювач Аллана

engine-e-surface-unknown-input-kind-use-result = невідомий input_kind `{ $o }`: використайте `result` або `jsonl`

engine-e-surface-the-input-holds-no-trust = вхідні дані не містять епохи довіри

engine-e-surface-the-reply-is-over-the = відповідь перевищує ліміт у { $max_bytes } байт; надішліть менше епох або залиште `syslog_all` вимкненим

engine-e-surface-otlp-needs-build-with-the = otlp потребує збірки з функцією `otlp`

engine-e-surface-the-pack-and-token-total = пакет і токен разом займають байт: { $total }; ліміт: { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = токен позначки часу порожній

engine-e-surface-must-be-64-lower-case = { $what } має складатися з 64 шістнадцяткових цифр у нижньому регістрі

engine-e-surface-must-be-32-bytes = { $what } має займати 32 байти

engine-surface-verified-against-the-public-key = VERIFIED за наданим вами відкритим ключем (відбиток підписувача { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: хеші та підпис узгоджені з ключем { $fp }, який пакет називає сам. Надайте відкритий ключ підписувача, отриманий від нього іншим шляхом, щоб установити, хто підписав.

engine-e-surface-files-must-be-json-object = files має бути JSON-об'єктом виду ім'я -> вміст

engine-e-surface-pack-has-at-most-64 = пакет містить щонайбільше 64 файли

engine-e-surface-file-name-must-be-plain = ім'я файла `{ $k }` має бути простим іменем

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` не є коректним стандартним base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = невідомий параметр розгортки: { $other }

engine-e-sweep-unknown-sweep-metric = невідома метрика розгортки: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep потребує щонайменше однієї осі

engine-e-sweep-sweep-key-is-malformed = ключ розгортки `{ $key }` має хибний формат

engine-e-sweep-sweep-key-follows-an-array = ключ розгортки `{ $key }`: `{ $part }` іде після масиву, тож має бути індексом

engine-e-sweep-unreachable = недосяжно

engine-e-sweep-sweep-key-parent-is-not = ключ розгортки `{ $key }`: батько `{ $part }` не є таблицею

engine-e-sweep-sweep-key-no-field = ключ розгортки `{ $key }`: немає поля `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = ключ розгортки `{ $key }`: батько `{ $last }` не є таблицею

engine-e-sweep-sweep-key-no-field-2 = ключ розгортки `{ $key }`: немає поля `{ $last }`

engine-e-sweep-metric-no-field-in-result = метрика `{ $path }`: у результаті немає поля `{ $part }`

engine-e-sweep-metric-value-is-not-number = метрика `{ $path }`: значення не є числом

engine-e-sweep-sweep-node-serialize = серіалізація вузла розгортки: { $e }

engine-e-sweep-sweep-node-result-parse = розбір результату вузла розгортки: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = вісь розгортки `{ $key }`: заявлено одиницю `{ $d }`, але досліджений пакет публікує `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = робочий потік розгортки аварійно завершився

engine-e-sweep-generic-sweep-needs-at-least = узагальнена розгортка потребує щонайменше однієї осі

engine-e-sweep-generic-sweep-needs-at-least-2 = узагальнена розгортка потребує щонайменше однієї метрики

engine-e-sweep-generic-sweep-base-must-carry = `base` узагальненої розгортки має містити власний `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = узагальнена розгортка не може розгортати іншу розгортку

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = невідомий генератор { $oscillator }; очікувався один із { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day і temperature_coeff_per_k мають бути скінченними

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s має бути скінченним і додатним

engine-e-telecom-timing-duration-must-be-finite-and = duration_s має бути скінченним і щонайменше на дванадцять відліків завдовжки

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s має лежати в [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns має бути скінченним і >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = вхідні дані температури та зсуву частоти мають бути скінченними (період > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = запис перевищив би 5 000 000 відліків; збільште sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = ряд похибки часу потребує щонайменше 13 відліків, отримано { $pairs }

engine-e-telecom-timing-every-time-and-time-error = кожне time_s і time_error_ns має бути скінченним

engine-e-telecom-timing-time-must-increase = time_s має зростати

engine-e-telecom-timing-the-series-must-be-uniformly = ряд має бути дискретизований рівномірно: крок { $v1 } дорівнює { $d } s, перший дорівнює { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = рядок CSV { $v1 } не має вигляду `time_s,time_error_ns`

## src/telecom_timing.rs

engine-telecom-timing-the-mask-is-defined-through = маску визначено через фільтр нижніх частот { $lit_0_1 } Hz, який цей рушій застосовує лише за інтервалів відліків { $MAX_FILTER_DT_S } s або менше; цей запис дискретизовано кожні { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = вкажіть або [holdover], або [series], не обидва

engine-e-telecom-timing-give-either-series-samples-or = вкажіть або series.samples, або series.csv_path, не обидва

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days має бути скінченним і >= 0

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns за { $v2 } s; { $masks } (MODELLED)

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = невідомий --format `{ $f }` (cef або leef)

engine-e-telemetry-cli-unknown-option = невідомий параметр `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input і --result взаємовиключні

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: немає адреси

engine-telemetry-cli-warning-metrics-is-served-without = попередження: /metrics віддається без автентифікації на { $addr }; прив'яжіть до localhost або захистіть власним контролем доступу

engine-e-telemetry-cli-bind = прив'язка { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = віддається http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp і --syslog-tcp взаємовиключні

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting стосується --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: частина теми не має бути порожньою, без #, + чи початкового /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp потребує збірки з `--features otlp`

engine-telemetry-cli-warning-input-line = попередження: вхідний рядок { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = не вдалося відкрити { $p }: { $e }

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint має починатися з http://

engine-e-telemetry-otlp-endpoint-has-no-host = endpoint не містить хоста

engine-e-telemetry-otlp-resolve = розв'язання { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = немає адреси для { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = попередження: експорт otlp не вдався: { $e }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = не JSON: { $e }

engine-e-telemetry-sample-not-json-object = не є JSON-об'єктом

engine-e-telemetry-sample-is-not-number = `{ $k }` не є числом

engine-e-telemetry-sample-is-not-finite = `{ $k }` не є скінченним

engine-e-telemetry-sample-missing = бракує `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } поза діапазоном 0..=100

engine-e-telemetry-sample-missing-state = бракує `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` не є масивом

engine-e-telemetry-sample-entry-has-no-name = запис `{ $key }` не має назви

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` відсутнє або не є скінченним числом

engine-e-telemetry-sample-position-is-not-an-object = `position` не є об'єктом чи null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` відсутнє або не є рядком

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` не є скінченним числом >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` не є рядком

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` не є булевим значенням

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` не є об'єктом чи null

engine-e-telemetry-sample-result-has-no-epochs = результат не містить `epochs`

engine-e-telemetry-sample-bad-epochs = хибні `epochs`: { $e }

## src/telemetry/syslog.rs

engine-e-telemetry-syslog-host-is-bytes-syslog-host = хост займає { $host } байт; ім'я хоста syslog має бути не довшим за 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = хост має складатися з друкованих символів ASCII без пробілів

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } проти { $w } (не подається як f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: присутнє, очікувалося відсутнє

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: відсутнє, очікувалося присутнє

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } має бути скінченним

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu має бути скінченним і невід'ємним

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: рядок { $v1 }: не MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: немає записів AR для { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = невідомий формат ряду { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } має бути скінченним

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s має давати від 16 до 20000 вимірювань

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } зсув { $ns } ns (Саньяк { $ns2 } ns, іоносфера { $ns3 } ns); сумарна u { $ns4 } ns (тип A { $ns5 } ns за { $averaging_s } s); { $series } реальний ряд (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = символи не ASCII в TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE обірвано під час читання { $what } (стовпці { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } закороткий для контрольної суми в стовпці 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } не має цифри контрольної суми в стовпці 69

engine-e-tle-tle-checksum-mismatch-column-69 = розбіжність контрольної суми TLE { $label }: стовпець 69 містить { $want }, обчислено { $got }

engine-e-tle-not-tle-line = не рядок 1 TLE: { $line1 }

engine-e-tle-not-tle-line-2 = не рядок 2 TLE: { $line2 }

engine-e-tle-invalid-in-tle = некоректне { $what } в TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = некоректний рік епохи в TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = некоректний каталожний номер в TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = нахил поза діапазоном [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = ексцентриситет поза діапазоном [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = недодатний середній рух: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = некоректна мантиса { $what } в TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = некоректний порядок { $what } в TLE: { $exp }

engine-tle-satellite-line-only-element-set = супутник { $satnum }: набір елементів лише з рядка 2 розібрано як аналітичні кеплерівські (двотільні) елементи — опір/B* з рядка 1 і секулярні члени SGP4 відсутні, тому ця орбіта віддаляється від істинної підгонки SGP4 в міру віддалення від епохи; для точності SGP4 надайте відповідний рядок 1

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: профіль C/N0 потребує додатних епохи та тривалості

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: профіль C/N0 потребував би понад { $MAX_DETECTOR_STEPS } кроків детектора ({ $total } s при { $epoch_s } s на епоху); скоротіть ramp_duration_s або збільште predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } має бути скінченним

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } має бути додатним (отримано { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips має бути менше за { $lit_1_9 } chips (отримано { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio має бути не менше 1 (отримано { $pullin_bandwidth_ratio }) — контур, що повторно захоплює з УЗЬКОЮ смугою, ніж та, з якою стежить, інвертував би гістерезис

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s не має бути від'ємним

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) не має перевищувати cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } не має бути порожнім

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } містить елементів: { $axis }; обмеження: { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } містить нескінченне значення

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: витримки підтвердження мають бути не менше 1 епохи

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = потрібно щонайменше вісім відліків

engine-e-twstft-budget-samples-must-increase-in-time = відліки мають зростати в часі

engine-e-twstft-budget-samples-must-be-on-regular = відліки мають лежати на регулярній сітці

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }рядків: { $total }; зовнішньо перевірено: { $validated }, змодельовано: { $modelled }, за партнером: { $partner_owned }.{ "\u000A" }

engine-verification-the-complete-machine-checked-evidence = Повний реєстр доказів із машинною перевіркою: **рядків: { $total } — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Рядок може бути VALIDATED лише за наявності незалежного зовнішнього оракула (це забезпечують інваріантні тести матриці). Ті самі дані з клікабельними посиланнями для кожного рядка на тест, модуль і закомічену фікстуру подано як *Validation ledger* на https://kshana.dev. Чому кожен рядок Modelled не є зовнішньо перевіреним, див. [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md).{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }можливостей із позначкою MODELLED: { $modelled }.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json не є JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json не є JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] потребує `label`

engine-wasm-runs-needs-result = runs[{ $i }] потребує `result`

engine-wasm-results-json-is-not-json = results_json не є JSON-масивом рядків: { $e }

engine-wasm-maps-json-must-be-json = maps_json має бути JSON-масивом рядків: { $e }

engine-wasm-plans-json-is-not-json = plans_json не є JSON-масивом рядків: { $e }

engine-wasm-options-json-is-not-json = options_json не є JSON: { $e }

engine-wasm-input-is-about-bytes-over = вхідні дані займають близько { $b64 } байт, понад ліміт у { $v2 } байт

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Послідовна навігація за рельєфом місцевості (рекурсивний SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = дрейф вільної інерціальної навігації (зростає)

engine-altpnt-sequential-terrain-matched-bounded = із зіставленням за рельєфом (обмежений)

engine-altpnt-sequential-waypoint-full-scale = шляхова точка →    повна шкала { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Звіт про запуск Kshana

engine-advanced-report-meta = Тип <code>{ $kind }</code> · рушій { $engine } · сценарій <code>{ $scenario }</code> (дайджест файлу { $digest }…)

engine-advanced-report-toc-summary = 1 Підсумок

engine-advanced-report-toc-inputs = 2 Вхідні дані

engine-advanced-report-toc-results = 3 Результати

engine-advanced-report-toc-aggregation = 3a Агрегування

engine-advanced-report-toc-companions = 3b Анімація та експорт

engine-advanced-report-toc-events = 4 Події

engine-advanced-report-toc-labels = 5 Мітки верифікації

engine-advanced-report-toc-not-modelled = 6 Не змодельовано

engine-advanced-report-toc-reproducibility = 7 Відтворюваність

engine-advanced-report-h-summary = 1. Загальний підсумок

engine-advanced-report-honesty-label = <strong>Мітка чесності</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Використані можливості:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (використовуються, але не надаються); див. розділ 5.

engine-advanced-report-member-runs = <strong>Запуски-учасники:</strong> { $n }, агреговано в розділі 3a.

engine-advanced-report-h-inputs = 2. Вхідні дані

engine-advanced-report-inputs-note = Кожне поле, яке задає файл сценарію, розгорнуте до свого шляху. Одиниці беруться з блоку <code>units</code> результату (схема одиниць полів, docs/field-units-schema.json), де він описує поле, інакше із суфікса імені поля; одиниця, яку не вказано ніде, показується як не вказана.

engine-advanced-report-th-parameter = Параметр

engine-advanced-report-th-value = Значення

engine-advanced-report-th-unit = Одиниця

engine-advanced-report-th-unit-source = Джерело одиниці

engine-advanced-report-h-results = 3. Результати

engine-advanced-report-chart-alt = Діаграма результату

engine-advanced-report-also-written-to = { " " }(також записано в { $file })

engine-advanced-report-h-scalars = Скалярні результати

engine-advanced-report-h-columns = Числові стовпці

engine-advanced-report-th-result = Результат

engine-advanced-report-th-column = Стовпець

engine-advanced-report-th-count = Кількість

engine-advanced-report-th-min = Мін.

engine-advanced-report-th-max = Макс.

engine-advanced-report-th-first = Перше

engine-advanced-report-th-last = Останнє

engine-advanced-report-omitted-inputs = <p class="note">Вхідні дані, що не помістилися на цій сторінці: { $n }; report.json містить ті самі рядки, а документ результату містить кожне значення.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">Скалярні результати, що не помістилися на цій сторінці: { $n }; report.json містить ті самі рядки, а документ результату містить кожне значення.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">Числові стовпці, що не помістилися на цій сторінці: { $n }; report.json містить ті самі рядки, а документ результату містить кожне значення.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">Події, що не помістилися на цій сторінці: { $n }; report.json містить ті самі рядки, а документ результату містить кожне значення.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Агрегування запусків-учасників

engine-advanced-report-mode = <p>Режим <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Режим <strong>{ $mode }</strong> для типу <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Режим <strong>{ $mode }</strong>, запусків-учасників: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Режим <strong>{ $mode }</strong> для типу <code>{ $kind }</code>, запусків-учасників: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-run-digest = Дайджест запуску (SHA-256 за дайджестами результатів учасників у порядку диспетчеризації): <code>{ $digest }</code>

engine-advanced-report-table-empty = Ця таблиця не має рядків: результат не містить жодного.

engine-advanced-report-distribution-caption = Розподіл Монте-Карло для { $metric } (вибірок: { $n }), 20 стовпців однакової ширини; штрихові лінії позначають 5-й, 50-й і 95-й перцентилі.

engine-advanced-report-distribution-caption-unit = Розподіл Монте-Карло для { $metric } (вибірок: { $n }, { $unit }), 20 стовпців однакової ширини; штрихові лінії позначають 5-й, 50-й і 95-й перцентилі.

engine-advanced-report-h-companions = 3b. Анімація та експорт

engine-advanced-report-animation-alt = Анімація часових рядів запуску

engine-advanced-report-animation-caption = Власні відліки запуску, що малюються за рухомим курсором часу (анімоване малювання за <code>--animate svg</code>; за зменшеного руху та під час друку показано готове зображення).

engine-advanced-report-no-animation = Без анімації: { $reason }

engine-advanced-report-no-animation-default = результат не містить часових рядів

engine-advanced-report-player-written-by = Інтерактивний програвач записує <code>{ $command }</code>.

engine-advanced-report-written-beside = Записано поруч із цим звітом: { $links }.

engine-advanced-report-th-export = Експорт

engine-advanced-report-th-applies = Застосовується

engine-advanced-report-th-files-or-reason = Файли або причина

engine-advanced-report-written-by = записує <code>{ $command }</code>

engine-advanced-report-does-not-apply = не застосовується

engine-advanced-report-yes = так

engine-advanced-report-no = ні

engine-advanced-report-h-events = 4. Часова шкала подій

engine-advanced-report-events-caption = Вікна як смуги, точкові події як крапки, на власній осі часу запуску.

engine-advanced-report-th-start = Початок (s)

engine-advanced-report-th-end = Кінець (s)

engine-advanced-report-th-event = Подія

engine-advanced-report-th-source = Джерело

engine-advanced-report-point-event = точкова подія

engine-advanced-report-events-timeline = Часова шкала подій

engine-advanced-report-point-events = точкові події ({ $n })

engine-advanced-report-distribution-of = Розподіл { $metric }

engine-advanced-report-max-bin = макс. стовпець { $n }

engine-advanced-report-h-labels = 5. Мітки верифікації

engine-advanced-report-th-capability = Можливість (вимога матриці)

engine-advanced-report-th-label = Мітка

engine-advanced-report-th-used-by = Використовується в

engine-advanced-report-th-oracle = Джерело: оракул

engine-advanced-report-th-test-evidence = Докази тестування

engine-advanced-report-h-figure-tiers = Рівні для окремих показників, указані в результаті

engine-advanced-report-th-figure = Показник

engine-advanced-report-th-tier = Рівень

engine-advanced-report-th-matrix-requirement = Вимога матриці

engine-advanced-report-th-applicable = Застосовно

engine-advanced-report-no-attack = ні (атаку не налаштовано)

engine-advanced-report-h-not-modelled = 6. Не змодельовано та припущення

engine-advanced-report-not-modelled-note = Кожен пункт процитовано з місця, де його вказано: документ результату, каталог типів, файл сценарію або причина в матриці верифікації, через яку рядок MODELLED лишається змодельованим.

engine-advanced-report-th-statement = Твердження

engine-advanced-report-h-reproducibility = 7. Запис відтворюваності

engine-advanced-report-rk-command = Команда для відтворення

engine-advanced-report-rk-working-directory = Робочий каталог

engine-advanced-report-rk-engine-version = Версія рушія

engine-advanced-report-rk-source-commit = Коміт вихідного коду

engine-advanced-report-rk-scenario-file = Файл сценарію

engine-advanced-report-rk-scenario-sha = SHA-256 файлу сценарію (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = scenario_hash результату

engine-advanced-report-rk-result-sha = SHA-256 документа результату

engine-advanced-report-rk-seed = Зерно (seed)

engine-advanced-report-rk-platform = Платформа

engine-advanced-report-rk-generated = Дослідження згенеровано (UTC)

engine-advanced-report-rk-determinism = Детермінізм

engine-advanced-report-result-hash-none = документ результату його не містить

engine-advanced-report-print-note = Щоб надрукувати цю сторінку у файл Portable Document Format (PDF), скористайтеся діалогом друку браузера й виберіть «Зберегти як PDF»; таблиця стилів друку підганяє сторінку під папір A4 і US Letter, повторює заголовки таблиць на кожній сторінці та починає розділи вхідних даних, результатів, міток і відтворюваності з нової сторінки. Сам рушій не записує жодного PDF. report.json містить той самий вміст, що й ця сторінка.

engine-advanced-report-footer = Згенеровано Kshana { $engine }.{ $stamp } Відтворюється зі сценарію, зерна (seed) та версії рушія. Вільне програмне забезпечення з відкритим кодом (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">код і документація</a>.

engine-advanced-report-empty-inputs = Сценарій не задає жодного поля, окрім `kind`: тип виконав свою еталонну конфігурацію з документованих типових значень.

engine-advanced-report-empty-scalars = Документ результату не містить скалярів поза своїми масивами; його числа підсумовано нижче за стовпцями.

engine-advanced-report-empty-series = Документ результату не містить числового масиву: кожен результат є скаляром у таблиці вище.

engine-advanced-report-empty-events = Немає подій із часом: сценарій не задає жодного вікна чи моменту початку, а результат не повідомляє про жодну подію. Тип оцінює свою конфігурацію як один випадок.

engine-advanced-report-empty-not-modelled = Ні результат, ні каталог типів, ні сценарій, ні використані рядки матриці не вказують обмеження моделювання для цього запуску.

engine-advanced-report-capabilities-statement = Кожен рядок є рядком матриці верифікації, яку задіюють типи цього запуску, з міткою та оракулом, які надає їй матриця (src/verification.rs, docs/VERIFICATION-MATRIX.md). Мітка оцінює можливість так, як її записано в матриці; вона не оцінює конфігурацію цього сценарію, а рядок VALIDATED не робить вхідні дані запуску виміряними. Рядок PARTNER — це дисципліна, на яку запуск покладається і яку Kshana не надає.

engine-advanced-report-no-run-label = Результат не містить мітки чесності на рівні запуску; мітки верифікації використаних можливостей наведено в окремому розділі, а рівні окремих показників — там, де їх указує результат.

engine-advanced-report-no-seed = Ні сценарій, ні результат не містять зерна (seed). Результат визначається лише файлом сценарію та збіркою рушія; тест детермінізму повторно виконує кожен вбудований сценарій і вимагає побайтово ідентичного виводу.

engine-advanced-report-working-directory = Запускайте команду з каталогу, у якому було розпочато початковий запуск: шлях до сценарію та будь-який відносний шлях до даних усередині сценарію визначаються відносно нього. Спершу звірте файл сценарію з scenario_sha256.

engine-advanced-report-determinism-stamped = Ті самі байти сценарію, зерно (seed) і збірка рушія дають той самий документ результату, окрім його позначки meta.generated_utc, яку --study-name записує з годинника; запустіть без --study-name, щоб отримати побайтово ідентичний вивід. Результати з рухомою комою зафіксовано для кожної платформи; інша операційна система чи архітектура може відрізнятися в останніх цифрах.

engine-advanced-report-determinism-plain = Ті самі байти сценарію, зерно (seed) і збірка рушія дають побайтово ідентичні документ результату та звіт; цей звіт не містить позначки часу. Результати з рухомою комою зафіксовано для кожної платформи; інша операційна система чи архітектура може відрізнятися в останніх цифрах.

engine-advanced-report-not-applicable-no-attack = не застосовується (атаку не налаштовано)

engine-advanced-report-what-ran-default = Сценарій `{ $kind }`.

engine-advanced-report-nothing-carried = нічого не містить

engine-advanced-report-tbl-sweep-nodes = Вузли розгортки

engine-advanced-report-tbl-mc-summary = Підсумок розподілу Монте-Карло (перцентилі визначено за найближчим рангом; 95% довірчий інтервал середнього є перцентильним бутстрепом із фіксованим зерном)

engine-advanced-report-tbl-chain-phases = Фази ланцюга

engine-advanced-report-tbl-shared = Спільні умови

engine-advanced-report-tbl-members = Учасники

engine-advanced-report-tbl-combined = Об'єднано за учасниками

engine-advanced-report-tbl-optimiser-best = Найкращий результат оптимізатора (локальний оптимум у заданих межах)

engine-advanced-report-tbl-optimiser-trace = Трасування оптимізатора

engine-advanced-report-tbl-sweep-grid = Сітка розгортки

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Навігація за рельєфом місцевості (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Навігація із зіставленням за картою гравітації

engine-altpnt-terrain-title-combined = Комбінована гравітаційна + магнітна + рельєфна alt-PNT

engine-altpnt-terrain-free-inertial-drift = дрейф вільної інерціальної навігації

engine-altpnt-terrain-terrain-matched = із зіставленням за рельєфом

engine-altpnt-terrain-gravity-matched = із зіставленням за гравітацією

engine-altpnt-terrain-gravity-only = лише гравітація

engine-altpnt-terrain-magnetic-only = лише магнітне поле

engine-altpnt-terrain-terrain-only = лише рельєф

engine-altpnt-terrain-combined-fused = комбіновано (з об'єднанням)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · сценарій { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Поверхня атаки на безпеку місячного сигналу (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = ретрансляторів у полі зору

engine-body-pnt-chart-count = кількість

engine-body-pnt-chart-formal-one-sigma-position = формальна одна сигма положення (log10 m): синє — лише орбітальне угруповання, бурштинове — із земною дальністю

engine-body-pnt-chart-time-since-epoch = час від епохи, від 0 до { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = похибка часу годинника проти запасу (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 проти порога стеження (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = рівень захисту проти порога тривоги (m)

engine-campaign-chart-position-error-vs-threshold = похибка положення проти порога (m)

engine-campaign-chart-satellites-tracking = супутників у стеженні

engine-campaign-chart-alarm-flags-and-events = прапорці тривог і події

engine-campaign-chart-mission-time = час місії: { $duration } s

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) за { $lead }

engine-campaign-chart-monte-carlo-of = Монте-Карло для `{ $scenario_kind }`: зерен (seed): { $n_runs }, починаючи з { $base_seed } (5-й, 50-й, 95-й перцентилі; смуга = бутстрепний 95% довірчий інтервал середнього)

engine-campaign-chart-composed-members = складені учасники за спільних умов: { $shared }

engine-campaign-chart-not-available = н/д

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Відновлення довжини дуги в цисмісячному просторі — оцінювач, що не використовує спільних якобіанів

engine-cislunar-arc-recovery-chart-subtitle = пакетний метод найменших квадратів зі скінченними різницями · виміряна похибка відновлення стану · без аналітичного якобіана, без варіаційної STM, без допуску рангу SVD

engine-cislunar-arc-recovery-chart-bound = межа { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = поріг рангу граміана

engine-cislunar-arc-recovery-chart-monte-carlo-rms = RMS похибка відновлення положення за Монте-Карло (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = найгірше відношення відновлення без шуму (кінцева похибка / зміщення)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Спостережуваність у цисмісячному просторі на дузі стеження (P6)

engine-cislunar-observability-chart-subtitle = ранг залежно від дуги (одна лінія зв'язку лише за дальністю) · власний спектр граміана · диференційно скоригована DRO ІУ + перехресна перевірка SRIF · проєкт: { $modelled }, ранг/STM/замикання: { $validated }

engine-cislunar-observability-chart-observable-rank = спостережуваний ранг залежно від довжини дуги

engine-cislunar-observability-chart-arc-length = довжина дуги (одиниці часу в системі, що обертається, усього { $arc_hours } h)

engine-cislunar-observability-chart-gramian-eigenvalues = власні значення граміана (log10)

engine-cislunar-observability-chart-condition = число обумовленості κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Стійкість багаторівневої PNT до конфлікту (P7)

engine-conflict-resilience-chart-subtitle = повна втрата залежно від інтенсивності загрози (MC проти замкненої форми) · коефіцієнт стійкості залежно від кореляції відмов · апріорні: { $modelled }, MC->замкнена форма / маргінали копули: { $validated }

engine-conflict-resilience-chart-total-loss-probability = імовірність повної втрати залежно від інтенсивності

engine-conflict-resilience-chart-threat-intensity = інтенсивність загрози

engine-conflict-resilience-chart-layered-mc = багаторівневий MC

engine-conflict-resilience-chart-single-layer = один рівень

engine-conflict-resilience-chart-resilience-ratio = коефіцієнт стійкості залежно від кореляції відмов

engine-conflict-resilience-chart-denial-correlation = кореляція відмов ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = доступність (%)

engine-constellation-chart-mean-pdop = середній PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = Земна GNSS на місячній відстані — C/N0 залежно від кута від осі променя

engine-earth-gnss-lunar-chart-track-threshold = стеження { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = лімб Землі { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = кут від осі променя (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = золотий = можливе стеження · червоний = занадто слабкий · сірий = закрито Землею · діаграма передавання: { $modelled }

## src/ensemble.rs

engine-ensemble-chart-title = Holdover (утримання часу) годинника: довірча смуга похибки часу (запусків: { $n_runs })

engine-ensemble-chart-timing-error-ns = похибка часу (ns)

engine-ensemble-chart-spec-threshold = специфікація { $threshold } ns

engine-ensemble-chart-time-s = час (s)

engine-ensemble-chart-classical-median-band = класичний: { $id } (медіана, смуга 5–95%)

engine-ensemble-chart-quantum-median-band = квантовий: { $id } (медіана, смуга 5–95%)

## src/frame_eop.rs

engine-frame-eop-chart-title = Бюджет прогнозу системи координат / EOP у реальному часі для місячного часу

engine-frame-eop-chart-ut1-error-ms = похибка UT1 (ms)

engine-frame-eop-chart-position-at-moon-m = положення на Місяці (m)

engine-frame-eop-chart-equiv-timing-ns = еквівалентний час (ns)

engine-frame-eop-chart-prediction-horizon-days = горизонт прогнозу (днів)

engine-frame-eop-chart-iers-final-floor = нижня межа IERS final { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m на Місяці

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = 17-станний гібридний UKF — самоузгодженість фільтра (modelled)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + білизна інновацій проти 95% смуг χ²; { $lit_1_0 } = узгоджено. Самоузгодженість, а не точність.

engine-fusion-hybrid-ukf-chart-target = ціль { $lit_1_0 }

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (білизна)

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Горизонтальна похибка слабкозв'язаної GNSS/INS

engine-fusion-pack-chart-horizontal-error-m = горизонтальна похибка (m)

engine-fusion-pack-chart-spec-threshold = специфікація { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Скайплот ({ $label })

engine-geometry-chart-north = Пн

engine-geometry-chart-east = Сх

engine-geometry-chart-south = Пд

engine-geometry-chart-west = Зх

engine-geometry-chart-satellite-tooltip = { $system } { $id } аз. { $az } кут м. { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } аз. { $az } кут м. { $el } (закрито горизонтом)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } аз. { $az } кут м. { $el } (нижче маски)

engine-geometry-chart-no-fix = немає розв'язку

engine-geometry-chart-in-view-hidden = у полі зору: { $n_visible }, закрито горизонтом: { $n_masked } · { $dop } · порожні: поза полем зору

engine-geometry-chart-satellites-as-given = супутники як задано

engine-geometry-chart-representative-sky = репрезентативне небо, а не датоване

engine-geometry-chart-footer = Kshana v{ $version } · геометрія за заданою моделлю похибок · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = Рівні захисту RAIM проти порогів тривоги

engine-gnss-sim-chart-protection-level-m = рівень захисту (m)

## src/holdover_test.rs

engine-holdover-test-chart-title = Тест holdover (утримання часу): похибка часу за кроками

engine-holdover-test-chart-y-title = |похибка часу| (ns)

engine-holdover-test-chart-panel-caption = абсолютна похибка часу; крок holdover (утримання часу) затінено; штрихові лінії — бюджети похибки часу

engine-holdover-test-chart-gnss-removed = GNSS вимкнено

engine-holdover-test-chart-gnss-restored = GNSS відновлено

engine-holdover-test-chart-time-axis = час на осі запису ({ $min } min)

## src/hybrid.rs

engine-hybrid-chart-title = Використання специфікації гібридною PNT під час відмови GNSS ({ $lit_1_0 } = специфікація)

engine-hybrid-chart-y-title = використання специфікації

engine-hybrid-chart-spec-line = специфікація ({ $lit_1_0 })

engine-hybrid-chart-classical-suite = класичний комплект

engine-hybrid-chart-quantum-suite = квантовий комплект

## src/hybrid_integrity.rs

engine-hybrid-integrity-chart-availability = доступність

engine-hybrid-integrity-chart-precision = прецизійність

engine-hybrid-integrity-chart-integrity = цілісність

engine-hybrid-integrity-chart-joint-indep = спільно (незалежно)

engine-hybrid-integrity-chart-joint-corr = спільно (корельовано)

engine-hybrid-integrity-chart-title = Спільний показник якості гібридної оптичної + RF PNT

engine-hybrid-integrity-chart-subtitle = P(доступно ТА прецизійного класу ТА з гарантованою цілісністю)

## src/inertial/mod.rs

engine-inertial-chart-title = Похибка положення при зчисленні шляху під час відмови GNSS

engine-inertial-chart-y-title = похибка положення (m)

engine-inertial-chart-spec-line = специфікація { $m } m

engine-inertial-chart-classical = класичний: { $id }

engine-inertial-chart-quantum = квантовий: { $id }

## src/iq/campaign/report.rs

engine-iq-campaign-report-roc-aria-label = ROC виявлення для кожного монітора

engine-iq-campaign-report-roc-x-title = P_fa (на негативне вікно)

engine-iq-campaign-report-curve-aria-label = Деградація C/N0 залежно від заданого J/S для { $rec } події { $ev }

engine-iq-campaign-report-curve-x-title = заданий J/S (dB)

engine-iq-campaign-report-curve-y-title = деградація C/N0 (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: еталон SSC, Q = { $q }

engine-iq-campaign-report-curve-model-legend = еталон { $label } (Q = { $q })

engine-iq-campaign-report-curve-more-series = ще рядів у таблиці показників: +{ $n }

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, виміряна деградація { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (виміряно)

## src/jamming.rs

engine-jamming-chart-title = Видимі супутники проти тих, що в стеженні, під час глушіння (jamming)

engine-jamming-chart-y-title = супутники

engine-jamming-chart-four-sv-fix = розв'язок за 4 SV

engine-jamming-chart-visible = видимі

engine-jamming-chart-tracking = у стеженні

## src/leo_fusion/ntn.rs

engine-leo-fusion-ntn-chart-title = Позиціонування 5G NTN: межа Крамера–Рао для дальності залежно від смуги пропускання

engine-leo-fusion-ntn-chart-caption = одна сигма дальності (log10 m): смуга = від маски до зеніту C/N0; крапка = RMS 3D похибки розв'язку

## src/leo_fusion/ppp.rs

engine-leo-fusion-ppp-chart-title = Збіжність PPP із доповненням LEO

engine-leo-fusion-ppp-chart-caption = медіана горизонтальної похибки (log10 m) залежно від хвилин

engine-leo-fusion-ppp-chart-n-leo = LEO: { $n }

## src/leo_fusion/pvt_kind.rs

engine-leo-fusion-pvt-kind-chart-doppler-caption = 3D похибка доплерівського розв'язку (log10 m) залежно від довжини вікна

engine-leo-fusion-pvt-kind-chart-doppler-x-label = вікно (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = медіана PDOP (синій) і VDOP (бурштиновий), log10, залежно від кількості доданих супутників LEO

engine-leo-fusion-pvt-kind-chart-joint-x-label = додано супутників LEO

engine-leo-fusion-pvt-kind-chart-polar-caption = медіана VDOP (log10): сірий — GNSS, синій — LEO, бурштиновий — об'єднаний

engine-leo-fusion-pvt-kind-chart-polar-x-label = широта (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = RMS похибка часу відносно UTC (log10 ns) залежно від зсуву C/N0, одна лінія на генератор (осцилятор)

engine-leo-fusion-pvt-kind-chart-timing-x-label = зсув C/N0 (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: від { $x0 } до { $x1 }

## src/leo_navmsg/mod.rs

engine-leo-navmsg-chart-title = Навігаційне повідомлення LEO: SISRE залежно від інтервалу апроксимації

engine-leo-navmsg-chart-no-trade-encode-decode = У цьому запуску немає компромісного аналізу; таблиці кодування/декодування та бюджету див. у result.json.

engine-leo-navmsg-chart-no-fit-interval-trade = У цьому запуску немає компромісного аналізу інтервалу апроксимації; див. result.json.

engine-leo-navmsg-chart-caption = SISRE RMS лише за орбітою (m, логарифмічна шкала) залежно від інтервалу апроксимації (s)

## src/leo_pass.rs

engine-leo-pass-chart-title = Прохід LEO: C/N0 за діапазонами та Доплер

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, від 20 до 80): діапазони LEO кольоровим, GNSS сірим

engine-leo-pass-chart-time-axis = час від епохи, від 0 до { $s } s

## src/leo_pnt_chain.rs

engine-leo-pnt-chain-chart-subtitle = проєкт сигналу -> C/N0 проходу та джитер коду -> SISRE повідомлення -> об'єднаний розв'язок · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 компонента, що відстежується, протягом проходу (dB-Hz, від 20 до 80)

engine-leo-pnt-chain-chart-not-available = н/д

## src/leo_signal.rs

engine-leo-signal-chart-title = Проєкти сигналів LEO-PNT

engine-leo-signal-chart-psd-axis = зсув у межах ±{ $lit_0_6 } × смуга передавання; від 0 до −50 dB нижче кожного піка

engine-leo-signal-chart-jitter-caption = джитер коду (m, логарифмічна шкала) залежно від сумарного C/N0 (dB-Hz)

## src/main.rs

engine-main-fail = помилка: { $e }

## plural forms

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one] журнал формату { $format } має { $n_missing } пропущену епоху в
        [few] журнал формату { $format } має { $n_missing } пропущені епохи в
        [many] журнал формату { $format } має { $n_missing } пропущених епох в
       *[other] журнал формату { $format } має { $n_missing } пропущеної епохи в
    } { $n_gaps ->
        [one] { $n_gaps } проміжку на сітці
        [few] { $n_gaps } проміжках на сітці
        [many] { $n_gaps } проміжках на сітці
       *[other] { $n_gaps } проміжку на сітці
    } { $tau0 } s; задайте gaps = "longest", щоб зберегти найдовшу ділянку без пропусків, або gaps = "linear", щоб інтерполювати

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } рядок нечислового стовпця
        [few] { $n } рядки нечислового стовпця
        [many] { $n } рядків нечислового стовпця
       *[other] { $n } рядка нечислового стовпця
    }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] тривалість x fps дає { $n } кадр; послідовність кадрів потребує від 2 до { $v1 }
        [few] тривалість x fps дає { $n } кадри; послідовність кадрів потребує від 2 до { $v1 }
        [many] тривалість x fps дає { $n } кадрів; послідовність кадрів потребує від 2 до { $v1 }
       *[other] тривалість x fps дає { $n } кадру; послідовність кадрів потребує від 2 до { $v1 }
    }

engine-aocs-kind-aocs-wheels-slew-from-deg =
    { $n_w ->
        [one] aocs: { $n_w } колесо, розворот { $duration_s } s від { $series_err } deg -> { $settle } | остаточна { $final_err } deg | пікова швидкість колеса { $peak_speed } rpm | { $v7 }
        [few] aocs: { $n_w } колеса, розворот { $duration_s } s від { $series_err } deg -> { $settle } | остаточна { $final_err } deg | пікова швидкість колеса { $peak_speed } rpm | { $v7 }
        [many] aocs: { $n_w } коліс, розворот { $duration_s } s від { $series_err } deg -> { $settle } | остаточна { $final_err } deg | пікова швидкість колеса { $peak_speed } rpm | { $v7 }
       *[other] aocs: { $n_w } колеса, розворот { $duration_s } s від { $series_err } deg -> { $settle } | остаточна { $final_err } deg | пікова швидкість колеса { $peak_speed } rpm | { $v7 }
    }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] цілісність | { $n_sats } супутник | доступних епох: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): подій цілісності — { $report2 }, HMI — { $report3 }
        [few] цілісність | { $n_sats } супутники | доступних епох: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): подій цілісності — { $report2 }, HMI — { $report3 }
        [many] цілісність | { $n_sats } супутників | доступних епох: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): подій цілісності — { $report2 }, HMI — { $report3 }
       *[other] цілісність | { $n_sats } супутника | доступних епох: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): подій цілісності — { $report2 }, HMI — { $report3 }
    }

engine-api-builtins-lunar-joint-od-clock-sats =
    lunar-joint-od-clock | { $n_sat ->
        [one] { $n_sat } супутник
        [few] { $n_sat } супутники
        [many] { $n_sat } супутників
       *[other] { $n_sat } супутника
    }, { $n_earth ->
        [one] { $n_earth } наземна станція
        [few] { $n_earth } наземні станції
        [many] { $n_earth } наземних станцій
       *[other] { $n_earth } наземної станції
    } | 3-D похибка станції з VLBI { $station_pos_err_m } m проти лише дальності { $station_pos_err_m2 } m (різкість вища у { $station_observability_improvement_factor }×) | RMS положення супутника { $sat_pos_rms_m } m | похибка годинника станції { $station_clock_err_s } s | спостережень { $n_obs }/{ $n_params } параметрів

engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } точка | похибка зсуву { $trans_err_norm_m } m, похибка повороту { $rot_err_norm_rad } rad, похибка масштабу { $scale_err_ppb } ppb | залишок rms { $rms_residual_m } m | збіжність { $converged }
        [few] lunar-frame-realisation | { $n_points } точки | похибка зсуву { $trans_err_norm_m } m, похибка повороту { $rot_err_norm_rad } rad, похибка масштабу { $scale_err_ppb } ppb | залишок rms { $rms_residual_m } m | збіжність { $converged }
        [many] lunar-frame-realisation | { $n_points } точок | похибка зсуву { $trans_err_norm_m } m, похибка повороту { $rot_err_norm_rad } rad, похибка масштабу { $scale_err_ppb } ppb | залишок rms { $rms_residual_m } m | збіжність { $converged }
       *[other] lunar-frame-realisation | { $n_points } точки | похибка зсуву { $trans_err_norm_m } m, похибка повороту { $rot_err_norm_rad } rad, похибка масштабу { $scale_err_ppb } ppb | залишок rms { $rms_residual_m } m | збіжність { $converged }
    }

engine-api-builtins-moonlight-service-volume-sats-pts =
    { $n_sats ->
        [one] moonlight-service-volume | { $n_sats } супутник ({ $geometry_label }) | точок: { $n_grid_points } × епох: { $n_epochs } | покриття { $coverage_pct }% (PDOP<{ $pdop_threshold }) | супутників { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | доступність PL { $pl_availability_pct }% | MODELLED
        [few] moonlight-service-volume | { $n_sats } супутники ({ $geometry_label }) | точок: { $n_grid_points } × епох: { $n_epochs } | покриття { $coverage_pct }% (PDOP<{ $pdop_threshold }) | супутників { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | доступність PL { $pl_availability_pct }% | MODELLED
        [many] moonlight-service-volume | { $n_sats } супутників ({ $geometry_label }) | точок: { $n_grid_points } × епох: { $n_epochs } | покриття { $coverage_pct }% (PDOP<{ $pdop_threshold }) | супутників { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | доступність PL { $pl_availability_pct }% | MODELLED
       *[other] moonlight-service-volume | { $n_sats } супутника ({ $geometry_label }) | точок: { $n_grid_points } × епох: { $n_epochs } | покриття { $coverage_pct }% (PDOP<{ $pdop_threshold }) | супутників { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | доступність PL { $pl_availability_pct }% | MODELLED
    }

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    { $n_sats ->
        [one] lunar-differential-pnt | { $n_sats } супутник (ілюстративний, класу LCNS, без афіліації) | база { $baseline_km } km | похибка користувача { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (зменшення у { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [few] lunar-differential-pnt | { $n_sats } супутники (ілюстративні, класу LCNS, без афіліації) | база { $baseline_km } km | похибка користувача { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (зменшення у { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [many] lunar-differential-pnt | { $n_sats } супутників (ілюстративні, класу LCNS, без афіліації) | база { $baseline_km } km | похибка користувача { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (зменшення у { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
       *[other] lunar-differential-pnt | { $n_sats } супутника (ілюстративні, класу LCNS, без афіліації) | база { $baseline_km } km | похибка користувача { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (зменшення у { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
    }

engine-api-builtins-lunar-interop-export-ref-frame =
    lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states ->
        [one] { $n_states } стан
        [few] { $n_states } стани
        [many] { $n_states } станів
       *[other] { $n_states } стану
    }, { $oem_line_count ->
        [one] { $oem_line_count } рядок OEM
        [few] { $oem_line_count } рядки OEM
        [many] { $oem_line_count } рядків OEM
       *[other] { $oem_line_count } рядка OEM
    } | узгодженість { $v5 } (присутні поля: { $present_fields } / відсутні: { $missing_fields }) | круговий прохід OEM { $v8 } | круговий прохід time-meta { $v9 } | KIF { $kif_bytes } bytes | MODELLED

engine-api-builtins-scenario-spoof-detect-svs-db =
    { $n_sats ->
        [one] сценарій { $r } | spoof-detect | { $n_sats } супутник, +{ $power_advantage_db } dB{ $v4 } | push { $push } | зведена оцінка { $score } (поріг { $fusion_threshold }) | { $verdict }
        [few] сценарій { $r } | spoof-detect | { $n_sats } супутники, +{ $power_advantage_db } dB{ $v4 } | push { $push } | зведена оцінка { $score } (поріг { $fusion_threshold }) | { $verdict }
        [many] сценарій { $r } | spoof-detect | { $n_sats } супутників, +{ $power_advantage_db } dB{ $v4 } | push { $push } | зведена оцінка { $score } (поріг { $fusion_threshold }) | { $verdict }
       *[other] сценарій { $r } | spoof-detect | { $n_sats } супутника, +{ $power_advantage_db } dB{ $v4 } | push { $push } | зведена оцінка { $score } (поріг { $fusion_threshold }) | { $verdict }
    }

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] сценарій { $r } | { $source } | { $n_samples } відлік | висота { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | швидкість { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [few] сценарій { $r } | { $source } | { $n_samples } відліки | висота { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | швидкість { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [many] сценарій { $r } | { $source } | { $n_samples } відліків | висота { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | швидкість { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] сценарій { $r } | { $source } | { $n_samples } відліку | висота { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | швидкість { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one] { " " }| RAIM доступний у { $n_available } з { $n_epochs } епохи (відмов: { $n_denied }, тривог: { $n_alarm }; MODELLED)
        [few] { " " }| RAIM доступний у { $n_available } з { $n_epochs } епох (відмов: { $n_denied }, тривог: { $n_alarm }; MODELLED)
        [many] { " " }| RAIM доступний у { $n_available } з { $n_epochs } епох (відмов: { $n_denied }, тривог: { $n_alarm }; MODELLED)
       *[other] { " " }| RAIM доступний у { $n_available } з { $n_epochs } епохи (відмов: { $n_denied }, тривог: { $n_alarm }; MODELLED)
    }

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] апріорні ймовірності потребують підмножин із { $n_fault_max } одночасної події; цей шлях перелічує щонайбільше { $most }
        [few] апріорні ймовірності потребують підмножин із { $n_fault_max } одночасних подій; цей шлях перелічує щонайбільше { $most }
        [many] апріорні ймовірності потребують підмножин із { $n_fault_max } одночасних подій; цей шлях перелічує щонайбільше { $most }
       *[other] апріорні ймовірності потребують підмножин із { $n_fault_max } одночасної події; цей шлях перелічує щонайбільше { $most }
    }

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] випадок `{ $id }` потребує { $n } значення, наявно: { $a }
        [few] випадок `{ $id }` потребує { $n } значення, наявно: { $a }
        [many] випадок `{ $id }` потребує { $n } значень, наявно: { $a }
       *[other] випадок `{ $id }` потребує { $n } значення, наявно: { $a }
    }

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } користувацька епоха x 3 значення URA за { $dt } s = { $v1 } ms на користувацьку епоху (розв'язуваних: { $ok })
        [few] { $n } користувацькі епохи x 3 значення URA за { $dt } s = { $v1 } ms на користувацьку епоху (розв'язуваних: { $ok })
        [many] { $n } користувацьких епох x 3 значення URA за { $dt } s = { $v1 } ms на користувацьку епоху (розв'язуваних: { $ok })
       *[other] { $n } користувацької епохи x 3 значення URA за { $dt } s = { $v1 } ms на користувацьку епоху (розв'язуваних: { $ok })
    }

engine-body-pnt-positioning-around-user-relays-at =
    Позиціонування навколо { $name } — користувач { $user_kind }, { $n_relays ->
        [one] { $n_relays } ретранслятор на
        [few] { $n_relays } ретранслятори на
        [many] { $n_relays } ретрансляторів на
       *[other] { $n_relays } ретранслятора на
    } { $r } km, { $n_epochs ->
        [one] { $n_epochs } епоха
        [few] { $n_epochs } епохи
        [many] { $n_epochs } епох
       *[other] { $n_epochs } епохи
    }
    { "  " }Світловий час до Землі { $one_way_light_time_s } s в один бік, { $two_way_light_time_s } s туди й назад; кут Сонце–Земля–тіло { $sun_separation_deg } deg
    { "  " }доступність: { $availability_relays } лише орбітальне угруповання, { $availability_with_earth } із дальністю до Землі (Земля у видимості { $earth_visibility })
    { "  " }медіанний PDOP { $opt }; похибка RMS { $opt2 } лише орбітальне угруповання, { $opt3 } із дальністю до Землі
    { "  " }медіанна формальна сигма { $opt4 } лише орбітальне угруповання, { $opt5 } із дальністю до Землі{ "\u000A" }

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] користувач { $user_kind } · { $n_relays } ретранслятор · світловий час до Землі { $one_way_light_time_s } s · MODELLED
        [few] користувач { $user_kind } · { $n_relays } ретранслятори · світловий час до Землі { $one_way_light_time_s } s · MODELLED
        [many] користувач { $user_kind } · { $n_relays } ретрансляторів · світловий час до Землі { $one_way_light_time_s } s · MODELLED
       *[other] користувач { $user_kind } · { $n_relays } ретранслятора · світловий час до Землі { $one_way_light_time_s } s · MODELLED
    }

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state =
    { $n_spacecraft ->
        [one] cislunar-arc-recovery | родина { $family }, вимірність стану { $state_dim }, { $n_spacecraft } апарат, спостережувана { $observable }, параметризація { $coordinates } | дуга { $arc_hours } h, епох: { $epochs } (сітка { $grid_hours } h), випробувань: { $trials }, зерно { $seed } | частинні похідні скінченними різницями, без аналітичного якобіана / STM / SVD / SRIF | безшумове відновлення з { $nf } (множник { $recovery_factor }) проти порога рангу грамієна { $gram } | оцінюваність за Монте-Карло з { $est } (RMS положення ≤ { $error_bound_km } km, σ { $sigma_range_m } m) проти оцінюваності за грамієном { $gram_est } | RMS положення наприкінці дуги { $last } km
        [few] cislunar-arc-recovery | родина { $family }, вимірність стану { $state_dim }, { $n_spacecraft } апарати, спостережувана { $observable }, параметризація { $coordinates } | дуга { $arc_hours } h, епох: { $epochs } (сітка { $grid_hours } h), випробувань: { $trials }, зерно { $seed } | частинні похідні скінченними різницями, без аналітичного якобіана / STM / SVD / SRIF | безшумове відновлення з { $nf } (множник { $recovery_factor }) проти порога рангу грамієна { $gram } | оцінюваність за Монте-Карло з { $est } (RMS положення ≤ { $error_bound_km } km, σ { $sigma_range_m } m) проти оцінюваності за грамієном { $gram_est } | RMS положення наприкінці дуги { $last } km
        [many] cislunar-arc-recovery | родина { $family }, вимірність стану { $state_dim }, { $n_spacecraft } апаратів, спостережувана { $observable }, параметризація { $coordinates } | дуга { $arc_hours } h, епох: { $epochs } (сітка { $grid_hours } h), випробувань: { $trials }, зерно { $seed } | частинні похідні скінченними різницями, без аналітичного якобіана / STM / SVD / SRIF | безшумове відновлення з { $nf } (множник { $recovery_factor }) проти порога рангу грамієна { $gram } | оцінюваність за Монте-Карло з { $est } (RMS положення ≤ { $error_bound_km } km, σ { $sigma_range_m } m) проти оцінюваності за грамієном { $gram_est } | RMS положення наприкінці дуги { $last } km
       *[other] cislunar-arc-recovery | родина { $family }, вимірність стану { $state_dim }, { $n_spacecraft } апарата, спостережувана { $observable }, параметризація { $coordinates } | дуга { $arc_hours } h, епох: { $epochs } (сітка { $grid_hours } h), випробувань: { $trials }, зерно { $seed } | частинні похідні скінченними різницями, без аналітичного якобіана / STM / SVD / SRIF | безшумове відновлення з { $nf } (множник { $recovery_factor }) проти порога рангу грамієна { $gram } | оцінюваність за Монте-Карло з { $est } (RMS положення ≤ { $error_bound_km } km, σ { $sigma_range_m } m) проти оцінюваності за грамієном { $gram_est } | RMS положення наприкінці дуги { $last } km
    }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    { $n_links ->
        [one] cislunar-observability | апаратів: { $c } (опорних: { $refs }) | дуга { $arc_hours } h, епох: { $rank_arc } | ранг { $first } → { $last } з { $state_dim } на дузі | λ грамієна [{ $min_eigenvalue }…{ $max_eigenvalue }] обумовленість { $condition_str } | миттєвий ранг лише за дальністю { $rank_range_only } → дальність+швидкість { $rank_range_rate } ({ $n_links } лінія зв'язку) | GDOP лише за дальністю { $ro } дальність+швидкість { $rr } | початкові умови DRO (макс. нев'язка періодичності { $max_resid }) | апостеріорна SRIF скінченна в епоху рангу 4 { $srif_epoch } (перевірено: ранг/STM/замкнення DRO/SRIF; змодельовано: проєкт)
        [few] cislunar-observability | апаратів: { $c } (опорних: { $refs }) | дуга { $arc_hours } h, епох: { $rank_arc } | ранг { $first } → { $last } з { $state_dim } на дузі | λ грамієна [{ $min_eigenvalue }…{ $max_eigenvalue }] обумовленість { $condition_str } | миттєвий ранг лише за дальністю { $rank_range_only } → дальність+швидкість { $rank_range_rate } ({ $n_links } лінії зв'язку) | GDOP лише за дальністю { $ro } дальність+швидкість { $rr } | початкові умови DRO (макс. нев'язка періодичності { $max_resid }) | апостеріорна SRIF скінченна в епоху рангу 4 { $srif_epoch } (перевірено: ранг/STM/замкнення DRO/SRIF; змодельовано: проєкт)
        [many] cislunar-observability | апаратів: { $c } (опорних: { $refs }) | дуга { $arc_hours } h, епох: { $rank_arc } | ранг { $first } → { $last } з { $state_dim } на дузі | λ грамієна [{ $min_eigenvalue }…{ $max_eigenvalue }] обумовленість { $condition_str } | миттєвий ранг лише за дальністю { $rank_range_only } → дальність+швидкість { $rank_range_rate } ({ $n_links } ліній зв'язку) | GDOP лише за дальністю { $ro } дальність+швидкість { $rr } | початкові умови DRO (макс. нев'язка періодичності { $max_resid }) | апостеріорна SRIF скінченна в епоху рангу 4 { $srif_epoch } (перевірено: ранг/STM/замкнення DRO/SRIF; змодельовано: проєкт)
       *[other] cislunar-observability | апаратів: { $c } (опорних: { $refs }) | дуга { $arc_hours } h, епох: { $rank_arc } | ранг { $first } → { $last } з { $state_dim } на дузі | λ грамієна [{ $min_eigenvalue }…{ $max_eigenvalue }] обумовленість { $condition_str } | миттєвий ранг лише за дальністю { $rank_range_only } → дальність+швидкість { $rank_range_rate } ({ $n_links } лінії зв'язку) | GDOP лише за дальністю { $ro } дальність+швидкість { $rr } | початкові умови DRO (макс. нев'язка періодичності { $max_resid }) | апостеріорна SRIF скінченна в епоху рангу 4 { $srif_epoch } (перевірено: ранг/STM/замкнення DRO/SRIF; змодельовано: проєкт)
    }

engine-cislunar-observability-family-state-range-rank-threshold =
    { $n_spacecraft ->
        [one] { $base } | родина { $family }, вимірність стану { $state_dim }, { $n_spacecraft } апарат, σ_range { $sigma_range_m } m | поріг рангу { $rank_thr } (сітка { $c } h) | поріг оцінюваності (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }
        [few] { $base } | родина { $family }, вимірність стану { $state_dim }, { $n_spacecraft } апарати, σ_range { $sigma_range_m } m | поріг рангу { $rank_thr } (сітка { $c } h) | поріг оцінюваності (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }
        [many] { $base } | родина { $family }, вимірність стану { $state_dim }, { $n_spacecraft } апаратів, σ_range { $sigma_range_m } m | поріг рангу { $rank_thr } (сітка { $c } h) | поріг оцінюваності (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }
       *[other] { $base } | родина { $family }, вимірність стану { $state_dim }, { $n_spacecraft } апарата, σ_range { $sigma_range_m } m | поріг рангу { $rank_thr } (сітка { $c } h) | поріг оцінюваності (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }
    }

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] РОЗШИРЕННЯ (R3) — цей прогін НЕ є планарною конфігурацією DRO, яку описує `label` вище. Вимірність стану { $state_dim }; родина орбіт { $family }; { $n_spacecraft } апарат; сигма вимірювання дальності { $sigma_range_m } m. Де `label` каже «планарні» та «планарні DRO», читайте названу тут родину. VALIDATED доповнення: варіаційна STM 6x6 є тією самою перевіреною скінченними різницями STM CR3BP (crate::cr3bp), що застосовується в повній ширині; рядки якобіана просторових дальності / швидкості дальності є аналітичними частинними похідними, перевіреними скінченними різницями, а рядок швидкості дальності перехресно перевірено покомпонентно за незалежною 3-D deepspace_od::range_rate_observable цього крейта; початкові умови halo / NRHO є диференційно скоригованими періодичними орбітами від того самого коректора, що відтворює опубліковану південну NRHO L2 9:2, продовженими від цього опублікованого зерна, і нев'язку замкнення кожного члена наведено; вердикти РАНГУ для шести станів підтверджено НЕЗАЛЕЖНИМ рядково-східчастим рангом (метод Гаусса з частковим вибором головного елемента), що не має спільного коду зі шляхом власних значень/SVD. ЧЕСНА МЕЖА ГІЛКИ SRIF: наведена вище перехресна перевірка SRIF використовує ТІ САМІ якобіани вимірювань і зводиться до того самого O^T O, тож її збіг є перевіркою узгодженості двох числових механізмів, а НЕ незалежним підтвердженням порога — вона не зараховується як перевірка жодної величини тут. MODELLED: проєкт родини (які абсциси, амплітуди й фази), сітка епох, одноканальна дуга та заявлена межа положення критерію оцінюваності.
        [few] РОЗШИРЕННЯ (R3) — цей прогін НЕ є планарною конфігурацією DRO, яку описує `label` вище. Вимірність стану { $state_dim }; родина орбіт { $family }; { $n_spacecraft } апарати; сигма вимірювання дальності { $sigma_range_m } m. Де `label` каже «планарні» та «планарні DRO», читайте названу тут родину. VALIDATED доповнення: варіаційна STM 6x6 є тією самою перевіреною скінченними різницями STM CR3BP (crate::cr3bp), що застосовується в повній ширині; рядки якобіана просторових дальності / швидкості дальності є аналітичними частинними похідними, перевіреними скінченними різницями, а рядок швидкості дальності перехресно перевірено покомпонентно за незалежною 3-D deepspace_od::range_rate_observable цього крейта; початкові умови halo / NRHO є диференційно скоригованими періодичними орбітами від того самого коректора, що відтворює опубліковану південну NRHO L2 9:2, продовженими від цього опублікованого зерна, і нев'язку замкнення кожного члена наведено; вердикти РАНГУ для шести станів підтверджено НЕЗАЛЕЖНИМ рядково-східчастим рангом (метод Гаусса з частковим вибором головного елемента), що не має спільного коду зі шляхом власних значень/SVD. ЧЕСНА МЕЖА ГІЛКИ SRIF: наведена вище перехресна перевірка SRIF використовує ТІ САМІ якобіани вимірювань і зводиться до того самого O^T O, тож її збіг є перевіркою узгодженості двох числових механізмів, а НЕ незалежним підтвердженням порога — вона не зараховується як перевірка жодної величини тут. MODELLED: проєкт родини (які абсциси, амплітуди й фази), сітка епох, одноканальна дуга та заявлена межа положення критерію оцінюваності.
        [many] РОЗШИРЕННЯ (R3) — цей прогін НЕ є планарною конфігурацією DRO, яку описує `label` вище. Вимірність стану { $state_dim }; родина орбіт { $family }; { $n_spacecraft } апаратів; сигма вимірювання дальності { $sigma_range_m } m. Де `label` каже «планарні» та «планарні DRO», читайте названу тут родину. VALIDATED доповнення: варіаційна STM 6x6 є тією самою перевіреною скінченними різницями STM CR3BP (crate::cr3bp), що застосовується в повній ширині; рядки якобіана просторових дальності / швидкості дальності є аналітичними частинними похідними, перевіреними скінченними різницями, а рядок швидкості дальності перехресно перевірено покомпонентно за незалежною 3-D deepspace_od::range_rate_observable цього крейта; початкові умови halo / NRHO є диференційно скоригованими періодичними орбітами від того самого коректора, що відтворює опубліковану південну NRHO L2 9:2, продовженими від цього опублікованого зерна, і нев'язку замкнення кожного члена наведено; вердикти РАНГУ для шести станів підтверджено НЕЗАЛЕЖНИМ рядково-східчастим рангом (метод Гаусса з частковим вибором головного елемента), що не має спільного коду зі шляхом власних значень/SVD. ЧЕСНА МЕЖА ГІЛКИ SRIF: наведена вище перехресна перевірка SRIF використовує ТІ САМІ якобіани вимірювань і зводиться до того самого O^T O, тож її збіг є перевіркою узгодженості двох числових механізмів, а НЕ незалежним підтвердженням порога — вона не зараховується як перевірка жодної величини тут. MODELLED: проєкт родини (які абсциси, амплітуди й фази), сітка епох, одноканальна дуга та заявлена межа положення критерію оцінюваності.
       *[other] РОЗШИРЕННЯ (R3) — цей прогін НЕ є планарною конфігурацією DRO, яку описує `label` вище. Вимірність стану { $state_dim }; родина орбіт { $family }; { $n_spacecraft } апарата; сигма вимірювання дальності { $sigma_range_m } m. Де `label` каже «планарні» та «планарні DRO», читайте названу тут родину. VALIDATED доповнення: варіаційна STM 6x6 є тією самою перевіреною скінченними різницями STM CR3BP (crate::cr3bp), що застосовується в повній ширині; рядки якобіана просторових дальності / швидкості дальності є аналітичними частинними похідними, перевіреними скінченними різницями, а рядок швидкості дальності перехресно перевірено покомпонентно за незалежною 3-D deepspace_od::range_rate_observable цього крейта; початкові умови halo / NRHO є диференційно скоригованими періодичними орбітами від того самого коректора, що відтворює опубліковану південну NRHO L2 9:2, продовженими від цього опублікованого зерна, і нев'язку замкнення кожного члена наведено; вердикти РАНГУ для шести станів підтверджено НЕЗАЛЕЖНИМ рядково-східчастим рангом (метод Гаусса з частковим вибором головного елемента), що не має спільного коду зі шляхом власних значень/SVD. ЧЕСНА МЕЖА ГІЛКИ SRIF: наведена вище перехресна перевірка SRIF використовує ТІ САМІ якобіани вимірювань і зводиться до того самого O^T O, тож її збіг є перевіркою узгодженості двох числових механізмів, а НЕ незалежним підтвердженням порога — вона не зараховується як перевірка жодної величини тут. MODELLED: проєкт родини (які абсциси, амплітуди й фази), сітка епох, одноканальна дуга та заявлена межа положення критерію оцінюваності.
    }

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] цілісність: { $n } епоха перевищує ліміт у { $MAX_EPOCHS } епох; збільште step_s
        [few] цілісність: { $n } епохи перевищують ліміт у { $MAX_EPOCHS } епох; збільште step_s
        [many] цілісність: { $n } епох перевищують ліміт у { $MAX_EPOCHS } епох; збільште step_s
       *[other] цілісність: { $n } епохи перевищують ліміт у { $MAX_EPOCHS } епох; збільште step_s
    }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] GNSS Землі на місячній відстані — { $n_satellites } супутник, приймач на { $r } km{ "\u000A" }
        [few] GNSS Землі на місячній відстані — { $n_satellites } супутники, приймач на { $r } km{ "\u000A" }
        [many] GNSS Землі на місячній відстані — { $n_satellites } супутників, приймач на { $r } km{ "\u000A" }
       *[other] GNSS Землі на місячній відстані — { $n_satellites } супутника, приймач на { $r } km{ "\u000A" }
    }

engine-earth-gnss-lunar-of-not-occulted-clear-the =
    { $n_satellites ->
        [one] { "  " }не затулено: { $n_geometrically_visible } з { $n_satellites } супутника; поріг супроводження { $tracking_threshold_dbhz } dB-Hz перевищують: { $n_trackable }{ "\u000A" }
        [few] { "  " }не затулено: { $n_geometrically_visible } з { $n_satellites } супутників; поріг супроводження { $tracking_threshold_dbhz } dB-Hz перевищують: { $n_trackable }{ "\u000A" }
        [many] { "  " }не затулено: { $n_geometrically_visible } з { $n_satellites } супутників; поріг супроводження { $tracking_threshold_dbhz } dB-Hz перевищують: { $n_trackable }{ "\u000A" }
       *[other] { "  " }не затулено: { $n_geometrically_visible } з { $n_satellites } супутника; поріг супроводження { $tracking_threshold_dbhz } dB-Hz перевищують: { $n_trackable }{ "\u000A" }
    }

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] наземна траса { $source } · { $n_samples } відлік · висота { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
        [few] наземна траса { $source } · { $n_samples } відліки · висота { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
        [many] наземна траса { $source } · { $n_samples } відліків · висота { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
       *[other] наземна траса { $source } · { $n_samples } відліку · висота { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
    }

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] sky: tle не містить повного двохрядкового набору елементів; проігноровано { $n_ignored } рядок, перший: { $first }
        [few] sky: tle не містить повного двохрядкового набору елементів; проігноровано { $n_ignored } рядки, перший: { $first }
        [many] sky: tle не містить повного двохрядкового набору елементів; проігноровано { $n_ignored } рядків, перший: { $first }
       *[other] sky: tle не містить повного двохрядкового набору елементів; проігноровано { $n_ignored } рядка, перший: { $first }
    }

engine-geometry-element-sets-propagated-by-the =
    { $n ->
        [one] { $n } набір елементів пропаговано SGP4 рушія (WGS-72) на { $iso } і повернуто до земної системи координат з UT1, прийнятим за UTC, і без полярного руху: це небо, яке цей набір елементів дає на ту епоху, а не його вимірювання.
        [few] { $n } набори елементів пропаговано SGP4 рушія (WGS-72) на { $iso } і повернуто до земної системи координат з UT1, прийнятим за UTC, і без полярного руху: це небо, яке ці набори елементів дають на ту епоху, а не його вимірювання.
        [many] { $n } наборів елементів пропаговано SGP4 рушія (WGS-72) на { $iso } і повернуто до земної системи координат з UT1, прийнятим за UTC, і без полярного руху: це небо, яке ці набори елементів дають на ту епоху, а не його вимірювання.
       *[other] { $n } набору елементів пропаговано SGP4 рушія (WGS-72) на { $iso } і повернуто до земної системи координат з UT1, прийнятим за UTC, і без полярного руху: це небо, яке ці набори елементів дають на ту епоху, а не його вимірювання.
    }

engine-geometry-element-sets-propagated-by-the-2 =
    { $n ->
        [one] { $n } набір елементів пропаговано SGP4 рушія (WGS-72) на епоху найновішого набору елементів плюс time_s ({ $iso }). Епоху не задано, тож це репрезентативне небо, а не небо заявленої дати.
        [few] { $n } набори елементів пропаговано SGP4 рушія (WGS-72) на епоху найновішого набору елементів плюс time_s ({ $iso }). Епоху не задано, тож це репрезентативне небо, а не небо заявленої дати.
        [many] { $n } наборів елементів пропаговано SGP4 рушія (WGS-72) на епоху найновішого набору елементів плюс time_s ({ $iso }). Епоху не задано, тож це репрезентативне небо, а не небо заявленої дати.
       *[other] { $n } набору елементів пропаговано SGP4 рушія (WGS-72) на епоху найновішого набору елементів плюс time_s ({ $iso }). Епоху не задано, тож це репрезентативне небо, а не небо заявленої дати.
    }

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] сценарій дає { $n } епоху (потрібно ≥ 2); збільште duration_s або зменште step_s
        [few] сценарій дає { $n } епохи (потрібно ≥ 2); збільште duration_s або зменште step_s
        [many] сценарій дає { $n } епох (потрібно ≥ 2); збільште duration_s або зменште step_s
       *[other] сценарій дає { $n } епохи (потрібно ≥ 2); збільште duration_s або зменште step_s
    }

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | оптична пляма { $footprint_m } m, фотонів: { $detected_photons } -> σ далекометрії { $c } mm, σ часу { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | доступність { $c4 }% ({ $n_sites } пункт) | передавання без стрибка { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | спільний FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | перевірено CRLB/χ²-PL/union/handoff, змодельовано σ/кліматологія
        [few] hybrid-optical-rf | оптична пляма { $footprint_m } m, фотонів: { $detected_photons } -> σ далекометрії { $c } mm, σ часу { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | доступність { $c4 }% ({ $n_sites } пункти) | передавання без стрибка { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | спільний FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | перевірено CRLB/χ²-PL/union/handoff, змодельовано σ/кліматологія
        [many] hybrid-optical-rf | оптична пляма { $footprint_m } m, фотонів: { $detected_photons } -> σ далекометрії { $c } mm, σ часу { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | доступність { $c4 }% ({ $n_sites } пунктів) | передавання без стрибка { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | спільний FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | перевірено CRLB/χ²-PL/union/handoff, змодельовано σ/кліматологія
       *[other] hybrid-optical-rf | оптична пляма { $footprint_m } m, фотонів: { $detected_photons } -> σ далекометрії { $c } mm, σ часу { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | доступність { $c4 }% ({ $n_sites } пункту) | передавання без стрибка { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | спільний FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | перевірено CRLB/χ²-PL/union/handoff, змодельовано σ/кліматологія
    }

engine-impairment-eval-impairment-eval-detector-auc-in =
    { $n_cases ->
        [one] impairment-eval | детектор { $detector } | AUC { $auc_in } на вході / { $auc_out } на виході (розрив { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ ціль { $target_pfa } | { $n_cases } випадок | MODELLED синтетичні дані
        [few] impairment-eval | детектор { $detector } | AUC { $auc_in } на вході / { $auc_out } на виході (розрив { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ ціль { $target_pfa } | { $n_cases } випадки | MODELLED синтетичні дані
        [many] impairment-eval | детектор { $detector } | AUC { $auc_in } на вході / { $auc_out } на виході (розрив { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ ціль { $target_pfa } | { $n_cases } випадків | MODELLED синтетичні дані
       *[other] impairment-eval | детектор { $detector } | AUC { $auc_in } на вході / { $auc_out } на виході (розрив { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ ціль { $target_pfa } | { $n_cases } випадку | MODELLED синтетичні дані
    }

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } часовий відлік — це більше, ніж записує експорт ({ $MAX_SAMPLES })
        [few] { $n } часові відліки — це більше, ніж записує експорт ({ $MAX_SAMPLES })
        [many] { $n } часових відліків — це більше, ніж записує експорт ({ $MAX_SAMPLES })
       *[other] { $n } часового відліку — це більше, ніж записує експорт ({ $MAX_SAMPLES })
    }

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } містить { $n } значення; задайте по одному на кожен id ({ $ids })
        [few] { $at }: { $key } містить { $n } значення; задайте по одному на кожен id ({ $ids })
        [many] { $at }: { $key } містить { $n } значень; задайте по одному на кожен id ({ $ids })
       *[other] { $at }: { $key } містить { $n } значення; задайте по одному на кожен id ({ $ids })
    }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to =
    { $n ->
        [one] { $code }: запис містить відліків: { $buf }, для захоплення потрібно { $n } відлік
        [few] { $code }: запис містить відліків: { $buf }, для захоплення потрібно { $n } відліки
        [many] { $code }: запис містить відліків: { $buf }, для захоплення потрібно { $n } відліків
       *[other] { $code }: запис містить відліків: { $buf }, для захоплення потрібно { $n } відліку
    }

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } приймає { $n } позиційний аргумент, отримано: { $pos }
        [few] iq { $cmd } приймає { $n } позиційні аргументи, отримано: { $pos }
        [many] iq { $cmd } приймає { $n } позиційних аргументів, отримано: { $pos }
       *[other] iq { $cmd } приймає { $n } позиційного аргументу, отримано: { $pos }
    }

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } приймає { $n } аргумент-шлях, отримано: { $pos }
        [few] iq { $cmd } приймає { $n } аргументи-шляхи, отримано: { $pos }
        [many] iq { $cmd } приймає { $n } аргументів-шляхів, отримано: { $pos }
       *[other] iq { $cmd } приймає { $n } аргументу-шляху, отримано: { $pos }
    }

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] записано { $n } відлік ({ $to }, { $fs_hz } Hz) у { $files }; насичених елементів: { $w }{ $v4 }
        [few] записано { $n } відліки ({ $to }, { $fs_hz } Hz) у { $files }; насичених елементів: { $w }{ $v4 }
        [many] записано { $n } відліків ({ $to }, { $fs_hz } Hz) у { $files }; насичених елементів: { $w }{ $v4 }
       *[other] записано { $n } відліку ({ $to }, { $fs_hz } Hz) у { $files }; насичених елементів: { $w }{ $v4 }
    }

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name }: захоплення з відліку { $sample_start } порушує порядок або виходить за межі { $n_file } відліку у даних
        [few] { $name }: захоплення з відліку { $sample_start } порушує порядок або виходить за межі { $n_file } відліків у даних
        [many] { $name }: захоплення з відліку { $sample_start } порушує порядок або виходить за межі { $n_file } відліків у даних
       *[other] { $name }: захоплення з відліку { $sample_start } порушує порядок або виходить за межі { $n_file } відліку у даних
    }

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] не підігнано: спостережено { $n_reacq } повторне захоплення (потрібно щонайменше 3)
        [few] не підігнано: спостережено { $n_reacq } повторні захоплення (потрібно щонайменше 3)
        [many] не підігнано: спостережено { $n_reacq } повторних захоплень (потрібно щонайменше 3)
       *[other] не підігнано: спостережено { $n_reacq } повторного захоплення (потрібно щонайменше 3)
    }

engine-iq-labfit-iqreport-threshold-direct-median-db-over =
    { $n ->
        [one] Порогове J/S, пряме: медіана { $om } dB за { $n } втрату (IQR { $t }).{ "\u000A\u000A" }
        [few] Порогове J/S, пряме: медіана { $om } dB за { $n } втрати (IQR { $t }).{ "\u000A\u000A" }
        [many] Порогове J/S, пряме: медіана { $om } dB за { $n } втрат (IQR { $t }).{ "\u000A\u000A" }
       *[other] Порогове J/S, пряме: медіана { $om } dB за { $n } втрати (IQR { $t }).{ "\u000A\u000A" }
    }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    { $n ->
        [one] { $model }: { $n } подія, RMS часу втрати { $om } s, покриття PI90 { $om2 }
        [few] { $model }: { $n } події, RMS часу втрати { $om } s, покриття PI90 { $om2 }
        [many] { $model }: { $n } подій, RMS часу втрати { $om } s, покриття PI90 { $om2 }
       *[other] { $model }: { $n } події, RMS часу втрати { $om } s, покриття PI90 { $om2 }
    }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } відлік C/N0, залишковий RMS { $om } dB.{ $r }{ "\u000A" }
        [few] { "\u000A" }{ $n_samples } відліки C/N0, залишковий RMS { $om } dB.{ $r }{ "\u000A" }
        [many] { "\u000A" }{ $n_samples } відліків C/N0, залишковий RMS { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } відліку C/N0, залишковий RMS { $om } dB.{ $r }{ "\u000A" }
    }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one] { "\u000A" }RMS часу події { $om } s за { $n_events } подію; втрат пропущено { $loss_missed } / зайвих { $loss_extra }, повторних захоплень пропущено { $reacq_missed } / зайвих { $reacq_extra }.

        | прогін | спад dB-Hz | повторне захоплення dB-Hz | події | RMS s |
        |---|---|---|---|---|{ "\u000A" }
        [few] { "\u000A" }RMS часу події { $om } s за { $n_events } події; втрат пропущено { $loss_missed } / зайвих { $loss_extra }, повторних захоплень пропущено { $reacq_missed } / зайвих { $reacq_extra }.

        | прогін | спад dB-Hz | повторне захоплення dB-Hz | події | RMS s |
        |---|---|---|---|---|{ "\u000A" }
        [many] { "\u000A" }RMS часу події { $om } s за { $n_events } подій; втрат пропущено { $loss_missed } / зайвих { $loss_extra }, повторних захоплень пропущено { $reacq_missed } / зайвих { $reacq_extra }.

        | прогін | спад dB-Hz | повторне захоплення dB-Hz | події | RMS s |
        |---|---|---|---|---|{ "\u000A" }
       *[other] { "\u000A" }RMS часу події { $om } s за { $n_events } події; втрат пропущено { $loss_missed } / зайвих { $loss_extra }, повторних захоплень пропущено { $reacq_missed } / зайвих { $reacq_extra }.

        | прогін | спад dB-Hz | повторне захоплення dB-Hz | події | RMS s |
        |---|---|---|---|---|{ "\u000A" }
    }

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] запитано { $n } відлік; короткий прогін вміщує щонайбільше { $MAX_SAMPLES }
        [few] запитано { $n } відліки; короткий прогін вміщує щонайбільше { $MAX_SAMPLES }
        [many] запитано { $n } відліків; короткий прогін вміщує щонайбільше { $MAX_SAMPLES }
       *[other] запитано { $n } відліку; короткий прогін вміщує щонайбільше { $MAX_SAMPLES }
    }

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path }: { $n } код, ICD визначає { $CODES_PER_COMPONENT }
        [few] { $path }: { $n } коди, ICD визначає { $CODES_PER_COMPONENT }
        [many] { $path }: { $n } кодів, ICD визначає { $CODES_PER_COMPONENT }
       *[other] { $path }: { $n } коду, ICD визначає { $CODES_PER_COMPONENT }
    }

engine-e-iq-track-sink-an-epoch-carries-extra-taps =
    { $n ->
        [one] епоха несе додаткових відводів: { $extra }, але вивід налаштовано на { $n } відвід: кожен канал прогону має використовувати однакові extra_taps_chips
        [few] епоха несе додаткових відводів: { $extra }, але вивід налаштовано на { $n } відводи: кожен канал прогону має використовувати однакові extra_taps_chips
        [many] епоха несе додаткових відводів: { $extra }, але вивід налаштовано на { $n } відводів: кожен канал прогону має використовувати однакові extra_taps_chips
       *[other] епоха несе додаткових відводів: { $extra }, але вивід налаштовано на { $n } відводу: кожен канал прогону має використовувати однакові extra_taps_chips
    }

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one] { $n_meas } вимірювання не може розв'язати { $n } доплерівську невідому
        [few] { $n_meas } вимірювання не можуть розв'язати { $n } доплерівські невідомі
        [many] { $n_meas } вимірювань не можуть розв'язати { $n } доплерівських невідомих
       *[other] { $n_meas } вимірювання не можуть розв'язати { $n } доплерівської невідомої
    }

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    псевдодальностей: { $obs }, цього замало, щоб розв'язати { $n ->
        [one] { $n } невідому
        [few] { $n } невідомі
        [many] { $n } невідомих
       *[other] { $n } невідомої
    } (3 положення + { $n_clock ->
        [one] { $n_clock } годинник
        [few] { $n_clock } годинники
        [many] { $n_clock } годинників
       *[other] { $n_clock } годинника
    })

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] позиціонування 5G NTN на { $r } MHz, C/N0 від { $r2 } до { $r3 } dB-Hz, { $n_satellites } супутник (у зоні видимості: { $mean_in_view }){ "\u000A" }
        [few] позиціонування 5G NTN на { $r } MHz, C/N0 від { $r2 } до { $r3 } dB-Hz, { $n_satellites } супутники (у зоні видимості: { $mean_in_view }){ "\u000A" }
        [many] позиціонування 5G NTN на { $r } MHz, C/N0 від { $r2 } до { $r3 } dB-Hz, { $n_satellites } супутників (у зоні видимості: { $mean_in_view }){ "\u000A" }
       *[other] позиціонування 5G NTN на { $r } MHz, C/N0 від { $r2 } до { $r3 } dB-Hz, { $n_satellites } супутника (у зоні видимості: { $mean_in_view }){ "\u000A" }
    }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }прохід Доплера одним супутником: { $n_obs } відлік за { $duration_s } s, горизонтальна похибка { $horizontal_error_m } m{ "\u000A" }
        [few] { "  " }прохід Доплера одним супутником: { $n_obs } відліки за { $duration_s } s, горизонтальна похибка { $horizontal_error_m } m{ "\u000A" }
        [many] { "  " }прохід Доплера одним супутником: { $n_obs } відліків за { $duration_s } s, горизонтальна похибка { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }прохід Доплера одним супутником: { $n_obs } відліку за { $duration_s } s, горизонтальна похибка { $horizontal_error_m } m{ "\u000A" }
    }

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] збіжність PPP до { $criterion_horizontal_m } m горизонтально / { $criterion_vertical_m } m вертикально, прогонів на випадок: { $runs_per_case }, { $n_gnss } супутник GNSS{ "\u000A" }
        [few] збіжність PPP до { $criterion_horizontal_m } m горизонтально / { $criterion_vertical_m } m вертикально, прогонів на випадок: { $runs_per_case }, { $n_gnss } супутники GNSS{ "\u000A" }
        [many] збіжність PPP до { $criterion_horizontal_m } m горизонтально / { $criterion_vertical_m } m вертикально, прогонів на випадок: { $runs_per_case }, { $n_gnss } супутників GNSS{ "\u000A" }
       *[other] збіжність PPP до { $criterion_horizontal_m } m горизонтально / { $criterion_vertical_m } m вертикально, прогонів на випадок: { $runs_per_case }, { $n_gnss } супутника GNSS{ "\u000A" }
    }

engine-leo-fusion-ppp-leo-median-min-converged-nees =
    { $n_leo ->
        [one] { "  " }{ $name } { $n_leo } супутник LEO  медіана { $c } хв  збіглося { $v4 }%  NEES середнє { $nees_mean }{ "\u000A" }
        [few] { "  " }{ $name } { $n_leo } супутники LEO  медіана { $c } хв  збіглося { $v4 }%  NEES середнє { $nees_mean }{ "\u000A" }
        [many] { "  " }{ $name } { $n_leo } супутників LEO  медіана { $c } хв  збіглося { $v4 }%  NEES середнє { $nees_mean }{ "\u000A" }
       *[other] { "  " }{ $name } { $n_leo } супутника LEO  медіана { $c } хв  збіглося { $v4 }%  NEES середнє { $nees_mean }{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-sats-at-km-mhz =
    { $n_satellites ->
        [one] { "  " }{ $name } { $role } { $n_satellites } супутник, висота { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
        [few] { "  " }{ $name } { $role } { $n_satellites } супутники, висота { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
        [many] { "  " }{ $name } { $role } { $n_satellites } супутників, висота { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
       *[other] { "  " }{ $name } { $role } { $n_satellites } супутника, висота { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one] { "  " }Визначення за Доплером: { $n_obs } вимірювання від { $n_sats } супутника, 3D похибка { $error_3d_m } m (горизонтальна { $horizontal_error_m } m){ "\u000A" }
        [few] { "  " }Визначення за Доплером: { $n_obs } вимірювання від { $n_sats } супутників, 3D похибка { $error_3d_m } m (горизонтальна { $horizontal_error_m } m){ "\u000A" }
        [many] { "  " }Визначення за Доплером: { $n_obs } вимірювань від { $n_sats } супутників, 3D похибка { $error_3d_m } m (горизонтальна { $horizontal_error_m } m){ "\u000A" }
       *[other] { "  " }Визначення за Доплером: { $n_obs } вимірювання від { $n_sats } супутника, 3D похибка { $error_3d_m } m (горизонтальна { $horizontal_error_m } m){ "\u000A" }
    }

engine-leo-fusion-pvt-kind-window-sats-3d-error =
    { $n_sats ->
        [one] { "    " }вікно { $window_s } s: { $n_sats } супутник, 3D похибка { $f } m{ "\u000A" }
        [few] { "    " }вікно { $window_s } s: { $n_sats } супутники, 3D похибка { $f } m{ "\u000A" }
        [many] { "    " }вікно { $window_s } s: { $n_sats } супутників, 3D похибка { $f } m{ "\u000A" }
       *[other] { "    " }вікно { $window_s } s: { $n_sats } супутника, 3D похибка { $f } m{ "\u000A" }
    }

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live: відкинуто { $n } датаграму udp, яку рушій не зміг прийняти (усього { $udp_dropped })
        [few] kshana live: відкинуто { $n } датаграми udp, які рушій не зміг прийняти (усього { $udp_dropped })
        [many] kshana live: відкинуто { $n } датаграм udp, які рушій не зміг прийняти (усього { $udp_dropped })
       *[other] kshana live: відкинуто { $n } датаграми udp, які рушій не зміг прийняти (усього { $udp_dropped })
    }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } супутник, без маяків
        [few] { $n_sats } супутники, без маяків
        [many] { $n_sats } супутників, без маяків
       *[other] { $n_sats } супутника, без маяків
    }

engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one] { $n_sats } супутник + { $n_vis_beacons } видимий маяк
        [few] { $n_sats } супутники + { $n_vis_beacons } видимих маяків
        [many] { $n_sats } супутників + { $n_vis_beacons } видимих маяків
       *[other] { $n_sats } супутника + { $n_vis_beacons } видимого маяка
    }

engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } супутник, без маяків
        [few] { $n_cmp } супутники, без маяків
        [many] { $n_cmp } супутників, без маяків
       *[other] { $n_cmp } супутника, без маяків
    }

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines =
    { $n_obs ->
        [one] lunar-frame-campaign | маяків: { $n_beacons } x баз: { $v1 } x епох: { $n_epochs } = { $n_obs } спостереження (сигма затримки { $sigma_tau } s) | датум станцій { $station_datum } | ранг Гельмерта { $rank }/7 обумовленість { $condition } | сигма зсуву датуму { $v5 } проти похибки відновлення введеного перетворення { $trans_err_norm_m } m (відношення { $v7 })
        [few] lunar-frame-campaign | маяків: { $n_beacons } x баз: { $v1 } x епох: { $n_epochs } = { $n_obs } спостереження (сигма затримки { $sigma_tau } s) | датум станцій { $station_datum } | ранг Гельмерта { $rank }/7 обумовленість { $condition } | сигма зсуву датуму { $v5 } проти похибки відновлення введеного перетворення { $trans_err_norm_m } m (відношення { $v7 })
        [many] lunar-frame-campaign | маяків: { $n_beacons } x баз: { $v1 } x епох: { $n_epochs } = { $n_obs } спостережень (сигма затримки { $sigma_tau } s) | датум станцій { $station_datum } | ранг Гельмерта { $rank }/7 обумовленість { $condition } | сигма зсуву датуму { $v5 } проти похибки відновлення введеного перетворення { $trans_err_norm_m } m (відношення { $v7 })
       *[other] lunar-frame-campaign | маяків: { $n_beacons } x баз: { $v1 } x епох: { $n_epochs } = { $n_obs } спостереження (сигма затримки { $sigma_tau } s) | датум станцій { $station_datum } | ранг Гельмерта { $rank }/7 обумовленість { $condition } | сигма зсуву датуму { $v5 } проти похибки відновлення введеного перетворення { $trans_err_norm_m } m (відношення { $v7 })
    }

engine-lunar-jamming-lunar-jamming-sats-epochs-links =
    lunar-jamming | { $n_sats ->
        [one] { $n_sats } супутник
        [few] { $n_sats } супутники
        [many] { $n_sats } супутників
       *[other] { $n_sats } супутника
    }, { $n_epochs ->
        [one] { $n_epochs } епоха
        [few] { $n_epochs } епохи
        [many] { $n_epochs } епох
       *[other] { $n_epochs } епохи
    }, { $n_links ->
        [one] { $n_links } лінія зв'язку
        [few] { $n_links } лінії зв'язку
        [many] { $n_links } ліній зв'язку
       *[other] { $n_links } лінії зв'язку
    } з ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (середнє { $mean_js_db }) | LOST: { $n_lost } | доступність { $availability_under_jamming } з номінальних { $availability_nominal }

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 =
    lunar-jamming | { $n_sats ->
        [one] { $n_sats } супутник
        [few] { $n_sats } супутники
        [many] { $n_sats } супутників
       *[other] { $n_sats } супутника
    }, { $n_epochs ->
        [one] { $n_epochs } епоха
        [few] { $n_epochs } епохи
        [many] { $n_epochs } епох
       *[other] { $n_epochs } епохи
    }, { $n_links ->
        [one] { $n_links } лінія зв'язку
        [few] { $n_links } лінії зв'язку
        [many] { $n_links } ліній зв'язку
       *[other] { $n_links } лінії зв'язку
    } з ({ $site_lat_deg }, { $site_lon_deg }) | без глушника (чисте небо, місячна базова лінія) | LOST: { $n_lost } | доступність { $availability_nominal }

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines =
    lunar-vlbi-fim | { $n_stations ->
        [one] { $n_stations } станція
        [few] { $n_stations } станції
        [many] { $n_stations } станцій
       *[other] { $n_stations } станції
    } / бази: { $v2 } x епохи: { $n_epochs } = { $n_obs ->
        [one] { $n_obs } спостереження
        [few] { $n_obs } спостереження
        [many] { $n_obs } спостережень
       *[other] { $n_obs } спостереження
    } (маска { $mask } deg) | датум { $datum } | ранг { $rank }/{ $dim }, обумовленість { $condition } | сигма станції { $v10 } проти equipartition g={ $g } { $eq_g } м (відношення { $v13 })

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok: { $kind } — kind розпізнано, і його єдиний опублікований запис обов'язкового поля ({ $n_required }) виконано; значення полів не перевіряються
        [few] ok: { $kind } — kind розпізнано, і всі { $n_required } записи його опублікованих обов'язкових полів виконано; значення полів не перевіряються
        [many] ok: { $kind } — kind розпізнано, і всі { $n_required } записів його опублікованих обов'язкових полів виконано; значення полів не перевіряються
       *[other] ok: { $kind } — kind розпізнано, і всі { $n_required } запису його опублікованих обов'язкових полів виконано; значення полів не перевіряються
    }

engine-mars-pnt-mars-pnt-user-clock-relays =
    { $n_relays ->
        [one] mars-pnt { $r } | користувач { $user }, годинник { $clock_class } | { $n_relays } ретранслятор (у середньому { $mean_relays_in_view } у видимості) | зведена RMS положення { $converged_pos_rms_m } м, формальна 1σ { $converged_pos_sigma_m } м (3σ { $converged_pos_3sigma_m } м — коваріаційний показник якості, а не затверджений PL) | σ частоти годинника { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
        [few] mars-pnt { $r } | користувач { $user }, годинник { $clock_class } | { $n_relays } ретранслятори (у середньому { $mean_relays_in_view } у видимості) | зведена RMS положення { $converged_pos_rms_m } м, формальна 1σ { $converged_pos_sigma_m } м (3σ { $converged_pos_3sigma_m } м — коваріаційний показник якості, а не затверджений PL) | σ частоти годинника { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
        [many] mars-pnt { $r } | користувач { $user }, годинник { $clock_class } | { $n_relays } ретрансляторів (у середньому { $mean_relays_in_view } у видимості) | зведена RMS положення { $converged_pos_rms_m } м, формальна 1σ { $converged_pos_sigma_m } м (3σ { $converged_pos_3sigma_m } м — коваріаційний показник якості, а не затверджений PL) | σ частоти годинника { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
       *[other] mars-pnt { $r } | користувач { $user }, годинник { $clock_class } | { $n_relays } ретранслятора (у середньому { $mean_relays_in_view } у видимості) | зведена RMS положення { $converged_pos_rms_m } м, формальна 1σ { $converged_pos_sigma_m } м (3σ { $converged_pos_3sigma_m } м — коваріаційний показник якості, а не затверджений PL) | σ частоти годинника { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
    }

engine-e-mcda-copras-copras-weights-but-criterion-types =
    { $n ->
        [one] COPRAS: { $n } вага, а типів критеріїв: { $types }
        [few] COPRAS: { $n } ваги, а типів критеріїв: { $types }
        [many] COPRAS: { $n } ваг, а типів критеріїв: { $types }
       *[other] COPRAS: { $n } ваги, а типів критеріїв: { $types }
    }

engine-e-mcda-moora-moora-weights-but-criterion-types =
    { $n ->
        [one] MOORA: { $n } вага, а типів критеріїв: { $types }
        [few] MOORA: { $n } ваги, а типів критеріїв: { $types }
        [many] MOORA: { $n } ваг, а типів критеріїв: { $types }
       *[other] MOORA: { $n } ваги, а типів критеріїв: { $types }
    }

engine-e-mcda-topsis-topsis-weights-but-criterion-types =
    { $n ->
        [one] TOPSIS: { $n } вага, а типів критеріїв: { $types }
        [few] TOPSIS: { $n } ваги, а типів критеріїв: { $types }
        [many] TOPSIS: { $n } ваг, а типів критеріїв: { $types }
       *[other] TOPSIS: { $n } ваги, а типів критеріїв: { $types }
    }

engine-e-mcda-vikor-vikor-weights-but-criterion-types =
    { $n ->
        [one] VIKOR: { $n } вага, а типів критеріїв: { $types }
        [few] VIKOR: { $n } ваги, а типів критеріїв: { $types }
        [many] VIKOR: { $n } ваг, а типів критеріїв: { $types }
       *[other] VIKOR: { $n } ваги, а типів критеріїв: { $types }
    }

engine-e-mcda-waspas-waspas-weights-but-criterion-types =
    { $n ->
        [one] WASPAS: { $n } вага, а типів критеріїв: { $types }
        [few] WASPAS: { $n } ваги, а типів критеріїв: { $types }
        [many] WASPAS: { $n } ваг, а типів критеріїв: { $types }
       *[other] WASPAS: { $n } ваги, а типів критеріїв: { $types }
    }

engine-e-mcda-wpm-wpm-weights-but-criterion-types =
    { $n ->
        [one] WPM: { $n } вага, а типів критеріїв: { $types }
        [few] WPM: { $n } ваги, а типів критеріїв: { $types }
        [many] WPM: { $n } ваг, а типів критеріїв: { $types }
       *[other] WPM: { $n } ваги, а типів критеріїв: { $types }
    }

engine-e-mcda-promethee-promethee-ii-weights-but-types =
    { $n ->
        [one] PROMETHEE II: { $n } вага, а типів: { $types } / функцій переваги: { $prefs }
        [few] PROMETHEE II: { $n } ваги, а типів: { $types } / функцій переваги: { $prefs }
        [many] PROMETHEE II: { $n } ваг, а типів: { $types } / функцій переваги: { $prefs }
       *[other] PROMETHEE II: { $n } ваги, а типів: { $types } / функцій переваги: { $prefs }
    }

engine-e-mcda-copras-copras-alternative-has-values-but =
    { $n ->
        [one] COPRAS: альтернатива { $i } має значень: { $row }, а є { $n } критерій
        [few] COPRAS: альтернатива { $i } має значень: { $row }, а є { $n } критерії
        [many] COPRAS: альтернатива { $i } має значень: { $row }, а є { $n } критеріїв
       *[other] COPRAS: альтернатива { $i } має значень: { $row }, а є { $n } критерію
    }

engine-e-mcda-electre-electre-alternative-has-values-but =
    { $n ->
        [one] ELECTRE I: альтернатива { $i } має значень: { $row }, а є { $n } критерій
        [few] ELECTRE I: альтернатива { $i } має значень: { $row }, а є { $n } критерії
        [many] ELECTRE I: альтернатива { $i } має значень: { $row }, а є { $n } критеріїв
       *[other] ELECTRE I: альтернатива { $i } має значень: { $row }, а є { $n } критерію
    }

engine-e-mcda-moora-moora-alternative-has-values-but =
    { $n ->
        [one] MOORA: альтернатива { $i } має значень: { $row }, а є { $n } критерій
        [few] MOORA: альтернатива { $i } має значень: { $row }, а є { $n } критерії
        [many] MOORA: альтернатива { $i } має значень: { $row }, а є { $n } критеріїв
       *[other] MOORA: альтернатива { $i } має значень: { $row }, а є { $n } критерію
    }

engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    { $n ->
        [one] PROMETHEE II: альтернатива { $i } має значень: { $row }, а є { $n } критерій
        [few] PROMETHEE II: альтернатива { $i } має значень: { $row }, а є { $n } критерії
        [many] PROMETHEE II: альтернатива { $i } має значень: { $row }, а є { $n } критеріїв
       *[other] PROMETHEE II: альтернатива { $i } має значень: { $row }, а є { $n } критерію
    }

engine-e-mcda-topsis-topsis-alternative-has-values-but =
    { $n ->
        [one] TOPSIS: альтернатива { $i } має значень: { $row }, а є { $n } критерій
        [few] TOPSIS: альтернатива { $i } має значень: { $row }, а є { $n } критерії
        [many] TOPSIS: альтернатива { $i } має значень: { $row }, а є { $n } критеріїв
       *[other] TOPSIS: альтернатива { $i } має значень: { $row }, а є { $n } критерію
    }

engine-e-mcda-vikor-vikor-alternative-has-values-but =
    { $n ->
        [one] VIKOR: альтернатива { $i } має значень: { $row }, а є { $n } критерій
        [few] VIKOR: альтернатива { $i } має значень: { $row }, а є { $n } критерії
        [many] VIKOR: альтернатива { $i } має значень: { $row }, а є { $n } критеріїв
       *[other] VIKOR: альтернатива { $i } має значень: { $row }, а є { $n } критерію
    }

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    { $n ->
        [one] WASPAS: альтернатива { $i } має значень: { $row }, а є { $n } критерій
        [few] WASPAS: альтернатива { $i } має значень: { $row }, а є { $n } критерії
        [many] WASPAS: альтернатива { $i } має значень: { $row }, а є { $n } критеріїв
       *[other] WASPAS: альтернатива { $i } має значень: { $row }, а є { $n } критерію
    }

engine-e-mcda-wpm-wpm-alternative-has-values-but =
    { $n ->
        [one] WPM: альтернатива { $i } має значень: { $row }, а є { $n } критерій
        [few] WPM: альтернатива { $i } має значень: { $row }, а є { $n } критерії
        [many] WPM: альтернатива { $i } має значень: { $row }, а є { $n } критеріїв
       *[other] WPM: альтернатива { $i } має значень: { $row }, а є { $n } критерію
    }

engine-e-mcda-wsm-alternative-has-values-but-there =
    { $n ->
        [one] альтернатива '{ $name }' має значень: { $values }, а є { $n } критерій
        [few] альтернатива '{ $name }' має значень: { $values }, а є { $n } критерії
        [many] альтернатива '{ $name }' має значень: { $values }, а є { $n } критеріїв
       *[other] альтернатива '{ $name }' має значень: { $values }, а є { $n } критерію
    }

engine-e-naif-kernel-daf-summary-record-claims-summaries =
    { $count ->
        [one] запис зведень DAF { $rec } заявляє { $count } зведення
        [few] запис зведень DAF { $rec } заявляє { $count } зведення
        [many] запис зведень DAF { $rec } заявляє { $count } зведень
       *[other] запис зведень DAF { $rec } заявляє { $count } зведення
    }

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    { $n_used ->
        [one] приймач знову повідомляє про рішення (використано { $n_used } супутник)
        [few] приймач знову повідомляє про рішення (використано { $n_used } супутники)
        [many] приймач знову повідомляє про рішення (використано { $n_used } супутників)
       *[other] приймач знову повідомляє про рішення (використано { $n_used } супутника)
    }

engine-nmea-synth-gen-the-receiver-has-no-fix =
    { $n_used ->
        [one] приймач не має рішення ({ $n_used } придатний супутник, потрібно чотири)
        [few] приймач не має рішення ({ $n_used } придатні супутники, потрібно чотири)
        [many] приймач не має рішення ({ $n_used } придатних супутників, потрібно чотири)
       *[other] приймач не має рішення ({ $n_used } придатного супутника, потрібно чотири)
    }

engine-observability-gramian-gdop-undefined-rank-deficient-singular =
    { $n ->
        [one] GDOP не визначено (геометрія з дефіцитом рангу / сингулярна): ранг { $rank } із { $n } стану, дефект датума { $v3 }, обумовленість { $v4 }
        [few] GDOP не визначено (геометрія з дефіцитом рангу / сингулярна): ранг { $rank } із { $n } станів, дефект датума { $v3 }, обумовленість { $v4 }
        [many] GDOP не визначено (геометрія з дефіцитом рангу / сингулярна): ранг { $rank } із { $n } станів, дефект датума { $v3 }, обумовленість { $v4 }
       *[other] GDOP не визначено (геометрія з дефіцитом рангу / сингулярна): ранг { $rank } із { $n } стану, дефект датума { $v3 }, обумовленість { $v4 }
    }

engine-oem-oem-interop-round-tripped-segment =
    { $n_states_total ->
        [one] oem-interop: проведено круговий обмін сегментами: { $segments }, { $n_states_total } стан; максимальна похибка кругового обміну { $p } km / { $v } km/s (MODELLED, інтероперабельність)
        [few] oem-interop: проведено круговий обмін сегментами: { $segments }, { $n_states_total } стани; максимальна похибка кругового обміну { $p } km / { $v } km/s (MODELLED, інтероперабельність)
        [many] oem-interop: проведено круговий обмін сегментами: { $segments }, { $n_states_total } станів; максимальна похибка кругового обміну { $p } km / { $v } km/s (MODELLED, інтероперабельність)
       *[other] oem-interop: проведено круговий обмін сегментами: { $segments }, { $n_states_total } стану; максимальна похибка кругового обміну { $p } km / { $v } km/s (MODELLED, інтероперабельність)
    }

engine-oem-oem-interop-ingested-segment-states =
    { $n_states_total ->
        [one] oem-interop: прийнято сегментів: { $segments }, { $n_states_total } стан із зовнішнього OEM (укладач { $originator }) (MODELLED, інтероперабельність)
        [few] oem-interop: прийнято сегментів: { $segments }, { $n_states_total } стани із зовнішнього OEM (укладач { $originator }) (MODELLED, інтероперабельність)
        [many] oem-interop: прийнято сегментів: { $segments }, { $n_states_total } станів із зовнішнього OEM (укладач { $originator }) (MODELLED, інтероперабельність)
       *[other] oem-interop: прийнято сегментів: { $segments }, { $n_states_total } стану із зовнішнього OEM (укладач { $originator }) (MODELLED, інтероперабельність)
    }

engine-pvt-pvt-sat-nav-epochs-solved =
    { $n_satellites_nav ->
        [one] pvt { $r } | { $n_satellites_nav } навігаційний супутник | розв'язано епох: { $epochs_solved }/{ $epochs_total } | у середньому супутників: { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
        [few] pvt { $r } | { $n_satellites_nav } навігаційні супутники | розв'язано епох: { $epochs_solved }/{ $epochs_total } | у середньому супутників: { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
        [many] pvt { $r } | { $n_satellites_nav } навігаційних супутників | розв'язано епох: { $epochs_solved }/{ $epochs_total } | у середньому супутників: { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
       *[other] pvt { $r } | { $n_satellites_nav } навігаційного супутника | розв'язано епох: { $epochs_solved }/{ $epochs_total } | у середньому супутників: { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
    }

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    { $n_used ->
        [one] геометрія { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } супутник{ $v6 }
        [few] геометрія { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } супутники{ $v6 }
        [many] геометрія { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } супутників{ $v6 }
       *[other] геометрія { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } супутника{ $v6 }
    }

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] виведено із { $n } записаного супутника
        [few] виведено із { $n } записаних супутників
        [many] виведено із { $n } записаних супутників
       *[other] виведено із { $n } записаного супутника
    }

engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] за повідомленням приймача, використано { $n } супутник
        [few] за повідомленням приймача, використано { $n } супутники
        [many] за повідомленням приймача, використано { $n } супутників
       *[other] за повідомленням приймача, використано { $n } супутника
    }

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } супутник, менше за { $min_used }
        [few] { $n } супутники, менше за { $min_used }
        [many] { $n } супутників, менше за { $min_used }
       *[other] { $n } супутника, менше за { $min_used }
    }

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] журнал має { $n } відлік; для підгонки Аллана потрібно щонайменше { $MIN_SAMPLES }
        [few] журнал має { $n } відліки; для підгонки Аллана потрібно щонайменше { $MIN_SAMPLES }
        [many] журнал має { $n } відліків; для підгонки Аллана потрібно щонайменше { $MIN_SAMPLES }
       *[other] журнал має { $n } відліку; для підгонки Аллана потрібно щонайменше { $MIN_SAMPLES }
    }

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not =
    { $n ->
        [one] інтервал відліків не рівномірний (інтервалів, що різняться більш як на 25 %: { $uneven } з { $n } інтервалу): спершу перевибіркуйте журнал
        [few] інтервал відліків не рівномірний (інтервалів, що різняться більш як на 25 %: { $uneven } з { $n } інтервалів): спершу перевибіркуйте журнал
        [many] інтервал відліків не рівномірний (інтервалів, що різняться більш як на 25 %: { $uneven } з { $n } інтервалів): спершу перевибіркуйте журнал
       *[other] інтервал відліків не рівномірний (інтервалів, що різняться більш як на 25 %: { $uneven } з { $n } інтервалу): спершу перевибіркуйте журнал
    }

engine-e-scenario-time-grid-too-large-steps =
    { $n ->
        [one] сітка часу завелика: { $n } крок перевищує MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); використайте грубіший крок або коротшу тривалість
        [few] сітка часу завелика: { $n } кроки перевищують MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); використайте грубіший крок або коротшу тривалість
        [many] сітка часу завелика: { $n } кроків перевищують MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); використайте грубіший крок або коротшу тривалість
       *[other] сітка часу завелика: { $n } кроку перевищує MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); використайте грубіший крок або коротшу тривалість
    }

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] підігнано до девіації Аллана з перекриттям запису з { $n_samples } відліку за { $tau0_s } с, у базисі частотної модуляції IEEE Std 1139
        [few] підігнано до девіації Аллана з перекриттям запису з { $n_samples } відліків за { $tau0_s } с, у базисі частотної модуляції IEEE Std 1139
        [many] підігнано до девіації Аллана з перекриттям запису з { $n_samples } відліків за { $tau0_s } с, у базисі частотної модуляції IEEE Std 1139
       *[other] підігнано до девіації Аллана з перекриттям запису з { $n_samples } відліку за { $tau0_s } с, у базисі частотної модуляції IEEE Std 1139
    }

engine-solar-system-solar-system-at-jd-tdb =
    { $n_bodies ->
        [one] Сонячна система на { $input } (JD { $jd_tdb } TDB), { $n_bodies } тіло, спостерігач { $observer }
        { "  " }{ $standish_table }{ "\u000A" }
        [few] Сонячна система на { $input } (JD { $jd_tdb } TDB), { $n_bodies } тіла, спостерігач { $observer }
        { "  " }{ $standish_table }{ "\u000A" }
        [many] Сонячна система на { $input } (JD { $jd_tdb } TDB), { $n_bodies } тіл, спостерігач { $observer }
        { "  " }{ $standish_table }{ "\u000A" }
       *[other] Сонячна система на { $input } (JD { $jd_tdb } TDB), { $n_bodies } тіла, спостерігач { $observer }
        { "  " }{ $standish_table }{ "\u000A" }
    }

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] точне значення CUC { $fine } не вміщується в { $n } октеті
        [few] точне значення CUC { $fine } не вміщується в { $n } октетах
        [many] точне значення CUC { $fine } не вміщується в { $n } октетах
       *[other] точне значення CUC { $fine } не вміщується в { $n } октеті
    }

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: сформовано { $packet_count } пакет CCSDS-133.0 { $v2 }, APID { $apid }, усього октетів: { $total_bytes }, точний цикл туди й назад ({ $round_trip_ok })
        [few] space-packet: сформовано { $packet_count } пакети CCSDS-133.0 { $v2 }, APID { $apid }, усього октетів: { $total_bytes }, точний цикл туди й назад ({ $round_trip_ok })
        [many] space-packet: сформовано { $packet_count } пакетів CCSDS-133.0 { $v2 }, APID { $apid }, усього октетів: { $total_bytes }, точний цикл туди й назад ({ $round_trip_ok })
       *[other] space-packet: сформовано { $packet_count } пакета CCSDS-133.0 { $v2 }, APID { $apid }, усього октетів: { $total_bytes }, точний цикл туди й назад ({ $round_trip_ok })
    }

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] станів: { $states } на { $n } епоху
        [few] станів: { $states } на { $n } епохи
        [many] станів: { $states } на { $n } епох
       *[other] станів: { $states } на { $n } епохи
    }

engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } стан; для степеня { $degree } потрібно { $value }
        [few] { $n } стани; для степеня { $degree } потрібно { $value }
        [many] { $n } станів; для степеня { $degree } потрібно { $value }
       *[other] { $n } стану; для степеня { $degree } потрібно { $value }
    }

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] епох: { $epochs } на { $n } рядок різниць
        [few] епох: { $epochs } на { $n } рядки різниць
        [many] епох: { $epochs } на { $n } рядків різниць
       *[other] епох: { $epochs } на { $n } рядка різниць
    }

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] ключ розгортки `{ $key }`: індекс { $i } виходить за межі масиву з { $n } елемента
        [few] ключ розгортки `{ $key }`: індекс { $i } виходить за межі масиву з { $n } елементів
        [many] ключ розгортки `{ $key }`: індекс { $i } виходить за межі масиву з { $n } елементів
       *[other] ключ розгортки `{ $key }`: індекс { $i } виходить за межі масиву з { $n } елемента
    }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] попередження: { $n } повідомлення MQTT не доставлено
        [few] попередження: { $n } повідомлення MQTT не доставлено
        [many] попередження: { $n } повідомлень MQTT не доставлено
       *[other] попередження: { $n } повідомлення MQTT не доставлено
    }

## legal

# legal: native review
engine-legal-compliance-statement = Рядок, позначений як «evidenced», означає, що запуск із цього набору підтримує докази для можливостей, названих у рядку. Це не висновок, що вимоги рамки виконано, і не означає, що будь-який продукт хтось оцінив чи затвердив. Стовпець прогалин вказує, чого запуски не показують.

# legal: native review
engine-legal-bench-surface-notice = Лише рух транспортного засобу та позначені інтервали подій. Ніщо з експортованого тут не є радіочастотним сигналом чи сигналом у базовій смузі, не моделює такого сигналу і не керує ним, а подія — це часовий інтервал, а не рецепт створення завад. Сигнали постачають лабораторний симулятор та його оператор, які відповідають за їх запуск лише там, де це дозволено (кабельно або в екранованому приміщенні, згідно з власними інструкціями безпеки симулятора). Kshana не публікує жодних результатів таких запусків.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC на рівні вікон для кожного монітора за наданими записами. Кожне вказане вікно події є позитивним, а кожне вікно roc_window_s поза подіями — негативним; вікно зараховується на порозі, коли тестова статистика монітора досягає його у вікні. P_fa — на негативне вікно, а не на тест.

# legal: native review
engine-legal-lunanet-afs-advisory = Лише консультативно: результат аналізу від дослідницького та інженерного інструмента; це не навігаційне обладнання із затвердженням типу і не послуга забезпечення безпеки життя. Він перевіряє потік символів за одним виданням опублікованої специфікації і нічого не говорить про жоден вузол чи послугу LunaNet.

# legal: native review
engine-legal-iqfit-statement = MODELLED: кожне підігнане число описує відкритий приймач (названу конструкцію петлі та вхідний тракт) на наданих йому записах, підігнане до оцінених результатів кампанії. Це не вимірювання жодного іншого приймача. Прогнози позначено PREDICTION, із найближчим випробуваним записом і відстанню поза випробуваними умовами.

# legal: native review
engine-legal-iqfit-advisory = Лише консультативно: результат аналізу, не навігаційне обладнання із затвердженням типу; прогнози є виходом моделі із зазначеною похибкою, а не гарантіями.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Заява про джерело, а не твердження: матеріали ICG WG-B Lunar PNT за червень 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, джерело S3 дослідження) описують лабораторію місячної опорної шкали часу при станції з цільовим рівнем часу порядку наносекунд. Kshana наводить цю ціль лише для контексту; вона її не приймає, і ніщо в цьому блоці не показує, що будь-який реальний годинник станції її досягає.

# legal: native review
engine-legal-standards-pack-notice = Пакет стандартів вимірює змодельовані сценарії відносно порогів, визначених до запуску. Він підтримує докази для названих рядків рамки; він не оцінює і не затверджує жоден продукт, а поріг, позначений MET, говорить лише про те, що змодельований результат сценарію досяг визначеного порогу.

# legal: native review
engine-legal-standards-pack-advisory = Лише консультативно: результат аналізу від дослідницького та інженерного інструмента; це не навігаційне обладнання із затвердженням типу і не послуга забезпечення безпеки життя; його не можна використовувати як єдину підставу для будь-якого навігаційного рішення або рішення щодо безпеки.

# legal: native review
engine-legal-geometry-statement = Геометрія за вказаної моделі похибок (MODELLED): видимість у прямій видимості відносно вказаного горизонту, геометричний чинник DOP та гаусів еліпс похибок для незалежних, рівних, нуль-середніх гаусових похибок дальності із вказаною еквівалентною похибкою дальності користувача. Це не прогноз реальної похибки приймача, яка має також систематичні похибки, багатопроменевість і похибки поза прямою видимістю, і не межа цілісності. Попередньо задані орбітальні угруповання є репрезентативною геометрією, а не небом тієї дати в тому місці.

# legal: native review
engine-legal-resilience-disclaimer = Самооцінка на основі симуляції, співвіднесена з DHS RPCF v2.0. Це не сертифікація й не акредитація, і вона не означає схвалення жодним органом (DHS, IEEE чи іншим). Кожна підоцінка є MODELLED, якщо її прямо не позначено VALIDATED, а оцінки є показниками якості у часовій області та виявленні, а не точністю в області положення.

# legal: native review
engine-legal-observatory-notice = Погіршена комірка означає, що висока частка повітряних суден того дня повідомила там про низьку точність навігації. Жодну причину не приписано. Комірка, яку не спостерігали, або відсутня, не оцінювалася, що не те саме, що чиста. Лише консультативно: це не схвалення, не сертифікація і не заява про відповідність.

# legal: native review
engine-legal-receiver-trust-advisory = Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу (IEC 61108, IEC 61162): відповідальність за навігацію судна залишається на операторі.

# legal: native review
engine-legal-evidence-roundtrip-notice = Пов'язує чотири записи за хешем: сценарій, зазначені лабораторією умови випробування, журнал приймача та оцінку цього журналу щодо зазначених подій. Це не сигнал, не рецепт відтворення і не сертифікація. Те, як рух зі сценарію потрапив до приймача (файл, відтворений лабораторним симулятором, кабельно або в екранованому приміщенні), було відповідальністю оператора і записане тут лише так, як його зазначено.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Цей пакет є технічним записом того, що рушій Kshana обчислив зі вказаного журналу приймача за вказаної конфігурації. Він не є юридичним висновком, не є встановленням фактів про будь-яку подію чи її причину і не є сертифікацією.

# legal: native review
engine-legal-bench-notice = Лише консультативно: змодельовано або виміряно відносно зазначених еталонів; це не схвалення, не сертифікація і не заява про відповідність. Оцінка описує журнал або корпус, ніколи не продукт.

# legal: native review
engine-legal-osnma-advisory = Лише консультативно: це результат аналізу та моніторингу, а не навігаційне обладнання із затвердженням типу. Наведений тут стан автентифікації не є послугою цілісності навігації і не може бути єдиною підставою для будь-якого навігаційного рішення або рішення щодо безпеки.

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = розгортка `{ $scenario_kind }` за { $axis_order } (вузлів: { $nodes }, медіана зі смугою від 5-го до 95-го процентиля за зернами: { $n_runs }; кожна лінія у своєму діапазоні)

engine-holdover-test-holdover-not-recovered-within-record = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; не відновлено протягом запису (MODELLED, виміряно щодо маски)

engine-holdover-test-holdover-recovered-after-gnss-returned = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; відновлено через { $t } s після повернення GNSS (MODELLED, виміряно щодо маски)

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = записано kshana iq scene: СИМУЛЬОВАНА сцена, а не запис; цілочисельний масштаб: 1 LSB = { $sc } одиниць, нормованих на шум (очікуваний RMS { $v1 } LSB на компоненту), обрізано елементів: { $clipped }

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = записано kshana iq scene; цілочисельний масштаб: 1 LSB = { $sc } одиниць, нормованих на шум (очікуваний RMS { $v1 } LSB на компоненту), обрізано елементів: { $clipped }

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = записано відліків: { $samples } ({ $format }, { $fs_hz } Hz) у { $data_path }; записів істини: { $truth_records } у { $truth_path }; { $meta_note }; канал: { $chan_desc }; цілочисельний масштаб: 1 LSB = { $sc } одиниць, нормованих на шум (очікуваний RMS { $v1 } LSB на компоненту), обрізано елементів: { $clipped }

engine-lunar-chart-title = HPL південного полюса Місяця (доступність { $availability }%, AL { $al } m, σ_URE { $sigma } m)

engine-lunar-beacon-chart-title = Доповнення поверхневими маяками — PDOP за конфігураціями

engine-lunar-beacon-chart-no-solution = розв'язку немає

engine-lunar-beacon-chart-footnote = менше — краще; sigma_URE на маяк { $sigma } m, маска { $mask } deg

engine-lunar-combination-chart-title = Спільне визначення орбіти (OD) та годинника на Місяці — 3-D похибка положення станції (VLBI відновлює спостережуваність)

engine-lunar-combination-chart-subtitle = супутників: { $n_sat }, земних станцій: { $n_earth } · коефіцієнт покращення { $factor }×

engine-lunar-combination-chart-with-vlbi = з VLBI: { $m } m

engine-lunar-combination-chart-range-only = лише за дальністю: { $m } m

engine-lunar-combination-chart-axis-note = log10 похибки станції (m); збіжність з/без = { $with }/{ $without }

engine-lunar-dpnt-chart-title = Диференційна PNT на Місяці — супутників: { $n_sats }: скоригована похибка проти бази (зменшення у × { $factor } на { $km } km)

engine-lunar-dpnt-chart-subtitle = нескоригована { $uncorrected } m | скоригована { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = нескоригована (автономно)

engine-lunar-dpnt-chart-baseline-km = база (km)

engine-lunar-dpnt-chart-err-m = похибка (m)

engine-lunar-frame-realise-chart-title = Реалізація місячної системи відліку — відновлення 7-параметричного перетворення Гельмерта

engine-lunar-frame-realise-chart-subtitle = точок: { $n_points } · RMS залишку { $rms } m · збіжність { $converged }

engine-lunar-frame-realise-chart-scale = масштаб (ppb)

engine-lunar-frame-realise-chart-row = { $label }: введено { $inj } { $unit } · відновлено { $rec } { $unit } · похибка { $err }

engine-lunar-interop-chart-title = Експорт для інтероперабельності на Місяці — CCSDS OEM + KIF (узгоджено з LunaNet/IOAG)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | станів: { $n_states } | рядків OEM: { $oem_lines }

engine-lunar-interop-chart-artifacts = артефакти: { $list }

engine-lunar-interop-chart-conformance = відповідність полів: { $verdict } (наявних: { $present }, відсутніх: { $missing }, рядків даних: { $data_lines })

engine-lunar-interop-chart-roundtrip = цикл OEM туди й назад: { $oem } | цикл метаданих часу туди й назад: { $time_metadata } | KIF { $kif_bytes } bytes

engine-lunar-interop-chart-footnote = Цикл туди й назад / відповідність полів проти CCSDS OEM та опублікованої семантики полів LunaNet/IOAG. { $label } — це не сертифікований тест відповідності щодо інтероперабельності; жодного схвалення з боку агенцій.

engine-lunar-jamming-chart-title = J/S на супутник проти висоти над горизонтом, користувач на поверхні Місяця

engine-lunar-jamming-chart-x-title = висота супутника над горизонтом (deg)

engine-lunar-jamming-chart-n-links = каналів: { $n_links }

engine-lunar-service-chart-title = Об'єм обслуговування на Місяці — супутників: { $n_sats }, точок: { $n_points } × епох: { $n_epochs }: покриття { $coverage }% (PDOP&lt;{ $threshold })

engine-lunar-service-chart-subtitle = супутників { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | доступність PL { $pl_avail }% (AL { $al } m, σ_URE { $sigma } m)

engine-lunar-service-chart-pdop-min = PDOP мін. { $v }

engine-lunar-service-chart-pdop-mean = PDOP середнє { $v }

engine-lunar-service-chart-pdop-max = PDOP макс. { $v }

engine-lunar-station-chart-title = Місячна опорна станція: p{ $percentile } скоригованої 3-D похибки над південно-полярним регіоном (MODELLED)

engine-lunar-station-chart-threshold = поріг { $thr } m при p{ $percentile }

engine-lunar-station-chart-availability = доступність { $v } %

engine-lunar-station-chart-coverage = покриття { $v } %

engine-lunar-station-chart-corrected-3d = скоригована 3-D { $f }

engine-lunar-station-chart-uncorrected-3d = нескоригована 3-D { $f }

engine-lunar-station-chart-legend-half = ≤ половини порога

engine-lunar-station-chart-legend-within = ≤ порога

engine-lunar-station-chart-legend-twice = ≤ подвійного порога

engine-lunar-station-chart-legend-above = понад подвійний поріг

engine-lunar-station-chart-station-note = ◆ станція · пунктир: відстань, до якої покриття тримається на рівні 95 %

engine-lunar-station-chart-disclaimer = MODELLED за заявлених припущень; не є твердженням про жодну реальну систему; не пов'язано з жодною агенцією і не схвалено нею.

engine-lunar-time-chart-title = Місячний координатний час LTC−TT (швидкість { $rate } µs/day, смуга { $low }–{ $high })

engine-lunar-time-chart-offset = { $offset } µs за { $days } d

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | годинник { $clock } | 7-складовий x_Σ(τ) за { $taus } τ-точками ({ $taus2 }–{ $taus3 } s) | перетин τ { $crossover_tau_s } s (x { $crossover_x_s } s) | поріг системи відліку { $frame_term_s } s | годинник x(1 d) { $x_1day_ns } ns (MODELLED) | лабораторія часу: { $lab } { $lab2 } до LTC, x(1 d) { $lab3 } ns (MODELLED)

engine-lunar-vlbi-chart-title = Затримка місячного VLBI (база { $baseline } km, дальність маяка { $range } km, ближнє поле { $near_field } µs)

engine-lunar-vlbi-chart-footnote = затримка { $delay } µs на епоху · відліків: { $samples } за { $hours } h

engine-mars-pnt-chart-formal-3sigma = формальне 3σ (коваріація, не сертифікований PL)

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = відтягування положення: повідомлене положення відходить на { $final_offset_m } m { $dir }, тоді як приймач зберігає дійсне визначення (хибний трек сягає піка { $pv } m/s і { $pa } m/s^2); кожен супутник, що відстежується, показує { $c } dB-Hz, поки це триває

engine-nmea-synth-log-position-drag-off-genuine-cn0 = відтягування положення: повідомлене положення відходить на { $final_offset_m } m { $dir }, тоді як приймач зберігає дійсне визначення (хибний трек сягає піка { $pv } m/s і { $pa } m/s^2); справжній профіль C/N0 зберігається

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = спуфінг часу: повідомлений UTC зсувається на { $offset_s } s від істинного; положення залишається істинним; кожен супутник, що відстежується, показує { $c } dB-Hz, поки це триває

engine-nmea-synth-log-time-spoof-genuine-cn0 = спуфінг часу: повідомлений UTC зсувається на { $offset_s } s від істинного; положення залишається істинним; справжній профіль C/N0 зберігається

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = затримка відтворення (у стилі міконінгу): положення{ $v1 } відстає від істини на { $delay_s } s; кожен супутник, що відстежується, показує { $c } dB-Hz, поки це триває

engine-nmea-synth-log-replay-delay-genuine-cn0 = затримка відтворення (у стилі міконінгу): положення{ $v1 } відстає від істини на { $delay_s } s; справжній профіль C/N0 зберігається

engine-pvt-chart-3d-error-m = 3D похибка (m)

engine-pvt-chart-postfit-rms-m = RMS після підгонки (m)

engine-quantum-faults-chart-quantum = квантовий

engine-quantum-faults-chart-classical = класичний

engine-raim-stanford-chart-title = Діаграма Стенфорда — цілісність (епох: { $n_epochs }, AL = { $al } m)

engine-raim-chart-title = Рівні захисту RAIM і доступність (доступно { $availability }%)

engine-receiver-trust-chart-track-caption = трек, повідомлений приймачем, північ угорі

engine-receiver-trust-chart-start = початок

engine-receiver-trust-chart-end-of-log = кінець журналу

engine-receiver-trust-chart-no-positions = у журналі немає положень

engine-receiver-trust-chart-score-axis = оцінка довіри, від 0 до 100

engine-receiver-trust-chart-legend-vessel = довіра: зелений — номінальна (оцінка не нижча за { $nominal }), бурштиновий — погіршена (не нижча за { $degraded }), червоний — недовірена, сірий — калібрування

engine-receiver-trust-chart-legend = довіра: зелений — номінальна, бурштиновий — погіршена, червоний — недовірена, сірий — калібрування

engine-receiver-trust-chart-advisory = Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу; відповідальність залишається на операторі.

engine-receiver-trust-chart-cn0-axis = середнє C/N0, dB-Hz

engine-report-chart-title = Holdover (утримання часу) годинника: похибка часу під час відмови GNSS

engine-slot-timing-chart-aria = Прогнозована похибка часу проти часу від останнього визначення, із запасом слота

engine-slot-timing-chart-time-since-fix = час від визначення, від 0 до { $t }

engine-slot-timing-chart-predicted-error = прогнозована похибка часу (ns); пунктир: запас { $guard } ns

engine-slot-timing-never = ніколи

engine-solar-system-chart-title = Сонячна система — екліптика J2000, вигляд зверху

engine-solar-system-chart-inner = Внутрішня система (до Марса)

engine-solar-system-chart-whole = Уся система (до Плутона)

engine-solar-system-chart-legend = зелений: VALIDATED за JPL Horizons · бурштиновий: MODELLED · супутники планет наведено в result.json із треками щодо центра планети

engine-spectrum-chart-title = Водоспад спектра L-діапазону

engine-spectrum-chart-multi-title = Водоспад спектра в кількох діапазонах

engine-spectrum-chart-frequency-mhz = частота (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz): номінальне (сіре) / мінімальне

engine-spectrum-chart-threshold = поріг { $thr }

engine-spoof-chart-title = Виявлення спуфінгу часу: зсув проти меж виявлення за допомогою годинника

engine-spoof-chart-offset-ns = зсув спуфінгу (ns)

engine-spoof-chart-spoof-offset = зсув спуфінгу

engine-spoof-chart-quantum-bound = квантова межа виявлення

engine-spoof-chart-classical-bound = класична межа виявлення

engine-sweep-chart-title = { $metric } проти { $parameter } (масштаб: { $scale })

engine-sweep-nd-chart-title = { $n_dims }-вимірна розгортка `{ $kind }` — вузлів: { $n_nodes }

engine-sweep-nd-chart-axes = осі: { $axes } (форма { $shape })

engine-sweep-nd-chart-metrics = метрики: { $metrics } — повна сітка в JSON

engine-sweep-nd-chart-line-title = розгортка `{ $kind }` за { $key }

engine-sweep-nd-chart-y-title = метрика

engine-telecom-timing-max-te-ns-budget-never-exceeded = telecom-timing: max|TE| { $max_abs } ns за { $v2 } s; { $masks }; бюджет { $max_abs_te_ns } ns ніколи не перевищено (MODELLED)

engine-telecom-timing-max-te-ns-budget-exceeded-after = telecom-timing: max|TE| { $max_abs } ns за { $v2 } s; { $masks }; бюджет { $max_abs_te_ns } ns перевищено через { $t } s (MODELLED)

engine-telecom-timing-chart-title = Телекомунікаційна синхронізація: похибка часу, MTIE і TDEV

engine-telecom-timing-chart-y-title = |похибка часу| (ns)

engine-telecom-timing-chart-te-caption = абсолютна похибка часу проти бюджетів

engine-telecom-timing-chart-holdover = holdover

engine-telecom-timing-chart-time-record = час (запис тривалістю { $h } h)

engine-telecom-timing-chart-mtie-caption = MTIE (суцільна), TDEV (пунктир), перша маска MTIE (сіра), ns

engine-timetransfer-chart-title = Похибка синхронізації передавання часу (оптичного проти RF)

engine-timetransfer-chart-y-title = похибка синхронізації (ps)

engine-timetransfer-chart-spec = специфікація { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = час вимірювання (s)

engine-timetransfer-chart-optical = оптичний: { $id }

engine-kind-clock-description = Holdover (утримання часу) годинника проти специфікації; необов'язковий ансамбль Монте-Карло (запусків > 1).

engine-kind-inertial-description = 1-DOF інерціальна навігація зліченням шляху під час відмови GNSS.

engine-kind-orbit-description = Доступність GNSS + DOP від орбітального угруповання (Walker / TLE / RINEX).

engine-kind-ephemeris-description = Ефемериди та наземний трек: розповсюдження одного супутника (TLE→SGP4 або аналітична орбіта) і видача його стану TEME/GCRS (положення + швидкість), положення ITRF/ECEF, широти/довготи/висоти підсупутникової точки WGS-84 та азимута/висоти/дальності станції і швидкості зміни дальності (Доплер) на кожному кроці. Супутник береться з `tle` або з аналітичної `orbit` з її `epoch` (`tle` має перевагу, коли задано обидва); за наявності `tle` значення `epoch` перевизначає власну епоху TLE як t = 0.

engine-kind-integrity-description = Миттєвий / з поділом розв'язків / ARAIM RAIM з HPL/VPL і діаграмою Стенфорда.

engine-kind-lunar-integrity-description = Прохід рівня захисту ARAIM на південному полюсі Місяця проти репрезентативного набору ретрансляторів LunaNet. sigma_ure_m задає точність дальнометрії сигналу в просторі (рівні захисту масштабуються з нею лінійно, тож розгортка за нею відповідає на питання, якої точності дальнометрії потребує межа тривоги). Типово — історичний випадок південного полюса класу LNIS.

engine-kind-lunar-time-offset-description = Модельована релятивістська швидкість ходу годинника Земля–Місяць (місячний координатний час, LTC/TCL): вікова швидкість LTC−TT із різниці власних потенціалів і кінетичного члена Місяця, подана з опублікованою смугою 56–59 µs/day, а також накопичений зсув на горизонті.

engine-kind-lunar-vlbi-description = Модельована спостережувана затримка місячного геодезичного VLBI: земна база (дві наземні станції, GCRS) спостерігає односпрямований сигнал від маяка класу NovaMoon на поверхні Місяця. Видає затримку як різницю двох дальностей в ближньому полі, її швидкість і поправку на кривину хвильового фронту в ближньому полі на проході — перехресно перевірену щодо спостережуваної Δ-DOR для плоскої хвилі з тієї самої кодової бази в межі дальнього поля, з частинними похідними, перевіреними скінченними різницями. Типовий аналітичний шлях є MODELLED і несе застереження щодо узгодженості систем відліку, полярного руху xp=yp=0 та порівняння плоскої хвилі з ближнім полем. Задання planetary_kernel_path, earth_orientation_kernel_path і moon_orientation_kernel_path запускає натомість шлях на ядрах (DE440, MOON_PA_DE440, ITRF93; збіжні барицентричні світлові часи; додає частинні похідні для маяка й станції на епоху), чия ньютонівська затримка й частинні похідні узгоджуються зі збіжними світловими часами NAIF SPICE з точністю до { $lit_0_06 } ps і 7.4e-9. Не перевірено за реальними даними VLBI.

engine-kind-lunar-joint-od-clock-description = Модельований спільний багатотехнічний пакетний оцінювач місячної OD + годинника на СИМУЛЬОВАНІЙ мережі: знімковий підбір Гаусса–Ньютона, що зводить затримки земної бази геодезичного VLBI, місячно-локальні дальності станція↔супутник і міжсупутникові дальності, щоб відновити разом 3-D положення місячної поверхневої станції, положення невеликого угруповання та зсув годинника кожного об'єкта за введеною істиною. Головний чесний результат — VLBI робить повне 3-D положення станції спостережуваним там, де самі лише місячно-локальні дальності залишають слабко спостережуваний напрямок — подано як контраст похибки станції з VLBI і без нього. MODELLED симульоване замкнене відновлення (істина ділить модель спостережень), детерміноване (із зерном), НЕ перевірене за реальними даними; усередині розв'язувача немає розповсюдження за силовою моделлю; жодних TRL, спадковості чи схвалення агенцій.

engine-kind-lunar-frame-realisation-description = Модельована реалізація місячної системи відліку: підбір 7-параметричного датума Гельмерта (подібності) — 3 зсуви, 3 повороти малих кутів, 1 масштаб — що прив'язує оцінений набір координат точок MCMF, виведених із селенографічних, до датума зваженим методом найменших квадратів (crate::batch_ls::gauss_newton), плюс проста орієнтаційна прив'язка, що виражає реалізований малий поворот навколо осей ICRF відносно орієнтації тіла за моделлю IAU 2015 WGCCRE. Сценарій вводить відоме мале перетворення (зсув ~десятки m, поворот ~µrad, масштаб ~1e-7) у добре розподілену синтетичну мережу точок, додає гауссів шум із зерном, відновлює датум і подає відновлене перетворення, похибку відновлення за параметрами проти введеної істини та RMS залишку після підгонки. MODELLED самоузгодженість — відновлює введене перетворення подібності (без шуму майже до машинної точності), НЕ є реалізацією за реальними даними стеження/VLBI; детерміноване (із зерном); жодних TRL, спадковості чи схвалення агенцій.

engine-kind-moonlight-service-volume-description = Модельований аналіз об'єму навігаційного обслуговування на Місяці за ILLUSTRATIVE орбітальним угрупованням на місячній орбіті класу Moonlight/LCNS із публічних джерел (не пов'язаним з ESA): розгортає селенографічну сітку широти/довготи на часовому горизонті та подає DOP / покриття / доступність (≥4 супутники І PDOP < поріг), а також узагальнену огинаючу місячного рівня захисту ARAIM (HPL/VPL) над об'ємом. Геометрія DOP ПОВТОРНО ВИКОРИСТОВУЄ ядро, VALIDATED за gnss_lib_py (crate::orbit::dop); рівень захисту ПОВТОРНО ВИКОРИСТОВУЄ механізм місячного ARAIM LunaNet LNIS (crate::lunar, σ_URE≈30 m) і зводиться до наявного рівня захисту південного полюса як окремого випадку. MODELLED композиція: набір ретрансляторів на колових/еліптичних кеплерівських орбітах (не реальні диференційно скориговані ефемериди LCNS/NRHO), Місяць із середнім обертанням (без лібрації / прецесійного полюса). Детерміновано (суто геометрія). Жодних TRL, спадковості чи схвалення агенцій.

engine-kind-lunar-differential-pnt-description = Модельована ДИФЕРЕНЦІЙНА PNT на Місяці (аналог місячних DGNSS/SBAS): опорна станція класу NovaMoon у ВІДОМОМУ селенографічному місці обчислює диференційні поправки на супутник за ILLUSTRATIVE орбітальним угрупованням класу Moonlight/LCNS із публічних джерел (NovaMoon згадано лише як КЛАС системи, не пов'язаний з ESA), а користувач, зміщений на baseline_km, застосовує їх, так що СПІЛЬНІ похибки орбіти + годинника скасовуються. Складова годинника скасовується ТОЧНО (алгебраїчна тотожність); складова орбіти залишає лише проєкцію різниці напрямків візування, яка → 0 зі зменшенням бази → 0 (межа просторової декореляції) і зростає приблизно лінійно з базою. Подає 3-D похибку положення користувача З поправками і БЕЗ них, коефіцієнт зменшення, криву похибки проти бази та рівень захисту користувача, що ПОВТОРНО ВИКОРИСТОВУЄ механізм SBAS DO-229E (crate::sbas) з диференційним залишком σ. MODELLED — точна тотожність скасування + модель декореляції першого порядку; не перевірено за реальними даними; жодних TRL, спадковості чи схвалення агенцій. Детерміновано, якщо задано зерно.

engine-kind-lunar-station-coverage-description = Модельоване покриття місячної опорної станції: розгортка Монте-Карло місячної диференційної моделі PNT над південно-полярною сіткою користувачів і добою епох. Диференційна опорна станція у відомому південно-полярному місці коригує заявлене угруповання (ілюстративне кеплерівське або табличні ефемериди) із заявленою похибкою сигналу в просторі, похибкою зйомки, затримкою поправок і квантуванням каналу; для кожної точки та по регіону подає процентильну скориговану та нескориговану похибку положення (3-D, горизонтальну, вертикальну), доступність, покриття щодо заявленого порога, рівні захисту DO-229E, радіус покриття за азимутом і бюджет каналу поправок на станції та в найгіршій точці. Не є твердженням про характеристики будь-якої реальної системи; не пов'язано з жодною агенцією і не схвалено нею. MODELLED.

engine-kind-lunar-interop-export-description = Модельований експорт для інтероперабельності на Місяці: видає місячну систему відліку, місячну шкалу часу та місячні ефемериди в узгоджених із LunaNet/IOAG обмінних формах на основі CCSDS із перевіркою відповідності полів та циклу туди й назад. ПОВТОРНО ВИКОРИСТОВУЄ емітер+парсер CCSDS OEM 2.0 крейта (crate::oem), перемарковані для місячного контексту — OEM REF_FRAME несе місячну систему координат тіла IAU 2015 WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM — місячну шкалу часу (LTC / TCL / UTC), CENTER_NAME = MOON — над зразковими ілюстративними ефемеридами класу LCNS (положення з crate::lunar_service, швидкість скінченною різницею). Також видає узгоджений із LunaNet/IOAG дескриптор місячного часу (ідентифікатор шкали, вікова швидкість µs/day з crate::lunar_time, опублікована смуга, опорна поверхня), що проходить цикл туди й назад через serde_json, і обгортає артефакти в наявну оболонку KIF (crate::interchange) з чесною міткою MODELLED. Подає видані артефакти, кількість рядків OEM, результат перевірки відповідності полів + список наявних/відсутніх полів, успіх циклу OEM туди й назад, успіх циклу метаданих часу туди й назад і розмір KIF у байтах. MODELLED — оракулом є детермінований цикл туди й назад + відповідність назв полів опублікованим CCSDS OEM + семантиці полів LunaNet/IOAG; це НЕ сертифікований тест відповідності щодо інтероперабельності; ілюстративні ефемериди з публічних джерел, не пов'язані з ESA; жодних TRL, спадковості чи схвалення агенцій.

engine-kind-timetransfer-description = Оптичне проти RF двостороннє передавання часу/частоти.

engine-kind-quantum-anomaly-detect-description = MODELLED виявлення відмов/аномалій для квантових систем PNT: позначений каталог відмов (стрибок частоти/дрейф/втрата захоплення годинника; крок зміщення/пропуск датчика), ROC AUC статистики виявлення (з бутстреп-довірчим інтервалом із зовнішньо перевірених eval_stats) і мінімально виявна відмова за фіксованої частоти хибних тривог, причому монітор з квантовим годинником (нижчий шум) виявляє менші відмови — як чесний TradeEvidence + репрезентативність. Гауссова модель статистики виявлення (AUC = Phi(mu/(sigma*sqrt2))); моделює клас, ілюстративні параметри з публічних джерел, жодних TRL/польотів/сертифікації.

engine-kind-quantum-gnss-free-nav-description = MODELLED квантова навігація без GNSS: під час відмови GNSS — інерціальний бюджет квантового (інтерферометр на холодних атомах) проти класичного інерціальної навігаційної системи навігаційного класу: зростання похибки положення на вибігу, holdover до порога положення та компроміс квантового проти класичного як чесний TradeEvidence з репрезентативністю. Чесна примітка про спостережуваність: без зовнішнього визначення зміщення акселерометра неспостережуване, тож похибка зростає; квантовий датчик уповільнює, але не усуває цей розрив. Ілюстративні параметри пристрою з публічних джерел; моделює клас, жодних TRL/польотів/сертифікації.

engine-kind-quantum-time-transfer-description = MODELLED ланцюг довіреної квантової синхронізації: наскрізний бюджет передавання часу квантового (годинник на оптичній ґратці + канал заплутаності/одиночних фотонів) проти класичного (CSAC + RF двостороннє), повторно використаний рівень захисту синхронізації + показник якості безпеки від атаки затримкою/відтворенням (1-P_md), імовірність виявлення аномалії годинника + затримка CUSUM, а також компроміс квантового проти класичного як чесний TradeEvidence із записом репрезентативності та розривів до польоту. Ілюстративні параметри пристрою/каналу з публічних джерел; моделює клас, жодних TRL/польотів/сертифікації не заявлено.

engine-kind-hybrid-description = Завершальний гібрид PNT: годинник + IMU + допомога передаванням часу.

engine-kind-fusion-description = Спільне комплексування датчиків PNT фільтром Калмана за тими самими гібридними входами.

engine-kind-hybrid-ukf-description = 17-станний гібридний квантово-класичний щільно зв'язаний UKF GNSS/INS (MODELLED): 15 станів похибок INS + поправка зміщення акселерометра, виведена з CAI + 2-станний (фаза + частота) годинник із рушія годинника q-параметрів, керований обмеженою моделлю похибок CAI. Показником якості є самоузгодженість фільтра (NEES + білизна інновацій проти меж χ²) — твердження про самоузгодженість, а НЕ гарантія точності в реальному світі. Лише симуляція; жодних TRL>3, жодної польотної спадковості, жодної зовнішньої перевірки.

engine-kind-gnss-ins-description = Слабко та щільно зв'язаний EKF станів похибок GNSS/INS.

engine-kind-gnss-sim-description = Симуляція псевдодальностей у області вимірювань (іоносфера Klobuchar, тропосфера Saastamoinen/Niell) + RAIM.

engine-kind-jamming-description = Глушіння за бюджетом каналу: J/S → ефективне C/N₀ → втрата захоплення.

engine-kind-spoof-description = Стохастичний детектор спуфінгу часу (Неймана–Пірсона / χ²₁) з P_fa/P_md за методом Монте-Карло.

engine-kind-spoof-detect-description = Комбінований детектор спуфінгу за RF/вимірюваннями (багатосупутникова узгодженість RAIM + AGC + SQM, зведені) проти параметризованої атаки (перевага за потужністю, вирівнювання фази несівної, зсув часу/положення; у стилі TEXBAT).

engine-kind-sweep-description = 1-D розгортка дослідження компромісів за параметром пакета годинника.

engine-kind-sweep-nd-description = Узагальнена N-вимірна розгортка за будь-яким пакетом через ключі TOML із крапками / шляхи метрик JSON.

engine-kind-gravity-map-description = Навігація зіставленням гравітаційної карти без GPS: гравіметр на холодних атомах відновлює сталий дрейф INS за послідовністю гравітаційних аномалій, крізь яку він летить.

engine-kind-terrain-nav-description = Навігація за рельєфом без GPS (TERCOM/SITAN): радіо- або баровисотомір зіставляє профіль висоти землі з DEM у стилі SRTM, щоб відновити дрейф INS.

engine-kind-terrain-slam-description = Послідовна (рекурсивна) навігація за рельєфом без GPS: фільтр часток проганяє модель вимірювань зіставлення рельєфу епоха за епохою (SITAN як поточний фільтр), тож змінний у часі дрейф INS відстежується вздовж треку, тоді як пакетна terrain-nav відновлює лише єдиний сталий зсув.

engine-kind-combined-altpnt-description = Комбінований навігатор без GPS за гравітаційним + магнітним + рельєфним полями: три скалярні канали поля зведені на кожну шляхову точку для чіткішого (з меншою CRLB) визначення дрейфу, ніж за будь-яким одним полем.

engine-kind-pvt-description = Одноточкове позиціонування за реальними спостереженнями: розв'язання положення приймача за файлом спостережень RINEX 3 і файлом широкомовної навігації (кодові псевдодальності, широкомовні ефемериди, іоносфера Klobuchar, тропосфера Saastamoinen/Niell) з необов'язковою перевіркою за зйомочною координатою.

engine-kind-mars-pnt-description = PNT для далекого космосу на Марсі: симульоване угруповання ретрансляторів MARCONI (ареостаціонарні + похилі ретранслятори, що транслюють односпрямовано + ретранслюють двоспрямовано до станції далекого космосу) навігує опорного користувача (transfer | lmo | surface) через спільний оцінювач односпрямованої/двоспрямованої радіометрії. Подає геометрію/видимість на епоху, досягнуте RMS проти істини та формальну коваріацію (1σ / 3σ положення) — чесний симульований показник якості, а НЕ сертифікований рівень захисту.

engine-kind-impairment-eval-description = Випробувальний стенд оцінювання виявлення RF-погіршень за допомогою ШІ/МН (13494): генерує позначений, обґрунтований параметрами СИНТЕТИЧНИЙ корпус (nominal/jamming/spoof-time/spoof-position/multipath), оцінює детектор (energy|agc|sqm|parity|fused) детектороагностичною обв'язкою та подає AUC/ROC/матрицю помилок + Pd за класами при цільовій Pfa, а також розрив оптимізму між розподілом навчання та поза ним. Лише MODELLED робочі характеристики — ніколи польові/IQ, жодного вердикту «добре/погано».

engine-kind-quantum-trade-description = Компроміс квантової проти класичної PNT (13503): користь timing-holdover + inertial-holdover від кандидатного годинника (виміряна крива ADEV — опора обґрунтованості — або клас квантового годинника) проти класу класичної бази, із застереженням про припущення щодо порога на великих τ, що супроводжує артефакт, плюс огинаюча стійкості без GNSS залежно від часу. MODELLED; кількісно оцінює (ніколи не перевіряє) партнерський пристрій. Кандидатний годинник — це виміряна крива (`candidate_adev_taus` + `candidate_adev_values`, однакової довжини, щонайменше 2 точки; вона має перевагу, коли задано обидві форми) або `candidate_clock_class`.

engine-kind-space-weather-description = Модель космічної погоди: індекси сонячної (F10.7/F10.7a) та геомагнітної (Kp, з означальною таблицею Kp↔ap) активності, температура екзосфери за Jacchia-1971, яку вони задають (перевірена за опублікованими мінімумом/середнім/максимумом Сонця), і густина нейтральної термосфери за Jacchia-1971 при добовій середній температурі екзосфери проти статичного профілю без активності на наборі висот — залежність густини від сонячного циклу, яку статична атмосфера опускає. MODELLED: густина узгоджується з густинами, виведеними з акселерометрів (TOLEOS CHAMP і GRACE), у межах множника 2 у максимумі Сонця, але приблизно в { $lit_1_7 }x завелика в мінімумі Сонця 2008 року.

engine-kind-oem-interop-description = Міст інтероперабельності CCSDS OEM: імпорт Orbit Ephemeris Message, створеного зовнішнім інструментом динаміки польоту (GMAT/Orekit/STK усі видають OEM), і подання його сегментів/об'єктів/систем координат/проміжку епох плюс перевірка узгодженості швидкості; без входу він проганяє згенеровану опорну орбіту туди й назад і подає точність імпорт↔експорт. MODELLED структурна/фізична перевірка прийому, НЕ перевірка точності орбіти джерела.

engine-kind-launch-window-description = Двотільна геометрія запуску й виведення: азимут(и) запуску (sin Az = cos i / cos lat), мінімальний досяжний нахил, колова швидкість, східний бонус обертання Землі, Δv зміни площини з «собачою ніжкою», коли цільовий нахил менший за широту майданчика, і кількість добових можливостей запуску. MODELLED геометрія зі сферичною Землею (без поправки швидкісного трикутника обертової Землі, без моделі втрат на виведення/опір).

engine-kind-reentry-description = Коридор балістичного входу в атмосферу за Алленом–Еггерсом: пікове гальмування (незалежне від балістичного коефіцієнта, V_e^2 sin|γ|/(2eH)), швидкість і висота на піку g та швидкість піку нагріву — для швидкості входу/кута траєкторії/балістичного коефіцієнта крізь експоненціальну атмосферу, а також планарне інтегрування матеріальної точки того самого балістичного входу з гравітацією, кривиною Землі та Стандартною атмосферою США 1976 (пікове гальмування, швидкість, висота й час на піку). MODELLED балістичний (без підйомної сили) вхід; вихід нагріву — це ШВИДКІСТЬ піку нагріву, а не тепловий потік (без аеротермічної моделі/TPS).

engine-kind-eo-coverage-description = Геометрія слідів і покриття корисного навантаження спостереження Землі (космічний трикутник SMAD): кутовий радіус Землі, ширина смуги огляду, надирна відстань вибірки на землі, максимальний доступ поза надиром, коловий період, вузловий період J2 та відстань між екваторіальними наземними треками з ознакою безперервного покриття — для висоти орбіти, нахилу (типово сонячно-синхронного) і FOV/IFOV датчика. MODELLED геометрія зі сферичною Землею (без радіометрії/MTF/атмосфери/джитера/відблисків); відстань між вузлами R_e·(ω − Ω̇)·T_nodal із віковими швидкостями J2 першого порядку.

engine-kind-space-packet-description = Фреймінг CCSDS 133.0-B Space Packet Protocol: кодування синтетичного потоку пакетів TM/TC (6-октетний первинний заголовок + поле даних) і подання декодування заголовка кожного пакета, загальної кількості октетів та точного циклу кодування↔декодування туди й назад. Детермінований точний бітовий фреймінг — рівень інтероперабельності формату пакетів агенцій; НЕ сертифікація відповідності (жодної логіки вторинного заголовка/CRC/сегментації, окрім прапорців).

engine-kind-attitude-budget-description = 3-DOF бюджет похибок орієнтації та наведення: найгірший збурювальний момент гравітаційного градієнта ((3/2)(μ/R³)ΔI) і бюджет похибки наведення як корінь із суми квадратів за іменованими внесками 1σ (шум датчика, джитер реакційного колеса, тепловий, юстування) із домінувальним членом — для висоти орбіти + розкиду інерції тіла. MODELLED скалярний бюджет AOCS — доапаратне доповнення до Basilisk/42, а не симуляція контуру керування/6-DoF/гнучких мод.

engine-kind-passes-description = Прогноз проходів над наземною станцією: проходи видимості в часовій області (AOS/TCA/LOS, максимальна видима висота над горизонтом, тривалість) колової орбіти, як середні елементи SGP4 на початку вікна, над станцією вище за маску висоти протягом вікна, із загальним часом доступу. Розповсюдження SGP4/SDP4 у земній системі IAU 2006/2000A (необов'язково UT1 - UTC і полярний рух), тропосферна рефракція ITU-R P.834-9 і світловий час низхідної лінії (обидва типово ввімкнені), перетини розв'язано до 1e-7 s, а кульмінацію — пошуком золотого перетину. Геометрію проходу VALIDATED за Orekit 13.1.8 на станціях на рівні моря; орбіта й станція сценарію є ілюстративними входами.

engine-kind-link-budget-description = Односпрямований бюджет каналу за рівнянням каналу CCSDS 401 / DSN 810-005: втрати у вільному просторі, C/N₀, Eb/N₀, запас і замикання для EIRP передавача, G/T приймача, дальності, швидкості даних і діапазону (s|x|ka) проти потрібного Eb/N₀. Детермінований інженерний розрахунок за наданими входами (не відкалібрований паспорт терміналу).

engine-kind-lunar-time-budget-description = MODELLED наскрізний бюджет похибки часу Координованого місячного часу (LTC): сім складових похибки LTC, зібраних як криві похибки часу x_i(τ) на всій сітці часів усереднення, підсумованих коренем у x_Σ(τ), і ПЕРЕТИН годинника з системою відліку τ, за якого зростальна складова годинника обганяє сталу складову реалізації системи відліку в реальному часі (нижче нього бюджет обмежений системою відліку, вище — годинником) — чесна відповідь на артефакт одного τ. Нахили за τ замкнені й аналітично перевірювані (годинник τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }, пороги τ^0, вимірювання τ^{ "{" }-1/2{ "}" }), а рядки годинника відтворюють опубліковані одноденні специфікації годинників (crate::clock_specs); ВЕЛИЧИНИ порогів RF/оптичного каналу, реалізації системи відліку, релятивістського залишку й ефемерид — це Modelled розподіли бюджету (документовані типові значення, перевизначувані викликачем), а не вимірювання. Внеском є відтворюваний перетин τ, а не сертифіковане число для кожної складової; не сертифіковано для оперативного ведення часу.

engine-kind-hybrid-optical-rf-description = MODELLED гетерогенний оптичний + RF спільний показник якості PNT (P5): складає бюджет двостороннього оптичного каналу 1550 nm (фотонно-обмежена CRLB двосторонньої дальнометрії σ_τ/√N і дифракційний слід λ/D·дальність), міжмодальний рівень захисту RAIM з поділом розв'язків (положення І час), що зводить слабко зв'язані RF і щільні оптичні розв'язки з різнорідними коваріаціями, доступність оптичного ясного неба для N станцій (незалежне об'єднання 1−Π(1−a_i) і просторово корельований варіант), передачу стану/коваріації оптика↔RF з ДОВЕДЕНИМ бітово безперервним (без стрибка) середнім і шлюзом узгодженості NEES χ², а також спільну оцінку P(доступно І прецизійний клас І забезпечена цілісність) з урахуванням кореляції. VALIDATED замкнена форма: CRLB дальнометрії, дифракційний слід, квантиль рівня захисту χ², комбінаторика об'єднання, безперервність середнього передачі + шлюз NEES і спільний незалежний добуток. MODELLED: оптичні розподіли втрат, величини σ RF/оптики, входи клімату хмарності, кореляції та бюджет P_HMI. Не є сертифікованим продуктом доступності/цілісності.

engine-kind-cislunar-observability-description = MODELLED спостережуваність планарного цисмісячного угруповання (P6): відстежує угруповання з чотирьох апаратів на диференційно скоригованих планарних DRO з міжсупутниковою дальнометрією та подає, яку частину чотиристанового вектора [x,y,ẋ,ẏ] апарата робить спостережуваною дуга. Видає (1) таблицю ранг-проти-довжини-дуги для одного каналу лише з дальністю — миттєво ранг 1, що зростає до повних чотирьох станів із подовженням дуги (P6, таблиця 1); (2) власний спектр граміана спостережуваності + число обумовленості на дузі; (3) порівняння миттєвого рангу лише за дальністю й за дальністю+швидкістю зміни дальності (важіль Доплера) плюс подання GDOP, сингулярного для лише дальності й визначеного за дальністю+швидкістю; та (4) незалежну перехресну перевірку SRIF, чия апостеріорна коваріація стає скінченною / добре обумовленою саме на дузі, де ранг спостережуваності сягає чотирьох. VALIDATED ядро: ранг спостережуваності — це поріг сингулярних значень, що виявляє ранг, перехресно перевірений за власним рангом граміана; власний спектр підкоряється спектральним інваріантам (trace=Σλ, det=Πλ, Frobenius²=Σλ²); варіаційна STM є перевіреною скінченними різницями STM для CR3BP; рядки якобіана дальності/швидкості зміни дальності є аналітичними частинними похідними, перевіреними скінченними різницями (перехресно перевіреними за 3-D спостережуваною швидкості зміни дальності крейта); чотири початкові умови — диференційно скориговані планарні DRO, що замикаються до щільного залишку періодичності й ретроградні; перехід рангу перехресно перевірено за квадратнокореневим інформаційним фільтром крейта (апостеріорна коваріація скінченна саме за повного рангу, cond(P)=cond(OᵀO)); знімок з дефіцитом рангу позначається як GDOP-невизначений (fim condition=inf), ніколи як фіктивне скінченне значення — той самий захист від сингулярної геометрії, що застосовує pvt::solve_spp. MODELLED: проєкт угруповання (амплітуди й фази перилюнія DRO) і конкретна послідовність рангів, яку він дає. Не є сертифікованим продуктом навігаційних характеристик.

engine-kind-conflict-resilience-description = MODELLED стійкість багаторівневої PNT до конфлікту (P7): користувач у конфліктному середовищі має кілька рівнів PNT (відкрита служба GNSS, широкосмугова GNSS, автентифіковане орбітальне угруповання, ретранслятор доповнення), кожен із базовою доступністю, точністю 1σ і вразливістю до відмови за вектором щодо спільної загрози глушіння/спуфінгу. Розгорнений за інтенсивністю Монте-Карло З ЗЕРНОМ відмовляє кожному рівню з імовірністю clamp(vulnerability·intensity·vector_weight,0,1), зводить тих, що вижили, замкненим правилом оберненої дисперсії σ_fused=(Σ 1/σ_i²)^(−1/2) і подає імовірність повної втрати (усі рівні відмовлено), медіанну зведену похибку та статистику придатності/відмов за рівнями проти інтенсивності. Головне співвідношення стійкості (імовірність повної втрати одного рівня проти багаторівневого) сягає ~7x за припущення НЕЗАЛЕЖНОСТІ; однофакторна гауссова копула-розгортка корельованої відмови потім показує, що це ~7x сходить до 1 зі зростанням кореляції відмов (кореляція нівелює багаторівневість). Блок чутливості до апріорних значень розгортає головний показник за ДЖЕРЕЛЬНИМИ апріорними вразливостями через торнадо mcda + перерозподіл зусиль загрози за Діріхле + процентильні довірчі інтервали. VALIDATED ядро: загальна втрата за Монте-Карло збігається із замкненим незалежним добутком Π_i p_deny_i (у межах стандартної похибки MC за фіксованого зерна й великого N); зведення оберненою дисперсією є замкненою тотожністю; за ρ=0 копула зводиться до незалежної моделі, а будь-яке ρ зберігає маргінальну частоту відмов кожного рівня. MODELLED: величини вразливості/доступності/точності кожного рівня є джерельними, але Modelled входами (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — див. conflict_threat_params), а конкретна величина ~7x і форма кривої співвідношення проти кореляції випливають із цієї параметризації. Розбивка виживання за векторами у §4.2 далі розкладає спільну RF-загрозу на чотири іменовані вектори (jamming/spoofing/kinetic/cyber) і подає для кожного вектора криву плавної деградації придатної PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: Монте-Карло з зерном за рівнями збігається з цією замкненою формою; глушіння є найгострішим вектором для корельованої RF-бази, а нечутливий до RF інерціальний рівень є вирішальним уцілілим. Не є сертифікованим продуктом навігаційної доступності.

engine-kind-lunar-attack-surface-description = Поверхня атаки на безпеку сигналу місячної поверхневої навігації (P1): збирає відкриті аналізи безпеки сигналу в один запуск, досяжний із бінарника. Подає (1) прийняту потужність AFS і її ПЕРЕВИЩЕННЯ над земним опорним GPS, а також смугу чутливості 12-18 dB як справжню багатоосьову розгортку за входами каналу (опорний рівень x EIRP x похила дальність) зі зведенням лінійних множників 25x округленого / 28x неокругленого. ПЕРЕГЛЯНУТО (правило R4): тут повідомлялося про ДЕФІЦИТ потужності { $lit_15_6 } dB і множник 32x/36x, доки опорне значення GPS не виправили з -125 / -{ $lit_128_5 } (це значення в dBm) на -155 / -{ $lit_158_5 } dBW — значення ICD-GPS-200, які модуль глушіння завжди мав. Знак змінюється на протилежний: модельований місячний сигнал AFS на { $lit_14_4 } dB СИЛЬНІШИЙ за земний GPS L1 C/A, а не слабший. Сама прийнята потужність не змінилася ні на біт, а лінійний множник — це старий, поділений рівно на 1000, що є якраз зсувом 30 dB між dBm і dBW; (2) потрібну потужність передавача зловмисника для спуфінгу (J/S = 3 dB) і для відмови (J/S = 30 dB) на кожній відстані, обернену до каналу J/S; (3) орбітальний слід захоплення за реальною діаграмою антени з рівномірною апертурою (Ері [2 J1(x)/x]^2), обмежений висотою субпівсферичний сегмент, чий лімб НЕ захоплюється; (4) обчислений результат затягування захоплення спуфінгу контурами стеження (чи справді спуфер з відповідним кодом за заданої переваги потужності й зсуву коду тягне DLL/PLL), а не заявлений поріг 3 dB; (5) геометричну дальність горизонту безатмосферного тіла для піднятого поверхневого передавача; і (6) бюджет автентифікації OSNMA/TESLA (накладні 20 bit/s = ~40 % навігаційного повідомлення AFS 50 bit/s, затримка розкриття ключа, підробка 2^-40). Порожнє тіло відтворює базу P1; кожен вхід має типове значення й може бути перевизначений. VALIDATED підрезультати несуть оракул свого вихідного модуля (замкнена радіометрія в dB; цикл обернений J/S туди й назад; діаграма Ері проти Бесселя A&S і геометрії сферичного сегмента; затягування DLL/PLL проти Kaplan & Hegarty; тотожність сферичного дотичного горизонту проти eo_payload; розмірність полів SIS-ICD OSNMA). MODELLED: репрезентативні величини геометрії/потужності та конкретні значення комірок карти захоплення. Не є сертифікованим продуктом безпеки.

engine-kind-realtime-frame-eop-description = Бюджет прогнозу місячної системи відліку / орієнтації Землі в реальному часі: P4, таблиця 1 (перевірка узгодженості похибки системи відліку — постобробка ~{ $lit_0_27 } m ↔ ~{ $lit_0_010 } ms і реальний час ~15 m ↔ ~{ $lit_0_5 } ms, кожне положення системи відліку виражене як еквівалентна похибка UT1 через важіль L19 Δr = D_EM·ω⊕·ΔUT1) і таблиця 2 (виміряна похибка прогнозу UT1 проти горизонту — крива L18, прочитана безпосередньо з реального ряду IERS finals2000A: підлога Bulletin A − Bulletin B final і похибка багатодобового предиктора стійкості, кожна відображена на положення в системі Місяця через L19), плюс бюджет похибки системи відліку в реальному часі L21 як корінь із суми квадратів (EOP + ефемериди + підлога реалізації). VALIDATED замкнена форма (важіль L19, ω⊕ перехресно перевірено за кутом обертання Землі CIO) і VALIDATED реальні дані (крива L18 за реальними рядками finals2000A); MODELLED — величини коваріації OD місячного ретранслятора й підлога реалізації системи відліку (репрезентативні розподіли) та предиктор стійкості (не оперативний алгоритм Bulletin A від IERS). Не є сертифікованим продуктом системи відліку реального часу.

engine-kind-aperture-duty-cycle-description = Робочий цикл апертури: розподіл часу між навігацією та зв'язком, який план контактів передбачає для пулу керованих апертур. Бере план контактів (список вікон `[[contacts]]` aos_s/los_s, кожне з яких запитує навігацію або зв'язок — той самий словник aos_s/los_s, що його видає предиктор `passes`), кількість апертур і ПОЛІТИКУ АРБІТРАЖУ (за замовчуванням пріоритет навігації, або пріоритет зв'язку, або невитісняюче «першим прийшов — першим обслужено») та подає навігаційний робочий цикл, робочий цикл зв'язку, цикл простою та простій на сеанс — час контакту, який сеанс запитав і який жодна апертура не обслужила. Точне зведення інтервалів за межами вікон, тож вікна, що торкаються, ніколи не конкурують, а жодна апертуро-секунда не рахується двічі; апертуро-секунди навігації, зв'язку й простою накопичуються незалежно та замикаються на apertures*horizon_s. Звіт наводить розв'язану політику, її повне означення та означення робочого циклу й простою, бо наведений без політики арбітражу показник робочого циклу не є відтворюваним. MODELLED арифметика планування: жодного часу на перенаведення / перенастроювання / передачу не враховано, коли апертура змінює службу чи сеанс, у рішенні не беруть участі ні обсяг даних, ні стан буфера, ні енергобюджет, ні замикання каналу, а вікна контактів є входами — їхня геометрія така, яка їх породила. Не є продуктом планування наземного сегмента.

engine-kind-lunar-jamming-description = Власне місячне RF-глушіння: відношення глушник-сигнал на кожен супутник, ефективне C/N₀ і втрата захоплення для селенографічного користувача на поверхні під місячним поверхневим (або піднятим) глушником, над ілюстративним орбітальним угрупованням на місячній орбіті класу Moonlight/LCNS із публічних джерел. Складає наявну відкриту фізику глушіння (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) з наявною геометрією місячного неба (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); жодна геометрія чи радіометрія не виводиться наново. На відміну від земного виду `jamming`, сигнальна ланка НЕ є фіксованою прийнятою потужністю: ізотропна прийнята потужність кожного супутника — це його власний бюджет каналу EIRP − FSPL(похила дальність), тож J/S змінюється від супутника до супутника з місячною дальністю й висотою над горизонтом. Подає ОДИН РЯДОК НА КОЖЕН ВИДИМИЙ КАНАЛ (епоха, супутник) — азимут, висота над горизонтом, похила дальність, обидві прийняті потужності, різницею яких є J/S, J/S, номінальне та ефективне C/N₀ і стан захоплення — плюс сукупні показники якості поруч із цією таблицею (ніколи замість неї) і ту саму таблицю як артефакт CSV. Кожне видане числове поле несе одиницю й клас походження. VALIDATED підрезультати несуть оракул свого вихідного модуля (рівняння антиглушіння та канал J/S за Kaplan & Hegarty §9.4, зовнішньо зіставлені в тестах tests/gnss_denied_jamming_resilience_reference.rs; місячна геометрія lunar_service). Саму композицію перехресно перевірено за незалежним шляхом із двох бюджетів каналу (linkbudget::received_signal_power_dbw, інший вираз втрат у вільному просторі) до 1e-9 dB. MODELLED: ілюстративне угруповання, репрезентативні EIRP / потужність глушника / підсилення антен / шумова температура та відсутність затінення рельєфом, багатопроменевості, динаміки AGC і адаптивного обнулення. Не є сертифікованим продуктом відмови в обслуговуванні. За налаштованого глушника звіт також несе КОНТУР ВІДМОВИ З ПОЛОСОЮ НЕВИЗНАЧЕНОСТІ, а не контур, прочитаний з одного скаляра: повний виміряний розподіл C/N₀ бажаного сигналу за таблицею на супутник (n, min, p05, p25, медіана, p75, p95, max, середнє, вибіркове стандартне відхилення та власна асиметрія вибірки) і контур, обчислений на кожній із цих порядкових статистик за ОБОМА критеріями відмови, які розпізнає рушій — чинним критерієм відношення потужностей (J/S = 30 dB, як в attack-surface і tracking-loop) і критерієм втрати захоплення (ефективне C/N₀ спадає до tracking_threshold_dbhz, критерій, який використовує власний стовпець стану цього звіту) — на обох осях площини відмови (потрібна EIRP глушника на відстані сценарію, відстань відмови за EIRP сценарію). Краї смуги Є contour(p05) і contour(p95), те саме замкнене відображення, застосоване до власних квантилів вибірки: не сигма, підігнана до вибірки, і не медіана ± k·stdev, причому stdev видано для наступності й нічим не використано. Квантиль, що вже на рівні tracking threshold або нижче, не має скінченного J/S для відмови, а його стовпці втрати захоплення є null із підрахованою причиною, ніколи не обрізаний радіус.

engine-kind-ins-trn-coast-description = Модель похибки вибігу INS/TRN: похибка положення проти тривалості вибігу, побудована за коефіцієнтами IMU, а не розгорнута за припущеною швидкістю дрейфу. П'ять внесків зростання — зміщення акселерометра, нахил від зміщення гіроскопа через гравітацію, випадкове блукання швидкості, випадкове блукання кута та масштабний коефіцієнт проти пройденої відстані — кожен розповсюджений крізь дев'ятистанову модель інерціальних похибок у місцевому горизонті зі зворотним зв'язком Шулера на заявленій широті та висоті (закони провідного порядку для короткого вибігу t², t³, t^1.5, t^2.5 і t¹/t² подано поруч) і зведений за ЗАЯВЛЕНИМ правилом (корінь із суми квадратів за замовчуванням, або лінійна сума, або детермінована сума зі стохастичним rss; усі три обчислюються на кожному запуску, тож вибір видно, а не сховано). Тривалості вибігу, що досягають заданих викликачем порогів положення (типово 10 m і 50 m), знаходяться наявним бісекційним методом рушія, кожна з розбивкою за внесками, що називає домінантне джерело, а перетин кожного окремого внеску додатково обертається алгебраїчно, щоб обидва збігалися. Режим навігації за рельєфом обмежує вибіг періодичними визначеннями положення та подає найбільший інтервал визначень, що тримає кожен поріг; визначення лише положення залишає живими похибку швидкості та нахил крізь визначення, тож воно не завжди обмежує вибіг за будь-якої частоти визначень, і звіт каже про це, а не повертає нуль. MODELLED: коефіцієнти класу IMU є репрезентативними діапазонними цифрами, а не паспортом, а залишок визначення за рельєфом є входом. Недосягнутий поріг подається як null зі статусом, ніколи як нуль. Не є сертифікованим продуктом характеристик інерціальної навігації.

engine-kind-lunar-vlbi-fim-description = Коваріація координат станцій місячного VLBI: частинні похідні затримки спостережуваної lunar-vlbi, накопичені за явним РОЗКЛАДОМ (бази x епохи) в інформаційну матрицю Фішера, обернені та подані як коваріація координат станцій і сигма станції за координатами — обчислений вихід рушія, а не скалярна точність затримки, пропущена крізь припущений ізотропний коефіцієнт рівнорозподілу g = 3. Стан несе ЗЕМНІ ФІКСОВАНІ (ITRS) координати станцій, тож якобіан є інерціальною частинною похідною, повернутою матрицею GCRS->ITRS кожної епохи: саме обертання Землі робить ці координати спостережуваними, а звіт ВИМІРЮЄ розмах лінії візування в земній фіксованій системі та схилення маяка, а не припускає їх. Одне спостереження — це одна пара (база, епоха), де ОБИДВІ станції вище за маску висоти, зважена 1/delay_sigma_s^2. Подає ранг, дефект датума, число обумовленості, повний інформаційний спектр, матрицю коваріації, сигми за станціями за осями та 3-D, а також нуль-простір вільної мережі на кожному запуску; за дефіциту рангу головна сигма публікується як NULL зі статусом, ніколи не зчитується з майже сингулярного оберненого. Значення рівнорозподілу c*delay_sigma_s*sqrt(g/N) для ТОГО САМОГО розкладу видається поруч з обчисленим значенням зі співвідношенням, разом з ізотропною межею за слідом sqrt(p/trace(M)), яку AM-HM робить жорсткою нижньою межею, — тож співвідношення є анізотропією, яку припущення відкинуло. Замикання затримки tau_ik = tau_ij + tau_jk робить геометрично незалежними лише n-1 з n(n-1)/2 баз; звіт наводить обидві кількості. MODELLED: ефемериди центра Місяця, годинники станцій, тропосфера та параметри орієнтації Землі ЗАФІКСОВАНІ, а спостереження вважаються незалежними, тож коваріація є межею Крамера–Рао для зменшеного набору параметрів, а не прогнозованим результатом сеансу; сигма затримки, координати станцій і розклад є входами. Частинна похідна, яку якобіан геометричної затримки пропускає (різницевий член Шапіро), вимірюється скінченною різницею та видається. Не є геодезичним продуктом.

engine-kind-tracking-loop-description = Втрата захоплення контуром стеження: C/N0 -> захоплення/втрата З ГІСТЕРЕЗИСОМ, час до втрати захоплення та затягування спуфінгу залежно від ШВИДКОСТІ зсуву коду й несівної. Наявні критерії відмови й захоплення рушія — це відношення прийнятих потужностей (глушник відмовляє за J/S = 30 dB, спуфер захоплює за 3 dB); реальна втрата захоплення не є відношенням потужностей, це місце, де джитер контуру плюс динамічне напруження виходять за бюджет його порога стеження. Подає (1) 1-сигма тепловий джитер несівної (Костас) і коду (некогерентний early/late) проти C/N0, зі втратою квадрування, проти заявлених правил 3*sigma_PLL + theta_e <= 45 deg (правило 15 градусів у формі трьох сигм) і 3*sigma_DLL + ramp lag <= d/2 chips; (2) пороги C/N0 зриву й повторного захоплення з названим визначальним контуром, поріг повторного захоплення ВИВЕДЕНО із ширшої смуги, у якій приймач повторно затягується, а не заявлено, тож ширина гістерезису має лежати між 5*log10(ratio) і 10*log10(ratio) dB; (3) заявлений час до втрати захоплення від двопорогового детектора захоплення з підтверджувальними витримками, що проходить рампу C/N0, поданий окремо від фізичного часу фазового зриву (середній час Вітербі між проковзуваннями циклу, у log10 s, бо він охоплює сотні порядків); (4) межі затягування спуфінгу — найбільший зсув коду та доплерівська швидкість несівної, за якими можуть стежити контури жертви, з картою за обома осями, бо спуфер, що зсувається швидше за ці межі, не захоплює контур, а випереджає його; і (5) РАДІУС ВІДМОВИ, що випливає з динаміки контуру, поданий ПОРУЧ з наявним радіусом відношення потужностей, ніколи замість нього, з їхньою знаковою різницею як окремим іменованим полем (denial_radius_delta_km) і означенням поруч. Кожне видане числове поле несе одиницю й клас походження. VALIDATED замкнені форми: вирази джитера несівної й коду, зведення фільтра контуру sqrt(2*B_n*T) та лаг рампи першого порядку перехресно перевірено за власним корелятором sdr рушія, прокрученим вперед на синтетичній IF із зерном — іншим шляхом до тих самих чисел — до { $lit_0_6 } %, { $lit_3_7 } % і { $lit_0_17 } % відповідно, а модифіковану функцію Бесселя I0, що стоїть за часом проковзування циклу, — за стандартними табличними значеннями до 1e-7. Нижню межу застосовності стверджено, а не лише заявлено: нижче ~32 dB-Hz за 1 ms реальний дискримінатор atan насичується проти свого діапазону +-pi/2 і вимірює менший джитер, ніж будь-яка лінійна теорія. MODELLED: смуги контурів, час інтегрування, інтервал корелятора, співвідношення смуги затягування, підтверджувальні витримки, потужність глушника й підсилення антен є репрезентативними діапазонними цифрами, а не паспортом. НЕ змодельовано: джитер генератора (девіації Аллана) і вібрацій, обмеження смуги фронтенда, багатопроменевість, динаміку AGC, втрату на переходах бітів даних, зовнішню допомогу та будь-яку поправку на пів-циклу до формули проковзування циклу Костаса. За динаміки контуру захоплення спуфінгу взагалі не має радіуса — визначальним обмеженням є швидкість зсуву, а не потужність — тож це поле є null з причиною, а не вигаданим числом. Не є сертифікованим продуктом характеристик приймача.

engine-kind-araim-reference-check-description = Опубліковані еталонні вектори ARAIM: горизонтальні та вертикальні рівні захисту ARAIM рушія, прогнані проти ВЛАСНИХ розроблених чисельних прикладів Технічної підгрупи WG-C ARAIM, за допуску (TOL_PL = 5e-2 m), який ці документи самі заявляють. Два вектори зафіксовано як фікстури, кожен з URL отримання, датою отримання, SHA-256 вихідного файла й сторінкою: Reference Airborne Algorithm Description Document v3.1 (2019), додаток D — самоузгоджений і вектор прийняття — та Milestone 3 Report (2016), додаток A, розділ A.IX, твердження, на яке посилаються дослідницькі бібліографії. Кожен опублікований вхід (матриця геометрії 10 супутників 2 орбітальних угруповань, діагоналі дисперсій C_int і C_acc, b_nom, P_sat, P_const і набір констант LPV-200) та кожен опублікований вихід (VPL, HPL, EMT, sigma_v_acc, K_fa_3 і sigma_3, sigma_ss_3 та b_3 двох режимів відмови орбітального угруповання) подано поруч з власним числом рушія та їхньою абсолютною різницею. Рівняння рівня захисту тут НЕ розв'язується заново: список режимів еталона передається наявним raim::araim_protection_level / araim_integrity_risk рушія, тож бісекція та гауссова хвостова алгебра під перевіркою — власні для рушія; для нього збудовано лише геометрію, підрозв'язки, пороги виявлення та опублікований поділ бюджету. ЗОВНІШНЬО ПЕРЕВІРЕНО за вектором 2019: VPL { $lit_18_2926 } m проти { $lit_18_3 } m опублікованих, HPL { $lit_13_4063 } m проти { $lit_13_45 } m, EMT { $lit_7_2997 } m проти { $lit_7_2998 } m, sigma_v_acc { $lit_1_3694 } m проти { $lit_1_3694 } m, і всі шість опублікованих проміжних величин у межах половини одиниці останнього надрукованого десяткового розряду. Вектор 2016 несе два внутрішні дефекти, які звіт заявляє, а не ховає, — помилку знака в рядку 3 матриці G і K_fa_3, обчислений для 57 режимів відмови, тоді як документ заявляє N_fault_max = 1 (12 режимів), — тож його проміжні величини геометрії відтворюються точно, а рівні захисту подаються як виміряні розбіжності й виключені з показника прийняття; допуск ніколи не розширюється, щоб їх поглинути. Кожне видане числове поле несе одиницю й клас походження, а переписане число позначається `published`, щоб його ніколи не сплутали з обчисленим. ОБСЯГ: реалізовано лише N_fault_max = 1 (режими відмови одного супутника й одного орбітального угруповання), а випадок, апріорні значення якого вимагають одночасних підмножин відмов із кількох подій, ВІДХИЛЯЄТЬСЯ (REFUSED), а не мовчки усікається; виявлення відмов, виключення, перевірка узгодженості хі-квадрат і крок перерозподілу подвійного підрахунку алгоритму еталона — поза обсягом. Це відтворює розроблений приклад опублікованого еталонного алгоритму — це не сертифікація, не артефакт льотної придатності й не затвердження.

engine-kind-lunar-frame-campaign-description = Сімпараметричний датум системи відліку Гельмерта (подібності), що керується СИМУЛЬОВАНОЮ КАМПАНІЄЮ СПОСТЕРЕЖЕНЬ, а не введеним перетворенням. Мережа земних станцій спостерігає каталог маяків на поверхні Місяця за явним розкладом; частинні похідні затримки місячного VLBI накопичуються за цим розкладом в інформаційну матрицю Фішера координат маяків точно так, як це робить lunar-vlbi-fim; і ця інформація розповсюджується крізь схему Гельмерта A = [I3 | [p]_x | p] у точках каталогу в коваріацію датума H = A^T M_b A, що діагностується crate::fim::crlb. ЖОДНОГО перетворення не вводиться, і нічого не відновлюється із закладеної відповіді, тож подана точність датума випливає з програми спостережень: удвічі менша сигма затримки точно вдвічі зменшує її, а подовження дуги покращує її, бо лібрація, яку звіт ВИМІРЮЄ (sub_earth_direction_sweep_deg), відокремлює координату маяка вздовж лінії візування від координат у площині неба. Ранг, дефект датума, число обумовленості, повний спектр, неспостережувані напрямки У СІМПАРАМЕТРИЧНОМУ БАЗИСІ, найслабший напрямок навіть за повного рангу та частка кожного параметра в ньому видаються на кожному запуску; параметр, який кампанія не обмежує, публікується як NULL зі статусом, ніколи не зчитується з майже сингулярного оберненого. Кореляцію похибок маяків виміряно, а не припущено: за фіксованих станцій жодне спостереження не торкається двох маяків, тож інформаційна матриця точно блочно-діагональна (offblock_fraction 0), а за оцінюваних станцій блок, маргіналізований за Шуром, зв'язаний, з надрукованою наведеною кореляцією та цілим розповсюдженням, перепрогнаним з її відкиданням, тож ціна припущення про незалежність є числом. Те саме розповсюдження за ізотропної сигми на координату та похибка відновлення, яку подає сценарій lunar-frame-realisation, прогнані тут обидва й надруковані поруч зі значенням кампанії з їхніми співвідношеннями. MODELLED: каталог маяків має джерело, але КАМПАНІЯ симульована — мережа станцій і сигма затримки є ілюстративними входами, окремі спостереження затримки вважаються незалежними, а ефемериди центра Місяця, годинники станцій, тропосфера та параметри орієнтації Землі ЗАФІКСОВАНІ, тож коваріація датума є межею Крамера–Рао для зменшеного набору параметрів. Не є геодезичним продуктом.

engine-kind-lunar-llr-datum-description = Сімпараметричний датум місячної системи відліку Гельмерта, що керується РЕАЛЬНОЮ, АРХІВНОЮ кампанією спостережень, а не симульованою. Там, де lunar-frame-campaign прибрав введене перетворення, але все ще заявляв свою мережу станцій, розклад і сигму на спостереження як ILLUSTRATIVE входи, цей вид бере всі три з вимірювань: епохи — це часи передавання на землі архівних нормальних точок ILRS Consolidated Laser Ranging Data, спостереження — це лазерні дальності, справді випущені на п'ять ретрорефлекторних решіток на Місяці, а вага кожного спостереження — це власна архівна точність цієї нормальної точки bin_rms/sqrt(n_raw), прочитана з файла. Координати станцій походять із розв'язку IERS ITRF2020 SLR (розповсюджені на епоху за їхніми опублікованими швидкостями), а координати рефлекторів — з таблиці 7 JPL DE430 у системі середньої Землі / середнього обертання, яку реалізує модель IAU 2015 WGCCRE. Частинні похідні дальності накопичуються в спільну інформаційну матрицю Фішера координат рефлекторів і розповсюджуються крізь ту саму схему Гельмерта в коваріацію датума, що діагностується crate::fim::crlb. Ранг, дефект, обумовленість, спектр, неспостережувані напрямки в сімпараметричному базисі, найслабший напрямок за повного рангу та частка кожного параметра в ньому видаються на кожному запуску, а необмежений параметр публікується як NULL зі статусом. Міжрешіткову кореляцію MEASURED точно нульовою, а не припущено, бо лазерна дальність торкається однієї решітки. Запис, який каталоги не можуть розмістити, — станція без опублікованого положення ITRF — ПРОПУСКАЄТЬСЯ І ПІДРАХОВУЄТЬСЯ, їй ніколи не дають підставленої координати. ЯКІ ЛАНКИ MEASURED, А ЯКІ MODELLED — ЦЕ ЗВІТ, А НЕ ПРИМІТКА: ефемериди центра Місяця та орієнтація тіла за IAU залишаються модельованими, а їхній сумарний розмір видається як залишок «спостережене мінус обчислене» односпрямованої дальності за кожною використаною точкою; тропосфера, твердотільні припливи, ексцентриситет станції, полярний рух, UT1-UTC, релятивістська затримка та годинники станцій відсутні й перебувають усередині цього залишку. Оскільки похибка ефемерид досягає коваріації лише через напрямок кожної лінії візування, кожен запуск також розв'язує весь датум наново з усіма частинними похідними, нахиленими на sensitivity_tilt_deg (зі змінним знаком), і видає співвідношення, тож нечутливість коваріації до модельованих ефемерид є числом, а не аргументом. Власні цифри симульованої кампанії ПРОГОНЯЮТЬСЯ та друкуються поруч з виміряними, а не переписуються. MODELLED: сімпараметричні цифри є межею Крамера–Рао для зменшеного набору параметрів на реальному розкладі — не розв'язаний датум, не аналіз LLR і не геодезичний продукт. Зафіксований зріз реальних даних постачається з репозиторієм, але не з опублікованим крейтом; вкажіть data_dir на його копію.

engine-kind-lunar-beacon-description = Доповнення місячної орбітальної навігаційної служби поверхневими маяками як запускна таблиця до/після. Південно-полярний користувач бачить розріджений орбітальний набір у вузькій ділянці неба, тож геометрія дальнометрії погано обумовлена; кілька ЗНЯТИХ ПОВЕРХНЕВИХ МАЯКІВ дають рядки ліній візування з малою висотою над горизонтом і широким азимутом, яких бракує набору, що весь над головою, і горизонтальний геометричний чинник погіршення точності падає. Сценарій подає три конфігурації на одну епоху — самі супутники, супутники плюс видимі маяки та більше угруповання як альтернативний шлях до тієї самої геометрії — кожну з кількостями видимих джерел, повним DOP та реалізованою 1-сигма точністю в МЕТРАХ, отриманою множенням на еквівалентну користувачеві похибку дальнометрії на маяк, складену як корінь із суми квадратів доданків синхронізації годинників, багатопроменевості та зйомки. Видимість маяків — це геометричний горизонт безатмосферного Місяця за двома висотами (атмосфери немає, тож межа точна), а складання DOP — те саме ядро, перехресно перевірене за gnss_lib_py у tests/dop_reference.rs. ЧОМУ ЦЕЙ ВИД ІСНУЄ: модуль за ним був у рушії та перевірявся за незалежним шляхом DOP відколи L08/L09, але не був досяжний із запуску — ні виду, ні гілки диспетчеризації, ні вбудованого файла. README рекламував можливість, а матриця верифікації НЕ мала для неї жодного рядка, тож вона одночасно заявлялася в тексті та була незаявлена в реєстрі, залишаючись недосяжною в рушії. Типові значення — геометрія, що вже має зафіксований еталон (користувач на -80 deg з антеною 2 m, три маяки на -80/0, -79/+60 і -79/-60 на 2 km, шестисупутниковий ілюстративний знімок LCNS у t=0, маска 5 deg), тож голий запуск відтворює таблицю, яку оракул уже покриває, а не вигадує свіжі числа. MODELLED: проєкт угруповання, розміщення маяків і кожна величина бюджету похибок є ілюстративними входами, а не польовою зйомкою чи виміряним каналом; лише арифметика DOP, замкнена форма горизонту та співвідношення sigma = DOP x sigma_URE прив'язані ззовні. Не є зобов'язанням щодо характеристик служби.

engine-kind-earth-gnss-lunar-description = Прийом земної GNSS на місячній відстані — слабкосигнальний рівень, який називає стаття про стійкість до конфлікту і для якого в рушія не було моделі. Супутник GNSS спрямовує антену на Землю; приймач біля Місяця перебуває приблизно за п'ятнадцять орбітальних радіусів, тож діють одразу три речі. Земля ЗАКРИВАЄ ВІСЬ ПРОМЕНЯ: з 26,560 km вона має половинний кут { $lit_13_9 } deg, тож будь-який промінь у бік Місяця має залишати передавач щонайменше на цей кут від надира, що прибирає пік променя ще до обчислення будь-якої потужності. Залишається КРАЙ ГОЛОВНОЇ ПЕЛЮСТКИ ТА БІЧНІ ПЕЛЮСТКИ — режим, у якому справді працювало корисне навантаження LuGRE у 2025 році. А втрати у вільному просторі становлять близько 208 dB на L1, приблизно на 25 dB більше, ніж платить земний користувач. Звіт видає один рядок на супутник (кут від осі променя, закриття Землею, дальність, втрати на трасі, підсилення передавача під цим кутом, прийнята потужність, відношення несівна/шум за густиною) і зводить лише канали, що проходять поріг стеження. ВІН ТАКОЖ ПОДАЄ ОБУМОВЛЕНІСТЬ, бо саме вона визначає цей рівень: кожен видимий супутник лежить усередині конуса шириною кілька градусів, якщо дивитися з Місяця, тож лінії візування майже паралельні, геометричний чинник погіршення точності величезний, а визначення за земною GNSS на місячній відстані є спостереженням класу СИНХРОНІЗАЦІЇ набагато більше, ніж класу положення. MODELLED, і причина в діаграмі передавання: підсилення під кутом — це рівномірна колова апертура (Ері), тоді як реальна антена GPS L1 — це дванадцятиелементна спіральна решітка з сформованою головною пелюсткою та неериївськими бічними пелюстками. Виміряні діаграми існують і тут не постачаються, тож порядки й порядки величин змістовні, а dB жодного окремого супутника — ні. Навмисно ВІДСУТНІ, і кожне робить бюджет оптимістичним: жодних іоносферних чи тропосферних втрат на променях, що ковзають по лімбу, жодної поляризації, наведення чи втрат реалізації, і сферична Земля без рефракційного подовження. Положення Місяця є ВХОДОМ (дальність плюс інерціальний напрямок), а не пошуком в ефемеридах, бо досліджується величина каналу та геометрія променя. Підвищення цього рядка до Validated потребує виміряної діаграми передавання та нормальних точок LuGRE; жодного з них у репозиторії немає, і жодного тут не вигадано.

engine-kind-lunar-infrastructure-description = MODELLED дослідження орбіти й поверхні Місяця як навігаційної та геодезичної інфраструктури, п'ять досліджень за одним видом, що вибирається через `study`: od-consistency (бортове визначення орбіти за земною GNSS на NRHO або ELFO проти незалежного наземного радіометричного визначення орбіти, судячи за їхніми власними коваріаціями на Монте-Карло із зерном), carrier-phase (спільна подвійно диференційована фаза несівної поверхня–орбітер і розв'язання цілочисельної неоднозначності за LAMBDA), frame-coestimation (поверхнева станція й орбітери, додані до дальнометрії земних станцій для сімпараметричного датума місячної системи відліку), space-tie (GNSS, VLBI і лазерна дальнометрія на одному апараті, точність прив'язки системи відліку проти похибки локальної прив'язки) і geodesy-sensitivity (інформація Фішера про числа Лява місяця h2, k2, l2 та фізичну лібрацію з лазерної дальнометрії, стеження за орбітерами, поверхневого гравіметра й поверхневого годинника). Обмежена модель трьох тіл із заявленими спрощеннями; чисельні методи перевірено незалежними програмами, і жодна величина не порівнюється з вимірюванням місячної величини.

engine-kind-cislunar-arc-recovery-description = MODELLED тест незалежним оцінювачем порога спостережуваності за довжиною дуги в цисмісячному просторі. Цей поріг — це ЧИТАННЯ РАНГУ матриці спостережуваності, зібраної з АНАЛІТИЧНИХ рядків якобіана дальності та АНАЛІТИЧНОЇ варіаційної матриці переходу стану, а його перехресна перевірка квадратнокореневим інформаційним фільтром згортає ті самі рядки — перевірка узгодженості двох чисельних машин, а не підтвердження. Цей вид дає бракуючого арбітра: пакетний оцінювач за методом найменших квадратів, що справді ВІДНОВЛЮЄ початковий стан головного апарата із симульованих вимірювань, з частинними похідними вимірювань, узятими як ЦЕНТРАЛЬНІ СКІНЧЕННІ РІЗНИЦІ складеної прямої моделі. Він не викликає жодного аналітичного рядка якобіана, жодної варіаційної STM, жодного сингулярного чи власного розкладу, жодного допуску рангу й жодного квадратнокореневого інформаційного фільтра — захист за вихідним текстом у tests/cislunar_arc_recovery_reference.rs робить це забезпечуваним — тоді як динаміка (той самий потік RK4 CR3BP), початкові умови (те саме диференційно скориговане угруповання), скалярна спостережувана та сітка епох навмисно спільні й названі у виданому блоці `independence`, бо два аналізи однієї фізичної задачі мають погоджуватися щодо фізики, щоб бути порівнянними. Два критерії, кожен розгорнутий на п'ять декад власної межі: БЕЗШУМОВЕ ВІДНОВЛЕННЯ (похибка кінцевого стану кожного випробування із зерном щонайбільше recovery_factor разів його апріорного зміщення — аналог рангу, без допуску сингулярних значень) і ОЦІНЮВАНІСТЬ ЗА МОНТЕ-КАРЛО (виміряна RMS-похибка положення за ансамблем шуму із зерном нижча за заявлену межу — аналог оцінюваності, виміряний, а не прогнозований). Підтримує планарний чотиристановий і просторовий шестистановий вектори, родини DRO / L2 halo / L2 NRHO, спостережувані дальності та швидкості зміни дальності й полярну параметризацію з центром у Місяці, у якій перетворення застосовується до СТАНУ, а пряма модель диференціюється там наново. MEASURED на опублікованій планарній сітці DRO: оцінювач відновлює чотиристановий вектор з { $lit_0_782609 } h проти { $lit_2_086957 } h критерію рангу за rel_tol 1e-6 (співвідношення { $lit_0_375 }) — поріг рангу НЕ підтверджено (NOT corroborated) як межу відновлюваності — тоді як виміряна межа оцінюваності потрапляє в ту саму комірку сітки, що й формальна, { $lit_5_739130 } h, а виміряна крива похибки відтворює формальну 1-сигму на 21 довжині дуги до співвідношення геометричних середніх { $lit_0_98 }. MODELLED: проєкт угруповання, сітка епох, єдиний відстежуваний канал, величина зміщення, сигма вимірювання та дві заявлені межі. Не є сертифікованим продуктом навігаційних характеристик.

engine-kind-telecom-timing-description = Телекомунікаційна синхронізація: похибка часу, максимальна похибка часового інтервалу (MTIE) і девіація часу (TDEV) holdover за GNSS, перевірені за масками ITU-T з PASS або FAIL і запасом на маску. Вхід — або СИНТЕТИЧНИЙ HOLDOVER (пресет генератора -- ocxo, rubidium, caesium або csac, кожен з цифрами стабільності, старіння та температури названого публічного паспорта Microchip -- плюс час втрати GNSS, довжина запису та інтервал відліків; вільний годинник несе білий, фліккер і, де цього потребує підгонка паспорта, випадкове блукання частотного шуму, лінійне старіння та синусоїдальний температурний член) або ЗАВАНТАЖЕНИЙ РЯД пар [time_s, time_error_ns], поданих вбудовано (а в нативних збірках ще й файл CSV). Маски: ITU-T G.8272 (07/2025) PRTC-A і PRTC-B (max|TE| 100 / 40 ns, MTIE таблиці 1-2, TDEV таблиці 3-4); G.8272.1 (2024) Amd. 1 (07/2025) ePRTC із захопленням (30 ns, таблиці 1-2) і ePRTC-A holdover (огинаюча похибки часу з таблиці 3, що зростає від 30 ns до 100 ns за період holdover H, заданий тривалістю захопленого стану, MTIE таблиця 4, TDEV таблиця 5); G.8273.2 (2023) Amd. 2 (11/2025) класи T-BC/T-TSC A-C (max|TE|, стала похибка часу, MTIE і TDEV після фільтра нижніх частот) і клас D (max|TE_L| 5 ns, єдина цифра класу D, не залишена для подальшого вивчення); G.8271.1 (2022) Amd. 3 (05/2025) опорна точка C (max|TE_L| 1100 / 600 / 100 ns з MTIE таблиці 7-1 до 7-3). Кожен запис, який Рекомендація позначає для подальшого вивчення, відсутній, а не заповнений, і кожен звіт перелічує, що не реалізовано. Також подає час до перевищення кожного бюджету максимальної похибки часу (типово: 100 ns ePRTC max|TE_HO|, 400 ns розподілу holdover мережі, 1100 ns точки C, { $lit_1_5 } us класу 4), криві MTIE/TDEV як таблицю CSV з кожною межею маски та запис одиниць і походження на кожне числове поле. VALIDATED: оцінювачі MTIE і TDEV за пакетом allantools на зафіксованому ряді holdover. MODELLED: таблиці масок є переписаними, а синтетичний holdover — це модель, збудована з максимумів паспорта, а не вимірювання будь-якого пристрою. Не є тестом відповідності.

engine-kind-slot-timing-description = Часування слотів: секунди, поки вільний годинник вийде за запас слота маршрутизації чи завдань, індексованого за часом (найбільша абсолютна похибка часу, яку слот терпить), внесок кожного члена в цей момент з названим домінантним (невизначеність визначення, білий фазовий шум, білий, фліккер, випадкове блукання та випадковий біг частотного шуму, залишковий зсув частоти, температура, старіння), час, що лишився від останнього визначення, і найбільший інтервал визначень, що тримає годинник усередині, за вирахуванням затримки визначення. Генератор — це типове значення за КЛАСОМ (csac, uso, dsac, tcxo, ocxo або rafs: одна цитована односекундна девіація Аллана та припущений поріг червоного шуму), ПРЕСЕТ ПАСПОРТА telecom-timing або вбудований ПАСПОРТ (максимуми девіації Аллана, підігнані як огинаюча, плюс старіння та температурний коефіцієнт), або вбудований MEASURED ЗАПИС ФАЗИ (його перекривна девіація Аллана, підігнана зваженим методом найменших квадратів у базисі білої фази та частотної модуляції за IEEE Std 1139, тож поріг червоного шуму виміряно, а не припущено). Порушення за межами найдовшого часу усереднення, який підтримує паспорт чи запис, позначається як екстрапольоване. Необов'язковий розділ спуфінгу додає рівень захисту синхронізації для приймача на орбіті: орбітальну швидкість і період, як довго один наземний спуфер може діяти на супутник за прохід, поріг монітора з годинником і затримку виявлення CUSUM, умовну межу, затягування, яке спуфер із заявленою максимальною швидкістю рампи накопичує, поки супутник не залишить його зону або не виконається незалежна перевірка, і чи є кожна наземна контактна або перехресна перевірка незалежною від цього спуфера. VALIDATED: інверсія holdover із підігнаного запису, відкладена на реальному цезієвому годиннику, виміряному проти водневого мазера (tests/slot_timing_cs5071a_holdout.rs, з умовою наявності даних); на виміряному кварцовому генераторі відкладений прогноз консервативний, але не в межах порога, тож кварцовий випадок є MODELLED. MODELLED: джерела класів і паспортів, детерміновані члени та оцінка спуфінгу.

engine-kind-spectrum-description = Модель спектра L-діапазону та водоспад: увесь L-діапазон GNSS як одна спектральна густина потужності (PSD), частота по горизонталі, час донизу, за сценарним графіком глушників. СИГНАЛИ: GPS L1 C/A і L2C (BPSK(1)), відкрита служба Galileo E1 (MBOC(6,1,1/11) або BOC(1,1)), GPS L5 і Galileo E5a (BPSK(10)), кожен на своїй несівній з мінімальною прийнятою потужністю за специфікацією інтерфейсу (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), якщо не перевизначено; GLONASS, BeiDou і Galileo E6 не моделюються. ГЛУШНИКИ: тон незмодульованої хвилі, плоский вузькосмуговий шум, лінійний пилкоподібний чирп і широкосмуговий шум, узгоджений із власною модуляцією діапазону, кожен із центром, смугою, прийнятою потужністю (прямою або EIRP і дальністю через втрати у вільному просторі виду jamming) і часами вмикання/вимикання. Кожен глушник оцінюється щодо кожного діапазону за його коефіцієнтом спектрального розділення kappa в смузі приймача, а (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; для одного глушника це дорівнює рівнянню антиглушіння виду jamming із Q = 1/(R_c kappa), і звіт несе цю перехресну перевірку (та репрезентативну цифру Q виду jamming поруч). Поріг шуму — k T_sys із T_sys = T_ant + 290 K (F - 1). Водоспад усереднює кожну комірку за її смугою та рядком (чирпи точно, цілі розгортки плюс неповна; глушники, що перемикаються посеред рядка, за їхньою скважністю), тож часова лінія C/N0 і картинка походять з тих самих чисел; result.json несе сітку, усереднену блоками за потужністю, C/N0 і J/S за діапазонами на рядок, а на кожен глушник на кожен діапазон — SSC, Q, J/S, J/S у смузі та сталий C/N0. Необов'язково [iq]: модель, намальована як комплексний IQ в один момент, записана в запис SigMF (cf32_le або ci16_le) і прочитана з нього назад, та порівняна з оцінкою Велча. Необов'язково [recording] (нативні збірки): PSD Велча реального запису SigMF поруч із моделлю. VALIDATED: PSD сигналів проти підручникових ширин головної пелюстки (BPSK(n) 2n x { $lit_1_023 } MHz від нуля до нуля; пелюстки BOC(1,1) з центрами на +/-{ $lit_1_023 } MHz) і коефіцієнти спектрального розділення проти їхніх замкнених форм за Парсевалем та Q = 1 (CW) і { $lit_1_5 } (узгоджений) за Kaplan & Hegarty. MODELLED: потужності глушників, часова лінія, смуги фронтенда, трактування неперервного спектра (без кодових ліній) і відсутність AGC, гасіння та діаграми антени.

engine-kind-solar-system-description = Уся Сонячна система в одну епоху, для PNT (позиціонування, навігації та часу) навколо будь-якого тіла. Для Сонця, восьми планет, Плутона, Місяця, Фобоса, Деймоса, Іо, Європи, Ганімеда, Калісто і Титана подає геліоцентричне положення та швидкість в ICRF (Міжнародна небесна система відліку, екваторіальна J2000), геліоцентричну відстань і екліптичні довготу та широту J2000, гравітаційний параметр, екваторіальний і середній радіус, J2 там, де опубліковано, і його опорний радіус, сидеричний період обертання, полюс IAU і початковий меридіан на епоху, трек орбіти, дискретизований за один оберт (геліоцентричний для планет, із центром у планеті для супутників), а також світловий час, односпрямовану та двоспрямовану дальність, сонячну затримку Шапіро й кутову відстань від Сонця від тіла-спостерігача (типово Земля); додаткові зв'язки from/to отримують те саме. Положення: кеплерівські елементи JPL Стендіша й Вільямса (таблиця 1 для 1800 AD – 2050 AD, таблиці 2a/2b для 3000 BC – 3000 AD) з номінальною похибкою кожної планети, місячний ряд Монтенбрука й Гілла для поділу Земля–Місяць, середні елементи JPL із синхронною швидкістю обертання IAU для марсіанських і галілеєвих супутників та модель обертання IAU для Титана. Світловий час: радіометричний розв'язок із нерухомою точкою, передавач у запізнілому положенні; ньютонівський, із затримкою Шапіро, поданою окремо. VALIDATED за JPL Horizons (DE441) у межах подвійної номінальної похибки: від Меркурія до Сатурна і Земля з таблиці 1 (найгірше { $lit_1_87 } номінальної) і всі вісім планет із таблиць 2a/2b (найгірше в { $lit_1_71 } разів), а також світловий час Земля–Марс і Земля–Юпітер. MODELLED, кожен рядок позначено: Уран і Нептун із таблиці 1 ({ $lit_2_0 } і { $lit_5_2 } номінальної похибки проти DE441), Плутон (рядок 1992; заявленої похибки немає), Місяць і сім супутників (виміряно проти Horizons, опублікованої межі немає).

engine-kind-body-pnt-description = Позиціонування навколо будь-якого тіла Сонячної системи: орбітер або поверхневий спускний апарат навколо центрального тіла, вибраного за назвою (Марс, Місяць, Європа, Ганімед, Титан та решта каталогу Сонячної системи), що навігує за односпрямованими псевдодальностями від малого навігаційного угруповання Walker навколо тіла (двотільні орбіти з віковим дрейфом J2 власного тіла, невідомий годинник користувача) і необов'язково за безгодинниковою далекокосмічною двоспрямованою дальністю від Землі, чиї напрямок і відстань беруться з аналітичних ефемерид Сонячної системи на кожну епоху. Лінії візування блокуються середньою сферою тіла, а поверхневому користувачеві також потрібна маска висоти. На епоху: ретранслятори в полі зору, чи Земля над лімбом, GDOP і PDOP лише від угруповання (геометричний чинник і чинник положення погіршення точності), формальна одно-сигма невизначеність положення з рядком Землі та без нього і похибка розв'язку методом найменших квадратів Гаусса–Ньютона із зерном кожним способом; за запуск: доступність, видимість Землі, медіанний PDOP, RMS-похибка й медіанна формальна сигма, а також світловий час від Землі до тіла, туди й назад, затримка Шапіро й кутова відстань від Сонця на епоху. MODELLED: орбіти ретрансляторів, рівні шуму й миттєва модель вимірювань є вибором моделювання, не перевіреним за навігаційними даними місії; константи тіла — опубліковані значення, процитовані в body.rs, а геометрія Землі успадковує мітки ефемерид Сонячної системи.

engine-kind-constellation-design-description = Проєктування орбітальних угруповань у масштабі: схеми Walker DELTA і Walker STAR у позначенні i: T/P/F (вузли, розподілені на 360 або 180 deg, міжплощинна відстань у площині 360*P/T, фазовий зсув між площинами 360*F/T), явні списки елементів і багатошарові проєкти, кілька угруповань в одному запуску, навколо Землі, Місяця, Марса або будь-якої іншої планети, Плутона чи великого супутника за константами в модулі body (тими самими, що використовують види solar-system і body-pnt). ПРЕСЕТИ з опублікованих номінальних елементів: gps-baseline і gps-expandable (24 слоти й шість розширюваних пар передніх/задніх Стандарту характеристик служби стандартного позиціонування GPS, 5-е видання 2020, таблиці 3.2-1 – 3.2-3), galileo (Walker 24/3/1 на 29 599.801 km і 56 deg, Galileo Open Service Service Definition Document, випуск 1.1, таблиці 1 і 23), beidou і beidou-meo (Walker 24/3/1 на 21 528 km і 55 deg плюс три геостаціонарні супутники на 80, { $lit_110_5 } і 140 deg E і три похилі геосинхронні супутники на 55 deg, BeiDou Open Service Performance Standard 3.0, розділ 4.1; фаза MEO і перетин похилої геосинхронної орбіти на 118 deg E змодельовано, бо стандарт їх не називає) і glonass (24/3/1 на 19 100 km і { $lit_64_8 } deg за формулою слота з Інтерфейсного контрольного документа GLONASS, видання 5.1, розділ 5.2). ПОКРИТТЯ ТА ПОГІРШЕННЯ ТОЧНОСТІ: за сіткою широта/довгота й дискретизованим вікном із маскою висоти — кількість супутників у полі зору, GDOP, PDOP, HDOP і VDOP на комірку, доступність (визначення з PDOP не вище порога, типово 6) на комірку, глобально (зважено за площею) та в найгіршому місці, з одним годинником приймача на угруповання, якщо не clock = "common". Масштабується до тисяч супутників: видимість — це скалярний добуток із половинним кутом покриття кожного супутника, а супутники розбиваються на смуги за широтою підсупутникової точки на кожну епоху, тож рядок сітки перевіряє лише тих, що можуть бути в полі зору; звіт рахує заощаджені перевірки пар. JSON несе карти сітки та проріджені наземні треки супутників. VALIDATED: генератор Walker проти таблиці 23 Galileo OS SDD і формули слота GLONASS ICD, пресет GPS проти опублікованого стовпця екваторіальних перетинів таблиці 3.2-1 SPS PS, а глобальний розподіл HDOP бази GPS проти додатка B SPS PS (медіана { $lit_0_94 }, 95% { $lit_1_25 }, середнє { $lit_0_96 }, допуск { $lit_0_03 }). MODELLED: двотільні орбіти з необов'язковим віковим J2, сферичне тіло, лише геометрична видимість (без потужності сигналу, стану чи рельєфу) та відносна фаза між різними системами, що не є знімком жодної реальної дати.

engine-kind-campaign-description = Кампанія: наявні види сценаріїв, складені в один запуск, де кожне число прочитано з реального запуску названого виду. Чотири розділи в будь-якій комбінації. ФАЗИ: ланцюгова місія на одній спільній часовій осі -- кожна фаза проганяє один чи кілька сценаріїв (наприклад, глушіння, потім спуфінг, потім годинник у holdover з інерціальною навігаційною системою, що виконує вибіг поруч, потім тривога цілісності, потім відновлення), їхні виходи зчитуються в іменовані канали (похибка часу годинника проти запасу, відношення несівна/шум за густиною проти порога стеження, рівень захисту проти порога тривоги, похибка положення, супутники, що стежать, прапорці тривоги) пресетом за видом або явними шляхами результатів і передискретизуються на спільну сітку утриманням нульового порядку, з межами фаз і подіями; стан передається через carry (канал продовжується від кінцевого значення попередньої фази), handoff (число попередньої фази, записане в сценарій цієї фази) і end_at (фаза закінчується в час, обчислений запуском, наприклад час виявлення монітора спуфінгу). РОЗГОРТКА: сітка за одним–трьома ключами сценарію з крапками будь-якого виду (цілочисельний сегмент індексує масив таблиць, як у system.2.sisre_m), з метриками, прочитаними за шляхом результату, і, за запусків понад один, ансамбль Монте-Карло із зерном у кожному вузлі. MONTE_CARLO: реалізація k запускається на base_seed + k; кожна метрика подає середнє, стандартне відхилення, процентилі 5-й/50-й/95-й за найближчим рангом і бутстреп-95% довірчий інтервал середнього з фіксованим зерном. COMPOSE: кілька сценаріїв зі спільними значеннями (потужність і положення одного глушника, записані в морський і дорожній приймач), із зведеним підсумком найкращого/найгіршого. Результат несе хеш кампанії, дайджест за кожним результатом-членом і запис одиниць на кожне видане число; експорти інтероперабельності записують кожен сценарій-член, що має геометрію, як власний набір файлів. Тотожності складання перевіряються: однофазова кампанія відтворює автономний запуск біт у біт, ансамбль із фіксованим зерном байт-стабільний, а на годиннику з білим частотним шумом середнє ансамблю потрапляє всередину поданого інтервалу зі спадом, що збігається з sqrt(q_wf * tau). MODELLED: адитивне перенесення та утримання нульового порядку є вибором моделювання, а кожна фаза несе мітку виду, що її запустив.

engine-kind-leo-signal-description = Проєкти сигналів LEO-PNT: параметризовані сигнали позиціонування, навігації та часу (PNT) низької навколоземної орбіти (LEO) для будь-якої системи, діапазону й структури. СИГНАЛ — це діапазон (центральна частота, смуга передавання, розподіл ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) і компоненти (захоплення, дані, пілот; будь-яка підмножина), кожен із модуляцією (BPSK(n) з дробовим n, BOC(m,n), MBOC(6,1,p) або плоска OFDM-подібна смуга), часткою потужності, необов'язковими зсувами піднесучих FDMA, довжиною коду та швидкістю даних. Сигнали беруться зі вбудованих публічних файлів пресетів (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; кожен з URL свого джерела, а кожне неопубліковане значення позначено REPRESENTATIVE) або записуються вбудовано. НА СИГНАЛ: обмежена за смугою спектральна густина потужності та частка потужності кожного компонента, яку пропускає смуга передавання (замкнена форма BPSK поруч із чисельним значенням), RMS (Габора) смуга, тепловий джитер відстеження коду контуром DLL проти C/N0 та інтервалу early-late за обмеженою за смугою формулою когерентного (або некогерентного) early-late Бетца й Колодзейського 2009 з її підручниковою формою для необмеженої смуги та її межею Габора за зникомого інтервалу, точність дальнометрії в метрах, простір пошуку захоплення (доплерівські комірки з максимального Доплера орбіти плюс члени генератора та користувача, помножені на кодові комірки), імовірність виявлення квадратичним детектором і середній час захоплення послідовного та кодово-паралельного, коефіцієнт спектрального розділення сигналу в GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b і E5 AltBOC та кожного з них у сигнал із погіршенням C/N0, а також CW, широкосмугове й узгоджене J/S, яке терпить стежений компонент, з власного механізму SSC виду spectrum. КОМПРОМІС ДІАПАЗОНІВ: іоносферна затримка першого порядку ({ $lit_40_3 } TEC/f^2), втрати у вільному просторі, точність дальнометрії за рівного C/N0 і за рівної EIRP та стійкість до глушника. Необов'язкові ПЕРЕВІРКИ ФОРМИ зіставляють спектр проєкту з описаним вимірюванням (MODELLED узгодженість). VALIDATED: замкнені форми потужності BPSK у смузі ({ $lit_90_3 } % у головній пелюстці) і смуги Габора, обмежений за смугою джитер, що зводиться до підручникової форми когерентного early-late і до своєї межі Габора, коефіцієнт спектрального розділення зсунутого BPSK проти його замкненої форми за Парсевалем, одинична площа спектра AltBOC та максимальний доплер LEO проти опублікованих цифр Xona Pulsar (32-34 kHz) та Iridium (36 kHz). MODELLED: кожен проєкт, розподіл потужності, C/N0 і рівень глушника; спектри EFQPSK, CSK та OFDM апроксимовано.

engine-kind-leo-pass-description = Прохід LEO і бюджет каналу за діапазонами для LEO-PNT (позиціонування, навігація та час з низької навколоземної орбіти), незалежно від системи: користувач (наземний, морський, повітряний чи в приміщенні, нерухомий або рухомий) і один чи кілька супутників LEO із ЗАПРОЄКТОВАНОГО ПРОХОДУ (колова орбіта, розміщена так, щоб користувач бачив один прохід вибраної максимальної висоти над горизонтом у вибраний час, сонячно-синхронна, якщо просять), явних ЕЛЕМЕНТІВ, TLE (дворядковий набір елементів) через SGP4 рушія або угруповання WALKER, збудованого кодом проєктування угруповань (подаються найвищі проходи). Діапазони беруться з названого пресета (загальний багатодіапазонний UHF/L/S/C, загальний C-діапазон, Xona Pulsar X1/X5, Iridium STL, Starlink як сигнал нагоди лише з Доплером, CentiSpace і необов'язковий пресет Celeste IOD, позначений WORKSHOP) або записуються в сценарій; кожен пресет заявляє, чи його числа PUBLIC (з URL), REPRESENTATIVE або WORKSHOP. На супутник, діапазон і епоху: висота над горизонтом, азимут, дальність, швидкість зміни дальності та прискорення дальності; втрати у вільному просторі; EIRP і підсилення діаграми супутника (ізофлюкс, гауссів промінь або плоска); підсилення антени користувача залежно від висоти над горизонтом (патч, напівсферична або ізотропна); газове загасання (ITU-R P.676-10, додаток 2), дощове загасання (коефіцієнти ITU-R P.838-3 і процедура P.618-14, за інтенсивністю й висотою дощу), тропосферна сцинтиляція (ITU-R P.618-14, розділ 2.4.1), втрати на проникнення в будівлю для користувача в приміщенні (ITU-R P.2109-2), поляризаційна невідповідність, шумова температура системи та C/N0 (відношення несівна/шум за густиною); Доплер і швидкість Доплера в замкненій формі зі швидкості зміни дальності та прискорення дальності, кожне перевірене центральними різницями; іоносферна затримка першого порядку { $lit_40_3 } STEC/f^2 із Klobuchar або вертикального TEC, похилого TEC, масштабованого на частину іоносфери нижче супутника. Пари діапазонів отримують безіоносферні коефіцієнти, підсилення шуму та кодовий шум на піку проходу. Супутники MEO GNSS (пресети Galileo або GPS) оцінюються тією самою моделлю антен і шуму за прийнятими потужностями з інтерфейсних документів, тож дзвоноподібний прохід LEO та пласкі несівні GNSS ділять один графік. Необов'язковий розділ [iot] подає час до першого визначення, енергію на визначення та час роботи батареї проти скважності для заявленого енергобюджету приймача (MODELLED). Кожна пара діапазонів також подає похилий TEC, який її безгеометрична комбінація відновлює на піку, та сигму кодового шуму цієї оцінки (зондування іоносфери). Необов'язковий розділ [spoofer] підробляє сигнали заявленого положення, що стрибає або зсувається від істинного після початку, і запускає два монітори із заявленими імовірностями хибної тривоги та пропущеного виявлення: узгодженість Доплера та геометрії проходу (виміряні швидкості зміни дальності проти прогнозованих з орбіт і незалежного апріорного положення та швидкості, узагальнений тест хі-квадрат за методом найменших квадратів на вікні, за каналами GNSS, LEO і всіма) та міждіапазонну узгодженість (крок від епохи до епохи безгеометричної комбінації кожної пари діапазонів LEO зі скоригованою моделлю геометрією), подаючи статистики на епоху та коли кожен монітор виявляє (MODELLED). VALIDATED компоненти: втрати у вільному просторі, коефіцієнти P.838-3 проти його таблиці 5, процедури P.618-14 для дощу та сцинтиляції і втрати на проникнення в будівлю P.2109 проти прикладів перевірки Study Group 3 ITU-R, співвідношення групових затримок L1/L2 за IS-GPS-200 і максимальний Доплер нерухомого користувача на коловій орбіті проти таблиці 1 arXiv 2509.19551. MODELLED: EIRP, діаграми, частка Чепмена TEC нижче супутника та весь прохід.

engine-kind-leo-navmsg-description = Навігаційне повідомлення LEO: широкомовні ефемериди й годинник супутника позиціонування, навігації та часу низької навколоземної орбіти (LEO), для будь-якої орбіти, несівної та моделі, з необов'язковими названими пресетами (Xona Pulsar, Iridium, Starlink, CentiSpace, репрезентативна система C-діапазону, модель нульового годинника ATOMIC, Celeste IOD). ВМІСТ: допоміжні дані (SVID, випуск даних, діапазон, стан сигналу), синхронізація (тиждень, час тижня, поліном годинника другого порядку af0-af2 навколо toc), ефемериди в одній із чотирьох моделей -- 16-параметричний кеплерівський набір Galileo OS SIS ICD; цей набір плюс поліноми поправок уздовж треку, поперек треку та радіальні; 22-параметрична модель Liu et al. 2025; поліном ECEF без членів годинника (нульовий годинник ATOMIC) -- та інші служби (широкомовний набір Klobuchar, NeQuick-G ai0-ai2 з ефективним рівнем іонізації та параметри переходу від системного часу до UTC за логікою високосної секунди ICD). ПІДГОНКА: істинна орбіта, проінтегрована із зональною гравітацією J2-J6 або EGM2008 до вибраного ступеня та опором, і вільний або кермований годинник із зерном; підгонка Левенберга–Марквардта кеплерівського набору за неособливими елементами, потім лінійні поліноми поправок за найменшими квадратами; годинник підігнано за вирахуванням релятивістського члена, який додає користувач. АНАЛІЗИ: fit-interval-trade (похибка дальності сигналу в просторі, SISRE, з глобально усередненими вагами для висоти орбіти, проти інтервалу підгонки та періоду оновлення, лише орбіта та з годинником), model-comparison (чотири моделі, кількість параметрів, закодовані біти та підгонка Kshana на висотах Liu et al. поруч з опублікованими цифрами), midpass-update (найвищий прохід над користувачем, стрибок положення, годинника та дальності користувача при кожному перемиканні повідомлення, стрибок у найгіршій геометрії, PASS/FAIL проти порога безперервності), encode-decode (власний задокументований бінарний фрейм Kshana з CRC-24Q, бюджет квантування за півкроком на поле, перевірка пошкодженого фрейма, експорт та імпорт запису у стилі RINEX-4, позначені розширенням Kshana, і таблиця CSV). VALIDATED: ваги SISRE проти опублікованої таблиці MEO/GEO (Montenbruck et al. 2018); користувацький алгоритм Galileo проти RTKLIB на реальних широкомовних ефемеридах Galileo; CRC-24Q проти його каталожного контрольного значення та прикладу фрейма RTCM 1005. MODELLED: кожна цифра підгонки та SISRE є похибкою подання проти істини, проінтегрованої Kshana (без похибки визначення чи прогнозу орбіти); порівняння з Liu et al. використовує інші орбіти; формати кодування й тексту — власні для Kshana.

engine-kind-leo-pvt-description = Комплексоване позиціонування, навігація та час (PNT) на середній навколоземній орбіті (MEO) і низькій навколоземній орбіті (LEO) над БУДЬ-ЯКИМИ угрупованнями: кожна [[system]] — це пресет GNSS виду constellation-design, пресет LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, модель ефемерид atomic-zero-clock або інший файл пресета, кожен у власному файлі з джерелами, позначеними PUBLIC, WORKSHOP або DERIVED), оболонки Walker або явні набори елементів, з несівною, чіповою швидкістю, огинаючою відношення несівна/шум за густиною (C/N0) від маски висоти до зеніту, похибкою дальності сигналу в просторі (SISRE), сигмою Доплера та моделлю годинника (власний годинник приймача, тож міжсистемне зміщення оцінюється, або відоме широкомовне зміщення). Чотири режими. DOPPLER: пакетне позиціонування Гаусса–Ньютона зі швидкості зміни дальності з аналітичними частинними похідними, станами дрейфу годинника та необов'язковою швидкістю й необов'язковим обмеженням висоти, одно- чи багатосупутникове, похибка проти довжини вікна, огинаюча Доплера, швидкості Доплера й ривка кожної системи LEO та точність за треком і поперек треку для одного проходу проти зсуву поперек треку (похибка поперек треку необмежено зростає, коли прохід іде над головою; один прохід також має дзеркальний розв'язок через наземний трек). Тут запускається сигнал нагоди лише з Доплером (starlink-sop). JOINT: покрокові зважені розв'язки псевдодальностей методом найменших квадратів за епохою лише з GNSS, лише з LEO та з обома, сигми на вимірювання з моделі теплового шуму контуру DLL за C/N0 плюс SISRE (або фіксована сигма, щоб їх міг живити модель сигналу), оцінені міжсистемні зміщення та PDOP/HDOP/VDOP проти кількості доданих супутників LEO. POLAR: супутники в полі зору та DOP проти широти для GNSS, LEO та обох. TIMING: передавання часу до Всесвітнього координованого часу (UTC) від супутників LEO у відомому положенні з двостановим фільтром годинника, чий шум процесу походить із класів генераторів рушія, проти C/N0 та генератора, і вираз IS-GPS-200 системного часу до UTC; за [timing] trace = true кожен рядок також подає свою похибку часу та прогнозовану сигму на кожну епоху. VALIDATED: найбільший Доплер проходу від зеніту до горизонту проти опублікованих цифр Iridium (до 36 kHz) і Xona Pulsar X1 (32-34 kHz). MODELLED: усе інше; DOP перевірено на виведеному вручну випадку, розв'язки — за їхньою коваріацією, а модель Доплера — за тотожністю прискорення дальності.

engine-kind-leo-ppp-description = Збіжність точного одноточкового позиціонування (PPP) лише з GNSS і з доповненням LEO: плаваючий розширений фільтр Калмана за безіоносферними кодом і фазою несівної з нерухомими координатами станції, білим годинником приймача, одним міжсистемним зміщенням на кожну додаткову систему, випадковим блуканням зенітної вологої затримки, відображеним 1/sin(elevation), і плаваючою неоднозначністю на дугу супутника; точна похибка орбіти й годинника біла та спільна для коду й фази супутника, тож кожен супутник є одним корельованим дворядковим оновленням у стабілізованій за Джозефом формі. Вимірювання симулюються з тієї самої моделі зі зерновим шумом за кількома пунктами та зернами, і кожен випадок (спершу лише GNSS, потім кожен [[case]] систем LEO, будь-яке угруповання чи пресет) подає медіанний час збіжності (першу епоху, після якої горизонтальна й вертикальна похибки залишаються нижче порогів, типово 10 cm), частку збіжних, медіанні криві похибки та узгодженість фільтра (усереднений за запусками NEES положення проти двостороннього 95% смуги хі-квадрат). Необов'язково поруч з опублікованими цифрами Li et al. (2019, J. Geod. 93:749, doi 10.1007/s00190-018-1195-2) для середніх широт: { $lit_9_6 } min для мульти-GNSS, скорочені до { $lit_7_0 }, { $lit_3_2 }, { $lit_2_1 } і { $lit_1_3 } min із 60, 96, 192 і 288 супутниками LEO. MODELLED: порівняння узгодженості тренду, а не відтворення угруповань, шуму чи станцій того дослідження; без розв'язання неоднозначностей, проковзувань циклу, намотування фази, припливів чи корельованих у часі похибок продуктів.

engine-kind-ntn-positioning-description = Позиціонування за низхідною лінією нетерестріальної мережі (NTN) 5G у S-діапазоні мобільної супутникової служби (MSS) (діапазон 3GPP n256, низхідна лінія від 2170 до 2200 MHz; типова несівна { $lit_2172_5 } MHz): межа Крамера–Рао (CRB) за часом прибуття, c / (2 pi beta sqrt(2 (C/N0) T)), де beta — середньоквадратична (Габора) смуга плоского спектра OFDM (B/sqrt(12)), і за Доплером комплексного тону, sqrt(3 / (2 pi^2 (C/N0) T^3)), для кожного сигналу (типово 5 MHz канал New Radio із зайнятими { $lit_4_5 } MHz і вузькосмуговий канал 200 kHz із зайнятими 180 kHz); далі, над будь-яким угрупованням LEO, визначення за часом прибуття низхідної лінії з невідомим годинником приймача (із зерном, з межею плюс похибкою синхронізації мережі як сигмою), їхній PDOP і формальна 3D сигма та односупутникове визначення за Доплером на найдовшому проході з утриманою висотою. MODELLED: крок від смуги до межі — підручникова замкнена форма, перевірена чисельним інтегруванням плоского та обмеженого за смугою спектрів BPSK (внутрішня узгодженість, жодної опублікованої розробленої цифри не закріплено), а точність позиціонування — це межа для каналу без багатопроменевості із заявленою похибкою синхронізації, а не досягнутий результат.

engine-kind-leo-pnt-chain-description = Одна система LEO-PNT (позиціонування, навігація та час з низької навколоземної орбіти) наскрізно, для будь-якого угруповання та сигналу: проєкт leo-signal, названий signal_design (публічний пресет або вбудований проєкт [signal]), задає центр, смугу, чіпову швидкість і поділ EIRP діапазону [pass], бюджет каналу leo-pass дає стежений C/N0 і обмежений за смугою кодовий джитер на проході, лінія C/N0 за sin(elevation) і широкомовна SISRE повідомлення [navmsg] (підігнана на висоті супутника проходу) живлять кожну систему LEO спільного визначення leo-pvt у [fusion] і, необов'язково, випадки leo-ppp у [ppp]; кожну передачу перелічено з її значенням і одиницею. MODELLED.

engine-kind-contact-schedule-description = Планування наземних контактів для кількох супутників над кількома станціями: видимі вікна доступу (SGP4, земна система IAU 2006/2000A, рефракція ITU-R P.834, світловий час), обсяг даних DVB-S2 ACM кожного проходу (пороги таблиці 13 ETSI EN 302 307-1) і безконфліктний розклад (один супутник на антену з переналагодженням, одна станція на супутник, зважена за пріоритетом доставка, обмежена кожним накопиченням) жадібним методом граничної цінності, базовим «першим прийшов» і точним методом гілок і меж на малих наборах, з розривом оптимальності жадібного. MODELLED.

engine-kind-acm-link-description = Один супутник над однією станцією: похила дальність, висота над горизонтом і Es/N0 кожного проходу вздовж проходу, MODCOD DVB-S2, вибраний на кожному кроці (пороги таблиці 13 ETSI EN 302 307-1 плюс запас реалізації), і обсяг даних, який переносить ACM, проти базового сталого кодування, що замикається на масці. MODELLED.

engine-kind-aocs-description = Керування орієнтацією космічного апарата: інерціальний розворот жорсткого корпусу з трьома чи більше збалансованими реакційними колесами за зворотним зв'язком MRP (L = -K sigma - P omega), моменти коліс мінімальної норми, обрізані до межі кожного двигуна, RK4 з утриманням нульового порядку; необов'язково замкнене на мультиплікативний EKF за симульованим гіроскопом (випадкове блукання кута й швидкості) і зоряним датчиком. Подає час усталення, кінцеву та пікову похибку наведення, пікові швидкість і момент коліс, частку насичення, дрейф кутового моменту та, з оцінювачем, його похибку орієнтації та NEES. Цикл істинного стану VALIDATED проти Basilisk 2.9.1; оцінювач MODELLED.

engine-kind-entry-heating-description = 3-DoF вхід матеріальної точки в атмосферу над обертовою сферичною Землею або Марсом (балістичний або з підйомною силою за сталого крену), RK4, крізь US76, експоненціальну або марсіанську атмосферу, з конвективним нагрівом у точці гальмування за Саттоном–Грейвсом (NASA TR R-376): пікове гальмування, тепловий потік і динамічний тиск, теплове навантаження, дальність по землі, перевірка енергії в обертовій системі та замкнена форма Аллена–Еггерса поруч. Пікове гальмування перевіряється за опублікованим номіналом Stardust; нагрів є MODELLED.

engine-kind-eo-radiometry-description = Радіометрія та якість зображення надирного знімача: радіанс сцени Ламберта на апертурі, рівняння камери, сигнал і шуми дробовий/темновий/зчитування/квантування та SNR; MTF системи на Найквісті (дифракція x детектор x змазування x джитер), відносний відгук на межі з неї, Q = lambda F/p і NIIRS за GIQE версії 4 без компенсації MTF. MODELLED.

engine-kind-ascent-losses-description = Планарне виведення багатоступеневого носія за гравітаційним поворотом над необертовою сферичною Землею крізь Стандартну атмосферу США 1976 (вертикальний підйом, поштовх тангажа, тяга вздовж швидкості), що інтегрує втрати на гравітацію, опір, керування та протитиск і перевіряє ідеальне dv мінус втрати проти швидкості вигоряння; max-Q, пікове прискорення та стан вигоряння. MODELLED.

engine-kind-time-transfer-budget-description = Двостороннє супутникове передавання часу й частоти між двома станціями крізь геостаціонарний ретранслятор: двостороннє рівняння, розв'язане для T_A - T_B з кожним нереципрокним членом (затримки обладнання станцій, іоносфера Ku-діапазону, транспондер, Саньяк), бюджет невизначеності в квадратурі, чий член типу A — це TDEV симульованого каналу на часі усереднення, симульований канал із білим і фліккерним фазовим шумом та добовою нереципрокністю, а також стабільність (швидкість, залишковий RMS, TDEV, ADEV) будь-якого наданого ряду розділу 1 BIPM Circular T, CSV MJD,ns або записів годинників станцій IGS RINEX. MODELLED.

engine-kind-optical-atmosphere-description = MODELLED оптична PNT крізь атмосферу: для оптичного каналу та набору наземних пунктів із заявленим кліматом хмарності подає залежні від довжини хвилі й висоти над горизонтом втрати в ясному повітрі (закон видимості Кіма плюс Релей), стан турбулентності Hufnagel-Valley (дисперсія Рито, індекс сцинтиляції, параметри gamma-gamma, усереднення за апертурою), керовану погодою доступність проти запасу каналу (оптична товщина хмар із лог-нормального клімату рідкої води, екстинкція геометричної оптики, незалежне турбулентне завмирання), запас каналу, потрібний для цільових доступностей, розподіл тривалості перерв, зростання похибки синхронізації та дальнометрії на перерву через модель holdover годинника, залежну від відстані доступність за рознесенням пунктів і гіпотетичні виграші від методів покращення (довжина хвилі, приймальна апертура, зменшення сцинтиляції адаптивною оптикою, додатковий запас). VALIDATED як реалізація заявлених формул проти незалежного оракула mpmath: дисперсія Рито, індекс сцинтиляції, ймовірність завмирання gamma-gamma, коефіцієнт усереднення за апертурою, оптична товщина хмар і ясного повітря. MODELLED: кожен вхід погоди, методу та годинника, а також припущення про незалежність і копулу; жодного виміряного запису доступності не порівнювалося. Консультативний аналіз, не сертифікований продукт доступності чи навігації.

engine-kind-holdover-test-description = MODELLED тест holdover системи часу, оцінений за записом похибки часу, який надає ОПЕРАТОР (журнал linuxptp ptp4l, phc2sys або ts2phc, журнал відстеження чи статистики chrony, журнал годинника TICC, TimeLab або RINEX, чи пари time_s,time_error_ns). Тест має чотири кроки, і Kshana не виконує жодного з них: БАЗОВИЙ захоплений стан, GNSS ПРИБРАНО оператором (антенний кабель або вихід симулятора; Kshana нічого не передає і нічим не керує) у заявлений час, HOLDOVER на власному генераторі системи та ВІДНОВЛЕННЯ після того, як оператор повертає GNSS у другий заявлений час. Запис розділяється за цими двома часами. База: статистика похибки часу та маски ITU-T, написані для захопленого годинника. Holdover: статистика, дробове зміщення частоти, яке тримала система (лінія за найменшими квадратами), маски, написані для holdover чи автономного годинника, огинаюча holdover ePRTC-A із заявленої тривалості захопленого стану та час до перевищення кожного бюджету похибки часу. Відновлення: чи й коли |TE| потрапила в заявлену смугу та залишилася там, пік і найбільший крок. Кожну межу переписано з публічної таблиці ITU-T (маски telecom-timing); формулювання — «виміряно щодо маски», а ці два часи є твердженням оператора, не перевіреним. Запис, закороткий для маски, є INCOMPLETE, ніколи не екстраполюється. Див. docs/TIMING-HIL.md.

engine-kind-gnss-ssv-description = MODELLED доступність GNSS і сила каналу в Космічному об'ємі обслуговування та за його межами: для користувача на сфері (глобальна оболонка буклета ICG) або на кеплерівській траєкторії (від LEO до місячного переходу) подає на орбітальне угруповання (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) і для всіх разом сигнали, придатні вище порога C/N0 - доступність щонайменше одного та чотирьох сигналів, максимальну тривалість перерви, прийняте C/N0, погіршення точності, канали головної пелюстки проти бічних - з буклетною, параметричною або наданою користувачем діаграмою передавання, необов'язковими ефектами іоносфери променів по лімбу, плазмосфери й атмосфери та необов'язковим проєктом слабкосигнального приймача; а також бортовий розширений фільтр Калмана GNSS для апаратів на HEO та місячному переході (орбітальна динаміка, тиск сонячного випромінювання, треті тіла, годинник) і відносну навігацію групи з кількох апаратів за одинарними різницями псевдодальностей. Перевірено за таблицями буклета ICG SSV за попередньої реєстрації (xval/gnss-ssv)

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

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-site-title-a = Завдання (a): виявлення за журналами приймача

engine-bench-site-title-b = Завдання (b): виявлення за IQ

engine-bench-site-title-c = Завдання (c): прогнозування holdover синхронізації часу

engine-bench-site-title-d = Завдання (d): розрив оптимізму поза розподілом

engine-bench-site-col-rmse-3600 = RMSE 3600 s (ns)

engine-bench-site-col-rmse-300 = RMSE 300 s (ns)

engine-bench-site-col-rmse-7200 = RMSE 7200 s (ns)

engine-bench-site-col-auc-in = AUC всередині

engine-bench-site-col-auc-out = AUC ззовні

engine-bench-site-col-optimism-gap = Розрив оптимізму

engine-bench-site-col-flag = Позначка

engine-bench-site-col-auc = AUC

engine-bench-site-col-pd-at-pfa-cap = P_d за обмеження P_fa (верхня межа)

engine-bench-site-flag-optimistic = оптимістично

engine-bench-site-flag-within-tolerance = у межах допуску

engine-bench-site-not-available = н/д

engine-bench-site-none-published = Результатів ще не опубліковано. Рядок з'являється тут лише тоді, коли файл результату оцінено й додано; нічого на цій сторінці не є оцінкою.

engine-bench-site-none-for-task = Для цього завдання результатів ще немає.

engine-bench-site-region-label = { $title }: результати { $split }

engine-bench-site-caption-split = Розбиття: { $split }

engine-bench-site-th-system = Система

engine-bench-site-th-provenance = Походження

engine-bench-site-th-truth-sha256 = SHA-256 істинних даних

engine-bench-site-provenance-carried = перенесено: { $note }

engine-bench-site-provenance-scored = оцінено

engine-bench-site-heading = таблиця лідерів kshana-bench

engine-bench-site-lede = Файли результатів, оцінені за <code>{ $spec }</code>. Рядок означає, що цей файл набрав це число на цьому розбитті. Це не означає, що будь-який продукт хтось оцінив чи схвалив, і жодну організацію не названо як таку, що підтримує.

engine-bench-site-foot = Кожна оцінка є модельною, якщо рядок не вказує, що зовнішній оракул погодився. Ліцензія специфікації та маніфестів: запропоновано CC-BY-4.0 / CC0, рішення власника очікується. Реальний набір holdout не є секретним: див. специфікацію, розділ 4.

engine-bench-site-meta-description = Оцінки поданих файлів результатів за kshana-bench { $spec }. Лише консультативно.

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

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

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENT

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

engine-e-interference-map-adsb-gzip = gzip: { $e }

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

engine-iq-campaign-report-roc-heading = ROC виявлення

engine-iq-campaign-report-roc-note = <p class="note">Позначено <b>{ $label }</b>. Кожне вказане вікно події є позитивним, а кожне вікно налаштованої довжини поза подіями — негативним. Вікно враховується за порогу, коли тестова статистика самого монітора досягає його в цьому вікні. P<sub>fa</sub> обчислено на негативне вікно, а не на тест. Ті самі значення є в <code>roc.json</code>.</p>

engine-iq-campaign-report-th-alarm-kind = Вид тривоги

engine-iq-campaign-report-th-positives = Позитивні

engine-iq-campaign-report-th-negatives = Негативні

engine-iq-campaign-report-th-auc = AUC

engine-iq-campaign-report-th-threshold = Поріг

engine-iq-campaign-report-th-pd-at-it = P<sub>d</sub> за нього

engine-iq-campaign-report-th-pfa-at-it = P<sub>fa</sub> за нього

engine-iq-campaign-report-title = Кампанія { $name }

engine-iq-campaign-report-heading = Кампанія лабораторного відтворення: { $name }

engine-iq-campaign-report-meta = Клас даних <b>{ $data_class }</b> · Kshana { $engine } · записів: { $n_recordings } × входів: { $n_frontends } × проєктів: { $n_designs } = комірок: { $n_cells }, виконано: { $n_done } · дайджест <code>{ $digest }</code>

engine-iq-campaign-report-digest-incomplete = (неповний: не кожну комірку виконано)

engine-iq-campaign-report-reference-note = <p class="note">Виміряні значення отримано відстеженням записів. Штрихові лінії з позначкою <b>{ $label }</b> — це аналітичний еталон спектрального розділення <code>{ $formula }</code> за вказаного лабораторією J/S, з Q за вказаним видом завад. Вони є моделлю вказаної умови, а не вимірюванням і не симуляцією завад.</p>

engine-iq-campaign-report-summary-heading = Підсумок

engine-iq-campaign-report-th-recording = Запис

engine-iq-campaign-report-th-front-end = Вхідний тракт

engine-iq-campaign-report-th-design = Проєкт

engine-iq-campaign-report-th-satellites = Супутники

engine-iq-campaign-report-th-mean-availability = Середня доступність

engine-iq-campaign-report-th-events-lost = Втрачені події

engine-iq-campaign-report-th-median-reacq = Медіанне повторне захоплення (s)

engine-iq-campaign-report-th-pass = Пройдено

engine-iq-campaign-report-th-fail = Не пройдено

engine-iq-campaign-report-degradation-heading = Погіршення C/N0 залежно від вказаного J/S

engine-iq-campaign-report-scorecard-heading = Картка оцінок

engine-iq-campaign-report-scorecard-note-nwpr = <p class="meta">Ті самі рядки, що й у <code>scorecard.csv</code>. Повторне захоплення вимірюється від зміщення події; перерва вимірюється від втрати захоплення. Стовпець C/N0 і криві погіршення використовують оцінку NWPR (занижує приблизно на 8 dB · Bn·T за власного джиттера контуру, тож її показники залежать від проєкту контуру); обидві оцінки є в <code>scorecard.json</code>.</p>

engine-iq-campaign-report-scorecard-note-m2m4 = <p class="meta">Ті самі рядки, що й у <code>scorecard.csv</code>. Повторне захоплення вимірюється від зміщення події; перерва вимірюється від втрати захоплення. Стовпець C/N0 і криві погіршення використовують оцінку M2M4 (нечутлива до власного джиттера контуру); обидві оцінки є в <code>scorecard.json</code>.</p>

engine-iq-campaign-report-th-sat = Суп.

engine-iq-campaign-report-th-scope = Область

engine-iq-campaign-report-th-event = Подія

engine-iq-campaign-report-th-avail = Дост.

engine-iq-campaign-report-th-loss = Втрата (s)

engine-iq-campaign-report-th-js-at-loss = J/S за втрати

engine-iq-campaign-report-th-reacq = Повт. захоплення (s)

engine-iq-campaign-report-th-outage = Перерва (s)

engine-iq-campaign-report-th-cn0 = C/N0

engine-iq-campaign-report-th-pll = PLL σ (°)

engine-iq-campaign-report-th-dll = DLL σ (chip)

engine-iq-campaign-report-th-false-locks = Хибні захоплення

engine-iq-campaign-report-th-verdict = Вердикт

engine-iq-campaign-report-scope-run = прогін

engine-iq-campaign-report-scope-event = подія

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

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

engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C data PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C pilot PRN { $prn }

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

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

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

engine-lunar-jamming-chart-y-title = J/S (dB)

engine-lunar-jamming-chart-locked = LOCKED

engine-lunar-jamming-chart-degraded = DEGRADED

engine-lunar-jamming-chart-lost = LOST

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-chart-zero-east = 0° E

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

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

engine-quantum-faults-chart-title = quantum-anomaly-detect AUC (MODELLED)

engine-quantum-nav-od-chart-title = quantum-gnss-free-nav (MODELLED)

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

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

engine-receiver-trust-machines-imu-fit-id-provenance-bias-va-gyro =
    { "[" }{ $table }]
    id = { $id }
    provenance = { $provenance }
    bias = { $bias }
    q_va = { $q_va }
    gyro_bias = { $gyro_bias }
    q_arw = { $q_arw }
    bias_instability = { $bias_instability }{ "\u000A" }

engine-resilience-report-title = Самооцінка стійкості PNT

engine-resilience-report-status-partner = PARTNER

engine-resilience-report-summary = <p>Рушій { $engine }, сценарій { $scenario }, зерно (seed) { $seed }. Розподіл доказів: { $n_validated } { $validated } / { $n_modelled } { $modelled } підоцінок. Орієнтовний рівень RPCF: { $level } ({ $level_basis }).</p>

engine-resilience-report-h-rpcf = Категорії методів DHS RPCF

engine-resilience-report-h-rdrr = Функції RethinkPNT

engine-resilience-report-h-yang = Критерії Yang

engine-resilience-report-th-category = Категорія

engine-resilience-report-th-function = Функція

engine-resilience-report-th-criterion = Критерій

engine-resilience-report-th-subscore = Підоцінка

engine-resilience-report-th-status = Стан

engine-resilience-report-th-basis = Підстава

engine-resilience-report-integrity = <p>Цілісність SHA-256: <code>{ $integrity }</code></p>

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

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

engine-study-summary = дослідження «{ $title }»: сценаріїв — { $n_scenarios }

engine-study-metric-holdover = Holdover (s)

engine-study-metric-timing-rms = RMS синхронізації часу (ns)

engine-study-metric-timing-p95 = p95 синхронізації часу (ns)

engine-study-metric-resilience-slope = Нахил стійкості (ns/s)

engine-study-metric-availability = Доступність

engine-study-metric-integrity = Цілісність

engine-study-metric-security = Безпека

engine-study-th-metric = Метрика

engine-study-th-validation = Валідація

engine-study-not-applicable-no-attack = н/д (без атаки)

engine-study-page-title = { $title } — дослідження Kshana

engine-study-eyebrow = क्षण · the precise instant

engine-study-h-comparison = Порівняння поруч

engine-study-tier-note = Кожну характеристику позначено { $validated } (перевірено за зовнішнім оракулом) або { $modelled } (з перших принципів, перевірено внутрішньо), виведено з матриці верифікації. Стовпці — незалежні сценарії; значення не нормалізовано між сценаріями.

engine-study-footer = Створено Kshana { $version } як зведене дослідження сценаріїв: { $n_scenarios }. Кожен сценарій відтворюється за своїм сценарієм + зерном (seed) + версією рушія. Вільне програмне забезпечення з відкритим кодом (AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">джерельний код і документація</a>.

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

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

engine-timetransfer-chain-chart-title = quantum-time-transfer (MODELLED)

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-compliance-fw-dhs-rpcf-title = US DHS Resilient PNT Conformance Framework

engine-compliance-fw-imo-ships-title = IMO guidance on GNSS interference for ships

engine-compliance-fw-easa-aviation-title = EASA guidance on GNSS interference for aviation

engine-compliance-fw-nis2-art21-title = EU NIS2 Directive, Article 21 risk-management measures

engine-compliance-fw-en-16803-title = EN 16803, GNSS-based positioning for road ITS

engine-compliance-fw-nist-ir-8323r1-title = NIST IR 8323r1, Foundational PNT Profile

engine-compliance-source-dhs-rpcf-1-title = Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework

engine-compliance-source-dhs-rpcf-1-version = Версія 2.0, 26 квітня 2022 року (Директорат науки і технологій DHS разом із CISA)

engine-compliance-source-dhs-rpcf-1-checked = документ прочитано повністю; цільову сторінку публікації не завантажували

engine-compliance-source-imo-ships-1-title = Deliberate interference with the United States Global Positioning System and other global navigation satellite systems

engine-compliance-source-imo-ships-1-version = IMO MSC.1/Circ.1644, 18 жовтня 2021 року

engine-compliance-source-imo-ships-1-checked = текст прочитано повністю з цього стороннього дзеркала циркуляра, а не з сайту IMO; авторитетну копію шукайте в бібліотеці документів IMO

engine-compliance-source-imo-ships-2-title = Worldwide Radionavigation System

engine-compliance-source-imo-ships-2-version = Резолюція Асамблеї IMO A.1046(27), прийнята 30 листопада 2011 року

engine-compliance-source-imo-ships-2-checked = документ прочитано повністю

engine-compliance-source-imo-ships-3-title = Performance standards for multi-system shipborne radionavigation receivers

engine-compliance-source-imo-ships-3-version = IMO MSC.401(95), прийнята 8 червня 2015 року (зі змінами MSC.432(98), 2017)

engine-compliance-source-imo-ships-3-checked = оригінальну резолюцію прочитано повністю; текст поправки 2017 року не читали. Жодного циркуляра IMO щодо завад GNSS пізнішого за MSC.1/Circ.1644 не знайдено; новіші шукайте в бібліотеці документів IMO

engine-compliance-source-easa-aviation-1-title = Global Navigation Satellite System Outage and Alterations Leading to Communication / Navigation / Surveillance Degradation

engine-compliance-source-easa-aviation-1-version = Інформаційний бюлетень безпеки EASA SIB 2022-02R4, виданий 3 липня 2026 року, виправлений 22 липня 2026 року (інформаційний, не обов'язковий)

engine-compliance-source-easa-aviation-1-checked = редакцію 4 прочитано повністю; розділи цитовано за заголовками, бо бюлетень не нумерує свої рекомендації. Повторно перевірено 2026-10-10: PDF бюлетеня, сторінка інструмента EASA AD (яка вказує, що його заміщення немає) і сторінка EASA про GNSS не називають жодної пізнішої редакції та жодного бюлетеня з номером 2026-07; банера з редакцією 2 бюлетеня SIB 2026-07 не знайдено, тож питання відкрите і його слід перевірити на чинній сторінці EASA. Бюлетені інформації про зони конфлікту не відкривали

engine-compliance-source-nis2-art21-1-title = Directive (EU) 2022/2555 on measures for a high common level of cybersecurity across the Union (NIS 2 Directive)

engine-compliance-source-nis2-art21-1-version = OJ L 333, 27.12.2022, с. 80-152

engine-compliance-source-nis2-art21-1-checked = літери пунктів статті 21 прочитано з підсумку сторінки EUR-Lex, і вони збігаються з опублікованим текстом; перед тим як посилатися на літеру в поданні, звірте її зі сторінкою

engine-compliance-source-en-16803-1-version = EN 16803-1:2020 (каталог: чинний з 2 жовтня 2020 року, замінює видання 2016 року)

engine-compliance-source-en-16803-1-checked = лише текст сфери застосування з каталогу; стандарт платний і його не читали

engine-compliance-source-en-16803-2-version = EN 16803-2:2020 (каталог: чинний з 2 жовтня 2020 року)

engine-compliance-source-en-16803-2-checked = лише текст сфери застосування з каталогу; стандарт платний і його не читали

engine-compliance-source-en-16803-3-version = EN 16803-3:2020 (каталог: чинний з 2 жовтня 2020 року)

engine-compliance-source-en-16803-3-checked = лише текст сфери застосування з каталогу; стандарт платний і його не читали. Текст каталогу називає за номером лише пункт 6 (записані й імітовані сигнали) і додаток A (високорівнева класифікація атак) і більше нічого; каталог не вказує назви комітету, тому тут її не наведено

engine-compliance-source-nist-ir-8323r1-1-title = Foundational PNT Profile: Applying the Cybersecurity Framework for the Responsible Use of Positioning, Navigation, and Timing (PNT) Services

engine-compliance-source-nist-ir-8323r1-1-version = NIST IR 8323r1, січень 2023 року (внутрішній звіт NIST)

engine-compliance-source-nist-ir-8323r1-1-checked = PDF завантажено 2026-10-18 (SHA-256 записано в tests/fixtures/compliance/headings.json), а його таблиці профілю 3-25 прочитано для цитованих підкатегорій; інші розділи, додатки та цільову сторінку публікації не читали. Ідентифікатори підкатегорій відповідають власним таблицям профілю, які використовують ідентифікатори Cybersecurity Framework 1.1

engine-compliance-cap-receiver-log-trust-name = Оцінка довіри до журналу приймача

engine-compliance-cap-receiver-log-trust-output = стан довіри на кожну епоху за власним журналом реального приймача, моменти тривог і збіг із подіями, визначеними до прогону

engine-compliance-cap-jamming-effects-name = Вплив глушіння за енергетичним бюджетом лінії

engine-compliance-cap-jamming-effects-output = відношення несівної до спектральної щільності шуму та стан захоплення за кожним супутником за вказаної геометрії глушника

engine-compliance-cap-spoofing-detection-name = Виявлення спуфінгу та міконінгу (meaconing)

engine-compliance-cap-spoofing-detection-output = рішення детекторів і розрізнювальна здатність детекторів за вказаної атаки спуфінгу

engine-compliance-cap-integrity-monitoring-name = Моніторинг цілісності та рівні захисту

engine-compliance-cap-integrity-monitoring-output = рівні захисту, доступність відносно меж тривоги та результати виявлення відмов

engine-compliance-cap-holdover-name = Holdover та утримання за інерцією

engine-compliance-cap-holdover-output = зростання похибки положення або часу за відмови GNSS відносно вказаного порогу

engine-compliance-cap-source-diversity-name = Альтернативні та різнорідні джерела PNT

engine-compliance-cap-source-diversity-output = навігаційні або часові характеристики від джерел, незалежних від основного діапазону GNSS

engine-compliance-cap-resilience-scoring-name = Оцінювання стійкості за ансамблями загроз

engine-compliance-cap-resilience-scoring-output = співвідношення виживання та стійкості за кожним вектором загрози в межах вказаного ансамблю, із зазначеними припущеннями

engine-compliance-cap-run-provenance-name = Відтворюване походження прогону

engine-compliance-cap-run-provenance-output = хеш сценарію, версія рушія та зерно (seed) у кожному результаті, щоб прогін можна було повторити

engine-compliance-req-dhs-s5-2-reference = Розділ 5.2 (запобігання, реагування, відновлення)

engine-compliance-req-dhs-s5-2-asks = Стійкість описано як три функції: запобігання шкоді, реагування (виявлення, повідомлення, пом'якшення, стримування) та відновлення. Виявлення є ймовірнісним, тому важливі і хибні тривоги, і пропущені виявлення.

engine-compliance-req-dhs-s5-2-gap = Запобігання є властивістю проєктування продукту, яку не показує жоден результат симуляції. Статистика виявлення із синтетичного або односеансового прогону не є виміряною частотою хибних тривог чи пропусків для продукту в експлуатації.

engine-compliance-req-dhs-l1-r1-reference = Рівень 1, вимога 1

engine-compliance-req-dhs-l1-r1-asks = Перевіряти, що збережені дані із зовнішніх джерел відповідають форматам і діапазонам значень відповідних стандартів.

engine-compliance-req-dhs-l1-r1-gap = Властивість забезпечення якості програмного забезпечення та перевірки вхідних даних для продукту, що тестується. Kshana не перевіряє обробку вхідних даних продуктом.

engine-compliance-req-dhs-l1-r2-reference = Рівень 1, вимога 2

engine-compliance-req-dhs-l1-r2-asks = Допускати повне ручне відновлення очищенням або скиданням пам'яті, повертаючи систему до визначених характеристик після зникнення загрози.

engine-compliance-req-dhs-l1-r2-gap = Журнал приймача показує, коли визначення перестало бути довіреним і коли відновилося; він не показує, що ручне скидання очищує кожен збережений стан.

engine-compliance-req-dhs-l1-r3-reference = Рівень 1, вимога 3

engine-compliance-req-dhs-l1-r3-asks = Безпечно перезавантажувати або оновлювати вбудоване програмне забезпечення.

engine-compliance-req-dhs-l1-r3-gap = Безпека оновлення вбудованого програмного забезпечення лежить поза тим, що спостерігає будь-який результат Kshana.

engine-compliance-req-dhs-l2-r4-reference = Рівень 2, вимога 4

engine-compliance-req-dhs-l2-r4-asks = Виявляти скомпрометовані джерела PNT і не допускати, щоб вони спотворювали розв'язок.

engine-compliance-req-dhs-l2-r4-gap = Kshana оцінює детектори та монітори, які моделює або запускає над журналом; чи працює власне виключення джерел у продукті, потребує внутрішнього стану продукту, а не лише його журналу.

engine-compliance-req-dhs-l2-r5-reference = Рівень 2, вимога 5

engine-compliance-req-dhs-l2-r5-asks = Автоматично відновлювати джерела та систему без переривання виводу; розв'язок надається і під час загрози, можливо з необмеженим погіршенням.

engine-compliance-req-dhs-l2-r5-gap = Прогони holdover обмежують змодельований дрейф для вказаної моделі годинника або інерціальної моделі, а не власну поведінку продукту під час відновлення.

engine-compliance-req-dhs-l3-r6-reference = Рівень 3, вимога 6

engine-compliance-req-dhs-l3-r6-asks = Спотворені дані від одного джерела не повинні забруднювати інше джерело.

engine-compliance-req-dhs-l3-r6-gap = Kshana запускає джерела поряд; ізоляція джерел усередині продукту потребує огляду проєкту або введення відмов у продукт.

engine-compliance-req-dhs-l3-r7-reference = Рівень 3, вимога 7

engine-compliance-req-dhs-l3-r7-asks = Перехресно перевіряти розв'язки всіх джерел і тримати погіршення під час загрози в межах.

engine-compliance-req-dhs-l3-r7-gap = Обмежене погіршення показано для змодельованих датчиків; власну перехресну перевірку продукту не спостерігають.

engine-compliance-req-dhs-l4-r8-reference = Рівень 4, вимога 8

engine-compliance-req-dhs-l4-r8-asks = Використовувати джерела різних технологій проти загроз спільного режиму без погіршення під час загрози.

engine-compliance-req-dhs-l4-r8-gap = Аргумент щодо спільного режиму потребує набору джерел реального продукту та загрози, що охоплює їх усі; сценарій задає одну таку загрозу, але не доводить, що в продукту немає спільної слабкості.

engine-compliance-req-dhs-s5-5-reference = Розділ 5.5 (спільний режим)

engine-compliance-req-dhs-s5-5-asks = Різнорідні механізми не повинні мати спільної слабкості: наприклад, глушник, що охоплює два діапазони, зводить нанівець різноманіття діапазонів.

engine-compliance-req-dhs-s5-5-gap = Оцінювання використовує синтетичний ансамбль загроз, про що сказано прямо; це не польові дані.

engine-compliance-req-dhs-s8-1-8-3-reference = Розділи 8.1-8.3 (оцінювання)

engine-compliance-req-dhs-s8-1-8-3-asks = Оцінювання поєднує статичний аналіз із динамічним, де тестові вектори замінюють загрози; класи тестів — відмова джерела, завади та внутрішні відмови. Симулятори названо методом тестування.

engine-compliance-req-dhs-s8-1-8-3-gap = Експортований рух і події можуть керувати лабораторним симулятором (docs/TEST-BENCH.md). Kshana не записує жодного сигналу, тож загрозу забезпечують симулятор і його уповноважений оператор.

engine-compliance-req-dhs-s8-6-reference = Розділ 8.6 (елементи плану тестування)

engine-compliance-req-dhs-s8-6-asks = План тестування вказує рівень, вимогу, вхідні дані, еталони, потрібний доступ до даних, процедуру з критеріями PASS або FAIL, результати та примітки.

engine-compliance-req-dhs-s8-6-gap = Критерії успіху чи неуспіху обирає оцінювач; Kshana записує вхідні дані, пороги та хеші, з якими працювала.

engine-compliance-req-imo-1644-3-reference = MSC.1/Circ.1644, пункт 3

engine-compliance-req-imo-1644-3-asks = Навмисні завади GNSS є суттєвим ризиком для безпеки навігації, людей, майна та довкілля.

engine-compliance-req-imo-1644-3-gap = Це твердження про ризик; Kshana кількісно оцінює вплив для вказаної геометрії, а не ризик у морському районі.

engine-compliance-req-imo-1644-5-reference = MSC.1/Circ.1644, пункт 5

engine-compliance-req-imo-1644-5-asks = Державам-членам пропонується обмежувати завади зі своєї території, розглядати попередження для мореплавців і розглядати заходи проти несанкціонованих передач.

engine-compliance-req-imo-1644-5-gap = Звернено до держав і адміністрацій; жоден результат симуляції цього не стосується.

engine-compliance-req-imo-a1046-3-reference = Резолюція A.1046(27), пункт 3 додатка (входи в гавані, підходи до гаваней і прибережні води)

engine-compliance-req-imo-a1046-3-asks = Систему вважають доступною лише доти, доки вона забезпечує вказану цілісність за вказаної точності, з оновленням із вказаною частотою та з попередженням про цілісність протягом вказаного часу.

engine-compliance-req-imo-a1046-3-gap = Kshana обчислює рівні захисту та доступність відносно межі тривоги для змодельованої геометрії; значення точності, доступності та часу попередження з резолюції тут не стверджуються.

engine-compliance-req-imo-a1046-2-reference = Резолюція A.1046(27), пункт 2 додатка (води океану)

engine-compliance-req-imo-a1046-2-asks = Вимоги до точності, частоти оновлення, доступності та попередження про цілісність радіонавігаційної системи на океанській фазі.

engine-compliance-req-imo-a1046-2-gap = Як вище, для океанської фази.

engine-compliance-req-imo-401-3-1-reference = MSC.401(95), 3.1-3.2

engine-compliance-req-imo-401-3-1-asks = Приймач використовує цивільні сигнали щонайменше двох незалежних систем і видає розв'язок положення, швидкості та часу з потрібними стійкістю та цілісністю.

engine-compliance-req-imo-401-3-1-gap = Цілісність за кількох орбітальних угруповань змодельовано; фактичне використання приймачем двох систем є тестом продукту.

engine-compliance-req-imo-401-3-11-reference = MSC.401(95), 3.11-3.14

engine-compliance-req-imo-401-3-11-asks = Приймач оцінює точність і цілісність для кожної навігаційної фази, подає застереження, коли не може, попереджає, коли новий розв'язок не надходить вчасно, і показує останнє правдоподібне значення з явним станом.

engine-compliance-req-imo-401-3-11-gap = Kshana зчитує синхронізацію часу та довіру з журналу; чи збігаються відображені інтервали застережень і попереджень зі стандартом, залежить від інтерфейсу користувача приймача, якого журнал не показує.

engine-compliance-req-imo-401-3-16-reference = MSC.401(95), 3.15-3.16

engine-compliance-req-imo-401-3-16-asks = Показувати стан доповнення, а також положення, курс, швидкість, час і використані джерела.

engine-compliance-req-imo-401-3-16-gap = Вимоги до відображення; жоден результат Kshana їх не стосується.

engine-compliance-req-imo-401-4-2-reference = MSC.401(95), 4.2

engine-compliance-req-imo-401-4-2-asks = Задовільно працювати за звичайних умов завад, відповідно до резолюції A.694(17) (загальні вимоги до суднового радіообладнання) та типового бортового й зовнішнього радіосередовища. Це не вимога протидії глушінню чи спуфінгу.

engine-compliance-req-imo-401-4-2-gap = Тестування за звичайних завад є лабораторним вимірюванням приймача; саму резолюцію A.694(17) не читали.

engine-compliance-req-easa-desc-reference = SIB 2022-02R4, опис

engine-compliance-req-easa-desc-asks = Спуфінг важче виявити, і він небезпечніший за глушіння; кабіна екіпажу не має сповіщення, яке розрізняло б ці два явища; наслідки варіюються від хибних сповіщень про рельєф до спотворених даних спостереження і можуть зберігатися після виходу з району.

engine-compliance-req-easa-desc-gap = Kshana моделює вплив на детектори та лінію; сповіщення в кабіні є властивістю обладнання.

engine-compliance-req-easa-mfr-reference = SIB 2022-02R4, рекомендація(ї): виробникам повітряних суден і обладнання, слід

engine-compliance-req-easa-mfr-asks = Оцінювати вплив глушіння та спуфінгу на продукт, зокрема сукупний вплив, і надавати операторам настанови щодо розпізнавання підозрюваного спуфінгу та експлуатаційних обмежень у разі втрати GNSS.

engine-compliance-req-easa-mfr-gap = Оцінювання самого продукту належить виробнику; Kshana надає повторюваний сценарій і оцінений журнал приймача як докази в ньому.

engine-compliance-req-easa-ops-spoof-reference = SIB 2022-02R4, рекомендація(ї): авіаційним операторам слід (спуфінг)

engine-compliance-req-easa-ops-spoof-asks = Порівнювати положення та час GNSS із джерелами, не пов'язаними з GNSS, і стежити за показником невизначеності положення та навігаційними засобами, щоб помітити спуфінг.

engine-compliance-req-easa-ops-spoof-gap = Експлуатаційна процедура та навчання лежать поза результатами симуляції.

engine-compliance-req-easa-ansp-reference = SIB 2022-02R4, рекомендація(ї): постачальникам ATM/ANS слід; організаціям, залученим до проєктування чи виробництва обладнання ATM/ANS, слід

engine-compliance-req-easa-ansp-asks = Оцінювати вплив втрати синхронізації часу GNSS на системи зв'язку, навігації та спостереження, зберігати наземні навігаційні засоби та допомагати виявляти завади.

engine-compliance-req-easa-ansp-gap = Прогони holdover синхронізації часу стосуються оцінювання втрати часу; проєктування наземних систем і процедури не охоплено.

engine-compliance-req-easa-report-reference = SIB 2022-02R4, рекомендація(ї): завершальні нагадування щодо звітування

engine-compliance-req-easa-report-asks = Повідомляти про події, що впливають на безпеку, згідно з регламентом про звітування про події, а про підозрюваний спуфінг і глушіння з вищим ризиком повідомляти виробнику.

engine-compliance-req-easa-report-gap = Обов'язок звітування; жоден результат його не стосується.

engine-compliance-req-nis2-21-1-reference = Стаття 21(1)

engine-compliance-req-nis2-21-1-asks = Вживати пропорційних технічних, операційних та організаційних заходів для управління ризиками для мереж та інформаційних систем з урахуванням сучасного рівня, піддатливості, розміру, а також імовірності та тяжкості інцидентів.

engine-compliance-req-nis2-21-1-gap = Kshana стосується лише залежності системи від позиціонування та часу, а не інформаційної безпеки загалом.

engine-compliance-req-nis2-21-2-a-reference = Стаття 21(2)(a)

engine-compliance-req-nis2-21-2-a-asks = Політики аналізу ризиків і безпеки інформаційних систем.

engine-compliance-req-nis2-21-2-a-gap = Підтримує докази для частини аналізу ризиків, що стосується PNT (supports evidence for); сама політика є організаційною.

engine-compliance-req-nis2-21-2-b-reference = Стаття 21(2)(b)

engine-compliance-req-nis2-21-2-b-asks = Опрацювання інцидентів.

engine-compliance-req-nis2-21-2-b-gap = Оцінений журнал приймача допомагає датувати початок і кінець інциденту із завадами PNT; процес опрацювання є організаційним.

engine-compliance-req-nis2-21-2-c-reference = Стаття 21(2)(c)

engine-compliance-req-nis2-21-2-c-asks = Безперервність діяльності, зокрема керування резервними копіями, аварійне відновлення та кризове управління.

engine-compliance-req-nis2-21-2-c-gap = Показує, як довго змодельований резерв утримує межу часу чи положення; плани безперервності є організаційними.

engine-compliance-req-nis2-21-2-d-reference = Стаття 21(2)(d)

engine-compliance-req-nis2-21-2-d-asks = Безпека ланцюга постачання, зокрема відносини з прямими постачальниками.

engine-compliance-req-nis2-21-2-d-gap = Kshana не оцінює постачальників. Використання нейтрального, відтворюваного стенда (bench) для приймання приймачів є одним із вхідних даних, які може використати покупець, а не оцінюванням ланцюга постачання.

engine-compliance-req-nis2-21-2-e-reference = Стаття 21(2)(e)

engine-compliance-req-nis2-21-2-e-asks = Безпека під час придбання, розроблення та супроводу систем, зокрема опрацювання вразливостей і їх розкриття.

engine-compliance-req-nis2-21-2-e-gap = Повторювані приймальні випробування поведінки приймача за завад підтримують докази для частини придбання (supports evidence for); опрацювання вразливостей лежить поза ними.

engine-compliance-req-nis2-21-2-f-reference = Стаття 21(2)(f)

engine-compliance-req-nis2-21-2-f-asks = Політики та процедури оцінювання ефективності заходів управління ризиками кібербезпеки.

engine-compliance-req-nis2-21-2-f-gap = Хешовані, повторювані прогони та події, визначені до оцінювання, підтримують докази для перевірки ефективності (supports evidence for); політика та її графік є організаційними.

engine-compliance-req-nis2-21-2-ghij-reference = Стаття 21(2)(g)-(j)

engine-compliance-req-nis2-21-2-ghij-asks = Кібергігієна та навчання; криптографія та шифрування; безпека людських ресурсів, контроль доступу та управління активами; багатофакторна автентифікація та захищений зв'язок.

engine-compliance-req-nis2-21-2-ghij-gap = Не може бути охоплено результатами прогонів позиціонування та часу.

engine-compliance-req-nis2-21-3-reference = Стаття 21(3)

engine-compliance-req-nis2-21-3-asks = Обираючи заходи для ланцюга постачання, враховувати вразливості кожного постачальника, а також якість і безпечну розробку його продуктів.

engine-compliance-req-nis2-21-3-gap = Див. статтю 21(2)(d).

engine-compliance-req-en16803-1-reference = EN 16803-1 (визначення та процедури системної інженерії)

engine-compliance-req-en16803-1-asks = Визначає архітектуру дорожніх ІТС, характеристики та метрики продуктивності й метод порівняння тестових середовищ. Не встановлює вимог.

engine-compliance-req-en16803-1-gap = Номери пунктів не видно публічно. Власник ліцензії має зіставити поля результатів Kshana з визначеннями метрик.

engine-compliance-req-en16803-2-reference = EN 16803-2 (базова продуктивність терміналів на основі GNSS)

engine-compliance-req-en16803-2-asks = Лабораторні процедури тестування на основі відтворення для доступності, безперервності, точності, цілісності та часу до першого визначення вихідного положення. Не встановлює мінімальних значень.

engine-compliance-req-en16803-2-gap = Експортований рух Kshana може керувати відтворенням; процедура стандарту, його обробка записаних сигналів і обчислення метрик тут не відтворені та потребують ліцензованого тексту.

engine-compliance-req-en16803-3-6-reference = EN 16803-3, пункт 6

engine-compliance-req-en16803-3-6-asks = Розрізняє записані та імітовані сигнали в тестах безпеки.

engine-compliance-req-en16803-3-6-gap = Kshana не записує і не імітує сигнал. Вона експортує рух і події та оцінює журнал приймача.

engine-compliance-req-en16803-3-a-reference = EN 16803-3, додаток A

engine-compliance-req-en16803-3-a-asks = Високорівнева класифікація атак на GNSS: завади, глушіння, міконінг (meaconing) і спуфінг.

engine-compliance-req-en16803-3-a-gap = Сценарії Kshana називають класи атак такими самими загальними термінами; зіставлення на рівні пунктів потребує ліцензованого додатка.

engine-compliance-req-nist-id-ra-1-reference = ID.RA-1 (оцінювання ризиків)

engine-compliance-req-nist-id-ra-1-asks = Виявляти, документувати та повідомляти про вразливості системи PNT і того, що розповсюджує дані PNT; де безпечно, перевіряти чутливість до збою чи маніпуляції, що може використовувати симуляцію сигналів PNT, у межах закону та безперервності діяльності.

engine-compliance-req-nist-id-ra-1-gap = Kshana характеризує чутливість у змодельованих сценаріях і в записаному журналі приймача. Інвентаризація вразливостей реальної системи належить оператору, а будь-яке радіочастотне випробування проводять власним обладнанням і з дозволу оператора: Kshana нічого не передає.

engine-compliance-req-nist-id-ra-3-reference = ID.RA-3 (оцінювання ризиків)

engine-compliance-req-nist-id-ra-3-asks = Виявляти та документувати внутрішні й зовнішні загрози для PNT: від природних і ненавмисних збоїв до навмисної атаки, як-от глушіння, спуфінг і атаки із затримкою.

engine-compliance-req-nist-id-ra-3-gap = Сценарії задають загрози та їх наслідки. Задокументована оцінка загроз для власного майданчика й системи користувача складається користувачем; жоден сценарій не є доказом того, що загроза там існує.

engine-compliance-req-nist-id-ra-4-reference = ID.RA-4 (оцінювання ризиків)

engine-compliance-req-nist-id-ra-4-asks = Визначати потенційні наслідки та імовірності; для кожної загрози вказувати масштаб впливу, як проявляється похибка (стрибок чи наростання), пороги виявлення та що похибка спричиняє далі.

engine-compliance-req-nist-id-ra-4-gap = Прогони дають значення впливу (зростання похибки, рівні захисту, вплив на лінію) для змодельованих датчиків і вказаної загрози. Імовірності не обчислюються, а змодельований вплив не є виміряним.

engine-compliance-req-nist-id-ra-5-reference = ID.RA-5 (оцінювання ризиків)

engine-compliance-req-nist-id-ra-5-asks = Використовувати загрози, вразливості, імовірності та наслідки для оцінювання ризику й повторно оцінювати його періодично та за зміни системи чи загрози.

engine-compliance-req-nist-id-ra-5-gap = Оцінювання використовує синтетичний ансамбль загроз, про що сказано прямо. Хешовані, повторювані прогони роблять повторне оцінювання порівнянним; судження про ризик і його графік є організаційними.

engine-compliance-req-nist-pr-ds-6-reference = PR.DS-6 (безпека даних)

engine-compliance-req-nist-pr-ds-6-asks = Перевіряти цілісність даних PNT, коли джерела розходяться, наприклад перехресною перевіркою кількох частот, орбітальних угруповань або незалежних джерел.

engine-compliance-req-nist-pr-ds-6-gap = Kshana обчислює рівні захисту та результати перехресної перевірки джерел для змодельованої геометрії та датчиків; перевірки цілісності всередині продукту не спостерігають.

engine-compliance-req-nist-pr-ip-10-reference = PR.IP-10 (процеси та процедури захисту інформації)

engine-compliance-req-nist-pr-ip-10-asks = Тестувати плани реагування та відновлення; для системи з резервним джерелом часу вилучити основне джерело й підтвердити, що точність часу, стрибки та наростання залишаються в межах вказаних вимог до годинника.

engine-compliance-req-nist-pr-ip-10-gap = Прогін holdover моделює вилучення й перевіряє похибку відносно вказаного порогу; оцінений журнал приймача показує реальну втрату та відновлення. Випробування на власному сервері часу оператора та будь-яке радіочастотне випромінювання для нього належать оператору.

engine-compliance-req-nist-pr-pt-5-reference = PR.PT-5 (захисна технологія)

engine-compliance-req-nist-pr-pt-5-asks = Використовувати механізми стійкості за звичайних і несприятливих умов: відхиляти погані сигнали та дані й поєднувати holdover із виявленням аномалій, надлишковими або комплексованими джерелами та відновленням.

engine-compliance-req-nist-pr-pt-5-gap = Показано змодельовані механізми та їх межі; чи реалізує їх продукт, є тестом продукту.

engine-compliance-req-nist-de-ae-2-reference = DE.AE-2 (аномалії та події)

engine-compliance-req-nist-de-ae-2-asks = Аналізувати виявлені події PNT у реальному часі та згодом (джерело, статистика похибок, тривалість, частота, місце), відрізняти шкідливі події від нормальної роботи та зберігати необроблені дані й аналіз.

engine-compliance-req-nist-de-ae-2-gap = Kshana оцінює записаний журнал постфактум і зберігає хеші того, з чим працювала. Вона не локалізує й не атрибутує джерело завад і не здійснює моніторинг у реальному часі як послугу.

engine-compliance-req-nist-de-ae-3-reference = DE.AE-3 (аномалії та події)

engine-compliance-req-nist-de-ae-3-asks = Збирати та співвідносити дані подій із кількох джерел і датчиків, а також перехресно перевіряти дані PNT більш ніж з одного джерела, щоб виявити аномальну поведінку.

engine-compliance-req-nist-de-ae-3-gap = Монітори Kshana перехресно перевіряють потоки одного журналу приймача чи одного сценарію; співвіднесення між власними датчиками й журналами оператора належить оператору.

engine-compliance-req-nist-de-ae-4-reference = DE.AE-4 (аномалії та події)

engine-compliance-req-nist-de-ae-4-asks = Визначати вплив подій на дані PNT і на застосунки, що від них залежать, зокрема рідкісних подій.

engine-compliance-req-nist-de-ae-4-gap = Вплив показано на виході PNT прогону чи журналу. Вплив на конкретний застосунок нижчого рівня потребує власних вимог цього застосунку.

engine-compliance-req-nist-de-ae-5-reference = DE.AE-5 (аномалії та події)

engine-compliance-req-nist-de-ae-5-asks = Задавати та документувати пороги сповіщення про інциденти на підставі допусків похибки й невизначеності, потрібних застосунку, з часом сповіщення.

engine-compliance-req-nist-de-ae-5-gap = Прогони оцінюють відносно порогів, які задає користувач, і записують їх. Вибір порогів і процедури сповіщення належить користувачеві.

engine-compliance-req-nist-de-cm-1-reference = DE.CM-1 (безперервний моніторинг безпеки)

engine-compliance-req-nist-de-cm-1-asks = Відстежувати джерела та виходи PNT відносно базових рівнів для виявлення аномалій, використовуючи різнорідні джерела та виявлення й виключення відмов, і перевіряти, що моніторинг охоплює визначені режими відмов.

engine-compliance-req-nist-de-cm-1-gap = Kshana запускає й оцінює такі монітори на журналах і сценаріях. Безперервний моніторинг чинної системи та охоплення кожного режиму відмов продукту набір прогонів не показує.

engine-compliance-req-nist-de-dp-3-reference = DE.DP-3 (процеси виявлення)

engine-compliance-req-nist-de-dp-3-asks = Перевіряти, що виявлення подій працює як задумано, періодично та після оновлень, відносно поточних профілів загроз.

engine-compliance-req-nist-de-dp-3-gap = Повторювані, хешовані сценарії та події, визначені до оцінювання, підтримують докази для такого тесту (supports evidence for); запуск його на обладнанні оператора за графіком належить оператору.

engine-compliance-req-nist-rs-an-5-reference = RS.AN-5 (аналіз)

engine-compliance-req-nist-rs-an-5-asks = Налаштувати верифікацію та валідацію для відомих режимів відмов і щойно виявлених вразливостей, а також записувати номінальні й аномальні дані PNT з інцидентів для покращення подальшого виявлення.

engine-compliance-req-nist-rs-an-5-gap = Оцінений журнал характеризує один інцидент постфактум. Отримання розкритих вразливостей і реагування на них є процесом поза будь-яким прогоном.

engine-compliance-req-nist-rs-mi-2-reference = RS.MI-2 (пом'якшення)

engine-compliance-req-nist-rs-mi-2-asks = Після стримування інциденту пом'якшувати його альтернативними чи додатковими джерелами PNT, щоб робота тривала, і повернути систему в належний робочий стан.

engine-compliance-req-nist-rs-mi-2-gap = Прогони показують, як довго змодельовані резервні джерела тримають похибку в межах; стримування та повернення до роботи є операційними кроками.

engine-compliance-mapping-header-reference = Посилання

engine-compliance-mapping-header-asks = Що вимагається (переказ)

engine-compliance-mapping-header-capabilities = Результати Kshana, що підтримують докази для цього (supports evidence for)

engine-compliance-mapping-header-gap = Прогалина

engine-compliance-mapping-none = немає

engine-compliance-source-line = **{ $title }**: { $version }. <{ $url }>. Прочитано { $accessed }: { $checked }.

engine-compliance-source-en-16803-1-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 1: Definitions and system engineering procedures for the establishment and assessment of performances

engine-compliance-source-en-16803-2-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 2: Assessment of basic performances of GNSS-based positioning terminals

engine-compliance-source-en-16803-3-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 3: Assessment of security performances of GNSS-based positioning terminals

engine-kind-lunar-ascent-description = MODELLED активний підйом із південно-полярного майданчика на поверхні на орбіту зближення та коваріація положення–швидкості, яку він передає назад на орбіту (клас Artemis). П'ятистанова інерціальна модель похибок по осях із lunar-descent (положення, швидкість, зміщення акселерометра, нахил орієнтації, зміщення гіроскопа; збуджується питомою силою) виконується по всіх трьох осях майданчика від стану на поверхні, з яким починається фаза; визначення положення AFS за видимими ретрансляторами ILLUSTRATIVE угруповання класу LCNS (автономно або диференційно із залишком каналу поправок із lunar-differential-pnt, з підтримкою годинника, коли видно лише три ретранслятори) виконується із зазначеним інтервалом; місячний час входить через годинник апарата і через похибку часової мітки вздовж траєкторії. Подає замкнені в аналітичному вигляді інерціальні джерела, внесок допоміжного засобу, абляцію, 1-сигми навігації протягом підйому, розкид відсічки двигуна поряд зі знанням навігації та повну коваріацію 6x6 у MCI при виведенні із збереженою кореляцією положення–швидкості. MODELLED: ілюстративний клас IMU, питома сила, набір ретрансляторів і розкид відсічки; похибки утримуються в осях майданчика старту; номінальний вихідний стан є замінником. Не схвалено жодним агентством; консультативне програмне забезпечення, не сертифіковане навігаційне обладнання.

engine-kind-lunar-surface-description = MODELLED доступність позиціонування та часу на поверхні за майданчиком і сезоном для південно-полярних майданчиків класу Artemis. Для кожного майданчика й сезону (епоха та вікно після неї) подає позиціонування за ретрансляторами (чотири або більше ретрансляторів ILLUSTRATIVE угруповання класу LCNS у полі зору та PDOP нижче порога — за тими самими функціями, що й у moonlight-service-volume, а з розділом рельєфу — за променево прокресленим горизонтом рельєфу з lunar-station-coverage), чи перебувають Земля й Сонце над горизонтом майданчика (аналітичні Сонце, Місяць і місячна орієнтація з урахуванням лібрації, що й змінюється із сезоном), та доступність часу (ретранслятор або Земля у полі зору) з найдовшим проміжком без обох — holdover, який має витримати годинник на поверхні. Результат для одного майданчика збігається з результатом moonlight-service-volume до біта. MODELLED: ілюстративний кеплерівський набір ретрансляторів на Місяці із середнім обертанням; показник ретрансляторів не змінюється із сезоном; рельєф — вирізка LOLA 1200 m. Не схвалено жодним агентством; консультативне програмне забезпечення, не сертифіковане навігаційне обладнання.

engine-kind-lunar-descent-description = MODELLED бюджет розкиду посадки для активного спуску на південно-полярний майданчик (клас Artemis). По кожній горизонтальній осі п'ятистанова модель інерціальних похибок (положення, швидкість, зміщення акселерометра, нахил орієнтації, зміщення гіроскопа) збуджується питомою силою спуску; послідовний фільтр бере визначення положення від увімкнених допоміжних засобів: визначення AFS за видимими ретрансляторами ILLUSTRATIVE угруповання класу LCNS (автономно або диференційно із залишком каналу поправок із lunar-differential-pnt, з підтримкою годинника, коли видно лише три ретранслятори) та рельєфно-відносне визначення (зіставлювач TERCOM/SITAN крейту на синтетичному рельєфі або межа Крамера–Рао зіставлення вікна висот реальної південно-полярної DEM LOLA). Місячний час входить через годинник апарата в моменти визначень (зсув LTC-TT із lunar-time-offset або невизначеність його опублікованої смуги) і як похибка часової мітки вздовж траєкторії. Подає 3-сигмовий еліпс посадки, R95, замкнені в аналітичному вигляді інерціальні джерела, внесок кожного допоміжного засобу, абляцію кожної комбінації допоміжних засобів, калібрування еліпса методом Монте-Карло та коваріацію, що передається далі. MODELLED: ілюстративний клас IMU, набір ретрансляторів, профіль спуску і член наведення; рельєфна навігація використовує синтетичний рельєф у земному масштабі метра; доступність AFS — одна епоха на плоскій масці. Не схвалено жодним агентством; консультативне програмне забезпечення, не сертифіковане навігаційне обладнання.

engine-kind-lunar-orbit-rendezvous-description = MODELLED відносна навігація для стикування у стилі Orion–посадковий модуль на низькій місячній орбіті або еліптичній полярній орбіті (клас Artemis). Переслідувач і ціль летять тією самою орбітою за силовою моделлю крейту для Місяця; спільна 21-параметрична пакетна оцінка Гаусса–Ньютона за дугою (два стани апаратів і стійкі зміщення сигналу в космосі) поєднує абсолютне визначення положення для кожного апарата за набором ретрансляторів ILLUSTRATIVE класу LCNS (ретранслятори за Місяцем відкидаються, потрібно чотири, синфазна похибка сигналу в космосі взаємно гаситься між апаратами) та міжсупутникову дальність, з прецизійністю вимірювання дальності за межею кодового стеження на пілот-сигналі LunaNet AFS. Подає формальну та Монте-Карло відносну похибку положення й швидкості в осях LVLH цілі, доступність визначень, середню нормовану квадратичну похибку оцінювання порівняно з її очікуваним значенням та будь-яке випробування, ітерація якого не збіглася, дрейф через ігнорування гравітаційних гармонік і повну коваріацію 6x6, що передається далі. Для кругового випадку застосовується замкнена перевірка Хілла/Клессі–Вілтшира. MODELLED: ілюстративний набір ретрансляторів, бюджет похибок і апріорні значення; істина й оцінювач використовують одну силову модель, тож NEES перевіряє самоузгодженість, а не похибку моделі. Не схвалено жодним агентством; консультативне програмне забезпечення, не сертифіковане навігаційне обладнання.

engine-kind-mission-thread-description = MODELLED бюджет похибок навігації та часу для заданого ланцюга фаз місії, від старту до входу в атмосферу: старт і виведення, зближення та стикування на низькій навколоземній орбіті (повторюване), транслунарна ін'єкція і цисмісячний політ, зближення на місячній орбіті, спуск, перебування на поверхні, підйом, повернення та вхід; кожна фаза — один із восьми зареєстрованих видів зі своїми датчиками й фільтром. Коваріація 6x6, годинник і система відліку передаються від фази до фази за заданим правилом (перенести, збільшити або повторно захопити); перетворення систем відліку та шкал часу (GCRF, MCI, MCMF, UTC, TT, TDB, LTC) є окремими рядками бюджету, зі станом Місяця з необов'язкового фрагмента ядра DE440 та аналітичним рядом як заданим запасним варіантом. Необов'язкове накладення наземної мережі задає робоче навантаження стеження для кожної фази. Подає бюджет по фазах (1-сигми на вході, пікові та на виході, кожен внесок з одиницею), запас відносно заданої вимоги, найслабшу ланку, події та рисунок часової лінії. MODELLED: кожне число є заданим входом; ланцюг відповідає одному стеку, жоден апарат не моделюється. Лише публічні джерела; не афілійовано з жодним агентством і не схвалено ним; консультативне програмне забезпечення, не сертифіковане навігаційне обладнання.

engine-e-altpnt-terrain-combined-altpnt-magnetic-grid-replaces = combined-altpnt: `magnetic_grid` замінює синтетичне магнітне поле, тому `magnetic_mascons` має бути порожнім, коли його задано

engine-e-aperture-duty-the-reporting-horizon-must-have = горизонт звітування має мати додатну довжину (horizon_end_s > horizon_start_s)

engine-e-api-figure-tiers-the-result-document = figure_tiers: документ результату не є форматованим об'єктом JSON

engine-e-api-builtins-integrity-reports-one-run-raim = { "[" }integrity] подає RAIM одного прогону поряд із його показниками holdover; потрібно runs = 1

engine-e-araim-reference-the-unmonitored-fault-risk-exhausts = ризик непоміченої відмови вичерпує весь бюджет цілісності; скінченного рівня захисту не існує

engine-e-araim-reference-the-add-v4-subset-rule = правило підмножин ADD v4.2 завжди перелічує пари; max_order має бути >= 2

engine-e-attack-surface-capture-footprint-emitted-no-points = capture_footprint не видав жодної точки

engine-e-bench-cli-scale-is-not-number = --scale не є числом

engine-e-bench-cli-truth-reads-dataset-and-is = `truth` читає набір даних і призначена для завдання a; завдання c і d використовують `cases`

engine-e-bench-cli-task-has-no-sealed-holdout = завдання c не має запечатаного holdout

engine-e-bench-cli-cases-makes-the-files-of = `cases` створює файли завдань c і d; завдання a — це сам набір даних (використайте `truth`)

engine-e-bench-cli-threshold-is-not-number = --threshold не є числом

engine-e-bench-cli-seed-file-is-required = потрібен --seed-file

engine-e-bench-cli-validate-needs-at-least-one = validate потребує щонайменше одного файлу результатів

engine-e-bench-cli-manifest-is-for-task-the = `manifest` призначений для завдання a; інші завдання мають зафіксовані маніфести

engine-e-bench-cli-verify-manifest-needs-one-manifest = verify-manifest потребує одного файлу маніфесту

engine-e-bench-system-name-is-required = потрібне `system.name`

engine-e-bench-tasks-truth-has-no-labels-array = truth не має масиву `labels`

engine-e-bench-tasks-label-has-no-id = мітка не має `id`

engine-e-bench-tasks-label-has-no-positive = мітка не має `positive`

engine-e-bench-tasks-predictions-have-no-scores-object = predictions не мають об'єкта `scores`

engine-e-bench-tasks-the-holdout-is-sealed-pass = holdout запечатано: передайте секрет через --seed-file

engine-e-bench-tasks-task-truth-has-no-truth = truth завдання (c) не має масиву `truth`

engine-e-bench-tasks-task-predictions-have-no-predictions = predictions завдання (c) не мають об'єкта `predictions`

engine-e-bench-tasks-truth-entry-has-no-id = запис truth не має `id`

engine-e-campaign-compare-needs-threshold = compare потребує порога

engine-e-ccsds-tdm-tdm-missing-ccsds-tdm-vers = TDM: відсутній заголовок CCSDS_TDM_VERS

engine-e-cislunar-arc-recovery-the-chief-sits-on-the = головний апарат розташований на Місяці: полярні координати сингулярні

engine-e-clock-log-clock-applies-to-the-rinex = clock застосовується лише до форматів rinex-clk, linuxptp і chrony (TICC використовує channel)

engine-e-clock-log-single-column-timelab-log-needs = одностовпцевому журналу timelab потрібен tau0: заголовок `# tau0 = <s>` або tau0_s

engine-e-clock-log-the-ticc-log-has-no = журнал TICC не містить показань (рядків `<seconds> chA|chB|chC|TI(...)`)

engine-e-conflict-resilience-intensity-grid-unexpectedly-empty = сітка інтенсивності несподівано порожня

engine-e-eo-payload-inclination-deg-must-be-in = inclination_deg має бути в (0, 180) (екваторіальна орбіта не має висхідного вузла)

engine-e-evidence-bundle-its-imprint-is-not-the = його відбиток не є хешем manifest.json цього пакета (токен можна отримати лише після створення пакета: використайте `kshana evidence attach-timestamp`)

engine-e-evidence-cli-pubkey-must-be-32-bytes = --pubkey має бути 32 байти (64 шістнадцяткові цифри)

engine-e-evidence-cli-that-is-the-private-key = це ПРИВАТНИЙ ключ підписувача. Ніколи не поширюйте його; передайте відкритий ключ (файл .pub)

engine-e-evidence-lab-lab-attestation-conducted-setup-needs = lab-attestation: кондуктивна установка потребує attenuation_db — скінченного числа дБ, 0 або більше

engine-e-evidence-tsa-unsupported-digest-algorithm = непідтримуваний алгоритм дайджесту

engine-e-evidence-tsa-signature-failure = збій підпису

engine-e-field-schema-entry-is-not-an-object = запис не є об'єктом

engine-e-field-schema-no-unit-string = немає рядка `unit`

engine-e-field-schema-no-provenance-string = немає рядка `provenance`

engine-e-geometry-sky-tle-holds-no-complete = sky: tle не містить жодного повного двострокового набору елементів

engine-e-geometry-sky-epoch-dates-the-tle = sky: epoch датує супутники з `tle`; попередньо задані `systems` і супутники, задані безпосередньо, не мають дати, тож задайте `tle` разом із ним

engine-e-gravimeter-gravity-map-reference-replaces-the = gravity-map: `reference` замінює синтетичне поле, тому `coeffs` і `mascons` мають бути порожніми, коли його задано

engine-e-gse-sim-fusion-od-produced-no-steps = комплексоване визначення орбіти не дало жодного кроку (замало спостережень)

engine-e-holdover-test-give-one-of-series-samples = задайте одне з series.samples, series.csv_path або series.clock_log

engine-e-holdover-test-give-one-of-series-samples-2 = задайте одне з series.samples, series.csv_path або series.clock_log, не більше одного

engine-e-holdover-test-gnss-removed-must-be-finite = gnss_removed_s має бути скінченним, locked_duration_days >= 0, recovery_band_ns > 0 і recovery_dwell_s >= 0

engine-e-holdover-test-csv-path-is-not-available = csv_path недоступний у збірці WebAssembly; задайте ряд безпосередньо як `samples` або `clock_log.text`

engine-e-hybrid-coupled-geometry-needs-at-least = coupled.geometry потребує щонайменше двох різних скінченних множників прямої видимості

engine-e-hybrid-integrity-optical-link-delivered-no-photons = оптичний канал не доставив жодного фотона (нескінченна CRLB дальності); збільште потужність / апертуру / час інтегрування

engine-e-hybrid-integrity-rf-tracking-threshold-dbhz-and = rf_tracking_threshold_dbhz і rf_degraded_margin_db мають бути скінченними

engine-e-interference-map-adsb-need-at-least-one-of = потрібен щонайменше один зі стовпців `nic`, `nacp`

engine-e-interference-map-adsb-gzip-decompressed-size-over-the = gzip: розпакований розмір перевищує межу

engine-e-interference-map-adsb-trace-json-lacks-icao-timestamp = у JSON трасування бракує icao, timestamp або trace

engine-e-interference-map-api-custom-dataset-needs-licence-licence = власний набір даних потребує ліцензії, URL ліцензії та тексту атрибуції

engine-e-interference-map-api-cell-size-must-be-between = розмір комірки має бути між { $lit_0_01 } і 10 градусів

engine-e-interference-map-api-map-has-bad-date = карта має хибну дату

engine-e-interference-map-api-no-map-falls-in-the = жодна карта не потрапляє в діапазон дат

engine-e-interference-map-cli-dataset-is-required-so-the = потрібен --dataset, щоб ліцензію та атрибуцію було вбудовано

engine-e-interference-map-cli-cell-deg-is-not-number = --cell-deg не є числом

engine-e-interference-map-cli-cell-deg-must-be-between = --cell-deg має бути між { $lit_0_01 } і 10

engine-e-interference-map-cli-subcommand-is-required = потрібна підкоманда

engine-e-interference-map-cli-input-file-missing = вхідний файл відсутній

engine-e-interference-map-cli-out-is-required = потрібен --out

engine-e-interference-map-cli-fetch-land-downloads-file-pass = fetch-land завантажує файл: передайте --allow-network для підтвердження

engine-e-interference-map-cli-curl-failed-to-download-the = curl не зміг завантажити полігони суходолу

engine-e-interference-map-cli-route-is-required = потрібен --route

engine-e-interference-map-cli-at-least-one-map-is = потрібен щонайменше один --map

engine-e-interference-map-land-land-polygons-no-polygon-or = полігони суходолу: не знайдено жодного Polygon чи MultiPolygon

engine-e-interference-map-empty-input-header-row-is = порожній вхід: потрібен рядок заголовка

engine-e-interference-map-observatory-bbox-is-south-west-north = --bbox — це південь,захід,північ,схід у градусах

engine-e-interference-map-observatory-bbox-must-satisfy-south-north = --bbox має задовольняти умови південь < північ і захід < схід, у межах земної кулі (без перетину антимеридіана)

engine-e-interference-map-observatory-opensky-network-data-is-excluded = Дані OpenSky Network виключено: їхня ліцензія не дозволяє комерційного використання чи поширення похідних карт (docs/data/INTERFERENCE-DATA-SOURCES.md)

engine-e-interference-map-observatory-day-is-required = потрібен --day

engine-e-interference-map-observatory-delay-hours-is-not-number = --delay-hours не є числом

engine-e-interference-map-observatory-cell-deg-must-be-between = --cell-deg має бути між { $lit_0_5 } і 10

engine-e-interference-map-observatory-the-input-has-no-usable-2 = вхід не містить жодного придатного звіту

engine-e-interference-map-route-not-kshana-interference-map-no = не є картою завад Kshana (немає члена `kshana_interference_map`)

engine-e-interference-map-route-map-has-no-date = карта не має дати

engine-e-interference-map-route-map-has-no-grid-cell = карта не має розміру комірки сітки

engine-e-interference-map-route-map-has-an-invalid-grid = карта має недійсний розмір комірки сітки

engine-e-interference-map-route-route-no-linestring-found = маршрут: не знайдено жодного LineString

engine-e-interference-map-route-route-needs-at-least-two = маршрут потребує щонайменше двох шляхових точок

engine-e-interference-map-route-route-waypoint-out-of-range = маршрут: шляхова точка поза діапазоном

engine-e-interop-sigmf-records-signal-not-geometry = SigMF записує сигнал, а не геометрію; його записують зі сценарію, а не зі сцени

engine-e-interop-sigmf-holds-complex-baseband-samples = SigMF містить комплексні відліки основної смуги, які синтезує лише вид `spectrum`

engine-e-interop-this-spectrum-scenario-has-no = цей сценарій spectrum не має блока [iq], тож немає відліків, які можна було б синтезувати для запису

engine-e-interop-scene-time-step-must-be-positive = крок часу для експорту має бути додатним і скінченним

engine-e-interop-scene-duration-must-be-non-negative = тривалість для експорту має бути невід'ємною і скінченною

engine-e-interop-scene-this-pvt-scenario-gives-no = цей сценарій pvt не задає `truth_ecef` — єдине положення, яке він визначає

engine-e-interop-stk-an-stk-ephemeris-describes-vehicle = ефемерида STK описує положення й швидкість апарата в часі; ця сцена має лише нерухомі точки або безчасові траєкторії (нерухома точка — це Facility STK, а не ефемерида)

engine-e-interop-stk-scene-has-no-epoch = сцена не має епохи

engine-e-iq-acq-surface-surface-header-names-too-many = заголовок поверхні називає забагато комірок

engine-e-iq-cli-acquire-needs-signal-name = потрібен --signal <name>

engine-e-iq-cli-acquire-needs-prn-list = потрібен --prn <list>

engine-e-iq-cli-acquire-surface-exports-one-search-surface = --surface експортує одну поверхню пошуку: задайте рівно один --prn

engine-e-iq-cli-channel-nlos-needs-reflected-path-add = --nlos потребує відбитого шляху: додайте --multipath-height або --land-mobile

engine-e-iq-cli-frontend-bandpass-wants-two-values-lo = --bandpass потребує двох значень: lo,hi

engine-e-iq-cli-frontend-iq-frontend-needs-at-least = iq frontend потребує щонайменше одного каскаду (--bandpass/--notch/--blank/--excise/--agc/--bits)

engine-e-iq-cli-no-iq-processing-command-given = не задано жодної команди обробки iq

engine-e-iq-cli-missing-recording-path = бракує шляху до запису

engine-e-iq-cli-monitor-idle-timeout-only-goes-with = --idle-timeout використовується лише з --follow

engine-e-iq-cli-monitor-follow-reads-sigmf-recording-give = --follow читає запис SigMF (задайте .sigmf-meta, .sigmf-data або базовий шлях)

engine-e-iq-cli-monitor-idle-timeout-must-be-positive = --idle-timeout має бути додатним числом секунд

engine-e-iq-cli-scene-rx-pos-wants-three-values = --rx-pos потребує трьох значень: lat,lon,alt (deg,deg,m)

engine-e-iq-cli-scene-iq-scene-needs-rate-hz = iq scene потребує --rate <hz>

engine-e-iq-cli-scene-iq-scene-needs-duration-or = iq scene потребує --duration <s> (або --window)

engine-e-iq-cli-scene-iq-scene-nav-needs-rx = iq scene --nav потребує --rx-pos lat,lon,alt

engine-e-iq-cli-scene-iq-scene-needs-signal-name = iq scene потребує --signal <name>

engine-e-iq-cli-scene-iq-scene-needs-prn-list = iq scene потребує --prn <list>

engine-e-iq-cli-scene-format-takes-sigmf-or-sdrx = --format приймає sigmf або sdrx, не обидва

engine-e-iq-cli-scene-format-sdrx-writes-ci8-the = --format sdrx записує ci8 (типово) або ci16_le (sdrx:ci16_le); стандарт метаданих ION не має кодування з плаваючою комою

engine-e-iq-cli-track-design-name-needs-design-file = --design-name потребує --design <file.toml>

engine-e-iq-cli-track-threads-must-be-positive-integer = --threads має бути додатним цілим числом або auto

engine-e-iq-cli-track-epochs-format-needs-epochs-path = --epochs-format потребує --epochs <path>

engine-e-iq-io-cli-iq-convert-needs-to-format = iq convert потребує --to <format>

engine-e-iq-io-cli-iq-extract-needs-start = iq extract потребує --start

engine-e-iq-io-cli-iq-extract-needs-duration = iq extract потребує --duration

engine-e-iq-io-cli-start-and-duration-must-be = --start і --duration мають бути невід'ємними

engine-e-iq-io-cli-real-input-is-converted-to = дійсний вхід перетворюється на комплексну основну смугу: задайте --factor <d> (>= 2)

engine-e-iq-io-cli-iq-decimate-needs-factor-or = iq decimate потребує --factor <d> або --up <l> і --down <m>

engine-e-iq-io-resample-resampling-factors-must-be-positive = коефіцієнти передискретизації мають бути додатними

engine-e-iq-io-resample-resampling-factors-must-be-positive-2 = коефіцієнти передискретизації мають бути додатними, а фільтр — непорожнім

engine-e-iq-io-resample-real-if-conversion-needs-decimation = перетворення дійсної ПЧ потребує децимації щонайменше у 2 рази, щоб прибрати дзеркальну складову

engine-e-iq-io-sdrx-sdrx-layout-chunk-holds-no = { "." }sdrx layout: фрагмент не містить жодного цілого блока

engine-e-iq-io-sdrx-sdrx-data-ends-inside-its = { "." }sdrx data закінчуються всередині заголовка

engine-e-iq-io-sigmf-stream-sigmf-core-num-channels = SigMF core:num_channels = 0

engine-e-iq-io-sigmf-stream-sigmf-stream-needs-at-least = потік SigMF потребує щонайменше одного запису

engine-e-iq-io-sigmf-stream-select-channel-must-be-called = select_channel слід викликати до читання

engine-e-iq-io-sigmf-stream-sigmf-data-ends-before-its = дані SigMF закінчуються до першого захоплення

engine-e-iq-labfit-iqfit-mode-validation-needs-validation-table = mode = "validation" потребує таблиці [validation], записаної до читання результатів кампанії

engine-e-iq-labfit-input-campaign-fit-from-an = { "[" }input] campaign: підгонка за папкою кампанії IQ потребує нативної збірки (шар кампанії не збудовано для WebAssembly); тут працює шлях через журнал приймача ([[runs]])

engine-e-iq-scene-truth-missing-truth-csv-header = бракує заголовка CSV істини

engine-e-iq-track-design-carrier-fll-pull-in-max-2 = carrier.fll_pull_in_max_s застосовується лише до fll_assist = "pull-in"

engine-e-iq-track-design-loop-design-file-holds-no = файл проєктування контурів не містить жодного проєкту

engine-e-iq-track-sink-short-record = короткий запис

engine-e-leo-navmsg-fit-correction-polynomial-fit-is-singular = підгонка полінома поправок сингулярна (замало відліків для цього степеня)

engine-e-leo-navmsg-each-trade-update-periods-must = кожен trade.update_periods_s має бути в (0, update_fit_interval_s]

engine-e-leo-navmsg-midpass-user-lat-deg-in = midpass: user_lat_deg у [-90, 90], mask_deg у [0, 60), search_s 600-172800

engine-e-leo-pass-rain-rate-mm-rain-exceedance = rain_rate_mm_h >= 0, rain_exceedance_percent у [{ $lit_0_001 }, 5] і scintillation_percent у [{ $lit_0_01 }, 50]

engine-e-leo-pass-spoofer-onset-within-the-window = spoofer: onset_s у межах вікна, offset_m у [0, 1e6], push_rate_m_s у [0, 1000], додатні prior_sigma_m, drift_sigma_m_s, fll_bandwidth_hz і fll_integration_s, p_fa і p_md у (0, { $lit_0_5 }), iono_rate_bound_m_s >= 0

engine-e-leo-signal-receiver-loop-bandwidth-hz-and = receiver: loop_bandwidth_hz та integration_time_s мають бути додатними

engine-e-leo-signal-receiver-to-12-correlator-spacings = receiver: від 1 до 12 інтервалів корелятора, кожен (як і reference_spacing_chips) між 0 і 2 чипами

engine-e-leo-signal-acquisition-coherent-ms-noncoherent-1000 = acquisition: coherent_ms > 0, 1 ≤ noncoherent ≤ 1000, 0 < pfa_cell < 1, code_bin_chips > 0, altitude_km > 0, oscillator_ppm і user_speed_mps ≥ 0, 0 ≤ elevation_mask_deg < 90

engine-e-live-io-baud-needs-number = --baud потребує числа

engine-e-live-io-configure-is-not-implemented-kshana = --configure не реалізовано: Kshana ніколи не записує в приймач. Налаштуйте його власним засобом виробника, потім читайте його через --serial

engine-e-live-io-more-than-one-session-file = більше одного файлу сесії

engine-e-live-io-follow-and-from-end-apply = --follow і --from-end застосовуються лише до --file

engine-e-live-io-baud-applies-to-serial-only = --baud застосовується лише до --serial

engine-e-live-io-live-needs-session-toml = live потребує файлу сесії .toml

engine-e-live-io-listen-serves-the-gated-stream = --listen віддає потік після перевірки: додайте --gate

engine-e-live-io-two-outputs-would-share-stdout = два виходи ділили б stdout; спрямуйте --json або --pksht у файл

engine-e-lunar-ephemeris-lunar-ephemeris-give-exactly-one = місячна ефемерида: задайте рівно одне з `mean_anom_deg` або `true_anom_deg`

engine-e-lunar-ephemeris-lunar-ephemeris-satellite-indices-must = місячна ефемерида: індекси супутників мають бути суцільними від 0 без пропусків

engine-e-lunar-frame-campaign-beacon-information-per-site-needs = інформація про маяки по майданчиках потребує station_datum = "fixed"; оцінений датум станції зв'язує маяки

engine-e-lunar-infra-frame-llr-sigma-surface-orbiter-range = llr.sigma_m, surface.orbiter_range_sigma_m і llr.epochs мають бути додатними

engine-e-lunar-infra-od-too-few-trackable-gnss-measurements = замало придатних до стеження вимірювань GNSS, щоб визначити орбіту та годинник приймача

engine-e-lunar-infra-phase-fewer-than-two-connected-passes = менше двох зв'язних проходів: немає неоднозначності подвійної різниці, яку можна було б розв'язати

engine-e-lunar-infra-tie-the-space-tie-information-matrix = інформаційна матриця космічного зв'язку сингулярна

engine-e-lunar-jamming-jammer-range-must-be-finite = jammer.range_m має бути скінченним і додатним (або задайте jammer.lat_deg і jammer.lon_deg, щоб розмістити джерело завад селенографічно)

engine-e-lunar-llr-the-station-catalogue-states-no = каталог станцій не задає position_epoch_year; положення ITRF без його епохи не можна розповсюдити

engine-e-lunar-llr-beacon-campaign-beacons-is-not = beacon_campaign.beacons тут не використовується; додані маяки задавайте в extra_beacons

engine-e-lunar-service-planetary-kernel-path-applies-to = planetary_kernel_path застосовується до файлу елементів, заданого в системі відліку OP

engine-e-lunar-terrain-terrain-give-dem-path-dem = terrain: задайте dem_path, dem_tile_path, station_horizon або user_horizon (або пропустіть [terrain])

engine-e-lunar-terrain-terrain-station-horizon-has-no = terrain: station_horizon не має станції в цьому виді; використайте user_horizon

engine-e-lunar-time-budget-scenario-sigma-is-shorter-than-the = x_sigma_s коротший за сітку tau

engine-e-lunar-time-lab-time-lab-thresholds-ns-must = time_lab: thresholds_ns має бути непорожнім списком додатних чисел

engine-e-lunar-vlbi-fim-datum-all-stations-fixed-holds = датум "all-stations-fixed" утримує кожну станцію нерухомою, тож нічого не оцінює, якщо не оцінюється маяк: задайте estimate_beacon = true

engine-e-mars-pnt-fusion-od-run-produced-no = прогін комплексованого визначення орбіти не дав жодного кроку (замало спостережень)

engine-e-nmea-synth-clock-not-numeric = не число

engine-e-nmea-synth-config-scenario-name-must-be-to = scenario.name має містити від 1 до 64 символів із A-Z a-z 0-9 . _ - і не починатися з крапки (воно називає вихідні файли)

engine-e-nmea-synth-config-receiver-parameters-out-of-range = параметри приймача поза діапазоном (маска 0-45 deg, track <= поріг використання, 4-12 використаних супутників, шум >= 0, corr > 0, reacquire >= 0)

engine-e-nmea-synth-config-the-time-change-per-second = зміна часу за секунду досягає 1, тож повідомлений час зупинився б або побіг назад; подовжте ramp_s/recovery_s або використайте стрибок (0)

engine-e-orbit-give-the-user-as-user = задайте користувача як `user` (орбіта) або `user_site` (наземний майданчик), не обидва

engine-e-orbit-missing-the-user-give-user = бракує користувача: задайте `user` (орбіта) або `user_site` (наземний майданчик)

engine-e-orbit-skyline-needs-ground-site-give = [skyline] потребує наземного майданчика: задайте `user_site = { "{" } lat_deg, lon_deg, height_m { "}" }` замість орбітального `user` (орбіта не має азимута, закріпленого за Землею)

engine-e-orbit-omm-export-requires-tle-defined = експорт OMM потребує угруповання, заданого через TLE; цей сценарій такого не має

engine-e-passes-earth-orientation-parameters-out-of = параметри орієнтації Землі поза діапазоном: |ut1_minus_utc_s| <= 1, |xp_arcsec| і |yp_arcsec| <= 2

engine-e-pvt-no-priori-position-set-apriori = немає апріорного положення: задайте apriori_ecef, APPROX POSITION XYZ із заголовка спостережень або truth_ecef

engine-e-python-pll-bws-dll-bws-spacings = pll_bws, dll_bws, spacings і coherents не можна поєднувати з design: перебір запускає кожен проєкт у файлі

engine-e-python-no-designs-to-sweep = немає проєктів для перебору

engine-e-quantum-trade-candidate-adev-taus-and-candidate = candidate_adev_taus і candidate_adev_values мають бути однакової довжини (>= 2)

engine-e-quantum-trade-provide-either-candidate-adev-taus = задайте або candidate_adev_taus + candidate_adev_values (виміряні), або candidate_clock_class

engine-e-quantum-trade-candidate-adev-taus-and-candidate-2 = candidate_adev_taus і candidate_adev_values мають бути задані обидва (або обидва відсутні)

engine-e-quantum-trade-timing-threshold-and-position-threshold = timing_threshold_s і position_threshold_m мають бути скінченними й > 0

engine-e-realdata-clk-rinex-clock-file-is-mixed = файл годинника RINEX змішаної системи ('M') і не оголошує TIME SYSTEM ID; відмова вгадувати шкалу часу його епох

engine-e-realdata-ion-sdr-more-than-one-block-only = більше одного <block>: читаються лише одноканальні файли

engine-e-realdata-ion-sdr-this-layout-carries-reading-fill = цей формат містить трактування (fill_lsb_first або mid_rise), для якого стандарт метаданих ION не має поля; його не можна записати як .sdrx

engine-e-realdata-ion-sdr-the-layout-needs-positive-sample = формат потребує додатної частоти дискретизації та коефіцієнта частоти не менше 1

engine-e-realdata-lola-dem-unexpected-end-of-dem = несподіваний кінець DEM

engine-e-realdata-lugre-not-raw-message = не повідомлення RAW

engine-e-realdata-lugre-not-an-acq-message = не повідомлення ACQ

engine-e-realdata-raim-no-priori-position-pass-one = немає апріорного положення: задайте його або надайте APPROX POSITION XYZ із заголовка спостережень

engine-e-receiver-trust-calibration-calibration-window-less-than-the = вікно калібрування менше за захисний інтервал до вікна атаки або потрапляє всередину нього

engine-e-receiver-trust-live-live-mode-needs-platform-kind = режим live потребує [platform] kind = "vessel": оцінка довіри призначена для рухомої платформи

engine-e-receiver-trust-machines-rtcm3-the-rtcm-stream-holds-no = потік RTCM 3 не містить повідомлень спостережень MSM4 чи MSM7

engine-e-receiver-trust-machines-rtklib-rtklib-pos-with-degrees-minutes = RTKLIB .pos із положеннями в градусах-хвилинах-секундах не читається: повторно запустіть rnx2rtkp/RTKPOST з десятковими градусами (-degf 0)

engine-e-receiver-trust-monitors-engine-fix-the-rinex-observation = визначення рушія: у заголовку спостережень RINEX немає APPROX POSITION XYZ, з якого почати розв'язок

engine-e-receiver-trust-monitors-platform-declares-heading-sensor-true = платформа оголошує heading_sensor = true, але журнал не містить курсу HDT, THS чи VHW

engine-e-receiver-trust-scenario-log-imu-the-imu-series = log.imu: ряд IMU не перекриває жодної епохи журналу; перевірте time_offset_s

engine-e-receiver-trust-scenario-this-surface-does-not-carry = ця поверхня не несе файлу `[log.imu]`: запустіть сценарій через `kshana receiver-trust` на хості або приберіть `[log.imu]`

engine-e-receiver-trust-scenario-log-nav-applies-only-to = log.nav застосовується лише до журналу `rinex`: визначення рушія потребує його псевдодальностей

engine-e-receiver-trust-score-score-the-geometry-deduction-is = score: відрахування за геометрію задається в [geometry] (cap_points, full_ratio, floor), а не в [score.weights]

engine-e-spectrum-recording-is-not-available-in = запис недоступний у збірці WebAssembly: натомість передайте байти SigMF до kshana::sigmf::read і kshana::spectrum::welch_psd

engine-e-ssv-scenario-navigation-noise-and-radiation-pressure = navigation: значення шуму та тиску випромінювання не можуть бути від'ємними

engine-e-ssv-scenario-trajectory-give-exactly-one-of-2 = trajectory: задайте рівно одне з duration_min і duration_periods

engine-e-ssv-weak-receiver-pfa-total-and-receiver = receiver.pfa_total і receiver.pd мають бути ймовірностями в (0, 1)

engine-e-suite-suite-manifest-is-missing-title = у маніфесті набору бракує `title`

engine-e-suite-suite-manifest-has-no-scenarios = маніфест набору не має `scenarios`: додайте непорожній масив `scenarios = [...]`

engine-e-surface-path-sources-are-not-accepted = джерела `path` тут не приймаються: задайте журнал безпосередньо як `text` або `base64`

engine-e-surface-input-campaign-names-campaign-folder = { "[" }input] campaign називає папку кампанії, а ця поверхня не читає файлів; кампанії читає лише CLI (`kshana iq labfit`), Python (`kshana.iq_labfit`) або інструмент MCP labfit у його робочій теці IQ

engine-e-surface-bad-merkle-root-hex = хибний hex кореня Меркла

engine-e-surface-merkle-root-must-be-32 = корінь Меркла має бути 32 байти

engine-e-telecom-timing-csv-path-is-not-available = csv_path недоступний у збірці WebAssembly; задайте ряд безпосередньо як `samples`

engine-e-telemetry-cli-otlp-every-needs-whole-number = --otlp-every потребує цілого числа

engine-e-telemetry-cli-registry-poisoned = реєстр отруєно

engine-e-telemetry-otlp-https-is-not-supported-by = https не підтримується вбудованим експортером; використайте локальний колектор через http

engine-e-telemetry-otlp-no-http-status-in-response = у відповіді немає статусу HTTP

engine-e-tle-invalid-designator-launch-year-in = недійсний рік запуску в позначенні TLE

engine-e-tle-invalid-epoch-year-in-tle-2 = недійсний рік епохи в TLE

engine-e-tle-invalid-epoch-day-in-tle = недійсний день епохи в TLE

engine-e-adm-record-without-epoch = запис без <EPOCH>

engine-e-adm-ndm-holds-no = <ndm> не містить <{ $kind }>

engine-e-adm-root-element-is-not = кореневий елемент <{ $name }> не є <{ $kind }>

engine-e-evidence-cli-keygen-needs-out-keyfile = keygen потребує --out <keyfile>

engine-e-evidence-cli-needs-key-keyfile-make-one = потребує --key <keyfile> (створіть його командою `kshana evidence keygen`)

engine-e-evidence-cli-needs-out-dir = потребує --out <dir>

engine-e-evidence-cli-needs-scenario-bench-scenario = потребує --scenario <bench scenario>

engine-e-evidence-cli-needs-conditions-file = потребує --conditions <file>

engine-e-evidence-tsa-bad-ecdsa-signature = хибний підпис ECDSA

engine-e-evidence-tsa-certificate-signature-failure = збій підпису сертифіката

engine-e-evidence-tsa-unable-to-get-issuer-certificate = не вдалося отримати сертифікат видавця

engine-e-evidence-tsa-unable-to-get-local-issuer = не вдалося отримати сертифікат локального видавця

engine-e-evidence-tsr-gentime-is-not-text = genTime не є текстом

engine-e-glonass-bad-year = хибний рік

engine-e-glonass-bad-month = хибний місяць

engine-e-glonass-bad-day = хибний день

engine-e-glonass-bad-hour = хибна година

engine-e-glonass-bad-minute = хибна хвилина

engine-e-gravity-sh-bad-degree = хибний степінь

engine-e-gravity-sh-bad-order = хибний порядок

engine-e-interop-testbench-first-line-is-not-resolution = перший рядок не є `RESOLUTION: <ms>`

engine-e-interop-testbench-bad-resolution = хибна роздільна здатність

engine-e-iq-signals-galileo-the-galileo-e1-memory-codes = кодів пам'яті Galileo E1 у комплекті немає (умови ICD дозволяють поширення лише у некомерційних цілях; див. LICENSING.md). Надайте свою копію додатка C до ICD ({ $file }) через { $env }=<path> або запустіть scripts/fetch_galileo_e1_codes.sh у вихідному репозиторії ({ $path }: { $e })

engine-e-jammertest-cli-key-needs-out-dir = --key потребує --out <dir>

engine-e-leo-signal-modulation-expected-flat-mhz = модуляція { $label }: очікується FLAT(<MHz>)

engine-e-live-io-listen-takes-tcp-port-or = --listen приймає tcp:<port> або tcp:<addr>:<port>

engine-e-ndm-xml-bad-attribute-in = хибний атрибут у <{ $name }>

engine-e-ndm-xml-unquoted-attribute-in = атрибут { $key } без лапок у <{ $name }>

engine-e-ndm-xml-is-not-closed = <{ $name }> не закрито

engine-e-nmea-synth-cli-wait-clients-not-number = --wait-clients: не число

engine-e-nmea-synth-cli-speed-not-number = --speed: не число

engine-e-nmea-synth-cli-seed-not-an-integer = --seed: не ціле число

engine-e-odm-user-defined-without-parameter = <USER_DEFINED> без параметра

engine-e-osnma-cli-bad-public-key-id = хибний ідентифікатор відкритого ключа

engine-e-osnma-cli-bad-public-key-hex = хибний hex відкритого ключа

engine-e-realdata-ion-sdr-closing-tag-does-not-match = закривальний тег </{ $name }> не відповідає <{ $name2 }>

engine-e-realdata-ion-sdr-closing-tag-without-an-opening = закривальний тег </{ $name }> без відкривального

engine-e-realdata-ion-sdr-attribute-without-value-in = атрибут без значення в <{ $name }>

engine-e-realdata-ion-sdr-is-not-an-integer = <{ $name }> { $key } не є цілим числом: { $v }

engine-e-realdata-ion-sdr-chunk-lacks-sizeword = у <chunk> бракує sizeword

engine-e-realdata-ion-sdr-chunk-lacks-countwords = у <chunk> бракує countwords

engine-e-realdata-ion-sdr-is-not-an-integer-2 = <{ $key }> не є цілим числом

engine-e-realdata-ion-sdr-ratefactor-is-not-an-integer = <ratefactor> не є цілим числом

engine-e-realdata-ion-sdr-no-band-with-centerfreq-for = немає <band> з <centerfreq> для потоку

engine-e-realdata-ion-sdr-offset-is-not-an-integer = <offset> не є цілим числом

engine-e-receiver-trust-geometry-geometry-need-hdop-good-hdop = geometry: потрібно 0 < hdop_good <= hdop_max, 0 < pdop_good <= pdop_max і used_good >= min_used (отримано { $hdop_good }, { $pdop_good }, { $used_good })

engine-e-sp3-bad-epoch-count = хибна кількість епох

engine-e-spectrum-matched-jammer-needs-matched-to = { $name }: узгоджене джерело завад потребує matched_to = "<band name>"

engine-e-spectrum-unknown-band-the-spectrum-model = невідома смуга { $name }: модель спектра має { $band_names } та, за назвою, { $more_band_names } (канали GLONASS                      як glonass-l1of-k<K>, K = -7 до 6); будь-яка інша смуга приймає                      `signal = "<preset signal>"` або `centre_mhz` з `modulation` і                      `signal_power_dbw`

engine-e-evidence-assemble-the-log-does-not-state = журнал не містить придатного для розбору часу початку; задайте секунди від першої епохи

engine-e-interop-geojson-no-linestring-found-give-linestring = LineString не знайдено: задайте геометрію LineString, Feature, що її містить, або FeatureCollection, серед об'єктів якої є така

engine-e-interop-geojson-the-scenario-has-no-waypoints = сценарій не має `waypoints` у кількості 2 або більше, щоб розтягнути маршрут із двох положень

engine-e-leo-pnt-chain-the-chain-satellite-is-visible = супутник ланцюга видно менш ніж в двох епохах або лише під одним кутом місця; розширте вікно проходу

engine-e-nmea-synth-config-skyline-table-is-required-for = потрібна таблиця skyline (наприклад skyline = { "{" } preset = "fjord" { "}" })

engine-e-python-prns-must-list-at-least = prns має містити щонайменше один PRN

engine-e-python-design-name-needs-design = design_name потребує design

engine-e-python-bandpass-needs-both-bandpass-lo = bandpass потребує і bandpass_lo, і bandpass_hi

engine-e-python-token-text-is-not-base64 = текст токена не є base64

engine-e-python-unix-nano-must-be-between = unix_nano має бути між 0 і 2**64 - 1

engine-e-wasm-token-base64-is-not-base64 = token_base64 не є base64

engine-e-wasm-log-base64-is-not-base64 = log_base64 не є base64

engine-e-wasm-input-base64-is-not-base64 = input_base64 не є base64

engine-e-wasm-seed-must-be-non-negative = seed має бути невід'ємним цілим числом

engine-e-wasm-runs-json-must-be-an = runs_json має бути масивом { "{" }label, result, scenario?{ "}" }

engine-e-nmea-synth-stream-no-udp-address = немає адреси UDP

engine-e-realdata-llr-crd-short-normal-point-11-record = короткий запис нормальної точки (11)

engine-e-realdata-llr-crd-normal-point-record-appeared-before = запис нормальної точки з'явився до заголовка сесії h2/h3/h4

engine-e-gravity-sh-line-bad-coefficient-non-finite = рядок { $lineno }: хибний коефіцієнт (нескінченний)

engine-e-interop-time-extra-fields-utc = не час UTC `YYYY-MM-DDTHH:MM:SS`: зайві поля: { $text }

engine-e-interop-time-year-outside-2000-to-2099-utc = не час UTC `YYYY-MM-DDTHH:MM:SS`: рік поза межами від 2000 до 2099: { $text }

engine-e-interop-time-month-outside-to-12-utc = не час UTC `YYYY-MM-DDTHH:MM:SS`: місяць поза межами від 1 до 12: { $text }

engine-e-interop-time-day-does-not-exist-in-utc = не час UTC `YYYY-MM-DDTHH:MM:SS`: такого дня в цьому місяці не існує: { $text }

engine-e-interop-time-hour-above-23-utc = не час UTC `YYYY-MM-DDTHH:MM:SS`: година понад 23: { $text }

engine-e-interop-time-minute-above-59-utc = не час UTC `YYYY-MM-DDTHH:MM:SS`: хвилина понад 59: { $text }

engine-e-interop-time-seconds-outside-60-utc = не час UTC `YYYY-MM-DDTHH:MM:SS`: секунди поза межами [0, 60): { $text }

engine-e-mcp-budget-work-budget-exceeded-for-call = бюджет роботи перевищено для виклику через сервер MCP: { $errors }. Великі дослідження запускайте командним рядком `kshana`.

engine-e-mcp-iq-the-iq-sample-budget-must = бюджет відліків IQ має бути не менше 1

engine-e-mcp-iq-an-empty-path-was-given = задано порожній шлях

engine-e-mcp-iq-rate-hz-must-be-positive = rate_hz має бути додатним числом

engine-e-mcp-iq-duration-must-be-positive-number = duration_s має бути додатним числом

engine-e-mcp-iq-broadcast-mode-nav-needs-rx = режим мовлення (nav) потребує rx_pos [lat, lon, alt]

engine-e-mcp-iq-scene-needs-signal-or-nav = сцена потребує `signal` (або `nav` для режиму мовлення)

engine-e-mcp-iq-scene-needs-at-least-one = сцена потребує щонайменше одного PRN у `prns`

engine-e-mcp-iq-surface-out-exports-one-surface = surface_out експортує одну поверхню: задайте рівно один PRN

engine-e-mcp-iq-surface-out-must-end-in = surface_out має закінчуватися на .csv, .json або .bin

engine-e-mcp-iq-max-seconds-must-be-positive = max_seconds має бути додатним числом

engine-e-mcp-iq-epochs-out-must-end-in = epochs_out має закінчуватися на .csv, .jsonl або .bin (формат визначається суфіксом)

engine-e-mcp-iq-out-must-differ-from-input = out має відрізнятися від input

engine-e-mcp-iq-pll-bws-hz-dll-bws = pll_bws_hz, dll_bws_hz, spacings_chips і coherents не можна поєднувати з design: перебір запускає кожен проєкт у файлі

engine-e-mcp-iq-signal-and-prns-go-together = signal і prns задаються разом

engine-e-mcp-iq-iq-work-directory = робоча тека IQ { $dir }: { $e }

engine-e-mcp-iq-iq-work-directory-is-not = робоча тека IQ { $dir } не є текою

engine-e-mcp-iq-iq-file-tools-are-off = файлові засоби IQ вимкнено: { $reason }

engine-e-mcp-iq-output-does-not-name-file = вихід `{ $rel }` не називає файлу

engine-e-mcp-iq-output-its-folder = вихід `{ $rel }`: його тека: { $e }

engine-e-mcp-iq-output-is-symlink-refusing-to = вихід `{ $shown }` є символічним посиланням; запис відхилено

engine-e-mcp-iq-output-already-exists-pass-overwrite = вихід `{ $shown }` уже існує; передайте overwrite: true, щоб його замінити

engine-e-mcp-iq-output-exists-and-is-not = вихід `{ $shown }` існує і не є файлом

engine-e-mcp-iq-its-data-file-lies-outside = { $path }: його файл даних лежить поза робочою текою IQ

engine-e-mcp-iq-lies-outside-the-iq-work = { $path } лежить поза робочою текою IQ

engine-e-mcp-iq-input-campaign-the-campaign-folder = { "[" }input] campaign `{ $rel }`: { $message }; тека кампанії має бути наявною текою всередині робочої теки IQ

engine-e-mcp-iq-out-dir-does-not-name = out_dir `{ $rel }` не називає теки

engine-e-mcp-iq-is-samples-and-one-call = { $what }: { $samples } відліків, а один виклик може обробити щонайбільше { $max_samples } ({ $env }); { $remedy }

engine-e-mcp-iq-threads-must-be-to = threads має бути від 1 до { $max_threads }

engine-e-mcp-iq-truth-format-must-be-csv = truth_format має бути csv або jsonl (отримано { $other })

engine-e-mcp-iq-surface-out-would-hold-about = surface_out містив би близько { $cells } комірок (доплерівські біни × відліки на період коду; межа { $max_cells }, близько { $mb } MB у двійковому вигляді): збільште doppler_step_hz або зменште doppler_max_hz

engine-e-mcp-iq-no-campaign-here = { $out_dir }: тут немає кампанії ({ $e })

engine-e-mcp-iq-design-prn-channels-at-most = { $n_channels } каналів (проєкт, PRN); щонайбільше 256 на перебір

engine-e-mcp-iq-test-conditions-invalid = умови випробування недійсні: { $e }

engine-e-mcp-iq-labfit-failed = labfit завершився помилкою: { $e }

engine-e-mcp-marine-give-exactly-one-of-log = задайте рівно одне з `log` і `log_base64`

engine-e-mcp-marine-at-most-366-maps-per = щонайбільше 366 карт на виклик

engine-e-mcp-marine-mode-symbols-needs-symbols = режим `symbols` потребує `symbols`

engine-e-mcp-marine-vessel-stream-assessment-failed = оцінювання потоку судна завершилося помилкою: { $e }

engine-e-mcp-marine-jammertest-import-failed = імпорт jammertest завершився помилкою: { $e }

engine-e-mcp-marine-jammertest-score-failed = оцінювання jammertest завершилося помилкою: { $e }

engine-e-mcp-marine-vessel-log-assessment-failed = оцінювання журналу судна завершилося помилкою: { $e }

engine-e-mcp-marine-training-scenario-failed = навчальний сценарій завершився помилкою: { $e }

engine-e-mcp-marine-evidence-pack-failed = пакет доказів завершився помилкою: { $e }

engine-e-mcp-marine-the-pack-is-bytes-over = пакет має { $size } байт, що перевищує межу відповіді в { $max_bytes } байт; звузьте вікно або використайте `kshana receiver-trust evidence` у командному рядку

engine-e-mcp-marine-round-trip-pack-failed = пакет round-trip завершився помилкою: { $e }

engine-e-mcp-marine-the-pack-is-bytes-over-2 = пакет має { $size } байт, що перевищує межу відповіді в { $max_bytes } байт; звузьте вікно або використайте `kshana evidence round-trip` у командному рядку

engine-e-mcp-marine-files-are-over-the-byte = файли перевищують межу в { $max_bytes } байт

engine-e-mcp-marine-full-log-is-over-the = full_log перевищує межу в { $max_bytes } байт

engine-e-mcp-marine-interference-map-failed = карта завад завершилася помилкою: { $e }

engine-e-mcp-marine-the-map-is-bytes-over = карта має { $total } байт, що перевищує межу відповіді в { $max_bytes } байт; використайте грубіший cell_deg, менше днів або `kshana interference-map` у командному рядку

engine-e-mcp-marine-route-exposure-failed = оцінювання впливу на маршрут завершилося помилкою: { $e }

engine-e-mcp-marine-compliance-report-failed = звіт compliance завершився помилкою: { $e }

engine-e-mcp-marine-standards-pack-failed = пакет стандартів завершився помилкою: { $e }

engine-e-mcp-marine-lunanet-afs-check-failed = lunanet-afs-check завершився помилкою: { $e }

engine-e-mcp-marine-mode-must-be-spec-symbols = mode має бути spec, symbols або generate (отримано { $other })

engine-e-mcp-marine-benchmark-scoring-failed = оцінювання бенчмарка завершилося помилкою: { $e }

engine-e-mcp-marine-leaderboard-failed = таблиця лідерів завершилася помилкою: { $e }

engine-e-mcp-marine-test-bench-export-failed = експорт test-bench завершився помилкою: { $e }

engine-e-mcp-marine-the-pack-is-bytes-over-3 = пакет має { $size } байт, що перевищує межу відповіді в { $max_bytes } байт

engine-e-mcp-server-give-exactly-one-of-request = задайте рівно одне з `request` (запит геометрії неба) або `skyline_preset` (назва пресета, або порожній рядок, щоб показати їх список)

engine-e-mcp-server-receiver-log-assessment-failed = оцінювання журналу приймача завершилося помилкою: { $e }

engine-e-mcp-server-unknown-scenario-kind-list-scenario = невідомий вид сценарію `{ $k }`; list_scenario_kinds називає кожен вид

engine-e-mcp-server-unknown-report-format-expected-json = невідомий формат звіту `{ $format }`; очікується json або html

engine-e-mcp-server-report-failed = звіт завершився помилкою: { $e }

engine-e-mcp-server-duration-fps-gives-frames-and = duration_s x fps дає { $n_frames } кадрів, а відповідь вміщує щонайбільше { $max_frames }; зменште fps або duration_s чи запишіть довшу послідовність командним рядком (`kshana <scenario.toml> --animate frames`)

engine-e-mcp-server-route-import-failed = імпорт маршруту завершився помилкою: { $e }

engine-e-mcp-server-sp3-export-failed = експорт SP3 завершився помилкою: { $e }

engine-e-mcp-server-omm-export-failed = експорт OMM завершився помилкою: { $e }

engine-e-mcp-server-oem-export-failed = експорт OEM завершився помилкою: { $e }

engine-e-mcp-server-scenario-kind-publishes-no-csv = вид сценарію `{ $kind }` не публікує таблиці CSV; лише { $kinds } її публікують

engine-e-mcp-server-unknown-skyline-preset-known-presets = невідомий пресет горизонту "{ $name }"; відомі пресети: { $presets }

engine-e-mcp-server-the-tool-call-did-not = виклик інструмента не завершився: { $e }

engine-e-mcp-server-the-server-is-at-its-concurrent-work-limit = сервер досяг межі одночасної роботи (попередні виклики ще виконуються); повторіть невдовзі

engine-e-mcp-server-the-work-pool-is-closed = пул роботи закрито

engine-e-mcp-iq-no-work-directory = немає робочої теки

engine-e-mcp-iq-input = вхід `{ $rel }`: { $e }

engine-e-mcp-iq-input-is-not-file = вхід `{ $rel }` не є файлом

engine-e-mcp-iq-input-campaign-is-not-folder = { "[" }input] campaign `{ $rel }` не є текою

engine-e-mcp-iq-out-dir-is-not-folder = out_dir `{ $rel }` не є текою

engine-e-mcp-iq-out-dir = out_dir `{ $rel }`: { $e }

engine-e-mcp-iq-iq-failed = iq { $args } завершився помилкою: { $m }

engine-e-adm-attitudestate-without = <attitudeState> без <{ $tag }>

engine-e-bench-cli-is-required = потрібен { $flag }

engine-e-bench-cli-is-empty = { $p } порожній

engine-e-evidence-tsa-bad-256-key = хибний ключ P-256

engine-e-evidence-tsa-bad-384-key = хибний ключ P-384

engine-e-interop-no-iq-block = немає блока [iq]

engine-e-ndm-xml-closes = </{ $close }> закриває <{ $name }>

engine-e-odm-unexpected-in-data = несподіваний <{ $name }> у <data>

engine-e-odm-unsupported-in-ocm-data = непідтримуваний <{ $name }> у OCM <data>

engine-e-realdata-ion-sdr-no-stream-element = немає елемента <stream>

engine-e-realdata-ion-sdr-is-not-number = <{ $name }> не є числом: { $text }

engine-e-realdata-ion-sdr-no-chunk-element = немає елемента <chunk>

engine-e-realdata-ion-sdr-stream-lacks = у <stream> бракує <{ $key }>

engine-e-realdata-ion-sdr-no-system-element = немає елемента <system>

engine-e-realdata-ion-sdr-no-file-with-url = немає <file> з <url>

engine-e-surface-give-string-utf8-or-base64 = { $k }: задайте рядок, { "{" }"utf8": ...{ "}" } або { "{" }"base64": ...{ "}" }

engine-e-realdata-llr-crd-short-h1-record = короткий запис h1

engine-e-realdata-llr-crd-short-h2-record = короткий запис h2 (станція)

engine-e-realdata-llr-crd-short-h3-record = короткий запис h3 (ціль)

engine-e-realdata-llr-crd-short-h4-record = короткий запис h4 (сесія)

engine-e-mcp-main-needs-value = { $a } потребує значення

engine-main-usage =
    використання: kshana <scenario.toml> [--study-name <s>] [--eop <finals2000A>] [--export-sp3 <out.sp3>] [--export-omm <out.omm>] [--export-oem <out.oem>] [--export <czml|kml|geojson|stk|sigmf|all|list>]... [--import-route <route.geojson>]
    { "   " }або: kshana <scenario.toml> --animate <svg|html|frames|all> [--animate-fps <n>] [--animate-duration <s>]
    { "   " }або: kshana --study <suite.toml>
    { "   " }або: kshana --validate <scenario.toml>
    { "   " }або: kshana receiver-trust <scenario.toml>
    { "   " }або: kshana receiver-trust live <session.toml> [--stdin | --file <path> [--follow] | --tcp <host:port> | --udp <port>] [--gate] (kshana receiver-trust live --help)
    { "   " }або: kshana receiver-trust evidence <scenario.toml> --from <t0> --to <t1> --key <keyfile> --out <dir> (kshana evidence --help)
    { "   " }або: kshana evidence <keygen|verify|attach-timestamp> ... (kshana evidence --help)
    { "   " }або: kshana jammertest <import|score> ... (kshana jammertest --help)
    { "   " }або: kshana evidence round-trip <scenario.toml> --scenario <bench-scenario> --conditions <file> --from <t0> --to <t1> --key <keyfile> --out <dir> (kshana evidence --help)
    { "   " }або: kshana trust-telemetry [options] (kshana trust-telemetry --help)
    { "   " }або: kshana imu-fit <imu.csv> [--format csv|euroc] [--axis x|y|z] [--expected-mean <m/s2>] [--id <name>] [--json]
    { "   " }або: kshana nmea-scenario <scenario.toml> [--out <file.nmea>] [--tcp <addr>|--udp <addr>] (kshana nmea-scenario --help)
    { "   " }або: kshana interference-map <adsb|ais|fetch-land> ... (kshana interference-map --help)
    { "   " }або: kshana route-exposure --route <route> --map <map.geojson|dir> [--from <date>] [--to <date>]
    { "   " }або: kshana bench <spec|truth|cases|score|baseline|seal|reveal-check|manifest|verify-manifest|validate|leaderboard> ... (kshana bench --help)
    { "   " }або: kshana bench-export <scenario.toml> [--out <base>] [--epoch <YYYY-MM-DDTHH:MM:SS>]
    { "   " }або: kshana compliance-report [--out <base>] <result.json>... | --mapping | --sources
    { "   " }або: kshana lunanet-afs-check <spec [--json] [--strict]|symbols <file> [--max-sp-errors <n>] [--json]|generate --frames <n> [--toi0 <t>] --out <file>>
    { "   " }або: kshana standards-pack <list|run <id> [--json] [--out <base>]|rows <id>|tests <id>>
    { "   " }або: kshana partner check <submission.toml> [--json]
    { "   " }або: kshana osnma verify <pages|vectors.csv|stream.ubx> [--merkle-root <hex>] [--public-key <id:type:hex>] [--reference-time <gst-s>] [--json] (kshana osnma --help)
    { "   " }або: kshana iq <scene|acquire|track|sweep|labfit|campaign|conditions|frontend|monitor|inventory|info|extract|convert|decimate> ... (kshana iq --help)
    { "   " }або: kshana sky <request.json|request.toml> | --site <lat,lon[,h]> --systems <a,b,...> [--time <s>] [--mask <deg>] [--skyline-preset <name>] [--uere <m>] [--monte-carlo <n> --seed <s>] [--svg] (kshana sky --help)
    { "   " }або: kshana skyline --preset <name> [--json] | --presets | --profile <skyline.json|toml>
    { "   " }або: kshana kinds [--json]
    { "   " }або: kshana example [<name>]
    { "   " }або: kshana --help | --version

engine-main-usage-sky =
    використання: kshana sky <request.json|request.toml> [--monte-carlo <n> --seed <s>] [--svg]
    { "   " }або: kshana sky --site <lat,lon[,height_m]> (--systems <preset,...> | --tle <file>)
    { "                  " }[--epoch <YYYY-MM-DDTHH:MM:SSZ>] [--tle-system <label>] [--time <s>]
    { "                  " }[--mask <deg>] [--skyline-preset <name>] [--uere <m>]
    { "                  " }[--clock per-system|common] [--monte-carlo <n> --seed <s>] [--svg]

    Виводить супутники, які бачить майданчик під горизонтом, їхній DOP, кофактор і коваріацію
    в системі схід–північ–зеніт та горизонтальний еліпс похибок у вигляді JSON (sky_geometry); із --monte-carlo —
    n (щонайбільше 5000) посіяних похибок найменших квадратів (sky_monte_carlo); із --svg — скайплот.
    Системи — це пресети рушія (gps-baseline, galileo, beidou-meo, glonass, xona-pulsar, ...):
    репрезентативна геометрія, а не небо на дату в певному місці. --tle читає двострокові набори
    елементів (щонайбільше 4 MiB) і поширює їх за SGP4 до --epoch (UTC) плюс --time: небо, яке ці
    набори елементів дають у цю епоху, а не вимірювання. Без --epoch вони йдуть до епохи найновішого
    набору елементів — репрезентативне небо. MODELLED; docs/SKYLINE.md.

engine-main-usage-skyline =
    використання: kshana skyline --preset <name> [--json]
    { "   " }або: kshana skyline --presets
    { "   " }або: kshana skyline --profile <skyline.json|skyline.toml>

    Виводить пресет горизонту (city-street, harbour-approach, fjord, container-terminal) із його
    походженням і зрізом на кожен градус азимута, список пресетів або розділ горизонту,
    зведений до 360-елементної таблиці, яку використовує рушій. Пресети REPRESENTATIVE; docs/SKYLINE.md.

engine-main-usage-lunanet-afs-check =
    використання: kshana lunanet-afs-check spec [--json] [--strict]
    { "   " }або: kshana lunanet-afs-check symbols <file> [--max-sp-errors <n>] [--json]
    { "   " }або: kshana lunanet-afs-check generate --frames <n> [--toi0 <t>] --out <file>

    Прив'язано до LunaNet Interoperability Specification V5, Applicable Document 1 Volume A (LSIS-AFS
    V1.0, 29 January 2025). `spec` перевіряє цю реалізацію за надрукованими в документі кодовими
    таблицями та розв'язаними прикладами (пороги B1–B10 з xval/lunanet-afs/PREREGISTRATION.md; із --strict
    код виходу дорівнює 1, якщо виконано не кожен поріг). `symbols` перевіряє потік символів
    жорсткого рішення (текст із 0 та 1) на синхронізаційний шаблон, декодування SB1, FID, безперервність TOI та
    інтервал кадрів; підкадри 2–4 (LDPC, CRC-24Q) НЕ перевіряються. `generate` записує тестовий потік
    символів із підкадрами-заповнювачами; це не форма сигналу, і Kshana не записує жодного сигналу. Щоб
    захопити або супроводжувати форму сигналу AFS у записі, використайте `kshana iq acquire --signal lunanet-afs-i`
    (або lunanet-afs-q). Лише консультативно. docs/LUNANET-AFS.md.

engine-main-usage-standards-pack =
    використання: kshana standards-pack list
    { "   " }або: kshana standards-pack run <id> [--json] [--out <base>]
    { "   " }або: kshana standards-pack rows <id>
    { "   " }або: kshana standards-pack tests <id>

    Пакет стандартів — це набір сценаріїв, оцінених за порогами, заданими до запуску, пов'язаний із
    рядками звіту compliance, для яких він підтримує докази (supports evidence for). `run` виводить таблицю (або --json) і, із
    --out, записує <base>.pack.json та <base>.pack.md; передайте JSON у `kshana compliance-report`,
    щоб побачити рядки. Випробування, яке потребує журналу приймача, позначається як NEEDS INPUT і не оцінюється.
    MODELLED: поріг MET означає, що модельований сценарій досяг заданого порогу, а не те, що будь-який продукт задовольняє
    вимогу. docs/compliance/README.md.

engine-main-applies = { $fmt }: застосовується

engine-main-wrote = записано { $path }

engine-main-note = примітка: { $n }

engine-main-error-example-extra-argument = помилка: несподіваний аргумент '{ $extra }' після `example <name>`; вона приймає одну назву

engine-main-lunanet-afs-generate-needs = generate потребує --frames <n> і --out <file> (та цілого числа --toi0)

engine-evidence-cli-usage =
    використання:
    { "  " }kshana evidence keygen --out <keyfile>
    { "  " }kshana evidence verify <bundle-dir> --pubkey <hex|file> [--log <full-log>] [--require-timestamp] [--tsa-ca <anchors.pem>]
    { "      " }[--allow-unpinned] [--json]      вихід 0 — перевірено, 1 — збій, 3 — цілісний, але підписувача не закріплено
    { "  " }kshana evidence attach-timestamp <bundle-dir> <token.tsr> [--replace]
    { "      " }(читає токен RFC 3161 і прив'язує його до маніфесту; він НЕ перевіряє підпису
    { "      " }центру позначок часу: використайте `openssl ts -verify`)
    { "  " }kshana receiver-trust evidence <scenario.toml> --from <t0> --to <t1> --key <keyfile> --out <dir>
    { "      " }[--title <text>] [--created-utc <YYYY-MM-DDTHH:MM:SSZ|none>] [--lab-attestation <file.toml>]
    { "  " }kshana evidence round-trip <scenario.toml> --scenario <bench-scenario> --conditions <file> --from <t0> --to <t1>
    { "      " }--key <keyfile> --out <dir> [--title <text>] [--created-utc <...|none>]
    { "      " }(пов'язує сценарій, умови випробувань лабораторії, журнал приймача та його оцінку;
    { "      " }<scenario.toml> — це сценарій оцінювання receiver-trust; жодного сигналу не записує)
    { "  " }<t0>/<t1>: секунди від першої епохи журналу або час UTC за ISO-8601, коли журнал
    { "  " }вказує свій час початку. Пакет — це технічний запис, а не юридичний висновок.

engine-evidence-cli-fingerprint = відбиток: { $fp }

engine-evidence-cli-verify-failure = { "  " }збій: { $f }

engine-evidence-cli-verify-note = { "  " }примітка: { $n }

engine-evidence-cli-verified-pinned = VERIFIED: кожен хеш, ланцюг і підпис збігаються для наданого вами ключа.

engine-evidence-cli-verified-unpinned = VERIFIED за ключем, який пакет називає сам, відбиток { $fp } (підписувача НЕ закріплено; передайте --pubkey).

engine-evidence-cli-intact-signer-not-pinned = INTACT, BUT THE SIGNER IS NOT PINNED: хеші та підпис узгоджені з ключем { $fp }, який пакет називає сам. Передайте --pubkey <відкритий ключ підписувача>, щоб установити, хто його підписав (або --allow-unpinned, щоб прийняти це свідомо).

engine-evidence-cli-not-verified = NOT VERIFIED: див. збої вище.

engine-evidence-cli-attached = додано { $path }

engine-evidence-cli-verify-with = перевірте командою: kshana evidence verify { $out } --pubkey <відкритий ключ підписувача>

engine-interference-map-cli-usage-map =
    використання: kshana interference-map adsb <input.csv|trace.json[.gz]|dir> --dataset <adsb-lol|custom> --out <dir> [--cell-deg <deg>]
    { "   " }або: kshana interference-map ais <input.csv> --dataset <noaa-marinecadastre|kystverket|custom> --out <dir> [--land <land.geojson>] [--cell-deg <deg>]
    { "   " }або: kshana interference-map daily <input.csv|trace.json[.gz]|dir> --dataset <adsb-lol|custom> --day <YYYY-MM-DD> --out <dir> [--cell-deg <deg, { $lit_0_5 } or coarser>] [--bbox <south,west,north,east>] [--delay-hours <24 or more>]
    { "   " }або: kshana interference-map sensitivity <input.csv|trace.json[.gz]|dir> --dataset <adsb-lol|custom> --day <YYYY-MM-DD> --out <report.json> [--bbox <south,west,north,east>]
    { "   " }або: kshana interference-map fetch-land --out <land.geojson> --allow-network
    { "   " }(--dataset custom також потребує --licence <text> --licence-url <url> --attribution <text>)

engine-interference-map-cli-usage-route = використання: kshana route-exposure --route <route.geojson|route.csv> --map <map.geojson|dir> [--map ...] [--from <YYYY-MM-DD>] [--to <YYYY-MM-DD>] [--out <report.json>] [--json]

engine-interference-map-cli-col-date = дата

engine-interference-map-cli-col-src = джерело

engine-interference-map-cli-col-degraded = погіршено

engine-interference-map-cli-col-not-degraded = не погіршено

engine-interference-map-cli-col-unassessed = не оцінено

engine-interference-map-cli-col-not-observed = не спостерігалося

engine-bench-cli-usage =
    використання: kshana bench spec
    { "   " }або: kshana bench truth --task a --data <extracted JammerTest 2024 dir> --split <dev|test|holdout|all> --out <truth.json>
    { "   " }або: kshana bench cases --task <c|d> --split <dev|test|holdout> --out <dir> [--clocks <clocks.txt>] [--scale <0..1>] [--seed-file <file>]
    { "   " }або: kshana bench score --truth <truth.json> --predictions <predictions.json> [--threshold <x>] [--out <result.json>]
    { "   " }або: kshana bench baseline --task <a|b|c|d> --split <dev|test|holdout> --out <dir> [--data <dir>] [--clocks <clocks.txt>] [--scale <0..1>] [--seed-file <file>]
    { "   " }або: kshana bench seal --task <a|b|c|d> --seed-file <file> [--new]
    { "   " }або: kshana bench reveal-check --task <a|b|c|d> --seed-file <file> --commitment <hex>
    { "   " }або: kshana bench manifest --task a --data <extracted dir> [--archive <tar.gz>] --out <manifest.json>
    { "   " }або: kshana bench verify-manifest <manifest.json> --root <dir>
    { "   " }або: kshana bench validate <result.json>...
    { "   " }або: kshana bench leaderboard [<results dir|result.json>...] --out <page.html> [--fragment]   (без входів: порожній стан; --fragment: вбудовуваний розділ)
    { "   " }(файл seed містить секрет запечатаного holdout; тримайте його поза системою керування версіями)

engine-bench-cli-match = збігається

engine-bench-cli-valid = { $f }: дійсний

engine-bench-cli-folders = { $n } тек

engine-bench-cli-unpinned = не закріплено: { $rel }

engine-bench-cli-missing = відсутнє: { $rel }

engine-bench-cli-mismatch-line = MISMATCH: { $rel }

engine-osnma-cli-usage =
    використання: kshana osnma verify <input> [options]

    { "  " }<input>                    сторінки I/NAV: простий формат (див. docs/OSNMA.md) або
    { "                             " }CSV-розкладка опублікованих тестових векторів
    { "  " }--format pages|vector-csv|ubx
    { "                             " }розкладка входу (типово: за вмістом файлу). ubx — це байтовий
    { "                             " }потік u-blox із повідомленнями UBX-RXM-SFRBX (Galileo E1-B)
    { "  " }--start-gst SECONDS        час початку CSV векторів у секундах GST
    { "                             " }(типово: береться з імені файлу на кшталт 16_AUG_2023_GST_05_00_01.csv)
    { "  " }--merkle-root HEX          довірений корінь Меркла (64 шістнадцяткові цифри) для перевірок DSM-PKR
    { "  " }--public-key ID:TYPE:HEX   довірений відкритий ключ, TYPE p256 або p521, стиснута точка
    { "  " }--reference-time SECONDS   поточний час у секундах GST із незалежного джерела. Один
    { "                             " }момент: підкадри, дальші від нього за допуск, відкладаються
    { "                             " }вбік, тож використовуйте його для живих або щойно записаних даних
    { "  " }--max-time-error SECONDS   найбільша відстань підкадру від опорного часу, менша
    { "                             " }за 30 (типово 29); потребує --reference-time
    { "  " }--epochs                   також вивести результат кожного тегу
    { "  " }--json                     вивести JSON замість тексту

    Код виходу: 0 — виконано, 2 — помилка використання або входу, 3 — перевірка даних якогось супутника не пройшла.

engine-iq-cli-usage =
    використання: kshana iq scene   <out> --rate <hz> --duration <s> --signal <name> --prn <list> [--doppler <list>] [--cn0 <dbhz>] [--noise-figure <db> | --no-noise] [--seed <n>] [--data] [--center <hz>] [--if <hz>] [--format <fmt>|sigmf|sdrx[:ci16_le]] [--truth <path>] [--truth-format csv|jsonl] [--threads <n>]
    { "   " }або: kshana iq scene   <out> --rate <hz> --window <s> --nav <rinex_nav> --rx-pos lat,lon,alt [--start <tow_s>] [--prn <list>] [--mask <deg>] [--cn0 <dbhz>] [--no-noise] [--format <fmt>|sigmf|sdrx[:ci16_le]]
    { "   " }або: kshana iq acquire <recording> --signal <name> --prn <list> [--coherent <N>] [--noncoherent <M>] [--doppler-max <hz>] [--doppler-step <hz>] [--pfa <p>] [--json <out>] [--csv <out>] [--surface <path> [--surface-format csv|json|bin]]
    { "   " }або: kshana iq track   <recording> --signal <name> --prn <list> [--design <file.toml> [--design-name <n>]] [--pll-bw <hz>] [--fll-bw <hz>] [--dll-bw <hz>] [--spacing <chips>] [--extra-taps <chips,...>] [--coherent <N>] [--reacquire] [--threads <N|auto>] [--max-seconds <s>] [--acq-coherent <N> (типово auto, ≈4 ms когерентно)] [--acq-noncoherent <M>] [--doppler-max <hz>] [--epochs <path> [--epochs-format csv|jsonl|bin]] [--events <path>] [--summary <path>] [--json <out>] [--csv <out>]
    { "   " }або: kshana iq sweep   <recording> --signal <name> --prn <list> (--design <file.toml> | [--pll-bw <list>] [--dll-bw <list>] [--spacing <list>] [--coherent <list>]) [--reacquire] [--threads <N|auto>] [--max-seconds <s>] [--doppler-max <hz>] [--epochs <path>] [--events <path>] [--json <out>] [--csv <out>]
    { "   " }або: kshana iq labfit  <scenario.toml> [--out-prefix <prefix>]
    { "   " }або: kshana iq campaign <campaign.toml> [--out <dir>] [--workers <n>] [--no-resume] [--max-cells <n>] [--dry-run] [--json <out>]
    { "   " }або: kshana iq campaign report <out-dir>
    { "   " }або: kshana iq conditions <test-conditions.toml|json>
    { "   " }або: kshana iq frontend <in> <out> [--bandpass lo,hi] [--notch] [--blank <thr>] [--excise] [--agc] [--bits <n>] [--out-format <fmt>]
    { "   " }або: kshana iq monitor <recording> [--power] [--spectral] [--settings <toml|json>] [--baseline <s>] [--signal <name> --prn <list> [--spacing <chips>] [--pll-bw <hz>] [--fll-bw <hz>] [--dll-bw <hz>] [--coherent <N>] [--cn0-windows <M>] [--doppler-max <hz>]] [--max-seconds <s>] [--follow [--idle-timeout <s>]] [--json <out>] [--csv <prefix>]
    { " " }сценарії labfit: [[runs]] журналів приймача або [input] campaign = "<out-dir>", що називає вихідну теку кампанії kshana iq campaign (відносно файлу сценарію)
    { " " }проєкти контурів: файл TOML kshana.loop-design/1 (docs/design/LOOP-DESIGN-TOML.md); явні прапорці контурів і захоплення перевизначають вибраний проєкт
    { " " }acquire/track/sweep також приймають прапорці вхідного каскаду [--bandpass lo,hi] [--notch] [--blank <thr>] [--excise] [--agc] [--bits <n>], застосовані до обробки (і до захоплення, і до проходу стеження)
    { " " }параметри каналу сцени: [--iono-stec <tecu> | --iono-vtec <tecu> | --iono-klobuchar] [--tropo [--tropo-doy <n>]] [--s4 <v> [--scint-tau0 <s>]] [--sigma-phi <rad>] [--multipath-height <m> [--multipath-ground dry|wet|sea]] [--land-mobile] [--nlos]
    { " " }профіль C/N0 сцени: [--cn0-profile <toml>] залежні від часу зсуви C/N0 для кожного супутника (стрибок, лінійне наростання, точки, завмирання), застосовані поверх каналу; cn0_dbhz істини йому відповідає
    { " " }записи/сирі входи без допоміжного файлу також приймають: --format <format> --rate <hz> [--center <hz>] [--if <hz>] [--header <bytes>] [--channels <n>]; багатопотокові входи приймають --channel <k>
    { " " }сигнали: gps-l1ca gps-l5i gps-l5q gps-l2c galileo-e1b galileo-e1c galileo-e5a-i galileo-e5a-q beidou-b1i beidou-b1c glonass-l1of lunanet-afs-i lunanet-afs-q
    { " " }<list> — це список через кому (по одному на --prn або одне значення для всіх)

engine-iq-cli-usage-error = помилка використання: { $m }

engine-iq-io-cli-usage =
    використання: kshana iq inventory <dir> [--recursive] [--no-hash] [--workers <n>] [--json <out.json>] [--csv <out.csv>]
    { "   " }або: kshana iq info <recording>
    { "   " }або: kshana iq extract <in> <out> --start <s> --duration <s> [--to <format>]
    { "   " }або: kshana iq convert <in> <out> --to <format> [--gain <g>]
    { "   " }або: kshana iq decimate <in> <out> (--factor <d> | --up <l> --down <m>) [--to <format>] [--if-hz <hz>] [--invert]
    { " " }сирі входи без допоміжного файлу також приймають: --format <format> --rate <hz> [--center <hz>] [--if <hz>] [--header <bytes>] [--channels <n>]
    { " " }багатопотокові входи (багатоканальний SigMF, чергований сирий) приймають --channel <k> (від 0; типово 0)
    { " " }формати: ci8 cu8 ci16_le ci16_be cu16_le cu16_be cf32_le cf32_be, 12-бітові в 16 ci12r_le ci12l_be cu12r_le ..., упаковані 4-бітові ci4_msb cu4_lsb ..., упаковані 2-бітові c2tc_msb c2sm_lsb r2ob_msb ..., 2 біти на байт c2sm_byte ..., дійсні r..., Q-first ..._qi

engine-telemetry-cli-usage =
    використання: kshana trust-telemetry [options]
    { "  " }вхід (типово: рядки JSON зі stdin):
    { "    " }--input <file|->         читати рядки JSON з файлу або `-` зі stdin
    { "    " }--result <result.json>   відтворити епохи файлу результату `kshana receiver-trust`
    { "  " }Prometheus:
    { "    " }--listen <addr:port>     віддавати /metrics (типово 127.0.0.1:9464, коли не вибрано іншого виходу)
    { "    " }--print-metrics          вивести остаточну експозицію в stdout наприкінці входу
    { "    " }--hold                   продовжувати віддавати після завершення входу
    { "    " }--expose-position        також публікувати положення, повідомлене приймачем, як датчики (типово вимкнено)
    { "  " }syslog (CEF або LEEF у конверті RFC 5424):
    { "    " }--syslog-udp <host:port> | --syslog-tcp <host:port> | --print-syslog
    { "    " }--syslog-octet-counting  кадрувати повідомлення TCP з підрахунком октетів (RFC 6587), не по одному на рядок
    { "    " }--format cef|leef        діалект корисного навантаження (типово cef)
    { "    " }--syslog-all             одна подія на епоху (типово: одна на зміну смуги)
    { "    " }--host <name>            ім'я пристрою-хоста в подіях (типово `kshana`)
    { "  " }Home Assistant / пристрій NTP (стан JSON + виявлення MQTT; лише публікація, без облікових даних чи TLS):
    { "    " }--mqtt-tcp <host:port>   публікувати на локальний брокер MQTT 3.1.1 (утримувані повідомлення, QoS 0)
    { "    " }--print-mqtt             вивести повідомлення як рядки `topic<TAB>payload`
    { "    " }--mqtt-prefix <p>        префікс теми стану (типово kshana/trust); --mqtt-node <id> (типово kshana)
    { "    " }--mqtt-discovery <p>     префікс виявлення Home Assistant (типово homeassistant)
    { "  " }OpenTelemetry (збірка з --features otlp):
    { "    " }--otlp <http://host:4318/v1/metrics>  --otlp-every <epochs> (типово 10)

engine-jammertest-cli-usage =
    використання:
    { "  " }kshana jammertest import --attack-log <scenario.json> [--time-shift-h <h>] (--log-start <time> | --log <file> --format <fmt>)
    { "  " }kshana jammertest import --catalog <testcatalog.json> --plan <plan.json> [--plan <plan.json> ...]
    { "        " }[--location <n>] (--log-start <YYYY-MM-DDTHH:MM:SSZ> | --log <file> --format <ubx|rinex|android|nmea>)
    { "        " }[--local-offset-h <h>] [--year <y>] [--out <events.toml>]
    { "  " }kshana jammertest score <session.toml> --attack-log <scenario.json> [--time-shift-h <h>] [ті самі параметри]
    { "  " }kshana jammertest score <session.toml> --catalog <testcatalog.json> --plan <plan.json> [--plan ...]
    { "        " }[--location <n>] [--log-start <time>] [--local-offset-h <h>] [--year <y>]
    { "        " }[--recover-hold-s <s>] [--guard-s <s>] [--json]
    { "        " }[--key <keyfile> --out <dir> [--title <t>] [--created-utc <time>|none]]
    План і каталог — це опубліковані файли JSON NPRA/jammertest-plan (MIT; отримайте їх за допомогою
    xval/jammertest-plan/fetch.sh). Часи плану — місцевий настінний час; --local-offset-h (типово 2, CEST)
    вказує, наскільки вони відрізняються від UTC. Позначки attack_log набору даних JammerTest 2024 мають Z, але є місцевим
    часом: --time-shift-h типово дорівнює -2. Події — це заплановані істинні значення, а не записані ефірні часи.
    Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу.

engine-nmea-synth-cli-usage =
    використання: kshana nmea-scenario <scenario.toml> [options]

    Записує або передає потоком синтетичний набір NMEA 0183 для містка (GGA RMC VTG GSV GSA GNS ZDA HDT VBW)
    для траєкторії судна зі сценарними подіями глушіння/спуфінгу та журналом інструктора.
    Лише для навчання та випробувань: ніколи не подавайте його в живі навігаційні системи судна.

    параметри:
    { "  " }--out <file.nmea>          записати потік у файл (типово <name>.nmea, коли не задано
    { "                             " }мережевого виходу)
    { "  " }--instructor-log <prefix>  записати <prefix>.json і <prefix>.txt (типово: поряд із
    { "                             " }файлом, інакше <name> у поточній теці)
    { "  " }--tcp <addr:port|port>     віддавати потік через TCP (спершу чекає на клієнта); голий
    { "                             " }порт слухає лише 127.0.0.1. Автентифікації немає:
    { "                             " }будь-хто, хто може дістатися адреси, може читати потік
    { "  " }--udp <addr:port|port>     надсилати одне речення в датаграмі UDP на цю адресу; голий
    { "                             " }порт надсилає на 127.0.0.1
    { "  " }--broadcast                дозволити --udp використовувати широкомовну адресу
    { "  " }--wait-clients <n>         кількість клієнтів, на яких чекати перед стартом потоку TCP (типово 1)
    { "  " }--realtime                 темп у реальному часі (типово для мережевого виходу)
    { "  " }--speed <x>                темп у x разів швидше за реальний; 0 — якнайшвидше
    { "                             " }(типово для файлів)
    { "  " }--seed <n>                 замінити seed сценарію
    { "  " }--no-marker                пропустити речення-маркер синтетичних даних

engine-live-io-usage =
    використання: kshana receiver-trust live <session.toml> [--stdin | --file <path> [--follow] [--from-end] | --tcp <host:port> | --udp <[addr:]port> | --serial <device> [--baud <n>]] [--replay] [--gate [--listen tcp:[<addr>:]<port>]] [--json <path|->] [--pksht <path|->]

    Читає NMEA 0183 (типово зі stdin), оцінює кожну епоху визначення судна за шкалою 0–100 і записує один
    рядок JSON на епоху (типово в stdout). З --gate натомість у stdout пропускається потік NMEA,
    без змін, поки визначенню довіряють, і з позначкою недійсного визначення, поки ні, після кожного
    циклу йде речення $PKSHT; тоді JSON іде лише туди, куди вказує --json. Сесія — це
    сценарій .toml з [platform] kind = "vessel"; його таблиця [log] не потрібна.

    --listen (з --gate) віддає потік після перевірки будь-якій кількості клієнтів TCP (наприклад,
    картплотеру) замість запису в stdout; типова адреса — loopback. Клієнт, який
    не встигає, відкидається, тож він ніколи не затримує інших чи вхід.

    Час приймача також звіряється з годинником цього комп'ютера, що має сенс лише для
    потоку, який надходить у реальному часі; для збереженого журналу, поданого швидше (stdin, tcp, udp), передайте
    --replay, а звичайний --file (без --follow) уже це робить.

    --serial читає послідовний або USB-пристрій (лише Unix), лише читання: він відкриває пристрій для читання, встановлює
    локальну лінію в сирий режим на --baud (типово 4800, швидкість NMEA 0183) і ніколи не записує жодного байта в
    приймач. Kshana не налаштовує приймачів; налаштуйте приймач на виведення NMEA його власним засобом.

    Це консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу (IEC 61108, IEC 61162):
    відповідальність за навігацію судна залишається на операторі.

engine-tle-warning = попередження: { $w }

engine-e-animation-no-time-series-to-animate = немає часового ряду для анімації: результат { $k } не містить дискретизованої осі часу (форми, які розпізнає експортер, див. у docs/ANIMATION.md)

engine-animation-svg-sub = вид { $kind } · від { $t0 } до { $t1 } · відліки з result.json, накреслені без передискретизації · Kshana { $version }

engine-animation-svg-strip-events = події

engine-animation-svg-strip-phases = фази

engine-animation-svg-waterfall = водоспад: { $title } [{ $unit }], час іде вниз, колір від { $lo } до { $hi }

engine-animation-svg-mhz = { $f } MHz

engine-animation-epoch-index = індекс епохи

engine-animation-svg-desc = Анімований часовий ряд прогону { $kind }: панелей — { $n_panels }, подій — { $n_events }, фаз — { $n_phases }. Кожна точка — це відлік із result.json прогону.

engine-animation-html-title = { $title } — анімація Kshana

engine-animation-html-sub = вид { $kind } · рядів із result.json: { $n }, накреслені без передискретизації · Kshana { $version }

engine-animation-html-playback = Відтворення

engine-animation-html-play = Відтворити

engine-animation-html-pause = Пауза

engine-animation-html-mission-time = Час місії

engine-animation-html-speed = швидкість

engine-animation-html-playback-speed = Швидкість відтворення

engine-animation-html-events = Події

engine-animation-html-footer-keys = Пробіл відтворює або призупиняє, стрілки роблять крок, Home і End — перехід на початок і в кінець. Це відтворення власних відліків прогону: воно таке саме добре, як сам прогін, і не додає доказів (MODELLED, внутрішня узгодженість).

engine-animation-html-footer-determinism = Той самий сценарій, seed і параметри дають побайтово ідентичний файл.

engine-animation-html-exports-heading = Експорти, записані поряд із цим програвачем

engine-animation-js-phases-and-events = фази й події

engine-animation-js-waterfall = водоспад: { $title } [{ $unit }], час іде вниз

engine-animation-js-now = t = { $time }

engine-animation-js-phase = фаза: { $name }

engine-e-evidence-bundle-bad-log-slice = хибний зріз журналу: { $s }

engine-e-evidence-bundle-bad-window = хибне вікно: { $s }

engine-e-evidence-bundle-bad-creation-time = хибний час створення: { $s }

engine-e-evidence-bundle-bad-timestamp-token = хибний токен позначки часу: { $s }

engine-e-evidence-bundle-cannot-serialise = не вдається серіалізувати: { $s }

engine-e-osnma-page-not-valid-hex = сторінка не є коректним hex

engine-e-osnma-page-time-outside-week-number = час сторінки поза межами 4096 тижнів номера тижня Galileo

engine-e-osnma-page-bad-length = сторінка має { $n } шістнадцяткових цифр, очікується 60

engine-e-osnma-page-malformed-line = хибно сформований рядок сторінки: { $s }

engine-e-interchange-encode-payload = не вдалося закодувати корисне навантаження: { $e }

engine-e-interchange-invalid-envelope = не є коректним конвертом обміну: { $e }

engine-e-interchange-not-kshana-artifact = не артефакт Kshana: формат { $found }, очікується { $expected }

engine-e-interchange-incompatible-schema-version = несумісна версія схеми { $v } ({ $verdict }); цей рушій розмовляє { $current }

engine-e-interchange-payload-mismatch = корисне навантаження не відповідало запитаному типу: { $e }

engine-e-interop-not-applicable = не застосовується: { $why }

engine-e-iq-io-error = помилка вводу/виводу: { $m }

engine-e-iq-format-error = помилка формату: { $m }

engine-e-iq-signals-prn-not-defined = { $signal }: PRN { $prn } не визначено в ICD

engine-e-iq-signals-glonass-channel-outside = частотний канал GLONASS { $k } поза межами -7..=6

engine-e-iq-signals-code-table = таблиця кодів: { $m }

engine-e-kepler-out-of-domain = рівняння Кеплера: M або e поза областю визначення

engine-e-kepler-no-convergence = рівняння Кеплера не збіглося за { $iters } кроків (залишок { $residual })

engine-e-lunar-orientation-epoch-outside-series = епоха { $t } юліанських століть від J2000 поза рядом місячної орієнтації DE440 ({ $first } .. { $last }, 2014-01-01 .. 2030-12-31 TDB)

engine-e-propagator-sgp4-error = помилка поширення SGP4 (код { $code })

engine-e-integrator-dop853-stopped = DOP853 зупинився при t = { $t } ({ $failure }) після { $accepted } кроків

engine-e-portable-distr-variance-non-finite = дисперсія нескінченна в нормальному розподілі

engine-e-portable-distr-shape-not-positive = параметр форми не додатний у гамма-розподілі

engine-e-portable-distr-scale-not-positive = параметр масштабу не додатний у гамма-розподілі

engine-bench-tasks-clock-line-before-header = рядок годинника стоїть перед будь-яким заголовком `@<PRN>`

engine-api-html-clock = Годинник

engine-api-html-fom-heading = Показники якості

engine-api-html-metric = Метрика

engine-api-html-value = Значення

engine-api-html-validation = Валідація

engine-api-html-tier-note = Кожен показник якості позначено VALIDATED (перевірено за зовнішнім оракулом) або MODELLED (за першими принципами, внутрішньо протестовано), виведено з матриці верифікації.

engine-api-html-default-title = Kshana — результат сценарію

engine-api-html-study-title = { $title } — Kshana

engine-api-html-eyebrow = क्षण · точний момент

engine-api-html-tagline = Гібридна квантово-класична таблиця показників PNT

engine-api-html-chart-alt = Графік результату

engine-api-html-full-result = Повний результат (JSON)

engine-api-html-footer-generated = Створено Kshana { $version }.

engine-api-html-footer-licence = Відтворюється зі сценарію + seed + версії рушія. Вільне програмне забезпечення з відкритим кодом (AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">джерело &amp; документація</a>.

engine-leo-signal-mhz-pair = { $centre } MHz, { $bandwidth } MHz

engine-spectrum-dbw-per-hz = { $level } dBW/Hz

engine-mcp-main-usage =
    kshana-mcp: сервер Model Context Protocol для симулятора стійкості PNT Kshana.

    ВИКОРИСТАННЯ:
    { "    " }kshana-mcp                      обслуговувати через stdio (типово; те, що запускають клієнти MCP)
    { "    " }kshana-mcp --http <addr>        обслуговувати потоковий HTTP на http://<addr>/mcp

    ПАРАМЕТРИ HTTP:
    { "    " }--http <addr>               адреса прив'язки, напр. 127.0.0.1:8080 (типово лише loopback)
    { "    " }--allow-remote              дозволити адресу, що не є loopback; потребує KSHANA_MCP_HTTP_TOKEN
    { "    " }--allowed-host <host[:port]>  додатковий прийнятий заголовок Host (можна повторювати)
    { "    " }--allow-origin <origin>     прийнятий origin браузера (можна повторювати; типово жодного)
    { "    " }--max-body-bytes <n>        обмеження тіла запиту (типово 5242880)
    { "    " }--request-timeout-secs <n>  ліміт часу на запит (типово 120)
    { "    " }--max-concurrent <n>        запитів, що обслуговуються одночасно (типово 8)

    Транспорт HTTP вимикає файлові засоби IQ. Kshana не хостить кінцевої точки: запускайте його самостійно.{ "\u000A" }

engine-e-mcp-main-unknown-argument = невідомий аргумент `{ $other }`

engine-e-mcp-main-http-options-need-http = параметри HTTP потребують --http <addr>

engine-e-mcp-http-refusing-to-bind = відмова прив'язатися до { $addr }: це не адреса loopback. Використайте 127.0.0.1:<port> або передайте --allow-remote (і задайте { $token_env }), щоб слухати за межами цієї машини

engine-e-mcp-http-refusing-to-bind-needs-token = відмова прив'язатися до { $addr }: адреса, що не є loopback, потребує токена bearer у змінній середовища { $token_env }

engine-e-mcp-http-token-too-short = { $token_env } коротший за 16 символів; використайте довгий випадковий токен

engine-e-mcp-http-limits-must-be-above-zero = --max-body-bytes, --max-concurrent і --request-timeout-secs мають бути більшими за нуль

engine-e-mcp-http-allow-origin-wildcard = --allow-origin не приймає `*`; назвіть кожен origin

engine-mcp-http-warning-remote = УВАГА: kshana-mcp слухає на { $addr } за межами цієї машини. Будь-хто, хто може до нього дістатися і має токен bearer, може запускати симуляції на вашому обладнанні. Поставте перед ним TLS (зворотний проксі або HTTPS вашої платформи) і тримайте токен у таємниці.

engine-e-lunar-ascent-site-latitude-must-be-in = широта майданчика має бути в [-90, 90], а довгота — в [-180, 360]

engine-e-lunar-ascent-ascent-must-be-in-120 = ascent_s має бути в [120, 1800]

engine-e-lunar-ascent-afs-mode-must-be-off = afs_mode має бути off, standalone або differential, отримано `{ $o }`

engine-e-lunar-ascent-lunar-time-mode-must-be = lunar_time_mode має бути off, ltc або tt, отримано `{ $o }`

engine-e-lunar-ascent-relays-must-be-in-24 = n_relays має бути в 3..=24

engine-e-lunar-ascent-afs-interval-must-be-positive = afs_interval_s має бути додатним, а afs_first_fix_s — невід'ємним

engine-e-lunar-ascent-insertion-altitude-km-must-be = insertion_altitude_km має бути в [10, 1000]

engine-e-lunar-ascent-entry-covariance-is-not-symmetric = вхідна коваріація не симетрична або має від'ємну діагональ

engine-e-lunar-ascent-lunar-ascent-expects-the-entry = lunar-ascent очікує вхідний годинник у LTC або TT, отримано { $timescale }; ланцюг перетворює шкали часу

engine-e-lunar-landing-descent-must-be-in-60 = descent_s має бути в [60, 3600]

engine-e-lunar-landing-trn-source-must-be-off = trn_source має бути off, terrain-nav або lola-crlb, отримано `{ $o }`

engine-e-lunar-landing-fix-times-must-be-positive = моменти визначень мають бути додатними, afs_interval_s > 0, а trn_fix_time_s — в межах спуску

engine-e-lunar-landing-trn-window-must-be-at = trn_window_m має бути не менше 3600

engine-e-lunar-landing-trn-height-sigma-must-be = trn_height_sigma_m має бути додатним

engine-e-lunar-landing-lola-crlb-needs-the-dem = lola-crlb потребує DEM, який не вдалося завантажити

engine-e-lunar-landing-lunar-descent-expects-the-entry = lunar-descent очікує вхідний годинник у LTC або TT, отримано { $timescale }; ланцюг перетворює шкали часу

engine-e-lunar-landing-east-prior-is-not-positive = апріорна оцінка за сходом не є додатно визначеною

engine-e-lunar-landing-north-prior-is-not-positive = апріорна оцінка за північчю не є додатно визначеною

engine-e-lunar-rendezvous-gravity-table-path = gravity_table_path { $p }: { $e }

engine-e-lunar-rendezvous-orbit-must-be-llo-or = orbit має бути `llo` або `elfo`, отримано `{ $o }`

engine-e-lunar-rendezvous-periapsis-must-be-at-least = періапсида має бути щонайменше на 20 км над поверхнею

engine-e-lunar-rendezvous-separation-must-be-in-50000 = separation_m має бути в (0, 50000)

engine-e-lunar-rendezvous-step-must-be-in-60 = step_s має бути в (0, 60], а arc_s — щонайменше один крок

engine-e-lunar-rendezvous-relays-must-be-in-24 = n_relays має бути в 4..=24

engine-e-lunar-rendezvous-integration-must-be-positive = integration_s має бути додатним

engine-e-lunar-rendezvous-common-mode-fraction-must-be = common_mode_fraction має бути в [0, 1)

engine-e-lunar-rendezvous-filter-model-must-be-same = filter_model має бути `same` або `point-mass`, отримано `{ $o }`

engine-e-lunar-rendezvous-lunar-orbit-rendezvous-expects-the = lunar-orbit-rendezvous очікує вхідну коваріацію в MCI; ланцюг перетворює системи відліку

engine-e-lunar-rendezvous-prior-covariance-is-not-positive = апріорна коваріація не є додатно визначеною

engine-e-lunar-rendezvous-normal-equations-are-not-positive = нормальні рівняння не є додатно визначеними

engine-e-lunar-rendezvous-posterior-information-is-not-positive = апостеріорна інформація не є додатно визначеною

engine-e-lunar-rendezvous-no-trial-ran = жодного випробування не виконано

engine-e-lunar-surface-map-season-date-is-not-yyyy = дата сезону `{ $s }` не має вигляду YYYY-MM-DD

engine-e-lunar-surface-map-season-date-bad-year = дата сезону `{ $s }`: хибний рік

engine-e-lunar-surface-map-season-date-bad-month = дата сезону `{ $s }`: хибний місяць

engine-e-lunar-surface-map-season-date-bad-day = дата сезону `{ $s }`: хибний день

engine-e-lunar-surface-map-season-date-is-outside-1901 = дата сезону `{ $s }` поза 1901-2099 або не є датою

engine-e-lunar-surface-map-sites-must-hold-between-and = sites має містити від 1 до 64 записів

engine-e-lunar-surface-map-site-latitude-must-be-in = майданчик { $i }: широта має бути в [-90, 90], а довгота — в [-180, 360]

engine-e-lunar-surface-map-season-dates-must-hold-at = season_dates має містити щонайменше одну дату

engine-e-lunar-surface-map-season-dates-must-hold-at-2 = season_dates має містити щонайбільше 16 дат

engine-e-lunar-surface-map-window-days-must-be-in = window_days має бути в (0, 400], а step_min — в [1, 720]

engine-e-lunar-surface-map-stay-days-and-timing-floor = stay_days і timing_floor_s мають бути додатними й скінченними

engine-e-lunar-phase-epoch-is-not-yyyy-mm = епоха `{ $s }` не має вигляду YYYY-MM-DDTHH:MM:SSZ

engine-e-lunar-phase-epoch-bad-number = епоха `{ $s }`: хибне число `{ $x }`

engine-e-lunar-phase-epoch-is-outside-1901-2099 = епоха `{ $s }` поза 1901-2099 або не є датою

engine-e-clock-fit-clock-fit-replaces-must-be = { "[" }clock_fit] replaces має бути "quantum" або "classical" (отримано { $other })

engine-e-clock-fit-clock-fit = { "[" }clock_fit]: { $e }

engine-e-evidence-label-the-result-document-already-carries = документ результату вже містить ключ `evidence`

engine-e-evidence-label-the-result-document-is-not = документ результату не є об'єктом JSON

engine-e-evidence-label-no-evidence-rows-are-listed = для `{ $tool }` не перелічено жодного рядка доказів

engine-e-clock-log-not-rinex-clock-file-no-2 = не файл годинника RINEX: немає запису RINEX VERSION / TYPE

engine-e-clock-log-rinex-version-type-record-has = запис RINEX VERSION / TYPE не має номера версії (знайдено { $field })

engine-e-clock-log-rinex-clock-version-is-not = версія годинника RINEX { $v } не читається: читаються версії 2.00 і від 3.00 до 3.04 (IGS публікує формат годинника до 3.04; RINEX від 4.00 до 4.02 не визначають файлу годинника)

engine-e-clock-log-rinex-clock-record-with-an = запис годинника RINEX із нечитабельним зміщенням годинника або епохою: { $e }

engine-e-clock-log-timelab-line-holds-reading-that = рядок TimeLab { $line } містить показання, що не є скінченним: { $l }

engine-e-mission-thread-conversions-frame-conversion-is-not-available = перетворення систем відліку { $a } -> { $b } недоступне (перетворюються лише Gcrf, Mci і Mcmf)

engine-e-mission-thread-conversions-timescale-hop-is-not-pivot = перехід між шкалами часу { $a } -> { $b } не є переходом через опорну шкалу

engine-e-mission-thread-earth-entry-the-corridor-must-run-from = { $kind }: коридор має йти від пологого до крутішого кута менше 90 градусів, отримано від { $lo } до { $hi }

engine-e-mission-thread-earth-ground-network-ground-network-min-elevation-deg = ground_network: `min_elevation_deg` має бути в [0, 90), отримано { $min_elevation_deg }

engine-e-mission-thread-earth-ground-network-ground-network-handover-gap-must = ground_network: `handover_gap_s` має бути не менше 0

engine-e-mission-thread-earth-ground-network-ground-network-step-must-be = ground_network: `step_s` має бути більшим за 0

engine-e-mission-thread-earth-ground-network-ground-network-needs-at-least = ground_network: потрібна щонайменше одна станція

engine-e-mission-thread-earth-ground-network-ground-network-station-has-an = ground_network: станція `{ $id }` має недійсну широту або довготу

engine-e-mission-thread-earth-ground-network-ground-network-station-id-is = ground_network: ідентифікатор станції `{ $id }` використано двічі

engine-e-mission-thread-earth-ground-network-ground-network-phase-has-geometry = ground_network: фаза `{ $phase }` має геометрію "stated" і потребує `duty`

engine-e-mission-thread-earth-ground-network-ground-network-phase-duty-must = ground_network: duty фази `{ $phase }` має бути в [0, 1], отримано { $d }

engine-e-mission-thread-earth-ground-network-ground-network-phase-has-unknown = ground_network: фаза `{ $phase }` має невідому геометрію `{ $other }`; геометрії: entry-orbit, moon-direction і stated

engine-e-mission-thread-earth-ground-network-ground-network-the-entry-orbit = ground_network: вхідна орбіта не поширилася

engine-e-mission-thread-earth-ground-network-ground-network-no-geometry-to = ground_network: немає геометрії `{ $other }` для обчислення

engine-e-mission-thread-earth-ground-network-ground-network-phase-needs-gcrf = ground_network: фаза `{ $phase }` потребує вхідного значення GCRF для своєї геометрії, отримано { $frame }

engine-e-mission-thread-earth-launch-fade-must-end-after-it = { $kind }: завмирання має закінчитися після свого початку (від { $a } до { $b } s)

engine-e-mission-thread-earth-launch-expects-gcrf-entry-state-got = { $kind }: очікує вхідний стан у GCRF, отримано { $frame }; задайте вхід у gcrf

engine-e-mission-thread-earth-launch-the-phase-produced-no-samples = { $kind }: фаза не дала жодного відліку

engine-e-mission-thread-earth-model-unknown-model-key-the-keys = { $kind }: невідомий ключ моделі `{ $k }`; ключі: { $allowed }

engine-e-mission-thread-earth-model-the-model-needs = { $kind }: модель потребує `{ $key }`

engine-e-mission-thread-earth-model-must-be-finite-number = { $kind }: `{ $key }` має бути скінченним числом

engine-e-mission-thread-earth-model-must-be-above-got = { $kind }: `{ $key }` має бути більшим за 0, отримано { $v }

engine-e-mission-thread-earth-model-must-be-at-least-got = { $kind }: `{ $key }` має бути не менше 0, отримано { $v }

engine-e-mission-thread-earth-model-must-be-string = { $kind }: `{ $key }` має бути рядком

engine-e-mission-thread-earth-model-must-be-an-array-of = { $kind }: `{ $key }` має бути масивом таблиць

engine-e-mission-thread-earth-model-must-hold-tables = { $kind }: `{ $key }` має містити таблиці

engine-e-mission-thread-earth-model-must-be-an-array-of-2 = { $kind }: `{ $key }` має бути масивом із { $n } чисел

engine-e-mission-thread-earth-model-must-hold-numbers-got = { $kind }: `{ $key }` має містити { $n } чисел, отримано { $got_count }

engine-e-mission-thread-earth-model-must-hold-finite-numbers = { $kind }: `{ $key }` має містити скінченні числа

engine-e-mission-thread-earth-rendezvous-leg-needs-sensor = { $kind }: ділянка потребує `sensor`

engine-e-mission-thread-earth-rendezvous-the-model-needs-at-least = { $kind }: модель потребує щонайменше однієї `[[phase.model.legs]]`

engine-e-mission-thread-earth-rendezvous-leg-start = { $kind }: початок ділянки { $leg }: { $e }

engine-e-mission-thread-earth-rendezvous-leg-end = { $kind }: кінець ділянки { $leg }: { $e }

engine-e-mission-thread-earth-rendezvous-leg = { $kind }: ділянка { $leg }: { $e }

engine-e-mission-thread-earth-tli-cruise-ground-duty-must-be-in = { $kind }: `ground_duty` має бути в [0, 1], отримано { $d }

engine-e-mission-thread-earth-tli-cruise-ssv-window-and-ssv-step = { $kind }: `ssv_window_s` і `ssv_step_min` мають бути більшими за 0

engine-e-mission-thread-earth-tli-cruise-the-propagation-did-not-reach = { $kind }: поширення не досягло { $dt } s

engine-e-mission-thread-earth-tli-cruise-the-post-burn-orbit-is = { $kind }: орбіта після імпульсу не є зв'язаною (питома енергія { $energy } J/kg); замінна орбіта gnss-ssv потребує еліптичної

engine-e-mission-thread-earth-tli-cruise-the-gnss-ssv-sweep-returned = { $kind }: перебір gnss-ssv не повернув жодної смуги

engine-e-mission-thread-earth-tli-cruise-the-gnss-ssv-sweep-returned-2 = { $kind }: перебір gnss-ssv не повернув жодної групи

engine-e-mission-thread-earth-tli-cruise-the-phase-lists-gnss-ssv = { $kind }: фаза перелічує gnss-ssv, тож модель потребує `ssv_uere_m`

engine-e-mission-thread-earth-tli-cruise-the-phase-lists-ground-tracking = { $kind }: фаза перелічує ground-tracking, тож модель потребує `ground_range_sigma_m`, `ground_range_rate_sigma_mps` і `ground_interval_s`

engine-e-mission-thread-handover-handover-must-be-finite-number = передавання { $name } має бути скінченним числом не менше 0, отримано { $v }

engine-e-mission-thread-phase-its-model-is-but = фаза `{ $id }`: { $key } її моделі дорівнює { $own_s } s, але ланцюг задає тривалість фази duration_s = { $duration_s } s; узгодьте їх або приберіть { $key }

engine-e-mission-thread-phase-unknown-frame-expected-one-of = невідома система відліку `{ $other }`; очікується одна з gcrf, itrf, mci, mcmf, lvlh

engine-e-mission-thread-phase-unknown-timescale-expected-one-of = невідома шкала часу `{ $other }`; очікується одна з tt, tdb, utc, ltc

engine-e-mission-thread-phase-unknown-navigation-source-expected-one = невідоме джерело навігації `{ $other }`; очікується одне з gnss, gnss-ssv, ground-tracking, lunanet, trn, inertial, relative-optical

engine-e-mission-thread-phase-unknown-time-source-expected-one = невідоме джерело часу `{ $other }`; очікується одне з gnss, ground-clock, lunar-time, onboard-holdover

engine-e-mission-thread-scenario-must-be-positive-finite-number = { $name } має бути додатним скінченним числом, отримано { $v }

engine-e-mission-thread-scenario-handover-rule-needs = правило передавання `{ $rule }` потребує `{ $what }`

engine-e-mission-thread-scenario-unknown-handover-rule-expected-carry = невідоме правило передавання `{ $other }`; очікується carry, inflate або reacquire

engine-e-mission-thread-scenario-phase-has-an-empty-id = фаза має порожній ідентифікатор

engine-e-mission-thread-scenario-entry = вхід: { $e }

engine-e-mission-thread-scenario-entry-sigma-drift-per-must = вхід: sigma_drift_s_per_s має бути скінченним числом не менше 0

engine-e-mission-thread-scenario-entry-must-hold-six-finite = вхід: x має містити шість скінченних чисел

engine-e-mission-thread-scenario-mission-thread = mission-thread: { $e }

engine-e-mission-thread-scenario-kind-must-be-mission-thread = kind має бути "mission-thread", отримано "{ $k }"

engine-e-mission-thread-scenario-mission-thread-needs-at-least = ланцюг місії потребує щонайменше однієї [[phase]]

engine-e-mission-thread-scenario-phase-id-is-used-twice = ідентифікатор фази `{ $id }` використано двічі; ідентифікатори унікальні

engine-e-mission-thread-scenario-ground-network-phase-is-not = ground_network: фаза `{ $phase }` не є фазою цього ланцюга

engine-e-mission-thread-scenario-phase = фаза `{ $id }`: { $e }

engine-e-mission-thread-scenario-phase-ended-at-but-started = фаза `{ $id }` закінчилася о { $t_s } s, але почалася о { $start_s } s і триває { $duration_s } s

engine-e-mission-thread-sensors-unknown-relative-navigation-sensor-expected = невідомий датчик відносної навігації `{ $other }`; очікується один з optical-camera, lidar, rf-ranging

engine-e-mission-thread-sensors-range-must-be-positive-finite = дальність має бути додатним скінченним числом метрів, отримано { $range_m }

engine-e-mission-thread-sensors-range-is-beyond-the-sensor = дальність { $range_m } m перевищує межу датчика в { $max_range_m } m

engine-e-mission-thread-lunar-unknown-model-key-the-keys = { $kind }: невідомий ключ моделі `{ $bad }`; ключі: { $keys }

engine-e-receiver-trust-scenario-the-receiver-trust-evidence-rows = рядків доказів receiver-trust немає в матриці

engine-e-ssv-check-unknown-ablation-b1-to-b5 = невідома абляція `{ $other }`: B1–B5

engine-e-evidence-assemble-the-evidence-pack-rows-are = рядків пакета доказів немає в матриці

engine-e-jammertest-cli-the-jammertest-evidence-rows-are = рядків доказів jammertest немає в матриці

engine-e-clock-fit-fit-has-no-frequency-noise = { "[" }clock_fit]: підгонка не має частотного шуму (білий FM, фліккер FM і блукання FM усі нульові), тож немає з чого передбачити holdover; журнал може містити лише білий фазовий шум або бути надто коротким

engine-e-evidence-label-run-exercised-no-matrix-row = прогін не задіяв жодного рядка матриці верифікації

engine-e-lunar-ascent-expects-entry-covariance-in-mci = lunar-ascent очікує вхідну коваріацію в MCI; ланцюг перетворює системи відліку

engine-e-lunar-landing-expects-entry-covariance-in-mci = lunar-descent очікує вхідну коваріацію в MCI; ланцюг перетворює системи відліку

engine-e-lunar-surface-map-expects-entry-state-in-mci-or-mcmf = lunar-surface очікує вхідний стан у MCI або MCMF; ланцюг перетворює системи відліку

engine-e-lunar-rendezvous-sma-must-exceed-lunar-radius = sma_km має перевищувати місячний радіус, а ексцентриситет бути в [0, { $lit_0_9 })

engine-e-mission-thread-unknown-phase-kind = невідомий вид фази `{ $kind }`; зареєстровані види: { $known }

engine-e-mission-thread-scenario-nav-lists-no-source = `nav` не перелічує жодного джерела навігації

engine-e-ssv-check-training-pattern-missing = навчальний шаблон { $sv } відсутній

engine-e-api-clock-fit-needs-clock-log-table = { "[" }clock_fit] потребує таблиці [clock_log]: виміряного ряду, з якого робиться підгонка

engine-lunar-phase-no-finite-points-to-plot = немає скінченних точок для побудови

engine-partner-cli-usage =
    використання: kshana partner check <submission.toml> [--json]
    { "  " }Перевіряє формат і метадані подання партнера даних (kshana.partner-submission/1) і читає його
    { "  " }файл даних власними засобами читання рушія. Нічого не оцінює й не валідує; див. docs/PARTNER-DATA.md.
    { "  " }Код виходу 0: подання повне й читабельне; 1: знайдено помилки; 2: використання.
    Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу.

engine-evidence-verify-evidence-label-ledger-rows = мітка доказів: { $tier } ({ $row_count } рядків реєстру (ledger): { $rows }); вона всередині config.json, тож підпис її охоплює

engine-evidence-verify-no-evidence-label-pre-040-pack = немає мітки доказів (пакет до 0.40)

engine-e-ssv-check-pattern-missing = шаблон { $sv } відсутній

engine-lunar-ascent-summary = lunar-ascent | { $lat } deg | лише інерціально { $inertial_pos } m / { $inertial_vel } m/s | з AFS { $afs_pos } m / { $afs_vel } m/s | розкид виведення { $dispersion } m/s (MODELLED)

engine-lunar-ascent-chart-subtitle = інерціальний дрейф із визначеннями AFS | MODELLED, лише консультативно

engine-lunar-ascent-chart-x-axis = секунди від старту

engine-lunar-ascent-chart-series = 1-сигма положення

engine-lunar-chart-y-axis-metres = метри

engine-lunar-landing-summary = lunar-descent | { $lat } deg | лише інерціально { $none_east }/{ $none_north } m (E/N) | з допоміжними засобами { $all_east }/{ $all_north } m | розкид R95 { $r95 } m | 3-сигмовий еліпс { $major } x { $minor } m | { $inside }% усередині (очікується { $expect }%) (MODELLED)

engine-lunar-landing-chart-title = Розкид місячної посадки: R95 залежно від використаних допоміжних засобів

engine-lunar-landing-chart-subtitle = R95 за допоміжними засобами: { $aids } | MODELLED, лише консультативно

engine-lunar-landing-chart-x-axis = комбінація допоміжних засобів (індекс)

engine-lunar-landing-chart-series = R95 розкиду посадки

engine-lunar-rendezvous-summary = lunar-orbit-rendezvous | { $orbit } { $periapsis_km }x{ $apoapsis_km } km | відстань { $sep } m | визначень { $fixes }% | відн. полож. 1-сигма R/A/C { $radial }/{ $along }/{ $cross } m | середня NEES { $nees } (очікується 6) | збіглося { $converged } (MODELLED)

engine-lunar-rendezvous-converged-never = ніколи

engine-lunar-rendezvous-converged-at = на { $s } s

engine-lunar-rendezvous-chart-title = Місячне зближення: формальна 1-сигма відносного положення (3-D, m)

engine-lunar-rendezvous-chart-subtitle = { $filter_model } | визначень { $fixes }% | середня NEES { $nees } (очікується 6) | MODELLED, лише консультативно

engine-lunar-rendezvous-chart-x-axis = хвилини від початку дуги

engine-lunar-rendezvous-chart-series = 1-сигма відносного положення

engine-lunar-surface-map-summary = lunar-surface | майданчиків: { $n_sites } x сезонів: { $n_seasons } | позиціонування від { $position_min }% до { $position_max }% | найгірша доступність часу { $worst_timing }% | найдовший проміжок без часу { $gap_h } h (MODELLED)

engine-lunar-surface-map-chart-title = Карта PNT місячної поверхні: доступність за майданчиком (найгірший сезон, %)

engine-lunar-surface-map-chart-subtitle = позиціонування = 4+ ретрансляторів і PDOP нижче порога; час = один ретранслятор або Земля | MODELLED, лише консультативно

engine-lunar-surface-map-chart-x-axis = індекс майданчика

engine-lunar-surface-map-chart-y-axis = відсоток вікна

engine-lunar-surface-map-chart-series-positioning = позиціонування

engine-lunar-surface-map-chart-series-timing = час

engine-lunar-surface-map-chart-series-earth-visible = Земля видима

engine-mission-thread-weakest-link = найслабша ланка { $phase_id }

engine-mission-thread-no-phases = немає фаз

engine-mission-thread-untitled = без назви

engine-mission-thread-summary = mission-thread | фаз: { $n_phases } | { $title } | { $weak } | { $tier }

engine-mission-thread-default-title = Ланцюг місії

engine-mission-thread-chart-position-caption = 1-сигма положення, m

engine-mission-thread-chart-time-caption = 1-сигма часу, s

engine-mission-thread-chart-subtitle = MODELLED бюджет похибок навігації та часу; кожна фаза накреслена однакової ширини

engine-evidence-label-line-one-row = Докази: { $tier } · { $n } рядок реєстру (ledger) { $ids }

engine-evidence-label-line-rows = Докази: { $tier } · рядків реєстру (ledger): { $n } { $ids }

engine-evidence-label-line-rows-more = Докази: { $tier } · рядків реєстру (ledger): { $n } { $ids } +{ $n_more } ще

engine-partner-text-header = kshana partner check: { $submission }

engine-partner-text-info = { "  " }інформація: { $i }

engine-partner-text-warning = { "  " }попередження: { $w }

engine-partner-text-error = { "  " }ПОМИЛКА: { $e }

engine-partner-text-result-ok = результат: формат і метадані повні й читабельні

engine-partner-text-result-not-ready = результат: не готово; виправте помилки вище

engine-lunar-ascent-chart-title = Місячний підйом: 1-сигма навігаційного положення 3-D (m)
