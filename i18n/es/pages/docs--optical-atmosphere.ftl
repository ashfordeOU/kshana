# docs--optical-atmosphere: translations (es)

# text
seg-6cb7a787ac67 = Referencias

# text
seg-1c6199627b90 = Datos

# text
seg-ad856ad710eb = Estado

# text
seg-53a7343c076e = Afirmación

# text
# c1: docs/OPTICAL-ATMOSPHERE.md
seg-508588352e96 = Fuente: <c1/>

# text
seg-333a1114746a = PNT óptico a través de la atmósfera

# text
# c1: optical-atmosphere
seg-47118f54f060 = El tipo de escenario <c1/> responde a con qué frecuencia funciona un enlace óptico con tierra, por qué falla, qué margen o técnica ayudaría y qué hace un reloj mientras el enlace está caído.

# text
seg-06db0ea8f428 = Kshana es solo la parte de análisis. No ejecuta un experimento de estación óptica terrestre y no nombra a ningún socio de medición. El tipo es <b>MODELLED</b>: su numérica se comprueba frente a un programa independiente, pero no se ha comparado ningún registro de disponibilidad medida, y toda entrada de meteorología, de técnica y de reloj es una suposición. Es un análisis de carácter consultivo, no un producto certificado de disponibilidad, de integridad ni de navegación.

# attr:alt
seg-e9dbbd9cfa32 = Una realización con semilla del margen del enlace del emplazamiento 'northern' durante { "336" } h, a partir de una ejecución real del motor v{ $version } sobre scenarios/optical-atmosphere-network.toml (semilla { "37" }, un paso de { "600" } s). El margen cae por debajo de cero durante los episodios de nubes; en este sorteo el enlace está activo el { "40.5" } % del tiempo, con { "27" } interrupciones y una interrupción más larga de { "30.7" } h. Las entradas son ilustrativas, la serie es un sorteo del modelo y no el clima, y difiere de la disponibilidad estadística ({ "37.8" } %) por el error de muestreo del sorteo. Solo análisis de carácter consultivo: no es un producto certificado de disponibilidad, de integridad ni de navegación, y no es una predicción para ningún emplazamiento real salvo que sus entradas de clima procedan de un conjunto de datos declarado.

# text
seg-13a52dfbd8d1 = Qué se calcula

# text
# c1: atmospheric_loss_db
# c2: optical_linkbudget
seg-46fbaf0c6a12 = <b>Pérdida en aire despejado</b> a la longitud de onda y la elevación: extinción por aerosoles según la ley de visibilidad de Kim, McArthur y Korevaar, exponencial con la altura, más dispersión de Rayleigh y una entrada declarada de absorción por gases. Esto sustituye el único <c1/> agrupado de <c2/> cuando se aporta una atmósfera. Sin ella, el balance del enlace es idéntico bit a bit a { "0.36" } (umbral preregistrado A5).

# text
# c1: Cn²
seg-929c80326b41 = <b>Turbulencia.</b> Un perfil <c1/> de Hufnagel–Valley (HV 5/7 por defecto) integrado a lo largo del trayecto oblicuo da la varianza de Rytov de onda plana o esférica, en subida o en bajada. De ella salen el índice de centelleo de Andrews–Phillips, los parámetros gamma-gamma, el factor de promediado por apertura de turbulencia débil (Churnside) y la probabilidad de desvanecimiento gamma-gamma y el margen de desvanecimiento. El promediado por apertura se aplica por ajuste de momentos: el índice de centelleo se escala con el factor de promediado y ambas varianzas logarítmicas se reescalan para obtenerlo exactamente.

# text
# c1: τ = 3L/(2 ρ_w r_e)
seg-3fb7be7ef95d = <b>Nubes.</b> El clima de nubes de un emplazamiento tiene la forma de ITU-R P.840: una probabilidad de nube y, dada una nube, una columna de agua líquida log-normal. P.840 aporta la cantidad de nube. La atenuación es la profundidad óptica de la óptica geométrica <c1/>, porque la propia ley de atenuación de P.840 es una ley de microondas y no se aplica a { "0.85" } a { "1.55" } µm, donde las gotas son mucho mayores que la longitud de onda.

