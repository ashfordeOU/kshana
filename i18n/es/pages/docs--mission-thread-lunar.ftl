# docs--mission-thread-lunar: translations (es)

seg-f942b36a11c4 = Aún no está en GitHub

seg-3b01a756c305 = Qué calcula

seg-b478421b21bb = Fuente: <c1/>

seg-dbd59cc01982 = El segmento lunar del hilo de misión de clase Artemis

seg-7b56ed698c30 = Cuatro tipos de escenario, cada uno también un tipo de fase de la interfaz <c1/> (<c2/>): transportan un presupuesto de errores de navegación y temporización a lo largo de una misión lunar al polo sur, desde el encuentro en órbita lunar hasta el aterrizaje, la estancia en la superficie y el ascenso de regreso a la órbita. <b>Cada número de aquí es MODELLED</b>: un modelo indicado con entradas ILLUSTRATIVE, ninguno de ellos una afirmación sobre ninguna misión, sistema o emplazamiento. «Clase Artemis» nombra una clase de concepto de misión, nada más; no se usan ni se afirman datos, productos ni respaldo de ninguna agencia, y nada de aquí está afiliado a ninguna. Software de carácter consultivo, no un equipo de navegación certificado. Kshana no transmite nada y no controla ningún hardware.

seg-5282ad2c498a = Fase y tipo

seg-9b927127e042 = Escenario de ejemplo

seg-40f3e1b2d58b = Núcleo

seg-2cfaaa8be402 = navegación relativa hasta el acoplamiento, polar circular de { "100" } km o polar elíptica de { "100" } km por { "3000" } km

seg-9ee09d63fed3 = el presupuesto de dispersión de aterrizaje en un emplazamiento polar sur

seg-c4568984e75c = <c1/>, <c2/> (necesita el DEM, una copia del repositorio)

seg-a098e14e6a63 = disponibilidad de posicionamiento y temporización por emplazamiento y estación

seg-8278ae655fcc = <c1/>, <c2/> (necesita el DEM, una copia del repositorio)

seg-249eff5159d0 = ascenso a la órbita de encuentro y la covarianza transportada de vuelta a la órbita

seg-36184e593ade = Cada núcleo es una función de <c1/>; una ejecución independiente construye la entrada por defecto (una covarianza inercial centrada en la Luna de { "100" } m y { "0.1" } m/s, un reloj LTC de { "1" } microsegundo) y la época por defecto 2028-01-01, y una ejecución en un hilo toma la entrada de la fase anterior. El hilo, no un núcleo, convierte marcos y escalas de tiempo y aplica la regla de traspaso: un envoltorio de fase convierte el estado de entrada a <c2/> (o a <c3/> para el mapa de superficie) y un reloj LTC mediante las conversiones del hilo, y las líneas de conversión se añaden al presupuesto de la fase. Un marco o una escala de tiempo que el hilo no puede convertir (ITRF, por ejemplo) se rechaza con el mensaje del hilo; un núcleo llamado directamente con un marco que no puede usar lo rechaza con el motivo. Una fase nunca reinicia una covarianza, solo transmite aquella con la que termina.

seg-59f4a1a2684e = Qué hace cada fase

seg-e112a34ef118 = Dos vehículos, un perseguidor y un objetivo, vuelan la misma órbita bajo el modelo de fuerzas lunar del crate (un campo de gravedad y la Tierra y el Sol como terceros cuerpos). Una estimación por lotes de Gauss-Newton a lo largo del arco recupera ambos estados iniciales a partir de:

seg-33bb01b1e72a = una posición absoluta por vehículo de un conjunto de relés ILLUSTRATIVE de clase LCNS (relés detrás de la Luna descartados, cuatro necesarios), cuya parte blanca es la cota de seguimiento de código del piloto AFS (BPSK({ "5" }), { "5.115" } Mchip/s) a la C/N0 indicada multiplicada por el cofactor de DOP;

seg-b061f6742a86 = un error de señal en el espacio <b>persistente</b> en cada posición: los errores de los relés no se promedian a lo largo de un arco de horas, de modo que se transportan como sesgos de posición constantes, uno común a ambos vehículos (<c1/> de la varianza, { "0.9" } por defecto, ILLUSTRATIVE) y otro independiente por vehículo. Un sesgo constante no da ningún beneficio de promediado, la lectura conservadora;

