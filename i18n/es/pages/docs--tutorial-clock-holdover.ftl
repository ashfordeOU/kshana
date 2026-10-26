# docs--tutorial-clock-holdover: translations (es)

# text
# c1: docs/tutorials/02-clock-holdover.md
seg-b59f529012a6 = Fuente: <c1/>

# text
seg-e66a5042182e = Tutorial { "2" } — Holdover del reloj: cuánto tiempo puede mantenerse a la deriva

# text
# c1: clock
# c2: scenarios/clock-holdover.toml
# c3: scenarios/clock.toml
seg-889112bc4c09 = <c1/> · <b>Escenario:</b> <c2/> (copia didáctica: <a1><c3/></a1>) · <b>Dificultad:</b> principiante · <b>~{ "20" } min</b>

# text
seg-a4bdf55d96be = Al terminar habrá ejecutado un holdover de reloj con las señales GNSS (Sistema Global de Navegación por Satélite) denegadas, habrá leído la cifra de mérito de temporización y habrá comprendido la ley de deriva √(q_wf·T) que explica <em>por qué</em> el reloj óptico dura más que el de escala de chip, con la ley procedente del NIST (el Instituto Nacional de Estándares y Tecnología de EE. UU.), no inventada.

# text
seg-51ae9468b92a = Qué es este escenario

# text
seg-87334505b228 = Cuando las señales GNSS desaparecen, un sistema mantiene la hora con su propio reloj de a bordo. La fase de ese reloj deriva lentamente y, cuando la deriva supera la especificación operativa de temporización, queda fuera de servicio. El <b>holdover</b> es el tiempo que se permanece dentro de la especificación tras perder GNSS: la cifra de mérito de autonomía principal.

# text
seg-798ac031b5c6 = El escenario ejecuta una línea temporal de { "2" } h: { "10" } min de sincronización GNSS y luego { "6600" } s ({ "1.83" } h) denegado, frente a una especificación de temporización de { "20" } ns, muestreada cada { "10" } s. Compara dos relojes con el mismo código y con su <em>propio</em> ruido publicado:

# text
seg-3d53622dbe12 = <b>Cuántico</b>: un reloj óptico de red de estroncio, objetivo espacial σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), un objetivo de demostrador en tierra, no volado. σ_y(τ) es la desviación de Allan, la medida estándar de la estabilidad de frecuencia de un reloj para un tiempo de promediado τ.

# text
seg-e25af6d0752f = <b>Clásico</b>: un reloj atómico a escala de chip (CSAC) Microchip SA.45s, σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (hoja de datos): una pieza comercial desplegada.

# text
seg-08f3fdc9252a = Lea el resumen de una línea

# text
seg-baa0cc808987 = Con semilla = { "42" }, la especificación de { "20" } ns y la interrupción de { "6600" } s:

# text
# c1: quantum holdover 6600s
seg-76f7739f8b17 = <b><c1/></b>: el reloj óptico mantiene toda la interrupción de { "6600" } s sin rebasar { "20" } ns. Su error de fase del percentil 95 es de { "1.20e-4" } ns, aproximadamente una diezmilésima de nanosegundo: apenas se mueve.

# text
# c1: classical holdover 2610s
seg-0ba48fccffae = <b><c1/></b>: el CSAC rebasa la especificación de { "20" } ns a ~{ "2610" } s, menos de la mitad de la interrupción. Su error de fase p95 ({ "19.7" } ns) queda justo en la línea de la especificación.

# text
# c1: security n/a (no attack)
# c2: fom.security
# c3: applicable: false
# c4: figure_tiers
seg-b745d05e2bf1 = <b><c1/></b>: este escenario no configura ningún ataque, de modo que no hay nada que detectar y el resumen no imprime ningún número. El JSON sigue llevando, en <c2/>, la cota analítica de detectabilidad de suplantación de cada reloj ({ "0.997" } para el reloj óptico; { "0.000" } para el CSAC, cuyo propio ruido de deriva a lo largo de la ventana ya supera { "20" } ns), marcada <c3/> en el bloque <c4/>. Puntuar la detección frente a un ataque real es la historia del <a1>Tutorial { "3" }</a1>.

# text
# c1: integrity 1.000
# c2: docs/INTEGRITY.md
seg-510e1cd8ed40 = <b><c1/></b>: aquí es la <em>autoconsistencia del filtro</em> (la fracción de muestras de la interrupción dentro de la propia cota de k sigmas del filtro de Kalman), <b>no</b> un nivel de protección horizontal o vertical de aviación (HPL/VPL). Véase <a1><c2/></a1>.

# text
seg-7cc0ba5e5d13 = La referencia independiente no circular: ¿por qué { "2610" } s para el CSAC?

# text
# c1: q_wf = σ_y(1 s)²
# c2: tests/calibration.rs
seg-2958401e00ca = Para un reloj de modulación de frecuencia blanca (white-FM), el error de fase de 1-σ crece como <b>σ_x(T) ≈ √(q_wf · T)</b>, donde <c1/> tiene unidades de s². Esta relación procede de la <b>Publicación Especial { "1065" } del NIST</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) —las relaciones entre σ_y(τ) y la fase—, la <em>misma</em> relación de SP-1065 frente a la que <c2/> valida la desviación de Allan del motor con una diferencia de ~{ "2" } %.

