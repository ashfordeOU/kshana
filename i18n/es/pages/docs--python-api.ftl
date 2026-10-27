# docs--python-api: translations (es)

# text
seg-5ad814c7ef9e = Notas

# text
seg-2bd2101ce454 = Superficie

# text
seg-fffbeccd4266 = Símbolo

# text
seg-a129b9e613d0 = Tipo

# text
# c1: docs/PYTHON_API.md
seg-ce0b6a889a87 = Fuente: <c1/>

# text
# c1: abi3
# c2: kshana.pyi
# c3: py.typed
# c4: mypy
# c5: pyright
seg-aea4d3625c20 = Kshana incluye una interfaz de programación de aplicaciones (API) de Python de primera clase, construida con <a1>PyO3</a1> y <a2>maturin</a2>. Sus ruedas <c1/> se construyen contra la interfaz binaria de aplicación (ABI) estable de Python, de modo que una rueda por plataforma funciona en CPython ≥ { "3.9" }; las ruedas cubren Linux, macOS y Windows, cada uno en x86-64 y ARM de 64 bits (véase <a3>WHEEL_TAGS.md</a3>). Un stub de tipos incluido (<c2/> + <c3/>) ofrece a los editores y a <c4/>/<c5/> información de tipos completa.

# text
seg-8b0ad6639bd5 = Inicio rápido

# text
# c1: scenarios/
# c2: pip install numpy
seg-28e092a5a781 = Ejecute estos fragmentos desde la raíz de una copia del repositorio: leen archivos de escenario de <c1/>. La línea de NumPy necesita <c2/>.

# text
seg-8c83544270b5 = Firma

# text
seg-fa90b5cd182b = Devuelve

