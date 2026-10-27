# docs--leo-pnt-fusion: translations (es)

# text
seg-cae10fb9bff8 = Escenario

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-587beeccaa11 = Preajuste

# text
seg-a6c63abeb7e6 = Escenarios incluidos

# text
seg-354b42e3a5d0 = RNTF

# text
seg-c5ce76c91ff7 = Etiqueta

# text
# c1: docs/LEO-PNT-FUSION.md
seg-9673ca8c2705 = Fuente: <c1/>

# text
seg-989faf40651b = Posicionamiento, navegación y temporización fusionados MEO y LEO

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
seg-c14c586a29e7 = Tres tipos de escenario proporcionan posicionamiento, navegación y temporización (PNT) con satélites en órbita terrestre baja (LEO) solos o fusionados con los sistemas globales de navegación por satélite (GNSS) de órbita terrestre media (MEO): <c1/> (posición, velocidad y tiempo), <c2/> (posicionamiento de punto preciso) y <c3/> (una red no terrestre 5G). Fuente: <c4/>.

# text
# c1: constellation-design
seg-351652fa0e42 = El motor es <b>independiente del sistema</b>. Toda constelación es de capas Walker, de elementos orbitales explícitos o un preajuste GNSS del tipo de escenario <c1/>; toda señal es una portadora, una tasa de chips y una envolvente de densidad de portadora a ruido (C/N0); todo presupuesto de error es una sigma explícita. Los sistemas con nombre son <b>preajustes</b> opcionales, un archivo cada uno, y toda capacidad, prueba y escenario incluido se ejecuta sin ninguno concreto de ellos.

# text
seg-3e7c6608d5c4 = Sistemas y preajustes

# text
# c1: [[system]]
# c2: kshana <file>.toml
seg-1031746214ab = Un escenario enumera sus sistemas como tablas <c1/>. Este escenario completo une la constelación de línea base de GPS con una capa LEO genérica y se ejecuta tal como está escrito (<c2/>; el motor { $version } da una dilución de precisión de posición mediana de { "2.43" } solo con GPS y de { "1.17" } fusionado, y un error 3D cuadrático medio de { "2.06" } m y de { "0.47" } m):

# text
# c1: preset = "gps-baseline"
# c2: galileo
# c3: beidou-meo
# c4: glonass
# c5: leo_preset = "..."
# c6: navsignal::dll_code_jitter_chips
# c7: sigma_pr_m
# c8: sigma_doppler_hz
seg-6168fdca9b54 = <c1/> (el Global Positioning System, GPS; o <c2/>, <c3/>, <c4/>) toma una constelación GNSS publicada; <c5/> rellena lo que la tabla deje sin indicar a partir de un preajuste LEO. El C/N0 varía linealmente con el seno de la elevación desde la máscara hasta el cenit (una decisión de modelado: la envolvente real de una pasada depende del diagrama de la antena transmisora). La sigma de la pseudodistancia es el ruido térmico del lazo de enganche de retardo (DLL) del motor (<c6/>) a ese C/N0 combinado con el error de distancia de la señal en el espacio (SISRE), salvo que <c7/> lo fije; la sigma de la velocidad de distancia es la longitud de onda por <c8/>. Como la sigma es una entrada, un modelo de señal independiente puede alimentarla sin que el código de posicionamiento sepa de dónde procede.

# text
seg-a3f63252bd1b = Qué incluye

# text
seg-9872e31ebd72 = Fuentes

# text
seg-e20c823f36f3 = X1 a { "1593.3225" } MHz, { "1.023" } Mchip/s, potencia recibida de −{ "148.2" } a −{ "139.1" } dBW; X5 a { "1190.51625" } MHz, { "10.23" } Mchip/s, de −{ "144.9" } a −{ "136.2" } dBW; { "258" } satélites en { "18" } planos a { "1080" } km, { "53" } y { "97" } grados

# text
seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Representativo: el reparto entre las dos inclinaciones, la fase, el error de distancia

# text
seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satélites, seis planos casi polares a { "780" } km y { "86.4" } grados; ráfagas de { "1616" } a { "1626" } MHz, modulación por desplazamiento de fase en cuadratura (QPSK) a { "25 000" } símbolos/s; potencia recibida de { "300" } a { "2400" } veces el mínimo de GPS

