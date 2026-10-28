# docs--partner-data: translations (es)

seg-2247a2344710 = Significado

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = En la rama del repositorio de la que proceden estos documentos; aún no está en GitHub

seg-f942b36a11c4 = Aún no está en GitHub

seg-7338b6210228 = Fila

seg-c5ce76c91ff7 = Etiqueta

seg-3a04afee76ec = Fuente: <c1/>

seg-e6d8549f24b9 = Datos de socios: qué datos medidos podrían promover una fila MODELLED

seg-7b9ff34db2c4 = Kshana etiqueta cada capacidad en un registro verificado por máquina (<a1>matriz de verificación</a1>). La mayoría de las filas de temporización y de sensores son <b>MODELLED</b>: se apoyan en modelos indicados, hojas de datos publicadas y comprobaciones internas, y ningún registro medido de la clase de dispositivo se ha comparado con ellas. Quien tenga un registro así puede cambiarlo. Esta página dice qué filas, qué enviar, cómo se comprueba un envío, cómo se puntúa y cómo se acredita. Está escrita para un laboratorio, un fabricante o un grupo universitario; no es una oferta de trabajo y no afirma el respaldo de nadie. Solo consultivo: Kshana es un instrumento de estudio, no un equipo de navegación o de temporización homologado.

seg-1cf5536037d4 = Qué significan las etiquetas

seg-5f43f341fa27 = una referencia independiente externa coincide con la capacidad bajo un umbral fijado antes de la comparación. Un registro medido de un socio puede ser esa referencia independiente para la subafirmación que cubre; los invariantes de la matriz prohíben la etiqueta sin una

seg-0d182b8c7430 = internamente consistente, y dicho en voz alta; ninguna referencia independiente externa cubre la afirmación. Una fila MODELLED que se compara con datos medidos y no alcanza el umbral sigue siendo MODELLED, y el fallo se publica

seg-8a45367544a0 = una disciplina en la que se apoya la ejecución, de la que es propietario un socio de hardware y que Kshana no proporciona, por ejemplo las cifras que describen el reloj o el interferómetro propios de un socio. Kshana modela lo que un dispositivo así haría a una cadena de navegación o de temporización; no responde por el dispositivo

seg-553a1db0e11d = Un envío puede mover una fila a VALIDATED solo para la afirmación que los datos realmente prueban, y solo si la comparación alcanza su umbral. No puede hacer que las cifras propias de un dispositivo sean de Kshana para responder de ellas: siguen siendo del socio (PARTNER). Que cambie o no la etiqueta de una fila es decisión del propietario, registrada en la confirmación que la cambia, con el texto de la referencia independiente indicando exactamente qué se comparó con qué.

seg-bac61cc47097 = Filas que los datos de un socio podrían promover

seg-bd4f5d3f9399 = Cada fila de abajo es el texto exacto de <c1/> de una fila MODELLED de la matriz (una prueba mantiene esta página y la matriz sincronizadas). «Podría cambiar» dice qué respaldaría una comparación preregistrada con datos medidos si se alcanza el umbral; nunca es una promesa.

seg-fb5ceb1d62f0 = Datos que la probarían

seg-812eae6bbea9 = Podría cambiar

seg-f46d009d9380 = un registro de días de un reloj de una clase indicada, en funcionamiento libre tras su última disciplina, comparado con una referencia mejor, a un intervalo de muestreo de un minuto o menos

seg-2a73fc59a03d = los pisos de ruido rojo por clase que acotan las cifras de holdover siguen siendo MODELLED hoy; una estabilidad medida a tiempos de promediado largos podría compararse con el piso de esa clase, solo para esa clase

seg-abe6b657ce1b = la desviación de Allan medida, como tabla o como registro de fase, del reloj o del interferómetro atómico de un socio

seg-6ba2b7faa909 = las cifras de compromiso cuantifican (nunca validan) el dispositivo del socio, por lo que se etiquetarían como cifras del socio (PARTNER); la ingesta de datos de Allan medidos en un modelo de ruido ya coincide con un solucionador independiente

seg-ad537759d084 = un registro de fase de un oscilador de uno de los cuatro modelos preconfigurados, durante al menos un día

