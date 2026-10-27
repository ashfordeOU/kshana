# docs--kinds-campaigns: translations (es)

# text
seg-b03d56f501c3 = Tipo

# text
seg-a07990e776cb = Campaña: tipos de escenario existentes compuestos en una sola ejecución, con cada número leído de una ejecución real del tipo de escenario nombrado. Cuatro secciones, en cualquier combinación. PHASES: una misión encadenada en una línea temporal compartida -- cada fase ejecuta uno o más escenarios (por ejemplo inhibición, luego suplantación, luego un reloj en holdover con un sistema de navegación inercial en inercia a su lado, luego una alarma de integridad, luego la recuperación), sus salidas se leen en canales con nombre (error de tiempo del reloj frente a su guarda, relación portadora-densidad de ruido frente al umbral de seguimiento, nivel de protección frente al límite de alerta, error de posición, satélites en seguimiento, indicadores de alarma) mediante un preajuste por tipo de escenario o mediante rutas de resultado explícitas, y se remuestrean sobre una malla común por retenedor de orden cero, con los límites de fase y los eventos; el estado se transmite por carry (un canal continúa desde el valor final de la fase anterior), handoff (un número de la fase anterior escrito en el escenario de esta fase) y end_at (una fase termina en un instante que calculó una ejecución, como el instante de detección de un monitor de suplantación). SWEEP: una malla sobre una a tres claves de escenario con puntos de cualquier tipo de escenario (un segmento de número entero indexa una matriz de tablas, como en system.2.sisre_m), con métricas leídas por ruta de resultado y, con ejecuciones por encima de una, un conjunto de Monte Carlo con semilla en cada nodo. MONTE_CARLO: la realización k se ejecuta con base_seed + k; cada métrica informa de la media, la desviación típica, los percentiles 5, 50 y 95 por rango más cercano y un intervalo de confianza bootstrap de semilla fija del { "95" } % sobre la media. COMPOSE: varios escenarios con valores compartidos (la potencia y la posición de un inhibidor escritas en un receptor marítimo y en uno de carretera), con un resumen combinado de mejor y peor caso. El resultado lleva un hash de campaña, un resumen sobre todos los resultados de los miembros y una entrada de unidades para cada número emitido; las exportaciones de interoperabilidad escriben cada escenario miembro que tiene geometría como su propio conjunto de archivos. Las identidades de composición se prueban: una campaña de una sola fase reproduce la ejecución independiente bit a bit, un conjunto de semilla fija es estable byte a byte, y con un reloj de ruido blanco de frecuencia la media del conjunto cae dentro del intervalo informado con la dispersión coincidente con sqrt(q_wf * tau). MODELLED: el arrastre aditivo y el retenedor de orden cero son decisiones de modelado, y cada fase lleva la etiqueta del tipo de escenario que la ejecutó.

# attr:alt
seg-b2c7cd1f9712 = El gráfico que escribe el motor para scenarios/campaign-sweep-jammer-power.toml, tipo de escenario campaign

# text
# c1: docs/kinds/campaigns.md
seg-ea93f81fa08b = Fuente: <c1/>

# text
seg-7f8e8af56bc0 = Campañas (familia de tipos de escenario)

# text
seg-c8012ee549ea = { "1" } tipo de escenario del motor v{ $version }. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Todas las etiquetas de aquí son las del motor o las de la matriz de verificación; un tipo es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
# c1: kshana scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-09ed7c4e175c = Páginas temáticas: <a1>CAMPAIGNS</a1>. Ejecute una: <c1/>. Todas las familias: <a2>KINDS.md</a2>.

# attr:alt
seg-b49ec180e810 = Hoja de contactos de los gráficos que el motor genera para los tipos de escenario de la familia Campañas

# text
seg-4e31c8daf798 = Registro

# text
seg-b2016159c9d0 = Campaña: tipos de escenario existentes compuestos en una sola ejecución, con cada número leído de una ejecución real del tipo indicado.

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-25148644a262 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-e0334a6899b6 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>campaign</a1>.

# text
seg-906f63ffbc30 = <s1>Anterior</s1>Código de conducta

# text
seg-cdf23ced49bd = <s1>Siguiente</s1>Relojes, temporización y holdover
