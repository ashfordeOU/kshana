# docs--leo-navmsg: translations (es)

# text
seg-cc651d9cef3b = Código

# text
seg-cbf0f9bcd2d8 = Referencia independiente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-e305279d5b11 = Contenido

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-4d208b6c0eb8 = día

# text
seg-a7d59ba6e225 = rad

# text
seg-02dc0d42fb21 = sfu

# text
# c1: docs/LEO-NAVMSG.md
seg-0f2d3faa9934 = Fuente: <c1/>

# text
# c1: leo-navmsg
seg-d8aaee95aa44 = El tipo de escenario <c1/> construye el mensaje de efemérides y reloj de difusión de un satélite de posicionamiento, navegación y temporización (PNT) en órbita terrestre baja (LEO) y responde a las preguntas que se hace quien diseña un mensaje: cuánto tiempo puede cubrir un mensaje, qué aporta cada parámetro adicional, qué ve un usuario cuando el mensaje cambia en mitad de una pasada y cuántos bits hacen falta para transportarlo con precisión de centímetro.

# text
seg-e61283b1e1a5 = Es independiente del sistema. Cualquier órbita, cualquier portadora y cualquiera de los cuatro modelos de efemérides se ejecutan sin ningún preajuste; los preajustes con nombre son datos opcionales (véase <a1>Preajustes</a1>).

# text
# c1: kshana example <name>
# c2: kshana scenarios/<name>.toml
# c3: leo-navmsg-fit-interval-trade
# c4: leo-navmsg-model-comparison
# c5: leo-navmsg-midpass-update
# c6: leo-navmsg-encode-decode
# c7: leo-pnt-chain
# c8: leo-focus-data-services
seg-1271cd4ad822 = Imprima un ejemplo incluido con <c1/> (un nombre por llamada) y ejecútelo con <c2/>: <c3/>, <c4/>, <c5/> y <c6/>. El tipo de escenario es también la etapa de mensaje del tipo de escenario <c7/> (<a1>LEO-PNT.md</a1>) y el miembro de la campaña <c8/>, que compone cuatro configuraciones de mensaje e informa de la longitud de trama de cada una ({ "146" }, { "154" }, { "159" } y { "171" } bytes).

# text
# c1: src/leo_navmsg/
# c2: elements.rs
# c3: truth.rs
# c4: fit.rs
# c5: sisre.rs
# c6: services.rs
# c7: codec.rs
# c8: text.rs
# c9: presets/
# c10: mod.rs
seg-51da9ffaa0ec = Código: <c1/> — <c2/> (registros y algoritmo de usuario), <c3/> (órbita y reloj de referencia), <c4/> (ajustador), <c5/> (error de distancia de la señal en el espacio), <c6/> (ionosfera y Tiempo Universal Coordinado (UTC)), <c7/> (formato binario), <c8/> (exportaciones de estilo Receiver Independent Exchange Format (RINEX) y de valores separados por comas (CSV)), <c9/> (un archivo por preajuste), <c10/> (el tipo de escenario).

# text
seg-0505113a62e3 = Qué transporta un mensaje

# text
seg-6752521002b2 = Parte

# text
seg-cf6ae60eea4f = Auxiliar

# text
seg-00eae74cb1e6 = identificador del vehículo espacial (SVID), edición de datos (IOD), identificador de banda, estado de salud de la señal (convención de Galileo: { "0" } correcto, { "1" } fuera de servicio, { "2" } operaciones ampliadas, { "3" } en prueba)

# text
seg-0bdbdd2c923b = Sincronización

# text
# c1: af0 + af1·(t − toc) + af2·(t − toc)²
seg-8120237b02ea = número de semana, tiempo de semana (TOW) de transmisión y un polinomio de reloj de segundo orden <c1/>

# text
seg-b09dc4b322d3 = Efemérides

# text
seg-bbb3225e1d19 = uno de los cuatro modelos siguientes

# text
seg-3a835a49b43f = Otros servicios

# text
# c1: ai0, ai1, ai2
# c2: A0, A1, ΔtLS, t0t, WNot, WNLSF, DN, ΔtLSF
seg-2a13461cb60c = un conjunto ionosférico de difusión de Klobuchar, los coeficientes de NeQuick-G de Galileo <c1/> con cinco indicadores de tormenta y los parámetros de tiempo del sistema a UTC <c2/>

# text
seg-6b899ef63047 = Modelos de efemérides

# text
seg-60cd077d82a7 = Modelo

# text
seg-2afa300864a9 = Parámetros

# text
# c1: √A, e, i0, Ω0, ω, M0, Δn, Ω̇, i̇, Cuc, Cus, Crc, Crs, Cic, Cis, toe
seg-3e8a1cf183cc = el conjunto kepleriano del Open Service Signal-in-Space Interface Control Document (OS SIS ICD) de Galileo: <c1/>

# text
# c1: a0…
# c2: c0…
# c3: r0…
# c4: τ = tk / tau_s
# c5: tau_s
# c6: rac_degrees
seg-b1416ba3472f = lo mismo, más polinomios de corrección a lo largo de la traza, transversal y radial (RAC) <c1/>, <c2/>, <c3/> en <c4/>, coeficientes en metros, <c5/> la potencia de dos igual o superior a la mitad del intervalo de ajuste (transmitida), grados fijados por <c6/> (por defecto { "7" }, { "5" }, { "6" })

# text
seg-9c0643152bbf = { "16" } + { "21" } por defecto, más la escala de tiempo

# text
# c1: ȧ, ṅ, Crs3, Crc3, Crs1, Crc1
seg-e0afd541d64c = el modelo de 22 parámetros de Liu, Su, Xie, Zhou y Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): los { "16" } más <c1/>

