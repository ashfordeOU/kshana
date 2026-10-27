# docs--interference-map: translations (es)

# attr:aria-label, text
seg-6555ff9a6d8e = Salida

# text
seg-2247a2344710 = Significado

# text
seg-c3c260b7063e = Pruebas

# text
seg-d4a762001549 = Licencia

# text
# c1: docs/INTERFERENCE-MAP.md
seg-e7b6d071246e = Fuente: <c1/>

# text
# c1: kshana interference-map
# c2: kshana route-exposure
seg-143c73287d6c = <c1/> construye una imagen diaria de dónde aeronaves y buques notificaron datos de navegación degradados, a partir de archivos de seguimiento con licencia abierta que usted aporta. Después, <c2/> indica qué parte de una ruta planificada quedó dentro de las celdas afectadas cada día.

# text
seg-158f33f95ec3 = Qué es: una descripción de cómo eran los informes de posición publicados en días pasados. Qué no es: una medición de ningún receptor, una previsión ni una prueba de interferencia. Una celda degradada o anómala tiene varias causas posibles (indicadas más abajo), y una celda sin entrada simplemente no se observó.

# text
seg-64d3ee269407 = Todo se ejecuta sobre archivos locales. Los comandos por defecto nunca abren una conexión de red; el único ayudante de descarga opcional necesita un indicador explícito.

# attr:alt
seg-e251b385ff46 = Dos días sintéticos del mapa de interferencias dibujados a partir de las muestras confirmadas en examples/interference-map/output, cada uno con su propia ruta sintética y las proporciones de exposición de ruta que informa el motor. A la izquierda, un día de ADS-B: { "1" } celda degradada, { "6" } no degradadas, { "4" } no evaluadas (rayadas) y celdas sin entrada, dibujadas vacías, que no se observaron. La ruta es de { "525" } km: el { "11.5" } % de su longitud en celdas degradadas, el { "38.3" } % no degradado, el { "9.1" } % no evaluado y el { "41.1" } % no observado. A la derecha, un día de AIS: celdas marcadas por los detectores de círculo y de tierra firme, celdas no anómalas y celdas vacías; la ruta es de { "454" } km con el { "10.5" } % en celdas anómalas, el { "21.2" } % no anómalo, el { "0.0" } % no evaluado y el { "68.3" } % no observado. ADS-B y AIS son capas separadas, nunca combinadas. Una celda marcada no es un hallazgo de interferencia, y una celda sin color no se observó, lo que no equivale a despejada. Todos los datos son inventados, en pleno Atlántico medio, y no son una medición.

# text
# c1: examples/interference-map/output/
# c2: examples/interference-map/input/
# c3: kshana route-exposure
seg-765f43228dc6 = Ambos días son las muestras sintéticas de <c1/>, cada una con una ruta sintética en <c2/>; las proporciones de exposición de ruta son las que imprime <c3/> para ellas. Nada en ellas es un lugar, una aeronave o un buque reales.

# text
seg-228f39c0305b = Datos y licencias

# text
# c1: data/INTERFERENCE-DATA-SOURCES.md
# c2: --dataset
seg-d3336cc18ff7 = Solo las fuentes revisadas en <a1><c1/></a1> están integradas, y se seleccionan con <c2/>:

# text
seg-b03d56f501c3 = Tipo

# text
seg-2328672e782f = Campo de licencia de salida

# text
seg-2319c7a6f6e2 = ODbL { "1.0" }

# text
seg-7464d3c830f3 = AIS

# text
seg-c13f76567536 = Dominio público de EE. UU. (CC0 { "1.0" } según el editor)

# text
seg-636c2bb6f29d = dominio público

# text
seg-f6f4e431d36d = NLOD { "2.0" }

# text
seg-5621e3a3908f = cualquiera

# text
seg-6b3a1f8ca649 = lo que usted indique

# text
# c1: --licence
# c2: --licence-url
# c3: --attribution
seg-be349e2c455f = <c1/>, <c2/>, <c3/> obligatorios

# text
seg-590344d1eae5 = Cada archivo de salida incorpora la licencia, la URL de la licencia, la atribución exigida y los límites de cobertura de la fuente. No hay ninguna entrada integrada para fuentes cuyos términos prohíban el uso comercial o la redistribución de mapas derivados.

# text
# c1: licence
seg-2d8eaefab0f8 = <b>ODbL y ediciones de Kshana.</b> Un archivo ADS-B por celda elaborado con datos de adsb.lol es una Derived Database y se difunde bajo ODbL { "1.0" }; su campo <c1/> así lo indica. El código propio de Kshana sigue siendo AGPL-3.0. Las ediciones comerciales de Kshana que escriban esos archivos llevan el mismo aviso, y quien vuelva a publicar el archivo debe conservarlo. Los resultados de ADS-B y de AIS nunca se combinan en un mismo archivo, de modo que la ODbL no se extiende a la capa de AIS.

