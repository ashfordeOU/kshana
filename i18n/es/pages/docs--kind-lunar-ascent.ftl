# docs--kind-lunar-ascent: translations (es)

seg-f942b36a11c4 = Aún no está en GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

seg-1c1eeb2dcaa0 = Página de la familia: <a1>Lunar y cislunar</a1>

seg-6a26b9ab59fe = Página del tema: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Fuente: <c1/>

seg-b8ef47331221 = <c1/> (tipo de escenario)

seg-ae3053a1f6c8 = Ascenso propulsado MODELLED desde un emplazamiento de superficie polar sur hasta la órbita de encuentro, y la covarianza de posición y velocidad que transporta de vuelta a la órbita (clase Artemis). El modelo de error inercial de cinco estados por eje de lunar-descent (posición, velocidad, sesgo del acelerómetro, inclinación de actitud, sesgo del giróscopo, impulsado por la fuerza específica) se ejecuta en los tres ejes del emplazamiento a partir del estado de superficie con el que entra la fase; una posición AFS de los relés visibles de una constelación ILLUSTRATIVE de clase LCNS (autónoma, o diferencial usando el residuo del enlace de corrección de lunar-differential-pnt, con el reloj asistido cuando solo hay tres relés visibles) se toma a un intervalo indicado, con la hora lunar entrando a través del reloj del vehículo y un error de etiqueta de tiempo a lo largo de la trayectoria. Informa de las fuentes inerciales de forma cerrada, de la contribución de la ayuda, de la ablación, de los 1 sigma de navegación durante el ascenso, de la dispersión al corte del motor junto al conocimiento de navegación, y de la covarianza MCI completa de 6x6 en la inserción con la correlación posición-velocidad conservada. MODELLED: clase de IMU, fuerza específica, conjunto de relés y dispersión al corte ilustrativos; errores mantenidos en los ejes del emplazamiento de lanzamiento; el estado nominal de salida es un sustituto. Sin respaldo de ninguna agencia; software de carácter consultivo, no un equipo de navegación certificado.

seg-fc4d2ba3f99e = Una ejecución de <c1/> se resume así: lunar-ascent | -89.50 deg | solo inercial { "785" } m / { "3.49" } m/s | con AFS { "11.4" } m / { "0.071" } m/s | dispersión de inserción { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = El ejemplo <c1/> establece, entre otros:

seg-ebc18c9bcbac = differential

seg-3843825d0733 = us

seg-2d84b341a41f = Etiqueta del resultado (la del motor): MODELLED

seg-463a919e84d5 = El gráfico que escribe el motor para scenarios/lunar-ascent.toml, tipo de escenario lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: el modelo de error inercial de cinco estados por eje ejecutado durante un ascenso propulsado con fuerza específica a lo largo de la trayectoria, ayudado por posiciones AFS y la hora lunar, que informa de la covarianza de posición y velocidad de inserción transportad

seg-4e0c4b02eac0 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: el modelo de error inercial de cinco estados por eje ejecutado durante un ascenso propulsado con fuerza específica a lo largo de la trayectoria, ayudado por posiciones AFS. Referencia independiente (InternalConsistency): La deriva inercial de forma cerrada y comprobaciones de monotonicidad en las pruebas. No se compara ningún ascenso en vuelo

seg-8732ad9f7e07 = <b>MODELLED</b> El propagador que comparten los tipos de escenario lunares (GRAIL GL0660B de grado y orden { "150" }, la Tierra y el Sol como terceros cuerpos, relatividad, orientación lunar DE440) comparado con las trayectorias públicas. Referencia independiente (ExternalDataset): Efemérides de nave de JPL Horizons para LRO y CAPSTONE, frente a umbrales fijados de antemano en xval/mission-thread-lunar/PREREGISTRATION.md (enmiendas { "1" } a { "6" }). LRO: MET, { "33" } m de mayor diferencia 3D y { "2.4" } m RMS radial frente a { "500" } m y { "60" } m. CAPSTONE: NOT MET, una diferencia de posición final de { "136.8" } km frente a { "25" } km y una diferencia de periapsis de { "28.4" } km frente a { "10" } km, sin haberse aislado las causas. La fila es modelada porque el umbral de CAPSTO

seg-626ab55f0424 = MODELLED (resultado <c1/>)

seg-745dfc03a929 = Ascenso propulsado MODELLED desde un emplazamiento de superficie polar sur hasta la órbita de encuentro, y la covarianza de posición y velocidad que transporta de vuelta a la órbita (clase Artemis). (catálogo de tipos de escenario (<c1/>))

seg-3fd0cca78937 = MODELLED: clase de IMU, fuerza específica, conjunto de relés y dispersión al corte ilustrativos; errores mantenidos en los ejes del emplazamiento de lanzamiento; el estado nominal de salida es un sustituto. (catálogo de tipos de escenario (<c1/>))

seg-2cfb37d39847 = HONESTIDAD: MODELLED. La clase de IMU, la alineación, la fuerza específica y la dispersión al corte son entradas ILLUSTRATIVE, no mediciones. Los errores se mantienen en los ejes este-norte-arriba del emplazamiento de lanzamiento, sin la curvatura de la trayectoria en el sentido del alcance, y el estado nominal de salida es un sustituto en la vertical local del emplazamiento: solo la covarianza es el resultado. No se afirma concordancia con ningún vehículo real. Software de carácter consultivo, no c (comentario del archivo de escenario, líneas { "11" } a { "15" })

seg-6faf49cac41a = Ascenso propulsado desde un emplazamiento polar lunar a una órbita de inserción (<c1/>) es MODELLED, no validado: comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = La propagación con el modelo de fuerzas lunar frente a trayectorias públicas reconstruidas de orbitadores lunares y cislunares es MODELLED, no validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Página del tema: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Anterior</s1>link-budget

seg-59d4cb995cb9 = <s1>Siguiente</s1>lunar-attack-surface
