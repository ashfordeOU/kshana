# docs--leo-pass: translations (es)

# text
seg-cae10fb9bff8 = Escenario

# text
seg-cbf0f9bcd2d8 = Referencia independiente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-587beeccaa11 = Preajuste

# text
seg-1ff32b87e030 = Satélites

# text
seg-a6c63abeb7e6 = Escenarios incluidos

# text
seg-60cd077d82a7 = Modelo

# text
seg-2b0d77219437 = Preajustes

# text
seg-5566e1d71a4f = Órbita

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-c5ce76c91ff7 = Etiqueta

# text
# c1: docs/LEO-PASS.md
seg-813d372bda81 = Fuente: <c1/>

# text
# c1: leo-pass
seg-0bd4af67ffdb = Pasada LEO y presupuesto de enlace (<c1/>)

# text
# c1: leo-pass
seg-30417c63c48e = LEO-PNT es posicionamiento, navegación y temporización (PNT) desde satélites en órbita terrestre baja (LEO). El tipo de escenario <c1/> simula una o más pasadas de satélites LEO sobre un usuario y calcula el presupuesto de enlace banda por banda, junto a los satélites GNSS (sistema global de navegación por satélite) de órbita terrestre media (MEO) a la vista. El motor es <b>independiente del sistema</b>: cualquier constelación, cualquier diseño de señal y cualquier banda, escritos directamente en un escenario. Los sistemas con nombre son preajustes opcionales, cada uno en su propio archivo con su fuente.

# text
# c1: src/leo_pass.rs
# c2: src/leo_link/
seg-242c84daecb0 = Código: <a1><c1/></a1> (el tipo de escenario) y <a2><c2/></a2> (bloques públicos que pueden llamar otros módulos).

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-resilience-spoof-doppler
# c7: leo-focus-science-iono-sounding
# c8: leo-pass-celeste-iod-multiband
# c9: leo-resilience-spoof-monitors
# c10: leo-focus-iot-eirp
# c11: leo-focus-indoor-uhf
# c12: leo-vertical-*
# c13: leo-pnt-chain
seg-0e6b09e372f5 = Escenarios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> y el opcional <c8/> (resultados en <a1>Escenarios incluidos</a1>). El tipo de escenario es también miembro de las campañas <c9/>, <c10/>, <c11/> y de todo escenario <c12/>, y la etapa de pasada del tipo de escenario <c13/>.

# text
seg-59cebed2f589 = Visión general de todos los tipos de escenario y escenarios LEO-PNT: <a1>LEO-PNT.md</a1>.

# text
# c1: tests/leo_link_reference.rs
# c2: tests/fixtures/leo_link/
seg-9646ce17cddf = Referencias independientes: <a1><c1/></a1>, material de prueba en <c2/> con sus URL de origen.

# text
seg-c1020ac47091 = Qué calcula una ejecución

# text
seg-10dedc607eac = Para cada satélite LEO, banda y época:

# text
seg-35bf9a48e566 = Término

# text
seg-b0f12ee05fe9 = Elevación, acimut, distancia

# text
seg-24ad909c4fb8 = usuario en WGS-84 (World Geodetic System { "1984" }), satélite en un marco inercial alineado con el marco terrestre en la época

# text
seg-c9f61c3348ef = calculado

# text
# c1: ρ̇ = d·Δv/ρ
# c2: ρ̈ = (|Δv|² − ρ̇² + d·Δa)/ρ
seg-ebd800ec3d47 = Velocidad de distancia <c1/>, aceleración de distancia <c2/>

# text
seg-232b42b71f03 = forma cerrada; cada ejecución comprueba ambas frente a diferencias centrales de la distancia propagada e informa de la mayor diferencia

# text
seg-b3a55e868346 = forma cerrada

# text
# c1: −f·ρ̇/c
# c2: −f·ρ̈/c
seg-3f1f90a57c2f = Doppler <c1/>, tasa de Doppler <c2/>

