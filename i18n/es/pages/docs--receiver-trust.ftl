# docs--receiver-trust: translations (es)

# text
seg-adc34608c46b = Clase

# text
seg-2247a2344710 = Significado

# text
seg-fdbb9db68f1d = ninguna

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-98151954f217 = false

# text
seg-c353e7bec219 = Clave

# text
seg-cc38b40eb7a5 = Monitor

# text
seg-7670cf4ceda3 = Valor por defecto

# text
seg-a0cc45088f5f = GSV

# attr:alt
seg-26ab8544afba = Puntuación de confianza a lo largo de una travesía sintética, a partir de una ejecución real del motor v{ $version } sobre examples/maritime-trust (un registro NMEA inventado de un transbordador en una ruta de Tallin a Helsinki, { "3001" } épocas a { "1" } Hz). Tres carriles comparten un eje de tiempo. Arriba: la distancia entre la posición que notifica el receptor y la posición real del buque, que se mantiene dentro de unos pocos metros hasta unos { "1576" } s, cuando el arrastre de posición programado en el registro la aparta, mientras el receptor sigue notificando una posición válida. En medio: la puntuación de confianza de { "0" } a { "100" }, no calculada durante los primeros { "300" } s de calibración, en la banda nominal (al menos { "90" }) hasta el arrastre y luego descendiendo por la banda degraded (al menos { "55" }) hasta la banda untrusted. Abajo: la banda de cada época como una cinta de color con su nombre. La puntuación es consultiva. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque. El registro es inventado para mostrar el formato y los monitores; no es una medición y no dice nada sobre cómo funcionaría ningún receptor.

# attr:alt
seg-7000c522cc93 = La bandera de spoofing propia del receptor frente a las alarmas de Kshana, a partir de una ejecución real del motor v{ $version } sobre un registro UBX inventado ({ "200" } épocas a { "1" } Hz). El C/N0 cae { "20" } dB entre { "80" } y { "90" } s y entre { "120" } y { "130" } s; el receptor marca de { "120" } a { "130" } s y de { "160" } a { "165" } s. De { "140" } épocas comparadas tras la calibración, { "11" } tuvieron ambos marcando, { "6" } solo el receptor, { "11" } solo Kshana y { "112" } ninguno. Ninguno de los dos lados es verdad de referencia y la coincidencia no es validación. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# text
# c1: docs/RECEIVER-TRUST.md
seg-caadaad98cf6 = Fuente: <c1/>

# text
seg-4f10c2397fcc = Confianza del receptor: evaluación de un registro real de receptor GNSS

# text
# c1: kshana receiver-trust
seg-2596bdcdaf8e = <c1/> lee un registro de un receptor real del sistema global de navegación por satélite (GNSS), ejecuta monitores de confianza sobre él época a época e indica cuándo y por qué la solución del receptor dejó de ser fiable. También puede puntuar el registro frente a eventos y predicciones que usted declare <b>antes</b> de la ejecución: si cada evento se detectó a tiempo y si una caída modelada de la relación portadora/densidad de ruido (C/N0) concuerda con lo que midió el receptor.

# text
seg-63f24d5f2d5e = Los observables son los del propio receptor; los monitores y sus umbrales son los del motor y los suyos. Cada resultado lleva esa etiqueta, el SHA-256 del registro y todos los umbrales con los que se ejecutó, de modo que una ejecución puede repetirse y auditarse.

# text
# c1: MARITIME-TRUST.md
seg-6f5014b93fbc = Para una embarcación en navegación, con una puntuación en vivo y una puerta opcional delante de un sistema de cartas, véase <a1><c1/></a1>.

# text
# c1: session.result.json
# c2: session.trust.csv
# c3: session.trust.svg
# c4: path
seg-82cdabb6086f = Esto escribe <c1/>, <c2/> (una fila por época) y <c3/> (C/N0 medio a lo largo del tiempo con el estado de confianza debajo) junto al escenario, e imprime un veredicto de una línea. El registro de ejemplo es sintético, hecho para mostrar el formato; apunte <c4/> al registro de su propio receptor.

# text
# c1: MARITIME-TRUST.md
seg-ec2be1ea73f5 = La figura anterior es la demostración de embarcación de <a1><c1/></a1>: un registro inventado, una puntuación orientativa.

# text
# c1: kshana.receiver_trust(toml)
# c2: receiver_trust(toml)
# c3: assess_receiver_log
seg-0f24c5cf4b9b = El mismo escenario se ejecuta desde Python (<c1/>), desde el paquete WebAssembly (<c2/>, con el registro en línea) y desde la herramienta <c3/> del servidor del Model Context Protocol (MCP).

# text
seg-1f3cc12b6230 = Registros que lee

# text
seg-23fd4a5bf5dd = Qué se lee

# text
seg-2e1a655cf846 = Binario de u-blox

# text
# c1: jamInd
# c2: spoofDetState
# c3: self_report
seg-cb31da7b7d88 = NAV-SAT C/N0, elevación y acimut por satélite, posición de NAV-PVT, control automático de ganancia (AGC) de MON-RF y el indicador de jamming <c1/>, semana de NAV-TIMEGPS y los indicadores propios del receptor: NAV-STATUS <c2/> y SEC-SIG (<c3/>, véase <a1>RECEIVER-PROTOCOLS.md</a1>)

