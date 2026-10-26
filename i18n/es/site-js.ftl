# site-js.ftl (es): translations

# src/js/t.mjs:4
js-app-engine-failed = No se pudo cargar el motor ({ $reason }).

# src/js/t.mjs:5
js-ledger-rows =
    { $n ->
        [one] { $n } fila del registro
        [many] { $n } de filas del registro
       *[other] { $n } filas del registro
    }

# src/site.js:373
js-site-action-copy-install = Copiar: cargo install kshana

# src/site.js:371
js-site-action-launch = Iniciar { $name }

# src/site.js:375
js-site-action-licence = Hable con nosotros sobre una licencia comercial

# src/site.js:374
js-site-action-pro-eval = Solicitar una evaluación de Kshana Pro

# src/site.js:376
js-site-action-study = Solicitar un estudio

# src/site.js:372
js-site-action-theme = Cambiar entre el tema claro y el oscuro

# src/js/capabilities.mjs:689
js-site-capabilities-bd-after = { $m } m tras { $s } s

# src/js/capabilities.mjs:675
js-site-capabilities-bd-combined = combinado

# src/js/capabilities.mjs:680
js-site-capabilities-bd-crossing = { $m } m a los { $s } s

# src/js/capabilities.mjs:694
js-site-capabilities-bd-fig-crossing = «{ $m } m» tras { $s } s, dominado por { $dom }

# src/js/capabilities.mjs:693
js-site-capabilities-bd-fig-lead = Tiempo desde la pérdida de GNSS en el eje logarítmico, con una IMU de grado { $grade } a { $speed } m/s:

# src/js/capabilities.mjs:695
js-site-capabilities-bd-fig-tail = Las líneas son las leyes de crecimiento del motor para tramos cortos sin GNSS y su suma cuadrática; los cruces proceden de su modelo de error completo de nueve estados (Schuler), que acota los términos de sesgo, de modo que en tramos largos cada cruce llega algo más tarde de lo que la línea lo alcanza. Las barras: los mismos cruces para cuatro grados de IMU.

# src/js/capabilities.mjs:816
js-site-capabilities-cd-canvas-aria = Constelación alrededor de su cuerpo, con imágenes reales: arrastre o use las teclas de flecha para girar, más y menos para acercar o alejar

# src/js/capabilities.mjs:746
js-site-capabilities-cd-design-meta = { $n } satélites · { $body } · { $file }

# src/js/capabilities.mjs:788
js-site-capabilities-cd-foot-frozen = Cada satélite sigue la trayectoria propia del motor; el radio de la órbita congelada procede de los elementos de la capa.

# src/js/capabilities.mjs:789
js-site-capabilities-cd-foot-mean-motion = Cada satélite sigue la trayectoria propia del motor, con el radio que implica su movimiento medio.

# src/js/capabilities.mjs:786
js-site-capabilities-cd-foot-walker = Los { $n } satélites se sitúan a partir de los parámetros Walker propios de las capas (comparados con las { $shown } trayectorias del motor: peor caso { $deg }°); las estelas son las { $shown } trayectorias del motor.

# src/js/capabilities.mjs:819
js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satélites

# src/js/capabilities.mjs:820
js-site-capabilities-cd-hud-mission = Misión «{ $time }»

# src/js/capabilities.mjs:782
js-site-capabilities-cd-legend-shell = capa { $n } · { $inc }°

# src/js/capabilities.mjs:803
js-site-capabilities-cd-map-availability = Fracción de la ejecución con PDOP ≤ { $limit } (0 a 100 %)

# src/js/capabilities.mjs:804
js-site-capabilities-cd-map-pdop = PDOP medio por celda de { $step }° ({ $lo } a { $hi }; más claro es mejor)

# src/js/capabilities.mjs:805
js-site-capabilities-cd-map-visible = Satélites a la vista, en promedio ({ $lo } a { $hi })

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-availability = Disponibilidad

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-pdop = PDOP medio

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-visible = A la vista

# src/js/capabilities.mjs:809
js-site-capabilities-cd-no-webgl = La vista 3D requiere WebGL; el mapa de cobertura y las cifras son de la misma ejecución.

# src/js/capabilities.mjs:812
js-site-capabilities-cd-pause = Pausar las órbitas

# src/js/capabilities.mjs:812
js-site-capabilities-cd-play = Reproducir las órbitas

# src/js/capabilities.mjs:749
js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

# src/js/capabilities.mjs:750
js-site-capabilities-cd-slots = { $name }: { $n } satélites, tabla de ranuras del operador

# src/js/capabilities.mjs:784
js-site-capabilities-cd-span = de { $dur }, en bucle

# src/js/capabilities.mjs:770
js-site-capabilities-cd-stat-in-view = Media a la vista

# src/js/capabilities.mjs:771
js-site-capabilities-cd-stat-mask = Máscara · ejecución

# src/js/capabilities.mjs:769
js-site-capabilities-cd-stat-median = PDOP mediano

# src/js/capabilities.mjs:767
js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, { $body } completo

# src/js/capabilities.mjs:766
js-site-capabilities-cd-stat-satellites = Satélites

# src/js/capabilities.mjs:768
js-site-capabilities-cd-stat-worst = Peor emplazamiento

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-gnss = Cuatro GNSS a la vez

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-leo = Megaconstelación de órbita terrestre baja

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-lunar = Conjunto de relés lunares

# src/js/capabilities.mjs:779
js-site-capabilities-cd-work-ratio = { $pct } % tras el prefiltro de latitud · { $dop } soluciones DOP

# src/js/capabilities.mjs:778
js-site-capabilities-cd-work-tests = { $after } pruebas satélite-punto, de las { $brute } que haría un barrido por fuerza bruta

# src/js/capabilities.mjs:777
js-site-capabilities-cd-work-title = Trabajo de visibilidad

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-sub = C/N0 frente al umbral de seguimiento

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-title = Densidad de portadora a ruido

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-availability = Disponibilidad

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-fewest = Mínimo seguido

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-js = J/S medio

# src/js/capabilities.mjs:1037
js-site-capabilities-cg-compose-text = Un jammer, { $power } { $unit }, en un lugar, vinculado a { $n } ejecuciones miembro del tipo ‹{ $kind }›: un barco en un estrecho y un coche en una carretera costera ven la misma causa y obtienen respuestas distintas.

# src/js/capabilities.mjs:973
js-site-capabilities-cg-log-campaign = campaña { $file } · { $phases } fases · { $runs } ejecuciones miembro

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase = comienza la fase { $name }

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase-carries = comienza la fase { $name } · arrastra { $carried }

# src/js/capabilities.mjs:1017
js-site-capabilities-cg-monte-axis = error final del reloj en { $n } semillas ({ $path })

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-ci = Media, intervalo del 95 %

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-mean = Media

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p05 = percentil 5

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-p05-p95 = percentil 5 a 95

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p50 = mediana

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p95 = percentil 95

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-std = Desviación típica

# src/js/capabilities.mjs:1020
js-site-capabilities-cg-monte-text = El mismo escenario ‹{ $kind }› ejecutado { $n } veces a partir de la semilla base { $seed }, una semilla por ejecución: la dispersión del error final del reloj en marcha libre, con su intervalo de confianza del 95 % para la media.

# src/js/capabilities.mjs:969
js-site-capabilities-cg-not-in-phase = no está en esta fase

# src/js/capabilities.mjs:972
js-site-capabilities-cg-now = Fase { $n } de { $total }: { $name } · de { $from } a { $to }

# src/js/capabilities.mjs:940
js-site-capabilities-cg-phase-title = { $name }: de { $from } a { $to } · terminada por { $by } · tipos miembro { $kinds }

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-sub = frente al límite de alerta

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-title = Nivel de protección

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-sub = frente a su presupuesto · log

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-title = Error de posición inercial

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-range = { $lo } a { $hi }

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-all-lost = Todos perdidos desde

