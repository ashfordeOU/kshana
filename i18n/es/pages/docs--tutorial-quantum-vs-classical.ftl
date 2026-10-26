# docs--tutorial-quantum-vs-classical: translations (es)

# text
seg-501d3a72ea43 = Integridad

# text
seg-8980b5ae869b = Cifra

# text
seg-e5f926d1055b = Errores frecuentes y unidades

# text
seg-cb457294fc53 = Siguientes pasos

# text
# c1: docs/tutorials/03-quantum-vs-classical.md
seg-a3686dd6817d = Fuente: <c1/>

# text
seg-0c2365600795 = Tutorial { "3" } — Resiliencia GNSS cuántica frente a clásica (colofón)

# text
# c1: spoof
# c2: hybrid
# c3: scenarios/spoof-attack.toml
# c4: scenarios/hybrid-pnt.toml
# c5: scenarios/security.toml
# c6: scenarios/hybrid.toml
seg-cc4017642043 = <c1/> + <c2/> · <b>Escenarios:</b> <c3/>, <c4/> (copias didácticas: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Dificultad:</b> intermedia · <b>~{ "35" } min</b>

# text
seg-5de2e6656527 = El colofón. Ejecutará un escenario de detector de suplantación y un conjunto completo fusionado de posicionamiento, navegación y temporización (PNT), y aprenderá a leer juntas la <b>seguridad</b>, la <b>integridad</b> y la <b>navegación a estima</b>: toda la tesis, a saber, que lo inercial cuántico y la temporización óptica compran una resiliencia que la denegación de GNSS (Sistema Global de Navegación por Satélite) quitaría de otro modo.

# text
seg-ffa5242638c2 = Parte A — Seguridad: detectar una suplantación de hora

# text
# c1: 1 − P_md
seg-23c18da1415f = Un atacante inyecta una hora GNSS falsa de rampa lenta ({ "0.1" } ns/s, a partir de t = { "60" } s). El receptor contrasta la hora afirmada con la predicción a la deriva de su propio reloj y señala la suplantación cuando la discrepancia supera la cota de detección. El detector es una <b>prueba de energía bilateral χ²₁ / de Neyman–Pearson</b> con una probabilidad de falsa alarma P_fa = { "0.01" }; la cifra de mérito de seguridad es <b><c1/></b> (uno menos la probabilidad de detección fallida) para la magnitud de suplantación del tamaño de la especificación ({ "20" } ns).

# text
# c1: security 1.000
seg-46aa0e01b330 = <b>Cuántico: <c1/>, detectado a los { "70" } s.</b> El umbral de detección del reloj óptico es una fracción de nanosegundo, de modo que señala la suplantación casi de inmediato, muy por debajo de la especificación de { "20" } ns.

# text
# c1: security 0.558
seg-022573b3dcc4 = <b>Clásico: <c1/>, detectado a los { "430" } s.</b> El propio ruido de deriva del reloj atómico a escala de chip (CSAC) a lo largo de la ventana es comparable a { "20" } ns, de modo que a menudo no puede distinguir la suplantación de su propia deriva: la pasa por alto el { "44" } % de las veces.

# text
seg-27b2b715efcb = La referencia independiente no circular: P_md analítica frente a Monte Carlo

# text
# c1: 0.442
# c2: 0.444
# c3: ~few × 1/√N
# c4: tests/tutorials.rs::tutorial3_spoof_analytic_matches_montecarlo
# c5: |analytic_pmd − mc_pmd| < 0.05
# c6: quantum security_fom > 0.9
seg-c85651eebd32 = La probabilidad de detección fallida del detector se calcula de <b>dos maneras independientes</b> que deben coincidir: una <b>cola χ²₁ de forma cerrada</b> (el resultado de Neyman–Pearson) y una estimación <b>Monte Carlo</b> (MC). Para el CSAC, la P_md analítica es <c1/> y la P_md MC es <c2/>: coinciden con una diferencia de { "0.002" }, muy dentro del error de muestreo <c3/>. Para el reloj óptico ambas son { "0.000" }. Que dos cálculos distintos de la <em>misma</em> probabilidad coincidan es la comprobación cruzada no circular (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; detección NP / χ² estándar). <c4/> afirma <c5/> para ambos relojes y <c6/>.

# text
seg-5cf0d909bac7 = Parte B — PNT híbrido: el conjunto fusionado completo

# text
# c1: [resync]
# c2: src/hybrid.rs
# c3: optical-isl
seg-498a57aae11d = Ahora el escenario del colofón fusiona un reloj óptico y una unidad de medida inercial (IMU) de átomos fríos (conjunto cuántico) frente a un CSAC y una IMU de grado de navegación (conjunto clásico), a lo largo de la misma interrupción de GNSS de { "6600" } s ({ "1.83" } h), frente a una especificación de temporización de { "20" } ns y una de posición de { "100" } m. Ambos conjuntos vuelven a anclar sus relojes cada { "60" } s mediante el mismo enlace óptico de transferencia de tiempo entre satélites, modelado con una fluctuación de { "1" } ps por resincronización (<c1/> en el escenario; <c2/> construye un enlace <c3/> para cualquiera de los conjuntos).

# text
# c1: (t …/p …)
seg-61934559c7a0 = Lea la división <c1/>: holdover de temporización frente a holdover de posición:

# text
seg-dee5b1a35bdd = <b>Cuántico: PNT-holdover { "6600" } s</b>: mantiene tanto la temporización (t { "6600" } s) como la posición (p { "6600" } s) durante toda la interrupción.

# text
seg-6441dfa026dc = <b>Clásico: PNT-holdover { "350" } s</b>: la <em>temporización</em> mantiene los { "6600" } s completos (t { "6600" } s), porque la resincronización óptica de transferencia de tiempo mantiene bloqueado incluso al <em>reloj clásico</em>. El conjunto está <b>limitado por la posición en p { "350" } s</b>: la IMU de grado de navegación es el eslabón débil. Esta es la tesis de la fusión: aislar el fallo del conjunto clásico en su sensor inercial.

# text
# c1: integrity 0.998
# c2: docs/INTEGRITY.md
seg-12e9b7192733 = <b><c1/> en el conjunto cuántico es real y no es un error.</b> Es la autoconsistencia del filtro sobre una resincronización ruidosa; <b>no</b> es una cifra de integridad aeronáutica (nivel de protección horizontal o vertical, HPL/VPL). No interprete en exceso la palabra “integridad” aquí; véase <a1><c2/></a1>.

# text
seg-587efcdcbc13 = La referencia independiente no circular: el holdover de posición de { "350" } s

# text
# c1: b
seg-a70ad8fc122f = La cifra de { "350" } s es física de navegación a estima, no un número ajustado. Un sesgo constante del acelerómetro <c1/> hace crecer el error de posición como <b>½·b·T²</b>. Al cruzar la especificación de { "100" } m:

# text
# c1: q_va
seg-778e817e3e9b = El motor informa { "350" } s, el último punto de la rejilla de { "10" } s antes de su cruce y un { "2" } % por debajo de los { "357" } s que resultan solo del sesgo: los acelerómetros del escenario también llevan ruido de paseo aleatorio de velocidad (<c1/>), que se suma a la deriva del sesgo, de modo que el error modelado alcanza { "100" } m algo antes.

# text
seg-e105a8ab605b = Ley de referencia: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2.ª ed.), crecimiento del error en navegación a estima. Estos dos valores de ½bT² explican la división de { "350" } s / { "6600" } s del motor: una comprobación física de forma cerrada, externa al filtro.

