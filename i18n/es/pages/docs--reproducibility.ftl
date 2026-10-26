# docs--reproducibility: translations (es)

# text
seg-03cb5fb3dd8f = Sí

# text
seg-a7d5633dbcc0 = Reproducibilidad y procedencia

# text
# c1: docs/REPRODUCIBILITY.md
seg-ab939e90efad = Fuente: <c1/>

# text
seg-1c48a3edda84 = Kshana está construido para ser reproducible: las mismas entradas producen los mismos resultados, y los artefactos de compilación pueden rastrearse hasta la fuente que los produjo. Este documento establece con exactitud qué se garantiza, qué no y cómo se hacen cumplir las garantías.

# text
seg-95b0eba44abe = Garantías de determinismo

# text
# c1: ChaCha8Rng
# c2: seed
seg-1f637144697d = El motor no tiene reloj de pared, ni dependencia del hilo de ejecución, ni aleatoriedad sin semilla. Todo proceso estocástico se conduce con un flujo <c1/> con clave en el <c2/> del escenario, extraído en un orden fijo. Consecuencias:

# text
seg-14df30025491 = Propiedad

# text
seg-f0badf8cb640 = Garantizado

# text
seg-9f6678ac42f5 = Se hace cumplir mediante

# text
# c1: result.json
seg-cfc934af2c75 = Mismo escenario, misma máquina → <c1/> idéntico byte a byte

# text
# c1: scripts/check-reproducible.sh
seg-917da569fdd7 = <c1/> (ejecuta dos veces el escenario de referencia y compara el SHA-256 (SHA: Secure Hash Algorithm))

# text
seg-27351cbdc2b5 = Mismo escenario → cifras de mérito idénticas campo a campo

# text
seg-bdeaf344acf8 = Sí, por plataforma

# text
# c1: tests/golden.rs
seg-debbc6540baf = <c1/> fija cada cifra de mérito (FoM) de los cuatro escenarios de referencia

# text
# c1: scenario_hash
seg-f7c5427c88f9 = El hash de entrada del escenario (<c1/>) es independiente de la plataforma

# text
# c1: tests/golden.rs
seg-2bdf4b2d80be = SHA-256 direccionado por contenido del escenario canónico, fijado en <c1/>

# text
seg-45861afe0994 = Huella de entrada + <b>forma</b> de la salida idénticas entre SO (sistemas operativos)

# text
# c1: tests/cross_platform_golden.rs
# c2: .sha256
# c3: tests/golden/
seg-49345663b97c = <c1/> fija un SHA-256 exacto por escenario (diez escenarios, un archivo <c2/> cada uno en <c3/>), comprobado en la matriz de CI (integración continua) de 3 SO

# text
seg-e54b5ff80782 = Los <b>valores</b> de salida coinciden entre SO (ubuntu/macOS/Windows)

# text
seg-271bcbff6287 = Sí, hasta { "1e-6" }

# text
# c1: reproducibility-matrix
# c2: golden.rs
# c3: sgp4_verification.rs
# c4: determinism.rs
seg-3c25e00debff = el trabajo de CI <c1/> ejecuta <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) y <c4/> en los tres SO

# text
seg-3876618cc821 = Una trama de mensaje de navegación de órbita terrestre baja (LEO) son los mismos bytes en todas las plataformas y en todos los perfiles de compilación, incluida la compilación WebAssembly (WASM)

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
# c3: libm
# c4: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
seg-8aff3ee31c7e = <c1/> (toda función trascendente y toda desviación normal del tipo de escenario <c2/> pasa por el crate <c3/> de Rust puro); <c4/> fija una trama completa sin condicionarla a la plataforma

# text
seg-69750a5db756 = Los sorteos de índices con semilla (remuestreo bootstrap, barajados) son iguales en destinos de 32 y de 64 bits

# text
# c1: portable_math::uniform_index
# c2: u64
# c3: portable_math::tests
seg-01e0601aa7fc = <c1/> muestrea siempre como <c2/>; fijado en <c3/>

# text
seg-e42899fd8a4e = La misma cadena de herramientas en todas partes

# text
# c1: rust-toolchain.toml
# c2: scripts/check-toolchain.sh
seg-0bdd9769d5fb = <c1/> fija el canal; <c2/> hace fallar la compilación ante una deriva; la CI y la publicación fijan la misma versión

# text
seg-b0a3fd993614 = El mismo conjunto de dependencias

# text
# c1: Cargo.lock
# c2: cargo metadata --locked
seg-5a3daf9f0468 = <c1/> está incorporado al repositorio y <c2/> se usa para el SBOM (lista de materiales de software)

