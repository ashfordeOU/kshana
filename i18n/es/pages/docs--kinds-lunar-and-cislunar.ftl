# docs--kinds-lunar-and-cislunar: translations (es)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
# c1: independence
seg-f994c81583bf = Prueba de estimador independiente MODELLED del umbral de observabilidad de la longitud de arco cislunar. Ese umbral es una lectura de RANGO sobre la matriz de observabilidad ensamblada a partir de las filas ANALÍTICAS del jacobiano de distancia y de la matriz de transición de estado variacional ANALÍTICA, y su comprobación cruzada con el filtro de información de raíz cuadrada pliega esas mismas filas — una comprobación de consistencia entre dos máquinas numéricas, no una corroboración. Este tipo de escenario aporta el árbitro que faltaba: un estimador por lotes de mínimos cuadrados que RECUPERA realmente el estado inicial del jefe a partir de medidas simuladas, con las derivadas parciales de la medida tomadas como DIFERENCIAS FINITAS CENTRALES del modelo directo compuesto. No llama a ninguna fila jacobiana analítica, ni a ninguna STM variacional, ni a ninguna descomposición en valores singulares o propios, ni a ninguna tolerancia de rango, ni a ningún filtro de información de raíz cuadrada — una guarda de texto fuente en tests/cislunar_arc_recovery_reference.rs lo hace exigible — mientras que la dinámica (el mismo flujo CR3BP con RK4), las condiciones iniciales (la misma constelación corregida diferencialmente), el observable escalar y la malla de épocas se comparten deliberadamente y se nombran en el bloque <c1/> emitido, porque dos análisis de un mismo problema físico deben coincidir en la física para ser comparables. Dos criterios, cada uno barrido a lo largo de cinco décadas de su propio límite: RECUPERACIÓN SIN RUIDO (el error de estado final de cada ensayo con semilla es como mucho recovery_factor veces su desplazamiento a priori — el análogo del rango, sin tolerancia de valores singulares) y ESTIMABILIDAD DE MONTE CARLO (el error RMS de posición medido sobre un conjunto de ruido con semilla por debajo de un límite indicado — el análogo de la estimabilidad, medido en lugar de predicho). Admite el caso plano de cuatro estados y el espacial de seis estados, las familias DRO / halo L2 / NRHO L2, los observables de distancia y de velocidad de distancia, y una parametrización polar centrada en la Luna en la que la transformación se aplica al ESTADO y el modelo directo se vuelve a diferenciar allí. MEASURED en la malla DRO plana publicada: el estimador recupera el estado de cuatro componentes a partir de { "0.782609" } h frente a las { "2.086957" } h del criterio de rango con rel_tol { "1e-6" } (razón { "0.375" }) — el umbral de rango NO está corroborado como límite de recuperabilidad — mientras que el límite de estimabilidad medido cae en la misma celda de la malla que el formal, { "5.739130" } h, y la curva de error medida reproduce el 1 sigma formal sobre { "21" } longitudes de arco con una razón de media geométrica de { "0.98" }. MODELLED: el diseño de la constelación, la malla de épocas, el único enlace con seguimiento, la magnitud del desplazamiento, el sigma de medida y los dos límites indicados. No es un producto de prestaciones de navegación certificado.

# attr:alt
seg-2fe411ae2153 = El gráfico que escribe el motor para scenarios/cislunar-arc-recovery.toml, tipo de escenario cislunar-arc-recovery

# text
seg-7ccd0a3babb8 = Observabilidad MODELLED de una constelación cislunar plana (P6): sigue una constelación de cuatro naves con DRO plana corregida diferencialmente mediante distancias intersatélite e informa de cuánto del estado de cuatro componentes [x,y,ẋ,ẏ] de una nave hace observable el arco. Emite ({ "1" }) la tabla de rango frente a longitud de arco para un único enlace solo de distancia — instantáneamente de rango 1, creciendo hacia el estado completo de cuatro componentes a medida que el arco se extiende (tabla { "1" } de P6); ({ "2" }) el espectro de valores propios del gramiano de observabilidad y el número de condición a lo largo del arco; ({ "3" }) la comparación del rango instantáneo solo de distancia frente a distancia más velocidad de distancia (la palanca de diseño del Doppler) junto con la notificación del GDOP singular solo de distancia y definido con distancia más velocidad; y ({ "4" }) una validación cruzada independiente con SRIF cuya covarianza a posteriori pasa a ser finita y bien condicionada exactamente en el arco en el que el rango observable alcanza cuatro. Núcleo VALIDATED: el rango observable es un umbral de valores singulares que revela el rango, contrastado con el rango de valores propios del gramiano; el espectro de valores propios obedece a los invariantes espectrales (traza=Σλ, det=Πλ, Frobenius²=Σλ²); la STM variacional es la STM de CR3BP validada por diferencias finitas; las filas jacobianas de distancia y de velocidad de distancia son derivadas parciales analíticas validadas por diferencias finitas (contrastadas con el observable de velocidad de distancia 3-D del crate); las cuatro condiciones iniciales son DRO planas corregidas diferencialmente que cierran con un residuo de periodicidad ajustado y son retrógradas; la transición de rango se valida de forma cruzada con el filtro de información de raíz cuadrada del crate (covarianza a posteriori finita exactamente con rango completo, cond(P)=cond(OᵀO)); una instantánea deficiente en rango se marca como GDOP-indefinido (fim condition=inf), nunca como un valor finito falso — la misma guarda de geometría singular que aplica pvt::solve_spp. MODELLED: el diseño de la constelación (amplitudes y fases del perilunio de las DRO) y la progresión de rango concreta que produce. No es un producto de prestaciones de navegación certificado.

# attr:alt
seg-f15bbf30b0dd = El gráfico que escribe el motor para scenarios/cislunar-observability.toml, tipo de escenario cislunar-observability

