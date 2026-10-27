# docs--concepts: translations (es)

# text
seg-501402fc366f = Holdover del reloj

# text
seg-9c0eb89a2fbe = Paquete

# text
# c1: docs/CONCEPTS.md
seg-41b3740e1db9 = Fuente: <c1/>

# text
seg-8ab3fd09812d = Conceptos: una introducción en lenguaje llano

# text
seg-0f86d0a815d2 = Esta página explica <em>qué hace Kshana y por qué</em>, partiendo de cero y avanzando hasta la física. En la primera parte no se supone ningún conocimiento previo; las secciones posteriores añaden las relaciones precisas para especialistas. Para definiciones palabra por palabra, véase el <a1>Glosario</a1>.

# text
seg-34f76bad58cb = { "1" }. El problema, en un párrafo

# text
seg-45c0199e2224 = Casi todo lo que necesita saber <em>dónde está</em> o <em>qué hora es</em> (teléfonos, aeronaves, buques, satélites, redes eléctricas, sistemas financieros) se apoya en señales de satélites de navegación (GPS (Sistema de Posicionamiento Global) y sus hermanos, en conjunto <b>GNSS</b> (sistema global de navegación por satélite)). Esas señales son débiles y se pierden con facilidad: interferidas por jamming, bloqueadas o sencillamente fuera de vista en el espacio. Cuando eso ocurre, un sistema tiene que <b>seguir por su cuenta</b> con sensores a bordo: un reloj que mantenga la hora y sensores inerciales que sigan el movimiento. La pregunta que responde Kshana es sencilla de formular y difícil de medir: <b>¿durante cuánto tiempo y con qué calidad puede seguir?</b>

# text
seg-ea1895772e76 = { "2" }. ¿Por qué «cuántico»?

# text
seg-dd6871645f37 = Los sensores a bordo derivan. Un reloj pierde hora poco a poco; un sensor inercial pierde poco a poco la pista de la posición. Los relojes y los sensores inerciales <b>cuánticos</b> derivan <em>mucho más despacio</em> que los componentes clásicos en uso hoy, de modo que un vehículo podría atravesar una interrupción del GNSS mucho más larga sin salir de sus límites de exactitud. Esa ventaja es toda la promesa del PNT (posicionamiento, navegación y temporización) cuántico. Pero «mucho más despacio» hay que convertirlo en <b>números</b>: ¿cuántos minutos más de holdover?, ¿cuántos metros menos de deriva? Esos números deciden si una carga útil cuántica compensa su coste, su masa y su potencia.

# text
seg-a5d9dc0fb159 = { "3" }. Qué hace realmente Kshana

# text
seg-cb3a35ba696f = Kshana es un <b>simulador</b>, no hardware ni un diseño de hardware. Este:

# text
seg-cb7fdaf6738b = Toma un <b>escenario</b>: una línea temporal con un tramo de interrupción del GNSS y las cifras de rendimiento publicadas de un sensor.

# text
seg-701c8c6d0e55 = Hace pasar un <b>modelo de error de sensor</b> por esa línea temporal: mientras el GNSS está disponible, el modelo se disciplina con la verdad; durante la interrupción funciona en marcha libre, acumulando error exactamente como dice la física que debe hacerlo.

# text
seg-bc68e3d54e4c = <b>Puntúa</b> el resultado frente a cifras de mérito operativas (cuánto crece el error, cuánto tiempo se mantiene dentro de la especificación, cuán fiable es la estimación).

# text
seg-32d31a9beb71 = Para los paquetes de sensores, lo hace <b>dos veces</b> (una para un sensor cuántico y otra para su homólogo clásico) sobre el <em>mismo</em> escenario, de modo que la comparación sea de igual a igual.

# text
seg-07d8c6eb84e9 = Es esencial que el motor no sabe nada de «cuántico» frente a «clásico». Ambos son solo modelos de error con parámetros distintos (publicados y citados). La diferencia que se ve en la salida es la diferencia de la física publicada: nada se ajusta a mano para favorecer a un lado.

# text
seg-e20a7d3f32dc = { "4" }. Los cuatro bloques de construcción («paquetes»)

# text
seg-638b8d451550 = Sensor

# text
seg-f891ee876b96 = Qué responde

# text
seg-d1b122c389d4 = reloj atómico

