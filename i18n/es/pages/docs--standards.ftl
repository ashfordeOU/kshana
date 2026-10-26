# docs--standards: translations (es)

# text
seg-4a2ce9f33ab2 = escritura

# text
seg-9120d3e96e5e = lectura

# text
seg-5ad814c7ef9e = Notas

# text
seg-aab745a65e76 = Módulo

# text
seg-bf09433a7342 = GeoJSON

# text
seg-906440b861cd = Trama

# text
seg-32b620b3574e = Uso

# text
seg-8ba331635865 = Normas e interoperabilidad

# text
# c1: docs/STANDARDS.md
seg-96a449a63d11 = Fuente: <c1/>

# text
seg-3ed65a16e7d0 = Kshana habla los formatos de intercambio estándar de las comunidades de GNSS (sistema global de navegación por satélite), dinámica de vuelo y temporización, de modo que puede convivir con RTKLIB (una biblioteca de código abierto de posicionamiento cinemático en tiempo real), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit y las herramientas de los centros de análisis del IGS (Servicio Internacional de GNSS) en lugar de en una isla privada. Esta página asocia los <b>formatos de intercambio</b> que el motor analiza o emite con el módulo que implementa cada uno y con la especificación de referencia.

# text
# c1: VERIFICATION-MATRIX.md
seg-d1aa512ad4ee = Se limita a los formatos, es decir, a lo que tiene una dirección de lectura o escritura. Las normas de señal y de algoritmo que el motor <em>implementa</em> en lugar de analizar (IS-GPS-200 (IS: Interface Specification; GPS: Sistema de Posicionamiento Global), IEEE (Instituto de Ingenieros Eléctricos y Electrónicos) { "1139" }, RTCA (antes Comisión Técnica Radioaeronáutica) DO-229E, IGRF-14 (IGRF: Campo Geomagnético Internacional de Referencia), la referencia WG-C (WG: Grupo de Trabajo) de ARAIM (monitorización autónoma avanzada de la integridad por el receptor), CCSDS (Comité Consultivo para Sistemas de Datos Espaciales) 401/DSN (DSN: Red de Espacio Profundo)) se evidencian fila a fila en <a1><c1/></a1>.

# text
seg-656920618fb7 = Formatos que habla el motor

# text
seg-4fe4920a3fa1 = Norma

# text
seg-d08f1943c53b = Dirección

# text
seg-968a1d48364c = Especificación / autoridad

# text
seg-304ffba9669f = <b>CCSDS OEM</b> (Mensaje de Efemérides Orbitales)

# text
seg-68d762928f76 = lectura <b>y</b> escritura

# text
seg-eea6e5c8c220 = CCSDS 502.0-B Mensajes de Datos Orbitales, forma KVN (notación clave-valor)

# text
# c1: parse_oem
# c2: tests/ccsds_reference.rs
# c3: COVARIANCE_START … COVARIANCE_STOP
# c4: COV_REF_FRAME
# c5: covariance_block_kvn
# c6: parse_covariance_block
# c7: src/oem.rs
seg-be700901c03e = Efemérides tabuladas de vectores de estado que ingieren GMAT, Orekit y STK (Systems Tool Kit). <c1/> las lee de vuelta; <b>validado recuperando el ejemplo literal de la Figura G-11 del Libro Azul CCSDS 502.0-B-3</b> (<a1><c2/></a1>). El <b>bloque de covarianza</b> opcional de posición/velocidad de { "6" }×{ "6" } (<c3/>, la serialización KVN del triángulo inferior de 21 elementos con un <c4/> opcional) se escribe (<c5/>) y se lee (<c6/>), con simetría de ida y vuelta (pruebas de <a2><c7/></a2>).

# text
seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Mensaje de Elementos Medios Orbitales)

# text
seg-8e9f975d443b = CCSDS 502.0-B-2, forma KVN

# text
# c1: orbit
# c2: --export-omm <out.omm>
# c3: export_omm = true
# c4: tests/sp3_export_roundtrip.rs
seg-fb5218415d68 = Publicación en vía de normalización de los elementos medios de SGP4/TLE (SGP4: Perturbaciones Generales Simplificadas { "4" }; TLE: conjunto de elementos de dos líneas) (movimiento medio, e, i, Ω, ω, M, BSTAR (el término de arrastre del propagador de órbitas)). Accesible desde la CLI (CLI: interfaz de línea de comandos) en un escenario <c1/> mediante <c2/> o <c3/> (un OMM por satélite definido por TLE, con su identificador NORAD (Mando de Defensa Aeroespacial de Norteamérica) real, designador COSPAR (Comité de Investigación Espacial) y época; <a1><c4/></a1>). La forma XML (lenguaje de marcado extensible) y un lector son trabajos posteriores.

