# docs--kinds-mission-analysis-links-and-space-operations: translations (es)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-cb9447893c7f = Un satélite sobre una estación: la distancia oblicua, la elevación y el Es/N0 de cada paso a lo largo del paso, el MODCOD de DVB-S2 elegido en cada paso (umbrales de la tabla { "13" } de ETSI EN { "302" } 307-1 más un margen de implementación) y el volumen de datos que mueve ACM frente a la línea base de codificación constante que cierra en la máscara. MODELLED.

# attr:alt
seg-046f69293874 = El gráfico que escribe el motor para scenarios/acm-link.toml, tipo de escenario acm-link

# text
seg-7eff466eb018 = Control de actitud de una nave espacial: un giro de apuntamiento inercial de un cuerpo central rígido con tres o más ruedas de reacción equilibradas bajo realimentación MRP (L = -K sigma - P omega), con pares de rueda de norma mínima recortados al límite de cada motor, RK4 con retenedor de orden cero; opcionalmente cerrado sobre un EKF multiplicativo a partir de un giróscopo simulado (paseo aleatorio de ángulo y de velocidad) y un seguidor de estrellas. Informa del tiempo de asentamiento, del error de apuntamiento final y máximo, de la velocidad y el par máximos de las ruedas, de la fracción saturada, de la deriva del momento angular y, con el estimador, de su error de actitud y su NEES. El bucle de estado verdadero es VALIDATED frente a Basilisk { "2.9.1" }; el estimador es MODELLED.

# attr:alt
seg-08c624d5324d = El gráfico que escribe el motor para scenarios/aocs-slew.toml, tipo de escenario aocs

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Ciclo de trabajo de apertura: el reparto de tiempo entre navegación y comunicaciones que implica un plan de contactos para un conjunto de aperturas orientables. Toma un plan de contactos (una lista de ventanas aos_s/los_s de <c1/>, cada una de las cuales solicita navegación o comunicaciones — el mismo vocabulario aos_s/los_s que emite el predictor <c2/>), un número de aperturas y una POLÍTICA DE ARBITRAJE (prioridad de navegación por defecto, o prioridad de comunicaciones, o el primero en llegar sin apropiación), e informa del ciclo de trabajo de navegación, del de comunicaciones, del de inactividad y de la interrupción por sesión — el tiempo de contacto que una sesión solicitó y ninguna apertura atendió. Un barrido exacto de intervalos sobre los límites de las ventanas, de modo que las ventanas contiguas nunca compiten y ningún segundo de apertura se cuenta dos veces; los segundos de apertura de navegación, de comunicaciones y de inactividad se acumulan por separado y cierran frente a apertures*horizon_s. El informe indica la política resuelta, su definición completa y las definiciones de ciclo de trabajo y de interrupción, porque una cifra de ciclo de trabajo citada sin su política de arbitraje no es reproducible. Aritmética de planificación MODELLED: no se cobra ningún tiempo de giro, resintonización o cambio cuando una apertura cambia de servicio o de sesión, no interviene en la decisión ningún volumen de datos, estado de búfer, balance de energía ni cierre de enlace, y las ventanas de contacto son entradas — su geometría es la que las produjo. No es un producto de planificación de segmento terreno.

# attr:alt
seg-a8b38ed8e029 = El gráfico que escribe el motor para scenarios/aperture-duty-cycle.toml, tipo de escenario aperture-duty-cycle

# text
seg-34d041d6bd9f = Ascenso plano con viraje por gravedad de un vehículo de varias etapas sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. de { "1976" } (ascenso vertical, patada de cabeceo, empuje a lo largo de la velocidad), integrando las pérdidas por gravedad, resistencia, guiado y contrapresión y comprobando que el dv ideal menos las pérdidas coincide con la velocidad de agotamiento; max-Q, aceleración máxima y estado de agotamiento. MODELLED.

# attr:alt
seg-ccf2185b0b5e = El gráfico que escribe el motor para scenarios/ascent-losses.toml, tipo de escenario ascent-losses

# text
seg-62c0dda9fc56 = Balance de errores de actitud y apuntamiento en 3 grados de libertad: el par de perturbación de gradiente de gravedad en el peor caso ((3/2)(μ/R³)ΔI) y un balance de error de apuntamiento por raíz de la suma de cuadrados sobre contribuyentes con nombre de 1σ (ruido de sensor, vibración de ruedas de reacción, térmico, alineación) con el término dominante, para una altitud orbital y una dispersión de inercia del cuerpo. Balance AOCS escalar MODELLED — un complemento previo al hardware de Basilisk/42, no una simulación de bucle de control, de 6 grados de libertad ni de modos flexibles.

