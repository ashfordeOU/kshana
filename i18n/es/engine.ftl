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

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one]
            { $n_gaps ->
                [one] el registro { $format } tiene { $n_missing } época ausente en { $n_gaps } hueco sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
                [many] el registro { $format } tiene { $n_missing } época ausente en { $n_gaps } de huecos sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
               *[other] el registro { $format } tiene { $n_missing } época ausente en { $n_gaps } huecos sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
            }
        [many]
            { $n_gaps ->
                [one] el registro { $format } tiene { $n_missing } de épocas ausentes en { $n_gaps } hueco sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
                [many] el registro { $format } tiene { $n_missing } de épocas ausentes en { $n_gaps } de huecos sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
               *[other] el registro { $format } tiene { $n_missing } de épocas ausentes en { $n_gaps } huecos sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
            }
       *[other]
            { $n_gaps ->
                [one] el registro { $format } tiene { $n_missing } épocas ausentes en { $n_gaps } hueco sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
                [many] el registro { $format } tiene { $n_missing } épocas ausentes en { $n_gaps } de huecos sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
               *[other] el registro { $format } tiene { $n_missing } épocas ausentes en { $n_gaps } huecos sobre una cuadrícula de { $tau0 } s; defina gaps = "longest" para conservar el tramo continuo más largo o gaps = "linear" para interpolar
            }
    }


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

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } fila de una columna no numérica
        [many] { $n } de filas de una columna no numérica
       *[other] { $n } filas de una columna no numérica
    }


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

engine-e-animation-animation-duration-must-be-between = la duración de la animación debe estar entre { $lit_0_5 } s y 600 s, se recibió { $duration_s }

engine-e-animation-animation-width-must-be-between = el ancho de la animación debe estar entre 480 y 3840 píxeles, se recibió { $width }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] duración x fps da { $n } fotograma; la secuencia de fotogramas requiere entre 2 y { $v1 }
        [many] duración x fps da { $n } de fotogramas; la secuencia de fotogramas requiere entre 2 y { $v1 }
       *[other] duración x fps da { $n } fotogramas; la secuencia de fotogramas requiere entre 2 y { $v1 }
    }


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

engine-antenna-limb-capture-is-reached-on = la captura del limbo SE ALCANZA en esta cuadrícula (altitud { $a_lo }-{ $a_hi } m x ancho de haz { $b_lo }-{ $b_hi } deg, { $points2 } puntos): { $points } de { $points2 } puntos de operación muestreados capturan el limbo y se localizaron { $crossings } cruce(s) de eje; el J/S de limbo más alto muestreado es { $limb_js_db } dB a la altitud { $altitude_m } m / ancho de haz { $hpbw_deg } deg, frente a un umbral de captura de { $thr } dB.

engine-antenna-limb-capture-is-not-reached = la captura del limbo NO se alcanza en ningún punto de esta cuadrícula (altitud { $a_lo }-{ $a_hi } m x ancho de haz { $b_lo }-{ $b_hi } deg, { $points } puntos): no es captura nula, sino ausencia de captura del limbo; el mejor J/S de limbo es { $limb_js_db } dB a la altitud { $altitude_m } m / ancho de haz { $hpbw_deg } deg, { $shortfall } dB por debajo del umbral de captura de { $thr } dB; ese punto de operación capturaría el limbo con una potencia de transmisión de { $limb_capture_tx_power_dbw } dBW, frente a los { $p_tx_dbw } dBW en vuelo.

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

engine-aocs-kind-aocs-wheels-slew-from-deg =
    { $n_w ->
        [one] aocs: { $n_w } rueda, maniobra de { $duration_s } s desde { $series_err } deg -> { $settle } | final { $final_err } deg | pico de rueda { $peak_speed } rpm | { $v7 }
        [many] aocs: { $n_w } de ruedas, maniobra de { $duration_s } s desde { $series_err } deg -> { $settle } | final { $final_err } deg | pico de rueda { $peak_speed } rpm | { $v7 }
       *[other] aocs: { $n_w } ruedas, maniobra de { $duration_s } s desde { $series_err } deg -> { $settle } | final { $final_err } deg | pico de rueda { $peak_speed } rpm | { $v7 }
    }


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

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] tipo de escenario { $other } desconocido — ¿quiso decir { $hint }? `kshana kinds` lista el único tipo integrado ({ $n }).
        [many] tipo de escenario { $other } desconocido — ¿quiso decir { $hint }? `kshana kinds` lista los { $n } de tipos integrados.
       *[other] tipo de escenario { $other } desconocido — ¿quiso decir { $hint }? `kshana kinds` lista los { $n } tipos integrados.
    }


engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] tipo de escenario { $other } desconocido. `kshana kinds` lista el único tipo integrado ({ $n }).
        [many] tipo de escenario { $other } desconocido. `kshana kinds` lista los { $n } de tipos integrados.
       *[other] tipo de escenario { $other } desconocido. `kshana kinds` lista los { $n } tipos integrados.
    }


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

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] integridad | { $n_sats } satélite | { $samples_available }/{ $samples_total } épocas disponibles ({ $report } %) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } eventos de integridad, { $report3 } HMI
        [many] integridad | { $n_sats } de satélites | { $samples_available }/{ $samples_total } épocas disponibles ({ $report } %) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } eventos de integridad, { $report3 } HMI
       *[other] integridad | { $n_sats } satélites | { $samples_available }/{ $samples_total } épocas disponibles ({ $report } %) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } eventos de integridad, { $report3 } HMI
    }


engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | polo sur | { $samples_available }/{ $samples_total } épocas disponibles ({ $report } %) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | tasa secular LTC−TT { $secular_rate_us_per_day } µs/day (banda { $band_low }–{ $band_high }) | autopotencial { $self_potential_us_per_day } cinético { $kinetic_us_per_day } | desfase @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | línea base { $baseline_km } km | distancia a la baliza { $beacon_range_km } km | retardo { $report } µs (tasa { $delay_rate_s_per_s } s/s) | campo cercano { $near_field_correction_us } µs | { $samples } muestras en { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_sat ->
        [one]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satélite, { $n_earth } estación terrestre | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
                [many] lunar-joint-od-clock | { $n_sat } satélite, { $n_earth } de estaciones terrestres | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
               *[other] lunar-joint-od-clock | { $n_sat } satélite, { $n_earth } estaciones terrestres | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
            }
        [many]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } de satélites, { $n_earth } estación terrestre | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
                [many] lunar-joint-od-clock | { $n_sat } de satélites, { $n_earth } de estaciones terrestres | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
               *[other] lunar-joint-od-clock | { $n_sat } de satélites, { $n_earth } estaciones terrestres | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
            }
       *[other]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satélites, { $n_earth } estación terrestre | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
                [many] lunar-joint-od-clock | { $n_sat } satélites, { $n_earth } de estaciones terrestres | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
               *[other] lunar-joint-od-clock | { $n_sat } satélites, { $n_earth } estaciones terrestres | error 3-D de estación con VLBI { $station_pos_err_m } m frente a solo distancia { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× más preciso) | posición del satélite RMS { $sat_pos_rms_m } m | error de reloj de estación { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parámetros
            }
    }


engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } punto | error de traslación { $trans_err_norm_m } m, error de rotación { $rot_err_norm_rad } rad, error de escala { $scale_err_ppb } ppb | residuo RMS { $rms_residual_m } m | convergido { $converged }
        [many] lunar-frame-realisation | { $n_points } de puntos | error de traslación { $trans_err_norm_m } m, error de rotación { $rot_err_norm_rad } rad, error de escala { $scale_err_ppb } ppb | residuo RMS { $rms_residual_m } m | convergido { $converged }
       *[other] lunar-frame-realisation | { $n_points } puntos | error de traslación { $trans_err_norm_m } m, error de rotación { $rot_err_norm_rad } rad, error de escala { $scale_err_ppb } ppb | residuo RMS { $rms_residual_m } m | convergido { $converged }
    }


engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } satélites ({ $geometry_label }) | { $n_grid_points } puntos × { $n_epochs } épocas | cobertura { $coverage_pct } % (PDOP<{ $pdop_threshold }) | satélites { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | disponibilidad PL { $pl_availability_pct } % | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemérides { $report } ({ $provenance }) σ_URE requerido { $fmt } frente a kepleriano { $fmt2 } frente a perturbado { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    { $n_sats ->
        [one] lunar-differential-pnt | { $n_sats } satélite (ilustrativo, de clase LCNS, sin afiliación) | línea base { $baseline_km } km | error de usuario { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (reducción ×{ $reduction_factor }) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [many] lunar-differential-pnt | { $n_sats } de satélites (ilustrativos, de clase LCNS, sin afiliación) | línea base { $baseline_km } km | error de usuario { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (reducción ×{ $reduction_factor }) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
       *[other] lunar-differential-pnt | { $n_sats } satélites (ilustrativos, de clase LCNS, sin afiliación) | línea base { $baseline_km } km | error de usuario { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (reducción ×{ $reduction_factor }) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
    }


engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } puntos x { $n_epochs } épocas x { $n_trials } ensayos | disponibilidad { $v4 } % | cobertura { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | corregido p{ $percentile } 3-D { $f } (sin corregir { $f2 }) | HPL máx. { $f3 } | MODELLED; no es una afirmación sobre ningún sistema real

engine-api-builtins-terrain-horizon-at-the-station = { " " }| horizonte del terreno ({ $sources }) en la estación máx. { $horizon_max_deg } deg, puntos de usuario media de máx. { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estado, OEM { $oem_line_count } línea | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estado, OEM { $oem_line_count } de líneas | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estado, OEM { $oem_line_count } líneas | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
        [many]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } de estados, OEM { $oem_line_count } línea | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } de estados, OEM { $oem_line_count } de líneas | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } de estados, OEM { $oem_line_count } líneas | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
       *[other]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estados, OEM { $oem_line_count } línea | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estados, OEM { $oem_line_count } de líneas | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estados, OEM { $oem_line_count } líneas | comprobación de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida y vuelta de OEM { $v8 } | ida y vuelta de metatiempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
    }


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

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] escenario { $r } | { $source } | { $n_samples } muestra | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | velocidad { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [many] escenario { $r } | { $source } | { $n_samples } de muestras | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | velocidad { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] escenario { $r } | { $source } | { $n_samples } muestras | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | velocidad { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }


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

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one]
            { $n_alarm ->
                [one] { " " }| RAIM disponible { $n_available } de { $n_epochs } época ({ $n_denied } denegadas, { $n_alarm } alarma; MODELLED)
                [many] { " " }| RAIM disponible { $n_available } de { $n_epochs } época ({ $n_denied } denegadas, { $n_alarm } de alarmas; MODELLED)
               *[other] { " " }| RAIM disponible { $n_available } de { $n_epochs } época ({ $n_denied } denegadas, { $n_alarm } alarmas; MODELLED)
            }
        [many]
            { $n_alarm ->
                [one] { " " }| RAIM disponible { $n_available } de { $n_epochs } de épocas ({ $n_denied } denegadas, { $n_alarm } alarma; MODELLED)
                [many] { " " }| RAIM disponible { $n_available } de { $n_epochs } de épocas ({ $n_denied } denegadas, { $n_alarm } de alarmas; MODELLED)
               *[other] { " " }| RAIM disponible { $n_available } de { $n_epochs } de épocas ({ $n_denied } denegadas, { $n_alarm } alarmas; MODELLED)
            }
       *[other]
            { $n_alarm ->
                [one] { " " }| RAIM disponible { $n_available } de { $n_epochs } épocas ({ $n_denied } denegadas, { $n_alarm } alarma; MODELLED)
                [many] { " " }| RAIM disponible { $n_available } de { $n_epochs } épocas ({ $n_denied } denegadas, { $n_alarm } de alarmas; MODELLED)
               *[other] { " " }| RAIM disponible { $n_available } de { $n_epochs } épocas ({ $n_denied } denegadas, { $n_alarm } alarmas; MODELLED)
            }
    }


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

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] los valores a priori requieren subconjuntos de { $n_fault_max } evento simultáneo; esta vía enumera como máximo { $most }
        [many] los valores a priori requieren subconjuntos de { $n_fault_max } de eventos simultáneos; esta vía enumera como máximo { $most }
       *[other] los valores a priori requieren subconjuntos de { $n_fault_max } eventos simultáneos; esta vía enumera como máximo { $most }
    }


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

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: este compromiso es provisional y su semilla fue expuesta; no es un conjunto reservado de publicación

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: la semilla no es la que corresponde a este compromiso

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

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (estadístico de monitorización por defecto { $lit_0_35 })

engine-bench-tasks-malformed-clock-line = línea de reloj `{ $line }` mal formada

engine-bench-tasks-the-clock-file-does-not = el archivo de reloj no coincide con el SHA-256 fijado (se obtuvo { $got }, se esperaba { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = el satélite { $prn } no está en el archivo de reloj

engine-bench-tasks-kshana-bench-baseline = línea base de kshana-bench: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = las predicciones cubren { $pmap } casos, la verdad de referencia tiene { $tarr }

engine-bench-tasks-case-has-no-number-array = el caso `{ $id }` no tiene matriz de números

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] el caso `{ $id }` requiere { $n } valor, tiene { $a }
        [many] el caso `{ $id }` requiere { $n } de valores, tiene { $a }
       *[other] el caso `{ $id }` requiere { $n } valores, tiene { $a }
    }


engine-bench-tasks-case-has-non-finite-value = el caso `{ $id }` tiene un valor no finito

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialización de { $name }: { $e }

engine-e-bin-crossover-study-write = escritura de { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = error: no se puede crear { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = terminado: inercial { $nodes } nodos, reloj { $curves } curvas (semilla 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } época de usuario x 3 valores de URA en { $dt } s = { $v1 } ms por época de usuario ({ $ok } resoluble(s))
        [many] { $n } de épocas de usuario x 3 valores de URA en { $dt } s = { $v1 } ms por época de usuario ({ $ok } resoluble(s))
       *[other] { $n } épocas de usuario x 3 valores de URA en { $dt } s = { $v1 } ms por época de usuario ({ $ok } resoluble(s))
    }


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

engine-e-body-pnt-user-altitude-must-be-positive = la altitud del usuario debe ser positiva y la excentricidad estar en [0, { $lit_0_9 })

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

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] usuario { $user_kind } · { $n_relays } relé · tiempo luz de la Tierra { $one_way_light_time_s } s · MODELLED
        [many] usuario { $user_kind } · { $n_relays } de relés · tiempo luz de la Tierra { $one_way_light_time_s } s · MODELLED
       *[other] usuario { $user_kind } · { $n_relays } relés · tiempo luz de la Tierra { $one_way_light_time_s } s · MODELLED
    }


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

engine-campaign-sweep-of-over-nodes-each = barrido de `{ $scenario_kind }` sobre { $axis_order } ({ $nodes } nodos; cada línea en su propio rango)

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

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    { $n_links ->
        [one] cislunar-observability | { $c } s/c ({ $refs } referencias) | arco de { $arc_hours } h, { $rank_arc } épocas | rango { $first } → { $last } de { $state_dim } a lo largo del arco | λ de la gramiana [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rango instantáneo solo distancia { $rank_range_only } → distancia+tasa { $rank_range_rate } ({ $n_links } enlace) | GDOP solo distancia { $ro } distancia+tasa { $rr } | condiciones iniciales de DRO (residuo máx. de periodicidad { $max_resid }) | posterior SRIF finito en la época de rango 4 { $srif_epoch } (verificado frente a una referencia independiente: rango/STM/cierre de DRO/SRIF; calculado a partir de un modelo: diseño)
        [many] cislunar-observability | { $c } s/c ({ $refs } referencias) | arco de { $arc_hours } h, { $rank_arc } épocas | rango { $first } → { $last } de { $state_dim } a lo largo del arco | λ de la gramiana [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rango instantáneo solo distancia { $rank_range_only } → distancia+tasa { $rank_range_rate } ({ $n_links } de enlaces) | GDOP solo distancia { $ro } distancia+tasa { $rr } | condiciones iniciales de DRO (residuo máx. de periodicidad { $max_resid }) | posterior SRIF finito en la época de rango 4 { $srif_epoch } (verificado frente a una referencia independiente: rango/STM/cierre de DRO/SRIF; calculado a partir de un modelo: diseño)
       *[other] cislunar-observability | { $c } s/c ({ $refs } referencias) | arco de { $arc_hours } h, { $rank_arc } épocas | rango { $first } → { $last } de { $state_dim } a lo largo del arco | λ de la gramiana [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rango instantáneo solo distancia { $rank_range_only } → distancia+tasa { $rank_range_rate } ({ $n_links } enlaces) | GDOP solo distancia { $ro } distancia+tasa { $rr } | condiciones iniciales de DRO (residuo máx. de periodicidad { $max_resid }) | posterior SRIF finito en la época de rango 4 { $srif_epoch } (verificado frente a una referencia independiente: rango/STM/cierre de DRO/SRIF; calculado a partir de un modelo: diseño)
    }


engine-cislunar-observability-never-rank-of = nunca (rango { $rank } de { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | familia { $family }, { $state_dim } estados, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | umbral de rango { $rank_thr } (cuadrícula { $c } h) | umbral de estimabilidad (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = primera longitud de arco en la que la incertidumbre formal de posición 1σ del estado INICIAL del satélite principal, σ_pos = sqrt(trace(P_rr)) con P = (ÕᵀÕ)⁻¹ y Õ la matriz de observabilidad blanqueada respecto al ruido de medición, cae a { $sigma_pos_threshold_km } km o por debajo. Es el criterio bajo el cual un umbral de longitud de arco depende del ruido: P escala como σ², por lo que σ_pos escala como σ, mientras que el criterio de rango anterior no varía con σ. La cota es una elección de ingeniería DECLARADA, no ajustada — estimability_sweep informa el umbral para otras cuatro cotas.

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] EXTENSIÓN (R3) — esta ejecución NO es la configuración DRO plana que describe el `label` anterior. Dimensión de estado { $state_dim }; familia de órbita { $family }; { $n_spacecraft } nave; sigma de medición de distancia { $sigma_range_m } m. Donde `label` dice "planar" y "planar DROs", léase la familia indicada aquí. Adiciones VALIDATED: la STM variacional de 6x6 es la misma STM CR3BP verificada por diferencias finitas (crate::cr3bp) usada a ancho completo; las filas jacobianas espaciales de distancia / tasa de distancia son derivadas parciales analíticas verificadas por diferencias finitas, y la fila de tasa de distancia se contrastó componente a componente con la función independiente 3-D del crate deepspace_od::range_rate_observable; las condiciones iniciales de halo / NRHO son órbitas periódicas corregidas diferencialmente por el mismo corrector que reproduce la NRHO 9:2 sur de L2 publicada, continuadas desde esa semilla publicada, y se informa el residuo de cierre de cada miembro; los veredictos de RANGO de seis estados se confirman frente a un rango escalonado por filas INDEPENDIENTE (eliminación gaussiana con pivoteo parcial) que no comparte código con la vía de valores propios/SVD. ALCANCE REAL DE LA VÍA SRIF: la validación cruzada SRIF anterior consume los MISMOS jacobianos de medición y se reduce a la misma O^T O, de modo que su concordancia es una comprobación de consistencia entre dos máquinas numéricas, NO una corroboración independiente del umbral — no se cuenta como verificación de ninguna cifra aquí. MODELLED: el diseño de la familia (qué abscisas, amplitudes y fases), la cuadrícula de épocas, el arco de un solo enlace y la cota de posición declarada del criterio de estimabilidad.
        [many] EXTENSIÓN (R3) — esta ejecución NO es la configuración DRO plana que describe el `label` anterior. Dimensión de estado { $state_dim }; familia de órbita { $family }; { $n_spacecraft } de naves; sigma de medición de distancia { $sigma_range_m } m. Donde `label` dice "planar" y "planar DROs", léase la familia indicada aquí. Adiciones VALIDATED: la STM variacional de 6x6 es la misma STM CR3BP verificada por diferencias finitas (crate::cr3bp) usada a ancho completo; las filas jacobianas espaciales de distancia / tasa de distancia son derivadas parciales analíticas verificadas por diferencias finitas, y la fila de tasa de distancia se contrastó componente a componente con la función independiente 3-D del crate deepspace_od::range_rate_observable; las condiciones iniciales de halo / NRHO son órbitas periódicas corregidas diferencialmente por el mismo corrector que reproduce la NRHO 9:2 sur de L2 publicada, continuadas desde esa semilla publicada, y se informa el residuo de cierre de cada miembro; los veredictos de RANGO de seis estados se confirman frente a un rango escalonado por filas INDEPENDIENTE (eliminación gaussiana con pivoteo parcial) que no comparte código con la vía de valores propios/SVD. ALCANCE REAL DE LA VÍA SRIF: la validación cruzada SRIF anterior consume los MISMOS jacobianos de medición y se reduce a la misma O^T O, de modo que su concordancia es una comprobación de consistencia entre dos máquinas numéricas, NO una corroboración independiente del umbral — no se cuenta como verificación de ninguna cifra aquí. MODELLED: el diseño de la familia (qué abscisas, amplitudes y fases), la cuadrícula de épocas, el arco de un solo enlace y la cota de posición declarada del criterio de estimabilidad.
       *[other] EXTENSIÓN (R3) — esta ejecución NO es la configuración DRO plana que describe el `label` anterior. Dimensión de estado { $state_dim }; familia de órbita { $family }; { $n_spacecraft } naves; sigma de medición de distancia { $sigma_range_m } m. Donde `label` dice "planar" y "planar DROs", léase la familia indicada aquí. Adiciones VALIDATED: la STM variacional de 6x6 es la misma STM CR3BP verificada por diferencias finitas (crate::cr3bp) usada a ancho completo; las filas jacobianas espaciales de distancia / tasa de distancia son derivadas parciales analíticas verificadas por diferencias finitas, y la fila de tasa de distancia se contrastó componente a componente con la función independiente 3-D del crate deepspace_od::range_rate_observable; las condiciones iniciales de halo / NRHO son órbitas periódicas corregidas diferencialmente por el mismo corrector que reproduce la NRHO 9:2 sur de L2 publicada, continuadas desde esa semilla publicada, y se informa el residuo de cierre de cada miembro; los veredictos de RANGO de seis estados se confirman frente a un rango escalonado por filas INDEPENDIENTE (eliminación gaussiana con pivoteo parcial) que no comparte código con la vía de valores propios/SVD. ALCANCE REAL DE LA VÍA SRIF: la validación cruzada SRIF anterior consume los MISMOS jacobianos de medición y se reduce a la misma O^T O, de modo que su concordancia es una comprobación de consistencia entre dos máquinas numéricas, NO una corroboración independiente del umbral — no se cuenta como verificación de ninguna cifra aquí. MODELLED: el diseño de la familia (qué abscisas, amplitudes y fases), la cuadrícula de épocas, el arco de un solo enlace y la cota de posición declarada del criterio de estimabilidad.
    }


engine-cislunar-observability-validated-each-constellation-initial-condition = Verificado frente a una referencia independiente: cada condición inicial de la constelación es una órbita periódica corregida diferencialmente de la familia { $family }, que se cierra en un período con el residuo de periodicidad informado (las DRO planas son además retrógradas respecto a la Luna). La familia se corrige con la razón de masas Tierra-Luna. Calculado a partir de un modelo: la elección de los parámetros y fases de la familia (el diseño de la constelación). El nombre de clave `dro_provenance` se conserva por el esquema del documento publicado; contiene la familia que pidió esta ejecución.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } debe ser finito y positivo, se recibió { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } debe estar en (0, 1), se recibió { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg debe estar en [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems debe nombrar al menos un preajuste

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias requiere bias_m, t0_s y t1_s finitos

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] integrity: { $n } época supera el tope de { $MAX_EPOCHS } épocas; aumente step_s
        [many] integrity: { $n } de épocas superan el tope de { $MAX_EPOCHS } épocas; aumente step_s
       *[other] integrity: { $n } épocas superan el tope de { $MAX_EPOCHS } épocas; aumente step_s
    }


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

engine-e-constellation-eccentricity-must-lie-in = { $what }: la excentricidad { $e } debe estar en [0, { $lit_0_9 })

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

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg debe estar en [{ $lit_0_25 }, 90]

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

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] GNSS de la Tierra a distancia lunar — { $n_satellites } satélite, receptor a { $r } km{ "\u000A" }
        [many] GNSS de la Tierra a distancia lunar — { $n_satellites } de satélites, receptor a { $r } km{ "\u000A" }
       *[other] GNSS de la Tierra a distancia lunar — { $n_satellites } satélites, receptor a { $r } km{ "\u000A" }
    }


engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Limbo de la Tierra desde la constelación: { $earth_limb_half_angle_deg } deg fuera del nadir — todo rayo con destino lunar debe superarlo{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the =
    { $n_trackable ->
        [one] { "  " }{ $n_geometrically_visible } de { $n_satellites } no ocultados; { $n_trackable } supera el umbral de seguimiento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
        [many] { "  " }{ $n_geometrically_visible } de { $n_satellites } no ocultados; { $n_trackable } de superan el umbral de seguimiento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
       *[other] { "  " }{ $n_geometrically_visible } de { $n_satellites } no ocultados; { $n_trackable } superan el umbral de seguimiento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
    }


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

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] traza terrestre de { $source } · { $n_samples } muestra · alt { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
        [many] traza terrestre de { $source } · { $n_samples } de muestras · alt { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
       *[other] traza terrestre de { $source } · { $n_samples } muestras · alt { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
    }


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

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] sky: tle no contiene ningún conjunto de elementos de dos líneas completo; { $n_ignored } línea ignorada, la primera: { $first }
        [many] sky: tle no contiene ningún conjunto de elementos de dos líneas completo; { $n_ignored } de líneas ignoradas, la primera: { $first }
       *[other] sky: tle no contiene ningún conjunto de elementos de dos líneas completo; { $n_ignored } líneas ignoradas, la primera: { $first }
    }


engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. y { $more } más

engine-geometry-element-sets-propagated-by-the =
    { $n ->
        [one] { $n } conjunto de elementos propagado con el SGP4 del motor (WGS-72) hasta { $iso } y rotados a Earth-fixed con UT1 tomado como UTC y sin movimiento polar: el cielo que ese conjunto de elementos da en esa época, no una medición de este.
        [many] { $n } de conjuntos de elementos propagados con el SGP4 del motor (WGS-72) hasta { $iso } y rotados a Earth-fixed con UT1 tomado como UTC y sin movimiento polar: el cielo que esos conjuntos de elementos dan en esa época, no una medición de este.
       *[other] { $n } conjuntos de elementos propagados con el SGP4 del motor (WGS-72) hasta { $iso } y rotados a Earth-fixed con UT1 tomado como UTC y sin movimiento polar: el cielo que esos conjuntos de elementos dan en esa época, no una medición de este.
    }


engine-geometry-element-sets-propagated-by-the-2 =
    { $n ->
        [one] { $n } conjunto de elementos propagado con el SGP4 del motor (WGS-72) hasta la época del conjunto de elementos más reciente más time_s ({ $iso }). No se indicó época, por lo que es un cielo representativo, no el cielo de una fecha determinada.
        [many] { $n } de conjuntos de elementos propagados con el SGP4 del motor (WGS-72) hasta la época del conjunto de elementos más reciente más time_s ({ $iso }). No se indicó época, por lo que es un cielo representativo, no el cielo de una fecha determinada.
       *[other] { $n } conjuntos de elementos propagados con el SGP4 del motor (WGS-72) hasta la época del conjunto de elementos más reciente más time_s ({ $iso }). No se indicó época, por lo que es un cielo representativo, no el cielo de una fecha determinada.
    }


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

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] el escenario produce { $n } época (se necesitan ≥ 2); aumente duration_s o reduzca step_s
        [many] el escenario produce { $n } de épocas (se necesitan ≥ 2); aumente duration_s o reduzca step_s
       *[other] el escenario produce { $n } épocas (se necesitan ≥ 2); aumente duration_s o reduzca step_s
    }


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

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, máx|TE| { $max_abs } ns; { $masks } (MODELLED, medido frente a la máscara)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m debe ser finito y > 0 (se recibió { $sigma_pr_m })

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba debe ser >= 0 y coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: los dos tramos no tienen un tiempo de promediado común. El tramo óptico acumula durante integration_s = { $integration_s } s; el ancho de banda de ruido de lazo del tramo RF B_L = { $dll_bandwidth_hz } Hz promedia durante 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Una razón de dos sigmas tomadas con tiempos de promediado distintos no es una comparación, por lo que no se indica ninguna. Elimine la anulación rf_dll_bandwidth_hz (entonces toma por defecto 1/(2*integration_s)) o defínala en { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: un tramo no es una sigma finita positiva utilizable (óptico { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), por lo que no se forma ninguna razón.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = rf_band '{ $other }' desconocido (se esperaba s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } debe ser finito

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db debe ser finito y >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | huella óptica { $footprint_m } m, { $detected_photons } fotones -> σ de medición de distancia { $c } mm, σ de temporización { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilidad { $c4 }% ({ $n_sites } sitio) | traspaso sin salto { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjunta { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | verificados frente a referencia independiente: CRLB/χ²-PL/unión/traspaso; calculados a partir de un modelo: σ/climatología
        [many] hybrid-optical-rf | huella óptica { $footprint_m } m, { $detected_photons } fotones -> σ de medición de distancia { $c } mm, σ de temporización { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilidad { $c4 }% ({ $n_sites } de sitios) | traspaso sin salto { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjunta { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | verificados frente a referencia independiente: CRLB/χ²-PL/unión/traspaso; calculados a partir de un modelo: σ/climatología
       *[other] hybrid-optical-rf | huella óptica { $footprint_m } m, { $detected_photons } fotones -> σ de medición de distancia { $c } mm, σ de temporización { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilidad { $c4 }% ({ $n_sites } sitios) | traspaso sin salto { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjunta { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | verificados frente a referencia independiente: CRLB/χ²-PL/unión/traspaso; calculados a partir de un modelo: σ/climatología
    }


## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa debe estar en [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class debe ser >= 1

engine-impairment-eval-impairment-eval-detector-auc-in =
    { $n_cases ->
        [one] impairment-eval | detector { $detector } | AUC { $auc_in } dentro / { $auc_out } fuera (brecha { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ objetivo { $target_pfa } | { $n_cases } caso | MODELLED sintético
        [many] impairment-eval | detector { $detector } | AUC { $auc_in } dentro / { $auc_out } fuera (brecha { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ objetivo { $target_pfa } | { $n_cases } de casos | MODELLED sintético
       *[other] impairment-eval | detector { $detector } | AUC { $auc_in } dentro / { $auc_out } fuera (brecha { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ objetivo { $target_pfa } | { $n_cases } casos | MODELLED sintético
    }


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

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELDAS  DÍA UTC  NOT OBSERVED NO ES DESPEJADO  SIN CAUSA ATRIBUIDA

engine-interference-map-observatory-source-licence = FUENTE { $dataset }  LICENCIA { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (CELDAS PUBLICADAS)

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

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } muestra de tiempo es más de las que escribe una exportación ({ $MAX_SAMPLES })
        [many] { $n } de muestras de tiempo son más de las que escribe una exportación ({ $MAX_SAMPLES })
       *[other] { $n } muestras de tiempo son más de las que escribe una exportación ({ $MAX_SAMPLES })
    }


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

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } enumera { $n } valor; indique uno por id ({ $ids })
        [many] { $at }: { $key } enumera { $n } de valores; indique uno por id ({ $ids })
       *[other] { $at }: { $key } enumera { $n } valores; indique uno por id ({ $ids })
    }


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

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } admite { $n } argumento posicional, se recibieron { $pos }
        [many] iq { $cmd } admite { $n } de argumentos posicionales, se recibieron { $pos }
       *[other] iq { $cmd } admite { $n } argumentos posicionales, se recibieron { $pos }
    }


engine-e-iq-cli-cannot-parse-2 = { $k }: no se puede interpretar { $p }

engine-iq-cli-unknown-iq-processing-command-expected = comando de procesamiento iq { $other } desconocido; se esperaba scene, acquire, track, sweep, labfit, frontend, monitor, campaign o conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } fuera de rango para GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = no se encontraron efemérides GPS sanas para los PRN solicitados

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos requiere lat,lon,alt (se recibió { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; perfil de C/N0 ({ $segments } segmento(s))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format debe ser csv o jsonl (se recibió { $other })

engine-iq-cli-scene-written-by-kshana-iq-scene = escrito por kshana iq scene: una escena SIMULADA, no una grabación

engine-iq-cli-scene-ion-sdr-metadata = metadatos ION SDR { $path }

engine-iq-cli-scene-sigmf-data-meta = datos SigMF { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = escrito por kshana iq scene

engine-iq-cli-scene-wrote-samples-hz-to-truth = se escribieron { $samples } muestras ({ $format }, { $fs_hz } Hz) en { $data_path }; { $truth_records } registros de verdad en { $truth_path }; { $meta_note }; canal: { $chan_desc }

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

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz son { $r } muestras por chip de { $c }: un muestreo conmensurable convierte el discriminador de código en una escalera (con 2 muestras/chip el DLL oscila, unos { $lit_0_09 } chip RMS de error de código a 45 dB-Hz); la fluctuación y el sesgo del lazo de código obtenidos de esta grabación no son representativos. Use una tasa que no sea múltiplo de la mitad de la tasa de chip para evaluar los lazos de código.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = el proceso de trabajo terminó antes de procesar esta entrada

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = opción { $s } desconocida

engine-e-iq-io-cli-format-needs-rate = --format requiere --rate

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } admite { $n } argumento de ruta, se recibieron { $pos }
        [many] iq { $cmd } admite { $n } de argumentos de ruta, se recibieron { $pos }
       *[other] iq { $cmd } admite { $n } argumentos de ruta, se recibieron { $pos }
    }


engine-iq-io-cli-unknown-iq-command = comando iq { $other } desconocido

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] se escribieron { $n } muestra ({ $to }, { $fs_hz } Hz) en { $files }; { $w } elemento(s) saturado(s){ $v4 }
        [many] se escribieron { $n } de muestras ({ $to }, { $fs_hz } Hz) en { $files }; { $w } elemento(s) saturado(s){ $v4 }
       *[other] se escribieron { $n } muestras ({ $to }, { $fs_hz } Hz) en { $files }; { $w } elemento(s) saturado(s){ $v4 }
    }


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

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name }: la captura en la muestra { $sample_start } está fuera de orden o más allá de la única muestra ({ $n_file }) de los datos
        [many] { $name }: la captura en la muestra { $sample_start } está fuera de orden o más allá de las { $n_file } de muestras de los datos
       *[other] { $name }: la captura en la muestra { $sample_start } está fuera de orden o más allá de las { $n_file } muestras de los datos
    }


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

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] no ajustado: { $n_reacq } readquisición observada (se necesitan al menos 3)
        [many] no ajustado: { $n_reacq } de readquisiciones observadas (se necesitan al menos 3)
       *[other] no ajustado: { $n_reacq } readquisiciones observadas (se necesitan al menos 3)
    }


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

engine-iq-labfit-iqreport-threshold-direct-median-db-over =
    { $n ->
        [one] J/S umbral, directo: mediana { $om } dB sobre { $n } pérdida (IQR { $t }).{ "\u000A\u000A" }
        [many] J/S umbral, directo: mediana { $om } dB sobre { $n } de pérdidas (IQR { $t }).{ "\u000A\u000A" }
       *[other] J/S umbral, directo: mediana { $om } dB sobre { $n } pérdidas (IQR { $t }).{ "\u000A\u000A" }
    }


engine-iq-labfit-iqreport-hold-out-leave-one-recording = Reserva (dejando una grabación fuera), interpolación: { $bins } intervalos, RMS de C/N0 { $om } dB, cobertura PI90 { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    { $n ->
        [one] { $model }: { $n } evento, RMS del tiempo de pérdida { $om } s, cobertura PI90 { $om2 }
        [many] { $model }: { $n } de eventos, RMS del tiempo de pérdida { $om } s, cobertura PI90 { $om2 }
       *[other] { $model }: { $n } eventos, RMS del tiempo de pérdida { $om } s, cobertura PI90 { $om2 }
    }

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

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } muestra de C/N0, RMS residual { $om } dB.{ $r }{ "\u000A" }
        [many] { "\u000A" }{ $n_samples } de muestras de C/N0, RMS residual { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } muestras de C/N0, RMS residual { $om } dB.{ $r }{ "\u000A" }
    }


engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Modelo: { $model } ({ $label })

    | parámetro | valor | límites | en el límite | sd bootstrap (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one]
            { "\u000A" }RMS del tiempo de evento { $om } s sobre { $n_events } evento; pérdidas omitidas { $loss_missed } / adicionales { $loss_extra }, readquisiciones omitidas { $reacq_missed } / adicionales { $reacq_extra }.

            | ejecución | caída dB-Hz | reenganche dB-Hz | eventos | RMS s |
            |---|---|---|---|---|{ "\u000A" }
        [many]
            { "\u000A" }RMS del tiempo de evento { $om } s sobre { $n_events } de eventos; pérdidas omitidas { $loss_missed } / adicionales { $loss_extra }, readquisiciones omitidas { $reacq_missed } / adicionales { $reacq_extra }.

            | ejecución | caída dB-Hz | reenganche dB-Hz | eventos | RMS s |
            |---|---|---|---|---|{ "\u000A" }
       *[other]
            { "\u000A" }RMS del tiempo de evento { $om } s sobre { $n_events } eventos; pérdidas omitidas { $loss_missed } / adicionales { $loss_extra }, readquisiciones omitidas { $reacq_missed } / adicionales { $reacq_extra }.

            | ejecución | caída dB-Hz | reenganche dB-Hz | eventos | RMS s |
            |---|---|---|---|---|{ "\u000A" }
    }


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

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] se solicitó { $n } muestra; una ejecución corta contiene como máximo { $MAX_SAMPLES }
        [many] se solicitaron { $n } de muestras; una ejecución corta contiene como máximo { $MAX_SAMPLES }
       *[other] se solicitaron { $n } muestras; una ejecución corta contiene como máximo { $MAX_SAMPLES }
    }


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

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path }: { $n } código, el ICD define { $CODES_PER_COMPONENT }
        [many] { $path }: { $n } de códigos, el ICD define { $CODES_PER_COMPONENT }
       *[other] { $path }: { $n } códigos, el ICD define { $CODES_PER_COMPONENT }
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

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one]
            { $n ->
                [one] { $n_meas } medición no puede resolver { $n } incógnita Doppler
                [many] { $n_meas } medición no puede resolver { $n } de incógnitas Doppler
               *[other] { $n_meas } medición no puede resolver { $n } incógnitas Doppler
            }
        [many]
            { $n ->
                [one] { $n_meas } de mediciones no pueden resolver { $n } incógnita Doppler
                [many] { $n_meas } de mediciones no pueden resolver { $n } de incógnitas Doppler
               *[other] { $n_meas } de mediciones no pueden resolver { $n } incógnitas Doppler
            }
       *[other]
            { $n ->
                [one] { $n_meas } mediciones no pueden resolver { $n } incógnita Doppler
                [many] { $n_meas } mediciones no pueden resolver { $n } de incógnitas Doppler
               *[other] { $n_meas } mediciones no pueden resolver { $n } incógnitas Doppler
            }
    }


engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = la geometría Doppler es singular

engine-e-leo-fusion-doppler-no-covariance = sin covarianza

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = cada pseudodistancia requiere un sigma positivo y finito

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    { $n ->
        [one]
            { $n_clock ->
                [one] { $obs } pseudodistancias no pueden resolver { $n } incógnita (3 de posición + { $n_clock } reloj)
                [many] { $obs } pseudodistancias no pueden resolver { $n } incógnita (3 de posición + { $n_clock } de relojes)
               *[other] { $obs } pseudodistancias no pueden resolver { $n } incógnita (3 de posición + { $n_clock } relojes)
            }
        [many]
            { $n_clock ->
                [one] { $obs } pseudodistancias no pueden resolver { $n } de incógnitas (3 de posición + { $n_clock } reloj)
                [many] { $obs } pseudodistancias no pueden resolver { $n } de incógnitas (3 de posición + { $n_clock } de relojes)
               *[other] { $obs } pseudodistancias no pueden resolver { $n } de incógnitas (3 de posición + { $n_clock } relojes)
            }
       *[other]
            { $n_clock ->
                [one] { $obs } pseudodistancias no pueden resolver { $n } incógnitas (3 de posición + { $n_clock } reloj)
                [many] { $obs } pseudodistancias no pueden resolver { $n } incógnitas (3 de posición + { $n_clock } de relojes)
               *[other] { $obs } pseudodistancias no pueden resolver { $n } incógnitas (3 de posición + { $n_clock } relojes)
            }
    }


engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = un satélite coincide con la estimación de posición

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = la geometría es singular

engine-e-leo-fusion-joint-pvt-no-iteration-ran = no se ejecutó ninguna iteración

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = geometría final degenerada

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = el DOP no es finito

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } debe ser positivo

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m debe ser no negativo y la ejecución, de 5000 épocas como máximo

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = cada señal requiere un ancho de banda positivo

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] Posicionamiento 5G NTN a { $r } MHz, C/N0 { $r2 } a { $r3 } dB-Hz, { $n_satellites } satélite ({ $mean_in_view } a la vista){ "\u000A" }
        [many] Posicionamiento 5G NTN a { $r } MHz, C/N0 { $r2 } a { $r3 } dB-Hz, { $n_satellites } de satélites ({ $mean_in_view } a la vista){ "\u000A" }
       *[other] Posicionamiento 5G NTN a { $r } MHz, C/N0 { $r2 } a { $r3 } dB-Hz, { $n_satellites } satélites ({ $mean_in_view } a la vista){ "\u000A" }
    }


engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, rango CRB { $range_sigma_zenith_m } a { $range_sigma_mask_m } m; 3D formal mediano { $s2 } m, error RMS { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }pasada Doppler de un satélite: { $n_obs } muestra durante { $duration_s } s, error horizontal { $horizontal_error_m } m{ "\u000A" }
        [many] { "  " }pasada Doppler de un satélite: { $n_obs } de muestras durante { $duration_s } s, error horizontal { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }pasada Doppler de un satélite: { $n_obs } muestras durante { $duration_s } s, error horizontal { $horizontal_error_m } m{ "\u000A" }
    }


engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP requiere al menos un sistema

engine-e-leo-fusion-ppp-duration-and-step-must-be = la duración y el paso deben ser positivos, con un máximo de 20000 épocas

engine-e-leo-fusion-ppp-runs-must-be-to-200 = las ejecuciones deben ser de 1 a 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = los umbrales de convergencia deben ser positivos

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] Convergencia de PPP a { $criterion_horizontal_m } m horizontal / { $criterion_vertical_m } m vertical, { $runs_per_case } ejecuciones por caso, { $n_gnss } satélite GNSS{ "\u000A" }
        [many] Convergencia de PPP a { $criterion_horizontal_m } m horizontal / { $criterion_vertical_m } m vertical, { $runs_per_case } ejecuciones por caso, { $n_gnss } de satélites GNSS{ "\u000A" }
       *[other] Convergencia de PPP a { $criterion_horizontal_m } m horizontal / { $criterion_vertical_m } m vertical, { $runs_per_case } ejecuciones por caso, { $n_gnss } satélites GNSS{ "\u000A" }
    }


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

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one]
            { $n_sats ->
                [one] { "  " }solución Doppler: { $n_obs } medición de { $n_sats } satélite, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }solución Doppler: { $n_obs } medición de { $n_sats } de satélites, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }solución Doppler: { $n_obs } medición de { $n_sats } satélites, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
            }
        [many]
            { $n_sats ->
                [one] { "  " }solución Doppler: { $n_obs } de mediciones de { $n_sats } satélite, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }solución Doppler: { $n_obs } de mediciones de { $n_sats } de satélites, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }solución Doppler: { $n_obs } de mediciones de { $n_sats } satélites, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
            }
       *[other]
            { $n_sats ->
                [one] { "  " }solución Doppler: { $n_obs } mediciones de { $n_sats } satélite, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }solución Doppler: { $n_obs } mediciones de { $n_sats } de satélites, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }solución Doppler: { $n_obs } mediciones de { $n_sats } satélites, error 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
            }
    }


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

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s y eval_step_s deben estar entre { $lit_0_5 } y 60 s

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

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = la excentricidad debe estar en [0, { $lit_0_1 }) para un ajuste LEO; se recibió { $eccentricity }

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

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live: se descartó { $n } datagrama udp que el motor no pudo tomar ({ $udp_dropped } en total)
        [many] kshana live: se descartaron { $n } de datagramas udp que el motor no pudo tomar ({ $udp_dropped } en total)
       *[other] kshana live: se descartaron { $n } datagramas udp que el motor no pudo tomar ({ $udp_dropped } en total)
    }


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

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } satélite, sin balizas
        [many] { $n_sats } de satélites, sin balizas
       *[other] { $n_sats } satélites, sin balizas
    }


engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one]
            { $n_vis_beacons ->
                [one] { $n_sats } satélite + { $n_vis_beacons } baliza visible
                [many] { $n_sats } satélite + { $n_vis_beacons } de balizas visibles
               *[other] { $n_sats } satélite + { $n_vis_beacons } balizas visibles
            }
        [many]
            { $n_vis_beacons ->
                [one] { $n_sats } de satélites + { $n_vis_beacons } baliza visible
                [many] { $n_sats } de satélites + { $n_vis_beacons } de balizas visibles
               *[other] { $n_sats } de satélites + { $n_vis_beacons } balizas visibles
            }
       *[other]
            { $n_vis_beacons ->
                [one] { $n_sats } satélites + { $n_vis_beacons } baliza visible
                [many] { $n_sats } satélites + { $n_vis_beacons } de balizas visibles
               *[other] { $n_sats } satélites + { $n_vis_beacons } balizas visibles
            }
    }


engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } satélite, sin balizas
        [many] { $n_cmp } de satélites, sin balizas
       *[other] { $n_cmp } satélites, sin balizas
    }


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

engine-e-lunar-frame-campaign-no-observation-in-the-campaign =
    { $n_epochs ->
        [one]
            { $n_beacons ->
                [one] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } época x { $v1 } líneas base x { $n_beacons } baliza, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
                [many] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } época x { $v1 } líneas base x { $n_beacons } de balizas, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
               *[other] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } época x { $v1 } líneas base x { $n_beacons } balizas, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
            }
        [many]
            { $n_beacons ->
                [one] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } de épocas x { $v1 } líneas base x { $n_beacons } baliza, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
                [many] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } de épocas x { $v1 } líneas base x { $n_beacons } de balizas, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
               *[other] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } de épocas x { $v1 } líneas base x { $n_beacons } balizas, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
            }
       *[other]
            { $n_beacons ->
                [one] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } épocas x { $v1 } líneas base x { $n_beacons } baliza, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
                [many] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } épocas x { $v1 } líneas base x { $n_beacons } de balizas, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
               *[other] ninguna observación de la campaña supera la máscara de elevación del lado terrestre de { $mask } deg en ambos extremos de una línea base Y la máscara de { $earth_mask } deg sobre el propio horizonte de la baliza: { $n_epochs } épocas x { $v1 } líneas base x { $n_beacons } balizas, todas rechazadas. Aumente arc_hours, reduzca una máscara o cambie de lugar las estaciones.
            }
    }


engine-lunar-frame-campaign-full-rank-all-similarity-parameters = rango completo: los 7 parámetros de similitud están restringidos por esta campaña (número de condición { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: { $defect } de 7 direcciones de similitud no son observables con esta campaña, por lo que NO se publica ningún sigma de datum; las direcciones no observables se enumeran en la base de siete parámetros

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines =
    { $n_beacons ->
        [one]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } baliza x { $v1 } líneas base x { $n_epochs } época = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } baliza x { $v1 } líneas base x { $n_epochs } de épocas = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } baliza x { $v1 } líneas base x { $n_epochs } épocas = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
            }
        [many]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } de balizas x { $v1 } líneas base x { $n_epochs } época = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } de balizas x { $v1 } líneas base x { $n_epochs } de épocas = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } de balizas x { $v1 } líneas base x { $n_epochs } épocas = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } balizas x { $v1 } líneas base x { $n_epochs } época = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } balizas x { $v1 } líneas base x { $n_epochs } de épocas = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } balizas x { $v1 } líneas base x { $n_epochs } épocas = { $n_obs } obs. (sigma de retardo { $sigma_tau } s) | datum de estación { $station_datum } | rango de Helmert { $rank }/7 cond { $condition } | sigma de traslación del datum { $v5 } frente a error de recuperación de la transformación inyectada { $trans_err_norm_m } m (razón { $v7 })
            }
    }


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

engine-lunar-jamming-lunar-jamming-sats-epochs-links =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } satélites, { $n_epochs } época, { $n_links } enlace desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
                [many] lunar-jamming | { $n_sats } satélites, { $n_epochs } época, { $n_links } de enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
               *[other] lunar-jamming | { $n_sats } satélites, { $n_epochs } época, { $n_links } enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
            }
        [many]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } satélites, { $n_epochs } de épocas, { $n_links } enlace desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
                [many] lunar-jamming | { $n_sats } satélites, { $n_epochs } de épocas, { $n_links } de enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
               *[other] lunar-jamming | { $n_sats } satélites, { $n_epochs } de épocas, { $n_links } enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } satélites, { $n_epochs } épocas, { $n_links } enlace desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
                [many] lunar-jamming | { $n_sats } satélites, { $n_epochs } épocas, { $n_links } de enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
               *[other] lunar-jamming | { $n_sats } satélites, { $n_epochs } épocas, { $n_links } enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (media { $mean_js_db }) | { $n_lost } LOST | disponibilidad { $availability_under_jamming } de { $availability_nominal } nominal
            }
    }


engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } satélites, { $n_epochs } época, { $n_links } enlace desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
                [many] lunar-jamming | { $n_sats } satélites, { $n_epochs } época, { $n_links } de enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } satélites, { $n_epochs } época, { $n_links } enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
            }
        [many]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } satélites, { $n_epochs } de épocas, { $n_links } enlace desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
                [many] lunar-jamming | { $n_sats } satélites, { $n_epochs } de épocas, { $n_links } de enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } satélites, { $n_epochs } de épocas, { $n_links } enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } satélites, { $n_epochs } épocas, { $n_links } enlace desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
                [many] lunar-jamming | { $n_sats } satélites, { $n_epochs } épocas, { $n_links } de enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } satélites, { $n_epochs } épocas, { $n_links } enlaces desde ({ $site_lat_deg }, { $site_lon_deg }) | sin jammer (línea base lunar de cielo limpio) | { $n_lost } LOST | disponibilidad { $availability_nominal }
            }
    }


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

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule =
    { $n_epochs ->
        [one] ninguna observación de la programación supera la máscara de elevación de { $mask } deg en ambos extremos de una línea base: { $n_epochs } época x { $v1 } líneas base, todas rechazadas. Aumente arc_hours, reduzca elevation_mask_deg o cambie de lugar las estaciones.
        [many] ninguna observación de la programación supera la máscara de elevación de { $mask } deg en ambos extremos de una línea base: { $n_epochs } de épocas x { $v1 } líneas base, todas rechazadas. Aumente arc_hours, reduzca elevation_mask_deg o cambie de lugar las estaciones.
       *[other] ninguna observación de la programación supera la máscara de elevación de { $mask } deg en ambos extremos de una línea base: { $n_epochs } épocas x { $v1 } líneas base, todas rechazadas. Aumente arc_hours, reduzca elevation_mask_deg o cambie de lugar las estaciones.
    }


engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = el datum no deja ningún parámetro por estimar

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: { $defect } de { $dim } direcciones no son observables, por lo que no se informa ningún sigma por coordenada; el valor del subespacio observable que figura abajo es una pseudoinversa restringida a las { $rank } direcciones observables y NO es un sigma de estación

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines =
    { $n_stations ->
        [one]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } estación / { $v2 } líneas base x { $n_epochs } época = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } estación / { $v2 } líneas base x { $n_epochs } de épocas = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } estación / { $v2 } líneas base x { $n_epochs } épocas = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
            }
        [many]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } de estaciones / { $v2 } líneas base x { $n_epochs } época = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } de estaciones / { $v2 } líneas base x { $n_epochs } de épocas = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } de estaciones / { $v2 } líneas base x { $n_epochs } épocas = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } estaciones / { $v2 } líneas base x { $n_epochs } época = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } estaciones / { $v2 } líneas base x { $n_epochs } de épocas = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } estaciones / { $v2 } líneas base x { $n_epochs } épocas = { $n_obs } obs. (máscara { $mask } deg) | datum { $datum } | rango { $rank }/{ $dim } cond { $condition } | sigma de estación { $v10 } frente a equipartición g={ $g } { $eq_g } m (razón { $v13 })
            }
    }


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

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok: { $kind } — el kind se resuelve y la única entrada de campo obligatorio publicada ({ $n_required }) está satisfecha; los valores de los campos no se comprueban
        [many] ok: { $kind } — el kind se resuelve y las { $n_required } de entradas de campos obligatorios publicadas están satisfechas; los valores de los campos no se comprueban
       *[other] ok: { $kind } — el kind se resuelve y las { $n_required } entradas de campos obligatorios publicadas están satisfechas; los valores de los campos no se comprueban
    }


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

