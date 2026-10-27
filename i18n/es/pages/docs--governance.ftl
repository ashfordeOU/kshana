# docs--governance: translations (es)

# text
# c1: GOVERNANCE.md
seg-26440a254ba8 = Fuente: <c1/>

# text
seg-5f8e9a4a15be = Gobernanza de Kshana

# text
seg-b20b74b77755 = Este documento expone cómo se gobierna Kshana: quién toma las decisiones, cómo, y qué absorberá y qué no absorberá el proyecto. Es deliberadamente <b>ligero</b>, proporcional al tamaño actual del proyecto, y es honesto sobre la realidad actual de un único responsable y sobre el camino hacia una gobernanza más amplia a medida que crezca la comunidad.

# text
seg-1e0c276811e2 = Misión y alcance

# text
# c1: docs/CAPABILITY.md
# c2: docs/VALIDATION.md
seg-5dcc38148cf4 = Kshana es una <b>referencia neutral, reproducible y validada con honestidad sobre el rendimiento y la resiliencia de PNT híbrido cuántico/clásico</b>. La misión fija el listón de cada decisión: corrección, citas y reproducibilidad por encima de la amplitud. El alcance honesto está documentado en <a1><c1/></a1> y el estado de validación en <a2><c2/></a2>; las propuestas se sopesan frente a ese alcance, no frente al número de funciones.

# text
seg-d331a1cfc60b = Roles

# text
# c1: contact@ashforde.org
seg-88bb2a831125 = <b>Responsable.</b> Kshana la mantiene actualmente su fundadora, Ashforde OÜ (contacto: <c1/>). El responsable es quien toma la decisión final sobre el alcance, el diseño, las versiones y lo que se incorpora. Es un modelo de responsable benevolente, expuesto con claridad en lugar de disfrazado de un comité que no existe.

# text
# c1: CONTRIBUTING.md
seg-8e1da46f9b0b = <b>Colaboradores.</b> Cualquiera que abra una incidencia o un pull request. Las contribuciones se someten al umbral de <a1><c1/></a1>: procedencia de cada parámetro numérico, validación frente a una relación publicada y honestidad sobre la madurez.

# text
seg-d212e17ac218 = <b>Futuros committers.</b> Cuando una contribución sostenida y de calidad lo justifique, se concederán derechos de commit a colaboradores de confianza y este documento se actualizará a un modelo de varios responsables (decisiones por consenso tácito, con el grupo de responsables resolviendo los desacuerdos). Hasta entonces, el camino es: contribuir, construir un historial y recibir la invitación.

# text
seg-91e3f1919016 = Cómo se toman las decisiones

# text
seg-0d45899c92f4 = <b>Debate abierto.</b> Los cambios sustantivos comienzan como una incidencia de GitHub, de modo que la justificación, las alternativas y las contrapartidas queden registradas.

# text
seg-88916dd2357b = <b>Consenso tácito.</b> Una propuesta sin objeciones sostenidas tras un plazo razonable, y que supera el umbral técnico de más abajo, sigue adelante.

# text
seg-788566515dad = <b>El responsable decide si hay desacuerdo.</b> Cuando no se alcanza consenso, decide el responsable y deja constancia del motivo. El desacuerdo se resuelve con la misión y el umbral técnico, no con la antigüedad ni el volumen.

# text
seg-e45e1b565e62 = El umbral técnico (no negociable)

# text
seg-2c397872e2f5 = Son invariantes estrictas, aplicadas por CI y por revisión, que ninguna decisión anula:

# text
# c1: (scenario, seed, engine_version)
seg-70cb5a174c2f = <c1/> debe reproducir una ejecución bit a bit. Un cambio que lo vuelva no determinista es un error, no una función.

# text
seg-b8733ea97546 = <b>Procedencia.</b> Ninguna constante numérica anónima: cada parámetro cita una fuente.

# text
# c1: validated
# c2: modelled
# c3: not modeled
# c4: src/verification.rs
seg-55a09b775418 = <b>Honestidad de la validación.</b> Cada capacidad se etiqueta como <c1/> (frente a una referencia independiente externa) o como <c2/> / <c3/>. No se afirma nada más allá de su evidencia. Véase la matriz verificada por máquina en <c4/>.

# text
# c1: scripts/check-no-attribution.sh
seg-dd339a396698 = <b>Higiene.</b> Ninguna atribución a herramientas automáticas en ningún lugar de los commits, el contenido o el historial (lo aplica <c1/>).

# text
seg-45733fea1709 = Un cambio que no puede alcanzar el umbral se rechaza, por útil que fuera.

