# docs--kind-lunar-beacon: translations (es)

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
# c1: docs/kinds/by-kind/lunar-beacon.md
seg-3c4e3d725bb6 = Fuente: <c1/>

# text
# c1: lunar-beacon
seg-5e402fc935cb = <c1/> (tipo de escenario)

# text
seg-142ad48fe422 = Aumento con balizas de superficie de un servicio de navegación orbital lunar, como una tabla antes/después ejecutable. Un usuario en el polo sur ve un conjunto orbital disperso en una franja estrecha de cielo, por lo que la geometría de medición de distancia está mal condicionada; unas pocas BALIZAS DE SUPERFICIE TOPOGRAFIADAS aportan las filas de línea de visión de baja elevación y amplio acimut de las que carece un conjunto totalmente cenital, y la dilución de precisión horizontal se desploma. El escenario informa de tres configuraciones en una época: solo satélites, satélites más las balizas visibles, y una constelación mayor como vía alternativa a la misma geometría, cada una con sus recuentos de fuentes visibles, su DOP completo y la precisión de 1 sigma lograda en METROS, obtenida al multiplicar por un error equivalente de medición de distancia por baliza para el usuario, ensamblado como suma cuadrática de términos de sincronización de reloj, de multitrayecto y de topografía. La visibilidad de las balizas es el horizonte geométrico de dos alturas de una Luna sin atmósfera (sin atmósfera, de modo que la cota es exacta), y el ensamblado del DOP es el mismo núcleo contrastado con gnss_lib_py en tests/dop_reference.rs. POR QUÉ EXISTE ESTE TIPO DE ESCENARIO: el módulo que hay detrás está en el motor y se ha contrastado con una vía de DOP independiente desde L08/L09, pero no era alcanzable desde una ejecución: sin tipo de escenario, sin rama de despacho, sin archivo incluido. El README anunciaba la capacidad y la matriz de verificación NO tenía ninguna fila para ella, de modo que estaba a la vez afirmada en la prosa y sin afirmar en el registro, siendo inalcanzable en el motor. Los valores por defecto son la geometría que ya tiene un golden confirmado (un usuario a -80 deg con una antena de { "2" } m, tres balizas a -80/0, -79/+{ "60" } y -79/-60 a { "2" } km, una instantánea ilustrativa de seis satélites LCNS en t={ "0" }, una máscara de { "5" } deg), de modo que una ejecución básica reproduce una tabla que una referencia independiente ya cubre en lugar de inventar cifras nuevas. MODELLED: el diseño de la constelación, la colocación de las balizas y toda magnitud del presupuesto de errores son entradas ilustrativas, no un levantamiento desplegado ni un enlace medido; solo la aritmética del DOP, la forma cerrada del horizonte y la relación sigma = DOP x sigma_URE están ancladas externamente. No es un compromiso de rendimiento del servicio.

# text
# c1: scenarios/lunar-beacon.toml
seg-22ea11fcf367 = Una ejecución de <c1/> se resume así: aumento con balizas de superficie lunares: máscara { "5.0" } deg, época +{ "0" } s, sigma_URE por baliza { "1.1576" } m { "6" } satélites, sin balizas sats { "5" } balizas { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } 1 sigma logrado: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satélites + { "1" } balizas visibles sats { "5" } balizas { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } 1 sigma logrado: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satélites, sin balizas sats { "19" } balizas { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } 1 sigma logrado: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m las balizas mejoran el PDOP en 2.355x; una constelación mayor en su lugar, 4.002x MODELLED: la constelación, la colocación de las balizas y el presupuesto de errores son entradas ilustrativas. El núcleo de DOP subyacente es el validado con gnss_lib_py y el horizonte de las balizas es la forma cerrada L01.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-25522022cf9a = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/lunar-beacon.toml
seg-acfef3f325e4 = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-a53e353706f6 = El gráfico que el motor escribe para scenarios/lunar-beacon.toml, tipo de escenario lunar-beacon

# text
seg-89e2f6bb2540 = <b>MODELLED</b> Dilución de precisión aumentada con balizas para un usuario en la superficie lunar: las filas de línea de visión de los satélites visibles y las filas de medición de distancia de las balizas de superficie visibles se concatenan en una única matriz de diseño y se evalúan mediante el núcleo de DOP compartido, y t Pruebas: <a1>validate_p2_beacon_before_after_table.rs</a1>.

# text
seg-654a3554b1e3 = <b>MODELLED</b> Dilución de precisión aumentada con balizas para un usuario en la superficie lunar: las filas de línea de visión de los satélites visibles y las filas de medición de distancia de las balizas de superficie visibles se concat. Referencia independiente (ReferenceImpl): La aritmética del DOP es el núcleo crate::orbit::dop, validado por separado de forma externa frente a gnss_lib_py en tests/dop_reference.rs; esta fila no toma prestado el estado de aquella fila. El horizonte de visibilidad de las balizas es la forma cerrada L01, y sigma = DOP x sigma_URE es la relación estándar de GNSS (Kaplan y Hegarty, Understanding GPS/GNSS, sección { "7" }). Dentro de esta fila, el propio aumento se comprueba frente a un

# text
# c1: kshana kinds --json
seg-4d1fc06e907b = MODELLED: el diseño de la constelación, la colocación de las balizas y toda magnitud del presupuesto de errores son entradas ilustrativas, no un levantamiento desplegado ni un enlace medido; solo la aritmética del DOP, la forma cerrada del horizonte y la relación sigma = DOP x sigma_URE están ancladas externamente. (catálogo de tipos de escenario (<c1/>))

# text
seg-aaafed663400 = QUÉ ESTÁ ANCLADO Y QUÉ NO Anclado: el ensamblado del DOP es el núcleo contrastado con gnss_lib_py en tests/dop_reference.rs; la visibilidad de las balizas es la forma cerrada del horizonte geométrico de dos alturas de una Luna sin atmósfera (sin atmósfera, de modo que no hay extensión refractiva y la cota es exacta); y sigma = DOP x sigma_URE es la relación estándar (Kaplan & Hegarty, Understanding GPS/GNSS, sección { "7" }). NO anclado — MODELL (comentario del archivo de escenario, líneas { "40" } a { "49" })

# text
seg-2516c4208769 = El aumento del DOP con balizas de superficie lunares es MODELLED, no validado: se comprueba frente a una implementación independiente de esta misma base de código, independiente de la unidad bajo prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-ebb9724de60a = <s1>Anterior</s1>lunar-attack-surface

# text
seg-ca9b68783354 = <s1>Siguiente</s1>lunar-differential-pnt

seg-b81e98467952 = <s1>Siguiente</s1>lunar-descent