# text
seg-768230c2eb02 = ¿Durante cuánto tiempo se mantiene exacta la <em>hora</em> sin GNSS?

# text
seg-029de6b99be0 = Navegación inercial a estima

# text
seg-f66f2d7b1d6d = acelerómetro (+ giróscopo)

# text
seg-e067a035f656 = ¿Con qué rapidez deriva la <em>posición</em> sin GNSS?

# text
seg-9ef8f99ca6e4 = Transferencia de tiempo

# text
seg-1267f82791f9 = enlace óptico / de RF (radiofrecuencia)

# text
seg-6f240700790d = ¿Con qué precisión pueden dos naves compartir la hora?

# text
seg-90be2a6a29b1 = Fusión híbrida

# text
seg-780cf1f1127e = todo lo anterior

# text
seg-6080a05ace19 = ¿Se sostiene la solución PNT <em>combinada</em>?

# text
seg-3f74a708a746 = El paquete híbrido es la clave: una solución de navegación necesita <em>tanto</em> buena hora <em>como</em> buena posición. Muestra que un enlace óptico de temporización puede mantener enganchado incluso un reloj modesto, con lo que el sensor <b>inercial</b> pasa a ser el eslabón más débil, y ahí es exactamente donde compensa un acelerómetro cuántico.

# text
seg-5f55bb0fd7c5 = Más allá de los cuatro paquetes

# text
# c1: kshana kinds
seg-60191a2cd150 = El mismo motor ejecuta muchos más <em>tipos de escenario</em>; <c1/> los enumera todos. Alcanzan más allá de los sensores, hasta las señales y la geometría de las que dependen los sensores:

# text
seg-995ed414d83d = <b>Dónde están los satélites</b>: propagación de órbitas, diseño de constelaciones alrededor de la Tierra, la Luna u otro cuerpo, y las posiciones de los cuerpos del sistema solar.

# text
seg-bc8abce2a748 = <b>Lo que el receptor puede ver</b>: un perfil de horizonte dependiente del acimut (una calle, un muelle, un fiordo) sobre la máscara de elevación, y la geometría del cielo que deja: los satélites a la vista, su dilución de la precisión y la elipse de error.

# text
seg-b7a2c252c41c = <b>Lo que el receptor oye</b>: el espectro de banda L bajo un jammer, el jamming y el spoofing, y la pérdida de enganche del lazo de seguimiento.

# text
seg-f354743045c4 = <b>Si puede confiarse en la respuesta</b>: monitorización de la integridad (RAIM, monitorización autónoma de la integridad por el receptor, y su forma avanzada ARAIM) con niveles de protección.

# text
seg-69aa01a29a49 = <b>Alternativas al GNSS</b>: correlación con mapas de gravedad y de terreno, y posicionamiento, navegación y temporización desde satélites de órbita terrestre baja (LEO), desde el diseño de la señal pasando por el balance del enlace y el mensaje de navegación hasta la posición calculada.

# text
seg-297c98214b5b = <b>Temporización para redes</b>: holdover de telecomunicaciones comprobado frente a las máscaras internacionales y temporización de ranuras para planificaciones indexadas en el tiempo.

# text
seg-7eba216a9bf2 = <b>Más allá de la Tierra</b>: tiempo y marcos de referencia lunares, volúmenes de servicio lunares y navegación por relé en Marte.

# text
seg-b796f49570ed = <b>Muchas ejecuciones a la vez</b>: las campañas encadenan tipos de escenario en una línea temporal, barren un parámetro o ejecutan un conjunto Monte Carlo.

# text
seg-ef7f4e025018 = { "5" }. Honestidad por construcción

# text
seg-65fb8703baf9 = Un simulador solo es útil si se puede confiar en él. Kshana está construido para que se pueda:

# text
# c1: provenance
seg-de8fd160db6d = <b>Cada parámetro está citado.</b> Cada cifra de sensor lleva una cadena <c1/> que nombra la hoja de datos o el artículo de donde procede. Ninguna constante anónima.

# text
seg-09d5cd11b127 = <b>Cada modelo se contrasta con una relación de manual,</b> no solo consigo mismo; por ejemplo, la desviación de Allan del reloj simulado debe coincidir con la cifra de estabilidad publicada, y la deriva inercial debe coincidir con la ley estándar de crecimiento del error. Una capacidad se llama <em>validada</em> solo cuando coincide una referencia independiente externa (un conjunto de datos real, una implementación independiente o vectores de referencia publicados); el resto es <em>modelado</em>, y la <a1>matriz de verificación</a1> dice cuál es cuál.