# text
seg-cec582f4afa5 = Archivo de observación RINEX { "3" }

# text
# c1: S
# c2: nav
seg-57708a636148 = códigos <c1/> (C/N0) por satélite y señal; con un archivo de navegación de radiodifusión (<c2/>), las pseudodistancias para la solución propia del motor

# text
seg-176c2493782e = CSV de Android GnssLogger

# text
# c1: Raw
# c2: AgcDb
# c3: Fix
seg-d69b9dd6ebad = filas <c1/>: C/N0 y <c2/> por satélite; filas <c3/>: posición

# text
seg-d390120374a9 = Texto NMEA { "0183" }

# text
seg-9eb885aa79af = GSV relación señal/ruido por satélite (dB-Hz, con o sin el identificador de señal { "4.10" }) y su elevación y acimut, GSA dilución de la precisión y satélites usados, GGA y RMC hora y posición

# text
seg-7864926ce37e = Binario de Septentrio ({ "0.38" }, solo lectura)

# text
seg-44675c4bdf40 = posición de PVTGeodetic, C/N0 de MeasEpoch por satélite y señal, recuento de bandas de RFStatus; véase <a1>RECEIVER-PROTOCOLS.md</a1>

# text
# c1: .pos
seg-a5367d75c5ee = Archivo de solución de RTKLIB (<c1/>)

# text
seg-37d28ca5ed00 = hora, posición (latitud/longitud o ECEF, convertida) y satélites usados por época; los archivos en grados-minutos-segundos se rechazan con un mensaje

# text
seg-5e10ecb93f96 = Registros ASCII o binarios de NovAtel OEM7

# text
# c1: BESTPOS
# c2: RANGE
# c3: RXSTATUS
# c4: self_report
# c5: receiver-self-report
seg-a630fbcf7425 = posición de <c1/> (solo si se calculó solución), C/No de <c2/> por satélite y señal; los indicadores de jammer de <c3/> pasan a ser el <c4/> de la época (estado de jamming { "2" } cuando el receptor señala un jammer, { "1" } cuando no; en RXSTATUS no existe indicador de spoofing), contrapuestos a las alarmas de Kshana mediante la comparación <c5/>

# text
seg-d4735b581cbf = Flujos Monitor y PVT-monitor de GNSS-SDR como líneas JSON

# text
# c1: integrations/gnss-sdr/relay.py
seg-053235d67fb3 = C/N0 por canal, solución, satélites usados, HDOP, acimut y elevación; generado por <c1/>

# text
# c1: MACHINE-INPUTS.md
seg-2e9033aa4e9d = Detalles, fuentes y límites de estos tres: <a1><c1/></a1>.

# text
# c1: source_span
# c2: [start, end)
# c3: >
# c4: Raw
# c5: Fix
# c6: Raw
seg-8987b2c46eb0 = Cada época que producen los lectores lleva además <c1/>, desplazamientos de bytes <c2/> en la entrada: el menor rango contiguo que contiene los registros que contribuyeron a ella, de modo que el fragmento bruto exacto pueda someterse a hash para una ventana de eventos. NMEA: cada línea leída mientras la época está en curso (un superconjunto cuando una línea no relacionada se sitúa entre sus sentencias). UBX: las tramas de la época. RINEX { "3" }: los registros de época desde cada línea <c3/> hasta la siguiente. Android: las filas <c4/> de la época (una fila <c5/> solo para una época sin filas <c6/>). Ausente en un flujo en vivo y donde no está bien definido (RINEX { "2" }).

# text
# c1: path
# c2: text
# c3: base64
seg-cea9532b57a2 = El archivo se introduce mediante <c1/> (resuelto respecto a la propia carpeta del escenario) o en línea como <c2/> o <c3/> (las únicas opciones en un navegador).

# text
seg-3bc4f9c91950 = Un registro de IMU como segundo sensor

# text
# c1: [log.imu]
seg-49b10ad5928e = <c1/> añade un registro inercial sobre el mismo reloj:

# text
# c1: heading0_deg
# c2: heading-course
# c3: heading_sensor = true
# c4: hdg_cog_tol_deg
# c5: csv
# c6: MACHINE-INPUTS.md
# c7: text
# c8: base64
# c9: path
seg-9e0560b09f5a = La velocidad de guiñada se integra a partir de <c1/> y rellena el rumbo allí donde el registro del receptor no lleva ninguno, de modo que el monitor <c2/> (que necesita <c3/> en la plataforma) compara el rumbo del giróscopo con el rumbo sobre el fondo. Un giróscopo deriva: el rumbo es tan bueno como la ventana de integración, y <c4/> decide qué cuenta como discrepancia. El formato <c5/> está documentado en <c6/>. Los bytes de la IMU forman parte del hash del escenario y del hash del escenario de un paquete de evidencias. La forma en línea (<c7/>/<c8/>) funciona en todas las superficies; un <c9/> se rechaza donde no se leen archivos.

# text
seg-fd3e6ef1cd93 = Plataforma: estática o embarcación

# text
# c1: [platform]
# c2: static
seg-b67c0d57dc1d = Los monitores anteriores suponen una antena fija. Un escenario declara la plataforma antes de la ejecución en una tabla <c1/> de nivel superior; sin ella, la plataforma es <c2/> y nada cambia.