# src/js/capabilities.mjs:998
js-site-capabilities-cg-sweep-axis = potencia de transmisión del jammer ({ $key })

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-first-loss = Primera pérdida

# src/js/capabilities.mjs:1003
js-site-capabilities-cg-sweep-lg-availability = disponibilidad

# src/js/capabilities.mjs:1003
js-site-capabilities-cg-sweep-lg-js = J/S medio

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-never = nunca

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-nodes = Nodos

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-none = ninguno

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-span = Intervalo de J/S

# src/js/capabilities.mjs:1002
js-site-capabilities-cg-sweep-text = Un escenario ‹{ $kind }›, ejecutado una vez por nodo a medida que la potencia de transmisión del jammer pasa de { $from } a { $to } { $unit }. La disponibilidad bajo jamming (continua) y el J/S medio (discontinua) proceden de las cifras de mérito de cada ejecución miembro.

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-sub = frente a su margen de guarda

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-title = Error de tiempo del reloj

# src/js/capabilities.mjs:109
js-site-capabilities-copy = Copiar

# src/js/capabilities.mjs:108
js-site-capabilities-copy-aria = Copiar el comando que reproduce la ejecución: kshana { $file }

# src/js/capabilities.mjs:1387
js-site-capabilities-cz-best = Mejor PDOP

# src/js/capabilities.mjs:1374
js-site-capabilities-cz-failed = No se pudo cargar aquí la ejecución registrada; ábrala en su lugar en el Studio.

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix = Muestras con solución de posición

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix-value = { $n } de { $total } ({ $pct }%)

# src/js/capabilities.mjs:1388
js-site-capabilities-cz-median = PDOP mediano

# src/js/capabilities.mjs:90
js-site-capabilities-engine = Motor v{ $version }

# src/js/capabilities.mjs:91
js-site-capabilities-engine-build = Motor v{ $version }, compilación

# src/js/capabilities.mjs:104
js-site-capabilities-engine-report = Informe del motor

# src/js/capabilities.mjs:1287
js-site-capabilities-globe-aria = { $name } sobre sus imágenes reales ({ $credit }). Arrastre o use las teclas de flecha para girarlo; más y menos acercan o alejan.

# src/js/capabilities.mjs:1334
js-site-capabilities-ho-ends = la ejecución termina a { $t }

# src/js/capabilities.mjs:1337
js-site-capabilities-ho-past-guard = fuera del margen de guarda

# src/js/capabilities.mjs:92
js-site-capabilities-no-seed = determinista, sin semilla

# src/js/capabilities.mjs:96
js-site-capabilities-open-in-studio = Abrir en { $studio }

# src/js/capabilities.mjs:104
js-site-capabilities-open-report = Abrir el informe del motor

# src/js/capabilities.mjs:1186
js-site-capabilities-orrery-aria = El sistema solar en la época de la ejecución: arrastre o use las teclas de flecha para girar, más y menos para acercar o alejar

# src/js/capabilities.mjs:1228
js-site-capabilities-orrery-bodies = { $n } cuerpos · observador «{ $observer }»

# src/js/capabilities.mjs:1227
js-site-capabilities-orrery-epoch = Época «{ $epoch }» · TDB (tiempo dinámico baricéntrico), fecha juliana { $jd }

# src/js/capabilities.mjs:1134
js-site-capabilities-pnt-chart-title = relés a la vista (línea) · Tierra sobre el horizonte (sombreado) · se necesitan cuatro para una solución

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-kicker = Posicionamiento en este cuerpo · tipo body-pnt

# src/js/capabilities.mjs:1124
js-site-capabilities-pnt-lander = Un módulo de aterrizaje en { $lat }°, { $lon }° de la superficie navega con los relés, con una medición de distancia bidireccional desde la Tierra siempre que esta esté sobre el horizonte (tiempo de luz unidireccional { $min } min). Disponibilidad: { $a } % solo con los relés, { $b } % con el enlace con la Tierra.

# src/js/capabilities.mjs:1125
js-site-capabilities-pnt-orbiter = Un usuario en órbita navega con los relés, con una medición de distancia bidireccional desde la Tierra siempre que esta esté sobre el horizonte (tiempo de luz unidireccional { $min } min). Disponibilidad: { $a } % solo con los relés, { $b } % con el enlace con la Tierra.

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-relays = { $n } relés a { $alt } km alrededor de { $body }

# src/js/capabilities.mjs:97
js-site-capabilities-report-data = Informe y datos

# src/js/capabilities.mjs:107
js-site-capabilities-result-data = Datos del resultado

# src/js/capabilities.mjs:78
js-site-capabilities-saved = Guardado { $name }

# src/js/capabilities.mjs:105
js-site-capabilities-scenario-file = Archivo de escenario

# src/js/capabilities.mjs:92
js-site-capabilities-seed = semilla { $seed }

# src/js/capabilities.mjs:568
js-site-capabilities-six-clock-fig = «{ $id }» se mantiene dentro del margen de guarda durante { $dur }

# src/js/capabilities.mjs:563
js-site-capabilities-six-clock-guard = margen de guarda de { $v } ns

# src/js/capabilities.mjs:605
js-site-capabilities-six-coast-budget = presupuesto de { $m } m

# src/js/capabilities.mjs:606
js-site-capabilities-six-coast-denied = GNSS denegado

# src/js/capabilities.mjs:609
js-site-capabilities-six-coast-fig = «{ $id }» dentro del presupuesto durante { $s } s

# src/js/capabilities.mjs:527
js-site-capabilities-six-floor = umbral de seguimiento

# src/js/capabilities.mjs:595
js-site-capabilities-six-integ-fig = «{ $ok }» de { $n } épocas disponibles · límites de alerta { $h } m horizontal, { $v } m vertical

# src/js/capabilities.mjs:590
js-site-capabilities-six-integ-limit = límite de alerta vertical

# src/js/capabilities.mjs:594
js-site-capabilities-six-integ-pl = nivel de protección vertical (continua) y horizontal (discontinua)

# src/js/capabilities.mjs:534
js-site-capabilities-six-jam-effective = efectivo, { $n } satélites

# src/js/capabilities.mjs:535
js-site-capabilities-six-jam-fig = Seguidos «{ $min }» de { $max } a la vista · disponibilidad bajo jamming «{ $av }» (nominal { $nom }) · J/S medio «{ $js } dB»

# src/js/capabilities.mjs:533
js-site-capabilities-six-jam-nominal = nominal, sin jammer (discontinua)

# src/js/capabilities.mjs:581
js-site-capabilities-six-orbit-fig = Altitud «{ $lo }–{ $hi } km» · traza en tierra durante { $dur }

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-label = { $source } · { $n } muestras

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-sgp4 = SGP4 a partir de un conjunto de elementos de dos líneas

# src/js/capabilities.mjs:548
js-site-capabilities-six-spoof-detects = { $id } detecta

# src/js/capabilities.mjs:550
js-site-capabilities-six-spoof-fig = «{ $id }» detecta a los { $s } s (cota { $ns } ns)

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-angle = Ángulo respecto al Sol

# src/js/capabilities.mjs:1053
js-site-capabilities-ss-credit = Imágenes: { $credits }. * El mapa no llega a los polos; el hueco toma el color medio polar del mapa. Anillos de Saturno: { $ring } ({ $licence }).

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-days = { $v } días

# src/js/capabilities.mjs:1076
js-site-capabilities-ss-frame-origin = Origen del marco

# src/js/capabilities.mjs:1084
js-site-capabilities-ss-from-sun = Desde el Sol

