# docs--kind-reentry: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-3a3ee499961e = <b>MODELLED</b> Ascenso plano con viraje por gravedad de un vehículo de varias etapas sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. de { "1976" } (densidad y presión), con una patada de cabeceo, empuje reducido por la contrapresión de la tobera, agotamientos de etapa en s

# text
seg-8e62cc4af6ea = Página de tema: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-195347c63a8a = m/s^{ "2" }

# text
# c1: docs/kinds/by-kind/reentry.md
seg-c95aec0d2943 = Fuente: <c1/>

# text
# c1: reentry
seg-91424dc65b3e = <c1/> (tipo de escenario)

# text
seg-039f77066d97 = Corredor de reentrada balística de Allen-Eggers: desaceleración máxima (independiente del coeficiente balístico, V_e^{ "2" } sin|γ|/(2eH)), la velocidad y la altitud en el máximo de g, y la velocidad de calentamiento máximo, para una velocidad de entrada, un ángulo de trayectoria y un coeficiente balístico a través de una atmósfera exponencial, más una integración plana de masa puntual de la misma entrada balística con gravedad, curvatura terrestre y la Atmósfera Estándar de EE. UU. de { "1976" } (desaceleración máxima, velocidad, altitud y tiempo en el máximo). Entrada balística (sin sustentación) MODELLED; la salida de calentamiento es la VELOCIDAD de calentamiento máximo, no un flujo de calor (sin modelo aerotérmico ni de TPS).

# text
# c1: scenarios/reentry.toml
seg-9908d06c50eb = Una ejecución de <c1/> se resume así: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> máximo { "16.6" } g a { "49" } km, { "4731" } m/s; el calentamiento alcanza su máximo a { "6603" } m/s; masa puntual (gravedad, curvatura, US76) máximo { "16.4" } g (balística MODELLED, sin modelo aerotérmico)

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-f057c2a160e7 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/reentry.toml
seg-576245fd5b70 = El ejemplo <c1/> establece, entre otros:

# text
seg-0b7769c97ff3 = Etiqueta del resultado (la del motor): MODELLED — entrada balística (sin sustentación) de Allen–Eggers, atmósfera exponencial isoterma, ángulo de trayectoria constante; el máximo de g es independiente del coeficiente balístico; el calentamiento es la VELOCIDAD de calentamiento máximo, NO un flujo de calor (sin modelo aerotérmico ni de TPS)

# attr:alt
seg-b0109481e8ff = El gráfico que el motor genera para scenarios/reentry.toml, tipo de escenario reentry

# text
seg-c860b8679b47 = <b>MODELLED</b> Desaceleración máxima (independiente del coeficiente balístico), velocidad y altitud en el máximo de g, y velocidad de calentamiento máximo para una entrada balística en una atmósfera exponencial. Pruebas: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

# text
seg-84abc0b9f859 = <b>MODELLED</b> Desaceleración máxima (independiente del coeficiente balístico), velocidad y altitud en el máximo de g, y velocidad de calentamiento máximo para una entrada balística en una atmósfera exponencial. R. Referencia independiente (InternalConsistency): Entrada analítica de Allen–Eggers de forma cerrada, contrastada además con una integración numérica con solve_ivp (DOP853) de scipy { "1.18" } de la MISMA EDO de entrada con solo arrastre (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, peor a_max rel { "2.9e-9" }): una comprobación de integral numérica frente a su propia forma analítica, de modo que sigue siendo InternalConsistency, NO una validación externa. Balística (sin sustentación) MODELLED, sin modelo aerotérmico ni de TPS: la salida de calentamiento es una ve

# text
# c1: label
seg-8b9d3db5d563 = MODELLED — entrada balística (sin sustentación) de Allen–Eggers, atmósfera exponencial isoterma, ángulo de trayectoria constante; el máximo de g es independiente del coeficiente balístico; el calentamiento es la VELOCIDAD de calentamiento máximo, NO un flujo de calor (sin modelo aerotérmico ni de TPS) (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-82de2275c919 = Entrada balística (sin sustentación) MODELLED; la salida de calentamiento es la VELOCIDAD de calentamiento máximo, no un flujo de calor (sin modelo aerotérmico ni de TPS). (catálogo de tipos (<c1/>))

# text
seg-080b28422342 = ALCANCE HONESTO: balística (sin sustentación) MODELLED, atmósfera exponencial isoterma, ángulo de trayectoria constante. Sin modelo aerotérmico ni de TPS: la salida de calentamiento es la VELOCIDAD de calentamiento máximo, no un flujo de calor. No es una trayectoria de 3 ni de 6 grados de libertad. Ejecución: kshana scenarios/reentry.toml (comentario del archivo de escenario, líneas { "8" } a { "11" })

# text
seg-cfc345f0dc0d = El corredor de reentrada balística (Allen–Eggers) es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-a4b7c16e3fea = <s1>Anterior</s1>realtime-frame-eop

# text
seg-6166a1c21525 = <s1>Siguiente</s1>slot-timing

seg-33b3bf4992c9 = <b>MODELLED</b> La fase <c1/>: la deriva de regreso de <c2/> sin maniobra, que termina en la interfaz de entrada; el ángulo de trayectoria de vuelo y su sigma a partir de la covarianza completa mediante un gradiente por diferencias finitas; la probabilidad de que el ángulo esté dentro de un co
