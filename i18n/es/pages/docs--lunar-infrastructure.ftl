# docs--lunar-infrastructure: translations (es)

# text
seg-cae10fb9bff8 = Escenario

# text
seg-61817375c8ea = Órbita y superficie lunares como infraestructura de navegación y geodésica

# text
seg-9872e31ebd72 = Fuentes

# text
# c1: docs/LUNAR-INFRASTRUCTURE.md
seg-922905241a6b = Fuente: <c1/>

# text
# c1: lunar-infrastructure
# c2: study
seg-bfb9c5efbe57 = Tipo de escenario <c1/>, cinco estudios seleccionados mediante <c2/>. <b>MODELLED</b>: un modelo restringido de tres cuerpos con simplificaciones declaradas y entradas ILLUSTRATIVE. La numérica se comprueba con programas numpy/scipy independientes; nada se compara con una medición de una magnitud lunar y nada de esto es una afirmación sobre ninguna misión ni sistema. Sin afiliación ni respaldo de ninguna agencia. Software de carácter consultivo, no un equipo homologado. Kshana no transmite nada ni maneja hardware.

# text
# c1: xval/lunar-infra/PREREGISTRATION.md
# c2: PREREGISTRATION-amendment-1.md
# c3: xval/lunar-infra/RESULTS.md
seg-7908583855a2 = Los diseños, las entradas y los umbrales se fijaron en <c1/> (confirmado antes de puntuar ningún estudio) y en dos enmiendas divulgadas (<c2/>). El veredicto de cada umbral está en <c3/>.

# text
seg-d9d9d0864ae0 = Estudio

# text
seg-3b01a756c305 = Qué calcula

# text
# c1: family = "elfo"
seg-a4ef7c81b35f = Determinación de órbita a bordo con GNSS terrestre en una NRHO (o <c1/>) frente a una determinación de órbita independiente en tierra por distancia y velocidad de distancia desde tres estaciones de la DSN; la covarianza formal de cada estimación; un Monte Carlo con semilla de si las dos covarianzas explican su diferencia (q, chi cuadrado con { "6" } grados de libertad); una aceleración no modelada inyectada

# text
# c1: lunar-infrastructure-carrier-phase.toml
# c2: xval/lunar-infra/scenarios/carrier-phase-scored.toml
seg-849c67471e69 = <c1/> (rápido), <c2/> (puntuado, unos ocho minutos)

# text
seg-b9c6eb8d778c = Fase de portadora con doble diferencia conjunta entre estación de superficie y orbitador; covarianza de ambigüedad flotante; LAMBDA; éxito mediante bootstrap y Monte Carlo; sigma de posición flotante y fija

# text
seg-74c347e0bc69 = Información de Fisher del datum lunar de 7 parámetros a partir de mediciones de distancia desde estaciones terrestres, con y sin distancias de orbitador a estación de superficie; conjuntos aleatorios de estaciones con semilla

# text
seg-4ed875c39781 = GNSS, VLBI y medición láser de distancia en una sola nave: precisión de Cramer-Rao de los desfases entre técnicas frente al error del enlace local

# text
seg-de25104c09a2 = Información sobre h2, k2, l2 y la libración física a partir de medición láser de distancia, seguimiento del orbitador, un gravímetro y un reloj de superficie (constantes compartidas con los módulos de tiempo lunar)