# text
seg-3d6bc18bd83e = Por qué ese valor

# text
seg-32f339f63acf = Por encima de la velocidad de servicio de los cascos mercantes y de la mayoría de las embarcaciones de pasaje, de modo que una embarcación real nunca la alcanza; muy por debajo de la velocidad que implica un arrastre de posición. Una embarcación más lenta debería declarar un límite menor: cuanto menor es el límite, antes se detecta un arrastre.

# text
seg-9506e8601857 = Un buque grande cambia de velocidad en mucho menos de { "0.1" } m/s²; una embarcación pequeña y rápida alcanza unas décimas con un cambio brusco de aceleración.

# text
seg-b0b6baaee456 = Un buque grande gira a mucho menos de { "1" } deg/s y una embarcación pequeña en un giro cerrado, a unos pocos.

# text
seg-53d0fffb3c09 = Una propiedad de la instalación; una estimación sería un umbral oculto.

# text
# c1: true
seg-ac48403443f9 = Declarado <c1/> y ausente del registro es un error, de modo que un sensor ausente no pueda pasar por una comprobación limpia.

# text
# c1: kind = "static"
# c2: position-jump
# c3: monitor_config
seg-8266739dc26b = Las claves de embarcación se rechazan bajo <c1/>. Para una embarcación, el monitor <c2/> no se ejecuta, porque mide la distancia a la media de calibración, lo cual es erróneo en una antena en movimiento; el <c3/> del resultado registra la plataforma y los límites usados.

# text
# c1: kshana nmea-scenario
seg-7551792a0cb4 = Los flujos NMEA sintéticos de <a1><c1/></a1>, hechos para la formación de la tripulación, son aceptados por el lector NMEA y pueden ejecutarse con este tipo de escenario como cualquier registro NMEA.

# text
seg-18d7538bc56d = Monitores

# text
# c1: monitors_run
# c2: calibration_s
seg-e5c1cb89f0b3 = Cada monitor necesita sus datos; un monitor cuyos datos no están en el registro no se ejecuta y no figura en <c1/>. Los primeros <c2/> segundos (por defecto { "60" }) fijan la línea base y nunca dan alarma.

# text
seg-3be9ee05f087 = Da alarma cuando

# text
seg-98ead58c671d = Necesita

# text
# c1: cn0_drop_db
seg-f6e6df453260 = el C/N0 medio de los satélites comunes con la línea base cae <c1/> o más (por defecto { "6" } dB)

# text
# c1: sats_lost
seg-d9bf6efc6835 = los satélites seguidos caen <c1/> o más por debajo de la mediana de la línea base (por defecto { "4" })

# text
# c1: agc_k_sigma
seg-60c7a99f9819 = la lectura del AGC se aparta de su línea base en más de <c1/> desviaciones típicas (por defecto { "5" })

# text
# c1: AgcDb
seg-7c1c65e64418 = UBX MON-RF o <c1/> de Android

# text
# c1: jamInd
# c2: jam_ind_threshold
seg-a5a5252417cb = el <c1/> de u-blox supera <c2/> (por defecto { "80" } de { "255" })

# text
seg-8bca191bf4c4 = UBX MON-RF

# text
# c1: position_jump_m
seg-0ac4898d81cf = la solución del propio receptor dista más de <c1/> de su media de calibración (por defecto { "50" } m)

# text
seg-6a3fec1214b9 = una posición informada

# text
seg-4c05faf783eb = la monitorización autónoma de la integridad en el receptor (RAIM) de paridad sobre la solución monopunto del propio motor rechaza el conjunto de mediciones

# text
# c1: nav
seg-037ab193613c = registro RINEX con <c1/>

# text
seg-8890a4ebf231 = la solución monopunto del motor falla con cinco o más satélites

# text
seg-0a5a708ac75b = el reloj del receptor se aparta de su recta predicha en más del desfase mínimo detectable de su ruido de calibración

# text
seg-31b64b635261 = Perfil calibrado (opcional).