# text
seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>constelación</a3>. DERIVED: la potencia en dBW. Representativo: portadora en el centro de la banda, error de distancia

# text
seg-36771f73c21f = Solo Doppler: { "11.325" } GHz, baliza de multiplexación por división de frecuencia ortogonal (OFDM) de { "240" } MHz, C/N0 de hasta { "57.07" } dB-Hz, error Doppler de { "30" } Hz; primera capa de { "1584" } satélites a { "550" } km y { "53" } grados

# text
seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim y Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Representativo: fase, C/N0 en el horizonte

# text
seg-2e13de07f9e9 = Modulación por desplazamiento de fase binaria (BPSK) a { "2.046" } Mchip/s cerca de L1 y L5; determinación de órbita centimétrica

# text
seg-dd94a3839cb3 = PUBLIC: <a1>evaluación inicial</a1>, <a2>GPS Solutions</a2>. Representativo: portadoras, potencia, toda la constelación operativa

# text
seg-a34d6a186a36 = Un sistema de banda C en la asignación de { "5010" } a { "5030" } MHz del servicio de radionavegación por satélite (RNSS), para sistemas cuyos parámetros no son públicos

# text
seg-7712896ff69a = PUBLIC: la asignación del <a1>Reglamento de Radiocomunicaciones de la Unión Internacional de Telecomunicaciones (UIT)</a1>. Todo lo demás es <b>representativo</b>

# text
seg-89ebc32469d9 = Un modelo de efemérides y reloj: efemérides polinómicas de sexto orden, renovación cada { "30" } s, reloj gobernado al tiempo GNSS; SISRE { "0.26" } m

# text
# c1: ephemeris_preset
seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. DERIVED: el SISRE. Combínese con cualquier constelación mediante <c1/>

# text
seg-6389c92e07d4 = Demostración en órbita (IOD) Celeste de la Agencia Espacial Europea (ESA), una configuración de un diseño de señal parametrizado

# text
seg-b8bd6e76aeb2 = órbita PUBLIC (<a1>ESA</a1>, <a2>resumen { "16907" } del Institute of Navigation (ION)</a2>); parámetros de señal WORKSHOP, presentados en el taller LEO-PNT del Navigation Innovation and Support Programme (NAVISP) de la ESA, { "2026" }

# text
# c1: fusion
# c2: src/celeste_iod.rs
# c3: scenarios/celeste-iod-fused-pvt.toml
# c4: tests/workshop_preset_isolation.rs
# c5: src/celeste_iod.rs
# c6: build.rs
# c7: scenarios/*celeste-iod*.toml
seg-bd7fb6eb444a = Todo número derivado del taller está en el módulo <c1/> de <c2/>, usado por <c3/> (<c4/> impone dónde pueden aparecer). Cómo se retiene el preajuste: todo número del motor derivado del taller vive en un único archivo, <c5/>, que <c6/> compila solo cuando existe, y en los escenarios exclusivos del repositorio <c7/>. Eliminar ese archivo y esos escenarios retiene el preajuste sin editar ninguna fuente; el resto de pruebas, referencias independientes y escenarios se ejecutan sin él, y el recuento de archivos de escenario del README sigue contando los archivos retenidos.

# text
# c1: mode = "doppler" | "joint" | "polar" | "timing"
seg-12cdcc633ae0 = Un tipo de escenario, cuatro modos (<c1/>).

