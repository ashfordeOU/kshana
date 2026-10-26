# docs--jammertest: translations (es)

# text
seg-f8cf777c0caa = Superficies

# text
seg-45425f378b61 = significado

# text
# c1: docs/JAMMERTEST.md
seg-9367b8736d36 = Fuente: <c1/>

# text
seg-c2a40cd73d0e = Puntuación de Jammertest: el plan publicado como verdad planificada

# text
# c1: kshana jammertest import
# c2: [[events]]
# c3: kshana jammertest score
seg-a560942cbd27 = <c1/> lee el catálogo de pruebas y el plan de transmisión de Jammertest y convierte las franjas de una zona de pruebas en <c2/> de confianza del receptor. <c3/> hace pasar un registro de receptor por los monitores de confianza y lo puntúa frente a esa planificación, prueba por prueba. Todo resultado es <b>MODELLED</b>: la planificación indica cuándo estaba <em>prevista</em> una prueba, no cuándo estaba encendido un transmisor.

# text
seg-bc4e7285c38a = Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque. Nada de lo aquí expuesto cuenta con el respaldo de la Administración Noruega de Carreteras Públicas, de Nkom ni de los organizadores del evento; no se alega ningún acuerdo con ellos.

# attr:alt
seg-af0edceb1503 = Puntuación de un registro de receptor sintético frente a una planificación de tres pruebas, a partir de una ejecución real del motor v{ $version } (`kshana jammertest score`). El registro es inventado: { "1800" } s de NMEA con una caída de { "20" } dB de C/N0 en dos intervalos. La planificación enumera tres franjas; la franja central no tiene ningún inhibidor en el registro. La puntuación marca { "2" } de { "3" } pruebas detectadas (latencia mediana { "0" } s) y { "1" } no detectada, con { "0" } ejecuciones de falsa alarma en { "0.25" } h de tiempo limpio. Nada de esto dice nada sobre un receptor real. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.

# text
seg-ceaa46bdcb7e = El plan y el catálogo

