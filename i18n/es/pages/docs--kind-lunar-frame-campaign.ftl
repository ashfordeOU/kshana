# docs--kind-lunar-frame-campaign: translations (es)

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-3319b18ac61f = y { "1" } más en la matriz.

# text
# c1: docs/kinds/by-kind/lunar-frame-campaign.md
seg-dd57b833cb20 = Fuente: <c1/>

# text
# c1: lunar-frame-campaign
seg-120769aba2cc = <c1/> (tipo de escenario)

# text
seg-55679aff66db = Datum de marco de siete parámetros de Helmert (similitud) obtenido de una CAMPAÑA DE OBSERVACIÓN SIMULADA y no de una transformación inyectada. Una red de estaciones terrestres observa un catálogo de balizas de la superficie lunar según un calendario explícito; las parciales del retardo de VLBI lunar se acumulan sobre ese calendario en una matriz de información de Fisher de las coordenadas de las balizas exactamente como hace lunar-vlbi-fim; y esa información se propaga a través del diseño de Helmert A = [I3 | [p]_x | p] en los puntos del catálogo hasta la covarianza del datum H = A^T M_b A, diagnosticada por crate::fim::crlb. NO se inyecta ninguna transformación y no se recupera nada de una respuesta plantada, de modo que la precisión del datum informada se deriva del programa de observación: reducir a la mitad la sigma del retardo la reduce exactamente a la mitad, y alargar el arco la mejora porque la libración que el informe MIDE (sub_earth_direction_sweep_deg) es lo que separa la coordenada de la baliza en la línea de visión de las del plano del cielo. El rango, el defecto de datum, el número de condición, el espectro completo, las direcciones inobservables EN LA BASE DE SIETE PARÁMETROS, la dirección más débil incluso con rango completo y la parte de ella que corresponde a cada parámetro se emiten en cada ejecución; un parámetro que la campaña no restringe se publica como NULL con un estado, nunca leído de una inversa casi singular. La correlación del error de las balizas se mide, no se supone: con las estaciones fijas ninguna observación toca dos balizas, de modo que la matriz de información es exactamente diagonal por bloques (offblock_fraction { "0" }), y con las estaciones estimadas el bloque marginalizado por Schur está acoplado, con la correlación inducida impresa y toda la propagación repetida descartándola, de modo que el precio de una suposición de independencia es un número. La misma propagación con una sigma isótropa por coordenada, y el error de recuperación que informa el escenario lunar-frame-realisation, se ejecutan ambos aquí y se imprimen junto al valor de la campaña con sus razones. MODELLED: el catálogo de balizas tiene fuente pero la CAMPAÑA es simulada: la red de estaciones y la sigma del retardo son entradas ilustrativas, las observaciones de retardo individuales se tratan como independientes, y las efemérides del centro de la Luna, los relojes de las estaciones, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS, de modo que la covarianza del datum es una cota de Cramer-Rao para un conjunto reducido de parámetros. No es un producto geodésico.

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-2e02c1ff8f48 = Una ejecución de <c1/> se resume así: lunar-frame-campaign | { "4" } balizas x { "3" } líneas base x { "49" } épocas = { "64" } obs (sigma de retardo { "1.000e-11" } s) | datum de estaciones fijo | rango de Helmert 7/7 cond { "3.798e5" } | sigma de traslación del datum { "6.397500" } m frente a error de recuperación de transformación inyectada { "0.3125" } m (razón { "0.049" })

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-9c5feacf15ce = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-1d70a5b4a197 = El ejemplo <c1/> establece, entre otros:

# text
seg-df90e5910fb4 = h

# text
seg-d9523213de9f = Etiqueta de resultado (la del motor): datum de marco lunar MODELLED dirigido por campaña. La covarianza de Helmert de siete parámetros se propaga a partir de una matriz de información de coordenadas de balizas acumulada de las propias parciales de retardo de VLBI lunar del motor sobre un calendario explícito de balizas, líneas base y épocas; NO se inyecta ninguna transformación de similitud y

# attr:alt
seg-883d94b321b4 = El gráfico que el motor escribe para scenarios/lunar-frame-campaign.toml, tipo de escenario lunar-frame-campaign

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-2595bd629ffb = <b>MODELLED</b> El datum de Helmert de siete parámetros propagado a partir de una CAMPAÑA DE OBSERVACIÓN SIMULADA en lugar de recuperado de una transformación inyectada.

