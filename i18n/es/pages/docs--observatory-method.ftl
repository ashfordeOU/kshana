# docs--observatory-method: translations (es)

# text
seg-0857a94a948e = Límites

# text
seg-2247a2344710 = Significado

# text
seg-b652b86e6b8e = Estado

# text
# c1: docs/observatory/METHOD.md
seg-7ca62fa39e10 = Fuente: <c1/>

# text
seg-48e063b567d0 = Observatorio de interferencias: nota de método

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-d0e1d6cadc10 = Versión <c1/>, construida sobre <c2/>. Solo consultivo: esto es una descripción de cómo se veían los informes de posición publicados en días pasados, no una medición de ningún receptor, ni un pronóstico, ni una confirmación de interferencia, ni una atribución de su causa.

# text
seg-c5eab49b8d6f = Qué publica el observatorio

# text
seg-165ae7646608 = Un producto por día UTC y región, a partir de un archivo abierto de posiciones de aeronaves. Cada celda de una cuadrícula fija de latitud y longitud de 0.5 grados está en uno de <b>tres estados</b>:

# text
seg-cc07647eb12e = Una proporción alta de las aeronaves muestreadas en la celda informó de una exactitud de navegación baja ese día, claramente por encima del fondo de ese día.

# text
seg-3e1dd7caaee6 = Se muestrearon suficientes aeronaves y la proporción no alcanzó la regla.

# text
# c1: insufficient_sample
# c2: no_day_background
# c3: day_wide_effect
seg-8f0d9ad60d62 = Los datos no permitieron un dictamen. Esto <b>no</b> es «despejado». Cada celda publicada de este tipo lleva un motivo de datos: <c1/>, <c2/> o <c3/>. Una celda sin ninguna entrada fue vista por menos de { "5" } aeronaves distintas y se retiene.

# text
seg-e49e05b47061 = No se publica nada más: ni causa, ni actor, ni registro por aeronave. Los motivos describen si los datos del día eran suficientes, nunca por qué la exactitud era baja.

# text
# c1: kshana interference-map daily
seg-7b251c7860e0 = Tres archivos por día (<c1/>):

# text
# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: schema
# c3: kshana-observatory-day/1
seg-2008b0ba6ac7 = <c1/>: las celdas, con <c2/> <c3/>, el método y sus parámetros preregistrados, la licencia y la atribución, la regla de publicación y un aviso.

# text
# c1: observatory-adsb-<dataset>-<day>.png
seg-7d5b16eac4a3 = <c1/>: las mismas celdas como imagen (degradada, no degradada, no observada rayada; las celdas vacías no se observaron). Los fragmentos de texto del archivo repiten el aviso y la licencia.

# text
# c1: observatory-adsb-<dataset>-<day>.incidents.json
# c2: schema
# c3: kshana-incident-report/1
# c4: cause
# c5: not attributed
seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Las celdas degradadas contiguas (diagonales incluidas) forman un incidente con un cuadro delimitador y sus celdas. <c4/> es el texto fijo <c5/>. El archivo es una entrada para un ciclo de informar, confirmar y notificar (el ciclo de notificación de aviación que termina en un NOTAM); no es una confirmación ni un NOTAM.

# text
# c1: .manifest.json
seg-49b7bdae0d6e = y un <c1/> con el recuento de bytes y el SHA-256 de los tres archivos, el identificador del método, los contadores de entrada (filas leídas y excluidas) y el bloque del conjunto de datos, de modo que un producto pueda comprobarse y reproducirse.

# text
seg-d7bb390fb986 = Reglas de publicación (impuestas por el comando)

# text
# c1: --delay-hours
seg-87147317f8da = <b>Retraso de al menos { "24" } h.</b> El producto de un día se publica no antes del final de ese día UTC más <c1/> ({ "24" } o más; un valor menor se rechaza). El comando rechaza un día que aún no se puede publicar e indica la hora más temprana. No hay ningún interruptor para acortarlo.

# text
seg-43960c3f9b6c = Celdas gruesas.

# text
# c1: --cell-deg
seg-1a5ff10e5240 = <c1/> por debajo de { "0.5" } se rechaza.

# text
# c1: null
seg-e70d8d7f9980 = <b>Supresión.</b> Una celda vista por menos de { "5" } aeronaves distintas no se publica; un recuento inferior a { "5" } es <c1/> (cero incluido), como en el método base.

# text
seg-ab75582c5032 = <b>Sin atribución.</b> El vocabulario de estados y motivos no contiene ninguna causa; una prueba lo garantiza.

# text
seg-0e7d76d7efd0 = <b>Fuentes.</b> Solo adsb.lol (ODbL { "1.0" }), o un conjunto de datos del usuario con su propia licencia. <b>Se rechazan los datos de OpenSky Network</b> (su licencia no permite el uso comercial ni la redistribución de mapas derivados). ADS-B y AIS nunca se combinan.

# text
seg-dc28848046ac = <b>Licencia del producto.</b> Un archivo ADS-B por celda elaborado a partir de adsb.lol es una Base de Datos Derivada y lleva ODbL { "1.0" } y la atribución a adsb.lol en el archivo. El código de Kshana sigue siendo AGPL-3.0.

# text
seg-9eeba6648fec = La observable y el método base