# text
# c1: τ = (t − t_ref) / 64 s
seg-a6042071a03f = el modelo de «reloj cero» ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations): un polinomio terrestre fijo (ECEF) por eje en <c1/> (grado por defecto { "6" }), sin términos de reloj porque el reloj del satélite se gobierna al tiempo del sistema (<a1>InsideGNSS</a1>)

# text
seg-5869d6f65796 = { "22" } por defecto

# text
# c1: elements::sat_state
# c2: kepler-rac
# c3: F·e·√A·sin E
# c4: ecef-poly
# c5: −2 r·v / c²
seg-6663aa3eeebc = El algoritmo de usuario (<c1/>) es la secuencia del ICD de Galileo (ecuación de Kepler, correcciones de segundo armónico, nodo fijo a la Tierra) seguida, para <c2/>, de los tres polinomios a lo largo del propio marco de la órbita kepleriana: radial a lo largo de la posición evaluada, transversal a lo largo de la normal a la órbita a partir de la inclinación y el nodo corregidos, y a lo largo de la traza completando la terna. El reloj añade el término relativista del ICD <c3/>; para <c4/> es la forma general <c5/> a partir del polinomio y su derivada.

# text
# c1: A = A0 + ȧ·tk
# c2: n = √(μ/A0³) + Δn + ṅ·tk
# c3: ½·ṅ·tk
# c4: ṅ
# c5: Crs1·sin Φ + Crc1·cos Φ + Crs3·sin 3Φ + Crc3·cos 3Φ
# c6: Φ
# c7: ṅ
# c8: ṅ
# c9: nDot
seg-b3935a85a7b2 = Los términos de Liu et al. siguen el algoritmo de usuario del artículo (Sección { "2.2" }, Ec. 1-7): <c1/>, <c2/> (las versiones anteriores a la { "0.30" } usaban la convención de navegación civil del Global Positioning System (GPS) <c3/>, de modo que un <c4/> escrito por ellas equivale al doble del del artículo), y <c5/> sumado al radio, <c6/> el argumento de latitud sin corregir. La convención de escala de <c7/> está transcrita de la Ec. { "1" } del artículo; la comparación con el artículo sobre órbitas reales no depende de ella (un factor ½ en <c8/> deja sin cambios todas las cifras ajustadas), de modo que el significado de un valor de <c9/> transmitido no está validado ahí.

# text
seg-9a83292bffcf = Dos lecturas son propias de Kshana y se declaran como tales:

# text
# c1: τ = tk / tau_s
seg-0e42fd0d5cf9 = El marco RAC y la normalización de <c1/>. Ningún documento público define un marco de corrección LEO para un mensaje de difusión.

# text
seg-1b8aaed09de8 = El reloj de un mensaje de reloj cero es cero en total: se da por hecho que el lazo de gobierno mantiene el reloj aparente, término relativista incluido, en el tiempo del sistema.

# text
seg-3472ce139588 = El ajustador

# text
# c1: truth.rs
# c2: θ(t) = θ0 + Ω̇e·t
# c3: gravity_degree = 0
seg-4404a677d185 = <c1/> integra la órbita con un Runge–Kutta de cuarto orden de paso fijo en un marco que pasa a ejes fijos a la Tierra mediante una única rotación, <c2/>, la misma rotación única que aplica un algoritmo de usuario de difusión. La gravedad es de dos cuerpos (<c3/>), los armónicos zonales de J2 a J6 ({ "2" } a { "6" }) o el campo del Earth Gravitational Model { "2008" } (EGM2008) hasta grado y orden de { "7" } a { "70" }, cuyos términos teserales llevan la firma de periodo corto que hace difícil un ajuste LEO. La resistencia atmosférica es opcional (densidad exponencial estática). El reloj es de funcionamiento libre (sesgo, deriva, tasa de deriva y ruido blanco de frecuencia con una desviación de Allan declarada a un segundo, más el término relativista periódico) o gobernado (un residuo gauss-markoviano de primer orden).

# text
# c1: fit.rs
# c2: e·cos ω
# c3: e·sin ω
# c4: λ0 = M0 + ω
# c5: ω
# c6: M0
# c7: toe
# c8: liu22
seg-ae3052e66b2a = <c1/> ajusta el conjunto kepleriano con Levenberg–Marquardt sobre elementos no singulares (<c2/>, <c3/>, <c4/>): una órbita LEO es casi circular, de modo que <c5/> y <c6/> por separado son casi indistinguibles. Parte del estado osculador en <c7/> con la tasa del nodo por J2. A priori débiles centrados en cero acotan las tasas y los armónicos que un arco corto no puede resolver; con un peso de observación de { "1" } cm solo actúan en esas direcciones nulas. El ajuste <c8/> toma en cambio el inicio y el estimador de la Sección { "2.3" } del artículo: parte con todos los términos de corrección en cero, no tiene a priori (mínimos cuadrados simples) y conserva el tope de 100 iteraciones del artículo. Se detiene con la regla de convergencia de parámetros propia de Kshana, cuando cada paso de parámetro es inferior a { "1e-3" } de su desviación típica formal; el artículo se detiene en cambio cuando el RMS cambia en menos de { "0.1" } mm. Después se ajustan los polinomios RAC a los residuos a lo largo de la traza, transversales y radiales por mínimos cuadrados lineales, y el polinomio de reloj al reloj de referencia menos el término relativista que añadirá el usuario.

