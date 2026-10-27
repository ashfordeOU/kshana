# docs--claims-vs-reality: translations (es)

# text
seg-a47934361f43 = Flujos NMEA para formación de tripulaciones

# text
seg-ee2e250497f9 = Exportación para test bench

# text
seg-2bd2101ce454 = Superficie

# text
seg-ad856ad710eb = Estado

# text
seg-98d0bc6b40ce = Asignación de compliance a marcos públicos

# text
seg-80f3f0aae42c = Mapa de interferencias

# text
# c1: docs/CLAIMS-VS-REALITY.md
seg-28b1885c4ca7 = Fuente: <c1/>

# text
seg-bf5c2811ce29 = Afirmaciones frente a realidad: registro de afirmaciones excesivas

# text
# c1: OC-0
# c2: OC-13
seg-592e007bc3cf = Una auditoría independiente de una versión anterior de Kshana catalogó catorce <b>afirmaciones excesivas</b> (<c1/>…<c2/>): lugares donde una superficie pública (README, playground, etiquetas de FoM (cifra de mérito), paquetes de escenarios) describía una capacidad con más fuerza de la que ofrecía el código. Esta página es el registro de cierre: cada fila indica la afirmación excesiva original, cómo se resolvió y las evidencias. Aparecen dos tipos de resolución:

# text
seg-39250970dbbf = <b>Retirada de la afirmación</b>: se corrigió la redacción para que coincida con el código (reformulación honesta, sin cambio de capacidad). «Cero código = cero afirmación».

# text
seg-fb7da0f79ead = <b>Superada</b>: la capacidad real se construyó y se probó después, de modo que la afirmación fuerte pasó a ser <em>exacta</em>.

# text
# c1: tests/no_overclaims.rs
# c2: README.md
# c3: docs/CAPABILITY.md
# c4: docs/GLOSSARY.md
# c5: web/capabilities.json
# c6: web/index.html
# c7: web/README.md
# c8: README.crates.md
# c9: README.pypi.md
# c10: README.npm.md
seg-5292f7162e2b = Una salvaguarda de regresión (<c1/>) analiza las superficies públicas activas (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> y las portadas de crates.io, PyPI (Python Package Index) y npm <c8/>, <c9/>, <c10/>) en cada ejecución de CI (integración continua) y falla si alguna de las frases desnudas de afirmación excesiva retiradas reaparece sin matiz, de modo que una fila no pueda retroceder en silencio desde GREEN.

# text
seg-dafc6f322f34 = Las catorce filas están en <b>GREEN</b>.

# text
seg-5cf7bf2d1889 = OC (afirmación excesiva)

# text
seg-0e01d4053d7f = Afirmación excesiva original

# text
seg-36bf87638923 = Resolución

# text
seg-70a952c4150b = «estimador de fusión de Kalman conjunto» daba a entender un único filtro de covarianza cruzada; el código ejecutaba dos estimadores independientes

# text
seg-d5682a7fdb11 = <b>Superada</b>: se construyó un auténtico filtro de Kalman acoplado de reloj + posición con covarianza cruzada

# text
# c1: src/fusion/coupled.rs
seg-1008020cd9e4 = <c1/> ({ "7" } pruebas, incluido un conjunto de 100 ensayos acoplado frente a desacoplado que exige que el RMS (raíz cuadrática media) de posición del filtro acoplado sea inferior a { "0.6" }× el del desacoplado y que el filtro acoplado gane en al menos { "90" } de los { "100" } ensayos); CAPABILITY «Fusión de sensores» → completa

# text
seg-334fc345d501 = «RAIM (monitorización autónoma de la integridad por el receptor) de detección de spoofing asistida por reloj» daba a entender un detector RAIM multisatélite

# text
seg-cf0795c2ee02 = <b>Retirada de la afirmación → Superada</b>: reformulada como una cota de detectabilidad de spoofing por estabilidad del reloj; después llegó el RAIM/ARAIM real (HPL/VPL (HPL: nivel de protección horizontal; VPL: nivel de protección vertical))

