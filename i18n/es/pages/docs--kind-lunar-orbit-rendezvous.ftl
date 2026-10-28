# docs--kind-lunar-orbit-rendezvous: translations (es)

seg-34bdcfd66ded = En la rama del repositorio de la que proceden estos documentos; aún no está en GitHub

seg-f942b36a11c4 = Aún no está en GitHub

seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

seg-1c1eeb2dcaa0 = Página de la familia: <a1>Lunar y cislunar</a1>

seg-6a26b9ab59fe = Página del tema: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Etiqueta del resultado (la del motor): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> El propagador que comparten los tipos de escenario lunares (GRAIL GL0660B de grado y orden { "150" }, la Tierra y el Sol como terceros cuerpos, relatividad, orientación lunar DE440) comparado con las trayectorias públicas. Referencia independiente (ExternalDataset): Efemérides de nave de JPL Horizons para LRO y CAPSTONE, frente a umbrales fijados de antemano en xval/mission-thread-lunar/PREREGISTRATION.md (enmiendas { "1" } a { "6" }). LRO: MET, { "33" } m de mayor diferencia 3D y { "2.4" } m RMS radial frente a { "500" } m y { "60" } m. CAPSTONE: NOT MET, una diferencia de posición final de { "136.8" } km frente a { "25" } km y una diferencia de periapsis de { "28.4" } km frente a { "10" } km, sin haberse aislado las causas. La fila es modelada porque el umbral de CAPSTO

seg-626ab55f0424 = MODELLED (resultado <c1/>)

seg-e482c9896140 = La propagación con el modelo de fuerzas lunar frente a trayectorias públicas reconstruidas de orbitadores lunares y cislunares es MODELLED, no validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Página del tema: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Fuente: <c1/>

seg-8beb22a0eb0b = <c1/> (tipo de escenario)

seg-2deefd8c547b = Navegación relativa MODELLED para un acoplamiento al estilo Orion-módulo de aterrizaje en una órbita lunar baja o una órbita polar elíptica (clase Artemis). Un perseguidor y un objetivo vuelan la misma órbita bajo el modelo de fuerzas lunar del crate; una estimación conjunta por lotes de Gauss-Newton de 21 parámetros a lo largo del arco (dos estados de vehículo y sesgos persistentes de la señal en el espacio) fusiona una posición absoluta por vehículo de un conjunto de relés ILLUSTRATIVE de clase LCNS (relés detrás de la Luna descartados, cuatro necesarios, el error de señal en el espacio de modo común se cancela entre los vehículos) y una distancia de enlace cruzado, con la precisión de medición de distancia a partir de la cota de seguimiento de código del piloto AFS de LunaNet. Informa del error formal y Monte Carlo de posición y velocidad relativas en los ejes LVLH del objetivo, la disponibilidad de posiciones, el error de estimación normalizado cuadrático medio frente a su valor esperado y toda prueba cuya iteración no convergió, la deriva por ignorar los armónicos de gravedad y la covarianza completa de 6x6 transmitida. Una comprobación de forma cerrada de Hill/Clohessy-Wiltshire se aplica al caso circular. MODELLED: conjunto de relés, presupuesto de errores y distribuciones a priori ilustrativos; la verdad de referencia y el estimador comparten un modelo de fuerzas, de modo que el NEES comprueba la autoconsistencia y no el error del modelo. Sin respaldo de ninguna agencia; software de carácter consultivo, no un equipo de navegación certificado.

seg-a6d29fc5f19b = Una ejecución de <c1/> se resume así: lunar-orbit-rendezvous | llo 100x100 km | sep { "2000" } m | posiciones { "74" } % | 1 sigma de posición relativa R/A/C 0.03/0.06/0.04 m | NEES medio { "6.51" } ({ "6" } esperado) | convergió a { "2000" } s (MODELLED)

seg-b7c86affeac1 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = El ejemplo <c1/> establece, entre otros:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Software de carácter consultivo, no un equipo de naveg

seg-4466fb6f4043 = Gauss-Newton por lotes a lo largo del arco

seg-d97b2505ac72 = El gráfico que escribe el motor para scenarios/lunar-orbit-rendezvous.toml, tipo de escenario lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: una estimación conjunta por lotes de Gauss-Newton de dos vehículos a lo largo del arco (veintiún parámetros: ambos estados y sesgos persistentes de posición de la señal en el espacio, comunes e independientes), ampliada sobre un cuarto, la mitad Pruebas: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: una estimación conjunta por lotes de Gauss-Newton de dos vehículos a lo largo del arco (veintiún parámetros: ambos estados y sesgos persistentes de la señal en. Referencia independiente (InternalConsistency): Autoconsistencia bajo un preregistro (xval/mission-thread-lunar/PREREGISTRATION.md, resultados e historial del estimador en RESULTS.md): el NEES medio del estado relativo es de { "5.85" } a { "5.93" } frente a la banda de { "5.2" } a { "6.8" } en cuatro configuraciones, MET con el cuarto diseño de estimador tras fallar tres diseños de filtro secuencial; la verdad de referencia y el estimador comparten un modelo de fuerzas, de modo que esto no dice nada sobre el error del modelo. El pro

seg-b2f273ea732d = Navegación relativa MODELLED para un acoplamiento al estilo Orion-módulo de aterrizaje en una órbita lunar baja o una órbita polar elíptica (clase Artemis). (catálogo de tipos de escenario (<c1/>))

seg-9d4f99557cc5 = MODELLED: conjunto de relés, presupuesto de errores y distribuciones a priori ilustrativos; la verdad de referencia y el estimador comparten un modelo de fuerzas, de modo que el NEES comprueba la autoconsistencia y no el error del modelo. (catálogo de tipos de escenario (<c1/>))

seg-158e44d47c0b = HONESTIDAD: MODELLED. El conjunto de relés, el error de la señal en el espacio, la fracción de modo común y las distribuciones a priori son entradas ILLUSTRATIVE, no mediciones; la verdad de referencia y el estimador comparten el modelo de fuerzas (un término central incorporado, J2 y C22). La comprobación de consistencia preregistrada B1 (NEES medio en [{ "5.2" }, { "6.8" }]) se alcanza en las cuatro configuraciones con el diseño por lotes: véase xval/mission-thread-lunar/RESULTS.md. No se afirma concordancia con ningún re (comentario del archivo de escenario, líneas { "10" } a { "14" })

seg-2a88a9650804 = Navegación relativa hasta el acoplamiento en una órbita lunar (<c1/>) es MODELLED, no validada: comprobada frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Anterior</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Siguiente</s1>lunar-station-coverage