# text
seg-852b6c351ce4 = primer orden, por banda

# text
seg-4eb4b779679b = Pérdida de trayecto en espacio libre

# text
# c1: 20·log10(4πRf/c)
seg-31f67bcd2d50 = Friis, <c1/>

# text
seg-fb5f06a91de1 = EIRP del satélite (potencia isótropa radiada equivalente) y diagrama

# text
# c1: −12(η/θ₃)²
seg-883702244778 = isoflujo hasta una elevación límite, lóbulo principal gaussiano <c1/> dB, o plano

# text
seg-b6e91c5252d3 = Antena del usuario

# text
# c1: G_z + 10·q·log10(sin el)
seg-ed92a0abf62f = parche <c1/> dBic, hemisférica o isótropa

# text
seg-0ac54d232e0a = Atenuación gaseosa

# text
seg-30fb5b0a0bc7 = expresiones simplificadas del Anexo { "2" } de ITU-R (Unión Internacional de Telecomunicaciones, Sector de Radiocomunicaciones) P.676-10 (sustituida por P.676-13, cuyos coeficientes tabulados el motor no incluye)

# text
seg-58d58478e9eb = Atenuación por lluvia

# text
seg-4c1e413d5fc3 = coeficientes de ITU-R P.838-3 y el procedimiento del § { "2.2.1.1" } de P.618-14, a partir de una intensidad de lluvia R0.01 y una altura de lluvia

# text
seg-dab78c0552b6 = Centelleo troposférico

# text
seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; por debajo de { "4" } GHz, una extrapolación, señalada en el informe

# text
seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

# text
seg-32dddfdba584 = Pérdida por entrada en edificios (usuario en interiores)

# text
seg-ef9025622e81 = ITU-R P.2109-2, tradicional o térmicamente eficiente, a la elevación del trayecto en la fachada

# text
seg-c7d1bccd4d51 = Desajuste de polarización

# text
seg-f4aaea269382 = factor de pérdida de polarización a partir de las relaciones axiales y los sentidos, promediado sobre la orientación de la elipse

# text
seg-96601850a9d5 = Temperatura de ruido del sistema

# text
# c1: 290(10^(NF/10) − 1)
seg-82735c7f3ea5 = suelo de la antena + emisión del cielo del trayecto absorbente ({ "275" } K) + { "2.7" } K cósmicos + receptor <c1/>

# text
seg-53ce973b0ee7 = C/N0 (densidad de portadora a ruido)

# text
seg-fa01d060cf1a = Retardo de grupo ionosférico

# text
# c1: 40.3·STEC/f²
seg-33f2113dea70 = <c1/>, STEC (contenido total de electrones oblicuo) del modelo de Klobuchar o un contenido total de electrones (TEC) vertical, escalado por la fracción de una capa de Chapman situada por debajo del satélite

# text
seg-431dfeb5edba = escalado VALIDATED, TEC MODELLED

# text
# c1: √(a₁² + a₂²)
# c2: [iot]
seg-56df31449434 = Por par de bandas: los coeficientes libres de ionosfera, la amplificación del ruido <c1/> y el ruido térmico del código de cada banda y de la combinación en el máximo de la pasada. La comparación con GNSS MEO usa la misma antena de usuario y el mismo receptor, con la potencia mínima recibida del documento de interfaz de cada señal (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, Issue { "2.1" } Tabla { "12" }; GPS de IS-GPS-200 e IS-GPS-705), más un exceso declarado, escalada por la distancia. La sección opcional <c2/> (Internet de las cosas) da el tiempo hasta la primera fijación, la energía por fijación y la vida de la batería frente al ciclo de trabajo para un presupuesto de potencia del receptor declarado (MODELLED, con cada supuesto como entrada y listado en el informe).

