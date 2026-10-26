# docs--kind-eo-radiometry: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-8e62cc4af6ea = Página de tema: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-radiometry.md
seg-841259b04897 = Fuente: <c1/>

# text
# c1: eo-radiometry
seg-1b0ba13fcef1 = <c1/> (tipo de escenario)

# text
seg-816bd5a5808a = Radiometría y calidad de imagen de un generador de imágenes en el nadir: radiancia en la apertura de una escena lambertiana, la ecuación de la cámara, señal y ruido de disparo/oscuridad/lectura/cuantificación y SNR; la MTF del sistema en Nyquist (difracción x detector x arrastre x vibración), la respuesta relativa de borde derivada de ella, Q = lambda F/p y el NIIRS de GIQE versión { "4" } sin compensación de MTF. MODELLED.

# text
# c1: scenarios/eo-radiometry.toml
seg-7d786a7bfb86 = Una ejecución de <c1/> se resume así: eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (well { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

# text
# c1: altitude_m
# c2: focal_length_m
# c3: aperture_m
# c4: pixel_pitch_um
# c5: wavelength_um
# c6: bandwidth_um
# c7: fill_factor
# c8: smear_px
# c9: jitter_px_rms
# c10: reflectance
# c11: solar_irradiance_w_m2_um
# c12: sun_zenith_deg
# c13: atmospheric_transmittance
# c14: path_radiance_w_m2_sr_um
# c15: optics_transmittance
# c16: integration_s
# c17: quantum_efficiency
# c18: dark_current_e_s
# c19: read_noise_e
# c20: full_well_e
# c21: adc_bits
seg-3378b7b0716f = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/eo-radiometry.toml
seg-d613181f3fe3 = El ejemplo <c1/> establece, entre otros:

# text
seg-ffb002276b21 = um

# text
seg-1c15591babed = px

# text
seg-e94f9ad9e6c4 = Etiqueta del resultado (la del motor): MODELLED — radiometría de un generador de imágenes en el nadir (escena lambertiana, ecuación de la cámara, ruido de disparo/oscuridad/lectura/cuantificación), MTF del sistema en Nyquist (difracción x detector x arrastre x vibración), respuesta relativa de borde, Q = lambda F/p y NIIRS de GIQE { "4" } sin compensación de MTF; el NIIRS es una regresión empírica sobre entradas model

# attr:alt
seg-bf7b52f7a01e = El gráfico que escribe el motor para scenarios/eo-radiometry.toml, tipo de escenario eo-radiometry

# text
seg-562a7cf2859c = <b>MODELLED</b> Balance de relación señal-ruido de un generador de imágenes en el nadir (radiancia de escena lambertiana, ecuación de la cámara, ruido de disparo, de oscuridad, de lectura y de cuantificación), la MTF del sistema en Nyquist como producto de la difracción de apertura sin obstrucción, la apertura del detector, el arrastre lineal y gaus

# text
seg-dadea618d757 = <b>MODELLED</b> Balance de relación señal-ruido de un generador de imágenes en el nadir (radiancia de escena lambertiana, ecuación de la cámara, ruido de disparo, de oscuridad, de lectura y de cuantificación), la MTF del sistema en Nyquist como el prod. Referencia independiente (InternalConsistency): Formas cerradas: la MTF de difracción a media frecuencia de corte, el borde en rampa de un píxel de una apertura de detector pura (RER { "1" }), el borde de CDF normal de un desenfoque gaussiano (RER = erf(0.5/(sigma sqrt { "2" }))), el escalado del ruido de disparo, y los coeficientes de GIQE { "4" } tal como se publicaron (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). LO QUE NO ES: no se ha comparado ningún generador de imágenes externo, MTF medida ni imagen calificada; el GIQE es una regresión empírica con su

# text
# c1: label
seg-5182b4b0f8d6 = MODELLED — radiometría de un generador de imágenes en el nadir (escena lambertiana, ecuación de la cámara, ruido de disparo/oscuridad/lectura/cuantificación), MTF del sistema en Nyquist (difracción x detector x arrastre x vibración), respuesta relativa de borde, Q = lambda F/p y NIIRS de GIQE { "4" } sin compensación de MTF; el NIIRS es una regresión empírica sobre entradas modeladas, no una imagen calificada (resultado <c1/>)

# text
seg-aaf9ed3b0899 = La radiometría de generadores de imágenes electroópticos, la MTF, la respuesta relativa de borde y el NIIRS de GIQE { "4" } son MODELLED, no están validados: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-d6c92dc655ab = <s1>Anterior</s1>eo-coverage

# text
seg-a0daef9a496e = <s1>Siguiente</s1>ephemeris

# text
seg-b2f1e6466c2c = Radiometría y calidad de imagen en el nadir de una pequeña cámara de observación de la Tierra ILUSTRATIVA (diseño de ningún operador): apertura de { "0.40" } m, distancia focal de { "3.6" } m (F/9), píxeles de { "5.5" } um, desde { "500" } km. La ejecución da el balance de relación señal-ruido de una escena de reflectancia del { "15" } %, la MTF del sistema en Nyquist, la respuesta relativa de borde y el NIIRS de GIQE versión { "4" }. MODELLED: el NIIRS es una regresión empírica evaluada sobre entradas modeladas, n (comentario del archivo de escenario, líneas { "1" } a { "5" })
