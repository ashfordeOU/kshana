# docs--kind-quantum-gnss-free-nav: translations (es)

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro de interferómetro de átomos fríos a partir de primeros principios (k_eff·T², QPN). Referencia independiente (ExternalDataset): vectores numéricos publicados de artículos primarios de CAI (función de transferencia de Cheinet { "2008" }; sensibilidad de Peters/Freier): k_eff·T² coincide exactamente, el suelo unilateral de la ASD de ruido de disparo dentro de ~{ "2" }× de cada instrumento publicado (los dispositivos reales llevan ruido técnico por encima del suelo cuántico). Una cota, no una paridad. { "0.30" } ronda { "2" } (preregistrada fcb9ac64), un hallazgo (sigue siendo MODELLED): el ruido de rotación solo de QPN frente al medido por Gauguet et al.

# text
seg-9955b1b1c018 = El rendimiento de un sensor inercial cuántico es MODELLED, no está validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página de familia: <a1>Sensores inerciales, de fusión y cuánticos</a1>

# text
seg-496b17a8d3b9 = Página temática: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Página temática: <a1>QUANTUM.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> No proporcionado: solo modelos de rendimiento; el hardware de átomos fríos/relojes es del socio. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Un objeto TradeEvidence reproducible (marco fijo: escenario+semilla+motor; valores comunes cuántico-frente-a-clásico por cifra de mérito con beneficio de polaridad correcta, opcional { "95" }%. Referencia independiente (InternalConsistency): Identidades de forma cerrada de beneficio y ganador + envoltura fiel del quantum_trade::TradeResult existente; honestidad vinculada al registro de representatividad y a las etiquetas de verificación

# text
seg-eb75c6a4dcec = La evidencia de la comparación cuántico-frente-a-clásico (forma común) es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-gnss-free-nav.md
seg-bfbcc7e8f620 = Fuente: <c1/>

# text
# c1: quantum-gnss-free-nav
seg-cfa59601df4a = <c1/> (tipo de escenario)

# text
seg-790fbfdd80f0 = Navegación cuántica sin GNSS MODELLED: durante una interrupción de GNSS, un presupuesto inercial cuántico (interferómetro de átomos fríos) frente a un INS clásico de grado de navegación: crecimiento del error de posición durante la deriva, holdover hasta un umbral de posición, y la comparación cuántico-frente-a-clásico como TradeEvidence honesta con representatividad. Nota honesta de observabilidad: sin una fijación externa, el sesgo del acelerómetro no es observable, por lo que el error crece; el sensor cuántico reduce esa brecha pero no la cierra. Parámetros de dispositivo ilustrativos de fuentes públicas; modela la clase, sin TRL, vuelo ni certificación.

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-dd74f248373d = Una ejecución de <c1/> se resume así: quantum-gnss-free-nav | interrupción 300s | error de posición cuántico { "0.00" } m frente a clásico { "37.31" } m (8289.5x) | holdover cuántico 44721s frente a clásico 534s (umbral { "100" } m) | comparación: el cuántico gana 2/2 | MODELLED

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-960491d74173 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-88d9dfe0353a = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-1bdbf1a737b2 = El gráfico que el motor genera para scenarios/quantum-gnss-free-nav.toml, tipo de escenario quantum-gnss-free-nav

# text
seg-d196391dcf4f = <b>MODELLED</b> Navegación por estima con INS cuántico (interferómetro de átomos fríos) frente a INS clásico de grado de navegación durante una interrupción de GNSS: crecimiento del error de posición, holdover hasta un umbral de posición,. Referencia independiente (InternalConsistency): Presupuestos inerciales reutilizados contrastados con una doble integración independiente en Octave de la misma EDO de navegación por estima (distinto entorno de ejecución, modelo compartido → ReferenceImpl) más el ruido a corto plazo publicado de Freier-2016 como ancla unilateral; el compuesto cuántico-frente-a-clásico sigue siendo MODELLED

# text
# c1: kshana kinds --json
seg-af35cccc4e2c = Navegación cuántica sin GNSS MODELLED: durante una interrupción de GNSS, un presupuesto inercial cuántico (interferómetro de átomos fríos) frente a un INS clásico de grado de navegación: crecimiento del error de posición durante la deriva, holdover hasta un umbral de posición, y la comparación cuántico-frente-a-clásico como TradeEvidence honesta con representatividad. (catálogo de tipos (<c1/>))

# text
seg-9b9ce7600ffc = Navegación cuántica sin GNSS: navegación por estima con INS cuántico (interferómetro de átomos fríos) frente a INS clásico de grado de navegación durante una interrupción de GNSS. MODELLED; parámetros de dispositivo ilustrativos de fuentes públicas; modela la clase, sin afirmación de TRL ni de vuelo. (comentario del archivo de escenario, líneas { "1" } a { "3" })

# text
seg-9d67411151e3 = La navegación cuántica sin GNSS es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-e1d502e1ed6d = <s1>Anterior</s1>quantum-anomaly-detect

# text
seg-1f3705925b3c = <s1>Siguiente</s1>quantum-time-transfer
