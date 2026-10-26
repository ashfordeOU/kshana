# docs--provenance: translations (es)

# text
seg-9a2a5f0a8a02 = Sistema solar

# attr:aria-label, text
seg-d01db1c2710a = Referencia

# text
seg-28e87f407a10 = Dominio

# text
seg-ad856ad710eb = Estado

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-638b8d451550 = Sensor

# text
seg-d4a762001549 = Licencia

# text
seg-60cd077d82a7 = Modelo

# text
seg-2afa300864a9 = Parámetros

# text
seg-32b620b3574e = Uso

# text
# c1: docs/PROVENANCE.md
seg-f3de25879362 = Fuente: <c1/>

# text
seg-257526f1f93f = Procedencia: cada parámetro es trazable hasta una fuente publicada

# text
seg-8c12958898a8 = La disciplina central de honestidad de Kshana es que <b>cada parámetro de sensor, cada modelo físico y cada conjunto de datos de validación es trazable hasta una fuente publicada</b>: una hoja de datos, un artículo revisado por pares, un ICD (documento de control de interfaz) de señal en el espacio o una norma. Este documento reúne esas cadenas de procedencia en una única tabla de referencia citable.

# text
# c1: [clock_quantum]
# c2: [clock_classical]
# c3: provenance
# c4: ModelSpec
# c5: src/types.rs
# c6: with_provenance
# c7: src/inertial/imu_errors.rs
# c8: quantum.spec.provenance
# c9: classical.spec.provenance
# c10: units
# c11: input
# c12: computed
# c13: closed-form
# c14: internal-consistency
seg-279914171c2e = La procedencia no es solo documentación: cada tabla de sensor de un escenario (por ejemplo <c1/> y <c2/>) lleva una cadena <c3/> (<c4/> en <c5/>; <c6/> en <c7/> para el modelo de errores de la unidad de medida inercial (IMU)) que <b>pasa al JSON del resultado</b> (JavaScript Object Notation) como <c8/> y <c9/>, de modo que cada ejecución lleva sus propias citas de parámetros. El bloque <c10/> del resultado también etiqueta cada campo numérico con una clase de procedencia (<c11/>, <c12/>, <c13/>, <c14/>, …). Las tablas siguientes son el índice consolidado y legible de esas cadenas, además de la procedencia algorítmica y de validación tomada de los comentarios del código fuente.

# text
# c1: VALIDATION.md
# c2: validated
# c3: modelled
# c4: not modeled
# c5: QUANTUM-MODELS.md
seg-683fd369407a = La madurez se etiqueta con honestidad en todo el documento: <b>calificado para vuelo</b> (ha volado), <b>laboratorio en tierra / cohete sonda</b> (demostrado, no volado) o <b>objetivo espacial sobre hardware de tierra</b> (una cifra aspiracional para hardware que no ha volado; en particular, toda cifra de reloj de red óptica de estroncio). Véase <a1><c1/></a1> para las etiquetas <c2/> / <c3/> / <c4/> de cada cifra y <a2><c5/></a2> para el análisis de madurez entre laboratorio en tierra y vuelo.

# text
seg-80834864bfdd = { "1" }. Parámetros de reloj y de referencia de frecuencia

# text
seg-305f560d4b08 = Cifra clave

# text
seg-c35a20fa2529 = Madurez

# text
seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (reloj atómico a escala de chip)

# text
seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

# text
seg-222707a1bde3 = Hoja de datos del fabricante

# text
seg-97709a803dea = <b>calificado para vuelo</b> (pieza comercial desplegada)

# text
seg-75db01df1aea = Reloj de red óptica de estroncio (objetivo espacial)

# text
seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

# text
seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al., <a1>arXiv:{ "1503.08457" }</a1>

# text
seg-b8c64caf79f3 = <b>objetivo espacial sobre hardware de tierra</b>: ningún reloj óptico de Sr ha volado

# text
seg-b5a006507475 = Reloj de red óptica de estroncio (récord de laboratorio)

# text
seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

# text
seg-b21bb1b6bf40 = Oelker et al., <em>Nature Photonics</em> ({ "2019" })

# text
seg-95fb87b3a118 = solo laboratorio en tierra

# text
seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; benchmark de la ISS (Estación Espacial Internacional))

