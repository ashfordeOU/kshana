# docs--telecom-timing: translations (es)

# text
seg-04ece0eb7bd2 = Id de máscara

# attr:aria-label, text
seg-a13eab564243 = MTIE

# attr:aria-label, text
seg-f155b7ceef1f = TDEV

# text
seg-42cdb8e987e6 = Presupuesto

# text
seg-88372b30ed79 = Límite

# text
seg-50fffd444946 = { "100" } ns

# text
seg-79e6a31245f2 = { "400" } ns

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-587beeccaa11 = Preajuste

# text
seg-edb7b16b6c0e = Validación

# text
seg-3c513ef2fd3b = Magnitud

# text
# c1: docs/TELECOM-TIMING.md
seg-62b6e83a9145 = Fuente: <c1/>

# text
seg-95222c3659cd = Temporización de telecomunicaciones: máscaras, fuentes y preajustes

# text
# c1: telecom-timing
# c2: src/telecom_timing.rs
# c3: scenarios/telecom-prtc-holdover-24h.toml
# c4: scenarios/telecom-synce-eec.toml
# c5: scenarios/telecom-tie-ingest.toml
seg-5a604e063370 = Esta página enumera cada límite que comprueba el tipo de escenario <c1/>, de dónde procede cada uno y qué se dejó fuera. El código es <c2/>. El escenario de referencia es <c3/>, el de sincronización de frecuencia es <c4/> y el ejemplo de ingesta es <c5/>.

# text
seg-f078828b2325 = <b>Abreviaturas.</b> ITU-T es el Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones. GNSS es el Sistema Global de Navegación por Satélite. TE es el error de tiempo, la diferencia entre la hora de un reloj y la hora de referencia. max|TE| es el mayor error de tiempo absoluto. MTIE es el error máximo de intervalo de tiempo: el mayor error de tiempo pico a pico dentro de cualquier ventana de observación de longitud τ (tau). TDEV es la desviación de tiempo, una medida de valor cuadrático medio de la deriva del tiempo para un tiempo de promediado τ. cTE es el error de tiempo constante (el desfase medio). dTE es el error de tiempo dinámico (la parte que varía). TE_L y dTE_L son el error de tiempo tras un filtro paso bajo de primer orden con un ancho de banda de { "0.1" } hercios (Hz); dTE_H es la parte por encima de ese filtro. TE_HO es el error de tiempo en holdover. PRTC es el reloj de tiempo de referencia primario. ePRTC es el PRTC mejorado. T-BC es el reloj de frontera de telecomunicaciones y T-TSC es el reloj esclavo de tiempo de telecomunicaciones. PTP es el Protocolo de Tiempo de Precisión. PPS es pulso por segundo. OCXO es el oscilador de cristal con control de horno. CSAC es el reloj atómico a escala de chip. CSV son valores separados por comas. ADEV es la desviación de Allan (σ_y), la medida estándar de la estabilidad de frecuencia. ns son nanosegundos y µs son microsegundos. ppb son partes por mil millones (una frecuencia fraccionaria de { "1e-9" }), y MHz es megahercio. Amd. es una enmienda de una Recomendación, y Y.1367 y similares son el número de la misma Recomendación en la serie Y de la ITU-T.

# text
# c1: allantools
seg-a7746845eb05 = <b>Qué es esto.</b> Los estimadores (MTIE y TDEV) se comprueban frente al paquete de terceros <c1/> y son VALIDATED en ese sentido. Las tablas de máscaras son transcripciones de las Recomendaciones que figuran más abajo. Un holdover sintético es un modelo construido a partir de cifras de hojas de datos públicas. El tipo es MODELLED en conjunto. No es una prueba de ajuste a la norma, y un PASS aquí no es un certificado.

# text
seg-e4adedc8e36d = Fuentes leídas

# text
seg-44f6d9a7906c = Todos los textos de la ITU-T se descargaron de itu.int el 2026-09-25. Se usó la edición más reciente que pudo leerse completa.

# text
seg-28d4cebb747f = Recomendación

# text
seg-ef3644f3af9c = Edición leída

# text
seg-82dcf7b71cdb = Estado en itu.int

