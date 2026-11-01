# docs--tutorial-first-orbit: translations (es)

# text
seg-51ae9468b92a = Qué es este escenario

# text
seg-08f3fdc9252a = Lea el resumen de una línea

# text
seg-def5271a207d = Qué fija la prueba

# text
seg-e5f926d1055b = Errores frecuentes y unidades

# text
seg-cb457294fc53 = Siguientes pasos

# text
# c1: docs/tutorials/01-first-orbit.md
seg-dcb2d0b170c1 = Fuente: <c1/>

# text
seg-f57d8b38bf08 = Tutorial { "1" } — Mi primera órbita: dónde están los satélites GPS

# text
# c1: orbit
# c2: scenarios/orbit-sgp4-gps.toml
# c3: scenarios/orbit.toml
seg-1b9e1178555d = <c1/> · <b>Escenario:</b> <c2/> (copia didáctica: <a1><c3/></a1>) · <b>Dificultad:</b> principiante · <b>~{ "15" } min</b>

# text
seg-d065731294a1 = Al terminar habrá propagado la constelación GPS operativa <em>real</em>, habrá leído su disponibilidad y geometría, y habrá exportado una tabla de dónde está realmente cada satélite en el espacio; y sabrá que esa tabla está validada frente a una referencia externa, no frente a sí misma.

# text
seg-b07bb365235d = Los satélites GPS (Sistema de Posicionamiento Global) indican a un usuario <em>dónde está</em> y <em>qué hora es</em>. Antes de nada de eso, hay que saber <b>dónde están los satélites</b> y <b>cuántos de ellos puede ver un usuario</b>. Eso es geometría, y la geometría fija el límite inferior de la exactitud con la que se puede posicionar (la dilución de la precisión, o DOP). Este tutorial:

# text
# c1: gps-ops
seg-dec5079e7715 = toma una instantánea genuina <c1/> de Celestrak de la constelación GPS (2021-07-28, { "30" } satélites, elementos de dos líneas reales, TLE),

# text
seg-693859c435d8 = propaga cada satélite con el modelo validado SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

# text
seg-74b73260c7bc = en cada paso de tiempo calcula qué satélites puede ver un usuario en órbita terrestre baja (línea de visión, ocultación por la Tierra y una máscara de elevación de { "5" }°),

# text
seg-605c40b73e96 = convierte esa geometría en un <b>PDOP</b> (dilución de la precisión de la posición) y una <b>exactitud de posición</b>, y

# text
seg-356e96d219b5 = exporta las posiciones reales de los satélites, centradas en la Tierra y fijas a ella (ECEF), a un archivo SP3 (Standard Product { "3" }, el formato de órbita precisa del Servicio Internacional de GNSS, IGS; GNSS es el Sistema Global de Navegación por Satélite).

# text
seg-ff1666fe175e = La columna vertebral es: <b>TLE → propagación SGP4 → ECEF por época → visibilidad → número de satélites visibles → PDOP → sigma de posición = PDOP · σ_UERE</b>, donde σ_UERE es el error equivalente de distancia del usuario (el error de medición de distancia de 1-σ por satélite).

# text
seg-379da723ae57 = O abra el <a1>Studio en el navegador</a1> y elija el escenario de órbita.

# text
seg-441743833f1e = La ejecución determinista (semilla = { "17" }) imprime:

# text
seg-918a30fea48a = Campo por campo:

# text
# c1: scenario 4c51512369a6
seg-375fad797dcf = <b><c1/></b>: el hash del escenario, de 12 caracteres. Es la huella de las entradas exactas (semilla, umbrales, parámetros del modelo, el bloque TLE). Si cambia cualquier entrada, esto cambia; si las mantiene iguales, reproduce la ejecución bit a bit. El mismo hash se estampa en el pie del gráfico y en el archivo JSON (JavaScript Object Notation) de resultados.