# text
seg-9d6acc3191a5 = del orden de { "1" }×{ "10" }⁻¹⁶ tras varios días de integración

# text
seg-1cddc44025d7 = ACES/PHARAO de la ESA (Agencia Espacial Europea), operativo en la ISS desde abril de { "2025" } (citar los resultados publicados por la ESA)

# text
seg-75b7bb5ca4c8 = <b>calificado para vuelo</b> (microondas/máser, no óptico)

# text
# c1: q_wf = σ_y(1 s)²
# c2: flicker_floor
# c3: VALIDATION.md
seg-aeb8f189db37 = El coeficiente de ruido blanco de frecuencia de Allan que usa el modelo de holdover es <c1/>; la modulación de frecuencia de flicker (flicker FM) y el envejecimiento se modelan solo cuando se fija explícitamente un <c2/> (véase <a1><c3/></a1>); en caso contrario, no se modelan.

# text
seg-bfe4524b6664 = { "2" }. Parámetros de sensores inerciales

# text
seg-5cd1984ba399 = Cifras clave

# text
seg-53ad9ba8cecb = Tríada de acelerómetros cuánticos híbridos de Exail

# text
seg-b40c95a6bea5 = estabilidad del sesgo { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); ruido { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

# text
seg-fdb8f1d648ba = Templier et al., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

# text
seg-570f41ff76c9 = Acelerómetro de cuarzo de grado de navegación Honeywell QA-2000

# text
seg-a7dbc9a9705e = estabilidad del sesgo ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; ruido ~{ "20" } µg/√Hz; inestabilidad del sesgo ~{ "1" } µg

# text
seg-3ad7ce01c6e2 = Fabricante / Groves <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

# text
seg-37c841945d3e = Modelo de errores de la IMU (factor de escala, desalineación, sensibilidad a g, cuantización, rampa de velocidad)

# text
seg-b7547264e608 = cinco categorías sistemáticas

# text
seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Tabla { "4.1" }

# text
seg-c24b9890cf3b = modelo

# text
seg-67a38b3fe143 = Mecanización strapdown (NED, norte-este-abajo; coning/sculling)

# text
seg-832b3645b515 = actitud en cuaternios §{ "2.2" }, §{ "5.5" }; mecanización NED §{ "5.4" }; gravedad §{ "2.4" }

# text
seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2.ª ed.

# text
seg-ac7ef2be17e0 = { "3" }. Parámetros de transferencia de tiempo y frecuencia

# text
seg-7634c6f4b32c = Enlace

# text
seg-dddf65bbb231 = Óptico bidireccional en espacio libre (entre satélites)

# text
seg-e3a8990e650a = límite de laboratorio ~{ "1" } fs; objetivo creíble en órbita de { "1" } ps

# text
seg-1adf3425eda9 = Giorgetta et al. ({ "2013" }, <em>Nature Photonics</em>); Deschênes et al. ({ "2016" }, <em>Physical Review X</em>)

# text
seg-9ab60d7ed2a9 = TWSTFT (transferencia bidireccional de tiempo y frecuencia por satélite, banda Ku)

# text
seg-543939310789 = sesión única ~{ "0.5" } ns

# text
seg-7f6127bdb4d9 = BIPM (Oficina Internacional de Pesas y Medidas) / PTB (Physikalisch-Technische Bundesanstalt, el instituto nacional de metrología de Alemania) / NIST (National Institute of Standards and Technology)

# text
seg-d1f0ed9c0323 = { "4" }. Modelos de órbita, de sistemas de tiempo y de marcos

# text
seg-2ad53ecbee02 = Ecuación / norma

# text
seg-7ed15b9389e0 = Referencia (comentario del código fuente)

# text
seg-4d6989c7153e = Propagación SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" })

# text
seg-0d46975247cc = el modelo SGP4 WGS-72 (WGS: World Geodetic System)

# text
seg-6dcfe89aeb8f = Vallado et al., <em>"Revisiting Spacetrack Report #3"</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

# text
seg-e46bf46a4d35 = Segundo intercalar / sistemas de tiempo (UTC/TAI/TT/UT1 (UTC: Tiempo Universal Coordinado; TAI: Tiempo Atómico Internacional; TT: Tiempo Terrestre; UT1: Tiempo Universal { "1" }, tiempo de rotación de la Tierra))

# text
seg-7505e93b9bf8 = régimen de segundos intercalares enteros desde 1972-01-01

# text
seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); historial de segundos intercalares del Boletín C del IERS

