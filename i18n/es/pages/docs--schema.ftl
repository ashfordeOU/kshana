# docs--schema: translations (es)

# text
seg-2247a2344710 = Significado

# text
seg-f42465f7d066 = ns

# text
seg-6940543aa3c0 = cadena

# text
seg-f5e7215e6835 = objeto

# text
seg-9da5d92757bd = objeto, opcional

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-c353e7bec219 = Clave

# text
seg-a129b9e613d0 = Tipo

# text
# c1: docs/SCHEMA.md
seg-e28387d70be0 = Fuente: <c1/>

# text
# c1: *.result.json
seg-49d2afecf5f1 = Esquema de resultados: cómo leer un <c1/> de Kshana

# text
# c1: RunResult
# c2: src/report.rs
# c3: FoMScores
# c4: src/fom.rs
seg-c128455c353c = Cada ejecución escribe, junto al escenario, un artefacto JSON (JavaScript Object Notation) versionado y autodescriptivo. Esta página es la guía escrita a mano para quien lee la envoltura de intercambio y las estructuras de resultados de <b>reloj y órbita</b>: la <b>unidad</b> de cada campo, dónde se calcula en el código fuente y cómo leerlo. El tipo canónico es <c1/> en <a1><c2/></a1>; las figuras de mérito son <c3/> en <a2><c4/></a2>.

# text
seg-092ea1e33a05 = <b>No</b> es la referencia completa de campos. El motor despacha sobre muchos más tipos que estos dos, y cada uno emite su propio paquete. La referencia completa (unidad, clase de procedencia y definición de cada campo numérico de cada tipo integrado) se genera, no se escribe a mano: véase <a1>Unidades y procedencia, por campo, de cada tipo</a1> más abajo.

# text
seg-e4c4b66a2f46 = Envoltura de intercambio (KIF, el Formato de Intercambio de Kshana): reconocer un artefacto y comprobar su versión

# text
# c1: Envelope
# c2: src/interchange.rs
seg-9b83bb817814 = Los artefactos de Kshana pueden envolverse en una <b>envoltura de intercambio</b> neutra y autodescriptiva para que una herramienta de terceros reconozca el archivo y decida si puede leerlo <em>antes</em> de comprometerse con un esquema de carga útil. El tipo canónico es <c1/> en <a1><c2/></a1>.

# text
# c1: "kshana-interchange"
# c2: FORMAT_TAG
seg-e4fd08930644 = Siempre <c1/> (<c2/>): cómo reconoce una herramienta ajena un artefacto de Kshana.

# text
# c1: MAJOR.MINOR
# c2: SCHEMA_VERSION
seg-abd853f2ce49 = La versión de esquema <c1/> (<c2/>, la única fuente de verdad de todo el crate).

# text
# c1: "scenario"
# c2: "run-result"
# c3: "trade-study"
seg-ee9f238072f1 = Tipo de artefacto, p. ej. <c1/>, <c2/>, <c3/>: permite a un consumidor encaminarlo sin analizar el cuerpo.

# text
# c1: Cargo.toml
seg-29ad4bedd64f = Versión del crate (<c1/>) que produjo la carga útil.

# text
# c1: Scenario
# c2: RunResult
seg-52f3e962c049 = El artefacto envuelto como JSON canónico (un <c1/>, un <c2/>, …).

# text
# c1: MAJOR.MINOR
# c2: #[serde(default)]
# c3: Compatible
# c4: ForwardIncompatible
# c5: MajorIncompatible
# c6: Envelope::parse
seg-6fe0d7cd4165 = <b>Contrato de compatibilidad.</b> Las versiones son <c1/>. Los campos nuevos se añaden con <c2/> (la <em>disciplina aditiva</em>), de modo que un lector puede analizar cualquier artefacto de la <b>misma versión mayor y de una menor igual o anterior</b> (<c3/>). Una <b>versión menor estrictamente más reciente</b> (<c4/>) puede contener campos que este lector no puede atender, y una <b>versión mayor distinta</b> (<c5/>) es una ruptura estructural: <c6/> rechaza ambas, pues valida la etiqueta de formato y la versión en la frontera en lugar de analizar mal en silencio una entrada ajena.

# text
# c1: scenario + seed + engine_version
# c2: engine_version
# c3: scenario_hash
seg-f7ae91002e56 = <b>Determinismo.</b> La envoltura <b>no lleva marca de tiempo</b>: la promesa de reproducibilidad de Kshana (<c1/> reproduce una ejecución) lo exige. La procedencia reside en <c2/> y en el propio <c3/> de la carga útil.