engine-mars-pnt-mars-pnt-user-clock-relays =
    { $n_relays ->
        [one] mars-pnt { $r } | usuario { $user }, reloj { $clock_class } | { $n_relays } relé (media de { $mean_relays_in_view } a la vista) | RMS de posición convergido { $converged_pos_rms_m } m, 1σ formal { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM de covarianza, no un PL certificado) | σ de frecuencia del reloj { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
        [many] mars-pnt { $r } | usuario { $user }, reloj { $clock_class } | { $n_relays } de relés (media de { $mean_relays_in_view } a la vista) | RMS de posición convergido { $converged_pos_rms_m } m, 1σ formal { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM de covarianza, no un PL certificado) | σ de frecuencia del reloj { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
       *[other] mars-pnt { $r } | usuario { $user }, reloj { $clock_class } | { $n_relays } relés (media de { $mean_relays_in_view } a la vista) | RMS de posición convergido { $converged_pos_rms_m } m, 1σ formal { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM de covarianza, no un PL certificado) | σ de frecuencia del reloj { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
    }


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

engine-e-mcda-copras-copras-weights-but-criterion-types =
    { $n ->
        [one] COPRAS: { $n } peso pero { $types } tipos de criterio
        [many] COPRAS: { $n } de pesos pero { $types } tipos de criterio
       *[other] COPRAS: { $n } pesos pero { $types } tipos de criterio
    }


engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: requiere al menos un criterio de coste (Min)

engine-e-mcda-copras-copras-alternative-has-values-but =
    { $n ->
        [one] COPRAS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterio
        [many] COPRAS: la alternativa { $i } tiene { $row } valores pero hay { $n } de criterios
       *[other] COPRAS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios
    }


engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: el valor { $x } de la alternativa { $i } en el criterio { $j } debe ser finito y > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: conjunto de datos vacío

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: sin criterios

engine-e-mcda-electre-electre-alternative-has-values-but =
    { $n ->
        [one] ELECTRE I: la alternativa { $i } tiene { $row } valores pero hay { $n } criterio
        [many] ELECTRE I: la alternativa { $i } tiene { $row } valores pero hay { $n } de criterios
       *[other] ELECTRE I: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios
    }


engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: la alternativa { $i } tiene un valor no finito

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: matriz de decisión vacía

engine-e-mcda-moora-moora-no-criteria = MOORA: sin criterios

engine-e-mcda-moora-moora-weights-but-criterion-types =
    { $n ->
        [one] MOORA: { $n } peso pero { $types } tipos de criterio
        [many] MOORA: { $n } de pesos pero { $types } tipos de criterio
       *[other] MOORA: { $n } pesos pero { $types } tipos de criterio
    }


engine-e-mcda-moora-moora-alternative-has-values-but =
    { $n ->
        [one] MOORA: la alternativa { $i } tiene { $row } valores pero hay { $n } criterio
        [many] MOORA: la alternativa { $i } tiene { $row } valores pero hay { $n } de criterios
       *[other] MOORA: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios
    }


engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: la alternativa { $i } tiene un valor no finito

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: el criterio { $j } tiene norma L2 cero

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: matriz de decisión vacía

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: sin criterios

engine-e-mcda-promethee-promethee-ii-weights-but-types =
    { $n ->
        [one] PROMETHEE II: { $n } peso pero { $types } tipos / { $prefs } funciones de preferencia
        [many] PROMETHEE II: { $n } de pesos pero { $types } tipos / { $prefs } funciones de preferencia
       *[other] PROMETHEE II: { $n } pesos pero { $types } tipos / { $prefs } funciones de preferencia
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    { $n ->
        [one] PROMETHEE II: la alternativa { $i } tiene { $row } valores pero hay { $n } criterio
        [many] PROMETHEE II: la alternativa { $i } tiene { $row } valores pero hay { $n } de criterios
       *[other] PROMETHEE II: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: la alternativa { $i } tiene un valor no finito

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: matriz de decisión vacía

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: sin criterios

engine-e-mcda-topsis-topsis-weights-but-criterion-types =
    { $n ->
        [one] TOPSIS: { $n } peso pero { $types } tipos de criterio
        [many] TOPSIS: { $n } de pesos pero { $types } tipos de criterio
       *[other] TOPSIS: { $n } pesos pero { $types } tipos de criterio
    }


engine-e-mcda-topsis-topsis-alternative-has-values-but =
    { $n ->
        [one] TOPSIS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterio
        [many] TOPSIS: la alternativa { $i } tiene { $row } valores pero hay { $n } de criterios
       *[other] TOPSIS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios
    }


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

engine-e-mcda-vikor-vikor-weights-but-criterion-types =
    { $n ->
        [one] VIKOR: { $n } peso pero { $types } tipos de criterio
        [many] VIKOR: { $n } de pesos pero { $types } tipos de criterio
       *[other] VIKOR: { $n } pesos pero { $types } tipos de criterio
    }


engine-e-mcda-vikor-vikor-alternative-has-values-but =
    { $n ->
        [one] VIKOR: la alternativa { $i } tiene { $row } valores pero hay { $n } criterio
        [many] VIKOR: la alternativa { $i } tiene { $row } valores pero hay { $n } de criterios
       *[other] VIKOR: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios
    }


engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: la alternativa { $i } tiene un valor no finito

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: matriz de decisión vacía

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: sin criterios

engine-e-mcda-waspas-waspas-weights-but-criterion-types =
    { $n ->
        [one] WASPAS: { $n } peso pero { $types } tipos de criterio
        [many] WASPAS: { $n } de pesos pero { $types } tipos de criterio
       *[other] WASPAS: { $n } pesos pero { $types } tipos de criterio
    }


engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } debe estar en [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    { $n ->
        [one] WASPAS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterio
        [many] WASPAS: la alternativa { $i } tiene { $row } valores pero hay { $n } de criterios
       *[other] WASPAS: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios
    }


engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: el valor { $x } de la alternativa { $i } en el criterio { $j } debe ser finito y > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: matriz de decisión vacía

engine-e-mcda-wpm-wpm-no-criteria = WPM: sin criterios

engine-e-mcda-wpm-wpm-weights-but-criterion-types =
    { $n ->
        [one] WPM: { $n } peso pero { $types } tipos de criterio
        [many] WPM: { $n } de pesos pero { $types } tipos de criterio
       *[other] WPM: { $n } pesos pero { $types } tipos de criterio
    }


engine-e-mcda-wpm-wpm-alternative-has-values-but =
    { $n ->
        [one] WPM: la alternativa { $i } tiene { $row } valores pero hay { $n } criterio
        [many] WPM: la alternativa { $i } tiene { $row } valores pero hay { $n } de criterios
       *[other] WPM: la alternativa { $i } tiene { $row } valores pero hay { $n } criterios
    }


engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: el valor { $x } de la alternativa { $i } en el criterio { $j } debe ser finito y > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = la matriz de decisión no tiene criterios

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = la matriz de decisión no tiene alternativas

engine-e-mcda-wsm-criterion-has-an-invalid-weight = el criterio '{ $name }' tiene un peso no válido { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = los pesos de los criterios suman cero

engine-e-mcda-wsm-alternative-has-values-but-there =
    { $n ->
        [one] la alternativa '{ $name }' tiene { $values } valores pero hay { $n } criterio
        [many] la alternativa '{ $name }' tiene { $values } valores pero hay { $n } de criterios
       *[other] la alternativa '{ $name }' tiene { $values } valores pero hay { $n } criterios
    }


engine-e-mcda-wsm-alternative-has-non-finite-value = la alternativa '{ $name }' tiene un valor no finito en el criterio '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = no es un DAF: más corto que un registro

engine-e-naif-kernel-not-daf-identification-word = no es un DAF: palabra de identificación { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = formato binario DAF no admitido { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = encabezado DAF inverosímil: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = la dirección DAF { $addr } está más allá del final del archivo

engine-e-naif-kernel-bad-daf-address-range = rango de direcciones DAF no válido { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = la lista de resúmenes DAF no termina

engine-e-naif-kernel-daf-summary-record-claims-summaries =
    { $count ->
        [one] el registro de resúmenes DAF { $rec } declara { $count } resumen
        [many] el registro de resúmenes DAF { $rec } declara { $count } de resúmenes
       *[other] el registro de resúmenes DAF { $rec } declara { $count } resúmenes
    }


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

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    { $n_used ->
        [one] el receptor vuelve a informar una solución de posición ({ $n_used } satélite utilizado)
        [many] el receptor vuelve a informar una solución de posición ({ $n_used } de satélites utilizados)
       *[other] el receptor vuelve a informar una solución de posición ({ $n_used } satélites utilizados)
    }


engine-nmea-synth-gen-the-receiver-has-no-fix =
    { $n_used ->
        [one] el receptor no tiene solución de posición ({ $n_used } satélite utilizable, se necesitan cuatro)
        [many] el receptor no tiene solución de posición ({ $n_used } de satélites utilizables, se necesitan cuatro)
       *[other] el receptor no tiene solución de posición ({ $n_used } satélites utilizables, se necesitan cuatro)
    }


## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = desde T+{ $start_s } s durante { $duration_s } s (rampa de inicio { $ramp_s } s, rampa de recuperación { $recovery_s } s)

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: el C/N0 recibido cae hasta { $cn0_drop_db } dB (dispersión por satélite { $spread_db } dB); los satélites se pierden y la solución de posición se pierde cuando quedan menos de cuatro utilizables

engine-nmea-synth-log-towards-deg-true = hacia { $b } deg verdaderos

engine-nmea-synth-log-towards-deg-true-deg-relative = hacia { $t } deg verdaderos ({ $r } deg relativos al rumbo al inicio, y luego se mantiene)

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

engine-observability-gramian-gdop-undefined-rank-deficient-singular =
    { $n ->
        [one] GDOP no definido (geometría de rango deficiente / singular): rango { $rank } de { $n } estado, defecto de datum { $v3 }, condición { $v4 }
        [many] GDOP no definido (geometría de rango deficiente / singular): rango { $rank } de { $n } de estados, defecto de datum { $v3 }, condición { $v4 }
       *[other] GDOP no definido (geometría de rango deficiente / singular): rango { $rank } de { $n } estados, defecto de datum { $v3 }, condición { $v4 }
    }


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

engine-oem-oem-interop-round-tripped-segment =
    { $n_states_total ->
        [one] oem-interop: ida y vuelta de { $segments } segmento(s), { $n_states_total } estado; error máximo de ida y vuelta { $p } km / { $v } km/s (interoperabilidad MODELLED)
        [many] oem-interop: ida y vuelta de { $segments } segmento(s), { $n_states_total } de estados; error máximo de ida y vuelta { $p } km / { $v } km/s (interoperabilidad MODELLED)
       *[other] oem-interop: ida y vuelta de { $segments } segmento(s), { $n_states_total } estados; error máximo de ida y vuelta { $p } km / { $v } km/s (interoperabilidad MODELLED)
    }


engine-oem-oem-interop-ingested-segment-states =
    { $n_states_total ->
        [one] oem-interop: se ingirieron { $segments } segmento(s), { $n_states_total } estado de un OEM externo (originador { $originator }) (interoperabilidad MODELLED)
        [many] oem-interop: se ingirieron { $segments } segmento(s), { $n_states_total } de estados de un OEM externo (originador { $originator }) (interoperabilidad MODELLED)
       *[other] oem-interop: se ingirieron { $segments } segmento(s), { $n_states_total } estados de un OEM externo (originador { $originator }) (interoperabilidad MODELLED)
    }


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

engine-realtime-frame-eop-empty-and-deliberately-so-later = VACÍA, y a propósito: se aportó una versión posterior ({ $c }) pero ninguna fecha figura como PREDICTION del Bulletin A en el archivo tal como se emitió ({ $eop_source }) y como valor DEFINITIVO del Bulletin B en el posterior en ningún horizonte solicitado. No se sintetiza ninguna fila.

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

engine-realtime-frame-eop-empty-and-deliberately-so-an = VACÍA, y a propósito: se aportó una versión posterior archivada ({ $c }) pero ninguna fecha figura como PREDICTION del Bulletin A en el archivo tal como se emitió ({ $eop_source }) y como valor DEFINITIVO del Bulletin B en el posterior en ningún horizonte solicitado, por lo que no hay residuo de predicho frente a definitivo que informar. No se sintetiza ninguna fila.

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

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    { $n_used ->
        [one] geometría { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satélite{ $v6 }
        [many] geometría { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } de satélites{ $v6 }
       *[other] geometría { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satélites{ $v6 }
    }


engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: la deducción por geometría se clasifica como inconsistencia

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: se informa, no se puntúa (la geometría no es deficiente)

engine-receiver-trust-geometry-not-scored-the-score-deducts = no se puntúa (la puntuación solo deduce por encima de HDOP { $hdop_max }, PDOP { $pdop_max } o por debajo de { $min_used } satélites)

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] derivado de { $n } satélite registrado
        [many] derivado de { $n } de satélites registrados
       *[other] derivado de { $n } satélites registrados
    }


engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] según lo informa el receptor, { $n } satélite utilizado
        [many] según lo informa el receptor, { $n } de satélites utilizados
       *[other] según lo informa el receptor, { $n } satélites utilizados
    }


engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = el HDOP declarado { $fmt_dop } discrepa del HDOP { $fmt_dop2 } derivado del cielo declarado más allá de la tolerancia

engine-receiver-trust-geometry-satellites-in-view-but-not = satélites a la vista pero no seguidos ({ $g } de { $in_view } a { $low_elev_deg } deg o más): entorno de señal, no geometría

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } satélite, menos de { $min_used }
        [many] { $n } de satélites, menos de { $min_used }
       *[other] { $n } satélites, menos de { $min_used }
    }


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

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] el registro tiene { $n } muestra; se necesitan al menos { $MIN_SAMPLES } para un ajuste de Allan
        [many] el registro tiene { $n } de muestras; se necesitan al menos { $MIN_SAMPLES } para un ajuste de Allan
       *[other] el registro tiene { $n } muestras; se necesitan al menos { $MIN_SAMPLES } para un ajuste de Allan
    }


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

engine-receiver-trust-scenario-of-stated-events-detected-within = { $events_detected } de { $events_evaluable } eventos declarados detectados en { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = { $predictions_agreeing } de { $predictions_evaluable } predicciones de C/N0 dentro de { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = puntuación de confianza mínima { $min }, final { $last }

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

engine-e-scenario-time-grid-too-large-steps =
    { $n ->
        [one] cuadrícula de tiempo demasiado grande: { $n } paso supera MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); use un paso más grueso o una duración más corta
        [many] cuadrícula de tiempo demasiado grande: { $n } de pasos superan MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); use un paso más grueso o una duración más corta
       *[other] cuadrícula de tiempo demasiado grande: { $n } pasos superan MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); use un paso más grueso o una duración más corta
    }


## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = la frecuencia de muestreo es conmensurable con la tasa de código ({ $samples_per_chip } muestras/chip, a { $offset_from_integer_samples } muestras de un número entero): la réplica de código con retención de orden cero no puede resolver un cambio de fase de código inferior a { $dead_band_chips } chips, por lo que el discriminador Early/Late es una escalera con una banda muerta de una muestra en lugar de un triángulo y el DLL se estabiliza en un retardo erróneo. Desplace la frecuencia de muestreo respecto del múltiplo entero (5 MHz es { $lit_4_8876 } muestras/chip; 25 MHz es { $lit_24_4379 }) o sobremuestree lo suficiente para que la banda muerta quede por debajo de la exactitud de fase de código que necesite.

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

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] ajustado a la desviación de Allan solapada de un registro de { $n_samples } muestra a { $tau0_s } s, en la base de modulación de frecuencia de IEEE Std 1139
        [many] ajustado a la desviación de Allan solapada de un registro de { $n_samples } de muestras a { $tau0_s } s, en la base de modulación de frecuencia de IEEE Std 1139
       *[other] ajustado a la desviación de Allan solapada de un registro de { $n_samples } muestras a { $tau0_s } s, en la base de modulación de frecuencia de IEEE Std 1139
    }


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
    { $n_bodies ->
        [one]
            Sistema solar en { $input } (JD { $jd_tdb } TDB), { $n_bodies } cuerpo, observador { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
        [many]
            Sistema solar en { $input } (JD { $jd_tdb } TDB), { $n_bodies } de cuerpos, observador { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
       *[other]
            Sistema solar en { $input } (JD { $jd_tdb } TDB), { $n_bodies } cuerpos, observador { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
    }


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

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] la parte fina de CUC { $fine } no cabe en { $n } octeto
        [many] la parte fina de CUC { $fine } no cabe en { $n } de octetos
       *[other] la parte fina de CUC { $fine } no cabe en { $n } octetos
    }


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

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: se encuadró { $packet_count } { $v2 } paquete CCSDS-133.0 APID { $apid }, { $total_bytes } octetos en total, ida y vuelta exacta ({ $round_trip_ok })
        [many] space-packet: se encuadraron { $packet_count } { $v2 } paquetes CCSDS-133.0 APID { $apid }, { $total_bytes } octetos en total, ida y vuelta exacta ({ $round_trip_ok })
       *[other] space-packet: se encuadraron { $packet_count } { $v2 } paquetes CCSDS-133.0 APID { $apid }, { $total_bytes } octetos en total, ida y vuelta exacta ({ $round_trip_ok })
    }


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

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] { $states } estados para { $n } época
        [many] { $states } estados para { $n } de épocas
       *[other] { $states } estados para { $n } épocas
    }


engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } estado; el grado { $degree } requiere { $value }
        [many] { $n } de estados; el grado { $degree } requiere { $value }
       *[other] { $n } estados; el grado { $degree } requiere { $value }
    }


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

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] { $epochs } épocas para { $n } línea de diferencias
        [many] { $epochs } épocas para { $n } de líneas de diferencias
       *[other] { $epochs } épocas para { $n } líneas de diferencias
    }


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

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] clave de barrido `{ $key }`: el índice { $i } está más allá de la única entrada ({ $n }) de la matriz
        [many] clave de barrido `{ $key }`: el índice { $i } está más allá de las { $n } de entradas de la matriz
       *[other] clave de barrido `{ $key }`: el índice { $i } está más allá de las { $n } entradas de la matriz
    }


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

engine-telecom-timing-the-mask-is-defined-through = la máscara se define mediante un filtro paso bajo de { $lit_0_1 } Hz, que este motor aplica solo con intervalos de muestreo de { $MAX_FILTER_DT_S } s o menos; este registro se muestrea cada { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = indique [holdover] o [series], no ambos

engine-e-telecom-timing-give-either-series-samples-or = indique series.samples o series.csv_path, no ambos

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days debe ser finito y >= 0

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: máx|TE| { $max_abs } ns durante { $v2 } s; { $masks } (MODELLED)

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

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] advertencia: { $n } mensaje MQTT no se entregó
        [many] advertencia: { $n } de mensajes MQTT no se entregaron
       *[other] advertencia: { $n } mensajes MQTT no se entregaron
    }


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

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips debe ser inferior a { $lit_1_9 } chips (se recibió { $correlator_spacing_chips })

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

engine-fusion-hybrid-ukf-chart-subtitle = NEES + blancura de la innovación frente a bandas χ² del 95 %; { $lit_1_0 } = consistente. Autoconsistencia, no exactitud.

engine-fusion-hybrid-ukf-chart-target = objetivo { $lit_1_0 }

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

engine-holdover-test-chart-title = Prueba de holdover: error de tiempo por paso

engine-holdover-test-chart-y-title = |error de tiempo| (ns)

engine-holdover-test-chart-panel-caption = error de tiempo absoluto; paso de holdover sombreado; las líneas discontinuas son los presupuestos de error de tiempo

engine-holdover-test-chart-gnss-removed = GNSS retirado

engine-holdover-test-chart-gnss-restored = GNSS restablecido

engine-holdover-test-chart-time-axis = tiempo en el eje del registro ({ $min } min)

engine-hybrid-chart-title = Utilización de la especificación del PNT híbrido durante una interrupción de GNSS ({ $lit_1_0 } = especificación)

engine-hybrid-chart-y-title = utilización de la especificación

engine-hybrid-chart-spec-line = especificación ({ $lit_1_0 })

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

engine-leo-signal-chart-psd-axis = desplazamiento sobre ±{ $lit_0_6 } × ancho de banda de transmisión; 0 a −50 dB bajo cada pico

engine-leo-signal-chart-jitter-caption = jitter de código (m, escala logarítmica) frente a C/N0 total (dB-Hz)

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = barrido de `{ $scenario_kind }` sobre { $axis_order } ({ $nodes } nodos, mediana con banda de percentiles 5-95 sobre { $n_runs } semillas; cada línea en su propio rango)

engine-holdover-test-holdover-not-recovered-within-record = holdover-test: holdover { $hold } s, máx|TE| { $max_abs } ns; { $masks }; no recuperado dentro del registro (MODELLED, medido frente a la máscara)

engine-holdover-test-holdover-recovered-after-gnss-returned = holdover-test: holdover { $hold } s, máx|TE| { $max_abs } ns; { $masks }; recuperado { $t } s después de que volviera GNSS (MODELLED, medido frente a la máscara)

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = escrito por kshana iq scene: una escena SIMULADA, no una grabación; escala entera: 1 LSB = { $sc } unidades normalizadas por el ruido (RMS esperado { $v1 } LSB por componente), { $clipped } elemento(s) recortado(s)

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = escrito por kshana iq scene; escala entera: 1 LSB = { $sc } unidades normalizadas por el ruido (RMS esperado { $v1 } LSB por componente), { $clipped } elemento(s) recortado(s)

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = se escribieron { $samples } muestras ({ $format }, { $fs_hz } Hz) en { $data_path }; { $truth_records } registros de verdad en { $truth_path }; { $meta_note }; canal: { $chan_desc }; escala entera: 1 LSB = { $sc } unidades normalizadas por el ruido (RMS esperado { $v1 } LSB por componente), { $clipped } elemento(s) recortado(s)

engine-lunar-chart-title = HPL del polo sur lunar ({ $availability } % disponible, AL { $al } m, σ_URE { $sigma } m)

engine-lunar-beacon-chart-title = Aumentación con balizas en superficie — PDOP por configuración

engine-lunar-beacon-chart-no-solution = sin solución

engine-lunar-beacon-chart-footnote = menor es mejor; sigma_URE por baliza { $sigma } m, máscara { $mask } deg

engine-lunar-combination-chart-title = OD lunar conjunta + reloj — error de posición 3-D de la estación (el VLBI restituye la observabilidad)

engine-lunar-combination-chart-subtitle = { $n_sat } satélites, { $n_earth } estaciones terrestres · factor de mejora { $factor }×

engine-lunar-combination-chart-with-vlbi = con VLBI: { $m } m

engine-lunar-combination-chart-range-only = solo distancia: { $m } m

engine-lunar-combination-chart-axis-note = log10 del error de estación (m); convergido con/sin = { $with }/{ $without }

engine-lunar-dpnt-chart-title = PNT diferencial lunar — { $n_sats } satélites: error corregido frente a la línea base (reducción × { $factor } a { $km } km)