seg-437ac74b1400 = una distancia de enlace cruzado de la misma señal a su propia C/N0.

seg-3513a55e44e5 = Informa del error formal y Monte Carlo de posición y velocidad relativas en los ejes locales del objetivo, la fracción de épocas con posiciones en ambos vehículos, el error de estimación normalizado cuadrático medio (NEES) del estado relativo frente a su valor esperado de { "6" }, la deriva relativa por ignorar los armónicos de gravedad, una comprobación de forma cerrada de Hill (Clohessy-Wiltshire) para el caso circular, los modelos de sensor relativo terminal de <c1/> del hilo (parámetros ILLUSTRATIVE) junto a la cifra solo de señales, y la covarianza de 6x6 del perseguidor al final.

seg-5d3fa3e8486c = <b>Qué dice el resultado.</b> Solo con señales, la distancia de enlace cruzado fija la posición relativa a lo largo de la línea de visión, pero la posición relativa transversal a ella está limitada por el error independiente de la señal en el espacio y por lo que dé la dinámica; el acoplamiento necesita un sensor relativo, y las filas <c1/> muestran a qué distancia cada uno de los modelos de sensor del hilo supera a las señales. El resultado también depende de que la verdad de referencia y el estimador compartan un modelo de fuerzas; la opción de estimador <c2/> muestra el coste de ignorar los armónicos, y no se espera que esa ejecución sea consistente.

seg-66c4eb27641b = La fase vuela su propia órbita nominal (los campos <c1/>), de modo que no se usa el vector de posición y velocidad de entrada, solo su covarianza, marco y reloj; un evento del hilo lo indica.

seg-751f29ab7a35 = Por cada eje horizontal, un modelo de error inercial de cinco estados (posición, velocidad, sesgo del acelerómetro, inclinación de actitud, sesgo del giróscopo, impulsado por la fuerza específica del descenso) a partir de la covarianza de entrada y de la IMU, y luego un filtro secuencial sobre las ayudas habilitadas:

seg-c2eae4508a2f = <b>Posición AFS</b>: a partir de los relés visibles sobre una máscara plana, con el cofactor de DOP ENU multiplicado por un error de distancia del usuario. <c1/> usa el error de la señal en el espacio; <c2/> usa el residuo del enlace de corrección de <c3/>. Con exactamente tres relés a la vista el reloj se asiste, no se estima, y la posición lleva entonces <c4/>: aquí es donde la hora lunar entra en la posición.

seg-39c938fb24e9 = <b>Posición relativa al terreno</b>: <c1/> ejecuta el correlador TERCOM/SITAN del crate sobre su relieve sintético y una escala métrica terrestre (un sustituto, no el relieve polar sur); <c2/> toma la cota de Cramer-Rao de correlacionar una ventana de elevación del DEM real de LOLA en el emplazamiento, <c3/>, y no afirma ninguna posición donde el relieve restringe una sola dirección (el problema de apertura).

seg-795ef82edc61 = <b>Hora lunar</b>: el error de reloj en la posición combina el reloj de entrada, su crecimiento desde la sincronización y el término LTC-TT de <c1/>. Con <c2/> el vehículo cuenta TT y el desfase acumulado es un sesgo sin corregir; con <c3/> solo queda la incertidumbre de la banda publicada de { "56" } a { "59" } microsegundos por día sobre el horizonte. Un error de etiqueta de tiempo desplaza una posición a lo largo de la trayectoria en <c4/>.

seg-82b71e26bc89 = <b>Léalo con cuidado.</b> La dispersión por defecto está dominada por el término de guiado supuesto, y en cada emplazamiento polar sur la geometría de los relés es casi la misma, de modo que los emplazamientos difieren poco. La hora lunar importa poco a través del etiquetado de tiempo ({ "150" } m/s por unos pocos microsegundos es menos de un milímetro); importa cuando la geometría se degrada a tres relés.

