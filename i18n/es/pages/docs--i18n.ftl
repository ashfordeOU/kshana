# docs--i18n: translations (es)

seg-c3c260b7063e = Pruebas

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Aún no está en GitHub

seg-26b562e7f535 = Fuente: <c1/>

seg-60b2e78c882e = Localización del motor

seg-7f3a6f2932c2 = El texto del motor dirigido a las personas está en { "17" } idiomas además del inglés: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. El inglés es la fuente; <c1/> es una configuración regional ficticia que acentúa, encierra entre corchetes y rellena cada mensaje, de modo que una prueba pueda ver si el texto pasó al catálogo. El marco es <a1>Project Fluent</a1> (<c2/>, <c3/>); el código es <c4/>.

seg-1ed9fde69630 = Qué se localiza y qué nunca

seg-1cb6eb25338d = Se localiza (lo lee una persona)

seg-ab884f59f5f3 = Nunca se localiza (lo lee un programa)

seg-dbe9b8a0ed98 = mensajes y errores de la línea de comandos

seg-711a8e63c1de = claves y valores JSON de <c1/> y <c2/>

seg-a4066ef82152 = la línea de resumen de cada ejecución

seg-6fbdf82a22dc = encabezados y filas de CSV

seg-8d08a6f5f16f = el texto de los gráficos SVG (títulos, ejes, leyendas, pies)

seg-8ad1234dfb18 = nombres de archivo

seg-777c2587e0da = <c1/>: encabezados, tablas, notas, pies

seg-d5cf8d8abe89 = códigos de error (<c1/>)