engine-lunar-dpnt-chart-subtitle = sin corregir { $uncorrected } m | corregido { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = sin corregir (autónomo)

engine-lunar-dpnt-chart-baseline-km = línea base (km)

engine-lunar-dpnt-chart-err-m = error (m)

engine-lunar-frame-realise-chart-title = Realización del marco de referencia lunar — recuperación de Helmert de 7 parámetros

engine-lunar-frame-realise-chart-subtitle = { $n_points } puntos · residuo RMS { $rms } m · convergido { $converged }

engine-lunar-frame-realise-chart-scale = escala (ppb)

engine-lunar-frame-realise-chart-row = { $label }: inyectado { $inj } { $unit } · recuperado { $rec } { $unit } · error { $err }

engine-lunar-interop-chart-title = Exportación de interoperabilidad lunar — CCSDS OEM + KIF (alineada con LunaNet/IOAG)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | { $n_states } estados | OEM { $oem_lines } líneas

engine-lunar-interop-chart-artifacts = artefactos: { $list }

engine-lunar-interop-chart-pass = PASS

engine-lunar-interop-chart-fail = FAIL

engine-lunar-interop-chart-conformance = coincidencia de campos: { $verdict } ({ $present } presentes, { $missing } ausentes, { $data_lines } líneas de datos)

engine-lunar-interop-chart-roundtrip = ida y vuelta de OEM: { $oem } | ida y vuelta de metadatos de tiempo: { $time_metadata } | KIF { $kif_bytes } bytes

engine-lunar-interop-chart-footnote = Ida y vuelta / coincidencia de campos frente a CCSDS OEM y la semántica de campos publicada de LunaNet/IOAG. { $label } — no es una prueba certificada de conformidad de interoperabilidad; sin aval de ninguna agencia.

engine-lunar-jamming-chart-title = J/S por satélite frente a la elevación, usuario en la superficie lunar

engine-lunar-jamming-chart-x-title = elevación del satélite (deg)

engine-lunar-jamming-chart-locked = LOCKED

engine-lunar-jamming-chart-n-links = { $n_links } enlaces

engine-lunar-service-chart-title = Volumen de servicio lunar — { $n_sats } satélites, { $n_points } puntos × { $n_epochs } épocas: { $coverage } % de cobertura (PDOP&lt;{ $threshold })

engine-lunar-service-chart-subtitle = satélites { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | disponibilidad de PL { $pl_avail } % (AL { $al } m, σ_URE { $sigma } m)

engine-lunar-service-chart-pdop-min = PDOP mín { $v }

engine-lunar-service-chart-pdop-mean = PDOP medio { $v }

engine-lunar-service-chart-pdop-max = PDOP máx { $v }

engine-lunar-station-chart-title = Estación de referencia lunar: error 3-D corregido p{ $percentile } en la región del polo sur (MODELLED)

engine-lunar-station-chart-threshold = umbral { $thr } m en p{ $percentile }

engine-lunar-station-chart-availability = disponibilidad { $v } %

engine-lunar-station-chart-coverage = cobertura { $v } %

engine-lunar-station-chart-corrected-3d = 3-D corregido { $f }

engine-lunar-station-chart-uncorrected-3d = 3-D sin corregir { $f }

engine-lunar-station-chart-legend-half = ≤ la mitad del umbral

engine-lunar-station-chart-legend-within = ≤ umbral

engine-lunar-station-chart-legend-twice = ≤ el doble del umbral

engine-lunar-station-chart-legend-above = por encima del doble del umbral

engine-lunar-station-chart-station-note = ◆ estación · discontinua: distancia hasta la que la cobertura se mantiene al 95 %

engine-lunar-station-chart-disclaimer = MODELLED bajo los supuestos indicados; no es una afirmación sobre ningún sistema real; sin afiliación ni aval de ninguna agencia.

engine-lunar-time-chart-title = Tiempo coordenado lunar LTC−TT (tasa { $rate } µs/día, banda { $low }–{ $high })

engine-lunar-time-chart-offset = { $offset } µs a { $days } d

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | reloj { $clock } | x_Σ(τ) de 7 términos sobre { $taus } puntos τ ({ $taus2 }–{ $taus3 } s) | cruce τ { $crossover_tau_s } s (x { $crossover_x_s } s) | suelo del marco { $frame_term_s } s | reloj x(1 d) { $x_1day_ns } ns (MODELLED) | laboratorio de tiempo: { $lab } { $lab2 } a LTC, x(1 d) { $lab3 } ns (MODELLED)

engine-lunar-vlbi-chart-title = Retardo VLBI lunar (línea base { $baseline } km, distancia a la baliza { $range } km, campo cercano { $near_field } µs)

engine-lunar-vlbi-chart-footnote = retardo { $delay } µs en la época · { $samples } muestras durante { $hours } h

engine-mars-pnt-chart-formal-3sigma = 3σ formal (covarianza, no un PL certificado)

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = arrastre de posición: la posición notificada se desplaza { $final_offset_m } m hacia { $dir } mientras el receptor mantiene una solución válida (la trayectoria falsa alcanza picos de { $pv } m/s y { $pa } m/s^2); cada satélite en seguimiento muestra { $c } dB-Hz mientras dure

engine-nmea-synth-log-position-drag-off-genuine-cn0 = arrastre de posición: la posición notificada se desplaza { $final_offset_m } m hacia { $dir } mientras el receptor mantiene una solución válida (la trayectoria falsa alcanza picos de { $pv } m/s y { $pa } m/s^2); se conserva el patrón genuino de C/N0

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = spoofing de tiempo: el UTC notificado se desvía { $offset_s } s del verdadero; la posición sigue siendo la verdadera; cada satélite en seguimiento muestra { $c } dB-Hz mientras dure

engine-nmea-synth-log-time-spoof-genuine-cn0 = spoofing de tiempo: el UTC notificado se desvía { $offset_s } s del verdadero; la posición sigue siendo la verdadera; se conserva el patrón genuino de C/N0

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = retardo de repetición (estilo meaconing): la posición{ $v1 } se retrasa { $delay_s } s respecto de la verdadera; cada satélite en seguimiento muestra { $c } dB-Hz mientras dure

engine-nmea-synth-log-replay-delay-genuine-cn0 = retardo de repetición (estilo meaconing): la posición{ $v1 } se retrasa { $delay_s } s respecto de la verdadera; se conserva el patrón genuino de C/N0

engine-pvt-chart-3d-error-m = error 3D (m)

engine-pvt-chart-postfit-rms-m = RMS posajuste (m)

engine-quantum-faults-chart-title = AUC de quantum-anomaly-detect (MODELLED)

engine-quantum-faults-chart-quantum = cuántico

engine-quantum-faults-chart-classical = clásico

engine-quantum-nav-od-chart-title = quantum-gnss-free-nav (MODELLED)

engine-raim-stanford-chart-title = Diagrama de Stanford — integridad ({ $n_epochs } épocas, AL = { $al } m)

engine-raim-chart-title = Niveles de protección RAIM y disponibilidad ({ $availability } % disponible)

engine-receiver-trust-chart-track-caption = trayectoria notificada por el receptor, norte arriba

engine-receiver-trust-chart-start = inicio

engine-receiver-trust-chart-end-of-log = fin del registro

engine-receiver-trust-chart-no-positions = no hay posiciones en el registro

engine-receiver-trust-chart-score-axis = puntuación de confianza, de 0 a 100

engine-receiver-trust-chart-legend-vessel = confianza: verde nominal (puntuación igual o superior a { $nominal }), ámbar degradada (igual o superior a { $degraded }), rojo no confiable, gris calibrando

engine-receiver-trust-chart-legend = confianza: verde nominal, ámbar degradada, rojo no confiable, gris calibrando

engine-receiver-trust-chart-advisory = Solo consultivo: no es un equipo de navegación homologado; el operador sigue siendo responsable.

engine-receiver-trust-chart-cn0-axis = C/N0 medio, dB-Hz

engine-report-chart-title = Holdover del reloj: error de temporización durante una interrupción de GNSS

engine-slot-timing-chart-aria = Error de tiempo previsto frente al tiempo transcurrido desde la última solución, con la guarda de la ranura

engine-slot-timing-chart-time-since-fix = tiempo desde la solución, de 0 a { $t }

engine-slot-timing-chart-predicted-error = error de tiempo previsto (ns); discontinua: guarda { $guard } ns

engine-slot-timing-never = nunca

engine-solar-system-chart-title = Sistema solar — eclíptica J2000, vista cenital

engine-solar-system-chart-inner = Sistema interior (hasta Marte)

engine-solar-system-chart-whole = Sistema completo (hasta Plutón)

engine-solar-system-chart-legend = verde: VALIDATED frente a JPL Horizons · ámbar: MODELLED · las lunas figuran en result.json con trayectorias centradas en su cuerpo principal

engine-spectrum-chart-title = Cascada del espectro en banda L

engine-spectrum-chart-multi-title = Cascada del espectro multibanda

engine-spectrum-chart-frequency-mhz = frecuencia (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz): nominal (gris) / mínimo

engine-spectrum-chart-threshold = umbral { $thr }

engine-spoof-chart-title = Detección de spoofing de tiempo: desfase frente a los límites de detección asistidos por reloj

engine-spoof-chart-offset-ns = desfase de spoofing (ns)

engine-spoof-chart-spoof-offset = desfase de spoofing

engine-spoof-chart-quantum-bound = límite de detección cuántico

engine-spoof-chart-classical-bound = límite de detección clásico

engine-sweep-chart-title = { $metric } frente a { $parameter } (escala { $scale })

engine-sweep-nd-chart-title = barrido { $n_dims }-D de `{ $kind }` — { $n_nodes } nodos

engine-sweep-nd-chart-axes = ejes: { $axes } (forma { $shape })

engine-sweep-nd-chart-metrics = métricas: { $metrics } — cuadrícula completa en JSON

engine-sweep-nd-chart-line-title = barrido de `{ $kind }` sobre { $key }

engine-sweep-nd-chart-y-title = métrica

engine-telecom-timing-max-te-ns-budget-never-exceeded = telecom-timing: máx|TE| { $max_abs } ns durante { $v2 } s; { $masks }; el presupuesto de { $max_abs_te_ns } ns nunca se superó (MODELLED)

engine-telecom-timing-max-te-ns-budget-exceeded-after = telecom-timing: máx|TE| { $max_abs } ns durante { $v2 } s; { $masks }; presupuesto de { $max_abs_te_ns } ns superado tras { $t } s (MODELLED)

engine-telecom-timing-chart-title = Temporización de telecomunicaciones: error de tiempo, MTIE y TDEV

engine-telecom-timing-chart-y-title = |error de tiempo| (ns)

engine-telecom-timing-chart-te-caption = error de tiempo absoluto frente a los presupuestos

engine-telecom-timing-chart-holdover = holdover

engine-telecom-timing-chart-time-record = tiempo (registro de { $h } h)

engine-telecom-timing-chart-mtie-caption = MTIE (continua), TDEV (discontinua), primera máscara MTIE (gris), ns

engine-timetransfer-chart-title = Error de sincronización de la transferencia de tiempo (óptica frente a RF)

engine-timetransfer-chart-y-title = error de sincronización (ps)

engine-timetransfer-chart-spec = especificación { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = tiempo de medición (s)

engine-timetransfer-chart-rf = RF: { $id }

engine-timetransfer-chart-optical = óptico: { $id }

engine-timetransfer-chain-chart-title = quantum-time-transfer (MODELLED)

engine-kind-clock-description = Holdover del reloj frente a la especificación; conjunto Monte Carlo opcional (runs > 1).

engine-kind-inertial-description = Navegación a estima inercial de 1 grado de libertad durante una interrupción de GNSS.

engine-kind-orbit-description = Disponibilidad de GNSS + DOP a partir de una constelación orbital (Walker / TLE / RINEX).

engine-kind-ephemeris-description = Efemérides y traza en tierra: propaga un satélite (TLE→SGP4 u órbita analítica) y emite su estado TEME/GCRS (posición + velocidad), su posición ITRF/ECEF, la latitud/longitud/altitud subsatélite WGS-84 y, por paso, el acimut/elevación/distancia de la estación y la velocidad de distancia (Doppler). El satélite procede de un `tle` o de una `orbit` analítica con su `epoch` (un `tle` prevalece cuando se dan ambos); con un `tle`, un `epoch` sustituye la época propia del TLE como t = 0.

engine-kind-integrity-description = RAIM instantáneo / de separación de soluciones / ARAIM con HPL/VPL y un diagrama de Stanford.

engine-kind-lunar-integrity-description = Pasada de niveles de protección ARAIM del polo sur lunar frente a un conjunto representativo de relés de LunaNet. sigma_ure_m expone la exactitud de distancia de la señal en el espacio (los niveles de protección escalan linealmente con ella, de modo que barrerla responde qué exactitud de distancia exige un límite de alerta). Por defecto, el caso histórico del polo sur de clase LNIS.

engine-kind-lunar-time-offset-description = Tasa relativista modelada del reloj Tierra–Luna (Tiempo Coordenado Lunar, LTC/TCL): la tasa secular LTC−TT a partir de la diferencia de autopotencial y el término cinético de la Luna, notificada con la banda publicada de 56–59 µs/día, más el desfase acumulado sobre un horizonte.

engine-kind-lunar-vlbi-description = Observable modelado de retardo VLBI geodésico lunar: una línea base terrestre (dos estaciones en tierra, GCRS) observa una señal unidireccional de una baliza en la superficie lunar de clase NovaMoon. Emite el retardo de campo cercano por diferencia de dos distancias, su tasa y la corrección de curvatura del frente de onda de campo cercano a lo largo de un paso, verificado frente al observable Δ-DOR de onda plana del mismo código en el límite de campo lejano, con derivadas parciales verificadas por diferencias finitas. La ruta analítica por defecto es MODELLED y lleva las salvedades de coherencia de marco, de movimiento polar xp=yp=0 y de onda plana frente a campo cercano. Al definir planetary_kernel_path, earth_orientation_kernel_path y moon_orientation_kernel_path se ejecuta en su lugar la ruta con núcleos (DE440, MOON_PA_DE440, ITRF93; tiempos de luz baricéntricos convergidos; añade las derivadas parciales de la baliza y de la estación de la época), cuyo retardo newtoniano y derivadas parciales coinciden con los tiempos de luz convergidos de NAIF SPICE hasta { $lit_0_06 } ps y 7.4e-9. No validado frente a datos VLBI reales.

engine-kind-lunar-joint-od-clock-description = Estimador por lotes modelado, conjunto y multitécnica, de OD lunar + reloj sobre una red SIMULADA: un ajuste instantáneo de Gauss-Newton que fusiona retardos VLBI geodésicos de línea base terrestre, distancias locales lunares estación↔satélite y distancias entre satélites para recuperar, de forma conjunta, la posición 3-D de una estación en la superficie lunar, las posiciones de una constelación pequeña y el desfase de reloj de cada activo a partir de una verdad inyectada. El resultado principal, presentado con honestidad —el VLBI hace observable la posición 3-D completa de la estación allí donde la distancia local lunar por sí sola deja una dirección débilmente observada—, se notifica como el contraste de error de estación con y sin VLBI. Recuperación simulada en lazo cerrado MODELLED (la verdad comparte el modelo de observación), determinista (con semilla), NO validada con datos reales; sin propagación con modelo de fuerzas dentro del resolutor; sin aval de TRL, de herencia de vuelo ni de ninguna agencia.

engine-kind-lunar-frame-realisation-description = Realización modelada del marco de referencia lunar: un ajuste de datum de Helmert (de semejanza) de 7 parámetros —3 de traslación, 3 de rotación de ángulo pequeño, 1 de escala— que liga un conjunto estimado de coordenadas de puntos MCMF derivadas selenográficamente a un datum por mínimos cuadrados ponderados (crate::batch_ls::gauss_newton), más una ligadura de orientación simple que expresa la pequeña rotación realizada alrededor de los ejes ICRF respecto de la orientación del cuerpo según IAU 2015 WGCCRE. El escenario inyecta una transformación pequeña conocida (traslación de ~decenas de m, rotación de ~µrad, escala de ~1e-7) en una red sintética de puntos bien repartidos, añade ruido gaussiano con semilla, recupera el datum y notifica la transformación recuperada, el error de recuperación por parámetro frente a la verdad inyectada y el residuo RMS posajuste. Autoconsistencia MODELLED: recupera una transformación de semejanza inyectada (sin ruido hasta ~la precisión de máquina), NO una realización frente a datos reales de seguimiento/VLBI; determinista (con semilla); sin aval de TRL, de herencia de vuelo ni de ninguna agencia.

engine-kind-moonlight-service-volume-description = Análisis modelado del volumen de servicio de navegación lunar a partir de una constelación ILUSTRATIVA, de fuente pública, en órbita lunar de clase Moonlight/LCNS (sin afiliación con ESA): barre una cuadrícula selenográfica de latitud/longitud sobre un horizonte temporal y notifica DOP / cobertura / disponibilidad (≥4 satélites Y PDOP < umbral) más una envolvente generalizada de nivel de protección (HPL/VPL) ARAIM lunar sobre el volumen. La geometría DOP REUTILIZA el núcleo VALIDATED con gnss_lib_py (crate::orbit::dop); el nivel de protección REUTILIZA la maquinaria ARAIM lunar LNIS de LunaNet (crate::lunar, σ_URE≈30 m) y se reduce al PL existente del polo sur como caso particular. Composición MODELLED: un conjunto de relés kepleriano circular/elíptico (no la efeméride real de LCNS/NRHO corregida diferencialmente), una Luna de rotación media (sin libración ni polo con precesión). Determinista (geometría pura). Sin aval de TRL, de herencia de vuelo ni de ninguna agencia.

engine-kind-lunar-differential-pnt-description = PNT DIFERENCIAL lunar modelado (un análogo lunar de DGNSS/SBAS): una estación de referencia de clase NovaMoon en una ubicación selenográfica CONOCIDA calcula correcciones diferenciales por satélite a partir de una constelación ILUSTRATIVA, de fuente pública, de clase Moonlight/LCNS (NovaMoon se menciona solo como CLASE de sistema, sin afiliación con ESA), y un usuario desplazado baseline_km las aplica de modo que los errores de modo común de órbita + reloj se cancelen. El término de reloj se cancela EXACTAMENTE (una identidad algebraica); el término de órbita deja solo la proyección de la diferencia de línea de visión, que → 0 cuando la línea base → 0 (el suelo de decorrelación espacial) y crece ≈ linealmente con la línea base. Notifica el error de posición 3-D del usuario CON y SIN correcciones, el factor de reducción, la curva de error frente a la línea base y un nivel de protección del usuario que REUTILIZA la maquinaria SBAS DO-229E (crate::sbas) con la σ residual diferencial. MODELLED — identidad de cancelación exacta + modelo de decorrelación de primer orden; no validado con datos reales; sin aval de TRL, de herencia de vuelo ni de ninguna agencia. Determinista si tiene semilla.

engine-kind-lunar-station-coverage-description = Cobertura modelada de una estación de referencia lunar: un barrido Monte Carlo del modelo de PNT diferencial lunar sobre una cuadrícula de usuarios del polo sur y un día de épocas. Una estación de referencia diferencial en un emplazamiento conocido del polo sur corrige una constelación indicada (kepleriana ilustrativa o una efeméride tabulada) con un error indicado de señal en el espacio, un error de levantamiento, una latencia de corrección y una cuantización del enlace; por punto y sobre la región notifica el error de posición corregido y sin corregir por percentiles (3-D, horizontal, vertical), la disponibilidad, la cobertura frente a un umbral indicado, los niveles de protección DO-229E, el radio de cobertura por acimut y el presupuesto del enlace de corrección en la estación y en el peor punto. No es una afirmación sobre el rendimiento de ningún sistema real; sin afiliación ni aval de ninguna agencia. MODELLED.

engine-kind-lunar-interop-export-description = Exportación de interoperabilidad lunar modelada: emite el marco de referencia lunar, la escala de tiempo lunar y la efeméride lunar en formas de intercambio basadas en CCSDS y alineadas con LunaNet/IOAG, con ida y vuelta / coincidencia de campos. REUTILIZA el emisor y analizador CCSDS OEM 2.0 del crate (crate::oem), re-etiquetado para el contexto lunar —el REF_FRAME del OEM lleva el marco del cuerpo lunar IAU 2015 WGCCRE (MOON_ME / MOON_PA), el TIME_SYSTEM la escala de tiempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON— sobre una efeméride ilustrativa de muestra de clase LCNS (posiciones de crate::lunar_service, velocidad por diferencias finitas). Emite además un descriptor de tiempo lunar alineado con LunaNet/IOAG (identificador de escala, tasa secular en µs/día de crate::lunar_time, banda publicada, superficie de referencia) que hace ida y vuelta mediante serde_json, y envuelve los artefactos en la envoltura KIF existente (crate::interchange) con la etiqueta de honestidad MODELLED. Notifica los artefactos emitidos, el número de líneas de OEM, el resultado de coincidencia de campos + la lista de campos presentes/ausentes, si la ida y vuelta de OEM es correcta, si la ida y vuelta de los metadatos de tiempo es correcta y el tamaño en bytes de KIF. MODELLED — la referencia independiente es la ida y vuelta determinista + la coincidencia de nombres de campo frente a CCSDS OEM publicado y la semántica de campos de LunaNet/IOAG; NO es una prueba certificada de conformidad de interoperabilidad; efeméride ilustrativa de fuente pública, sin afiliación con ESA; sin aval de TRL, de herencia de vuelo ni de ninguna agencia.

engine-kind-timetransfer-description = Transferencia bidireccional de tiempo/frecuencia, óptica frente a RF.

engine-kind-quantum-anomaly-detect-description = Detección de fallos/anomalías MODELLED para sistemas PNT cuánticos: un catálogo etiquetado de fallos (salto de frecuencia/deriva/pérdida de enganche del reloj; salto de sesgo/pérdida de señal del sensor), un AUC de ROC del estadístico de detección (con un IC bootstrap obtenido de eval_stats, validado externamente) y un fallo mínimo detectable con una tasa de falsa alarma fija, de modo que el monitor asistido por reloj cuántico (menor ruido) detecta fallos más pequeños — como TradeEvidence honesta + representatividad. Modelo gaussiano del estadístico de detección (AUC = Phi(mu/(sigma*sqrt2))); modela la clase, con parámetros ilustrativos de fuente pública, sin TRL, vuelo ni certificación.

engine-kind-quantum-gnss-free-nav-description = Navegación cuántica sin GNSS MODELLED: durante una interrupción de GNSS, un presupuesto inercial cuántico (interferómetro de átomos fríos) frente a un INS clásico de grado de navegación — crecimiento del error de posición durante la deriva, holdover hasta un umbral de posición y el contraste cuántico-clásico como TradeEvidence honesta con representatividad. Nota honesta de observabilidad: sin una solución externa el sesgo del acelerómetro no es observable, de modo que el error crece; el sensor cuántico frena esa brecha, pero no la cierra. Parámetros ilustrativos de dispositivos de fuente pública; modela la clase, sin TRL, vuelo ni certificación.

engine-kind-quantum-time-transfer-description = Cadena de temporización cuántica de confianza MODELLED: un presupuesto de transferencia de tiempo de extremo a extremo cuántico (reloj de red óptica + enlace de entrelazamiento/fotón único) frente a uno clásico (CSAC + bidireccional por RF), un nivel de protección de temporización reutilizado + una cifra de mérito de seguridad frente a ataques de retardo/repetición (1-P_md), una probabilidad de detección de anomalías del reloj + latencia de CUSUM, y el contraste cuántico-clásico como TradeEvidence honesta con un registro de representatividad + brechas hasta el vuelo. Parámetros ilustrativos de dispositivos/enlaces de fuente pública; modela la clase, sin reclamar TRL, vuelo ni certificación.

engine-kind-hybrid-description = Culminación del PNT híbrido: apoyo de reloj + IMU + transferencia de tiempo.

engine-kind-fusion-description = PNT con fusión de sensores por filtro de Kalman conjunto sobre las mismas entradas híbridas.

engine-kind-hybrid-ukf-description = UKF GNSS/INS híbrido cuántico+clásico de acoplamiento fuerte con 17 estados (MODELLED): 15 estados de error del INS + corrección del sesgo del acelerómetro derivada de CAI + un reloj de 2 estados (fase+frecuencia) del motor de reloj de parámetros q, accionado por el modelo de error de CAI acotado. La cifra de mérito es la autoconsistencia del filtro (NEES + blancura de la innovación frente a cotas χ²) — una afirmación de autoconsistencia, NO una garantía de exactitud en el mundo real. Solo simulación; sin TRL>3, sin herencia de vuelo, sin validación externa.

engine-kind-gnss-ins-description = EKF de estados de error GNSS/INS de acoplamiento débil y fuerte.

engine-kind-gnss-sim-description = Simulación de pseudodistancias en el dominio de la medición (ionosfera de Klobuchar, troposfera de Saastamoinen/Niell) + RAIM.

engine-kind-jamming-description = Jamming con presupuesto de enlace: J/S → C/N₀ efectivo → pérdida de enganche.

engine-kind-spoof-description = Detector estocástico de spoofing de tiempo (Neyman–Pearson / χ²₁) con P_fa/P_md Monte Carlo.

engine-kind-spoof-detect-description = Detector combinado de spoofing por RF/medición (coherencia RAIM multi-SV + AGC + SQM, fusionados) frente a un ataque parametrizado (ventaja de potencia, alineación de fase de portadora, empuje de tiempo/posición; estilo TEXBAT).

engine-kind-sweep-description = Barrido 1-D de estudio de compromisos sobre un parámetro de un paquete de reloj.

engine-kind-sweep-nd-description = Barrido N-D genérico sobre cualquier paquete mediante claves TOML con puntos / rutas de métricas JSON.

engine-kind-gravity-map-description = Navegación por correspondencia con mapa gravimétrico sin GPS: un gravímetro de átomos fríos recupera una deriva constante del INS a partir de la secuencia de anomalías gravimétricas que sobrevuela.

engine-kind-terrain-nav-description = Navegación referenciada al terreno sin GPS (TERCOM/SITAN): un altímetro radar/barométrico compara el perfil de elevación del suelo con un DEM de tipo SRTM para recuperar la deriva del INS.

engine-kind-terrain-slam-description = Navegación secuencial (recursiva) referenciada al terreno sin GPS: un filtro de partículas ejecuta el modelo de medición de correspondencia con el terreno época a época (SITAN como filtro continuo), de modo que una deriva del INS variable en el tiempo se sigue a lo largo de la trayectoria, mientras que la navegación por terreno por lotes solo recupera un único desfase constante.

engine-kind-combined-altpnt-description = Navegador combinado sin GPS de gravedad + campo magnético + terreno: tres canales de campo escalar fusionados por punto de ruta para obtener una corrección de deriva más precisa (CRLB más bajo) que con cualquier campo por separado.

engine-kind-pvt-description = Posicionamiento de punto único con observaciones reales: resuelve la posición de un receptor a partir de un archivo de observación RINEX 3 y un archivo de navegación de difusión (pseudodistancias de código, efemérides de difusión, ionosfera de Klobuchar, troposfera de Saastamoinen/Niell), comprobado opcionalmente frente a una coordenada levantada.

engine-kind-mars-pnt-description = PNT de espacio profundo en Marte: una constelación SIMULADA de relés MARCONI (relés areoestacionarios + inclinados que difunden en un sentido y retransmiten en ambos sentidos a una estación de espacio profundo) navega a un usuario de referencia (transfer | lmo | surface) mediante el estimador conjunto de fusión radiométrica unidireccional/bidireccional. Notifica la geometría/visibilidad por época, el RMS logrado frente a la verdad y la covarianza formal (posición 1σ / 3σ) — una cifra de mérito simulada y honesta, NO un nivel de protección certificado.

engine-kind-impairment-eval-description = Banco de pruebas de evaluación de la detección de degradaciones de RF con IA/ML (13494): genera un corpus SINTÉTICO etiquetado y fundamentado en parámetros (nominal/jamming/spoof-time/spoof-position/multipath), puntúa un detector (energy|agc|sqm|parity|fused) con el arnés independiente del detector y notifica AUC/ROC/confusión + Pd por clase con una Pfa objetivo, además de la brecha de optimismo dentro frente a fuera de la distribución. Solo características operativas MODELLED — nunca de campo/IQ, sin veredicto de bueno/malo.

engine-kind-quantum-trade-description = Contraste PNT cuántico frente a clásico (13503): beneficio de holdover de temporización + holdover inercial de un reloj candidato (una curva de ADEV medida —el eje de su defendibilidad— o una clase de reloj cuántico) frente a una clase de línea base clásica, con la salvedad del supuesto de suelo a tau largo incluida en el artefacto, más una envolvente de resiliencia frente al tiempo sin GNSS. MODELLED; cuantifica (nunca valida) un dispositivo de un socio. El reloj candidato es una curva medida (`candidate_adev_taus` + `candidate_adev_values`, de igual longitud, con al menos 2 puntos; prevalece cuando se dan ambas formas) o un `candidate_clock_class`.

engine-kind-space-weather-description = Modelo del entorno de clima espacial: índices de actividad solar (F10.7/F10.7a) y geomagnética (Kp, con la tabla definicional Kp↔ap), la temperatura exosférica de Jacchia-1971 que gobiernan (comprobada frente a los mínimos/medios/máximos solares publicados) y la densidad neutra termosférica de Jacchia-1971 a la temperatura exosférica media diurna frente al perfil estático sin actividad en un conjunto de altitudes — la dependencia de la densidad respecto del ciclo solar que la atmósfera estática omite. MODELLED: la densidad coincide con las densidades derivadas de acelerómetros (TOLEOS CHAMP y GRACE) dentro de un factor 2 en el máximo solar, pero es unas { $lit_1_7 }x demasiado densa en el mínimo solar de 2008.

engine-kind-oem-interop-description = Puente de interoperabilidad CCSDS OEM: importa un Orbit Ephemeris Message producido por una herramienta externa de dinámica de vuelo (GMAT/Orekit/STK emiten OEM) y notifica sus segmentos/objetos/marcos/intervalo de épocas, además de una comprobación de coherencia de velocidad; sin entrada, hace ida y vuelta de una órbita de referencia generada y notifica la fidelidad importación↔exportación. Comprobación MODELLED de ingesta estructural/física, NO una validación de la exactitud orbital de la fuente.

engine-kind-launch-window-description = Geometría de lanzamiento y ascenso de dos cuerpos: acimut(es) de lanzamiento (sin Az = cos i / cos lat), inclinación mínima alcanzable, velocidad circular, la bonificación hacia el este de la rotación terrestre, el Δv de cambio de plano en dogleg cuando la inclinación objetivo es inferior a la latitud del emplazamiento y el número de oportunidades diarias de lanzamiento. Geometría MODELLED de Tierra esférica (sin corrección del triángulo de velocidades de Tierra rotante, sin modelo de pérdidas de ascenso/arrastre).

engine-kind-reentry-description = Corredor de reentrada balística de Allen-Eggers: desaceleración máxima (independiente del coeficiente balístico, V_e^2 sin|γ|/(2eH)), velocidad y altitud en el pico de g y velocidad de calentamiento máximo, para una velocidad de entrada/ángulo de trayectoria/coeficiente balístico a través de una atmósfera exponencial, más una integración plana de masa puntual de la misma entrada balística con gravedad, curvatura terrestre y la Atmósfera Estándar de EE. UU. 1976 (desaceleración máxima, velocidad, altitud y tiempo en el pico). Entrada balística (sin sustentación) MODELLED; la salida de calentamiento es la VELOCIDAD de calentamiento máximo, no un flujo de calor (sin modelo aerotérmico/TPS).

engine-kind-eo-coverage-description = Geometría de huella y cobertura de una carga útil de observación de la Tierra (triángulo espacial de SMAD): radio angular de la Tierra, ancho de franja, distancia de muestreo en el suelo en el nadir, acceso máximo fuera del nadir, periodo circular, periodo nodal J2 y separación de trazas en tierra en el ecuador con un indicador de cobertura contigua, para una altitud orbital, una inclinación (heliosíncrona por defecto) y un FOV/IFOV del sensor. Geometría MODELLED de Tierra esférica (sin radiometría/MTF/atmósfera/vibración/destello); separación de nodos R_e·(ω − Ω̇)·T_nodal con tasas seculares J2 de primer orden.

engine-kind-space-packet-description = Entramado del CCSDS 133.0-B Space Packet Protocol: codifica un flujo sintético de paquetes TM/TC (cabecera primaria de 6 octetos + campo de datos) y notifica la decodificación de la cabecera de cada paquete, el total de octetos y una ida y vuelta exacta codificación↔decodificación. Entramado determinista de disposición exacta de bits — la capa de interoperabilidad del formato de paquetes de las agencias; NO es una certificación de conformidad (sin lógica de cabecera secundaria/CRC/segmentación más allá de los indicadores).

engine-kind-attitude-budget-description = Presupuesto de error de actitud y apuntamiento de 3 grados de libertad: el par perturbador de gradiente de gravedad en el peor caso ((3/2)(μ/R³)ΔI) y un presupuesto de error de apuntamiento por suma cuadrática sobre contribuyentes 1σ con nombre (ruido del sensor, vibración de la rueda de reacción, térmica, alineación) con el término dominante, para una altitud orbital + una dispersión de inercia del cuerpo. Presupuesto escalar AOCS MODELLED — un complemento previo al hardware de Basilisk/42, no una simulación de lazo de control/6 grados de libertad/modos flexibles.

engine-kind-passes-description = Predicción de pasos sobre una estación terrestre: los pasos de visibilidad en el dominio del tiempo (AOS/TCA/LOS, elevación aparente máxima, duración) de una órbita circular, como elementos medios SGP4 al inicio de la ventana, sobre una estación por encima de una máscara de elevación a lo largo de una ventana, con el tiempo total de acceso. Propagación SGP4/SDP4 sobre el marco terrestre IAU 2006/2000A (UT1 - UTC y movimiento polar opcionales), refracción troposférica ITU-R P.834-9 y tiempo de luz del enlace descendente (ambos activados por defecto), cruces resueltos a 1e-7 s y culminación mediante búsqueda de sección áurea. La geometría del paso es VALIDATED frente a Orekit 13.1.8 en estaciones a nivel del mar; la órbita y la estación del escenario son entradas ilustrativas.

engine-kind-link-budget-description = Presupuesto de enlace unidireccional sobre la ecuación de enlace de CCSDS 401 / DSN 810-005: pérdida en espacio libre, C/N₀, Eb/N₀, margen y cierre para una EIRP de transmisión, una G/T de recepción, una distancia, una tasa de datos y una banda (s|x|ka) frente a una Eb/N₀ requerida. Un cálculo de ingeniería determinista a partir de las entradas suministradas (no una hoja de datos de terminal calibrada).

engine-kind-lunar-time-budget-description = Presupuesto de error de tiempo de extremo a extremo del Tiempo Lunar Coordinado (LTC) MODELLED: los siete términos de error del LTC reunidos como curvas de error de tiempo x_i(τ) sobre toda una cuadrícula de tiempos de promediado, sumados cuadráticamente en x_Σ(τ), y el CRUCE τ reloj-marco en el que el término creciente del reloj supera al término constante de realización del marco en tiempo real (por debajo, el presupuesto está limitado por el marco; por encima, por el reloj) — la respuesta honesta al artefacto de un solo τ. Las pendientes en τ son de forma cerrada y comprobables analíticamente (reloj τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }, suelos τ^0, medición τ^{ "{" }-1/2{ "}" }) y las filas del reloj reproducen las especificaciones publicadas de reloj a un día (crate::clock_specs); las MAGNITUDES de los suelos del enlace RF/óptico, de realización del marco, del residuo relativista y de la efeméride son asignaciones de presupuesto Modelled (valores por defecto documentados, sustituibles por quien llama), no mediciones. La contribución es el τ de cruce reproducible, no una cifra por término certificada; no certificado para la cronometría operativa.

engine-kind-hybrid-optical-rf-description = Cifra de mérito conjunta MODELLED de PNT heterogéneo óptico + RF (P5): compone el presupuesto de enlace óptico bidireccional de 1550 nm (CRLB de distancia bidireccional limitado por fotones σ_τ/√N y huella de difracción λ/D·distancia), un nivel de protección RAIM de separación de soluciones entre modalidades (posición Y temporización) que fusiona las soluciones RF laxa y óptica estrecha con covarianzas dispares, la disponibilidad óptica de cielo despejado de N estaciones (unión independiente 1−Π(1−a_i) y una variante con correlación espacial), un traspaso de estado/covarianza óptico↔RF con una media continua en bits DEMOSTRADA (sin saltos) y una puerta de consistencia NEES χ², y una puntuación conjunta P(disponible Y de grado de precisión Y con integridad asegurada) con tratamiento de la correlación. Forma cerrada VALIDATED: el CRLB de distancia, la huella de difracción, el cuantil del nivel de protección χ², la combinatoria de la unión, la continuidad de la media del traspaso + la puerta NEES y el producto independiente conjunto. MODELLED: las asignaciones de pérdidas ópticas, las magnitudes σ de RF/óptica, las entradas de climatología de nubes, las correlaciones y el presupuesto P_HMI. No es un producto certificado de disponibilidad/integridad.

engine-kind-cislunar-observability-description = Observabilidad MODELLED de una constelación cislunar plana (P6): sigue una constelación plana de cuatro naves en DRO planas corregidas diferencialmente con medición de distancia entre satélites y notifica qué parte de los cuatro estados [x,y,ẋ,ẏ] de una nave hace observable el arco. Emite (1) la tabla de rango frente a longitud de arco para un único enlace solo de distancia — instantáneamente de rango 1, creciendo hacia los cuatro estados completos a medida que se alarga el arco (P6 Tabla 1); (2) el espectro de autovalores de la gramiana de observabilidad + el número de condición sobre el arco; (3) la comparación de rango instantáneo entre solo distancia y distancia+velocidad de distancia (la palanca de diseño del Doppler), además de la notificación de GDOP indefinido con solo distancia / definido con distancia+velocidad de distancia; y (4) una validación cruzada independiente con SRIF cuya covarianza posterior pasa a ser finita / bien condicionada exactamente en el arco en el que el rango observable alcanza cuatro. Núcleo VALIDATED: el rango observable es un umbral de valores singulares que revela el rango, verificado frente al rango de autovalores de la gramiana; el espectro de autovalores cumple los invariantes espectrales (traza=Σλ, det=Πλ, Frobenius²=Σλ²); la STM variacional es la STM de CR3BP validada por diferencias finitas; las filas jacobianas de distancia/velocidad de distancia son derivadas parciales analíticas validadas por diferencias finitas (verificadas frente al observable de velocidad de distancia 3-D del crate); las cuatro condiciones iniciales son DRO planas corregidas diferencialmente que cierran con un residuo de periodicidad ajustado y son retrógradas; la transición de rango se valida de forma cruzada frente al filtro de información de raíz cuadrada del crate (covarianza posterior finita exactamente con rango completo, cond(P)=cond(OᵀO)); una instantánea con rango deficiente se marca como GDOP indefinido (condición de fim=inf), nunca como un valor finito falso — la misma protección de geometría singular que aplica pvt::solve_spp. MODELLED: el diseño de la constelación (amplitudes y fases de perilunio de las DRO) y la progresión de rango concreta que produce. No es un producto certificado de rendimiento de navegación.

engine-kind-conflict-resilience-description = Resiliencia MODELLED de un PNT por capas ante conflictos (P7): un usuario en un entorno disputado dispone de varias capas PNT (GNSS de servicio abierto, GNSS de banda ancha, una constelación autenticada, un relé de aumentación), cada una con una disponibilidad base, una exactitud 1σ y una vulnerabilidad de denegación por vector frente a la amenaza compartida de jamming/spoofing. Un Monte Carlo CON SEMILLA con barrido de intensidad deniega cada capa con probabilidad clamp(vulnerability·intensity·vector_weight,0,1), fusiona las supervivientes con la regla de forma cerrada de varianza inversa σ_fused=(Σ 1/σ_i²)^(−1/2) y notifica la probabilidad de pérdida total (todas las capas denegadas), el error fusionado mediano y estadísticos de uso/denegación por capa frente a la intensidad. La razón de resiliencia principal (probabilidad de pérdida total de capa única frente a por capas) llega a ~7x bajo el supuesto de INDEPENDENCIA; un barrido de denegación correlacionada con cópula gaussiana de un factor muestra después que esos ~7x se hunden hacia 1 a medida que aumenta la correlación de denegación (la correlación anula la ventaja de las capas). Un bloque de sensibilidad a los a priori recorre la cifra principal sobre los a priori de vulnerabilidad CON FUENTE mediante el tornado de mcda + una reasignación Dirichlet del esfuerzo de la amenaza + IC por percentiles. Núcleo VALIDATED: la pérdida total de Monte Carlo converge al producto independiente de forma cerrada Π_i p_deny_i (dentro del error estándar de MC con semilla fija y N grande); la fusión de varianza inversa es una identidad de forma cerrada; con ρ=0 la cópula se reduce al modelo independiente y todo ρ conserva la tasa marginal de denegación de cada capa. MODELLED: las magnitudes de vulnerabilidad/disponibilidad/exactitud por capa son entradas con fuente pero Modelled (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — véase conflict_threat_params), y la magnitud concreta de ~7x y la forma de la curva de razón frente a correlación se derivan de esa parametrización. Un desglose de supervivencia por vector del §4.2 resuelve después la amenaza de RF compartida en los cuatro vectores con nombre (jamming/spoofing/cinético/ciber) y notifica la curva de degradación gradual de PNT utilizable de cada vector S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: el Monte Carlo por capa con semilla converge a esa forma cerrada; el jamming es el vector más agudo para la línea base de RF correlacionada y la capa inercial inmune a RF es la superviviente decisiva. No es un producto certificado de disponibilidad de navegación.

engine-kind-lunar-attack-surface-description = Superficie de ataque a la seguridad de la señal de navegación en la superficie lunar (P1): compone los análisis abiertos de seguridad de la señal en una única ejecución accesible desde el binario. Notifica (1) la potencia recibida de AFS y su EXCEDENTE de potencia frente a una referencia de GPS terrestre, además de la banda de sensibilidad de 12-18 dB como un auténtico barrido multieje sobre las entradas del enlace (nivel de referencia x EIRP x distancia oblicua) con la conciliación del factor lineal de 25x redondeado / 28x sin redondear. REVISADO (regla R4): esto notificaba un DÉFICIT de potencia de { $lit_15_6 } dB y un factor de 32x/36x hasta que se corrigió la referencia de GPS de -125 / -{ $lit_128_5 } (que son las cifras en dBm) a -155 / -{ $lit_158_5 } dBW, los valores de ICD-GPS-200 que el módulo de jamming ha llevado siempre. El signo se invierte: la señal AFS lunar modelada es { $lit_14_4 } dB MÁS FUERTE que GPS L1 C/A terrestre, no más débil. La potencia recibida en sí no varió ni un bit, y el factor lineal es el antiguo dividido exactamente por 1000, que es exactamente el desfase de 30 dB entre dBm y dBW; (2) la potencia de transmisión que necesita el atacante para suplantar (J/S = 3 dB) y para denegar (J/S = 30 dB) a cada distancia de separación, la inversa del enlace J/S; (3) la huella de captura orbital bajo un patrón real de antena de apertura uniforme (Airy [2 J1(x)/x]^2), un casquete subhemisférico limitado por la altitud cuyo limbo NO se captura; (4) un resultado calculado de captura por arrastre del lazo de seguimiento por spoofing (si un spoofer de código coincidente con una ventaja de potencia y un desfase de código dados arrastra realmente el DLL/PLL) en lugar del umbral de 3 dB asumido; (5) el alcance del horizonte geométrico de un transmisor elevado en la superficie de un cuerpo sin atmósfera; y (6) el presupuesto de autenticación OSNMA/TESLA (20 bit/s de sobrecarga = ~40 % de un mensaje de navegación AFS de 50 bit/s, latencia de divulgación de clave, falsificación 2^-40). Un cuerpo vacío reproduce la línea base de P1; toda entrada tiene valor por defecto y puede sustituirse. Los subresultados VALIDATED llevan la referencia independiente de su módulo de origen (radiometría en dB de forma cerrada; ida y vuelta del J/S inverso; patrón de Airy frente a Bessel de A&S y geometría de casquete esférico; arrastre de DLL/PLL frente a Kaplan & Hegarty; identidad del horizonte tangente esférico frente a eo_payload; dimensionado de campos del ICD SIS de OSNMA). MODELLED: las magnitudes representativas de geometría/potencia y los valores concretos de las celdas del mapa de captura. No es un producto certificado de seguridad.

engine-kind-realtime-frame-eop-description = Presupuesto de predicción en tiempo real del marco lunar / orientación terrestre: P4 Tabla 1 (la comprobación de coherencia del error de marco — posprocesado ~{ $lit_0_27 } m ↔ ~{ $lit_0_010 } ms y tiempo real ~15 m ↔ ~{ $lit_0_5 } ms, con cada posición de marco expresada como su error equivalente de UT1 mediante el brazo de palanca L19 Δr = D_EM·ω⊕·ΔUT1) y Tabla 2 (error medido de predicción de UT1 frente al horizonte — la curva L18 leída directamente de la serie real finals2000A del IERS: el suelo final Boletín A − Boletín B y el error del predictor de persistencia a varios días, cada uno trasladado a una posición en el marco lunar mediante L19), más el presupuesto L21 de error de marco en tiempo real por suma cuadrática (EOP + efeméride + suelo de realización). Forma cerrada VALIDATED (el brazo de palanca L19, ω⊕ verificado frente al ángulo de rotación terrestre CIO) y datos reales VALIDATED (la curva L18 a partir de las filas reales de finals2000A); son MODELLED las magnitudes de covarianza de OD del relé lunar y el suelo de realización del marco (asignaciones representativas) y el predictor de persistencia (no el algoritmo operativo del Boletín A del IERS). No es un producto certificado de marco en tiempo real.

engine-kind-aperture-duty-cycle-description = Ciclo de trabajo de apertura: el reparto de tiempo entre navegación y comunicaciones que implica un plan de contactos para un conjunto de aperturas orientables. Toma un plan de contactos (una lista de ventanas aos_s/los_s de `[[contacts]]`, cada una solicitando navegación o comunicaciones — el mismo vocabulario aos_s/los_s que emite el predictor `passes`), un número de aperturas y una POLÍTICA DE ARBITRAJE (prioridad de navegación por defecto, o prioridad de comunicaciones, o primero en llegar primero en ser servido sin expropiación), y notifica el ciclo de trabajo de navegación, el de comunicaciones, el ciclo de inactividad y la interrupción por sesión — el tiempo de contacto que una sesión solicitó y ninguna apertura sirvió. Un barrido exacto de intervalos sobre los límites de las ventanas, de modo que las ventanas contiguas nunca compiten y ningún segundo de apertura se cuenta dos veces; los segundos de apertura de navegación, comunicaciones e inactividad se acumulan de forma independiente y cierran frente a apertures*horizon_s. El informe indica la política resuelta, su definición completa y las definiciones de ciclo de trabajo e interrupción, porque una cifra de ciclo de trabajo citada sin su política de arbitraje no es reproducible. Aritmética de planificación MODELLED: no se cobra ningún tiempo de reorientación / resintonización / cambio cuando una apertura cambia de servicio o de sesión, ni intervienen en la decisión el volumen de datos, el estado de los búferes, el presupuesto de energía ni el cierre del enlace, y las ventanas de contacto son entradas — su geometría es la que las produjo. No es un producto de planificación de segmento terreno.

engine-kind-lunar-jamming-description = Jamming de RF nativo lunar: relación jammer-señal por satélite, C/N₀ efectivo y pérdida de enganche para un usuario selenográfico en la superficie bajo un jammer en la superficie lunar (o elevado), sobre la constelación ilustrativa en órbita lunar, de fuente pública, de clase Moonlight/LCNS. Compone la física abierta de jamming existente (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) con la geometría del cielo lunar existente (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); no se vuelve a derivar ninguna geometría ni radiometría. A diferencia del tipo `jamming` terrestre, el tramo de señal NO es una potencia recibida fija: la potencia isotrópica recibida de cada satélite es su propio presupuesto de enlace EIRP − FSPL(distancia oblicua), de modo que el J/S varía de un satélite a otro con la distancia y la elevación lunares. Notifica UNA FILA POR CADA ENLACE VISIBLE (época, satélite) — acimut, elevación, distancia oblicua, ambas potencias recibidas cuya diferencia es el J/S, el J/S, el C/N₀ nominal y efectivo y el estado de enganche — además de cifras de mérito agregadas junto a (nunca en lugar de) esa tabla, y la misma tabla como artefacto CSV. Todo campo numérico emitido lleva una unidad y una clase de procedencia. Los subresultados VALIDATED llevan la referencia independiente de su módulo de origen (la ecuación antiinterferencia y el enlace J/S de Kaplan & Hegarty §9.4, con referencia externa en tests/gnss_denied_jamming_resilience_reference.rs; la geometría lunar de lunar_service). La composición en sí se verifica frente a una ruta independiente de dos presupuestos de enlace (linkbudget::received_signal_power_dbw, una expresión distinta de pérdida en espacio libre) hasta 1e-9 dB. MODELLED: la constelación ilustrativa, la EIRP / potencia del jammer / ganancias de antena / temperatura de ruido representativas, y la ausencia de sombra del terreno, multitrayecto, dinámica de AGC y anulación adaptativa. No es un producto certificado de denegación de servicio. Con un jammer configurado, el informe lleva además un CONTORNO DE DENEGACIÓN CON UNA BANDA DE INCERTIDUMBRE en lugar de un contorno leído de un solo escalar: la distribución completa medida del C/N₀ de la señal deseada sobre la tabla por satélite (n, mín, p05, p25, mediana, p75, p95, máx, media, desviación típica muestral y la propia asimetría de la muestra), y el contorno evaluado en cada uno de esos estadísticos de orden bajo AMBOS criterios de denegación que reconoce el motor — el vigente de razón de potencias (J/S = 30 dB, como en attack-surface y tracking-loop) y el de pérdida de enganche (C/N₀ efectivo descendiendo hasta tracking_threshold_dbhz, el criterio que usa la propia columna de estado de este informe) — en ambos ejes del plano de denegación (EIRP del jammer requerida a la distancia de separación del escenario, distancia de separación de denegación a la EIRP del escenario). Los bordes de la banda SON contour(p05) y contour(p95), la misma aplicación de forma cerrada sobre los cuantiles propios de la muestra: no una sigma ajustada a la muestra ni mediana ± k·desv, con la desviación típica emitida por continuidad y no usada por nada. Un cuantil ya igual o inferior al umbral de seguimiento no tiene un J/S de denegación finito y sus columnas de pérdida de enganche son nulas con una razón contabilizada, nunca un radio acotado.

engine-kind-ins-trn-coast-description = Modelo de error de deriva INS/TRN: error de posición frente a la duración de la deriva, construido a partir de coeficientes de la IMU en lugar de barrerse como una tasa de deriva supuesta. Cinco contribuciones de crecimiento — sesgo del acelerómetro, inclinación por sesgo del giroscopio a través de la gravedad, paseo aleatorio de velocidad, paseo aleatorio de ángulo y factor de escala frente a la distancia recorrida — cada una propagada a través de un modelo de error inercial de nivel local de nueve estados con realimentación de Schuler a una latitud y altura indicadas (las leyes de orden principal para derivas cortas t², t³, t^1.5, t^2.5 y t¹/t² se notifican a su lado) y combinadas bajo una regla INDICADA (suma cuadrática por defecto, o suma lineal, o suma determinista con suma cuadrática estocástica; las tres se calculan en cada ejecución para que la elección sea visible y no quede oculta). Las duraciones de deriva que alcanzan los umbrales de posición suministrados por quien llama (10 m y 50 m por defecto) se localizan mediante la bisección existente del motor, cada una con un desglose por contribución que nombra la fuente dominante, y el cruce de cada contribución individual se invierte además algebraicamente para que ambos coincidan. Un modo de navegación relativa al terreno acota la deriva con correcciones periódicas de posición y notifica el mayor intervalo entre correcciones que mantiene cada umbral; una corrección solo de posición deja vivos el error de velocidad y la inclinación a través de la corrección, de modo que no siempre acota la deriva con cualquier frecuencia de corrección, y el informe lo dice en lugar de devolver un cero. MODELLED: los coeficientes de clase de la IMU son cifras representativas de banda, no una hoja de datos, y el residuo de la corrección de terreno es una entrada. Un umbral no alcanzado se notifica como nulo con un estado, nunca como cero. No es un producto certificado de rendimiento de navegación inercial.

engine-kind-lunar-vlbi-fim-description = Covarianza de coordenadas de estación de VLBI lunar: las derivadas parciales de retardo del observable lunar-vlbi acumuladas sobre un CALENDARIO explícito (líneas base x épocas) en una matriz de información de Fisher, invertida, y notificada como la covarianza de coordenadas de estación y la sigma de estación por coordenada — una salida calculada del motor y no una precisión escalar de retardo propagada a través de un factor de equipartición isótropo supuesto g = 3. El estado lleva coordenadas de estación FIJAS a la Tierra (ITRS), de modo que el jacobiano es la derivada parcial inercial rotada por la matriz GCRS->ITRS de cada época: la rotación terrestre es lo que hace observables esas coordenadas, y el informe MIDE el barrido de la línea de visión fija a la Tierra y la declinación de la baliza en lugar de suponerlos. Una observación es un par (línea base, época) con AMBAS estaciones por encima de la máscara de elevación, ponderado por 1/delay_sigma_s^2. Notifica en cada ejecución el rango, el defecto de datum, el número de condición, el espectro completo de información, la matriz de covarianza, las sigmas por estación, por eje y 3-D, y el espacio nulo de la red libre; ante una deficiencia de rango, la sigma principal se publica como NULL con un estado, nunca leída de una inversa casi singular. El valor de equipartición c*delay_sigma_s*sqrt(g/N) para el MISMO calendario se emite junto al valor calculado con la razón, junto con la cota isótropa de traza sqrt(p/trace(M)) que AM-HM convierte en un suelo estricto — de modo que la razón es la anisotropía que descartó el supuesto. El cierre de retardo tau_ik = tau_ij + tau_jk hace que solo n-1 de las n(n-1)/2 líneas base sean geométricamente independientes; el informe indica ambos recuentos. MODELLED: la efeméride del centro de la Luna, los relojes de estación, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS y las observaciones se tratan como independientes, de modo que la covarianza es una cota de Cramer-Rao para un conjunto reducido de parámetros, no un resultado de sesión previsto; la sigma de retardo, las coordenadas de estación y el calendario son entradas. La derivada parcial que omite el jacobiano del retardo geométrico (el término de Shapiro diferenciado) se mide por diferencias finitas y se emite. No es un producto geodésico.

engine-kind-tracking-loop-description = Pérdida de enganche del lazo de seguimiento: C/N0 -> enganche/desenganche CON HISTÉRESIS, el tiempo que se tarda en perder el enganche y el arrastre por spoofing en función de la TASA de desfase de código y de portadora. Los criterios existentes de denegación y captura del motor son razones sobre la potencia recibida (un jammer deniega con J/S = 30 dB, un spoofer captura con 3 dB); la pérdida real de enganche no es una razón de potencias, sino el punto en que la fluctuación de un lazo más el esfuerzo dinámico agotan su presupuesto de umbral de seguimiento. Notifica (1) la fluctuación térmica 1-sigma de portadora (Costas) y de código (early/late no coherente) frente a C/N0, con la pérdida por elevación al cuadrado incluida, frente a las reglas indicadas 3*sigma_PLL + theta_e <= 45 deg (la regla de 15 grados en forma de tres sigmas) y 3*sigma_DLL + retardo de rampa <= d/2 chips; (2) los umbrales de C/N0 de pérdida y de reenganche con el lazo limitante nombrado, con el umbral de reenganche DERIVADO del mayor ancho de banda con el que un receptor vuelve a arrastrarse y no afirmado, de modo que la anchura de la histéresis debe caer entre 5*log10(razón) y 10*log10(razón) dB; (3) el tiempo declarado hasta perder el enganche de un detector de enganche de dos umbrales con permanencias de confirmación, accionado sobre una rampa de C/N0, notificado por separado del tiempo físico de escape de fase (el tiempo medio de Viterbi entre saltos de ciclo, en log10 s porque abarca cientos de décadas); (4) los límites de arrastre por spoofing — la mayor deriva de código y la mayor tasa Doppler de portadora que pueden seguir los lazos de una víctima, con un mapa sobre ambos ejes, porque un spoofer que se desplaza más rápido que ellas no captura el lazo, lo deja atrás; y (5) el RADIO DE DENEGACIÓN que implica la dinámica del lazo, notificado JUNTO al radio existente por razón de potencias y nunca en su lugar, con su diferencia con signo como campo propio con nombre (denial_radius_delta_km) y una definición a su lado. Todo campo numérico emitido lleva una unidad y una clase de procedencia. Formas cerradas VALIDATED: las expresiones de fluctuación de portadora y de código, la reducción del filtro de lazo sqrt(2*B_n*T) y el retardo de rampa de primer orden se verifican frente al propio correlador sdr del motor avanzado sobre FI sintética con semilla — otra ruta hacia las mismas cifras — hasta { $lit_0_6 } %, { $lit_3_7 } % y { $lit_0_17 } % respectivamente, y la Bessel modificada I0 que hay detrás del tiempo de salto de ciclo frente a valores tabulados estándar hasta 1e-7. El límite inferior de validez se afirma, no solo se indica: por debajo de ~32 dB-Hz a 1 ms el discriminador atan real se satura frente a su rango +-pi/2 y mide menos fluctuación que cualquier teoría lineal. MODELLED: los anchos de banda de lazo, el tiempo de integración, la separación de correladores, la razón de anchos de banda de arrastre, las permanencias de confirmación, la potencia del jammer y las ganancias de antena son cifras representativas de banda, no una hoja de datos. NO se modelan: la fluctuación del oscilador (desviación de Allan) y por vibración, la limitación de ancho de banda del frontal, el multitrayecto, la dinámica de AGC, la pérdida por transición de bit de datos, el apoyo externo ni ninguna corrección de medio ciclo a la fórmula de salto de ciclo de Costas. Bajo la dinámica del lazo la captura por spoofing no tiene radio alguno — la restricción limitante es la tasa de desfase, no la potencia — de modo que ese campo es nulo con una razón en lugar de una cifra inventada. No es un producto certificado de rendimiento de receptor.

engine-kind-araim-reference-check-description = Vectores de referencia publicados de ARAIM para certificación: los niveles de protección horizontal y vertical ARAIM del motor ejecutados frente a los PROPIOS ejemplos numéricos resueltos del Subgrupo Técnico ARAIM del WG-C, con la tolerancia (TOL_PL = 5e-2 m) que esos mismos documentos indican. Se incluyen dos vectores como fixtures, cada uno con su URL de obtención, fecha de obtención, SHA-256 del archivo de origen y página: el Reference Airborne Algorithm Description Document v3.1 (2019) Apéndice D — autoconsistente, y el vector de aceptación — y el Milestone 3 Report (2016) Anexo A sección A.IX, la declaración que citan las bibliografías de investigación. Cada entrada publicada (la matriz de geometría de 10 satélites y 2 constelaciones, las diagonales de varianza C_int y C_acc, b_nom, P_sat, P_const y el conjunto de constantes LPV-200) y cada salida publicada (VPL, HPL, EMT, sigma_v_acc, K_fa_3 y los sigma_3, sigma_ss_3 y b_3 de los dos modos de fallo de constelación) se notifica junto a la cifra propia del motor y su diferencia absoluta. La ecuación del nivel de protección NO se vuelve a resolver aquí: la lista de modos de la referencia se entrega a raim::araim_protection_level / araim_integrity_risk, ya existentes en el motor, de modo que la bisección y el álgebra de colas gaussianas sometidas a prueba son las del propio motor; solo se construyen para ello la geometría, las subsoluciones, los umbrales de detección y el reparto publicado del presupuesto. COMPROBADO EXTERNAMENTE frente al vector de 2019: VPL { $lit_18_2926 } m frente a { $lit_18_3 } m publicado, HPL { $lit_13_4063 } m frente a { $lit_13_45 } m, EMT { $lit_7_2997 } m frente a { $lit_7_2998 } m, sigma_v_acc { $lit_1_3694 } m frente a { $lit_1_3694 } m, y los seis intermedios publicados dentro de media unidad en su último decimal impreso. El vector de 2016 contiene dos defectos internos que el informe declara en lugar de ocultar — una errata de signo en la fila 3 de G, y un K_fa_3 evaluado con 57 modos de fallo mientras el documento indica N_fault_max = 1 (12 modos) — de modo que sus intermedios de geometría se reproducen exactamente mientras que sus niveles de protección se notifican como discrepancias medidas y se excluyen de la cifra de aceptación; la tolerancia nunca se amplía para absorberlos. Todo campo numérico emitido lleva una unidad y una clase de procedencia, y una cifra transcrita se etiqueta `published` para que nunca pueda confundirse con una calculada. ALCANCE: solo se implementa N_fault_max = 1 (modos de fallo de un solo satélite y de una sola constelación), y un caso cuyos a priori exigen subconjuntos de fallo con varios eventos simultáneos se RECHAZA (REFUSED) en lugar de truncarse en silencio; la detección de fallos, la exclusión, la comprobación de consistencia chi-cuadrado y el paso de reasignación por doble recuento del algoritmo de referencia quedan fuera de alcance. Esto reproduce el ejemplo resuelto de un algoritmo de referencia publicado — no es una certificación, un artefacto de aeronavegabilidad ni una aprobación.

engine-kind-lunar-frame-campaign-description = Datum de marco de Helmert (de semejanza) de siete parámetros accionado por una CAMPAÑA DE OBSERVACIÓN SIMULADA y no por una transformación inyectada. Una red de estaciones terrestres observa un catálogo de balizas en la superficie lunar según un calendario explícito; las derivadas parciales de retardo VLBI lunar se acumulan sobre ese calendario en una matriz de información de Fisher de coordenadas de baliza exactamente como hace lunar-vlbi-fim; y esa información se propaga a través del diseño de Helmert A = [I3 | [p]_x | p] en los puntos del catálogo hasta la covarianza del datum H = A^T M_b A, diagnosticada por crate::fim::crlb. NO se inyecta ninguna transformación y nada se recupera de una respuesta plantada, de modo que la exactitud del datum notificada se deriva del programa de observación: reducir a la mitad la sigma de retardo la reduce exactamente a la mitad, y alargar el arco la mejora porque la libración que el informe MIDE (sub_earth_direction_sweep_deg) es lo que separa la coordenada de baliza en la línea de visión de las del plano del cielo. El rango, el defecto de datum, el número de condición, el espectro completo, las direcciones no observables EN LA BASE DE SIETE PARÁMETROS, la dirección más débil incluso con rango completo y la parte de cada parámetro en ella se emiten en cada ejecución; un parámetro que la campaña no restringe se publica como NULL con un estado, nunca leído de una inversa casi singular. La correlación de error de balizas se mide, no se supone: con las estaciones fijas ninguna observación toca dos balizas, de modo que la matriz de información es exactamente diagonal por bloques (offblock_fraction 0), y con las estaciones estimadas el bloque marginalizado por Schur está acoplado, con la correlación inducida impresa y toda la propagación repetida descartándola, de modo que el precio de un supuesto de independencia es una cifra. La misma propagación con una sigma isótropa por coordenada, y el error de recuperación que notifica el escenario lunar-frame-realisation, se ejecutan ambos aquí y se imprimen junto al valor de la campaña con sus razones. MODELLED: el catálogo de balizas tiene fuente pero la CAMPAÑA es simulada — la red de estaciones y la sigma de retardo son entradas ilustrativas, las observaciones individuales de retardo se tratan como independientes, y la efeméride del centro de la Luna, los relojes de estación, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS, de modo que la covarianza del datum es una cota de Cramer-Rao para un conjunto reducido de parámetros. No es un producto geodésico.

engine-kind-lunar-llr-datum-description = Datum de marco lunar de Helmert de siete parámetros accionado por una campaña de observación REAL y ARCHIVADA en lugar de una simulada. Mientras que lunar-frame-campaign eliminó la transformación inyectada pero seguía indicando su red de estaciones, su calendario y su sigma por observación como entradas ILUSTRATIVAS, este tipo toma las tres de mediciones: las épocas son los tiempos de transmisión desde tierra de puntos normales archivados de Consolidated Laser Ranging Data del ILRS, las observaciones son las distancias láser realmente disparadas a los cinco conjuntos de retrorreflectores de la Luna, y cada peso de observación es la propia precisión archivada de ese punto normal bin_rms/sqrt(n_raw) leída del archivo. Las coordenadas de estación proceden de la solución SLR ITRF2020 del IERS (propagadas a la época con sus velocidades publicadas) y las coordenadas de los reflectores de JPL DE430 Tabla 7 en el marco de Tierra media/rotación media que realiza el modelo IAU 2015 WGCCRE. Las derivadas parciales de distancia se acumulan en la matriz conjunta de información de Fisher de coordenadas de reflector y se propagan a través del mismo diseño de Helmert hasta la covarianza del datum, diagnosticada por crate::fim::crlb. El rango, el defecto, la condición, el espectro, las direcciones no observables en la base de siete parámetros, la dirección más débil con rango completo y la parte de cada parámetro en ella se emiten en cada ejecución, y un parámetro no restringido se publica como NULL con un estado. La correlación entre conjuntos se MIDE en exactamente cero y no se supone, porque una distancia láser toca un solo conjunto. Un registro que los catálogos no pueden ubicar — una estación sin posición ITRF publicada — se OMITE Y SE CUENTA, nunca se le da una coordenada sustituida. QUÉ ENLACES SE MIDEN Y CUÁLES SON MODELLED ES EL INFORME, NO UNA NOTA AL PIE: la efeméride del centro de la Luna y la orientación del cuerpo según la IAU siguen modeladas y su tamaño combinado se emite como el residuo de distancia unidireccional observado menos calculado sobre cada punto usado; la troposfera, las mareas del cuerpo sólido, la excentricidad de la estación, el movimiento polar, UT1-UTC, el retardo relativista y los relojes de estación están ausentes y dentro de ese residuo. Como un error de efeméride llega a una covarianza solo a través de la dirección de cada línea de visión, cada ejecución también vuelve a resolver todo el datum con todas las derivadas parciales inclinadas sensitivity_tilt_deg (con signo alterno) y emite la razón, de modo que la insensibilidad de la covarianza a la efeméride modelada es una cifra y no un argumento. Las cifras de la propia campaña simulada se EJECUTAN y se imprimen junto a las medidas, no se transcriben. MODELLED: las cifras de siete parámetros son una cota de Cramer-Rao para un conjunto reducido de parámetros sobre un calendario real — no un datum resuelto, no un análisis LLR y no un producto geodésico. El fragmento de datos reales incluido se entrega con el repositorio pero no con el crate publicado; apunte data_dir a una copia del mismo.

engine-kind-lunar-beacon-description = Aumentación con balizas en superficie de un servicio de navegación orbital lunar, como una tabla ejecutable de antes y después. Un usuario del polo sur ve un conjunto orbital disperso en una franja estrecha del cielo, de modo que la geometría de medición de distancia está mal condicionada; unas pocas BALIZAS EN SUPERFICIE LEVANTADAS aportan las filas de línea de visión de baja elevación y amplio acimut de las que carece un conjunto todo cenital, y la dilución horizontal de la precisión se desploma. El escenario notifica tres configuraciones en una época — solo satélites, satélites más las balizas visibles, y una constelación mayor como ruta alternativa hacia la misma geometría — cada una con sus recuentos de fuentes visibles, su DOP completo y la exactitud 1-sigma lograda en METROS, obtenida multiplicando por un error equivalente de distancia del usuario por baliza compuesto como suma cuadrática de términos de sincronización de reloj, multitrayecto y levantamiento. La visibilidad de las balizas es el horizonte geométrico de dos alturas de la Luna sin atmósfera (sin atmósfera, de modo que la cota es exacta), y el ensamblado del DOP es el mismo núcleo verificado frente a gnss_lib_py en tests/dop_reference.rs. POR QUÉ EXISTE ESTE TIPO: el módulo que hay detrás está en el motor y verificado frente a una ruta independiente de DOP desde L08/L09, pero no era accesible desde una ejecución — sin tipo, sin rama de despacho, sin archivo incluido. El README anunciaba la capacidad y la matriz de verificación NO tenía ninguna fila para ella, de modo que se afirmaba a la vez en la prosa y no se afirmaba en el registro, siendo inaccesible en el motor. Los valores por defecto son la geometría que ya cuenta con un golden confirmado (un usuario a -80 deg con una antena de 2 m, tres balizas a -80/0, -79/+60 y -79/-60 a 2 km, una instantánea ilustrativa de seis satélites de LCNS en t=0, una máscara de 5 deg), de modo que una ejecución sin parámetros reproduce una tabla que una referencia independiente ya cubre en lugar de inventar cifras nuevas. MODELLED: el diseño de la constelación, la colocación de las balizas y cada magnitud del presupuesto de errores son entradas ilustrativas, no un levantamiento desplegado ni un enlace medido; solo la aritmética del DOP, la forma cerrada del horizonte y la relación sigma = DOP x sigma_URE están ancladas externamente. No es un compromiso de rendimiento del servicio.

engine-kind-earth-gnss-lunar-description = Recepción de GNSS terrestre a distancia lunar, la capa de señal débil que nombra el artículo de resiliencia ante conflictos y para la que el motor no tenía modelo. Un satélite GNSS apunta su antena hacia la Tierra; un receptor cercano a la Luna está a unas quince veces el radio orbital, de modo que se combinan tres efectos a la vez. La Tierra OCULTA EL EJE DE APUNTAMIENTO: desde 26,560 km subtiende un semiángulo de { $lit_13_9 } deg, de modo que todo rayo con destino lunar debe salir del transmisor al menos tan lejos del nadir, lo que elimina el pico del haz antes de calcular ninguna potencia. Lo que queda es el BORDE DEL LÓBULO PRINCIPAL Y LOS LÓBULOS LATERALES, el régimen en el que realmente operó la carga útil LuGRE en 2025. Y la pérdida en espacio libre es de unos 208 dB en L1, aproximadamente 25 dB más de lo que paga un usuario terrestre. El informe emite una fila por satélite (ángulo fuera del eje, ocultación por la Tierra, distancia, pérdida de trayecto, ganancia de transmisión a ese ángulo, potencia recibida, densidad de portadora a ruido) y agrega solo los enlaces que superan el umbral de seguimiento. TAMBIÉN NOTIFICA EL CONDICIONAMIENTO, porque eso es lo que define esta capa: todo satélite visible está dentro de un cono de un par de grados de ancho visto desde la Luna, de modo que las líneas de visión son casi paralelas, la dilución de la precisión es enorme y una solución de GNSS terrestre a distancia lunar es una observación de grado de TEMPORIZACIÓN mucho más que de grado de posición. MODELLED, y el patrón de transmisión es la razón: la ganancia en función del ángulo es una apertura circular uniforme (Airy), mientras que una antena real de GPS L1 es una agrupación helicoidal de doce elementos con un lóbulo principal conformado y lóbulos laterales no de Airy. Existen patrones medidos y no se incluyen aquí, de modo que los órdenes y los órdenes de magnitud son significativos mientras que los dB de un satélite concreto no lo son. Deliberadamente AUSENTES, cada una de las cuales hace optimista el presupuesto: ninguna pérdida ionosférica ni troposférica en los rayos rasantes al limbo, ninguna pérdida de polarización, apuntamiento o implementación, y una Tierra esférica sin extensión refractiva. La posición de la Luna es una ENTRADA (distancia más dirección inercial) y no una consulta de efemérides, porque lo que se somete a prueba es el enlace y la geometría del haz. Elevar esta fila a Validated exige un patrón de transmisión medido y puntos normales de LuGRE; ninguno está en el repositorio y ninguno se inventa aquí.

engine-kind-lunar-infrastructure-description = Estudios MODELLED de la órbita y la superficie de la Luna como infraestructura de navegación y geodésica, cinco estudios tras un mismo tipo seleccionados mediante `study`: od-consistency (determinación de órbita a bordo con GNSS terrestre en una NRHO o ELFO frente a la determinación de órbita radiométrica independiente desde tierra, juzgadas por sus propias covarianzas sobre un Monte Carlo con semilla), carrier-phase (fase de portadora de doble diferencia conjunta superficie-orbitador y resolución de ambigüedad entera con LAMBDA), frame-coestimation (una estación en superficie y orbitadores añadidos a la medición de distancia de estaciones terrestres para el datum de marco lunar de siete parámetros), space-tie (GNSS, VLBI y medición láser de distancia en una misma nave, precisión del enlace de marco frente al error de enlace local) y geodesy-sensitivity (información de Fisher de los números de Love lunares h2, k2, l2 y de la libración física a partir de medición láser de distancia, seguimiento de orbitadores, un gravímetro en superficie y un reloj en superficie). Un modelo restringido de tres cuerpos con simplificaciones indicadas; la numérica se verifica frente a programas independientes y nada se compara con una medición de una magnitud lunar.

engine-kind-cislunar-arc-recovery-description = Prueba MODELLED de estimador independiente del umbral de observabilidad de longitud de arco cislunar. Ese umbral es una lectura de RANGO de la matriz de observabilidad ensamblada a partir de las filas ANALÍTICAS del jacobiano de distancia y de la matriz ANALÍTICA variacional de transición de estado, y su verificación cruzada con el filtro de información de raíz cuadrada pliega esas mismas filas — una comprobación de coherencia entre dos máquinas numéricas, no una corroboración. Este tipo aporta el árbitro que faltaba: un estimador de mínimos cuadrados por lotes que efectivamente RECUPERA el estado inicial del jefe a partir de mediciones simuladas, con las derivadas parciales de medición tomadas como DIFERENCIAS FINITAS CENTRALES del modelo directo compuesto. No llama a ninguna fila analítica del jacobiano, ni a ninguna STM variacional, ni a ninguna descomposición en valores singulares o autovalores, ni a ninguna tolerancia de rango, ni a ningún filtro de información de raíz cuadrada — una protección de texto fuente en tests/cislunar_arc_recovery_reference.rs lo hace exigible — mientras que la dinámica (el mismo flujo CR3BP con RK4), las condiciones iniciales (la misma constelación corregida diferencialmente), el observable escalar y la cuadrícula de épocas se comparten deliberadamente y se nombran en el bloque `independence` emitido, porque dos análisis de un mismo problema físico deben coincidir en la física para ser comparables. Dos criterios, cada uno barrido sobre cinco décadas de su propia cota: RECUPERACIÓN SIN RUIDO (el error de estado final de cada ensayo con semilla es como máximo recovery_factor veces su desplazamiento a priori — el análogo del rango, sin tolerancia de valores singulares) y ESTIMABILIDAD MONTE CARLO (el error RMS de posición medido sobre un conjunto de ruido con semilla por debajo de una cota indicada — el análogo de la estimabilidad, medido y no previsto). Admite el caso plano de cuatro estados y el espacial de seis, las familias DRO / halo L2 / NRHO L2, observables de distancia y de velocidad de distancia, y una parametrización polar centrada en la Luna en la que la transformación se aplica al ESTADO y el modelo directo se vuelve a diferenciar allí. MEDIDO sobre la cuadrícula publicada de DRO planas: el estimador recupera los cuatro estados desde { $lit_0_782609 } h frente a { $lit_2_086957 } h del criterio de rango con rel_tol 1e-6 (razón { $lit_0_375 }) — el umbral de rango NO está corroborado como frontera de recuperabilidad — mientras que la frontera de estimabilidad medida cae en la misma celda de la cuadrícula que la formal, { $lit_5_739130 } h, y la curva de error medida reproduce la 1-sigma formal sobre 21 longitudes de arco con una razón media geométrica de { $lit_0_98 }. MODELLED: el diseño de la constelación, la cuadrícula de épocas, el único enlace seguido, la magnitud del desplazamiento, la sigma de medición y las dos cotas indicadas. No es un producto certificado de rendimiento de navegación.

engine-kind-telecom-timing-description = Temporización de telecomunicaciones: error de tiempo, error máximo de intervalo de tiempo (MTIE) y desviación de tiempo (TDEV) de un holdover de GNSS, comprobados frente a máscaras de la ITU-T con un resultado CORRECTO o FALLO y un margen por máscara. La entrada es o bien un HOLDOVER SINTÉTICO (un preajuste de oscilador -- ocxo, rubidium, caesium o csac, cada uno con las cifras de estabilidad, envejecimiento y temperatura de una hoja de datos pública con nombre de Microchip -- más el tiempo de pérdida de GNSS, la duración del registro y el intervalo de muestreo; el reloj libre incluye ruido de frecuencia blanco, de flicker y, donde el ajuste de la hoja de datos lo necesite, de paseo aleatorio, envejecimiento lineal y un término sinusoidal de temperatura) o bien una SERIE INGERIDA de pares [time_s, time_error_ns] dados en línea (y, solo en compilaciones nativas, un archivo CSV). Máscaras: ITU-T G.8272 (07/2025) PRTC-A y PRTC-B (máx|TE| 100 / 40 ns, MTIE Tablas 1-2, TDEV Tablas 3-4); G.8272.1 (2024) Amd. 1 (07/2025) ePRTC enganchado (30 ns, Tablas 1-2) y holdover ePRTC-A (la envolvente de error de tiempo de la Tabla 3 que sube de 30 ns a 100 ns durante el periodo de holdover H fijado por la duración de enganche, MTIE Tabla 4, TDEV Tabla 5); G.8273.2 (2023) Amd. 2 (11/2025) clases A-C de T-BC/T-TSC (máx|TE|, error de tiempo constante, MTIE y TDEV filtrados paso bajo) y clase D (máx|TE_L| 5 ns, la única cifra de la clase D no dejada para estudio posterior); G.8271.1 (2022) Amd. 3 (05/2025) punto de referencia C (máx|TE_L| 1100 / 600 / 100 ns con MTIE Tablas 7-1 a 7-3). Toda entrada que una Recomendación marca para estudio posterior está ausente y no rellenada, y cada informe enumera lo que no está implementado. También notifica el tiempo hasta superar cada presupuesto de error máximo de tiempo (por defecto: 100 ns de máx|TE_HO| de ePRTC, 400 ns de asignación de holdover de red, 1100 ns del punto C, { $lit_1_5 } us de la clase 4), las curvas MTIE/TDEV como tabla CSV con el límite de cada máscara, y una entrada de unidades y procedencia por campo numérico. VALIDATED: los estimadores de MTIE y TDEV frente al paquete allantools sobre una serie de holdover confirmada. MODELLED: las tablas de máscaras son transcripciones, y un holdover sintético es un modelo construido a partir de máximos de hojas de datos, no una medición de ninguna unidad. No es una prueba de conformidad.

engine-kind-slot-timing-description = Temporización de ranuras: segundos hasta que un reloj libre sale de la guarda de una ranura de encaminamiento o de asignación de tareas indexada por tiempo (el mayor error de tiempo absoluto que tolera la ranura), la contribución de cada término en ese momento con el dominante nombrado (incertidumbre de la solución, ruido de fase blanco, ruido de frecuencia blanco, de flicker, de paseo aleatorio y de carrera aleatoria, desfase de frecuencia residual, temperatura, envejecimiento), el tiempo restante desde la última solución y el mayor intervalo entre soluciones que mantiene el reloj dentro, descontada la latencia de la solución. El oscilador es un valor por defecto de CLASE (csac, uso, dsac, tcxo, ocxo o rafs: una desviación de Allan citada a un segundo y un suelo de ruido rojo supuesto), un PREAJUSTE DE HOJA DE DATOS de telecom-timing o una HOJA DE DATOS en línea (máximos de desviación de Allan ajustados como envolvente, más envejecimiento y un coeficiente de temperatura), o un REGISTRO DE FASE MEDIDO en línea (su desviación de Allan solapada ajustada por mínimos cuadrados ponderados en la base de ruido de fase blanco y de modulación de frecuencia de IEEE Std 1139, de modo que el suelo de ruido rojo se mide y no se supone). Una superación más allá del mayor tiempo de promediado que admite la hoja de datos o el registro se marca como extrapolada. Una sección opcional de spoofing añade el nivel de protección de temporización para un receptor en órbita: velocidad y periodo orbitales, cuánto tiempo por paso puede alcanzar al satélite un único spoofer terrestre, el suelo del monitor asistido por reloj y la latencia de detección CUSUM, la cota condicional, el arrastre que acumula un spoofer con una tasa máxima de rampa indicada antes de que el satélite salga de su alcance o se ejecute una comprobación independiente, y si cada comprobación de contacto con tierra o de enlace cruzado es independiente de ese spoofer. VALIDATED: la inversión de holdover a partir de un registro ajustado, retenida sobre un reloj de cesio real medido frente a un máser de hidrógeno (tests/slot_timing_cs5071a_holdout.rs, condicionado a datos); sobre un oscilador de cuarzo medido la predicción retenida es conservadora pero no está dentro del umbral, de modo que el caso del cuarzo es MODELLED. MODELLED: las fuentes de clase y de hoja de datos, los términos deterministas y la evaluación de spoofing.

engine-kind-spectrum-description = Modelo del espectro de banda L y cascada: toda la banda L de GNSS como una única densidad espectral de potencia (PSD), con la frecuencia en horizontal y el tiempo hacia abajo, sobre una cronología de jammers programada. SEÑALES: GPS L1 C/A y L2C (BPSK(1)), servicio abierto Galileo E1 (MBOC(6,1,1/11) o BOC(1,1)), GPS L5 y Galileo E5a (BPSK(10)), cada una en su portadora con la potencia mínima recibida de la especificación de interfaz (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) salvo que se sustituya; GLONASS, BeiDou y Galileo E6 no se modelan. JAMMERS: tono de onda continua, ruido plano de banda estrecha, chirp lineal en diente de sierra y ruido de banda ancha ajustado a la propia modulación de una banda, cada uno con un centro, un ancho de banda, una potencia recibida (directa, o EIRP y distancia a través de la pérdida en espacio libre del tipo jamming) y tiempos de encendido/apagado. Cada jammer se puntúa frente a cada banda por su coeficiente de separación espectral kappa sobre el ancho de banda del receptor, y (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; para un solo jammer esto equivale a la ecuación antiinterferencia del tipo jamming con Q = 1/(R_c kappa), y el informe incluye esa verificación cruzada (y, junto a ella, la cifra de Q representativa del tipo jamming). El suelo de ruido es k T_sys con T_sys = T_ant + 290 K (F - 1). La cascada promedia cada celda sobre su intervalo y su fila (los chirps de forma exacta, barridos completos más el parcial; los jammers que conmutan a mitad de fila, por su ciclo de trabajo), de modo que la cronología de C/N0 y la imagen salen de las mismas cifras; result.json incluye la cuadrícula promediada por bloques en potencia, el C/N0 y el J/S por banda y fila y, por jammer y por banda, el SSC, Q, J/S, J/S en banda y C/N0 estable. [iq] opcional: el modelo dibujado como IQ complejo en un instante, escrito en una grabación SigMF (cf32_le o ci16_le), leído de nuevo y comparado con una estimación de Welch. [recording] opcional (compilaciones nativas): la PSD de Welch de una grabación SigMF real junto al modelo. VALIDATED: las PSD de señal frente a los anchos de lóbulo principal de los manuales (BPSK(n) 2n x { $lit_1_023 } MHz de nulo a nulo; lóbulos de BOC(1,1) centrados en +/-{ $lit_1_023 } MHz) y los coeficientes de separación espectral frente a sus formas cerradas de Parseval y a Q = 1 (CW) y { $lit_1_5 } (ajustado) de Kaplan & Hegarty. MODELLED: las potencias de los jammers, la cronología, los anchos de banda del frontal, el tratamiento de espectro continuo (sin líneas de código) y la ausencia de AGC, blanqueo y diagrama de antena.

engine-kind-solar-system-description = Todo el sistema solar en una época, para PNT (posicionamiento, navegación y temporización) alrededor de cualquier cuerpo. Para el Sol, los ocho planetas, Plutón, la Luna, Fobos, Deimos, Ío, Europa, Ganímedes, Calisto y Titán notifica la posición y velocidad heliocéntricas en el ICRF (International Celestial Reference Frame, ecuatorial J2000), la distancia heliocéntrica y la longitud y latitud eclípticas J2000, el parámetro gravitacional, el radio ecuatorial y medio, J2 donde está publicado y su radio de referencia, el periodo de rotación sidéreo, el polo IAU y el meridiano origen en la época, una traza orbital muestreada durante una revolución (heliocéntrica para los planetas, centrada en el cuerpo principal para las lunas) y el tiempo de luz, la distancia unidireccional y bidireccional, el retardo de Shapiro solar y la separación del Sol desde un cuerpo observador (por defecto, la Tierra); los enlaces adicionales from/to reciben el mismo tratamiento. Posiciones: los elementos keplerianos de JPL de Standish y Williams (Tabla 1 para 1800 d. C. a 2050 d. C., Tablas 2a/2b para 3000 a. C. a 3000 d. C.) con el error nominal de cada planeta, la serie lunar de Montenbruck & Gill para la separación Tierra-Luna, elementos medios de JPL con la tasa de rotación síncrona de la IAU para las lunas marcianas y galileanas, y el modelo de rotación de la IAU para Titán. Tiempo de luz: la resolución radiométrica de punto fijo, con el transmisor en su posición retardada; newtoniano, con el retardo de Shapiro notificado por separado. VALIDATED frente a JPL Horizons (DE441) dentro del doble del error nominal: de Mercurio a Saturno y la Tierra a partir de la Tabla 1 (el peor, { $lit_1_87 } veces el nominal) y los ocho planetas a partir de las Tablas 2a/2b (el peor, { $lit_1_71 } veces), y el tiempo de luz de la Tierra a Marte y a Júpiter. MODELLED, cada fila etiquetada: Urano y Neptuno a partir de la Tabla 1 ({ $lit_2_0 } y { $lit_5_2 } veces el error nominal frente a DE441), Plutón (la fila de 1992; sin error indicado), la Luna y las siete lunas (medidas frente a Horizons, sin cota publicada).

engine-kind-body-pnt-description = Posicionamiento alrededor de cualquier cuerpo del sistema solar: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo central elegido por nombre (Marte, la Luna, Europa, Ganímedes, Titán y el resto del catálogo del sistema solar), que navega con pseudodistancias unidireccionales de una pequeña constelación de navegación Walker alrededor del cuerpo (órbitas de dos cuerpos con la deriva secular J2 propia del cuerpo, un reloj de usuario desconocido) y, opcionalmente, una distancia bidireccional de espacio profundo sin reloj desde la Tierra, cuya dirección y distancia proceden de la efeméride analítica del sistema solar en cada época. Las líneas de visión quedan bloqueadas por la esfera media del cuerpo, y un usuario en superficie necesita además la máscara de elevación. Por época: relés a la vista, si la Tierra está sobre el limbo, el GDOP y PDOP solo de la constelación (dilución de la precisión geométrica y de posición), la incertidumbre formal de posición de una sigma con y sin la fila de la Tierra, y el error de una solución de mínimos cuadrados de Gauss-Newton con semilla de cada modo; sobre la ejecución: disponibilidad, visibilidad de la Tierra, PDOP mediano, error RMS y sigma formal mediana, además del tiempo de luz Tierra-cuerpo, la ida y vuelta, el retardo de Shapiro y la separación del Sol en la época. MODELLED: las órbitas de los relés, los niveles de ruido y el modelo instantáneo de medición son decisiones de modelado, no comprobadas frente a datos de navegación de una misión; las constantes del cuerpo son los valores publicados citados en body.rs, y la geometría de la Tierra hereda las etiquetas de la efeméride del sistema solar.

engine-kind-constellation-design-description = Diseño de constelaciones a escala: patrones Walker DELTA y Walker STAR en la convención i: T/P/F (nodos repartidos sobre 360 o 180 deg, separación en el plano 360*P/T, desfase de fase entre planos 360*F/T), listas explícitas de elementos y diseños multicapa, varias constelaciones en una ejecución, alrededor de la Tierra, la Luna, Marte o cualquier otro planeta, Plutón o luna principal usando las constantes del módulo body (las mismas que usan los tipos solar-system y body-pnt). PREAJUSTES a partir de elementos nominales publicados: gps-baseline y gps-expandable (las 24 ranuras y los seis pares expandibles delantero/trasero del GPS Standard Positioning Service Performance Standard, 5.ª edición 2020, Tablas 3.2-1 a 3.2-3), galileo (Walker 24/3/1 a 29 599.801 km y 56 deg, Galileo Open Service Service Definition Document edición 1.1 Tablas 1 y 23), beidou y beidou-meo (Walker 24/3/1 a 21 528 km y 55 deg más tres satélites geoestacionarios a 80, { $lit_110_5 } y 140 deg E y tres satélites geosíncronos inclinados a 55 deg, BeiDou Open Service Performance Standard 3.0 sección 4.1; la fase MEO y el cruce geosíncrono inclinado a 118 deg E se modelan porque el estándar no los indica) y glonass (24/3/1 a 19 100 km y { $lit_64_8 } deg a partir de la fórmula de ranuras del GLONASS Interface Control Document edición 5.1 sección 5.2). COBERTURA Y DILUCIÓN DE LA PRECISIÓN: sobre una cuadrícula de latitud/longitud y una ventana muestreada con una máscara de elevación, el número de satélites a la vista, GDOP, PDOP, HDOP y VDOP por celda, la disponibilidad (una solución con PDOP igual o inferior a un umbral, 6 por defecto) por celda, globalmente (ponderada por área) y en el peor emplazamiento, con un reloj de receptor por constelación salvo que clock = "common". Escala a miles de satélites: la visibilidad es un producto escalar frente al semiángulo de cobertura de cada satélite, y los satélites se agrupan por latitud subsatélite en cada época para que una fila de la cuadrícula pruebe solo los que pueden estar a la vista; el informe cuenta las pruebas de pares ahorradas. El JSON incluye los mapas de la cuadrícula y trazas en tierra submuestreadas por satélite. VALIDATED: el generador Walker frente a la Tabla 23 de Galileo OS SDD y la fórmula de ranuras del ICD de GLONASS, el preajuste de GPS frente a la columna publicada de cruce ecuatorial de la Tabla 3.2-1 de SPS PS, y la distribución global de HDOP de la línea base de GPS frente al Apéndice B de SPS PS (mediana { $lit_0_94 }, 95 % { $lit_1_25 }, media { $lit_0_96 }, tolerancia { $lit_0_03 }). MODELLED: órbitas de dos cuerpos con J2 secular opcional, un cuerpo esférico, solo visibilidad geométrica (sin potencia de señal, salud ni terreno), y la fase relativa entre sistemas distintos, que no es una instantánea de ninguna fecha real.

engine-kind-campaign-description = Campaña: tipos de escenario existentes compuestos en una sola ejecución, con cada cifra leída de una ejecución real del tipo nombrado. Cuatro secciones, en cualquier combinación. FASES: una misión encadenada sobre una cronología compartida -- cada fase ejecuta uno o más escenarios (por ejemplo jamming, luego spoofing, luego un reloj en holdover con un sistema de navegación inercial a la deriva a su lado, luego una alarma de integridad, luego la recuperación), sus salidas se leen en canales con nombre (error de tiempo del reloj frente a su guarda, razón de densidad portadora a ruido frente al umbral de seguimiento, nivel de protección frente al límite de alerta, error de posición, satélites en seguimiento, indicadores de alarma) mediante un preajuste por tipo o rutas de resultado explícitas, y se remuestrean sobre una cuadrícula común por retención de orden cero, con los límites de fase y los eventos; el estado se transmite mediante carry (un canal continúa desde el valor final de la fase anterior), handoff (un número de una fase anterior escrito en el escenario de esta fase) y end_at (una fase termina en un instante que calculó una ejecución, como el instante de detección de un monitor de spoofing). BARRIDO: una cuadrícula sobre una a tres claves con puntos de escenario de cualquier tipo (un segmento numérico entero indexa una matriz de tablas, como en system.2.sisre_m), con métricas leídas por ruta de resultado y, con más de una ejecución, un conjunto Monte Carlo con semilla en cada nodo. MONTE_CARLO: la realización k se ejecuta con base_seed + k; cada métrica notifica media, desviación típica, percentiles 5/50/95 de rango más cercano y un intervalo de confianza bootstrap del 95 % de la media con semilla fija. COMPOSE: varios escenarios con valores compartidos (la potencia y posición de un jammer escritas en un receptor marítimo y uno de carretera), con un resumen combinado de mejor/peor caso. El resultado incluye un hash de campaña, un resumen sobre cada resultado de miembro y una entrada de unidades para cada número emitido; las exportaciones de interoperabilidad escriben cada escenario miembro que tiene geometría como su propio conjunto de archivos. Se comprueban las identidades de composición: una campaña de una sola fase reproduce la ejecución independiente bit a bit, un conjunto con semilla fija es estable byte a byte y, en un reloj con ruido de frecuencia blanco, la media del conjunto cae dentro del intervalo notificado con la dispersión igual a sqrt(q_wf * tau). MODELLED: el acarreo aditivo y la retención de orden cero son decisiones de modelado, y cada fase lleva la etiqueta del tipo que la ejecutó.

engine-kind-leo-signal-description = Diseños de señal LEO-PNT: señales parametrizadas de posicionamiento, navegación y temporización (PNT) en órbita terrestre baja (LEO) para cualquier sistema, banda y estructura. Una SEÑAL es una banda (frecuencia central, ancho de banda de transmisión, asignación ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) y componentes (adquisición, datos, piloto; cualquier subconjunto), cada uno con una modulación (BPSK(n) con n fraccionario, BOC(m,n), MBOC(6,1,p) o una banda plana de tipo OFDM), un reparto de potencia, desplazamientos opcionales de subportadora FDMA, una longitud de código y una tasa de datos. Las señales proceden de archivos de preajuste públicos compilados (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; cada uno con su URL de origen y cada valor no publicado etiquetado REPRESENTATIVE) o se escriben en línea. POR SEÑAL: la densidad espectral de potencia limitada en banda y la fracción de la potencia de cada componente que deja pasar la banda de transmisión (forma cerrada de BPSK junto al valor numérico), el ancho de banda RMS (Gabor), la fluctuación térmica de seguimiento de código del lazo de enganche de retardo frente a C/N0 y separación early-late a partir de la fórmula early-late coherente (o no coherente) limitada en banda de Betz & Kolodziejski 2009 con su forma de manual de banda ilimitada y su cota de Gabor de separación nula, la exactitud de distancia en metros, el espacio de búsqueda de adquisición (intervalos Doppler desde el Doppler máximo de la órbita más los términos de oscilador y de usuario, por intervalos de código), la probabilidad de detección de ley cuadrática y el tiempo medio de adquisición serie y paralela de código, el coeficiente de separación espectral de la señal hacia GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b y E5 AltBOC y de cada una hacia la señal con la degradación de C/N0, y el J/S de CW, de banda ancha y ajustado que tolera el componente seguido, a partir de la propia maquinaria SSC del tipo spectrum. UN CONTRASTE DE BANDAS: retardo ionosférico de primer orden ({ $lit_40_3 } TEC/f^2), pérdida en espacio libre, exactitud de distancia con igual C/N0 y con igual EIRP, y tolerancia a jammers. Las COMPROBACIONES DE FORMA opcionales contrastan el espectro de un diseño con una medición descrita (coherencia MODELLED). VALIDATED: las formas cerradas de potencia en banda de BPSK ({ $lit_90_3 } % en el lóbulo principal) y de ancho de banda de Gabor, la fluctuación limitada en banda que se reduce a la forma early-late coherente de los manuales y a su cota de Gabor, el coeficiente de separación espectral de BPSK desplazado frente a su forma cerrada de Parseval, el área unidad del espectro AltBOC y el Doppler máximo LEO frente a las cifras publicadas de Xona Pulsar (32-34 kHz) e Iridium (36 kHz). MODELLED: cada diseño, reparto de potencia, C/N0 y nivel de jammer; los espectros EFQPSK, CSK y OFDM son aproximados.

engine-kind-leo-pass-description = Paso LEO y presupuesto de enlace, banda por banda, para LEO-PNT (posicionamiento, navegación y temporización desde órbita terrestre baja), independiente del sistema: un usuario (terrestre, marítimo, aéreo o interior, estático o en movimiento) y uno o más satélites LEO a partir de un PASO DISEÑADO (una órbita circular colocada de modo que el usuario vea un paso de una elevación máxima elegida en un instante elegido, heliosíncrona si se pide), ELEMENTOS explícitos, un TLE (conjunto de elementos de dos líneas) mediante el SGP4 del motor, o una constelación WALKER construida con el código de diseño de constelaciones (se notifican los pasos más altos). Las bandas proceden de un preajuste con nombre (genérico multibanda UHF/L/S/C, banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como señal de oportunidad solo Doppler, CentiSpace y un preajuste opcional Celeste IOD marcado WORKSHOP) o se escriben en el escenario; cada preajuste indica si sus cifras son PUBLIC (con URL), REPRESENTATIVE o WORKSHOP. Por satélite, banda y época: elevación, acimut, distancia, velocidad de distancia y aceleración de distancia; pérdida en espacio libre; EIRP y ganancia del diagrama del satélite (isoflujo, haz gaussiano o plano); ganancia de la antena del usuario frente a la elevación (parche, hemisférica o isótropa); atenuación gaseosa (ITU-R P.676-10 Anexo 2), atenuación por lluvia (coeficientes ITU-R P.838-3 y procedimiento P.618-14, a partir de una intensidad y una altura de lluvia), centelleo troposférico (ITU-R P.618-14 sección 2.4.1), pérdida de penetración en edificios para un usuario en interior (ITU-R P.2109-2), desadaptación de polarización, temperatura de ruido del sistema y C/N0 (densidad de portadora a ruido); Doppler y tasa Doppler en forma cerrada a partir de la velocidad y la aceleración de distancia, cada uno verificado frente a diferencias centrales; el retardo ionosférico de primer orden { $lit_40_3 } STEC/f^2 a partir de un TEC oblicuo de Klobuchar o de TEC vertical, escalado a la parte de la ionosfera por debajo del satélite. Los pares de bandas obtienen los coeficientes libres de ionosfera, la amplificación de ruido y el ruido de código en el pico del paso. Los satélites GNSS MEO (preajustes de Galileo o GPS) se evalúan con el mismo modelo de antena y de ruido a partir de las potencias recibidas de sus documentos de interfaz, de modo que el paso LEO en forma de campana y las portadoras GNSS planas comparten un mismo gráfico. Una sección opcional [iot] da el tiempo hasta la primera solución, la energía por solución y la vida de la batería frente al ciclo de trabajo para un presupuesto de potencia de receptor indicado (MODELLED). Cada par de bandas da también el TEC oblicuo que recupera su combinación libre de geometría en el pico y la sigma de ruido de código de esa estimación (sondeo de la ionosfera). Una sección opcional [spoofer] falsifica las señales de una posición declarada que salta o es empujada desde la verdadera tras un inicio y ejecuta dos monitores con probabilidades de falsa alarma y de detección fallida indicadas: coherencia de Doppler y de geometría del paso (velocidades de distancia medidas frente a las previstas a partir de las órbitas y de una posición y velocidad previas independientes, una prueba chi-cuadrado de mínimos cuadrados generalizados sobre una ventana, en los canales GNSS, LEO y todos) y coherencia entre bandas (el paso de época a época de la combinación libre de geometría con modelo corregido de cada par de bandas LEO), notificando estadísticos por época y cuándo detecta cada monitor (MODELLED). Componentes VALIDATED: la pérdida en espacio libre, los coeficientes de P.838-3 frente a su Tabla 5, los procedimientos de lluvia y centelleo de P.618-14 y la pérdida de penetración en edificios de P.2109 frente a los ejemplos de validación del Grupo de Estudio 3 de ITU-R, la razón de retardo de grupo L1/L2 de IS-GPS-200, y el Doppler máximo de un usuario estático en una órbita circular frente a la Tabla 1 de arXiv 2509.19551. MODELLED: las EIRP, los diagramas, la fracción de Chapman del TEC por debajo del satélite y todo el paso.

engine-kind-leo-navmsg-description = Mensaje de navegación LEO: la efeméride y el reloj difundidos de un satélite de posicionamiento, navegación y temporización en órbita terrestre baja (LEO), para cualquier órbita, portadora y modelo, con preajustes con nombre opcionales (Xona Pulsar, Iridium, Starlink, CentiSpace, un sistema representativo de banda C, el modelo de reloj cero ATOMIC, Celeste IOD). CONTENIDO: datos auxiliares (SVID, número de emisión de datos, banda, salud de la señal), sincronización (semana, tiempo de la semana, un polinomio de reloj de segundo orden af0-af2 alrededor de toc), efeméride en uno de cuatro modelos -- el conjunto kepleriano de 16 parámetros de Galileo OS SIS ICD; ese conjunto más polinomios de corrección a lo largo de la traza, transversal y radial; el modelo de 22 parámetros de Liu et al. 2025; un polinomio ECEF sin términos de reloj (ATOMIC de reloj cero) -- y otros servicios (un conjunto de difusión de Klobuchar, NeQuick-G ai0-ai2 con el nivel efectivo de ionización, y parámetros de tiempo del sistema a UTC con la lógica de segundo intercalar del ICD). AJUSTADOR: una órbita verdadera integrada con gravedad zonal J2-J6 o EGM2008 hasta el grado elegido y arrastre, y un reloj libre o gobernado con semilla; ajuste de Levenberg-Marquardt del conjunto kepleriano sobre elementos no singulares, y luego polinomios de corrección por mínimos cuadrados lineales; reloj ajustado descontando el término relativista que añade el usuario. ANÁLISIS: fit-interval-trade (error de distancia de la señal en el espacio, SISRE, con ponderaciones de promedio global para la altitud orbital, frente al intervalo de ajuste y el periodo de actualización, solo órbita y con reloj), model-comparison (cuatro modelos, número de parámetros, bits codificados y el ajuste de Kshana a las altitudes de Liu et al. junto a las cifras publicadas), midpass-update (el paso más alto sobre un usuario, el salto de posición, de reloj y de distancia de usuario en cada cambio de mensaje, el salto con peor geometría, CORRECTO/FALLO frente a un umbral de continuidad), encode-decode (la trama binaria documentada propia de Kshana con CRC-24Q, un presupuesto de cuantización de medio paso por campo, una comprobación de trama corrupta, una exportación e importación de registros de estilo RINEX-4 etiquetada como extensión de Kshana y una tabla CSV). VALIDATED: las ponderaciones SISRE frente a la tabla publicada de MEO/GEO (Montenbruck et al. 2018); el algoritmo de usuario de Galileo frente a RTKLIB sobre efemérides de difusión reales de Galileo; CRC-24Q frente a su valor de comprobación del catálogo y la trama de ejemplo RTCM 1005. MODELLED: cada cifra de ajuste y de SISRE es error de representación frente a una verdad integrada por Kshana (sin error de determinación ni de predicción de órbita); la comparación con Liu et al. usa órbitas distintas; los formatos de codificación y de texto son propios de Kshana.

engine-kind-leo-pvt-description = Posicionamiento, navegación y temporización (PNT) fusionado de órbita terrestre media (MEO) y baja (LEO) sobre CUALQUIER constelación: cada [[system]] es un preajuste GNSS del tipo constellation-design, un preajuste LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, el modelo de efemérides de reloj cero atomic, u otro archivo de preajuste, cada uno en su propio archivo con sus fuentes marcadas PUBLIC, WORKSHOP o DERIVED), capas Walker o conjuntos explícitos de elementos, con una portadora, una tasa de chip, una envolvente de densidad de portadora a ruido (C/N0) desde la máscara de elevación hasta el cenit, un error de distancia de la señal en el espacio (SISRE), una sigma Doppler y un modelo de reloj (su propio reloj de receptor, de modo que se estima el sesgo entre sistemas, o un desfase de difusión conocido). Cuatro modos. DOPPLER: posicionamiento por lotes de Gauss-Newton a partir de la velocidad de distancia con derivadas parciales analíticas, estados de deriva de reloj y de velocidad opcionales y una restricción de altura opcional, con uno o varios satélites, el error frente a la longitud de la ventana, la envolvente de Doppler, tasa Doppler y sacudida de cada sistema LEO, y la exactitud de un solo paso a lo largo de la traza y transversal frente al desplazamiento transversal (el error transversal crece sin límite a medida que el paso se hace cenital; un solo paso tiene además una solución especular respecto de la traza en tierra). Aquí se ejecuta una señal de oportunidad solo Doppler (starlink-sop). JOINT: soluciones de pseudodistancia de mínimos cuadrados ponderados por época solo con GNSS, solo con LEO y con ambos, sigmas por medición a partir de un modelo de ruido térmico del lazo de enganche de retardo a C/N0 más el SISRE (o una sigma fija, para que un modelo de señal pueda alimentarlas), los sesgos entre sistemas estimados y PDOP/HDOP/VDOP frente al número de satélites LEO añadidos. POLAR: satélites a la vista y DOP frente a la latitud para GNSS, LEO y ambos. TIMING: transferencia de tiempo al Tiempo Universal Coordinado (UTC) desde satélites LEO en una posición conocida con un filtro de reloj de dos estados cuyo ruido de proceso procede de las clases de oscilador del motor, frente a C/N0 y al oscilador, y la expresión de IS-GPS-200 del tiempo del sistema a UTC; con [timing] trace = true cada fila notifica además su error de tiempo y su sigma prevista en cada época. VALIDATED: el mayor Doppler de un paso del cenit al horizonte frente a las cifras publicadas de Iridium (hasta 36 kHz) y Xona Pulsar X1 (32 a 34 kHz). MODELLED: todo lo demás; el DOP se verifica frente a un caso derivado a mano, las soluciones frente a su covarianza y el modelo Doppler frente a la identidad de la aceleración de distancia.

engine-kind-leo-ppp-description = Convergencia del posicionamiento de punto preciso (PPP) solo con GNSS y con aumentación LEO: un filtro de Kalman extendido flotante sobre código y fase de portadora libres de ionosfera con las coordenadas estáticas de la estación, un reloj de receptor blanco, un sesgo entre sistemas por cada sistema adicional, un retardo cenital húmedo de paseo aleatorio proyectado por 1/sin(elevación) y una ambigüedad flotante por arco de satélite; el error de órbita y reloj precisos es blanco y común al código y a la fase de un satélite, de modo que cada satélite es una actualización correlacionada de dos filas en forma estabilizada de Joseph. Las mediciones se simulan con el mismo modelo con ruido con semilla sobre varios emplazamientos y semillas, y cada caso (primero solo GNSS, luego cada [[case]] de sistemas LEO, cualquier constelación o preajuste) notifica el tiempo mediano de convergencia (la primera época tras la cual los errores horizontal y vertical permanecen por debajo de los umbrales, 10 cm por defecto), la fracción convergida, las curvas de error medianas y la consistencia del filtro (el NEES de posición promediado sobre la ejecución frente a la banda chi-cuadrado bilateral del 95 %). Opcionalmente junto a las cifras publicadas de latitudes medias de Li et al. (2019, J. Geod. 93:749, doi 10.1007/s00190-018-1195-2): { $lit_9_6 } min para multi-GNSS reducidos a { $lit_7_0 }, { $lit_3_2 }, { $lit_2_1 } y { $lit_1_3 } min con 60, 96, 192 y 288 satélites LEO. MODELLED: una comparación de consistencia de la tendencia, no una reproducción de las constelaciones, el ruido ni las estaciones de ese estudio; sin resolución de ambigüedades, saltos de ciclo, enrollamiento de fase, mareas ni errores de producto correlacionados en el tiempo.

engine-kind-ntn-positioning-description = Posicionamiento a partir de un enlace descendente de una red no terrestre (NTN) 5G en la banda S del servicio móvil por satélite (MSS) (banda 3GPP n256, enlace descendente de 2170 a 2200 MHz; portadora por defecto { $lit_2172_5 } MHz): la cota de Cramér-Rao (CRB) sobre el tiempo de llegada, c / (2 pi beta sqrt(2 (C/N0) T)) con beta el ancho de banda cuadrático medio (Gabor) del espectro OFDM plano (B/sqrt(12)), y sobre el Doppler de un tono complejo, sqrt(3 / (2 pi^2 (C/N0) T^3)), para cada señal (por defecto un canal New Radio de 5 MHz con { $lit_4_5 } MHz ocupados y un canal de banda estrecha de 200 kHz con 180 kHz ocupados); luego, sobre cualquier constelación LEO, soluciones de tiempo de llegada del enlace descendente con un reloj de receptor desconocido (con semilla, con la cota más un error de sincronización de red como sigma), su PDOP y su sigma 3D formal, y una solución Doppler de un solo satélite sobre el paso más largo con la altura fija. MODELLED: el paso de ancho de banda a cota es la forma cerrada de los manuales, verificada frente a la integración numérica de los espectros BPSK plano y limitado en banda (coherencia interna, sin cifra publicada resuelta fijada), y la exactitud de posicionamiento es una cota sobre un canal sin multitrayecto con un error de sincronización indicado, no un resultado alcanzado.

engine-kind-leo-pnt-chain-description = Un sistema LEO-PNT (posicionamiento, navegación y temporización desde órbita terrestre baja) de extremo a extremo, para cualquier constelación y señal: el diseño leo-signal nombrado por signal_design (un preajuste público o un diseño [signal] en línea) fija el centro, el ancho de banda, la tasa de chip y el reparto de EIRP de una banda de [pass], el presupuesto de enlace leo-pass da el C/N0 seguido y la fluctuación de código limitada en banda durante el paso, una línea de C/N0 en sin(elevación) y el SISRE difundido del mensaje [navmsg] (ajustado a la altitud del satélite del paso) alimentan todos los sistemas LEO de la solución conjunta leo-pvt de [fusion] y, opcionalmente, los casos leo-ppp de [ppp]; cada traspaso se enumera con su valor y su unidad. MODELLED.

engine-kind-contact-schedule-description = Planificación de contactos con tierra para varios satélites sobre varias estaciones: ventanas de acceso aparentes (SGP4, marco terrestre IAU 2006/2000A, refracción ITU-R P.834, tiempo de luz), el volumen de datos ACM DVB-S2 de cada paso (umbrales de la Tabla 13 de ETSI EN 302 307-1) y un calendario sin conflictos (un satélite por antena con un tiempo de reorientación, una estación por satélite, entrega ponderada por prioridad limitada a cada acumulación pendiente) mediante un voraz de valor marginal, una línea base de primero en llegar y una ramificación y acotación exacta en conjuntos pequeños, con la brecha de optimalidad del voraz. MODELLED.

engine-kind-acm-link-description = Un satélite sobre una estación: la distancia oblicua, la elevación y la Es/N0 de cada paso a lo largo del paso, el MODCOD DVB-S2 elegido en cada instante (umbrales de la Tabla 13 de ETSI EN 302 307-1 más un margen de implementación) y el volumen de datos que mueve ACM frente a la línea base de codificación constante que cierra en la máscara. MODELLED.

engine-kind-aocs-description = Control de actitud de una nave espacial: una maniobra de apuntamiento inercial de un cuerpo rígido con tres o más ruedas de reacción equilibradas bajo realimentación MRP (L = -K sigma - P omega), pares de rueda de norma mínima recortados al límite de cada motor, RK4 con retención de orden cero; opcionalmente cerrado sobre un EKF multiplicativo a partir de un giroscopio simulado (paseo aleatorio de ángulo y de velocidad) y un seguidor estelar. Notifica el tiempo de establecimiento, el error de apuntamiento final y máximo, la velocidad y el par máximos de rueda, la fracción saturada, la deriva del momento angular y, con el estimador, su error de actitud y NEES. El lazo de estado verdadero es VALIDATED frente a Basilisk 2.9.1; el estimador es MODELLED.

engine-kind-entry-heating-description = Entrada atmosférica de masa puntual de 3 grados de libertad sobre una Tierra o un Marte esféricos en rotación (balística o con sustentación a alabeo constante), RK4, a través de US76, una atmósfera exponencial o la atmósfera de Marte, con calentamiento convectivo en el punto de estancamiento de Sutton-Graves (NASA TR R-376): desaceleración, flujo de calor y presión dinámica máximos, carga térmica, alcance en tierra, una comprobación de energía en marco rotatorio y, a su lado, la forma cerrada de Allen-Eggers. La desaceleración máxima se contrasta con el valor nominal publicado de Stardust; el calentamiento es MODELLED.

engine-kind-eo-radiometry-description = Radiometría y calidad de imagen de un generador de imágenes en el nadir: radiancia en la apertura de una escena lambertiana, la ecuación de la cámara, señal y ruido de disparo/oscuridad/lectura/cuantización y SNR; la MTF del sistema en Nyquist (difracción x detector x barrido x vibración), la respuesta relativa de borde derivada de ella, Q = lambda F/p y el NIIRS de GIQE versión 4 sin compensación de MTF. MODELLED.

engine-kind-ascent-losses-description = Ascenso plano por viraje gravitatorio de un vehículo multietapa sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. 1976 (ascenso vertical, patada de cabeceo, empuje a lo largo de la velocidad), integrando las pérdidas por gravedad, arrastre, guiado y contrapresión y comprobando que el dv ideal menos las pérdidas coincide con la velocidad de agotamiento; max-Q, aceleración máxima y estado de agotamiento. MODELLED.

engine-kind-time-transfer-budget-description = Transferencia bidireccional de tiempo y frecuencia por satélite entre dos estaciones a través de un relé geoestacionario: la ecuación bidireccional resuelta para T_A - T_B con cada término no recíproco (retardos de los equipos de estación, ionosfera en banda Ku, transpondedor, Sagnac), un presupuesto de incertidumbre en cuadratura cuyo término de tipo A es la TDEV del enlace simulado al tiempo de promediado, un enlace simulado con ruido de fase blanco y de flicker y una no reciprocidad diurna, y la estabilidad (tasa, RMS residual, TDEV, ADEV) de cualquier serie suministrada de la Sección 1 de BIPM Circular T, CSV MJD,ns o registros de reloj de estación IGS RINEX. MODELLED.

engine-kind-optical-atmosphere-description = PNT óptico MODELLED a través de la atmósfera: para un enlace óptico y un conjunto de emplazamientos en tierra con climas de nubosidad indicados, notifica la pérdida de aire despejado dependiente de la longitud de onda y de la elevación (ley de visibilidad de Kim más Rayleigh), el estado de turbulencia de Hufnagel-Valley (varianza de Rytov, índice de centelleo, parámetros gamma-gamma, promediado de apertura), la disponibilidad dependiente del tiempo meteorológico frente al margen del enlace (profundidad óptica de las nubes a partir de una climatología log-normal de agua líquida, extinción de óptica geométrica, desvanecimiento por turbulencia independiente), el margen de enlace necesario para disponibilidades objetivo, la distribución de duraciones de interrupción, el crecimiento del error de temporización y de distancia por interrupción mediante el modelo de holdover del reloj, la disponibilidad de diversidad de emplazamientos correlacionada con la distancia y las ganancias hipotéticas de las técnicas de mejora (longitud de onda, apertura de recepción, reducción del centelleo con óptica adaptativa, margen adicional). VALIDATED como implementación de las fórmulas indicadas frente a una referencia independiente de mpmath: varianza de Rytov, índice de centelleo, probabilidad de desvanecimiento gamma-gamma, factor de promediado de apertura, profundidad óptica de nubes y de aire despejado. MODELLED: toda entrada meteorológica, de técnica y de reloj y los supuestos de independencia y de cópula; no se ha comparado ningún registro medido de disponibilidad. Análisis consultivo, no un producto certificado de disponibilidad ni de navegación.

engine-kind-holdover-test-description = Prueba de holdover MODELLED de un sistema de temporización, puntuada a partir de un registro de error de tiempo que SUMINISTRA EL OPERADOR (un registro de linuxptp ptp4l, phc2sys o ts2phc, un registro de seguimiento o de estadísticas de chrony, un registro de reloj TICC, TimeLab o RINEX, o pares time_s,time_error_ns). La prueba tiene cuatro pasos y Kshana no realiza ninguno de ellos: una LÍNEA BASE enganchada, GNSS RETIRADO por el operador (el cable de antena o la salida del simulador; Kshana no transmite ni acciona nada) en un instante indicado, HOLDOVER con el oscilador propio del sistema y RECUPERACIÓN después de que el operador restablezca GNSS en un segundo instante indicado. El registro se divide en esos dos instantes. Línea base: estadísticos de error de tiempo y las máscaras ITU-T escritas para un reloj enganchado. Holdover: estadísticos, el desfase fraccional de frecuencia que mantuvo el sistema (una recta de mínimos cuadrados), las máscaras escritas para holdover o para un reloj autónomo, la envolvente de holdover ePRTC-A a partir de la duración de enganche indicada y el tiempo hasta superar cada presupuesto de error de tiempo. Recuperación: si |TE| entró dentro de una banda indicada y permaneció en ella, y cuándo, el pico y el mayor escalón. Cada límite se transcribe de una tabla pública de la ITU-T (las máscaras de telecom-timing); las palabras son 'medido frente a la máscara', y los dos instantes son una declaración del operador, no verificada. Un registro demasiado corto para una máscara es INCOMPLETE, nunca se extrapola. Véase docs/TIMING-HIL.md.

engine-kind-gnss-ssv-description = Disponibilidad de GNSS y potencia de enlace MODELLED en el Volumen de Servicio Espacial y más allá: para un usuario sobre una esfera (la capa global del folleto del ICG) o sobre una trayectoria kepleriana (de LEO a transferencia lunar) cuenta, por constelación (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) y para todas juntas, las señales utilizables por encima de un umbral de C/N0 - disponibilidad de al menos una y de cuatro señales, duración máxima de interrupción, C/N0 recibido, dilución de la precisión, enlaces de lóbulo principal frente a lóbulos laterales - con un diagrama de transmisión del folleto, paramétrico o suministrado por el usuario, efectos opcionales de ionosfera de rayo rasante, plasmasfera y atmósfera y un diseño opcional de receptor de señal débil; también un filtro de Kalman extendido GNSS a bordo para naves HEO y de transferencia lunar (dinámica orbital, presión de radiación solar, terceros cuerpos, reloj) y la navegación relativa de una formación de varias naves mediante pseudodistancias de diferencia simple. Contrastado con las tablas del folleto ICG SSV bajo un preregistro (xval/gnss-ssv)

engine-bench-site-title-a = Tarea (a): detección en registros de receptor

engine-bench-site-title-b = Tarea (b): detección en IQ

engine-bench-site-title-c = Tarea (c): predicción de holdover de temporización

engine-bench-site-title-d = Tarea (d): brecha de optimismo fuera de distribución

engine-bench-site-col-rmse-3600 = RMSE 3600 s (ns)

engine-bench-site-col-rmse-300 = RMSE 300 s (ns)

engine-bench-site-col-rmse-7200 = RMSE 7200 s (ns)

engine-bench-site-col-auc-in = AUC dentro

engine-bench-site-col-auc-out = AUC fuera

engine-bench-site-col-optimism-gap = Brecha de optimismo

engine-bench-site-col-flag = Indicador

engine-bench-site-col-auc = AUC

engine-bench-site-col-pd-at-pfa-cap = P_d en el tope de P_fa (cota superior)

engine-bench-site-flag-optimistic = optimista

engine-bench-site-flag-within-tolerance = dentro de la tolerancia

engine-bench-site-not-available = n/d

engine-bench-site-none-published = Aún no se han publicado resultados. Una fila aparece aquí solo cuando se puntúa y se añade un archivo de resultados; nada de esta página es una estimación.

engine-bench-site-none-for-task = Aún no hay resultados para esta tarea.

engine-bench-site-region-label = Resultados de { $title } { $split }

engine-bench-site-caption-split = Partición: { $split }

engine-bench-site-th-system = Sistema

engine-bench-site-th-provenance = Procedencia

engine-bench-site-th-truth-sha256 = SHA-256 de la verdad de referencia

engine-bench-site-provenance-carried = heredada: { $note }

engine-bench-site-provenance-scored = puntuada

engine-bench-site-heading = Clasificación de kshana-bench

engine-bench-site-lede = Archivos de resultados puntuados según <code>{ $spec }</code>. Una fila indica que este archivo obtuvo esta puntuación en esta partición. No significa que nadie haya calificado ni aprobado ningún producto, y no se nombra a ninguna organización como respaldo.

engine-bench-site-foot = Toda puntuación es modelada, salvo que una fila indique que una referencia externa coincidió. Licencia de la especificación y de los manifiestos: CC-BY-4.0 / CC0 propuestas, pendiente de decisión del titular. El conjunto reservado de datos reales no es secreto: véase la especificación, sección 4.

engine-bench-site-meta-description = Puntuaciones de los archivos de resultados enviados a kshana-bench { $spec }. Solo orientativo.

engine-iq-campaign-report-roc-heading = ROC de detección

engine-iq-campaign-report-roc-note = <p class="note">Etiquetado <b>{ $label }</b>. Cada ventana de evento indicada es un positivo y cada ventana de la longitud configurada fuera de los eventos es un negativo. Una ventana cuenta en un umbral cuando el estadístico de prueba propio del monitor lo alcanza dentro de ella. P<sub>fa</sub> se expresa por ventana negativa, no por prueba. Las mismas cifras están en <code>roc.json</code>.</p>

engine-iq-campaign-report-th-alarm-kind = Tipo de alarma

engine-iq-campaign-report-th-positives = Positivos

engine-iq-campaign-report-th-negatives = Negativos

engine-iq-campaign-report-th-auc = AUC

engine-iq-campaign-report-th-threshold = Umbral

engine-iq-campaign-report-th-pd-at-it = P<sub>d</sub> en él

engine-iq-campaign-report-th-pfa-at-it = P<sub>fa</sub> en él

engine-iq-campaign-report-title = Campaña { $name }

engine-iq-campaign-report-heading = Campaña de reproducción en laboratorio: { $name }

engine-iq-campaign-report-meta = Clase de datos <b>{ $data_class }</b> · Kshana { $engine } · { $n_recordings } grabación(es) × { $n_frontends } front end(s) × { $n_designs } diseño(s) = { $n_cells } celdas, { $n_done } terminadas · resumen <code>{ $digest }</code>

engine-iq-campaign-report-digest-incomplete = (incompleto: no todas las celdas están terminadas)

engine-iq-campaign-report-reference-note = <p class="note">Los valores medidos proceden del seguimiento de las grabaciones. Las líneas discontinuas etiquetadas <b>{ $label }</b> son la referencia analítica de separación espectral <code>{ $formula }</code> con el J/S indicado por el laboratorio, con Q según el tipo de interferencia indicado. Son un modelo de la condición indicada, no una medición ni una simulación de la interferencia.</p>

engine-iq-campaign-report-summary-heading = Resumen

engine-iq-campaign-report-th-recording = Grabación

engine-iq-campaign-report-th-front-end = Front end

engine-iq-campaign-report-th-design = Diseño

engine-iq-campaign-report-th-satellites = Satélites

engine-iq-campaign-report-th-mean-availability = Disponibilidad media

engine-iq-campaign-report-th-events-lost = Eventos perdidos

engine-iq-campaign-report-th-median-reacq = Readq. mediana (s)

engine-iq-campaign-report-th-pass = Pasa

engine-iq-campaign-report-th-fail = Falla

engine-iq-campaign-report-degradation-heading = Degradación de C/N0 frente al J/S indicado

engine-iq-campaign-report-scorecard-heading = Tabla de puntuación

engine-iq-campaign-report-scorecard-note-nwpr = <p class="meta">Las mismas filas que <code>scorecard.csv</code>. La readquisición se mide desde el desfase del evento; la interrupción se mide desde la pérdida de enganche. La columna de C/N0 y las curvas de degradación usan la estimación NWPR (lee por debajo unos 8 dB · Bn·T bajo la fluctuación propia del bucle, de modo que sus lecturas dependen del diseño del bucle); ambas estimaciones están en <code>scorecard.json</code>.</p>

engine-iq-campaign-report-scorecard-note-m2m4 = <p class="meta">Las mismas filas que <code>scorecard.csv</code>. La readquisición se mide desde el desfase del evento; la interrupción se mide desde la pérdida de enganche. La columna de C/N0 y las curvas de degradación usan la estimación M2M4 (insensible a la fluctuación propia del bucle); ambas estimaciones están en <code>scorecard.json</code>.</p>

engine-iq-campaign-report-th-sat = Sat

engine-iq-campaign-report-th-scope = Ámbito

engine-iq-campaign-report-th-event = Evento

engine-iq-campaign-report-th-avail = Disp.

engine-iq-campaign-report-th-loss = Pérdida (s)

engine-iq-campaign-report-th-js-at-loss = J/S en la pérdida

engine-iq-campaign-report-th-reacq = Readq. (s)

engine-iq-campaign-report-th-outage = Interrupción (s)

engine-iq-campaign-report-th-cn0 = C/N0

engine-iq-campaign-report-th-pll = PLL σ (°)

engine-iq-campaign-report-th-dll = DLL σ (chip)

engine-iq-campaign-report-th-false-locks = Falsos enganches

engine-iq-campaign-report-th-verdict = Veredicto

engine-iq-campaign-report-scope-run = ejecución

engine-iq-campaign-report-scope-event = evento

engine-leo-fusion-ppp-chart-n-leo = { $n } LEO

engine-lunar-beacon-chart-pdop = PDOP { $pdop }

engine-lunar-frame-realise-chart-tx = tx (m)

engine-lunar-frame-realise-chart-ty = ty (m)

engine-lunar-frame-realise-chart-tz = tz (m)

engine-lunar-frame-realise-chart-theta-x = θx (µrad)

engine-lunar-frame-realise-chart-theta-y = θy (µrad)

engine-lunar-frame-realise-chart-theta-z = θz (µrad)

engine-lunar-interop-chart-ok = OK

engine-lunar-jamming-chart-y-title = J/S (dB)

engine-lunar-jamming-chart-degraded = DEGRADED

engine-lunar-jamming-chart-lost = LOST

engine-lunar-station-chart-zero-east = 0° E

engine-raim-chart-hal = HAL { $al } m

engine-raim-chart-val = VAL { $al } m

engine-resilience-report-title = Autoevaluación de resiliencia PNT

engine-resilience-report-status-partner = PARTNER

engine-resilience-report-summary = <p>Motor { $engine }, escenario { $scenario }, semilla { $seed }. Reparto de evidencias: { $n_validated } { $validated } / { $n_modelled } { $modelled } subpuntuaciones. Nivel RPCF provisional: { $level } ({ $level_basis }).</p>

engine-resilience-report-h-rpcf = Categorías de técnicas de DHS RPCF

engine-resilience-report-h-rdrr = Funciones de RethinkPNT

engine-resilience-report-h-yang = Criterios de Yang

engine-resilience-report-th-category = Categoría

engine-resilience-report-th-function = Función

engine-resilience-report-th-criterion = Criterio

engine-resilience-report-th-subscore = Subpuntuación

engine-resilience-report-th-status = Estado

engine-resilience-report-th-basis = Base

engine-resilience-report-integrity = <p>Integridad SHA-256: <code>{ $integrity }</code></p>

engine-study-summary = estudio "{ $title }": { $n_scenarios } escenarios

engine-study-metric-holdover = Holdover (s)

engine-study-metric-timing-rms = RMS de temporización (ns)

engine-study-metric-timing-p95 = p95 de temporización (ns)

engine-study-metric-resilience-slope = Pendiente de resiliencia (ns/s)

engine-study-metric-availability = Disponibilidad

engine-study-metric-integrity = Integridad

engine-study-metric-security = Seguridad

engine-study-th-metric = Métrica

engine-study-th-validation = Validación

engine-study-not-applicable-no-attack = n/d (sin ataque)

engine-study-page-title = { $title } — estudio de Kshana

engine-study-eyebrow = क्षण · el instante preciso

engine-study-h-comparison = Comparación lado a lado

engine-study-tier-note = Cada cifra de mérito se etiqueta como { $validated } (comprobada frente a una referencia externa independiente) o { $modelled } (de primeros principios, probada internamente), derivada de la matriz de verificación. Las columnas son escenarios independientes; los valores no se normalizan entre escenarios.

engine-study-footer = Generado por Kshana { $version } como estudio agregado de { $n_scenarios } escenarios. Cada escenario es reproducible a partir de su escenario + semilla + versión del motor. Libre y de código abierto (AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">código fuente y documentación</a>.

engine-telemetry-syslog-cef-gnss-trust = CEF:0|{ $cef_header_escape }|{ $cef_header_escape2 }|{ $cef_header_escape3 }|{ $EVENT_PREFIX }.{ $band }|GNSS trust { $band }|{ $cef_severity }|{ $ext }

engine-compliance-fw-dhs-rpcf-title = US DHS Resilient PNT Conformance Framework

engine-compliance-fw-imo-ships-title = Orientaciones de la OMI sobre la interferencia GNSS para buques

engine-compliance-fw-easa-aviation-title = Orientaciones de la EASA sobre la interferencia GNSS para la aviación

engine-compliance-fw-nis2-art21-title = Directiva NIS2 de la UE, artículo 21, medidas de gestión de riesgos

engine-compliance-fw-en-16803-title = EN 16803, posicionamiento basado en GNSS para ITS viarios

engine-compliance-fw-nist-ir-8323r1-title = NIST IR 8323r1, Perfil PNT fundamental

engine-compliance-source-dhs-rpcf-1-title = Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework

engine-compliance-source-dhs-rpcf-1-version = Versión 2.0, 26 de abril de 2022 (Dirección de Ciencia y Tecnología del DHS, con la CISA)

engine-compliance-source-dhs-rpcf-1-checked = documento leído íntegramente; no se obtuvo la página de presentación de la publicación

engine-compliance-source-imo-ships-1-title = Deliberate interference with the United States Global Positioning System and other global navigation satellite systems

engine-compliance-source-imo-ships-1-version = OMI MSC.1/Circ.1644, 18 de octubre de 2021

engine-compliance-source-imo-ships-1-checked = texto leído íntegramente en este espejo de terceros de la circular, no en el sitio de la OMI; consulte la biblioteca de documentos de la OMI para la copia de referencia

engine-compliance-source-imo-ships-2-title = Worldwide Radionavigation System

engine-compliance-source-imo-ships-2-version = Resolución A.1046(27) de la Asamblea de la OMI, adoptada el 30 de noviembre de 2011

engine-compliance-source-imo-ships-2-checked = documento leído íntegramente

engine-compliance-source-imo-ships-3-title = Performance standards for multi-system shipborne radionavigation receivers

engine-compliance-source-imo-ships-3-version = OMI MSC.401(95), adoptada el 8 de junio de 2015 (enmendada por MSC.432(98), 2017)

engine-compliance-source-imo-ships-3-checked = resolución original leída íntegramente; no se leyó el texto de la enmienda de 2017. No se encontró ninguna circular de la OMI sobre interferencia GNSS posterior a MSC.1/Circ.1644; consulte la biblioteca de documentos de la OMI por si hubiera otras más recientes

engine-compliance-source-easa-aviation-1-title = Global Navigation Satellite System Outage and Alterations Leading to Communication / Navigation / Surveillance Degradation

engine-compliance-source-easa-aviation-1-version = Boletín de información de seguridad de la EASA SIB 2022-02R4, publicado el 3 de julio de 2026, corregido el 22 de julio de 2026 (informativo, no obligatorio)

engine-compliance-source-easa-aviation-1-checked = revisión 4 leída íntegramente; las secciones se citan por encabezado porque el boletín no numera sus recomendaciones. Vuelto a comprobar el 2026-10-10: el PDF del boletín, la página de la herramienta AD de la EASA (que indica que no hay sustitución) y la página GNSS de la EASA no nombran ninguna revisión posterior ni ningún boletín con el número 2026-07; no se encontró un aviso que nombrara la Revisión 2 de SIB 2026-07, de modo que la cuestión sigue abierta y debe comprobarse en la página en vivo de la EASA. No se abrieron los Conflict Zone Information Bulletins

engine-compliance-source-nis2-art21-1-title = Directive (EU) 2022/2555 on measures for a high common level of cybersecurity across the Union (NIS 2 Directive)

engine-compliance-source-nis2-art21-1-version = DOUE L 333, 27.12.2022, pp. 80-152

engine-compliance-source-nis2-art21-1-checked = las letras de los apartados del artículo 21 se leyeron en un resumen de la página de EUR-Lex y coinciden con el texto publicado; confirme en la página antes de citar una letra en un escrito

engine-compliance-source-en-16803-1-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 1: Definitions and system engineering procedures for the establishment and assessment of performances

engine-compliance-source-en-16803-1-version = EN 16803-1:2020 (catálogo: válida desde el 2 de octubre de 2020, sustituye a la edición de 2016)

engine-compliance-source-en-16803-1-checked = solo el texto de alcance del catálogo; la norma es de pago y no se leyó

engine-compliance-source-en-16803-2-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 2: Assessment of basic performances of GNSS-based positioning terminals

engine-compliance-source-en-16803-2-version = EN 16803-2:2020 (catálogo: válida desde el 2 de octubre de 2020)

engine-compliance-source-en-16803-2-checked = solo el texto de alcance del catálogo; la norma es de pago y no se leyó

engine-compliance-source-en-16803-3-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 3: Assessment of security performances of GNSS-based positioning terminals

engine-compliance-source-en-16803-3-version = EN 16803-3:2020 (catálogo: válida desde el 2 de octubre de 2020)

engine-compliance-source-en-16803-3-checked = solo el texto de alcance del catálogo; la norma es de pago y no se leyó. El texto del catálogo nombra la cláusula 6 (señales grabadas frente a simuladas) y el Anexo A (una categorización de alto nivel de los ataques) y nada más por número; el catálogo no da el nombre de ningún comité, por lo que aquí no se indica ninguno

engine-compliance-source-nist-ir-8323r1-1-title = Foundational PNT Profile: Applying the Cybersecurity Framework for the Responsible Use of Positioning, Navigation, and Timing (PNT) Services

engine-compliance-source-nist-ir-8323r1-1-version = NIST IR 8323r1, enero de 2023 (informe interno del NIST)

engine-compliance-source-nist-ir-8323r1-1-checked = el PDF se obtuvo el 2026-10-18 (SHA-256 registrado en tests/fixtures/compliance/headings.json) y se leyeron sus tablas 3 a 25 del Perfil para las subcategorías citadas; no se leyeron las demás secciones, los apéndices ni la página de presentación de la publicación. Los identificadores de subcategoría siguen las tablas propias del Perfil, que usan identificadores del Cybersecurity Framework 1.1

engine-compliance-cap-receiver-log-trust-name = Evaluación de confianza del registro del receptor

engine-compliance-cap-receiver-log-trust-output = estado de confianza por época del propio registro de un receptor real, momentos de alarma y concordancia con los eventos indicados antes de la ejecución

engine-compliance-cap-jamming-effects-name = Efectos de jamming en el balance del enlace

engine-compliance-cap-jamming-effects-output = densidad de portadora a ruido y estado de enganche por satélite bajo una geometría de interferente indicada

engine-compliance-cap-spoofing-detection-name = Detección de spoofing y meaconing

engine-compliance-cap-spoofing-detection-output = decisiones del detector y discriminación del detector bajo un ataque de spoofing indicado

engine-compliance-cap-integrity-monitoring-name = Supervisión de integridad y niveles de protección

engine-compliance-cap-integrity-monitoring-output = niveles de protección, disponibilidad frente a los límites de alerta y resultados de detección de fallos

engine-compliance-cap-holdover-name = Holdover e inercia

engine-compliance-cap-holdover-output = crecimiento del error de posición o de tiempo mientras se deniega el GNSS, frente a un umbral indicado

engine-compliance-cap-source-diversity-name = Fuentes PNT alternativas y diversas

engine-compliance-cap-source-diversity-output = desempeño de navegación o temporización de fuentes independientes de la banda GNSS principal

engine-compliance-cap-resilience-scoring-name = Puntuación de resiliencia sobre conjuntos de amenazas

engine-compliance-cap-resilience-scoring-output = proporciones de supervivencia y resiliencia por vector de amenaza sobre un conjunto indicado, con los supuestos indicados

engine-compliance-cap-run-provenance-name = Procedencia reproducible de la ejecución

engine-compliance-cap-run-provenance-output = hash del escenario, versión del motor y semilla incluidos en cada resultado para poder repetir una ejecución

engine-compliance-req-dhs-s5-2-reference = Sección 5.2 (Prevent, Respond, Recover)

engine-compliance-req-dhs-s5-2-asks = La resiliencia se describe como tres funciones: prevenir el daño, responder (detectar, notificar, mitigar, contener) y recuperarse. La detección es probabilística, por lo que importan tanto las falsas alarmas como las detecciones perdidas.

engine-compliance-req-dhs-s5-2-gap = La prevención es una propiedad del diseño del producto que ninguna salida de simulación muestra. Las estadísticas de detección de una ejecución sintética o de una sola sesión no son una tasa medida de falsas alarmas ni de omisiones de un producto en servicio.

engine-compliance-req-dhs-l1-r1-reference = Nivel 1, requisito 1

engine-compliance-req-dhs-l1-r1-asks = Comprobar que los datos almacenados que llegan de fuentes externas coinciden con los formatos y los rangos de valores de las normas pertinentes.

engine-compliance-req-dhs-l1-r1-gap = Una propiedad de aseguramiento del software y de validación de entradas del producto sometido a prueba. Kshana no inspecciona el tratamiento de entradas de un producto.

engine-compliance-req-dhs-l1-r2-reference = Nivel 1, requisito 2

engine-compliance-req-dhs-l1-r2-asks = Permitir la recuperación manual completa borrando o restableciendo la memoria, devolviendo el sistema al desempeño definido una vez que la amenaza ha desaparecido.

engine-compliance-req-dhs-l1-r2-gap = Un registro de receptor muestra cuándo una posición dejó de ser de confianza y cuándo se recuperó; no muestra que un restablecimiento manual borre todos los estados almacenados.

engine-compliance-req-dhs-l1-r3-reference = Nivel 1, requisito 3

engine-compliance-req-dhs-l1-r3-asks = Recargar o actualizar el firmware de forma segura.

engine-compliance-req-dhs-l1-r3-gap = La seguridad de la actualización del firmware queda fuera de lo que observa cualquier salida de Kshana.

engine-compliance-req-dhs-l2-r4-reference = Nivel 2, requisito 4

engine-compliance-req-dhs-l2-r4-asks = Identificar las fuentes PNT comprometidas e impedir que corrompan la solución.

engine-compliance-req-dhs-l2-r4-gap = Kshana puntúa detectores y monitores que modela o que ejecuta sobre un registro; que funcione la exclusión de fuentes propia de un producto exige el estado interno del producto, no solo su registro.

engine-compliance-req-dhs-l2-r5-reference = Nivel 2, requisito 5

engine-compliance-req-dhs-l2-r5-asks = Recuperar las fuentes y el sistema automáticamente sin interrumpir la salida; durante la amenaza se sigue proporcionando una solución, con una degradación posiblemente sin cota.

engine-compliance-req-dhs-l2-r5-gap = Las ejecuciones de holdover acotan la deriva modelada para un modelo de reloj o inercial indicado, no el comportamiento de recuperación propio del producto.

engine-compliance-req-dhs-l3-r6-reference = Nivel 3, requisito 6

engine-compliance-req-dhs-l3-r6-asks = Los datos corruptos de una fuente no deben contaminar a otra fuente.

engine-compliance-req-dhs-l3-r6-gap = Kshana ejecuta las fuentes en paralelo; el aislamiento entre fuentes dentro de un producto exige una revisión del diseño o la inyección de fallos en el producto.

engine-compliance-req-dhs-l3-r7-reference = Nivel 3, requisito 7

engine-compliance-req-dhs-l3-r7-asks = Verificar de forma cruzada las soluciones de todas las fuentes y mantener acotada la degradación durante una amenaza.

engine-compliance-req-dhs-l3-r7-gap = La degradación acotada se muestra para los sensores modelados; la verificación cruzada propia del producto no se observa.

engine-compliance-req-dhs-l4-r8-reference = Nivel 4, requisito 8

engine-compliance-req-dhs-l4-r8-asks = Usar fuentes de tecnologías distintas frente a amenazas de modo común, sin degradación durante la amenaza.

engine-compliance-req-dhs-l4-r8-gap = Un argumento de modo común exige el conjunto de fuentes del producto real y una amenaza que las abarque; un escenario plantea una, no demuestra que el producto carezca de una debilidad compartida.

engine-compliance-req-dhs-s5-5-reference = Sección 5.5 (modo común)

engine-compliance-req-dhs-s5-5-asks = Los mecanismos diversos no deben compartir una debilidad: por ejemplo, un interferente que cubra dos bandas anula la diversidad de bandas.

engine-compliance-req-dhs-s5-5-gap = La puntuación usa un conjunto sintético de amenazas, indicado como tal; no son datos de campo.

engine-compliance-req-dhs-s8-1-8-3-reference = Secciones 8.1 a 8.3 (evaluación)

engine-compliance-req-dhs-s8-1-8-3-asks = La evaluación combina el análisis estático con el análisis dinámico, donde vectores de prueba sustituyen a las amenazas; las clases de prueba son fallo de fuente, interferencia y fallos internos. Los simuladores se nombran como método de prueba.

engine-compliance-req-dhs-s8-1-8-3-gap = El movimiento y los eventos exportados pueden alimentar un simulador de laboratorio (docs/TEST-BENCH.md). Kshana no genera ninguna señal, así que el simulador y su operador, con la debida autorización, aportan la amenaza.

engine-compliance-req-dhs-s8-6-reference = Sección 8.6 (elementos del plan de pruebas)

engine-compliance-req-dhs-s8-6-asks = Un plan de pruebas indica el nivel, el requisito, las entradas, las referencias, el acceso a datos necesario, el procedimiento con criterios de superación o fallo, los resultados y las notas.

engine-compliance-req-dhs-s8-6-gap = Los criterios de superación o fallo los elige el evaluador; Kshana registra las entradas, los umbrales y los hashes con los que ejecutó.

engine-compliance-req-imo-1644-3-reference = MSC.1/Circ.1644, párrafo 3

engine-compliance-req-imo-1644-3-asks = La interferencia deliberada del GNSS es un riesgo considerable para la seguridad de la navegación, las personas, los bienes y el medio ambiente.

engine-compliance-req-imo-1644-3-gap = Una declaración de riesgo; Kshana cuantifica efectos para una geometría indicada, no el riesgo en una zona marítima.

engine-compliance-req-imo-1644-5-reference = MSC.1/Circ.1644, párrafo 5

engine-compliance-req-imo-1644-5-asks = Se pide a los Estados Miembros que limiten la interferencia desde su territorio, que consideren avisos a los navegantes y que consideren medidas contra las transmisiones no autorizadas.

engine-compliance-req-imo-1644-5-gap = Dirigido a los Estados y las administraciones; ninguna salida de simulación lo aborda.

engine-compliance-req-imo-a1046-3-reference = Resolución A.1046(27), párrafo 3 del anexo (entradas a puertos, accesos a puertos y aguas costeras)

engine-compliance-req-imo-a1046-3-asks = Un sistema se considera disponible solo mientras ofrece la integridad indicada con la precisión indicada, actualizada a una frecuencia indicada, con una alerta de integridad dentro de un tiempo indicado.

engine-compliance-req-imo-a1046-3-gap = Kshana calcula niveles de protección y disponibilidad frente a un límite de alerta para una geometría modelada; los valores de precisión, disponibilidad y tiempo de alerta de la resolución no se afirman aquí.

engine-compliance-req-imo-a1046-2-reference = Resolución A.1046(27), párrafo 2 del anexo (aguas oceánicas)

engine-compliance-req-imo-a1046-2-asks = Requisitos de precisión, frecuencia de actualización, disponibilidad y alerta de integridad en la fase oceánica para el sistema de radionavegación.

engine-compliance-req-imo-a1046-2-gap = Como arriba para la fase oceánica.

engine-compliance-req-imo-401-3-1-reference = MSC.401(95), 3.1 a 3.2

engine-compliance-req-imo-401-3-1-asks = El receptor usa señales civiles de al menos dos sistemas independientes y entrega una solución de posición, velocidad y tiempo con la resiliencia y la integridad necesarias.

engine-compliance-req-imo-401-3-1-gap = La integridad multiconstelación se modela; el uso real de dos sistemas por parte del receptor es una prueba de producto.

engine-compliance-req-imo-401-3-11-reference = MSC.401(95), 3.11 a 3.14

engine-compliance-req-imo-401-3-11-asks = El receptor evalúa la precisión y la integridad por fase de navegación, emite una advertencia cuando no puede, avisa cuando no llega una nueva solución a tiempo y muestra el último valor plausible con un estado explícito.

engine-compliance-req-imo-401-3-11-gap = Kshana lee la temporización y la confianza de un registro; que los intervalos de advertencia y aviso mostrados coincidan con lo que exige la norma requiere la interfaz de usuario del receptor, que un registro no muestra.

engine-compliance-req-imo-401-3-16-reference = MSC.401(95), 3.15 a 3.16

engine-compliance-req-imo-401-3-16-asks = Mostrar el estado de la aumentación y la posición, el rumbo, la velocidad, la hora y las fuentes usadas.

engine-compliance-req-imo-401-3-16-gap = Requisitos de visualización; ninguna salida de Kshana los aborda.

engine-compliance-req-imo-401-4-2-reference = MSC.401(95), 4.2

engine-compliance-req-imo-401-4-2-asks = Funcionar de forma satisfactoria en condiciones normales de interferencia, de acuerdo con la resolución A.694(17) (requisitos generales para el equipo radioeléctrico de a bordo) y el entorno radioeléctrico típico a bordo y exterior. No es un requisito antijamming ni antispoofing.

engine-compliance-req-imo-401-4-2-gap = Las pruebas en condiciones normales de interferencia son una medición de laboratorio sobre el receptor; la resolución A.694(17) en sí no se leyó.

engine-compliance-req-easa-desc-reference = SIB 2022-02R4, Descripción

engine-compliance-req-easa-desc-asks = El spoofing es más difícil de detectar y más peligroso que el jamming; no hay ninguna alerta de cabina que distinga ambos; los efectos van desde falsas alertas de terreno hasta datos de vigilancia corruptos y pueden persistir tras salir de la zona.

engine-compliance-req-easa-desc-gap = Kshana modela los efectos del detector y del enlace; las alertas de cabina son una propiedad del equipo.

engine-compliance-req-easa-mfr-reference = SIB 2022-02R4, Recomendaciones: fabricantes de aeronaves y equipos, deberían

engine-compliance-req-easa-mfr-asks = Evaluar los efectos del jamming y del spoofing en el producto, incluidos los efectos acumulativos, y dar a los operadores orientaciones para detectar un presunto spoofing y sobre los límites de operación cuando se pierde el GNSS.

engine-compliance-req-easa-mfr-gap = La evaluación del producto en sí corresponde al fabricante; Kshana aporta un escenario repetible y un registro de receptor puntuado como evidencia en ella.

engine-compliance-req-easa-ops-spoof-reference = SIB 2022-02R4, Recomendaciones: operadores aéreos, deberían (spoofing)

engine-compliance-req-easa-ops-spoof-asks = Comparar la posición y la hora del GNSS con fuentes no GNSS y vigilar la cifra de incertidumbre de posición y las ayudas a la navegación para detectar el spoofing.

engine-compliance-req-easa-ops-spoof-gap = El procedimiento operativo y la formación quedan fuera de las salidas de simulación.

engine-compliance-req-easa-ansp-reference = SIB 2022-02R4, Recomendaciones: proveedores ATM/ANS, deberían; organizaciones que participan en el diseño o la producción de equipos ATM/ANS, deberían

engine-compliance-req-easa-ansp-asks = Evaluar el efecto de la pérdida de temporización GNSS en los sistemas de comunicación, navegación y vigilancia, mantener las ayudas a la navegación en tierra y ayudar a detectar la interferencia.

engine-compliance-req-easa-ansp-gap = Las ejecuciones de holdover de temporización abordan la evaluación de la pérdida de temporización; el diseño de los sistemas en tierra y los procedimientos no están cubiertos.

engine-compliance-req-easa-report-reference = SIB 2022-02R4, Recomendaciones: recordatorios finales sobre notificación

engine-compliance-req-easa-report-asks = Notificar los sucesos que afectan a la seguridad con arreglo al reglamento de notificación de sucesos, y notificar al fabricante el presunto spoofing y el jamming de mayor riesgo.

engine-compliance-req-easa-report-gap = Una obligación de notificación; ninguna salida la aborda.

engine-compliance-req-nis2-21-1-reference = Artículo 21, apartado 1

engine-compliance-req-nis2-21-1-asks = Adoptar medidas técnicas, operativas y organizativas proporcionadas para gestionar los riesgos para los sistemas de redes y de información, teniendo en cuenta el estado de la técnica, la exposición, el tamaño y la probabilidad y la gravedad de los incidentes.

engine-compliance-req-nis2-21-1-gap = Kshana aborda solo la dependencia de posicionamiento y temporización de un sistema, no el riesgo de seguridad de la información en general.

engine-compliance-req-nis2-21-2-a-reference = Artículo 21, apartado 2, letra a)

engine-compliance-req-nis2-21-2-a-asks = Políticas de análisis de riesgos y de seguridad de los sistemas de información.

engine-compliance-req-nis2-21-2-a-gap = Aporta evidencias a favor de la parte PNT de un análisis de riesgos; la política en sí es organizativa.

engine-compliance-req-nis2-21-2-b-reference = Artículo 21, apartado 2, letra b)

engine-compliance-req-nis2-21-2-b-asks = Gestión de incidentes.

engine-compliance-req-nis2-21-2-b-gap = Un registro de receptor puntuado ayuda a fechar el inicio y el fin de un incidente de interferencia PNT; el proceso de gestión es organizativo.

engine-compliance-req-nis2-21-2-c-reference = Artículo 21, apartado 2, letra c)

