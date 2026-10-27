# docs--slot-timing: translations (es)

# text
seg-f917e7fcac09 = Qué es

# text
seg-adc34608c46b = Clase

# text
seg-3a0e724a8a2b = Nivel

# text
seg-fffbeccd4266 = Símbolo

# text
seg-2247a2344710 = Significado

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-1ff32b87e030 = Satélites

# text
seg-582fd72f1a1a = Veredicto

# text
seg-430edd66bda0 = No modelado

# text
# c1: docs/SLOT-TIMING.md
seg-f23c8bd5f203 = Fuente: <c1/>

# text
# c1: slot-timing
seg-1f2727dc4ca4 = El tipo de escenario <c1/> responde a tres preguntas sobre un reloj que funciona en marcha libre entre sincronizaciones y debe mantener el tráfico dentro de una <b>ranura indexada en el tiempo</b>: una ranura de encaminamiento, de asignación de tareas o de contacto cuya <b>guarda</b> es el mayor error de tiempo absoluto, a cualquiera de los dos lados, con el que la ranura aún funciona.

# text
seg-6b39d8afeb5d = <b>¿Cuándo se rompe la guarda?</b> Segundos desde la última solución hasta que el error de tiempo previsto alcanza la guarda, con cada término contribuyente detallado y el dominante nombrado.

# text
seg-60476d723e1a = <b>¿Cuánto tiempo queda ahora?</b> La misma cifra menos el tiempo ya transcurrido desde la solución.

# text
seg-84010982db35 = <b>¿Con qué frecuencia debe el reloj tomar una solución?</b> El mayor intervalo entre soluciones que mantiene el error dentro de la guarda, descontada la latencia antes de que una solución surta efecto.

# text
# c1: spoofing
seg-3388d46925f1 = Una sección <c1/> opcional añade el nivel de protección de temporización (TPL) para un receptor en órbita; véase <a1>Spoofing de un receptor en órbita</a1>.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-2eb266d992b0 = Ejecute el ejemplo incluido con <c1/>.

# text
seg-624e7a70c4f6 = Abreviaturas: GNSS, Sistema Global de Navegación por Satélite; TCXO, oscilador de cuarzo con compensación de temperatura; OCXO, oscilador de cuarzo con control de horno; RAFS, patrón de frecuencia atómico de rubidio; CSAC, reloj atómico a escala de chip; USO, oscilador ultraestable; DSAC, reloj atómico de espacio profundo; ADEV, desviación de Allan; FM, modulación de frecuencia (aquí, ruido en la frecuencia del reloj); PM, modulación de fase (ruido en su fase); IEEE, Instituto de Ingenieros Eléctricos y Electrónicos; ITU-T, el Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones; TIE, error de intervalo de tiempo; MTIE, error máximo de intervalo de tiempo; TDEV, desviación de tiempo; max|TE|, error de tiempo absoluto máximo; CUSUM, detector de cambios por suma acumulada; TPL, nivel de protección de temporización; LEO, órbita terrestre baja; NIST SP, Publicación Especial del Instituto Nacional de Estándares y Tecnología; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (una revista IEEE Transactions); IGS, Servicio Internacional de GNSS; GPS, Sistema de Posicionamiento Global; Block IIF, los satélites GPS Block II Follow-on; SHA-256, el algoritmo de hash seguro de 256 bits; PPS, pulso por segundo.

# text
seg-f2a0c73ef648 = El modelo de error

# text
# c1: t
seg-6bc3f9e78346 = El error de tiempo previsto tras avanzar por inercia <c1/> segundos desde una solución es

# text
seg-3fbb186c716a = factor de cobertura ({ "3" } es aproximadamente el { "99.7" } % de un error gaussiano)

# text
seg-883965151598 = error de tiempo de una sigma de la solución

# text
# c1: W
# c2: σ_y(W)
seg-b63c0447865f = error de una sigma de la frecuencia conocida en la solución; una frecuencia estimada sobre una ventana <c1/> lleva aproximadamente <c2/>

# text
seg-ab28fc69d3ac = varianza de ruido de fase blanco: jitter del error de tiempo, un suelo constante

# text
# c1: holdover::coast_phase_variance
seg-8792541a7b6d = densidades de FM blanca, de paseo aleatorio y de carrera aleatoria (los términos de van Loan de <c1/>)

# text
seg-5d36b32c4de8 = suelo de FM de flicker de la varianza de Allan

# text
seg-65da5a90685f = desfase fraccionario de frecuencia residual que queda tras la solución

