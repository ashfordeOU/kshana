# docs--clock-log-formats: translations (es)

# text
# c1: docs/CLOCK-LOG-FORMATS.md
seg-ca2fcdd60f65 = Fuente: <c1/>

# text
seg-0dfd1160c5d7 = Formatos de registros de reloj

# text
# c1: src/clock_log.rs
# c2: (time_s, phase_s)
# c3: tau0
seg-f52a62872493 = <c1/> lee un registro medido de reloj y lo convierte en una única serie de fase normalizada: una cuadrícula uniforme de muestras <c2/>, con el intervalo de muestreo <c3/> indicado o hallado, cada hueco contado y las unidades del registro nombradas. Se leen ocho formatos, cada uno un subconjunto documentado. Todo lo que queda fuera del subconjunto se rechaza con un error que nombra lo que se encontró, en lugar de leerse de forma aproximada.

# text
# c1: tau0
seg-dbdbfec37ab6 = <b>Abreviaturas.</b> RINEX es el Receiver Independent Exchange Format. TICC es el contador de intervalos de tiempo de TAPR (Tucson Amateur Packet Radio). ADEV es la desviación de Allan solapada, TDEV la desviación temporal y MTIE el error máximo de intervalo de tiempo. <c1/> es el intervalo de muestreo en segundos.

# text
seg-1d5a6c2090af = Dónde puede usarse un registro

# text
# c1: telecom-timing
# c2: [series.clock_log]
# c3: series.samples
# c4: series.csv_path
# c5: clock_log
seg-2a391645eeeb = <b><c1/></b>: <c2/> en lugar de <c3/> o <c4/>. La fase del registro, en ns, es la serie de error de tiempo que se contrasta con las máscaras, y el informe incorpora un bloque <c5/> que indica cómo se leyó.

# text
# c1: [clock_log]
# c2: measured
# c3: input_sha256
# c4: scenario_hash
# c5: runs = 1
seg-4c2a67008451 = <b>El tipo de escenario clock</b>: una tabla <c1/> añade a la ejecución un bloque <c2/>: cómo se leyó el registro, el SHA-256 de la tabla (<c3/>; el <c4/> de la ejecución no cubre la tabla) y de las muestras de fase, y los ADEV, TDEV y MTIE solapados con factores de promediado por octavas. Necesita <c5/>. El holdover simulado no cambia.

# text
seg-2f464fe709c9 = Sin la tabla, ambos tipos de escenario se analizan, se resumen con hash y se notifican exactamente como antes.

# text
seg-c931c5ec2f4a = Los formatos

# text
# c1: timelab
# c2: tau0
# c3: time value
seg-0b758195e7eb = <b><c1/></b>: registros ASCII de fase o de frecuencia de estilo TimeLab, la forma de texto plano que exporta TimeLab y que leen su importación ASCII y Stable32. Hay una lectura por línea: o bien una sola columna con un <c2/> uniforme, o bien dos columnas <c3/>. Las columnas pueden separarse por espacios en blanco, comas o punto y coma.

# text
# c1: #
# c2: ;
# c3: %
# c4: key = value
# c5: key: value
# c6: tau0
# c7: units
# c8: s
# c9: ms
# c10: us
# c11: ns
# c12: ps
# c13: data
# c14: phase
# c15: frequency
# c16: time_units
# c17: s
# c18: mjd
seg-a7ae9e712bea = Las líneas que empiezan por <c1/>, <c2/> o <c3/> son comentarios. Un comentario de la forma <c4/> (o <c5/>) establece <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> o <c12/>, para fase), <c13/> (<c14/> o <c15/>) o <c16/> (<c17/> o <c18/>, para la primera de dos columnas).

# text
seg-84cf463d5e74 = Una línea inicial no numérica se toma como cabecera de columnas.

# text
# c1: x[i+1] = x[i] + y[i]·tau0
seg-84f4b59bcdbf = Los datos de frecuencia (frecuencia fraccionaria) se aceptan solo como una única columna. Se integran a fase como <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

# text
# c1: .tim
seg-8cc445eb84f3 = Los archivos de proyecto binarios y <c1/> de TimeLab no se leen.

