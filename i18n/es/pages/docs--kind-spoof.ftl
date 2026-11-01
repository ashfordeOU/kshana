# docs--kind-spoof: translations (es)

# text
seg-f42465f7d066 = ns

# text
seg-debc2f07db78 = true

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Página de tema: <a1>INTEGRITY.md</a1>

# text
seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Reloj óptico de red de estroncio, objetivo orientado al espacio sigma_y

# text
seg-b9174c70772f = <b>MODELLED</b> Chi-cuadrado asistido por reloj, RAIM, AGC, FoM de seguridad por época fusionada con SQM. Referencia independiente (ExternalDataset): parámetros de escenario de TEXBAT (Humphreys { "2012" }) — caracterización, no vectores fijados. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): en JammerTest { "2024" } (Bleik; datos GPL-3.0) los monitores de nivel de observable (chi-cuadrado asistido por reloj, RAIM, fallo de solución) no dieron ninguna alarma dentro de { "10" } s de ninguno de los { "8" } inicios de suplantación publicados evaluables (donde la ventana previa al inicio estaba limpia, la primera alarma llegó entre { "10.2" } y { "39" } s después del pu

# text
seg-e4b64d7277da = La detección de spoofing es MODELLED, no está validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-ee7dd15019d0 = Página de tema: <a1>CAMPAIGNS.md</a1>

# text
seg-5a70fcb097dc = Campos opcionales: ninguno

# text
seg-304496607bd7 = Tipo de escenario del motor v{ $version }, familia <a1>Jamming, spoofing y el espectro</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-5d23d7f8f872 = Página de familia: <a1>Jamming, spoofing y el espectro</a1>

# text
seg-03d8dc3de7ca = <b>MODELLED</b> χ² asistido por reloj, RAIM, AGC y SQM fusionados en una cifra de mérito de seguridad por época Pruebas: <a1>spoof_texbat_validation.rs</a1>.

# text
# c1: docs/kinds/by-kind/spoof.md
seg-09125f609abe = Fuente: <c1/>

# text
# c1: spoof
seg-8bf73eca4115 = <c1/> (tipo de escenario)

# text
seg-cbd77f6ffd63 = Detector estocástico de spoofing de tiempo (Neyman–Pearson / χ²₁) con P_fa/P_md por Monte Carlo.

# text
# c1: scenarios/spoof-attack.toml
seg-2a1e4e7893ba = Una ejecución de <c1/> se resume así: escenario 2b6bd22c3b80 | spoof LinearRamp { "{" } rate_ns_per_s: { "0.1" } { "}" } frente a especificación de { "20.000" } ns (P_fa { "0.010" }) | seguridad cuántica { "1.000" } (P_md { "0.000" }, MC { "0.000" }) detectado a 70s | seguridad clásica { "0.558" } (P_md { "0.442" }, MC { "0.444" }) detectado a 430s

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-b577342dfe39 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/spoof-attack.toml
seg-adb7ff15a702 = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-6f6a8c975111 = El gráfico que el motor genera para scenarios/spoof-attack.toml, tipo de escenario spoof

# text
# c1: leo-pass
# c2: [spoofer]
seg-ecc2dc8489bb = <b>MODELLED</b> La sección <c2/> del tipo de escenario <c1/>: un spoofer falsifica, de forma autoconsistente en distancia y en tasa de distancia, las señales vistas en una posición declarada que salta y, o, es desplazada de la verdadera tras un inicio (por banda LEO y para la MEO Pruebas: <a1>leo_resilience_verticals.rs</a1>.

# text
# c1: [spoofer]
seg-8b3523b5fa2c = <b>MODELLED</b> Para cada satélite LEO y cada par de bandas de medida de distancia, la sección <c1/> forma la combinación de pseudodistancia libre de geometría, elimina el modelo ionosférico del receptor y contrasta su escalón entre épocas con el ruido de código de las dos bandas y un Pruebas: <a1>leo_resilience_verticals.rs</a1>.

# text
seg-e5bbd2fca4fb = <s1>Anterior</s1>spoof-detect

# text
seg-8d3311751876 = <s1>Siguiente</s1>sweep-nd
