# docs--campaigns: translations (es)

# text
seg-f917e7fcac09 = Qué es

# text
seg-cae10fb9bff8 = Escenario

# text
# c1: docs/CAMPAIGNS.md
seg-7603033b1c87 = Fuente: <c1/>

# text
# c1: campaign
# c2: kind
# c3: api::run_toml
# c4: kshana <file>.toml
seg-699c946d7d09 = Un escenario individual responde a una pregunta sobre una situación. Una misión es una secuencia de situaciones, y un estudio de diseño es una familia de ellas. El tipo de escenario <c1/> compone los tipos de escenario existentes en una sola ejecución sin reimplementar ninguno: cada miembro es una tabla de escenario ordinaria con su propio <c2/>, despachada mediante <c3/> exactamente como la ejecutaría <c4/>, y la campaña solo vuelve a leer números de los documentos de resultados.

# text
seg-cb4f48673970 = Una campaña es <b>MODELLED</b>. Sus identidades de composición se prueban (más abajo), pero encadenar fases es una decisión de modelado, y cada fase vale tanto como el tipo de escenario que la ejecutó.

# text
seg-80e367fbc391 = Ejecute una como cualquier otro escenario:

# text
seg-9f9995ebc904 = Una campaña puede contener cualquier combinación de cuatro secciones; una sin ninguna se ejecuta y su resumen indica que no compuso nada.

# text
# c1: [[phases]]
seg-002ddd72b3a2 = <c1/>: una misión encadenada en una sola línea temporal

# text
# c1: [timeline] step_s
seg-e99c4453b79d = Cada fase ejecuta uno o más escenarios sobre una ventana de una línea temporal de misión compartida, por ejemplo un reloj en holdover y un sistema de navegación inercial (INS) avanzando por inercia al mismo tiempo. Las salidas de cada ejecución se leen en <b>canales</b> con nombre, se sitúan en el instante de inicio de la fase y se remuestrean a una rejilla común (<c1/>) mediante retención de orden cero: un instante de la rejilla toma la última muestra de la ejecución de la fase propietaria en ese instante o antes, y es nulo donde ninguna ejecución de esa fase proporciona el canal.

# text
seg-842b77a21c5f = Canal

# text
seg-b2eb598fab2a = Fuente predefinida

# text
seg-f42465f7d066 = ns

# text
seg-fdb4600bf100 = error de tiempo del reloj

# text
seg-aef6b877191d = guarda de error de tiempo

# text
# c1: threshold_ns
seg-cc989ca58f1d = el <c1/> propio de la ejecución

# text
seg-5e9f7cd33017 = relación media efectiva portadora-densidad de ruido (C/N0) sobre los satélites visibles

# text
# c1: jamming
# c2: epochs[].sats[].cn0_effective_dbhz
seg-af6f07319f2d = <c1/>: media de <c2/>

# text
seg-f6b4ea158327 = límite de pérdida de seguimiento

# text
# c1: jamming
# c2: tracking_threshold_dbhz
seg-126535297c32 = <c1/>: el <c2/> del escenario, cuando lo indica

# text
seg-f8f430695a88 = satélites que siguen en seguimiento

# text
seg-3f9a9f33010b = nivel de protección vertical

# text
seg-2cfc68fa1c15 = límite de alerta vertical

# text
seg-d165177a255c = error de posición

# text
seg-29651ae6be6f = umbral de error de posición

# text
seg-c893c5e3ace5 = { "1" } mientras cualquier monitor de la fase da alarma

# text
seg-ade1d7072512 = véase más abajo

# text
# c1: <side>
# c2: classical
# c3: side = "quantum"
# c4: [[phases.runs.series]]
# c5: []
# c6: epochs[].t
# c7: input:
# c8: mean
# c9: min
# c10: max
# c11: count
seg-e8c7ac7d117f = <c1/> es <c2/> salvo que la ejecución establezca <c3/>. Cualquier otra magnitud se lee con una entrada <c4/> explícita: una ruta de tiempo con un <c5/> que nombra las filas (<c6/>), una ruta de valor que comparte esas filas o un escalar difundido a cada fila (el prefijo <c7/> lee el escenario de la ejecución en lugar de su resultado), una reducción opcional (<c8/>, <c9/>, <c10/>, <c11/>) para varios valores bajo una misma fila, una escala y una unidad para un canal que la campaña no conoce.