# text
# c1: <seconds> chA
# c2: <seconds> chB
# c3: chC
# c4: x[k] = t[k] − t[0] − n[k]·tau0
# c5: n[k]
# c6: tau0
seg-3af6e4e7bc73 = Las líneas del modo de marca de tiempo (<c1/>, <c2/>) y el canal de seudomarca de tiempo del modo TimeLab (<c3/>) son marcas de tiempo de sucesos. La fase del canal seleccionado es su marca de tiempo menos el tic nominal: <c4/>, donde <c5/> es el número entero de <c6/> desde el primer suceso. Un suceso perdido es un hueco.

# text
# c1: <seconds> TI(A->B)
# c2: TI
# c3: tau0
# c4: tau0_s
seg-cecf9df4ff10 = Las líneas del modo de intervalo (<c1/>, o cualquier etiqueta que empiece por <c2/>) se leen directamente como fase, una lectura por <c3/>. El escenario debe indicar <c4/>, porque la línea no lleva tiempo.

# text
# c1: #
# c2: <number> <label>
seg-5ec2509907dd = Las líneas que empiezan por <c1/> y las que no son <c2/> (como el menú de arranque) se omiten y se cuentan.

# text
seg-cb4b7062dd5a = Registros de linuxptp y chrony

# text
seg-c6c70813a988 = Estos cinco formatos leen lo que escribe un demonio de tiempo en ejecución sobre su propio reloj. Sirven para comprobar a posteriori una cadena de temporización (un reloj de frontera, el PHC de un grandmaster, un cliente chrony) con los mismos estimadores que los demás registros. No leen la configuración de un demonio, y nada aquí se comunica con un demonio.

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: las líneas del servo de linuxptp; cada formato lee solo las líneas de su propio programa. Una lectura es una línea de la forma

# text
# c1: [seconds.fraction]
# c2: ptp4l[812]:
seg-e32842403b6b = La marca de tiempo es el primer <c1/> de la línea (el reloj monotónico del demonio). También se lee tras un prefijo de syslog, donde un identificador de proceso como <c2/> no tiene fracción y no se toma.

# text
# c1: offset
seg-72678cd6c03e = La fase es el <c1/> registrado, en nanosegundos, convertido a segundos. Es el error de tiempo medido por el demonio de su reloj esclavo respecto a su referencia, tal como se registra: positivo cuando el esclavo va adelantado. Es el error que queda bajo control del servo, no la deriva de un reloj en marcha libre.

# text
# c1: offset
# c2: master
# c3: eth0 master
# c4: [eth0]
# c5: CLOCK_REALTIME phc
# c6: /dev/ptp0
# c7: clock = "<that text>"
seg-f9080412572a = Las palabras entre la marca de tiempo y <c1/> nombran la fuente (<c2/>, <c3/> para un prefijo <c4/>, <c5/>, <c6/>). Un registro con más de una fuente necesita <c7/>; el error las enumera.

# text
# c1: s2
# c2: n_skipped_lines
# c3: s0
# c4: s1
# c5: s2
seg-5bef874341f2 = Las lecturas anteriores a que el servo informe por primera vez de <c1/> (enganchado) se dejan fuera y se cuentan en <c2/>: <c3/> y <c4/> son los estados desenganchado y de salto, cuyos desfases son transitorios de captura. Un servo que nunca alcanza <c5/> se rechaza. Una línea sin campo de estado se lee tal cual.

# text
# c1: rms ... max ...
# c2: delay
# c3: selected best master
seg-121fbe1486cf = Las líneas de resumen (<c1/>), los mensajes <c2/> y <c3/> y las líneas de otros programas se omiten y se cuentan.

# text
seg-92164f4a56be = Las marcas de tiempo que retroceden (un demonio reiniciado) se rechazan; divida el registro.