# text
seg-d25f68665f8e = Ángulo de rotación terrestre

# text
seg-a3a803bdc8a0 = Resolución B1.8 de la IAU (Unión Astronómica Internacional) de { "2000" }

# text
seg-049ad81ff5e8 = Posición/reloj del SV (vehículo espacial, es decir, un satélite) a partir de efemérides de radiodifusión

# text
# c1: F·e·√A·sin Eₖ
# c2: TGD
seg-a1a595008b2a = algoritmo de usuario, <c1/> relativista, <c2/>

# text
seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

# text
seg-8e14a54b1f09 = Constantes de efemérides de Galileo / QZSS (el Sistema de Satélites Quasi-Cenit de Japón) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

# text
seg-93b03e3b3e43 = ICD de SIS (documentos de control de interfaz) de cada sistema

# text
seg-c7c6759c0373 = ICD de SIS del Servicio Abierto (OS) de Galileo; ICD de SIS del OS de BeiDou (CGCS2000, el Sistema de Coordenadas Geodésicas de China { "2000" }); ICD de GLONASS (el Sistema Global de Navegación por Satélite de Rusia) (PZ-90 (PZ: Parametry Zemli, el datum geodésico ruso))

# text
seg-7d59b9c3dabc = { "5" }. Modelos GNSS del dominio de medida y de resiliencia

# text
seg-dd7e88cfd703 = Ionosfera monofrecuencia de Klobuchar

# text
seg-9920eb06b90c = algoritmo de semicírculos

# text
seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

# text
seg-0358759614c5 = Troposfera cenital de Saastamoinen

# text
seg-b4b7f91f6112 = retardo cenital hidrostático + húmedo

# text
seg-ba06204996b7 = Davis et al. ({ "1985" }); Groves §{ "9.4" }

# text
seg-9fc988ebf2aa = Funciones de mapeo de Niell

# text
seg-8eb79ff7faaa = hidrostática y húmeda, mapeo por elevación

# text
seg-ca4642e37561 = Niell ({ "1996" })

# text
seg-7876aa9fc732 = Balance de enlace antijamming

# text
# c1: [1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹
seg-75e1c40bdc0f = <c1/> (C/N₀ la relación entre potencia de portadora y densidad de ruido, J/S la relación jamming-señal, Q el factor de separación espectral, Rc la tasa de chips) → C/N₀ efectiva → pérdida de enganche

# text
seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3.ª ed., §{ "9.4" }

# text
seg-c6e2f2ee16cb = Detección de spoofing / de energía

# text
seg-15390c9b849c = Prueba de energía de Neyman–Pearson / χ²₁ bilateral; Φ⁻¹ mediante Acklam; erf mediante Abramowitz & Stegun { "7.1.26" }

# text
seg-1c30c0b6a81f = teoría clásica de la detección

# text
seg-023867611249 = Estabilidad de la familia de Allan (ADEV/MDEV/TDEV/HDEV (ADEV: desviación de Allan; MDEV: desviación de Allan modificada; TDEV: desviación de tiempo; HDEV: desviación de Hadamard))

# text
seg-478bb58f8a7f = con intervalos de confianza

# text
seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

# text
seg-a958238e3d1c = RAIM (monitorización autónoma de la integridad en el receptor) / integridad (HPL/VPL (HPL: nivel de protección horizontal; VPL: nivel de protección vertical), separación de soluciones de ARAIM (monitorización autónoma avanzada de la integridad en el receptor))

# text
seg-41b219635fbe = instantánea y separación de soluciones

# text
# c1: INTEGRITY.md
seg-b971eeb2bf2b = véase <a1><c1/></a1>

# text
seg-926261321371 = { "6" }. Conjuntos de datos de validación

