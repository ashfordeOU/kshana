# docs--studio: translations (es)

# text
seg-c3c260b7063e = Pruebas

# text
# c1: web/README.md
seg-ca497f6e51d4 = Fuente: <c1/>

# text
seg-256705861db0 = El sitio kshana.dev

# text
# c1: web/
# c2: index.html
# c3: missions.html
# c4: capabilities.html
# c5: evidence.html
# c6: developers.html
# c7: editions.html
# c8: docs/
# c9: studio/
# c10: studio/index.html
# c11: studio/advanced/index.html
# c12: <base href="../">
seg-82b7ed4e70af = <c1/> es el árbol que GitHub Pages sirve como <a1>https://kshana.dev</a1>: las páginas (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), la documentación en <c8/> y Kshana Studio en <c9/> (servido en <a2>https://kshana.dev/studio/</a2>), la aplicación que ejecuta el motor en el navegador como WebAssembly (WASM), sin cálculo en el servidor y sin subir nada. Studio tiene dos vistas de un mismo motor: la vista Simple (<c10/>, la respuesta primero y con palabras llanas) y la vista Avanzada (<c11/>, el panel completo), que comparte con la vista Simple su motor, su worker, sus módulos y sus datos mediante <c12/>.

# text
# c1: <base href="../">
seg-2b76ce9ee32c = Desde la { "0.35.0" }, Studio tiene cuatro vistas más, cada una en su propia página con <c1/>, sin indexación por buscadores y con una carpeta de muestras sintéticas que lee su prueba:

# text
# c1: studio/trust/
# c2: trust/demo/
seg-e3d0762bb726 = <c1/>: la vista marítima de confianza, una puntuación de confianza del receptor para el flujo de posiciones de un buque, con una trayectoria de demostración en <c2/>.

# text
# c1: studio/training/
# c2: training/demo/
seg-e608cdeac977 = <c1/>: el análisis posterior de formación de tripulaciones, que reproduce NMEA sintético con un evento de jamming, de arrastre, de spoofing de tiempo o de repetición (<c2/>).

# text
# c1: studio/interference/
# c2: interference/demo/
seg-f2ce6a93a58d = <c1/>: el mapa de interferencias y la exposición de la ruta (<c2/>).

# text
# c1: studio/tools/
# c2: tools/examples/
# c3: tools/samples/
# c4: #evidence
# c5: #bench
# c6: #compliance
# c7: #osnma
# c8: #ai
seg-3f6cf51eb439 = <c1/>: una página de tarjetas de herramientas con ejemplos (<c2/>, <c3/>), entre ellas paquetes de evidencias firmados (<c4/>), la exportación para test bench (<c5/>), la correspondencia de compliance (<c6/>), la verificación de OSNMA de Galileo (<c7/>) y los canales del asistente de IA (<c8/>).

# text
seg-fb02aba9149f = De dónde proceden los archivos

# text
seg-a58fb92bab82 = Aquí hay tres tipos de archivos, y se modifican de tres maneras distintas.

# text
# c1: docs/
# c2: css/
# c3: js/
# c4: assets/
# c5: data/
# c6: land.json
# c7: search.json
# c8: series.json
# c9: studio/
# c10: web/tools/port_site.py
# c11: PORT-MANIFEST.json
# c12: site.test.mjs
seg-d404d216114c = <b>Archivos portados.</b> Las páginas, <c1/>, <c2/>, <c3/>, <c4/>, los datos del sitio en <c5/> (<c6/>, <c7/>, <c8/>) y todo lo que hay en <c9/> los escribe <c10/> a partir de una compilación del sitio y del código fuente de Studio. <c11/> enumera cada uno con su suma de comprobación SHA-256 (Algoritmo de Hash Seguro, 256 bits). <b>No los edite aquí</b>: <c12/> falla ante una edición manual. Cambie la fuente y vuelva a ejecutar el port:

# text
# c1: --check
# c2: web/
# c3: robots.txt
# c4: sitemap.xml
# c5: llms.txt
# c6: llms-full.txt
# c7: legacy-redirects.js
# c8: 404.html
# c9: playground/index.html
# c10: /studio/
seg-b681e66130e5 = El port es determinista: una segunda ejecución no escribe nada, y <c1/> termina con código { "1" } si <c2/> no es lo que escribiría el port. Traslada sin cambios los archivos de rastreo de la compilación del sitio (las etiquetas canonical, de tarjeta social y de schema.org de cada página, <c3/>, <c4/>, <c5/>, <c6/>), los comprueba, escribe <c7/>, <c8/> y la página de reenvío en la antigua dirección de Studio (<c9/>, hacia <c10/>), y hace que cada página apunte a las fuentes y bibliotecas de scripts locales (más abajo).

# text
# c1: web/
seg-9be72ec8d40e = <b>Archivos que posee <c1/>.</b> Son fuentes por derecho propio y el port nunca los toca:

# text
# c1: capabilities.json
seg-23b6ea71fede = <c1/> es la fuente estructurada de las tarjetas de capacidades y de la cuadrícula de normas. <b>Edite eso, no el HTML.</b>

# text
# c1: data/verification-matrix.json
# c2: cargo run --bin gen_validation_artifacts
# c3: tests/verification_artifacts_doc_sync.rs
# c4: data/card-matrix-map.json
# c5: data/oracle-references.json
# c6: data/standards-matrix-map.json
# c7: studio/data/
seg-e1ee8cd0af21 = <c1/> se genera (<c2/>) y lo fija <c3/>; no lo edite a mano. <c4/>, <c5/> y <c6/> son correspondencias mantenidas a mano que la misma prueba comprueba frente a la matriz generada. Las copias de Studio en <c7/> son estos archivos, byte a byte.

# text
# c1: og-card.svg
# c2: og-card.png
# c3: og-card.rendered-from.json
# c4: python3 tools/gen_og_card.py
seg-8901229c76ba = <c1/>, <c2/> y <c3/> son la tarjeta social (<c4/>).

# text
# c1: fonts/
# c2: vendor/
# c3: tools/fetch_third_party.py
seg-89d78af0258c = <c1/> y <c2/>: los archivos de fuentes y la biblioteca de scripts que usan las páginas, descargados una vez por <c3/> y confirmados en el repositorio (véase «Sin solicitudes a terceros»).

# text
# c1: build.sh
# c2: smoke.mjs
# c3: site.test.mjs
# c4: legacy-urls.test.mjs
# c5: tools/
seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> y <c5/>.

# text
# c1: build.sh
# c2: pkg/
# c3: wasm-pack
# c4: studio/pkg/
# c5: scenarios/
seg-5071806d230f = <b>Salidas de la compilación</b>, excluidas de git y producidas por <c1/>: <c2/> (el paquete de <c3/>, que es también de lo que se construye el paquete npm), <c4/> (el mismo paquete donde Studio lo importa) y <c5/> (cada escenario de referencia, en la dirección desde la que los servía el sitio anterior de una sola página).

# text
seg-5042f55f78b5 = Compilar y servir en local

# text
# c1: KSHANA_WASM_PKG=<a built pkg folder> ./web/build.sh
seg-f393a52f7794 = Sin la cadena de herramientas WASM, <c1/> prepara un paquete existente en lugar de compilar uno. El flujo de trabajo de Pages nunca lo usa.

# text
# c1: studio/lib/
# c2: *.test.mjs
# c3: studio/app.js
# c4: studio/advanced.js
# c5: web/
seg-35094cb7ed04 = Cada módulo de <c1/> es lógica pura con su <c2/> correspondiente; los controladores del DOM (Document Object Model, el árbol de elementos de la página) de Studio son <c3/> (la vista Simple) y <c4/> (la vista Avanzada). La integración continua ejecuta cada uno de ellos como un paso propio y falla si un archivo de prueba de <c5/> no tiene paso.

