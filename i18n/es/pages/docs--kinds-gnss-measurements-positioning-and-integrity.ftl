# docs--kinds-gnss-measurements-positioning-and-integrity: translations (es)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
# c1: published
seg-06197409c717 = Vectores de referencia ARAIM publicados para la certificación: los niveles de protección horizontal y vertical ARAIM del motor, ejecutados frente a los PROPIOS ejemplos numéricos resueltos del Subgrupo Técnico ARAIM del WG-C, con la tolerancia (TOL_PL = { "5e-2" } m) que esos mismos documentos indican. Se incluyen dos vectores como datos de prueba, cada uno con su URL de obtención, fecha de obtención, SHA-256 del archivo de origen y página: el Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Apéndice D — autoconsistente, y el vector de aceptación — y el Milestone { "3" } Report ({ "2016" }), Anexo A sección A.IX, la declaración que citan las bibliografías de investigación. Cada entrada publicada (la matriz de geometría de 10 satélites y 2 constelaciones, las diagonales de varianza C_int y C_acc, b_nom, P_sat, P_const y el conjunto de constantes LPV-200) y cada salida publicada (VPL, HPL, EMT, sigma_v_acc, K_fa_3 y los sigma_3, sigma_ss_3 y b_3 de los dos modos de fallo de constelación) se informa junto al número propio del motor y su diferencia absoluta. La ecuación del nivel de protección NO se resuelve de nuevo aquí: la lista de modos de la referencia se entrega a las funciones existentes del motor raim::araim_protection_level / araim_integrity_risk, de modo que la bisección y el álgebra de cola gaussiana sometidas a prueba son las propias del motor; solo se construyen para él la geometría, las subsoluciones, los umbrales de detección y el reparto de presupuesto publicado. EXTERNALLY CHECKED frente al vector de { "2019" }: VPL { "18.2926" } m frente a { "18.3" } m publicados, HPL { "13.4063" } m frente a { "13.45" } m, EMT { "7.2997" } m frente a { "7.2998" } m, sigma_v_acc { "1.3694" } m frente a { "1.3694" } m, y los seis intermedios publicados dentro de media unidad de su último decimal impreso. El vector de { "2016" } contiene dos defectos internos que el informe declara en lugar de ocultar — una errata de signo en la fila { "3" } de G, y un K_fa_3 evaluado con { "57" } modos de fallo mientras el documento indica N_fault_max = { "1" } ({ "12" } modos) — por lo que sus intermedios de geometría se reproducen exactamente mientras que sus niveles de protección se informan como discrepancias medidas y se excluyen de la cifra de aceptación; la tolerancia nunca se amplía para absorberlos. Cada campo numérico emitido lleva una unidad y una clase de procedencia, y una cifra transcrita se etiqueta <c1/> para que nunca pueda confundirse con una calculada. ALCANCE: solo se implementa N_fault_max = { "1" } (modos de fallo de un solo satélite y de una sola constelación), y un caso cuyas probabilidades a priori exijan subconjuntos de fallo simultáneos de varios eventos es REFUSED en lugar de truncarse en silencio; la detección y exclusión de fallos, la comprobación de consistencia chi-cuadrado y el paso de reasignación por doble recuento del algoritmo de referencia quedan fuera del alcance. Esto reproduce el ejemplo resuelto de un algoritmo de referencia publicado — no es una certificación, un artefacto de aeronavegabilidad ni una aprobación.

# attr:alt
seg-693c823c85d1 = El gráfico que escribe el motor para scenarios/araim-reference-check.toml, tipo de escenario araim-reference-check

# text
seg-2ffccc9c1eff = Simulación de pseudodistancias en el dominio de la medida (ionosfera de Klobuchar, troposfera de Saastamoinen/Niell) + RAIM.

# attr:alt
seg-47ee40d4eb73 = El gráfico que escribe el motor para scenarios/gnss-sim-raim.toml, tipo de escenario gnss-sim

# text
seg-eb7e0c2feb2b = RAIM instantáneo / de separación de soluciones / ARAIM con HPL/VPL y un diagrama de Stanford.

# attr:alt
seg-ce7f6130ddee = El gráfico que el motor escribe para scenarios/integrity-raim.toml, tipo de escenario integrity

# text
seg-b7b67e03f125 = Posicionamiento de punto único con observaciones reales: resuelve la posición de un receptor a partir de un archivo de observación RINEX { "3" } y un archivo de navegación de difusión (pseudodistancias de código, efemérides de difusión, ionosfera de Klobuchar, troposfera de Saastamoinen/Niell), validado opcionalmente frente a una coordenada topografiada.

# attr:alt
seg-d76d59644d84 = El gráfico que el motor genera para scenarios/pvt-abmf.toml, tipo de escenario pvt

# text
seg-edfcb546d9de = Presupuesto de predicción del marco lunar y de la orientación terrestre en tiempo real: Tabla { "1" } de P4 (la comprobación de consistencia del error de marco: posprocesado ~{ "0.27" } m ↔ ~{ "0.010" } ms y tiempo real ~{ "15" } m ↔ ~{ "0.5" } ms, cada posición de marco expresada como su error de UT1 equivalente mediante el brazo de palanca L19 Δr = D_EM·ω⊕·ΔUT1) y Tabla { "2" } (error medido de predicción de UT1 frente al horizonte: la curva L18 leída directamente de la serie real finals2000A del IERS: el suelo final de Bulletin A − Bulletin B y el error del predictor de persistencia a varios días, cada uno proyectado a una posición del marco lunar mediante L19), más el presupuesto de error de marco en tiempo real L21 por suma en raíz cuadrática (EOP + efemérides + suelo de realización). Forma cerrada VALIDATED (el brazo de palanca L19, con ω⊕ contrastada con el ángulo de rotación terrestre del CIO) y datos reales VALIDATED (la curva L18 a partir de las filas reales de finals2000A); MODELLED son las magnitudes de covarianza de la determinación de órbita del relé lunar y el suelo de realización del marco (asignaciones representativas) y el predictor de persistencia (no el algoritmo operativo de Bulletin A del IERS). No es un producto certificado de marco en tiempo real.

