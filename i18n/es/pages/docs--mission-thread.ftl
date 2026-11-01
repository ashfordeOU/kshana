# docs--mission-thread: translations (es)

seg-e27476e37522 = Tierra

seg-34bdcfd66ded = En la rama del repositorio de la que proceden estos documentos; aún no está en GitHub

seg-092dd691ca17 = El informe

seg-f942b36a11c4 = Aún no está en GitHub

seg-b03d56f501c3 = Tipo

seg-2afa300864a9 = Parámetros

seg-b7cf72949a21 = Fuente: <c1/>

seg-32755afa0f78 = El hilo de misión

seg-d4af67363efc = Software de carácter consultivo, no un equipo de navegación certificado. Solo fuentes públicas; sin afiliación ni respaldo de ninguna agencia, y nada de aquí afirma conformidad con los requisitos de ningún programa.

seg-816770c97995 = <c1/> encadena fases de una misión, cada una de uno de ocho tipos registrados con sus propios sensores y filtro, e informa del <b>presupuesto de errores de navegación y temporización</b> de toda la cadena: para cada fase, la posición, la velocidad y el sesgo de reloj de 1 sigma en la entrada, en el máximo y en la salida; cada contribución a él, con su unidad; el margen frente a un requisito que usted indique; el eslabón más débil; los eventos fechados; y una figura de línea de tiempo. Cada número es <b>MODELLED</b>: una entrada indicada o un modelo de una. Las únicas filas con referencia independiente externa están en <s1><c2/></s1> y dicen qué prueban.

seg-c29a19879c84 = Ejecute el ejemplo desde una copia del repositorio (lee un recorte confirmado del kernel de la Luna):

seg-00f84b734853 = El documento

seg-9979b2c873df = <b>Un documento se rechaza, no se adivina,</b> cuando un identificador de fase se repite, una lista <c1/> está vacía, un nombre es desconocido, una clave de modelo no es una que el tipo de escenario conoce, una clave de duración discrepa de <c2/>, o una fase enumera una fuente para la que su modelo no da números.

seg-9b1e6ac618b5 = Qué hace un traspaso

seg-0e965f3e30fa = El estado transmitido es la covarianza completa de 6x6 de <c1/> en unidades SI, el reloj (sesgo, deriva y su covarianza, con una escala de tiempo asociada), el marco, el tiempo de misión y una etiqueta de evidencia. Un traspaso nunca reinicia una covarianza.

seg-47599d03571d = Regla

seg-023113cc5afb = transmite el estado sin cambios

seg-43967d0b6dd8 = ruido de aceleración blanco de PSD <c1/> sobre <c2/> en un modelo de línea recta; la fila indica ambos

seg-2c791ab0fd0f = navegación a estima durante <c1/>, y luego un eje se fija al piso de la fuente solo donde el piso es menor; nunca por debajo del piso, nunca un reinicio

seg-36b9117f5379 = Marcos y escalas de tiempo

seg-5853aaba827f = El hilo convierte en el traspaso, nunca dentro de una fase, y cada conversión es su propia fila de presupuesto. Marcos: GCRF, MCI, MCMF (ITRF y LVLH se rechazan con el motivo). <c1/> desplaza el origen según el estado geocéntrico de la Luna: el estado de grado DE440 del kernel donde cubre la época (sustituto de { "5" } m y { "1" } mm/s; peor caso medido { "2.6" } m frente a valores fijados de JPL Horizons), y si no la serie analítica con su RMS medido de { "195.7" } km, que la fila indica; por tanto, un ejemplo lunar debe llevar un kernel que cubra su época. <c2/> es la rotación sidérea media con los ejes alineados en la época y sin libración. Las escalas de tiempo pasan por TT: <c3/> exacta, <c4/> añade { "14" } us, <c5/> usa la tasa secular de <c6/> con su banda de { "56" } a { "59" } us/día como incertidumbre de la tasa.

seg-5ee610d8ab89 = Los ocho tipos de fase

seg-70b73f1acebf = Segmento

seg-0e39a468de1d = ascenso propulsado a una órbita de estacionamiento: covarianza de velocidad constante con ruido de aceleración blanco, adquisición y desvanecimiento de GNSS, holdover del reloj

seg-d359ae5982a6 = claves <c1/> en <c2/>

seg-57c44fd6e061 = navegación relativa a lo largo de tramos de sensor: transición de Clohessy-Wiltshire en LVLH, covarianza de Kalman de 6x6, ventana de acoplamiento

seg-7dce961e2c67 = más abajo

seg-4b233c6cdf8b = maniobra TLI y crucero cislunar: propagación de Cowell, matriz de transición de estado por diferencias finitas, actualizaciones de gnss-ssv y de seguimiento terrestre

seg-352e27d02c86 = deriva de regreso hasta la interfaz de entrada; sigma del ángulo de trayectoria de vuelo, probabilidad de corredor, deceleración máxima, huella

seg-95eb34012fe8 = lunar

seg-cc72d2fc8a43 = navegación relativa hasta el acoplamiento en una órbita lunar

seg-2cfa6846c937 = presupuesto de dispersión de aterrizaje en un emplazamiento polar

seg-e9f5fc58fe12 = igual

seg-ba3c65a210dd = disponibilidad de PNT y temporización en la superficie por emplazamiento y estación

seg-8b9c5124dd3c = ascenso propulsado a una órbita de inserción

seg-4ce0fa85457c = Los tipos de escenario lunares son también tipos de escenario independientes; el diseño y las evidencias están en <a1><c1/></a1>.