# src/js/capabilities.mjs:1088
js-site-capabilities-ss-gloss = NAIF: el código de cuerpo del Navigation and Ancillary Information Facility de la NASA. GM: parámetro gravitacional. J2: término de achatamiento. Polo IAU: el polo de rotación de la Unión Astronómica Internacional, como ascensión recta (RA) y declinación (Dec).

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-j2-none = ninguno publicado

# src/js/capabilities.mjs:1077
js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

# src/js/capabilities.mjs:1077
js-site-capabilities-ss-kind-of = { $class } de { $parent } · NAIF { $naif }

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-light-time = Tiempo de luz desde { $observer }

# src/js/capabilities.mjs:1091
js-site-capabilities-ss-link = { $from } a { $to }, tiempo de luz unidireccional { $one }, ida y vuelta { $two }

# src/js/capabilities.mjs:1091
js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Enlace que calcula esta ejecución:
        [many] Enlaces que calcula esta ejecución:
       *[other] Enlaces que calcula esta ejecución:
    }

# src/js/capabilities.mjs:1094
js-site-capabilities-ss-moons =
    { $n ->
        [one] Su luna, a escala, en la época
        [many] Sus lunas, a escala, en la época
       *[other] Sus lunas, a escala, en la época
    }

# src/js/capabilities.mjs:1106
js-site-capabilities-ss-nominal-error = error nominal de { $km } km en distancia

# src/js/capabilities.mjs:1103
js-site-capabilities-ss-north = Visto desde el norte de la eclíptica.

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period = Período orbital

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period-about = Período alrededor de { $parent }

# src/js/capabilities.mjs:1086
js-site-capabilities-ss-pole = Polo IAU (RA, Dec)

# src/js/capabilities.mjs:1081
js-site-capabilities-ss-radius = Radio medio

# src/js/capabilities.mjs:1080
js-site-capabilities-ss-retrograde = { $v } h, retrógrado

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-rotation = Rotación sidérea

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-years = { $v } años

# src/js/capabilities.mjs:653
js-site-capabilities-st-bound = cota de { $v } m

# src/js/capabilities.mjs:660
js-site-capabilities-st-fig-none = { $n } épocas, ninguna con el error por encima de su cota. Horizontal: el error de posición real; vertical: el nivel de protección; ambos en ejes logarítmicos.

# src/js/capabilities.mjs:659
js-site-capabilities-st-fig-some = { $n } épocas, { $k } con el error por encima de su cota. Horizontal: el error de posición real; vertical: el nivel de protección; ambos en ejes logarítmicos.

# src/js/capabilities.mjs:649
js-site-capabilities-st-limit = límite de alerta de { $m } m

# src/js/capabilities.mjs:650
js-site-capabilities-st-misleading = engañoso: error por encima de la cota

# src/js/capabilities.mjs:652
js-site-capabilities-st-normal = funcionamiento normal

# src/js/capabilities.mjs:651
js-site-capabilities-st-unavailable = no disponible: cota por encima del límite

# src/js/capabilities.mjs:1408
js-site-capabilities-studio-embedded = { $studio }, integrado: la ejecución orbit-multignss

# src/js/capabilities.mjs:1406
js-site-capabilities-studio-load = Cargar { $studio } aquí

# src/js/capabilities.mjs:1410
js-site-capabilities-studio-outline = Mostrar de nuevo el esquema

# src/js/capabilities.mjs:259
js-site-capabilities-wave-chirp = chirp

# src/js/capabilities.mjs:259
js-site-capabilities-wave-cw = tono CW

# src/js/capabilities.mjs:260
js-site-capabilities-wave-noise = ruido

# src/js/capabilities.mjs:388
js-site-capabilities-wf-an-caption = fila T+{ $t } s · dB sobre el umbral, escala logarítmica · pico de toda la cuadrícula { $peak } dB

# src/js/capabilities.mjs:357
js-site-capabilities-wf-degraded = Degradada

# src/js/capabilities.mjs:364
js-site-capabilities-wf-degraded-low = degradada

# src/js/capabilities.mjs:134
js-site-capabilities-wf-failed = No se pudo cargar aquí la ejecución registrada.

# src/js/capabilities.mjs:247
js-site-capabilities-wf-grid = cuadrícula

# src/js/capabilities.mjs:144
js-site-capabilities-wf-iq = En T+{ $t } s el motor también dibuja el modelo como { $n } muestras IQ (en fase y en cuadratura) alrededor de { $mhz } MHz y contrasta con él una estimación de Welch ({ $segments } segmentos de { $nfft }): cociente de potencia integrada { $ratio }.

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-off = { $what } apagado

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-on = { $what } encendido

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · de { $on } s hasta el final

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

# src/js/capabilities.mjs:357
js-site-capabilities-wf-lost = Enganche perdido

# src/js/capabilities.mjs:364
js-site-capabilities-wf-lost-low = enganche perdido

# src/js/capabilities.mjs:392
js-site-capabilities-wf-max = { $peak } dB por encima · escala logarítmica desde { $v0 } dB

# src/js/capabilities.mjs:358
js-site-capabilities-wf-no-jammer = sin jammer

# src/js/capabilities.mjs:239
js-site-capabilities-wf-now = ahora

# src/js/capabilities.mjs:437
js-site-capabilities-wf-pause = Pausar la cascada

# src/js/capabilities.mjs:386
js-site-capabilities-wf-peak = pico { $v } dB

# src/js/capabilities.mjs:437
js-site-capabilities-wf-play = Reproducir la cascada

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-previous = inicio de la reproducción · pasada anterior debajo

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-start = inicio de la reproducción

# src/js/capabilities.mjs:364
js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

# src/js/capabilities.mjs:229
js-site-capabilities-wf-signal = señal +{ $v } dB

# src/js/capabilities.mjs:395
js-site-capabilities-wf-summary = Ejecución registrada de { $file }: { $bands } bandas, { $jammers } jammers durante { $seconds } segundos. La peor banda, { $worst }, cae a { $min } dB-Hz a los { $at } s; umbral de seguimiento { $floor } dB-Hz.

# src/js/capabilities.mjs:416
js-site-capabilities-wf-tip-above = { $v } dB por encima del umbral de ruido

# src/js/capabilities.mjs:417
js-site-capabilities-wf-tip-in = en { $bands }

# src/js/capabilities.mjs:357
js-site-capabilities-wf-tracking = Seguimiento

# src/js/capabilities.mjs:364
js-site-capabilities-wf-tracking-low = seguimiento

# src/js/cap-hero.mjs:60
js-site-caphero-aria = El sistema solar según la ejecución solar-system del motor en { $date }: el Sol y { $bodies } cuerpos que se mueven por sus trayectorias orbitales del motor; { $valid } de las órbitas están validadas frente a JPL Horizons.

# src/js/cap-hero.mjs:185
js-site-caphero-clock = +{ $days } días · { $date }

# src/js/cap-hero.mjs:69
js-site-caphero-copy-command = Copiar comando

# src/js/cap-hero.mjs:69
js-site-caphero-copy-title = Copiar el comando que lo reproduce

# src/js/cap-hero.mjs:79
js-site-caphero-credits = Distancias comprimidas en escala logarítmica, direcciones reales; cuerpos agrandados, giro a una velocidad de visualización. Imágenes: { $credits }; anillos de Saturno: { $ring } ({ $licence }).

# src/js/cap-hero.mjs:77
js-site-caphero-credits-summary = Créditos de escala e imágenes

# src/js/cap-hero.mjs:64
js-site-caphero-engine-build = Motor v{ $version }, compilación

# src/js/cap-hero.mjs:65
js-site-caphero-explore = Explorar todos los cuerpos

# src/js/cap-hero.mjs:67
js-site-caphero-file-title = El archivo de escenario que se ejecutó

# src/js/cap-hero.mjs:59
js-site-caphero-list-item = { $name }: { $label }, a { $au } au del Sol en la época, período orbital { $period }.

