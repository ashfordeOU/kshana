# docs--kind-leo-pass: translations (es)

# text
seg-ad20a7bebf23 = STL

# text
seg-37d16b499bc5 = dB

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
seg-49964654d5f4 = Tipo de escenario del motor v{ $version }, familia <a1>Navegación en órbita terrestre baja</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-c5478f572d21 = Página de familia: <a1>Navegación en órbita terrestre baja</a1>

# text
# c1: docs/kinds/by-kind/leo-pass.md
seg-fad0b45fd9c2 = Fuente: <c1/>

# text
# c1: leo-pass
seg-f0433f09f033 = <c1/> (tipo de escenario)

# text
seg-c3861f7d717c = Paso LEO y presupuesto de enlace, banda por banda, para LEO-PNT (posicionamiento, navegación y temporización desde órbita terrestre baja), independiente del sistema: un usuario (terrestre, marítimo, aéreo o de interior, estático o en movimiento) y uno o más satélites LEO a partir de un PASO DISEÑADO (una órbita circular situada de modo que el usuario vea un paso de una elevación máxima elegida en un momento elegido, heliosíncrona si se pide), ELEMENTOS explícitos, un TLE (conjunto de elementos de dos líneas) mediante el SGP4 del motor, o una constelación WALKER construida por el código de diseño de constelaciones (se informa de los pasos más altos). Las bandas proceden de un preajuste con nombre (UHF/L/S/C multibanda genérico, banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como señal de oportunidad solo Doppler, CentiSpace, y un preajuste opcional Celeste IOD marcado WORKSHOP) o se escriben en el escenario; cada preajuste indica si sus cifras son PUBLIC (con URL), REPRESENTATIVE o WORKSHOP. Por satélite, banda y época: elevación, acimut, distancia, velocidad de variación de distancia y aceleración de distancia; pérdida de trayecto en espacio libre; EIRP y ganancia del patrón del satélite (isoflujo, haz gaussiano o plano); ganancia de la antena del usuario frente a la elevación (parche, hemisférica o isótropa); atenuación gaseosa (ITU-R P.676-10 Anexo { "2" }), atenuación por lluvia (coeficientes ITU-R P.838-3 y el procedimiento P.618-14, a partir de una tasa y una altura de lluvia), centelleo troposférico (ITU-R P.618-14 sección { "2.4.1" }), pérdida por penetración en edificios para un usuario de interior (ITU-R P.2109-2), desadaptación de polarización, temperatura de ruido del sistema y C/N0 (densidad de portadora a ruido); Doppler y tasa de Doppler en forma cerrada a partir de la velocidad de variación y la aceleración de distancia, cada uno comprobado frente a diferencias centrales; el retardo ionosférico de primer orden { "40.3" } STEC/f^{ "2" } a partir de un TEC oblicuo de Klobuchar o de TEC vertical, escalado a la parte de la ionosfera por debajo del satélite. Los pares de bandas obtienen los coeficientes libres de ionosfera, la amplificación de ruido y el ruido de código en el pico del paso. Los satélites MEO GNSS (preajustes de Galileo o GPS) se evalúan con el mismo modelo de antena y de ruido a partir de las potencias recibidas de sus documentos de interfaz, de modo que el paso LEO en forma de campana y las portadoras GNSS planas comparten un mismo gráfico. Una sección opcional [iot] da el tiempo hasta la primera fijación, la energía por fijación y la duración de la batería frente al ciclo de trabajo para un presupuesto de potencia de receptor declarado (MODELLED). Cada par de bandas da además el TEC oblicuo que recupera su combinación libre de geometría en el pico y el sigma de ruido de código de esa estimación (sondeo de la ionosfera). Una sección opcional [spoofer] falsifica las señales de una posición declarada que salta o es desplazada respecto de la verdadera tras un inicio, y ejecuta dos monitores con probabilidades de falsa alarma y de detección fallida declaradas: coherencia de Doppler y de geometría del paso (velocidades de variación de distancia medidas frente a las predichas a partir de las órbitas y de una posición y velocidad previas independientes, una prueba chi-cuadrado de mínimos cuadrados generalizados sobre una ventana, en los canales GNSS, LEO y todos) y coherencia entre bandas (el paso de época a época de la combinación libre de geometría corregida por modelo de cada par de bandas LEO), que informa de estadísticos por época y de cuándo detecta cada monitor (MODELLED). Componentes VALIDATED: pérdida en espacio libre, los coeficientes P.838-3 frente a su Tabla { "5" }, los procedimientos P.618-14 de lluvia y centelleo y la pérdida por penetración en edificios P.2109 frente a los ejemplos de validación del Grupo de Estudio { "3" } de la ITU-R, la relación de retardo de grupo L1/L2 de IS-GPS-200, y el Doppler máximo de usuario estático de una órbita circular frente a la Tabla { "1" } de arXiv { "2509.19551" }. MODELLED: EIRP, patrones, la fracción de Chapman del TEC por debajo del satélite y todo el paso.

