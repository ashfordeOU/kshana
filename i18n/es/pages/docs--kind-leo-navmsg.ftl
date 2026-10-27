# docs--kind-leo-navmsg: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/leo-navmsg.md
seg-648c27220789 = Fuente: <c1/>

# text
# c1: leo-navmsg
seg-087287602b47 = <c1/> (tipo de escenario)

# text
seg-49964654d5f4 = Tipo de escenario del motor v{ $version }, familia <a1>Navegación en órbita terrestre baja</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-867f3e41b5ab = Mensaje de navegación LEO: las efemérides y el reloj difundidos de un satélite de posicionamiento, navegación y temporización (PNT) de órbita terrestre baja (LEO), para cualquier órbita, portadora y modelo, con preajustes con nombre opcionales (Xona Pulsar, Iridium, Starlink, CentiSpace, un sistema representativo de banda C, el modelo de reloj cero ATOMIC, Celeste IOD). CONTENIDO: datos auxiliares (SVID, número de edición de datos, banda, salud de la señal), sincronización (semana, tiempo de la semana, un polinomio de reloj de segundo orden af0-af2 en torno a toc), efemérides en uno de cuatro modelos: el conjunto kepleriano de 16 parámetros del ICD SIS de Galileo OS; ese conjunto más polinomios de corrección a lo largo de la traza, transversal y radial; el modelo de 22 parámetros de Liu et al. { "2025" }; un polinomio ECEF sin términos de reloj (ATOMIC de reloj cero), y otros servicios (un conjunto de difusión Klobuchar, ai0-ai2 de NeQuick-G con el nivel de ionización efectivo, y parámetros de tiempo de sistema a UTC con la lógica de segundos intercalares del ICD). AJUSTADOR: una órbita de referencia integrada con gravedad zonal J2-J6 o EGM2008 hasta el grado elegido y con arrastre, y un reloj libre o gobernado con semilla; ajuste de Levenberg-Marquardt del conjunto kepleriano sobre elementos no singulares, luego polinomios de corrección por mínimos cuadrados lineales; reloj ajustado descontando el término relativista que añade el usuario. ANÁLISIS: fit-interval-trade (error de distancia en la señal en el espacio, SISRE, con pesos de promedio global para la altitud de la órbita, frente al intervalo de ajuste y el período de actualización, solo órbita y con reloj), model-comparison (cuatro modelos, número de parámetros, bits codificados, y el ajuste de Kshana a las altitudes de Liu et al. junto a las cifras publicadas), midpass-update (el paso más alto sobre un usuario, el salto de posición, de reloj y de distancia de usuario de cada cambio de mensaje, el salto de peor geometría, PASS/FAIL frente a un umbral de continuidad), encode-decode (la propia trama binaria documentada de Kshana con CRC-24Q, un presupuesto de cuantización de medio paso por campo, una comprobación de trama corrupta, una exportación e importación de registro de estilo RINEX-4 etiquetada como extensión de Kshana, y una tabla CSV). VALIDATED: los pesos de SISRE frente a la tabla MEO/GEO publicada (Montenbruck et al. { "2018" }); el algoritmo de usuario de Galileo frente a RTKLIB sobre efemérides difundidas reales de Galileo; el CRC-24Q frente a su valor de comprobación del catálogo y la trama de ejemplo RTCM { "1005" }. MODELLED: toda cifra de ajuste y de SISRE es error de representación frente a una referencia integrada por Kshana (sin error de determinación ni de predicción de órbita); la comparación con Liu et al. usa órbitas distintas; los formatos de codificación y de texto son propios de Kshana.

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-e5a4f0290e9e = Una ejecución de <c1/> se resume así: mensaje de navegación LEO — { "510" } km, { "97.4" } deg, grado de gravedad { "20" }, modelo kepler-rac pesos SISRE: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (máscara { "0" } deg) encode-decode: modelo kepler-rac, trama { "152" } bytes ({ "1156" } bits de carga útil, { "891" } bits de efemérides+reloj), CRC-24Q 0x58ADF2 cuantización: mayor cambio de posición { "0.52" } mm, reloj { "0.09" } mm; SISRE exacto { "0.0013" } m, cuantizado { "0.0013" } m trama corrupta rechazada: true; ida y vuelta RINEX { "4.43e-6" } m; ida y vuelta CSV { "0.00e0" } m fit-interval trade sobre { "1800" } s (período de uso = intervalo de ajuste): kepler16 { "60" } s SISRE órbita RMS { "0.0003" } m máx. { "0.0015" } m con reloj RMS { "0.0006" } m kepler16 { "120" } s SISRE órbita RMS { "0.0003" } m máx. { "0.0015" } m con reloj RMS { "0.0007" } m kepler16 { "300" } s SISRE órbita RMS { "0.0036" } m máx. { "0.0141" } m con reloj RMS { "0.0037" } m kepler16 { "600" } s SISRE órbita RMS { "0.0293" } m máx. { "0.1023" } m con reloj RMS { "0.0293" } m kepler16 { "900" } s SISRE órbita RMS { "0.1073" } m máx. { "0.3812" } m con reloj RMS { "0.1075" } m kepler-rac { "60" } s SISRE órbita RMS { "0.0000" } m máx. { "0.0000" } m con reloj RMS { "0.0005" } m kepler-rac { "120" } s SISRE órbita RMS { "0.0001" } m máx. { "0.0002" } m con reloj RMS { "0.0007" } m kepler-rac { "300" } s SISRE órbita RMS { "0.0005" } m máx. { "0.0021" } m con reloj RMS { "0.0012" } m kepler-rac { "600" } s SISRE órbita RMS { "0.0097" } m máx. { "0.0395" } m con reloj RMS { "0.0096" } m kepler-rac { "900" } s SISRE órbita RMS { "0.0388" } m máx. { "0.1143" } m con reloj RMS { "0.0390" } m El conjunto kepleriano de 16 parámetros se degrada de { "0.0003" } m a { "60" } s a { "0.1073" } m a { "900" } s: un único conjunto kepleriano con armónicos dos veces por revolución no puede seguir los términos de gravedad de mayor frecuencia ni el arrastre de un arco LEO durante más de unos pocos minutos, y su residuo de mínimos cuadrados oscila a lo largo de la ventana. Los polinomios a lo largo de la traza/transversal/radial, de grado superior al que abarca el conjunto kepleriano, absorben lo que queda, y dan { "0.0388" } m a { "900" } s.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-3f299f6b20c8 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-3adfcd7e275c = El ejemplo <c1/> establece, entre otros:

# text
seg-8243db187e2f = [encode-decode, fit-interval-trade]

# text
seg-e866d042aab8 = Mensaje Celeste IOD (preajuste de taller)

# text
seg-c42f5a1ed964 = [kepler16, kepler-rac]

# text
seg-549a6103e711 = bit

# text
seg-fb689f03361c = byte

# text
seg-c60901596100 = Etiqueta de resultado (la del motor): MIXED — bloques constructivos VALIDATED, resultados MODELLED. Los pesos de SISRE reproducen la tabla MEO/GEO publicada (Montenbruck et al. { "2018" }), el algoritmo de usuario del ICD de Galileo reproduce RTKLIB sobre efemérides difundidas reales de Galileo, y el CRC-24Q reproduce su valor de comprobación del catálogo y la trama de ejemplo RTCM { "1005" }

# attr:alt
seg-35e92abc6a23 = El gráfico que el motor escribe para scenarios/leo-navmsg-celeste-iod.toml, tipo de escenario leo-navmsg

# text
seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: el peso radial w_R y el peso transversal al cuadrado w_AC^{ "2" } como promedios de cos^{ "2" } y la mitad de sin^{ "2" } del ángulo de nadir de la línea de visión sobre usuarios distribuidos uniformemente en el casquete visible de la Tierra por encima de una elevati

# text
seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: la evaluación kepleriana del ICD SIS de Galileo OS (ecuación de Kepler, correcciones de segundo armónico, nodo fijo en la Tierra) escrita aparte del evaluador RINEX del motor, que devuelve la posición con el argumen Pruebas: <a1>leo_navmsg_reference.rs</a1>.

# text
seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: polinomio generador 0x1864CFB, valor inicial { "0" }, sin reflexión, sin XOR final, la comprobación que la trama LEO de Kshana lleva sobre cada byte precedente

# text
# c1: leo-navmsg
seg-2b24c2669c23 = <b>VALIDATED</b> El ajustador y el estudio comparativo del tipo de escenario <c1/>: una órbita de referencia integrada con gravedad zonal J2-J6 o EGM2008 hasta el grado elegido y con arrastre, y un reloj libre o gobernado con semilla; un ajuste de Levenberg-Marquardt del conjunto kepleriano de Galileo sobre no singulares

# text
seg-ddb27b07b9af = y { "7" } más en la matriz.

# text
seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: el peso radial w_R y el peso transversal al cuadrado w_AC^{ "2" } como promedios de cos^{ "2" } y la mitad de sin^{ "2" } del nadir de la línea de visión . Referencia independiente (ExternalDataset): La tabla publicada de factores de ponderación de SISRE de Montenbruck, Steigenberger y Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } y 1/49, GLONASS { "0.98" } y 1/45, Galileo { "0.98" } y 1/61, BeiDou MEO { "0.98" } y 1/54, BeiDou IGSO/GEO { "0.99" } y 1/126. El mismo promedio evaluado a radios LEO da el

# text
seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: la evaluación kepleriana del ICD SIS de Galileo OS (ecuación de Kepler, correcciones de segundo armónico, nodo fijo en la Tierra) escrita apar. Referencia independiente (ExternalDataset): Posiciones ECEF de eph2pos de RTKLIB 2.4.2-p13 (una implementación independiente del mismo algoritmo del ICD) para registros de difusión reales de BKG/IGS del 2024-09-10, ambos incluidos con su procedencia en tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Esto valida el algoritmo de usuario kepleriano; las correcciones a lo largo de la traza/transversal/radial añadidas encima están cubiertas por sus propias filas, y los términos de Liu b