seg-f5af0aef6649 = Para cada emplazamiento y estación (una época y una ventana posterior): posicionamiento por relés (cuatro o más relés a la vista por encima de la máscara y del horizonte de terreno del emplazamiento con PDOP por debajo del umbral, con las mismas funciones y la misma constelación que <c1/>; el resultado de un solo emplazamiento es igual a su cifra bit a bit), si la Tierra y el Sol están sobre el horizonte (Sol, Luna y orientación lunar analíticos, con libración incluida), y la disponibilidad de temporización (un relé o la Tierra a la vista) con el tramo más largo sin ninguno de los dos. La cifra de relés no cambia con la estación en este modelo (conjunto kepleriano, rotación media); las de la Tierra y el Sol sí. La fase transmite la covarianza sin cambios y disciplina el reloj a un piso de temporización (ILLUSTRATIVE, { "50" } ns), de modo que solo queda el mayor hueco de temporización que cubrir con holdover.

seg-0890ec65a04e = El modelo de cinco estados del descenso en los tres ejes del emplazamiento a partir del estado de superficie, una posición AFS a un intervalo indicado con el mismo tratamiento de la hora lunar, y la covarianza completa de posición y velocidad de 6x6 en la inserción transmitida, con la correlación posición-velocidad de cada eje conservada. La dispersión al corte del motor mueve el lugar donde está el vehículo y se informa junto a la covarianza de navegación, no se transporta. Los errores se mantienen en los ejes del emplazamiento de lanzamiento (sin curvatura en el sentido del alcance) y el estado nominal de salida es un sustituto; solo la covarianza es el resultado.

seg-f60b576fabcd = Cómo declara una fase un documento

seg-be8e0001ed0c = En un hilo, la tabla <c1/> de una fase es la propia tabla del escenario independiente. La duración de la fase es la <c2/> del hilo: un modelo que también indica su propia clave de duración (<c3/>, <c4/>, <c5/>, <c6/>) debe coincidir con ella o la fase se rechaza, y un modelo que omite la clave toma la del hilo. La semilla es la semilla de fase del hilo asociada al identificador, de modo que una fase ejecutada por separado con el mismo identificador y la misma semilla del hilo devuelve los números que devuelve en el hilo. Una clave de modelo mal escrita se rechaza, no se ignora. El traspaso entre fases, y las conversiones de marco y de escala de tiempo que necesita (inercial centrado en la Luna y fijo a la Luna, de la Tierra a la Luna, los pares LTC), pertenecen al hilo.

seg-52a6e2ec0a99 = Los diseños, las entradas y los umbrales se fijaron en <c1/> antes de cualquier ejecución, con seis enmiendas fechadas, cada una declarada en el archivo; el veredicto de cada umbral, con los fallos y el historial del estimador incluidos, está en <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (el propagador frente a la trayectoria reconstruida de LRO, { "24" } h): MET, { "33" } m de diferencia 3D máxima frente a { "500" } m, { "2.4" } m RMS radial frente a { "60" } m.

seg-25464238f6bd = <b>A2</b> (el mismo propagador frente a la órbita de halo casi rectilínea de CAPSTONE a lo largo de una revolución de 6,5 días): <b>NOT MET</b>, { "136.8" } km de diferencia de posición final frente a { "25" } km, y { "28.4" } km de diferencia del radio osculador del periapsis frente a { "10" } km. Las causas no se aislaron (los candidatos son la presión de radiación y el albedo omitidos, la sensibilidad de la órbita al estado inicial y las series analíticas de la Tierra y el Sol); la fila sigue siendo MODELLED.

seg-e1099ad81a5d = Estas dos filas prueban el propagador que comparten los tipos de escenario lunares. <b>No prueban ningún filtro de navegación, señal ni presupuesto, y nada más de aquí tiene una referencia independiente externa.</b>

seg-9a4b2392aa92 = Todo lo demás es MODELLED, y las comprobaciones de consistencia de los tipos de escenario (B1 a B8 del preregistro) prueban una implementación frente a su propio modelo indicado, no frente a la Luna.

seg-3365490b59b7 = <s1>Anterior</s1>Hilo de misión: del lanzamiento a la entrada

seg-90932eed0074 = <s1>Siguiente</s1>Posicionamiento, navegación y temporización en LEO

seg-d655c932abbf = La dispersión de aterrizaje es el error de navegación en el contacto con la superficie más un término de guiado independiente (<c1/>, ILLUSTRATIVE, { "20" } m por eje por defecto). La tabla <c2/> ejecuta cada combinación de las ayudas. La elipse se calibra por Monte Carlo (la fracción de aterrizajes simulados dentro del contorno de 3 sigma frente al { "98.9" } % que da una gaussiana 2-D).