# text
# c1: scenarios/leo-pass-iridium.toml
seg-04509d8245b7 = Una ejecución de <c1/> se resume así: presupuesto de enlace de paso LEO, usuario aéreo en { "50.00" }, -30.00; { "1" } satélite(s) LEO, ventana de { "900" } s Iridium-pass [iridium-stl PUBLIC]: { "781" } km, elevación máxima { "65.0" } deg a { "444" } s, { "750" } s por encima de la máscara STL { "1621.000" } MHz: C/N0 pico { "80.5" } dB-Hz mediana { "71.3" } dB-Hz; |Doppler| máx. { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } a la vista, C/N0 de { "38.2" } dB-Hz a { "51.1" } dB-Hz (mediana { "46.2" } dB-Hz) el pico STL LEO de { "80.5" } dB-Hz está { "34.3" } dB por encima de la mediana GNSS; por encima de la portadora GNSS más fuerte durante { "750" } s

# text
# c1: epoch
# c2: duration_s
# c3: step_s
# c4: user
# c5: atmosphere
# c6: ionosphere
# c7: satellite
# c8: leo_constellation
# c9: gnss
# c10: iono_free_pairs
# c11: iot
# c12: spoofer
# c13: name
# c14: description
# c15: skyline
seg-e6f4e5c502d7 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pass-iridium.toml
seg-e12426a79a2f = El ejemplo <c1/> establece, entre otros:

# text
seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

# text
seg-7cd17bf1ac74 = Iridium STL desde una aeronave

# text
seg-f4d857403ae0 = descendente

