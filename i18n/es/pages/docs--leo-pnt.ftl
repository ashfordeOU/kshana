# docs--leo-pnt: translations (es)

# text
seg-46c7e6f003dd = Sistema

# text
seg-cae10fb9bff8 = Escenario

# text
seg-f1f903f1b9ff = Resiliencia

# text
seg-1759a8cce7d6 = Tipos

# text
seg-71aee5eb55c5 = UHF

# text
seg-e305279d5b11 = Contenido

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-587beeccaa11 = Preajuste

# text
seg-b03d56f501c3 = Tipo

# text
seg-6752521002b2 = Parte

# text
seg-cf6ae60eea4f = Auxiliar

# text
seg-0bdbdd2c923b = Sincronización

# text
seg-b09dc4b322d3 = Efemérides

# text
seg-3a835a49b43f = Otros servicios

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
seg-c5ce76c91ff7 = Etiqueta

# text
seg-c1020ac47091 = Qué calcula una ejecución

# text
seg-f708914fed48 = Bandas

# text
seg-486f17197d4d = REPRESENTATIVE, para sistemas de banda C cuyos parámetros no son públicos (por ejemplo, TrustPoint)

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (opcional)

# text
seg-fde146239f5d = Resultado de una ejecución

# text
seg-a3f63252bd1b = Qué incluye

# text
# c1: docs/LEO-PNT.md
seg-7d2c6fbf95b7 = Fuente: <c1/>

# text
seg-6f1f29597f4b = LEO-PNT en Kshana

# text
seg-2a3a1f19005a = LEO-PNT es posicionamiento, navegación y temporización (PNT) desde satélites en órbita terrestre baja (LEO), junto a los sistemas globales de navegación por satélite (GNSS) de órbita terrestre media (MEO), como el Global Positioning System (GPS) y Galileo, o en lugar de ellos. Esta página reúne todos los tipos de escenario y escenarios LEO-PNT del motor: qué calcula cada uno, las bandas y los preajustes de señal y de dónde proceden sus números, qué transporta el mensaje de navegación, qué es VALIDATED y qué es MODELLED, y cómo ejecutar cada escenario. Las páginas de cada tipo de escenario profundizan más:

# text
seg-8e3556046e63 = Página

# text
# c1: leo-signal
# c2: spectrum
seg-cdb06a47be0a = <c1/> (diseños de señal) y los paneles multibanda <c2/>

# text
# c1: leo-pass
seg-09894e033033 = <c1/> (geometría de la pasada y presupuesto de enlace por banda, fijaciones de bajo consumo, sondeo de la ionosfera, monitores de spoofing)

# text
# c1: leo-navmsg
seg-f19c0bfe2996 = <c1/> (el mensaje de difusión: ajustador, algoritmo de usuario, formatos binario y de texto)

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (posicionamiento fusionado, posicionamiento de punto preciso, posicionamiento con red no terrestre (NTN) 5G, temporización, cobertura polar)

# text
# c1: spectrum
seg-29013ad5656c = <c1/> (cascadas de jamming y relación jammer-señal (J/S) por banda)

# text
# c1: campaign
seg-d291250b5d01 = <c1/> (cadenas, barridos, Monte Carlo y composiciones de cualesquiera tipos de escenario)

# text
seg-8d2de8f77619 = Primero, independiente del sistema

