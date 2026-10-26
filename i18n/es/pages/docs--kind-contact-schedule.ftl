# docs--kind-contact-schedule: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 del enlace descendente a lo largo de cada paso de un satélite sobre una estación (EIRP, pérdida en espacio libre, pérdida atmosférica con ley de cosecante, otras pérdidas, G/T, constante de Boltzmann, velocidad de símbolo), el MODCOD de DVB-S2 más eficiente que supera su umbral de ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> Pasos de visibilidad (AOS, TCA, LOS, elevación aparente máxima, duración) de un conjunto de elementos SGP4 sobre una estación WGS-84 en la ruta de órbita terrestre validada (IAU { "2006" }. Referencia independiente (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) con Hipparchus { "4.0.3" }: TLEPropagator sobre los mismos conjuntos de elementos en un TEME que Orekit construye según la definición indicada (su TOD de IERS { "2010" } rotado por GAST - GMST), ElevationDetector y ElevationExtremumDetector con y sin ITURP834AtmosphericRefraction, y AngularAzEl con AngularRadioRefractionModifier para el caso del tiempo de luz, con cruces y máximo resueltos por Hipparchus; { "60" } casos (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 del enlace descendente a lo largo de cada paso de un satélite sobre una estación (EIRP, pérdida en espacio libre, pérdida atmosférica con ley de cosecante, otras pérdidas, G/T, constante de Boltzmann,. Referencia independiente (InternalConsistency): Autoconsistencia interna: la eficiencia espectral calculada en forma cerrada a partir de K_bch de la tabla 5a y de las longitudes de trama coincide con las eficiencias que imprime la tabla { "13" } (una comprobación de transcripción de la tabla de umbrales); las piezas del balance de enlace coinciden con sus formas cerradas; la selección es monótona en Es/N0 y respeta el margen; ACM mueve al menos el volumen de codificación constante. La geometría del paso procede de la a VALIDATED por separado

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-7f8667e8d8fe = La codificación y modulación adaptativas de DVB-S2 a lo largo de un paso de enlace descendente en LEO son MODELLED, no están validadas: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-72fd0321e4af = Página de tema: <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: docs/kinds/by-kind/contact-schedule.md
seg-b79fcddea1d6 = Fuente: <c1/>

# text
# c1: contact-schedule
seg-040d160b3fdd = <c1/> (tipo de escenario)

# text
seg-be4e928a5865 = Planificación de contactos con tierra para varios satélites sobre varias estaciones: ventanas de acceso aparentes (SGP4, marco fijo a la Tierra IAU 2006/2000A, refracción ITU-R P.834, tiempo de luz), el volumen de datos ACM de DVB-S2 de cada paso (umbrales de la tabla { "13" } de ETSI EN { "302" } 307-1) y un calendario sin conflictos (un satélite por antena con un tiempo de giro, una estación por satélite, entrega ponderada por prioridad limitada a cada acumulación pendiente) mediante un voraz de valor marginal, una línea base de primero en llegar y una ramificación y acotación exacta en conjuntos pequeños, con la brecha de optimalidad del voraz. MODELLED.

# text
# c1: scenarios/contact-schedule.toml
seg-7a3fad06a9fc = Una ejecución de <c1/> se resume así: contact-schedule: { "3" } satellites x { "3" } stations over { "12" } h -> { "31" } candidate contacts, { "22" } scheduled; { "797266" } of { "860000" } Mbit delivered (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-a03d83f5866a = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/contact-schedule.toml
seg-5ba0968796ac = El ejemplo <c1/> establece, entre otros:

# text
seg-cade59b5a371 = Etiqueta del resultado (la del motor): MODELLED — plan de contactos de varios satélites y varias estaciones: ventanas de acceso aparentes (SGP4, IAU 2006/2000A, refracción ITU-R P.834, tiempo de luz), volumen de datos ACM de DVB-S2 por paso a partir de un balance de enlace en cielo despejado (umbrales de la tabla { "13" } de ETSI EN { "302" } 307-1) y resolución de conflictos (un satélite por antena con tiem

# attr:alt
seg-e26b549579e2 = El gráfico que escribe el motor para scenarios/contact-schedule.toml, tipo de escenario contact-schedule

# text
seg-036b708ed2b9 = <b>MODELLED</b> Contactos candidatos de cada paso satélite-estación con su volumen de datos ACM; conflictos cuando una antena atendería a dos satélites dentro de su tiempo de giro o un satélite transmitiría a dos estaciones a la vez; una entrega ponderada por prioridad

# text
seg-60431931082a = <b>MODELLED</b> Contactos candidatos de cada paso satélite-estación con su volumen de datos ACM; conflictos cuando una antena atendería a dos satélites dentro de su tiempo de giro o u. Referencia independiente (InternalConsistency): Autoconsistencia interna: la ramificación y acotación exacta coincide con la enumeración por fuerza bruta en conjuntos aleatorios pequeños, cada plan se comprueba factible frente a las reglas de conflicto, y el voraz nunca supera el óptimo exacto. LO QUE NO ES: no se ha comparado ningún planificador externo ni plan operativo; los contactos se toman enteros (sin dividir), la acumulación pendiente se fija al inicio de la ventana, el tiempo de giro más allá del tiempo de giro fijo y a bordo

# text
# c1: label
seg-9941b9f6d4a8 = MODELLED — plan de contactos de varios satélites y varias estaciones: ventanas de acceso aparentes (SGP4, IAU 2006/2000A, refracción ITU-R P.834, tiempo de luz), volumen de datos ACM de DVB-S2 por paso a partir de un balance de enlace en cielo despejado (umbrales de la tabla { "13" } de ETSI EN { "302" } 307-1) y resolución de conflictos (un satélite por antena con tiempo de giro, una estación por satélite) mediante un voraz de valor marginal contrastado con una ramificación y acotación exacta; sin desvanecimiento por lluvia, (resultado <c1/>)

# text
seg-fe2b4799b397 = La planificación de contactos con tierra de varios satélites y varias estaciones con resolución de conflictos es MODELLED, no está validada: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-be14d99cb86d = <s1>Anterior</s1>constellation-design

# text
seg-3784be57d6df = <s1>Siguiente</s1>earth-gnss-lunar

# text
seg-f8ef88bc82b5 = Todas las cifras siguientes son ILUSTRATIVAS: no corresponden a las órbitas, estaciones ni balance de enlace de ningún operador. MODELLED: el planificador se contrasta con su propio resolvedor exacto, no con una herramienta externa. (comentario del archivo de escenario, líneas { "11" } a { "12" })
