# docs--kind-quantum-trade: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-f7f12029e0ec = Página de familia: <a1>Sensores inerciales, de fusión y cuánticos</a1>

# text
seg-496b17a8d3b9 = Página temática: <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> No proporcionado: solo modelos de rendimiento; el hardware de átomos fríos/relojes es del socio. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-51cac2f918e0 = Página temática: <a1>POSITIONING.md</a1>

# text
# c1: docs/kinds/by-kind/quantum-trade.md
seg-3a8c76a2396f = Fuente: <c1/>

# text
# c1: quantum-trade
seg-f9af2813532e = <c1/> (tipo de escenario)

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Comparación de PNT cuántico frente a clásico ({ "13503" }): beneficio en holdover de temporización y en holdover inercial de un reloj candidato (una curva de ADEV medida, el eje de la defendibilidad, o una clase de reloj cuántico) frente a una clase de línea base clásica, con la salvedad del supuesto de suelo de tau largo incluida en el artefacto, más una envolvente de resiliencia frente al tiempo sin GNSS. MODELLED; cuantifica (nunca valida) un dispositivo de socio. El reloj candidato es una curva medida (<c1/> + <c2/>, de igual longitud, con al menos { "2" } puntos; prevalece cuando se dan ambas formas) o una <c3/>.

# text
# c1: scenarios/quantum-trade.toml
seg-4f470bc1d82c = Una ejecución de <c1/> se resume así: quantum-trade | candidato measured-ADEV | holdover de temporización 2621947s frente a 203s (12943.62x) | inercial 14108s frente a 378s (37.34x) | deriva de resiliencia 14108s | MODELLED [salvedad de suelo supuesto]

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
seg-2639560aeff2 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: baseline_ins
# c2: candidate_ins
# c3: resilience_times_s
# c4: alt_pnt_bound_m
seg-d66f1ef84201 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-trade.toml
seg-f2cc0830b53f = El ejemplo <c1/> establece, entre otros:

# text
seg-ee5bcbbe0167 = csac

# text
seg-f5fa445702c6 = Etiqueta del resultado (la del motor): MODELLED — cuantifica (nunca valida) un reloj o sensor de socio; no demostrado en vuelo

# attr:alt
seg-c74c63ffd859 = El gráfico que el motor genera para scenarios/quantum-trade.toml, tipo de escenario quantum-trade

# text
seg-93310aaa6ead = <b>VALIDATED</b> Recuperación NNLS de ley de potencias (FM blanca + suelo de ruido rojo) a partir de una desviación de Allan publicada y medida de una transición de reloj óptico de ⁸⁸Sr, que reproduce σ_y(τ) y el escalado principal de 4.7e-16/√τ a τ corto con un suelo genuino medido a τ largo, en lugar de Pruebas: <a1>optical_clock_adev_reference.rs</a1>.

# text
seg-fc46e95688ba = <b>VALIDATED</b> Ajuste NNLS de ADEV medida, bandas de consistencia χ² de NEES/NIS y covarianza de ruido de proceso discreto de van Loan del reloj (deriva de holdover): la columna vertebral computacional del motor de comparación Pruebas: <a1>scipy_reference.rs</a1>.

# text
seg-6e2b62136cef = <b>MODELLED</b> Ingesta de ADEV medida (NNLS), tabla de comparación (holdover de temporización e inercial + beneficio), envolvente de resiliencia frente al tiempo; salvedad del suelo incluida en el artefacto.

# text
seg-b577b8464cf7 = <b>VALIDATED</b> Ajuste NNLS de ADEV medida, bandas de consistencia χ² de NEES/NIS y covarianza de ruido de proceso discreto de van Loan del reloj (deriva de holdover): la columna vertebral computacional del motor de comparación. Referencia independiente (ExternalDataset): scipy { "1.17.1" }: optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exactos, χ² <{ "5e-4" } con los grados de libertad de operación. Solo núcleos: las cifras de rendimiento de dispositivos siguen siendo modeladas (fila siguiente)

# text
seg-6b8aa8cd6d3e = <b>MODELLED</b> Ingesta de ADEV medida (NNLS), tabla de comparación (holdover de temporización e inercial + beneficio), envolvente de resiliencia frente al tiempo; salvedad del suelo incluida en el artefacto. Ejecutable des. Referencia independiente (ExternalDataset): El núcleo de ajuste de ADEV medida→PSD (NNLS) coincide con scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs): un núcleo externo independiente; pero las CIFRAS de la comparación cuantifican (nunca validan) un reloj o CAI de socio, por lo que la comparación en sí sigue siendo MODELLED, sin halo de validación

# text
# c1: label
seg-3d678f64e41c = MODELLED — cuantifica (nunca valida) un reloj o sensor de socio; no demostrado en vuelo (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-20ba66ae9518 = Comparación de PNT cuántico frente a clásico ({ "13503" }): beneficio en holdover de temporización y en holdover inercial de un reloj candidato (una curva de ADEV medida, el eje de la defendibilidad, o una clase de reloj cuántico) frente a una clase de línea base clásica, con la salvedad del supuesto de suelo de tau largo incluida en el artefacto, más una envolvente de resiliencia frente al tiempo sin GNSS. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-45a1d84eef18 = MODELLED; cuantifica (nunca valida) un dispositivo de socio. (catálogo de tipos (<c1/>))

# text
seg-15275d27252a = Calcula el beneficio en holdover de temporización y en holdover inercial de un reloj CANDIDATO sobre una línea base CLÁSICA, más una envolvente de resiliencia frente al tiempo sin GNSS. El suelo del candidato lo determina la curva de ADEV superpuesta MEASURED de un reloj de socio (el eje de la defendibilidad), ajustada por mínimos cuadrados no negativos, de modo que el presupuesto de holdover se apoya en datos reales y no en un suelo de tau largo supuesto. (comentario del archivo de escenario, líneas { "3" } a { "7" })

# text
seg-ecbdbc9b163e = ALCANCE HONESTO: MODELLED: CUANTIFICA el beneficio de un reloj cuántico de un socio; NO valida el dispositivo, y nunca toma prestadas las islas de validación de SGP4, Allan o IGS. Cuando el suelo de alguna fila es un valor por defecto de clase supuesto, el artefacto muestra una salvedad de suelo. Ejecución: kshana scenarios/quantum-trade.toml (comentario del archivo de escenario, líneas { "9" } a { "12" })

# text
seg-4b59ac409819 = La comparación de PNT cuántico frente a clásico y la resiliencia sin GNSS ({ "13503" }) es MODELLED, no validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-e6498fae3ba7 = <s1>Anterior</s1>quantum-time-transfer

# text
seg-50d4bbb7486b = <s1>Siguiente</s1>realtime-frame-eop
