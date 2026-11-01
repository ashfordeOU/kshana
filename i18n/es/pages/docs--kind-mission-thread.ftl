# docs--kind-mission-thread: translations (es)

seg-f942b36a11c4 = Aún no está en GitHub

seg-be831b52a339 = y { "4" } más en la matriz.

seg-936e96edf423 = <b>MODELLED</b> El tipo de escenario <c1/>: un documento de fases, cada una de uno de ocho tipos registrados, ejecutadas en orden con la covarianza de 6x6, el reloj y el marco transmitidos bajo una regla indicada (<c2/>; <c3/>, ruido de aceleración blanco sobre un intervalo indicado Pruebas: <a1>field_units_global.rs</a1>.

seg-795e0409fa5a = <b>MODELLED</b> La fase <c1/>: el estado medio mediante el propagador de Cowell del motor (masa puntual terrestre y J2, el Sol y la Luna como terceros cuerpos, la Luna a partir del kernel DE440 del hilo donde cubre el segmento y el Sol a partir de la serie analít

seg-6a26b9ab59fe = Página del tema: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Etiqueta del resultado (la del motor): MODELLED

seg-e66e2ca31e54 = Página del tema: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-6ba426630d7e = Fuente: <c1/>

seg-e2ba596c17c6 = <c1/> (tipo de escenario)

seg-4816ff3c82ef = Tipo de escenario del motor v{ $version }, familia <a1>Hilos de misión</a1>. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

seg-1ec485468daa = Presupuesto de errores de navegación y temporización MODELLED de una cadena indicada de fases de misión, desde el lanzamiento hasta la entrada: lanzamiento y ascenso, encuentro y acoplamiento en órbita terrestre baja (repetible), inyección translunar y crucero cislunar, encuentro en órbita lunar, descenso, estancia en la superficie, ascenso y el regreso y la entrada, cada fase uno de ocho tipos registrados con sus propios sensores y filtro. La covarianza de 6x6, el reloj y el marco se transmiten de una fase a otra bajo una regla indicada (carry, inflate o reacquire); las conversiones de marco y de escala de tiempo (GCRF, MCI, MCMF, UTC, TT, TDB, LTC) son filas de presupuesto propias, con el estado de la Luna a partir de un recorte opcional del kernel DE440 y la serie analítica como alternativa indicada. Una superposición opcional de la red terrestre fija el ciclo de seguimiento de cada fase. Informa del presupuesto por fase (1 sigma de entrada, máximo y salida, cada contribución con su unidad), el margen frente a un requisito indicado, el eslabón más débil, los eventos y una figura de línea de tiempo. MODELLED: cada número es una entrada indicada; la cadena sigue una sola pila y no se modela ningún vehículo. Solo fuentes públicas; sin afiliación ni respaldo de ninguna agencia; software de carácter consultivo, no un equipo de navegación certificado.

seg-d6eb3dbb87c7 = Una ejecución de <c1/> se resume así: mission-thread | { "11" } fases | hilo de misión de clase Artemis (ILLUSTRATIVE) | eslabón más débil descent | MODELLED

seg-9bb19202a104 = Campos obligatorios: <c1/>, <c2/>, <c3/>

seg-e1faea3151d6 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-094b47cf8ae2 = El ejemplo <c1/> establece, entre otros:

seg-e5d2d8da2ec0 = gcrf

seg-2468a5014f25 = utc

seg-e92b7836bae3 = 2028-01-01T00:{ "00" }:00Z

seg-ffe559d3ff23 = cruise

seg-3be4934f4f4e = menor margen frente a un requisito indic

seg-f32a7f31e191 = deriva inercial, sin ayuda, este

seg-9fde3fc1cb5b = descent

seg-a07521d13bb4 = El gráfico que escribe el motor para scenarios/mission-thread-artemis-class.toml, tipo de escenario mission-thread

seg-423ce11b54cd = <b>MODELLED</b> La fase <c1/>: una covarianza de posición y velocidad de velocidad constante con ruido de aceleración blanco (el grado de navegación a estima), una posición GNSS de precisión indicada aplicada tras el tiempo de adquisición y fuera de los desvanecimientos indicados, un reloj de sesgo y

seg-f393e01ac642 = <b>MODELLED</b> La fase <c1/>: el estado relativo en los ejes LVLH del objetivo con la transición de Clohessy-Wiltshire de forma cerrada, una covarianza de Kalman de 6x6 con ruido de aceleración blanco y actualizaciones de posición cuya varianza es la del sensor a la dis

seg-c9ff01a17f3f = <b>MODELLED</b> El tipo de escenario <c1/>: un documento de fases, cada una de uno de ocho tipos registrados, ejecutadas en orden con la covarianza de 6x6, el reloj y el marco transmitidos bajo. Referencia independiente (InternalConsistency): Cálculos manuales en las pruebas (el crecimiento de la covarianza en línea recta, la rotación sidérea media, la tasa secular del reloj lunar) y, solo para el estado de la Luna, los recortes del kernel DE440 confirmados frente a valores fijados de JPL Horizons (el peor { "2.6" } m y { "7e-6" } m/s). No se compara ningún dato de misión con la cadena; sus fases son filas propias. El documento es una cadena declarada con entradas ILLUSTRATIVE, solo fuentes públicas y sin respaldo de ninguna age

seg-529c9f8e8363 = <b>MODELLED</b> La fase <c1/>: una covarianza de posición y velocidad de velocidad constante con ruido de aceleración blanco (el grado de navegación a estima), una posición GNSS de precisión indicada a. Referencia independiente (InternalConsistency): El estado estacionario de Riccati y el cálculo manual de la predicción en las pruebas. Nada de aquí modela un vehículo de lanzamiento ni un receptor; cada número es una entrada indicada

seg-01ef16f03f02 = <b>MODELLED</b> La fase <c1/>: el estado relativo en los ejes LVLH del objetivo con la transición de Clohessy-Wiltshire de forma cerrada, una covarianza de Kalman de 6x6 con ruido de aceleración blanco y . Referencia independiente (InternalConsistency): Un cálculo manual de un solo eje de la predicción y la actualización en la prueba; la transición de Clohessy-Wiltshire es la que cw_dynamics comprueba frente a una integración numérica independiente. Los sensores son ILLUSTRATIVE y no se compara ningún encuentro real

seg-d9a1ea509a3c = Presupuesto de errores de navegación y temporización MODELLED de una cadena indicada de fases de misión, desde el lanzamiento hasta la entrada: lanzamiento y ascenso, encuentro y acoplamiento en órbita terrestre baja (repetible), inyección translunar y crucero cislunar, encuentro en órbita lunar, descenso, estancia en la superficie, ascenso y el regreso y la entrada, cada fase uno de ocho tipos registrados con sus propios sensores y filtro. (catálogo de tipos de escenario (<c1/>))

seg-80221e9351e4 = MODELLED: cada número es una entrada indicada; la cadena sigue una sola pila y no se modela ningún vehículo. (catálogo de tipos de escenario (<c1/>))

seg-637296d00802 = HONESTIDAD. Cada número de aquí es ILLUSTRATIVE: una cifra redonda elegida para que la cadena funcione, no el rendimiento de ningún vehículo, sensor, estación o red. La cadena sigue una sola pila como simplificación indicada; no se modelan los cambios de vehículo, los traspasos de tripulación ni la estación en órbita lunar, las órbitas lunares son las circulares y polares de { "100" } km que vuelan los tipos de escenario lunares (no la órbita de halo casi rectilínea), y la maniobra TLI i (comentario del archivo de escenario, líneas { "11" } a { "17" })

seg-f6574a80a60a = Presupuesto de errores de navegación y temporización de una cadena de fases de misión desde el lanzamiento hasta la entrada (<c1/>) es MODELLED, no validado: comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-9faba276f210 = Lanzamiento y ascenso a una órbita de estacionamiento con adquisición y desvanecimiento de GNSS (<c1/>) es MODELLED, no validado: comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-20bbe2135d61 = Navegación relativa hasta la envolvente de acoplamiento en órbita terrestre baja a lo largo de tramos de sensor (<c1/>) es MODELLED, no validada: comprobada frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-c60fd7868746 = Inyección translunar y crucero cislunar: estado medio y covarianza propagados con actualizaciones de seguimiento (<c1/>) es MODELLED, no validada: comprobada frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-c10f77a86f4d = Página de la familia: <a1>Hilos de misión</a1>

seg-f3279128de3b = <s1>Anterior</s1>mars-pnt

seg-2854e6a75833 = <s1>Siguiente</s1>moonlight-service-volume

seg-1e77eae03d2c = <b>MODELLED</b> La fase <c1/>: el estado medio mediante el propagador de Cowell del motor (masa puntual terrestre y J2, el Sol y la Luna como terceros cuerpos, la Luna a partir del hilo. Referencia independiente (InternalConsistency): El teorema de Liouville (el determinante de la matriz de transición de estado de la parte conservativa es uno) y una diferencia más fina en las pruebas; el estado medio se compara con una trayectoria pública en la fila siguiente, que no alcanza. El error de maniobra, las actualizaciones y la covarianza no se comparan con nada