# text
# c1: orbit = "pass"
seg-7132ede02109 = <c1/> (por defecto): una órbita circular situada de modo que el usuario ve una pasada con una elevación máxima elegida a una hora elegida, ascendente o descendente, al este o al oeste del usuario; la inclinación puede ser heliosíncrona.

# text
# c1: orbit = "elements"
seg-688307acbf0d = <c1/>: elementos keplerianos explícitos.

# text
# c1: orbit = "tle"
seg-e9085739bcb8 = <c1/>: un conjunto de elementos de dos líneas (TLE) mediante el propagador Simplified General Perturbations { "4" } (SGP4) del motor.

# text
# c1: [[leo_constellation]]
# c2: constellation-design
# c3: ConstellationCfg
seg-7dcc5fdbc249 = <c1/>: una constelación Walker construida por el código <c2/> (su <c3/>, o las capas del preajuste); se informa de las pasadas más altas de la ventana.

# text
seg-ec7e163dd073 = Bandas y diseños de señal

# text
# c1: system = "<preset>"
# c2: bands
# c3: [[satellite.band]]
# c4: system = "none"
# c5: [[satellite.band]]
seg-4d49743b3544 = Bandas: <c1/> con un subconjunto opcional <c2/>, y entradas <c3/> que añaden una banda o sustituyen cualquier campo de una banda de preajuste. <c4/> con solo entradas <c5/> no usa ningún preajuste.

# text
# c1: leo-signal
# c2: signal = "xona-x5"
# c3: data/leo-signals/
# c4: leo-pnt-chain
# c5: frequency_mhz
# c6: leo-signal
seg-bd1e114aaea6 = Una banda también puede nombrar un diseño <c1/> (<c2/>, cualquier diseño bajo <c3/>, o uno que entregue el tipo de escenario <c4/>; véase <a1>LEO-SIGNAL.md</a1>). La banda toma entonces la frecuencia central del diseño (salvo que se indique <c5/>), el ancho de banda de transmisión y la tasa de chips del componente seguido, reparte su EIRP entre los componentes del diseño según sus cuotas de potencia e informa en cada época del C/N0 del componente seguido y de su fluctuación de seguimiento de código temprano-tardío de banda limitada (Betz y Kolodziejski { "2009" }, la fórmula del tipo de escenario <c6/>) como error de distancia.

# text
seg-1d96501bb12d = Cada preajuste marca sus números como PUBLIC (con URL), REPRESENTATIVE (una decisión de diseño documentada, nunca una afirmación sobre un sistema real) o WORKSHOP.

# text
seg-f708914fed48 = Bandas

# text
# c1: generic-leo
seg-6459abcaeebe = <c1/> (por defecto)

# text
seg-a0dab2ebeb1b = REPRESENTATIVE; portadoras L, S y C de documentos públicos

# text
seg-cd0075385395 = UHF { "450" } MHz (representativo), L { "1191.795" } MHz (centro de Galileo E5), S { "2492.028" } MHz (NavIC S, la portadora de banda S de Navigation with Indian Constellation), C { "5020" } MHz (centro de la asignación de { "5010" }–{ "5030" } MHz de RNSS (servicio de radionavegación por satélite)), cada una con { "0" } dBW

# text
seg-3f0de4312fcb = { "550" } km heliosíncrona, Walker 240/12/1

# text
seg-486f17197d4d = REPRESENTATIVE, para sistemas de banda C cuyos parámetros no son públicos (por ejemplo, TrustPoint)

# text
seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (modulación por desplazamiento de fase binaria a { "10" } × { "1.023" } Mchip/s), isoflujo

# text
seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> Tablas { "1" }–{ "2" }

# text
seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP a partir de la potencia mínima recibida publicada a { "10" }°

# text
seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) y { "97" }° ({ "66" })

# text
seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> y la órbita publicada

# text
seg-c995dade5aa6 = Satellite Time and Location (STL) a { "1621" } MHz (mitad de { "1616" }–{ "1626" } MHz); EIRP a partir de «{ "300" } veces GPS»

