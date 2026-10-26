# docs--kind-pvt: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-8e845ce908ee = Tipo de escenario del motor v{ $version }, familia <a1>Mediciones GNSS, posicionamiento e integridad</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-f6b7ca020692 = Página de familia: <a1>Mediciones GNSS, posicionamiento e integridad</a1>

# text
seg-f4cf8b629797 = Página de tema: <a1>INTEGRITY.md</a1>

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry y check: una simulación Monte Carlo con semilla (N = { "20,000" } épocas por geometría, sigma = { "1.5" } m, semilla ChaCha8 { "36" } + i) de la propia fijación por mínimos cuadrados iterados del motor (pvt::solve_spp, pesos unitarios, resuelta desde la posición verdadera) sobre Pruebas: <a1>uere_dop_monte_carlo.rs</a1>.

# text
# c1: docs/kinds/by-kind/pvt.md
seg-aab2f85048b7 = Fuente: <c1/>

# text
# c1: pvt
seg-56f864d32367 = <c1/> (tipo de escenario)

# text
seg-b7b67e03f125 = Posicionamiento de punto único con observaciones reales: resuelve la posición de un receptor a partir de un archivo de observación RINEX { "3" } y un archivo de navegación de difusión (pseudodistancias de código, efemérides de difusión, ionosfera de Klobuchar, troposfera de Saastamoinen/Niell), validado opcionalmente frente a una coordenada topografiada.

# text
# c1: scenarios/pvt-abmf.toml
seg-79d2a463393d = Una ejecución de <c1/> se resume así: pvt 55bdd18628e1 | { "11" } sat nav | 2/3 épocas resueltas | media { "9.0" } satélites, PDOP { "1.8" } | error 3D RMS { "5.74" } m (máx. { "7.12" } m)

# text
# c1: obs_rinex
# c2: nav_rinex
seg-fd22bc5c2b67 = Campos obligatorios: <c1/>, <c2/>

# text
# c1: truth_ecef
# c2: apriori_ecef
# c3: mask_deg
# c4: dual_frequency
seg-4b39ee73d65d = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/pvt-abmf.toml
seg-4f02bdcbc7c7 = El ejemplo <c1/> establece, entre otros:

# text
seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

# text
seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

# text
seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

# attr:alt
seg-d76d59644d84 = El gráfico que el motor genera para scenarios/pvt-abmf.toml, tipo de escenario pvt

# text
seg-e6f678eeb384 = <b>MODELLED</b> Filtro de Hatch sin divergencia (código libre de ionosfera arrastrado por la portadora libre de ionosfera, ventana de N épocas, reinicio ante pérdida de enganche, salto libre de geometría o hueco) en el montaje de posicionamiento de punto único preciso

# text
seg-5a42823318a8 = <b>VALIDATED</b> Posición del satélite en ECEF a partir de las efemérides de difusión keplerianas de IS-GPS-200 / Galileo-OS / BeiDou-OS, desde un registro de navegación RINEX-3 analizado. Referencia independiente (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos() compilado a partir del código fuente en C (T. Takasu, BSD-2-Clause): una implementación independiente de IS-GPS-200/SIS-ICD, alimentada con los mismos registros de navegación RINEX-3; la posición ECEF del satélite coincide hasta ~{ "62" } nm. (La interpolación de efemérides precisas SP3 se valida por separado: véase 'SP3 precise-ephemeris interpolation')

# text
seg-51cac2f918e0 = Página temática: <a1>POSITIONING.md</a1>

# text
seg-8ea056f1d7e0 = <s1>Anterior</s1>passes

# text
seg-d1dc82bbfb73 = <s1>Siguiente</s1>quantum-anomaly-detect