# text
# c1: src/celeste_iod.rs
# c2: toe
# c3: toc
seg-020f45edcae1 = Un hallazgo que codifican los valores por defecto: tras un ajuste kepleriano por mínimos cuadrados, el residuo es por construcción lo que los { "16" } parámetros no pueden abarcar, de modo que oscila a lo largo de la ventana (varios cruces por cero en cada componente) en lugar de derivar. Un polinomio de corrección lo elimina solo cuando su grado supera lo que el conjunto kepleriano ya abarca: a lo largo de la traza { "7" }, transversal { "5" } y radial { "6" } reducen un residuo de 15 minutos de centímetros a aproximadamente un milímetro, mientras que grados transversales menores no eliminan casi nada (el residuo transversal es impar respecto al centro de la ventana). Un sistema que obtiene su parte kepleriana de otro modo deja un residuo de forma distinta, y los grados que necesita se derivan de ello. Los grados de corrección propios del preajuste Celeste (inferiores a estos; solo viven en el archivo del preajuste, <c1/>) se ejecutan aquí sobre la base de mínimos cuadrados de Kshana, por lo que sus términos transversales aportan poco en este motor: una afirmación sobre el ajustador de Kshana, no sobre ningún sistema real. <c2/> y <c3/> son segundos enteros, tal como los transporta el formato binario.

# text
seg-f3538e6651fa = Cada mensaje se usa durante un periodo centrado en su ventana de ajuste (la primera tabla de compromiso usa la ventana completa). Lo que miden las cifras del error de distancia de la señal en el espacio (SISRE) es el <b>error de representación</b> del mensaje frente a la referencia a la que se ajustó, como raíz cuadrática media (RMS) y como máximo sobre el intervalo. El error de determinación y de predicción de órbita, que un segmento terreno o de a bordo real añade por encima, no se modela.

# text
seg-c2b181269367 = Error de distancia de la señal en el espacio

# text
# c1: sisre.rs
seg-63462a1abc95 = <c1/> usa el SISRE de promedio global de Montenbruck, Steigenberger y Hauschild ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

# text
# c1: cos² η
# c2: ½ sin² η
# c3: η
seg-c4f654264c42 = Los pesos son los promedios sobre usuarios distribuidos uniformemente en el casquete visible de la Tierra de <c1/> y <c2/>, siendo <c3/> el ángulo de nadir de la línea de visión en el satélite, calculados para el radio propio de la órbita y su máscara de elevación. Con una máscara de { "0" }° el cálculo reproduce la tabla del artículo para la órbita terrestre media (GPS { "0.98" } y 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) y la órbita geoestacionaria ({ "0.99" } y 1/126): esa es la comprobación <b>VALIDATED</b>. En LEO el mismo promedio da

# text
seg-66b488889b10 = Altitud

# text
seg-c07128592d7b = ángulo de nadir del horizonte

# text
seg-a4e04d9a23a5 = { "320" } km

# text
seg-002adc24471f = { "510" } km

# text
seg-fe2f70c29806 = { "550" } km

# text
seg-4dee38ff0811 = { "786" } km

# text
seg-cfc3c6939861 = { "1080" } km

# text
seg-102de0413553 = { "1336" } km

# text
seg-1b11819c8b2f = de modo que un usuario LEO, que ve el satélite lejos del nadir, siente los errores a lo largo de la traza y transversales mucho más que un usuario de órbita media.

# text
seg-b7a844ab6135 = Análisis

# text
# c1: analysis = [...]
seg-17111fe25e04 = <c1/> elige cualquiera de los cuatro (por defecto, todos).

# text
seg-d0c1b335af73 = Compromiso del intervalo de ajuste

# text
# c1: [trade]
# c2: scenarios/leo-navmsg-fit-interval-trade.toml
seg-f65e99c0d8b2 = <c1/> fija el intervalo, los intervalos de ajuste, los periodos de actualización y los modelos. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 hasta grado { "20" } y resistencia atmosférica, { "30" } minutos de mensajes) da, con el periodo de uso igual al intervalo de ajuste:

# text
seg-f1a94c795c18 = Intervalo de ajuste

# text
seg-c6b034712788 = SISRE de órbita, RMS

# text
seg-55c287c93940 = SISRE de órbita, máx.

# text
seg-ad604a608329 = SISRE con reloj, RMS

# text
seg-28723ab60ae0 = radial / a lo largo de la traza / transversal, RMS

# text
seg-911a62245e80 = { "60" } s

# text
seg-1a35a89c1a34 = { "0.041" } cm

# text
seg-7cf9e6e3178f = { "0.179" } cm

# text
seg-d8a7f4c080dd = { "0.069" } cm

# text
seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

# text
seg-64015edf42d8 = { "120" } s

# text
seg-a1070c338686 = { "0.032" } cm

# text
seg-cdacf90f8ce8 = { "0.160" } cm

# text
seg-29aeee696ad2 = { "0.079" } cm

# text
seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

# text
seg-8fa4e4ccc5cc = { "180" } s

# text
seg-13182ae6d536 = { "0.093" } cm

# text
seg-fc692062aaa8 = { "0.540" } cm

# text
seg-9ef760f0777c = { "0.134" } cm

# text
seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

# text
seg-bbd4f2685bee = { "300" } s

# text
seg-93410318239b = { "0.310" } cm

# text
seg-4af8f1c977eb = { "1.033" } cm

# text
seg-0921a535896a = { "0.329" } cm

# text
seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

# text
seg-8de43db30454 = { "450" } s

# text
seg-ec7f9ca7654b = { "1.690" } cm

# text
seg-1ad55674fab9 = { "7.542" } cm

# text
seg-a022913c956d = { "1.696" } cm

# text
seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

# text
seg-21b0c99fbda4 = { "600" } s

# text
seg-6840aea9ff12 = { "2.875" } cm

# text
seg-798c8c1d0190 = { "10.219" } cm

