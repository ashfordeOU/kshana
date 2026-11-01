# docs--ssv: translations (es)

# text
seg-0857a94a948e = Límites

# text
seg-75c8da01c0f1 = MET

# text
seg-069a652c402e = umbral

# attr:alt
seg-1f79a5aae6c5 = Disponibilidad de señal para un usuario sobre una esfera a { "36000" } km de altitud con una antena hemisférica, a partir de una ejecución real del motor v{ $version } sobre scenarios/gnss-ssv-shell.toml (una ejecución reducida: { "162" } usuarios, { "3" } días, pasos de { "10" } min), con un umbral de { "20" } dB-Hz. Para cada constelación y banda, dos barras: la proporción de pares (usuario, época) con al menos una señal y con al menos cuatro. Combinado, L1: { "99.4" } % al menos una, { "73.2" } % al menos cuatro, interrupción más larga por debajo de cuatro señales { "160" } min. Combinado, L5: { "100.0" } % al menos una, { "99.9" } % al menos cuatro, interrupción más larga por debajo de cuatro señales { "20" } min. MODELLED: un estudio modelado a partir de entradas declaradas, no una medición ni una afirmación de volumen de servicio para ningún sistema. El tamaño reducido no es la comparación con el folleto. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-92ef8e0b78de = Señales a lo largo de una órbita terrestre alta (perigeo { "497" } km, apogeo { "58622" } km, periodo { "18.8" } h), a partir de una ejecución real del motor v{ $version } sobre scenarios/gnss-ssv-heo.toml, banda L1. Arriba: la mejor densidad de portadora a ruido entre las señales a la vista, frente al umbral de { "20" } dB-Hz. En medio: el número de señales a la vista de todas las constelaciones, de { "4" } a { "55" } a lo largo de los puntos muestreados. De los enlaces recibidos, { "2252" } llegaron por un lóbulo principal y { "696" } por lóbulos laterales, con un patrón paramétrico sustitutivo etiquetado, no el patrón medido de ningún sistema. PDOP mediano { "67" }, percentil 95 { "358" }. MODELLED: un estudio modelado a partir de entradas declaradas, no una medición ni una afirmación de volumen de servicio para ningún sistema. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-902c5c7da9aa = Un filtro de nueve estados a bordo en una transferencia desde órbita baja hacia la Luna, a partir de una ejecución real del motor v{ $version } sobre scenarios/gnss-ssv-nav-lunar.toml ({ "289" } épocas, { "13" } puntos dibujados). En un eje logarítmico, el error de posición real y la propia cota de un sigma del filtro frente al tiempo desde el inicio. Dentro de las órbitas GNSS el RMS de posición es { "1.4" } m; por encima de ellas es { "90" } m, con el error final de { "184" } m a { "193,330" } km de altitud con { "1" } medición. El error de estimación normalizado al cuadrado medio de toda la ejecución es { "4.4" } (unos { "3" } para un bloque de posición coherente). La verdad y el filtro comparten sus sustitutos del Sol y de la Luna. MODELLED: un estudio modelado a partir de entradas declaradas, no una medición ni una afirmación de volumen de servicio para ningún sistema. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-9a947b61a4cb = Navegación relativa de { "2" } subordinados en torno a un jefe en una órbita alta, a partir de una ejecución real del motor v{ $version } sobre scenarios/gnss-ssv-formation-heo.toml ({ "401" } épocas). Para cada subordinado, dos barras: el RMS de la posición relativa restando las dos estimaciones absolutas independientes, y el del filtro relativo sobre pseudodistancias de diferencia simple. Línea base { "0.8" } km: { "5.1" } m y { "1.2" } m. Línea base { "2.0" } km: { "4.1" } m y { "2.1" } m. El filtro absoluto no es coherente aquí: error de estimación normalizado al cuadrado medio { "187" } frente a unos { "3" } para un filtro coherente, de modo que su incertidumbre declarada es muy inferior a la real. MODELLED: un estudio modelado a partir de entradas declaradas, no una medición ni una afirmación de volumen de servicio para ningún sistema. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# attr:alt
seg-d76123040989 = La comparación registrada del modelo de disponibilidad de usuarios espaciales con el folleto público del Volumen de Servicio Espacial, a partir de los resultados registrados de la ejecución preregistrada (xval/gnss-ssv/results-run1.json, escrito por el ejemplo ssv_booklet_check del motor v{ $version }). Umbral por umbral, las celdas dentro de la tolerancia: S0 { "13" } de { "13" } (MET); S1 { "43" } de { "52" } (NOT MET); S2 { "48" } de { "52" } (NOT MET); S3 { "122" } de { "155" } (NOT MET); S4 { "132" } de { "156" } (NOT MET); S5 { "18" } de { "26" } (NOT MET); S6 { "26" } de { "26" } (MET); S7 { "0" } de { "20" } patrones de panel (NOT MET). Solo se alcanzan S0 y S6 con la lectura preregistrada. Una variante de diagnóstico que usa los otros ángulos de GLONASS del folleto lleva S1, S2 y S4 a todas las celdas, pero no sustituye la ejecución de referencia. Ninguna fila del registro es VALIDATED. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# text
# c1: docs/SSV.md
seg-74675df154dc = Fuente: <c1/>

