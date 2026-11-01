# docs--kind-impairment-eval: translations (es)

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
# c1: docs/kinds/by-kind/impairment-eval.md
seg-2e6b437f3e99 = Fuente: <c1/>

# text
# c1: impairment-eval
seg-134407946837 = <c1/> (tipo de escenario)

# text
seg-304496607bd7 = Tipo de escenario del motor v{ $version }, familia <a1>Jamming, spoofing y el espectro</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-98e740d32860 = Banco de pruebas de evaluación de detección de deterioros de RF mediante aprendizaje automático ({ "13494" }): genera un corpus SINTÉTICO etiquetado y fundamentado en parámetros (nominal/jamming/spoof-time/spoof-position/multipath), puntúa un detector (energy|agc|sqm|parity|fused) con el arnés independiente del detector, e informa de AUC/ROC/confusión + Pd por clase a una Pfa objetivo, además de la brecha de optimismo dentro frente a fuera de la distribución. Solo características operativas MODELLED: nunca de campo/IQ, sin veredicto bueno/malo.

# text
# c1: scenarios/impairment-eval.toml
seg-41c3f9559282 = Una ejecución de <c1/> se resume así: impairment-eval | detector fused(max-z) | AUC { "0.998" } dentro / { "0.981" } fuera (brecha { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ objetivo { "0.05" } | { "1000" } casos | MODELLED sintético

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-9b0d7ebaa1f0 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/impairment-eval.toml
seg-283510d17885 = El ejemplo <c1/> establece, entre otros:

# text
seg-6a64be3b3f07 = fused

# text
seg-3db71c5bdd0a = auc_out usa un régimen fuera de ajuste más sutil

# text
seg-667d26b3a2fe = Etiqueta de resultado (la del motor): MODELLED: corpus sintético fundamentado en parámetros (nunca de campo/IQ); solo características operativas, sin veredicto bueno/malo

# attr:alt
seg-7e7b07bc5545 = El gráfico que el motor escribe para scenarios/impairment-eval.toml, tipo de escenario impairment-eval

# text
seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, empates ½), matriz de confusión en el umbral, P_d/P_md/P_fa/precisión/exactitud/F1 Pruebas: <a1>eval_metrics_reference.rs</a1>.

# text
seg-ceedc14c623a = <b>VALIDATED</b> AUC de ROC + IC bootstrap que separan anomalías reales etiquetadas; detector transparente (reproduce las etiquetas) Pruebas: <a1>opssat_ad_reference.rs</a1>.

# text
seg-0ee5b31cfd09 = <b>MODELLED</b> Corpus sintético etiquetado de deterioros + arnés ROC/AUC/confusión/Pfa-Pmd independiente del detector; protección contra fugas, división estratificada, informe de optimismo por cambio de distribución (dentro frente a fuera de régimen).

# text
seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, empates ½), matriz de confusión en el umbral, P_d/P_md/P_fa/precisión/exactitud/F1. Referencia independiente (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }): biblioteca independiente, coincidencia exacta

# text
seg-c719d4060e1a = <b>MODELLED</b> Corpus sintético etiquetado de deterioros + arnés ROC/AUC/confusión/Pfa-Pmd independiente del detector; protección contra fugas, división estratificada, distribución-shift (dentro frente a fuera de r. Referencia independiente (InternalConsistency): Cotas de AUC de forma cerrada (Mann–Whitney) + un detector de referencia perfecta; el corpus es SINTÉTICO (fundamentado en parámetros, no de campo/IQ)

# text
# c1: label
seg-5565108cc4d1 = MODELLED: corpus sintético fundamentado en parámetros (nunca de campo/IQ); solo características operativas, sin veredicto bueno/malo (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-d2a9f35ea8cc = Solo características operativas MODELLED: nunca de campo/IQ, sin veredicto bueno/malo. (catálogo de tipos de escenario (<c1/>))

# text
seg-376f86fbdcb7 = ALCANCE HONESTO: solo características operativas MODELLED. El corpus es sintético y está fundamentado en parámetros (compuesto a partir de los modelos de jamming/AGC/SQM/paridad de Kshana): nunca capturas de campo ni IQ en bruto. El arnés es un árbitro; informa de características, no emite un veredicto bueno/malo. Ejecución: kshana scenarios/impairment-eval.toml (comentario del archivo de escenario, líneas { "9" } a { "12" })

# text
seg-882d67b9474f = La evaluación de detección de deterioros de RF mediante aprendizaje automático ({ "13494" }) es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-5d23d7f8f872 = Página de familia: <a1>Jamming, spoofing y el espectro</a1>

# text
seg-6cf4bb2d7f7a = Página temática: <a1>BENCH.md</a1>

# text
seg-dde90de4270b = <s1>Anterior</s1>hybrid

# text
seg-1e68310f2dc6 = <s1>Siguiente</s1>inertial