# text
seg-ba24be498f87 = Sin solicitudes a terceros

# text
seg-7215806f98d4 = kshana.dev sirve sus propias fuentes, estilos y scripts. Una página no hace ninguna solicitud a un servidor de fuentes ni de scripts, de modo que no se entrega a ninguno la dirección de un visitante.

# text
# c1: fonts/
# c2: @font-face
# c3: vendor/
# c4: fonts/FONTS.json
# c5: vendor/VENDOR.json
# c6: fonts/OFL-*.txt
# c7: vendor/three@…/LICENSE
seg-30fc8da50592 = El sitio y Studio están escritos para Google Fonts y un servidor de scripts. El port sustituye el enlace a Google Fonts de cada página por la hoja de estilos equivalente en <c1/> (las mismas reglas <c2/> y los mismos archivos de fuentes, todos los subconjuntos, de modo que el texto se muestra como antes) y cada dirección del servidor de scripts por el archivo de <c3/>. <c4/> y <c5/> registran de dónde procede cada archivo y su suma de comprobación; las fuentes están bajo la SIL Open Font License (<c6/>) y three.js bajo la licencia MIT (<c7/>).

# text
# c1: tools/fetch_third_party.py --from <site folder> --from <Studio folder>
# c2: site.test.mjs
seg-68a02a54db3b = <c1/> es el único paso que usa la red. Vuelva a ejecutarlo solo cuando una página pida un conjunto de fuentes o una versión de biblioteca que no esté aquí: el port se niega y lo indica. <c2/> falla si alguna página, hoja de estilos o script portados nombran un servidor de fuentes o cargan algo de otro servidor.

# text
seg-4ff8a4accad4 = La página { "404" }

# text
# c1: /404.html
seg-763503746a48 = GitHub Pages responde a una dirección inexistente con <c1/> y el estado { "404" }. El port crea esa página a partir de la propia estructura de la página de inicio (navegación, pie, búsqueda) alrededor de un mensaje breve con enlaces a Inicio, Documentación y Studio. Cada dirección que contiene se escribe desde la raíz del sitio, porque se sirve a cualquier profundidad.

# text
seg-9126631f595b = Direcciones antiguas

# text
# c1: /
# c2: /#playground
# c3: /#ledger
# c4: /#s=…
# c5: /?embed=1&…
# c6: tab=fom
# c7: tools/legacy-urls.json
# c8: legacy-redirects.js
seg-a64ed190233a = Hasta la { "v0.28.0" }, el sitio era una sola página y todo vivía tras un fragmento en <c1/> (<c2/>, <c3/>, enlaces para compartir como <c4/>, incrustaciones como <c5/>; el nombre antiguo de una pestaña en un enlace de incrustación, como <c6/>, abre la pestaña de Studio que la sustituyó). <c7/> enumera cada una de esas direcciones que usa el material publicado y a dónde llega ahora; la página de inicio carga <c8/>, generado a partir de esa lista, para enviarlas allí. Añada un caso a la lista antes de retirar cualquier dirección.

# text
seg-a9db9b0675e2 = Despliegue

# text
# c1: pages
# c2: main
# c3: release.yml
# c4: build.sh
# c5: web/
# c6: tools/
seg-0316a3f12053 = El flujo de trabajo de GitHub Actions <c1/> despliega una etiqueta de versión, no <c2/>: <c3/> lo lanza cuando se publica una versión, y un lanzamiento manual vuelve a desplegar una etiqueta indicada. Ejecuta <c4/>, prepara <c5/> sin las pruebas, el script de compilación, <c6/>, el manifiesto ni este archivo, y publica el resultado en GitHub Pages.

# text
seg-6aa2e78078ae = <s1>Anterior</s1>Glosario

# text
seg-419353a4fb30 = <s1>Siguiente</s1>Tutoriales