# text
# c1: src/raim.rs
# c2: docs/INTEGRITY.md
seg-f46432acbfa0 = <c1/> ({ "30" } pruebas: ARAIM instantáneo + por separación de soluciones, HPL/VPL, FDE (detección y exclusión de fallos), diagramas de Stanford); <c2/>

# text
seg-8b47f69dbb76 = «demostrador de jamming» sin código de jamming detrás

# text
seg-bfff34d5a250 = <b>Superada</b>: se construyó un modelo de jamming basado en el balance del enlace J/S → C/N₀ efectivo → pérdida de enganche

# text
# c1: src/jamming.rs
seg-5f75628b8201 = <c1/> ({ "10" } pruebas); fila «Resiliencia» del README

# text
seg-bae512770cd6 = «Modelo completo de ruido de varianza de Allan de IMU (unidad de medida inercial) en una tríada de IMU»: el modelo era de un solo eje

# text
seg-50c0b5855cb9 = <b>Retirada de la afirmación → Superada</b>: reformulada como un presupuesto de error de 1 DOF (DOF: grado de libertad); después se publicó un INS (sistema de navegación inercial) strapdown de tres ejes

# text
# c1: src/inertial
seg-501bf7d8fff0 = <c1/> strapdown de tres ejes (actitud por cuaterniones, mecanización NED (norte-este-abajo), coning/sculling); ROADMAP «Inercial»

# text
seg-ad250a99b05f = «Integración PNT (posicionamiento, navegación y temporización) híbrida» daba a entender un filtro GNSS/INS (GNSS: sistema global de navegación por satélite) acoplado; era un presupuesto de error de navegación a estima

# text
seg-85fb58d37a5d = <b>Retirada de la afirmación → Superada</b>: reformulada como navegación a estima con un reenganche configurable; después se publicó una fusión GNSS/INS fuertemente acoplada real

# text
# c1: src/fusion/tightly_coupled17.rs
seg-9e6b092d5656 = <c1/> (UKF (filtro de Kalman unscented) de 17 estados con navegación a estima con CAI (CAI: interferómetro de átomos fríos) cuántico); CAPABILITY «Fusión de sensores» → completa

# text
seg-46a637f8e967 = «validado ~{ "2" } %» daba a entender un umbral estricto y exigido

# text
# c1: VALIDATION.md
seg-5e98d7664558 = <b>Retirada de la afirmación</b>: <c1/> indica el umbral <em>exigido</em> ({ "20" }–{ "25" } % promediado entre semillas); «~{ "2" } %» etiquetaba una observación típica, no el umbral

# text
# c1: docs/VALIDATION.md
seg-84f4fcdc7e50 = Encabezado «Sobre las tolerancias» de <c1/>

# text
seg-85ec2fe9c7f7 = «determinista entre plataformas» sin evidencias registradas

# text
seg-6e516f04db89 = <b>Retirada de la afirmación</b>: cadena de herramientas fijada a una versión exacta; hashes de referencia por escenario registrados con una puerta de reproducibilidad. (La identidad bit a bit <em>entre</em> SO/arquitecturas (SO: sistema operativo) sigue siendo un punto abierto, indicado con honestidad.)

# text
# c1: rust-toolchain.toml
# c2: 1.93.0
# c3: tests/golden.rs
# c4: tests/cross_platform_golden.rs
# c5: scripts/check-reproducible.sh
seg-9db327be56c3 = <c1/> (canal <c2/>); <c3/> (valores numéricos hasta { "1e-6" }); <c4/> (hash de la huella de entrada y de la forma de cada resultado, ejecutado en la matriz de CI de Linux, macOS y Windows); <c5/>

# text
seg-2708139388ed = «simulador PNT cuántico-clásico híbrido» daba a entender física cuántica de primeros principios