# src/js/cap-hero.mjs:58
js-site-caphero-list-item-light = { $name }: { $label }, a { $au } au del Sol en la época, período orbital { $period }, tiempo de luz desde { $observer } { $light }.

# src/js/cap-hero.mjs:64
js-site-caphero-no-seed = determinista, sin semilla

# src/js/cap-hero.mjs:72
js-site-caphero-open-in-studio = Abrir en { $studio }

# src/js/cap-hero.mjs:203
js-site-caphero-pause = Pausar las órbitas

# src/js/cap-hero.mjs:55
js-site-caphero-period-days = { $value } días

# src/js/cap-hero.mjs:55
js-site-caphero-period-years = { $value } años

# src/js/cap-hero.mjs:203
js-site-caphero-play = Reproducir las órbitas

# src/js/cap-hero.mjs:52
js-site-caphero-rate = { $days } días de la ejecución por segundo

# src/js/cap-hero.mjs:52
js-site-caphero-rate-epoch = El marco en la época de la ejecución

# src/js/cap-hero.mjs:135
js-site-caphero-read-distance = a { $au } au del Sol

# src/js/cap-hero.mjs:136
js-site-caphero-read-light = tiempo de luz desde { $observer } en la época { $light }

# src/js/cap-hero.mjs:135
js-site-caphero-read-orbit = órbita { $period }

# src/js/cap-hero.mjs:64
js-site-caphero-seed = semilla { $seed }

# src/site.js:239
js-site-copy-aria = Copiar: { $cmd }

# src/js/developers.mjs:41
js-site-developers-captured-from = capturado { $recorded } desde

# src/js/developers.mjs:41
js-site-developers-engine-build = Motor v{ $version }, compilación

# src/js/developers.mjs:51
js-site-developers-exit-stamp = salida { $rc } · { $ms } ms

# src/js/developers.mjs:44
js-site-developers-file-open-in-studio = { $file }: abrir en { $studio }

# src/js/developers.mjs:45
js-site-developers-no-seed = (determinista, sin semilla)

# src/js/developers.mjs:44
js-site-developers-open-in-studio = Abrir en { $studio }

# src/js/developers.mjs:89
js-site-developers-pause = Pausar la reproducción

# src/js/developers.mjs:89
js-site-developers-play = Iniciar la reproducción

# src/js/developers.mjs:70
js-site-developers-replaying = # reproduciendo la sesión registrada

# src/js/developers.mjs:45
js-site-developers-seed = (semilla { $seed })

# src/js/developers.mjs:46
js-site-developers-what-runs-write = Qué escribe cada ejecución

# src/js/editions.mjs:89
js-site-editions-builds-on-it = { $label } se construye sobre él

# src/js/editions.mjs:74
js-site-editions-core-kinds =
    { $n ->
        [one] { $n } tipo
        [many] { $n } de tipos
       *[other] { $n } tipos
    }

# src/js/editions.mjs:73
js-site-editions-core-title = Núcleo abierto

# src/js/editions.mjs:76
js-site-editions-core-validated = validados

# src/js/editions.mjs:75
js-site-editions-core-validated-of = { $validated } de { $total }

# src/js/editions.mjs:89
js-site-editions-free-core = Gratis en el núcleo abierto, como todos los tipos

# src/js/editions.mjs:32
js-site-editions-group-other = Otros

# src/js/editions.mjs:87
js-site-editions-kind-no-ledger = ningún módulo del registro coincide por nombre

# src/js/editions.mjs:87
js-site-editions-kind-validated = { $v } de { $tot } filas del registro validadas

# src/js/editions.mjs:98
js-site-editions-pause = Pausar los anillos

# src/js/editions.mjs:98
js-site-editions-play = Reproducir los anillos

# src/js/editions.mjs:48
js-site-editions-ring-pro = Kshana Pro

# src/js/editions.mjs:49
js-site-editions-ring-study = Estudio a medida

# src/js/evidence.mjs:319
js-site-evidence-allan-aria = Cuatro desviaciones del conjunto de datos de 1000 puntos de NIST SP 1065 frente al tiempo de promediado; se reprodujeron los { $n } valores publicados, peor error relativo { $err }

# src/js/evidence.mjs:340
js-site-evidence-allan-lg-published = valor publicado, SP 1065 Table 31

# src/js/evidence.mjs:312
js-site-evidence-allan-mdev = desviación de Allan modificada

# src/js/evidence.mjs:346
js-site-evidence-allan-na = n/d

# src/js/evidence.mjs:312
js-site-evidence-allan-oadev = desviación de Allan solapada

# src/js/evidence.mjs:312
js-site-evidence-allan-ohdev = desviación de Hadamard solapada

# src/js/evidence.mjs:347
js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modificada { $mdev } · Hadamard { $ohdev }

# src/js/evidence.mjs:341
js-site-evidence-allan-st-gate = el umbral de la prueba

# src/js/evidence.mjs:341
js-site-evidence-allan-st-reproduced = valores publicados reproducidos

# src/js/evidence.mjs:341
js-site-evidence-allan-st-worst = peor error relativo

# src/js/evidence.mjs:312
js-site-evidence-allan-tdev = desviación de tiempo, en segundos

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-at = «{ $name }» a { $m } s

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-engine = motor: «{ $got }» · error relativo { $err }

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-table = SP 1065 Table 31: «{ $want }»

# src/js/evidence.mjs:469
js-site-evidence-cell-tip = Capacidad { $i } de { $n } · «{ $label }»

# src/js/evidence.mjs:222
js-site-evidence-cowell-aria = Diferencia de posición frente a Orekit en 24 horas: los niveles de fuerza 1 a 5 se mantienen por debajo de { $worst }; el nivel de arrastre llega a { $drag }, una banda de caracterización

# src/js/evidence.mjs:236
js-site-evidence-cowell-gto = órbita de transferencia geoestacionaria

# src/js/evidence.mjs:236
js-site-evidence-cowell-leo = órbita terrestre baja

# src/js/evidence.mjs:242
js-site-evidence-cowell-lg-con = niveles 1 a 5, de dos cuerpos hasta la presión de radiación solar, dos órbitas cada uno

# src/js/evidence.mjs:242
js-site-evidence-cowell-lg-drag = nivel 6, arrastre: solo caracterización (modelos de densidad distintos)

# src/js/evidence.mjs:251
js-site-evidence-cowell-read = { $h } h · niveles 1 a 5, peor caso { $con } · arrastre { $drag }

# src/js/evidence.mjs:243
js-site-evidence-cowell-st-drag = nivel de arrastre, peor caso

# src/js/evidence.mjs:243
js-site-evidence-cowell-st-epochs = épocas en los niveles 1 a 5

# src/js/evidence.mjs:236
js-site-evidence-cowell-tip-tier = «Nivel { $tier }: { $label }» · { $regime }

# src/js/evidence.mjs:236
js-site-evidence-cowell-tip-worst = peor diferencia «{ $err }» a { $h } h

# src/js/evidence.mjs:539
js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

# src/js/evidence.mjs:537
js-site-evidence-hero-no-oracle = No se nombra ninguna referencia independiente externa.

# src/js/evidence.mjs:536
js-site-evidence-hero-oracle = Referencia independiente

# src/js/evidence.mjs:539
js-site-evidence-hero-oracle-is = Referencia independiente: { $o }

# src/js/evidence.mjs:536
js-site-evidence-hero-owner = Responsable

# src/js/evidence.mjs:537
js-site-evidence-hero-partner = Esto es de un socio; el motor no reclama nada de ello.

# src/js/evidence.mjs:544
js-site-evidence-hero-pause = Pausar el barrido

# src/js/evidence.mjs:544
js-site-evidence-hero-play = Iniciar el barrido