# attr:alt
seg-18fc4ba766df = Consistencia de una determinación de órbita a bordo con GNSS terrestre en una órbita de halo casi rectilínea con una determinación de órbita independiente en tierra, a partir de ejecuciones reales del motor v{ $version } sobre scenarios/lunar-infrastructure-od-consistency.toml y su variante con error de modelo ({ "400" } ensayos cada una). La diferencia normalizada media q es { "5.81" } sin error de modelo y { "5.95" } con un error de aceleración inyectado de { "3e-10" } m/s2, frente a { "6" } esperado: las dos soluciones de órbita son consistentes (umbral C1 MET). La proporción de ensayos por encima del punto del { "95" } % es { "0.040" } y { "0.052" }; el umbral para detectar el error inyectado era de al menos { "0.5" }, de modo que es NOT MET (C3): la solución a bordo se conoce con unos { "352" } m frente a { "23" } m de la de tierra, por lo que un desplazamiento de diez metros queda oculto dentro de su covarianza. MODELLED: un modelo restringido de tres cuerpos con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-4c08262e2556 = Fijación de la ambigüedad entera de fase de portadora entre estaciones de superficie lunar y un orbitador, a partir del resultado confirmado de la ejecución puntuada del motor v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } longitudes de arco, un Monte Carlo de { "400" } sorteos cada una, escrito por scenarios/carrier-phase-scored.toml). { "1" } día: éxito { "1.0" } % (error estándar { "0.5" } %), { "134" } ambigüedades, sigma de posición del orbitador { "45.6" } m flotante y { "18.5" } m fija; { "2" } días: éxito { "0.5" } % (error estándar { "0.4" } %), { "259" } ambigüedades, sigma de posición del orbitador { "21.5" } m flotante y { "8.7" } m fija; { "3" } días: éxito { "2.8" } % (error estándar { "0.8" } %), { "375" } ambigüedades, sigma de posición del orbitador { "6.3" } m flotante y { "2.1" } m fija. No se logra la fijación entera: el éxito se mantiene entre { "1" } % y { "3" } % a { "25" } dBi, y a los { "12" } dBi registrados el problema no puede plantearse. MODELLED: un modelo restringido de tres cuerpos con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-7e5b10641b20 = Precisión del datum lunar de siete parámetros (tres traslaciones, una escala y tres rotaciones) a partir de mediciones de distancia desde estaciones terrestres, con y sin distancias de orbitador a estación de superficie, a partir de una ejecución real del motor v{ $version } sobre scenarios/lunar-infrastructure-frame-coestimation.toml. La sigma de Cramer-Rao de las traslaciones y rotaciones disminuye con los enlaces del orbitador (por ejemplo, t_z de { "0.98" } m a { "0.046" } m); el menor autovalor de información aumenta 111 veces y la traza de la CRLB baja al { "1.0" } % (umbral F3 MET). Esto supone que la órbita se conoce en los ejes lunares, con su error recogido en la sigma de distancia del orbitador de { "1" } m. MODELLED: un modelo restringido de tres cuerpos con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-377d29dcc6e8 = Precisión de los desfases entre las posiciones por medición láser de distancia, VLBI y GNSS de una nave, frente al error del enlace local en tierra, a partir de una ejecución real del motor v{ $version } sobre scenarios/lunar-infrastructure-space-tie.toml (un arco de 6,56 días, sigmas de técnica GNSS { "10" } m, VLBI { "1" } m, láser { "0.1" } m). Con un enlace local de { "1" } mm a { "1" } m, la sigma de traslación láser menos GNSS se mantiene cerca de { "1.04" } m hasta que el enlace llega a { "1" } m: está limitada por el ruido de medición de las técnicas, no por el enlace local. El mínimo fijado solo por el enlace es la raíz cuadrada de dos veces su sigma. MODELLED: un modelo restringido de tres cuerpos con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-9d507a371319 = Qué familia de observables es sensible a los números de Love lunares h2, k2 y l2, a partir de una ejecución real del motor v{ $version } sobre scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Cada celda es la derivada parcial RMS de las observaciones de una familia respecto a un parámetro, en las unidades propias de esa familia (de modo que las celdas se comparan a lo largo de una fila, no de una columna); un guion indica que la familia no tiene sensibilidad. Medición láser de distancia: h2 { "7.6" }, k2 ninguna, l2 { "9.8" }. Seguimiento del orbitador: h2 ninguna, k2 { "0.00086" }, l2 ninguna. Gravímetro de superficie: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 ninguna. Reloj de superficie: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 ninguna. Con las cuatro familias, la sigma de Cramer-Rao es el { "0.36" } % de h2 nominal, el { "0.52" } % de k2 y el { "1.16" } % de l2. Añadir una familia nunca redujo el menor autovalor ({ "28" } de { "28" } adiciones), pero la traza de la seudoinversa no fue mayor en solo { "16" } de { "28" }: esa mitad del umbral G3 es NOT MET. La familia del orbitador ve la integral a lo largo de la línea de visión de la aceleración de k2, una cifra de extremo superior. MODELLED: un modelo restringido de tres cuerpos con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# text
seg-570b9276834b = Simplificaciones declaradas

# text
# c1: geodesy-sensitivity
# c2: frame-coestimation
# c3: geodesy-sensitivity
seg-ab053aadb65d = La Tierra y la Luna como masas puntuales en órbita circular, sin Sol y sin armónicos del campo gravitatorio lunar; el eje de rotación de la Tierra es la normal de la órbita; el marco inercial coincide con el marco giratorio en t = { "0" }; una Luna esférica; un marco lunar síncrono (sin libración) salvo en <c1/>; la órbita se mantiene conocida en los ejes lunares en <c2/> (su error lo recoge la sigma de distancia del orbitador); la familia del orbitador de <c3/> ve la integral a lo largo de la línea de visión de la aceleración de k2 tras eliminar una constante y una tendencia lineal, una cifra de extremo superior.

# text
seg-fd644b1f33ec = Forma del informe

# text
# c1: kind
# c2: study
# c3: label
# c4: scenario_hash
# c5: units
# c6: units
# c7: docs/field-units-schema.json
seg-03efc65cbb0e = Cada informe lleva <c1/>, <c2/>, <c3/>, <c4/>, los campos del estudio y un bloque <c5/> (una unidad y una clase de procedencia para cada campo numérico). No se emiten series por instante. Listas de campos: el bloque <c6/> de cada informe, y <c7/>.

# text
# c1: earthstns_fx
seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), usado como valor nominal. h2 y l2 son puntos de linealización, no valores verificados. Las coordenadas de las estaciones de la DSN son los valores ITRF93 de los comentarios del kernel <c1/> de NAIF; las bandas de exactitud de la DSN se leyeron solo de resúmenes de búsqueda. El concepto de enlace espacial sigue las descripciones públicas de GRASP y ESA Genesis. La tabla completa, con la forma en que se leyó cada valor, está en el preregistro.

# text
seg-6cd670ae6eea = Resultados de un vistazo (véase RESULTS.md)

# text
seg-6334f82991d3 = No alcanzados, y fijados por pruebas que afirman el fallo: C3 (la métrica de error inyectado no se activa a { "3e-10" } m/s2), la mitad de la tasa por bootstrap de Q3 a { "1e-9" } y la mitad de la traza de CRLB de G3. La fijación de la ambigüedad entera no se logra con las entradas registradas. Nada es VALIDATED.

# text
seg-1d3bffc2fd02 = <s1>Anterior</s1>Navegación de usuarios espaciales (gnss-ssv)

# text
seg-90932eed0074 = <s1>Siguiente</s1>Posicionamiento, navegación y temporización LEO

seg-c3b27dfb7bca = <s1>Siguiente</s1>Hilo de misión: del lanzamiento a la entrada