# text
# c1: Envelope::payload_as::<T>()
# c2: Deserialize
# c3: Scenario
# c4: payload
seg-bb0b742d2df8 = Una lectura tipada (<c1/>) funciona con cualquier carga útil que implemente <c2/> (p. ej. <c3/>). Los artefactos de resultados son solo de serialización por diseño y se leen como el valor JSON en bruto de <c4/>.

# text
seg-87be7aa00b17 = Nivel superior (paquetes de reloj y órbita)

# text
seg-cc22d9206eb4 = Tipo / unidad

# text
seg-3a821855c582 = Versión del esquema de resultados (independiente de la versión del motor).

# text
# c1: Cargo.toml
seg-cc6dded799f9 = Versión del crate (<c1/>) que produjo el archivo.

# text
seg-5a69a99b9a87 = cadena hexadecimal

# text
# c1: scenario + seed + engine_version
seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) del JSON canónico del escenario: la ejecución es reproducible a partir de <c1/>.

# text
# c1: seed + 0x9e3779b97f4a7c15
seg-ba73ba76873e = Semilla del RNG (generador de números aleatorios) de la ejecución cuántica (la clásica usa <c1/>).

# text
seg-a688dd98c588 = nanosegundos

# text
# c1: threshold_ns
seg-24e0f04033fa = La especificación de temporización: un error dentro de ±<c1/> está «dentro de especificación».

# text
seg-f52388753a1a = escenario

# text
# c1: ClockRun
seg-15b4082a6455 = objeto (<c1/>)

# text
seg-7d3b92769bf5 = La ejecución del sensor cuántico (véase más abajo).

# text
seg-aa665b955931 = La ejecución del sensor clásico, a efectos de comparación.

# text
seg-152ae43896b3 = Mapa de unidad y procedencia por campo de este documento, indexado por ruta de campo. Véase §Unidades y procedencia más abajo.

# text
# c1: figures
# c2: path
# c3: quantum.fom.timing_p95_ns
# c4: tier
# c5: VALIDATED
# c6: MODELLED
# c7: requirement
# c8: applicable
# c9: applicable
# c10: false
# c11: reason
# c12: security
# c13: fom.security
# c14: untiered
# c15: hybrid
# c16: fusion
# c17: clock
# c18: orbit
# c19: hybrid
# c20: fusion
# c21: fom_label::kind_figures
# c22: api::without_figure_tiers
# c23: lunar-station-coverage
# c24: docs/predictions/lunar-reference-station.md
# c25: figure_tiers
# c26: leo-ppp
# c27: solar-system
# c28: optical-atmosphere
# c29: sweep
# c30: sweep-nd
# c31: lunar-attack-surface
# c32: fom_label::KINDS_EXCLUDED_FROM_FIGURE_TIERS
seg-119bac9b3e6f = El nivel de verificación de cada figura de mérito informada, y siempre la última clave del documento. <c1/> enumera una entrada por cada figura presente: <c2/> (p. ej. <c3/>), <c4/> (<c5/> = comprobada frente a una referencia externa independiente, <c6/> = de primeros principios, con pruebas internas), <c7/> (la fila de la matriz de verificación de la que se lee el nivel) y <c8/>. <c9/> es <c10/>, con un <c11/>, para <c12/> en todo escenario sin ataque configurado: la cota permanece en <c13/>, pero no responde a ninguna pregunta que plantee el escenario. <c14/> enumera toda figura que no pertenece a ninguna fila de la matriz (las figuras de posición de <c15/> y <c16/>), en lugar de asignarle un nivel. Lo emiten los tipos <c17/> (ejecución única y conjunto de Monte Carlo), <c18/>, <c19/> y <c20/>, que lo construyen dentro de su ejecución, y ({ "0.36" }, RM-04) todos los demás tipos para sus figuras principales, añadido tras la ejecución a partir de la tabla por tipo <c21/>; <c22/> lo retira y devuelve el documento sin niveles byte a byte. No lo emite <c23/>, cuyo resultado es una predicción congelada y preregistrada (<c24/>): ese tipo no tiene <c25/> hasta que una nueva predicción fechada la sustituya. Tampoco lo emiten <c26/>, <c27/>, <c28/> ({ "0.37" }; matrices por emplazamiento), <c29/> y <c30/>, que no tienen una figura principal escalar, ni <c31/>, cuyo documento es JSON compacto (<c32/> da cada motivo), ni los documentos de miembros incrustados de una campaña. No lleva números.