# text
seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } en { "6" } planos

# text
seg-ad0ba129439b = cifras de señal PUBLIC (<a1>NAVIGATION { "72" }({ "1" })</a1>), órbita y EIRP REPRESENTATIVE

# text
seg-1931203a036c = baliza Ku de { "240" } MHz, solo Doppler

# text
seg-0533710bbbe1 = estructura de señal PUBLIC (<a1>PMC10301026</a1>), órbita y EIRP REPRESENTATIVE

# text
seg-cee286338f01 = BPSK { "2.046" } Mchip/s cerca de L1 y L5

# text
seg-fe3cdce92b31 = { "1000" } km, { "55" }°

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (opcional)

# text
seg-800f173f2b20 = parámetros de señal WORKSHOP, órbita PUBLIC

# text
seg-e8626249e708 = siete bandas de la configuración n.º 1

# text
seg-cb29553176c7 = { "510" } km heliosíncrona

# text
# c1: link
# c2: src/celeste_iod.rs
# c3: scenarios/leo-pass-celeste-iod-multiband.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-10f79909a5bc = <b>El preajuste Celeste IOD (demostración en órbita) es opcional.</b> Sus parámetros de señal se presentaron en el taller LEO-PNT del Navigation Innovation and Support Programme (NAVISP) de la Agencia Espacial Europea (ESA), { "2026" }, y aún no tienen fuente pública; viven en el módulo <c1/> de <c2/>, usado por <c3/>. Cómo se retiene el preajuste: todo número del motor derivado del taller vive en un único archivo, <c4/>, que <c5/> compila solo cuando existe, y en los escenarios exclusivos del repositorio <c6/>. Eliminar ese archivo y esos escenarios retiene el preajuste sin editar ninguna fuente; el resto de pruebas, referencias independientes y escenarios se ejecutan sin él, y el recuento de archivos de escenario del README sigue contando los archivos retenidos. Su EIRP y su haz están calibrados con una traza de C/N0 mostrada en el taller, de modo que ese escenario reproduce la traza por construcción.

# text
seg-9f9ff4fe18f8 = El modelo de efemérides de difusión de polinomio de «reloj cero» ATOMIC es un preajuste de mensaje de navegación y no forma parte de este tipo de escenario.

# text
seg-dc496b16046b = La observación LEO frente a GNSS

# text
# c1: scenarios/leo-pass-vs-gnss-cn0.toml
seg-6be559b1ac29 = <c1/> reproduce cualitativamente lo que muestran las demostraciones de LEO-PNT: el C/N0 de LEO sube y baja en una campana que se mantiene por encima de la máscara durante { "590" } s y alcanza un máximo de { "56.8" } dB-Hz, { "8.9" } dB por encima de la mediana de las portadoras GNSS MEO planas (Galileo E1, de { "40.5" } a { "52.0" } dB-Hz, mediana { "47.8" } dB-Hz). El margen procede de la distancia, no de un transmisor más potente: en el máximo de la pasada el satélite está a { "569" } km, unas { "40" } veces más cerca que un satélite Galileo en el cenit ({ "23 222" } km), lo que supone { "32" } dB menos de pérdida en espacio libre; el preajuste genérico radia { "0" } dBW ({ "1" } W).

# text
# c1: kshana scenarios/<name>.toml
seg-08debab7c94a = Cada fila es una ejecución de <c1/> (motor { $version }):

# text
seg-9a60f0bf803e = Configuración

# text
seg-fde146239f5d = Resultado de una ejecución

# text
# c1: generic-leo
seg-41455a3f15b6 = <c1/> banda L, { "550" } km, pasada de { "80" }° sobre Múnich

# text
seg-9d5c154eceb1 = pico en L de { "56.8" } dB-Hz, mediana de { "42.2" } dB-Hz; mediana de Galileo E1 de { "47.8" } dB-Hz

