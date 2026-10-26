# docs--kind-earth-gnss-lunar: translations (es)

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = sin valor

# text
seg-59afd80736c5 = <b>PARTNER</b> No se proporciona — Kshana modela las prestaciones de la señal, no el hardware de carga útil ni de antenas. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
# c1: docs/kinds/by-kind/earth-gnss-lunar.md
seg-9a399fed06c4 = Fuente: <c1/>

# text
# c1: earth-gnss-lunar
seg-886b3796afaa = <c1/> (tipo de escenario)

# text
seg-c8a8be4b8894 = Recepción de GNSS terrestre a distancia lunar, la capa de señal débil que nombra el artículo sobre resiliencia ante conflictos y para la que el motor no tenía modelo. Un satélite GNSS apunta su antena hacia la Tierra; un receptor cerca de la Luna está a unas quince veces el radio orbital, de modo que tres cosas pesan a la vez. La Tierra OCULTA EL EJE DE APUNTAMIENTO: desde { "26,560" } km subtiende un semiángulo de { "13.9" } deg, de modo que todo rayo con destino lunar debe salir del transmisor al menos con ese ángulo respecto al nadir, lo que elimina el máximo del haz antes de calcular ninguna potencia. Lo que queda es el BORDE DEL LÓBULO PRINCIPAL Y LOS LÓBULOS LATERALES, el régimen en el que el instrumento LuGRE operó realmente en { "2025" }. Y la pérdida en espacio libre es de unos { "208" } dB en L1, aproximadamente { "25" } dB más de lo que paga un usuario terrestre. El informe emite una fila por satélite (ángulo fuera del eje de apuntamiento, ocultación por la Tierra, distancia, pérdida de trayecto, ganancia de transmisión a ese ángulo, potencia recibida, densidad de ruido de portadora) y agrega solo los enlaces que superan el umbral de seguimiento. TAMBIÉN INFORMA DEL CONDICIONAMIENTO, porque eso es lo que define esta capa: todo satélite visible queda dentro de un cono de un par de grados de anchura visto desde la Luna, por lo que las líneas de visión son casi paralelas, la dilución de la precisión es enorme, y una solución de GNSS terrestre a distancia lunar es una observación de grado de TEMPORIZACIÓN mucho más que de grado de posición. MODELLED, y el motivo es el patrón de transmisión: la ganancia a un ángulo es una apertura circular uniforme (Airy), mientras que una antena GPS L1 real es una agrupación helicoidal de doce elementos con un lóbulo principal conformado y lóbulos laterales no Airy. Existen patrones medidos y no se incorporan aquí al repositorio, así que los órdenes y los órdenes de magnitud son significativos, pero no los dB de un satélite concreto. Deliberadamente AUSENTES, y cada una hace optimista el balance: ninguna pérdida ionosférica ni troposférica en los rayos rasantes al limbo, ninguna pérdida de polarización, de apuntamiento ni de implementación, y una Tierra esférica sin extensión refractiva. La posición de la Luna es una ENTRADA (distancia más dirección inercial) y no una consulta de efemérides, porque la magnitud sometida a prueba es el enlace y la geometría del haz. Elevar esta fila a validada requiere un patrón de transmisión medido y puntos normales de LuGRE; ninguno está en el repositorio y ninguno se inventa aquí.

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-75b6814c0091 = Una ejecución de <c1/> se resume así: Earth-GNSS at lunar distance — { "24" } satellites, receiver at { "384400" } km Earth limb from the constellation: { "13.90" } deg off nadir — any lunar-bound ray must exceed this { "22" } of { "24" } not occulted; { "0" } clear the { "25.0" } dB-Hz tracking threshold no link reaches the threshold fewer than two trackable links; no angular spread to report fewer than four trackable links, or a singular geometry: no DOP SWEEP over { "64" } epochs / { "43082" } s: signal availability { "0.375" }, FIX availability { "0.000" } trackable links mean { "0.75" }, max { "2" }; best C/N0 { "30.93" } dB-Hz; best PDOP none Tome la disponibilidad de FIX como a priori de esta capa, no la disponibilidad de señal: un enlace es una observación de reloj, cuatro son una posición. MODELLED: la ganancia de transmisión es un sustituto de apertura uniforme (Airy), no un haz GPS medido, y no se aplica ninguna pérdida atmosférica, de polarización ni de implementación — por lo que el balance de aquí es optimista. Los órdenes de magnitud y los órdenes relativos son significativos; los dB de un satélite concreto no lo son.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-6c0897da2efa = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-8c6bb203352d = El ejemplo <c1/> establece, entre otros:

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# attr:alt
seg-cf1dce5fc824 = El gráfico que escribe el motor para scenarios/earth-gnss-lunar.toml, tipo de escenario earth-gnss-lunar

# text
seg-04f59a1e2ec2 = <b>MODELLED</b> Recepción de GNSS terrestre a distancia lunar: la capa de señal débil que nombra la tabla { "1" } de P7 y para la que el motor no tenía modelo.

# text
seg-9531f6b14fc8 = <b>MODELLED</b> Recepción de GNSS terrestre a distancia lunar: la capa de señal débil que nombra la tabla { "1" } de P7 y para la que el motor no tenía modelo. Por satélite y por época calcula el fuera del eje. Referencia independiente (InternalConsistency): Identidades de forma cerrada y autoconsistencia interna; NO se alega ninguna referencia independiente externa. El semiángulo del limbo se comprueba frente a asin(R_earth/r_orbit) y la geometría frente a él; la pérdida en espacio libre, el núcleo de DOP y la propagación SGP4 que esto compone están validados externamente cada uno en sus propias filas, y esta fila no toma prestado su estado. POR QUÉ ES MODELLED, y es el patrón de transmisión: la ganancia a un ángulo es una iluminada uniformemente

# text
# c1: kshana kinds --json
seg-6dfc5503f58f = MODELLED, y el motivo es el patrón de transmisión: la ganancia a un ángulo es una apertura circular uniforme (Airy), mientras que una antena GPS L1 real es una agrupación helicoidal de doce elementos con un lóbulo principal conformado y lóbulos laterales no Airy. (catálogo de tipos de escenario (<c1/>))

# text
seg-c40d3fd8c12e = LO QUE ES MODELLED, Y POR QUÉ NO ES VALIDATED La ganancia de transmisión a un ángulo es una apertura circular iluminada uniformemente — un patrón de Airy. Una antena GPS L1 real es una agrupación helicoidal de doce elementos cuyo patrón medido tiene un lóbulo principal conformado, con el máximo deliberadamente fuera del eje de apuntamiento para igualar la potencia a lo largo del disco terrestre, y lóbulos laterales que no son Airy en absoluto. Hay patrones medidos publicados; no se incorporan en este re (comentario del archivo de escenario, líneas { "29" } a { "35" })

# text
seg-01fa469abd95 = El GNSS terrestre a distancia lunar es MODELLED, no está validado: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-2fd936b76f4a = <s1>Anterior</s1>contact-schedule

# text
seg-95a5aa0adeb3 = <s1>Siguiente</s1>entry-heating