# text
seg-08425c4b2093 = <b>CCSDS TDM</b> (Mensaje de Datos de Seguimiento)

# text
seg-bf870037a77d = CCSDS 503.0-B Mensaje de Datos de Seguimiento, forma KVN

# text
# c1: tests/ccsds_reference.rs
seg-cd96db42ab43 = Registros de seguimiento de distancia / Doppler / ángulo que un paso de DSN/ESTRACK (ESTRACK: red europea de seguimiento espacial) entrega a un sistema de OD (determinación de órbita). <b>Validado recuperando el ejemplo literal de la Figura E-9 del Libro Azul CCSDS 503.0-B-2</b> (<a1><c1/></a1>).

# text
seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

# text
seg-40accc5f1a67 = CCSDS 133.0-B-2 Protocolo de Paquetes Espaciales

# text
# c1: spacepackets-py
# c2: src/space_packet.rs
seg-ed9c8bdddd6d = El encabezado primario TM/TC (TM: telemetría; TC: telecomando) de 6 octetos que intercambian los sistemas terrestres. <b>El codificador reproduce los vectores de prueba publicados, a nivel de byte, de la biblioteca independiente <c1/></b> (pruebas de <a1><c2/></a1>).

# text
seg-aa942198bb2e = <b>SP3-c (SP3: Producto Estándar { "3" }, el formato de órbitas precisas) / SP3-d</b> (efemérides precisas)

# text
seg-4d4237e15ef1 = Producto Estándar { "3" } del IGS (c/d)

# text
# c1: gps-ops
# c2: tests/sp3_export_roundtrip.rs
seg-8d1089fbd59d = Serie temporal de posición fija a la Tierra (ECEF) + tiempo de reloj. Ida y vuelta validada a < { "0.5" } m en una instantánea real de <c1/> (<a1><c2/></a1>).

# text
seg-761698fcf960 = <b>RINEX (Formato de Intercambio Independiente del Receptor) { "3" }</b> (navegación por difusión)

# text
seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, ICD de Galileo (documento de control de interfaz), ICD de BeiDou, ICD de GLONASS (Sistema Mundial de Navegación por Satélite de Rusia))

# text
# c1: Propagator
seg-1b7710db3abf = Ingesta NAV multi-GNSS (GPS LNAV (mensaje de navegación heredado), Galileo F/NAV, QZSS (Sistema de Satélites Cenitales Casi Zenitales de Japón), BeiDou MEO/IGSO (MEO: órbita terrestre media; IGSO: órbita geosíncrona inclinada), vector de estado de GLONASS); utilizable como fuente de <c1/> de primera clase.

# text
seg-44991b52d1ff = <b>TLE / 3LE</b> (elementos de dos / tres líneas)

# text
seg-17769f14095d = NORAD / Celestrak, AIAA (Instituto Americano de Aeronáutica y Astronáutica) 2006-6753

# text
seg-8d4dd42edc89 = Propagado por el núcleo SGP4/SDP4 validado (SDP4: Perturbaciones Simplificadas de Espacio Profundo { "4" }) ({ "4.12" } mm frente a los { "666" } vectores oficiales de la AIAA).

# text
seg-498aac915067 = <b>RINEX 3.0x</b> (observación)

# text
seg-437d07b5aa4f = RINEX 3.0x OBS (se espera que { "4.00" } se analice, pero nunca se ha probado con un archivo { "4.00" })

# text
# c1: parse_obs
# c2: pvt
# c3: tests/pvt_abmf.rs
seg-ac97f77f142c = La otra mitad de RINEX: los registros de código/portadora/Doppler/SNR (SNR: relación señal-ruido) del propio receptor (<c1/>). Es la entrada que consume, junto con el archivo de navegación por difusión, el resolvedor de posicionamiento de punto único de <c2/> (<a1><c3/></a1>, estación real ABMF del IGS).

# text
seg-2418cd0e4d79 = <b>IONEX</b> (formato de intercambio de mapas de la IONosfera; mapas globales de TEC (contenido total de electrones))