# text
seg-bb4932d5d15c = <b>Sesgo de cobertura.</b> Los mapas heredan la cobertura de su fuente. adsb.lol depende de receptores voluntarios, así que el mar abierto y las regiones con poca cobertura quedan poco representados. Los datos abiertos de Kystverket omiten los buques pesqueros de menos de { "15" } m y las embarcaciones de recreo de menos de { "45" } m, por lo que su mapa refleja los buques más grandes. MarineCadastre cubre solo aguas de EE. UU.

# text
seg-713babc3963b = <b>Identificadores.</b> Las filas de entrada llevan un identificador de aeronave o de buque. Se procesa con hash en memoria con una sal aleatoria por ejecución, se usa solo para contar aeronaves o buques distintos, y nunca se escribe, registra ni imprime. Las salidas son agregadas: no aparece en ellas ningún identificador.

# text
# c1: 5
# c2: null
seg-fa3c70a8997a = <b>Supresión.</b> Una celda con menos de <c1/> aeronaves o buques distintos observados ese día no se publica en absoluto, y en AIS un recuento de marcados de uno o dos en una celda publicada se notifica como <c2/>. Ningún valor publicado puede singularizar una aeronave o un buque.

# text
seg-02dbfcb9c808 = Formatos de entrada

# text
# c1: YYYY-MM-DDTHH:MM:SS[.fff]Z
seg-2f291f986a87 = CSV simple con fila de encabezado, separado por comas, sin comillas, con horas en UTC. El orden de las columnas es libre; las columnas desconocidas se ignoran. Una marca de tiempo es en segundos Unix o <c1/>. Las filas que no pueden analizarse se cuentan en los metadatos de salida, no se descartan en silencio.

# text
# c1: kshana interference-map adsb
seg-571365be20a5 = ADS-B (<c1/>):

# text
seg-aaeff8f42699 = Columna

# text
seg-b10a51ed96c0 = Obligatoria

# text
seg-357c2320b43a = sí

# text
seg-14ac5d0f109b = hora del informe

# text
seg-6dbe5595d0be = identificador opaco (con hash, nunca se almacena)

# text
seg-c5fb6b91dc68 = grados

# text
# c1: ground
seg-e283838c85aa = altitud en pies; <c1/> o vacío excluye la fila

# text
seg-9ab90c35bd7d = al menos una

# text
seg-868e5b9c00ab = enteros de { "0" } a { "11" }; vacío significa no informado

# text
seg-db907db790b1 = no

# text
# c1: adsb
seg-5c2ce9f61700 = si está presente, solo se usan los valores que empiezan por <c1/> (MLAT, TIS-B y similares quedan excluidos)

# text
# c1: tar -xf -
# c2: trace_full_*.json
seg-412f40b8eeb1 = <b>Historial de readsb de adsb.lol, leído directamente.</b> Los archivos diarios son un tar dividido de archivos de traza de readsb. Extraiga uno como describe el editor (concatenar las partes, <c1/>) y entregue a Kshana el directorio extraído, un único archivo <c2/> o un CSV:

# text
# c1: trace_full_*
# c2: trace_recent_*
# c3: .json
# c4: ground
# c5: nic
# c6: nac_p
# c7: trace_files_unreadable
seg-6e7d378bd89b = En un directorio se buscan recursivamente archivos <c1/> (los demás archivos, como <c2/>, se ignoran y no se siguen los enlaces simbólicos). Cada archivo está comprimido con gzip o es JSON sin comprimir, y se detecta por sus primeros bytes, porque readsb escribe gzip con un nombre <c3/>; la descompresión está limitada a { "512" } MiB por archivo. De cada entrada de traza Kshana lee el desfase de tiempo, la latitud, la longitud, la altitud (el marcador <c4/> excluye la entrada), los campos <c5/> y <c6/> del objeto de detalles de la aeronave y la cadena de la fuente de posición (se excluyen las entradas de cualquier fuente que no sea ADS-B). Una entrada sin objeto de detalles no tiene campos de exactitud y se cuenta como excluida. Un archivo que no puede leerse se cuenta en <c7/> en los metadatos de salida y se omite.

# text
# c1: kshana interference-map ais
seg-b1502f7f4c98 = AIS (<c1/>):

# text
seg-91395984ddac = grados; los valores "no disponible" de AIS y ({ "0" }, { "0" }) se descartan

# text
seg-34ae94eb1797 = velocidad sobre el fondo en nudos; { "102.3" } (no disponible) se trata como ausente