# text
seg-c8a8be4b8894 = Recepción de GNSS terrestre a distancia lunar, la capa de señal débil que nombra el artículo sobre resiliencia ante conflictos y para la que el motor no tenía modelo. Un satélite GNSS apunta su antena hacia la Tierra; un receptor cerca de la Luna está a unas quince veces el radio orbital, de modo que tres cosas pesan a la vez. La Tierra OCULTA EL EJE DE APUNTAMIENTO: desde { "26,560" } km subtiende un semiángulo de { "13.9" } deg, de modo que todo rayo con destino lunar debe salir del transmisor al menos con ese ángulo respecto al nadir, lo que elimina el máximo del haz antes de calcular ninguna potencia. Lo que queda es el BORDE DEL LÓBULO PRINCIPAL Y LOS LÓBULOS LATERALES, el régimen en el que el instrumento LuGRE operó realmente en { "2025" }. Y la pérdida en espacio libre es de unos { "208" } dB en L1, aproximadamente { "25" } dB más de lo que paga un usuario terrestre. El informe emite una fila por satélite (ángulo fuera del eje de apuntamiento, ocultación por la Tierra, distancia, pérdida de trayecto, ganancia de transmisión a ese ángulo, potencia recibida, densidad de ruido de portadora) y agrega solo los enlaces que superan el umbral de seguimiento. TAMBIÉN INFORMA DEL CONDICIONAMIENTO, porque eso es lo que define esta capa: todo satélite visible queda dentro de un cono de un par de grados de anchura visto desde la Luna, por lo que las líneas de visión son casi paralelas, la dilución de la precisión es enorme, y una solución de GNSS terrestre a distancia lunar es una observación de grado de TEMPORIZACIÓN mucho más que de grado de posición. MODELLED, y el motivo es el patrón de transmisión: la ganancia a un ángulo es una apertura circular uniforme (Airy), mientras que una antena GPS L1 real es una agrupación helicoidal de doce elementos con un lóbulo principal conformado y lóbulos laterales no Airy. Existen patrones medidos y no se incorporan aquí al repositorio, así que los órdenes y los órdenes de magnitud son significativos, pero no los dB de un satélite concreto. Deliberadamente AUSENTES, y cada una hace optimista el balance: ninguna pérdida ionosférica ni troposférica en los rayos rasantes al limbo, ninguna pérdida de polarización, de apuntamiento ni de implementación, y una Tierra esférica sin extensión refractiva. La posición de la Luna es una ENTRADA (distancia más dirección inercial) y no una consulta de efemérides, porque la magnitud sometida a prueba es el enlace y la geometría del haz. Elevar esta fila a validada requiere un patrón de transmisión medido y puntos normales de LuGRE; ninguno está en el repositorio y ninguno se inventa aquí.

# attr:alt
seg-cf1dce5fc824 = El gráfico que escribe el motor para scenarios/earth-gnss-lunar.toml, tipo de escenario earth-gnss-lunar

# text
seg-004c56ded47f = Superficie de ataque a la seguridad de señales de navegación en la superficie lunar (P1): compone los análisis abiertos de seguridad de señales en una única ejecución alcanzable desde el binario. Informa de ({ "1" }) la potencia recibida de AFS y su SUPERÁVIT de potencia frente a una referencia terrestre de GPS, además de la banda de sensibilidad de 12-18 dB como un barrido genuino multieje sobre las entradas del enlace (nivel de referencia x EIRP x distancia oblicua) con la conciliación del factor lineal de 25x redondeado / 28x sin redondear. REVISADO (regla R4): esto informaba de un DÉFICIT de potencia de { "15.6" } dB y de un factor de 32x/36x hasta que se corrigió la referencia de GPS de -125 / -128.5 (que son las cifras en dBm) a -155 / -158.5 dBW, los valores del ICD-GPS-200 que el módulo de jamming siempre ha llevado. El signo se invierte: la señal AFS lunar modelada es { "14.4" } dB MÁS FUERTE que la de GPS L1 C/A terrestre, no más débil. La potencia recibida en sí no se movió ni un bit, y el factor lineal es el antiguo dividido exactamente por { "1000" }, que es exactamente el desfase de { "30" } dB de dBm a dBW; ({ "2" }) la potencia de transmisión que necesita el atacante para falsificar (J/S = { "3" } dB) y para denegar (J/S = { "30" } dB) a cada distancia de seguridad, la inversa del enlace J/S; ({ "3" }) la huella de captura orbital bajo un patrón real de antena de apertura uniforme (Airy [{ "2" } J1(x)/x]^{ "2" }), un casquete subhemisférico limitado por altitud cuyo limbo NO se captura; ({ "4" }) un resultado calculado de enganche forzado de captura de falsificación del lazo de seguimiento (si un falsificador de código coincidente con una ventaja de potencia y un desfase de código dados arrastra realmente el DLL/PLL) en lugar del umbral afirmado de { "3" } dB; ({ "5" }) el alcance del horizonte geométrico de un transmisor de superficie elevado en un cuerpo sin atmósfera; y ({ "6" }) el presupuesto de autenticación OSNMA/TESLA (sobrecarga de { "20" } bit/s = ~{ "40" } % de un mensaje de navegación AFS de { "50" } bit/s, latencia de divulgación de clave, falsificación { "2" }^-40). Un cuerpo vacío reproduce la línea base de P1; toda entrada tiene un valor por defecto y puede sobrescribirse. Los subresultados VALIDATED llevan la referencia independiente de su módulo de origen (radiometría en dB de forma cerrada; ida y vuelta de J/S inverso; patrón de Airy frente a Bessel de A&S y geometría de casquete esférico; enganche forzado de DLL/PLL frente a Kaplan & Hegarty; identidad de horizonte tangente esférico frente a eo_payload; dimensionado de campos del SIS-ICD de OSNMA). MODELLED: las magnitudes representativas de geometría/potencia y los valores concretos de las celdas del mapa de captura. No es un producto de seguridad certificado.

# attr:alt
seg-de295af20c55 = El gráfico que el motor escribe para scenarios/lunar-attack-surface.toml, tipo de escenario lunar-attack-surface

