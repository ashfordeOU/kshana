# docs--test-bench: translations (es)

# text
seg-e305279d5b11 = Contenido

# text
seg-245fe1f87b08 = Archivo

# text
# c1: docs/TEST-BENCH.md
seg-292871e5747d = Fuente: <c1/>

# text
seg-d18a29239225 = Ejecutar un receptor contra un escenario exportado

# text
# c1: kshana receiver-trust
seg-aa3498c7cb16 = Un fabricante de receptores que posea un simulador GNSS de laboratorio puede reproducir con él el movimiento del vehículo de un escenario de Kshana, registrar lo que hace el receptor sometido a ensayo y puntuar ese registro con <c1/> frente a sucesos declarados antes de la ejecución. Kshana aporta el movimiento, los instantes de los sucesos y la puntuación. <b>No escribe ninguna señal</b>: nada de lo que se exporta aquí sintetiza, modela ni transmite una forma de onda de radiofrecuencia o de banda base, y un suceso exportado es un intervalo de tiempo etiquetado, no una receta para producir interferencia. El simulador y su operador aportan las señales, y el operador es responsable de ejecutarlas solo donde esté autorizado (conducidas o apantalladas, según las propias instrucciones de seguridad del simulador).

# text
seg-414c7774d133 = Esta página es un método. No publica resultados.

# text
seg-a0ad7b35922f = { "1" }. Exportar

# text
# c1: gnss-ins
# c2: jamming
# c3: gnss-sim
# c4: jamming
# c5: --epoch
# c6: YYYY-MM-DDTHH:MM:SS
# c7: Z
seg-798d75d3b65c = Se aplica al tipo <c1/> (un perfil de conducción con actitud; los sucesos son las interrupciones del estado de navegación) y a <c2/> y <c3/> (un receptor estacionario durante la duración del escenario; el jammer de un escenario <c4/> es un único suceso a lo largo de la ejecución). Otros tipos explican por qué no tienen trayectoria de vehículo. <c5/> es el instante UTC del tiempo cero del movimiento (por defecto 2024-01-01T00:{ "00" }:00Z); los escenarios no llevan fecha de calendario propia para el movimiento del vehículo. Debe ser un instante UTC real, <c6/> (se acepta una <c7/> final) con el año entre { "2000" } y { "2099" } y cada campo dentro de rango; cualquier otra cosa se rechaza. La salida es idéntica byte a byte para el mismo escenario y la misma época.

# text
# c1: time_s
# c2: x_m,y_m,z_m
# c3: vx_m_s,vy_m_s,vz_m_s
# c4: lat_deg,lon_deg,h_m
# c5: heading_deg,pitch_deg,roll_deg
# c6: utc
# c7: kshana_row
seg-c153d8ef8735 = una fila por muestra: <c1/>, <c2/> fijas a la Tierra, <c3/>, <c4/> geodésicas, <c5/>, <c6/>, <c7/>

# text
seg-fa4c8c0d2b72 = la época, los marcos, las unidades, las columnas y las tolerancias de ida y vuelta de ese CSV

# text
# c1: GGA
# c2: RMC
seg-8c74ca211e3a = Sentencias NMEA { "0183" } <c1/> y <c2/> por muestra, con sumas de comprobación

# text
# c1: RESOLUTION: <ms>
# c2: longitude,latitude,altitude
seg-2b0fd541f1dc = una línea <c1/> y luego filas <c2/> (se escribe solo cuando todos los intervalos de muestreo son el mismo número entero de milisegundos; si se omite, el comando indica el motivo por la salida de error estándar)

# text
# c1: [[events]]
# c2: receiver-trust
seg-d09d2dab9a17 = los mismos sucesos como bloques <c1/> para un escenario <c2/>

# text
# c1: kshana.test-conditions/1
# c2: receiver-log
# c3: recording.path
# c4: recording.sha256
# c5: receiver.*
# c6: type
seg-866a3c4870af = la ejecución como documento <a1><c1/></a1> para una grabación <c2/>: los sucesos como verdad declarada, con <c3/>, <c4/>, <c5/>, el <c6/> de cada suceso y la potencia que el laboratorio debe rellenar

# text
seg-9ea6a94d4586 = Marcos y convenciones

# text
# c1: x
# c2: z
# c3: lat_deg
# c4: lon_deg
# c5: h_m
# c6: h_m
seg-8d3b7d2ef815 = <b>Posición:</b> WGS { "84" }, fija a la Tierra (ECEF: <c1/> a través del ecuador en el meridiano de Greenwich, <c2/> a través del polo); <c3/>, <c4/>, <c5/> dan la misma posición en forma geodésica, <c6/> sobre el elipsoide.