# text
seg-f3750a8f2863 = El motor es un simulador LEO-PNT genérico. Cualquier constelación (un patrón Walker, elementos orbitales explícitos, un conjunto de elementos de dos líneas (TLE) mediante el propagador Simplified General Perturbations { "4" } (SGP4), o una pasada única diseñada), cualquier diseño de señal (cualquier banda, cualquier combinación de componentes de modulación por desplazamiento de fase binaria (BPSK), portadora con desplazamiento binario (BOC) y acceso múltiple por división de frecuencia (FDMA)), cualquier modelo de mensaje de navegación. Los sistemas con nombre son preajustes opcionales: archivos de datos, cada uno con su fuente, que solo rellenan lo que un escenario deja sin indicar. Toda capacidad, prueba, referencia independiente y escenario incluido se ejecuta sin ningún dato de Celeste.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: scenarios/*celeste-iod*.toml
# c4: tests/workshop_preset_isolation.rs
seg-4d3bd0301e59 = El preajuste Celeste IOD (demostración en órbita) es un preajuste opcional entre ellos. Sus parámetros de señal se presentaron en el taller LEO-PNT del NAVISP de la ESA (Navigation Innovation and Support Programme de la Agencia Espacial Europea), { "2026" }, y aún no tienen fuente pública. Todo número del motor derivado del taller vive en un único archivo, <a1><c1/></a1>, que <c2/> compila solo cuando existe, y en los escenarios exclusivos del repositorio <c3/>. Eliminar ese archivo y esos escenarios retiene el preajuste sin editar ninguna fuente; el resto de pruebas, referencias independientes y escenarios se ejecutan sin él (<c4/> vigila qué archivos pueden nombrarlo). Esta página no da ninguno de sus números.

# text
seg-5b348102cb63 = Los tipos de escenario y cómo se conectan

# text
seg-120b9be05fc3 = la densidad espectral de potencia (PSD) limitada en banda de un diseño de señal, la potencia en banda, el ancho de banda cuadrático medio (de Gabor), la fluctuación del seguimiento de código frente a la densidad de portadora a ruido (C/N0), la búsqueda de adquisición y los coeficientes de separación espectral (SSC) frente a señales GNSS; un compromiso de bandas (frecuencia ultraalta (UHF), L, S, C)

# text
seg-d9febf3c74c8 = formas cerradas VALIDATED, diseños y compromiso MODELLED

# text
# c1: spectrum
seg-d0d8d1edd9ee = <c1/> (paneles multibanda)

# text
seg-dc3ceb315e9a = cascadas por banda con jammers por banda (onda continua (CW), chirp, banda estrecha, banda ancha, adaptado), con la J/S y el C/N0 efectivo de cada señal a lo largo de una cronología

# text
seg-126a14392994 = espectros VALIDATED, jammers MODELLED

# text
seg-e63f73ab5bca = geometría de la pasada, Doppler y tasa de Doppler, pérdida en espacio libre, antenas del satélite y del usuario, pérdidas gaseosas, por lluvia, por centelleo y por entrada en edificios de ITU-R (Unión Internacional de Telecomunicaciones, Sector de Radiocomunicaciones), C/N0 por banda y época junto a las portadoras GNSS MEO; ionosfera por banda y los pares libres de ionosfera; fijaciones de bajo consumo; sondeo de la ionosfera; monitores de spoofing

# text
seg-a9fd4162604f = componentes VALIDATED, pasada MODELLED

# text
seg-91304e663174 = el mensaje de efemérides y reloj de difusión: ajustador, error de distancia de la señal en el espacio (SISRE) frente al intervalo de ajuste y el periodo de actualización, continuidad de la actualización a mitad de pasada, algoritmo de usuario, trama binaria con una comprobación de redundancia cíclica de 24 bits (CRC-24Q), exportaciones al estilo de RINEX { "4" } (Receiver Independent Exchange Format) y como valores separados por comas (CSV)

# text
seg-cf93a9ba065c = algoritmo de usuario, pesos y CRC VALIDATED, ajustes MODELLED

# text
seg-3084696ad387 = posicionamiento Doppler, fijaciones conjuntas de pseudodistancias GNSS + LEO con sesgos entre sistemas, geometría polar y ártica, transferencia de tiempo a Tiempo Universal Coordinado (UTC), con una traza opcional del error de tiempo por época

# text
seg-79117194e50b = Doppler máximo VALIDATED, el resto MODELLED

# text
seg-1de31fd3cf86 = convergencia del posicionamiento de punto preciso (PPP) solo con GNSS y con capas LEO

# text
seg-525733c10d9b = exactitud del posicionamiento NTN 5G a partir del ancho de banda del enlace descendente (cota de Cramér-Rao)

# text
seg-cb8eee06e664 = un sistema de extremo a extremo: diseño de señal, pasada, mensaje, fijación fusionada y PPP, con cada traspaso listado

# text
seg-d28e18170f82 = cualquiera de los anteriores encadenado en una sola cronología, barrido, ejecutado como conjunto Monte Carlo o compuesto bajo condiciones compartidas

# text
seg-5479654fabfd = La cadena traspasa valores en el código (véase <a1>Cadena LEO-PNT de extremo a extremo</a1> más abajo): el diseño de señal fija el reparto de la EIRP (potencia isótropa radiada equivalente) de la banda de la pasada y la tasa de chips seguida; la pasada da el C/N0 seguido y la fluctuación de código; el SISRE del mensaje de navegación y el C/N0 de la pasada ponderan las mediciones LEO de la fijación fusionada.

# text
# c1: data/leo-signals/generic-bands.toml
# c2: generic-c-band.toml
seg-a0331a21413c = Los diseños genéricos usan centros de banda públicos; cada uno es REPRESENTATIVE, no la señal de ningún sistema (<c1/>, <c2/>).

# text
seg-a86ce24d81de = Banda

# text
seg-daf61ebdca17 = Asignación

# text
seg-ba6fbebc2a98 = Diseño genérico

# text
seg-3332ae549a90 = Centro

# text
seg-c7be6f6797a8 = Ancho de banda de transmisión

# text
seg-74f4e80c65cb = Componentes

# text
seg-e95de3591152 = Retardo ionosférico de primer orden relativo a L

# attr:title
seg-e769f0411e64 = Retirada por su editor; sin copia archivada

# text
seg-8b04e51a023e = no es una asignación de radionavegación (representativo); portadora del <s1>estudio público de openRECEIVER</s1> (página retirada desde entonces; véase <a1>LEO-SIGNAL.md</a1>)

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-8a3026904912 = { "10" } MHz

# text
seg-e1500e8695b9 = BPSK({ "5" }) piloto y datos

# text
seg-ac33d89291ca = servicio de radionavegación por satélite (RNSS), el centro de Galileo E5

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-54e10c07ace3 = BPSK({ "10" }) piloto y datos

# text
seg-5e28b8377751 = servicio de radiodeterminación por satélite (RDSS), la portadora S de NavIC (Navigation with Indian Constellation)

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-a573432714b8 = { "16.5" } MHz

# text
seg-6fe14d537f33 = RNSS, centro de la asignación de { "5010" }–{ "5030" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-0b50907d3165 = { "20" } MHz

# text
seg-c43105d1c770 = C ampliada

# text
seg-c05714081a0e = fuera de la asignación de RNSS (representativo)

# text
seg-638ab0837b29 = { "5100" } MHz

# text
seg-4d3857271629 = { "120" } MHz

# text
seg-18bc5451fc46 = BPSK({ "50" }) piloto y datos

# text
seg-3714e1c00ab8 = S (servicio móvil por satélite, MSS)

# text
seg-cc26934bac14 = enlace descendente MSS, banda n256 del 3GPP (Third Generation Partnership Project)

# text
# c1: ntn-positioning
seg-12ca7304ece7 = usado por <c1/>

# text
seg-896b6ee57728 = { "2172.5" } MHz

# text
seg-e6e1d955489a = { "0.18" } to { "20" } MHz

# text
seg-50e44c7042c9 = señales de posicionamiento de 5G New Radio

# text
# c1: (f_L/f)²
# c2: f_L
# c3: 20·log10(f/f_L)
seg-e75e48eeeca1 = BPSK(n) es la modulación por desplazamiento de fase binaria a n × { "1.023" } Mchip/s. La razón de retardo es <c1/> con <c2/> = { "1191.795" } MHz. La pérdida en espacio libre crece en <c3/> a la misma distancia (−{ "8.2" } dB en UHF, +{ "6.4" } dB en S, +{ "12.5" } dB en C).

# text
seg-02f71b44edf5 = Preajustes de señal y de sistema

# text
seg-c60ce9c32b57 = REPRESENTATIVE, centros de banda del Reglamento de Radiocomunicaciones de la UIT

# text
# c1: generic-bands
# c2: generic-leo
# c3: leo-pass
seg-58fae66f7c12 = <c1/> (diseños de señal): la tabla de bandas anterior; <c2/> (el valor por defecto de <c3/>): UHF a { "450" } MHz, L, S y C en los centros anteriores, EIRP de { "0" } dBW por banda, una capa Walker heliosíncrona 240/12/1 a { "550" } km

# text
seg-5d918965c00c = BPSK({ "10" }) a { "5020" } MHz, haz de isoflujo

# text
seg-dddb031a7e2e = PUBLIC: Leclère, Marathe y Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

# text
seg-67fc4039084d = X1 a { "1593.3225" } MHz ({ "1.023" } Mchip/s) y X5 a { "1190.51625" } MHz ({ "10.23" } Mchip/s), las potencias recibidas mínima y máxima publicadas, { "258" } satélites a unos { "1080" } km (capas de { "53" } y { "97" } grados)

# text
seg-f17f98d1ae0b = PUBLIC: <a1>informe de la Resilient Navigation and Timing Foundation (RNTF)</a1>

# text
# c1: leo-pass
seg-c6694cdbb02b = ráfagas en { "1616" }–{ "1626" } MHz, Doppler de hasta ±{ "36" } kHz, { "66" } satélites a { "780" } km ({ "781" } km en el preajuste <c1/>), potencia recibida «de { "300" } a { "2400" } veces GPS»

# text
# c1: starlink-soo
# c2: starlink-soop
# c3: starlink-sop
seg-704ec002a889 = <c1/> / <c2/> / <c3/> (tipos de escenario de señal, pasada y posicionamiento)

# text
seg-a4a3a7c7bc22 = cifras de señal PUBLIC: Kozhaya, Saroufim y Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; órbita REPRESENTATIVE

# text
seg-49985bf11216 = una baliza de banda Ku de { "240" } MHz usada solo para Doppler, C/N0 de unos { "57" } dB-Hz

# text
seg-84cb50b019e0 = estructura de señal PUBLIC: <a1>PMC10301026</a1>; órbita y potencia REPRESENTATIVE

# text
seg-1c50faed9f1e = BPSK a { "2.046" } Mchip/s cerca de L1 y L5

# text
# c1: atomic-zero-clock
# c2: atomic
seg-c72e9b87f116 = <c1/> (<c2/> en el tipo de escenario de mensaje)

# text
seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, carga útil ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations)</a1>

# text
seg-4f0cff24b4fd = efemérides polinómicas de 6.º orden sin términos de reloj (el reloj se gobierna al tiempo GNSS)

# text
seg-9d1e7aebcd84 = WORKSHOP: presentado en el taller LEO-PNT del NAVISP de la ESA, { "2026" }

# text
seg-28c2e7ae6065 = la configuración de señal n.º 1 de la demostración en órbita y la disposición del mensaje, en el único archivo que se puede retener

# text
seg-9f0d16f43993 = Cada preajuste marca sus números como PUBLIC (con una URL), REPRESENTATIVE (una decisión de diseño documentada, nunca una afirmación sobre un sistema real) o WORKSHOP, y el resultado de cada ejecución que usa uno indica cuál.

# text
seg-556fe9c6c3b1 = El mensaje de navegación

# text
seg-a220662ed8de = Un mensaje de navegación LEO (<a1>LEO-NAVMSG.md</a1>) lleva cuatro partes, la estructura que comparten el Open Service Signal-in-Space Interface Control Document (OS SIS ICD) de Galileo y las propuestas LEO publicadas:

# text
seg-5bda276f6e82 = el conjunto kepleriano de 16 parámetros del ICD de Galileo (raíz cuadrada del semieje mayor, excentricidad, inclinación y su tasa, ascensión recta del nodo y su tasa, argumento del perigeo, anomalía media, corrección del movimiento medio, seis correcciones armónicas, tiempo de referencia), más polinomios de corrección a lo largo de la traza, transversal y radial; o el modelo de 22 parámetros de Liu et al. { "2025" } (<a1>doi 10.3390/rs17162894</a1>); o el polinomio de reloj cero de ATOMIC

# text
seg-8a7dabfece01 = número de semana y tiempo de semana (TOW), y un polinomio de reloj de segundo orden (af0, af1, af2 respecto a toc)

# text
seg-24eaf4ae7eb3 = identificador del vehículo espacial (SVID), edición de datos (IOD), salud de la señal

# text
seg-e7d819b7a724 = correcciones ionosféricas para usuarios monofrecuencia (un conjunto de estilo Klobuchar y NeQuick-G ai0–ai2) y el desfase del tiempo del sistema a UTC (A0, A1, segundos intercalares y su calendario)

# text
seg-200e59d9279c = La trama binaria es la codificación documentada propia de Kshana, modelada sobre estos componentes, no la disposición de bits de ningún sistema. RINEX { "4.02" } no define registros de navegación LEO, de modo que la exportación de estilo RINEX es una extensión documentada de Kshana (antecedentes: <a1>arXiv { "2401.17767" }</a1>).

# text
# c1: campaign
# c2: spectrum
seg-aa18ab84599b = barrido <c1/> de <c2/>

# text
seg-70dc120ea19e = una interferencia de banda ancha de { "50" } MHz a { "1185" } MHz barrida de −{ "140" } a −{ "80" } dBW: GPS L5 se pierde a −{ "105" } dBW, Galileo E5a y la señal LEO en banda L a −{ "100" } dBW; las señales LEO de bandas UHF, S y C conservan { "49.4" }, { "49.2" } y { "47.4" } dB-Hz a cualquier potencia

# text
seg-61f05d7e3a18 = una interferencia de banda ancha de { "40" } MHz a { "1185" } MHz que sube { "5" } dB cada { "10" } s desde −{ "125" } dBW: GPS L5 se pierde a −{ "105" } dBW, Galileo E5a a −{ "100" } dBW, Xona X5 (en su mínimo publicado, −{ "144.9" } dBW) a −{ "95" } dBW; una señal LEO genérica a −{ "135" } dBW aún se sigue a −{ "90" } dBW ({ "28.9" } dB-Hz). La potencia recibida compra margen de J/S dB por dB

# text
seg-6a3a46be60a5 = un salto de posición de { "30" } m en un emplazamiento topografiado: la prueba Doppler solo con GNSS nunca lo detecta; la prueba sobre todos los canales sí, { "105" } s después del inicio (véase <a1>LEO-PASS.md</a1>)

# text
# c1: campaign
# c2: leo-pass
seg-d0c4683d7c93 = composición <c1/> de <c2/>

# text
seg-bf0ec52f63ea = cuatro spoofers, ambos monitores: un spoofer solo de banda L y un spoofer de todas las bandas sin ionosfera son detectados por el monitor entre bandas en el inicio ({ "300" } s) y por el monitor Doppler a { "420" } s y { "395" } s; un spoofer de todas las bandas con ionosfera, solo por el monitor Doppler ({ "395" } s); un empuje de { "30" } m solo en GNSS, por ninguno

# text
# c1: campaign
# c2: spectrum
# c3: integrity
seg-17bcc4ead2ee = cadena <c1/> (<c2/>, <c3/>)

# text
seg-d9b6e6fe6807 = GNSS interferido durante { "15" } minutos (el código de adquisición gruesa (C/A) de GPS L1 hasta unos { "10" } dB-Hz, E5a hasta { "17.4" } dB-Hz frente a un suelo de { "25" } dB-Hz) mientras las señales LEO de bandas S y C mantienen { "49.2" } y { "47.4" } dB-Hz; la monitorización autónoma de la integridad del receptor (RAIM) solo sobre la capa LEO forma un nivel de protección en cada época, por debajo del límite de alerta vertical de { "50" } m en { "28" } de { "30" } instantes de la malla, con la alarma activada en los otros dos; fases nominal y de recuperación de { "5.4" } a { "15.6" } m

# text
# c1: multi-band-jamming-waterfall
seg-42efdd12fc54 = Los monitores de spoofing, sus estadísticos y sus límites están en <a1>LEO-PASS.md</a1>. La cascada multibanda con un jammer distinto por banda es <c1/> (<a2>LEO-SIGNAL.md</a2>).

# text
seg-d9e58c4aa8d5 = Un escenario por área temática de experimento

# text
seg-1ab626f27e9d = Las ocho áreas temáticas de experimento de la convocatoria de experimentación de terceros de Celeste IOD (Open Space Innovation Platform de la ESA, OSIP) son preguntas genéricas de LEO-PNT; cada una tiene un escenario independiente del sistema:

# text
seg-afc60ca3c9da = Área temática

# text
seg-8a8f40ce3e40 = Posicionamiento de alta exactitud (PPP)

# text
# c1: campaign
# c2: leo-ppp
seg-b5eb3448dbb1 = barrido <c1/> de <c2/>

# text
seg-5692301bc7cf = una capa de 192 satélites a { "500" }, { "1000" } y { "1500" } km reduce la convergencia del PPP multi-GNSS en coma flotante en Múnich de { "13.0" } min a { "3.25" }, { "3.25" } y { "3.5" } min (seis realizaciones, épocas de { "30" } s)

# text
seg-3992215bc8c9 = Resiliencia de PNT (L, S, C)

# text
seg-a2cc270b415c = véase Resiliencia

# text
seg-8a6381ff15ac = Compatibilidad de NTN 5G/6G

# text
# c1: campaign
# c2: ntn-positioning
seg-ae21ac79775f = barrido <c1/> de <c2/>

# text
seg-cb52e7eb3c36 = ancho de banda de referencia de posicionamiento de { "180" } kHz a { "20" } MHz: sigma de distancia cenital de { "6.5" } m a { "5.8" } cm, error 3D de tiempo de llegada de { "30.1" } m a { "2.1" } m, con el suelo del error de sincronización de red de { "1" } m

# text
seg-45985b521980 = PNT de bajo consumo para Internet de las cosas (IoT) y móviles

# text
# c1: campaign
# c2: leo-pass
# c3: [iot]
seg-9afaaed509ef = barrido <c1/> de <c2/> <c3/>

# text
seg-3bb8cc776a28 = EIRP en UHF de −{ "35" } a +{ "5" } dBW: por debajo de un C/N0 mediano de unos { "35" } dB-Hz la energía por fijación en arranque en caliente sube de { "18" } mJ a { "55" } J; por encima, la vida de la batería con una fijación por hora es de { "8334" } días, determinada por la corriente de reposo

# text
seg-4b0890bd9215 = Ciencia LEO-PNT

# text
seg-a1ddeda103fa = contenido total de electrones (TEC) oblicuo de cada par de bandas de una pasada de cuatro bandas sobre Tromsø: { "18.85" } unidades de TEC recuperadas por cada par, 1 sigma de { "0.017" } (UHF con L) a { "2.9" } unidades de TEC (S con C)

# text
seg-fc31db33e6fe = Servicios de datos PNT adicionales

# text
# c1: campaign
# c2: leo-navmsg
seg-91db4e7b4d9c = composición <c1/> de <c2/>

# text
seg-aee8bb27a2fb = la trama de mensaje de Kshana crece de { "146" } bytes (efemérides y reloj, { "1045" } bits) a { "154" } con el conjunto de Klobuchar, { "159" } con NeQuick-G y { "171" } con los parámetros de UTC

# text
seg-bd6c76037986 = Navegación en interiores (UHF)

# text
seg-0a274a3aeb86 = C/N0 máximo en interiores en un edificio tradicional: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; en uno térmicamente eficiente, UHF { "15.3" } dB-Hz y todas las demás bandas menos

# text
seg-101de8218f35 = PNT fusionado MEO + LEO

# text
# c1: campaign
# c2: leo-pvt
seg-b4daa58a2fe7 = barrido <c1/> de <c2/>

# text
seg-903d8dcb96cc = Xona X5 fusionado con GPS y Galileo sobre Madrid: error 3D solo con GNSS de { "1.06" } m cuadrático medio (RMS); fusionado { "0.08" } m con un SISRE LEO de { "5" } cm, { "0.57" } m con { "0.5" } m y { "1.01" } m con { "5" } m

# text
seg-ebe7a27275cb = Un escenario por vertical de usuario final

# text
# c1: campaign
# c2: leo-pass
seg-7c21d067769a = Cada vertical es una cadena <c1/> en una sola cronología, de modo que se anima, y cada una tiene un miembro <c2/>, de modo que exporta geometría (véase <a1>Ejecutar un escenario</a1>).

# text
seg-1d1135625500 = Vertical

# text
seg-f1a7e54ea7d0 = Vehículos autónomos

# text
seg-3610a5f7c352 = un coche en Múnich: carretera abierta, error fusionado de { "0.30" } m de media; en un cañón urbano de { "35" } grados GPS y Galileo conservan { "8" } satélites y un error medio de { "5.8" } m, la capa LEO genérica añade de { "4" } a { "5" } y lo lleva a { "2.1" } m, todavía por encima del umbral de { "1.5" } m de nivel de carril en cerca de la mitad de las épocas del cañón

# text
seg-6622d9c7366d = Ferrocarril y marítimo

# text
# c1: maritime-strait-jamming
# c2: rail-tunnel-coast
seg-73ba745cb492 = el barco incluido <c1/> pierde todos los satélites GNSS ({ "12.1" } dB-Hz) mientras su pasada LEO en bandas S y C alcanza { "44.2" } y { "38.1" } dB-Hz; el tren incluido <c2/> alcanza { "2" } m de error inercial { "35.8" } s después de entrar en el túnel; a cielo abierto su pasada LEO da de { "35" } a { "50" } dB-Hz en L

# text
seg-c87973b9139a = Infraestructuras críticas

# text
seg-c16a4c99e132 = el oscilador de clase TCXO (cristal compensado en temperatura) de un servidor de tiempo de subestación en funcionamiento libre durante un día sin GNSS alcanza { "29" } µs, superando la guarda de { "1" } µs entre { "75" } y { "80" } minutos después de la pérdida (en la malla de 5 minutos); la misma clase disciplinada con Iridium se mantiene entre −{ "40" } y +{ "11" } ns

# text
seg-1be8e11b2530 = Usuarios polares y árticos

# text
seg-660e450cb4ab = dilución de precisión de posición (PDOP) media de GPS + Galileo de { "1.38" }, { "1.57" } y { "1.62" } en Tromsø, Svalbard y el Polo Norte; con Iridium { "1.29" }, { "1.34" } y { "1.26" }, con { "3.0" }, { "5.5" } y { "6.8" } satélites Iridium a la vista

# text
seg-22d99734acf1 = Redes inalámbricas 5G/6G

# text
# c1: telecom-timing
seg-abcc6337206f = el oscilador de cristal con control de horno (OCXO) de una estación base en holdover supera el límite de red de { "1.1" } µs tras { "8863" } s y el límite de aplicación final de { "1.5" } µs tras { "10006" } s (el análisis del tipo de escenario <c1/>); disciplinado con Xona X5 su error de tiempo se mantiene entre −{ "0.7" } y +{ "0.3" } ns todo el día, con una sigma de 1 prevista de { "5" } ns, la incertidumbre declarada del desfase UTC de difusión

# text
seg-532d6814ab2d = Seguimiento de activos e IoT

# text
seg-b4d6d822e1d0 = la fijación UHF en caliente de una etiqueta de contenedor cuesta { "18" } mJ en el muelle y en el mar ({ "8334" } días de batería con una fijación por hora) y { "34" } mJ en un almacén ({ "5770" } días), donde la banda L cae a { "20" }–{ "24" } dB-Hz

# text
seg-e54b0342fa79 = VALIDATED y MODELLED

# text
seg-dd808d1741f3 = Una fila es VALIDATED solo cuando una prueba reproduce una configuración publicada y fija la cifra publicada dentro de una tolerancia declarada; todo lo demás es MODELLED con su justificación (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

# text
seg-592a6cf625c5 = Filas LEO-PNT VALIDATED:

# text
seg-344712930047 = potencia de señal limitada en banda de forma cerrada y fluctuación de seguimiento de código temprano-tardío en puntos de operación publicados (Betz y Kolodziejski { "2009" }), con el ancho de banda de Gabor y el SSC contrastados;

# text
seg-e93d5b5d3dda = el Doppler máximo de un satélite de navegación LEO (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz) y la envolvente de Doppler de usuario estático frente a arXiv { "2509.19551" } Tabla { "1" };

# text
seg-b02c1b42e509 = los coeficientes de lluvia de ITU-R P.838-3, la atenuación por lluvia de P.618-14 y el centelleo troposférico, y la pérdida por entrada en edificios de P.2109-2 frente a los datos de validación de la Comisión de Estudio { "3" } de ITU-R;

# text
seg-fc668542b66d = el escalado del retardo ionosférico de primer orden y la pérdida en espacio libre (razón de retardo de grupo de IS-GPS-200, la forma de Friis);

# text
seg-59847c667c8b = los pesos de SISRE de promedio global (Montenbruck et al. { "2018" }), el algoritmo de usuario del ICD de Galileo frente a RTKLIB sobre efemérides de difusión reales y CRC-24Q frente a su valor de comprobación de catálogo.

# text
seg-922761c46f8a = Filas LEO-PNT MODELLED: todo diseño de señal y compromiso de bandas, la cascada multibanda, toda pasada y presupuesto de enlace en su conjunto, los preajustes, las fijaciones de bajo consumo, el ajustador y los formatos del mensaje, el posicionamiento Doppler y conjunto, la convergencia de PPP, el posicionamiento NTN, la transferencia de tiempo, la cobertura polar, la cadena de extremo a extremo, los monitores de spoofing y el sondeo de la ionosfera, y toda campaña (una campaña compone tipos de escenario y no añade física; sus identidades de composición se prueban, <a1>CAMPAIGNS.md</a1>). Ningún C/N0 LEO, error de distancia ni cifra de posicionamiento se compara con una medición de ningún satélite.

# text
seg-3cc1d3f1c0f8 = Ejecutar un escenario

# text
# c1: kshana example <name>
seg-00d5b60c0ebb = Todo escenario anterior está incluido: <c1/> lo imprime, y

# text
# c1: .result.json
# c2: .chart.svg
# c3: .report.html
# c4: .report.json
# c5: .animation.html
seg-e01ebe977e65 = escribe, junto al archivo, el resultado (<c1/>), el gráfico (<c2/>), el informe avanzado (<c3/> y <c4/>, con una sección que incrusta la ejecución animada y enumera las exportaciones), el reproductor interactivo (<c5/>) y las exportaciones. Lo que se aplica depende del tipo de escenario:

# text
# c1: leo-pass
# c2: spoof.series
# c3: spectrum
# c4: leo-pvt
# c5: leo-ppp
# c6: --animate
# c7: leo-resilience-multiband-diversity
# c8: leo-resilience-spoof-monitors
# c9: leo-focus-*
# c10: leo-focus-science-iono-sounding
# c11: --animate
seg-8a96eda978b4 = una ejecución con eje de tiempo se anima: épocas de <c1/>, el <c2/> de una ejecución de spoofing, cronologías de <c3/>, épocas conjuntas y trazas de temporización de <c4/>, curvas de error de <c5/> y toda cadena de campaña. Un barrido o una composición no tiene eje de tiempo: <c6/> lo rechaza con estado de salida { "1" } y entonces el comando no escribe nada en absoluto, así que ejecute los ocho barridos y composiciones anteriores (<c7/>, <c8/> y todo escenario <c9/> salvo <c10/>) sin <c11/>;

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: <name>.<member>.czml
seg-8d26148aeeff = <c1/> y <c2/> exportan efemérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON y STK (Systems Tool Kit) de la geometría de la pasada; una campaña exporta cada miembro que tiene geometría como su propio conjunto de archivos, con la etiqueta del miembro en el nombre del archivo (<c3/>), de modo que cada vertical exporta sus pasadas LEO; los demás tipos de escenario LEO indican por qué un formato no se aplica (<a1>INTEROP.md</a1>).

# text
seg-6f3ad057f914 = Los demás escenarios LEO, por tipo de escenario (los detalles están en la página de cada tipo de escenario):

# text
# c1: leo-band-trade
# c2: xona-pulsar-signals
# c3: celeste-iod-classical-pilot-signals
seg-73365a12bf64 = <c1/>, <c2/>, opcional <c3/>

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-pass-xona-pulsar
# c3: leo-pass-iridium
# c4: leo-indoor-uhf
# c5: leo-iot-energy
# c6: leo-pass-celeste-iod-multiband
seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcional <c6/>

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
# c5: leo-navmsg-celeste-iod
seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, opcional <c5/>

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: polar-arctic-leo-coverage
# c5: leo-timing-utc
# c6: celeste-iod-fused-pvt
seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcional <c6/>

# text
# c1: leo-pnt-end-to-end
# c2: xona-pulsar-end-to-end
# c3: celeste-iod-end-to-end
seg-e3017b224dfc = <c1/>, <c2/>, opcional <c3/>

# text
seg-1ada84b384ee = Los escenarios opcionales son exclusivos del repositorio y se retienen junto con el archivo del preajuste de Celeste.

# text
# c1: leo-pnt-mega-shell
# c2: constellation-design
# c3: slot-timing-ocxo-leo
# c4: slot-timing
seg-6305e46ec778 = Dos de ellos están en otros tipos de escenario. <c1/> (<c2/>) dimensiona una constelación LEO-PNT de 5000 satélites en cuatro capas Walker ilustrativas: disponibilidad de { "99.22" } % con un PDOP de { "3" } o menos por encima de una máscara de { "20" }°, PDOP mediano de { "1.11" } y { "39.4" } satélites a la vista de media en { "648" } puntos de malla y { "12" } épocas. <c3/> (<c4/>) pregunta cuánto tiempo permanece el OCXO de la hoja de datos de un smallsat LEO dentro de una guarda de ranura de { "100" } ns con k = { "3" } tras su última fijación GNSS: la guarda se rompe { "650.8" } s después de una fijación, de modo que necesita una fijación al menos cada { "645.8" } s ({ "133.8" } al día), con el ruido de frecuencia de paseo aleatorio como término dominante.

# text
seg-ee9f20a4485b = Cadena LEO-PNT de extremo a extremo

# text
# c1: leo-pnt-chain
# c2: src/leo_pnt_chain.rs
seg-a6167db680ba = El tipo de escenario <c1/> (<a1><c2/></a1>) sigue un sistema LEO-PNT desde su diseño de señal hasta la posición del usuario. Cada etapa es un tipo de escenario propio del motor, ejecutado en su propia tabla del escenario de la cadena, y la cadena traspasa valores de una etapa a la siguiente en el código:

# text
seg-38ce4c90dd78 = Origen

# text
seg-2cbf005ed5cc = Destino

# text
seg-5d84d64174b6 = Qué se traspasa

# text
seg-15372352ab42 = la cuota de potencia del componente seguido, la fracción en banda y la tasa de chips seguida (el reparto de la EIRP de la banda y su desfase de C/N0)

# text
# c1: [navmsg.orbit]
seg-0be525c6b695 = la altitud y la inclinación del satélite de la cadena (la órbita de referencia del mensaje), salvo que <c1/> las indique

# text
seg-d2306e118be7 = el C/N0 seguido en la máscara de posicionamiento y en el cenit, a partir de una recta de mínimos cuadrados en sen(elevación) ajustada a la pasada

# text
# c1: od_sisre_m
seg-ee40b8cd109b = el error de distancia de la señal en el espacio (SISRE): el error de representación del mensaje (cuadrático medio, órbita y reloj) con el término de determinación de órbita <c1/> del escenario en suma cuadrática

# text
seg-b4b3dff58f3b = la frecuencia de portadora y la tasa de chips seguida

# text
# c1: handoffs
# c2: [pass]
# c3: signal = "<design>"
# c4: leo-pass
# c5: leo-signal
seg-4def115dba1b = Un valor se traspasa solo donde la tabla posterior lo deja sin indicar, y cada traspaso se enumera en la matriz <c1/> del resultado con su valor, unidad y destino. Una banda de <c2/> debe nombrar el diseño (<c3/>); así una banda <c4/> lleva también por sí sola cualquier diseño <c5/>: toma la frecuencia central del diseño, el ancho de banda de transmisión y la tasa de chips seguida, reparte su EIRP entre los componentes e informa del C/N0 del componente seguido y de la fluctuación de seguimiento de código temprano-tardío coherente de banda limitada (Betz y Kolodziejski { "2009" }; espaciado de medio chip, lazo de { "1" } Hz, { "20" } ms) en cada época.

# text
# c1: generic-l
seg-2a2b15256cf4 = generic: el diseño representativo <c1/>, un paso de { "1080" } km, { "53" }° sobre Madrid, una capa Walker de 240 satélites

# text
seg-bb05e8e505e3 = pico de C/N0 seguido { "58.2" } dB-Hz, fluctuación de código mediana { "0.050" } m; SISRE { "0.250" } m transferido; error 3D de raíz cuadrática media (RMS) solo con GNSS { "1.60" } m, GNSS + LEO { "0.43" } m; convergencia del posicionamiento puntual preciso (PPP) { "11.5" } min solo con GNSS, { "7.5" } min con la capa LEO

# text
seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), la capa inclinada para el posicionamiento y ambas capas para el PPP

# text
seg-a8fe501bf419 = pico de C/N0 seguido { "66.3" } dB-Hz, fluctuación de código mediana { "0.018" } m; error 3D RMS solo con GNSS { "1.49" } m, GNSS + LEO { "0.68" } m; convergencia del PPP { "20.6" } min solo con GNSS, { "5.9" } min con Pulsar

# text
# c1: celeste-iod-end-to-end
seg-002e4c918dda = <c1/> (opcional)

# text
seg-a608af78a360 = configuración n.º 1 de Celeste IOD E5 con el preajuste de mensaje de Celeste (retenida junto con el preajuste)

# text
seg-be428c21bd27 = el paso reproduce el pico de C/N0 total para el que está calibrado el preajuste (el valor reside en el archivo del preajuste); dos satélites apenas modifican una solución fusionada de 95 minutos ({ "1.50" } m a { "1.48" } m RMS 3D)

# text
seg-bf44ba47e48b = escribe el resultado, el gráfico, el informe avanzado (que incorpora el paso animado y enlaza las exportaciones), el reproductor interactivo y archivos de efemérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON y STK (Systems Tool Kit) con la geometría del paso.

# text
# c1: od_sisre_m
seg-a08e67a32d60 = La cadena es MODELLED: no añade física y cada etapa conserva sus propias etiquetas. El modelo de C/N0 de la etapa de posicionamiento es una recta en sin(elevación), de modo que una forma propia de cada paso se reduce a dos números; la etapa de mensaje no modela la determinación de órbita, por lo que <c1/> es una entrada declarada ({ "0.25" } m en los escenarios incluidos, representativo de la determinación de órbita a bordo de nivel decimétrico y del reloj a escala de chip dirigido que notifica la carga útil ATOMIC: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

# text
seg-ee3c5b58e6fa = <s1>Anterior</s1>Órbita y superficie lunares como infraestructura

# text
seg-6b951d6413c8 = <s1>Siguiente</s1>Diseños de señal LEO

seg-9bfe27f7ebc5 = <s1>Anterior</s1>Hilo de misión: el segmento lunar
