# docs--leo-signal: translations (es)

# text
seg-3ea93ae372ca = Qué contiene

# text
seg-6cb7a787ac67 = Referencias

# text
seg-cbf0f9bcd2d8 = Referencia independiente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-587beeccaa11 = Preajuste

# text
seg-6752521002b2 = Parte

# text
seg-2b0d77219437 = Preajustes

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-c5ce76c91ff7 = Etiqueta

# text
seg-a86ce24d81de = Banda

# text
seg-74f4e80c65cb = Componentes

# attr:title
seg-e769f0411e64 = Retirada por su editor; sin copia archivada

# text
# c1: docs/LEO-SIGNAL.md
seg-2255f9acec5b = Fuente: <c1/>

# text
seg-ff4c44ecdecb = Diseños de señal LEO-PNT y el espectro multibanda

# text
# c1: leo-signal
# c2: spectrum
# c3: leo-pass
# c4: leo-pnt-chain
seg-5e222f965192 = El tipo de escenario <c1/> analiza las señales de posicionamiento, navegación y temporización (PNT) de órbita terrestre baja (LEO). No está ligado a un solo sistema. Una señal es un diseño parametrizado (datos, no código), de modo que el mismo tipo analiza una señal comercial publicada, un diseño representativo para una banda que nadie ha publicado, o cualquier diseño que un escenario escriba en línea. El tipo <c2/> también dibuja esos diseños, en cualquier banda desde ultra alta frecuencia (UHF) hasta C, cada banda con sus propios inhibidores, y una banda <c3/> o una ejecución <c4/> puede llevar cualquiera de ellos (véase <a1>Dónde se usan los diseños</a1>).

# text
seg-caccfa826a1a = Ejecute los ejemplos incluidos:

# text
# c1: kshana example leo-band-trade
seg-441136f32290 = <c1/>: un estudio comparativo de bandas de UHF a C ancha con diseños representativos;

# text
# c1: kshana example xona-pulsar-signals
seg-23cea428326c = <c1/>: las señales publicadas Xona Pulsar X1 y X5;

# text
# c1: kshana example multi-band-jamming-waterfall
# c2: spectrum
seg-5dcfa318a4f3 = <c1/>: paneles UHF, L, S y C con inhibidores por banda (un escenario <c2/>);

# text
# c1: kshana scenarios/celeste-iod-classical-pilot-signals.toml
seg-0390769a8d7f = <c1/>, desde una copia del repositorio (no incluido): las bandas y la configuración de señal de la demostración en órbita (IOD) de Celeste presentadas en el taller LEO-PNT del Programa de Innovación y Apoyo a la Navegación (NAVISP) de la Agencia Espacial Europea (ESA), { "2026" } (véase <a1>Parámetros del taller</a1> más abajo).

# text
# c1: src/leo_signal.rs
# c2: src/navsignal.rs
# c3: src/spectrum.rs
# c4: data/leo-signals/
seg-62511ee92f8a = Código: <c1/> (diseños de señal, el tipo), <c2/> (las formas cerradas), <c3/> (la cascada multibanda), archivos de preajuste en <c4/>.

# text
seg-ce08de9a19de = Un diseño de señal

# text
seg-fc0d265f4006 = frecuencia central, ancho de banda de transmisión (el espectro es cero fuera de él) y la atribución de la Unión Internacional de Telecomunicaciones (UIT): Servicio de Radionavegación por Satélite (RNSS), Servicio de Radiodeterminación por Satélite (RDSS), Servicio Móvil por Satélite (MSS), Servicio de Exploración de la Tierra por Satélite (EESS), una banda no RNSS u otra

# text
seg-be2d5e822342 = cualquier subconjunto de un componente de <b>adquisición</b> (corto y de baja tasa, fácil de encontrar), un componente de <b>datos</b> (el mensaje de navegación) y un componente <b>piloto</b> (sin datos, para la medición de distancia)

# text
seg-e73d9832efe0 = Por componente