# text
seg-7d7bc5d19a61 = Las <b>alarmas</b> proceden de tres lugares, combinados con OR lógico dentro de una fase:

# text
# c1: jamming
# c2: integrity
seg-74a10f5283ec = indicadores predefinidos leídos de la ejecución: <c1/> da alarma mientras siguen a menos de cuatro satélites (su propia definición de disponibilidad); <c2/> da alarma en las épocas que marca como no disponibles;

# text
# c1: carry
# c2: clock
# c3: guard_ns
# c4: gnss-ins
# c5: position_threshold_m
# c6: [[phases.runs.alarms]]
seg-f22be2880015 = reglas predefinidas sobre los canales de la fase, evaluadas <b>después de</b> <c1/>: <c2/> da alarma mientras el error de tiempo absoluto supera <c3/>; <c4/> mientras el error de posición supera <c5/>; las reglas explícitas van en <c6/>;

# text
# c1: spoof
# c2: detect_time_s
# c3: spoof-detect
seg-ccd94a7cb652 = eventos de alarma: <c1/> genera uno en el <c2/> de su monitor asistido por reloj; <c3/> genera uno al inicio de la fase cuando su decisión fusionada da alerta.

# text
seg-f88b8ad5672f = <b>El estado se transmite</b> entre fases de tres maneras explícitas:

# text
# c1: carry = ["time_error_ns"]
seg-0e3a0ee8e172 = <c1/> suma el valor del canal al final de la fase anterior a los valores de esta fase. La fase de reloj que un spoofer desplazó es el punto desde el que arranca el holdover. Sumar el desfase es exacto para la fase del reloj, que integra la frecuencia; para un error de posición supone que los dos errores son colineales, el caso pesimista.

# text
# c1: [[phases.handoff]]
# c2: channel:<name>
seg-4db8b11391a5 = <c1/> escribe un número de la fase anterior (<c2/> para el valor final de un canal, o cualquier ruta de resultado de una ejecución anterior) en una clave con puntos del escenario de esta fase antes de que se ejecute, con una escala y un desfase opcionales.

# text
# c1: end_at = "<result path>"
# c2: duration_s
# c3: classical.detect_time_s
seg-fdd5aa8b9627 = <c1/> termina la fase en un instante calculado por una ejecución, limitado por <c2/>. La misión incluida termina su fase de spoofing en <c3/>.

# text
# c1: skip_s
seg-cdd64676f509 = <c1/> descarta los primeros segundos de la propia línea temporal de una ejecución (un calentamiento) antes del instante cero de la fase.

# text
seg-d48bcd9890d3 = La misión incluida

# text
# c1: scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-52fc5abca41f = <c1/> ejecuta { "18" } escenarios miembros en seis fases sobre una rejilla de { "10" } s:

# text
seg-baea4e05ad26 = Fase

# attr:aria-label, text
seg-9d3ee6a5613e = Ejecuciones

# text
seg-87fbeeb9abb9 = Qué muestra la línea temporal

# text
seg-82bebc2bb038 = nominal, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-cf54dae64cb7 = <c1/>, <c2/> (sin inhibidor), <c3/>

# text
seg-5cb80e4a7d4d = error de tiempo { "0" } ns; C/N0 { "43.0" } dB-Hz frente a un límite de { "25" } dB-Hz; nivel de protección vertical de { "9.1" } a { "21.6" } m frente a un límite de alerta de { "50" } m

# text
seg-13c92a72544a = jamming, { "600" } s

# text
seg-f9c01304734d = igual, inhibidor a -30 dBW, { "1" } km

# text
seg-27d3b65152b0 = el C/N0 baja a { "27.7" } dB-Hz, los { "8" } satélites siguen en seguimiento

# text
# c1: end_at
seg-6a052db03815 = spoofing, terminado a los { "370" } s por <c1/>

# text
# c1: spoof
# c2: spoof-detect
# c3: jamming
seg-89856c1f83f8 = <c1/> (rampa de tiempo de { "0.1" } ns/s), <c2/>, <c3/>

