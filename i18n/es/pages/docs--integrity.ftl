# docs--integrity: translations (es)

# text
# c1: docs/INTEGRITY.md
seg-668241606715 = Fuente: <c1/>

# text
seg-9a8c218ce054 = Integridad y seguridad: qué modela Kshana y qué no

# text
seg-52038c93765d = Kshana informa de dos figuras de mérito (FoM), <b>Integridad</b> y <b>Seguridad</b>, que es fácil confundir con las magnitudes de grado aeronáutico del mismo nombre. Esta página expone con claridad qué son hoy, qué <em>no</em> son y qué añade la hoja de ruta. Si está evaluando Kshana para un contexto de seguridad de la vida humana o de certificación, lea esto primero.

# text
seg-fb6e93a107e7 = Hoy ({ "v0.37.0" })

# text
seg-ecd20ae1a05d = FoM de integridad: autoconsistencia del filtro

# text
seg-153391e55508 = La FoM de integridad es la fracción de muestras de la interrupción cuyo error de temporización real permanece dentro de la propia cota de protección k-sigma del filtro de Kalman:

# text
seg-ac2413a97a7b = Esto mide si la incertidumbre <em>autodeclarada</em> del filtro es honesta sobre su <em>propio</em> error durante una interrupción de GNSS (sistema global de navegación por satélite). Es una comprobación de consistencia interna útil.

# text
seg-c9f80760ea53 = <b>No</b> es:

# text
seg-8899525ad177 = un <b>nivel de protección horizontal/vertical (HPL/VPL)</b>: no hay ningún nivel de protección en el dominio de la posición (los paquetes de reloj son del dominio de la temporización);

# text
seg-dd9a3e58e10b = un <b>riesgo de integridad / probabilidad de información peligrosamente engañosa (P_HMI)</b>;

# text
seg-31fa92b3271d = una comparación con un <b>límite de alerta</b>;

# text
seg-ee998b974e6f = algo ajustado a la norma <b>RTCA DO-229E / DO-316</b> o <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: Organización Europea para el Equipamiento de la Aviación Civil) ni a ningún otro estándar de certificación.

# text
seg-f84a56b6fe10 = FoM de seguridad: cota analítica de detectabilidad de spoofing

# text
seg-e532288ed262 = La FoM de seguridad es una <b>cota de detectabilidad de spoofing basada en la estabilidad del reloj</b>: dado el ruido de un reloj (PSD (densidades espectrales de potencia) de frecuencia blanca y de paseo aleatorio) y una ventana de monitorización, es el margen analítico de detección de un monitor de consistencia de un solo reloj frente a un spoofing de falso tiempo de rampa lenta. Un reloj más silencioso (p. ej., un reloj óptico) detecta un spoofing menor y más lento que uno más ruidoso (p. ej., un CSAC (reloj atómico a escala de chip)); ese contraste es el objetivo del demostrador.

# text
# c1: spoof
seg-fc718a805b28 = <b>No</b> es un detector RAIM (monitorización autónoma de integridad en el receptor) multisatélite. No hay residuos de pseudodistancia entre satélites, ni nivel de protección, ni P_HMI. La prueba de innovación frente a sigma tiene la misma forma matemática que la detección de fallos del RAIM clásico (Brown), pero la cifra es una cota analítica para un reloj dado, no una implementación de RAIM, y solo tiene sentido en el contexto de un escenario de spoofing configurado (véase el tipo de escenario <c1/>, que inyecta un ataque de rampa real).

# text
# c1: clock
# c2: orbit
# c3: hybrid
# c4: fusion
# c5: security n/a (no attack)
# c6: fom.security
# c7: applicable: false
# c8: figure_tiers
seg-ae770e25031e = La salida lo indica. Los tipos <c1/>, <c2/>, <c3/> y <c4/> no configuran ningún ataque, por lo que su resumen de una línea imprime <c5/> en lugar de una cifra, y su documento de resultados marca <c6/> como <c7/>, con el motivo, en su bloque <c8/>. El valor en sí permanece en el documento para quien quiera la cota.