# text
# c1: FLAT(<MHz>)
seg-dac784d5f41a = modulación: modulación por desplazamiento de fase binaria BPSK(n) a n × { "1.023" } Mchip/s (n puede ser una fracción, BPSK(1/3) es { "341" } kchip/s), portadora de desplazamiento binario BOC(m,n), BOC multiplexada, o <c1/> para una baliza de multiplexación por división de frecuencia ortogonal (OFDM); reparto de la potencia; desplazamientos de subportadora de acceso múltiple por división de frecuencia (FDMA); longitud de código; tasa de datos

# text
seg-4ccb9e269d64 = Opcional

# text
# c1: ranging = false
seg-4c22d21ea8f0 = potencia recibida de referencia y máxima, altitud orbital, <c1/> para una señal solo Doppler, notas sobre lo que está publicado y lo que se supone

# text
# c1: presets = [...]
# c2: [[signals]]
# c3: generic-bands
seg-c6b46532af9a = Un escenario toma señales de <c1/> y de tablas <c2/> en línea. Sin ninguna de ellas, analiza el preajuste <c3/>.

# text
# c1: data/leo-signals/
seg-a917a5ccfb79 = Un archivo para cada una bajo <c1/>, compilado en el programa, cada uno con la URL de su fuente. Un valor que la fuente no publica se etiqueta como REPRESENTATIVE en el archivo y en el informe.

# text
seg-7159574bf255 = Señales

# text
seg-c2831d853b1d = Aproximaciones declaradas

# text
# c1: xona-x1
# c2: xona-x5
seg-7816d4f1c3f1 = <c1/> ({ "1593.3225" } MHz, { "1.023" } Mchip/s), <c2/> ({ "1190.51625" } MHz, { "10.23" } Mchip/s); potencia recibida mínima y máxima; { "1080" } km

# text
seg-332a08bef0de = modulación por desplazamiento de fase en cuadratura de Feher mejorada (EFQPSK) dibujada con la envolvente BPSK de chip rectangular; el desplazamiento de código y los códigos de superposición no se modelan; ancho de banda de transmisión = lóbulo principal (no publicado)

# text
# c1: iridium-stl
seg-d37420c5c9f5 = ráfagas de Tiempo y Ubicación por Satélite (STL) de <c1/>, modulación por desplazamiento de fase en cuadratura (QPSK) a { "25" } ksímbolo/s, { "780" } km, solo Doppler y temporización

# text
seg-a765878134e2 = PUBLIC, <a1>informe de la Resilient Navigation and Timing Foundation (RNTF)</a1>

# text
seg-5ca54b21f017 = portadora en el punto medio de { "1616" } a { "1626" } MHz; potencia recibida derivada de las { "300" } a { "2400" } veces publicadas respecto al Sistema de Posicionamiento Global (GPS)

# text
# c1: starlink-ku-beacon
seg-e43d1db73131 = <c1/>, una baliza OFDM de { "240" } MHz, solo Doppler

# text
seg-ff9e0075e868 = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>

# text
seg-fee9a553c9ae = espectro plano; centro del canal y altitud de la capa REPRESENTATIVE; la relación portadora a densidad de ruido (C/N₀) publicada de unos { "57" } dB-Hz se fija mediante el receptor

# text
# c1: centispace-l1
# c2: centispace-l5
seg-f89372b5231e = <c1/>, <c2/>, BPSK a { "2.046" } Mchip/s

# text
seg-2e6475b25d55 = PUBLIC, <a1>PubMed Central PMC10301026</a1>

# text
seg-ac53cebe5303 = portadoras situadas en las portadoras GPS L1 y L5 ("cerca de" en la fuente); longitud de código REPRESENTATIVE

# text
# c1: generic-c-band-leo
seg-cb1420efc108 = <c1/>, { "5020" } MHz, BPSK({ "10" }) en { "20" } MHz