# text
seg-93a2975d2a19 = <b>Velocidad:</b> ejes fijos a la Tierra, relativa a la Tierra.

# text
# c1: heading_deg
# c2: pitch_deg
# c3: roll_deg
seg-be05c2278e98 = <c1/> en sentido horario desde el norte verdadero en [{ "0" }, { "360" }), <c2/> positivo con el morro hacia arriba, <c3/> positivo con el ala derecha hacia abajo; guiñada-cabeceo-alabeo (3-2-1) desde el marco local norte-este-abajo hasta los ejes del cuerpo x adelante, y derecha, z abajo. Una fuente estacionaria escribe ceros. NMEA y el texto de puntos de ruta no llevan actitud.

# text
# c1: gnss-ins
# c2: automotive-urban-canyon
# c3: RMC
# c4: atan2(v_east, v_north)
seg-3c3ad1295628 = <b>El rumbo es la guiñada del cuerpo, no la dirección de desplazamiento.</b> En el perfil de conducción <c1/> el cuerpo guiña en ondas cuadradas mientras la velocidad sigue su curso, de modo que el rumbo y el rumbo sobre el suelo pueden diferir en decenas de grados (hasta unos { "77" } grados en el escenario incluido <c2/>). El rumbo <c3/> de NMEA es el rumbo sobre el suelo, la dirección del vector de velocidad, de modo que un simulador que lea el rumbo del archivo de movimiento y otro que lea el rumbo del archivo NMEA ven ángulos distintos. El rumbo sobre el suelo del CSV es <c4/> de su velocidad rotada a norte-este-abajo.

# text
# c1: gnss-ins
# c2: h_m
# c3: automotive-urban-canyon
seg-224b53995157 = <b>La altura sigue al escenario.</b> Para <c1/>, <c2/> es el avance propio del tipo en plano tangente de su verdad y no se mantiene constante (unos { "7" } m a lo largo de los { "180" } s de <c3/>); es el movimiento del escenario, escrito tal cual.

# text
# c1: GGA
seg-f78a354f96ee = <b>Valores de relleno de NMEA <c1/>.</b> La calidad de posición ({ "1" }), los satélites usados ({ "12" }) y el HDOP ({ "1.0" }) se escriben solo para que la sentencia esté bien formada. No dicen nada sobre la geometría del escenario ni sobre ningún estado del receptor.

# text
# c1: time_s
seg-f5cd510aac0c = <c1/> tras la época, UTC, sin modelar los segundos intercalares.

# text
# c1: GGA
seg-d2a2f655760d = <b>Las alturas NMEA son elipsoidales.</b> La altitud de <c1/> contiene la altura elipsoidal y la separación del geoide se escribe como { "0.0" }. Un simulador que trate la altitud como altura sobre el nivel medio del mar situará el vehículo desviado en la ondulación local del geoide.

# text
seg-ee3a9a3ec84d = <b>Tolerancias de ida y vuelta</b> (comprobadas leyendo de nuevo cada archivo): posición del CSV { "0.1" } mm, latitud y longitud { "1e-9" } grados, velocidad { "0.1" } mm/s, ángulos { "1e-6" } grados; posición horizontal de NMEA { "5" } mm, altura { "1" } mm, velocidad { "0.001" } nudos, rumbo { "0.001" } grados.

# text
seg-a554992d2694 = Carga de los archivos en un simulador

# text
seg-757382614413 = Los simuladores de laboratorio difieren, y este repositorio no reproduce el manual de ningún simulador. Compruebe cuál de los formatos anteriores lee el suyo, y sus requisitos declarados:

# text
# c1: gnss-ins
# c2: [time] step_s
seg-cc49ceccea20 = Muchos importadores de movimiento esperan una tasa de actualización fija, habitualmente de { "10" } Hz. El escenario <c1/> avanza a { "0.1" } s; para un escenario estacionario, fije <c2/> a la tasa que quiera su simulador.

# text
seg-e98bf4bf6c6e = Algunos importadores omiten las muestras que caen entre segundos enteros, o ignoran la columna de tiempo y usan el orden de las filas. Inicie el movimiento en un segundo entero y mantenga la rejilla regular.

# text
# c1: run1.motion.csv
# c2: run1.motion.json
seg-3c470262eb15 = Un importador de CSV que permita asignar columnas puede leer <c1/> directamente: elija las columnas fijas a la Tierra o geodésicas y fije sus unidades a partir de <c2/>. Truncar los decimales produce una aceleración falsa, de modo que conserve la precisión escrita.