# text
# c1: --land
# c2: --land
seg-a1e60af5adaa = El detector de tierra firme necesita un archivo de polígonos de tierra (<c1/>): GeoJSON Polygon o MultiPolygon. El archivo previsto es la capa de tierra de { "1" }:{ "10" } millones de Natural Earth (dominio público). Sin <c2/> el detector está desactivado y la salida lo indica. Para descargarlo (el único acceso a la red de esta función):

# text
# c1: curl
# c2: curl
seg-cd55a09894c5 = Esto ejecuta el <c1/> del sistema (como lista de argumentos, no a través de un shell) por HTTPS, una sola vez, para un archivo en una dirección fija que nombra una única confirmación del repositorio original. La descarga solo se conserva si su SHA-256 es igual al valor fijado en el código; si no coincide, se borra y falla. Si <c2/> no está instalado, el comando lo indica y da la dirección y la suma de comprobación para poder obtener el archivo a mano. No se incluye nada en el repositorio.

# text
# c1: --out
# c2: <source>-<dataset>-<YYYY-MM-DD>.geojson
# c3: <source>
# c4: adsb
# c5: ais
# c6: <dataset>
# c7: --dataset
# c8: adsb-lol
# c9: noaa-marinecadastre
# c10: kystverket
# c11: custom
# c12: adsb-adsb-lol-2026-03-01.geojson
# c13: ais-kystverket-2026-03-01.geojson
# c14: ^(adsb|ais)-(.+)-(\d{4}-\d{2}-\d{2})\.geojson$
# c15: source_kind
# c16: data.dataset
# c17: date
# c18: examples/interference-map/output/
# c19: kshana_interference_map
# c20: cell_i
# c21: cell_j
# c22: status
# c23: degraded
seg-95eeaa0033b3 = Un archivo GeoJSON por fuente y por día UTC, en el directorio <c1/>, con el nombre <c2/>, donde <c3/> es <c4/> o <c5/>, <c6/> es la clave de <c7/> (<c8/>, <c9/>, <c10/> o <c11/>) y la fecha es el día UTC de los informes: <c12/>, <c13/>. El conjunto de datos figura en el nombre para que dos conjuntos de datos de un mismo tipo no puedan compartir archivo, y <b>Kshana nunca sobrescribe un archivo</b>: si existe cualquier destino, el comando falla antes de escribir nada. La CLI imprime una línea por cada archivo que escribe. Un lector puede recuperar las tres partes con <c14/>; la misma información está dentro del archivo (<c15/>, <c16/>, <c17/>). En <c18/> hay archivos de muestra sintéticos, uno por fuente, con el comando que los regenera, para construir y probar un visor. Un miembro de primer nivel <c19/> contiene el nombre del esquema, la fecha, la rejilla, el identificador del método y cada parámetro, las cifras del día, la licencia de los datos y su atribución, y un aviso. Cada elemento es un polígono de celda con <c20/>, <c21/>, <c22/>, <c23/> y los recuentos agregados.

# text
# c1: --cell-deg
# c2: --cell-deg
# c3: grid.preregistered_cell_deg
# c4: grid.is_preregistered
seg-1ee702004726 = La rejilla es fija: celdas cuadradas de <c1/> grados (por defecto { "0.5" }) en latitud y longitud, indexadas desde (-90, -180). La anchura este-oeste se reduce con la latitud: unos { "55" } km en el ecuador y unos { "28" } km a { "60" } grados para el valor por defecto. La latitud { "90" } pertenece a la última fila y la longitud { "180" } es el mismo meridiano que -180. <b>Los métodos preregistrados se definen sobre la rejilla de { "0.5" } grados.</b> Otro <c2/> funciona, pero no es el método preregistrado: la CLI lo indica, y el archivo registra <c3/> y <c4/> (false) para que un visor pueda decirlo también.

# text
# c1: null
# c2: null
# c3: status
# c4: degraded
# c5: aircraft_observed
# c6: aircraft_sampled
# c7: aircraft_affected
# c8: null
# c9: affected_share
# c10: null
# c11: vessels_flagged
# c12: null
seg-6e1e8f2a9082 = <b>Recuentos retenidos.</b> Todo recuento por celda inferior al mínimo de publicación ({ "5" }) es <c1/>, incluido el cero, de modo que <c2/> nunca significa "ninguno" y ningún número publicado puede singularizar una aeronave o un buque. Los campos <c3/> y <c4/> se siguen dando. En los archivos de ADS-B, <c5/> es siempre al menos { "5" } en una celda publicada; <c6/> y <c7/> son <c8/> por debajo de { "5" }, y <c9/> es <c10/> a menos que ambos sean al menos { "5" } (una proporción revelaría un recuento retenido). En los archivos de AIS, cada entrada de <c11/> es <c12/> por debajo de { "5" }.