# text
seg-bf1bb42f04c4 = IONEX { "1" }.x (producto de ionosfera del IGS)

# text
# c1: parse_ionex
seg-af9efa0df270 = <c1/> lee las mallas globales de contenido total de electrones del IGS, la alternativa <em>medida</em> a la corrección de Klobuchar por difusión, con interpolación espacial y temporal bilineal y la función de oblicuidad para pasar a retardo oblicuo.

# text
# c1: finals2000A
seg-6f0da4b59d7c = <b><c1/> / Boletín B del IERS (Servicio Internacional de Rotación de la Tierra y Sistemas de Referencia)</b> (orientación de la Tierra)

# text
# c1: finals2000A.all
seg-197dfa18ca19 = Convenciones del IERS; IERS EOP (parámetros de orientación de la Tierra) { "14" } C04 / <c1/>

# text
# c1: tests/operational_eop_predictor_reference.rs
seg-0d102d904cfe = UT1 (Tiempo Universal { "1" }, tiempo de rotación terrestre)−UTC (Tiempo Universal Coordinado) y movimiento polar del producto oficial, incluidas las filas <b>predichas</b>, de modo que la reducción de marcos pueda ejecutarse en tiempo real y presupuestarse el crecimiento de su error de predicción (<a1><c1/></a1>).

# text
seg-2a4e274838ef = <b>KIF</b> (Formato de Intercambio de Kshana)

# text
# c1: SCHEMA.md
seg-193b33461507 = este repositorio; véase <a1><c1/></a1>

# text
# c1: format
# c2: schema_version
# c3: kind
# c4: engine_version
# c5: payload
seg-33ef8d792a90 = La envoltura neutra y versionada en la que puede envolverse cualquier artefacto: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, con un veredicto explícito de compatibilidad mayor-menor para el consumidor. No es una norma externa; se documenta aquí porque una herramienta ajena tiene que reconocerla.

# text
seg-a492f437efd0 = Intercambio lunar de LunaNet / IOAG (Grupo Asesor de Operaciones Interagencias)

# text
seg-b19cf72da934 = escritura (los metadatos de tiempo también se leen)

# text
seg-d641c72a6449 = Especificación de interoperabilidad de LunaNet / arquitectura de comunicaciones lunares del IOAG, sobre CCSDS { "502.0" }

# text
# c1: export_lunar_oem
# c2: export_kif_lunar
# c3: export_lunar_time_metadata
# c4: tests/lunar_interoperability_export_reference.rs
seg-cc796afe7a72 = El marco lunar, la escala de tiempo lunar y las efemérides lunares emitidos en formas CCSDS alineadas con LunaNet/IOAG (<c1/>, <c2/>, <c3/>), con una comprobación de campos del OEM emitido (<a1><c4/></a1>).

# text
seg-5abc05382382 = <b>CZML</b> (Cesium Language)

# text
seg-da7e20d3786b = Formato de paquetes CZML de CesiumJS

# text
# c1: INERTIAL
# c2: --export czml
seg-8d3a73646be3 = Un flujo JSON (JavaScript Object Notation) de paquetes con marca de tiempo para el globo de CesiumJS; los objetos en movimiento se escriben en GCRS (<c1/>). <c2/> en cualquier tipo de escenario que sitúe objetos sobre la Tierra.

# text
seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

# text
seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

# text
# c1: --export kml
seg-57468e6d97f2 = Longitud, latitud y altura fijas a la Tierra para Google Earth y herramientas SIG (sistemas de información geográfica). <c1/>.

# text
seg-46d977015b07 = escritura <b>y</b> lectura (ruta)

# text
seg-42b8e3129e64 = IETF (Grupo de Trabajo de Ingeniería de Internet) RFC { "7946" }

# text
# c1: --export geojson
# c2: LineString
# c3: --import-route <route.geojson>
seg-425a83b44545 = Geometría fija a la Tierra para mapas web y herramientas SIG (<c1/>); un <c2/> se lee de vuelta como la entrada de trayectoria recta de los tipos que vuelan una (<c3/>).

# text
# c1: .e
# c2: EphemerisTimePosVel
seg-d9b137e11514 = <b>Efemérides de STK</b> (<c1/>, <c2/>)

# text
seg-347ee6f6c1df = Formato de archivo de efemérides de Ansys STK

