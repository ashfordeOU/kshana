# docs--timing-hil: translations (es)

# text
seg-f8cf777c0caa = Superficies

# text
seg-f2ce7fc60cdf = Formato

# text
seg-d00b65801e9b = Paso

# attr:alt
seg-0d580ea8043d = Una prueba de holdover puntuada a partir de un registro de error de tiempo, de una ejecución real del motor v{ $version } sobre scenarios/holdover-test-example.toml ({ "601" } muestras cada { "5" } s). El operador retira el GNSS a los { "600" } s y lo restablece a los { "2400" } s; el error de tiempo deriva hasta { "299" } ns al final del holdover, rebasa el presupuesto de { "100" } ns tras { "675" } s, y vuelve a la banda de { "100" } ns { "70" } s después del restablecimiento. Veredictos: máscaras de línea base PASS, máscaras de holdover FAIL, envolvente de holdover FAIL, recuperación RECOVERED. Medido frente a la máscara, no una aprobación. Las horas son declaración del operador, no verificadas por Kshana. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# text
# c1: docs/TIMING-HIL.md
seg-7a1246297c82 = Fuente: <c1/>

# text
seg-6ea3dec83080 = Hardware-in-the-loop de temporización: desconectar la antena, puntuar el holdover

# text
# c1: holdover-test
# c2: scenarios/holdover-test-example.toml
# c3: scenarios/holdover-test-ptp4l.toml
seg-5901f0b26939 = Los operadores de telecomunicaciones y de energía ensayan un sistema de temporización retirándole el GNSS y observando qué hace el reloj. Kshana no hace eso por ellos, y no toca sus equipos. Lee el registro de error de tiempo que produjeron los propios instrumentos del operador, lo divide en los dos instantes que declara el operador y <b>mide cada paso frente a máscaras públicas de la ITU-T</b>. El tipo de escenario es <a1><c1/></a1>; los escenarios de ejemplo son <c2/> y <c3/>.

# text
# c1: HARDWARE-SAFETY.md
seg-daf4b071bad0 = Esta es la <b>etapa { "1" }</b> de seguridad del hardware: pasiva, solo de recepción, sin RF de Kshana (<a1><c1/></a1>). Software de carácter consultivo, no un equipo homologado. Nadie ha calificado, aprobado ni revisado este procedimiento, y no dice nada sobre si un sistema satisface una Recomendación.

# text
seg-da0c48bbe011 = El procedimiento

# text
seg-e753ca7a1c99 = El operador ejecuta cuatro pasos. Kshana no realiza ninguno de ellos.

# text
seg-0c338b956741 = Lo que hace el operador

# text
seg-ebd95b343349 = Lo que muestra el registro

# text
seg-03999de98059 = { "1" }. Línea base

# text
seg-730f2037d22a = Deja el sistema funcionando bloqueado a GNSS durante el tiempo que necesite el ensayo (y anota cuántos días llevaba bloqueado antes).

# text
seg-f45aae4139bd = El error de tiempo mientras está disciplinado.

# text
seg-0f050dcede80 = { "2" }. GNSS retirado

# text
seg-50c0df832eda = Retira el GNSS del sistema sometido a ensayo, por ejemplo el cable de antena en el receptor, o la salida del propio simulador del laboratorio, y <b>anota la hora</b>. Consulte antes el manual del fabricante del receptor: algunos receptores alimentan la antena, y algunos necesitan un terminador en el puerto abierto.

# text
seg-e371e7e357e3 = El instante en que el error de tiempo empieza a derivar.

# text
seg-f05dc0acb396 = { "3" }. Holdover

# text
seg-a98186503e0f = Deja el sistema con su propio oscilador durante el tiempo previsto.

# text
seg-1da66cdca856 = El holdover del sistema.

# text
seg-61197c9bad91 = { "4" }. Recuperación

# text
seg-75af1f4fec83 = Restablece el GNSS y <b>anota la hora</b>.

# text
seg-1259d36fc78c = El error de tiempo que vuelve (o no).

# text
seg-c09b1ea8f1a4 = Dos cosas que debe hacer el operador, porque Kshana no puede:

# text
seg-31f6c357864b = Declarar los dos instantes.

# text
# c1: gnss_removed_s
# c2: gnss_restored_s
seg-59f9eb10035a = <c1/> y <c2/> son una declaración del operador. Kshana no detecta la retirada a partir del registro y no verifica los instantes. Un instante erróneo desplaza los límites de los pasos y, con ello, el resultado.

