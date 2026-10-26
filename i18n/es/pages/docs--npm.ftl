# docs--npm: translations (es)

# text
seg-3d770dd786e4 = Uso

# text
seg-d4a762001549 = Licencia

# attr:alt
seg-81a87d14efda = Kshana: la marca, una retícula de brújula que señala el instante preciso, junto al logotipo tipográfico kshana

# text
# c1: README.npm.md
seg-0ddcab84868f = Fuente: <c1/>

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>el instante preciso</em></b><br/> Un simulador de código abierto para la resiliencia de PNT (posicionamiento, navegación y temporización).

# text
seg-3b861b2f08b8 = Versión v{ $version }

# text
seg-ebe636986f46 = { "176" } de { "388" } capacidades validadas frente a referencias independientes externas

# text
seg-6a1906d8d4ad = Cerca del { "95" }% de cobertura de líneas, con un mínimo del { "85" }% exigido en la integración continua

# text
seg-a9f4f2795fb5 = Licencia: AGPL-3.0-only, o una licencia comercial

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Ensaye el minuto en que el GNSS se apaga: la consola de misión de Kshana, dibujada a partir de una ejecución real del motor, una campaña encadenada de jamming, spoofing, holdover e integridad sobre los { "102" } satélites de GPS, Galileo, BeiDou y GLONASS

# text
seg-d1153c5e9112 = Ensaye el minuto en que el GNSS se apaga

# text
seg-d284448743af = Kshana reproduce jamming, spoofing y holdover de reloj cuando fallan las señales GNSS (Sistema Global de Navegación por Satélite), y le dice cuánto tiempo mantiene un sistema la hora y la posición dentro de su presupuesto, y qué reloj o sensor aporta más margen. Este es el paquete WebAssembly: todo el motor en JavaScript, en el navegador o en Node.js. Cada ejecución es reproducible bit a bit a partir del escenario, la semilla y la versión del motor.

# text
seg-d1a3f78ad8e0 = Pruébelo primero sin instalar nada: <a1>Kshana Studio</a1> ejecuta todo el motor en su navegador, compilado a WebAssembly, y no sube nada.

# text
seg-2d2c47db0c1f = <b>{ "176" } de { "388" }</b> capacidades validadas frente a referencias independientes externas; { "208" } etiquetadas con honestidad como modeladas, { "4" } propiedad de un socio. Cada capacidad lleva una etiqueta en un registro comprobado por máquina: VALIDATED (concuerda una referencia independiente externa: datos reales, una implementación independiente o vectores de referencia publicados), MODELLED (internamente coherente, y declarado en voz alta) o PARTNER (la posee un socio de hardware). Entre las comprobaciones: los { "666" } vectores SGP4 (Simplified General Perturbations { "4" }) de AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 hasta { "4.12" } mm, y el modelo de fuerzas de Cowell hasta { "0.08" } m frente a Orekit { "12.2" }.

# attr:alt
seg-44f7862c45a2 = Cómo gana una capacidad su etiqueta: capacidad, referencia independiente, prueba, etiqueta del registro. El estado de verificación de las { "388" } capacidades: { "176" } validadas, { "208" } modeladas, { "4" } propiedad de un socio

# text
seg-d662055d817f = El paquete es un módulo ES (ECMAScript, JavaScript estándar) con una carga WebAssembly, creado para el navegador. Inicialícelo una vez y después llame al motor de forma síncrona. La única diferencia entre el navegador y Node.js es cómo se carga el binario de WebAssembly.

# text
# c1: node_modules/kshana/
# c2: init()
# c3: kshana_bg.wasm
seg-0b750617ea08 = <b>En el navegador</b> (mediante un empaquetador, o una página que sirva <c1/>), <c2/> obtiene <c3/> desde junto al módulo:

# text
# c1: init()
# c2: TypeError: fetch failed
# c3: fetch
# c4: initSync
seg-70fc98eb8d2e = <b>En Node.js</b>, <c1/> falla con <c2/> (el <c3/> de Node no puede leer un archivo local), así que lea el binario del disco y páselo a <c4/>:

# text
# c1: .mjs
# c2: "type": "module"
# c3: package.json
# c4: import
seg-2c181d5e0942 = Guarde la versión de Node.js como un archivo <c1/> (o establezca <c2/> en su <c3/>) para que <c4/> funcione. A partir de ahí ambas son iguales:

# text
# c1: run_typed(toml)
# c2: RunOutput
# c3: json
# c4: svg
# c5: summary
# c6: csv: string | null
# c7: data: ResultDocument
# c8: scenario_kinds()
# c9: KindMeta[]
# c10: name
# c11: ScenarioKind
# c12: error_kind()
# c13: ErrorKind
# c14: ""
# c15: ResultDocument
# c16: schema_version
# c17: engine_version
# c18: units
# c19: FieldUnit
seg-06eb982ef260 = TypeScript ve resultados tipados: <c1/> devuelve un <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> devuelve un <c9/> cuyo <c10/> es la unión <c11/> de todos los tipos, y <c12/> devuelve un <c13/> (o <c14/> si tiene éxito). Los campos propios de cada documento de resultados varían según el tipo; <c15/> tipa la envoltura compartida (<c16/>, <c17/> y el bloque <c18/> de <c19/>s).

# text
# c1: kind_modules()
# c2: field_importance()
# c3: iq_signals()
# c4: iq_run_short
# c5: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
seg-31d983ae7036 = Cuatro funciones más describen el motor a una interfaz. <c1/> devuelve un objeto JSON que asigna a cada tipo los módulos que nombran sus filas de la matriz de verificación, <c2/> otro que asigna a cada tipo los campos de resultados que responden a su pregunta (metadatos de presentación; el motor nunca los lee), <c3/> los nombres de señal que acepta <c4/>, y <c5/> una escena IQ sintética corta, adquirida y seguida en memoria (como máximo { "0.25" } s, { "1,000,000" } muestras y { "8" } satélites), con la misma respuesta que la compilación nativa.