# text
# c1: [monitors] profile = "jammertest-2024-calibrated"
# c2: cn0_drop_db = 1.5
# c3: agc_k_sigma = 3.5
# c4: jam_ind_threshold = 29
# c5: xval/jammertest-trust/PREREGISTRATION.md
# c6: cn0_drop_db
# c7: xval/jammertest-trust/RESULTS.md
# c8: profile_note
seg-a73f2c2dfc9a = <c1/> sustituye los tres umbrales de interferencia por valores calibrados con el conjunto de datos público JammerTest { "2024" } (un u-blox ZED-F9P por escenario; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. La calibración se preregistró (<c5/>) y el perfil es MODELLED, ajustado sobre una campaña pública: su umbral <c6/> <b>no satisfizo</b> el umbral preregistrado de falsas alarmas del conjunto reservado ({ "0.0231" } frente a { "0.02" }); los umbrales de AGC y de indicador de jamming y el umbral de la unión (falsas alarmas { "0.033" }, detección { "0.81" }) se satisficieron (<c7/>). Es válido para ese tipo de receptor en ese evento, frente a franjas de ataque programadas, y se calibró con los registros CSV del conjunto de datos (sus registros UBX dan más falsas alarmas en dos carpetas). Un resultado ejecutado con el perfil repite los umbrales que aplicó y lleva un <c8/> que dice todo esto. Sin el perfil se aplican los valores por defecto anteriores y toda salida permanece sin cambios.

# text
# c1: vessel
# c2: [maritime]
# c3: src/receiver_trust/maritime.rs
# c4: monitors_run
seg-1fa8c4bd1a18 = Para una plataforma <c1/> también se ejecutan los monitores de plataforma en movimiento (umbrales en una tabla <c2/> de nivel superior; cada valor por defecto está documentado en <c3/>); cada uno necesita sus datos y figura en <c4/> solo cuando llegó a decidir:

# text
seg-4b2840d9d0af = el cambio de posición discrepa de la velocidad y el rumbo informados, o implica una velocidad, una aceleración o una velocidad de giro por encima de los límites de la embarcación

# text
seg-656c19cb5b52 = soluciones; velocidad y rumbo (RMC o VTG) para la parte de navegación por estima

# text
# c1: hdg_cog_tol_deg
# c2: min_speed_kn
seg-cedefd52998d = el rumbo del giróscopo y el rumbo sobre el fondo difieren en más de <c1/> (velocidad superior a <c2/>)

# text
# c1: heading_sensor = true
seg-c66704cbdd02 = rumbo HDT, THS o VHW, <c1/>

# text
# c1: stw_sog_tol_kn
seg-1bbbf0033234 = la velocidad respecto al agua y la velocidad sobre el fondo difieren en más de <c1/>

# text
seg-c9101740b235 = VHW o VBW, y velocidad sobre el fondo

# text
# c1: antenna_height_m
# c2: sea_level_tol_m
seg-42ac59072099 = la altitud de GGA difiere de <c1/> en más de <c2/>

# text
# c1: antenna_height_m
seg-811ec460249c = altitud de GGA, <c1/>

# text
# c1: cn0_spread_frac
seg-854ea9c26df4 = la dispersión del C/N0 entre satélites cae a <c1/> de su mediana de calibración

# text
# c1: cn0_rise_db
# c2: cn0_rise_frac
seg-837fc4cb832c = el C/N0 de los satélites comunes subió <c1/> de media y subió <c2/> de ellos

# text
seg-faae07674361 = los tiempos de épocas consecutivas avanzan de forma irregular, retroceden o se apartan del reloj del anfitrión

# text
seg-f799a53897ed = hora de NMEA; reloj del anfitrión para la última parte

# text
seg-ee4913c9f2ed = el receptor informa de un fallo de autenticación OSNMA (se lee un estado informado; no se verifica nada; para verificar OSNMA a partir de las propias páginas I/NAV, véase <a1>docs/OSNMA.md</a1>)

# text
# c1: $PKSOS
seg-3fad5fcde4dc = sentencia de estado <c1/>

# text
seg-ce072f2ebb6c = Una época es <b>no fiable</b> cuando dan alarma RAIM, el monitor de reloj, un fallo de resolución o un salto de posición, o cuando la caída de C/N0 alcanza el doble de su umbral; <b>degradada</b> con cualquier otra alarma; y <b>nominal</b> en caso contrario.

# text
# c1: raim
# c2: solve-failure
# c3: clock
# c4: tests/jammertest_spoof_oracle_support
# c5: tests/receiver_trust_jammertest.rs
seg-4124ff6013a0 = La ruta del motor (<c1/>, <c2/>, <c3/>) es el mismo cálculo que la referencia independiente de spoofing de JammerTest { "2024" } de <c4/>: <c5/> comprueba que, en los ocho inicios publicados, la primera alarma cae en la misma época y es del mismo tipo.

# text
seg-83be3c22a577 = Puntuación de confianza (plataforma de embarcación)

# text
# c1: statistic / threshold
seg-812991f245cd = Para una embarcación, cada época posterior a la calibración recibe además una puntuación de { "0" } a { "100" } y los motivos por los que no es { "100" }. La correspondencia es determinista y está fijada antes de puntuar cualquier registro: sin aprendizaje, nada ajustado a eventos. Cada monitor reduce su evidencia a una razón <c1/> (una alarma con { "1" } o más); una razón le cuesta a la puntuación

# text
# c1: onset_ratio
# c2: full_ratio
# c3: evidence_hold_s
seg-ada5a0a52315 = de modo que un monitor no cuesta nada mientras está por debajo de <c1/> de su umbral (por defecto { "0.5" }), cuesta la mitad de su peso en su umbral y todo su peso con <c2/> veces el umbral (por defecto { "1.5" }); la puntuación no es creciente en ningún estadístico. Una fuente que no informa en una época conserva su último estadístico durante <c3/> (por defecto { "10" } s: dos ciclos de una sentencia de C/N0 enviada cada { "5" } s), tanto como alarma como como deducción.

# text
# c1: floor(x * 10 + 0.5) / 10
# c2: cn0-drop
# c3: agc
# c4: jam-ind
# c5: loss-of-lock
# c6: position-jump
# c7: raim
# c8: clock
# c9: solve-failure
# c10: kinematic
# c11: heading-course
# c12: speed-log
# c13: sea-level
# c14: cn0-spread
# c15: cn0-rise
# c16: time-consistency
# c17: osnma
# c18: geometry
seg-6c06de24ebfe = El redondeo es de medio hacia arriba (<c1/>), la banda es la de la puntuación redondeada y el recorte va antes del redondeo. Solo los monitores cuyos puntos superan cero figuran en las deducciones, con su razón y sus puntos sin redondear, primero los de más puntos; las deducciones con igual número de puntos se enumeran en el orden de los nombres de monitor <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. A un monitor cuya prueba es de pasa o falla (una resolución fallida, una autenticación fallida) se le asigna la razón { "1.5" }, el peso completo. Los puntos enumerados son los anteriores al recorte en { "0" }.

# text
seg-e36961d46c41 = Peso (puntos)

# text
seg-673f6adcd681 = Por qué

# text
seg-399be3301faf = un fallo de autenticación es una declaración, no un estadístico

# text
seg-69cfc61477d6 = una posición falsificada tiene que contradecir la física o las comprobaciones del propio receptor, y el tiempo no puede ir hacia atrás; una infracción con plena intensidad ({ "1.5" } veces su umbral: { "60" } puntos, puntuación { "40" }) es no fiable, y en su umbral ({ "30" } puntos, puntuación { "70" }) es degradada

# text
seg-7fa1e6e67411 = un sensor independiente en desacuerdo es degradado; dos con plena intensidad son no fiables

# text
seg-4c4825d2957a = el entorno de señal, o una comprobación poco informativa

# text
seg-b5a364a03714 = el entorno es hostil; eso por sí solo no demuestra que la solución sea errónea

# text
# c1: [geometry]
seg-4e3749965405 = hasta { "15" }, <c1/>

# text
# c1: cap_points
seg-1e595dbcf96f = no es un peso en esta rampa: nada salvo que el cielo sea malo, y entonces hasta <c1/> ({ "15" }); la geometría por sí sola llega a degradada, nunca a no fiable, y no da ninguna alarma (véase «Geometría» más abajo)

# text
# c1: score_model
# c2: score.deductions
seg-9902ca062070 = Los bordes de las bandas se deducen de los pesos: el monitor más ligero que da alarma cuesta { "12.5" } puntos en su umbral, de modo que cualquier alarma saca la puntuación de la banda nominal; ningún monitor individual por debajo de { "60" } puntos puede alcanzar por sí solo la banda no fiable (varios juntos sí). El resultado registra el modelo de puntuación (<c1/>) y cada época lleva <c2/>: qué monitores dedujeron, sus razones y sus puntos. Para una embarcación, el estado de la época es la banda de su puntuación.

# text
seg-6f620668ee85 = Geometría: degradación natural distinta de la incoherencia propia de un ataque

# text
# c1: docs/design/2026-10-12-geometry-and-skyline-design.md
# c2: geometry
# c3: environment
# c4: inconsistency
seg-93257d87e0d4 = Un receptor junto a una grúa de muelle, en una esclusa o bajo un casco alto pierde satélites y su solución empeora por un motivo que no es un ataque. Desde { "0.36" }, según la nota de diseño de geometría (<c1/>, sección { "4" }), cada época lleva su <b>geometría de satélites</b>, la puntuación de una embarcación tiene un <b>monitor de geometría</b> y cada deducción lleva una <b>clase</b>: <c2/> (el cielo), <c3/> (el entorno de señal) o <c4/> (evidencia propia de un ataque).

# text
# c1: orbit::dop
# c2: source = derived
# c3: source = reported
# c4: evidence_hold_s
# c5: unknown
seg-17d13c39b5aa = <b>De dónde sale la geometría.</b> De la elevación y el acimut de cada satélite seguido (NMEA GSV, UBX NAV-SAT), a partir de los cuales se deriva la dilución de la precisión (DOP) con el único núcleo de DOP del motor (<c1/>, VALIDATED frente a gnss_lib_py): <c2/>. En su defecto, del DOP y de los satélites usados que declara el receptor (NMEA GSA): <c3/>. Las posiciones del cielo y GSA cuentan durante el <c4/> de la puntuación (por defecto { "10" } s), porque muchos buses envían GSV cada pocos segundos; un conjunto GSV incompleto en una época (el final de un extracto, una sentencia perdida) no se usa. Un registro sin ninguno de los dos, como un NMEA con solo GGA y RMC, o hoy los registros de Android y RINEX, recibe el estado <b><c5/></b> con la nota «geometry unknown»: el motor no adivina una geometría que no se le dio, y el monitor de geometría no se ejecuta.

# text
seg-a267da42ac3d = satélites suficientes y DOP dentro de los umbrales

# text
# c1: few-satellites
# c2: high-pdop
# c3: high-hdop
# c4: sky-blocked
seg-dabcd392914a = uno o más motivos: <c1/>, <c2/>, <c3/> y (informativo, no entra en la puntuación) <c4/> cuando todos los satélites seguidos están en una mitad del horizonte

# text
seg-c255a66d3813 = el registro no da geometría de satélites para esta época

# text
# c1: degraded
# c2: sky-blocked
# c3: poor
seg-0a50145c2bfa = El estado es descriptivo y lo que importa para la puntuación es la etiqueta (más abajo): <c1/> incluye el caso informativo <c2/>, que puede darse con un DOP bueno o aceptable, y solo una etiqueta <c3/> puntúa.

# text
# c1: geometry.label
# c2: good
# c3: hdop_good
# c4: pdop_good
# c5: used_good
# c6: poor
# c7: hdop_max
# c8: pdop_max
# c9: min_used
# c10: fair
# c11: unknown
seg-93e49a562493 = <b>La etiqueta</b> (siempre informada, nunca puntuada). El <c1/> de cada época es <c2/> (HDOP como máximo <c3/> { "2" }, PDOP como máximo <c4/> { "3" } y al menos <c5/> { "6" } satélites), <c6/> (HDOP superior a <c7/> { "4" }, PDOP superior a <c8/> { "6" } o menos de <c9/> { "5" } satélites), <c10/> entre ambos, o <c11/>. La nota de la época siempre empieza con la etiqueta y las cifras, por ejemplo «geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)», y añade «, signal loss» cuando se da.

