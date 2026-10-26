# docs--kind-quantum-anomaly-detect: translations (es)

# text
seg-29e58493fdd4 = Modelado

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-f7f12029e0ec = Página de familia: <a1>Sensores inerciales, de fusión y cuánticos</a1>

# text
seg-496b17a8d3b9 = Página temática: <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> No proporcionado: solo modelos de rendimiento; el hardware de átomos fríos/relojes es del socio. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
# c1: docs/kinds/by-kind/quantum-anomaly-detect.md
seg-836d5102f0d1 = Fuente: <c1/>

# text
# c1: quantum-anomaly-detect
seg-ad4ce0110e8d = <c1/> (tipo de escenario)

# text
seg-04310cd6cbec = Detección de fallos y anomalías MODELLED para sistemas de PNT cuántico: un catálogo etiquetado de fallos (salto de frecuencia, deriva y pérdida de enganche del reloj; escalón de sesgo y pérdida de señal del sensor), un AUC de la ROC del estadístico de detección (con un IC bootstrap de eval_stats, validado externamente) y un fallo mínimo detectable con una tasa fija de falsas alarmas, con el monitor asistido por reloj cuántico (menor ruido) detectando fallos más pequeños, como TradeEvidence honesta + representatividad. Modelo gaussiano del estadístico de detección (AUC = Phi(mu/(sigma*sqrt2))); modela la clase, con parámetros ilustrativos de fuentes públicas, sin TRL, vuelo ni certificación.

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-442310afbb13 = Una ejecución de <c1/> se resume así: quantum-anomaly-detect | AUC cuántico { "0.9908" } frente a clásico { "0.7603" } | fallo mínimo detectable cuántico { "1.312" } frente a clásico { "4.372" } | { "5" } clases de fallo | comparación: el cuántico gana 2/2 | MODELLED

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-335b8d87e27d = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-c2b10c0bdaf8 = El ejemplo <c1/> establece, entre otros:

# text
seg-f44afe581836 = { $version }

# text
seg-25da07e56aa8 = detección de anomalías de PNT cuántico frente a clásico

# attr:alt
seg-2f1d14239d1a = El gráfico que el motor genera para scenarios/quantum-anomaly-detect.toml, tipo de escenario quantum-anomaly-detect

# text
seg-af9aaf95d4f8 = <b>VALIDATED</b> AUC analítico de la ROC binormal = Φ(μ/(σ√{ "2" })) y el fallo mínimo detectable σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) que sustentan los detectores de fallos y anomalías cuánticos. Referencia independiente (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), ambos BSD-3-Clause: bibliotecas independientes que calculan las mismas magnitudes de cola gaussiana y AUC definidas de forma única, coincidentes hasta el suelo de A&S-erf (~{ "7e-8" }). La ventaja cuántico-frente-a-clásico construida encima sigue siendo MODELLED

# text
seg-c37642bb24fe = <b>MODELLED</b> Un objeto TradeEvidence reproducible (marco fijo: escenario+semilla+motor; valores comunes cuántico-frente-a-clásico por cifra de mérito con beneficio de polaridad correcta, opcional { "95" }%. Referencia independiente (InternalConsistency): Identidades de forma cerrada de beneficio y ganador + envoltura fiel del quantum_trade::TradeResult existente; honestidad vinculada al registro de representatividad y a las etiquetas de verificación

# text
seg-b854cedc8a51 = <b>MODELLED</b> Catálogo etiquetado de fallos cuánticos (salto de frecuencia, deriva y pérdida de enganche del reloj; escalón de sesgo y pérdida de señal del sensor), un AUC de la ROC del estadístico de detección con un IC bootstrap, y un mínimo. Referencia independiente (InternalConsistency): AUC gaussiano de forma cerrada = Phi(mu/(sigma*sqrt2)) contrastado con eval_stats::bootstrap_auc_ci, validado externamente (frente a scikit-learn) + umbrales analíticos de detección

# text
# c1: kshana kinds --json
seg-7b465c2bb7cf = Detección de fallos y anomalías MODELLED para sistemas de PNT cuántico: un catálogo etiquetado de fallos (salto de frecuencia, deriva y pérdida de enganche del reloj; escalón de sesgo y pérdida de señal del sensor), un AUC de la ROC del estadístico de detección (con un IC bootstrap de eval_stats, validado externamente) y un fallo mínimo detectable con una tasa fija de falsas alarmas, con el monitor asistido por reloj cuántico (menor ruido) detectando fallos más pequeños, como TradeEvidence honesta + representativ (catálogo de tipos (<c1/>))

# text
seg-7f43972b246d = Detección de fallos y anomalías para sistemas de PNT cuántico: catálogo etiquetado de fallos + AUC de la ROC + fallo mínimo detectable, monitor asistido por reloj cuántico frente a clásico. MODELLED; parámetros ilustrativos de fuentes públicas; modela la clase, sin afirmación de TRL ni de vuelo. (comentario del archivo de escenario, líneas { "1" } a { "3" })

# text
seg-eb75c6a4dcec = La evidencia de la comparación cuántico-frente-a-clásico (forma común) es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-3f92aec2b92a = La detección de fallos y anomalías para sistemas de PNT cuántico es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-6524a69e4835 = <s1>Anterior</s1>pvt

# text
seg-aa689568cf84 = <s1>Siguiente</s1>quantum-gnss-free-nav