# text
# c1: run
# c2: summary
# c3: chart_svg
# c4: table_csv
# c5: undefined
# c6: run_all
# c7: {json, svg, summary, csv}
# c8: run_typed
# c9: data
# c10: version
# c11: list_kinds
# c12: scenario_kinds
# c13: error_kind
# c14: scenario_kinds
# c15: encode_permalink
# c16: decode_permalink
# c17: export_sp3
# c18: export_omm
# c19: export_oem
# c20: receiver_trust
# c21: receiver-trust
# c22: {json, csv, svg, summary}
# c23: text
# c24: base64
# c25: [platform] kind = "vessel"
# c26: export_formats
# c27: export_scenario
# c28: czml
# c29: kml
# c30: geojson
# c31: stk
# c32: sigmf
# c33: {format, spec_url, files}
# c34: import_route
# c35: --import-route
# c36: animate_scenario
# c37: list_examples
# c38: get_example
# c39: evidence_attach_timestamp
# c40: osnma_verify
# c41: receiver_trust_replay
# c42: assess_vessel_log
# c43: trust_telemetry
# c44: evidence_verify
# c45: bench_export
# c46: compliance_report
# c47: compliance_mapping
# c48: interference_map
# c49: kshana-interference-map/v1
# c50: route_exposure
# c51: nmea_training
# c52: sky_geometry
# c53: sky_monte_carlo
# c54: skyline_presets
# c55: skyline_profile
# c56: skyplot_svg
# c57: receiver-trust live
# c58: run_full
seg-ceee5ddc0c36 = En la cara WebAssembly cada punto de entrada es una llamada aparte: <c1/> (el documento de resultados como cadena JSON), <c2/>, <c3/>, <c4/> (la tabla CSV (valores separados por comas) del escenario como cadena, o <c5/> para los tipos que no publican tabla; lanza un error con un escenario no válido), <c6/> (una ejecución del motor que devuelve <c7/> como cadena JSON: úsela cuando quiera más de una salida, ya que cada otra llamada ejecuta el escenario de nuevo), <c8/> (las mismas salidas como un único objeto tipado, con el documento ya interpretado como <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspección; <c14/> devuelve la lista interpretada), <c15/> / <c16/> (el códec de enlaces compartibles (URL, localizador uniforme de recursos) que <a1>Kshana Studio</a1> usa para recorrer ida y vuelta un escenario completo por el fragmento de la barra de direcciones) y <c17/> / <c18/> / <c19/>, los artefactos de efemérides SP3-c (revisión c del formato Standard Product { "3" }) y CCSDS (Consultative Committee for Space Data Systems) que escribe la CLI (OMM, el Orbit Mean-elements Message, y OEM, el Orbit Ephemeris Message), y <c20/>, que evalúa un registro real de receptor descrito por un escenario <c21/> y devuelve <c22/> como cadena JSON (el navegador no tiene sistema de archivos, así que el registro, y cualquier archivo de navegación, deben ir en línea en el escenario como <c23/> o <c24/>; una tabla <c25/> añade los monitores marítimos y la puntuación de confianza de 0 a 100, solo consultiva), <c26/> / <c27/> (qué formatos de interoperabilidad admite un escenario, sin ejecutarlo, y una exportación en memoria: <c28/>, <c29/>, <c30/>, <c31/> o <c32/> como JSON <c33/>, idéntica byte a byte para el mismo escenario, sin subir nada), <c34/> (una ruta GeoJSON escrita en un escenario de trayectoria por puntos de ruta, el <c35/> de la línea de comandos), <c36/> (la serie temporal de la ejecución como SVG animado, un único reproductor HTML o fotogramas SVG), <c37/> / <c38/> (los escenarios de referencia incluidos y su TOML), <c39/> (vincula un token RFC { "3161" } a un paquete de evidencias en memoria; el paquete debe seguir verificándose, y no se comprueba la firma de la autoridad de sellado de tiempo), <c40/> (qué datos de navegación de Galileo de qué satélites autentica un archivo de páginas I/NAV o un flujo UBX, con la raíz de Merkle de confianza o las claves públicas y una hora de referencia independiente opcional; autentica datos y no hace ninguna afirmación de prestaciones antispoofing; no se sube nada), <c41/> (un extracto NMEA acotado puntuado como lo puntúa el modo en vivo; sin compuerta), <c42/> (el registro NMEA de un buque como ejecución por lotes), <c43/> (un flujo o resultado de confianza como texto Prometheus, líneas syslog CEF o LEEF, o una carga OTLP; no se envía nada), <c44/> (comprueba un paquete de evidencias firmado; no se sube nada; los paquetes se crean con la CLI, Python o MCP), <c45/> (el movimiento y los eventos de un escenario como texto para un simulador de laboratorio; no se escribe ninguna señal), <c46/> y <c47/> (a qué filas de requisitos de marcos públicos aportan evidencias a favor de los documentos de resultados, con la brecha de cada fila; no es una conclusión de que se alcance un marco), y <c48/> (texto CSV de ADS-B o AIS a un GeoJSON <c49/> por día UTC; solo agregado), <c50/> (la proporción de una ruta que atraviesa celdas degradadas de esos mapas; no es un pronóstico), <c51/> (NMEA de puente sintético y un registro del instructor para la formación de tripulaciones; solo texto, nunca para los sistemas de navegación en servicio de un buque) y las funciones de geometría del cielo <c52/>, <c53/>, <c54/>, <c55/> y <c56/> (qué satélites ve un emplazamiento cuando edificios, muelles o terreno bloquean parte del cielo, con la dilución de la precisión, la elipse de error horizontal, una nube de Monte Carlo con semilla y un skyplot como texto SVG; la decisión de visibilidad y la elipse se comprueban frente a bibliotecas independientes, los preajustes son geometrías representativas y no levantamientos, y un horizonte elimina los satélites con línea de visión y nada más). No están en la compilación del navegador: <c57/> con su compuerta y su escucha TCP, el NMEA de formación en flujo y los exportadores de telemetría (Prometheus, OpenTelemetry, syslog) son procesos de red de larga duración y permanecen en la herramienta de línea de comandos; crear un paquete de evidencias requiere una clave de firma, que corresponde a la CLI o a Python. Aquí no hay una llamada única <c58/>; ese enlace existe solo en la wheel de Python.

# text
seg-12a295fba8a5 = Cada capacidad de la matriz de verificación se etiqueta como <b>validada</b> (comprobada frente a una referencia independiente externa), <b>modelada</b> o <b>propiedad de un socio</b>; las cifras de relojes ópticos son objetivos espaciales sobre hardware de tierra (ningún reloj óptico de estroncio ha volado). La madurez <em>no</em> es uniforme entre dominios: el PNT terrestre está validado con datos reales; la navegación del espacio profundo y de Marte está modelada, con solo sus bloques constructivos (tiempo de luz, posiciones planetarias) validados frente a referencias independientes externas; la determinación de órbita (OD) del espacio profundo en misiones reales está en la hoja de ruta.

# text
# c1: kshana kinds
# c2: gnss-ssv
# c3: lunar-infrastructure
# c4: holdover-test
seg-3de57431d3e6 = El motor tiene { "87" } tipos de escenario; <c1/> los lista con sus campos. Novedades de { "0.38.0" }: <c2/> (señales GNSS para naves por encima, alrededor y más allá de las órbitas GNSS) y <c3/> (órbita y superficie lunares como infraestructura de navegación y geodésica), ambos MODELLED, y <c4/> (un registro de error de tiempo frente a las máscaras de la UIT-T).