# text
# c1: src/raim.rs
seg-960bd91a2b3a = RAIM real de instantánea, de separación de soluciones y ARAIM (<c1/>)

# text
# c1: src/raim.rs
seg-3d31ec251ac0 = Un RAIM genuino, en el dominio de la posición, está implementado en <c1/>, aparte de la FoM de autoconsistencia anterior:

# text
seg-0e8240812c16 = <b>Monitorización de residuos multisatélite</b>: construye la matriz de geometría de línea de visión hacia los satélites visibles, forma la solución de posición/reloj por mínimos cuadrados y comprueba la suma de residuos al cuadrado.

# text
# c1: SSE/σ²
# c2: chi2_{1-P_fa}(n-4)
seg-69f1535596e0 = <b>Detección de fallos χ²</b>: <c1/> (SSE: suma de residuos al cuadrado) es χ²(n−{ "4" }) bajo la hipótesis de ausencia de fallos; se declara un fallo por encima de <c2/>. Los umbrales χ² proceden de una evaluación de la gamma incompleta regularizada sin dependencias (exacta, sin tablas).

# text
# c1: max_i(slope_i)·pbias·σ
# c2: slope_i
# c3: pbias
# c4: P_md
seg-6721779048f5 = <b>HPL / VPL basados en pendiente</b>: <c1/>, donde <c2/> es la sensibilidad del error de posición por satélite obtenida de la matriz sombrero y <c3/> es el sesgo χ² no central que satisface la probabilidad de detección fallida configurada <c4/>.

# text
# c1: Δ_k = x_k − x₀
seg-8dd60e98088d = <b>RAIM de separación de soluciones (MHSS: separación de soluciones de múltiples hipótesis)</b>: para la solución con todos los satélites a la vista y cada subsolución con exclusión de un solo satélite, la separación de estimadores anidados <c1/> <b>detecta e identifica</b> el satélite con fallo y alimenta la cota del nivel de protección.

# text
# c1: araim_raim
# c2: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c3: K_md
seg-719e27fdd2c1 = <b>Presupuesto de riesgo de integridad (P_HMI) de ARAIM (monitorización autónoma avanzada de integridad en el receptor)</b>: <c1/> resuelve el menor HPL/VPL cuya probabilidad sumada de información peligrosamente engañosa <c2/> (Blanch et al., <em>Baseline ARAIM</em>) satisface una asignación explícita de riesgo de integridad, e informa del riesgo que alcanzan los niveles, de modo que la integridad pueda compensarse directamente con el límite de alerta, en lugar de dejarla implícita en un multiplicador fijo <c3/>.

# text
# c1: (error, PL)
seg-2f99acf45203 = <b>Diagrama de integridad Stanford–ESA</b> (ESA: Agencia Espacial Europea): un acumulador por época clasifica <c1/> en regiones Disponible / Sistema no disponible / Engañosa / Peligrosamente engañosa para un resumen de disponibilidad.

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: scenarios/integrity-raim.toml
seg-33d01969fb0f = <b>Accesible de extremo a extremo</b>: el tipo de escenario <c1/> ejecuta lo anterior sobre una constelación SGP4 (Simplified General Perturbations { "4" }) o kepleriana, o una leída de TLE reales (conjuntos de elementos de dos líneas) o de un archivo de navegación RINEX (Receiver Independent Exchange Format), y emite un mapa de disponibilidad de HPL/VPL por época frente a los límites de alerta configurados (<c2/>). La misma ejecución <b>exporta un diagrama de Stanford vertical</b>: en cada época protegida se asigna, a través de la geometría, un sorteo semillado y reproducible de error de distancia sin fallos a un error vertical real, y se clasifica frente al VPL y el límite de alerta vertical, de modo que el resultado JSON (JavaScript Object Notation) y el resumen de la CLI (interfaz de línea de comandos) llevan los recuentos por región (eventos de integridad y HMI: información peligrosamente engañosa), no solo una fracción de disponibilidad. En el <c3/> incluido, la ejecución informa de { "344" } de { "361" } épocas disponibles ({ "95.3" } %) con un límite de alerta de { "40" } m horizontal y { "50" } m vertical, con { "0" } eventos de integridad y { "0" } HMI.

