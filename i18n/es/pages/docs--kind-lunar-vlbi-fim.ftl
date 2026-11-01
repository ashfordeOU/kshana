# docs--kind-lunar-vlbi-fim: translations (es)

# text
seg-b054c73f22e5 = sin valor

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-3319b18ac61f = y { "1" } más en la matriz.

# text
seg-2595bd629ffb = <b>MODELLED</b> El datum de Helmert de siete parámetros propagado a partir de una CAMPAÑA DE OBSERVACIÓN SIMULADA en lugar de recuperado de una transformación inyectada.

# text
# c1: docs/kinds/by-kind/lunar-vlbi-fim.md
seg-7ecec8d27f50 = Fuente: <c1/>

# text
# c1: lunar-vlbi-fim
seg-d54e29b7bc80 = <c1/> (tipo de escenario)

# text
seg-1bc37634ba9f = Covarianza de las coordenadas de estación del VLBI lunar: las derivadas parciales del retardo de la observable lunar-vlbi acumuladas a lo largo de un CALENDARIO explícito (líneas base x épocas) en una matriz de información de Fisher, invertida e indicada como la covarianza de las coordenadas de estación y la sigma de estación por coordenada: una salida calculada por el motor, y no una precisión escalar del retardo pasada por un factor de equipartición isótropo supuesto g = { "3" }. El estado lleva coordenadas de estación FIJAS a la Tierra (ITRS), de modo que el jacobiano es la derivada parcial inercial rotada por la matriz GCRS->ITRS de cada época: la rotación terrestre es lo que hace observables esas coordenadas, y el informe MIDE el barrido de la línea de visión fija a la Tierra y la declinación de la baliza en lugar de suponerlos. Una observación es un par (línea base, época) con AMBAS estaciones por encima de la máscara de elevación, ponderado con 1/delay_sigma_s^{ "2" }. Indica rango, defecto de datum, número de condición, el espectro completo de información, la matriz de covarianza, las sigmas por estación y por eje y en 3-D, y el espacio nulo de la red libre en cada ejecución; ante una deficiencia de rango, la sigma principal se publica como NULL con un estado, nunca se lee de una inversa casi singular. El valor de equipartición c<em>delay_sigma_s</em>sqrt(g/N) para el MISMO calendario se emite junto al valor calculado con el cociente, junto con la cota isótropa de traza sqrt(p/trace(M)) que AM-HM convierte en un suelo estricto, de modo que el cociente es la anisotropía que descartaba el supuesto. El cierre del retardo tau_ik = tau_ij + tau_jk hace que solo n-1 de las n(n-1)/2 líneas base sean geométricamente independientes; el informe indica ambos recuentos. MODELLED: las efemérides del centro de la Luna, los relojes de estación, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS y las observaciones se tratan como independientes, de modo que la covarianza es una cota de Cramer-Rao para un conjunto reducido de parámetros, no un resultado de sesión predicho; la sigma del retardo, las coordenadas de estación y el calendario son entradas. La derivada parcial que el jacobiano del retardo geométrico omite (el término de Shapiro diferenciado) se mide por diferencias finitas y se emite. No es un producto geodésico.

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-4df72c1b921e = Una ejecución de <c1/> se resume así: lunar-vlbi-fim | { "3" } estaciones / { "3" } líneas base x { "49" } épocas = { "16" } obs (máscara { "10.0" } grados) | datum anchor-first-station | rango 6/6 cond { "2.209e4" } | sigma de estación { "0.0926" } m frente a equipartición g={ "3" } { "0.0013" } m (cociente { "71.360" })

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-f0dabe1b061b = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-fabf305ae1de = El ejemplo <c1/> establece, entre otros:

# text
seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

# text
seg-8b098bf1df6b = Etiqueta del resultado (la del motor): covarianza de las coordenadas de estación del VLBI lunar MODELLED. La covarianza se acumula a partir de las propias derivadas parciales analíticas del retardo del motor sobre un calendario explícito de líneas base y épocas y se invierte; NO se convierte a partir de una precisión escalar del retardo mediante un factor de geometría supuesto. La sigma del retardo por observación

# attr:alt
seg-19c383444296 = El gráfico que el motor genera para scenarios/lunar-vlbi-fim.toml, tipo de escenario lunar-vlbi-fim

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Derivadas parciales del retardo acumuladas sobre un calendario de líneas base × épocas en una matriz de información de Fisher, invertida hasta la covarianza de las coordenadas de estación y la sigma de estación por coordenada, en sustitución de un vínculo de equipartición isótropo supuesto a partir de

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Una tercera opción de datum, <c1/>, que mantiene fijas todas las estaciones terrestres y estima únicamente las coordenadas de la BALIZA fijas a la Luna: la configuración para la que realmente se cita la incertidumbre de un punto de la superficie lunar, dado que las coordenadas de las estaciones terrestres

# text
seg-811a412b40b6 = <b>VALIDATED</b> La covarianza de la baliza con todas las estaciones fijas del escenario lunar-vlbi-fim (todas las estaciones terrestres fijas, estimándose únicamente las coordenadas de la baliza fijas a la Luna) con la baliza situada sobre la Luna de JPL DE440 leída por el propio lector de núcleos del motor