# text
# c1: q_wf = (3×10⁻¹⁰)² = 9×10⁻²⁰ s²
seg-d6c8f68b42b9 = Para el CSAC, <c1/>. Despeje el tiempo en que la fase de 1-σ alcanza { "20" } ns = { "2" }×{ "10" }⁻⁸ s:

# text
# c1: holdover_s
# c2: step_s = 10
# c3: src/fom.rs
seg-0f28d1a1163f = Los { "2610" } s del motor no son ese tiempo de 1-σ, y no deben serlo. <c1/> es el primer punto de la rejilla de { "10" } s (<c2/>) en el que el error de fase absoluto de <em>esta realización con semilla</em> supera { "20" } ns (<c3/>). El primer cruce de un nivel por un paseo aleatorio suele producirse bastante antes del momento en que su envolvente de 1-σ alcanza ese nivel, y la realización arrastra además el error de frecuencia residual con el que queda el filtro tras la sincronización de { "600" } s. Así pues, la ley fija la escala, unos pocos miles de segundos para un reloj de { "3" }×{ "10" }⁻¹⁰ frente a { "20" } ns, no el valor exacto. La prueba afirma una <b>banda de { "2000" }–{ "3200" } s</b> alrededor de él, no el número.

# text
# c1: provenance
# c2: adev_curve
# c3: tests/calibration.rs
seg-2e7cbdefa9b7 = Los anclajes de las hojas de datos son en sí externos, citados en las cadenas <c1/> del escenario: objetivo de red óptica de Sr { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); CSAC Microchip SA.45s { "3" }×{ "10" }⁻¹⁰ (hoja de datos). Y la <c2/> exportada coincide con σ_y(τ) de la hoja de datos con una diferencia de ~{ "2" } % (<c3/>, NIST SP { "1065" }). Represéntela como un gráfico log-log “Clock stability (ADEV, Allan deviation)” en el playground.

# text
seg-def5271a207d = Qué fija la prueba

# text
# c1: quantum holdover >= classical holdover
seg-ebddc1f5ffe2 = <c1/> (el reloj óptico debe mantenerse al menos tanto tiempo),

# text
# c1: quantum holdover ≈ 6600 s
seg-8e570268f107 = <c1/> (mantiene toda la interrupción),

# text
# c1: classical holdover ∈ [2000, 3200] s
seg-d60483c1af2e = <c1/>: una banda de tolerancia alrededor de la escala white-FM de SP-1065, <em>no</em> un número mágico. La referencia independiente es la ley, no el valor.

# text
seg-e5f926d1055b = Errores frecuentes y unidades

# text
seg-0f57e35ed833 = <b>Las cifras de temporización están en nanosegundos</b>, nunca en metros. (El holdover de posición es un paquete <em>distinto</em>: véase la sección inercial del Tutorial { "3" }.)

# text
# c1: q_wf
seg-2e476b213141 = <b><c1/> tiene unidades de s² y es igual a σ_y({ "1" } s)².</b> Ese es el puente entre un número de Allan de una hoja de datos y el modelo.

# text
# c1: step_s
seg-75951a150b44 = <b>El holdover es una cota inferior cuantizada por la rejilla</b> (<c1/>). No interprete en exceso el valor exacto; lea la <em>banda</em>.

# text
# c1: integrity
seg-959eb86066f1 = <c1/> aquí es autoconsistencia del filtro, no integridad aeronáutica.

# text
seg-cb457294fc53 = Siguientes pasos

# text
# c1: threshold_ns
# c2: exercises/tier2_sweep.py
# c3: kind = "sweep"
# c4: classical_q_wf
# c5: scenarios/sweep-clock-stability.toml
seg-aa3e50f2c699 = <b>Nivel { "2" }:</b> reduzca <c1/> de { "20" } a { "10" } y observe cómo el holdover del CSAC <em>cae</em> ({ "2610" } s → { "1300" } s, medido con <c2/>), o use <c3/> para tabular el holdover frente al nivel de ruido del CSAC <c4/> (<c5/>: { "25" } puntos de { "10" }⁻²⁴ a { "10" }⁻¹⁸ s², holdover clásico de { "2610" } s → { "250" } s).

# text
# c1: runs = 200
# c2: scenarios/clock-ensemble.toml
# c3: classical holdover 844s [220-2130]
seg-cb31f104d104 = <b>Nivel { "3" }:</b> añada <c1/> para convertir esto en un conjunto Monte Carlo y leer la banda de holdover [p05–p95] (<c2/> imprime <c3/>).

# text
seg-9cb56e10f0fd = Después, el colofón: <a1>Tutorial { "3" } — Resiliencia cuántica frente a clásica</a1>.

# text
seg-7dc19a98c7ee = <s1>Anterior</s1>{ "1" } · Su primera órbita

# text
seg-c274e92fdcb5 = <s1>Siguiente</s1>{ "3" } · Cuántico frente a clásico