# text
seg-cfcdd96b1132 = el error de tiempo sube en rampa hasta { "36" } ns; el detector de radiofrecuencia da alarma al inicio de la fase, el monitor asistido por reloj a los { "370" } s

# text
seg-92c8a76b84c2 = holdover, { "1800" } s

# text
# c1: clock
# c2: gnss-ins
# c3: jamming
seg-8a6e0b2898d1 = <c1/> (denegado, arrastra { "37.0" } ns), <c2/> (unidad táctica avanzando por inercia), <c3/> a { "10" } dBW

# text
seg-1948491e25ec = todos los satélites perdidos (C/N0 de unos -12 dB-Hz); error de tiempo de { "36.4" } a { "62.7" } ns frente a la guarda de { "50" } ns; error de posición hasta { "24" } km

# text
seg-93e59087dd44 = integrity-alarm, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-f28f37baf8fe = <c1/> (arrastra { "59.6" } ns), <c2/> y <c3/> con una máscara de { "25" } deg

# text
seg-83d890c819f8 = { "5" } satélites en seguimiento; nivel de protección de { "19" } a { "135" } m, ausente en { "18" } de { "60" } instantes de la rejilla; el error de tiempo arrastrado, de { "52.1" } a { "61.7" } ns, permanece por encima de la guarda de { "50" } ns, de modo que la alarma está activa durante toda la fase

# text
seg-1ab40b7893db = recovery, { "600" } s

# text
seg-181d2a2f800b = el error de tiempo vuelve a { "0" } ns; alarma en silencio

# text
# c1: integrity
seg-26ef3dc422ff = Las ejecuciones de integridad usan la propia trayectoria de usuario del ejemplo <c1/> (una trayectoria circular a { "0.4" } km de altitud), no el emplazamiento fijo del receptor de jamming, y la máscara de { "25" } deg representa el cielo parcial de un receptor que se está readquiriendo. Son decisiones de escenario, indicadas en el archivo.

# text
seg-03ae98f17988 = Una misión impulsada por el espectro de banda L

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: jamming
# c4: scenarios/l-band-waterfall-jamming.toml
seg-5daf8c8fdd83 = <c1/> ejecuta { "8" } escenarios miembros en tres fases sobre una rejilla de { "1" } s, con el C/N0 de GPS L1 C/A y de Galileo E1 leído del tipo de escenario <c2/> (véase <a1>SPECTRUM.md</a1>) en lugar de la tabla por satélite del tipo de escenario <c3/>. Los inhibidores son los de <c4/>.

# text
# c1: end_at
seg-7f34a00af961 = onset, terminada a los { "10" } s por <c1/>

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-471ec0d86f76 = <c1/>, <c2/> (chirp desde los { "10" } s), <c3/>

# text
# c1: timeline.bands[0].first_loss_t_s
seg-00b032242ebc = L1 C/A { "43.48" } y E1 { "44.73" } dB-Hz; la fase termina en la primera pérdida de L1 C/A de la propia ejecución de espectro (<c1/>); nivel de protección de { "21.6" } m frente a { "50" } m

# text
seg-50220d719d5d = holdover, { "600" } s

# text
# c1: clock
# c2: spectrum
seg-50de7cd69ac0 = <c1/> (denegado, arrastra el error del onset, aquí { "0" } ns), <c2/> (chirp activo)

# text
seg-1d59e94d94e5 = L1 C/A { "3.38" } y E1 { "4.44" } dB-Hz, ambos por debajo del límite de { "25" } dB-Hz; error de tiempo de -0.07 a { "5.06" } ns frente a la guarda de { "50" } ns; alarma activa

# text
seg-6c56497d74fb = galileo-fallback, { "300" } s

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-62bcfd3e8732 = <c1/> (resincronizado), <c2/> (tono CW en la portadora L1), <c3/> sobre un Walker 24/3/1 de tipo Galileo

# text
seg-d455f0c06ee6 = L1 C/A se mantiene en { "17.98" } dB-Hz, E1 vuelve a { "44.73" } dB-Hz; nivel de protección de { "6.1" } a { "17.7" } m; alarma en silencio

