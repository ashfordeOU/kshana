# docs--kind-passes: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 del enlace descendente a lo largo de cada paso de un satélite sobre una estación (EIRP, pérdida en espacio libre, pérdida atmosférica con ley de cosecante, otras pérdidas, G/T, constante de Boltzmann, velocidad de símbolo), el MODCOD de DVB-S2 más eficiente que supera su umbral de ETSI EN { "302" } 307-

# text
seg-72fd0321e4af = Página de tema: <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Una ejecución toma un plan de contactos (una lista de ventanas aos_s/los_s, cada una de las cuales solicita a la apertura navegación o comunicaciones — el mismo vocabulario de ventanas que emite <c1/>, convertido por <c2/>), una apert

# text
seg-11e8c29ecb45 = Tipo de escenario del motor v{ $version }, familia <a1>Constelaciones, cobertura y geometría</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-a4f1e7d2041e = Página de familia: <a1>Constelaciones, cobertura y geometría</a1>

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-df90e5910fb4 = h

# text
# c1: docs/kinds/by-kind/passes.md
seg-2544da673115 = Fuente: <c1/>

# text
# c1: passes
seg-0db3f4e2402e = <c1/> (tipo de escenario)

# text
seg-a4bdfc291fce = Predicción de pases sobre una estación terrestre: los pases de visibilidad en el dominio del tiempo (AOS/TCA/LOS, elevación aparente máxima, duración) de una órbita circular, como elementos medios SGP4 al inicio de la ventana, sobre una estación por encima de una máscara de elevación a lo largo de una ventana, con el tiempo total de acceso. Propagación SGP4/SDP4 en el marco fijo a la Tierra IAU 2006/2000A (UT1 - UTC y movimiento polar opcionales), refracción troposférica ITU-R P.834-9 y tiempo de luz del enlace descendente (ambos activados por defecto), cruces resueltos hasta { "1e-7" } s y la culminación mediante búsqueda por sección áurea. La geometría de los pases está VALIDATED frente a Orekit { "13.1.8" } en estaciones a nivel del mar; la órbita y la estación del escenario son entradas ilustrativas.

# text
# c1: scenarios/passes.toml
seg-3050cc7fdc79 = Una ejecución de <c1/> se resume así: passes: { "5" } pase(s) de una órbita de { "550" } km / { "97.6" }° sobre ({ "52.2" }°, { "4.4" }°) > { "10" }° en { "24" } h; { "1659" } s de acceso total (MODELLED)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-699b650604d4 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/passes.toml
seg-9d2941ba37e2 = El ejemplo <c1/> establece, entre otros:

# text
seg-6f849331e33c = Etiqueta del resultado (la del motor): MODELLED — predicción de pases sobre una estación terrestre en el dominio del tiempo; propagación SGP4/SDP4, marco fijo a la Tierra IAU 2006/2000A (UT1 = UTC, sin movimiento polar salvo que se den parámetros de orientación terrestre), elevación aparente con refracción ITU-R P.834-9 y tiempo de luz cuando se activan, cruces y culminación refin

# attr:alt
seg-a09be8c586e3 = El gráfico que el motor genera para scenarios/passes.toml, tipo de escenario passes

# text
seg-db35e4ebd275 = <b>VALIDATED</b> Pases de visibilidad en el dominio del tiempo (AOS/TCA/LOS, elevación máxima, duración) de un propagador del motor sobre una estación por encima de una máscara de elevación, con cruces interpolados de salida y puesta y acceso total: passes::predict_passes, el planificador geométrico (sin Pruebas: <a1>ground_station_pass_prediction_reference.rs</a1>.

# text
seg-6799a54acee6 = <b>VALIDATED</b> Pases de visibilidad (AOS, TCA, LOS, elevación aparente máxima, duración) de un conjunto de elementos SGP4 sobre una estación WGS-84 en la vía de órbita terrestre validada (IAU 2006/2000A, parámetros de orientación terrestre opcionales), con troposférica ITU-R P.834-9 Pruebas: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

# text
seg-42d4290ed718 = <b>VALIDATED</b> Pases de visibilidad en el dominio del tiempo (AOS/TCA/LOS, elevación máxima, duración) de un propagador del motor sobre una estación por encima de una máscara de elevación, con salida y puesta interpoladas . Referencia independiente (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" }: una biblioteca independiente de dinámica de vuelo: ElevationDetector (buscador de raíces de Brent) + EventsLogger sobre una efeméride ITRF, con la estación como TopocentricFrame WGS-84. AOS/LOS/elevación máxima/número de pases/acceso total coinciden con órbita, estación, máscara y ventana idénticas (archivo de prueba confirmado; controlador xval/orekit-passes)

# text
# c1: label
seg-eb79c117f1df = MODELLED — predicción de pases sobre una estación terrestre en el dominio del tiempo; propagación SGP4/SDP4, marco fijo a la Tierra IAU 2006/2000A (UT1 = UTC, sin movimiento polar salvo que se den parámetros de orientación terrestre), elevación aparente con refracción ITU-R P.834-9 y tiempo de luz cuando se activan, cruces y culminación refinados por debajo del paso (resultado <c1/>)

# text
seg-a7ddc8eeaf1e = <s1>Anterior</s1>orbit

# text
seg-3079cfb8decc = <s1>Siguiente</s1>pvt