# text
# c1: NPRA/jammertest-plan
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-73a5899de383 = Fuente: el repositorio <c1/> de la Administración Noruega de Carreteras Públicas (<a1>https://github.com/NPRA/jammertest-plan</a1>), con <b>licencia MIT</b> (copyright { "2024" } Administración Noruega de Carreteras Públicas; el texto de la licencia se comprueba en <c2/>). Los archivos se descargan, nunca se incorporan al repositorio:

# text
# c1: 75c0b2ceea10e470c3799d14a8ef18842d8375a7
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-2a4967d30c3a = Descarga los catálogos y los archivos del plan de { "2025" } en la confirmación fijada <c1/> y rechaza cualquier archivo cuyo SHA-256 difiera del de <c2/>.

# text
# c1: type.group.test
# c2: 1.2.5
# c3: --local-offset-h
seg-7826929c89f6 = Una prueba del catálogo tiene un identificador con puntos, <c1/> (por ejemplo <c2/>: tipo { "1" } inhibición, grupo { "2" }, prueba { "5" }). El plan indica, por zona de pruebas y franja horaria, qué identificador está programado. Los tipos { "1" } (jamming), { "2" } (spoofing) y { "3" } (meaconing) transmiten; el tipo { "0" } (reuniones informativas, periodo de gracia, reservas y franjas ad hoc) no transmite y se omite. Las horas del plan son de reloj local; <c3/> (por defecto { "2" }, CEST) indica cuánto se alejan del UTC. Los archivos del plan incluyen un campo de contacto de la prueba con el nombre de una persona: nunca se lee, y no se escribe nada derivado de él.

# text
seg-3eab33a0c38f = Importación

# text
# c1: --log-start <UTC time>
# c2: --log
# c3: --format
# c4: [[events]]
# c5: scheduled truth:
# c6: --attack-log <scenario.json>
# c7: attack_log
# c8: --time-shift-h
# c9: Z
seg-91fddde78691 = <c1/> sustituye a <c2/>/<c3/> cuando el registro no indica su inicio. La salida es TOML <c4/> para añadir a un escenario de confianza del receptor; cada etiqueta empieza por <c5/> e incluye el año de edición, el identificador del catálogo y la zona, y la cabecera registra el SHA-256 de cada archivo de origen. <c6/> lee en su lugar la verdad de eventos de una carpeta del conjunto de datos JammerTest { "2024" } (su <c7/>, con marcas de tiempo desplazadas por <c8/>, por defecto -2: dicen <c9/> pero son hora local).

# text
seg-6ed6415a6f52 = Puntuación

# text
# c1: session.toml
# c2: [log] format/path
# c3: [monitors]
# c4: [compare]
# c5: [[events]]
seg-1e72a977f7ad = <c1/> es un escenario de confianza del receptor (<c2/>, con <c3/> y <c4/> opcionales). Sus propios <c5/> se sustituyen por la planificación importada. Por cada prueba programada:

# text
seg-99427ab75a03 = campo

# text
# c1: detected
# c2: compare.detect_tol_s
# c3: late
# c4: missed
# c5: not-evaluable
seg-d2681be37798 = <c1/> (una alarma dentro de <c2/>, por defecto { "10" } s, del inicio previsto), <c3/> (más tarde, dentro de la franja), <c4/> (ninguna), <c5/>

# text
seg-01a977f18700 = primera alarma menos inicio previsto

# text
# c1: --recover-hold-s
seg-b83d1f0a1fb7 = desde el final de la franja hasta el inicio del primer tramo de al menos <c1/> ({ "10" } s) sin alarma, antes de la prueba siguiente

# text
# c1: calibration_s + guard_s
# c2: baseline_contaminated
# c3: --guard-s
# c4: --key
# c5: --out
# c6: docs/EVIDENCE-PACKS.md
# c7: config.json
seg-84a34f13e93b = Una prueba es puntuable solo si empieza al menos <c1/> después del comienzo del registro; un registro con una prueba anterior se marca como <c2/> (la línea base puede haberse formado bajo interferencia). Las <b>falsas alarmas</b> son épocas posteriores a la calibración con alarma, fuera de toda franja ampliada en <c3/> ({ "60" } s) antes y después (o después del punto de recuperación), contadas como épocas y como ejecuciones, con ejecuciones por hora de tiempo limpio. Con <c4/> y <c5/>, la ejecución se escribe como un paquete de evidencias firmado (<c6/>): el cuadro de resultados y la planificación importada están dentro de <c7/>, y por tanto dentro de la cadena de hashes y de la firma. Un paquete es un registro técnico, no un dictamen jurídico.

# text
seg-382613112d5d = Lo que un resultado no dice

# text
seg-f1cb12a89001 = Una franja planificada no es un registro de emisión real. Un transmisor puede haber empezado tarde, haber parado antes o no haber funcionado nunca; una prueba «no detectada» puede ser una prueba que no transmitió, y una latencia se mide desde el inicio previsto.

# text
seg-32baa4a4b9f0 = Una época «limpia» es «fuera de las franjas planificadas», no «demostrada libre de interferencia».

# text
seg-95cc22bbacc5 = La detección por monitores del dominio de la medida no dice nada sobre la detección de un suplantador coherente de baja potencia.

# text
seg-2e91813cf9d7 = Ninguna referencia independiente externa indica las horas reales de emisión, por lo que nada de esto es VALIDATED.

# text
seg-cfdf09e38e6e = La ejecución del conjunto de datos de { "2024" } (preregistrada)

# text
# c1: xval/jammertest-score/PREREGISTRATION.md
# c2: xval/jammertest-score/RESULTS.md
# c3: .ubx
# c4: PREREGISTRATION-v2.md
# c5: RESULTS-v2.md
# c6: 7
# c7: xval/oracles/setup.sh
# c8: tests/jammertest_score_2024.rs
# c9: KSHANA_JAMMERTEST_DIR
seg-473ed6ca71e5 = <c1/> fijó la población, las definiciones y los umbrales antes de la primera ejecución puntuada; <c2/> registra esa ejecución. Resultado: <b>la regla registrada de datos mínimos no se satisfizo</b> ({ "4" } ventanas de inhibición puntuables procedentes de { "4" } de las { "12" } carpetas <c3/>: { "5" } carpetas se descartaron por la regla de la línea base y { "3" } registros UBX indican su inicio solo como tiempo GPS de la semana), por lo que <b>no se puede evaluar ningún umbral</b>. No se aflojó ni se repitió nada. <b>v2</b> (<c4/>, confirmada por separado antes de su ejecución; solo tratamiento de datos, los mismos umbrales y la misma regla de datos mínimos) situó los registros con solo tiempo GPS a partir de la fecha de la carpeta, puntuó las { "12" } carpetas solo con CSV y usó una sesión de plataforma en movimiento para los róveres en movimiento. Resultado (<c5/>): se conservaron { "14" } de { "24" } carpetas, pero solo <c6/> ventanas de inhibición puntuables, por lo que la regla de datos mínimos volvió a no satisfacerse y <b>no se puede evaluar ningún umbral</b>. El resultado de v1 no cambia. Solo descriptivo: { "3" } de { "7" } ventanas de inhibición dieron alarma en { "10" } s, { "4" } más tarde, ninguna sin detectar; latencia mediana { "18" } s; tasa de alarmas en tiempo limpio { "0.089" }. El límite determinante es ahora la regla de la línea base, que elimina { "10" } carpetas; un nuevo registro necesitaría una regla distinta para las ventanas tempranas. El conjunto de datos (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) se descarga con <c7/> y nunca se incorpora al repositorio; la prueba <c8/> fija la ejecución registrada cuando <c9/> apunta al conjunto de datos extraído.

# text
seg-cd75b60bd0db = El conjunto de datos NMEA de SimulaMet de { "2025" }

# text
seg-87bc2544154b = El conjunto de datos derivado de NMEA de SimulaMet Jammertest { "2025" } (IEEE DataPort, DOI 10.21227/a7v4-xw11) <b>no</b> está adaptado en { "0.38" }. Su página no indica ninguna licencia y dice «This dataset requires an IEEE DataPort Subscription to access»: los términos no permiten con claridad la redistribución ni una descarga automatizada, por lo que no se escribió ningún adaptador ni script de descarga. Usarlo requiere la decisión del propietario y, idealmente, el acuerdo por escrito de los autores.

# text
# c1: kshana::jammertest
# c2: jammertest_import
# c3: jammertest_score
# c4: /kshana-jammertest
# c5: jammertest
# c6: docs/SURFACES.md
seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (los mismos nombres), herramientas MCP con los mismos nombres, y el comando <c4/> y la skill <c5/>. El paquete firmado solo está disponible en la línea de comandos (necesita una clave de firma). Véase <c6/>.

# text
seg-82aab597103a = <s1>Anterior</s1>Señal directa aumentada de LunaNet

# text
seg-fb9e48a04566 = <s1>Siguiente</s1>Entradas de máquina y de sensor