# src/js/evidence.mjs:531
js-site-evidence-hero-row = Fila { $i } de { $n }

# src/js/evidence.mjs:381
js-site-evidence-hold-accepted = aceptado: dentro de un factor de { $bar }

# src/js/evidence.mjs:359
js-site-evidence-hold-aria = Error de tiempo cuadrático medio medido del reloj de cesio frente al tiempo de holdover, con la predicción del motor; el cociente entre lo predicho y lo medido supera el umbral de { $lo } a { $hi }

# src/js/evidence.mjs:387
js-site-evidence-hold-control = «Control:» la predicción ingenua (la estabilidad de un segundo leída como ruido blanco de frecuencia) da un cociente de { $ratio }, errado por un factor de aproximadamente { $factor }, y no cumple el mismo umbral. El umbral es exigente.

# src/js/evidence.mjs:375
js-site-evidence-hold-lg-meas = medido en el registro reservado (punto: superación)

# src/js/evidence.mjs:375
js-site-evidence-hold-lg-pred = predicho a partir del primer tercio (anillo: superación)

# src/js/evidence.mjs:354
js-site-evidence-hold-nodata = El registro medido no estaba disponible cuando se generó esta página.

# src/js/evidence.mjs:383
js-site-evidence-hold-perfect = 1 = perfecto

# src/js/evidence.mjs:377
js-site-evidence-hold-ratio-aria = Cociente entre lo predicho y lo medido para { $n } umbrales, todos dentro del factor aceptado de { $bar }

# src/js/evidence.mjs:393
js-site-evidence-hold-read = holdover { $h } h · medido { $m } ns · predicho { $p } ns

# src/js/evidence.mjs:388
js-site-evidence-hold-st-fit = usado para el ajuste

# src/js/evidence.mjs:388
js-site-evidence-hold-st-samples = muestras de un segundo

# src/js/evidence.mjs:388
js-site-evidence-hold-st-syncs = puntos de sincronización reservados

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-breach = superación predicha { $p } s · medida { $m } s

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-error = «Error de tiempo { $thr } ns»

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-ratio = predicho sobre medido «{ $ratio }»

# src/js/evidence.mjs:382
js-site-evidence-hold-tip-row = «{ $thr } ns» · predicho sobre medido «{ $ratio }»

# src/js/evidence.mjs:171
js-site-evidence-kernel-chi2-cdf = distribución chi cuadrado

# src/js/evidence.mjs:172
js-site-evidence-kernel-chi2-quantile = cuantil de chi cuadrado

# src/js/evidence.mjs:175
js-site-evidence-kernel-noncentral = chi cuadrado no central

# src/js/evidence.mjs:173
js-site-evidence-kernel-normal-cdf = distribución normal

# src/js/evidence.mjs:174
js-site-evidence-kernel-normal-quantile = cuantil normal

# src/js/evidence.mjs:176
js-site-evidence-kernel-pbias = sesgo de detección

# src/js/evidence.mjs:274
js-site-evidence-ladder-aria = Residuos de órbita de { $lo } a { $hi } m en una misma escala logarítmica, con el umbral de agencia de { $bar } m

# src/js/evidence.mjs:284
js-site-evidence-ladder-bar = umbral de agencia { $bar } m

# src/js/evidence.mjs:265
js-site-evidence-ladder-cowell = Cowell frente a Orekit 12.2, peor caso

# src/js/evidence.mjs:267
js-site-evidence-ladder-g24 = Galileo E11, ajuste de 24 horas

# src/js/evidence.mjs:266
js-site-evidence-ladder-g8 = Galileo E11, ajuste de 8 horas

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-headline = residuo principal

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-over = por encima del umbral de agencia de { $bar } m

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-ring = solo el modelo de fuerzas, antes de las aceleraciones empíricas

# src/js/evidence.mjs:269
js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, ajuste de 4 horas

# src/js/evidence.mjs:307
js-site-evidence-ladder-read = barrido en { $v } · { $n } de { $total } residuos principales iguales o inferiores

# src/js/evidence.mjs:262
js-site-evidence-ladder-rt-arc = arco { $arc } · grado y orden { $do } · { $n } observaciones

# src/js/evidence.mjs:262
js-site-evidence-ladder-rt-rtn = radial { $r } m · a lo largo de la traza { $a } m · transversal { $c } m

# src/js/evidence.mjs:264
js-site-evidence-ladder-sgp4 = SGP4 frente a los vectores AIAA, peor caso

# src/js/evidence.mjs:268
js-site-evidence-ladder-swarm = Swarm-A, ajuste de 3 horas

# src/js/evidence.mjs:265
js-site-evidence-ladder-tip-cowell = «Cowell · peor de { $n } épocas» · { $worst }

# src/js/evidence.mjs:267
js-site-evidence-ladder-tip-g24 = «Galileo E11 · un día completo» · { $rms } m

# src/js/evidence.mjs:266
js-site-evidence-ladder-tip-g8a = «Galileo E11 · solo modelo de fuerzas» · { $rms } m

# src/js/evidence.mjs:266
js-site-evidence-ladder-tip-g8b = «Galileo E11 · con aceleraciones empíricas» · { $rms } m

# src/js/evidence.mjs:269
js-site-evidence-ladder-tip-lrd = «Orbitador lunar · dinámico» · { $rms } m

# src/js/evidence.mjs:269
js-site-evidence-ladder-tip-lrr = «Orbitador lunar · dinámico reducido» · { $rms } m, por encima del umbral de { $bar } m y notificado tal cual

# src/js/evidence.mjs:264
js-site-evidence-ladder-tip-sgp4 = «SGP4 · peor de { $n } vectores» · { $worst }

# src/js/evidence.mjs:268
js-site-evidence-ladder-tip-swd = «Swarm-A · dinámico» · { $rms } m, casi todo a lo largo de la traza (arrastre)

# src/js/evidence.mjs:268
js-site-evidence-ladder-tip-swr = «Swarm-A · dinámico reducido» · { $rms } m

# src/js/evidence.mjs:183
js-site-evidence-raim-aria = { $pass } de { $n } casos de SciPy dentro de su banda de tolerancia, en { $kernels } núcleos

# src/js/evidence.mjs:187
js-site-evidence-raim-lane = { $kernel } · { $n }

# src/js/evidence.mjs:209
js-site-evidence-raim-lg-most = la mayor parte de una banda que usa algún caso

# src/js/evidence.mjs:214
js-site-evidence-raim-read = caso { $q } de { $n } · { $kernel } · { $what }

# src/js/evidence.mjs:214
js-site-evidence-raim-read-band = { $pct } % de la banda

# src/js/evidence.mjs:199
js-site-evidence-raim-scale-aria = Escala de color: fracción de la banda de tolerancia usada, logarítmica desde 10 elevado a menos 11 hasta el borde de la banda

# src/js/evidence.mjs:210
js-site-evidence-raim-st-inside = dentro de la banda

# src/js/evidence.mjs:210
js-site-evidence-raim-st-most = la mayor parte de una banda usada

# src/js/evidence.mjs:203
js-site-evidence-raim-tick-edge = borde de la banda

# src/js/evidence.mjs:203
js-site-evidence-raim-tick-exact = exacto

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-case = «{ $kernel }» · caso { $j } de { $n }

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-exact = «coincidencia exacta» con SciPy

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-uses = usa «{ $pct } %» de su banda de tolerancia

# src/js/evidence.mjs:132
js-site-evidence-sgp4-aria = Se reprodujeron { $n } de { $n } vectores AIAA; peor caso { $worst }, mediana { $median }, todos dentro de la tolerancia de { $tol }

# src/js/evidence.mjs:139
js-site-evidence-sgp4-deep = espacio profundo (SDP4)

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-deep = vector de espacio profundo (SDP4)

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-median = mediana y peor caso en la escala

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-near = vector cercano a la Tierra (SGP4)

