# docs--constellation-design: translations (es)

# text
seg-f63dd3d7aad4 = Fuente

# text
# c1: docs/CONSTELLATION-DESIGN.md
seg-8f0e4021404d = Fuente: <c1/>

# text
# c1: constellation-design
# c2: src/body.rs
# c3: solar-system
# c4: body-pnt
# c5: src/constellation.rs
seg-44196ab9678c = El tipo de escenario <c1/> construye una o varias constelaciones de satélites alrededor de la Tierra, la Luna, Marte o cualquier otro cuerpo del catálogo del sistema solar (<c2/>: los ocho planetas, Plutón, la Luna, Fobos, Deimos, las cuatro lunas galileanas y Titán, con las mismas constantes que usan los tipos de escenario <c3/> y <c4/>; véase <a1>SOLAR-SYSTEM.md</a1>) y traza su cobertura y su dilución de la precisión (DOP) sobre una cuadrícula de latitud/longitud. Fuente: <c5/>.

# text
# c1: body
# c2: earth
# c3: duration_s
# c4: step_s
# c5: mask_deg
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: j2 = true
seg-61385c509a3d = El cuerpo se elige con <c1/> (por defecto <c2/>). La ejecución abarca <c3/> (por defecto un día sidéreo, { "86 164" } s) en pasos de <c4/> (por defecto { "600" } s), por encima de <c5/> (por defecto { "5" } grados), sobre una cuadrícula de <c6/> (por defecto { "10" } grados) que pueden restringir <c7/>, <c8/>, <c9/> y <c10/>; <c11/> añade la deriva secular debida a J2, el segundo armónico zonal del campo gravitatorio del cuerpo.

# text
seg-d02f6d747522 = Qué entra

# text
# c1: T/P/F
# c2: T
# c3: P
# c4: F
# c5: k
# c6: raan0 + k·ΔΩ
# c7: j
# c8: m0 + j·360·P/T + k·360·F/T
seg-743e68478333 = <b>Capas Walker</b> en la convención <c1/>: <c2/> satélites en <c3/> planos equiespaciados con fase <c4/>. Un patrón <em>delta</em> reparte los nodos ascendentes en { "360" } grados, un patrón <em>estrella</em> en { "180" } grados. El plano <c5/> está en el nodo <c6/> y el satélite <c7/> de él, en la anomalía media <c8/>.

# text
seg-d86b01d633a0 = <b>Conjuntos explícitos de elementos</b>: semieje mayor o altitud, excentricidad, inclinación, ascensión recta del nodo ascendente (RAAN), argumento del periapsis y anomalía media.

# text
seg-0737ef1ddb72 = <b>Preajustes</b> a partir de elementos nominales publicados (solo la Tierra; un preajuste alrededor de otro cuerpo es un error):

# text
seg-587beeccaa11 = Preajuste

# text
seg-1ff32b87e030 = Satélites

# text
seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5.ª edición, abril de { "2020" }, Tablas 3.2-1 y 3.2-3

# text
seg-fb6956d09acc = { "24" } a { "30" }

# text
# c1: expanded
seg-f679ee0f3a3f = SPS PS Tabla 3.2-2: cada una de las seis ranuras expandibles (B1, D2, F2, A2, C4, E3) nombradas en <c1/> se sustituye por su pareja delantera y trasera; las seis por defecto

# text
seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), edición { "1.1" }: Walker 24/3/1, semieje mayor { "29 599.801" } km, { "56" } grados (Tabla { "1" }), ranuras de la Tabla { "23" }

# text
seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), sección { "4.1" }: órbita terrestre media (MEO) Walker 24/3/1 a { "21 528" } km y { "55" } grados, más tres satélites geoestacionarios (GEO) a { "80" }, { "110.5" } y { "140" } grados E y tres satélites geosíncronos inclinados (IGSO) a { "55" } grados

# text
seg-70a32cd2402d = GLONASS Interface Control Document (ICD), edición { "5.1" } ({ "2008" }), sección { "5.2" }: fórmula de ranuras, { "19 100" } km, { "64.8" } grados

