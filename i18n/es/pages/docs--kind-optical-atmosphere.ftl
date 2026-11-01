# docs--kind-optical-atmosphere: translations (es)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-72ad48275ebe = Tipo de escenario del motor v{ $version }, familia <a1>PNT óptico</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-a97755cb13eb = Página de familia: <a1>PNT óptico</a1>

# text
seg-9fd02351d844 = ms

# text
# c1: docs/kinds/by-kind/optical-atmosphere.md
seg-d4e4da22fadb = Fuente: <c1/>

# text
# c1: optical-atmosphere
seg-deb0a932a76f = <c1/> (tipo de escenario)

# text
seg-a878d9be65b7 = PNT óptico MODELLED a través de la atmósfera: para un enlace óptico y un conjunto de emplazamientos terrestres con climas nubosos indicados, indica la pérdida de aire despejado dependiente de la longitud de onda y de la elevación (ley de visibilidad de Kim más Rayleigh), el estado de turbulencia de Hufnagel-Valley (varianza de Rytov, índice de centelleo, parámetros gamma-gamma, promediado de apertura), la disponibilidad condicionada por el tiempo meteorológico frente al margen del enlace (profundidad óptica de las nubes a partir de un clima de agua líquida lognormal, extinción de óptica geométrica, desvanecimiento por turbulencia independiente), el margen de enlace necesario para las disponibilidades objetivo, la distribución de la duración de las interrupciones, el crecimiento del error de temporización y de distancia por interrupción mediante el modelo de holdover del reloj, la disponibilidad por diversidad de emplazamientos correlacionada con la distancia, y las ganancias hipotéticas de las técnicas de mejora (longitud de onda, apertura de recepción, reducción del centelleo mediante óptica adaptativa, margen adicional). VALIDATED como implementación de las fórmulas indicadas frente a una referencia independiente de mpmath: varianza de Rytov, índice de centelleo, probabilidad de desvanecimiento gamma-gamma, factor de promediado de apertura, profundidad óptica de nubes y de aire despejado. MODELLED: todas las entradas de tiempo meteorológico, de técnica y de reloj y los supuestos de independencia y de cópula; no se ha comparado ningún registro medido de disponibilidad. Análisis de carácter consultivo, no un producto certificado de disponibilidad ni de navegación.

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-c443d8d3e4ce = Una ejecución de <c1/> se resume así: optical-atmosphere: { "1550" } nm a { "30" } grados de elevación, margen { "19.2" } dB antes de la atmósfera; mejor emplazamiento southern { "74.66" } %; red de 3 emplazamientos { "92.72" } % con tiempo meteorológico independiente / { "91.62" } % con tiempo meteorológico correlacionado (MODELLED, consultivo)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-e466ecbd4e6d = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-8adae3ea6e60 = El ejemplo <c1/> establece, entre otros:

# text
seg-687f2930a40d = downlink

# text
seg-e794d481aed4 = plane

# text
seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

# text
seg-9799bd5f9fdb = nm

# text
seg-7707c45d1d30 = dBm

# text
seg-0fd6a569077f = Etiqueta del resultado (la del motor): MODELLED — PNT óptico a través de la atmósfera: extinción de aire despejado (ley de visibilidad de Kim + Rayleigh), profundidad óptica de las nubes a partir de un clima de agua líquida indicado (cantidad P.840, extinción de óptica geométrica), turbulencia de Hufnagel-Valley con desvanecimientos gamma-gamma y promediado de apertura, disponibilidad frente al

# attr:alt
seg-4e2b759aff17 = El gráfico que el motor genera para scenarios/optical-atmosphere-network.toml, tipo de escenario optical-atmosphere

# text
seg-a18d144f149e = <b>MODELLED</b> Cn2 de Hufnagel-Valley integrado a lo largo de una trayectoria oblicua para la varianza de Rytov de onda plana y de onda esférica (enlace ascendente y descendente), el índice de centelleo de Andrews-Phillips y los parámetros gamma-gamma, la probabilidad de desvanecimiento gamma-gamma y el margen de desvanecimiento, Pruebas: <a1>optical_atmosphere_reference.rs</a1>.

# text
seg-d97535fd4875 = <b>MODELLED</b> Disponibilidad de un enlace óptico frente a un margen de enlace indicado a partir de un clima lognormal de agua líquida en las nubes (cantidad ITU-R P.840, extinción de óptica geométrica) y del desvanecimiento por turbulencia gamma-gamma independiente, el margen de enlace necesario para la disponibilidad objetivo Pruebas: <a1>optical_atmosphere_identities.rs</a1>.

# text
seg-6e2c643df3a6 = <b>MODELLED</b> La distribución de la duración de las interrupciones de un emplazamiento óptico acoplada a la varianza de deriva de forma cerrada del modelo de holdover del reloj: error de temporización y de distancia en cuantiles de interrupción indicados, el holdover hasta un umbral de temporización, la fracción de interrupciones y Pruebas: <a1>optical_atmosphere_identities.rs</a1>.

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-00c76aeadb90 = <b>MODELLED</b> Una tabla <c1/> opcional (duración, paso, semilla) hace que el tipo de escenario <c2/> escriba además, por emplazamiento, una realización con semilla del modelo de emplazamiento indicado a lo largo del tiempo: episodios de nubes (periodos despejados exponenciales, interrupciones por nubes lognormales Pruebas: <a1>optical_atmosphere_timeseries.rs</a1>.

# text
seg-f1ee20e52b46 = <b>MODELLED</b> Cn2 de Hufnagel-Valley integrado a lo largo de una trayectoria oblicua para la varianza de Rytov de onda plana y de onda esférica (enlace ascendente y descendente), el índice de centelleo de Andrews-Phillips. Referencia independiente (ExternalDataset): Los cálculos numéricos se comparan con un programa independiente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } con { "30" } dígitos, cuadratura tanh-sinh sobre la variable de altura original y densidades gamma-gamma de Bessel-K) que no comparte ningún código con Kshana, con umbrales fijados antes de que existiera ninguna implementación (xval/optical-atmosphere/PREREGISTRATION.md). POR QUÉ MODELLED: esa referencia independiente evalúa las mismas fórmulas publicadas, de modo que comprueba la im

