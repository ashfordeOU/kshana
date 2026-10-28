# docs--tutorials: translations (es)

# text
seg-501402fc366f = Holdover del reloj

# text
seg-cae10fb9bff8 = Escenario

# text
seg-a0b63210b807 = Leer más

# text
seg-a7cfe6f135f1 = Órbita y geometría

# text
seg-835df2d05f2a = Dominio de medición GNSS

# text
seg-3a0e724a8a2b = Nivel

# text
seg-28e87f407a10 = Dominio

# text
seg-d6476863f862 = Capacidad

# text
seg-029de6b99be0 = Navegación inercial a estima

# text
seg-9ef8f99ca6e4 = Transferencia de tiempo

# text
seg-b03d56f501c3 = Tipo

# text
seg-ec26df467b88 = PNT con fusión de sensores mediante un filtro de Kalman conjunto sobre las mismas entradas híbridas.

# text
seg-4f19d4fb1341 = Barrido genérico N-D sobre cualquier paquete mediante claves TOML con puntos o rutas de métricas JSON.

# text
seg-e7ab7b55c969 = Barrido 1-D de estudio de compromisos sobre un parámetro del paquete de relojes.

# text
seg-e43910de5fd8 = Cuadernos

# text
seg-d78822583c64 = Notebook

# text
# c1: docs/tutorials/README.md
seg-3959aefa12be = Fuente: <c1/>

# text
# c1: tests/tutorials.rs
seg-a5ebe4befda8 = Ejemplos prácticos que le llevan de “ejecutar un escenario incluido” a “cuantificar y defender un resultado”. Cada número citado en los tres tutoriales es una salida real del motor, anclada a una referencia independiente externa de autoridad reconocida (no circular), y <b>fijada por una prueba de integración</b> (<c1/>), de modo que un tutorial nunca puede desviarse en silencio de lo que el motor hace realmente. Si un tutorial dice que el reloj óptico mantiene { "6600" } s, la prueba hace fallar la compilación el día en que eso deje de ser cierto.