# text
# c1: 345/361 samples GNSS-nominal
seg-133711d1ad9f = <b><c1/></b>: de los { "361" } pasos de tiempo, el usuario tiene una posición utilizable en { "345" } de ellos ({ "95.6" } %). La ejecución es un paso de { "12" } h ({ "43,200" } s) con un paso de { "120" } s.

# text
# c1: best PDOP 1.07
seg-a500c0473784 = <b><c1/></b>: la mejor (menor) dilución de la precisión de la posición a lo largo del paso. Un PDOP cercano a { "1" } es una geometría excelente; cuanto menor, mejor.

# text
# c1: pos 1.07m
# c2: sigma_uere_m = 1.0
seg-98a24f0170d2 = <b><c1/></b>: la mejor exactitud de posición: <b>sigma de posición = PDOP · σ_UERE</b>. En este escenario <c2/>, de modo que los dos números son <em>numéricamente iguales</em> aquí, pero la regla es PDOP × UERE, <b>no</b> “posición = PDOP”. Con un UERE de { "3" } m, el sigma de posición sería de ~{ "3.2" } m. (Véase el error frecuente al final.)

# text
# c1: holdover
# c2: p95
# c3: integrity
# c4: security
# c5: security
# c6: n/a (no attack)
seg-410081c6dcab = Las cifras del reloj (<c1/>, <c2/>, <c3/>, <c4/>) aparecen porque el paquete de órbita también lleva un reloj a lo largo del paso; son el centro del <a1>Tutorial { "2" }</a1>, no de este. (<c5/> indica <c6/> porque no se configura ningún ataque.)

# text
seg-95ccef0d94ae = El bloque de geometría del JSON contiene los números subyacentes:

# text
seg-89cb7db9b9eb = ¿Dónde están los satélites? (la recompensa)

# text
seg-81678afa0cee = La geometría es buena <em>porque</em> los satélites están realmente en la capa GPS. Compruébelo: exporte sus posiciones fijas a la Tierra:

# text
seg-1452dfac9e06 = Los tres primeros satélites en el primer paso de muestreo, ECEF en km (el archivo SP3 lleva una cuarta columna, la del reloj, escrita con el marcador de “sin valor” { "999999.999999" }):

# text
seg-4fd0f95da0cf = Tome el radio geocéntrico de PG01:

# text
seg-cb02d7c01561 = La referencia independiente no circular: ¿es esto realmente una órbita GPS?

# text
seg-a7c478360464 = Un tutorial que comprueba el motor frente a sí mismo no prueba nada. Este es el ancla externa y <em>no circular</em> de cada afirmación anterior.

# text
# c1: a
# c2: tests/tutorials.rs::tutorial1_satellites_are_in_the_gps_meo_shell
# c3: 26000 km < |r(PG01)| < 27200 km
# c4: a
seg-eec62069a957 = <b>{ "1" }. Los satélites están en la capa real de órbita terrestre media (MEO) de GPS.</b> El semieje mayor nominal de GPS es <b>a = { "26,560" } km</b>, con una altitud ≈ { "20,180" } km sobre el radio medio de la Tierra de { "6,378" } km (IS-GPS-200, la especificación de interfaz de GPS; el GPS Standard Positioning Service (SPS) Performance Standard, Departamento de Defensa de EE. UU. (DoD); Misra y Enge, <em>Global Positioning System</em>, 2.ª ed.). El radio instantáneo de PG01, de <b>{ "26,480.9" } km</b>, queda a pocos cientos de km de <c1/>, justo lo que produce la excentricidad real de GPS (~{ "0.005" }–{ "0.02" }). La prueba <c2/> afirma <c3/> frente a este <c4/> publicado, que es <b>externo a Kshana</b>.