# text
# c1: kshana-interference-map/adsb/v2
# c2: docs/INTERFERENCE-MAP.md
seg-7334dc45eb2f = Una aeronave ADS-B informa de cuán exacta cree que es su propia posición GNSS: <b>NACp</b> (Navigation Accuracy Category for Position, una cota horizontal del { "95" } % desde { "10" } NM hasta menos de { "3" } m) y <b>NIC</b> (Navigation Integrity Category, un radio de contención). El método base (<c1/>, <c2/>) cuenta, por celda y día, la proporción de <b>aeronaves distintas</b> cuyos informes dentro de la celda fueron mayoritariamente de baja exactitud, con salvaguardas: solo altitud por encima de { "5,000" } ft; una aeronave cuenta solo si informó de buena exactitud en otro lugar el mismo día (una línea base de equipamiento); la proporción de la celda debe superar la proporción mediana de las celdas del día en un margen; un día cuya mediana es ya alta se marca como confundido y ninguna celda se declara degradada. Los parámetros se fijaron a partir de las definiciones de los campos y de la regla de privacidad antes de examinar dato alguno, y se escriben en cada archivo de salida. El observatorio añade el vocabulario de tres estados, las reglas de publicación y los archivos anteriores, y no cambia ningún parámetro.

# text
# c1: --bbox
# c2: method.scope
seg-96cf298985c6 = <b>Ejecuciones regionales.</b> Con <c1/>, solo se leen los informes dentro del recuadro. La línea base de equipamiento y el fondo del día se calculan entonces solo a partir de los informes del recuadro, y el archivo lo indica (<c2/>). Un producto regional es, por tanto, un producto de los datos de esa región, no un recorte de uno global.

# text
seg-2e7007b56a44 = Relación con el método de NACp frente a HDOP de almanaque

# text
seg-4892485e534b = Pleninger, Topkova y Steiner, "GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data", The Aeronautical Journal { "129" } ({ "1331" }), { "206" } a { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, comparan el error de posición implícito en el NACp de una aeronave con el HDOP (dilución horizontal de la precisión) de la constelación GPS a partir de datos de almanaque, y marcan una aeronave como afectada cuando ambos discrepan; el artículo evalúa el método con experimentos de jamming deliberado de GPS.

# text
seg-74ec1aca8a22 = <b>Lo que usamos.</b> Solo el resumen publicado y el registro bibliográfico. El texto completo no estaba a nuestro alcance (de pago), de modo que no conocemos ni su correspondencia entre NACp y una estimación de error, ni su cálculo del HDOP, ni sus umbrales, y no afirmamos reproducirlos.

# text
seg-4f8471649a07 = <b>Lo que hace el observatorio en su lugar.</b> La pregunta a la que responde la comparación con el almanaque es «¿podría la sola geometría de la constelación explicar esta baja exactitud?». El método base responde a una pregunta relacionada sin almanaque: una proporción baja debe destacar frente al fondo del mismo día en toda la región y frente a los buenos informes de la propia aeronave en otros lugares. Es un sustituto distinto y más débil: no puede decir que una hora de geometría tranquila estuvo degradada allí donde el fondo del día también es bajo. Un evaluador de HDOP de almanaque <b>no está implementado</b>. Es un asunto abierto, que se construirá a partir del texto completo del artículo y del almanaque público de GPS y se preregistrará antes de ejecutarse; hasta entonces se cita, no se afirma.

# text
seg-e9b9902633af = Reproducir un producto

# text
seg-95e48f0286d9 = El proceso es determinista en todo lo que publica (la sal del identificador de cada ejecución solo cambia hashes internos que nunca se escriben). Los valores SHA-256 del manifiesto permiten comparar una segunda ejecución byte a byte.

# text
seg-65236a42e316 = Estudio de sensibilidad

# text
# c1: kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json
# c2: docs/observatory/RESULTS.md
seg-0c843e799b8f = <c1/> reproduce los informes de un día con cambios de uno en uno de cada parámetro preregistrado (dos valores cada uno, más una cuadrícula de { "1.0" } grados) e informa, por variante, del número de celdas degradadas, no degradadas y no observadas, del índice de Jaccard del conjunto degradado con el registrado, de las celdas cuyo estado cambió y del área degradada. No cambia nada de la regla registrada: una variante no es una alternativa validada, y un cambio grande bajo un parámetro indica cuánto depende el dictamen de ese parámetro, no qué valor es el correcto. Los resultados del catálogo retrospectivo están en <c2/>.

# text
# c1: not_observed
seg-cc57d45c4b0a = <b>Cobertura.</b> adsb.lol sigue a receptores voluntarios; el mar abierto y el espacio aéreo con poca cobertura son escasos, y <c1/> es frecuente allí. Un mapa muestra la cobertura de su fuente.

# text
seg-e3921e1eb177 = <b>Qué significa una exactitud baja.</b> NACp y NIC bajan por motivos distintos de la interferencia: caídas de satélites o de aumentación, meteorología espacial, fallos de receptor o de transpondedor, y geometría. Ningún estado implica una causa.

# text
seg-e5ad0dc456c0 = <b>Las aeronaves que permanecen todo el día en una región afectada</b> no tienen línea base fuera de ella y no se cuentan, de modo que el método subestima un efecto regional persistente. El estudio de sensibilidad muestra el efecto de la salvaguarda de la línea base.

# text
seg-a2d41becc19b = <b>Los límites de día</b> son UTC; un evento que cruza la medianoche se reparte entre dos días.

# text
seg-436af9f16feb = <b>Sin verdad de referencia.</b> El observatorio no tiene referencia independiente externa: toda cifra es MODELLED, y ninguna fila de la matriz de verificación se apoya en él.

# text
seg-5c4966f0166d = <b>Sensibilidad del asunto.</b> Los mapas de este tipo son políticos. El observatorio declara un método, un retraso y un vocabulario, y nada más; no nombra estados ni actores, y no publica en tiempo real.

# text
seg-874f46a80c8b = <s1>Anterior</s1>Protocolos de receptor leídos

# text
seg-3137b7595e59 = <s1>Siguiente</s1>Observatorio de interferencias: resultados
