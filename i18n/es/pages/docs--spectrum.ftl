# docs--spectrum: translations (es)

# text
seg-6cb7a787ac67 = Referencias

# text
seg-cbf0f9bcd2d8 = Referencia independiente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-33f4c7af9c53 = Portadora

# text
seg-c5ce76c91ff7 = Etiqueta

# text
seg-a86ce24d81de = Banda

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-72f051e2d7e1 = Señal

# text
seg-47408d30d095 = C/N₀ nominal

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-53a7343c076e = Afirmación

# text
seg-430edd66bda0 = No modelado

# text
seg-64509c048541 = Lo que se modela

# text
# c1: docs/SPECTRUM.md
seg-f07519ff8071 = Fuente: <c1/>

# text
seg-901c3e032de7 = Modelo de espectro y cascada

# text
# c1: spectrum
seg-eac92092dd34 = El tipo de escenario <c1/> construye la banda L del Sistema Global de Navegación por Satélite (GNSS), y cualquier otra banda que ocupe una señal diseñada (frecuencia ultraalta (UHF), banda S, banda C), como una única densidad espectral de potencia (PSD), la hace cambiar a lo largo de una cronología programada de inhibidores y la reduce a lo que le importa a un lazo de seguimiento: la relación inhibidor-señal (J/S) y la relación efectiva portadora-densidad de ruido (C/N₀) de cada banda. Dibuja el resultado como una cascada (frecuencia en horizontal, tiempo hacia abajo, color para la potencia) junto a barras de C/N₀ por banda, y lee y escribe grabaciones en el Formato de Metadatos de Señal (SigMF), de modo que una captura real pueda estimarse y representarse junto al modelo.

# text
seg-0007b6ba97ca = Escriba el ejemplo incluido en un archivo y ejecútelo:

# text
# c1: kshana scenarios/l-band-waterfall-jamming.toml
seg-5e205b189b26 = En una copia de trabajo, <c1/> ejecuta el mismo archivo.

# text
# c1: src/spectrum.rs
# c2: src/sigmf.rs
# c3: src/navsignal.rs
# c4: src/leo_signal.rs
seg-261deb22b4fa = Código: <c1/> (el modelo, el tipo, el estimador de Welch), <c2/> (el códec de grabaciones), <c3/> (los espectros de señal de área unitaria y el coeficiente de separación espectral) y <c4/> (los perfiles de diseño de señal que puede nombrar una banda).

# text
seg-bb1153873209 = Modulación

# text
seg-9758b36b554c = Potencia recibida predeterminada

# text
seg-a1a68286b809 = Ancho de banda del receptor predeterminado

# text
seg-27a2cdc8183f = { "1575.42" } MHz

# text
seg-66a103496266 = modulación por desplazamiento de fase binaria, BPSK({ "1" })

# text
seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

# text
seg-50112ba8867d = { "2.046" } MHz

# text
seg-b7755cb9a384 = portadora de desplazamiento binario multiplexada, MBOC(6,1,1/11), o portadora de desplazamiento binario BOC({ "1,1" })

# text
seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

# text
seg-6dc5e3668a78 = { "14.322" } MHz

# text
seg-f03380403a2a = { "1227.60" } MHz

# text
seg-06c245582533 = BPSK({ "1" }) (códigos CM y CL multiplexados en el tiempo)

# text
seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

# text
seg-1982a811e1ef = { "1176.45" } MHz

# text
seg-dd074e33242e = BPSK({ "10" })

# text
seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

# text
seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

# text
# c1: [[bands]]
seg-3216d5cd918d = GPS (Sistema de Posicionamiento Global) L1 C/A es el código de adquisición gruesa; L2C es la señal civil L2; IS-GPS-200 e IS-GPS-705 son las especificaciones de interfaz de GPS; Galileo OS SIS ICD es el Documento de Control de Interfaz de la Señal en el Espacio del Servicio Abierto de Galileo. Las potencias recibidas son los mínimos de la especificación; los anchos de banda son decisiones de modelado. Ambos pueden sustituirse por banda. Sin una tabla <c1/>, la ejecución usa estas cinco. GLONASS G1/G2, BeiDou B1/B2 y Galileo E6 <b>no</b> figuran entre las bandas con nombre.

