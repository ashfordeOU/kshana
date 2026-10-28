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

seg-9c8042f0d3d7 = <b><c1/></b>: archivos de reloj RINEX, versiones { "2.00" } y { "3.00" } a { "3.04" } (incluido el campo de nombre de nueve caracteres de { "3.04" }). Se comprueba el registro <c2/> y cualquier otra versión se rechaza, indicando la versión encontrada: IGS publica el formato de reloj (<c3/>, <c4/>, <c5/>) hasta { "3.04" }, y los documentos de RINEX { "4.00" }, { "4.01" } y { "4.02" } definen solo archivos de observación, de navegación y meteorológicos, por lo que no existe una versión { "4.00" } del archivo de reloj que leer. De la cabecera solo se lee <c6/> y se omite hasta <c7/>. De los registros de datos, solo se conservan los registros <c8/> (satélite) y <c9/> (receptor o estación) de un reloj, seleccionado por nombre. Su primer campo de valor, el sesgo del reloj en segundos, es la fase. Se omiten las líneas de continuación y los registros <c10/>, <c11/> y <c12/>. Las épocas son los campos de calendario del registro, como segundos desde 1980-01-06 { "00" }:{ "00" }:{ "00" } en el propio sistema de tiempo del archivo, sin conversión.

seg-b65f4a928891 = <b><c1/></b>: registros del contador TAPR TICC (TICC Operation Manual, revisiones del { "23" } de noviembre de { "2016" } y del { "15" } de diciembre de { "2025" }, «measurement modes»). Cada campo de datos son segundos con { "12" } decimales ({ "11" } por defecto desde el firmware { "20251101" }: se lee cualquier cantidad hasta { "15" }). Una marca de tiempo se lee de su texto decimal como un número entero de femtosegundos, no como un flotante binario, de modo que la fase de un registro tomado días después de arrancar el contador conserva la resolución propia del contador: una marca de tiempo <c2/> a { "3.0e5" } s tiene una separación de { "5.8e-11" } s, unos { "60" } ps del contador.

seg-bb51bfa2a834 = El modo Paired Timestamp imprime las mismas líneas en orden de canal y se lee como modo Timestamp; el modo 3-Corner Hat añade el <c1/> sintetizado, que se lee como arriba.

seg-220bc7450e83 = La salida en modo Period y en modo Debug se rechaza. Un canal cuyas lecturas no aumentan se informa como modo Period. El modo Binary Timestamp no es texto, y un archivo de ese modo se rechaza con un mensaje que lo indica.

seg-1138c53b3eac = Su propio reloj

seg-1f9cce016fa0 = Una tabla <c1/> en el tipo de escenario de reloj informa de lo estable que fue su propio reloj, junto a la simulación: <c2/> (<c3/>) es <c4/> con un extracto de 96 lecturas de un reloj de satélite IGS como registro TimeLab en línea. Sustituya <c5/> por <c6/> y <c7/> para su propio archivo. El bloque <c8/> del resultado contiene cómo se leyó el registro (formato, <c9/> y su origen, cada hueco) y sus ADEV, TDEV y MTIE; no cambia la simulación.

seg-584564d1a734 = Conducir el holdover con su propio reloj: <c1/>

seg-56799b5fea19 = El registro se ajusta con el procedimiento de ficha de dispositivo de <c1/> (acondicionamiento, eliminación de la parte cuadrática, identificación del ruido con retardo 1, mínimos cuadrados ponderados en PM blanco, FM blanco, FM de flicker y FM de paseo aleatorio en los tiempos de promediado con al menos { "30" } grados de libertad). El reloj nombrado toma entonces <c2/>, <c3/>, <c4/> y el <c5/> ajustado; <c6/> queda como lo tiene el escenario, porque un registro contiene el desplazamiento de su referencia, no el del reloj tras la disciplina. El ruido de fase blanco se ajusta y se informa, pero no se simula. El resultado gana un bloque <c7/> (los coeficientes, los puntos de ajuste, los valores que usó la ejecución, lo que se dejó fuera, el SHA-256 del registro) y el reloj lleva el identificador <c8/>. Con <c9/> el conjunto toma muestras del reloj ajustado (el bloque <c10/> necesita <c11/>). Un ajuste sin ruido de frecuencia, un registro demasiado corto para ajustar y un <c12/> distinto de <c13/> o <c14/> son errores que lo indican. <c15/> es un ejemplo ({ "6" } horas de un reloj de satélite IGS).