# text
# c1: max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)
# c2: cap_points
# c3: full_ratio
# c4: floor
# c5: degraded_min
# c6: min(cap_points, 100 - floor)
# c7: [score]
# c8: degraded_min
# c9: degraded_min
# c10: 100 - degraded_min
# c11: floor
# c12: degraded_min
# c13: monitors_run
# c14: [score.weights]
# c15: geometry_model.cap_in_force
# c16: geometry_model.floor_in_force
seg-13838e036fae = <b>El monitor de geometría</b> (puntuación de embarcación). <b>No deduce nada salvo que la geometría sea mala</b>: su razón es <c1/>, y mientras esta sea como máximo { "1" } (geometría buena o aceptable, incluido un cielo abierto solo con GPS de { "8" } satélites) no cuesta nada, de modo que un registro así puntúa exactamente igual que en { "0.35" }. Por encima de { "1" } la deducción crece linealmente hasta <c2/> ({ "15" }) en <c3/> ({ "1.5" } veces los umbrales: HDOP { "6" }, PDOP { "9" }, { "3" } satélites): { "7.5" } puntos con razón { "1.25" } (HDOP { "5" }, o { "4" } satélites), { "15" } a partir de { "1.5" } (puntuación { "85" }, degradada). Por sí solo nunca puede bajar la puntuación de <c4/> (por defecto: el <c5/> de la puntuación, { "55" }), de modo que la geometría por sí sola llega como mucho a la banda degradada y nunca a la no fiable: el tope en vigor es <c6/>, así que una tabla <c7/> que suba <c8/> (una de { "0.35" } con <c9/> { "90" }, por ejemplo) rebaja el tope a <c10/> en lugar de rechazarse, y un <c11/> fijado por debajo de <c12/> se rechaza. El monitor no da ninguna alarma; figura al final de <c13/> cuando decidió en alguna época (una embarcación cuyo registro da la geometría), y no se cuenta en la identidad con { "0.35" }; no es una entrada de <c14/> (fijarla se rechaza), y el tope y el suelo en vigor se registran en <c15/> y <c16/>. La nota de una época mala dice por qué, por ejemplo «geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency».