# text
seg-fd929d6ee90b = Versión del formato y campos

# text
# c1: schema: "kshana-interference-map/v1"
# c2: format_version: 1
# c3: null
seg-ff443e9cbd20 = El formato queda fijado como <c1/>, <c2/>. Un cambio que elimine o renombre un campo, o que cambie lo que significa, sube la versión; añadir un campo no la sube, así que un lector debe ignorar los campos que no conozca. Un recuento que es <c3/> está retenido, no es cero.

# text
# c1: status
# c2: degraded
# c3: not_degraded
# c4: insufficient_sample
# c5: withheld_day_confounded
# c6: withheld_no_background
# c7: anomalous
# c8: not_anomalous
# c9: degraded
# c10: degraded
# c11: anomalous
# c12: kshana-route-exposure/v1
seg-60818bfc3f90 = Valores de <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> es verdadero solo para <c10/> y <c11/>. El informe de exposición de ruta tiene su propio esquema <c12/>.

# text
seg-ea526ebdd260 = Observatorio: el producto diario

# text
# c1: kshana interference-map daily
# c2: kshana interference-map sensitivity
# c3: --delay-hours
# c4: degraded
# c5: not_degraded
# c6: not_observed
# c7: observatory/METHOD.md
# c8: --bbox south,west,north,east
seg-e33f63fe5c0a = <c1/> convierte un día UTC de informes ADS-B en los tres archivos del observatorio (GeoJSON, PNG y un JSON de informe de incidentes) y un manifiesto de hashes, y <c2/> repite ese día con cambios de uno en uno en los parámetros preregistrados. El comando aplica las reglas de publicación: al menos { "24" } h después de que termine el día (<c3/> solo puede aumentarse), celdas de { "0.5" } grados o más gruesas, solo tres estados (<c4/>, <c5/>, <c6/>), ninguna causa atribuida y ningún dato de OpenSky. La nota de método, los formatos de archivo y los límites están en <a1><c7/></a1>. Una ejecución regional (<c8/>) lee solo los informes del recuadro y lo indica en el archivo.

# text
seg-31ce42fc05dc = Especificación de la página de mapa de Studio

# text
seg-a9aca2e2d390 = Para la página de mapa de Studio, que carga un archivo GeoJSON que aporta el usuario (la página se construye en el código fuente de Studio, no en este repositorio). No se sube nada: el archivo se lee en el navegador, y la página no hace ninguna petición a ninguna fuente de datos.

# text
# c1: kshana_interference_map.schema
# c2: kshana-interference-map/
# c3: format_version
seg-064ec5d4c91a = <b>Lectura de un archivo.</b> Acepte un archivo solo si <c1/> empieza por <c2/> y <c3/> es un número que la página admite; en caso contrario, indique que el archivo no es un mapa de interferencias de Kshana admitido. Lea los campos enumerados más arriba; ignore los desconocidos. Un archivo contiene una fuente y un día. Pueden cargarse varios archivos.

# text
# c1: status
seg-5be32f8cff46 = <b>Celdas.</b> Dibuje el polígono de cada elemento. Coloree por <c1/>, e indique siempre en una leyenda qué significa cada color. Cuatro estados, ninguno de los cuales puede ocultarse ni fusionarse:

# text
seg-b652b86e6b8e = Estado

# text
seg-4a511b6a03e3 = De dónde procede

# text
seg-f92da2236260 = Degradada (o anómala en AIS)

# text
seg-591ebe8007cb = una proporción alta de aeronaves notificó baja exactitud, o los buques mostraron anomalías, ese día

# text
# c1: degraded
seg-bd993c64b6e8 = <c1/> es verdadero

# text
seg-88d43eb1c14a = Despejada

# text
seg-af5f7989fd09 = observada con suficientes aeronaves o buques y no marcada

# text
# c1: status
# c2: not_degraded
# c3: not_anomalous
seg-2bc810e02210 = <c1/> es <c2/> o <c3/>

# text
seg-d894eaa21369 = No evaluada

# text
seg-38c88ed94111 = observada, pero sin suficientes aeronaves muestreadas, el día estuvo confundido o no pudo estimarse el fondo del día

# text
# c1: status
# c2: insufficient_sample
# c3: withheld_day_confounded
# c4: withheld_no_background
seg-e358a8c7903f = <c1/> es <c2/>, <c3/> o <c4/>

# text
seg-013b7c903426 = No observada

# text
seg-81bcffa57ec2 = demasiado pocas aeronaves o buques, por lo que la celda no se publicó

# text
seg-6828d71822bd = ningún elemento para esa celda