# text
# c1: ΔT
# c2: c_T
seg-816e427d51f9 = desfase de frecuencia por un cambio de temperatura <c1/> a través del coeficiente de temperatura <c2/>

# text
seg-e23d0ac960aa = tasa de envejecimiento lineal

# text
# c1: t²·σ_y²(t)
# c2: σ_y²(τ) = 3σ_PM²/τ² + q_wf/τ + h_F + q_rw·τ/3 + q_rr·τ³/20
# c3: t
# c4: E(t) = guard
seg-43e5f75b369c = Cada término de FM equivale a <c1/> para su propio tipo de ruido, con <c2/> (Zucca y Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Para la FM blanca, de paseo aleatorio y de carrera aleatoria, esa relación es exacta. Para la FM de flicker es la estimación convencional del error de predicción de tiempo (Riley, NIST SP { "1065" }): la FM de flicker no tiene forma cerrada sin un corte de baja frecuencia. Los desfases de frecuencia se suman en módulo porque se desconocen sus signos, de modo que la parte determinista es un peor caso. Todos los términos son no negativos y no decrecientes en <c3/>, por lo que <c4/> tiene una única raíz, hallada por acotación y bisección.

# text
seg-f9038fba23e2 = De dónde procede el reloj

# text
seg-5c44b2f8d015 = Clave del escenario

# text
seg-cb92ae98c231 = Valor predeterminado de la clase

# text
seg-7594664253f2 = una ADEV de un segundo citada y un suelo de ruido rojo sintetizado dos y cuatro décadas por debajo de ella

# text
seg-794e4932b470 = MODELLED: la respuesta para un reloj estable la determina el suelo supuesto

# text
seg-5ea820aaa69f = Perfil de hoja de datos

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-c943490619f3 = los perfiles de temporización de telecomunicaciones (<c1/>, <c2/>, <c3/>, <c4/>), cada uno una hoja de datos de Microchip con nombre

# text
seg-a20353d50011 = MODELLED: una envolvente de los máximos de la hoja de datos

# text
seg-b543f3dcd11a = Hoja de datos en línea

# text
seg-4983ec096617 = la propia tabla de ADEV, de envejecimiento y de coeficiente de temperatura del cliente

# text
seg-b079bca8a611 = MODELLED: una envolvente de los máximos dados

# text
seg-119d94700cab = Registro medido

# text
seg-ae6835f0c3c5 = un registro de fase; su ADEV solapada se ajusta por mínimos cuadrados ponderados

# text
seg-6e1c4702186d = la inversión está VALIDATED con un registro real reservado (más abajo)

# text
seg-f4cc2be238b7 = Las tres clases añadidas en la { "0.28.0" } citan cada una una hoja de datos pública:

# text
seg-47f6ddc3bd02 = ADEV de un segundo

# text
seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, columna del TCXO básico

# text
seg-becbff195fff = Hoja de datos Microchip OX-208, Rev 12-1-2021

# text
seg-19d8d32203f6 = Hoja de datos del patrón de frecuencia de rubidio Microchip 8040C, DS00003047A

# text
seg-48babc170b93 = Las filas de tiempos de promediado largos de EndRun convergen en toda esa tabla ({ "4e-13" } para todos los osciladores salvo el TCXO, { "8e-13" }, a { "10 000" } s, y { "6e-14" } para todos ellos a { "100 000" } s), lo que sugiere que describen el producto disciplinado y no el oscilador en marcha libre, por lo que no se usan.

# text
# c1: edf
# c2: 2σ⁴/edf
# c3: √(edf/2)·(model/σ² − 1)
# c4: extrapolated
seg-85c7211bb49b = <b>El ajuste del registro es ponderado.</b> Una estimación de la varianza de Allan con <c1/> grados de libertad equivalentes tiene una varianza de aproximadamente <c2/>, por lo que cada punto entra con el residuo <c3/>. Un ajuste sin ponderar dejó que los tiempos de promediado cortos decidieran los términos de los tiempos de promediado largos: en un registro de prueba de FM blanca produjo un suelo de flicker espurio que acortó en un { "30" } % una superación de { "2 000" } s. Una hoja de datos o un registro solo respalda tiempos de promediado hasta su punto más largo; una superación más allá se marca como <c4/>.

# text
seg-5b61a42c76c2 = Validación: la inversión sobre un reloj real reservado

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: allantools
# c3: tests/cs5071a_reference.rs
seg-2220a1490923 = <c1/> usa el registro de { "556" } 990 muestras de un patrón de cesio 5071A medido frente a un máser de hidrógeno (A. Wallin, distribuido con <c2/>; el mismo registro que usa la referencia independiente del estimador <c3/>). Con el máser como referencia, el registro es una marcha libre de 6.4 días.

# text
seg-9bae4571f67c = Ajustar el modelo de ruido solo sobre el <b>primer tercio</b> del registro.

# text
seg-15b2cb621db7 = Predecir, a partir de ese modelo, el tiempo de deriva en el que el error de tiempo de una sigma alcanza { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } y { "2.5" } ns.

# text
seg-1bd9ac435bfa = Sobre los <b>otros dos tercios</b>, avanzar por inercia desde un punto de sincronización cada { "997" } s con la frecuencia estimada a partir del tercio anterior, y medir dónde alcanza cada umbral el error de deriva cuadrático medio.

# text
# c1: scripts/fetch_cs5071a.sh
# c2: realdata-clock
# c3: KSHANA_REQUIRE_REALDATA=1
seg-d7640a2ec444 = El umbral para superar la prueba, fijado antes de la primera ejecución de la prueba, es que cada superación predicha quede dentro de un factor de { "1.5" } de la medida. Un control, la ADEV de un segundo leída como FM blanca, debe incumplir ese umbral, de modo que el umbral sepa distinguir un modelo bueno de uno malo. La prueba imprime su tabla; una mutación que reduzca a la mitad el nivel de FM blanca la hace fallar. El registro en bruto son datos de terceros excluidos de git: <c1/> lo descarga y el flujo de trabajo <c2/> ejecuta la prueba con <c3/>, de modo que un archivo ausente hace fallar allí la prueba en lugar de omitirla.

# text
seg-3d11f7c6d4ab = Lo que esto valida: la ruta de ajuste y posterior inversión, sobre un patrón atómico dominado por FM blanca, en derivas de hasta unos { "50 000" } s. Lo que no valida: las fuentes de hoja de datos y de clase, los términos deterministas y un oscilador de cuarzo (sección siguiente).

# text
seg-bfcc5555ed50 = La misma predicción sobre un oscilador de cuarzo real: conservadora, no validada

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: allantools
# c3: scripts/fetch_ocxo.sh
# c4: fix_frequency_sigma
seg-b77b3f503ca2 = <c1/> usa un OCXO medido: { "19 982" } lecturas de frecuencia de un segundo del oscilador de { "10" } MHz de un analizador de impedancia HP, frente a un máser de hidrógeno (A. Wallin, { "2015" }, distribuido con <c2/>; <c3/>). El modelo de ruido y una deriva lineal se ajustan sobre el primer tercio; cada deriva sobre los otros dos tercios parte de una frecuencia estimada a lo largo de los { "100" } s anteriores, y el modelo incorpora la incertidumbre de esa estimación (<c4/>, la propia desviación de Allan del modelo a { "100" } s).

# text
seg-e05821406c28 = Ajustado sobre

# text
seg-c70aadbd47d4 = Superación predicha ÷ medida, de { "0.2" } a { "10" } ns

# text
seg-d71582148b20 = Lectura

# text
seg-dcc3fd23bede = el primer tercio (reservado)

# text
seg-f9bb286f5868 = de { "0.59" } a { "0.70" }

# text
seg-612784f70090 = conservador: nunca más tarde que lo medido, mayoritariamente fuera del umbral de { "1.5" }

# text
seg-121fa832c30f = el propio segmento de evaluación (diagnóstico)

# text
seg-b4be9afa69ac = de { "0.98" } a { "1.17" }

# text
seg-75e1515b970a = la inversión es correcta; la diferencia en el conjunto reservado se debe a que el oscilador cambia

# text
seg-c91da69e9c09 = El suelo de ruido del oscilador se redujo a la mitad durante el registro: la desviación de Allan del primer tercio se aplana cerca de { "7.5e-12" } y la del resto cerca de { "3.5e-12" }. Un modelo ajustado al principio sobrepredice el ruido, que es el sentido seguro. <b>Por tanto, el caso del cuarzo no está validado y sigue siendo MODELLED.</b> Para un cuarzo, ajuste sobre un registro estabilizado y vuelva a ajustar a medida que la pieza envejece.

# text
# c1: fix_frequency_sigma
seg-6230fed0e164 = <b>Cómo se eligió el protocolo, indicado porque no fue a ciegas.</b> Una primera ejecución exploratoria reutilizó el protocolo del cesio (frecuencia del tercio anterior, sin término de frecuencia) y predijo superaciones entre { "1.4" } y { "2.5" } veces más tarde que las medidas: optimista, el sentido peligroso. La frecuencia de un cuarzo deriva, de modo que una frecuencia estimada horas antes de la solución está obsoleta, y el modelo carecía de un término para lo bien que se conoce la frecuencia en la solución. El término <c1/> se añadió por ese motivo y este protocolo se fijó antes de escribir la prueba; el umbral para superar la prueba no se movió. La prueba también comprueba que, sin el término, la predicción dentro de la muestra es optimista en todos los umbrales, por lo que el término es imprescindible.

# text
seg-88e01cac525a = La misma predicción sobre relojes atómicos en órbita: { "8" } de { "10" }, no validada

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-17962966b6d6 = <c1/> usa los relojes combinados finales del IGS a { "30" } s durante { "14" } días (del { "17" } al { "30" } de agosto de { "2025" }; <c2/>, cada archivo fijado por SHA-256): el reloj de cada satélite GPS Block IIF frente a la escala de tiempo del IGS. El protocolo (conjunto de satélites, regla de huecos, ventana de ajuste, una sincronización cada { "3 570" } s con la frecuencia de la hora anterior, umbrales de { "1" } a { "20" } ns, el umbral de { "1.5" } y la regla de que la clase solo se supera si lo hace cada satélite) se redactó antes de descargar ningún dato.

# text
seg-1b5832633c87 = Superación predicha ÷ medida

# text
seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

# text
seg-9a6fac366156 = de { "0.76" } a { "1.46" }

# text
seg-c14941cb5537 = dentro del umbral

# text
seg-dbaaf875f1fb = de { "1.51" } a { "1.99" }

# text
seg-3601e13c39b6 = optimista

# text
seg-ea41cf6dbec2 = de { "1.20" } a { "1.61" }

# text
seg-099fb000bf57 = no evaluado

# text
seg-a7699b256ee1 = excluido por la regla de huecos (falta un día)

# text
seg-eb71202e0b91 = Ocho de diez es una evidencia útil, pero se predice que dos satélites aguantan más de lo que aguantaron, que es el sentido peligroso, y el protocolo exige que todos los satélites superen la prueba. <b>Por tanto, el caso orbital sigue siendo MODELLED.</b> Los satélites Block IIF llevan patrones de rubidio y de cesio y los archivos del IGS no indican cuál está activo, por lo que el resultado se enuncia para los satélites, no para un tipo de reloj. No se ha investigado por qué difieren G25 y G30.

# text
seg-a9be8a92b6b9 = Una ejecución en bench con una pieza representativa de vuelo (delimitada, no realizada)

# text
seg-43597df55508 = El registro público de OCXO dura { "5.5" } horas, procede de un instrumento de laboratorio y el oscilador aún se estaba estabilizando. Lo que validaría el caso del cuarzo es una marcha libre medida más larga de un OCXO representativo de vuelo o de un CSAC frente a una referencia:

# text
seg-e2698f00a84a = un contador de intervalos de tiempo que compare el { "1" } PPS del oscilador con una referencia disciplinada por GNSS o un máser, durante al menos { "10" } días a una muestra por segundo, con la temperatura registrada;

# text
seg-c4c902ac028e = el mismo protocolo con conjunto reservado: ajustar sobre el primer tercio, predecir las superaciones y medir sobre el resto, con el mismo umbral y control;

# text
seg-0faaa6279195 = el registro y su hash publicados junto a la prueba para que la fila sea reproducible.

# text
seg-9b2255563582 = Depende del acceso a hardware de referencia y no se promete.

# text
seg-6cb2dc94d1bf = ¿Frente a qué métrica de wander debe aceptarse una ranura?

# text
seg-f6d24245dca6 = Las normas de temporización ofrecen tres familias de métricas. Para una ranura indexada en el tiempo, solo una de ellas mide lo que rompe la ranura.

# text
seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) es el mayor TIE de pico a pico dentro de cualquier ventana de una longitud dada. Es ciego a un desfase constante: un reloj que está { "1" } µs desviado pero perfectamente estable tiene un MTIE cercano a cero y falla todas las ranuras. Mide cuánto <em>cambia</em> el error, no dónde <em>está</em>.