# text
seg-142ad48fe422 = Aumento con balizas de superficie de un servicio de navegación orbital lunar, como una tabla antes/después ejecutable. Un usuario en el polo sur ve un conjunto orbital disperso en una franja estrecha de cielo, por lo que la geometría de medición de distancia está mal condicionada; unas pocas BALIZAS DE SUPERFICIE TOPOGRAFIADAS aportan las filas de línea de visión de baja elevación y amplio acimut de las que carece un conjunto totalmente cenital, y la dilución de precisión horizontal se desploma. El escenario informa de tres configuraciones en una época: solo satélites, satélites más las balizas visibles, y una constelación mayor como vía alternativa a la misma geometría, cada una con sus recuentos de fuentes visibles, su DOP completo y la precisión de 1 sigma lograda en METROS, obtenida al multiplicar por un error equivalente de medición de distancia por baliza para el usuario, ensamblado como suma cuadrática de términos de sincronización de reloj, de multitrayecto y de topografía. La visibilidad de las balizas es el horizonte geométrico de dos alturas de una Luna sin atmósfera (sin atmósfera, de modo que la cota es exacta), y el ensamblado del DOP es el mismo núcleo contrastado con gnss_lib_py en tests/dop_reference.rs. POR QUÉ EXISTE ESTE TIPO DE ESCENARIO: el módulo que hay detrás está en el motor y se ha contrastado con una vía de DOP independiente desde L08/L09, pero no era alcanzable desde una ejecución: sin tipo de escenario, sin rama de despacho, sin archivo incluido. El README anunciaba la capacidad y la matriz de verificación NO tenía ninguna fila para ella, de modo que estaba a la vez afirmada en la prosa y sin afirmar en el registro, siendo inalcanzable en el motor. Los valores por defecto son la geometría que ya tiene un golden confirmado (un usuario a -80 deg con una antena de { "2" } m, tres balizas a -80/0, -79/+{ "60" } y -79/-60 a { "2" } km, una instantánea ilustrativa de seis satélites LCNS en t={ "0" }, una máscara de { "5" } deg), de modo que una ejecución básica reproduce una tabla que una referencia independiente ya cubre en lugar de inventar cifras nuevas. MODELLED: el diseño de la constelación, la colocación de las balizas y toda magnitud del presupuesto de errores son entradas ilustrativas, no un levantamiento desplegado ni un enlace medido; solo la aritmética del DOP, la forma cerrada del horizonte y la relación sigma = DOP x sigma_URE están ancladas externamente. No es un compromiso de rendimiento del servicio.

# attr:alt
seg-a53e353706f6 = El gráfico que el motor escribe para scenarios/lunar-beacon.toml, tipo de escenario lunar-beacon

# attr:alt
seg-8e67df89448a = El gráfico que el motor escribe para scenarios/lunar-differential-pnt.toml, tipo de escenario lunar-differential-pnt

# text
seg-55679aff66db = Datum de marco de siete parámetros de Helmert (similitud) obtenido de una CAMPAÑA DE OBSERVACIÓN SIMULADA y no de una transformación inyectada. Una red de estaciones terrestres observa un catálogo de balizas de la superficie lunar según un calendario explícito; las parciales del retardo de VLBI lunar se acumulan sobre ese calendario en una matriz de información de Fisher de las coordenadas de las balizas exactamente como hace lunar-vlbi-fim; y esa información se propaga a través del diseño de Helmert A = [I3 | [p]_x | p] en los puntos del catálogo hasta la covarianza del datum H = A^T M_b A, diagnosticada por crate::fim::crlb. NO se inyecta ninguna transformación y no se recupera nada de una respuesta plantada, de modo que la precisión del datum informada se deriva del programa de observación: reducir a la mitad la sigma del retardo la reduce exactamente a la mitad, y alargar el arco la mejora porque la libración que el informe MIDE (sub_earth_direction_sweep_deg) es lo que separa la coordenada de la baliza en la línea de visión de las del plano del cielo. El rango, el defecto de datum, el número de condición, el espectro completo, las direcciones inobservables EN LA BASE DE SIETE PARÁMETROS, la dirección más débil incluso con rango completo y la parte de ella que corresponde a cada parámetro se emiten en cada ejecución; un parámetro que la campaña no restringe se publica como NULL con un estado, nunca leído de una inversa casi singular. La correlación del error de las balizas se mide, no se supone: con las estaciones fijas ninguna observación toca dos balizas, de modo que la matriz de información es exactamente diagonal por bloques (offblock_fraction { "0" }), y con las estaciones estimadas el bloque marginalizado por Schur está acoplado, con la correlación inducida impresa y toda la propagación repetida descartándola, de modo que el precio de una suposición de independencia es un número. La misma propagación con una sigma isótropa por coordenada, y el error de recuperación que informa el escenario lunar-frame-realisation, se ejecutan ambos aquí y se imprimen junto al valor de la campaña con sus razones. MODELLED: el catálogo de balizas tiene fuente pero la CAMPAÑA es simulada: la red de estaciones y la sigma del retardo son entradas ilustrativas, las observaciones de retardo individuales se tratan como independientes, y las efemérides del centro de la Luna, los relojes de las estaciones, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS, de modo que la covarianza del datum es una cota de Cramer-Rao para un conjunto reducido de parámetros. No es un producto geodésico.

# attr:alt
seg-883d94b321b4 = El gráfico que el motor escribe para scenarios/lunar-frame-campaign.toml, tipo de escenario lunar-frame-campaign

# text
seg-0c4c119abfca = Realización modelada del marco de referencia lunar: un ajuste de datum de Helmert (similitud) de 7 parámetros ({ "3" } de traslación, { "3" } de rotación de ángulo pequeño, { "1" } de escala) que liga un conjunto estimado de coordenadas de puntos MCMF derivadas de lo selenográfico a un datum mediante mínimos cuadrados ponderados (crate::batch_ls::gauss_newton), más un sencillo enlace de orientación que expresa la pequeña rotación realizada en torno a los ejes ICRF respecto de la orientación del cuerpo WGCCRE de la IAU { "2015" }. El escenario inyecta una transformación pequeña conocida (traslación ~decenas de m, rotación ~µrad, escala ~{ "1e-7" }) en una red sintética de puntos bien repartidos, añade ruido gaussiano con semilla, recupera el datum e informa de la transformación recuperada, del error de recuperación por parámetro frente a la verdad inyectada y del residuo RMS posterior al ajuste. Autocoherencia MODELLED: recupera una transformación de similitud inyectada (sin ruido hasta ~precisión de máquina), NO es una realización frente a datos reales de seguimiento/VLBI; determinista (con semilla); sin TRL/herencia/respaldo de ninguna agencia.

