# SPDX-License-Identifier: AGPL-3.0-only
# es catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = formato de registro de reloj { $other } desconocido; se esperaba uno de { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = política de huecos { $other } desconocida; se esperaba refuse, longest o linear

engine-e-clock-log-give-either-the-log-text = indique el texto del registro o su ruta, no ambos

engine-e-clock-log-clock-log-needs-its-text = un registro de reloj requiere su texto o una ruta

engine-e-clock-log-tau0-must-be-finite-and = tau0_s debe ser finito y > 0 (se recibió { $t })

engine-e-clock-log-units-and-data-apply-to = units y data se aplican solo al formato timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel se aplica solo al formato ticc

engine-e-clock-log-cannot-read-clock-log = no se puede leer el registro de reloj { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = una ruta de registro de reloj no está disponible en la compilación WebAssembly; indique el registro como texto

engine-e-clock-log-the-log-has-missing-epoch = el registro { $format } tiene { $n_missing } época(s) ausente(s) en { $n_gaps } hueco(s) sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar

engine-e-clock-log-the-log-yields-usable-sample = el registro { $format } aporta { $x } muestra(s) utilizable(s); se necesitan al menos 3

engine-e-clock-log-not-rinex-clock-file-no = no es un archivo de reloj RINEX: no hay registro END OF HEADER

engine-e-clock-log-the-rinex-clock-file-has = el archivo de reloj RINEX no tiene registros AS ni AR

engine-e-clock-log-the-rinex-clock-file-holds = el archivo de reloj RINEX contiene { $many } relojes; indique uno con clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = no hay registros AS ni AR para el reloj { $id }

engine-e-clock-log-the-clock-has-single-epoch = el reloj tiene una sola época; no se puede determinar tau0

engine-e-clock-log-the-log-has-no-readings = el registro { $format } no tiene mediciones

engine-e-clock-log-unknown-phase-unit-expected-ms = unidad de fase { $other } desconocida; se esperaba s, ms, us, ns o ps

engine-e-clock-log-timelab-line-has-column-the = la línea { $v1 } de TimeLab tiene { $v } columna(s), la primera línea de datos tiene { $first }

engine-e-clock-log-timelab-line-has-columns-one = la línea { $v1 } de TimeLab tiene { $v } columnas; se leen una (valor) o dos (tiempo valor)

engine-e-clock-log-timelab-line-is-not-numeric = la línea { $v1 } de TimeLab no es numérica: { $l }

engine-e-clock-log-the-timelab-log-has-no = el registro timelab no tiene mediciones

engine-e-clock-log-unknown-data-expected-phase-or = data { $other } desconocido; se esperaba phase o frequency

engine-e-clock-log-tau0-header-is-not-positive = el encabezado tau0 { $v } no es un número positivo de segundos

engine-e-clock-log-frequency-data-is-fractional-frequency = los datos de frecuencia son frecuencia fraccionaria; sus unidades solo pueden ser 1

engine-e-clock-log-two-column-frequency-logs-are = no se leen los registros de frecuencia de dos columnas; indique la frecuencia como una sola columna con tau0

engine-e-clock-log-unknown-time-units-expected-or = time_units { $o } desconocido; se esperaba s o mjd

engine-e-clock-log-the-timelab-log-time-column = la columna de tiempo del registro timelab debe ser creciente

engine-e-clock-log-single-reading-tau0-cannot-be = una sola medición; no se puede determinar tau0

engine-e-clock-log-the-timelab-log-has-non = el registro timelab tiene { $non_finite } medición(es) no finita(s)

engine-e-clock-log-the-ticc-log-holds-channels = el registro TICC contiene los canales { $many }; indique uno con channel = "..."

engine-e-clock-log-no-readings-on-channel-found = no hay mediciones en el canal { $channel } (encontrados: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = las líneas TICC en modo de intervalo no llevan tiempo; indique tau0_s (el período del evento)

engine-e-clock-log-the-readings-do-not-increase = las mediciones { $channel } no son crecientes, por lo que no son marcas de tiempo (la salida del modo Period de TICC no se lee; use el modo Timestamp)

engine-e-clock-log-single-time-stamp-tau0-cannot = una sola marca de tiempo; no se puede determinar tau0

engine-e-clock-log-two-time-stamps-apart-under = dos marcas de tiempo { $channel } separadas { $w } s, menos de la mitad de tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = las marcas de tiempo { $format } de { $clock } retroceden (un demonio reiniciado o un salto de reloj); divida el registro y lea cada parte

engine-e-clock-log-the-log-has-no-readings-2 = el registro no tiene mediciones { $what }

engine-e-clock-log-the-log-holds-sources-name = el registro contiene { $many } fuentes; indique una con { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = no hay mediciones { $what } para { $id } (encontrados: { $names })

engine-e-clock-log-the-servo-of-never-reached = el servo de { $id } nunca alcanzó el estado enganchado s2

engine-e-clock-log-the-log-has-no-chrony = el registro no tiene mediciones de seguimiento de chrony

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = la frecuencia de muestreo { $fs_hz } Hz no es un número entero de muestras por milisegundo

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms y noncoherent deben ser positivos

engine-e-acquisition-the-doppler-grid-needs-positive = la cuadrícula Doppler requiere un paso positivo y un máximo no negativo

engine-e-acquisition-pfa-must-lie-in = pfa debe estar en (0, 1)

engine-e-acquisition-samples-supplied-needed = { $samples } muestras suministradas, { $needed } necesarias

engine-e-acquisition-empty-doppler-grid = cuadrícula Doppler vacía

engine-e-acquisition-the-samples-carry-no-power = las muestras no tienen potencia

## src/adm.rs

engine-e-adm-unknown-attitude-type = ATTITUDE_TYPE { $s } desconocido

engine-e-adm-an-aem-needs-at-least = un AEM requiere al menos un segmento

engine-e-adm-segment-is-not-version-attitude = segmento { $i }: { $t } no es un tipo de actitud de la versión { $version }

engine-e-adm-segment-values-for = segmento { $i }: { $values } valores para { $t }

engine-e-adm-aem-version-has-no-ndm = la versión 1.0 de AEM no tiene forma NDM/XML aquí; escriba KVN

engine-e-adm-this-attitude-type-has-no = este tipo de actitud no tiene forma en la versión 2.0

engine-e-adm-expected-meta-start-found = se esperaba META_START, se encontró { $l }

engine-e-adm-meta-start-without-meta-stop = META_START sin META_STOP

engine-e-adm-unexpected-metadata-line = línea de metadatos { $other } inesperada

engine-e-adm-in-version-aem = { $att } en un AEM de versión { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = se esperaba DATA_START después de META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START sin DATA_STOP

engine-e-adm-empty-data-line = línea de datos vacía

engine-e-adm-values-on-line = { $vals } valores en una línea { $att }: { $b }

engine-e-adm-unexpected-data-line = línea de datos { $other } inesperada

engine-e-adm-attitude-type-has-no-xml = el tipo de actitud no tiene forma XML

engine-e-adm-message-without-version-attribute = mensaje sin atributo de versión

engine-e-adm-expected-found = se esperaba { $vers_key }, se encontró { $other }

engine-e-adm-header-without-creation-date-or = encabezado sin CREATION_DATE ni ORIGINATOR

engine-e-adm-missing = falta { $k }

engine-e-adm-unexpected-keyword = palabra clave { $k } inesperada

engine-e-adm-spin-block-holds-nutation-or = un bloque de rotación propia contiene datos de nutación o de momento cinético, no ambos

engine-e-adm-unexpected-apm-keyword = palabra clave APM { $other } inesperada

engine-e-adm-unexpected-apm-line = línea APM { $b } inesperada

engine-e-adm-without = { $b } sin { $stop }

engine-e-adm-unexpected-line-in = línea inesperada en { $b }: { $other }

engine-e-adm-incomplete-group = grupo { $keys } incompleto

engine-e-adm-unknown-apm-block-start = bloque APM { $other }_START desconocido

engine-e-adm-apm-metadata-needs-object-name = los metadatos APM requieren OBJECT_NAME, OBJECT_ID y TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM sin EPOCH

engine-e-adm-rotation-axis = eje de rotación { $o }

engine-e-adm-values-for = { $values } valores para { $t }

engine-e-adm-euler-record-without-euler-rot = registro de Euler sin EULER_ROT_SEQ

engine-e-adm-rotation-sequence = secuencia de rotación { $seq }

engine-e-adm-epoch-has-no = la época { $s } no tiene 'T'

engine-e-adm-epoch-date = fecha de época { $date }

engine-e-adm-epoch-time = hora de época { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = «{ $s }» (texto tal como lo indica el documento)

engine-advanced-report-mean-5th-to-95th-percentile = media { $fmt_num } (percentil 5 a 95: { $fmt_num2 } a { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = esquema de unidades de campo: entrada units `{ $key }`

engine-advanced-report-field-units-schema-input-entry = esquema de unidades de campo: entrada input `{ $key }`, asociada por nombre de campo

engine-advanced-report-rows-of-non-numeric-column = { $n } filas de una columna no numérica

engine-advanced-report-rows-from-to = { $nums } filas, de { $fmt_num } a { $fmt_num2 }

engine-advanced-report-phase-ended-by = fase { $name } (finalizada por { $ended })

engine-advanced-report-result-timeline-phases = resultado `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = traspaso a la fase { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = resultado `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = entrada de escenario `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = comentario del archivo de escenario, línea { $start }

engine-advanced-report-scenario-file-comment-lines-to = comentario del archivo de escenario, líneas { $start } a { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } es MODELLED, no verificado frente a una referencia externa independiente: { $it }.

engine-advanced-report-sweep-of-scale = Barrido de { $param } (escala { $str_of })

engine-e-advanced-report-the-result-document-is-not = el documento de resultado no es JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = el escenario no es TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Distribución Monte Carlo de { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = registrado en la compilación a partir de la variable de entorno { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = no registrado: este motor se compiló sin la variable de entorno { $GIT_COMMIT_ENV }; la versión del motor identifica la publicación

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (la huella del escenario calculada por el propio tipo; no el resumen del archivo)

engine-advanced-report-input-file = Archivo de entrada { $path }

engine-advanced-report-study-generated = { " " }Estudio generado { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = línea EMAG2 { $v1 }: se esperaban 8 columnas separadas por comas, se encontraron { $p }

engine-e-altpnt-maps-emag2-line-bad = línea EMAG2 { $v1 }: { $what } `{ $p }` no válido

engine-e-altpnt-maps-emag2-line-non-finite-value = línea EMAG2 { $v1 }: valor no finito

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: no hay filas de datos

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: { $rows } filas no llenan la retícula de { $n_lat } x { $n_lon } que abarcan

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: nodo duplicado en { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = el paso de cuadrícula debe ser finito y positivo, se recibió { $step }

engine-e-altpnt-maps-grid-box-must-have-north = el recuadro de cuadrícula debe tener norte > sur y este > oeste, se recibió [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = una cuadrícula de { $n_lat } x { $n_lon } nodos es demasiado grande

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: el eje { $what } requiere al menos 2 valores distintos

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: el eje { $what } no es regular ({ $w } a { $w2 } frente a un paso medio de { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = el sigma de error debe ser finito y no negativo, se recibió { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = la longitud de correlación debe ser finita y positiva, se recibió { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side debe ser >= 2, se recibió { $n }

engine-e-altpnt-terrain-srtm-hgt-length = longitud de SRTM .hgt { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = una ventana .hgt requiere al menos 2 x 2 muestras, se recibió { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = el paso debe ser finito y positivo, se recibió { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = longitud de ventana { "." }hgt { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: columna magnetic_grid `{ $other }` desconocida (use "sealevel" o "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: no se puede leer magnetic_grid csv_path { $csv_path }: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = formato de animación '{ $other }' desconocido; se esperaba svg, html, frames o all

engine-e-animation-no-animation-format-given-expected = no se indicó formato de animación; se esperaba svg, html, frames o all

engine-e-animation-animation-fps-must-be-between = los fps de la animación deben estar entre 1 y 60, se recibió { $fps }

engine-e-animation-animation-duration-must-be-between = la duración de la animación debe estar entre 0.5 s y 600 s, se recibió { $duration_s }

engine-e-animation-animation-width-must-be-between = el ancho de la animación debe estar entre 480 y 3840 píxeles, se recibió { $width }

engine-e-animation-duration-fps-gives-frames-the = duración x fps da { $n } fotogramas; la secuencia de fotogramas requiere entre 2 y { $v1 }

engine-e-animation-result-is-not-json = el resultado no es JSON: { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = tiempo de misión ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (requiere un ffmpeg compilado con librsvg; de lo contrario, rasterice primero los fotogramas)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }Se encontraron { $omitted } series más que no se dibujaron (el reproductor muestra como máximo { $MAX_CHARTS } paneles de { $MAX_TRACES } trazas); figuran en el manifiesto de la exportación frames.

## src/antenna.rs

engine-antenna-altitude-beamwidth-deg-points = altitud { $a_lo }-{ $a_hi } m x ancho de haz { $b_lo }-{ $b_hi } deg, { $points } puntos

engine-antenna-limb-capture-is-reached-on = la captura del limbo SE ALCANZA en esta cuadrícula ({ $grid }): { $points } de { $points2 } puntos de operación muestreados capturan el limbo y se localizaron { $crossings } cruce(s) de eje; el J/S de limbo más alto muestreado es { $limb_js_db } dB a la altitud { $altitude_m } m / ancho de haz { $hpbw_deg } deg, frente a un umbral de captura de { $thr } dB.

engine-antenna-limb-capture-is-not-reached = la captura del limbo NO se alcanza en ningún punto de esta cuadrícula ({ $grid }): no es captura nula, sino ausencia de captura del limbo; el mejor J/S de limbo es { $limb_js_db } dB a la altitud { $altitude_m } m / ancho de haz { $hpbw_deg } deg, { $shortfall } dB por debajo del umbral de captura de { $thr } dB; ese punto de operación capturaría el limbo con una potencia de transmisión de { $limb_capture_tx_power_dbw } dBW, frente a los { $p_tx_dbw } dBW en vuelo.

engine-e-antenna-azimuths-must-strictly-increase = los acimuts deben ser estrictamente crecientes

engine-e-antenna-azimuths-must-span-less-than = los acimuts deben abarcar menos de 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = los ángulos fuera del eje deben ser estrictamente crecientes

engine-e-antenna-gain-grid-does-not-match = la cuadrícula de ganancia no coincide con los ejes

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = las ganancias K y P deben ser finitas y positivas

engine-e-aocs-at-least-three-reaction-wheels = se requieren al menos tres ruedas de reacción

engine-e-aocs-wheel-spin-axis-must-be = rueda { $i }: el eje de giro debe ser un vector unitario

engine-e-aocs-wheel-js-and-max-must = rueda { $i }: js y u_max deben ser finitos y positivos

engine-e-aocs-the-wheel-spin-axes-do = los ejes de giro de las ruedas no generan un espacio de tres dimensiones

engine-e-aocs-inertia-minus-the-wheels-spin = la inercia menos la inercia de giro de las ruedas debe ser definida positiva

engine-e-aocs-inertia-must-be-finite-and = la inercia debe ser finita y simétrica

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis debe ser un vector finito no nulo

engine-e-aocs-kind-must-be-finite-and-positive = { $n } debe ser finito y positivo

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s debe dar como máximo 2e6 pasos

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s debe ser un múltiplo entero de dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 y omega0_rad_s deben ser finitos

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm debe ser finito

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s debe ser finito

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s debe ser al menos dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs: { $n_w } ruedas, maniobra de { $duration_s } s desde { $series_err } deg -> { $settle } | final { $final_err } deg | pico de rueda { $peak_speed } rpm | { $v7 }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = servicio '{ $other }' desconocido (se esperaba navigation|nav o communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = política de arbitraje '{ $other }' desconocida (se esperaba navigation-priority, communications-priority o first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = un plan de contactos requiere al menos una ventana de contacto

engine-e-aperture-duty-apertures-must-be = apertures debe ser >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = el horizonte de informe debe ser finito

engine-e-aperture-duty-contact-has-non-finite-aos = el contacto '{ $name }' tiene un aos_s o un los_s no finito

engine-e-aperture-duty-contact-must-have-los-aos = el contacto '{ $name }' debe tener los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = un plan de contactos requiere al menos una ventana [[contacts]]

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: { $sessions } sesión(es) en { $apertures } apertura(s) bajo { $policy } -> ocupación de navegación { $navigation_duty }, ocupación de comunicaciones { $communications_duty }, inactividad { $idle_duty }; { $total_outage_s } s de { $total_requested_s } s solicitados perdidos por contención (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Estudio generado { $html_escape }.

engine-e-api-failed-to-serialise-report-to = error al serializar el informe a JSON: { $e }

engine-e-api-invalid-scenario = escenario no válido: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you = tipo de escenario { $other } desconocido — ¿quiso decir { $hint }? `kshana kinds` lista los { $n } tipos integrados.

engine-api-unknown-scenario-kind-kshana-kinds = tipo de escenario { $other } desconocido. `kshana kinds` lista los { $n } tipos integrados.

engine-api-required-fields = - **Campos obligatorios:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Campos opcionales:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = error de análisis TOML: { $e }

engine-api-could-not-classify-scenario-kind = no se pudo determinar el tipo de escenario: { $e }

engine-api-missing-required-field = { $kind_name }: falta(n) campo(s) obligatorio(s) — { $options }

engine-api-missing-required-field-2 = { $kind_name }: falta el campo obligatorio "{ $entry }"

engine-e-api-invalid-orbit-scenario = escenario de órbita no válido: { $e }

engine-e-api-sp3-export-requires-an-orbit = la exportación SP3 requiere un escenario de órbita, no '{ $k }'

engine-e-api-omm-export-requires-an-orbit = la exportación OMM requiere un escenario de órbita, no '{ $k }'

engine-e-api-oem-export-requires-an-orbit = la exportación OEM requiere un escenario de órbita, no '{ $k }'

engine-e-api-invalid-scenario-toml = TOML de escenario no válido: { $e }

engine-e-api-could-not-re-serialise-scenario = no se pudo volver a serializar el escenario: { $e }

engine-api-scenario-jamming-availability-under-jamming = escenario { $r } | jamming { $v2 } | disponibilidad bajo jamming { $availability_under_jamming } (nominal { $availability_nominal }) | seguimiento mín. { $min_tracking } | J/S medio { $v6 }

engine-e-api-the-result-document-already-carries = el documento de resultado ya contiene `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = error al serializar figure_tiers: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = escenario { $label } no válido: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = escenario { $r } | holdover cuántico { $holdover_s }s p95 { $pos_p95_m }m | holdover clásico { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = escenario { $r } | spoofing { $scn } frente a espec. { $threshold_ns } ns (P_fa { $target_pfa }) | seguridad cuántica { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | seguridad clásica { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal = integridad | { $n_sats } satélites | { $samples_available }/{ $samples_total } épocas disponibles ({ $report } %) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } eventos de integridad, { $report3 } HMI

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | polo sur | { $samples_available }/{ $samples_total } épocas disponibles ({ $report } %) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | tasa secular LTC−TT { $secular_rate_us_per_day } µs/day (banda { $band_low }–{ $band_high }) | autopotencial { $self_potential_us_per_day } cinético { $kinetic_us_per_day } | desfase @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | línea base { $baseline_km } km | distancia a la baliza { $beacon_range_km } km | retardo { $report } µs (tasa { $delay_rate_s_per_s } s/s) | campo cercano { $near_field_correction_us } µs | { $samples } muestras en { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats = lunar-joint-od-clock | { $n_sat } satélites, { $n_earth } estaciones terrestres | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros

engine-api-builtins-lunar-frame-realisation-points-translation = lunar-frame-realisation | { $n_points } puntos | error de traslación { $trans_err_norm_m } m, error de rotación { $rot_err_norm_rad } rad, error de escala { $scale_err_ppb } ppb | residuo RMS { $rms_residual_m } m | convergido { $converged }

engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } satélites ({ $geometry_label }) | { $n_grid_points } puntos × { $n_epochs } épocas | cobertura { $coverage_pct } % (PDOP<{ $pdop_threshold }) | satélites { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | disponibilidad PL { $pl_availability_pct } % | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemérides { $report } ({ $provenance }) σ_URE requerido { $fmt } frente a kepleriano { $fmt2 } frente a perturbado { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | { $n_sats } satélites (ilustrativos, de clase LCNS, sin afiliación) | línea base { $baseline_km } km | error de usuario { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (reducción ×{ $reduction_factor }) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } puntos x { $n_epochs } épocas x { $n_trials } ensayos | disponibilidad { $v4 } % | cobertura { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | corregido p{ $percentile } 3-D { $f } (sin corregir { $f2 }) | HPL máx. { $f3 } | MODELLED; no es una afirmación sobre ningún sistema real

engine-api-builtins-terrain-horizon-at-the-station = { " " }| horizonte del terreno ({ $sources }) en la estación máx. { $horizon_max_deg } deg, puntos de usuario media de máx. { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame = lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estados, OEM { $oem_line_count } líneas | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED

engine-api-builtins-scenario-optical-sync-rms-ps = escenario { $r } | óptico sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | cadena cuántica { $quantum_chain_sigma_s }s frente a clásica { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | seguridad Pd { $security_pd } (Pfa { $monitor_pfa }) | anomalía Pd { $anomaly_pd } | comparación, gana lo cuántico { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | interrupción { $outage_s }s | error de posición cuántico { $quantum_pos_err_m } m frente a clásico { $classical_pos_err_m } m ({ $improvement_x }x) | holdover cuántico { $quantum_holdover_s }s frente a clásico { $classical_holdover_s }s (umbral { $threshold_m } m) | comparación, gana lo cuántico { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC cuántico { $quantum_auc } frente a clásico { $classical_auc } | fallo mínimo detectable cuántico { $quantum_min_detectable } frente a clásico { $classical_min_detectable } | { $fault_catalog } clases de fallo | comparación, gana lo cuántico { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] se aplica solo al tipo fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = escenario { $r } | holdover PNT cuántico { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integridad { $integ } seguridad { $security_na } | holdover PNT clásico { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integridad { $integ2 } seguridad { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = escenario { $r } | fusionado | holdover PNT cuántico { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integridad { $integ } seguridad { $security_na } | holdover PNT clásico { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integridad { $integ2 } seguridad { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = escenario { $r } | hybrid-ukf (17 estados, MODELLED) | sensor { $v2 } (q_va { $effective_q_va }) | reloj q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } en [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } en [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | asistido { $aided_pos_rms_m }m -> a la deriva { $coast_end_pos_rms_m }m durante { $coast_duration_s }s | autoconsistencia, no exactitud

engine-api-builtins-scenario-gnss-ins-quantum-outage = escenario { $r } | gnss-ins | RMS de interrupción cuántico fusionado { $fused_outage_rms_m }m frente a libre { $free_outage_rms_m }m (hold { $holdover_s }s, disp. { $availability }) | clásico fusionado { $fused_outage_rms_m2 }m frente a libre { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, disp. { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = escenario { $r } | gnss-sim | iono media { $mean_iono_m }m tropo { $mean_tropo_m }m | disp. RAIM { $raim_availability } HPL medio { $mean_hpl_m }m VPL medio { $mean_vpl_m }m tasa de fallo { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = escenario { $r } | spoof-detect | { $n_sats } SV, +{ $power_advantage_db } dB{ $v4 } | empuje { $push } | puntuación fusionada { $score } (umbral { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = barrido { $metric } sobre { $parameter } ({ $first }..{ $last }, { $points } pts, escala { $scale }) | cuántico { $first2 }->{ $last2 } | clásico { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = escenario { $r } | { $nominal }/{ $series } muestras GNSS nominal | mejor PDOP { $fnum } pos. { $posm } | holdover cuántico { $holdover_s }s p95 { $ns1 }ns integridad { $integ } seguridad { $security_na } | holdover clásico { $holdover_s2 }s p95 { $ns12 }ns integridad { $integ2 } seguridad { $security_na }

engine-e-api-builtins-ephemeris = efemérides: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| elev. máx. { $el }° pico Doppler { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat = escenario { $r } | { $source } | { $n_samples } muestras | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | velocidad { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }

engine-api-builtins-generic-sweep-of-over-nodes = barrido genérico de `{ $kind }` sobre [{ $keys }] | { $points } nodos (forma { $shape }) | métricas [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | deriva inercial libre { $free_inertial_drift_m } m | ajuste gravimétrico { $map_matched_error_m } m | sigma de ajuste { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| grado de referencia { $reference_nmax } desviación típica de anomalía { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| error de mapa MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 } % dentro de { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | deriva inercial libre { $free_inertial_drift_m } m | ajuste al terreno { $matched_error_m } m ({ $v3 }x de reducción) | sigma de ajuste { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } puntos de paso | RMS inercial libre { $free_inertial_rms_m } m (final { $free_inertial_final_m } m) | RMS con ajuste al terreno { $matched_rms_m } m (final { $matched_final_m } m, { $v6 }x de reducción) | ESS medio { $mean_ess }/{ $cfg } | sigma de ajuste { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | deriva inercial libre { $free_inertial_drift_m } m | gravedad { $gravity_only_m } m magnético { $magnetic_only_m } m terreno { $terrain_only_m } m | FUSIONADO { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] requiere runs = 1: un registro medido es un solo registro de datos

engine-api-builtins-scenario-runs-quantum-holdover-p95 = escenario { $r } | { $runs } ejecuciones | holdover cuántico { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns seguridad { $security_na } | holdover clásico { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns seguridad { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = escenario { $r } | holdover cuántico { $holdover_s }s p95 { $ns1 }ns integridad { $integ } seguridad { $security_na } | holdover clásico { $holdover_s2 }s p95 { $ns12 }ns integridad { $integ2 } seguridad { $security_na }

engine-api-builtins-raim-available-of-epochs-denied = { " " }| RAIM disponible { $n_available } de { $n_epochs } épocas ({ $n_denied } denegadas, { $n_alarm } alarmas; MODELLED)

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = un caso de referencia requiere al menos un satélite

engine-e-araim-reference-reference-case-needs-at-least-2 = un caso de referencia requiere al menos una constelación

engine-e-araim-reference-satellite-names-constellation-but-only = el satélite { $i } nombra la constelación { $constellation } pero solo se declaran { $constellations }

engine-e-araim-reference-satellite-has-non-positive-error = el satélite { $i } tiene una varianza de error no positiva

engine-e-araim-reference-both-integrity-risk-allocations-must = ambas asignaciones de riesgo de integridad deben ser positivas

engine-e-araim-reference-this-reference-implementation-monitors-single = esta implementación de referencia supervisa solo modos de fallo de evento único, pero las probabilidades a priori del caso exigen N_fault,max = { $nfm } (subconjuntos de eventos múltiples simultáneos). Se rechaza en lugar de subcontar los modos de fallo.

engine-e-araim-reference-the-all-in-view-geometry = la geometría con todos los satélites a la vista es singular

engine-e-araim-reference-no-fault-mode-is-observable = ningún modo de fallo es observable en esta geometría

engine-e-araim-reference-unknown-reference-vector-known-vectors = vector de referencia '{ $vector }' desconocido; vectores conocidos: { $ids } (o 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: { $wanted } vector(es) de referencia WG-C publicado(s); peor concordancia VPL/HPL { $worst_acceptance } m frente a la TOL_PL propia de la referencia = { $tol } m en { $acceptance_checked } vector(es) de aceptación

engine-e-araim-reference-sat-needs-one-value-per = P_sat requiere un valor por satélite y P_const uno por constelación

engine-e-araim-reference-satellite-names-an-undeclared-constellation = un satélite nombra una constelación no declarada

engine-e-araim-reference-every-prior-must-lie-in = cada valor a priori debe estar en [0, 1)

engine-e-araim-reference-the-priors-need-subsets-of = los valores a priori requieren subconjuntos de { $n_fault_max } eventos simultáneos; esta vía enumera como máximo { $most }

engine-e-araim-reference-the-all-in-view-solution = no se seleccionó la solución con todos los satélites a la vista

engine-e-araim-reference-an-add-v4-case-needs = un caso ADD v4.2 requiere satélites y constelaciones

engine-e-araim-reference-nom-and-sat-need-one = b_nom y P_sat requieren un valor por satélite

engine-e-araim-reference-const-needs-one-value-per = P_const requiere un valor por constelación

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = el satélite { $i } nombra una constelación no declarada

engine-e-araim-reference-one-constellation-index-per-satellite = un índice de constelación por satélite

engine-e-araim-reference-satellite-names-constellation-with-no = el satélite { $i } nombra la constelación { $c } sin ISM

engine-e-araim-reference-fewer-than-four-satellites-above = menos de cuatro satélites por encima de la máscara

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m debe contener al menos una distancia de separación

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (banda { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoofing@{ $value } m { $nearest } W | huella { $a2 } % capt., limbo { $footprint_limb_captured } | captura por spoofing { $spoof_captured } (enganche { $spoof_lock_time_s } s) | alcance del mástil { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 } % de 50 bit/s), latencia { $nma_auth_latency_s } s

engine-attack-surface-reached-crossing-best-db = alcanzada ({ $crossings } cruce(s), mejor { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = NO alcanzada en esta cuadrícula (mejor { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB por debajo; requiere { $best_limb_capture_tx_power_dbw } dBW frente a { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| barrido de huella { $s }x{ $s2 } (alt. { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), captura { $v5 }-{ $v6 } % | limbo { $limb }

engine-attack-surface-afs-received-dbw = AFS recibido: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Déficit: { $deficit_db } dB (banda { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Huella de captura: { $a } % del disco, limbo capturado: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Arrastre por spoofing: { $spoof_captured } (enganche { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Alcance del mástil: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 } %)

engine-attack-surface-limb-captured-on-grid-crossing = Limbo: capturado en la cuadrícula { $na }x{ $nb }, { $crossings } cruce(s)

engine-attack-surface-limb-not-captured-on-grid = Limbo: no capturado en la cuadrícula { $na }x{ $nb }; requiere { $best_limb_capture_tx_power_dbw } dBW (en vuelo { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km debe ser finito y positivo

engine-e-attitude-budget-inertias-must-be-finite-and = las inercias deben ser finitas y positivas

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 debe ser >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = se requiere al menos un contribuyente de apuntamiento

engine-e-attitude-budget-contributor-sigma-must-be-finite = el sigma del contribuyente '{ $name }' debe ser finito y >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> par GG { $t_gg } N·m; apuntamiento { $total }" RSS (dominante: { $dominant }) (presupuesto escalar MODELLED)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } requiere un valor

engine-bench-cli-unknown-option = opción `{ $a }` desconocida

engine-bench-cli-unexpected-argument = argumento `{ $pos }` inesperado

engine-bench-cli-cannot-read = no se puede leer { $p }: { $e }

engine-bench-cli-cannot-create = no se puede crear { $d }: { $e }

engine-bench-cli-cannot-write = no se puede escribir { $p }: { $e }

engine-bench-cli-unknown-task-or = tarea `{ $t }` desconocida (a, b, c o d)

engine-bench-cli-scored-epochs-in-folder = { $labels } épocas puntuadas en { $folders } carpeta(s)

engine-bench-cli-wrote-cases-json-and-truth = se escribieron { $out }/cases.json y { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = RECHAZADO: este compromiso es provisional y su semilla fue expuesta; no es un conjunto reservado de publicación

engine-bench-cli-mismatch-the-seed-is-not = DISCREPANCIA: la semilla no es la que corresponde a este compromiso

engine-bench-cli-is-not-json = { $f } no es JSON: { $e }

engine-bench-cli-cannot-read-2 = no se puede leer { $i }: { $e }

engine-bench-cli-result-rendered = { $results } resultado(s) generado(s)

engine-bench-cli-unknown-subcommand =
    subcomando `{ $other }` desconocido
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = no se puede crear { $path } (un archivo de semilla existente nunca se sobrescribe): { $e }

engine-bench-cli-cannot-write-2 = no se puede escribir { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = semilla escrita en { $path }: manténgala fuera del control de versiones y de cualquier mensaje; solo el hash indicado a continuación es público

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (heredado, no vuelto a ejecutar)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = línea base de impairment-eval: { $det }

engine-bench-cli-no-scenario-json-under = no hay scenario.json en { $root }

engine-bench-cli-is-not-json-2 = { $path } no es JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } discrepante(s), { $missing } ausente(s), { $unpinned } sin fijar

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = partición `{ $other }` desconocida (dev, test o holdout)

engine-bench-score-for-is-not-finite = la puntuación de `{ $id }` no es finita

engine-bench-case-have-no-score-the = { $missing } caso(s) sin puntuación, el primero es `{ $first_missing }`

engine-bench-predictions-name-case-that-is = las predicciones nombran un caso que no está en la verdad de referencia: `{ $extra }`

engine-bench-schema-must-be = `schema` debe ser `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` debe ser un SHA-256 hexadecimal de 64 dígitos

engine-bench-truth-is-not-json = la verdad de referencia no es JSON: { $e }

engine-bench-predictions-are-not-json = las predicciones no son JSON: { $e }

engine-bench-truth-schema-must-be = el `schema` de la verdad de referencia debe ser `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = el `schema` de las predicciones debe ser `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = la verdad de referencia se elaboró con una versión de la especificación distinta de { $SPEC_VERSION }; los resultados de versiones mayores diferentes nunca se mezclan

engine-bench-unknown-task = tarea `{ $other }` desconocida

## src/bench/site.rs

engine-bench-site-result-is-not-valid = el resultado { $v1 } no es válido: { $p }

engine-bench-site-result-is-task-holdout-result = el resultado { $v1 } es un resultado de conjunto reservado de la tarea (d) sin `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = el resultado { $v1 } se puntuó con una semilla de conjunto reservado provisional y expuesta: no es un conjunto reservado de publicación

engine-bench-site-result-was-scored-under-this = el resultado { $v1 } se puntuó con { $v }; esta página es para { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = la puntuación de `{ $k }` no es un número

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (estadístico de monitorización por defecto 0.35)

engine-bench-tasks-malformed-clock-line = línea de reloj `{ $line }` mal formada

engine-bench-tasks-the-clock-file-does-not = el archivo de reloj no coincide con el SHA-256 fijado (se obtuvo { $got }, se esperaba { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = el satélite { $prn } no está en el archivo de reloj

engine-bench-tasks-kshana-bench-baseline = línea base de kshana-bench: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = las predicciones cubren { $pmap } casos, la verdad de referencia tiene { $tarr }

engine-bench-tasks-case-has-no-number-array = el caso `{ $id }` no tiene matriz de números

engine-bench-tasks-case-needs-values-has = el caso `{ $id }` requiere { $n } valores, tiene { $a }

engine-bench-tasks-case-has-non-finite-value = el caso `{ $id }` tiene un valor no finito

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialización de { $name }: { $e }

engine-e-bin-crossover-study-write = escritura de { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = error: no se puede crear { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = terminado: inercial { $nodes } nodos, reloj { $curves } curvas (semilla 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in = { $n } épocas de usuario x 3 valores de URA en { $dt } s = { $v1 } ms por época de usuario ({ $ok } resoluble(s))

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = docs/INTEROP.md escrito (tabla de exportación)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = resumen de verificación escrito en { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = cuerpo '{ $body_name }' desconocido

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navega alrededor de un cuerpo distinto de la Tierra con un enlace con la Tierra; { $name } no se admite aquí

engine-e-body-pnt-duration-and-step-must-be = duration_s y step_s deben ser positivos, con un máximo de 20000 épocas; se recibió { $duration } y { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind debe ser orbiter o surface; se recibió '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = la altitud del usuario debe ser positiva y la excentricidad estar en [0, 0.9)

engine-e-body-pnt-the-user-orbit-periapsis-is = el periapsis de la órbita del usuario está por debajo de la superficie

engine-e-body-pnt-constellation-needs-to-200-satellites = la constelación requiere de 1 a 200 satélites en al menos un plano

engine-e-body-pnt-constellation-altitude-must-be-positive = la altitud de la constelación debe ser positiva

engine-e-body-pnt-range-sigmas-must-be-positive = los sigmas de distancia deben ser positivos

engine-e-body-pnt-no-earth-position-relative-to = no hay posición de la Tierra relativa a { $name } en JD { $jd }

engine-e-body-pnt-serialising-report = serialización del informe: { $e }

engine-e-body-pnt-the-report-must-serialise-to = el informe debe serializarse como un objeto JSON

engine-body-pnt-positioning-around-user-relays-at =
    Posicionamiento alrededor de { $name } — usuario { $user_kind }, { $n_relays } relés a { $r } km, { $n_epochs } épocas
    { "  " }Tiempo luz de la Tierra { $one_way_light_time_s } s en un sentido, { $two_way_light_time_s } s ida y vuelta; ángulo Sol-Tierra-cuerpo { $sun_separation_deg } deg
    { "  " }disponibilidad: { $availability_relays } solo constelación, { $availability_with_earth } con la distancia a la Tierra (Tierra a la vista { $earth_visibility })
    { "  " }PDOP mediano { $opt }; error RMS { $opt2 } solo constelación, { $opt3 } con la distancia a la Tierra
    { "  " }sigma formal mediano { $opt4 } solo constelación, { $opt5 } con la distancia a la Tierra{ "\u000A" }

engine-body-pnt-positioning-around = Posicionamiento alrededor de { $name }

engine-body-pnt-user-relays-earth-light-time = usuario { $user_kind } · { $n_relays } relés · tiempo luz de la Tierra { $one_way_light_time_s } s · MODELLED

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = el escenario E1 no es una tabla

engine-e-calibration-ensembles-e1-scenario-has-no-monte = el escenario E1 no tiene [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: falta final_error.{ $k }

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 es `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 conjuntos de 200 realizaciones cada uno, frente a la forma cerrada: media 0, sigma = { $sigma } ns. El conjunto j usa la semilla base 1 000 000 + 1000 j y la semilla de bootstrap 20260928 + j. El mayor error relativo de ADEV fue { $max } para E2 y { $max2 } para E3 (en 1, 10 y 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = ruta de resultado vacía

engine-e-campaign-result-path-has-an-empty = la ruta de resultado `{ $path }` tiene un segmento vacío

engine-e-campaign-result-path-bad-index-in = ruta de resultado `{ $path }`: índice incorrecto en `{ $part }`

engine-e-campaign-result-path-no-field = ruta de resultado `{ $path }`: no hay campo `{ $name }`

engine-e-campaign-result-path-indexed-value-is = ruta de resultado `{ $path }`: el valor indexado no es una matriz

engine-e-campaign-result-path-index-out-of = ruta de resultado `{ $path }`: índice { $i } fuera de rango ({ $n })

engine-e-campaign-result-path-value-is-not = ruta de resultado `{ $path }`: el valor no es un número ni un indicador

engine-e-campaign-result-path-is-not-an = ruta de resultado `{ $path }`: `{ $k }` no es una matriz

engine-e-campaign-result-path-must-name-one = la ruta de resultado `{ $path }` debe nombrar un solo valor, no filas

engine-e-campaign-result-path-is-not-an-2 = ruta de resultado `{ $path }`: `{ $name }` no es una matriz

engine-e-campaign-metric-path-has-no-entry = la ruta de métrica `{ $path }` no tiene entrada en el bloque units de ese tipo; declare su `unit` en la campaña

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` debe ser no vacío y constar de letras, dígitos, `_` o `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: una campaña no puede contener una campaña

engine-e-campaign-serialise = { $label }: serialización: { $e }

engine-e-campaign-result-did-not-parse = { $label }: el resultado no se pudo analizar: { $e }

engine-e-campaign-seed-key-no-field-in = clave de semilla `{ $key }`: no hay campo `{ $part }` en el escenario

engine-e-campaign-seed-key-is-not-non = la clave de semilla `{ $key }` no es un entero no negativo

engine-e-campaign-seed-does-not-fit-toml = la semilla { $seed } no cabe en un entero TOML

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = la ruta de tiempo `{ $t }` debe nombrar filas con `[]`

engine-campaign-compare-is-not-below-above = el valor de compare `{ $c }` no es below, above ni abs_above

engine-campaign-threshold-is-null = el umbral `{ $p }` es nulo

engine-campaign-reduce-is-not-mean-min = el valor de reduce `{ $r }` no es mean, min, max ni count

engine-campaign-time-path-gives-several-values = la ruta de tiempo `{ $t }` da varios valores por fila

engine-campaign-value-path-has-fewer-rows = la ruta de valores `{ $y }` tiene menos filas que `{ $t }`

engine-campaign-value-path-has-rows-time = la ruta de valores `{ $y }` tiene { $r } filas, la ruta de tiempo `{ $t }` tiene { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = una campaña con fases requiere una sección [timeline] con step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s debe ser positivo, se recibió { $step }

engine-e-campaign-phase-is-named-twice = la fase `{ $name }` está nombrada dos veces

engine-e-campaign-phase-duration-must-be-non = fase `{ $name }`: duration_s debe ser no negativo

engine-e-campaign-phase-has-no-runs = la fase `{ $name }` no tiene ejecuciones

engine-e-campaign-phase-the-first-phase-has = fase `{ $name }`: la primera fase no tiene nada que traspasar

engine-e-campaign-phase-handoff-from-channel-which = fase `{ $name }`: traspaso desde el canal `{ $ch }`, con el que la fase anterior no terminó

engine-e-campaign-phase-handoff-from-run-does = fase `{ $name }`: el traspaso desde from_run { $from_run } no existe

engine-e-campaign-phase-handoff-is-null = fase `{ $name }`: el traspaso `{ $from }` es nulo

engine-e-campaign-phase-handoff-run-does-not = fase `{ $name }`: la ejecución { $run } del traspaso no existe

engine-e-campaign-phase = fase `{ $name }`: { $e }

engine-campaign-phase-run = fase { $name }/ejecución { $ri }

engine-e-campaign-phase-end-at-run-does = fase `{ $name }`: end_at_run { $end_at_run } no existe

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s es posterior)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } es nulo)

engine-e-campaign-phase-side-is-not-classical = fase `{ $name }`: el lado `{ $side }` no es classical ni quantum

engine-e-campaign-phase-skip-must-be-non = fase `{ $name }`: skip_s debe ser no negativo

engine-e-campaign-phase-alarm-compare-is-not = fase `{ $name }`: el compare de alarma `{ $compare }` no es below, above ni abs_above

engine-e-campaign-phase-alarm-threshold-is-null = fase `{ $name }`: el umbral de alarma `{ $p }` es nulo

engine-e-campaign-phase-channel-is-in-not = fase `{ $name }`: el canal `{ $channel }` está en { $u }, no en { $du }

engine-e-campaign-phase-channel-needs-unit = fase `{ $name }`: el canal `{ $channel }` requiere una unidad

engine-e-campaign-phase-two-runs-both-provide = fase `{ $name }`: dos ejecuciones aportan ambas el canal `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = la fase `{ $name }` transporta `{ $ch }`, con el que la fase anterior no terminó

engine-e-campaign-phase-carries-but-no-run = la fase `{ $name }` transporta `{ $ch }`, pero ninguna ejecución suya aporta `{ $ch }`

engine-e-campaign-channel-is-in-in-one = el canal `{ $name }` está en { $unit } en una fase y en { $unit2 } en otra

engine-e-campaign-at-least-one-metric-is = se requiere al menos una métrica

engine-e-campaign-metric-is-named-twice = la métrica `{ $name }` está nombrada dos veces

engine-e-campaign-seed-overflow-in-the-ensemble = desbordamiento de semilla en el conjunto

engine-e-campaign-an-ensemble-needs-at-least = un conjunto requiere al menos una ejecución

engine-e-campaign-sweep-takes-one-to-three = un barrido admite de uno a tres ejes, se recibió { $axes }

engine-e-campaign-axis-is-named-twice = el eje `{ $name }` está nombrado dos veces

engine-e-campaign-axis-needs-at-least-two = el eje `{ $name }` requiere al menos dos pasos

engine-e-campaign-axis-scale-must-be-lin = eje `{ $name }`: scale debe ser lin o log

engine-e-campaign-axis-log-axis-needs-positive = eje `{ $name }`: un eje log requiere extremos positivos

engine-campaign-sweep-node = nodo de barrido { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs debe ser al menos dos

engine-e-campaign-compose-needs-at-least-one = compose requiere al menos un miembro

engine-e-campaign-shared-value-must-be-number = el valor compartido `{ $name }` debe ser un número o números

engine-e-campaign-shared-value-is-named-twice = el valor compartido `{ $name }` está nombrado dos veces

engine-e-campaign-member-binds-unknown-shared = el miembro `{ $label }` enlaza un valor compartido desconocido `{ $name }`

engine-e-campaign-member = miembro `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = la métrica `{ $name }` está en { $u } para un miembro y en { $unit } para `{ $label }`

engine-e-campaign-member-is-named-twice = el miembro `{ $label }` está nombrado dos veces

engine-e-campaign-invalid-campaign-scenario = escenario de campaña no válido: { $e }

engine-e-campaign-invalid-campaign = campaña no válida: { $e }

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } de { $what } entre las realizaciones

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = valor de { $ch } al final de la fase anterior, sumado al { $ch } de esta fase

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } en la cuadrícula temporal: la última muestra de la ejecución de la fase propietaria en cada instante de la cuadrícula o antes (retención de orden cero); nulo donde ninguna ejecución de esa fase la aporta

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = valores de la clave de escenario { $key } a lo largo del eje { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = valor de la clave de escenario { $key } en este nodo

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } del resultado del nodo

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } de cada realización, en orden de semilla

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = valor compartido { $name }, escrito en cada miembro que lo enlaza

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = métrica { $name } leída del resultado del miembro

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = valor mínimo de { $name } entre los miembros

engine-campaign-largest-across-the-members = valor máximo de { $name } entre los miembros

engine-campaign-mean-across-the-members = valor medio de { $name } entre los miembros

engine-e-campaign-failed-to-serialise-campaign-result = error al serializar el resultado de la campaña: { $e }

engine-campaign-chain-phases-over-events-alarm = cadena: { $phases } fases durante { $duration_s } s, { $events } eventos, alarma activa durante { $alarm_s } s de la cuadrícula

engine-campaign-sweep-of-nodes-over = barrido de `{ $scenario_kind }`: { $nodes } nodos sobre [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Monte Carlo de `{ $scenario_kind }`: { $runs } semillas

engine-campaign-compose-members = compose: { $members } miembros

engine-campaign-member-runs-modelled = { $runs_total } ejecuciones de miembros (MODELLED)

engine-campaign-sweep-of-over-nodes-each = barrido de `{ $scenario_kind }` sobre { $axis_order } ({ $nodes } nodos{ $v4 }; cada línea en su propio rango)

engine-campaign-campaign-modelled-composition-every-value = campaña { $r } | composición MODELLED; cada valor leído de una ejecución real del tipo indicado

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = una optimización admite de uno a tres params, se recibió { $params }

engine-e-campaign-optimize-param-is-named-twice = el param `{ $name }` está nombrado dos veces

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: requiere lo < hi finitos

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale debe ser lin o log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: un param log requiere límites positivos

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start debe estar en [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: una cuadrícula requiere pasos de al menos dos

engine-e-campaign-optimize-objective-target-is-only-read = objective.target solo se lee con goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" requiere un objective.target finito

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal debe ser minimize, maximize o target, se recibió `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = una cuadrícula de { $total } nodos supera el límite de 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps solo se lee con method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals debe cubrir el símplex inicial (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step debe estar en (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol y xtol deben ser no negativos

engine-e-campaign-optimize-method-must-be-grid-or = method debe ser grid o nelder-mead, se recibió `{ $other }`

engine-campaign-optimize-optimize-eval = evaluación de optimize { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = límite inferior de la clave de escenario { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = límite superior de la clave de escenario { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = valor de la clave de escenario { $key } en la mejor evaluación

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = valor de la clave de escenario { $key } en esta evaluación

engine-campaign-optimize-target-value-of = valor objetivo de { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } en la mejor evaluación

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } de esta evaluación (la media de las semillas cuando runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) de `{ $scenario_kind }` mediante { $method }: { $evals } evaluaciones ({ $stop_reason }), mejor { $o2 } en [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START antes del encabezado CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: línea de encabezado mal formada: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: línea de metadatos mal formada: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: línea de datos mal formada: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: palabra clave de datos { $k } no reconocida

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: a la línea de datos { $k } le falta la época

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: a la línea de datos { $k } le falta el valor

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: línea de datos { $k } con valor incorrecto { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: segmento sin terminar (falta META_STOP/DATA_STOP)

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: TURNAROUND_NUMERATOR { $value } incorrecto

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: TURNAROUND_DENOMINATOR { $value } incorrecto

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = observable `{ $other }` desconocido: se esperaba uno de range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = coordenadas `{ $other }` desconocidas: se esperaba uno de cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours debe ser finito y positivo, se recibió { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs debe ser ≥ 2, se recibió { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps debe ser ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials debe ser ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations debe ser ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd debe ser finito y positivo, se recibió { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor debe ser finito y positivo, se recibió { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km debe ser finito y positivo, se recibió { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m debe ser finito y positivo, se recibió { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s debe ser finito y positivo, se recibió { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = la constelación debe incluir al menos un satélite principal y una referencia

engine-e-cislunar-arc-recovery-family-is-an-out-of = la familia `{ $family }` es una familia fuera del plano y no tiene representación plana de cuatro estados: defina spatial = true para barrerla

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = el modelo directo produjo una medición de verdad de referencia no finita

engine-cislunar-arc-recovery-first-arc-length-at-which = primera longitud de arco en la que CADA resolución por lotes sin ruido de los ensayos con semilla lleva el error de estado final a como máximo { $recovery_factor } veces el desplazamiento a priori del que partió. Es el análogo de recuperación del criterio de rango: con mediciones exactas, la pregunta `is the state observable?` pasa a ser `can an estimator get it back?`, y ninguna tolerancia de valores singulares interviene en la respuesta.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = primera longitud de arco en la que el error RMS de recuperación de posición Monte Carlo sobre { $trials } realizaciones de ruido con semilla cae a { $error_bound_km } km o por debajo. Es el análogo de recuperación del criterio de estimabilidad, medido en lugar de predicho: el error es la distancia de la estimación a la verdad conocida, no la traza de una covarianza formal.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED dentro de un paso de la cuadrícula de épocas: el estimador recupera desde { $e } h, el criterio de rango de la gramiana se satisface en { $g } h (razón { $v1 }, cuadrícula { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED como límite de recuperabilidad: el estimador recupera desde { $e } h, { $v1 } los { $g } h del criterio de rango de la gramiana (razón { $v2 }, cuadrícula { $grid_hours } h). El criterio de rango es una convención relativa de valores singulares; el límite de recuperación es un error de estado medido, y ambos no coinciden aquí.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: el estimador nunca alcanza su cota de recuperación en este arco, mientras que el criterio de rango de la gramiana se satisface en { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = el criterio de rango de la gramiana nunca se satisface en este arco (la geometría nunca alcanza rango completo), mientras que el estimador recupera desde { $e } h — ambos discrepan sobre si existe siquiera un límite.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | familia { $family }, { $state_dim } estados, { $n_spacecraft } s/c, observable { $observable }, parametrización { $coordinates } | arco de { $arc_hours } h, { $epochs } épocas (cuadrícula { $grid_hours } h), { $trials } ensayos, semilla { $seed } | derivadas parciales por diferencias finitas, sin jacobiano analítico / STM / SVD / SRIF | recuperación sin ruido desde { $nf } (factor { $recovery_factor }) frente al umbral de rango de la gramiana { $gram } | estimabilidad Monte Carlo desde { $est } (pos. RMS ≤ { $error_bound_km } km, σ { $sigma_range_m } m) frente a la estimabilidad de la gramiana { $gram_est } | pos. RMS al final del arco { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = familia `{ $other }` desconocida: se esperaba uno de dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = la DRO a la distancia de cruce { $d } no convergió por corrección diferencial

engine-e-cislunar-observability-member-at-x0-did-not = el miembro { $i } de { $label } en x0 = { $x0 } no convergió por corrección diferencial

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft debe estar entre 2 y { $MAX_SPACECRAFT }, se recibió { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs debe ser ≥ 2, se recibió { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol debe ser finito y positivo, se recibió { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m debe ser finito y no negativo, se recibió { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km debe ser finito y positivo, se recibió { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } s/c ({ $refs } referencias) | arco de { $arc_hours } h, { $rank_arc } épocas | rango { $first } → { $last } de { $state_dim } a lo largo del arco | λ de la gramiana [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rango instantáneo solo distancia { $rank_range_only } → distancia+tasa { $rank_range_rate } ({ $n_links } enlaces) | GDOP solo distancia { $ro } distancia+tasa { $rr } | condiciones iniciales de DRO (residuo máx. de periodicidad { $max_resid }) | posterior SRIF finito en la época de rango 4 { $srif_epoch } (verificado frente a una referencia independiente: rango/STM/cierre de DRO/SRIF; calculado a partir de un modelo: diseño)

engine-cislunar-observability-never-rank-of = nunca (rango { $rank } de { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | familia { $family }, { $state_dim } estados, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | umbral de rango { $rank_thr } (cuadrícula { $c } h) | umbral de estimabilidad (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = primera longitud de arco en la que la incertidumbre formal de posición 1σ del estado INICIAL del satélite principal, σ_pos = sqrt(trace(P_rr)) con P = (ÕᵀÕ)⁻¹ y Õ la matriz de observabilidad blanqueada respecto al ruido de medición, cae a { $sigma_pos_threshold_km } km o por debajo. Es el criterio bajo el cual un umbral de longitud de arco depende del ruido: P escala como σ², por lo que σ_pos escala como σ, mientras que el criterio de rango anterior no varía con σ. La cota es una elección de ingeniería DECLARADA, no ajustada — estimability_sweep informa el umbral para otras cuatro cotas.

engine-cislunar-observability-extension-r3-this-run-is = EXTENSIÓN (R3) — esta ejecución NO es la configuración DRO plana que describe el `label` anterior. Dimensión de estado { $state_dim }; familia de órbita { $family }; { $n_spacecraft } naves; sigma de medición de distancia { $sigma_range_m } m. Donde `label` dice "planar" y "planar DROs", léase la familia indicada aquí. Adiciones VALIDATED: la STM variacional de 6x6 es la misma STM CR3BP verificada por diferencias finitas (crate::cr3bp) usada a ancho completo; las filas jacobianas espaciales de distancia / tasa de distancia son derivadas parciales analíticas verificadas por diferencias finitas, y la fila de tasa de distancia se contrastó componente a componente con la función independiente 3-D del crate deepspace_od::range_rate_observable; las condiciones iniciales de halo / NRHO son órbitas periódicas corregidas diferencialmente por el mismo corrector que reproduce la NRHO 9:2 sur de L2 publicada, continuadas desde esa semilla publicada, y se informa el residuo de cierre de cada miembro; los veredictos de RANGO de seis estados se confirman frente a un rango escalonado por filas INDEPENDIENTE (eliminación gaussiana con pivoteo parcial) que no comparte código con la vía de valores propios/SVD. ALCANCE REAL DE LA VÍA SRIF: la validación cruzada SRIF anterior consume los MISMOS jacobianos de medición y se reduce a la misma O^T O, de modo que su concordancia es una comprobación de consistencia entre dos máquinas numéricas, NO una corroboración independiente del umbral — no se cuenta como verificación de ninguna cifra aquí. MODELLED: el diseño de la familia (qué abscisas, amplitudes y fases), la cuadrícula de épocas, el arco de un solo enlace y la cota de posición declarada del criterio de estimabilidad.

engine-cislunar-observability-validated-each-constellation-initial-condition = Verificado frente a una referencia independiente: cada condición inicial de la constelación es una órbita periódica corregida diferencialmente de la familia { $family }, que se cierra en un período con el residuo de periodicidad informado (las DRO planas son además retrógradas respecto a la Luna). La familia se corrige con la razón de masas Tierra-Luna. Calculado a partir de un modelo: la elección de los parámetros y fases de la familia (el diseño de la constelación). El nombre de clave `dro_provenance` se conserva por el esquema del documento publicado; contiene la familia que pidió esta ejecución.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } debe ser finito y positivo, se recibió { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } debe estar en (0, 1), se recibió { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg debe estar en [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems debe nombrar al menos un preajuste

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias requiere bias_m, t0_s y t1_s finitos

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch = integrity: { $n } épocas superan el tope de { $MAX_EPOCHS } épocas; aumente step_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: sin registros

engine-e-clock-library-card-records-at-different-tau0 = { $name }: registros con distinto tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: falló el ajuste periódico por mínimos cuadrados

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: { $used } puntos de estabilidad con edf >= { $MIN_FIT_EDF }; una ficha requiere tres

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = huecos { $g }, valores atípicos de fase { $o }, saltos de fase { $p }, ráfagas { $b }, saltos de frecuencia { $f } (sigma_y robusto { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` no es un entero no negativo

engine-e-compliance-is-missing = falta `{ $p }`

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } supera events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } supera predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: los recuentos de receiver-trust están mal formados ({ $malformed_counts }); excluido

engine-e-compliance-not-json = { $label }: no es JSON: { $e }

engine-compliance-cannot-read = { $label }: no se puede leer: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: el escenario hermano indica el tipo `{ $s }` pero el resultado indica `{ $o }`; no se usa

engine-e-compliance-scenario-kind-not-found-no = { $label }: no se encontró el tipo de escenario (no hay archivo de escenario hermano, no es un resultado de receiver-trust, no hay `kind` de nivel superior)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` no es un tipo de escenario que el motor conozca; no se usa

engine-compliance-written-by-kshana = Escrito por kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } prueba(s) con todos los umbrales indicados alcanzados, { $not_met } con un umbral no alcanzado, { $needs_input } pendiente(s) de datos de entrada.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = la cuadrícula de intensidad debe tener min < max finitos, se recibió [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = la cuadrícula de intensidad requiere >= 2 pasos, se recibió { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = la cuadrícula de correlación debe tener al menos un valor

engine-e-conflict-resilience-correlation-values-must-lie-in = los valores de correlación deben estar en [0, 1], se recibió { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience requiere al menos una capa

engine-e-conflict-resilience-layer-availability-not-in = la disponibilidad { $availability } de la capa { $i } no está en [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = sigma_m de la capa { $i } debe ser finito y positivo

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = vulnerability de la capa { $i } debe ser finito y >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = vector_weight de la capa { $i } debe ser finito y >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } fuera de rango (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials debe ser >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } capas ({ $primary } de línea base) | intensidad de referencia { $reference_intensity } | razón de resiliencia en forma cerrada { $ratio_closed_form }x MC { $ratio_mc_independent }x (por capas frente a una sola capa) | la correlación anula el efecto de las capas: razón { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | IC a priori [{ $ratio_lo }-{ $ratio_hi }]x | supervivencia por vector @ jam de referencia { $surv } % spoof { $surv2 } % cinético { $surv3 } % ciber { $surv4 } % (el más marcado { $sharpest }) | cifra principal ~7x MODELLED, VALIDATED MC->forma cerrada / identidad de fusión / márgenes de cópula / supervivencia por vector

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = cuerpo central { $name } desconocido: se esperaba un planeta, Plutón, la Luna o una luna mayor (earth, moon, mars, europa, titan, ...; véase crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = una shell Walker requiere total > 0 y planes > 0

engine-e-constellation-walker-total-is-not-multiple = el total Walker { $total } no es múltiplo de planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = el desfase Walker F = { $phasing } debe estar en 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } no es una ranura GPS ampliable (SPS PS Tabla 3.2-2 enumera B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: indique altitude_km o semi_major_axis_km, no ambos

engine-e-constellation-needs-altitude-km-or-semi = { $what }: requiere altitude_km o semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: el semieje mayor { $v1 } km no supera el radio de { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: la excentricidad { $e } debe estar en [0, 0.9)

engine-e-constellation-perigee-is-below-the-surface = { $what }: el perigeo está por debajo de la superficie de { $name }

engine-e-constellation-constellation-preset-is-an-earth = constelación { $name }: el preajuste { $p } es una constelación de la Tierra, el cuerpo es { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = constelación { $name }: preajuste { $other } desconocido (se esperaba gps-baseline, gps-expandable, galileo, beidou, beidou-meo o glonass)

engine-e-constellation-constellation-expanded-applies-only-to = constelación { $name }: `expanded` se aplica solo al preajuste gps-expandable

engine-constellation-constellation-shell = constelación { $name }, shell { $v2 }

engine-constellation-explicit-element-sets = { $satellite } conjuntos de elementos explícitos

engine-constellation-constellation-satellite = constelación { $name }, satélite { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = la constelación { $name } no tiene satélites: indique un preajuste, un [[constellation.shell]] o un [[constellation.satellite]]

engine-e-constellation-no-constellation-given = no se indicó ninguna constelación

engine-e-constellation-constellations-with-one-clock-each = { $constellations } constelaciones con un reloj cada una superan el límite de { $MAX_CLOCKS } relojes; use clock = "common" o fusione constelaciones

engine-e-constellation-must-be-finite = { $what } debe ser finito

engine-e-constellation-need-step-and-duration-step = se requieren step_s > 0 y duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = más de 100 000 épocas; aumente step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg debe estar en [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold debe ser positivo

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg debe estar en [0.25, 90]

engine-e-constellation-need-90-lat-min-deg = se requiere -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = se requiere lon_min_deg < lon_max_deg que abarque como máximo 360 deg

engine-e-constellation-give-at-least-one-constellation = indique al menos una [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points está limitado a 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } satélites superan el límite de 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: { $total } satélites ({ $names }) alrededor de { $name }; disponibilidad { $global_availability_pct } % (PDOP <= { $pdop_threshold } con máscara de { $mask_deg } deg), peor sitio { $worst_site_availability_pct } %, PDOP mediano { $cov }, media de { $global_mean_visible } a la vista; { $grid_points } puntos de cuadrícula x { $epochs } épocas (MODELLED)

engine-constellation-constellation-coverage-over-the = Cobertura de la constelación sobre { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } debe ser finito y positivo

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } debe ser finito y >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw debe ser finito

engine-e-contact-schedule-satellite-altitude-km-must-be = satélite '{ $name }': altitude_km debe estar en (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satélite '{ $name }': inclination_deg debe estar en [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satélite '{ $name }': backlog_mbit debe ser >= 0

engine-e-contact-schedule-satellite-priority-must-be = satélite '{ $name }': priority debe ser > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satélite '{ $name }': eirp_dbw debe ser finito

engine-e-contact-schedule-station-lat-deg-in-90 = estación '{ $name }': lat_deg en [-90, 90], lon_deg finito

engine-e-contact-schedule-station-mask-deg-must-be = estación '{ $name }': mask_deg debe estar en [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = estación '{ $name }': alt_m debe estar en [0, 3000] (rango de ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = estación '{ $name }': setup_s >= 0 y g_over_t_db finito

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours debe estar en (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s debe estar en (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = se requieren al menos un satélite y una estación

engine-e-contact-schedule-at-most-32-satellites-and = como máximo 32 satélites y 32 estaciones

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: { $satellites } satélites x { $stations } estaciones durante { $duration_hours } h -> { $cands } contactos candidatos, { $greedy } programados; { $total_del } de { $total_backlog } Mbit entregados{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: { $pairs } pasada(s); ACM { $acm } Mbit frente a CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = se requieren al menos 2 ensayos y un sigma_m > 0 finito

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total debe estar en (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = no hay marco local en el usuario

engine-e-dop-error-ci-singular-geometry = { $name }: geometría singular

engine-e-dop-error-ci-no-noise-free-fix = { $name }: sin solución de posición sin ruido

engine-e-dop-error-ci-no-fix = { $name }: sin solución de posición

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: geometría singular

engine-e-dop-error-mc-no-fix = { $label }: sin solución de posición

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km debe ser positivo; se recibió { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes y sats_per_plane deben ser ambos distintos de cero

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz debe ser positivo; se recibió { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency debe estar en (0, 1]; se recibió { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k debe ser positivo; se recibió { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db debe ser no negativo; se recibió { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m debe estar fuera de la Tierra; se recibió { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance = GNSS de la Tierra a distancia lunar — { $n_satellites } satélites, receptor a { $r } km{ "\u000A" }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Limbo de la Tierra desde la constelación: { $earth_limb_half_angle_deg } deg fuera del nadir — todo rayo con destino lunar debe superarlo{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_geometrically_visible } de { $n_satellites } no ocultados; { $n_trackable } superan el umbral de seguimiento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }mejor enlace { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }toda línea de visión rastreable queda dentro de un semicono de { $a } deg — la geometría es casi degenerada{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }BARRIDO sobre { $epochs } épocas / { $span_s } s: disponibilidad de señal { $signal_availability }, disponibilidad de solución de posición { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }enlaces rastreables media { $mean_trackable }, máx. { $max_trackable }; mejor C/N0 { $w }; mejor PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = se requieren entre una y seis etapas

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg debe ser finito y no negativo

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 debe ser finito y no negativo

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg debe ser finito y no negativo

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m debe ser finito y no negativo

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg debe estar en [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s debe ser finito y no negativo

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = la relación empuje-peso al despegue { $tw } debe superar 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: dv ideal { $ideal_dv_m_s } m/s, pérdidas { $losses } m/s (gravedad { $gravity_loss_m_s }, resistencia { $drag_loss_m_s }, guiado { $steering_loss_m_s }, contrapresión { $back_pressure_loss_m_s }); fin de combustión { $r } km a { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } debe ser finito y positivo

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body debe ser "earth" o "mars", se recibió "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = la atmósfera "{ $a }" no está disponible para el cuerpo "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg debe estar en (0, 90) (positivo hacia abajo)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m debe estar en [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg debe ser finito con |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg y longitude_deg deben ser finitos

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag debe estar en [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg debe ser finito

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s debe estar en (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m debe estar en [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s debe estar en (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame debe ser inertial|relative, se recibió "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> pico { $pk_g } g a { $r } km, q pico { $r2 } W/cm² a { $r3 } km, carga térmica { $r4 } J/cm², q_dyn pico { $r5 } kPa; { $outcome } a { $end_time_s } s (forma cerrada { $cf_g } g; MODELLED 3-DoF, sin radiativo/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } debe estar en (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } debe ser finito y no negativo

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg debe estar en [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits debe estar en 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (pozo { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = el ángulo de nadir { $eta_rad }° supera el radio angular de la Tierra { $rho }° (no alcanza la Tierra)

engine-e-eo-payload-no-sun-synchronous-inclination-at = no hay inclinación heliosíncrona a { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg debe estar en (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad debe ser finito y positivo

engine-e-eo-payload-half-fov-too-large = half_fov demasiado grande: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, FOV de ±{ $half_fov_deg }° -> franja de { $v3 } km, GSD en nadir { $gsd } m, acceso hasta { $v5 } km fuera del nadir; separación de nodos { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = baricentro Tierra-Luna a partir de { $table }, separado por la serie lunar de Montenbruck & Gill precesada a J2000

engine-ephem-provider-jpl-mean-elements-in-the = elementos medios de JPL en el plano de Laplace, tasa de longitud media a partir de la tasa de rotación síncrona de la IAU, sumados a su planeta a partir de { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = dirección de rotación síncrona de la IAU a la distancia media de JPL, sumada a Saturno a partir de { $table }

engine-e-ephem-provider-read = lectura de { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = falta la línea 1 del TLE (una línea que comienza con `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = falta la línea 2 del TLE (una línea que comienza con `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = una efemérides analítica `orbit` requiere un `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = un escenario de efemérides requiere un `tle` o un `orbit`

engine-e-ephemeris-step-must-be-positive = step_s debe ser positivo

engine-e-ephemeris-duration-must-be-non-negative = duration_s debe ser no negativo

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz debe ser una frecuencia positiva y finita

engine-ephemeris-ground-track-samples-alt-km = traza terrestre de { $source } · { $n_samples } muestras · alt { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` no es finito

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` no es ni segundos ni una hora UTC ISO-8601

engine-e-evidence-assemble-no-epoch-of-the-log = ninguna época del registro cae entre { $t0 } s y { $t1 } s (el registro abarca de 0 a { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config no es un objeto

engine-e-evidence-assemble-config-json-already-has-an = config.json ya tiene una entrada `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = de { $from_s } a { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` no es una hora UTC como 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } en un registro de { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } requiere un valor

engine-e-evidence-cli-cannot-create = no se puede crear { $path }: { $e }

engine-e-evidence-cli-cannot-write = no se puede escribir { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = advertencia: { $path } es legible por otros usuarios; restrínjalo (chmod 600)

engine-e-evidence-cli-cannot-read-key = no se puede leer la clave { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } no es una clave hexadecimal

engine-e-evidence-cli-must-hold-32-byte-key = { $path } debe contener una clave de 32 bytes como 64 dígitos hexadecimales

engine-e-evidence-cli-cannot-read = no se puede leer { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = no se puede leer { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } existe y no está vacío

engine-e-evidence-cli-cannot-create-2 = no se puede crear { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = advertencia: { $arg } es de solo propietario (modo 600) y no se llama *.pub: puede ser una clave privada. Pase el archivo de clave pública.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` no es ni 64 dígitos hexadecimales ni un archivo legible ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` no contiene dígitos hexadecimales

engine-evidence-cli-private-key-keep-it-secret = clave privada: { $out }  (manténgala en secreto; nunca la suba a un repositorio)

engine-evidence-cli-public-key-pub = clave pública:  { $out }.pub

engine-evidence-cli-public-key-hex = clave pública (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Entregue la clave pública a los verificadores por una vía de confianza; ellos la fijan con --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify requiere un directorio de paquete

engine-e-evidence-cli-cannot-read-3 = no se puede leer { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: no se encontró ningún certificado PEM

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }firma de la autoridad de sellado de tiempo no verificada por Kshana

engine-evidence-cli-this-is-technical-record-not = Este es un registro técnico, no un dictamen jurídico.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp requiere un directorio de paquete

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp requiere un archivo de token

engine-e-evidence-cli-cannot-read-4 = no se puede leer { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = no se puede escribir { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = nota: el token se guarda junto al manifiesto firmado, no dentro de él; verifique con --require-timestamp para exigirlo.

engine-e-evidence-cli-round-trip-packs-are-not = los paquetes round-trip no se generan para WebAssembly

engine-e-evidence-cli-needs-scenario-path = requiere una ruta de escenario

engine-e-evidence-cli-needs-from = requiere --from

engine-e-evidence-cli-needs-to = requiere --to

engine-e-evidence-cli-cannot-read-lab-attestation = no se puede leer la declaración de laboratorio { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = no se puede leer { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = escenario receiver-trust no válido: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation se aplica a `receiver-trust evidence`, no a `evidence round-trip` (cuyo paquete registra las condiciones de ensayo)

engine-e-evidence-cli-cannot-read-6 = no se puede leer { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = no se puede leer { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = paquete de evidencias escrito en { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }épocas en la ventana: { $epochs_in_window }  ({ $from_s } s a { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }huella del firmante: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 de manifest.json (lo que una autoridad RFC 3161 debe sellar): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }fragmento del registro: bytes { $a } a { $b } de { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }fragmento del registro: registro completo (este registro no da un intervalo de bytes para la ventana)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }declaración de laboratorio registrada en el manifiesto firmado ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Un paquete es un registro técnico, no un dictamen jurídico.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s a { $to_s } s después de la primera época del registro

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = TOML de declaración de laboratorio no válido: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` debe ser una tabla

engine-e-evidence-lab-invalid-lab-attestation = lab-attestation no válida: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } es obligatorio

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } supera { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: la fecha { $date } no es un día como 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: una configuración blindada requiere enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup debe ser "conducted" o "shielded" (se recibió { $other }); una configuración por aire no se acepta como ensayo de laboratorio

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db debe ser finito

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = las condiciones de ensayo indican { $events } evento(s), pero el escenario de puntuación tiene { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = el evento '{ $id }' de las condiciones de ensayo ({ $onset_s } s a { $offset_s } s) no coincide con '{ $label }' del escenario de puntuación ({ $onset_s2 } s a { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = el SHA-256 del registro ({ $have }) no es el que indican las condiciones de ensayo ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = DER truncado

engine-e-evidence-tsa-bad-der-length = longitud DER incorrecta

engine-e-evidence-tsa-unexpected-der-tag = { $what }: etiqueta DER { $tag } inesperada

engine-e-evidence-tsa-empty-algorithmidentifier = AlgorithmIdentifier vacío

engine-e-evidence-tsa-bad-utctime = UTCTime incorrecto

engine-e-evidence-tsa-bad-generalizedtime = GeneralizedTime incorrecto

engine-e-evidence-tsa-bad-time = hora incorrecta

engine-e-evidence-tsa-time-not-in-utc = la hora no está en UTC

engine-e-evidence-tsa-bad-time-digits = dígitos de hora incorrectos

engine-e-evidence-tsa-bad-bit-string = BIT STRING incorrecto

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: se esperaban tres elementos

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: demasiado corto

engine-e-evidence-tsa-empty-extension = Extension vacía

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: el valor no es un OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: vacío

engine-e-evidence-tsa-validity-short = Validity: corto

engine-e-evidence-tsa-pem-end-without-begin = PEM: END sin BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: base64 incorrecto

engine-e-evidence-tsa-pem-bad-base64-length = PEM: longitud base64 incorrecta

engine-e-evidence-tsa-spki-empty = SPKI: vacío

engine-e-evidence-tsa-spki-no-oid = SPKI: sin OID

engine-e-evidence-tsa-spki-no-key = SPKI: sin clave

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: se esperaban dos enteros

engine-e-evidence-tsa-unsupported-elliptic-curve = curva elíptica no admitida

engine-e-evidence-tsa-unsupported-public-key-algorithm = algoritmo de clave pública no admitido

engine-e-evidence-tsa-rsa-key-or-signature-too = clave o firma RSA demasiado grande

engine-e-evidence-tsa-rsa-modulus-not-odd = el módulo RSA no es impar

engine-e-evidence-tsa-rsa-signature-out-of-range = firma RSA fuera de rango

engine-e-evidence-tsa-rsa-key-too-small = clave RSA demasiado pequeña

engine-e-evidence-tsa-invalid-padding = relleno no válido

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: mensaje codificado demasiado largo

engine-e-evidence-tsa-last-octet-invalid = último octeto no válido

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: los bits más a la izquierda no son cero

engine-e-evidence-tsa-pss-bad-padding = PSS: relleno incorrecto

engine-e-evidence-tsa-pss-signature-mismatch = PSS: la firma no coincide

engine-e-evidence-tsa-unsupported-mask-generation-function = función de generación de máscara no admitida

engine-e-evidence-tsa-mgf1-without-hash = MGF1 sin hash

engine-e-evidence-tsa-bad-pss-salt-length = longitud de sal PSS incorrecta

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = una firma ECDSA requiere una clave EC

engine-e-evidence-tsa-an-rsa-signature-needs-an = una firma RSA requiere una clave RSA

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption sin algoritmo de resumen

engine-e-evidence-tsa-an-rsa-pss-signature-needs = una firma RSA-PSS requiere una clave RSA

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey sin algoritmo de resumen

engine-e-evidence-tsa-unsupported-signature-algorithm = algoritmo de firma no admitido

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: vacío

engine-e-evidence-tsa-time-stamp-request-not-granted = solicitud de sello de tiempo no concedida

engine-e-evidence-tsa-no-time-stamp-token-in = no hay token de sello de tiempo en la respuesta

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = no es un TimeStampResp ni un TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = no es CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: sin contenido

engine-e-evidence-tsa-signeddata-short = SignedData: corto

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: vacío

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = el contenido encapsulado no es un TSTInfo

engine-e-evidence-tsa-no-tstinfo = sin TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo no está en un OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: corto

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: sin genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: sin signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = se esperaba exactamente un SignerInfo

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: sin sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: sin algoritmo de resumen

engine-e-evidence-tsa-signerinfo-short = SignerInfo: corto

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: sin atributos firmados

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: sin algoritmo de firma

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: sin firma

engine-e-evidence-tsa-no-serial = sin número de serie

engine-e-evidence-tsa-signer-certificate-not-found = certificado del firmante no encontrado

engine-e-evidence-tsa-attribute-empty = Attribute: vacío

engine-e-evidence-tsa-attribute-no-values = Attribute: sin valores

engine-e-evidence-tsa-attribute-no-value = Attribute: sin valor

engine-e-evidence-tsa-content-type-attribute-mismatch = el atributo content-type no coincide

engine-e-evidence-tsa-digest-failure = fallo de resumen

engine-e-evidence-tsa-signature-not-an-octet-string = la firma no es un OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = falta el atributo ess signing cert.

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: vacío

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id no encontrado

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: sin hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = finalidad del certificado no adecuada

engine-e-evidence-tsa-certificate-is-not-yet-valid = el certificado aún no es válido

engine-e-evidence-tsa-certificate-has-expired = el certificado ha caducado

engine-e-evidence-tsa-invalid-ca-certificate = certificado de CA no válido

engine-e-evidence-tsa-certificate-chain-too-long = cadena de certs. demasiado larga

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: vacío

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: sin resumen

engine-e-evidence-tsa-message-imprint-mismatch = la huella del mensaje no coincide

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = no se admite BER de longitud indefinida

engine-e-evidence-tsr-expected-tag-found = se esperaba { $what } (etiqueta { $tag }), se encontró { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = PKIStatusInfo mal formado

engine-e-evidence-tsr-the-timestamp-response-was-not = la respuesta de sello de tiempo no fue concedida

engine-e-evidence-tsr-not-timestamp-token = no es un token de sello de tiempo

engine-e-evidence-tsr-the-token-content-type-is = el tipo de contenido del token no es CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = el token no contiene un TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = la huella del mensaje usa un algoritmo de hash no admitido

engine-e-evidence-tsr-the-imprint-is-bytes-not = la huella tiene { $digest } bytes, no los { $want_len } que da { $hash_alg }

engine-e-evidence-tsr-gentime-is-not-utc = genTime no está en UTC

engine-e-evidence-tsr-malformed-gentime = genTime mal formado

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime no es una hora de calendario real

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = no es hexadecimal en minúsculas

engine-e-evidence-verify-expected-bytes-found = se esperaban { $N } bytes, se encontraron { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = el paquete ya tiene un token de sello de tiempo; use --replace para reemplazarlo

engine-e-evidence-verify-not-attached-the-pack-with = no adjuntado: el paquete con este token no se verifica ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = el paquete registra una declaración de laboratorio de { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = el archivo de firma no termina con un salto de línea

engine-evidence-verify-signer-not-pinned-the-signature = firmante no fijado: la firma prueba que el paquete está íntegro respecto de la clave { $r }, que el propio paquete nombra. Compare esa huella con una obtenida del firmante, o indique la clave.

engine-evidence-verify-range-is-not-inside-log = el intervalo { $start }..{ $end } no está dentro de un registro de { $full_bytes } bytes

engine-evidence-verify-timestamp-token-states-its-imprint = el token de sello de tiempo indica { $gen_time }; su huella { $v2 } manifest.json. Firma de la autoridad de sellado de tiempo no verificada por Kshana: compruébela con `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = el token de sello de tiempo indica { $gen_time }; su huella { $v2 } manifest.json; la firma y la cadena de la autoridad de sellado de tiempo { $v3 } frente a los anclajes dados.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` es la cadena vacía

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } está fuera del vocabulario

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = el intervalo de costo debe ser finito, no negativo, ordenado bajo≤nominal≤alto, e indicar una fuente

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction y availability deben ser fracciones en [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } debe ser finito y > 0 (se recibió { $v })

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } debe ser finito y >= 0 (se recibió { $v })

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg debe estar en [-90, 90) (se recibió { $mask_deg })

engine-e-fusion-carrier-tc-constellation-has-no-satellites = la constelación no tiene satélites

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats debe ser >= 1 cuando se define

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = satélite de salto { $sat } fuera de rango

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = línea { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = línea { $lineno }: { $v } columnas, se esperaban al menos { $min }

engine-e-fusion-kfgins-line-columns = línea { $v1 }: { $v } columnas

engine-e-fusion-kfgins-line-block-lists-are-not = línea { $lineno }: no se admiten listas en bloque

engine-e-fusion-kfgins-line-expected-key-value = línea { $lineno }: se esperaba `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = línea { $lineno }: clave con sangría sin clave superior

engine-e-fusion-kfgins-line-only-one-level-of = línea { $lineno }: solo se admite un nivel de anidamiento

engine-e-fusion-kfgins-line-unterminated-flow-list = línea { $lineno }: lista de flujo sin cerrar

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` es una lista, se esperaba un escalar

engine-e-fusion-kfgins-missing = falta `{ $k }`

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` debe ser una lista de tres elementos

engine-e-fusion-kfgins-no-imu-sample-at-or = no hay muestra IMU en starttime ni después

engine-e-fusion-kfgins-imu-time-not-increasing-at = el tiempo IMU no es creciente en { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } debe ser finito y > 0 (se recibió { $v })

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m debe ser finito y > 0 (se recibió { $sigma_range_m })

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg debe estar en [-90, 90) (se recibió { $mask_deg })

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = línea { $v1 } del csv de trayectoria: no son números: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = línea { $v1 } del csv de trayectoria: se esperaban 10 columnas, se recibieron { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = línea { $v1 } del csv de trayectoria: el tiempo no es creciente

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = el csv de trayectoria requiere al menos dos filas

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = el csv de trayectoria cubre { $rows } s pero el escenario dura { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg de site debe estar en [-90, 90] y todos los campos deben ser finitos

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" no es ni un preset GNSS ({ $e_gnss }) ni un preset LEO ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: indique el usuario como `site` o `user_ecef_m`, no ambos

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m debe ser finito y distinto del geocentro

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satélite { $id }: azimut/elevación fuera de rango

engine-e-geometry-sky-satellite-is-given-in = sky: el satélite { $id } está dado en ECEF; la solicitud requiere `site` o `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satélite { $id }: posición ECEF no finita

engine-e-geometry-sky-satellite-coincides-with-the = sky: el satélite { $id } coincide con el usuario

engine-e-geometry-sky-satellite-give-az-deg = sky: satélite { $id }: indique az_deg y el_deg, o ecef_m, y nada más

engine-e-geometry-sky-tle-is-bytes-the = sky: tle tiene { $text } bytes; el límite es { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = conjunto de elementos rechazado: { $e }

engine-geometry-sky-tle-holds-no-complete = sky: tle no contiene ningún conjunto de elementos de dos líneas completo; { $n_ignored } líneas ignoradas, la primera: { $first }

engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. y { $more } más

engine-geometry-element-sets-propagated-by-the = { $n } conjuntos de elementos propagados con el SGP4 del motor (WGS-72) hasta { $iso } y rotados a Earth-fixed con UT1 tomado como UTC y sin movimiento polar: el cielo que esos conjuntos de elementos dan en esa época, no una medición de este.

engine-geometry-element-sets-propagated-by-the-2 = { $n } conjuntos de elementos propagados con el SGP4 del motor (WGS-72) hasta la época del conjunto de elementos más reciente más time_s ({ $iso }). No se indicó época, por lo que es un cielo representativo, no el cielo de una fecha determinada.

engine-e-geometry-sky-give-systems-or-tle = sky: indique `systems` o `tle` (con un `site`), o `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system nombra los satélites de `tle`; la solicitud no tiene `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg debe estar en [-90, 90) (se recibió { $m })

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` requiere un `site` (o `user_ecef_m`) desde el cual observar

engine-e-geometry-sky-time-must-be-finite = sky: time_s debe ser finito

engine-e-geometry-sky-system-asks-for-satellites = sky: el sistema "{ $name }" pide { $asked } satélites; una solicitud admite como máximo { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: más de { $MAX_SATELLITES } satélites

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` requiere un `site` (o `user_ecef_m`) desde el cual observar

engine-e-geometry-sky-more-than-satellites-above = sky: más de { $MAX_SATELLITES } satélites sobre el horizonte

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m debe ser positivo (se recibió { $sigma })

engine-e-geometry-sky-confidence-must-be-in = sky: confidence debe estar en (0, 1) (se recibió { $confidence })

engine-e-geometry-sky-more-than-systems-in = sky: más de { $MAX_CLOCKS } sistemas a la vista, cada uno con su propio reloj; agrupe los satélites bajo menos etiquetas `system` o use clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n debe estar en 1..={ $MAX_MC_SAMPLES } (se recibió { $n })

engine-e-geometry-sky-too-few-satellites-in = sky: hay muy pocos satélites a la vista para una solución de posición; no hay nube Monte Carlo

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = cielo TLE en { $e }, no una medición

engine-e-geometry-invalid-sky-request-json = solicitud sky no válida (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = solicitud sky no válida (TOML): { $e }

engine-e-geometry-invalid-skyline-json = skyline no válida (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = skyline no válida (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = PRN GLONASS incorrecto en { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = el tipo de página { $pt } no se codifica aquí

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bits, se esperaban { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bits, se esperaban { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = los bits finales no son cero

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q no coincide

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = el tipo de página { $pt } no se decodifica aquí

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } símbolos, se esperaban { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = patrón de sincronización no encontrado

engine-e-gnss-navmsg-gal-fnav-page-type-missing = falta el tipo de página { $t }

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav del tipo de página { $t } difiere del tipo de página 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = no hay campo Galileo { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = el tipo de palabra { $wt } no se codifica aquí

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bits, se esperaban { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = el tipo de palabra { $wt } no se decodifica aquí

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = las partes de página deben ser de 120 bits

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = los indicadores par/impar no son 0 y luego 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = no es una página nominal (el tipo de página 1 es una página de alerta)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bits, se esperaban { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } símbolos, se esperaban { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = falta el tipo de palabra { $t }

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav del tipo de palabra { $t } difiere del tipo de palabra 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = el registro es del sistema { $system }, no de Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = el tipo 10 no tiene el campo { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = el tipo 11 no tiene el campo { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = el tipo 30 no tiene el campo { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = el cuerpo CNAV tiene { $body } bits, se esperaban 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } o contador TOW { $tow_count } fuera de rango

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bits, se esperaban { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = el preámbulo no es 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = el tipo de mensaje { $t } no se decodifica aquí

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = se requiere un mensaje de tipo 10 y uno de tipo 11

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } en LSB { $value2 } no cabe en { $bits } { $v4 } bits

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bits, el diseño requiere { $need }

engine-e-gnss-navmsg-no-field = no hay campo { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } con escala 2^{ $scale_pow2 } no cabe en { $bits } { $v1 } bits

engine-e-gps-lnav-no-value-for = no hay valor para { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: el modelo de referencia "gfc" requiere `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: no se puede leer gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: modelo de referencia `{ $other }` desconocido (use "egm2008" o "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: elipsoide `{ $other }` desconocido (use "wgs84" o "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations debe ser al menos 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations está limitado a 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = real '{ $t }' incorrecto

engine-e-gravity-pds-bad-integer = entero '{ $t }' incorrecto

engine-e-gravity-pds-empty-shadr-table = tabla SHADR vacía

engine-e-gravity-pds-shadr-header-has-fields-expected = el encabezado SHADR tiene { $f } campos, se esperaban al menos 6

engine-e-gravity-pds-shadr-header-negative-degree-order = encabezado SHADR: grado/orden negativo o normalización desconocida

engine-e-gravity-pds-shadr-normalization-state-only-fully = estado de normalización SHADR { $normalization } (solo se admite la normalización completa, estado 1)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = la longitud/latitud de referencia SHADR debe ser 0

engine-e-gravity-pds-non-physical-gm-must-be = GM no físico (debe ser finito y positivo)

engine-e-gravity-pds-non-physical-reference-radius-must = radio de referencia no físico (debe ser finito y positivo)

engine-e-gravity-pds-shadr-record-fields = registro SHADR { $v1 }: { $f } campos

engine-e-gravity-pds-shadr-record-bad = registro SHADR { $v1 }: (n, m) = ({ $n }, { $m }) incorrecto

engine-e-gravity-pds-shadr-record-non-finite-coefficient = registro SHADR { $v1 }: coeficiente no finito

engine-e-gravity-pds-no-shadr-coefficient-records = no hay registros de coeficientes SHADR

engine-e-gravity-pds-shadr-table-incomplete-missing = tabla SHADR incompleta: falta (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = falta earth_gravity_constant / gravity_constant

engine-e-gravity-sh-missing-radius = falta radius

engine-e-gravity-sh-non-physical-earth-gravity-constant = earth_gravity_constant no físico (debe ser finito y positivo)

engine-e-gravity-sh-non-physical-radius-must-be = radius no físico (debe ser finito y positivo)

engine-e-gravity-sh-no-gfc-coefficient-lines = no hay líneas de coeficientes gfc

engine-e-gravity-sh-read-error = error de lectura: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = línea { $lineno }: norm { $v } no se admite (solo fully_normalized)

engine-gravity-sh-line-bad = línea { $lineno }: { $what } incorrecto

engine-e-gravity-sh-line-degree-above-the-declared = línea { $lineno }: grado { $n } por encima del max_degree declarado { $dm }

engine-e-gravity-sh-line-order-above-degree = línea { $lineno }: orden { $m } por encima del grado { $n }

engine-e-gravity-sh-line-time-variable-term-is = línea { $lineno }: el término variable en el tiempo `{ $key }` no se admite (solo modelos estáticos)

engine-e-gravity-sh-missing-end-of-head = falta end_of_head

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s debe ser positivo (se recibió { $step_s })

engine-e-gse-sim-duration-must-be-positive-got = duration_s debe ser positivo (se recibió { $duration_s })

engine-e-gse-sim-scenario-produces-epochs-need-increase = el escenario produce { $n } épocas (se necesitan ≥ 2); aumente duration_s o reduzca step_s

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = el registro contiene un error de tiempo no finito

engine-e-holdover-test-unknown-mask-expected-one-of = máscara { $id } desconocida; se esperaba una de { $masks }

engine-e-holdover-test-every-budget-max-abs-te = todo max_abs_te_ns de presupuesto debe ser finito y positivo

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } queda fuera del registro ({ $t0_s } a { $t_end } s en su propio eje de tiempo)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } debe ser posterior a gnss_removed_s ({ $gnss_removed_s }) y no pasar del final del registro ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = el tramo de holdover no contiene ninguna muestra

engine-holdover-test-the-record-has-no-step = el registro no tiene tramo { $step }: GNSS se retiró en su primera muestra

engine-holdover-test-the-step-has-samples-the = el tramo { $step } tiene { $te_ns } muestras; los estimadores requieren al menos 13

engine-e-holdover-test-step-with-mask-has-no = un tramo con máscara no tiene curva

engine-e-holdover-test-cannot-read-csv-path = no se puede leer csv_path { $path }: { $e }

engine-holdover-test-recovered-after-gnss-returned = ; recuperado { $t } s después de que GNSS volviera

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }{ $rec } (MODELLED, medido frente a la máscara)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m debe ser finito y > 0 (se recibió { $sigma_pr_m })

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba debe ser >= 0 y coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = RECHAZADO: los dos tramos no tienen un tiempo de promediado común. El tramo óptico acumula durante integration_s = { $integration_s } s; el ancho de banda de ruido de lazo del tramo RF B_L = { $dll_bandwidth_hz } Hz promedia durante 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Una razón de dos sigmas tomadas con tiempos de promediado distintos no es una comparación, por lo que no se indica ninguna. Elimine la anulación rf_dll_bandwidth_hz (entonces toma por defecto 1/(2*integration_s)) o defínala en { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = RECHAZADO: un tramo no es una sigma finita positiva utilizable (óptico { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), por lo que no se forma ninguna razón.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = rf_band '{ $other }' desconocido (se esperaba s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } debe ser finito

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db debe ser finito y >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint = hybrid-optical-rf | huella óptica { $footprint_m } m, { $detected_photons } fotones -> σ de medición de distancia { $c } mm, σ de temporización { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilidad { $c4 }% ({ $n_sites } sitios) | traspaso sin salto { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjunta { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | verificados frente a referencia independiente: CRLB/χ²-PL/unión/traspaso; calculados a partir de un modelo: σ/climatología

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa debe estar en [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class debe ser >= 1

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | detector { $detector } | AUC { $auc_in } dentro / { $auc_out } fuera (brecha { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ objetivo { $target_pfa } | { $n_cases } casos | MODELLED sintético

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = detector '{ $other }' desconocido (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = imu_grade { $other } desconocido; se esperaba uno de navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = combination { $other } desconocido; se esperaba uno de rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = trn_fix_mode { $other } desconocido; se esperaba uno de none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } debe ser finito y no negativo (se recibió { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m debe nombrar al menos un umbral

engine-e-inertial-coast-crossing-thresholds-entries-must-be = las entradas de crossing_thresholds_m deben ser finitas y positivas (se recibió { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades debe nombrar al menos una clase de IMU

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s debe ser finito y no negativo (se recibió { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 debe ser finito y no negativo (se recibió { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg debe ser finito y estar dentro de (-89, 89) (se recibió { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m debe estar dentro de [-1000, 100000] (se recibió { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s debe ser positivo

engine-e-inertial-coast-drift-band-must-satisfy-lo = la banda de deriva debe satisfacer 0 < lo < hi (se recibió lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = al serializar el resultado de ins-trn-coast: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | IMU { $grade }, { $speed } m/s, combinación { $comb } | { $heads } | TRN { $mode } pico { $peak_error_m } m durante { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va derivado de la física del interferómetro de átomos fríos)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = el escenario tiene { $toml_text } bytes, por encima del límite de { $max_bytes } bytes

engine-e-inline-only-the-scenario-kind-reads-its = el tipo de escenario `{ $kind }` lee sus datos de archivos del host, por lo que esta superficie no lo ejecuta; use la línea de comandos de `kshana`

engine-e-inline-only-the-field-names-file-this = el campo `{ $k }` nombra un archivo: esta superficie solo acepta contenido en línea

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = JSON de traza: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = conjunto de datos `{ $key }` desconocido; admitidos: { $v1 }, o un conjunto de datos personalizado

engine-e-interference-map-api-dataset-is-data-but-the = el conjunto de datos `{ $key }` es de datos { $kind } pero el tipo de entrada es { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } no es una fecha YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = opción `{ $a }` desconocida

engine-e-interference-map-cli-expected-positional-argument-got = se esperaban { $positionals } argumento(s) posicional(es), se recibieron { $pos }

engine-e-interference-map-cli-cannot-read = no se puede leer { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom requiere { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } ya existe; Kshana no sobrescribe mapas. Elimínelo o elija otro directorio --out

engine-interference-map-cli-note-cell-deg-is-not = nota: --cell-deg { $cell_deg } no es el tamaño de celda fijado en el preregistro ({ $PREREGISTERED_CELL_DEG }); los mapas lo indican

engine-e-interference-map-cli-cannot-create = no se puede crear { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = se escribió { $path }: { $cells } celdas publicadas, { $n_deg } señaladas

engine-interference-map-cli-no-usable-rows-nothing-written = no hay filas utilizables: no se escribió nada

engine-e-interference-map-cli-unknown-subcommand = subcomando `{ $other }` desconocido

engine-e-interference-map-cli-the-downloaded-file-sha-256 = el SHA-256 del archivo descargado ({ $got }) no coincide con el valor fijado ({ $expected }); se descartó

engine-e-interference-map-cli-cannot-write = no se puede escribir { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl no se encontró en PATH. Instale curl, o descargue { $NATURAL_EARTH_LAND_URL } usted mismo y compruebe que su SHA-256 es { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = no se puede ejecutar curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = se escribió { $out }: polígonos de tierra de Natural Earth, SHA-256 verificado (dominio público, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = no hay archivos trace_full_* en { $path }

engine-e-interference-map-cli-cannot-read-2 = no se puede leer { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } no es una fecha YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: fecha de mapa incorrecta

engine-e-interference-map-cli-cannot-write-2 = no se puede escribir { $out }: { $e }

engine-interference-map-cli-route-length-km = longitud de ruta { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Salvedades: una celda degradada no identifica la interferencia como causa; las celdas no observadas no son evidencia de una ruta despejada; esto no es un pronóstico.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = polígonos de tierra: JSON no válido: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = falta la columna obligatoria `{ $name }`

engine-e-interference-map-cannot-read-input = no se puede leer la entrada: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` no es una fecha (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours debe ser { $MIN_DELAY_HOURS } o más: el observatorio no publica antes

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg debe ser { $MIN_CELL_DEG } o más grueso: el observatorio publica solo celdas gruesas

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } aún no es publicable: su producto se publica no antes de { $fmt_utc } ({ $delay_hours } h después de que termina el día)

engine-interference-map-observatory-kshana-observatory-ads = OBSERVATORIO KSHANA  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELDAS  DÍA UTC  NO OBSERVADO NO ES DESPEJADO  SIN CAUSA ATRIBUIDA

engine-interference-map-observatory-source-licence = FUENTE { $dataset }  LICENCIA { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADADAS  { $summary2 } NO DEGRADADAS  { $summary3 } NO OBSERVADAS (CELDAS PUBLICADAS)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Observatorio Kshana, mapa de precisión de navegación ADS-B, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = no se puede crear { $path } (Kshana no sobrescribe productos): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = la entrada no tiene ningún informe utilizable del día { $day } (días encontrados: { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } ya existe; Kshana no sobrescribe productos

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } celdas publicadas, { $p2 } degradadas, { $p3 } incidente(s)

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } filas reproducidas bajo { $variants } variantes: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = el mapa no es JSON válido: { $e }

engine-e-interference-map-route-route-invalid-json = ruta: JSON no válido: { $e }

engine-e-interference-map-route-route-line-is-not-lat = ruta: la línea { $v1 } no es `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Exportación { $v1 } de Kshana. Época: { $epoch_note }. Objetos en movimiento: GCRS (referenceFrame INERTIAL), metros, segundos después de la época. Sitios fijos: WGS 84 fijo a la Tierra (referenceFrame FIXED), metros.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Posición: GCRS, metros.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Latitud { $lat_deg } deg, longitud { $lon_deg } deg, altura { $h_m } m sobre el elipsoide WGS 84. Posición: fija a la Tierra, metros.

engine-interop-czml-radius-along-the-ground = { $description }. Radio { $radius_m } m sobre el suelo.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Sin tiempo: longitud y latitud WGS 84 en grados, ajustadas al suelo.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Posiciones fijas a la Tierra; una MultiLineString se corta en el antimeridiano y times_utc enumera entonces solo las muestras originales.

engine-interop-geojson-kshana-export-epoch = Exportación { $v1 } de Kshana. Época: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = GeoJSON no válido: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString no tiene matriz coordinates

engine-e-interop-geojson-an-rfc-7946-linestring-needs = una LineString de RFC 7946 requiere dos o más posiciones

engine-interop-geojson-position-is-not-an-array = la posición { $i } no es una matriz de dos o tres números

engine-interop-geojson-position-longitude-is-not-number = posición { $i }: la longitud no es un número

engine-interop-geojson-position-latitude-is-not-number = posición { $i }: la latitud no es un número

engine-e-interop-geojson-position-longitude-is-outside-180 = posición { $i }: la longitud { $lon } está fuera de [-180, 180] (GeoJSON coloca primero la longitud)

engine-e-interop-geojson-position-latitude-is-outside-90 = posición { $i }: la latitud { $lat } está fuera de [-90, 90] (GeoJSON coloca primero la longitud)

engine-e-interop-geojson-track-needs-two-or-more = una trayectoria requiere dos o más puntos de paso

engine-e-interop-geojson-the-route-spans-more-than = la ruta abarca más de 180 grados de longitud; los tipos de trayectoria avanzan en grados simples y no pueden cruzar el antimeridiano

engine-e-interop-geojson-position-is-deg-from-an = la posición { $worst } está a { $worst2 } deg de una trayectoria recta de espaciado uniforme (tolerancia { $tol_deg } deg); los tipos de trayectoria recorren start + i*step, por lo que deben darse posiciones de espaciado uniforme sobre una línea, o solo los dos extremos

engine-e-interop-geojson-route-applies-to-the-kinds = una ruta se aplica a los tipos que recorren una trayectoria de puntos de paso (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` no admite entrada de trayectoria

engine-e-interop-geojson-scenario-toml-is-not-table = el TOML del escenario no es una tabla

engine-e-interop-geojson-cannot-serialise-scenario = no se puede serializar el escenario: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = formato de exportación '{ $other }' desconocido; se esperaba uno de czml, kml, geojson, stk, sigmf, all o list

engine-e-interop-member = miembro { $label }: { $e }

engine-interop-the-scenario-could-not-be = no se pudo exportar el escenario: { $m }

engine-e-interop-invalid-spectrum-scenario = escenario de espectro no válido: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than = { $n } muestras de tiempo son más de las que escribe una exportación ({ $MAX_SAMPLES })

engine-e-interop-scene-objects-samples-is-more-than = { $items } objetos x { $times } muestras son más de las que escribe una exportación ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = escenario { $kind } no válido: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = jammer { $jammer_type }, potencia de transmisión de { $power_dbw } dBW, ganancia de antena de { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, según las ecuaciones de enlace del tipo jamming con el jammer en el horizonte del receptor y pérdida en espacio libre

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (la etapa [pass] de la cadena)

engine-interop-scene-circular-orbit-km-altitude-deg = órbita circular, { $altitude_km } km de altitud, { $inclination_deg } deg de inclinación (elementos medios SGP4 al inicio de la ventana, tal como los propaga el tipo passes)

engine-interop-scene-ground-station-deg-elevation-mask = estación terrestre, máscara de elevación de { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; los estados GCRS y fijos a la Tierra son la salida propia del tipo ephemeris (UT1 y movimiento polar según los define el escenario)

engine-interop-scene-static-scene-the-kind-flies = escena estática: el tipo { $kind } recorre una trayectoria sin tiempo de puntos de paso

engine-interop-scene-true-track-flown-gps-denied = trayectoria verdadera recorrida sin GPS: { $track } puntos de paso desde start_lat_deg/start_lon_deg en pasos de step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` no tiene escena

engine-e-interop-scene-missing-numeric = falta el valor numérico `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = falta el entero `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } está fuera de 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } a { $altitude_km } km, { $inclination_deg } deg de inclinación (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = el escenario no indica `epoch`; t = 0 es { $epoch }, la época más temprana que contienen los datos propios de los satélites (época TLE, de efemérides de difusión o SP3). Cada satélite se propaga desde su propia época, y estas abarcan { $spread_h } h: las marcas de tiempo siguen la premisa del motor de que todos los satélites comienzan en t = 0, mientras que cada posición se rota a los marcos GCRS y fijo a la Tierra en el instante propio de ese satélite. Las exportaciones SP3 y OEM rotulan en cambio t = 0 como 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = el escenario no indica `epoch`; t = 0 es { $epoch }, la época que contienen los datos propios de los satélites (época TLE, de efemérides de difusión o SP3). Las exportaciones SP3 y OEM rotulan en cambio t = 0 como 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objetos x { $times_s } muestras son más de las que escribe una exportación ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = usuario { $user_environment }, en movimiento (velocidad y rumbo constantes del tipo)

engine-interop-scene-user-receiver = usuario { $user_environment } (receptor)

engine-interop-scene-user-orbit-km-altitude-deg = órbita de usuario, { $altitude_km } km de altitud, { $inclination_deg } deg de inclinación (kepleriana{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = no hay objeto en movimiento { $index }

engine-interop-stk-kshana-export-object = # Exportación { $v1 } de Kshana: { $scene }, objeto { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = jammer { $jammer_type }, potencia de transmisión de { $power_dbw } dBW, ganancia de antena de { $gain_dbi } dBi (un parámetro del presupuesto de enlace del escenario, no una señal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` no tiene trayectoria de vehículo que exportar; la exportación para banco de pruebas abarca los tipos gnss-ins, jamming y gnss-sim

engine-e-interop-testbench-empty-motion-csv = CSV de movimiento vacío

engine-e-interop-testbench-motion-csv-header-is-not = el encabezado del CSV de movimiento no son las columnas esperadas: { $head }

engine-e-interop-testbench-row-fields-expected = fila { $v1 }: { $f } campos, se esperaban { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = fila { $v1 }: la columna { $motion_columns } no es un número

engine-e-interop-testbench-line-no = línea { $v1 }: falta `$`

engine-e-interop-testbench-line-no-checksum = línea { $v1 }: falta la suma de comprobación

engine-e-interop-testbench-line-bad-checksum-field = línea { $v1 }: campo de suma de comprobación no válido

engine-e-interop-testbench-line-checksum-mismatch = línea { $v1 }: la suma de comprobación no coincide

engine-e-interop-testbench-line-short-gga = línea { $v1 }: GGA corta

engine-interop-testbench-line-bad-latitude = línea { $v1 }: latitud no válida

engine-interop-testbench-line-bad-longitude = línea { $v1 }: longitud no válida

engine-e-interop-testbench-line-bad-altitude = línea { $v1 }: altitud no válida

engine-e-interop-testbench-line-bad-separation = línea { $v1 }: separación no válida

engine-e-interop-testbench-line-short-rmc = línea { $v1 }: RMC corta

engine-e-interop-testbench-line-rmc-with-no-preceding = línea { $v1 }: RMC sin GGA precedente

engine-e-interop-testbench-line-gga-and-rmc-times = línea { $v1 }: los tiempos de GGA y RMC difieren

engine-e-interop-testbench-line-bad-speed = línea { $v1 }: velocidad no válida

engine-e-interop-testbench-line-bad-course = línea { $v1 }: rumbo no válido

engine-e-interop-testbench-line-bad-time-or-date = línea { $v1 }: hora o fecha no válida

engine-e-interop-testbench-gga-with-no-following-rmc = una GGA sin RMC posterior

engine-e-interop-testbench-waypoint-file-needs-at-least = un archivo de puntos de paso requiere al menos dos muestras

engine-e-interop-testbench-the-sample-step-is-not = el paso de muestreo { $step } s no es un número entero de milisegundos

engine-e-interop-testbench-the-samples-are-not-equally = las muestras no están espaciadas por igual: el intervalo { $v1 } es { $dt } s, el primero es { $step } s

engine-e-interop-testbench-empty-waypoint-file = archivo de puntos de paso vacío

engine-e-interop-testbench-waypoint-not-three-numbers = punto de paso { $v1 }: no son tres números

engine-e-interop-testbench-waypoint-fields-expected = punto de paso { $v1 }: { $f } campos, se esperaban 3

engine-e-interop-testbench-events-csv-header-is-not = el encabezado del CSV de eventos no es label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = fila de evento { $v1 }: se esperaban 5 campos

engine-e-interop-testbench-event-row-unknown-kind = fila de evento { $v1 }: tipo { $f } desconocido

engine-e-interop-testbench-event-row-bad-onset = fila de evento { $v1 }: inicio no válido

engine-e-interop-testbench-event-row-bad-end = fila de evento { $v1 }: fin no válido

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-interop-testbench-no-waypoints-txt-written = no se escribió .waypoints.txt: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = no es una hora UTC `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = falta { $what }

engine-e-ionex-bad-number-in = { $what }: número no válido en { $col }

engine-e-ionex-two-digit-year = { $what }: año de dos dígitos { $year }

engine-e-ionex-no-end-of-header = no hay END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = los mapas IONEX dependientes de la altura (3-D) no se admiten

engine-e-ionex-zero-grid-step = paso de cuadrícula nulo

engine-e-ionex-grid-needs-at-least-nodes = la cuadrícula requiere al menos 2 x 2 nodos

engine-e-ionex-map-no = mapa { $index }: no hay { $end_label }

engine-e-ionex-map-band-latitude-header-grid = mapa { $index }: la banda { $band } tiene latitud { $band_lat }, la cuadrícula del encabezado { $want }

engine-e-ionex-map-band-longitudes-differ = mapa { $index }: las longitudes de la banda { $band } difieren

engine-e-ionex-map-band-truncated = mapa { $index }: banda { $band } truncada

engine-e-ionex-map-bands-header-grid-has = mapa { $index }: { $band } bandas, la cuadrícula del encabezado tiene { $n_lat }

engine-e-ionex-map-no-epoch-of-current = mapa { $index }: no hay EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } mapas TEC, encabezado # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = las épocas de los mapas TEC no son crecientes

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz no contiene un número entero de muestras por período de { $code } ({ $spc } muestras)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods y noncoherent deben ser positivos

engine-e-iq-acq-stream-ended-after-of-samples = el flujo terminó tras { $got } de { $needed } muestras

engine-e-iq-acq-cfar-reference-cells-must-be = las celdas de referencia CFAR deben ser pares y al menos 2 (se recibió { $n })

engine-e-iq-acq-cfar-stride-must-be-at = el avance CFAR debe ser de al menos 1 retardo

engine-e-iq-acq-cfar-per-cell-pfa-must = la Pfa por celda de CFAR debe estar en (0, 1) (se recibió { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = la ventana CFAR alcanza { $reach } retardos a cada lado, demasiado ancha para un período de { $samples_per_period } retardos

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = formato de superficie { $s } desconocido: se esperaba csv, json o bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = la superficie contendría { $spc_cells } celdas (límite { $MAX_SURFACE_CELLS }): amplíe el paso Doppler o reduzca el rango Doppler

engine-e-iq-acq-surface-surface-header = encabezado de superficie: { $e }

engine-e-iq-acq-surface-surface-schema-expected = esquema de superficie { $schema }; se esperaba { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = cuerpo de superficie: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = grabación '{ $id }': format y sample_rate_hz deben indicarse juntos

engine-e-iq-campaign-conditions-test-conditions-json = condiciones de ensayo (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = condiciones de ensayo (TOML): { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf requiere una grabación SigMF (se recibió { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = metadatos SigMF: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = metadatos SigMF: falta global core:sample_rate

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: falta core:sample_start

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: no hay core:sample_count ni puntos de potencia que determinen el fin del evento

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema debe ser "{ $SCHEMA }" (se recibió "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id no debe estar vacío

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s debe ser finito y >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 debe tener 64 dígitos hexadecimales

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind debe ser "iq" o "receiver-log" (se recibió "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = se requiere al menos un grupo [[expected]]

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids no debe estar vacío

engine-e-iq-campaign-conditions-lists-value-give-one-per = { $at }: { $key } enumera { $n } valor(es); indique uno por id ({ $ids })

engine-e-iq-campaign-conditions-duplicate-id = { $at }: id duplicado

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s debe ser posterior a onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects debe ser "all" o una lista de ids

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: el id { $bad } de affects no está en [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q debe ser positivo

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points no debe estar vacío

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points debe estar en orden temporal

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points debe ser finito

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" requiere reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = los eventos '{ $id }' y '{ $id2 }' se solapan en un satélite compartido

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s debe ser >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s debe ser positivo

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = grabación '{ $id }': el SHA-256 { $sha } no coincide con el indicado { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: la grabación contiene { $buf } muestras, se necesitan { $n } para adquirir

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s debe ser positivo

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db debe ser positivo

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s debe ser >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz debe ser positivo

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs debe ser al menos 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = campaña (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = campaña (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions debe enumerar al menos un archivo o patrón glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds debe ser >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = los nombres de frontend deben ser no vacíos y únicos ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' no coincide con ningún archivo

engine-e-iq-campaign-spec-recording-id-appears-in-both = el id de grabación '{ $w }' aparece en { $w2 } y en { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names requiere inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: no hay diseño '{ $n }' en { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = línea de verdad { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = perfil de C/N0: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = perfil de C/N0: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segmento { $i }: los valores de step deben ser finitos

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segmento { $i }: ramp requiere end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segmento { $i }: points requiere t_s y db de igual longitud y no vacíos

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segmento { $i }: t_s debe ser estrictamente creciente

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segmento { $i }: points debe ser finito

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segmento { $i }: fade s4 debe estar en (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segmento { $i }: fade tau_s debe ser positivo

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: la grabación contiene { $samples } muestras, se necesitan { $need } para esta búsqueda

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: indique el formato con --surface-format csv|json|bin, o termine la ruta en .csv, .json o .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = adquisición: { $fs_hz } Hz, { $coherent_periods } período(s) coherente(s) x { $noncoherent } no coherente(s), pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = informe reconstruido: { $cells_present } de { $cells_total } celda(s), { $rows } fila(s), { $rows_failed } sin alcanzar un umbral; resumen { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    campaña { $name }: { $cells_total } celda(s); { $cells_skipped } ya completadas, { $cells_run } ejecutadas ahora, { $cells_failed } fallidas, { $cells_pending } pendientes
    salida: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    primer fallo ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: { $events } evento(s), { $tc } satélite(s) esperado(s); hash de condiciones { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono oblicuo { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono vertical { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scint S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = multitrayecto { $h }m suelo { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground debe ser dry, wet o sea (se recibió { $other })

engine-e-iq-cli-channel-give-at-most-one-of = indique como máximo uno de --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass requiere lo,hi (se recibió { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass requiere lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } con transición { $transition } Hz no cabe por debajo de fs/2 ({ $v1 } Hz); estreche la banda o la transición

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits debe ser 1..=16 (se recibió { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = { $total } muestras filtradas ({ $fs_hz } Hz) en { $out } ({ $format }); archivo auxiliar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = no se puede leer { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = escenario labfit no válido: { $e }

engine-iq-cli-labfit-fitted-run-wrote = ajustada(s) { $runs } ejecución(es); se escribió { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = ajustada(s) { $fit_units } unidad(es) de la campaña; se escribió { $written }

engine-iq-cli-labfit-cannot-write = no se puede escribir { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } requiere un valor

engine-e-iq-cli-cannot-parse = { $k }: no se puede interpretar { $v }

engine-iq-cli-iq-takes-positional-argument-got = iq { $cmd } admite { $n } argumento(s) posicional(es), se recibieron { $pos }

engine-e-iq-cli-cannot-parse-2 = { $k }: no se puede interpretar { $p }

engine-iq-cli-unknown-iq-processing-command-expected = comando de procesamiento iq { $other } desconocido; se esperaba scene, acquire, track, sweep, labfit, frontend, monitor, campaign o conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } fuera de rango para GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = no se encontraron efemérides GPS sanas para los PRN solicitados

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos requiere lat,lon,alt (se recibió { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; perfil de C/N0 ({ $segments } segmento(s))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format debe ser csv o jsonl (se recibió { $other })

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ; escala entera: 1 LSB = { $sc } unidades normalizadas al ruido (RMS esperado { $v1 } LSB por componente), { $clipped } elemento(s) recortado(s)

engine-iq-cli-scene-written-by-kshana-iq-scene = escrito por kshana iq scene: una escena SIMULADA, no una grabación{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = metadatos ION SDR { $path }

engine-iq-cli-scene-sigmf-data-meta = datos SigMF { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = escrito por kshana iq scene{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = se escribieron { $samples } muestras ({ $format }, { $fs_hz } Hz) en { $data_path }; { $truth_records } registros de verdad en { $truth_path }; { $meta_note }; canal: { $chan_desc }{ $scale_note }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } no puede combinarse con --design: sweep ejecuta cada diseño del archivo

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = barrido de diseños de lazo: { $rows } resultado(s) (diseño, PRN){ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: la grabación contiene { $samples } muestras, se necesitan { $need } para adquirir

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: no adquirido (estadístico { $statistic } < umbral { $threshold }); aumente --doppler-max, --acq-coherent o --acq-noncoherent, o revise la grabación

engine-iq-cli-track-designs-and-differ-in-integration = los diseños { $first } y { $d } difieren en integration.extra_taps_chips; los diseños de una misma ejecución deben coincidir para que todos los registros de salida tengan las mismas columnas

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: indique el formato con --epochs-format csv|jsonl|bin, o termine la ruta en .csv, .jsonl o .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz son { $r } muestras por chip de { $c }: un muestreo conmensurable convierte el discriminador de código en una escalera (con 2 muestras/chip el DLL oscila, unos 0.09 chip RMS de error de código a 45 dB-Hz); la fluctuación y el sesgo del lazo de código obtenidos de esta grabación no son representativos. Use una tasa que no sea múltiplo de la mitad de la tasa de chip para evaluar los lazos de código.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = el proceso de trabajo terminó antes de procesar esta entrada

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = opción { $s } desconocida

engine-e-iq-io-cli-format-needs-rate = --format requiere --rate

engine-iq-io-cli-iq-takes-path-argument-got = iq { $cmd } admite { $n } argumento(s) de ruta, se recibieron { $pos }

engine-iq-io-cli-unknown-iq-command = comando iq { $other } desconocido

engine-iq-io-cli-wrote-samples-hz-to-saturated = se escribieron { $n } muestras ({ $to }, { $fs_hz } Hz) en { $files }; { $w } elemento(s) saturado(s){ $v4 }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow lee solo grabaciones de un único canal

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow lee una grabación con una captura, esta tiene { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: no hay core:sample_rate positivo

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: la captura no comienza en un límite de byte

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = formato de muestra { $name } desconocido: se esperaba, por ejemplo, ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, opcionalmente terminado en _qi para complejo

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sample_rate_hz { $sample_rate_hz } del archivo auxiliar no es positivo

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: las grabaciones .sdrx contienen un flujo; el canal { $channel } no existe

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: archivo sin procesar sin archivo auxiliar; indique su formato o escriba { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = no se puede serializar la fila: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = diseño de filtro { $design } no válido: passband_frac en (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz debe estar estrictamente entre 0 y la mitad de la tasa de muestreo ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }datos sdrx: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization } bits { $enc } { $fmt } ({ $packed_bits } bits/muestra)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = core:datatype de SigMF { $datatype } no admitido: se admiten ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be y los reales ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } no es un core:datatype de SigMF

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = metadatos SigMF no válidos: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } no tiene core:datatype de SigMF; escríbalo como raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } no coincide con el { $c0 } de la primera grabación

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: no hay core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } no es positivo

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } a { $rate } Hz no coincide con { $f0 } a { $r0 } Hz de la primera grabación

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out = { $name }: la captura en la muestra { $sample_start } está fuera de orden o más allá de las { $n_file } muestras de los datos

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: la primera captura no comienza en un límite de byte

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = se solicitó el canal { $channel }; la grabación tiene { $channels } (los canales se cuentan desde 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = colección SigMF no válida: { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: el SHA-512 { $got } no coincide con el { $h } de la colección

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = el flujo { $select } de { $channels } flujos intercalados no existe (los flujos se cuentan desde 0)

engine-e-iq-io-stream-sample-of-does-not-start = la muestra { $k } de { $format } no comienza en un límite de byte

engine-e-iq-io-stream-time-window-start-duration-both = ventana de tiempo, inicio { $start_s } s, duración { $duration_s } s: ambos deben ser no negativos

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = Q declarado más dañino (cw): no hay valor de tabla para el tipo `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: la campaña no está completa

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } no coincide con las celdas ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = grabación `{ $id }`: el hash de condiciones de ensayo { $h } no coincide con el registrado { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = señal `{ $signal }`: tasa de chip desconocida

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = ninguna ejecución es utilizable para el ajuste de enganche: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = datos insuficientes: no ajustado ({ $m } grabaciones; se necesitan al menos { $min_rec })

engine-iq-labfit-iqfit-uncensored-span-db-is-under = el rango J/S no censurado de { $span_db } dB es inferior a { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff y delta no son identificables por separado (|corr| { $full } >= { $v2 }): el modelo depende solo de delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed = no ajustado: { $n_reacq } readquisiciones observadas (se necesitan al menos 3)

engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = modo `{ $m }` desconocido (solo `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage debe ser [lower, upper] dentro de [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds debe ser [lower, upper] con 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db debe ser [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = la campaña no tiene ningún evento con un perfil de potencia declarado que ajustar

## src/iq/labfit/iqreport.rs

# legal: native review
engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Ajuste de laboratorio a partir de la campaña IQ: { $r }

    Esquema `{ $schema }`, motor { $engine_version }. Etiqueta: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = DIGEST de la campaña `{ $campaign_digest }`; SHA-256 de `campaign.json` `{ $campaign_json_sha256 }`; SHA-256 del escenario `{ $scenario_sha256 }`; { $cells } celdas; { $bootstrap } réplicas bootstrap (semilla { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Unidad { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Estado: { $status }. { $recordings } grabaciones, { $satellites } satélites, { $events } eventos; { $bins_used } intervalos ajustados, { $bins_censored } censurados.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = Modelo de C/N0 ({ $q_mode }): `delta_eff` = { $ci } dB (el desfase identificable, referido a Q = 1); `Q_eff` = { $q }; `delta` con ese Q = { $ci2 } dB; corr(Q, delta) { $om }; RMS residual { $residual_rms_db } dB sobre un rango J/S de { $span_db } dB. Q_eff no es identificable a partir de datos de C/N0 sin una medición de potencia independiente.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q mantenido en su valor declarado: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = J/S umbral, directo: mediana { $om } dB sobre { $n } pérdidas (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Reserva (dejando una grabación fuera), interpolación: { $bins } intervalos, RMS de C/N0 { $om } dB, cobertura PI90 { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = ; { $model }: { $n } eventos, RMS del tiempo de pérdida { $om } s, cobertura PI90 { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    SHA-256 de la tabla de validación `{ $table_sha256 }` (registrada { $registered }):

    | umbral | límite | valor | veredicto |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = registro de la ejecución `{ $label }`

engine-e-iq-labfit-run = ejecución `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = el [input] del escenario no nombra ninguna campaña

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign y [[runs]] son excluyentes: indique uno

engine-e-iq-labfit-iq-labfit-scenario = escenario iq-labfit: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = el registro no contiene C/N0 por satélite{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = no hay época antes del inicio en { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = no hay época en o después del inicio en { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Ajuste de laboratorio: { $r }

    Etiqueta: **{ $label }**. SHA-256 de la configuración `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db = { "\u000A" }{ $n_samples } muestras de C/N0, RMS residual { $om } dB.{ $r }{ "\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Modelo: { $model } ({ $label })

    | parámetro | valor | límites | en el límite | sd bootstrap (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }RMS del tiempo de evento { $om } s sobre { $n_events } eventos; pérdidas omitidas { $loss_missed } / adicionales { $loss_extra }, readquisiciones omitidas { $reacq_missed } / adicionales { $reacq_extra }.

    | ejecución | caída dB-Hz | reenganche dB-Hz | eventos | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Reserva ({ $scheme }, { $folds } particiones): total { $om } s, interpolación { $om2 } s, extrapolación { $om3 } s.

    | ejecución reservada | clase | distancia | ejecución de entrenamiento más cercana | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } está reservado para uso futuro (solo FID 0 está definido)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } está fuera de 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } símbolo(s) SB1 no coinciden con el campo decodificado

engine-iq-lunanet-afs-frames-at-and-are-symbols = las tramas en { $w } y { $w2 } están separadas por { $gap } símbolos, no por { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } sigue a TOI { $w2 }, se esperaba { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = carácter { $c } inesperado en un flujo de símbolos (solo 0, 1 y espacio en blanco)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: los primeros 24 chips difieren

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: los últimos 24 chips difieren

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (el documento imprime A14850 tanto para PRN 147 como para PRN 151; el generador reproduce el de PRN 151, por lo que la entrada de PRN 147 es muy probablemente una errata del documento)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = codificado 0x{ $word }, decodificado FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = configuración del monitor: { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = posición estática no finita

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = trayectoria de velocidad constante no finita

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = la trayectoria de puntos de paso no tiene puntos de paso

engine-e-iq-scene-geometry-waypoint-not-finite = punto de paso no finito

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = los tiempos de los puntos de paso deben ser estrictamente crecientes

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } no es un PRN GPS C/A

engine-e-iq-scene-ephemeris-system-is-not-gps = el sistema de efemérides { $system } no es GPS

engine-e-iq-scene-satellite = satélite { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = es un componente piloto (sin datos) y no lleva datos de navegación

engine-e-iq-scene-nav-carries-data-the-scene-does = lleva datos que la escena no modela; genérelo sin datos

engine-e-iq-scene-nav-does-not-carry-gps-lnav = no lleva GPS LNAV (solo GPS L1 C/A lo lleva); use datos con semilla

engine-e-iq-scene-nav-not-an-lnav-source = no es una fuente LNAV

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = una escena requiere al menos un satélite (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler enumera { $dopplers } valor(es); indique uno por --prn ({ $ids }) o un único valor

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = la fila de verdad tiene { $f } campos, se esperaban 10

engine-e-iq-scene-truth-truth-field = campo de verdad { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = sat_id de verdad: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz debe ser un número positivo

engine-e-iq-short-duration-must-be-in = duration_s debe estar en (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids debe contener de 1 a { $MAX_SATELLITES } satélites

engine-e-iq-short-dopplers-must-be-finite = dopplers debe ser finito

engine-e-iq-short-samples-requested-short-run-holds = se solicitaron { $n } muestras; una ejecución corta contiene como máximo { $MAX_SAMPLES }

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C datos PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C piloto PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } fuera de rango

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = el canal de frecuencia { $id } de GLONASS L1OF está fuera de -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = señal { $other } desconocida; se esperaba una de: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = línea { $v1 }: falta ';'

engine-e-iq-signals-galileo-line-no-code-number-in = línea { $v1 }: no hay número de código en { $label }

engine-e-iq-signals-galileo-code-appears-twice = el código { $number } aparece dos veces

engine-e-iq-signals-galileo-codes-the-icd-defines = { $path }: { $n } códigos, el ICD define { $CODES_PER_COMPONENT }

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

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primario { $primary_prn } S{ $secondary } terciario { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primario { $primary_prn } S{ $secondary } (terciario omitido)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = carácter no hexadecimal { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } símbolos hexadecimales no pueden contener exactamente { $len } chips

engine-iq-signals-primary-only = { $name } (solo primario)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = el seguimiento BOC requiere un espaciado early-late en (0, { $max }) chips para que E y L permanezcan en el pico principal (se recibió { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = el umbral de bump-jump debe ser al menos 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = la frecuencia de muestreo debe ser positiva

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods debe ser positivo

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows debe ser positivo

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } debe dividir la longitud de bit { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = se admiten como máximo { $MAX_EXTRA_TAPS } tomas adicionales (se recibió { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = los desfases de las tomas adicionales deben ser finitos y estar dentro de ±{ $MAX_TAP_OFFSET_CHIPS } chips (se recibió { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = una ventana de C/N0 requiere al menos 2 prompts

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: se esperaba atan2, costas-atan o costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: se esperaba cross-product, atan2 o atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: se esperaba pull-in o always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: se esperaba eml-power, dot-product o eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: se esperaba pll, fll o fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } no se aplica a carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: se esperaba un número >= 0 (0 desactiva el límite)

engine-e-iq-track-design-must-be-positive-number-got = { $k } debe ser un número positivo (se recibió { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods debe ser al menos 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips debe estar en (0, 2] (se recibió { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips admite como máximo { $MAX_EXTRA_TAPS } desfases (se recibió { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = los desfases de integration.extra_taps_chips deben ser finitos y estar dentro de ±{ $MAX_TAP_OFFSET_CHIPS } chips (se recibió { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) debe ser menor que carrier.fll_off_pli ({ $off }), ambos en (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s debe ser cero o positivo (se recibió { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s debe ser positivo (se recibió { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order debe ser 1, 2 o 3 (se recibió { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order debe ser 1 o 2 (se recibió { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order debe ser 1 o 2 (se recibió { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold debe estar en [-1, 1] (se recibió { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows debe ser al menos 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods debe ser al menos 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) no debe ser menor que lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db debe ser finito

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes debe ser al menos 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods debe ser al menos 1 (o "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent debe ser al menos 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa debe estar en (0, 1) (se recibió { $pfa })

engine-e-iq-track-design-design-overrides = reemplazos del diseño: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = los reemplazos del diseño no pueden definir name ni extends

engine-e-iq-track-design-loop-design-file = archivo de diseño de lazo: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = archivo de diseño de lazo: el esquema { $other } no es compatible; se esperaba { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = archivo de diseño de lazo: falta schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = archivo de diseño de lazo: no hay tablas [[design]]

engine-e-iq-track-design-loop-design-file-design-number = archivo de diseño de lazo: la tabla [[design]] número { $v1 } no tiene name

engine-e-iq-track-design-loop-design-file-design-name = archivo de diseño de lazo: el nombre de diseño { $name } está reservado o vacío

engine-e-iq-track-design-loop-design-file-design-is = archivo de diseño de lazo: el diseño { $name } está definido dos veces

engine-e-iq-track-design-no-design-named-the-file = no hay ningún diseño llamado { $n }; el archivo contiene { $value }

engine-e-iq-track-design-loop-design-file-design-extends = archivo de diseño de lazo: el diseño { $name } se extiende a sí mismo (un ciclo)

engine-e-iq-track-design-loop-design-file-design-extends-2 = archivo de diseño de lazo: el diseño { $name } extiende un diseño desconocido { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = el lazo de fase requiere orden 1..=3 y Bn > 0 (se recibió { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = el lazo de frecuencia requiere Bn > 0 (se recibió { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = el orden del lazo de frecuencia debe ser 1 o 2 (se recibió { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = un filtro de lazo requiere una vía de fase, una vía de frecuencia, o ambas

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = el espaciado early-late debe estar en (0, 2] chips (se recibió { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = el orden del DLL debe ser 1 o 2 (se recibió { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = la tasa de chips y la frecuencia de portadora deben ser positivas

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = una época lleva { $extra } tomas adicionales pero la salida se configuró para { $n }: todos los canales de una ejecución deben usar el mismo extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = un registro tiene { $b } bytes; se esperaban { $want }

engine-e-iq-track-sink-unknown-lock-state-code = código de estado de enganche { $b } desconocido

engine-e-iq-track-sink-epoch-file-header = encabezado del archivo de épocas: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = esquema del archivo de épocas { $schema }; se esperaba { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = los registros del archivo de épocas tienen { $record_bytes } bytes; este lector espera { $want } ({ $BINARY_RECORD_BYTES } más { $BINARY_TAP_BYTES } por cada toma adicional)

engine-e-iq-track-sink-epoch-file-ends-inside-record = el archivo de épocas termina dentro de un registro ({ $got } de { $size } bytes)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = formato de épocas { $o }: se esperaba csv, jsonl o bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` no es un número

engine-e-jammertest-cli-is-not-utf-text = { $path } no es texto UTF-8

engine-e-jammertest-cli-needs-catalog = requiere --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = requiere al menos un --plan

engine-e-jammertest-cli-is-not-utf = { $cat } no es UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } no es UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` no es uno de ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` no es UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = requiere --log-start o --log con --format

engine-e-jammertest-cli-log-needs-format = --log requiere --format

engine-e-jammertest-cli-the-log-does-not-state = el registro no indica su hora de inicio: use --log-start

engine-e-jammertest-cli-the-log-states-its-start = el registro indica su inicio como `{ $label }`: use --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } no es UTF-8

engine-e-jammertest-cli-cannot-write = no se puede escribir { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } eventos { $SCHEDULED_TRUTH } escritos en { $o } ({ $skipped_non_rf } franjas no RF omitidas, { $outside_log } fuera del registro, { $unknown_ids } identificadores que no figuran en el catálogo)

engine-jammertest-cli-note-ids-not-in-the = nota: identificadores que no figuran en el catálogo: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = nota: son las franjas programadas del plan, no horas de emisión registradas.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  nombre de la prueba

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } pruebas, { $evaluable } evaluables: { $detected } detectadas dentro de la tolerancia, { $late } tardías, { $missed } no detectadas; latencia mediana { $fmt_opt }, tiempo mediano de recuperación { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = falsas alarmas fuera de cualquier franja: { $false_alarm_runs } ejecuciones, { $false_alarm_epochs } de { $clean_epochs } épocas limpias

engine-e-jammertest-cli-needs-session-path = requiere una ruta de sesión

engine-e-jammertest-cli-needs-catalog-and-plan-or = requiere --catalog y --plan, o --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = paquete de evidencias escrito en { $out }; huella del firmante { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = no hay ninguna carpeta con un scenario.json y un .ubx bajo { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = escenario: { $e }

engine-e-jammertest-dataset-read = lectura: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json no tiene fecha

engine-e-jammertest-dataset-scenario-json-date-is-not = la fecha `{ $date }` de scenario.json no es una fecha

engine-e-jammertest-dataset-no-readable-epoch-in-mon = no hay ninguna época legible en mon_rf.csv ni en rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = no hay ninguna carpeta con un scenario.json bajo { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } recuperadas ({ $recovered } de { $alarmed }), mediana { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = el registro indica su inicio como `{ $l }`, que no es UTC ISO-8601: indique el inicio explícitamente

engine-e-jammertest-the-log-does-not-state = el registro no indica su hora de inicio: indíquela explícitamente

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = el catálogo no es JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = el catálogo no tiene matriz `test_types`

engine-e-jammertest-plan-test-type-has-no-type = un tipo de prueba no tiene `type_id`

engine-e-jammertest-plan-test-group-has-no-group = un grupo de pruebas no tiene `group_id`

engine-e-jammertest-plan-test-has-no-test-id = una prueba no tiene `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = el catálogo no enumera ninguna prueba

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` no es una hora de plan como 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = el plan no es JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = el plan no tiene matriz `locations`

engine-e-jammertest-plan-test-end-time-is-not = prueba { $id }: end_time no es posterior a start_time

engine-e-jammertest-plan-the-plan-has-no-test = el plan no tiene el área de prueba { $l }; tiene { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = el plan tiene varias áreas de prueba { $areas }; indique en cuál se registró el registro

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json no es JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = no hay matriz `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024 prueba { $id } ventana { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = el attack_log no contiene ninguna ventana de inicio/fin

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } eventos programados pero la ejecución puntuó { $events2 }: pase los eventos propios de la ejecución

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s debe ser positivo y guard_s no negativo

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m debe enumerar al menos un elemento

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m debe ser finito

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: se esperaba "null-steering" o "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz debe ser positivo (se recibió { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: la sección requiere un [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) debe ser finito y no inferior a tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s debe ser finito y no negativo (se recibió { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits debe estar entre 1 y 16 (se recibió { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz debe ser positivo (se recibió { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side debe ser al menos 2 (se recibió { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } debe ser finito (se recibió { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } debe ser positivo (se recibió { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: el punto { $points } del perfil ({ $lat }, { $lon }) está fuera de la tesela DEM

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: el punto { $points } del perfil ({ $lat }, { $lon }) está sobre un vacío del DEM

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = fecha del calendario UTC fuera de rango: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = no existe tal fecha del calendario: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = segundo UTC { $second } fuera de rango en { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = un sitio de lanzamiento en el polo no tiene acimut definido

engine-e-launch-inclination-unreachable-from-latitude-without = inclinación { $inclination_rad }° inalcanzable desde la latitud { $lat_rad }° sin un dogleg (se requiere |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = la velocidad de un sitio en el polo verdadero requiere `epoch` y `eop_finals2000a` (un cuerpo IERS finals2000A real)

engine-e-launch-site-lon-deg-must-be = site_lon_deg debe estar en [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a no contenía ninguna fila IERS finals2000A legible

engine-e-launch-epoch-mjd-is-outside-the = la época { $epoch } (MJD { $mjd_utc }) está fuera de las filas EOP suministradas (MJD { $mjd } a { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg debe estar en [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg debe estar en [0, 180]

engine-launch-launch-window-lat-az-asc = ventana de lanzamiento: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° asc, v_circ { $v_orbit } m/s, bonificación de rotación terrestre de +{ $site_rotation_speed } m/s, { $opportunities } oportunidades/día (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = cada velocidad de distancia requiere un sigma positivo y finito

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = { $n_meas } mediciones no pueden resolver { $n } incógnitas Doppler

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = la geometría Doppler es singular

engine-e-leo-fusion-doppler-no-covariance = sin covarianza

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = cada pseudodistancia requiere un sigma positivo y finito

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = { $obs } pseudodistancias no pueden resolver { $n } incógnitas (3 de posición + { $n_clock } relojes)

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = un satélite coincide con la estimación de posición

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = la geometría es singular

engine-e-leo-fusion-joint-pvt-no-iteration-ran = no se ejecutó ninguna iteración

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = geometría final degenerada

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = el DOP no es finito

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } debe ser positivo

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m debe ser no negativo y la ejecución, de 5000 épocas como máximo

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = cada señal requiere un ancho de banda positivo

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz = Posicionamiento 5G NTN a { $r } MHz, C/N0 { $r2 } a { $r3 } dB-Hz, { $n_satellites } satélites ({ $mean_in_view } a la vista){ "\u000A" }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, rango CRB { $range_sigma_zenith_m } a { $range_sigma_mask_m } m; 3D formal mediano { $s2 } m, error RMS { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples = { "  " }pasada Doppler de un satélite: { $n_obs } muestras durante { $duration_s } s, error horizontal { $horizontal_error_m } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP requiere al menos un sistema

engine-e-leo-fusion-ppp-duration-and-step-must-be = la duración y el paso deben ser positivos, con un máximo de 20000 épocas

engine-e-leo-fusion-ppp-runs-must-be-to-200 = las ejecuciones deben ser de 1 a 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = los umbrales de convergencia deben ser positivos

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical = Convergencia de PPP a { $criterion_horizontal_m } m horizontal / { $criterion_vertical_m } m vertical, { $runs_per_case } ejecuciones por caso, { $n_gnss } satélites GNSS{ "\u000A" }

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  mediana { $c } min  convergidas { $v4 } %  NEES media { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = error horizontal mediano en { $runs_per_case } ejecuciones · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = el preajuste { $id } no incluye ninguna señal

engine-e-leo-fusion-presets-preset-has-no-signal-it = el preajuste { $id } no tiene la señal { $n }; tiene { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = preajuste LEO { $id } desconocido; conocidos: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s y step_s deben ser positivos, con un máximo de 20000 épocas

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = los pasos polares deben ser positivos

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = el modo debe ser doppler, joint, polar o timing; se recibió { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = el modo doppler requiere al menos un sistema LEO

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = el modo timing requiere un sistema LEO con medición de distancia por código

engine-e-leo-fusion-pvt-kind-unknown-clock-class = clase de reloj { $c } desconocida

engine-leo-fusion-pvt-kind-leo-pvt-at-over = PVT LEO ({ $mode }) en { $user_lat_deg }, { $user_lon_deg } durante { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } sats a { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites = { "  " }solución Doppler: { $n_obs } mediciones de { $n_sats } satélites, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }ventana { $window_s } s: { $n_sats } sats, error 3D { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }pasada cenital de { $system }: Doppler máx. { $max_doppler_hz } Hz, tasa { $max_doppler_rate_hz_s } Hz/s, jerk { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }satélite LEO de medición de distancia a la vista en el { $v1 } % de las épocas{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } disponibilidad { $availability }, PDOP mediano { $f }, error 3D RMS { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } fusionado { $f3 }; a la vista { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95 % { $row2 } ns, máx. { $row3 } ns (a la vista { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = PVT LEO — modo { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = sistema { $name }: role debe ser gnss o leo, se recibió { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = sistema { $name }: clock debe ser estimated o known, se recibió { $c }

engine-e-leo-fusion-system-system-must-be-positive = sistema { $name }: { $what } debe ser positivo

engine-e-leo-fusion-system-system-mask-deg-must-be = sistema { $name }: mask_deg debe estar en [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = sistema { $name }: sigma_pr_m debe ser positivo

engine-e-leo-fusion-system-give-at-least-one-system = indique al menos un [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = el espaciado de épocas debe ser positivo

engine-e-leo-fusion-timing-no-epochs = sin épocas

engine-e-leo-fusion-timing-no-satellite-was-ever-in = ningún satélite estuvo a la vista: el receptor nunca adquirió el tiempo

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = la polarización debe ser rhcp, lhcp o linear; se recibió '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = código de error SGP4 { $code } en t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = una órbita inclinada { $inc } deg nunca pasa sobre la latitud { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = la elevación máxima solicitada está por debajo del alcance del horizonte

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = la clase de edificio debe ser traditional o thermally-efficient; se recibió '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = el campo { $name } no es finito

engine-e-leo-navmsg-codec-field-is-outside-its-bit = el campo { $name } = { $value } { $unit } está fuera de su rango de { $bits } bits (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = mensaje truncado

engine-e-leo-navmsg-codec-field-list-exhausted = lista de campos agotada

engine-e-leo-navmsg-codec-field-order-mismatch-vs = el orden de los campos no coincide: { $name } frente a { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID debe estar entre 1 y 255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = cada polinomio de corrección requiere de 1 a 8 coeficientes

engine-e-leo-navmsg-codec-correction-time-scale-must-be = la escala de tiempo de corrección debe ser una potencia de dos de 1 s a 32768 s; se recibió { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = el polinomio ECEF requiere de 1 a 11 coeficientes, iguales por eje

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = el grado del polinomio ECEF { $v1 } supera 10

engine-e-leo-navmsg-codec-unknown-model-id = identificador de modelo { $m } desconocido

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = la carga útil supera los 4095 bytes

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = trama más corta que el encabezado y el CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = preámbulo 0x{ $frame } incorrecto

engine-e-leo-navmsg-codec-unsupported-version = versión { $version } no compatible

engine-e-leo-navmsg-codec-frame-length-does-not-match = la longitud de trama { $frame } no coincide con la carga útil declarada de { $len } bytes

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = discrepancia de CRC-24Q: calculado 0x{ $crc }, la trama lleva 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = cada elemento de rac_degrees debe ser como máximo 7; se recibió { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree debe estar entre 1 y 10; se recibió { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = modelo de efemérides '{ $other }' desconocido: use kepler16, kepler-rac, liu22 o ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = el intervalo de ajuste debe ser al menos 10 s; se recibió { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = la ventana de ajuste [{ $t0 }, { $v1 }] s queda fuera del arco de referencia [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = el ajuste del polinomio ECEF es singular (muy pocas muestras para el grado)

engine-e-leo-navmsg-fit-clock-fit-is-singular = el ajuste del reloj es singular

engine-e-leo-navmsg-fit-keplerian-fit-diverged = el ajuste kepleriano divergió

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = preajuste '{ $k }' desconocido; disponibles: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s debe estar entre 10 y 3600 s y update_period_s en (0, fit_interval_s]; se recibió { $fit_interval_s } y { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s y eval_step_s deben estar entre 0.5 y 60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz debe superar los 10 MHz; se recibió { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid debe estar entre 1 y 255

engine-e-leo-navmsg-band-must-be-15-and = band debe estar entre 0 y 15 y health entre 0 y 3

engine-e-leo-navmsg-unknown-csv-schema = csv_schema '{ $csv_schema }' desconocido

engine-e-leo-navmsg-analysis-must-name-at-least = analysis debe nombrar al menos un análisis

engine-e-leo-navmsg-unknown-analysis-use = análisis '{ $a }' desconocido; use { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind debe ser leo-navmsg; se recibió { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg debe estar en [0, 60); se recibió { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    Mensaje de navegación LEO — { $res } km, { $res2 } deg, grado de gravedad { $gravity_degree }, modelo { $res3 }
    { "  " }pesos SISRE: w_R { $w_r }, w_AC^2 1/{ $v6 } (máscara { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s debe estar entre 60 y 86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s no debe estar vacío y cada valor debe estar entre 10 y 3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }compromiso del intervalo de ajuste durante { $span } s (período de uso = intervalo de ajuste):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE de órbita RMS { $sisre_orb_rms_m } m  máx. { $sisre_orb_max_m } m  con reloj RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s no debe estar vacío y cada valor debe estar entre 10 y 3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s debe estar entre 60 y 86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } parámetros  SISRE de órbita RMS { $sisre_orb_rms_m } m  con reloj { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = no hay ninguna pasada por encima de { $mask } deg para el usuario en { $lat }, { $lon } dentro de { $search } s; amplíe midpass.search_s o mueva al usuario

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }actualización a mitad de pasada: pasada { $p0 }-{ $p1 } s (elevación máxima { $pmax } deg), { $switches } cambios, mayor salto de distancia del usuario { $max_jump } m (geometría del peor caso { $max_worst } m) frente al umbral { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }codificación-decodificación: modelo { $m }, trama { $frame } bytes ({ $payload_bits } bits de carga útil, { $eph_bits } bits de efemérides+reloj), CRC-24Q 0x{ $hex }
    { "    " }cuantización: mayor cambio de posición { $v6 } mm, reloj { $v7 } mm; SISRE exacto { $acc_exact } m, cuantizado { $acc_q } m
    { "    " }trama corrupta rechazada: { $corrupted_rejected }; ida y vuelta RINEX { $rin_dp } m; ida y vuelta CSV { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs debe estar entre 1 y 20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  publicado { $published } m  razón { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = El conjunto kepleriano de 16 parámetros se degrada de { $a } m a { $lo } s a { $b } m a { $hi } s: un conjunto kepleriano con armónicos de dos veces por revolución no puede seguir los términos de gravedad de mayor frecuencia ni la resistencia atmosférica de un arco LEO durante más de unos pocos minutos, y su residuo de mínimos cuadrados oscila a lo largo de la ventana. Los polinomios a lo largo de la traza, transversal y radial, de grado superior al que abarca el conjunto kepleriano, absorben lo que queda y dan { $c } m a { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = El conjunto kepleriano de 16 parámetros pasa de { $a } m a { $lo } s a { $b } m a { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, grado de gravedad { $gravity_degree } · error de representación respecto a la referencia · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` es el de la biblioteca del host

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: los muestreadores de `rand_distr` llaman a `exp` y `ln` del host en sus ramas poco frecuentes; use `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` es el campo de gravedad de la biblioteca del host; use `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` no ha sido revisado

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = no hay línea END OF HEADER

engine-e-leo-navmsg-text-expected-eph-record-header-got = se esperaba un encabezado de registro '> EPH', se recibió { $head }

engine-e-leo-navmsg-text-bad-satellite-id = identificador de satélite { $parts } incorrecto

engine-e-leo-navmsg-text-missing-epoch-line = falta la línea de época

engine-e-leo-navmsg-text-bad-epoch-line = línea de época { $ep } incorrecta

engine-e-leo-navmsg-text-bad-epoch-field-in = campo de época incorrecto en { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = la línea de época requiere tres términos de reloj: { $ep }

engine-e-leo-navmsg-text-record-truncated = registro truncado

engine-e-leo-navmsg-text-unknown-record-type = tipo de registro { $other } desconocido

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = la tabla CSV lleva mensajes kepler16 y kepler-rac; se recibió { $m }

engine-e-leo-navmsg-text-empty-csv = CSV vacío

engine-e-leo-navmsg-text-row-has-cells-header = la fila tiene { $cells } celdas, el encabezado { $header }

engine-e-leo-navmsg-text-bad-number-in-column = número { $c } incorrecto en la columna { $k }

engine-e-leo-navmsg-text-csv-row-lacks = a la fila CSV le falta { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = la altitud de la órbita debe estar entre 100 km y 3000 km; se recibió { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = la excentricidad debe estar en [0, 0.1) para un ajuste LEO; se recibió { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = el paso de integración debe estar en (0, 30] s; se recibió { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = la duración debe ser positiva, con un máximo de 200000 pasos; se recibió { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree debe ser 0, 2-6 (zonal) o 7-{ $v1 } (EGM2008); se recibió { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = la propagación de referencia divergió

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = la órbita de referencia decayó por debajo de 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = el espaciado de nodos debe estar en (0, 60] s; se recibió { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = una órbita de referencia tabulada requiere al menos dos estados; se recibió { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = el estado { $k } no es finito

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = clock adev_1s debe estar en [0, 1e-6); se recibió { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = un reloj medido se construye con TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = un reloj disciplinado requiere sigma_s en [0, 1e-3) y tau_s > 0; se recibió { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = un reloj medido requiere un paso positivo y al menos dos muestras

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = una muestra de reloj medido no es finita

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = la época '{ $s }' no es YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = la época '{ $s }' no es YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = la época '{ $s }' tiene un campo de segundos incorrecto

engine-e-leo-pass-epoch-is-out-of-range = la época '{ $s }' está fuera de rango

engine-e-leo-pass-band-unknown-signal-design-public = banda '{ $name }': diseño de señal '{ $n }' desconocido; diseños públicos: { $v2 }

engine-e-leo-pass-band-is-not-in-the = la banda '{ $name }' no está en el preajuste del sistema: indique frequency_mhz y eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = la banda '{ $name }' requiere eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern debe ser isoflux, gaussian o flat; se recibió '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = la frecuencia de la banda '{ $name }' está fuera de rango

engine-leo-pass-overridden-in-the-scenario = { $source } (reemplazado en el escenario)

engine-e-leo-pass-system-has-no-band = el sistema '{ $id }' no tiene la banda '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = un satélite LEO requiere al menos una banda

engine-e-leo-pass-at-most-12-bands-per = como máximo 12 bandas por satélite

engine-leo-pass-unknown-system-presets-in-this = sistema '{ $n }' desconocido; preajustes en esta compilación: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = no existe órbita heliosíncrona a { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (como máximo 86400) y step_s deben ser positivos, con un máximo de 20000 épocas; se recibió { $duration } y { $step }

engine-leo-pass-leo-satellite-km-deg = satélite LEO { $system }, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = la `epoch` del escenario { $epoch }, leída como UTC

engine-leo-pass-the-kind-default-epoch-utc = la época predeterminada del tipo { $epoch } UTC (el escenario no indica ninguna)

engine-e-leo-pass-user-environment-must-be-ground = user.environment debe ser ground, maritime, air o indoor; se recibió '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg debe estar dentro de +/-90

engine-e-leo-pass-user-speed-must-be-to = la velocidad del usuario debe estar entre 0 y 3000 m/s y la altura entre -500 y 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna debe ser patch, hemispherical o isotropic; se recibió '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability debe estar en (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model debe ser klobuchar, vtec o none; se recibió '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction debe ser ascending o descending; se recibió '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satélite { $id }: excentricidad o perigeo incorrectos

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satélite { $id }: tle requiere tle_line1 y tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit debe ser pass, elements o tle; se recibió '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation requiere un sistema o un diseño

engine-e-leo-pass-no-sun-synchronous-inclination = no existe inclinación heliosíncrona

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: como máximo 5000 satélites

engine-e-leo-pass-no-leo-satellite-rises-above = ningún satélite LEO se eleva por encima de la máscara en la ventana

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s debe estar en (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' no es una banda de ningún satélite LEO ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = no hay señal GNSS '{ $bname }' para la constelación '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = constelación GNSS vacía

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' no son dos bandas distintas de { $id }

engine-e-leo-pass-iot-powers-and-battery-must = las potencias y la batería de IoT deben ser positivas

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from debe ser median o peak; se recibió '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = umbral de detección { $detection_snr_db } dB tras la integración

engine-leo-pass-coherent-integration-at-most-ms = integración coherente de { $rx } ms como máximo, limitada por la tasa Doppler

engine-leo-pass-serial-search-with-correlators = búsqueda en serie con { $correlators } correladores

engine-leo-pass-hot-start-doppler-known-to = arranque en caliente: Doppler conocido a +/-{ $aided } Hz, efemérides válidas

engine-leo-pass-leo-pass-link-budget-user = Balance de enlace de pasada LEO, usuario { $environment } en { $lat_deg }, { $lon_deg }; { $satellites } satélite(s) LEO, ventana de { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, elevación máxima { $max_elevation_deg } deg a { $tca_s } s, { $duration_above_mask_s } s sobre la máscara{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 pico { $opt } mediana { $opt2 }; |Doppler| máx. { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: { $satellites_in_view } a la vista, C/N0 { $opt } a { $opt2 } (mediana { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } pico { $leo_peak_cn0_dbhz } dB-Hz está { $leo_peak_above_gnss_median_db } dB por encima de la mediana GNSS; por encima de la portadora GNSS más intensa durante { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: TTFF en frío { $ttff_s } s ({ $energy_per_fix_mj } mJ), en caliente { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer desde { $onset_s } s (salto { $offset_m } m, arrastre { $push_rate_m_s } m/s): prueba Doppler GNSS { $t }, LEO { $t2 }, fusionado { $t3 }; entre bandas { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = usuario { $environment } · pico LEO { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB por encima de la mediana GNSS · MODELLED

engine-leo-pass-user-modelled = usuario { $environment } · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler de la primera banda de cada satélite LEO (±{ $v1 } kHz a escala completa)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = tabla [{ $what }] no válida: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' no está en [signal] ni es un diseño público ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' no tiene componente con seguimiento de código, por lo que no da pseudodistancia

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind debe ser leo-pnt-chain; se recibió { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = el componente seguido no tiene tasa de chips

engine-e-leo-pnt-chain-no-band-of-pass-names = ninguna banda de [pass] nombra signal = "{ $name }"; la cadena necesita una que lleve el diseño

engine-e-leo-pnt-chain-the-pass-gives-no-code = la pasada no da jitter de código

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m debe estar en [0, 100] m; se recibió { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] debe ejecutar mode = "joint"; se recibió { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = C/N0 seguido en la máscara de { $mask } deg (ajuste de recta en el seno de la elevación)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] no tiene ningún sistema LEO que reciba los valores de la cadena

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] no produjo ningún bloque joint

engine-leo-pnt-chain-leo-pnt-chain = Cadena LEO-PNT: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }señal { $name2 } ({ $design }), { $design2 } seguido a { $v4 } Mchip/s, desfase de C/N0 { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }pasada { $id } { $sat } km: C/N0 seguido pico { $peak_tracked_cn0_dbhz } dB-Hz, jitter de código mediano { $jitter_median } m; recta de C/N0 { $a } + { $b } sen(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }mensaje { $res } ajuste de { $fit_interval_s } s / actualización de { $update_period_s } s: SISRE de representación { $stats } mm RMS (órbita { $stats2 } mm), con { $od } m de determinación de órbita: { $sisre } m transferidos{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }solución de posición fusionada: solo GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }convergencia de PPP: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }Valores de { $doc } transferidos entre etapas. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Jitter del seguimiento de código, el error de medición de distancia (m, 0 a { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · solo GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulación { $label }: el ancho debe ser positivo

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = preajuste de señal { $name } desconocido: la biblioteca tiene { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = preajuste { $name }: archivo de preajuste no válido: { $e }

engine-e-leo-signal-preset-file-names-itself = el archivo de preajuste { $name } se nombra a sí mismo { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz debe ser positivo

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz debe ser positivo

engine-e-leo-signal-signal-needs-at-least-one = { $name }: una señal requiere al menos un componente

engine-e-leo-signal-component-power-fraction-must-be = { $name }: el power_fraction del componente { $v1 } debe ser positivo

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: el componente { $v1 } tiene fdma_shares pero no fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: los fdma_shares del componente { $v1 } deben ser positivos y sumar uno

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: el componente { $v1 } requiere un fdma_share por desfase

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps debe ser positivo

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips debe ser positivo

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: las fracciones de potencia de los componentes suman { $total }, no 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km debe ser positivo

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: un componente plano (de tipo OFDM) no puede colocarse en el modelo de espectro

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: el componente seguido está sobre subportadoras FDMA; el modelo de espectro sigue un componente en el centro de la banda

engine-e-leo-signal-signal-is-given-twice = la señal { $w } está indicada dos veces

engine-e-leo-signal-signals-is-more-than-the = { $out } señales son más que las 24 permitidas

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receptor: loop_bandwidth_hz x integration_time_s debe ser menor que 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receptor: indique de 1 a 40 valores de cn0_dbhz

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 y slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points debe estar entre 21 y 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: use "coherent" o "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = la temperatura de ruido del sistema debe ser positiva

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: señal GNSS desconocida { $n } (conocidas: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } no es una señal del escenario

engine-e-leo-signal-shape-check-signal-is-not = comprobación de forma: la señal { $signal } no está en el escenario

engine-leo-signal-scenario-leo-signal-signals-noise = escenario leo-signal | { $runs } señales | piso de ruido { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = izquierda: PSD de banda limitada de cada diseño (dB por debajo del pico, a lo largo de su banda de transmisión); derecha: jitter de código frente a C/N0 total con espaciado de { $reference_spacing_chips } chips

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = banda desconocida '{ $other }' (se esperaba s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km debe ser finito y positivo

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps debe ser finito y positivo

engine-e-linkbudget-other-losses-db-must-be = other_losses_db debe ser finito y >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k debe ser finito y positivo cuando se indica

engine-linkbudget-link-budget-band-km-bit = link-budget: banda { $value }, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, margen { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = no se puede escuchar en { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: escuchando en tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: cliente tcp conectado

engine-live-io-kshana-live-warning-is-not = kshana live: advertencia: { $addr } no es una dirección de loopback; cualquiera que pueda alcanzarla puede leer el flujo

engine-e-live-io-cannot-open = no se puede abrir { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: se descartó un cliente tcp que no pudo mantener el ritmo

engine-e-live-io-cannot-open-2 = no se puede abrir { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: advertencia: { $addr } no es una dirección de loopback; cualquiera que pueda alcanzarla puede enviar un flujo a esta capa

engine-e-live-io-cannot-bind-udp = no se puede enlazar udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: escuchando en udp { $addr }

engine-e-live-io-cannot-connect-to = no se puede conectar con { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: conectado a tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: leyendo el puerto serie { $path } a { $baud } baudios (solo lectura)

engine-live-io-the-was-closed-by-the = el { $v1 } fue cerrado por el otro extremo (la capa no se reconecta: ejecútela bajo un supervisor que la reinicie)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: use 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 o 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } no es un dispositivo serie (tcgetattr falló)

engine-e-live-io-cannot-set-baud = no se pueden fijar { $baud } baudios

engine-e-live-io-cannot-set-the-line-mode = no se puede fijar el modo de línea de { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial solo se admite en Unix; use --file, --tcp o --stdin

engine-live-io-unknown-option = opción desconocida { $s }

engine-live-io-cannot-read = no se puede leer { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: plataforma de buque, calibrando durante { $calibration_s } s; umbral { $v2 }. Software de carácter consultivo, no un equipo de navegación homologado: el operador sigue siendo responsable.

engine-live-io-write-failed = error de escritura: { $e }

engine-live-io-kshana-live-dropped-udp-datagram = kshana live: se descartaron { $n } datagrama(s) udp que el motor no pudo tomar ({ $udp_dropped } en total)

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = el PRN de AFS { $prn } está fuera de 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = índice de inserción { $p } fuera de 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = los archivos del Anexo 3 contienen { $gold } y { $ter } códigos, se esperaban 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = el PRN { $v1 } de AFS-I del Anexo 3 no es un código Gold de g1, g2 (LSIS Figura C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = el código secundario S{ $id } no existe (S0 a S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = la Tabla 11 de LSIS V1.0 asigna códigos solo a los identificadores de nodo 1 a 12, no a { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = el FID { $fid } no cabe en dos bits (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = el TOI { $toi } está fuera de 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = se esperaban { $SB1_SYMBOLS } símbolos de la subtrama 1

engine-e-lunar-afs-frame-subframe-data-lengths-expected = longitudes de datos de subtrama { $sb2 }/{ $sb3 }/{ $sb4 } (se esperaban { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = se esperaban { $FRAME_SYMBOLS } símbolos, se indicaron { $soft }

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = línea { $v1 }: se esperaba `row,column`

engine-e-lunar-afs-ldpc-line = línea { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = línea { $v1 }: ({ $r },{ $c }) fuera de { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: se esperaban { $info_bits } bits de información, se indicaron { $info }

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = los datos de LSIS V1.0 no están en { $cache_dir } (defina KSHANA_LSIS_DIR o ejecute xval/lunar-afs/fetch_lsis.sh, que descarga { $LSIS_PDF_URL } y extrae sus anexos; no se redistribuyen con Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } no es un archivo LSIS fijado

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } tiene SHA-256 { $got }, se esperaba { $want } (fijado a LSIS V1.0 del 29 de enero de 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = banda base de la LunaNet Augmented Forward Signal, { $LSIS_VERSION }; generador de referencia de Kshana

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = nodo AFS { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = nodo AFS { $node_id } trama TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites debe ser al menos 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites debe ser al menos 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg debe estar en [0, 90); se recibió { $mask_deg }

engine-lunar-beacon-satellites-no-beacons = { $n_sats } satélites, sin balizas

engine-lunar-beacon-satellites-visible-beacons = { $n_sats } satélites + { $n_vis_beacons } balizas visibles

engine-lunar-beacon-satellites-no-beacons-2 = { $n_cmp } satélites, sin balizas

engine-e-lunar-beacon-serialising-beacon-report = al serializar el informe de balizas: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = el informe de balizas debe serializarse como un objeto JSON

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Aumento con balizas de superficie lunar — máscara { $elevation_mask_deg } deg, época +{ $epoch_s } s, sigma_URE por baliza { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  sat. { $n_visible_sats }  balizas { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  1-sigma realizado: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }las balizas mejoran el PDOP en un factor { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = una constelación mayor en su lugar, { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = no se pueden leer las efemérides lunares { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = efemérides lunares: la primera línea debe ser `{ $MAGIC }`, se encontró `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = efemérides lunares: el archivo está vacío

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = efemérides lunares: `# format:` debe ser `states` o `elements`, se encontró `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = efemérides lunares: no hay filas de datos

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = efemérides lunares: falta la columna `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = efemérides lunares: `# elements_frame:` debe ser `icrf` o `mci`, se encontró `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = efemérides lunares: `elements_frame: icrf` requiere `# epoch_jd_tdb:` (la época a la que se refieren los elementos, que es también donde se evalúa la rotación de ICRF a fijo a la Luna): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = efemérides lunares: fila de elementos { $v1 } incompleta

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = efemérides lunares: fila de elementos { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = efemérides lunares: la fila de elementos { $v1 } tiene un semieje mayor no positivo

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = efemérides lunares: la fila de elementos { $v1 } tiene excentricidad { $ecc }, fuera de [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = efemérides lunares: un archivo `states` requiere `# frame: icrf` o `# frame: mci`, se encontró `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = efemérides lunares: un archivo de estados `icrf` requiere `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = efemérides lunares: fila de estado { $v1 } incompleta

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = efemérides lunares: fila de estado { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = efemérides lunares: la fila de estado { $v1 } no es finita

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = efemérides lunares: la fila de estado { $v1 } del satélite { $sat } retrocede en el tiempo ({ $t } después de { $last }); las épocas deben ser estrictamente crecientes por satélite

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Efemérides de estado tabuladas centradas en la Luna (marco { $e }), interpoladas por Lagrange de orden { $LAGRANGE_ORDER } entre épocas de la tabla y reducidas a MCMF mediante { $v2 }. Este motor NO propaga los estados. Clase de procedencia `published-ephemeris`: distinta de toda cifra derivada de elementos.

engine-lunar-ephemeris-published-constellation-definition-stated-in = DEFINICIÓN de constelación publicada, expresada en ICRF centrado en la Luna (`{ $v1 }`), propagada por el propio solucionador de Kepler de este motor en ese mismo marco inercial y reducida a MCMF mediante la orientación lunar IAU 2015 / WGCCRE (polo con precesión, libración física analítica) en cada época. SIN aproximación de marco: la fuente nombra el marco y la época, y se usan ambos. Clase de procedencia `published-elements`: distinta de toda cifra derivada de un kernel.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = DEFINICIÓN de constelación publicada, propagada por el propio solucionador de Kepler de este motor y reducida mediante el modelo de giro lunar de rotación media — exactamente la misma vía que sigue la constelación ilustrativa, de modo que la única diferencia entre las dos ejecuciones es el diseño de la constelación. La fuente indica los elementos en el marco `{ $v1 }`; aquí se leen como MCI, lo que inclina la constelación en `published_frame_tie_angle_deg`. Clase de procedencia `published-elements`: distinta de toda cifra derivada de un kernel.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = station_datum desconocido { $other }: se esperaba "fixed" o "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = una campaña VLBI requiere al menos 2 estaciones para formar una línea base, se recibieron { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = la estación { $name } tiene una coordenada no finita

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = la latitud { $lat } deg de la estación { $name } está fuera de [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = un datum de Helmert de siete parámetros requiere al menos 3 balizas no colineales, se recibieron { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = la baliza { $name } tiene una coordenada no finita

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = la latitud { $lat } deg de la baliza { $name } está fuera de [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours debe ser positivo y finito, se recibió { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min debe ser positivo y finito, se recibió { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = la programación de { $v1 } épocas supera el límite de 5000 épocas de este escenario; aumente step_min o reduzca arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s debe ser positivo y finito, se recibió { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg debe ser finito y estar en [-90, 90), se recibió { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg debe ser finito y estar en [-90, 90), se recibió { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol debe ser finito y estar en [0, 1), se recibió { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m debe ser positivo y finito, se recibió { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver debe ser "spectral" o "srif", se recibió "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = al serializar el resultado de lunar-frame-campaign: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } épocas x { $v1 } líneas base x { $n_beacons } balizas, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = rango completo: los 7 parámetros de similitud están restringidos por esta campaña (número de condición { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = DEFICIENTE EN RANGO: { $defect } de 7 direcciones de similitud no son observables con esta campaña, por lo que NO se publica ningún sigma de datum; las direcciones no observables se enumeran en la base de siete parámetros

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | { $n_beacons } balizas x { $v1 } líneas base x { $n_epochs } épocas = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })

engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } de { $beacons } balizas no tienen observaciones en esta programación ({ $names2 }); no aportan información, sus sigmas son null y el datum se realiza solo a partir de las balizas observadas

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = todos los sigmas deben ser positivos

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane y altitude_km deben ser positivos

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency debe estar en (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m frente a sigma de posición en tierra { $v2 } m, q media { $v3 } (chi cuadrado 6 espera 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } ambigüedades, éxito de ILS { $last2 } (bootstrap { $last3 }) en el arco más largo

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: menor autovalor de información x{ $v } con enlaces de orbitador, traza de CRLB x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } puntos de barrido en { $v } arcos; sigma de traslación láser frente a GNSS x { $last2 } m en el enlace local registrado

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: sigma de CRLB h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = estudio desconocido `{ $other }`: se esperaba uno de { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = el conjunto de mediciones no determina la órbita (información singular)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials debe ser al menos 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = los sigmas de tierra deben ser positivos

engine-e-lunar-infra-od-unknown-station-dss-14-dss = estación desconocida `{ $nm }`: DSS-14, DSS-63 o DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = hay muy pocas mediciones en tierra para determinar la órbita

engine-e-lunar-infra-od-the-covariance-of-the-difference = la covarianza de la diferencia es singular

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = la corrección diferencial de la NRHO no convergió desde la semilla

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo requiere 0 < altitud del perilunio < altitud del apolunio

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = familia de órbitas desconocida `{ $other }`: nrho o elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s y arc_days deben ser positivos

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = no hay ningún satélite común entre los receptores

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = las ecuaciones normales de la fase de portadora son singulares

engine-e-lunar-infra-phase-the-position-block-is-singular = el bloque de posición es singular

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = la covarianza de ambigüedades no es definida positiva

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = los sigmas de las técnicas deben ser positivos

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = los sigmas del enlace local deben ser positivos

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz debe ser finito y positivo

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz debe ser finito y positivo

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k debe ser finito y positivo

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km debe ser finito y superior al radio lunar

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity debe estar en [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw debe ser finito

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | { $n_sats } satélites, { $n_epochs } épocas, { $n_links } enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } PERDIDOS | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | { $n_sats } satélites, { $n_epochs } épocas, { $n_links } enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } PERDIDOS | disponibilidad { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = encabezado inesperado del catálogo de reflectores { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = fila incompleta del catálogo de reflectores { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = campo de reflector ilegible { $i } en { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = reflector { $f }: |(x,y,z)| = { $norm3 } m pero la columna de radio publicada indica { $radius } m — la fila ha sido editada

engine-e-lunar-llr-reflector-catalogue-has-no-rows = el catálogo de reflectores no tiene filas

engine-e-lunar-llr-unreadable-position-epoch-year = position_epoch_year ilegible { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = encabezado inesperado del catálogo de estaciones { $t }

engine-e-lunar-llr-short-station-catalogue-row = fila incompleta del catálogo de estaciones { $t }

engine-e-lunar-llr-unreadable-station-field-in = campo de estación ilegible { $i } en { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = identificador ILRS ilegible en { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = el catálogo de estaciones no tiene filas

engine-e-lunar-llr-cannot-read-this-scenario-runs = no se puede leer { $path } ({ $e }). Este escenario se ejecuta sobre el fragmento de datos reales incluido en el repositorio, en { $DEFAULT_DATA_DIR }, que se distribuye con el repositorio pero no con el crate publicado; apunte `data_dir` a una copia del mismo.

engine-e-lunar-llr-only-usable-normal-points-for = solo { $used } puntos normales utilizables para { $reflectors } reflectores — muy pocos para acotar { $v3 } coordenadas; amplíe el fragmento del archivo

engine-e-lunar-llr-the-simulated-campaign-own-report = el informe propio de la campaña simulada no pudo analizarse: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: { $used } puntos normales archivados ({ $n_parsed } analizados) de { $station_counts } estación(es) a { $reflectors } matrices de retrorreflectores durante { $v5 } d; precisión mediana medida de los puntos normales { $median } mm en un sentido; rango de información de reflectores { $rank }/{ $n }; rango de Helmert { $rank2 }/{ $n_helmert } cond { $condition }; sigma de traslación del datum { $v12 } m; RMS de los residuos observado menos calculado en un sentido { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg debe ser finito y estar en [-90, 90), se recibió { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name }: coordenada no finita

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name }: latitud { $lat_deg } deg fuera de [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = falló la serialización del informe de lunar-llr-datum: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = el paso de integración debe dividir el paso de salida

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receptor: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } debe ser finito y no negativo

engine-lunar-receiver-must-be-finite-and-positive = { $n } debe ser finito y positivo

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: exportación del sitio: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = las efemérides lunares { $path } cubren { $until } s después de su época pero el horizonte del escenario llega a { $last } s; reduzca horizon_hours u obtenga un arco más largo (se rechaza extrapolar unas efemérides tabuladas)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path requiere epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = marco OP en { $epoch } UTC (normal de la órbita aparente de la Tierra alrededor de la Luna, x a lo largo de su nodo sobre el ecuador lunar IAU); GM lunar, J2 y C22 en el marco fijo a la Luna IAU, Tierra y Sol como terceros cuerpos en posiciones DE440 de { $spk_path }; Runge-Kutta de cuarto orden, paso de 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solución: height_sigma_m debe ser finito y positivo

engine-e-lunar-solution-solution-range-sigma-must-be = solución: range_sigma_m debe ser finito y positivo

engine-e-lunar-solution-solution-min-satellites-needs-height = solución: min_satellites = 3 requiere height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solución: min_satellites debe ser 3 o 4, se recibió { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solución: window_epochs debe estar entre 1 y 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } debe ser finito y positivo

engine-lunar-station-must-be-finite-and-not = { $name } debe ser finito y no negativo

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } supera { $MAX_WORK }; reduzca n_trials, aumente grid_lat_step_deg (o indique menos puntos), o aumente t_step_s / reduzca t_span_s

engine-e-lunar-station-kind-must-be-got = kind debe ser { $KIND }; se recibió { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: las efemérides { $path } cubren { $until } s pero la ejecución llega a { $last } s (la última época más latency_s); reduzca t_span_s

engine-e-lunar-station-no-case = { $KIND }: no hay caso ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } puntos · { $n_epochs } épocas · { $n_trials } ensayos

engine-lunar-station-hpl-max = HPL máx. { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = levantamiento { $survey_sigma_m } m · latencia { $latency_s } s · { $quantization_bits } bits

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines y samples deben estar entre 2 y { $MAX_DEM_SIDE }, se recibió { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } alturas para una cuadrícula de { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m debe ser positivo, se recibió { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m debe ser positivo, se recibió { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: no se puede leer { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection debe ser south-polar-stereographic, se recibió { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type debe ser int16-le, se recibió { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: no se puede leer { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: cuadrícula por encima del tope de { $MAX_DEM_SIDE } píxeles

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } tiene { $bytes } bytes; { $lines } x { $samples } int16 requiere { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: el SHA-256 { $digest } de { $img } no coincide con el { $image_sha256 } del descriptor

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor debe ser positivo

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: no se puede leer { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: requiere al menos 2 x 2 puntos, una extensión creciente dentro de [-90, 90] deg y 360 deg de longitud, y alturas finitas

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } debe ser finito y positivo, se recibió { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m debe ser finito y no negativo, se recibió { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg debe ser como máximo 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m debe estar entre 1 y 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: el sitio está fuera del campo de alturas

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: un horizonte declarado requiere una fuente no vacía

engine-e-lunar-terrain-terrain-stated-horizon = terrain: horizonte declarado: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: indique dem_path o dem_tile_path, no ambos

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km debe ser finito y positivo

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m debe ser finito y positivo

engine-e-lunar-terrain-site-deg-deg = { $e } (sitio { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = reloj desconocido { $other }; se esperaba uno de optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks debe nombrar al menos una clase de reloj

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s debe ser finito y positivo, se recibió { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s debe ser finito y mayor que tau_min_s ({ $lo }), se recibió { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade debe ser ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = el término { $name } es más corto que la rejilla de tau

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | reloj { $clock } | x_Σ(τ) de 7 términos en { $taus } puntos τ ({ $taus2 }–{ $taus3 } s) | cruce τ { $crossover_tau_s } s (x { $crossover_x_s } s) | piso de marco { $frame_term_s } s | reloj x(1 d) { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | laboratorio de tiempo: { $lab } { $lab2 } a LTC, x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: reloj desconocido { $other }; se esperaba uno de optical-master, passive-h-maser, rafs, mini-rafs, o indique un device_card en su lugar

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: indique clock o device_card, no ambos

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s debe ser finito y positivo, se recibió { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } debe ser finito y no negativo, se recibió { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s debe ser números positivos

engine-lunar-time-lab-station-height-not-modelled-exactly = altura de estación no modelada con exactitud: un error de altura de un sigma de { $height_sigma_m } m sesga la tasa en { $value } ns/día, aplicado como un término lineal desde la última corrección

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = el tiempo de luz no convergió a 1e-15 s en 30 iteraciones

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = la ruta del kernel requiere planetary_kernel_path, earth_orientation_kernel_path y moon_orientation_kernel_path conjuntamente

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = datum desconocido { $other }: se esperaba "anchor-first-station", "free-network" o "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = una programación VLBI requiere al menos 2 estaciones para formar una línea base, se recibieron { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = las coordenadas de las balizas deben ser finitas

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = la latitud { $lat } deg de la baliza está fuera de [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = la programación de { $v1 } épocas supera el límite de 20000 épocas de este escenario; aumente step_min o reduzca arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g debe ser positivo y finito, se recibió { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = al serializar el resultado de lunar-vlbi-fim: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = ninguna observación de la programación supera la máscara de elevación de { $mask } deg en ambos extremos de una línea base: { $n_epochs } épocas x { $v1 } líneas base, todas rechazadas. Aumente arc_hours, reduzca elevation_mask_deg o cambie de lugar las estaciones.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = el datum no deja ningún parámetro por estimar

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = DEFICIENTE EN RANGO: { $defect } de { $dim } direcciones no son observables, por lo que no se informa ningún sigma por coordenada; el valor del subespacio observable que figura abajo es una pseudoinversa restringida a las { $rank } direcciones observables y NO es un sigma de estación

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | { $n_stations } estaciones / { $v2 } líneas base x { $n_epochs } épocas = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })

## src/main.rs

engine-main-error-validate-needs-scenario-path = error: --validate requiere la ruta de un escenario

engine-main-error-study-needs-suite-manifest = error: --study requiere la ruta de un manifiesto de suite

engine-main-error-study-name-needs-value = error: --study-name requiere un valor

engine-main-error-export-sp3-needs-path = error: --export-sp3 requiere una ruta

engine-main-error-export-omm-needs-path = error: --export-omm requiere una ruta

engine-main-error-export-oem-needs-path = error: --export-oem requiere una ruta

engine-main-error-animate-needs-format-svg = error: --animate requiere un formato: svg, html, frames o all

engine-main-error-animate = error: --animate: { $e }

engine-main-error-animate-fps-needs-whole = error: --animate-fps requiere un número entero de fotogramas por segundo

engine-main-error-export-needs-format-czml = error: --export requiere un formato: czml, kml, geojson, stk, sigmf, all o list

engine-main-error-animate-duration-needs-length = error: --animate-duration requiere una duración en segundos

engine-main-error-import-route-needs-geojson = error: --import-route requiere la ruta de un archivo GeoJSON

engine-main-error-eop-needs-finals2000a-file = error: --eop requiere la ruta de un archivo finals2000A

engine-main-error-unknown-option = error: opción desconocida '{ $other }'

engine-main-error-unexpected-argument-one-scenario = error: argumento inesperado '{ $other }'; un archivo de escenario por ejecución

engine-main-warning-animate-fps-and-animate = advertencia: --animate-fps y --animate-duration no hacen nada sin --animate

engine-main-error-animate-exports-one-scenario = error: --animate exporta la ejecución de un escenario; no se combina con --validate ni con --study

engine-main-error-validate-lints-one-scenario = error: --validate analiza un escenario; no indique además un archivo de escenario

engine-main-error-cannot-read = error: no se puede leer { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — el kind se resuelve; este kind no requiere ningún campo (un cuerpo vacío ejecuta su configuración de referencia), por lo que no había nada más que comprobar

engine-main-ok-kind-resolves-and-all = ok: { $kind } — el kind se resuelve y las { $n_required } entradas de campos obligatorios publicadas están satisfechas; los valores de los campos no se comprueban

engine-main-error-study-runs-suite-do = error: --study ejecuta una suite; no indique además un único archivo de escenario

engine-main-warning-study-name-is-ignored = advertencia: --study-name se ignora con --study; el título de un estudio lo da el `title =` del manifiesto de la suite

engine-main-error-cannot-read-2 = error: no se puede leer { $path }: { $e }

engine-main-hint-kshana-example-lists-the = sugerencia: `kshana example` enumera los escenarios de referencia incluidos; `kshana example clock-holdover > clock-holdover.toml` escribe uno

engine-main-error-cannot-read-3 = error: no se puede leer { $eop_file }: { $e }

engine-main-error-eop = error: --eop: { $e }

engine-main-error-cannot-read-4 = error: no se puede leer { $route_file }: { $e }

engine-main-error-import-route = error: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: no se aplica: { $why }

engine-main-error-export = error: --export: { $e }

engine-main-error-animate-2 = error: --animate { $f }: { $e }

engine-main-error-export-2 = error: exportación { $fmt }: { $e }

engine-main-error-cannot-write = error: no se puede escribir { $json_path }: { $e }

engine-main-error-cannot-write-2 = error: no se puede escribir { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = error: no se puede construir el informe: { $e }

engine-main-error-cannot-write-3 = error: no se puede escribir { $html_path }: { $e }

engine-main-error-cannot-write-4 = error: no se puede escribir { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = error: no se puede escribir { $csv_path }: { $e }

engine-main-wrote-and = se escribieron { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } y { $csv_path }

engine-main-wrote-and-2 = se escribieron { $json_path }, { $svg_path }, { $html_path } y { $report_json_path }

engine-main-error-cannot-write-6 = error: no se puede escribir { $target }: { $e }

engine-main-error-cannot-write-7 = error: no se puede escribir { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = error: falló la exportación SP3: { $e }

engine-main-error-cannot-write-8 = error: no se puede escribir { $omm_path }: { $e }

engine-main-error-omm-export-failed = error: falló la exportación OMM: { $e }

engine-main-error-cannot-write-9 = error: no se puede escribir { $oem_path }: { $e }

engine-main-error-oem-export-failed = error: falló la exportación OEM: { $e }

engine-main-error-unexpected-argument-after-kinds = error: argumento inesperado '{ $other }' después de `kinds`; solo se acepta --json

engine-main-bundled-reference-scenarios-write-one =
    Escenarios de referencia incluidos ({ $v1 }). Escriba uno en un archivo y ejecútelo:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (no incluido: { $name } — ejecute `kshana example { $name }` para ver el motivo)

engine-main-error-is-not-bundled-it = error: '{ $name }' no está incluido: { $why }

engine-main-error-no-bundled-scenario-named = error: no hay ningún escenario incluido llamado '{ $name }'; `kshana example` enumera los { $v1 } incluidos

engine-main-error-cannot-read-5 = error: no se puede leer { $suite_path }: { $e }

engine-main-wrote-and-3 = se escribieron { $json_path } y { $html_path }

engine-main-error-needs-value = error: { $a } requiere un valor

engine-main-error-expected-mean-needs-number = error: --expected-mean requiere un número

engine-main-error-unknown-imu-fit-option = error: opción de imu-fit desconocida { $x }

engine-main-error-imu-fit-needs-an = error: imu-fit requiere la ruta de un registro de IMU

engine-main-error-needs-value-2 = error: { $args } requiere un valor

engine-main-error-epoch = error: --epoch: { $e }

engine-main-error-unknown-bench-export-option = error: opción de bench-export desconocida { $a }

engine-main-error-bench-export-needs-scenario = error: bench-export requiere la ruta de un escenario

engine-main-needs-value = { $a } requiere un valor

engine-main-site-takes-lat-lon-height = --site admite lat,lon[,height_m], se recibió { $v }

engine-main-error-is-bytes-the-tle = error: { $p } tiene { $m } bytes; el tope de TLE es { $cap } (4 MiB)

engine-main-error-cannot-read-6 = error: no se puede leer { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = opción de sky desconocida { $a }

engine-e-main-svg-and-monte-carlo-are = --svg y --monte-carlo son salidas distintas; indique una

engine-main-error-preset-needs-name =
    error: --preset requiere un nombre
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    error: --profile requiere un archivo
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } símbolos, { $r2 } trama(s) encontrada(s); { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }trama en { $f }: FID { $f2 } TOI { $f3 } (métrica SB1 { $f4 }, { $f5 } error(es) de SP, { $f6 } error(es) de SB1)

engine-main-not-checked = no comprobado: { $r }

engine-main-wrote-frame-of-6000-symbols = se escribió { $out }: { $frames } trama(s) de 6000 símbolos; las subtramas 2 a 4 son marcadores de posición (sin codificación LDPC, sin mensaje)

engine-main-error-cannot-write-10 = error: no se puede escribir { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = subcomando de lunanet-afs-check desconocido { $other }

engine-main-needs-pack-id = { $cmd } requiere un identificador de paquete

engine-main-unknown-standards-pack-run-option = opción de standards-pack run desconocida { $a }

engine-main-unknown-standards-pack-subcommand = subcomando de standards-pack desconocido { $other }

engine-main-error-out-needs-value = error: --out requiere un valor

engine-main-error-unknown-compliance-report-option = error: opción de compliance-report desconocida { $a }

engine-main-error-compliance-report-needs-at = error: compliance-report requiere al menos un archivo .json de resultados

engine-main-runs-read-not-used-rows = { $runs } ejecuciones leídas, { $unrecognised } no utilizadas; filas: { $n } con evidencia, { $n2 } parcialmente, { $n3 } sin evidencia, { $n4 } fuera de alcance

engine-main-error-receiver-trust-needs-scenario = error: receiver-trust requiere la ruta de un escenario

engine-main-error-invalid-receiver-trust-scenario = error: escenario de receiver-trust no válido: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = el encendido agota la masa: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, encendido={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = el tiempo de vuelo debe ser positivo

engine-e-maneuver-collinear-endpoints-transfer-plane-is = extremos colineales: el plano de transferencia no está definido (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs es para M >= 1; use lambert para M = 0

engine-e-maneuver-no-revolution-transfer-the-time = no hay transferencia de { $revs } revoluciones: el tiempo de vuelo es inferior a su mínimo

engine-e-maneuver-grid-step-days-must-be = grid_step_days debe ser positivo, se obtuvo { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = cada ventana debe avanzar en el tiempo (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = no hay transferencia del tipo solicitado en las ventanas

engine-e-maneuver-the-optimum-left-the-feasible = el óptimo salió de la región factible

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: se esperaban 3 valores

engine-e-mars-od-dss-epoch-is-not-2003 = la época de DSS-{ $id } no es 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } no tiene DXYZ

engine-e-mars-od-no-coordinates-for-dss = no hay coordenadas para DSS { $station }

engine-e-mars-od-no-ramps-for-dss = no hay rampas para DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = la tabla de rampas no cubre el intervalo

engine-e-mars-od-epoch-outside-the-integrated-span = la época { $et } está fuera del tramo integrado

engine-e-mars-od-normal-matrix-is-not-positive = la matriz normal no es definida positiva

engine-e-mars-od-no-points = no hay puntos

engine-e-mars-od-parameter-has-no-partial-on = un parámetro no tiene derivada parcial en los puntos conservados

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | usuario { $user }, reloj { $clock_class } | { $n_relays } relés (media de { $mean_relays_in_view } a la vista) | RMS de posición convergido { $converged_pos_rms_m } m, 1σ formal { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM de covarianza, no un PL certificado) | σ de frecuencia del reloj { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — usuario { $user }, reloj { $clock_class }: error de posición 3-D frente a la referencia (RMS convergido { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = la matriz de comparación por pares está vacía

engine-e-mcda-ahp-pairwise-matrix-is-not-square = la matriz de comparación por pares no es cuadrada (la fila { $i } tiene { $row } de { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = la entrada a[{ $i }][{ $j }] = { $v } debe ser finita y positiva

engine-e-mcda-ahp-diagonal-must-be = la diagonal a[{ $i }][{ $i }] = { $row } debe ser 1

engine-e-mcda-ahp-entries-must-be-reciprocal = las entradas a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } deben ser recíprocas (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = la fila superior { $i } tiene { $row } entradas, se esperaban { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = la entrada superior ({ $i },{ $j }) = { $v } debe ser finita y positiva

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: matriz de decisión vacía

engine-e-mcda-copras-copras-no-criteria = COPRAS: sin criterios

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS: { $n } pesos pero { $types } tipos de criterio

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: requiere al menos un criterio de coste (Min)

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: el valor { $x } de la alternativa { $i } en el criterio { $j } debe ser finito y > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: conjunto de datos vacío

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: sin criterios

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: la alternativa { $i } tiene un valor no finito

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: matriz de decisión vacía

engine-e-mcda-moora-moora-no-criteria = MOORA: sin criterios

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA: { $n } pesos pero { $types } tipos de criterio

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: la alternativa { $i } tiene un valor no finito

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: el criterio { $j } tiene norma L2 cero

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: matriz de decisión vacía

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: sin criterios

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II: { $n } pesos pero { $types } tipos / { $prefs } funciones de preferencia

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: la alternativa { $i } tiene un valor no finito

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: matriz de decisión vacía

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: sin criterios

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS: { $n } pesos pero { $types } tipos de criterio

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: la alternativa { $i } tiene un valor no finito

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = la utilidad aditiva no tiene atributos

engine-e-mcda-utility-attributes-but-weights = { $attributes } atributos pero { $weights } pesos

engine-e-mcda-utility-invalid-scaling-constant = constante de escala no válida { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = las constantes de escala suman cero

engine-e-mcda-utility-attribute-values-expected-got = se esperaban { $attributes } valores de atributo, se obtuvo { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: matriz de decisión vacía

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: sin criterios

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR: { $n } pesos pero { $types } tipos de criterio

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: la alternativa { $i } tiene un valor no finito

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: matriz de decisión vacía

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: sin criterios

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS: { $n } pesos pero { $types } tipos de criterio

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } debe estar en [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: el valor { $x } de la alternativa { $i } en el criterio { $j } debe ser finito y > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: matriz de decisión vacía

engine-e-mcda-wpm-wpm-no-criteria = WPM: sin criterios

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM: { $n } pesos pero { $types } tipos de criterio

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: el valor { $x } de la alternativa { $i } en el criterio { $j } debe ser finito y > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = la matriz de decisión no tiene criterios

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = la matriz de decisión no tiene alternativas

engine-e-mcda-wsm-criterion-has-an-invalid-weight = el criterio '{ $name }' tiene un peso no válido { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = los pesos de los criterios suman cero

engine-e-mcda-wsm-alternative-has-values-but-there = la alternativa '{ $name }' tiene { $values } valores pero hay { $n } criterios

engine-e-mcda-wsm-alternative-has-non-finite-value = la alternativa '{ $name }' tiene un valor no finito en el criterio '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = no es un DAF: más corto que un registro

engine-e-naif-kernel-not-daf-identification-word = no es un DAF: palabra de identificación { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = formato binario DAF no admitido { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = encabezado DAF inverosímil: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = la dirección DAF { $addr } está más allá del final del archivo

engine-e-naif-kernel-bad-daf-address-range = rango de direcciones DAF no válido { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = la lista de resúmenes DAF no termina

engine-e-naif-kernel-daf-summary-record-claims-summaries = el registro de resúmenes DAF { $rec } declara { $count } resúmenes

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = segmento de tipo 2 mal formado: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = el tamaño del segmento de tipo 2 no coincide con su directorio

engine-e-naif-kernel-epoch-outside-the-record = la época { $et } está fuera del registro [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = el tamaño del segmento de tipo 1 no coincide con su N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = registro de tipo 1 mal formado: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = no es un SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = el resumen SPK no es ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = no hay datos SPK de tipo 1/2 para el cuerpo { $target } en ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = el segmento SPK de { $target } está en el marco { $frame }, no en J2000

engine-e-naif-kernel-spk-centre-chain-does-not = la cadena de centros SPK no llega al baricentro

engine-e-naif-kernel-not-binary-pck = no es un PCK binario: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = el resumen PCK no es ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = no hay datos PCK de tipo 2 para el marco { $body_frame } en ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = el marco PCK { $body_frame } se da respecto del marco { $other }, que no es J2000 ni ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = número no válido { $s }

engine-e-navsignal-must-be-positive-number = { $s } debe ser un número positivo

engine-e-navsignal-modulation-expected-name-args-bpsk = modulación { $label }: se esperaba NAME(args), por ejemplo BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulación { $label }: falta el paréntesis de cierre

engine-e-navsignal-modulation-is-not-one-of = la modulación { $label } no es ninguna de BPSK(n), BOC(m,n) o MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = entidad sin terminar en { $s }

engine-e-ndm-xml-bad-character-reference = referencia de carácter no válida &{ $ent };

engine-e-ndm-xml-unknown-entity = entidad desconocida &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = instrucción de procesamiento sin terminar

engine-e-ndm-xml-unterminated-comment = comentario sin terminar

engine-e-ndm-xml-unterminated-declaration = declaración sin terminar

engine-e-ndm-xml-expected-an-element-at-byte = se esperaba un elemento en el byte { $pos }

engine-e-ndm-xml-unterminated-start-tag = etiqueta de apertura sin terminar

engine-e-ndm-xml-attribute-without-value = atributo sin valor

engine-e-ndm-xml-unterminated-attribute-value = valor de atributo sin terminar

engine-e-ndm-xml-unterminated-end-tag = etiqueta de cierre sin terminar

engine-e-ndm-xml-unterminated-cdata = CDATA sin terminar

engine-e-ndm-xml-content-after-the-root-element = contenido después del elemento raíz

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } debe ser finito y no negativo

engine-e-nma-budget-subframe-must-be-positive = subframe_s debe ser positivo

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps debe ser positivo

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed debe ser 0 o positivo

engine-e-nmea-synth-cli-unexpected-argument = argumento inesperado { $s }

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = registro del instructor: { $e }

engine-nmea-synth-cli-instructor-log-and = registro del instructor: { $jp } y { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = servidor TCP escuchando en { $s }; esperando { $wait_clients } cliente(s)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = se esperaba YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = fecha u hora fuera de rango (años 1980 a 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = no existe tal fecha de calendario

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } debe ser un número finito

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s debe estar entre 1 y 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz debe ser 1, 2, 5 o 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = la posición del buque debe estar a menos de 89 grados del ecuador

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn debe estar entre 0 y 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = los límites de velocidad de giro y de aceleración del buque deben ser positivos

engine-e-nmea-synth-config-give-at-least-one-waypoint = indique al menos un [[waypoint]] o vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = el waypoint { $v1 } está fuera de rango

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = el speed_kn del waypoint { $v1 } debe estar entre 0 y 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems debe nombrar al menos una constelación

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } no es ninguna de { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s debe ser al menos 1

engine-e-nmea-synth-config-event = evento { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s debe estar dentro de la ejecución

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s debe ser positivo; ramp_s y recovery_s no negativos

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s no debe superar duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } no se aplica a este tipo

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz debe estar entre 20 y 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db es obligatorio

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db debe estar entre 0 y 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db debe estar entre 0 y 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m es obligatorio

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m debe estar entre 0 y 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = el arrastre aceleraría la pista falsa hasta { $need } m/s^2, por encima de max_accel_mps2 = { $a }; alargue ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = indique exactamente uno de bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s es obligatorio

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s debe ser distinto de cero y de menos de un día

engine-e-nmea-synth-config-delay-is-required = delay_s es obligatorio

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s debe estar entre 0 y 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = el perfil de horizonte no describe ninguna obstrucción

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } ha terminado

engine-nmea-synth-gen-the-receiver-reports-fix-again = el receptor vuelve a informar una solución de posición ({ $n_used } satélites utilizados)

engine-nmea-synth-gen-the-receiver-has-no-fix = el receptor no tiene solución de posición ({ $n_used } satélites utilizables, se necesitan cuatro)

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = desde T+{ $start_s } s durante { $duration_s } s (rampa de inicio { $ramp_s } s, rampa de recuperación { $recovery_s } s)

engine-nmea-synth-log-every-tracked-satellite-shows-db = ; cada satélite seguido muestra { $c } dB-Hz mientras dure

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: el C/N0 recibido cae hasta { $cn0_drop_db } dB (dispersión por satélite { $spread_db } dB); los satélites se pierden y la solución de posición se pierde cuando quedan menos de cuatro utilizables

engine-nmea-synth-log-towards-deg-true = hacia { $b } deg verdaderos

engine-nmea-synth-log-towards-deg-true-deg-relative = hacia { $t } deg verdaderos ({ $r } deg relativos al rumbo al inicio, y luego se mantiene)

engine-nmea-synth-log-position-drag-off-the-reported = arrastre de posición: la posición informada se aleja { $final_offset_m } m { $dir } mientras el receptor mantiene una solución de posición válida (la pista falsa alcanza un máximo de { $pv } m/s y { $pa } m/s^2){ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = spoofing de hora: el UTC informado se desplaza { $offset_s } s respecto del real; la posición sigue siendo la real{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = retardo de repetición (al estilo del meaconing): la posición{ $v1 } se retrasa { $delay_s } s respecto de la referencia{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = degradación natural: el cielo se cierra tras un perfil de horizonte indicado ({ $e }); los satélites tras él siguen listados sin SNR y no se utilizan, el C/N0 del resto no cambia y nada es falso

engine-nmea-synth-log-instructor-log = REGISTRO DEL INSTRUCTOR: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Nota del instructor: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Inicio { $start_utc }   duración { $duration_s } s   semilla { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }PICOS  real: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   informado: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: constelación desconocida { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }La tolerancia está por debajo del piso de ruido de lectura de rango en f64 { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): su piso de valor propio equivalente rel_tol^2 = { $v1 } queda bajo el ruido de redondeo de la matriz de Gram, por lo que las direcciones adicionales son residuo aritmético, no observabilidad.

engine-observability-gramian-rank-clamped-from-the-singular = rango limitado desde el recuento de valores singulares { $counted } a min(filas, columnas) = min({ $n_rows }, { $n_cols }) = { $shape_bound } con rel_tol { $rel_tol }: una matriz de { $n_rows }x{ $n_cols } no puede tener rango { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP no definido (geometría de rango deficiente / singular): rango { $rank } de { $n } estados, defecto de datum { $v3 }, condición { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bytes no son un número entero de registros de 36 bytes

engine-e-odf-record-precedes-any-group-header = el registro { $v1 } precede a cualquier encabezado de grupo

engine-e-odf-no-orbit-data-group = no hay grupo de datos de órbita

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } no es una palabra clave de { $name }

engine-e-odm-without = { $name } sin { $k }

engine-e-odm-needs-exactly-one-of = { $name } requiere exactamente uno de { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION y MESSAGE_ID son palabras clave de encabezado de la versión 3.0 (versión { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = línea inesperada { $b }

engine-e-odm-unknown-keyword = palabra clave desconocida { $k }

engine-e-odm-block-repeated-or-out-of = bloque { $block } repetido o fuera de orden en { $key }

engine-e-odm-repeated = { $key } repetido

engine-e-odm-comments-after-the-last-keyword = comentarios después de la última palabra clave

engine-e-odm-given-twice = { $b } indicado dos veces

engine-e-odm-opm-without-metadata = OPM sin metadatos

engine-e-odm-opm-without-state-vector = OPM sin vector de estado

engine-e-odm-omm-without-metadata = OMM sin metadatos

engine-e-odm-omm-without-mean-elements = OMM sin elementos medios

engine-e-odm-is-not-keyword-of-the = { $k } no es una palabra clave del bloque { $kind }

engine-e-odm-block-without = bloque { $kind } sin { $k }

engine-e-odm-block-with-data-lines = bloque { $kind } con líneas de datos

engine-e-odm-line-has-values-expected = la línea { $l } del bloque { $kind } tiene { $l2 } valores, se esperaban { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } no es una palabra clave de metadatos de OCM

engine-e-odm-ocm-metadata-without = metadatos de OCM sin { $k }

engine-e-odm-block-repeated = bloque { $kind } repetido

engine-e-odm-inside-block = { $t } dentro de un bloque

engine-e-odm-unsupported-ocm-block = bloque OCM no admitido { $tag }

engine-odm-outside-block = { $t } fuera de un bloque

engine-e-odm-closes-block = { $t } cierra un bloque { $want }

engine-e-odm-unexpected-line-2 = línea inesperada { $t }

engine-e-odm-outside-block = { $k } fuera de un bloque

engine-e-odm-unterminated-block = bloque sin terminar

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = a la época le falta el separador 'T' de fecha/hora: { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = fecha de época OEM no admitida '{ $date }' (se esperaba yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = hora de época OEM no admitida '{ $time }' (se esperaba HH:MM:SS)

engine-e-oem-bad-epoch-year = año de época no válido: { $d }

engine-e-oem-bad-epoch-month = mes de época no válido: { $d }

engine-e-oem-bad-epoch-day = día de época no válido: { $d }

engine-e-oem-bad-epoch-hour = hora de época no válida: { $t }

engine-e-oem-bad-epoch-minute = minuto de época no válido: { $t }

engine-e-oem-bad-epoch-second = segundo de época no válido: { $t }

engine-e-oem-oem-epoch-field-out-of = campo de época OEM fuera de rango: { $s }

engine-e-oem-unexpected-oem-header-line = línea de encabezado OEM inesperada: { $line }

engine-e-oem-expected-meta-start-found = se esperaba META_START, se encontró: { $line }

engine-e-oem-unexpected-oem-metadata-line = línea de metadatos OEM inesperada: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = a los metadatos del segmento OEM les falta META_STOP

engine-e-oem-oem-metadata-missing-object-name = a los metadatos OEM les falta OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = a los metadatos OEM les falta OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = a los metadatos OEM les falta CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = a los metadatos OEM les falta REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = a los metadatos OEM les falta TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = a los metadatos OEM les falta START_TIME

engine-e-oem-oem-metadata-missing-stop-time = a los metadatos OEM les falta STOP_TIME

engine-e-oem-oem-data-line-needs-position = la línea de datos OEM requiere componentes de posición+velocidad (6) o +aceleración (9), se obtuvieron { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = valor de estado OEM no numérico '{ $t }' en: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = al OEM le falta el encabezado CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = al OEM le falta el encabezado CREATION_DATE

engine-e-oem-oem-missing-originator-header = al OEM le falta el encabezado ORIGINATOR

engine-e-oem-oem-carried-no-segments = el OEM no contenía segmentos

engine-oem-oem-interop-round-tripped-segment = oem-interop: ida y vuelta de { $segments } segmento(s), { $n_states_total } estados; error máximo de ida y vuelta { $p } km / { $v } km/s (interoperabilidad MODELLED)

engine-oem-oem-interop-ingested-segment-states = oem-interop: se ingirieron { $segments } segmento(s), { $n_states_total } estados de un OEM externo (originador { $originator }) (interoperabilidad MODELLED)

engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = no hay bloque COVARIANCE_START

engine-e-oem-no-covariance-stop = no hay COVARIANCE_STOP

engine-e-oem-bad-covariance-value = valor de covarianza no válido '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = se esperaban 21 valores de covarianza, se encontraron { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = la exportación OMM requiere TLE completos (línea 1 + línea 2); este bloque no tiene ninguno

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

engine-e-optical-atmosphere-scenario-must-be-in = { $n } debe estar en [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg debe estar en [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave debe ser "plane" o "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction debe ser "downlink" o "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = las entradas de availability_targets_pct deben estar en (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h debe ser como máximo 8760 (un año)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } pasos superan los { $MAX_STEPS } que admite un resultado; aumente step_s o acorte duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = clase de reloj desconocida "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = cada sitio requiere un nombre

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = sitio { $name }: latitud/longitud fuera de rango

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = sitio { $name }: altitude_m debe estar en [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm a { $elevation_deg } deg de elevación, margen { $margin0 } dB antes de la atmósfera; mejor sitio { $scn } { $v5 } %; red de { $order } sitios { $last } % con meteorología independiente / { $last2 } % con meteorología correlacionada (MODELLED, orientativo)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = se analizó el bloque rinex pero no contenía efemérides admitidas

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg debe estar en [-90, 90] y todos los campos deben ser finitos

engine-e-orbit-no-satellites-to-export = no hay satélites que exportar

engine-e-orbit-time-step-must-be-positive = time.step_s debe ser positivo para la exportación SP3

engine-e-orbit-time-step-must-be-positive-2 = time.step_s debe ser positivo para la exportación OEM

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } debe ser positivo; se obtuvo { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s debe ser finito y no negativo

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate debe ser finito y no negativo

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = la elevación mínima del spoofer debe estar en [0, 90) grados

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns de la verificación cruzada debe ser finito y no negativo

engine-orbital-timing-the-in-plane-neighbour-degrees = el vecino en el mismo plano, { $v1 } grados por delante, queda fuera de la huella de un solo spoofer ({ $v2 } grados de ancho)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = el vecino en el mismo plano, { $v1 } grados por delante, puede quedar dentro de la huella del mismo spoofer ({ $v2 } grados de ancho), de modo que ambos relojes pueden ser arrastrados a la vez

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = falta el archivo de entrada

engine-e-osnma-cli-max-time-error-has-no = --max-time-error no tiene efecto sin --reference-time

engine-e-osnma-cli-not-number = no es un número: { $s }

engine-e-osnma-cli-public-key-must-be-id = la clave pública debe ser ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = el tipo de clave pública debe ser p256 o p521

engine-e-osnma-cli-unknown-format = formato desconocido { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } no es texto; use --format ubx para un flujo UBX

engine-e-osnma-cli-vector-csv-needs-start-gst = un CSV de vectores requiere --start-gst o un nombre de archivo con fecha

# legal: native review
engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    error: no se puede leer { $input }: { $e }

# legal: native review
engine-osnma-cli-galileo-osnma-verification =
    Verificación OSNMA de Galileo
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = entrada: { $input } ({ $pages } páginas)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: { $frames } tramas; { $inav_pages } páginas I/NAV decodificadas, { $pages } ubicadas en el tiempo ({ $bad_crc } con CRC erróneo, { $unstamped } no ubicables, { $time_conflicts } conflictos de tiempo)

engine-osnma-cli-overall-nma-status = global: { $status_word }   estado NMA: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALERTA: se recibió un mensaje de alerta OSNMA verificado. Deje de usar los datos OSNMA; nada se informa como autenticado.

engine-osnma-cli-freshness-not-enforced-no-reference = vigencia: NO se exige. No se indicó ninguna hora de referencia, por lo que las horas de subtrama se toman de la entrada y una repetición de datos antiguos se autenticaría.

engine-osnma-cli-freshness-sub-frames-within-of = vigencia: se usan las subtramas a menos de { $max_err } s de la hora de referencia { $v2 }; { $set_aside } se apartaron. Una hora de referencia es un único instante.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satélite   estado          autenticado  fallido  pendiente  descartado  última autenticación

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }época (subtrama de etiqueta)      tx   datos  adkd  ctr  resultado

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = línea { $v1 }: se esperaban 3 campos

engine-e-osnma-input-line-bad-svid = línea { $v1 }: SVID no válido

engine-e-osnma-input-line-bad-bit-count = línea { $v1 }: recuento de bits no válido

engine-e-osnma-input-line-data-is-not-hex = línea { $v1 }: los datos no son hexadecimales

engine-e-osnma-input-line-bit-count-does-not = línea { $v1 }: el recuento de bits no coincide con los datos

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = la tolerancia de tiempo debe ser inferior a una subtrama ({ $SUBFRAME_S } s), se obtuvo { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = la refracción ITU-R P.834 está definida para alturas de estación de 0 a 3 km; se obtuvo { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s y step_s deben ser positivos

engine-e-passes-station-lat-deg-must-be = station_lat_deg debe estar en [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg debe estar en [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours debe ser finito y positivo

engine-e-passes-step-must-be-finite-and = step_s debe ser finito y positivo

engine-passes-passes-pass-es-of-km = pasadas: { $passes } pasada(s) de una órbita de { $altitude_km } km / { $inclination_deg }° sobre ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° en { $duration_hours } h; { $total_access_s } s de acceso total (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = registro { $record } corto: { $line }

engine-e-precise-products-bad-number-in = número no válido { $s } en { $line }

engine-e-precise-products-bad-field-in = campo no válido { $s } en { $line }

engine-e-precise-products-bad-antex-epoch = época ANTEX no válida { $s }

engine-e-precise-products-bad-offset = desfase no válido { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = el proveedor de efemérides no tiene { $name } geocéntrico en JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| error 3D RMS { $rms } m (máx. { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS posterior al ajuste { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } sat nav | { $epochs_solved }/{ $epochs_total } épocas resueltas | media de { $mean_n_used } sats, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Posicionamiento de punto único — error 3D frente a la coordenada de referencia topográfica (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Posicionamiento de punto único — RMS del residuo posterior al ajuste (media de { $mean_postfit_rms_m } m)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = los accesores de matriz de RunOutput requieren NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } no es una matriz numérica (una lista de números, o de listas de números de igual longitud)

engine-e-python-is-not-non-empty-list = { $path } no es una lista no vacía de registros

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-e-python-and-must-be-the-same = i y q deben tener la misma longitud ({ $i } frente a { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: no adquirido (estadístico { $statistic } < umbral { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } canales (diseño, PRN); como máximo 256 por barrido

engine-python-not-acquired-statistic-threshold = { $code }: no adquirido (estadístico { $statistic } < umbral { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] requiere `label`

engine-e-python-runs-needs-result = runs[{ $i }] requiere `result`

engine-e-python-must-be-between-and-32 = { $name } debe estar entre 0 y 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | semilla { $seed } | v{ $engine_version } | lo cuántico gana { $value }/{ $foms } FoM | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } de { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = baseline_clock_class desconocida '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = candidate_clock_class desconocida '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = los taus/valores de ADEV deben ser finitos y > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | candidato { $candidate_source } | holdover de temporización { $timing_holdover_s }s frente a { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inercial { $inertial_holdover_s }s frente a { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | marcha en inercia de resiliencia { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = el archivo de relojes RINEX declara el sistema de tiempo { $id }, que este lector no conoce (conocidos: { $known_clock_time_systems }); se rechaza en lugar de leer sus épocas como tiempo GPS

engine-e-realdata-clk-rinex-clock-file-has-satellite = el archivo de relojes RINEX tiene el sistema de satélites { $other } y no declara TIME SYSTEM ID; se rechaza en lugar de suponer el sistema de tiempo de sus épocas

engine-e-realdata-clk-rinex-clock-files-declare-different = los archivos de relojes RINEX declaran sistemas de tiempo distintos ({ $s } y { $ts }); se rechaza unirlos en un mismo eje de tiempo

engine-e-realdata-clk-no-as-or-ar-records = no hay registros AS ni AR para { $id }

engine-e-realdata-clk-short-circular-row = fila Circular T corta: { $t }

engine-e-realdata-clk-bad-value-in = valor no válido { $s } en { $t }

engine-e-realdata-clk-no-section-mjd-header-found = no se encontró el encabezado MJD de la Sección 1

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = etiqueta de cierre sin terminar

engine-e-realdata-ion-sdr-unbalanced-closing-tag = etiqueta de cierre sin pareja

engine-e-realdata-ion-sdr-unterminated-tag = etiqueta sin terminar

engine-e-realdata-ion-sdr-attribute-value-missing = falta el valor del atributo

engine-e-realdata-ion-sdr-element-outside-the-document = elemento fuera del documento

engine-e-realdata-ion-sdr-text-outside-the-document = texto fuera del documento

engine-e-realdata-ion-sdr-element-left-open = { $stack } elemento(s) sin cerrar

engine-e-realdata-ion-sdr-expected-one-root-element-found = se esperaba un elemento raíz, se encontraron { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = formato de frecuencia desconocido { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = codificación no admitida { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } flujos: solo se leen archivos de un único flujo

engine-e-realdata-ion-sdr-block-of-cycles-with-header = se repite un bloque de { $cycles } ciclos con encabezado o pie; solo se lee un único bloque que abarque el archivo

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = fragmento de { $words_per_chunk } palabras de { $word_bytes } bytes

engine-e-realdata-ion-sdr-unsupported-sample-format = formato de muestra no admitido { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = cuantización { $quantization } en { $packed_bits } bits empaquetados por muestra

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = una frecuencia de muestreo de { $sample_rate_hz } Hz no es un múltiplo entero del factor de tasa { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = un fragmento no contiene ningún grupo completo

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = muestras { $start }..{ $v1 } solicitadas, el archivo contiene { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = versión de CRD ilegible { $f }

engine-realdata-llr-crd-crd-format-version-is-not = la versión { $v } del formato CRD no es admitida (solo 1 y 2 comparten el orden de campos del registro 11 en el que se basa este lector)

engine-realdata-llr-crd-unreadable-station-id = identificador de estación ilegible { $f }

engine-realdata-llr-crd-unreadable-time-scale = escala de tiempo ilegible { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = la escala de tiempo de época de CRD { $time_scale } no es una de las tres que la especificación del formato indica que los analistas aceptan (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); se rechaza leerla como UTC

engine-realdata-llr-crd-unreadable-h4-field = campo h4 ilegible { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = campo ilegible { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = evento de época ilegible { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = tiempo de vuelo no físico { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = no se puede leer el directorio de puntos normales { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = no hay archivos de puntos normales *.npt en { $dir } — este escenario lee mediciones reales archivadas y no se ejecutará sin ellas

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = número no válido '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = el DEM tiene una dimensión cero

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = codificación { $encoding }: un lote LuGRE está en complemento a dos

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bytes: más corto que el encabezado IQS

engine-e-realdata-lugre-not-an-iqs-frame = no es una trama IQS: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = frecuencia de muestreo: metadatos { $sample_rate_hz } Hz, encabezado { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = cuantización: metadatos { $quantization } bits, encabezado { $quant_bits } bits

engine-realdata-lugre-centre-frequency-metadata-hz-header = frecuencia central: metadatos { $center_freq_hz } Hz, encabezado { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = frecuencia intermedia: metadatos { $translated_freq_hz } Hz, encabezado { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = número de muestras: el diseño de los metadatos da { $layout }, encabezado { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = encabezado/pie: metadatos { $header_bytes }/{ $footer_bytes } bytes, formato { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = la longitud de archivo { $file_len } no es encabezado + { $value } bytes de muestras + pie

engine-realdata-lugre-field-missing = falta el campo { $key }

engine-e-realdata-lugre-field-unreadable = el campo { $key } es ilegible

engine-realdata-lugre-raw-line = línea RAW { $v1 }: { $e }

engine-realdata-lugre-acq-line = línea ACQ { $v1 }: { $e }

engine-realdata-lugre-nav-line = línea NAV { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = fila CLK { $v1 }: ilegible

engine-e-realdata-lugre-clk-row-columns-expected = fila CLK { $v1 }: { $v } columnas, se esperaban 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = análisis de JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = se esperaba un objeto JSON en el nivel superior

engine-e-realdata-yunnan-missing-recordtime-array = falta la matriz recordTime

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = no se puede leer el archivo EOP { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s debe ser finito y no negativo, se obtuvo { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = no se puede leer el archivo EOP de versión posterior { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = VACÍA, y a propósito: una fila de predicho frente a definitivo necesita una época de emisión con una ventana de ajuste COMPLETA de { $window_days } días detrás y un Bulletin B definitivo publicado en la época objetivo. La entrada en uso ({ $eop_source }) no aporta ninguna época que reúna ambas condiciones. Acorte `operational_window_days` o aporte una serie finals2000A real más larga — no se fabrica ninguna fila para rellenar la tabla.

engine-realtime-frame-eop-measured-over-the-real-series = Medido sobre la serie real en uso ({ $eop_source }). Cada fila es un error de predicción genuino: un pronóstico para T+h formado a partir de filas rápidas del Bulletin A en T o antes, evaluado frente al Bulletin B definitivo PUBLICADO DESPUÉS en T+h. La persistencia se evalúa sobre el mismo conjunto de épocas frente a los mismos valores definitivos, de modo que las dos columnas difieren en el predictor y en nada más. Un `improvement_factor` inferior a 1 significa que el predictor operativo es PEOR que la persistencia en ese horizonte, y así se informa.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Medido sobre un par genuino de dos versiones: la versión tal como se emitió ({ $eop_source }) contiene predicciones reales del Bulletin A más allá de su propio límite de datos, y la versión posterior archivada ({ $c }) contiene los valores definitivos del Bulletin B que esas fechas acabaron recibiendo. Se evalúan tres pronósticos frente a ese valor definitivo: la propia predicción archivada del Bulletin A, el ajuste de estilo operativo de este crate sobre la versión tal como se emitió y la persistencia en el límite de datos.

engine-realtime-frame-eop-empty-and-deliberately-so-later = VACÍA, y a propósito: se aportó una versión posterior ({ $c }) pero ninguna fecha figura como PREDICCIÓN del Bulletin A en el archivo tal como se emitió ({ $eop_source }) y como valor DEFINITIVO del Bulletin B en el posterior en ningún horizonte solicitado. No se sintetiza ninguna fila.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = VACÍA, y a propósito. Evaluar una predicción ARCHIVADA GENUINA requiere dos versiones del mismo producto finals2000A; a esta ejecución se le dio una ({ $eop_source }). El repositorio no incluye ninguna versión anterior archivada, y NO se fabrica una perturbando la versión que tiene — un archivo sintetizado haría de cada número de esta tabla una medición de la perturbación. Aporte una versión posterior archivada real mediante `eop_finals2000a_later` para rellenarla. Hasta entonces, los errores genuinos de predicho frente a definitivo que este informe sí contiene están en `table5_operational_vs_persistence`, donde el pronóstico es el propio de este crate y la referencia es el Bulletin B definitivo publicado después.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabla 1: posprocesado { $c } m ({ $c2 } ms UT1) ↔ tiempo real { $c3 } m ({ $c4 } ms UT1) | Tabla 2: piso definitivo { $floor } ms → { $far } días { $far2 } ms | presupuesto total { $total_m } m ({ $total_time_ns } ns) | brazo de palanca L19 + datos reales L18 (verificado), cov. de OD (calculado a partir de un modelo)

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

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Medido sobre un par genuino de dos versiones: el UT1 PREDICHO del Bulletin A del archivo tal como se emitió ({ $eop_source }) diferenciado respecto al valor DEFINITIVO final del Bulletin B de la versión posterior archivada ({ $c }), en { $predicted_vs_final } horizonte(s).

engine-realtime-frame-eop-empty-and-deliberately-so-an = VACÍA, y a propósito: se aportó una versión posterior archivada ({ $c }) pero ninguna fecha figura como PREDICCIÓN del Bulletin A en el archivo tal como se emitió ({ $eop_source }) y como valor DEFINITIVO del Bulletin B en el posterior en ningún horizonte solicitado, por lo que no hay residuo de predicho frente a definitivo que informar. No se sintetiza ninguna fila.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = VACÍA, y a propósito: un residuo de predicho frente a definitivo requiere DOS versiones del mismo producto finals2000A. A esta ejecución se le dio una ({ $eop_source }). Sus filas de predicción del Bulletin A corresponden a fechas futuras que aún no tienen valor definitivo del Bulletin B, de modo que el residuo no existe para ser medido y aquí no se inventa ninguno. Aporte una versión posterior archivada mediante `eop_finals2000a_later` para rellenar esta tabla. Hasta entonces, el crecimiento a varios días que se informa en `table2_error_vs_horizon` corresponde al predictor de PERSISTENCIA evaluado sobre los valores definitivos reales — un error medido real, pero de un predictor calculado a partir de un modelo, y no el residuo de predicción del Bulletin A del IERS.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = una evaluación de buque requiere [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = el extracto es de { $excerpt } bytes; el límite es { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = el extracto contiene más de { $MAX_EXCERPT_EPOCHS } épocas; acórtelo

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = el extracto termina dentro de la ventana de calibración de { $calibration_s } s ({ $epochs } épocas): no se evaluó nada

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = no hay ninguna época etiquetada en UTC en el registro UBX

engine-e-receiver-trust-calibration-no-scenario-json-under = no hay scenario.json en { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: Pfa limpia reservada <= { $B1_MAX_PFA } (calibrada: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } debe ser finito y > 0 (se obtuvo { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel debe ser finito y >= 0 (se obtuvo { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used debe ser al menos 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg debe estar en [0, 90] (se obtuvo { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg debe estar en (0, 360] (se obtuvo { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points debe estar en [0, 100] (se obtuvo { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio debe ser finito y > 1 (se obtuvo { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor debe estar en (0, 100] (se obtuvo { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) está por debajo del degraded_min de la puntuación ({ $degraded_min }): la geometría por sí sola podría alcanzar la banda no confiable

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites = geometría { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satélites{ $v6 }

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: la deducción por geometría se clasifica como inconsistencia

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: se informa, no se puntúa (la geometría no es deficiente)

engine-receiver-trust-geometry-not-scored-the-score-deducts = no se puntúa (la puntuación solo deduce por encima de HDOP { $hdop_max }, PDOP { $pdop_max } o por debajo de { $min_used } satélites)

engine-receiver-trust-geometry-derived-from-logged-satellites = derivado de { $n } satélites registrados

engine-receiver-trust-geometry-as-the-receiver-reports-it = según lo informa el receptor, { $n } satélites utilizados

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = el HDOP declarado { $fmt_dop } discrepa del HDOP { $fmt_dop2 } derivado del cielo declarado más allá de la tolerancia

engine-receiver-trust-geometry-satellites-in-view-but-not = satélites a la vista pero no seguidos ({ $g } de { $in_view } a { $low_elev_deg } deg o más): entorno de señal, no geometría

engine-receiver-trust-geometry-satellites-fewer-than = { $n } satélites, menos de { $min_used }

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } por encima de { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } por encima de { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satélites detrás de la línea de horizonte declarada

engine-receiver-trust-geometry-every-satellite-in-one-half = todos los satélites en una mitad del cielo (hueco { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = degradada por la geometría: { $parts } ({ $from }); no es una inconsistencia

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = el registro no contiene épocas: nada en él se pudo leer como { $name } ({ $skipped_records } registros omitidos por estar dañados o no ser analizables); compruebe el ajuste de formato

engine-receiver-trust-ingest-gps-week-tow = semana GPS { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = semana GPS { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = TOW GPS { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (fecha ausente del registro)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } debe ser finito y >= 0 (se obtuvo { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s debe ser mayor que 0

engine-e-receiver-trust-live-invalid-session = sesión no válida: { $e }

engine-receiver-trust-live-no-score-could-be-produced = no se pudo producir ninguna puntuación: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = no se pudo leer ningún registro synchro o pvt de GNSS-SDR ({ $skipped } líneas omitidas); consulte integrations/gnss-sdr/README.md para el formato de línea

engine-receiver-trust-machines-gnss-sdr-gps-tow = TOW GPS { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = el archivo IMU está vacío

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: no hay columna `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: no hay columna `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = el archivo IMU no contiene ninguna muestra legible

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis debe ser 0, 1 o 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean debe ser finito

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at = el registro tiene { $n } muestras; se necesitan al menos { $MIN_SAMPLES } para un ajuste de Allan

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = el tiempo del registro no avanza

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = el intervalo de muestreo no es uniforme ({ $uneven } de { $n } intervalos difieren en más de un 25 %): remuestree el registro primero

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = el registro es demasiado corto para formar una curva de Allan

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = la pendiente inicial de la curva { $name } es { $v }, no aproximadamente -0.5: el ruido blanco no domina (¿está quieto el sensor?), por lo que su coeficiente de ruido no es fiable

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = la curva { $name } es demasiado corta para comprobar su pendiente

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

engine-receiver-trust-machines-novatel-gps-week-tow = semana GPS { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = no se pudo leer ningún registro BESTPOS, RANGE o RXSTATUS ({ $skipped } registros omitidos)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = no se encontró ninguna trama RTCM 3 válida ({ $skipped } candidatas fallaron la CRC)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } debe ser finito y > 0 (se obtuvo { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard debe estar en (0, 1) (se obtuvo { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac debe estar en [0, 1] (se obtuvo { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } debe estar en (0, 1) (se obtuvo { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats debe ser al menos 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s debe ser al menos 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = configuración de monitores: perfil desconocido "{ $other }"; conocidos: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = configuración de monitores: { $name } debe ser finito y > 0 (se obtuvo { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = configuración de monitores: jam_ind_threshold debe ser finito

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = configuración de monitores: mask_deg debe estar en [-90, 90) (se obtuvo { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = configuración de monitores: raim_pfa debe estar en (0, 1) (se obtuvo { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = configuración de monitores: cn0_min_sats debe ser al menos 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = configuración de monitores: sats_lost debe ser al menos 1

engine-receiver-trust-monitors-the-receiver-own-set-against = el conjunto propio del receptor { $self_report_source } frente a los monitores de Kshana; ninguno es la referencia, la coincidencia no equivale a verificación

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = la cronología del receptor tiene un tiempo de época no finito

engine-e-receiver-trust-monitors-the-log-is-shorter-than = el registro es más corto que la ventana de calibración: { $calibration_epochs } época(s) antes de { $cal_s } s (el registro abarca { $span } s); se necesitan al menos 3 para formar la línea base

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } debe estar en ({ $lo }, { $hi }] (se obtuvo { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } solo se aplica a kind = "vessel" (kind es "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = no se puede leer { $path }: la compilación WebAssembly no tiene sistema de archivos; indique el archivo en línea como `text` o `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` no es base64 estándar válido

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: indique uno de `path`, `text` o `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: indique solo uno de `path`, `text` o `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } debe ser un número positivo, se obtuvo { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = evento { $label }: onset_s debe ser un número no negativo

engine-e-receiver-trust-scenario-event-end-must-be-after = evento { $label }: end_s debe ser posterior a onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg y time_offset_s deben ser finitos

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = confiable en todo momento: ningún monitor alarmó en { $after_cal } épocas tras la calibración

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = primera alarma a { $t } s; no confiable durante { $untrusted_epochs } y degradada durante { $degraded_epochs } de { $after_cal } épocas tras la calibración

engine-receiver-trust-scenario-of-stated-events-detected-within = ; { $events_detected } de { $events_evaluable } eventos declarados detectados en { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = ; { $predictions_agreeing } de { $predictions_evaluable } predicciones de C/N0 dentro de { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = ; puntuación de confianza mínima { $min }, final { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = escenario { $r } | receiver-trust | registro { $format_name }, { $epochs } épocas en { $duration_s } s | monitores { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = este es un escenario { $k }, no uno de receiver-trust

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } debe ser finito (se obtuvo { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: se requiere 0 < degraded_min < nominal_min <= 100 (se obtuvo { $degraded_min } y { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s debe ser finito y >= 0 (se obtuvo { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: se requiere 0 <= onset_ratio < full_ratio (se obtuvo { $onset_ratio } y { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: el peso de { $m } debe estar en [0, 100] (se obtuvo { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s debe ser finito y positivo

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg debe estar en (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 debe ser finito y positivo

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m y rho0_kg_m3 deben ser finitos y positivos

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m debe estar en [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = reentrada (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> pico { $v3 } g a { $v4 } km, { $velocity_at_peak_deceleration } m/s; el calentamiento alcanza su pico a { $velocity_at_peak_heating } m/s; masa puntual (gravedad, curvatura, US76) pico { $peak_deceleration_g } g (balístico MODELLED, sin aerotermia)

## src/registry.rs

engine-e-registry-unknown-scenario-id = identificador de escenario desconocido: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = la banda TRL ({ $lo },{ $hi }) no está bien formada (se requiere 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = Una afirmación calculada a partir de un modelo (solo simulación) no puede ser representativa por encima de TRL { $MODELLED_TRL_CEILING } (banda hi={ $hi }); un TRL superior es una brecha, no un resultado de simulación

engine-representativeness-representativeness-representative-for-trl = Representatividad [{ $status }] — { $claim } (representativa para TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = declarado({ $arch }) x calidad media de las fuentes

engine-resilience-score-weakest-rpcf-sub-score-bounded = subpuntuación RPCF más débil = { $min_sub }; degradación acotada = { $bounded } (limita al nivel 2 si no está acotada)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = encabezado de registro de navegación no admitido { $head }: una línea que empieza por '>' es un encabezado de registro RINEX 4, no un registro de navegación RINEX 3

engine-e-rinex-bad-prn-in = PRN no válido en { $head }

engine-e-rinex-rinex-navigation-expected-record-header = navegación RINEX 4: se esperaba un encabezado de registro '>', se encontró { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = el registro RINEX 4 { $head } tiene { $body } líneas, unas efemérides { $msg } necesitan 8

engine-e-rinex-rinex-record-is-followed-by = el registro RINEX 4 { $head } va seguido de { $body }, no de { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = { $what } no válido: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = el archivo de observación RINEX no tiene END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = el archivo de observación RINEX no contenía registros de época

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s debe ser finito y > 0 (se obtuvo { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s debe ser finito y > 0 (se obtuvo { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) no debe superar time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps = cuadrícula de tiempo demasiado grande: { $n } pasos superan MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); use un paso más grueso o una duración más corta

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = la frecuencia de muestreo es conmensurable con la tasa de código ({ $samples_per_chip } muestras/chip, a { $offset_from_integer_samples } muestras de un número entero): la réplica de código con retención de orden cero no puede resolver un cambio de fase de código inferior a { $dead_band_chips } chips, por lo que el discriminador Early/Late es una escalera con una banda muerta de una muestra en lugar de un triángulo y el DLL se estabiliza en un retardo erróneo. Desplace la frecuencia de muestreo respecto del múltiplo entero (5 MHz es 4.8876 muestras/chip; 25 MHz es 24.4379) o sobremuestree lo suficiente para que la banda muerta quede por debajo de la exactitud de fase de código que necesite.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = código de error de SGP4 { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = core:datatype de SigMF no admitido { $other }: este lector admite los tipos complejos cf32_le, ci16_le y ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: solo se leen grabaciones de un solo canal

engine-e-sigmf-cannot-serialise-sigmf-metadata = no se pueden serializar los metadatos de SigMF: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = espacio de nombres de extensión de SigMF no válido { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } mapas de extensión de anotación para { $annotations2 } anotaciones

engine-e-sigmf-extension-key-is-not-in = la clave de extensión { $k } no está en el espacio de nombres { $ns }

engine-e-sigmf-extension-key-is-already-present = la clave de extensión { $k } ya está presente

engine-e-sigmf-global-is-not-an-object = global no es un objeto

engine-e-sigmf-annotations-is-not-an-array = annotations no es una matriz

engine-e-sigmf-annotation-is-not-an-object = la anotación no es un objeto

engine-e-sigmf-invalid-sigmf-metadata-json = JSON de metadatos de SigMF no válido: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = la grabación SigMF no indica ningún core:sample_rate positivo

engine-e-sigmf-sigmf-capture-starts-at-sample = la captura SigMF comienza en la muestra { $start }, más allá de las { $data } muestras de los datos

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } debe estar en [0, 90) grados, se obtuvo { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } debe ser un número finito, se obtuvo { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: un cañón requiere width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m debe ser positivo, se obtuvo { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: las alturas del cañón y antenna_m deben ser no negativas

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m debe ser positivo, se obtuvo { $l }

engine-e-skyline-skyline-table-is-empty = skyline: la tabla está vacía

engine-e-skyline-skyline-table-has-rows-over = skyline: la tabla tiene { $rows } filas, por encima del tope de { $MAX_TABLE_ROWS } filas

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: el acimut { $az } de la tabla está fuera de [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: los acimuts de la tabla deben ser estrictamente crecientes ({ $az } sigue a { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: más de { $MAX_SECTORS } sectores

engine-e-skyline-skyline-the-sector-az-from = skyline: el sector az_from = { $az_from } a az_to = { $az_to } está vacío (un círculo completo es una tabla o la máscara)

engine-e-skyline-skyline-more-than-terrain-points = skyline: más de { $MAX_TABLE_ROWS } puntos de terreno

engine-e-skyline-skyline-terrain-distance-must-be = skyline: la distance_m del terreno debe ser positiva, se obtuvo { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance }; con campos sobrescritos o añadidos por { $user }

engine-skyline-stated-input = Entrada declarada: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = preajuste de skyline desconocido "{ $name }"; preajustes conocidos: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = una hoja de datos necesita al menos dos puntos de desviación de Allan

engine-e-slot-timing-datasheet-point-must-have-positive = el punto de hoja de datos ({ $t }, { $s }) debe tener un tiempo de promediado positivo y una desviación de Allan positiva

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s debe ser un número positivo de segundos

engine-e-slot-timing-phase-record-needs-at-least = un registro de fase necesita al menos 32 muestras para ajustar un modelo de ruido; se obtuvo { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = el registro de fase contiene una muestra no finita

engine-e-slot-timing-the-phase-record-yields-fewer = el registro de fase produce menos de tres puntos de desviación de Allan

engine-e-slot-timing-must-be-finite-and-non = { $name } debe ser finito y no negativo; se obtuvo { $v }

engine-e-slot-timing-the-slot-guard-must-be = la guarda de ranura debe ser un tiempo positivo

engine-e-slot-timing-sigma-must-be-positive = k_sigma debe ser positivo

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset debe ser finito

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k debe ser finito

engine-e-slot-timing-give-exactly-one-of-oscillator = indique exactamente uno de oscillator.class, oscillator.preset, oscillator.datasheet u oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = oscillator.class '{ $id }' desconocido (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = oscillator.preset '{ $id }' desconocido (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = valor por defecto de la clase { $c }: sigma_y(1 s) a partir de { $c2 }; piso de ruido rojo sintetizado dos y cuatro décadas por debajo (una suposición, no una medición)

engine-slot-timing-fitted-to-the-allan-deviation = ajustado a los máximos de la desviación de Allan de { $document }, escalado para quedar en o por encima de cada punto

engine-slot-timing-fitted-to-the-overlapping-allan = ajustado a la desviación de Allan solapada de un registro de { $n_samples } muestras a { $tau0_s } s, en la base de modulación de frecuencia de IEEE Std 1139

engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } fuente): guarda { $c } ns con k={ $k_sigma } se rompe a los { $fmt_s } de una solución de posición (quedan { $fmt_s2 }); solución de posición al menos cada { $fmt_s3 } ({ $fixes_per_day } al día); término dominante: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = la época '{ $s }' debe ser YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = época '{ $s }': { $what } '{ $v }' no válido

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb debe ser finito

engine-e-solar-system-table-must-be-auto-table1 = table debe ser auto, table1 o table2; se obtuvo '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = no hay efemérides para el enlace { $name } a { $name2 } en JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = la época JD { $jd } TDB está fuera de 3000 BC a 3000 AD, el rango de las tablas de Standish

engine-e-solar-system-track-points-must-be-to = track_points debe ser de 8 a 2000; se obtuvo { $n_track }

engine-e-solar-system-unknown-observer-body = cuerpo observador desconocido '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies debe nombrar al menos un cuerpo

engine-e-solar-system-unknown-body = cuerpo desconocido '{ $n }'

engine-e-solar-system-no-position-for-at-jd = no hay posición para { $name } en JD { $jd } TDB (Plutón solo es de 1800 AD a 2050 AD)

engine-e-solar-system-no-standish-elements-for = no hay elementos de Standish para { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), estado heliocéntrico leído por el lector propio del motor

engine-e-solar-system-unknown-link-body = cuerpo de enlace desconocido '{ $from }'

engine-e-solar-system-unknown-link-body-2 = cuerpo de enlace desconocido '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = un enlace necesita dos cuerpos distintos; se obtuvo { $name }

engine-solar-system-solar-system-at-jd-tdb =
    Sistema solar en { $input } (JD { $jd_tdb } TDB), { $n_bodies } cuerpos, observador { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = tiempo luz { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }enlace { $from } -> { $to }: ida { $one_way_light_time_s } s, ida y vuelta { $two_way_light_time_s } s, Shapiro { $l } us, Sol { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = época { $input } · { $standish_table } · posiciones a partir de los elementos de Standish

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = la época necesita 6 campos de tiempo, se obtuvo { $tokens }

engine-e-sp3-bad-second = segundo no válido: { $tokens }

engine-e-sp3-record-needs-values-missing-column = el registro necesita 4 valores, falta la columna { $v1 }

engine-e-sp3-bad-number = número no válido: { $field }

engine-e-sp3-empty-sp3-input = entrada SP3 vacía

engine-e-sp3-first-line-is-not-an = la primera línea no es un encabezado SP3: { $first }

engine-e-sp3-unsupported-sp3-version-in = versión de SP3 no admitida en { $first }

engine-e-sp3-missing-epoch-count-on-header = falta el número de épocas en la línea de encabezado 1

engine-e-sp3-record-has-no-satellite-id = el registro no tiene identificador de satélite: { $line }

engine-e-sp3-position-record-before-any-epoch = registro de posición antes de cualquier encabezado de época

engine-e-sp3-sp3-file-contained-no-epoch = el archivo SP3 no contenía registros de época

engine-e-sp3-bad-accuracy-exponent-in = exponente de exactitud { $f } no válido en { $line }

engine-e-sp3-bad-header-accuracy = exactitud de encabezado no válida { $t }

engine-e-sp3-short-line = línea %f corta { $line }

engine-e-sp3-bad-base-in = base %f no válida en { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = la versión supera 3 bits

engine-e-space-packet-apid-exceeds-11-bits-2047 = el APID supera 11 bits (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count supera 14 bits (0..=16383)

engine-e-space-packet-data-field-must-be-at = el campo de datos debe tener al menos un octeto

engine-e-space-packet-data-field-exceeds-65536-octets = el campo de datos supera 65536 octetos

engine-e-space-packet-packet-shorter-than-the-octet = paquete más corto que el encabezado de 6 octetos: { $bytes } bytes

engine-e-space-packet-declared-data-length-header-octets = longitud de datos declarada { $data_len } (+6 de encabezado) = { $total } octetos, pero el búfer es de { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = octetos gruesos de CUC { $coarse_octets } fuera de 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = octetos finos de CUC { $fine_octets } fuera de 0..=3 (el campo P extendido no es admitido)

engine-e-space-packet-cuc-field-extended-field-not = campo P de CUC { $p }: campo P extendido no admitido

engine-e-space-packet-field-time-code-id-is = campo P { $p }: el identificador de código de tiempo { $id } no es CUC

engine-e-space-packet-field-is-not-cds-field = el campo P { $p } no es un campo P de CDS

engine-e-space-packet-cds-field-reserved-sub-ms = campo P de CDS { $p }: código reservado de sub-ms 11

engine-e-space-packet-cuc-coarse-does-not-fit = la parte gruesa de CUC { $coarse } no cabe en { $c } octetos

engine-e-space-packet-cuc-fine-does-not-fit = la parte fina de CUC { $fine } no cabe en { $n } octetos

engine-e-space-packet-cds-days-do-not-fit = los días de CDS { $days } no caben en { $f } octetos

engine-e-space-packet-cds-ms-of-day-above = ms del día de CDS { $ms_of_day } por encima de 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = submilisegundo de CDS { $submillis } por encima de { $max_sub }

engine-e-space-packet-time-code-format-and-value = el formato y el valor del código de tiempo son de códigos distintos

engine-e-space-packet-time-code-no-field-octet = código de tiempo: no hay octeto de campo P

engine-e-space-packet-time-code-needs-octets-present = el código de tiempo necesita { $end } octetos, hay { $bytes }

engine-e-space-packet-time-code-format-differs-from = el formato del código de tiempo difiere del campo P implícito

engine-e-space-packet-the-format-has-time-code = el formato tiene un campo de código de tiempo; no se indicó ninguno

engine-e-space-packet-the-format-has-no-time = el formato no tiene campo de código de tiempo

engine-e-space-packet-ancillary-data-is-octets-the = los datos auxiliares son { $ancillary } octetos; el formato indica { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = un encabezado secundario debe contener al menos un octeto

engine-e-space-packet-secondary-header-needs-octets-present = el encabezado secundario necesita { $end } octetos, hay { $bytes }

engine-e-space-packet-the-format-has-secondary-header = el formato tiene un encabezado secundario; no se indicó ninguno

engine-e-space-packet-the-format-has-no-secondary = el formato no tiene encabezado secundario

engine-e-space-packet-secondary-header-flag-disagrees-with = el indicador de encabezado secundario { $v1 } discrepa del formato

engine-e-space-packet-data-field-shorter-than-the = el campo de datos es más corto que el PEC

engine-e-space-packet-pec-does-not-match-the = el PEC { $v1 } no coincide con la CRC { $crc16_ccitt_false } del paquete

engine-e-space-packet-nothing-to-segment-empty-user = nada que segmentar: datos de usuario vacíos

engine-e-space-packet-max-user-octets-must-be = max_user_octets debe ser al menos 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count supera 14 bits (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } donde se esperaba { $a }

engine-space-packet-sequence-count-repeated = contador de secuencia { $sequence_count } repetido

engine-space-packet-sequence-count-gap-after-packet = hueco en el contador de secuencia: { $sequence_count } después de { $last } ({ $v2 } paquete(s) ausente(s))

engine-space-packet-sequence-count-out-of-order = contador de secuencia fuera de orden: { $sequence_count } después de { $last }

engine-space-packet-packet-with-no-unit-open = paquete { $f } sin ninguna unidad abierta

engine-space-packet-packet-while-unit-is-open = paquete { $f } mientras hay una unidad abierta

engine-e-space-packet-packet = paquete { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = la secuencia termina con una unidad aún abierta (sin último paquete)

engine-e-space-packet-apid-must-be-in-2047 = apid debe estar en 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count debe ser >= 1

engine-e-space-packet-data-len-must-be-in = data_len debe estar en 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = error interno: discrepancia en la ida y vuelta de codificación/decodificación

engine-space-packet-space-packet-framed-ccsds-133 = space-packet: se encuadraron { $packet_count } { $v2 } paquete(s) CCSDS-133.0 APID { $apid }, { $total_bytes } octetos en total, ida y vuelta exacta ({ $round_trip_ok })

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 debe ser finito y positivo

engine-e-space-weather-f107a-must-be-finite-and = f107a debe ser finito y positivo

engine-e-space-weather-kp-must-be-in = kp debe estar en [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km no debe estar vacío

engine-e-space-weather-altitude-km-must-be-finite = la altitud { $h } km debe ser finita y positiva

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; densidad x{ $density_activity_factor } a { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: un jammer { $what } necesita un bandwidth_mhz positivo

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: un jammer chirp necesita un sweep_period_us positivo

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to nombra una banda desconocida { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: indique received_power_dbw, o eirp_dbw con un range_m positivo (no ambos)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s debe ser posterior a on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: la frecuencia de muestreo debe ser positiva

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } debe ser una potencia de dos, al menos 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } muestras son menos que un segmento de { $nfft } puntos

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } debe ser una potencia de dos, al menos 16

engine-e-spectrum-cannot-read-recording-meta-path = no se puede leer el meta_path de la grabación { $meta_path }: { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = no se pueden leer los datos de grabación { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz debe ser positivo

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: la modulación { $m } no es seleccionable (solo galileo-e1 admite "mboc" o "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: la señal { $sig } no está en la biblioteca de preajustes de señal ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: una señal de preajuste lleva su propia modulación; elimine `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: la señal { $sig } no publica potencia recibida; indique signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: una banda personalizada requiere `modulation`, por ejemplo "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: una banda personalizada requiere signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: indique `signal` o `centre_mhz`, no ambos

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: indique rx_bandwidth_mhz (no se pudo localizar ningún lóbulo principal)

engine-e-spectrum-duration-must-be-at-least = duration_s debe ser al menos un step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } filas de tiempo superan las 5000 permitidas

engine-e-spectrum-at-most-extra-panels = como máximo 8 paneles adicionales

engine-e-spectrum-panel-need-max-mhz-min = panel { $name }: se requiere f_max_mhz > f_min_mhz y 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = cuadrícula: se requiere f_max_mhz > f_min_mhz y 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = espectro del escenario | { $bands } bandas | { $jammers } jammers | piso de ruido { $n0_db } dBW/Hz | peor banda { $name } C/N0 mín. { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = espectro del escenario | sin bandas | piso de ruido { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples debe estar entre 10 y 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: use cf32_le o ci16_le

engine-spectrum-frequency-across-time-down-colour = frecuencia en horizontal, tiempo en vertical, color = densidad espectral de potencia (dBW/Hz); piso de ruido { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = cada panel con su propio intervalo de frecuencia, una línea de tiempo en vertical, una escala de color (dBW/Hz); piso de ruido { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = el marco { $other } no tiene un código NAIF admitido

engine-e-spk-writer-segment-name-longer-than-40 = nombre de segmento de más de 40 caracteres: { $name }

engine-e-spk-writer-segment-name-has-non-printing = el nombre de segmento tiene caracteres no imprimibles: { $name }

engine-e-spk-writer-bad-target-for-centre = destino { $target } no válido para el centro { $centre }

engine-e-spk-writer-degree-outside-27 = grado { $degree } fuera de 1..=27

engine-e-spk-writer-type-13-degree-is-not = el grado { $degree } del tipo 13 no es impar

engine-e-spk-writer-states-for-epochs = { $states } estados para { $n } épocas

engine-e-spk-writer-states-degree-needs = { $n } estados; el grado { $degree } requiere { $value }

engine-e-spk-writer-descriptor-start-is-not-before = el inicio del descriptor no es anterior a su fin

engine-e-spk-writer-epochs-are-not-strictly-increasing = las épocas no son estrictamente crecientes

engine-e-spk-writer-the-epochs-do-not-cover = las épocas no cubren el intervalo del descriptor

engine-e-spk-writer-type-or-13-segment-carries = un segmento de tipo 9 o 13 contiene estados, no registros

engine-e-spk-writer-type-segment-needs-at-least = un segmento de tipo 3 requiere al menos un registro

engine-e-spk-writer-type-degree-outside-27 = grado { $degree } del tipo 3 fuera de 0..=27

engine-e-spk-writer-type-interval-length-is-not = la longitud de intervalo { $intlen } del tipo 3 no es positiva

engine-e-spk-writer-type-record-has-coefficients-expected = el registro { $i } del tipo 3 tiene { $value } coeficientes, se esperaban { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = el inicio del descriptor es posterior a su fin

engine-e-spk-writer-descriptor-starts-before-the-first = el descriptor empieza antes del primer registro

engine-e-spk-writer-descriptor-ends-after-the-last = el descriptor termina después del último registro

engine-e-spk-writer-type-segment-carries-records-not = un segmento de tipo 3 contiene registros, no épocas ni estados

engine-e-spk-writer-type-21-segment-needs-at = un segmento de tipo 21 requiere al menos una línea de diferencias

engine-e-spk-writer-difference-line-size-is-not = el tamaño de línea de diferencias { $dlsize } no es 4 MAXDIM + 11 con MAXDIM en 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = líneas de diferencias de tamaños distintos

engine-e-spk-writer-epochs-for-difference-lines = { $epochs } épocas para { $n } líneas de diferencias

engine-e-spk-writer-difference-line-epochs-are-not = las épocas de las líneas de diferencias no son estrictamente crecientes

engine-e-spk-writer-the-last-difference-line-ends = la última línea de diferencias termina antes del descriptor

engine-e-spk-writer-zero-step-size-in-difference = tamaño de paso cero { $j } en la línea de diferencias { $i }

engine-e-spk-writer-type-21-segment-carries-difference = un segmento de tipo 21 contiene líneas de diferencias, no estados

engine-e-spk-writer-an-spk-needs-at-least = un SPK requiere al menos un segmento

engine-e-spk-writer-segment = segmento { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = la línea de comentario tiene caracteres no imprimibles: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = los comentarios requieren { $nchars } caracteres; { $v1 } están reservados (aumente ncomch)

engine-e-spk-writer-difference-line-orders-out-of = órdenes { $kqmax1 } { $kq } de la línea de diferencias fuera de rango

engine-e-spk-writer-zero-step-size-at-index = tamaño de paso cero en el índice { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } fuera del segmento [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = el segmento { $name } del tipo 3 es demasiado corto

engine-e-spk-writer-type-segment-words-for-rsize = segmento { $name } del tipo 3: { $nw } palabras para N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = el segmento { $name } del tipo 21 es demasiado corto

engine-e-spk-writer-type-21-segment-words-for = segmento { $name } del tipo 21: { $nw } palabras para N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = el segmento { $name } es demasiado corto

engine-e-spk-writer-segment-words-for = segmento { $name }: { $nw } palabras para N = { $n }

engine-e-spk-writer-segment-is-in-frame = el segmento { $name } está en el marco { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = la cadena de centros SPK no termina

engine-e-spk-writer-no-spk-chain-connects-and = ninguna cadena SPK conecta { $target } y { $observer } en ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = la época { $s } no tiene el formato YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = sistema de tiempo { $other } no admitido (UTC o TDB)

engine-e-spk-writer-centre-has-no-supported-naif = el centro { $other } no tiene un id NAIF admitido

engine-e-spk-writer-oem-segment-has-no-data = el segmento OEM { $name } no tiene líneas de datos

engine-e-spk-writer-oem-segment-no = segmento OEM { $idx }: falta { $k }

engine-e-spk-writer-no-export-settings-for-oem = no hay ajustes de exportación para el segmento OEM { $idx }

engine-e-spk-writer-oem-data-line-has-fields = la línea de datos OEM tiene { $f } campos: { $line }

engine-e-spk-writer-oem-value = valor OEM { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } segmentos OEM para { $exports } ajustes de exportación

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOFING DETECTADO (fusionado) — capas: { $fired }

engine-spoof-detect-single-layer-indication-below-the = indicación de una sola capa ({ $fired }) por debajo del umbral fusionado — se requiere corroboración

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg debe ser positivo, se recibió { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = panel { $i }: el área debe ser >= 0

engine-e-srp-boxwing-panel-outside = panel { $i }: { $name } = { $c } fuera de [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = panel { $i }: absorción + especular + difusa = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = panel { $i }: normal/eje nulo

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = la matriz normal de ECOM2 es singular o está mal condicionada

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 mín.

engine-ssv-check-mod4-min = { $key } MOD4 mín.

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = preajuste heo

engine-e-ssv-check-lunar-preset = preajuste lunar

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = una formación requiere al menos un satélite adjunto

engine-e-ssv-formation-duration-min-and-step-must = duration_min y step_s deben ser positivos

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = no hay señales para las constelaciones y bandas elegidas

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = antena `{ $other }` desconocida

engine-e-ssv-scenario-pattern-csv-is-empty = el CSV de diagrama está vacío

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` no es un número en el CSV de diagrama

engine-e-ssv-scenario-pattern-csv-row-has-columns = la fila `{ $l }` del CSV de diagrama tiene { $f } columnas, se esperaban { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" requiere exactamente uno de pattern_csv y pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` no es booklet, parametric ni table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receptor: indique cn0_min_dbhz o weak_signal, no ambos

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = el lazo de portadora no puede mantener la tasa de Doppler indicada con ningún C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` no es acquisition, tracking ni both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz debe ser finito

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: indique exactamente uno de preset y orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` no es leo, meo, geo, heo ni lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: indique exactamente uno de duration_min y duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } debe ser positivo

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg requiere de 1 a 8 desfases finitos

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd no debe ser negativo

engine-e-ssv-scenario-give-exactly-one-of-shell = indique exactamente uno de [shell], [trajectory] y [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] requiere una tabla [navigation] para el satélite principal

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include y constellations.bands no deben estar vacíos

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km debe ser superior a 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels superior a 5 no está admitido

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna debe ser hemisphere u omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = el barrido de shell admite solo el diagrama de transmisión booklet (un diagrama con forma requiere el barrido de trajectory)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] se aplica a una [trajectory], no a un [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: indique exactamente uno de preset y orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` no es leo, meo, geo, heo ni lunar-transfer

engine-e-ssv-scenario-unknown-preset = preajuste desconocido

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv shell { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv navigation: RMS de posición { $p } en conjunto, { $p2 } dentro de las órbitas GNSS, { $p3 } por encima; mayor intervalo sin cobertura { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = adjunto a { $offset_deg } deg ({ $baseline_km } km): RMS relativo { $rel_rms_filter_m } m filtrado frente a { $rel_rms_from_absolute_m } m a partir de soluciones de posición absolutas

engine-ssv-scenario-combined-max-outage-min = { $band } combinado 1+ { $at_least_1_pct } % 4+ { $at_least_4_pct } % (interrupción máxima { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv trajectory { $perigee_alt_km } a { $apogee_alt_km } km de altitud: { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min y step_min deben ser positivos

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } debe ser un número positivo, se recibió { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = no hay ningún paquete de normas llamado `{ $id }`; los paquetes son: { $ids }

engine-e-standards-pack-pack-manifest = manifiesto del paquete: { $e }

engine-e-standards-pack-test-duplicate-id = prueba { $id }: id duplicado

engine-e-standards-pack-test-scenario-is-not-in = prueba { $id }: el escenario `{ $s }` no está en el paquete

engine-e-standards-pack-test-scored-test-needs-bar = prueba { $id }: una prueba puntuada requiere un umbral

engine-e-standards-pack-test-test-that-needs-input = prueba { $id }: una prueba que requiere entrada no tiene umbrales

engine-e-standards-pack-test-give-either-scenario-or = prueba { $id }: indique `scenario` o `needs_input`, no ambos ni ninguno

engine-e-standards-pack-test-supports-unknown-row = prueba { $id }: respalda una fila desconocida `{ $r }`

engine-e-standards-pack-test-unknown-op = prueba { $id }: op `{ $op }` desconocida

engine-e-standards-pack-test-bar-on-needs-exactly = prueba { $id }: el umbral sobre { $pointer } requiere exactamente uno de `value` y `against`

engine-e-standards-pack-row-duplicate-id = fila { $id }: id duplicado

engine-e-standards-pack-row-asks-must-be-short = fila { $id }: `asks` debe ser una paráfrasis breve

engine-e-standards-pack-row-no-test-supports-it = fila { $id }: ninguna prueba la respalda

engine-standards-pack-not-scored-needs-input = sin puntuar: requiere entrada ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = el estudio no tiene escenarios que ejecutar

engine-e-study-cannot-read-scenario = no se puede leer el escenario { $path }: { $e }

engine-e-study-scenario-failed = el escenario { $path } falló: { $e }

engine-e-study-scenario-produced-unparseable-json = el escenario { $path } produjo JSON no analizable: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = manifiesto de suite no válido: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = fuente `{ $o }` desconocida: use `adsb` o `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } tiene { $len } bytes, por encima del límite de { $limit } bytes

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` no es una hora UTC ISO-8601

engine-e-surface-invalid-receiver-trust-session = sesión receiver-trust no válida: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` no es una hora UTC ISO-8601

engine-e-surface-dataset-custom-needs-licence-licence = el conjunto de datos `custom` requiere licence, licence_url y attribution

engine-e-surface-at-least-one-map-is = se requiere al menos un mapa

engine-e-surface-epoch = época: { $e }

engine-e-surface-not-utf = { $suffix }: no es UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = tipo de escenario `{ $k }` desconocido; la lista de tipos nombra todos los tipos

engine-surface-is-not-bundled-it = `{ $name }` no está incluido en el paquete: { $why }

engine-surface-no-bundled-scenario-named-the = no hay ningún escenario incluido llamado `{ $name }`; la lista de ejemplos nombra los { $v1 } que sí lo están

engine-e-surface-invalid-toml = TOML no válido: { $e }

engine-e-surface-unknown-export-format-expected-one = formato de exportación `{ $format }` desconocido; se esperaba uno de czml, kml, geojson, stk o sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps da { $opts } fotogramas y se devuelven como máximo { $MAX_ANIMATION_FRAMES }; reduzca fps o duration_s, o escriba una secuencia más larga con la línea de comandos

engine-e-surface-scenario-run-failed = falló la ejecución del escenario: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log nombra un archivo `path`; indique el registro como `text` o `base64` (esta interfaz no lee archivos)

engine-e-surface-max-sp-errors-must-be = max_sp_errors debe ser como máximo 20

engine-e-surface-frames-must-be-to = frames debe estar entre 1 y { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 debe estar entre 0 y 99

engine-e-surface-runs-given-at-most-per = se indicaron { $runs } ejecuciones; como máximo { $MAX_COMPLIANCE_RUNS } por informe

engine-e-surface-the-runs-total-bytes-the = las ejecuciones suman { $total } bytes; el límite para un informe es { $max_bytes }

engine-e-surface-result-files-given-at-most = se indicaron { $results } archivos de resultados, como máximo 256

engine-e-surface-result-is-not-json = el resultado { $v1 } no es JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = formato `{ $o }` desconocido: use `prometheus`, `cef`, `leef`, `otlp` o `mqtt`

engine-e-surface-unknown-imu-format-use-csv = formato IMU `{ $o }` desconocido: use `csv` o `euroc`

engine-e-surface-unknown-axis-use-or = eje `{ $o }` desconocido: use `x`, `y` o `z`

engine-e-surface-id-must-be-to-64 = id debe tener de 1 a 64 caracteres ASCII imprimibles sin espacios

engine-surface-fitted-from-stationary-imu-log = ajustado a partir de un registro IMU estacionario, sha256 { $sha }, eje { $axis }, estimador de Allan

engine-e-surface-unknown-input-kind-use-result = input_kind `{ $o }` desconocido: use `result` o `jsonl`

engine-e-surface-the-input-holds-no-trust = la entrada no contiene ninguna época de confianza

engine-e-surface-the-reply-is-over-the = la respuesta supera el límite de { $max_bytes } bytes; envíe menos épocas o deje `syslog_all` desactivado

engine-e-surface-otlp-needs-build-with-the = otlp requiere una compilación con la característica `otlp`

engine-e-surface-the-pack-and-token-total = el paquete y el token suman { $total } bytes; el límite es { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = el token de marca de tiempo está vacío

engine-e-surface-must-be-64-lower-case = { $what } debe tener 64 dígitos hexadecimales en minúsculas

engine-e-surface-must-be-32-bytes = { $what } debe tener 32 bytes

engine-surface-verified-against-the-public-key = VERIFICADO frente a la clave pública que usted indicó (huella del firmante { $fp }).

engine-surface-intact-but-the-signer-is = ÍNTEGRO, PERO EL FIRMANTE NO ESTÁ FIJADO: los hashes y la firma son coherentes con la clave { $fp }, que el propio paquete nombra. Indique la clave pública del firmante, obtenida del firmante por otra vía, para establecer quién lo firmó.

engine-e-surface-files-must-be-json-object = files debe ser un objeto JSON de nombre a contenido

engine-e-surface-pack-has-at-most-64 = un paquete tiene como máximo 64 archivos

engine-e-surface-file-name-must-be-plain = el nombre de archivo `{ $k }` debe ser un nombre simple

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` no es base64 estándar válido

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = parámetro de barrido desconocido: { $other }

engine-e-sweep-unknown-sweep-metric = métrica de barrido desconocida: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep requiere al menos un eje

engine-e-sweep-sweep-key-is-malformed = la clave de barrido `{ $key }` está mal formada

engine-e-sweep-sweep-key-follows-an-array = clave de barrido `{ $key }`: `{ $part }` sigue a una matriz, por lo que debe ser un índice

engine-e-sweep-unreachable = inalcanzable

engine-e-sweep-sweep-key-index-is-past = clave de barrido `{ $key }`: el índice { $i } está más allá de las { $n } entradas de la matriz

engine-e-sweep-sweep-key-parent-is-not = clave de barrido `{ $key }`: el elemento padre de `{ $part }` no es una tabla

engine-e-sweep-sweep-key-no-field = clave de barrido `{ $key }`: no hay campo `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = clave de barrido `{ $key }`: el elemento padre de `{ $last }` no es una tabla

engine-e-sweep-sweep-key-no-field-2 = clave de barrido `{ $key }`: no hay campo `{ $last }`

engine-e-sweep-metric-no-field-in-result = métrica `{ $path }`: no hay campo `{ $part }` en el resultado

engine-e-sweep-metric-value-is-not-number = métrica `{ $path }`: el valor no es un número

engine-e-sweep-sweep-node-serialize = serialización del nodo de barrido: { $e }

engine-e-sweep-sweep-node-result-parse = análisis del resultado del nodo de barrido: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = eje de barrido `{ $key }`: unidad declarada `{ $d }` pero el paquete barrido publica `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = el hilo de trabajo del barrido entró en pánico

engine-e-sweep-generic-sweep-needs-at-least = un barrido genérico requiere al menos un eje

engine-e-sweep-generic-sweep-needs-at-least-2 = un barrido genérico requiere al menos una métrica

engine-e-sweep-generic-sweep-base-must-carry = el `base` de un barrido genérico debe llevar su propio `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = un barrido genérico no puede barrer otro barrido

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = oscilador { $oscillator } desconocido; se esperaba uno de { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day y temperature_coeff_per_k deben ser finitos

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s debe ser finito y positivo

engine-e-telecom-timing-duration-must-be-finite-and = duration_s debe ser finito y de al menos doce muestras de longitud

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s debe estar en [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns debe ser finito y >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = las entradas de temperatura y de desfase de frecuencia deben ser finitas (período > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = el registro superaría 5 000 000 muestras; aumente sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = una serie de error de tiempo requiere al menos 13 muestras, se recibieron { $pairs }

engine-e-telecom-timing-every-time-and-time-error = todos los time_s y time_error_ns deben ser finitos

engine-e-telecom-timing-time-must-increase = time_s debe ser creciente

engine-e-telecom-timing-the-series-must-be-uniformly = la serie debe estar muestreada de manera uniforme: el paso { $v1 } es { $d } s, el primero es { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = la línea CSV { $v1 } no es `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = la máscara se define mediante un filtro paso bajo de 0.1 Hz, que este motor aplica solo con intervalos de muestreo de { $MAX_FILTER_DT_S } s o menos; este registro se muestrea cada { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = indique [holdover] o [series], no ambos

engine-e-telecom-timing-give-either-series-samples-or = indique series.samples o series.csv_path, no ambos

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days debe ser finito y >= 0

engine-telecom-timing-ns-budget-exceeded-after = ; presupuesto de { $max_abs_te_ns } ns superado tras { $t } s

engine-telecom-timing-ns-budget-never-exceeded = ; presupuesto de { $max_abs_te_ns } ns nunca superado

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: máx|TE| { $max_abs } ns durante { $v2 } s; { $masks }{ $first_budget } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = --format `{ $f }` desconocido (cef o leef)

engine-e-telemetry-cli-unknown-option = opción `{ $x }` desconocida

engine-e-telemetry-cli-input-and-result-are-alternatives = --input y --result son alternativas excluyentes

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: sin dirección

engine-telemetry-cli-warning-metrics-is-served-without = advertencia: /metrics se sirve sin autenticación en { $addr }; enlace a localhost o colóquelo detrás de su propio control de acceso

engine-e-telemetry-cli-bind = enlace { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = sirviendo http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp y --syslog-tcp son alternativas excluyentes

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting se aplica a --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: una parte de tema no debe estar vacía, ni contener #, + ni una / inicial

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp requiere una compilación con `--features otlp`

engine-telemetry-cli-warning-input-line = advertencia: línea de entrada { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = no se puede abrir { $p }: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not = advertencia: { $n } mensajes MQTT no se entregaron

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = el endpoint debe comenzar con http://

engine-e-telemetry-otlp-endpoint-has-no-host = el endpoint no tiene host

engine-e-telemetry-otlp-resolve = resolución de { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = no hay dirección para { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = advertencia: falló la exportación otlp: { $e }

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

engine-e-telemetry-sample-not-json = no es JSON: { $e }

engine-e-telemetry-sample-not-json-object = no es un objeto JSON

engine-e-telemetry-sample-is-not-number = `{ $k }` no es un número

engine-e-telemetry-sample-is-not-finite = `{ $k }` no es finito

engine-e-telemetry-sample-missing = falta `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } fuera de 0..=100

engine-e-telemetry-sample-missing-state = falta `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` no es una matriz

engine-e-telemetry-sample-entry-has-no-name = una entrada de `{ $key }` no tiene nombre

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` falta o no es un número finito

engine-e-telemetry-sample-position-is-not-an-object = `position` no es un objeto ni null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` falta o no es una cadena

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` no es un número finito >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` no es una cadena

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` no es un booleano

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` no es un objeto ni null

engine-e-telemetry-sample-result-has-no-epochs = el resultado no tiene `epochs`

engine-e-telemetry-sample-bad-epochs = `epochs` no válido: { $e }

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

engine-e-telemetry-syslog-host-is-bytes-syslog-host = host tiene { $host } bytes; el nombre de host de syslog tiene como máximo 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = host debe ser ASCII imprimible sin espacios

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } frente a { $w } (no representable como f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: presente, se esperaba ausente

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: ausente, se esperaba presente

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } debe ser finito

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu debe ser finito y no negativo

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: línea { $v1 }: no es MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: no hay registros AR para { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = formato de serie { $f } desconocido (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } debe ser finito

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s debe dar de 16 a 20000 mediciones

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } desfase { $ns } ns (Sagnac { $ns2 } ns, ionosfera { $ns3 } ns); u combinada { $ns4 } ns (tipo A { $ns5 } ns a { $averaging_s } s); { $series } serie real (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = caracteres no ASCII en TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE truncado al leer { $what } (columnas { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } demasiado corto para una suma de comprobación en la columna 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } no tiene dígito de suma de comprobación en la columna 69

engine-e-tle-tle-checksum-mismatch-column-69 = suma de comprobación de TLE { $label } discordante: la columna 69 indica { $want }, se calculó { $got }

engine-e-tle-not-tle-line = no es una línea 1 de TLE: { $line1 }

engine-e-tle-not-tle-line-2 = no es una línea 2 de TLE: { $line2 }

engine-e-tle-invalid-in-tle = { $what } no válido en TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = año de época no válido en TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = número de catálogo no válido en TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = inclinación fuera de rango [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = excentricidad fuera de rango [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = movimiento medio no positivo: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = mantisa de { $what } no válida en TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = exponente de { $what } no válido en TLE: { $exp }

engine-tle-satellite-line-only-element-set = satélite { $satnum }: el conjunto de elementos con solo la línea 2 se analizó como elementos keplerianos analíticos (de dos cuerpos) — faltan la resistencia aerodinámica/B* de la línea 1 y los términos seculares de SGP4, por lo que esta órbita se aleja de un ajuste SGP4 verdadero lejos de la época; indique la línea 1 correspondiente para obtener la exactitud de SGP4

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: el perfil de C/N0 requiere una época y una duración positivas

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: el perfil de C/N0 requeriría más de { $MAX_DETECTOR_STEPS } pasos de detector ({ $total } s a { $epoch_s } s por época); acorte ramp_duration_s o alargue predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } debe ser finito

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } debe ser positivo (se recibió { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips debe ser inferior a 1.9 chips (se recibió { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio debe ser al menos 1 (se recibió { $pullin_bandwidth_ratio }) — un lazo que vuelve a engancharse con un ancho de banda MÁS ESTRECHO que con el que sigue la señal invertiría la histéresis

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s no debe ser negativo

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) no debe superar cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } no debe estar vacío

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } tiene { $axis } entradas; el tope es { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } contiene un valor no finito

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: los tiempos de permanencia de confirmación deben ser de al menos 1 época

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = se necesitan al menos ocho muestras

engine-e-twstft-budget-samples-must-increase-in-time = las muestras deben ser crecientes en el tiempo

engine-e-twstft-budget-samples-must-be-on-regular = las muestras deben estar en una cuadrícula regular

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } filas: { $validated } verificadas frente a una referencia externa independiente, { $modelled } calculadas a partir de un modelo, { $partner_owned } a cargo de un socio.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = El registro de evidencias completo, comprobado por máquina: **{ $total } filas — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Una fila solo puede ser VALIDATED con una referencia externa independiente (las pruebas de invariantes de la matriz lo imponen). Los mismos datos, con enlaces seleccionables por fila a cada prueba, módulo y fixture confirmado, son el *Registro de validación* en https://kshana.dev. Consulte [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) para saber por qué cada fila calculada a partir de un modelo no está verificada frente a una referencia externa independiente.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } capacidades etiquetadas como MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json no es JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json no es JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] requiere `label`

engine-wasm-runs-needs-result = runs[{ $i }] requiere `result`

engine-wasm-results-json-is-not-json = results_json no es una matriz JSON de cadenas: { $e }

engine-wasm-maps-json-must-be-json = maps_json debe ser una matriz JSON de cadenas: { $e }

engine-wasm-plans-json-is-not-json = plans_json no es una matriz JSON de cadenas: { $e }

engine-wasm-options-json-is-not-json = options_json no es JSON: { $e }

engine-wasm-input-is-about-bytes-over = la entrada tiene unos { $b64 } bytes, por encima del límite de { $v2 } bytes

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Navegación secuencial referenciada al terreno (SITAN recursivo)

engine-altpnt-sequential-free-inertial-drift-grows = deriva inercial libre (crece)

engine-altpnt-sequential-terrain-matched-bounded = correlación con el terreno (acotada)

engine-altpnt-sequential-waypoint-full-scale = punto de ruta →    escala completa { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Informe de ejecución de Kshana

engine-advanced-report-meta = Tipo <code>{ $kind }</code> · motor { $engine } · escenario <code>{ $scenario }</code> (resumen del archivo { $digest }…)

engine-advanced-report-toc-summary = 1 Resumen

engine-advanced-report-toc-inputs = 2 Entradas

engine-advanced-report-toc-results = 3 Resultados

engine-advanced-report-toc-aggregation = 3a Agregación

engine-advanced-report-toc-companions = 3b Animación y exportaciones

engine-advanced-report-toc-events = 4 Eventos

engine-advanced-report-toc-labels = 5 Etiquetas de verificación

engine-advanced-report-toc-not-modelled = 6 Lo no modelado

engine-advanced-report-toc-reproducibility = 7 Reproducibilidad

engine-advanced-report-h-summary = 1. Resumen ejecutivo

engine-advanced-report-honesty-label = <strong>Etiqueta de honestidad</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Capacidades utilizadas:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (se depende de ellas, Kshana no las proporciona); véase la sección 5.

engine-advanced-report-member-runs = <strong>Ejecuciones miembro:</strong> { $n }, agregadas en la sección 3a.

engine-advanced-report-h-inputs = 2. Entradas

engine-advanced-report-inputs-note = Cada campo que fija el archivo de escenario, aplanado a su ruta. Las unidades proceden del bloque <code>units</code> del resultado (el esquema de unidades de campo, docs/field-units-schema.json) cuando describe el campo y, en caso contrario, del sufijo del nombre del campo; una unidad que ninguno indique se muestra como no indicada.

engine-advanced-report-th-parameter = Parámetro

engine-advanced-report-th-value = Valor

engine-advanced-report-th-unit = Unidad

engine-advanced-report-th-unit-source = Origen de la unidad

engine-advanced-report-h-results = 3. Resultados

engine-advanced-report-chart-alt = Gráfico de resultados

engine-advanced-report-also-written-to = { " " }(escrito también en { $file })

engine-advanced-report-h-scalars = Resultados escalares

engine-advanced-report-h-columns = Columnas numéricas

engine-advanced-report-th-result = Resultado

engine-advanced-report-th-column = Columna

engine-advanced-report-th-count = Recuento

engine-advanced-report-th-min = Mín.

engine-advanced-report-th-max = Máx.

engine-advanced-report-th-first = Primero

engine-advanced-report-th-last = Último

engine-advanced-report-omitted-inputs = <p class="note">Se omiten en esta página { $n } entradas más; report.json enumera las mismas filas y el documento de resultados contiene todos los valores.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">Se omiten en esta página { $n } resultados escalares más; report.json enumera las mismas filas y el documento de resultados contiene todos los valores.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">Se omiten en esta página { $n } columnas numéricas más; report.json enumera las mismas filas y el documento de resultados contiene todos los valores.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">Se omiten en esta página { $n } eventos más; report.json enumera las mismas filas y el documento de resultados contiene todos los valores.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Agregación de las ejecuciones miembro

engine-advanced-report-mode = <p>Modo <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Modo <strong>{ $mode }</strong> sobre el tipo <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Modo <strong>{ $mode }</strong>, { $n_runs } ejecuciones miembro.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Modo <strong>{ $mode }</strong> sobre el tipo <code>{ $kind }</code>, { $n_runs } ejecuciones miembro.</p>{ "\u000A" }

engine-advanced-report-run-digest = Resumen de la ejecución (SHA-256 sobre los resúmenes de resultados de los miembros, en orden de despacho): <code>{ $digest }</code>

engine-advanced-report-table-empty = Esta tabla no tiene filas: el resultado no enumera ninguna.

engine-advanced-report-distribution-caption = Distribución Monte Carlo de { $metric } ({ $n } muestras), 20 intervalos de igual anchura; las líneas discontinuas marcan los percentiles 5, 50 y 95.

engine-advanced-report-distribution-caption-unit = Distribución Monte Carlo de { $metric } ({ $n } muestras, { $unit }), 20 intervalos de igual anchura; las líneas discontinuas marcan los percentiles 5, 50 y 95.

engine-advanced-report-h-companions = 3b. Animación y exportaciones

engine-advanced-report-animation-alt = Animación de las series temporales de la ejecución

engine-advanced-report-animation-caption = Las muestras propias de la ejecución se dibujan tras un cursor de tiempo en movimiento (el dibujo animado de <code>--animate svg</code>; muestra la imagen terminada con movimiento reducido y al imprimir).

engine-advanced-report-no-animation = Sin animación: { $reason }

engine-advanced-report-no-animation-default = el resultado no contiene series temporales

engine-advanced-report-player-written-by = El reproductor interactivo lo escribe <code>{ $command }</code>.

engine-advanced-report-written-beside = Escritos junto a este informe: { $links }.

engine-advanced-report-th-export = Exportación

engine-advanced-report-th-applies = Se aplica

engine-advanced-report-th-files-or-reason = Archivos o motivo

engine-advanced-report-written-by = escrito por <code>{ $command }</code>

engine-advanced-report-does-not-apply = no se aplica

engine-advanced-report-yes = sí

engine-advanced-report-no = no

engine-advanced-report-h-events = 4. Cronología de eventos

engine-advanced-report-events-caption = Ventanas como barras y eventos puntuales como puntos, sobre el eje de tiempo propio de la ejecución.

engine-advanced-report-th-start = Inicio (s)

engine-advanced-report-th-end = Fin (s)

engine-advanced-report-th-event = Evento

engine-advanced-report-th-source = Origen

engine-advanced-report-point-event = evento puntual

engine-advanced-report-events-timeline = Cronología de eventos

engine-advanced-report-point-events = eventos puntuales ({ $n })

engine-advanced-report-distribution-of = Distribución de { $metric }

engine-advanced-report-max-bin = intervalo máx. { $n }

engine-advanced-report-h-labels = 5. Etiquetas de verificación

engine-advanced-report-th-capability = Capacidad (requisito de la matriz)

engine-advanced-report-th-label = Etiqueta

engine-advanced-report-th-used-by = Utilizada por

engine-advanced-report-th-oracle = Origen: referencia independiente

engine-advanced-report-th-test-evidence = Evidencia de ensayo

engine-advanced-report-h-figure-tiers = Niveles por cifra indicados por el resultado

engine-advanced-report-th-figure = Cifra

engine-advanced-report-th-tier = Nivel

engine-advanced-report-th-matrix-requirement = Requisito de la matriz

engine-advanced-report-th-applicable = Aplicable

engine-advanced-report-no-attack = no (sin ataque configurado)

engine-advanced-report-h-not-modelled = 6. Lo no modelado y los supuestos

engine-advanced-report-not-modelled-note = Cada elemento se cita del lugar donde se indica: el documento de resultados, el catálogo de tipos, el archivo de escenario o el motivo de la matriz de verificación por el que una fila MODELLED sigue siéndolo.

engine-advanced-report-th-statement = Declaración

engine-advanced-report-h-reproducibility = 7. Registro de reproducibilidad

engine-advanced-report-rk-command = Comando para reproducir

engine-advanced-report-rk-working-directory = Directorio de trabajo

engine-advanced-report-rk-engine-version = Versión del motor

engine-advanced-report-rk-source-commit = Commit de origen

engine-advanced-report-rk-scenario-file = Archivo de escenario

engine-advanced-report-rk-scenario-sha = SHA-256 del archivo de escenario (Secure Hash Algorithm de 256 bits)

engine-advanced-report-rk-result-hash = scenario_hash del resultado

engine-advanced-report-rk-result-sha = SHA-256 del documento de resultados

engine-advanced-report-rk-seed = Semilla

engine-advanced-report-rk-platform = Plataforma

engine-advanced-report-rk-generated = Estudio generado (UTC)

engine-advanced-report-rk-determinism = Determinismo

engine-advanced-report-result-hash-none = el documento de resultados no indica ninguno

engine-advanced-report-print-note = Para imprimir esta página en un archivo Portable Document Format (PDF), utilice el cuadro de diálogo de impresión del navegador y elija “Guardar como PDF”; la hoja de estilos de impresión se ajusta a papel A4 y US Letter, repite los encabezados de tabla en cada página e inicia en página nueva las secciones de entradas, resultados, etiquetas y reproducibilidad. El motor no escribe ningún PDF por sí mismo. report.json contiene el mismo contenido que esta página.

engine-advanced-report-footer = Generado por Kshana { $engine }.{ $stamp } Reproducible a partir de escenario + semilla + versión del motor. Libre y de código abierto (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">código fuente y documentación</a>.

engine-advanced-report-empty-inputs = El escenario no fija ningún campo además de `kind`: el tipo ejecutó su configuración de referencia con sus valores predeterminados documentados.

engine-advanced-report-empty-scalars = El documento de resultados no contiene ningún escalar fuera de sus matrices; sus números se resumen por columna más abajo.

engine-advanced-report-empty-series = El documento de resultados no contiene ninguna matriz numérica: todos los resultados son escalares de la tabla anterior.

engine-advanced-report-empty-events = Sin eventos temporizados: el escenario no programa ninguna ventana ni instante de inicio y el resultado no informa de ningún evento. El tipo evalúa su configuración como un solo caso.

engine-advanced-report-empty-not-modelled = Nada en el resultado, el catálogo de tipos, el escenario ni las filas de la matriz utilizadas indica una limitación de modelado para esta ejecución.

engine-advanced-report-capabilities-statement = Cada fila es una fila de la matriz de verificación que ejercitan los tipos de esta ejecución, con la etiqueta y la referencia independiente que le asigna la matriz (src/verification.rs, docs/VERIFICATION-MATRIX.md). Una etiqueta califica la capacidad tal como la registra la matriz; no califica la configuración de este escenario, y una fila VALIDATED no hace que las entradas de la ejecución sean medidas. Una fila PARTNER es una disciplina de la que depende la ejecución y que Kshana no proporciona.

engine-advanced-report-no-run-label = El resultado no contiene ninguna etiqueta de honestidad a nivel de ejecución; las etiquetas de verificación de las capacidades utilizadas se enumeran en su propia sección, y los niveles por cifra donde el resultado los indica.

engine-advanced-report-no-seed = Ni el escenario ni el resultado contienen una semilla. El resultado queda fijado únicamente por el archivo de escenario y la compilación del motor; la prueba de determinismo vuelve a ejecutar cada escenario incluido y exige una salida idéntica byte a byte.

engine-advanced-report-working-directory = Ejecute el comando desde el directorio en el que se inició la ejecución original: la ruta del escenario y cualquier ruta de datos relativa dentro del escenario se resuelven respecto a él. Compruebe antes el archivo de escenario con scenario_sha256.

engine-advanced-report-determinism-stamped = Los mismos bytes de escenario, la misma semilla y la misma compilación del motor dan el mismo documento de resultados, salvo su marca meta.generated_utc, que --study-name escribe a partir del reloj; ejecute sin --study-name para obtener una salida idéntica byte a byte. Los resultados de coma flotante están fijados por plataforma; otro sistema operativo u otra arquitectura pueden diferir en las últimas cifras.

engine-advanced-report-determinism-plain = Los mismos bytes de escenario, la misma semilla y la misma compilación del motor dan un documento de resultados y un informe idénticos byte a byte; este informe no lleva marca de tiempo. Los resultados de coma flotante están fijados por plataforma; otro sistema operativo u otra arquitectura pueden diferir en las últimas cifras.

engine-advanced-report-not-applicable-no-attack = no aplicable (sin ataque configurado)

engine-advanced-report-what-ran-default = Un escenario `{ $kind }`.

engine-advanced-report-nothing-carried = no contiene nada

engine-advanced-report-tbl-sweep-nodes = Nodos del barrido

engine-advanced-report-tbl-mc-summary = Resumen de la distribución Monte Carlo (los percentiles son de rango más próximo; el intervalo de confianza del 95 % de la media es un bootstrap de percentiles con semilla fija)

engine-advanced-report-tbl-chain-phases = Fases de la cadena

engine-advanced-report-tbl-shared = Condiciones compartidas

engine-advanced-report-tbl-members = Miembros

engine-advanced-report-tbl-combined = Combinado entre miembros

engine-advanced-report-tbl-optimiser-best = Mejor resultado del optimizador (un óptimo local dentro de los límites indicados)

engine-advanced-report-tbl-optimiser-trace = Traza del optimizador

engine-advanced-report-tbl-sweep-grid = Cuadrícula del barrido

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Navegación referenciada al terreno (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Navegación por correlación con mapas de gravedad

engine-altpnt-terrain-title-combined = Alt-PNT combinado de gravedad + magnético + terreno

engine-altpnt-terrain-free-inertial-drift = deriva inercial libre

engine-altpnt-terrain-terrain-matched = correlación con el terreno

engine-altpnt-terrain-gravity-matched = correlación con la gravedad

engine-altpnt-terrain-gravity-only = solo gravedad

engine-altpnt-terrain-magnetic-only = solo magnético

engine-altpnt-terrain-terrain-only = solo terreno

engine-altpnt-terrain-combined-fused = combinado (fusionado)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · escenario { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Superficie de ataque a la seguridad de la señal lunar (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = relés a la vista

engine-body-pnt-chart-count = recuento

engine-body-pnt-chart-formal-one-sigma-position = posición formal de una sigma (log10 m): solo constelación en azul, en ámbar con la distancia a la Tierra

engine-body-pnt-chart-time-since-epoch = tiempo desde la época, de 0 a { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = error de tiempo del reloj frente a la guarda (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 frente al umbral de seguimiento (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = nivel de protección frente al límite de alerta (m)

engine-campaign-chart-position-error-vs-threshold = error de posición frente al umbral (m)

engine-campaign-chart-satellites-tracking = satélites en seguimiento

engine-campaign-chart-alarm-flags-and-events = indicadores de alarma y eventos

engine-campaign-chart-mission-time = { $duration } s de tiempo de misión

engine-campaign-chart-sweep-percentile-band = , mediana con banda de percentiles 5-95 sobre { $n_runs } semillas

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) en { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo de `{ $scenario_kind }`: { $n_runs } semillas desde { $base_seed } (percentiles 5, 50 y 95; barra = intervalo de confianza bootstrap del 95 % de la media)

engine-campaign-chart-composed-members = miembros compuestos bajo condiciones compartidas: { $shared }

engine-campaign-chart-not-available = n/d

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Recuperación de la longitud de arco cislunar — un estimador que no comparte los jacobianos

engine-cislunar-arc-recovery-chart-subtitle = mínimos cuadrados por lotes con diferencias finitas · error de recuperación de estado medido · sin jacobiano analítico, sin STM variacional, sin tolerancia de rango por SVD

engine-cislunar-arc-recovery-chart-bound = cota { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = umbral de rango de la gramiana

engine-cislunar-arc-recovery-chart-monte-carlo-rms = error RMS de recuperación de posición Monte Carlo (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = peor razón de recuperación sin ruido (error final / desplazamiento)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Observabilidad cislunar a lo largo de un arco de seguimiento (P6)

engine-cislunar-observability-chart-subtitle = rango frente al arco (enlace único solo de distancia) · espectro de autovalores de la gramiana · condiciones iniciales de DRO corregidas diferencialmente + verificación cruzada con SRIF · diseño { $modelled }, rango/STM/cierre { $validated }

engine-cislunar-observability-chart-observable-rank = rango observable frente a la longitud del arco

engine-cislunar-observability-chart-arc-length = longitud del arco (unidades de tiempo del marco rotatorio, { $arc_hours } h en total)

engine-cislunar-observability-chart-gramian-eigenvalues = autovalores de la gramiana (log10)

engine-cislunar-observability-chart-condition = condición κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Resiliencia ante conflictos de PNT por capas (P7)

engine-conflict-resilience-chart-subtitle = pérdida total frente a intensidad de la amenaza (MC frente a forma cerrada) · razón de resiliencia frente a correlación de denegación · { $modelled } a priori, { $validated } MC->forma cerrada / marginales de cópula

engine-conflict-resilience-chart-total-loss-probability = probabilidad de pérdida total frente a la intensidad

engine-conflict-resilience-chart-threat-intensity = intensidad de la amenaza

engine-conflict-resilience-chart-layered-mc = MC por capas

engine-conflict-resilience-chart-single-layer = capa única

engine-conflict-resilience-chart-resilience-ratio = razón de resiliencia frente a la correlación de denegación

engine-conflict-resilience-chart-denial-correlation = correlación de denegación ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = disponibilidad (%)

engine-constellation-chart-mean-pdop = PDOP medio

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = GNSS terrestre a distancia lunar — C/N0 frente al ángulo fuera del eje

engine-earth-gnss-lunar-chart-track-threshold = seguimiento { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = limbo terrestre { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = ángulo fuera del eje (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = dorado = seguible · rojo = demasiado débil · gris = ocultado por la Tierra · patrón de transmisión { $modelled }

## src/ensemble.rs

engine-ensemble-chart-title = Clock holdover: banda de confianza del error de temporización ({ $n_runs } ejecuciones)

engine-ensemble-chart-timing-error-ns = error de temporización (ns)

engine-ensemble-chart-spec-threshold = especificación { $threshold } ns

engine-ensemble-chart-time-s = tiempo (s)

engine-ensemble-chart-classical-median-band = clásico: { $id } (mediana, banda 5-95 %)

engine-ensemble-chart-quantum-median-band = cuántico: { $id } (mediana, banda 5-95 %)

## src/fom_label.rs

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Presupuesto de predicción de marco / EOP en tiempo real para la temporización lunar

engine-frame-eop-chart-ut1-error-ms = error de UT1 (ms)

engine-frame-eop-chart-position-at-moon-m = posición en la Luna (m)

engine-frame-eop-chart-equiv-timing-ns = temporización equiv. (ns)

engine-frame-eop-chart-prediction-horizon-days = horizonte de predicción (días)

engine-frame-eop-chart-iers-final-floor = límite final del IERS { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m en la Luna

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = UKF híbrido de 17 estados — autoconsistencia del filtro (calculado a partir de un modelo)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + blancura de la innovación frente a bandas χ² del 95 %; 1.0 = consistente. Autoconsistencia, no exactitud.

engine-fusion-hybrid-ukf-chart-target = objetivo 1.0

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (blancura)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENTE

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENTE

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Error horizontal de GNSS/INS débilmente acoplado

engine-fusion-pack-chart-horizontal-error-m = error horizontal (m)

engine-fusion-pack-chart-spec-threshold = especificación { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Gráfico del cielo ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = E

engine-geometry-chart-south = S

engine-geometry-chart-west = O

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (oculto por el horizonte)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (por debajo de la máscara)

engine-geometry-chart-no-fix = sin solución

engine-geometry-chart-in-view-hidden = { $n_visible } a la vista, { $n_masked } ocultos por el horizonte · { $dop } · hueco: no a la vista

engine-geometry-chart-satellites-as-given = satélites tal como se indican

engine-geometry-chart-representative-sky = cielo representativo, no uno fechado

engine-geometry-chart-footer = Kshana v{ $version } · geometría bajo un modelo de error declarado · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = Niveles de protección RAIM frente a límites de alerta

engine-gnss-sim-chart-protection-level-m = nivel de protección (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/main.rs

engine-main-fail = error: { $e }

## legal (advisories, disclaimers and notices; the English text is the source, the constant in code is what machine files carry)

# legal: native review
engine-legal-compliance-statement = Una fila marcada como con evidencia significa que una ejecución de este conjunto aporta evidencias a favor de las capacidades que nombra la fila. No es una determinación de que se satisfaga un marco normativo, ni significa que nadie haya calificado ni aprobado ningún producto. La columna de brecha indica lo que las ejecuciones no muestran.

# legal: native review
engine-legal-bench-surface-notice = Solo movimiento del vehículo e intervalos de eventos etiquetados. Nada de lo exportado aquí es, modela ni genera una señal de radiofrecuencia o de banda base, y un evento es un intervalo de tiempo, no una receta para producir interferencia. El simulador de laboratorio y su operador suministran las señales y son responsables de ejecutarlas únicamente donde esté permitido (conducidas o apantalladas, según las propias instrucciones de seguridad del simulador). Kshana no publica resultados de tales ejecuciones.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC a nivel de ventana de cada monitor sobre las grabaciones indicadas. Cada ventana de evento indicada es un positivo y cada ventana de roc_window_s fuera de los eventos es un negativo; una ventana cuenta en un umbral cuando el estadístico de prueba del monitor lo alcanza en la ventana. P_fa se refiere a cada ventana negativa, no a cada prueba.

# legal: native review
engine-legal-lunanet-afs-advisory = Orientativo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Comprueba un flujo de símbolos frente a una edición de una especificación publicada y no dice nada sobre ningún nodo o servicio de LunaNet.

# legal: native review
engine-legal-iqfit-statement = MODELLED: cada número ajustado describe el receptor abierto (el diseño de lazo indicado y la cadena de etapa de entrada) sobre las grabaciones que se le dieron, ajustado a los resultados puntuados de la campaña. No es una medición de ningún otro receptor. Las predicciones se etiquetan PREDICTION, con la grabación ensayada más próxima y la distancia fuera de las condiciones ensayadas.

# legal: native review
engine-legal-iqfit-advisory = Orientativo: salida de análisis, no un equipo de navegación homologado; las predicciones son salidas de modelo con error declarado, no garantías.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Declaración de fuente, no una afirmación: el material de ICG WG-B Lunar PNT de junio de 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, fuente S3 del estudio) describe un laboratorio de referencia de tiempo lunar en la estación con un objetivo de tiempo del orden del nanosegundo. Kshana cita ese objetivo solo como contexto; no lo adopta, y nada de este bloque muestra que el reloj de ninguna estación real lo alcance.

# legal: native review
engine-legal-standards-pack-notice = Un paquete de normas mide escenarios calculados a partir de un modelo frente a umbrales fijados antes de la ejecución. Aporta evidencias a favor de las filas de marco que nombra; no califica ni aprueba ningún producto, y un umbral MET indica únicamente que la salida calculada a partir de un modelo del escenario alcanzó el umbral fijado.

# legal: native review
engine-legal-standards-pack-advisory = Orientativo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana; no debe ser la única base de ninguna decisión de navegación o de seguridad.

# legal: native review
engine-legal-geometry-statement = Geometría bajo un modelo de error declarado (MODELLED): visibilidad en línea de visión frente al horizonte declarado, dilución de la precisión y una elipse de error gaussiana para errores de distancia gaussianos, independientes, iguales y de media cero del error equivalente de distancia del usuario declarado. No es una predicción del error real de un receptor, que además tiene sesgos, multitrayecto y errores sin línea de visión, y no es una cota de integridad. Las constelaciones predefinidas son una geometría representativa, no el cielo de esa fecha en ese lugar.

# legal: native review
engine-legal-resilience-disclaimer = Autoevaluación derivada de simulación alineada con DHS RPCF v2.0. Esto no es una certificación ni una acreditación, y no representa la aprobación de ninguna autoridad (DHS, IEEE ni otra). Cada subpuntuación es MODELLED salvo que se etiquete explícitamente VALIDATED, y las puntuaciones son cifras de mérito del dominio del tiempo y de detección, no de exactitud en el dominio de la posición.

# legal: native review
engine-legal-observatory-notice = Una celda degradada significa que una proporción alta de aeronaves informó allí de baja exactitud de navegación ese día. No se atribuye ninguna causa. Una celda no observada, o ausente, no fue evaluada, lo cual no equivale a despejada. Solo orientativo: no es una aprobación, una certificación ni una declaración de conformidad.

# legal: native review
engine-legal-receiver-trust-advisory = Software de carácter consultivo, no un equipo de navegación homologado (IEC 61108, IEC 61162): el operador sigue siendo responsable de la navegación del buque.

# legal: native review
engine-legal-evidence-roundtrip-notice = Vincula cuatro registros mediante hash: el escenario, las condiciones de ensayo indicadas por el laboratorio, el registro del receptor y la puntuación de ese registro frente a los eventos indicados. No es una señal, no es una receta de reproducción y no es una certificación. La forma en que el movimiento del escenario llegó al receptor (un archivo reproducido mediante un simulador de laboratorio, conducido o apantallado) fue responsabilidad del operador y aquí se registra únicamente tal como se indicó.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Este paquete es un registro técnico de lo que el motor de Kshana calculó a partir del registro de receptor indicado con la configuración indicada. No es un dictamen jurídico, ni una determinación de hechos sobre ningún evento o su causa, ni una certificación.

# legal: native review
engine-legal-bench-notice = Orientativo: calculado a partir de un modelo o medido frente a referencias indicadas, no una aprobación, una certificación ni una declaración de conformidad. Una puntuación describe un registro o un corpus, nunca un producto.

# legal: native review
engine-legal-osnma-advisory = Orientativo: esto es una salida de análisis y monitorización y no un equipo de navegación homologado. El estado de autenticación aquí informado no es un servicio de integridad de la navegación y no debe ser la única base de ninguna decisión de navegación o de seguridad.

## added by the second pass

engine-holdover-test-not-recovered-within-record = ; no recuperado dentro del registro

engine-holdover-test-chart-title = Prueba de holdover: error de tiempo por paso

engine-holdover-test-chart-y-title = |error de tiempo| (ns)

engine-holdover-test-chart-panel-caption = error de tiempo absoluto; paso de holdover sombreado; las líneas discontinuas son los presupuestos de error de tiempo

engine-holdover-test-chart-gnss-removed = GNSS retirado

engine-holdover-test-chart-gnss-restored = GNSS restablecido

engine-holdover-test-chart-time-axis = tiempo en el eje del registro ({ $min } min)

engine-hybrid-chart-title = Utilización de la especificación del PNT híbrido durante una interrupción de GNSS (1.0 = especificación)

engine-hybrid-chart-y-title = utilización de la especificación

engine-hybrid-chart-spec-line = especificación (1.0)

engine-hybrid-chart-classical-suite = conjunto clásico

engine-hybrid-chart-quantum-suite = conjunto cuántico

engine-hybrid-integrity-chart-availability = disponibilidad

engine-hybrid-integrity-chart-precision = precisión

engine-hybrid-integrity-chart-integrity = integridad

engine-hybrid-integrity-chart-joint-indep = conjunta (indep.)

engine-hybrid-integrity-chart-joint-corr = conjunta (corr.)

engine-hybrid-integrity-chart-title = Figura de mérito conjunta del PNT híbrido óptico + RF

engine-hybrid-integrity-chart-subtitle = P(disponible AND de grado de precisión AND integridad asegurada)

engine-inertial-chart-title = Error de posición por estima durante una interrupción de GNSS

engine-inertial-chart-y-title = error de posición (m)

engine-inertial-chart-spec-line = especificación { $m } m

engine-inertial-chart-classical = clásico: { $id }

engine-inertial-chart-quantum = cuántico: { $id }

engine-iq-campaign-report-roc-aria-label = ROC de detección por monitor

engine-iq-campaign-report-roc-x-title = P_fa (por ventana negativa)

engine-iq-campaign-report-curve-aria-label = Degradación del C/N0 frente al J/S indicado para { $rec } evento { $ev }

engine-iq-campaign-report-curve-x-title = J/S indicado (dB)

engine-iq-campaign-report-curve-y-title = degradación del C/N0 (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: referencia SSC, Q = { $q }

engine-iq-campaign-report-curve-model-legend = referencia { $label } (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } serie(s) más en la tabla de resultados

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, degradación medida { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (medido)

engine-jamming-chart-title = Satélites visibles frente a satélites seguidos bajo jamming

engine-jamming-chart-y-title = satélites

engine-jamming-chart-four-sv-fix = solución con 4 SV

engine-jamming-chart-visible = visibles

engine-jamming-chart-tracking = seguidos

engine-leo-fusion-ntn-chart-title = Posicionamiento 5G NTN: cota de Cramér-Rao de la distancia según el ancho de banda

engine-leo-fusion-ntn-chart-caption = desviación típica de la distancia (log10 m): barra = de la máscara al C/N0 en el cenit; punto = error RMS de la solución 3D

engine-leo-fusion-ppp-chart-title = Convergencia del PPP con aumentación LEO

engine-leo-fusion-ppp-chart-caption = error horizontal mediano (log10 m) frente a minutos

engine-leo-fusion-pvt-kind-chart-doppler-caption = error de la solución Doppler 3D (log10 m) frente a la longitud de ventana

engine-leo-fusion-pvt-kind-chart-doppler-x-label = ventana (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = PDOP mediano (azul) y VDOP mediano (ámbar), log10, frente a satélites LEO añadidos

engine-leo-fusion-pvt-kind-chart-joint-x-label = satélites LEO añadidos

engine-leo-fusion-pvt-kind-chart-polar-caption = VDOP mediano (log10): gris GNSS, azul LEO, ámbar fusionado

engine-leo-fusion-pvt-kind-chart-polar-x-label = latitud (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = error de tiempo RMS respecto a UTC (log10 ns) frente al desplazamiento de C/N0, una línea por oscilador

engine-leo-fusion-pvt-kind-chart-timing-x-label = desplazamiento de C/N0 (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 } a { $x1 }

engine-leo-navmsg-chart-title = Mensaje de navegación LEO: SISRE frente al intervalo de ajuste

engine-leo-navmsg-chart-no-trade-encode-decode = Sin compromiso en esta ejecución; consulte result.json para las tablas de codificación/decodificación y de presupuesto.

engine-leo-navmsg-chart-no-fit-interval-trade = Sin compromiso de intervalo de ajuste en esta ejecución; consulte result.json.

engine-leo-navmsg-chart-caption = SISRE RMS solo de órbita (m, escala logarítmica) frente al intervalo de ajuste (s)

engine-leo-pass-chart-title = Paso LEO: C/N0 por banda y Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 a 80): bandas LEO en color, GNSS en gris

engine-leo-pass-chart-time-axis = tiempo desde la época, 0 a { $s } s

engine-leo-pnt-chain-chart-subtitle = diseño de señal -> C/N0 del paso y jitter de código -> SISRE del mensaje -> solución fusionada · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 del componente seguido a lo largo del paso (dB-Hz, 20 a 80)

engine-leo-pnt-chain-chart-not-available = n. d.

engine-leo-signal-chart-title = Diseños de señal LEO-PNT

engine-leo-signal-chart-psd-axis = desplazamiento sobre ±0.6 × ancho de banda de transmisión; 0 a −50 dB bajo cada pico

engine-leo-signal-chart-jitter-caption = jitter de código (m, escala logarítmica) frente a C/N0 total (dB-Hz)