# text
seg-a731b913bdf0 = <b>VALIDATED</b> Derivadas parciales del retardo acumuladas sobre un calendario de líneas base × épocas en una matriz de información de Fisher, invertida hasta la covarianza de las coordenadas de estación y la sigma por coord. Referencia independiente (ExternalDataset): Una vía independiente dentro del repositorio. Cada fila del jacobiano se vuelve a derivar por diferencia finita central de lunar_vlbi::vlbi_delay_s evaluada a partir de las propias coordenadas fijas a la Tierra y fijas a la Luna del estado, rotadas hacia delante a través de la cadena de marcos: una vía que no calcula ninguna derivada y no comparte ninguna expresión con las derivadas parciales analíticas, y las matrices de información que construyen las dos vías coinciden hasta < { "1e-6" } de la mayor diagonal. La

# text
# c1: all-stations-fixed
seg-2300ffd9fc4e = <b>MODELLED</b> Una tercera opción de datum, <c1/>, que mantiene fijas todas las estaciones terrestres y estima únicamente las coordenadas de la BALIZA fijas a la Luna: la configuración para la que se. Referencia independiente (ReferenceImpl): Identidades de forma cerrada, sin que se reclame ni exista una referencia independiente externa. El brazo de palanca se comprueba frente a ρ/B y las dos formas de equipartición entre sí hasta { "1e-15" }: identidades algebraicas, de modo que detectan un error de conexionado y nada más, y se etiquetan como tales. El resultado sustantivo se MEASURED en lugar de afirmarse: un retardo de una línea base fija restringe la DIRECCIÓN de la baliza, de modo que la componente de la línea de visión rea

# text
# c1: label
seg-2cbf700a234e = Covarianza de las coordenadas de estación del VLBI lunar MODELLED. La covarianza se acumula a partir de las propias derivadas parciales analíticas del retardo del motor sobre un calendario explícito de líneas base y épocas y se invierte; NO se convierte a partir de una precisión escalar del retardo mediante un factor de geometría supuesto. La sigma del retardo por observación, las coordenadas de estación, el emplazamiento de la baliza y el calendario son entradas. Las efemérides del centro de la Luna, los relojes de estación (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8f63c3e774e2 = Covarianza de las coordenadas de estación del VLBI lunar: las derivadas parciales del retardo de la observable lunar-vlbi acumuladas a lo largo de un CALENDARIO explícito (líneas base x épocas) en una matriz de información de Fisher, invertida e indicada como la covarianza de las coordenadas de estación y la sigma de estación por coordenada: una salida calculada por el motor, y no una precisión escalar del retardo pasada por un factor de equipartición isótropo supuesto g = { "3" }. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-d09b166842d5 = El estado lleva coordenadas de estación FIJAS a la Tierra (ITRS), de modo que el jacobiano es la derivada parcial inercial rotada por la matriz GCRS->ITRS de cada época: la rotación terrestre es lo que hace observables esas coordenadas, y el informe MIDE el barrido de la línea de visión fija a la Tierra y la declinación de la baliza en lugar de suponerlos. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-bb7ff1e5d99f = El valor de equipartición c<em>delay_sigma_s</em>sqrt(g/N) para el MISMO calendario se emite junto al valor calculado con el cociente, junto con la cota isótropa de traza sqrt(p/trace(M)) que AM-HM convierte en un suelo estricto, de modo que el cociente es la anisotropía que descartaba el supuesto. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-0ed4495d4488 = MODELLED: las efemérides del centro de la Luna, los relojes de estación, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS y las observaciones se tratan como independientes, de modo que la covarianza es una cota de Cramer-Rao para un conjunto reducido de parámetros, no un resultado de sesión predicho; la sigma del retardo, las coordenadas de estación y el calendario son entradas. (catálogo de tipos (<c1/>))

# text
seg-4df6e3981cc4 = La cadena publicada de D3 va de una precisión del retardo por observación a una incertidumbre de las coordenadas de estación mediante un factor de equipartición ISÓTROPO supuesto g = { "3" }. Ese paso es el que el propio resumen del artículo califica de modelado y no de medido. Este escenario lo elimina: las derivadas parciales del retardo del VLBI lunar se acumulan sobre un calendario real de pares (línea base x época) en una matriz de información de Fisher, se invierten y se indican como (comentario del archivo de escenario, líneas { "3" } a { "8" })

# text
seg-489b93ca0f7f = El estado lleva coordenadas FIJAS a la Tierra (ITRS), de modo que el jacobiano es la derivada parcial inercial rotada por la matriz GCRS->ITRS de cada época: la rotación terrestre es lo que hace observables esas coordenadas, y el informe MIDE el barrido de la línea de visión fija a la Tierra y la declinación de la baliza en lugar de suponerlos. Una observación es un par (línea base, época) con AMBAS estaciones por encima de la máscara de elevación, ponderado con 1/delay (comentario del archivo de escenario, líneas { "10" } a { "14" })

# text
seg-efb5719364af = Qué leer en el informe * las sigmas por estación y por eje y en 3-D: la respuesta calculada; * el valor de equipartición c<em>delay_sigma_s</em>sqrt(g/N) para el MISMO calendario, impreso junto a ella con el cociente. Ese cociente ES la anisotropía que descartaba el supuesto, y la cota isótropa de traza sqrt(p/trace(M)) hace de AM-HM un suelo estricto, de modo que el supuesto solo puede subestimar; * rango, defecto de datum, número de condición, el espectro comp (comentario del archivo de escenario, líneas { "16" } a { "26" })

# text
seg-96c1a129aeae = <s1>Anterior</s1>lunar-time-offset

# text
seg-199d98630271 = <s1>Siguiente</s1>lunar-vlbi
