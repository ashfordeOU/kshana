# docs--kind-quantum-time-transfer: translations (es)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-a3697ad561db = Hz

# text
seg-496b17a8d3b9 = Página temática: <a1>QUANTUM-MODELS.md</a1>

# text
seg-a1810bbca337 = <b>MODELLED</b> Bidireccional/TWSTFT (Sagnac), vista común de GNSS, PPP; fluctuación del enlace→distancia. Referencia independiente (ExternalDataset): Magnitud de Sagnac comprobada frente a un VALOR PUBLICADO de autoridad: N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Ec. { "1.29" }: una circunnavegación ecuatorial hacia el este acumula { "207.4" } ns (2ωA_E/c²); kshana reproduce { "207.386" } ns. Corroborado de forma independiente por geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que lleva la misma geometría 2Aω/c². El BIPM TWSTFT compuesto transponder/common-view/

# text
seg-a8beb8dfc757 = El presupuesto de errores de transferencia de tiempo es MODELLED, no validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, así que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-bb07c8ee153f = <b>PARTNER</b> No proporcionado: solo modelos de rendimiento; el hardware de átomos fríos/relojes es del socio. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Un objeto TradeEvidence reproducible (marco fijo: escenario+semilla+motor; valores comunes cuántico-frente-a-clásico por cifra de mérito con beneficio de polaridad correcta, opcional { "95" }%. Referencia independiente (InternalConsistency): Identidades de forma cerrada de beneficio y ganador + envoltura fiel del quantum_trade::TradeResult existente; honestidad vinculada al registro de representatividad y a las etiquetas de verificación

# text
seg-eb75c6a4dcec = La evidencia de la comparación cuántico-frente-a-clásico (forma común) es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-time-transfer.md
seg-eee91dc5741d = Fuente: <c1/>

# text
# c1: quantum-time-transfer
seg-05060df7f0b7 = <c1/> (tipo de escenario)

# text
seg-540545e6f846 = Cadena de temporización cuántica de confianza MODELLED: un presupuesto de transferencia de tiempo de extremo a extremo cuántico (reloj de red óptica + enlace de entrelazamiento o de fotón único) frente a clásico (CSAC + bidireccional por RF), un nivel de protección de temporización reutilizado + una cifra de mérito de seguridad frente a ataques de retardo o repetición (1-P_md), una probabilidad de detección de anomalías del reloj + latencia de CUSUM, y la comparación cuántico-frente-a-clásico como TradeEvidence honesta con un registro de representatividad y de brechas hasta el vuelo. Parámetros ilustrativos de dispositivo y enlace de fuentes públicas; modela la clase, sin TRL, vuelo ni certificación reclamados.

# text
# c1: scenarios/quantum-time-transfer.toml
seg-ed79bfe80fe7 = Una ejecución de <c1/> se resume así: quantum-time-transfer | cadena cuántica 1.233e-12s frente a clásica 5.292e-9s | PL { "555.24" } ns | seguridad Pd { "1.000" } (Pfa { "1e-3" }) | anomalía Pd { "0.761" } | comparación: el cuántico gana 2/2 | MODELLED

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-80e94491c3df = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-time-transfer.toml
seg-6b03fa15a60d = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-09760f892c7b = El gráfico que el motor genera para scenarios/quantum-time-transfer.toml, tipo de escenario quantum-time-transfer

# text
seg-873de4d05663 = <b>VALIDATED</b> Latencia de detección en el peor caso del detector CUSUM tabular (⌊h/(z−k)⌋+{ "1" }) y longitud media de racha fuera de control, usadas por el nivel de protección de temporización y los monitores de spoofing. Referencia independiente (ExternalDataset): ARL de CUSUM tabular publicado: aproximación de movimiento browniano de Siegmund ({ "1985" }) (Hawkins & Olwell { "1998" }, ec. { "3.7" }) anclada de forma cruzada a las tablas de ARL de Montgomery, Introduction to Statistical Quality Control (Wiley) para k=½, h∈{ "{" }{ "4,5" }{ "}" }; latencia determinista coincidente exactamente con una referencia independiente de primer paso. La cota compuesta de TPL sigue siendo MODELLED

# text
# c1: kshana kinds --json
seg-b51e62b8dc63 = Cadena de temporización cuántica de confianza MODELLED: un presupuesto de transferencia de tiempo de extremo a extremo cuántico (reloj de red óptica + enlace de entrelazamiento o de fotón único) frente a clásico (CSAC + bidireccional por RF), un nivel de protección de temporización reutilizado + una cifra de mérito de seguridad frente a ataques de retardo o repetición (1-P_md), una probabilidad de detección de anomalías del reloj + latencia de CUSUM, y la comparación cuántico-frente-a-clásico como TradeEvidence honesta con un registro de representatividad y de brechas hasta el vuelo. (catálogo de tipos (<c1/>))

# text
seg-dee0faf63e7f = Temporización cuántica de confianza: cadena de transferencia de tiempo de extremo a extremo, difusión segura, detección de anomalías y una comparación cuántico-frente-a-clásico. MODELLED; parámetros ilustrativos de dispositivo y enlace de fuentes públicas; modela la clase, sin afirmación de TRL ni de vuelo. (comentario del archivo de escenario, líneas { "1" } a { "3" })

# text
seg-6e9f5dfca6b0 = La temporización cuántica de confianza (transferencia de tiempo + difusión segura + anomalías) es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-d3665be74ff1 = <s1>Anterior</s1>quantum-gnss-free-nav

# text
seg-0d4b1f97541f = <s1>Siguiente</s1>quantum-trade

seg-a349aa76b0ed = PARTNER