# text
seg-1c045624a6be = Kshana es un simulador de posicionamiento, navegación y temporización (PNT). Los tutoriales usan algunas abreviaturas más, cada una desarrollada donde aparece por primera vez: GNSS (Sistema Global de Navegación por Satélite), GPS (Sistema de Posicionamiento Global), CLI (interfaz de línea de comandos) y TOML (Tom's Obvious Minimal Language, el formato de archivo de escenario).

# text
seg-7a84a80b57d5 = ¿Es nuevo en el proyecto? Lea primero la <a1>introducción a los conceptos</a1> y el <a2>glosario</a2>, y luego vuelva aquí.

# text
seg-b4cd44590347 = Los tres ejemplos prácticos

# text
seg-eebeab9693b2 = Tutorial

# text
seg-a0bc6e585d71 = Qué se aprende

# text
seg-b6cc01b76947 = Tipo de escenario

# text
seg-429bab0a0e05 = Dificultad

# text
seg-0e188f9c0f65 = ~Tiempo

# text
seg-bcf40448e55d = Mi primera órbita: dónde están los satélites GPS

# text
seg-de1032024a69 = propagar una constelación GPS real, leer la disponibilidad, la dilución de la precisión de la posición (PDOP) y la exactitud de posición, y exportar dónde están realmente los satélites (formato de órbita precisa SP3)

# text
seg-e7b6c262333e = principiante

# text
seg-d6042fb74a5f = { "15" } min

# text
seg-07a8d6cfc1ae = Holdover del reloj: cuánto tiempo puede mantenerse a la deriva

# text
seg-0e9c77468fb2 = ejecutar un holdover de reloj sin GNSS, leer la cifra de mérito de temporización y comprender la ley de crecimiento √(q_wf·T) que hay detrás

# text
seg-0f6fba31626a = { "20" } min

# text
seg-7973e9c54366 = Resiliencia GNSS cuántica frente a clásica

# text
# c1: spoof
# c2: hybrid
seg-4d8036091b37 = el colofón: un detector de suplantación (<c1/>) y un conjunto PNT fusionado completo (<c2/>), y cómo leer juntas la seguridad, la integridad y la navegación a estima

# text
seg-1b39d4927602 = intermedia

# text
seg-ea37ac575235 = { "35" } min

# text
# c1: notebooks/
seg-1d56222dfd25 = Los notebooks de Jupyter ejecutables, con datos sintéticos y conjuntos de elementos públicos conservados solo en el repositorio, están en <a1><c1/></a1>:

# text
seg-9aae3a4e10dc = Confianza y entrenamiento de buques

# text
seg-1d680d635c6d = generar un flujo NMEA sintético de puente con un suceso programado y luego puntuarlo con los monitores de confianza de buques (de carácter consultivo, no un equipo de navegación homologado)

# text
seg-739f8f5a9082 = dónde los datos de navegación han parecido degradados y qué parte de una ruta afectan

# text
seg-443c908ff49b = Correspondencia de compliance y exportación de test-bench

# text
seg-0d639065192a = a qué filas de marcos públicos aporta evidencias a favor un conjunto de ejecuciones (nunca que un marco se satisfaga), y el movimiento y los sucesos de un escenario exportados como texto para un simulador GNSS de laboratorio (no se escribe ninguna señal)

# text
seg-981a3238794d = GDOP cuántico frente a clásico

# text
seg-228ce150ee80 = la misma geometría de constelación con un sensor cuántico y uno clásico, comparados por dilución de la precisión

# text
seg-4b82b5edd4ff = Geometría del cielo bajo un perfil del horizonte

# text
seg-1186b6cd6149 = los satélites que ve un emplazamiento bajo el perfil del horizonte de una calle o un muelle, su DOP y su elipse de error, un cielo fechado a partir de conjuntos de elementos y un Monte Carlo con semilla frente a la covarianza (MODELLED)

# text
seg-d9d06cb8e237 = Cómo ejecutar un tutorial

# text
seg-ffc4ddfc9426 = Cada tutorial ejecuta el mismo escenario de tres maneras; elija la que le convenga. Todas llaman al <em>único</em> motor, de modo que los números son idénticos (refleja la sección <a1>Uso</a1> del README).

# text
# c1: kind
# c2: <scenario>.result.json
# c3: <scenario>.chart.svg
# c4: <scenario>.report.html
# c5: <scenario>.report.json
# c6: <scenario>.table.csv
# c7: realtime-frame-eop
# c8: lunar-time-budget
# c9: lunar-jamming
# c10: leo-navmsg
# c11: telecom-timing
# c12: moonlight-service-volume
seg-e7ba76a06aa6 = <b>Línea de comandos.</b> La CLI despacha según el campo <c1/> del escenario y escribe <c2/>, <c3/>, <c4/> y <c5/> junto a la entrada (JSON es JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Algunos tipos de escenario publican además una tabla de reproducibilidad como <c6/> (valores separados por comas): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> y <c12/> cuando se fija un sitio de exportación. Ninguno de los tres tutoriales es uno de ellos, de modo que no verá ese archivo aquí.

# text
# c1: cargo run --
# c2: cargo install kshana
# c3: kshana scenarios/orbit-sgp4-gps.toml
# c4: kshana example
# c5: kshana example orbit-sgp4-gps > orbit-sgp4-gps.toml
# c6: scenarios/orbit-sgp4-gps.toml
seg-5ee6f15d3b08 = <c1/> compila la CLI a partir de esta copia de trabajo. Con un binario instalado (<c2/>), el mismo comando es <c3/>. Sin una copia de trabajo, la mayoría de los escenarios incluidos vienen en el binario: <c4/> los enumera (y nombra los pocos que no vienen incluidos, con el motivo), y <c5/> escribe uno: la copia de <c6/> con la que se compiló el binario.

# text
# c1: kshana.run
seg-1b7e851749d5 = <b>Python.</b> Compile la extensión a partir de esta copia de trabajo una vez con maturin, dentro de un entorno virtual activo, y luego llame a <c1/>:

# text
# c1: pip install kshana
# c2: json.loads(kshana.list_kinds())
seg-3aa10d551694 = <c1/> instala en su lugar la rueda publicada. Puede ir por detrás de esta copia de trabajo: <c2/> le indica qué tipos de escenario tiene su compilación.

# text
seg-333b7956b06b = <b>Playground del navegador.</b> Sin instalación: abra el <a1>Studio</a1>, elija un escenario, edite los parámetros y lea el resultado. No se sube nada; el motor se ejecuta en el cliente como WebAssembly.

# text
# c1: scenario + seed + engine version
seg-2cd8bbd1e7f0 = Los tutoriales citan la <b>CLI</b>, pero cada comando tiene el equivalente de Python y del playground indicado arriba. Cada resultado es reproducible a partir de <c1/>: ejecútelo dos veces y obtendrá una salida idéntica bit a bit.

# text
seg-d497caeb889a = Escenarios didácticos anotados

# text
# c1: .toml
# c2: scenarios/
# c3: # expected:
# c4: scenarios/
# c5: tests/tutorials.rs
seg-c966709a600d = Para cada dominio de capacidad hay un <c1/> muy comentado en <a1><c2/></a1>: una <em>copia didáctica</em> de un escenario canónico con cada campo explicado en línea, la referencia independiente citada indicada por nombre y el resumen esperado de una línea registrado como un comentario <c3/>. Los valores de los campos son idénticos a los del original en el directorio <c4/> de nivel superior del repositorio (<c5/> compara el TOML analizado), de modo que la salida documentada sigue siendo cierta. Los hashes de referencia tampoco se tocan: un comentario nunca cambia el hash de un escenario.

# text
seg-871fcecc5ee1 = Archivo didáctico

# text
seg-4e852a6a1581 = Derivado de

# text
seg-e74e1c9b387e = Integridad (RAIM, monitorización autónoma de integridad del receptor)

# text
seg-95b6cceb76e6 = Seguridad (spoofing)

# text
seg-dab48471c270 = PNT híbrido

# text
# c1: kind = "spoof"
# c2: 1 − P_md
# c3: kind
seg-c889e5e77121 = El archivo didáctico de <b>seguridad</b> usa <c1/> en su interior: la cifra de mérito de seguridad (<c2/>, uno menos la probabilidad de detección fallida) la produce el paquete spoof. El nombre del archivo sigue a la <em>capacidad</em> (seguridad), mientras que el <c3/> sigue al <em>paquete</em> (spoof). La cabecera de ese archivo lo señala.

# text
seg-89fef83a9d54 = El catálogo completo de tipos de escenario

# text
# c1: runs > 1
seg-0f744a3a7193 = Holdover del reloj frente a la especificación; conjunto Monte Carlo opcional (<c1/>).

# text
seg-9a2564fdc86a = Navegación inercial a estima de 1-DOF (un grado de libertad) durante una interrupción de GNSS.

# text
seg-62f0400581b3 = Disponibilidad de GNSS y dilución de la precisión (DOP) a partir de una constelación (Walker / elementos de dos líneas / RINEX, el formato Receiver Independent Exchange).

# text
seg-59fc8330ba12 = Instantánea / separación de soluciones / ARAIM (RAIM avanzado) con niveles de protección horizontal y vertical (HPL/VPL) y diagrama de Stanford.

# text
seg-22c598d57e77 = Paso de nivel de protección ARAIM en el polo sur lunar frente a un conjunto de relés LunaNet.

# text
seg-f97d8fb3b6fa = Transferencia bidireccional de tiempo/frecuencia óptica frente a de radiofrecuencia (RF).

# text
seg-8af1c652d854 = Colofón de PNT híbrido: reloj + unidad de medida inercial (IMU) + ayuda de transferencia de tiempo.

# text
seg-d24a9596f53e = Filtro de Kalman extendido de estado de error para GNSS/INS (sistema de navegación inercial) débil y fuertemente acoplado.

# text
seg-3c915870476a = Simulación de pseudodistancias en el dominio de la medida (ionosfera de Klobuchar, troposfera de Saastamoinen/Niell) + RAIM.

# text
seg-72284bad54e4 = Interferencia (jamming) con balance de enlace: relación interferencia/señal (J/S) → densidad efectiva de portadora a ruido (C/N₀) → pérdida de enganche.

# text
seg-2ead4d42b427 = Detector estocástico de suplantación de hora (Neyman–Pearson / χ²₁) con probabilidades de falsa alarma y de detección fallida por Monte Carlo (P_fa/P_md).

# text
seg-5f2f9e63093a = Más allá de los tutoriales: capacidades más recientes

# text
# c1: cargo run -- <file>
# c2: kshana <file>
# c3: tests/tutorials.rs
# c4: label
seg-3d6a8fd31402 = Los tres tutoriales se quedan en los paquetes clásicos de reloj, órbita y seguridad. El motor ha crecido mucho más allá de ellos. Cada fila siguiente es un escenario incluido que puede ejecutar tal cual (<c1/> o <c2/>); el resumen es la primera línea que kshana { "0.35.0" } imprimió para él el 2026-10-10. A diferencia de las cifras de los tutoriales, estas líneas son el registro de una ejecución, no están fijadas por <c3/>: vuelva a ejecutar el escenario para obtener el valor actual. Los resultados declaran su propio alcance (la mayoría llevan un <c4/>), y la <a1>matriz de verificación</a1> indica qué capacidades están VALIDATED frente a una referencia independiente externa y cuáles están MODELLED.

# text
seg-2dc1d8680abb = Primera línea del resumen

# text
seg-abd799395f27 = Espectro de banda L y cascada de interferencia (jamming)

# text
seg-33453b2cfdf3 = El sistema solar en una época

# text
seg-23bc4ff7f741 = Posicionamiento alrededor de otro cuerpo

# text
seg-c135b151e469 = Diseño de constelaciones a gran escala

# text
seg-065995e9bd5e = Campañas: tipos de escenario encadenados en una línea temporal

# text
seg-dbae357e7e34 = Un sistema LEO-PNT de extremo a extremo

# text
seg-9d3d72ea03df = Posicionamiento fusionado MEO + LEO

# text
seg-acc2793d1721 = Señales LEO, pasos y mensajes de navegación

# text
# c1: LEO pass link budget, air user at 50.00, -30.00; 1 LEO satellite(s), 900 s window
seg-db2626e54a24 = <c1/> (el paso)

# text
seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

# text
seg-aa93235e8c6d = Convergencia de PPP con una capa LEO; posicionamiento 5G

# text
seg-01160980ce50 = Resiliencia: GNSS interferido, LEO sostiene al usuario

# text
seg-adf8453bc035 = Verticales: ferrocarril, marítimo, telecomunicaciones, vehículos, Ártico

# text
# c1: scenarios/leo-vertical-rail-maritime.toml
# c2: leo-vertical-*
seg-15a5098b5045 = <c1/> (y los demás archivos <c2/>)

# text
seg-e6494ed83ee3 = Holdover de telecomunicaciones frente a los límites de reloj de la ITU-T (Unión Internacional de Telecomunicaciones, Sector de Normalización de las Telecomunicaciones) G.8272

# text
seg-dfc04f1abe82 = LEO es órbita terrestre baja y MEO órbita terrestre media; PVT es posición, velocidad y tiempo; PPP es posicionamiento preciso de punto; 5G es el estándar móvil de quinta generación; TDB es el Tiempo Dinámico Baricéntrico; JD es la Fecha Juliana; TE es error de tiempo.

# text
seg-1d45d94f2e5b = La CLI añade tres salidas a cualquier ejecución:

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
# c3: kshana --study <suite.toml>
# c4: .study.json
# c5: .study.html
# c6: kshana --study scenarios/quantum-pnt-demonstrator.suite.toml
seg-893276648fec = <b>Informes.</b> Cada ejecución escribe <c1/> y <c2/> (véase <a1>REPORTS.md</a1>). <c3/> ejecuta una suite de escenarios en un único <c4/> y <c5/>, por ejemplo <c6/>.

# text
# c1: kshana <scenario.toml> --animate <svg|html|frames|all>
# c2: --animate html
# c3: scenarios/orbit-sgp4-gps.toml
# c4: orbit-sgp4-gps.animation.html
# c5: solar-system
seg-e9f06d47c82c = <c1/> representa las series temporales de la ejecución; por ejemplo, <c2/> sobre <c3/> escribe <c4/>. Un tipo de escenario sin eje de tiempo muestreado (como <c5/>) se rechaza con un error; véase <a1>ANIMATION.md</a1>.

# text
seg-f037fe5d7ffa = Exportaciones de interoperabilidad.

# text
# c1: --export <czml|kml|geojson|stk|sigmf|all|list>
# c2: --export list
# c3: spectrum
# c4: --export-sp3
# c5: --export-omm
# c6: --export-oem
seg-3977722b8517 = <c1/> escribe el resultado para otras herramientas: CZML (Cesium Language), KML (Keyhole Markup Language, para Google Earth), GeoJSON (JSON geográfico), unas efemérides STK (Systems Tool Kit) o una grabación SigMF (Signal Metadata Format). <c2/> indica qué formatos se aplican a un escenario; SigMF se aplica solo a <c3/>. El paquete de órbita también exporta <c4/>, <c5/> y <c6/> (mensajes de órbita de CCSDS, el Comité Consultivo para Sistemas de Datos Espaciales). Véase <a1>INTEROP.md</a1>.

# text
seg-3abd51182cc0 = Ejercicios graduados

# text
# c1: exercises/
seg-9513af4fb862 = Recorra la escalera. Cada nivel es más difícil y más defendible que el anterior; las soluciones de referencia están en <a1><c1/></a1>.

# text
seg-89ad8eb64a54 = Objetivo

# text
seg-0a824838ef57 = Qué hace

# text
seg-2463a86470b8 = Solución de referencia

# text
seg-7ce3ac2347b9 = Nivel { "1" } — ejecutar y leer

# text
seg-e1dee35aedff = ejecutar sin cambios un escenario incluido y leer una cifra de mérito

# text
# c1: scenarios/clock-holdover.toml
# c2: holdover_s
seg-296694716b3b = Ejecute <c1/>; imprima el <c2/> cuántico frente al clásico. CLI, playground o una llamada de Python de una línea.

# text
seg-bad6d3afb6a0 = Nivel { "2" } — editar y barrer

# text
seg-c18da238e470 = cambiar un parámetro y observar un efecto monótono

# text
# c1: threshold_ns
# c2: kind = "sweep"
# c3: "sweep-nd"
seg-598ca8efea83 = Reduzca la especificación del reloj (<c1/>) o alargue la interrupción y observe cómo cae el holdover; o use <c2/>/<c3/> para tabularlo.

# text
seg-1d9dfecce6fa = Nivel { "3" } — cuantificar y defender

# text
seg-5b57f2c8ffb9 = Monte Carlo, bandas de confianza, reproducibilidad y un nivel de protección

# text
# c1: runs = N
# c2: scenario_hash
seg-0fac2036b289 = Ejecute un conjunto de relojes (<c1/>), lea la banda [p05–p95], confirme que dos ejecuciones dan un <c2/> idéntico y lea un resultado de integridad / diagrama de Stanford.

# text
# c1: maturin develop --features python
# c2: tier2_sweep.py
seg-45dc753da682 = Las soluciones de referencia usan la extensión de Python (antes, <c1/>). Ejecutado desde la raíz del repositorio, <c2/> imprime el holdover del reloj atómico a escala de chip cayendo de { "2610" } s con una especificación de { "20" } ns a { "1140" } s con { "5" } ns.

# text
seg-e59b1beadb98 = ¿Quiere datos nuevos?

# text
seg-530db2e609d0 = Las cifras principales de estos tutoriales se ejecutan por completo a partir de escenarios que ya están en el repositorio. No se descarga nada, lo que las mantiene reproducibles y seguras de ejecutar en integración continua (CI). Para los ejercicios de “ampliación” puede obtener datos en vivo:

# text
# c1: scripts/fetch_tles.sh
seg-6a20ec96cb92 = <b>Elementos de dos líneas (TLE) de GPS</b> (actualizan la constelación de órbita): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, conjuntos de elementos de 3 líneas en texto plano (nombre + línea { "1" } + línea { "2" }). Auxiliar: <c1/>. Datos abiertos (catálogo del 18.º Escuadrón de Defensa Espacial de la Fuerza Espacial de EE. UU., redistribuido por Celestrak, Dr. T. S. Kelso).

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
seg-9bcea1d9eb12 = <b>Referencia independiente de verificación de SGP4 (Simplified General Perturbations { "4" })</b> (ya incorporada, no la vuelva a descargar): vectores de prueba de AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 “Revisiting Spacetrack Report #3”, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, usados por <c1/>; véase <a2><c2/></a2>.

# text
seg-d33aa34b2762 = <b>Referencia independiente de las relaciones de estabilidad de reloj</b>: Publicación Especial { "1065" } del NIST (National Institute of Standards and Technology) (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, las relaciones entre σ_y(τ) y la fase en que se basa el Tutorial { "2" }.

# text
seg-36be39f17e35 = <s1>Anterior</s1>Guía de Studio

# text
seg-6f6204737a87 = <s1>Siguiente</s1>{ "1" } · Su primera órbita

seg-2fa9e002b3a2 = El motor despacha según el <c1/> del escenario. La tabla siguiente enumera los tipos de escenario de uso más habitual (los ocho dominios de los tutoriales anteriores y sus vecinos más próximos). <b>No</b> es el conjunto completo: <c2/> devuelve los <c3/> tipos de escenario integrados. Esa función (expuesta como <c4/> en los enlaces de Python y de WebAssembly (WASM), y como <c5/> en la línea de comandos) es el catálogo de referencia, siempre actualizado, y <a1><c6/></a1> es su enumeración generada, con una sección por tipo y los campos TOML obligatorios y opcionales. <c7/> exige que todo tipo de escenario que documenta un tutorial sea un tipo de despacho real, de modo que nada de esta tabla puede nombrar un tipo de escenario que no exista.
