# docs--kind-slot-timing: translations (es)

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
# c1: docs/kinds/by-kind/slot-timing.md
seg-09644e40e2d8 = Fuente: <c1/>

# text
# c1: slot-timing
seg-ec92d03eaa6c = <c1/> (tipo de escenario)

# text
seg-1b61962464c5 = Temporización de ranuras: segundos hasta que un reloj libre sale de la guarda de una ranura de enrutamiento o de asignación de tareas indexada en el tiempo (el mayor error de tiempo absoluto que tolera la ranura), la contribución de cada término en ese momento con el dominante nombrado (incertidumbre de la fijación, ruido de fase blanco, ruido de frecuencia blanco, de parpadeo, de paseo aleatorio y de carrera aleatoria, desfase de frecuencia residual, temperatura, envejecimiento), el tiempo restante desde la última fijación y el mayor intervalo de fijación que mantiene al reloj dentro, descontada la latencia de la fijación. El oscilador es un valor por defecto de CLASE (csac, uso, dsac, tcxo, ocxo o rafs: una desviación de Allan citada a un segundo y un suelo de ruido rojo supuesto), un PRESET DE HOJA DE DATOS de temporización de telecomunicaciones o una HOJA DE DATOS en línea (máximos de desviación de Allan ajustados como envolvente, más envejecimiento y un coeficiente de temperatura), o un REGISTRO DE FASE MEDIDO en línea (su desviación de Allan superpuesta ajustada por mínimos cuadrados ponderados en la base de fase blanca y de modulación de frecuencia de IEEE Std { "1139" }, de modo que el suelo de ruido rojo es medido y no supuesto). Una rotura de la guarda más allá del mayor tiempo de promediado que admite la hoja de datos o el registro se marca como extrapolado. Una sección opcional de spoofing añade el nivel de protección de temporización para un receptor en órbita: velocidad y periodo orbitales, cuánto tiempo puede alcanzar al satélite por pase un único spoofer terrestre, el suelo del monitor asistido por reloj y la latencia de detección de CUSUM, la cota condicional, el arrastre que acumula un spoofer con una tasa de rampa máxima indicada antes de que el satélite salga de su alcance o se ejecute una comprobación independiente, y si cada comprobación de contacto con tierra o de enlace cruzado es independiente de ese spoofer. VALIDATED: la inversión de holdover a partir de un registro ajustado, reservada sobre un reloj real de cesio medido frente a un máser de hidrógeno (tests/slot_timing_cs5071a_holdout.rs, condicionada a los datos); sobre un oscilador de cuarzo medido, la predicción reservada es conservadora pero no queda dentro del umbral, de modo que el caso del cuarzo es MODELLED. MODELLED: las fuentes de clase y de hoja de datos, los términos deterministas y la evaluación del spoofing.

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-1284cfee51f0 = Una ejecución de <c1/> se resume así: slot-timing (fuente de hoja de datos): guarda { "100.0" } ns con k={ "3" } se rompe { "650.8" } s después de una fijación (quedan { "50.8" } s); fijación al menos cada { "645.8" } s ({ "133.80" } por día); término dominante: ruido de frecuencia de paseo aleatorio

# text
# c1: oscillator
# c2: slot
seg-97e12e763be3 = Campos obligatorios: <c1/>, <c2/>

# text
# c1: spoofing
seg-6b75ef50497a = Campos opcionales: <c1/>

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-8c4662736bc0 = El ejemplo <c1/> establece, entre otros:

# text
seg-8aee75a55007 = ocxo

# text
seg-df4ca2d859ff = 1/s^{ "3" }

# text
seg-1a282dc35742 = datasheet

# text
seg-c13396b4e57b = Etiqueta del resultado (la del motor): MODELLED — tiempo hasta que un reloj libre sale de la guarda de una ranura de enrutamiento, y cadencia de fijación que lo mantiene dentro, a partir de un modelo estacionario de reloj de ley de potencias. Una fuente de hoja de datos es una envolvente de sus máximos, no una medición de ninguna unidad; una fuente de clase se apoya en un suelo de ruido rojo supuesto.

# attr:alt
seg-97a91c8a60cd = El gráfico que el motor genera para scenarios/slot-timing-ocxo-leo.toml, tipo de escenario slot-timing

# text
seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
# c1: slot-timing
seg-e84e4b49fee0 = <b>VALIDATED</b> La vía de registro medido del tipo de escenario <c1/>: la desviación de Allan superpuesta de un registro de fase ajustada por mínimos cuadrados no negativos ponderados por edf en la base de fase blanca y de modulación de frecuencia de IEEE Std { "1139" } (slot_timing::fit_weighted), Pruebas: <a1>slot_timing_cs5071a_holdout.rs</a1>.