# attr:alt
seg-ad0e72e3b688 = El gráfico que escribe el motor para scenarios/attitude-budget.toml, tipo de escenario attitude-budget

# text
seg-be4e928a5865 = Planificación de contactos con tierra para varios satélites sobre varias estaciones: ventanas de acceso aparentes (SGP4, marco fijo a la Tierra IAU 2006/2000A, refracción ITU-R P.834, tiempo de luz), el volumen de datos ACM de DVB-S2 de cada paso (umbrales de la tabla { "13" } de ETSI EN { "302" } 307-1) y un calendario sin conflictos (un satélite por antena con un tiempo de giro, una estación por satélite, entrega ponderada por prioridad limitada a cada acumulación pendiente) mediante un voraz de valor marginal, una línea base de primero en llegar y una ramificación y acotación exacta en conjuntos pequeños, con la brecha de optimalidad del voraz. MODELLED.

# attr:alt
seg-e26b549579e2 = El gráfico que escribe el motor para scenarios/contact-schedule.toml, tipo de escenario contact-schedule

# text
seg-b843e2e0a4ee = Entrada atmosférica de masa puntual en 3 grados de libertad sobre una Tierra o un Marte esféricos en rotación (balística o con sustentación a ángulo de alabeo constante), RK4, a través de US76, una atmósfera exponencial o la de Marte, con calentamiento convectivo en el punto de estancamiento de Sutton-Graves (NASA TR R-376): desaceleración, flujo de calor y presión dinámica máximos, carga térmica, alcance, una comprobación de energía en el marco rotatorio y la forma cerrada de Allen-Eggers a su lado. La desaceleración máxima se contrasta con el nominal publicado de Stardust; el calentamiento es MODELLED.

# attr:alt
seg-dbb618cd6357 = El gráfico que escribe el motor para scenarios/entry-heating-stardust.toml, tipo de escenario entry-heating

# text
seg-47b4aea6ed01 = Huella y geometría de cobertura de una carga útil de observación de la Tierra (triángulo espacial de SMAD): radio angular de la Tierra, anchura de franja, distancia de muestreo en el suelo en el nadir, acceso máximo fuera del nadir, periodo circular, periodo nodal con J2 y separación de trazas en tierra en el ecuador con un indicador de cobertura contigua, para una altitud orbital, una inclinación (heliosíncrona por defecto) y un FOV/IFOV del sensor. Geometría MODELLED de Tierra esférica (sin radiometría/MTF/atmósfera/vibración/destello); separación de nodos R_e·(ω − Ω̇)·T_nodal con tasas seculares de J2 de primer orden.

# attr:alt
seg-c2a8332f2ee2 = El gráfico que escribe el motor para scenarios/eo-coverage.toml, tipo de escenario eo-coverage

# text
seg-816bd5a5808a = Radiometría y calidad de imagen de un generador de imágenes en el nadir: radiancia en la apertura de una escena lambertiana, la ecuación de la cámara, señal y ruido de disparo/oscuridad/lectura/cuantificación y SNR; la MTF del sistema en Nyquist (difracción x detector x arrastre x vibración), la respuesta relativa de borde derivada de ella, Q = lambda F/p y el NIIRS de GIQE versión { "4" } sin compensación de MTF. MODELLED.

# attr:alt
seg-bf7b52f7a01e = El gráfico que escribe el motor para scenarios/eo-radiometry.toml, tipo de escenario eo-radiometry

# text
seg-7a4e6215a488 = Geometría de lanzamiento y ascenso de dos cuerpos: acimut(s) de lanzamiento (sin Az = cos i / cos lat), inclinación mínima alcanzable, velocidad circular, la bonificación hacia el este de la rotación terrestre, Δv de cambio de plano en dogleg cuando la inclinación objetivo es inferior a la latitud del emplazamiento, y el número de oportunidades de lanzamiento diarias. Geometría de Tierra esférica MODELLED (sin corrección del triángulo de velocidades de Tierra en rotación, sin modelo de pérdidas de ascenso/arrastre).

# attr:alt
seg-9696283a95ae = El gráfico que el motor escribe para scenarios/launch-window.toml, tipo de escenario launch-window

# text
seg-953188c11165 = Presupuesto de enlace unidireccional sobre la ecuación de enlace CCSDS { "401" } / DSN 810-005: pérdida de trayecto en espacio libre, C/N₀, Eb/N₀, margen y cierre para un EIRP de transmisión, un G/T de recepción, una distancia, una tasa de datos y una banda (s|x|ka) frente a un Eb/N₀ requerido. Un cálculo de ingeniería determinista a partir de las entradas suministradas (no una hoja de datos de terminal calibrada).