# text
seg-4af9bc99ef29 = <b>MODELLED</b> Disponibilidad de un enlace óptico frente a un margen de enlace indicado a partir de un clima lognormal de agua líquida en las nubes (cantidad ITU-R P.840, extinción de óptica geométrica) y . Referencia independiente (InternalConsistency): Autoconsistencia interna: límites de forma cerrada y monotonía del modelo de diversidad, la forma cerrada del techo de nubes y las identidades de interrupción lognormales. NO se reclama ninguna referencia independiente externa y no se ha comparado ninguna: no se usa ningún registro medido de disponibilidad de estaciones terrestres ópticas ni de línea de visión despejada de nubes. POR QUÉ MODELLED: el clima de nubes (probabilidad de nubes, mediana y dispersión de la columna de agua líquida, duraciones de las interrupciones),

# text
seg-b3abf6cbeba4 = <b>MODELLED</b> La distribución de la duración de las interrupciones de un emplazamiento óptico acoplada a la varianza de deriva de forma cerrada del modelo de holdover del reloj: error de temporización y de distancia en las interrupciones ind. Referencia independiente (InternalConsistency): Autoconsistencia interna con el módulo de holdover, bit a bit; NO se reclama ninguna referencia independiente externa. Las PSD de clase son los suelos sintetizados de tau largo que el módulo de holdover ya incorpora, de modo que las cifras heredan su salvedad indicada de que el holdover hasta un umbral estricto está gobernado por el suelo supuesto de ruido rojo y no por la desviación de Allan citada. Las duraciones de las interrupciones son un modelo lognormal con parámetros indicados, no un c medido

# text
# c1: label
seg-c4772a9e1a26 = MODELLED — PNT óptico a través de la atmósfera: extinción de aire despejado (ley de visibilidad de Kim + Rayleigh), profundidad óptica de las nubes a partir de un clima de agua líquida indicado (cantidad P.840, extinción de óptica geométrica), turbulencia de Hufnagel-Valley con desvanecimientos gamma-gamma y promediado de apertura, disponibilidad frente al margen del enlace, duraciones de interrupción acopladas al holdover del reloj y diversidad de emplazamientos correlacionada con la distancia. Los cálculos numéricos se comprueban (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-32c6524b0baf = PNT óptico MODELLED a través de la atmósfera: para un enlace óptico y un conjunto de emplazamientos terrestres con climas nubosos indicados, indica la pérdida de aire despejado dependiente de la longitud de onda y de la elevación (ley de visibilidad de Kim más Rayleigh), el estado de turbulencia de Hufnagel-Valley (varianza de Rytov, índice de centelleo, parámetros gamma-gamma, promediado de apertura), la disponibilidad condicionada por el tiempo meteorológico frente al margen del enlace (profundidad óptica de las nubes a partir de (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-2c7493ee5042 = MODELLED: todas las entradas de tiempo meteorológico, de técnica y de reloj y los supuestos de independencia y de cópula; no se ha comparado ningún registro medido de disponibilidad. (catálogo de tipos (<c1/>))

# text
seg-384f5c73cdf9 = Una realización con semilla del enlace de cada emplazamiento a lo largo del tiempo (MODELLED; una muestra del modelo anterior, no del clima). Si falta, no se escribe ninguna serie y el resultado es el documento { "0.37" }. (comentario del archivo de escenario, líneas { "78" } a { "79" })

# text
seg-c75fa5787bd4 = Los cálculos numéricos de la atmósfera en trayectoria oblicua óptica (varianza de Rytov, centelleo, probabilidad de desvanecimiento gamma-gamma, promediado de apertura, profundidad óptica de nubes y de aire despejado) son MODELLED, no validados: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-e5013bdf86bb = La disponibilidad de las estaciones terrestres ópticas condicionada por el tiempo meteorológico y la diversidad de emplazamientos correlacionada con la distancia son MODELLED, no validadas: se comprueban frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-dc1132147318 = Página temática: <a1>OPTICAL-ATMOSPHERE.md</a1>

# text
seg-bd5b1654b3ed = <s1>Anterior</s1>oem-interop

# text
seg-ef0a779c300c = <s1>Siguiente</s1>orbit

# text
seg-b4402211e3fe = PNT óptico a través de la atmósfera: tres emplazamientos terrestres ILLUSTRATIVE (un emplazamiento norte más nuboso, uno central intermedio y uno sur más despejado) que observan un terminal óptico LEO a { "30" } grados de elevación a { "1550" } nm. Los climas de nubes son entradas indicadas, no mediciones ni valores de ningún conjunto de datos, de modo que toda disponibilidad que figura a continuación es MODELLED. La ejecución indica por emplazamiento la pérdida de aire despejado, el estado de turbulencia de Hufnagel-Valley, el (comentario del archivo de escenario, líneas { "1" } a { "8" })