# src/js/evidence.mjs:139
js-site-evidence-sgp4-near = cercano a la Tierra (SGP4)

# src/js/evidence.mjs:165
js-site-evidence-sgp4-read = vector { $i } de { $n } · satélite { $sat } · error { $err }

# src/js/evidence.mjs:164
js-site-evidence-sgp4-read-deep = vector { $i } de { $n } · satélite { $sat }, espacio profundo · error { $err }

# src/js/evidence.mjs:144
js-site-evidence-sgp4-scale-aria = Escala de color desde 0.1 micrómetros hasta la tolerancia, logarítmica

# src/js/evidence.mjs:159
js-site-evidence-sgp4-st-deep = vectores de espacio profundo

# src/js/evidence.mjs:159
js-site-evidence-sgp4-st-sats = satélites de prueba

# src/js/evidence.mjs:139
js-site-evidence-sgp4-tip-sat = «Satélite { $sat }» · { $kind }

# src/js/evidence.mjs:139
js-site-evidence-sgp4-tip-vector = vector { $j } de { $n } · error de posición «{ $err }»

# src/js/evidence.mjs:159
js-site-evidence-st-median = mediana

# src/js/evidence.mjs:159
js-site-evidence-st-worst = peor caso

# src/js/evidence.mjs:148
js-site-evidence-tolerance = tolerancia { $v }

# src/site.js:277
js-site-filter-in-all = { $total } en total

# src/site.js:276
js-site-filter-matches =
    { $n ->
        [one] { $n } coincidencia
        [many] { $n } de coincidencias
       *[other] { $n } coincidencias
    }

# src/site.js:276
js-site-filter-n-of-m = { $n } de { $total }

# src/site.js:279
js-site-filter-n-of-m-rows = { $n } de { $total } filas

# src/site.js:276
js-site-filter-rows = { $total } filas

# src/js/home.mjs:258
js-site-home-banner-gnss-lost = GNSS perdido · holdover

# src/js/home.mjs:258
js-site-home-banner-holdover-out = Holdover · reloj fuera del margen de guarda

# src/js/home.mjs:259
js-site-home-banner-integrity-holdover = Alarma de integridad · el holdover continúa

# src/js/home.mjs:259
js-site-home-banner-integrity-none = Alarma de integridad · sin nivel de protección

# src/js/home.mjs:259
js-site-home-banner-integrity-pl = Alarma de integridad · PL > AL

# src/js/home.mjs:256
js-site-home-banner-jamming = Jamming · C/N0 cerca del umbral

# src/js/home.mjs:257
js-site-home-banner-spoofing = Alarma de spoofing · detector de RF

# src/js/home.mjs:251
js-site-home-cap-holdover = El jammer sube a { $dbw } dBW: { $trk } satélites en seguimiento. El reloj funciona en marcha libre desde los { $carry } ns que dejó el spoofer y cruza su margen de guarda de { $guard } ns en { $at }; el INS sigue por inercia.

# src/js/home.mjs:252
js-site-home-cap-integrity = Los satélites vuelven, pero solo por encima de una máscara de { $mask }°: { $trk } en seguimiento. El nivel de protección supera el límite de alerta de { $al } m o no puede formarse, así que el monitor da la alarma y el reloj sigue en holdover.

# src/js/home.mjs:249
js-site-home-cap-jamming = Un jammer de banda ancha a { $km } km con { $dbw } dBW. El C/N0 baja a { $cn } dB-Hz, { $above } dB por encima del umbral de seguimiento de { $floor } dB-Hz; los { $trk } satélites siguen en seguimiento.

# src/js/home.mjs:248
js-site-home-cap-nominal = { $trk } satélites en seguimiento con un C/N0 medio de { $cn } dB-Hz. El reloj está disciplinado con la hora GNSS y el nivel de protección ({ $pl } m) queda por debajo del límite de alerta de { $al } m.

# src/js/home.mjs:253
js-site-home-cap-recovery = GNSS resincronizado: { $trk } satélites en seguimiento, el error de tiempo vuelve a { $te } ns, nivel de protección { $pl } m.

# src/js/home.mjs:250
js-site-home-cap-spoofing = Un spoofer desplaza el reloj del receptor a { $rate } ns/s. El detector de RF (radiofrecuencia) da la alarma de inmediato; el monitor asistido por reloj se activa a los { $det } s y termina la fase con { $off } ns arrastrados.

# src/js/home.mjs:120
js-site-home-cn-no-lock = 0 de { $max } en seguimiento · sin enganche

# src/js/home.mjs:120
js-site-home-cn-tracking = { $n } de { $max } en seguimiento

# src/js/home.mjs:114
js-site-home-no-pl = sin PL

# src/js/home.mjs:329
js-site-home-pause = Pausar la misión

# src/js/home.mjs:121
js-site-home-pl-alarm = alarma · PL por encima de AL

# src/js/home.mjs:121
js-site-home-pl-no-sats = sin satélites, sin PL

# src/js/home.mjs:121
js-site-home-pl-not-computed = no se calcula en esta fase

# src/js/home.mjs:121
js-site-home-pl-too-few = muy pocos satélites

# src/js/home.mjs:121
js-site-home-pl-under-al = por debajo del AL de { $thr } m

# src/js/home.mjs:329
js-site-home-play = Iniciar la misión

# src/js/home.mjs:214
js-site-home-receiver-tracking = Receptor · { $n } en seguimiento

# src/js/home.mjs:226
js-site-home-replay-restarted = Reproducción reiniciada · { $file }

# src/js/home.mjs:119
js-site-home-te-disciplined = disciplinado con GNSS

# src/js/home.mjs:119
js-site-home-te-free-running = holdover · marcha libre

# src/js/home.mjs:119
js-site-home-te-outside-guard = holdover · fuera del margen de guarda

# src/js/home.mjs:119
js-site-home-te-spoofer = spoofer arrastrando el reloj

# src/js/home.mjs:60
js-site-home-thr-floor = umbral

# src/js/home.mjs:59
js-site-home-thr-guard = guarda

# src/site.js:408
js-site-kind-action = Acción

# src/js/mcp-player.mjs:92
js-site-mcp-arguments-excerpt = argumentos (extracto)

# src/js/mcp-player.mjs:70
js-site-mcp-axis-mission-time = tiempo de misión

# src/js/mcp-player.mjs:97
js-site-mcp-clock-holdover = holdover de { $clock }

# src/js/mcp-player.mjs:28
js-site-mcp-dir-reply = kshana-mcp → asistente

# src/js/mcp-player.mjs:28
js-site-mcp-dir-request = asistente → kshana-mcp

# src/js/mcp-player.mjs:52
js-site-mcp-figcaption = Dibujado a partir de la serie devuelta: el error de tiempo de cada reloj frente al umbral

# src/js/mcp-player.mjs:46
js-site-mcp-fom-availability = disponibilidad

# src/js/mcp-player.mjs:44
js-site-mcp-fom-caption = Cifras de mérito devueltas por run_scenario, por reloj

# src/js/mcp-player.mjs:45
js-site-mcp-fom-header = Cifra de mérito

# src/js/mcp-player.mjs:46
js-site-mcp-fom-holdover = holdover (s)

# src/js/mcp-player.mjs:46
js-site-mcp-fom-p95 = error de tiempo, percentil 95 (ns)

# src/js/mcp-player.mjs:46
js-site-mcp-fom-rms = error de tiempo, cuadrático medio (ns)

# src/js/mcp-player.mjs:21
js-site-mcp-lede = Registrado { $recorded } · v{ $version } · entrada y salida estándar · protocolo { $protocol } · solo mensajes exactos