seg-fe695061eed3 = Lo que muestra la comparación con ruido conocido (<c1/>), y qué tener en cuenta:

seg-90657795ba62 = Alcanzado: el nivel de FM blanco se recupera dentro del { "5" } % en cada registro sintético que lo tiene; la ficha ajustada reproduce la desviación de Allan verdadera dentro de un factor de { "1.35" } en cada tiempo de promediado en que se ajustó; el exponente de ruido que identifica el ajuste es igual al de allantools en cada punto (en el registro 5071A, una vez que el salto de fase que elimina el acondicionamiento se elimina también de la entrada de allantools).

seg-f1ec27a393ae = <b>No alcanzado, y fijado por la prueba:</b> el FM de paseo aleatorio solo se recupera cuando domina los tiempos de promediado más largos del registro, e incluso entonces en uno de tres registros; en una serie de { "131 072" } s con un cruce en { "3 000" } s, el ajuste se lo atribuyó al FM de flicker y a la deriva. La separación entre el FM de paseo aleatorio y el FM de flicker no es fiable a partir de un solo registro. La ejecución reproduce la estabilidad del registro en los tiempos de promediado que este cubre; más allá de ellos las dos opciones divergen (el FM de flicker es un piso constante, el FM de paseo aleatorio crece como la raíz cuadrada del tiempo de promediado).

seg-88ba5ae782d4 = MODELLED: un escenario hipotético para el ruido de ese reloj tal como lo muestra el registro, no una calibración del reloj ni una predicción de su comportamiento futuro.

seg-6e88b597bbf0 = Un registro malformado es un error que indica lo que se encontró (la línea, la versión, el selector que falta), nunca un resultado parcial: <c1/> fija { "24" } casos de ese tipo.

seg-4a05abb27420 = MODELLED. Esto es un analizador, y su salida alimenta estimadores que se validan en otro lugar frente a allantools. Las pruebas unitarias de <c1/> usan registros pequeños escritos a mano, y para los formatos linuxptp y chrony los archivos de prueba de <c2/>. <c3/> ejecuta la comparación preregistrada en <c4/>: tres registros sintéticos con semilla, uno por formato, releídos por un lector independiente escrito a partir de esta página por el mismo autor, con las ADEV, TDEV y MTIE comprobadas frente a allantools { "2024.6" }; esa comparación cubre solo los tres primeros formatos, y los lectores de linuxptp y chrony tienen pruebas de analizador pero ninguna comparación con una referencia independiente. Los registros de esa comparación son sintéticos, de modo que nada de lo que contienen describe un reloj ni un contador reales; la comparación con series medidas se describe más abajo.

seg-576211abf0b4 = Con datos medidos

seg-3c8d10e8bd1c = <c1/> ejecuta la comparación preregistrada en <c2/> (confirmada antes de cualquier archivo de prueba o ejecución) sobre cuatro series medidas: el <c3/> de Stable32, las primeras { "65 536" } lecturas de un reloj de cesio 5071A frente a un máser de hidrógeno, y los relojes del satélite IGS G01 ({ "30" } s) y de la estación ABMF ({ "300" } s) del reloj final de IGS del 2026-08-02, como un recorte incluido con su NOTICE. Los dos primeros no tienen ninguna concesión de redistribución: los registros escritos a partir de ellos están en <c4/>, ignorado por git (<c5/>), y la prueba lo indica y pasa cuando faltan, salvo con <c6/>. Cada registro lo leen el motor y un lector independiente, y las ADEV, TDEV y MTIE se comparan con allantools { "2024.6" }. Registrado en <c7/>: en el lector tal como se entregó, los registros TICC, la versión de la cabecera y cinco mensajes de error no alcanzaron los umbrales preregistrados; se corrigieron y la comparación se repitió sin cambios. Alcanzado, salvo un par: la MTIE de un registro de frecuencia difiere de la de allantools, porque allantools integra la frecuencia menos su media (fijado como NOT MET; la comparación equivalente se alcanza). La fila sigue siendo MODELLED: los registros TICC son datos de reloj medidos recodificados al formato del contador por nuestro script (no se encontró ninguna captura TICC real), y el lector de referencia tiene el mismo autor que el del motor.

seg-52778d17f4db = Conducir el holdover con su propio reloj: [clock_fit]