# text
seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

# text
seg-f65ca7286466 = en vigor

# text
seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

# text
seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), una publicación de texto completo

# text
seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

# text
seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), texto completo

# text
seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

# text
seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), texto completo

# text
seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

# text
seg-63c64d128cc6 = 03/2020 y su Amd. { "1" } (08/2024)

# text
seg-66209db00349 = Existen dos enmiendas más recientes que no pudieron leerse: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) y G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Ambas están prepublicadas y restringidas a los miembros de la ITU (cuentas del Servicio de Intercambio de Información de Telecomunicaciones, TIES). Si modifican alguna cifra de las que figuran más abajo, esta página y el código todavía no lo reflejan.

# text
seg-25d639be3a1b = <b>Cómo se comprobaron las cifras.</b> La extracción de texto de estos archivos en formato de documento portátil (PDF) pierde la letra griega τ y el signo micro µ, de modo que "{ "0.275" } × { "10" }⁻³τ" sale como "{ "0.275" } × { "10" }⁻³". Por ello, cada fila de las Tablas { "1" } a { "4" } de G.8272, las Tablas { "1" } a { "5" } de G.8272.1, la Tabla { "1" } de G.8271 y la Tabla 7-1 de G.8271.1 se volvió a leer a partir de la imagen de la página renderizada. Las Tablas 7-1 a 7-5 de G.8273.2 y las Tablas 7-2 y 7-3 de G.8271.1 se leyeron a partir de texto extraído en el que τ se conservó. Cuando una tabla implica continuidad en un punto de quiebre, una prueba unitaria la comprueba.

# text
seg-33b5f44c513b = Límites implementados

# text
seg-3ce6da7e3e99 = τ está en segundos. Un intervalo escrito "{ "0.1" } < τ ≤ { "273" }" es abierto en { "0.1" } s y cerrado en { "273" } s, exactamente como en la tabla, y el código mantiene cada extremo del mismo modo.

# text
seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A y PRTC-B, modo bloqueado

# text
seg-c54e45baa463 = max|TE|

# text
seg-25887373a479 = { "40" } ns

# text
seg-0e18047889c1 = cláusula { "6.1" }

# text
seg-4ce06948bf3f = MTIE (cláusula { "6.2" }):

# text
seg-f1e336517976 = Máscara

# text
seg-7c40080fe799 = Intervalo

# text
seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

# text
seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

# text
seg-a2ae8d8ad68a = Tabla { "1" }

# text
seg-d1b301281575 = { "0.10" } µs

# text
seg-22afd1138a6a = τ > { "273" }

# text
seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

# text
seg-95049bb8aaa1 = Tabla { "2" }

# text
seg-f2562bdf8fd5 = { "0.04" } µs

# text
seg-72ef2a66af58 = τ > { "54.5" }

# text
seg-d18148049b1e = TDEV (cláusula { "6.2" }):

# text
seg-f492a7e39046 = { "3" } ns

# text
seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

# text
seg-7334c58cd44b = Tabla { "3" }

# text
seg-3bf4d8b009d5 = { "0.03" } τ ns

# text
seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

# text
seg-02bacda97914 = { "30" } ns

# text
seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

# text
seg-1c0341aaa919 = { "1" } ns

# text
seg-70c7899bf805 = Tabla { "4" }

# text
seg-8ec1f8c65e4f = { "0.01" } τ ns

# text
seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

# text
seg-2851f795541f = { "5" } ns

# text
seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

# text
seg-9b8478f86b44 = La cláusula { "6.2" } establece además que el período mínimo de medición para TDEV es doce veces el período de integración (T = 12τ). El tipo aplica esa regla a cada TDEV que informa, de modo que TDEV solo se da para τ hasta una doceava parte del registro. G.8272 no establece ningún requisito de holdover para un PRTC.

# text
seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

# text
seg-42c76f7b90ac = Modo bloqueado:

# text
seg-160dced77932 = { "4" } ns

# text
seg-88e8948869fc = { "0.1" } < τ ≤ { "1" }

# text
seg-c89d5cf52ad3 = { "0.11114" } τ + { "3.89" } ns

