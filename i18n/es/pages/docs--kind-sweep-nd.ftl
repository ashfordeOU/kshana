# docs--kind-sweep-nd: translations (es)

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> El barrido del tipo de escenario <c1/> (de una a tres claves con puntos de cualquier tipo de escenario, sobre los valores de eje del barrido genérico, opcionalmente un conjunto en cada nodo) y la sec. monte_carlo. Referencia independiente (InternalConsistency): La forma cerrada del paseo aleatorio de fase bajo ruido blanco de frecuencia, de varianza q_wf tau (NIST Technical Note { "1337" }), para la maquinaria estadística, y la igualdad byte a byte con las ejecuciones independientes para la siembra. Comprueba la aritmética del conjunto sobre el propio modelo de reloj del motor, no sobre un conjunto de datos externo

# text
seg-d1c11e493795 = Los barridos de parámetros y los conjuntos de Monte Carlo con semilla sobre cualquier tipo de escenario son MODELLED, no están validados: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
seg-ee7dd15019d0 = Página de tema: <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro de interferómetro de átomos fríos a partir de primeros principios (k_eff·T², QPN). Referencia independiente (ExternalDataset): vectores numéricos publicados de artículos primarios de CAI (función de transferencia de Cheinet { "2008" }; sensibilidad de Peters/Freier): k_eff·T² coincide exactamente, el suelo unilateral de la ASD de ruido de disparo dentro de ~{ "2" }× de cada instrumento publicado (los dispositivos reales llevan ruido técnico por encima del suelo cuántico). Una cota, no una paridad. { "0.30" } ronda { "2" } (preregistrada fcb9ac64), un hallazgo (sigue siendo MODELLED): el ruido de rotación solo de QPN frente al medido por Gauguet et al.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Balance de posición compuesto de sesgo + factor de escala + VRW + decaimiento de estabilidad a lo largo del holdover. Referencia independiente (ReferenceImpl): integración SDE de Monte Carlo independiente en numpy del ruido de aceleración blanca doblemente integrado (valida la varianza analítica del VRW con un algoritmo realmente independiente) + un ancla de valor publicado de Groves { "2013" } para los términos de sesgo y de factor de escala; las cifras del dispositivo CAI cuantifican hardware del socio y siguen siendo MODELLED

# text
seg-9955b1b1c018 = El rendimiento de un sensor inercial cuántico es MODELLED, no está validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = La resiliencia de la navegación inercial a estima cuántica es MODELLED, no está validada: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-5a70fcb097dc = Campos opcionales: ninguno

# text
seg-bb07c8ee153f = <b>PARTNER</b> No proporcionado: solo modelos de rendimiento; el hardware de átomos fríos/relojes es del socio. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep-nd.md
seg-792218eac075 = Fuente: <c1/>

# text
# c1: sweep-nd
seg-c7e5582d0b24 = <c1/> (tipo de escenario)

# text
seg-4f19d4fb1341 = Barrido genérico N-D sobre cualquier paquete mediante claves TOML con puntos o rutas de métricas JSON.

# text
# c1: scenarios/sweep-nd-inertial.toml
# c2: inertial
seg-cd907c72698b = Una ejecución de <c1/> se resume así: barrido genérico de <c2/> sobre [threshold_m, accel_classical.bias] | { "15" } nodos (forma [{ "5" }, { "3" }]) | métricas [classical.fom.holdover_s, classical.fom.pos_rms_m]

# text
# c1: base
# c2: axes
# c3: metrics
seg-502ba2c57a5f = Campos obligatorios: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/sweep-nd-inertial.toml
seg-c372e390bb4f = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-621a18c07044 = El gráfico que el motor genera para scenarios/sweep-nd-inertial.toml, tipo de escenario sweep-nd

# text
seg-ce006a6715e9 = <s1>Anterior</s1>spoof

# text
seg-b9f8771ffd3d = <s1>Siguiente</s1>sweep