# text
# c1: scripts/fetch_*.sh
# c2: realdata-cache/
seg-04863ce407e7 = <b>Política de incorporación al repositorio.</b> Incorporamos una copia literal de cada conjunto de datos de validación cuya licencia permita la redistribución <em>y</em> cuyo tamaño quepa con holgura en git, de modo que un clon pueda reproducir la validación sin conexión, sin red y sin enlaces rotos. Un conjunto de datos queda <b>condicionado a su descarga</b> (se descarga con un asistente <c1/> en el directorio <c2/>, ignorado por git, y solo se incorporan los pequeños valores de referencia <em>derivados</em>) únicamente cuando su licencia no permite con claridad la redistribución o cuando es demasiado grande para git. Cada conjunto de datos condicionado registra abajo su motivo concreto; nada se condiciona por comodidad.

# text
seg-b966dd26caa6 = Conjunto de datos

# text
seg-e0351f9b83fc = Estado en el repositorio

# text
seg-ea1ad9965f74 = Vectores de prueba SGP4 de AIAA 2006-6753 (los { "666" })

# text
seg-cb7efe21070c = Validación numérica de SGP4: peor caso { "4.12" } mm

# text
seg-a624c6877c48 = Vectores de referencia publicados (Vallado, AIAA)

# text
seg-d90675af2816 = Incorporado

# text
seg-c1cee31c42df = ADEV σ_y(τ) de reloj óptico de ⁸⁸Sr (Norcia et al., Science { "366" }:{ "93" }, { "2019" })

# text
seg-232e54a0e396 = validación del ajuste a la estabilidad medida de un reloj óptico

# text
seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

# text
seg-2bb00a0c58ef = Tesela de elevación N36W117 de NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM (Shuttle Radar Topography Mission) v3 (Valle de la Muerte, diezmada a 6 segundos de arco, { "722" } KB)

# text
# c1: .hgt
seg-088a57c3a5b1 = validación del lector <c1/> de terreno-DEM (DEM: modelo digital de elevación) sobre relieve real (cuenca de Badwater ≈ −{ "86" } m)

# text
# c1: elevation-tiles-prod
seg-ed90325543c8 = <b>Dominio público</b> (NASA/USGS SRTM v3; mediante AWS (Amazon Web Services) Open Data <c1/>)

# text
seg-9607b2318cf5 = Ejemplos OEM/TDM del Libro Azul CCSDS 502.0/503.0 (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message)

# text
seg-b53475918422 = validación de ida y vuelta del analizador CCSDS

# text
seg-25d9f396b539 = Ejemplos publicados de la norma (CCSDS)

# text
seg-35dfb14360e3 = Órbita precisa SP3 del IGS (International GNSS Service) (Standard Product { "3" }, el formato de órbita precisa) + muestras de navegación RINEX (Receiver Independent Exchange Format)

# text
seg-5e321b8b5287 = ajuste de órbita + validación de integridad

# text
seg-ec0b6ff10fc5 = Datos abiertos del IGS (libres para cualquier uso, con atribución)

# text
# c1: gps-ops
# c2: galileo
seg-00db9583ce55 = Instantáneas TLE (conjunto de elementos de dos líneas) de Celestrak (<c1/>, <c2/>)

# text
seg-4dabd0f62f90 = escenarios de constelaciones reales

# text
seg-6e7c8deb24b6 = Condiciones de Celestrak (atribución; TLE (conjuntos de elementos de dos líneas) de origen gubernamental de EE. UU.)

# text
# c1: tests/fixtures/celestrak/
# c2: scripts/fetch_tles.sh
seg-2827577f7008 = <c1/> + <c2/> en vivo

# text
seg-c0945969860a = Salidas de referencia de scipy / scikit-learn / filterpy

# text
seg-61546d769e23 = validación de núcleos numéricos + estimadores

# text
seg-b74e03fddbca = Generado localmente a partir de bibliotecas BSD/MIT (BSD: licencia Berkeley Software Distribution)

# text
# c1: tests/fixtures/scipy/
seg-9d818fc79012 = <c1/> (+ scripts generadores)

# text
seg-4d6c3069b01f = Desviaciones de referencia de Stable32 (escalas de ADEV/HDEV por década)

# text
seg-0a7b677330a6 = paridad con el estimador de Allan

# text
seg-3c91f9ae6473 = Valores de resumen derivados (pequeños)

# text
seg-14aecb331164 = Serie de fase <b>bruta</b> de un 5071A de cesio ({ "556 990" } puntos, { "12" } MB)