# text
# c1: properties
# c2: null
# c3: grid.is_preregistered
seg-753192a770ac = "No observada" es la ausencia de un elemento: dibújela de forma neutra (sin relleno o con un rayado), nunca con el color de "despejada". Use un esquema de color que no dependa solo del rojo frente al verde. Los detalles de la celda al pasar el cursor o al seleccionarla muestran los recuentos de <c1/> tal como vienen, y todo recuento <c2/> como "retenido (menos de { "5" })", nunca como cero. Un visor también debería indicar, cuando <c3/> es false, que el archivo usa un tamaño de celda ajeno al método preregistrado.

# text
seg-e90fedf7ad89 = <b>Capas.</b> ADS-B y AIS son capas separadas, con sus propios conmutadores, leyendas y líneas de licencia. No las fusione nunca en un campo de color o en un recuento, no las dibuje nunca como una celda combinada y no sume nunca sus celdas. Días distintos son archivos distintos: muestre un día cada vez, con un selector de día, en lugar de superponer días.

# text
# c1: data.attribution
# c2: data.licence
# c3: data.licence_url
# c4: data.coverage_notes
seg-6d500d3c0baa = <b>Licencia y atribución.</b> Para cada capa visible muestre, en el mapa y en cualquier exportación o captura de pantalla, el texto de <c1/> literalmente, <c2/> con un enlace a <c3/>, y <c4/>. Si se muestra una capa de ADS-B, su licencia ODbL se aplica solo a esa capa. No ofrezca exportar un archivo combinado.

# text
# c1: method.id
# c2: method.parameters
# c3: day
# c4: day_confounded
# c5: input_stats
seg-6f786153ef8e = <b>Método.</b> Ofrezca el identificador del método y los parámetros (<c1/>, <c2/>) y las cifras de <c3/> en un panel de detalles, incluidos <c4/> (indique con claridad que ninguna celda se calificó de degradada debido al fondo del día) y <c5/>.

# text
# c1: method.caveats
# c2: notice
seg-905348837439 = <b>Salvedades que deben mantenerse</b> (muestre las propias <c1/> y <c2/> del archivo, y mantenga visible con el mapa esta redacción o su equivalente):

# text
seg-1f70e308010a = Una celda degradada o anómala no es un hallazgo de interferencia. Existen otras causas.

# text
seg-7cde0ddadb73 = Una celda sin color no se observó. No es evidencia de que la zona estuviera despejada.

# text
seg-1135dfeadb8f = Es una descripción de informes de posición pasados, no una previsión ni una medición de ningún receptor.

# text
seg-3ad1216bf3ed = La cobertura sigue a la fuente de datos; lea las notas de cobertura.

# text
seg-046f6af48349 = La página no debe nombrar ni mostrar ninguna aeronave o buque concretos, y los archivos no contienen ninguno.

# text
# c1: kshana-route-exposure/v1
# c2: caveats
# c3: map_licence
# c4: map_attribution
seg-ae79b67c3b98 = <b>Exposición de ruta.</b> Si la página carga también un informe <c1/>, muestre sus filas por día y fuente con las cuatro proporciones (degradada, despejada, no evaluada, no observada) juntas, nunca solo la proporción degradada, además de las <c2/> del informe y de <c3/> y <c4/> de cada fila.

# text
# c1: kshana-interference-map/adsb/v2
seg-98131acf49d8 = Método de ADS-B (<c1/>)

# text
seg-83b660b0bfa6 = Cada informe ADS-B en vuelo lleva dos campos de calidad de navegación autoevaluados: NIC (el radio de contención de la posición) y NACp (la cota de exactitud del { "95" } %, EPU). Cuando el receptor de a bordo pierde su fijación por satélite o desconfía de ella, ambos descienden, por lo que llevan una firma de interferencia. También descienden por otros motivos.

# text
seg-4b9020a68db6 = <b>Parámetros preregistrados</b> (constantes en el código, escritas en cada archivo; un cambio implica una nueva versión del método):

# text
seg-e73ea9921fcf = Parámetro

# text
seg-8650fa804f14 = Altitud mínima

# text
seg-25056ee5a36c = altitud barométrica de al menos { "5000" } ft

# text
seg-17322eff480a = Informe de baja exactitud

# text
seg-48ab6ed5eedd = NACp como máximo { "6" } (la cota de EPU informada es de { "556" } m, { "0.3" } NM, o mayor, o desconocida) o NIC como máximo { "5" } (la cota de radio de contención informada es de { "1852" } m, { "1" } NM, o mayor, o desconocida)

# text
seg-84beb488319d = Buen informe

# text
seg-2595055d9593 = NACp al menos { "8" } y NIC al menos { "7" }; se juzga con los campos que tiene la entrada (ambos cuando ambos están presentes, el que esté presente en caso contrario)

# text
seg-b4bbce695b2d = Línea base de equipamiento