# text
# c1: f_D
# c2: λ
# c3: ρ̇ = −λ f_D = u·(v_s − v_u) + ḋ
# c4: u
# c5: ḋ
# c6: ∂ρ̇/∂r = −(I − u uᵀ)(v_s − v_u)/ρ
# c7: doppler_only = true
# c8: starlink-sop
seg-72b5d8cc82ea = <b>Doppler.</b> Un receptor que mide el Doppler <c1/> a la longitud de onda <c2/> observa la velocidad de distancia <c3/>, siendo <c4/> la línea de visión y <c5/> la deriva del reloj del receptor. Un ajuste por lotes de Gauss-Newton resuelve la posición, la deriva y, opcionalmente, una velocidad constante, con derivadas parciales analíticas <c6/>: solo la velocidad del satélite transversal a la línea de visión aporta información de posición, de modo que la geometría es cómo giran las líneas de visión durante la ventana. El informe da el error frente a la longitud de ventana, la envolvente de Doppler, tasa de Doppler y sacudida de cada sistema, y una tabla de pasada única. Una pasada ubica al usuario a lo largo de la traza (el instante de Doppler cero) y a través de ella (la pendiente de la curva Doppler); el error transversal crece sin límite a medida que la pasada se hace cenital, y la imagen especular respecto a la traza en tierra se ajusta casi igual de bien (solo la rotación de la Tierra las separa). Un sistema solo Doppler (<c7/>, el preajuste <c8/>) se ejecuta en este modo.

# text
seg-007d143c7fb4 = <b>Joint.</b> En cada época, mínimos cuadrados ponderados sobre las pseudodistancias de los sistemas GNSS solos, de los sistemas LEO solos y de todos ellos, con un reloj de receptor por sistema (se estima el sesgo entre sistemas, ISB) o un desfase de difusión conocido sobre la escala de tiempo de referencia. Informa de la dilución de precisión geométrica, de posición, horizontal, vertical y de tiempo (GDOP, PDOP, HDOP, VDOP, TDOP), de los errores, de los sesgos estimados y del DOP frente al número de satélites LEO añadidos a la geometría GNSS.

# text
seg-22f136a0c96f = <b>Polar.</b> Satélites a la vista, DOP mediano y disponibilidad frente a la latitud para GNSS MEO, LEO y ambos.

# text
# c1: slot-timing
# c2: Δt_UTC = Δt_LS + A0 + A1 (t_E − t_ot + 604800 (WN − WN_t))
seg-1034557258d1 = <b>Timing.</b> En una posición conocida, cada pseudodistancia LEO es una medición de reloj. El receptor ejecuta un filtro de Kalman de dos estados (fase, frecuencia) cuyo ruido de proceso es el ruido de frecuencia blanco y de paseo aleatorio de la clase de oscilador (los modelos de <c1/> y de reloj), mantiene el tiempo entre pasadas y convierte el tiempo del sistema en Tiempo Universal Coordinado (UTC) con la expresión <c2/> de IS-GPS-200; la incertidumbre del desfase de difusión es un sesgo por ejecución.

# text
seg-0d76fcc05e7d = Un filtro de Kalman extendido (EKF) de posicionamiento de punto preciso (PPP) en coma flotante sobre código y fase libres de ionosfera: coordenadas estáticas, un reloj de receptor blanco, un sesgo entre sistemas por cada sistema adicional, un retardo cenital húmedo de paseo aleatorio y una ambigüedad flotante por arco de satélite. El error de órbita y reloj precisos es común al código y a la fase de un satélite, de modo que cada satélite es una actualización correlada de dos filas, en una forma estabilizada de Joseph que mantiene la covarianza definida positiva a lo largo de miles de actualizaciones de fase de nivel milimétrico. Las mediciones se simulan a partir del mismo modelo, de modo que el error de estimación normalizado al cuadrado (NEES) de la posición debe seguir una ley chi cuadrado con tres grados de libertad; la prueba lo comprueba sobre semillas Monte Carlo. La convergencia es la primera época a partir de la cual los errores horizontal y vertical se mantienen por debajo de los umbrales ({ "10" } cm) hasta el final de la ejecución.

# text
seg-630384148ec7 = Un satélite LEO cruza el cielo en unos diez minutos, un satélite MEO se mueve unos pocos grados, de modo que los arcos LEO separan las ambigüedades de la posición mucho antes.

# text
# c1: c / (2π β sqrt(2 (C/N0) T))
# c2: β
# c3: B/√12
# c4: sqrt(3 / (2π² (C/N0) T³))
seg-17f9cf9cc24d = Un enlace descendente de red no terrestre (NTN) 5G en la banda S del servicio móvil por satélite (MSS), banda n256 del 3rd Generation Partnership Project (3GPP) ({ "2170" } a { "2200" } MHz). La cota de Cramér-Rao (CRB) del tiempo de llegada es <c1/>, siendo <c2/> el ancho de banda cuadrático medio (de Gabor) (<c3/> para un espectro OFDM plano), y la de la frecuencia de un tono <c4/>. El tipo de escenario compara canales (por defecto, un canal New Radio de { "5" } MHz y un canal de banda estrecha de { "200" } kHz) mediante fijaciones de tiempo de llegada del enlace descendente con un reloj de receptor desconocido y una fijación Doppler de un solo satélite a lo largo de una pasada.