# text
# c1: [[bands]]
seg-79cc2ed8195b = Una entrada <c1/> adopta una de tres formas:

# text
# c1: signal_power_dbw
# c2: rx_bandwidth_mhz
# c3: galileo-e1
# c4: modulation = "boc11"
seg-67d0591c69d8 = un nombre de la tabla anterior, con <c1/> y <c2/> opcionales y, para <c3/>, <c4/>;

# text
# c1: signal = "<preset>"
# c2: leo-signal
# c3: name
# c4: xona-x1
# c5: xona-x5
# c6: iridium-stl
# c7: starlink-ku-beacon
# c8: centispace-l1
# c9: centispace-l5
# c10: generic-c-band-leo
# c11: generic-uhf
# c12: generic-l
# c13: generic-s
# c14: generic-c
# c15: generic-c-wide
seg-8596194c81f2 = <c1/>: un diseño de señal de órbita terrestre baja (LEO) o representativo de la biblioteca de perfiles del tipo <c2/> (<a1>LEO-SIGNAL.md</a1>), en cualquier banda, dibujado con todos sus componentes (adquisición, datos, piloto, subportadoras de división de frecuencia) y limitado en banda a su ancho de banda de transmisión; C/N₀ y J/S se refieren al componente seguido, y <c3/> solo lo etiqueta. Los perfiles son <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> y <c15/>;

# text
# c1: name
# c2: centre_mhz
# c3: modulation
# c4: BPSK(n)
# c5: BOC(m,n)
# c6: MBOC(6,1,p)
# c7: signal_power_dbw
seg-2ca46a7f2949 = una banda personalizada: cualquier <c1/> con <c2/>, <c3/> (<c4/>, <c5/> o <c6/>) y <c7/>.

# text
# c1: [[jammers]]
# c2: waveform
seg-fcb0f9fcffbf = Los inhibidores (<c1/>) adoptan una <c2/>:

# text
# c1: cw
# c2: centre_mhz
seg-457e5e95c677 = <c1/>: un tono de onda continua (CW) en <c2/>;

# text
# c1: narrowband
# c2: bandwidth_mhz
seg-3120ac4f6710 = <c1/>: ruido plano en <c2/>;

# text
# c1: wideband
# c2: bandwidth_mhz
# c3: narrowband
# c4: jamming
seg-7d975838a2e6 = <c1/>: ruido plano en un <c2/> ancho (un inhibidor de barrera): la misma densidad que <c3/>, nombrado aparte porque el tipo <c4/> lo puntúa como de banda ancha;

# text
# c1: chirp
# c2: bandwidth_mhz
# c3: sweep_period_us
seg-d13b177946d2 = <c1/>: un barrido lineal en diente de sierra de <c2/> cada <c3/>;

# text
# c1: matched
# c2: matched_to
seg-675fb74a89e4 = <c1/>: ruido de banda ancha cuyo espectro es la propia modulación de la banda <c2/>.

# text
# c1: received_power_dbw
# c2: eirp_dbw
# c3: range_m
# c4: rx_gain_dbi
# c5: jamming
# c6: on_s
# c7: off_s
seg-64d7a14a198e = Cada uno da bien <c1/>, o bien una potencia isótropa radiada efectiva <c2/> con una <c3/> (y opcionalmente <c4/>), que pasa por la pérdida de trayecto en espacio libre del tipo <c5/>. <c6/> y <c7/> programan la cronología.

# text
# c1: [receiver]
# c2: N₀ = k·T_sys
# c3: T_sys = T_ant + 290 K × (F − 1)
# c4: T_ant
# c5: F
seg-8e718c09f7d8 = El receptor (<c1/>) fija el suelo de ruido, <c2/> con <c3/> para la temperatura de antena <c4/> y la figura de ruido <c5/>, y el umbral de seguimiento.

