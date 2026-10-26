# docs--deployment-targets: translations (es)

# text
seg-9c1e7fd8f838 = Cómo

# text
seg-5ad814c7ef9e = Notas

# attr:aria-label, text
seg-9d3ee6a5613e = Ejecuciones

# text
seg-3dc7d08f5729 = Python { "3.9" } o posterior

# text
# c1: kshana
# c2: --features python
seg-b1f1009faa44 = el wheel de <c1/> en PyPI (<c2/>)

# text
seg-45b4e1bd8b18 = wheels para Linux, macOS y Windows, x86-64 y ARM de 64 bits

# text
seg-79f04380d254 = Clientes MCP (agentes de IA)

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
seg-4163955ed77a = el servidor <c1/>: <c2/>, o la imagen de contenedor

# text
seg-c5a32580b7bc = imagen para linux/amd64 y linux/arm64

# text
seg-ec575e06d439 = Navegadores y entornos de ejecución de JavaScript

# text
# c1: --features wasm
seg-a8238abc55bd = el paquete WebAssembly en npm (<c1/>)

# text
seg-c7789c7f4429 = el mismo motor, compilado a WebAssembly

# text
seg-488c2b62d246 = Un pequeño ordenador a bordo de una embarcación, junto al receptor

# text
# c1: deploy/reference-build/
# c2: kshana receiver-trust live
seg-69a58e13b706 = la compilación de referencia en <c1/>: <c2/> con la compuerta, que publica en Signal K y, por activación voluntaria, en OpenCPN

# text
# c1: MARINE-INTEGRATIONS.md
seg-df530583c13c = de carácter consultivo, no un equipo de navegación homologado; el proyecto no lo ha probado en ninguna embarcación; véase <a1><c1/></a1>

# text
seg-cf83dbb55f99 = Servidores Signal K

# text
# c1: integrations/signalk/
seg-88ddbefb95dd = el complemento en <c1/>

# text
seg-5f436c952149 = se entrega y se somete a pruebas unitarias sobre salidas sintéticas grabadas; no está publicado en npm

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-026115eafe9b = NMEA { "0183" } en modo de compuerta por TCP desde el monitor

# text
# c1: MARINE-INTEGRATIONS.md
seg-8e101a661cbc = activación voluntaria; véase <a1><c1/></a1>

# text
seg-cea294c412f0 = Ordenadores de carga útil de clase Linux

# text
seg-bf74da1c1262 = el crate de Rust o el binario, compilado de forma cruzada

# text
seg-868f121e5909 = Ordenadores de carga útil de clase OPS-SAT y similares

# text
seg-53c8be810679 = Nodos de borde con GPU, NPU o FPGA junto a una CPU Linux

# text
seg-70b2c22bf453 = en la CPU Linux

# text
seg-977842cb0f86 = Kshana no usa ninguno de los aceleradores; se ejecuta junto a ellos

# text
seg-3e15446b6efb = No se ejecuta

# text
# c1: std
# c2: no_std
seg-205144220741 = <b>Un MCU de vuelo sin sistema operativo o un RTOS pequeño sin la biblioteca estándar de Rust.</b> Kshana es en todo momento un crate <c1/>: reserva memoria en el montón, lee archivos, da formato a JSON y usa las funciones de coma flotante de la biblioteca estándar. No existe ninguna compilación <c2/> ni ninguna función que genere una.

# text
# c1: no_std
seg-46ccad7b96e8 = <b>Decisión: no ofrecemos un núcleo de vuelo <c1/>.</b> Construir uno sería un producto aparte, con su propia carga de verificación, y llevaría a Kshana al software de vuelo, donde la cualificación es un programa en sí mismo y para el que no tenemos ninguna vía.

# text
seg-63bc696bc66a = Qué hacer en su lugar

# text
# c1: slot-timing
seg-07fff123aed3 = <b>Ejecute Kshana en tierra o en un ordenador de carga útil y suba sus resultados.</b> El tipo de escenario <c1/> produce exactamente los números que necesita un ordenador de vuelo: una cadencia de soluciones, un instante de incumplimiento del umbral, una guarda. Una tabla con ellos ocupa unos pocos bytes.

# text
# c1: SLOT-TIMING.md
seg-c2752c281cd3 = <b>Porte una forma cerrada, si basta con una.</b> La inversión de holdover es una búsqueda de raíz monótona y breve sobre una varianza polinómica, documentada con sus ecuaciones en <a1><c1/></a1>. Reimplementarla en código de vuelo es sencillo; el código derivado de Kshana sigue bajo la licencia de Kshana.

# text
seg-b484e9426ab0 = También fuera del alcance

# text
seg-7bcd90c9ef31 = Garantías de tiempo real estricto (Kshana reserva memoria y no afirma nada sobre el tiempo de ejecución en el peor caso); la cualificación de vuelo de cualquier cosa; y un protocolo de sincronización, un controlador o una pila de enrutamiento. Kshana aporta la evidencia de temporización frente a la que se diseñan esos sistemas. No es uno de ellos.

# text
seg-542e51fbb35a = <s1>Anterior</s1>Complemento de JetBrains

# text
seg-52a455f4c409 = <s1>Siguiente</s1>Arquitectura