# text
seg-fad294d3be39 = { "1" } < τ ≤ { "100" }

# text
seg-e18d635df164 = { "0.0375" } × { "10" }⁻³ τ + { "15" } ns

# text
seg-273d60d5cd4a = { "100" } < τ ≤ { "400 000" }

# text
seg-4d971fea7954 = τ > { "400 000" }

# text
seg-4e9052bb688f = { "0.1" } < τ ≤ { "30 000" }

# text
seg-2401257610c6 = { "3.33333" } × { "10" }⁻⁵ τ ns

# text
seg-560ef6f53bf7 = { "30 000" } < τ ≤ { "300 000" }

# text
seg-727399dbf061 = { "10" } ns

# text
seg-3f5b5d8a1ea9 = { "300 000" } < τ < { "1 000 000" }

# text
seg-ca9cb946c8f4 = Holdover de ePRTC-A, error de tiempo (cláusula { "8.2.1" }, Tabla { "3" }). L es el tiempo que el ePRTC estuvo bloqueado antes de la pérdida, en días, y t es el tiempo transcurrido desde el inicio del holdover, en segundos. El límite crece linealmente de { "30" } ns a { "100" } ns a lo largo del período de holdover H.

# text
seg-fa700160348e = Duración de bloqueo L

# text
seg-61f9dec111cb = Período de holdover H

# text
seg-f6a6df18839c = Límite de |Δx(t)|

# text
seg-9229068d7534 = L < { "6" } días

# text
seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } días)

# text
seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

# text
seg-1af75c2d666f = { "6" } días ≤ L ≤ { "40" } días

# text
seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

# text
seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

# text
seg-71a6238f1e29 = L > { "40" } días

# text
seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } días)

# text
seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

# text
seg-3262966b5eab = Holdover de ePRTC-A, deriva (cláusula { "8.2.2" }):

# text
seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

# text
seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

# text
seg-a4a813c38ef6 = Tabla { "5" }

# text
seg-5d56fb7889b2 = La cláusula { "8.3.1" } fija el error de tiempo máximo de holdover por defecto, max|TE_HO|, en { "100" } ns. El tipo lo usa como presupuesto por defecto de tiempo hasta superación.

# text
seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC y T-TSC

# text
seg-96b5072f792f = Clase A

# text
seg-7737bc0444b1 = Clase B

# text
seg-cd92242017a8 = Clase C

# text
seg-0689443dfc12 = Clase D

# text
seg-54163aca5d46 = max|TE| (sin filtrar)

# text
seg-b36412e1acfb = { "70" } ns

# text
seg-ed79e6cdac25 = pendiente de estudio

# text
seg-5c2985d408e3 = Tabla 7-1

# text
seg-067c7c90c1e1 = max|TE_L| (paso bajo de { "0.1" } Hz)

# text
seg-1c5ac746d16b = Tabla 7-2

# text
seg-9802166ed2e2 = Rango de cTE

# text
seg-b94484db77ab = ±{ "50" } ns

# text
seg-17d4f5817950 = ±{ "20" } ns

# text
seg-1399281b7ce6 = ±{ "10" } ns

# text
seg-a694039549c8 = Tabla 7-3

# text
seg-d8799ba27fc3 = MTIE de dTE_L, temperatura constante

# text
seg-c332ee79beaf = Tabla 7-4, m ≤ τ ≤ { "1 000" }

# text
seg-2bd284168318 = TDEV de dTE_L, temperatura constante

# text
seg-8358cf8c4e50 = { "2" } ns

# text
seg-6a1cc65603b3 = Tabla 7-5

# text
seg-de739a499521 = En la Tabla 7-5, las clases A y B se escriben m < τ ≤ { "1 000" } y la clase C se escribe m ≤ τ ≤ { "1 000" }. m es 1/16 s para un flujo PTP de { "16" } paquetes por segundo y { "1" } s para una salida de { "1" } PPS. El tipo trata la entrada como un error de intervalo de tiempo de { "1" } PPS, de modo que m = { "1" } s. La Nota { "1" } de la Tabla 7-3 dice que cTE se estima promediando el error de tiempo durante { "1 000" } s. El tipo informa de la peor media absoluta de bloques consecutivos de { "1 000" } s.