# text
# c1: [grid]
# c2: [[panels]]
# c3: name
# c4: f_min_mhz
# c5: f_max_mhz
# c6: n_freq
seg-9b8078bd0df3 = La cascada principal cubre <c1/> (de { "1160" } a { "1590" } MHz en { "430" } contenedores por defecto). Cada entrada <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, { "200" } contenedores por defecto) añade otra cascada sobre su propio intervalo de frecuencias en la misma cronología, para un espectro que abarca varias bandas.

# text
seg-a550e89c2907 = La cadena de interferencia

# text
# c1: G_s
# c2: G_j
# c3: B
# c4: κ = ∫_B G_s(f) G_j(f) df
seg-12a2c08191c0 = Para una señal de espectro de área unitaria <c1/> y un inhibidor de espectro de potencia unitaria <c2/>, el coeficiente de separación espectral (SSC) sobre la banda del receptor <c3/> es <c4/>, y la densidad efectiva portadora-ruido con varios inhibidores es

# text
# c1: jamming
# c2: Q = 1/(R_c κ)
# c3: jamming_kind_cross_check
# c4: jamming
seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3.ª ed., §{ "9.4" }). Para un solo inhibidor, esta es exactamente la ecuación antiinterferencia del tipo <c1/> con <c2/>; el bloque <c3/> del informe ejecuta las propias funciones del tipo <c4/> con las mismas entradas de enlace e imprime la diferencia, que es cero salvo redondeo.

# text
# c1: jamming
seg-c11d0cb8e670 = El informe imprime también el C/N₀ que da el tipo <c1/> con su tabla de Q. La tabla contiene los valores de los manuales, fijados en las pruebas a las formas cerradas:

# text
# c1: Q = 1
# c2: κ = T_c
# c3: Q = 1
seg-5c21df11e35b = <b>CW y banda estrecha: <c1/>.</b> Un tono CW sobre la portadora C/A tiene <c2/>, por lo que <c3/>, y la tabla y los espectros concuerdan. En el ejemplo incluido, el tono da { "17.98" } dB-Hz con ambos (la tabla daba { "19.74" } cuando contenía { "1.5" }).

# text
# c1: Q = 2
# c2: κ = 1/(2R_c)
# c3: xval/jammer-q/PREREGISTRATION.md
seg-647e209b1efc = <b>Banda ancha y barrido: <c1/>, desde la { "0.36" }.</b> Es ruido blanco sobre el lóbulo principal con la potencia de señal en banda normalizada a uno, <c2/>. La tabla contenía { "1" } hasta la { "0.36" }, unos { "3" } dB pesimista (<c3/>).

# text
seg-cd03b9c900e1 = El modelo de espectro deriva sus propios valores de los espectros:

# text
# c1: Q = 1.5
# c2: κ = 2/(3R_c)
seg-b1327e66260b = <c1/> para ruido adaptado a C/A (<c2/>);

# text
# c1: Q = 2.2
# c2: 2/0.9028
seg-45b2cf032a11 = <c1/> para ruido plano de nulo a nulo sin la normalización (<c2/>).

# text
seg-6c2187f0e32b = Así que, para esos inhibidores, los dos valores de C/N₀ impresos siguen difiriendo, por diseño.

# text
# c1: Q
seg-73dfbeabcac2 = Cada celda de la cascada es la PSD promediada sobre su contenedor de frecuencia y su fila. Un chirp se promedia exactamente sobre la fila, con los barridos completos más el parcial; un inhibidor que se activa o se desactiva a mitad de fila se pondera por su ciclo de trabajo. La cronología de C/N₀ usa los mismos promedios, de modo que la imagen y los números concuerdan. Por banda, la cronología informa de la J/S en banda (potencia del inhibidor dentro del ancho de banda del receptor sobre la potencia de la señal). Por inhibidor y banda, el informe da el SSC, <c1/>, la J/S total, la J/S en banda y el C/N₀ estacionario.

# text
seg-2c214a0a30be = El ejemplo incluido

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-4adc00a3ca10 = <c1/>: una cronología de { "60" } s, una fila por segundo, una antena de { "290" } K y una figura de ruido de { "2" } dB (suelo −{ "201.98" } dBW/Hz).