# text
seg-895f6039fce2 = REPRESENTATIVE, para sistemas de banda C cuyos parámetros no son públicos (como TrustPoint)

# text
seg-a407aaab864c = el diseño completo

# text
seg-2f679a429dae = REPRESENTATIVE, atribuciones del <a1>Reglamento de Radiocomunicaciones de la UIT</a1>; la portadora UHF de { "465" } MHz procede del <s1>estudio público de openRECEIVER sobre las señales LEO-PNT</s1>

# text
seg-2054d9ce8a0d = el diseño completo (también el ancho de banda y la modulación UHF)

# text
seg-24360342e8e6 = El polinomio de efemérides de «reloj cero» de ATOMIC es un modelo de mensaje de navegación, no un diseño de señal, y se trata en el trabajo sobre el mensaje de navegación, no aquí.

# text
seg-ebfc032d7898 = Qué se calcula por señal

# text
# c1: η = (2/π)[Si(πBT_c) − sin²(πBT_c/2)/(πBT_c/2)]
seg-211f655e00fa = <b>Densidad espectral de potencia (PSD) limitada en banda</b> y, por componente, la fracción de su potencia que deja pasar la banda de transmisión. Para un componente BPSK en el centro, la forma cerrada <c1/> figura junto al valor numérico ({ "90.3" } % para el lóbulo principal).

# text
# c1: β² = [B/2 − sin(πBT_c)/(2πT_c)] / (π² T_c η)
seg-05e2a7b8235a = <b>Ancho de banda de raíz cuadrática media (RMS, de Gabor)</b> del componente seguido dentro de la banda, con la forma cerrada BPSK <c1/>.

# text
# c1: σ² = B_L(1 − ½B_L T) ∫ G sin²(πfΔ) df / [(2π)² (C/N₀) (∫ f G sin(πfΔ) df)²]
seg-f878fd0359c9 = <b>Fluctuación por ruido térmico del seguimiento de código</b> de un lazo de seguimiento de retardo (DLL) en función de C/N₀ y del espaciado del correlador adelantado-retrasado, a partir de la fórmula adelantado-retrasado limitada en banda de Betz y Kolodziejski ({ "2009" }): <c1/>, coherente por defecto, con la pérdida por elevación al cuadrado no coherente a petición. El informe añade la forma de manual para banda ilimitada (Kaplan y Hegarty) y la cota de espaciado evanescente fijada por el ancho de banda de Gabor. La <b>precisión de medición de distancia</b> es esa fluctuación en metros para la C/N₀ y el espaciado de referencia.

# text
# c1: f v R_E cos(el) / ((R_E + h) c)
# c2: 2/(3T)
seg-089e4e98af82 = <b>Adquisición</b>: el mayor Doppler de satélite en un paso cenital a la máscara de elevación (<c1/>, órbita circular, sin rotación terrestre) más los términos del oscilador y del usuario; intervalos Doppler de <c2/>; intervalos de código a lo largo de un periodo; la probabilidad de detección de un detector de ley cuadrática (Q de Marcum generalizada) con una probabilidad de falsa alarma por celda, centrada y en el peor caso de desajuste; y el tiempo medio de adquisición de una búsqueda de dwell único, en serie y con código en paralelo (Holmes).

# text
seg-1e2029183bdc = <b>Compatibilidad</b>: el coeficiente de separación espectral (SSC) de la señal limitada en banda hacia GPS L1 de adquisición gruesa (C/A), Galileo E1, GPS L5, Galileo E5a, E5b y la señal E5 de portadora de desplazamiento binario alternativa (AltBOC) en cada banda de receptor del sistema global de navegación por satélite (GNSS), la pérdida de C/N₀ que causa con su potencia recibida, y el SSC y la pérdida de C/N₀ de cada señal GNSS hacia el componente LEO seguido.