# text
seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): límites de red en el punto de referencia C

# text
seg-8c2b01661011 = Los tres son el caso de despliegue { "1" } y se aplican tras un filtro paso bajo de primer orden de { "0.1" } Hz.

# text
seg-b3f93a59a8eb = Cláusula

# text
seg-23e44eab6e8b = max|TE_L|

# text
seg-cb1a66f62f8e = Límite de MTIE

# text
seg-4aa99615d914 = { "7.3.1" } (aplicaciones de clase { "4" })

# text
seg-eacfcd0a9ea5 = { "1 100" } ns

# text
seg-dc2351580120 = { "100" } + { "75" } τ ns

# text
seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

# text
seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

# text
seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

# text
seg-884708f2736f = { "580" } ns

# text
seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

# text
seg-17c12885b0d1 = { "7.3.2" } (red mejorada)

# text
seg-fcd7cb03855f = { "600" } ns

# text
seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

# text
seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

# text
seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

# text
seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

# text
seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

# text
seg-f7fda527feed = { "200" } ns

# text
seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

# text
seg-1f0b651381ea = { "7.3.3" } (PRTC en la red de acceso)

# text
seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

# text
seg-3aacef0066a0 = { "1" } < τ < { "400" }

# text
seg-f34cbd5ce7e4 = { "44" } ns

# text
seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

# text
seg-b0987b4e2e07 = La Tabla 7-3 deja sin límite el propio valor τ = { "400" } s (una fila termina en "< { "400" }" y la siguiente empieza en "{ "400" } <"). El tipo no informa ningún límite ahí en lugar de elegir uno. El punto de referencia A (cláusula { "7.1" }) toma sus límites de G.8272, de modo que las máscaras de PRTC anteriores lo cubren.

# text
seg-915182a7500e = Sincronización de frecuencia: generación de deriva de G.811, G.812, G.8262 y G.8262.1 ({ "0.36" })

# text
# c1: scenarios/telecom-synce-eec.toml
seg-fb1342b76953 = Siete máscaras, cada una el límite de generación de deriva de MTIE y TDEV a temperatura constante (dentro de ±{ "1" } K), definido mediante el filtro de medición paso bajo de primer orden de { "10" } Hz equivalente que indican las cláusulas. Ese filtro actúa antes del muestreo, de modo que el tipo toma el registro como ya medido a través de él y no aplica nada. La máscara de PRC es para un reloj autónomo (G.810 Figura 2a, configuración de reloj independiente); las demás son límites de modo bloqueado para un reloj sincronizado con una referencia sin deriva. El escenario de referencia es <c1/>: un OCXO en funcionamiento libre frente a las tres máscaras de EEC, lo que sobrestima la contribución del oscilador en intervalos de observación largos frente a la constante de tiempo de cualquier lazo.

# text
seg-3faf039b0ed9 = MTIE (ns)

# text
seg-ca33cbe4fd07 = TDEV (ns)

# text
seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

# text
seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

# text
seg-cb38d6327e5c = G.811 (09/1997) cláusula { "6.1" }

# text
seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

# text
seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

# text
seg-5e048893f25e = G.812 (06/2004) Tablas { "3" } y { "6" }

# text
seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

# text
seg-ae92888ca436 = G.812 (06/2004) Tablas { "4" } y { "7" }

# text
seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-8e825000b58e = G.8262 (10/2024) Tablas { "1" } y { "3" }

# text
seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

# text
seg-9ef5ff04e1d4 = como la Tabla { "7" } de G.812, cerrada en { "10 000" } s

# text
seg-3ecb8d9128d0 = G.8262 (10/2024) Tablas { "4" } y { "5" }

# text
seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-47d0f50aa906 = G.8262.1 (11/2025) Tablas { "1" } y { "3" }