# text
seg-516afd013d38 = Tipo de escenario, modo

# text
seg-529a5aeea10a = Qué muestra (con semilla, determinista)

# text
# c1: leo-pvt
seg-6cd0b721006a = <c1/>, doppler

# text
seg-c3c51264f12a = capa Xona Pulsar X1 ({ "258" } satélites), ruido Doppler de { "1" } Hz: error 3D de { "7.5" } m tras diez minutos ({ "26" } satélites); en una sola pasada la sigma transversal es de { "303" } m cuando la pasada es casi cenital ({ "25" } km fuera de la traza) frente a { "43" } m a { "250" } km fuera de la traza

# text
seg-da85037a6691 = señales de oportunidad solo Doppler, error Doppler de { "30" } Hz a { "10" } Hz: sigma horizontal formal de unos { "10" } m tras { "20" } s con { "12" } satélites y de { "6" } m tras { "60" } s

# text
# c1: leo-pvt
seg-4dbb00da5310 = <c1/>, joint

# text
seg-553e8f4df276 = PDOP mediano de GPS y Galileo de { "1.47" } y error 3D cuadrático medio (RMS) de { "1.06" } m; Xona X5 solo { "1.73" } y { "0.49" } m; fusionado { "1.06" } y { "0.41" } m; el sesgo LEO de { "40" } ns ({ "11.99" } m) estimado como { "12.06" } m

# text
seg-83378a120e0d = Convergencia de { "7.4" } min (solo GNSS MEO), { "4.8" }, { "3.2" }, { "2.7" } y { "2.3" } min con { "60" }, { "96" }, { "192" } y { "288" } satélites LEO

# text
seg-4aadc3b41822 = Cota de distancia de { "0.26" } a { "1.03" } m para { "4.5" } MHz y de { "6.5" } a { "26" } m para { "180" } kHz; fijaciones de cerca de { "2" } m frente a { "26" } m

# text
# c1: leo-pvt
seg-5b1019210ca7 = <c1/>, polar

# text
seg-108488f6cc6c = VDOP de GPS y Galileo de { "1.20" } en el ecuador, { "1.51" } a { "89.9" } grados; con Iridium { "1.14" } en el polo

# text
# c1: leo-pvt
seg-bcdbe0796127 = <c1/>, timing

# text
seg-94ab83c05f50 = Transferencia de tiempo con Iridium durante { "6" } horas en Boulder: de { "9.9" } a { "11.4" } ns RMS con C/N0 nominal en cuatro clases de oscilador, de { "15.1" } a { "25.0" } ns con { "30" } dB menos

# text
# c1: celeste-iod-fused-pvt
seg-3007f5930dfd = <c1/> (opcional)

# text
seg-f6ff187a00aa = GNSS unido a los dos satélites IOD en la escala de tiempo de referencia (exclusivo del repositorio, retenido junto con el preajuste)

# text
# c1: leo-pvt
# c2: leo-focus-fused-pnt-sisre
# c3: leo-vertical-autonomous-vehicle
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-critical-infrastructure-timing
# c6: leo-vertical-5g-network-timing
# c7: leo-ppp
# c8: leo-focus-ppp-altitude
# c9: ntn-positioning
# c10: leo-focus-ntn-bandwidth
# c11: leo-pvt
# c12: leo-ppp
# c13: leo-pnt-chain
seg-98710204278b = Los tipos de escenario también se ejecutan dentro de otros escenarios: <c1/> es miembro del barrido <c2/> y de las campañas <c3/>, <c4/>, <c5/> y <c6/>; <c7/> del barrido <c8/>; <c9/> del barrido <c10/>; y <c11/> y <c12/> son las etapas de fijación fusionada y de PPP del tipo de escenario <c13/>. Sus resultados están en <a1>LEO-PNT.md</a1>.