# text
# c1: score.deductions[].class
seg-2082f4ccb250 = <b>Clases.</b> Cada deducción (<c1/>):

# text
# c1: geometry
# c2: loss-of-lock
# c3: low_elev_deg
seg-4197bc517f73 = <c1/> (geometría mala); <c2/> cuando todos los satélites perdidos respecto a la línea base de calibración estaban por debajo de <c3/> en su último informe

# text
# c1: cn0-drop
# c2: cn0-spread
# c3: cn0-rise
# c4: agc
# c5: jam-ind
# c6: loss-of-lock
# c7: geometry
seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> en caso contrario; <c7/> durante la pérdida de señal (más abajo)

# text
# c1: kinematic
# c2: heading-course
# c3: speed-log
# c4: sea-level
# c5: time-consistency
# c6: clock
# c7: raim
# c8: position-jump
# c9: osnma
# c10: solve-failure
# c11: geometry
seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; y <c11/> cuando la geometría es mala y el HDOP declarado discrepa del cielo declarado (más abajo)

# text
# c1: max(reported_vs_derived_tol, reported_vs_derived_rel × derived HDOP)
# c2: reported_derived_mismatch: true
# c3: inconsistency
# c4: reported_derived_mismatch
# c5: geometry_summary.hdop_mismatch
# c6: geometry
seg-1b5e88a4aae4 = <b>La salvaguarda contra un cielo malo falsificado.</b> Un spoofer podría enviar un GSV escaso, o informar de un HDOP alto, para ganar tolerancia. El motor etiqueta y no perdona: ninguna otra comprobación se ensancha por una geometría mala, y el HDOP que declara el receptor (GSA dentro de la retención, si no GGA) se compara con el HDOP derivado del cielo que declara. Cuando difieren en más de <c1/> ({ "1.0" }, o el { "25" } % del HDOP derivado, el que sea mayor), la época lleva <c2/> y, cuando la geometría es mala, su deducción se clasifica como <c3/>. Con geometría buena o aceptable, la discrepancia se informa y no se puntúa: no se deduce nada salvo que la geometría sea mala. Es una decisión deliberada ({ "0.36" }): «cero salvo que sea mala» rige para cada época, de modo que la geometría buena y la aceptable puntúan exactamente igual que en { "0.35" }, y un HDOP falsificado nunca pasa en silencio. El indicador (<c4/>) está en cada época del resultado y en cada línea en vivo, la nota dice «…beyond the tolerance: reported, not scored (the geometry is not poor)» o «…: the geometry deduction is classed an inconsistency», <c5/> cuenta las épocas, y la página de resumen de evidencias muestra el recuento, incluido el cero. El { "25" } % es una elección de ingeniería <b>REPRESENTATIVE</b>, no una cifra medida ni normalizada: un receptor que resuelve un reloj por constelación, o con un subconjunto de los satélites que sigue (una máscara de elevación, un corte de C/N0, una exclusión por RAIM), declara un HDOP que difiere del HDOP de reloj único de todos los satélites seguidos en una cantidad que crece con el HDOP, de modo que una tolerancia fija por sí sola leería como incoherencia una geometría mala natural. Una diferencia mayor sigue leyéndose como tal. Una deducción clasificada como <c6/> es una afirmación sobre el cielo, no la constatación de que no hubo ataque.