# text
seg-6d0d3186fbe3 = <b>Use el mismo reloj para el registro y para los instantes.</b> En un registro de reloj, el eje de tiempo empieza en la primera lectura, de modo que los dos instantes son segundos desde la primera línea del registro.

# text
seg-bd181a831803 = Qué registrar

# text
# c1: clock_log
# c2: CLOCK-LOG-FORMATS.md
seg-52758c10be0a = Cualquiera de estos, mediante los lectores <c1/> existentes (<a1><c2/></a1>):

# text
seg-fef0034cb88b = Instrumento

# text
seg-ad6f33d70f3f = Cómo se hace el registro

# text
# c1: ptp4l
seg-ef7f547609ad = linuxptp <c1/> (el servo del reloj esclavo o de frontera)

# text
# c1: -m
# c2: ptp4l[time]: master offset N sK freq ...
seg-f548a2ae96e5 = ejecute con <c1/> y conserve las líneas <c2/>

# text
# c1: phc2sys
seg-9a3b58be1b0b = linuxptp <c1/>

# text
# c1: phc2sys[time]: CLOCK_REALTIME phc offset N sK ...
seg-77255f8f5fef = las líneas <c1/>

# text
# c1: ts2phc
seg-2cf9256bd790 = linuxptp <c1/>

# text
# c1: ts2phc[time]: /dev/ptpN offset N sK ...
seg-c667a97b92a8 = las líneas <c1/>

# text
# c1: tracking.log
seg-ed305bcea4f8 = chrony <c1/>

# text
# c1: log tracking
# c2: chrony.conf
seg-021b760aae59 = <c1/> en <c2/>

# text
# c1: statistics.log
seg-a7f2d72a5cb7 = chrony <c1/>

# text
# c1: log statistics
# c2: chrony.conf
seg-a70952a099d5 = <c1/> en <c2/>

# text
seg-6ad29120ffe7 = un contador TAPR TICC

# text
seg-32f703bfcab7 = modo de marca de tiempo frente a la referencia

# text
seg-6862a9ac9a68 = una exportación ASCII de TimeLab

# text
seg-b5e7e3a272d6 = fase en una unidad declarada

# text
seg-8af4aac4426f = un archivo de reloj RINEX

# text
seg-21d5c43719f2 = un reloj

# text
seg-3a82b5295ab1 = cualquier otra cosa

# text
# c1: samples
# c2: csv_path
seg-6bebda4a3c6c = <c1/> o <c2/>

# text
# c1: time_s,time_error_ns
seg-9a443cc0c444 = pares <c1/>, muestreados de forma uniforme

# text
seg-b8d1d45df70b = <b>Importa lo que mide el registro.</b> Un registro de servo (linuxptp, chrony) registra el desfase que midió el demonio y que está corrigiendo: es el error de tiempo que queda bajo control del servo, no una medición independiente del reloj frente a UTC. Durante el paso de holdover de un ensayo que retira realmente la referencia, un registro de servo sigue mostrando lo que creía el demonio, que puede diferir del error real. Un TICC u otro contador frente a una referencia independiente es el registro más sólido; indique cuál usó al informar del resultado.

# text
seg-6d4e25914d1c = El escenario

# text
# c1: budgets
# c2: max_abs_te_ns
# c3: clock = "..."
# c4: [series.clock_log]
seg-ca1244db2387 = Claves opcionales: <c1/> (nombre, <c2/>, origen; los valores por defecto de telecom-timing cuando faltan) y <c3/> dentro de <c4/> para elegir un origen de un registro que contiene varios.

# text
seg-38eb634b7f8f = Qué contiene el informe

# text
# c1: steps
seg-6a64755e11d6 = <b><c1/></b>: para la línea base, el holdover y la recuperación, el inicio y el fin, el número de muestras y los valores medio, rms, mayor y final del error de tiempo.

# text
# c1: masks
seg-cd11d0838c44 = <b><c1/></b>: cada máscara que nombró, medida en el paso que nombra su condición. Una máscara escrita para un reloj bloqueado se mide en la línea base; una escrita para holdover o para un reloj autónomo, en el holdover. Cada comprobación lleva su límite, el valor medido, el margen y la tabla de la que se transcribe. Una máscara que necesita un registro más largo del que dio el paso es <b>INCOMPLETE</b>, nunca extrapolada; una que el motor no puede evaluar para el intervalo de muestreo del registro es <b>NOT-EVALUATED</b> con el motivo.