# text
# c1: scenarios/
seg-08bc462d676c = { "8" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-ee6d9e6d9556 = Etiqueta de resultado (la del motor): MODELLED: geometría del paso LEO y presupuesto de enlace por banda a partir de EIRP declarados y patrones de antena idealizados con términos de propagación ITU-R; los modelos componentes llevan sus propias etiquetas en la matriz de verificación. No es una medición de ningún satélite.

# attr:alt
seg-02ae51cfada6 = El gráfico que el motor escribe para scenarios/leo-pass-iridium.toml, tipo de escenario leo-pass

# text
seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-69ed19957592 = <b>VALIDATED</b> Ecuaciones ({ "1" }) a ({ "5" }) de ITU-R (Unión Internacional de Telecomunicaciones, Sector de Radiocomunicaciones) P.838-3: k_H, alpha_H, k_V, alpha_V a partir de los ajustes de curva de las Tablas { "1" } a { "4" }, el (k, alpha) dependiente de la trayectoria y de la polarización y la atenuación específica Pruebas: <a1>leo_link_reference.rs</a1>.

# text
seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 sección { "2.2.1.1" } pasos { "2" } a { "10" } (trayectoria oblicua y horizontal por debajo de la altura de lluvia, factores de reducción horizontal y de ajuste vertical, A0.01 y su escalado a { "0.001" } % a { "5" } % de un año medio), con la altura de lluvia (P.839) a Pruebas: <a1>leo_link_reference.rs</a1>.

# text
seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 sección { "2.4.1" } pasos { "3" } a { "9" } (sigma de referencia a partir de N_wet, longitud efectiva de trayectoria, factor de promediado de antena, profundidad de desvanecimiento para { "0.01" } % a { "50" } % del tiempo), con N_wet como entrada o calculado a partir de temperatura, humedad y presión por t Pruebas: <a1>leo_link_reference.rs</a1>.

# text
seg-7e52290d354c = <b>VALIDATED</b> Ecuaciones ({ "1" }) a ({ "10" }) del Anexo { "1" } de ITU-R P.2109-2 con la Tabla { "1" }: la pérdida no superada con probabilidad P para edificios tradicionales y térmicamente eficientes a la elevación de la trayectoria en la fachada, { "80" } MHz a { "100" } GHz; aplicada por banda y época Pruebas: <a1>leo_link_reference.rs</a1>.

# text
seg-ac1927b760d5 = y { "8" } más en la matriz.

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 sección { "2.4.1" } pasos { "3" } a { "9" } (sigma de referencia a partir de N_wet, longitud efectiva de trayectoria, factor de promediado de antena, profundidad de desvanecimiento para { "0.01" } % a { "50" } % del tiem. Referencia independiente (ExternalDataset): Ejemplos de validación del Grupo de Estudio { "3" } de ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) para el centelleo de P.618-14, con el N_wet de P.453-14 de cada emplazamiento tomado de los mismos ejemplos; incluidos en tests/fixtures/leo_link/p618_14_scintillation.csv con las URL y la fecha de obtención. La expresión de la refractividad húmeda a partir de temperatura y humedad no está cubierta por esta fila

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Retardo de grupo { "40.3" } STEC/f^{ "2" } por banda; los coeficientes libres de ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) y -f2^2/(f1^{ "2" } - f2^{ "2" }) y la amplificación de ruido sqrt(a1^{ "2" } s1^{ "2" } + a2^. Referencia independiente (ExternalDataset): IS-GPS-200 sección { "20.3.3.3.3.2" }, que establece la relación de retardo de grupo L1/L2 gamma = (77/60)^{ "2" } que se sigue del escalado de primer orden 1/f^{ "2" }, y la fórmula de transmisión de Friis (Proc. IRE, { "1946" }). Valida las leyes de escalado, no un TEC oblicuo

# text
seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: una búsqueda sobre cada posición de la órbita y cada usuario en el horizonte del satélite de una órbita circular, con la Tierra. Referencia independiente (ExternalDataset): Leclere, Marathe y Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabla { "1" } (receptor estático sobre una esfera de { "6371" } km, siendo la rotación de la Tierra el único otro efecto): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz en L1. Cubre órbitas circulares de dos cuerpos

# text
# c1: leo-pass
seg-b952b2928bbe = <b>MODELLED</b> El tipo de escenario <c1/>: satélites a partir de un paso diseñado, elementos, un TLE mediante SGP4 o una constelación Walker de constellation-design; por banda y época el l. Referencia independiente (InternalConsistency): Formas cerradas y autocoherencia: las identidades de velocidad de variación y aceleración de distancia frente a derivadas numéricas, la ganancia isoflujo que cancela el crecimiento de la distancia, los límites de pérdida de polarización de los manuales, la observación cualitativa LEO frente a GNSS (un paso en forma de campana de minutos que alcanza varios dB por encima de portadoras GNSS planas de 44-51 dB-Hz). Los EIRP y los patrones son potencias recibidas publicadas convertidas en un EIRP o representat

# text
# c1: label
seg-65a0444ca451 = MODELLED: geometría del paso LEO y presupuesto de enlace por banda a partir de EIRP declarados y patrones de antena idealizados con términos de propagación ITU-R; los modelos componentes llevan sus propias etiquetas en la matriz de verificación. No es una medición de ningún satélite. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8b3ffb30c23c = Una sección opcional [iot] da el tiempo hasta la primera fijación, la energía por fijación y la duración de la batería frente al ciclo de trabajo para un presupuesto de potencia de receptor declarado (MODELLED). (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-597be3a6eb96 = Una sección opcional [spoofer] falsifica las señales de una posición declarada que salta o es desplazada respecto de la verdadera tras un inicio, y ejecuta dos monitores con probabilidades de falsa alarma y de detección fallida declaradas: coherencia de Doppler y de geometría del paso (velocidades de variación de distancia medidas frente a las predichas a partir de las órbitas y de una posición y velocidad previas independientes, una prueba chi-cuadrado de mínimos cuadrados generalizados sobre una ventan (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-dbcc7b9c9b9b = MODELLED: EIRP, patrones, la fracción de Chapman del TEC por debajo del satélite y todo el paso. (catálogo de tipos de escenario (<c1/>))

# text
seg-e675c999f303 = MODELLED. Los haces puntuales, el calendario de ráfagas y la forma de onda STL no están modelados. (comentario del archivo de escenario, línea { "14" })

# text
seg-c3665ac09bf6 = Un paso LEO-PNT y su presupuesto de enlace por banda frente a los satélites GNSS MEO a la vista es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-ab0fc0d88556 = Los preajustes de sistemas LEO-PNT con nombre y fuentes declaradas, y un motor independiente del sistema, son MODELLED, no validados: se comprueban frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-ae15d15bf151 = Página temática: <a1>LEO-PASS.md</a1>

# text
seg-3ddcc0ea097f = <s1>Anterior</s1>leo-navmsg

# text
seg-7c0d4c0f536d = <s1>Siguiente</s1>leo-pnt-chain