# text
# c1: chrony-tracking
# c2: chrony-statistics
# c3: log tracking
# c4: log statistics
# c5: YYYY-MM-DD HH:MM:SS
# c6: ====
seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: los archivos <c3/> y <c4/> de chrony, leídos por posición de columna. Una lectura es una línea con al menos { "14" } columnas (tracking) o { "13" } (statistics) que empieza por una fecha y hora UTC <c5/>. La línea de cabecera de columnas se omite y se cuenta; la regla <c6/> que hay debajo se omite sin contarse.

# text
# c1: clock
# c2: clock = "<id>"
seg-bae4f6895d14 = Tracking: columna { "7" }, el desfase local en la actualización del reloj, en segundos. La dirección IP o el identificador de referencia cambia con la fuente seleccionada, de modo que, sin <c1/>, cada línea se lee como un único reloj local. <c2/> conserva un único identificador de referencia.

# text
# c1: clock = "<address>"
seg-12b284cd7d8c = Statistics: columna { "5" }, el desfase estimado de una fuente, en segundos. Hay una serie por dirección de fuente, y el registro necesita <c1/> cuando contiene más de una.

# text
# c1: tau0
# c2: tau0
# c3: n_duplicates
# c4: gaps = "refuse"
# c5: tau0_s
# c6: gaps = "linear"
seg-197645e3c7c5 = Las épocas son segundos desde 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, sin tratamiento de segundos intercalares. Chrony escribe una línea por actualización o por muestra de fuente, de modo que el espaciado no es uniforme. <c1/> es el espaciado mediano; una lectura a menos de medio <c2/> de la anterior conservada se descarta y se cuenta en <c3/>, y un espaciado mayor es un hueco, que <c4/> notifica. Indique <c5/> y <c6/> para un registro con un intervalo de sondeo estable.

# text
# c1: tests/fixtures/clock_log/linuxptp_chrony/
# c2: NOTICE.md
seg-61fbb0479c95 = Las columnas de chrony y los formatos de línea de linuxptp son los de la documentación pública de los demonios. Los archivos de prueba de <c1/> están escritos para Kshana con valores inventados (véase su <c2/>); no se leyó ningún registro real, de modo que un formato que difiera entre versiones del demonio aún puede rechazarse o leerse mal. Una línea que no coincide se omite y se cuenta, nunca se adivina.

# text
# c1: tau0
seg-b120a37b7d60 = <c1/> y huecos

# text
# c1: tau0
# c2: tau0
# c3: median-spacing
# c4: tau0_s
# c5: input
# c6: tau0
# c7: header
seg-6fd68aad2fd7 = Cuando el registro lleva marcas de tiempo y no se indica <c1/>, <c2/> es el espaciado mediano de marcas de tiempo consecutivas, redondeado a cuatro cifras significativas, y la fuente se notifica como <c3/>. El espaciado de un contador difiere del nominal en el desfase de frecuencia de la referencia, partes en { "10" }^{ "6" } o menos. Un <c4/> en el escenario siempre prevalece (fuente <c5/>), seguido de un comentario de cabecera <c6/> (fuente <c7/>).

# text
# c1: t0 + i·tau0
# c2: tau0
seg-59e52611a7d3 = Las muestras se sitúan en la cuadrícula <c1/>, y una época ausente es un hueco. Las lecturas a más de un { "1" } % de <c2/> fuera de la cuadrícula se descartan y se cuentan, igual que los duplicados (se conserva el primero). La política de huecos es una de estas:

# text
# c1: refuse
seg-61b1664a7c48 = <c1/> (la predeterminada): cualquier hueco es un error que cuenta los huecos;

# text
# c1: longest
seg-593c998b65e0 = <c1/>: conservar el tramo sin huecos más largo;

# text
# c1: linear
seg-f184ce746389 = <c1/>: rellenar los huecos interiores por interpolación lineal e indicar el número de huecos rellenados.

# text
seg-1f3dc3429615 = Los estimadores necesitan un registro sin huecos, por lo que aquí se resuelven los huecos.

# text
seg-0f061f726ec5 = <s1>Anterior</s1>Prueba de holdover y hardware de temporización en el bucle

# text
seg-3c89cfcbbd04 = <s1>Siguiente</s1>Seguridad del hardware

# text
seg-9b52cd5eb4be = tau0 y huecos