# text
# c1: .json
# c2: .svg
# c3: .summary
# c4: .csv
# c5: .data()
# c6: .array()
# c7: .columns()
# c8: .series()
# c9: .write_csv()
seg-6f62744a47df = resultado tipado (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

# text
seg-67cd4e7f6ad0 = documento de resultado como cadena JSON (JavaScript Object Notation)

# text
seg-8246b2be7aaf = tipos de escenario disponibles + metadatos (analizados)

# text
# c1: scenario_kinds
seg-b5ad97d3ec18 = los mismos metadatos como UNA cadena de matriz JSON, no una lista (se conserva para quienes ya la llaman; use <c1/> para la lista analizada)

# text
seg-8ce669f8e1d0 = mensajes de error (vacío si es válido)

# text
# c1: invalid_input
# c2: non_convergence
# c3: unsupported
# c4: io_error
# c5: None
seg-6017d21f52dd = etiqueta de categoría de fallo (<c1/>, <c2/>, <c3/> o <c4/>), o <c5/> si tiene éxito

# text
seg-c62c5ab99132 = versión del motor

# text
# c1: receiver-trust
# c2: [platform] kind = "vessel"
seg-fdaaf33250d1 = evalúa un registro real de receptor descrito por un escenario <c1/>: documento de resultado, CSV de confianza por época, gráfico y resumen; una tabla <c2/> añade los monitores marítimos y la puntuación de confianza de 0 a 100 con sus motivos (orientativo)

# text
seg-0fb76af3d043 = un extracto NMEA acotado puntuado como lo puntúa el modo en vivo: estado por época, puntuación de 0 a 100 y motivos, un resumen (sin socket, sin puerta; orientativo)

# text
seg-6ecd9bb3a1cd = el registro NMEA de una embarcación como ejecución por lotes: el modelo de puntuación y la puntuación de cada época con sus deducciones (orientativo)

# text
# c1: events_toml
# c2: events
seg-7cd62f15bc3c = el catálogo y el plan publicados de Jammertest como eventos de verdad planificada (<c1/>, <c2/>); franjas planificadas, no horas de emisión registradas

# text
seg-1e2faf2894e3 = un registro de receptor puntuado frente a ese calendario: latencia por prueba, omisiones, tiempo de recuperación, falsas alarmas (MODELLED; un paquete firmado requiere la línea de comandos)

# text
# c1: files
# c2: public_key
# c3: seed_hex
seg-f94eaef45f04 = un paquete de evidencias firmado para una ventana del registro, en memoria: <c1/>, <c2/>, <c3/> (manténgala privada); un registro técnico, no un dictamen jurídico

# text
# c1: verdict
# c2: verified
# c3: intact-signer-not-pinned
# c4: failed
seg-ebd10aea2f6f = verifica un paquete: hashes, cadena, firma y, opcionalmente, el firmante de confianza, el registro completo y una marca de tiempo; <c1/> es <c2/>, <c3/> (sin clave pública dada: íntegro, firmante no establecido) o <c4/>

# text
# c1: --export-sp3/-omm/-oem
seg-bf13e70f1d5c = los artefactos <c1/> de la CLI como texto

# text
seg-1e5eb44bec6f = qué formatos de interoperabilidad se aplican a un escenario, sin ejecutarlo

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
# c6: {format, spec_url, files}
# c7: {suffix, bytes, sha256, encoding, content}
# c8: utf-8
# c9: base64
seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> o <c5/> en memoria: <c6/>, cada archivo <c7/> (texto <c8/> o <c9/>)

# text
# c1: --import-route
seg-bef8250e8453 = una ruta GeoJSON escrita en un escenario de trayectoria por puntos de paso (<c1/>)

# text
# c1: {summary, files}
seg-e25bcb6342db = la serie temporal de la ejecución como SVG animado, un reproductor HTML o hasta { "120" } fotogramas SVG: <c1/>

# text
seg-9b24b9cf0510 = los escenarios de referencia incluidos y su TOML

# text
# c1: {files, notes}
seg-f62c11fe1e7d = vincula un token RFC { "3161" } (bytes o base64) a un paquete en memoria: <c1/>; el paquete debe seguir verificándose; no se comprueba la firma de la autoridad

# text
# c1: seed_hex
# c2: public_key
# c3: fingerprint
# c4: warning
seg-95fe54b500a7 = una nueva clave de firma en memoria: <c1/> (PRIVADA), <c2/>, <c3/>, <c4/>; solo Python

# text
# c1: iq sweep
seg-646e6aba13db = reproduce una grabación con distintos diseños de lazo (<c1/>): por diseño y PRN, jitter en régimen permanente, fracciones de enganche y C/N0; una adquisición por PRN, con todos los canales sobre las mismas muestras

# text
# c1: hash
seg-08d46de5e7cd = describe una grabación o todas las grabaciones de una carpeta (lee archivos; <c1/> los lee por completo)

# text
# c1: {files: {suffix: text}, notes, notice}
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: notice
seg-7d9cc8394e65 = el movimiento del vehículo y los eventos de un escenario para un simulador GNSS de laboratorio, en memoria: <c1/>; tipos de escenario <c2/>, <c3/>, <c4/>; no se escribe ninguna señal; conserve <c5/> junto con los archivos

# text
# c1: runs
# c2: {label, result, scenario?}
# c3: {report, markdown}
# c4: status
# c5: report["statement"]
seg-e215c7242eb2 = la correspondencia con el marco público rellenada a partir de textos de resultados: <c1/> es una lista de diccionarios <c2/> (texto, como máximo { "64" }); devuelve <c3/>; el <c4/> de cada fila indica que las ejecuciones aportan evidencias a favor de sus capacidades, no que se satisfaga un marco normativo; incluya <c5/> en cualquier visualización

# text
seg-18d57e4920dd = las tablas estáticas de correspondencia (o los documentos fuente) como Markdown, encabezadas por la declaración

# text
seg-8284e10dce6a = los paquetes de normas (id, título, marco, número de pruebas) y un aviso; un paquete mide escenarios modelados frente a umbrales fijados antes de la ejecución

# text
# c1: MET
# c2: NOT MET
# c3: NEEDS INPUT
# c4: markdown
# c5: ValueError
seg-ce6b819604a9 = una ejecución de paquete: cada prueba <c1/>, <c2/> o <c3/> con valores medidos y esperados, más el informe como Markdown en <c4/>; lanza <c5/> si el id es desconocido

# text
seg-0f701bc523c6 = la implementación de LunaNet AFS comprobada frente a las tablas impresas y los ejemplos resueltos de LSIS-AFS V1.0 (umbrales B1 a B10; B4 informa de un fallo fijado)

# text
seg-82aecf261c46 = un flujo de símbolos AFS (texto de { "0" } y { "1" }) comprobado en cuanto a patrón de sincronización, decodificación de SB1, FID y continuidad y espaciado de TOI; no se verifican LDPC ni CRC-24Q de las subtramas { "2" } a { "4" }

# text
seg-f72ab45ae10b = un flujo de símbolos de prueba con subtramas de relleno (no es una forma de onda)

# text
# c1: docs/spec/TEST-CONDITIONS.md
# c2: evidence_create
seg-1da34527bb64 = el paquete firmado de ida y vuelta de laboratorio que vincula por hash el escenario, las condiciones de prueba (<c1/>), el registro del receptor y la puntuación; como <c2/>

# text
seg-dd3726fec672 = un archivo de resultados de kshana-bench (texto JSON) a partir de un archivo de verdad y un archivo de predicciones; MODELLED

# text
seg-b82a110c324c = archivos de resultados de kshana-bench representados como la página estática de clasificación (HTML)

# text
# c1: kshana osnma verify --json
# c2: advisory
seg-58b8aa919eaf = autenticación OSNMA de Galileo de páginas I/NAV o de un flujo UBX en memoria: el diccionario que imprime <c1/>, con el aviso orientativo en su campo <c2/>; solo orientativo, no un servicio de integridad de la navegación

# text
# c1: visible
# c2: masked
# c3: request
# c4: site
# c5: time_s
# c6: systems
# c7: tle
# c8: satellites
# c9: mask_deg
# c10: skyline
# c11: clock
# c12: sigma_uere_m
# c13: confidence
# c14: sky_source
# c15: sky_statement
seg-15e4601cd88c = los satélites que ve un emplazamiento bajo un horizonte dependiente del acimut: por satélite <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, el cofactor y la covarianza este-norte-arriba y las elipses de error horizontal; <c3/> es texto JSON o TOML o un diccionario (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); la decisión de visibilidad y la elipse se comprueban frente a bibliotecas independientes, el resto es MODELLED, y el resultado lleva el aviso orientativo (<c14/>, <c15/> indican si el cielo es representativo o procede de conjuntos de elementos)

# text
# c1: n
# c2: request
seg-51ac7cd68154 = <c1/> ({ "1" } a { "5000" }) errores de mínimos cuadrados con semilla sobre el conjunto visible de <c2/>, con su covarianza empírica, su RMS y la fracción dentro de la elipse del { "95" } %

# text
# c1: city-street
# c2: harbour-approach
# c3: fjord
# c4: container-terminal
seg-8bba3099379a = los preajustes de horizonte (<c1/>, <c2/>, <c3/>, <c4/>) con su etiqueta REPRESENTATIVE, su procedencia y el corte en cada grado de acimut; geometrías representativas, no levantamientos

# text
seg-f900de61f6e9 = una sección de horizonte (tabla, cañón urbano, sectores, terreno) reducida a la tabla normalizada de 360 entradas que usa el motor

# text
# c1: request
seg-824f3c5951fa = el skyplot de <c1/> como texto SVG estático

# text
# c1: jsonl
# c2: receiver-trust
# c3: kshana trust-telemetry
seg-0ffb65c8f5f3 = un flujo de confianza (<c1/>) o un resultado <c2/> como texto Prometheus, líneas de syslog CEF o LEEF o una carga útil JSON de OTLP, con los codificadores de <c3/>; no se envía nada y no se lee ningún reloj (las líneas de syslog no llevan marca de tiempo)

# text
# c1: kshana-interference-map/v1
seg-c1ab3dbbe2f2 = un mapa de interferencia GNSS a partir de texto CSV de ADS-B o AIS: un diccionario por día UTC con GeoJSON <c1/> (solo agregado; una celda degradada no señala la interferencia como causa)

# text
seg-ff4bc7fdbce7 = proporción de una ruta que atraviesa celdas degradadas de esos mapas, como texto JSON (no es un pronóstico; las celdas no observadas no son evidencia de una ruta despejada)

# text
# c1: nmea
# c2: log_json
# c3: log_text
seg-d70bccba0e03 = NMEA sintético de puente para la formación de la tripulación más el registro del instructor (<c1/>, <c2/>, <c3/>); solo texto, nunca para los sistemas de navegación en vivo de una embarcación

# text
# c1: iq_scene
# c2: iq_acquire
# c3: iq_track
# c4: gps-l1ca
# c5: galileo-e1b
# c6: glonass-l1of
seg-3fe13851ac82 = los nombres de señal IQ GNSS que aceptan <c1/>, <c2/> y <c3/> (<c4/>, <c5/>, <c6/>, ...)

# text
# c1: samples_i
# c2: samples_q
# c3: truth
seg-50bf4ad4e23a = una escena IQ GNSS multisatélite en memoria: <c1/> / <c2/> y <c3/> por época

# text
seg-b3199839a37c = lo mismo, con cada satélite GPS en su geometría de efemérides de radiodifusión a partir de un mensaje de navegación RINEX (Receiver Independent Exchange Format)

# text
seg-8f0f9efea46b = adquisición por FFT (transformada rápida de Fourier) de cada PRN (código de ruido pseudoaleatorio): Doppler, fase de código, estadístico, umbral

# text
# c1: kshana.acq-surface/1
# c2: rows[doppler][lag]
# c3: parabolic
# c4: fine_search
seg-3bf994f3f1bf = toda la superficie de adquisición de un PRN (<c1/>): potencia de correlación <c2/>, el pico y dos refinamientos finos del Doppler (<c3/>, <c4/>)

# text
seg-393572e31421 = adquirir y luego seguir cada PRN: Doppler por época, fase de código, indicadores de enganche, C/N0, correlador prompt

# text
seg-bc39efdb015a = la cadena del front-end del receptor (paso de banda, notch, blanking, excisión, AGC (control automático de ganancia), cuantificador) sobre muestras complejas

# text
# c1: iq-labfit
seg-ead1b81c712f = ajusta el modelo de pérdida de enganche del lazo de seguimiento a una cronología de confianza del receptor (un escenario <c1/>)

# text
# c1: kshana.loop-design/1
# c2: name
# c3: hash
# c4: ValueError
seg-0ab8531d0465 = analiza un archivo <c1/> (una ruta o texto TOML) y obtiene sus diseños resueltos, cada uno con su <c2/> y su <c3/>; <c4/> si el archivo no es válido

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: header
# c4: records
seg-9c3467d4451e = lee un archivo binario de épocas de seguimiento (<c1/>, tal como lo escribe <c2/>): el <c3/> y un diccionario por época en <c4/>

# text
# c1: iq monitor
# c2: series
# c3: events
# c4: spectra
# c5: notes
seg-469303e33d2a = los monitores de detección IQ sobre una grabación en una sola pasada de flujo (<c1/>): <c2/>, <c3/>, <c4/> y <c5/>; lee un archivo

# text
# c1: kshana.test-conditions/1
# c2: hash
seg-bb5c5008f1a8 = valida un archivo de condiciones de prueba de laboratorio (<c1/>, TOML o JSON, una ruta o texto) y lo devuelve resuelto, con su <c2/>

# text
# c1: kshana.campaign/1
# c2: out_dir
# c3: kshana iq campaign
# c4: digest
seg-d2441bf762b4 = ejecuta una campaña de reproducción de laboratorio (<c1/>) en <c2/> como lo hace <c3/>; se omiten las celdas terminadas; devuelve los recuentos de celdas, los fallos y el <c4/> una vez terminada cada celda

# text
# c1: digest
seg-7b6d264d9c7f = reconstruye las tarjetas de puntuación, el informe HTML y el resumen de una campaña a partir de sus celdas: los recuentos de celdas y de filas, las filas que no alcanzan un umbral y el <c1/>

# text
seg-e3956268cf1c = Firmas de IQ GNSS y de confianza del receptor

# text
# c1: kshana.pyi
# c2: samples_i
# c3: samples_q
# c4: i
# c5: q
# c6: numpy.asarray(...)
seg-817bd0898d46 = Las firmas completas, tal como las indica <c1/> (toda palabra clave posterior a los argumentos obligatorios tiene un valor por defecto; las docstrings del stub dan el significado de cada una). Envuelva las listas <c2/> / <c3/>, y las entradas <c4/> / <c5/>, con <c6/> para obtener matrices.

# text
# c1: iq_read_epochs
# c2: kshana iq track --epochs
seg-2dd9323829ce = Una campaña de reproducción de laboratorio desde Python y después su informe (el archivo de campaña y sus grabaciones son suyos; una celda terminada se omite en la siguiente llamada; <c1/> lee un archivo de épocas de seguimiento escrito por una ejecución de <c2/>):

# text
# c1: iq_track
# c2: acq_coherent
# c3: None
# c4: acq_coherent=1
seg-5f48b88438df = El parámetro <c2/> de <c1/> fija cuántos periodos de código integra de forma coherente la adquisición de traspaso. Desde { "0.33.0" } su valor por defecto es <c3/>, es decir, automático: unos { "4" } ms ({ "4" } periodos para un código de { "1" } ms como el GPS L1 C/A, { "1" } para un código de { "4" } ms o más), de modo que el canal arranca lo bastante cerca para que el lazo de frecuencia lo enganche; <c4/> conserva la búsqueda de un periodo de { "0.32" }.

# text
seg-012a83181bd3 = Tipos

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: Literal
# c4: ErrorKind
# c5: error_kind
# c6: ProvenanceClass
# c7: TypedDict
# c8: KindMeta
# c9: scenario_kinds()
# c10: FieldUnit
# c11: units
# c12: _FieldUnitBase
# c13: tests/typed_api_sync.rs
seg-0b4f4c6c6014 = <c1/> tipa los vocabularios cerrados para los verificadores (mypy, pyright): <c2/> (cada nombre de tipo de escenario, un <c3/>), <c4/> (las cuatro etiquetas que devuelve <c5/>), <c6/> y los <c7/> <c8/> (de lo que <c9/> devuelve una lista) y <c10/> (una entrada del bloque <c11/> de un resultado, que amplía la base de claves obligatorias <c12/>). Existen solo para los verificadores de tipos y no se pueden importar en tiempo de ejecución; <c13/> los mantiene iguales a las listas del motor.

# text
seg-b5ad0d8e1456 = Miembro

# text
seg-2698ab8436e6 = documento de resultado completo (JSON)

# text
seg-7eccc8361120 = SVG (Scalable Vector Graphics) de gráfico independiente

# text
seg-38c8d20ca07a = resumen legible de una línea

# text
seg-e21e82ad3fe8 = la tabla de reproducibilidad, para los tipos de escenario que la emiten (véase abajo)

# text
seg-aadcc1cc4c79 = el resultado analizado como un diccionario de Python (véase la nota sobre su estructura más abajo)

# text
# c1: path
# c2: "points.0.coords"
# c3: "/points/0/coords"
seg-409504363c4c = la lista numérica en <c1/> (con puntos, <c2/>, o un puntero JSON, <c3/>): 1-D para números, 2-D para listas numéricas de igual longitud

# text
# c1: path
seg-b6d5d7e5271a = la lista de registros en <c1/> (una serie temporal), una matriz por cada campo que es un número en todos los registros

# text
# c1: .columns
seg-adb2d15f9f74 = toda lista de registros con un campo numérico, indexada por ruta con puntos, cada una como <c1/>

# text
# c1: path
seg-7f053ad96880 = escribe esa tabla en <c1/>; devuelve los bytes escritos, o { "0" } (y no escribe nada) cuando el tipo de escenario no emite tabla

# text
seg-276104139e73 = La tabla de reproducibilidad

# text
# c1: realtime-frame-eop
# c2: lunar-time-budget
# c3: lunar-jamming
# c4: telecom-timing
# c5: leo-navmsg
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: csv = None
# c10: <scenario>.table.csv
seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> y <c5/> publican siempre una tabla; <c6/> publica una cuando hay configurado un emplazamiento de exportación (<c7/> + <c8/>). Cualquier otro tipo de escenario devuelve <c9/>. El texto son los mismos bytes que la CLI (interfaz de línea de comandos) escribe como <c10/>, de modo que quien revisa y reproduce una tabla publicada desde la wheel nunca tiene que pasar a la línea de comandos:

# text
seg-3ad2987110ee = Estructura del resultado

# text
seg-57c7066d3522 = Las cifras de mérito y la serie temporal viven <b>en cada lado de la ejecución</b>, no en el nivel superior. Para una ejecución de reloj, el documento es:

# text
# c1: data["quantum"]["fom"]
# c2: data["figures_of_merit"]
# c3: field-units-schema.json
# c4: SCHEMA.md
seg-cb19f961de2b = de modo que las cifras de mérito están en <c1/>, nunca en <c2/>. Otros tipos de escenario emiten sus propios paquetes; la referencia completa por campo, con unidades y un puntero a la fuente, es <a1><c3/></a1> y la guía para el lector es <a2><c4/></a2>.

# text
# c1: validate_toml
# c2: error_kind
seg-bfd984e0407b = <c1/> y <c2/> <b>ejecutan</b> el escenario, por lo que sacan a la luz errores de análisis, de configuración <em>y</em> de ejecución. Nunca lanzan excepciones.

# text
# c1: run
# c2: run_typed
# c3: ValueError
seg-0ca0a1da8356 = <c1/> / <c2/> lanzan <c3/> ante un escenario no válido.

# text
# c1: seed
# c2: scenario_hash
# c3: REPRODUCIBILITY.md
seg-901c2ede0cd0 = Los resultados son reproducibles: un escenario lleva su <c1/> y el motor registra un <c2/>, de modo que la misma entrada produce una salida idéntica byte a byte en la misma plataforma (véase <a1><c3/></a1>).

# text
# c1: .array
# c2: .columns
# c3: .series
# c4: numpy.asarray(...)
# c5: .data()
# c6: tests/python/test_numpy_runoutput.py
# c7: ImportError
# c8: KeyError
# c9: ValueError
# c10: notebooks/
seg-8c0c32fcba2b = <c1/>, <c2/> y <c3/> devuelven exactamente <c4/> de los mismos valores que da <c5/> (mismo dtype, idéntico bit a bit; <c6/>). Importan NumPy al ser llamados y lanzan <c7/> si no está; NumPy queda fuera de los requisitos de ejecución del paquete. <c8/> significa que falta la ruta, y <c9/> que el valor que hay en ella no es una matriz numérica (o no es una lista de registros). Hay cuadernos ejecutables en <a1><c10/></a1>.

# text
seg-00a3cf088cde = No disponible en Python: procesos de larga duración

# text
# c1: kshana receiver-trust live
# c2: --listen
# c3: docs/TRUST-TELEMETRY.md
# c4: kshana nmea-scenario --tcp/--udp
# c5: receiver_trust
# c6: receiver_trust_replay
# c7: nmea_training
seg-3780dd4973f0 = <c1/> (un proceso de flujo con puerta y un servidor TCP <c2/> opcional), los exportadores de telemetría (Prometheus, OTLP, syslog; <c3/>) y el flujo de <c4/> son solo de línea de comandos: un binding vuelve cuando vuelve la llamada y no mantiene abierto un socket. Python cubre la forma por lotes de cada uno: <c5/> para un registro, <c6/> para un extracto de flujo (puntuaciones y estados; no se aplica la puerta), <c7/> para el texto generado.

# text
seg-82379c29d438 = <s1>Anterior</s1>Interferómetro de átomos fríos

# text
seg-4a457afc63fb = <s1>Siguiente</s1>npm y WebAssembly

# text
seg-dbbce10a12d2 = RunOutput