# text
# c1: araim_dual_raim
# c2: P_const
# c3: IntegritySupportMessage
# c4: σ_URA
# c5: σ_URE
# c6: b_nom
# c7: P_sat
# c8: P_const
# c9: P_const = 0
# c10: araim_raim
# c11: integrity
# c12: araim_dual = true
# c13: scenarios/araim-gps-galileo.toml
seg-54e778eceef4 = <b>ARAIM de doble constelación con un mensaje de apoyo a la integridad</b>: <c1/> añade el <b>modo de fallo de toda la constelación</b>: además de las hipótesis sin fallos y de un solo satélite, cada constelación aporta una hipótesis que elimina todos sus satélites, con a priori <c2/>, a la misma suma de riesgo de integridad MHSS. El <c3/> (ISM) transporta la exactitud de distancia del usuario para la integridad (<c4/>), la raíz cuadrática media de la exactitud (<c5/>), el sesgo nominal máximo <c6/> incorporado unilateralmente a cada modo, y los a priori <c7/> y <c8/>; su conjunto de referencia WG-C (Grupo de Trabajo C de la cooperación Unión Europea–Estados Unidos en navegación por satélite, cuyo subgrupo técnico de ARAIM publica la referencia) es σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } y P_const = { "1e-4" }. <c9/> reproduce bit a bit el resultado de un solo fallo de <c10/>. El tipo <c11/> toma esta vía con <c12/> (<c13/>: GPS + Galileo, { "48" } satélites, { "145" } de { "145" } épocas disponibles con los mismos límites de alerta).

# text
# c1: araim-reference-check
# c2: araim_protection_level
# c3: araim_integrity_risk
# c4: VERIFICATION-MATRIX.md
seg-1f06bc1976bd = <b>Niveles de protección frente a vectores de referencia publicados</b>: el tipo <c1/> ejecuta <c2/> y <c3/> del motor sobre los propios ejemplos resueltos del subgrupo ARAIM del WG-C (el Reference Airborne Algorithm Description Document v3.1, { "2019" }, Apéndice D, y el Informe del Hito { "3" }, { "2016" }, Anexo A). La mayor diferencia de nivel de protección vertical/horizontal en el vector de aceptación es de { "0.0437" } m frente a la tolerancia propia de los documentos de { "0.05" } m. Esta fila es VALIDATED en <a1><c4/></a1>: comprueba la ecuación del nivel de protección, no un ISM operativo ni un receptor.

# text
seg-1dda7b318c5f = La carencia restante (hoja de ruta)

# text
# c1: raim.rs
seg-e27215296e1a = Lo que <c1/> <b>aún no</b> hace:

# text
seg-964c0634eae0 = <b>no está incorporado a la FoM de los escenarios de reloj/holdover</b>: esos paquetes siguen informando de la cifra de integridad de autoconsistencia del filtro anterior, no de un HPL/VPL;

# text
seg-eecf2f9f181e = las hipótesis de fallo son el caso sin fallos, los <b>satélites individuales</b> y las <b>constelaciones enteras</b>; los fallos simultáneos en <b>subconjuntos de dos o más satélites (SV: vehículo espacial, es decir, un satélite)</b> no se modelan;

# text
seg-fd0f9fb2de83 = el ISM es un conjunto de parámetros configurable (con los valores de referencia del WG-C), no un mensaje operativo difundido ni un modelo de amenazas validado;

# text
# c1: snapshot_raim_fde
# c2: integrity
seg-88f5242b0809 = la <b>detección y exclusión de fallos (FDE)</b> es solo de un único satélite y de instantánea: la separación de soluciones nombra el satélite con fallo, y <c1/> vuelve a resolver cada exclusión de un solo satélite y devuelve el satélite excluido con la prueba de chi cuadrado y los niveles de protección del subconjunto restante, pero no se informa de ninguna posición protegida por exclusión, y el tipo de escenario <c2/> no ejecuta el paso de exclusión.