# text
# c1: scenarios/inertial.toml
# c2: inertial
# c3: quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m
seg-c2515e55dffa = Puede ver el eslabón inercial débil directamente en el escenario de navegación a estima (<a1><c1/></a1>, tipo de escenario <c2/>): <c3/>: el sensor de grado de navegación diverge hasta decenas de kilómetros.

# text
seg-6c688f2e7136 = Cómo leer juntas las tres cifras

# text
seg-4f1a49d61cee = Qué significa aquí

# text
seg-2e91989b1a89 = Qué <b>no</b> significa

# text
# c1: 1 − P_md
# c2: hybrid
# c3: n/a (no attack)
seg-b403ce86b14d = cota analítica de <em>detectabilidad</em> de suplantación (<c1/>) para un ataque configurado; el resumen de <c2/> imprime <c3/> porque ese escenario no configura ninguno

# text
seg-e04c25dd278d = no es un detector RAIM (monitorización autónoma de integridad del receptor) multisatélite

# text
seg-7e678dd4409e = autoconsistencia del filtro (muestras dentro de la cota de k-σ)

# text
seg-1643e7e71209 = no es integridad aeronáutica HPL/VPL/RAIM

# text
seg-4095f7ab4b14 = tiempo dentro de la especificación tras perder GNSS, dividido en temporización y posición