# text
seg-654d7aceff94 = La RAAN de la tabla de GPS es inercial en su época; el preajuste la convierte en una longitud de nodo fija a la Tierra con el ángulo horario de Greenwich que indica la tabla ({ "100.765" } grados). GLONASS indica directamente longitudes de nodo absolutas (de Greenwich). El documento de Galileo no indica ningún ángulo horario, de modo que su RAAN se usa como longitud de nodo. La norma de BeiDou no indica la fase MEO ni los nodos IGSO; el preajuste inicia el patrón MEO en el nodo { "0" } y la anomalía media { "0" } y coloca los tres IGSO en una misma traza terrestre que cruza el ecuador a { "118" } grados E. Esas dos elecciones son modeladas.

# text
# c1: clock = "per-constellation"
# c2: clock = "common"
seg-b2bbdd23c13b = Varias constelaciones pueden compartir una misma ejecución. Con <c1/> (el valor por defecto) el receptor estima un reloj por sistema a la vista, como hace un receptor multi-GNSS (Global Navigation Satellite System); <c2/> comparte un solo reloj.

# text
seg-27db52482bdd = Qué sale

# text
# c1: pdop_threshold
# c2: track_points
# c3: max_tracks
seg-2405196cfccb = Por celda de la cuadrícula: media, mínimo y máximo de satélites por encima de la máscara; la proporción de épocas con posición y con DOP de posición (PDOP) igual o inferior a <c1/>; DOP geométrico, de posición, horizontal y vertical medios (GDOP, PDOP, HDOP, VDOP); mayor PDOP. A escala global, ponderado por el coseno de la latitud para que cada celda cuente según su área: disponibilidad, disponibilidad del peor emplazamiento y la media, la mediana, los percentiles 90, 95 y 99 y el máximo de cada DOP. Por satélite: una traza terrestre submuestreada (<c2/> muestras, por defecto { "24" }, para como máximo <c3/> satélites, por defecto { "120" }). El gráfico son dos mapas, disponibilidad y PDOP medio.

# text
seg-6cb532d0bca9 = Cómo escala

# text
# c1: r
# c2: ε
# c3: λ = arccos((R/r)·cos ε) − ε
# c4: cos λ
# c5: φ
# c6: λ_max
# c7: φ
# c8: work
# c9: leo-pnt-mega-shell
seg-988ae3272c1f = Un satélite a radio <c1/> está por encima de una máscara de elevación <c2/> exactamente cuando su ángulo central respecto al usuario es como máximo <c3/>, de modo que la prueba de visibilidad es un producto escalar frente a <c4/>. En cada época los satélites se ordenan además por latitud subsatelital, y una fila de la cuadrícula a latitud <c5/> solo prueba los satélites a menos de <c6/> de <c7/>. Ambas cosas son exactas en un cuerpo esférico, y una prueba unitaria contrasta cada mapa con un barrido de fuerza bruta con la prueba directa de elevación. El bloque <c8/> indica las pruebas de pares que haría un barrido de fuerza bruta y las que se hicieron. El diseño de { "5" } 000 satélites de la prueba unitaria sobre una cuadrícula de { "10" } grados ({ "648" } puntos, { "6" } épocas) conserva el { "9.9" } % de las { "19 440 000" } pruebas de pares de la fuerza bruta; el escenario incluido <c9/> ({ "5 000" } satélites, { "648" } puntos, { "12" } épocas) se ejecuta en unos { "0.14" } s con el binario de línea de comandos de publicación en un portátil con Apple silicon. Los tiempos de reloj de pared varían con la máquina y su carga. El motor no usa hilos, reloj ni sistema de archivos, de modo que se ejecuta sin cambios como WebAssembly.

# text
seg-abba032ee1c7 = Qué se comprueba y frente a qué

# text
seg-2342ed239300 = VALIDATED, frente a documentos publicados:

# text
seg-dc7fe92fcf05 = el generador Walker reproduce las { "24" } filas de la Tabla { "23" } de Galileo OS SDD, y la fórmula de ranuras del ICD de GLONASS es el mismo conjunto de { "24" } ranuras que un Walker 24/3/1;