# text
# c1: null
seg-18311430b2a3 = <b>Disponibilidad</b> de un emplazamiento: el enlace está activo mientras los desvanecimientos conjuntos de nubes y turbulencia permanecen dentro del margen que deja la pérdida en aire despejado. Se toman las nubes y la turbulencia como independientes. El informe da la disponibilidad, la disponibilidad con cielo despejado, el <b>techo</b> que ningún margen puede elevar (un enlace óptico no atraviesa nubes espesas) y el margen adicional necesario para cada disponibilidad objetivo, o <c1/> si el objetivo está por encima del techo.

# text
seg-885e06050a9a = <b>Interrupciones.</b> Las duraciones son log-normales con una media y una dispersión declaradas. El informe da las interrupciones por año, la duración en la mediana y en los percentiles 90 y 99, y la probabilidad y la proporción del tiempo de interrupción más allá de { "1" }, { "6" }, { "24" } y { "72" } horas.

# text
# c1: N
# c2: 1 − Π(1−a_i)
# c3: exp(−d/d₀)
# c4: d₀ → 0
seg-4b9b6fefad6b = <b>Diversidad de emplazamientos.</b> Los mejores <c1/> emplazamientos combinados con meteorología independiente (<c2/>) y con meteorología correlacionada por distancia: correlación de pares <c3/>, combinados en una cópula gaussiana de un factor. Con <c4/> es la unión independiente, y con correlación plena el mejor emplazamiento individual.

# text
# c1: [[technique]]
seg-b85681b9fd93 = <b>Técnicas.</b> Cada <c1/> es un supuesto hipotético: una nueva longitud de onda (se reevalúan el balance con cielo despejado, la pérdida en aire despejado y el promediado por apertura), una nueva apertura de recepción, una reducción fraccionaria declarada del centelleo (óptica adaptativa) y margen adicional. El resultado es la ganancia de disponibilidad respecto a la línea base en el mismo emplazamiento. Kshana no modela un lazo de óptica adaptativa, así que las ganancias son entradas.

# text
# c1: [clock]
# c2: A + U·E[min(D, T_h)]/E[D]
# c3: holdover.rs
seg-a59d07280524 = <b>Temporización y medición de distancias a través de una interrupción.</b> Cada duración de interrupción se traslada mediante la varianza de deriva en forma cerrada del modelo de holdover del reloj, para los relojes listados en <c1/>. El informe da el error de temporización y de distancias para duraciones de interrupción declaradas, el holdover hasta el umbral de temporización, la proporción de interrupciones dentro de él y la disponibilidad de temporización <c2/>. Los suelos de ley de potencias de la clase son los sintetizados del módulo de holdover, de modo que un umbral estricto lo gobierna ese suelo supuesto, como indica <c3/>.

# text
seg-59774a9e8685 = Margen del enlace frente al tiempo ({ "0.38" })

# text
# c1: [timeseries]
# c2: duration_h
# c3: step_s
# c4: seed
# c5: p_cloud
seg-fcfdd2e9e0ad = Una tabla <c1/> (<c2/> hasta { "8760" }, <c3/>, <c4/>) añade a cada emplazamiento una <b>realización con semilla</b> del modelo anterior: la línea de visión alterna entre periodos despejados (exponenciales, con la media fijada de modo que la proporción de tiempo con nube sea la <c5/> declarada) e interrupciones por nubes (log-normales, con la media y la dispersión declaradas); cada interrupción extrae una columna de agua líquida del clima declarado y la mantiene; cada paso extrae una muestra de centelleo gamma-gamma (independiente de un paso a otro, una simplificación declarada) y el terminal está apuntado al objetivo con la disponibilidad de apuntamiento declarada. El margen del paso es el presupuesto de desvanecimiento menos los desvanecimientos por nubes y por centelleo, y el enlace está activo cuando el margen no es negativo y el terminal está apuntado al objetivo, la condición que usa la integral de disponibilidad.