# attr:alt
seg-bd375631bc7e = El gráfico que el motor escribe para scenarios/link-budget.toml, tipo de escenario link-budget

# text
seg-dbffff25b57f = Puente de interoperabilidad CCSDS OEM: importa un Orbit Ephemeris Message producido por una herramienta externa de dinámica de vuelo (GMAT/Orekit/STK emiten todas OEM) e indica sus segmentos, objetos, marcos y rango de épocas, más una comprobación de coherencia de velocidad; sin entrada, hace un recorrido de ida y vuelta de una órbita de referencia generada e indica la fidelidad entre importación y exportación. Comprobación de ingesta estructural y física MODELLED, NO una validación de la precisión orbital de la fuente.

# attr:alt
seg-5db5a7c812ca = El gráfico que el motor genera para scenarios/oem-interop.toml, tipo de escenario oem-interop

# text
seg-039f77066d97 = Corredor de reentrada balística de Allen-Eggers: desaceleración máxima (independiente del coeficiente balístico, V_e^{ "2" } sin|γ|/(2eH)), la velocidad y la altitud en el máximo de g, y la velocidad de calentamiento máximo, para una velocidad de entrada, un ángulo de trayectoria y un coeficiente balístico a través de una atmósfera exponencial, más una integración plana de masa puntual de la misma entrada balística con gravedad, curvatura terrestre y la Atmósfera Estándar de EE. UU. de { "1976" } (desaceleración máxima, velocidad, altitud y tiempo en el máximo). Entrada balística (sin sustentación) MODELLED; la salida de calentamiento es la VELOCIDAD de calentamiento máximo, no un flujo de calor (sin modelo aerotérmico ni de TPS).

# attr:alt
seg-b0109481e8ff = El gráfico que el motor genera para scenarios/reentry.toml, tipo de escenario reentry

# text
seg-de2448d74c2b = Entramado del CCSDS 133.0-B Space Packet Protocol: codifica un flujo sintético de paquetes TM/TC (cabecera primaria de 6 octetos + campo de datos) e indica la decodificación de la cabecera por paquete, el total de octetos y un recorrido de ida y vuelta exacto de codificación↔decodificación. Entramado determinista de disposición exacta de bits: la capa de interoperabilidad de formato de paquete de las agencias; NO una certificación de ajuste a la norma (sin lógica de cabecera secundaria, CRC ni segmentación más allá de los indicadores).

# attr:alt
seg-af1cf9aa9938 = El gráfico que el motor genera para scenarios/space-packet.toml, tipo de escenario space-packet

# text
seg-4e31c8daf798 = Registro

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
# c1: docs/kinds/mission-analysis-links-and-space-operations.md
seg-69ee217ed8e0 = Fuente: <c1/>

# text
seg-f5091cbeecbf = Análisis de misión, enlaces y operaciones espaciales (familia de tipos de escenario)

# text
seg-d0eea6d9d1ad = { "14" } tipos de escenario del motor v{ $version }. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
# c1: kshana scenarios/launch-window.toml
seg-6481dabc9458 = Páginas temáticas: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Ejecute uno: <c1/>. Todas las familias: <a4>KINDS.md</a4>.

# attr:alt
seg-d6c5a581ffaf = Hoja de contactos de los gráficos que genera el motor para los tipos de escenario de la familia Análisis de misión, enlaces y operaciones espaciales

# text
seg-8d65a4a1948d = Geometría de lanzamiento y ascenso de dos cuerpos: acimut(es) de lanzamiento (sin Az = cos i / cos lat), inclinación mínima alcanzable, velocidad circular, la bonificación hacia el este por la rotación terrestre, Δv de cambio de plano en dogleg cuando el

# text
seg-dd47e755d262 = Ascenso plano con viraje gravitatorio de un vehículo de varias etapas sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. { "1976" } (ascenso vertical, golpe de cabeceo, empuje a lo largo de la velocidad), integrando la grav