# text
# c1: spectrum
# c2: spectrum::Jammer::ssc
seg-864f3f2a5aa1 = <b>Tolerancia al inhibidor</b>: la relación de potencia inhibidor a señal (J/S) de un tono de onda continua (CW) en la portadora, de ruido plano sobre la banda de transmisión y de ruido adaptado al componente seguido que lleva el componente seguido al umbral de seguimiento, a partir del propio código SSC del tipo <c1/> (<c2/>).

# text
# c1: 10 log₁₀(s/η)
# c2: spectrum
seg-0fbea397ab93 = Convención de C/N₀: el barrido y la referencia son la C/N₀ <b>total en banda</b>. La parte de un componente entra en las fórmulas de seguimiento y de inhibidor como <c1/> (su parte de la potencia sin filtrar sobre la fracción en banda), la misma convención que usa el tipo <c2/> para una banda simple, cuya potencia de modulación fuera de la banda del receptor se pierde del mismo modo.

# text
seg-3b7d16e8873a = El estudio comparativo de bandas

# text
# c1: [trade]
# c2: 40.3·TEC/f²
seg-39382eb3a60c = <c1/> coloca cada señal junto a una señal de referencia: retardo de grupo ionosférico de primer orden <c2/> para un contenido total de electrones (TEC) oblicuo que usted indica ({ "1" } unidad de TEC, TECU, = 10¹⁶ electrones/m²), pérdida de trayecto en espacio libre (FSPL) a una distancia oblicua, precisión de medición de distancia con <b>C/N₀ igual</b> y con <b>potencia isótropa radiada equivalente (EIRP) igual</b> (C/N₀ menos la diferencia de pérdida en espacio libre, antenas isótropas en ambos extremos), y la tolerancia al inhibidor con la C/N₀ de EIRP igual.

# text
# c1: scenarios/leo-band-trade.toml
seg-58ced9eba711 = <c1/> ({ "50" } TECU, { "1000" } km, { "45" } dB-Hz, espaciado coherente de 0,5 chip, lazo de { "1" } Hz, { "20" } ms):

# text
seg-72f051e2d7e1 = Señal

# text
seg-3cfdff157be3 = Retardo ionosférico

# text
seg-b1436d1fd7a4 = ΔFSPL respecto a L

# text
seg-b5ce20ced519 = Medición de distancia, C/N₀ igual

# text
seg-2becbee24d47 = C/N₀, EIRP igual

# text
seg-aba982013f21 = Medición de distancia, EIRP igual

# text
seg-8b292612e43e = Tolerancia J/S de CW

# text
seg-53c8b6059c3f = { "465" } MHz, BPSK({ "5" })

# text
seg-1ee03c5e8633 = { "93.19" } m (×{ "6.57" })

# text
seg-66e74ec8ec1f = −{ "8.17" } dB

# text
seg-4dfc4b277e46 = { "0.221" } m

# text
seg-2a67835c7ddd = { "53.17" } dB-Hz

# text
seg-b36b61eaff50 = { "0.086" } m

# text
seg-37de1532b69e = { "42.1" } dB

# text
seg-f16b26301a6b = { "1191.795" } MHz, BPSK({ "10" })

# text
seg-1cc0fc817fca = { "14.19" } m

# text
seg-c1d04452ee8f = { "0.111" } m

# text
seg-b1dccfc14bb2 = { "45.00" } dB-Hz

# text
seg-467afbc3965e = { "45.0" } dB

# text
seg-63fc45ce7ef9 = { "2492.028" } MHz, BPSK({ "5" })

# text
seg-d4b8b8837709 = { "3.24" } m (×{ "0.229" })

# text
seg-271acd87a8d6 = +{ "6.41" } dB

# text
seg-0f38ea614b7f = { "0.185" } m

# text
seg-c531dc11c01d = { "38.59" } dB-Hz

# text
seg-6edbdabf77cb = { "0.388" } m

# text
seg-b1c384a78d8c = { "41.7" } dB

# text
seg-d13c29401059 = { "5020" } MHz, BPSK({ "10" })

# text
seg-7563cf0f3ebb = { "0.80" } m (×{ "0.056" })