# text
seg-68ed88ec0b32 = <b>Espectro</b>: cómo un jammer se apodera de la banda L del GNSS, banda por banda.

# text
seg-f04a0aeeee33 = <b>Relojes y temporización</b>: holdover frente a un umbral, transferencia de tiempo y holdover de telecomunicaciones frente a las máscaras del sector de normalización de la Unión Internacional de Telecomunicaciones (UIT-T).

# text
seg-7e38ac603ef2 = <b>Constelaciones alrededor de cualquier cuerpo</b>: cobertura, dilución de la precisión y disponibilidad alrededor de la Tierra, la Luna o Marte, y el sistema solar en una época.

# text
seg-82708b06dcc6 = <b>Navegación en órbita terrestre baja</b>: señal, pasada y enlace, mensaje de navegación y una posición fusionada, etapa por etapa.

# text
seg-e21e9bb02d00 = <b>Campañas</b>: una misión encadenada, un barrido o un conjunto de Monte Carlo en un solo escenario.

# text
seg-ba5057da54e4 = <b>Informes, animación y exportaciones</b>: cada cifra con su unidad y su etiqueta; un dibujo animado de una ejecución; archivos SP3 (Standard Product { "3" }), mensajes de órbita CCSDS (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) y SigMF (Signal Metadata Format).

# attr:alt
seg-6b43a8c3031e = Un motor abierto en el centro, kshana { $version }, con un despacho tipado sobre { "75" } tipos; a su alrededor la línea de comandos, la biblioteca de Rust, Python, WebAssembly y Kshana Studio, el servidor MCP, la imagen de Docker y el complemento de JetBrains; debajo, Kshana Pro, una capa propietaria que depende del motor abierto y nunca lo bifurca

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = El mismo archivo de escenario da los mismos bytes en todas las superficies. MCP es el Model Context Protocol: <a1><c1/></a1> permite que un asistente de IA (inteligencia artificial) ejecute el motor.

# text
seg-f51b0a8cd30e = Seis artículos en arXiv se basan en el motor abierto, cada uno con el comando que hay detrás: <a1>arXiv:{ "2606.22054" }</a1> (la brecha de optimismo de los detectores de interferencia), <a2>arXiv:{ "2606.24210" }</a2> (un nivel de protección de temporización condicional), <a3>arXiv:{ "2607.05415" }</a3> (cuán estable es una puntuación de resiliencia de PNT), <a4>arXiv:{ "2607.02566" }</a4> (observabilidad de estaciones de superficie lunar con interferometría de base muy larga), <a5>arXiv:{ "2607.06212" }</a5> (geometría del polo sur lunar y balizas de superficie) y <a6>arXiv:{ "2610.23871" }</a6> (la navegación cislunar como problema de observabilidad: longitud de arco, condicionamiento del gramiano y la palanca Doppler). Véase <a7>Investigación</a7>.

# text
seg-dad7832bf2d2 = Todo el motor es libre bajo la AGPL-3.0. Kshana Pro, una capa propietaria que depende del motor abierto y nunca lo bifurca, y los estudios a medida están disponibles por contrato con Ashforde® OÜ: <a1>contact@ashforde.org</a1>. No hay precios; véase <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = Más información

# text
seg-0e8320f8ea91 = <b>El README completo</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

# text
seg-acba56f9ed36 = <b>Kshana Studio</b> (el motor en su navegador, como WebAssembly) → <a1>https://kshana.dev</a1>

# text
seg-13426521456e = <b>Capacidades</b> → <a1>docs/CAPABILITY.md</a1>

# text
seg-a42cfefa5e6d = <b>Validación y procedencia</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

# text
seg-07b9e03942cb = <b>Matriz de verificación</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

# text
seg-9390336ecc01 = <b>Cómo citar</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

# text
seg-d059e9fc67e1 = Software libre y de código abierto bajo la <b>GNU AGPL-3.0-only</b> (la Licencia Pública General de GNU Affero, solo versión { "3" }). Hay disponible una <b>licencia comercial</b> de <a1>Ashforde® OÜ</a1> (una sociedad privada de responsabilidad limitada estonia; OÜ = osaühing) para integración cerrada; véase <a2>LICENSING.md</a2>. Desarrollado y mantenido profesionalmente por Ashforde® OÜ.

# text
seg-4ae905aec2ab = <s1>Anterior</s1>API de Python

# text
seg-8af548581ae9 = <s1>Siguiente</s1>Crate de Rust