# text
seg-6b3b442069d8 = { "2.866" } cm

# text
seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

# text
seg-4dabf1faddfc = { "900" } s

# text
seg-d733d3fdac02 = { "9.345" } cm

# text
seg-3334d120521b = { "34.032" } cm

# text
seg-4d4a2cc180d0 = { "9.349" } cm

# text
seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

# text
seg-f1d733b03f45 = { "0.000" } cm

# text
seg-81a60d921ce9 = { "0.057" } cm

# text
seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

# text
seg-c8a720a6f160 = { "0.074" } cm

# text
seg-b13f5539e4b1 = { "0.001" } cm

# text
seg-1c9d3ee30ac7 = { "0.090" } cm

# text
seg-7dd08c671dc7 = { "0.004" } cm

# text
seg-740e69fcd85e = { "0.014" } cm

# text
seg-c0db4312d8a0 = { "0.106" } cm

# text
seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

# text
seg-f3bda174cbef = { "0.037" } cm

# text
seg-5a5bb868e8ff = { "0.176" } cm

# text
seg-02b99fcb9fee = { "0.127" } cm

# text
seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

# text
seg-ec1e77bc5be9 = { "0.214" } cm

# text
seg-d3c1ed834802 = { "0.643" } cm

# text
seg-23482e7c028f = { "0.229" } cm

# text
seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

# text
seg-bfec9407ffae = { "1.015" } cm

# text
seg-f295ad6efcf4 = { "3.695" } cm

# text
seg-2cd92d16edfc = { "1.062" } cm

# text
seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

# text
seg-4e19f776d1b7 = Y con un ajuste de { "300" } s, variando la frecuencia con que un nuevo mensaje toma el relevo:

# text
seg-89810ffbeff3 = Periodo de actualización

# text
seg-d4d1fa05e1a8 = { "0.314" } cm

# text
seg-828b7488993b = { "0.850" } cm

# text
seg-edb934c1419f = { "0.288" } cm

# text
seg-52c8f821a7d2 = { "0.859" } cm

# text
seg-e135107af135 = { "150" } s

# text
seg-e7ce46d74f3e = { "0.219" } cm

# text
seg-3391df1cf909 = { "0.830" } cm

# text
seg-d6eb4f554461 = { "0.009" } cm

# text
seg-22c68874002b = { "0.010" } cm

# text
seg-2172d9ea618e = El conjunto kepleriano de 16 parámetros se degrada de { "0.04" } cm a { "60" } s a { "9.35" } cm a { "900" } s: un conjunto kepleriano con armónicos de dos veces por revolución no puede seguir durante más de unos minutos los términos de gravedad de mayor frecuencia ni la resistencia atmosférica de un arco LEO, y su residuo de mínimos cuadrados oscila a lo largo de la ventana. Los polinomios a lo largo de la traza, transversal y radial (grados { "7" }, { "5" }, { "6" }) absorben lo que queda: { "1.01" } cm a { "900" } s, { "0.21" } cm a { "600" } s. En los intervalos más cortos las cifras keplerianas son submilimétricas y ya no están estrictamente ordenadas (el ajuste queda entonces limitado por el condicionamiento, no por el modelo).

# text
seg-aca262796570 = Comparación de modelos

# text
# c1: scenarios/leo-navmsg-model-comparison.toml
seg-fdf2368d0210 = <c1/> ejecuta los cuatro modelos a { "1" }, { "5" } y { "10" } minutos sobre la misma órbita, con el número de parámetros y los bits de efemérides y reloj en la codificación de Kshana:

# text
seg-7d3c6c43390d = Bits de efemérides + reloj

# text
seg-f7f60c66d89e = { "0.022" } cm

# text
seg-f7bcb8a44fde = { "0.049" } cm

# text
seg-2972b631701e = { "0.230" } cm

# text
seg-cc42e8dc7238 = { "0.260" } cm

# text
seg-67e50069c6f7 = { "3.061" } cm

# text
seg-780954ab9d7f = { "3.071" } cm

# text
seg-de81d6550264 = { "0.044" } cm

# text
seg-fb171bf75f27 = { "0.005" } cm

# text
seg-c8c067631f7a = { "0.120" } cm

# text
seg-2dc41855c245 = { "0.208" } cm

# text
seg-6ef79938dd22 = { "0.046" } cm

# text
seg-7e96d7e34e63 = { "0.142" } cm

# text
seg-c43199891163 = { "0.258" } cm

# text
seg-f9a9fdebc114 = { "0.290" } cm

# text
# c1: ecef-poly
seg-f157ff5b40b1 = <c1/> (reloj cero)

# text
seg-9474a775dc5e = { "28.784" } cm

# text
seg-5098c8b6f813 = { "0.561" } cm

# text
seg-5e7fdc441b03 = { "28.774" } cm

# text
seg-82d3fa2e27ef = La fila de reloj cero se puntúa frente a un reloj gobernado con un residuo de { "0.24" } m (la cifra de ATOMIC); las demás, frente al reloj de funcionamiento libre al que se ajustan.

# text
seg-769db176020f = <b>Liu et al. { "2025" }, SISRE frente a la altitud (MODELLED).</b> El mismo escenario ajusta el modelo de 22 parámetros de Kshana sobre arcos de 20 minutos a las cinco altitudes del artículo, con la inclinación de cada satélite:

# text
seg-01e587427a7e = Satélite

# text
seg-f6bbd3d5d75c = Inclinación

# text
seg-c54d0bd7d498 = Liu et al. { "2025" }

# text
seg-16c489b75f44 = Kshana (RMS solo de órbita)

# text
seg-ee4816ca13c1 = razón