# text
# c1: <scenario>.report.json
# c2: .report.html
# c3: tests/advanced_report_cli.rs
# c4: scenarios/clock-holdover.toml
# c5: report.json
seg-3ec3fae0dc5e = Toda ejecución por línea de comandos escribe además un registro de reproducibilidad en su informe (<c1/> y <c2/>): la versión del motor, el SHA-256 del archivo de escenario y del documento de resultado, la semilla, la plataforma y el comando exacto, que <c3/> vuelve a ejecutar hasta obtener un resultado idéntico byte a byte. El informe es en sí una función pura de la ejecución: dos ejecuciones de <c4/> escriben el mismo <c5/> byte a byte. Véase <a1>REPORTS.md</a1>.

# text
seg-273a66a3584d = La salvedad entre plataformas (y cómo la tratan los golden)

# text
# c1: sqrt
# c2: ln
# c3: exp
seg-9f4ec3dc638d = Los resultados numéricos son <b>idénticos bit a bit en una plataforma dada</b>, pero pueden diferir en las últimas unidades en el último lugar (ULP) <b>entre</b> plataformas. La causa es la biblioteca matemática de la plataforma: IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) no exige que <c1/>, <c2/>, <c3/> y similares estén correctamente redondeadas, de modo que Linux (glibc, la biblioteca C de GNU), macOS y Windows pueden devolver cada uno un último bit distinto. En una ejecución larga, estas diferencias de ~{ "1e-16" } se acumulan hasta quizá ~{ "1e-12" } relativo.

# text
# c1: src/test_support.rs
seg-9297c2585419 = Dos cosas hacen que esa diferencia en el último lugar sea mayor de lo que empieza siendo, y ambas están medidas y no supuestas. Un <b>integrador adaptativo</b> elige su paso siguiente a partir de la estimación de error mediante una raíz quinta, de modo que una unidad en el último lugar cambia la secuencia de pasos y las dos plataformas solo coinciden entonces hasta la tolerancia de integración. Un <b>estimador iterativo</b> (un ajuste de mínimos cuadrados, un filtro de determinación de órbita) puede seguir un camino distinto hasta la convergencia. Los tipos de escenario construidos sobre cualquiera de los dos pueden diferir entre plataformas en más de { "1e-6" } en campos individuales; <c1/> registra el mismo régimen para las pruebas unitarias.

# text
# c1: sin
# c2: leo-ppp-convergence
seg-c6bd20427abc = El <b>perfil de compilación</b> importa del mismo modo, en una misma máquina. Una compilación optimizada en macOS fusiona un seno y un coseno de un mismo argumento en una sola llamada a la rutina combinada del sistema, cuyo seno difiere del <c1/> aislado en el último bit para { "379" } de { "200 000" } argumentos; una compilación sin optimizar hace las dos llamadas. Medido en aarch64 macOS sobre los { "138" } archivos de escenario, una compilación de depuración y una de publicación de una misma fuente dan documentos de resultado idénticos byte a byte en { "102" }. Los otros { "36" } difieren en los últimos lugares: { "28" } dentro de { "1e-6" }, uno (<c2/>) en { "2.8e-6" }, y siete campañas solo en los resúmenes de sus ejecuciones miembro; ninguno difiere en una etiqueta, un recuento o un veredicto. La garantía de identidad byte a byte anterior es, por tanto, para una compilación: el mismo binario dos veces.

# text
seg-ff368c627bd2 = Los <b>sorteos normales</b> con semilla son una tercera fuente, mucho más rara: el muestreador llama a la exponencial y al logaritmo del anfitrión en sus ramas raras, y aproximadamente un sorteo de cada millón difiere en el último bit entre la compilación nativa y la WASM.

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
seg-0b7ebca1a5e3 = Cuando una salida es <b>discreta</b>, una diferencia en el último lugar no es aceptable en absoluto, y el tipo de escenario se calcula con <c1/> en lugar de con la biblioteca del anfitrión. El tipo de escenario <c2/> es el primero: su trama binaria son enteros transmitidos, y el mismo escenario llegó a codificarse en tres tramas distintas: en una compilación de publicación, en una de depuración de la misma fuente y en el navegador. Ahora son los mismos bytes en las tres.

# text
seg-1746a0ea22fe = Por eso, las pruebas golden <b>no</b> fijan un único hash multiplataforma de la salida en coma flotante: sería frágil y haría fallar compilaciones correctas en otro SO. En su lugar:

# text
# c1: tests/golden.rs
# c2: 1e-6
seg-9733b0545768 = <b><c1/></b> fija cada cifra de mérito con una tolerancia relativa de <c2/>, cuatro órdenes de magnitud más ajustada que cualquier regresión real (que mueve un valor en porcentajes enteros) y aun así mucho más holgada que la fluctuación de la biblioteca matemática (libm) entre plataformas. Los campos acotados por la cuadrícula (segundos de holdover) y los campos exactamente cero se fijan de forma exacta.

# text
# c1: scenario_hash
seg-a3dfe1c26401 = <b><c1/></b>, un hash de contenido de las <em>entradas</em>, es independiente de la plataforma y se fija de forma exacta.

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden/
seg-571aea9b8115 = <b><c1/></b> fija un SHA-256 exacto, incorporado por escenario en <c2/>, sobre la proyección que <em>sí</em> es idéntica entre plataformas: la huella de entrada más la <b>forma</b> de la salida (nombres de campo, anidamiento, tipos de hoja, longitudes de matriz; fijados por aritmética determinista de cuadrícula, nunca los valores en coma flotante). Esto detecta con exactitud las regresiones estructurales, mientras que las tolerancias anteriores detectan las regresiones de valores.