# text
seg-3eb0831d99a2 = La frontera entre abierto y cerrado

# text
# c1: LICENSING.md
seg-ca7730a3d518 = Kshana es <b>open-core</b>. Este repositorio es, y seguirá siendo, el motor AGPL-3.0 abierto completo, la referencia neutral, con licencia dual comercial de Ashforde OÜ (véase <a1><c1/></a1>). El proyecto <b>no</b> aceptará en el repositorio abierto:

# text
# c1: CONTRIBUTING.md
seg-8c2a89a3a4e2 = <b>Profundidad sujeta a control de exportaciones o de doble uso</b>: bibliotecas de amenazas reales, formas de onda de adversarios o parámetros de rendimiento antiinterferencia/antispoofing. El repositorio público se limita a modelos y métodos genéricos y publicados (véase <c1/> → Control de exportaciones). Si hay dudas, pregunte <em>antes</em> de contribuir.

# text
seg-6df31d37cfe4 = Datos o calibración confidenciales de clientes o socios.

# text
# c1: deny.toml
seg-b3b4a5384199 = <b>Copyleft (GPL/AGPL/LGPL/MPL) en las <em>dependencias</em></b>: no porque choquen con la propia licencia AGPL del motor (no chocan), sino porque no pueden relicenciarse en la edición <b>comercial</b>: solo podemos vender una licencia comercial sobre código que poseemos o que es permisivo. Una dependencia con copyleft contaminaría la edición comercial y rompería la licencia dual. Por ello las dependencias siguen siendo permisivas (Apache/MIT/BSD/ISC), lo cual aplica <a1><c1/></a1>.

# text
seg-ce264f3e43fe = A la inversa, el proyecto <b>no</b> vaciará el núcleo abierto para empujar valor propietario: el motor validado, los anclajes públicos de validación, el registro de honestidad, el formato de intercambio/estándar y los canales de distribución siguen siendo abiertos. Asfixiar el núcleo abierto es el único error fatal del open-core, y queda descartado.

# text
seg-947b3e9b1b2d = Versiones

# text
# c1: src/interchange.rs::SCHEMA_VERSION
seg-73e2bca0310d = <b>Versionado semántico.</b> Antes de la 1.0 el esquema de escenarios y resultados puede cambiar; los cambios incompatibles se señalan, y la versión del esquema de intercambio (<c1/>) es la única fuente de verdad sobre la compatibilidad de artefactos.

# text
# c1: cargo publish
# c2: CONTRIBUTING.md
seg-71cace8b6144 = <b>Autoridad de publicación.</b> Publicar (p. ej. <c1/>) es un paso manual del responsable que requiere un token de registro. CI y el flujo de Release activado por etiqueta <b>nunca</b> publican automáticamente en registros externos: solo vuelven a ejecutar todas las comprobaciones y adjuntan un artefacto de compilación. Véase <c2/> → Commits y versionado.

# text
seg-59c37ffa54f0 = Código de conducta y seguridad

# text
# c1: CODE_OF_CONDUCT.md
seg-2dc8c12568bc = La conducta se rige por <a1><c1/></a1>.

# text
# c1: SECURITY.md
seg-8574b73edbbc = Los problemas de seguridad siguen el proceso de divulgación privada de <a1><c1/></a1>; no abra una incidencia pública por una vulnerabilidad.

# text
seg-d86d4e609713 = Marca registrada

# text
seg-cb1314b67b2f = El nombre y el logotipo de Kshana son marcas registradas de Ashforde OÜ. La licencia (AGPL-3.0 o una licencia comercial) cubre el <b>código</b>, no las marcas: una bifurcación puede usar el código bajo la licencia, pero no el nombre Kshana ni la identidad canónica de distribución. Así Ashforde sigue siendo la fuente de verdad citada, y es parte de cómo el núcleo abierto sigue siendo una referencia neutral.

# text
seg-a678f6ed1af8 = Modificación de este documento

# text
seg-db90122245fa = Los cambios de gobernanza se proponen a su vez como un pull request y se deciden mediante el proceso descrito arriba. A medida que cambie la escala del proyecto, cabe esperar que este documento incorpore un modelo de decisión de varios responsables; no rebajará el umbral técnico.

# text
seg-0a0712cca2e7 = Ligera por diseño. Honesta sobre hoy, con un camino declarado para mañana.

# text
seg-4bfa7cf23a41 = <s1>Anterior</s1>Contribuir

# text
seg-f67113e34738 = <s1>Siguiente</s1>Código de conducta