# text
seg-510349500d23 = { "8.88" } cm

# text
seg-a97bde451ec2 = { "4.25" } cm

# text
seg-b6c1d48847d9 = { "475" } km

# text
seg-f79249e9bd75 = { "6.21" } cm

# text
seg-9b6757a674a5 = { "2.87" } cm

# text
seg-62008169ca69 = { "2.20" } cm

# text
seg-06a4bcde0ea3 = { "966" } km

# text
seg-9e5e06ec23c3 = { "2.11" } cm

# text
seg-41ce80bc0b62 = { "1.25" } cm

# text
seg-c9f63cd8bd07 = { "0.75" } cm

# text
seg-f11a960a1d52 = { "0.51" } cm

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-0376cf5f98f0 = Esto <b>no</b> es una validación. El artículo ajustó órbitas científicas precisas reales de los satélites nombrados (con su historial completo de gravedad, resistencia atmosférica y fuerzas no gravitatorias); Kshana ajusta su propia órbita integrada, evalúa los seis parámetros añadidos como se ha descrito más arriba y usa sus propios pesos de SISRE. La comparación muestra la tendencia y el orden de magnitud. La comparación sobre las mismas órbitas reales que ajustó el artículo es <c1/> (desde la { "0.30" } el ajuste de 22 parámetros concuerda ahí dentro del factor preregistrado { "1.5" }, en los días del artículo y en ocho días reservados).

# text
seg-d82887c766e3 = Actualización a mitad de pasada

# text
# c1: [midpass]
# c2: search_s
# c3: update_period_s
# c4: threshold_m
# c5: scenarios/leo-navmsg-midpass-update.toml
seg-d1104b6ea7fa = <c1/> sitúa a un usuario (por defecto { "45" }° N, { "10" }° E), busca la pasada más alta sobre la máscara dentro de <c2/> y programa mensajes cada <c3/>. En cada cambio dentro de la pasada informa del salto de posición, del salto de reloj, del salto de pseudodistancia del usuario (mensaje nuevo menos antiguo), del mayor salto que podría ver cualquier usuario visible (forma cerrada sobre el cono de nadir), del error de distancia antes y después, y de PASS o FAIL frente a <c4/>. <c5/> (ajustes de { "300" } s actualizados cada { "150" } s):

# text
seg-7d91304c87e3 = La pasada más alta del día alcanza { "43.7" }° y dura { "455" } s. Sus cambios:

# text
seg-289e8da49cc8 = Cambio

# text
seg-e80d12ee2259 = Elevación

# text
seg-b16789d14338 = Salto de posición

# text
seg-b3c252609532 = Salto de reloj

# text
seg-8239a390ec71 = Salto de distancia del usuario

# text
seg-4153faf7969d = Salto en la peor geometría

# text
seg-14402c7fb332 = IOD { "270" } → { "271" }

# text
seg-7862a97ac55f = { "0.07" } mm

# text
seg-4cfe934c881f = { "0.19" } mm

# text
seg-9e9752920165 = -0.17 mm

# text
seg-4267557786be = { "0.27" } mm

# text
seg-46872e8925b2 = IOD { "271" } → { "272" }

# text
seg-4c803fd2ccc9 = { "0.14" } mm

# text
seg-cc9a8388f6bc = -0.24 mm

# text
seg-0549f7fd0633 = IOD { "272" } → { "273" }

# text
seg-ad1afcf9a466 = -0.22 mm

# text
seg-c1b30171b4f0 = { "0.35" } mm

# text
seg-f93647402fa9 = { "0.48" } mm

# text
seg-69b35182807c = El mayor salto de distancia del usuario es de { "0.35" } mm frente a un umbral de { "5" } cm: <b>PASS</b>.

# text
seg-96dcb456600d = Codificación y decodificación

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
seg-1b3674a0e041 = <c1/> codifica el primero de tres mensajes, lo decodifica, comprueba el CRC y rechaza una copia corrupta, imprime el presupuesto de cuantización y escribe y vuelve a leer el bloque de estilo RINEX y la tabla CSV:

# text
# c1: 0x19105F
seg-480eb9ffc333 = trama: { "171" } bytes ({ "1310" } bits de carga útil, de los cuales { "1045" } son de efemérides y reloj), comprobación de redundancia cíclica de 24 bits (CRC-24Q) <c1/>;

# text
# c1: af0
seg-0e2a64a063fd = mayor efecto de medio paso de un solo campo: <c1/>, { "0.545" } mm;

# text
seg-a1875f7088b0 = mensaje completo tras la cuantización: posición a menos de { "1.126" } mm y reloj a menos de { "0.185" } mm del mensaje exacto; SISRE { "0.113" } cm exacto, { "0.129" } cm decodificado;

# text
seg-6e818708b695 = una trama con un bit invertido es rechazada: true;

# text
seg-31fe0f6b133d = ida y vuelta RINEX-style dentro de { "5.0e-06" } m, ida y vuelta CSV dentro de { "0.0e+00" } m.

# text
seg-405cf34090cc = Independencia de la plataforma

