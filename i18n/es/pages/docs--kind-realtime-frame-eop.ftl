# docs--kind-realtime-frame-eop: translations (es)

# text
seg-8e845ce908ee = Tipo de escenario del motor v{ $version }, familia <a1>Mediciones GNSS, posicionamiento e integridad</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-f6b7ca020692 = Página de familia: <a1>Mediciones GNSS, posicionamiento e integridad</a1>

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-a2889fb2b42a = Página temática: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/realtime-frame-eop.md
seg-1ad013ffb9d1 = Fuente: <c1/>

# text
# c1: realtime-frame-eop
seg-54620502f0dd = <c1/> (tipo de escenario)

# text
seg-edfcb546d9de = Presupuesto de predicción del marco lunar y de la orientación terrestre en tiempo real: Tabla { "1" } de P4 (la comprobación de consistencia del error de marco: posprocesado ~{ "0.27" } m ↔ ~{ "0.010" } ms y tiempo real ~{ "15" } m ↔ ~{ "0.5" } ms, cada posición de marco expresada como su error de UT1 equivalente mediante el brazo de palanca L19 Δr = D_EM·ω⊕·ΔUT1) y Tabla { "2" } (error medido de predicción de UT1 frente al horizonte: la curva L18 leída directamente de la serie real finals2000A del IERS: el suelo final de Bulletin A − Bulletin B y el error del predictor de persistencia a varios días, cada uno proyectado a una posición del marco lunar mediante L19), más el presupuesto de error de marco en tiempo real L21 por suma en raíz cuadrática (EOP + efemérides + suelo de realización). Forma cerrada VALIDATED (el brazo de palanca L19, con ω⊕ contrastada con el ángulo de rotación terrestre del CIO) y datos reales VALIDATED (la curva L18 a partir de las filas reales de finals2000A); MODELLED son las magnitudes de covarianza de la determinación de órbita del relé lunar y el suelo de realización del marco (asignaciones representativas) y el predictor de persistencia (no el algoritmo operativo de Bulletin A del IERS). No es un producto certificado de marco en tiempo real.

# text
# c1: scenarios/realtime-frame-eop.toml
seg-488039e4240f = Una ejecución de <c1/> se resume así: realtime-frame-eop | Tabla { "1" }: posprocesado { "0.27" } m ({ "0.0096" } ms de UT1) ↔ tiempo real { "14.4" } m ({ "0.514" } ms de UT1) | Tabla { "2" }: suelo final { "0.0171" } ms → 3 días { "1.6644" } ms | total del presupuesto { "20.1" } m ({ "67.0" } ns) | brazo de palanca L19 + datos reales L18 (validado), covarianza de la determinación de órbita (modelada)

# text
# c1: epoch
# c2: horizons_days
# c3: ephemeris_pos_sigma_m
# c4: ephemeris_vel_sigma_mps
# c5: latency_s
# c6: frame_realization_floor_m
# c7: delta_ut1_ms
# c8: delta_xp_mas
# c9: delta_yp_mas
# c10: eop_finals2000a
# c11: eop_finals2000a_later
# c12: frame_realization_tie_noise_m
# c13: operational_window_days
# c14: operational_min_cycle_fraction
# c15: operational_anchor_residual
seg-66264ec78a4c = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/realtime-frame-eop.toml
seg-45a4ed476311 = El ejemplo <c1/> establece, entre otros:

# text
seg-c39a26aa1f1e = archivo de prueba incluido finals2000A_20260930

# text
seg-9ef8a2b4c144 = Etiqueta del resultado (la del motor): presupuesto de predicción del marco lunar y de la orientación terrestre en tiempo real. Forma cerrada VALIDATED: el brazo de palanca L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), con ω⊕ contrastada con el ángulo de rotación terrestre del CIO. Datos reales VALIDATED: las curvas de error de predicción de UT1 y de movimiento polar L18 leídas directamente de la serie real del IERS finals200

# attr:alt
seg-2721ed7727bb = El gráfico que el motor genera para scenarios/realtime-frame-eop.toml, tipo de escenario realtime-frame-eop

# text
seg-72a1fc2f5c90 = <b>VALIDATED</b> Una tabla indica el error de predicción de UT1, el error del polo por movimiento polar y su combinación en cuadratura en la Luna sobre un conjunto de épocas IDÉNTICO por horizonte, emitiendo las épocas en las que se midió cada componente. Pruebas: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