engine-compliance-req-nis2-21-2-c-asks = Continuidad de las actividades, como la gestión de copias de seguridad, la recuperación en caso de catástrofe y la gestión de crisis.

engine-compliance-req-nis2-21-2-c-gap = Muestra cuánto tiempo una alternativa modelada mantiene acotado un error de temporización o de posición; los planes de continuidad son organizativos.

engine-compliance-req-nis2-21-2-d-reference = Artículo 21, apartado 2, letra d)

engine-compliance-req-nis2-21-2-d-asks = Seguridad de la cadena de suministro, incluidos los aspectos relativos a las relaciones con los proveedores directos.

engine-compliance-req-nis2-21-2-d-gap = Kshana no evalúa a los proveedores. Usar un bench neutral y reproducible para la aceptación de receptores es una aportación que un comprador puede utilizar, no una evaluación de la cadena de suministro.

engine-compliance-req-nis2-21-2-e-reference = Artículo 21, apartado 2, letra e)

engine-compliance-req-nis2-21-2-e-asks = Seguridad en la adquisición, el desarrollo y el mantenimiento de sistemas, incluidas la gestión y la divulgación de vulnerabilidades.

engine-compliance-req-nis2-21-2-e-gap = Las pruebas de aceptación repetibles del comportamiento de un receptor ante la interferencia aportan evidencias a favor de la parte de adquisición; la gestión de vulnerabilidades queda fuera.