# text
# c1: libm
# c2: src/portable_math.rs
# c3: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c4: leo-navmsg
seg-7f2193f6ff06 = Una trama se transmite como enteros, así que han de ser los mismos enteros dondequiera y comoquiera que se ejecute el escenario: el binario nativo en cualquier sistema operativo, una compilación de depuración o de publicación y la compilación WebAssembly (WASM) en un navegador. Tres cosas lo impedían. El seno, el coseno, la arcotangente y la exponencial de la biblioteca matemática de un anfitrión no tienen por qué estar correctamente redondeados y difieren entre anfitriones en la última cifra. Una compilación optimizada en macOS toma el seno y el coseno de un mismo argumento de la rutina combinada del sistema, que no siempre devuelve el valor del seno aislado, de modo que también diferían una compilación de depuración y una de publicación. Y el muestreador normal habitual llama a la exponencial y al logaritmo del anfitrión en sus ramas poco frecuentes. El ajuste convierte una diferencia tan pequeña en campos cuantizados distintos. Por ello todo el tipo de escenario (órbita y reloj de referencia, ajuste, algoritmo de usuario, error de distancia de la señal en el espacio (SISRE), códec) calcula cada una de esas funciones con la biblioteca <c1/> de Rust puro mediante <c2/>, las potencias enteras como productos explícitos y las desviaciones normales por el método polar sobre la salida bruta del generador. <c3/> fija la trama de 171 bytes del escenario de codificación y decodificación que sigue y un valor de comprobación por modelo de efemérides; una compilación de depuración, una de publicación y la compilación WASM dan documentos de resultados idénticos byte a byte para los cinco escenarios <c4/> incluidos.

# text
seg-1ef00467df17 = Formato binario

# text
seg-af2dae9e9e7c = <b>Esta es la codificación documentada propia de Kshana.</b> Transporta los componentes que nombran las descripciones publicadas de los mensajes de navegación LEO, modelada sobre el conjunto de campos del ICD de Galileo. <b>No</b> es la disposición de bits de Celeste ni de ningún otro sistema: ninguna es pública.

# text
# c1: 0xA7
# c2: kepler16
# c3: kepler-rac
# c4: liu22
# c5: ecef-poly
# c6: 0x1864CFB
# c7: 0xCDE703
# c8: 123456789
seg-6a730c01ad1c = Trama: preámbulo <c1/> ({ "8" } bits), versión { "1" } ({ "4" }), modelo ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), longitud de la carga útil en bytes ({ "12" }), carga útil rellenada con ceros hasta un byte, CRC-24Q (una comprobación de redundancia cíclica de 24 bits, { "24" } bits) sobre todos los bytes precedentes. CRC-24Q es la comprobación del estándar RTCM { "10403" } de la Radio Technical Commission for Maritime Services y del ICD de Galileo (polinomio <c6/>, valor inicial { "0" }); el código reproduce el valor de comprobación de catálogo <c7/> para <c8/> y los bytes de comprobación de la trama de ejemplo del mensaje de tipo { "1005" } de RTCM { "10403" } (<b>VALIDATED</b>).

# text
# c1: Crs
# c2: Cuc
# c3: af0
seg-a31d899eb435 = Los pasos del ICD de Galileo se eligieron para la órbita terrestre media y son demasiado gruesos para un mensaje LEO de nivel centimétrico: <c1/> en pasos de { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm al radio de LEO), los ángulos { "2" }⁻³¹ semicírculos ({ "1.0" } cm) y <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana conserva las unidades del ICD y la convención del semicírculo, afina los pasos para que el error de medio paso de cada campo se mantenga por debajo de { "1" } mm de posición o de distancia en una ventana de 15 minutos, y ensancha los campos para conservar los rangos que necesita un ajuste LEO:

# text
seg-caddc6f5b9a7 = Bloque

# text
seg-b548b723c201 = Bits

# text
seg-d00b65801e9b = Paso

# text
seg-2085d172bec3 = auxiliar y sincronización

# text
seg-7e9018f82811 = semana

# text
seg-45cbfedb6f0e = reloj (bit indicador { "0" })

# text
seg-05d274f5ce99 = s/s^{ "2" }

# text
seg-9d6d5136e12a = kepleriano (modelos 1-3)

# text
seg-3fb59c8238cb = semicírculo

# text
seg-d173e8d7026c = m^{ "0.5" }

# text
seg-48c8bfb6e914 = correcciones a lo largo de la traza/transversal/radial (modelo { "2" })

# text
seg-131652f53721 = extras de Liu et al. { "2025" } (modelo { "3" })

# text
seg-fccf37a24fc4 = semicircle/s^{ "2" }

# text
seg-ebde561c17ab = polinomio ECEF (modelo { "4" })

# text
seg-822c7482547c = Klobuchar (bit indicador { "1" })

# text
seg-7dd6e8bcaf43 = s/semicircle^{ "2" }

# text
seg-09408b08c481 = s/semicircle^{ "3" }

# text
seg-734162101b2d = NeQuick-G (bit indicador { "2" })

# text
seg-ddbb363f4593 = sfu/deg^{ "2" }

# text
seg-e2744b31e5d3 = UTC (bit indicador { "3" })

# text
# c1: deltaN
# c2: OmegaDot
# c3: aDot
# c4: nDot
# c5: nDot
# c6: kepler-rac
# c7: quantisation_budget
seg-545755e7b26f = Un valor fuera del rango de su campo se rechaza, no se envuelve. Los rangos se comprobaron codificando ajustes a { "300" } hasta { "2000" } km, inclinaciones de { "0" }° a { "140" }° e intervalos de ajuste de hasta { "20" } minutos: <c1/> y <c2/> son amplios porque en una órbita casi ecuatorial el nodo está mal definido y el ajuste reparte entre ambos la deriva por J2 del argumento de latitud, y <c3/> y <c4/> porque el ajuste de 22 parámetros sobre { "20" } minutos absorbe parte de la oscilación de periodo corto del semieje mayor. Desde la { "0.30" } el ajuste de 22 parámetros es el de mínimos cuadrados simples del artículo, sin a priori, y un ajuste ecuatorial a { "800" } km necesita entonces <c5/> de unos { "6.3e-10" } semicírculos/s^{ "2" }, por lo que su escala pasó de { "2" }^-60 a { "2" }^-58. Las correcciones a lo largo de la traza de grado 7 de <c6/> caben en el rango de coeficientes de 22 bits hasta { "15" } minutos; un ajuste más largo puede superarlo y entonces se rechaza. <c7/> informa, para cada campo de efemérides y reloj, del mayor cambio de posición y de distancia que produce un cambio de medio paso a lo largo del periodo de uso, y del cambio del mensaje completo tras la cuantización.