# text
seg-9d43f399613b = ADEV/HDEV solapados sobre un reloj de Cs real

# text
# c1: allantools
seg-87b53409bedb = <b>Poco claro</b>: <c1/> tiene licencia LGPL-3.0 (la GNU Lesser General Public License, una licencia de software) <em>sin una cesión explícita para redistribuir datos</em>; el archivo está excluido de la distribución de PyPI (Python Package Index)

# text
# c1: scripts/fetch_cs5071a.sh
seg-b741be74c8ad = <c1/>; se incorporan las escalas derivadas

# text
seg-5e07eabcfe78 = PHASE.DAT <b>bruto</b> (serie de regresión de 1000 puntos)

# text
seg-d9f61f4b985c = Serie de paridad de estimadores de Stable32

# text
seg-df8e0a135895 = <b>Poco claro</b>: se distribuye con el Stable32 comercial (Hamilton Technical Services); NIST SP { "1065" } es de dominio público pero no imprime los valores

# text
# c1: scripts/fetch_phasedat.sh
seg-332b36d2b91f = <c1/>; se incorporan las escalas derivadas

# text
seg-dd2ee7a9f1fa = Captura de jamming/spoofing GNSS de JammerTest { "2024" } ({ "1.4" } GB)

# text
seg-20065daf2305 = calibración de escenarios de resiliencia/anomalías

# text
seg-a4410133d410 = GPL-3.0-or-later (la GNU General Public License; Zenodo 10.5281/zenodo.15910563): la redistribución está permitida, pero <b>el tamaño supera el límite de { "100" } MB por archivo de GitHub</b> y el copyleft de la GPL entra en conflicto con el árbol AGPL (Affero General Public License)

# text
seg-d4c7d2f9ea0d = <b>Condicionado a la descarga</b>; se cita el DOI (identificador de objeto digital)

# text
seg-c0e39f83efcd = El estado de licencia de cada conjunto de datos condicionado a la descarga se investigó frente a la autoridad de origen; los dos conjuntos de datos de reloj «poco claros» siguen condicionados a la espera de una cesión explícita de redistribución (ya incorporamos los valores que <em>sí</em> tenemos licencia para publicar), y el conjunto JammerTest se condiciona por razones de tamaño y de copyleft pese a su licencia abierta.

# text
seg-e104e19931d4 = { "7" }. Dominios más recientes: de dónde proceden sus parámetros

# text
# c1: VERIFICATION-MATRIX.md
seg-c11f7c73d10b = Los tipos de escenario añadidos desde las tablas anteriores mantienen la misma regla. Cada fila nombra la fuente y el estado en la matriz de verificación de la capacidad construida sobre ella (<a1><c1/></a1> tiene la fila completa).

# text
# c1: telecom-timing
seg-5d2c25dd2ff3 = Temporización de telecomunicaciones (<c1/>)

# text
seg-c2ae6b1fe666 = máscaras de sincronización

# text
# c1: TELECOM-TIMING.md
seg-e247606fe749 = Recomendaciones del UIT-T (Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones), con cada límite y su tabla o cláusula, enumerados en <a1><c1/></a1>

# text
seg-1150ab344107 = MODELLED (transcripción)

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-01d31590ca44 = preajustes de osciladores <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: TELECOM-TIMING.md
seg-9a4c0c214c54 = cuatro hojas de datos de Microchip, con los números de documento en <a1><c1/></a1>

# text
seg-a03ea8950ab0 = Estimadores MTIE (error máximo de intervalo de tiempo) y TDEV (desviación de tiempo)

# text
# c1: tests/fixtures/telecom_timing/
seg-389e18e1a900 = allantools { "2024.06" } sobre <c1/>

# text
# c1: solar-system
# c2: body-pnt
seg-29edfc0f6a6d = Sistema solar (<c1/>, <c2/>)

# text
seg-df22756e5209 = posiciones planetarias a partir de los elementos keplerianos de Standish del JPL (Jet Propulsion Laboratory)

# text
# c1: tests/fixtures/solar_system/
seg-194e3a13d51a = comprobado frente a los vectores de estado de JPL Horizons DE441 (Development Ephemeris { "441" }) en <c1/>