# text
seg-4986ed51f600 = una aeronave cuenta en una celda solo con al menos { "5" } buenos informes fuera de esa celda el mismo día

# text
seg-42859d1d785b = Aeronaves muestreadas en una celda

# text
seg-1ae26d6d99a9 = al menos { "3" } informes en la celda

# text
seg-48bba15e2e0e = Aeronaves afectadas en una celda

# text
seg-1fe9c3ab930c = al menos el { "50" } % de sus informes en la celda son de baja exactitud

# text
seg-b147473d133c = Muestra mínima

# text
seg-33060cda8536 = al menos { "10" } aeronaves muestreadas

# text
seg-009ca23b9cd6 = Degradada

# text
seg-afef85ae2a25 = al menos { "5" } aeronaves afectadas, una proporción de afectadas sobre las muestreadas de al menos { "0.30" }, y al menos { "0.15" } por encima de la proporción mediana de celdas del día

# text
seg-890dcc56fa5c = Día confundido

# text
seg-b27768e64d62 = proporción mediana de celdas (sobre al menos { "5" } celdas con muestra completa) de al menos { "0.15" }: ninguna celda se declara degradada

# text
seg-18fbf3c348c9 = Sin fondo

# text
# c1: withheld_no_background
seg-534111e0c6ad = menos de { "5" } celdas con muestra completa, por lo que no puede estimarse la mediana: una celda que alcanza los umbrales es <c1/>, no degradada

# text
seg-b571f127c595 = Mínimo de publicación

# text
seg-60621ffc5bcf = al menos { "5" } aeronaves distintas observadas

# text
# c1: degraded
# c2: not_degraded
# c3: insufficient_sample
# c4: withheld_day_confounded
# c5: withheld_no_background
seg-f36389caf81b = Estos valores se fijaron a partir de las definiciones de los códigos NIC y NACp y de la regla de privacidad antes de mirar dato alguno. No se ajustaron con datos reales, y las pruebas usan solo datos sintéticos. Estados de celda: <c1/>, <c2/>, <c3/> (publicada, pero con menos de { "10" } aeronaves muestreadas), <c4/> y <c5/>.

# text
# c1: withheld_no_background
seg-c89afc07989b = <b>Versión { "2" }.</b> La versión { "1" } declaraba degradada una celda a partir de tan solo { "3" } aeronaves afectadas, menos que el mínimo de publicación de 5 aeronaves, y omitía sin avisar la comprobación del fondo del día cuando menos de { "5" } celdas tenían muestra completa. La versión { "2" } exige al menos { "5" } aeronaves afectadas y retiene el veredicto (<c1/>) cuando no puede estimarse el fondo. Ambos cambios endurecen el método (nada que no fuera degradado en la versión { "1" } lo es en la versión { "2" }); el motivo es que un veredicto publicado nunca debe apoyarse en menos aeronaves que el número por debajo del cual se retienen los recuentos. Los archivos de la versión { "1" } no se publicaron.

# text
seg-ffd0e5175548 = Por qué los campos de exactitud descienden por motivos distintos de la interferencia, y la salvaguarda para cada uno:

# text
seg-12b613a77f64 = Causa

# text
seg-e30479c3e5d8 = Salvaguarda

# text
seg-ecac3d226210 = Transpondedores antiguos que nunca informan de NIC ni de NACp, o los informan con un valor bajo fijo

# text
seg-8b504b60fcc0 = la línea base de equipamiento: una aeronave sin buenos informes en otro lugar ese día no se cuenta

# text
seg-1df45f128708 = Baja altitud y operaciones en superficie (enmascaramiento por el terreno, formatos de posición distintos)

# text
# c1: ground
seg-cc5f23f0da05 = altitud mínima; las filas marcadas <c1/> se excluyen

# text
seg-ddf6aeb47dbe = Posiciones MLAT u otras no GNSS

# text
# c1: source_type
seg-51162a1835d1 = filtro de <c1/> cuando la columna está presente

# text
seg-08196503a657 = Una aeronave que envía muchos informes

# text
seg-bf13dfa85dbe = se cuentan aeronaves distintas, no informes

# text
seg-bbcb809624bc = Una interrupción de la constelación o del aumento, o un evento de meteorología espacial, que reduce la exactitud en un área amplia

# text
seg-5f428bb7ad4a = la celda debe superar con un margen la proporción mediana de celdas del día, y un día cuya mediana ya es alta se marca como confundido y no declara ninguna celda

# text
seg-30290253a95d = Un fallo en el equipo de una aeronave

# text
seg-b673195405ff = necesita una proporción de muchas aeronaves distintas, con una muestra mínima

# text
seg-aeebeded71be = Pocas aeronaves en la celda