# text
seg-1ad17f3d3643 = Exportaciones de texto

# text
# c1: text.rs
# c2: > EPH
# c3: D19.12
# c4: L
# c5: KP16
# c6: KRAC
# c7: LU22
# c8: APOL
seg-81fb376aa1e1 = <b>RINEX { "4.02" } no define registros de navegación LEO</b> (sus letras de sistema son G, R, E, J, C, I y S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). El bloque que escribe <c1/> toma prestada la forma de RINEX { "4" } —una cabecera de registro <c2/>, una línea de satélite y época con tres términos de reloj, líneas de órbita de difusión de cuatro campos <c3/>— y es una <b>extensión documentada de Kshana</b>: letra de sistema <c4/>, tipos de registro <c5/>, <c6/>, <c7/>, <c8/> y tres comentarios de cabecera que lo indican. Antecedentes de órbitas LEO en registros de navegación de estilo RINEX-4: <a2>arXiv { "2401.17767" }</a2>.

# text
# c1: kepler16
# c2: kepler-rac
# c3: SVID, IOD, Band, WeekNumber, ToW, Health, toc, af0, af1, af2, toe, M0, sqrtA, e, deltaN, Omega0, OmegaDot, iDot, i0, omega, Crc, Crs, Cic, Cis, Cuc, Cus, a0…, c0…, r0…, racTau
# c4: csv_schema
seg-9a3016441bce = La tabla CSV lleva los mensajes <c1/> y <c2/>, uno por fila. Las columnas por defecto usan los nombres del ICD de Galileo (<c3/>); <c4/> selecciona en su lugar la grafía de un preajuste. Ambos formatos se pueden volver a leer.

# text
seg-4a26902d2771 = Ionosfera y UTC

# text
# c1: gnss_sim::klobuchar_delay_m
# c2: (f_L1 / f)²
seg-c4d4dd2bac45 = <b>Klobuchar</b>: el modelo L1 del motor (<c1/>, comprobado frente a RTKLIB) escalado a la portadora por la ley de primer orden <c2/>.

# text
# c1: effective_ionisation_level
# c2: Az = ai0 + ai1·μ + ai2·μ²
# c3: μ
# c4: Az
seg-0d3973f04ee5 = <b>NeQuick-G</b>: los coeficientes viajan en el mensaje y <c1/> devuelve <c2/> para una latitud de inclinación modificada <c3/>, con las reglas del algoritmo (unos coeficientes todos nulos dan { "63.7" } unidades de flujo solar, sfu; el resultado se acota a [{ "0" }, { "400" }] sfu). El modelo de densidad electrónica NeQuick y su integración oblicua, que convierten <c4/> en un retardo, <b>no</b> están implementados.

# text
seg-66dbd447dfeb = Un satélite a unos cientos de kilómetros vuela dentro de la ionosfera. Ninguno de los modelos de difusión tiene en cuenta el contenido de electrones por encima del satélite, y no se aplica ninguna corrección por él.

# text
# c1: system_to_utc
seg-7befd59b2ac6 = <b>UTC</b>: <c1/> aplica los tres casos del §{ "5.1.7" } del ICD de Galileo (antes de un evento de segundo intercalar, a menos de seis horas de él y después); un segundo insertado se lee { "86400" }.

# text
seg-2b0d77219437 = Preajustes

# text
# c1: src/leo_navmsg/presets/
seg-d2908020db08 = Los preajustes son datos, un archivo cada uno en <c1/>, con sus fuentes. El motor y todos los escenarios incluidos, salvo el de Celeste, se ejecutan sin ellos.

# text
seg-c353e7bec219 = Clave

# text
seg-5566e1d71a4f = Órbita

# text
seg-33f4c7af9c53 = Portadora

# text
seg-f4510e898031 = Modelo de mensaje

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-890aa92157e4 = { "1080" } km, { "53" }°

# text
seg-1eca13ba2309 = X1 { "1593.3225" } MHz

# text
seg-ee9947222a30 = no publicado

# text
seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

# text
seg-f016786d7755 = { "520" } km, { "97" }°

# text
seg-780e931bf88d = PUBLIC, <a1>informe de RNTF</a1>, descripción de la constelación

# text
seg-d5df094a5f89 = { "781" } km, { "86.4" }°

# text
seg-94bc78cee128 = { "1621" } MHz ({ "1616" }–{ "1626" } MHz band)

# text
seg-3f5de7f74502 = ninguno difundido

# text
seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, descripción de la constelación

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-2ef501f97eff = banda Ku, valor de banda media (representativo)

# text
seg-567fab40bd24 = ninguno (señales de oportunidad)

# text
seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

# text
seg-f5dd5086eedd = { "700" } km, { "55" }°

# text
seg-5fa6b60f66b4 = cerca de B1 (enmascarada en la fuente; L1 como sustituto)

# text
seg-5ebbf0042d7c = REPRESENTATIVE

# text
seg-4f3e5a683682 = { "600" } km, { "97.8" }°

# text
seg-c06f62ca5173 = { "5020" } MHz (centro de la banda C de RNSS)

# text
seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

# text
seg-3b1fd041f9ba = { "500" } km (representativo)

# text
seg-522c85402d84 = L1 (representativo)

