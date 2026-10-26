# docs--kinds-clocks-timing-and-holdover: translations (es)

# text
seg-b03d56f501c3 = Tipo

# text
seg-78cba87823f7 = Holdover del reloj frente a la especificación; conjunto de Monte Carlo opcional (ejecuciones > { "1" }).

# attr:alt
seg-cb0b7da83f5c = El gráfico que escribe el motor para scenarios/clock-ensemble.toml, tipo de escenario clock

# text
seg-c0924aa36e64 = Prueba de holdover MODELLED de un sistema de temporización, puntuada a partir de un registro de error de tiempo que suministra el OPERADOR (un registro de linuxptp ptp4l, phc2sys o ts2phc, un registro de seguimiento o estadísticas de chrony, un registro de reloj TICC, TimeLab o RINEX, o pares time_s,time_error_ns). La prueba tiene cuatro pasos y Kshana no realiza ninguno: una LÍNEA BASE con enganche, GNSS RETIRADO por el operador (el cable de antena o la salida del simulador; Kshana no transmite ni controla nada) en un instante indicado, HOLDOVER con el oscilador propio del sistema, y RECUPERACIÓN después de que el operador restablezca el GNSS en un segundo instante indicado. El registro se divide en esos dos instantes. Línea base: estadísticas de error de tiempo y las máscaras de ITU-T escritas para un reloj enganchado. Holdover: estadísticas, el desvío fraccionario de frecuencia que mantuvo el sistema (una recta de mínimos cuadrados), las máscaras escritas para holdover o para un reloj autónomo, la envolvente de holdover de ePRTC-A a partir de la duración indicada de enganche, y el tiempo hasta superar cada presupuesto de error de tiempo. Recuperación: si |TE| entró dentro de una banda indicada y cuándo, y si permaneció en ella, el máximo y el mayor salto. Todo límite se transcribe de una tabla pública de ITU-T (las máscaras de temporización de telecomunicaciones); las palabras son «medido frente a la máscara», y los dos instantes son una declaración del operador, no verificada. Un registro demasiado corto para una máscara es INCOMPLETE, nunca se extrapola. Véase docs/TIMING-HIL.md.

# attr:alt
seg-8ce93392747b = El gráfico que escribe el motor para scenarios/holdover-test-ptp4l.toml, tipo de escenario holdover-test