engine-compliance-req-nis2-21-2-f-reference = Artículo 21, apartado 2, letra f)

engine-compliance-req-nis2-21-2-f-asks = Políticas y procedimientos para evaluar la eficacia de las medidas de gestión de riesgos de ciberseguridad.

engine-compliance-req-nis2-21-2-f-gap = Las ejecuciones repetibles con hash y los eventos indicados antes de puntuar aportan evidencias a favor de una prueba de eficacia; la política y su calendario son organizativos.

engine-compliance-req-nis2-21-2-ghij-reference = Artículo 21, apartado 2, letras g) a j)

engine-compliance-req-nis2-21-2-ghij-asks = Ciberhigiene y formación; criptografía y cifrado; seguridad de los recursos humanos, control de acceso y gestión de activos; autenticación multifactor y comunicaciones seguras.

engine-compliance-req-nis2-21-2-ghij-gap = No se puede abordar con las salidas de ejecuciones de posicionamiento y temporización.

engine-compliance-req-nis2-21-3-reference = Artículo 21, apartado 3

engine-compliance-req-nis2-21-3-asks = Al elegir las medidas de la cadena de suministro, considerar las vulnerabilidades de cada proveedor y la calidad y el desarrollo seguro de sus productos.

engine-compliance-req-nis2-21-3-gap = Véase el artículo 21, apartado 2, letra d).