# text
# c1: ICRF
# c2: --export stk
seg-45576578d357 = Posición y velocidad inerciales (<c1/>) para STK y herramientas que leen su formato de efemérides. <c2/>.

# text
seg-03fd79cce4a4 = <b>SigMF</b> (Formato de Metadatos de Señal)

# text
seg-42272f73f456 = Especificación SigMF

# text
# c1: spectrum
# c2: --export sigmf
# c3: [recording]
seg-202b559c30a6 = Grabaciones complejas en banda base más metadatos JSON: el tipo <c1/> escribe sus muestras sintetizadas en fase/cuadratura (IQ) (<c2/>) y lee una grabación mediante su bloque <c3/>.

# text
seg-60e7c8505cb5 = <b>Texto del mensaje de navegación LEO</b> (de estilo RINEX 4 y CSV (valores separados por comas))

# text
seg-f22442e0e8ea = Disposición de navegación RINEX { "4" }, adaptada

# text
# c1: leo-navmsg
seg-8338e445b3a5 = Las efemérides y el reloj de difusión del tipo <c1/> para un satélite en órbita terrestre baja (LEO), exportados y reimportados; una adaptación documentada, no un tipo de mensaje RINEX registrado (MODELLED en la matriz de verificación).

# text
seg-1b89ab4e93f7 = Marcos de referencia y tiempo

# text
# c1: src/cio.rs
# c2: src/frames.rs
# c3: src/nutation.rs
# c4: VALIDATION.md
seg-dbbd023631b6 = El marco que emite el motor es explícito, no implícito. La reducción IAU (Unión Astronómica Internacional) 2006/2000A basada en el CIO (CIO: origen intermedio celeste) (<a1><c1/></a1>) y la reducción TEME (ecuador verdadero, equinoccio medio) de equinoccio/GMST (GMST: tiempo sidéreo medio de Greenwich) (<a2><c2/></a2>, <a3><c3/></a3>) están validadas bit a bit frente a los vectores de referencia SOFA/ERFA (SOFA: Estándares de Astronomía Fundamental; ERFA: Rutinas Esenciales para Astronomía Fundamental) (véase <a4><c4/></a4>).

# text
seg-819d28bd9361 = Realización

# text
seg-69aca96b7e42 = TEME

# text
seg-ec81608934a6 = nativo de SGP4

# text
seg-7631c594fd1a = Ecuador verdadero, equinoccio medio: el marco de salida de SGP4/SDP4.

# text
seg-eeb28cc286b3 = GCRS (Sistema Celeste de Referencia Geocéntrico) / J2000

# text
seg-745285e29202 = precesión IAU { "2006" } + nutación IAU 2000A/2000B

# text
# c1: teme_to_gcrs
seg-3747add299d5 = <c1/> (cadena de equinoccio).

# text
seg-4859fd3e5864 = <b>CIRS</b> (Sistema Celeste Intermedio de Referencia)

# text
seg-1c09f22adcf2 = CIO IAU 2006/2000A (X, Y, s)

# text
seg-8891621dc302 = ITRS (Sistema Terrestre Internacional de Referencia) / ECEF

# text
seg-a28e26cd2481 = ERA (ángulo de rotación de la Tierra) + movimiento polar del IERS (CIO) o GMST + movimiento polar (equinoccio)

# text
# c1: gcrs_to_itrs_matrix
# c2: eraC2tcio
# c3: teme_to_itrf
seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (equinoccio).

# text
seg-74a4801fd685 = geodésico WGS-84 (WGS: Sistema Geodésico Mundial)

# text
seg-b58a44eaaa39 = exacto + inverso iterativo

# text
seg-4d9472dd73d3 = Escala de tiempo

# text
seg-cbe7a7ce7317 = <b>TT</b> (Tiempo Terrestre)

# text
# c1: jd_tt
seg-25191c1a4135 = Evaluación del argumento de precesión/nutación/CIO (<c1/>).

# text
# c1: jd_ut1
seg-8c478d6b4786 = Ángulo de rotación de la Tierra / GMST (<c1/>).

# text
seg-f7033ca0c13f = <b>JD en dos partes</b> (fecha juliana)

# text
# c1: Jd2
seg-64a5adeacd5b = <c1/> para una resolución de época inferior al µs.