# text
# c1: T = 2π√(a³/μ)
# c2: a = 26,560 km
# c3: μ = 398,600.4418 km³/s²
# c4: T = 43,078 s = 11.967 h
seg-a052774de08f = <b>{ "2" }. La duración del paso es una revolución de GPS.</b> La tercera ley de Kepler da el período <c1/> con <c2/> y <c3/> (Sistema Geodésico Mundial { "1984" }, WGS-84; informe técnico de la National Imagery and Mapping Agency NIMA TR8350.2): <c4/>, medio día sidéreo. La duración del escenario de { "43,200" } s (“~una revolución de GPS”) coincide con eso con una diferencia inferior al { "0.3" } %, y la traza en tierra de GPS se repite cada día sidéreo (dos revoluciones), según IS-GPS-200.

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
# c3: sgp4
seg-067fb466e396 = <b>{ "3" }. Las posiciones propagadas están validadas, no solo son autoconsistentes.</b> El propagador SGP4/SDP4 que produjo esta tabla ECEF coincide con <b>los { "666" } vectores de verificación de AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 con una diferencia en el peor caso de { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) y coincide con el crate independiente <c3/> a nivel submicrométrico. Así, la tabla que exportó se comprueba frente a una implementación de referencia externa, no frente a la aritmética propia de Kshana.

# text
seg-652ec3b3d3b8 = <b>Una nota sobre las fechas de SP3.</b> La cabecera de época de SP3 muestra una fecha de calendario de relleno (2000-01-01); la propagación se ejecuta en realidad desde la época propia de cada TLE ({ "2021" }). Lea la tabla como “posiciones ECEF en el primer paso de muestreo”, no “el { "1" } de enero de { "2000" }”.

# text
# c1: tests/tutorials.rs
seg-74dcb96a27a9 = <c1/> convierte cada número anterior en un contrato de CI:

# text
# c1: tutorial1_orbit_headline_holds
# c2: best_pdop ≈ 1.071
# c3: best_position_sigma_m == best_pdop
# c4: sigma_uere_m = 1.0
# c5: samples_total == 361
# c6: 345/361
seg-cbad1e83279d = <c1/>: <c2/>, <c3/> (porque <c4/>), <c5/>, y el resumen contiene <c6/>.

# text
# c1: tutorial1_satellites_are_in_the_gps_meo_shell
# c2: a = 26,560 km
seg-241d75b1502b = <c1/>: el radio de PG01 está en la banda de la capa GPS, comprobado frente al <c2/> publicado.

# text
seg-34328f4f148b = Si el motor deja alguna vez de producir una capa GPS real, la compilación se pone en rojo.

# text
# c1: sigma_uere_m = 1.0
seg-3c23c11911cb = <b>El sigma de posición es PDOP × UERE, no PDOP.</b> Los dos son iguales <em>solo porque</em> <c1/> aquí. Cambie el UERE y se separan.

# text
seg-6bb2f31c15dc = <b>Las cifras de temporización están en nanosegundos</b>, la cifra de posición en metros. No las mezcle.

# text
# c1: holdover_s
seg-5bc68d0c144d = <b><c1/> está cuantizado por la rejilla</b> (una cota inferior al paso de la rejilla de tiempo). En este paso, el usuario está prácticamente siempre con posición, de modo que el holdover es de { "0" } s (no hay interrupción que atravesar a la deriva); ese es el caso <em>bueno</em>.

# text
# c1: mask_deg
seg-9c36a5c64af5 = Reduzca o amplíe la máscara de elevación (<c1/>) y observe cómo cambia la disponibilidad: es un ejercicio de nivel 2.

# text
# c1: scripts/fetch_tles.sh
seg-b0222934237e = Sustituya por una instantánea de TLE nueva con <c1/> (nivel 2, “usar datos nuevos”).

# text
seg-e487166204f8 = Pase al <a1>Tutorial { "2" } — Holdover del reloj</a1>, donde se <em>retira</em> la señal GNSS y el reloj de a bordo tiene que mantenerse a la deriva.

# text
seg-795315608752 = <s1>Anterior</s1>Tutoriales

# text
seg-97ca5a3cc77e = <s1>Siguiente</s1>{ "2" } · Holdover del reloj