# text
seg-2db37e292efe = La recuperación de E1 bajo el tono CW se apoya en el tratamiento de espectro continuo del tipo de escenario de espectro: el tono cae en el nulo del espectro MBOC y no acopla nada. Un tono real acoplaría a través de las líneas espectrales del código; esto se indica en el archivo y en SPECTRUM.md.

# text
# c1: [sweep]
seg-fb8d8636c554 = <c1/>: una rejilla de parámetros sobre cualquier tipo de escenario

# text
# c1: sweep-nd
# c2: runs > 1
# c3: k
# c4: k
# c5: scenarios/campaign-sweep-jammer-power.toml
seg-b14a11d60e9f = De una a tres claves de escenario con puntos, cada una sobre un rango lineal o logarítmico, sobre los mismos valores de eje que usa el tipo de escenario <c1/>. Cada eje tiene un nombre y una unidad; cada métrica tiene un nombre y una ruta de resultado, y su unidad se lee del propio bloque de unidades del tipo de escenario barrido, salvo que la campaña declare una. Con <c2/>, cada nodo es un conjunto de Monte Carlo con semilla (la realización <c3/> con la semilla del nodo más <c4/>), que se informa con las estadísticas siguientes. <c5/> barre un inhibidor a { "1" } km del receptor desde -50 hasta +{ "10" } dBW: la relación media inhibidor-señal se mueve exactamente { "1" } dB por dB (de { "12.2" } a { "72.2" } dB), y la disponibilidad cae de { "1" } a { "0" } entre -30 y -25 dBW.

# text
# c1: system.2.sisre_m
# c2: sisre_m
# c3: [[system]]
# c4: case.0.system.0.shell.0.altitude_km
seg-c1931e311cca = Una clave con puntos puede indexar por posición una matriz de tablas: <c1/> es el <c2/> de la tercera tabla <c3/>, y <c4/> llega tres niveles más abajo.

# text
# c1: [monte_carlo]
seg-e774c578906d = <c1/>: un conjunto con semilla

# text
# c1: k
# c2: base_seed + k
# c3: classical.series[-1].error_ns
seg-bbacb9c66f92 = La realización <c1/> ejecuta el escenario con su clave de semilla establecida en <c2/>, la convención que ya usa el conjunto de relojes, de modo que el conjunto se reproduce exactamente. Cada métrica informa la media, la desviación típica poblacional, los percentiles 5, 50 y 95 por rango más cercano, un intervalo de confianza del { "95" }% de la media por bootstrap de percentiles con semilla fija ({ "2000" } remuestreos) y, por defecto, todas las muestras en orden de semilla. Las rutas de resultado pueden indexar matrices: <c3/> es la última muestra.

# text
# c1: [compose]
seg-ed182d15151d = <c1/>: varios escenarios bajo condiciones compartidas

# text
# c1: scenarios/campaign-shared-jammer-sea-road.toml
seg-26fab14de534 = Los valores compartidos con nombre (un número o una matriz de números, con una unidad) se escriben en cada miembro en las claves a las que los vincula, de modo que los miembros no puedan discrepar sobre la condición compartida. Cada miembro se ejecuta y, para cada métrica, el resumen combinado da el valor más pequeño, el más grande y la media entre los miembros, nombrando el mejor y el peor. <c1/> coloca un inhibidor de { "8" } dBW entre un barco en el golfo de Finlandia (a unos { "30" } km) y un coche en una carretera costera de Helsinki (a unos { "50" } km): el barco pierde todos los satélites (relación media inhibidor-señal de { "39.0" } dB) mientras que el coche conserva al menos cuatro ({ "34.6" } dB).

# text
# c1: [optimize]
seg-c888630c92d7 = <c1/>: el mejor valor de una métrica

# text
# c1: [lo, hi]
# c2: lin
# c3: log
# c4: goal = "minimize"
# c5: "maximize"
# c6: "target"
# c7: target
seg-b54f0deedd0f = De una a tres claves de escenario con puntos, cada una acotada a <c1/> en una escala <c2/> o <c3/>, se exploran en busca del mejor valor de una métrica (<c4/>, <c5/> o <c6/>, que minimiza la distancia a <c7/>).