# text
# c1: gnss-ssv
seg-ce7ea32e67f1 = GNSS más allá de la constelación: el tipo <c1/>

# text
seg-389cb131fd77 = Solo consultivo. Resultados modelados a partir de entradas declaradas y de una verdad simulada; no es una certificación, una cifra cualificada para vuelo ni una afirmación de volumen de servicio de ningún sistema. Kshana no transmite nada.

# text
# c1: gnss-ssv
# c2: [shell]
# c3: [trajectory]
# c4: [navigation]
# c5: [formation]
seg-a0011b278269 = El tipo <c1/> responde a lo siguiente: para una nave situada por encima, alrededor o mucho más allá de las órbitas GNSS, ¿cuántas señales GNSS puede usar, qué intensidad tienen, qué calidad tiene la geometría y qué puede hacer con ellas un filtro a bordo? Tiene tres modos, elegidos según la tabla que tenga el escenario: <c2/>, <c3/> o <c4/> (con una <c5/> opcional).

# text
seg-2e4ac6b7a883 = Estado: <b>MODELLED</b>. Los barridos de disponibilidad se comparan con el folleto del Volumen de Servicio Espacial del ICG bajo un preregistro; vea <a1>lo que muestra la comparación</a1> antes de confiar en cualquier número.

# text
seg-a0ff58bccaa8 = Fuentes públicas

# text
# c1: xval/gnss-ssv/fetch.sh
seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, Oficina de las Naciones Unidas para Asuntos del Espacio Ultraterrestre, ST/SPACE/75 ({ "1" } de noviembre de { "2018" }), preparado por el Comité Internacional sobre GNSS (ICG), Grupo de Trabajo B: el método (anexo B), los elementos orbitales de cada constelación (anexo C), los anchos de haz y potencias de transmisión (tablas B2, B6, B8, { "4.2" }), las antenas de usuario (tabla B10) y las tablas de disponibilidad publicadas. Es en sí mismo una simulación. Se descarga con <c1/> (SHA-256 fijado) y nunca se incorpora al repositorio.

# text
seg-e46d9353e6f3 = Centro de Navegación de la Guardia Costera de EE. UU., diagramas de panel de antena de GPS Block IIR e IIR-M (Marquis, { "2014" }): los diagramas medidos del panel L1 usados únicamente para juzgar el sustituto paramétrico (umbral S7). Se descargan, nunca se incorporan al repositorio, y no se confirma ningún dato de diagramas.

# text
# c1: src/ssv/limb.rs
seg-0a002dc0df64 = Las constantes del modelo (gravedad, rotación terrestre, pérdida en espacio libre, densidad de ruido) son estándar; la ley de densidad de la plasmasfera de Gallagher, la capa de Chapman y el perfil de refractividad radioeléctrica son formas publicadas, usadas con parámetros simples declarados (véase <c1/>).

# text
seg-c3c3f63df966 = Modo shell: la métrica global del folleto

# text
# c1: [shell]
seg-f1e153c95b13 = <c1/> sitúa a un usuario sobre una esfera (por defecto a { "36,000" } km de altitud con una antena hemisférica apuntada al nadir, el SSV superior; o a { "8,000" } km con una antena omnidireccional, el SSV inferior) sobre una malla de icosfera de 2,562 puntos y cuenta, durante { "14" } días en pasos de 1 minuto, la proporción de pares (usuario, época) con al menos una y al menos cuatro señales, por constelación y combinadas, y la interrupción más larga en el peor usuario. El barrido usa el intervalo de visibilidad en forma cerrada en ángulo central (un cono de haz, el bloqueo terrestre por la esfera de { "6378" } km más { "50" } km, el hemisferio del usuario y el límite de alcance de RF) y se ejecuta en segundos en una compilación de lanzamiento; una prueba de propiedades lo comprueba frente al predicado geométrico general.

# text
seg-3fb4c06c8b3f = Modo trayectoria: a lo largo de una órbita

