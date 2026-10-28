# docs--kind-clock: translations (es)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/clock.md
seg-33555d61ddc6 = Fuente: <c1/>

# text
# c1: clock
seg-618393657d01 = <c1/> (tipo de escenario)

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-78cba87823f7 = Holdover del reloj frente a la especificación; conjunto de Monte Carlo opcional (ejecuciones > { "1" }).

# text
# c1: scenarios/clock-ensemble.toml
seg-dd2ad570a6c9 = Una ejecución de <c1/> se resume así: scenario 91d2b6d10d14 | { "200" } runs | quantum holdover 6600s [6600-6600] p95 8.78e-4ns security n/a (no attack) | classical holdover 844s [220-2130] p95 167.0ns security n/a (no attack)

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
seg-51820163de28 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
# c2: integrity
seg-80fe14eb5e79 = Campos opcionales: <c1/>, <c2/>

# text
# c1: scenarios/clock-ensemble.toml
seg-807e7c5a2565 = El ejemplo <c1/> establece, entre otros:

# text
seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Reloj óptico de red de estroncio, objetivo orientado al espacio sigma_y

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# attr:alt
seg-cb0b7da83f5c = El gráfico que escribe el motor para scenarios/clock-ensemble.toml, tipo de escenario clock

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> La sección opcional [integrity] del tipo de escenario clock (clock_integrity::run): a partir de un emplazamiento indicado y de preajustes de constelación (geometry::sky_geometry), en cada época de integridad mientras la línea temporal GNSS no está denegada, RAIM instantáneo (raim::snapshot_ Pruebas: <a1>clock_integrity.rs</a1>.

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: una capa de análisis sintáctico que convierte un archivo de reloj RINEX (registros AS/AR de un reloj con nombre, versiones { "2" } y { "3.00" } a { "3.04" }), un registro ASCII de fase o de frecuencia de estilo TimeLab, o un registro de marcas de tiempo o de intervalos de TAPR TICC en una fase uniforme Pruebas: <a1>clock_log_allantools.rs</a1>.

# text
seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input con los formatos ptp4l, phc2sys, ts2phc, chrony-tracking y chrony-statistics: el desfase registrado de una línea del servo de linuxptp (ns, la propia marca de tiempo entre corchetes de la línea, con las lecturas anteriores a la primera vez que el servo informa de s2 omitidas a

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Desviación de Allan / modificada / de Hadamard + identificación de ruido de ley de potencias con intervalos de confianza χ². Referencia independiente (ExternalDataset): NIST SP { "1065" } (Riley) / desviaciones de referencia de Stable32 en NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crecimiento del error de inercia en forma cerrada + holdover hasta el umbral; clases de reloj cuántico. Referencia independiente (ReferenceImpl): Recursión de covarianza de clock_state en varios pasos (comprobación cruzada en el mismo código base); el núcleo subyacente de varianza de inercia e inversión de holdover está validado externamente frente a scipy (véase «Clock-holdover coast-variance & threshold inversion»). Las cifras de holdover por clase con suelo de ruido rojo siguen siendo MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Reloj de Kalman de 3 estados (fase/frecuencia/deriva) de van Loan, estabilizado de Joseph. Referencia independiente (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), con F mediante scipy.linalg.expm y Q mediante la matriz por bloques de Van Loan { "1978" } — una implementación de referencia independiente que reproduce la trayectoria completa del filtro de kshana. Consistencia entre implementaciones: la física del reloj y la calibración de Allan no están validadas externamente, por lo que esto sigue siendo MODELLED. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): en relojes finales de IGS de { "30" } s de { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> Chi-cuadrado asistido por reloj, RAIM, AGC, FoM de seguridad por época fusionada con SQM. Referencia independiente (ExternalDataset): parámetros de escenario de TEXBAT (Humphreys { "2012" }) — caracterización, no vectores fijados. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): en JammerTest { "2024" } (Bleik; datos GPL-3.0) los monitores de nivel de observable (chi-cuadrado asistido por reloj, RAIM, fallo de solución) no dieron ninguna alarma dentro de { "10" } s de ninguno de los { "8" } inicios de suplantación publicados evaluables (donde la ventana previa al inicio estaba limpia, la primera alarma llegó entre { "10.2" } y { "39" } s después del pu

# text
seg-e12f672ae71d = El holdover del reloj sin GNSS es MODELLED, no está validado: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = La estimación del estado del reloj de a bordo es MODELLED, no está validada: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = La detección de spoofing es MODELLED, no está validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
seg-ee7dd15019d0 = Página de tema: <a1>CAMPAIGNS.md</a1>

# text
seg-46ed0b786244 = Página de tema: <a1>RECEIVER-TRUST.md</a1>

# text
seg-e06f9a5a0291 = <s1>Anterior</s1>cislunar-observability

# text
seg-aba9395185fa = <s1>Siguiente</s1>combined-altpnt

seg-d1beb62cf742 = { "6" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

seg-936e96edf423 = <b>MODELLED</b> El tipo de escenario <c1/>: un documento de fases, cada una de uno de ocho tipos registrados, ejecutadas en orden con la covarianza de 6x6, el reloj y el marco transmitidos bajo una regla indicada (<c2/>; <c3/>, ruido de aceleración blanco sobre un intervalo indicado Pruebas: <a1>field_units_global.rs</a1>.

seg-3319b18ac61f = y { "1" } más en la matriz.