# attr:alt
seg-f3a6d69d0225 = El gráfico que el motor escribe para scenarios/lunar-frame-realisation.toml, tipo de escenario lunar-frame-realisation

# text
# c1: study
seg-d0fb90f506c9 = Estudios MODELLED de la órbita y la superficie de la Luna como infraestructura de navegación y geodésica, cinco estudios tras un único tipo de escenario seleccionado por <c1/>: od-consistency (determinación de órbita a bordo con Earth-GNSS en una NRHO o ELFO frente a una determinación de órbita radiométrica terrestre independiente, juzgadas por sus propias covarianzas sobre un Monte Carlo con semilla), carrier-phase (fase de portadora de doble diferencia conjunta superficie-orbitador y resolución de ambigüedades enteras con LAMBDA), frame-coestimation (una estación de superficie y orbitadores añadidos a la medición de distancia de estaciones terrestres para el datum de marco lunar de siete parámetros), space-tie (GNSS, VLBI y telemetría láser en una misma nave, precisión del enlace de marco frente al error del enlace local) y geodesy-sensitivity (información de Fisher de los números de Love lunares h2, k2, l2 y de la libración física a partir de telemetría láser, seguimiento de orbitadores, un gravímetro de superficie y un reloj de superficie). Un modelo restringido de tres cuerpos con simplificaciones declaradas; la numérica se contrasta con programas independientes y nada se compara con una medición de una magnitud lunar.

# text
seg-f3b4a80a739b = sin gráfico: el ejemplo no escribe ningún gráfico

# text
seg-4b6daea39f5c = Paso de nivel de protección ARAIM en el polo sur lunar frente a un conjunto representativo de relés LunaNet. sigma_ure_m expone la precisión de medición de distancia de la señal en el espacio (los niveles de protección escalan linealmente con ella, de modo que barrerla responde qué precisión de medición de distancia exige un límite de alerta). Por defecto, el caso histórico de clase LNIS del polo sur.

# attr:alt
seg-610fa190a393 = El gráfico que el motor escribe para scenarios/lunanet-araim.toml, tipo de escenario lunar-integrity

# text
seg-5a4dcb93a643 = Exportación de interoperabilidad lunar modelada: emite el marco de referencia lunar, la escala de tiempo lunar y las efemérides lunares en formas de intercambio alineadas con LunaNet/IOAG y basadas en CCSDS, con ajuste a la norma de ida y vuelta / de campos. REUTILIZA el emisor+analizador CCSDS OEM { "2.0" } del crate (crate::oem) reetiquetado para el contexto lunar: el REF_FRAME de OEM lleva el marco de cuerpo lunar WGCCRE de la IAU { "2015" } (MOON_ME / MOON_PA), TIME_SYSTEM la escala de tiempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON, sobre unas efemérides ilustrativas de muestra de clase LCNS (posiciones de crate::lunar_service, velocidad por diferencia finita). Emite también un descriptor de tiempo lunar alineado con LunaNet/IOAG (id de escala, tasa secular µs/día de crate::lunar_time, banda publicada, superficie de referencia) que hace ida y vuelta mediante serde_json, y envuelve los artefactos en la envoltura KIF existente (crate::interchange) con la etiqueta de honestidad MODELLED. Informa de los artefactos emitidos, el número de líneas de OEM, la superación del ajuste a la norma de campos + la lista de campos presentes/ausentes, la ida y vuelta de OEM correcta, la ida y vuelta de metadatos de tiempo correcta y el tamaño en bytes de KIF. MODELLED: la referencia independiente es la ida y vuelta determinista + el ajuste a la norma de los nombres de campo frente a la semántica de campos publicada de CCSDS OEM + LunaNet/IOAG; NO es una prueba certificada de ajuste a la norma de interoperabilidad; efemérides ilustrativas de fuente pública, sin afiliación a la ESA; sin TRL/herencia/respaldo de ninguna agencia.

# attr:alt
seg-0e86ff364c17 = El gráfico que el motor escribe para scenarios/lunar-interop-export.toml, tipo de escenario lunar-interop-export