# text
# c1: holdover
seg-cb54e67ca4eb = <b><c1/></b>: el desfase fraccionario de frecuencia que mantuvo el sistema (la pendiente de una recta de mínimos cuadrados a través del error de tiempo del holdover, en ns/s, que son partes por mil millones), el residuo respecto de esa recta, el mayor error de tiempo absoluto y cuándo se produjo, y el salto en el momento de la retirada.

# text
# c1: holdover_envelope
# c2: locked_duration_days
seg-daa40ac07396 = <b><c1/></b>: la envolvente de holdover de ePRTC-A de la Tabla { "3" } de ITU-T G.8272.1, a partir de <c2/>, con el instante en que se supera por primera vez.

# text
# c1: budgets
seg-cd480a1bf901 = <b><c1/></b>: el tiempo transcurrido tras la retirada en el que se supera por primera vez cada presupuesto de error de tiempo.

# text
# c1: recovery
# c2: |TE|
seg-007a0393cb39 = <b><c1/></b>: si <c2/> entró en la banda y permaneció en ella durante el tiempo de permanencia, cuánto después de que volviera GNSS empezó eso, el pico tras el restablecimiento y el mayor salto entre muestras consecutivas durante la recuperación.

# text
# c1: curves
seg-199497dfcc09 = <b><c1/></b>: MTIE y TDEV de los pasos de línea base y de holdover.

# text
# c1: verdicts
seg-ce00a41a322f = <b><c1/></b>: un resumen de una palabra por paso.

# text
# c1: units
seg-c09fc305ead1 = Cada número lleva su unidad y su procedencia en el bloque <c1/> del informe.

# text
seg-5d87a772c132 = Las palabras y los límites

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-0810b24c6f3e = El resultado se <b>mide frente a la máscara</b>. Las máscaras se transcriben de Recomendaciones de la ITU-T de descarga libre (las mismas tablas que el tipo <c1/>, enumeradas en <a1><c2/></a1>), y toda entrada que las Recomendaciones dejan "for further study" está ausente, no rellenada. Kshana no afirma que un reloj o un sistema satisfaga una Recomendación ni que esté aprobado frente a ella, y el informe tampoco.

# text
seg-527189cf37c6 = <b>MODELLED.</b> La lógica de pasos, el ajuste de recta y la regla de recuperación se comprueban sobre registros construidos a partir de fórmulas cuyas respuestas se conocen antes de la ejecución; ningún holdover de laboratorio se ha puntuado frente a una referencia independiente externa, y ningún socio ni laboratorio ha acordado nada. Haría falta un laboratorio de temporización antes de poder promover cualquier cifra por clase de reloj.

# text
seg-ad8160fbed46 = <b>Lo que no se cubre</b>, indicado en todos los informes: si GNSS se retiró y se restableció realmente en los instantes declarados; cualquier paso que el operador no registró; las máscaras definidas mediante un filtro de { "0.1" } Hz para un registro muestreado más despacio que una vez por segundo; la propia incertidumbre de medición del instrumento; y cualquier procedimiento de una Recomendación que vaya más allá de un registro de error de tiempo (perfiles de temperatura, carga de la red de paquetes).

# text
seg-cf681db42f05 = <b>La banda de recuperación es una elección propia del ensayo.</b> El valor por defecto de { "100" } ns es el error de tiempo absoluto máximo de un PRTC-A (ITU-T G.8272); es una línea cómoda, no un requisito de ninguna Recomendación para la recuperación.

# text
seg-4ce2f2052df4 = <b>Sin ruta de transmisión.</b> Kshana lee archivos. No genera ninguna señal, y retirar GNSS en un laboratorio se hace con el equipo propio del laboratorio y bajo su propia autorización.

# text
# c1: holdover-test
# c2: kshana <scenario.toml>
# c3: kshana::api::run_toml
# c4: kshana.run
# c5: samples
# c6: clock_log.text
# c7: run_scenario
# c8: kshana example holdover-test-example
seg-0cff831a8444 = <c1/> es un tipo de escenario, de modo que se ejecuta en todos los lugares donde se ejecutan los tipos: <c2/>, la API de Rust (<c3/>), el enlace de Python (<c4/>), la compilación de WebAssembly y npm (<c5/> o <c6/> en línea; las claves de archivo no están disponibles allí), el servidor MCP (<c7/>, solo contenido en línea) y el ejecutor de escenarios de Kshana Studio. Los dos archivos de escenario vienen incluidos (<c8/>).

# text
seg-432c07a8e6f5 = <s1>Anterior</s1>Tiempo engañado

# text
seg-8499ae539222 = <s1>Siguiente</s1>Formatos de registros de reloj