# text
seg-94d1cebc134d = De { "10" } s a { "40" } s: un chirp de { "16" } MHz en torno a L1, barridos de { "9" } µs, { "50" } mW a { "100" } m.

# text
seg-b85319af4f85 = Desde { "30" } s: un tono CW sobre la portadora L1, { "10" } mW a { "1" } km.

# text
seg-21e2b4e76832 = Desde { "45" } s: ruido plano de { "2" } MHz en L2 recibido a −{ "135" } dBW.

# text
seg-45dd378c692c = Lo que calcula la ejecución:

# text
seg-eecd7d7530bf = C/N₀ mínimo

# text
seg-1ead35e1aad5 = Primera pérdida

# text
seg-bfb55a322ece = Filas con seguimiento

# text
seg-863ea3f1fbe9 = { "3.23" } dB-Hz

# text
seg-9aa0239a3a0c = { "10" } s

# text
seg-9979940d2359 = { "44.73" } dB-Hz

# text
seg-25364ef39455 = { "4.44" } dB-Hz

# text
seg-c8d0bc71cccd = { "41.98" } dB-Hz

# text
seg-c945914c444c = { "36.86" } dB-Hz

# text
seg-9ff066fb53a6 = nunca

# text
seg-63d4f00f622d = { "44.08" } dB-Hz

# text
seg-58b097691919 = El tono CW es la razón por la que las dos señales L1 se separan a los { "40" } s. Cae sobre el pico del espectro de C/A y mantiene C/A en { "17.98" } dB-Hz, por debajo del umbral de { "25" } dB-Hz. Cae en el nulo del espectro MBOC, de modo que Galileo E1 vuelve a su C/N₀ nominal cuando cesa el chirp.

# text
seg-064579d5fbac = Las propias señales quedan unos { "20" } dB por debajo del suelo de ruido, por lo que la cascada muestra el suelo y los inhibidores; las barras de C/N₀ muestran lo que recupera el desensanchamiento.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
seg-023a7f163106 = Los mismos inhibidores impulsan una misión encadenada en <c1/> (véase <a1>CAMPAIGNS.md</a1>): el reloj mantiene el holdover mientras el chirp está activo, y el receptor recurre a Galileo E1 bajo el tono CW.

# text
seg-6b0edbfca134 = Más allá de la banda L

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
# c2: [grid]
# c3: [[panels]]
seg-63d1fd8043ed = <c1/> sitúa señales de posicionamiento, navegación y temporización (PNT) LEO en cuatro bandas junto a GPS L1 C/A y Galileo E5a, cada banda con su propio inhibidor, en una cronología de { "60" } s. La cascada de <c2/> es la banda L; tres <c3/> añaden UHF (de { "455" } a { "475" } MHz), S (de { "2482" } a { "2502" } MHz) y C (de { "5005" } a { "5035" } MHz).

# text
seg-6818247b5863 = { "10" } s: un tono CW en la portadora UHF, −{ "120" } dBW recibidos.

# text
seg-02de8390de31 = { "20" } s: el chirp del ejemplo de banda L ({ "16" } MHz en torno a L1, barridos de { "9" } µs, { "50" } mW a { "100" } m).

# text
seg-47e55dfd4e0d = { "30" } s: ruido de banda ancha, { "40" } MHz en torno a { "1185" } MHz, −{ "118" } dBW.

# text
seg-dfa416032770 = { "40" } s: ruido de banda estrecha, { "2" } MHz en la portadora S, −{ "128" } dBW.

# text
seg-1d119727a749 = { "50" } s: ruido adaptado al propio espectro de la señal de banda C, −{ "124" } dBW.

# text
seg-abacb60b16a3 = Lo que calcula la ejecución (el C/N₀ de las señales diseñadas es el del componente seguido, por lo que el valor nominal queda por debajo de la potencia total recibida en la fracción que corresponde al componente seguido):

# text
seg-1c921b6299e4 = representativa, BPSK({ "5" }), −{ "150" } dBW

# text
seg-5331cde832fb = { "34.38" } dB-Hz

# text
seg-35588b19fd72 = mínimo de la especificación

