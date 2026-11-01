# docs--kind-lunar-llr-datum: translations (es)

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-8f8871ac8a0f = Página temática: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-fd34d760edb1 = <b>VALIDATED</b> La covarianza del datum de Helmert de siete parámetros, con sus dos entradas simuladas sustituidas por medidas: el calendario son las épocas de transmisión desde tierra de { "337" } puntos normales archivados de telemetría láser lunar de ILRS (2015-04-08 a 2015-06-27, Grasse MeO { "7" } Pruebas: <a1>lunar_llr_real_data.rs</a1>.

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# text
# c1: docs/kinds/by-kind/lunar-llr-datum.md
seg-8db575fc6d82 = Fuente: <c1/>

# text
# c1: lunar-llr-datum
seg-5329c6c75887 = <c1/> (tipo de escenario)

# text
# c1: scenarios/lunar-llr-datum.toml
seg-f4359803d67a = Una ejecución de <c1/> se resume así: lunar-llr-datum: { "337" } puntos normales archivados ({ "349" } analizados) de { "2" } estación(es) a { "5" } matrices de retrorreflectores a lo largo de { "80.9" } d; precisión mediana medida del punto normal { "5.13" } mm unidireccional; rango de información de reflectores 15/15; rango de Helmert 7/7 cond { "2.399e4" }; sigma de traslación del datum { "1.851746e-2" } m; RMS del residuo unidireccional observado menos calculado { "156493.9" } m (los enlaces modelados, principalmente las efemérides lunares analíticas)

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-7eda56c1285a = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-llr-datum.toml
seg-c95b4d285cbd = El ejemplo <c1/> establece, entre otros:

# text
seg-37a77f49f048 = ps

# text
seg-b5c1e8681164 = Etiqueta de resultado (la del motor): datum de marco lunar a partir de una campaña de observación REAL. El calendario, el número de observaciones y cada peso de observación proceden de puntos normales archivados de telemetría láser lunar de ILRS (medidos); las coordenadas de las estaciones proceden de ITRF2020 del IERS y las de los retrorreflectores de la Tabla { "7" } de JPL DE430 (publish

# attr:alt
seg-e4da113cbe18 = El gráfico que el motor escribe para scenarios/lunar-llr-datum.toml, tipo de escenario lunar-llr-datum

# text
seg-764e54be97a0 = <b>VALIDATED</b> La covarianza del datum de Helmert de siete parámetros de lunar-llr-datum a partir de puntos normales archivados de ILRS y sus pesos medidos, por la vía de núcleo: el centro geocéntrico de la Luna se lee de JPL DE440 con el propio lector de núcleos del motor (planetary_ker Pruebas: <a1>validate_llr_datum_kernel_moon.rs</a1>.

# text
seg-cae262db0e46 = <b>VALIDATED</b> La covarianza del datum de Helmert de siete parámetros, con sus dos entradas simuladas sustituidas por medidas: el calendario son las épocas de transmisión desde tierra de { "337" } archive. Referencia independiente (ExternalDataset): Identidades de forma cerrada, una vía independiente dentro del repositorio y, desde { "0.36" }, una referencia independiente de biblioteca SPICE y NumPy sobre datos medidos nuevos (más abajo); no existe ningún par publicado de covarianza de datum LLR lunar con el que contrastar, por lo que no se reclama ninguna precisión. La única derivada nueva, la parcial de la distancia respecto de la posición fija en el cuerpo del reflector, se vuelve a derivar por diferencia finita central del tiempo de luz bidireccional que di

# text
# c1: label
seg-61ac3609406a = Datum de marco lunar a partir de una campaña de observación REAL. El calendario, el número de observaciones y cada peso de observación proceden de puntos normales archivados de telemetría láser lunar de ILRS (medidos); las coordenadas de las estaciones proceden de ITRF2020 del IERS y las de los retrorreflectores de la Tabla { "7" } de JPL DE430 (publicadas). Las efemérides del centro de la Luna, la orientación del cuerpo WGCCRE de la IAU { "2015" } y la ausencia de troposfera, mareas, ecce (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-97610a2cca73 = La correlación entre matrices se MEASURED y resulta exactamente cero en lugar de suponerse, porque una distancia láser toca una sola matriz. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-64b1c08eeb11 = QUÉ ENLACES ESTÁN MEASURED Y CUÁLES ESTÁN MODELLED ES EL INFORME, NO UNA NOTA AL PIE: las efemérides del centro de la Luna y la orientación del cuerpo de la IAU siguen modeladas y su tamaño combinado se emite como el residuo de distancia unidireccional observado menos calculado sobre cada punto usado; la troposfera, las mareas del cuerpo sólido, la excentricidad de estación, el movimiento polar, UT1-UTC, el retardo relativista y los relojes de estación están ausentes y dentro de ese residuo. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-d38710f3ce4a = MODELLED: las cifras de siete parámetros son una cota de Cramer-Rao para un conjunto reducido de parámetros sobre un calendario real; no un datum resuelto, no un análisis LLR y no un producto geodésico. (catálogo de tipos de escenario (<c1/>))

# text
seg-a19e2b1fcaf1 = las épocas son los instantes de transmisión desde tierra de puntos normales archivados de ILRS Consolidated Laser Ranging Data; * las observaciones son las distancias láser realmente disparadas a las cinco matrices de retrorreflectores de la Luna; * cada peso de observación es la PROPIA precisión archivada de ese punto normal, bin_rms/sqrt(n_raw), leída del archivo y no supuesta. (comentario del archivo de escenario, líneas { "7" } a { "12" })

# text
seg-5ed6b83c01da = QUÉ ENLACES ESTÁN MEASURED Y CUÁLES ESTÁN MODELLED ES EL INFORME, NO UNA NOTA AL PIE. Las efemérides del centro de la Luna y la orientación del cuerpo de la IAU siguen modeladas, y su tamaño combinado se emite como el residuo de distancia unidireccional observado menos calculado sobre cada punto usado; la troposfera, las mareas del cuerpo sólido, la excentricidad de estación, el movimiento polar, UT1-UTC, el retardo relativista y los relojes de estación están ausentes y se encuentran dentro de ese residuo. Beca (comentario del archivo de escenario, líneas { "18" } a { "26" })

# text
seg-7e7ff3ce4971 = La correlación entre matrices se MEASURED y resulta exactamente cero en lugar de suponerse, porque una distancia láser toca una sola matriz. Un registro que los catálogos no pueden situar (una estación sin posición ITRF publicada) se OMITE Y SE CUENTA, y nunca se le da una coordenada sustituta. Las propias cifras de la campaña simulada se EJECUTAN y se imprimen junto a las medidas. (comentario del archivo de escenario, líneas { "28" } a { "31" })

# text
seg-8bfe258bedf5 = MODELLED: las cifras de siete parámetros son una cota de Cramer-Rao para un conjunto reducido de parámetros sobre un calendario real. No un datum resuelto, no un análisis LLR, no un producto geodésico. (comentario del archivo de escenario, líneas { "33" } a { "34" })

# text
seg-598a7d6ba1e7 = <s1>Anterior</s1>lunar-joint-od-clock

# text
seg-54b1c9200aae = <s1>Siguiente</s1>lunar-station-coverage

# text
seg-25455a33523c = Datum de marco lunar de Helmert de siete parámetros obtenido de una campaña de observación REAL y ARCHIVADA y no de una simulada. Mientras que lunar-frame-campaign eliminaba la transformación inyectada pero seguía declarando su red de estaciones, su calendario y su sigma por observación como entradas ILLUSTRATIVE, este tipo de escenario toma las tres de mediciones: las épocas son los instantes de transmisión desde tierra de puntos normales archivados de ILRS Consolidated Laser Ranging Data, las observaciones son las distancias láser realmente disparadas a las cinco matrices de retrorreflectores de la Luna, y cada peso de observación es la propia precisión archivada de ese punto normal, bin_rms/sqrt(n_raw), leída del archivo. Las coordenadas de las estaciones proceden de la solución SLR ITRF2020 del IERS (propagada a la época con sus velocidades publicadas) y las de los reflectores de la Tabla { "7" } de JPL DE430 en el marco de Tierra media/rotación media que realiza el modelo WGCCRE de la IAU { "2015" }. Las parciales de distancia se acumulan en la matriz de información de Fisher conjunta de coordenadas de reflectores y se propagan a través del mismo diseño de Helmert hasta la covarianza del datum, diagnosticada por crate::fim::crlb. El rango, el defecto, la condición, el espectro, las direcciones inobservables en la base de siete parámetros, la dirección más débil con rango completo y la parte de ella que corresponde a cada parámetro se emiten en cada ejecución, y un parámetro no restringido se publica como NULL con un estado. La correlación entre matrices está MEASURED en exactamente cero en lugar de suponerse, porque una distancia láser toca una sola matriz. Un registro que los catálogos no pueden situar (una estación sin posición ITRF publicada) se OMITE Y SE CUENTA, y nunca se le da una coordenada sustituta. QUÉ ENLACES ESTÁN MEASURED Y CUÁLES ESTÁN MODELLED ES EL INFORME, NO UNA NOTA AL PIE: las efemérides del centro de la Luna y la orientación del cuerpo de la IAU siguen modeladas y su tamaño combinado se emite como el residuo de distancia unidireccional observado menos calculado sobre cada punto usado; la troposfera, las mareas del cuerpo sólido, la excentricidad de estación, el movimiento polar, UT1-UTC, el retardo relativista y los relojes de estación están ausentes y dentro de ese residuo. Como un error de efemérides llega a una covarianza solo a través de la dirección de cada línea de visión, cada ejecución vuelve además a resolver todo el datum con todas las parciales inclinadas sensitivity_tilt_deg (con signo alterno) y emite la razón, de modo que la insensibilidad de la covarianza a las efemérides modeladas es un número y no un argumento. Las propias cifras de la campaña simulada se EJECUTAN y se imprimen junto a las medidas, no se transcriben. MODELLED: las cifras de siete parámetros son una cota de Cramer-Rao para un conjunto reducido de parámetros sobre un calendario real; no un datum resuelto, no un análisis LLR y no un producto geodésico. El fragmento de datos reales confirmado se distribuye con el repositorio pero no con el crate publicado; apunte data_dir a una copia de él.

seg-2053999af5ef = <s1>Siguiente</s1>lunar-orbit-rendezvous