# text
seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) se construye a partir de diferencias segundas de la fase promediada. Elimina un desfase constante y un error de frecuencia constante, que son exactamente los términos que dominan una deriva. Caracteriza el tipo de ruido; no es una métrica de aceptación para la temporización absoluta.

# text
seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; la métrica de presupuesto de G.8271) es el mayor error de tiempo absoluto frente a la escala de tiempo de referencia. Se compara directamente con una guarda.

# text
# c1: E(t)
# c2: t
# c3: T
# c4: E(T)
# c5: L
seg-7eefc395a118 = <b>Conclusión.</b> Acepte una ranura frente a max|TE| respecto de la escala de tiempo de referencia de la red, evaluada como una envolvente prevista desde la última solución con un factor de cobertura declarado. Eso es lo que es <c1/>: como cada término crece con <c2/>, el máximo en una deriva de duración <c3/> es <c4/>. MTIE y TDEV siguen siendo útiles como diagnósticos: TDEV para identificar qué término de ruido atacar y MTIE(L) para acotar cuánto se mueve el error durante una ranura de duración <c5/>.

# text
seg-51d4ee8484d7 = Dos refinamientos que implica la elección de la métrica:

# text
# c1: guard/√2
# c2: guard/2
seg-a52524111ed7 = <b>La guarda se aplica al error relativo entre dos nodos.</b> Si transmisor y receptor derivan ambos de forma independiente, sus errores estocásticos se suman en cuadratura y sus errores deterministas se suman en módulo. Cuando domina la parte estocástica, a cada nodo puede asignársele <c1/>; cuando dominan el envejecimiento o la temperatura, <c2/>.