# text
# c1: low_elev_deg
# c2: signal_loss: true
# c3: environment
seg-0e729ad96db9 = <b>La pérdida de señal no es el cielo.</b> Cuando los satélites que el receptor lista a la vista (por encima de <c1/>) no están siendo seguidos, el motor deriva además el DOP de todos los satélites a la vista. Si ese DOP a la vista está dentro de los umbrales y o bien no se sigue ninguno o bien los satélites no seguidos están repartidos por el horizonte (no confinados a una mitad), el cielo estaba y la señal no: la época lleva <c2/>, la nota «satellites in view but not tracked: signal environment, not geometry», y la deducción de geometría se clasifica como <c3/>. Los satélites no seguidos confinados a una mitad del horizonte siguen leyéndose como un cielo bloqueado (un muro, un acantilado, un muelle). Una obstrucción por ambos lados (un cañón o un fiordo estrecho) se lee como pérdida de señal hasta que se configura un horizonte. Los centinelas de ausencia de solución del receptor no son DOP: un HDOP o PDOP declarado de { "99" } o más, una calidad GGA de { "0" } y un modo GSA de { "1" } no dan ningún DOP declarado.

# text
# c1: [geometry]
seg-0f218d21843b = Clave <c1/>

# text
# c1: sigma_uere_m
# c2: kin_pos_tol_m
seg-e5ec84abd61b = elegido (nota de diseño { "4.2" }): con <c1/> { "1.5" } m, un HDOP de { "4" } es un 2drms de { "12" } m, el <c2/> de la comprobación cinemática. Suele citarse que IEC 61108-1 expresa sus requisitos de exactitud para HDOP ≤ { "4" } (o PDOP ≤ { "6" }): recordado de bibliografía secundaria sobre receptores GNSS, sin consultar ninguna fuente secundaria concreta y sin haber leído la norma; debe comprobarse frente al texto de la norma

# text
# c1: scenarios/polar-arctic-leo-coverage.toml
# c2: tests/constellation_availability_published_spec_oracle.rs
seg-d99dc0fd090a = el umbral de disponibilidad de PDOP de <c1/>; GPS SPS Performance Standard, 5.ª ed. ({ "2020" }), PDOP ≤ { "6" }, tal como se cita en <c2/>; debe comprobarse frente al texto de la norma

# text
seg-2fffa47378ec = uno más de los que necesita una solución, de modo que una sola pérdida no acabe con la solución; el mínimo con una medición redundante para RAIM

# text
# c1: hdop_max
seg-7dc0baed2bc4 = una entrada declarada para el enlace 2drms de <c1/>; fije la cifra del propio receptor

# text
seg-7b5778d93d40 = { "1.0" } de HDOP

# text
seg-093cff5d1150 = elegido (nota de diseño { "4.2" }): la parte absoluta de la tolerancia; una discrepancia superior a la tolerancia no es geometría

# text
seg-be5c3aefd942 = elección de ingeniería REPRESENTATIVE: la parte relativa, para receptores con relojes por constelación o soluciones con subconjuntos

# text
seg-e71c6876114b = nota de diseño { "4.3" }: los satélites perdidos por debajo de él se pierden para el cielo; un horizonte ({ "0.36" }, elemento { "1" }) ampliará esto

# text
seg-bebe291ca1c0 = geométrico, informativo: todos los satélites en una mitad del horizonte

# text
seg-06519582227b = nota de diseño { "4.2" }: la geometría por sí sola lleva la puntuación de nominal a degradada y nunca a no fiable; solo se deduce cuando la geometría es mala (decisión del fundador B1, { "0.36" })

# text
# c1: full_ratio
# c2: cap_points
seg-be21b5a31382 = el <c1/> propio de la puntuación: la rampa llega a <c2/> con { "1.5" } veces los umbrales de geometría mala

# text
# c1: degraded_min
seg-e922a5342a3c = el <c1/> de la puntuación ({ "55" })

# text
# c1: min(cap_points, 100 - floor)
# c2: degraded_min
seg-09fe8c435ece = la geometría por sí sola nunca llega a la banda no fiable; el tope en vigor es <c1/>; un suelo por debajo de <c2/> se rechaza

# text
# c1: hdop_max
seg-a07e6ce67371 = REPRESENTATIVE, solo para la etiqueta: la mitad de <c1/> (la razón de inicio de la puntuación de { "0.35" })