# text
seg-fa10d26d0f8e = +{ "12.49" } dB

# text
seg-9f6390cc903b = { "32.51" } dB-Hz

# text
seg-d04fb147c95f = { "0.465" } m

# text
seg-e825ae4d1080 = { "43.4" } dB

# text
seg-2f20b409a3df = { "5100" } MHz, BPSK({ "50" })

# text
seg-6f22870202af = { "0.77" } m (×{ "0.055" })

# text
seg-ad13cdf3955f = +{ "12.63" } dB

# text
seg-da4b72e53c18 = { "0.022" } m

# text
seg-07ba1b6b9728 = { "32.37" } dB-Hz

# text
seg-e96dfdc0d92f = { "0.093" } m

# text
seg-04a27fee9486 = { "50.3" } dB

# text
seg-edcaed830e15 = El estudio comparativo se lee en ambos sentidos. Con C/N₀ igual, la precisión de medición de distancia la fijan la tasa de chip y la banda (la C ancha mide cinco veces más fino que la L). Con igual potencia radiada, la pérdida en espacio libre penaliza por completo a las bandas más altas: la banda C pierde { "12.5" } dB de C/N₀ y mide cuatro veces peor que la L, la UHF gana { "8.2" } dB, aunque soporta { "6.6" } veces el retardo ionosférico. La C ancha recupera su precisión con ancho de banda. Esto se apoya en los diseños representativos y en antenas isótropas; una antena de usuario direccional en banda C modifica las columnas de EIRP igual.

# text
seg-9bb6fa0e7a95 = Xona Pulsar

# text
# c1: scenarios/xona-pulsar-signals.toml
seg-d71e8de9cdda = <c1/> con las potencias recibidas mínimas publicadas, frente a una antena de { "290" } K y una figura de ruido de { "2" } dB (suelo −{ "201.98" } dBW/Hz):

# text
seg-4cf70433cc54 = C/N₀ de referencia

# text
seg-2a22ffc83e00 = { "53.78" } dB-Hz

# text
seg-8f274ed7feff = { "57.08" } dB-Hz

# text
seg-6be7e20ca92f = Precisión de medición de distancia ({ "0.5" } chip, coherente, { "1" } Hz)

# text
seg-60218177538e = { "0.402" } m

# text
seg-e5ccbfea146d = { "0.028" } m

# text
seg-b5a638da9ee1 = Doppler máximo de satélite, { "1080" } km

# text
seg-6917f2712acf = { "33.2" } kHz

# text
seg-895ac83e4a5b = { "24.8" } kHz

# text
seg-b4c4179a0363 = Intervalos Doppler × código ({ "1" } ms, { "0.5" } chip)

# text
seg-bed6ba024afe = Tiempo medio de adquisición con código en paralelo

# text
seg-93ffb02c7c50 = { "0.15" } s

# text
seg-3671bc5f2ace = { "0.37" } s

# text
seg-7e4c190cb4ab = X5 se sitúa en { "1190.51625" } MHz, dentro de la banda Galileo E5: su SSC es −{ "91.2" } dB/Hz hacia Galileo E5a y GPS L5, −{ "103.2" } dB/Hz hacia E5b y −{ "86.2" } dB/Hz hacia la señal AltBOC, y un satélite X5 con su potencia mínima eleva la densidad de ruido de un receptor GNSS entre { "0.0001" } y { "0.005" } dB. El Doppler de X1, { "33.2" } kHz, está dentro de los { "32" } a { "34" } kHz que notifica el artículo (la fila de Doppler VALIDATED más abajo).

# text
seg-661eefb1f346 = El espectro multibanda

# text
# c1: spectrum
# c2: [[bands]]
# c3: gps-l1ca
# c4: galileo-e1
# c5: gps-l2c
# c6: gps-l5
# c7: galileo-e5a
seg-0a8bbe2921fd = Las <c2/> del tipo <c1/> admiten, además de las cinco bandas GNSS con nombre (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>):