# text
seg-210f40885a8e = Correspondencia entre campos de salida y norma (CCSDS { "502.0" })

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: --export-oem
# c3: --export-omm
seg-e9dbc25a3ee9 = Lo que los dos escritores de mensajes de órbita colocan en cada campo de los ODM de CCSDS (Mensajes de Datos Orbitales, { "502.0" }), leído de una ejecución de <c1/> con <c2/> y <c3/>:

# text
seg-d2b91c300b82 = Salida de Kshana

# text
seg-119884b009cc = Campo ODM de CCSDS

# text
seg-8b0593f67c7f = Valor / unidad

# text
seg-d33eb162d179 = Metadatos del segmento OEM

# text
# c1: EARTH
# c2: TEME
# c3: GPS
seg-4b338284e56a = <c1/> / <c2/> / <c3/>: el marco en el que integran los propagadores y la escala de tiempo de la malla de épocas, sin cambiar de etiqueta

# text
seg-e0a44af9aaf8 = Época de estado OEM

# text
seg-b0623bab9fcc = primera columna de cada línea de datos

# text
seg-410bd5a9ba14 = tiempo de calendario ISO-8601 (ISO: Organización Internacional de Normalización), escala de tiempo GPS

# text
seg-a7c95802e01a = Posición y velocidad OEM

# text
# c1: X Y Z X_DOT Y_DOT Z_DOT
seg-0539cafabf60 = columnas de datos <c1/>

# text
seg-8add7e800e0e = km, km/s

# text
seg-8b386548c03c = Metadatos OMM

# text
seg-e2c63414d7c2 = Época OMM

# text
seg-5109e5948d2a = forma ISO-8601 de día del año (la época del TLE)

# text
seg-b74289a29c24 = Elementos medios OMM

# text
seg-f3492fa95178 = rev/día, –, grados, 1/radios terrestres

# text
# c1: ephemeris
# c2: jd_utc
# c3: teme_r_m
# c4: teme_v_m_s
# c5: gcrs_r_m
# c6: gcrs_v_m_s
# c7: ecef_r_m
# c8: lat_deg
# c9: lon_deg
# c10: alt_km
seg-fc82185abe10 = El JSON (JavaScript Object Notation) de resultados del tipo <c1/> lleva el mismo estado en unidades del SI (Sistema Internacional de Unidades) por muestra: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), además de <c8/>, <c9/>, <c10/>.

# text
seg-014d1392018e = Alcance real

# text
# c1: INTEROP.md
seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF y el texto del mensaje de navegación LEO son de <b>lectura y escritura</b>; OMM, CZML, KML y las efemérides de STK son <b>escritores</b> (un lector de OMM y la serialización XML son trabajos posteriores); GeoJSON se escribe y se lee de vuelta como una ruta; RINEX NAV, RINEX OBS, IONEX, los productos EOP del IERS y TLE son <b>lectores</b>; la exportación lunar LunaNet/IOAG es un escritor cuyos metadatos de tiempo hacen el viaje de ida y vuelta. <a1><c1/></a1> enumera qué exportación se aplica a cada escenario incluido.

# text
seg-68b4f5116419 = La correspondencia de campos CCSDS/IGS anterior es documentación, no una afirmación de que se satisfaga ninguna norma; la evaluación formal frente a esas normas (y el registro en el catálogo abierto de la ESA (Agencia Espacial Europea) ESSR (Repositorio Europeo de Software Espacial) / NASA (Administración Nacional de Aeronáutica y del Espacio)) se sigue por separado y está pendiente de revisión.

# text
# c1: xval/anise-frames/
# c2: gcrs_to_itrs_matrix
# c3: VALIDATION.md
seg-e461587ad2cf = La comprobación numérica cruzada independiente de la reducción de marcos con SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, un conjunto de herramientas de geometría planetaria en Rust puro) se entrega en el crate autónomo <c1/>, excluido del espacio de trabajo: <c2/> frente a la rotación GCRF (Marco Celeste de Referencia Geocéntrico) → ITRF93 (Marco Terrestre Internacional de Referencia { "1993" }) de ANISE en ocho épocas { "2020" }–{ "2023" } concuerda a ≤ { "0.86" } m en el suelo y a ≤ { "3.6" } m en la órbita GNSS (véase <a1><c3/></a1>). Necesita núcleos SPICE, por lo que no es una puerta predeterminada de integración continua (CI).

# text
seg-f6d67027d669 = <s1>Anterior</s1>Mapa de capacidades

# text
seg-01b6270b6c6a = <s1>Siguiente</s1>Cobertura de líneas