# text
seg-45e4ed8fa6ea = Cada fila se comprobó frente al texto descargado de itu.int el 2026-10-13: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) y G.811 (09/1997). G.812 (06/2004) figura como sustituida por una edición prepublicada de 08/2026, y G.811 tiene una Amd. { "1" } (04/2016); ninguna de las dos pudo descargarse, de modo que, si modifican alguna cifra de las anteriores, esta página y el código no lo reflejan. Cuando los coeficientes impresos hacen discontinuo un punto de quiebre (por ejemplo { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns frente a la meseta de { "100" } ns de la Tabla { "4" } de G.812), las tablas se mantienen tal como están impresas y las pruebas unitarias acotan el salto. No implementado: las tolerancias de temperatura variable (Tabla { "5" } de G.812, Tabla { "2" } de G.8262, Tabla { "2" } de G.8262.1), los requisitos de holdover y de transitorios, el jitter y la exactitud de frecuencia de G.811 de la cláusula { "5" }.

# text
seg-4f6666854cf7 = Presupuestos (tiempo hasta superación)

# text
seg-1f3322a94bbb = max|TE_HO| por defecto de ePRTC

# text
seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) cláusula { "8.3.1" }

# text
seg-0d5433d85c88 = Asignación de holdover de red, interrupción corta de GNSS

# text
seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Tabla V.1, escenario de fallo (b), "re-arrangements and holdover in the network". Una asignación de ejemplo, no un requisito.

# text
seg-afe6c9903ada = Límite de red en el punto de referencia C

# text
seg-0c261b05c3cf = G.8271.1 cláusula { "7.3.1" }. Es una magnitud filtrada; como presupuesto se compara sin filtrar.

# text
seg-4b5a9718d008 = Aplicación final, clase de exactitud { "4" }

# text
seg-2a38e45e7008 = { "1.5" } µs

# text
seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) Tabla { "1" }, clase { "4" }

# text
seg-ded846b5a4bc = <b>La cifra clásica de "{ "1.5" } µs de extremo a extremo".</b> Es el requisito de error de tiempo de la clase { "4" } de la Tabla { "1" } de G.8271, expresado frente a una referencia común en la aplicación final. La Tabla V.1 de G.8271.1 muestra cómo una red puede asignarlo en funcionamiento normal: { "100" } ns para el PRTC/gran maestro de telecomunicaciones, { "200" } ns para el error de tiempo dinámico de la cadena, un error de tiempo constante para los relojes y enlaces, { "1 100" } ns en total en el punto de referencia C, y luego { "250" } ns para reorganizaciones y holdover corto en la aplicación final y { "150" } ns para el ruido propio de la aplicación final, { "1 500" } ns en el punto de referencia E. El escenario de fallo (c) de la misma tabla, "long holdover periods, e.g., { "1" } day", da { "3 350" } ns en C y { "3 500" } ns en E (su Nota { "5" } dice que superar { "1 500" } ns puede degradar el servicio). Así pues, ninguna de las dos Recomendaciones establece un requisito de "{ "1.5" } µs durante { "24" } horas de holdover", y el tipo no implementa ninguno.

# text
seg-76cab595673a = No confirmado o no implementado

# text
seg-175c282ddce2 = Nada de lo que sigue está implementado como máscara. Nada de ello se completó por estimación.

# text
seg-3c74e4ba9579 = <b>Marcado como "for further study" en las Recomendaciones:</b> max|TE|, cTE, MTIE y TDEV de dTE_L, dTE_H y holdover de la clase D de G.8273.2; holdover de ePRTC-B (cláusula { "8.2.1" } de G.8272.1); MTIE y TDEV de holdover de ePRTC-A más allá de { "10 000" } s (Nota { "1" } de la Tabla { "4" }, Nota { "2" } de la Tabla { "5" }); discontinuidad de fase de ePRTC (cláusula { "7" }); holdover de fase/tiempo de T-BC/T-TSC con pérdida tanto de la entrada PTP como de las de capa física (cláusula { "7.4.2.1" } de G.8273.2); el límite de red de TDEV en el punto de referencia C (cláusulas { "7.3.1" } a { "7.3.3" } de G.8271.1); límites de red para el caso de despliegue { "2" } en el punto C.