seg-7ba47f2644f5 = palabras de veredicto (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = la matriz de verificación, las definiciones de unidades, la procedencia

seg-122495009a9c = las descripciones de los tipos de escenario (<c1/>)

seg-c7bc43c1e848 = advertencias de carácter consultivo, descargos de responsabilidad y avisos (<c1/>)

seg-dd0fc888e0dc = los mismos textos dentro de JSON, que siguen en inglés

seg-a236606f1ca1 = <c1/> de la campaña de iq, la página de comparación de estudios, la clasificación de bench, el informe de resiliencia

seg-4ec45651bd09 = <c1/> de un paquete de evidencias y el PNG del observatorio: ambos se incluyen en un manifiesto mediante hash (el del paquete, además, firmado), por lo que se generan en inglés sea cual sea el idioma

seg-048b6c3a9f0c = Los números en el texto para personas usan la marca decimal del idioma (una coma en { "15" } de los { "18" } idiomas; un punto en en, ja, zh-Hans y en-XA). Los números en los archivos de máquina usan siempre el punto. Un recuento (una variable llamada <c1/>, <c2/>, <c3/>, <c4/> o <c5/>) llega a Fluent como un número, de modo que una traducción puede escribir <c6/>.

seg-487d6d38fa39 = Elegir el idioma

seg-79499bebb806 = Línea de comandos: <c1/>, luego <c2/>, <c3/>, <c4/>, <c5/>, luego inglés. <c6/> es pt-BR; solo <c7/> es el de Portugal. <c8/> es el simplificado; el tradicional se rechaza con la lista de etiquetas admitidas.

seg-079f85726238 = Biblioteca: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> en <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: un <c1/> final opcional en <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> en <c2/> y <c3/>.

seg-e133ee809c98 = Errores y sus códigos

seg-fac73c5cbbc2 = Cada mensaje de error tiene un código estable, el identificador del mensaje en mayúsculas (<c1/> es <c2/>), el mismo en todos los idiomas. El texto de la línea de comandos en inglés no cambia. En otro idioma la línea es <c3/>; con <c4/> sigue una segunda línea <c5/> en todos los idiomas. La API ofrece <c6/> y <c7/> (<c8/>); los errores de MCP llevan <c9/> como datos del error. Compare por el código, nunca por el texto.

seg-7d731dc5f888 = Cómo funciona una ejecución en otro idioma (la regla de ejecutar dos veces)

seg-204df30d9ca2 = Un archivo de máquina no debe depender del idioma. Por eso una ejecución en otro idioma ejecuta el escenario dos veces: una en inglés, cuyos <c1/>, <c2/> y CSV son los archivos de máquina, y otra en el idioma del usuario, para el resumen, el gráfico y <c3/>. El inglés es una sola ejecución, byte por byte igual a la de antes.

seg-b7447d4cd5a8 = Medido, nativo, compilación de lanzamiento, inglés y luego <c1/> (segundos): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; cada uno de los demás escenarios incluidos tarda menos de { "4" } s; los { "173" } escenarios incluidos cuando se midió tardaron { "64" } s en inglés en conjunto. El coste es exactamente el doble para otro idioma. WebAssembly no se midió (aquí no hay wasm-bindgen); con el factor de navegador de aproximadamente { "4" } es un minuto para el tipo de escenario más lento.

seg-cc148fdec7a2 = Una página evita la espera mostrando de inmediato el resultado en inglés y llamando a <c1/> después: esa es solo la segunda ejecución, devuelve <c2/>, y Studio puede decir «traduciendo...» hasta que llega.

seg-cd0360ad624d = <b>Elemento de { "0.41" }: una sola ejecución.</b> Generar ambas a partir de un registro de <c1/>. Se evaluó y no se construyó: los resultados de <c2/> se inspeccionan, se miden y se calculan con hash después de generarse (anchos de texto de los gráficos, hashes de procedencia sobre el texto de salida), y <c3/> da formato en el punto de llamada, de modo que un registro metería marcadores de posición en los archivos de máquina y haría que sus bytes dependieran de la reproducción. Requiere <c4/>/<c5/> que devuelvan marcadores, un finalizador en cada escritor y una prueba de identidad byte a byte por escritor.

seg-67e04a43cea8 = La compilación wasm incorpora solo el catálogo en inglés. Los otros dieciséis añadirían unos { "150" } kB gzip cada uno. Una página obtiene <c1/> al elegir un idioma y llama a <c2/>; si falla la obtención o el registro, la página sigue en inglés. En nativo, la línea de comandos y el paquete wheel de Python incorporan los { "18" }.

seg-9a2f85e7e43c = Tamaño, <c1/> sin optimizar de <c2/> (antes de wasm-bindgen y wasm-opt), base bc04e98f frente a esta rama: { "18.71" } MB -> { "19.88" } MB en bruto, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. El catálogo en inglés ocupa { "521" } kB en bruto, { "153" } kB gzip de ellos; el resto es <c3/> y sus dependencias. Esto se acepta tal como se midió.

seg-3ce9aab4916e = El catálogo

seg-fdea76581cd8 = <c1/> contiene los mensajes, con identificadores con el prefijo <c2/>. <c3/> es la fuente; los demás archivos son de los traductores y pueden carecer de mensajes (cada uno recurre al inglés mensaje por mensaje). Listas complementarias en <c4/>: <c5/> (mensajes con variables de recuento, para las formas de plural), <c6/> (números pasados como marcadores), <c7/> (mensajes que son fragmentos de una frase ensamblada en tiempo de ejecución: se deben fusionar en mensajes de frase completa, nunca aumentar).

seg-9432bca8a935 = <c1/> prueba el inglés: cada mensaje tiene una plantilla original registrada y se muestra exactamente como ese texto; se usa cada identificador; las variables coinciden; la configuración regional ficticia muestra cada mensaje. <c2/>, <c3/>, <c4/> cubren los puntos de entrada, las descripciones de los tipos de escenario y los textos legales. <c5/> falla si un nuevo literal de cadena que leería una persona elude el catálogo: tolerancia por archivo en <c6/>, que puede bajar y nunca subir. <c7/> ejecuta escenarios completos con un binario de referencia y con el actual, y compara cada archivo de salida.

seg-969a4b12b12c = Cómo mover una cadena al catálogo: <c1/>.

seg-48c3c0ca063d = Dependencias y licencias

seg-b6c2f08c9a46 = El marco añade <c1/> { "0.16" } (Apache-2.0 OR MIT) y <c2/> { "0.9" } (MIT OR Apache-2.0), con sus crates transitivos: <c3/> y <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: se usa la alternativa Apache-2.0, que <c9/> permite), <c10/> y <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Todas son permisivas según la lista <c16/> de <c17/>; <c18/> aparece en dos versiones ({ "1" } y { "2" }), lo que <c19/> solo informa. La lista de licencias se leyó de <c20/>; <c21/> no está instalado en el entorno de redacción y se ejecuta en la CI de integración.

seg-6aa2e78078ae = <s1>Anterior</s1>Glosario

seg-670504be0531 = <s1>Siguiente</s1>Guía de Studio