# text
# c1: samples_total
# c2: samples_with_fix
# c3: sigma_uere_m
# c4: best_pdop
# c5: median_pdop
# c6: best_position_sigma_m
# c7: median_position_sigma_m
# c8: sigma_uere_m
seg-1448f90f0086 = Resumen de la geometría del paquete de órbita: <c1/>, <c2/>, <c3/> (m, el presupuesto de error de distancia por satélite modelado), <c4/> / <c5/> (adimensionales) y <c6/> / <c7/> (m, PDOP (dilución de la precisión de posición) × <c8/>). <b>Solo el paquete de órbita.</b>

# text
# c1: [x, y, z]
seg-ae4f8eed06ac = matriz de <c1/> km, opcional

# text
seg-d13d827f54b0 = Trayectoria inercial centrada en la Tierra, propagada, de la nave del usuario, una entrada por cada instante muestreado. <b>Solo el paquete de órbita</b>; se omite en los demás. Solo de salida: no se incluye en el hash.

# text
# c1: StudyMeta
seg-8f511d5de657 = objeto (<c1/>), opcional

# text
seg-ea152e097d6f = Metadatos aditivos del informe (título del estudio, sello de generación, autor, aviso legal). Se omite cuando no existe, de modo que una ejecución sin metadatos es idéntica byte a byte a la salida anterior. Solo de salida: no se incluye en el hash.

# text
# c1: ClockRun
# c2: quantum
# c3: classical
seg-1041873fba1b = <c1/> (cada uno de <c2/> / <c3/>)

# text
# c1: optical-sr-lattice
seg-3fa81140c10d = Identificador del sensor (p. ej. <c1/>).

# text
# c1: clock
seg-80765d202558 = Tipo de modelo (p. ej. <c1/>).

# text
seg-6bf458d964fe = Cita o fuente de los parámetros del sensor.

# text
seg-9145f04a557f = Los parámetros del modelo utilizados, en bruto.

# text
# c1: {t, error_ns, gnss}
seg-697940342a28 = matriz de <c1/>

# text
# c1: t
# c2: error_ns
# c3: gnss
# c4: nominal
# c5: degraded
# c6: denied
seg-b5f4216b55a2 = Serie temporal por paso: <c1/> segundos, <c2/> el error de temporización en <b>nanosegundos</b>, <c3/> uno de <c4/>/<c5/>/<c6/>.

# text
# c1: FoMScores
seg-7fba0b91b75e = objeto (<c1/>)

# text
seg-5c4b60012f0e = Las figuras de mérito puntuadas (más abajo).

# text
# c1: {tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}
seg-1308a29c6a5b = matriz de <c1/>

# text
# c1: tau_s
# c2: adev
# c3: n_samples
# c4: noise
# c5: WhiteFm
# c6: edf
# c7: ci_lo
# c8: ci_hi
# c9: adev
# c10: allan.rs:overlapping_adev_curve
seg-bbd42065492c = Desviación de Allan solapada: <c1/> el tiempo de promediado (s), <c2/> la estabilidad fraccionaria de frecuencia adimensional σ_y(τ), <c3/> el recuento de solapamiento que hay tras ese punto, <c4/> el tipo de ley de potencias identificado a partir de la pendiente de la MDEV (desviación de Allan modificada) (p. ej. <c5/>), <c6/> los grados de libertad efectivos específicos del tipo de ruido y <c7/>/<c8/> la banda de confianza del { "95" }% basada en χ² de <c9/> en ese τ. Calculado en <c10/>.

# text
# c1: filter_health.rs
seg-1e61fd18257f = Evaluación de la consistencia del filtro de Kalman (NIS/NEES (NIS: innovación normalizada al cuadrado; NEES: error de estimación normalizado al cuadrado) frente a sus bandas χ²), calculada en <c1/>; se omite en las ejecuciones que no la evalúan.

# text
# c1: FoMScores
# c2: fom
seg-9333864652b0 = <c1/> (el objeto <c2/>)

# text
seg-ce9caeaefd87 = Salvedad

# text
seg-b24de276d788 = Error de fase del reloj (temporización) RMS (valor cuadrático medio) durante la interrupción.

# text
seg-53e5018ae276 = una métrica de <b>temporización</b>, no de posición

# text
seg-8cdec6da2072 = Error de temporización del percentil 95 durante la interrupción.

# text
seg-95f058adb809 = Peor caso (el más corto) de deriva dentro de especificación entre los segmentos de interrupción.

# text
seg-48babfd3bd95 = <b>acotado por la malla</b>: una cota inferior a la resolución del paso de tiempo

