# docs--rust: translations (es)

# text
seg-d4a762001549 = Licencia

# text
seg-4dbf41c0ec3b = Función

# attr:alt
seg-81a87d14efda = Kshana: la marca, una retícula de brújula que señala el instante preciso, junto al logotipo tipográfico kshana

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
seg-d1a3f78ad8e0 = Pruébelo primero sin instalar nada: <a1>Kshana Studio</a1> ejecuta todo el motor en su navegador, compilado a WebAssembly, y no sube nada.

# text
seg-2d2c47db0c1f = <b>{ "176" } de { "388" }</b> capacidades validadas frente a referencias independientes externas; { "208" } etiquetadas con honestidad como modeladas, { "4" } propiedad de un socio. Cada capacidad lleva una etiqueta en un registro comprobado por máquina: VALIDATED (concuerda una referencia independiente externa: datos reales, una implementación independiente o vectores de referencia publicados), MODELLED (internamente coherente, y declarado en voz alta) o PARTNER (la posee un socio de hardware). Entre las comprobaciones: los { "666" } vectores SGP4 (Simplified General Perturbations { "4" }) de AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 hasta { "4.12" } mm, y el modelo de fuerzas de Cowell hasta { "0.08" } m frente a Orekit { "12.2" }.

# attr:alt
seg-44f7862c45a2 = Cómo gana una capacidad su etiqueta: capacidad, referencia independiente, prueba, etiqueta del registro. El estado de verificación de las { "388" } capacidades: { "176" } validadas, { "208" } modeladas, { "4" } propiedad de un socio

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
seg-8c83544270b5 = Firma

# text
# c1: README.crates.md
seg-8a438548bf52 = Fuente: <c1/>

# text
# c1: kshana
seg-9a65e21abcf4 = Kshana reproduce jamming, spoofing y holdover de reloj cuando fallan las señales GNSS (Sistema Global de Navegación por Satélite), y le dice durante cuánto tiempo un sistema mantiene la hora y la posición dentro de su presupuesto, y qué reloj o sensor aporta más margen. Este es el crate de Rust: el motor como biblioteca y el comando <c1/>. Cada ejecución es reproducible bit a bit a partir del escenario, la semilla y la versión del motor.

# text
seg-991c428a8063 = Uso: biblioteca