# attr:alt
seg-2721ed7727bb = El gráfico que el motor genera para scenarios/realtime-frame-eop.toml, tipo de escenario realtime-frame-eop

# text
seg-5f25c5b71f0c = Modelo del entorno de clima espacial: índices de actividad solar (F10.7/F10.7a) y geomagnética (Kp, con la tabla definicional Kp↔ap), la temperatura exosférica de Jacchia-1971 que estos determinan (validada frente a los mínimos, medios y máximos solares publicados), y la densidad neutra termosférica de Jacchia-1971 a la temperatura exosférica media diurna frente al perfil estático sin actividad en un conjunto de altitudes: la dependencia de la densidad respecto del ciclo solar que omite la atmósfera estática. MODELLED: la densidad coincide con las densidades derivadas de acelerómetros (TOLEOS CHAMP y GRACE) dentro de un factor { "2" } en el máximo solar, pero es unas 1.7x demasiado densa en el mínimo solar de { "2008" }.

# attr:alt
seg-c1c6f2f73fb5 = El gráfico que el motor genera para scenarios/space-weather.toml, tipo de escenario space-weather

# text
seg-4e31c8daf798 = Registro

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/gnss-measurements-positioning-and-integrity.md
seg-c9cf40c5e609 = Fuente: <c1/>

# text
seg-569fac649b5d = Mediciones GNSS, posicionamiento e integridad (familia de tipos de escenario)

# text
seg-63c3a7483268 = { "6" } tipos de escenario del motor v{ $version }. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
# c1: kshana scenarios/integrity-raim.toml
seg-33a602147cc2 = Páginas temáticas: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Ejecute uno: <c1/>. Todas las familias: <a5>KINDS.md</a5>.

# attr:alt
seg-9c60c8803b6b = Hoja de contactos de los gráficos que genera el motor para los tipos de escenario de la familia Mediciones GNSS, posicionamiento e integridad

# text
seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

# text
seg-6698e12e148b = Posicionamiento de punto único con observaciones reales: calcula la posición de un receptor a partir de un archivo de observación RINEX { "3" } y un archivo de navegación de difusión (pseudodistancias de código, efemérides de difusión, ionosfera de Klobuchar, Saastamo

# text
seg-da89c260b1a3 = Vectores de referencia publicados de ARAIM: los niveles de protección horizontal y vertical de ARAIM del motor se ejecutan con los ejemplos numéricos resueltos PROPIOS del ARAIM Technical Subgroup del WG-C, con la tole

# text
seg-7a750a89c9c4 = Modelo del entorno de meteorología espacial: índices de actividad solar (F10.7/F10.7a) y geomagnética (Kp, con la tabla definitoria Kp↔ap), la temperatura exosférica de Jacchia-1971 que estos determinan (validada frente a publish

# text
seg-d79d4d58275b = Presupuesto de predicción en tiempo real del marco lunar y de la orientación terrestre: P4 Tabla { "1" } (la comprobación de coherencia del error de marco: posprocesado ~{ "0.27" } m ↔ ~{ "0.010" } ms y tiempo real ~{ "15" } m ↔ ~{ "0.5" } ms, cada posición del marco expre

# text
# c1: mask_deg
# c2: sigma_uere_m
# c3: p_fa
# c4: p_md
# c5: al_h_m
# c6: al_v_m
# c7: time
# c8: user|user_site
# c9: constellation
# c10: sigma_ura_m
# c11: b_nom_m
# c12: constellations
# c13: seed
# c14: araim_dual
# c15: p_hmi
# c16: skyline
seg-dc783268156c = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Opcionales: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-7b110aacdb27 = <b>Registro:</b> MODELLED { "6" } · VALIDATED { "4" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>integrity</a1>.

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: iono
# c6: tropo
# c7: mask_deg
# c8: noise_sigma_m
# c9: multipath_m
# c10: sat_clock_rms_m
# c11: uere_m
# c12: p_fa
# c13: p_md
# c14: alert_limit_h_m
# c15: alert_limit_v_m
# c16: skyline
seg-d444fb35cae9 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>. Opcionales: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-b651ec58bcba = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>gnss-sim</a1>.

# text
# c1: obs_rinex
# c2: nav_rinex
# c3: truth_ecef
# c4: apriori_ecef
# c5: mask_deg
# c6: dual_frequency
seg-b9a21187317d = Campos obligatorios: <c1/>, <c2/>. Opcionales: <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-143dc4fd1d44 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>pvt</a1>.

# text
# c1: vector
seg-9ca1f6783e8e = Campos obligatorios: ninguno. Opcional: <c1/>.

# text
seg-415f1fa78518 = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>araim-reference-check</a1>.

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6c4655b35c65 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-1e5052c0bce7 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>space-weather</a1>.

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
seg-64c512530ee6 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-1c244958d3c4 = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>realtime-frame-eop</a1>.

# text
seg-d4adf4283480 = <s1>Anterior</s1>Constelaciones, cobertura y geometría

# text
seg-2cdfd7f8bfb3 = <s1>Siguiente</s1>PNT alternativo sin GPS