# text
seg-7d3639369444 = { "3.38" } dB-Hz

# text
seg-9eef1ec7858f = { "38.51" } dB-Hz

# text
seg-c6743d980e6b = diseño publicado, −{ "144.9" } dBW

# text
seg-245bf7d080b3 = { "1190.51625" } MHz

# text
seg-f2aed7e062bf = { "46.29" } dB-Hz

# text
seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

# text
seg-a6f2bb955ca2 = representativa, BPSK({ "10" }), −{ "152" } dBW

# text
seg-b9312cc881d2 = { "40.35" } dB-Hz

# text
seg-03bb124d45d2 = Solo el chirp deja sin señal (GPS L1 C/A, desde los { "20" } s). Cada uno de los demás inhibidores degrada solo la banda que alcanza su espectro: el ruido adaptado de banda C, por ejemplo, tiene un SSC de −{ "71.87" } dB/Hz con la señal de banda C y por debajo de −{ "133" } dB/Hz con todas las demás bandas.

# text
seg-a8bea652a85d = La misma maquinaria impulsa los escenarios de resiliencia LEO-PNT (<a1>LEO-PNT.md</a1>):

# text
# c1: scenarios/leo-resilience-js-margin.toml
seg-cf7bc2f52cad = <c1/> hace avanzar un inhibidor de barrera de { "40" } MHz a { "1185" } MHz en pasos de { "5" } dB cada { "10" } s desde −{ "125" } dBW. GPS L5 se pierde en el paso de −{ "105" } dBW, Galileo E5a en −{ "100" } dBW y Xona X5 en −{ "95" } dBW, mientras que una señal representativa de banda L LEO recibida a −{ "135" } dBW sigue siendo seguida a −{ "90" } dBW: la potencia recibida compra margen de J/S dB por dB.

# text
# c1: scenarios/leo-resilience-multiband-diversity.toml
# c2: spectrum
seg-94b65c0e6087 = <c1/> es un barrido de campaña de una ejecución <c2/> sobre la potencia de una barrera en banda L5 (<a1>CAMPAIGNS.md</a1>).

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: spectrum
seg-67279a0780e4 = <c1/> es una campaña encadenada cuyas fases leen el C/N₀ de GNSS y de LEO de ejecuciones <c2/>, con paneles de banda S y C.

# text
seg-42b00ae14ffe = IQ, SigMF y Welch

# text
# c1: [iq]
# c2: cf32_le
# c3: ci16_le
seg-3418c31c4318 = <c1/> dibuja el modelo en un instante como muestras complejas en fase y cuadratura (IQ), las escribe como una grabación SigMF (<c2/> o <c3/>), vuelve a leer la grabación y estima su PSD por el método de Welch (ventana de Hann, { "50" } % de solapamiento, periodogramas promediados, escalado por densidad). El ruido térmico, las señales y los inhibidores de tipo ruido se dibujan contenedor a contenedor a partir de la propia densidad del modelo; un tono y un chirp se dibujan como formas de onda reales. Con solo inhibidores de tipo ruido, la estimación de Welch queda a { "0.1" } dB del modelo (mediana). Un chirp periódico es un espectro de líneas a su velocidad de barrido, con rizado y colas más allá de los bordes de su banda que el modelo suave omite: en el ejemplo incluido, la potencia total concuerda al { "0.02" } % y el contenedor mediano difiere en { "0.5" } dB. La instantánea es un archivo escrito para su análisis; no se transmite nada y no se maneja hardware de radio.

# text
# c1: [recording]
# c2: meta_path
# c3: .sigmf-data
seg-a3b0a61b5efe = <c1/> (solo en compilaciones nativas) lee una grabación SigMF real desde <c2/> (el archivo de datos toma por defecto el mismo nombre base con <c3/>), estima su PSD y la imprime junto al modelo en las frecuencias de la grabación. Un archivo SigMF no tiene calibración absoluta de potencia, por lo que el informe da el desfase mediano y la forma, no un nivel.