# text
seg-717167714e83 = <b>Retirada de la afirmación → Superada</b>: reformulada como un simulador de resiliencia PNT que usa modelos de rendimiento de sensores cuánticos; después llegó la física CAI Mach–Zehnder de primeros principios

# text
# c1: src/inertial/quantum_imu.rs
# c2: 1/√(N·C²·T²)
# c3: docs/QUANTUM.md
seg-c67fb22add4b = <c1/> ({ "26" } pruebas: fase Mach–Zehnder, ruido de proyección <c2/>, función de transferencia de vibraciones, sistemáticos de Coriolis + AC-Stark (AC: corriente alterna)); <c3/>

# text
seg-5c6b7d4f2029 = la FoM «Rendimiento de integridad» daba a entender integridad aeronáutica HPL/VPL/RAIM

# text
seg-ee5487da890c = <b>Retirada de la afirmación + Superada (por capas)</b>: la FoM de escenario por ejecución se etiqueta con honestidad como <em>autocoherencia del filtro</em> (<b>no</b> integridad aeronáutica); el HPL/VPL real de ARAIM se muestra <em>por separado</em>, de modo que nunca se confundan

# text
# c1: src/fom.rs:80
# c2: integrity
# c3: src/raim.rs
# c4: docs/INTEGRITY.md
seg-31aacdf17b02 = <c1/> (<c2/>: autocoherencia, con salvedades); <c3/> + <c4/> (ARAIM real)

# text
seg-0686fa147c96 = FoM de Seguridad presentada como siempre significativa, incluso sin ataque

# text
# c1: 1 − P_md
seg-d6d9296422fc = <b>Retirada de la afirmación</b>: la FoM de Seguridad (<c1/>) se enmarca en el contexto del detector de spoofing y solo es significativa cuando se configura un escenario de ataque

# text
seg-8f7b211b5a0c = Fila «Resiliencia» del README; la FoM de Seguridad se define en el punto de especificación operativamente dañino

# text
seg-d66421174e94 = la FoM «Rendimiento de posicionamiento» daba a entender una exactitud completa en el dominio de la posición

# text
# c1: pos_rms_m
seg-9eeb13a16350 = <b>Retirada de la afirmación</b>: etiquetada como <c1/> de 1 DOF para los paquetes inercial/híbrido, explícitamente <b>no</b> una exactitud CEP/2DRMS 2-D (CEP: error circular probable) ni ponderada por DOP (DOP: dilución de la precisión)

# text
seg-e8115df73c10 = Tabla de cifras de mérito del README (fila «Rendimiento de posicionamiento»)

# text
seg-5c73759a2454 = las cifras de FoM inerciales se leían como estadísticos de conjunto a partir de semillas únicas

# text
# c1: monte_carlo: false
# c2: runs = N
seg-3db3a41ce848 = <b>Retirada de la afirmación</b>: una ejecución única se marca con <c1/>; <c2/> notifica la media, la dispersión y el IC bootstrap del { "95" } %

# text
seg-bf737455e6f2 = Tabla de FoM del README; pruebas de la envolvente de cobertura de escenarios

# text
seg-aa362992b5da = el escenario «constelación GPS SGP4 (Simplified General Perturbations { "4" }) (Global Positioning System)» usaba TLE (conjuntos de elementos de dos líneas) sintéticos de relleno

# text
# c1: gps-ops
seg-ebae20813a52 = <b>Superada</b>: el escenario incorpora ahora una instantánea auténtica de Celestrak <c1/> con fecha y sumas de comprobación estrictas

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum
# c4: tests/scenario_coverage.rs
seg-2d49f6101571 = <c1/> (<c2/> real, <c3/>); <c4/>

# text
# c1: Cargo.toml
seg-cdefa4ee436a = La cadena de versión del README se había desviado de <c1/>

# text
# c1: Cargo.toml
seg-8e66b9485565 = <b>Retirada de la afirmación</b>: una puerta de CI comprueba que la insignia de estado del README coincida con <c1/>

# text
seg-347fd8c1f334 = { "0.35" }: afirmaciones mantenidas acotadas y una corrección