# text
# c1: signal = "<preset signal>"
# c2: signal_power_dbw
# c3: tracked_power_dbw
seg-63bd7d8a192d = <c1/>: un diseño de preajuste, dibujado con todos sus componentes, limitado en banda a su ancho de banda de transmisión, recibido con la potencia de referencia del preajuste o con <c2/>. C/N₀ y J/S se refieren al componente seguido (<c3/> en el informe);

# text
# c1: centre_mhz
# c2: modulation
# c3: signal_power_dbw
seg-603a2b97e621 = <c1/> con <c2/> y <c3/>: cualquier banda personalizada.

# text
# c1: [[panels]]
# c2: wideband
# c3: l-band-waterfall-jamming
# c4: tests/leo_signal_reference.rs
seg-b1c30f5d69cf = <c1/> añaden cascadas sobre otros intervalos de frecuencia con la misma línea temporal y escala de color, y un inhibidor <c2/> (de barrera) se suma a los de CW, banda estrecha, chirp y ruido adaptado. Una banda simple se comporta exactamente como antes: el ejemplo incluido <c3/> sigue dando { "43.48" } dB-Hz nominal y { "3.23" } dB-Hz mínimo para L1 C/A (fijado en <c4/>).

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
seg-35151477cbc2 = <c1/> ({ "60" } s, una fila por segundo):

# text
seg-47408d30d095 = C/N₀ nominal

# text
seg-e618666a44d8 = Tras su propio inhibidor

# text
seg-f75d3804cfe8 = Inhibidor

# text
seg-5751b2520829 = generic-uhf ({ "465" } MHz)

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-a582f1a22a07 = { "34.38" } dB-Hz desde { "10" } s

# text
seg-23570b8c7403 = CW en la portadora, −{ "120" } dBW

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-2e935ea7b90e = { "3.38" } dB-Hz desde { "20" } s (perdido)

# text
seg-52256ba98a99 = chirp de { "16" } MHz, { "50" } mW a { "100" } m

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-71abaef6924e = { "38.51" } dB-Hz desde { "30" } s

# text
seg-45441a20f061 = barrera de { "40" } MHz a { "1185" } MHz, −{ "118" } dBW

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-430461899d82 = { "46.29" } dB-Hz desde { "30" } s

# text
seg-4bcace842ce1 = la misma barrera

# text
seg-472da83fd67a = generic-s ({ "2492.028" } MHz)

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-0f0cad45f636 = { "41.69" } dB-Hz desde { "40" } s

# text
seg-d04f42bc0567 = ruido de { "2" } MHz, −{ "128" } dBW

# text
seg-372655e7c722 = generic-c-band-leo ({ "5020" } MHz)

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-b27c4bc24059 = { "40.35" } dB-Hz desde { "50" } s

# text
seg-ab6304cf6aec = ruido adaptado, −{ "124" } dBW

# text
seg-1f8a742cb215 = Cada inhibidor afecta solo a su propia banda; la prueba mantiene todas las demás bandas en su C/N₀ nominal hasta que arranca su propio inhibidor.

# text
seg-01c63dd5d11b = Dónde se usan los diseños

# text
seg-74f85b484b08 = Un diseño se busca por nombre allí donde una banda pueda nombrarlo:

# text
# c1: spectrum
# c2: signal = "<design>"
# c3: multi-band-jamming-waterfall
# c4: leo-resilience-js-margin
# c5: leo-resilience-multiband-diversity
# c6: leo-resilience-gnss-jammed-leo-carries
seg-4a7aca809ec3 = una banda <c1/> (<c2/>, arriba): <c3/>, <c4/> y las campañas <c5/> y <c6/>;

