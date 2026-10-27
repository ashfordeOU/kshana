# SPDX-License-Identifier: AGPL-3.0-only
# ru catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = неизвестный формат журнала часов { $other }; ожидается один из: { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = неизвестная политика пропусков { $other }; ожидается refuse, longest или linear

engine-e-clock-log-give-either-the-log-text = укажите либо текст журнала, либо путь к нему, но не то и другое сразу

engine-e-clock-log-clock-log-needs-its-text = для журнала часов нужен его текст или путь

engine-e-clock-log-tau0-must-be-finite-and = tau0_s должно быть конечным и > 0 (получено: { $t })

engine-e-clock-log-units-and-data-apply-to = units и data применяются только к формату timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel применяется только к формату ticc

engine-e-clock-log-cannot-read-clock-log = не удалось прочитать журнал часов { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = путь к журналу часов недоступен в сборке WebAssembly; передайте журнал в виде текста

engine-e-clock-log-the-log-yields-usable-sample = журнал { $format }: пригодных отсчётов: { $x }; нужно не менее 3

engine-e-clock-log-not-rinex-clock-file-no = это не файл часов RINEX: нет записи END OF HEADER

engine-e-clock-log-the-rinex-clock-file-has = в файле часов RINEX нет записей AS или AR

engine-e-clock-log-the-rinex-clock-file-holds = в файле часов RINEX содержатся часы: { $many }; укажите одни через clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = нет записей AS или AR для часов { $id }

engine-e-clock-log-the-clock-has-single-epoch = у часов единственная эпоха; tau0 определить нельзя

engine-e-clock-log-the-log-has-no-readings = в журнале { $format } нет показаний

engine-e-clock-log-unknown-phase-unit-expected-ms = неизвестная единица фазы { $other }; ожидается s, ms, us, ns или ps

engine-e-clock-log-timelab-line-has-column-the = строка TimeLab { $v1 }: столбцов: { $v }, в первой строке данных: { $first }

engine-e-clock-log-timelab-line-has-columns-one = строка TimeLab { $v1 }: столбцов: { $v }; читаются один (значение) или два (время и значение)

engine-e-clock-log-timelab-line-is-not-numeric = строка TimeLab { $v1 } не числовая: { $l }

engine-e-clock-log-the-timelab-log-has-no = в журнале timelab нет показаний

engine-e-clock-log-unknown-data-expected-phase-or = неизвестное значение data { $other }; ожидается phase или frequency

engine-e-clock-log-tau0-header-is-not-positive = заголовок tau0 { $v } не является положительным числом секунд

engine-e-clock-log-frequency-data-is-fractional-frequency = данные о частоте представляют собой относительную частоту; её единицей может быть только 1

engine-e-clock-log-two-column-frequency-logs-are = двухстолбцовые журналы частоты не читаются; передайте частоту одним столбцом вместе с tau0

engine-e-clock-log-unknown-time-units-expected-or = неизвестное значение time_units { $o }; ожидается s или mjd

engine-e-clock-log-the-timelab-log-time-column = столбец времени в журнале timelab должен возрастать

engine-e-clock-log-single-reading-tau0-cannot-be = единственное показание; tau0 определить нельзя

engine-e-clock-log-the-timelab-log-has-non = в журнале timelab нечисловых показаний: { $non_finite }

engine-e-clock-log-the-ticc-log-holds-channels = в журнале TICC есть каналы: { $many }; укажите один через channel = "..."

engine-e-clock-log-no-readings-on-channel-found = нет показаний в канале { $channel } (найдено: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = строки режима интервала TICC не содержат времени; задайте tau0_s (период события)

engine-e-clock-log-the-readings-do-not-increase = показания { $channel } не возрастают, поэтому не являются метками времени (вывод режима Period в TICC не читается; используйте режим Timestamp)

engine-e-clock-log-single-time-stamp-tau0-cannot = единственная метка времени; tau0 определить нельзя

engine-e-clock-log-two-time-stamps-apart-under = две метки времени { $channel } с интервалом { $w } s, менее половины tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = метки времени { $format } для { $clock } идут в обратном порядке (перезапуск демона или скачок часов); разделите журнал и прочитайте каждую часть отдельно

engine-e-clock-log-the-log-has-no-readings-2 = в журнале нет показаний: { $what }

engine-e-clock-log-the-log-holds-sources-name = в журнале есть источники: { $many }; укажите один через { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = нет показаний { $what } для { $id } (найдено: { $names })

engine-e-clock-log-the-servo-of-never-reached = сервопривод { $id } так и не достиг состояния захвата s2

engine-e-clock-log-the-log-has-no-chrony = в журнале нет показаний слежения chrony

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = частота дискретизации { $fs_hz } Hz не соответствует целому числу отсчётов на миллисекунду

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms и noncoherent должны быть положительными

engine-e-acquisition-the-doppler-grid-needs-positive = для сетки Доплера нужны положительный шаг и неотрицательный максимум

engine-e-acquisition-pfa-must-lie-in = pfa должно лежать в интервале (0, 1)

engine-e-acquisition-samples-supplied-needed = отсчётов передано: { $samples }, нужно: { $needed }

engine-e-acquisition-empty-doppler-grid = пустая сетка Доплера

engine-e-acquisition-the-samples-carry-no-power = в отсчётах нет мощности

## src/adm.rs

engine-e-adm-unknown-attitude-type = неизвестный ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = для AEM нужен хотя бы один сегмент

engine-e-adm-segment-is-not-version-attitude = сегмент { $i }: { $t } не является типом ориентации версии { $version }

engine-e-adm-segment-values-for = сегмент { $i }: значений: { $values } для { $t }

engine-e-adm-aem-version-has-no-ndm = у AEM версии 1.0 здесь нет формы NDM/XML; запишите KVN

engine-e-adm-this-attitude-type-has-no = у этого типа ориентации нет формы версии 2.0

engine-e-adm-expected-meta-start-found = ожидалось META_START, найдено: { $l }

engine-e-adm-meta-start-without-meta-stop = META_START без META_STOP

engine-e-adm-unexpected-metadata-line = неожиданная строка метаданных { $other }

engine-e-adm-in-version-aem = { $att } в AEM версии { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = после META_STOP ожидалось DATA_START

engine-e-adm-data-start-without-data-stop = DATA_START без DATA_STOP

engine-e-adm-empty-data-line = пустая строка данных

engine-e-adm-values-on-line = значений в строке { $att }: { $vals }; { $b }

engine-e-adm-unexpected-data-line = неожиданная строка данных { $other }

engine-e-adm-attitude-type-has-no-xml = у типа ориентации нет формы XML

engine-e-adm-message-without-version-attribute = сообщение без атрибута версии

engine-e-adm-expected-found = ожидалось { $vers_key }, найдено: { $other }

engine-e-adm-header-without-creation-date-or = заголовок без CREATION_DATE или ORIGINATOR

engine-e-adm-missing = отсутствует { $k }

engine-e-adm-unexpected-keyword = неожиданное ключевое слово { $k }

engine-e-adm-spin-block-holds-nutation-or = блок вращения содержит данные о нутации или об угловом моменте, но не те и другие вместе

engine-e-adm-unexpected-apm-keyword = неожиданное ключевое слово APM { $other }

engine-e-adm-unexpected-apm-line = неожиданная строка APM { $b }

engine-e-adm-without = { $b } без { $stop }

engine-e-adm-unexpected-line-in = неожиданная строка в { $b }: { $other }

engine-e-adm-incomplete-group = неполная группа { $keys }

engine-e-adm-unknown-apm-block-start = неизвестный блок APM { $other }_START

engine-e-adm-apm-metadata-needs-object-name = для метаданных APM нужны OBJECT_NAME, OBJECT_ID и TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM без EPOCH

engine-e-adm-rotation-axis = ось вращения { $o }

engine-e-adm-values-for = значений: { $values } для { $t }

engine-e-adm-euler-record-without-euler-rot = запись Эйлера без EULER_ROT_SEQ

engine-e-adm-rotation-sequence = последовательность вращений { $seq }

engine-e-adm-epoch-has-no = в эпохе { $s } нет 'T'

engine-e-adm-epoch-date = дата эпохи { $date }

engine-e-adm-epoch-time = время эпохи { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = «{ $s }» (текст в формулировке документа)

engine-advanced-report-mean-5th-to-95th-percentile = среднее { $fmt_num } (от 5-го до 95-го процентиля: от { $fmt_num2 } до { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = схема единиц полей: запись units `{ $key }`

engine-advanced-report-field-units-schema-input-entry = схема единиц полей: запись input `{ $key }`, сопоставлена по имени поля

engine-advanced-report-rows-from-to = строк: { $nums }, от { $fmt_num } до { $fmt_num2 }

engine-advanced-report-phase-ended-by = фаза { $name } (завершена: { $ended })

engine-advanced-report-result-timeline-phases = результат `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = передача в фазу { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = результат `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = входные данные сценария `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = комментарий в файле сценария, строка { $start }

engine-advanced-report-scenario-file-comment-lines-to = комментарий в файле сценария, строки: от { $start } до { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement }: MODELLED, а не подтверждено независимо: { $it }.

engine-advanced-report-sweep-of-scale = Перебор параметра { $param } (шкала: { $str_of })

engine-e-advanced-report-the-result-document-is-not = документ результата не является JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = сценарий не является TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Распределение Монте-Карло: { $metric }

engine-advanced-report-recorded-at-build-time-from = записано при сборке из переменной окружения { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = не записано: этот движок собран без переменной окружения { $GIT_COMMIT_ENV }; релиз определяется версией движка

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (собственный отпечаток сценария для этого вида; не дайджест файла)

engine-advanced-report-input-file = Входной файл { $path }

engine-advanced-report-study-generated = { " " }Исследование создано: { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = строка EMAG2 { $v1 }: ожидалось 8 столбцов, разделённых запятыми, найдено: { $p }

engine-e-altpnt-maps-emag2-line-bad = строка EMAG2 { $v1 }: неверное значение { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = строка EMAG2 { $v1 }: нечисловое значение

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: нет строк данных

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: строк: { $rows }, они не заполняют решётку { $n_lat } x { $n_lon }, которую охватывают

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: повторяющийся узел в { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = шаг сетки должен быть конечным и положительным, получено: { $step }

engine-e-altpnt-maps-grid-box-must-have-north = в границах сетки должно быть north > south и east > west, получено: [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = сетка { $n_lat } x { $n_lon } узлов слишком велика

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: для оси { $what } нужно не менее 2 различных значений

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: ось { $what } нерегулярна (от { $w } до { $w2 } при среднем шаге { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = сигма ошибки должна быть конечной и неотрицательной, получено: { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = длина корреляции должна быть конечной и положительной, получено: { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side должно быть >= 2, получено: { $n }

engine-e-altpnt-terrain-srtm-hgt-length = длина SRTM .hgt { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = для окна .hgt нужно не менее 2 x 2 отсчётов, получено: { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = шаг должен быть конечным и положительным, получено: { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = длина окна { "." }hgt { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: неизвестный столбец magnetic_grid `{ $other }` (используйте "sealevel" или "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: не удалось прочитать csv_path { $csv_path } для magnetic_grid: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = неизвестный формат анимации '{ $other }'; ожидается svg, html, frames или all

engine-e-animation-no-animation-format-given-expected = формат анимации не указан; ожидается svg, html, frames или all

engine-e-animation-animation-fps-must-be-between = fps анимации должно быть от 1 до 60, получено: { $fps }

engine-e-animation-animation-duration-must-be-between = длительность анимации должна быть от { $lit_0_5 } s до 600 s, получено: { $duration_s }

engine-e-animation-animation-width-must-be-between = ширина анимации должна быть от 480 до 3840 пикселей, получено: { $width }

engine-e-animation-result-is-not-json = результат не является JSON: { $e }

engine-animation-mission-time = время миссии ({ $lay })

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (нужен ffmpeg, собранный с librsvg; иначе сначала растрируйте кадры)

engine-animation-further-series-were-found-but = { " " }Найдены ещё ряды, не отображённые на графике: { $omitted } (проигрыватель показывает не более { $MAX_CHARTS } панелей по { $MAX_TRACES } трасс); они перечислены в манифесте экспорта frames.

## src/antenna.rs

engine-antenna-limb-capture-is-reached-on = захват лимба ДОСТИГАЕТСЯ на этой сетке (высота { $a_lo }-{ $a_hi } m x ширина луча { $b_lo }-{ $b_hi } deg, точек: { $points2 }): из { $points2 } опробованных рабочих точек лимб захватывают { $points }, найдено пересечений оси: { $crossings }; наибольшее опробованное J/S по лимбу — { $limb_js_db } dB на высоте { $altitude_m } m / при ширине луча { $hpbw_deg } deg, при пороге захвата { $thr } dB.

engine-antenna-limb-capture-is-not-reached = захват лимба НЕ достигается нигде на этой сетке (высота { $a_lo }-{ $a_hi } m x ширина луча { $b_lo }-{ $b_hi } deg, точек: { $points }) — это не нулевой захват, а отсутствие захвата лимба: наилучшее J/S по лимбу { $limb_js_db } dB на высоте { $altitude_m } m / при ширине луча { $hpbw_deg } deg, не хватает { $shortfall } dB до порога захвата { $thr } dB; в этой рабочей точке лимб был бы захвачен при мощности передатчика { $limb_capture_tx_power_dbw } dBW против { $p_tx_dbw } dBW в полёте.

engine-e-antenna-azimuths-must-strictly-increase = азимуты должны строго возрастать

engine-e-antenna-azimuths-must-span-less-than = азимуты должны охватывать менее 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = углы от оси должны строго возрастать

engine-e-antenna-gain-grid-does-not-match = сетка усиления не соответствует осям

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = коэффициенты K и P должны быть конечными и положительными

engine-e-aocs-at-least-three-reaction-wheels = требуется не менее трёх реактивных маховиков

engine-e-aocs-wheel-spin-axis-must-be = маховик { $i }: ось вращения должна быть единичным вектором

engine-e-aocs-wheel-js-and-max-must = маховик { $i }: js и u_max должны быть конечными и положительными

engine-e-aocs-the-wheel-spin-axes-do = оси вращения маховиков не охватывают трёхмерное пространство

engine-e-aocs-inertia-minus-the-wheels-spin = инерция за вычетом инерции вращения маховиков должна быть положительно определённой

engine-e-aocs-inertia-must-be-finite-and = инерция должна быть конечной и симметричной

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis должна быть ненулевым конечным вектором

engine-e-aocs-kind-must-be-finite-and-positive = { $n } должно быть конечным и положительным

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s должно давать не более 2e6 шагов

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s должно быть целым кратным dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 и omega0_rad_s должны быть конечными

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm должно быть конечным

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s должно быть конечным

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s должно быть не меньше dt_s

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = неизвестная служба '{ $other }' (ожидается navigation|nav или communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = неизвестная политика арбитража '{ $other }' (ожидается navigation-priority, communications-priority или first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = в плане контактов нужно хотя бы одно окно контакта

engine-e-aperture-duty-apertures-must-be = apertures должно быть >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = горизонт отчёта должен быть конечным

engine-e-aperture-duty-contact-has-non-finite-aos = у контакта '{ $name }' нечисловое значение aos_s или los_s

engine-e-aperture-duty-contact-must-have-los-aos = у контакта '{ $name }' должно быть los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = в плане контактов нужно хотя бы одно окно [[contacts]]

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: сеансов: { $sessions } на апертурах: { $apertures } при политике { $policy } -> навигационная загрузка { $navigation_duty }, коммуникационная загрузка { $communications_duty }, простой { $idle_duty }; потеряно из-за конкуренции { $total_outage_s } s из запрошенных { $total_requested_s } s (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Исследование создано: { $html_escape }.

engine-e-api-failed-to-serialise-report-to = не удалось сериализовать отчёт в JSON: { $e }

engine-e-api-invalid-scenario = недопустимый сценарий: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-required-fields = - **Обязательные поля:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Необязательные поля:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = ошибка разбора TOML: { $e }

engine-api-could-not-classify-scenario-kind = не удалось определить вид сценария: { $e }

engine-api-missing-required-field = { $kind_name }: отсутствуют обязательные поля — { $options }

engine-api-missing-required-field-2 = { $kind_name }: отсутствует обязательное поле "{ $entry }"

engine-e-api-invalid-orbit-scenario = недопустимый орбитальный сценарий: { $e }

engine-e-api-sp3-export-requires-an-orbit = для экспорта SP3 нужен орбитальный сценарий, а не '{ $k }'

engine-e-api-omm-export-requires-an-orbit = для экспорта OMM нужен орбитальный сценарий, а не '{ $k }'

engine-e-api-oem-export-requires-an-orbit = для экспорта OEM нужен орбитальный сценарий, а не '{ $k }'

engine-e-api-invalid-scenario-toml = недопустимый TOML сценария: { $e }

engine-e-api-could-not-re-serialise-scenario = не удалось повторно сериализовать сценарий: { $e }

engine-api-scenario-jamming-availability-under-jamming = сценарий { $r } | подавление (jamming) { $v2 } | доступность при подавлении { $availability_under_jamming } (номинальная { $availability_nominal }) | мин. слежение { $min_tracking } | среднее J/S { $v6 }

engine-e-api-the-result-document-already-carries = документ результата уже содержит `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = не удалось сериализовать figure_tiers: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = недопустимый сценарий { $label }: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = сценарий { $r } | квантовый holdover { $holdover_s }s p95 { $pos_p95_m }m | классический holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = сценарий { $r } | спуфинг { $scn } против допуска { $threshold_ns } ns (P_fa { $target_pfa }) | квантовая безопасность { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | классическая безопасность { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | южный полюс | доступных эпох: { $samples_available }/{ $samples_total } ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | вековой дрейф LTC−TT { $secular_rate_us_per_day } µs/day (диапазон { $band_low }–{ $band_high }) | собственный потенциал { $self_potential_us_per_day } кинетический { $kinetic_us_per_day } | смещение @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | база { $baseline_km } km | дальность до маяка { $beacon_range_km } km | задержка { $report } µs (скорость { $delay_rate_s_per_s } s/s) | ближнее поле { $near_field_correction_us } µs | отсчётов: { $samples } за { $horizon_hours } h

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| эфемериды { $report } ({ $provenance }) требуемое σ_URE { $fmt } против кеплеровых { $fmt2 } против возмущённых { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | точек: { $n_grid_points } x эпох: { $n_epochs } x испытаний: { $n_trials } | доступность { $v4 } % | покрытие { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | скорректированная p{ $percentile } 3-D { $f } (нескорректированная { $f2 }) | HPL макс. { $f3 } | MODELLED; не является утверждением о какой-либо реальной системе

engine-api-builtins-terrain-horizon-at-the-station = { " " }| горизонт рельефа ({ $sources }) на станции макс. { $horizon_max_deg } deg, у пользовательских точек средний макс. { $user_horizon_max_deg_mean } deg

## src/api/builtins.rs

engine-api-builtins-scenario-optical-sync-rms-ps = сценарий { $r } | оптический sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | квантовая цепочка { $quantum_chain_sigma_s }s против классической { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | безопасность Pd { $security_pd } (Pfa { $monitor_pfa }) | аномалия Pd { $anomaly_pd } | компромисс, квантовых побед: { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | перерыв { $outage_s }s | квантовая ошибка положения { $quantum_pos_err_m } m против классической { $classical_pos_err_m } m ({ $improvement_x }x) | holdover квантовый { $quantum_holdover_s }s против классического { $classical_holdover_s }s (порог { $threshold_m } m) | компромисс, квантовых побед: { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC квантовый { $quantum_auc } против классического { $classical_auc } | минимальная обнаруживаемая неисправность квантовая { $quantum_min_detectable } против классической { $classical_min_detectable } | классов неисправностей: { $fault_catalog } | компромисс, квантовых побед: { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] применяется только к виду fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = сценарий { $r } | квантовый holdover PNT { $pnt_holdover_s }s (время { $timing_holdover_s }s/положение { $position_holdover_s }s) целостность { $integ } безопасность { $security_na } | классический holdover PNT { $pnt_holdover_s2 }s (время { $timing_holdover_s2 }s/положение { $position_holdover_s2 }s) целостность { $integ2 } безопасность { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = сценарий { $r } | объединённый | квантовый holdover PNT { $pnt_holdover_s }s (время { $timing_holdover_s }s/положение { $position_holdover_s }s) целостность { $integ } безопасность { $security_na } | классический holdover PNT { $pnt_holdover_s2 }s (время { $timing_holdover_s2 }s/положение { $position_holdover_s2 }s) целостность { $integ2 } безопасность { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = сценарий { $r } | hybrid-ukf (17 состояний, MODELLED) | датчик { $v2 } (q_va { $effective_q_va }) | часы q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } в [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } в [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | с коррекцией { $aided_pos_rms_m }m -> выбег { $coast_end_pos_rms_m }m за { $coast_duration_s }s | внутренняя согласованность, а не точность

engine-api-builtins-scenario-gnss-ins-quantum-outage = сценарий { $r } | gnss-ins | квантовое RMS при перерыве: объединённое { $fused_outage_rms_m }m против свободного { $free_outage_rms_m }m (удержание { $holdover_s }s, доступность { $availability }) | классическое объединённое { $fused_outage_rms_m2 }m против свободного { $free_outage_rms_m2 }m (удержание { $holdover_s2 }s, доступность { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = сценарий { $r } | gnss-sim | среднее ионосферы { $mean_iono_m }m тропосферы { $mean_tropo_m }m | доступность RAIM { $raim_availability } средний HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m частота неисправностей { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = сценарий { $r } | spoof-detect | КА: { $n_sats }, +{ $power_advantage_db } dB{ $v4 } | смещение { $push } | объединённая оценка { $score } (порог { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = перебор { $metric } по { $parameter } ({ $first }..{ $last }, точек: { $points }, шкала: { $scale }) | квантовый { $first2 }->{ $last2 } | классический { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = сценарий { $r } | { $nominal }/{ $series } отсчётов GNSS в норме | лучший PDOP { $fnum } положение { $posm } | квантовый holdover { $holdover_s }s p95 { $ns1 }ns целостность { $integ } безопасность { $security_na } | классический holdover { $holdover_s2 }s p95 { $ns12 }ns целостность { $integ2 } безопасность { $security_na }

engine-e-api-builtins-ephemeris = эфемериды: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| макс. угол места { $el }° пиковый Доплер { $v1 } kHz

engine-api-builtins-generic-sweep-of-over-nodes = обобщённый перебор `{ $kind }` по [{ $keys }] | узлов: { $points } (форма { $shape }) | метрики [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | дрейф свободной инерциальной системы { $free_inertial_drift_m } m | по гравитационной карте { $map_matched_error_m } m | сигма сопоставления { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| эталонная степень { $reference_nmax } СКО аномалии { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| ошибка карты, Монте-Карло x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% в пределах { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | дрейф свободной инерциальной системы { $free_inertial_drift_m } m | по рельефу { $matched_error_m } m (снижение в { $v3 }x) | сигма сопоставления { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | путевых точек: { $waypoints } | RMS свободной инерциальной системы { $free_inertial_rms_m } m (итог { $free_inertial_final_m } m) | RMS по рельефу { $matched_rms_m } m (итог { $matched_final_m } m, снижение в { $v6 }x) | средний ESS { $mean_ess }/{ $cfg } | сигма сопоставления { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | дрейф свободной инерциальной системы { $free_inertial_drift_m } m | гравитация { $gravity_only_m } m магнитное поле { $magnetic_only_m } m рельеф { $terrain_only_m } m | ОБЪЕДИНЁННЫЙ { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] требует runs = 1: измеренный журнал это одна запись

engine-api-builtins-scenario-runs-quantum-holdover-p95 = сценарий { $r } | прогонов: { $runs } | квантовый holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns безопасность { $security_na } | классический holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns безопасность { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = сценарий { $r } | квантовый holdover { $holdover_s }s p95 { $ns1 }ns целостность { $integ } безопасность { $security_na } | классический holdover { $holdover_s2 }s p95 { $ns12 }ns целостность { $integ2 } безопасность { $security_na }

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = для эталонного случая нужен хотя бы один спутник

engine-e-araim-reference-reference-case-needs-at-least-2 = для эталонного случая нужна хотя бы одна орбитальная группировка

engine-e-araim-reference-satellite-names-constellation-but-only = спутник { $i } указывает орбитальную группировку { $constellation }, но объявлены только: { $constellations }

engine-e-araim-reference-satellite-has-non-positive-error = у спутника { $i } неположительная дисперсия ошибки

engine-e-araim-reference-both-integrity-risk-allocations-must = обе доли риска целостности должны быть положительными

engine-e-araim-reference-this-reference-implementation-monitors-single = эта эталонная реализация контролирует только режимы с единичной неисправностью, но априорные вероятности случая требуют N_fault,max = { $nfm } (подмножества одновременных множественных событий). Выполнение отклонено, чтобы не занижать число режимов неисправностей.

engine-e-araim-reference-the-all-in-view-geometry = геометрия по всем видимым спутникам вырождена

engine-e-araim-reference-no-fault-mode-is-observable = ни один режим неисправности не наблюдаем при этой геометрии

engine-e-araim-reference-unknown-reference-vector-known-vectors = неизвестный эталонный вектор '{ $vector }'; известные векторы: { $ids } (или 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: опубликованных эталонных векторов WG-C: { $wanted }; наихудшее согласие VPL/HPL { $worst_acceptance } m относительно собственного TOL_PL эталона = { $tol } m по приёмочным векторам: { $acceptance_checked }

engine-e-araim-reference-sat-needs-one-value-per = для P_sat нужно по одному значению на спутник, для P_const по одному на орбитальную группировку

engine-e-araim-reference-satellite-names-an-undeclared-constellation = спутник указывает необъявленную орбитальную группировку

engine-e-araim-reference-every-prior-must-lie-in = каждая априорная вероятность должна лежать в [0, 1)

engine-e-araim-reference-the-all-in-view-solution = решение по всем видимым спутникам не было выбрано

engine-e-araim-reference-an-add-v4-case-needs = для случая ADD v4.2 нужны спутники и орбитальные группировки

engine-e-araim-reference-nom-and-sat-need-one = для b_nom и P_sat нужно по одному значению на спутник

engine-e-araim-reference-const-needs-one-value-per = для P_const нужно по одному значению на орбитальную группировку

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = спутник { $i } указывает необъявленную орбитальную группировку

engine-e-araim-reference-one-constellation-index-per-satellite = один индекс орбитальной группировки на спутник

engine-e-araim-reference-satellite-names-constellation-with-no = спутник { $i } указывает орбитальную группировку { $c } без ISM

engine-e-araim-reference-fewer-than-four-satellites-above = выше маски менее четырёх спутников

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m должно содержать хотя бы одну дистанцию

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (диапазон { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | спуфинг@{ $value } m { $nearest } W | зона { $a2 }% предел, лимб { $footprint_limb_captured } | захват спуфингом { $spoof_captured } (синхронизация { $spoof_lock_time_s } s) | дальность мачты { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% от 50 bit/s), задержка { $nma_auth_latency_s } s

engine-attack-surface-reached-crossing-best-db = достигнут (пересечений: { $crossings }, лучшее { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = НЕ достигнут на этой сетке (лучшее { $best_limb_js_db } dB, не хватает { $best_limb_shortfall_db } dB; нужно { $best_limb_capture_tx_power_dbw } dBW против { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| перебор зоны { $s }x{ $s2 } (высота { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), захват { $v5 }-{ $v6 }% | лимб { $limb }

engine-attack-surface-afs-received-dbw = AFS принято: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Дефицит: { $deficit_db } dB (диапазон { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Зона захвата: { $a }% диска, лимб захвачен: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Втягивание при захвате спуфингом: { $spoof_captured } (синхронизация { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Дальность мачты: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Лимб: захвачен на сетке { $na }x{ $nb }, пересечений: { $crossings }

engine-attack-surface-limb-not-captured-on-grid = Лимб: не захвачен на сетке { $na }x{ $nb }; нужно { $best_limb_capture_tx_power_dbw } dBW (в полёте { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km должно быть конечным и положительным

engine-e-attitude-budget-inertias-must-be-finite-and = моменты инерции должны быть конечными и положительными

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 должно быть >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = требуется хотя бы один вклад в ошибку наведения

engine-e-attitude-budget-contributor-sigma-must-be-finite = сигма вклада '{ $name }' должна быть конечной и >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> момент GG { $t_gg } N·m; наведение { $total }" RSS (доминирует: { $dominant }) (скалярный бюджет MODELLED)

## src/bench/cli.rs

engine-bench-cli-needs-value = для { $name } нужно значение

engine-bench-cli-unknown-option = неизвестный параметр `{ $a }`

engine-bench-cli-unexpected-argument = неожиданный аргумент `{ $pos }`

engine-bench-cli-cannot-read = не удалось прочитать { $p }: { $e }

engine-bench-cli-cannot-create = не удалось создать { $d }: { $e }

engine-bench-cli-cannot-write = не удалось записать { $p }: { $e }

engine-bench-cli-unknown-task-or = неизвестная задача `{ $t }` (a, b, c или d)

engine-bench-cli-scored-epochs-in-folder = оценённых эпох: { $labels }, папок: { $folders }

engine-bench-cli-wrote-cases-json-and-truth = записаны { $out }/cases.json и { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: эта фиксация предварительная, её начальное значение (seed) было раскрыто; это не отложенная выборка для релиза

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: это начальное значение (seed) не то, на котором основана эта фиксация

engine-bench-cli-is-not-json = { $f } не является JSON: { $e }

engine-bench-cli-cannot-read-2 = не удалось прочитать { $i }: { $e }

engine-bench-cli-result-rendered = результатов отображено: { $results }

engine-bench-cli-unknown-subcommand =
    неизвестная подкоманда `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-cannot-create-an-existing-seed = не удалось создать { $path } (существующий файл с начальным значением (seed) никогда не перезаписывается): { $e }

engine-bench-cli-cannot-write-2 = не удалось записать { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = начальное значение (seed) записано в { $path }: не помещайте его в систему контроля версий и не включайте ни в какие сообщения; публичен только приведённый ниже хеш

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (перенесено, повторно не запускалось)

engine-bench-cli-impairment-eval-baseline = базовый уровень impairment-eval: { $det }

engine-bench-cli-no-scenario-json-under = нет scenario.json в { $root }

engine-bench-cli-is-not-json-2 = { $path } не является JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = в порядке: { $ok }, не совпадает: { $bad }, отсутствует: { $missing }, не закреплено: { $unpinned }

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = неизвестное разбиение `{ $other }` (dev, test или holdout)

engine-bench-score-for-is-not-finite = оценка для `{ $id }` не конечна

engine-bench-case-have-no-score-the = случаев без оценки: { $missing }, первый: `{ $first_missing }`

engine-bench-predictions-name-case-that-is = предсказания называют случай, которого нет в эталонных данных: `{ $extra }`

engine-bench-schema-must-be = `schema` должно быть `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` должно быть 64-значным шестнадцатеричным SHA-256

engine-bench-truth-is-not-json = эталонные данные не являются JSON: { $e }

engine-bench-predictions-are-not-json = предсказания не являются JSON: { $e }

engine-bench-truth-schema-must-be = `schema` эталонных данных должно быть `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = `schema` предсказаний должно быть `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = эталонные данные созданы по другой версии спецификации, чем { $SPEC_VERSION }; результаты разных основных версий никогда не смешиваются

engine-bench-unknown-task = неизвестная задача `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = результат { $v1 } недопустим: { $p }

engine-bench-site-result-is-task-holdout-result = результат { $v1 } относится к задаче (d), это результат отложенной выборки без `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = результат { $v1 } оценён на предварительном, раскрытом начальном значении (seed) отложенной выборки: это не отложенная выборка для релиза

engine-bench-site-result-was-scored-under-this = результат { $v1 } оценён по { $v }; эта страница относится к { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = оценка для `{ $k }` не является числом

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (статистика монитора по умолчанию { $lit_0_35 })

engine-bench-tasks-malformed-clock-line = некорректная строка часов `{ $line }`

engine-bench-tasks-the-clock-file-does-not = файл часов не совпадает с закреплённым SHA-256 (получено { $got }, ожидалось { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = спутника { $prn } нет в файле часов

engine-bench-tasks-kshana-bench-baseline = базовый уровень kshana-bench: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = предсказания охватывают случаев: { $pmap }, в эталонных данных: { $tarr }

engine-bench-tasks-case-has-no-number-array = у случая `{ $id }` нет числового массива

engine-bench-tasks-case-has-non-finite-value = у случая `{ $id }` есть нечисловое значение

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = сериализация { $name }: { $e }

engine-e-bin-crossover-study-write = запись { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = ошибка: не удалось создать { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = готово: инерциальных узлов: { $nodes }, кривых часов: { $curves } (начальное значение (seed) 42)

## src/bin/gen_araim_m3_study.rs

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = записан docs/INTEROP.md (таблица экспорта)

## src/bin/validation_report.rs

engine-bin-validation-report-wrote-validation-summary-to = сводка проверки записана в { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = неизвестное тело '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt выполняет навигацию вокруг тела, отличного от Земли, при наличии связи с Землёй; { $name } здесь не поддерживается

engine-e-body-pnt-duration-and-step-must-be = duration_s и step_s должны быть положительными, не более 20000 эпох; получено { $duration } и { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind должно быть orbiter или surface; получено '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = высота пользователя должна быть положительной, а эксцентриситет в [0, { $lit_0_9 })

engine-e-body-pnt-the-user-orbit-periapsis-is = перицентр орбиты пользователя ниже поверхности

engine-e-body-pnt-constellation-needs-to-200-satellites = орбитальной группировке нужно от 1 до 200 спутников хотя бы в одной плоскости

engine-e-body-pnt-constellation-altitude-must-be-positive = высота орбитальной группировки должна быть положительной

engine-e-body-pnt-range-sigmas-must-be-positive = сигмы дальности должны быть положительными

engine-e-body-pnt-no-earth-position-relative-to = нет положения Земли относительно { $name } на JD { $jd }

engine-e-body-pnt-serialising-report = сериализация отчёта: { $e }

engine-e-body-pnt-the-report-must-serialise-to = отчёт должен сериализоваться в объект JSON

engine-body-pnt-positioning-around = Позиционирование вокруг { $name }

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = сценарий E1 не является таблицей

engine-e-calibration-ensembles-e1-scenario-has-no-monte = в сценарии E1 нет [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: отсутствует final_error.{ $k }

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 это `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ансамблей по 200 реализаций каждый, в сравнении с замкнутой формой: среднее 0, sigma = { $sigma } ns. Ансамбль j использует базовое начальное значение (seed) 1 000 000 + 1000 j и начальное значение (seed) бутстрепа 20260928 + j. Наибольшая относительная ошибка ADEV составила { $max } для E2 и { $max2 } для E3 (по 1, 10 и 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = пустой путь результата

engine-e-campaign-result-path-has-an-empty = в пути результата `{ $path }` есть пустой сегмент

engine-e-campaign-result-path-bad-index-in = путь результата `{ $path }`: неверный индекс в `{ $part }`

engine-e-campaign-result-path-no-field = путь результата `{ $path }`: нет поля `{ $name }`

engine-e-campaign-result-path-indexed-value-is = путь результата `{ $path }`: значение с индексом не является массивом

engine-e-campaign-result-path-index-out-of = путь результата `{ $path }`: индекс { $i } вне диапазона ({ $n })

engine-e-campaign-result-path-value-is-not = путь результата `{ $path }`: значение не является числом или флагом

engine-e-campaign-result-path-is-not-an = путь результата `{ $path }`: `{ $k }` не является массивом

engine-e-campaign-result-path-must-name-one = путь результата `{ $path }` должен указывать одно значение, а не строки

engine-e-campaign-result-path-is-not-an-2 = путь результата `{ $path }`: `{ $name }` не является массивом

engine-e-campaign-metric-path-has-no-entry = у пути метрики `{ $path }` нет записи в блоке units этого вида; объявите его `unit` в кампании

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` должно быть непустым и состоять из букв, цифр, `_` или `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: кампания не может содержать кампанию

engine-e-campaign-serialise = { $label }: сериализация: { $e }

engine-e-campaign-result-did-not-parse = { $label }: результат не разобран: { $e }

engine-e-campaign-seed-key-no-field-in = ключ начального значения (seed) `{ $key }`: в сценарии нет поля `{ $part }`

engine-e-campaign-seed-key-is-not-non = ключ начального значения (seed) `{ $key }` не является неотрицательным целым числом

engine-e-campaign-seed-does-not-fit-toml = начальное значение (seed) { $seed } не помещается в целое число TOML

engine-campaign-time-path-must-name-rows = путь времени `{ $t }` должен указывать строки через `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` не равно below, above или abs_above

engine-campaign-threshold-is-null = порог `{ $p }` равен null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` не равно mean, min, max или count

engine-campaign-time-path-gives-several-values = путь времени `{ $t }` даёт несколько значений на строку

engine-campaign-value-path-has-fewer-rows = у пути значения `{ $y }` меньше строк, чем у `{ $t }`

engine-campaign-value-path-has-rows-time = у пути значения `{ $y }` строк: { $r }, у пути времени `{ $t }` строк: { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = для кампании с фазами нужен [timeline] с step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s должно быть положительным, получено: { $step }

engine-e-campaign-phase-is-named-twice = фаза `{ $name }` названа дважды

engine-e-campaign-phase-duration-must-be-non = фаза `{ $name }`: duration_s должно быть неотрицательным

engine-e-campaign-phase-has-no-runs = у фазы `{ $name }` нет прогонов

engine-e-campaign-phase-the-first-phase-has = фаза `{ $name }`: первой фазе нечего передавать дальше

engine-e-campaign-phase-handoff-from-channel-which = фаза `{ $name }`: передача из канала `{ $ch }`, которым предыдущая фаза не завершилась

engine-e-campaign-phase-handoff-from-run-does = фаза `{ $name }`: передача из from_run { $from_run } невозможна, такого прогона нет

engine-e-campaign-phase-handoff-is-null = фаза `{ $name }`: передача `{ $from }` равна null

engine-e-campaign-phase-handoff-run-does-not = фаза `{ $name }`: прогона { $run } для передачи нет

engine-e-campaign-phase = фаза `{ $name }`: { $e }

engine-campaign-phase-run = фаза { $name }/прогон { $ri }

engine-e-campaign-phase-end-at-run-does = фаза `{ $name }`: прогона end_at_run { $end_at_run } нет

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s позже)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } равно null)

engine-e-campaign-phase-side-is-not-classical = фаза `{ $name }`: сторона `{ $side }` не равна classical или quantum

engine-e-campaign-phase-skip-must-be-non = фаза `{ $name }`: skip_s должно быть неотрицательным

engine-e-campaign-phase-alarm-compare-is-not = фаза `{ $name }`: сравнение тревоги `{ $compare }` не равно below, above или abs_above

engine-e-campaign-phase-alarm-threshold-is-null = фаза `{ $name }`: порог тревоги `{ $p }` равен null

engine-e-campaign-phase-channel-is-in-not = фаза `{ $name }`: канал `{ $channel }` выражен в { $u }, а не в { $du }

## src/campaign.rs

engine-e-campaign-phase-channel-needs-unit = фаза `{ $name }`: для канала `{ $channel }` нужна единица измерения

engine-e-campaign-phase-two-runs-both-provide = фаза `{ $name }`: два прогона поставляют один и тот же канал `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = фаза `{ $name }` переносит `{ $ch }`, которым предыдущая фаза не завершилась

engine-e-campaign-phase-carries-but-no-run = фаза `{ $name }` переносит `{ $ch }`, но ни один её прогон не поставляет `{ $ch }`

engine-e-campaign-channel-is-in-in-one = канал `{ $name }` выражен в { $unit } в одной фазе и в { $unit2 } в другой

engine-e-campaign-at-least-one-metric-is = нужна хотя бы одна метрика

engine-e-campaign-metric-is-named-twice = метрика `{ $name }` названа дважды

engine-e-campaign-seed-overflow-in-the-ensemble = переполнение начального значения (seed) в ансамбле

engine-e-campaign-an-ensemble-needs-at-least = для ансамбля нужен хотя бы один прогон

engine-e-campaign-sweep-takes-one-to-three = перебор принимает от одной до трёх осей, получено: { $axes }

engine-e-campaign-axis-is-named-twice = ось `{ $name }` названа дважды

engine-e-campaign-axis-needs-at-least-two = для оси `{ $name }` нужно не менее двух шагов

engine-e-campaign-axis-scale-must-be-lin = ось `{ $name }`: шкала должна быть lin или log

engine-e-campaign-axis-log-axis-needs-positive = ось `{ $name }`: для логарифмической оси нужны положительные границы

engine-campaign-sweep-node = узел перебора { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs должно быть не менее двух

engine-e-campaign-compose-needs-at-least-one = для compose нужен хотя бы один участник

engine-e-campaign-shared-value-must-be-number = общее значение `{ $name }` должно быть числом или числами

engine-e-campaign-shared-value-is-named-twice = общее значение `{ $name }` названо дважды

engine-e-campaign-member-binds-unknown-shared = участник `{ $label }` привязывает неизвестное общее значение `{ $name }`

engine-e-campaign-member = участник `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = метрика `{ $name }` выражена в { $u } у одного участника и в { $unit } у `{ $label }`

engine-e-campaign-member-is-named-twice = участник `{ $label }` назван дважды

engine-e-campaign-invalid-campaign-scenario = недопустимый сценарий кампании: { $e }

engine-e-campaign-invalid-campaign = недопустимая кампания: { $e }

engine-e-campaign-sweep = перебор: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d }: { $what } по реализациям

engine-campaign-value-of-at-the-end = значение { $ch } в конце предыдущей фазы, прибавленное к { $ch } этой фазы

engine-campaign-on-the-timeline-grid-the = { $label } на сетке временной шкалы: последний отсчёт прогона соответствующей фазы в момент сетки или до него (экстраполяция нулевого порядка); null там, где ни один прогон этой фазы его не поставляет

engine-campaign-values-of-the-scenario-key = значения ключа сценария { $key } вдоль оси { $name }

engine-campaign-value-of-the-scenario-key = значение ключа сценария { $key } в этом узле

engine-campaign-of-the-node-result = { $path } результата узла

engine-campaign-of-each-realisation-in-seed = { $path } каждой реализации в порядке начальных значений (seed)

engine-campaign-shared-value-written-into-every = общее значение { $name }, записанное в каждого участника, который его привязывает

engine-campaign-metric-read-from-the-member = метрика { $name }, считанная из результата участника

engine-campaign-smallest-across-the-members = наименьшее { $name } по участникам

engine-campaign-largest-across-the-members = наибольшее { $name } по участникам

engine-campaign-mean-across-the-members = среднее { $name } по участникам

engine-e-campaign-failed-to-serialise-campaign-result = не удалось сериализовать результат кампании: { $e }

engine-campaign-chain-phases-over-events-alarm = цепочка: фаз: { $phases } за { $duration_s } s, событий: { $events }, тревога на { $alarm_s } s сетки

engine-campaign-sweep-of-nodes-over = перебор `{ $scenario_kind }`: узлов: { $nodes } по [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Монте-Карло для `{ $scenario_kind }`: начальных значений (seed): { $runs }

engine-campaign-compose-members = compose: участников: { $members }

engine-campaign-member-runs-modelled = прогонов участников: { $runs_total } (MODELLED)

engine-campaign-sweep-of-over-nodes-each = перебор `{ $scenario_kind }` по { $axis_order } (узлов: { $nodes }; каждая линия в своём диапазоне)

engine-campaign-campaign-modelled-composition-every-value = кампания { $r } | композиция MODELLED; каждое значение считано из реального прогона указанного вида

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = оптимизация принимает от одного до трёх параметров, получено: { $params }

engine-e-campaign-optimize-param-is-named-twice = параметр `{ $name }` назван дважды

engine-e-campaign-optimize-param-needs-finite-lo-hi = параметр `{ $name }`: нужны конечные lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = параметр `{ $name }`: шкала должна быть lin или log

engine-e-campaign-optimize-param-log-param-needs-positive = параметр `{ $name }`: для логарифмического параметра нужны положительные границы

engine-e-campaign-optimize-param-start-must-lie-in = параметр `{ $name }`: start должно лежать в [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = параметр `{ $name }`: для сетки нужно не менее двух шагов

engine-e-campaign-optimize-objective-target-is-only-read = objective.target считывается только при goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = для goal = "target" нужен конечный objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal должно быть minimize, maximize или target, получено `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = сетка из { $total } узлов превышает предел 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps считывается только при method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals должно покрывать начальный симплекс (параметры + 1)

engine-e-campaign-optimize-step-must-lie-in = step должно лежать в (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol и xtol должны быть неотрицательными

engine-e-campaign-optimize-method-must-be-grid-or = method должно быть grid или nelder-mead, получено `{ $other }`

engine-campaign-optimize-optimize-eval = вычисление оптимизации { $trace }

engine-campaign-optimize-lower-bound-of-the-scenario = нижняя граница ключа сценария { $key }

engine-campaign-optimize-upper-bound-of-the-scenario = верхняя граница ключа сценария { $key }

engine-campaign-optimize-value-of-the-scenario-key = значение ключа сценария { $key } при наилучшем вычислении

engine-campaign-optimize-value-of-the-scenario-key-2 = значение ключа сценария { $key } при этом вычислении

engine-campaign-optimize-target-value-of = целевое значение { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } при наилучшем вычислении

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } этого вычисления (среднее по начальным значениям (seed), если runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = оптимизация `{ $objective_name }` ({ $goal } { $o }) для `{ $scenario_kind }` методом { $method }: вычислений: { $evals } ({ $stop_reason }), лучшее { $o2 } в [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START перед заголовком CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: некорректная строка заголовка: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: некорректная строка метаданных: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: некорректная строка данных: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: нераспознанное ключевое слово данных { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: в строке данных { $k } нет эпохи

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: в строке данных { $k } нет значения

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: в строке данных { $k } неверное значение { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: незавершённый сегмент (нет META_STOP/DATA_STOP)

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: неверное TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: неверное TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = неизвестная наблюдаемая `{ $other }`: ожидается одна из range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = неизвестные координаты `{ $other }`: ожидаются одни из cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours должно быть конечным и положительным, получено: { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs должно быть ≥ 2, получено: { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps должно быть ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials должно быть ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations должно быть ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd должно быть конечным и положительным, получено: { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor должно быть конечным и положительным, получено: { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km должно быть конечным и положительным, получено: { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m должно быть конечным и положительным, получено: { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s должно быть конечным и положительным, получено: { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = орбитальная группировка должна включать как минимум ведущий аппарат и один опорный

engine-e-cislunar-arc-recovery-family-is-an-out-of = семейство `{ $family }` внеплоскостное и не имеет плоского четырёхкомпонентного представления: задайте spatial = true, чтобы выполнить его перебор

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = прямая модель выдала нечисловое истинное измерение

engine-cislunar-arc-recovery-first-arc-length-at-which = первая длина дуги, при которой пакетное решение без шума для КАЖДОГО испытания с заданным начальным значением (seed) доводит итоговую ошибку состояния до не более чем { $recovery_factor } от априорного смещения, с которого оно началось. Это аналог критерия ранга для восстановления: при точных измерениях вопрос `is the state observable?` превращается в `can an estimator get it back?`, и допуск по сингулярным значениям в ответ не входит.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = первая длина дуги, при которой RMS ошибки восстановления положения по Монте-Карло для реализаций шума с заданным начальным значением (seed), число которых { $trials }, опускается до { $error_bound_km } km или ниже. Это аналог критерия оцениваемости для восстановления, измеренный, а не предсказанный: ошибка есть расстояние от оценки до известной истины, а не след формальной ковариации.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED в пределах одного шага сетки эпох: оценщик восстанавливает состояние начиная с { $e } h, критерий ранга грамиана переключается на { $g } h (отношение { $v1 }, сетка { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED как граница восстановимости: оценщик восстанавливает состояние начиная с { $e } h, { $v1 } { $g } h по критерию ранга грамиана (отношение { $v2 }, сетка { $grid_hours } h). Критерий ранга это относительное соглашение о сингулярных значениях; граница восстановления это измеренная ошибка состояния, и здесь они не совпадают.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: оценщик ни разу не достигает своей границы восстановления на этой дуге, тогда как критерий ранга грамиана переключается на { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = критерий ранга грамиана на этой дуге не выполняется никогда (геометрия не достигает полного ранга), тогда как оценщик восстанавливает состояние начиная с { $e } h — они расходятся даже в том, существует ли граница вообще.

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = неизвестное семейство `{ $other }`: ожидается одно из dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO на расстоянии пересечения { $d } не прошла дифференциальную коррекцию

engine-e-cislunar-observability-member-at-x0-did-not = { $label }, элемент { $i } при x0 = { $x0 } не прошёл дифференциальную коррекцию

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft должно быть от 2 до { $MAX_SPACECRAFT }, получено: { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs должно быть ≥ 2, получено: { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol должно быть конечным и положительным, получено: { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m должно быть конечным и неотрицательным, получено: { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km должно быть конечным и положительным, получено: { $sigma_pos_threshold_km }

engine-cislunar-observability-never-rank-of = никогда (ранг { $rank } из { $state_dim })

engine-cislunar-observability-first-arc-length-at-which = первая длина дуги, при которой формальная неопределённость положения 1σ НАЧАЛЬНОГО состояния ведущего аппарата, σ_pos = sqrt(trace(P_rr)) при P = (ÕᵀÕ)⁻¹, где Õ матрица наблюдаемости, отбелённая по шуму измерений, опускается до { $sigma_pos_threshold_km } km или ниже. Это критерий, при котором порог длины дуги вообще зависит от шума: P масштабируется как σ², поэтому σ_pos масштабируется как σ, тогда как приведённый выше критерий ранга с σ не меняется. Граница это ЗАЯВЛЕННЫЙ инженерный выбор, а не подогнанный — estimability_sweep сообщает порог при четырёх других границах.

engine-cislunar-observability-validated-each-constellation-initial-condition = Подтверждено: каждое начальное условие орбитальной группировки это периодическая орбита семейства { $family }, скорректированная дифференциально и замыкающаяся за один период с указанной невязкой периодичности (плоские DRO дополнительно ретроградны относительно Луны). Семейство корректируется при отношении масс Земля–Луна. Смоделировано: выбор параметров и фаз семейства (проект орбитальной группировки). Имя ключа `dro_provenance` сохранено для выпущенной схемы документа; в нём содержится то семейство, которое запросил этот прогон.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } должно быть конечным и положительным, получено: { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } должно лежать в (0, 1), получено: { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg должно лежать в [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems должно называть хотя бы один пресет

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: для injected_bias нужны конечные bias_m, t0_s и t1_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: нет записей

engine-e-clock-library-card-records-at-different-tau0 = { $name }: записи с разными tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: периодический метод наименьших квадратов не удался

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: точек устойчивости с edf >= { $MIN_FIT_EDF }: { $used }; для карточки нужны три

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = пропуски { $g }, выбросы фазы { $o }, скачки фазы { $p }, всплески { $b }, скачки частоты { $f } (робастная sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` не является неотрицательным целым числом

engine-e-compliance-is-missing = `{ $p }` отсутствует

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } превышает events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } превышает predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: счётчики receiver-trust некорректны ({ $malformed_counts }); исключено

engine-e-compliance-not-json = { $label }: не JSON: { $e }

engine-compliance-cannot-read = { $label }: не удалось прочитать: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: соседний сценарий указывает вид `{ $s }`, а результат указывает `{ $o }`; не используется

engine-e-compliance-scenario-kind-not-found-no = { $label }: вид сценария не найден (нет соседнего файла сценария, это не результат receiver-trust, нет `kind` верхнего уровня)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` не является видом сценария, известным движку; не используется

engine-compliance-written-by-kshana = Создано kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    Тестов, у которых выполнены все заявленные пороги: { $met }; с невыполненным порогом: { $not_met }; требующих входных данных: { $needs_input }.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = у сетки интенсивности должны быть конечные min < max, получено [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = для сетки интенсивности нужно >= 2 шагов, получено: { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = в сетке корреляции должно быть хотя бы одно значение

engine-e-conflict-resilience-correlation-values-must-lie-in = значения корреляции должны лежать в [0, 1], получено: { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = для conflict-resilience нужен хотя бы один уровень

engine-e-conflict-resilience-layer-availability-not-in = доступность уровня { $i } { $availability } вне [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = sigma_m уровня { $i } должно быть конечным и положительным

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = vulnerability уровня { $i } должно быть конечным и >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = vector_weight уровня { $i } должно быть конечным и >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } вне диапазона (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials должно быть >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | уровней: { $layers } (базовый { $primary }) | эталонная интенсивность { $reference_intensity } | коэффициент устойчивости в замкнутой форме { $ratio_closed_form }x Монте-Карло { $ratio_mc_independent }x (многоуровневая против одноуровневой) | корреляция сводит на нет многоуровневость: коэффициент { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | априорный ДИ [{ $ratio_lo }-{ $ratio_hi }]x | выживаемость по векторам @ эталонное подавление (jamming) { $surv }% спуфинг { $surv2 }% кинетическое { $surv3 }% кибер { $surv4 }% (самый острый { $sharpest }) | основной результат ~7x MODELLED, VALIDATED Монте-Карло->замкнутая форма / тождество слияния / маргиналы копулы / выживаемость по векторам

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = неизвестное центральное тело { $name }: ожидается планета, Плутон, Луна или крупный спутник (earth, moon, mars, europa, titan, ...; см. crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = для оболочки Уокера нужны total > 0 и planes > 0

engine-e-constellation-walker-total-is-not-multiple = total { $total } Уокера не кратно числу плоскостей { $planes }

engine-e-constellation-walker-phasing-must-lie-in = фазирование Уокера F = { $phasing } должно лежать в 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } не является расширяемым слотом GPS (SPS PS, таблица 3.2-2, перечисляет B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: укажите altitude_km или semi_major_axis_km, но не оба сразу

engine-e-constellation-needs-altitude-km-or-semi = { $what }: нужно altitude_km или semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: большая полуось { $v1 } km не превышает радиус тела { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: эксцентриситет { $e } должен лежать в [0, { $lit_0_9 })

engine-e-constellation-perigee-is-below-the-surface = { $what }: перигей ниже поверхности тела { $name }

engine-e-constellation-constellation-preset-is-an-earth = орбитальная группировка { $name }: пресет { $p } относится к земной орбитальной группировке, а тело: { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = орбитальная группировка { $name }: неизвестный пресет { $other } (ожидается gps-baseline, gps-expandable, galileo, beidou, beidou-meo или glonass)

engine-e-constellation-constellation-expanded-applies-only-to = орбитальная группировка { $name }: `expanded` применяется только к пресету gps-expandable

engine-constellation-constellation-shell = орбитальная группировка { $name }, оболочка { $v2 }

engine-constellation-explicit-element-sets = явных наборов элементов: { $satellite }

engine-constellation-constellation-satellite = орбитальная группировка { $name }, спутник { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = у орбитальной группировки { $name } нет спутников: задайте пресет, [[constellation.shell]] или [[constellation.satellite]]

engine-e-constellation-no-constellation-given = орбитальная группировка не задана

## src/constellation.rs

engine-e-constellation-constellations-with-one-clock-each = орбитальных группировок с одними часами у каждой: { $constellations }, что превышает предел в { $MAX_CLOCKS } часов; используйте clock = "common" или объедините орбитальные группировки

engine-e-constellation-must-be-finite = { $what } должно быть конечным

engine-e-constellation-need-step-and-duration-step = нужны step_s > 0 и duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = более 100 000 эпох; увеличьте step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg должно лежать в [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold должно быть положительным

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg должно лежать в [{ $lit_0_25 }, 90]

engine-e-constellation-need-90-lat-min-deg = нужно -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = нужно lon_min_deg < lon_max_deg, охват не более 360 deg

engine-e-constellation-give-at-least-one-constellation = задайте хотя бы одну [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points ограничено значением 2000

engine-e-constellation-satellites-exceeds-the-50-000 = спутников: { $total }, что превышает предел 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: спутников: { $total } ({ $names }) вокруг тела { $name }; доступность { $global_availability_pct }% (PDOP <= { $pdop_threshold } при маске { $mask_deg } deg), худший пункт { $worst_site_availability_pct }%, медианный PDOP { $cov }, в среднем в зоне видимости { $global_mean_visible }; узлов сетки: { $grid_points } x эпох: { $epochs } (MODELLED)

engine-constellation-constellation-coverage-over-the = Покрытие орбитальной группировки над телом { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } должно быть конечным и положительным

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } должно быть конечным и >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw должно быть конечным

engine-e-contact-schedule-satellite-altitude-km-must-be = спутник '{ $name }': altitude_km должно быть в (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = спутник '{ $name }': inclination_deg должно быть в [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = спутник '{ $name }': backlog_mbit должно быть >= 0

engine-e-contact-schedule-satellite-priority-must-be = спутник '{ $name }': priority должно быть > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = спутник '{ $name }': eirp_dbw должно быть конечным

engine-e-contact-schedule-station-lat-deg-in-90 = станция '{ $name }': lat_deg в [-90, 90], lon_deg конечно

engine-e-contact-schedule-station-mask-deg-must-be = станция '{ $name }': mask_deg должно быть в [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = станция '{ $name }': alt_m должно быть в [0, 3000] (диапазон ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = станция '{ $name }': setup_s >= 0 и g_over_t_db конечно

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours должно быть в (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s должно быть в (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = требуется хотя бы один спутник и одна станция

engine-e-contact-schedule-at-most-32-satellites-and = не более 32 спутников и 32 станций

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: спутников: { $satellites } x станций: { $stations } за { $duration_hours } h -> кандидатов в контакты: { $cands }, запланировано: { $greedy }; доставлено { $total_del } из { $total_backlog } Mbit{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: проходов: { $pairs }; ACM { $acm } Mbit против CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = нужно не менее 2 испытаний и конечное sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total должно быть в (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = у пользователя нет локальной системы координат

engine-e-dop-error-ci-singular-geometry = { $name }: вырожденная геометрия

engine-e-dop-error-ci-no-noise-free-fix = { $name }: нет решения без шума

engine-e-dop-error-ci-no-fix = { $name }: нет решения

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: вырожденная геометрия

engine-e-dop-error-mc-no-fix = { $label }: нет решения

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km должно быть положительным; получено: { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes и sats_per_plane должны быть ненулевыми

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz должно быть положительным; получено: { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency должно быть в (0, 1]; получено: { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k должно быть положительным; получено: { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db должно быть неотрицательным; получено: { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m должно лежать вне Земли; получено: { $range_m }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Лимб Земли с орбитальной группировки: { $earth_limb_half_angle_deg } deg от надира — любой луч к Луне должен превышать это значение{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }не затенено: { $n_geometrically_visible } из { $n_satellites }; порог слежения { $tracking_threshold_dbhz } dB-Hz превышают: { $n_trackable }{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }лучшая линия связи { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }каждая отслеживаемая линия визирования лежит внутри полуконуса { $a } deg — геометрия почти вырождена{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }ПЕРЕБОР по эпохам: { $epochs } / { $span_s } s: доступность сигнала { $signal_availability }, доступность FIX { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }отслеживаемых линий связи: среднее { $mean_trackable }, максимум { $max_trackable }; лучший C/N0 { $w }; лучший PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = требуется от одной до шести ступеней

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg должно быть конечным и неотрицательным

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 должно быть конечным и неотрицательным

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg должно быть конечным и неотрицательным

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m должно быть конечным и неотрицательным

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg должно быть в [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s должно быть конечным и неотрицательным

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = тяговооружённость при старте { $tw } должна превышать 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: идеальное dv { $ideal_dv_m_s } m/s, потери { $losses } m/s (гравитационные { $gravity_loss_m_s }, аэродинамические { $drag_loss_m_s }, на управление { $steering_loss_m_s }, из-за противодавления { $back_pressure_loss_m_s }); выгорание { $r } km при { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } должно быть конечным и положительным

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body должно быть "earth" или "mars", получено "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = атмосфера "{ $a }" недоступна для тела "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg должно быть в (0, 90) (положительное вниз)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m должно быть в [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg должно быть конечным, |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg и longitude_deg должны быть конечными

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag должно быть в [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg должно быть конечным

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s должно быть в (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m должно быть в [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s должно быть в (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame должно быть inertial|relative, получено "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> пик { $pk_g } g на { $r } km, пиковое q { $r2 } W/cm² на { $r3 } km, тепловая нагрузка { $r4 } J/cm², пиковое q_dyn { $r5 } kPa; { $outcome } на { $end_time_s } s (замкнутая форма { $cf_g } g; MODELLED, 3 степени свободы, без излучения/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } должно быть в (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } должно быть конечным и неотрицательным

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg должно быть в [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits должно быть в 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (заполнение ячейки { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = угол от надира { $eta_rad }° превышает угловой радиус Земли { $rho }° (мимо Земли)

engine-e-eo-payload-no-sun-synchronous-inclination-at = нет солнечно-синхронного наклонения на { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg должно быть в (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad должно быть конечным и положительным

engine-e-eo-payload-half-fov-too-large = half_fov слишком велико: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° поле зрения -> полоса обзора { $v3 } km, GSD в надире { $gsd } m, доступ до { $v5 } km от надира; интервал между витками { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = барицентр Земля–Луна из { $table }, разделённый лунным рядом Монтенбрука и Гилла, приведённым прецессией к J2000

engine-ephem-provider-jpl-mean-elements-in-the = средние элементы JPL в плоскости Лапласа, скорость средней долготы из синхронной скорости вращения IAU, добавленные к своей планете из { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = направление синхронного вращения IAU на среднем расстоянии JPL, добавленное к Сатурну из { $table }

engine-e-ephem-provider-read = чтение { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = в TLE нет строки 1 (строки, начинающейся с `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = в TLE нет строки 2 (строки, начинающейся с `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = для аналитических эфемерид `orbit` требуется `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = для сценария эфемерид нужен либо `tle`, либо `orbit`

engine-e-ephemeris-step-must-be-positive = step_s должно быть положительным

engine-e-ephemeris-duration-must-be-non-negative = duration_s должно быть неотрицательным

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz должно быть положительной конечной частотой

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` не конечно

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` не является ни секундами, ни временем UTC по ISO-8601

engine-e-evidence-assemble-no-epoch-of-the-log = ни одна эпоха журнала не попадает между { $t0 } s и { $t1 } s (журнал охватывает от 0 до { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config не является объектом

engine-e-evidence-assemble-config-json-already-has-an = в config.json уже есть запись `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = от { $from_s } до { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` не является временем UTC вида 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } в журнале размером { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = для { $name } нужно значение

engine-e-evidence-cli-cannot-create = не удалось создать { $path }: { $e }

engine-e-evidence-cli-cannot-write = не удалось записать { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = предупреждение: { $path } доступен для чтения другим пользователям; ограничьте доступ (chmod 600)

engine-e-evidence-cli-cannot-read-key = не удалось прочитать ключ { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } не является шестнадцатеричным ключом

engine-e-evidence-cli-must-hold-32-byte-key = { $path } должен содержать 32-байтовый ключ в виде 64 шестнадцатеричных цифр

engine-e-evidence-cli-cannot-read = не удалось прочитать { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = не удалось прочитать { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } существует и не пуст

engine-e-evidence-cli-cannot-create-2 = не удалось создать { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = предупреждение: { $arg } доступен только владельцу (режим 600) и не назван *.pub: это может быть закрытый ключ. Передайте файл открытого ключа.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` не является ни 64 шестнадцатеричными цифрами, ни читаемым файлом ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` не содержит шестнадцатеричных цифр

engine-evidence-cli-private-key-keep-it-secret = закрытый ключ: { $out }  (храните в тайне; никогда не фиксируйте в репозитории)

engine-evidence-cli-public-key-pub = открытый ключ:  { $out }.pub

engine-evidence-cli-public-key-hex = открытый ключ (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Передайте проверяющим открытый ключ по надёжному для них каналу; они закрепляют его через --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = для verify нужен каталог пакета

engine-e-evidence-cli-cannot-read-3 = не удалось прочитать { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: сертификат PEM не найден

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }подпись службы меток времени не проверена Kshana

engine-evidence-cli-this-is-technical-record-not = Это техническая запись, а не юридическое заключение.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = для attach-timestamp нужен каталог пакета

engine-e-evidence-cli-attach-timestamp-needs-token-file = для attach-timestamp нужен файл токена

engine-e-evidence-cli-cannot-read-4 = не удалось прочитать { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = не удалось записать { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = примечание: токен лежит рядом с подписанным манифестом, а не внутри него; проверяйте с --require-timestamp, чтобы потребовать его наличия.

engine-e-evidence-cli-round-trip-packs-are-not = пакеты round-trip не собираются для WebAssembly

engine-e-evidence-cli-needs-scenario-path = нужен путь к сценарию

engine-e-evidence-cli-needs-from = нужен --from

engine-e-evidence-cli-needs-to = нужен --to

engine-e-evidence-cli-cannot-read-lab-attestation = не удалось прочитать лабораторное подтверждение { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = не удалось прочитать { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = недопустимый сценарий receiver-trust: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation применяется к `receiver-trust evidence`, а не к `evidence round-trip` (пакет которого фиксирует условия испытания)

engine-e-evidence-cli-cannot-read-6 = не удалось прочитать { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = не удалось прочитать { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = пакет доказательств записан в { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }эпох в окне: { $epochs_in_window }  (от { $from_s } s до { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }отпечаток подписанта: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 файла manifest.json (его должна заверить служба RFC 3161): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }фрагмент журнала: байты от { $a } до { $b } из { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }фрагмент журнала: весь журнал (этот журнал не даёт диапазона байтов для окна)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }лабораторное подтверждение записано в подписанном манифесте ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Пакет — это техническая запись, а не юридическое заключение.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = от { $from_s } s до { $to_s } s после первой эпохи журнала

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = недопустимый TOML lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` должно быть таблицей

engine-e-evidence-lab-invalid-lab-attestation = недопустимое lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } обязательно

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } превышает { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: дата { $date } не является днём вида 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: для экранированной установки нужен enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup должно быть "conducted" или "shielded" (получено { $other }); установка с излучением в эфир не принимается как лабораторный прогон

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db должно быть конечным

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = в условиях испытания указано событий: { $events }, а в оценочном сценарии: { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = событие '{ $id }' в условиях испытания (от { $onset_s } s до { $offset_s } s) не совпадает с '{ $label }' в оценочном сценарии (от { $onset_s2 } s до { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = SHA-256 журнала ({ $have }) не совпадает с указанным в условиях испытания ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = усечённый DER

engine-e-evidence-tsa-bad-der-length = неверная длина DER

engine-e-evidence-tsa-unexpected-der-tag = { $what }: неожиданный тег DER { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = пустой AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = неверный UTCTime

engine-e-evidence-tsa-bad-generalizedtime = неверный GeneralizedTime

engine-e-evidence-tsa-bad-time = неверное время

engine-e-evidence-tsa-time-not-in-utc = время не в UTC

engine-e-evidence-tsa-bad-time-digits = неверные цифры времени

engine-e-evidence-tsa-bad-bit-string = неверная BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: ожидаются три элемента

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: слишком короткий

engine-e-evidence-tsa-empty-extension = пустое Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: значение не является OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: пусто

engine-e-evidence-tsa-validity-short = Validity: слишком коротко

engine-e-evidence-tsa-pem-end-without-begin = PEM: END без BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: неверный base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: неверная длина base64

engine-e-evidence-tsa-spki-empty = SPKI: пусто

engine-e-evidence-tsa-spki-no-oid = SPKI: нет OID

engine-e-evidence-tsa-spki-no-key = SPKI: нет ключа

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: ожидаются два целых числа

engine-e-evidence-tsa-unsupported-elliptic-curve = неподдерживаемая эллиптическая кривая

engine-e-evidence-tsa-unsupported-public-key-algorithm = неподдерживаемый алгоритм открытого ключа

engine-e-evidence-tsa-rsa-key-or-signature-too = ключ или подпись RSA слишком велики

engine-e-evidence-tsa-rsa-modulus-not-odd = модуль RSA не нечётный

engine-e-evidence-tsa-rsa-signature-out-of-range = подпись RSA вне диапазона

engine-e-evidence-tsa-rsa-key-too-small = ключ RSA слишком мал

engine-e-evidence-tsa-invalid-padding = недопустимое заполнение

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: закодированное сообщение слишком длинное

engine-e-evidence-tsa-last-octet-invalid = недопустимый последний октет

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: старшие биты не равны нулю

engine-e-evidence-tsa-pss-bad-padding = PSS: неверное заполнение

engine-e-evidence-tsa-pss-signature-mismatch = PSS: подпись не совпадает

engine-e-evidence-tsa-unsupported-mask-generation-function = неподдерживаемая функция генерации маски

engine-e-evidence-tsa-mgf1-without-hash = MGF1 без хеша

engine-e-evidence-tsa-bad-pss-salt-length = неверная длина соли PSS

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = для подписи ECDSA нужен ключ EC

engine-e-evidence-tsa-an-rsa-signature-needs-an = для подписи RSA нужен ключ RSA

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption без алгоритма дайджеста

engine-e-evidence-tsa-an-rsa-pss-signature-needs = для подписи RSA-PSS нужен ключ RSA

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey без алгоритма дайджеста

engine-e-evidence-tsa-unsupported-signature-algorithm = неподдерживаемый алгоритм подписи

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: пусто

engine-e-evidence-tsa-time-stamp-request-not-granted = запрос метки времени не удовлетворён

engine-e-evidence-tsa-no-time-stamp-token-in = в ответе нет токена метки времени

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = это не TimeStampResp и не TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = это не CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: нет содержимого

engine-e-evidence-tsa-signeddata-short = SignedData: слишком коротко

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: пусто

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = инкапсулированное содержимое не является TSTInfo

engine-e-evidence-tsa-no-tstinfo = нет TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo не в OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: слишком коротко

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: нет genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: нет signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = ожидается ровно один SignerInfo

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: нет sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: нет алгоритма дайджеста

engine-e-evidence-tsa-signerinfo-short = SignerInfo: слишком коротко

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: нет подписанных атрибутов

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: нет алгоритма подписи

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: нет подписи

engine-e-evidence-tsa-no-serial = нет серийного номера

engine-e-evidence-tsa-signer-certificate-not-found = сертификат подписанта не найден

engine-e-evidence-tsa-attribute-empty = Attribute: пусто

engine-e-evidence-tsa-attribute-no-values = Attribute: нет значений

engine-e-evidence-tsa-attribute-no-value = Attribute: нет значения

engine-e-evidence-tsa-content-type-attribute-mismatch = атрибут content-type не совпадает

engine-e-evidence-tsa-digest-failure = сбой дайджеста

engine-e-evidence-tsa-signature-not-an-octet-string = подпись не является OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = отсутствует атрибут ess signing certificate

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: пусто

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id не найден

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: нет хеша

engine-e-evidence-tsa-unsuitable-certificate-purpose = неподходящее назначение сертификата

engine-e-evidence-tsa-certificate-is-not-yet-valid = сертификат ещё не действителен

engine-e-evidence-tsa-certificate-has-expired = срок действия сертификата истёк

engine-e-evidence-tsa-invalid-ca-certificate = недопустимый сертификат CA

engine-e-evidence-tsa-certificate-chain-too-long = цепочка сертификатов слишком длинная

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: пусто

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: нет дайджеста

engine-e-evidence-tsa-message-imprint-mismatch = отпечаток сообщения не совпадает

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER неопределённой длины не поддерживается

engine-e-evidence-tsr-expected-tag-found = ожидалось { $what } (тег { $tag }), найдено: { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = некорректный PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = ответ с меткой времени не был удовлетворён

engine-e-evidence-tsr-not-timestamp-token = это не токен метки времени

engine-e-evidence-tsr-the-token-content-type-is = тип содержимого токена не является CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = токен не содержит TSTInfo

## src/evidence/tsr.rs

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = отпечаток сообщения использует неподдерживаемый алгоритм хеширования

engine-e-evidence-tsr-the-imprint-is-bytes-not = отпечаток занимает { $digest } байт, а не { $want_len } байт, которые даёт { $hash_alg }

engine-e-evidence-tsr-gentime-is-not-utc = genTime не в UTC

engine-e-evidence-tsr-malformed-gentime = некорректный genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime не является реальным календарным временем

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = не шестнадцатеричная строка в нижнем регистре

engine-e-evidence-verify-expected-bytes-found = ожидалось байт: { $N }, найдено: { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = в пакете уже есть токен метки времени; для замены передайте --replace

engine-e-evidence-verify-not-attached-the-pack-with = не присоединён: пакет с этим токеном не проходит проверку ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = пакет содержит лабораторную аттестацию: { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = файл подписи не заканчивается переводом строки

engine-evidence-verify-signer-not-pinned-the-signature = подписант не закреплён: подпись доказывает, что пакет не изменён, относительно ключа { $r }, который пакет указывает сам. Сравните этот отпечаток с полученным от подписанта или передайте ключ.

engine-evidence-verify-range-is-not-inside-log = диапазон { $start }..{ $end } не входит в журнал размером { $full_bytes } байт

engine-evidence-verify-timestamp-token-states-its-imprint = токен метки времени указывает { $gen_time }; его отпечаток { $v2 } manifest.json. Подпись службы меток времени не проверена Kshana: проверьте её командой `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = токен метки времени указывает { $gen_time }; его отпечаток { $v2 } manifest.json; подпись и цепочка службы меток времени: { $v3 } относительно заданных якорей.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` — пустая строка

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } вне словаря допустимых значений

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = диапазон стоимости должен быть конечным, неотрицательным, упорядоченным low≤nominal≤high и содержать источник

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction и availability должны быть долями в [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } должно быть конечным и > 0, получено { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } должно быть конечным и >= 0, получено { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg должно быть в [-90, 90), получено { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = в орбитальной группировке нет спутников

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats при задании должно быть >= 1

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = спутник срыва { $sat } вне допустимого диапазона

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = строка { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = строка { $lineno }: столбцов: { $v }, ожидалось не менее { $min }

engine-e-fusion-kfgins-line-columns = строка { $v1 }: столбцов: { $v }

engine-e-fusion-kfgins-line-block-lists-are-not = строка { $lineno }: блочные списки не поддерживаются

engine-e-fusion-kfgins-line-expected-key-value = строка { $lineno }: ожидалось `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = строка { $lineno }: ключ с отступом без родительского ключа

engine-e-fusion-kfgins-line-only-one-level-of = строка { $lineno }: допускается только один уровень вложенности

engine-e-fusion-kfgins-line-unterminated-flow-list = строка { $lineno }: незавершённый строчный список

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` — список, ожидался скаляр

engine-e-fusion-kfgins-missing = `{ $k }` отсутствует

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` должен быть списком из трёх элементов

engine-e-fusion-kfgins-no-imu-sample-at-or = нет отсчёта IMU в момент starttime или после него

engine-e-fusion-kfgins-imu-time-not-increasing-at = время IMU не возрастает в точке { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } должно быть конечным и > 0, получено { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m должно быть конечным и > 0, получено { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg должно быть в [-90, 90), получено { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = строка { $v1 } CSV траектории: не числа: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = строка { $v1 } CSV траектории: ожидалось столбцов: 10, получено: { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = строка { $v1 } CSV траектории: время не возрастает

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = CSV траектории должен содержать не менее двух строк

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = CSV траектории охватывает { $rows } с, а сценарий длится { $v2 } с

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg площадки должно быть в [-90, 90], а все поля — конечными

engine-e-geometry-sky-is-neither-gnss-preset = sky: «{ $name }» не является ни предустановкой GNSS ({ $e_gnss }), ни предустановкой LEO ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: задайте пользователя как `site` или `user_ecef_m`, но не оба сразу

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m должно быть конечным и не совпадать с геоцентром

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: спутник { $id }: азимут/угол места вне допустимого диапазона

engine-e-geometry-sky-satellite-is-given-in = sky: спутник { $id } задан в ECEF; для запроса нужен `site` или `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: спутник { $id }: положение ECEF не конечно

engine-e-geometry-sky-satellite-coincides-with-the = sky: спутник { $id } совпадает с пользователем

engine-e-geometry-sky-satellite-give-az-deg = sky: спутник { $id }: задайте az_deg и el_deg либо ecef_m и ничего более

engine-e-geometry-sky-tle-is-bytes-the = sky: размер tle — { $text } байт; предел — { $MAX_TLE_BYTES } (4 МиБ)

engine-geometry-element-set-refused = набор элементов отклонён: { $e }

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] sky: tle не содержит полного двухстрочного набора элементов; пропущена { $n_ignored } строка, первая: { $first }
        [few] sky: tle не содержит полного двухстрочного набора элементов; пропущено { $n_ignored } строки, первая: { $first }
        [many] sky: tle не содержит полного двухстрочного набора элементов; пропущено { $n_ignored } строк, первая: { $first }
       *[other] sky: tle не содержит полного двухстрочного набора элементов; пропущено { $n_ignored } строки, первая: { $first }
    }

engine-e-geometry-sky-epoch = sky: эпоха: { $e }

engine-geometry-and-more = { "." }.. и ещё { $more }

engine-e-geometry-sky-give-systems-or-tle = sky: задайте `systems` или `tle` (вместе с `site`), либо `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system именует спутники `tle`; в запросе нет `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg должно быть в [-90, 90), получено { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: для `systems` нужен `site` (или `user_ecef_m`), из которого ведётся наблюдение

engine-e-geometry-sky-time-must-be-finite = sky: time_s должно быть конечным

engine-e-geometry-sky-system-asks-for-satellites = sky: система «{ $name }» запрашивает спутников: { $asked }; запрос вмещает не более { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: более { $MAX_SATELLITES } спутников

engine-e-geometry-sky-tle-needs-site-or = sky: для `tle` нужен `site` (или `user_ecef_m`), из которого ведётся наблюдение

engine-e-geometry-sky-more-than-satellites-above = sky: более { $MAX_SATELLITES } спутников над горизонтом

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m должно быть положительным, получено { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence должно быть в (0, 1), получено { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: в зоне видимости более { $MAX_CLOCKS } систем, у каждой свои часы; сгруппируйте спутники под меньшим числом меток `system` или используйте clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n должно быть в 1..={ $MAX_MC_SAMPLES }, получено { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: в зоне видимости слишком мало спутников для определения положения; облака Монте-Карло нет

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = небо по TLE на { $e }, не измерение

engine-e-geometry-invalid-sky-request-json = некорректный запрос sky (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = некорректный запрос sky (TOML): { $e }

engine-e-geometry-invalid-skyline-json = некорректная линия горизонта (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = некорректная линия горизонта (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = неверный PRN ГЛОНАСС в { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = тип страницы { $pt } здесь не кодируется

engine-e-gnss-navmsg-gal-fnav-bits-expected = бит: { $data }, ожидалось { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = бит: { $p }, ожидалось { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = хвостовые биты не равны нулю

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = несовпадение CRC-24Q

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = тип страницы { $pt } здесь не декодируется

engine-e-gnss-navmsg-gal-fnav-symbols-expected = символов: { $symbols }, ожидалось { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = синхрокомбинация не найдена

engine-e-gnss-navmsg-gal-fnav-page-type-missing = тип страницы { $t } отсутствует

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav страницы типа { $t } отличается от страницы типа 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = нет поля Galileo { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = тип слова { $wt } здесь не кодируется

engine-e-gnss-navmsg-gal-inav-bits-expected = бит: { $word }, ожидалось { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = тип слова { $wt } здесь не декодируется

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = части страницы должны занимать 120 бит

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = флаги чётности/нечётности не 0, затем 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = не номинальная страница (страница типа 1 — страница тревоги)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = бит: { $part }, ожидалось { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = символов: { $symbols }, ожидалось { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = тип слова { $t } отсутствует

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav слова типа { $t } отличается от слова типа 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = запись относится к системе { $system }, а не к Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = в типе 10 нет поля { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = в типе 11 нет поля { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = в типе 30 нет поля { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = тело CNAV содержит бит: { $body }, ожидалось 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } или счётчик TOW { $tow_count } вне допустимого диапазона

engine-e-gnss-navmsg-gps-cnav-bits-expected = бит: { $bits }, ожидалось { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = преамбула не равна 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = тип сообщения { $t } здесь не декодируется

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = нужны сообщение типа 10 и сообщение типа 11

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } при младшем разряде { $value2 } не помещается в { $bits } { $v4 } бит

engine-e-gnss-navmsg-bits-layout-needs = бит: { $bits }, схеме нужно { $need }

engine-e-gnss-navmsg-no-field = нет поля { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } при масштабе 2^{ $scale_pow2 } не помещается в { $bits } { $v1 } бит

engine-e-gps-lnav-no-value-for = нет значения для { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: опорной модели "gfc" нужен `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: не удаётся прочитать gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: неизвестная опорная модель `{ $other }` (допустимы "egm2008" или "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: неизвестный эллипсоид `{ $other }` (допустимы "wgs84" или "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations должно быть не менее 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations ограничено значением 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = неверное вещественное число '{ $t }'

engine-e-gravity-pds-bad-integer = неверное целое число '{ $t }'

engine-e-gravity-pds-empty-shadr-table = пустая таблица SHADR

engine-e-gravity-pds-shadr-header-has-fields-expected = заголовок SHADR содержит полей: { $f }, ожидалось не менее 6

engine-e-gravity-pds-shadr-header-negative-degree-order = заголовок SHADR: отрицательные степень/порядок или неизвестная нормализация

engine-e-gravity-pds-shadr-normalization-state-only-fully = состояние нормализации SHADR { $normalization } (поддерживается только полная нормализация, состояние 1)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = опорные долгота/широта SHADR должны быть равны 0

engine-e-gravity-pds-non-physical-gm-must-be = нефизичное значение GM (должно быть конечным и положительным)

engine-e-gravity-pds-non-physical-reference-radius-must = нефизичный опорный радиус (должен быть конечным и положительным)

engine-e-gravity-pds-shadr-record-fields = запись SHADR { $v1 }: полей: { $f }

engine-e-gravity-pds-shadr-record-bad = запись SHADR { $v1 }: неверная пара (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = запись SHADR { $v1 }: коэффициент не конечен

engine-e-gravity-pds-no-shadr-coefficient-records = нет записей коэффициентов SHADR

engine-e-gravity-pds-shadr-table-incomplete-missing = таблица SHADR неполна: отсутствует (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = отсутствует earth_gravity_constant / gravity_constant

engine-e-gravity-sh-missing-radius = отсутствует radius

engine-e-gravity-sh-non-physical-earth-gravity-constant = нефизичное значение earth_gravity_constant (должно быть конечным и положительным)

engine-e-gravity-sh-non-physical-radius-must-be = нефизичное значение radius (должно быть конечным и положительным)

engine-e-gravity-sh-no-gfc-coefficient-lines = нет строк коэффициентов gfc

engine-e-gravity-sh-read-error = ошибка чтения: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = строка { $lineno }: норма { $v } не поддерживается (только fully_normalized)

engine-gravity-sh-line-bad = строка { $lineno }: неверно { $what }

engine-e-gravity-sh-line-degree-above-the-declared = строка { $lineno }: степень { $n } выше объявленной max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = строка { $lineno }: порядок { $m } выше степени { $n }

engine-e-gravity-sh-line-time-variable-term-is = строка { $lineno }: зависящий от времени член `{ $key }` не поддерживается (только статические модели)

engine-e-gravity-sh-missing-end-of-head = отсутствует end_of_head

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s должно быть положительным, получено { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s должно быть положительным, получено { $duration_s }

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = запись содержит неконечную ошибку времени

engine-e-holdover-test-unknown-mask-expected-one-of = неизвестная маска { $id }; ожидалась одна из: { $masks }

engine-e-holdover-test-every-budget-max-abs-te = каждый max_abs_te_ns бюджета должен быть конечным и положительным

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } лежит вне записи (от { $t0_s } до { $t_end } с по её собственной шкале времени)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } должно быть позже gnss_removed_s ({ $gnss_removed_s }) и не выходить за конец записи ({ $t_end } с)

engine-e-holdover-test-the-holdover-step-holds-no = шаг holdover не содержит ни одного отсчёта

engine-holdover-test-the-record-has-no-step = в записи нет шага { $step }: GNSS был снят на первом же отсчёте

engine-holdover-test-the-step-has-samples-the = шаг { $step }: отсчётов: { $te_ns }; для оценивателей нужно не менее 13

engine-e-holdover-test-step-with-mask-has-no = у шага с маской нет кривой

engine-e-holdover-test-cannot-read-csv-path = не удаётся прочитать csv_path { $path }: { $e }

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks } (MODELLED, измерено относительно маски)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m должно быть конечным и > 0, получено { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba должно быть >= 0, а coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: два плеча не приведены к общему времени усреднения. Оптическое плечо накапливает данные за integration_s = { $integration_s } с; шумовая полоса контура радиоплеча B_L = { $dll_bandwidth_hz } Гц усредняет за 1/(2*B_L) = { $rf_equivalent_averaging_s } с. Отношение двух сигм, взятых при разных временах усреднения, не является сравнением, поэтому оно не приводится. Уберите переопределение rf_dll_bandwidth_hz (тогда по умолчанию берётся 1/(2*integration_s)) или задайте его равным { $v4 } Гц.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: плечо не даёт пригодной положительной конечной сигмы (оптическое { $opt_sigma_range_m } м, радио { $rf_sigma_range_m } м), поэтому отношение не формируется.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = неизвестный rf_band '{ $other }' (ожидалось s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } должно быть конечным

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db должно быть конечным и >= 0

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa должно быть в [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class должно быть >= 1

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = неизвестный детектор '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = неизвестный imu_grade { $other }; ожидалось одно из: navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = неизвестная combination { $other }; ожидалось одно из: rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = неизвестный trn_fix_mode { $other }; ожидалось одно из: none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } должно быть конечным и неотрицательным (получено { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m должно задавать не менее одного порога

engine-e-inertial-coast-crossing-thresholds-entries-must-be = элементы crossing_thresholds_m должны быть конечными и положительными (получено { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades должно задавать не менее одного класса IMU

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s должно быть конечным и неотрицательным (получено { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 должно быть конечным и неотрицательным (получено { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg должно быть конечным и лежать в (-89, 89) (получено { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m должно лежать в [-1000, 100000] (получено { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s должно быть положительным

engine-e-inertial-coast-drift-band-must-satisfy-lo = полоса дрейфа должна удовлетворять 0 < lo < hi (получено lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = сериализация результата ins-trn-coast: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | IMU { $grade }, { $speed } m/s, комбинация { $comb } | { $heads } | TRN { $mode } пик { $peak_error_m } м за { $mission } с

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va выведено из физики холодноатомного интерферометра)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = размер сценария — { $toml_text } байт, что превышает предел { $max_bytes } байт

engine-e-inline-only-the-scenario-kind-reads-its = сценарий вида `{ $kind }` читает данные из файлов на хосте, поэтому эта поверхность его не запускает; используйте командную строку `kshana`

engine-e-inline-only-the-field-names-file-this = поле `{ $k }` указывает файл: эта поверхность принимает только встроенное содержимое

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = JSON трассы: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = неизвестный набор данных `{ $key }`; утверждённые: { $v1 }, либо пользовательский набор данных

engine-e-interference-map-api-dataset-is-data-but-the = набор данных `{ $key }` содержит данные вида { $kind }, а вид входных данных — { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } не является датой в формате YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = неизвестный параметр `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = ожидалось позиционных аргументов: { $positionals }, получено: { $pos }

engine-e-interference-map-cli-cannot-read = не удаётся прочитать { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom требует { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } уже существует; Kshana не перезаписывает карты. Удалите его или выберите другой каталог --out

engine-interference-map-cli-note-cell-deg-is-not = примечание: --cell-deg { $cell_deg } не совпадает с предварительно зарегистрированным размером ячейки ({ $PREREGISTERED_CELL_DEG }); карты сообщают об этом

engine-e-interference-map-cli-cannot-create = не удаётся создать { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = записан { $path }: опубликовано ячеек: { $cells }, помечено: { $n_deg }

engine-interference-map-cli-no-usable-rows-nothing-written = нет пригодных строк: ничего не записано

engine-e-interference-map-cli-unknown-subcommand = неизвестная подкоманда `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = SHA-256 скачанного файла ({ $got }) не совпадает с закреплённым значением ({ $expected }); файл отброшен

engine-e-interference-map-cli-cannot-write = не удаётся записать { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl не найден в PATH. Установите curl или скачайте { $NATURAL_EARTH_LAND_URL } самостоятельно и проверьте, что его SHA-256 равен { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = не удаётся запустить curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = записан { $out }: полигоны суши Natural Earth, SHA-256 проверен (общественное достояние, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = нет файлов trace_full_* в { $path }

engine-e-interference-map-cli-cannot-read-2 = не удаётся прочитать { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } не является датой в формате YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: неверная дата карты

engine-e-interference-map-cli-cannot-write-2 = не удаётся записать { $out }: { $e }

engine-interference-map-cli-route-length-km = длина маршрута { $rows } км

engine-interference-map-cli-caveats-degraded-cell-does-not = Оговорки: ячейка с ухудшенными показателями не указывает на помехи как на причину; ненаблюдавшиеся ячейки не свидетельствуют о чистоте маршрута; это не прогноз.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = полигоны суши: некорректный JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = отсутствует обязательный столбец `{ $name }`

engine-e-interference-map-cannot-read-input = не удаётся прочитать входные данные: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` не является датой (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours должно быть не менее { $MIN_DELAY_HOURS }: обсерватория не публикует раньше

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg должно быть не мельче { $MIN_CELL_DEG }: обсерватория публикует только крупные ячейки

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } пока нельзя опубликовать: его продукт выпускается не раньше { $fmt_utc } (через { $delay_hours } ч после окончания суток)

engine-interference-map-observatory-kshana-observatory-ads = ОБСЕРВАТОРИЯ KSHANA  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = ЯЧЕЙКИ { $trim_deg } ГРАД  СУТКИ UTC  NOT OBSERVED НЕ ОЗНАЧАЕТ ЧИСТО  ПРИЧИНА НЕ УКАЗЫВАЕТСЯ

engine-interference-map-observatory-source-licence = ИСТОЧНИК { $dataset }  ЛИЦЕНЗИЯ { $dataset2 }

## src/interference_map/observatory.rs

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (ОПУБЛИКОВАННЫЕ ЯЧЕЙКИ)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Обсерватория Kshana, карта навигационной точности по ADS-B, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = не удаётся создать { $path } (Kshana не перезаписывает продукты): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = во входных данных нет пригодного отчёта за { $day } (найденные дни: { $days })

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } уже существует; Kshana не перезаписывает продукты

engine-interference-map-observatory-cells-published-degraded-incident = опубликовано ячеек: { $p }, с ухудшением: { $p2 }, инцидентов: { $p3 }

engine-interference-map-observatory-rows-replayed-under-variants = строк воспроизведено: { $rows }, вариантов: { $variants }: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = карта не является корректным JSON: { $e }

engine-e-interference-map-route-route-invalid-json = маршрут: некорректный JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = маршрут: строка { $v1 } не имеет вида `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Экспорт Kshana { $v1 }. Эпоха: { $epoch_note }. Движущиеся объекты: GCRS (referenceFrame INERTIAL), метры, секунды после эпохи. Неподвижные площадки: земная система WGS 84 (referenceFrame FIXED), метры.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Положение: GCRS, метры.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Широта { $lat_deg } deg, долгота { $lon_deg } deg, высота { $h_m } m над эллипсоидом WGS 84. Положение: земная система координат, метры.

engine-interop-czml-radius-along-the-ground = { $description }. Радиус { $radius_m } m вдоль земной поверхности.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Без привязки ко времени: долгота и широта WGS 84 в градусах, прижаты к земле.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Положения в земной системе координат; MultiLineString разрезается по антимеридиану, а times_utc затем перечисляет только исходные отсчёты.

engine-interop-geojson-kshana-export-epoch = Экспорт Kshana { $v1 }. Эпоха: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = некорректный GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = у LineString нет массива coordinates

engine-e-interop-geojson-an-rfc-7946-linestring-needs = LineString по RFC 7946 требует две или более позиции

engine-interop-geojson-position-is-not-an-array = позиция { $i } не является массивом из двух или трёх чисел

engine-interop-geojson-position-longitude-is-not-number = позиция { $i }: долгота не является числом

engine-interop-geojson-position-latitude-is-not-number = позиция { $i }: широта не является числом

engine-e-interop-geojson-position-longitude-is-outside-180 = позиция { $i }: долгота { $lon } вне [-180, 180] (в GeoJSON долгота указывается первой)

engine-e-interop-geojson-position-latitude-is-outside-90 = позиция { $i }: широта { $lat } вне [-90, 90] (в GeoJSON долгота указывается первой)

engine-e-interop-geojson-track-needs-two-or-more = для трека нужны две или более путевые точки

engine-e-interop-geojson-the-route-spans-more-than = маршрут охватывает более 180 градусов долготы; виды треков шагают в простых градусах и не могут пересекать антимеридиан

engine-e-interop-geojson-position-is-deg-from-an = позиция { $worst } отстоит на { $worst2 } deg от равномерно разнесённого прямого трека (допуск { $tol_deg } deg); виды треков летят по start + i*step, поэтому задайте равномерно разнесённые позиции на прямой или только два конца

engine-e-interop-geojson-route-applies-to-the-kinds = маршрут применим к видам, которые летят по треку путевых точек (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` не принимает траекторию на вход

engine-e-interop-geojson-scenario-toml-is-not-table = TOML сценария не является таблицей

engine-e-interop-geojson-cannot-serialise-scenario = не удаётся сериализовать сценарий: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = неизвестный формат экспорта '{ $other }'; ожидался один из: czml, kml, geojson, stk, sigmf, all или list

engine-e-interop-member = элемент { $label }: { $e }

engine-interop-the-scenario-could-not-be = сценарий не удалось экспортировать: { $m }

engine-e-interop-invalid-spectrum-scenario = некорректный сценарий спектра: { $e }

## src/interop/scene.rs

engine-e-interop-scene-objects-samples-is-more-than = объектов: { $items } x отсчётов: { $times } — это больше, чем записывает экспорт ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = некорректный сценарий { $kind }: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = источник подавления { $jammer_type }, мощность передачи { $power_dbw } dBW, усиление антенны { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, по уравнениям линии связи вида jamming при расположении источника подавления на горизонте приёмника и потерях в свободном пространстве

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (стадия [pass] цепочки)

engine-interop-scene-circular-orbit-km-altitude-deg = круговая орбита, высота { $altitude_km } km, наклонение { $inclination_deg } deg (средние элементы SGP4 на начало окна, как их распространяет вид passes)

engine-interop-scene-ground-station-deg-elevation-mask = наземная станция, маска угла места { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; состояния в GCRS и в земной системе координат — собственный вывод вида ephemeris (UT1 и движение полюса, как их задаёт сценарий)

engine-interop-scene-static-scene-the-kind-flies = статическая сцена: вид { $kind } летит по не привязанному ко времени треку путевых точек

engine-interop-scene-true-track-flown-gps-denied = истинный трек пройден без GPS: путевых точек: { $track } от start_lat_deg/start_lon_deg с шагом step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = у `{ $kind }` нет сцены

engine-e-interop-scene-missing-numeric = отсутствует числовое `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = отсутствует целое `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } вне 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } на высоте { $altitude_km } km, наклонение { $inclination_deg } deg (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = сценарий не задаёт `epoch`; t = 0 — это { $epoch }, самая ранняя эпоха среди собственных данных спутников (эпоха TLE, бортовых эфемерид или SP3). Каждый спутник распространяется от собственной эпохи, и они охватывают { $spread_h } h: метки времени следуют допущению движка, что каждый спутник стартует при t = 0, а каждое положение поворачивается в системы GCRS и земную в собственный момент этого спутника. Экспорты SP3 и OEM вместо этого помечают t = 0 как 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = сценарий не задаёт `epoch`; t = 0 — это { $epoch }, эпоха, которую несут собственные данные спутников (эпоха TLE, бортовых эфемерид или SP3). Экспорты SP3 и OEM вместо этого помечают t = 0 как 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = объектов: { $satellites } x отсчётов: { $times_s } — это больше, чем записывает экспорт ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = пользователь ({ $user_environment }), движется (постоянные скорость и курс вида)

engine-interop-scene-user-receiver = пользователь ({ $user_environment }), приёмник

engine-interop-scene-user-orbit-km-altitude-deg = орбита пользователя, высота { $altitude_km } km, наклонение { $inclination_deg } deg (кеплерова модель{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = нет движущегося объекта { $index }

engine-interop-stk-kshana-export-object = # Экспорт Kshana { $v1 }: { $scene }, объект { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = источник подавления { $jammer_type }, мощность передачи { $power_dbw } dBW, усиление антенны { $gain_dbi } dBi (параметр бюджета линии связи сценария, а не сигнал)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = у `{ $other }` нет траектории транспортного средства для экспорта; экспорт для испытательного стенда охватывает виды gnss-ins, jamming и gnss-sim

engine-e-interop-testbench-empty-motion-csv = пустой CSV движения

engine-e-interop-testbench-motion-csv-header-is-not = заголовок CSV движения не соответствует ожидаемым столбцам: { $head }

engine-e-interop-testbench-row-fields-expected = строка { $v1 }: полей: { $f }, ожидалось { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = строка { $v1 }: столбец { $motion_columns } не является числом

engine-e-interop-testbench-line-no = строка { $v1 }: нет `$`

engine-e-interop-testbench-line-no-checksum = строка { $v1 }: нет контрольной суммы

engine-e-interop-testbench-line-bad-checksum-field = строка { $v1 }: неверное поле контрольной суммы

engine-e-interop-testbench-line-checksum-mismatch = строка { $v1 }: контрольная сумма не совпадает

engine-e-interop-testbench-line-short-gga = строка { $v1 }: слишком короткая GGA

engine-interop-testbench-line-bad-latitude = строка { $v1 }: неверная широта

engine-interop-testbench-line-bad-longitude = строка { $v1 }: неверная долгота

engine-e-interop-testbench-line-bad-altitude = строка { $v1 }: неверная высота

engine-e-interop-testbench-line-bad-separation = строка { $v1 }: неверное разделение

engine-e-interop-testbench-line-short-rmc = строка { $v1 }: слишком короткая RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = строка { $v1 }: RMC без предшествующей GGA

engine-e-interop-testbench-line-gga-and-rmc-times = строка { $v1 }: время GGA и RMC различается

engine-e-interop-testbench-line-bad-speed = строка { $v1 }: неверная скорость

engine-e-interop-testbench-line-bad-course = строка { $v1 }: неверный курс

engine-e-interop-testbench-line-bad-time-or-date = строка { $v1 }: неверное время или дата

engine-e-interop-testbench-gga-with-no-following-rmc = GGA без последующей RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = файл путевых точек должен содержать не менее двух отсчётов

engine-e-interop-testbench-the-sample-step-is-not = шаг отсчётов { $step } с не равен целому числу миллисекунд

engine-e-interop-testbench-the-samples-are-not-equally = отсчёты не равноотстоят: интервал { $v1 } равен { $dt } с, первый — { $step } с

engine-e-interop-testbench-empty-waypoint-file = пустой файл путевых точек

engine-e-interop-testbench-waypoint-not-three-numbers = путевая точка { $v1 }: не три числа

engine-e-interop-testbench-waypoint-fields-expected = путевая точка { $v1 }: полей: { $f }, ожидалось 3

engine-e-interop-testbench-events-csv-header-is-not = заголовок CSV событий не равен label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = строка события { $v1 }: ожидалось полей: 5

engine-e-interop-testbench-event-row-unknown-kind = строка события { $v1 }: неизвестный вид { $f }

engine-e-interop-testbench-event-row-bad-onset = строка события { $v1 }: неверное начало

engine-e-interop-testbench-event-row-bad-end = строка события { $v1 }: неверное окончание

engine-interop-testbench-no-waypoints-txt-written = файл .waypoints.txt не записан: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = не время UTC `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = отсутствует { $what }

engine-e-ionex-bad-number-in = { $what }: неверное число в { $col }

engine-e-ionex-two-digit-year = { $what }: двузначный год { $year }

engine-e-ionex-no-end-of-header = нет END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = карты IONEX с зависимостью от высоты (3-D) не поддерживаются

engine-e-ionex-zero-grid-step = нулевой шаг сетки

engine-e-ionex-grid-needs-at-least-nodes = сетка должна содержать не менее 2 x 2 узлов

engine-e-ionex-map-no = карта { $index }: нет { $end_label }

engine-e-ionex-map-band-latitude-header-grid = карта { $index }: полоса { $band } широта { $band_lat }, сетка заголовка { $want }

engine-e-ionex-map-band-longitudes-differ = карта { $index }: долготы полосы { $band } различаются

engine-e-ionex-map-band-truncated = карта { $index }: полоса { $band } усечена

engine-e-ionex-map-bands-header-grid-has = карта { $index }: полос: { $band }, в сетке заголовка: { $n_lat }

engine-e-ionex-map-no-epoch-of-current = карта { $index }: нет EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = карт TEC: { $tec_maps }, заголовок # OF MAPS IN FILE: { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = эпохи карт TEC не возрастают

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz не содержит целого числа отсчётов на период { $code } ({ $spc } отсчётов)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods и noncoherent должны быть положительными

engine-e-iq-acq-stream-ended-after-of-samples = поток завершился после { $got } из { $needed } отсчётов

engine-e-iq-acq-cfar-reference-cells-must-be = опорные ячейки CFAR должны быть чётными и не менее 2 (получено { $n })

engine-e-iq-acq-cfar-stride-must-be-at = шаг CFAR должен быть не менее 1 лага

engine-e-iq-acq-cfar-per-cell-pfa-must = Pfa CFAR на ячейку должна лежать в (0, 1) (получено { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = окно CFAR простирается на { $reach } лагов в каждую сторону, это слишком широко для периода в { $samples_per_period } лагов

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = неизвестный формат поверхности { $s }: ожидался csv, json или bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = поверхность содержала бы { $spc_cells } ячеек (предел { $MAX_SURFACE_CELLS }): увеличьте шаг по Доплеру или сузьте диапазон Доплера

engine-e-iq-acq-surface-surface-header = заголовок поверхности: { $e }

engine-e-iq-acq-surface-surface-schema-expected = схема поверхности { $schema }; ожидалась { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = тело поверхности: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = запись '{ $id }': format и sample_rate_hz должны задаваться вместе

engine-e-iq-campaign-conditions-test-conditions-json = условия испытаний (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = условия испытаний (TOML): { $e }

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf требует записи SigMF (получено { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = метаданные SigMF: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = метаданные SigMF: отсутствует global core:sample_rate

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: отсутствует core:sample_start

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: нет core:sample_count и нет точек мощности, завершающих событие

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema должна быть "{ $SCHEMA }" (получено "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id не должен быть пустым

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s должно быть конечным и >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 должно состоять из 64 шестнадцатеричных цифр

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind должно быть "iq" или "receiver-log" (получено "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = требуется хотя бы одна группа [[expected]]

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids не должны быть пустыми

engine-e-iq-campaign-conditions-duplicate-id = { $at }: повторяющийся id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s должно быть позже onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects должно быть "all" или списком id

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: id в affects { $bad } нет в [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q должно быть положительным

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points не должно быть пустым

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points должно идти в порядке времени

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points должно быть конечным

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" требует reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = события '{ $id }' и '{ $id2 }' пересекаются на общем спутнике

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s должно быть >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s должно быть положительным

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = запись '{ $id }': SHA-256 { $sha } не совпадает с заявленным { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s должно быть положительным

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db должно быть положительным

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s должно быть >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz должно быть положительным

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs должно быть не менее 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = кампания (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = кампания (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions должно перечислять хотя бы один файл или шаблон glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds должно быть >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = имена frontend должны быть непустыми и уникальными ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' не совпадает ни с одним файлом

engine-e-iq-campaign-spec-recording-id-appears-in-both = id записи '{ $w }' встречается и в { $w2 }, и в { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names требует inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: нет проекта '{ $n }' в { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = строка истинных значений { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = профиль C/N0: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = профиль C/N0: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = сегмент { $i }: значения step должны быть конечными

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = сегмент { $i }: для ramp нужно end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = сегмент { $i }: points требует равных по длине непустых t_s и db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = сегмент { $i }: t_s должно строго возрастать

engine-iq-channel-cn0-profile-segment-points-must-be-finite = сегмент { $i }: points должны быть конечными

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = сегмент { $i }: fade s4 должно быть в (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = сегмент { $i }: fade tau_s должно быть положительным

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: запись содержит отсчётов: { $samples }, для этого поиска нужно { $need }

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: укажите формат параметром --surface-format csv|json|bin или завершите путь на .csv, .json либо .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = захват: { $fs_hz } Hz, когерентных периодов: { $coherent_periods } x некогерентных: { $noncoherent }, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = отчёт пересобран: ячеек { $cells_present } из { $cells_total }, строк: { $rows }, не прошли порог: { $rows_failed }; дайджест { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    кампания { $name }: ячеек: { $cells_total }; уже выполнено: { $cells_skipped }, выполнено сейчас: { $cells_run }, с ошибкой: { $cells_failed }, ожидает: { $cells_pending }
    вывод: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    первый сбой ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: событий: { $events }, ожидаемых спутников: { $tc }; хеш условий { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = наклонная ионосфера { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = вертикальная ионосфера { $t } TECU

engine-iq-cli-channel-tropo-doy = тропосфера doy { $tropo_doy }

engine-iq-cli-channel-multipath-ground = многолучевость { $h }m, поверхность: { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground должно быть dry, wet или sea (получено { $other })

engine-e-iq-cli-channel-give-at-most-one-of = задайте не более одного из --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass ожидает lo,hi (получено { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass требует lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } с переходной полосой { $transition } Hz не помещается ниже fs/2 ({ $v1 } Hz); сузьте полосу или переходную полосу

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits должно быть 1..=16 (получено { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = отфильтровано отсчётов: { $total } ({ $fs_hz } Hz) в { $out } ({ $format }); sidecar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = не удаётся прочитать { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = некорректный сценарий labfit: { $e }

engine-iq-cli-labfit-fitted-run-wrote = подогнано прогонов: { $runs }; записано { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = подогнано единиц по кампании: { $fit_units }; записано { $written }

engine-iq-cli-labfit-cannot-write = не удаётся записать { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } требует значения

engine-e-iq-cli-cannot-parse = { $k }: не удаётся разобрать { $v }

engine-e-iq-cli-cannot-parse-2 = { $k }: не удаётся разобрать { $p }

engine-iq-cli-unknown-iq-processing-command-expected = неизвестная команда обработки iq { $other }; ожидалась одна из: scene, acquire, track, sweep, labfit, frontend, monitor, campaign или conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } вне допустимого диапазона для GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = не найдено исправных эфемерид GPS для запрошенных PRN

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos ожидает lat,lon,alt (получено { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; профиль C/N0 (сегментов: { $segments })

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format должно быть csv или jsonl (получено { $other })

engine-iq-cli-scene-written-by-kshana-iq-scene = записано командой kshana iq scene: СИМУЛИРОВАННАЯ сцена, а не запись

engine-iq-cli-scene-ion-sdr-metadata = метаданные ION SDR { $path }

engine-iq-cli-scene-sigmf-data-meta = данные SigMF { $data_path }, метаданные { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = записано командой kshana iq scene

engine-iq-cli-scene-wrote-samples-hz-to-truth = записано отсчётов: { $samples } ({ $format }, { $fs_hz } Hz) в { $data_path }; записей истинных значений: { $truth_records } в { $truth_path }; { $meta_note }; канал: { $chan_desc }

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } нельзя сочетать с --design: sweep прогоняет каждый проект из файла

engine-iq-cli-sweep-loop-design-sweep-design-prn = sweep проектов контура: результатов (проект, PRN): { $rows }{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: запись содержит отсчётов: { $samples }, для захвата нужно { $need }

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: не захвачен (статистика { $statistic } < порога { $threshold }); увеличьте --doppler-max, --acq-coherent или --acq-noncoherent либо проверьте запись

engine-iq-cli-track-designs-and-differ-in-integration = проекты { $first } и { $d } различаются по integration.extra_taps_chips; проекты одного прогона должны совпадать, чтобы каждая выходная запись имела одни и те же столбцы

## src/iq/cli/track.rs

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: укажите формат параметром --epochs-format csv|jsonl|bin или завершите путь на .csv, .jsonl либо .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz: отсчётов на элемент кода { $c } — { $r }; соизмеримая дискретизация превращает дискриминатор кода в ступенчатую функцию (при 2 отсчётах на элемент DLL дрожит, около { $lit_0_09 } элемента RMS ошибки кода при 45 dB-Hz); дрожание и смещение контура кода по этой записи нерепрезентативны. Для оценки контуров кода используйте частоту, не кратную половине скорости следования элементов кода.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = рабочий процесс завершился до обработки этого входа

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = неизвестный параметр { $s }

engine-e-iq-io-cli-format-needs-rate = --format требует --rate

engine-iq-io-cli-unknown-iq-command = неизвестная команда iq { $other }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow читает только одноканальные записи

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow читает запись с одним захватом, в этой их: { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: нет положительного core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: захват не начинается на границе байта

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = неизвестный формат отсчётов { $name }: ожидался, например, ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, с необязательным окончанием _qi для комплексных

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sample_rate_hz sidecar { $sample_rate_hz } не положительно

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: записи .sdrx содержат один поток; канала { $channel } не существует

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: необработанный файл без sidecar; укажите его формат или запишите { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = не удаётся сериализовать строку: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = некорректный проект фильтра { $design }: passband_frac в (0, 1), затухание > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = ПЧ { $if_hz } Hz должна лежать строго между 0 и половиной частоты дискретизации ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }данные sdrx: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-бит { $enc } { $fmt } ({ $packed_bits } бит/отсчёт)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = неподдерживаемый SigMF core:datatype { $datatype }: поддерживаются ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be и вещественные ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } не является SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = некорректные метаданные SigMF: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = у { $format } нет SigMF core:datatype; запишите его как raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } не совпадает с { $c0 } первой записи

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: нет core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } не положительно

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } при { $rate } Hz не совпадает с { $f0 } при { $r0 } Hz первой записи

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: первый захват не начинается на границе байта

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = запрошен канал { $channel }; в записи каналов: { $channels } (нумерация каналов с 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = некорректная коллекция SigMF: { $e }

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } не совпадает с { $h } коллекции

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = потока { $select } из { $channels } чередующихся потоков не существует (нумерация потоков с 0)

engine-e-iq-io-stream-sample-of-does-not-start = отсчёт { $k } из { $format } не начинается на границе байта

engine-e-iq-io-stream-time-window-start-duration-both = временное окно: начало { $start_s } с, длительность { $duration_s } с: оба значения должны быть неотрицательными

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = наиболее разрушительная заявленная Q (cw): нет табличного значения для типа `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: кампания не завершена

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } не совпадает с ячейками ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = запись `{ $id }`: хеш условий испытаний { $h } не совпадает с записанным { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = сигнал `{ $signal }`: неизвестная скорость следования элементов кода

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = ни один прогон не пригоден для подгонки захвата: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = недостаточно данных: подгонка не выполнена (записей: { $m }; нужно не менее { $min_rec })

engine-iq-labfit-iqfit-uncensored-span-db-is-under = нецензурированный размах J/S { $span_db } dB меньше { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff и delta не идентифицируются раздельно (|corr| { $full } >= { $v2 }): модель зависит только от delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = неизвестный режим `{ $m }` (допустим только `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage должно быть [lower, upper] в пределах [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds должно быть [lower, upper], где 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db должно быть [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = в кампании нет события с заданным профилем мощности для подгонки

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Лабораторная подгонка по IQ-кампании: { $r }

    Схема `{ $schema }`, движок { $engine_version }. Метка: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = DIGEST кампании `{ $campaign_digest }`; SHA-256 `campaign.json` `{ $campaign_json_sha256 }`; SHA-256 сценария `{ $scenario_sha256 }`; ячеек: { $cells }; реплик бутстрепа: { $bootstrap } (seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Единица { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Статус: { $status }. Записей: { $recordings }, спутников: { $satellites }, событий: { $events }; подогнано интервалов: { $bins_used }, цензурировано: { $bins_censored }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = Модель C/N0 ({ $q_mode }): `delta_eff` = { $ci } dB (идентифицируемое смещение, приведённое к Q = 1); `Q_eff` = { $q }; `delta` при этом Q = { $ci2 } dB; corr(Q, delta) { $om }; остаточное RMS { $residual_rms_db } dB на размахе J/S { $span_db } dB. Q_eff не идентифицируется по данным C/N0 без независимого измерения мощности.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q удержана на заявленном значении: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Отложенная проверка (исключение по одной записи), интерполяция: интервалов { $bins }, RMS C/N0 { $om } dB, охват PI90 { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    SHA-256 таблицы валидации `{ $table_sha256 }` (зарегистрирована { $registered }):

    | порог | предел | значение | вердикт |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = журнал прогона `{ $label }`

engine-e-iq-labfit-run = прогон `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = в [input] сценария не указана кампания

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign и [[runs]] взаимоисключающи: задайте что-то одно

engine-e-iq-labfit-iq-labfit-scenario = сценарий iq-labfit: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = журнал не содержит C/N0 по спутникам{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = нет эпохи до начала на { $onset } с

engine-iq-labfit-observe-no-epoch-at-or-after = нет эпохи в момент начала или после него на { $onset } с

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Лабораторная подгонка: { $r }

    Метка: **{ $label }**. SHA-256 настроек `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Модель: { $model } ({ $label })

    | параметр | значение | границы | на границе | sd бутстрепа (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Отложенная проверка ({ $scheme }, блоков: { $folds }): все { $om } с, интерполяция { $om2 } с, экстраполяция { $om3 } с.

    | отложенный прогон | класс | расстояние | ближайший обучающий прогон | RMS с |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } зарезервирован для будущего использования (определён только FID 0)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } вне 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = символов SB1, расходящихся с декодированным полем: { $sb1_err }

engine-iq-lunanet-afs-frames-at-and-are-symbols = кадры в { $w } и { $w2 } разнесены на { $gap } символов, а не на { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } следует за TOI { $w2 }, ожидалось { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = неожиданный символ { $c } в потоке символов (допустимы только 0, 1 и пробельные символы)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: первые 24 элемента кода различаются

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: последние 24 элемента кода различаются

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (документ приводит A14850 и для PRN 147, и для PRN 151; генератор воспроизводит значение PRN 151, поэтому запись для PRN 147, скорее всего, опечатка в документе)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = закодировано 0x{ $word }, декодировано FID { $fid } TOI { $toi }

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = настройки монитора: { $e }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = статическое положение не конечно

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = траектория с постоянной скоростью не конечна

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = в траектории по путевым точкам нет путевых точек

engine-e-iq-scene-geometry-waypoint-not-finite = путевая точка не конечна

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = времена путевых точек должны строго возрастать

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } не является PRN GPS C/A

engine-e-iq-scene-ephemeris-system-is-not-gps = система эфемерид { $system } не является GPS

engine-e-iq-scene-satellite = спутник { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = является пилотным (безданным) компонентом и не несёт навигационных данных

engine-e-iq-scene-nav-carries-data-the-scene-does = несёт данные, которые сцена не моделирует; генерируйте её без данных

engine-e-iq-scene-nav-does-not-carry-gps-lnav = не несёт GPS LNAV (его несёт только GPS L1 C/A); используйте данные с seed

engine-e-iq-scene-nav-not-an-lnav-source = не является источником LNAV

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = сцена должна содержать хотя бы один спутник (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler перечисляет значений: { $dopplers }; задайте по одному на --prn ({ $ids }) или единственное значение

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = строка истинных значений содержит полей: { $f }, ожидалось 10

engine-e-iq-scene-truth-truth-field = поле истинных значений { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = sat_id истинных значений: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz должно быть положительным числом

engine-e-iq-short-duration-must-be-in = duration_s должно быть в (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids должны содержать от 1 до { $MAX_SATELLITES } спутников

engine-e-iq-short-dopplers-must-be-finite = dopplers должны быть конечными

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q первичный { $primary_prn } S{ $secondary } третичный { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q первичный { $primary_prn } S{ $secondary } (третичный опущен)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = нешестнадцатеричный символ { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = шестнадцатеричных символов { $hex } не хватает для ровно { $len } элементов кода

engine-iq-signals-primary-only = { $name } (только первичный)

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } вне допустимого диапазона

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = частотный канал ГЛОНАСС L1OF { $id } вне -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = неизвестный сигнал { $other }; ожидался один из: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = строка { $v1 }: нет ';'

engine-e-iq-signals-galileo-line-no-code-number-in = строка { $v1 }: нет номера кода в { $label }

engine-e-iq-signals-galileo-code-appears-twice = код { $number } встречается дважды

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = для слежения BOC нужен интервал раннего и позднего каналов в (0, { $max }) элементов кода, чтобы E и L оставались на главном пике (получено { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = порог bump-jump должен быть не менее 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = частота дискретизации должна быть положительной

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods должно быть положительным

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows должно быть положительным

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } должно делить длину бита { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = поддерживается не более { $MAX_EXTRA_TAPS } дополнительных отводов (получено { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = смещения дополнительных отводов должны быть конечными и в пределах ±{ $MAX_TAP_OFFSET_CHIPS } элементов кода (получено { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = окно C/N0 требует не менее 2 prompt-отсчётов

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: ожидалось atan2, costas-atan или costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: ожидалось cross-product, atan2 или atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: ожидалось pull-in или always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: ожидалось eml-power, dot-product или eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: ожидалось pll, fll или fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } не применяется при carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: ожидалось число >= 0 (0 отключает ограничение)

engine-e-iq-track-design-must-be-positive-number-got = { $k } должно быть положительным числом (получено { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods должно быть не менее 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips должно лежать в (0, 2] (получено { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips содержит не более { $MAX_EXTRA_TAPS } смещений (получено { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = смещения integration.extra_taps_chips должны быть конечными и в пределах ±{ $MAX_TAP_OFFSET_CHIPS } элементов кода (получено { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) должно быть ниже carrier.fll_off_pli ({ $off }), оба в (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s должно быть нулём или положительным (получено { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s должно быть положительным (получено { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order должно быть 1, 2 или 3 (получено { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order должно быть 1 или 2 (получено { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order должно быть 1 или 2 (получено { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold должно лежать в [-1, 1] (получено { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows должно быть не менее 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods должно быть не менее 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) не должно быть ниже lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db должно быть конечным

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes должно быть не менее 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods должно быть не менее 1 (или "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent должно быть не менее 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa должно лежать в (0, 1) (получено { $pfa })

engine-e-iq-track-design-design-overrides = переопределения проекта: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = переопределения проекта не могут задавать name или extends

engine-e-iq-track-design-loop-design-file = файл loop-design: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = файл loop-design: схема { $other } не поддерживается; ожидалась { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = файл loop-design: отсутствует schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = файл loop-design: нет таблиц [[design]]

engine-e-iq-track-design-loop-design-file-design-number = файл loop-design: у [[design]] номер { $v1 } нет name

engine-e-iq-track-design-loop-design-file-design-name = файл loop-design: имя проекта { $name } зарезервировано или пусто

engine-e-iq-track-design-loop-design-file-design-is = файл loop-design: проект { $name } определён дважды

engine-e-iq-track-design-no-design-named-the-file = нет проекта с именем { $n }; в файле: { $value }

engine-e-iq-track-design-loop-design-file-design-extends = файл loop-design: проект { $name } расширяет сам себя (цикл)

engine-e-iq-track-design-loop-design-file-design-extends-2 = файл loop-design: проект { $name } расширяет неизвестный проект { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = фазовому контуру нужны порядок 1..=3 и Bn > 0 (получено { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = частотному контуру нужно Bn > 0 (получено { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = порядок частотного контура должен быть 1 или 2 (получено { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = фильтру контура нужен фазовый тракт, частотный тракт или оба

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = интервал раннего и позднего каналов должен лежать в (0, 2] элементов кода (получено { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = порядок DLL должен быть 1 или 2 (получено { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = скорость следования элементов кода и частота несущей должны быть положительными

## src/iq/track/sink.rs

engine-e-iq-track-sink-an-epoch-carries-extra-taps = эпоха несёт дополнительных отводов: { $extra }, но вывод настроен на { $n }: все каналы прогона должны использовать одни и те же extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = запись занимает { $b } байт; ожидалось { $want }

engine-e-iq-track-sink-unknown-lock-state-code = неизвестный код состояния захвата { $b }

engine-e-iq-track-sink-epoch-file-header = заголовок файла эпох: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = схема файла эпох { $schema }; ожидалась { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = записи файла эпох занимают { $record_bytes } байт; этот читатель ожидает { $want } ({ $BINARY_RECORD_BYTES } плюс { $BINARY_TAP_BYTES } на каждый дополнительный отвод)

engine-e-iq-track-sink-epoch-file-ends-inside-record = файл эпох обрывается внутри записи ({ $got } из { $size } байт)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = формат эпох { $o }: ожидался csv, jsonl или bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` не является числом

engine-e-jammertest-cli-is-not-utf-text = { $path } не является текстом UTF-8

engine-e-jammertest-cli-needs-catalog = требуется --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = требуется хотя бы один --plan

engine-e-jammertest-cli-is-not-utf = { $cat } не в UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } не в UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` не входит в ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` не является UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = требуется --log-start либо --log с --format

engine-e-jammertest-cli-log-needs-format = --log требует --format

engine-e-jammertest-cli-the-log-does-not-state = журнал не указывает время своего начала: используйте --log-start

engine-e-jammertest-cli-the-log-states-its-start = журнал указывает своё начало как `{ $label }`: используйте --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } не в UTF-8

engine-e-jammertest-cli-cannot-write = не удаётся записать { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = событий { $SCHEDULED_TRUTH }: { $events }, записано в { $o } (пропущено слотов без RF: { $skipped_non_rf }, вне журнала: { $outside_log }, id вне каталога: { $unknown_ids })

engine-jammertest-cli-note-ids-not-in-the = примечание: id вне каталога: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = примечание: это запланированные слоты плана, а не записанное время в эфире.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  название теста

## src/jammertest/cli.rs

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = тестов: { $tests }, пригодных к оценке: { $evaluable }: обнаружено в пределах допуска: { $detected }, с опозданием: { $late }, пропущено: { $missed }; медианная задержка { $fmt_opt }, медианное время восстановления { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = ложные тревоги вне всех слотов: прогонов: { $false_alarm_runs }, эпох: { $false_alarm_epochs } из { $clean_epochs } чистых

engine-e-jammertest-cli-needs-session-path = требуется путь к сеансу

engine-e-jammertest-cli-needs-catalog-and-plan-or = требуются --catalog и --plan либо --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = пакет доказательств записан в { $out }; отпечаток подписанта { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = в { $root } нет папки с scenario.json и файлом .ubx

engine-e-jammertest-dataset-scenario = сценарий: { $e }

engine-e-jammertest-dataset-read = чтение: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = в scenario.json нет даты

engine-e-jammertest-dataset-scenario-json-date-is-not = дата `{ $date }` в scenario.json не является датой

engine-e-jammertest-dataset-no-readable-epoch-in-mon = в mon_rf.csv и rinex.csv нет читаемой эпохи

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = в { $root } нет папки с scenario.json

engine-jammertest-dataset-recovered-of-median = { $f2 } восстановлено ({ $recovered } из { $alarmed }), медиана { $f22 } с

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = журнал указывает своё начало как `{ $l }`, что не является UTC ISO-8601: задайте начало явно

engine-e-jammertest-the-log-does-not-state = журнал не указывает время своего начала: задайте его явно

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = каталог не является JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = в каталоге нет массива `test_types`

engine-e-jammertest-plan-test-type-has-no-type = у типа теста нет `type_id`

engine-e-jammertest-plan-test-group-has-no-group = у группы тестов нет `group_id`

engine-e-jammertest-plan-test-has-no-test-id = у теста нет `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = каталог не перечисляет тестов

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` не является временем плана вида 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = план не является JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = в плане нет массива `locations`

engine-e-jammertest-plan-test-end-time-is-not = тест { $id }: end_time не позже start_time

engine-e-jammertest-plan-the-plan-has-no-test = в плане нет испытательной площадки { $l }; есть: { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = в плане несколько испытательных площадок: { $areas }; укажите, на какой записан журнал

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json не является JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = нет массива `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024, тест { $id }, окно { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = в attack_log нет окна начала/конца

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = запланированных событий: { $events }, но прогон оценил { $events2 }: передайте собственные события прогона

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s должно быть положительным, а guard_s — неотрицательным

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m должно перечислять хотя бы один элемент

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m должно быть конечным

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: ожидалось "null-steering" или "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz должно быть положительным (получено { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: разделу нужен [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) должно быть конечным и не ниже tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s должно быть конечным и неотрицательным (получено { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits должно быть от 1 до 16 (получено { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz должно быть положительным (получено { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side должно быть не менее 2 (получено { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } должно быть конечным (получено { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } должно быть положительным (получено { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: точка профиля { $points } ({ $lat }, { $lon }) вне тайла DEM

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: точка профиля { $points } ({ $lat }, { $lon }) попала на пропуск DEM

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = календарная дата UTC вне допустимого диапазона: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = такой календарной даты нет: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = секунда UTC { $second } вне допустимого диапазона в { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = у места старта на полюсе нет определённого азимута

engine-e-launch-inclination-unreachable-from-latitude-without = наклонение { $inclination_rad }° недостижимо с широты { $lat_rad }° без доглега (нужно |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = скорость площадки на истинном полюсе требует и `epoch`, и `eop_finals2000a` (реальное тело IERS finals2000A)

engine-e-launch-site-lon-deg-must-be = site_lon_deg должно быть в [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a не содержит читаемых строк IERS finals2000A

engine-e-launch-epoch-mjd-is-outside-the = эпоха { $epoch } (MJD { $mjd_utc }) вне переданных строк EOP (MJD от { $mjd } до { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg должно быть в [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg должно быть в [0, 180]

engine-launch-launch-window-lat-az-asc = launch-window: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° восходящий, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s выигрыш от вращения Земли, возможностей в сутки: { $opportunities } (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = каждой скорости изменения дальности нужна положительная конечная сигма

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = геометрия Доплера вырождена

engine-e-leo-fusion-doppler-no-covariance = нет ковариации

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = каждой псевдодальности нужна положительная конечная сигма

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = спутник совпадает с оценкой положения

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = геометрия вырождена

engine-e-leo-fusion-joint-pvt-no-iteration-ran = ни одна итерация не выполнялась

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = вырожденная итоговая геометрия

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP не конечен

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } должно быть положительным

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m должно быть неотрицательным, а прогон — не более 5000 эпох

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = каждому сигналу нужна положительная полоса

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, дальность CRB от { $range_sigma_zenith_m } до { $range_sigma_mask_m } m; медианная формальная 3D { $s2 } m, ошибка RMS { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = для PPP нужна хотя бы одна система

engine-e-leo-fusion-ppp-duration-and-step-must-be = длительность и шаг должны быть положительными, не более 20000 эпох

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs должно быть от 1 до 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = пороги сходимости должны быть положительными

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } LEO: { $n_leo }  медиана { $c } min  сошлось { $v4 }%  NEES среднее { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = медианная горизонтальная ошибка по прогонам: { $runs_per_case } · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = предустановка { $id } не несёт сигнала

engine-e-leo-fusion-presets-preset-has-no-signal-it = у предустановки { $id } нет сигнала { $n }; есть: { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = неизвестная предустановка LEO { $id }; известные: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s и step_s должны быть положительными, не более 20000 эпох

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = полярные шаги должны быть положительными

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = режим должен быть doppler, joint, polar или timing; получено { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = для режима doppler нужна хотя бы одна система LEO

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = для режима timing нужна система LEO с кодовой дальнометрией

engine-e-leo-fusion-pvt-kind-unknown-clock-class = неизвестный класс часов { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) в точке { $user_lat_deg }, { $user_lon_deg } за { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system }, пролёт в зените: макс. Доплер { $max_doppler_hz } Hz, скорость { $max_doppler_rate_hz_s } Hz/s, рывок { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }спутник LEO с дальнометрией в зоне видимости в { $v1 }% эпох{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } доступность { $availability }, медианный PDOP { $f }, RMS 3D ошибки { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } совместно { $f3 }; в зоне видимости { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, максимум { $row3 } ns (в зоне видимости { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — режим { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = система { $name }: role должно быть gnss или leo, получено { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = система { $name }: clock должно быть estimated или known, получено { $c }

engine-e-leo-fusion-system-system-must-be-positive = система { $name }: { $what } должно быть положительным

engine-e-leo-fusion-system-system-mask-deg-must-be = система { $name }: mask_deg должно быть в [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = система { $name }: sigma_pr_m должно быть положительным

engine-e-leo-fusion-system-give-at-least-one-system = задайте хотя бы одну [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = шаг эпох должен быть положительным

engine-e-leo-fusion-timing-no-epochs = нет эпох

engine-e-leo-fusion-timing-no-satellite-was-ever-in = ни один спутник ни разу не был в зоне видимости: приёмник так и не захватил время

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = поляризация должна быть rhcp, lhcp или linear; получено '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = код ошибки SGP4 { $code } при t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = орбита с наклонением { $inc } deg никогда не проходит над широтой { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = запрошенный максимальный угол места ниже предела видимости горизонта

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = класс здания должен быть traditional или thermally-efficient; получено '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = поле { $name } не конечно

engine-e-leo-navmsg-codec-field-is-outside-its-bit = поле { $name } = { $value } { $unit } вне своего { $bits }-битного диапазона (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = сообщение усечено

engine-e-leo-navmsg-codec-field-list-exhausted = список полей исчерпан

engine-e-leo-navmsg-codec-field-order-mismatch-vs = порядок полей не совпадает: { $name } и { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID должен быть 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = каждому полиному поправки нужно 1-8 коэффициентов

engine-e-leo-navmsg-codec-correction-time-scale-must-be = масштаб времени поправки должен быть степенью двойки от 1 s до 32768 s; получено { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = полиному ECEF нужно 1-11 коэффициентов, одинаковое число по каждой оси

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = степень полинома ECEF { $v1 } превышает 10

engine-e-leo-navmsg-codec-unknown-model-id = неизвестный id модели { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = полезная нагрузка превышает 4095 байт

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = кадр короче заголовка и CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = неверная преамбула 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = неподдерживаемая версия { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = длина кадра { $frame } не совпадает с объявленной полезной нагрузкой в { $len } байт

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = несовпадение CRC-24Q: вычислено 0x{ $crc }, в кадре 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = каждое из rac_degrees должно быть не более 7; получено { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree должно быть 1-10; получено { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = неизвестная модель эфемерид '{ $other }': используйте kepler16, kepler-rac, liu22 или ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = интервал подгонки должен быть не менее 10 s; получено { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = окно подгонки [{ $t0 }, { $v1 }] s лежит вне истинной дуги [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = подгонка полинома ECEF вырождена (слишком мало отсчётов для этой степени)

engine-e-leo-navmsg-fit-clock-fit-is-singular = подгонка часов вырождена

engine-e-leo-navmsg-fit-keplerian-fit-diverged = кеплерова подгонка разошлась

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = неизвестная предустановка '{ $k }'; доступные: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s должно быть 10-3600 s, а update_period_s — в (0, fit_interval_s]; получено { $fit_interval_s } и { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s и eval_step_s должны быть { $lit_0_5 }-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz должно превышать 10 MHz; получено { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid должен быть 1-255

engine-e-leo-navmsg-band-must-be-15-and = band должно быть 0-15, а health — 0-3

engine-e-leo-navmsg-unknown-csv-schema = неизвестная csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis должно называть хотя бы один анализ

engine-e-leo-navmsg-unknown-analysis-use = неизвестный анализ '{ $a }'; используйте { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind должно быть leo-navmsg; получено { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg должно быть в [0, 60); получено { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    Навигационное сообщение LEO — { $res } km, { $res2 } deg, степень гравитации { $gravity_degree }, модель { $res3 }
    { "  " }веса SISRE: w_R { $w_r }, w_AC^2 1/{ $v6 } (маска { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s должно быть 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s должно быть непустым, каждый элемент 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }компромисс по интервалу подгонки на { $span } s (период использования = интервал подгонки):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  RMS орбитальной SISRE { $sisre_orb_rms_m } m  максимум { $sisre_orb_max_m } m  с RMS часов { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s должно быть непустым, каждый элемент 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s должно быть 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  параметров { $m0 }  RMS орбитальной SISRE { $sisre_orb_rms_m } m  с часами { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = нет пролёта выше { $mask } deg для пользователя в { $lat }, { $lon } в пределах { $search } s; расширьте midpass.search_s или переместите пользователя

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }обновление в середине пролёта: пролёт { $p0 }-{ $p1 } s (макс. угол места { $pmax } deg), переключений: { $switches }, наибольший скачок дальности до пользователя { $max_jump } m (геометрия наихудшего случая { $max_worst } m) при пороге { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }кодирование-декодирование: модель { $m }, кадр { $frame } байт (бит полезной нагрузки: { $payload_bits }, бит эфемерид и часов: { $eph_bits }), CRC-24Q 0x{ $hex }
    { "    " }квантование: наибольшее изменение положения { $v6 } mm, часов { $v7 } mm; SISRE точная { $acc_exact } m, квантованная { $acc_q } m
    { "    " }повреждённый кадр отклонён: { $corrupted_rejected }; круговое преобразование RINEX { $rin_dp } m; круговое преобразование CSV { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs должно быть 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  опубликовано { $published } m  отношение { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = 16-параметрический кеплеров набор ухудшается с { $a } m при { $lo } s до { $b } m при { $hi } s: один кеплеров набор с гармониками дважды за оборот не может следовать за более высокочастотными членами гравитации и сопротивлением атмосферы на дуге LEO дольше нескольких минут, а его остаток наименьших квадратов колеблется по окну. Полиномы вдоль/поперёк/по радиусу более высокой степени, чем охватывает кеплеров набор, поглощают оставшееся и дают { $c } m при { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = 16-параметрический кеплеров набор переходит с { $a } m при { $lo } s к { $b } m при { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, степень гравитации { $gravity_degree } · ошибка представления относительно эталона · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` — это функция библиотеки хоста

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: генераторы выборки `rand_distr` в редких ветвях вызывают `exp` и `ln` хоста; используйте `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` — гравитационное поле библиотеки хоста; используйте `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` не проверен

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = нет строки END OF HEADER

engine-e-leo-navmsg-text-expected-eph-record-header-got = ожидался заголовок записи '> EPH', получено { $head }

engine-e-leo-navmsg-text-bad-satellite-id = неверный id спутника { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = отсутствует строка эпохи

engine-e-leo-navmsg-text-bad-epoch-line = неверная строка эпохи { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = неверное поле эпохи в { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = строке эпохи нужны три члена часов: { $ep }

engine-e-leo-navmsg-text-record-truncated = запись усечена

engine-e-leo-navmsg-text-unknown-record-type = неизвестный тип записи { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = таблица CSV несёт сообщения kepler16 и kepler-rac; получено { $m }

engine-e-leo-navmsg-text-empty-csv = пустой CSV

engine-e-leo-navmsg-text-row-has-cells-header = в строке ячеек: { $cells }, в заголовке: { $header }

engine-e-leo-navmsg-text-bad-number-in-column = неверное число { $c } в столбце { $k }

engine-e-leo-navmsg-text-csv-row-lacks = в строке CSV нет { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = высота орбиты должна быть между 100 km и 3000 km; получено { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = эксцентриситет для подгонки LEO должен быть в [0, { $lit_0_1 }); получено { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = шаг интегрирования должен быть в (0, 30] s; получено { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = длительность должна быть положительной, не более 200000 шагов; получено { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree должно быть 0, 2-6 (зональная) или 7-{ $v1 } (EGM2008); получено { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = распространение эталона разошлось

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = эталонная орбита снизилась ниже 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = шаг узлов должен быть в (0, 60] s; получено { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = для табличной эталонной орбиты нужно не менее двух состояний; получено { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = состояние { $k } не конечно

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = adev_1s часов должно быть в [0, 1e-6); получено { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = измеренные часы строятся через TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = для управляемых часов нужны sigma_s в [0, 1e-3) и tau_s > 0; получено { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = для измеренных часов нужны положительный шаг и не менее двух отсчётов

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = отсчёт измеренных часов не конечен

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = эпоха '{ $s }' не в формате YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = эпоха '{ $s }' не в формате YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = у эпохи '{ $s }' неверное поле секунд

engine-e-leo-pass-epoch-is-out-of-range = эпоха '{ $s }' вне допустимого диапазона

engine-e-leo-pass-band-unknown-signal-design-public = диапазон '{ $name }': неизвестный проект сигнала '{ $n }'; публичные проекты: { $v2 }

engine-e-leo-pass-band-is-not-in-the = диапазона '{ $name }' нет в предустановке системы: задайте frequency_mhz и eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = диапазону '{ $name }' нужен eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern должно быть isoflux, gaussian или flat; получено '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = частота диапазона '{ $name }' вне допустимого диапазона

engine-leo-pass-overridden-in-the-scenario = { $source } (переопределено в сценарии)

engine-e-leo-pass-system-has-no-band = у системы '{ $id }' нет диапазона '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = спутнику LEO нужен хотя бы один диапазон

engine-e-leo-pass-at-most-12-bands-per = не более 12 диапазонов на спутник

engine-leo-pass-unknown-system-presets-in-this = неизвестная система '{ $n }'; предустановки в этой сборке: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = нет солнечно-синхронной орбиты на высоте { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (не более 86400) и step_s должны быть положительными, не более 20000 эпох; получено { $duration } и { $step }

engine-leo-pass-leo-satellite-km-deg = спутник LEO { $system }, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = `epoch` сценария { $epoch }, читается как UTC

engine-leo-pass-the-kind-default-epoch-utc = эпоха вида по умолчанию { $epoch } UTC (сценарий её не задаёт)

engine-e-leo-pass-user-environment-must-be-ground = user.environment должно быть ground, maritime, air или indoor; получено '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg должно быть в пределах +/-90

## src/leo_pass.rs

engine-e-leo-pass-user-speed-must-be-to = скорость пользователя должна быть от 0 до 3000 m/s, высота от -500 до 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna должно быть patch, hemispherical или isotropic; получено '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability должно лежать в (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model должно быть klobuchar, vtec или none; получено '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction должно быть ascending или descending; получено '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = спутник { $id }: недопустимый эксцентриситет или перигей

engine-e-leo-pass-satellite-tle-needs-tle-line1 = спутник { $id }: для tle нужны tle_line1 и tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit должно быть pass, elements или tle; получено '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = для leo_constellation нужна система или проект (design)

engine-e-leo-pass-no-sun-synchronous-inclination = солнечно-синхронного наклонения не существует

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: не более 5000 спутников

engine-e-leo-pass-no-leo-satellite-rises-above = в окне ни один спутник LEO не поднимается выше маски

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s должно лежать в (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' не является диапазоном ни одного спутника LEO ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = нет сигнала ГНСС '{ $bname }' для орбитальной группировки '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = пустая орбитальная группировка ГНСС

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' не являются двумя различными диапазонами { $id }

engine-e-leo-pass-iot-powers-and-battery-must = мощности и батарея iot должны быть положительными

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from должно быть median или peak; получено '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = порог обнаружения { $detection_snr_db } dB после интегрирования

engine-leo-pass-coherent-integration-at-most-ms = когерентное интегрирование не более { $rx } ms, ограничено скоростью изменения Доплера

engine-leo-pass-serial-search-with-correlators = последовательный поиск, корреляторов: { $correlators }

engine-leo-pass-hot-start-doppler-known-to = горячий старт: Доплер известен с точностью +/-{ $aided } Hz, эфемериды действительны

engine-leo-pass-leo-pass-link-budget-user = Бюджет линии связи пролёта LEO, пользователь ({ $environment }) в точке { $lat_deg }, { $lon_deg }; спутников LEO: { $satellites }, окно { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, максимальный угол места { $max_elevation_deg } deg в { $tca_s } s, { $duration_above_mask_s } s над маской{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 пик { $opt }, медиана { $opt2 }; |Доплер| макс. { $opt3 }; ионосфера { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: в зоне видимости: { $satellites_in_view }, C/N0 от { $opt } до { $opt2 } (медиана { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } пик { $leo_peak_cn0_dbhz } dB-Hz, выше медианы GNSS на { $leo_peak_above_gnss_median_db } dB; выше самой сильной несущей GNSS в течение { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: холодный TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), горячий { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Спуфер с { $onset_s } s (скачок { $offset_m } m, увод { $push_rate_m_s } m/s): тест Доплера GNSS { $t }, LEO { $t2 }, совместный { $t3 }; междиапазонный { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = пользователь ({ $environment }) · пик LEO { $leo_peak_cn0_dbhz } dB-Hz, выше медианы GNSS на { $leo_peak_above_gnss_median_db } dB · MODELLED

engine-leo-pass-user-modelled = пользователь ({ $environment }) · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Доплер первого диапазона каждого спутника LEO (шкала ±{ $v1 } kHz)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = недопустимая таблица [{ $what }]: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' отсутствует в [signal] и не является публичным проектом сигнала ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = у signal_design '{ $name }' нет компонента со слежением по коду, поэтому псевдодальность не определяется

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind должно быть leo-pnt-chain; получено { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = у отслеживаемого компонента нет скорости следования чипов

engine-e-leo-pnt-chain-no-band-of-pass-names = ни один диапазон [pass] не называет signal = "{ $name }"; цепочке нужен такой диапазон, чтобы нести проект сигнала

engine-e-leo-pnt-chain-the-pass-gives-no-code = пролёт не даёт джиттера кода

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m должно лежать в [0, 100] m; получено { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] должно работать в режиме mode = "joint"; получено { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = отслеживаемое C/N0 при маске { $mask } deg (линейная аппроксимация по sin угла места)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] не содержит системы LEO, которая принимала бы значения цепочки

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] не дал совместного блока

engine-leo-pnt-chain-leo-pnt-chain = Цепочка LEO-PNT: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }сигнал { $name2 } ({ $design }), отслеживается { $design2 } на { $v4 } Mchip/s, смещение C/N0 { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }пролёт { $id } { $sat } km: пик отслеживаемого C/N0 { $peak_tracked_cn0_dbhz } dB-Hz, медиана джиттера кода { $jitter_median } m; линия C/N0 { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }сообщение { $res }, аппроксимация { $fit_interval_s } s / обновление { $update_period_s } s: SISRE представления { $stats } mm RMS (орбита { $stats2 } mm), при определении орбиты { $od } m передаётся дальше: { $sisre } m{ "\u000A" }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }совместное решение: только GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }сходимость PPP: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }значения, передаваемые между этапами: { $doc }. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Джиттер слежения по коду, ошибка измерения дальности (m, от 0 до { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · только GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = модуляция { $label }: ширина должна быть положительной

engine-e-leo-signal-unknown-signal-preset-the-library = неизвестная предустановка сигнала { $name }: в библиотеке есть { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = предустановка { $name }: недопустимый файл предустановки: { $e }

engine-e-leo-signal-preset-file-names-itself = файл предустановки { $name } называет себя { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz должно быть положительным

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz должно быть положительным

engine-e-leo-signal-signal-needs-at-least-one = { $name }: сигналу нужен хотя бы один компонент

engine-e-leo-signal-component-power-fraction-must-be = { $name }: у компонента { $v1 } power_fraction должно быть положительным

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: у компонента { $v1 } есть fdma_shares, но нет fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: у компонента { $v1 } fdma_shares должны быть положительными и давать в сумме единицу

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: компоненту { $v1 } нужен один fdma_share на каждое смещение

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps должно быть положительным

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips должно быть положительным

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: доли мощности компонентов в сумме дают { $total }, а не 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km должно быть положительным

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: плоский (подобный OFDM) компонент нельзя разместить в спектральной модели

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: отслеживаемый компонент находится на поднесущих FDMA; спектральная модель отслеживает компонент в центре диапазона

engine-e-leo-signal-signal-is-given-twice = сигнал { $w } указан дважды

engine-e-leo-signal-signals-is-more-than-the = сигналов: { $out }, это больше допустимых 24

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s должно быть меньше 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: укажите от 1 до 40 значений cn0_dbhz

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 и slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points должно быть от 21 до 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: используйте "coherent" или "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = шумовая температура системы должна быть положительной

engine-e-leo-signal-compatibility-unknown-gnss-signal-known =
    { $n ->
        [one] compatibility: неизвестный сигнал GNSS { $n } (известные: { $gnss_victim_names })
        [few] compatibility: неизвестный сигнал GNSS { $n } (известные: { $gnss_victim_names })
        [many] compatibility: неизвестный сигнал GNSS { $n } (известные: { $gnss_victim_names })
       *[other] compatibility: неизвестный сигнал GNSS { $n } (известные: { $gnss_victim_names })
    }

engine-e-leo-signal-trade-reference-signal-is-not =
    { $n ->
        [one] trade.reference_signal { $n } не является сигналом сценария
        [few] trade.reference_signal { $n } не является сигналом сценария
        [many] trade.reference_signal { $n } не является сигналом сценария
       *[other] trade.reference_signal { $n } не является сигналом сценария
    }

engine-e-leo-signal-shape-check-signal-is-not = проверка формы: сигнала { $signal } нет в сценарии

engine-leo-signal-scenario-leo-signal-signals-noise = сценарий leo-signal | сигналов: { $runs } | уровень шума { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = слева: спектральная плотность мощности каждого проекта с ограниченной полосой (dB ниже пика, в пределах его полосы передачи); справа: джиттер кода в зависимости от суммарного C/N0 при шаге корреляции { $reference_spacing_chips } chip

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = неизвестный диапазон '{ $other }' (ожидается s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km должно быть конечным и положительным

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps должно быть конечным и положительным

engine-e-linkbudget-other-losses-db-must-be = other_losses_db должно быть конечным и >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k, если задано, должно быть конечным и положительным

engine-linkbudget-link-budget-band-km-bit = link-budget: диапазон { $value }, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, запас { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = не удаётся слушать { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: прослушивание tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp-клиент подключён

engine-live-io-kshana-live-warning-is-not = kshana live: предупреждение: { $addr } не является адресом loopback; любой, кто может до него дотянуться, может читать поток

engine-e-live-io-cannot-open = не удаётся открыть { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: отключён tcp-клиент, не успевавший за потоком

engine-e-live-io-cannot-open-2 = не удаётся открыть { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: предупреждение: { $addr } не является адресом loopback; любой, кто может до него дотянуться, может отправить этому слою поток

engine-e-live-io-cannot-bind-udp = не удаётся привязать udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: прослушивание udp { $addr }

engine-e-live-io-cannot-connect-to = не удаётся подключиться к { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: подключено к tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: чтение последовательного порта { $path } на скорости { $baud } baud (только чтение)

engine-live-io-the-was-closed-by-the = { $v1 }: соединение закрыто удалённой стороной (слой не переподключается: запускайте его под супервизором, который его перезапускает)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: используйте 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 или 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } не является последовательным устройством (сбой tcgetattr)

engine-e-live-io-cannot-set-baud = не удаётся установить скорость { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = не удаётся установить построчный режим для { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial поддерживается только в Unix; используйте --file, --tcp или --stdin

engine-live-io-unknown-option = неизвестный параметр { $s }

engine-live-io-cannot-read = не удаётся прочитать { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: судовая платформа, калибровка { $calibration_s } s; порог { $v2 }. Программное обеспечение консультативного характера, не навигационное оборудование с утверждённым типом: ответственность остаётся на операторе.

engine-live-io-write-failed = сбой записи: { $e }

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } вне диапазона 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = индекс вставки { $p } вне диапазона 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = файлы Annex 3 содержат кодов: { $gold } и { $ter }, ожидается 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } не является кодом Голда для g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = вторичного кода S{ $id } не существует (S0 до S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 назначает коды только идентификаторам узлов от 1 до 12, а не { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } не помещается в два бита (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } вне диапазона 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = ожидаемое число символов подкадра 1: { $SB1_SYMBOLS }

engine-e-lunar-afs-frame-subframe-data-lengths-expected = длины данных подкадров { $sb2 }/{ $sb3 }/{ $sb4 } (ожидалось { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = ожидалось символов: { $FRAME_SYMBOLS }, передано { $soft }

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = строка { $v1 }: ожидалось `row,column`

engine-e-lunar-afs-ldpc-line = строка { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = строка { $v1 }: ({ $r },{ $c }) вне { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: ожидалось информационных бит: { $info_bits }, передано { $info }

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = данных LSIS V1.0 нет в { $cache_dir } (задайте KSHANA_LSIS_DIR или запустите xval/lunar-afs/fetch_lsis.sh, который загружает { $LSIS_PDF_URL } и извлекает вложения; они не распространяются вместе с Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } не является закреплённым файлом LSIS

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = у { $path } SHA-256 { $got }, ожидалось { $want } (закреплено за LSIS V1.0 от 29 January 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = Модулирующий сигнал LunaNet Augmented Forward Signal, { $LSIS_VERSION }; эталонный генератор Kshana

engine-lunar-afs-waveform-afs-node = узел AFS { $node_id }

engine-lunar-afs-waveform-afs-node-frame-toi = узел AFS { $node_id }, кадр TOI { $toi }

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites должно быть не меньше 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites должно быть не меньше 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg должно лежать в [0, 90); получено { $mask_deg }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } спутник, без маяков
        [few] { $n_sats } спутника, без маяков
        [many] { $n_sats } спутников, без маяков
       *[other] { $n_sats } спутника, без маяков
    }

engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one] { $n_sats } спутник + видимых маяков: { $n_vis_beacons }
        [few] { $n_sats } спутника + видимых маяков: { $n_vis_beacons }
        [many] { $n_sats } спутников + видимых маяков: { $n_vis_beacons }
       *[other] { $n_sats } спутника + видимых маяков: { $n_vis_beacons }
    }

engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } спутник, без маяков
        [few] { $n_cmp } спутника, без маяков
        [many] { $n_cmp } спутников, без маяков
       *[other] { $n_cmp } спутника, без маяков
    }

engine-e-lunar-beacon-serialising-beacon-report = сериализация отчёта о маяках: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = отчёт о маяках должен сериализоваться в объект JSON

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Усиление лунными поверхностными маяками — маска { $elevation_mask_deg } deg, эпоха +{ $epoch_s } s, sigma_URE на маяк { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  спутники { $n_visible_sats }  маяки { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  реализованное 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }маяки улучшают PDOP в { $f }x раз;{ " " }

engine-lunar-beacon-larger-constellation-instead = более крупная орбитальная группировка вместо них: в { $f }x раз{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = не удаётся прочитать лунные эфемериды { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = лунные эфемериды: первая строка должна быть `{ $MAGIC }`, найдено `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = лунные эфемериды: файл пуст

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = лунные эфемериды: `# format:` должно быть `states` или `elements`, найдено `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = лунные эфемериды: нет строк данных

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = лунные эфемериды: отсутствует столбец `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = лунные эфемериды: `# elements_frame:` должно быть `icrf` или `mci`, найдено `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = лунные эфемериды: для `elements_frame: icrf` нужен `# epoch_jd_tdb:` (эпоха, к которой отнесены элементы и в которой вычисляется поворот из ICRF в систему, связанную с Луной): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = лунные эфемериды: короткая строка элементов { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = лунные эфемериды: строка элементов { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = лунные эфемериды: в строке элементов { $v1 } неположительная большая полуось

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = лунные эфемериды: в строке элементов { $v1 } эксцентриситет { $ecc } вне [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = лунные эфемериды: файлу `states` нужно `# frame: icrf` или `# frame: mci`, найдено `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = лунные эфемериды: файлу `icrf` states нужен `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = лунные эфемериды: короткая строка состояния { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = лунные эфемериды: строка состояния { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = лунные эфемериды: строка состояния { $v1 } не конечна

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = лунные эфемериды: строка состояния { $v1 } для спутника { $sat } уходит назад во времени ({ $t } после { $last }); эпохи должны строго возрастать для каждого спутника

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Табличные селеноцентрические эфемериды состояний (система { $e }), интерполированные по Лагранжу порядка { $LAGRANGE_ORDER } между эпохами таблицы и приведённые к MCMF с помощью { $v2 }. Состояния этим движком НЕ распространяются. Класс происхождения `published-ephemeris`: отличается от любой величины, полученной из элементов.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Опубликованное ОПИСАНИЕ орбитальной группировки, заданное в селеноцентрической системе ICRF (`{ $v1 }`), распространяется собственным решателем Кеплера этого движка в той же инерциальной системе и приводится к MCMF по ориентации Луны IAU 2015 / WGCCRE (прецессирующий полюс, аналитическая физическая либрация) в каждую эпоху. Приближения системы координат НЕТ: источник называет систему и эпоху, и используются обе. Класс происхождения `published-elements`: отличается от любой величины, полученной из ядер.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Опубликованное ОПИСАНИЕ орбитальной группировки, распространяемое собственным решателем Кеплера этого движка и приводимое моделью вращения Луны по среднему повороту, — ровно тем же путём, что и иллюстративная орбитальная группировка, так что единственное различие между двумя прогонами — проект орбитальной группировки. Источник задаёт элементы в системе `{ $v1 }`; здесь они читаются как MCI, что наклоняет орбитальную группировку на `published_frame_tie_angle_deg`. Класс происхождения `published-elements`: отличается от любой величины, полученной из ядер.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = неизвестное station_datum { $other }: ожидается "fixed" или "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = для кампании VLBI нужно не менее 2 станций, чтобы образовать базовую линию, получено { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = у станции { $name } неконечная координата

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = широта станции { $name } { $lat } deg вне [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = для семипараметрического датума Гельмерта нужно не менее 3 неколлинеарных маяков, получено { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = у маяка { $name } неконечная координата

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = широта маяка { $name } { $lat } deg вне [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours должно быть положительным и конечным, получено { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min должно быть положительным и конечным, получено { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = расписание из { $v1 } эпох выходит за ограничение этого сценария в 5000 эпох; увеличьте step_min или уменьшите arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s должно быть положительным и конечным, получено { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg должно быть конечным и лежать в [-90, 90), получено { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg должно быть конечным и лежать в [-90, 90), получено { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol должно быть конечным и лежать в [0, 1), получено { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m должно быть положительным и конечным, получено { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver должно быть "spectral" или "srif", получено "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = сериализация результата lunar-frame-campaign: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = ни одно наблюдение кампании не проходит маску угла места { $mask } deg со стороны Земли на обоих концах базовой линии И маску { $earth_mask } deg над собственным горизонтом маяка: эпох: { $n_epochs } x базовых линий: { $v1 } x маяков: { $n_beacons }, все отклонены. Увеличьте arc_hours, снизьте маску или переместите станции.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = полный ранг: все 7 параметров подобия ограничены этой кампанией (число обусловленности { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: ненаблюдаемы { $defect } из 7 направлений подобия в этой кампании, поэтому sigma датума НЕ публикуется; ненаблюдаемые направления перечислены в семипараметрическом базисе

engine-lunar-frame-campaign-of-beacons-have-no-observation = маяки без наблюдений в этом расписании: { $names } из { $beacons } ({ $names2 }); они не несут информации, их sigma равны null, а датум реализуется только по наблюдаемым маякам

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = все sigma должны быть положительными

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane и altitude_km должны быть положительными

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency должно лежать в (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m против наземной { $v2 } m sigma положения, среднее q { $v3 } (хи-квадрат 6 ожидает 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: неоднозначностей { $last }, успех ILS { $last2 } (bootstrap { $last3 }) на самой длинной дуге

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: наименьшее информационное собственное значение x{ $v } со связями с орбитальным аппаратом, след CRLB x{ $v2 }

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: точек перебора { $last } на дугах: { $v }; сигма сдвига по x лазер против GNSS { $last2 } m при зарегистрированной локальной привязке

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB sigma h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = неизвестное исследование `{ $other }`: ожидается одно из { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = набор измерений не определяет орбиту (сингулярная информация)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials должно быть не меньше 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = наземные sigma должны быть положительными

engine-e-lunar-infra-od-unknown-station-dss-14-dss = неизвестная станция `{ $nm }`: DSS-14, DSS-63 или DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = слишком мало наземных измерений для определения орбиты

engine-e-lunar-infra-od-the-covariance-of-the-difference = ковариация разности сингулярна

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = дифференциальная коррекция NRHO не сошлась из начального значения (seed)

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = для elfo нужно 0 < высота перилуния < высота аполуния

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = неизвестное семейство орбит `{ $other }`: nrho или elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s и arc_days должны быть положительными

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = у приёмников нет общего спутника

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = нормальные уравнения фазы несущей сингулярны

engine-e-lunar-infra-phase-the-position-block-is-singular = блок положения сингулярен

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = ковариация неоднозначностей не является положительно определённой

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = sigma методов должны быть положительными

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = sigma локальной привязки должны быть положительными

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz должно быть конечным и положительным

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz должно быть конечным и положительным

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k должно быть конечным и положительным

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km должно быть конечным и больше радиуса Луны

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity должно лежать в [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw должно быть конечным

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = неожиданный заголовок каталога отражателей { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = короткая строка каталога отражателей { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = нечитаемое поле отражателя { $i } в { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = отражатель { $f }: |(x,y,z)| = { $norm3 } m, но в опубликованном столбце радиуса указано { $radius } m — строка была изменена

engine-e-lunar-llr-reflector-catalogue-has-no-rows = в каталоге отражателей нет строк

engine-e-lunar-llr-unreadable-position-epoch-year = нечитаемое position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = неожиданный заголовок каталога станций { $t }

engine-e-lunar-llr-short-station-catalogue-row = короткая строка каталога станций { $t }

engine-e-lunar-llr-unreadable-station-field-in = нечитаемое поле станции { $i } в { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = нечитаемый идентификатор ILRS в { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = в каталоге станций нет строк

engine-e-lunar-llr-cannot-read-this-scenario-runs = не удаётся прочитать { $path } ({ $e }). Этот сценарий работает на зафиксированном срезе реальных данных в { $DEFAULT_DATA_DIR }, который поставляется с репозиторием, но не с опубликованным пакетом (crate); укажите в `data_dir` его копию.

engine-e-lunar-llr-only-usable-normal-points-for = пригодных нормальных точек всего { $used } для отражателей: { $reflectors } — слишком мало, чтобы ограничить координаты: { $v3 }; расширьте срез архива

engine-e-lunar-llr-the-simulated-campaign-own-report = собственный отчёт имитированной кампании не удалось разобрать: { $e }

engine-lunar-llr-lunar-llr-datum-archived-normal =
    { $n ->
        [one] lunar-llr-datum: архивных нормальных точек: { $used } (разобрано { $n_parsed }) от станций: { $station_counts } к массивам ретрорефлекторов: { $reflectors } за { $v5 } d; медианная измеренная прецизионность нормальной точки { $median } mm в одну сторону; информационный ранг отражателей { $rank }/{ $n }; ранг Гельмерта { $rank2 }/{ $n_helmert } cond { $condition }; sigma сдвига датума { $v12 } m; RMS невязки наблюдённое-минус-вычисленное в одну сторону { $rms_m } m ({ $v14 })
        [few] lunar-llr-datum: архивных нормальных точек: { $used } (разобрано { $n_parsed }) от станций: { $station_counts } к массивам ретрорефлекторов: { $reflectors } за { $v5 } d; медианная измеренная прецизионность нормальной точки { $median } mm в одну сторону; информационный ранг отражателей { $rank }/{ $n }; ранг Гельмерта { $rank2 }/{ $n_helmert } cond { $condition }; sigma сдвига датума { $v12 } m; RMS невязки наблюдённое-минус-вычисленное в одну сторону { $rms_m } m ({ $v14 })
        [many] lunar-llr-datum: архивных нормальных точек: { $used } (разобрано { $n_parsed }) от станций: { $station_counts } к массивам ретрорефлекторов: { $reflectors } за { $v5 } d; медианная измеренная прецизионность нормальной точки { $median } mm в одну сторону; информационный ранг отражателей { $rank }/{ $n }; ранг Гельмерта { $rank2 }/{ $n_helmert } cond { $condition }; sigma сдвига датума { $v12 } m; RMS невязки наблюдённое-минус-вычисленное в одну сторону { $rms_m } m ({ $v14 })
       *[other] lunar-llr-datum: архивных нормальных точек: { $used } (разобрано { $n_parsed }) от станций: { $station_counts } к массивам ретрорефлекторов: { $reflectors } за { $v5 } d; медианная измеренная прецизионность нормальной точки { $median } mm в одну сторону; информационный ранг отражателей { $rank }/{ $n }; ранг Гельмерта { $rank2 }/{ $n_helmert } cond { $condition }; sigma сдвига датума { $v12 } m; RMS невязки наблюдённое-минус-вычисленное в одну сторону { $rms_m } m ({ $v14 })
    }

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg должно быть конечным и лежать в [-90, 90), получено { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = у { $kind } { $name } неконечная координата

engine-e-lunar-llr-latitude-deg-is-outside-90 = широта { $kind } { $name } { $lat_deg } deg вне [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = не удалась сериализация отчёта lunar-llr-datum: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = шаг интегрирования должен делить шаг вывода

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not =
    { $n ->
        [one] { $n } должно быть конечным и неотрицательным
        [few] { $n } должно быть конечным и неотрицательным
        [many] { $n } должно быть конечным и неотрицательным
       *[other] { $n } должно быть конечным и неотрицательным
    }

engine-lunar-receiver-must-be-finite-and-positive =
    { $n ->
        [one] { $n } должно быть конечным и положительным
        [few] { $n } должно быть конечным и положительным
        [many] { $n } должно быть конечным и положительным
       *[other] { $n } должно быть конечным и положительным
    }

## src/lunar_service.rs

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: экспорт точки: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = лунные эфемериды { $path } покрывают { $until } s после своей эпохи, но горизонт сценария достигает { $last } s; сократите horizon_hours или получите более длинную дугу (экстраполяция табличных эфемерид отклоняется)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = для planetary_kernel_path нужен epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = Система OP на { $epoch } UTC (видимая нормаль к орбите Земли вокруг Луны, x вдоль её узла на лунном экваторе IAU); лунные GM, J2 и C22 в селенографической системе IAU, Земля и Солнце как третьи тела в положениях DE440 из { $spk_path }; метод Рунге — Кутты четвёртого порядка, шаг 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m должно быть конечным и положительным

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m должно быть конечным и положительным

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: для min_satellites = 3 нужно height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be =
    { $n ->
        [one] solution: min_satellites должно быть 3 или 4, получено { $n }
        [few] solution: min_satellites должно быть 3 или 4, получено { $n }
        [many] solution: min_satellites должно быть 3 или 4, получено { $n }
       *[other] solution: min_satellites должно быть 3 или 4, получено { $n }
    }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs должно быть от 1 до 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } должно быть конечным и положительным

engine-lunar-station-must-be-finite-and-not = { $name } должно быть конечным и неотрицательным

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } превышает { $MAX_WORK }; уменьшите n_trials, увеличьте шаг grid_lat_step_deg (или перечислите меньше точек) либо увеличьте t_step_s / сократите t_span_s

engine-e-lunar-station-kind-must-be-got = kind должно быть { $KIND }; получено { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: эфемериды { $path } покрывают { $until } s, но прогон достигает { $last } s (последняя эпоха плюс latency_s); сократите t_span_s

engine-e-lunar-station-no-case = { $KIND }: нет случая ({ $j }, { $i }, { $k })

engine-lunar-station-points-epochs-trials =
    { $n_epochs ->
        [one] точек: { $n_grid_points } · эпох: { $n_epochs } · испытаний: { $n_trials }
        [few] точек: { $n_grid_points } · эпох: { $n_epochs } · испытаний: { $n_trials }
        [many] точек: { $n_grid_points } · эпох: { $n_epochs } · испытаний: { $n_trials }
       *[other] точек: { $n_grid_points } · эпох: { $n_epochs } · испытаний: { $n_trials }
    }

engine-lunar-station-hpl-max = HPL макс. { $f }

engine-lunar-station-survey-latency-bits = съёмка { $survey_sigma_m } m · задержка { $latency_s } s · { $quantization_bits } bit

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: число строк и отсчётов должно быть от 2 до { $MAX_DEM_SIDE }, получено { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: высот { $heights_m } для сетки { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m должно быть положительным, получено { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m должно быть положительным, получено { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: не удаётся прочитать { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection должно быть south-polar-stereographic, получено { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type должно быть int16-le, получено { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: не удаётся прочитать { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: сетка превышает предел в { $MAX_DEM_SIDE } пикселей

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } занимает { $bytes } байт; для { $lines } x { $samples } int16 нужно { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: SHA-256 файла { $img } { $digest } не совпадает с { $image_sha256 } из дескриптора

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor должно быть положительным

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: не удаётся прочитать { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: нужно не менее 2 x 2 точек, возрастающий диапазон внутри [-90, 90] deg и 360 deg по долготе, а также конечные высоты

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } должно быть конечным и положительным, получено { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m должно быть конечным и неотрицательным, получено { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg должно быть не более 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m должно быть от 1 до 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: точка вне поля высот

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: для заданного горизонта нужен непустой источник

engine-e-lunar-terrain-terrain-stated-horizon = terrain: заданный горизонт: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: укажите dem_path или dem_tile_path, но не оба

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km должно быть конечным и положительным

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m должно быть конечным и положительным

engine-e-lunar-terrain-site-deg-deg = { $e } (точка { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = неизвестные часы { $other }; ожидается одно из optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks должно называть хотя бы один класс часов

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s должно быть конечным и положительным, получено { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s должно быть конечным и больше tau_min_s ({ $lo }), получено { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade должно быть ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = слагаемое { $name } короче сетки tau

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | часы { $clock } | 7-членная x_Σ(τ) по { $taus } точкам τ ({ $taus2 }–{ $taus3 } s) | пересечение τ { $crossover_tau_s } s (x { $crossover_x_s } s) | уровень системы координат { $frame_term_s } s | часы x(1 d) { $x_1day_ns } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: неизвестные часы { $other }; ожидается одно из optical-master, passive-h-maser, rafs, mini-rafs либо укажите device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: укажите либо clock, либо device_card, но не оба

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must =
    { $n ->
        [one] time_lab: steer_interval_s должно быть конечным и положительным, получено { $n }
        [few] time_lab: steer_interval_s должно быть конечным и положительным, получено { $n }
        [many] time_lab: steer_interval_s должно быть конечным и положительным, получено { $n }
       *[other] time_lab: steer_interval_s должно быть конечным и положительным, получено { $n }
    }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } должно быть конечным и неотрицательным, получено { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s должны быть положительными числами

engine-lunar-time-lab-station-height-not-modelled-exactly = высота станции моделируется неточно: однократная sigma ошибки высоты { $height_sigma_m } m смещает скорость на { $value } ns/day, применяется как линейный член с момента последней подстройки

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = время распространения света не сошлось до 1e-15 s за 30 итераций

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = для пути к ядру нужны вместе planetary_kernel_path, earth_orientation_kernel_path и moon_orientation_kernel_path

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = неизвестный датум { $other }: ожидается "anchor-first-station", "free-network" или "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = для расписания VLBI нужно не менее 2 станций, чтобы образовать базовую линию, получено { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = координаты маяка должны быть конечными

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = широта маяка { $lat } deg вне [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = расписание из { $v1 } эпох выходит за ограничение этого сценария в 20000 эпох; увеличьте step_min или уменьшите arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g должно быть положительным и конечным, получено { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = сериализация результата lunar-vlbi-fim: { $e }

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = датум не оставляет параметров для оценивания

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: ненаблюдаемы { $defect } из { $dim } направлений, поэтому sigma по координатам не сообщается; значение в наблюдаемом подпространстве ниже — это псевдообратная матрица, ограниченная { $rank } наблюдаемыми направлениями, и она НЕ является sigma станции

## src/main.rs

engine-main-error-validate-needs-scenario-path = ошибка: для --validate нужен путь к сценарию

engine-main-error-study-needs-suite-manifest = ошибка: для --study нужен путь к манифесту набора

engine-main-error-study-name-needs-value = ошибка: для --study-name нужно значение

engine-main-error-export-sp3-needs-path = ошибка: для --export-sp3 нужен путь

engine-main-error-export-omm-needs-path = ошибка: для --export-omm нужен путь

engine-main-error-export-oem-needs-path = ошибка: для --export-oem нужен путь

engine-main-error-animate-needs-format-svg = ошибка: для --animate нужен формат: svg, html, frames или all

engine-main-error-animate = ошибка: --animate: { $e }

engine-main-error-animate-fps-needs-whole = ошибка: для --animate-fps нужно целое число кадров в секунду

engine-main-error-export-needs-format-czml = ошибка: для --export нужен формат: czml, kml, geojson, stk, sigmf, all или list

engine-main-error-animate-duration-needs-length = ошибка: для --animate-duration нужна длительность в секундах

engine-main-error-import-route-needs-geojson = ошибка: для --import-route нужен путь к файлу GeoJSON

engine-main-error-eop-needs-finals2000a-file = ошибка: для --eop нужен путь к файлу finals2000A

engine-main-error-unknown-option = ошибка: неизвестный параметр '{ $other }'

engine-main-error-unexpected-argument-one-scenario = ошибка: неожиданный аргумент '{ $other }'; один файл сценария на запуск

engine-main-warning-animate-fps-and-animate = предупреждение: --animate-fps и --animate-duration ничего не делают без --animate

engine-main-error-animate-exports-one-scenario = ошибка: --animate экспортирует один прогон сценария; его нельзя сочетать с --validate или --study

engine-main-error-validate-lints-one-scenario = ошибка: --validate проверяет один сценарий; не передавайте дополнительно файл сценария

engine-main-error-cannot-read = ошибка: не удаётся прочитать { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind распознан; для этого kind не требуется ни одного поля (пустое тело запускает его эталонную конфигурацию), поэтому проверять больше нечего

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok: { $kind } — kind распознан, и выполнены все опубликованные записи об обязательных полях (число записей: { $n_required }); значения полей не проверяются
        [few] ok: { $kind } — kind распознан, и выполнены все опубликованные записи об обязательных полях (число записей: { $n_required }); значения полей не проверяются
        [many] ok: { $kind } — kind распознан, и выполнены все опубликованные записи об обязательных полях (число записей: { $n_required }); значения полей не проверяются
       *[other] ok: { $kind } — kind распознан, и выполнены все опубликованные записи об обязательных полях (число записей: { $n_required }); значения полей не проверяются
    }

engine-main-error-study-runs-suite-do = ошибка: --study запускает набор; не передавайте дополнительно файл отдельного сценария

engine-main-warning-study-name-is-ignored = предупреждение: --study-name игнорируется при --study; название исследования берётся из `title =` манифеста набора

engine-main-error-cannot-read-2 = ошибка: не удаётся прочитать { $path }: { $e }

engine-main-hint-kshana-example-lists-the = подсказка: `kshana example` перечисляет встроенные эталонные сценарии; `kshana example clock-holdover > clock-holdover.toml` записывает один из них

engine-main-error-cannot-read-3 = ошибка: не удаётся прочитать { $eop_file }: { $e }

engine-main-error-eop = ошибка: --eop: { $e }

engine-main-error-cannot-read-4 = ошибка: не удаётся прочитать { $route_file }: { $e }

engine-main-error-import-route = ошибка: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: не применимо: { $why }

engine-main-error-export = ошибка: --export: { $e }

engine-main-error-animate-2 = ошибка: --animate { $f }: { $e }

engine-main-error-export-2 = ошибка: экспорт { $fmt }: { $e }

engine-main-error-cannot-write = ошибка: не удаётся записать { $json_path }: { $e }

engine-main-error-cannot-write-2 = ошибка: не удаётся записать { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = ошибка: не удаётся построить отчёт: { $e }

engine-main-error-cannot-write-3 = ошибка: не удаётся записать { $html_path }: { $e }

engine-main-error-cannot-write-4 = ошибка: не удаётся записать { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = ошибка: не удаётся записать { $csv_path }: { $e }

engine-main-wrote-and = записано: { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } и { $csv_path }

engine-main-wrote-and-2 = записано: { $json_path }, { $svg_path }, { $html_path } и { $report_json_path }

engine-main-error-cannot-write-6 = ошибка: не удаётся записать { $target }: { $e }

engine-main-error-cannot-write-7 = ошибка: не удаётся записать { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = ошибка: сбой экспорта SP3: { $e }

engine-main-error-cannot-write-8 = ошибка: не удаётся записать { $omm_path }: { $e }

engine-main-error-omm-export-failed = ошибка: сбой экспорта OMM: { $e }

engine-main-error-cannot-write-9 = ошибка: не удаётся записать { $oem_path }: { $e }

engine-main-error-oem-export-failed = ошибка: сбой экспорта OEM: { $e }

engine-main-error-unexpected-argument-after-kinds = ошибка: неожиданный аргумент '{ $other }' после `kinds`; принимается только --json

engine-main-bundled-reference-scenarios-write-one =
    Встроенные эталонные сценарии ({ $v1 }). Запишите один из них в файл и запустите его:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (не встроен: { $name } — причину покажет `kshana example { $name }`)

engine-main-error-is-not-bundled-it = ошибка: '{ $name }' не встроен: он { $why }

engine-main-error-no-bundled-scenario-named = ошибка: нет встроенного сценария с именем '{ $name }'; `kshana example` перечисляет доступные: { $v1 }

engine-main-error-cannot-read-5 = ошибка: не удаётся прочитать { $suite_path }: { $e }

engine-main-wrote-and-3 = записано: { $json_path } и { $html_path }

engine-main-error-needs-value = ошибка: для { $a } нужно значение

engine-main-error-expected-mean-needs-number = ошибка: для --expected-mean нужно число

engine-main-error-unknown-imu-fit-option = ошибка: неизвестный параметр imu-fit { $x }

engine-main-error-imu-fit-needs-an = ошибка: для imu-fit нужен путь к журналу IMU

engine-main-error-needs-value-2 = ошибка: для { $args } нужно значение

engine-main-error-epoch = ошибка: --epoch: { $e }

engine-main-error-unknown-bench-export-option = ошибка: неизвестный параметр bench-export { $a }

engine-main-error-bench-export-needs-scenario = ошибка: для bench-export нужен путь к сценарию

engine-main-needs-value = для { $a } нужно значение

engine-main-site-takes-lat-lon-height = --site принимает lat,lon[,height_m], получено { $v }

engine-main-error-is-bytes-the-tle = ошибка: { $p } занимает { $m } байт; предел для TLE — { $cap } (4 MiB)

engine-main-error-cannot-read-6 = ошибка: не удаётся прочитать { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = неизвестный параметр sky { $a }

engine-e-main-svg-and-monte-carlo-are = --svg и --monte-carlo дают разные выходные данные; укажите один из них

engine-main-error-preset-needs-name =
    ошибка: для --preset нужно имя
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    ошибка: для --profile нужен файл
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = символов: { $r }, найдено кадров: { $r2 }; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }кадр в { $f }: FID { $f2 } TOI { $f3 } (метрика SB1 { $f4 }, ошибок SP: { $f5 }, ошибок SB1: { $f6 })

engine-main-not-checked = не проверено: { $r }

engine-main-wrote-frame-of-6000-symbols = записано { $out }: кадров по 6000 символов: { $frames }; подкадры со 2 по 4 являются заполнителями (без кодирования LDPC, без сообщения)

engine-main-error-cannot-write-10 = ошибка: не удаётся записать { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = неизвестная подкоманда lunanet-afs-check { $other }

engine-main-needs-pack-id = для { $cmd } нужен идентификатор пакета

engine-main-unknown-standards-pack-run-option = неизвестный параметр запуска standards-pack { $a }

engine-main-unknown-standards-pack-subcommand = неизвестная подкоманда standards-pack { $other }

engine-main-error-out-needs-value = ошибка: для --out нужно значение

engine-main-error-unknown-compliance-report-option = ошибка: неизвестный параметр compliance-report { $a }

engine-main-error-compliance-report-needs-at = ошибка: для compliance-report нужен хотя бы один файл результата .json

engine-main-runs-read-not-used-rows =
    { $n ->
        [one] прочитано прогонов: { $runs }, не использовано: { $unrecognised }; строки: подтверждено доказательствами: { $n }, частично: { $n2 }, не подтверждено: { $n3 }, вне области: { $n4 }
        [few] прочитано прогонов: { $runs }, не использовано: { $unrecognised }; строки: подтверждено доказательствами: { $n }, частично: { $n2 }, не подтверждено: { $n3 }, вне области: { $n4 }
        [many] прочитано прогонов: { $runs }, не использовано: { $unrecognised }; строки: подтверждено доказательствами: { $n }, частично: { $n2 }, не подтверждено: { $n3 }, вне области: { $n4 }
       *[other] прочитано прогонов: { $runs }, не использовано: { $unrecognised }; строки: подтверждено доказательствами: { $n }, частично: { $n2 }, не подтверждено: { $n3 }, вне области: { $n4 }
    }

engine-main-error-receiver-trust-needs-scenario = ошибка: для receiver-trust нужен путь к сценарию

engine-main-error-invalid-receiver-trust-scenario = ошибка: недопустимый сценарий receiver-trust: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = работа двигателя исчерпывает массу: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, работа={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = время перелёта должно быть положительным

engine-e-maneuver-collinear-endpoints-transfer-plane-is = коллинеарные конечные точки: плоскость перелёта не определена (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs предназначена для M >= 1; для M = 0 используйте lambert

engine-e-maneuver-no-revolution-transfer-the-time = перелёта с { $revs } витками нет: время перелёта меньше минимального

engine-e-maneuver-grid-step-days-must-be = grid_step_days должно быть положительным, получено { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = каждое окно должно идти вперёд (начало <= конец)

engine-e-maneuver-no-transfer-of-the-requested = в окнах нет перелёта запрошенного типа

engine-e-maneuver-the-optimum-left-the-feasible = оптимум вышел за допустимую область

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: ожидалось 3 значения

engine-e-mars-od-dss-epoch-is-not-2003 = эпоха DSS-{ $id } не 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = у DSS-{ $id } нет DXYZ

engine-e-mars-od-no-coordinates-for-dss = нет координат для DSS { $station }

engine-e-mars-od-no-ramps-for-dss = нет ramps для DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = таблица ramps не покрывает интервал

engine-e-mars-od-epoch-outside-the-integrated-span = эпоха { $et } вне интервала интегрирования

## src/mars_od.rs

engine-e-mars-od-normal-matrix-is-not-positive = нормальная матрица не является положительно определённой

engine-e-mars-od-no-points = нет точек

engine-e-mars-od-parameter-has-no-partial-on = у параметра нет частной производной на оставленных точках

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — пользователь { $user }, часы { $clock_class }: ошибка положения 3-D относительно истины (сошедшаяся RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = матрица парных сравнений пуста

engine-e-mcda-ahp-pairwise-matrix-is-not-square =
    { $n ->
        [one] матрица парных сравнений не квадратная (в строке { $i } элементов: { $row } из { $n })
        [few] матрица парных сравнений не квадратная (в строке { $i } элементов: { $row } из { $n })
        [many] матрица парных сравнений не квадратная (в строке { $i } элементов: { $row } из { $n })
       *[other] матрица парных сравнений не квадратная (в строке { $i } элементов: { $row } из { $n })
    }

engine-e-mcda-ahp-entry-must-be-finite-and = элемент a[{ $i }][{ $j }] = { $v } должен быть конечным и положительным

engine-e-mcda-ahp-diagonal-must-be = диагональ a[{ $i }][{ $i }] = { $row } должна быть равна 1

engine-e-mcda-ahp-entries-must-be-reciprocal = элементы a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } должны быть взаимно обратными (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = в верхней строке { $i } элементов: { $row }, ожидалось { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = верхний элемент ({ $i },{ $j }) = { $v } должен быть конечным и положительным

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: пустая матрица решений

engine-e-mcda-copras-copras-no-criteria = COPRAS: нет критериев

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: требуется хотя бы один критерий затрат (Min)

engine-e-mcda-copras-copras-alternative-has-values-but =
    { $n ->
        [one] COPRAS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [few] COPRAS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [many] COPRAS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
       *[other] COPRAS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
    }

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: значение { $x } альтернативы { $i } по критерию { $j } должно быть конечным и > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: пустой набор данных

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: нет критериев

engine-e-mcda-electre-electre-alternative-has-values-but =
    { $n ->
        [one] ELECTRE I: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [few] ELECTRE I: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [many] ELECTRE I: у альтернативы { $i } значений: { $row }, а критериев: { $n }
       *[other] ELECTRE I: у альтернативы { $i } значений: { $row }, а критериев: { $n }
    }

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: у альтернативы { $i } неконечное значение

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: пустая матрица решений

engine-e-mcda-moora-moora-no-criteria = MOORA: нет критериев

engine-e-mcda-moora-moora-alternative-has-values-but =
    { $n ->
        [one] MOORA: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [few] MOORA: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [many] MOORA: у альтернативы { $i } значений: { $row }, а критериев: { $n }
       *[other] MOORA: у альтернативы { $i } значений: { $row }, а критериев: { $n }
    }

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: у альтернативы { $i } неконечное значение

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: у критерия { $j } нулевая норма L2

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: пустая матрица решений

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: нет критериев

engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    { $n ->
        [one] PROMETHEE II: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [few] PROMETHEE II: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [many] PROMETHEE II: у альтернативы { $i } значений: { $row }, а критериев: { $n }
       *[other] PROMETHEE II: у альтернативы { $i } значений: { $row }, а критериев: { $n }
    }

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: у альтернативы { $i } неконечное значение

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: пустая матрица решений

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: нет критериев

engine-e-mcda-topsis-topsis-alternative-has-values-but =
    { $n ->
        [one] TOPSIS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [few] TOPSIS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [many] TOPSIS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
       *[other] TOPSIS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
    }

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: у альтернативы { $i } неконечное значение

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = у аддитивной полезности нет атрибутов

engine-e-mcda-utility-attributes-but-weights = атрибутов: { $attributes }, а весов: { $weights }

engine-e-mcda-utility-invalid-scaling-constant = недопустимая масштабирующая константа { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = масштабирующие константы в сумме дают ноль

engine-e-mcda-utility-attribute-values-expected-got = ожидалось значений атрибутов: { $attributes }, получено { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: пустая матрица решений

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: нет критериев

engine-e-mcda-vikor-vikor-alternative-has-values-but =
    { $n ->
        [one] VIKOR: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [few] VIKOR: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [many] VIKOR: у альтернативы { $i } значений: { $row }, а критериев: { $n }
       *[other] VIKOR: у альтернативы { $i } значений: { $row }, а критериев: { $n }
    }

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: у альтернативы { $i } неконечное значение

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: пустая матрица решений

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: нет критериев

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } должна лежать в [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    { $n ->
        [one] WASPAS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [few] WASPAS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [many] WASPAS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
       *[other] WASPAS: у альтернативы { $i } значений: { $row }, а критериев: { $n }
    }

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: значение { $x } альтернативы { $i } по критерию { $j } должно быть конечным и > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: пустая матрица решений

engine-e-mcda-wpm-wpm-no-criteria = WPM: нет критериев

engine-e-mcda-wpm-wpm-alternative-has-values-but =
    { $n ->
        [one] WPM: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [few] WPM: у альтернативы { $i } значений: { $row }, а критериев: { $n }
        [many] WPM: у альтернативы { $i } значений: { $row }, а критериев: { $n }
       *[other] WPM: у альтернативы { $i } значений: { $row }, а критериев: { $n }
    }

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: значение { $x } альтернативы { $i } по критерию { $j } должно быть конечным и > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = в матрице решений нет критериев

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = в матрице решений нет альтернатив

engine-e-mcda-wsm-criterion-has-an-invalid-weight = у критерия '{ $name }' недопустимый вес { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = веса критериев в сумме дают ноль

engine-e-mcda-wsm-alternative-has-values-but-there =
    { $n ->
        [one] у альтернативы '{ $name }' значений: { $values }, а критериев: { $n }
        [few] у альтернативы '{ $name }' значений: { $values }, а критериев: { $n }
        [many] у альтернативы '{ $name }' значений: { $values }, а критериев: { $n }
       *[other] у альтернативы '{ $name }' значений: { $values }, а критериев: { $n }
    }

engine-e-mcda-wsm-alternative-has-non-finite-value = у альтернативы '{ $name }' неконечное значение по критерию '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = не DAF: короче одной записи

engine-e-naif-kernel-not-daf-identification-word = не DAF: идентификационное слово { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = неподдерживаемый двоичный формат DAF { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = неправдоподобный заголовок DAF: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = адрес DAF { $addr } за концом файла

engine-e-naif-kernel-bad-daf-address-range = неверный диапазон адресов DAF { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = список сводок DAF не завершается

engine-e-naif-kernel-malformed-type-segment-rsize-intlen =
    { $n ->
        [one] некорректный сегмент типа 2: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }
        [few] некорректный сегмент типа 2: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }
        [many] некорректный сегмент типа 2: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }
       *[other] некорректный сегмент типа 2: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }
    }

engine-e-naif-kernel-type-segment-size-does-not = размер сегмента типа 2 не совпадает с его каталогом

engine-e-naif-kernel-epoch-outside-the-record = эпоха { $et } вне записи [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 =
    { $n ->
        [one] размер сегмента типа 1 не совпадает с его N = { $n }
        [few] размер сегмента типа 1 не совпадает с его N = { $n }
        [many] размер сегмента типа 1 не совпадает с его N = { $n }
       *[other] размер сегмента типа 1 не совпадает с его N = { $n }
    }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = некорректная запись типа 1: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = не SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = сводка SPK не соответствует ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = нет данных SPK типа 1/2 для тела { $target } на ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = сегмент SPK для { $target } задан в системе { $frame }, а не J2000

engine-e-naif-kernel-spk-centre-chain-does-not = цепочка центров SPK не доходит до барицентра

engine-e-naif-kernel-not-binary-pck = не двоичный PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = сводка PCK не соответствует ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = нет данных PCK типа 2 для системы { $body_frame } на ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = система PCK { $body_frame } задана относительно системы { $other }, которая не является J2000 или ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = неверное число { $s }

engine-e-navsignal-must-be-positive-number = { $s } должно быть положительным числом

engine-e-navsignal-modulation-expected-name-args-bpsk = модуляция { $label }: ожидалось NAME(args), например BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = модуляция { $label }: нет закрывающей скобки

engine-e-navsignal-modulation-is-not-one-of = модуляция { $label } не является ни BPSK(n), ни BOC(m,n), ни MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = незавершённая сущность в { $s }

engine-e-ndm-xml-bad-character-reference = неверная ссылка на символ &{ $ent };

engine-e-ndm-xml-unknown-entity = неизвестная сущность &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = незавершённая инструкция обработки

engine-e-ndm-xml-unterminated-comment = незавершённый комментарий

engine-e-ndm-xml-unterminated-declaration = незавершённое объявление

engine-e-ndm-xml-expected-an-element-at-byte = ожидался элемент в байте { $pos }

engine-e-ndm-xml-unterminated-start-tag = незавершённый начальный тег

engine-e-ndm-xml-attribute-without-value = атрибут без значения

engine-e-ndm-xml-unterminated-attribute-value = незавершённое значение атрибута

engine-e-ndm-xml-unterminated-end-tag = незавершённый конечный тег

engine-e-ndm-xml-unterminated-cdata = незавершённый CDATA

engine-e-ndm-xml-content-after-the-root-element = содержимое после корневого элемента

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } должно быть конечным и неотрицательным

engine-e-nma-budget-subframe-must-be-positive = subframe_s должно быть положительным

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps должно быть положительным

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed должно быть 0 или положительным

engine-e-nmea-synth-cli-unexpected-argument = неожиданный аргумент { $s }

engine-nmea-synth-cli-instructor-log = журнал инструктора: { $e }

engine-nmea-synth-cli-instructor-log-and = журнал инструктора: { $jp } и { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP-сервер слушает { $s }; ожидание клиентов: { $wait_clients }

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = ожидалось YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = дата или время вне диапазона (годы с 1980 по 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = такой календарной даты не существует

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } должно быть конечным числом

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s должно лежать в диапазоне от 1 до 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz должно быть 1, 2, 5 или 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = положение судна должно лежать в пределах 89 градусов от экватора

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn должно лежать в диапазоне от 0 до 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = пределы скорости поворота и ускорения судна должны быть положительными

engine-e-nmea-synth-config-give-at-least-one-waypoint = укажите хотя бы один [[waypoint]] или vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = путевая точка { $v1 } вне допустимого диапазона

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = у путевой точки { $v1 } speed_kn должно лежать в диапазоне от 0 до 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems должно называть хотя бы одну орбитальную группировку

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } не входит в { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s должно быть не меньше 1

engine-e-nmea-synth-config-event = событие { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s должно лежать внутри прогона

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s должно быть положительным; ramp_s и recovery_s не должны быть отрицательными

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s не должно превышать duration_s

engine-e-nmea-synth-config-does-not-apply-to-this =
    { $n ->
        [one] { $n } не применимо к этому виду
        [few] { $n } не применимо к этому виду
        [many] { $n } не применимо к этому виду
       *[other] { $n } не применимо к этому виду
    }

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz должно лежать в диапазоне от 20 до 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = требуется cn0_drop_db

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db должно лежать в диапазоне от 0 до 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db должно лежать в диапазоне от 0 до 30

engine-e-nmea-synth-config-final-offset-is-required = требуется final_offset_m

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m должно лежать в диапазоне от 0 до 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = увод ускорял бы ложный трек до { $need } m/s^2, что выше max_accel_mps2 = { $a }; увеличьте ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = укажите ровно одно из bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = требуется offset_s

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s должно быть ненулевым и в пределах суток

engine-e-nmea-synth-config-delay-is-required = требуется delay_s

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s должно лежать в диапазоне от 0 до 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = линия горизонта не описывает ни одного препятствия

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } завершилось

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = с T+{ $start_s } s в течение { $duration_s } s (нарастание в начале { $ramp_s } s, спад { $recovery_s } s)

engine-nmea-synth-log-jamming-received-n0-falls-by = подавление (jamming): принимаемое C/N0 падает до { $cn0_drop_db } dB (разброс по спутникам { $spread_db } dB); спутники пропадают, и решение теряется, когда пригодными остаются менее четырёх

engine-nmea-synth-log-towards-deg-true = в направлении { $b } deg истинных

engine-nmea-synth-log-towards-deg-true-deg-relative = в направлении { $t } deg истинных ({ $r } deg относительно курса в начале, затем удерживается)

engine-nmea-synth-log-natural-degradation-the-sky-closes = естественная деградация: небо закрывается за заданной линией горизонта ({ $e }); спутники за ней остаются в списке без SNR и не используются, C/N0 остальных не меняется, и ничего не подделано

engine-nmea-synth-log-instructor-log = ЖУРНАЛ ИНСТРУКТОРА: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Примечание тренера: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Начало { $start_utc }   длительность { $duration_s } s   начальное значение (seed) { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }ПИКИ  истинные: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   сообщаемые: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: неизвестная орбитальная группировка { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Допуск ниже уровня шума чтения ранга f64 { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): эквивалентный ему порог собственных значений rel_tol^2 = { $v1 } лежит ниже шума округления матрицы Грама, поэтому лишние направления — арифметический остаток, а не наблюдаемость.

engine-observability-gramian-rank-clamped-from-the-singular =
    { $n_cols ->
        [one] ранг ограничен с числа сингулярных значений { $counted } до min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } при rel_tol { $rel_tol }: матрица { $n_rows }x{ $n_cols } не может иметь ранг { $counted }.{ $floor_note }
        [few] ранг ограничен с числа сингулярных значений { $counted } до min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } при rel_tol { $rel_tol }: матрица { $n_rows }x{ $n_cols } не может иметь ранг { $counted }.{ $floor_note }
        [many] ранг ограничен с числа сингулярных значений { $counted } до min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } при rel_tol { $rel_tol }: матрица { $n_rows }x{ $n_cols } не может иметь ранг { $counted }.{ $floor_note }
       *[other] ранг ограничен с числа сингулярных значений { $counted } до min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } при rel_tol { $rel_tol }: матрица { $n_rows }x{ $n_cols } не может иметь ранг { $counted }.{ $floor_note }
    }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } байт не составляют целое число 36-байтных записей

engine-e-odf-record-precedes-any-group-header = запись { $v1 } предшествует любому заголовку группы

engine-e-odf-no-orbit-data-group = нет группы данных орбиты

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } не является ключевым словом { $name }

engine-e-odm-without = { $name } без { $k }

engine-e-odm-needs-exactly-one-of = для { $name } нужно ровно одно из { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION и MESSAGE_ID — ключевые слова заголовка версии 3.0 (версия { $version })

engine-e-odm-unexpected-line = неожиданная строка { $b }

engine-e-odm-unknown-keyword = неизвестное ключевое слово { $k }

engine-e-odm-block-repeated-or-out-of = блок { $block } повторён или идёт не по порядку в { $key }

engine-e-odm-repeated = { $key } повторён

engine-e-odm-comments-after-the-last-keyword = комментарии после последнего ключевого слова

engine-e-odm-given-twice = { $b } указан дважды

engine-e-odm-opm-without-metadata = OPM без метаданных

engine-e-odm-opm-without-state-vector = OPM без вектора состояния

engine-e-odm-omm-without-metadata = OMM без метаданных

engine-e-odm-omm-without-mean-elements = OMM без средних элементов

engine-e-odm-is-not-keyword-of-the = { $k } не является ключевым словом блока { $kind }

engine-e-odm-block-without = блок { $kind } без { $k }

engine-e-odm-block-with-data-lines = блок { $kind } со строками данных

engine-e-odm-line-has-values-expected =
    { $n ->
        [one] в строке { $l } блока { $kind } значений: { $l2 }, ожидалось { $n }
        [few] в строке { $l } блока { $kind } значений: { $l2 }, ожидалось { $n }
        [many] в строке { $l } блока { $kind } значений: { $l2 }, ожидалось { $n }
       *[other] в строке { $l } блока { $kind } значений: { $l2 }, ожидалось { $n }
    }

engine-e-odm-is-not-an-ocm-metadata = { $k } не является ключевым словом метаданных OCM

engine-e-odm-ocm-metadata-without = метаданные OCM без { $k }

engine-e-odm-block-repeated = блок { $kind } повторён

engine-e-odm-inside-block = { $t } внутри блока

engine-e-odm-unsupported-ocm-block = неподдерживаемый блок OCM { $tag }

engine-odm-outside-block = { $t } вне блока

engine-e-odm-closes-block = { $t } закрывает блок { $want }

engine-e-odm-unexpected-line-2 = неожиданная строка { $t }

engine-e-odm-outside-block = { $k } вне блока

engine-e-odm-unterminated-block = незавершённый блок

## src/oem.rs

engine-e-oem-epoch-missing-date-time-separator = в эпохе нет разделителя даты и времени 'T': { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = неподдерживаемая дата эпохи OEM '{ $date }' (ожидается yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = неподдерживаемое время эпохи OEM '{ $time }' (ожидается HH:MM:SS)

engine-e-oem-bad-epoch-year = неверный год эпохи: { $d }

engine-e-oem-bad-epoch-month = неверный месяц эпохи: { $d }

engine-e-oem-bad-epoch-day = неверный день эпохи: { $d }

engine-e-oem-bad-epoch-hour = неверный час эпохи: { $t }

engine-e-oem-bad-epoch-minute = неверная минута эпохи: { $t }

engine-e-oem-bad-epoch-second = неверная секунда эпохи: { $t }

engine-e-oem-oem-epoch-field-out-of = поле эпохи OEM вне диапазона: { $s }

engine-e-oem-unexpected-oem-header-line = неожиданная строка заголовка OEM: { $line }

engine-e-oem-expected-meta-start-found = ожидалось META_START, найдено: { $line }

engine-e-oem-unexpected-oem-metadata-line = неожиданная строка метаданных OEM: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = в метаданных сегмента OEM нет META_STOP

engine-e-oem-oem-metadata-missing-object-name = в метаданных OEM нет OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = в метаданных OEM нет OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = в метаданных OEM нет CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = в метаданных OEM нет REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = в метаданных OEM нет TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = в метаданных OEM нет START_TIME

engine-e-oem-oem-metadata-missing-stop-time = в метаданных OEM нет STOP_TIME

engine-e-oem-oem-data-line-needs-position =
    { $n ->
        [one] строке данных OEM нужны компоненты положения и скорости (6) или ещё и ускорения (9), получено { $n }: { $line }
        [few] строке данных OEM нужны компоненты положения и скорости (6) или ещё и ускорения (9), получено { $n }: { $line }
        [many] строке данных OEM нужны компоненты положения и скорости (6) или ещё и ускорения (9), получено { $n }: { $line }
       *[other] строке данных OEM нужны компоненты положения и скорости (6) или ещё и ускорения (9), получено { $n }: { $line }
    }

engine-e-oem-non-numeric-oem-state-value = нечисловое значение состояния OEM '{ $t }' в: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = в OEM нет заголовка CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = в OEM нет заголовка CREATION_DATE

engine-e-oem-oem-missing-originator-header = в OEM нет заголовка ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM не содержит сегментов

engine-e-oem-no-covariance-start-block = нет блока COVARIANCE_START

engine-e-oem-no-covariance-stop = нет COVARIANCE_STOP

engine-e-oem-bad-covariance-value = неверное значение ковариации '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = ожидалось 21 значение ковариации, найдено { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = для экспорта OMM нужны полные TLE (строка 1 + строка 2); в этом блоке их нет

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in =
    { $n ->
        [one] { $n } должно лежать в [0, 1]
        [few] { $n } должно лежать в [0, 1]
        [many] { $n } должно лежать в [0, 1]
       *[other] { $n } должно лежать в [0, 1]
    }

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg должно лежать в [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave должно быть "plane" или "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction должно быть "downlink" или "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = записи availability_targets_pct должны лежать в (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h должно быть не более 8760 (один год)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: шагов { $steps } больше, чем { $MAX_STEPS }, которые несёт результат; увеличьте step_s или сократите duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = неизвестный класс часов "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = у каждой площадки должно быть имя

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = площадка { $name }: широта/долгота вне диапазона

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = площадка { $name }: altitude_m должно лежать в [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm при угле места { $elevation_deg } deg, запас { $margin0 } dB до учёта атмосферы; лучшая площадка { $scn } { $v5 } %; сеть из площадок: { $order }, { $last } % при независимой / { $last2 } % при коррелированной погоде (MODELLED, консультативный)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = блок RINEX разобран, но не содержит поддерживаемых эфемерид

## src/orbit.rs

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg должно лежать в [-90, 90], и все поля должны быть конечными

engine-e-orbit-no-satellites-to-export = нет спутников для экспорта

engine-e-orbit-time-step-must-be-positive = time.step_s должно быть положительным для экспорта SP3

engine-e-orbit-time-step-must-be-positive-2 = time.step_s должно быть положительным для экспорта OEM

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } должно быть положительным; получено { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s должно быть конечным и неотрицательным

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate должно быть конечным и неотрицательным

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = минимальный угол места спуфера должен лежать в [0, 90) градусов

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns перекрёстной проверки должно быть конечным и неотрицательным

engine-orbital-timing-the-in-plane-neighbour-degrees = сосед в той же плоскости, впереди на { $v1 } градусов, находится вне зоны охвата одного спуфера ({ $v2 } градусов в поперечнике)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = сосед в той же плоскости, впереди на { $v1 } градусов, может оказаться в зоне охвата того же спуфера ({ $v2 } градусов в поперечнике), поэтому обе пары часов могут быть сдвинуты вместе

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = не указан входной файл

engine-e-osnma-cli-max-time-error-has-no = --max-time-error не действует без --reference-time

engine-e-osnma-cli-not-number = не число: { $s }

engine-e-osnma-cli-public-key-must-be-id = открытый ключ должен быть в виде ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = тип открытого ключа должен быть p256 или p521

engine-e-osnma-cli-unknown-format = неизвестный формат { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } не является текстом; для потока UBX используйте --format ubx

engine-e-osnma-cli-vector-csv-needs-start-gst = для векторного CSV нужен --start-gst или имя файла с датой

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    ошибка: не удаётся прочитать { $input }: { $e }

engine-osnma-cli-galileo-osnma-verification =
    Проверка Galileo OSNMA
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = вход: { $input } (страниц: { $pages })

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: кадров { $frames }; декодировано страниц I/NAV: { $inav_pages }, привязано ко времени: { $pages } (неверный CRC: { $bad_crc }, не удалось привязать: { $unstamped }, конфликтов времени: { $time_conflicts })

engine-osnma-cli-overall-nma-status = итог: { $status_word }   статус NMA: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ТРЕВОГА: получено проверенное сообщение-тревога OSNMA. Прекратите использовать данные OSNMA; ничто не сообщается как аутентифицированное.

engine-osnma-cli-freshness-not-enforced-no-reference = актуальность: НЕ контролируется. Опорное время не задано, поэтому времена подкадров берутся из входных данных, и повтор старых данных прошёл бы аутентификацию.

engine-osnma-cli-freshness-sub-frames-within-of = актуальность: используются подкадры в пределах { $max_err } s от опорного времени { $v2 }; отложено: { $set_aside }. Опорное время — один момент.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }спутник  статус          аутентифицировано  сбой  ожидает  отброшено  последняя аутентификация

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }эпоха (подкадр метки)      tx   данные  adkd  ctr  результат

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = строка { $v1 }: ожидалось 3 поля

engine-e-osnma-input-line-bad-svid = строка { $v1 }: неверный SVID

engine-e-osnma-input-line-bad-bit-count = строка { $v1 }: неверное число бит

engine-e-osnma-input-line-data-is-not-hex = строка { $v1 }: данные не в шестнадцатеричном виде

engine-e-osnma-input-line-bit-count-does-not = строка { $v1 }: число бит не соответствует данным

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = допуск по времени должен быть меньше одного подкадра ({ $SUBFRAME_S } s), получено { $t } s

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = рефракция ITU-R P.834 определена для высот станции от 0 до 3 km; получено { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s и step_s должны быть положительными

engine-e-passes-station-lat-deg-must-be = station_lat_deg должно лежать в [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg должно лежать в [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours должно быть конечным и положительным

engine-e-passes-step-must-be-finite-and = step_s должно быть конечным и положительным

engine-passes-passes-pass-es-of-km = passes: пролётов: { $passes } на орбите { $altitude_km } km / { $inclination_deg }° над ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° за { $duration_hours } h; суммарный доступ { $total_access_s } s (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = короткая запись { $record }: { $line }

engine-e-precise-products-bad-number-in = неверное число { $s } в { $line }

engine-e-precise-products-bad-field-in = неверное поле { $s } в { $line }

engine-e-precise-products-bad-antex-epoch = неверная эпоха ANTEX { $s }

engine-e-precise-products-bad-offset = неверное смещение { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = у поставщика эфемерид нет геоцентрического { $name } на JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| RMS ошибки 3D { $rms } m (макс. { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS после подгонки { $mean_postfit_rms_m } m

engine-pvt-single-point-positioning-3d-error = Одноточечное позиционирование — ошибка 3D относительно съёмной координаты (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Одноточечное позиционирование — RMS остатков после подгонки (среднее { $mean_postfit_rms_m } m)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = для методов доступа к массивам RunOutput нужен NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } не является числовым массивом (списком чисел или списков чисел одинаковой длины)

engine-e-python-is-not-non-empty-list = { $path } не является непустым списком записей

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } байт, svg={ $svg } байт, csv={ $value } байт, summary={ $value2 })

engine-e-python-and-must-be-the-same = i и q должны быть одной длины ({ $i } против { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: не захвачен (статистика { $statistic } < порог { $threshold })

engine-python-design-prn-channels-at-most = каналов (design, PRN): { $designs }; не более 256 на один перебор

engine-python-not-acquired-statistic-threshold = { $code }: не захвачен (статистика { $statistic } < порог { $threshold })

engine-e-python-runs-needs-label = для runs[{ $i }] нужен `label`

engine-e-python-runs-needs-result = для runs[{ $i }] нужен `result`

engine-e-python-must-be-between-and-32 = { $name } должно быть от 0 до 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | начальное значение (seed) { $seed } | v{ $engine_version } | квантовое решение выигрывает по показателям качества: { $value }/{ $foms } | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } по { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = неизвестный baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = неизвестный candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = taus/значения ADEV должны быть конечными и > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | кандидат { $candidate_source } | holdover по времени { $timing_holdover_s }s против { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | инерциальный { $inertial_holdover_s }s против { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | выбег устойчивости { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = файл часов RINEX объявляет систему времени { $id }, неизвестную этому средству чтения (известные: { $known_clock_time_systems }); файл отклоняется, а не читается как время GPS

engine-e-realdata-clk-rinex-clock-file-has-satellite = в файле часов RINEX указана спутниковая система { $other } и не объявлен TIME SYSTEM ID; система времени его эпох не угадывается, файл отклоняется

engine-e-realdata-clk-rinex-clock-files-declare-different = файлы часов RINEX объявляют разные системы времени ({ $s } и { $ts }); объединять их на одной оси времени отказано

engine-e-realdata-clk-no-as-or-ar-records = нет записей AS или AR для { $id }

engine-e-realdata-clk-short-circular-row = короткая строка Circular T: { $t }

engine-e-realdata-clk-bad-value-in = неверное значение { $s } в { $t }

engine-e-realdata-clk-no-section-mjd-header-found = заголовок MJD раздела 1 не найден

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = незавершённый закрывающий тег

engine-e-realdata-ion-sdr-unbalanced-closing-tag = несбалансированный закрывающий тег

engine-e-realdata-ion-sdr-unterminated-tag = незавершённый тег

engine-e-realdata-ion-sdr-attribute-value-missing = отсутствует значение атрибута

engine-e-realdata-ion-sdr-element-outside-the-document = элемент вне документа

engine-e-realdata-ion-sdr-text-outside-the-document = текст вне документа

engine-e-realdata-ion-sdr-element-left-open = незакрытых элементов: { $stack }

engine-e-realdata-ion-sdr-expected-one-root-element-found =
    { $n ->
        [one] ожидался один корневой элемент, найдено { $n }
        [few] ожидался один корневой элемент, найдено { $n }
        [many] ожидался один корневой элемент, найдено { $n }
       *[other] ожидался один корневой элемент, найдено { $n }
    }

engine-e-realdata-ion-sdr-unknown-frequency-format = неизвестный формат частоты { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = неподдерживаемая кодировка { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = потоков: { $streams }; читаются только файлы с одним потоком

engine-e-realdata-ion-sdr-block-of-cycles-with-header = блок из { $cycles } циклов с заголовком или окончанием повторяется; читается только один блок на весь файл

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = фрагмент из { $words_per_chunk } слов по { $word_bytes } байт

engine-e-realdata-ion-sdr-unsupported-sample-format = неподдерживаемый формат отсчётов { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = квантование { $quantization } в { $packed_bits } упакованных битах на отсчёт

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = частота дискретизации { $sample_rate_hz } Hz не кратна целому числу коэффициента { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = во фрагменте нет ни одного целого блока (lump)

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = запрошены отсчёты { $start }..{ $v1 }, в файле их { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = нечитаемая версия CRD { $f }

engine-realdata-llr-crd-crd-format-version-is-not = версия формата CRD { $v } не поддерживается (порядок полей записи 11, на который опирается это средство чтения, общий только у версий 1 и 2)

engine-realdata-llr-crd-unreadable-station-id = нечитаемый идентификатор станции { $f }

engine-realdata-llr-crd-unreadable-time-scale = нечитаемая шкала времени { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = шкала времени эпох CRD { $time_scale } не входит в три, которые спецификация формата допускает для аналитиков (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); читать её как UTC отказано

engine-realdata-llr-crd-unreadable-h4-field = нечитаемое поле h4 { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = нечитаемое поле { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = нечитаемое событие эпохи { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = нефизичное время пролёта { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = не удаётся прочитать каталог нормальных точек { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = в { $dir } нет файлов нормальных точек *.npt — этот сценарий читает реальные архивные измерения и без них не запустится

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = неверное число '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = у DEM нулевая размерность

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = кодировка { $encoding }: пакет LuGRE задан в дополнительном коде

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } байт: короче заголовка IQS

engine-e-realdata-lugre-not-an-iqs-frame = не кадр IQS: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = частота дискретизации: метаданные { $sample_rate_hz } Hz, заголовок { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = квантование: метаданные { $quantization } бит, заголовок { $quant_bits } бит

engine-realdata-lugre-centre-frequency-metadata-hz-header = центральная частота: метаданные { $center_freq_hz } Hz, заголовок { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = промежуточная частота: метаданные { $translated_freq_hz } Hz, заголовок { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives =
    { $n_samples ->
        [one] число отсчётов: по раскладке метаданных { $layout }, в заголовке { $n_samples }
        [few] число отсчётов: по раскладке метаданных { $layout }, в заголовке { $n_samples }
        [many] число отсчётов: по раскладке метаданных { $layout }, в заголовке { $n_samples }
       *[other] число отсчётов: по раскладке метаданных { $layout }, в заголовке { $n_samples }
    }

engine-realdata-lugre-header-footer-metadata-bytes-format = заголовок/окончание: метаданные { $header_bytes }/{ $footer_bytes } байт, формат { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = длина файла { $file_len } не равна заголовку + { $value } байт отсчётов + окончанию

engine-realdata-lugre-field-missing = поле { $key } отсутствует

engine-e-realdata-lugre-field-unreadable = поле { $key } нечитаемо

engine-realdata-lugre-raw-line = строка RAW { $v1 }: { $e }

engine-realdata-lugre-acq-line = строка ACQ { $v1 }: { $e }

engine-realdata-lugre-nav-line = строка NAV { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = строка CLK { $v1 }: нечитаема

engine-e-realdata-lugre-clk-row-columns-expected = строка CLK { $v1 }: столбцов { $v }, ожидалось 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = разбор JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = ожидался объект JSON на верхнем уровне

engine-e-realdata-yunnan-missing-recordtime-array = отсутствует массив recordTime

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = не удаётся прочитать файл EOP { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s должно быть конечным и неотрицательным, получено { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = не удаётся прочитать файл EOP более поздней редакции { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = ПУСТО, и это намеренно: для строки «прогноз против окончательного» нужна эпоха выпуска с ПОЛНЫМ окном подгонки в { $window_days } дней позади и опубликованным окончательным Bulletin B на целевую эпоху. Действующие входные данные ({ $eop_source }) не дают ни одной эпохи, удовлетворяющей обоим условиям. Сократите `operational_window_days` или предоставьте более длинный реальный ряд finals2000A — строки для заполнения таблицы не изготавливаются.

engine-realtime-frame-eop-measured-over-the-real-series = Измерено на действующем реальном ряду ({ $eop_source }). Каждая строка — настоящая ошибка прогноза: прогноз на T+h, построенный по оперативным строкам Bulletin A не позже T, оценён относительно ПОЗДНЕЕ ОПУБЛИКОВАННОГО окончательного Bulletin B на T+h. Персистентность оценивается на том же наборе эпох относительно тех же окончательных значений, поэтому два столбца различаются предиктором и ничем другим. Значение `improvement_factor` ниже 1 означает, что оперативный предиктор на этом горизонте ХУЖЕ персистентности, и так и сообщается.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Измерено на настоящей паре из двух редакций: выпущенная редакция ({ $eop_source }) содержит реальные прогнозы Bulletin A за пределами собственной границы данных, а архивная более поздняя редакция ({ $c }) содержит окончательные значения Bulletin B, которые эти даты в итоге получили. Три прогноза оцениваются относительно этого окончательного значения: сам архивный прогноз Bulletin A, подгонка этого пакета (crate) в оперативном стиле по выпущенной редакции и персистентность на границе данных.

engine-realtime-frame-eop-empty-and-deliberately-so-later = ПУСТО, и это намеренно: более поздняя редакция предоставлена ({ $c }), но ни одна дата не представлена одновременно как PREDICTION Bulletin A в выпущенном файле ({ $eop_source }) и как ОКОНЧАТЕЛЬНОЕ значение Bulletin B в более позднем ни на одном запрошенном горизонте. Строки не синтезируются.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = ПУСТО, и это намеренно. Для оценки НАСТОЯЩЕГО АРХИВНОГО прогноза нужны две редакции одного продукта finals2000A; в этом прогоне предоставлена одна ({ $eop_source }). Репозиторий не содержит архивной более ранней редакции, и она НЕ изготавливается возмущением имеющейся: синтезированный архив превратил бы каждое число этой таблицы в измерение возмущения. Предоставьте реальную архивную более позднюю редакцию через `eop_finals2000a_later`, чтобы заполнить таблицу. До тех пор настоящие ошибки «прогноз против окончательного», которые несёт этот отчёт, находятся в `table5_operational_vs_persistence`, где прогноз принадлежит этому пакету (crate), а истина — позднее опубликованное окончательное значение Bulletin B.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Таблица 1: постобработка { $c } m ({ $c2 } ms UT1) ↔ реальное время { $c3 } m ({ $c4 } ms UT1) | Таблица 2: окончательный нижний уровень { $floor } ms → { $far }-дневный { $far2 } ms | суммарный бюджет { $total_m } m ({ $total_time_ns } ns) | плечо L19 + реальные данные L18 (проверено), ковариация OD (смоделировано)

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Измерено на настоящей паре из двух редакций: ПРОГНОЗ UT1 Bulletin A из выпущенного файла ({ $eop_source }) сопоставлен с итоговым ОКОНЧАТЕЛЬНЫМ значением Bulletin B из архивной более поздней редакции ({ $c }) на горизонтах: { $predicted_vs_final }.

engine-realtime-frame-eop-empty-and-deliberately-so-an = ПУСТО, и это намеренно: архивная более поздняя редакция предоставлена ({ $c }), но ни одна дата не представлена одновременно как PREDICTION Bulletin A в выпущенном файле ({ $eop_source }) и как ОКОНЧАТЕЛЬНОЕ значение Bulletin B в более позднем ни на одном запрошенном горизонте, поэтому невязки «прогноз против окончательного» для отчёта нет. Строки не синтезируются.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = ПУСТО, и это намеренно: для невязки «прогноз против окончательного» нужны ДВЕ редакции одного продукта finals2000A. В этом прогоне предоставлена одна ({ $eop_source }). Её строки прогноза Bulletin A относятся к будущим датам, у которых ещё нет окончательного Bulletin B, поэтому невязки для измерения не существует, и здесь она не выдумывается. Предоставьте архивную более позднюю редакцию через `eop_finals2000a_later`, чтобы заполнить эту таблицу. До тех пор многодневный рост, сообщаемый в `table2_error_vs_horizon`, — это предиктор ПЕРСИСТЕНТНОСТИ, оценённый по реальным окончательным значениям: реальная измеренная ошибка, но смоделированный предиктор, а не невязка прогноза IERS Bulletin A.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = для оценки судна нужно [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = фрагмент занимает { $excerpt } байт; предел { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = фрагмент содержит более { $MAX_EXCERPT_EPOCHS } эпох; сократите его

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = фрагмент заканчивается внутри окна калибровки { $calibration_s } s ({ $epochs } эпох): оценивать нечего

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = в журнале UBX нет эпох с меткой UTC

engine-e-receiver-trust-calibration-no-scenario-json-under = в { $root } нет scenario.json

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: отложенная чистая Pfa <= { $B1_MAX_PFA } (откалибровано: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } должно быть конечным и > 0 (получено { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel должно быть конечным и >= 0 (получено { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used должно быть не меньше 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg должно лежать в [0, 90] (получено { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg должно лежать в (0, 360] (получено { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points должно лежать в [0, 100] (получено { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio должно быть конечным и > 1 (получено { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor должно лежать в (0, 100] (получено { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) ниже degraded_min оценки ({ $degraded_min }): одна лишь геометрия могла бы достичь полосы недоверия

## src/receiver_trust/geometry.rs

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: вычет за геометрию классифицирован как несогласованность

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: сообщается, но не оценивается (геометрия не является плохой)

engine-receiver-trust-geometry-not-scored-the-score-deducts = не оценивается (оценка снижается только при HDOP выше { $hdop_max }, PDOP выше { $pdop_max } или при числе спутников ниже { $min_used })

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] получено по { $n } зарегистрированному спутнику
        [few] получено по { $n } зарегистрированным спутникам
        [many] получено по { $n } зарегистрированным спутникам
       *[other] получено по { $n } зарегистрированного спутника
    }

engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] как сообщает приёмник, использован { $n } спутник
        [few] как сообщает приёмник, использовано { $n } спутника
        [many] как сообщает приёмник, использовано { $n } спутников
       *[other] как сообщает приёмник, использовано { $n } спутника
    }

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = заявленный HDOP { $fmt_dop } расходится с HDOP { $fmt_dop2 }, полученным по заявленному небосводу, сверх допуска

engine-receiver-trust-geometry-satellites-in-view-but-not = спутники в зоне видимости, но не отслеживаемые ({ $g } из { $in_view } при угле места от { $low_elev_deg } deg): сигнальная обстановка, а не геометрия

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } спутник, меньше { $min_used }
        [few] { $n } спутника, меньше { $min_used }
        [many] { $n } спутников, меньше { $min_used }
       *[other] { $n } спутника, меньше { $min_used }
    }

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } выше { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } выше { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = спутники за заявленной линией горизонта: { $m }

engine-receiver-trust-geometry-every-satellite-in-one-half = все спутники в одной половине неба (разрыв { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = снижено геометрией: { $parts } ({ $from }); не несогласованность

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = в журнале нет эпох: ничего не удалось прочитать как { $name } (пропущено записей как повреждённых или не поддающихся разбору: { $skipped_records }); проверьте параметр формата

engine-receiver-trust-ingest-gps-week-tow = неделя GPS { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = неделя GPS { $w } TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (даты нет в журнале)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } должно быть конечным и >= 0 (получено { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s должно быть больше 0

engine-e-receiver-trust-live-invalid-session = недопустимый сеанс: { $e }

engine-receiver-trust-live-no-score-could-be-produced = оценку получить не удалось: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = не удалось прочитать ни одной записи synchro или pvt GNSS-SDR (пропущено строк: { $skipped }); формат строк описан в integrations/gnss-sdr/README.md

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = файл IMU пуст

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: нет столбца `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: нет столбца `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = в файле IMU нет ни одного читаемого отсчёта

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = ось должна быть 0, 1 или 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean должно быть конечным

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] в журнале { $n } отсчёт; для подгонки девиации Аллана нужно не менее { $MIN_SAMPLES }
        [few] в журнале { $n } отсчёта; для подгонки девиации Аллана нужно не менее { $MIN_SAMPLES }
        [many] в журнале { $n } отсчётов; для подгонки девиации Аллана нужно не менее { $MIN_SAMPLES }
       *[other] в журнале { $n } отсчёта; для подгонки девиации Аллана нужно не менее { $MIN_SAMPLES }
    }

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = время в журнале не возрастает

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not =
    { $n ->
        [one] интервал между отсчётами неравномерен ({ $uneven } из { $n } интервала отличаются более чем на 25 %): сначала передискретизируйте журнал
        [few] интервал между отсчётами неравномерен ({ $uneven } из { $n } интервалов отличаются более чем на 25 %): сначала передискретизируйте журнал
        [many] интервал между отсчётами неравномерен ({ $uneven } из { $n } интервалов отличаются более чем на 25 %): сначала передискретизируйте журнал
       *[other] интервал между отсчётами неравномерен ({ $uneven } из { $n } интервала отличаются более чем на 25 %): сначала передискретизируйте журнал
    }

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = журнал слишком короток для построения кривой Аллана

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = начальный наклон кривой { $name } равен { $v }, а не около -0.5: белый шум не преобладает (датчик неподвижен?), поэтому его коэффициент шума ненадёжен

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = кривая { $name } слишком коротка для проверки наклона

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = неделя GPS { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = не удалось прочитать ни одной записи BESTPOS, RANGE или RXSTATUS (пропущено записей: { $skipped })

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = не найдено ни одного корректного кадра RTCM 3 (кандидатов, не прошедших проверку CRC: { $skipped })

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } должно быть конечным и > 0 (получено { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard должно лежать в (0, 1) (получено { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac должно лежать в [0, 1] (получено { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } должно лежать в (0, 1) (получено { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats должно быть не менее 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s должно быть не менее 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = конфигурация мониторов: неизвестный профиль "{ $other }"; известные: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = конфигурация мониторов: { $name } должно быть конечным и > 0 (получено { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = конфигурация мониторов: jam_ind_threshold должно быть конечным

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = конфигурация мониторов: mask_deg должно лежать в [-90, 90) (получено { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = конфигурация мониторов: raim_pfa должно лежать в (0, 1) (получено { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = конфигурация мониторов: cn0_min_sats должно быть не менее 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = конфигурация мониторов: sats_lost должно быть не менее 1

engine-receiver-trust-monitors-the-receiver-own-set-against = собственный набор { $self_report_source } приёмника в сопоставлении с мониторами Kshana; ни один из них не является истиной, согласие не означает валидации

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = во временной шкале приёмника есть неконечное время эпохи

engine-e-receiver-trust-monitors-the-log-is-shorter-than = журнал короче окна калибровки: эпох (шт.) до { $cal_s } s: { $calibration_epochs } (журнал охватывает { $span } s); для построения базовой линии нужно не менее 3

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } должно лежать в ({ $lo }, { $hi }] (получено { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } применимо только к kind = "vessel" (kind равно "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = не удаётся прочитать { $path }: в сборке WebAssembly нет файловой системы; передайте файл встроенным в `text` или `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` не является корректным стандартным base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: укажите одно из `path`, `text` или `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: укажите только одно из `path`, `text` или `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } должно быть положительным числом, получено { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = событие { $label }: onset_s должно быть неотрицательным числом

engine-e-receiver-trust-scenario-event-end-must-be-after = событие { $label }: end_s должно быть позже onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg и time_offset_s должны быть конечными

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = доверие сохранялось на всём протяжении: ни один монитор не сработал за { $after_cal } эпох после калибровки

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = первая тревога в { $t } s; без доверия: { $untrusted_epochs }, с пониженным доверием: { $degraded_epochs } из { $after_cal } эпох после калибровки

engine-receiver-trust-scenario-of-stated-events-detected-within = { $events_detected } из { $events_evaluable } заявленных событий обнаружено в пределах { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = { $predictions_agreeing } из { $predictions_evaluable } прогнозов C/N0 в пределах { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = оценка доверия: минимум { $min }, итог { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = сценарий { $r } | receiver-trust | журнал { $format_name }, эпох: { $epochs } за { $duration_s } s | мониторов { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = это сценарий вида { $k }, а не receiver-trust

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } должно быть конечным (получено { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: требуется 0 < degraded_min < nominal_min <= 100 (получено { $degraded_min } и { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s должно быть конечным и >= 0 (получено { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: требуется 0 <= onset_ratio < full_ratio (получено { $onset_ratio } и { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: вес { $m } должен лежать в [0, 100] (получено { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s должно быть конечным и положительным

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg должно лежать в (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 должно быть конечным и положительным

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m и rho0_kg_m3 должны быть конечными и положительными

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m должно лежать в [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = вход в атмосферу (Аллен–Эггерс): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> пик { $v3 } g на { $v4 } km, { $velocity_at_peak_deceleration } m/s; пик нагрева при { $velocity_at_peak_heating } m/s; материальная точка (гравитация, кривизна, US76) пик { $peak_deceleration_g } g (MODELLED, баллистика, без аэротермики)

## src/registry.rs

engine-e-registry-unknown-scenario-id = неизвестный идентификатор сценария: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = диапазон TRL ({ $lo },{ $hi }) задан некорректно (нужно 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = утверждение, полученное только моделированием, не может быть репрезентативным выше TRL { $MODELLED_TRL_CEILING } (верхняя граница диапазона hi={ $hi }); более высокий TRL — это пробел, а не результат моделирования

engine-representativeness-representativeness-representative-for-trl = Репрезентативность [{ $status }] — { $claim } (репрезентативно для TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = заявленное({ $arch }) x среднее качество источников

engine-resilience-score-weakest-rpcf-sub-score-bounded = наименьшая частная оценка RPCF = { $min_sub }; ограниченная деградация = { $bounded } (без ограничения предел — Level 2)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = неподдерживаемый заголовок навигационной записи { $head }: строка, начинающаяся с '>', — это заголовок записи RINEX 4, а не навигационная запись RINEX 3

engine-e-rinex-bad-prn-in = неверный PRN в { $head }

engine-e-rinex-rinex-navigation-expected-record-header = навигация RINEX 4: ожидался заголовок записи '>', найдено { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = запись RINEX 4 { $head } содержит строк: { $body }, для эфемерид { $msg } нужно 8

engine-e-rinex-rinex-record-is-followed-by = за записью RINEX 4 { $head } следует { $body }, а не { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = неверно { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = в файле наблюдений RINEX нет END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = файл наблюдений RINEX не содержит записей эпох

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s должно быть конечным и > 0 (получено { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s должно быть конечным и > 0 (получено { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) не должно превышать time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps =
    { $n ->
        [one] сетка времени слишком велика: { $n } шаг превышает MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); используйте более крупный шаг или меньшую длительность
        [few] сетка времени слишком велика: { $n } шага превышают MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); используйте более крупный шаг или меньшую длительность
        [many] сетка времени слишком велика: { $n } шагов превышают MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); используйте более крупный шаг или меньшую длительность
       *[other] сетка времени слишком велика: { $n } шага превышают MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); используйте более крупный шаг или меньшую длительность
    }

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = частота дискретизации соизмерима со скоростью следования элементов кода (отсчётов/элемент: { $samples_per_chip }; отклонение от целого числа, отсчётов: { $offset_from_integer_samples }): реплика кода с нулевым порядком удержания не может разрешить изменение фазы кода ниже { $dead_band_chips } элем., поэтому дискриминатор Early/Late представляет собой ступенчатую функцию с мёртвой зоной в один отсчёт вместо треугольника, а DLL устанавливается с неверной задержкой. Сместите частоту дискретизации с целого кратного (5 MHz даёт { $lit_4_8876 } отсчётов/элемент; 25 MHz — { $lit_24_4379 }) или передискретизируйте настолько, чтобы мёртвая зона была ниже требуемой точности фазы кода.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = код ошибки SGP4 { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = неподдерживаемый SigMF core:datatype { $other }: этот читатель обрабатывает комплексные типы cf32_le, ci16_le и ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: читаются только одноканальные записи

engine-e-sigmf-cannot-serialise-sigmf-metadata = не удаётся сериализовать метаданные SigMF: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = недопустимое пространство имён расширения SigMF { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = карт расширений аннотаций: { $annotations }, аннотаций: { $annotations2 }

engine-e-sigmf-extension-key-is-not-in = ключ расширения { $k } не входит в пространство имён { $ns }

engine-e-sigmf-extension-key-is-already-present = ключ расширения { $k } уже присутствует

engine-e-sigmf-global-is-not-an-object = global не является объектом

engine-e-sigmf-annotations-is-not-an-array = annotations не является массивом

engine-e-sigmf-annotation-is-not-an-object = annotation не является объектом

engine-e-sigmf-invalid-sigmf-metadata-json = недопустимый JSON метаданных SigMF: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = в записи SigMF не указан положительный core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = захват SigMF начинается с отсчёта { $start }, за пределами { $data } отсчётов данных

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } должно лежать в [0, 90) градусов, получено { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } должно быть конечным числом, получено { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: для каньона нужен width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m должно быть положительным, получено { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: высоты каньона и antenna_m должны быть неотрицательными

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m должно быть положительным, получено { $l }

engine-e-skyline-skyline-table-is-empty = skyline: таблица пуста

engine-e-skyline-skyline-table-has-rows-over = skyline: в таблице строк: { $rows }, это больше предела в { $MAX_TABLE_ROWS } строк

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: азимут таблицы { $az } вне [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: азимуты таблицы должны строго возрастать ({ $az } следует за { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: более { $MAX_SECTORS } секторов

engine-e-skyline-skyline-the-sector-az-from = skyline: сектор az_from = { $az_from } до az_to = { $az_to } пуст (полный круг задаётся таблицей или маской)

engine-e-skyline-skyline-more-than-terrain-points = skyline: более { $MAX_TABLE_ROWS } точек рельефа

engine-e-skyline-skyline-terrain-distance-must-be = skyline: distance_m рельефа должно быть положительным, получено { $distance_m }

engine-skyline-with-fields-overridden-or-added = { $provenance }; с полями, переопределёнными или добавленными: { $user }

engine-skyline-stated-input = Заявленный ввод: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = неизвестный пресет skyline "{ $name }"; известные пресеты: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = для технического описания нужно не менее двух точек девиации Аллана

engine-e-slot-timing-datasheet-point-must-have-positive = точка технического описания ({ $t }, { $s }) должна иметь положительное время усреднения и положительную девиацию Аллана

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s должно быть положительным числом секунд

engine-e-slot-timing-phase-record-needs-at-least = для подгонки модели шума запись фазы должна содержать не менее 32 отсчётов; получено { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = запись фазы содержит неконечный отсчёт

engine-e-slot-timing-the-phase-record-yields-fewer = запись фазы даёт менее трёх точек девиации Аллана

engine-e-slot-timing-must-be-finite-and-non = { $name } должно быть конечным и неотрицательным; получено { $v }

engine-e-slot-timing-the-slot-guard-must-be = защитный интервал слота должен быть положительным временем

engine-e-slot-timing-sigma-must-be-positive = k_sigma должно быть положительным

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset должно быть конечным

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k должно быть конечным

engine-e-slot-timing-give-exactly-one-of-oscillator = укажите ровно одно из oscillator.class, oscillator.preset, oscillator.datasheet или oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = неизвестное oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = неизвестное oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = класс { $c }, значение по умолчанию: sigma_y(1 s) из { $c2 }; нижний уровень красного шума синтезирован на две и четыре декады ниже него (допущение, а не измерение)

engine-slot-timing-fitted-to-the-allan-deviation = подогнано по максимумам девиации Аллана из { $document } с масштабированием так, чтобы лежать на уровне каждой точки или выше

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] подогнано по перекрывающейся девиации Аллана записи из { $n_samples } отсчёта при { $tau0_s } s в базисе частотной модуляции IEEE Std 1139
        [few] подогнано по перекрывающейся девиации Аллана записи из { $n_samples } отсчётов при { $tau0_s } s в базисе частотной модуляции IEEE Std 1139
        [many] подогнано по перекрывающейся девиации Аллана записи из { $n_samples } отсчётов при { $tau0_s } s в базисе частотной модуляции IEEE Std 1139
       *[other] подогнано по перекрывающейся девиации Аллана записи из { $n_samples } отсчёта при { $tau0_s } s в базисе частотной модуляции IEEE Std 1139
    }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = эпоха '{ $s }' должна иметь вид YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = эпоха '{ $s }': неверно { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb должно быть конечным

engine-e-solar-system-table-must-be-auto-table1 = table должно быть auto, table1 или table2; получено '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = нет эфемерид для линии { $name } — { $name2 } на JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = эпоха JD { $jd } TDB вне диапазона от 3000 BC до 3000 AD таблиц Стэндиша

engine-e-solar-system-track-points-must-be-to = track_points должно быть от 8 до 2000; получено { $n_track }

engine-e-solar-system-unknown-observer-body = неизвестное тело наблюдателя '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies должно называть хотя бы одно тело

engine-e-solar-system-unknown-body = неизвестное тело '{ $n }'

engine-e-solar-system-no-position-for-at-jd = нет положения для { $name } на JD { $jd } TDB (Плутон — только с 1800 AD по 2050 AD)

engine-e-solar-system-no-standish-elements-for = нет элементов Стэндиша для { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), гелиоцентрическое состояние прочитано собственным читателем движка

engine-e-solar-system-unknown-link-body = неизвестное тело линии '{ $from }'

engine-e-solar-system-unknown-link-body-2 = неизвестное тело линии '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = для линии нужны два разных тела; получено { $name }

engine-solar-system-light-time = время распространения света { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  долг. { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }линия { $from } -> { $to }: в одну сторону { $one_way_light_time_s } s, в обе стороны { $two_way_light_time_s } s, Шапиро { $l } us, Солнце { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = эпоха { $input } · { $standish_table } · положения по элементам Стэндиша

## src/sp3.rs

engine-e-sp3-epoch-needs-time-fields-got = эпоха требует 6 полей времени, получено { $tokens }

engine-e-sp3-bad-second = неверная секунда: { $tokens }

engine-e-sp3-record-needs-values-missing-column = запись требует 4 значения, отсутствует столбец { $v1 }

engine-e-sp3-bad-number = неверное число: { $field }

engine-e-sp3-empty-sp3-input = пустой ввод SP3

engine-e-sp3-first-line-is-not-an = первая строка не является заголовком SP3: { $first }

engine-e-sp3-unsupported-sp3-version-in = неподдерживаемая версия SP3 в { $first }

engine-e-sp3-missing-epoch-count-on-header = в строке 1 заголовка отсутствует число эпох

engine-e-sp3-record-has-no-satellite-id = у записи нет идентификатора спутника: { $line }

engine-e-sp3-position-record-before-any-epoch = запись положения перед любым заголовком эпохи

engine-e-sp3-sp3-file-contained-no-epoch = файл SP3 не содержит записей эпох

engine-e-sp3-bad-accuracy-exponent-in = неверный показатель точности { $f } в { $line }

engine-e-sp3-bad-header-accuracy = неверная точность в заголовке { $t }

engine-e-sp3-short-line = короткая строка %f { $line }

engine-e-sp3-bad-base-in = неверное основание %f в { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = версия превышает 3 бита

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID превышает 11 бит (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count превышает 14 бит (0..=16383)

engine-e-space-packet-data-field-must-be-at = поле данных должно содержать не менее одного октета

engine-e-space-packet-data-field-exceeds-65536-octets = поле данных превышает 65536 октетов

engine-e-space-packet-packet-shorter-than-the-octet = пакет короче 6-октетного заголовка: { $bytes } байт

engine-e-space-packet-declared-data-length-header-octets = объявленная длина данных { $data_len } (+6 заголовка) = { $total } октетов, но буфер — { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = грубых октетов CUC { $coarse_octets } вне 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = точных октетов CUC { $fine_octets } вне 0..=3 (расширенное P-поле не поддерживается)

engine-e-space-packet-cuc-field-extended-field-not = P-поле CUC { $p }: расширенное P-поле не поддерживается

engine-e-space-packet-field-time-code-id-is = P-поле { $p }: идентификатор кода времени { $id } не является CUC

engine-e-space-packet-field-is-not-cds-field = P-поле { $p } не является P-полем CDS

engine-e-space-packet-cds-field-reserved-sub-ms = P-поле CDS { $p }: зарезервированный код субмиллисекунд 11

engine-e-space-packet-cuc-coarse-does-not-fit = грубая часть CUC { $coarse } не помещается в { $c } октетов

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] точная часть CUC { $fine } не помещается в { $n } октет
        [few] точная часть CUC { $fine } не помещается в { $n } октета
        [many] точная часть CUC { $fine } не помещается в { $n } октетов
       *[other] точная часть CUC { $fine } не помещается в { $n } октета
    }

engine-e-space-packet-cds-days-do-not-fit = сутки CDS { $days } не помещаются в { $f } октетов

engine-e-space-packet-cds-ms-of-day-above = миллисекунды суток CDS { $ms_of_day } выше 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = субмиллисекунды CDS { $submillis } выше { $max_sub }

engine-e-space-packet-time-code-format-and-value = формат и значение кода времени относятся к разным кодам

engine-e-space-packet-time-code-no-field-octet = код времени: нет октета P-поля

engine-e-space-packet-time-code-needs-octets-present = коду времени нужно октетов: { $end }, имеется { $bytes }

engine-e-space-packet-time-code-format-differs-from = формат кода времени отличается от неявного P-поля

engine-e-space-packet-the-format-has-time-code = у формата есть поле кода времени; оно не задано

engine-e-space-packet-the-format-has-no-time = у формата нет поля кода времени

engine-e-space-packet-ancillary-data-is-octets-the = вспомогательных данных октетов: { $ancillary }; формат задаёт { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = вторичный заголовок должен содержать не менее одного октета

engine-e-space-packet-secondary-header-needs-octets-present = вторичному заголовку нужно октетов: { $end }, имеется { $bytes }

engine-e-space-packet-the-format-has-secondary-header = у формата есть вторичный заголовок; он не задан

engine-e-space-packet-the-format-has-no-secondary = у формата нет вторичного заголовка

engine-e-space-packet-secondary-header-flag-disagrees-with = флаг вторичного заголовка { $v1 } не согласуется с форматом

engine-e-space-packet-data-field-shorter-than-the = поле данных короче PEC

## src/space_packet.rs

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } не совпадает с CRC { $crc16_ccitt_false } пакета

engine-e-space-packet-nothing-to-segment-empty-user = нечего сегментировать: пустые пользовательские данные

engine-e-space-packet-max-user-octets-must-be = max_user_octets должно быть не менее 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count превышает 14 бит (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid }, а ожидался { $a }

engine-space-packet-sequence-count-repeated = счётчик последовательности { $sequence_count } повторён

engine-space-packet-sequence-count-gap-after-packet = разрыв счётчика последовательности: { $sequence_count } после { $last } (пропущено пакетов: { $v2 })

engine-space-packet-sequence-count-out-of-order = нарушен порядок счётчика последовательности: { $sequence_count } после { $last }

engine-space-packet-packet-with-no-unit-open = пакет { $f } без открытой единицы

engine-space-packet-packet-while-unit-is-open = пакет { $f } при открытой единице

engine-e-space-packet-packet = пакет { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = последовательность заканчивается незакрытой единицей (нет последнего пакета)

engine-e-space-packet-apid-must-be-in-2047 = apid должно лежать в 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count должно быть >= 1

engine-e-space-packet-data-len-must-be-in = data_len должно лежать в 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = внутренняя ошибка: несовпадение при круговом кодировании и декодировании

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 должно быть конечным и положительным

engine-e-space-weather-f107a-must-be-finite-and = f107a должно быть конечным и положительным

engine-e-space-weather-kp-must-be-in = kp должно лежать в [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km не должно быть пустым

engine-e-space-weather-altitude-km-must-be-finite = высота { $h } km должна быть конечной и положительной

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; плотность x{ $density_activity_factor } на { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: для источника помех типа { $what } нужен положительный bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: для чирп-источника помех нужен положительный sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to называет неизвестный диапазон { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: укажите либо received_power_dbw, либо eirp_dbw с положительным range_m (не оба)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s должно быть позже on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: частота дискретизации должна быть положительной

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } должно быть степенью двойки, не менее 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: отсчётов { $x } меньше, чем в одном сегменте из { $nfft } точек

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } должно быть степенью двойки, не менее 16

engine-e-spectrum-cannot-read-recording-meta-path = не удаётся прочитать meta_path записи { $meta_path }: { $e }

engine-e-spectrum-cannot-read-recording-data = не удаётся прочитать данные записи { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz должно быть положительным

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: модуляцию { $m } выбрать нельзя (только galileo-e1 принимает "mboc" или "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: сигнала { $sig } нет в библиотеке пресетов сигналов ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: сигнал из пресета несёт собственную модуляцию; уберите `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: для сигнала { $sig } не опубликована принимаемая мощность; укажите signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: для пользовательского диапазона нужна `modulation`, например "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: для пользовательского диапазона нужен signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: укажите либо `signal`, либо `centre_mhz`, но не оба

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: укажите rx_bandwidth_mhz (главный лепесток найти не удалось)

engine-e-spectrum-duration-must-be-at-least = duration_s должно быть не меньше одного step_s

engine-e-spectrum-time-rows-is-more-than = строк времени: { $rows }, это больше допустимых 5000

engine-e-spectrum-at-most-extra-panels = не более 8 дополнительных панелей

engine-e-spectrum-panel-need-max-mhz-min = панель { $name }: нужно f_max_mhz > f_min_mhz и 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = grid: нужно f_max_mhz > f_min_mhz и 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = сценарий spectrum | диапазонов: { $bands } | источников помех: { $jammers } | уровень шума { $n0_db } dBW/Hz | худший диапазон { $name } мин. C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = сценарий spectrum | диапазонов нет | уровень шума { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples должно лежать между 10 и 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: используйте cf32_le или ci16_le

engine-spectrum-frequency-across-time-down-colour = частота по горизонтали, время по вертикали вниз, цвет = спектральная плотность мощности (dBW/Hz); уровень шума { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = у каждой панели свой диапазон частот, одна шкала времени вниз, одна цветовая шкала (dBW/Hz); уровень шума { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = у системы координат { $other } нет поддерживаемого кода NAIF

engine-e-spk-writer-segment-name-longer-than-40 = имя сегмента длиннее 40 символов: { $name }

engine-e-spk-writer-segment-name-has-non-printing = имя сегмента содержит непечатаемые символы: { $name }

engine-e-spk-writer-bad-target-for-centre = неверная цель { $target } для центра { $centre }

engine-e-spk-writer-degree-outside-27 = степень { $degree } вне 1..=27

engine-e-spk-writer-type-13-degree-is-not = степень { $degree } для типа 13 не является нечётной

engine-e-spk-writer-descriptor-start-is-not-before = начало дескриптора не раньше его конца

engine-e-spk-writer-epochs-are-not-strictly-increasing = эпохи не возрастают строго

engine-e-spk-writer-the-epochs-do-not-cover = эпохи не покрывают интервал дескриптора

engine-e-spk-writer-type-or-13-segment-carries = сегмент типа 9 или 13 содержит состояния, а не записи

engine-e-spk-writer-type-segment-needs-at-least = сегменту типа 3 нужна хотя бы одна запись

engine-e-spk-writer-type-degree-outside-27 = степень { $degree } для типа 3 вне 0..=27

engine-e-spk-writer-type-interval-length-is-not = длина интервала { $intlen } для типа 3 не положительна

engine-e-spk-writer-type-record-has-coefficients-expected = запись { $i } типа 3 содержит коэффициентов: { $value }, ожидалось { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = начало дескриптора позже его конца

engine-e-spk-writer-descriptor-starts-before-the-first = дескриптор начинается раньше первой записи

engine-e-spk-writer-descriptor-ends-after-the-last = дескриптор заканчивается позже последней записи

engine-e-spk-writer-type-segment-carries-records-not = сегмент типа 3 содержит записи, а не эпохи или состояния

engine-e-spk-writer-type-21-segment-needs-at = сегменту типа 21 нужна хотя бы одна строка разностей

engine-e-spk-writer-difference-line-size-is-not = размер строки разностей { $dlsize } не равен 4 MAXDIM + 11 при MAXDIM в 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = строки разностей разных размеров

engine-e-spk-writer-difference-line-epochs-are-not = эпохи строк разностей не возрастают строго

engine-e-spk-writer-the-last-difference-line-ends = последняя строка разностей заканчивается раньше дескриптора

engine-e-spk-writer-zero-step-size-in-difference = нулевой размер шага { $j } в строке разностей { $i }

engine-e-spk-writer-type-21-segment-carries-difference = сегмент типа 21 содержит строки разностей, а не состояния

engine-e-spk-writer-an-spk-needs-at-least = для SPK нужен хотя бы один сегмент

engine-e-spk-writer-segment = сегмент { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = строка комментария содержит непечатаемые символы: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = для комментариев нужно символов: { $nchars }; зарезервировано: { $v1 } (увеличьте ncomch)

engine-e-spk-writer-difference-line-orders-out-of = порядки строки разностей { $kqmax1 } { $kq } вне диапазона

engine-e-spk-writer-zero-step-size-at-index = нулевой размер шага с индексом { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } вне сегмента [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = сегмент { $name } типа 3 слишком короток

engine-e-spk-writer-type-segment-words-for-rsize = сегмент { $name } типа 3: слов { $nw } при N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = сегмент { $name } типа 21 слишком короток

engine-e-spk-writer-type-21-segment-words-for = сегмент { $name } типа 21: слов { $nw } при N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = сегмент { $name } слишком короток

engine-e-spk-writer-segment-words-for = сегмент { $name }: слов { $nw } при N = { $n }

engine-e-spk-writer-segment-is-in-frame = сегмент { $name } задан в системе координат { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = цепочка центров SPK не завершается

engine-e-spk-writer-no-spk-chain-connects-and = ни одна цепочка SPK не соединяет { $target } и { $observer } на ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = эпоха { $s } не имеет вид YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = система времени { $other } не поддерживается (UTC или TDB)

engine-e-spk-writer-centre-has-no-supported-naif = у центра { $other } нет поддерживаемого идентификатора NAIF

engine-e-spk-writer-oem-segment-has-no-data = в сегменте OEM { $name } нет строк данных

engine-e-spk-writer-oem-segment-no = сегмент OEM { $idx }: нет { $k }

engine-e-spk-writer-no-export-settings-for-oem = нет параметров экспорта для сегмента OEM { $idx }

engine-e-spk-writer-oem-data-line-has-fields = строка данных OEM содержит полей: { $f }: { $line }

engine-e-spk-writer-oem-value = значение OEM { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = сегментов OEM: { $out }, параметров экспорта: { $exports }

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (объединённый) — уровни: { $fired }

engine-spoof-detect-single-layer-indication-below-the = признак на одном уровне ({ $fired }) ниже объединённого порога — нужно подтверждение

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg должно быть положительным, получено { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = панель { $i }: площадь должна быть >= 0

engine-e-srp-boxwing-panel-outside = панель { $i }: { $name } = { $c } вне [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = панель { $i }: поглощение + зеркальное + диффузное отражение = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = панель { $i }: нулевая нормаль/ось

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = нормальная матрица ECOM2 вырождена или плохо обусловлена

## src/ssv/check.rs

engine-e-ssv-check-heo-preset = пресет heo

engine-e-ssv-check-lunar-preset = пресет lunar

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = для построения нужен хотя бы один ведомый

engine-e-ssv-formation-duration-min-and-step-must = duration_min и step_s должны быть положительными

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = нет сигналов для выбранных орбитальных группировок и диапазонов

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = неизвестная антенна `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = CSV диаграммы пуст

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` не является числом в CSV диаграммы

engine-e-ssv-scenario-pattern-csv-row-has-columns = строка CSV диаграммы `{ $l }` содержит столбцов: { $f }, ожидалось { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" требует ровно одного из pattern_csv и pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` не является booklet, parametric или table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: укажите cn0_min_dbhz или weak_signal, но не оба

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = контур несущей не может удержать заданную скорость изменения Доплера ни при каком C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` не является acquisition, tracking или both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz должно быть конечным

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: укажите ровно одно из preset и orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` не является leo, meo, geo, heo или lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: укажите ровно одно из duration_min и duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } должно быть положительным

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg требует от 1 до 8 конечных смещений

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd не должно быть отрицательным

engine-e-ssv-scenario-give-exactly-one-of-shell = укажите ровно одно из [shell], [trajectory] и [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] требует таблицу [navigation] для ведущего

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include и constellations.bands не должны быть пустыми

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km должно быть выше 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels выше 5 не поддерживается

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna должно быть hemisphere или omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = перебор по оболочке поддерживает только диаграмму передачи booklet (для формованной диаграммы нужен перебор по траектории)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] применяется к [trajectory], а не к [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: укажите ровно одно из preset и orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` не является leo, meo, geo, heo или lunar-transfer

engine-e-ssv-scenario-unknown-preset = неизвестный пресет

engine-ssv-scenario-gnss-ssv-shell-km = оболочка gnss-ssv { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = навигация gnss-ssv: RMS положения { $p } в целом, { $p2 } внутри орбит ГНСС, { $p3 } выше; самый длинный разрыв { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = ведомый на { $offset_deg } deg ({ $baseline_km } km): относительный RMS { $rel_rms_filter_m } m с фильтром против { $rel_rms_from_absolute_m } m по абсолютным решениям

engine-ssv-scenario-combined-max-outage-min = { $band } совместно 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (макс. перерыв { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = траектория gnss-ssv от { $perigee_alt_km } до { $apogee_alt_km } km высоты: { $parts }

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min и step_min должны быть положительными

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } должно быть положительным числом, получено { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = нет пакета стандартов с именем `{ $id }`; доступные пакеты: { $ids }

engine-e-standards-pack-pack-manifest = манифест пакета: { $e }

engine-e-standards-pack-test-duplicate-id = тест { $id }: повторяющийся идентификатор

engine-e-standards-pack-test-scenario-is-not-in = тест { $id }: сценария `{ $s }` нет в пакете

engine-e-standards-pack-test-scored-test-needs-bar = тест { $id }: оцениваемому тесту нужен порог

engine-e-standards-pack-test-test-that-needs-input = тест { $id }: у теста, которому нужен ввод, нет порогов

engine-e-standards-pack-test-give-either-scenario-or = тест { $id }: укажите либо `scenario`, либо `needs_input`, но не оба и не ни одного

engine-e-standards-pack-test-supports-unknown-row = тест { $id }: подкрепляет неизвестную строку `{ $r }`

engine-e-standards-pack-test-unknown-op = тест { $id }: неизвестная операция `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = тест { $id }: порогу для { $pointer } нужно ровно одно из `value` и `against`

engine-e-standards-pack-row-duplicate-id = строка { $id }: повторяющийся идентификатор

engine-e-standards-pack-row-asks-must-be-short = строка { $id }: `asks` должно быть кратким пересказом

engine-e-standards-pack-row-no-test-supports-it = строка { $id }: ни один тест её не подкрепляет

engine-standards-pack-not-scored-needs-input = не оценивается: нужен ввод ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = в исследовании нет сценариев для запуска

engine-e-study-cannot-read-scenario = не удаётся прочитать сценарий { $path }: { $e }

engine-e-study-scenario-failed = сценарий { $path } завершился с ошибкой: { $e }

engine-e-study-scenario-produced-unparseable-json = сценарий { $path } выдал JSON, не поддающийся разбору: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = недопустимый манифест набора: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = неизвестный источник `{ $o }`: используйте `adsb` или `ais`

engine-e-surface-is-bytes-over-the-byte = { $what }: { $len } байт, больше предела в { $limit } байт

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` не является временем UTC в формате ISO-8601

engine-e-surface-invalid-receiver-trust-session = недопустимый сеанс receiver-trust: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` не является временем UTC в формате ISO-8601

engine-e-surface-dataset-custom-needs-licence-licence = набору данных `custom` нужны licence, licence_url и attribution

engine-e-surface-at-least-one-map-is = требуется хотя бы одна карта

engine-e-surface-epoch = epoch: { $e }

engine-e-surface-not-utf = { $suffix }: не UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = неизвестный вид сценария `{ $k }`; список видов называет каждый вид

engine-surface-is-not-bundled-it = `{ $name }` не входит в комплект: { $why }

engine-surface-no-bundled-scenario-named-the = нет встроенного сценария `{ $name }`; в списке примеров названы имеющиеся: { $v1 }

engine-e-surface-invalid-toml = недопустимый TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = неизвестный формат экспорта `{ $format }`; ожидалось одно из czml, kml, geojson, stk или sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps даёт кадров: { $opts }, а возвращается не более { $MAX_ANIMATION_FRAMES }; уменьшите fps или duration_s либо запишите более длинную последовательность из командной строки

engine-e-surface-scenario-run-failed = запуск сценария завершился с ошибкой: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log называет файл `path`; передайте журнал как `text` или `base64` (этот интерфейс не читает файлы)

engine-e-surface-max-sp-errors-must-be = max_sp_errors должно быть не более 20

engine-e-surface-frames-must-be-to = frames должно быть от 1 до { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 должно быть от 0 до 99

engine-e-surface-runs-given-at-most-per = передано запусков: { $runs }; не более { $MAX_COMPLIANCE_RUNS } на один отчёт

engine-e-surface-the-runs-total-bytes-the = запуски занимают всего { $total } байт; предел для одного отчёта — { $max_bytes }

engine-e-surface-result-files-given-at-most = передано файлов результатов: { $results }, не более 256

engine-e-surface-result-is-not-json = результат { $v1 } не является JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = неизвестный формат `{ $o }`: используйте `prometheus`, `cef`, `leef`, `otlp` или `mqtt`

engine-e-surface-unknown-imu-format-use-csv = неизвестный формат IMU `{ $o }`: используйте `csv` или `euroc`

engine-e-surface-unknown-axis-use-or = неизвестная ось `{ $o }`: используйте `x`, `y` или `z`

engine-e-surface-id-must-be-to-64 = id должен состоять из 1–64 печатных символов ASCII без пробелов

engine-surface-fitted-from-stationary-imu-log = подогнано по журналу неподвижного IMU, sha256 { $sha }, ось { $axis }, оценка Аллана

engine-e-surface-unknown-input-kind-use-result = неизвестный input_kind `{ $o }`: используйте `result` или `jsonl`

engine-e-surface-the-input-holds-no-trust = во вводе нет эпох доверия

engine-e-surface-the-reply-is-over-the = ответ превышает предел в { $max_bytes } байт; отправьте меньше эпох или оставьте `syslog_all` выключенным

engine-e-surface-otlp-needs-build-with-the = для otlp нужна сборка с функцией `otlp`

engine-e-surface-the-pack-and-token-total = пакет и токен занимают всего { $total } байт; предел — { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = токен метки времени пуст

engine-e-surface-must-be-64-lower-case = { $what } должно состоять из 64 шестнадцатеричных цифр в нижнем регистре

engine-e-surface-must-be-32-bytes = { $what } должно состоять из 32 байт

engine-surface-verified-against-the-public-key = VERIFIED по открытому ключу, который вы указали (отпечаток подписанта { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: хэши и подпись согласуются с ключом { $fp }, который пакет называет сам. Укажите открытый ключ подписанта, полученный от него другим путём, чтобы установить, кто подписал пакет.

engine-e-surface-files-must-be-json-object = files должно быть JSON-объектом вида имя -> содержимое

engine-e-surface-pack-has-at-most-64 = в пакете не более 64 файлов

engine-e-surface-file-name-must-be-plain = имя файла `{ $k }` должно быть простым именем

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` не является корректным стандартным base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = неизвестный параметр перебора: { $other }

engine-e-sweep-unknown-sweep-metric = неизвестная метрика перебора: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep требует хотя бы одной оси

engine-e-sweep-sweep-key-is-malformed = ключ перебора `{ $key }` имеет неверный формат

engine-e-sweep-sweep-key-follows-an-array = ключ перебора `{ $key }`: `{ $part }` следует за массивом, поэтому должен быть индексом

engine-e-sweep-unreachable = недостижимо

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] ключ перебора `{ $key }`: индекс { $i } за пределами массива из { $n } элемента
        [few] ключ перебора `{ $key }`: индекс { $i } за пределами массива из { $n } элементов
        [many] ключ перебора `{ $key }`: индекс { $i } за пределами массива из { $n } элементов
       *[other] ключ перебора `{ $key }`: индекс { $i } за пределами массива из { $n } элемента
    }

engine-e-sweep-sweep-key-parent-is-not = ключ перебора `{ $key }`: родитель `{ $part }` не является таблицей

engine-e-sweep-sweep-key-no-field = ключ перебора `{ $key }`: нет поля `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = ключ перебора `{ $key }`: родитель `{ $last }` не является таблицей

engine-e-sweep-sweep-key-no-field-2 = ключ перебора `{ $key }`: нет поля `{ $last }`

engine-e-sweep-metric-no-field-in-result = метрика `{ $path }`: в результате нет поля `{ $part }`

engine-e-sweep-metric-value-is-not-number = метрика `{ $path }`: значение не является числом

engine-e-sweep-sweep-node-serialize = сериализация узла перебора: { $e }

engine-e-sweep-sweep-node-result-parse = разбор результата узла перебора: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = ось перебора `{ $key }`: объявлена единица `{ $d }`, но перебираемый пакет публикует `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = рабочий поток перебора аварийно завершился

engine-e-sweep-generic-sweep-needs-at-least = обобщённому перебору нужна хотя бы одна ось

engine-e-sweep-generic-sweep-needs-at-least-2 = обобщённому перебору нужна хотя бы одна метрика

engine-e-sweep-generic-sweep-base-must-carry = `base` обобщённого перебора должно содержать собственный `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = обобщённый перебор не может перебирать другой перебор

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = неизвестный генератор { $oscillator }; ожидалось одно из { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day и temperature_coeff_per_k должны быть конечными

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s должно быть конечным и положительным

engine-e-telecom-timing-duration-must-be-finite-and = duration_s должно быть конечным и длиной не менее двенадцати отсчётов

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s должно лежать в [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns должно быть конечным и >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = входные данные температуры и смещения частоты должны быть конечными (период > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = запись превысила бы 5 000 000 отсчётов; увеличьте sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = для ряда ошибки времени нужно не менее 13 отсчётов, получено { $pairs }

engine-e-telecom-timing-every-time-and-time-error = каждое time_s и time_error_ns должны быть конечными

engine-e-telecom-timing-time-must-increase = time_s должно возрастать

engine-e-telecom-timing-the-series-must-be-uniformly = ряд должен быть дискретизирован равномерно: шаг { $v1 } равен { $d } s, первый — { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = строка CSV { $v1 } не имеет вид `time_s,time_error_ns`

## src/telecom_timing.rs

engine-telecom-timing-the-mask-is-defined-through = маска определена через фильтр нижних частот { $lit_0_1 } Hz, который этот движок применяет только при интервалах дискретизации { $MAX_FILTER_DT_S } s или меньше; эта запись дискретизирована каждые { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = укажите либо [holdover], либо [series], но не оба

engine-e-telecom-timing-give-either-series-samples-or = укажите либо series.samples, либо series.csv_path, но не оба

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days должно быть конечным и >= 0

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns за { $v2 } s; { $masks } (MODELLED)

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = неизвестный --format `{ $f }` (cef или leef)

engine-e-telemetry-cli-unknown-option = неизвестный параметр `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input и --result взаимоисключающие

engine-e-telemetry-cli-listen-no-address = --listen { $l }: нет адреса

engine-telemetry-cli-warning-metrics-is-served-without = предупреждение: /metrics отдаётся без аутентификации на { $addr }; привяжите к localhost или поставьте за собственный контроль доступа

engine-telemetry-cli-serving-http-metrics = обслуживается http://{ $bound }/metrics

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp и --syslog-tcp взаимоисключающие

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting применяется к --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: часть топика должна быть непустой, без #, + и без начального /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp требует сборки с `--features otlp`

engine-telemetry-cli-warning-input-line = предупреждение: строка ввода { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = не удаётся открыть { $p }: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] предупреждение: не доставлено { $n } сообщение MQTT
        [few] предупреждение: не доставлено { $n } сообщения MQTT
        [many] предупреждение: не доставлено { $n } сообщений MQTT
       *[other] предупреждение: не доставлено { $n } сообщения MQTT
    }

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint должен начинаться с http://

engine-e-telemetry-otlp-endpoint-has-no-host = в endpoint нет хоста

engine-telemetry-otlp-no-address-for = нет адреса для { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = предупреждение: экспорт otlp не удался: { $e }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = не JSON: { $e }

engine-e-telemetry-sample-not-json-object = не JSON-объект

engine-e-telemetry-sample-is-not-number = `{ $k }` не является числом

engine-e-telemetry-sample-is-not-finite = `{ $k }` не является конечным

engine-e-telemetry-sample-missing = отсутствует `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } вне 0..=100

engine-e-telemetry-sample-missing-state = отсутствует `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` не является массивом

engine-e-telemetry-sample-entry-has-no-name = у элемента `{ $key }` нет имени

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` отсутствует или не является конечным числом

engine-e-telemetry-sample-position-is-not-an-object = `position` не является объектом или null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` отсутствует или не является строкой

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` не является конечным числом >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` не является строкой

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` не является булевым значением

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` не является объектом или null

engine-e-telemetry-sample-result-has-no-epochs = в результате нет `epochs`

engine-e-telemetry-sample-bad-epochs = неверные `epochs`: { $e }

## src/telemetry/syslog.rs

engine-e-telemetry-syslog-host-is-bytes-syslog-host = host занимает { $host } байт; имя хоста syslog — не более 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = host должен состоять из печатных символов ASCII без пробелов

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } против { $w } (не представимо как f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: присутствует, ожидалось отсутствие

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: отсутствует, ожидалось присутствие

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } должно быть конечным

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu должно быть конечным и неотрицательным

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: строка { $v1 }: не MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: нет записей AR для { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = неизвестный формат ряда { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } должно быть конечным

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s должно давать от 16 до 20000 измерений

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } смещение { $ns } ns (Саньяк { $ns2 } ns, ионосфера { $ns3 } ns); суммарная u { $ns4 } ns (тип A { $ns5 } ns при { $averaging_s } s); реальный ряд: { $series } (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = символы не из ASCII в TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE оборван при чтении { $what } (столбцы { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } слишком короток для контрольной суммы в столбце 69

engine-e-tle-tle-has-no-checksum-digit = в TLE { $label } нет цифры контрольной суммы в столбце 69

engine-e-tle-tle-checksum-mismatch-column-69 = контрольная сумма TLE { $label } не совпадает: в столбце 69 указано { $want }, вычислено { $got }

engine-e-tle-not-tle-line = не строка 1 TLE: { $line1 }

engine-e-tle-not-tle-line-2 = не строка 2 TLE: { $line2 }

engine-e-tle-invalid-in-tle = недопустимое { $what } в TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = недопустимый год эпохи в TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = недопустимый каталожный номер в TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = наклонение вне диапазона [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = эксцентриситет вне диапазона [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = неположительное среднее движение: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = недопустимая мантисса { $what } в TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = недопустимый показатель { $what } в TLE: { $exp }

engine-tle-satellite-line-only-element-set = спутник { $satnum }: набор элементов только со строкой 2 разобран как аналитические кеплеровы (двухтельные) элементы — торможение и B* из строки 1 и вековые члены SGP4 отсутствуют, поэтому эта орбита уходит от истинной подгонки SGP4 по мере удаления от эпохи; для точности SGP4 укажите соответствующую строку 1

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: профилю C/N0 нужны положительные эпоха и длительность

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: профилю C/N0 потребовалось бы более { $MAX_DETECTOR_STEPS } шагов детектора ({ $total } s при { $epoch_s } s на эпоху); сократите ramp_duration_s или увеличьте predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } должно быть конечным

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } должно быть положительным (получено { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips должен быть меньше { $lit_1_9 } элем. кода (получено { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio должно быть не менее 1 (получено { $pullin_bandwidth_ratio }) — контур, который повторно захватывает с более УЗКОЙ полосой, чем та, с которой сопровождает, инвертировал бы гистерезис

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s не должно быть отрицательным

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) не должно превышать cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } не должно быть пустым

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } содержит записей: { $axis }; предел — { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } содержит неконечное значение

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: время подтверждения должно составлять не менее 1 эпохи

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = нужно не менее восьми отсчётов

engine-e-twstft-budget-samples-must-increase-in-time = отсчёты должны возрастать по времени

engine-e-twstft-budget-samples-must-be-on-regular = отсчёты должны лежать на регулярной сетке

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }Строк всего: { $total }; внешне проверено: { $validated }, смоделировано: { $modelled }, за партнёром: { $partner_owned }.{ "\u000A" }

engine-verification-the-complete-machine-checked-evidence = Полный реестр доказательств с машинной проверкой: **строк всего: { $total } — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Строка может быть VALIDATED только при наличии независимого внешнего оракула (это обеспечивают тесты инвариантов матрицы). Те же данные с кликабельными ссылками по каждой строке на тест, модуль и зафиксированный образец — это *Реестр валидации* на https://kshana.dev. Почему каждая смоделированная строка не проверена внешне, см. в [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md).{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }Возможностей с пометкой MODELLED: { $modelled }.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json не является JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json не является JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] требует `label`

engine-wasm-runs-needs-result = runs[{ $i }] требует `result`

engine-wasm-results-json-is-not-json = results_json не является JSON-массивом строк: { $e }

engine-wasm-maps-json-must-be-json = maps_json должно быть JSON-массивом строк: { $e }

engine-wasm-plans-json-is-not-json = plans_json не является JSON-массивом строк: { $e }

engine-wasm-options-json-is-not-json = options_json не является JSON: { $e }

engine-wasm-input-is-about-bytes-over = ввод занимает около { $b64 } байт, больше предела в { $v2 } байт

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Последовательная навигация по рельефу местности (рекурсивный SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = дрейф свободной инерциальной навигации (растёт)

engine-altpnt-sequential-terrain-matched-bounded = привязка к рельефу (ограничен)

engine-altpnt-sequential-waypoint-full-scale = путевая точка →    полная шкала { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Отчёт о запуске Kshana

engine-advanced-report-meta = Вид <code>{ $kind }</code> · движок { $engine } · сценарий <code>{ $scenario }</code> (хеш файла { $digest }…)

engine-advanced-report-toc-summary = 1 Сводка

engine-advanced-report-toc-inputs = 2 Входные данные

engine-advanced-report-toc-results = 3 Результаты

engine-advanced-report-toc-aggregation = 3a Агрегирование

engine-advanced-report-toc-companions = 3b Анимация и экспорт

engine-advanced-report-toc-events = 4 События

engine-advanced-report-toc-labels = 5 Метки верификации

engine-advanced-report-toc-not-modelled = 6 Не моделируется

engine-advanced-report-toc-reproducibility = 7 Воспроизводимость

engine-advanced-report-h-summary = 1. Краткая сводка

engine-advanced-report-honesty-label = <strong>Метка достоверности</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Использованные возможности:</strong> VALIDATED: { $n_validated }, MODELLED: { $n_modelled }, PARTNER: { $n_partner } (используются, но не предоставляются); см. раздел 5.

engine-advanced-report-member-runs = <strong>Запуски-участники:</strong> { $n }, агрегированы в разделе 3a.

engine-advanced-report-h-inputs = 2. Входные данные

engine-advanced-report-inputs-note = Каждое поле, заданное файлом сценария, развёрнуто до своего пути. Единицы берутся из блока <code>units</code> результата (схема единиц полей, docs/field-units-schema.json), если он описывает поле, иначе из суффикса имени поля; единица, не указанная ни там, ни там, отображается как «не указана».

engine-advanced-report-th-parameter = Параметр

engine-advanced-report-th-value = Значение

engine-advanced-report-th-unit = Единица

engine-advanced-report-th-unit-source = Источник единицы

engine-advanced-report-h-results = 3. Результаты

engine-advanced-report-chart-alt = График результатов

engine-advanced-report-also-written-to = { " " }(также записано в { $file })

engine-advanced-report-h-scalars = Скалярные результаты

engine-advanced-report-h-columns = Числовые столбцы

engine-advanced-report-th-result = Результат

engine-advanced-report-th-column = Столбец

engine-advanced-report-th-count = Количество

engine-advanced-report-th-min = Мин.

engine-advanced-report-th-max = Макс.

engine-advanced-report-th-first = Первое

engine-advanced-report-th-last = Последнее

engine-advanced-report-omitted-inputs = <p class="note">Не показано на этой странице, входных данных дополнительно: { $n }; report.json содержит те же строки, а документ результата содержит все значения.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">Не показано на этой странице, скалярных результатов дополнительно: { $n }; report.json содержит те же строки, а документ результата содержит все значения.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">Не показано на этой странице, числовых столбцов дополнительно: { $n }; report.json содержит те же строки, а документ результата содержит все значения.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">Не показано на этой странице, событий дополнительно: { $n }; report.json содержит те же строки, а документ результата содержит все значения.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Агрегирование запусков-участников

engine-advanced-report-mode = <p>Режим <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Режим <strong>{ $mode }</strong> для вида <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Режим <strong>{ $mode }</strong>, запусков-участников: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Режим <strong>{ $mode }</strong> для вида <code>{ $kind }</code>, запусков-участников: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-run-digest = Хеш запуска (SHA-256 от хешей результатов участников в порядке диспетчеризации): <code>{ $digest }</code>

engine-advanced-report-table-empty = В этой таблице нет строк: результат их не содержит.

engine-advanced-report-distribution-caption = Распределение Монте-Карло для { $metric } (выборок: { $n }), 20 интервалов равной ширины; пунктирные линии отмечают 5-й, 50-й и 95-й процентили.

engine-advanced-report-distribution-caption-unit = Распределение Монте-Карло для { $metric } (выборок: { $n }, единица: { $unit }), 20 интервалов равной ширины; пунктирные линии отмечают 5-й, 50-й и 95-й процентили.

engine-advanced-report-h-companions = 3b. Анимация и экспорт

engine-advanced-report-animation-alt = Анимация временных рядов запуска

engine-advanced-report-animation-caption = Собственные отсчёты запуска прорисовываются за движущимся курсором времени (анимированная отрисовка <code>--animate svg</code>; при пониженной анимации и в печати показывается готовая картинка).

engine-advanced-report-no-animation = Анимации нет: { $reason }

engine-advanced-report-no-animation-default = результат не содержит временных рядов

engine-advanced-report-player-written-by = Интерактивный проигрыватель записывается командой <code>{ $command }</code>.

engine-advanced-report-written-beside = Записано рядом с этим отчётом: { $links }.

engine-advanced-report-th-export = Экспорт

engine-advanced-report-th-applies = Применимо

engine-advanced-report-th-files-or-reason = Файлы или причина

engine-advanced-report-written-by = записывается командой <code>{ $command }</code>

engine-advanced-report-does-not-apply = неприменимо

engine-advanced-report-yes = да

engine-advanced-report-no = нет

engine-advanced-report-h-events = 4. Временная шкала событий

engine-advanced-report-events-caption = Окна показаны полосами, точечные события точками, на собственной оси времени запуска.

engine-advanced-report-th-start = Начало (s)

engine-advanced-report-th-end = Конец (s)

engine-advanced-report-th-event = Событие

engine-advanced-report-th-source = Источник

engine-advanced-report-point-event = точечное событие

engine-advanced-report-events-timeline = Временная шкала событий

engine-advanced-report-point-events = точечные события ({ $n })

engine-advanced-report-distribution-of = Распределение { $metric }

engine-advanced-report-max-bin = макс. интервал { $n }

engine-advanced-report-h-labels = 5. Метки верификации

engine-advanced-report-th-capability = Возможность (требование матрицы)

engine-advanced-report-th-label = Метка

engine-advanced-report-th-used-by = Используется в

engine-advanced-report-th-oracle = Источник: оракул

engine-advanced-report-th-test-evidence = Доказательства по тестам

engine-advanced-report-h-figure-tiers = Уровни по показателям, указанные результатом

engine-advanced-report-th-figure = Показатель

engine-advanced-report-th-tier = Уровень

engine-advanced-report-th-matrix-requirement = Требование матрицы

engine-advanced-report-th-applicable = Применимо

engine-advanced-report-no-attack = нет (атака не настроена)

engine-advanced-report-h-not-modelled = 6. Не моделируется, и допущения

engine-advanced-report-not-modelled-note = Каждый пункт процитирован из места, где он заявлен: документа результата, каталога видов, файла сценария или причины, по которой строка матрицы верификации остаётся в статусе MODELLED.

engine-advanced-report-th-statement = Утверждение

engine-advanced-report-h-reproducibility = 7. Запись воспроизводимости

engine-advanced-report-rk-command = Команда для воспроизведения

engine-advanced-report-rk-working-directory = Рабочий каталог

engine-advanced-report-rk-engine-version = Версия движка

engine-advanced-report-rk-source-commit = Коммит исходного кода

engine-advanced-report-rk-scenario-file = Файл сценария

engine-advanced-report-rk-scenario-sha = SHA-256 файла сценария (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = Результат scenario_hash

engine-advanced-report-rk-result-sha = SHA-256 документа результата

engine-advanced-report-rk-seed = Начальное значение (seed)

engine-advanced-report-rk-platform = Платформа

engine-advanced-report-rk-generated = Исследование создано (UTC)

engine-advanced-report-rk-determinism = Детерминизм

engine-advanced-report-result-hash-none = документ результата его не указывает

engine-advanced-report-print-note = Чтобы напечатать эту страницу в файл Portable Document Format (PDF), откройте диалог печати браузера и выберите «Сохранить как PDF»; таблица стилей печати рассчитана на бумагу A4 и US Letter, повторяет заголовки таблиц на страницах и начинает разделы входных данных, результатов, меток и воспроизводимости с новой страницы. Сам движок PDF не записывает. report.json содержит то же содержимое, что и эта страница.

engine-advanced-report-footer = Создано Kshana { $engine }.{ $stamp } Воспроизводимо по сценарию, seed и версии движка. Свободное программное обеспечение с открытым исходным кодом (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">исходный код &amp; документация</a>.

engine-advanced-report-empty-inputs = Сценарий не задаёт ни одного поля, кроме `kind`: вид выполнил свою эталонную конфигурацию с документированными значениями по умолчанию.

engine-advanced-report-empty-scalars = Документ результата не содержит скаляров вне своих массивов; его числа ниже сведены по столбцам.

engine-advanced-report-empty-series = Документ результата не содержит числовых массивов: каждый результат является скаляром в таблице выше.

engine-advanced-report-empty-events = Нет событий во времени: сценарий не задаёт ни окна, ни момента начала, и результат не сообщает ни о каком событии. Вид оценивает свою конфигурацию как один случай.

engine-advanced-report-empty-not-modelled = Ни результат, ни каталог видов, ни сценарий, ни использованные строки матрицы не указывают ограничений моделирования для этого запуска.

engine-advanced-report-capabilities-statement = Каждая строка — это строка матрицы верификации, которую задействуют виды этого запуска, с меткой и оракулом, которые даёт ей матрица (src/verification.rs, docs/VERIFICATION-MATRIX.md). Метка оценивает возможность так, как её фиксирует матрица; она не оценивает конфигурацию этого сценария, и строка VALIDATED не делает входные данные запуска измеренными. Строка PARTNER — это дисциплина, на которую запуск опирается и которую Kshana не обеспечивает.

engine-advanced-report-no-run-label = Результат не содержит метки достоверности уровня запуска; метки верификации использованных им возможностей перечислены в отдельном разделе, а уровни по показателям — там, где их указывает результат.

engine-advanced-report-no-seed = Ни сценарий, ни результат не содержат seed. Результат полностью определяется файлом сценария и сборкой движка; тест детерминизма заново запускает каждый входящий в поставку сценарий и требует побайтно идентичного вывода.

engine-advanced-report-working-directory = Запускайте команду из каталога, в котором был начат исходный запуск: путь к сценарию и любой относительный путь к данным внутри сценария разрешаются относительно него. Сначала проверьте файл сценария по scenario_sha256.

engine-advanced-report-determinism-stamped = Те же байты сценария, seed и сборка движка дают тот же документ результата, кроме его метки meta.generated_utc, которую --study-name записывает по часам; запускайте без --study-name, чтобы получить побайтно идентичный вывод. Результаты с плавающей запятой фиксируются для каждой платформы; другая операционная система или архитектура может отличаться в последних разрядах.

engine-advanced-report-determinism-plain = Те же байты сценария, seed и сборка движка дают побайтно идентичные документ результата и отчёт; этот отчёт не содержит временной метки. Результаты с плавающей запятой фиксируются для каждой платформы; другая операционная система или архитектура может отличаться в последних разрядах.

engine-advanced-report-not-applicable-no-attack = неприменимо (атака не настроена)

engine-advanced-report-what-ran-default = Сценарий `{ $kind }`.

engine-advanced-report-nothing-carried = ничего не содержит

engine-advanced-report-tbl-sweep-nodes = Узлы перебора

engine-advanced-report-tbl-mc-summary = Сводка распределения Монте-Карло (процентили определяются по методу ближайшего ранга; 95% доверительный интервал среднего — процентильный бутстрэп с фиксированным seed)

engine-advanced-report-tbl-chain-phases = Фазы цепочки

engine-advanced-report-tbl-shared = Общие условия

engine-advanced-report-tbl-members = Участники

engine-advanced-report-tbl-combined = Объединённо по участникам

engine-advanced-report-tbl-optimiser-best = Лучший результат оптимизатора (локальный оптимум в заданных границах)

engine-advanced-report-tbl-optimiser-trace = Трасса оптимизатора

engine-advanced-report-tbl-sweep-grid = Сетка перебора

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Навигация по рельефу местности (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Навигация по карте гравитационного поля

engine-altpnt-terrain-title-combined = Комбинированный альтернативный PNT: гравитация + магнитное поле + рельеф

engine-altpnt-terrain-free-inertial-drift = дрейф свободной инерциальной навигации

engine-altpnt-terrain-terrain-matched = привязка к рельефу

engine-altpnt-terrain-gravity-matched = привязка к гравитационному полю

engine-altpnt-terrain-gravity-only = только гравитация

engine-altpnt-terrain-magnetic-only = только магнитное поле

engine-altpnt-terrain-terrain-only = только рельеф

engine-altpnt-terrain-combined-fused = комбинированный (объединённый)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · сценарий { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Поверхность атак на безопасность лунных сигналов (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = ретрансляторы в зоне видимости

engine-body-pnt-chart-count = количество

engine-body-pnt-chart-formal-one-sigma-position = формальная одна сигма положения (log10 m): только орбитальная группировка — синий, с дальностью до Земли — янтарный

engine-body-pnt-chart-time-since-epoch = время от эпохи, от 0 до { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = ошибка времени часов и защитный порог (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 и нижний порог слежения (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = уровень защиты и предел тревоги (m)

engine-campaign-chart-position-error-vs-threshold = ошибка положения и порог (m)

engine-campaign-chart-satellites-tracking = спутники в слежении

engine-campaign-chart-alarm-flags-and-events = флаги тревоги и события

engine-campaign-chart-mission-time = время миссии: { $duration } s

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) при { $lead }

engine-campaign-chart-monte-carlo-of = Монте-Карло для `{ $scenario_kind }`: начальные значения (seed): { $n_runs } от { $base_seed } (5-й, 50-й, 95-й процентиль; порог = бутстрэп 95% доверительного интервала среднего)

engine-campaign-chart-composed-members = составные участники при общих условиях: { $shared }

engine-campaign-chart-not-available = н/д

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Восстановление длины дуги в пространстве Земля–Луна — оценщик, не использующий общие якобианы

engine-cislunar-arc-recovery-chart-subtitle = пакетный метод наименьших квадратов на конечных разностях · измеренная ошибка восстановления состояния · без аналитического якобиана, без вариационной STM, без допуска по рангу SVD

engine-cislunar-arc-recovery-chart-bound = граница { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = порог ранга грамиана

engine-cislunar-arc-recovery-chart-monte-carlo-rms = RMS ошибки восстановления положения по методу Монте-Карло (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = наихудшее отношение восстановления без шума (итоговая ошибка / смещение)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Наблюдаемость в пространстве Земля–Луна на дуге слежения (P6)

engine-cislunar-observability-chart-subtitle = ранг и длина дуги (одиночная линия только по дальности) · собственный спектр грамиана · DRO ICs с дифференциальной коррекцией + перекрёстная проверка SRIF · проект: { $modelled }, ранг/STM/замыкание: { $validated }

engine-cislunar-observability-chart-observable-rank = наблюдаемый ранг и длина дуги

engine-cislunar-observability-chart-arc-length = длина дуги (единицы времени во вращающейся системе, всего { $arc_hours } h)

engine-cislunar-observability-chart-gramian-eigenvalues = собственные значения грамиана (log10)

engine-cislunar-observability-chart-condition = число обусловленности κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Устойчивость многоуровневого PNT в условиях конфликта (P7)

engine-conflict-resilience-chart-subtitle = полная потеря и интенсивность угрозы (Монте-Карло и замкнутая форма) · коэффициент устойчивости и корреляция отказов · априорные оценки: { $modelled }, Монте-Карло->замкнутая форма / маргиналы копулы: { $validated }

engine-conflict-resilience-chart-total-loss-probability = вероятность полной потери и интенсивность

engine-conflict-resilience-chart-threat-intensity = интенсивность угрозы

engine-conflict-resilience-chart-layered-mc = многоуровневый метод Монте-Карло

engine-conflict-resilience-chart-single-layer = один уровень

engine-conflict-resilience-chart-resilience-ratio = коэффициент устойчивости и корреляция отказов

engine-conflict-resilience-chart-denial-correlation = корреляция отказов ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = доступность (%)

engine-constellation-chart-mean-pdop = средний PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = GNSS Земли на лунном расстоянии — C/N0 в зависимости от угла от оси

engine-earth-gnss-lunar-chart-track-threshold = слежение { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = лимб Земли { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = угол от оси (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = золотой = доступен для слежения · красный = слишком слабый · серый = закрыт Землёй · диаграмма передачи: { $modelled }

## src/ensemble.rs

engine-ensemble-chart-title = Holdover часов: доверительная полоса ошибки времени (запусков: { $n_runs })

engine-ensemble-chart-timing-error-ns = ошибка времени (ns)

engine-ensemble-chart-spec-threshold = спецификация { $threshold } ns

engine-ensemble-chart-time-s = время (s)

engine-ensemble-chart-classical-median-band = классический: { $id } (медиана, полоса 5–95%)

engine-ensemble-chart-quantum-median-band = квантовый: { $id } (медиана, полоса 5–95%)

## src/frame_eop.rs

engine-frame-eop-chart-title = Бюджет прогноза систем координат / EOP в реальном времени для лунного времени

engine-frame-eop-chart-ut1-error-ms = ошибка UT1 (ms)

engine-frame-eop-chart-position-at-moon-m = положение у Луны (m)

engine-frame-eop-chart-equiv-timing-ns = эквивалентное время (ns)

engine-frame-eop-chart-prediction-horizon-days = горизонт прогноза (дни)

engine-frame-eop-chart-iers-final-floor = нижний предел итоговых данных IERS { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m у Луны

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = Гибридный UKF с 17 состояниями — самосогласованность фильтра (modelled)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + белизна инноваций и 95% полосы χ²; { $lit_1_0 } = согласованно. Самосогласованность, а не точность.

engine-fusion-hybrid-ukf-chart-target = цель { $lit_1_0 }

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (белизна)

engine-fusion-hybrid-ukf-chart-nees = NEES

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Горизонтальная ошибка слабосвязанного GNSS/INS

engine-fusion-pack-chart-horizontal-error-m = горизонтальная ошибка (m)

engine-fusion-pack-chart-spec-threshold = спецификация { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Скайплот ({ $label })

engine-geometry-chart-north = С

engine-geometry-chart-east = В

engine-geometry-chart-south = Ю

engine-geometry-chart-west = З

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (скрыт линией горизонта)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (ниже маски)

engine-geometry-chart-no-fix = нет решения

engine-geometry-chart-in-view-hidden = в зоне видимости: { $n_visible }, скрыто линией горизонта: { $n_masked } · { $dop } · пустой маркер: вне зоны видимости

engine-geometry-chart-satellites-as-given = спутники как заданы

engine-geometry-chart-representative-sky = типичное небо, а не на заданную дату

engine-geometry-chart-footer = Kshana v{ $version } · геометрия при заданной модели ошибок · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = Уровни защиты RAIM и пределы тревоги

engine-gnss-sim-chart-protection-level-m = уровень защиты (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

## src/holdover_test.rs

engine-holdover-test-chart-title = Тест holdover: ошибка времени по шагам

engine-holdover-test-chart-y-title = |ошибка времени| (ns)

engine-holdover-test-chart-panel-caption = абсолютная ошибка времени; шаг holdover закрашен; пунктирные линии — бюджеты ошибки времени

engine-holdover-test-chart-gnss-removed = GNSS отключён

engine-holdover-test-chart-gnss-restored = GNSS восстановлен

engine-holdover-test-chart-time-axis = время по оси записи ({ $min } min)

## src/hybrid.rs

engine-hybrid-chart-title = Использование спецификации гибридным PNT при отключении GNSS ({ $lit_1_0 } = спецификация)

engine-hybrid-chart-y-title = использование спецификации

engine-hybrid-chart-spec-line = спецификация ({ $lit_1_0 })

engine-hybrid-chart-classical-suite = классический комплект

engine-hybrid-chart-quantum-suite = квантовый комплект

## src/hybrid_integrity.rs

engine-hybrid-integrity-chart-availability = доступность

engine-hybrid-integrity-chart-precision = прецизионность

engine-hybrid-integrity-chart-integrity = целостность

engine-hybrid-integrity-chart-joint-indep = совместно (независимо)

engine-hybrid-integrity-chart-joint-corr = совместно (коррелированно)

engine-hybrid-integrity-chart-title = Совместный показатель качества гибридного оптического и радиочастотного PNT

engine-hybrid-integrity-chart-subtitle = P(доступно И прецизионного класса И целостность обеспечена)

## src/inertial/mod.rs

engine-inertial-chart-title = Ошибка положения при счислении пути во время отключения GNSS

engine-inertial-chart-y-title = ошибка положения (m)

engine-inertial-chart-spec-line = спецификация { $m } m

engine-inertial-chart-classical = классический: { $id }

engine-inertial-chart-quantum = квантовый: { $id }

## src/iq/campaign/report.rs

engine-iq-campaign-report-roc-aria-label = ROC обнаружения по мониторам

engine-iq-campaign-report-roc-x-title = P_fa (на отрицательное окно)

engine-iq-campaign-report-curve-aria-label = Деградация C/N0 в зависимости от заданного J/S для { $rec }, событие { $ev }

engine-iq-campaign-report-curve-x-title = заданное J/S (dB)

engine-iq-campaign-report-curve-y-title = деградация C/N0 (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: эталон SSC, Q = { $q }

engine-iq-campaign-report-curve-model-legend = эталон { $label } (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } серий в таблице оценок

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, измеренная деградация { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (измерено)

## src/jamming.rs

engine-jamming-chart-title = Видимые спутники и спутники в слежении при подавлении (jamming)

engine-jamming-chart-y-title = спутники

engine-jamming-chart-four-sv-fix = решение по 4 SV

engine-jamming-chart-visible = видимые

engine-jamming-chart-tracking = в слежении

## src/leo_fusion/ntn.rs

engine-leo-fusion-ntn-chart-title = Позиционирование 5G NTN: граница Крамера–Рао по дальности в зависимости от полосы

engine-leo-fusion-ntn-chart-caption = одна сигма дальности (log10 m): полоса = от маски до зенитного C/N0; точка = RMS ошибки 3D-решения

## src/leo_fusion/ppp.rs

engine-leo-fusion-ppp-chart-title = Сходимость PPP с дополнением LEO

engine-leo-fusion-ppp-chart-caption = медианная горизонтальная ошибка (log10 m) в зависимости от минут

engine-leo-fusion-ppp-chart-n-leo = LEO: { $n }

## src/leo_fusion/pvt_kind.rs

engine-leo-fusion-pvt-kind-chart-doppler-caption = ошибка 3D-решения по Доплеру (log10 m) в зависимости от длины окна

engine-leo-fusion-pvt-kind-chart-doppler-x-label = окно (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = медианные PDOP (синий) и VDOP (янтарный), log10, в зависимости от числа добавленных спутников LEO

engine-leo-fusion-pvt-kind-chart-joint-x-label = добавлено спутников LEO

engine-leo-fusion-pvt-kind-chart-polar-caption = медианный VDOP (log10): серый GNSS, синий LEO, янтарный объединённый

engine-leo-fusion-pvt-kind-chart-polar-x-label = широта (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = RMS ошибки времени относительно UTC (log10 ns) в зависимости от смещения C/N0, одна линия на генератор

engine-leo-fusion-pvt-kind-chart-timing-x-label = смещение C/N0 (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: от { $x0 } до { $x1 }

## src/leo_navmsg/mod.rs

engine-leo-navmsg-chart-title = Навигационное сообщение LEO: SISRE и интервал аппроксимации

engine-leo-navmsg-chart-no-trade-encode-decode = В этом запуске нет компромиссного анализа; таблицы кодирования/декодирования и бюджета см. в result.json.

engine-leo-navmsg-chart-no-fit-interval-trade = В этом запуске нет компромиссного анализа интервала аппроксимации; см. result.json.

engine-leo-navmsg-chart-caption = RMS SISRE только по орбите (m, логарифмическая шкала) и интервал аппроксимации (s)

## src/leo_pass.rs

engine-leo-pass-chart-title = Пролёт LEO: C/N0 по диапазонам и Доплер

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, от 20 до 80): диапазоны LEO цветом, GNSS серым

engine-leo-pass-chart-time-axis = время от эпохи, от 0 до { $s } s

## src/leo_pnt_chain.rs

engine-leo-pnt-chain-chart-subtitle = проект сигнала -> C/N0 пролёта и джиттер кода -> SISRE сообщения -> объединённое решение · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 отслеживаемой компоненты за пролёт (dB-Hz, от 20 до 80)

engine-leo-pnt-chain-chart-not-available = н/д

## src/leo_signal.rs

engine-leo-signal-chart-title = Проекты сигналов LEO-PNT

engine-leo-signal-chart-psd-axis = смещение в пределах ±{ $lit_0_6 } × полоса передачи; от 0 до −50 dB ниже каждого пика

engine-leo-signal-chart-jitter-caption = джиттер кода (m, логарифмическая шкала) и суммарный C/N0 (dB-Hz)

## src/main.rs

engine-main-fail = ошибка: { $e }

## plural forms

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one] журнал { $format }: пропущена { $n_missing } эпоха, разрывов: { $n_gaps }, сетка { $tau0 } s; задайте gaps = "longest", чтобы сохранить самый длинный участок без разрывов, или gaps = "linear" для интерполяции
        [few] журнал { $format }: пропущено { $n_missing } эпохи, разрывов: { $n_gaps }, сетка { $tau0 } s; задайте gaps = "longest", чтобы сохранить самый длинный участок без разрывов, или gaps = "linear" для интерполяции
        [many] журнал { $format }: пропущено { $n_missing } эпох, разрывов: { $n_gaps }, сетка { $tau0 } s; задайте gaps = "longest", чтобы сохранить самый длинный участок без разрывов, или gaps = "linear" для интерполяции
       *[other] журнал { $format }: пропущено { $n_missing } эпохи, разрывов: { $n_gaps }, сетка { $tau0 } s; задайте gaps = "longest", чтобы сохранить самый длинный участок без разрывов, или gaps = "linear" для интерполяции
    }

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } строка нечислового столбца
        [few] { $n } строки нечислового столбца
        [many] { $n } строк нечислового столбца
       *[other] { $n } строки нечислового столбца
    }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] duration x fps даёт { $n } кадр; для последовательности кадров нужно от 2 до { $v1 }
        [few] duration x fps даёт { $n } кадра; для последовательности кадров нужно от 2 до { $v1 }
        [many] duration x fps даёт { $n } кадров; для последовательности кадров нужно от 2 до { $v1 }
       *[other] duration x fps даёт { $n } кадра; для последовательности кадров нужно от 2 до { $v1 }
    }

engine-aocs-kind-aocs-wheels-slew-from-deg =
    { $n_w ->
        [one] aocs: { $n_w } маховик, разворот { $duration_s } s с { $series_err } deg -> { $settle } | итог { $final_err } deg | пик маховика { $peak_speed } rpm | { $v7 }
        [few] aocs: { $n_w } маховика, разворот { $duration_s } s с { $series_err } deg -> { $settle } | итог { $final_err } deg | пик маховика { $peak_speed } rpm | { $v7 }
        [many] aocs: { $n_w } маховиков, разворот { $duration_s } s с { $series_err } deg -> { $settle } | итог { $final_err } deg | пик маховика { $peak_speed } rpm | { $v7 }
       *[other] aocs: { $n_w } маховика, разворот { $duration_s } s с { $series_err } deg -> { $settle } | итог { $final_err } deg | пик маховика { $peak_speed } rpm | { $v7 }
    }

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] неизвестный вид сценария { $other } — возможно, вы имели в виду { $hint }? `kshana kinds` перечисляет все { $n } встроенный вид.
        [few] неизвестный вид сценария { $other } — возможно, вы имели в виду { $hint }? `kshana kinds` перечисляет все { $n } встроенных вида.
        [many] неизвестный вид сценария { $other } — возможно, вы имели в виду { $hint }? `kshana kinds` перечисляет все { $n } встроенных видов.
       *[other] неизвестный вид сценария { $other } — возможно, вы имели в виду { $hint }? `kshana kinds` перечисляет все { $n } встроенных вида.
    }

engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] неизвестный вид сценария { $other }. `kshana kinds` перечисляет все { $n } встроенный вид.
        [few] неизвестный вид сценария { $other }. `kshana kinds` перечисляет все { $n } встроенных вида.
        [many] неизвестный вид сценария { $other }. `kshana kinds` перечисляет все { $n } встроенных видов.
       *[other] неизвестный вид сценария { $other }. `kshana kinds` перечисляет все { $n } встроенных вида.
    }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] целостность | { $n_sats } спутник | доступных эпох: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): событий целостности: { $report2 }, HMI: { $report3 }
        [few] целостность | { $n_sats } спутника | доступных эпох: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): событий целостности: { $report2 }, HMI: { $report3 }
        [many] целостность | { $n_sats } спутников | доступных эпох: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): событий целостности: { $report2 }, HMI: { $report3 }
       *[other] целостность | { $n_sats } спутника | доступных эпох: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): событий целостности: { $report2 }, HMI: { $report3 }
    }

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_sat ->
        [one] lunar-joint-od-clock | { $n_sat } спутник, земных станций: { $n_earth } | 3-D ошибка станции с VLBI { $station_pos_err_m } m против только дальномерных { $station_pos_err_m2 } m (точнее в { $station_observability_improvement_factor }×) | СКО положения спутника { $sat_pos_rms_m } m | ошибка часов станции { $station_clock_err_s } s | набл. { $n_obs }/{ $n_params } парам.
        [few] lunar-joint-od-clock | { $n_sat } спутника, земных станций: { $n_earth } | 3-D ошибка станции с VLBI { $station_pos_err_m } m против только дальномерных { $station_pos_err_m2 } m (точнее в { $station_observability_improvement_factor }×) | СКО положения спутника { $sat_pos_rms_m } m | ошибка часов станции { $station_clock_err_s } s | набл. { $n_obs }/{ $n_params } парам.
        [many] lunar-joint-od-clock | { $n_sat } спутников, земных станций: { $n_earth } | 3-D ошибка станции с VLBI { $station_pos_err_m } m против только дальномерных { $station_pos_err_m2 } m (точнее в { $station_observability_improvement_factor }×) | СКО положения спутника { $sat_pos_rms_m } m | ошибка часов станции { $station_clock_err_s } s | набл. { $n_obs }/{ $n_params } парам.
       *[other] lunar-joint-od-clock | { $n_sat } спутника, земных станций: { $n_earth } | 3-D ошибка станции с VLBI { $station_pos_err_m } m против только дальномерных { $station_pos_err_m2 } m (точнее в { $station_observability_improvement_factor }×) | СКО положения спутника { $sat_pos_rms_m } m | ошибка часов станции { $station_clock_err_s } s | набл. { $n_obs }/{ $n_params } парам.
    }

engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } точка | ошибка сдвига { $trans_err_norm_m } m, ошибка поворота { $rot_err_norm_rad } rad, ошибка масштаба { $scale_err_ppb } ppb | остаточное RMS { $rms_residual_m } m | сошлось: { $converged }
        [few] lunar-frame-realisation | { $n_points } точки | ошибка сдвига { $trans_err_norm_m } m, ошибка поворота { $rot_err_norm_rad } rad, ошибка масштаба { $scale_err_ppb } ppb | остаточное RMS { $rms_residual_m } m | сошлось: { $converged }
        [many] lunar-frame-realisation | { $n_points } точек | ошибка сдвига { $trans_err_norm_m } m, ошибка поворота { $rot_err_norm_rad } rad, ошибка масштаба { $scale_err_ppb } ppb | остаточное RMS { $rms_residual_m } m | сошлось: { $converged }
       *[other] lunar-frame-realisation | { $n_points } точки | ошибка сдвига { $trans_err_norm_m } m, ошибка поворота { $rot_err_norm_rad } rad, ошибка масштаба { $scale_err_ppb } ppb | остаточное RMS { $rms_residual_m } m | сошлось: { $converged }
    }

engine-api-builtins-moonlight-service-volume-sats-pts =
    { $n_sats ->
        [one] moonlight-service-volume | { $n_sats } спутник ({ $geometry_label }) | точек: { $n_grid_points } × эпох: { $n_epochs } | покрытие { $coverage_pct }% (PDOP<{ $pdop_threshold }) | спутников { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | доступность PL { $pl_availability_pct }% | MODELLED
        [few] moonlight-service-volume | { $n_sats } спутника ({ $geometry_label }) | точек: { $n_grid_points } × эпох: { $n_epochs } | покрытие { $coverage_pct }% (PDOP<{ $pdop_threshold }) | спутников { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | доступность PL { $pl_availability_pct }% | MODELLED
        [many] moonlight-service-volume | { $n_sats } спутников ({ $geometry_label }) | точек: { $n_grid_points } × эпох: { $n_epochs } | покрытие { $coverage_pct }% (PDOP<{ $pdop_threshold }) | спутников { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | доступность PL { $pl_availability_pct }% | MODELLED
       *[other] moonlight-service-volume | { $n_sats } спутника ({ $geometry_label }) | точек: { $n_grid_points } × эпох: { $n_epochs } | покрытие { $coverage_pct }% (PDOP<{ $pdop_threshold }) | спутников { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | доступность PL { $pl_availability_pct }% | MODELLED
    }

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    { $n_sats ->
        [one] lunar-differential-pnt | { $n_sats } спутник (иллюстративный, класса LCNS, не аффилирован) | база { $baseline_km } km | ошибка пользователя { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (снижение в { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [few] lunar-differential-pnt | { $n_sats } спутника (иллюстративные, класса LCNS, не аффилированы) | база { $baseline_km } km | ошибка пользователя { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (снижение в { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [many] lunar-differential-pnt | { $n_sats } спутников (иллюстративные, класса LCNS, не аффилированы) | база { $baseline_km } km | ошибка пользователя { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (снижение в { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
       *[other] lunar-differential-pnt | { $n_sats } спутника (иллюстративные, класса LCNS, не аффилированы) | база { $baseline_km } km | ошибка пользователя { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (снижение в { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
    }

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } состояние, строк OEM: { $oem_line_count } | соответствие { $v5 } (присутствует полей: { $present_fields }, отсутствует: { $missing_fields }) | круговой обход OEM { $v8 } | круговой обход метаданных времени { $v9 } | KIF { $kif_bytes } bytes | MODELLED
        [few] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } состояния, строк OEM: { $oem_line_count } | соответствие { $v5 } (присутствует полей: { $present_fields }, отсутствует: { $missing_fields }) | круговой обход OEM { $v8 } | круговой обход метаданных времени { $v9 } | KIF { $kif_bytes } bytes | MODELLED
        [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } состояний, строк OEM: { $oem_line_count } | соответствие { $v5 } (присутствует полей: { $present_fields }, отсутствует: { $missing_fields }) | круговой обход OEM { $v8 } | круговой обход метаданных времени { $v9 } | KIF { $kif_bytes } bytes | MODELLED
       *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } состояния, строк OEM: { $oem_line_count } | соответствие { $v5 } (присутствует полей: { $present_fields }, отсутствует: { $missing_fields }) | круговой обход OEM { $v8 } | круговой обход метаданных времени { $v9 } | KIF { $kif_bytes } bytes | MODELLED
    }

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] сценарий { $r } | { $source } | { $n_samples } отсчёт | высота { $alt_min_km }–{ $alt_max_km } km | |широта| ≤ { $r2 }° | скорость { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [few] сценарий { $r } | { $source } | { $n_samples } отсчёта | высота { $alt_min_km }–{ $alt_max_km } km | |широта| ≤ { $r2 }° | скорость { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [many] сценарий { $r } | { $source } | { $n_samples } отсчётов | высота { $alt_min_km }–{ $alt_max_km } km | |широта| ≤ { $r2 }° | скорость { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] сценарий { $r } | { $source } | { $n_samples } отсчёта | высота { $alt_min_km }–{ $alt_max_km } km | |широта| ≤ { $r2 }° | скорость { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one] { " " }| RAIM доступен в { $n_available } из { $n_epochs } эпохи (отказов: { $n_denied }, тревог: { $n_alarm }; MODELLED)
        [few] { " " }| RAIM доступен в { $n_available } из { $n_epochs } эпох (отказов: { $n_denied }, тревог: { $n_alarm }; MODELLED)
        [many] { " " }| RAIM доступен в { $n_available } из { $n_epochs } эпох (отказов: { $n_denied }, тревог: { $n_alarm }; MODELLED)
       *[other] { " " }| RAIM доступен в { $n_available } из { $n_epochs } эпохи (отказов: { $n_denied }, тревог: { $n_alarm }; MODELLED)
    }

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] для априорных вероятностей нужны подмножества из { $n_fault_max } одновременного события; этот путь перебирает не более { $most }
        [few] для априорных вероятностей нужны подмножества из { $n_fault_max } одновременных событий; этот путь перебирает не более { $most }
        [many] для априорных вероятностей нужны подмножества из { $n_fault_max } одновременных событий; этот путь перебирает не более { $most }
       *[other] для априорных вероятностей нужны подмножества из { $n_fault_max } одновременного события; этот путь перебирает не более { $most }
    }

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] для случая `{ $id }` нужно { $n } значение, имеется: { $a }
        [few] для случая `{ $id }` нужно { $n } значения, имеется: { $a }
        [many] для случая `{ $id }` нужно { $n } значений, имеется: { $a }
       *[other] для случая `{ $id }` нужно { $n } значения, имеется: { $a }
    }

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } эпоха пользователя x 3 значения URA за { $dt } s = { $v1 } ms на эпоху пользователя (разрешимых: { $ok })
        [few] { $n } эпохи пользователя x 3 значения URA за { $dt } s = { $v1 } ms на эпоху пользователя (разрешимых: { $ok })
        [many] { $n } эпох пользователя x 3 значения URA за { $dt } s = { $v1 } ms на эпоху пользователя (разрешимых: { $ok })
       *[other] { $n } эпохи пользователя x 3 значения URA за { $dt } s = { $v1 } ms на эпоху пользователя (разрешимых: { $ok })
    }

engine-body-pnt-positioning-around-user-relays-at =
    { $n_relays ->
        [one] Позиционирование вокруг { $name } — пользователь: { $user_kind }, { $n_relays } ретранслятор на { $r } km, эпох: { $n_epochs }
            { "  " }Световое время до Земли { $one_way_light_time_s } s в одну сторону, { $two_way_light_time_s } s туда и обратно; угол Солнце–Земля–тело { $sun_separation_deg } deg
            { "  " }доступность: { $availability_relays } только орбитальная группировка, { $availability_with_earth } с дальностью до Земли (Земля в зоне видимости { $earth_visibility })
            { "  " }медианный PDOP { $opt }; ошибка RMS { $opt2 } только орбитальная группировка, { $opt3 } с дальностью до Земли
            { "  " }медианная формальная сигма { $opt4 } только орбитальная группировка, { $opt5 } с дальностью до Земли{ "\u000A" }
        [few] Позиционирование вокруг { $name } — пользователь: { $user_kind }, { $n_relays } ретранслятора на { $r } km, эпох: { $n_epochs }
            { "  " }Световое время до Земли { $one_way_light_time_s } s в одну сторону, { $two_way_light_time_s } s туда и обратно; угол Солнце–Земля–тело { $sun_separation_deg } deg
            { "  " }доступность: { $availability_relays } только орбитальная группировка, { $availability_with_earth } с дальностью до Земли (Земля в зоне видимости { $earth_visibility })
            { "  " }медианный PDOP { $opt }; ошибка RMS { $opt2 } только орбитальная группировка, { $opt3 } с дальностью до Земли
            { "  " }медианная формальная сигма { $opt4 } только орбитальная группировка, { $opt5 } с дальностью до Земли{ "\u000A" }
        [many] Позиционирование вокруг { $name } — пользователь: { $user_kind }, { $n_relays } ретрансляторов на { $r } km, эпох: { $n_epochs }
            { "  " }Световое время до Земли { $one_way_light_time_s } s в одну сторону, { $two_way_light_time_s } s туда и обратно; угол Солнце–Земля–тело { $sun_separation_deg } deg
            { "  " }доступность: { $availability_relays } только орбитальная группировка, { $availability_with_earth } с дальностью до Земли (Земля в зоне видимости { $earth_visibility })
            { "  " }медианный PDOP { $opt }; ошибка RMS { $opt2 } только орбитальная группировка, { $opt3 } с дальностью до Земли
            { "  " }медианная формальная сигма { $opt4 } только орбитальная группировка, { $opt5 } с дальностью до Земли{ "\u000A" }
       *[other] Позиционирование вокруг { $name } — пользователь: { $user_kind }, { $n_relays } ретранслятора на { $r } km, эпох: { $n_epochs }
            { "  " }Световое время до Земли { $one_way_light_time_s } s в одну сторону, { $two_way_light_time_s } s туда и обратно; угол Солнце–Земля–тело { $sun_separation_deg } deg
            { "  " }доступность: { $availability_relays } только орбитальная группировка, { $availability_with_earth } с дальностью до Земли (Земля в зоне видимости { $earth_visibility })
            { "  " }медианный PDOP { $opt }; ошибка RMS { $opt2 } только орбитальная группировка, { $opt3 } с дальностью до Земли
            { "  " }медианная формальная сигма { $opt4 } только орбитальная группировка, { $opt5 } с дальностью до Земли{ "\u000A" }
    }

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] пользователь: { $user_kind } · { $n_relays } ретранслятор · световое время до Земли { $one_way_light_time_s } s · MODELLED
        [few] пользователь: { $user_kind } · { $n_relays } ретранслятора · световое время до Земли { $one_way_light_time_s } s · MODELLED
        [many] пользователь: { $user_kind } · { $n_relays } ретрансляторов · световое время до Земли { $one_way_light_time_s } s · MODELLED
       *[other] пользователь: { $user_kind } · { $n_relays } ретранслятора · световое время до Земли { $one_way_light_time_s } s · MODELLED
    }

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state =
    { $n_spacecraft ->
        [one] cislunar-arc-recovery | семейство { $family }, состояний: { $state_dim }, { $n_spacecraft } аппарат, наблюдаемая { $observable }, параметризация { $coordinates } | дуга { $arc_hours } h, эпох: { $epochs } (сетка { $grid_hours } h), испытаний: { $trials }, начальное значение (seed) { $seed } | частные производные конечными разностями, без аналитического якобиана / STM / SVD / SRIF | восстановление без шума с { $nf } (коэффициент { $recovery_factor }) против порога ранга грамиана { $gram } | оцениваемость по Монте-Карло с { $est } (RMS положения ≤ { $error_bound_km } km, σ { $sigma_range_m } m) против оцениваемости по грамиану { $gram_est } | RMS положения в конце дуги { $last } km
        [few] cislunar-arc-recovery | семейство { $family }, состояний: { $state_dim }, { $n_spacecraft } аппарата, наблюдаемая { $observable }, параметризация { $coordinates } | дуга { $arc_hours } h, эпох: { $epochs } (сетка { $grid_hours } h), испытаний: { $trials }, начальное значение (seed) { $seed } | частные производные конечными разностями, без аналитического якобиана / STM / SVD / SRIF | восстановление без шума с { $nf } (коэффициент { $recovery_factor }) против порога ранга грамиана { $gram } | оцениваемость по Монте-Карло с { $est } (RMS положения ≤ { $error_bound_km } km, σ { $sigma_range_m } m) против оцениваемости по грамиану { $gram_est } | RMS положения в конце дуги { $last } km
        [many] cislunar-arc-recovery | семейство { $family }, состояний: { $state_dim }, { $n_spacecraft } аппаратов, наблюдаемая { $observable }, параметризация { $coordinates } | дуга { $arc_hours } h, эпох: { $epochs } (сетка { $grid_hours } h), испытаний: { $trials }, начальное значение (seed) { $seed } | частные производные конечными разностями, без аналитического якобиана / STM / SVD / SRIF | восстановление без шума с { $nf } (коэффициент { $recovery_factor }) против порога ранга грамиана { $gram } | оцениваемость по Монте-Карло с { $est } (RMS положения ≤ { $error_bound_km } km, σ { $sigma_range_m } m) против оцениваемости по грамиану { $gram_est } | RMS положения в конце дуги { $last } km
       *[other] cislunar-arc-recovery | семейство { $family }, состояний: { $state_dim }, { $n_spacecraft } аппарата, наблюдаемая { $observable }, параметризация { $coordinates } | дуга { $arc_hours } h, эпох: { $epochs } (сетка { $grid_hours } h), испытаний: { $trials }, начальное значение (seed) { $seed } | частные производные конечными разностями, без аналитического якобиана / STM / SVD / SRIF | восстановление без шума с { $nf } (коэффициент { $recovery_factor }) против порога ранга грамиана { $gram } | оцениваемость по Монте-Карло с { $est } (RMS положения ≤ { $error_bound_km } km, σ { $sigma_range_m } m) против оцениваемости по грамиану { $gram_est } | RMS положения в конце дуги { $last } km
    }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    { $n_links ->
        [one] cislunar-observability | аппаратов: { $c } ({ $refs } опорных) | дуга { $arc_hours } h, эпох: { $rank_arc } | ранг { $first } → { $last } из { $state_dim } по дуге | λ грамиана [{ $min_eigenvalue }…{ $max_eigenvalue }] число обусловленности { $condition_str } | мгновенный ранг только по дальности { $rank_range_only } → дальность+скорость { $rank_range_rate } ({ $n_links } связь) | GDOP только по дальности { $ro } дальность+скорость { $rr } | начальные условия DRO (максимальная невязка периодичности { $max_resid }) | апостериорная оценка SRIF конечна в эпоху ранга 4 { $srif_epoch } (подтверждены ранг/STM/замыкание DRO/SRIF, конструкция смоделирована)
        [few] cislunar-observability | аппаратов: { $c } ({ $refs } опорных) | дуга { $arc_hours } h, эпох: { $rank_arc } | ранг { $first } → { $last } из { $state_dim } по дуге | λ грамиана [{ $min_eigenvalue }…{ $max_eigenvalue }] число обусловленности { $condition_str } | мгновенный ранг только по дальности { $rank_range_only } → дальность+скорость { $rank_range_rate } ({ $n_links } связи) | GDOP только по дальности { $ro } дальность+скорость { $rr } | начальные условия DRO (максимальная невязка периодичности { $max_resid }) | апостериорная оценка SRIF конечна в эпоху ранга 4 { $srif_epoch } (подтверждены ранг/STM/замыкание DRO/SRIF, конструкция смоделирована)
        [many] cislunar-observability | аппаратов: { $c } ({ $refs } опорных) | дуга { $arc_hours } h, эпох: { $rank_arc } | ранг { $first } → { $last } из { $state_dim } по дуге | λ грамиана [{ $min_eigenvalue }…{ $max_eigenvalue }] число обусловленности { $condition_str } | мгновенный ранг только по дальности { $rank_range_only } → дальность+скорость { $rank_range_rate } ({ $n_links } связей) | GDOP только по дальности { $ro } дальность+скорость { $rr } | начальные условия DRO (максимальная невязка периодичности { $max_resid }) | апостериорная оценка SRIF конечна в эпоху ранга 4 { $srif_epoch } (подтверждены ранг/STM/замыкание DRO/SRIF, конструкция смоделирована)
       *[other] cislunar-observability | аппаратов: { $c } ({ $refs } опорных) | дуга { $arc_hours } h, эпох: { $rank_arc } | ранг { $first } → { $last } из { $state_dim } по дуге | λ грамиана [{ $min_eigenvalue }…{ $max_eigenvalue }] число обусловленности { $condition_str } | мгновенный ранг только по дальности { $rank_range_only } → дальность+скорость { $rank_range_rate } ({ $n_links } связи) | GDOP только по дальности { $ro } дальность+скорость { $rr } | начальные условия DRO (максимальная невязка периодичности { $max_resid }) | апостериорная оценка SRIF конечна в эпоху ранга 4 { $srif_epoch } (подтверждены ранг/STM/замыкание DRO/SRIF, конструкция смоделирована)
    }

engine-cislunar-observability-family-state-range-rank-threshold =
    { $n_spacecraft ->
        [one] { $base } | семейство { $family }, состояний: { $state_dim }, { $n_spacecraft } аппарат, σ_range { $sigma_range_m } m | порог ранга { $rank_thr } (сетка { $c } h) | порог оцениваемости (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }
        [few] { $base } | семейство { $family }, состояний: { $state_dim }, { $n_spacecraft } аппарата, σ_range { $sigma_range_m } m | порог ранга { $rank_thr } (сетка { $c } h) | порог оцениваемости (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }
        [many] { $base } | семейство { $family }, состояний: { $state_dim }, { $n_spacecraft } аппаратов, σ_range { $sigma_range_m } m | порог ранга { $rank_thr } (сетка { $c } h) | порог оцениваемости (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }
       *[other] { $base } | семейство { $family }, состояний: { $state_dim }, { $n_spacecraft } аппарата, σ_range { $sigma_range_m } m | порог ранга { $rank_thr } (сетка { $c } h) | порог оцениваемости (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }
    }

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] РАСШИРЕНИЕ (R3) — этот прогон НЕ является плоской конфигурацией DRO, которую описывает приведённая выше `label`. Размерность состояния { $state_dim }; семейство орбит { $family }; { $n_spacecraft } аппарат; сигма измерения дальности { $sigma_range_m } m. Там, где `label` говорит «planar» и «planar DROs», читайте названное здесь семейство. VALIDATED, дополнения: вариационная STM 6x6 это та же проверенная конечными разностями STM CR3BP (crate::cr3bp), что используется при полной ширине; строки пространственного якобиана дальности и скорости изменения дальности это аналитические частные производные, проверенные конечными разностями, причём строка скорости изменения дальности сверена покомпонентно с независимым трёхмерным deepspace_od::range_rate_observable из этого крейта; начальные условия halo / NRHO это периодические орбиты, скорректированные дифференциально тем же корректором, который воспроизводит опубликованную южную NRHO 9:2 у L2, продолженные от этого опубликованного начального приближения, и невязка замыкания каждого элемента приводится; шестикомпонентные вердикты по РАНГУ подтверждены НЕЗАВИСИМЫМ рангом по ступенчатому виду (метод Гаусса с частичным выбором ведущего элемента), не разделяющим кода с маршрутом через собственные значения/SVD. ЧЕСТНЫЕ РАМКИ ЗВЕНА SRIF: перекрёстная проверка SRIF выше использует ТЕ ЖЕ якобианы измерений и сводится к той же O^T O, поэтому её согласие это проверка согласованности двух численных механизмов, а НЕ независимое подтверждение порога — оно не засчитывается как подтверждение какого-либо значения здесь. MODELLED: проект семейства (какие абсциссы, амплитуды и фазы), сетка эпох, дуга с единственной связью и заявленная граница положения критерия оцениваемости.
        [few] РАСШИРЕНИЕ (R3) — этот прогон НЕ является плоской конфигурацией DRO, которую описывает приведённая выше `label`. Размерность состояния { $state_dim }; семейство орбит { $family }; { $n_spacecraft } аппарата; сигма измерения дальности { $sigma_range_m } m. Там, где `label` говорит «planar» и «planar DROs», читайте названное здесь семейство. VALIDATED, дополнения: вариационная STM 6x6 это та же проверенная конечными разностями STM CR3BP (crate::cr3bp), что используется при полной ширине; строки пространственного якобиана дальности и скорости изменения дальности это аналитические частные производные, проверенные конечными разностями, причём строка скорости изменения дальности сверена покомпонентно с независимым трёхмерным deepspace_od::range_rate_observable из этого крейта; начальные условия halo / NRHO это периодические орбиты, скорректированные дифференциально тем же корректором, который воспроизводит опубликованную южную NRHO 9:2 у L2, продолженные от этого опубликованного начального приближения, и невязка замыкания каждого элемента приводится; шестикомпонентные вердикты по РАНГУ подтверждены НЕЗАВИСИМЫМ рангом по ступенчатому виду (метод Гаусса с частичным выбором ведущего элемента), не разделяющим кода с маршрутом через собственные значения/SVD. ЧЕСТНЫЕ РАМКИ ЗВЕНА SRIF: перекрёстная проверка SRIF выше использует ТЕ ЖЕ якобианы измерений и сводится к той же O^T O, поэтому её согласие это проверка согласованности двух численных механизмов, а НЕ независимое подтверждение порога — оно не засчитывается как подтверждение какого-либо значения здесь. MODELLED: проект семейства (какие абсциссы, амплитуды и фазы), сетка эпох, дуга с единственной связью и заявленная граница положения критерия оцениваемости.
        [many] РАСШИРЕНИЕ (R3) — этот прогон НЕ является плоской конфигурацией DRO, которую описывает приведённая выше `label`. Размерность состояния { $state_dim }; семейство орбит { $family }; { $n_spacecraft } аппаратов; сигма измерения дальности { $sigma_range_m } m. Там, где `label` говорит «planar» и «planar DROs», читайте названное здесь семейство. VALIDATED, дополнения: вариационная STM 6x6 это та же проверенная конечными разностями STM CR3BP (crate::cr3bp), что используется при полной ширине; строки пространственного якобиана дальности и скорости изменения дальности это аналитические частные производные, проверенные конечными разностями, причём строка скорости изменения дальности сверена покомпонентно с независимым трёхмерным deepspace_od::range_rate_observable из этого крейта; начальные условия halo / NRHO это периодические орбиты, скорректированные дифференциально тем же корректором, который воспроизводит опубликованную южную NRHO 9:2 у L2, продолженные от этого опубликованного начального приближения, и невязка замыкания каждого элемента приводится; шестикомпонентные вердикты по РАНГУ подтверждены НЕЗАВИСИМЫМ рангом по ступенчатому виду (метод Гаусса с частичным выбором ведущего элемента), не разделяющим кода с маршрутом через собственные значения/SVD. ЧЕСТНЫЕ РАМКИ ЗВЕНА SRIF: перекрёстная проверка SRIF выше использует ТЕ ЖЕ якобианы измерений и сводится к той же O^T O, поэтому её согласие это проверка согласованности двух численных механизмов, а НЕ независимое подтверждение порога — оно не засчитывается как подтверждение какого-либо значения здесь. MODELLED: проект семейства (какие абсциссы, амплитуды и фазы), сетка эпох, дуга с единственной связью и заявленная граница положения критерия оцениваемости.
       *[other] РАСШИРЕНИЕ (R3) — этот прогон НЕ является плоской конфигурацией DRO, которую описывает приведённая выше `label`. Размерность состояния { $state_dim }; семейство орбит { $family }; { $n_spacecraft } аппарата; сигма измерения дальности { $sigma_range_m } m. Там, где `label` говорит «planar» и «planar DROs», читайте названное здесь семейство. VALIDATED, дополнения: вариационная STM 6x6 это та же проверенная конечными разностями STM CR3BP (crate::cr3bp), что используется при полной ширине; строки пространственного якобиана дальности и скорости изменения дальности это аналитические частные производные, проверенные конечными разностями, причём строка скорости изменения дальности сверена покомпонентно с независимым трёхмерным deepspace_od::range_rate_observable из этого крейта; начальные условия halo / NRHO это периодические орбиты, скорректированные дифференциально тем же корректором, который воспроизводит опубликованную южную NRHO 9:2 у L2, продолженные от этого опубликованного начального приближения, и невязка замыкания каждого элемента приводится; шестикомпонентные вердикты по РАНГУ подтверждены НЕЗАВИСИМЫМ рангом по ступенчатому виду (метод Гаусса с частичным выбором ведущего элемента), не разделяющим кода с маршрутом через собственные значения/SVD. ЧЕСТНЫЕ РАМКИ ЗВЕНА SRIF: перекрёстная проверка SRIF выше использует ТЕ ЖЕ якобианы измерений и сводится к той же O^T O, поэтому её согласие это проверка согласованности двух численных механизмов, а НЕ независимое подтверждение порога — оно не засчитывается как подтверждение какого-либо значения здесь. MODELLED: проект семейства (какие абсциссы, амплитуды и фазы), сетка эпох, дуга с единственной связью и заявленная граница положения критерия оцениваемости.
    }

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] integrity: { $n } эпоха превышает предел в { $MAX_EPOCHS } эпох; увеличьте step_s
        [few] integrity: { $n } эпохи превышают предел в { $MAX_EPOCHS } эпох; увеличьте step_s
        [many] integrity: { $n } эпох превышают предел в { $MAX_EPOCHS } эпох; увеличьте step_s
       *[other] integrity: { $n } эпохи превышают предел в { $MAX_EPOCHS } эпох; увеличьте step_s
    }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] Земной GNSS на лунном расстоянии — { $n_satellites } спутник, приёмник на { $r } km{ "\u000A" }
        [few] Земной GNSS на лунном расстоянии — { $n_satellites } спутника, приёмник на { $r } km{ "\u000A" }
        [many] Земной GNSS на лунном расстоянии — { $n_satellites } спутников, приёмник на { $r } km{ "\u000A" }
       *[other] Земной GNSS на лунном расстоянии — { $n_satellites } спутника, приёмник на { $r } km{ "\u000A" }
    }

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] трасса { $source } · { $n_samples } отсчёт · высота { $alt_min_km }–{ $alt_max_km } km · |широта| ≤ { $r }°
        [few] трасса { $source } · { $n_samples } отсчёта · высота { $alt_min_km }–{ $alt_max_km } km · |широта| ≤ { $r }°
        [many] трасса { $source } · { $n_samples } отсчётов · высота { $alt_min_km }–{ $alt_max_km } km · |широта| ≤ { $r }°
       *[other] трасса { $source } · { $n_samples } отсчёта · высота { $alt_min_km }–{ $alt_max_km } km · |широта| ≤ { $r }°
    }

engine-geometry-element-sets-propagated-by-the =
    { $n ->
        [one] { $n } набор элементов распространён алгоритмом SGP4 (WGS-72) движка на { $iso } и повёрнут в земную систему координат при UT1, принятом равным UTC, и без учёта движения полюса: это небо, которое этот набор элементов даёт на данную эпоху, а не его измерение.
        [few] { $n } набора элементов распространены алгоритмом SGP4 (WGS-72) движка на { $iso } и повёрнуты в земную систему координат при UT1, принятом равным UTC, и без учёта движения полюса: это небо, которое эти наборы элементов дают на данную эпоху, а не его измерение.
        [many] { $n } наборов элементов распространены алгоритмом SGP4 (WGS-72) движка на { $iso } и повёрнуты в земную систему координат при UT1, принятом равным UTC, и без учёта движения полюса: это небо, которое эти наборы элементов дают на данную эпоху, а не его измерение.
       *[other] { $n } набора элементов распространены алгоритмом SGP4 (WGS-72) движка на { $iso } и повёрнуты в земную систему координат при UT1, принятом равным UTC, и без учёта движения полюса: это небо, которое эти наборы элементов дают на данную эпоху, а не его измерение.
    }

engine-geometry-element-sets-propagated-by-the-2 =
    { $n ->
        [one] { $n } набор элементов распространён алгоритмом SGP4 (WGS-72) движка на эпоху самого нового набора элементов плюс time_s ({ $iso }). Эпоха не задана, поэтому это репрезентативное небо, а не небо на указанную дату.
        [few] { $n } набора элементов распространены алгоритмом SGP4 (WGS-72) движка на эпоху самого нового набора элементов плюс time_s ({ $iso }). Эпоха не задана, поэтому это репрезентативное небо, а не небо на указанную дату.
        [many] { $n } наборов элементов распространены алгоритмом SGP4 (WGS-72) движка на эпоху самого нового набора элементов плюс time_s ({ $iso }). Эпоха не задана, поэтому это репрезентативное небо, а не небо на указанную дату.
       *[other] { $n } набора элементов распространены алгоритмом SGP4 (WGS-72) движка на эпоху самого нового набора элементов плюс time_s ({ $iso }). Эпоха не задана, поэтому это репрезентативное небо, а не небо на указанную дату.
    }

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] сценарий даёт { $n } эпоху (нужно ≥ 2); увеличьте duration_s или уменьшите step_s
        [few] сценарий даёт { $n } эпохи (нужно ≥ 2); увеличьте duration_s или уменьшите step_s
        [many] сценарий даёт { $n } эпох (нужно ≥ 2); увеличьте duration_s или уменьшите step_s
       *[other] сценарий даёт { $n } эпохи (нужно ≥ 2); увеличьте duration_s или уменьшите step_s
    }

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | оптический след { $footprint_m } м, фотонов: { $detected_photons } -> σ дальнометрии { $c } мм, σ времени { $c2 } пс | cross-RAIM HPL { $hpl_m } м / VPL { $vpl_m } м / TPL { $c3 } нс ({ $v8 }) | доступность { $c4 }% ({ $n_sites } площадка) | передача без скачка { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | совместный FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | подтверждено: CRLB/χ²-PL/union/handoff, смоделировано: σ/климатология
        [few] hybrid-optical-rf | оптический след { $footprint_m } м, фотонов: { $detected_photons } -> σ дальнометрии { $c } мм, σ времени { $c2 } пс | cross-RAIM HPL { $hpl_m } м / VPL { $vpl_m } м / TPL { $c3 } нс ({ $v8 }) | доступность { $c4 }% ({ $n_sites } площадки) | передача без скачка { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | совместный FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | подтверждено: CRLB/χ²-PL/union/handoff, смоделировано: σ/климатология
        [many] hybrid-optical-rf | оптический след { $footprint_m } м, фотонов: { $detected_photons } -> σ дальнометрии { $c } мм, σ времени { $c2 } пс | cross-RAIM HPL { $hpl_m } м / VPL { $vpl_m } м / TPL { $c3 } нс ({ $v8 }) | доступность { $c4 }% ({ $n_sites } площадок) | передача без скачка { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | совместный FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | подтверждено: CRLB/χ²-PL/union/handoff, смоделировано: σ/климатология
       *[other] hybrid-optical-rf | оптический след { $footprint_m } м, фотонов: { $detected_photons } -> σ дальнометрии { $c } мм, σ времени { $c2 } пс | cross-RAIM HPL { $hpl_m } м / VPL { $vpl_m } м / TPL { $c3 } нс ({ $v8 }) | доступность { $c4 }% ({ $n_sites } площадки) | передача без скачка { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | совместный FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | подтверждено: CRLB/χ²-PL/union/handoff, смоделировано: σ/климатология
    }

engine-impairment-eval-impairment-eval-detector-auc-in =
    { $n_cases ->
        [one] impairment-eval | детектор { $detector } | AUC { $auc_in } на обучающих / { $auc_out } на отложенных (разрыв { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ цель { $target_pfa } | { $n_cases } случай | MODELLED, синтетические данные
        [few] impairment-eval | детектор { $detector } | AUC { $auc_in } на обучающих / { $auc_out } на отложенных (разрыв { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ цель { $target_pfa } | { $n_cases } случая | MODELLED, синтетические данные
        [many] impairment-eval | детектор { $detector } | AUC { $auc_in } на обучающих / { $auc_out } на отложенных (разрыв { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ цель { $target_pfa } | { $n_cases } случаев | MODELLED, синтетические данные
       *[other] impairment-eval | детектор { $detector } | AUC { $auc_in } на обучающих / { $auc_out } на отложенных (разрыв { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ цель { $target_pfa } | { $n_cases } случая | MODELLED, синтетические данные
    }

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } временной отсчёт, это больше, чем записывает экспорт ({ $MAX_SAMPLES })
        [few] { $n } временных отсчёта, это больше, чем записывает экспорт ({ $MAX_SAMPLES })
        [many] { $n } временных отсчётов, это больше, чем записывает экспорт ({ $MAX_SAMPLES })
       *[other] { $n } временных отсчёта, это больше, чем записывает экспорт ({ $MAX_SAMPLES })
    }

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } перечисляет { $n } значение; задайте по одному на id ({ $ids })
        [few] { $at }: { $key } перечисляет { $n } значения; задайте по одному на id ({ $ids })
        [many] { $at }: { $key } перечисляет { $n } значений; задайте по одному на id ({ $ids })
       *[other] { $at }: { $key } перечисляет { $n } значения; задайте по одному на id ({ $ids })
    }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to =
    { $n ->
        [one] { $code }: запись содержит отсчётов: { $buf }, для захвата нужно { $n } отсчёт
        [few] { $code }: запись содержит отсчётов: { $buf }, для захвата нужно { $n } отсчёта
        [many] { $code }: запись содержит отсчётов: { $buf }, для захвата нужно { $n } отсчётов
       *[other] { $code }: запись содержит отсчётов: { $buf }, для захвата нужно { $n } отсчёта
    }

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } принимает { $n } позиционный аргумент, получено: { $pos }
        [few] iq { $cmd } принимает { $n } позиционных аргумента, получено: { $pos }
        [many] iq { $cmd } принимает { $n } позиционных аргументов, получено: { $pos }
       *[other] iq { $cmd } принимает { $n } позиционных аргумента, получено: { $pos }
    }

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } принимает { $n } аргумент-путь, получено: { $pos }
        [few] iq { $cmd } принимает { $n } аргумента-пути, получено: { $pos }
        [many] iq { $cmd } принимает { $n } аргументов-путей, получено: { $pos }
       *[other] iq { $cmd } принимает { $n } аргумента-пути, получено: { $pos }
    }

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] записан { $n } отсчёт ({ $to }, { $fs_hz } Hz) в { $files }; элементов с насыщением: { $w }{ $v4 }
        [few] записано { $n } отсчёта ({ $to }, { $fs_hz } Hz) в { $files }; элементов с насыщением: { $w }{ $v4 }
        [many] записано { $n } отсчётов ({ $to }, { $fs_hz } Hz) в { $files }; элементов с насыщением: { $w }{ $v4 }
       *[other] записано { $n } отсчёта ({ $to }, { $fs_hz } Hz) в { $files }; элементов с насыщением: { $w }{ $v4 }
    }

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name }: захват на отсчёте { $sample_start } нарушает порядок или выходит за пределы { $n_file } отсчёта данных
        [few] { $name }: захват на отсчёте { $sample_start } нарушает порядок или выходит за пределы { $n_file } отсчётов данных
        [many] { $name }: захват на отсчёте { $sample_start } нарушает порядок или выходит за пределы { $n_file } отсчётов данных
       *[other] { $name }: захват на отсчёте { $sample_start } нарушает порядок или выходит за пределы { $n_file } отсчёта данных
    }

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] подгонка не выполнена: наблюдался { $n_reacq } повторный захват (нужно не менее 3)
        [few] подгонка не выполнена: наблюдалось { $n_reacq } повторных захвата (нужно не менее 3)
        [many] подгонка не выполнена: наблюдалось { $n_reacq } повторных захватов (нужно не менее 3)
       *[other] подгонка не выполнена: наблюдалось { $n_reacq } повторных захвата (нужно не менее 3)
    }

engine-iq-labfit-iqreport-threshold-direct-median-db-over =
    { $n ->
        [one] Пороговое J/S, прямое: медиана { $om } dB для { $n } потери (IQR { $t }).{ "\u000A\u000A" }
        [few] Пороговое J/S, прямое: медиана { $om } dB для { $n } потерь (IQR { $t }).{ "\u000A\u000A" }
        [many] Пороговое J/S, прямое: медиана { $om } dB для { $n } потерь (IQR { $t }).{ "\u000A\u000A" }
       *[other] Пороговое J/S, прямое: медиана { $om } dB для { $n } потери (IQR { $t }).{ "\u000A\u000A" }
    }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    { $n ->
        [one] { $model }: { $n } событие, RMS времени потери { $om } s, охват PI90 { $om2 }
        [few] { $model }: { $n } события, RMS времени потери { $om } s, охват PI90 { $om2 }
        [many] { $model }: { $n } событий, RMS времени потери { $om } s, охват PI90 { $om2 }
       *[other] { $model }: { $n } события, RMS времени потери { $om } s, охват PI90 { $om2 }
    }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } отсчёт C/N0, остаточное RMS { $om } dB.{ $r }{ "\u000A" }
        [few] { "\u000A" }{ $n_samples } отсчёта C/N0, остаточное RMS { $om } dB.{ $r }{ "\u000A" }
        [many] { "\u000A" }{ $n_samples } отсчётов C/N0, остаточное RMS { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } отсчёта C/N0, остаточное RMS { $om } dB.{ $r }{ "\u000A" }
    }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one] { "\u000A" }RMS времени события { $om } с для { $n_events } события; потери: пропущено { $loss_missed } / лишних { $loss_extra }, повторные захваты: пропущено { $reacq_missed } / лишних { $reacq_extra }.

            | прогон | падение dB-Hz | повторная фиксация dB-Hz | событий | RMS с |
            |---|---|---|---|---|{ "\u000A" }
        [few] { "\u000A" }RMS времени события { $om } с для { $n_events } событий; потери: пропущено { $loss_missed } / лишних { $loss_extra }, повторные захваты: пропущено { $reacq_missed } / лишних { $reacq_extra }.

            | прогон | падение dB-Hz | повторная фиксация dB-Hz | событий | RMS с |
            |---|---|---|---|---|{ "\u000A" }
        [many] { "\u000A" }RMS времени события { $om } с для { $n_events } событий; потери: пропущено { $loss_missed } / лишних { $loss_extra }, повторные захваты: пропущено { $reacq_missed } / лишних { $reacq_extra }.

            | прогон | падение dB-Hz | повторная фиксация dB-Hz | событий | RMS с |
            |---|---|---|---|---|{ "\u000A" }
       *[other] { "\u000A" }RMS времени события { $om } с для { $n_events } события; потери: пропущено { $loss_missed } / лишних { $loss_extra }, повторные захваты: пропущено { $reacq_missed } / лишних { $reacq_extra }.

            | прогон | падение dB-Hz | повторная фиксация dB-Hz | событий | RMS с |
            |---|---|---|---|---|{ "\u000A" }
    }

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] запрошен { $n } отсчёт; короткий прогон вмещает не более { $MAX_SAMPLES }
        [few] запрошено { $n } отсчёта; короткий прогон вмещает не более { $MAX_SAMPLES }
        [many] запрошено { $n } отсчётов; короткий прогон вмещает не более { $MAX_SAMPLES }
       *[other] запрошено { $n } отсчёта; короткий прогон вмещает не более { $MAX_SAMPLES }
    }

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path }: { $n } код, ICD определяет { $CODES_PER_COMPONENT }
        [few] { $path }: { $n } кода, ICD определяет { $CODES_PER_COMPONENT }
        [many] { $path }: { $n } кодов, ICD определяет { $CODES_PER_COMPONENT }
       *[other] { $path }: { $n } кода, ICD определяет { $CODES_PER_COMPONENT }
    }

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one] { $n_meas } измерение недостаточно для разрешения неизвестных Доплера: { $n }
        [few] { $n_meas } измерения недостаточно для разрешения неизвестных Доплера: { $n }
        [many] { $n_meas } измерений недостаточно для разрешения неизвестных Доплера: { $n }
       *[other] { $n_meas } измерения недостаточно для разрешения неизвестных Доплера: { $n }
    }

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    { $n ->
        [one] псевдодальностей: { $obs } недостаточно для разрешения { $n } неизвестной (3 положения + часов: { $n_clock })
        [few] псевдодальностей: { $obs } недостаточно для разрешения { $n } неизвестных (3 положения + часов: { $n_clock })
        [many] псевдодальностей: { $obs } недостаточно для разрешения { $n } неизвестных (3 положения + часов: { $n_clock })
       *[other] псевдодальностей: { $obs } недостаточно для разрешения { $n } неизвестной (3 положения + часов: { $n_clock })
    }

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] позиционирование 5G NTN на { $r } MHz, C/N0 от { $r2 } до { $r3 } dB-Hz, { $n_satellites } спутник (в зоне видимости: { $mean_in_view }){ "\u000A" }
        [few] позиционирование 5G NTN на { $r } MHz, C/N0 от { $r2 } до { $r3 } dB-Hz, { $n_satellites } спутника (в зоне видимости: { $mean_in_view }){ "\u000A" }
        [many] позиционирование 5G NTN на { $r } MHz, C/N0 от { $r2 } до { $r3 } dB-Hz, { $n_satellites } спутников (в зоне видимости: { $mean_in_view }){ "\u000A" }
       *[other] позиционирование 5G NTN на { $r } MHz, C/N0 от { $r2 } до { $r3 } dB-Hz, { $n_satellites } спутника (в зоне видимости: { $mean_in_view }){ "\u000A" }
    }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }доплеровский пролёт одного спутника: { $n_obs } отсчёт за { $duration_s } s, горизонтальная ошибка { $horizontal_error_m } m{ "\u000A" }
        [few] { "  " }доплеровский пролёт одного спутника: { $n_obs } отсчёта за { $duration_s } s, горизонтальная ошибка { $horizontal_error_m } m{ "\u000A" }
        [many] { "  " }доплеровский пролёт одного спутника: { $n_obs } отсчётов за { $duration_s } s, горизонтальная ошибка { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }доплеровский пролёт одного спутника: { $n_obs } отсчёта за { $duration_s } s, горизонтальная ошибка { $horizontal_error_m } m{ "\u000A" }
    }

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] сходимость PPP до { $criterion_horizontal_m } m по горизонтали / { $criterion_vertical_m } m по вертикали, прогонов на случай: { $runs_per_case }, { $n_gnss } спутник GNSS{ "\u000A" }
        [few] сходимость PPP до { $criterion_horizontal_m } m по горизонтали / { $criterion_vertical_m } m по вертикали, прогонов на случай: { $runs_per_case }, { $n_gnss } спутника GNSS{ "\u000A" }
        [many] сходимость PPP до { $criterion_horizontal_m } m по горизонтали / { $criterion_vertical_m } m по вертикали, прогонов на случай: { $runs_per_case }, { $n_gnss } спутников GNSS{ "\u000A" }
       *[other] сходимость PPP до { $criterion_horizontal_m } m по горизонтали / { $criterion_vertical_m } m по вертикали, прогонов на случай: { $runs_per_case }, { $n_gnss } спутника GNSS{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-sats-at-km-mhz =
    { $n_satellites ->
        [one] { "  " }{ $name } { $role }: { $n_satellites } спутник на высоте { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
        [few] { "  " }{ $name } { $role }: { $n_satellites } спутника на высоте { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
        [many] { "  " }{ $name } { $role }: { $n_satellites } спутников на высоте { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
       *[other] { "  " }{ $name } { $role }: { $n_satellites } спутника на высоте { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one] { "  " }доплеровское определение: { $n_obs } измерение (от спутников: { $n_sats }), 3D ошибка { $error_3d_m } m (горизонтальная { $horizontal_error_m } m){ "\u000A" }
        [few] { "  " }доплеровское определение: { $n_obs } измерения (от спутников: { $n_sats }), 3D ошибка { $error_3d_m } m (горизонтальная { $horizontal_error_m } m){ "\u000A" }
        [many] { "  " }доплеровское определение: { $n_obs } измерений (от спутников: { $n_sats }), 3D ошибка { $error_3d_m } m (горизонтальная { $horizontal_error_m } m){ "\u000A" }
       *[other] { "  " }доплеровское определение: { $n_obs } измерения (от спутников: { $n_sats }), 3D ошибка { $error_3d_m } m (горизонтальная { $horizontal_error_m } m){ "\u000A" }
    }

engine-leo-fusion-pvt-kind-window-sats-3d-error =
    { $n_sats ->
        [one] { "    " }окно { $window_s } s: { $n_sats } спутник, 3D ошибка { $f } m{ "\u000A" }
        [few] { "    " }окно { $window_s } s: { $n_sats } спутника, 3D ошибка { $f } m{ "\u000A" }
        [many] { "    " }окно { $window_s } s: { $n_sats } спутников, 3D ошибка { $f } m{ "\u000A" }
       *[other] { "    " }окно { $window_s } s: { $n_sats } спутника, 3D ошибка { $f } m{ "\u000A" }
    }

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live: отброшена { $n } udp-датаграмма, которую движок не смог принять (всего { $udp_dropped })
        [few] kshana live: отброшено { $n } udp-датаграммы, которые движок не смог принять (всего { $udp_dropped })
        [many] kshana live: отброшено { $n } udp-датаграмм, которые движок не смог принять (всего { $udp_dropped })
       *[other] kshana live: отброшено { $n } udp-датаграммы, которые движок не смог принять (всего { $udp_dropped })
    }

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines =
    { $n_beacons ->
        [one] lunar-frame-campaign | { $n_beacons } маяк x базовых линий: { $v1 } x эпох: { $n_epochs } = наблюдений: { $n_obs } (delay sigma { $sigma_tau } s) | datum станций { $station_datum } | ранг Гельмерта { $rank }/7 cond { $condition } | sigma сдвига датума { $v5 } против ошибки восстановления внесённого преобразования { $trans_err_norm_m } m (отношение { $v7 })
        [few] lunar-frame-campaign | { $n_beacons } маяка x базовых линий: { $v1 } x эпох: { $n_epochs } = наблюдений: { $n_obs } (delay sigma { $sigma_tau } s) | datum станций { $station_datum } | ранг Гельмерта { $rank }/7 cond { $condition } | sigma сдвига датума { $v5 } против ошибки восстановления внесённого преобразования { $trans_err_norm_m } m (отношение { $v7 })
        [many] lunar-frame-campaign | { $n_beacons } маяков x базовых линий: { $v1 } x эпох: { $n_epochs } = наблюдений: { $n_obs } (delay sigma { $sigma_tau } s) | datum станций { $station_datum } | ранг Гельмерта { $rank }/7 cond { $condition } | sigma сдвига датума { $v5 } против ошибки восстановления внесённого преобразования { $trans_err_norm_m } m (отношение { $v7 })
       *[other] lunar-frame-campaign | { $n_beacons } маяка x базовых линий: { $v1 } x эпох: { $n_epochs } = наблюдений: { $n_obs } (delay sigma { $sigma_tau } s) | datum станций { $station_datum } | ранг Гельмерта { $rank }/7 cond { $condition } | sigma сдвига датума { $v5 } против ошибки восстановления внесённого преобразования { $trans_err_norm_m } m (отношение { $v7 })
    }

engine-lunar-jamming-lunar-jamming-sats-epochs-links =
    { $n_sats ->
        [one] lunar-jamming | { $n_sats } спутник, эпох: { $n_epochs }, линий связи: { $n_links } из ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (среднее { $mean_js_db }) | LOST: { $n_lost } | доступность { $availability_under_jamming } при номинальной { $availability_nominal }
        [few] lunar-jamming | { $n_sats } спутника, эпох: { $n_epochs }, линий связи: { $n_links } из ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (среднее { $mean_js_db }) | LOST: { $n_lost } | доступность { $availability_under_jamming } при номинальной { $availability_nominal }
        [many] lunar-jamming | { $n_sats } спутников, эпох: { $n_epochs }, линий связи: { $n_links } из ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (среднее { $mean_js_db }) | LOST: { $n_lost } | доступность { $availability_under_jamming } при номинальной { $availability_nominal }
       *[other] lunar-jamming | { $n_sats } спутника, эпох: { $n_epochs }, линий связи: { $n_links } из ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (среднее { $mean_js_db }) | LOST: { $n_lost } | доступность { $availability_under_jamming } при номинальной { $availability_nominal }
    }

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 =
    { $n_sats ->
        [one] lunar-jamming | { $n_sats } спутник, эпох: { $n_epochs }, линий связи: { $n_links } из ({ $site_lat_deg }, { $site_lon_deg }) | без источника помех (лунный базис при чистом небе) | LOST: { $n_lost } | доступность { $availability_nominal }
        [few] lunar-jamming | { $n_sats } спутника, эпох: { $n_epochs }, линий связи: { $n_links } из ({ $site_lat_deg }, { $site_lon_deg }) | без источника помех (лунный базис при чистом небе) | LOST: { $n_lost } | доступность { $availability_nominal }
        [many] lunar-jamming | { $n_sats } спутников, эпох: { $n_epochs }, линий связи: { $n_links } из ({ $site_lat_deg }, { $site_lon_deg }) | без источника помех (лунный базис при чистом небе) | LOST: { $n_lost } | доступность { $availability_nominal }
       *[other] lunar-jamming | { $n_sats } спутника, эпох: { $n_epochs }, линий связи: { $n_links } из ({ $site_lat_deg }, { $site_lon_deg }) | без источника помех (лунный базис при чистом небе) | LOST: { $n_lost } | доступность { $availability_nominal }
    }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule =
    { $n_epochs ->
        [one] ни одно наблюдение расписания не проходит маску угла места { $mask } deg на обоих концах базовой линии: { $n_epochs } эпоха x базовых линий: { $v1 }, все отклонены. Увеличьте arc_hours, снизьте elevation_mask_deg или переместите станции.
        [few] ни одно наблюдение расписания не проходит маску угла места { $mask } deg на обоих концах базовой линии: { $n_epochs } эпохи x базовых линий: { $v1 }, все отклонены. Увеличьте arc_hours, снизьте elevation_mask_deg или переместите станции.
        [many] ни одно наблюдение расписания не проходит маску угла места { $mask } deg на обоих концах базовой линии: { $n_epochs } эпох x базовых линий: { $v1 }, все отклонены. Увеличьте arc_hours, снизьте elevation_mask_deg или переместите станции.
       *[other] ни одно наблюдение расписания не проходит маску угла места { $mask } deg на обоих концах базовой линии: { $n_epochs } эпохи x базовых линий: { $v1 }, все отклонены. Увеличьте arc_hours, снизьте elevation_mask_deg или переместите станции.
    }

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines =
    { $n_stations ->
        [one] lunar-vlbi-fim | { $n_stations } станция / базовых линий: { $v2 } x эпох: { $n_epochs } = наблюдений: { $n_obs } (маска { $mask } deg) | датум { $datum } | ранг { $rank }/{ $dim } cond { $condition } | sigma станции { $v10 } против equipartition g={ $g } { $eq_g } m (отношение { $v13 })
        [few] lunar-vlbi-fim | { $n_stations } станции / базовых линий: { $v2 } x эпох: { $n_epochs } = наблюдений: { $n_obs } (маска { $mask } deg) | датум { $datum } | ранг { $rank }/{ $dim } cond { $condition } | sigma станции { $v10 } против equipartition g={ $g } { $eq_g } m (отношение { $v13 })
        [many] lunar-vlbi-fim | { $n_stations } станций / базовых линий: { $v2 } x эпох: { $n_epochs } = наблюдений: { $n_obs } (маска { $mask } deg) | датум { $datum } | ранг { $rank }/{ $dim } cond { $condition } | sigma станции { $v10 } против equipartition g={ $g } { $eq_g } m (отношение { $v13 })
       *[other] lunar-vlbi-fim | { $n_stations } станции / базовых линий: { $v2 } x эпох: { $n_epochs } = наблюдений: { $n_obs } (маска { $mask } deg) | датум { $datum } | ранг { $rank }/{ $dim } cond { $condition } | sigma станции { $v10 } против equipartition g={ $g } { $eq_g } m (отношение { $v13 })
    }

engine-mars-pnt-mars-pnt-user-clock-relays =
    { $n_relays ->
        [one] mars-pnt { $r } | пользователь { $user }, часы { $clock_class } | { $n_relays } ретранслятор (в среднем в зоне видимости: { $mean_relays_in_view }) | сошедшаяся RMS положения { $converged_pos_rms_m } m, формальная 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — показатель качества по ковариации, не утверждённый PL) | σ частоты часов { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
        [few] mars-pnt { $r } | пользователь { $user }, часы { $clock_class } | { $n_relays } ретранслятора (в среднем в зоне видимости: { $mean_relays_in_view }) | сошедшаяся RMS положения { $converged_pos_rms_m } m, формальная 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — показатель качества по ковариации, не утверждённый PL) | σ частоты часов { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
        [many] mars-pnt { $r } | пользователь { $user }, часы { $clock_class } | { $n_relays } ретрансляторов (в среднем в зоне видимости: { $mean_relays_in_view }) | сошедшаяся RMS положения { $converged_pos_rms_m } m, формальная 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — показатель качества по ковариации, не утверждённый PL) | σ частоты часов { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
       *[other] mars-pnt { $r } | пользователь { $user }, часы { $clock_class } | { $n_relays } ретранслятора (в среднем в зоне видимости: { $mean_relays_in_view }) | сошедшаяся RMS положения { $converged_pos_rms_m } m, формальная 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — показатель качества по ковариации, не утверждённый PL) | σ частоты часов { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
    }

engine-e-mcda-copras-copras-weights-but-criterion-types =
    { $n ->
        [one] COPRAS: { $n } вес, а типов критериев: { $types }
        [few] COPRAS: { $n } веса, а типов критериев: { $types }
        [many] COPRAS: { $n } весов, а типов критериев: { $types }
       *[other] COPRAS: { $n } веса, а типов критериев: { $types }
    }

engine-e-mcda-moora-moora-weights-but-criterion-types =
    { $n ->
        [one] MOORA: { $n } вес, а типов критериев: { $types }
        [few] MOORA: { $n } веса, а типов критериев: { $types }
        [many] MOORA: { $n } весов, а типов критериев: { $types }
       *[other] MOORA: { $n } веса, а типов критериев: { $types }
    }

engine-e-mcda-promethee-promethee-ii-weights-but-types =
    { $n ->
        [one] PROMETHEE II: { $n } вес, а типов: { $types } / функций предпочтения: { $prefs }
        [few] PROMETHEE II: { $n } веса, а типов: { $types } / функций предпочтения: { $prefs }
        [many] PROMETHEE II: { $n } весов, а типов: { $types } / функций предпочтения: { $prefs }
       *[other] PROMETHEE II: { $n } веса, а типов: { $types } / функций предпочтения: { $prefs }
    }

engine-e-mcda-topsis-topsis-weights-but-criterion-types =
    { $n ->
        [one] TOPSIS: { $n } вес, а типов критериев: { $types }
        [few] TOPSIS: { $n } веса, а типов критериев: { $types }
        [many] TOPSIS: { $n } весов, а типов критериев: { $types }
       *[other] TOPSIS: { $n } веса, а типов критериев: { $types }
    }

engine-e-mcda-vikor-vikor-weights-but-criterion-types =
    { $n ->
        [one] VIKOR: { $n } вес, а типов критериев: { $types }
        [few] VIKOR: { $n } веса, а типов критериев: { $types }
        [many] VIKOR: { $n } весов, а типов критериев: { $types }
       *[other] VIKOR: { $n } веса, а типов критериев: { $types }
    }

engine-e-mcda-waspas-waspas-weights-but-criterion-types =
    { $n ->
        [one] WASPAS: { $n } вес, а типов критериев: { $types }
        [few] WASPAS: { $n } веса, а типов критериев: { $types }
        [many] WASPAS: { $n } весов, а типов критериев: { $types }
       *[other] WASPAS: { $n } веса, а типов критериев: { $types }
    }

engine-e-mcda-wpm-wpm-weights-but-criterion-types =
    { $n ->
        [one] WPM: { $n } вес, а типов критериев: { $types }
        [few] WPM: { $n } веса, а типов критериев: { $types }
        [many] WPM: { $n } весов, а типов критериев: { $types }
       *[other] WPM: { $n } веса, а типов критериев: { $types }
    }

engine-e-naif-kernel-daf-summary-record-claims-summaries =
    { $count ->
        [one] запись сводок DAF { $rec } заявляет { $count } сводку
        [few] запись сводок DAF { $rec } заявляет { $count } сводки
        [many] запись сводок DAF { $rec } заявляет { $count } сводок
       *[other] запись сводок DAF { $rec } заявляет { $count } сводки
    }

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    { $n_used ->
        [one] приёмник снова сообщает решение (использован { $n_used } спутник)
        [few] приёмник снова сообщает решение (использовано { $n_used } спутника)
        [many] приёмник снова сообщает решение (использовано { $n_used } спутников)
       *[other] приёмник снова сообщает решение (использовано { $n_used } спутника)
    }

engine-nmea-synth-gen-the-receiver-has-no-fix =
    { $n_used ->
        [one] у приёмника нет решения ({ $n_used } пригодный спутник, нужно четыре)
        [few] у приёмника нет решения ({ $n_used } пригодных спутника, нужно четыре)
        [many] у приёмника нет решения ({ $n_used } пригодных спутников, нужно четыре)
       *[other] у приёмника нет решения ({ $n_used } пригодных спутника, нужно четыре)
    }

engine-observability-gramian-gdop-undefined-rank-deficient-singular =
    { $n ->
        [one] GDOP не определён (геометрия с дефицитом ранга / сингулярная): ранг { $rank } из { $n } состояния, дефект датума { $v3 }, обусловленность { $v4 }
        [few] GDOP не определён (геометрия с дефицитом ранга / сингулярная): ранг { $rank } из { $n } состояний, дефект датума { $v3 }, обусловленность { $v4 }
        [many] GDOP не определён (геометрия с дефицитом ранга / сингулярная): ранг { $rank } из { $n } состояний, дефект датума { $v3 }, обусловленность { $v4 }
       *[other] GDOP не определён (геометрия с дефицитом ранга / сингулярная): ранг { $rank } из { $n } состояния, дефект датума { $v3 }, обусловленность { $v4 }
    }

engine-oem-oem-interop-round-tripped-segment =
    { $n_states_total ->
        [one] oem-interop: сегментов в круговом преобразовании: { $segments }, { $n_states_total } состояние; максимальная ошибка кругового преобразования { $p } km / { $v } km/s (MODELLED interop)
        [few] oem-interop: сегментов в круговом преобразовании: { $segments }, { $n_states_total } состояния; максимальная ошибка кругового преобразования { $p } km / { $v } km/s (MODELLED interop)
        [many] oem-interop: сегментов в круговом преобразовании: { $segments }, { $n_states_total } состояний; максимальная ошибка кругового преобразования { $p } km / { $v } km/s (MODELLED interop)
       *[other] oem-interop: сегментов в круговом преобразовании: { $segments }, { $n_states_total } состояния; максимальная ошибка кругового преобразования { $p } km / { $v } km/s (MODELLED interop)
    }

engine-oem-oem-interop-ingested-segment-states =
    { $n_states_total ->
        [one] oem-interop: принято сегментов: { $segments }, { $n_states_total } состояние из внешнего OEM (отправитель { $originator }) (MODELLED interop)
        [few] oem-interop: принято сегментов: { $segments }, { $n_states_total } состояния из внешнего OEM (отправитель { $originator }) (MODELLED interop)
        [many] oem-interop: принято сегментов: { $segments }, { $n_states_total } состояний из внешнего OEM (отправитель { $originator }) (MODELLED interop)
       *[other] oem-interop: принято сегментов: { $segments }, { $n_states_total } состояния из внешнего OEM (отправитель { $originator }) (MODELLED interop)
    }

engine-pvt-pvt-sat-nav-epochs-solved =
    { $n_satellites_nav ->
        [one] pvt { $r } | { $n_satellites_nav } спутник навигации | решено эпох: { $epochs_solved }/{ $epochs_total } | в среднем спутников: { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
        [few] pvt { $r } | { $n_satellites_nav } спутника навигации | решено эпох: { $epochs_solved }/{ $epochs_total } | в среднем спутников: { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
        [many] pvt { $r } | { $n_satellites_nav } спутников навигации | решено эпох: { $epochs_solved }/{ $epochs_total } | в среднем спутников: { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
       *[other] pvt { $r } | { $n_satellites_nav } спутника навигации | решено эпох: { $epochs_solved }/{ $epochs_total } | в среднем спутников: { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
    }

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    { $n_used ->
        [one] geometry { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } спутник{ $v6 }
        [few] geometry { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } спутника{ $v6 }
        [many] geometry { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } спутников{ $v6 }
       *[other] geometry { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } спутника{ $v6 }
    }

engine-solar-system-solar-system-at-jd-tdb =
    { $n_bodies ->
        [one] Солнечная система на { $input } (JD { $jd_tdb } TDB), { $n_bodies } тело, наблюдатель { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
        [few] Солнечная система на { $input } (JD { $jd_tdb } TDB), { $n_bodies } тела, наблюдатель { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
        [many] Солнечная система на { $input } (JD { $jd_tdb } TDB), { $n_bodies } тел, наблюдатель { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
       *[other] Солнечная система на { $input } (JD { $jd_tdb } TDB), { $n_bodies } тела, наблюдатель { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
    }

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] состояний: { $states } на { $n } эпоху
        [few] состояний: { $states } на { $n } эпохи
        [many] состояний: { $states } на { $n } эпох
       *[other] состояний: { $states } на { $n } эпохи
    }

engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } состояние; степени { $degree } нужно { $value }
        [few] { $n } состояния; степени { $degree } нужно { $value }
        [many] { $n } состояний; степени { $degree } нужно { $value }
       *[other] { $n } состояния; степени { $degree } нужно { $value }
    }

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] эпох: { $epochs }, на { $n } строку разностей
        [few] эпох: { $epochs }, на { $n } строки разностей
        [many] эпох: { $epochs }, на { $n } строк разностей
       *[other] эпох: { $epochs }, на { $n } строки разностей
    }

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: сформирован { $packet_count } пакет CCSDS-133.0 { $v2 }, APID { $apid }, всего октетов: { $total_bytes }, круговое преобразование точное ({ $round_trip_ok })
        [few] space-packet: сформировано { $packet_count } пакета CCSDS-133.0 { $v2 }, APID { $apid }, всего октетов: { $total_bytes }, круговое преобразование точное ({ $round_trip_ok })
        [many] space-packet: сформировано { $packet_count } пакетов CCSDS-133.0 { $v2 }, APID { $apid }, всего октетов: { $total_bytes }, круговое преобразование точное ({ $round_trip_ok })
       *[other] space-packet: сформировано { $packet_count } пакета CCSDS-133.0 { $v2 }, APID { $apid }, всего октетов: { $total_bytes }, круговое преобразование точное ({ $round_trip_ok })
    }

engine-slot-timing-slot-timing-source-guard-ns = slot-timing (источник { $n }): защитный интервал { $c } ns при k={ $k_sigma } нарушается через { $fmt_s } после фиксации (осталось { $fmt_s2 }); фиксация нужна не реже чем через { $fmt_s3 } ({ $fixes_per_day } в сутки); доминирующий член: { $b }{ $v9 }

## legal

# legal: native review
engine-legal-compliance-statement = Строка с пометкой «evidenced» означает, что запуск из этого набора подкрепляет доказательствами возможности, названные в строке. Это не вывод о том, что требования рамочного документа выполнены, и не означает, что какой-либо продукт кем-либо оценён или утверждён. Столбец пробелов указывает, чего запуски не показывают.

# legal: native review
engine-legal-bench-surface-notice = Только движение транспортного средства и размеченные интервалы событий. Ничто из экспортированного здесь не является радиочастотным сигналом или сигналом в основной полосе, не моделирует такой сигнал и не управляет им, а событие — это временной интервал, а не рецепт создания помех. Сигналы поставляют лабораторный симулятор и его оператор, которые отвечают за их запуск только там, где это разрешено (по кабелю или в экранированном помещении, согласно собственным инструкциям по безопасности симулятора). Kshana не публикует никаких результатов таких запусков.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC на уровне окон для каждого монитора по выданным записям. Каждое указанное окно события является положительным, а каждое окно roc_window_s вне событий — отрицательным; окно засчитывается при пороге, когда тестовая статистика монитора достигает его в окне. P_fa — на отрицательное окно, а не на тест.

# legal: native review
engine-legal-lunanet-afs-advisory = Носит консультативный характер: результат анализа исследовательского и инженерного инструмента; это не навигационное оборудование с утверждённым типом и не служба обеспечения безопасности жизни. Он проверяет поток символов по одной редакции опубликованной спецификации и ничего не говорит ни об одном узле или службе LunaNet.

# legal: native review
engine-legal-iqfit-statement = MODELLED: каждое подобранное число описывает открытый приёмник (названную конструкцию петли и входной тракт) на выданных ему записях, подобранное по оценённым результатам кампании. Это не измерение какого-либо другого приёмника. Прогнозы помечены PREDICTION, с ближайшей испытанной записью и расстоянием за пределами испытанных условий.

# legal: native review
engine-legal-iqfit-advisory = Носит консультативный характер: результат анализа, не навигационное оборудование с утверждённым типом; прогнозы являются выходными данными модели с указанной погрешностью, а не гарантиями.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Заявление об источнике, а не утверждение: материалы ICG WG-B Lunar PNT за июнь 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, источник S3 исследования) описывают лабораторию лунной опорной шкалы времени при станции с целевым уровнем времени порядка наносекунд. Kshana приводит эту цель только для контекста; она её не принимает, и ничто в этом блоке не показывает, что какие-либо реальные часы станции её достигают.

# legal: native review
engine-legal-standards-pack-notice = Пакет стандартов измеряет смоделированные сценарии относительно порогов, заданных до запуска. Он подкрепляет доказательствами названные строки рамочного документа; он не оценивает и не утверждает ни один продукт, а порог с пометкой MET говорит лишь о том, что смоделированный результат сценария достиг заданного порога.

# legal: native review
engine-legal-standards-pack-advisory = Носит консультативный характер: результат анализа исследовательского и инженерного инструмента; это не навигационное оборудование с утверждённым типом и не служба обеспечения безопасности жизни; не должен служить единственным основанием для какого-либо решения по навигации или безопасности.

# legal: native review
engine-legal-geometry-statement = Геометрия при указанной модели ошибок (MODELLED): видимость по прямой линии относительно указанного горизонта, геометрический фактор DOP и гауссов эллипс ошибок для независимых, равных, с нулевым средним гауссовых ошибок дальности с указанной эквивалентной ошибкой дальности пользователя. Это не прогноз реальной ошибки приёмника, которая включает также систематические ошибки, многолучевость и ошибки вне прямой видимости, и не граница целостности. Предустановленные орбитальные группировки — репрезентативная геометрия, а не небо той даты в том месте.

# legal: native review
engine-legal-resilience-disclaimer = Самооценка на основе симуляции, соотнесённая с DHS RPCF v2.0. Это не сертификация и не аккредитация, и она не означает одобрения каким-либо органом (DHS, IEEE или иным). Каждая подоценка является MODELLED, если она явно не помечена VALIDATED, а оценки являются показателями качества во временной области и обнаружении, а не точностью в области положения.

# legal: native review
engine-legal-observatory-notice = Ухудшенная ячейка означает, что высокая доля воздушных судов в тот день сообщила там о низкой точности навигации. Причина не приписывается. Ячейка, которая не наблюдалась или отсутствует, не оценивалась, а это не то же самое, что чистая. Только консультативно: это не одобрение, не сертификация и не заявление о соответствии.

# legal: native review
engine-legal-receiver-trust-advisory = Программное обеспечение консультативного характера, не навигационное оборудование с утверждённым типом (IEC 61108, IEC 61162): ответственность за судовождение остаётся на операторе.

# legal: native review
engine-legal-evidence-roundtrip-notice = Связывает четыре записи по хешу: сценарий, указанные лабораторией условия испытания, журнал приёмника и оценку этого журнала относительно указанных событий. Это не сигнал, не рецепт воспроизведения и не сертификация. То, как движение из сценария попало в приёмник (файл, воспроизведённый лабораторным симулятором, по кабелю или в экранированном помещении), было ответственностью оператора и записано здесь только так, как указано.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Этот пакет — технический протокол того, что движок Kshana вычислил по указанному журналу приёмника при указанной конфигурации. Он не является юридическим заключением, не является установлением фактов о каком-либо событии или его причине и не является сертификацией.

# legal: native review
engine-legal-bench-notice = Носит консультативный характер: смоделировано или измерено относительно указанных эталонов; это не одобрение, не сертификация и не заявление о соответствии. Оценка описывает журнал или корпус, но никогда не продукт.

# legal: native review
engine-legal-osnma-advisory = Носит консультативный характер: это результат анализа и мониторинга, а не навигационное оборудование с утверждённым типом. Приведённый здесь статус аутентификации не является услугой обеспечения целостности навигации и не должен служить единственным основанием для какого-либо решения по навигации или безопасности.

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = перебор `{ $scenario_kind }` по { $axis_order } (узлов: { $nodes }, медиана с полосой от 5-го до 95-го процентиля, начальных значений (seed): { $n_runs }; каждая линия в своём диапазоне)

engine-holdover-test-holdover-not-recovered-within-record = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; не восстановлено в пределах записи (MODELLED, измерено относительно маски)

engine-holdover-test-holdover-recovered-after-gnss-returned = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; восстановлено через { $t } s после возвращения GNSS (MODELLED, измерено относительно маски)

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = записано командой kshana iq scene: СИМУЛИРОВАННАЯ сцена, а не запись; целочисленная шкала: 1 LSB = { $sc } нормированных по шуму единиц (ожидаемый RMS { $v1 } LSB на компоненту), элементов с ограничением амплитуды: { $clipped }

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = записано командой kshana iq scene; целочисленная шкала: 1 LSB = { $sc } нормированных по шуму единиц (ожидаемый RMS { $v1 } LSB на компоненту), элементов с ограничением амплитуды: { $clipped }

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = записано отсчётов: { $samples } ({ $format }, { $fs_hz } Hz) в { $data_path }; записей истинных значений: { $truth_records } в { $truth_path }; { $meta_note }; канал: { $chan_desc }; целочисленная шкала: 1 LSB = { $sc } нормированных по шуму единиц (ожидаемый RMS { $v1 } LSB на компоненту), элементов с ограничением амплитуды: { $clipped }

engine-lunar-chart-title = HPL на южном полюсе Луны (доступность { $availability }%, AL { $al } m, σ_URE { $sigma } m)

engine-lunar-beacon-chart-title = Усиление лунными поверхностными маяками — PDOP по конфигурациям

engine-lunar-beacon-chart-no-solution = нет решения

engine-lunar-beacon-chart-footnote = чем меньше, тем лучше; sigma_URE на маяк { $sigma } m, маска { $mask } deg

engine-lunar-combination-chart-title = Совместное лунное определение орбиты (OD) и часов — 3-D ошибка положения станции (VLBI восстанавливает наблюдаемость)

engine-lunar-combination-chart-subtitle = спутников: { $n_sat }, земных станций: { $n_earth } · коэффициент улучшения { $factor }×

engine-lunar-combination-chart-with-vlbi = с VLBI: { $m } m

engine-lunar-combination-chart-range-only = только дальности: { $m } m

engine-lunar-combination-chart-axis-note = log10 ошибки станции (m); сходимость с/без = { $with }/{ $without }

engine-lunar-dpnt-chart-title = Лунный дифференциальный PNT — спутников: { $n_sats }: скорректированная ошибка в зависимости от базы (снижение × { $factor } при { $km } km)

engine-lunar-dpnt-chart-subtitle = без коррекции { $uncorrected } m | с коррекцией { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = без коррекции (автономно)

engine-lunar-dpnt-chart-baseline-km = база (km)

engine-lunar-dpnt-chart-err-m = ошибка (m)

engine-lunar-frame-realise-chart-title = Реализация лунной системы отсчёта — восстановление 7-параметрического преобразования Гельмерта

engine-lunar-frame-realise-chart-subtitle = точек: { $n_points } · RMS остатков { $rms } m · сошлось: { $converged }

engine-lunar-frame-realise-chart-scale = масштаб (ppb)

engine-lunar-frame-realise-chart-row = { $label }: внесено { $inj } { $unit } · восстановлено { $rec } { $unit } · ошибка { $err }

engine-lunar-interop-chart-title = Экспорт для лунной интероперабельности — CCSDS OEM + KIF (согласовано с LunaNet/IOAG)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | состояний: { $n_states } | OEM, строк: { $oem_lines }

engine-lunar-interop-chart-artifacts = артефакты: { $list }

engine-lunar-interop-chart-conformance = соответствие полей: { $verdict } (присутствует: { $present }, отсутствует: { $missing }, строк данных: { $data_lines })

engine-lunar-interop-chart-roundtrip = круговой проход OEM (round-trip): { $oem } | круговой проход метаданных времени: { $time_metadata } | KIF, байт: { $kif_bytes }

engine-lunar-interop-chart-footnote = Круговой проход (round-trip) и соответствие полей относительно CCSDS OEM и опубликованной семантики полей LunaNet/IOAG. { $label } — не сертифицированный тест на соответствие интероперабельности; без одобрения со стороны какого-либо агентства.

engine-lunar-jamming-chart-title = J/S по каждому спутнику в зависимости от угла места, пользователь на лунной поверхности

engine-lunar-jamming-chart-x-title = угол места спутника (deg)

engine-lunar-jamming-chart-n-links = связей: { $n_links }

engine-lunar-service-chart-title = Объём лунного обслуживания — спутников: { $n_sats }, точек: { $n_points } × эпох: { $n_epochs }: покрытие { $coverage }% (PDOP&lt;{ $threshold })

engine-lunar-service-chart-subtitle = спутники { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | доступность PL { $pl_avail }% (AL { $al } m, σ_URE { $sigma } m)

engine-lunar-service-chart-pdop-min = PDOP мин. { $v }

engine-lunar-service-chart-pdop-mean = PDOP средн. { $v }

engine-lunar-service-chart-pdop-max = PDOP макс. { $v }

engine-lunar-station-chart-title = Лунная опорная станция: p{ $percentile } скорректированной 3-D ошибки над южным полярным районом (MODELLED)

engine-lunar-station-chart-threshold = порог { $thr } m при p{ $percentile }

engine-lunar-station-chart-availability = доступность { $v } %

engine-lunar-station-chart-coverage = покрытие { $v } %

engine-lunar-station-chart-corrected-3d = скорректировано 3-D { $f }

engine-lunar-station-chart-uncorrected-3d = без коррекции 3-D { $f }

engine-lunar-station-chart-legend-half = ≤ половины порога

engine-lunar-station-chart-legend-within = ≤ порога

engine-lunar-station-chart-legend-twice = ≤ удвоенного порога

engine-lunar-station-chart-legend-above = выше удвоенного порога

engine-lunar-station-chart-station-note = ◆ станция · пунктир: расстояние, до которого покрытие сохраняется на уровне 95 %

engine-lunar-station-chart-disclaimer = MODELLED при заданных допущениях; не утверждение о какой-либо реальной системе; не связано с каким-либо агентством и не одобрено им.

engine-lunar-time-chart-title = Лунное координатное время LTC−TT (скорость { $rate } µs/day, полоса { $low }–{ $high })

engine-lunar-time-chart-offset = { $offset } µs через { $days } d

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | часы { $clock } | 7-членная x_Σ(τ) по { $taus } точкам τ ({ $taus2 }–{ $taus3 } s) | пересечение τ { $crossover_tau_s } s (x { $crossover_x_s } s) | уровень системы координат { $frame_term_s } s | часы x(1 d) { $x_1day_ns } ns (MODELLED) | лаборатория времени: { $lab } { $lab2 } до LTC, x(1 d) { $lab3 } ns (MODELLED)

engine-lunar-vlbi-chart-title = Лунная VLBI-задержка (база { $baseline } km, дальность до маяка { $range } km, ближнее поле { $near_field } µs)

engine-lunar-vlbi-chart-footnote = задержка { $delay } µs в эпоху · отсчётов: { $samples } за { $hours } h

engine-mars-pnt-chart-formal-3sigma = формальные 3σ (ковариация, не сертифицированный PL)

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = увод положения: сообщаемое положение уходит на { $final_offset_m } m, направление: { $dir }, пока приёмник сохраняет действительное решение (пики ложного трека: { $pv } m/s и { $pa } m/s^2); пока это длится, каждый отслеживаемый спутник показывает { $c } dB-Hz

engine-nmea-synth-log-position-drag-off-genuine-cn0 = увод положения: сообщаемое положение уходит на { $final_offset_m } m, направление: { $dir }, пока приёмник сохраняет действительное решение (пики ложного трека: { $pv } m/s и { $pa } m/s^2); сохраняется подлинная картина C/N0

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = спуфинг времени: сообщаемое UTC смещается от истинного на { $offset_s } s; положение остаётся истинным; пока это длится, каждый отслеживаемый спутник показывает { $c } dB-Hz

engine-nmea-synth-log-time-spoof-genuine-cn0 = спуфинг времени: сообщаемое UTC смещается от истинного на { $offset_s } s; положение остаётся истинным; сохраняется подлинная картина C/N0

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = задержка повтора (в стиле meaconing): положение{ $v1 } отстаёт от истинного на { $delay_s } s; пока это длится, каждый отслеживаемый спутник показывает { $c } dB-Hz

engine-nmea-synth-log-replay-delay-genuine-cn0 = задержка повтора (в стиле meaconing): положение{ $v1 } отстаёт от истинного на { $delay_s } s; сохраняется подлинная картина C/N0

engine-pvt-chart-3d-error-m = ошибка 3D (m)

engine-pvt-chart-postfit-rms-m = RMS после подгонки (m)

engine-quantum-faults-chart-quantum = квантовый

engine-quantum-faults-chart-classical = классический

engine-raim-stanford-chart-title = Диаграмма Стэнфорда — целостность (эпох: { $n_epochs }, AL = { $al } m)

engine-raim-chart-title = Уровни защиты RAIM и доступность (доступно { $availability }%)

engine-receiver-trust-chart-track-caption = трек, сообщённый приёмником, север сверху

engine-receiver-trust-chart-start = начало

engine-receiver-trust-chart-end-of-log = конец журнала

engine-receiver-trust-chart-no-positions = в журнале нет положений

engine-receiver-trust-chart-score-axis = оценка доверия, от 0 до 100

engine-receiver-trust-chart-legend-vessel = доверие: зелёный — норма (оценка не ниже { $nominal }), янтарный — ухудшено (не ниже { $degraded }), красный — недоверенный, серый — калибровка

engine-receiver-trust-chart-legend = доверие: зелёный — норма, янтарный — ухудшено, красный — недоверенный, серый — калибровка

engine-receiver-trust-chart-advisory = Программное обеспечение консультативного характера, не навигационное оборудование с утверждённым типом; ответственность остаётся на операторе.

engine-receiver-trust-chart-cn0-axis = средний C/N0, dB-Hz

engine-report-chart-title = Holdover часов: ошибка времени при отключении GNSS

engine-slot-timing-chart-aria = Прогнозируемая ошибка времени в зависимости от времени с последнего определения, с защитным интервалом слота

engine-slot-timing-chart-time-since-fix = время с последнего определения, от 0 до { $t }

engine-slot-timing-chart-predicted-error = прогнозируемая ошибка времени (ns); пунктир: защитный интервал { $guard } ns

engine-slot-timing-never = никогда

engine-solar-system-chart-title = Солнечная система — эклиптика J2000, вид сверху

engine-solar-system-chart-inner = Внутренняя система (до Марса)

engine-solar-system-chart-whole = Вся система (до Плутона)

engine-solar-system-chart-legend = зелёный: VALIDATED по JPL Horizons · янтарный: MODELLED · спутники планет перечислены в result.json с треками относительно родительского тела

engine-spectrum-chart-title = Водопад спектра в L-диапазоне

engine-spectrum-chart-multi-title = Водопад спектра в нескольких диапазонах

engine-spectrum-chart-frequency-mhz = частота (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz): номинальное (серое) / минимальное

engine-spectrum-chart-threshold = порог { $thr }

engine-spoof-chart-title = Обнаружение спуфинга времени: смещение и границы обнаружения с опорой на часы

engine-spoof-chart-offset-ns = смещение спуфинга (ns)

engine-spoof-chart-spoof-offset = смещение спуфинга

engine-spoof-chart-quantum-bound = квантовая граница обнаружения

engine-spoof-chart-classical-bound = классическая граница обнаружения

engine-sweep-chart-title = { $metric } в зависимости от { $parameter } (шкала: { $scale })

engine-sweep-nd-chart-title = { $n_dims }-D перебор `{ $kind }` — узлов: { $n_nodes }

engine-sweep-nd-chart-axes = оси: { $axes } (форма { $shape })

engine-sweep-nd-chart-metrics = метрики: { $metrics } — полная сетка в JSON

engine-sweep-nd-chart-line-title = перебор `{ $kind }` по { $key }

engine-sweep-nd-chart-y-title = метрика

engine-telecom-timing-max-te-ns-budget-never-exceeded = telecom-timing: max|TE| { $max_abs } ns за { $v2 } s; { $masks }; бюджет { $max_abs_te_ns } ns не превышен ни разу (MODELLED)

engine-telecom-timing-max-te-ns-budget-exceeded-after = telecom-timing: max|TE| { $max_abs } ns за { $v2 } s; { $masks }; бюджет { $max_abs_te_ns } ns превышен через { $t } s (MODELLED)

engine-telecom-timing-chart-title = Синхронизация телекоммуникаций: ошибка времени, MTIE и TDEV

engine-telecom-timing-chart-y-title = |ошибка времени| (ns)

engine-telecom-timing-chart-te-caption = абсолютная ошибка времени относительно бюджетов

engine-telecom-timing-chart-time-record = время (запись { $h } h)

engine-telecom-timing-chart-mtie-caption = MTIE (сплошная), TDEV (пунктир), первая маска MTIE (серая), ns

engine-timetransfer-chart-title = Ошибка синхронизации при передаче времени (оптика и RF)

engine-timetransfer-chart-y-title = ошибка синхронизации (ps)

engine-timetransfer-chart-spec = спецификация { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = время измерения (s)

engine-timetransfer-chart-optical = оптика: { $id }

engine-kind-clock-description = Holdover часов относительно спецификации; необязательный ансамбль Монте-Карло (runs > 1).

engine-kind-inertial-description = 1-DOF инерциальное счисление пути при отключении GNSS.

engine-kind-orbit-description = Доступность GNSS и DOP по орбитальной группировке (Walker / TLE / RINEX).

engine-kind-ephemeris-description = Эфемериды и трасса на поверхности: распространение одного спутника (TLE→SGP4 или аналитическая орбита) и вывод его состояния TEME/GCRS (положение + скорость), положения ITRF/ECEF, подспутниковых широты/долготы/высоты WGS-84 и для каждого шага азимута/угла места/дальности станции и скорости изменения дальности (Доплер). Спутник берётся из `tle` или из аналитической `orbit` с её `epoch` (при указании обоих приоритет у `tle`); при наличии `tle` значение `epoch` заменяет собственную эпоху TLE как t = 0.

engine-kind-integrity-description = Снимок / разделение решений / ARAIM RAIM с HPL/VPL и диаграммой Стэнфорда.

engine-kind-lunar-integrity-description = Проход ARAIM по уровням защиты на южном полюсе Луны относительно репрезентативного набора ретрансляторов LunaNet. sigma_ure_m задаёт точность дальнометрии сигнала в пространстве (уровни защиты масштабируются с ней линейно, поэтому перебор этого параметра отвечает, какая точность дальнометрии требуется для предела тревоги). По умолчанию используется исторический случай южного полюса класса LNIS.

engine-kind-lunar-time-offset-description = Смоделированная релятивистская скорость хода часов Земля–Луна (лунное координатное время, LTC/TCL): вековая скорость LTC−TT, получаемая из разности собственных потенциалов и кинетического члена Луны, приводится вместе с опубликованной полосой 56–59 µs/day, а также накопленное смещение на горизонте.

engine-kind-lunar-vlbi-description = Смоделированная наблюдаемая величина задержки лунной геодезической VLBI: земная база (две наземные станции, GCRS) принимает односторонний сигнал от маяка на лунной поверхности класса NovaMoon. Выдаёт ближнепольную задержку по разности двух дальностей, её скорость и поправку на кривизну волнового фронта в ближнем поле на протяжении пролёта — с перекрёстной проверкой по наблюдаемой Δ-DOR с плоской волной из той же кодовой базы в дальнепольном пределе и с частными производными, проверенными конечными разностями. Аналитический путь по умолчанию MODELLED и несёт оговорки о согласованности систем координат, движении полюса xp=yp=0 и различии плоской волны и ближнего поля. Если заданы planetary_kernel_path, earth_orientation_kernel_path и moon_orientation_kernel_path, выполняется путь по ядрам (DE440, MOON_PA_DE440, ITRF93; сходящиеся барицентрические времена распространения света; добавляются частные производные для маяка и станции на данную эпоху), ньютоновская задержка и производные которого согласуются с сошедшимися временами распространения света NAIF SPICE с точностью до { $lit_0_06 } ps и 7.4e-9. Не проверено по реальным данным VLBI.

engine-kind-lunar-joint-od-clock-description = Смоделированный совместный пакетный оценщик многотехнологичного лунного определения орбиты (OD) и часов на СИМУЛИРОВАННОЙ сети: подгонка снимка методом Гаусса — Ньютона, объединяющая геодезические задержки VLBI по земной базе, локальные лунные дальности станция↔спутник и межспутниковые дальности, чтобы совместно восстановить из внесённой истины 3-D положение лунной поверхностной станции, положения малой орбитальной группировки и смещение часов каждого объекта. Главный честно заявленный результат — VLBI делает наблюдаемым полное 3-D положение станции там, где одни лунные локальные дальности оставляют слабо наблюдаемое направление, — представлен как контраст ошибки станции с VLBI и без него. MODELLED, симулированное восстановление в замкнутом контуре (истина использует ту же модель наблюдений), детерминированное (с начальным значением), НЕ проверено по реальным данным; без распространения по модели сил внутри решателя; без заявлений о TRL, лётном опыте или одобрении какого-либо агентства.

engine-kind-lunar-frame-realisation-description = Смоделированная реализация лунной системы отсчёта: подгонка датума по 7-параметрическому преобразованию Гельмерта (подобия) — 3 сдвига, 3 малых поворота, 1 масштаб — привязывающая оценённый набор координат точек MCMF, выведенных из селенографических, к датуму взвешенным методом наименьших квадратов (crate::batch_ls::gauss_newton), а также простая привязка ориентации, выражающая реализованный малый поворот относительно осей ICRF по отношению к ориентации тела IAU 2015 WGCCRE. Сценарий вносит известное малое преобразование (сдвиг ~десятки m, поворот ~µrad, масштаб ~1e-7) в хорошо распределённую синтетическую сеть точек, добавляет гауссов шум с начальным значением, восстанавливает датум и сообщает восстановленное преобразование, ошибку восстановления по каждому параметру относительно внесённой истины и RMS остатков после подгонки. MODELLED, самосогласованность — восстанавливается внесённое преобразование подобия (без шума примерно до машинной точности), а НЕ реализация по реальным данным слежения/VLBI; детерминированное (с начальным значением); без заявлений о TRL, лётном опыте или одобрении какого-либо агентства.

engine-kind-moonlight-service-volume-description = Смоделированный анализ объёма лунного навигационного обслуживания по ИЛЛЮСТРАТИВНОЙ орбитальной группировке на лунной орбите класса Moonlight/LCNS из общедоступных источников (не связана с ESA): перебирает сетку селенографических широты/долготы на временном горизонте и сообщает DOP / покрытие / доступность (≥4 спутника И PDOP < порога), а также обобщённую огибающую лунных уровней защиты ARAIM (HPL/VPL) по объёму. Геометрия DOP ИСПОЛЬЗУЕТ ПОВТОРНО ядро, VALIDATED по gnss_lib_py (crate::orbit::dop); уровень защиты ИСПОЛЬЗУЕТ ПОВТОРНО механизм лунного ARAIM LunaNet LNIS (crate::lunar, σ_URE≈30 m) и в частном случае сводится к существующему PL южного полюса. MODELLED, композиция: набор ретрансляторов на круговых/эллиптических кеплеровых орбитах (а не реальные дифференциально скорректированные эфемериды LCNS/NRHO), Луна со средним вращением (без либрации и прецессирующего полюса). Детерминированное (чистая геометрия). Без заявлений о TRL, лётном опыте или одобрении какого-либо агентства.

engine-kind-lunar-differential-pnt-description = Смоделированный лунный ДИФФЕРЕНЦИАЛЬНЫЙ PNT (аналог лунных DGNSS/SBAS): опорная станция класса NovaMoon в ИЗВЕСТНОМ селенографическом месте вычисляет дифференциальные поправки по каждому спутнику от ИЛЛЮСТРАТИВНОЙ орбитальной группировки класса Moonlight/LCNS из общедоступных источников (NovaMoon упоминается только как КЛАСС системы, не связан с ESA), а пользователь, смещённый на baseline_km, применяет их, так что СИНФАЗНЫЕ ошибки орбиты и часов взаимно компенсируются. Член часов компенсируется ТОЧНО (алгебраическое тождество); член орбиты оставляет только проекцию разности направлений на спутник, которая → 0 при базе → 0 (порог пространственной декорреляции) и растёт ≈ линейно с базой. Сообщает 3-D ошибку положения пользователя С поправками и БЕЗ них, коэффициент снижения, кривую ошибки в зависимости от базы и уровень защиты пользователя, который ИСПОЛЬЗУЕТ ПОВТОРНО механизм SBAS по DO-229E (crate::sbas) с дифференциальной остаточной σ. MODELLED — точное тождество компенсации + модель декорреляции первого порядка; не проверено по реальным данным; без заявлений о TRL, лётном опыте или одобрении какого-либо агентства. Детерминированное при наличии начального значения.

engine-kind-lunar-station-coverage-description = Смоделированное покрытие лунной опорной станции: перебор Монте-Карло лунной модели дифференциального PNT по южно-полярной пользовательской сетке и суткам эпох. Дифференциальная опорная станция в известном южно-полярном пункте корректирует заданную орбитальную группировку (иллюстративную кеплерову или табличные эфемериды) с заданной ошибкой сигнала в пространстве, ошибкой привязки, задержкой поправок и квантованием канала; для каждой точки и по району она сообщает процентиль скорректированной и нескорректированной ошибки положения (3-D, горизонтальной, вертикальной), доступность, покрытие относительно заданного порога, уровни защиты по DO-229E, радиус покрытия по азимуту и бюджет канала поправок на станции и в наихудшей точке. Не является утверждением о характеристиках какой-либо реальной системы; не связано с каким-либо агентством и не одобрено им. MODELLED.

engine-kind-lunar-interop-export-description = Смоделированный экспорт для лунной интероперабельности: выдаёт лунную систему отсчёта, лунную шкалу времени и лунные эфемериды в обменных формах на основе CCSDS, согласованных с LunaNet/IOAG, с круговым проходом (round-trip) и проверкой соответствия полей. ИСПОЛЬЗУЕТ ПОВТОРНО эмиттер и парсер CCSDS OEM 2.0 из этого крейта (crate::oem), переразмеченные для лунного контекста: OEM REF_FRAME несёт лунную систему тела IAU 2015 WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM — лунную шкалу времени (LTC / TCL / UTC), CENTER_NAME = MOON — по образцу иллюстративных эфемерид класса LCNS (положения из crate::lunar_service, скорость конечной разностью). Также выдаёт дескриптор лунного времени, согласованный с LunaNet/IOAG (идентификатор шкалы, вековая скорость µs/day из crate::lunar_time, опубликованная полоса, опорная поверхность), проходящий круговой проход через serde_json, и оборачивает артефакты в существующий конверт KIF (crate::interchange) с меткой достоверности MODELLED. Сообщает выданные артефакты, число строк OEM, прохождение проверки соответствия полей и список присутствующих/отсутствующих полей, успешность кругового прохода OEM и кругового прохода метаданных времени, а также размер KIF в байтах. MODELLED — оракулом служат детерминированный круговой проход и соответствие имён полей опубликованной семантике полей CCSDS OEM + LunaNet/IOAG; это НЕ сертифицированный тест на соответствие интероперабельности; иллюстративные эфемериды из общедоступных источников, не связаны с ESA; без заявлений о TRL, лётном опыте или одобрении какого-либо агентства.

engine-kind-timetransfer-description = Двусторонняя передача времени/частоты: оптика и RF.

engine-kind-quantum-anomaly-detect-description = MODELLED обнаружение неисправностей/аномалий для квантовых систем PNT: размеченный каталог неисправностей (скачок/дрейф частоты часов, потеря захвата; ступень смещения/пропадание датчика), ROC AUC статистики обнаружения (с доверительным интервалом бутстрепа из eval_stats, проверенного по внешнему эталону) и минимальная обнаруживаемая неисправность при фиксированной частоте ложных тревог, при этом монитор с квантовыми часами (меньший шум) обнаруживает меньшие неисправности — как явные TradeEvidence + репрезентативность. Гауссова модель статистики обнаружения (AUC = Phi(mu/(sigma*sqrt2))); моделирует класс, иллюстративные параметры из общедоступных источников, без заявлений о TRL, лётном опыте и сертификации.

engine-kind-quantum-gnss-free-nav-description = MODELLED квантовая навигация без GNSS: при отключении GNSS инерциальный бюджет квантового (атомно-интерферометрического на холодных атомах) датчика против классической INS навигационного класса — рост ошибки положения на выбеге, holdover до порога положения и компромисс «квантовый или классический» как явные TradeEvidence с репрезентативностью. Явное замечание о наблюдаемости: без внешнего определения смещение акселерометра ненаблюдаемо, поэтому ошибка растёт; квантовый датчик замедляет этот рост, но не устраняет разрыв. Иллюстративные параметры устройства из общедоступных источников; моделирует класс, без заявлений о TRL, лётном опыте и сертификации.

engine-kind-quantum-time-transfer-description = MODELLED цепочка доверенной квантовой синхронизации: сквозной бюджет передачи времени квантовой (часы на оптической решётке + канал с запутанностью/одиночными фотонами) и классической (CSAC + RF двусторонняя) цепочек, повторно используемый уровень защиты синхронизации + показатель безопасности при атаке задержкой/повтором (1-P_md), вероятность обнаружения аномалии часов + задержка CUSUM и компромисс «квантовый или классический» как явные TradeEvidence с записью о репрезентативности и пробелах до полёта. Иллюстративные параметры устройства/канала из общедоступных источников; моделирует класс, без заявлений о TRL, лётном опыте и сертификации.

engine-kind-hybrid-description = Итоговый гибридный PNT: часы + IMU + поддержка передачей времени.

engine-kind-fusion-description = Совместное калмановское объединение датчиков PNT по тем же гибридным входам.

engine-kind-hybrid-ukf-description = 17-состоятельный гибридный квантово-классический тесно связанный UKF GNSS/INS (MODELLED): 15 состояний ошибки INS + поправка смещения акселерометра, полученная от CAI, + 2-состоятельные (фаза + частота) часы из движка часов с q-параметрами, возбуждаемые ограниченной моделью ошибок CAI. Показателем качества служит самосогласованность фильтра (NEES + белизна инноваций относительно границ χ²) — утверждение о самосогласованности, а НЕ гарантия точности в реальном мире. Только симуляция; без TRL>3, без лётного опыта, без внешней проверки.

engine-kind-gnss-ins-description = EKF вектора ошибок GNSS/INS со слабой и тесной связью.

engine-kind-gnss-sim-description = Симуляция псевдодальностей в области измерений (ионосфера Клобучара, тропосфера Саастамойнена/Ниелла) + RAIM.

engine-kind-jamming-description = Подавление по бюджету линии: J/S → эффективное C/N₀ → потеря захвата.

engine-kind-spoof-description = Стохастический детектор спуфинга времени (Неймана — Пирсона / χ²₁) с P_fa/P_md по методу Монте-Карло.

engine-kind-spoof-detect-description = Комбинированный детектор спуфинга по RF и измерениям (согласованность RAIM по нескольким SV + AGC + SQM, объединённые) против параметризованной атаки (преимущество по мощности, выравнивание фазы несущей, сдвиг времени/положения; в стиле TEXBAT).

engine-kind-sweep-description = 1-D перебор для исследования компромиссов по параметру пакета часов.

engine-kind-sweep-nd-description = Универсальный N-D перебор по любому пакету через ключи TOML с точками / пути метрик JSON.

engine-kind-gravity-map-description = Навигация по сопоставлению с картой гравитации без GPS: гравиметр на холодных атомах восстанавливает постоянный дрейф INS по последовательности гравитационных аномалий, через которую он пролетает.

engine-kind-terrain-nav-description = Навигация по рельефу местности без GPS (TERCOM/SITAN): радиолокационный/барометрический высотомер сопоставляет профиль высот земной поверхности с DEM типа SRTM, чтобы восстановить дрейф INS.

engine-kind-terrain-slam-description = Последовательная (рекурсивная) навигация по рельефу местности без GPS: фильтр частиц прогоняет модель измерения по рельефу эпоха за эпохой (SITAN как работающий фильтр), так что зависящий от времени дрейф INS отслеживается вдоль трека, тогда как пакетная terrain-nav восстанавливает лишь одно постоянное смещение.

engine-kind-combined-altpnt-description = Комбинированный навигатор без GPS по гравитации + магнитному полю + рельефу: три скалярных канала поля, объединяемые в каждой путевой точке, для более точного (с меньшим CRLB) определения дрейфа, чем по любому одному полю.

engine-kind-pvt-description = Одноточечное позиционирование по реальным наблюдениям: вычисляет положение приёмника по файлу наблюдений RINEX 3 и файлу вещательной навигации (кодовые псевдодальности, вещательные эфемериды, ионосфера Клобучара, тропосфера Саастамойнена/Ниелла) с необязательной проверкой по съёмной координате.

engine-kind-mars-pnt-description = PNT для дальнего космоса, Марс: симулированная орбитальная группировка ретрансляторов MARCONI (ареостационарные и наклонные ретрансляторы, передающие в одну сторону и ретранслирующие в обе стороны на станцию дальнего космоса) осуществляет навигацию опорного пользователя (transfer | lmo | surface) через совместный оценщик объединения односторонних/двусторонних радиометрических измерений. Сообщает геометрию/видимость по эпохам, достигнутый RMS относительно истины и формальную ковариацию (положение 1σ / 3σ) — явный симулированный показатель качества, а НЕ сертифицированный уровень защиты.

engine-kind-impairment-eval-description = Испытательный стенд оценки обнаружения ухудшений RF на основе ИИ/МО (13494): генерирует размеченный, обоснованный параметрами СИНТЕТИЧЕСКИЙ корпус (nominal/jamming/spoof-time/spoof-position/multipath), оценивает детектор (energy|agc|sqm|parity|fused) с помощью не зависящей от детектора обвязки и сообщает AUC/ROC/матрицу ошибок + Pd по каждому классу при целевой Pfa, а также разрыв оптимизма между данными из распределения и вне его. Только MODELLED рабочие характеристики — никогда полевые данные/IQ, без вердикта «хорошо/плохо».

engine-kind-quantum-trade-description = Компромисс квантового и классического PNT (13503): выигрыш в holdover времени + инерциальном holdover от кандидата в часы (измеренная кривая ADEV — опора обоснованности — или класс квантовых часов) относительно классического базового класса, с оговоркой о допущении про пол на больших tau, вынесенной на артефакт, плюс огибающая устойчивости при отказе GNSS в зависимости от времени. MODELLED; количественно оценивает (но не проверяет) устройство партнёра. Кандидат в часы — это измеренная кривая (`candidate_adev_taus` + `candidate_adev_values`, равной длины, не менее 2 точек; при указании обеих форм приоритет у неё) либо `candidate_clock_class`.

engine-kind-space-weather-description = Модель среды космической погоды: индексы солнечной (F10.7/F10.7a) и геомагнитной (Kp, с определяющей таблицей Kp↔ap) активности, экзосферная температура по Jacchia-1971, которую они задают (проверена по опубликованным минимуму/среднему/максимуму солнечной активности), и плотность нейтральной термосферы по Jacchia-1971 при суточной средней экзосферной температуре относительно статического профиля без учёта активности на наборе высот — зависимость плотности от солнечного цикла, которую статическая атмосфера опускает. MODELLED: плотность согласуется с плотностями, полученными по акселерометрам (TOLEOS CHAMP и GRACE), с точностью до множителя 2 при максимуме солнечной активности, но примерно в { $lit_1_7 }x раза завышена в солнечный минимум 2008 года.

engine-kind-oem-interop-description = Мост интероперабельности CCSDS OEM: импортирует Orbit Ephemeris Message, созданное внешним инструментом динамики полёта (GMAT/Orekit/STK все выдают OEM), и сообщает его сегменты/объекты/системы координат/интервал эпох, а также проверку согласованности скорости; без входных данных выполняет круговой проход сформированной опорной орбиты и сообщает точность импорта↔экспорта. MODELLED структурная/физическая проверка приёма, а НЕ проверка точности орбиты источника.

engine-kind-launch-window-description = Геометрия пуска и выведения двух тел: азимут(ы) пуска (sin Az = cos i / cos lat), минимально достижимое наклонение, круговая скорость, восточный бонус вращения Земли, Δv смены плоскости по ломаной траектории, когда целевое наклонение ниже широты площадки, и число суточных возможностей пуска. MODELLED геометрия для сферической Земли (без поправки на скоростной треугольник вращающейся Земли, без модели потерь на выведение и сопротивление).

engine-kind-reentry-description = Коридор баллистического входа по Аллену — Эггерсу: пиковое замедление (не зависит от баллистического коэффициента, V_e^2 sin|γ|/(2eH)), скорость и высота при пиковой перегрузке и скорость пикового нагрева для скорости входа/угла траектории/баллистического коэффициента в экспоненциальной атмосфере, а также плоское интегрирование материальной точки для того же баллистического входа с учётом гравитации, кривизны Земли и стандартной атмосферы США 1976 (пиковое замедление, скорость, высота и время в пике). MODELLED баллистический вход (без подъёмной силы); выходная величина нагрева — это СКОРОСТЬ пикового нагрева, а не тепловой поток (без аэротермической модели/TPS).

engine-kind-eo-coverage-description = Геометрия полосы захвата и покрытия полезной нагрузки для наблюдения Земли (космический треугольник SMAD): угловой радиус Земли, ширина полосы, расстояние выборки на местности в надире, максимальный доступ вне надира, круговой период, нодальный период с учётом J2 и расстояние между трассами на экваторе с флагом сплошного покрытия для высоты орбиты, наклонения (по умолчанию солнечно-синхронное) и поля зрения/IFOV датчика. MODELLED геометрия для сферической Земли (без радиометрии/MTF/атмосферы/дрожания/бликов); расстояние между узлами R_e·(ω − Ω̇)·T_nodal с вековыми скоростями J2 первого порядка.

engine-kind-space-packet-description = Кадрирование CCSDS 133.0-B Space Packet Protocol: кодирует синтетический поток пакетов TM/TC (6-октетный первичный заголовок + поле данных) и сообщает декодирование заголовка каждого пакета, общее число октетов и точный круговой проход кодирования↔декодирования. Детерминированное кадрирование с точной раскладкой битов — слой интероперабельности форматов пакетов агентств; НЕ сертификация на соответствие (без логики вторичного заголовка/CRC/сегментации, кроме флагов).

engine-kind-attitude-budget-description = Бюджет ошибки ориентации и наведения с 3-DOF: наихудший возмущающий момент градиента гравитации ((3/2)(μ/R³)ΔI) и бюджет ошибки наведения как корень из суммы квадратов по именованным вкладам 1σ (шум датчиков, дрожание маховиков, тепловые эффекты, юстировка) с доминирующим членом для высоты орбиты + разброса инерции тела. MODELLED скалярный бюджет AOCS — дополнение к Basilisk/42 до появления аппаратуры, а не симуляция контура управления/6-DoF/гибких мод.

engine-kind-passes-description = Прогноз пролётов над наземной станцией: временные пролёты видимости (AOS/TCA/LOS, максимальный кажущийся угол места, длительность) круговой орбиты, заданной средними элементами SGP4 на начало окна, над станцией выше маски угла места в течение окна, с общим временем доступа. Распространение SGP4/SDP4 в связанной с Землёй системе IAU 2006/2000A (необязательно UT1 - UTC и движение полюса), тропосферная рефракция ITU-R P.834-9 и световое время нисходящей линии (оба включены по умолчанию), пересечения решаются до 1e-7 s, а кульминация — поиском золотого сечения. Геометрия пролёта VALIDATED по Orekit 13.1.8 на станциях на уровне моря; орбита и станция сценария — иллюстративные входные данные.

engine-kind-link-budget-description = Бюджет односторонней линии по уравнению линии CCSDS 401 / DSN 810-005: потери в свободном пространстве, C/N₀, Eb/N₀, запас и замыкание для передающей EIRP, приёмной G/T, дальности, скорости данных и диапазона (s|x|ka) относительно требуемого Eb/N₀. Детерминированный инженерный расчёт по заданным входным данным (не паспорт откалиброванного терминала).

engine-kind-lunar-time-budget-description = MODELLED сквозной бюджет ошибки времени координированного лунного времени (LTC): семь членов ошибки LTC, собранные как кривые ошибки времени x_i(τ) по всей сетке времён усреднения, суммируемые как корень из суммы квадратов в x_Σ(τ), и ПЕРЕСЕЧЕНИЕ часов и системы координат при τ, на котором растущий член часов обгоняет постоянный член реализации системы координат в реальном времени (ниже него бюджет ограничен системой координат, выше — часами) — явный ответ на артефакт единственного τ. Наклоны по τ имеют замкнутый вид и аналитически проверяемы (часы τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }, уровни τ^0, измерение τ^{ "{" }-1/2{ "}" }), а строки часов воспроизводят опубликованные суточные характеристики часов (crate::clock_specs); ВЕЛИЧИНЫ уровней канала RF/оптики, реализации системы координат, релятивистского остатка и эфемерид — это Modelled распределения бюджета (документированные значения по умолчанию, переопределяемые вызывающим), а не измерения. Вклад — воспроизводимое пересечение при τ, а не сертифицированное числовое значение по каждому члену; не сертифицировано для эксплуатационного хранения времени.

engine-kind-hybrid-optical-rf-description = MODELLED совместный показатель качества гетерогенного оптического + RF PNT (P5): объединяет бюджет двусторонней оптической линии на 1550 nm (CRLB двусторонней дальнометрии с фотонным пределом σ_τ/√N и дифракционный след λ/D·дальность), уровень защиты RAIM с разделением решений между модальностями (положение И время), объединяющий слабое RF-решение и тесное оптическое решение с разнородными ковариациями, оптическую доступность ясного неба для N станций (независимое объединение 1−Π(1−a_i) и вариант с пространственной корреляцией), передачу состояния/ковариации оптика↔RF с ДОКАЗАННО непрерывным по битам (без скачка) средним и проверкой согласованности NEES χ², а также совместную оценку P(доступно И прецизионный класс И обеспечена целостность) с учётом корреляций. VALIDATED замкнутая форма: CRLB дальнометрии, дифракционный след, квантиль χ² уровня защиты, комбинаторика объединения, непрерывность среднего передачи + проверка NEES и совместное независимое произведение. MODELLED: распределения оптических потерь, величины σ для RF/оптики, входные данные климатологии облачности, корреляции и бюджет P_HMI. Не сертифицированный продукт по доступности/целостности.

engine-kind-cislunar-observability-description = MODELLED наблюдаемость плоской орбитальной группировки в пространстве Земля–Луна (P6): отслеживает четырёхаппаратную плоскую группировку DRO с дифференциальной коррекцией при межспутниковой дальнометрии и сообщает, какая часть четырёхкомпонентного состояния аппарата [x,y,ẋ,ẏ] становится наблюдаемой на дуге. Выдаёт (1) таблицу «ранг в зависимости от длины дуги» для одной линии только дальности — мгновенно ранг 1, растущий к полным четырём состояниям по мере удлинения дуги (P6, таблица 1); (2) собственный спектр грамиана наблюдаемости + число обусловленности по дуге; (3) сравнение мгновенного ранга «только дальность» и «дальность + скорость изменения дальности» (рычаг проектирования Доплера) плюс отчёт GDOP, неопределённого для «только дальность» и определённого для «дальность + скорость»; и (4) независимую перекрёстную проверку SRIF, апостериорная ковариация которой становится конечной / хорошо обусловленной ровно на дуге, где наблюдаемый ранг достигает четырёх. VALIDATED ядро: наблюдаемый ранг — это порог сингулярных значений, выявляющий ранг, с перекрёстной проверкой по рангу собственных значений грамиана; собственный спектр подчиняется спектральным инвариантам (след=Σλ, det=Πλ, Фробениус²=Σλ²); вариационная STM — это STM CR3BP, проверенная конечными разностями; строки якобиана дальности/скорости изменения дальности — аналитические частные производные, проверенные конечными разностями (с перекрёстной проверкой по 3-D наблюдаемой скорости изменения дальности из этого крейта); четыре начальных условия — это плоские DRO с дифференциальной коррекцией, замыкающиеся с малой невязкой периодичности и ретроградные; переход ранга проверен перекрёстно по квадратно-корневому информационному фильтру этого крейта (апостериорная ковариация конечна ровно при полном ранге, cond(P)=cond(OᵀO)); снимок с дефицитом ранга помечается как GDOP не определён (fim condition=inf), но никогда не ложным конечным значением — та же защита от сингулярной геометрии, которую применяет pvt::solve_spp. MODELLED: проект орбитальной группировки (амплитуды и фазы перилуния DRO) и конкретная прогрессия ранга, которую он даёт. Не сертифицированный продукт по навигационным характеристикам.

engine-kind-conflict-resilience-description = MODELLED устойчивость многоуровневого PNT в условиях конфликта (P7): пользователь в оспариваемой среде располагает несколькими уровнями PNT (GNSS открытой службы, широкополосный GNSS, аутентифицированная орбитальная группировка, ретранслятор-аугментация), каждый с базовой доступностью, точностью 1σ и уязвимостью по каждому вектору к общей угрозе подавления/спуфинга. Перебор по интенсивности с начальным значением методом Монте-Карло блокирует каждый уровень с вероятностью clamp(vulnerability·intensity·vector_weight,0,1), объединяет уцелевшие по замкнутому правилу обратных дисперсий σ_fused=(Σ 1/σ_i²)^(−1/2) и сообщает вероятность полной потери (все уровни заблокированы), медианную объединённую ошибку и статистику пригодности/блокировки по каждому уровню в зависимости от интенсивности. Главное отношение устойчивости (вероятность полной потери для одного уровня и для многоуровневой схемы) оказывается ~7x при допущении НЕЗАВИСИМОСТИ; затем перебор коррелированной блокировки по однофакторной гауссовой копуле показывает, как это ~7x схлопывается к 1 по мере роста корреляции блокировки (корреляция сводит на нет многоуровневость). Блок чувствительности к априорным оценкам прогоняет главное значение по ИСТОЧНИКАМ априорных уязвимостей через торнадо mcda + перераспределение усилий угрозы по Дирихле + процентильные доверительные интервалы. VALIDATED ядро: полная потеря по Монте-Карло сходится к замкнутому независимому произведению Π_i p_deny_i (в пределах стандартной ошибки MC при фиксированном начальном значении и большом N); объединение по обратным дисперсиям — замкнутое тождество; при ρ=0 копула сводится к независимой модели, а каждое ρ сохраняет маргинальную частоту блокировки каждого уровня. MODELLED: величины уязвимости/доступности/точности каждого уровня — это входные данные с источниками, но Modelled (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — см. conflict_threat_params), а конкретная величина ~7x и форма кривой «отношение в зависимости от корреляции» следуют из этой параметризации. Затем разбивка выживаемости по векторам из §4.2 раскладывает общую RF-угрозу на четыре именованных вектора (подавление/спуфинг/кинетический/кибер) и сообщает для каждого вектора кривую плавной деградации пригодного PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: пошаговый по уровням Монте-Карло с начальным значением сходится к этой замкнутой форме; подавление — самый острый вектор для коррелированной RF-базовой линии, а инерциальный уровень, невосприимчивый к RF, — решающий уцелевший. Не сертифицированный продукт по навигационной доступности.

engine-kind-lunar-attack-surface-description = Поверхность атак на безопасность сигналов лунной поверхностной навигации (P1): объединяет открытые анализы безопасности сигналов в один запуск, достижимый из бинарного файла. Сообщает (1) принимаемую мощность AFS и её ПРЕВЫШЕНИЕ мощности относительно наземного опорного уровня GPS, а также полосу чувствительности 12-18 dB как настоящий многоосный перебор по входам линии (опорный уровень x EIRP x наклонная дальность) со сверкой линейных коэффициентов 25x с округлением / 28x без округления. ПЕРЕСМОТРЕНО (правило R4): здесь сообщался ДЕФИЦИТ мощности { $lit_15_6 } dB и коэффициент 32x/36x, пока опорный уровень GPS не был исправлен с -125 / -{ $lit_128_5 } (это значения в dBm) на -155 / -{ $lit_158_5 } dBW — значения ICD-GPS-200, которые модуль подавления всегда нёс. Знак меняется на обратный: смоделированный лунный сигнал AFS на { $lit_14_4 } dB СИЛЬНЕЕ наземного GPS L1 C/A, а не слабее. Сама принимаемая мощность не изменилась ни на бит, а линейный коэффициент — прежний, делённый ровно на 1000, что ровно соответствует сдвигу 30 dB между dBm и dBW; (2) требуемую мощность передатчика атакующего для спуфинга (J/S = 3 dB) и для блокировки (J/S = 30 dB) на каждом удалении, обратную к линии J/S; (3) орбитальную область захвата при реальной диаграмме антенны с равномерной апертурой (Эйри [2 J1(x)/x]^2), ограниченную по высоте субполусферическую шапку, лимб которой НЕ захватывается; (4) вычисленный исход втягивания при захвате спуфером контура слежения (увлекает ли спуфер с совпадающим кодом при заданном преимуществе по мощности и смещении кода DLL/PLL на самом деле), а не заявленный порог 3 dB; (5) геометрический горизонт досягаемости приподнятого поверхностного передатчика на безвоздушном теле; и (6) бюджет аутентификации OSNMA/TESLA (накладные расходы 20 bit/s = ~40 % навигационного сообщения AFS 50 bit/s, задержка раскрытия ключа, подделка 2^-40). Пустое тело воспроизводит базовую линию P1; все входные данные заданы по умолчанию и переопределяемы. VALIDATED подрезультаты несут оракул своего исходного модуля (замкнутая радиометрия в dB; круговой проход обратной J/S; диаграмма Эйри по Бесселю из A&S и геометрия сферической шапки; втягивание DLL/PLL по Kaplan & Hegarty; тождество сферического касательного горизонта по eo_payload; размеры полей OSNMA SIS-ICD). MODELLED: репрезентативные величины геометрии/мощности и конкретные значения ячеек карты захвата. Не сертифицированный продукт по безопасности.

engine-kind-realtime-frame-eop-description = Бюджет прогноза лунной системы координат / ориентации Земли в реальном времени: таблица 1 из P4 (проверка согласованности ошибки системы координат — после обработки ~{ $lit_0_27 } m ↔ ~{ $lit_0_010 } ms и в реальном времени ~15 m ↔ ~{ $lit_0_5 } ms, причём каждое положение системы координат выражено как эквивалентная ошибка UT1 через рычаг L19 Δr = D_EM·ω⊕·ΔUT1) и таблица 2 (измеренная ошибка прогноза UT1 в зависимости от горизонта — кривая L18, считанная прямо с реального ряда IERS finals2000A: нижний предел Bulletin A − Bulletin B и ошибка многодневного предиктора по инерционности, каждая переведена в положение в системе Луны по L19), а также бюджет ошибки системы координат в реальном времени L21 как корень из суммы квадратов (EOP + эфемериды + нижний предел реализации). VALIDATED замкнутая форма (рычаг L19, ω⊕ проверена перекрёстно по углу вращения Земли CIO) и VALIDATED реальные данные (кривая L18 по реальным строкам finals2000A); MODELLED — величины ковариации OD лунного ретранслятора и нижний предел реализации системы координат (репрезентативные распределения), а также предиктор по инерционности (не эксплуатационный алгоритм Bulletin A от IERS). Не сертифицированный продукт системы координат реального времени.

engine-kind-aperture-duty-cycle-description = Рабочий цикл апертуры: разделение времени между навигацией и связью, которое подразумевает план контактов для пула управляемых апертур. Принимает план контактов (список окон `[[contacts]]` aos_s/los_s, каждое запрашивает навигацию или связь — тот же словарь aos_s/los_s, который выдаёт предсказатель `passes`), число апертур и ПОЛИТИКУ АРБИТРАЖА (по умолчанию приоритет навигации, либо приоритет связи, либо невытесняющая по принципу «первым пришёл — первым обслужен») и сообщает рабочий цикл навигации, рабочий цикл связи, простой и отказ по каждому сеансу — время контакта, которое сеанс запросил и которое ни одна апертура не обслужила. Точная развёртка интервалов по границам окон, так что соприкасающиеся окна никогда не конкурируют и ни одна секунда апертуры не учитывается дважды; секунды апертуры на навигацию, связь и простой накапливаются независимо и замыкаются на apertures*horizon_s. Отчёт указывает применённую политику, её полное определение, а также определения рабочего цикла и отказа, потому что значение рабочего цикла без политики арбитража невоспроизводимо. MODELLED арифметика планирования: время перенацеливания / перенастройки / смены не учитывается, когда апертура меняет службу или сеанс; в решении не участвуют ни объём данных, ни состояние буфера, ни энергетический бюджет, ни замыкание линии, а окна контактов — входные данные, их геометрия определяется тем, что их породило. Не продукт планирования наземного сегмента.

engine-kind-lunar-jamming-description = Подавление RF, родное для Луны: отношение подавитель/сигнал по каждому спутнику, эффективное C/N₀ и потеря захвата для пользователя на селенографической поверхности при подавителе на лунной поверхности (или приподнятом) над иллюстративной лунно-орбитальной группировкой класса Moonlight/LCNS из общедоступных источников. Объединяет существующую открытую физику подавления (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) с существующей геометрией лунного неба (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); геометрия и радиометрия заново не выводятся. В отличие от земного вида `jamming`, сигнальное плечо НЕ является фиксированной принимаемой мощностью: изотропная принимаемая мощность каждого спутника — это его собственный бюджет линии EIRP − FSPL(наклонная дальность), поэтому J/S меняется от спутника к спутнику с лунной дальностью и углом места. Сообщает ОДНУ СТРОКУ НА КАЖДУЮ ВИДИМУЮ ЛИНИЮ (эпоха, спутник) — азимут, угол места, наклонная дальность, обе принимаемые мощности, разностью которых является J/S, J/S, номинальное и эффективное C/N₀ и состояние захвата — а также сводные показатели качества рядом с этой таблицей (но не вместо неё) и ту же таблицу как артефакт CSV. Каждое выдаваемое числовое поле несёт единицу и класс происхождения. VALIDATED подрезультаты несут оракул своего исходного модуля (уравнение помехозащищённости и линия J/S по Kaplan & Hegarty §9.4, внешне сослано в тестах tests/gnss_denied_jamming_resilience_reference.rs; лунная геометрия lunar_service). Сама композиция проверена перекрёстно по независимому пути с двумя бюджетами линии (linkbudget::received_signal_power_dbw, иное выражение потерь в свободном пространстве) с точностью до 1e-9 dB. MODELLED: иллюстративная орбитальная группировка, репрезентативные EIRP / мощность подавителя / коэффициенты усиления антенн / шумовая температура и отсутствие затенения рельефом, многолучевости, динамики AGC и адаптивного обнуления. Не сертифицированный продукт по отказу в обслуживании. При настроенном подавителе отчёт также содержит КОНТУР БЛОКИРОВКИ С ПОЛОСОЙ НЕОПРЕДЕЛЁННОСТИ, а не контур, считанный по одному скаляру: полное измеренное распределение C/N₀ полезного сигнала по таблице спутников (n, min, p05, p25, median, p75, p95, max, mean, sample stdev и собственную асимметрию выборки) и контур, вычисленный в каждой из этих порядковых статистик по ОБОИМ критериям блокировки, которые распознаёт движок, — действующему критерию отношения мощностей (J/S = 30 dB, как в attack-surface и tracking-loop) и критерию потери захвата (эффективное C/N₀ падает до tracking_threshold_dbhz, критерий, который использует столбец состояния этого отчёта), — по обеим осям плоскости блокировки (требуемая EIRP подавителя при удалении сценария, удаление блокировки при EIRP сценария). Границы полосы — это contour(p05) и contour(p95), то же замкнутое отображение, применённое к собственным квантилям выборки: не sigma, подогнанная к выборке, и не median ± k·stdev, причём stdev выдаётся для преемственности и ничем не используется. Квантиль, уже находящийся на уровне порога слежения или ниже него, не имеет конечной блокирующей J/S, и его столбцы потери захвата равны null с учтённой причиной, а не усечённым радиусом.

engine-kind-ins-trn-coast-description = Модель ошибки выбега INS/TRN: ошибка положения в зависимости от длительности выбега, построенная по коэффициентам IMU, а не перебором предполагаемой скорости дрейфа. Пять вкладов роста — смещение акселерометра, наклон от смещения гироскопа через силу тяжести, случайное блуждание скорости, случайное блуждание угла и масштабный коэффициент относительно пройденного расстояния — каждый распространяется через девятисостоятельную модель ошибок инерциальной системы местного горизонта с обратной связью Шулера на заданных широте и высоте (рядом приводятся главные законы короткого выбега t², t³, t^1.5, t^2.5 и t¹/t²) и объединяется по ЗАДАННОМУ правилу (по умолчанию корень из суммы квадратов, либо линейная сумма, либо детерминированная сумма со стохастическим rss; все три вычисляются в каждом прогоне, чтобы выбор был виден, а не скрыт). Длительности выбега, при которых достигаются заданные вызывающим пороги положения (по умолчанию 10 m и 50 m), находятся существующим бисекционным методом движка, каждая с разбивкой по вкладам с указанием доминирующего источника, а пересечение каждого отдельного вклада дополнительно обращается алгебраически, так что оба результата согласуются. Режим навигации по рельефу ограничивает выбег периодическими определениями положения и сообщает наибольший интервал между определениями, при котором выдерживается каждый порог; определение только положения оставляет ошибку скорости и наклон живыми после определения, поэтому оно не всегда ограничивает выбег при любой частоте определений, и отчёт говорит об этом, а не возвращает ноль. MODELLED: коэффициенты класса IMU — репрезентативные значения диапазона, а не паспорт, а остаток привязки к рельефу — входные данные. Недостигнутый порог сообщается как null со статусом, а не как ноль. Не сертифицированный продукт по характеристикам инерциальной навигации.

engine-kind-lunar-vlbi-fim-description = Ковариация координат станций для лунной VLBI: частные производные задержки наблюдаемой lunar-vlbi, накопленные по явному РАСПИСАНИЮ (базы x эпохи) в информационную матрицу Фишера, обращённую и представленную как ковариация координат станций и sigma станции по каждой координате — вычисленный выходной результат движка, а не скалярная точность задержки, пропущенная через предполагаемый изотропный коэффициент равнораспределения g = 3. Состояние несёт ЖЁСТКО связанные с Землёй (ITRS) координаты станций, поэтому якобиан — это инерциальная частная производная, повёрнутая матрицей GCRS->ITRS каждой эпохи: именно вращение Земли делает эти координаты наблюдаемыми, и отчёт ИЗМЕРЯЕТ развёртку направления на источник в системе, связанной с Землёй, и склонение маяка, а не предполагает их. Одно наблюдение — это одна пара (база, эпоха) при НАХОЖДЕНИИ ОБЕИХ станций выше маски угла места с весом 1/delay_sigma_s^2. Сообщает ранг, дефект датума, число обусловленности, полный информационный спектр, ковариационную матрицу, sigma по каждой оси и 3-D для каждой станции и нуль-пространство свободной сети в каждом прогоне; при дефиците ранга главное значение sigma публикуется как NULL со статусом и никогда не считывается из почти сингулярной обратной матрицы. Значение равнораспределения c*delay_sigma_s*sqrt(g/N) для ТОГО ЖЕ расписания выдаётся рядом с вычисленным значением вместе с отношением, а также с изотропной границей по следу sqrt(p/trace(M)), которую неравенство AM-HM делает жёстким нижним пределом — так что отношение есть анизотропия, которую отбросило допущение. Замыкание задержек tau_ik = tau_ij + tau_jk делает геометрически независимыми только n-1 из n(n-1)/2 баз; отчёт указывает оба числа. MODELLED: эфемериды центра Луны, часы станций, тропосфера и параметры ориентации Земли считаются ФИКСИРОВАННЫМИ, а наблюдения — независимыми, поэтому ковариация — это граница Крамера — Рао для сокращённого набора параметров, а не предсказанный результат сеанса; sigma задержки, координаты станций и расписание — входные данные. Частная производная, которую якобиан геометрической задержки опускает (разностный член Шапиро), измеряется конечной разностью и выдаётся. Не геодезический продукт.

engine-kind-tracking-loop-description = Потеря захвата контуром слежения: C/N0 -> захват/срыв С ГИСТЕРЕЗИСОМ, время потери захвата и втягивание спуфера в зависимости от СКОРОСТИ смещения кода и несущей. Существующие критерии блокировки и захвата движка — это отношения принимаемой мощности (подавитель блокирует при J/S = 30 dB, спуфер захватывает при 3 dB); реальная потеря захвата — не отношение мощностей, а точка, где дрожание контура плюс динамическая нагрузка исчерпывают его бюджет порога слежения. Сообщает (1) тепловое дрожание 1-sigma несущей (Костас) и кода (некогерентный early/late) в зависимости от C/N0, с учётом потерь на возведение в квадрат, относительно заявленных правил 3*sigma_PLL + theta_e <= 45 deg (правило 15 градусов в форме трёх сигм) и 3*sigma_DLL + запаздывание на линейном изменении <= d/2 элемента кода; (2) пороги C/N0 срыва и повторного захвата с названным определяющим контуром, причём порог повторного захвата ВЫВЕДЕН из более широкой полосы, в которой приёмник повторно втягивается, а не задан, поэтому ширина гистерезиса должна находиться между 5*log10(ratio) и 10*log10(ratio) dB; (3) заявленное время потери захвата у детектора захвата с двумя порогами и подтверждающими выдержками при линейном изменении C/N0, сообщаемое отдельно от физического времени ухода по фазе (среднее время Витерби между проскальзываниями циклов, в log10 s, потому что оно охватывает сотни порядков); (4) пределы втягивания спуфера — наибольшую скорость сдвига кода и доплеровскую скорость несущей, которые могут отслеживать контуры жертвы, с картой по обеим осям, потому что спуфер, сдвигающий быстрее, не захватывает контур, а опережает его; и (5) РАДИУС БЛОКИРОВКИ, вытекающий из динамики контура, сообщаемый РЯДОМ с существующим радиусом по отношению мощностей, но не вместо него, с их знаковой разностью как отдельным именованным полем (denial_radius_delta_km) и определением рядом. Каждое выдаваемое числовое поле несёт единицу и класс происхождения. VALIDATED замкнутые формы: выражения дрожания несущей и кода, сокращение фильтра контура sqrt(2*B_n*T) и запаздывание на линейном изменении первого порядка перекрёстно проверены по собственному коррелятору sdr движка, прогнанному вперёд на синтетической ПЧ с начальным значением, — другой путь к тем же числам, — с точностью до { $lit_0_6 } %, { $lit_3_7 } % и { $lit_0_17 } % соответственно, а модифицированная функция Бесселя I0, лежащая за временем проскальзывания циклов, — по стандартным табличным значениям до 1e-7. Нижний предел применимости утверждается, а не просто заявляется: ниже ~32 dB-Hz при 1 ms реальный дискриминатор atan насыщается на диапазоне +-pi/2 и измеряет меньшее дрожание, чем любая линейная теория. MODELLED: полосы контуров, время интегрирования, разнос коррелятора, отношение полос втягивания, подтверждающие выдержки, мощность подавителя и коэффициенты усиления антенн — репрезентативные значения диапазона, а не паспорт. НЕ моделируются: дрожание генератора (девиация Аллана) и вибрации, ограничение полосы входного тракта, многолучевость, динамика AGC, потеря на переходах информационных битов, внешняя поддержка и любая поправка на полцикла в формуле проскальзывания циклов Костаса. При динамике контура у захвата спуфером вообще нет радиуса — определяющим ограничением служит скорость смещения, а не мощность, — поэтому это поле равно null с указанием причины, а не выдуманным числом. Не сертифицированный продукт по характеристикам приёмника.

engine-kind-araim-reference-check-description = Опубликованные эталонные векторы ARAIM, относящиеся к сертификации: горизонтальный и вертикальный уровни защиты ARAIM движка прогоняются на СОБСТВЕННЫХ разобранных числовых примерах подгруппы ARAIM Technical Subgroup рабочей группы WG-C с допуском (TOL_PL = 5e-2 m), который эти документы сами указывают. Два вектора зафиксированы как эталоны, каждый с URL получения, датой получения, SHA-256 исходного файла и страницей: Reference Airborne Algorithm Description Document v3.1 (2019), приложение D — самосогласованный и приёмочный вектор — и Milestone 3 Report (2016), приложение A, раздел A.IX, формулировка, на которую ссылаются исследовательские библиографии. Каждый опубликованный входной параметр (геометрическая матрица для 10 спутников и 2 орбитальных группировок, диагонали дисперсий C_int и C_acc, b_nom, P_sat, P_const и набор констант LPV-200) и каждый опубликованный выходной (VPL, HPL, EMT, sigma_v_acc, K_fa_3 и sigma_3, sigma_ss_3 и b_3 двух режимов отказа орбитальной группировки) сообщаются рядом с собственным числом движка и их абсолютной разностью. Уравнение уровня защиты здесь НЕ решается заново: список режимов эталона передаётся существующим raim::araim_protection_level / araim_integrity_risk движка, так что бисекция и гауссова алгебра хвостов, проходящие проверку, — собственные для движка; для него строятся только геометрия, подрешения, пороги обнаружения и опубликованное распределение бюджета. ВНЕШНЕ ПРОВЕРЕНО по вектору 2019 года: VPL { $lit_18_2926 } m против опубликованных { $lit_18_3 } m, HPL { $lit_13_4063 } m против { $lit_13_45 } m, EMT { $lit_7_2997 } m против { $lit_7_2998 } m, sigma_v_acc { $lit_1_3694 } m против { $lit_1_3694 } m, а все шесть опубликованных промежуточных значений — с точностью до половины единицы в последнем напечатанном десятичном знаке. Вектор 2016 года несёт два внутренних дефекта, которые отчёт называет, а не скрывает, — опечатку в знаке в строке 3 матрицы G и K_fa_3, вычисленный при 57 режимах отказа, тогда как документ указывает N_fault_max = 1 (12 режимов), — поэтому его промежуточные геометрические значения воспроизводятся точно, а уровни защиты сообщаются как измеренные расхождения и исключаются из приёмочного показателя; допуск никогда не расширяется, чтобы поглотить их. Каждое выдаваемое числовое поле несёт единицу и класс происхождения, а переписанное значение помечается `published`, чтобы его никогда нельзя было принять за вычисленное. ОБЛАСТЬ: реализован только N_fault_max = 1 (режимы отказа одного спутника и одной орбитальной группировки), а случай, у которого априорные оценки требуют одновременных многособытийных подмножеств отказов, ОТКЛОНЯЕТСЯ (REFUSED), а не молча усекается; обнаружение отказов, исключение, проверка согласованности по хи-квадрат и шаг перераспределения двойного учёта эталонного алгоритма находятся вне области. Это воспроизводит разобранный пример опубликованного эталонного алгоритма — это не сертификация, не документ лётной годности и не одобрение.

engine-kind-lunar-frame-campaign-description = Семипараметрический датум системы отсчёта по Гельмерту (подобия), порождаемый СИМУЛИРОВАННОЙ НАБЛЮДАТЕЛЬНОЙ КАМПАНИЕЙ, а не внесённым преобразованием. Сеть земных станций наблюдает каталог лунных поверхностных маяков по явному расписанию; частные производные задержки лунной VLBI накапливаются по этому расписанию в информационную матрицу Фишера координат маяков в точности как в lunar-vlbi-fim; и эта информация переносится через схему Гельмерта A = [I3 | [p]_x | p] в точках каталога в ковариацию датума H = A^T M_b A, диагностируемую crate::fim::crlb. НИКАКОЕ преобразование не вносится и ничего не восстанавливается по подложенному ответу, поэтому сообщаемая точность датума следует из программы наблюдений: уменьшение sigma задержки вдвое уменьшает её ровно вдвое, а удлинение дуги улучшает её, потому что либрация, которую ИЗМЕРЯЕТ отчёт (sub_earth_direction_sweep_deg), отделяет координату маяка вдоль луча зрения от координат в картинной плоскости. Ранг, дефект датума, число обусловленности, полный спектр, ненаблюдаемые направления В СЕМИПАРАМЕТРИЧЕСКОМ БАЗИСЕ, самое слабое направление даже при полном ранге и доля каждого параметра в нём выдаются в каждом прогоне; параметр, который кампания не ограничивает, публикуется как NULL со статусом и никогда не считывается из почти сингулярной обратной матрицы. Корреляция ошибок маяков измеряется, а не предполагается: при фиксированных станциях ни одно наблюдение не затрагивает два маяка, поэтому информационная матрица строго блочно-диагональна (offblock_fraction 0), а при оцениваемых станциях блок после маргинализации по Шуру связан, причём наведённая корреляция выводится, а всё распространение перезапускается с ней отброшенной, так что цена допущения о независимости становится числом. То же распространение при изотропной sigma по каждой координате и ошибка восстановления, о которой сообщает сценарий lunar-frame-realisation, выполняются здесь и выводятся рядом со значением кампании с их отношениями. MODELLED: каталог маяков взят из источников, но КАМПАНИЯ симулирована — сеть станций и sigma задержки — иллюстративные входные данные, отдельные наблюдения задержки считаются независимыми, а эфемериды центра Луны, часы станций, тропосфера и параметры ориентации Земли считаются ФИКСИРОВАННЫМИ, поэтому ковариация датума — это граница Крамера — Рао для сокращённого набора параметров. Не геодезический продукт.

engine-kind-lunar-llr-datum-description = Семипараметрический лунный датум системы отсчёта по Гельмерту, порождаемый РЕАЛЬНОЙ, АРХИВНОЙ наблюдательной кампанией, а не симулированной. Если lunar-frame-campaign убрал внесённое преобразование, но всё ещё задавал сеть станций, расписание и sigma наблюдения как ИЛЛЮСТРАТИВНЫЕ входные данные, то этот вид берёт все три из измерений: эпохи — это времена передачи с Земли архивных нормальных точек ILRS Consolidated Laser Ranging Data, наблюдения — лазерные дальности, действительно посланные на пять массивов ретрорефлекторов на Луне, а вес каждого наблюдения — собственная архивная точность этой нормальной точки bin_rms/sqrt(n_raw), считанная из файла. Координаты станций берутся из решения IERS ITRF2020 SLR (приведены к эпохе по их опубликованным скоростям), а координаты отражателей — из JPL DE430, таблица 7, в системе среднего положения Земли/среднего вращения, которую реализует модель IAU 2015 WGCCRE. Частные производные дальности накапливаются в совместную информационную матрицу Фишера координат отражателей и переносятся через ту же схему Гельмерта в ковариацию датума, диагностируемую crate::fim::crlb. Ранг, дефект, обусловленность, спектр, ненаблюдаемые направления в семипараметрическом базисе, самое слабое направление при полном ранге и доля каждого параметра в нём выдаются в каждом прогоне, а неограниченный параметр публикуется как NULL со статусом. Корреляция между массивами ИЗМЕРЯЕТСЯ и оказывается строго нулевой, а не предполагается, потому что лазерная дальность затрагивает один массив. Запись, которую каталоги не могут разместить, — станция без опубликованного положения ITRF, — ПРОПУСКАЕТСЯ И СЧИТАЕТСЯ, ей никогда не подставляется координата. КАКИЕ ЗВЕНЬЯ ИЗМЕРЕНЫ, А КАКИЕ MODELLED — ЭТО СОДЕРЖАНИЕ ОТЧЁТА, А НЕ СНОСКА: эфемериды центра Луны и ориентация тела IAU остаются смоделированными, а их совокупная величина выдаётся как невязка «наблюдаемое минус вычисленное» односторонней дальности по всем использованным точкам; тропосфера, приливы твёрдого тела, эксцентриситет станции, движение полюса, UT1-UTC, релятивистская задержка и часы станций отсутствуют и находятся внутри этой невязки. Поскольку ошибка эфемерид влияет на ковариацию только через направление каждого луча зрения, каждый прогон также заново решает весь датум со всеми частными производными, наклонёнными на sensitivity_tilt_deg (знак чередуется), и выдаёт отношение, так что нечувствительность ковариации к смоделированным эфемеридам — это число, а не довод. Собственные показатели симулированной кампании ПРОГОНЯЮТСЯ и выводятся рядом с измеренными, а не переписываются. MODELLED: семипараметрические показатели — это граница Крамера — Рао для сокращённого набора параметров на реальном расписании — не решённый датум, не анализ LLR и не геодезический продукт. Зафиксированный срез реальных данных поставляется с репозиторием, но не с опубликованным крейтом; укажите в data_dir копию этого среза.

engine-kind-lunar-beacon-description = Усиление орбитального лунного навигационного обслуживания поверхностными маяками в виде запускаемой таблицы «до/после». Пользователь на южном полюсе видит разреженный орбитальный набор в узком участке неба, поэтому геометрия дальнометрии плохо обусловлена; несколько ПРИВЯЗАННЫХ ПОВЕРХНОСТНЫХ МАЯКОВ дают строки направлений на источник с низким углом места и широким азимутом, которых недостаёт набору, целиком находящемуся над головой, и горизонтальный геометрический фактор ухудшения точности резко падает. Сценарий сообщает три конфигурации в одну эпоху — только спутники, спутники плюс видимые маяки и более крупная орбитальная группировка как альтернативный путь к той же геометрии — каждую с числом видимых источников, полным DOP и реализованной точностью 1-sigma в МЕТРАХ, получаемой умножением на эквивалентную пользовательскую ошибку дальнометрии каждого маяка, собранную как корень из суммы квадратов членов синхронизации часов, многолучевости и привязки. Видимость маяка определяется геометрическим горизонтом безвоздушной Луны по двум высотам (атмосферы нет, поэтому граница точна), а сборка DOP — то же ядро, проверенное перекрёстно по gnss_lib_py в tests/dop_reference.rs. ПОЧЕМУ ЭТОТ ВИД СУЩЕСТВУЕТ: стоящий за ним модуль находится в движке и проверен по независимому пути DOP с L08/L09, но не был достижим из запуска — ни вида, ни ветви диспетчеризации, ни поставляемого файла. README объявлял эту возможность, а матрица верификации вообще НЕ содержала для неё строки, так что она одновременно заявлялась в тексте и не заявлялась в реестре, оставаясь недостижимой в движке. Значения по умолчанию — это геометрия, у которой уже есть зафиксированный эталонный результат (пользователь на -80 deg с антенной 2 m, три маяка на -80/0, -79/+60 и -79/-60 на высоте 2 km, иллюстративный снимок LCNS из шести спутников при t=0, маска 5 deg), поэтому пустой запуск воспроизводит таблицу, уже покрытую оракулом, а не выдумывает новые числа. MODELLED: проект орбитальной группировки, размещение маяков и каждая величина бюджета ошибок — иллюстративные входные данные, а не действующая привязка или измеренная линия; внешне заякорены только арифметика DOP, замкнутая форма горизонта и соотношение sigma = DOP x sigma_URE. Не обязательство по характеристикам обслуживания.

engine-kind-earth-gnss-lunar-description = Приём GNSS Земли на лунном расстоянии — слой слабого сигнала, который называет статья об устойчивости в условиях конфликта и для которого у движка не было модели. Спутник GNSS направляет антенну на Землю; приёмник вблизи Луны находится примерно в пятнадцати орбитальных радиусах, поэтому одновременно проявляются три эффекта. Земля ЗАКРЫВАЕТ ГЛАВНУЮ ОСЬ: с 26,560 km она видна под полууглом { $lit_13_9 } deg, поэтому любой луч в сторону Луны должен покинуть передатчик не менее чем на этот угол от надира, что убирает пик диаграммы ещё до расчёта какой-либо мощности. Остаются КРАЙ ГЛАВНОГО ЛЕПЕСТКА И БОКОВЫЕ ЛЕПЕСТКИ — режим, в котором полезная нагрузка LuGRE реально работала в 2025 году. А потери в свободном пространстве составляют около 208 dB на L1, примерно на 25 dB больше, чем платит наземный пользователь. Отчёт выдаёт по одной строке на спутник (угол от оси, закрытие Землёй, дальность, потери на трассе, усиление передачи под этим углом, принимаемая мощность, отношение несущей к плотности шума) и агрегирует только линии, преодолевающие порог слежения. ОН ТАКЖЕ СООБЩАЕТ ОБУСЛОВЛЕННОСТЬ, потому что именно она определяет этот слой: каждый видимый спутник лежит внутри конуса шириной в пару градусов, если смотреть с Луны, поэтому направления на источники почти параллельны, геометрический фактор ухудшения точности огромен, а определение по GNSS Земли на лунном расстоянии — это наблюдение класса ВРЕМЕНИ в гораздо большей степени, чем класса положения. MODELLED, и причина — диаграмма передачи: усиление под углом — это однородная круглая апертура (Эйри), тогда как реальная антенна GPS L1 — двенадцатиэлементная спиральная решётка с профилированным главным лепестком и неэйриевскими боковыми лепестками. Измеренные диаграммы существуют и здесь не включены, поэтому порядки и порядки величин осмысленны, а dB любого одного спутника — нет. Намеренно ОТСУТСТВУЮТ, и каждое делает бюджет оптимистичным: ионосферные и тропосферные потери на лучах, скользящих по лимбу, поляризационные потери, потери на наведение и реализацию, а Земля сферическая без рефракционного расширения. Положение Луны — ВХОДНЫЕ данные (дальность плюс инерциальное направление), а не обращение к эфемеридам, потому что проверяются линия связи и геометрия луча. Для перевода этой строки в Validated нужны измеренная диаграмма передачи и нормальные точки LuGRE; ни то, ни другое не входит в репозиторий и здесь не выдумывается.

engine-kind-lunar-infrastructure-description = MODELLED исследования орбиты и поверхности Луны как навигационной и геодезической инфраструктуры, пять исследований за одним видом, выбираемых параметром `study`: od-consistency (бортовое определение орбиты по GNSS Земли на NRHO или ELFO против независимого наземного радиометрического определения орбиты, оцениваемое по их собственным ковариациям на методе Монте-Карло с начальным значением), carrier-phase (совместная двойная разность фазы несущей поверхность — орбитальный аппарат и разрешение целочисленных неоднозначностей методом LAMBDA), frame-coestimation (поверхностная станция и орбитальные аппараты, добавленные к дальнометрии земных станций для семипараметрического лунного датума системы отсчёта), space-tie (GNSS, VLBI и лазерная дальнометрия на одном аппарате, точность привязки системы отсчёта против ошибки локальной привязки) и geodesy-sensitivity (информация Фишера о лунных числах Лява h2, k2, l2 и физической либрации по лазерной дальнометрии, слежению за орбитальными аппаратами, поверхностному гравиметру и поверхностным часам). Ограниченная модель трёх тел с заявленными упрощениями; численные результаты проверены по независимым программам, и ничто не сравнивается с измерением лунной величины.

engine-kind-cislunar-arc-recovery-description = MODELLED независимый тест оценщика порога наблюдаемости по длине дуги в пространстве Земля–Луна. Этот порог — это считывание РАНГА матрицы наблюдаемости, собранной из АНАЛИТИЧЕСКИХ строк якобиана дальности и АНАЛИТИЧЕСКОЙ вариационной матрицы перехода состояния, а его перекрёстная проверка квадратно-корневым информационным фильтром сворачивает те же строки — проверка согласованности двух численных механизмов, а не подтверждение. Этот вид даёт недостающего арбитра: пакетный оценщик по методу наименьших квадратов, который действительно ВОССТАНАВЛИВАЕТ начальное состояние ведущего аппарата по симулированным измерениям, причём частные производные измерений берутся как ЦЕНТРАЛЬНЫЕ КОНЕЧНЫЕ РАЗНОСТИ составной прямой модели. Он не вызывает ни аналитической строки якобиана, ни вариационной STM, ни сингулярного или собственного разложения, ни допуска по рангу, ни квадратно-корневого информационного фильтра — защита по исходному тексту в tests/cislunar_arc_recovery_reference.rs делает это проверяемым, — тогда как динамика (тот же поток RK4 CR3BP), начальные условия (та же группировка с дифференциальной коррекцией), скалярная наблюдаемая и сетка эпох намеренно общие и названы в выдаваемом блоке `independence`, потому что два анализа одной физической задачи должны согласовываться о физике, чтобы быть сопоставимыми. Два критерия, каждый перебирается по пяти декадам своей границы: БЕЗШУМОВОЕ ВОССТАНОВЛЕНИЕ (конечная ошибка состояния каждого испытания с начальным значением не более recovery_factor от его априорного смещения — аналог ранга, без допуска по сингулярным значениям) и ОЦЕНИВАЕМОСТЬ ПО МОНТЕ-КАРЛО (измеренный RMS ошибки положения по ансамблю шума с начальным значением ниже заданной границы — аналог оцениваемости, измеренный, а не предсказанный). Поддерживает плоское четырёхсостоятельное и пространственное шестисостоятельное состояние, семейства DRO / гало L2 / NRHO L2, наблюдаемые дальности и скорости изменения дальности, а также полярную параметризацию с центром в Луне, в которой преобразование применяется к СОСТОЯНИЮ, а прямая модель дифференцируется заново там. ИЗМЕРЕНО на опубликованной плоской сетке DRO: оценщик восстанавливает четырёхсостоятельное состояние начиная с { $lit_0_782609 } h против { $lit_2_086957 } h по критерию ранга при rel_tol 1e-6 (отношение { $lit_0_375 }) — порог ранга НЕ подтверждается как граница восстановимости, — тогда как измеренная граница оцениваемости попадает в ту же ячейку сетки, что и формальная, { $lit_5_739130 } h, а измеренная кривая ошибки воспроизводит формальную 1-sigma по 21 длине дуги с геометрическим средним отношением { $lit_0_98 }. MODELLED: проект орбитальной группировки, сетка эпох, единственная отслеживаемая линия, величина смещения, sigma измерения и две заявленные границы. Не сертифицированный продукт по навигационным характеристикам.

engine-kind-telecom-timing-description = Телекоммуникационная синхронизация: ошибка времени, максимальная ошибка временного интервала (MTIE) и временная девиация (TDEV) для holdover GNSS, проверяемые по маскам ITU-T с отметкой PASS или FAIL и запасом по каждой маске. Входными данными служит либо СИНТЕТИЧЕСКИЙ HOLDOVER (предустановка генератора -- ocxo, rubidium, caesium или csac, каждая с показателями стабильности, старения и температурными показателями из названного общедоступного паспорта Microchip -- плюс время потери GNSS, длина записи и интервал отсчётов; свободно идущие часы несут белый, фликкер- и, где этого требует подгонка по паспорту, случайно-блуждающий шум частоты, линейное старение и синусоидальный температурный член), либо ЗАГРУЖЕННЫЙ РЯД пар [time_s, time_error_ns], заданный встроенно (и, только в нативных сборках, файл CSV). Маски: ITU-T G.8272 (07/2025) PRTC-A и PRTC-B (max|TE| 100 / 40 ns, MTIE таблицы 1-2, TDEV таблицы 3-4); G.8272.1 (2024) Amd. 1 (07/2025) ePRTC в режиме захвата (30 ns, таблицы 1-2) и holdover ePRTC-A (огибающая ошибки времени из таблицы 3, растущая с 30 ns до 100 ns за период holdover H, задаваемый длительностью захвата, MTIE таблица 4, TDEV таблица 5); G.8273.2 (2023) Amd. 2 (11/2025) классы T-BC/T-TSC A-C (max|TE|, постоянная ошибка времени, MTIE и TDEV после фильтра нижних частот) и класс D (max|TE_L| 5 ns, единственная величина класса D, не оставленная для дальнейшего изучения); G.8271.1 (2022) Amd. 3 (05/2025) контрольная точка C (max|TE_L| 1100 / 600 / 100 ns с MTIE таблицы 7-1 – 7-3). Каждая запись, которую Рекомендация помечает для дальнейшего изучения, отсутствует, а не заполняется, и каждый отчёт перечисляет нереализованное. Также сообщает время превышения каждого бюджета максимальной ошибки времени (по умолчанию: 100 ns ePRTC max|TE_HO|, 400 ns распределение holdover сети, 1100 ns точка C, { $lit_1_5 } us класс 4), кривые MTIE/TDEV как таблицу CSV с пределом каждой маски и запись единиц и происхождения для каждого числового поля. VALIDATED: оценщики MTIE и TDEV по пакету allantools на зафиксированном ряде holdover. MODELLED: таблицы масок — это переписанные значения, а синтетический holdover — модель, построенная по максимумам из паспортов, а не измерение какого-либо устройства. Не тест на соответствие.

engine-kind-slot-timing-description = Синхронизация слотов: секунды до выхода свободно идущих часов за защитный интервал слота маршрутизации или постановки задач, индексируемого по времени (наибольшая абсолютная ошибка времени, которую допускает слот), вклад каждого члена в этот момент с названием доминирующего (неопределённость определения, белый фазовый шум, белый, фликкер-, случайно-блуждающий и случайно-бегущий шум частоты, остаточное смещение частоты, температура, старение), время, оставшееся с последнего определения, и наибольший интервал между определениями, удерживающий часы внутри, за вычетом задержки определения. Генератор — это значение по умолчанию для КЛАССА (csac, uso, dsac, tcxo, ocxo или rafs: одна указанная девиация Аллана за одну секунду и предполагаемый нижний предел красного шума), ПРЕДУСТАНОВКА ПАСПОРТА telecom-timing или встроенный ПАСПОРТ (максимумы девиации Аллана, подогнанные как огибающая, плюс старение и температурный коэффициент), либо встроенная ИЗМЕРЕННАЯ ЗАПИСЬ ФАЗЫ (её перекрывающаяся девиация Аллана, подогнанная взвешенным методом наименьших квадратов в базисе белой фазы и частотной модуляции по IEEE Std 1139, так что нижний предел красного шума измеряется, а не предполагается). Нарушение за пределами наибольшего времени усреднения, которое поддерживает паспорт или запись, помечается как экстраполированное. Необязательный раздел о спуфинге добавляет уровень защиты синхронизации для приёмника на орбите: орбитальную скорость и период, как долго одиночный наземный спуфер может достигать спутника за пролёт, нижний предел монитора с опорой на часы и задержку обнаружения CUSUM, условную границу, смещение, накапливаемое спуфером при заданной максимальной скорости нарастания до того, как спутник выйдет из его зоны досягаемости или будет выполнена независимая проверка, и независима ли каждая проверка при наземном контакте или по межспутниковой линии от этого спуфера. VALIDATED: инверсия holdover по подогнанной записи, отложенная на реальных цезиевых часах, измеренных относительно водородного мазера (tests/slot_timing_cs5071a_holdout.rs, зависит от наличия данных); на измеренном кварцевом генераторе отложенный прогноз консервативен, но не укладывается в порог, поэтому случай кварца — MODELLED. MODELLED: источники по классам и паспортам, детерминированные члены и оценка спуфинга.

engine-kind-spectrum-description = Модель спектра L-диапазона и водопад: весь L-диапазон GNSS как одна спектральная плотность мощности (PSD), частота по горизонтали, время вниз, на сценарной временной шкале подавителей. СИГНАЛЫ: GPS L1 C/A и L2C (BPSK(1)), открытая служба Galileo E1 (MBOC(6,1,1/11) или BOC(1,1)), GPS L5 и Galileo E5a (BPSK(10)), каждый на своей несущей с минимальной принимаемой мощностью по спецификации интерфейса (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), если не переопределено; GLONASS, BeiDou и Galileo E6 не моделируются. ПОДАВИТЕЛИ: непрерывный тон, плоский узкополосный шум, линейный пилообразный чирп и широкополосный шум, согласованный с собственной модуляцией диапазона, каждый с центром, полосой, принимаемой мощностью (прямой, либо EIRP и дальность через потери в свободном пространстве вида jamming) и временами включения/выключения. Каждый подавитель оценивается по каждому диапазону его коэффициентом спектрального разделения kappa по полосе приёмника, и (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; для одного подавителя это равно уравнению помехозащищённости вида jamming с Q = 1/(R_c kappa), и отчёт приводит эту перекрёстную проверку (и репрезентативное значение Q вида jamming рядом). Шумовой пол равен k T_sys, где T_sys = T_ant + 290 K (F - 1). Водопад усредняет каждую ячейку по её интервалу и строке (чирпы — точно, целые развёртки плюс неполная; подавители, переключающиеся в середине строки, — по их скважности), так что временная шкала C/N0 и картинка получаются из одних и тех же чисел; result.json несёт сетку, усреднённую блоками по мощности, C/N0 и J/S по каждому диапазону для каждой строки, а для каждого подавителя по каждому диапазону — SSC, Q, J/S, J/S в полосе и установившееся C/N0. Необязательный [iq]: модель, отрисованная как комплексный IQ в один момент, записанная в запись SigMF (cf32_le или ci16_le) и считанная из неё обратно, и сравниваемая с оценкой Уэлча. Необязательная [recording] (нативные сборки): PSD Уэлча реальной записи SigMF рядом с моделью. VALIDATED: PSD сигналов по учебниковым ширинам главного лепестка (BPSK(n) 2n x { $lit_1_023 } MHz от нуля до нуля; лепестки BOC(1,1) с центрами на +/-{ $lit_1_023 } MHz) и коэффициенты спектрального разделения по их замкнутым формам Парсеваля и Q = 1 (CW) и { $lit_1_5 } (согласованный) по Kaplan & Hegarty. MODELLED: мощности подавителей, временная шкала, полосы входного тракта, трактовка непрерывного спектра (без линий кода) и отсутствие AGC, бланкирования и диаграммы антенны.

engine-kind-solar-system-description = Вся Солнечная система на одну эпоху, для PNT (позиционирование, навигация и время) вокруг любого тела. Для Солнца, восьми планет, Плутона, Луны, Фобоса, Деймоса, Ио, Европы, Ганимеда, Каллисто и Титана сообщает гелиоцентрическое положение и скорость в ICRF (International Celestial Reference Frame, экваториальная J2000), гелиоцентрическое расстояние и эклиптические долготу и широту J2000, гравитационный параметр, экваториальный и средний радиус, J2 там, где она опубликована, и её опорный радиус, период звёздного вращения, полюс IAU и нулевой меридиан на эпоху, орбитальный трек, отсчитанный за один оборот (гелиоцентрический для планет, с центром в родительском теле для спутников), а также световое время, одностороннюю и двустороннюю дальность, солнечную задержку Шапиро и угол отстояния от Солнца от тела-наблюдателя (по умолчанию Земля); дополнительные связи from/to обрабатываются так же. Положения: кеплеровы элементы JPL по Standish и Williams (таблица 1 для 1800 AD – 2050 AD, таблицы 2a/2b для 3000 BC – 3000 AD) с номинальной ошибкой каждой планеты, лунные ряды Montenbruck & Gill для разделения Земля–Луна, средние элементы JPL с синхронной скоростью вращения IAU для спутников Марса и галилеевых спутников и модель вращения IAU для Титана. Световое время: радиометрическое решение с неподвижной точкой, передатчик в запаздывающем положении; ньютоновское, с задержкой Шапиро, сообщаемой отдельно. VALIDATED по JPL Horizons (DE441) в пределах удвоенной номинальной ошибки: от Меркурия до Сатурна и Земля по таблице 1 (наихудшее значение в { $lit_1_87 } номинальной) и все восемь планет по таблицам 2a/2b (наихудшее в { $lit_1_71 }), а также световое время от Земли до Марса и Юпитера. MODELLED, каждая строка помечена: Уран и Нептун по таблице 1 ({ $lit_2_0 } и { $lit_5_2 } номинальной ошибки относительно DE441), Плутон (строка 1992 года; ошибка не указана), Луна и семь спутников (измерено относительно Horizons, опубликованной границы нет).

engine-kind-body-pnt-description = Позиционирование вокруг любого тела Солнечной системы: орбитальный аппарат или посадочный модуль на поверхности вокруг центрального тела, выбираемого по имени (Марс, Луна, Европа, Ганимед, Титан и остальной каталог Солнечной системы), навигирующий по односторонним псевдодальностям от малой навигационной орбитальной группировки Уокера вокруг тела (двухтельные орбиты с вековым дрейфом по J2 самого тела, неизвестные часы пользователя) и, необязательно, по свободной от часов двусторонней дальности дальнего космоса от Земли, направление и расстояние до которой берутся из аналитических эфемерид Солнечной системы в каждую эпоху. Линии визирования блокируются средней сферой тела, а пользователю на поверхности дополнительно нужна маска угла места. На эпоху: ретрансляторы в зоне видимости, находится ли Земля над лимбом, GDOP и PDOP только по группировке (геометрический фактор и фактор ухудшения точности по положению), формальная однократная неопределённость положения с строкой Земли и без неё и ошибка определения методом наименьших квадратов Гаусса — Ньютона с начальным значением в каждом из двух вариантов; за прогон: доступность, видимость Земли, медианный PDOP, RMS ошибки и медианная формальная sigma, а также световое время от Земли до тела, путь туда и обратно, задержка Шапиро и угол отстояния от Солнца на эпоху. MODELLED: орбиты ретрансляторов, уровни шума и мгновенная модель измерений — выбор моделирования, а не проверено по навигационным данным какой-либо миссии; константы тела — опубликованные значения, указанные в body.rs, а геометрия Земли наследует метки эфемерид Солнечной системы.

engine-kind-constellation-design-description = Проектирование орбитальных группировок в масштабе: схемы Уокера DELTA и Уокера STAR в соглашении i: T/P/F (узлы распределены по 360 или 180 deg, расстояние в плоскости 360*P/T, сдвиг фазы между плоскостями 360*F/T), явные списки элементов и многооболочечные проекты, несколько орбитальных группировок в одном прогоне, вокруг Земли, Луны, Марса или любой другой планеты, Плутона либо крупного спутника с константами из модуля тел (теми же, что используют виды solar-system и body-pnt). ПРЕДУСТАНОВКИ по опубликованным номинальным элементам: gps-baseline и gps-expandable (24 слота и шесть расширяемых пар впереди/позади из GPS Standard Positioning Service Performance Standard, 5-е издание 2020 года, таблицы 3.2-1 – 3.2-3), galileo (Уокер 24/3/1 на 29 599.801 km и 56 deg, Galileo Open Service Service Definition Document, выпуск 1.1, таблицы 1 и 23), beidou и beidou-meo (Уокер 24/3/1 на 21 528 km и 55 deg плюс три геостационарных спутника на 80, { $lit_110_5 } и 140 deg E и три наклонных геосинхронных спутника на 55 deg, BeiDou Open Service Performance Standard 3.0, раздел 4.1; фаза MEO и пересечение наклонных геосинхронных на 118 deg E смоделированы, потому что стандарт их не указывает) и glonass (24/3/1 на 19 100 km и { $lit_64_8 } deg по формуле слотов из GLONASS Interface Control Document, издание 5.1, раздел 5.2). ПОКРЫТИЕ И ФАКТОР УХУДШЕНИЯ ТОЧНОСТИ: по сетке широты/долготы и дискретизированному окну с маской угла места — число спутников в зоне видимости, GDOP, PDOP, HDOP и VDOP по каждой ячейке, доступность (определение с PDOP не выше порога, по умолчанию 6) по каждой ячейке, глобально (с весом по площади) и в наихудшем пункте, с одними часами приёмника на каждую орбитальную группировку, если не clock = "common". Масштабируется до тысяч спутников: видимость — это скалярное произведение с половинным углом покрытия каждого спутника, а спутники разбиваются на полосы по подспутниковой широте в каждую эпоху, так что строка сетки проверяет лишь те, которые могут быть в зоне видимости; отчёт подсчитывает сэкономленные проверки пар. JSON несёт карты сетки и прореженные трассы каждого спутника на поверхности. VALIDATED: генератор Уокера по таблице 23 Galileo OS SDD и формуле слотов GLONASS ICD, предустановка GPS по опубликованному столбцу экваториальных пересечений из таблицы 3.2-1 SPS PS и глобальное распределение HDOP базовой группировки GPS по приложению B SPS PS (медиана { $lit_0_94 }, 95% { $lit_1_25 }, среднее { $lit_0_96 }, допуск { $lit_0_03 }). MODELLED: двухтельные орбиты с необязательным вековым J2, сферическое тело, только геометрическая видимость (без мощности сигнала, состояния и рельефа) и относительная фаза между разными системами, которая не является снимком какой-либо реальной даты.

engine-kind-campaign-description = Кампания: существующие виды сценариев, объединённые в один прогон, причём каждое число считывается из реального прогона названного вида. Четыре раздела в любом сочетании. ФАЗЫ: связанная миссия на одной общей временной шкале -- каждая фаза запускает один или несколько сценариев (например, подавление, затем спуфинг, затем часы в holdover с рядом выбегающей инерциальной навигационной системой, затем тревога по целостности, затем восстановление), их выходные данные считываются в именованные каналы (ошибка времени часов относительно их защитного интервала, отношение несущей к плотности шума относительно порога слежения, уровень защиты относительно предела тревоги, ошибка положения, отслеживающие спутники, флаги тревоги) предустановкой для вида или явными путями результатов и передискретизируются на общую сетку с нулевым порядком удержания, с границами фаз и событиями; состояние передаётся по carry (канал продолжается с конечного значения предыдущей фазы), handoff (число предыдущей фазы записывается в сценарий этой фазы) и end_at (фаза заканчивается в момент, вычисленный прогоном, например во время обнаружения монитором спуфинга). ПЕРЕБОР: сетка по одному–трём ключам сценария с точками любого вида (целочисленный сегмент индексирует массив таблиц, как в system.2.sisre_m), с метриками, считываемыми по пути результата, и, при числе прогонов больше одного, ансамблем Монте-Карло с начальным значением в каждом узле. MONTE_CARLO: реализация k запускается с base_seed + k; каждая метрика сообщает среднее, стандартное отклонение, 5-й/50-й/95-й процентили по ближайшему рангу и бутстреп-доверительный интервал 95% для среднего с фиксированным начальным значением. COMPOSE: несколько сценариев при общих значениях (мощность и положение одного подавителя записываются в морской и дорожный приёмники), со сводным итогом «наилучший/наихудший». Результат несёт хеш кампании, дайджест по каждому результату участников и запись единиц для каждого выдаваемого числа; экспорт интероперабельности записывает каждый сценарий-участник, имеющий геометрию, как отдельный набор файлов. Тождества композиции проверяются: однофазная кампания воспроизводит автономный прогон бит в бит, ансамбль с фиксированным начальным значением стабилен побайтово, а для часов с белым частотным шумом среднее по ансамблю попадает в сообщённый интервал, причём разброс соответствует sqrt(q_wf * tau). MODELLED: аддитивный перенос carry и нулевой порядок удержания — выбор моделирования, а каждая фаза несёт метку вида, который её запускал.

engine-kind-leo-signal-description = Проекты сигналов LEO-PNT: параметризованные сигналы позиционирования, навигации и времени (PNT) на низкой околоземной орбите (LEO) для любой системы, диапазона и структуры. СИГНАЛ — это диапазон (центральная частота, полоса передачи, распределение ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) и компоненты (поиск, данные, пилот; любое подмножество), каждый с модуляцией (BPSK(n) с дробным n, BOC(m,n), MBOC(6,1,p) или плоский диапазон типа OFDM), долей мощности, необязательными смещениями поднесущих FDMA, длиной кода и скоростью данных. Сигналы берутся из встроенных общедоступных файлов предустановок (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; каждый со своим URL источника и каждым неопубликованным значением, помеченным REPRESENTATIVE) либо задаются встроенно. НА КАЖДЫЙ СИГНАЛ: ограниченная по полосе спектральная плотность мощности и доля мощности каждого компонента, которую пропускает полоса передачи (замкнутая форма BPSK рядом с численным значением), среднеквадратичная (Габора) полоса, тепловое дрожание слежения за кодом контуром DLL в зависимости от C/N0 и разноса early-late по формуле early-late (когерентной или некогерентной) с ограничением полосы по Betz & Kolodziejski 2009 с её учебниковой формой для неограниченной полосы и границей Габора при исчезающем разносе, точность дальнометрии в метрах, пространство поиска при захвате (доплеровские ячейки по максимальному доплеру орбиты плюс члены генератора и пользователя, умноженные на кодовые ячейки), вероятность обнаружения квадратичным детектором и среднее время последовательного и кодово-параллельного захвата, коэффициент спектрального разделения сигнала относительно GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b и E5 AltBOC и каждого из них относительно сигнала с ухудшением C/N0, а также CW, широкополосное и согласованное J/S, которое выдерживает отслеживаемый компонент, по собственному механизму SSC вида spectrum. КОМПРОМИСС ПО ДИАПАЗОНУ: ионосферная задержка первого порядка ({ $lit_40_3 } TEC/f^2), потери в свободном пространстве, точность дальнометрии при равном C/N0 и при равной EIRP и устойчивость к подавителю. Необязательные ПРОВЕРКИ ФОРМЫ сопоставляют спектр проекта с описанным измерением (согласованность MODELLED). VALIDATED: замкнутые формы мощности BPSK в полосе ({ $lit_90_3 } % в главном лепестке) и полосы Габора, ограниченное по полосе дрожание, сводящееся к учебниковой когерентной форме early-late и к границе Габора, коэффициент спектрального разделения BPSK со смещением по замкнутой форме Парсеваля, единичная площадь спектра AltBOC и максимальный доплер LEO по опубликованным значениям Xona Pulsar (32-34 kHz) и Iridium (36 kHz). MODELLED: каждый проект, распределение мощности, C/N0 и уровень подавителя; спектры EFQPSK, CSK и OFDM аппроксимируются.

engine-kind-leo-pass-description = Пролёт LEO и бюджет линии по диапазонам для LEO-PNT (позиционирование, навигация и время с низкой околоземной орбиты), независимо от системы: пользователь (наземный, морской, воздушный или в помещении, неподвижный или движущийся) и один или несколько спутников LEO из РАСЧЁТНОГО ПРОЛЁТА (круговая орбита, размещённая так, чтобы пользователь видел один пролёт с выбранным максимальным углом места в выбранное время, солнечно-синхронная по запросу), явных ЭЛЕМЕНТОВ, TLE (двухстрочный набор элементов) через SGP4 движка или группировки УОКЕРА, построенной кодом проектирования орбитальных группировок (сообщаются самые высокие пролёты). Диапазоны берутся из именованной предустановки (универсальный многодиапазонный UHF/L/S/C, универсальный диапазон C, Xona Pulsar X1/X5, Iridium STL, Starlink как оппортунистический сигнал только по Доплеру, CentiSpace и необязательная предустановка Celeste IOD, помеченная WORKSHOP) либо записываются в сценарий; каждая предустановка указывает, являются ли её числа PUBLIC (с URL), REPRESENTATIVE или WORKSHOP. По каждому спутнику, диапазону и эпохе: угол места, азимут, дальность, скорость изменения дальности и ускорение дальности; потери в свободном пространстве; EIRP и усиление диаграммы спутника (изофлюкс, гауссов луч или плоская); усиление антенны пользователя в зависимости от угла места (патч, полусферическая или изотропная); газовое затухание (ITU-R P.676-10, приложение 2), затухание в дожде (коэффициенты ITU-R P.838-3 и процедура P.618-14 по интенсивности и высоте дождя), тропосферные мерцания (ITU-R P.618-14, раздел 2.4.1), потери проникновения в здание для пользователя в помещении (ITU-R P.2109-2), поляризационное рассогласование, шумовая температура системы и C/N0 (отношение несущей к плотности шума); доплер и скорость доплера в замкнутой форме по скорости изменения дальности и ускорению дальности, каждый проверяется центральными разностями; ионосферная задержка первого порядка { $lit_40_3 } STEC/f^2 по наклонному TEC Клобучара или вертикального TEC, масштабированному на часть ионосферы ниже спутника. Для пар диапазонов получаются безионосферные коэффициенты, усиление шума и кодовый шум в максимуме пролёта. Спутники MEO GNSS (предустановки Galileo или GPS) оцениваются по той же модели антенны и шума по принимаемым мощностям из интерфейсных документов, так что колоколообразный пролёт LEO и плоские несущие GNSS делят один график. Необязательный раздел [iot] даёт время до первого определения, энергию на определение и срок службы батареи в зависимости от рабочего цикла для заданного энергетического бюджета приёмника (MODELLED). Каждая пара диапазонов также даёт наклонный TEC, который восстанавливает её геометрически свободная комбинация в максимуме, и sigma кодового шума этой оценки (зондирование ионосферы). Необязательный раздел [spoofer] подделывает сигналы заявленного положения, которое скачком или постепенно смещается от истинного после начала, и запускает два монитора с заданными вероятностями ложной тревоги и пропуска обнаружения: согласованность доплера и геометрии пролёта (измеренные скорости изменения дальности относительно прогнозируемых по орбитам и независимому априорному положению и скорости, обобщённый хи-квадрат тест по наименьшим квадратам на окне, по каналам GNSS, LEO и всем) и междиапазонную согласованность (шаг от эпохи к эпохе скорректированной по модели геометрически свободной комбинации каждой пары диапазонов LEO), сообщая статистики по эпохам и момент обнаружения каждым монитором (MODELLED). VALIDATED компоненты: потери в свободном пространстве, коэффициенты P.838-3 по его таблице 5, процедуры дождя и мерцаний P.618-14 и потери проникновения в здание P.2109 по примерам валидации ITU-R Study Group 3, отношение групповых задержек IS-GPS-200 L1/L2 и максимальный доплер неподвижного пользователя на круговой орбите по arXiv 2509.19551, таблица 1. MODELLED: EIRP, диаграммы, доля Чапмена TEC ниже спутника и весь пролёт.

engine-kind-leo-navmsg-description = Навигационное сообщение LEO: вещательные эфемериды и часы спутника позиционирования, навигации и времени на низкой околоземной орбите (LEO), для любой орбиты, несущей и модели, с необязательными именованными предустановками (Xona Pulsar, Iridium, Starlink, CentiSpace, репрезентативная система диапазона C, модель ATOMIC с нулевыми часами, Celeste IOD). СОДЕРЖИМОЕ: вспомогательные данные (SVID, выпуск данных, диапазон, состояние сигнала), синхронизация (неделя, время недели, полином часов второго порядка af0-af2 около toc), эфемериды в одной из четырёх моделей -- 16-параметрический кеплеров набор Galileo OS SIS ICD; этот набор плюс полиномы поправок по трассе, поперёк трассы и радиальные; 22-параметрическая модель Liu et al. 2025; полином ECEF без членов часов (ATOMIC с нулевыми часами) -- и другие службы (вещательный набор Клобучара, NeQuick-G ai0-ai2 с эффективным уровнем ионизации и параметры перехода от системного времени к UTC с логикой високосной секунды из ICD). ПОДГОНЩИК: истинная орбита, проинтегрированная с зональной гравитацией J2-J6 или EGM2008 до выбранной степени и сопротивлением, и свободные или управляемые часы с начальным значением; подгонка кеплерова набора методом Левенберга — Марквардта по неособым элементам, затем линейные полиномы поправок по методу наименьших квадратов; часы подгоняются за вычетом релятивистского члена, который добавляет пользователь. АНАЛИЗЫ: fit-interval-trade (ошибка дальности сигнала в пространстве, SISRE, с глобально усреднёнными весами для высоты орбиты, в зависимости от интервала подгонки и периода обновления, только орбита и с часами), model-comparison (четыре модели, число параметров, закодированные биты и подгонка Kshana на высотах Liu et al. рядом с опубликованными значениями), midpass-update (самый высокий пролёт над пользователем, скачок положения, часов и дальности пользователя при каждом переключении сообщения, скачок при наихудшей геометрии, PASS/FAIL относительно порога непрерывности), encode-decode (собственный документированный двоичный кадр Kshana с CRC-24Q, бюджет квантования в полшага по каждому полю, проверка повреждённого кадра, экспорт и импорт записи в стиле RINEX-4, помеченный расширением Kshana, и таблица CSV). VALIDATED: веса SISRE по опубликованной таблице MEO/GEO (Montenbruck et al. 2018); пользовательский алгоритм Galileo по RTKLIB на реальных вещательных эфемеридах Galileo; CRC-24Q по контрольному значению каталога и примеру кадра RTCM 1005. MODELLED: каждое значение подгонки и SISRE — ошибка представления относительно истины, проинтегрированной Kshana (без ошибки определения или прогноза орбиты); сравнение с Liu et al. использует другие орбиты; форматы кодирования и текста — собственные для Kshana.

engine-kind-leo-pvt-description = Объединённое PNT (позиционирование, навигация и время) на средней околоземной орбите (MEO) и низкой околоземной орбите (LEO) по ЛЮБЫМ орбитальным группировкам: каждая [[system]] — это предустановка GNSS вида constellation-design, предустановка LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, модель эфемерид atomic-zero-clock или другой файл предустановки, каждый в своём файле с источниками, помеченными PUBLIC, WORKSHOP или DERIVED), оболочки Уокера или явные наборы элементов, с несущей, скоростью следования элементов кода, огибающей отношения несущей к плотности шума (C/N0) от маски угла места до зенита, ошибкой дальности сигнала в пространстве (SISRE), sigma доплера и моделью часов (собственные часы приёмника, так что межсистемное смещение оценивается, либо известное вещательное смещение). Четыре режима. DOPPLER: пакетное позиционирование методом Гаусса — Ньютона по скорости изменения дальности с аналитическими частными производными, состояниями дрейфа часов и необязательной скорости и необязательным ограничением по высоте, по одному или нескольким спутникам, ошибка в зависимости от длины окна, огибающая доплера, скорости доплера и рывка каждой системы LEO и точность по трассе и поперёк трассы за один пролёт в зависимости от поперечного смещения (ошибка поперёк трассы неограниченно растёт по мере прохода над головой; у одного пролёта также есть зеркальное решение по другую сторону трассы). Здесь работает оппортунистический сигнал только по Доплеру (starlink-sop). JOINT: определения по псевдодальностям методом взвешенных наименьших квадратов в каждую эпоху только от GNSS, только от LEO и от обоих, sigma по каждому измерению из модели теплового шума DLL при C/N0 плюс SISRE (или фиксированная sigma, так что модель сигнала может их подавать), оценённые межсистемные смещения и PDOP/HDOP/VDOP в зависимости от числа добавленных спутников LEO. POLAR: спутники в зоне видимости и DOP в зависимости от широты для GNSS, LEO и обоих. TIMING: передача времени на всемирное координированное время (UTC) от спутников LEO в известном положении с двухсостоятельным фильтром часов, шум процесса которого берётся из классов генераторов движка, в зависимости от C/N0 и генератора, и выражение перехода от системного времени к UTC по IS-GPS-200; при [timing] trace = true каждая строка также сообщает ошибку времени и прогнозируемую sigma в каждую эпоху. VALIDATED: наибольший доплер пролёта от зенита до горизонта по опубликованным значениям Iridium (до 36 kHz) и Xona Pulsar X1 (от 32 до 34 kHz). MODELLED: всё остальное; DOP проверяется по рассчитанному вручную случаю, определения — по их ковариации, а модель доплера — по тождеству ускорения дальности.

engine-kind-leo-ppp-description = Сходимость точного абсолютного позиционирования (PPP) только по GNSS и с поддержкой LEO: плавающий расширенный фильтр Калмана по безионосферным кодовым измерениям и фазе несущей со статическими координатами станции, белыми часами приёмника, одним межсистемным смещением на каждую дополнительную систему, зенитной влажной задержкой со случайным блужданием, отображаемой по 1/sin(угол места), и плавающей неоднозначностью на каждую дугу спутника; ошибка точной орбиты и часов белая и общая для кода и фазы спутника, поэтому каждый спутник — это одно коррелированное двухстрочное обновление в стабилизированной форме Джозефа. Измерения симулируются по той же модели с шумом с начальным значением по нескольким пунктам и начальным значениям, а каждый случай (сначала только GNSS, затем каждый [[case]] систем LEO, любая орбитальная группировка или предустановка) сообщает медианное время сходимости (первая эпоха, после которой горизонтальная и вертикальная ошибки остаются ниже порогов, по умолчанию 10 cm), долю сошедшихся, медианные кривые ошибок и согласованность фильтра (усреднённое по прогонам NEES положения относительно двустороннего 95% интервала хи-квадрат). Необязательно рядом с опубликованными значениями для средних широт Li et al. (2019, J. Geod. 93:749, doi 10.1007/s00190-018-1195-2): { $lit_9_6 } min для мульти-GNSS сокращается до { $lit_7_0 }, { $lit_3_2 }, { $lit_2_1 } и { $lit_1_3 } min при 60, 96, 192 и 288 спутниках LEO. MODELLED: сравнение согласованности тенденции, а не воспроизведение орбитальных группировок, шума или станций того исследования; без разрешения неоднозначностей, проскальзываний циклов, закрутки фазы, приливов и коррелированных во времени ошибок продуктов.

engine-kind-ntn-positioning-description = Позиционирование по нисходящей линии 5G нетерреструальной сети (NTN) в S-диапазоне подвижной спутниковой службы (MSS) (диапазон 3GPP n256, нисходящая линия от 2170 до 2200 MHz; несущая по умолчанию { $lit_2172_5 } MHz): граница Крамера — Рао (CRB) по времени прихода, c / (2 pi beta sqrt(2 (C/N0) T)), где beta — среднеквадратичная (Габора) полоса плоского спектра OFDM (B/sqrt(12)), и по доплеру комплексного тона, sqrt(3 / (2 pi^2 (C/N0) T^3)), для каждого сигнала (по умолчанию канал New Radio 5 MHz с занятыми { $lit_4_5 } MHz и узкополосный канал 200 kHz с занятыми 180 kHz); затем, по любой орбитальной группировке LEO, определения по времени прихода нисходящей линии с неизвестными часами приёмника (с начальным значением, с границей плюс ошибка сетевой синхронизации как sigma), их PDOP и формальная 3D sigma и определение по доплеру с одного спутника на самом длинном пролёте при удержании высоты. MODELLED: шаг от полосы к границе — учебниковая замкнутая форма, проверенная численным интегрированием плоского и ограниченного по полосе спектров BPSK (внутренняя согласованность, без закреплённого опубликованного разобранного значения), а точность позиционирования — это граница для канала без многолучевости с заданной ошибкой синхронизации, а не достигнутый результат.

engine-kind-leo-pnt-chain-description = Одна система LEO-PNT (позиционирование, навигация и время с низкой околоземной орбиты) сквозным образом, для любой орбитальной группировки и сигнала: проект leo-signal, названный signal_design (общедоступная предустановка или встроенный проект [signal]), задаёт центр, полосу, скорость следования элементов кода и распределение EIRP диапазона [pass], бюджет линии leo-pass даёт отслеживаемое C/N0 и ограниченное по полосе дрожание кода за пролёт, линия C/N0 по sin(угол места) и вещательная SISRE сообщения [navmsg] (подогнанная на высоте спутника пролёта) питают каждую систему LEO совместного определения leo-pvt из [fusion] и, необязательно, случаи leo-ppp из [ppp]; каждая передача перечислена с её значением и единицей. MODELLED.

engine-kind-contact-schedule-description = Планирование наземных контактов для нескольких спутников над несколькими станциями: окна кажущегося доступа (SGP4, связанная с Землёй система IAU 2006/2000A, рефракция ITU-R P.834, световое время), объём данных DVB-S2 ACM каждого пролёта (пороги ETSI EN 302 307-1, таблица 13) и бесконфликтное расписание (один спутник на антенну с оборотом, одна станция на спутник, доставка с весом по приоритету, ограниченная каждым отставанием) жадным методом по предельной ценности, базовой схемой «первым пришёл — первым обслужен» и точным методом ветвей и границ на малых наборах, с разрывом оптимальности жадного метода. MODELLED.

engine-kind-acm-link-description = Один спутник над одной станцией: наклонная дальность, угол места и Es/N0 каждого пролёта вдоль пролёта, MODCOD DVB-S2, выбираемый на каждом шаге (пороги ETSI EN 302 307-1, таблица 13, плюс запас на реализацию), и объём данных, который передаёт ACM, относительно базовой схемы с постоянным кодированием, замыкающейся на маске. MODELLED.

engine-kind-aocs-description = Управление ориентацией космического аппарата: инерциальный разворот жёсткого корпуса с тремя или более сбалансированными маховиками под обратной связью MRP (L = -K sigma - P omega), моменты маховиков минимальной нормы, ограниченные пределом каждого двигателя, RK4 с нулевым порядком удержания; необязательно замкнутый на мультипликативный EKF от симулированного гироскопа (случайное блуждание угла и скорости) и звёздного датчика. Сообщает время успокоения, конечную и пиковую ошибку наведения, пиковую скорость и момент маховика, долю насыщения, дрейф углового момента и, с оценщиком, его ошибку ориентации и NEES. Цикл по истинному состоянию VALIDATED по Basilisk 2.9.1; оценщик MODELLED.

engine-kind-entry-heating-description = 3-DoF вход в атмосферу материальной точки над вращающейся сферической Землёй или Марсом (баллистический или с подъёмной силой при постоянном крене), RK4, через US76, экспоненциальную или марсианскую атмосферу, с конвективным нагревом в критической точке по Саттону — Грейвсу (NASA TR R-376): пиковое замедление, тепловой поток и скоростной напор, тепловая нагрузка, дальность по поверхности, проверка энергии во вращающейся системе и замкнутая форма Аллена — Эггерса рядом с ней. Пиковое замедление проверено по опубликованному номиналу Stardust; нагрев — MODELLED.

engine-kind-eo-radiometry-description = Радиометрия и качество изображения надирного формирователя: яркость на апертуре ламбертовой сцены, уравнение камеры, сигнал и дробовой/темновой/считывания/квантования шум и SNR; MTF системы на частоте Найквиста (дифракция x детектор x смаз x дрожание), относительный отклик на край по ней, Q = lambda F/p и NIIRS по GIQE версии 4 без компенсации MTF. MODELLED.

engine-kind-ascent-losses-description = Плоское выведение многоступенчатого аппарата по гравитационному развороту над невращающейся сферической Землёй через стандартную атмосферу США 1976 (вертикальный подъём, импульс тангажа, тяга вдоль скорости) с интегрированием потерь на гравитацию, сопротивление, управление и противодавление и проверкой идеального dv за вычетом потерь по скорости в конце работы двигателя; max-Q, пиковое ускорение и состояние в конце работы двигателя. MODELLED.

engine-kind-time-transfer-budget-description = Двусторонняя спутниковая передача времени и частоты между двумя станциями через геостационарный ретранслятор: двустороннее уравнение, решённое для T_A - T_B, со всеми невзаимными членами (задержки оборудования станций, ионосфера в диапазоне Ku, транспондер, Саньяк), квадратурный бюджет неопределённости, у которого член типа A — это TDEV симулированной линии при времени усреднения, симулированная линия с белым и фликкер-фазовым шумом и суточной невзаимностью, а также стабильность (скорость, остаточный RMS, TDEV, ADEV) любых предоставленных рядов BIPM Circular T, раздел 1, CSV вида MJD,ns или записей часов станций IGS RINEX. MODELLED.

engine-kind-optical-atmosphere-description = MODELLED оптический PNT через атмосферу: для оптической линии и набора наземных пунктов с заданным климатом облачности сообщает зависящие от длины волны и угла места потери в чистом воздухе (закон видимости Ким плюс рэлеевское рассеяние), состояние турбулентности Хуфнагеля — Вэлли (дисперсия Рытова, индекс мерцаний, параметры гамма-гамма, усреднение по апертуре), доступность, определяемую погодой, относительно запаса линии (оптическая толщина облаков из логнормального климата жидкой воды, экстинкция геометрической оптики, независимое турбулентное замирание), запас линии, нужный для целевых доступностей, распределение длительности перерывов, рост ошибки синхронизации и дальнометрии на каждый перерыв через модель holdover часов, коррелированную по расстоянию доступность при разнесении пунктов и гипотетические выигрыши от методов улучшения (длина волны, приёмная апертура, снижение мерцаний адаптивной оптикой, дополнительный запас). VALIDATED как реализация заявленных формул по независимому оракулу mpmath: дисперсия Рытова, индекс мерцаний, вероятность замирания гамма-гамма, коэффициент усреднения по апертуре, оптическая толщина облаков и чистого воздуха. MODELLED: каждый входной параметр погоды, методов и часов, а также допущения о независимости и копуле; никакая измеренная запись доступности не сопоставлялась. Консультативный анализ, не сертифицированный продукт по доступности или навигации.

engine-kind-holdover-test-description = MODELLED тест holdover системы синхронизации, оцениваемый по записи ошибки времени, которую предоставляет ОПЕРАТОР (журнал linuxptp ptp4l, phc2sys или ts2phc, журнал tracking или statistics chrony, журнал часов TICC, TimeLab или RINEX либо пары time_s,time_error_ns). Тест состоит из четырёх шагов, и Kshana не выполняет ни одного из них: захваченный БАЗОВЫЙ режим, GNSS ОТКЛЮЧЁН оператором (антенный кабель или выход симулятора; Kshana ничего не передаёт и ничем не управляет) в заданный момент, HOLDOVER на собственном генераторе системы и ВОССТАНОВЛЕНИЕ после того, как оператор вернёт GNSS во второй заданный момент. Запись делится в эти два момента. Базовый режим: статистики ошибки времени и маски ITU-T, составленные для захваченных часов. Holdover: статистики, дробное смещение частоты, которое удерживала система (прямая по методу наименьших квадратов), маски, составленные для holdover или автономных часов, огибающая holdover ePRTC-A по заданной длительности захвата и время превышения каждого бюджета ошибки времени. Восстановление: вошла ли |TE| в заданную полосу и когда, и оставалась ли в ней, пик и наибольший скачок. Каждый предел переписан из общедоступной таблицы ITU-T (маски telecom-timing); формулировка — «измерено относительно маски», а оба момента — заявление оператора, не проверенное. Запись, слишком короткая для маски, — INCOMPLETE, она никогда не экстраполируется. См. docs/TIMING-HIL.md.

engine-kind-gnss-ssv-description = MODELLED доступность GNSS и уровень сигнала в космическом объёме обслуживания и за его пределами: для пользователя на сфере (глобальная оболочка из буклета ICG) или на кеплеровой траектории (от LEO до лунного перелёта) подсчитывает по каждой орбитальной группировке (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) и по всем вместе сигналы, пригодные при C/N0 выше порога, - доступность хотя бы одного и четырёх сигналов, максимальную длительность перерыва, принимаемое C/N0, фактор ухудшения точности, линии по главному лепестку в сравнении с боковыми — с диаграммой передачи из буклета, параметрической или заданной пользователем, необязательными эффектами ионосферы, плазмосферы и атмосферы для лучей у лимба и необязательным проектом приёмника слабого сигнала; также бортовой расширенный фильтр Калмана GNSS для аппаратов на HEO и лунном перелёте (орбитальная динамика, давление солнечного излучения, третьи тела, часы) и относительная навигация формации из нескольких аппаратов по однократно разностным псевдодальностям. Проверено по таблицам буклета ICG SSV в рамках предварительной регистрации (xval/gnss-ssv)

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

engine-bench-site-title-a = Задача (a): обнаружение по журналам приёмника

engine-bench-site-title-b = Задача (b): обнаружение по IQ

engine-bench-site-title-c = Задача (c): прогноз holdover для синхронизации времени

engine-bench-site-title-d = Задача (d): разрыв оптимизма вне распределения

engine-bench-site-col-rmse-3600 = RMSE 3600 s (ns)

engine-bench-site-col-rmse-300 = RMSE 300 s (ns)

engine-bench-site-col-rmse-7200 = RMSE 7200 s (ns)

engine-bench-site-col-auc-in = AUC внутри

engine-bench-site-col-auc-out = AUC вне

engine-bench-site-col-optimism-gap = Разрыв оптимизма

engine-bench-site-col-flag = Флаг

engine-bench-site-col-auc = AUC

engine-bench-site-col-pd-at-pfa-cap = P_d при пределе P_fa (верхняя граница)

engine-bench-site-flag-optimistic = оптимистично

engine-bench-site-flag-within-tolerance = в пределах допуска

engine-bench-site-not-available = н/д

engine-bench-site-none-published = Результаты пока не опубликованы. Строка появляется здесь только тогда, когда файл результата оценён и добавлен; ничто на этой странице не является оценкой «на глаз».

engine-bench-site-none-for-task = Для этой задачи пока нет результатов.

engine-bench-site-region-label = { $title }: результаты { $split }

engine-bench-site-caption-split = Разбиение: { $split }

engine-bench-site-th-system = Система

engine-bench-site-th-provenance = Происхождение

engine-bench-site-th-truth-sha256 = Truth SHA-256

engine-bench-site-provenance-carried = перенесено: { $note }

engine-bench-site-provenance-scored = оценено

engine-bench-site-heading = Таблица результатов kshana-bench

engine-bench-site-lede = Файлы результатов, оценённые по <code>{ $spec }</code>. Строка означает лишь, что этот файл получил это значение на этом разбиении. Это не означает, что какой-либо продукт кем-либо оценён или одобрен, и ни одна организация не названа как поддерживающая.

engine-bench-site-foot = Каждая оценка является модельной, если только строка не указывает, что внешний оракул согласился. Лицензия на спецификацию и манифесты: предложено CC-BY-4.0 / CC0, решение владельца ожидается. Отложенная выборка на реальных данных не является секретной: см. спецификацию, раздел 4.

engine-bench-site-meta-description = Оценки представленных файлов результатов по kshana-bench { $spec }. Только консультативный характер.

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

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENT

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

engine-iq-campaign-report-roc-heading = ROC обнаружения

engine-iq-campaign-report-roc-note = <p class="note">Метка: <b>{ $label }</b>. Каждое заданное окно события считается положительным, а каждое окно заданной длины вне событий — отрицательным. Окно засчитывается при пороге, когда собственная тестовая статистика монитора достигает его в этом окне. P<sub>fa</sub> относится к отрицательному окну, а не к испытанию. Те же значения приведены в <code>roc.json</code>.</p>

engine-iq-campaign-report-th-alarm-kind = Тип тревоги

engine-iq-campaign-report-th-positives = Положительные

engine-iq-campaign-report-th-negatives = Отрицательные

engine-iq-campaign-report-th-auc = AUC

engine-iq-campaign-report-th-threshold = Порог

engine-iq-campaign-report-th-pd-at-it = P<sub>d</sub> при нём

engine-iq-campaign-report-th-pfa-at-it = P<sub>fa</sub> при нём

engine-iq-campaign-report-title = Кампания { $name }

engine-iq-campaign-report-heading = Кампания лабораторного воспроизведения: { $name }

engine-iq-campaign-report-meta = Класс данных <b>{ $data_class }</b> · Kshana { $engine } · записей: { $n_recordings } × входных трактов: { $n_frontends } × вариантов: { $n_designs } = ячеек: { $n_cells }, выполнено: { $n_done } · дайджест <code>{ $digest }</code>

engine-iq-campaign-report-digest-incomplete = (не завершено: выполнены не все ячейки)

engine-iq-campaign-report-reference-note = <p class="note">Измеренные значения получены при слежении за записями. Штриховые линии с меткой <b>{ $label }</b> — это аналитическая эталонная модель спектрального разделения <code>{ $formula }</code> при заданном в лаборатории J/S, где Q определяется заданным типом помех. Это модель заданного условия, а не измерение и не имитация помех.</p>

engine-iq-campaign-report-summary-heading = Сводка

engine-iq-campaign-report-th-recording = Запись

engine-iq-campaign-report-th-front-end = Входной тракт

engine-iq-campaign-report-th-design = Вариант

engine-iq-campaign-report-th-satellites = Спутники

engine-iq-campaign-report-th-mean-availability = Средняя доступность

engine-iq-campaign-report-th-events-lost = Потеряно событий

engine-iq-campaign-report-th-median-reacq = Медиана повторного захвата (s)

engine-iq-campaign-report-th-pass = Пройдено

engine-iq-campaign-report-th-fail = Не пройдено

engine-iq-campaign-report-degradation-heading = Ухудшение C/N0 в зависимости от заданного J/S

engine-iq-campaign-report-scorecard-heading = Оценочная карта

engine-iq-campaign-report-scorecard-note-nwpr = <p class="meta">Те же строки, что в <code>scorecard.csv</code>. Повторный захват отсчитывается от смещения события; перерыв — от потери захвата. Столбец C/N0 и кривые ухудшения используют оценку NWPR (занижает примерно на 8 dB · Bn·T при собственном джиттере контура, поэтому её показания зависят от конструкции контура); обе оценки приведены в <code>scorecard.json</code>.</p>

engine-iq-campaign-report-scorecard-note-m2m4 = <p class="meta">Те же строки, что в <code>scorecard.csv</code>. Повторный захват отсчитывается от смещения события; перерыв — от потери захвата. Столбец C/N0 и кривые ухудшения используют оценку M2M4 (нечувствительную к собственному джиттеру контура); обе оценки приведены в <code>scorecard.json</code>.</p>

engine-iq-campaign-report-th-sat = Спутник

engine-iq-campaign-report-th-scope = Охват

engine-iq-campaign-report-th-event = Событие

engine-iq-campaign-report-th-avail = Дост.

engine-iq-campaign-report-th-loss = Потеря (s)

engine-iq-campaign-report-th-js-at-loss = J/S при потере

engine-iq-campaign-report-th-reacq = Повторный захват (s)

engine-iq-campaign-report-th-outage = Перерыв (s)

engine-iq-campaign-report-th-cn0 = C/N0

engine-iq-campaign-report-th-pll = PLL σ (°)

engine-iq-campaign-report-th-dll = DLL σ (chip)

engine-iq-campaign-report-th-false-locks = Ложные захваты

engine-iq-campaign-report-th-verdict = Вердикт

engine-iq-campaign-report-scope-run = запуск

engine-iq-campaign-report-scope-event = событие

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

engine-resilience-report-title = Самооценка устойчивости PNT

engine-resilience-report-status-partner = PARTNER

engine-resilience-report-summary = <p>Движок { $engine }, сценарий { $scenario }, начальное значение (seed) { $seed }. Разделение по доказательствам: { $n_validated } { $validated } / { $n_modelled } { $modelled } частных оценок. Предварительный уровень RPCF: { $level } ({ $level_basis }).</p>

engine-resilience-report-h-rpcf = Категории методов DHS RPCF

engine-resilience-report-h-rdrr = Функции RethinkPNT

engine-resilience-report-h-yang = Критерии Yang

engine-resilience-report-th-category = Категория

engine-resilience-report-th-function = Функция

engine-resilience-report-th-criterion = Критерий

engine-resilience-report-th-subscore = Частная оценка

engine-resilience-report-th-status = Статус

engine-resilience-report-th-basis = Основание

engine-resilience-report-integrity = <p>Целостность SHA-256: <code>{ $integrity }</code></p>

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

engine-study-summary = исследование «{ $title }»: сценариев: { $n_scenarios }

engine-study-metric-holdover = Holdover (s)

engine-study-metric-timing-rms = RMS синхронизации времени (ns)

engine-study-metric-timing-p95 = p95 синхронизации времени (ns)

engine-study-metric-resilience-slope = Наклон устойчивости (ns/s)

engine-study-metric-availability = Доступность

engine-study-metric-integrity = Целостность

engine-study-metric-security = Безопасность

engine-study-th-metric = Показатель

engine-study-th-validation = Проверка

engine-study-not-applicable-no-attack = н/д (нет атаки)

engine-study-page-title = { $title } — исследование Kshana

engine-study-eyebrow = क्षण · точный миг

engine-study-h-comparison = Сравнение бок о бок

engine-study-tier-note = Каждый показатель качества помечен как { $validated } (проверен по внешнему оракулу) или { $modelled } (из первых принципов, проверен внутренними тестами) и получен из матрицы верификации. Столбцы — независимые сценарии; значения не нормированы между сценариями.

engine-study-footer = Создано Kshana { $version } как сводное исследование сценариев: { $n_scenarios }. Каждый сценарий воспроизводим по его сценарию, начальному значению (seed) и версии движка. Свободное ПО с открытым исходным кодом (AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">исходный код и документация</a>.

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

engine-telecom-timing-chart-holdover = holdover

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-bind = bind { $addr }: { $e }

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-otlp-resolve = resolve { $hostport }: { $e }

engine-telemetry-prometheus-kshana-build-info-version = kshana_build_info{ "{" }version="{ $escape_label }"{ "}" } 1{ "\u000A" }