# text
# c1: [trajectory]
# c2: leo
# c3: meo
# c4: geo
# c5: heo
# c6: lunar-transfer
seg-632fedc95af5 = <c1/> hace volar al usuario en una órbita kepleriana (un perfil: <c2/>, <c3/>, <c4/>, <c5/> (la tabla { "5.10" } del folleto) o <c6/>, o elementos) e informa, por banda y constelación, de la disponibilidad de una y de cuatro señales, las duraciones de las interrupciones, las señales a la vista, el mejor C/N0, la dilución de la precisión (mediana, percentil 95, peor caso), los enlaces recibidos por el lóbulo principal y por los lóbulos laterales, y una serie temporal y un CSV opcionales.

# text
# c1: [transmit] pattern
# c2: booklet
# c3: parametric
# c4: table
# c5: pattern_csv
# c6: pattern_text
# c7: xval/gnss-ssv/extract_patterns.py
seg-7bfd301cd789 = <b>Diagrama de transmisión</b> (<c1/>): <c2/> (potencia constante dentro del ángulo de referencia fuera del eje), <c3/> (un sustituto etiquetado: { "3" } dB por grado más allá del ángulo de referencia hasta un suelo { "25" } dB por debajo del lóbulo principal; <b>no</b> es el diagrama medido de ningún sistema) o <c4/> (un diagrama medido que usted aporta: <c5/> o <c6/> en línea; los diagramas de panel de Block IIR/IIR-M pueden extraerse con <c7/>).

# text
seg-c1390929d9f2 = <b>Antenas receptoras</b>: omni, hemisferio, o las antenas de alta ganancia y de parche de la tabla B10 del folleto, al nadir o al cenit; cada enlace usa la antena de mayor ganancia.

# text
# c1: [atmosphere]
seg-fe56ab7a2cac = <b>Medio de rayo rasante</b> (<c1/>): una ionosfera de Chapman, una plasmasfera (forma de Gallagher { "1988" }, plasmapausa en L = { "4.5" }, reducida progresivamente por debajo de { "1,500" } km) y una atmósfera neutra (curvatura de unos { "1.33" } grados en la superficie, absorción de oxígeno, desenfoque) integrados a lo largo del rayo recto. Informa del TEC oblicuo, la parte plasmasférica, el retardo en exceso, la altitud tangente y los enlaces perdidos por rasancia. Integración de rayo recto: la curvatura se informa, no se itera.

# text
# c1: [receiver] weak_signal
seg-1bad91204f6a = <b>Receptor de señal débil</b> (<c1/>): integración coherente y no coherente, límite de bits de datos, canales de ayuda y de piloto, búsqueda Doppler; el umbral de adquisición con las probabilidades de detección y de falsa alarma indicadas y los umbrales de seguimiento de portadora y de código sustituyen al umbral fijo de C/N0 (intervalo de { "10" } a { "25" } dB-Hz). Reutiliza los modelos de adquisición y de lazo de seguimiento del motor.

# text
seg-497126fe23e9 = Modo navegación: un filtro a bordo

# text
# c1: [navigation]
# c2: [atmosphere]
seg-af7919ae046e = <c1/> hace volar una nave de órbita alta o de transferencia lunar y ejecuta un filtro de Kalman extendido de nueve estados (posición, velocidad, sesgo y deriva del reloj del receptor, una escala de presión de radiación solar) sobre pseudodistancias. La verdad se integra con gravedad de masa puntual, J2, terceros cuerpos Sol y Luna y presión de radiación con una sombra terrestre cilíndrica; el filtro modela la gravedad, J2 y los terceros cuerpos y estima la presión de radiación. Las pseudodistancias proceden de la misma geometría de enlace y del mismo umbral de C/N0 que los barridos; su ruido crece al disminuir el C/N0; el retardo en exceso del medio (con <c2/>) se añade y el filtro no lo modela. El informe separa la parte de la ejecución dentro de las órbitas GNSS (por debajo de { "20,000" } km de altitud) de la parte por encima, da el mayor hueco sin medidas y el error de estimación normalizado al cuadrado medio (cercano a { "3" } para un bloque de posición consistente). El Sol y la Luna son sustitutos circulares de baja precisión.

# text
seg-a515950c13d6 = Modo formación: navegación relativa

# text
# c1: [formation]
# c2: [navigation]
seg-8d2b72ca56d9 = <c1/> (necesita <c2/> para la nave principal) añade naves subordinadas desplazadas en anomalía verdadera. Cada nave ejecuta el filtro absoluto; la posición de la subordinada respecto de la principal se estima restando las estimaciones absolutas independientes y mediante un filtro relativo sobre pseudodistancias de diferencia simple de las señales que siguen ambas naves. El informe da ambas, la línea base y el número de señales seguidas en común.

# text
seg-dc78efcb8bcb = Lo que muestra la comparación con el folleto