# text
# c1: realtime-frame-eop
seg-b1d90bf98ac3 = <b>VALIDATED</b> El valor por defecto en ejecución de <c1/> es la copia incorporada propia de la biblioteca de un extracto literal de finals2000A del IERS (tools/finals2000A_20260930.txt: { "174" } filas diarias consecutivas, MJD 61224-61397, recortadas del finals2000A.all del 2026-09-30) lleva Pruebas: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-0298bd40d72f = <b>MODELLED</b> Un ajuste por mínimos cuadrados de sesgo más tasa sobre una ventana final más los principales términos periódicos (anual, semianual y las dos mareas zonales principales para UT1; Chandler, anual y semianual para el polo), extrapolado con el último valor dentro de la ventana Pruebas: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-12efcd20ca62 = <b>VALIDATED</b> Una tabla indica el error de predicción de UT1, el error del polo por movimiento polar y su combinación en cuadratura en la Luna sobre un conjunto de épocas IDÉNTICO por horizonte, em. Referencia independiente (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) leyendo el producto finals2000A del IERS con su propia regla Bulletin-B-si-no-A, y pyerfa { "2.0.1.5" } (SOFA) con rotaciones completas de celeste a terrestre (c2i06a, sp00, pom00, c2tcio; el ángulo de rotación terrestre según IERS { "2010" } ec. { "5.15" } en aritmética exacta), ejecutados como programas separados sobre filas literales del finals2000A.all congelado del 2026-09-30; preregistrado (455b8fb5) con las enmiendas A1 y A2 que fijan solo

# text
# c1: realtime-frame-eop
seg-020e5919c8fd = <b>VALIDATED</b> El valor por defecto en ejecución de <c1/> es la copia incorporada propia de la biblioteca de un extracto literal de finals2000A del IERS (tools/finals2000A_20260930.txt: { "174" } consecutiv. Referencia independiente (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), leyendo los mismos bytes con su propio lector, y la tabla del IERS Bulletin A Vol. XXXIX N.º { "039" }, copiada número por número; preregistrado (6fdae01b) con seis criterios exactos antes de ejecutar astropy. Se satisfacen los seis: { "30" } filas finales, { "54" } rápidas y { "90" } predichas con listas de MJD iguales, todas las filas predichas con indicador P, el recuento de la ejecución por defecto igual, y las predicciones iguales a Bullet

# text
seg-530c87bbff78 = <b>MODELLED</b> Un ajuste por mínimos cuadrados de sesgo más tasa sobre una ventana final más los principales términos periódicos (anual, semianual y las dos mareas zonales principales para UT1; Cha. Referencia independiente (ReferenceImpl): Tres vías independientes, ninguna de ellas una cifra publicada de precisión de predicción. ({ "1" }) Una señal analítica con coeficientes conocidos: la única forma de ejercitar la maquinaria periódica, ya que ninguna serie confirmada es lo bastante larga para admitir un término anual. ({ "2" }) La solución de mínimos cuadrados de forma cerrada de los libros de texto, con un álgebra distinta de la resolución matricial sometida a prueba, sobre filas reales. ({ "3" }) Las filas genuinas de predicción de Bulletin A archivadas que el

# text
# c1: label
seg-a233df86be95 = Presupuesto de predicción del marco lunar y de la orientación terrestre en tiempo real. Forma cerrada VALIDATED: el brazo de palanca L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), con ω⊕ contrastada con el ángulo de rotación terrestre del CIO. Datos reales VALIDATED: las curvas de error de predicción de UT1 y de movimiento polar L18 leídas directamente de la serie real finals2000A del IERS (Bulletin A rápido frente a Bulletin B final, y persistencia a varios días sobre las filas diarias reales). DERIVED: el marco (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-60e7ee7e6e3e = Forma cerrada VALIDATED (el brazo de palanca L19, con ω⊕ contrastada con el ángulo de rotación terrestre del CIO) y datos reales VALIDATED (la curva L18 a partir de las filas reales de finals2000A); MODELLED son las magnitudes de covarianza de la determinación de órbita del relé lunar y el suelo de realización del marco (asignaciones representativas) y el predictor de persistencia (no el algoritmo operativo de Bulletin A del IERS). (catálogo de tipos (<c1/>))

# text
seg-ddf4702f78e5 = Honestidad: forma cerrada VALIDATED (el brazo de palanca L19, con omega_earth contrastada con el ángulo de rotación terrestre del CIO) y datos reales VALIDATED (las curvas L18 de UT1 y de movimiento polar a partir de las filas reales de finals2000A). Suelo de realización del marco DERIVED (el residuo posterior al ajuste de Helmert). MODELLED son las magnitudes de covarianza de la determinación de órbita del relé lunar ({ "0.27" } m posprocesado, ~{ "14.4" } m en tiempo real con una hora de latencia: un redondeo, no despejado hacia atrás, todas (comentario del archivo de escenario, líneas { "27" } a { "32" })

# text
seg-bc51b666d070 = El error de predicción de la orientación terrestre de estilo operativo, medido como predicho frente a final, es MODELLED, no validado: se comprueba frente a una implementación distinta dentro de este mismo código, independiente de la unidad sometida a prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-653fad5e0afe = <s1>Anterior</s1>quantum-trade

# text
seg-5abe534d4ef1 = <s1>Siguiente</s1>reentry