# text
# c1: pdop_max
seg-06db7e7af59c = REPRESENTATIVE, solo para la etiqueta: la mitad de <c1/>

# text
# c1: min_used
seg-7e7f17d36ea4 = REPRESENTATIVE, solo para la etiqueta: uno más que <c1/>, de modo que una sola pérdida siga dejando una medición redundante

# text
# c1: epochs[].geometry
# c2: status
# c3: reasons
# c4: source
# c5: n_used
# c6: hdop
# c7: pdop
# c8: vdop
# c9: open_fraction
# c10: max_azimuth_gap_deg
# c11: age_s
# c12: reported_hdop
# c13: reported_derived_mismatch
# c14: note
# c15: in_view
# c16: low_elev_deg
# c17: signal_loss
# c18: label
# c19: class
# c20: geometry_model
# c21: geometry_summary
# c22: score_model.weights
# c23: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c24: tests/geometry_trust_no_change.rs
# c25: $PKSHT
# c26: tests/geometry_corpus_identity.rs
# c27: $PKSHT
# c28: inconsistency
# c29: tests/geometry_trust.rs
# c30: environment
# c31: geometry
# c32: inconsistency
seg-ef7a4c24e870 = <b>Qué cambió en las salidas y qué no.</b> Ninguna puntuación cambia salvo que la geometría sea mala; la etiqueta siempre se informa. Claves añadidas: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> redondeado a { "0.001" }, <c9/> (nulo hasta que se configura un horizonte), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satélites listados por encima de <c16/>), <c17/>, <c18/>), <c19/> en cada deducción y, al final, <c20/> (umbrales, retención, el tope y el suelo en vigor, procedencia, reglas de clase) y <c21/> (épocas por estado, por etiqueta y por clase de deducción, y las épocas con discrepancia de HDOP declarado); <c22/> es como en { "0.35" }. Dos pruebas lo mantienen idéntico byte a byte a la línea base «portable de { "0.36" }» una vez retiradas esas claves (los hashes de { "0.35.0" }, rebasados cuando el motor pasó a matemática portable y conservados en las pruebas como registro de lo que publicó { "0.35.0" }: <c23/>). <c24/> mantiene todas las salidas de ambas sesiones de ejemplo (JSON de resultado, CSV, SVG, veredicto, líneas en vivo reproducidas, <c25/>, Prometheus, CEF, LEEF). <c26/> mantiene el resultado por lotes, el resumen, las líneas en vivo y el <c27/> de cada corpus NMEA de embarcación incorporado (la demostración y los datos de prueba marítimos de referencia, cada uno también como cielo abierto solo con GPS de { "8" } satélites, y los escenarios de formación de tripulación generados a partir de sus semillas); en los dos escenarios de formación cuyo jamming vuelve mala la geometría, toda época que no es mala es idéntica y toda época mala difiere solo por la deducción de geometría. Un registro cuya geometría es mala pierde hasta { "15" } puntos que no perdía en { "0.35" }; ese es el cambio previsto. En la demostración, el arrastre de posición se lee como <c28/>; <c29/> edita el registro para enmascarar el cielo occidental (aceptable: etiquetado, no puntuado), para enmascararlo junto con dos satélites orientales (malo: deducciones de geometría, pérdida de enganche <c30/> porque también se perdieron satélites altos), para perder solo satélites por debajo de { "15" }° (pérdida de enganche <c31/>) y para declarar un HDOP que el cielo no explica (la deducción de geometría mala pasa a ser <c32/>). Los umbrales son MODELLED: elegidos, no ajustados a ningún registro; nada de esto afirma con qué frecuencia se distinguen la degradación natural y los ataques en datos reales.

# text
seg-8ddaf82ba00b = Declaración de eventos y predicciones

# text
# c1: detected
# c2: late
# c3: missed
# c4: not-evaluable
# c5: agree
# c6: disagree
# c7: no-prediction
# c8: not-evaluable
seg-c52c285aa308 = Para cada evento, el resultado da las falsas alarmas entre la calibración y el inicio, la primera alarma y sus monitores, la latencia, el desenlace (<c1/>, <c2/>, <c3/> o <c4/>) y la caída mediana de C/N0 observada frente a la predicción (<c5/>, <c6/>, <c7/> o <c8/>). La discrepancia se informa, nunca se ajusta para hacerla desaparecer: las tolerancias están en el escenario, y el escenario está en el hash del resultado.

# text
seg-3715df3fd8f7 = Lo que esto no afirma

# text
# c1: VERIFICATION-MATRIX.md
seg-21a4b903e179 = Los monitores de confianza son MODELLED: sus umbrales son entradas, y su rendimiento de detección frente a interferencias reales es lo que mide la puntuación de eventos, no algo que afirme este tipo de escenario. En las sesiones de spoofing de JammerTest { "2024" }, los monitores de la ruta del motor detectan algunos inicios en { "10" } s y llegan tarde en otros; véase la fila «Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM» de <a1><c1/></a1> para las cifras. Una predicción que concuerda con un registro es un dato aislado, no una validación.

# text
seg-0c413c1a491c = <s1>Anterior</s1>Correspondencia de resiliencia

# text
seg-63fc2b340fd1 = <s1>Siguiente</s1>Confianza marítima