# text
# c1: jamming
seg-a91a9ad5d8d1 = Jamming de RF nativo lunar: razón interferente-señal por satélite, C/N₀ efectivo y pérdida de enganche para un usuario en la superficie selenográfica bajo un jammer en la superficie lunar (o elevado), sobre la constelación ilustrativa de órbita lunar de clase Moonlight/LCNS de fuentes públicas. Compone la física abierta de jamming existente (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) con la geometría de cielo lunar existente (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); no se vuelve a derivar ninguna geometría ni radiometría. A diferencia del tipo de escenario terrestre <c1/>, el tramo de señal NO es una potencia recibida fija: la potencia recibida isótropa de cada satélite es su propio presupuesto de enlace EIRP − FSPL(distancia oblicua), de modo que el J/S varía de un satélite a otro con la distancia y la elevación lunares. Informa de UNA FILA POR ENLACE (época, satélite) VISIBLE: acimut, elevación, distancia oblicua, ambas potencias recibidas cuya diferencia es el J/S, el J/S, el C/N₀ nominal y efectivo y el estado de enganche, además de cifras de mérito agregadas junto a esa tabla (nunca en su lugar), y la misma tabla como artefacto CSV. Todo campo numérico emitido lleva una unidad y una clase de procedencia. Los subresultados VALIDATED llevan la referencia independiente de su módulo de origen (la ecuación antijamming y el enlace J/S de Kaplan & Hegarty §{ "9.4" }, con referencia externa en tests/gnss_denied_jamming_resilience_reference.rs; la geometría lunar de lunar_service). La propia composición se contrasta con una vía independiente de dos presupuestos de enlace (linkbudget::received_signal_power_dbw, una expresión distinta de pérdida en espacio libre) hasta { "1e-9" } dB. MODELLED: la constelación ilustrativa, el EIRP / la potencia del jammer / las ganancias de antena / la temperatura de ruido representativos, y la ausencia de sombra del terreno, multitrayecto, dinámica de AGC y anulación adaptativa. No es un producto certificado de denegación de servicio. Con un jammer configurado, el informe lleva además un CONTORNO DE DENEGACIÓN CON UNA BANDA DE INCERTIDUMBRE en lugar de un contorno leído de un único escalar: la distribución completa medida del C/N₀ de la señal deseada sobre la tabla por satélite (n, mín., p05, p25, mediana, p75, p95, máx., media, desviación típica muestral y la propia asimetría de la muestra), y el contorno evaluado en cada uno de esos estadísticos de orden bajo AMBOS criterios de denegación que reconoce el motor (el vigente de razón de potencias, J/S = { "30" } dB, como en attack-surface y tracking-loop, y el de pérdida de enganche, con el C/N₀ efectivo cayendo a tracking_threshold_dbhz, el criterio que usa la propia columna de estado de este informe) en ambos ejes del plano de denegación (EIRP de jammer requerido a la distancia de seguridad del escenario, distancia de seguridad de denegación al EIRP del escenario). Los bordes de la banda SON contour(p05) y contour(p95), el mismo mapa de forma cerrada aplicado a los propios cuantiles de la muestra: no una sigma ajustada a la muestra ni la mediana ± k·desviación típica, con la desviación típica emitida por continuidad y no usada por nada. Un cuantil que ya está en el umbral de seguimiento o por debajo no tiene J/S de denegación finito y sus columnas de pérdida de enganche son nulas con una razón contada, nunca un radio acotado artificialmente.

# attr:alt
seg-6fe8b3c6c584 = El gráfico que el motor escribe para scenarios/lunar-jamming.toml, tipo de escenario lunar-jamming

# text
seg-200e58e189c2 = Estimador por lotes conjunto multitécnica modelado de OD lunar + reloj sobre una red SIMULADA: un ajuste instantáneo de Gauss-Newton que fusiona retardos de VLBI geodésico de línea base terrestre, distancias locales lunares estación↔satélite y distancias entre satélites para recuperar, a la vez, la posición 3D de una estación de superficie lunar, las posiciones de una pequeña constelación y el desfase de reloj de cada elemento a partir de una verdad inyectada. El resultado principal honesto, que el VLBI hace observable la posición 3D completa de la estación allí donde la medición de distancia solo local lunar deja una dirección débilmente observada, se informa como el contraste de error de estación con y sin VLBI. Recuperación simulada en lazo cerrado MODELLED (la verdad comparte el modelo de observación), determinista (con semilla), NO validada con datos reales; sin propagación de modelo de fuerzas dentro del resolutor; sin TRL/herencia/respaldo de ninguna agencia.

# attr:alt
seg-cfa051b87e59 = El gráfico que el motor escribe para scenarios/lunar-joint-od-clock.toml, tipo de escenario lunar-joint-od-clock

# attr:alt
seg-e4da113cbe18 = El gráfico que el motor escribe para scenarios/lunar-llr-datum.toml, tipo de escenario lunar-llr-datum

# text
seg-f7ea776e70c9 = Cobertura modelada de estaciones de referencia lunares: un barrido de Monte Carlo del modelo de PNT diferencial lunar sobre una cuadrícula de usuarios del polo sur y un día de épocas. Una estación de referencia diferencial en un emplazamiento conocido del polo sur corrige una constelación declarada (kepleriana ilustrativa o unas efemérides tabuladas) con un error declarado de señal en el espacio, un error de topografía, una latencia de corrección y una cuantización del enlace; por punto y sobre la región informa del percentil del error de posición corregido y sin corregir (3D, horizontal, vertical), la disponibilidad, la cobertura frente a un umbral declarado, los niveles de protección DO-229E, el radio de cobertura por acimut y el presupuesto del enlace de corrección en la estación y en el peor punto. No es una afirmación sobre el rendimiento de ningún sistema real; sin afiliación ni respaldo de ninguna agencia. MODELLED.

# attr:alt
seg-922b8656fcae = El gráfico que el motor genera para scenarios/lunar-station-coverage.toml, tipo de escenario lunar-station-coverage

# text
seg-cac3a0bcbfc6 = Presupuesto de error de tiempo MODELLED de extremo a extremo del Tiempo Lunar Coordinado (LTC): los siete términos de error del LTC reunidos como curvas de error de tiempo x_i(τ) sobre toda una cuadrícula de tiempos de promediado, sumados en raíz cuadrática en x_Σ(τ), y el τ de CRUCE reloj-marco en el que el término creciente del reloj supera al término constante de realización del marco en tiempo real (por debajo de él el presupuesto está limitado por el marco, por encima, por el reloj): la respuesta honesta al artefacto de un único τ. Las pendientes en τ son de forma cerrada y comprobables analíticamente (reloj τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, suelos τ^{ "0" }, medida τ^{ "{" }-1/2{ "}" }) y las filas de reloj reproducen las especificaciones publicadas de reloj a un día (crate::clock_specs); las MAGNITUDES de los suelos del enlace de RF u óptico, de la realización del marco, del residuo relativista y de las efemérides son asignaciones de presupuesto modeladas (valores por defecto documentados, sustituibles por quien llama), no mediciones. La aportación es el τ de cruce reproducible, no una cifra por término certificada; no certificado para la medición del tiempo operativa.

# attr:alt
seg-56fe184f2a12 = El gráfico que el motor genera para scenarios/lunar-time-budget.toml, tipo de escenario lunar-time-budget

# text
seg-7f3e13712f10 = Tasa relativista modelada del reloj Tierra-Luna (Tiempo Coordenado Lunar, LTC/TCL): la tasa secular LTC−TT a partir de la diferencia de potencial propio y del término cinético de la Luna, indicada con la banda publicada de { "56" }–{ "59" } µs/día, más el desfase acumulado a lo largo de un horizonte.