engine-compliance-req-en16803-1-reference = EN 16803-1 (definiciones y procedimientos de ingeniería de sistemas)

engine-compliance-req-en16803-1-asks = Define la arquitectura de ITS viarios, las características y las métricas de desempeño, y un método para comparar entornos de prueba. No establece requisitos.

engine-compliance-req-en16803-1-gap = Los números de cláusula no son visibles públicamente. Un titular de licencia debería asignar los campos de salida de Kshana a las definiciones de las métricas.

engine-compliance-req-en16803-2-reference = EN 16803-2 (desempeño básico de terminales basados en GNSS)

engine-compliance-req-en16803-2-asks = Procedimientos de prueba de laboratorio basados en reproducción para la disponibilidad, la continuidad, la precisión, la integridad y el tiempo hasta la primera posición de la salida de posición. No establece valores mínimos.

engine-compliance-req-en16803-2-gap = El movimiento exportado por Kshana puede alimentar una reproducción; el procedimiento de la norma, su tratamiento de señales grabadas y su cálculo de métricas no se reproducen aquí y requieren el texto con licencia.

engine-compliance-req-en16803-3-6-reference = EN 16803-3, cláusula 6

engine-compliance-req-en16803-3-6-asks = Distingue las señales grabadas de las señales simuladas en las pruebas de seguridad.