# text
seg-41c08973baa1 = Tasa de crecimiento de |error| por mínimos cuadrados durante la interrupción.

# text
seg-707ee74c5c06 = fracción [{ "0,1" }]

# text
seg-32e5fe6415f8 = Fracción de toda la ejecución con una solución dentro de especificación.

# text
seg-361b3b923a45 = fracción [{ "0,1" }] o nulo

# text
seg-5d55682f9349 = <b>Autoconsistencia del filtro</b>: fracción de las muestras de la interrupción cuyo error real permanece dentro de la cota k-σ de Kalman.

# text
# c1: INTEGRITY.md
seg-636106cb4a40 = <b>NO</b> es integridad HPL/VPL/RAIM (HPL: nivel de protección horizontal; VPL: nivel de protección vertical; RAIM: monitorización autónoma de la integridad por el receptor): véase <a1><c1/></a1>

# text
seg-f686ade3da21 = <b>Cota analítica de detectabilidad de spoofing</b> a partir de la estabilidad del reloj.

# text
# c1: applicable: false
# c2: figure_tiers
# c3: n/a (no attack)
seg-f8783db25141 = solo tiene sentido con un ataque configurado, por lo que los paquetes de reloj y órbita (que no configuran ninguno) la marcan como <c1/> en <c2/> y la imprimen como <c3/> en el resumen; <b>no</b> es un detector RAIM multisatélite

# text
seg-90e2980430b9 = Qué aspecto tiene un buen resultado

# text
# c1: adev_curve
# c2: holdover_s
# c3: security
seg-c1afc6f3c545 = Un <b>reloj más silencioso</b> (<c1/> menor) da un <c2/> más largo y una cota de detectabilidad <c3/> más alta: ese es el contraste entre cuántico y clásico.

# text
# c1: availability
seg-0fa38207813a = <c1/> cercano a { "1.0" } significa que el sistema se mantuvo dentro de especificación casi toda la ejecución; durante una interrupción larga disminuye para el reloj más ruidoso.

# text
# c1: integrity
seg-4dcba241d5a6 = <c1/> cercano a { "1.0" } significa que la propia cota de incertidumbre del filtro era honesta respecto de su error: una afirmación de <em>autoconsistencia</em>, no una garantía de seguridad de la vida humana.

# text
seg-3099d75a04a5 = Otros tipos de escenario

# text
seg-43cd9f67f384 = Cada uno de los demás tipos emite su propia estructura de resultados. Algunas de las más habituales:

# text
# c1: pos_rms_m
# c2: pos_p95_m
# c3: CAPABILITY.md
seg-6b59ef9dfe85 = <b>inertial</b>: figuras de mérito en el dominio de la posición en <b>metros</b> (<c1/>, <c2/>), de un solo eje (1-DOF (DOF: grado de libertad)) y una sola semilla (véase <a1><c3/></a1>).

# text
# c1: timing_spec_ns
# c2: position_spec_m
# c3: position_p95_m
# c4: position_holdover_s
# c5: pnt_holdover_s
# c6: figure_tiers
# c7: untiered
seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> y <c2/> en el nivel superior y, por cada lado, las figuras de temporización y de posición de un conjunto de sensores (<c3/>, <c4/> y <c5/>, el tiempo hasta que se supera cualquiera de las dos especificaciones), con un bloque <c6/> como el del paquete de reloj en el que las figuras de posición figuran como <c7/>.

# text
# c1: src/spoof.rs
seg-e38e8a8adec8 = <b>spoof</b>: desfase de spoofing por paso frente a la cota de detección del reloj, y si el spoofing alcanzó la especificación antes de la detección (<c1/>).

# text
# c1: orbit
# c2: integrity
# c3: user_site
# c4: gnss-sim
# c5: jamming
# c6: leo-pvt
# c7: leo-pass
# c8: [skyline]
# c9: skyline
# c10: source
# c11: preset:<name>
# c12: preset:<name>+overrides
# c13: custom
# c14: open_fraction
# c15: max(mask_deg, skyline)
# c16: provenance
# c17: masked_by_skyline
# c18: epochs[]
# c19: integrity
# c20: jamming
# c21: gnss_measurements[]
# c22: gnss-sim
# c23: joint.epochs[]
# c24: leo-pvt
# c25: leo-pass
# c26: satellites[].pass.epochs_masked_by_skyline
# c27: units
# c28: src/skyline.rs
# c29: UNITS
# c30: SKYLINE.md
seg-dfd972d160e1 = <b>skyline</b> (<c1/> e <c2/> con <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; presente solo cuando el escenario tiene una sección <c8/>, de modo que un escenario sin ella no cambia): un objeto <c9/> de nivel superior con <c10/> (cadena: <c11/>, <c12/> o <c13/>), <c14/> (fracción [{ "0,1" }] del ángulo sólido del hemisferio superior por encima de <c15/>) y <c16/> (cadena); por muestra, <c17/> (recuento de satélites por encima de la máscara pero tras el horizonte: <c18/> de <c19/> y <c20/>, <c21/> de <c22/>, <c23/> de <c24/>); y para <c25/>, <c26/> (recuento de épocas). Sus unidades y clases de procedencia están en el bloque <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