# text
# c1: tests/igs_real_data.rs
# c2: P_HMI
# c3: tests/araim_dual_real_data.rs
# c4: REAL_TLE_GUIDE.md
# c5: pvt
seg-c85aa5dedc86 = Los núcleos de instantánea, de separación de soluciones y de ARAIM se ejercitan con <b>geometría real de órbita precisa del IGS (International GNSS Service) (SP3: Standard Product { "3" })</b>, no solo con constelaciones sintéticas: <c1/> forma la geometría de línea de visión a partir de la primera época de un producto SP3 real del IGS en una estación terrestre real, y comprueba que los niveles de protección son finitos y están dentro de los límites de alerta APV-I (aproximación con guiado vertical) de { "40" } m horizontal y { "50" } m vertical, que un sesgo de pseudodistancia de { "60" } m activa el monitor χ², que la separación de soluciones <b>identifica</b> el satélite con fallo y que los niveles de ARAIM satisfacen el <c2/> asignado. <c3/> ejecuta la vía de doble constelación sobre los catálogos reales de GPS y Galileo de Celestrak del 2026-06-07, propagados a una época común (véase <a1><c4/></a1> §{ "3" }). Una comprobación cruzada más profunda, contrastando época por época los niveles de protección con gLAB (la GNSS-Lab Tool, un conjunto de procesamiento de datos GNSS distribuido por la ESA) a lo largo de un arco completo de observación RINEX, añadiría paridad en el dominio del receptor. No se ha hecho: el tipo <c5/> calcula una posición de punto único por código a partir de observaciones RINEX reales, pero ningún nivel de protección de esa solución se ha comparado con el de gLAB.

# text
# c1: raim.rs
# c2: integrity
# c3: araim-reference-check
seg-f5fac2e836a6 = Así, <c1/> es un núcleo real de nivel de protección y riesgo de integridad, accesible desde los tipos de escenario <c2/> y <c3/>, ejercitado con geometría real de órbitas de referencia y contrastado con los vectores de referencia del WG-C. Los fallos de subconjuntos de varios satélites, la paridad con gLAB en el dominio del receptor y la integración con la FoM del reloj siguen siendo elementos de la hoja de ruta, y nada de esto es evidencia de certificación.

# text
# c1: GLOSSARY.md
seg-487f24ed92d8 = <a1><c1/></a1>: definiciones de una línea de cada FoM y abreviatura.

# text
# c1: ARAIM_REFERENCE.md
seg-7d3c12cf802e = <a1><c1/></a1>: los parámetros del ISM y los vectores de referencia del WG-C.

# text
# c1: SLOT-TIMING.md
seg-04532ba5288f = <a1><c1/></a1>: el nivel de protección de temporización (TPL) de un reloj en deriva libre, que está condicionado a la detección.

# text
# c1: VALIDATION.md
seg-43cea496da93 = <a1><c1/></a1>: qué magnitudes están validadas frente a una referencia y cuáles son comprobaciones de autoconsistencia.

# text
# c1: src/security.rs
seg-3037dde8135f = <c1/>: la derivación de la cota de detectabilidad de spoofing.

# text
seg-04d63778ca7f = RAIM junto a las figuras de mérito del holdover del reloj ({ "0.36" }, opcional)

# text
# c1: [integrity]
# c2: src/clock_integrity.rs
# c3: lat_deg
# c4: lon_deg
# c5: height_m
# c6: systems
# c7: gps-baseline
# c8: integrity_fom
# c9: available
# c10: alarm
# c11: unavailable-pl-above-al
# c12: unavailable-too-few-satellites
# c13: unavailable-gnss-denied
# c14: runs = 1
seg-744e95749978 = Un escenario de reloj puede incluir una sección <c1/> (<c2/>): un emplazamiento (<c3/>, <c4/>, <c5/>), preajustes de constelación (<c6/>, por defecto <c7/>), una máscara, una sigma de residuo de distancia, las probabilidades de falsa alarma y de detección fallida, los límites de alerta horizontal y vertical, un espaciado de épocas y un sesgo declarado opcional en un satélite. La ejecución informa entonces de un bloque <c8/> aparte: por época, los satélites a la vista, los niveles de protección RAIM de instantánea y un veredicto (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>), y los recuentos y la disponibilidad a lo largo de la ejecución. Mientras la cronología dice que el GNSS está denegado, el RAIM no está disponible y no se extrapola nada; una ventana degradada se evalúa como nominal. Las figuras de mérito del holdover no cambian, y sin la sección la salida es idéntica byte a byte. MODELLED: un cielo preajustado representativo, residuos sintéticos y límites declarados. Requiere <c14/>.