engine-compliance-req-en16803-3-6-gap = Kshana no graba ni simula ninguna señal. Exporta movimiento y eventos y puntúa el registro del receptor.

engine-compliance-req-en16803-3-a-reference = EN 16803-3, Anexo A

engine-compliance-req-en16803-3-a-asks = Una categorización de alto nivel de los ataques al GNSS: interferencia, jamming, meaconing y spoofing.

engine-compliance-req-en16803-3-a-gap = Los escenarios de Kshana nombran las clases de ataque en los mismos términos generales; una correspondencia a nivel de cláusula requiere el Anexo con licencia.

engine-compliance-req-nist-id-ra-1-reference = ID.RA-1 (Risk Assessment)

engine-compliance-req-nist-id-ra-1-asks = Identificar, documentar y notificar las vulnerabilidades del sistema PNT y de lo que distribuye los datos PNT; cuando sea seguro, probar la susceptibilidad a la perturbación o la manipulación, lo que puede usar simulación de señal PNT, dentro de los límites legales y de continuidad de las actividades.

engine-compliance-req-nist-id-ra-1-gap = Kshana caracteriza la susceptibilidad en escenarios modelados y en el registro grabado de un receptor. Un inventario de las vulnerabilidades del sistema real corresponde al operador, y cualquier prueba de RF se ejecuta con el equipo propio del operador y con su autorización: Kshana no transmite nada.

engine-compliance-req-nist-id-ra-3-reference = ID.RA-3 (Risk Assessment)

engine-compliance-req-nist-id-ra-3-asks = Identificar y documentar las amenazas internas y externas para el PNT, desde la perturbación natural y no intencionada hasta el ataque deliberado, como el jamming, el spoofing y los ataques de retardo.

engine-compliance-req-nist-id-ra-3-gap = Los escenarios plantean amenazas y sus efectos. Una evaluación documentada de amenazas para el sitio y el sistema propios del usuario corresponde redactarla al usuario; ningún escenario es evidencia de que allí exista una amenaza.

engine-compliance-req-nist-id-ra-4-reference = ID.RA-4 (Risk Assessment)

engine-compliance-req-nist-id-ra-4-asks = Identificar los posibles impactos y probabilidades; para cada amenaza, indicar la magnitud del impacto, cómo se manifiesta el error (escalón o rampa), los umbrales de detección y lo que hace el error aguas abajo.

engine-compliance-req-nist-id-ra-4-gap = Las ejecuciones dan cifras de impacto (crecimiento del error, niveles de protección, efectos en el enlace) para sensores modelados y una amenaza indicada. No se producen probabilidades, y un impacto modelado no es un impacto medido.

engine-compliance-req-nist-id-ra-5-reference = ID.RA-5 (Risk Assessment)

engine-compliance-req-nist-id-ra-5-asks = Usar las amenazas, las vulnerabilidades, las probabilidades y los impactos para evaluar el riesgo, y volver a evaluarlo periódicamente y cuando cambien el sistema o la amenaza.

engine-compliance-req-nist-id-ra-5-gap = La puntuación usa un conjunto sintético de amenazas, indicado como tal. Las ejecuciones repetibles con hash hacen comparable una reevaluación; el juicio de riesgo y su calendario son organizativos.

engine-compliance-req-nist-pr-ds-6-reference = PR.DS-6 (Data Security)

engine-compliance-req-nist-pr-ds-6-asks = Verificar la integridad de los datos PNT cuando las fuentes discrepan, por ejemplo mediante la verificación cruzada de varias frecuencias, constelaciones o fuentes independientes.

engine-compliance-req-nist-pr-ds-6-gap = Kshana calcula niveles de protección y resultados entre fuentes para geometría y sensores modelados; las comprobaciones de integridad dentro de un producto no se observan.

engine-compliance-req-nist-pr-ip-10-reference = PR.IP-10 (Information Protection Processes and Procedures)

engine-compliance-req-nist-pr-ip-10-asks = Probar los planes de respuesta y recuperación; para un sistema con una fuente de tiempo de respaldo, retirar la fuente primaria y confirmar que la precisión del tiempo, los escalones y las rampas se mantienen dentro de los requisitos de reloj indicados.

engine-compliance-req-nist-pr-ip-10-gap = Una ejecución de holdover modela la retirada y comprueba el error frente a un umbral indicado; un registro de receptor puntuado muestra una pérdida y una recuperación reales. La prueba en el servidor de tiempo propio del operador, y cualquier RF usada para ella, corresponden al operador.

engine-compliance-req-nist-pr-pt-5-reference = PR.PT-5 (Protective Technology)

engine-compliance-req-nist-pr-pt-5-asks = Usar mecanismos de resiliencia en condiciones normales y adversas: rechazar señales y datos erróneos, y combinar el holdover con detección de anomalías, fuentes redundantes o fusionadas y recuperación.

engine-compliance-req-nist-pr-pt-5-gap = Se muestran los mecanismos modelados y sus límites; que un producto los implemente es una prueba de producto.

engine-compliance-req-nist-de-ae-2-reference = DE.AE-2 (Anomalies and Events)

engine-compliance-req-nist-de-ae-2-asks = Analizar los eventos PNT detectados en tiempo real y después (fuente, estadísticas de error, duración, frecuencia, ubicación), distinguir los eventos dañinos del funcionamiento normal, y conservar los datos en bruto y el análisis.

engine-compliance-req-nist-de-ae-2-gap = Kshana puntúa un registro grabado a posteriori y conserva hashes de lo que ejecutó. No localiza ni atribuye una fuente de interferencia y no supervisa en tiempo real como servicio.

engine-compliance-req-nist-de-ae-3-reference = DE.AE-3 (Anomalies and Events)

engine-compliance-req-nist-de-ae-3-asks = Recopilar y correlacionar datos de eventos de varias fuentes y sensores, y verificar de forma cruzada datos PNT de más de una fuente para detectar comportamientos anómalos.

engine-compliance-req-nist-de-ae-3-gap = Los monitores de Kshana verifican de forma cruzada los flujos de un registro de receptor o de un escenario; la correlación entre los sensores y registros propios de un operador corresponde a este.

engine-compliance-req-nist-de-ae-4-reference = DE.AE-4 (Anomalies and Events)

engine-compliance-req-nist-de-ae-4-asks = Determinar el impacto de los eventos en los datos PNT y en las aplicaciones que dependen de ellos, incluidos los eventos poco frecuentes.

engine-compliance-req-nist-de-ae-4-gap = El impacto se muestra en la salida PNT de una ejecución o de un registro. Los efectos en una aplicación posterior concreta requieren los requisitos propios de esa aplicación.

engine-compliance-req-nist-de-ae-5-reference = DE.AE-5 (Anomalies and Events)

engine-compliance-req-nist-de-ae-5-asks = Fijar y documentar los umbrales de alerta de incidentes a partir de las tolerancias de error e incertidumbre que necesita la aplicación, con el tiempo de notificación.

engine-compliance-req-nist-de-ae-5-gap = Las ejecuciones se puntúan frente a umbrales que indica el usuario y los registran. Elegir los umbrales y el procedimiento de alerta corresponde al usuario.

engine-compliance-req-nist-de-cm-1-reference = DE.CM-1 (Security Continuous Monitoring)

engine-compliance-req-nist-de-cm-1-asks = Supervisar las fuentes y salidas PNT frente a líneas base para detectar anomalías, usando fuentes diversas y detección y exclusión de fallos, y comprobar que la supervisión cubre los modos de fallo identificados.

engine-compliance-req-nist-de-cm-1-gap = Kshana ejecuta y puntúa tales monitores sobre registros y escenarios. Un conjunto de ejecuciones no muestra la supervisión continua de un sistema en vivo ni la cobertura de todos los modos de fallo de un producto.

engine-compliance-req-nist-de-dp-3-reference = DE.DP-3 (Detection Processes)

engine-compliance-req-nist-de-dp-3-asks = Probar que la detección de eventos funciona según lo previsto, periódicamente y tras las actualizaciones, frente a los perfiles de amenaza actuales.

engine-compliance-req-nist-de-dp-3-gap = Los escenarios repetibles con hash y los eventos indicados antes de puntuar aportan evidencias a favor de una prueba así; ejecutarla en el equipo del operador de forma periódica corresponde a este.

engine-compliance-req-nist-rs-an-5-reference = RS.AN-5 (Analysis)

engine-compliance-req-nist-rs-an-5-asks = Establecer la verificación y la validación para los modos de fallo conocidos y las vulnerabilidades recién descubiertas, y registrar datos PNT nominales y anómalos de los incidentes para mejorar la detección posterior.

engine-compliance-req-nist-rs-an-5-gap = Un registro puntuado caracteriza un incidente a posteriori. Recibir las vulnerabilidades divulgadas y actuar en consecuencia es un proceso ajeno a cualquier ejecución.

engine-compliance-req-nist-rs-mi-2-reference = RS.MI-2 (Mitigation)

engine-compliance-req-nist-rs-mi-2-asks = Una vez contenido un incidente, mitigarlo con fuentes PNT alternativas o complementarias para que continúe la operación, y devolver el sistema a un estado de funcionamiento adecuado.

engine-compliance-req-nist-rs-mi-2-gap = Las ejecuciones muestran cuánto tiempo las fuentes alternativas modeladas mantienen acotado un error; la contención y la vuelta al servicio son pasos operativos.

engine-compliance-mapping-header-reference = Referencia

engine-compliance-mapping-header-asks = Qué exige (parafraseado)

engine-compliance-mapping-header-capabilities = Salidas de Kshana que aportan evidencias a favor de ello

engine-compliance-mapping-header-gap = Brecha

engine-compliance-mapping-none = ninguna

engine-compliance-source-line = **{ $title }**: { $version }. <{ $url }>. Leído { $accessed }: { $checked }.