# attr:alt
seg-e9deb6ed41c1 = El gráfico que el motor genera para scenarios/lunar-time-offset.toml, tipo de escenario lunar-time-offset

# text
seg-1bc37634ba9f = Covarianza de las coordenadas de estación del VLBI lunar: las derivadas parciales del retardo de la observable lunar-vlbi acumuladas a lo largo de un CALENDARIO explícito (líneas base x épocas) en una matriz de información de Fisher, invertida e indicada como la covarianza de las coordenadas de estación y la sigma de estación por coordenada: una salida calculada por el motor, y no una precisión escalar del retardo pasada por un factor de equipartición isótropo supuesto g = { "3" }. El estado lleva coordenadas de estación FIJAS a la Tierra (ITRS), de modo que el jacobiano es la derivada parcial inercial rotada por la matriz GCRS->ITRS de cada época: la rotación terrestre es lo que hace observables esas coordenadas, y el informe MIDE el barrido de la línea de visión fija a la Tierra y la declinación de la baliza en lugar de suponerlos. Una observación es un par (línea base, época) con AMBAS estaciones por encima de la máscara de elevación, ponderado con 1/delay_sigma_s^{ "2" }. Indica rango, defecto de datum, número de condición, el espectro completo de información, la matriz de covarianza, las sigmas por estación y por eje y en 3-D, y el espacio nulo de la red libre en cada ejecución; ante una deficiencia de rango, la sigma principal se publica como NULL con un estado, nunca se lee de una inversa casi singular. El valor de equipartición c<em>delay_sigma_s</em>sqrt(g/N) para el MISMO calendario se emite junto al valor calculado con el cociente, junto con la cota isótropa de traza sqrt(p/trace(M)) que AM-HM convierte en un suelo estricto, de modo que el cociente es la anisotropía que descartaba el supuesto. El cierre del retardo tau_ik = tau_ij + tau_jk hace que solo n-1 de las n(n-1)/2 líneas base sean geométricamente independientes; el informe indica ambos recuentos. MODELLED: las efemérides del centro de la Luna, los relojes de estación, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS y las observaciones se tratan como independientes, de modo que la covarianza es una cota de Cramer-Rao para un conjunto reducido de parámetros, no un resultado de sesión predicho; la sigma del retardo, las coordenadas de estación y el calendario son entradas. La derivada parcial que el jacobiano del retardo geométrico omite (el término de Shapiro diferenciado) se mide por diferencias finitas y se emite. No es un producto geodésico.

# attr:alt
seg-19c383444296 = El gráfico que el motor genera para scenarios/lunar-vlbi-fim.toml, tipo de escenario lunar-vlbi-fim

# text
seg-e01f77d493a0 = Observable modelada del retardo de VLBI geodésico lunar: una línea base terrestre (dos estaciones en tierra, GCRS) observa una señal unidireccional de una baliza de superficie lunar de clase NovaMoon. Emite el retardo de campo cercano como diferencia de dos distancias, su tasa y la corrección de campo cercano por curvatura del frente de onda a lo largo de un pase, contrastada con la observable Δ-DOR de onda plana del mismo código en el límite de campo lejano, con derivadas parciales verificadas por diferencias finitas. La vía analítica por defecto es MODELLED y lleva las salvedades de coherencia de marcos, de movimiento polar xp=yp={ "0" } y de onda plana frente a campo cercano. Si se establecen planetary_kernel_path, earth_orientation_kernel_path y moon_orientation_kernel_path, se ejecuta en su lugar la vía de núcleos (DE440, MOON_PA_DE440, ITRF93; tiempos de luz baricéntricos convergidos; añade las derivadas parciales de la baliza y de la estación de la época), cuyo retardo newtoniano y cuyas derivadas parciales coinciden con los tiempos de luz convergidos de NAIF SPICE hasta { "0.06" } ps y { "7.4e-9" }. No validado con datos reales de VLBI.

# attr:alt
seg-07d97fc1abac = El gráfico que el motor genera para scenarios/lunar-vlbi.toml, tipo de escenario lunar-vlbi

# attr:alt
seg-edb738273a3a = El gráfico que el motor genera para scenarios/moonlight-service-volume.toml, tipo de escenario moonlight-service-volume

# text
seg-4e31c8daf798 = Registro

# text
seg-efd15cff3d32 = MODELLED (etiqueta del resultado)

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/lunar-and-cislunar.md
seg-a240ef37dc6d = Fuente: <c1/>

# text
seg-befef5f2f8dd = Lunar y cislunar (familia de tipos de escenario)

# text
seg-f964724ea446 = { "20" } tipos de escenario del motor v{ $version }. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-369e7cfcc1d3 = Páginas temáticas: <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. Ejecute uno: <c1/>. Todas las familias: <a4>KINDS.md</a4>.

# attr:alt
seg-15b8e26dc24b = Hoja de contactos de los gráficos que genera el motor para los tipos de escenario de la familia Lunar y cislunar

# text
seg-fd2a12be04c2 = Pasada del nivel de protección de ARAIM en el polo sur lunar frente a un conjunto representativo de relés LunaNet.

# text
seg-240eb5858113 = Tasa relativista modelada del reloj Tierra–Luna (Tiempo Coordinado Lunar, LTC/TCL): la tasa secular LTC−TT a partir de la diferencia de autopotencial y del término cinético de la Luna, presentada con el { "56" }–{ "59" }

# text
seg-177bff8d753e = Presupuesto MODELLED de error de tiempo de extremo a extremo del Tiempo Lunar Coordinado (LTC): los siete términos de error del LTC reunidos como curvas de error de tiempo x_i(τ) sobre toda una malla de tiempos de promediado, sumados en raíz cuadrada en x_Σ(τ), y el c

# text
seg-df0437ef8324 = Observable modelado del retardo VLBI geodésico lunar: una línea de base terrestre (dos estaciones en tierra, GCRS) observa una señal unidireccional de una baliza en la superficie lunar de clase NovaMoon.

# text
seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

