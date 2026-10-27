# docs--jetbrains: translations (es)

# text
# c1: ide/jetbrains/README.md
seg-f8a0fe9968c4 = Fuente: <c1/>

# text
seg-c55e49fd2a72 = Kshana para los IDE de JetBrains

# text
seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> en JetBrains Marketplace</a1> — o, en cualquier IDE de JetBrains, <em>Settings → Plugins → Marketplace → buscar «Kshana»</em>.

# text
# c1: .toml
seg-959ab829762c = Un plugin nativo que ejecuta el simulador de resiliencia PNT <b>Kshana</b> desde cualquier IDE de JetBrains (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Haga clic con el botón derecho en un escenario <c1/> → <b>Run Kshana Scenario</b>; las figuras de mérito y el JSON de resultados se transmiten a la ventana de herramientas <b>Kshana</b>.

# text
seg-594199d2ce06 = Complementa el <a1>servidor MCP</a1> (que da acceso a Kshana al <em>AI Assistant</em> de JetBrains): este plugin es la vía <em>humana</em>, de apuntar y hacer clic.

# text
# c1: .toml
# c2: kshana <file>
seg-a356f2c30afb = Acción <b>Run Kshana Scenario</b> sobre cualquier <c1/> (menús contextuales del editor y de la vista de proyecto) — ejecuta <c2/> y muestra la salida en la ventana de herramientas de Kshana.

# text
# c1: receiver-trust
# c2: .toml
# c3: kshana receiver-trust
seg-116d04ae5538 = <b>Assess Receiver Trust</b> sobre un escenario <c1/> <c2/> (<c3/>): la cronología de confianza, con una puntuación de 0-100 y motivos para un buque. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.

# text
# c1: nmea-scenario
# c2: .toml
# c3: kshana nmea-scenario
seg-726d88d0dea7 = <b>Generate Training NMEA</b> sobre un <c1/> <c2/> (<c3/>): NMEA sintético de puente y un registro de instructor, escritos junto al escenario. Solo texto; para formación, nunca para los sistemas de navegación en vivo de un buque.

# text
# c1: .csv
seg-99510426a384 = <b>Build Interference Map</b> sobre un <c1/> de ADS-B o AIS (vista de proyecto; pregunta de qué conjunto de datos admitido se trata) y <b>Route Exposure</b> sobre un archivo de ruta (pregunta por la carpeta de mapas). Una celda degradada no identifica la interferencia como causa; no es una previsión.

# text
# c1: .toml
# c2: kshana bench-export
seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> sobre un escenario <c1/> (<c2/>): movimiento del vehículo, NMEA y eventos etiquetados para un simulador GNSS de laboratorio, escritos junto al escenario. No escribe ninguna señal; ejecute un simulador solo donde esté autorizado.

# text
# c1: .json
# c2: kshana compliance-report
# c3: kshana compliance-report --mapping
seg-79c553c303c5 = <b>Build Compliance Report</b> sobre un resultado de ejecución <c1/> (<c2/>) y <b>Tools → Show Compliance Mapping</b> (<c3/>): la correspondencia con el marco público, mostrada con la propia declaración del motor palabra por palabra.

# text
# c1: kshana evidence verify
# c2: .pub
seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> sobre una carpeta de paquete de evidencias (vista de proyecto; <c1/>): pide la clave pública del firmante ({ "64" } dígitos hexadecimales o un archivo <c2/>; siempre fijada, el plugin nunca acepta un firmante sin fijar) y, opcionalmente, el registro completo de la sesión. Solo un resultado verificado se lee como verificado; un paquete íntegro con un firmante sin fijar se lee «NOT VERIFIED».

# text
# c1: receiver-trust
# c2: .json
# c3: kshana trust-telemetry --result
seg-253d5b7f94ce = <b>Render Trust Telemetry</b> sobre un resultado <c1/> <c2/> (<c3/>): texto de Prometheus, eventos syslog CEF/LEEF o líneas MQTT de Home Assistant impresos en la ventana de Kshana. No se envía ni se sirve nada; los exportadores en ejecución siguen en la línea de comandos.

# text
# c1: .csv
# c2: kshana imu-fit
# c3: hybrid
# c4: fusion
# c5: [accel_classical]
seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> sobre un <c1/> de IMU estacionaria (<c2/>): los parámetros del acelerómetro y del giróscopo de los escenarios <c3/> y <c4/> ajustados mediante desviación de Allan, impresos en la ventana de Kshana como una tabla <c5/>. No se escribe nada; el ajuste es MODELLED.

# text
# c1: kshana --validate
# c2: kshana kinds
# c3: .toml
# c4: kshana receiver-trust live --file
seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (menú Tools; <c2/>) y <b>Assess Receiver Stream</b> (una sesión de buque <c3/> más un registro NMEA almacenado que usted elige; <c4/>, puntuado una sola vez, sin socket ni compuerta).

# text
# c1: kshana example
# c2: .toml
# c3: .toml
# c4: .geojson
seg-38037d36639c = <b>Insert Example Scenario</b> (carpeta de la vista de proyecto o menú Tools; <c1/>): elija un escenario incluido y se escribe como un nuevo <c2/> (nunca sobre un archivo existente). <b>Export Scenario</b> sobre un <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; solo salida simulada), <b>Animate Scenario</b> (HTML o SVG, abierto en el navegador) e <b>Import Route</b> sobre una ruta <c4/> (pregunta por el escenario).