# text
seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: polinomio generador 0x1864CFB, valor inicial { "0" }, sin reflexión, sin XOR final, la comprobación que la trama LEO de Kshana lleva sobre cada prece. Referencia independiente (ExternalDataset): El valor de comprobación del catálogo de CRC para estos parámetros (catálogo de CRC de reveng.sourceforge.io, CRC-24/LTE-A: ancho { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), que son los parámetros CRC-24Q de RTCM { "10403" } y del ICD SIS de Galileo OS, y la trama de ejemplo del tipo de mensaje { "1005" } impresa en RTCM { "10403" }

# text
# c1: leo-navmsg
seg-6e2719a28884 = <b>VALIDATED</b> El ajustador y el estudio comparativo del tipo de escenario <c1/>: una órbita de referencia integrada con gravedad zonal J2-J6 o EGM2008 hasta el grado elegido y con arrastre, y un reloj libre o gobernado con semilla. Referencia independiente (ExternalDataset): Órbitas científicas precisas reales como referencia (órbitas operativas de dinámica reducida de TU Graz IfG/ITSG, de uso libre con reconocimiento; valores SHA-256 en el NOTICE del fixture) ajustadas con el conjunto de 16 parámetros sobre arcos de { "20" } y { "30" } min, frente a las estadísticas que Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publican para los mismos satélites y días: RMS a lo largo de la traza, transversal y radial cada uno dentro de 1.5x (medido { "0.804" } a { "1.087" }), SISR

# text
# c1: limitations[0]
seg-0c26ec09bf16 = El SISRE es el error de representación del mensaje frente a la referencia a la que se ajustó; el error de determinación y de predicción de órbita no se modelan. (resultado <c1/>)

# text
# c1: limitations[1]
seg-3762de39de07 = La órbita de referencia es una integración numérica de Kshana (gravedad zonal o EGM2008, arrastre exponencial estático), no la órbita precisa de un satélite real; sin tercer cuerpo, presión de radiación solar ni mareas. (resultado <c1/>)

# text
# c1: limitations[2]
seg-4486dd350b57 = El formato binario es una codificación documentada propia de Kshana, modelada sobre los componentes de mensaje publicados; no es la disposición de bits de Celeste ni de ningún otro sistema (ninguna es pública). (resultado <c1/>)

# text
# c1: limitations[3]
seg-2a5c1bce8320 = El bloque de estilo RINEX es una extensión documentada de Kshana; RINEX { "4.02" } no define registros de navegación LEO. (resultado <c1/>)

# text
# c1: limitations[4]
seg-642d8f4d60e7 = Los coeficientes de NeQuick-G se transportan y se calcula el nivel de ionización efectivo, pero no está implementada la integración de densidad electrónica de NeQuick que lo convierte en un retardo; el retardo de Klobuchar sí lo está, escalado a la portadora por 1/f^{ "2" } sin corrección para un satélite que vuela dentro de la ionosfera. (resultado <c1/>)

# text
# c1: limitations[5]
seg-8ba04a3147bd = Los términos de 22 parámetros de Liu et al. { "2025" } siguen el algoritmo de usuario del artículo (Ec. 1-7) y su estrategia de ajuste (Sección { "2.3" }); sus cifras de SISRE frente a altitud usaron órbitas precisas reales, por lo que esta comparación sobre una órbita integrada por Kshana es MODELLED, no VALIDATED (la comparación con órbita real es tests/leo_navmsg_fit_real_orbit_oracle.rs). (resultado <c1/>)

# text
# c1: label
seg-b3585c7feb4e = MIXED — bloques constructivos VALIDATED, resultados MODELLED. Los pesos de SISRE reproducen la tabla MEO/GEO publicada (Montenbruck et al. { "2018" }), el algoritmo de usuario del ICD de Galileo reproduce RTKLIB sobre efemérides difundidas reales de Galileo, y el CRC-24Q reproduce su valor de comprobación del catálogo y la trama de ejemplo RTCM { "1005" }. Toda cifra de ajuste, de SISRE, de continuidad y de cuantización es MODELLED: el error de representación de un mensaje frente a una (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-d6e412aab1b4 = MODELLED: toda cifra de ajuste y de SISRE es error de representación frente a una referencia integrada por Kshana (sin error de determinación ni de predicción de órbita); el de Liu et al. (catálogo de tipos de escenario (<c1/>))

# text
seg-c5478f572d21 = Página de familia: <a1>Navegación en órbita terrestre baja</a1>

# text
seg-d9257241d523 = Página temática: <a1>LEO-NAVMSG.md</a1>

# text
seg-b0dcad22aed6 = <s1>Anterior</s1>launch-window

# text
seg-2984c4c69850 = <s1>Siguiente</s1>leo-pass
