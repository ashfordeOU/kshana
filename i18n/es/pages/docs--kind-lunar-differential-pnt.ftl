# docs--kind-lunar-differential-pnt: translations (es)

# text
seg-9feefecdcf67 = rafs

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-549a6103e711 = bit

# text
# c1: docs/kinds/by-kind/lunar-differential-pnt.md
seg-d0c9bec248b4 = Fuente: <c1/>

# text
# c1: lunar-differential-pnt
seg-d226df2bb634 = <c1/> (tipo de escenario)

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-4b7355b174a3 = Una ejecución de <c1/> se resume así: lunar-differential-pnt | { "8" } sat. (clase LCNS ilustrativa, sin afiliación) | línea base { "50" } km | error de usuario { "24.46" } m → { "0.0077" } m (reducción de { "3186" }×) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-1115464be513 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-3f32e0fea066 = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-8e67df89448a = El gráfico que el motor escribe para scenarios/lunar-differential-pnt.toml, tipo de escenario lunar-differential-pnt

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Estación de referencia diferencial de clase NovaMoon: cancelación de modo común + residuo que crece con la línea base + niveles de protección DGNSS. Referencia independiente (InternalConsistency): Identidad de cancelación de errores diferencial + reutilización de la maquinaria de PL de SBAS DO-229E; la diferencia simple + resolución WLS se contrasta además con lsq()/matinv() de RTKLIB (Takasu, BSD-2-Clause, C compilado): código de resolución independiente, pero con el mismo álgebra de primer orden de la diferencia de LOS, por lo que sigue siendo InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Los tres términos que recoge una corrección diferencial entre la época en que se calcula y la época en que se usa, cada uno dejado antes como margen sin modelar:. Referencia independiente (InternalConsistency): Identidades de forma cerrada y autocoherencia: la varianza step²/12 del cuantizador uniforme, la propagación exacta de covarianza (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ que se reduce a σ·PDOP para σ iguales, la transferencia { "1" }:{ "1" } del término de topografía como consecuencia de û_user ≈ û_ref, y el cierre en cuadratura de la desconexión. La contrastación del PDOP con orbit::dop comparte la matriz normal [−û, { "1" }], por lo que es una comprobación de coherencia y se etiqueta como tal en lugar de una in

# text
# c1: kshana kinds --json
seg-f1e7283d2e15 = MODELLED: identidad de cancelación exacta + modelo de decorrelación de primer orden; no validado con datos reales; sin TRL/herencia/respaldo de ninguna agencia. (catálogo de tipos de escenario (<c1/>))

# text
seg-9d54d8c07ca3 = HONESTIDAD: MODELLED. La cancelación de modo común es una identidad algebraica EXACTA; el residuo de decorrelación espacial es un modelo geométrico de PRIMER ORDEN (la proyección de la diferencia de LOS de un error de órbita inyectado), no un modelo de decorrelación ajustado a partir de seguimiento lunar real. El nivel de protección del usuario REUTILIZA la maquinaria de nivel de protección de SBAS DO-229E (crate::sbas) con la sigma del residuo diferencial como el erro (comentario del archivo de escenario, líneas { "23" } a { "28" })

# text
# c1: correction_link
seg-4156a7515574 = ── EL ENLACE DE CORRECCIÓN ────────────────────────────────────────────────────────────── La identidad anterior supone una corrección PERFECTA: calculada por una estación que sabe exactamente dónde está, entregada al instante, con resolución infinita. Ninguna de las tres cosas se da, y las tres entradas siguientes modelan lo que cuesta cada una. Alimentan SOLO el bloque <c1/> del documento de resultados; con las tres en los valores escritos h (comentario del archivo de escenario, líneas { "57" } a { "62" })

# text
seg-e7f016777e09 = ERROR DE TOPOGRAFÍA. La estación forma su corrección frente a la coordenada que CREE tener. Un error en ella se suma a cada corrección que difunde y llega al usuario como -delta . u_ref, que no contiene ninguna geometría de usuario, de modo que, a diferencia del término de órbita, ni se anula con línea base cero ni crece con la línea base, y se transfiere casi uno a uno a la posición del usuario. El valor por defecto de { "0.30" } m es la propia referencia lunar del crate (comentario del archivo de escenario, líneas { "64" } a { "70" })

# text
seg-e0648d9b52b4 = ENVEJECIMIENTO DE LA CORRECCIÓN. Una corrección calculada en t y aplicada en t+tau queda obsoleta de dos maneras. Órbita: el satélite se ha MOVIDO, de modo que el vector de error de órbita congelado se proyecta ahora sobre una línea de visión rotada; la rotación procede del propio propagador de este crate, así que no se supone en ningún lugar una tasa de error de órbita. Reloj: el reloj del satélite ha derivado c*sigma_y(tau)*tau según la ley de potencias completa de RAFS de crate::clock_specs, calibrada el (comentario del archivo de escenario, líneas { "73" } a { "79" })

# text
seg-7171b2e3f29d = El PNT diferencial lunar es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = El PNT diferencial lunar: presupuesto de residuo del enlace de corrección es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Página temática: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-2b8455001710 = <s1>Anterior</s1>lunar-beacon

# text
seg-dca7482d9d75 = <s1>Siguiente</s1>lunar-frame-campaign

# text
seg-8ac5ac006ae7 = PNT DIFERENCIAL lunar modelado (un análogo lunar de DGNSS/SBAS): una estación de referencia de clase NovaMoon en una ubicación selenográfica CONOCIDA calcula correcciones diferenciales por satélite a partir de una constelación ILLUSTRATIVE de clase Moonlight/LCNS de fuentes públicas (NovaMoon se menciona solo como CLASE de sistema, sin afiliación a la ESA), y un usuario desplazado baseline_km las aplica de modo que los errores de órbita + reloj de MODO COMÚN se cancelan. El término de reloj se cancela EXACTAMENTE (una identidad algebraica); el término de órbita deja solo la proyección de la diferencia de línea de visión, que → { "0" } cuando la línea base → { "0" } (el suelo de decorrelación espacial) y crece ≈ linealmente con la línea base. Informa del error de posición 3D del usuario CON y SIN correcciones, el factor de reducción, la curva de error frente a línea base y un nivel de protección del usuario que REUTILIZA la maquinaria SBAS DO-229E (crate::sbas) con el residuo diferencial σ. MODELLED: identidad de cancelación exacta + modelo de decorrelación de primer orden; no validado con datos reales; sin TRL/herencia/respaldo de ninguna agencia. Determinista si tiene semilla.

seg-e66e2ca31e54 = Página del tema: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-f9d918743ec6 = <s1>Anterior</s1>lunar-descent