# text
# c1: .toml
# c2: kshana receiver-trust evidence
# c3: kshana evidence keygen
# c4: kshana evidence attach-timestamp
# c5: openssl ts -verify
seg-1f1b18f8e102 = <b>Create Evidence Pack</b> sobre una sesión de confianza del receptor <c1/> (<c2/>): pide la ventana, un archivo de clave de firma que ya tenga y la carpeta de salida. El plugin nunca crea, lee ni almacena una clave (<c3/> sigue en la línea de comandos). <b>Attach Timestamp</b> sobre una carpeta de paquete (<c4/>): Kshana no comprueba la firma de la autoridad de sellado de tiempo; ejecute <c5/> usted mismo.

# text
# c1: evidence keygen
# c2: receiver-trust live
seg-f4f6605d3db9 = Siguen estando solo en la línea de comandos: los comandos de IQ, <c1/> y <c2/>.

# text
seg-63efd04104f1 = Una ventana de herramientas inferior de <b>Kshana</b> que aloja la consola de ejecución.

# text
# c1: kshana receiver-trust live
# c2: kshana trust-telemetry
# c3: docs/MARITIME-TRUST.md
seg-decda07aa7eb = No están en el plugin: <c1/> (un proceso de flujo de larga duración con una compuerta y un receptor de conexiones TCP opcional) y <c2/> siguen en la línea de comandos, porque una acción del IDE ejecuta un comando hasta su finalización y muestra su salida; véase <c3/>.

# text
# c1: kshana
# c2: PATH
# c3: cargo install kshana
seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> para apuntar al binario <c1/> (en blanco → se resuelve desde <c2/>; instálelo con <c3/>).

# text
seg-44dfdd65bd0a = El plugin es de plataforma pura (sin dependencias específicas de un lenguaje), por lo que se carga en todos los IDE de JetBrains de la compilación { "243" } ({ "2024.3" }) y posteriores.

# text
seg-453bd42c23fa = Compilar y ejecutar

# text
seg-b5328f8c7a8a = Requiere JDK { "17" }+ (la compilación fija JDK { "21" }) y el wrapper de Gradle incluido.

# text
# c1: verifyPlugin
# c2: TYPE:VERSION
seg-758124ceb1c7 = <c1/> comprueba por defecto la versión since-build, { "2024.3" }. Para comprobar otras líneas, enúncielas como <c2/> (cada IDE es una descarga de unos { "1" } GB):

# text
# c1: KshanaChooser
# c2: Messages.showChooseDialog
seg-15d175aaeb59 = El plugin no usa ninguna API de plataforma obsoleta ni prevista para su eliminación en ninguna de ellas; manténgase así (un cuadro de diálogo de elección pasa por <c1/>, no por <c2/>).

# text
seg-39cfd740d9b3 = Instale el zip compilado mediante <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

# text
seg-87aff08f344c = Estructura

# text
seg-73b3f55b7208 = Aislamiento

# text
# c1: mcp/
# c2: xval/
# c3: kshana
# c4: /ide
# c5: exclude
seg-a14db8de576a = Como <c1/> y <c2/>, es un proyecto Gradle independiente, excluido del crate <c3/> publicado (<c4/> en el <c5/> del paquete); su salida de compilación está en gitignore.

# text
# c1: LICENSING.md
seg-b38914a430b9 = Licencia: AGPL-3.0-only (o una licencia comercial de Ashforde OÜ — véase el <c1/> del repositorio).

# text
seg-bb286e3ce9c9 = <s1>Anterior</s1>Dónde se puede acceder a cada capacidad

# text
seg-e62586b5f58c = <s1>Siguiente</s1>Dónde se ejecuta Kshana