# text
# c1: field-units-schema.json
# c2: SCENARIOS.md
# c3: *Result
# c4: src/
seg-d113122b7454 = Para el conjunto exacto de campos de cualquier tipo, consulte su entrada en <a1><c1/></a1> (más abajo), la sección de ese tipo en <a2><c2/></a2> o la estructura <c3/> correspondiente en <c4/>.

# text
seg-e0c63207c019 = Otros archivos que escribe una ejecución

# text
# c1: <scenario>.result.json
# c2: <scenario>.chart.svg
# c3: <scenario>.report.html
# c4: <scenario>.report.json
# c5: reproducibility
# c6: REPORTS.md
# c7: REPRODUCIBILITY.md
# c8: <scenario>.table.csv
# c9: --export
# c10: INTEROP.md
# c11: --animate
# c12: ANIMATION.md
seg-cc97989ca06b = Además de <c1/>, la CLI (interfaz de línea de comandos) escribe <c2/>, un <c3/> imprimible y el mismo informe como <c4/>, cuyo bloque <c5/> registra la versión del motor, el SHA-256 del archivo de escenario, la semilla, la plataforma y el comando exacto (véanse <a1><c6/></a1> y <a2><c7/></a2>). Los tipos que publican una tabla de reproducibilidad escriben también <c8/> (CSV: valores separados por comas). <c9/> escribe archivos de intercambio (véase <a3><c10/></a3>) y <c11/> una animación (véase <a4><c12/></a4>).

# text
seg-489953601f3b = Unidades y procedencia, por campo, de cada tipo

# text
seg-61b33dbb44dd = Esta página está escrita a mano y cubre los paquetes de reloj y órbita. La contrapartida legible por máquina cubre <b>todos</b> los tipos integrados:

# text
# c1: units
# c2: {"unit", "provenance", "note"}
# c3: []
# c4: *
# c5: src/field_schema.rs
seg-1e20fcda7f0b = <b>En el propio resultado.</b> El documento de resultados de cada escenario lleva un objeto <c1/> de nivel superior que asocia la ruta de un campo emitido con <c2/>. La gramática de rutas (una matriz aporta un segmento con sufijo <c3/> compartido por sus filas; <c4/> es un comodín de un solo segmento para objetos con claves de datos) y el vocabulario cerrado de procedencia se definen en <a1><c5/></a1>.

# text
seg-b8256437c0b7 = Como un único archivo.

# text
# c1: field-units-schema.json
# c2: coverage
seg-ae7136e34306 = <a1><c1/></a1> es la unión recopilada: para cada tipo, cada campo numérico que emite en una fuente declarada, con su unidad, clase de procedencia, nivel de evidencia y definición y, nombrado en lugar de omitido, cada campo que aún no tiene ninguno. Su bloque <c2/> lleva los recuentos.

# text
# c1: tests/field_units_global.rs
# c2: UNCOVERED_KINDS
seg-66af6dc065f7 = Ambos los exige <c1/>, que ejecuta todos los tipos registrados y falla si un campo numérico emitido carece de unidad y de clase de procedencia. Los tipos aún no cubiertos se nombran uno a uno en el <c2/> de ese archivo con el motivo por el que cada uno sigue abierto, y el recuento está fijado de modo que la lista solo pueda reducirse.

# text
# c1: units
seg-ca49a577a07b = Regenere el JSON tras cualquier cambio en la estructura de un informe o en un bloque <c1/>:

# text
seg-ce4351cf7673 = <s1>Anterior</s1>Referencia de escenarios

# text
seg-b988dcc329a4 = <s1>Siguiente</s1>Uso de TLE reales

# text
seg-6585c8a3643d = ClockRun (cada uno de quantum / classical)

# text
seg-299f8a9643f1 = FoMScores (el objeto fom)