# text
seg-cc88f37328a3 = Corredor de reentrada balística de Allen-Eggers: deceleración máxima (independiente del coeficiente balístico, V_e^{ "2" } sin/γ//(2eH)), la velocidad y la altitud en el pico de g y la velocidad de calentamiento máximo, para una velocidad de entrada

# text
seg-8ad7c34d8c25 = Entrada atmosférica de masa puntual de 3 grados de libertad sobre una Tierra o un Marte esféricos en rotación (balística o con sustentación a ángulo de alabeo constante), RK4, a través de US76, una atmósfera exponencial o la atmósfera de Marte, con estagnación de Sutton-Graves

# text
seg-efe896d3f43b = Geometría de huella y cobertura de la carga útil de observación de la Tierra (triángulo espacial de SMAD): radio angular de la Tierra, anchura de la franja, distancia de muestreo en el suelo en el nadir, acceso máximo fuera del nadir, periodo circular, periodo nodal por J2

# text
seg-d3d9652fd8a0 = Radiometría y calidad de imagen de un generador de imágenes en el nadir: radiancia a la apertura de una escena lambertiana, la ecuación de la cámara, señal y ruido de disparo/oscuridad/lectura/cuantización y SNR; la MTF del sistema en Nyquist (difracción

# text
seg-1940d5c75a98 = Presupuesto de error de actitud y apuntamiento de 3 grados de libertad: el par perturbador de gradiente de gravedad en el peor caso ((3/2)(μ/R³)ΔI) y un presupuesto de error de apuntamiento por suma cuadrática sobre contribuyentes nombrados de 1σ (ruido del sensor, reacción

# text
seg-e00d18fbb52b = Control de actitud de una nave espacial: un giro de apuntamiento inercial de un cuerpo rígido con tres o más ruedas de reacción equilibradas bajo realimentación MRP (L = -K sigma - P omega), pares de rueda de norma mínima recortados a cada

# text
seg-496fa280de7b = Presupuesto de enlace unidireccional según la ecuación de enlace CCSDS { "401" } / DSN 810-005: pérdida de trayecto en espacio libre, C/N₀, Eb/N₀, margen y cierre para una EIRP de transmisión, G/T de recepción, distancia, velocidad de datos y banda (s/x/ka) frente a un

# text
seg-f0aca7ea1ffa = Un satélite sobre una estación: la distancia oblicua, la elevación y el Es/N0 de cada pasada a lo largo de ella, el MODCOD de DVB-S2 elegido en cada paso (umbrales de ETSI EN { "302" } 307-1 Tabla { "13" } más un margen de implementación)

# text
seg-44c4890ba07e = Planificación de contactos con tierra para varios satélites sobre varias estaciones: ventanas de acceso aparentes (SGP4, marco terrestre IAU 2006/2000A, refracción ITU-R P.834, tiempo de luz), el volumen de datos DVB-S2 ACM de

# text
seg-19ab136e9f9b = Ciclo de trabajo de la apertura: el reparto de tiempo entre navegación y comunicaciones que implica un plan de contactos para un conjunto de aperturas orientables.

# text
seg-ee0c649ca8b2 = Encapsulado del Space Packet Protocol de CCSDS 133.0-B: codifica un flujo sintético de paquetes TM/TC (cabecera primaria de 6 octetos + campo de datos) e informa de la decodificación de la cabecera de cada paquete, los octetos totales y una coincidencia exacta de codificación↔decodificación

# text
seg-e561f3a749db = Puente de interoperabilidad CCSDS OEM: importa un Orbit Ephemeris Message producido por una herramienta externa de dinámica de vuelo (GMAT/Orekit/STK emiten todas OEM) e informa de sus segmentos/objetos/marcos/intervalo de épocas además

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-1f074d7beccc = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-8f65824c39c5 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>launch-window</a1>.

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-2926bde689d3 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-66f6489411d0 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>ascent-losses</a1>.

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-481ce1d98bc7 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-fff98550eb48 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>reentry</a1>.

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-9cf8d4b6064f = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-84e1bddcbc95 = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "1" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>entry-heating</a1>.

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-eab43348803e = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-9c6ce756a89a = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>eo-coverage</a1>.

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
seg-cd84a7bdbe57 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-320d724ac797 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>eo-radiometry</a1>.

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-905487bf50f1 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-14511e367361 = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>attitude-budget</a1>.

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
# c6: duration_s
# c7: dt_s
# c8: sample_s
# c9: omega0_rad_s
# c10: pointing_threshold_deg
# c11: estimator
seg-540fa1932dad = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Opcionales: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-6d2e9b9ce87f = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "1" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>aocs</a1>.

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-3345731b5729 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-f8b896b81014 = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "1" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>link-budget</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-e38e356f4b71 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-eed876ed5aab = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>acm-link</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-5fddd2460fb0 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-58d00faa1eda = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>contact-schedule</a1>.

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-5d4f6861f301 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1e06e06d4325 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>aperture-duty-cycle</a1>.

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-9bb424e01c84 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-688071019c9e = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>space-packet</a1>.

# text
# c1: oem_text
seg-03c06f9fdc85 = Campos obligatorios: ninguno. Opcional: <c1/>.

# text
seg-568c484ce9a0 = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>oem-interop</a1>.

# text
seg-41996765fcf1 = <s1>Anterior</s1>Lunar y cislunar

# text
seg-1951c46fe429 = <s1>Siguiente</s1>PNT óptico