# text
seg-6d23934b3cb7 = VALIDATED; Urano, Neptuno, Plutón y las lunas MODELLED

# text
seg-a2624ce2e89a = parámetros gravitacionales, radios y rotación de cada cuerpo

# text
seg-4d501821b508 = registros de cuerpos de JPL Horizons y la tabla de parámetros físicos de satélites del JPL

# text
# c1: constellation-design
seg-f2715a76f0ec = Diseño de constelaciones (<c1/>)

# text
seg-784e471cdada = posiciones nominales de GPS, Galileo y GLONASS

# text
seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5.ª edición

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
seg-b5e3dc8605b1 = PNT en LEO (órbita terrestre baja) (<c1/>, <c2/>, <c3/>)

# text
seg-0a535468ad51 = preajustes de sistemas con nombre

# text
seg-aae7fe16f69a = las cifras públicas citadas, cada preajuste con su fuente

# text
# c1: leo-navmsg
seg-a72c37136e3a = Mensaje de navegación LEO (<c1/>)

# text
seg-ac50550a250f = ponderaciones del error de distancia de la señal en el espacio

# text
seg-5dae296d5484 = Montenbruck, Steigenberger y Hauschild ({ "2018" }), <em>Advances in Space Research</em>

# text
seg-9148986e8610 = modelo de efemérides de 22 parámetros

# text
seg-5b82ad0bd2c9 = Liu et al. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

# text
seg-2080b4fc31a8 = Pie de procedencia del gráfico

# text
# c1: *.chart.svg
# c2: *.report.html
seg-22d0b06d5df4 = Todo gráfico que Kshana genera (en el entorno de pruebas del navegador, en la exportación <c1/> de la CLI (interfaz de línea de comandos) y en el gráfico del informe imprimible <c2/> (HTML, HyperText Markup Language)) lleva estampado, abajo a la derecha:

# text
# c1: scenario <hash>
# c2: scenario_hash
# c3: scenario_hash
seg-d8b4de856202 = <c1/> son los primeros { "12" } caracteres hexadecimales del <b>hash del escenario</b> de la ejecución: un SHA-256 (SHA: Secure Hash Algorithm) de la definición <em>canónica</em> del escenario (semilla, umbrales, parámetros del modelo, ventanas GNSS, etc.). Es la misma huella que aparece en el resumen de una línea de la ejecución y en el campo <c2/> del JSON del resultado. (Los tipos de escenario cuyo documento de resultado no incluye <c3/>, como los informes de integridad y lunares, recurren a un SHA-256 del TOML (Tom's Obvious, Minimal Language) fuente del escenario, de modo que todo gráfico conserva una huella estable.)

# text
seg-8d218131da01 = Como el hash es determinista y sensible a la entrada, una imagen de gráfico guardada o pegada se identifica por sí misma: registra la versión del motor, el escenario exacto que la produjo (para su reproducción bit a bit) y la fuente; y cualquier parámetro alterado produce un hash distinto, de modo que un gráfico mal etiquetado se puede detectar.

# text
seg-89c9b001868f = Cómo citar y reproducir

# text
# c1: scenario + seed + engine version
# c2: CITATION.cff
# c3: provenance
seg-6eca19b7978c = Todo resultado es reproducible a partir de <c1/>. Cite el motor mediante <a1><c2/></a1> / el DOI de concepto de Zenodo <a2>10.5281/zenodo.20528627</a2>, y cite las fuentes de los <em>parámetros</em> indicadas arriba para las cifras de las que depende una ejecución determinada; viajan en los campos <c3/> del JSON del resultado, de modo que un resultado publicado se documenta a sí mismo.

# text
seg-c5c58ef3771c = Cuando una cifra es un objetivo espacial sobre hardware de tierra (toda cifra de reloj óptico de estroncio) o una demostración de laboratorio en tierra (acelerómetro de átomos fríos), este documento y la procedencia del resultado lo indican de forma explícita. Kshana no presenta cifras de laboratorio ni cifras objetivo como rendimiento en vuelo.

# text
seg-925d456df88c = <s1>Anterior</s1>Afirmaciones frente a la realidad

# text
seg-19e8fefd1ceb = <s1>Siguiente</s1>Reproducibilidad