# text
# c1: tests/no_overclaims.rs
# c2: tests/compliance_report.rs
seg-946ff389cec5 = Las funciones de { "0.35" } se redactaron con sus límites indicados junto a la afirmación, y las mismas salvaguardas (<c1/> y la salvaguarda de redacción de <c2/>) analizan las páginas que las describen. Esta tabla no forma parte del registro de catorce filas anterior; recoge, para las superficies nuevas, lo que se afirma y lo que no.

# text
seg-6ac3f9b26aad = Lo que se afirma

# text
seg-6f558815da86 = Lo que no se afirma

# text
# c1: receiver_trust
# c2: $PKSHT
seg-d0964d2f9bbc = Puntuación de confianza del buque (<c1/>, <c2/>, puerta, Signal K, OpenCPN)

# text
seg-ee4d75006bfc = una puntuación de 0-100 y sus motivos a partir de las propias NMEA de un receptor, MODELLED

# text
seg-59ff27c84fe4 = orientativo, no un equipo de navegación homologado; una puntuación para un registro no es una afirmación sobre otros receptores; no hace que una posición sea más exacta

# text
seg-8869e6a5c10b = NMEA de puente sintético con sucesos programados y un registro de instructor

# text
seg-bc4ba77bc569 = solo texto, sin salida de radiofrecuencia; nunca para los sistemas de navegación en servicio de un buque; orientativo, no un equipo de navegación homologado

# text
seg-9482ecbb2748 = un registro técnico firmado que puede verificarse sin conexión

# text
seg-20ae6dd2b780 = no es un dictamen jurídico; no dice qué causó un suceso, quién fue responsable ni que el registro muestre lo que el receptor recibió realmente

# text
seg-4132fc36f1d3 = celdas agregadas de navegación degradada a partir de informes con licencia abierta

# text
seg-c64960abf9fb = no es un pronóstico; la exposición de una ruta es una proporción de celdas, no un riesgo

# text
seg-ed6d268e0291 = el movimiento y los sucesos del vehículo de un escenario en archivos que puede leer un simulador de laboratorio

# text
seg-85c8ad22ef03 = no se escribe ninguna señal; no se afirma ningún rendimiento de simulador ni de receptor

# text
seg-1bba9a883650 = a favor de qué filas aporta evidencias un conjunto de ejecuciones, con una brecha en cada fila

# text
seg-f2a836780831 = nunca que un marco se satisfaga ni que un producto esté aprobado; una etiqueta de tipo de escenario por sí sola no es evidencia

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-31c7009c9914 = <b>Corrección registrada en { "0.35" }.</b> Una versión anterior de <c1/> y de los comentarios del módulo de resiliencia describía siete «categorías de técnicas» del DHS Resilient PNT Conformance Framework. La versión { "2.0" } de ese marco define funciones esenciales (Prevent, Respond, Recover), niveles del { "0" } al { "4" } y ocho requisitos numerados, y ninguna lista de siete categorías. Los siete nombres de subpuntuación que emite el motor de puntuación son propios de Kshana, y la correspondencia ahora lo dice.

# text
seg-f70787ecb194 = Cómo una fila se mantiene en GREEN

# text
# c1: tests/no_overclaims.rs
seg-f2c599e8882a = Las afirmaciones fuertes (OC-0/2/7/8 y las mitades superadas de OC-1/3/4/12) están en GREEN porque la capacidad está <b>publicada y probada</b>, no porque se haya suavizado la redacción. Las filas con afirmación retirada están en GREEN porque la redacción vigente coincide con el código. La prueba de salvaguarda hace exigible la segunda categoría: si una frase de afirmación excesiva retirada vuelve a una superficie pública, la CI se pone en rojo. Véase <c1/>.

# text
seg-39e475441b60 = <s1>Anterior</s1>Por qué las filas siguen siendo modeladas

# text
seg-07ef8e1e862e = <s1>Siguiente</s1>Procedencia