# text
seg-b57ec5e5168a = Hay dos métodos:

# text
# c1: method = "grid"
# c2: steps
seg-8fba07ce0cde = <c1/> ejecuta todos los nodos de una rejilla de <c2/> por clave, sobre los valores de eje del barrido.

# text
# c1: method = "nelder-mead"
# c2: max_evals
# c3: step
# c4: ftol
# c5: xtol
seg-844a7c1e3578 = <c1/> (el predeterminado) ejecuta un símplex de Nelder–Mead determinista en coordenadas normalizadas a [{ "0" }, { "1" }] por clave. Los puntos de prueba se proyectan sobre la caja. La sección admite <c2/>, un <c3/> inicial y las tolerancias de parada <c4/> y <c5/>.

# text
# c1: runs > 1
# c2: best_coords
# c3: best_metric
# c4: best_score
# c5: evals
# c6: stop_reason
# c7: trace
seg-2b1159b467f8 = Una ejecución cuya métrica falta o no es finita obtiene la peor puntuación, y se conserva en la traza. Con <c1/>, la métrica es la media sobre las mismas semillas en cada evaluación. El resultado da <c2/>, <c3/>, <c4/>, <c5/>, <c6/> y todas las evaluaciones en <c7/>.

# text
# c1: scenarios/campaign-optimize-link-budget.toml
seg-778a40736e7b = <c1/> busca el alcance y la tasa de datos para un margen de enlace de { "3" } dB. El óptimo es local a la caja y al punto de partida. Es MODELLED, nunca una afirmación global.

# text
# c1: docs/design/evidence/cap32-optimize/
# c2: tests/campaign_optimize_reference.rs
seg-b94ab5e6dad4 = El protocolo y sus umbrales preregistrados están en <c1/>. La prueba es <c2/>. Los resultados:

# text
seg-232c68472fa4 = una resolución de objetivo 1-D coincide con la forma cerrada hasta { "6e-15" };

# text
seg-22f7abf70fc4 = el método de rejilla coincide bit a bit con un bucle de fuerza bruta independiente;

# text
seg-faea43f01e37 = el símplex lo hace al menos igual de bien que la rejilla de { "41" } × { "41" }, con aproximadamente una décima parte de sus ejecuciones.

# text
seg-df1533fe6b95 = El umbral 1-D de la ronda { "1" } queda registrado como NOT MET: la caja preregistrada excluía la solución.

# text
# c1: scenario_hash
# c2: reproducibility
# c3: run_digest
# c4: scenario_hash
seg-0862a4e9aa61 = Todo resultado de campaña lleva <c1/>, el SHA-256 (Secure Hash Algorithm { "2" }, resumen de 256 bits) de la forma canónica en JavaScript Object Notation (JSON) del documento de la campaña (el orden de las claves y el formato no lo cambian), y un bloque <c2/> con el número de ejecuciones de miembros y <c3/>, un SHA-256 sobre el resumen de cada resultado de miembro en orden de despacho. Dos ejecuciones con el mismo resumen produjeron resultados de miembros idénticos byte a byte. Cada ejecución de fase registra además su tipo de escenario, su propio <c4/> cuando el tipo de escenario lo tiene, y el SHA-256 de su documento de resultados. Cada número del documento tiene una entrada de unidades.

# text
seg-2eeddb87e889 = El núcleo es secuencial y no lee archivos, de modo que una campaña se ejecuta sin cambios en la compilación a WebAssembly. Las campañas no pueden contener campañas.

# text
seg-f9b8b78dd64a = Exportaciones

# text
# c1: --export
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
seg-c4443bf160f7 = <c1/> sobre una campaña escribe cada escenario miembro que tiene geometría como su propio conjunto de archivos, con la etiqueta del miembro insertada antes del sufijo del formato: cada ejecución de fase (<c2/>, o <c3/> cuando la fase tiene varias ejecuciones), el escenario base del barrido (<c4/>), el escenario de Monte Carlo (<c5/>) y cada miembro compuesto (con su propia etiqueta y los valores compartidos que vincula ya escritos). Un miembro idéntico a uno anterior se escribe una sola vez; los traspasos y los valores de barrido o de semilla aplicados en tiempo de ejecución no figuran en los escenarios exportados.