seg-d16877f38793 = El presupuesto lleva los sigmas <b>relativos</b>; la covarianza absoluta del perseguidor se transmite sin cambios y una fila lo indica, porque esta fase mide los vehículos entre sí, no respecto de la Tierra. La covarianza relativa inicial es la absoluta del perseguidor más los sigmas indicados del objetivo, sumados como si fueran independientes (conservador). Claves: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcionalmente <c6/> y <c7/>, y uno o más <c8/> con <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> o <c15/>, parámetros ILLUSTRATIVE en <c16/>) y <c17/>; las duraciones de los tramos suman la de la fase. La ventana de acoplamiento es el tiempo desde que el sigma relativo permanece dentro de la envolvente de captura hasta el final de la fase. Las repeticiones son fases separadas con sus propios identificadores.

seg-088b78574ab4 = El estado medio es el propagador de Cowell del motor con gravedad terrestre y J2 y el Sol y la Luna como terceros cuerpos. La covarianza recorre cada segmento <c1/> con una matriz de transición de estado por diferencias hacia adelante (la ejecución nominal y seis ejecuciones perturbadas) y un ruido de aceleración blanco. La maniobra va a lo largo de la velocidad de entrada con una fracción de tamaño y un error de apuntamiento indicados. <b>Límite indicado:</b> los recortes confirmados del kernel de la Luna contienen la Luna pero no el Sol, de modo que el propagador toma la Luna del kernel y el Sol de la serie analítica (el término de tercer cuerpo del Sol es insensible al error de esa serie); la fase indica cuál usó en un evento, y donde ningún kernel cubre un segmento usa la serie analítica para ambos. La maniobra <b>no está apuntada</b>: el estado nominal es adonde vaya la maniobra indicada, y las fases lunares toman solo la covarianza.

seg-e5a67295a5ae = Actualizaciones, usadas solo cuando el documento enumera la fuente: <c1/> (posiciones con disponibilidad y PDOP del barrido de volumen de servicio espacial del motor a lo largo de una órbita terrestre osculatriz que sustituye al arco, un barrido por <c2/>; sigma de la posición = PDOP mediano multiplicado por <c3/>; la forma de información esperada mantiene la ejecución determinista) y <c4/> (distancia y velocidad de distancia a lo largo de la dirección geocéntrica, de modo que no se observa el plano del cielo; la varianza de la actualización se divide por el ciclo de seguimiento). Claves: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, opcionalmente <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = La deriva es la deriva de <c1/> sin maniobra, que termina en la interfaz de entrada; sus claves son las claves de la deriva indicadas arriba. En la interfaz la fase lee el ángulo de trayectoria de vuelo y su sigma a partir de la covarianza completa, la probabilidad de que el ángulo esté dentro de un corredor indicado, la deceleración máxima en el ángulo nominal y en ambos bordes del corredor (la entrada balística plana del motor junto a la forma cerrada de Allen-Eggers) frente a un límite opcional, y la huella: en el sentido del alcance a partir de una sensibilidad indicada, transversal a partir de la covarianza de la interfaz a través del plano orbital. Claves: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, opcionalmente <c8/>, <c9/> y <c10/> (el estado de regreso nominal, seis números, cuando la cadena no tiene ninguna maniobra de regreso a la Tierra que lo produzca). Nada de aquí modela la sustentación, el guiado ni el calentamiento de una cápsula.

seg-352783ef7181 = La superposición de la red terrestre

seg-69d6ab8e93bc = Una tabla opcional <c1/> da estaciones y la elevación mínima de seguimiento; para cada fase que nombra, el hilo calcula la fracción de la fase que una estación puede seguir y se la pasa a la fase como el ciclo que escala su tasa de actualización de seguimiento terrestre. Geometrías: <c2/> (el estado de entrada volado en dos cuerpos con J2, para las fases en órbita baja), <c3/> (el vehículo en la posición de la Luna, para el crucero cislunar) y <c4/> (un ciclo que usted indica). Un cambio de estación pierde <c5/>; el presupuesto de la fase recibe el intervalo más largo sin ninguna estación a la vista y un evento indica el ciclo. Nada modela las antenas ni las programaciones de una red.

seg-467b14d7ef59 = <c1/>: <c2/> (índice, identificador, tipo, tiempos, etiqueta, fuentes de navegación y de tiempo, fuente limitante, sigmas de entrada, máximo y salida, requisito, margen, <c3/> con una unidad por fila, <c4/>), el <c5/> (el menor margen frente a un requisito indicado, o si no la mayor posición máxima), el <c6/>, la <c7/> del hilo (la etiqueta de la fase más débil) y un bloque <c8/>. La figura es la posición de 1 sigma y el sesgo de reloj frente al tiempo de misión, una banda por fase.

seg-a3c40c51c2ff = Qué son las evidencias

seg-1168810d4407 = La etiqueta del hilo es la de la fase más débil, y cada fase es MODELLED. El propagador lunar se compara con LRO y CAPSTONE (<s1><c1/></s1>); el arco cislunar se compara con una trayectoria pública de Horizons (<s2><c2/></s2>). Una fila supera o no alcanza un umbral fijado en un archivo confirmado antes de la ejecución, y un fallo se registra como fallo. Nada es VALIDATED salvo que el registro lo diga.

seg-ee3c5b58e6fa = <s1>Anterior</s1>Órbita y superficie lunares como infraestructura

seg-b963f8a02aed = <s1>Siguiente</s1>Hilo de misión: el segmento lunar

seg-af81a8087ca7 = entry
