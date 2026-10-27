# docs--mcp-http: translations (es)

# text
# c1: docs/deploy/mcp-http.md
seg-c8bab9114d57 = Fuente: <c1/>

# text
seg-4bd138b7d28a = Ejecución de kshana-mcp por HTTP (autoalojado)

# text
seg-7ca89d6e0201 = Aquí se omite un pasaje que nombra clientes de IA de terceros; está en <a1>docs/deploy/mcp-http.md</a1> en GitHub.

# text
# c1: kshana
seg-2f5b3bdb7d0b = <b>Kshana no aloja ningún endpoint.</b> No existe un servidor <c1/> compartido al que apuntar un cliente. Usted lo ejecuta en su propia máquina, contenedor o proyecto en la nube, y es responsable de su control de acceso y de su coste. El servidor { $version } es el de este repositorio: sus cifras llevan sus etiquetas VALIDATED o MODELLED exactamente igual que por stdio.

# text
seg-113a79ece785 = Los valores por defecto seguros

# text
seg-2bdbe06123c8 = Control

# text
seg-640f28207e8a = Comportamiento

# text
seg-9bc8fe53a948 = Dirección de enlace

# text
# c1: 127.0.0.1
# c2: ::1
# c3: --http 8080
# c4: 127.0.0.1:8080
seg-82001913f285 = Solo bucle local (<c1/>, <c2/>). Un puerto solo (<c3/>) significa <c4/>.

# text
# c1: --allow-remote
# c2: KSHANA_MCP_HTTP_TOKEN
seg-f2adda2d3e22 = Necesita <c1/> <b>y</b> un token de portador en la variable de entorno <c2/> ({ "16" } caracteres o más). Sin ambos, el servidor se niega a arrancar. Con ambos, imprime una advertencia de que está escuchando más allá de esta máquina.

# text
seg-6fbe07565c36 = Autenticación

# text
# c1: Authorization: Bearer <token>
# c2: 401
seg-d5cbeb0cd3d6 = <c1/> en cada petición cuando se ha fijado un token (también puede fijarse en el bucle local). Se compara en tiempo constante. Ausente o erróneo: <c2/>.

# text
seg-1962f434458b = Sistema de archivos

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-1a9e048d348d = Ninguno. Las herramientas de archivos IQ (<c1/>) están desactivadas en modo HTTP diga lo que diga <c2/>; todas las demás herramientas reciben su escenario en línea y rechazan uno que nombre un archivo. Ningún argumento de herramienta lee ni escribe una ruta.

# text
seg-19261cdd2ef0 = Tamaño del cuerpo

# text
# c1: --max-body-bytes
# c2: 413
seg-c4db8c1454f4 = <c1/>, por defecto { "5" } MiB (el tope de escenario es { "4" } MiB). Por encima: <c2/>, tanto si se declara la longitud como si el cuerpo se envía por fragmentos.

# text
seg-da9103d627dd = Tiempo de respuesta

# text
# c1: --request-timeout-secs
# c2: 408
# c3: 408
seg-3f013a632773 = <c1/>, por defecto { "120" }. Por encima: <c2/>. <b>Esto acota cuánto espera quien llama, no el trabajo</b>: una ejecución ya en curso no puede detenerse, de modo que continúa tras el <c3/> y termina en segundo plano.

# text
seg-a588b12596b7 = Concurrencia

# text
# c1: --max-concurrent
# c2: 503
# c3: Retry-After
seg-aa2214db3bdc = <c1/>, por defecto { "8" }. Más allá, una petición recibe <c2/> con <c3/> de inmediato; ninguna se pone en cola.

# text
seg-87576ded5272 = Reserva de trabajo

# text
# c1: --max-concurrent
seg-7f9c63e3e5e6 = Cada llamada a una herramienta se ejecuta en un hilo bloqueante dentro de una reserva de <c1/> plazas, nunca en los trabajadores asíncronos, de modo que una ejecución larga no puede impedir que el servidor responda. Una plaza se libera solo cuando termina la propia ejecución, no cuando quien llama desiste: por tanto, las ejecuciones abandonadas no pueden acumularse más allá del tamaño de la reserva, y una llamada que encuentra la reserva llena se rechaza por ocupación.

# text
seg-4a97b035483c = Presupuesto de trabajo

# text
# c1: runs
# c2: kshana
seg-91c788b33b25 = Un escenario que pide mucho más que los ejemplos incluidos se rechaza antes de ejecutarse: más de { "1000" } realizaciones Monte Carlo (<c1/>), una malla de parámetros de más de { "1000" } nodos, más de { "5000" } ejecuciones miembro (nodos de la malla por realizaciones) o una malla temporal de más de { "2" } millones de épocas. El error nombra el campo que hay que reducir. El mismo presupuesto se aplica por stdio; la línea de comandos <c2/> no tiene ninguno.

