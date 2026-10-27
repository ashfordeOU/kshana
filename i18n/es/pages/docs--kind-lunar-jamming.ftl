# docs--kind-lunar-jamming: translations (es)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> No se proporciona — Kshana modela las prestaciones de la señal, no el hardware de carga útil ni de antenas. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
seg-f85a85f0c7e4 = MHz

# text
seg-7154243aabbe = banda ancha

# text
seg-cec5c06d38af = <b>MODELLED</b> Relación señal-interferente, C/N₀ efectivo y pérdida de enganche nativos lunares para un usuario en la superficie selenográfica bajo un jammer en la superficie lunar (o elevado), sobre la constelación ilustrativa de fuentes públicas de clase Moonlight/LCNS.

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> El informe <c1/> ya no apoya su contorno de denegación en un único escalar.

# text
# c1: docs/kinds/by-kind/lunar-jamming.md
seg-bcb02ffed4d0 = Fuente: <c1/>

# text
# c1: lunar-jamming
seg-612388918e36 = <c1/> (tipo de escenario)

# text
# c1: jamming
seg-a91a9ad5d8d1 = Jamming de RF nativo lunar: razón interferente-señal por satélite, C/N₀ efectivo y pérdida de enganche para un usuario en la superficie selenográfica bajo un jammer en la superficie lunar (o elevado), sobre la constelación ilustrativa de órbita lunar de clase Moonlight/LCNS de fuentes públicas. Compone la física abierta de jamming existente (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) con la geometría de cielo lunar existente (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); no se vuelve a derivar ninguna geometría ni radiometría. A diferencia del tipo de escenario terrestre <c1/>, el tramo de señal NO es una potencia recibida fija: la potencia recibida isótropa de cada satélite es su propio presupuesto de enlace EIRP − FSPL(distancia oblicua), de modo que el J/S varía de un satélite a otro con la distancia y la elevación lunares. Informa de UNA FILA POR ENLACE (época, satélite) VISIBLE: acimut, elevación, distancia oblicua, ambas potencias recibidas cuya diferencia es el J/S, el J/S, el C/N₀ nominal y efectivo y el estado de enganche, además de cifras de mérito agregadas junto a esa tabla (nunca en su lugar), y la misma tabla como artefacto CSV. Todo campo numérico emitido lleva una unidad y una clase de procedencia. Los subresultados VALIDATED llevan la referencia independiente de su módulo de origen (la ecuación antijamming y el enlace J/S de Kaplan & Hegarty §{ "9.4" }, con referencia externa en tests/gnss_denied_jamming_resilience_reference.rs; la geometría lunar de lunar_service). La propia composición se contrasta con una vía independiente de dos presupuestos de enlace (linkbudget::received_signal_power_dbw, una expresión distinta de pérdida en espacio libre) hasta { "1e-9" } dB. MODELLED: la constelación ilustrativa, el EIRP / la potencia del jammer / las ganancias de antena / la temperatura de ruido representativos, y la ausencia de sombra del terreno, multitrayecto, dinámica de AGC y anulación adaptativa. No es un producto certificado de denegación de servicio. Con un jammer configurado, el informe lleva además un CONTORNO DE DENEGACIÓN CON UNA BANDA DE INCERTIDUMBRE en lugar de un contorno leído de un único escalar: la distribución completa medida del C/N₀ de la señal deseada sobre la tabla por satélite (n, mín., p05, p25, mediana, p75, p95, máx., media, desviación típica muestral y la propia asimetría de la muestra), y el contorno evaluado en cada uno de esos estadísticos de orden bajo AMBOS criterios de denegación que reconoce el motor (el vigente de razón de potencias, J/S = { "30" } dB, como en attack-surface y tracking-loop, y el de pérdida de enganche, con el C/N₀ efectivo cayendo a tracking_threshold_dbhz, el criterio que usa la propia columna de estado de este informe) en ambos ejes del plano de denegación (EIRP de jammer requerido a la distancia de seguridad del escenario, distancia de seguridad de denegación al EIRP del escenario). Los bordes de la banda SON contour(p05) y contour(p95), el mismo mapa de forma cerrada aplicado a los propios cuantiles de la muestra: no una sigma ajustada a la muestra ni la mediana ± k·desviación típica, con la desviación típica emitida por continuidad y no usada por nada. Un cuantil que ya está en el umbral de seguimiento o por debajo no tiene J/S de denegación finito y sus columnas de pérdida de enganche son nulas con una razón contada, nunca un radio acotado artificialmente.