# text
seg-2f3086178d0b = Cifras y etiquetas publicadas

# text
seg-8980b5ae869b = Cifra

# text
seg-0be9b5747c00 = Kshana

# text
seg-3d2d01038419 = Doppler de Iridium de hasta ±{ "36" } kHz

# text
seg-a88258961299 = { "35.9" } kHz, el máximo a lo largo de un día de pasadas, a menos de { "5" }%

# text
# c1: tests/leo_doppler_reference.rs
seg-5bc3150b53f6 = VALIDATED (<c1/>)

# text
seg-35a3ec8ee073 = Doppler máximo de Xona Pulsar X1 de { "32" } a { "34" } kHz

# text
seg-499acd31a8f8 = arXiv:{ "2509.19551" }

# text
seg-e8c9c880a3eb = { "33.6" } kHz de un satélite de cada capa publicada ({ "1080" } km, { "53" } y { "97" } grados), dentro del intervalo sin ensancharlo; la capa de { "53" } grados sola alcanza un máximo de { "31.8" } kHz, porque la rotación de la Tierra ralentiza una órbita prógrada respecto al suelo

# text
seg-e12713d5019f = VALIDATED (misma prueba)

# text
seg-370ca62e7fc7 = sacudida de Xona Pulsar X1 de ±{ "1.26" } Hz/s²

# text
seg-4de9b0895288 = unos { "1.0" } Hz/s² en una pasada cenital

# text
seg-5019322f4669 = informado, no validado

# text
seg-7fcb83027ff4 = convergencia de PPP de { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min con 60/96/192/288 LEO

# text
seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

# text
seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monótona

# text
seg-0a1133c16dce = coherencia MODELLED de la tendencia (no se reproducen constelaciones, ruido ni estaciones)

# text
seg-7c5292729f36 = Starlink unos { "2" } m en { "20" } s con tres satélites

# text
seg-6a54a7c58ade = Kozhaya, Saroufim y Kassas { "2025" }

# text
seg-13fc5fc4f69f = sigma horizontal formal de unos { "10" } m tras { "20" } s con { "12" } satélites, con efemérides perfectas y todo el error en una sigma Doppler de { "30" } Hz a { "10" } Hz

# text
seg-4fc80a02ed6c = comparación MODELLED (no se reproducen el receptor ni la tasa de medición)

# text
seg-5d0ae24eb74c = temporización con Iridium por debajo de { "40" } ns respecto a UTC(NIST)

# text
seg-fa4467605bc4 = NIST

# text
seg-b910bf5135dd = unos { "10" } ns RMS modelados

# text
seg-9025f3c376c5 = comparación MODELLED

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-4434b0ff1caa = Todo lo demás es MODELLED con su justificación en la matriz de verificación (<c1/>): el DOP se comprueba frente a un caso de cuatro satélites derivado a mano, las fijaciones frente a su covarianza, el modelo Doppler frente a la identidad de la aceleración de distancia, el filtro PPP frente a la banda chi cuadrado del NEES y las cotas frente a cuadratura.

# text
seg-aa5482ac34ff = Límites, declarados con claridad

# text
seg-0b4564367dcd = Órbitas de dos cuerpos con la deriva secular por J2, el segundo armónico zonal de la Tierra; sin error de ajuste de efemérides de difusión más allá de la sigma del SISRE, sin diagrama de antena del satélite.

# text
# c1: leo-pvt
seg-b51ccfee4ab8 = Sin retardo ionosférico ni troposférico en <c1/> (el filtro PPP lleva un estado de retardo húmedo; su combinación libre de ionosfera elimina la ionosfera de primer orden), sin centelleo, multitrayecto, saltos de ciclo ni resolución de ambigüedades enteras.

# text
seg-a719ccac19c0 = La exactitud de NTN es una cota, no un resultado alcanzado.

# text
seg-19ba6cc0ca75 = Los valores de preajuste marcados como representativos son ilustrativos y no describen el diseño de ningún operador.

# text
seg-f9f335d67ff8 = <s1>Anterior</s1>Mensaje de navegación LEO

# text
seg-062138bbb73c = <s1>Siguiente</s1>Diseño de constelaciones