# text
seg-0ba270495309 = Un formato que ninguno de los miembros puede describir se rechaza indicando ese motivo. La tabla por escenario está en <a1>INTEROP.md</a1>.

# text
seg-c20904c9d3b5 = Campañas LEO-PNT

# text
seg-a598e2c06f51 = Quince campañas incluidas plantean cuestiones de posicionamiento, navegación y temporización (PNT) en órbita terrestre baja (LEO); <a1>LEO-PNT.md</a1> describe lo que muestra cada una. Lo que ejecuta cada una, tal como lo resume la línea de comandos:

# text
seg-f65b1f2b4182 = Modo

# text
seg-e7d7defa7e71 = Pregunta

# text
seg-08ab59acfe62 = compose, { "4" } miembros

# text
seg-a21e4db0fda9 = datos de servicio del mensaje de navegación frente a la longitud de trama

# text
# c1: leo-pvt
seg-6c29f4690d2c = barrido de <c1/>, { "7" } nodos

# text
seg-97fba77aa2ec = posicionamiento fusionado MEO y LEO frente al error de alcance de la señal en el espacio (SISRE) de LEO

# text
seg-7b9fbe34d38c = compose, { "2" } miembros

# text
seg-28352bd0c9e3 = LEO-PNT en interiores por banda y clase de edificio

# text
# c1: leo-pass
seg-a447c56022ec = barrido de <c1/>, { "9" } nodos

# text
seg-5b3cbfced221 = energía por fijación del Internet de las cosas (IoT) frente a la potencia de transmisión UHF de LEO

# text
# c1: ntn-positioning
seg-3ebd95e5933a = barrido de <c1/>, { "9" } nodos

# text
seg-cfbac004ff64 = posicionamiento en redes no terrestres (NTN) frente al ancho de banda de la señal de referencia

# text
# c1: leo-ppp
seg-07e8765975d1 = barrido de <c1/>, { "3" } nodos

# text
seg-db872d35033e = convergencia del posicionamiento preciso de punto (PPP) frente a la altitud de una capa LEO de 192 satélites

# text
seg-a4ec677dc4e6 = chain, { "3" } fases durante { "2100" } s

# text
seg-2d91ecf8455d = Sistema global de navegación por satélite (GNSS) inhibido, la capa LEO lleva al usuario, integridad mantenida

# text
# c1: spectrum
seg-c44991a2a24e = barrido de <c1/>, { "13" } nodos

# text
seg-4b6e292d88f5 = diversidad de bandas LEO frente a un inhibidor de barrera en banda L

# text
seg-30d86b528bee = los monitores de spoofing frente a cuatro spoofers

# text
seg-1690baf3a1b8 = chain, { "1" } fase durante { "86 400" } s

# text
seg-4d5b507c04de = temporización de estaciones base 5G: holdover y tiempo LEO

# text
seg-d32a80c40470 = chain, { "3" } fases durante { "1440" } s

# text
seg-c38f9d3bd54e = seguimiento de contenedores con UHF LEO: energía por fijación a lo largo de un trayecto

# text
seg-9bf38e403696 = chain, { "2" } fases durante { "1500" } s

# text
seg-dea7117552f4 = un vehículo autónomo en un cañón urbano con una capa LEO

# text
seg-dbbd9ffcbfb4 = chain, { "2" } fases durante { "1800" } s

# text
# c1: city-street
seg-37c0c3570023 = el mismo cañón urbano como un corte plano de { "35" } deg y como un perfil del horizonte <c1/>

# text
seg-ccaa34122145 = chain, { "2" } fases durante { "87 000" } s

# text
seg-d16d8b2e9089 = temporización de infraestructuras críticas: holdover con tiempo LEO

# text
seg-4ee0b3036f4a = chain, { "3" } fases durante { "10 800" } s

# text
seg-157c5bec7f5f = usuarios polares y árticos con una capa LEO polar

# text
seg-64404160d0e7 = chain, { "3" } fases durante { "2520" } s