# text
# c1: leo-pass
# c2: signal = "<design>"
# c3: frequency_mhz
seg-1ee84efd74b3 = una banda <c1/> (<c2/>): la banda toma la frecuencia central del diseño (salvo que se indique <c3/>), el ancho de banda de transmisión y la tasa de chip seguida, reparte su EIRP entre los componentes según sus porcentajes de potencia, e informa de la C/N₀ del componente seguido y de la fluctuación de seguimiento de código limitada en banda en cada época (<a1>LEO-PASS.md</a1>);

# text
# c1: leo-pnt-chain
# c2: leo-pnt-end-to-end
# c3: xona-pulsar-end-to-end
seg-33732550ba94 = el tipo <c1/>, que entrega el reparto de potencia y la tasa de chip de un diseño al paso, y su portadora y tasa de chip a la solución fusionada (<c2/>, <c3/>; <a1>LEO-PNT.md</a1>).

# text
seg-625f50ac3189 = Parámetros del taller

# text
# c1: scenarios/celeste-iod-classical-pilot-signals.toml
# c2: src/celeste_iod.rs
# c3: scenarios/*celeste-iod*.toml
seg-9d50778efa0a = <c1/> contiene las bandas de frecuencia de Celeste IOD y la configuración n.º 1 de señal «Classical Pilot» tal como se presentó en el taller LEO-PNT de ESA NAVISP, { "2026" }, con una comprobación de forma de un diseño frente al espectro medido que se mostró allí. Es uno de los archivos del preajuste de Celeste IOD (los otros son <c2/> y los demás <c3/>); ninguna especificación de señal de Celeste es pública. Sus componentes llevan sus supuestos (reparto de potencia, longitudes de código, desplazamientos FDMA y una modulación representativa para las bandas cuya modulación no se presentó). La comprobación de forma es una consistencia MODELLED: compara formas, no niveles calibrados.

# text
# c1: src/celeste_iod.rs
# c2: scenarios/*celeste-iod*.toml
# c3: kshana example
# c4: include_str!
seg-6e259f57af91 = Se retiene junto con el resto del preajuste: elimine <c1/> y los archivos <c2/>. Nada compila el escenario dentro del programa: la interfaz de línea de comandos lo lista como escenario solo del repositorio (<c3/> lo nombra y lo explica, en lugar de imprimirlo), y una prueba rechaza cualquier <c4/> de él. Todos los demás escenarios, pruebas y referencias independientes se ejecutan sin él; la prueba que lo lee termina con éxito y con una nota cuando no está, y el recuento de archivos de escenario del README lo sigue contando.

# text
seg-53a7343c076e = Afirmación

# text
seg-6e0de0f2b25f = potencia BPSK en banda ({ "90.3" } % en el lóbulo principal); fluctuación adelantado-retrasado limitada en banda que se reduce a las formas de manual coherente y no coherente y a su cota de Gabor; auto-SSC de BPSK 2/({ "3" } R_c)

# text
seg-e35f7c20a976 = Kaplan y Hegarty, Betz y Kolodziejski { "2009" }, Betz { "2001" }, Abramowitz y Stegun, tabla { "5.1" }

# text
seg-0ceb71e558f6 = Forma cerrada del ancho de banda de Gabor limitado en banda; SSC de BPSK desplazada con desplazamiento distinto de cero; área unitaria de AltBOC (todo ello dentro de la fila anterior, como comprobaciones cruzadas)

# text
seg-b0552001e519 = consistencia interna

# text
seg-af6cff634177 = derivado aquí, comprobado frente a cuadratura

# text
seg-6b74bc7777c7 = Doppler LEO máximo

# text
seg-f4f4ee11749d = Xona Pulsar X1 de { "32" } a { "34" } kHz (arXiv { "2509.19551" }); Iridium ±{ "36" } kHz (RNTF)

# text
# c1: leo-signal
seg-08e5ec9a31a0 = diseños <c1/>, adquisición, compatibilidad, tolerancia al inhibidor, estudio comparativo, comprobaciones de forma

# text
seg-64f232587c5f = las formas cerradas validadas, la identidad del detector P_d({ "0" }) = P_fa, el tiempo medio de Holmes, la propia cadena SSC del tipo espectro