# text
seg-139639263c90 = La reproducción del URA máximo del Hito { "3" } de ARAIM del WG-C UE-EE. UU. (CAP-05c)

# text
seg-97906754d4c8 = Un plan anterior prometía una comparación con la "Table A-3" de una nota técnica de EU-ARAIM. No se ha podido encontrar ninguna fuente pública de esa tabla (los informes públicos de los Hitos { "1" } a { "3" } del Subgrupo Técnico de ARAIM del Grupo de Trabajo C UE-EE. UU. no tienen ninguna Table A-3), de modo que esa comparación queda <b>retirada</b> y no se promete nada con ese nombre.

# text
# c1: 156147e1...13d8
# c2: sigma_URA
# c3: xval/araim-m3/PREREGISTRATION.md
# c4: src/bin/gen_araim_m3_study.rs
# c5: xval/araim-m3/results.json
# c6: tests/araim_m3_reproduction.rs
seg-b61607c477f2 = Lo que se intenta en su lugar es el informe que sí es público: el <b>Informe del Hito { "3" }</b> ({ "25" } de febrero de { "2016" }, copia de GPS.gov, SHA-256 <c1/>), Tablas { "5" }, { "6" } y { "7" }, que imprimen, para cada configuración de constelación y para cada uno de RNP { "0.1" } y RNP { "0.3" }, la mayor <c2/> para la cual el { "90" } % de los usuarios tiene una disponibilidad del { "99.5" } %. Se comprueban doce entradas impresas (las filas Depleted y Baseline de las tablas de doble frecuencia), con umbrales preregistrados en <a1><c3/></a1> antes de cualquier ejecución puntuada, con las desviaciones que no pueden eliminarse declaradas allí: sin archivos de almanaque, capas Walker en lugar de las ranuras reales, una rejilla y un paso más gruesos, y la vía horizontal ADD v4.2 del motor en lugar del texto propio del informe. Las Tablas { "8" } a { "13" } (frecuencia única) y las filas Optimistic no se intentan, por los motivos indicados allí. <b>Resultado: { "8" } de { "12" } entradas reproducidas, { "4" } NOT MET (fijadas):</b> las entradas de doble constelación y todas las de solo Galileo coinciden (incluidas las filas N/A), la entrada dual Depleted de RNP { "0.1" } alcanza una cobertura de { "0.847" } a { "9" } m frente a los { "9" } m impresos (necesita { "0.90" }), y tres entradas de solo GPS fallan por mucho (cobertura { "0.70" } a { "4" } m, { "0.58" } a { "6" } m, { "0.65" } a { "10" } m frente a los { "4" } m, { "6" } m y ">{ "10" } m" impresos). Los fallos de solo GPS pueden deberse a que la capa Walker uniforme sustituye a las ranuras reales de GPS (D1); es una hipótesis, no un hallazgo. El resultado sigue siendo MODELLED sea el que sea. El estudio es <c4/>; sus coberturas medidas están en <c5/> y las puntúa <c6/>. El informe en sí se cita, no se incorpora.

# text
seg-0e98826cedcc = <s1>Anterior</s1>Seguridad del hardware

# text
seg-e6f1e38977b7 = <s1>Siguiente</s1>Espectro y cascada

# text
seg-38ab3bb65327 = RAIM real de instantánea, de separación de soluciones y ARAIM (src/raim.rs)