# text
seg-a35e1603ba32 = usuarios ferroviarios y marítimos con una capa LEO

# text
seg-3d819fa3fd1c = MEO es órbita terrestre media, UHF ultra alta frecuencia y 5G la quinta generación de redes móviles.

# text
seg-490920844143 = Qué se comprueba

# text
# c1: tests/campaign_composition_reference.rs
seg-483b1d4efb20 = <c1/> fija las identidades de composición:

# text
# c1: clock
# c2: integrity
# c3: jamming
# c4: run_toml
seg-881d97a3fa2b = <b>Una campaña de una sola fase reproduce la ejecución independiente bit a bit.</b> Para <c1/>, <c2/> y <c3/>, el documento de resultados del miembro es idéntico byte a byte a <c4/> sobre el archivo del escenario, su resumen es el que informa la campaña y, con la rejilla al paso propio de la ejecución, cada valor alineado es igual al valor de la serie independiente (el C/N0 de jamming es igual a la media calculada de forma independiente a partir del documento independiente).

# text
seg-1a9e1ed5b18c = <b>Un barrido de un nodo y una composición de un miembro</b> leen exactamente el número independiente.

# text
# c1: k
# c2: seed + k
seg-883bb72e1239 = <b>Un conjunto con semilla fija es estable byte a byte</b>, y la realización <c1/> es exactamente la ejecución independiente en <c2/>; el hash de la campaña ignora el orden de las claves.

# text
seg-170bc86059fa = Un caso analítico.

# text
# c1: scenarios/campaign-monte-carlo-clock-holdover.toml
seg-0fd27291d6f4 = <c1/> ejecuta { "200" } semillas de un reloj atómico a escala de chip con solo ruido blanco de frecuencia (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), sincronizado hasta { "590" } s y avanzando por inercia hasta { "3600" } s. El error de tiempo final es gaussiano con media { "0" } y desviación típica sqrt(q_wf * { "3010" } s) = { "16.459" } ns (el paseo aleatorio de la fase bajo ruido blanco de frecuencia, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). El intervalo informado, [-2.52, { "1.59" }] ns, contiene la media verdadera { "0" }; la desviación típica muestral, { "14.93" } ns, da un estadístico chi cuadrado de { "164.5" } con { "199" } grados de libertad, dentro del intervalo bilateral del { "99" }% [{ "151.37" }, { "254.14" }]. Con { "3000" } semillas el mismo escenario da { "16.31" } ns.

# text
seg-61b54a16243f = <b>La cadena impulsada por el espectro</b> lee los números independientes: la fase de onset dura exactamente el tiempo de primera pérdida de la ejecución de espectro, y cada valor de L1 C/A y E1 de la línea temporal es igual, con una diferencia de { "1e-9" } dB, a la fila del ejemplo de cascada independiente para el mismo estado del inhibidor (nominal, solo chirp, solo tono CW).

# text
seg-5ebc02a24ce1 = <b>La cadena</b> transmite el estado como está documentado: la fase de spoofing dura exactamente el tiempo de detección de la ejecución de spoofing, el holdover arrastra exactamente el desfase de la ejecución de spoofing en la detección, la recuperación no arrastra nada, y la alarma está activa siempre que el nivel de protección falta o supera el límite de alerta.

# text
seg-153e28bcb38a = Estas comprobaciones verifican que componer no cambia nada que no deba cambiar. No validan una misión encadenada frente a una medida, y por eso las tres filas de campaña de <a1>VERIFICATION-MATRIX.md</a1> son MODELLED.

# text
seg-e82860f2d902 = <s1>Anterior</s1>Uso de TLE reales

# text
seg-e40757a0b4cb = <s1>Siguiente</s1>Informes de ejecución

# text
seg-e65edbaca6bf = [[phases]]: una misión encadenada en una sola línea temporal

# text
seg-a433ddf74e55 = [sweep]: una rejilla de parámetros sobre cualquier tipo de escenario

# text
seg-7ca90ac531bf = [monte_carlo]: un conjunto con semilla

# text
seg-03d764a4cb56 = [compose]: varios escenarios bajo condiciones compartidas

# text
seg-61a0db2550ba = [optimize]: el mejor valor de una métrica