# text
seg-38254487fb7f = Covarianza de las coordenadas de estación de VLBI lunar: las derivadas parciales del retardo del observable lunar-vlbi acumuladas a lo largo de un CALENDARIO explícito (líneas de base x épocas) en una matriz de información de Fisher, invertida, y se pre

# text
seg-23706714da99 = Estimador por lotes modelado, conjunto y multitécnica, de OD lunar + reloj sobre una red SIMULADA: un ajuste instantáneo de Gauss-Newton que fusiona retardos VLBI geodésicos de línea de base terrestre, distancias locales lunares estación↔satélite

# text
seg-2359450b3967 = Realización modelada del marco de referencia lunar: un ajuste de datum de Helmert (de semejanza) de 7 parámetros —{ "3" } de traslación, { "3" } de rotación de ángulo pequeño, { "1" } de escala— que vincula un conjunto estimado de puntos MCMF derivados de coordenadas selenográficas

# text
seg-2a5af9961e99 = Datum de marco de Helmert (de semejanza) de siete parámetros, determinado por una CAMPAÑA DE OBSERVACIÓN SIMULADA y no por una transformación inyectada.

# text
seg-3615bea1ea75 = Datum de marco lunar de Helmert de siete parámetros, determinado por una campaña de observación REAL y archivada y no por una simulada.

# text
seg-ed4ec8b6378c = Cobertura modelada de una estación de referencia lunar: un barrido Monte Carlo del modelo de PNT diferencial lunar sobre una malla de usuarios en la región polar sur y un día de épocas.

# text
seg-aeec32be6092 = Aumentación con balizas de superficie de un servicio de navegación orbital lunar, como una tabla ejecutable de antes y después.

# text
seg-b28693368acd = Exportación modelada de interoperabilidad lunar: emite el marco de referencia lunar, la escala de tiempo lunar y las efemérides lunares en formas de intercambio basadas en CCSDS y alineadas con LunaNet/IOAG, con comprobaciones de ida y vuelta y de ajuste a la norma por campo

# text
seg-d88605893c05 = Observabilidad MODELLED de una constelación cislunar plana (P6): sigue una constelación plana de DRO con corrección diferencial de cuatro naves con medición de distancias entre satélites e informa de cuánto de una nave

# text
seg-8eaec90d1df5 = Prueba MODELLED con un estimador independiente del umbral de observabilidad de la longitud de arco cislunar.

# text
seg-9619b3d699c6 = Superficie de ataque a la seguridad de la señal de navegación en la superficie lunar (P1): compone los análisis abiertos de seguridad de la señal en una única ejecución accesible desde el binario.

# text
seg-64c78e211181 = Jamming de RF de origen lunar: relación jammer-señal por satélite, C/N₀ efectivo y pérdida de enganche para un usuario selenográfico en superficie bajo un jammer en la superficie lunar (o elevado), sobre la constelación pública ilustrativa

# text
seg-df68720ee7a5 = Recepción de GNSS terrestre a distancia lunar, la capa de señal débil que nombra el artículo sobre resiliencia ante conflictos y para la que el motor no tenía modelo.