# text
# c1: xona-pulsar
seg-9423b1184fb0 = <c1/>, una pasada diseñada de { "70" }° y cuatro satélites de capa inclinada, usuario marítimo

# text
seg-63bf0b8f7f3a = pico de X1 de { "65.6" } dB-Hz y de X5 de { "68.9" } dB-Hz en la pasada diseñada; mayor Doppler de X1 de { "31.4" } kHz

# text
# c1: iridium-stl
seg-8a3383072765 = <c1/>, pasada de { "65" }°, usuario aéreo

# text
seg-d2fea8542638 = pico de STL de { "80.5" } dB-Hz, { "34.3" } dB por encima de la mediana de GPS L1; mayor Doppler de { "35.4" } kHz

# text
# c1: generic-leo
seg-d837a8a7648b = <c1/>, usuario en interiores en Roma (edificio tradicional)

# text
seg-4fbead0588d2 = pico UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz; mediana de Galileo E1 de { "22.4" } dB-Hz

# text
# c1: generic-leo
# c2: [iot]
seg-954e16842d59 = <c1/> UHF y L con la sección <c2/>

# text
seg-9aa81f6f4929 = fijación en caliente de { "0.90" } s y { "18.0" } mJ en cada señal; fijación en frío UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

# text
# c1: generic-leo
seg-97476f9d4212 = <c1/>, cuatro bandas, pasada de { "70" }° sobre Tromsø

# text
seg-fd1463da9965 = véase <a1>Sondeo de la ionosfera</a1>

# text
seg-1ad5bde12b4f = { "16" } satélites de una capa genérica a { "1080" } km, L y C, un salto de { "30" } m

# text
seg-25cf36cf0de3 = véase <a1>Monitores de spoofing</a1>

