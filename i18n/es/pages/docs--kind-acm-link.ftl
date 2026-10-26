# docs--kind-acm-link: translations (es)

# text
# c1: docs/kinds/by-kind/acm-link.md
seg-a686bcdc6cc9 = Fuente: <c1/>

# text
# c1: acm-link
seg-a53e57719a74 = <c1/> (tipo de escenario)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-cb9447893c7f = Un satélite sobre una estación: la distancia oblicua, la elevación y el Es/N0 de cada paso a lo largo del paso, el MODCOD de DVB-S2 elegido en cada paso (umbrales de la tabla { "13" } de ETSI EN { "302" } 307-1 más un margen de implementación) y el volumen de datos que mueve ACM frente a la línea base de codificación constante que cierra en la máscara. MODELLED.

# text
# c1: scenarios/acm-link.toml
seg-1ab30ff9616a = Una ejecución de <c1/> se resume así: acm-link: { "3" } pass(es); ACM { "92866" } Mbit vs CCM 8PSK 3/4 { "58495" } Mbit -> gain x1.59 (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-54e2159e532d = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/acm-link.toml
seg-c7d1b4b1f247 = El ejemplo <c1/> establece, entre otros:

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-b77b8420b4f5 = Mbit

# text
seg-37d29d8303fe = km

# text
seg-eeaa777e4301 = 8PSK 3/4

# text
seg-d62795b9fdc0 = Etiqueta del resultado (la del motor): MODELLED — codificación y modulación adaptativas de DVB-S2 a lo largo de los pasos de un satélite en una estación: Es/N0 en cielo despejado a lo largo de cada paso aparente, el MODCOD más eficiente que supera su umbral de la tabla { "13" } de ETSI EN { "302" } 307-1 más un margen, frente al MODCOD de codificación constante que cierra en la máscara; sin lluvia f

# attr:alt
seg-046f69293874 = El gráfico que escribe el motor para scenarios/acm-link.toml, tipo de escenario acm-link

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 del enlace descendente a lo largo de cada paso de un satélite sobre una estación (EIRP, pérdida en espacio libre, pérdida atmosférica con ley de cosecante, otras pérdidas, G/T, constante de Boltzmann, velocidad de símbolo), el MODCOD de DVB-S2 más eficiente que supera su umbral de ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> Pasos de visibilidad (AOS, TCA, LOS, elevación aparente máxima, duración) de un conjunto de elementos SGP4 sobre una estación WGS-84 en la ruta de órbita terrestre validada (IAU { "2006" }. Referencia independiente (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) con Hipparchus { "4.0.3" }: TLEPropagator sobre los mismos conjuntos de elementos en un TEME que Orekit construye según la definición indicada (su TOD de IERS { "2010" } rotado por GAST - GMST), ElevationDetector y ElevationExtremumDetector con y sin ITURP834AtmosphericRefraction, y AngularAzEl con AngularRadioRefractionModifier para el caso del tiempo de luz, con cruces y máximo resueltos por Hipparchus; { "60" } casos (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 del enlace descendente a lo largo de cada paso de un satélite sobre una estación (EIRP, pérdida en espacio libre, pérdida atmosférica con ley de cosecante, otras pérdidas, G/T, constante de Boltzmann,. Referencia independiente (InternalConsistency): Autoconsistencia interna: la eficiencia espectral calculada en forma cerrada a partir de K_bch de la tabla 5a y de las longitudes de trama coincide con las eficiencias que imprime la tabla { "13" } (una comprobación de transcripción de la tabla de umbrales); las piezas del balance de enlace coinciden con sus formas cerradas; la selección es monótona en Es/N0 y respeta el margen; ACM mueve al menos el volumen de codificación constante. La geometría del paso procede de la a VALIDATED por separado

# text
# c1: label
seg-02e9f2e87410 = MODELLED — codificación y modulación adaptativas de DVB-S2 a lo largo de los pasos de un satélite en una estación: Es/N0 en cielo despejado a lo largo de cada paso aparente, el MODCOD más eficiente que supera su umbral de la tabla { "13" } de ETSI EN { "302" } 307-1 más un margen, frente al MODCOD de codificación constante que cierra en la máscara; sin desvanecimiento por lluvia ni pérdida de apuntamiento a lo largo del paso (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-a2cdc7dff1e3 = Todas las cifras siguientes son ILLUSTRATIVE: no corresponden a la órbita, la estación ni el balance de enlace de ningún operador. MODELLED. (comentario del archivo de escenario, línea { "8" })

# text
seg-7f8667e8d8fe = La codificación y modulación adaptativas de DVB-S2 a lo largo de un paso de enlace descendente en LEO son MODELLED, no están validadas: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-72fd0321e4af = Página de tema: <a1>CONTACT-SCHEDULING.md</a1>

# text
seg-1f67ae89028b = <s1>Siguiente</s1>aocs
