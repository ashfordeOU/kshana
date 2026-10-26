# docs--kind-link-budget: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-a3697ad561db = Hz

# text
seg-cec5c06d38af = <b>MODELLED</b> Relación señal-interferente, C/N₀ efectivo y pérdida de enganche nativos lunares para un usuario en la superficie selenográfica bajo un jammer en la superficie lunar (o elevado), sobre la constelación ilustrativa de fuentes públicas de clase Moonlight/LCNS.

# text
# c1: docs/kinds/by-kind/link-budget.md
seg-120fcc840b87 = Fuente: <c1/>

# text
# c1: link-budget
seg-738aa7d45efb = <c1/> (tipo de escenario)

# text
seg-953188c11165 = Presupuesto de enlace unidireccional sobre la ecuación de enlace CCSDS { "401" } / DSN 810-005: pérdida de trayecto en espacio libre, C/N₀, Eb/N₀, margen y cierre para un EIRP de transmisión, un G/T de recepción, una distancia, una tasa de datos y una banda (s|x|ka) frente a un Eb/N₀ requerido. Un cálculo de ingeniería determinista a partir de las entradas suministradas (no una hoja de datos de terminal calibrada).

# text
# c1: scenarios/link-budget.toml
seg-6697c741d09c = Una ejecución de <c1/> se resume así: link-budget: banda x, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, margen { "92.1" } dB (cierra)

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-2305502051b6 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/link-budget.toml
seg-588476f4ae75 = El ejemplo <c1/> establece, entre otros:

# text
seg-ebb923e1a3b5 = Etiqueta de resultado (la del motor): Presupuesto de enlace unidireccional sobre la ecuación de enlace CCSDS { "401" } / DSN 810-005 (EIRP − FSPL − L_other + G/T − k); un cálculo de ingeniería determinista a partir de las entradas suministradas, NO una hoja de datos de terminal calibrada

# attr:alt
seg-bd375631bc7e = El gráfico que el motor escribe para scenarios/link-budget.toml, tipo de escenario link-budget

# text
seg-4f92669c3946 = <b>VALIDATED</b> Pérdida de trayecto en espacio libre, C/N₀, Eb/N₀, margen y cierre sobre la ecuación de enlace CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distancia/tasa/banda frente a un Eb/N₀ requerido. Pruebas: <a1>one_way_link_budget_reference.rs</a1>.

# text
seg-bfaeb6f1cc5a = <b>VALIDATED</b> Pérdida de trayecto en espacio libre, C/N₀, Eb/N₀, margen y cierre sobre la ecuación de enlace CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distancia/tasa/banda frente a un Eb/N₀ requerido. Runn. Referencia independiente (ExternalDataset): Tabla publicada de control de diseño de telecomunicaciones de espacio profundo como vectores numéricos fijados: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Tabla 1-1 (Galileo banda X): kshana reensambla las partidas de la tabla y reproduce su L_fs de extremo a extremo publicada de { "290.54" } dB y Pr/N0 de { "54.6" } dB-Hz; la pérdida en espacio libre se comprueba además frente a ITU-R P.525

# text
seg-2598c2360113 = <b>MODELLED</b> El informe de presupuesto de enlace declara cada constante absoluta a partir de la cual se calculó su propio margen: la frecuencia de portadora que usó la pérdida en espacio libre, el EIRP, la figura de mérito. Referencia independiente (InternalConsistency): Sin referencia independiente externa: esto es una autodescripción sobre una ecuación ya validada frente a una tabla publicada de control de diseño (véase la fila del presupuesto de enlace unidireccional). Se registra porque su ausencia era un defecto medido: reproducir el d1_rate_gain_beamwidth.csv publicado exigía despejar una constante efectiva hasta { "0.0034" } dB a partir de las treinta filas, y el motor ahora nombra esa combinación y demuestra, mediante una prueba

# text
seg-c779823e860c = Opcional: la temperatura de ruido del sistema de recepción (K). NO es una entrada de la ecuación de enlace, que solo necesita la razón G/T, pero indicarla permite que el informe dé también la ganancia de antena de recepción que implica la figura de mérito (G = G/T + { "10" }*log10(T_sys)). Si se omite, el reparto de ganancia no aparece en el informe en lugar de suponerse. tsys_k = { "300.0" } (comentario del archivo de escenario, líneas { "21" } a { "25" })

# text
seg-d717412c4f06 = La autodescripción del informe de presupuesto de enlace es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-ffbc9de75306 = <s1>Anterior</s1>leo-signal

# text
seg-59d4cb995cb9 = <s1>Siguiente</s1>lunar-attack-surface