# text
seg-a456645f97aa = Espectro multibanda

# text
seg-868432ccfa09 = reducción a las cadenas de espectro y de inhibición sin cambios

# text
seg-430edd66bda0 = No modelado

# text
seg-d3bba3714684 = Los espectros exactos de EFQPSK, del desplazamiento de código y de OFDM.

# text
seg-53a727d317ae = La estructura de líneas del código de ensanchamiento y la correlación cruzada de acceso múltiple.

# text
seg-08e229ae97e9 = Filtros de transmisión y recepción más allá de una pared ideal: sin emisión fuera de banda.

# text
seg-b1fe4ce62e6a = Multitrayecto, cuantización y control automático de ganancia.

# text
seg-5d2af0802400 = La rotación terrestre en la cota Doppler (hasta unos { "0.46" } km/s de velocidad de distancia).

# text
seg-5e5e1124fbbb = El retardo ionosférico más allá del primer orden y el reparto del contenido de electrones por encima y por debajo de un satélite LEO: el TEC oblicuo es una entrada.

# text
seg-8c0d738304ab = Pérdidas atmosféricas, por lluvia y por polarización.

# text
seg-1fc440f042cf = Lógica de adquisición de dwell múltiple.

# text
seg-090a6ecf879f = Interferencia agregada más allá de un recuento por satélite.

# text
seg-c4b2a79ee33d = J. W. Betz y K. R. Kolodziejski, "Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I," <em>IEEE (Institute of Electrical and Electronics Engineers) Transactions on Aerospace and Electronic Systems</em> { "45" }({ "4" }), { "2009" }.

# text
seg-52ad2f21daf4 = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }),

# text
seg-aeeea70a0258 = E. D. Kaplan y C. J. Hegarty (eds.), <em>Understanding GPS/GNSS</em>, 3.ª ed., Artech House,

# text
seg-343397c21357 = J. K. Holmes, <em>Coherent Spread Spectrum Systems</em>, Wiley, { "1982" }.

# text
seg-34af310a980b = M. Abramowitz y I. A. Stegun, <em>Handbook of Mathematical Functions</em>, { "1964" }, §{ "5.2" } y tabla { "5.1" }.

# text
seg-45606af6bda2 = Galileo Open Service Signal-in-Space Interface Control Document; IS-GPS-200; IS-GPS-705.

# text
seg-960fc01f0a62 = Leclère, Marathe y Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>.

# text
seg-70efdc604ab9 = Resilient Navigation and Timing Foundation, <em>Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites</em>, <a1>https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf</a1>.

# text
seg-72490fa16fd2 = Kozhaya, Saroufim y Kassas, <em>NAVIGATION</em> { "72" }({ "1" }), { "2025" }, <a1>https://navi.ion.org/content/72/1/navi.685</a1>.

# text
seg-00cfb54b28c0 = CentiSpace: <a1>https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/</a1>.

# text
seg-4d954d28b661 = Datos de ESA Celeste IOD: <a1>https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures</a1>.

# text
seg-d43b8255ba58 = Reglamento de Radiocomunicaciones de la UIT: <a1>https://www.itu.int/pub/R-REG-RR</a1>.

# text
# c1: generic-uhf
seg-3a9fe081eb89 = openRECEIVER, <em>LEO-PNT Signals: Inside CELESTE's Four Bands</em>, { "1" } de agosto de { "2026" } (la fuente pública de la portadora UHF de { "465" } MHz de <c1/>): <s1>https://open-receiver.com/blogs/leo-pnt-signals-celeste/</s1>. La página se ha retirado del sitio (HTTP { "404" } y ausente de su índice de blog el 2026-09-29); los buscadores aún la listan con ese título.

# text
seg-18b16c83dd7c = <s1>Anterior</s1>Posicionamiento, navegación y temporización LEO

# text
seg-50fe3f8ae7ec = <s1>Siguiente</s1>Paso LEO y balance de enlace
