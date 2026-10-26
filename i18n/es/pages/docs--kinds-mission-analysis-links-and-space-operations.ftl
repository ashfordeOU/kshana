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