# text
# c1: run1.events.csv
seg-41a2bfe45b37 = El archivo es solo de movimiento. Configure la constelación, la interferencia y el extremo frontal del receptor en el simulador, y sincronícelos con los sucesos de <c1/>.

# text
seg-024ab011a2e3 = Kshana no escribe ninguna interfaz de scripts de fabricante.

# text
seg-6d67d4e2cdf0 = Comprobado con los lectores de un simulador de código abierto

# text
# c1: tests/testbench_gpssdrsim_oracle.rs
# c2: xval/testbench-gpssdrsim/PREREGISTRATION.md
seg-e4ce0597a644 = Los lectores de movimiento de gps-sdr-sim (MIT, commit 28ca29a6) recibieron las exportaciones de ocho escenarios incluidos. Cada lector devolvió la trayectoria exportada (<c1/>, preregistrado en <c2/>):

# text
seg-3caed3fc2e47 = Opción de gps-sdr-sim

# text
seg-ad9e78555851 = Entrada que se le da

# text
seg-4f9be75880d3 = Peor diferencia respecto al CSV

# text
# c1: -g
seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

# text
# c1: run1.nmea
seg-e03dd1d45ced = <c1/> tal como está escrito

# text
seg-8d28fbcc4c4a = { "1.2" } mm

# text
# c1: -x
seg-fd39660fcb73 = <c1/> (tiempo, latitud, longitud, altura)

# text
seg-c4e171cbf0de = { "0.15" } mm

# text
# c1: -u
seg-390b0c0fb695 = <c1/> (tiempo, x, y, z)

# text
seg-ff26559a85e8 = exacto

# text
# c1: -u
seg-f4c13a327904 = No dé a <c1/> el CSV de movimiento completo. Su lector admite { "100" } caracteres por línea, y una fila del CSV tiene unos { "160" } caracteres, de modo que cada fila se lee como dos muestras. La línea de encabezado se lee como una muestra más sin números.

# text
# c1: gnss-ins
# c2: gnss-ins-maritime
seg-43cc6f9c50b2 = gps-sdr-sim admite como máximo { "3000" } muestras, { "300" } s a su { "10" } Hz fijos, e ignora la columna de tiempo. Las exportaciones de <c1/> avanzan exactamente a { "0.1" } s. Los escenarios más largos, como <c2/> de 20 minutos, solo se leen hasta sus primeros { "300" } s.

# text
seg-500243b6e402 = Esto comprueba que los archivos se leen tal como están escritos. No comprueba la física del escenario ni nada de lo que transmite el simulador.

# text
seg-a4c4514276e9 = { "2" }. Declare lo que va a puntuar antes de la ejecución

# text
# c1: run1.events.toml
# c2: receiver-trust
seg-3a3e2be36c65 = El archivo de sucesos da los intervalos que define el escenario. Copie <c1/> en un escenario <c2/>, añada cualquier predicción que quiera comprobar y fije los umbrales de los monitores y las tolerancias <b>antes</b> de que se ejecute el receptor. No los ajuste tras ver el registro; el escenario, los umbrales y el SHA-256 del registro están todos en el hash del resultado.

# text
# c1: jamming
# c2: jamming
# c3: other
# c4: kind
seg-d07b9ad8cfa9 = Los sucesos exportados llevan el propio tipo de escenario: el jammer de un escenario <c1/> es <c2/>; una interrupción del estado de navegación es <c3/>, porque el escenario declara que GNSS no estaba disponible, no cómo. Cambie el <c4/> para que coincida con lo que configure que haga el simulador.

# text
seg-faa87b3ba315 = { "3" }. Ejecute el receptor

# text
seg-0a3b63cf5615 = Inicie el receptor y su registrador, inicie el escenario del simulador con el archivo de movimiento y deje que la ejecución abarque el intervalo de calibración, cada suceso y un margen tras el último. Conserve el registro propio del receptor (UBX, observaciones RINEX { "3" }, un CSV de registrador de Android o NMEA con sentencias de estado de satélites). Un registro sin intensidad de señal por satélite aún puede puntuarse sobre la posición del propio receptor, pero los monitores de relación portadora/ruido la necesitan.

# text
seg-fbbc12dfeb3f = { "4" }. Alinee los relojes

# text
# c1: receiver-trust
# c2: d
# c3: d
# c4: onset_s
# c5: end_s
# c6: name
seg-5828311af3d4 = <c1/> cuenta los instantes de los sucesos desde la primera época del registro del receptor; el archivo de movimiento cuenta desde su primera muestra. Si el registro empieza <c2/> segundos antes de la primera muestra del movimiento, añada <c3/> a cada <c4/> y <c5/>. Registre el desfase y cómo lo midió, y declárelo en el <c6/> del escenario o en un comentario, ya que un desfase erróneo desplaza cada puntuación. Los instantes de los sucesos por sí solos no permiten conocer el desfase; use el marcador de inicio de escenario del simulador o las propias marcas de tiempo del receptor.

