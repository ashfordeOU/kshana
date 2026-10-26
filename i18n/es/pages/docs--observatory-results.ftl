# docs--observatory-results: translations (es)

# text
# c1: docs/observatory/RESULTS.md
seg-69304b8b186b = Fuente: <c1/>

# text
seg-df5b53307f50 = Resultados del observatorio: catálogo retrospectivo de 30 días del Báltico y estudio de sensibilidad

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-072bdea11014 = Versión <c1/> sobre <c2/> (parámetros preregistrados en el método base, sin cambios). MODELLED: no hay referencia independiente externa, ni verdad de referencia, ni atribución de causa. Una celda degradada significa que una proporción alta de las aeronaves muestreadas allí informó de baja exactitud de navegación ese día; no dice por qué. Una celda no observada, o ausente, no se evaluó, lo cual no es lo mismo que despejada.

# text
seg-0d1eeedcab3a = Qué se ejecutó

# text
# c1: v<YYYY>.<MM>.<DD>-planes-readsb-prod-0
# c2: adsblol/globe_history_2026
# c3: scripts/fetch_adsblol_day.sh
# c4: back-catalogue/fetch/<tag>.parts.json
seg-df6ddf801a25 = <b>Fuente:</b> historial readsb de adsb.lol (ODbL { "1.0" }), versión de GitHub <c1/> de <c2/>, obtenida con <c3/> una parte cada vez (unos { "3.4" } GB al día, { "2" } partes). El editor no indica sumas de comprobación, así que el SHA-256 de cada parte queda registrado en <c4/>.