# text
seg-c33c60b49b17 = muestra mínima; con menos de { "5" } observadas la celda no se publica

# text
seg-dc8abb9b411f = Lo que queda: el método no puede distinguir la interferencia de una causa regional que sea local en lugar de amplia (un efecto local de geometría de satélites o una interrupción del aumento terrestre tendrían el mismo aspecto), y es conservador en un sentido: una aeronave que vuela solo dentro de una región afectada durante todo el día no tiene línea base y no se cuenta, de modo que las áreas grandes persistentes se subnotifican.

# text
# c1: kshana-interference-map/ais/v2
seg-41d725eeaba9 = Método de AIS (<c1/>)

# text
# c1: anomalous
seg-7fd53079dccf = Por buque y día, cinco detectores. Un detector <b>califica</b> en una celda cuando marca al menos { "5" } buques distintos que representan al menos el { "20" } % de los buques observados allí; la celda es <c1/> si califica algún detector.

# text
seg-6d599353e8e1 = Detector

# text
seg-551f38a9061c = Regla (preregistrada)

# text
seg-295e8a28a5b9 = al menos { "3" } informes en la celda a más de { "2000" } m tierra adentro de la línea de costa aportada

# text
seg-fd21160e6685 = una ventana de { "20" } informes consecutivos (paso { "10" }, huecos de como máximo { "30" } min) cuyo radio medio respecto al centroide es de { "500" } m a { "20" } km, coeficiente de variación del radio de como máximo { "0.15" }, un solo sentido de marcha con un giro total de al menos { "270" } grados (pasos de como máximo { "90" } grados, neto de al menos el { "80" } % del total) y velocidad media de al menos { "2" } kn

# text
seg-1aa30db06794 = al menos { "2" } saltos que llegan a la celda: informes consecutivos separados al menos { "1000" } m, con como máximo { "1" } h entre ellos, que implican más de { "70" } kn (la velocidad implícita usa al menos { "1" } s entre los informes, de modo que dos informes con la misma marca de tiempo y posiciones separadas { "1" } km o más cuentan como un salto)

# text
seg-7f9b22254009 = al menos { "3" } velocidades informadas superiores a { "70" } kn en la celda

# text
seg-e0d0968e8751 = al menos { "5" } buques distintos que informan de la misma posición (redondeada a { "1e-4" } grados, unos { "11" } m) en la misma ventana de 10 minutos

# text
# c1: null
seg-1bf4c460672c = Las celdas con menos de { "5" } buques distintos no se publican; todo recuento de marcados inferior a { "5" }, incluido el cero, se notifica como <c1/>.

# text
# c1: anomalous
seg-b2ea2ec6bad1 = <b>Versión { "2" }.</b> La versión { "1" } calificaba un detector a partir de { "3" } buques marcados y publicaba recuentos de { "3" } y { "4" }. La versión { "2" } eleva el mínimo de buques marcados a { "5" }, el mínimo de publicación, de modo que un veredicto <c1/> nunca se apoya en menos buques que el número por debajo del cual se retienen los recuentos. Esto endurece el método, y no se publicó ningún archivo de la versión { "1" }.

# text
seg-25593339aeb0 = <b>Causas conocidas de falsos positivos</b>, que la regla de proporción y los umbrales reducen pero no eliminan: buques en ríos, canales y puertos cercanos a una línea de costa gruesa (para esto existe el margen tierra adentro de { "2" } km); dos buques que comparten un identificador, lo que parece saltos; transpondedores con una fijación defectuosa o equipos de prueba; y las maniobras de espera de prácticos y buques de búsqueda, que pueden parecerse a círculos. Un archivo de línea de costa de { "1" }:{ "10" } millones tiene una exactitud de aproximadamente un kilómetro.

# text
seg-ac661440a29a = Los detectores de saltos y de velocidad comparan informes dentro de un único archivo de entrada; una traza dividida entre archivos o días no se une.

# text
seg-05f789b26904 = <b>Memoria.</b> La entrada se lee línea a línea y nunca se mantiene entera. ADS-B conserva solo contadores por aeronave y por celda. AIS conserva cada informe aceptado en un registro compacto (unos { "40" } bytes) hasta que se evalúa su día, por lo que la memoria crece con el número de informes AIS de la entrada; divida por días una entrada de AIS muy grande.

# text
seg-206c78a69ded = Exposición de ruta