# text
seg-fd34d760edb1 = <b>VALIDATED</b> La covarianza del datum de Helmert de siete parámetros, con sus dos entradas simuladas sustituidas por medidas: el calendario son las épocas de transmisión desde tierra de { "337" } puntos normales archivados de telemetría láser lunar de ILRS (2015-04-08 a 2015-06-27, Grasse MeO { "7" } Pruebas: <a1>lunar_llr_real_data.rs</a1>.

# text
seg-055864084843 = <b>MODELLED</b> Las entradas opcionales extra_reflectors y extra_beacons del escenario lunar-llr-datum añaden un bloque station_geodesy: la información de Helmert de cinco matrices del fragmento archivado de telemetría láser lunar más la información de un retrorreflector añadido (ran Pruebas: <a1>lunar_station_geodesy.rs</a1>.

# text
seg-23bd763c32d8 = <b>VALIDATED</b> La covarianza del datum de Helmert de siete parámetros del escenario lunar-frame-campaign con las estaciones terrestres estimadas (estación { "1" } anclada), tal como la calcula lunar_frame_campaign en binary64: la información de Fisher conjunta de estaciones y balizas acum Pruebas: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

# text
seg-49f323360dc3 = <b>VALIDATED</b> Ajuste del datum de Helmert de 7 parámetros + enlace de orientación ICRF a partir de una red de puntos. Referencia independiente (ExternalDataset): Resolutor independiente de transformación de similitud de Umeyama (Horn) ponderado de forma cerrada (basado en SVD de numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A): un algoritmo distinto del ajuste iterativo de Gauss–Newton de kshana, que alcanza el mismo óptimo de mínimos cuadrados ponderados unívocamente definido sobre redes de puntos idénticas byte a byte

# text
seg-d024abcfd87c = <b>MODELLED</b> El datum de Helmert de siete parámetros propagado a partir de una CAMPAÑA DE OBSERVACIÓN SIMULADA en lugar de recuperado de una transformación inyectada. Las estaciones terrestres observan una fuente. Referencia independiente (ReferenceImpl): Identidades de forma cerrada y una vía independiente dentro del repositorio, sin que se reclame ninguna referencia independiente externa. El diseño de Helmert, la única derivada nueva del módulo, se vuelve a derivar por diferencia finita central de lunar_frame_realise::apply_helmert, una vía que no comparte ninguna expresión con la forma analítica. La acumulación que compone es la de lunar-vlbi-fim, cuyo jacobiano se calcula por diferencias finitas frente a lunar_vlbi::vlbi_delay_s allí, y cuya

# text
# c1: label
seg-0abd7b181f21 = Datum de marco lunar MODELLED dirigido por campaña. La covarianza de Helmert de siete parámetros se propaga a partir de una matriz de información de coordenadas de balizas acumulada de las propias parciales de retardo de VLBI lunar del motor sobre un calendario explícito de balizas, líneas base y épocas; NO se inyecta ninguna transformación de similitud y no se recupera nada de una respuesta plantada. El catálogo de balizas es la tabla de sitios con nombre y fuente del crate, pero la CAMPA (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f92d22c06cd5 = La correlación del error de las balizas se mide, no se supone: con las estaciones fijas ninguna observación toca dos balizas, de modo que la matriz de información es exactamente diagonal por bloques (offblock_fraction { "0" }), y con las estaciones estimadas el bloque marginalizado por Schur está acoplado, con la correlación inducida impresa y toda la propagación repetida descartándola, de modo que el precio de una suposición de independencia es un número. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-534cea416496 = MODELLED: el catálogo de balizas tiene fuente pero la CAMPAÑA es simulada: la red de estaciones y la sigma del retardo son entradas ilustrativas, las observaciones de retardo individuales se tratan como independientes, y las efemérides del centro de la Luna, los relojes de las estaciones, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS, de modo que la covarianza del datum es una cota de Cramer-Rao para un conjunto reducido de parámetros. (catálogo de tipos de escenario (<c1/>))

# text
seg-ec67b9d3adbb = La correlación del error de las balizas se MIDE, no se supone. Con las estaciones fijas ninguna observación toca dos balizas, de modo que la matriz de información es exactamente diagonal por bloques (offblock_fraction { "0" }); con las estaciones estimadas el bloque marginalizado por Schur está acoplado, se imprime la correlación inducida y toda la propagación se repite descartándola, de modo que el precio de una suposición de independencia es un número y no una c (comentario del archivo de escenario, líneas { "17" } a { "21" })

# text
seg-a2bb557da7ba = MODELLED: el catálogo de balizas tiene fuente pero la CAMPAÑA es simulada: la red de estaciones y la sigma del retardo son entradas ilustrativas, las observaciones de retardo individuales se tratan como independientes, y las efemérides del centro de la Luna, los relojes de las estaciones, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS. No es un producto geodésico. (comentario del archivo de escenario, líneas { "27" } a { "30" })

# text
seg-57a371bca2c7 = El datum de marco lunar a partir de una campaña de observación es MODELLED, no validado: se comprueba frente a una implementación independiente de esta misma base de código, independiente de la unidad bajo prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-7b56c979b2c9 = <s1>Anterior</s1>lunar-differential-pnt

# text
seg-70072dbfa305 = <s1>Siguiente</s1>lunar-frame-realisation