# text
# c1: scripts/check-reproducible.sh
seg-8543165b0d7d = <b><c1/></b> exige una salida idéntica byte a byte entre dos ejecuciones <em>en la misma máquina</em> (la garantía de determinismo).

# text
# c1: reproducibility-matrix
# c2: cross_platform_golden
# c3: golden
# c4: determinism
# c5: sgp4_verification
seg-8b8b4ba5de30 = <b>El trabajo de CI <c1/></b> ejecuta las cuatro pruebas anteriores (<c2/>, <c3/>, <c4/>, <c5/>) en <b>ubuntu-latest, macos-latest y windows-latest</b>, de modo que la reproducibilidad entre plataformas se afirma en cada push (los golden de forma y de entrada, de forma exacta; la numérica, hasta { "1e-6" }; y los estados SGP4 (Simplified General Perturbations { "4" }), hasta { "2e-5" } km) en lugar de depender de un único SO.

# text
# c1: tests/golden.rs
# c2: CHANGELOG.md
seg-2b9915611f03 = Si necesita regenerar las cifras fijadas (p. ej., tras un cambio intencionado del modelo), ejecute cada escenario de referencia y copie los valores de FoM impresos en <c1/>, y anote después el cambio en <c2/>.

# text
seg-9310a7af7ff8 = Lista de materiales de software (SBOM)

# text
# c1: scripts/gen-sbom.sh
# c2: cargo metadata --locked
# c3: sgp4
seg-717baa65bbb2 = <c1/> emite un SBOM CycloneDX { "1.5" } que enumera cada crate que se distribuye en un artefacto de kshana, con su versión exacta, su origen y su licencia. Es un generador sin dependencias construido sobre <c2/> (de modo que funciona solo con la cadena de herramientas) y recorre el grafo de resolución desde el paquete kshana a través de las dependencias normales y de compilación únicamente. Las dependencias de desarrollo (crates solo de pruebas, como <c3/>) se excluyen porque ningún artefacto las contiene.

# text
# c1: --features python
# c2: pyo3
# c3: --features wasm
# c4: tests/fixtures/reproducibility_software_assurance/
# c5: kshana-mcp
seg-a7886c557267 = El grafo es la unión de los conjuntos de características con los que se construyen los artefactos distribuidos: la compilación por defecto (biblioteca y CLI (interfaz de línea de comandos)), <c1/> (la wheel de PyPI (Python Package Index), cuya cadena <c2/> es su frontera de interfaz de funciones externas) y <c3/> (el paquete npm, que lleva este mismo SBOM dentro de su tarball). Se incluyen las dependencias condicionadas por plataforma para todos los destinos, ya que las wheels se distribuyen para varios sistemas operativos y el paquete npm tiene como destino WebAssembly. Un solo documento cubre los tres artefactos, de modo que para cualquiera de ellos es un superconjunto. Actualmente enumera { "107" } componentes; el recuento está fijado en <c4/>. El servidor independiente <c5/> tiene su propio manifiesto y no lo describe este SBOM.

# text
seg-4c8948e9ee7d = La salida es determinista: el mismo conjunto de dependencias da un documento idéntico byte a byte, incluido un número de serie derivado de la lista ordenada de paquetes y no de una marca de tiempo.

# text
# c1: kshana-sbom.cdx.json
seg-60742bbdc583 = El flujo de trabajo de publicación genera el SBOM (<c1/>) y lo adjunta a cada versión etiquetada; el flujo de trabajo de distribución también lo incluye junto a las wheels de PyPI y dentro del paquete npm.

# text
seg-928c3c0108a1 = Procedencia de la compilación

# text
# c1: actions/attest-build-provenance
# c2: kshana-mcp
# c3: SHA256SUMS
# c4: gh attestation verify
seg-42752467bfaa = El flujo de trabajo de publicación produce una atestación de procedencia de compilación SLSA (Supply-chain Levels for Software Artifacts) (<c1/>) que cubre todos los archivos que adjunta a la Release de GitHub: los binarios de línea de comandos de cada plataforma, el binario del servidor <c2/>, el SBOM, el resumen de validación y <c3/>. Un consumidor puede verificar, con <c4/>, que los artefactos fueron construidos por el flujo de trabajo de publicación de este repositorio a partir de esta fuente, cerrando la brecha entre «aquí hay un binario» y «aquí hay un binario que puedo rastrear hasta su fuente». Por ejemplo, para el SBOM de { "v0.28.0" }:

# text
seg-06515d230d33 = <s1>Anterior</s1>Procedencia

# text
seg-c6dba4e40c76 = <s1>Siguiente</s1>Mapa de capacidades