# text
seg-93c60d44788e = <b>Transcrito pero no implementado en esta versión:</b> Tabla 7-6 de G.8273.2 (MTIE con temperatura variable: { "40" } / { "40" } / { "10" } ns hasta { "10 000" } s), Tabla 7-7 (dTE_H pico a pico: { "70" } / { "70" } / { "30" } ns, que necesita un filtro paso alto de { "0.1" } Hz), Tabla 7-10 (MTIE de holdover con asistencia de frecuencia de capa física), error de tiempo relativo (Tablas 7-8 y 7-9), y los límites de dTE_H de las cláusulas { "7.3.2" } ({ "50" } ns) y { "7.3.3" } ({ "70" } ns) de G.8271.1.

# text
seg-f5fcd3b0f8a5 = <b>No aplicado:</b> el filtro de media móvil de al menos { "100" } muestras que G.8272 y G.8272.1 indican para las interfaces PTP. La entrada se trata como un error de intervalo de tiempo de { "1" } PPS, que esas Recomendaciones miden sin filtro.

# text
seg-74fe057a4392 = <b>Ilegible:</b> las dos enmiendas restringidas de { "2026" } nombradas en "Fuentes leídas".

# text
seg-bd4ec59cc872 = <b>Rareza editorial:</b> en G.8272.1 Amd. { "1" } el encabezado de la Tabla { "3" } lleva una fila insertada "TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }" en marcado de enmienda, por encima de las columnas de error de tiempo. No se trata como parte de la envolvente del error de tiempo. El mismo TDEV de { "1" } ns es la Tabla { "5" } y se implementa allí.

# text
seg-511db1219de1 = El filtro de medición

# text
seg-5fc683308b31 = G.8273.2 y G.8271.1 definen sus límites filtrados mediante un filtro paso bajo de primer orden con un ancho de banda de { "0.1" } Hz. El tipo aplica el suavizador discreto y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), iniciado en la primera muestra. Es una aproximación de un equipo de ensayo, no una copia de ningún instrumento. Solo se aplica cuando el intervalo de muestreo Δt es de { "1" } s o menos. Un registro más grueso se informa como NOT-EVALUATED frente a una máscara filtrada, en lugar de filtrarlo mal.

# text
seg-218e5ad620af = Preajustes de osciladores (MODELLED)

# text
seg-28bb7b8ad89f = Cada cifra es la propia de la hoja de datos, leída el 2026-09-25.

# text
seg-b4207b682560 = Dispositivo y documento

# text
seg-13f9ba96c063 = Máximos de ADEV usados (τ: σ_y)

# text
seg-d719167df981 = Envejecimiento

# text
seg-f30740907f6a = Temperatura

# text
seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; hoja de datos Rev 12-1-2021

# text
seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

# text
seg-85f8b8fbbae6 = ±{ "0.15" } ppb/día tras { "72" } h (f ≤ { "10" } MHz)

# text
seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C a +{ "70" } °C, referido a +{ "25" } °C

# text
seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, rendimiento estándar; DS00003047A (2/20)

# text
seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

# text
seg-ae0f630aba4b = <5e-11/mes tras { "30" } días

# text
seg-dbb2a780ceb9 = coeficiente de temperatura <{ "3E-10" }, { "0" } °C a { "50" } °C

# text
seg-79d5b7a3a453 = Microchip 5071A, tubo de alto rendimiento; DS00002980D (5/25)

# text
seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } días: { "1.0e-14" }; { "30" } días: { "1.0e-14" }

# text
seg-1fbdd6edc376 = no se publica ninguna tasa; variación a lo largo de la vida útil ≤{ "5.0e-14" }

# text
seg-bb485faf403a = ±{ "8.0e-14" } frente al entorno ({ "0" } °C a { "50" } °C, humedad, campo magnético, golpes)

# text
seg-889f4dc6cafc = Microchip SA.45s CSAC, opciones { "001" } y { "003" }; DS00002985D (5/23)

# text
seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

# text
seg-c90e2f590297 = <9e-10/mes tras { "30" } días

# text
seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C a { "70" } °C

# text
seg-63ba00e95bbc = Enlaces a los documentos: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