# text
# c1: slot-timing
seg-26ccdbd07a46 = <b>MODELLED</b> El tipo de escenario <c1/>: el error predicho E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para la rotura, el tiempo restante, el intervalo de resincronización descontada la latencia de la fijación y las fijaciones por día, con cada término detallado con su Pruebas: <a1>slot_timing_igs_holdout.rs</a1>.

# text
# c1: slot-timing
seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, accesible como la sección de spoofing del tipo de escenario <c1/>: velocidad y periodo de órbita circular, el mayor tiempo que un spoofer terrestre puede alcanzar al satélite por pase, el suelo del monitor asistido por reloj y la latencia de detección de CUSUM

# text
# c1: slot-timing
seg-8dbc28c3398f = <b>MODELLED</b> El tipo de escenario <c1/>: el error predicho E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para la rotura, el tiempo restante, la resincronización. Referencia independiente (InternalConsistency): Formas cerradas de cada término por separado y la búsqueda de raíz independiente de holdover::holdover_seconds; las cifras de las hojas de datos son las de los documentos citados (docs/SLOT-TIMING.md). Un valor por defecto de clase se apoya en un suelo de ruido rojo supuesto y una fuente de hoja de datos es una envolvente de máximos, de modo que ninguna es una medición de ninguna unidad

# text
# c1: slot-timing
seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, accesible como la sección de spoofing del tipo de escenario <c1/>: velocidad y periodo de órbita circular, el mayor tiempo que un spoofer terrestre puede. Referencia independiente (InternalConsistency): Reducción al nivel de protección de temporización existente y a las formas cerradas de visibilidad de órbita circular y Tierra esférica. Condicionado a la detección, un spoofer terrestre con una tasa de rampa indicada, un pase cenital sobre una Tierra sin rotación; no validado sobre un receptor en órbita sometido a spoofing

# text
# c1: not_modelled[0]
seg-29af1ec87672 = saltos de frecuencia, efectos de la radiación y desfases de frecuencia relativistas (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-89f90cdab1db = un modelo térmico: la excursión de temperatura se aplica como un escalón en la fijación (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-cb3887ccae22 = el propio protocolo de sincronización: una fijación restablece el error a fix_sigma_ns (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-b96fceda31df = frente a qué métrica de deriva debe aceptarse una ranura de enrutamiento; véase docs/SLOT-TIMING.md (resultado <c1/>)

# text
# c1: label
seg-b101457241f2 = MODELLED — tiempo hasta que un reloj libre sale de la guarda de una ranura de enrutamiento, y cadencia de fijación que lo mantiene dentro, a partir de un modelo estacionario de reloj de ley de potencias. Una fuente de hoja de datos es una envolvente de sus máximos, no una medición de ninguna unidad; una fuente de clase se apoya en un suelo de ruido rojo supuesto. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8e3d910f22ed = El oscilador es un valor por defecto de CLASE (csac, uso, dsac, tcxo, ocxo o rafs: una desviación de Allan citada a un segundo y un suelo de ruido rojo supuesto), un PRESET DE HOJA DE DATOS de temporización de telecomunicaciones o una HOJA DE DATOS en línea (máximos de desviación de Allan ajustados como envolvente, más envejecimiento y un coeficiente de temperatura), o un REGISTRO DE FASE MEDIDO en línea (su desviación de Allan superpuesta ajustada por mínimos cuadrados ponderados en la base de fase blanca y de IEEE S (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-f6a831727890 = VALIDATED: la inversión de holdover a partir de un registro ajustado, reservada sobre un reloj real de cesio medido frente a un máser de hidrógeno (tests/slot_timing_cs5071a_holdout.rs, condicionada a los datos); sobre un oscilador de cuarzo medido, la predicción reservada es conservadora pero no queda dentro del umbral, de modo que el caso del cuarzo es MODELLED. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-1cf85cbedffa = MODELLED: las fuentes de clase y de hoja de datos, los términos deterministas y la evaluación del spoofing. (catálogo de tipos (<c1/>))

# text
seg-1a72034c1343 = Página temática: <a1>DECEIVED-TIME.md</a1>

# text
seg-10e6cd8ce00c = <s1>Anterior</s1>reentry

# text
seg-b8ec9e10ee84 = <s1>Siguiente</s1>solar-system