# text
seg-073fe7cd8e63 = El factor de cobertura es una decisión de diseño, no una propiedad del reloj.

# text
# c1: k = 3
seg-eb1cbf9fda2d = <c1/> acota aproximadamente el { "99.7" } % de los errores gaussianos en un instante, no en todas las ranuras de un día; un plan de encaminamiento con muchas ranuras al día necesita el riesgo por ranura que pueda tolerar.

# text
seg-04734b8a115b = Spoofing de un receptor en órbita

# text
# c1: spoofing
# c2: orbital_timing::orbital_timing
seg-9e734bbda345 = La sección <c1/> evalúa <c2/> para el mismo reloj:

# text
# c1: ρ
# c2: ρ
# c3: ramp_limited_pull_ns
seg-a2f21a643389 = <b>Geometría.</b> Un spoofer terrestre solo alcanza un satélite LEO mientras el satélite está sobre su horizonte: a { "550" } km, como máximo unos doce minutos por paso cenital. Un spoofer que aplique una rampa de velocidad <c1/> puede por tanto arrastrar el reloj como máximo <c2/> veces esa ventana, o veces el intervalo hasta la siguiente comprobación independiente si este es más corto (<c3/>).

# text
seg-ff59489b08b8 = <b>Dinámica.</b> Un arrastre de tiempo en modo común desplaza todas las pseudodistancias por igual y se absorbe en el sesgo del reloj, no en la posición, por lo que una comprobación de posición con un propagador de órbita no cuenta como comprobación cruzada de temporización.