# text
seg-5b90536cdfd5 = no es una exactitud 2-D CEP (error circular probable) ni 2DRMS (el doble de la raíz de la distancia cuadrática media)

# text
# c1: integrity
# c2: scenarios/integrity.toml
seg-4b11ef3b6dba = La integridad autónoma genuina del receptor, con HPL/VPL reales, límites de alerta y un diagrama de Stanford, está en el paquete <c1/> (<a1><c2/></a1>); ese es el ejercicio de lectura de nivel 3.

# text
seg-28cddec341ed = Qué fijan las pruebas

# text
# c1: tutorial3_spoof_analytic_matches_montecarlo
# c2: quantum security_fom > 0.9
seg-a27c3195acf3 = <c1/>: la P_md analítica y la MC coinciden con una diferencia < { "0.05" } para ambos relojes; <c2/>.

# text
# c1: scenarios/hybrid.toml
# c2: scenarios/inertial.toml
# c3: teaching_scenarios_match_their_recorded_expected_summary
# c4: # expected:
seg-78a5a0066e09 = El resumen híbrido ({ "6600" } s / { "350" } s) y la división inercial se fijan mediante sus escenarios didácticos (<a1><c1/></a1>, <a2><c2/></a2>) con <c3/>, que compara cada resumen del motor con la línea <c4/> que registra el archivo. La referencia independiente de ½bT² anterior es la comprobación física de esos números.

# text
seg-a4371822e379 = <b>La cifra de mérito (FoM) de temporización está en nanosegundos; la FoM de posición está en metros y es de 1-DOF</b> (un grado de libertad: de un solo eje, no CEP/2DRMS).

# text
# c1: integrity 0.998
seg-1331ea80a427 = <c1/> es autoconsistencia, no integridad aeronáutica.

# text
# c1: (t …/p …)
seg-87c49084032c = La <em>temporización</em> del conjunto clásico sobrevive solo gracias a la resincronización óptica de transferencia de tiempo; lea la división <c1/>, no solo el PNT-holdover del titular.

# text
# c1: scenarios/lunanet-araim.toml
# c2: lunar-integrity
seg-1c93115bf118 = Ejecute el caso de fallo honesto: <c1/> (tipo de escenario <c2/>) informa de un paso ARAIM (RAIM avanzado) en el polo sur en el que los niveles de protección <em>superan</em> el límite de alerta (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } de { "24" } épocas disponibles), de modo que el sistema se informa como <b>no disponible</b>: una característica, no un error.

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: campaign
seg-ac70d3131064 = Lleve la historia a la órbita terrestre baja (LEO): <c1/> (tipo de escenario <c2/>) encadena una fase de interferencia de GNSS (jamming), una capa de posicionamiento LEO que sostiene al usuario durante ella y una comprobación de integridad en una sola línea temporal. Véanse <a1>las capacidades más recientes</a1> para los demás escenarios de resiliencia y verticales.

# text
seg-063422d3c70b = Defienda un resultado: haga el <a1>ejercicio de nivel 3</a1>: bandas Monte Carlo, reproducibilidad y lectura de un nivel de protección.

# text
seg-4f7275a21f44 = <s1>Anterior</s1>{ "2" } · Holdover del reloj

# text
seg-8b0c90f82aab = <s1>Siguiente</s1>Ejemplo práctico: canalización con varias herramientas