seg-44a55f6ebef6 = si el modelo de ruido derivado de la hoja de datos del preajuste reproduce la estabilidad de una unidad medida en los propios tiempos de promediado de la hoja de datos

seg-3da5a93abde6 = un registro de fase de una clase de reloj que aún no tiene ficha (un OCXO, un rubidio, un cesio, un máser, un reloj óptico)

seg-72f248aa4438 = una ficha ajustada con el primer tercio y que predice la desviación de Allan del resto dentro del factor preregistrado, como ya se hizo con los relojes de satélites GNSS y un receptor

seg-54971e473811 = un registro de una instalación real (cualquier versión del daemon) con las propias líneas de resumen del daemon

seg-bccf188b7636 = los lectores se construyeron a partir de formatos de línea públicos y archivos de prueba; un registro real comparado con un lector independiente sería la primera comprobación externa

seg-e83b73ab2d5d = una exportación de un contador o de un software de análisis reales

seg-80b69f559ea5 = lo mismo, para esos formatos

seg-0c279732d132 = una prueba de holdover real: el registro, los momentos en que el operador retiró y restableció la referencia, y los propios veredictos de MTIE, TDEV y máscara del laboratorio a partir de su software de análisis

seg-cfad71161af0 = un cálculo independiente de las mismas magnitudes para comparar con el del motor

seg-97c65b646eae = un registro estacionario de una unidad inercial cuyos parámetros de ruido publica o mide otra persona

seg-77f9d22ec624 = el ajuste recupera los parámetros independientes dentro de un factor indicado

seg-c9544eadc55d = un registro estático o los parámetros de ruido del sensor inercial de átomos fríos de un socio

seg-062dd193ab20 = las cifras del dispositivo son del socio (PARTNER); el presupuesto de error de posición que las compone sigue siendo un modelo de Kshana

seg-078be7f5769f = Empiece por los dos primeros: deciden si los pisos de holdover por clase y el compromiso entre cuántico y clásico se apoyan en algún dato medido propio.

seg-c325655738e0 = Qué enviar

seg-ca24fa511ffe = Un envío son dos archivos en una carpeta: los datos y una breve descripción de ellos, un archivo TOML (<c1/>; un ejemplo práctico inventado es <c2/>).

seg-a3e30cf27adb = <b>Datos de reloj.</b> Uno de los formatos que lee Kshana (véanse los <a1>formatos de registros de reloj</a1>): registros TICC de TAPR, fase o frecuencia ASCII al estilo TimeLab, RINEX clock, registros de linuxptp <c1/>, <c2/> y <c3/>, registros de seguimiento y de estadísticas de chrony. Se prefiere la fase a la frecuencia; indique las unidades y el intervalo de muestreo. Aporte el registro ininterrumpido más largo que tenga: la estabilidad a tiempos de promediado largos necesita días, y un registro de menos de un día se acepta pero con una advertencia.

seg-a14b0c961637 = <b>Datos inerciales.</b> Un CSV con columnas con nombre (<c1/>, rad/s y m/s^{ "2" }) o el formato EuRoC, de un dispositivo estacionario, lo bastante largo para el ajuste (al menos { "2000" } muestras; mejor con horas).

seg-a1f2cd79bcc0 = <b>La descripción</b> indica lo siguiente, y el verificador lo comprueba donde puede:

seg-cfeee5da56d7 = el tipo de organización (un tipo como «un laboratorio nacional de temporización», no un nombre; el nombre es opcional y solo para el crédito);

seg-4bd30d68101c = el dispositivo (tipo, clase y un modelo para la clase <c1/>);

seg-e8222178a0ee = cómo se tomaron los datos: con qué se compararon, la hora de inicio (UTC), el entorno, y si son brutos o procesados (y qué se les hizo);

seg-7ac28bd566f2 = el SHA-256 del archivo de datos, para que el archivo puntuado sea el archivo descrito;

seg-0eba30c3a5b8 = las filas MODELLED frente a las que se ofrece, mediante el texto exacto del requisito de arriba;