# src/js/mcp-player.mjs:73
js-site-mcp-legend-gnss-lost = GNSS perdido a los { $s } s

# src/js/mcp-player.mjs:73
js-site-mcp-legend-threshold = umbral { $v } ns

# src/js/mcp-player.mjs:158
js-site-mcp-pause = Pausar

# src/js/mcp-player.mjs:158
js-site-mcp-play = Reproducir

# src/js/mcp-player.mjs:51
js-site-mcp-plot-aria = Error de tiempo de { $quantum } y { $classical } devuelto por run_scenario, frente al umbral de { $threshold } ns; GNSS (sistema global de navegación por satélite) perdido a los { $lost } s

# src/js/mcp-player.mjs:35
js-site-mcp-recorded-json = JSON registrado: { $label }

# src/js/mcp-player.mjs:96
js-site-mcp-scenario-hash = hash del escenario

# src/js/mcp-player.mjs:81
js-site-mcp-server-identity = identidad del servidor

# src/js/mcp-player.mjs:34
js-site-mcp-show-json = Mostrar JSON

# src/js/mcp-player.mjs:109
js-site-mcp-step-aria = Paso { $n } de { $total }: { $name }

# src/js/mcp-player.mjs:100
js-site-mcp-step-result = resultado: cifras de mérito

# src/js/mcp-player.mjs:137
js-site-mcp-step-status = Paso { $n } de { $total } · { $name }

# src/js/mcp-player.mjs:98
js-site-mcp-summary-excerpt = línea de resumen y resultado (extracto)

# src/js/mcp-player.mjs:100
js-site-mcp-tab-result = resultado

# src/js/mcp-player.mjs:96
js-site-mcp-threshold = umbral

# src/js/mcp-player.mjs:90
js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } línea
        [many] { $n } de líneas
       *[other] { $n } líneas
    }

# src/js/mcp-player.mjs:38
js-site-mcp-toml-more = … ({ $n } líneas más de { $file })

# src/js/mcp-player.mjs:86
js-site-mcp-tool-count =
    { $n ->
        [one] { $n } herramienta
        [many] { $n } de herramientas
       *[other] { $n } herramientas
    }

# src/js/mcp-player.mjs:87
js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } herramienta con descripciones
        [many] { $n } de herramientas con descripciones
       *[other] { $n } herramientas con descripciones
    }

# src/site.js:71
js-site-menu-close = Cerrar el menú

# src/site.js:71
js-site-menu-open = Abrir el menú

# src/js/missions.mjs:658
js-site-missions-avail-title = Disponibilidad: fracción de la ejecución con PDOP ≤ { $limit }

# src/js/missions.mjs:657
js-site-missions-avail-uniform = { $v } % en cada celda

# src/js/missions.mjs:880
js-site-missions-chart-error-title = error de posición (m, log)

# src/js/missions.mjs:875
js-site-missions-chart-four = se necesitan cuatro para una solución

# src/js/missions.mjs:875
js-site-missions-chart-four-short = cuatro para una solución

# src/js/missions.mjs:885
js-site-missions-chart-lg-earth = Tierra visible

# src/js/missions.mjs:885
js-site-missions-chart-lg-error-earth = error, relés y distancia a la Tierra

# src/js/missions.mjs:885
js-site-missions-chart-lg-error-relays = error, solo relés

# src/js/missions.mjs:885
js-site-missions-chart-lg-relays = relés a la vista

# src/js/missions.mjs:876
js-site-missions-chart-relays-title = relés a la vista · sombreado: Tierra sobre el horizonte

# src/js/missions.mjs:564
js-site-missions-chip-at-pdop = con PDOP ≤ { $limit }

# src/js/missions.mjs:570
js-site-missions-chip-engine = Motor:

# src/js/missions.mjs:565
js-site-missions-chip-fix-earth = solución, con la Tierra

# src/js/missions.mjs:564
js-site-missions-chip-median-pdop = PDOP mediano

# src/js/missions.mjs:565
js-site-missions-chip-relays = relés

# src/js/missions.mjs:565
js-site-missions-chip-rms = error RMS

# src/js/missions.mjs:564
js-site-missions-chip-satellites = satélites

# src/js/missions.mjs:567
js-site-missions-chip-tracking-held = { $label } seguimiento mantenido

# src/js/missions.mjs:284
js-site-missions-clocks-aria = Error de tiempo tras un día de holdover, por clase de reloj, escala logarítmica

# src/js/missions.mjs:295
js-site-missions-clocks-frame = umbral del marco { $ns } ns

# src/js/missions.mjs:285
js-site-missions-clocks-note = error de tiempo tras un día, segundos (log)

# src/js/missions.mjs:292
js-site-missions-clocks-sigma = σy(1 s) { $sigma }

# src/js/missions.mjs:290
js-site-missions-clocks-title = { $clock }: { $ns } ns tras un día, σy(1 s) { $sigma }

# src/js/missions.mjs:311
js-site-missions-cone-aria = Cono de error de posición desde la pérdida de GNSS

# src/js/missions.mjs:314
js-site-missions-cone-axis-x = tiempo desde la pérdida de GNSS (s)

# src/js/missions.mjs:315
js-site-missions-cone-axis-y = error de posición (m)

# src/js/missions.mjs:322
js-site-missions-cone-budget = presupuesto de ±{ $m } m

# src/js/missions.mjs:327
js-site-missions-cone-clipped = recortado en ±{ $m } m

# src/js/missions.mjs:324
js-site-missions-cone-leaves = sale a los { $s } s

# src/js/missions.mjs:335
js-site-missions-cone-readout = t { $t } s · { $errors }

# src/js/missions.mjs:479
js-site-missions-copy-command = Copiar comando

# src/js/missions.mjs:479
js-site-missions-copy-title = Copiar el comando que lo reproduce

# src/js/missions.mjs:987
js-site-missions-deterministic = determinista

# src/js/missions.mjs:487
js-site-missions-engine-build = Motor v{ $version }, compilación

# src/js/missions.mjs:590
js-site-missions-engine-build-commit = Motor v{ $version }, compilación { $commit }

# src/js/missions.mjs:393
js-site-missions-fp-aria = Mapa de la huella de jamming. Las teclas de flecha se mueven entre celdas; Intro abre esa ejecución.

# src/js/missions.mjs:370
js-site-missions-fp-aria-svg = Huella de jamming alrededor del jammer

# src/js/missions.mjs:388
js-site-missions-fp-darker = más oscuro = J/S medio más alto · celdas de { $step } km · { $n } ejecuciones del motor

# src/js/missions.mjs:381
js-site-missions-fp-jammer = jammer

# src/js/missions.mjs:385
js-site-missions-fp-lg-held = seguimiento mantenido

# src/js/missions.mjs:385
js-site-missions-fp-lg-lost = todos los satélites perdidos

# src/js/missions.mjs:385
js-site-missions-fp-lg-some = algunas épocas perdidas

# src/js/missions.mjs:418
js-site-missions-fp-open = Abrir esta ejecución en { $studio }

# src/js/missions.mjs:419
js-site-missions-fp-read = a unos { $km } km del jammer · J/S medio { $js } dB · disponibilidad de seguimiento { $av }

# src/js/missions.mjs:382
js-site-missions-fp-ship = el barco del escenario

# src/js/missions.mjs:209
js-site-missions-grades-aria = Deriva inercial libre antes de { $a } m y de { $b } m, por grado de IMU

# src/js/missions.mjs:216
js-site-missions-grades-axis = segundos de deriva tras perderse el GNSS (log)

# src/js/missions.mjs:223
js-site-missions-grades-point = { $grade }: { $s } s hasta { $m } m ({ $why })

# src/js/missions.mjs:210
js-site-missions-grades-reaches = el error llega a { $m } m