# text
# c1: xval/gnss-ssv/PREREGISTRATION.md
# c2: xval/gnss-ssv/RESULTS.md
# c3: results-*.json
# c4: tests/ssv_booklet_results.rs
seg-643bcfcea515 = Los umbrales se preregistraron (<c1/>, adendas { "1" } a { "5" }) antes de la ejecución a tamaño completo; resultados en <c2/>, celdas en <c3/>, fijados por <c4/>, con los fallos incluidos.

# text
seg-5498636f8d07 = qué

# text
seg-32c0ea7929e2 = ejecución { "1" } (lectura preregistrada)

# text
seg-abe521171d2f = variante con ángulo de GLONASS (diagnóstico)

# text
seg-9489ef691574 = potencia radiada mínima, { "13" } señales, dentro de { "0.1" } dB

# text
seg-4b7e0252355c = geometría del SSV superior (tabla B4)

# text
seg-e3c870085a6c = NOT MET ({ "43" } de { "52" } celdas)

# text
seg-b57b1f9b0b43 = las { "52" } celdas dentro de la tolerancia

# text
seg-6bf57763d120 = SSV inferior (tabla { "5.2" })

# text
seg-c9349a3a0185 = NOT MET ({ "48" } de { "52" })

# text
seg-056eae8e55d1 = las { "52" }

# text
seg-805e4402f556 = SSV superior con 15/20/25 dB-Hz (tabla B9)

# text
seg-a8d9a1f66989 = NOT MET ({ "122" } de { "155" })

# text
seg-7a6fd0eb8f77 = { "153" } de { "155" }

# text
seg-cb1a6f558a09 = seis misiones GEO

# text
seg-e4759e8d2baa = NOT MET ({ "132" } de { "156" })

# text
seg-3e59e79791e2 = las { "156" }

# text
seg-76d88834ab69 = misión HEO

# text
seg-1c06414304a0 = NOT MET ({ "18" } de { "26" })

# text
seg-b1656692859b = { "21" } de { "26" }

# text
seg-d4cedd711485 = misión lunar

# text
seg-b52333886109 = NOT MET ({ "23" } de { "26" })

# text
seg-479a041e2b62 = diagrama paramétrico frente a los diagramas medidos del panel L1 de GPS

# text
seg-b514bc035c86 = NOT MET (RMS { "6.3" } a { "8.8" } dB frente a { "3" } dB)

# text
seg-dd703fdea949 = El folleto es internamente incoherente sobre el ángulo de referencia fuera del eje de GLONASS: las tablas B2 y B6 indican { "20" } y { "28" } grados, y la tabla { "4.2" } indica { "26" } y { "34" }. La ejecución { "1" } usó el primero (el que nombraba el preregistro); casi todos los fallos de S1 a S5 son de GLONASS. La variante, comprometida como diagnóstico antes de ejecutarla, usa el segundo, y entonces las misiones del SSV superior, del SSV inferior y GEO coinciden celda a celda, interrupciones incluidas. La variante no sustituye a la ejecución { "1" }. <b>Ninguna fila está VALIDATED</b>: el folleto es una simulación, la regla de veredicto exige de S0 a S3 bajo la lectura preregistrada, y los fallos restantes (GPS L1 a { "20" } dB-Hz, Galileo en HEO, QZSS y NavIC, las filas lunares de GLONASS) no tienen explicación.

# text
seg-6eecf686159b = Cómo ejecutarlo

# text
# c1: kshana.run
# c2: run_scenario
# c3: pattern_csv
# c4: pattern_text
seg-adbb9c22de1c = Todos los escenarios incluidos están recortados para ejecutarse en segundos; la comparación a tamaño completo es el ejemplo anterior. El mismo tipo se ejecuta desde Python (<c1/>), el navegador (WebAssembly), el servidor MCP (<c2/>, solo texto en línea: <c3/> es una fuente de archivo y se rechaza, use <c4/>) y los complementos.

# text
seg-8fa10c8e7ab7 = MODELLED: nada de esto se ha comparado con recepción GNSS medida en órbita. El folleto es una simulación.

# text
seg-b34e9acebec0 = Órbitas keplerianas de dos cuerpos para las constelaciones GNSS y para el usuario en los barridos; la transferencia lunar es una elipse de dos cuerpos, no una trayectoria propagada.

# text
seg-76aa617ba828 = El medio es un modelo simple declarado con integración de rayo recto; no es una predicción de meteorología espacial.

# text
seg-3114c4249988 = El filtro de navegación es un estudio de diseño: sin maniobras, sin actitud, sin multitrayecto, y la verdad comparte con el filtro sus efemérides del Sol y de la Luna.

# text
seg-2deafc0f9534 = <s1>Anterior</s1>Estación de referencia lunar

# text
seg-23386861eebf = <s1>Siguiente</s1>Órbita y superficie lunares como infraestructura
