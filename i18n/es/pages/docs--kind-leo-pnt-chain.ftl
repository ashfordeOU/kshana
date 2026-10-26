# docs--kind-leo-pnt-chain: translations (es)

# text
seg-f42465f7d066 = ns

# text
seg-7f5ad6ab8c23 = GPS

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-49964654d5f4 = Tipo de escenario del motor v{ $version }, familia <a1>Navegación en órbita terrestre baja</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-c5478f572d21 = Página de familia: <a1>Navegación en órbita terrestre baja</a1>

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 sección { "2.4.1" } pasos { "3" } a { "9" } (sigma de referencia a partir de N_wet, longitud efectiva de trayectoria, factor de promediado de antena, profundidad de desvanecimiento para { "0.01" } % a { "50" } % del tiem. Referencia independiente (ExternalDataset): Ejemplos de validación del Grupo de Estudio { "3" } de ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) para el centelleo de P.618-14, con el N_wet de P.453-14 de cada emplazamiento tomado de los mismos ejemplos; incluidos en tests/fixtures/leo_link/p618_14_scintillation.csv con las URL y la fecha de obtención. La expresión de la refractividad húmeda a partir de temperatura y humedad no está cubierta por esta fila

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Retardo de grupo { "40.3" } STEC/f^{ "2" } por banda; los coeficientes libres de ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) y -f2^2/(f1^{ "2" } - f2^{ "2" }) y la amplificación de ruido sqrt(a1^{ "2" } s1^{ "2" } + a2^. Referencia independiente (ExternalDataset): IS-GPS-200 sección { "20.3.3.3.3.2" }, que establece la relación de retardo de grupo L1/L2 gamma = (77/60)^{ "2" } que se sigue del escalado de primer orden 1/f^{ "2" }, y la fórmula de transmisión de Friis (Proc. IRE, { "1946" }). Valida las leyes de escalado, no un TEC oblicuo

# text
seg-ae15d15bf151 = Página temática: <a1>LEO-PASS.md</a1>

# text
# c1: docs/kinds/by-kind/leo-pnt-chain.md
seg-d24f2cccc926 = Fuente: <c1/>

# text
# c1: leo-pnt-chain
seg-3a66efa79aa2 = <c1/> (tipo de escenario)

# text
seg-81d1604171a5 = Un sistema LEO-PNT (posicionamiento, navegación y temporización desde órbita terrestre baja) de extremo a extremo, para cualquier constelación y señal: el diseño leo-signal indicado por signal_design (un preajuste público o un diseño [signal] en línea) fija el centro, el ancho de banda, la tasa de chip y el reparto de EIRP de una banda [pass]; el presupuesto de enlace leo-pass da el C/N0 seguido y la fluctuación de código limitada en banda a lo largo del paso; una recta de C/N0 en sin(elevación) y el SISRE de difusión del mensaje [navmsg] (ajustado a la altitud del satélite del paso) alimentan cada sistema LEO de la fijación conjunta leo-pvt de [fusion] y, opcionalmente, los casos leo-ppp de [ppp]; cada traspaso se lista con su valor y su unidad. MODELLED.

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-9dec9cd6fbfc = Una ejecución de <c1/> se resume así: LEO-PNT de extremo a extremo, constelación genérica de { "1080" } km señal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), piloto seguido a { "10.230" } Mchip/s, desviación de C/N0 -2.57 dB paso LEO-1 { "1080" } km: C/N0 seguido pico { "58.2" } dB-Hz, fluctuación de código mediana { "0.050" } m; recta de C/N0 { "35.6" } + { "24.3" } sin(el) dB-Hz mensaje kepler-rac { "300" } s de ajuste / { "300" } s de actualización: SISRE de representación { "0.907" } mm RMS (órbita { "0.005" } mm), con determinación de órbita de { "0.250" } m: { "0.250" } m transmitidos fijación fusionada: solo GNSS PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m convergencia PPP: solo GNSS { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } valores transmitidos entre etapas. MODELLED.

# text
# c1: signal_design
# c2: pass
# c3: fusion
seg-21babf07292a = Campos obligatorios: <c1/>, <c2/>, <c3/>

# text
# c1: name
# c2: description
# c3: seed
# c4: signal
# c5: navmsg
# c6: od_sisre_m
# c7: ppp
seg-f7bd59312f9b = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-585a1b0d5950 = El ejemplo <c1/> establece, entre otros:

# text
seg-be21370c2446 = joint

# text
seg-f9c560b3c318 = Galileo

# text
seg-28b34c8ae7c5 = galileo