# text
seg-79c6b146637c = CORS

# text
# c1: Access-Control-*
# c2: Origin
# c3: 403
# c4: --allow-origin <scheme://host[:port]>
# c5: *
seg-68fa7d9f1321 = Nunca se envía ninguna cabecera <c1/>. Una petición que lleve una cabecera <c2/> se rechaza (<c3/>) salvo que se nombre con <c4/>; <c5/> no se acepta.

# text
seg-d7f157fdf003 = Cabecera Host

# text
# c1: --allowed-host
# c2: --allowed-host your.domain
# c3: 403
seg-d7966e93ef1a = Se comprueba frente a los nombres de bucle local, o a la dirección de enlace más cada <c1/>. Detrás de un proxy o en la URL de una plataforma, pase <c2/>. Cualquier otro caso: <c3/>.

# text
seg-12d5cf72f363 = Sesiones

# text
seg-58dfe5665877 = Ninguna. Cada POST recibe una respuesta JSON; no se mantiene ninguna tabla de sesiones ni ningún flujo de eventos enviados por el servidor abierto.

# text
# c1: kshana-mcp
seg-adbc92ebc196 = <c1/> no termina TLS. Cuando sea accesible más allá de una sola máquina, ponga HTTPS por delante (el TLS de su plataforma o un proxy inverso) y mantenga secreto el token; un token de portador sobre HTTP plano puede leerse en la red.

# text
seg-1b21740b9c63 = Local

# text
seg-a6194f5a52f8 = Configuración del cliente (un cliente por URL; añada la cabecera solo cuando se haya fijado un token):

# text
seg-a683980168f7 = Docker

# text
# c1: 0.0.0.0
# c2: --allow-remote
# c3: 127.0.0.1:8080:8080
# c4: 127.0.0.1:
# c5: docker compose
# c6: mcp-http/
seg-81df4f5cd02e = Dentro del contenedor el servidor debe escuchar en <c1/>, de modo que necesita <c2/> y el token. Publicar el puerto como <c3/> lo mantiene en su máquina; quite el <c4/> solo cuando quiera exponerlo y entonces termine TLS por delante. Las plantillas de <c5/>, Fly.io y Cloud Run están en <a1><c6/></a1>.

# text
seg-8b8bef7174e8 = Plantillas (las despliega usted; Kshana no ejecuta ninguna)

# text
# c1: mcp-http/fly.toml
# c2: fly secrets set KSHANA_MCP_HTTP_TOKEN=...
seg-198bea1e0595 = <a1><c1/></a1>: fije el token con <c2/>

# text
# c1: mcp-http/cloudrun.service.yaml
seg-c33701cb9ca2 = <a1><c1/></a1>: tome el token de Secret Manager

# text
# c1: --allowed-host
seg-b86ddb72b916 = Cada una ejecuta la imagen publicada, fija <c1/> al nombre de host de la plataforma que usted sustituye en el archivo y se apoya en la plataforma para HTTPS.

# text
seg-ce3a5326cb95 = Fije un límite de CPU y de memoria en la plataforma

# text
# c1: cpus
# c2: mem_limit
# c3: [[vm]]
# c4: resources.limits
# c5: --max-concurrent
seg-e1fc13672597 = El tiempo de espera, la reserva y el presupuesto acotan cuánto trabajo se admite, pero una llamada admitida aún puede usar un núcleo durante mucho tiempo y un resultado grande puede usar cientos de megabytes. Ponga también un límite estricto al contenedor: las plantillas piden { "2" } CPU y { "1" } GiB (<c1/> y <c2/> en Compose, <c3/> en Fly, <c4/> en Cloud Run). Mantenga <c5/> en el número de CPU o por debajo.

# text
seg-058781b052c4 = Lo que no es

# text
seg-90edc7ff2a55 = No es un servicio multiinquilino. Cualquiera que tenga el token ejecuta simulaciones en su hardware; no hay cuotas por usuario más allá de los límites anteriores.

# text
seg-5b3b9c610f31 = Consultivo, no un equipo de navegación homologado: el operador sigue siendo responsable de la navegación. Los resultados del simulador son cifras modeladas o validadas para análisis, como en el resto de Kshana.

# text
seg-c33947d44b06 = <s1>Anterior</s1>Servidor MCP: todos los canales de instalación

# text
seg-a9d67efe493a = <s1>Siguiente</s1>Uso de Kshana desde un agente