# text
# c1: kshana scenarios/<name>.toml --animate html --export all
# c2: .animation.html
seg-6cdf9830433e = <c1/> escribe también el reproductor interactivo (<c2/>, las épocas de la pasada) y archivos de efemérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON y STK (Systems Tool Kit) de la geometría de la pasada (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

# text
seg-d3a0fc36329a = Sondeo de la ionosfera

# text
# c1: STEC = (P₂ − P₁)·f₁²f₂² / (40.3·(f₁² − f₂²))
# c2: geometry_free_stec_tecu
# c3: geometry_free_stec_sigma_tecu
# c4: scenarios/leo-focus-science-iono-sounding.toml
seg-1e64715af2ff = Cada par de bandas da además el TEC oblicuo que recupera su combinación de código libre de geometría en el máximo de la pasada, <c1/>, y la desviación típica de 1 sigma de esa estimación a partir del ruido de código de las dos bandas en el máximo (<c2/>, <c3/>). La estimación es igual al TEC oblicuo del modelo por construcción: la combinación es exacta a primer orden. La sigma es lo que hace que un plan de bandas sea mejor o peor sondeador: <c4/> (cuatro bandas sobre Tromsø) recupera { "18.85" } unidades de TEC con cada par, con una sigma de 1 de { "0.017" } unidades de TEC para UHF con L y de { "2.9" } para S con C. Solo ruido térmico de código; sin multitrayecto ni sesgo entre frecuencias. MODELLED.

# text
# c1: [spoofer]
seg-8f59acefb2b3 = Monitores de spoofing (<c1/>)

# text
# c1: [spoofer]
# c2: onset_s
# c3: offset_m
# c4: push_rate_m_s
# c5: push_azimuth_deg
# c6: bands
# c7: gnss = false
# c8: simulate_iono
seg-91941393400a = La sección opcional <c1/> falsifica las señales que un receptor vería en una posición declarada. Desde <c2/> la posición declarada salta <c3/> y después se mueve en horizontal a <c4/> hacia <c5/>; la distancia y la velocidad de distancia falsificadas son exactamente las de la posición declarada, en las bandas LEO nombradas en <c6/> (por defecto, todas) y en la señal GNSS MEO salvo que <c7/>. <c8/> indica si las pseudodistancias falsificadas llevan el retardo ionosférico (las de un transmisor terrestre no lo llevan).

# text
# c1: src/leo_link/spoof.rs
# c2: p_fa
# c3: 1 − p_md
seg-845f6840d92d = El receptor ejecuta dos monitores (<a1><c1/></a1>), cada uno con una probabilidad de falsa alarma por época declarada (<c2/>, por defecto { "1e-5" }), y declara la detección en la primera época en que su probabilidad de detección alcanza <c3/> (por defecto { "0.999" }). Las probabilidades de detección son exactas para el ruido gaussiano declarado, evaluadas sobre el residuo medio sin ruido; no se extrae ruido.

# text
seg-cc38b40eb7a5 = Monitor

# text
seg-8b34ac584c3d = Estadístico

# text
seg-7b158594c4d9 = Qué ve

# text
seg-89756d80bc29 = Coherencia del Doppler y de la geometría de la pasada

# text
# c1: prior_sigma_m
# c2: prior_velocity_sigma_m_s
# c3: window_s
# c4: drift_sigma_m_s
seg-2174c7725e48 = velocidades de distancia medidas frente a las predichas a partir de las órbitas y una posición y velocidad a priori independientes (<c1/>, <c2/>); un chi cuadrado de mínimos cuadrados generalizados sobre una ventana de <c3/> (por defecto, un paso), con la deriva del reloj como parámetro de molestia (o dada <c4/>); ruido del lazo de enganche de frecuencia a partir de C/N0 (Kaplan y Hegarty { "2006" }, § { "5.6.2" }), en los canales GNSS, en los canales LEO y en todos los canales

# text
# c1: δx
# c2: g·δx
# c3: g = −(Δv − ρ̇u)/ρ
seg-14eab06a47d5 = un error de posición <c1/> mueve una velocidad de distancia en <c2/>, <c3/>: la velocidad transversal de un satélite LEO dividida por su distancia es unas { "25" } veces la de un satélite MEO, de modo que el mismo error es unas { "25" } veces mayor en el Doppler LEO

# text
seg-390ac49b3c09 = Coherencia entre bandas

# text
# c1: √(2(σ₁² + σ₂²))
# c2: iono_rate_bound_m_s
seg-986d501c2b01 = el paso de época a época de la combinación de pseudodistancias libre de geometría de cada par de bandas LEO, con el modelo ionosférico del receptor eliminado, frente al ruido de código de <c1/> y una tasa ionosférica no modelada tolerada (<c2/>)

# text
seg-389187df55d7 = un spoofer que falsifica algunas bandas y no otras, o todas las bandas sin la ionosfera, en su inicio; no uno que falsifica todas las bandas y simula la ionosfera

# text
# c1: scenarios/leo-resilience-spoof-doppler.toml
# c2: scenarios/leo-resilience-spoof-monitors.toml
seg-4dd44d7fa566 = <c1/>: un salto de { "30" } m en un emplazamiento topografiado de Fráncfort cambia las velocidades de distancia GNSS en unos { "4" } mm/s y las de LEO en unos { "10" } cm/s (gradientes medianos de { "1.4e-4" } y { "3.5e-3" } por segundo). La prueba solo con GNSS nunca lo detecta (mayor no centralidad { "0.06" }); la prueba sobre todos los canales lo detecta { "105" } s después del inicio. <c2/> ejecuta cuatro spoofers contra ambos monitores.

# text
seg-1b64098e01f3 = Limitaciones, declaradas en cada resultado: el spoofer es un empuje de posición idealizado y autoconsistente que compensa su propio trayecto (sin firma de potencia, de ángulo de llegada ni de pico de correlación); el a priori es independiente de las fijaciones falsificadas; el modelo ionosférico del receptor es el del motor, de modo que el residuo entre bandas auténtico es nulo en media. MODELLED (dos filas en <a1>VERIFICATION-MATRIX.md</a1>).

# text
seg-edb7b16b6c0e = Validación

# text
seg-051b8cd1849d = Prueba

# text
seg-609c537a9dfd = ITU-R P.838-3 Tabla { "5" }, { "115" } frecuencias

# text
seg-5bf24bec38f2 = cada coeficiente a menos de { "0.6" } de su última cifra impresa (peor caso observado { "0.51" })

# text
seg-86204b023d44 = ejemplos de validación de la Comisión de Estudio { "3" } de ITU-R (CG-3M3J-13-ValEx-Rev8.3.0), lluvia de P.618-14

# text
seg-13180d4097d1 = { "56" } casos a menos de { "1e-4" } dB (observado { "5e-6" } dB)

# text
seg-84161e5f97f8 = Los mismos ejemplos, centelleo de P.618-14

# text
seg-0a4305c867ff = { "42" } casos a menos de { "1e-5" } dB

# text
seg-054f8dbe2792 = libro de trabajo de Clutter y BEL de la Comisión de Estudio { "3" } de ITU-R, P.2109

# text
seg-8ae2eeed4be4 = { "568" } valores a menos de { "0.001" } dB

# text
# c1: γ = (77/60)²
seg-6df2eded9f19 = razón de retardo de grupo de IS-GPS-200 <c1/>

# text
seg-d0b293230f91 = hasta { "1e-12" }; amplificación L1/L2 y L1/L5 de { "2.978" } y { "2.588" }

# text
seg-f9a0e24c00a7 = forma de Friis en kilómetros–megahercios

# text
seg-4e94a67f40f6 = hasta { "1e-4" } dB

# text
seg-ee59b4c520eb = arXiv { "2509.19551" } Tabla { "1" } (Pulsar, validación en órbita (IOV), capacidad operativa plena (FOC) polar, FOC inclinada, GPS)

# text
seg-345998ca457c = { "20" } velocidades y máximos de Doppler a menos de { "0.05" } %

# text
seg-30e34076f4a7 = Las referencias independientes de lluvia y de centelleo toman la altura de lluvia y la refractividad húmeda tal como las dan los ejemplos de validación: el motor no incluye ni el mapa de ITU-R P.839 ni el de P.453.

# text
seg-d2d1075a0b67 = Las EIRP y los diagramas son potencias recibidas publicadas convertidas en una EIRP, o elecciones representativas; no se usa el diagrama medido de ningún satélite y ningún C/N0 de LEO se compara con una medición.

# text
seg-915a9564608d = El término gaseoso es el método simplificado sustituido P.676-10; por debajo de { "1" } GHz es el valor de { "1" } GHz escalado por f², y la lluvia se toma como cero ahí.

# text
seg-cdd9faf5b61d = La fracción de TEC por debajo de un satélite LEO procede de una única capa de Chapman (sin plasmasfera), que puede sustituirse por una fracción declarada.

# text
seg-4b72218497e7 = Las órbitas de pasada diseñada y de Walker son de dos cuerpos con un J2 secular opcional (el segundo armónico zonal de la Tierra); la vía TLE usa SGP4. La aceleración propia del usuario se omite en la tasa de Doppler de forma cerrada (la comprobación numérica informa de lo que eso cuesta para un usuario en movimiento).

# text
seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } no tiene registros de navegación LEO; cualquier exportación LEO de estilo RINEX pertenece al código del mensaje de navegación y es una extensión documentada de Kshana (antecedentes: arXiv { "2401.17767" }).

# text
seg-593081243d8c = <s1>Anterior</s1>Diseños de señal LEO

# text
seg-468e70f9a669 = <s1>Siguiente</s1>Mensaje de navegación LEO

# text
seg-072d0d8f618c = Monitores de spoofing ([spoofer])