# text
# c1: margin_db
# c2: cloud_db
# c3: scint_db
# c4: up
# c5: realised
# c6: tests/optical_atmosphere_timeseries.rs
# c7: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-ad2c4ff087a8 = Es un sorteo, no el clima: su disponibilidad difiere de la estadística por el error de muestreo del sorteo, y el primer episodio se extrae entero. El resultado lleva <c1/>, <c2/>, <c3/> y <c4/> por paso y un bloque <c5/> (disponibilidad, fracción de nubes, número de interrupciones, interrupción más larga). <b>MODELLED</b>; las comprobaciones (<c6/>, umbrales fijados en <c7/> antes de la primera ejecución) son el determinismo y la coherencia con las cifras declaradas, no una referencia independiente externa. Sin la tabla no se escribe nada y el resultado es el documento de { "0.37" }.

# text
seg-4a9b065bdb28 = Campos del escenario

# text
# c1: kind = "optical-atmosphere"
# c2: wavelength_nm
# c3: elevation_deg
# c4: availability_targets_pct
# c5: [link]
# c6: [atmosphere]
# c7: [network]
# c8: [clock]
# c9: [[site]]
# c10: [[technique]]
seg-4ba70196355d = Todos los campos de nivel superior son opcionales. Un <c1/> a secas ejecuta tres emplazamientos ilustrativos. Véanse los dos archivos incluidos para cada clave: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-b7619573e112 = Estado de verificación

# text
seg-6598ced4218b = La varianza de Rytov, el índice de centelleo, la probabilidad de desvanecimiento gamma-gamma, el factor de promediado por apertura y las profundidades ópticas de nubes y de aire despejado se calculan como dicen las fórmulas declaradas

# text
seg-2442f7529fbb = Fila MODELLED; numérica comprobada frente a un programa mpmath independiente

# text
# c1: xval/optical-atmosphere/RESULTS.md
seg-19854ea8437a = umbrales A1 a A3, todos alcanzados (<c1/>)

# text
seg-b91d83aea0e8 = Balance del enlace y disponibilidad existente sin cambios sin una atmósfera

# text
seg-2192262e26c1 = alcanzado

# text
seg-a71527a271df = umbral A5, idéntico bit a bit en { "1,000" } conjuntos de parámetros

# text
seg-0db8cf4c2ee0 = Límites de la diversidad y monotonía; acoplamiento con holdover exacto al bit

# text
seg-2a5c5967540c = alcanzado (identidades)

# text
seg-4b0e5e3ac558 = umbrales A4, A6

# text
seg-f842c688e29a = Disponibilidad de un emplazamiento real, centelleo real, estadísticas reales de nubes

# text
seg-9a0ead7b1670 = no se afirma

# text
seg-9cc220190772 = no se comparó con ninguna referencia independiente externa

# text
seg-7c5050135e2b = La referencia independiente comprueba la implementación de las fórmulas declaradas, no la atmósfera, así que ninguna fila es VALIDATED. Los valores de validación de ITU-R no se usan y se mantienen fuera del repositorio.

# text
# c1: optical_availability
seg-73dcf0f31fe9 = No se incluye ningún conjunto de datos meteorológicos. Las entradas de clima de nubes de un emplazamiento real procederían de un conjunto de datos público (Copernicus ERA5, NASA MODIS o ISCCP); la licencia de cada conjunto de datos debe leerse y registrarse antes de usarlo, y los datos sin procesar obtenerse en el momento de la prueba con un SHA-256 fijado. La única climatología que ya está en el repositorio es la tabla de noches despejadas de Cavazzani et al. que usa <c1/>.

# text
seg-44d197f3209c = Andrews y Phillips, <em>Laser Beam Propagation through Random Media</em>, 2.ª ed. (varianza de Rytov, índice de centelleo, parámetros gamma-gamma).

# text
seg-9e9a33d44013 = Kim, McArthur y Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (ley de visibilidad).

# text
seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (factor de promediado por apertura).

# text
seg-309c70f2f4f8 = ITU-R P.840 (estadísticas de agua líquida de las nubes), P.1814 y P.1817 (métodos de óptica en espacio libre).

# text
seg-83b30e1ca261 = <s1>Anterior</s1>Paquetes de evidencias

# text
seg-1474b58fb35a = <s1>Siguiente</s1>Temporización de ranuras

# text
seg-83c16fd89005 = Los dos escenarios incluidos llevan climas de nubes ILUSTRATIVOS. Son entradas, no mediciones ni valores de ningún conjunto de datos.