# text
# c1: tpl
seg-4302cc49b91f = <b>Comprobaciones cruzadas.</b> Un satélite rara vez tiene un segundo receptor de temporización independiente. Tiene la deriva de su propio reloj (el monitor de <c1/>), una transferencia bidireccional de tiempo con una estación terrestre durante los contactos y comparaciones de tiempo por enlaces entre satélites. Un enlace cruzado es independiente de un spoofer terrestre solo si el vecino está fuera de la huella de ese spoofer en el mismo momento, lo que el informe comprueba a partir del número de satélites por plano.

# text
# c1: tpl::timing_protection_level_ns
seg-16c15664a51c = <b>Cota condicionada.</b> El suelo del monitor más la deriva del reloj durante la latencia de detección de CUSUM, que se reduce exactamente a <c1/> cuando el reloj no tiene término de flicker, de fase blanca ni de carrera aleatoria. Como esa cota, solo es válida si hay detección.

# text
# c1: DECEIVED-TIME.md
seg-f7678693be22 = Todo ello es MODELLED: una Tierra esférica y sin rotación, un paso cenital, un spoofer terrestre con una velocidad máxima de rampa declarada. La dirección de llegada de las señales a una antena orientada al cenit es una comprobación cruzada real que requiere un diagrama de antena y no se modela. <a1><c1/></a1> explica por qué un mensaje de control firmado no elimina esta amenaza.

# text
# c1: fix_sigma_ns
seg-070a4e72b5ea = Saltos de frecuencia, efectos de la radiación y desfases relativistas de frecuencia; un modelo térmico (el cambio de temperatura es un escalón en la solución); el propio protocolo de sincronización (una solución restablece el error a <c1/>).

# text
seg-a2766c0f19d0 = <s1>Anterior</s1>Enlaces ópticos a través de la atmósfera

# text
seg-85ad3eb72a80 = <s1>Siguiente</s1>Temporización de telecomunicaciones
