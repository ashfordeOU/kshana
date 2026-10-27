# docs--kind-leo-pvt: translations (es)

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-b054c73f22e5 = sin valor

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Página de tema: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de escenario del motor v{ $version }, familia <a1>Navegación en órbita terrestre baja</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-c5478f572d21 = Página de familia: <a1>Navegación en órbita terrestre baja</a1>

# text
seg-be21370c2446 = joint

# text
# c1: docs/kinds/by-kind/leo-pvt.md
seg-dfe64e82e4e9 = Fuente: <c1/>

# text
# c1: leo-pvt
seg-fdba999dab11 = <c1/> (tipo de escenario)

# text
seg-093aac4b5ff1 = Posicionamiento, navegación y temporización (PNT) fusionado de órbita terrestre media (MEO) y órbita terrestre baja (LEO) sobre CUALQUIER constelación: cada [[system]] es un preajuste GNSS del tipo de escenario constellation-design, un preajuste LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, el modelo de efemérides de reloj cero atomic, u otro archivo de preajuste, cada uno en su propio archivo con sus fuentes marcadas PUBLIC, WORKSHOP o DERIVED), capas Walker o conjuntos de elementos explícitos, con una portadora, una tasa de chip, una envolvente de densidad de portadora a ruido (C/N0) desde la máscara de elevación hasta el cénit, un error de distancia en la señal en el espacio (SISRE), un sigma de Doppler y un modelo de reloj (su propio reloj de receptor, de modo que se estima el sesgo entre sistemas, o un desfase de difusión conocido). Cuatro modos. DOPPLER: posicionamiento por lotes de Gauss-Newton a partir de la velocidad de variación de distancia con parciales analíticas, estados de deriva de reloj y de velocidad opcionales y una restricción de altura opcional, de uno o varios satélites, el error frente a la longitud de ventana, la envolvente de Doppler, tasa de Doppler y sacudida (jerk) de cada sistema LEO, y la precisión a lo largo de la traza y transversal de un solo paso frente al desplazamiento transversal (el error transversal crece sin límite a medida que el paso pasa por la vertical; un solo paso tiene además una solución especular a través de la traza sobre el suelo). Aquí se ejecuta una señal de oportunidad solo Doppler (starlink-sop). JOINT: fijaciones de pseudodistancia por mínimos cuadrados ponderados por época solo con GNSS, solo con LEO y con ambos, sigmas por medición a partir de un modelo de ruido térmico del lazo de enganche de retardo a C/N0 más el SISRE (o un sigma fijo, de modo que un modelo de señal pueda alimentarlos), los sesgos entre sistemas estimados, y PDOP/HDOP/VDOP frente al número de satélites LEO añadidos. POLAR: satélites a la vista y DOP frente a la latitud para GNSS, LEO y ambos. TIMING: transferencia de tiempo al Tiempo Universal Coordinado (UTC) desde satélites LEO en una posición conocida con un filtro de reloj de dos estados cuyo ruido de proceso procede de las clases de oscilador del motor, frente al C/N0 y al oscilador, y la expresión de tiempo de sistema a UTC de IS-GPS-200; con [timing] trace = true cada fila informa además de su error de tiempo y de su sigma predicho en cada época. VALIDATED: el mayor Doppler de un paso de la vertical al horizonte frente a las cifras publicadas de Iridium (hasta { "36" } kHz) y de Xona Pulsar X1 ({ "32" } a { "34" } kHz). MODELLED: todo lo demás; el DOP se comprueba frente a un caso derivado a mano, las fijaciones frente a su covarianza y el modelo de Doppler frente a la identidad de aceleración de distancia.

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f34d4bbcac4d = Una ejecución de <c1/> se resume así: LEO PVT (joint) en { "61.10" }, { "6.60" } durante { "1800" } s GPS gnss { "24" } sat. a { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sat. a { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sat. a { "1080" } km, { "1190.52" } MHz satélite de medición de distancia LEO a la vista en { "100.0" }% de las épocas solo GNSS disponibilidad { "1.000" }, PDOP mediano { "1.48" }, error 3D RMS { "1.29" } m solo LEO disponibilidad { "1.000" }, PDOP mediano { "2.33" }, error 3D RMS { "0.69" } m fusionado disponibilidad { "1.000" }, PDOP mediano { "1.14" }, error 3D RMS { "0.63" } m

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-e271a69236bf = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f850cba7d96e = El ejemplo <c1/> establece, entre otros:

# text
seg-bb3b3e8be839 = fjord

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-b43a7ee40372 = Etiqueta de resultado (la del motor): posicionamiento conjunto por pseudodistancia de mínimos cuadrados ponderados MODELLED con un reloj por sistema o un desfase conocido; ruido del modelo del lazo de enganche de retardo a la envolvente de C/N0 más el error de distancia en la señal en el espacio

# attr:alt
seg-90361a6f4e3c = El gráfico que el motor escribe para scenarios/leo-pvt-fjord-skyline.toml, tipo de escenario leo-pvt

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-68aa305e05a4 = <b>VALIDATED</b> Velocidad de variación de distancia exacta de un satélite cuya posición y velocidad fijas en la Tierra proceden de una órbita de dos cuerpos con la deriva secular de J2 y la rotación de la Tierra (leo_fusion::geom::EarthOrbit::state, siendo la velocidad la derivada temporal exacta de la posición), Pruebas: <a1>leo_doppler_reference.rs</a1>.

# text
seg-c3ef3e0163f2 = <b>MODELLED</b> Posicionamiento por lotes de Gauss-Newton a partir de la velocidad de variación de distancia con parciales analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), una velocidad de usuario constante como opción, una pseudomedición de altura para un usuario en superficie, amortiguado Pruebas: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-a4e0166269ea = <b>MODELLED</b> Fijaciones de Gauss-Newton por mínimos cuadrados ponderados sobre cualquier combinación de sistemas, un reloj de receptor por sistema (el sesgo entre sistemas estimado junto con la posición) o un desfase de difusión conocido en la escala de tiempo de referencia; sigmas por medición suministrados por Pruebas: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-5c9f826efbc8 = <b>MODELLED</b> Mediciones de reloj de cada satélite LEO a la vista en una posición conocida, combinadas por varianza inversa a partir del modelo de ruido de pseudodistancia, filtradas por un filtro de Kalman de dos estados (fase, frecuencia) cuyo ruido de proceso es el de la clase de oscilador Pruebas: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-3319b18ac61f = y { "1" } más en la matriz.

# text
seg-f6bd93155e41 = <b>MODELLED</b> Fijaciones de Gauss-Newton por mínimos cuadrados ponderados sobre cualquier combinación de sistemas, un reloj de receptor por sistema (el sesgo entre sistemas estimado junto con la posición) o un. Referencia independiente (InternalConsistency): Un DOP de cuatro satélites derivado a mano (un satélite en el cénit y tres en el horizonte separados { "120" } deg, cuya matriz normal se invierte a mano), la identidad estructural de que un sistema con su propio reloj y un satélite no añade geometría, la recuperación sin ruido de posición, reloj y sesgo, y errores con semilla frente a la covarianza. Solo comprobaciones internas; no se compara con la salida de un receptor. { "0.30" } comparación externa, un hallazg

# text
seg-4056b0470099 = <b>MODELLED</b> Entradas independientes del sistema: cada sistema es capas Walker, elementos explícitos o un preajuste GNSS, una señal (portadora, tasa de chip, ancho de banda, potencia recibida o rango de C/N0. Referencia independiente (InternalConsistency): Transcripción de los valores públicos citados, comprobada en su estructura (toda fuente pública tiene una URL, los patrones Walker se dividen por igual, el C/N0 a partir de la potencia recibida sobre kT a { "290" } K), no frente a una referencia independiente externa. Los valores representativos se nombran en cada preajuste y son ilustrativos

# text
# c1: label
seg-df745ccdaceb = Posicionamiento conjunto por pseudodistancia de mínimos cuadrados ponderados MODELLED con un reloj por sistema o un desfase conocido; ruido del modelo del lazo de enganche de retardo a la envolvente de C/N0 más el error de distancia en la señal en el espacio (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-c988291eb41d = MODELLED: todo lo demás; el DOP se comprueba frente a un caso derivado a mano, las fijaciones frente a su covarianza y el modelo de Doppler frente a la identidad de aceleración de distancia. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana skyline --preset fjord
seg-be908356ad19 = El preajuste de horizonte es REPRESENTATIVE (procedencia en docs/SKYLINE.md y <c1/>): del orden de la anchura y del relieve de los profundos fiordos del oeste de Noruega, no un levantamiento de ningún fiordo. Solo línea de visión: sin difracción, reflexión ni recepción sin línea de visión. Elimine la sección [skyline] para comparar con cielo abierto. MODELLED. (comentario del archivo de escenario, líneas { "15" } a { "18" })

# text
seg-1d0ab26930e1 = El posicionamiento conjunto por pseudodistancia de GNSS y LEO con sesgos entre sistemas y modelos de error por señal es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-35916a8ac93e = Los sistemas LEO PNT con nombre como preajustes de datos opcionales, cada uno con su fuente, son MODELLED, no validados: se comprueban frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-6ac7dcc57b2a = <s1>Anterior</s1>leo-ppp

# text
seg-458b3eda3250 = <s1>Siguiente</s1>leo-signal