# text
# c1: kshana::sigmf::read
# c2: kshana::spectrum::welch_psd
seg-04b08e06811d = En la compilación WebAssembly no están disponibles las lecturas de archivos; <c1/> y <c2/> funcionan con los bytes que aporta la página.

# text
seg-69b384afe05d = PSD de señal y SSC

# text
# c1: jamming
seg-a65b87c51f05 = Lóbulo principal de BPSK(n) de 2n × { "1.023" } MHz de nulo a nulo; lóbulos de BOC({ "1,1" }) centrados en ±{ "1.023" } MHz (Betz { "2001" }); SSC de −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz para C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) a partir de sus formas cerradas de Parseval, los valores que hay tras los publicados −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) y { "1.5" } (adaptado) (Kaplan & Hegarty §{ "9.4" }); las entradas de la tabla del tipo <c1/> coinciden con las formas cerradas: CW y banda estrecha Q = { "1" }, banda ancha y barrido Q = { "2" } (ruido blanco sobre el lóbulo principal, potencia en banda normalizada; { "1" } hasta la { "0.36" })

# text
seg-d2afc6e05969 = Cascada, J/S y cronología de C/N₀

# text
# c1: jamming
seg-c44413d5a060 = Se reduce exactamente a la cadena del tipo <c1/>; las potencias de los inhibidores, la cronología y los anchos de banda son entradas

# text
seg-304f4aeaf4cb = Códec SigMF y estimación de Welch

# text
seg-7a642dd02e5c = Ida y vuelta, una transformada de Fourier discreta directa, identidades de ruido blanco y de Parseval; no hay ninguna grabación de terceros en el repositorio

# text
seg-1138c9e62a21 = Cascada multibanda con señales diseñadas e inhibidores por banda

# text
seg-ac38681004e9 = Se reduce a la cadena de banda L (una banda de un solo componente da los mismos números que antes de la ampliación) y a los espectros de señal validados; las señales diseñadas, los inhibidores y los anchos de banda son entradas

# text
# c1: tan y = 2y
# c2: y = πf/(2R_c)
seg-0c0c625a8ff5 = Una corrección a un atajo habitual: los lóbulos del espectro de BOC({ "1,1" }) están <em>centrados</em> en ±{ "1.023" } MHz (entre el nulo de la portadora y el nulo en { "2.046" } MHz), pero el máximo de la PSD está en ±{ "0.759" } MHz, donde <c1/> con <c2/>. Las pruebas fijan ambos.

# text
seg-6ab6e241f7e5 = Estructura de líneas del código de ensanchamiento (las líneas de { "1" } kHz de C/A): un tono se puntúa frente a la envolvente suave, no frente a la línea de código más próxima.

# text
seg-4be08100a707 = Control automático de ganancia, cuantización, supresión de pulsos y filtrado de rechazo de banda.

# text
seg-0f195ea4126e = El diagrama de la antena receptora hacia el inhibidor más allá de una cifra de ganancia.

# text
seg-d3d03da9c962 = Interferencia de acceso múltiple entre satélites de una misma banda.

# text
seg-db5c7566f49e = Las emisiones de una señal diseñada fuera de su ancho de banda de transmisión: su espectro se trunca allí, de modo que ninguna emisión fuera de banda llega a una banda vecina.

# text
seg-9cbea7151036 = El efecto de un chirp sobre el lazo a velocidades de barrido comparables al ancho de banda del lazo: su C/N₀ usa el espectro promediado por fila.

# text
seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation", <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

# text
seg-e2225151c10b = E. D. Kaplan y C. J. Hegarty (eds.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3.ª ed., Artech House, { "2017" }, §{ "9.4" }.

# text
seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C", <em>Inside GNSS</em>, mayo/junio de { "2006" }.

# text
seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra", <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

# text
seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

# text
seg-d28b74d8c755 = Especificación SigMF, <a1>https://sigmf.org/</a1> (código fuente: <a2>https://github.com/sigmf/SigMF</a2>).

# text
seg-a9b968473b2a = <s1>Anterior</s1>Integridad y seguridad

# text
seg-d5264da8bf65 = <s1>Siguiente</s1>Referencia de ARAIM
