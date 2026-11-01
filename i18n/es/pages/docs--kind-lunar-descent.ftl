# docs--kind-lunar-descent: translations (es)

seg-f942b36a11c4 = Aún no está en GitHub

seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

seg-1c1eeb2dcaa0 = Página de la familia: <a1>Lunar y cislunar</a1>

seg-6a26b9ab59fe = Página del tema: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = differential

seg-2d84b341a41f = Etiqueta del resultado (la del motor): MODELLED

seg-626ab55f0424 = MODELLED (resultado <c1/>)

seg-e66e2ca31e54 = Página del tema: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Fuente: <c1/>

seg-d4df5aa9b7b0 = <c1/> (tipo de escenario)

seg-2cd0d5385530 = Presupuesto de dispersión de aterrizaje MODELLED para un descenso propulsado a un emplazamiento polar sur (clase Artemis). Por cada eje horizontal, un modelo de error inercial de cinco estados (posición, velocidad, sesgo del acelerómetro, inclinación de actitud, sesgo del giróscopo) es impulsado por la fuerza específica del descenso; un filtro secuencial toma posiciones de las ayudas habilitadas: una posición AFS de los relés visibles de una constelación ILLUSTRATIVE de clase LCNS (autónoma, o diferencial usando el residuo del enlace de corrección de lunar-differential-pnt, con el reloj asistido cuando solo hay tres relés visibles) y una posición relativa al terreno (el correlador TERCOM/SITAN del crate sobre un relieve sintético, o la cota de Cramer-Rao de correlacionar una ventana de elevación del DEM polar sur real de LOLA). La hora lunar entra a través del reloj del vehículo en las posiciones (el desfase LTC-TT de lunar-time-offset, o la incertidumbre de su banda publicada) y como un error de etiqueta de tiempo a lo largo de la trayectoria. Informa de la elipse de aterrizaje de 3 sigma, R95, las fuentes inerciales de forma cerrada, la contribución de cada ayuda, la ablación de cada combinación de ayudas, una calibración Monte Carlo de la elipse y la covarianza transmitida. MODELLED: clase de IMU, conjunto de relés, perfil de descenso y término de guiado ilustrativos; terrain-nav usa un relieve sintético a escala métrica terrestre; la disponibilidad de AFS es una época con una máscara plana. Sin respaldo de ninguna agencia; software de carácter consultivo, no un equipo de navegación certificado.

seg-c6c1a8f184ed = Una ejecución de <c1/> se resume así: lunar-descent | -89.50 deg | solo inercial 517/517 m (E/N) | con ayudas 7.6/4.8 m | dispersión R95 { "51" } m | elipse de 3 sigma { "64" } x { "62" } m | { "99.1" } % dentro (se espera { "98.9" } %) (MODELLED)

seg-dfdb7de68515 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = El ejemplo <c1/> establece, entre otros:

seg-8073ece4c900 = El gráfico que escribe el motor para scenarios/lunar-descent.toml, tipo de escenario lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: un modelo de error inercial de cinco estados por eje (posición, velocidad, sesgo del acelerómetro, inclinación, sesgo del giróscopo) durante un descenso propulsado, ayudado por posiciones AFS (autónomas o diferenciales, con el caso de tres rel

seg-bfe4c0a04288 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: un modelo de error inercial de cinco estados por eje (posición, velocidad, sesgo del acelerómetro, inclinación, sesgo del giróscopo) durante un descenso propulsado,. Referencia independiente (InternalConsistency): La deriva inercial de forma cerrada, los resultados propios de los tipos de escenario reutilizados y la calibración de la elipse de 3 sigma (la fracción interior coincide con su valor esperado) en las pruebas. No se compara ningún aterrizaje en vuelo ni ensayado

seg-ed286f215c96 = Presupuesto de dispersión de aterrizaje MODELLED para un descenso propulsado a un emplazamiento polar sur (clase Artemis). (catálogo de tipos de escenario (<c1/>))

seg-c1bd92ba429b = MODELLED: clase de IMU, conjunto de relés, perfil de descenso y término de guiado ilustrativos; terrain-nav usa un relieve sintético a escala métrica terrestre; la disponibilidad de AFS es una época con una máscara plana. (catálogo de tipos de escenario (<c1/>))

seg-85714bc3cf2a = HONESTIDAD: MODELLED. La clase de IMU, el perfil de descenso, el conjunto de relés, el error de la señal en el espacio y el término de guiado son entradas ILLUSTRATIVE, no mediciones. El modo terrain-nav usa el relieve sintético autocontenido y una escala métrica terrestre, de modo que el término de terreno de aquí es el comportamiento del correlador sobre un sustituto, no una afirmación sobre el relieve polar sur: la variante lola-crlb (lunar-descent-lola.toml) usa el real (comentario del archivo de escenario, líneas { "14" } a { "20" })

seg-3eb1b3b03600 = Presupuesto de dispersión de aterrizaje en un emplazamiento polar lunar (<c1/>) es MODELLED, no validado: comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Anterior</s1>lunar-beacon

seg-ca9b68783354 = <s1>Siguiente</s1>lunar-differential-pnt