seg-dd694deec626 = la licencia (un identificador SPDX o palabras) y cómo pueden usarse los datos en el repositorio: <c1/> (confirmados, con atribución), <c2/> (solo se publican su hash y las puntuaciones) o <c3/> (la puntuación se comparte solo con quien envía);

seg-7cea4b7c1df8 = tres declaraciones: es una medición y no una simulación, quien lo envía puede licenciarlo para este uso, y los archivos no contienen datos personales.

seg-caa6696f3f5f = <b>Qué no enviar.</b> Nada personal ni con datos de contacto (el verificador rechaza una dirección de correo electrónico o un número de teléfono en la descripción), nada sujeto a control de exportación o restringido por acuerdo, ni ningún dato simulado presentado como medido.

seg-a2f0067b6da5 = Cómo se comprueba un envío

seg-f1d4c097691e = Formato y metadatos, por usted o por nosotros, antes de que se ejecute nada.

seg-c3cd90222eaa = Confirma el esquema, los campos obligatorios, el hash, las reglas de licencia y atribución, que las filas objetivo existen y son MODELLED, que los datos se leen con el lector propio del motor, e informa de lo que leyó (muestras, intervalo, duración, huecos) y advierte de los registros cortos. El estado de salida { "0" } significa completo y legible; { "1" } enumera lo que hay que corregir. <b>No puntúa los datos, no valida una fila ni promete que se vayan a usar.</b>

seg-7dd95552a6fb = <b>Un preregistro, antes de cualquier ejecución puntuada.</b> Para cada fila, un documento en <c1/> fija, y se confirma antes de ejecutar los datos: la fila, el SHA-256 del archivo de datos, qué parte de los datos se reserva (nada de lo ajustado puede verla), la métrica y el umbral. Para las fichas de reloj, la plantilla existente es la predicción con datos reservados usada para los registros de IGS y de receptores: ajustar con el primer tercio del registro, predecir la desviación de Allan del resto y exigir que la razón entre lo predicho y lo medido esté dentro de un factor indicado en cada tiempo de promediado ajustado. Un umbral nunca se relaja después de una ejecución.

seg-10dc9f8cf394 = <b>Una ejecución puntuada.</b> El resultado, con todos los números y todos los fallos incluidos, se publica con el comando y la confirmación, y una prueba lo fija. Un fallo es un hallazgo, no un fracaso que ocultar: la fila sigue siendo MODELLED y la página lo dice.

seg-e5704c43a6b8 = <b>La decisión sobre el registro es del propietario</b>, por escrito, en la confirmación que cambia la fila. El texto de la referencia independiente de una fila promovida nombra el conjunto de datos, su licencia y su crédito, qué se comparó y qué no.

seg-6d467ffb4199 = Créditos y derechos

seg-e82f31e7d9cc = Los datos siguen siendo suyos bajo la licencia que indique. <c1/> y <c2/> mantienen el archivo fuera del repositorio.

seg-156499ebc142 = Un envío <c1/> se acredita con la línea de atribución que usted dé, en el texto de la referencia independiente de la fila y en el archivo de resultados.

seg-a5c01115d23a = No se publica nada con su nombre sin su consentimiento por escrito; una organización nombrada como fuente se cita como fuente, nunca como avalista. Ni un socio ni nadie en su nombre hace ninguna afirmación de aprobación o respaldo, ni se hace ninguna sobre un socio.

seg-6c9ed423e51d = Puede retirar un envío antes de que se publique su resultado. Después, el resultado permanece tal como se registró; si retira la licencia de los datos, el archivo se elimina del repositorio y el hash y las puntuaciones permanecen.

seg-2cc3c091ba0f = Kshana no transmite nada y no controla ningún hardware. Un envío son archivos de entrada y un informe de salida.

seg-01b0ee9973dc = Contacto con socios

seg-b5cb4dc0493f = Se ha redactado para el propietario una nota de una página para un laboratorio en <s1><c1/></s1>. Es un borrador: no se envía nada y no se contacta con nadie hasta que el propietario lo decida.

seg-83b30e1ca261 = <s1>Anterior</s1>Paquetes de evidencias

seg-09c0b5fa6e52 = <s1>Siguiente</s1>Enlaces ópticos a través de la atmósfera