# text
# c1: study
seg-e6475fe9f443 = Estudios MODELLED de la órbita y la superficie de la Luna como infraestructura de navegación y geodésica, cinco estudios tras un único tipo de escenario seleccionado mediante <c1/>: od-consistency (determinación de órbita a bordo con GNSS terrestre en

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-ca4fac406beb = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-da20b48985b9 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-integrity</a1>.

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-564b491c4bb8 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-0f0b2d0ca0b4 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-time-offset</a1>.

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-128bf57a76d1 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-d6aa5d645fb7 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-time-budget</a1>.

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-79140f2544ea = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>.

# text
seg-de468e4d4b46 = <b>Registro:</b> MODELLED { "3" } · VALIDATED { "3" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-vlbi</a1>.

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-7da3c3ff2386 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-3119d4005897 = <b>Registro:</b> MODELLED { "3" } · VALIDATED { "2" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-vlbi-fim</a1>.

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-6f59a33a35b3 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-142f2253e4d6 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-joint-od-clock</a1>.

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-32c31af24e1b = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-73c0415efd2f = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-frame-realisation</a1>.

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-96efcb8d55d1 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-ce2f0f85dda4 = <b>Registro:</b> MODELLED { "2" } · VALIDATED { "3" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-frame-campaign</a1>.

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-d9e24a9a8c0c = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-4f05fad4b146 = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-llr-datum</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-8d9e0277303e = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>.

# text
seg-204901ae3684 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>moonlight-service-volume</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-6fe67fa619d0 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-c83350735643 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-differential-pnt</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-facc442295f1 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>.

# text
seg-8a2f6f535c4a = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-station-coverage</a1>.

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
seg-a790c54ac1aa = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-4efffcd615df = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-beacon</a1>.

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-720d0bbeaf6e = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-019ca0f1051e = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-interop-export</a1>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-28695dd2ecc3 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-af5d871bc69e = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>cislunar-observability</a1>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-f646e9fd7553 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-5e7bd8bb1adf = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>cislunar-arc-recovery</a1>.

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-3c514f3acc78 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>.

# text
seg-00b06a4fc0e0 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-attack-surface</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-079d2bb805f1 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-63d4157e2294 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-jamming</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-7bb977529f30 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-287f89e6bf6b = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>earth-gnss-lunar</a1>.

# text
# c1: study
# c2: seed
# c3: orbit
# c4: gnss
# c5: ground
# c6: monte_carlo
# c7: surface
# c8: llr
# c9: orbiter
# c10: gravimeter
# c11: clock
# c12: techniques
# c13: nominal
seg-f7ed8b60e7d1 = Campos obligatorios: <c1/>. Opcionales: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-41e50e49da99 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>lunar-infrastructure</a1>.

# text
seg-09f7f99d04a6 = <s1>Anterior</s1>Navegación en órbita terrestre baja

# text
seg-74c6bf83988e = <s1>Siguiente</s1>Análisis de misión, enlaces y operaciones espaciales

# text
seg-25455a33523c = Datum de marco lunar de Helmert de siete parámetros obtenido de una campaña de observación REAL y ARCHIVADA y no de una simulada. Mientras que lunar-frame-campaign eliminaba la transformación inyectada pero seguía declarando su red de estaciones, su calendario y su sigma por observación como entradas ILLUSTRATIVE, este tipo de escenario toma las tres de mediciones: las épocas son los instantes de transmisión desde tierra de puntos normales archivados de ILRS Consolidated Laser Ranging Data, las observaciones son las distancias láser realmente disparadas a las cinco matrices de retrorreflectores de la Luna, y cada peso de observación es la propia precisión archivada de ese punto normal, bin_rms/sqrt(n_raw), leída del archivo. Las coordenadas de las estaciones proceden de la solución SLR ITRF2020 del IERS (propagada a la época con sus velocidades publicadas) y las de los reflectores de la Tabla { "7" } de JPL DE430 en el marco de Tierra media/rotación media que realiza el modelo WGCCRE de la IAU { "2015" }. Las parciales de distancia se acumulan en la matriz de información de Fisher conjunta de coordenadas de reflectores y se propagan a través del mismo diseño de Helmert hasta la covarianza del datum, diagnosticada por crate::fim::crlb. El rango, el defecto, la condición, el espectro, las direcciones inobservables en la base de siete parámetros, la dirección más débil con rango completo y la parte de ella que corresponde a cada parámetro se emiten en cada ejecución, y un parámetro no restringido se publica como NULL con un estado. La correlación entre matrices está MEASURED en exactamente cero en lugar de suponerse, porque una distancia láser toca una sola matriz. Un registro que los catálogos no pueden situar (una estación sin posición ITRF publicada) se OMITE Y SE CUENTA, y nunca se le da una coordenada sustituta. QUÉ ENLACES ESTÁN MEASURED Y CUÁLES ESTÁN MODELLED ES EL INFORME, NO UNA NOTA AL PIE: las efemérides del centro de la Luna y la orientación del cuerpo de la IAU siguen modeladas y su tamaño combinado se emite como el residuo de distancia unidireccional observado menos calculado sobre cada punto usado; la troposfera, las mareas del cuerpo sólido, la excentricidad de estación, el movimiento polar, UT1-UTC, el retardo relativista y los relojes de estación están ausentes y dentro de ese residuo. Como un error de efemérides llega a una covarianza solo a través de la dirección de cada línea de visión, cada ejecución vuelve además a resolver todo el datum con todas las parciales inclinadas sensitivity_tilt_deg (con signo alterno) y emite la razón, de modo que la insensibilidad de la covarianza a las efemérides modeladas es un número y no un argumento. Las propias cifras de la campaña simulada se EJECUTAN y se imprimen junto a las medidas, no se transcriben. MODELLED: las cifras de siete parámetros son una cota de Cramer-Rao para un conjunto reducido de parámetros sobre un calendario real; no un datum resuelto, no un análisis LLR y no un producto geodésico. El fragmento de datos reales confirmado se distribuye con el repositorio pero no con el crate publicado; apunte data_dir a una copia de él.

# text
seg-28c6a5644152 = Análisis modelado del volumen de servicio de navegación lunar a partir de una constelación en órbita lunar ILLUSTRATIVE, de fuentes públicas, de clase Moonlight/LCNS (sin afiliación con la ESA): barre una cuadrícula selenográfica de latitud y longitud a lo largo de un horizonte temporal e indica DOP, cobertura y disponibilidad (≥{ "4" } satélites Y PDOP < umbral), además de una envolvente generalizada de nivel de protección (HPL/VPL) de ARAIM lunar sobre el volumen. La geometría de DOP REUTILIZA el núcleo gnss_lib_py-VALIDATED (crate::orbit::dop); el nivel de protección REUTILIZA la maquinaria de ARAIM lunar LNIS de LunaNet (crate::lunar, σ_URE≈{ "30" } m) y se reduce al nivel de protección del polo sur existente como caso particular. Composición MODELLED: un conjunto de relés kepleriano circular o elíptico (no las efemérides reales LCNS/NRHO corregidas diferencialmente), una Luna de rotación media (sin libración ni polo con precesión). Determinista (geometría pura). Sin TRL, herencia de vuelo ni respaldo de agencia alguna.

# text
seg-5413116b8b42 = Análisis modelado del volumen de servicio de navegación lunar a partir de una constelación en órbita lunar de clase Moonlight/LCNS, ILLUSTRATIVE y de fuentes públicas (sin afiliación con la ESA): recorre una malla selenográfica de latitud/longitud sobre

# text
seg-8ac5ac006ae7 = PNT DIFERENCIAL lunar modelado (un análogo lunar de DGNSS/SBAS): una estación de referencia de clase NovaMoon en una ubicación selenográfica CONOCIDA calcula correcciones diferenciales por satélite a partir de una constelación ILLUSTRATIVE de clase Moonlight/LCNS de fuentes públicas (NovaMoon se menciona solo como CLASE de sistema, sin afiliación a la ESA), y un usuario desplazado baseline_km las aplica de modo que los errores de órbita + reloj de MODO COMÚN se cancelan. El término de reloj se cancela EXACTAMENTE (una identidad algebraica); el término de órbita deja solo la proyección de la diferencia de línea de visión, que → { "0" } cuando la línea base → { "0" } (el suelo de decorrelación espacial) y crece ≈ linealmente con la línea base. Informa del error de posición 3D del usuario CON y SIN correcciones, el factor de reducción, la curva de error frente a línea base y un nivel de protección del usuario que REUTILIZA la maquinaria SBAS DO-229E (crate::sbas) con el residuo diferencial σ. MODELLED: identidad de cancelación exacta + modelo de decorrelación de primer orden; no validado con datos reales; sin TRL/herencia/respaldo de ninguna agencia. Determinista si tiene semilla.

# text
seg-a0e202b3566c = PNT DIFERENCIAL lunar modelado (un análogo lunar de DGNSS/SBAS): una estación de referencia de clase NovaMoon en una ubicación selenográfica CONOCIDA calcula correcciones diferenciales por satélite a partir de un conjunto ILLUSTRATIVE