# text
# c1: src/main.rs
# c2: cargo new
# c3: cargo add kshana
seg-6ef0d3fb5be0 = El ejemplo es un programa completo: lleva su propio escenario, escrito en TOML (Tom's Obvious, Minimal Language), de modo que se ejecuta como <c1/> de un proyecto <c2/> nuevo tras <c3/>, sin nada más en disco.

# text
# c1: out.json
# c2: out.svg
# c3: out.csv
seg-cfb76f7da8da = <c1/> es el documento de resultado en JSON (JavaScript Object Notation), <c2/> el gráfico en SVG (Scalable Vector Graphics) y <c3/>, para los tipos de escenario que publican una tabla, esa tabla en CSV (valores separados por comas).

# text
seg-95b7a8022262 = Referencia de la API, generada a partir de src/api.rs

# text
# c1: kshana::api
seg-e271e742cec7 = Cada función pública de <c1/> en el motor v{ $version }, leída del código fuente en el momento de la compilación.

# text
seg-9a8d288b2c57 = json con su bloque final figure_tiers retirado, byte a byte como era el documento antes de que ese bloque existiera; None cuando el documento no tiene tal bloque o tiene uno que no es su última clave (lo cual este crate nunca emite, de modo que un arnés debe tratarlo como un fallo en lugar de retirar algo que no puede explicar).

# text
seg-6157f407ab8b = Enumera todos los tipos de escenario integrados con sus metadatos.

# text
seg-e9535491e871 = Los tipos de escenario integrados y sus metadatos como una matriz JSON: la forma que exponen los bindings de lenguaje para la introspección programática.

# text
seg-a3e3eeb83c46 = [KIND_MODULES] como un objeto JSON, de tipo de escenario a matriz de nombres de módulo, en el orden de la tabla.

# text
seg-6739ddf8bba8 = [HEADLINE_FIELDS] como JSON: { "{" }kind: { "{" }"headline": [path, ...]{ "}" }{ "}" }, en el orden de la tabla.

# text
seg-f76170c699d9 = Genera el catálogo de tipos de escenario integrados como una referencia Markdown independiente (docs/SCENARIOS.md): cada tipo de escenario despachable con su descripción de una línea y sus campos TOML obligatorios y opcionales.

# text
seg-295c8355634f = Analiza un TOML de escenario con la propia introspección del crate y devuelve una lista de problemas, de modo que se pueda avisar a quien llama de lo que está mal ANTES de una ejecución (posiblemente larga), en lugar de toparse con un fallo tardío en tiempo de ejecución.

# text
seg-4aab02ecf399 = Exporta la constelación propagada de un escenario de órbita/constelación como texto SP3-c.

# text
seg-d577fc8351a2 = Si src es un escenario de órbita con export_sp3 = true, devuelve su texto SP3-c; en caso contrario, None.

# text
seg-024e29ac4bde = Exporta los elementos medios TLE de un escenario de órbita como un catálogo OMM de CCSDS: un OMM (Orbit Mean-Elements Message) por satélite definido por TLE, en forma KVN, con el número de catálogo NORAD real, el designador COSPAR y la época de cada TLE.

# text
seg-d5dc817a3a24 = Si src es un escenario de órbita con export_omm = true, devuelve el texto de su catálogo OMM; en caso contrario, None.

# text
seg-3fe91ee29ac1 = Exporta la constelación propagada de un escenario de órbita como texto OEM de CCSDS: la serie temporal de estados inerciales (TEME), posición Y velocidad, en el formato de intercambio de efemérides de naves que leen las herramientas de dinámica de vuelo (GMAT/Orekit/STK).

# text
seg-f102088f3208 = Si src es un escenario de órbita con export_oem = true, devuelve su texto OEM; en caso contrario, None.

# text
seg-5432a3921600 = Incrusta un cuerpo real de IERS finals2000A en el campo eop_finals2000a de un escenario (la ruta de la CLI --eop <file>) y devuelve el TOML combinado.

# text
seg-dc707c3d1769 = Inserta un bloque de metadatos de estudio en un documento JSON de resultado ya renderizado y devuelve el documento con una clave «meta» de nivel superior insertada justo después de la llave de apertura.

# text
seg-afa952d0c0f5 = Ejecuta un escenario y devuelve un resultado tipado con un error estructurado: el punto de entrada que deberían preferir quienes llaman desde bindings frente al [run_toml] con error de cadena.

# text
seg-d0a609bfd225 = Analiza, despacha y ejecuta un escenario dado como cadena TOML.

# text
seg-c62cff9a8dba = [run_toml] sin el bloque figure_tiers por tipo de escenario que añade [run_toml_inner] (RM-04): para una ejecución cuyo documento está incrustado en el resultado de otro tipo de escenario (un miembro de una campaña), de modo que el documento exterior conserve sus bytes.

# text
seg-5a316ab76a7d = json con block añadido como su última clave, figure_tiers, byte a byte como lo habría serializado el envoltorio Documented: impresión con sangría de dos espacios, con el bloque anidado un nivel hacia dentro.

# text
# c1: kshana::ccsds_tdm
# c2: kshana::interchange
seg-ef3b369866c5 = Formatos de intercambio del crate: analizador y escritor del Tracking Data Message (TDM) de CCSDS (<c1/>); Kshana Interchange Format (KIF) (<c2/>).

# text
seg-36184e41b65d = Uso: CLI

# text
# c1: scenarios/
# c2: kshana example
seg-c96267c06c3b = Una instalación desde el registro no tiene directorio <c1/>, de modo que la CLI lleva consigo los escenarios de referencia; <c2/> los enumera y nombra los pocos que deja fuera con el motivo (cada uno lee solo datos que se distribuyen con el repositorio, o sigue un preajuste que una versión puede retener).

# text
# c1: kind
# c2: <scenario>.result.json
# c3: .chart.svg
# c4: .report.html
# c5: .report.json
# c6: .table.csv
# c7: --export
# c8: spectrum
# c9: --animate
seg-35965c7df95f = Una ejecución se despacha según el <c1/> del escenario y escribe <c2/>, <c3/>, <c4/> (una página de informe imprimible en HTML, HyperText Markup Language) y <c5/> (el mismo informe, legible por máquina), además de <c6/> para los tipos de escenario que publican una tabla, junto al archivo de escenario. <c7/> añade archivos de intercambio: CZML (Cesium Language) y KML (Keyhole Markup Language) para visores de globo, GeoJSON para mapas, archivos de efemérides STK (Systems Tool Kit) y grabaciones SigMF (Signal Metadata Format) para el tipo de escenario <c8/>. <c9/> añade una animación SVG, HTML o fotograma a fotograma.

# text
# c1: scenarios/
# c2: kshana --study scenarios/quantum-pnt-demonstrator.suite.toml
# c3: lunar-llr-datum
seg-fc13b487ccc5 = Desde un clon del repositorio, los mismos comandos toman directamente los archivos de <c1/>, incluido el estudio de varios escenarios (<c2/>) y <c3/>, el único escenario que lee datos reales de telemetría láser que se distribuyen solo con el repositorio.

# text
# c1: receiver_trust
# c2: receiver_trust::live
seg-509e49e5df09 = <b>Confianza GNSS de embarcación</b> (<c1/>, incluido <c2/>): una puntuación de 0 a 100 con motivos a partir del NMEA de un receptor, en vivo o desde un registro; de carácter consultivo, no un equipo de navegación homologado.

# text
# c1: evidence
seg-0489fa168736 = <b>Paquetes de evidencias</b> (<c1/>): un registro técnico firmado de una ventana de registro, verificable sin conexión.

# text
# c1: telemetry
seg-aa4a7de921a3 = <b>Telemetría de confianza</b> (<c1/>): el flujo de confianza como métricas de Prometheus, eventos SIEM y OpenTelemetry opcional.

# text
# c1: nmea_synth
seg-d2ecb7047abe = <b>Flujos de formación</b> (<c1/>): NMEA sintético de puente con jamming y spoofing programados y un registro del instructor. Solo texto; nunca para los sistemas de navegación en vivo de una embarcación.

# text
# c1: interference_map
seg-e16769b8fab8 = <b>Mapa de interferencia</b> (<c1/>): mapas agregados de navegación degradada y exposición de rutas.

# text
# c1: interop::testbench
# c2: compliance
seg-1944d0fada06 = <b>Test bench y correspondencia de compliance</b> (<c1/>, <c2/>): el movimiento del vehículo y los eventos de un escenario para un simulador GNSS de laboratorio, y la correspondencia con el marco público rellenada a partir de documentos de resultados.

# text
# c1: iq
seg-68274ce67506 = <b>Laboratorio IQ GNSS</b> (<c1/>): escenas, adquisición, seguimiento, monitores y campañas sobre IQ grabado y sintético.

# text
seg-6dc7d52fef11 = <s1>Anterior</s1>npm y WebAssembly

# text
seg-8ff56af64ec2 = <s1>Siguiente</s1>Servidor MCP