# text
seg-ccb5b2fe93c4 = La madurez está etiquetada.

# text
# c1: validated
# c2: modelled
# c3: not modeled
seg-5a0ac98febed = <a1>VALIDATION.md</a1> marca cada efecto como <c1/>, <c2/> o <c3/>, e indica con claridad que las cifras de los relojes ópticos son números de <em>laboratorio / objetivo espacial</em>: ningún reloj óptico de estroncio ha volado.

# text
seg-de463596fcdb = <b>Los resultados son reproducibles hasta el bit:</b> el mismo escenario, semilla y versión producen siempre la misma respuesta en la misma plataforma; entre sistemas operativos las cifras coinciden hasta { "1e-6" } relativo (véase <a1>REPRODUCIBILITY.md</a1>).

# text
seg-f87dad1ffc98 = { "6" }. La física, para especialistas

# text
seg-8fc6db9faf83 = Las relaciones que Kshana implementa y prueba (detalle completo y tolerancias en <a1>VALIDATION.md</a1>):

# text
# c1: q_wf
# c2: q_rw
# c3: σ_y(τ)
seg-ea61f869c266 = <b>Holdover de reloj.</b> Modelo de dos estados fase/frecuencia con modulación de frecuencia blanca (FM blanca, densidad espectral de potencia <c1/>), FM de paseo aleatorio (<c2/>), FM de flicker (una suma de procesos de Ornstein–Uhlenbeck espaciados logarítmicamente, calibrados a un suelo de Allan plano) y envejecimiento determinista. Validado mediante la desviación de Allan solapada frente a la <c3/> publicada (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

# text
# c1: ½·b·T²
# c2: σ_x(T) = √(S_a·T³/3)
# c3: g·θ
seg-4f46754c399f = <b>Navegación inercial a estima.</b> Sesgo residual del acelerómetro → <c1/>; paseo aleatorio de velocidad → <c2/>; el sesgo opcional del giróscopo y el paseo aleatorio angular producen un error de inclinación que acopla la gravedad (<c3/>) a la aceleración horizontal (Groves).

# text
# c1: range = c·dt
# c2: σ/√N
seg-d59595d00f0a = <b>Transferencia de tiempo.</b> Jitter de temporización blanco → precisión de sincronización → medida de distancia unidireccional (<c1/>, { "1" } ps ≈ { "0.3" } mm); la media muestral se promedia como <c2/>.

# text
# c1: q_wf·T + q_rw·T³/3
seg-0eb7a53fb4a6 = <b>Fusión e integridad.</b> Un filtro de Kalman de dos estados cuyo ruido de proceso coincide con el modelo verdadero; en marcha libre, la varianza de su error de fase crece exactamente hasta <c1/>, la relación analítica de holdover, y su cota de 1-σ alimenta la cifra de mérito de Integridad.

# text
seg-80daa7cb8641 = <b>Geometría.</b> La propagación kepleriana de dos cuerpos (opcionalmente con J2 secular) o SGP4 (Simplified General Perturbations { "4" }) a partir de conjuntos reales de elementos de dos líneas, las constelaciones Walker y la visibilidad en línea de vista (oclusión por la Tierra + máscara de elevación) derivan la disponibilidad GNSS de la geometría orbital en lugar de ventanas escritas a mano.

# text
seg-4ce4c6b79b93 = { "7" }. Adónde ir después

# text
seg-7c8344a26230 = Trabajarlo: los <a1>tutoriales</a1>: tres ejemplos resueltos + ejercicios graduados.

# text
seg-277f1b435cf6 = Ejecutarlo: véase el inicio rápido del <a1>README</a1>.

# text
seg-c349981bd4f1 = Entender la estructura: <a1>ARCHITECTURE.md</a1>.

# text
seg-f7acbf857c57 = Comprobar qué está y qué no está validado: <a1>VALIDATION.md</a1>.

# text
seg-04a86ea674a5 = Consultar un término: <a1>GLOSSARY.md</a1>.

# text
seg-4a73b906888b = <s1>Anterior</s1>Visión general

# text
seg-2f14e84bfc99 = <s1>Siguiente</s1>Glosario