# text
# c1: scenarios/lunar-jamming.toml
seg-6693c3ebcb07 = Una ejecución de <c1/> se resume así: lunar-jamming | { "4" } sat., { "12" } épocas, { "38" } enlaces desde (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (media { "35.622" }) | { "0" } LOST | disponibilidad { "0.167" } de { "0.167" } nominal

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-6e01b6354e40 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/lunar-jamming.toml
seg-c61fb6515ed9 = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-6fe8b3c6c584 = El gráfico que el motor escribe para scenarios/lunar-jamming.toml, tipo de escenario lunar-jamming

# text
seg-d4ae2f589112 = <b>MODELLED</b> Razón interferente-señal, C/N₀ efectivo y pérdida de enganche nativos lunares para un usuario en la superficie selenográfica bajo un jammer en la superficie lunar (o elevado), sobre la ilustr. Referencia independiente (ReferenceImpl): Contraste de la composición con una vía de código independiente dentro del repositorio: cada J/S por enlace se vuelve a derivar como diferencia de dos presupuestos de enlace calculados con linkbudget::received_signal_power_dbw, cuya pérdida en espacio libre es la única expresión { "20" }·log10(4πRf/c) en lugar de la suma de tres términos que usa jamming::free_space_path_loss_db: ambas coinciden hasta < { "1e-9" } dB en cada fila (peor caso medido { "7.11e-14" } dB, es decir, redondeo de coma flotante)

# text
# c1: lunar-jamming
seg-dbe54e7cc800 = <b>MODELLED</b> El informe de <c1/> ya no apoya su contorno de denegación en un único escalar. Emite la distribución completa medida del C/N₀ de la señal deseada sobre la tabla por satélite. Referencia independiente (InternalConsistency): Coherencia interna frente a las propias funciones directas del motor, que es todo lo que esta capacidad puede afirmar con honestidad. Cada punto del contorno es una inversión de forma cerrada, y cada inversión se comprueba devolviendo su resultado por la función DIRECTA con la que se puntuaron las propias filas del informe: la columna de J/S mediante jamming::effective_cn0_dbhz (que debe devolver tracking_threshold_dbhz hasta < { "1e-9" } dB-Hz), la columna de distancia de seguridad

# text
# c1: kshana kinds --json
seg-d48926e62856 = MODELLED: la constelación ilustrativa, el EIRP / la potencia del jammer / las ganancias de antena / la temperatura de ruido representativos, y la ausencia de sombra del terreno, multitrayecto, dinámica de AGC y anulación adaptativa. (catálogo de tipos de escenario (<c1/>))

# text
seg-c455dbcb9f8c = MODELLED. La constelación es la geometría ilustrativa de clase Moonlight/LCNS de fuentes públicas (no las efemérides reales; sin afiliación ni respaldo implícitos), y el modelo de interferencia es un presupuesto de enlace: sin sombra del terreno sobre el jammer (un efecto de primer orden en terreno del polo sur), sin multitrayecto, sin dinámica cerca/lejos de AGC, sin anulación adaptativa, sin histéresis entre adquisición y seguimiento. (comentario del archivo de escenario, líneas { "26" } a { "30" })

# text
seg-da57cc7f1aa4 = El jamming de RF en navegación de superficie lunar (J/S por satélite) es MODELLED, no validado: se comprueba frente a una implementación independiente de esta misma base de código, independiente de la unidad bajo prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-dba1589d3c1e = El contorno de denegación lunar con una banda de incertidumbre a partir de la dispersión medida del C/N₀ es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-a2889fb2b42a = Página temática: <a1>integrations.md</a1>

# text
seg-03b50b21e5a8 = <s1>Anterior</s1>lunar-interop-export

# text
seg-02568469f628 = <s1>Siguiente</s1>lunar-joint-od-clock