# src/js/missions.mjs:211
js-site-missions-grades-speed = a { $v } m/s

# src/js/missions.mjs:221
js-site-missions-grades-this = este escenario

# src/js/missions.mjs:1206
js-site-missions-hud-earth-link = Enlace con la Tierra

# src/js/missions.mjs:1271
js-site-missions-hud-link-above = Enlace con la Tierra · sobre el horizonte

# src/js/missions.mjs:1271
js-site-missions-hud-link-occulted = Enlace con la Tierra · ocultada

# src/js/missions.mjs:1203
js-site-missions-hud-orbiter = Orbitador

# src/js/missions.mjs:1204
js-site-missions-hud-receiver = Receptor

# src/js/missions.mjs:1203
js-site-missions-hud-relays = Relés

# src/js/missions.mjs:1204
js-site-missions-hud-selected-lat = latitud seleccionada

# src/js/missions.mjs:814
js-site-missions-info-in-view = A la vista

# src/js/missions.mjs:814
js-site-missions-info-in-view-value = { $mean } de media · { $fewest } como mínimo

# src/js/missions.mjs:814
js-site-missions-info-pdop-above = { $pdop }, por encima de { $limit }

# src/js/missions.mjs:475
js-site-missions-json-title = El resultado del motor, sin modificar

# src/js/missions.mjs:464
js-site-missions-json-unavailable = JSON no disponible

# src/js/missions.mjs:648
js-site-missions-key-avail = Disponibilidad

# src/js/missions.mjs:855
js-site-missions-key-pdop-title = PDOP medio (dilución de la precisión de posición)

# src/js/missions.mjs:648
js-site-missions-key-vis = Satélites a la vista

# src/js/missions.mjs:648
js-site-missions-key-vis-short = A la vista

# src/js/missions.mjs:595
js-site-missions-leo-grid = de la cuadrícula con PDOP ≤ { $limit }

# src/js/missions.mjs:595
js-site-missions-leo-in-view = a la vista de media

# src/js/missions.mjs:595
js-site-missions-leo-shells = satélites en cuatro capas

# src/js/missions.mjs:809
js-site-missions-map-aria = { $title } sobre { $body }, por celda de 10 grados. Las teclas de flecha mueven el receptor; su celda se lee debajo.

# src/js/missions.mjs:853
js-site-missions-map-colour-by = Colorear el mapa por

# src/js/missions.mjs:715
js-site-missions-map-fewest-in-view = mínimo a la vista

# src/js/missions.mjs:712
js-site-missions-map-grey = gris: sin solución

# src/js/missions.mjs:711
js-site-missions-map-hatched = rayado: por encima del límite de PDOP de { $limit }

# src/js/missions.mjs:774
js-site-missions-map-in-view = a la vista

# src/js/missions.mjs:839
js-site-missions-map-live = { $cell }: { $rows }

# src/js/missions.mjs:715
js-site-missions-map-mean-in-view = media a la vista

# src/js/missions.mjs:715
js-site-missions-map-mean-pdop = PDOP medio

# src/js/missions.mjs:715
js-site-missions-map-pdop-limit = límite de PDOP { $limit }

# src/js/missions.mjs:509
js-site-missions-matrix-caption = Archivos de escenario por sector (filas) y modo de fallo (columnas). Seleccione un recuento para abrir ese sector.

# src/js/missions.mjs:523
js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } archivo de escenario
        [many] { $sector }, { $mode }: { $n } de archivos de escenario
       *[other] { $sector }, { $mode }: { $n } archivos de escenario
    }

# src/js/missions.mjs:525
js-site-missions-matrix-files =
    { $n ->
        [one] { $n } archivo:
        [many] { $n } de archivos:
       *[other] { $n } archivos:
    }

# src/js/missions.mjs:510
js-site-missions-matrix-sector = Sector

# src/js/missions.mjs:492
js-site-missions-mode-int = Interferencia

# src/js/missions.mjs:492
js-site-missions-mode-itg = Integridad

# src/js/missions.mjs:492
js-site-missions-mode-nav = Deriva inercial

# src/js/missions.mjs:492
js-site-missions-mode-orb = Geometría

# src/js/missions.mjs:492
js-site-missions-mode-spf = Spoofing

# src/js/missions.mjs:492
js-site-missions-mode-tim = Temporización

# src/js/missions.mjs:925
js-site-missions-n-of-total = { $n } de { $total }

# src/js/missions.mjs:651
js-site-missions-no-fix = sin solución

# src/js/missions.mjs:487
js-site-missions-no-seed = determinista, sin semilla

# src/js/missions.mjs:471
js-site-missions-open-in-studio = Abrir en { $studio }

# src/js/missions.mjs:472
js-site-missions-open-report = Abrir el informe del motor

# src/js/missions.mjs:954
js-site-missions-ow-chart-aria = Respuesta del receptor durante la ejecución para { $name }: relés a la vista, y error de posición solo con relés y con la distancia a la Tierra

# src/js/missions.mjs:994
js-site-missions-ow-chip-epochs = épocas

# src/js/missions.mjs:994
js-site-missions-ow-chip-mask = máscara

# src/js/missions.mjs:998
js-site-missions-ow-chip-orbiter = orbitador

# src/js/missions.mjs:999
js-site-missions-ow-chip-range = distancia σ

# src/js/missions.mjs:998
js-site-missions-ow-chip-relays = relés

# src/js/missions.mjs:998
js-site-missions-ow-chip-relays-value = { $planes } × { $per } a { $alt } km, { $inc }°

# src/js/missions.mjs:994
js-site-missions-ow-chip-span = intervalo

# src/js/missions.mjs:989
js-site-missions-ow-count-relays = { $n } relés y un orbitador · { $body }

# src/js/missions.mjs:989
js-site-missions-ow-count-sats = { $n } satélites · { $body }

# src/js/missions.mjs:987
js-site-missions-ow-engine = motor v{ $version } · compilación { $commit }

# src/js/missions.mjs:991
js-site-missions-ow-lat-label = Latitud del receptor

# src/js/missions.mjs:940
js-site-missions-ow-map-aria = Respuesta del receptor para { $name }: un mapa de { $body } por celda de 10 grados, con los satélites a la vista, en media y como mínimo, y el PDOP medio por latitud a su lado

# src/js/missions.mjs:1008
js-site-missions-ow-note-imagery = Imágenes de { $body }: NASA.

# src/js/missions.mjs:1007
js-site-missions-ow-note-rebuilt = Órbitas: los relés y el orbitador reconstruidos a partir del escenario exactamente como los construye el motor; el recuento de satélites a la vista que dan coincide con el del motor en las { $n } épocas.

# src/js/missions.mjs:1006
js-site-missions-ow-note-sats = Órbitas: los satélites de la ejecución repropagados aquí y comparados con las { $n } muestras de traza en tierra que escribió el motor (peor caso { $deg }°).

# src/js/missions.mjs:1008
js-site-missions-ow-note-scaled = Los radios de órbita están escalados para la visualización; los planos, la fase y los períodos son los de la ejecución.

# src/js/missions.mjs:1008
js-site-missions-ow-note-tracks = El motor escribió trazas en tierra para { $shown } de los { $total } satélites; los { $total } se dibujan a partir de sus capas.

# src/js/missions.mjs:1005
js-site-missions-ow-note-walker = Órbitas: las capas Walker de la ejecución repropagadas aquí y comparadas con las { $n } muestras de traza en tierra que escribió el motor (peor caso { $deg }°).

# src/js/missions.mjs:994
js-site-missions-ow-off = desactivado

# src/js/missions.mjs:994
js-site-missions-ow-on = activado

# src/js/missions.mjs:1025
js-site-missions-ow-pause = Pausar las órbitas

# src/js/missions.mjs:1025
js-site-missions-ow-play = Reproducir las órbitas