# text
seg-31ad29d092ee = Omitido a propósito: la fila de { "10" } s del 8040C, que la hoja de datos imprime como "<{ "1.0" } x { "10" }^{ "11" }" (un exponente mal impreso), y las filas del 5071A por debajo de { "1" } s. El OX-049 se consideró para el OCXO y no se usó, porque su fila de envejecimiento no puede leerse sin ambigüedad en su tabla desalineada.

# text
seg-8d4a915bc7fc = <b>Cómo las cifras se convierten en un modelo.</b> Son decisiones de este motor, y cada una se informa en la salida de la ejecución:

# text
seg-f1e6ea28601c = <b>Ajuste del ruido.</b> Los niveles de ruido de frecuencia blanco, de parpadeo y de paseo aleatorio son un ajuste de mínimos cuadrados no negativos a los máximos de ADEV, y luego se escalan al alza hasta que el modelo queda en o por encima de cada punto. Las cifras de la hoja de datos son máximos, de modo que el modelo las envuelve.

# text
seg-0e5ab055094a = <b>Suelo de parpadeo.</b> El suelo nunca queda por debajo del ADEV en el τ más largo indicado. Una hoja de datos deja de enumerar donde su fabricante deja de prometer mejora, de modo que el modelo no deja que el reloj mejore más allá de ese punto. Esto solo puede empeorar un holdover.

# text
seg-ebefbd6f119b = <b>Envejecimiento.</b> Una cifra mensual se convierte a { "30" } días por mes y se aplica como una deriva lineal de frecuencia desde el instante de la pérdida. El preajuste de cesio no tiene envejecimiento.

# text
seg-bb08c7b5baf5 = <b>Temperatura.</b> El límite indicado se interpreta de forma lineal sobre la mitad del intervalo de funcionamiento (por ejemplo, ±{ "5e-10" } sobre −{ "10" } °C a { "70" } °C da { "1.25e-11" } por kelvin), y luego se excita con un perfil de temperatura sinusoidal cuya amplitud y período son entradas del escenario. Nada en una hoja de datos dice que la dependencia sea lineal; es una lectura del peor caso.

# text
seg-47a256757cfc = <b>Antes de la pérdida</b> el reloj está disciplinado y su error de tiempo es ruido blanco de fase con un valor de 1-sigma declarado.

# text
seg-3ef60b128bb7 = <b>Qué muestra el escenario de referencia.</b> Con las entradas confirmadas (rubidio, oscilación diaria de temperatura de ±{ "2" } K, { "24" } h de holdover tras { "1" } h bloqueado) el registro alcanza un mayor error de tiempo absoluto de { "603.2" } ns. Cruza el presupuesto de ePRTC de { "100" } ns { "8 206" } s después de la pérdida y la asignación de { "400" } ns tras { "25 713" } s, y permanece dentro de { "1 100" } ns y { "1.5" } µs durante todo el día. No satisface la envolvente de holdover de ePRTC-A { "3 627" } s después de la pérdida, lo cual es lo esperado: ese requisito supone una referencia de clase cesio. Solo el término de temperatura puede alcanzar { "660" } ns, de modo que con estas entradas importa más que el envejecimiento ({ "72" } ns al final del día).

# text
# c1: tests/telecom_timing_reference.rs
# c2: allantools
# c3: tests/fixtures/telecom_timing/holdover_te_series.csv
# c4: docs/VERIFICATION-MATRIX.md
seg-ba87d450423c = <c1/> comprueba el MTIE y el TDEV del tipo frente a <c2/> { "2024.06" } sobre <c3/>, una serie de holdover de CSAC de { "2" } 048 muestras con envejecimiento, parpadeo y temperatura. Con { "17" } factores de promediado de MTIE y { "12" } de TDEV, MTIE coincide exactamente y TDEV coincide con una diferencia relativa de { "1.1e-15" }. Las mismas curvas se leen de nuevo a partir de una ejecución completa que ingiere el CSV. Esto valida los estimadores en ese registro. No valida el holdover sintético, las máscaras ni los preajustes, que son filas MODELLED en <c4/>.

# text
seg-6fdc3cc32a2f = <s1>Anterior</s1>Temporización de ranuras

# text
seg-1108b114de88 = <s1>Siguiente</s1>Tiempo engañado