# text
seg-0093705edf63 = Etiqueta de resultado (la del motor): MODELLED: la cadena pasa el resultado de cada etapa a la siguiente; las etapas conservan sus propias etiquetas (filas leo-signal, leo-pass, leo-navmsg, leo-pvt y leo-ppp de la matriz de verificación).

# attr:alt
seg-abe0599498c9 = El gráfico que el motor escribe para scenarios/leo-pnt-end-to-end.toml, tipo de escenario leo-pnt-chain

# text
# c1: leo-pnt-chain
seg-d8b7c2c82566 = <b>MODELLED</b> El tipo de escenario <c1/>: un diseño leo-signal (preajuste público o en línea) fija el centro, el ancho de banda, la tasa de chip y el reparto de EIRP de una banda leo-pass; el paso da el C/N0 del componente seguido y la fluctuación de código limitada en banda por época; un C/ de mínimos cuadrados Pruebas: <a1>leo_pnt_chain.rs</a1>.

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: la integral seno (sine_integral), la fracción de potencia BPSK-R dentro de una banda de doble cara en forma cerrada (bpsk_power_in_band_closed_form), la band-. Referencia independiente (ExternalDataset): Fijados externamente: { "90.3" } por ciento de potencia del lóbulo principal, la fluctuación coherente early-late en el punto de operación declarado, los valores de la tabla de la integral seno y el coeficiente de separación espectral propia de BPSK 2/({ "3" } R_c) con desplazamiento cero. Solo comprobaciones cruzadas internas, no validación externa: la forma cerrada del ancho de banda de Gabor de BPSK limitada en banda y su asíntota, y el coeficiente de separación espectral de BPSK desplazada con desplazamientos distintos de cero, ambos

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> El tipo de escenario <c1/>: diseños de señal parametrizados (banda, ancho de banda de transmisión, asignación ITU; componentes de adquisición, de datos y piloto con BPSK(n), BOC(m,n), MB. Referencia independiente (InternalConsistency): Las formas cerradas validadas de las dos filas anteriores, la identidad de falsa alarma de ley cuadrática P_d(snr = { "0" }) = P_fa y el tiempo medio de adquisición de Holmes, y la reducción a la propia cadena SSC del tipo de escenario de espectro (el mismo código Jammer::ssc). Los diseños en sí son entradas: los preajustes marcados REPRESENTATIVE o WORKSHOP no son especificaciones publicadas, los espectros de QPSK de Feher mejorada, de code shift keying y de OFDM son aproximados, y la forma

# text
# c1: limitations[0]
seg-752b6d88fc9c = La etapa de posicionamiento modela el C/N0 como una recta en el seno de la elevación entre la máscara y el cénit; la cadena ajusta esa recta al C/N0 seguido del paso, por lo que una forma específica del paso (una meseta isoflujo, un borde de haz) se reduce a dos números. (resultado <c1/>)

# text
# c1: limitations[1]
seg-f609a2991c7f = El SISRE transmitido a las etapas de posicionamiento es el error de representación del mensaje de navegación frente a una órbita de referencia integrada por Kshana, más el od_sisre_m declarado del escenario en suma cuadrática; la propia etapa de mensaje no modela determinación ni predicción de órbita. (resultado <c1/>)

# text
# c1: limitations[2]
seg-f75f874cdfaa = La etapa de posicionamiento calcula su propia fluctuación del lazo de enganche de retardo a partir del C/N0 transmitido con una fórmula de ancho de banda ilimitado; el paso informa junto a ella de la fluctuación limitada en banda del diseño real. (resultado <c1/>)

# text
# c1: limitations[3]
seg-174ce18ade58 = La etapa de posicionamiento preciso de punto toma el SISRE del mensaje como error de órbita y reloj LEO; su ruido de código y de fase siguen siendo entradas propias de la etapa. (resultado <c1/>)

# text
# c1: limitations[4]
seg-0aaff940eacb = Un satélite, el primero cuya banda lleva el diseño, representa a todo el sistema LEO en las etapas de paso y de mensaje. (resultado <c1/>)

# text
# c1: label
seg-65930be43134 = MODELLED: la cadena pasa el resultado de cada etapa a la siguiente; las etapas conservan sus propias etiquetas (filas leo-signal, leo-pass, leo-navmsg, leo-pvt y leo-ppp de la matriz de verificación). (resultado <c1/>)

# text
seg-bf452e9ae07f = MODELLED: cada etapa conserva su propia etiqueta; la cadena no añade física. (comentario del archivo de escenario, línea { "25" })

# text
seg-0bff72185f12 = <s1>Anterior</s1>leo-pass

# text
seg-851e55b87d01 = <s1>Siguiente</s1>leo-ppp