# text
# c1: --route
# c2: lat,lon
# c3: --map
seg-0d8832796ab7 = <c1/> es una LineString de GeoJSON (sola, dentro de una Feature o de una FeatureCollection) o un CSV de líneas <c2/>. <c3/> admite archivos de mapa o directorios con ellos, y puede repetirse. Los puntos de paso se unen con líneas rectas en latitud y longitud, así que densifique los tramos largos; un tramo toma el camino corto en longitud, de modo que uno que cruce el antimeridiano ({ "179.5" } E a { "179.5" } W) lo cruza. La ruta se divide en trozos de unos { "250" } m. Cada trozo se mide entre sus dos extremos sobre una esfera de radio { "6371.0088" } km (el mismo trayecto que decide en qué celda cae) y se asigna a la celda que contiene su punto medio.

# text
# c1: share_degraded
# c2: share_not_degraded
# c3: share_unassessed
# c4: share_not_observed
seg-cc5e2553700b = Por día y por fuente, el informe da la longitud de la ruta y cuatro proporciones que suman { "1" }: <c1/>, <c2/>, <c3/> (celda presente pero sin veredicto) y <c4/> (celda ausente del mapa). Lea las dos últimas junto con la primera: una ruta con una proporción degradada baja y una proporción no observada alta no ha demostrado estar despejada. Las filas de ADS-B y de AIS se informan por separado y nunca se combinan. Cada fila lleva la licencia y la atribución del mapa.

# text
seg-3a087d90e317 = Funciones de biblioteca

# text
# c1: kshana::interference_map::api
seg-67ea1ff00bb8 = Para quienes llaman con datos en memoria (enlaces, el servidor MCP, la compilación para navegador), el módulo <c1/> expone los mismos métodos con texto o bytes de entrada y JSON de salida, sin tocar ningún archivo ni la red:

# text
seg-4dbf41c0ec3b = Función

# text
seg-95f87a38a522 = Entrada

# text
seg-0fe8ff25f4a1 = Salida

# text
seg-9e99af2c1f84 = texto CSV de ADS-B

# text
seg-e144f449c5b4 = un segmento de bytes por archivo de traza de readsb (gzip o sin comprimir)

# text
seg-7effd7110c4c = texto CSV de AIS, texto GeoJSON de tierra opcional

# text
# c1: YYYY-MM-DD
seg-10c5e0c0a9c8 = texto de la ruta, textos GeoJSON de los mapas, límites <c1/> opcionales

# text
# c1: kshana-route-exposure/v1
seg-be00d23d96e9 = JSON <c1/>

# text
# c1: DayMap
# c2: file_name
# c3: <source>-<dataset>-<date>.geojson
# c4: date
# c5: geojson
# c6: DatasetSpec
# c7: Preset("adsb-lol" | "noaa-marinecadastre" | "kystverket")
# c8: Custom { licence, licence_url, attribution }
# c9: DEFAULT_CELL_DEG
# c10: MapError
seg-20a842d675c2 = Un <c1/> tiene <c2/> (<c3/>), <c4/> y <c5/> (el documento v1). <c6/> es <c7/> o <c8/>; <c9/> es { "0.5" }. Los errores son <c10/>. Las reglas del conjunto de datos (ajustes preestablecidos admitidos, texto de licencia obligatorio, el tipo debe coincidir) se aplican exactamente igual que en la línea de comandos.

# text
seg-1195686de09b = Validación externa

# text
# c1: tests/interference_map_reference.rs
# c2: tests/fixtures/interference_map_ref/PREREGISTRATION.md
# c3: scripts/gen_interference_map_ref.py
seg-0de37085f544 = <c1/> compara Kshana con implementaciones independientes sobre entradas sintéticas, con tolerancias preregistradas en <c2/>: el significado de los códigos NIC y NACp frente a la decodificación con pyModeS de tramas ADS-B sintéticas, los valores de no disponible de AIS frente a la decodificación con pyais de frases AIVDM sintéticas, la asignación a celdas de la rejilla frente a shapely, la longitud de ruta por estado de celda frente a shapely y GeographicLib, y el enmascaramiento de tierra adentro frente a shapely y pyproj. Los datos de prueba los genera <c3/>; la CI no necesita Python. Esto valida cómo se leen los códigos y los valores de los campos, y la geometría. No valida que una celda marcada sea interferencia.

# text
# c1: src/interference_map/
# c2: tests/interference_map_cli.rs
seg-56a3e955cbcc = Todas las pruebas usan datos sintéticos generados y ninguna red: pruebas unitarias en <c1/>, y <c2/> para los comandos de extremo a extremo, incluido que ningún identificador llegue a una salida y que las negativas no dejen archivos.

# text
seg-212c43d1a41c = <s1>Anterior</s1>Flujos NMEA de formación

# text
seg-7f13ee5d254e = <s1>Siguiente</s1>Mapa de interferencias: fuentes de datos y licencias

# text
seg-1fc1794d9388 = Método de ADS-B (kshana-interference-map/adsb/v2)

# text
seg-a3a97ab49ed1 = Método de AIS (kshana-interference-map/ais/v2)