# text
seg-686f9543c7c9 = el preajuste de GPS reproduce la columna de cruce ecuatorial de la traza terrestre de las Tablas 3.2-1 y 3.2-2 de SPS PS: { "35" } de { "36" } ubicaciones a menos de { "0.0108" } grados frente a un umbral de redondeo de { "0.015" } grados. E3F se sujeta a un umbral más laxo de { "0.06" } grados, porque la propia fila E3F de la tabla es incoherente con su RAAN y su argumento de latitud: su argumento de latitud va { "14.60" } grados por delante del de E3, lo que desplaza el cruce { "7.30" } grados, mientras que la tabla lo desplaza { "7.36" } grados;

# text
seg-dc2756c75401 = la línea base de GPS bajo las condiciones del Apéndice B de SPS PS (un día sidéreo, { "287" } pasos de cinco minutos, una cuadrícula de { "4" } grados, todos a la vista, máscara de { "5" } grados) da una mediana global de HDOP de { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } y media { "0.965" }, frente a los publicados { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } y { "0.96" } (umbral { "0.03" }, fijado antes de la primera ejecución). La mediana de PDOP { "1.795" } es inferior a la de { "1.815" } de la Tabla B.3-1, que describe una mezcla degradada de 20-24 satélites. Un PDOP de { "6" } o menos se mantiene el { "100" } % del tiempo, frente al { "98" } % global y el { "88" } % del peor emplazamiento de la Tabla 3.8-1.

# text
seg-9aac9d8aa228 = Contrastado con una derivación a mano, no con un documento externo: el DOP de una sola época coincide con la forma cerrada para un satélite en el cenit y tres a { "30" } grados de elevación (PDOP 8/3, GDOP { "3.0732" }).

# text
seg-d946dad08e23 = MODELLED: órbitas de dos cuerpos con una deriva secular J2 opcional; un cuerpo esférico; solo visibilidad geométrica (sin potencia de señal, salud de los satélites ni terreno); sin perturbación de tercer cuerpo, de la que depende una órbita lunar congelada real. El peor punto espacio-temporal individual depende de la cuadrícula: aquí HDOP { "2.40" } y VDOP { "5.22" } frente a { "2.49" } y { "5.43" } publicados; se notifican, no se fijan. Los preajustes de los cuatro sistemas proceden de épocas de referencia distintas, de modo que su fase relativa en una misma ejecución no es una instantánea de ninguna fecha.

# text
seg-a6c63abeb7e6 = Escenarios incluidos

# text
seg-3e6a942c84d4 = Cada línea indica lo que imprime la ejecución con kshana { $version }.

# text
# c1: scenarios/constellation-multi-gnss-coverage.toml
seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou y GLONASS ({ "102" } satélites) durante un día por encima de una máscara de { "10" } grados, un reloj por sistema. Disponibilidad (PDOP de { "6" } o menos) del { "100" } % a escala global y en el peor emplazamiento, PDOP mediano { "0.95" }, { "31.0" } satélites a la vista de media.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-b65ade1eab04 = <c1/>: { "5 000" } satélites en cuatro capas de órbita terrestre baja (LEO) para posicionamiento, navegación y temporización (PNT), con J2, por encima de una máscara de { "20" } grados. Disponibilidad (PDOP de { "3" } o menos) del { "99.22" } % a escala global y del { "0" } % en el peor emplazamiento, PDOP mediano { "1.11" }, { "39.4" } satélites a la vista de media.

# text
# c1: scenarios/lunar-relay-constellation.toml
seg-7d860ca30360 = <c1/>: { "8" } satélites en órbitas lunares congeladas elípticas y una capa circular de 6 satélites alrededor de la Luna. Disponibilidad (PDOP de { "6" } o menos) del { "21.33" } % a escala global y del { "0" } % en el peor emplazamiento, PDOP mediano { "5.22" }, { "3.2" } satélites a la vista de media.

# text
# c1: leo-pvt
# c2: scenarios/polar-arctic-leo-coverage.toml
seg-0c331bea1f52 = La cobertura LEO-PNT para usuarios polares y árticos, frente al GNSS de órbita terrestre media, corresponde al modo polar del tipo de escenario <c1/> (<c2/>; véase <a1>LEO-PNT.md</a1>).

# text
seg-9aab3bf49146 = <s1>Anterior</s1>Posicionamiento fusionado MEO y LEO

# text
seg-9f717b9015e1 = <s1>Siguiente</s1>Modelos de sensores cuánticos