# text
# c1: scripts/observatory_backcatalogue.sh
seg-9fa2d2319ed3 = <b>Región y días:</b> el recuadro { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (sur, oeste, norte, este: el mar Báltico y sus costas), { "30" } días UTC del 2026-09-15 al 2026-10-14, celdas de { "0.5" } grados, mediante <c1/> (un día cada vez, con los archivos sin procesar eliminados tras cada día).

# text
# c1: method.scope
seg-8b65d148bbd8 = <b>Reglas de publicación:</b> el día más reciente (2026-10-14) llevaba más de { "24" } h desde su final cuando se produjo; el comando lo rechaza en caso contrario. Las ejecuciones regionales calculan la línea base de equipamiento y el fondo del día solo a partir de los informes del recuadro (<c1/>).

# text
# c1: back-catalogue/MANIFEST.json
seg-64581554e84a = <b>Archivos:</b> los { "120" } archivos de producto (GeoJSON, PNG, JSON de incidentes y un manifiesto por día) <b>no están en git</b>. El hash de cada archivo está en <c1/>, y un día puede reconstruirse a partir de su archivo y compararse.

# text
# c1: manifest.json
seg-c89b88dc3d3b = Ejemplo de lo que lee un día: el 2026-09-15 el archivo contenía { "110,619,797" } filas de posición en { "79,826" } archivos de traza; { "103.0" } millones estaban fuera del recuadro, { "5.6" } millones no eran ADS-B, { "1.2" } millones estaban en tierra o por debajo de { "5,000" } ft, { "0.6" } millones no llevaban campo de exactitud y { "212,426" } se agregaron (contadores de entrada de <c1/>).

# text
seg-cc590aa74075 = Tres días (2026-09-18, 2026-09-26, 2026-10-03) se obtuvieron de nuevo del archivo y se ejecutaron por segunda vez: el GeoJSON, el PNG y el archivo de incidentes son <b>idénticos byte a byte</b> a los de la primera ejecución (SHA-256 igual), de modo que el producto es determinista aunque la sal del hash de identificadores es aleatoria en cada ejecución.

# text
seg-3532be519183 = Resumen del catálogo retrospectivo

# text
seg-56aae646318e = día UTC

# text
seg-42784010b115 = celdas publicadas

# text
seg-2672b7f55371 = degradadas

# text
seg-378ee89e4bd3 = no degradadas

# text
seg-14783d89f2fe = no observadas (publicadas)

# text
seg-711d143678ae = incidentes

# text
# c1: not_observed
seg-0f1ffe21d381 = { "30" } días: { "96" } celdas degradadas en total, { "28" } de los { "30" } días con al menos una, { "70" } incidentes (grupos de celdas degradadas contiguas), ningún día con un efecto en todo el día. La proporción mediana de aeronaves afectadas por celda (el fondo del día) es { "0" } en { "29" } días y { "0.006" } en uno, de modo que la salvaguarda del fondo (una celda debe superar el fondo en { "0.15" }) nunca cambió un dictamen en esta región. El número de celdas degradadas por día va de { "0" } a { "8" } (media { "3.2" }). Alrededor de un tercio de las celdas publicadas cada día son <c1/> (muy pocas aeronaves muestreadas): la cobertura es el límite de este producto, no el cielo.

# text
seg-606aed861c95 = Lo que esto no dice: los días con más celdas degradadas no son «peores» en ningún sentido físico, un área afectada persistente se subestimaría (las aeronaves que vuelan solo dentro de ella todo el día no tienen línea base fuera y no se cuentan), y nada de lo aquí expuesto dice quién o qué causó la baja exactitud.

# text
seg-ef37626a4c47 = Estudio de sensibilidad (tres días)

# text
# c1: kshana interference-map sensitivity
# c2: sensitivity/<day>.json
seg-aacbb761ee19 = <c1/> reproduce los informes registrados de un día con cambios de uno en uno de los parámetros registrados (dos valores cada uno, más una cuadrícula de { "1.0" } grados). Días: 2026-09-18 (el mayor número de celdas degradadas, { "8" }), 2026-09-26 ({ "1" } celda degradada) y 2026-10-03 ({ "0" }). Informes completos: <c2/> ({ "23" } variantes cada uno; { "2.2" }, { "1.7" } y { "1.7" } millones de filas reproducidas). Celdas degradadas con cada variante (valor registrado entre paréntesis; el resultado registrado es { "8" }, { "1" } y { "0" } celdas degradadas):

# text
seg-dfced7e594d2 = parámetro (registrado)

# text
seg-2ac3e771679d = valor

# text
seg-0953dbfd76db = cuadrícula { "0.5" } grados

# text
seg-bf5746d1a110 = { "2" } (celdas más gruesas)

# text
seg-e4016df2fcd3 = Su lectura, sin elegir un ganador:

# text
seg-81cfcbf0de89 = Los dictámenes son sensibles a los umbrales de los códigos de exactitud y a las reglas de muestreo, y los recuentos pequeños varían mucho.

# text
# c1: low_nic_max
# c2: degraded_share
# c3: min_reports_per_aircraft_in_cell
# c4: low_nic_max
# c5: degraded_share
seg-097ed1aa1504 = <c1/>, <c2/> y <c3/> cambian cada uno el número de celdas degradadas en un factor de dos o más cada día; relajar <c4/> a { "6" } convierte { "1" } celda degradada en { "12" } el 09-26 (Jaccard con el conjunto registrado { "0.08" }). El 09-18, subir <c5/> a { "0.4" } conserva { "1" } de las { "8" } (Jaccard { "0.125" }). Un dictamen de celda cercano a los umbrales es una afirmación sobre los umbrales tanto como sobre los datos.

# text
# c1: min_aircraft_sampled
seg-0d0c96099d30 = <b><c1/> mueve sobre todo celdas entre no degradadas y no observadas</b>: el 09-18 deja el recuento de degradadas en { "8" } mientras que entre { "21" } y { "56" } celdas cambian de estado.

# text
# c1: background_margin
# c2: min_baseline_good_reports
# c3: day_confound_background
seg-04cc05318a5d = <b>Tres salvaguardas están inactivas aquí</b>: <c1/>, <c2/> y <c3/> no cambian nada en ninguno de los tres días (la proporción de fondo es { "0" }), de modo que esta región y este periodo no dicen nada sobre lo bien que funcionan. Importarían donde un efecto regional eleve el fondo.

# text
seg-7ba403b84fbd = <b>Una cuadrícula más gruesa ({ "1.0" } grado) cambia el panorama</b> ({ "2" }, { "3" } y { "1" } celdas degradadas; las celdas publicadas bajan a cerca de un tercio, { "226" } frente a { "694" } el 09-18, porque cada celda es cuatro veces mayor): el tamaño de celda es una decisión de método, y el observatorio lo fija en { "0.5" } grados.

# text
# c1: low_nic_max
seg-4db2f5313410 = Un día sin ninguna celda degradada registrada (10-03) tiene celdas degradadas con { "9" } de las { "22" } variantes que no son de cuadrícula (hasta { "8" } con <c1/> { "6" }): «ninguna celda degradada» es también una afirmación que depende de los umbrales.

# text
seg-a818be844f3a = Ninguna variante es una alternativa validada, y este estudio no cambia la regla registrada. El estudio no dice qué valores de los parámetros son los correctos.

# text
seg-98c799bfbc25 = <s1>Anterior</s1>Observatorio de interferencias: método

# text
seg-5d0c003e73dc = <s1>Siguiente</s1>kshana-bench