# text
seg-22f7b68c445b = { "5" }. Puntúe

# text
# c1: bench-session.result.json
# c2: .trust.csv
# c3: .trust.svg
# c4: detected
# c5: late
# c6: missed
# c7: not-evaluable
seg-e024186a2874 = escribe <c1/>, <c2/> y <c3/>. Para cada suceso, el resultado da las falsas alarmas antes del inicio, la primera alarma y sus monitores, la latencia y el desenlace (<c4/>, <c5/>, <c6/>, <c7/>), además de una caída prevista y otra observada de la relación portadora/ruido donde usted declaró una predicción. Un desacuerdo se informa, nunca se ajusta para eliminarlo. Véase <a1>RECEIVER-TRUST.md</a1>.

# text
seg-5fa1e4890f91 = Para ver a qué filas de marcos públicos aporta evidencias a favor la sesión:

# text
seg-abc6aaf44c95 = Véase <a1>compliance/README.md</a1>. Ese informe describe las evidencias de las ejecuciones que se le dan; no formula ninguna conclusión sobre el receptor ni sobre ningún marco.

# text
seg-69fa39640c2d = { "6" }. Vincule la ida y vuelta en un único paquete firmado

# text
# c1: kshana evidence round-trip
# c2: run1.conditions.json
seg-f24e2dd64c47 = Tras puntuar, <c1/> une los cuatro registros: el escenario que exportó, las <a1>condiciones de ensayo</a1> del laboratorio, el registro del receptor y la puntuación. Rellene <c2/> (la ruta y el SHA-256 del registro, el receptor sometido a ensayo, el tipo y la potencia declarada de cada suceso) y, después:

# text
# c1: round-trip-pack/config.json
# c2: round_trip
# c3: kshana.round-trip/1
# c4: scenario_sha256
# c5: conditions_hash
# c6: log_sha256
seg-78bed55de550 = <c1/> lleva un bloque <c2/> (<c3/>) con <c4/>, <c5/>, <c6/> y la puntuación (sucesos detectados de los evaluables, primera alarma), cubierto por los hashes del manifiesto y por la firma. El comando rechaza un paquete cuyas condiciones y sucesos de puntuación no coinciden, o cuyo hash de registro declarado no es el del registro. Como todo paquete de evidencias, es un registro técnico, no un dictamen jurídico.

# text
seg-5fe6548911da = Ejemplo práctico: gps-sdr-sim escribiendo un archivo

# text
seg-eeccc823e109 = Este ejemplo usa el simulador de código abierto gps-sdr-sim solo para <b>escribir un archivo de banda base</b> a partir del movimiento exportado. Kshana no transmite, y nada de esta página automatiza la reproducción de ese archivo a través de una radio. Si su laboratorio reproduce un archivo así en un receptor, es responsabilidad de su operador, y se hace solo donde esté autorizado (por cable o apantallado, siguiendo las propias instrucciones de seguridad del simulador y de la radio); Kshana ni lo documenta ni lo envuelve.

# text
# c1: run1.iq
# c2: tests/round_trip_pack.rs
seg-db81fdadfd19 = Lo que haga después el laboratorio con <c1/> ocurre fuera de Kshana. El propio registro del receptor, se obtenga como se obtenga, es lo que puntúa el paso { "5" } y vincula el paso { "6" }. Los archivos y las comprobaciones que Kshana hace sobre sus propias exportaciones se prueban solo con datos sintéticos (<c2/>); aquí no se afirma ninguna ejecución de laboratorio.

# text
seg-dffcbdb8e6c3 = Lo que este método no hace

# text
seg-d0b62c238953 = No produce una señal, y no dice qué interferencia debe generar un simulador. Los sucesos dicen cuándo, no qué.

# text
seg-3aa11bed60c8 = Una sola sesión es un único dato. El resultado describe ese registro con esa configuración, y no dice nada sobre otros receptores, firmware, antenas ni interferencia real.

# text
seg-b156403456e4 = Las alturas, las tasas y la alineación temporal corresponde comprobarlas al operador frente al simulador; la exportación declara sus propias convenciones y tolerancias, y nada más.

# text
seg-337ff53bc890 = <s1>Anterior</s1>kshana-bench

# text
seg-87be81f5e600 = <s1>Siguiente</s1>Correspondencia de compliance
