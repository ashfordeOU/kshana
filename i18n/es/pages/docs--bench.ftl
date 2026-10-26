# docs--bench: translations (es)

# text
seg-5aa5efd6b7da = AUC

# text
# c1: docs/BENCH.md
seg-5fcf52aba837 = Fuente: <c1/>

# text
# c1: bench/SPEC.md
# c2: bench/LICENCES.md
# c3: xval/bench/PREREGISTRATION.md
# c4: PREREGISTRATION-v2.md
# c5: xval/bench/RESULTS-v2.md
seg-d3c3517e3bb2 = Un conjunto abierto de tareas, particiones y métricas para la detección de interferencias GNSS y el holdover de temporización. La especificación es <a1><c1/></a1> (versión { "2.0.0" }; licencia del texto y de los manifiestos: CC-BY-4.0 / CC0 propuestas, decisión del propietario pendiente). La revisión de las licencias de los conjuntos de datos está en <a2><c2/></a2>. Los umbrales de las líneas base se fijaron antes de la primera ejecución puntuada en <a3><c3/></a3> y, para { "2.0.0" }, en <a4><c4/></a4>, y sus resultados están en <a5><c5/></a5>.

# text
# c1: agc_k_sigma
seg-6c455061baac = Veredictos tal como constan allí: los umbrales del evaluador de puntuación, C1 a C3 y D2, se alcanzan; <b>A2 es NOT MET</b> (<c1/> AUC { "0.766" } frente a un mínimo de { "0.80" } en la partición de prueba), <b>D1 es NOT MET</b> (mayor diferencia { "0.0301" }) y <b>la tarea (b) R1 es NOT MET</b> (heredado, no se volvió a ejecutar). Ningún umbral se relaja.

# text
seg-ebe1c987bc7c = Qué es: una forma de comparar métodos con los mismos datos y el mismo código de métrica. Qué no es: una clasificación de productos, una aprobación ni una prueba de que un método funcione en campo. Toda puntuación es MODELLED, y una puntuación describe un registro o un corpus, nunca un producto. Los resultados de Kshana son consultivos.

# attr:alt
seg-874effe5ee80 = Las líneas base integradas de la tarea D de kshana-bench (la brecha de optimismo) en la partición de prueba, a partir de una ejecución real del motor v{ $version } (`kshana bench baseline`). Cada par de barras es el área bajo la curva ROC en los casos dentro de la distribución y en los casos desplazados; la diferencia entre ambas es la brecha de optimismo, frente a una tolerancia de { "0.05" }. fused-max-z: { "0.998" } y { "0.983" } (diferencia { "0.015" }); sqm-imbalance: { "0.882" } y { "0.882" } (diferencia { "0.001" }); agc-excess: { "0.848" } y { "0.819" } (diferencia { "0.030" }); raim-parity: { "0.682" } y { "0.672" } (diferencia { "0.010" }); energy-cn0-drop: { "0.595" } y { "0.565" } (diferencia { "0.030" }). Las etiquetas son etiquetas de un modelo generativo de un corpus sintético, nunca datos de campo: MODELLED. Consultivo: modelado o medido frente a referencias declaradas, no una aprobación, una certificación ni una declaración de ajuste a la norma. Una puntuación describe un registro o un corpus, nunca un producto.

# text
seg-6ce7bd4525d6 = Tareas

# text
seg-09907c94f04d = Tarea

# text
seg-1c6199627b90 = Datos

# text
seg-9cdfe78e3b22 = Métrica principal

# text
seg-5093217f24a1 = (a) detección en registros de receptor

# text
seg-809068c95ddf = una época de un registro de JammerTest { "2024" }

# text
# c1: scripts/fetch_jammertest2024.sh
seg-f87dda92fbd2 = obtenido mediante <c1/> (GPL-3.0+, nunca incorporado al repositorio)

# text
seg-9493bfc5bd64 = (b) detección en IQ

# text
seg-8d012e25aa62 = una ventana puntuada de una escena

# text
seg-69f020ed20da = receta de escena sintética de Kshana; TEXBAT solo como referencia

# text
seg-499ae444224e = AUC por tipo de alarma

# text
seg-73028caefeb0 = (c) predicción de holdover de temporización

# text
seg-0d0b071690cf = (satélite, origen)

# text
seg-6cf42152f523 = relojes IGS a { "300" } s (extracto confirmado, hash fijado)

# text
seg-74bd23dfebf5 = RMSE a { "3600" } s

# text
seg-3cc3545250e5 = (d) brecha de optimismo fuera de distribución

# text
seg-ab343a29b019 = un caso sintético

# text
# c1: impairment-eval
seg-b25d781ff536 = corpus <c1/>, dentro y fuera de la distribución

# text
seg-e32f49d34f7b = AUC fuera de la distribución y la diferencia

# text
seg-1ad563733f12 = Comandos

# text
# c1: kshana-bench-predictions/1
# c2: scores
# c3: predictions
# c4: kshana-bench-result/1
seg-c9d00ff2e1d0 = Un envío es un archivo (<c1/>): <c2/> (un número por identificador de caso; cuanto más alto, más probable es que esté afectado) para las tareas a, b y d, o <c3/> (el cambio de fase en ns en cada horizonte) para la tarea c. Un archivo de resultados (<c4/>) nombra la versión de la especificación, la partición, el SHA-256 de la verdad y de las predicciones, y las métricas. Los resultados de versiones mayores distintas de la especificación nunca se ponen en una misma tabla.

# text
seg-bdc715c52ab5 = Límites honestos

# text
# c1: bench/holdout/COMMITMENTS.json
seg-f26f0e79f2ed = Los conjuntos reservados de datos reales (a y c) son públicos, porque cualquiera puede descargar los datos. Protegen contra elegir una partición después de ver las puntuaciones, no contra el ajuste sobre esas carpetas. El conjunto reservado sellado de la tarea (d) es de compromiso y revelación: el propietario registra solo el hash en <c1/> y conserva la semilla (todavía no hay ninguno sellado).

# text
# c1: kshana jammertest score
seg-81c3f961230b = La verdad de la tarea (a) son las franjas de ataque programadas de los registros de eventos con resolución de un minuto, de modo que una probabilidad de detección es una cota inferior; las métricas a nivel de evento (latencia, alarmas perdidas, falsas alarmas) llegarán con el evaluador de Jammertest de <c1/>.

# text
# c1: docs/design/DETECTION-ROC.md
seg-47df52b5c5e6 = La línea base de IQ de la tarea (b) procede de <c1/>, no se volvió a ejecutar para v1.

# text
seg-d54342791763 = El corpus de la tarea (d) es una comprobación de separabilidad y de la canalización; un AUC sobre él es un AUC sobre etiquetas derivadas de un modelo.

# text
seg-3d8bfdeead6c = <s1>Anterior</s1>Observatorio de interferencias: resultados

# text
seg-07f5b51844d1 = <s1>Siguiente</s1>Ejecutar un receptor frente a un escenario