# text
# c1: ecef-poly
seg-064b03765e4d = <c1/>, grado { "6" }, { "60" } s, renovado cada { "30" } s, reloj cero, residuo de gobierno de { "0.24" } m

# text
seg-5619bc61b958 = WORKSHOP y PUBLIC

# text
seg-20572d7e348d = { "510" } km, { "97.4" }°

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
# c1: kepler-rac
seg-fad0950a2d67 = <c1/>, grados y espaciado de registros en el archivo del preajuste

# text
seg-e881ffc4e14b = RNSS es el servicio de radionavegación por satélite; RNTF es la Resilient Navigation and Timing Foundation.

# text
# c1: navmsg
# c2: src/celeste_iod.rs
# c3: scenarios/leo-navmsg-celeste-iod.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-e9524c71636d = <b>Celeste IOD.</b> El preajuste de la demostración en órbita (IOD) Celeste de la Agencia Espacial Europea (ESA) es el único que usa material presentado en el taller LEO-PNT del Navigation Innovation and Support Programme (NAVISP) de la ESA, { "2026" }: la estructura del mensaje (conjunto kepleriano de Galileo más polinomios de corrección a lo largo de la traza/transversal/radial, polinomio de reloj, SVID, salud, IOD, parámetros ionosféricos y de UTC), el espaciado de registros y los nombres de las columnas CSV. La órbita ({ "510" } km, heliosíncrona casi polar) y la portadora proceden de fuentes públicas citadas en el archivo. La disposición de bits de Celeste no es pública y no se reproduce; las fases posteriores de Celeste y el sistema LEO-PNT de la Unión Europea (UE) pueden diferir. Cada valor derivado del taller se encuentra en el módulo <c1/> de <c2/>, usado por <c3/>. Cómo se retiene el preajuste: todo número del motor derivado del taller vive en un único archivo, <c4/>, que <c5/> compila solo cuando existe, y en los escenarios exclusivos del repositorio <c6/>. Eliminar ese archivo y esos escenarios retiene el preajuste sin editar ninguna fuente; el resto de pruebas, referencias independientes y escenarios se ejecutan sin él, y el recuento de archivos de escenario del README sigue contando los archivos retenidos.

# text
seg-906da2752f76 = Verificación

# text
seg-7338b6210228 = Fila

# text
seg-c5ce76c91ff7 = Etiqueta

# text
seg-cfe0d596296e = Pesos de SISRE

# text
seg-3e0059048a0d = tabla de Montenbruck et al. { "2018" } (GPS, GLONASS, Galileo, BeiDou, geoestacionaria)

# text
seg-0f5e73171fe0 = algoritmo de usuario del ICD de Galileo

# text
# c1: eph2pos
# c2: tests/leo_navmsg_reference.rs
seg-29ad977ef423 = RTKLIB <c1/> sobre cuatro efemérides de difusión reales de Galileo, { "1" } mm por eje (<c2/>)

# text
# c1: 0xCDE703
seg-ecec254e8219 = valor de comprobación de catálogo <c1/>; trama de ejemplo RTCM { "10403" } { "1005" }

# text
seg-388633e4e785 = Ajustador y compromiso de SISRE

# text
seg-8b85c3277e66 = referencia de dos cuerpos recuperada a { "1" } mm; ajuste J2–J6 corregido a { "1" } mm; crecimiento monótono con el intervalo

# text
seg-4de7f2b173c5 = Continuidad a mitad de pasada

# text
seg-bdbd2771c7f5 = identidad del salto; cota de cono en forma cerrada frente a muestreo

# text
seg-468a92a2caf7 = Formato binario y presupuesto

# text
seg-ba26f5f63172 = ida y vuelta; el medio paso de cada campo por debajo de { "1" } mm

# text
seg-9be43cbef131 = RINEX-style y CSV

# text
seg-a7748156fd6e = ida y vuelta

# text
seg-88b5cda10923 = modelo y ajuste de 22 parámetros de Liu et al. { "2025" }

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-7272ebdc1fec = órbitas precisas ITSG de TU Graz de cuatro satélites frente a las Tablas { "4" }, { "5" }, { "6" } y { "8" } del artículo: razones a lo largo de la traza, transversal, radial y SISRE de { "0.755" } a { "1.138" } en los días del artículo y de { "0.683" } a { "1.186" } en ocho días reservados, dentro de 1.5x (<c1/>)

# text
seg-94066142a642 = polinomio de reloj cero de ATOMIC y la tabla de cinco altitudes

# text
seg-205cdc6a3696 = hechos de ATOMIC según InsideGNSS; la tabla publicada de Liu impresa junto al ajuste de órbita integrada de Kshana, no fijada

# text
seg-8c00ed11609c = formas cerradas del ICD; el modelo de Klobuchar comprobado con RTKLIB

# text
seg-d5653e0958b5 = SISRE es solo error de representación: sin error de determinación ni de predicción de órbita.

# text
seg-4968d9fcbc19 = La referencia es una integración de Kshana (sin tercer cuerpo, presión de radiación solar ni mareas), no la órbita precisa de un satélite real.

# text
seg-6a4a1bf21b50 = El formato binario y el bloque de estilo RINEX son propios de Kshana.

# text
seg-26c0a2693081 = NeQuick-G se transporta, no se integra en un retardo; no hay corrección para un satélite dentro de la ionosfera.

# text
seg-2a0c8190c38e = La comparación con Liu et al. difiere en órbitas, lectura de parámetros y pesos.

# text
seg-4abe216f987a = <s1>Anterior</s1>Pasada LEO y presupuesto de enlace

# text
seg-59d9bf4735d8 = <s1>Siguiente</s1>Posicionamiento fusionado MEO y LEO
